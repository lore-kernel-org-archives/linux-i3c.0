Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D66D78787
	for <linux-i3c@archiver.kernel.org>; Fri, 19 Dec 2025 14:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6QActyYMD9eg7+bcSmoWZWvUhlaZnIvkWzos0ObL/Us=; b=4qL1anjMskw6+A
	IG2FQXthklNyddEtU/AH1j6dUgdJ3AcPUaPYGhXxJQTwvd357/FxUmGU70XWhknD1fRqKbpb3+Dfd
	XHYscOIl79FHKcGTJ4CBqTxjDlZmbT1I2MnpJ3aSzbW3fiEvB7WIoO+ggsni51PBnH6sM0yiumAnu
	1NaJ8L/hcYNvFq64HddlaqkNFtwZlHuQo6RikezvbWx4yeyqEtwWi1rnvxvbdCyLjE1BdwVAUvDZz
	5qqiNyxX8QA9gYi3cOff9C9wx3yANQEMjUJ/GVWCjQrOA6AqefxblKVMrLXnVUudci2zRj6t1kB5R
	a3CbNZ+kOUkR6phM5iYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbk9-0000000ARWc-2COl;
	Fri, 19 Dec 2025 14:46:09 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbk6-0000000ARND-2E5i
	for linux-i3c@lists.infradead.org;
	Fri, 19 Dec 2025 14:46:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766155566; x=1797691566;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x6/VWOBAmEenEJq6wgVMn5ATAj2YpzS6f2irIuEcl70=;
  b=dVwyFTGmdIiiqFIZroRdAXmhxYwivdVGSYSy9dKvjwvBkFg3YUn6FcEH
   uMuGASXpUQ3DnQafpj6+/+ANy6sbMOTarzhx/KTr//ap4CG+FB8SOjQOe
   u7/ccGJzkBZRqD8tbrij2z/xX3ug8/xYPpuCR5khFFQxM2C4qSEcMU3w7
   8tE3V1BtqTnBCuRAK83Fh37LYCTkIPdN2Xag1gLVDW3WXhgw+PezbIgkz
   Z0CS1uDHUCl903ZTY16/VJ+tNyu2QcfVY0ND7TEM7iOtRaDjBIoIYgaAB
   WEzS4Vf8YvtrC7PAPV1PVhZgMfXwjgaKY2Hj7z6VPL9DZzh1l1h7Xk5t2
   g==;
X-CSE-ConnectionGUID: WfNMd5lfS8elB3zo2LkyTA==
X-CSE-MsgGUID: 2NusNpKTQXmX2OAHrtNuMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="93588952"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="93588952"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 06:46:06 -0800
X-CSE-ConnectionGUID: T73YkvJJSEe1uidAJTLrtQ==
X-CSE-MsgGUID: 2k6TGjKNQgGSNO+zURY8gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="229564012"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.200])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 06:46:04 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH 08/17] i3c: mipi-i3c-hci: Cache DAT in memory for Runtime PM restore
Date: Fri, 19 Dec 2025 16:45:25 +0200
Message-ID: <20251219144534.84391-9-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251219144534.84391-1-adrian.hunter@intel.com>
References: <20251219144534.84391-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_064606_589650_111AFF25 
X-CRM114-Status: GOOD (  13.46  )
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
---
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
