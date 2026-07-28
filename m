Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C38C54F4C
	for <linux-i3c@archiver.kernel.org>; Tue, 28 Jul 2026 07:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PhQ1mG5HYEgXuIYmslX1x/8vUDOgjKB+PnCtlSxajH0=; b=jX1og1HUh+epEv
	NTnaQ32hhD4s6i4rqIMZzVqpbGB6ao9nhMm4Qo46ISzecmkf3KB6vrGqcUqSVxl1Dd4w4q3pRoqUx
	nRHf8BMLOyrrgcmxt6VF8Hl4yaHPg8ASO1CDMedkvKNPKp0+N/1OrnfGlGd5oNjKICL540/huB/1Q
	zb6KNZNwPPW4wS93Fa7aDKjMb51S6vKKMVrY5XAvb+4Mncb+ClG31dviHf3ZPq5gb5vPI4qHQqygu
	QI4zXHjCa5tAqsAthLD4aeuAs09LRxsupt+Hl8wUbnw5ru5+sgUVCyIr8OK3ltLRthXj21hyacWch
	OAdemln4ao/jTSWfbPvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wobps-00000004bMO-2Waw;
	Tue, 28 Jul 2026 07:02:44 +0000
Received: from mail-centralusazon11010026.outbound.protection.outlook.com ([52.101.61.26] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wobpl-00000004bKH-0pPf
	for linux-i3c@lists.infradead.org;
	Tue, 28 Jul 2026 07:02:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OQfHOdBD+8KGwd/U0Sgl0ax9SYI6fV7k+VuoAEjIxwMXWgTQHZ3Ml61skTWxuiM85dMMkdrEusqyIv6cYRyNDaq2f2ONAcTGB6K7wiqA3qw9zCu6NNQvQxTgCLg4lvsbO0qYpQxBVzsSuDoDSq9dFch9lP5ngDjc4aAstKbJGoJC5mZxzZYM00J5oGfp5NF3PjXW20FQqsaJu1g28+mq3eTHWTqmVNiFfaXxebES9Is/EbHMp9qK83wXCFWc04Mftvg+TwngQTddRzBMFGBWbTjgxL5yIgIiQICNIYarmVyuvJiZpdeRJDRD3VbyC1mfT04tVK7srN7+2upTfRKCMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W15LkEiE4+qiqvGSh1vvk/zg7bwNSbju2GxvuJwEQ8M=;
 b=v7P6Gn9Ea3eOGgysWg0VK2rX+KywuSi8ahCaH4j4JbT/F8OWgxWApPQSFXbNEWjEnPMoDF4enye0AG0U1g9VfAp1eybuIVjUlJO+peOnvPEb4+P+ZzPvEFgBPGFOJmBcNpNOaIpm0Wqr9/j8Y6vN52q65k9K8HK4W6BRcAQzaubOiBd64blYx8+lZorTU1uHYyogQN10hTxDlDCxpowJRNE5yZMjK4rub1rJsNQ45z6JqH0JvBLAVkhzeStGT865KpMApXhoPUaFBJNQcnKcl+7lQDdaRas/FdQ7Lp7jpWqNuEFX1vfIe3KvrocJ7b8wXtQWzZxx4kzDtgvV/FotzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W15LkEiE4+qiqvGSh1vvk/zg7bwNSbju2GxvuJwEQ8M=;
 b=LScMIQ+douHZB5WTw46cRYerPh2eIiltf5gQ+7GV+0stM9IXOrSRJy/SC07LP/0hGh93Z59Pd/pWq5DcEDYwVVP5v39YHwIijWb5Aahc5UKvOVcsWzXKPddz2MG0pP9fAgl9C2Pa1htRrEehu0O64acRPSDWIq0QnYEIJhomPfJxbnxQxnitdTxW9LvnkLe0iO6/3BO7PqKEuxxw8Er/WLniH/obXTBFFGYEvGJcHLyOY93pzSdbda8xFaVFpPPLEr2oqwbW7onbeOZMQ9L+9AM4pP9lXxi6qkOQOH3G56p/iQqVx/hMrQL2XUH3SKQu6b4Bpm4+lOT8qO0r7H8T8w==
Received: from MN0P221CA0004.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:52a::11)
 by DSSPR12MB999212.namprd12.prod.outlook.com (2603:10b6:8:376::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 07:02:32 +0000
Received: from BL6PEPF0001AB75.namprd02.prod.outlook.com
 (2603:10b6:208:52a:cafe::8f) by MN0P221CA0004.outlook.office365.com
 (2603:10b6:208:52a::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Tue,
 28 Jul 2026 07:02:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL6PEPF0001AB75.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Tue, 28 Jul 2026 07:02:32 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Jul
 2026 00:02:17 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Jul
 2026 00:02:16 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Tue, 28 Jul 2026 00:02:10 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Frank Li <Frank.Li@nxp.com>, Frank Li <frank.li@oss.nxp.com>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, Rob Herring <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, "Guenter Roeck" <linux@roeck-us.net>, Philipp Zabel
	<p.zabel@pengutronix.de>, "Jon Hunter" <jonathanh@nvidia.com>, Thierry Reding
	<thierry.reding@kernel.org>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Akhil R
	<akhilrajeev@nvidia.com>
Subject: [PATCH v7 08/12] i3c: dw-i3c-master: Add ACPI core clock frequency quirk
Date: Tue, 28 Jul 2026 06:59:50 +0000
Message-ID: <20260728065955.809445-9-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728065955.809445-1-akhilrajeev@nvidia.com>
References: <20260728065955.809445-1-akhilrajeev@nvidia.com>
MIME-Version: 1.0
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB75:EE_|DSSPR12MB999212:EE_
X-MS-Office365-Filtering-Correlation-Id: 49796b87-aece-4bd8-d388-08deec7631fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|1800799024|82310400026|7416014|376014|3023799007|11063799006|10067099003|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: UrqxLU7BQF6DFlSnp8vQai9QaSZ712A2N3SqPtzisUZYkU7zPZ7D5EzQzRBe+ItGau25FngT4/uz7IPGXpNUE+v5k2+A8RbzxulnzYAeBNHfdx4PxukrFPSsQLxLPcVS/+Ygm1A5++vgjGkt3SKR3bC0OaDd0+jnG2MfuSfGKDlsfem7NGzs5thRr3N80xTLd8EX/NIT6dQk19n/7pPtTFwpI4yxnWE/MES1Bs5f6AxS4sqEUfD5t2kxqjf2fKtU+he9oMegqBEJ1Q14Sqq/2uwgwVJ8PoReNJF927Yethf5wUfprQKvHozipRA4Ehsf4aQdWFJ0JHy/pnul+TgPgX7ueVeQCf6B1Y/Zc9nYJvvIryZh854LYNtqBp+C5uVOX8OZagXF+bjo4kOAuqXC9oKXXh5PLlV40xyaz92uS6l9yjjAoOJoLIt3gfXtrMA+DmlXX+6m4k6EVoWaAGlRczmX9Ri3QQEk5KE1xNbze0T8YcLOwa0qJwZELca0TuIs8GwWS6IrGRQymG6Jl/tchC7EwxsKgP24g88RZssdnZTWBoLlsgLNHPHyyo8fLPPkvo6vVOzBUt4U/l7634x05eIPlaFeFTnHLlkcfUV15G6inaox5HK/Kzq50Z4wpZjbnOWc147TXKe0O0SexZvBhegIUg14CHfGtVYIyvvW/5868f1K86rkdTo+OjH+jZNoa5qwPq782Ac/RHP15Ro5WQ==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(82310400026)(7416014)(376014)(3023799007)(11063799006)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 1r9UVZmx2VP3KwfoDSEpgs/W1LFnei8WyXBKujjzQ0pSfmmVUHzkDebI5hrfhj6Rg8fugZP/IH4hNOUT6wt/B6LbsTlUAC29XPmU2uBci4F9qtVes6Y+ZY5k7PpBYpvAwuhlYQqPaVfgBkEi0THzP/LbQ77tGhBSyQfsXXrY0ok6czBI02/iYScXSlLFjSXKmZyxeYeFelqlEwu9WyA9ozng8ZkKGc+Qhqf6goOcy5Hs6naklM++Dn/mC3WSYow7d/XoPQhNm1Cgf7nq4cexwzva+wKTR0rkJXXFs84CYFmAVa4ksuQyyfBDruT1MfcggqWGrwez06GmX7zY/xwbT/Vqw4SLtrfUxLck5sMS0ZJhwIHcb33Q8PNXngsp+GIbUpHRYguoNHsx49UzpqXNMwSDfmGlBYsdcVKTTt6SSjJQEW95lC9ZRSn7O1ZSm/cy
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 07:02:32.0396
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49796b87-aece-4bd8-d388-08deec7631fd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB75.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSSPR12MB999212
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_000237_238236_638F54C3 
X-CRM114-Status: GOOD (  13.41  )
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

Some ACPI-enumerated devices like Tegra410 do not expose the controller
core clock through the clk framework. Unlike device tree, ACPI on Arm does
not model clock providers. The hardware is expected to have its clocks
enabled by firmware before the OS takes over.

Make the core clock optional and allow selected ACPI devices to provide the
core clock rate through the "clock-frequency" _DSD property when the core
clock is absent.

Resolve device quirks before acquiring the core clock so platforms without
the ACPI skip-clock quirk still fail probe immediately when the clock is
missing, before any MMIO access.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i3c/master/dw-i3c-master.c | 45 ++++++++++++++++++++++--------
 1 file changed, 33 insertions(+), 12 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 29030fd9594a..273d7a002099 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -242,6 +242,7 @@
 /* List of quirks */
 #define AMD_I3C_OD_PP_TIMING		BIT(1)
 #define DW_I3C_DISABLE_RUNTIME_PM_QUIRK	BIT(2)
+#define DW_I3C_ACPI_SKIP_CLK_RST	BIT(3)
 
 struct dw_i3c_cmd {
 	u32 cmd_lo;
@@ -556,13 +557,28 @@ static void dw_i3c_master_set_intr_regs(struct dw_i3c_master *master)
 	writel(IBI_REQ_REJECT_ALL, master->regs + IBI_MR_REQ_REJECT);
 }
 
+static unsigned long dw_i3c_master_get_core_rate(struct dw_i3c_master *master)
+{
+	unsigned int core_rate_prop;
+
+	if (master->core_clk)
+		return clk_get_rate(master->core_clk);
+
+	if (device_property_read_u32(master->dev, "clock-frequency", &core_rate_prop)) {
+		dev_err(master->dev, "missing clock-frequency property\n");
+		return 0;
+	}
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
 
@@ -615,7 +631,7 @@ static int dw_i2c_clk_cfg(struct dw_i3c_master *master)
 	u16 hcnt, lcnt;
 	u32 scl_timing;
 
-	core_rate = clk_get_rate(master->core_clk);
+	core_rate = dw_i3c_master_get_core_rate(master);
 	if (!core_rate)
 		return -EINVAL;
 
@@ -1573,14 +1589,28 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 
 	master->dev = &pdev->dev;
 
+	if (has_acpi_companion(&pdev->dev)) {
+		quirks = (unsigned long)device_get_match_data(&pdev->dev);
+	} else if (pdev->dev.of_node) {
+		drvdata = device_get_match_data(&pdev->dev);
+		if (drvdata)
+			quirks = drvdata->flags;
+	}
+	master->quirks = quirks;
+
 	master->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(master->regs))
 		return PTR_ERR(master->regs);
 
-	master->core_clk = devm_clk_get_enabled(&pdev->dev, NULL);
+	master->core_clk = devm_clk_get_optional_enabled(&pdev->dev, NULL);
 	if (IS_ERR(master->core_clk))
 		return PTR_ERR(master->core_clk);
 
+	if (!master->core_clk && !(master->quirks & DW_I3C_ACPI_SKIP_CLK_RST)) {
+		dev_err(&pdev->dev, "missing core clock\n");
+		return -EINVAL;
+	}
+
 	master->pclk = devm_clk_get_optional_enabled(&pdev->dev, "pclk");
 	if (IS_ERR(master->pclk))
 		return PTR_ERR(master->pclk);
@@ -1636,15 +1666,6 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 		master->has_ibi_data = true;
 	writel(thld_ctrl, master->regs + QUEUE_THLD_CTRL);
 
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
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
