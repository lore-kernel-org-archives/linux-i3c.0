Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C431AD65C7F
	for <linux-i3c@archiver.kernel.org>; Thu, 14 Nov 2024 11:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w5gkLmJ+RIN+68apreZTg3uRndMvkWwsQxYoYP8iz6E=; b=vk21hEheGtpXst
	85E/GnLd02hP1ljeW7y+FfhKJ/ygcS9xZq7h3PzEU5IolHUWyUKIKi4XWBenavzwvchtV3PO5svi9
	WxWl5M73zwQG6hqRolWvRXW5AgBJ/NabrVHQkwt/LCnm4nH73k3ecQHcxBEU2y15gKXWd9+ch6vZm
	FJBdbPfThsXTtXu68CTLxM1I+M3duvgXXl8Boko1wVJTGSRrE5COgywiVNE6+1AhkD/vhqaZ1XG65
	q32UcbWrVDY1EN8bm24jfoADSyts4bS1G2fEq1/VZYP+xNwornDhwBuY4To1347hNo3jejg4w9owu
	MCV0GJneQIasC0av2JOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBYIh-00000009mOU-1kRc;
	Thu, 14 Nov 2024 11:46:15 +0000
Received: from mail-dm6nam04on20615.outbound.protection.outlook.com ([2a01:111:f403:2409::615] helo=NAM04-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBXd1-00000009eI9-3i9e
	for linux-i3c@lists.infradead.org;
	Thu, 14 Nov 2024 11:03:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gvEl0r33xrs4SCH0Hv2F6seaKNqDPFVT7Zy6bvLkVR2fp+3eHgpnAaMPfAVgQBGOhGJZbuyULyKdDXVo7MYeWf4VzsIrkHRhHqvdiDcsw1+GwVOknHPNxaDYNwGsIi19LQ60LWXsh5vFyetzr8qtNTnyMkkOYGwmQtOipfmH+C3e2g++DD/oj5gw1c4WKwd7IbOKIuKLJOMApKg3xNVMfbsXVdKb2SJ+a2cgCzscfwDEA/nzHe1S0rw3H+Jr5S9QPVlDjDIWJx/X0f0rrIFasCpgTcdOYChjRBexPGm6WOlYCYKSRFRYmJhVkuvol2n/yph5Bw/wOZh+Eyy3Ie+CkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2/vSk/DTVHzr5SPHLLdLTp45dLNo+KoJM6NFiitEswc=;
 b=VOwR8Z8WDzNTUKGR56wWl6S07TnhbPACx4U8zEDX+UFHKJtQ1Fdk68DZ+TlEY/OUL85+1h6iuW2cI68tN5uxLU/W5UoemPplt7ymKciTOXRN9EYGkEK/SZqEBch43XncxMPWo/Q29I5HySITAgrZNI2T0w+rYCjQoYBMxsk5GST02e85a0dKeknWqaxiXghiH/XTliBFuKHuMWwMVwrpYh4uXnE3BTw/kdOsEGgArq4YgU2JfurSKbkJMSoynAxKy/n1k3sAu6T1QqoGzO1in2XfRmB+QCnFb00TVfUGGrA0xMbXStVFsmK8DLufuyB722tY6YNrcRDxBQC+NWac7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2/vSk/DTVHzr5SPHLLdLTp45dLNo+KoJM6NFiitEswc=;
 b=ZZJ+8ec40whl7zg79X6cCA2p2vac66KmfdW0IAqMF+vqy/BPvsnYYNCkNQtfB1VYkoHvRFDCSTZQyYJ75tjRYbSzUUKEuk+rvMjtpU4zyiQEYDoXTGHTRkOxYKfnsVuUQ5Br+WlDtWm6ICkda2gQUelmcnP13kic2s0g9hw6Svo=
Received: from MN2PR07CA0027.namprd07.prod.outlook.com (2603:10b6:208:1a0::37)
 by DS7PR12MB8249.namprd12.prod.outlook.com (2603:10b6:8:ea::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Thu, 14 Nov
 2024 11:03:05 +0000
Received: from BN3PEPF0000B076.namprd04.prod.outlook.com
 (2603:10b6:208:1a0:cafe::79) by MN2PR07CA0027.outlook.office365.com
 (2603:10b6:208:1a0::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.16 via Frontend
 Transport; Thu, 14 Nov 2024 11:03:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B076.mail.protection.outlook.com (10.167.243.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Thu, 14 Nov 2024 11:03:04 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Nov
 2024 05:03:02 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jarkko Nikula
	<jarkko.nikula@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 2/2] i3c: dw: Add quirk to address OD/PP timing issue on AMD platform
Date: Thu, 14 Nov 2024 16:32:39 +0530
Message-ID: <20241114110239.660551-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114110239.660551-1-Shyam-sundar.S-k@amd.com>
References: <20241114110239.660551-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B076:EE_|DS7PR12MB8249:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d0cc0dc-4c62-4c10-2c56-08dd049be9fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gJPBIszSYKB4XAm87g/8a9eHDmQ+P64VmvDt9VfDHHsyH2PGWhl377clAXwE?=
 =?us-ascii?Q?K9PVYDknrrw8uTosf8svggRiix697iIjjMuDDQAU8aJv0lqWKuWXRVbxss/P?=
 =?us-ascii?Q?Mr4T2rpnO+cU8GoZWdyorV0XRVzSLsZHFym0RBe7P8Dr4bTqM9oIdwbcoPdv?=
 =?us-ascii?Q?7/1UbzJmxOOesubK9JQjCULWeXeu7S9IBVqXSYTRzevwCOXwV9FzFU5412aH?=
 =?us-ascii?Q?e4sOnRgHuuyj75pPnmWmHoVUKOe2Ac97eDjk9FoCdLlKdvCV9/SPOT9C+9zu?=
 =?us-ascii?Q?92phCFEY77FiGkyaz+/TpUXc743ExZ1gg8ctqAdiVXrLOYuY7h5MXNbldv90?=
 =?us-ascii?Q?g9dMcjVcQRfuyiD7rXDotPOOVO1e3CC76dyDkdroycmtFpbMyCvR+bjO/+6t?=
 =?us-ascii?Q?T9vVhoTHGZN8cULks79eW+jvYO+I6FiX6RBqCGlbPIaaoHcr2JSPk2NmRC24?=
 =?us-ascii?Q?2B88gD5rcN1G4Cusm0oKgXAU3lTNwnmiQH5nNHr+xL+8jdY4a/nNEzhjE+sn?=
 =?us-ascii?Q?6LNCQ7IoiX5KjXpgDlmC9Jf8gkey8nsuNaen2TJSolbaaq0mMJij5fV0MpFM?=
 =?us-ascii?Q?gc423F3qSE4FAB4A2jZfadBfch2XUjDpBx48jzhdv4XTDCZE04Y8Gw0/dHFj?=
 =?us-ascii?Q?6MUF+kFUBjNzHDkUGdYl+PhVOrrJzW9p0UKGLJ5j9ncQD8JF4iNcy9ZWkuG/?=
 =?us-ascii?Q?qHcvNZG6YT3w500XKts1x2ZkZEp5+C90RpPMfO6T0QGoxvyUlhSNPkbXDqHY?=
 =?us-ascii?Q?6gX8p9tPxb4fsR2KeKz8Of+0Z3b6IsZ3oEQ7Rupqay/cfzuv+gPt4lqiHsot?=
 =?us-ascii?Q?UGQ6WgWItisfm4PeE27Et6X1k7Btuyuan8b5twdAY0zMLklIAAEZlNDc+cpL?=
 =?us-ascii?Q?ccBZRytx/Rq3gkNS7dstRaXykV7y26I1vJT8ylLAcGr6ECzETkupQBiuWZm5?=
 =?us-ascii?Q?sF1pFSTTsCxSlEUSFka+/DWnnLwNatRXqYIRWxEv1oObScBqJMAdEmN66fP/?=
 =?us-ascii?Q?PGQ5WIVw/On8NovsMLjAKc4Mx/4JVV5yQK1yAQ0TJSO3+MCPvUrH/GwPN+/8?=
 =?us-ascii?Q?gzzoHEM1UP1xyqmzCN1PsONAC2RNGBMGe9Cvh5h0AVEpyJOho6lMRqOyCulb?=
 =?us-ascii?Q?ZzvDUdTTM7NPhxThIyHus3KhbDoUvV/MO98FrswnYyaOLX4lwk4jxbcb81RT?=
 =?us-ascii?Q?TyWRdSwpbdguvk+ehTUlYicVv8uDO0Z4ibWWlgc6IZsS+3Yp+Ifqj7/W3d9x?=
 =?us-ascii?Q?SpTpOxcjccta6Cg7zRxHgbo8sAFODVIOFF//LTRfuQWt4tuHh3yCx+Zh0d1e?=
 =?us-ascii?Q?mNrw0W8SxJ9Y/yel7aM0iCXfJDjMRYkXwReusbSQoq84qbUAHmoisWhH3Wl1?=
 =?us-ascii?Q?mjg/8gnFOTSVGwbouIfsWfk50G43YsG/NHklr1aSXUqwOBEq1A=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 11:03:04.7625
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d0cc0dc-4c62-4c10-2c56-08dd049be9fa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B076.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8249
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_030311_980467_F54433C1 
X-CRM114-Status: GOOD (  18.09  )
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

Reviewed-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/i3c/master/dw-i3c-master.c | 29 ++++++++++++++++++++++++++++-
 drivers/i3c/master/dw-i3c-master.h |  1 +
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 1a7c300b6d45..5b5c2e4bdc51 100644
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
@@ -794,6 +802,12 @@ static int dw_i3c_ccc_get(struct dw_i3c_master *master, struct i3c_ccc_cmd *ccc)
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
@@ -803,6 +817,13 @@ static int dw_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
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
@@ -1602,6 +1623,8 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 	master->maxdevs = ret >> 16;
 	master->free_pos = GENMASK(master->maxdevs - 1, 0);
 
+	master->quirks = (unsigned long)device_get_match_data(&pdev->dev);
+
 	INIT_WORK(&master->hj_work, dw_i3c_hj_work);
 	ret = i3c_master_register(&master->base, &pdev->dev,
 				  &dw_mipi_i3c_ops, false);
@@ -1675,6 +1698,10 @@ static void dw_i3c_master_restore_addrs(struct dw_i3c_master *master)
 
 static void dw_i3c_master_restore_timing_regs(struct dw_i3c_master *master)
 {
+	/* AMD platform specific OD and PP timings */
+	if (master->quirks & AMD_I3C_OD_PP_TIMING)
+		amd_configure_od_pp_quirk(master);
+
 	writel(master->i3c_pp_timing, master->regs + SCL_I3C_PP_TIMING);
 	writel(master->bus_free_timing, master->regs + BUS_FREE_TIMING);
 	writel(master->i3c_od_timing, master->regs + SCL_I3C_OD_TIMING);
@@ -1749,7 +1776,7 @@ static const struct of_device_id dw_i3c_master_of_match[] = {
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
