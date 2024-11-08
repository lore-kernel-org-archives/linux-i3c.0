Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D557D5E145
	for <linux-i3c@archiver.kernel.org>; Fri,  8 Nov 2024 07:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WmFhdiitonmi7NDD9N16NdErwxNhnmyxpDBdVp9JNPI=; b=fy6akMIhnr+uba
	Ikt2A/N8GP7VwrnJQ2SijYzQZMzqCoQXtd6lMkWEbk6OF3I8Ub+Q56YrLMiLw/D3PgcwATdIOShqi
	BrrFWs8PJJYHAiATsyIAYpHoPxwSCY2vbeb35ADHAA64I4Rwb4Q0oZb1A219xw3t8R/NPlkDnSpPx
	D5Sn0tDCJaUDUA9WIgHMx1RUN7uTH23dWjr02WhqJsaRMZfKPuhGMA8keOGY93NGEKf5GLbhDwyHV
	DeWSn5iX9S2HZN0yklx7G0lZy8MbqTb/ZcBqZ8ZOf4SUmxTZrRjJuwH/UIACgNtb5Sy5FNsOfyynT
	//oaaueT9RmcIMfWynYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9JVe-00000009d57-32l0;
	Fri, 08 Nov 2024 07:34:22 +0000
Received: from mail-bn8nam12on20615.outbound.protection.outlook.com ([2a01:111:f403:2418::615] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9JVb-00000009d1s-1m6L
	for linux-i3c@lists.infradead.org;
	Fri, 08 Nov 2024 07:34:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GqAo/dBTI2iA0TdN6MXIwoor5xRod7jCwnPvUnrAcKxm7BshCfALnlEpv7/R4CaBhL1jzy7JEAbr4DlKg7QvuB9jTz4s7NWHDOchOnuP1CYdaInAqmDCDfn7wUtVGSeep7IRrN3Uh/23WFTAXSLPduX6sCZrzQXygMZbSSj4TucUQYdUhTPEZEg9BIfcPV0n5zKUayYE5hIyoVrsUEwBBf3byxxFqOZ7b85frls8bMwY7YhYHICgYqeGXiDat6/zFWtulyh8cOkesShDav8yNF0/vE86MTtAZxHgestWxKuKbBfTCjXmu0pWHLSPLAdXPoFX9xdv/JvITHm2Pc5weg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5eLWDscx0DGim5Ucck6S9hlO6uZ6gHFYGZM9LRDe4SI=;
 b=WbRZdVa0yeVnaXP9oWwQl+iUYR9e3rI7lS6iz85bCR3xO1SEAfJ67AJyC1Rgdi/VIkr/mq3We/eaMrWIStLTtVUw/u9pZrrsC5rvp68406FbGLS3Pli8/mFHysbvUs92izvIShSDWP5Jpv37qhBnMl7FskGWnPlObdyE+7/SfV4Eug73qC5h1OZx8Cd//1CC6jn/sS7b2VfEWqUjl7eRVK0tPRos77XttVe+xu7zpCc5QiCIRxqVzoPrKv0NCmSdghFEjQIjUOLbfv5ii5KUaxqrMSwQu9GwLo4Nbjep5i8PFh7tbwq3svY72uOrjm/q69VVC/9YFuvLXEeifmlr+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5eLWDscx0DGim5Ucck6S9hlO6uZ6gHFYGZM9LRDe4SI=;
 b=uTCpvILqywTMfAZJpnsm1pN+NoSyWWS8D2ZBPWPdten3WjLIcRN32bifUZaD/KpY1dyzHxTMRjQYfqrxux8zhBKQ8Wg9SnzmES5rrUBB25+nAvmOTVFs93rYQTRNV2xfUEXAx032K2cseDtlJsv3COncwyP/OWIvc9oCTe+WMRI=
Received: from BN9PR03CA0957.namprd03.prod.outlook.com (2603:10b6:408:108::32)
 by IA0PR12MB8864.namprd12.prod.outlook.com (2603:10b6:208:485::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20; Fri, 8 Nov
 2024 07:34:14 +0000
Received: from BN3PEPF0000B06D.namprd21.prod.outlook.com
 (2603:10b6:408:108:cafe::24) by BN9PR03CA0957.outlook.office365.com
 (2603:10b6:408:108::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20 via Frontend
 Transport; Fri, 8 Nov 2024 07:34:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B06D.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.0 via Frontend Transport; Fri, 8 Nov 2024 07:34:13 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 8 Nov
 2024 01:34:11 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jarkko Nikula
	<jarkko.nikula@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 5/5] i3c: dw: Add quirk to address OD/PP timing issue on AMD platform
Date: Fri, 8 Nov 2024 13:03:23 +0530
Message-ID: <20241108073323.523805-6-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241108073323.523805-1-Shyam-sundar.S-k@amd.com>
References: <20241108073323.523805-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06D:EE_|IA0PR12MB8864:EE_
X-MS-Office365-Filtering-Correlation-Id: bd995e9b-9581-4327-943d-08dcffc7be5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+jMP6aeMpSwkj6o21K3MpY78ciOl63HmXESR2UDGxvBvmXad8w4Y1kJeFJdO?=
 =?us-ascii?Q?0xpwgP+qHTGyibuvWnRng0Xt/GvjUmiwqhO0KBuTCVo8wZb+ljDxVxGGgTRg?=
 =?us-ascii?Q?h4i97agz/hfPOXi0x1T0k9AyRmb/V323d/X8/LxGawAaDGoIHxCTgVMSaBF1?=
 =?us-ascii?Q?2oLejN4/46vs0YfrnpI33mix82jY9Rew+DpRRJjWhySPQhmMF4dtkarsd20W?=
 =?us-ascii?Q?qp7JK4b7g2pNUQvMkDk5IssHrWPB/vPBdHKvqFc+fQZK9GkQLpJ34som+NXB?=
 =?us-ascii?Q?i4X45KMYxmyXSER6nPcBnURfXqa8Pf87GNRWXWrL8XR8K9antG88zwlEaW0x?=
 =?us-ascii?Q?FDbx6x1DVJ9Bzb+WfXbxLz/hKTTvF3sl1Z2VqsYJY4Xuvtnw9zetN3gJPPDy?=
 =?us-ascii?Q?GZZJNpVR2W4zoWnyj4WfSoZ1gB5tEcyCRnE/L6pWCGoQ0SFV9Yw9EPshRFXH?=
 =?us-ascii?Q?4RBJSmdLUe1Pa1n/oRtFWfpa8E7VvVD4p8949l7A8sn+Ubp27gP+F09EX2TF?=
 =?us-ascii?Q?Gt4d57ZmcDHmu5ZKoDTZKDc2yJ9+UsginbGXIe2Nvtailc8fI/8FqUrIbuCK?=
 =?us-ascii?Q?cu4I5Ueozlq8uXWaEGyMOsmIFa9SFpB9SxFdRULg9mqSqpsCZHH28dudbQxY?=
 =?us-ascii?Q?YBEQ1SpUzzJeZgCQenM5THnnBRHNKsNXTZTCtWYz2MD+JWi6B+VL0PuLsUID?=
 =?us-ascii?Q?ChVIl1CRw74hdMmKoFy8Em+mEG5TJKDoFXw89gwNvxMAjr59O3T4kLhkvJYJ?=
 =?us-ascii?Q?uO2/PsqRbDB57Jk2fod50XtDNmwEWR6KQOSmCtTpDY0hh82RAyt+ONP7DTPg?=
 =?us-ascii?Q?bmAPdBo+rWqRS0Rmcq99BfLF+kmjY7IkZFG6Pxq67rxBoNqAzrlULDaazDb7?=
 =?us-ascii?Q?hRqP8EUWdM7V2VmMKCYGAzrGLzi78mmhVbi7pWN5wP30fWJkiTukZzHhSFf1?=
 =?us-ascii?Q?q3nOcyk0Ui0WDpM88lkEmIR1jVcV4lpuwpk3zYfhnXNNy/FOHwnj3qua8DJx?=
 =?us-ascii?Q?4VnwwsbZU5O/d1a1pXy7ypTs1EnA6/+ZaL02GVoUcSupLuTglk6ip/NdAVbC?=
 =?us-ascii?Q?JHCyUW8qjwxn0+w72YDAVQNoQXuMVURL8YMrKoD/3Q8mNB2WJtV+AJ1wFXMh?=
 =?us-ascii?Q?6SVoIB1KjEyHiSBKnWcbg2X5Po5QklwpFqCfjz6dsZDgAIdQyrXybdrplpt7?=
 =?us-ascii?Q?HIYTs5QreACftCrjY0I4drGHlR1FbQ49u0B758edBJq5e3ESQuTSPz7yUqGY?=
 =?us-ascii?Q?7MfVa1xO2qNhETjlvoZ9QtopbzFq9C6EEg+wwiYfMvfqhIGq0e5JNrz6ruaM?=
 =?us-ascii?Q?r4+YCozgm72BPIvARaBtISnsMQsKYMSP5UPR7iPcto4XnWzgSF4aYUea7vaH?=
 =?us-ascii?Q?ZXuC0s1L/BVz0PzALNwdyW17NdJ2FEKR2ht+MHCb38Wvcb7Wnw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 07:34:13.6586
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd995e9b-9581-4327-943d-08dcffc7be5e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B06D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8864
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_233419_562288_C67144B9 
X-CRM114-Status: GOOD (  18.08  )
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

The AMD Legacy I3C is having a problem with its IP, specifically with the
push-pull and open-drain pull-up registers. These registers need to be
manually programmed for every CCC submission to align with the duty cycle.
Therefore, add a quirk to address this issue.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/i3c/master/dw-i3c-master.c | 29 ++++++++++++++++++++++++++++-
 drivers/i3c/master/dw-i3c-master.h |  1 +
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index dc701275485a..029f81729333 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -220,6 +220,14 @@
 
 #define XFER_TIMEOUT (msecs_to_jiffies(1000))
 #define RPM_AUTOSUSPEND_TIMEOUT 1000 /* ms */
+
+/* Timing values to configure 12.5MHz frequency */
+#define AMD_I3C_OD_TIMING          0x4C007C
+#define AMD_I3C_PP_TIMING          0x8001A
+
+/* List of quirks */
+#define AMD_I3C_OD_PP_TIMING		BIT(1)
+
 struct dw_i3c_cmd {
 	u32 cmd_lo;
 	u32 cmd_hi;
@@ -795,6 +803,12 @@ static int dw_i3c_ccc_get(struct dw_i3c_master *master, struct i3c_ccc_cmd *ccc)
 	return ret;
 }
 
+static void amd_configure_od_pp_quirk(struct dw_i3c_master *master)
+{
+	master->i3c_od_timing = AMD_I3C_OD_TIMING;
+	master->i3c_pp_timing = AMD_I3C_PP_TIMING;
+}
+
 static int dw_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
 				      struct i3c_ccc_cmd *ccc)
 {
@@ -804,6 +818,13 @@ static int dw_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
 	if (ccc->id == I3C_CCC_ENTDAA)
 		return -EINVAL;
 
+	/* AMD platform specific OD and PP timings */
+	if (master->quirks & AMD_I3C_OD_PP_TIMING) {
+		amd_configure_od_pp_quirk(master);
+		writel(master->i3c_pp_timing, master->regs + SCL_I3C_PP_TIMING);
+		writel(master->i3c_od_timing, master->regs + SCL_I3C_OD_TIMING);
+	}
+
 	ret = pm_runtime_resume_and_get(master->dev);
 	if (ret < 0) {
 		dev_err(master->dev,
@@ -1610,6 +1631,8 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 		dev_err(&pdev->dev, "Failed to get acpi device handle\n");
 #endif
 
+	master->quirks = (unsigned long)device_get_match_data(&pdev->dev);
+
 	INIT_WORK(&master->hj_work, dw_i3c_hj_work);
 	ret = i3c_master_register(&master->base, &pdev->dev,
 				  &dw_mipi_i3c_ops, false);
@@ -1683,6 +1706,10 @@ static void dw_i3c_master_restore_addrs(struct dw_i3c_master *master)
 
 static void dw_i3c_master_restore_timing_regs(struct dw_i3c_master *master)
 {
+	/* AMD platform specific OD and PP timings */
+	if (master->quirks & AMD_I3C_OD_PP_TIMING)
+		amd_configure_od_pp_quirk(master);
+
 	writel(master->i3c_pp_timing, master->regs + SCL_I3C_PP_TIMING);
 	writel(master->bus_free_timing, master->regs + BUS_FREE_TIMING);
 	writel(master->i3c_od_timing, master->regs + SCL_I3C_OD_TIMING);
@@ -1757,7 +1784,7 @@ static const struct of_device_id dw_i3c_master_of_match[] = {
 MODULE_DEVICE_TABLE(of, dw_i3c_master_of_match);
 
 static const struct acpi_device_id amd_i3c_device_match[] = {
-	{ "AMDI0015" },
+	{ "AMDI0015", AMD_I3C_OD_PP_TIMING },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, amd_i3c_device_match);
diff --git a/drivers/i3c/master/dw-i3c-master.h b/drivers/i3c/master/dw-i3c-master.h
index 219ff815d3a7..c5cb695c16ab 100644
--- a/drivers/i3c/master/dw-i3c-master.h
+++ b/drivers/i3c/master/dw-i3c-master.h
@@ -50,6 +50,7 @@ struct dw_i3c_master {
 	u32 bus_free_timing;
 	u32 i2c_fm_timing;
 	u32 i2c_fmp_timing;
+	u32 quirks;
 	/*
 	 * Per-device hardware data, used to manage the device address table
 	 * (DAT)
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
