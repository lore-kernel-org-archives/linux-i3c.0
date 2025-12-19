Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2EDAD78785
	for <linux-i3c@archiver.kernel.org>; Fri, 19 Dec 2025 14:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lm4fEjn3GGEnoWSsJksW9QIqy3yGWeh/5MfJ15DhD2g=; b=iywvo6RN0oaMw4
	3/fux2RWZlQt0PEEK3NIICkHtKdhQS/pO0pw/+rYn3aO7pxNLfjm6Av4yAHj8j/Nb4u+fijkgYDM4
	OuYhxMg3okc3hgaLgLxtjsSKS78Hks/MjzKTeMr7fspNwVTNMZn9AF57RWWI2ugzrUKbiIlqYdNhJ
	leyOV9tcxxvM/tAd/G2j5ClY9Z3DZcKKZm728G1eNFXpDT6PfoXgnSA1xsk7u4jBfFL9FoknOJZYs
	yfOdRTWwV62VVzZQyXIlBuek44hHsGzqIjCdLXpbX3P6qz8qxMixeVpJjYo4cf0AESxQK5Q5xxdYu
	07k+N3uDddb3CEw0lxsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbk4-0000000ARSy-2Es5;
	Fri, 19 Dec 2025 14:46:04 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbk0-0000000ARND-06Wu
	for linux-i3c@lists.infradead.org;
	Fri, 19 Dec 2025 14:46:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766155560; x=1797691560;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fbxtcse9t7Fhv7Q2zIiLb+fqA46FdKYyQ71PxVl8SqA=;
  b=TxXb20Q9OIVW2UKCauWHrNNglY4ycvK7vDAwq10Q8c+TPkG5kh7VrE6D
   bd8lmc8pvv1Ee1QXl5VAYKwWI4xezBPaeriP/xUhIF9czb5bGhJlqJGZv
   LgJ0HwObjVlkaNUvV6apbptWk/6DaxeQevwSgTSsy8AQomgAcniqoA1K7
   dDS5yTddCGpDu3+5jzTWthtBSGAzdlseoI7XQcFgrMxYaR2uS2WrJD3qj
   fIhuN75KPCn2sfRKc7SZqRfl/2PajS4HdmZTi6qOYGcO2LXD1L3VSrBq9
   zcluuwv+dM1tqvE0VErTY/+oDsIeRSV7pl2KS96mR/hfMKLVkEIRG1LSM
   A==;
X-CSE-ConnectionGUID: AAUGR4c8SyOhAG8liVFEDg==
X-CSE-MsgGUID: Gv7/0CqqSGKMd9hJPS4xMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="93588934"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="93588934"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 06:46:00 -0800
X-CSE-ConnectionGUID: SiT1MU+CQJe5alD9kHiATA==
X-CSE-MsgGUID: Jxj/AqVoR/Gtx/bRyfGRRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="229563965"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.200])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 06:45:57 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH 05/17] i3c: mipi-i3c-hci: Switch DAT bitmap allocation to devm_bitmap_zalloc()
Date: Fri, 19 Dec 2025 16:45:22 +0200
Message-ID: <20251219144534.84391-6-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251219144534.84391-1-adrian.hunter@intel.com>
References: <20251219144534.84391-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_064600_076938_474F020D 
X-CRM114-Status: GOOD (  11.86  )
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
---
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
