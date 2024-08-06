Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FBE9C3DA64
	for <linux-i3c@archiver.kernel.org>; Tue,  6 Aug 2024 07:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HVRVrI6cS3Gjh37WpNNp8iNZBlS/dkSF7tIDsyTXopA=; b=XJdtBFFWM9SdE3
	prrMb99kZDIHv+C0M6pPZeDrouUSUU7cYC9DyVYyR+20XyJ+f1zHrJollj8xU66tscCi2VZWWx4FA
	/GqM99KBVFXIbJplvy+oeZZnE0ImAnU+KtgNiTxMtmLHBNwNeAvbF1YI7ym0SIh7qnszQBDUvsq/1
	8zx2zbC5Puk89N/+kxvgge5dtz8t3ykQ3AFLscKjTJPjdBNwsU/sROpX6Cttk00CF3mgzqJPoaA2u
	ekOWFGrWcenzTMrd/JeqF/mSlE6QPRRtO4cB5QKPk0wQhdddF7Y4l9xRD3fmIOlkPdtakczUQoefG
	PCZI0NWgeo2lejhZOTGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbF6L-00000000rSt-0Nyf;
	Tue, 06 Aug 2024 07:59:25 +0000
Received: from mail-bn1nam02on20613.outbound.protection.outlook.com ([2a01:111:f403:2407::613] helo=NAM02-BN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbF6I-00000000rQP-2A7W
	for linux-i3c@lists.infradead.org;
	Tue, 06 Aug 2024 07:59:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N0Dlm5F0HnpLTb87gxKMkHLKAFOQ6IG8hFVFuuJFF1+/xdvc80S0r7CdsZ3nGhq9aHxW4+FQWKH6ZVLafsq5ZMulTiTzYQyCTLBj7A8YvLQQBwGkA4b08rjCGfV3oBXlxg9y5R87VHrgji8jGON4LoIOXeIBpQ2f8+dAnvxDXSTaEyNUQkMn/ylEuiVMUS8ZZlPg9NINSPpy2ObvUMm0eAlYT7ndJ9zZRu574lElmuARCkbNe+nPiGgiq+coKQhVi1Rte1+DUn7AeYP5Facqewicq5sdb4MWksL7in3pbgq8WIe7+V1YoINU25uRv+q6hVPq1tB15oF1ka1kJIKs7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fu6+K686Dt5XCNF6lBu7lrGF24EzmvRoVMOApH89cAg=;
 b=tTNUFqkVWJG94ffWqmrqAT78dZNCn6MM3pO7aqTJ4SSih6ihhnOCEBgt1RrF3V93/o6wHCcgg+Ctz5318H5BQeopH1uTXSFrHdfPaCf8TnnSoMZ7trisuGfgWsQBrg2Q+vUrhR02gL2rwLUaozBJ5qAamcjY51JeRloabXAiPWcJCxLqsrwzWYjLkPE+UyI7u6qy8gVm/baAdVzV+xgYkHD7obKA9sHaaSYLFQi0K4W6+t+5r3bN8R0EBstsFLrWX2RPhib1Fpz3AUarGUTo77DDjAhSiLi1TofTxJQzZV3qyxdjDrXGQ2+VPCbqXx/gTLF6o59E8GrV2kl8pbDrrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fu6+K686Dt5XCNF6lBu7lrGF24EzmvRoVMOApH89cAg=;
 b=KcyURGzFIu3jhKpN8jfWuiCcSDky8Q3yuiv6tzdx5/yCusfERiQEpsqExTk/s+zXdIZynz/7NYM8HWU09APaaTqGeDMV1Mocy4YkLuKN0fne11AV5Gn6KIeRwyDpN3/+wBhFVH+VbMnODNc8db4Nd4rVHOmQiQELW4uPLd3HsQU=
Received: from SA1PR04CA0009.namprd04.prod.outlook.com (2603:10b6:806:2ce::25)
 by SJ2PR12MB9211.namprd12.prod.outlook.com (2603:10b6:a03:55e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Tue, 6 Aug
 2024 07:59:16 +0000
Received: from SN1PEPF0002BA4E.namprd03.prod.outlook.com
 (2603:10b6:806:2ce:cafe::1a) by SA1PR04CA0009.outlook.office365.com
 (2603:10b6:806:2ce::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23 via Frontend
 Transport; Tue, 6 Aug 2024 07:59:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4E.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Tue, 6 Aug 2024 07:59:16 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 6 Aug
 2024 02:59:13 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jarkko Nikula
	<jarkko.nikula@linux.intel.com>
CC: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>, Krishnamoorthi M
	<krishnamoorthi.m@amd.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 4/5] i3c: mipi-i3c-hci: Add a quirk to set timing parameters
Date: Tue, 6 Aug 2024 13:28:42 +0530
Message-ID: <20240806075843.277969-5-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240806075843.277969-1-Shyam-sundar.S-k@amd.com>
References: <20240806075843.277969-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4E:EE_|SJ2PR12MB9211:EE_
X-MS-Office365-Filtering-Correlation-Id: 60d66725-0736-41d2-d650-08dcb5edab03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tvVCvjxkyUF1bAj4V6jkkWJherKErA+dDeFj98/sD0MJz0Q5FpWj0QqSuNx8?=
 =?us-ascii?Q?lx9ZbLxb6M4d2F+vsn0nIQtlp+p9KcYB0OkGpkjWiL/Io5/3FhjHpMn3HHDM?=
 =?us-ascii?Q?5W7sE3M25AcABQpCNRY/q9ya8Vd6HwrB5OgoQSURau3Vl67KqUZOxIW0YeIx?=
 =?us-ascii?Q?uZ23Cx0FByg796uHZANh7skpWchhCKk08/yqWyLGz99jH54kKOmat512w3Sf?=
 =?us-ascii?Q?1Fr1S23c8RFZ4AEnhhNpXD6SBiMX9bCWvxuqDj4tRARbSrBcwlRFiZAJmCze?=
 =?us-ascii?Q?2q+UsubPxMJP3xK3NJbtZvNJUJ0EHRaLbBVv7gHfFLwsr1rlmRMvKsNSr+VA?=
 =?us-ascii?Q?mbMF3tV91oxrWIXKegd+imr+pyHWHdfMdyJVlkq8XdqrZj8AWygVX5peMto5?=
 =?us-ascii?Q?6e6UEvguJrXVuqomwqvQbBbv+SlGoCOPlj/ivR7wOQRJNnSpVBozF8CK+vgS?=
 =?us-ascii?Q?HTvNt6ZSzas/Q/c/lCnl5DIYvYqr7yNLL5h5jeln/SxQ1zGmIihrR+/MSCvx?=
 =?us-ascii?Q?ef7jX97YCc+K9tSoEg3CWQ9SpN/AkLzNnFBdkzEiQUfRwGqDcvck9PP8gGOY?=
 =?us-ascii?Q?WBEuE05N9unz4ByvcqyQTs16XwW5uJ2cHDaAMXUyOx/8e68djSfKD4VXkkdE?=
 =?us-ascii?Q?pknUTJVrKPe734EeZPjlt5ER/CnSfkrqYXBOx430b0slwmG+kac0RhKZsGOI?=
 =?us-ascii?Q?nv+r5TcT5g1XvLVEQ1nC+jwgF/qNTPOAGSITjRQrUCLitNXjhULJLvA57eg/?=
 =?us-ascii?Q?HWipfjP+bpFGIz28UMBeAVyePi6OdN34y4BQu2WJ1Q1IYQoHi8ft184ifkQj?=
 =?us-ascii?Q?SqBzgGctcX93KVuDLsdVDqKjo7gNhcDgEa4WA8nGi1tp20yA3C45ZM6bWo5E?=
 =?us-ascii?Q?zvRUU1gic/FRTqKljd86j/tB1MQ7iyn/eqkOJ1nadOvPchWk96FcpFHkmMTT?=
 =?us-ascii?Q?FYCKDYBwMPjUT6AFGEEQ9/Alr54G0D/SEfWe3vHJkOBCRDI3g92HZCUPjIdN?=
 =?us-ascii?Q?BAngDF5fwMXDNPfmiVdjwaNBU/1a0T/zEbXfQNG9NrzEVMUyjPrrRuRYMqGo?=
 =?us-ascii?Q?924dFFaczrIOGeYtN5Ugpv/xHOXaPsE4/rRNDHr1Vrx75RHhMvzwG2FhWD7Y?=
 =?us-ascii?Q?dZVMwd2W6TPyLPRCoWEl+k4BnLMbDFJZk4FGFBivfxsfSGhJ4/e1/m3Gj8e1?=
 =?us-ascii?Q?APCd3yPIhEGXokMgZArpAvrwcUzbzP/zE1gbO86h1wT4kzGQKWdc8DNTyx60?=
 =?us-ascii?Q?FHjVcM+VHcBZwHM6B5EuJrJptvI20RNVJerO7S/LDBaqH1I8mDOkVKwCDeOB?=
 =?us-ascii?Q?nk3HrQIe12WrD0lwgqa+7IgFWYfWiyq2Ci5gBXDZgv/s0aUD3hJcA1nkEOnb?=
 =?us-ascii?Q?neOKuW02zGfLJC5QV55mxbUn0TwItXSratL9dPC2k4uS6dO9ztS+mNaPynqe?=
 =?us-ascii?Q?iB+I60tn1SnKI7v1HNdzACutD9ce1T2R?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 07:59:16.0018
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60d66725-0736-41d2-d650-08dcb5edab03
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA4E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_005922_586057_BD3E9A49 
X-CRM114-Status: GOOD (  15.16  )
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
 drivers/i3c/master/mipi-i3c-hci/core.c       |  4 ++++
 drivers/i3c/master/mipi-i3c-hci/hci.h        |  2 ++
 drivers/i3c/master/mipi-i3c-hci/hci_quirks.c | 25 +++++++++++++++++++-
 3 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 5c4fcb740856..baec2c42e0e0 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -791,6 +791,10 @@ static int i3c_hci_init(struct i3c_hci *hci)
 		return ret;
 	}
 
+	/* Configure OD and PP timings for AMD platforms */
+	if (hci->quirks & HCI_QUIRK_OD_PP_TIMING)
+		amd_set_od_pp_timing(hci);
+
 	return 0;
 }
 
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index 2b7560149520..e1a65cfb43c8 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci.h
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -141,6 +141,7 @@ struct i3c_hci_dev_data {
 /* list of quirks */
 #define HCI_QUIRK_RAW_CCC	BIT(1)	/* CCC framing must be explicit */
 #define HCI_QUIRK_PIO_MODE	BIT(2)  /* Set PIO mode for AMD platforms */
+#define HCI_QUIRK_OD_PP_TIMING		BIT(3)  /* Set OD and PP timings for AMD platforms */
 
 
 /* global functions */
@@ -149,5 +150,6 @@ void mipi_i3c_hci_pio_reset(struct i3c_hci *hci);
 void mipi_i3c_hci_dct_index_reset(struct i3c_hci *hci);
 
 void amd_i3c_hci_quirks_init(struct i3c_hci *hci);
+void amd_set_od_pp_timing(struct i3c_hci *hci);
 
 #endif
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci_quirks.c b/drivers/i3c/master/mipi-i3c-hci/hci_quirks.c
index 8a8fbd697175..a222bfab0676 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci_quirks.c
+++ b/drivers/i3c/master/mipi-i3c-hci/hci_quirks.c
@@ -11,10 +11,33 @@
 #include <linux/i3c/master.h>
 #include "hci.h"
 
+/* Timing registers */
+#define HCI_SCL_I3C_OD_TIMING          0x214
+#define HCI_SCL_I3C_PP_TIMING          0x218
+#define HCI_SDA_HOLD_SWITCH_DLY_TIMING 0x230
+
+/* Timing values to configure 9MHz frequency */
+#define AMD_SCL_I3C_OD_TIMING          0x00cf00cf
+#define AMD_SCL_I3C_PP_TIMING          0x00160016
+
 void amd_i3c_hci_quirks_init(struct i3c_hci *hci)
 {
 #if defined(CONFIG_X86)
-	if (boot_cpu_data.x86_vendor == X86_VENDOR_AMD)
+	if (boot_cpu_data.x86_vendor == X86_VENDOR_AMD) {
 		hci->quirks |= HCI_QUIRK_PIO_MODE;
+		hci->quirks |= HCI_QUIRK_OD_PP_TIMING;
+	}
 #endif
 }
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
