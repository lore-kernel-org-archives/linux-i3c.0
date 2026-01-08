Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B911D148BE
	for <linux-i3c@archiver.kernel.org>; Thu,  8 Jan 2026 08:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PE0FGicZnlwoDdE5Q7nhSU6DwrTouajEdsq2OWjJrq0=; b=FdWbaZf2nHZsir
	kmGVyRnRyK/u3RxMNRjW7U9yeynHDJH0wL5HmM1YjiUVnfNV/U4DyVpjVC7nUgYrU3YFvsfVucWSL
	veYSqhBlV0YnI1TBlBw/caIaMBjz67jRT9LvkRVrZMq1z5VR6ZprKfRndbWFsBnu5VwThXj++Xftj
	RDhbOV3jWNUyXzkm3gFRtoM/xCTbLEFoGZlsg3gP6Vid2lHqg1SElmhxLFsnYrrnt8ioed5B2s+TN
	GnaHoH/l9veh3wXoZELfRhi6I7hyAWQnfBLJCD7d5Dh2f/j/eRLtgB7fT8KAeLeqf8reDGJSPGy1G
	9f6kKlF6mRYH6xpYmU7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdl28-0000000GD2K-3qMF;
	Thu, 08 Jan 2026 08:06:16 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdl25-0000000GCzw-0GTQ
	for linux-i3c@lists.infradead.org;
	Thu, 08 Jan 2026 08:06:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767859573; x=1799395573;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=waOZMu6mcs4CrnOgUn7ACKSU+i8zBLAXTkFPzqV8kgE=;
  b=KHqYskdlaQIIXMu6s/ijMRpG2dKtGQ0ZxoprI5t2PzZPNcDXtKTO3m5/
   mKZBXZIyIzy28XLbqzuxOIlj3xsuHP9IwFZ49c9N9V/K4sBSleDDIQsHO
   qodbsjpQGgcZcc6KjTQjL9BbHjk67/mdY0Nd8SZDZ86uLIaY9D8Uy4pxU
   RXoCs5jXEXWRRjDdQkZ1Dke0T6WHWH5oBw3/Zx19WK7VBu/nnaiCOqE6Z
   ofk3W4yRurlW+4oeyMQ9EE4WjdI4anL9SheRF1BeRhuzI75Fr831Vrwkn
   FZfHbApQsDSDe+tbs0YyZ3AUTGu00I7naGwpU6XOcjOR7JaCrAPQqKOPu
   w==;
X-CSE-ConnectionGUID: NQJOwzvoQlWpzjrUerslRg==
X-CSE-MsgGUID: 08OjbC+sSFqVvdh13/m04w==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="56792240"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="56792240"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:06:13 -0800
X-CSE-ConnectionGUID: e3RzPaRyQhuFPY2GQJekkg==
X-CSE-MsgGUID: GGcj/3MPQEmZ8vVFRhq23w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="203413560"
Received: from abityuts-desk.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.195])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:06:11 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH V2 01/20] i3c: mipi-i3c-hci: Reset RING_OPERATION1 fields during init
Date: Thu,  8 Jan 2026 10:05:39 +0200
Message-ID: <20260108080558.21767-2-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260108080558.21767-1-adrian.hunter@intel.com>
References: <20260108080558.21767-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_000613_111326_28CFB796 
X-CRM114-Status: UNSURE (   8.04  )
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

The MIPI I3C HCI specification does not define reset values for
RING_OPERATION1 fields, and some controllers (e.g., Intel) do not clear
them during a software reset.  Ensure the ring pointers are explicitly
set to zero during bus initialization to avoid inconsistent state.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V2:

	Add Frank's Rev'd-by


 drivers/i3c/master/mipi-i3c-hci/dma.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 0f6bbe184e85..5515ed740ca4 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -340,6 +340,14 @@ static int hci_dma_init(struct i3c_hci *hci)
 		rh_reg_write(INTR_SIGNAL_ENABLE, regval);
 
 ring_ready:
+		/*
+		 * The MIPI I3C HCI specification does not document reset values for
+		 * RING_OPERATION1 fields and some controllers (e.g. Intel controllers)
+		 * do not reset the values, so ensure the ring pointers are set to zero
+		 * here.
+		 */
+		rh_reg_write(RING_OPERATION1, 0);
+
 		rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE |
 					   RING_CTRL_RUN_STOP);
 	}
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
