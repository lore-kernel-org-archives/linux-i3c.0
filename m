Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51047CD98DA
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Jun 2026 09:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dy4eGcCEgZ0vlnUvN1P86LapHXelNCoMkCHxuV5SDnY=; b=T64hRIiOUI98cj
	NbHdveSRmAJC9Wv9r1i6bkmJPoFrOvy9DhpQViael3Cohk6BtV0Kfca5JfaztV3J7l7jt/0lQ8lh1
	zmc3bDV8UKUTQqNWJJUR/74B2q81McX1YCgb7hxj6R/dEtHhvFEYW9KAD4qt2lV/Nl3mkTQhzlUch
	oMj/wWUxi6F619OP4J9U++9CuHLrsK/W26Cfq4fG1EV0i8nFYe/cauKJzlf6jbjUP/U5YLJfSIpiG
	pLrnZS1mCtOa30XrKSk5FHGVQNWMv59/680067wFOj8A8Qxo/IxF+rgQiceD5uDgDiSBaTfbGt9tJ
	u9p1zWdA4jWEqEt+lANA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZQXS-0000000FYO4-0DeO;
	Tue, 16 Jun 2026 09:56:58 +0000
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZQXM-0000000FYMI-1QAa
	for linux-i3c@lists.infradead.org;
	Tue, 16 Jun 2026 09:56:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bozB3zmWu4X+VrC87EJ4qMmqiM7hG0wflXz9eJSONwlYlNx7kaLSPgzCrjCW+HTCaqIA9rZ/fFnva9wfb6o7s4C4cAs4FUIL+FWdlAzhGaCbIRlSfrIE2/WcuK33VCogWuidsT0hl/R6vcjGi64GzXwLRHUUtxbK6FM2RSGivxFd9CisedaikvKz63RKMaE53duQgAtrkR368IXTmzrrgibKalBTe1t13x0YQPGLifemVRdFAyJV9dVGmk9EuZkZR5R4YiOSdiZ6v1oDDKY1s11m3pXvfdwDf6bQKvriKdx3Sw+QpO1jMYHxCb3iBQwE8m98u2Lafty5vZQRPXz47A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pGa8m0ZzIOPqNATfIbBHB5SLmNV12P+kJbtqmzNJDq4=;
 b=KfPS/wz/zncDKO+NmXm6dqqgw4297tahRQnAiv+HG5O9nfAijqtlt17HS8KSU3EMZFVay36rkjtAQ69+EgHBudfty0Pgb2hFNyBNKG6wH/QXTGzvzHG0YVW6AqMTdS2YS6o04jdZN9iP2OEX4Rtqcu7VSqHuvUm4nMyS7E7Wd0lX4e4bhJikli457sH3gle4A2NMSRPQAPseZUA0H0YGD+4v1yihSZFPg9daU8QtfWijp8qeWOPWb4JWCB+rf/28xa/qrt0lzCQVVJMjjqKCJeiT6xN9Q5jNFRPSJUVAorHBNlCH79cztuNBg/eIhIZes0ViNSKqq8oInh6tvPVasg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pGa8m0ZzIOPqNATfIbBHB5SLmNV12P+kJbtqmzNJDq4=;
 b=rwxMRnTwe22wVKx9TcI4r5oc056qK0tRR8k/nAxN2F2l7AYtyQcPEHHnrfGvtk0llFzU/x2QuubuEFJLpSINPv/UXxF9xwJp2vdDmyUWCVkn1jw4KoxGCjyHQAPxLmALk1SspFnL68vJu8vGpJ3MfzJ1b9ga3j9b8HP42hitzx8JdvFkfTeqdQ6z6z3nDbsWn7R3bQRrM1d/6s1uWE9pHs7BFUBXHmuKlFvNpkr/vWV2SVuByQRkqsX0OoU7ld6QCDOK6gx9WWQVfgxiKfs6DwljOQ50ce3wxoKHR241Y1y+8HEtgeYuRLSu8Q7Qido3NvIHrexBsObPmlO6t49oyw==
Received: from SN7PR04CA0204.namprd04.prod.outlook.com (2603:10b6:806:126::29)
 by DM4PR12MB6616.namprd12.prod.outlook.com (2603:10b6:8:8e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 09:56:42 +0000
Received: from SN1PEPF0002636B.namprd02.prod.outlook.com
 (2603:10b6:806:126:cafe::7b) by SN7PR04CA0204.outlook.office365.com
 (2603:10b6:806:126::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Tue,
 16 Jun 2026 09:56:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SN1PEPF0002636B.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Tue, 16 Jun 2026 09:56:42 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 16 Jun
 2026 02:56:33 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 16 Jun 2026 02:56:33 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Tue, 16 Jun 2026 02:56:29 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Frank Li <Frank.Li@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
	Philipp Zabel <p.zabel@pengutronix.de>, Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Akhil R
	<akhilrajeev@nvidia.com>
Subject: [PATCH v4 08/12] i3c: dw-i3c-master: Add a quirk to skip clock and reset
Date: Tue, 16 Jun 2026 09:54:22 +0000
Message-ID: <20260616095429.3947205-9-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616095429.3947205-1-akhilrajeev@nvidia.com>
References: <20260616095429.3947205-1-akhilrajeev@nvidia.com>
MIME-Version: 1.0
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636B:EE_|DM4PR12MB6616:EE_
X-MS-Office365-Filtering-Correlation-Id: 25c5d6d2-e5b8-4737-568c-08decb8d91bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|36860700016|82310400026|7416014|376014|56012099006|11063799006|3023799007|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: MXHQXKWqbENub+CMZSgqDb4qdr1NtnB+wGmSd/SDWNp4+mRlcESJrRvVMyPPGqRd9wVDu6h8wIcp+U+u8mCNC0fJ7IdqG6Q1Il/4YrcsZRdz4LbvzP6sE0QIsGLJ0T+Ft3R4LzWVJqgklEm5FQblwymgdS09gqnwcWgGTO+DfDaZVQ1pwtn8wwxJAouBntLol77/5KQIHd27wO/QBZYhNMH0a0dEreyspU00hry6517x53fRCcjLO9V4haIs6Z8uZh6p18YOnmKSa6k/xZQkmqLXzzHOt6FyJ6drt2V4aF4ZOCY/erhzzac6HNteLPnzOgHOE+Zv6eGc84vCbzTpIFhUGHuNSuUUT8LNuJ+4DPFw19SKwJG/kqEaUBaFyFmMcsc9WChgGHeP3dNw6CyJWHP/UVsLFYDtlqo4ZnJvc6pgM3Dok7JPfUeGyO9AyBkuiQBOmE8ImCmNFy3ZCzpheswhFCaU8QIp1zG7a1NVdi5aIOkZVW7u8Tl81iCoBlqPP3jol4Fq9hlcODIRn/IIOzwDaOaVgYVSDFbPdfol+b+4ZN23gzK+LwL6ektnIHZ0Ith6Lov8ZF/JoiOTnAS9v34Hm+Ishm4fSNiqE7dNhSRsf49zct9Cv93hfSWmyWOFPVPobrmx3bULyAyozL4OJRZleNTPvG9WlxAqk6TsYI3cGdz1ZA19vlX8zjC1qfG0271jw9l+3nUDq13pg/3QEcQ6jNEP7g2aS2QlRSoOk7U=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(36860700016)(82310400026)(7416014)(376014)(56012099006)(11063799006)(3023799007)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: E5tan8J3AcOUtVCfEAxu4qgCjaDsIdbWOOxcF3WGQ+KemIkUN0tNUB4lFGeOycEQUmrxfTxoCeJdy1Wfwjoxa2DCTh6wz638aiInUE8f6BkpfsA3+JwakRQyoppWoMtQYQA+BFVtpwm+wfG9fKA4HtQTJ6a/7qgje5nOSeaVaP8SpcfHq4/YG7u7CT58mpQ0qvPy2rK2iSRxPckyGVKL+x700O5Fj9yfbTeoAJm37yCWxKjQx0ZJ7nvcVu1q9BUR0PuqNGFkTKyLpajAs+dBC4iazUCnIm14wholPFseIG9LZ50zN6ts1xmLpfFa5peGDJQcUhV/0NpvkQEyzQYwrhmaPUx3ERR1PtbhHaRNHyAOhRdnXwe3cD8twvhDV1X4Sx9VVoRPibYdFleGTAwjEqBsiYuvBtKDIyHZKmFFnD2QhUZsz8AXMoGsvWC4emVt
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 09:56:42.7770
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25c5d6d2-e5b8-4737-568c-08decb8d91bc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6616
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_025652_407613_C7DD9314 
X-CRM114-Status: GOOD (  15.49  )
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
resources exposed via the clk/reset frameworks. Unlike device tree,
ACPI on Arm does not model such provider functions. The hardware is
expected to be brought out of reset and have its clocks enabled by the
firmware before the OS takes over. Any data to be shared with the OS is
passed using the _DSD property.

Add match data for such devices to skip acquiring clock and reset controls
during probe and read the clock rate from the "clock-frequency" _DSD
property. Note that the "clock-frequency" here is the controller's core
clock and not the bus speed. I3C specifies the bus speed separately using
"i3c-scl-hz" and "i2c-scl-hz" and hence this should not cause any conflict.

Also, move match data parsing before clock/reset acquisition so the quirk
is available early enough.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i3c/master/dw-i3c-master.c | 66 ++++++++++++++++++++----------
 1 file changed, 44 insertions(+), 22 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 3e510fddf06c..a2a4b88c2017 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -242,6 +242,7 @@
 /* List of quirks */
 #define AMD_I3C_OD_PP_TIMING		BIT(1)
 #define DW_I3C_DISABLE_RUNTIME_PM_QUIRK	BIT(2)
+#define DW_I3C_ACPI_SKIP_CLK_RST		BIT(3)
 
 struct dw_i3c_cmd {
 	u32 cmd_lo;
@@ -556,13 +557,28 @@ static void dw_i3c_master_set_intr_regs(struct dw_i3c_master *master)
 	writel(IBI_REQ_REJECT_ALL, master->regs + IBI_MR_REQ_REJECT);
 }
 
+static unsigned long dw_i3c_master_get_core_rate(struct dw_i3c_master *master)
+{
+	unsigned int core_rate_prop;
+
+	if (!(master->quirks & DW_I3C_ACPI_SKIP_CLK_RST))
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
 
@@ -1577,18 +1593,33 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 	if (IS_ERR(master->regs))
 		return PTR_ERR(master->regs);
 
-	master->core_clk = devm_clk_get_enabled(&pdev->dev, NULL);
-	if (IS_ERR(master->core_clk))
-		return PTR_ERR(master->core_clk);
-
-	master->pclk = devm_clk_get_optional_enabled(&pdev->dev, "pclk");
-	if (IS_ERR(master->pclk))
-		return PTR_ERR(master->pclk);
+	if (has_acpi_companion(&pdev->dev)) {
+		quirks = (unsigned long)device_get_match_data(&pdev->dev);
+	} else if (pdev->dev.of_node) {
+		drvdata = device_get_match_data(&pdev->dev);
+		if (drvdata)
+			quirks = drvdata->flags;
+	}
+	master->quirks = quirks;
 
-	master->core_rst = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev,
-										"core_rst");
-	if (IS_ERR(master->core_rst))
-		return PTR_ERR(master->core_rst);
+	if (master->quirks & DW_I3C_ACPI_SKIP_CLK_RST) {
+		master->core_clk = NULL;
+		master->pclk = NULL;
+		master->core_rst = NULL;
+	} else {
+		master->core_clk = devm_clk_get_enabled(&pdev->dev, NULL);
+		if (IS_ERR(master->core_clk))
+			return PTR_ERR(master->core_clk);
+
+		master->pclk = devm_clk_get_optional_enabled(&pdev->dev, "pclk");
+		if (IS_ERR(master->pclk))
+			return PTR_ERR(master->pclk);
+
+		master->core_rst = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev,
+											"core_rst");
+		if (IS_ERR(master->core_rst))
+			return PTR_ERR(master->core_rst);
+	}
 
 	spin_lock_init(&master->xferqueue.lock);
 	INIT_LIST_HEAD(&master->xferqueue.list);
@@ -1636,15 +1667,6 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
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
