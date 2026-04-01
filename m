Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19CF5D35160
	for <linux-i3c@archiver.kernel.org>; Wed,  1 Apr 2026 08:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=E9M+++ZqZiEsBiemUFNsBai9Ai0ptn5VOF0GigtodV8=; b=DAM2CRjhIrOPWi
	8sy48Zaualv+K9CrL/Z8MpsOECwcPAJmWaOzVp1vKmQVv456rnzql0MjhsV1c/IGeTKrNopGCJd2r
	WPuQMQuyQU2ONhtHA6Q39YjMdUyJy1MLEnXlPJ6hRJ2nn6lg5l8i3K66220mrCXMFUIo9k2xOqtIf
	ZSIyW0uasFWaAFLASh/ACkwdyKru7QDJ0ns+bpUnQHCbLsaPt9lp3v2CvvmQLKyAp0W45hutgVZVM
	8i3+vgx+ghLzwpE2F08pH17Iz9abGga/0gHXr6dqAf2LAYGPCPDvVmH1/o36ZAaTQKD+QV1NkaXRC
	2mN+oy7ecRGkmS4p6ktw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7rBr-0000000EL9C-3XPJ;
	Wed, 01 Apr 2026 08:44:43 +0000
Received: from mail-westus2azon11010000.outbound.protection.outlook.com ([52.101.46.0] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7rBp-0000000EL8L-013Z
	for linux-i3c@lists.infradead.org;
	Wed, 01 Apr 2026 08:44:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CVil5vNaigofkbOt/lghUZAgxYJMshIPmjhpyrLHXjzrwqGh1XGgEF31DcBb8ke1cWerR+H7xrseqdqfJNLX8X/hPWS/QCB1pUZIoCR6q0p4IVtf1xl79AsHd7jTgf4VMrHRdLGHAdDv6jvWRyP5qVKfChp4nAjr+jZ5h/k3kJ/CoVH3kS42Ac51CkbnWAQCbzJPuvygy3tS6c99GOMO8e+m2kbnObn6wP3BWUcHxKrOlbyQql+orPKbbB2rgZlFpHBupGZlK+aY0Ey+ROGmhhP9Iu78o6PJx4iR0LK7mHMwt3SNzYiO4DwMWGHuwAK2Blzes7q39ZK+/pHc9tl1vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bHLu8xUyoZlKf5+tUBKZI5t/lxWKxyTNrjanRa7wxWE=;
 b=TcsO3LrUzrQicNHudxQd5Q3gAzwAehsG9NR9RCQJsEZe7RGZOYA8Ka1oE2SQhU1q6ocbwnxc5jN777RZraq+f0Out+xuD0QiuXxrlQJ4QG72/JwfZzdRPHLH7KWeEJST8wOLHwdU+xsYM63LEmoT9dNcaPfTGWzcrK3G3rtDc3Zvgq3OI8nh676SJfGVx6Zvk3V65bEkLYwFkLwxFldZPUuHo0Sv3SWaC96Bh5kUWF75WKe0GpOsCKIjtB8gSpUXNLf9tQ6VbZelAZZbCQNNy/TBnAiuGGridUg86HF6lCvS6uTkSNDcX042RD2kY5HHDSEqGpP1MqXHS6IxjdgRmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bHLu8xUyoZlKf5+tUBKZI5t/lxWKxyTNrjanRa7wxWE=;
 b=P2xxmYIusFjc1Iu/cmqO1ktxAy8g3tEZObCBF2Xkjhr0e3yDHPm5y1yhA815zDoPa4a1uzTllOD8RC/tQZ/fTnWFUDUZqrzac976zjqAYYRYJ+Tazv4l1rkGQTb7w9bRRnxYZXuxkW5vRKqvTR2Gpj6/RQ+UHRw2+6LrlYtsJFU=
Received: from BYAPR01CA0054.prod.exchangelabs.com (2603:10b6:a03:94::31) by
 BY5PR12MB4259.namprd12.prod.outlook.com (2603:10b6:a03:202::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Wed, 1 Apr
 2026 08:44:34 +0000
Received: from CO1PEPF000066E6.namprd05.prod.outlook.com
 (2603:10b6:a03:94:cafe::19) by BYAPR01CA0054.outlook.office365.com
 (2603:10b6:a03:94::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.30 via Frontend Transport; Wed,
 1 Apr 2026 08:44:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF000066E6.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 1 Apr 2026 08:44:34 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 1 Apr
 2026 03:44:33 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 1 Apr
 2026 01:44:33 -0700
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 1 Apr 2026 03:44:31 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Jeremy Kerr <jk@codeconstruct.com.au>, Joel Stanley
	<joel@jms.id.au>, <linux-i3c@lists.infradead.org>
Subject: [PATCH v2] i3c: dw-i3c-master: Fix IBI count register selection for versalnet
Date: Wed, 1 Apr 2026 14:14:30 +0530
Message-ID: <20260401084430.436059-1-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E6:EE_|BY5PR12MB4259:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d691511-b4b8-486e-9929-08de8fcae661
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: nEycHcDkIR+Y+PmEmZAll4uaeVOUVbCaMPWclwNieGuHps1IOknFHQHhM4mmUt1CJa85PjLdxC4ooZfzzKbmDAZH2OqXCosUESB36CQVK6l+zMxQr/mrNbiLyUGkO2BFj086QtSBns7EWMk0XyEE+tQLlp1Sm6d95oWhtIdcTqj/M6h2iEHKIIuzJsA+JUNnDvh1jhk8jzRGF32qefkKQvgEZIQcCXm+mC8L922Kt6m5dk+hxvGC30eHotPRqeBoMwx7zvvnd4GU0cw/SlV2jPG+tAhCjLL28JgK+9/uqu2UL+xGQdOcO1Sw89912M3FgKi5GG3ZDP7Wbk1iuQje73oBUyc0EC6ToLqjk4Av0pKyKSrSRUi4SktIQeQE3z/cKrvFiSDPdZMj44mw2f+MOp0SzawjPCkxYjLb6sGnrBMFa2gF5zyT2IOBIK94HTdWHE6Va6/mdm1BkMJAobtwAu4w+y/v+ZtYpCayVQh61d2dncn7JJt8I8IYV+AB/IS0KIeTSvsITqQuE71ktv0sll30KW+IO87m28OKyG64j1dqOTnLTQQ7JdzGz9S5LPiJDB6vOKWMhQ1VV21TDjKsITkoNGSdJWeu6Z4FghEAx2+wlimBvuL+44xLIGiS7AsQFNOpmNmF2VSgkrYXrQbDwltKVNnwPUNSzfp9uQVxHzQt7fO8Rin9KFtznGa1/QuuYqfIYXYgmciDoey7fXr3O+AR/urU6afd82n94Vf98OGutiJIeshVqx38MbayMDruk5QlUtJRahZMEljuywDysw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 9Ih2IAB1gBE58uZ6wjcy/2r1RWj21uLhMMxCslI1gE4Ny0N8AwFFUHJR3VK3GbcFsTxduk1i4nEqzzAM/TAwTXCaAgH1lweoUOv46JsgXrM0nt5O+s2XF5wuJdRvNWqJpqsxO350DSPA/2LE3UQVY+WZ796C30LGu3C6Yq1on8nrVvxpLwp/iZ4YzbqaEGnLVBJPBtXa51UDRyXtLYVaDbmqYwmzkKYRMzKSxA9i5SR4o+yN8sEoiRckokuG/cDLzDGk/azhDXaxHWcaQA0MAXmwUdTMI0JetOcnmB8RlJ64Nz7CTALdxPd+m+CgY5Uglw8vTCzqlHyKptFcfBtNy355iaJD1KjC67zHo4hQsArHp2pyaM+IPXAuvqp6sx2TIwxHdZOycM631pvx+ML+8g8Hk3xdN9YXdi0H2s5tkF/no5/tJ1Bg7Mm/BvYJDdkJ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 08:44:34.3768
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d691511-b4b8-486e-9929-08de8fcae661
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066E6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4259
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_014441_047218_3282F828 
X-CRM114-Status: GOOD (  17.73  )
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

On DesignWare I3C controllers where IC_HAS_IBI_DATA=0 (such as versalnet),
the IBI_STS_CNT field (bits [28:24] of QUEUE_STATUS_LEVEL) is hardwired
to 0. The IBI status entry count is instead reported via IBI_BUF_BLR
(bits [23:16] of the same register).

irq_handle_ibis() was unconditionally reading IBI_STS_CNT, causing it to
always see 0 pending IBIs on versalnet and return early without draining
the IBI buffer. Since INTR_IBI_THLD_STAT is level-triggered against the
buffer fill level, this left the interrupt permanently asserted.

Detect IBI data capability at probe time by writing the IBI data threshold
field in QUEUE_THLD_CTRL and reading it back. Use the result to select the
correct register field in irq_handle_ibis().

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

Changes in v2:
Remove the fixes tag


 drivers/i3c/master/dw-i3c-master.c | 21 ++++++++++++++++++++-
 drivers/i3c/master/dw-i3c-master.h |  1 +
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index d6bdb32397fb..e43bdc9abeb1 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1455,7 +1455,11 @@ static void dw_i3c_master_irq_handle_ibis(struct dw_i3c_master *master)
 	u32 reg;
 
 	reg = readl(master->regs + QUEUE_STATUS_LEVEL);
-	n_ibis = QUEUE_STATUS_IBI_STATUS_CNT(reg);
+	if (master->has_ibi_data)
+		n_ibis = QUEUE_STATUS_IBI_STATUS_CNT(reg);
+	else
+		n_ibis = QUEUE_STATUS_IBI_BUF_BLR(reg);
+
 	if (!n_ibis)
 		return;
 
@@ -1586,6 +1590,7 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 			struct platform_device *pdev)
 {
 	int ret, irq;
+	u32 thld_ctrl;
 	const struct dw_i3c_drvdata *drvdata;
 	unsigned long quirks = 0;
 
@@ -1645,6 +1650,20 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 	master->maxdevs = ret >> 16;
 	master->free_pos = GENMASK(master->maxdevs - 1, 0);
 
+	/*
+	 * Detect IBI data capability (IC_HAS_IBI_DATA): write a non-zero value
+	 * to IBI_DATA_THLD and read back. On controllers like Versalnet
+	 * the field is hardwired to 0 and the write is ignored. Restore the
+	 * original register value after detection.
+	 */
+	thld_ctrl = readl(master->regs + QUEUE_THLD_CTRL);
+	ret = thld_ctrl | QUEUE_THLD_CTRL_IBI_DATA(2);
+	writel(ret, master->regs + QUEUE_THLD_CTRL);
+	ret = readl(master->regs + QUEUE_THLD_CTRL);
+	if (ret & QUEUE_THLD_CTRL_IBI_DATA_MASK)
+		master->has_ibi_data = true;
+	writel(thld_ctrl, master->regs + QUEUE_THLD_CTRL);
+
 	if (has_acpi_companion(&pdev->dev)) {
 		quirks = (unsigned long)device_get_match_data(&pdev->dev);
 	} else if (pdev->dev.of_node) {
diff --git a/drivers/i3c/master/dw-i3c-master.h b/drivers/i3c/master/dw-i3c-master.h
index c5cb695c16ab..306e25a08937 100644
--- a/drivers/i3c/master/dw-i3c-master.h
+++ b/drivers/i3c/master/dw-i3c-master.h
@@ -51,6 +51,7 @@ struct dw_i3c_master {
 	u32 i2c_fm_timing;
 	u32 i2c_fmp_timing;
 	u32 quirks;
+	bool has_ibi_data;
 	/*
 	 * Per-device hardware data, used to manage the device address table
 	 * (DAT)
-- 
2.44.4


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
