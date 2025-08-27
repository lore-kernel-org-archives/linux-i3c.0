Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7204CA0FFC
	for <linux-i3c@archiver.kernel.org>; Wed, 27 Aug 2025 11:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YZU0RwphA/WmzTMZAd0wOkOpvMpPhNM/6Aa0NS94Y7Q=; b=g2WzGEa8TrmZyS
	VYtWnrF1E8UzedSsegICRNpd6//LTHF27HdXm1ubSSHNfKV7T8jqJV+QKO/fGoHPFeGLj5b/vb1yB
	M86xq7BDPHAok/xEKy5IJYRrsNzW6/1zsN06qlMtpQqWbk5boJEp76KgwDXsZPYfw/sAGmzNPcAnN
	Ha2u3xPqe0R1D6ceD5AfI/AMQI/Fc7iYdvhpqsPojtmzRF2P365Wmas5gLpN2BYw1IibuxLBUiGh2
	ligU9AWXDmUdpE0TWCCEV0I6Xp6l+ZokUsRf8a/H1hUT1/hOBwqZVowxlBU2i1DKtb+3Wb0MDx3/b
	lwqOKTITwHKZqZZNh21w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urE2a-0000000FDQp-19gi;
	Wed, 27 Aug 2025 11:10:08 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urDQ6-0000000F4hH-2787
	for linux-i3c@lists.infradead.org;
	Wed, 27 Aug 2025 10:30:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756290622; x=1787826622;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=y2wXEyOZbpm8zOQGYpvBT1kwVe+NoRyz9CFnaMQ13mk=;
  b=hO7yljUO5Jv9pLrxUfpqtHFMe84GfrBztlZ4vOFw3CYC8+piU0KYtay3
   1NeI+YG3ICI2zgOmOtDUZzLfCZhsnC9bbHrOkyRO7pwBaUeG9SWX3EIrg
   10wBbKX+9zOUWZXk6FhgTLfk6e++60moi0ZkOdiUgyd36f4KXjNBCvncx
   GyaID73HaoK2y1tL6BLE9r3HfpuObjJmP989ukSHd6zLgq86NlCuZ2Vmg
   WvgPdGbFDiwlj13B9Frz3oD2bWOwL7J7/4oPcZ3Oz3EC1QptjSkG+or+F
   9iN3ychszo1IP4fnrMA+tlVLGhNG5WLRhkA0vBt4GQInnS5P2nx4/w9A5
   A==;
X-CSE-ConnectionGUID: oDrDnceeS8uPDRwjHfX85g==
X-CSE-MsgGUID: hg63ncm/SqO9gzuuQygGLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="57741024"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="57741024"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 03:30:22 -0700
X-CSE-ConnectionGUID: +XBjfYRYS6SHlGOPzXfpJw==
X-CSE-MsgGUID: +xqui7tASEa7wQW8+hx5Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="200761533"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.51])
  by orviesa002.jf.intel.com with ESMTP; 27 Aug 2025 03:30:21 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 5/5] i3c: mipi-i3c-hci: Convert remaining DBG() prints to dev_dbg()
Date: Wed, 27 Aug 2025 13:30:09 +0300
Message-ID: <20250827103009.243771-6-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250827103009.243771-1-jarkko.nikula@linux.intel.com>
References: <20250827103009.243771-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_033022_564682_F6AC261A 
X-CRM114-Status: GOOD (  18.37  )
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

Get rid of local DBG() macro and convert remaining debug prints to
dev_dbg() which can be controlled without code recompile when kernel is
built with dynamic debug support.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/cmd_v1.c   |  9 ++-
 drivers/i3c/master/mipi-i3c-hci/cmd_v2.c   |  7 ++-
 drivers/i3c/master/mipi-i3c-hci/core.c     | 16 +++---
 drivers/i3c/master/mipi-i3c-hci/dma.c      | 15 +++--
 drivers/i3c/master/mipi-i3c-hci/ext_caps.c | 11 ++--
 drivers/i3c/master/mipi-i3c-hci/hci.h      |  3 -
 drivers/i3c/master/mipi-i3c-hci/pio.c      | 66 +++++++++++++---------
 7 files changed, 72 insertions(+), 55 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c b/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
index dd636094b07f..eb8a3ae2990d 100644
--- a/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
+++ b/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
@@ -317,7 +317,9 @@ static int hci_cmd_v1_daa(struct i3c_hci *hci)
 			break;
 		next_addr = ret;
 
-		DBG("next_addr = 0x%02x, DAA using DAT %d", next_addr, dat_idx);
+		dev_dbg(&hci->master.dev,
+			"next_addr = 0x%02x, DAA using DAT %d",
+			next_addr, dat_idx);
 		mipi_i3c_hci_dat_v1.set_dynamic_addr(hci, dat_idx, next_addr);
 		mipi_i3c_hci_dct_index_reset(hci);
 
@@ -349,8 +351,9 @@ static int hci_cmd_v1_daa(struct i3c_hci *hci)
 		}
 
 		i3c_hci_dct_get_val(hci, 0, &pid, &dcr, &bcr);
-		DBG("assigned address %#x to device PID=0x%llx DCR=%#x BCR=%#x",
-		    next_addr, pid, dcr, bcr);
+		dev_dbg(&hci->master.dev,
+			"assigned address %#x to device PID=0x%llx DCR=%#x BCR=%#x",
+			next_addr, pid, dcr, bcr);
 
 		mipi_i3c_hci_dat_v1.free_entry(hci, dat_idx);
 		dat_idx = -1;
diff --git a/drivers/i3c/master/mipi-i3c-hci/cmd_v2.c b/drivers/i3c/master/mipi-i3c-hci/cmd_v2.c
index 4493b2b067cb..efb4326a25b7 100644
--- a/drivers/i3c/master/mipi-i3c-hci/cmd_v2.c
+++ b/drivers/i3c/master/mipi-i3c-hci/cmd_v2.c
@@ -261,7 +261,7 @@ static int hci_cmd_v2_daa(struct i3c_hci *hci)
 		if (ret < 0)
 			break;
 		next_addr = ret;
-		DBG("next_addr = 0x%02x", next_addr);
+		dev_dbg(&hci->master.dev, "next_addr = 0x%02x", next_addr);
 		xfer[0].cmd_tid = hci_get_tid();
 		xfer[0].cmd_desc[0] =
 			CMD_0_ATTR_A |
@@ -293,8 +293,9 @@ static int hci_cmd_v2_daa(struct i3c_hci *hci)
 		pid = (pid << 32) | device_id[0];
 		bcr = FIELD_GET(W1_MASK(55, 48), device_id[1]);
 		dcr = FIELD_GET(W1_MASK(63, 56), device_id[1]);
-		DBG("assigned address %#x to device PID=0x%llx DCR=%#x BCR=%#x",
-		    next_addr, pid, dcr, bcr);
+		dev_dbg(&hci->master.dev,
+			"assigned address %#x to device PID=0x%llx DCR=%#x BCR=%#x",
+			next_addr, pid, dcr, bcr);
 		/*
 		 * TODO: Extend the subsystem layer to allow for registering
 		 * new device and provide BCR/DCR/PID at the same time.
diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 9932945ecf06..47e42cb4dbe7 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -147,7 +147,7 @@ static int i3c_hci_bus_init(struct i3c_master_controller *m)
 		amd_set_resp_buf_thld(hci);
 
 	reg_set(HC_CONTROL, HC_CONTROL_BUS_ENABLE);
-	DBG("HC_CONTROL = %#x", reg_read(HC_CONTROL));
+	dev_dbg(&hci->master.dev, "HC_CONTROL = %#x", reg_read(HC_CONTROL));
 
 	return 0;
 }
@@ -192,8 +192,8 @@ static int i3c_hci_send_ccc_cmd(struct i3c_master_controller *m,
 	DECLARE_COMPLETION_ONSTACK(done);
 	int i, last, ret = 0;
 
-	DBG("cmd=%#x rnw=%d ndests=%d data[0].len=%d",
-	    ccc->id, ccc->rnw, ccc->ndests, ccc->dests[0].payload.len);
+	dev_dbg(&hci->master.dev, "cmd=%#x rnw=%d ndests=%d data[0].len=%d",
+		ccc->id, ccc->rnw, ccc->ndests, ccc->dests[0].payload.len);
 
 	xfer = hci_alloc_xfer(nxfers);
 	if (!xfer)
@@ -251,8 +251,8 @@ static int i3c_hci_send_ccc_cmd(struct i3c_master_controller *m,
 	}
 
 	if (ccc->rnw)
-		DBG("got: %*ph",
-		    ccc->dests[0].payload.len, ccc->dests[0].payload.data);
+		dev_dbg(&hci->master.dev, "got: %*ph",
+			ccc->dests[0].payload.len, ccc->dests[0].payload.data);
 
 out:
 	hci_free_xfer(xfer, nxfers);
@@ -277,7 +277,7 @@ static int i3c_hci_priv_xfers(struct i3c_dev_desc *dev,
 	unsigned int size_limit;
 	int i, last, ret = 0;
 
-	DBG("nxfers = %d", nxfers);
+	dev_dbg(&hci->master.dev, "nxfers = %d", nxfers);
 
 	xfer = hci_alloc_xfer(nxfers);
 	if (!xfer)
@@ -335,7 +335,7 @@ static int i3c_hci_i2c_xfers(struct i2c_dev_desc *dev,
 	DECLARE_COMPLETION_ONSTACK(done);
 	int i, last, ret = 0;
 
-	DBG("nxfers = %d", nxfers);
+	dev_dbg(&hci->master.dev, "nxfers = %d", nxfers);
 
 	xfer = hci_alloc_xfer(nxfers);
 	if (!xfer)
@@ -587,7 +587,7 @@ static int i3c_hci_init(struct i3c_hci *hci)
 	}
 
 	hci->caps = reg_read(HC_CAPABILITIES);
-	DBG("caps = %#x", hci->caps);
+	dev_dbg(&hci->master.dev, "caps = %#x", hci->caps);
 
 	size_in_dwords = hci->version_major < 1 ||
 			 (hci->version_major == 1 && hci->version_minor < 1);
diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 3fadacbda582..c401a9425cdc 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -248,8 +248,9 @@ static int hci_dma_init(struct i3c_hci *hci)
 		regval = rh_reg_read(CR_SETUP);
 		rh->xfer_struct_sz = FIELD_GET(CR_XFER_STRUCT_SIZE, regval);
 		rh->resp_struct_sz = FIELD_GET(CR_RESP_STRUCT_SIZE, regval);
-		DBG("xfer_struct_sz = %d, resp_struct_sz = %d",
-		    rh->xfer_struct_sz, rh->resp_struct_sz);
+		dev_dbg(&hci->master.dev,
+			"xfer_struct_sz = %d, resp_struct_sz = %d",
+			rh->xfer_struct_sz, rh->resp_struct_sz);
 		xfers_sz = rh->xfer_struct_sz * rh->xfer_entries;
 		resps_sz = rh->resp_struct_sz * rh->xfer_entries;
 
@@ -523,11 +524,11 @@ static void hci_dma_xfer_done(struct i3c_hci *hci, struct hci_rh_data *rh)
 		ring_resp = rh->resp + rh->resp_struct_sz * done_ptr;
 		resp = *ring_resp;
 		tid = RESP_TID(resp);
-		DBG("resp = 0x%08x", resp);
+		dev_dbg(&hci->master.dev, "resp = 0x%08x", resp);
 
 		xfer = rh->src_xfers[done_ptr];
 		if (!xfer) {
-			DBG("orphaned ring entry");
+			dev_dbg(&hci->master.dev, "orphaned ring entry");
 		} else {
 			hci_dma_unmap_xfer(hci, xfer, 1);
 			xfer->ring_entry = -1;
@@ -630,7 +631,7 @@ static void hci_dma_process_ibi(struct i3c_hci *hci, struct hci_rh_data *rh)
 
 		ring_ibi_status = rh->ibi_status + rh->ibi_status_sz * ptr;
 		ibi_status = *ring_ibi_status;
-		DBG("status = %#x", ibi_status);
+		dev_dbg(&hci->master.dev, "status = %#x", ibi_status);
 
 		if (ibi_status_error) {
 			/* we no longer care */
@@ -658,7 +659,9 @@ static void hci_dma_process_ibi(struct i3c_hci *hci, struct hci_rh_data *rh)
 
 	if (last_ptr == -1) {
 		/* this IBI sequence is not yet complete */
-		DBG("no LAST_STATUS available (e=%d d=%d)", enq_ptr, deq_ptr);
+		dev_dbg(&hci->master.dev,
+			"no LAST_STATUS available (e=%d d=%d)",
+			enq_ptr, deq_ptr);
 		return;
 	}
 	deq_ptr = last_ptr + 1;
diff --git a/drivers/i3c/master/mipi-i3c-hci/ext_caps.c b/drivers/i3c/master/mipi-i3c-hci/ext_caps.c
index 2e9b23efdc45..7714f00ea9cc 100644
--- a/drivers/i3c/master/mipi-i3c-hci/ext_caps.c
+++ b/drivers/i3c/master/mipi-i3c-hci/ext_caps.c
@@ -35,7 +35,7 @@ static int hci_extcap_hardware_id(struct i3c_hci *hci, void __iomem *base)
 	switch (hci->vendor_mipi_id) {
 	case MIPI_VENDOR_NXP:
 		hci->quirks |= HCI_QUIRK_RAW_CCC;
-		DBG("raw CCC quirks set");
+		dev_dbg(&hci->master.dev, "raw CCC quirks set");
 		break;
 	}
 
@@ -77,7 +77,8 @@ static int hci_extcap_xfer_modes(struct i3c_hci *hci, void __iomem *base)
 	for (index = 0; index < entries; index++) {
 		u32 mode_entry = readl(base);
 
-		DBG("mode %d: 0x%08x", index, mode_entry);
+		dev_dbg(&hci->master.dev, "mode %d: 0x%08x",
+			index, mode_entry);
 		/* TODO: will be needed when I3C core does more than SDR */
 		base += 4;
 	}
@@ -97,7 +98,8 @@ static int hci_extcap_xfer_rates(struct i3c_hci *hci, void __iomem *base)
 	dev_info(&hci->master.dev, "available data rates:\n");
 	for (index = 0; index < entries; index++) {
 		rate_entry = readl(base);
-		DBG("entry %d: 0x%08x", index, rate_entry);
+		dev_dbg(&hci->master.dev, "entry %d: 0x%08x",
+			index, rate_entry);
 		rate = FIELD_GET(XFERRATE_ACTUAL_RATE_KHZ, rate_entry);
 		rate_id = FIELD_GET(XFERRATE_RATE_ID, rate_entry);
 		mode_id = FIELD_GET(XFERRATE_MODE_ID, rate_entry);
@@ -268,7 +270,8 @@ int i3c_hci_parse_ext_caps(struct i3c_hci *hci)
 		cap_header = readl(curr_cap);
 		cap_id = FIELD_GET(CAP_HEADER_ID, cap_header);
 		cap_length = FIELD_GET(CAP_HEADER_LENGTH, cap_header);
-		DBG("id=0x%02x length=%d", cap_id, cap_length);
+		dev_dbg(&hci->master.dev, "id=0x%02x length=%d",
+			cap_id, cap_length);
 		if (!cap_length)
 			break;
 		if (curr_cap + cap_length * 4 >= end) {
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index 33bc4906df1f..249ccb13c909 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci.h
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -12,9 +12,6 @@
 
 #include <linux/io.h>
 
-/* Handy logging macro to save on line length */
-#define DBG(x, ...) pr_devel("%s: " x "\n", __func__, ##__VA_ARGS__)
-
 /* 32-bit word aware bit and mask macros */
 #define W0_MASK(h, l)  GENMASK((h) - 0,  (l) - 0)
 #define W1_MASK(h, l)  GENMASK((h) - 32, (l) - 32)
diff --git a/drivers/i3c/master/mipi-i3c-hci/pio.c b/drivers/i3c/master/mipi-i3c-hci/pio.c
index cde883137bc7..01e7d2833301 100644
--- a/drivers/i3c/master/mipi-i3c-hci/pio.c
+++ b/drivers/i3c/master/mipi-i3c-hci/pio.c
@@ -213,7 +213,7 @@ static void hci_pio_cleanup(struct i3c_hci *hci)
 	pio_reg_write(INTR_SIGNAL_ENABLE, 0x0);
 
 	if (pio) {
-		DBG("status = %#x/%#x",
+		dev_dbg(&hci->master.dev, "status = %#x/%#x",
 		    pio_reg_read(INTR_STATUS), pio_reg_read(INTR_SIGNAL_ENABLE));
 		BUG_ON(pio->curr_xfer);
 		BUG_ON(pio->curr_rx);
@@ -226,13 +226,17 @@ static void hci_pio_cleanup(struct i3c_hci *hci)
 
 static void hci_pio_write_cmd(struct i3c_hci *hci, struct hci_xfer *xfer)
 {
-	DBG("cmd_desc[%d] = 0x%08x", 0, xfer->cmd_desc[0]);
-	DBG("cmd_desc[%d] = 0x%08x", 1, xfer->cmd_desc[1]);
+	dev_dbg(&hci->master.dev, "cmd_desc[%d] = 0x%08x",
+		0, xfer->cmd_desc[0]);
+	dev_dbg(&hci->master.dev, "cmd_desc[%d] = 0x%08x",
+		1, xfer->cmd_desc[1]);
 	pio_reg_write(COMMAND_QUEUE_PORT, xfer->cmd_desc[0]);
 	pio_reg_write(COMMAND_QUEUE_PORT, xfer->cmd_desc[1]);
 	if (hci->cmd == &mipi_i3c_hci_cmd_v2) {
-		DBG("cmd_desc[%d] = 0x%08x", 2, xfer->cmd_desc[2]);
-		DBG("cmd_desc[%d] = 0x%08x", 3, xfer->cmd_desc[3]);
+		dev_dbg(&hci->master.dev, "cmd_desc[%d] = 0x%08x",
+			2, xfer->cmd_desc[2]);
+		dev_dbg(&hci->master.dev, "cmd_desc[%d] = 0x%08x",
+			3, xfer->cmd_desc[3]);
 		pio_reg_write(COMMAND_QUEUE_PORT, xfer->cmd_desc[2]);
 		pio_reg_write(COMMAND_QUEUE_PORT, xfer->cmd_desc[3]);
 	}
@@ -254,7 +258,8 @@ static bool hci_pio_do_rx(struct i3c_hci *hci, struct hci_pio_data *pio)
 		nr_words = min(xfer->data_left / 4, pio->rx_thresh_size);
 		/* extract data from FIFO */
 		xfer->data_left -= nr_words * 4;
-		DBG("now %d left %d", nr_words * 4, xfer->data_left);
+		dev_dbg(&hci->master.dev, "now %d left %d",
+			nr_words * 4, xfer->data_left);
 		while (nr_words--)
 			*p++ = pio_reg_read(XFER_DATA_PORT);
 	}
@@ -269,7 +274,7 @@ static void hci_pio_do_trailing_rx(struct i3c_hci *hci,
 	struct hci_xfer *xfer = pio->curr_rx;
 	u32 *p;
 
-	DBG("%d remaining", count);
+	dev_dbg(&hci->master.dev, "%d remaining", count);
 
 	p = xfer->data;
 	p += (xfer->data_len - xfer->data_left) / 4;
@@ -278,7 +283,8 @@ static void hci_pio_do_trailing_rx(struct i3c_hci *hci,
 		unsigned int nr_words = count / 4;
 		/* extract data from FIFO */
 		xfer->data_left -= nr_words * 4;
-		DBG("now %d left %d", nr_words * 4, xfer->data_left);
+		dev_dbg(&hci->master.dev, "now %d left %d",
+			nr_words * 4, xfer->data_left);
 		while (nr_words--)
 			*p++ = pio_reg_read(XFER_DATA_PORT);
 	}
@@ -321,7 +327,8 @@ static bool hci_pio_do_tx(struct i3c_hci *hci, struct hci_pio_data *pio)
 		nr_words = min(xfer->data_left / 4, pio->tx_thresh_size);
 		/* push data into the FIFO */
 		xfer->data_left -= nr_words * 4;
-		DBG("now %d left %d", nr_words * 4, xfer->data_left);
+		dev_dbg(&hci->master.dev, "now %d left %d",
+			nr_words * 4, xfer->data_left);
 		while (nr_words--)
 			pio_reg_write(XFER_DATA_PORT, *p++);
 	}
@@ -336,7 +343,7 @@ static bool hci_pio_do_tx(struct i3c_hci *hci, struct hci_pio_data *pio)
 		 */
 		if (!(pio_reg_read(INTR_STATUS) & STAT_TX_THLD))
 			return false;
-		DBG("trailing %d", xfer->data_left);
+		dev_dbg(&hci->master.dev, "trailing %d", xfer->data_left);
 		pio_reg_write(XFER_DATA_PORT, *p);
 		xfer->data_left = 0;
 	}
@@ -481,7 +488,7 @@ static bool hci_pio_process_resp(struct i3c_hci *hci, struct hci_pio_data *pio)
 		u32 resp = pio_reg_read(RESPONSE_QUEUE_PORT);
 		unsigned int tid = RESP_TID(resp);
 
-		DBG("resp = 0x%08x", resp);
+		dev_dbg(&hci->master.dev, "resp = 0x%08x", resp);
 		if (tid != xfer->cmd_tid) {
 			dev_err(&hci->master.dev,
 				"response tid=%d when expecting %d\n",
@@ -522,14 +529,15 @@ static bool hci_pio_process_resp(struct i3c_hci *hci, struct hci_pio_data *pio)
 		 * still exists.
 		 */
 		if (pio->curr_rx == xfer) {
-			DBG("short RX ?");
+			dev_dbg(&hci->master.dev, "short RX ?");
 			pio->curr_rx = pio->curr_rx->next_data;
 		} else if (pio->curr_tx == xfer) {
-			DBG("short TX ?");
+			dev_dbg(&hci->master.dev, "short TX ?");
 			pio->curr_tx = pio->curr_tx->next_data;
 		} else if (xfer->data_left) {
-			DBG("PIO xfer count = %d after response",
-			    xfer->data_left);
+			dev_dbg(&hci->master.dev,
+				"PIO xfer count = %d after response",
+				xfer->data_left);
 		}
 
 		pio->curr_resp = xfer->next_resp;
@@ -591,7 +599,7 @@ static int hci_pio_queue_xfer(struct i3c_hci *hci, struct hci_xfer *xfer, int n)
 	struct hci_xfer *prev_queue_tail;
 	int i;
 
-	DBG("n = %d", n);
+	dev_dbg(&hci->master.dev, "n = %d", n);
 
 	/* link xfer instances together and initialize data count */
 	for (i = 0; i < n; i++) {
@@ -611,8 +619,9 @@ static int hci_pio_queue_xfer(struct i3c_hci *hci, struct hci_xfer *xfer, int n)
 		if (!hci_pio_process_cmd(hci, pio))
 			pio->enabled_irqs |= STAT_CMD_QUEUE_READY;
 		pio_reg_write(INTR_SIGNAL_ENABLE, pio->enabled_irqs);
-		DBG("status = %#x/%#x",
-		    pio_reg_read(INTR_STATUS), pio_reg_read(INTR_SIGNAL_ENABLE));
+		dev_dbg(&hci->master.dev, "status = %#x/%#x",
+			pio_reg_read(INTR_STATUS),
+			pio_reg_read(INTR_SIGNAL_ENABLE));
 	}
 	spin_unlock_irq(&pio->lock);
 	return 0;
@@ -686,10 +695,10 @@ static bool hci_pio_dequeue_xfer(struct i3c_hci *hci, struct hci_xfer *xfer, int
 	int ret;
 
 	spin_lock_irq(&pio->lock);
-	DBG("n=%d status=%#x/%#x", n,
-	    pio_reg_read(INTR_STATUS), pio_reg_read(INTR_SIGNAL_ENABLE));
-	DBG("main_status = %#x/%#x",
-	    readl(hci->base_regs + 0x20), readl(hci->base_regs + 0x28));
+	dev_dbg(&hci->master.dev, "n=%d status=%#x/%#x", n,
+		pio_reg_read(INTR_STATUS), pio_reg_read(INTR_SIGNAL_ENABLE));
+	dev_dbg(&hci->master.dev, "main_status = %#x/%#x",
+		readl(hci->base_regs + 0x20), readl(hci->base_regs + 0x28));
 
 	ret = hci_pio_dequeue_xfer_common(hci, pio, xfer, n);
 	spin_unlock_irq(&pio->lock);
@@ -733,8 +742,8 @@ static void hci_pio_err(struct i3c_hci *hci, struct hci_pio_data *pio,
 	mipi_i3c_hci_pio_reset(hci);
 	mipi_i3c_hci_resume(hci);
 
-	DBG("status=%#x/%#x",
-	    pio_reg_read(INTR_STATUS), pio_reg_read(INTR_SIGNAL_ENABLE));
+	dev_dbg(&hci->master.dev, "status=%#x/%#x",
+		pio_reg_read(INTR_STATUS), pio_reg_read(INTR_SIGNAL_ENABLE));
 }
 
 static void hci_pio_set_ibi_thresh(struct i3c_hci *hci,
@@ -749,7 +758,7 @@ static void hci_pio_set_ibi_thresh(struct i3c_hci *hci,
 	if (regval != pio->reg_queue_thresh) {
 		pio_reg_write(QUEUE_THLD_CTRL, regval);
 		pio->reg_queue_thresh = regval;
-		DBG("%d", thresh_val);
+		dev_dbg(&hci->master.dev, "%d", thresh_val);
 	}
 }
 
@@ -773,7 +782,8 @@ static bool hci_pio_get_ibi_segment(struct i3c_hci *hci,
 		/* extract the data from the IBI port */
 		nr_words = thresh_val;
 		ibi->seg_cnt -= nr_words * 4;
-		DBG("now %d left %d", nr_words * 4, ibi->seg_cnt);
+		dev_dbg(&hci->master.dev, "now %d left %d",
+			nr_words * 4, ibi->seg_cnt);
 		while (nr_words--)
 			*p++ = pio_reg_read(IBI_PORT);
 	}
@@ -791,7 +801,7 @@ static bool hci_pio_get_ibi_segment(struct i3c_hci *hci,
 		hci_pio_set_ibi_thresh(hci, pio, 1);
 		if (!(pio_reg_read(INTR_STATUS) & STAT_IBI_STATUS_THLD))
 			return false;
-		DBG("trailing %d", ibi->seg_cnt);
+		dev_dbg(&hci->master.dev, "trailing %d", ibi->seg_cnt);
 		data = pio_reg_read(IBI_PORT);
 		data = (__force u32) cpu_to_le32(data);
 		while (ibi->seg_cnt--) {
@@ -820,7 +830,7 @@ static bool hci_pio_prep_new_ibi(struct i3c_hci *hci, struct hci_pio_data *pio)
 	 */
 
 	ibi_status = pio_reg_read(IBI_PORT);
-	DBG("status = %#x", ibi_status);
+	dev_dbg(&hci->master.dev, "status = %#x", ibi_status);
 	ibi->addr = FIELD_GET(IBI_TARGET_ADDR, ibi_status);
 	if (ibi_status & IBI_ERROR) {
 		dev_err(&hci->master.dev, "IBI error from %#x\n", ibi->addr);
-- 
2.47.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
