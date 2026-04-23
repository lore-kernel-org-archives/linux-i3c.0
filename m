Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68CF5F99355
	for <linux-i3c@archiver.kernel.org>; Thu, 23 Apr 2026 09:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K2mvZiHNckjcmDxdW5Gvsrw6keoa8zF/THNOaogi4+g=; b=lHM1BgQ4dlm728
	s/g+ZIzOBZSjKHMA1W8KNIcYwj5rygujL9d+xJMutRuw6SDvLYowHmwOJ3M4Kzh0AOnyajrn3MomK
	AG57P2ptD6wPrJvMAwh7dnzW19LbTwbBPWkhR25lH9OPcQcBVU1xaZoZD4nFFZzlHfDANFoGY7WQw
	BZGdQbtmxar1grLi186tWT8VMkUFqrnqV6ML1S2S2WLwadwd8B/lFao2kpEIM8O/dfmSRtDeDpA9m
	THLz3SjczWnWijGFo71Qve05i9FN3aU+MFUJmp9P8CUer1NrjZsqenvNlhLFu6+sF4dcEjsQu0L3E
	d7R0Lu+SfyXuBBiJ/woA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFpvJ-0000000BIPp-0ium;
	Thu, 23 Apr 2026 09:00:37 +0000
Received: from mail-eastus2azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c110::3] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFpvD-0000000BINt-1m5W
	for linux-i3c@lists.infradead.org;
	Thu, 23 Apr 2026 09:00:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W+kZxZ1ULhFgyhzCk4aMloyeNvkXBuHJZTAXkr6LjFY98MxPsnS0s/kSYIq5L4xVOiEEQ9HntBD+1nhQ2FTZBkU3K8AzH6Pdg4HtPLSFcUCduY6W/cmlxpSHlhfykVFNyQuRRjlG+AynNI1TF23pSCwJ/PrngqWHauffdGexIU5AUPbMsQTrX1pmDGoSAFmdfz+999OFrkiCr0h2UJ9/aoYjU4UN5NIcr44Gs2NDerPir7Ifb2JX0gEXrfv5W5OHWPlrSHQXoFkiM0XX31upFAlI/MWfBIHfk9sq8iWgpBYE+CgShgBVsG7YApmAYlLhKGLCqfDChVa5bQmxHr+52g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8uJBanFBW09xuPUHtSPbmlSlMq6/XJwVFb90HY665dE=;
 b=xU0ibjRpx3GWySULTtAQyyAK7JZcqcC5/SyQQCUnSWB+7Oahi/myBLn3cbjh5LHzaOMTokclAxYLdmEqMbR0e93y6n/JGriQQRsTIYsQTndxZr+AVr9A0geptomhzC5ECV9gF9YUbgr1z2WVQxFHviR/dH7eHMgVkVjppPaKY+bNbfRDNr8N1VoegEpXuKYw0Q1Gg6gR9DxSJ0P4MVRXoECKeWN7GRlCoD2YKa6DGiANkG3IE1VAPdOjBnbIfq1m6XPZQ8rJ9o1i2rWu8NYZ20JUGdhXjCXAArv42pYdasgjR401r9+86siQEt0ck3Idql52GfhfcsHh8uAI0mrOIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8uJBanFBW09xuPUHtSPbmlSlMq6/XJwVFb90HY665dE=;
 b=dyIA0VQCyPhcN8Rcc2ZzJA4sNk2HK7LwAXc7uUAiWwKwlQ1NOQ8XaREOQJpXBJZ33oG+s5SccXQY3GR4wwKmnrgunhRB1F2ZJz1s7/ykscSlgStqJfA6VqT7ar/WJ3XlFtGXpb4KjruA+1jJaj+bUAhc71X5oaf/fRSSPCT/g2gzIe81fejYQROizp4HtMucjnVm+GaF9vKMyLKaHOMytC5DOM11lduIp1kGFFCkFyBlrsGO00f4Ugw1rN9O3NxNV84a5kgpLrDS+lkKVKPNgWFFcAIy8UULgN9yiVCQx5Z9YoLZEAUvTpJj0vgO57ll0Yz8KcnZIyepyEmNBd4Mhw==
Received: from BYAPR05CA0042.namprd05.prod.outlook.com (2603:10b6:a03:74::19)
 by CH1PR12MB9670.namprd12.prod.outlook.com (2603:10b6:610:2af::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Thu, 23 Apr
 2026 09:00:16 +0000
Received: from CO1PEPF000075F2.namprd03.prod.outlook.com
 (2603:10b6:a03:74:cafe::63) by BYAPR05CA0042.outlook.office365.com
 (2603:10b6:a03:74::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.20 via Frontend Transport; Thu,
 23 Apr 2026 09:00:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF000075F2.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Thu, 23 Apr 2026 09:00:13 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Apr
 2026 01:59:55 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Apr
 2026 01:59:54 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 23 Apr 2026 01:59:46 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Rafael J .
 Wysocki" <rafael@kernel.org>, Saket Dumbre <saket.dumbre@intel.com>, "Len
 Brown" <lenb@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Philipp Zabel
	<p.zabel@pengutronix.de>, Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>, Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, "Eric
 Biggers" <ebiggers@kernel.org>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Jon Hunter <jonathanh@nvidia.com>, "Thierry
 Reding" <treding@nvidia.com>, <linux-tegra@vger.kernel.org>,
	<linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<acpica-devel@lists.linux.dev>, <linux-hwmon@vger.kernel.org>
CC: Akhil R <akhilrajeev@nvidia.com>
Subject: [PATCH v3 09/13] i3c: dw-i3c-master: Add a quirk to skip clock and reset
Date: Thu, 23 Apr 2026 14:27:08 +0530
Message-ID: <20260423085718.70762-10-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260423085718.70762-1-akhilrajeev@nvidia.com>
References: <20260423085718.70762-1-akhilrajeev@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F2:EE_|CH1PR12MB9670:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c8bca67-68a5-4e63-8388-08dea116bb35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|82310400026|36860700016|1800799024|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 7mCTmjFMBS0/xrgqt9iENA6utWCS3vXj9SFFX7ZAIuEV6bpXZv7KJxzrX9icF5mdljgmYHFcBr6SLETiT6R7nF/mQTZPkQx0oBUWeMjJbzYjNsDiLQHUMcP0/yzIhfjBhwiwU6fKNUkqRvqhH7xbfMhwLYyMJjQiq9SCPspkN32TbicSLOVESisgp30uKT2THOFdVXGPeh35rag8uyGk0cD2lboOXgCJ1wqnq8vBg+9YOPiszO8qiLZQrDOKtlWJ7dw5fui2TK2BE9jmgJe0jvRkhxQQrjENrkf0zApRAXspXPBBP3Mv6UMnhQSFxFjz1dB7nUpL0tOKxkAKfce68yH/XxFHhZQc74LDrBig+7ymdgtEuNhM3CS9EfuSUB8fFWtAooE/OGUkXK5hZTher08pKN3I3rdMlYWAAySNkE9KGkq26TNB/AdzRBx5YXoDz1dzu92Z3InOxi8+oYGOIYjpU0LCe0kb/EIpb5t1lDHt4pxKXLfw0S3fz0tetRE4N01sXGYhi9d5tMLfbwe78ZHtldXGCYykRGr37GSXnuIYRGhQ1N6cbI/HjTBUNn/+C/wC8CSAIatnsDWL5eTNxFZzRU18R/9/+Yb6pIgv7BG/eWKIk13j22YeCjEcUs/vHjIEys0N/iswbNlyyu0TwvEQBkdzCRGcrpqAcUHjuMdCxwyAeiP0IZWuxmHkeRJDftBRX6k97YcBsvo9fd9WoA9/2gK0/8Akaqo6AqtDFsXB2eT6vQCLhmcfX5PGSWwn5c0fG3eCfWJX3pTGQf4pcREOss20Xke6Dgq2TbJIN4NCUtrHyqGyDSabcR+zp0xi
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700016)(1800799024)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: oiZbWy+Es2im/JsOvx54PTbLAiiNTLNi3ln4eVYV+vQIbfrYcwIwLfWMgXmujxWWpC25IVFb4/xmYtbbtPcWEk50YTqSu+r4qz2JkVgieNK0KPnR/6P17QLVqWhhQwrieCRxotyAQbsY6fwMCi41nfiJhHFJDf5n13VwFmcGnZNhUMv4u1tOhiHVhgmlG82Y1rxp394DAXW/KaGjY2y6c1yfaoZoi17D4zF+Pz+nTW9WOWsva/BLlrZA2tXlML6W8H8UiO2NChjgbK8LQebaecAREN7vKNtRDh6yuL51QFfOqsaF0VKswba9n2TT2ef2ldNqaNFW8fFHlei0ayRpLhw1KSyo8oVssW8iqjp4O4nmC0KqIXYwaWSaqInCfHENMJNwH9rflFXEUJQQdnaBKaljzBPCbFAlRAq0CoeP80G7S8tkDBCyk9ID8TvfYk8D
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 09:00:13.3907
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c8bca67-68a5-4e63-8388-08dea116bb35
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075F2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9670
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_020031_467592_E88959D2 
X-CRM114-Status: GOOD (  15.26  )
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

Some ACPI-enumerated devices like Tegra410 do not have clock and reset
resources exposed via the clk/reset frameworks. Unlike device tree, ACPI
on Arm does not model such provider functions. The hardware is expected
to be brought out of reset and have its clocks enabled by the firmware
before the OS takes over. Any data to be shared with the OS is passed
using the _DSD property.

Add a match data for such devices to skip acquiring clock and reset
controls during probe and read the clock rate from the "clock-frequency"
_DSD property. Note that the "clock-frequency" here is the controller's
core clock and not the bus speed. I3C specifies the bus speed separately
using "i3c-scl-hz" and "i2c-scl-hz" and hence this should not cause any
conflict.

Also, move match data parsing before clock/reset acquisition so the quirk
is available early enough.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i3c/master/dw-i3c-master.c | 57 ++++++++++++++++++++----------
 1 file changed, 38 insertions(+), 19 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index edd42daf7553..b90756ade2db 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -242,6 +242,7 @@
 /* List of quirks */
 #define AMD_I3C_OD_PP_TIMING		BIT(1)
 #define DW_I3C_DISABLE_RUNTIME_PM_QUIRK	BIT(2)
+#define DW_I3C_ACPI_SKIP_CLK_RST		BIT(3)
 
 struct dw_i3c_cmd {
 	u32 cmd_lo;
@@ -556,13 +557,26 @@ static void dw_i3c_master_set_intr_regs(struct dw_i3c_master *master)
 	writel(IBI_REQ_REJECT_ALL, master->regs + IBI_MR_REQ_REJECT);
 }
 
+static unsigned long dw_i3c_master_get_core_rate(struct dw_i3c_master *master)
+{
+	unsigned int core_rate_prop;
+
+	if (!(master->quirks & DW_I3C_ACPI_SKIP_CLK_RST))
+		return clk_get_rate(master->core_clk);
+
+	if (device_property_read_u32(master->dev, "clock-frequency", &core_rate_prop))
+		return 0;
+
+	return core_rate_prop;
+}
+
 static int dw_i3c_clk_cfg(struct dw_i3c_master *master)
 {
 	unsigned long core_rate, core_period;
 	u32 scl_timing;
 	u8 hcnt, lcnt;
 
-	core_rate = clk_get_rate(master->core_clk);
+	core_rate = dw_i3c_master_get_core_rate(master);
 	if (!core_rate)
 		return -EINVAL;
 
@@ -615,7 +629,7 @@ static int dw_i2c_clk_cfg(struct dw_i3c_master *master)
 	u16 hcnt, lcnt;
 	u32 scl_timing;
 
-	core_rate = clk_get_rate(master->core_clk);
+	core_rate = dw_i3c_master_get_core_rate(master);
 	if (!core_rate)
 		return -EINVAL;
 
@@ -1580,19 +1594,33 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 	if (IS_ERR(master->regs))
 		return PTR_ERR(master->regs);
 
-	master->core_clk = devm_clk_get_enabled(&pdev->dev, NULL);
-	if (IS_ERR(master->core_clk))
-		return PTR_ERR(master->core_clk);
+	if (has_acpi_companion(&pdev->dev)) {
+		quirks = (unsigned long)device_get_match_data(&pdev->dev);
+	} else if (pdev->dev.of_node) {
+		drvdata = device_get_match_data(&pdev->dev);
+		if (drvdata)
+			quirks = drvdata->flags;
+	}
+	master->quirks = quirks;
+
+	if (master->quirks & DW_I3C_ACPI_SKIP_CLK_RST) {
+		master->core_clk = NULL;
+		master->core_rst = NULL;
+	} else {
+		master->core_clk = devm_clk_get_enabled(&pdev->dev, NULL);
+		if (IS_ERR(master->core_clk))
+			return PTR_ERR(master->core_clk);
+
+		master->core_rst = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev,
+											"core_rst");
+		if (IS_ERR(master->core_rst))
+			return PTR_ERR(master->core_rst);
+	}
 
 	master->pclk = devm_clk_get_optional_enabled(&pdev->dev, "pclk");
 	if (IS_ERR(master->pclk))
 		return PTR_ERR(master->pclk);
 
-	master->core_rst = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev,
-										"core_rst");
-	if (IS_ERR(master->core_rst))
-		return PTR_ERR(master->core_rst);
-
 	spin_lock_init(&master->xferqueue.lock);
 	INIT_LIST_HEAD(&master->xferqueue.list);
 
@@ -1625,15 +1653,6 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 	master->maxdevs = ret >> 16;
 	master->free_pos = GENMASK(master->maxdevs - 1, 0);
 
-	if (has_acpi_companion(&pdev->dev)) {
-		quirks = (unsigned long)device_get_match_data(&pdev->dev);
-	} else if (pdev->dev.of_node) {
-		drvdata = device_get_match_data(&pdev->dev);
-		if (drvdata)
-			quirks = drvdata->flags;
-	}
-	master->quirks = quirks;
-
 	/* Keep controller enabled by preventing runtime suspend */
 	if (master->quirks & DW_I3C_DISABLE_RUNTIME_PM_QUIRK)
 		pm_runtime_get_noresume(&pdev->dev);
-- 
2.50.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
