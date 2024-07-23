Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E357C3DA49
	for <linux-i3c@archiver.kernel.org>; Tue, 23 Jul 2024 23:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UOYK2bZYIgOmKrJ46YcKe2BdJajhiQap4hwciFYvhGo=; b=xWWRy2B54keomR
	88qsT5kcPo0n587gxSqQWuB9FM/TDK7oXE7a5e0hPLiDUg7S0mNPXV5OscvA083gxO0VwGdZSi2QZ
	9BftfJfwVi05sCTA6cNt2MhGyTFZo07S7L6YMEEb2fZl/Glmm8Aw15hYuait8yMBtgqWe6UAugIry
	I9OXa0FGasgPu/3RITbD9TA9HA5qthbBbhwSvweOxxMKPFpoER+3Gnc0zcqmUnTUV/8iGCLan5INp
	945KMGFHHyg4dCLrlUnvlXCq3ixVQkTl7FGOCxh0c6X8TzP9z2cFbZ3ouMPNHj+I559eo5k2IznmJ
	NQBfIdTH5gffbNsGv33w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWPDd-0000000Dp0F-0vTS;
	Tue, 23 Jul 2024 23:46:57 +0000
Received: from mail-mw2nam12on20620.outbound.protection.outlook.com ([2a01:111:f403:200a::620] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWJR4-0000000D8ey-1AGp
	for linux-i3c@lists.infradead.org;
	Tue, 23 Jul 2024 17:36:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KYb/eI5HdEjbwNnMBRvL/d61rUoVnQzlaD8/UdXiQ6SDDvx89Wwg/ij6Pj2Np4gwqXy8ss7ykz+8RdrMfBhF/kjfB5uBMOxTOnAS6NQmiyhv6ik5q4v14eLYANcNi/lH/NOrTuIdIeiIe9A06AYvw43ay+hUk6GqVfycdyuPWCuXVQiveMxodGtPKEP3vd5/z68YKwnohYaYCxkm/V6MrSFlj0otz3im4cn9GAKRU/YZpPBKDZ5H8I5bCRXSQixmxjkjYKkL65vQK/yW0R0o1P2+wOHAmVZdPt0pHNWmkJtNZVO+IfxQ9vWKsjFiuVD8YLJbjoTF9b32uGXXbsAR9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v45OyP2OYym0YYIo0LaPDjJTYuuBuXGW6+CxzPOclUI=;
 b=b15B+KuhcnyqcN8TzODK2tnGNA8YuqYeTcDNRvjejIYZuNCQ02a5n8ZxEuQ3vW81ACVJ4lKQ+d/UhrtbJ6jYPjWoPGl4Iu+p0S5Vfhke/ySMSzAjhHI4igmGuRpvRoS1rGXFGfuQFeDe4zIAi7Kfnx4or6UxvWGLdrV/UAiOept7y59ATS0sE73kTZDitqhT80Ha0olBWSJkzbDN/FPPBpehlcLkpEvA+TbYobNafcnqfob74qIZEJq5+fCUZdMFRpPgM7rANZMa0euZURd4POZIDR3YSTMBPcCjHgYsOzXafUqWeo3pWHd8pUTg0LO3g45FI9rxgWtzIFt4bmOs8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v45OyP2OYym0YYIo0LaPDjJTYuuBuXGW6+CxzPOclUI=;
 b=Jm5MSfYTBwNOdFs1gGY/1GdXDwb7HrHLM/wNTP8uPzpKxjMpTG94dxAkAOfNe8HLIgTB5S1I9/4J6Yvr1NW2LcRJG5cWmTFWkgqRXv2EPiSdAB8R/HUEcX1/8FPxD3Ztg5/dtkXqUUt3Wkiy73JbCawGTBL+lXfHBPcS/QCkGwU=
Received: from BN9PR03CA0668.namprd03.prod.outlook.com (2603:10b6:408:10e::13)
 by DM4PR12MB5772.namprd12.prod.outlook.com (2603:10b6:8:63::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23; Tue, 23 Jul
 2024 17:36:22 +0000
Received: from BN1PEPF00005FFC.namprd05.prod.outlook.com
 (2603:10b6:408:10e:cafe::94) by BN9PR03CA0668.outlook.office365.com
 (2603:10b6:408:10e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14 via Frontend
 Transport; Tue, 23 Jul 2024 17:36:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00005FFC.mail.protection.outlook.com (10.167.243.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Tue, 23 Jul 2024 17:36:21 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 23 Jul
 2024 12:36:18 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jarkko Nikula
	<jarkko.nikula@linux.intel.com>
CC: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>, Krishnamoorthi M
	<krishnamoorthi.m@amd.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 4/5] i3c: mipi-i3c-hci: Add a quirk to set timing parameters
Date: Tue, 23 Jul 2024 23:05:37 +0530
Message-ID: <20240723173538.3493935-5-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240723173538.3493935-1-Shyam-sundar.S-k@amd.com>
References: <20240723173538.3493935-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFC:EE_|DM4PR12MB5772:EE_
X-MS-Office365-Filtering-Correlation-Id: cd0bf749-b1a4-419f-9535-08dcab3df7b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zWOVYFkP5EDuSFMSbkz5y6XcxA1rvxTf+3rnrZeQjW6bnAd4frybFnicX7eP?=
 =?us-ascii?Q?lC/6TvgFoDjNox7I6lviceu7K9vwkQ3EUTqRm1MD+P7HFACARUJlntqISCPl?=
 =?us-ascii?Q?iCGg5LZT8goQfuEkUZ4ZJq/kVfGB1aNshpF3HkSTQBJSCoG/6n8Js8D0Ct+A?=
 =?us-ascii?Q?jQ3bF7m/TFjUaghLc3J5kYZd9oyy0vffFXIgLOBgTRB3w1pGBmJnfmDCbWeJ?=
 =?us-ascii?Q?h1Ld+6xQqMUgsNyeIgetksEGZl0e4tUr+sgLJCqqB5n8tgHdbA33JFTd0h6m?=
 =?us-ascii?Q?3niPAKKY780rrZmRuqQtzVhy0+EeDSPoFtK4UUM3lROXSf0BNEn2GU3FYOx7?=
 =?us-ascii?Q?ih7Z09MEoQyoBRr+1ubUgaawtvlr/In+zeRrCA89ZsTQ9eyev51v7vaDH1Yi?=
 =?us-ascii?Q?dp6bh34ffHTYKksLnlWfygoAeEdq4cpQ6R5RiNiqJop9P2FRUgOYrwtHa8bX?=
 =?us-ascii?Q?yKD1eRGLpHCo3ICpvEPLO22AV9jChOKxtnkpRLiHB+b+EYrcyrSeXmUBocan?=
 =?us-ascii?Q?tSoRoFY/Uj+Ad0tyitmItD5Ys1Ej+rY2N/92Cr/GD4V5r4DwuVJaAiKVN4Rv?=
 =?us-ascii?Q?+APO6N+SuymkBCZ90uACwD1WpNT9OtD32yLHDIDZM22drtB9TGvvCtmSESRO?=
 =?us-ascii?Q?6y5jQ3Okd9AvpeW3L3GTIvu/VlgX4xTE5/vDMZDAvH4ISP8JZofAcKkBcRRA?=
 =?us-ascii?Q?b5uU44PTY1vigkdWhcpaaxQUHC4OsO5cnwNlGUX5RuDBuPhdoYbbYAnAKf9m?=
 =?us-ascii?Q?UVqt6wvFt+0TRPbjFqyDoaJ4lDqV2ke2We7T7noK5hWxENQPKzbNXhQHdNa9?=
 =?us-ascii?Q?u1P97ml1qv5Krx8h7kHsXb3hsNRmSJ1aR/IhIPfE8jG+7lI5pg165oN73lrD?=
 =?us-ascii?Q?oP6lVcmylH74gsTpIDcVUgpykXp10lm4BpPxTmQpSUxZa/CyVrPRbWEgwDg/?=
 =?us-ascii?Q?I5ogy55Zly2lieuYL1qWwLrUwltBTWgnQv/imi2LijH8SOaEIM7jcxN838MH?=
 =?us-ascii?Q?FBKtKWsE7+VM2mRmcN+QT+uCSTaNK47GncDr581oK7XVi25ZbYhJ+y1kPY/4?=
 =?us-ascii?Q?IKX2wZi2qAIDQKBJnWoWNbZawBcYOJ7+3j1FdnAdcI/bs7xtT41XwXOCIiEK?=
 =?us-ascii?Q?5TOfwjYUYfDBTVZIqsaJwm3oJrltTvclhwUOL0vN2xnBPwUMG0oziLUGQNvJ?=
 =?us-ascii?Q?7PGkXyo6RErLyz94SfhqxBXe7qyouEx43S1DrFujuaFXN+3kX1YkDUzBYA2f?=
 =?us-ascii?Q?kDy4E2I9MAQD7svQolxXws6X1WvtFuEOTJgBGoFCRfZF+aVu1/FaMySoI271?=
 =?us-ascii?Q?r25coXBC3FDjxQrFevx+qvSVbBSXHvHVChq9FKttQ2/oXGqjIvyn43NcLaLG?=
 =?us-ascii?Q?J8QxNfehvOgDN3Ef0g8+FUarlYpoymUBoEO9ltj/wFCrfXAP0kr+Ll1uFtQX?=
 =?us-ascii?Q?H0gi21STcqMJNzqtZpYI9cu41I3Endqg?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 17:36:21.5548
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd0bf749-b1a4-419f-9535-08dcab3df7b2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00005FFC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240723_103626_342805_65497727 
X-CRM114-Status: GOOD (  17.44  )
X-Mailman-Approved-At: Tue, 23 Jul 2024 16:46:54 -0700
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

Co-developed-by: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>
Signed-off-by: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/i3c/master/mipi-i3c-hci/core.c       |  4 ++
 drivers/i3c/master/mipi-i3c-hci/hci.h        |  2 +
 drivers/i3c/master/mipi-i3c-hci/hci_quirks.c | 41 ++++++++++++++++++++
 3 files changed, 47 insertions(+)
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/hci_quirks.c

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index ae5b1a144506..9fc142ca7532 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -784,6 +784,10 @@ static int i3c_hci_init(struct i3c_hci *hci)
 		return ret;
 	}
 
+	/* Configure OD and PP timings for AMD platforms */
+	if (hci->quirks & HCI_QUIRK_AMD_OD_PP_TIMING)
+		amd_set_od_pp_timing(hci);
+
 	return 0;
 }
 
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index 56361adbcc14..f4ec6dcb2ecf 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci.h
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -140,6 +140,7 @@ struct i3c_hci_dev_data {
 /* list of quirks */
 #define HCI_QUIRK_RAW_CCC	BIT(1)	/* CCC framing must be explicit */
 #define HCI_QUIRK_AMD_PIO_MODE		BIT(2)  /* Set PIO mode for AMD platforms */
+#define HCI_QUIRK_AMD_OD_PP_TIMING	BIT(3)	/* Set OD and PP timings for AMD platforms */
 
 
 /* global functions */
@@ -148,5 +149,6 @@ void mipi_i3c_hci_pio_reset(struct i3c_hci *hci);
 void mipi_i3c_hci_dct_index_reset(struct i3c_hci *hci);
 
 void amd_i3c_hci_quirks_init(struct i3c_hci *hci);
+void amd_set_od_pp_timing(struct i3c_hci *hci);
 
 #endif
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci_quirks.c b/drivers/i3c/master/mipi-i3c-hci/hci_quirks.c
new file mode 100644
index 000000000000..9d8c5eedc8cc
--- /dev/null
+++ b/drivers/i3c/master/mipi-i3c-hci/hci_quirks.c
@@ -0,0 +1,41 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * AMD SOC I3C HCI quirks
+ *
+ * Copyright 2024 Advanced Micro Devices, Inc.
+ *
+ * Authors: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+ *          Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>
+ */
+
+#include <linux/i3c/master.h>
+#include "hci.h"
+
+/* Timing registers */
+#define HCI_SCL_I3C_OD_TIMING		0x214
+#define HCI_SCL_I3C_PP_TIMING		0x218
+#define HCI_SDA_HOLD_SWITCH_DLY_TIMING	0x230
+
+/* Timing values to configure 9MHz frequency */
+#define AMD_SCL_I3C_OD_TIMING		0x00cf00cf
+#define AMD_SCL_I3C_PP_TIMING		0x00160016
+
+void amd_i3c_hci_quirks_init(struct i3c_hci *hci)
+{
+	if (boot_cpu_data.x86_vendor == X86_VENDOR_AMD) {
+		hci->quirks |= HCI_QUIRK_AMD_PIO_MODE;
+		hci->quirks |= HCI_QUIRK_AMD_OD_PP_TIMING;
+	}
+}
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
