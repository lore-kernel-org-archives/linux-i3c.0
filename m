Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F83606A331
	for <linux-i3c@archiver.kernel.org>; Fri, 27 Nov 2026 07:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=j1hu3kkq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XszrYoya
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=LmhAC6VRn4xK7f3Iophe6ZFKkBnETgwza8DzssS5WEQ=; b=j1hu3kkq+IbK4dnR7vsfEwKdbN
	JPl2Awq1bYS9685HKZiVlgNbm73ycmI+I/gREkkprzCumphOfWziedMEV0qedtKFZHkRGBtcUGZIo
	lmLifJ2EH73kFyPpwAziPo4I5Vl0pp7LNauOl8JVukB/VoRkN+Nl+vlI097zZIdHJ35p8KYwciPJc
	SZGEc+kCFpW/g/ZXqhynPGgoqXBw55MpcHvBY5Vep1aS+RiDj+exPDtoKwpt1Z/Ys/8io8XBi227i
	eSplcQ4UJ6/LjeAon6e7W1bCzZoF/E49p2qNuNrOnotW162ZpQaNOYEMy86/c/FJ8yS1ErNeA0Pgf
	KJ65PsIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqJV-0000000F6lI-3ObV;
	Fri, 27 Nov 2026 07:24:09 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqJT-0000000F6kZ-2veV
	for linux-i3c@lists.infradead.org;
	Fri, 27 Nov 2026 07:24:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795764248; x=1827300248;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CdhPn7XjVPpYlRJpk1QzpAsZZxBQ8609jkS+pXBm1O4=;
  b=XszrYoya9QHc0qL28S98CobYFMiIJ/XhFpwA+TGxraXYqkueP5S4nEL0
   U50yWErLeK/xOjX5cDDGfpeeYMfrL43vWn/wQLemvgJLopW37SbYtl4ql
   fQRBihGRzaQcKNIiCix36Tb3vPF5QeHmP9XaqfVNp5sD++6cPmVaGJAS7
   r7fenkeNQYqWeMW8o76EzXEoQTuPtZriOnVkvFDenHv658JYVrlCY3aSQ
   y0D2iIIVrj8hrMIamFefglUxIEqzOU5Kr0FcubcvejXbiP5wL95g8p3vh
   aMQKTJ88pFVKnZb7Hs7FLSCL8wzmaVNKNlyfakiirvkS1rXjZWgPuRhba
   Q==;
X-CSE-ConnectionGUID: VI5I8PiWSYGuUzsjnAJdOA==
X-CSE-MsgGUID: XzHt2X0fR8Ks7aZ/BlyC/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4759256"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4759256"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 23:24:07 -0800
X-CSE-ConnectionGUID: dRtPY4hyTmWlcVYhxOdQ9Q==
X-CSE-MsgGUID: L2C64/5sQBiBX4Aml/UYvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="12486687"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.50])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 23:24:04 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i3c: mipi-i3c-hci-pci: Skip Intel bus instance whose SCL is not muxed
Date: Fri, 27 Nov 2026 09:23:55 +0200
Message-ID: <20261127072355.26331-1-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_232407_831377_CFBEA0C8 
X-CRM114-Status: GOOD (  18.06  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Intel LPSS I3C PCI functions may expose a second bus instance even when
it is not pinned out on the platform.  When the instance's SCL pad is not
muxed to the controller, the mipi-i3c-hci driver still creates a device
for it and probe eventually fails:

  i3c intel-lpss-i3c.1: i3c_hci_process_xfer: timeout error
  mipi-i3c-hci intel-lpss-i3c.1: probe with driver mipi-i3c-hci failed with error -110

The controller's SCL input is a clock loopback.  If the SCL pad is not
muxed to the controller, the loopback input stays low, so the controller
has no clock to sample the bus with and the first CCC transfer times out.

This condition can be detected from the HCI Debug extended capability.
After reset, the PRESENT_STATE_DEBUG register reports
SCL_LINE_SIGNAL_LEVEL before the bus is enabled, and it reads low for an
instance whose SCL pad is not muxed.

Firmware does not describe which instances are pinned out, and MIPI
DisCo provides no property for it.  Detect an unconnected second instance
from the hardware instead by checking SCL_LINE_SIGNAL_LEVEL after reset.
If the second instance reports SCL low, do not create a device for it.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    | 32 +++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index 78fa42b2dc94..ea3e14c65313 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -39,6 +39,7 @@ struct mipi_i3c_hci_pci {
 	void __iomem *base;
 	const struct mipi_i3c_hci_pci_info *info;
 	struct mipi_i3c_hci_pci_instance instance[INST_MAX];
+	int instance_count;
 	void *private;
 };
 
@@ -163,6 +164,29 @@ static void intel_reset(void __iomem *priv)
 	writel(INTEL_RESETS_RESET, priv + INTEL_RESETS);
 }
 
+#define INTEL_PRESENT_STATE_DEBUG	0x24c
+#define INTEL_SCL_LINE_SIGNAL_LEVEL	BIT(0)
+
+/*
+ * BIOS enables the PCI function only if the 1st instance is enabled, but the
+ * 2nd instance may not be pinned out, in which case its probe times out.
+ */
+static void intel_check_2nd_instance(struct mipi_i3c_hci_pci *hci)
+{
+	for (int i = 1; i < hci->instance_count; i++) {
+		void __iomem *base = hci->base + hci->info->instance_offset[i];
+		u32 st = readl(base + INTEL_PRESENT_STATE_DEBUG);
+
+		/* Reads the SCL clock loopback, which is held low if SCL is not muxed */
+		if (!(st & INTEL_SCL_LINE_SIGNAL_LEVEL)) {
+			hci->instance_count = i;
+			dev_notice(&hci->pci->dev, "%s.%d: SCL not connected, skipping\n",
+				   hci->info->name, hci->info->id[i]);
+			break;
+		}
+	}
+}
+
 static int intel_i3c_init(struct mipi_i3c_hci_pci *hci)
 {
 	struct intel_host *host = devm_kzalloc_obj(&hci->pci->dev, *host);
@@ -181,6 +205,8 @@ static int intel_i3c_init(struct mipi_i3c_hci_pci *hci)
 
 	intel_reset(priv);
 
+	intel_check_2nd_instance(hci);
+
 	intel_ltr_expose(&hci->pci->dev);
 	intel_add_debugfs(hci);
 
@@ -402,14 +428,14 @@ static void mipi_i3c_hci_pci_setup_cell(struct mipi_i3c_hci_pci *hci, int idx,
 	cell->resources = &data->res;
 }
 
-#define mipi_i3c_hci_pci_alloc(h, x) kzalloc_objs(*(x), (h)->info->instance_count)
+#define mipi_i3c_hci_pci_alloc(h, x) kzalloc_objs(*(x), (h)->instance_count)
 
 static int mipi_i3c_hci_pci_add_instances(struct mipi_i3c_hci_pci *hci)
 {
 	struct mipi_i3c_hci_pci_cell_data *data __free(kfree) = mipi_i3c_hci_pci_alloc(hci, data);
 	struct mfd_cell *cells __free(kfree) = mipi_i3c_hci_pci_alloc(hci, cells);
 	int irq = pci_irq_vector(hci->pci, 0);
-	int nr = hci->info->instance_count;
+	int nr = hci->instance_count;
 
 	if (!cells || !data)
 		return -ENOMEM;
@@ -450,6 +476,8 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
 
 	hci->info = (const struct mipi_i3c_hci_pci_info *)id->driver_data;
 
+	hci->instance_count = hci->info->instance_count;
+
 	ret = hci->info->init ? hci->info->init(hci) : 0;
 	if (ret)
 		return ret;
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
