Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB29DD41C35
	for <linux-i3c@archiver.kernel.org>; Thu, 11 Dec 2025 13:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vluHt7evBLkzwIcUjbNBgj04lzNYVuYAUFaZ2vPA4F8=; b=xjrc5zmGbchaXH
	onYXLV2ZYYnC7Kk/hx+rmYE3JtqaUq4S9t8XpCX31tbpmZKp5LN82G8bBK4RZRQwGnJ9EEinx+YGX
	P6tTtZAb4tMO7Jy69+iShEbAtaUNnLxh0hSYd+7/rvZowWQQFDW3OikXSL4xOIhGw6yUpZ7td7tOn
	8T+iu7JGTz6xRvcfhP6G3kzTki9OH9h4/rDe41iMxehWO28k+rYji5MinZGvy95sN4R3XJvySBmYB
	6159TVy9YJVKbw0CMuM1i+HnlLNkcYb5raKk8RJz0Dn2+WC1lECLC70foSF8rt1DYU1cyAwVkS1nK
	kXBfIsaOxOEjcF1AQrrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTh2D-0000000GfnI-22ME;
	Thu, 11 Dec 2025 13:48:45 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTh2A-0000000Gfc2-1U5P
	for linux-i3c@lists.infradead.org;
	Thu, 11 Dec 2025 13:48:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765460922; x=1796996922;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UqXCl8infRePYttgIdyzaRVqoH7kaDeQdA8coq8TG8U=;
  b=PodN7MDa9vREiMVIsbkjxxYV1Rb5lLI4fmTP7b0bYh9cDWrSFNd6ribO
   rSZnzYUGK48g/X0tkI1vTjoDbNznuG1OgDMGSdfTuarCDmbuZaA+8FvzW
   WllvtUWZGNKPNB67ApvaxueFjgJEElG4CktjhiH6TVVGdCIcA9jtHc7fH
   LiuLWK68TQm4v94Pce/CS79efQavj95ux4rhgcd9EWF7AQGT4kzxbgZGm
   sy4AT+Sh2hb+Coz0gS+7BWyKvlT5xxBPKu7jV28FjM2zq/bcuXSEv46us
   Go6GlGbIVDaPZhbD1aqEDeQ5D69t2wDs8lY4aLz31UEmGetPe1ZASF0C/
   A==;
X-CSE-ConnectionGUID: g7Go/dNvSdyl9uywt1f/Ug==
X-CSE-MsgGUID: KQ27b+cySL6xY42RmMQkcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67481921"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="67481921"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 05:48:42 -0800
X-CSE-ConnectionGUID: d/gR3LRVTjOieJQQi1b20Q==
X-CSE-MsgGUID: zGAmJFc4S4+HW5lYcLBSjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="220171707"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.164])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 05:48:40 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V2 09/10] i3c: mipi-i3c-hci-pci: Add support for Multi-Bus Instances
Date: Thu, 11 Dec 2025 15:48:08 +0200
Message-ID: <20251211134809.75872-10-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251211134809.75872-1-adrian.hunter@intel.com>
References: <20251211134809.75872-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_054842_407307_0A1414A9 
X-CRM114-Status: GOOD (  17.24  )
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

A MIPI I3C Host Controller with the Multi-Bus Instance capability supports
multiple I3C Buses (up to 15), with one instance of the HCI Register Set
and one instance of I3C Bus Controller Logic for each I3C Bus, in a single
hardware function (e.g. PCIe B/D/F).

Create an MFD cell for each instance.  Use platform_data to pass the
instance's register set start address.

MIPI I3C specification defines an Extended Capability to hold the offset
of each instance register set.  However parsing to find that information is
relatively complicated compared with just including it in the driver data.
Do that for now.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


Changes in V2:
	Conversion to MFD split into separate patch
	Simplify ID allocation / free
	Correct use of __free()
	Also define instance 0 in driver_data


 .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    | 63 +++++++++++++++----
 1 file changed, 50 insertions(+), 13 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index 68088967942b..de1f71763786 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -19,10 +19,17 @@
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
-	int dev_id;
+	int dev_id[INST_MAX];
+	int dev_id_cnt;
 	const struct mipi_i3c_hci_pci_info *info;
 	void *private;
 };
@@ -30,6 +37,8 @@ struct mipi_i3c_hci_pci {
 struct mipi_i3c_hci_pci_info {
 	int (*init)(struct mipi_i3c_hci_pci *hci);
 	void (*exit)(struct mipi_i3c_hci_pci *hci);
+	u32 instance_offset[INST_MAX];
+	int instance_count;
 };
 
 static DEFINE_IDA(mipi_i3c_hci_pci_ida);
@@ -177,53 +186,81 @@ static void intel_i3c_exit(struct mipi_i3c_hci_pci *hci)
 static const struct mipi_i3c_hci_pci_info intel_info = {
 	.init = intel_i3c_init,
 	.exit = intel_i3c_exit,
+	.instance_offset = {0},
+	.instance_count = 1,
 };
 
+static void mipi_i3c_hci_pci_free_ids(struct mipi_i3c_hci_pci *hci)
+{
+	for (int i = 0; i < hci->dev_id_cnt; i++)
+		ida_free(&mipi_i3c_hci_pci_ida, hci->dev_id[i]);
+}
+
+static int mipi_i3c_hci_pci_alloc_ids(struct mipi_i3c_hci_pci *hci, int nr)
+{
+	for (int i = 0; i < nr; i++) {
+		hci->dev_id[i] = ida_alloc(&mipi_i3c_hci_pci_ida, GFP_KERNEL);
+		if (hci->dev_id[i]  < 0)
+			goto err_free_ids;
+		hci->dev_id_cnt = i + 1;
+	}
+
+	return 0;
+
+err_free_ids:
+	mipi_i3c_hci_pci_free_ids(hci);
+	return -ENOMEM;
+}
+
 struct mipi_i3c_hci_pci_cell_data {
 	struct mipi_i3c_hci_platform_data pdata;
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
 
 	cell->name = "mipi-i3c-hci";
-	cell->id = hci->dev_id;
+	cell->id = hci->dev_id[idx];
 	cell->platform_data = &data->pdata;
 	cell->pdata_size = sizeof(data->pdata);
 	cell->num_resources = 1;
 	cell->resources = &data->res;
 }
 
+#define mipi_i3c_hci_pci_alloc(x) kcalloc(hci->info->instance_count, sizeof(*(x)), GFP_KERNEL)
+
 static int mipi_i3c_hci_pci_add_instances(struct mipi_i3c_hci_pci *hci)
 {
-	struct mipi_i3c_hci_pci_cell_data *data __free(kfree) = kzalloc(sizeof(*data), GFP_KERNEL);
-	struct mfd_cell *cells __free(kfree) = kzalloc(sizeof(*cells), GFP_KERNEL);
+	struct mipi_i3c_hci_pci_cell_data *data __free(kfree) = mipi_i3c_hci_pci_alloc(data);
+	struct mfd_cell *cells __free(kfree) = mipi_i3c_hci_pci_alloc(cells);
 	int irq = pci_irq_vector(hci->pci, 0);
+	int nr = hci->info->instance_count;
 	int ret;
 
 	if (!cells || !data)
 		return -ENOMEM;
 
-	hci->dev_id = ida_alloc(&mipi_i3c_hci_pci_ida, GFP_KERNEL);
-	if (hci->dev_id < 0)
-		return hci->dev_id;
+	ret = mipi_i3c_hci_pci_alloc_ids(hci, nr);
+	if (ret)
+		return ret;
 
-	mipi_i3c_hci_pci_setup_cell(hci, data, cells);
+	for (int i = 0; i < nr; i++)
+		mipi_i3c_hci_pci_setup_cell(hci, i, data + i, cells + i);
 
-	ret = mfd_add_devices(&hci->pci->dev, 0, cells, 1, NULL, irq, NULL);
+	ret = mfd_add_devices(&hci->pci->dev, 0, cells, nr, NULL, irq, NULL);
 	if (ret)
 		goto err_free_ids;
 
 	return 0;
 
 err_free_ids:
-	ida_free(&mipi_i3c_hci_pci_ida, hci->dev_id);
+	mipi_i3c_hci_pci_free_ids(hci);
 	return ret;
 }
 
@@ -281,7 +318,7 @@ static void mipi_i3c_hci_pci_remove(struct pci_dev *pci)
 		hci->info->exit(hci);
 
 	mfd_remove_devices(&pci->dev);
-	ida_free(&mipi_i3c_hci_pci_ida, hci->dev_id);
+	mipi_i3c_hci_pci_free_ids(hci);
 }
 
 static const struct pci_device_id mipi_i3c_hci_pci_devices[] = {
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
