Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B562D29DE0
	for <linux-i3c@archiver.kernel.org>; Tue, 13 Jan 2026 07:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KMkJVPYRTcHsN/BfD8Az2B1ebATDiFmO32OMdvcCeas=; b=0Nk4FXFEfF7txt
	RliXC7d46zU4AN3OS74NKPfG5ZZ2N7Iq6xqTzttEGuqkiEq00ufFhTHViGl40yNQHMPAykiRDmyfn
	uKTlbyygMq/fqeo5oEf1TWpJulmhuIdjHYW1T9UvMGizHAKi/HIQ553eo33M1flM6Vq5B8jdN7U6L
	1DG4Lo1GxT/JNqwNzB5Nl+CHnC7+1gz8j6XzQxuNFtUFrBn2EJbY2dRMYvF7x1loov5cfyPT84/7i
	JEatzA7uN3FdeziPDgsdT5soqxQLQ6yhi5NLNur/IpWbBE0wm/D3TN6zknH+vvteJGtjdzTb+u6ah
	A0YgkzugRdA4cKHkk8Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfYoW-00000006eYC-0PTI;
	Tue, 13 Jan 2026 07:27:40 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfYoR-00000006eSy-2sAB
	for linux-i3c@lists.infradead.org;
	Tue, 13 Jan 2026 07:27:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768289256; x=1799825256;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=R5zP6qwRuUSEokBZ5gnjmLPy9vPYiT2KAgC0dBFyeHM=;
  b=Kg1aNGPLwYaeXmtipPtKu/OaZfWMVd0Hn4Ct1mpe1dpYWlaE6yVyLq8A
   zn+acap8T4DblcPcvl5uNy0WX9cwNGBG/yOp/EKoIu0xo4Hk2CW6aOjcJ
   cWyGdzHQPZvi1CS0E42GJTcMHlZVNblxh6LsU2bJH9k3Lnx3uQNY51EFj
   cQuKNoxkrFZ2Yy5iPKL6ydJa6Zdwvw/RtIghGOrb7rkowfNxdvJOMuvot
   dYBIegBeBWvMie+LG89ainUm9L++Oy/rwS2Bfsc28yksRkmHc6uHetIs3
   6pyYVTxnjAq7Y0iHB/CW4/EcH/jNU9wXS1Y4qYHeuTJSvRf7rcQcGeYG6
   A==;
X-CSE-ConnectionGUID: sLTeZT3JQcWgbRi/qNZQ0g==
X-CSE-MsgGUID: A5yMJ7FwTu+iPW7PBZTONA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69625469"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69625469"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 23:27:36 -0800
X-CSE-ConnectionGUID: qq3t2D59QlykNvySDPNKpA==
X-CSE-MsgGUID: YZ7vu1m8StaPFksrgkzcQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="235021258"
Received: from amilburn-desk.amilburn-desk (HELO ahunter6-desk) ([10.245.245.167])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 23:27:34 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH V3 08/21] i3c: mipi-i3c-hci: Cache DAT in memory for Runtime PM restore
Date: Tue, 13 Jan 2026 09:26:49 +0200
Message-ID: <20260113072702.16268-9-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260113072702.16268-1-adrian.hunter@intel.com>
References: <20260113072702.16268-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_232735_759571_5DA36C93 
X-CRM114-Status: GOOD (  13.60  )
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

Prepare for Runtime PM support, which requires restoring the Device Address
Table (DAT) registers after resume.  Maintain a copy of DAT in memory so it
can be reprogrammed when the controller is powered back up.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	None

Changes in V2:

	Add Frank's Rev'd-by


 drivers/i3c/master/mipi-i3c-hci/dat_v1.c | 29 +++++++++++++++++++-----
 drivers/i3c/master/mipi-i3c-hci/hci.h    |  6 +++++
 2 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
index c60ef5d77ca3..644ab939be1c 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
@@ -34,13 +34,26 @@
 /*	DAT_0_IBI_PAYLOAD		W0_BIT_(12) */
 #define DAT_0_STATIC_ADDRESS		W0_MASK(6, 0)
 
-#define dat_w0_read(i)		readl(hci->DAT_regs + (i) * 8)
-#define dat_w1_read(i)		readl(hci->DAT_regs + (i) * 8 + 4)
-#define dat_w0_write(i, v)	writel(v, hci->DAT_regs + (i) * 8)
-#define dat_w1_write(i, v)	writel(v, hci->DAT_regs + (i) * 8 + 4)
+#define dat_w0_read(i)		hci->DAT[i].w0
+#define dat_w1_read(i)		hci->DAT[i].w1
+#define dat_w0_write(i, v)	hci_dat_w0_write(hci, i, v)
+#define dat_w1_write(i, v)	hci_dat_w1_write(hci, i, v)
+
+static inline void hci_dat_w0_write(struct i3c_hci *hci, int i, u32 v)
+{
+	hci->DAT[i].w0 = v;
+	writel(v, hci->DAT_regs + i * 8);
+}
+
+static inline void hci_dat_w1_write(struct i3c_hci *hci, int i, u32 v)
+{
+	hci->DAT[i].w1 = v;
+	writel(v, hci->DAT_regs + i * 8 + 4);
+}
 
 static int hci_dat_v1_init(struct i3c_hci *hci)
 {
+	struct device *dev = hci->master.dev.parent;
 	unsigned int dat_idx;
 
 	if (!hci->DAT_regs) {
@@ -54,9 +67,13 @@ static int hci_dat_v1_init(struct i3c_hci *hci)
 		return -EOPNOTSUPP;
 	}
 
-	if (!hci->DAT_data) {
-		struct device *dev = hci->master.dev.parent;
+	if (!hci->DAT) {
+		hci->DAT = devm_kcalloc(dev, hci->DAT_entries, hci->DAT_entry_size, GFP_KERNEL);
+		if (!hci->DAT)
+			return -ENOMEM;
+	}
 
+	if (!hci->DAT_data) {
 		/* use a bitmap for faster free slot search */
 		hci->DAT_data = devm_bitmap_zalloc(dev, hci->DAT_entries, GFP_KERNEL);
 		if (!hci->DAT_data)
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index fd08b701d094..aa8a03594e64 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci.h
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -31,6 +31,11 @@
 
 struct hci_cmd_ops;
 
+struct dat_words {
+	u32 w0;
+	u32 w1;
+};
+
 /* Our main structure */
 struct i3c_hci {
 	struct i3c_master_controller master;
@@ -51,6 +56,7 @@ struct i3c_hci {
 	unsigned int DAT_entries;
 	unsigned int DAT_entry_size;
 	void *DAT_data;
+	struct dat_words *DAT;
 	unsigned int DCT_entries;
 	unsigned int DCT_entry_size;
 	u8 version_major;
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
