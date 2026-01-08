Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64582D148BE
	for <linux-i3c@archiver.kernel.org>; Thu,  8 Jan 2026 08:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8dxeVxdxQOikKHz1Td/vg3yGITO5g4i2lAmikcP4Cms=; b=Fd2VeFv8EjSSpo
	iBenoGo49b5JpBwNGPiz8/qgiMS8mgVoz8jsn1RcIvEpGGXVitLqivnrPuwC1szWHxW3+j+Sjv/Cf
	OkyKhy41eV2r/8ETCoadPs19j2lKXf9e0I6Pu4mzoMJoqsxlgsivcJFffKHGbecKRmtKhX5cZ3QFS
	U59/tv0lyeBP+gt8SCAcyaS7qJ2FmkRRkmqTjwOxPa0395UDXDRHF5CaMxeTOenwmrCXFsoQI2aRd
	S1wC32HYGDw48pz+KExlwS4CJh61Taq8kfalAZgz4D5rR/Jg6HSY6sokaOhnBOKHwS8K2ZdizOxwr
	FjWGCQ74IxWIzBBlsn/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdl2V-0000000GDHW-0ddk;
	Thu, 08 Jan 2026 08:06:39 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdl2T-0000000GDGR-1GUP
	for linux-i3c@lists.infradead.org;
	Thu, 08 Jan 2026 08:06:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767859597; x=1799395597;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cdqj8MUhIVy50DetlqHws6c4EdjaFuwyLG7plxic+S0=;
  b=Hu+9cB3uqM5p4lgM2h/7Ai/Oi/T6sqVPVYt4tyA8+m4rjJx7t5wz8MnR
   eCeoWX5h/knSKXZcig4PZZ07oEYSgOEJsEBL88TF09SOZTNbPvh/3e6e+
   ju0pszGk4nZ36QoL6ljSTiPCCWiaQhcNHcZvoqAipDFBq0hEiI3tzQR0f
   iSrudfgXkif/8T2NYHnJvGiW2scOBBoAcGXpDpUAekKXcjExVPuXPZaDy
   v9y022dH9zwD/hQJF+opGP1pUELSpGoueqmuuaYx1b0MdmFuahsC49/KY
   pGJa+YfGtZsHpovCGZoncKITDvpbePLTJc6l1rDRQBsq2CHsak67rrw2X
   w==;
X-CSE-ConnectionGUID: U6bkg9/yT+eiae7+4kKlPQ==
X-CSE-MsgGUID: SjRbKhivQMSBNMBWB3Y5aQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="56792328"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="56792328"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:06:37 -0800
X-CSE-ConnectionGUID: AaH2SqrySrmnzxvPn4lEHQ==
X-CSE-MsgGUID: meXnc0pjQuSYbJaGnDseJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="203413613"
Received: from abityuts-desk.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.195])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:06:35 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH V2 13/20] i3c: mipi-i3c-hci: Add PIO suspend and resume support
Date: Thu,  8 Jan 2026 10:05:51 +0200
Message-ID: <20260108080558.21767-14-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260108080558.21767-1-adrian.hunter@intel.com>
References: <20260108080558.21767-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_000637_420000_6A33D050 
X-CRM114-Status: UNSURE (   7.48  )
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

Introduce helper functions to suspend and resume PIO operations.  These
are required to prepare for upcoming Runtime PM support, ensuring that
PIO state is properly managed during power transitions.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V2:

	Add Frank's Rev'd-by


 drivers/i3c/master/mipi-i3c-hci/pio.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/pio.c b/drivers/i3c/master/mipi-i3c-hci/pio.c
index 52d9f01d9ca9..8e868e81acda 100644
--- a/drivers/i3c/master/mipi-i3c-hci/pio.c
+++ b/drivers/i3c/master/mipi-i3c-hci/pio.c
@@ -190,6 +190,18 @@ static void __hci_pio_init(struct i3c_hci *hci, u32 *size_val_ptr)
 	pio->enabled_irqs = STAT_ALL_ERRORS;
 }
 
+static void hci_pio_suspend(struct i3c_hci *hci)
+{
+	pio_reg_write(INTR_SIGNAL_ENABLE, 0);
+
+	i3c_hci_sync_irq_inactive(hci);
+}
+
+static void hci_pio_resume(struct i3c_hci *hci)
+{
+	__hci_pio_init(hci, NULL);
+}
+
 static int hci_pio_init(struct i3c_hci *hci)
 {
 	struct hci_pio_data *pio;
@@ -1059,4 +1071,6 @@ const struct hci_io_ops mipi_i3c_hci_pio = {
 	.request_ibi		= hci_pio_request_ibi,
 	.free_ibi		= hci_pio_free_ibi,
 	.recycle_ibi_slot	= hci_pio_recycle_ibi_slot,
+	.suspend		= hci_pio_suspend,
+	.resume			= hci_pio_resume,
 };
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
