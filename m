Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB087C3DA61
	for <linux-i3c@archiver.kernel.org>; Wed, 24 Jul 2024 07:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I2sf3uhM1JBh2LpRb9ZGJswxgp+hK2ZyvfkhE6br4T0=; b=Nobad9YeBUxUJe
	zR9qjw86IdiNr/twVNow/EmJ1BPkahHaiHE4FPjHx/Jw75Qq81ijq+EVNQsaSuhPShY0ltaZnU+SZ
	33Jqg1+bO/gLp1i3Upg4PMX56R31qD8YSv1IjSnHkh709eZHNQUo9Z8BP5ECksiW9h65y8olZzNN5
	IRCR6/8d0NXBk8fLOvd4WFQiFXecBwSaIuleMtQ2vwNfL2l/THuJYoXqgKvFYgu98xHV22E7IKOib
	UNH5rQg7wdbCqY9tbN6PloFqYU7qitnqO3OfZc7idSVA2rowx4iUOPWLswpTiDXdd7SOK3rq0AHX1
	Kcocb/GH03i21qery9HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWWBw-0000000Eaws-0oJi;
	Wed, 24 Jul 2024 07:13:40 +0000
Received: from mail-dm6nam10on2062f.outbound.protection.outlook.com ([2a01:111:f400:7e88::62f] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWWBu-0000000Eauh-06FD
	for linux-i3c@lists.infradead.org;
	Wed, 24 Jul 2024 07:13:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iOzdIGzGYRXVj7zHGqtVF57ly/l8Qz/BnKU+zhnbmMRugfdIfVowUfEetw+XKTgcbU+Rc2iH6sV1j39Z0trH0dt56g0maWca4ZP6NCZeNkqiy9TASrRzMdIyzjHeduYc59eRxOvsmdLwGAw3MHk03dJs0MH7FkK8pGh3QeZDDgVvV5o/Lr7jLzuEdtCeBhqlYAdC38wC6ojJ1DGDD1ukcbfI9k9BSkuPEZrofLzesVj7aCTOiKuYQVpbAqRgpEMUUy3lnVQsqOoUFMtSm0CfTAFm0flf/9eEqwLICmClmJ5KyROe2XQZrxc/49GPanPg5cVQSZAkS6QGIfiXijbbvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ABM0PjwrBwECIs/E3JgSaaELkvIIKN7lkUEAryoaQlk=;
 b=o523q9HRqKNthE3AFZM9xUx035CYT3eyXX9YEfhzO1QOkvnytYK60JflG892jY1FxLxIRFYe9JW6BRB3SbiwO0IXTGqw0BT9+euFla+gAy//D49HBJGAsddK7SPrvRWK8I0Qd9t451TX9rGaZ4X/dIRCA2M48WcrpGzs6pjDa2VufNySYqEk+m5DP0OFYMqUBZ4er3G7HhsKLS72yh3K8AMv1Ir6V3B/NPhzspWtExSh2IrfdqOxblGDfjax3gvlIKhyaXDu1F6nn3rWqcCOGsWR3neF1gE5kydss3q887nihcTX9AVEQ3pUMO+a6wpbZW71aLDXvWSR4Yuyq/BLjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ABM0PjwrBwECIs/E3JgSaaELkvIIKN7lkUEAryoaQlk=;
 b=G5CaaouTPHG3G5BEnfpPyKa9pcVlKKybJg6GPyRgzqHrcF0GuiZX13BTUavgNoGPxUoW8JJrRxeZ8UEDKKMS4ygZBK+4FxX95OWNDskB+UM3wRZfiQreRraW4oZyiT6RLyiHWMg6G/2xxTIwp6JxD2kmkwgoaAldiHJ1PGLN5B4=
Received: from BYAPR01CA0060.prod.exchangelabs.com (2603:10b6:a03:94::37) by
 PH7PR12MB7114.namprd12.prod.outlook.com (2603:10b6:510:1ed::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Wed, 24 Jul
 2024 07:13:32 +0000
Received: from SJ5PEPF000001D1.namprd05.prod.outlook.com
 (2603:10b6:a03:94:cafe::50) by BYAPR01CA0060.outlook.office365.com
 (2603:10b6:a03:94::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28 via Frontend
 Transport; Wed, 24 Jul 2024 07:13:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001D1.mail.protection.outlook.com (10.167.242.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Wed, 24 Jul 2024 07:13:32 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 24 Jul
 2024 02:13:28 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jarkko Nikula
	<jarkko.nikula@linux.intel.com>
CC: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>, Krishnamoorthi M
	<krishnamoorthi.m@amd.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 4/5] i3c: mipi-i3c-hci: Add a quirk to set timing parameters
Date: Wed, 24 Jul 2024 12:42:44 +0530
Message-ID: <20240724071245.3833404-5-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240724071245.3833404-1-Shyam-sundar.S-k@amd.com>
References: <20240724071245.3833404-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D1:EE_|PH7PR12MB7114:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b9eb17d-80ec-4f67-300f-08dcabb0205c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Blv86NzydJXd0VjFUyces4mmMWbkMGCh3nwCTzqi6n/eDd99tMsexJ5pjn3r?=
 =?us-ascii?Q?bVF54awchIwClKb8nKkUXiiXdDWc7HuSl/DCNIVHqgM5t9Nmvq1V8NjAqmVs?=
 =?us-ascii?Q?D+hNZY7zsRppaLVvgNfx0UXo1fyKYcN2FRwFuoA5O/KZ67WnjQ6VHlh//w2r?=
 =?us-ascii?Q?bQcyQnlrj+89wJ3EXzMDCIvjRHx/4+bJsR7EYn+2Og/VjU7JZihAyo661XZ0?=
 =?us-ascii?Q?i8dlq8q+Glq9wbuXauatXFDfwM16vCZTHnsG6aPKW2nrGZ53k15r3fe3gvbU?=
 =?us-ascii?Q?HKWh8isr9Dd6fW/x+yncLUBanyeQE5G8pzZqkNODS4dI0fay7vI3dZ2b/9Ne?=
 =?us-ascii?Q?G1h0vXpeDoEY6pCENzNzvao0EniVC68q4vFQEOuKILB4r+OPWKhpQX2j0fMP?=
 =?us-ascii?Q?aEHSBO/lLutpfynVxtFESZrzMv0dy09UC6fGqqAmiFsd4fL0mCFsFWOp/1wl?=
 =?us-ascii?Q?FKIKBpxcC0fgX6WbkOSE56V5GGNMqFBk8M3hUrrKcStsjg50OiiFgcLyMT27?=
 =?us-ascii?Q?ZxQGOcNV5BLBDfxf3c2HoJvxMo/MYM/+MCGEzWk9hEFcQoUJJzrBInemLBoi?=
 =?us-ascii?Q?nhsS4ziO+55uWgbBqwinv775kcoA7tHDIMo+QsVhspgNav0YXx16GDLrW7MC?=
 =?us-ascii?Q?h7l5DzlRA3h7ro+GtAxef5NJTjpvHiBeVALk+tqB4I8Om4yU1yPnqHgkRxXJ?=
 =?us-ascii?Q?tt0KPJffpH8CR1oy4E98Va4fzb7LOZNEcdAfDdLJ8uiBsgtfrTHKP0VHiai0?=
 =?us-ascii?Q?/y8wfHgyD9nlwqODOAceencFuHHRkqkk/nT+BGtQY2Ic/wSRdZTGPjtV1gIC?=
 =?us-ascii?Q?Hp/gKRdr0UxQqnGKyZ6wH1p/eXfx5eyfpqAORayT1m3KST7AeppWs/LSygsZ?=
 =?us-ascii?Q?fF0Ub9DGdIPa+I0VjViY/oJBjLeHGzad9eXSF+cpJlcN5kGH1jD9uEGWLn8H?=
 =?us-ascii?Q?yAz3THH0GB8qNFPxGsRTCsgX8PTRghpfPqkaCoAPAVkyF+DFnvZ4W05kkQT5?=
 =?us-ascii?Q?zKtvyvBlHuihhWtlikkCFgkTDLt9nLe4xrcfqV6/QjUlyEom2ixYQajXd9L7?=
 =?us-ascii?Q?Q6NYYUPTMHqV2J76A8gyvmdF8OZQS3fje7jCk4cqC1NIbFPu9KtyVc/1Bs8d?=
 =?us-ascii?Q?Bi+MrqZpmlEe3+k26QTKUWAb2pdvqGXuFbylchpD0uAeNRGJQI/T+f4n+HVF?=
 =?us-ascii?Q?Tqydkuy2Dv1gxD8HfFpHr4LwYm0rXqSjNOk+RbI3XWgHz6mSgrtU61gzFlhW?=
 =?us-ascii?Q?UCfUwPsqd772uWYFPVGNdB6FnUVuYgsdBp8NKsFdhc95ApYuG7VjC+Jjq4oc?=
 =?us-ascii?Q?qO2uQILt3en0QBmjhBL5bcooJGtYE5sfOQVTQW2LYtlp13piXj+l78Jlw7oo?=
 =?us-ascii?Q?gi+6M9U+PlPHhTKGfKEYIToXgtLS6L4Wpnp9+QdPFEtELGz6Dr/JsUMBei1O?=
 =?us-ascii?Q?uM1dpPv/GzkATn57ZX7ixhv02Fa3upIp?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 07:13:32.2930
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b9eb17d-80ec-4f67-300f-08dcabb0205c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240724_001338_113094_223367C4 
X-CRM114-Status: GOOD (  18.45  )
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
 drivers/i3c/master/mipi-i3c-hci/hci_quirks.c | 43 ++++++++++++++++++++
 3 files changed, 49 insertions(+)
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/hci_quirks.c

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index ca9d4e2c80e6..3320e6331c86 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -783,6 +783,10 @@ static int i3c_hci_init(struct i3c_hci *hci)
 		return ret;
 	}
 
+	/* Configure OD and PP timings for AMD platforms */
+	if (hci->quirks & HCI_QUIRK_AMD_OD_PP_TIMING)
+		amd_set_od_pp_timing(hci);
+
 	return 0;
 }
 
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index 8e5af4e55de1..06a4d54a5a02 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci.h
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -141,6 +141,7 @@ struct i3c_hci_dev_data {
 /* list of quirks */
 #define HCI_QUIRK_RAW_CCC	BIT(1)	/* CCC framing must be explicit */
 #define HCI_QUIRK_AMD_PIO_MODE		BIT(2)  /* Set PIO mode for AMD platforms */
+#define HCI_QUIRK_AMD_OD_PP_TIMING	BIT(3)	/* Set OD and PP timings for AMD platforms */
 
 
 /* global functions */
@@ -149,5 +150,6 @@ void mipi_i3c_hci_pio_reset(struct i3c_hci *hci);
 void mipi_i3c_hci_dct_index_reset(struct i3c_hci *hci);
 
 void amd_i3c_hci_quirks_init(struct i3c_hci *hci);
+void amd_set_od_pp_timing(struct i3c_hci *hci);
 
 #endif
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci_quirks.c b/drivers/i3c/master/mipi-i3c-hci/hci_quirks.c
new file mode 100644
index 000000000000..6ce08f9c92a8
--- /dev/null
+++ b/drivers/i3c/master/mipi-i3c-hci/hci_quirks.c
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * I3C HCI quirks
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
+#if defined(CONFIG_X86)
+	if (boot_cpu_data.x86_vendor == X86_VENDOR_AMD) {
+		hci->quirks |= HCI_QUIRK_AMD_PIO_MODE;
+		hci->quirks |= HCI_QUIRK_AMD_OD_PP_TIMING;
+	}
+#endif
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
