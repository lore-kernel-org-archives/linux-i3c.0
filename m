Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54960D148BE
	for <linux-i3c@archiver.kernel.org>; Thu,  8 Jan 2026 08:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RcQIEq28dbUSetlj5lHu7lTkofsKzUyhxRf5I4TTKfU=; b=vcT+pz1IUM8UQB
	J4fx7wqioNaIKxeC3pvoYcjoEj6waN1aUMd3IbnydTblJUl4B0fHVf0YNRCMQKdGvPQk8b9Yu2/1/
	ZF0E0enuT/vpHrDa/1Ke0lSIAu4hQwRMv9UPJ8OSGqA8S/6/ukT277ZFcBHRZJ1LkE57EUIdOqns5
	XfwwqSBLy/tCA+D7c7iEUPXRyp5KtkKZG+MF96ag+14eUoHJ68j932VonMw1TqpEXW6ZbmOTDBRWs
	JAG98hPp3+SFDWiAZtOimeuiXMvdp9yCeB3Fwje9Y71N/f2Jql9tY3zeSpw+x6NnsFqwZ0AQfOzL/
	6HhRN6cRtir1W2m5VZ4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdl2m-0000000GDPr-0Kte;
	Thu, 08 Jan 2026 08:06:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdl2k-0000000GDOc-38io
	for linux-i3c@bombadil.infradead.org;
	Thu, 08 Jan 2026 08:06:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ndYMHf/xJs/UehDBU8sbL0gBN+DlhZ28nufZz+IG4PQ=; b=TfMWDmydYT6pKNOdk+YoarYSUd
	AB3z/Mlf+ya02n7EC6slcped3t1QWGG4aHG7RFAZTYmX4lGfX6757rzATlnzUXWKZfhCk7agLlTXE
	4vQqlOmi9eVPfSwlbpm2zCOVQ6Jn4X+3oL3mHs9r68y7GeiTEzAe6i8UX8qB31CgA429F3IjNQs1l
	ZfYygC1iNi6K342Fe5Elmw0z1I73a45ij1AM1RMeF/kQ6eESsgdyBDHTz613kC75DcXhVqs38oHSZ
	o3sndrUOskMt709xVIGjkIoqvYW54sc8dhSQ2XisxBqwunCoV4m8QgjxgGYh/P61A0e9tepQpVcGi
	43MMhVYg==;
Received: from mgamail.intel.com ([192.198.163.16])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdl2e-0000000Chv4-2NPo
	for linux-i3c@lists.infradead.org;
	Thu, 08 Jan 2026 08:06:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767859609; x=1799395609;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qWqKScoX22YnrWGbmkF97gM6+IWU0ag1gVFUhJd0l7c=;
  b=JepRdG1Ow8Xe6/Dz+vrbb9SiAAP+3RuDGg7uXMeDnM+qJuVLkvXuk593
   qexBtV6xZaRNvjanTt3fOkSk6psKij/uHO+XkaqOgpZgwFKQShXa4Lqiw
   rBlSZUM2otLqBa11K1Hlf/z0fLh408X9GaZmTxWpAmsPMbbiUNjOuhb0G
   ShZNauMsiYxQDyg5SYS+KVgwNuOKZcgR+ipJKdGKEsrH90obYoBAEgnK3
   lhLpqCvgbQMPjK601BtDCxFQ2PdUBsefitAc/DUyGTPKoXnyKMwBG6MNB
   pUNGgee2kyq9y2KxnNxSDDQHcge81XfM6Y16xC7ABl1Ry2NdquO9e08uA
   w==;
X-CSE-ConnectionGUID: u9CWeLutTLGK3JZ9BvUo8w==
X-CSE-MsgGUID: dIcNfmvMQneQVUsElJL2mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="56792347"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="56792347"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:06:43 -0800
X-CSE-ConnectionGUID: hJbUjgs5Rcu6+SdLV22S9A==
X-CSE-MsgGUID: l3/bOce3S3qrOtqGWyfFrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="203413629"
Received: from abityuts-desk.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.195])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:06:41 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH V2 16/20] i3c: mipi-i3c-hci: Factor out core initialization into helper
Date: Thu,  8 Jan 2026 10:05:54 +0200
Message-ID: <20260108080558.21767-17-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260108080558.21767-1-adrian.hunter@intel.com>
References: <20260108080558.21767-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_080650_337054_CEB5ADAB 
X-CRM114-Status: GOOD (  14.60  )
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

Prepare for future reuse.  Move core initialization logic from
i3c_hci_init() into a dedicated helper function,
i3c_hci_reset_and_init().

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


Changes in V2:

	New patch


 drivers/i3c/master/mipi-i3c-hci/core.c | 146 +++++++++++++------------
 1 file changed, 79 insertions(+), 67 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 569c8584045a..fc0a47a36961 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -639,6 +639,84 @@ static int i3c_hci_set_io_mode(struct i3c_hci *hci, bool dma)
 	return 0;
 }
 
+static int i3c_hci_reset_and_init(struct i3c_hci *hci)
+{
+	u32 regval;
+	int ret;
+
+	ret = i3c_hci_software_reset(hci);
+	if (ret)
+		return -ENXIO;
+
+	/* Disable all interrupts */
+	reg_write(INTR_SIGNAL_ENABLE, 0x0);
+	/*
+	 * Only allow bit 31:10 signal updates because
+	 * Bit 0:9 are reserved in IP version >= 0.8
+	 * Bit 0:5 are defined in IP version < 0.8 but not handled by PIO code
+	 */
+	reg_write(INTR_STATUS_ENABLE, GENMASK(31, 10));
+
+	/* Make sure our data ordering fits the host's */
+	regval = reg_read(HC_CONTROL);
+	if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN)) {
+		if (!(regval & HC_CONTROL_DATA_BIG_ENDIAN)) {
+			regval |= HC_CONTROL_DATA_BIG_ENDIAN;
+			reg_write(HC_CONTROL, regval);
+			regval = reg_read(HC_CONTROL);
+			if (!(regval & HC_CONTROL_DATA_BIG_ENDIAN)) {
+				dev_err(&hci->master.dev, "cannot set BE mode\n");
+				return -EOPNOTSUPP;
+			}
+		}
+	} else {
+		if (regval & HC_CONTROL_DATA_BIG_ENDIAN) {
+			regval &= ~HC_CONTROL_DATA_BIG_ENDIAN;
+			reg_write(HC_CONTROL, regval);
+			regval = reg_read(HC_CONTROL);
+			if (regval & HC_CONTROL_DATA_BIG_ENDIAN) {
+				dev_err(&hci->master.dev, "cannot clear BE mode\n");
+				return -EOPNOTSUPP;
+			}
+		}
+	}
+
+	if (hci->io) {
+		ret = i3c_hci_set_io_mode(hci, hci->io == &mipi_i3c_hci_dma);
+	} else {
+		/* Try activating DMA operations first */
+		if (hci->RHS_regs) {
+			ret = i3c_hci_set_io_mode(hci, true);
+			if (!ret) {
+				hci->io = &mipi_i3c_hci_dma;
+				dev_dbg(&hci->master.dev, "Using DMA\n");
+			}
+		}
+
+		/* If no DMA, try PIO */
+		if (!hci->io && hci->PIO_regs) {
+			ret = i3c_hci_set_io_mode(hci, false);
+			if (!ret) {
+				hci->io = &mipi_i3c_hci_pio;
+				dev_dbg(&hci->master.dev, "Using PIO\n");
+			}
+		}
+
+		if (!hci->io) {
+			dev_err(&hci->master.dev, "neither DMA nor PIO can be used\n");
+			ret = ret ?: -EINVAL;
+		}
+	}
+	if (ret)
+		return ret;
+
+	/* Configure OD and PP timings for AMD platforms */
+	if (hci->quirks & HCI_QUIRK_OD_PP_TIMING)
+		amd_set_od_pp_timing(hci);
+
+	return 0;
+}
+
 static int i3c_hci_init(struct i3c_hci *hci)
 {
 	bool size_in_dwords;
@@ -708,43 +786,6 @@ static int i3c_hci_init(struct i3c_hci *hci)
 	if (ret)
 		return ret;
 
-	ret = i3c_hci_software_reset(hci);
-	if (ret)
-		return -ENXIO;
-
-	/* Disable all interrupts */
-	reg_write(INTR_SIGNAL_ENABLE, 0x0);
-	/*
-	 * Only allow bit 31:10 signal updates because
-	 * Bit 0:9 are reserved in IP version >= 0.8
-	 * Bit 0:5 are defined in IP version < 0.8 but not handled by PIO code
-	 */
-	reg_write(INTR_STATUS_ENABLE, GENMASK(31, 10));
-
-	/* Make sure our data ordering fits the host's */
-	regval = reg_read(HC_CONTROL);
-	if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN)) {
-		if (!(regval & HC_CONTROL_DATA_BIG_ENDIAN)) {
-			regval |= HC_CONTROL_DATA_BIG_ENDIAN;
-			reg_write(HC_CONTROL, regval);
-			regval = reg_read(HC_CONTROL);
-			if (!(regval & HC_CONTROL_DATA_BIG_ENDIAN)) {
-				dev_err(&hci->master.dev, "cannot set BE mode\n");
-				return -EOPNOTSUPP;
-			}
-		}
-	} else {
-		if (regval & HC_CONTROL_DATA_BIG_ENDIAN) {
-			regval &= ~HC_CONTROL_DATA_BIG_ENDIAN;
-			reg_write(HC_CONTROL, regval);
-			regval = reg_read(HC_CONTROL);
-			if (regval & HC_CONTROL_DATA_BIG_ENDIAN) {
-				dev_err(&hci->master.dev, "cannot clear BE mode\n");
-				return -EOPNOTSUPP;
-			}
-		}
-	}
-
 	/* Select our command descriptor model */
 	switch (FIELD_GET(HC_CAP_CMD_SIZE, hci->caps)) {
 	case 0:
@@ -762,36 +803,7 @@ static int i3c_hci_init(struct i3c_hci *hci)
 	if (hci->quirks & HCI_QUIRK_PIO_MODE)
 		hci->RHS_regs = NULL;
 
-	/* Try activating DMA operations first */
-	if (hci->RHS_regs) {
-		ret = i3c_hci_set_io_mode(hci, true);
-		if (!ret) {
-			hci->io = &mipi_i3c_hci_dma;
-			dev_dbg(&hci->master.dev, "Using DMA\n");
-		}
-	}
-
-	/* If no DMA, try PIO */
-	if (!hci->io && hci->PIO_regs) {
-		ret = i3c_hci_set_io_mode(hci, false);
-		if (!ret) {
-			hci->io = &mipi_i3c_hci_pio;
-			dev_dbg(&hci->master.dev, "Using PIO\n");
-		}
-	}
-
-	if (!hci->io) {
-		dev_err(&hci->master.dev, "neither DMA nor PIO can be used\n");
-		if (!ret)
-			ret = -EINVAL;
-		return ret;
-	}
-
-	/* Configure OD and PP timings for AMD platforms */
-	if (hci->quirks & HCI_QUIRK_OD_PP_TIMING)
-		amd_set_od_pp_timing(hci);
-
-	return 0;
+	return i3c_hci_reset_and_init(hci);
 }
 
 static int i3c_hci_probe(struct platform_device *pdev)
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
