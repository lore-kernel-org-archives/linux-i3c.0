Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F0C2D29DDE
	for <linux-i3c@archiver.kernel.org>; Tue, 13 Jan 2026 07:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mf9y/jsnh+yEdpQzaX8S3CZXdclDHUnaPEs+EnUml00=; b=UDis7U1CbEra6T
	1U3YHp/zpLODD9Rrm9l8QxRumWW1g1/U5YnkDwovX1cF/y+xXbyxQEAKCYJSM82bQ2Ogu/Jg6Nck3
	1rzuCqKEFDZd6FNvWos0gt7Y2U0VxqIA4dCmeFNR3f74uaEUohtxhoLxQBTDG/1/AEOjeJtxyBFLQ
	+5wyYLB/yN8AGxpUbThEsbjjeeY9ma/+HF3iWtgj6isHhNhc+KzNk5HRXKE9ILdFw/zvmRS93j1kA
	cmDRNQuEidrmdUWIoJb9SMtipdc1UaXqv44D97gnj5Kt1ATuZSg3QBox7/1RmsbN8Jat0E7V1jPJM
	guPYaMmviljl/0VFaLsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfYoP-00000006eUr-3wsR;
	Tue, 13 Jan 2026 07:27:33 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfYoN-00000006eSy-3PB8
	for linux-i3c@lists.infradead.org;
	Tue, 13 Jan 2026 07:27:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768289252; x=1799825252;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9wh0ScFOZFtdmE00TpGFExSt463odanICRpaYhFMxbs=;
  b=JaD99qWKQh5lB5d/euy7b13v6HskBbPLomUAdVv6hWEV6X8Q9yskxPDE
   T5NkhTFVKFUDzwpiOjLmPb0BysSqJyG3gqx3LvJHYHKDWXb+JAE6QR1+A
   tGj4B4/80W2qkenMZF3irWY6kqkR4oievzk0MeJU9bJVmDKdcQjcvBzVF
   O80ZdVgmpMvBtHuFn24vJGahv88QYXvV+MbFQFKeNXHnPkBfjsuz1RFrL
   VgtaUuVqrZpYlK7hpDT40/pT7O77kFRnWKghfa3SwJ7oS7uYFtCW7cOMD
   LcWxWyujW7o1H+X/hnIUh6eIWEtbbe4vD0LsofG3PoTPi4f+Y3wQTP23M
   w==;
X-CSE-ConnectionGUID: sqHcF2FeSUGORXxmj0Il9g==
X-CSE-MsgGUID: 6BAgpGroSq+VxcmHqKslWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69625454"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69625454"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 23:27:32 -0800
X-CSE-ConnectionGUID: rtez0j8fTMGMUzLAISodfg==
X-CSE-MsgGUID: 7psNueIWSXSY31RiC529WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="235021236"
Received: from amilburn-desk.amilburn-desk (HELO ahunter6-desk) ([10.245.245.167])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 23:27:30 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH V3 06/21] i3c: mipi-i3c-hci: Switch PIO data allocation to devm_kzalloc()
Date: Tue, 13 Jan 2026 09:26:47 +0200
Message-ID: <20260113072702.16268-7-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260113072702.16268-1-adrian.hunter@intel.com>
References: <20260113072702.16268-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_232731_894916_F95F0CEF 
X-CRM114-Status: UNSURE (   8.50  )
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
structure allocation to devm_zalloc().  Remove the manual kfree().

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	None

Changes in V2:

	Remove 'use' from commit message
	Add Frank's Rev'd-by


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
