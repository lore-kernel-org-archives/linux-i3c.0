Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFFF3D148BE
	for <linux-i3c@archiver.kernel.org>; Thu,  8 Jan 2026 08:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gF+XN9p1VS8zsYgeOHNo2Nzy1wIqMJ6Bl5+PgTf6FME=; b=CyRzAG3Y3qehzm
	XVBGnjMPcIwKe72nXs7WVH154CC2hetc5Sh61QNAtH+GwsFyEjq/As6FuaIPDfGY1Uisgs/9UjC4L
	j8d8u+QCUT324hiIyCRcrqd430ybfKi8rKm2BBK3di4nfg+SejUVukXaY31CF9y/98FekpBJjX4Z6
	fAgSPg99Wcdcd+hDDeiTXzb0AxSEbo0njhqG0ymFR1OTdNsD+PmUPY7b0xHmOnTL+2qBe1X/4k8vo
	ayfiOTuGe/dPVhP3ogaCNQ4rdoxwGkDzNERUMwEMSlCTS0/lbwQShRGrUsmy9uQriiWMk3E73O+bt
	WbVeA4OV/+illQWWZOvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdl2f-0000000GDMB-40id;
	Thu, 08 Jan 2026 08:06:50 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdl2X-0000000GDGR-0bT8
	for linux-i3c@lists.infradead.org;
	Thu, 08 Jan 2026 08:06:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767859601; x=1799395601;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qWHU0HW6oZfynkVdQN1nvV7sAmDjE9s6poJgKkcgav8=;
  b=HmVhcf3tUtVar0/tLk38V1823tpM0jBXkcy9mXckIOaKhC/anI5EVFJY
   194SghtJ/GE0aSoZCHshmJl1sbjmzBq5lxhr3SNSyw3mKRAV55cTSCnSB
   L/rSN7vuxZXDIUmjn7YE8CQ/yGC5stYG2scaGAolf3UzfGz9UcvIo8hIm
   RsZM2aJOdSxAVFLnJy3RxpQrLAXDODOAobpok7I4vQi4TZC3ROfzzOs80
   qkqyC40QcKi+7/UTJCvyKt4SbpyLik0t2H68ODlKZVh/Ky3dqpbBbQ1Ae
   cF4AcCuzmBhQcAvK/XeCLrYTVPXpR6Y/whZNEbO16+ehF0RqGn0UdRgae
   g==;
X-CSE-ConnectionGUID: GnVGSVe6S3mnF2OGCOGuLA==
X-CSE-MsgGUID: gFHp/Ny9QX6wzFohVnH9aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="56792340"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="56792340"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:06:41 -0800
X-CSE-ConnectionGUID: ztnxJOR4SzWU0OsjSVsdmQ==
X-CSE-MsgGUID: vYMMi5DYQUqS8WZI9x1rdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="203413624"
Received: from abityuts-desk.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.195])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:06:39 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH V2 15/20] i3c: mipi-i3c-hci: Factor out IO mode setting into helper
Date: Thu,  8 Jan 2026 10:05:53 +0200
Message-ID: <20260108080558.21767-16-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260108080558.21767-1-adrian.hunter@intel.com>
References: <20260108080558.21767-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_000647_038675_EC898A38 
X-CRM114-Status: GOOD (  11.38  )
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

Prepare for future reuse.  Move the IO mode setting logic from
i3c_hci_init() into a dedicated helper function, i3c_hci_set_io_mode().

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


Changes in V2:

	New patch


 drivers/i3c/master/mipi-i3c-hci/core.c | 45 ++++++++++++++++++--------
 1 file changed, 31 insertions(+), 14 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 3b0609cb7da7..569c8584045a 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -613,9 +613,35 @@ static int i3c_hci_software_reset(struct i3c_hci *hci)
 	return 0;
 }
 
+static inline bool is_version_1_1_or_newer(struct i3c_hci *hci)
+{
+	return hci->version_major > 1 || (hci->version_major == 1 && hci->version_minor > 0);
+}
+
+static int i3c_hci_set_io_mode(struct i3c_hci *hci, bool dma)
+{
+	bool pio_mode;
+
+	if (dma)
+		reg_clear(HC_CONTROL, HC_CONTROL_PIO_MODE);
+	else
+		reg_set(HC_CONTROL, HC_CONTROL_PIO_MODE);
+
+	if (!is_version_1_1_or_newer(hci))
+		return 0;
+
+	pio_mode = reg_read(HC_CONTROL) & HC_CONTROL_PIO_MODE;
+	if ((dma && pio_mode) || (!dma && !pio_mode)) {
+		dev_err(&hci->master.dev, "%s mode is stuck\n", pio_mode ? "PIO" : "DMA");
+		return -EIO;
+	}
+
+	return 0;
+}
+
 static int i3c_hci_init(struct i3c_hci *hci)
 {
-	bool size_in_dwords, mode_selector;
+	bool size_in_dwords;
 	u32 regval, offset;
 	int ret;
 
@@ -732,20 +758,14 @@ static int i3c_hci_init(struct i3c_hci *hci)
 		return -EINVAL;
 	}
 
-	mode_selector = hci->version_major > 1 ||
-				(hci->version_major == 1 && hci->version_minor > 0);
-
 	/* Quirk for HCI_QUIRK_PIO_MODE on AMD platforms */
 	if (hci->quirks & HCI_QUIRK_PIO_MODE)
 		hci->RHS_regs = NULL;
 
 	/* Try activating DMA operations first */
 	if (hci->RHS_regs) {
-		reg_clear(HC_CONTROL, HC_CONTROL_PIO_MODE);
-		if (mode_selector && (reg_read(HC_CONTROL) & HC_CONTROL_PIO_MODE)) {
-			dev_err(&hci->master.dev, "PIO mode is stuck\n");
-			ret = -EIO;
-		} else {
+		ret = i3c_hci_set_io_mode(hci, true);
+		if (!ret) {
 			hci->io = &mipi_i3c_hci_dma;
 			dev_dbg(&hci->master.dev, "Using DMA\n");
 		}
@@ -753,11 +773,8 @@ static int i3c_hci_init(struct i3c_hci *hci)
 
 	/* If no DMA, try PIO */
 	if (!hci->io && hci->PIO_regs) {
-		reg_set(HC_CONTROL, HC_CONTROL_PIO_MODE);
-		if (mode_selector && !(reg_read(HC_CONTROL) & HC_CONTROL_PIO_MODE)) {
-			dev_err(&hci->master.dev, "DMA mode is stuck\n");
-			ret = -EIO;
-		} else {
+		ret = i3c_hci_set_io_mode(hci, false);
+		if (!ret) {
 			hci->io = &mipi_i3c_hci_pio;
 			dev_dbg(&hci->master.dev, "Using PIO\n");
 		}
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
