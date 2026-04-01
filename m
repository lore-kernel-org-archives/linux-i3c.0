Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7429109B495
	for <linux-i3c@archiver.kernel.org>; Wed,  1 Apr 2026 04:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XV8gj31rHpMArRPZ5r8b6AabOs1D4LdgCVNZh04L5O4=; b=WbX+5/h/D3B4Xy
	+W+usKSZuRBQhvCjycxE+JUqMZ09JIW2QloHKHYkWWzvJ0Nw93eTa/uNi5eAYUuQ+5B1TCK9tcJRC
	NoV6iWRPpdUr7x8XPto4fVRS6QZeyORMRy0uSOQ341JLFm7rW12AMlnD7RjQAkNQOt6nYXCUHMQcp
	QP/GvVeS/8tUM+eUdRaz6j7EE8hCSOwrwWNXbMY2yWGHgjnQ+xzuM3NCnSaFAApht3k09vq1OyYtv
	fqHURAGIml4r5BPpZNoVVmERWsl4SPjtMU9dKhhDWXwrcr4HO+mo6JMbBqM8TLeeherxZPUBdRh87
	Ca2w08EPHDVI3v53SKvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7n3b-0000000DwLj-1tSu;
	Wed, 01 Apr 2026 04:19:55 +0000
Received: from mail-westusazlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c001::2] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7n3V-0000000DwJs-1JgA
	for linux-i3c@lists.infradead.org;
	Wed, 01 Apr 2026 04:19:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SiKPPGXdGjFWgZOj7ouw88z0ZXKECtvWVR3WdQIyMVP5SlF36wPYFRhssTIHZ1WxoeYIxp+PRYjgGb4fMhSHKXOUwfB4ON3k54ksTEgveTS/aWbrKxQF/CJI/JKNoLgpUMNswWlr3qfTJvE2J2lnuq9/lsygnPrpfSRhTEiadeGufSkGiXcNjiGE0P8B6w2m18E8yrGpOG0VbW0/S++8OfyflPHMkjWmPXqAKFlVMzEaLxEHORpzrJaMbh+vQVTYPNfzF6Fn4UPQqEnhGkCnn51xDLlaRhsRwDPw2hDuTkxJ/jjOBlV7UR5sNWOujyGjjYT3oixJN0F/m4tu3XW6YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=46xSIF7fc7o9FhOUB0Y7bgCkZAYR48w4iF6AEx/gC1k=;
 b=fTkswHSwCErTuMhIcQlQpn8jjn02pS+V85wwpTkvWfQ/Pztvl3Bry7t8qDLnI77SVUJt5ZXSxxXMe4a5oxkfygV6XdIVgUNXhS1DBOvv+KNQFYq0MagE4qnoqc7KrgN9v/1ysW5ZGQBC3BdTDBFobTMopwMNYKRzOzoN5JmwsMrlina+gLrqb2bICvqDyLlQGoh1G+de2G0jHaXB2pPysY0DBRd7Uk/ptqYzIBSSixLmc+qsnuzpRl+MHlt+9ahCdGaB+/6qS+xRfqGG9vL3JkGUbJ/LI7BjMl9cODy0sOVUVU8hl67AsJLLdCtVUVDgFoxKryxZ/aru+pATAanxgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=46xSIF7fc7o9FhOUB0Y7bgCkZAYR48w4iF6AEx/gC1k=;
 b=giCGSpdAxvlHZA1wnNr7bCIOM0DiFp20wm7nc+UcM3nt91T10bcOUjyDbaRo8Ep/b/6y+QCVbr3iagJ7ekiJG8a+/5JUy38HdpKoVVEr3Qkv02RGq8gdYypxelfP9COHGrC4uaoxdM47WgBubztR8MqZ6FEoCy+CHUE1iwxJ1C4=
Received: from SA9PR03CA0006.namprd03.prod.outlook.com (2603:10b6:806:20::11)
 by PH7PR12MB7307.namprd12.prod.outlook.com (2603:10b6:510:20b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Wed, 1 Apr
 2026 04:19:41 +0000
Received: from SA2PEPF00003AE9.namprd02.prod.outlook.com
 (2603:10b6:806:20:cafe::3d) by SA9PR03CA0006.outlook.office365.com
 (2603:10b6:806:20::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.30 via Frontend Transport; Wed,
 1 Apr 2026 04:19:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00003AE9.mail.protection.outlook.com (10.167.248.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 1 Apr 2026 04:19:41 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 31 Mar
 2026 23:19:40 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 31 Mar
 2026 21:19:39 -0700
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 31 Mar 2026 23:19:38 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Jeremy Kerr <jk@codeconstruct.com.au>, Joel Stanley
	<joel@jms.id.au>, <linux-i3c@lists.infradead.org>
Subject: [PATCH] i3c: dw-i3c-master: Fix IBI count register selection for versalnet
Date: Wed, 1 Apr 2026 09:49:37 +0530
Message-ID: <20260401041937.279621-1-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE9:EE_|PH7PR12MB7307:EE_
X-MS-Office365-Filtering-Correlation-Id: 4502591c-8d98-4e00-4e78-08de8fa5e54b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: EmQPjA9GxFlctQ/qIkGWDyN7ezlzl4dWQNcJ4z88gfywK8gANS4xE7PelNj8lv62rUlTpGP4oLXzjATdphFQigv03WiKAH2R1ipjcpzPudOjyPlM1zpxyN/R9kirG9joAy/C/gUrXaXMpXkNuScJ8UHNRuckEbWh1e4WJfbGOr7yV8bzALRZxnCR5fgkfIQMOyBx7Z/oL8DaXsxp2HoZhI1BCo2QzCqyKpJe+rm7HCCHhP5oEkq96B180qHIqVQ5FWO+DZ2h7AHHeaxRJyOMmFkG7FOaPbWfTvoSIxVUvrmISvzyHdLv/0pTqy316IWzqmeO8n6F+3EAv8u8+loP9sz0jlVJRtzbpN+Za2buBtIE7H+Tp4Gd/08fg+7kR62V+zU2yXre3nStKyVPPEm52oQygG7y8jGwHq8Rd3VogtQWKmQK1RfVjqgECByWgzOURZdhwUnYzi29spsR+Kzoxya9IpyPny2GVFicZu3jefnWTM3LigIKthKZgMFMhl3N2aKUQ4IAA7VH/AGWbTQt6XRkcmvqyXhwkt2lTfjGaG3UoqxNEYojH9Ufck7WjNqbxlfi/bFPRp3EnIll4sPY6te6ciEDnnZGSxn20yzIsAGlltlms5n8pO3xx4y2Sm/jbXj/zDVFOXqou6J2eqI46lh7Zo1eU+dshXzovCtvvwpt8OFBxiE/FODJoe8otFZYc7ZvZc7trcWEhdc7dOHP9YOGmvYe3oYbce8P3B294iAyRblPf7bxZOaUdpzNlHnzAPpyxql00wZ38g/5AyE1kw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: MKNhPEy+lojX6/LDxjd4qSE8OMXWYb+gs0n1OQcFaOKBU/mrGFrofnevcxXOO+nMkyTLHsaJX0Ap9Be66dGqkEPvwJItmuTLVHb4hQmi5B3/bJ245oMh+jdkjI3kBmm9GXbF96THU8iumBocm9WLIrWWgRKahA+zr8FWbtIMkYtbu/Cev1H2t/AJVpt6s3N8MzR/MusNs08FLChI20YtLRbqAvV5WVg116KQ4XkF9RTvrjiSyipEZ7gMJR9gpuSZ3J+EmV7MnnPUdK8eUKaq23+X1VNKgzRgl5It45r/TsxtubCiorWKDBpjPLcHOX7KxMA2f3Xv3djXCr4P8jCU9sTQkTn2Av9qbg+pHYsSbg0mVqdE1hconbcKxS2DYcsdNHYQXPaxLfsKhOERx+Q6OodpIxLCUSF64OfiMHC+DokN8LbDoelojZR6dpVAta5z
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 04:19:41.1843
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4502591c-8d98-4e00-4e78-08de8fa5e54b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7307
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_211949_538352_1D2C314B 
X-CRM114-Status: GOOD (  18.52  )
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

Fixes: e389b1d72a62 ("i3c: dw: Add support for in-band interrupts")
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

 drivers/i3c/master/dw-i3c-master.c | 21 ++++++++++++++++++++-
 drivers/i3c/master/dw-i3c-master.h |  1 +
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index f2a7f8122d9e..7a1782a69081 100644
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
 		n_ibis = QUEUE_STATUS_IBI_BUF_BLR(reg);
 	if (!n_ibis)
@@ -1588,6 +1592,7 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 			struct platform_device *pdev)
 {
 	int ret, irq;
+	u32 thld_ctrl;
 	const struct dw_i3c_drvdata *drvdata;
 	unsigned long quirks = 0;
 
@@ -1647,6 +1652,20 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
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
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
