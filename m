Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 679A3C87FC9
	for <linux-i3c@archiver.kernel.org>; Wed, 30 Jul 2025 23:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=p/C2veTM5qz4T9aQKHYBhtlX6OmD/6FVWgoXmig0tYs=; b=ubAc2g8h3GPSt0
	IhpUrS6TkFSSPbiYDhB5dRLVVAtPtWTZBYDlJgJpsM9fK+mP3WAymfaelYadZE2c4ozJ1+EjLKf5Z
	qVxqNj0qh63ez+K1lZftVM3EvZNo+8Z0XszgZtwLQo8ir5n2nBJfTsY1LUkyToSA4u4CB7UGyL5YQ
	FNjRHk6f39OpNHAbit26ayQP0dVIR299qsrYa2gByAr/VdpifoZfZZeGD7FNC30nm/vGfPNdTrPlM
	LjFm+ubPx4DQ5NAL/AoBfZfAW6au/Jjt08mynWGxDhwH8aWxk2kncesTO+j1L0eLMDNqHUIXnU6G/
	X/XzJwmQc+ly62WbSTNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhGDB-00000002bkn-0JE4;
	Wed, 30 Jul 2025 23:27:53 +0000
Received: from mail-dm6nam12on20601.outbound.protection.outlook.com ([2a01:111:f403:2417::601] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugLLW-0000000EGQ6-26D9
	for linux-i3c@lists.infradead.org;
	Mon, 28 Jul 2025 10:44:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DsGgef71TsahZHGc1QfbLyPaEQ+JzHQ5sJFcFqZUQOkFGwkL0JVXwh8I6gjGBHVIAkR4nV1tRfwSeLE5HKAE/KCODSx66l3wK9oIWET6hS668bWvri82Ta9+wyKwoPOWNXYoTZDdma2+aJV4tfVI2IkMPKDDj/qDsyBoA7wo6XyJGQaM4PN3PXZvWjZL6nBT24KCbhc4hUnACEXjc3RLijlIL6X7InJkpl0T0FIt4T9GDF3mjAsqUwZHA34NZf5792pVY3K7k6gBjq15VWY2K4IQ9nZuu4MTXtzOzcoiMBsi9+susbKXUePj/2eGJ7JHxgMbkz/D7qzQbtS1hXNcog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=88rToXQaTltUddtjhUmeMWgFmmOcIOGGZTdcfQuyV/g=;
 b=UCMkXFOlkC5CTZfN2OnmF91iG69e70oysVmGexWR4ugnnXjZp7ELpDWfbo1VIPwFwrsm3JxTnzRC11iF0TPEp6RvCbuD1O7eZ8gHyedg/EE6ylHJm6zWq0WKeDvVcXXuwlI6XilImOy87y4DRmCrQk/cl4nReUUKEc4oLTAUocDj/mkouUSooDz7Kb5JA9KAUmi0sfb+tj2ZMSks8yFR0MM+pNEI2Vwbf5690CFvDlVKc8s30ufRLYTDCRJBWpGapfGX3D4gXYd8cvqwJOAFMBRuAy7/UMsgB1oaxVJ6nSChMT5td/kb/m3uMMKOx836HNyuxuzyAquJqQRgPLIANQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=88rToXQaTltUddtjhUmeMWgFmmOcIOGGZTdcfQuyV/g=;
 b=gfN0i1LGXEGw/43HjVPWnpG3Bt8yOjGXA7OxU2Uz2JpYuj4pHsGpDFfePcQkBjgJHD927OM3K8drt1WXvb10XgqnCXNfo13RnnHiXj7FTYjrBU+43MJld5KlaKPD/JOSs20MjUIE/IlIDMHbFGxonM9YQqg7cMEj0YTjTFEK8NI=
Received: from SJ0PR13CA0154.namprd13.prod.outlook.com (2603:10b6:a03:2c7::9)
 by DS0PR12MB7584.namprd12.prod.outlook.com (2603:10b6:8:13b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 10:44:36 +0000
Received: from MWH0EPF000971E2.namprd02.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::65) by SJ0PR13CA0154.outlook.office365.com
 (2603:10b6:a03:2c7::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.11 via Frontend Transport; Mon,
 28 Jul 2025 10:44:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000971E2.mail.protection.outlook.com (10.167.243.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8989.10 via Frontend Transport; Mon, 28 Jul 2025 10:44:35 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Jul
 2025 05:44:33 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 28 Jul 2025 05:44:29 -0500
From: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
To: <git@amd.com>, <alexandre.belloni@bootlin.com>, <Frank.Li@nxp.com>,
	<wsa+renesas@sang-engineering.com>, <quic_msavaliy@quicinc.com>,
	<Shyam-sundar.S-k@amd.com>, <xiaopei01@kylinos.cn>,
	<billy_tsai@aspeedtech.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <michal.simek@amd.com>, <radhey.shyam.pandey@amd.com>,
	<srinivas.goud@amd.com>, <shubhrajyoti.datta@amd.com>,
	<manion05gk@gmail.com>, Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Subject: [PATCH] i3c: dw: Add shutdown support to dw_i3c_master driver
Date: Mon, 28 Jul 2025 16:14:25 +0530
Message-ID: <20250728104425.3878770-1-manikanta.guntupalli@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: manikanta.guntupalli@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E2:EE_|DS0PR12MB7584:EE_
X-MS-Office365-Filtering-Correlation-Id: 78cb354b-f655-437d-d466-08ddcdc3be7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NmZ9qzuZB1kk+/5VLBbFa5+YHjtUG2t2P3Iuusy+JdZ1Z3mZQOMclfvoEVzA?=
 =?us-ascii?Q?Rqo6LSttM1NjiwRvaoUAukH2rsnoTAHzcvTVSmbFzM2l5XyrD1mbt2nhP3rB?=
 =?us-ascii?Q?elAif+kAryFToS1/zbvCW3ruKuK+IUnkK0xbVhB3MYV3DgIO6fGpZjgrxgQf?=
 =?us-ascii?Q?rCHn/kezfJbZat5jmVF4TGBE5gRxJPM2rQ66PXLSEBzPwoJgt1/XZpAWnwXk?=
 =?us-ascii?Q?HtwhO61WuW2cmms9QJefQgef/QlqsLgAnmYNRHKH7VJreV+VFJMzO2tCpNDZ?=
 =?us-ascii?Q?DId5k0W9cLQKNtThtvQjTXS2lGI1H0XxrCL16K/t2zwiAo6Laiy4j+XKk4YH?=
 =?us-ascii?Q?nOhdruRUCQ/RD0yLDA3O3im38NKMRvwTVKihHJSOKIlfvzOPYlMUpPChTPjE?=
 =?us-ascii?Q?to5LMNdJvpTYI5HHAlgTprTozQvEid9YyHIXIeE6+nWDcnmZwmPEFjtdq7JW?=
 =?us-ascii?Q?Z6v0q2cjtsZ2Ng4JfJuencHy3xRsf8N69XsP+I/kAShI49royU5NkpT2+Cz3?=
 =?us-ascii?Q?5DrgXvHfeZz1nmkX/Pac/ZZ3SfrRkqLD4hvTNuqEab5jvt2muHi2Rbp2NaZo?=
 =?us-ascii?Q?nwjNGKiuJNX6SZptZwObLkurAocPEXbLIzXKRBDFu4z6qQntElq1JWrx5jbp?=
 =?us-ascii?Q?TdAiUKSPMP7nPmVk7wUFX2bvH//IC9YzAD+WBYzNQwjH55iyyE2t6K13sUvP?=
 =?us-ascii?Q?ZhORsxM+Ymbjh1YMnsyHyPLSIblgzx+LjngHT2h7Vu6tfmDqfUeiN8N4jnpH?=
 =?us-ascii?Q?LdLguKx9lqWVBCTQo7ar2kjgFt9PUwAbqqBKdtmYsAdfn9+Db/uAbe9jYMif?=
 =?us-ascii?Q?GsxmW5b3NxbtB4+prZ2E9gckd04KJ+HaULo99++gdLI+mI/Ffnxw2MCc/QKu?=
 =?us-ascii?Q?doIOEmFAIaHflQe4h5bJjkdeDyj/lOE0p5aWQ01Y21rfwOHbhaMBeyjhAJ16?=
 =?us-ascii?Q?qxefpOxVhHER1RjZ6c0hESFWKeeNpqpxkMt6wsICYTV8FfWmDefilWToQIML?=
 =?us-ascii?Q?E2oRjWNGgeF+YwYkK99p2OgIxRM4j7IvKxPA7XNoV8kBR5zh0Pu6nkPIpWc7?=
 =?us-ascii?Q?oMsMGvk0Utwo3A2CT2oCgnmJYxMuKFucUB55bWvLGmjjVLUHdPJ/Sblq+iE6?=
 =?us-ascii?Q?2nAwZkAvHLlpLP6Jhc1AhYS0e8i6BfxgaS6mP+D8pnqkbI9gzeO3x3NA9XW0?=
 =?us-ascii?Q?Eej2gLySob1dM7vOn0SGeaKypzK+W+7OlwPi9NGK3/WV8RNHCA4c8Qm8L80g?=
 =?us-ascii?Q?V4+hR1cEb6b7duA8BcT73fOpK6lFyXSdwbv0+KSCOZ6ip2UbJsT5QJYDJ1T5?=
 =?us-ascii?Q?TyPP45WmYy9UjPXaoOcJs8ShSh9zoHsdH/BJ5qRmeE2Lkev913tynfSRfG+5?=
 =?us-ascii?Q?iLHw9dIFTUAyIP/DRcJr609Xwwi+VcJHOIudTmarx02iOT1LMiA1UjHB3q/D?=
 =?us-ascii?Q?TYWMchB5g17XWP8aB+lXjVAL/tL+QOBvVyyog4/HFOyp7eZEzqz3dq92w3Z8?=
 =?us-ascii?Q?IVxgdpS6yrzZKn4rZDFLPl1cm4mDpEYK8vWTkj7T5r1+3Oui030B9q1zbg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 10:44:35.3305
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78cb354b-f655-437d-d466-08ddcdc3be7c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000971E2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7584
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_034442_541364_C6DFA960 
X-CRM114-Status: GOOD (  13.06  )
X-Mailman-Approved-At: Wed, 30 Jul 2025 16:27:51 -0700
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

Add shutdown handler to the Synopsys DesignWare I3C master driver,
ensuring the device is gracefully disabled during system shutdown.

The shutdown handler cancels any pending hot-join work and disables
interrupts.

Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
---
 drivers/i3c/master/dw-i3c-master.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index ae1992665673..6769def5580a 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1762,6 +1762,29 @@ static const struct dev_pm_ops dw_i3c_pm_ops = {
 	SET_RUNTIME_PM_OPS(dw_i3c_master_runtime_suspend, dw_i3c_master_runtime_resume, NULL)
 };
 
+static void dw_i3c_shutdown(struct platform_device *pdev)
+{
+	struct dw_i3c_master *master = platform_get_drvdata(pdev);
+	int ret;
+
+	ret = pm_runtime_resume_and_get(master->dev);
+	if (ret < 0) {
+		dev_err(master->dev,
+			"<%s> cannot resume i3c bus master, err: %d\n",
+			__func__, ret);
+		return;
+	}
+
+	cancel_work_sync(&master->hj_work);
+
+	/* Disable interrupts */
+	writel((u32)~INTR_ALL, master->regs + INTR_STATUS_EN);
+	writel((u32)~INTR_ALL, master->regs + INTR_SIGNAL_EN);
+
+	pm_runtime_mark_last_busy(master->dev);
+	pm_runtime_put_autosuspend(master->dev);
+}
+
 static const struct of_device_id dw_i3c_master_of_match[] = {
 	{ .compatible = "snps,dw-i3c-master-1.00a", },
 	{},
@@ -1777,6 +1800,7 @@ MODULE_DEVICE_TABLE(acpi, amd_i3c_device_match);
 static struct platform_driver dw_i3c_driver = {
 	.probe = dw_i3c_probe,
 	.remove = dw_i3c_remove,
+	.shutdown = dw_i3c_shutdown,
 	.driver = {
 		.name = "dw-i3c-master",
 		.of_match_table = dw_i3c_master_of_match,
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
