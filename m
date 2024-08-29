Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61EB9C71135
	for <linux-i3c@archiver.kernel.org>; Thu, 29 Aug 2024 09:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j1XtVk/ZW9KatoGFEIKz9w8RjsUrbEl0z8oyc1B1MwQ=; b=4oKV8t+JrGSIVM
	DnRE/Foaser6aDQVWUfRL1bTM67zGLyEiJ7U2GqwGlBOd1mQ75uwTkdP90fUqOGW4M5N/gRW75i7O
	yhqE2WqeyGJWzf9iwy9/lYeYVpD20yjDucvqRE83Axxcx2uMKWIo0jWThpGmcZJiKsmpNkfX2vqDc
	sv1kCuBsMjfjQmEMvsw1v9Tgo5Ut1Cvmn2ufto32PwVfMQTCNAs0vG6DT2EZqRNRBilsiIS2fvERb
	gKy/ed/t3D8wkfRvt0HwS5tS1Fy1M0WLgJ1RKZtJKR8eqK/4z4Kld3miAi64X3vrggJEehjUopbD9
	v6jCnCXgQn6oUBym8jCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjbID-00000001KKS-3vr9;
	Thu, 29 Aug 2024 09:18:13 +0000
Received: from mail-sn1nam02on20615.outbound.protection.outlook.com ([2a01:111:f400:7ea9::615] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjbI9-00000001KHZ-2y4B
	for linux-i3c@lists.infradead.org;
	Thu, 29 Aug 2024 09:18:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MiXutxEhF8IGCiHpxgeNcFwJyDcTsg6xjuApPnW6ZAlZ0qqueMiPHUu9/RpwegWfvUdo25Ih+pggPvxOdc96bYSt7NTyIWd9FRceG/67YF1Lih/0tYZ4dJtU4H432xywiXGbYo1hBkbmi3LiLeCuXCdK5nCyKHvtY3nyib84lkWxhhJElUaHuDdZKIZvqBhK8pZSLqLRFuXqq8r3dxZcHUhdy7f0baou34wkRPreKz8FezRfnsmLZ/7De0LmfXo13PvgpUcrlW3zYIAN3sPRrD+7Hp7kYtkXRJiuWpEf8NVHvHD+i2EV0VALoJJp31otWfFhJ6BNYBIjWXeiBDxpSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q2OubIrnw3mxMYjtKeePPgIRHDcp4lFIbTDrZYRDziA=;
 b=xVnN4pSKcG1hk4sCWWmviI64lRBuQXMaohOt7+/PTN/kf6i7KPkh830kb0EEz4E0tsA8+5EyCPKI6pEUokkyhcHknpqRZxu1iKkWdxDdXMGY9e/kPzOBqvQuN+vb4ygsmehRNo71AjJZiKqvepQw6WxZs+CHT0A12dAH0wAfazT8UV7FJIosaeCHPmIOYVw3yHY67deARY9Y+dNAVZNTWlQznbl32kMVu0q8H3UA1iFObHr/mCyukpORJQEkIGPdpqKjOd3jy4C/bFbNF/WBp01tBs4JqSR7m3HSOcd8U8mA81jPHIc+4yqa+B75iseaCTmky3zTmwPeDzdmDiffCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q2OubIrnw3mxMYjtKeePPgIRHDcp4lFIbTDrZYRDziA=;
 b=CAwG3k6lIiSC1pdHlC7ooCmc1mkiE7zunjdSJq3vAtteB078cfUT5Ar7mMKYmvvqOpGp+WtQTkcQ1cpkOw84bSGB7rXtUGjMWLJZsZMmnpVR7aJwSKjtUxuzPWm5eee1x6mP8sKs9ZZqWBHRuFNoXmSnhRcPldeBeNXIcbnBy84=
Received: from BN9PR03CA0950.namprd03.prod.outlook.com (2603:10b6:408:108::25)
 by SJ1PR12MB6122.namprd12.prod.outlook.com (2603:10b6:a03:45b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Thu, 29 Aug
 2024 09:18:03 +0000
Received: from BN2PEPF000055DF.namprd21.prod.outlook.com
 (2603:10b6:408:108:cafe::56) by BN9PR03CA0950.outlook.office365.com
 (2603:10b6:408:108::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20 via Frontend
 Transport; Thu, 29 Aug 2024 09:18:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DF.mail.protection.outlook.com (10.167.245.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7939.2 via Frontend Transport; Thu, 29 Aug 2024 09:18:03 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 29 Aug
 2024 04:17:57 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jarkko Nikula
	<jarkko.nikula@linux.intel.com>
CC: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>, Krishnamoorthi M
	<krishnamoorthi.m@amd.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v6 5/6] i3c: mipi-i3c-hci: Add a quirk to set timing parameters
Date: Thu, 29 Aug 2024 14:47:12 +0530
Message-ID: <20240829091713.736217-6-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240829091713.736217-1-Shyam-sundar.S-k@amd.com>
References: <20240829091713.736217-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DF:EE_|SJ1PR12MB6122:EE_
X-MS-Office365-Filtering-Correlation-Id: d73b7506-9024-4cc0-ed4e-08dcc80b7c2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cSzIoiOnOZRC2afiStD4dcYs6nvuh9nTzYumt7MLgSkfhkRD2yPVvd4JwoEK?=
 =?us-ascii?Q?tEqdFscaMHB4Bvc7shZ0c1EF+mgURBhdkLfn0xxA9lreifkNuvFYhvI84V3f?=
 =?us-ascii?Q?BT4TCNSsRpbvoq0/4HJIzTyYS70ukm1YSUZVLpJk79kPRLGHoiaAUSgQ/qYA?=
 =?us-ascii?Q?AP2tHGxC0yfh3+J/aA86TsKg+VytrBknk0pVDZdJB0THtfkey1vwf6PZNIZC?=
 =?us-ascii?Q?EU6mWO9fH8KZqi9+BWmofn4lmmVx7HMEzdWBkx5foIpugjkrT7TbSRlo8c3j?=
 =?us-ascii?Q?i+D2W51Y2HwuMB+O30K2JlNVmY5A6SxKEN/8Xs2Nf1qBdEOrw34YafUfwQSL?=
 =?us-ascii?Q?OqMfaIO3k4SNIEuVy2SrYD9bAGatO4djmT0dZAZUAE37D8Nu+TDMfpZCeAXa?=
 =?us-ascii?Q?gQBlf6KcGw2GzrdR3VSSpZ27ey6XOPxHFMHl6LyHSFAqIEribg9CLcNKJEwa?=
 =?us-ascii?Q?4pVJboP+OxNzRN16GgJPcpcXNMIcTqtXbWdCYDEcRdYJI2WJ9tQDM90f5haE?=
 =?us-ascii?Q?0fjDSkHsD0g95+V6ZqEIEVeOSnVHGwmWx6EOXyDE4hK8nrw2/ccCfUU4TiXU?=
 =?us-ascii?Q?D3ccrdRgQ4eKb/zgnMPnBvx4tj6r+Go416y90Bhm86lxqZffRE4eYadhGBwx?=
 =?us-ascii?Q?dmbmwFiqqEbuOE1nI9esDyv4PfSD6IS8lyjME3N1WroDuPaRzCr4VWswX9e3?=
 =?us-ascii?Q?i1fffzLo+CQ2PjjOYLIjDY92HeVvjrM19+75We02ic76i/jThhY7apKyWWky?=
 =?us-ascii?Q?ssQWdW1510uk1Y1M9eRpSPuE1XeRWVxN3eXLrsaQzfPQcYZ2A3UTBSmn55+C?=
 =?us-ascii?Q?2GQacpWlr/ngr8LXrDG6n0NXYY5S19z1inKW4r2oyaWFvNAFqf4EtDnoVywV?=
 =?us-ascii?Q?sp2rUF+5nvDZh9ap2/LvlSF+ZP/rBX6u82DIueKJm4qgMDUjVg312bS3WfQ/?=
 =?us-ascii?Q?HqmOr7izaURWjmK2baBjltBhrA/9RBqymOX82jvwye7VfXLK9LBMGslbdSwb?=
 =?us-ascii?Q?2dSEWskmnQ3QzHCMg6TXhjlEYUVwgxPO7iapMWv1n+6znXWUQB6G+QdBqP5O?=
 =?us-ascii?Q?R0PBsjMxSbeU2n4KfHLg6OCwSNtQv0g9N7bMGM3FGhi7pT8hxyf4LK0fQldb?=
 =?us-ascii?Q?iZCnOacftHQcvG9lJhAPZwYbrpD/EVp2oDqt1ZW/u0PFtXB4r//2NXrAdj/r?=
 =?us-ascii?Q?EIv/lhYPXAf4BI9utOLaOLhnTCvPb6Yb8dQKA0GX1zXXZqVUkuTAGTudc5z/?=
 =?us-ascii?Q?uJTxJ/NRyzJya6D4sLZrIJSgLrb+cx/zzzDNkM6ZeS2JuyGshhteT3Z0XBV8?=
 =?us-ascii?Q?zBotGOlGvNn0Ry4kcvyOGf8HZCKkIlTd7z8x+XEDmAG1iH995S0Scum6QrUQ?=
 =?us-ascii?Q?Xpru0cm9bqRWsGsfNtbJKT4ARJIyAxOlfaEiSc5ljLSmrgRqvm057HSmziG2?=
 =?us-ascii?Q?3SEF49tTw64=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 09:18:03.1498
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d73b7506-9024-4cc0-ed4e-08dcc80b7c2b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DF.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240829_021809_795482_F10C0CEA 
X-CRM114-Status: GOOD (  19.56  )
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

The AMD HCI controller is currently unstable at 12.5 MHz. To address this,
a quirk is added to configure the clock rate to 9 MHz as a workaround,
with proportional adjustments to the Open-Drain (OD) and Push-Pull (PP)
values.

Reviewed-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Co-developed-by: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>
Signed-off-by: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/i3c/master/mipi-i3c-hci/Makefile     |  3 +-
 drivers/i3c/master/mipi-i3c-hci/core.c       |  6 +++-
 drivers/i3c/master/mipi-i3c-hci/hci.h        |  2 ++
 drivers/i3c/master/mipi-i3c-hci/hci_quirks.c | 33 ++++++++++++++++++++
 4 files changed, 42 insertions(+), 2 deletions(-)
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
index c03e86690073..f9ce0ee2cfd5 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -785,6 +785,10 @@ static int i3c_hci_init(struct i3c_hci *hci)
 		return ret;
 	}
 
+	/* Configure OD and PP timings for AMD platforms */
+	if (hci->quirks & HCI_QUIRK_OD_PP_TIMING)
+		amd_set_od_pp_timing(hci);
+
 	return 0;
 }
 
@@ -838,7 +842,7 @@ static const __maybe_unused struct of_device_id i3c_hci_of_match[] = {
 MODULE_DEVICE_TABLE(of, i3c_hci_of_match);
 
 static const struct acpi_device_id i3c_hci_acpi_match[] = {
-	{ "AMDI5017", HCI_QUIRK_PIO_MODE },
+	{ "AMDI5017", HCI_QUIRK_PIO_MODE | HCI_QUIRK_OD_PP_TIMING },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, i3c_hci_acpi_match);
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index 76658789b018..361e1366fe38 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci.h
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -141,11 +141,13 @@ struct i3c_hci_dev_data {
 /* list of quirks */
 #define HCI_QUIRK_RAW_CCC	BIT(1)	/* CCC framing must be explicit */
 #define HCI_QUIRK_PIO_MODE	BIT(2)  /* Set PIO mode for AMD platforms */
+#define HCI_QUIRK_OD_PP_TIMING		BIT(3)  /* Set OD and PP timings for AMD platforms */
 
 
 /* global functions */
 void mipi_i3c_hci_resume(struct i3c_hci *hci);
 void mipi_i3c_hci_pio_reset(struct i3c_hci *hci);
 void mipi_i3c_hci_dct_index_reset(struct i3c_hci *hci);
+void amd_set_od_pp_timing(struct i3c_hci *hci);
 
 #endif
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci_quirks.c b/drivers/i3c/master/mipi-i3c-hci/hci_quirks.c
new file mode 100644
index 000000000000..e8ea4d101f66
--- /dev/null
+++ b/drivers/i3c/master/mipi-i3c-hci/hci_quirks.c
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * I3C HCI Quirks
+ *
+ * Copyright 2024 Advanced Micro Devices, Inc.
+ *
+ * Authors: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+ *	    Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>
+ */
+
+#include <linux/i3c/master.h>
+#include "hci.h"
+
+/* Timing registers */
+#define HCI_SCL_I3C_OD_TIMING          0x214
+#define HCI_SCL_I3C_PP_TIMING          0x218
+#define HCI_SDA_HOLD_SWITCH_DLY_TIMING 0x230
+
+/* Timing values to configure 9MHz frequency */
+#define AMD_SCL_I3C_OD_TIMING          0x00cf00cf
+#define AMD_SCL_I3C_PP_TIMING          0x00160016
+
+void amd_set_od_pp_timing(struct i3c_hci *hci)
+{
+	u32 data;
+
+	reg_write(HCI_SCL_I3C_OD_TIMING, AMD_SCL_I3C_OD_TIMING);
+	reg_write(HCI_SCL_I3C_PP_TIMING, AMD_SCL_I3C_PP_TIMING);
+	data = reg_read(HCI_SDA_HOLD_SWITCH_DLY_TIMING);
+	/* Configure maximum TX hold time */
+	data |= W0_MASK(18, 16);
+	reg_write(HCI_SDA_HOLD_SWITCH_DLY_TIMING, data);
+}
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
