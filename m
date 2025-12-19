Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C07D78783
	for <linux-i3c@archiver.kernel.org>; Fri, 19 Dec 2025 14:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Iqy8+in5YcOBOf2nsL/LatL8pojHIYOp76BSLkKKMOc=; b=c/DXNC8BuVOzF/
	f4nzoIPpoRfq9FotA2GfxznDKBm6QgsyYBLlil9oECq3W2bmD05xTQBm4yUsENOwqt33wT7vSWtuv
	Gfbafwi0iQHupf+vlJasTAK6ABG3f55XLGHFuQ0GqxsmLEUtThhKxq6QfX6JdKfaK8pfCy/JJEKgO
	RSvO3JpyW5g7srKknpQjy9NjF6Tdt9qIk6zKqaPpb85zjtYQT6zYiQBZMsVXqPCZLl+AKfyrOJhgk
	GauY1sgcWno9F3n8Y5wm5fIQQrOFp6+sfnJEqEvqhJm5LgUMGyZQ11Yv8ySWHJFO/foA6kx34/ejF
	jN4HkxSHqOMkrRo8JgNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbk4-0000000ARTN-3IEL;
	Fri, 19 Dec 2025 14:46:04 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbk2-0000000ARND-0fgZ
	for linux-i3c@lists.infradead.org;
	Fri, 19 Dec 2025 14:46:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766155562; x=1797691562;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EJE9DBxZzUUaKolnXXbb1fbGPRUMkLpo2MYyOClexeU=;
  b=FQ1FTEYhBHgRKFtJ6F4aPJKO00tlpRFM8hJRaiMQhHJaIcc5eqOQ399Q
   uQh0NZhkhIld8SPVD+5dbGOj/xfGrz2NrAc1zexAxz5tMF44ldBzLdp0u
   cC97enM26Y2ni+z2G+8n1QAcFsCbe19I87aSXbFXcm45u0XH2y72rxUuc
   5OxdcfGQ8dcFcKkhmPCQrokAraiFq7HUqNjIjH6JxFgMVO47ueKafleyv
   V9j1y2AHUgIZt5t0vbtdog88brYxdKmwV/ngvH8xLOZVcs4g73u9lBGNx
   62jQ5XITPWf9qbYWBS7+lPlrsEgy4qb6wgYGZLszkdo5Er+cbxxoUPOen
   g==;
X-CSE-ConnectionGUID: juueunb0SdqEmfMEs53sCQ==
X-CSE-MsgGUID: tlqO8qe9Qme6/t9da4A1Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="93588939"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="93588939"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 06:46:02 -0800
X-CSE-ConnectionGUID: J6BWB0ZgSe67osrzgd0uPA==
X-CSE-MsgGUID: 4e7/niIwQRmI6EK94Ck1Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="229563979"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.200])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 06:46:00 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH 06/17] i3c: mipi-i3c-hci: Switch PIO data allocation to devm_kzalloc()
Date: Fri, 19 Dec 2025 16:45:23 +0200
Message-ID: <20251219144534.84391-7-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251219144534.84391-1-adrian.hunter@intel.com>
References: <20251219144534.84391-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_064602_213184_635AB30A 
X-CRM114-Status: UNSURE (   8.12  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

The driver already uses managed resources, so convert the PIO data
structure allocation to use devm_zalloc().  Remove the manual kfree().

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/pio.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/pio.c b/drivers/i3c/master/mipi-i3c-hci/pio.c
index 90dca56fc0c5..3d633abf6099 100644
--- a/drivers/i3c/master/mipi-i3c-hci/pio.c
+++ b/drivers/i3c/master/mipi-i3c-hci/pio.c
@@ -140,7 +140,7 @@ static int hci_pio_init(struct i3c_hci *hci)
 	struct hci_pio_data *pio;
 	u32 val, size_val, rx_thresh, tx_thresh, ibi_val;
 
-	pio = kzalloc(sizeof(*pio), GFP_KERNEL);
+	pio = devm_kzalloc(hci->master.dev.parent, sizeof(*pio), GFP_KERNEL);
 	if (!pio)
 		return -ENOMEM;
 
@@ -220,8 +220,6 @@ static void hci_pio_cleanup(struct i3c_hci *hci)
 		BUG_ON(pio->curr_rx);
 		BUG_ON(pio->curr_tx);
 		BUG_ON(pio->curr_resp);
-		kfree(pio);
-		hci->io_data = NULL;
 	}
 }
 
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
