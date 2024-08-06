Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F4B6C3DA64
	for <linux-i3c@archiver.kernel.org>; Tue,  6 Aug 2024 07:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bbVG/gS+UR7iQrxdLf7i1ubSaXBUI6VesDS28Nrio8o=; b=3M6/IWAFEK7ZvW
	r6dIVZ0FGJvAyVDP9Jyk/ER8oNdDVQNNy2wd3VK12ZEg7zXlWCnq0R3jksd0/OGJUsLHfRAY9S6Rd
	mQs8WpQmnoh09v9UY6EY6XMGgEfqL/36D+dC49Vp+Ugew9+dP0TQBw1/Qj+pGhx2uQUH5Yi37DwCa
	N1qlvk9x1MnLMpL1+EssGBuu26Qw3Uyz6raVlL3cvZq+11hcZrJ3kFrt8atA6b+Y58p9aYIzdvh+M
	Rh2q4DqozDtG0QdTgkkAcVQl7FPrfQmlUwJ1lmjK4K6gtYXHBgTQQB38gBv+zy0hbdE5pFAlzuW6e
	ilByhklYqnNQx5buJAlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbF6I-00000000rQe-0FSu;
	Tue, 06 Aug 2024 07:59:22 +0000
Received: from mail-dm6nam11on20601.outbound.protection.outlook.com ([2a01:111:f403:2415::601] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbF6E-00000000rP1-0nXy
	for linux-i3c@lists.infradead.org;
	Tue, 06 Aug 2024 07:59:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N3KPo5DcFcERSaeM6JHuF8fDoKf+0CMsSCscyTDNcWqGf2IYxKcMGgPQ6XiHlG9R2XtZD4yqhFUGcH8z1Jcf8a5Ewu6CGwnZfB9SLcwr9xRqfhZusJKbXlEwyHqK869brWrFgFmty/rxr8jHuXquj+00pryocXhHbZynBm66F9uiQEpeK9p2/PYM7lYy5ZQNddwm4HiFkJ9ehonQxbohj/0grI6YW7S+iVwjOpILArk2VoaG0++tOkoL0wL887vbdXF/TGnvdxdW3d8xgWPZ63zBxLKsUBqJfabqPvwxDeDPGwFVI9rQ/YUYNSUEXP4eyTuyTAYG/tyk8pnYxPGESw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T0GJCDR9Gk85YbbUGbevrx9NjsFokBCv/AO2dZhpGe0=;
 b=nmS2trdNn80/b/ydI1HPFeE3cs2rPAkST+eJrOW+1+6nHZZyBfGSB3pqNmQOSgLPZIk8ipgObZmO8rTOjSCh2v6ZGzCnHwx9OJQXk2I0X7FJhqgYyD6cEb/Vmcw3Wk+Fi+/V9HR3OOlYTzxQkOz8FPSCRi9Ksy3mQOf5WhlNuWJwQ5eUoFqNDQDMstEGxHHA/+Ypmy8lZIV3h5nKY9lww/7w7oLCJj0/xhKAJstqEfBbXrewRobBM5Nigvr06r0Gqeol15q9cEgcx4hrpxlMPYKdxce9fY4nPpZIp2J3IFqAN52IRgXnrmfLXwjUC01SfSWowXQCChz51Udbwguohg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T0GJCDR9Gk85YbbUGbevrx9NjsFokBCv/AO2dZhpGe0=;
 b=3uyyqgTJNsV9SnwLjhP5UfI2ycy+JjADSXJHsLxCLVuEnSuDvFPHH0wPcw+pQ6wxBbLdXXIfnHqJYz5HadcLQA6TnGSdEpgOqf9QK0OESoyd0DM5QHyee7inZtmtUZ7ecqY2nC9jX93dCQO7AELhmhYkPyl8Jps5t2NIa3h88xQ=
Received: from SA0PR12CA0018.namprd12.prod.outlook.com (2603:10b6:806:6f::23)
 by PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Tue, 6 Aug
 2024 07:59:11 +0000
Received: from SN1PEPF0002BA51.namprd03.prod.outlook.com
 (2603:10b6:806:6f:cafe::5) by SA0PR12CA0018.outlook.office365.com
 (2603:10b6:806:6f::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21 via Frontend
 Transport; Tue, 6 Aug 2024 07:59:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA51.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Tue, 6 Aug 2024 07:59:11 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 6 Aug
 2024 02:59:08 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jarkko Nikula
	<jarkko.nikula@linux.intel.com>
CC: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>, Krishnamoorthi M
	<krishnamoorthi.m@amd.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 2/5] i3c: mipi-i3c-hci: Add a quirk to set PIO mode
Date: Tue, 6 Aug 2024 13:28:40 +0530
Message-ID: <20240806075843.277969-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240806075843.277969-1-Shyam-sundar.S-k@amd.com>
References: <20240806075843.277969-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA51:EE_|PH7PR12MB5974:EE_
X-MS-Office365-Filtering-Correlation-Id: 88ddffc6-7980-41fa-3a25-08dcb5eda832
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9KXgdUmN1tbIHcNWiZg+MpNw/qSWTPjVZrnOfMnNFUNw3EAdH4YkjhGO7VBa?=
 =?us-ascii?Q?rakGAXwcsWC2PGoLEco8jTqBcm9qo8B8ONetyMr0eAXJS5n6gW4S2EErga9Q?=
 =?us-ascii?Q?K5CNjrlLJZICbrHTt8Y14KfuBnpX8sonNsubWLdjjG8rCpzfYyj5Jvu84I3S?=
 =?us-ascii?Q?V3bBFvp1PQnexX0LyCEI7TB6DXVzEzhFvtaFZoqzGtZ396U4PJQ0XUBI2gft?=
 =?us-ascii?Q?J9Rtw5uahFqKOOOUoKBf2Ubgf5I604P/LS7gBR5VcC7S2RlVlbj6Y6MN3m0v?=
 =?us-ascii?Q?F5+g2XesXcVDHEAK4rNJkp1t/ZaIu5qcAgYmmL2VeJ/lI6diDE+IGYcVxKUx?=
 =?us-ascii?Q?0NVEuoGDSkMZU8uWkuzjzo04No4UvOwz4PtEKV5bXiCXpjtV0Ta0IjVso03B?=
 =?us-ascii?Q?owU38eSAkF7nnktQfCTMcJf3bcLc+ftuGVgJ5JmufKiu2eK5cUsiqDSNyTsB?=
 =?us-ascii?Q?sPpRGbrpZP8ev4idMf9AYVYY7ZyDi2m9/JVbdubqUvM9eOM5qi6jL0It2RWA?=
 =?us-ascii?Q?xUpNROLoRdYm5O+9+DNkufUADOUfsRnGddNe1hgk/AthbT0R4pbdP9THc7q7?=
 =?us-ascii?Q?IB4lIHUULqIoAC4IEjZM5w4XLn/09fcp7zmxVJfbWRC03p3igoHXfdehStVI?=
 =?us-ascii?Q?e9ZOAopHM95exeY+J/d+lFL80+b82ik1rz1Q/K3nqwTUpPUGn7llMBn6P91r?=
 =?us-ascii?Q?Gs4p+7cElGpHRwvb+WFg1GY9L/I07+e9V6XyOcMqtT7xwc1V6hXmiSKaQgvb?=
 =?us-ascii?Q?0QqfPgilcOCuM0q+aNwwj/GkH436tb53noeLJp1D6lOI7ug306HdwC/0taxa?=
 =?us-ascii?Q?D4W1KbmnwNo7GW4UAR6X3MgxtGQg+cCysE/lCU9v7opB1Vt5yCkLmvvNx+Q8?=
 =?us-ascii?Q?SRFcvp73svU8yWS/t+J3U3s41rF7o7i9ouWhU8aAcdpgul8dGx+b5Y0xWU0w?=
 =?us-ascii?Q?4a53PDi09fGwZ3NiEeg/xie+blDop6Qq2GoRm1tjK1FEdcDvtjdsn4OiQ16R?=
 =?us-ascii?Q?9qmO82tAEdqAGoJ0/MIlExKXaJDj3w8ejNmgVRBbTXv1sxNEs2jM70T58RY5?=
 =?us-ascii?Q?oocRzWg73Zlwkn1/E321q8I/IkIWuflQjA2jBRvNfePNFIvl0QuQS591+1sd?=
 =?us-ascii?Q?S1RQuIHNz6eD9eANk06wLKKmOcQvtoKiEhc2g1cSaxsLMUz5lcX/+d1DsKk1?=
 =?us-ascii?Q?lEp9VO3230PGV4dOT20toQmrhE0OeDlPa8zyWNrMyk0XPF/2Y34PxEWnk/Cw?=
 =?us-ascii?Q?6VUH7EiBeR4m8JMgy9cVnOqMTVKcZVER1ByhwFJBz8uSA2jU58cCcolD/4MN?=
 =?us-ascii?Q?WolXYdTuG0B+azliMqocYi50XcZqLJAcCsoPWQ4x8em0P9MDTh1tp/hZlOB+?=
 =?us-ascii?Q?ZvBH3Nv3Eo7oXUpfqYoF+DF9oQtyd/yeRNCNEX9OoUxRh6j77FIaHK4LFYtU?=
 =?us-ascii?Q?hHpEBoHgRoDY4Lt21dwA+SzvTosNFUGA?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 07:59:11.2883
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88ddffc6-7980-41fa-3a25-08dcb5eda832
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA51.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5974
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_005918_261302_EDDBE457 
X-CRM114-Status: GOOD (  20.25  )
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

The AMD HCI controller currently only supports PIO mode but exposes DMA
rings to the OS, which leads to the controller being configured in DMA
mode. To address this, add a quirk to avoid configuring the controller in
DMA mode and default to PIO mode.

Additionally, introduce a generic quirk infrastructure to the mipi-i3c-hci
driver to facilitate seamless future quirk additions.

Co-developed-by: Krishnamoorthi M <krishnamoorthi.m@amd.com>
Signed-off-by: Krishnamoorthi M <krishnamoorthi.m@amd.com>
Co-developed-by: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>
Signed-off-by: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/i3c/master/mipi-i3c-hci/Makefile     |  3 ++-
 drivers/i3c/master/mipi-i3c-hci/core.c       | 15 ++++++++++++++-
 drivers/i3c/master/mipi-i3c-hci/hci.h        |  3 +++
 drivers/i3c/master/mipi-i3c-hci/hci_quirks.c | 20 ++++++++++++++++++++
 4 files changed, 39 insertions(+), 2 deletions(-)
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/hci_quirks.c

diff --git a/drivers/i3c/master/mipi-i3c-hci/Makefile b/drivers/i3c/master/mipi-i3c-hci/Makefile
index a658e7b8262c..1f8cd5c48fde 100644
--- a/drivers/i3c/master/mipi-i3c-hci/Makefile
+++ b/drivers/i3c/master/mipi-i3c-hci/Makefile
@@ -3,4 +3,5 @@
 obj-$(CONFIG_MIPI_I3C_HCI)		+= mipi-i3c-hci.o
 mipi-i3c-hci-y				:= core.o ext_caps.o pio.o dma.o \
 					   cmd_v1.o cmd_v2.o \
-					   dat_v1.o dct_v1.o
+					   dat_v1.o dct_v1.o \
+					   hci_quirks.o
diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 5ef848833a81..7843a3ac2121 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -33,6 +33,7 @@
 #define reg_clear(r, v)		reg_write(r, reg_read(r) & ~(v))
 
 #define HCI_VERSION			0x00	/* HCI Version (in BCD) */
+#define HCI_VERSION_V1			0x100	/* MIPI HCI Version number V1.0 */
 
 #define HC_CONTROL			0x04
 #define HC_CONTROL_BUS_ENABLE		BIT(31)
@@ -753,6 +754,14 @@ static int i3c_hci_init(struct i3c_hci *hci)
 		return -EINVAL;
 	}
 
+	/* Initialize quirks for AMD platforms */
+	amd_i3c_hci_quirks_init(hci);
+
+	regval = reg_read(HCI_VERSION);
+
+	if (hci->quirks & HCI_QUIRK_PIO_MODE)
+		hci->RHS_regs = NULL;
+
 	/* Try activating DMA operations first */
 	if (hci->RHS_regs) {
 		reg_clear(HC_CONTROL, HC_CONTROL_PIO_MODE);
@@ -768,7 +777,11 @@ static int i3c_hci_init(struct i3c_hci *hci)
 	/* If no DMA, try PIO */
 	if (!hci->io && hci->PIO_regs) {
 		reg_set(HC_CONTROL, HC_CONTROL_PIO_MODE);
-		if (!(reg_read(HC_CONTROL) & HC_CONTROL_PIO_MODE)) {
+		/*
+		 * HC_CONTROL_PIO_MODE bit not present in HC_CONTROL register w.r.t V1.0
+		 * specification. So skip checking PIO_MODE bit status
+		 */
+		if (regval > HCI_VERSION_V1 && !(reg_read(HC_CONTROL) & HC_CONTROL_PIO_MODE)) {
 			dev_err(&hci->master.dev, "DMA mode is stuck\n");
 			ret = -EIO;
 		} else {
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index f94d95e024be..91e8a3833f3d 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci.h
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -135,6 +135,7 @@ struct i3c_hci_dev_data {
 
 /* list of quirks */
 #define HCI_QUIRK_RAW_CCC	BIT(1)	/* CCC framing must be explicit */
+#define HCI_QUIRK_PIO_MODE	BIT(2)  /* Set PIO mode for AMD platforms */
 
 
 /* global functions */
@@ -142,4 +143,6 @@ void mipi_i3c_hci_resume(struct i3c_hci *hci);
 void mipi_i3c_hci_pio_reset(struct i3c_hci *hci);
 void mipi_i3c_hci_dct_index_reset(struct i3c_hci *hci);
 
+void amd_i3c_hci_quirks_init(struct i3c_hci *hci);
+
 #endif
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci_quirks.c b/drivers/i3c/master/mipi-i3c-hci/hci_quirks.c
new file mode 100644
index 000000000000..8a8fbd697175
--- /dev/null
+++ b/drivers/i3c/master/mipi-i3c-hci/hci_quirks.c
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * I3C HCI Quirks
+ *
+ * Copyright 2024 Advanced Micro Devices, Inc.
+ *
+ * Authors: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+ *			Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>
+ */
+
+#include <linux/i3c/master.h>
+#include "hci.h"
+
+void amd_i3c_hci_quirks_init(struct i3c_hci *hci)
+{
+#if defined(CONFIG_X86)
+	if (boot_cpu_data.x86_vendor == X86_VENDOR_AMD)
+		hci->quirks |= HCI_QUIRK_PIO_MODE;
+#endif
+}
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
