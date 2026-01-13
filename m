Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9244D29DE0
	for <linux-i3c@archiver.kernel.org>; Tue, 13 Jan 2026 07:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BvOKDTxwRZ9neHfcoTvJQ3rb8mDjtcHGZhjDFVkQezc=; b=PzCSEbcuJvbFka
	x/jcy6yMrvVaZ4jTmSYTMvNWYvMWv9oGxkRqwFPJ7KH+24ERl1ZMTn/DMSnm9E1j+mjTx3q09ocst
	984X+/yBo8wInYCPUZYgjbUpV0shyiouoDlGUVw5EUcD7YWqQrjrMnkbimIjGXrhxHkfp1kPjiJS2
	8xc+Tq14r04Co0Rqclg0dXRsMZ18bTDlMMOaY1B5+NwFlgjbrD9N76L77+g/wUdtc3Aj/HBiNuy7D
	fqrkwjLDo8cjNIJJCbL1UGPxSI/vAK5rX3ohCM8+fMayi7rCs16e+fZ0D13heMBYsixwG03OLNSrI
	bKWYYwxoTOnHyAJJpKcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfYoN-00000006eTJ-2uVZ;
	Tue, 13 Jan 2026 07:27:31 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfYoL-00000006ePX-2oEg
	for linux-i3c@lists.infradead.org;
	Tue, 13 Jan 2026 07:27:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768289250; x=1799825250;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yin8eViTQcmQwsxkBu4ZQkl/Swcv95BKZD2+qjXtpG0=;
  b=PhkwjAUF5oZP7hHblWdZh5ClrAO6OIH/VKAZKuAopsr32qaeBsIjpchl
   G6It7tJFNmmnVkl/2c3PvI0p4KwmbLsm76ZrW37KOmrpjT2Kge5zS/LXk
   9Ohv4HzmgQgJOfd0QLGLcGwPyS3EFHkXLFF2mkiaih8Pr5jWBRxL9HwCk
   ADdy9vBqIxiIjCCFl5Bqxi+Py3r3isrFaTPLm7dl9Ss+4P0VgXTipG0xg
   28CjZN98CIe+jY0ziWcvp3f/gxZ0zD3gUVUOyAd2sHJE+8M/gPCg4OJKb
   a8j2zshr5bsJVJhQGsK35NNVqc5tyEbdNBZ9HRRJQ267c4EGW0IuLFWYy
   w==;
X-CSE-ConnectionGUID: Vag4zGv6TpKKHGDggMfF9Q==
X-CSE-MsgGUID: BvTRwiQjTkO36tBFvrgEEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69625445"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69625445"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 23:27:30 -0800
X-CSE-ConnectionGUID: Y5/17BDOSQeoHiB4lk3isQ==
X-CSE-MsgGUID: 5zNKs0i2Tx2u77cqz4JElw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="235021219"
Received: from amilburn-desk.amilburn-desk (HELO ahunter6-desk) ([10.245.245.167])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 23:27:28 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH V3 05/21] i3c: mipi-i3c-hci: Switch DAT bitmap allocation to devm_bitmap_zalloc()
Date: Tue, 13 Jan 2026 09:26:46 +0200
Message-ID: <20260113072702.16268-6-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260113072702.16268-1-adrian.hunter@intel.com>
References: <20260113072702.16268-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_232729_759451_C67EE99A 
X-CRM114-Status: GOOD (  12.00  )
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

The driver already uses managed resources, so convert the Device Address
Table (DAT) bitmap allocation to use devm_bitmap_zalloc().  Remove the
manual cleanup routine.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	None

Changes in V2:

	Add Frank's Rev'd-by


 drivers/i3c/master/mipi-i3c-hci/core.c   |  2 --
 drivers/i3c/master/mipi-i3c-hci/dat.h    |  1 -
 drivers/i3c/master/mipi-i3c-hci/dat_v1.c | 11 +++--------
 3 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 0d3ec674878d..c4b249fde764 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -185,8 +185,6 @@ static void i3c_hci_bus_cleanup(struct i3c_master_controller *m)
 
 	i3c_hci_bus_disable(hci);
 	hci->io->cleanup(hci);
-	if (hci->cmd == &mipi_i3c_hci_cmd_v1)
-		mipi_i3c_hci_dat_v1.cleanup(hci);
 }
 
 void mipi_i3c_hci_resume(struct i3c_hci *hci)
diff --git a/drivers/i3c/master/mipi-i3c-hci/dat.h b/drivers/i3c/master/mipi-i3c-hci/dat.h
index 1f0f345c3daf..5277c65fc601 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dat.h
+++ b/drivers/i3c/master/mipi-i3c-hci/dat.h
@@ -17,7 +17,6 @@
 
 struct hci_dat_ops {
 	int (*init)(struct i3c_hci *hci);
-	void (*cleanup)(struct i3c_hci *hci);
 	int (*alloc_entry)(struct i3c_hci *hci);
 	void (*free_entry)(struct i3c_hci *hci, unsigned int dat_idx);
 	void (*set_dynamic_addr)(struct i3c_hci *hci, unsigned int dat_idx, u8 addr);
diff --git a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
index cc5d2deb23ab..c60ef5d77ca3 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
@@ -55,8 +55,10 @@ static int hci_dat_v1_init(struct i3c_hci *hci)
 	}
 
 	if (!hci->DAT_data) {
+		struct device *dev = hci->master.dev.parent;
+
 		/* use a bitmap for faster free slot search */
-		hci->DAT_data = bitmap_zalloc(hci->DAT_entries, GFP_KERNEL);
+		hci->DAT_data = devm_bitmap_zalloc(dev, hci->DAT_entries, GFP_KERNEL);
 		if (!hci->DAT_data)
 			return -ENOMEM;
 
@@ -70,12 +72,6 @@ static int hci_dat_v1_init(struct i3c_hci *hci)
 	return 0;
 }
 
-static void hci_dat_v1_cleanup(struct i3c_hci *hci)
-{
-	bitmap_free(hci->DAT_data);
-	hci->DAT_data = NULL;
-}
-
 static int hci_dat_v1_alloc_entry(struct i3c_hci *hci)
 {
 	unsigned int dat_idx;
@@ -170,7 +166,6 @@ static int hci_dat_v1_get_index(struct i3c_hci *hci, u8 dev_addr)
 
 const struct hci_dat_ops mipi_i3c_hci_dat_v1 = {
 	.init			= hci_dat_v1_init,
-	.cleanup		= hci_dat_v1_cleanup,
 	.alloc_entry		= hci_dat_v1_alloc_entry,
 	.free_entry		= hci_dat_v1_free_entry,
 	.set_dynamic_addr	= hci_dat_v1_set_dynamic_addr,
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
