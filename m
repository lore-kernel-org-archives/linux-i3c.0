Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F91C47BE1
	for <linux-i3c@archiver.kernel.org>; Tue,  6 Jan 2026 16:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M6cyOr+oR/sYtf5Ig+pMWRtVZUwJ8w8cQcYgqgEDl/w=; b=wZJSpROu0pFtpO
	Mxo0CDXK9+are+kUD/dRsNwOuvrEnJb+yYJ3J60KtYJVHUQ+eVPvtQltBabnspBmaHt2LdgpDM9l7
	17yYRD/EbtB8NyOKKr/I4DP+qT4ZElWrzHwMB4BsibZ2xJdR+FFTlvXVoENLccczycSyKI0gnpi1v
	jLo0SRSntW5iDzN66BwfYdPcVbcQdBiILCJ0QirL+L2neG4tr5fYlJqxnUJDsxz78yaPK61bLCZ49
	UzeyvvMyCUm8u54GbV8A/WUDZwY++lYdXu1cYhx8JxSqnAkaEUsbWzwXPMK7o1H2ZxXS4N+zruyQj
	xNwsDqWeNnjoasjP5jag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdAAo-0000000DWO2-0rit;
	Tue, 06 Jan 2026 16:44:46 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdAAl-0000000DWN8-1Y7O
	for linux-i3c@lists.infradead.org;
	Tue, 06 Jan 2026 16:44:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767717884; x=1799253884;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BIgY6u6kh9fiTwvD7mVryREOCCl0tcNEoyjaK+C329Q=;
  b=UF5W5Ka+LJnqaBiQ0yKzBp6aV2ybAlW4oSEB6ClWRP0kOHJ6kRt/eNfb
   9Lb0wkDdE9LofyCvfHhteUMSMUsHDEJjiBGzqaP+CtMRlkXJvaLbwliNG
   7iF2Xbtm85Gg603IqXUF8qmYXHlDD72hvxfWWNwdU4c8KHwLTsg5RazJ9
   hFnuTtW8WW9/tqFwn2hIMulGOWGmW2i5LZAzUxrbvChNfHvhkp6nbCPWS
   qJInHpjEj01+fNxkcMMu+j2xTKHoTC9cwvRi3L84eDJGNmze25k22e6sh
   PrxEQle9t+lqQQ5qZslRSGrfXQQEefySUCTnEe5mSZVkRhsPd9iemceHv
   w==;
X-CSE-ConnectionGUID: x4PnyaT8TuySqasiAPi7vQ==
X-CSE-MsgGUID: n+IuCtsBTlC3nNzqtEwuAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="91741815"
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="91741815"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 08:44:43 -0800
X-CSE-ConnectionGUID: FkFe+1s/SGuVF3jxiaq6dQ==
X-CSE-MsgGUID: ZAYHbAbdQEWqS3kutHvhtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="206838015"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.254])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 08:44:41 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V4 01/11] i3c: mipi-i3c-hci: Remove duplicate blank lines
Date: Tue,  6 Jan 2026 18:44:06 +0200
Message-ID: <20260106164416.67074-2-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260106164416.67074-1-adrian.hunter@intel.com>
References: <20260106164416.67074-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_084443_455335_D5E99175 
X-CRM114-Status: GOOD (  13.21  )
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

Remove duplicate blank lines from mipi-i3c-hci code.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3 and V4:

	None

Changes in V2:

	Add Frank's Rev'd-by


 drivers/i3c/master/mipi-i3c-hci/cmd_v1.c   | 2 --
 drivers/i3c/master/mipi-i3c-hci/cmd_v2.c   | 2 --
 drivers/i3c/master/mipi-i3c-hci/core.c     | 2 --
 drivers/i3c/master/mipi-i3c-hci/dat_v1.c   | 1 -
 drivers/i3c/master/mipi-i3c-hci/dma.c      | 2 --
 drivers/i3c/master/mipi-i3c-hci/ext_caps.c | 1 -
 drivers/i3c/master/mipi-i3c-hci/ext_caps.h | 1 -
 drivers/i3c/master/mipi-i3c-hci/hci.h      | 5 -----
 drivers/i3c/master/mipi-i3c-hci/pio.c      | 1 -
 9 files changed, 17 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c b/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
index eb8a3ae2990d..fe260461e7e6 100644
--- a/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
+++ b/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
@@ -15,7 +15,6 @@
 #include "dat.h"
 #include "dct.h"
 
-
 /*
  * Address Assignment Command
  */
@@ -100,7 +99,6 @@
 #define CMD_M0_VENDOR_INFO_PRESENT		   W0_BIT_( 7)
 #define CMD_M0_TID(v)			FIELD_PREP(W0_MASK( 6,  3), v)
 
-
 /* Data Transfer Speed and Mode */
 enum hci_cmd_mode {
 	MODE_I3C_SDR0		= 0x0,
diff --git a/drivers/i3c/master/mipi-i3c-hci/cmd_v2.c b/drivers/i3c/master/mipi-i3c-hci/cmd_v2.c
index efb4326a25b7..3729e6419581 100644
--- a/drivers/i3c/master/mipi-i3c-hci/cmd_v2.c
+++ b/drivers/i3c/master/mipi-i3c-hci/cmd_v2.c
@@ -16,7 +16,6 @@
 #include "cmd.h"
 #include "xfer_mode_rate.h"
 
-
 /*
  * Unified Data Transfer Command
  */
@@ -62,7 +61,6 @@
 #define CMD_A0_ASSIGN_ADDRESS(v)	FIELD_PREP(W0_MASK( 14,   8), v)
 #define CMD_A0_TID(v)			FIELD_PREP(W0_MASK(  6,   3), v)
 
-
 static unsigned int get_i3c_rate_idx(struct i3c_hci *hci)
 {
 	struct i3c_bus *bus = i3c_master_get_bus(&hci->master);
diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 607d77ab0e54..211321f73e02 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -21,7 +21,6 @@
 #include "cmd.h"
 #include "dat.h"
 
-
 /*
  * Host Controller Capabilities and Operation Registers
  */
@@ -109,7 +108,6 @@
 #define DEV_CTX_BASE_LO			0x60
 #define DEV_CTX_BASE_HI			0x64
 
-
 static inline struct i3c_hci *to_i3c_hci(struct i3c_master_controller *m)
 {
 	return container_of(m, struct i3c_hci, master);
diff --git a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
index 85c4916972e4..cc5d2deb23ab 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
@@ -15,7 +15,6 @@
 #include "hci.h"
 #include "dat.h"
 
-
 /*
  * Device Address Table Structure
  */
diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index c401a9425cdc..f20db2899989 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -20,7 +20,6 @@
 #include "cmd.h"
 #include "ibi.h"
 
-
 /*
  * Software Parameter Values (somewhat arb itrary for now).
  * Some of them could be determined at run time eventually.
@@ -124,7 +123,6 @@
 #define DATA_BUF_IOC			BIT(30)	/* Interrupt on Completion */
 #define DATA_BUF_BLOCK_SIZE		GENMASK(15, 0)
 
-
 struct hci_rh_data {
 	void __iomem *regs;
 	void *xfer, *resp, *ibi_status, *ibi_data;
diff --git a/drivers/i3c/master/mipi-i3c-hci/ext_caps.c b/drivers/i3c/master/mipi-i3c-hci/ext_caps.c
index 7714f00ea9cc..40939af0b0e3 100644
--- a/drivers/i3c/master/mipi-i3c-hci/ext_caps.c
+++ b/drivers/i3c/master/mipi-i3c-hci/ext_caps.c
@@ -16,7 +16,6 @@
 #include "ext_caps.h"
 #include "xfer_mode_rate.h"
 
-
 /* Extended Capability Header */
 #define CAP_HEADER_LENGTH		GENMASK(23, 8)
 #define CAP_HEADER_ID			GENMASK(7, 0)
diff --git a/drivers/i3c/master/mipi-i3c-hci/ext_caps.h b/drivers/i3c/master/mipi-i3c-hci/ext_caps.h
index 9df17822fdb4..b15e629951f0 100644
--- a/drivers/i3c/master/mipi-i3c-hci/ext_caps.h
+++ b/drivers/i3c/master/mipi-i3c-hci/ext_caps.h
@@ -13,7 +13,6 @@
 /* MIPI vendor IDs */
 #define MIPI_VENDOR_NXP			0x11b
 
-
 int i3c_hci_parse_ext_caps(struct i3c_hci *hci);
 
 #endif
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index 249ccb13c909..3f88b67bc5cc 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci.h
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -62,7 +62,6 @@ struct i3c_hci {
 	void *vendor_data;
 };
 
-
 /*
  * Structure to represent a master initiated transfer.
  * The rnw, data and data_len fields must be initialized before calling any
@@ -108,7 +107,6 @@ static inline void hci_free_xfer(struct hci_xfer *xfer, unsigned int n)
 	kfree(xfer);
 }
 
-
 /* This abstracts PIO vs DMA operations */
 struct hci_io_ops {
 	bool (*irq_handler)(struct i3c_hci *hci);
@@ -126,21 +124,18 @@ struct hci_io_ops {
 extern const struct hci_io_ops mipi_i3c_hci_pio;
 extern const struct hci_io_ops mipi_i3c_hci_dma;
 
-
 /* Our per device master private data */
 struct i3c_hci_dev_data {
 	int dat_idx;
 	void *ibi_data;
 };
 
-
 /* list of quirks */
 #define HCI_QUIRK_RAW_CCC	BIT(1)	/* CCC framing must be explicit */
 #define HCI_QUIRK_PIO_MODE	BIT(2)  /* Set PIO mode for AMD platforms */
 #define HCI_QUIRK_OD_PP_TIMING		BIT(3)  /* Set OD and PP timings for AMD platforms */
 #define HCI_QUIRK_RESP_BUF_THLD		BIT(4)  /* Set resp buf thld to 0 for AMD platforms */
 
-
 /* global functions */
 void mipi_i3c_hci_resume(struct i3c_hci *hci);
 void mipi_i3c_hci_pio_reset(struct i3c_hci *hci);
diff --git a/drivers/i3c/master/mipi-i3c-hci/pio.c b/drivers/i3c/master/mipi-i3c-hci/pio.c
index 710faa46a00f..142f3f79415b 100644
--- a/drivers/i3c/master/mipi-i3c-hci/pio.c
+++ b/drivers/i3c/master/mipi-i3c-hci/pio.c
@@ -15,7 +15,6 @@
 #include "cmd.h"
 #include "ibi.h"
 
-
 /*
  * PIO Access Area
  */
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
