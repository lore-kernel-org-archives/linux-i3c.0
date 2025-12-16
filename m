Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC3CED609D2
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Dec 2025 16:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xx2C6HyPvXuaxFASigws/n/mUimR5UVdTSlLM4bAOEg=; b=IZpPefcxTO9gbj
	O9Un31cGpZbafY8KgeHbwHbP2SHsg1SQ1CVP9ajIgDs3mmPE8XvxK9TZ8paJT/+JiIEDkmKBcRgDG
	b+nc/7ZoroCqTpA21q0SsTi6pwFVdTPPX1bhFd+7QRmvwjXYTSWcZvEuVl2bSo7tbAh4TiPqz/F9E
	EZy1xtIWCKok78lwlRh12AaHIsmdyl1AcpqxWkdZEePh/oQkWKy+4Sg68jlkAkU1l0kuN5Unw53HI
	igevnmUf3ioaHPvrElYiJyAi3Anak7AoCQp/bMmLv1tVne4Nqo56XzC6pZoEpNN7G963R1DI/pmAA
	lTl/BlCKKtklGv5V8Jcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYMK-00000005ZWo-1Xjn;
	Tue, 16 Dec 2025 16:57:12 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYMH-00000005ZNb-2K1Y
	for linux-i3c@lists.infradead.org;
	Tue, 16 Dec 2025 16:57:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765904229; x=1797440229;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jpR16wg0Aax4ey4UUQPe54YX4srmjtqLjtAImyiSI88=;
  b=Wc7ZG6Hhtl39tOr4BCz7k6oUWK0wSJkefAsRSkcyCh5TCcr/G+9CUnSJ
   b8b6UJAE3oHfUiDQEJmZj9Z/5Ha73Jv0bjoVTfF88uZvDK3SY1nt3KzaT
   7xgqiAHSsqWB5Cb8JdBEbKJ0xiThLFA7q+EtrETueAHoN9Nqh3fqO8mVO
   Bnq98Fimxw0AYy7b30mqOKHqqyhuCD5mfdpC8UPcH3JS7hW7jAfY+K11X
   KZCGin3JeZ14LGlh8BLqKDXfksooEOg+1IVGnCwO6ocmVGhT7H+Q5Ardc
   pptv7lP3p2+uu6PrpRinTjPSZ0qxs16OB23AQOMDhJnCvBImoaOt3QsP1
   g==;
X-CSE-ConnectionGUID: CrYUhDJOQuaHXPEF0km0bw==
X-CSE-MsgGUID: ge72rHs8TSS8PuhucBT+hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="78466777"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="78466777"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 08:57:09 -0800
X-CSE-ConnectionGUID: lPSYr687QcyN8bMoVqQK6w==
X-CSE-MsgGUID: 0eQZDhuxQDaLBP8TPNe33A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="197817720"
Received: from rvuia-mobl.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.195])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 08:57:08 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V3 10/11] i3c: mipi-i3c-hci-pci: Add support for Multi-Bus Instances
Date: Tue, 16 Dec 2025 18:56:41 +0200
Message-ID: <20251216165642.164583-11-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251216165642.164583-1-adrian.hunter@intel.com>
References: <20251216165642.164583-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_085709_602694_8D42D144 
X-CRM114-Status: GOOD (  15.22  )
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

Add support for MIPI I3C Host Controllers with the Multi-Bus Instance
capability.  These controllers can host multiple I3C buses (up to 15)
within a single hardware function (e.g., PCIe B/D/F), providing one
indepedent HCI register set and corresponding I3C bus controller logic
per bus.

Create an MFD cell for each instance and use platform_data to pass the
starting address of the instance's register set.

The MIPI I3C HCI specification defines an Extended Capability that holds
the offset of each instance register set.  Parsing this information is
relatively complex, so include the offsets in driver data for now.

Driver data for additional instances beyond instance 0 will be added in a
subsequent patch.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


Changes in V3:

	Make hci a parameter of mipi_i3c_hci_pci_alloc()
	Adjust for doing away with dynamic devid allocation
	Enhance commit message

Changes in V2:
	Conversion to MFD split into separate patch
	Simplify ID allocation / free
	Correct use of __free()
	Also define instance 0 in driver_data


 .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    | 36 +++++++++++++------
 1 file changed, 26 insertions(+), 10 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index 7ef17255c312..782f46989423 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -19,6 +19,12 @@
 #include <linux/platform_device.h>
 #include <linux/pm_qos.h>
 
+/*
+ * There can up to 15 instances, but implementations have at most 2 at this
+ * time.
+ */
+#define INST_MAX 2
+
 struct mipi_i3c_hci_pci {
 	struct pci_dev *pci;
 	void __iomem *base;
@@ -30,7 +36,9 @@ struct mipi_i3c_hci_pci_info {
 	int (*init)(struct mipi_i3c_hci_pci *hci);
 	void (*exit)(struct mipi_i3c_hci_pci *hci);
 	const char *name;
-	int id;
+	int id[INST_MAX];
+	u32 instance_offset[INST_MAX];
+	int instance_count;
 };
 
 #define INTEL_PRIV_OFFSET		0x2b0
@@ -177,14 +185,18 @@ static const struct mipi_i3c_hci_pci_info intel_1_info = {
 	.init = intel_i3c_init,
 	.exit = intel_i3c_exit,
 	.name = "intel-lpss-i3c",
-	.id = 0,
+	.id = {0},
+	.instance_offset = {0},
+	.instance_count = 1,
 };
 
 static const struct mipi_i3c_hci_pci_info intel_2_info = {
 	.init = intel_i3c_init,
 	.exit = intel_i3c_exit,
 	.name = "intel-lpss-i3c",
-	.id = 2,
+	.id = {2},
+	.instance_offset = {0},
+	.instance_count = 1,
 };
 
 struct mipi_i3c_hci_pci_cell_data {
@@ -192,34 +204,38 @@ struct mipi_i3c_hci_pci_cell_data {
 	struct resource res;
 };
 
-static void mipi_i3c_hci_pci_setup_cell(struct mipi_i3c_hci_pci *hci,
+static void mipi_i3c_hci_pci_setup_cell(struct mipi_i3c_hci_pci *hci, int idx,
 					struct mipi_i3c_hci_pci_cell_data *data,
 					struct mfd_cell *cell)
 {
-	data->pdata.base_regs = hci->base;
+	data->pdata.base_regs = hci->base + hci->info->instance_offset[idx];
 
 	data->res = DEFINE_RES_IRQ(0);
 
 	cell->name = hci->info->name;
-	cell->id = hci->info->id;
+	cell->id = hci->info->id[idx];
 	cell->platform_data = &data->pdata;
 	cell->pdata_size = sizeof(data->pdata);
 	cell->num_resources = 1;
 	cell->resources = &data->res;
 }
 
+#define mipi_i3c_hci_pci_alloc(h, x) kcalloc((h)->info->instance_count, sizeof(*(x)), GFP_KERNEL)
+
 static int mipi_i3c_hci_pci_add_instances(struct mipi_i3c_hci_pci *hci)
 {
-	struct mipi_i3c_hci_pci_cell_data *data __free(kfree) = kzalloc(sizeof(*data), GFP_KERNEL);
-	struct mfd_cell *cells __free(kfree) = kzalloc(sizeof(*cells), GFP_KERNEL);
+	struct mipi_i3c_hci_pci_cell_data *data __free(kfree) = mipi_i3c_hci_pci_alloc(hci, data);
+	struct mfd_cell *cells __free(kfree) = mipi_i3c_hci_pci_alloc(hci, cells);
 	int irq = pci_irq_vector(hci->pci, 0);
+	int nr = hci->info->instance_count;
 
 	if (!cells || !data)
 		return -ENOMEM;
 
-	mipi_i3c_hci_pci_setup_cell(hci, data, cells);
+	for (int i = 0; i < nr; i++)
+		mipi_i3c_hci_pci_setup_cell(hci, i, data + i, cells + i);
 
-	return mfd_add_devices(&hci->pci->dev, 0, cells, 1, NULL, irq, NULL);
+	return mfd_add_devices(&hci->pci->dev, 0, cells, nr, NULL, irq, NULL);
 }
 
 static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
