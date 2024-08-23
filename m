Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05EA3C531DC
	for <linux-i3c@archiver.kernel.org>; Fri, 23 Aug 2024 14:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jSxn+Zoqj48v10R3tF5ArQAudJdLE8ENaL3sn5UD3Jg=; b=VN/Jzyv73PqlO4
	mxWQYo5uvaZqe/NSwYNTQPbY6sbQ7BZe/1Bs4o3hxMTR5BQ1/JFL4lTOx1Hoaa1L6/C2JEk8Wsr50
	z8vkE2TNOHLa6WbThGFncIROs3v9okF8moZweYVRxj449KKEQOxcCAallh2ebvWUXPLw+O6HRfPVk
	H4R00YNF26WMODZSofskQjaTpJykLMZai7mWMK7PtKn171cfncTpgwcuMYsmsmgzixZE7ae9Dm+je
	9b2EvjYQDi1g6jd5Ab3skOlGRQZnlpKMoIBiCMFxdpoExRC5OAFiKbnMO5dqfVcJXpUHA9PQ2PgK3
	IW3yZ5DCyvACNtaLaH5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shVA6-0000000H4Fx-2r8N;
	Fri, 23 Aug 2024 14:21:10 +0000
Received: from mail-bn8nam04on20611.outbound.protection.outlook.com ([2a01:111:f403:2408::611] helo=NAM04-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shVA1-0000000H4BF-0wrb
	for linux-i3c@lists.infradead.org;
	Fri, 23 Aug 2024 14:21:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ag/odkmUQVzXXbVSRLd0lux5F8I6zRSwdlM6CzRG5BmDgR7fjAVEzPWENbMGmaQ1VYJniIEjJUVTY+qF0GJM5GDGM0DPPVDbg46ryVZUcfyUqVLXOZGKRo5AUxvMu5BDYgJUwc1hVpVT7dPnPAEhs3Py+mXV9PFjI3Q3uyJSykkVAOJuHwLSpwin60o0+60Rl05LboGC7I5TbqpeovfM+5yAgMBkkmQKR38YcWs6jBKF2XEsurHlYQz9dPDkO+eZXsG1vgPRKcYmw+077TF8Uq3jXGGlkU2QuhXWCObjNbYSf5G/cGvDH74G12H2m2DSUb6OIWZ96K1QiaqXouAmSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zrSocucoRmLTE8ScWqPj7g3GkvhEChjjPuu96aJWPGU=;
 b=vSPUT7VFcRyIiyqt6EaFcI2nAHcmtXNJTtGrJsD1/grlDwa+TFtw9Bj7qy6JdolKPArxDIC4vqVunnUakxk2PKYqQpi+ODXe6DFwog4nSVTpH2+9bRXDVdKqvV/hSsfY4PsUQVoksbeiWLQvqUNd3dz3pQk6oDXdI9rRlBlDoQW4syty+84OPNcbuMK5Orf1ILNb3mdSa1Yyiu6vbMwt2a81paNc/QQZzHCBCdsJQbsv4lCFHv/+mDWp61Q/e2b58ST63MxM6wrviDGpq8czhZhW7UF8Xz4OzeNp/R76xFq/tNxwExpdIrp+3SRanDoKspquPejqNll+v+/PbqHBTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zrSocucoRmLTE8ScWqPj7g3GkvhEChjjPuu96aJWPGU=;
 b=JXxRjtP81ODwFcibCZpWSpEMDDWHjNvPlIZns61sOoRd0eJhv0HXTGSXT6n/VgKhWu8Lr1sCdsWn+jlJJm7uwLxTxTnI7glizQTorwTmyO10xdgpkJgvBuMrtvLRUFOIvLokOyg9tmm30p4bvYEE5l+ja7zPRZX8ISf0j51F2EI=
Received: from BLAP220CA0026.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:32c::31)
 by LV2PR12MB5991.namprd12.prod.outlook.com (2603:10b6:408:14f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18; Fri, 23 Aug
 2024 14:20:56 +0000
Received: from DS3PEPF0000C37E.namprd04.prod.outlook.com
 (2603:10b6:208:32c:cafe::5e) by BLAP220CA0026.outlook.office365.com
 (2603:10b6:208:32c::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19 via Frontend
 Transport; Fri, 23 Aug 2024 14:20:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF0000C37E.mail.protection.outlook.com (10.167.23.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Fri, 23 Aug 2024 14:20:55 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 Aug
 2024 09:20:52 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jarkko Nikula
	<jarkko.nikula@linux.intel.com>
CC: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>, Krishnamoorthi M
	<krishnamoorthi.m@amd.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v5 1/6] i3c: mipi-i3c-hci: Add AMDI5017 ACPI ID to the I3C Support List
Date: Fri, 23 Aug 2024 19:49:12 +0530
Message-ID: <20240823141917.692336-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240823141917.692336-1-Shyam-sundar.S-k@amd.com>
References: <20240823141917.692336-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37E:EE_|LV2PR12MB5991:EE_
X-MS-Office365-Filtering-Correlation-Id: 6073d552-4e33-496d-a339-08dcc37ecd39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qIGWK8aHqP9pYpe6K4yWuGA3+Awq/BXBI+5OJUY9fdV+fjhUjZXRcqfHT1bH?=
 =?us-ascii?Q?3Be6H7k2bHtWXlMhbtrbpEAQAOya7Wt4ocY3jMy5Q6lwPTe5p7IMykxDQGxt?=
 =?us-ascii?Q?ci2MU0nuGbuEmTuvy5rKT562dghZxxpLnSZaDwU6x9DY1pLL8B687SnZ0Ts6?=
 =?us-ascii?Q?SngMAlX3B2b5q8zxCBN9JRUKWCnRzitQSYWyVyS/Vsq0Xd/oNb8x6sPT5JaJ?=
 =?us-ascii?Q?lYeYnwxk9tv7Z+53RUYOZ9c9wDnpLvGslH6D07/MSHVK1aRp8E4zBY6HcRj0?=
 =?us-ascii?Q?fbyx4O1mObBkGnpxbnndd3xIkAd7s/XTFfoBbQc/uT04JTA+/5MAaPi007LE?=
 =?us-ascii?Q?LdS35BdrUR2728mr4IshyDCK96rgBnSx4RUm3q913qS14TdUrCCUpnimOEot?=
 =?us-ascii?Q?tS04zI+h7oOprNrpVX8LL4f+mG/dA6eb1ubZEEheDgvqCounRS8Ik4IPbzF0?=
 =?us-ascii?Q?nN2T6flMhzzZZ/8YMarNHNV8yB6JdmKSDDbLLvUmDC9gm3p+pyknlfBFdtcB?=
 =?us-ascii?Q?uDUalshnFoawONaD+0k6JsVXu5lvd6XMfZhsUnW6ObM3DEovVSPb3u7DtUuR?=
 =?us-ascii?Q?ex6PxNXF5hU8xJXaaxpMHLFftYrbqyjnY0YTlZ0VWDG1m6ws2TumnGzNzq5P?=
 =?us-ascii?Q?ph50+WlmjHghJXUn23oSW0yRyrighk7qSRiMXI7oqbRdEkAE0NndmQ7BCYxv?=
 =?us-ascii?Q?KmZSRc1lMe2NNu8rqvAnVTma4+imk9+uJGMpDoGvdDs+dbjI5UlE4/RjcZFY?=
 =?us-ascii?Q?7LQhKMn0vpwsxoSb7KhAI58WJ2i8QP0n0Pi2fsUDhyLY2B0ayWS1r80qk168?=
 =?us-ascii?Q?8qKHkkQjq4ylTx1p5i1hiZ/+PulCWKP8vJhSTQWkuUUscfABjLKK6fNu+B+M?=
 =?us-ascii?Q?LsCfino1THh/AQ4PhofTF0gByClyol8N7RN/DZtpAfJgZXqwMnax8KirCNDv?=
 =?us-ascii?Q?+OZLG4p5pXvNqzIWATCdODkcy5BofQV6ddpPkJqzSvOZmD14UUoJSBHinvYo?=
 =?us-ascii?Q?z26fHeE1biEtDukwoMKWk4d2SAbMpmMue1c5bKxIFSBoYpEidzCCKyiMGcdm?=
 =?us-ascii?Q?Hu9K9AAdZ8WxnICclVx2cCkXHVQPFzyRlJKPHLOEAlE0tKh4YagUaAwOJrIY?=
 =?us-ascii?Q?a7h73i4oPxAZezdYTM1jXsuBrSpIYhxqqaXZAaoETK2laP/lMd0WZY7hT/f3?=
 =?us-ascii?Q?ia1ZC9B9VN+7k3USOB9Pm7qgd6OF2k5Y020HQDjIF+LxMuDIGA0MDe92+aYl?=
 =?us-ascii?Q?18Ihf9a1HsDgDv5JBoGNyJWzb57Xo0dAgQMErfrFnvgSrt/lcQ1jGlpaFUD8?=
 =?us-ascii?Q?skoZBjBq9Ig4Hp+ib1EQDVBBfk52Lkt5fpbqKcuTYwUBzIomeeEOvEDL0l1g?=
 =?us-ascii?Q?RfJsIzwpjXGxrNB4W1aB5UMr8eZ+LIPe1tgpKbttBljuASLRZVKw31etYX1s?=
 =?us-ascii?Q?jybWsZET8RJToM9uSsxorp4VtFQ0hUyt?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 14:20:55.5076
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6073d552-4e33-496d-a339-08dcc37ecd39
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C37E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5991
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_072105_324729_C2B13CEE 
X-CRM114-Status: GOOD (  11.33  )
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

The current driver code lacks the necessary plumbing for ACPI IDs,
preventing the mipi-i3c-hci driver from being loaded on x86
platforms that advertise I3C ACPI support.

Add the AMDI5017 ACPI ID to the list of supported IDs.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/i3c/master/mipi-i3c-hci/core.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 4e7d6a43ee9b..07de1cecfa30 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -834,12 +834,19 @@ static const __maybe_unused struct of_device_id i3c_hci_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, i3c_hci_of_match);
 
+static const struct acpi_device_id i3c_hci_acpi_match[] = {
+	{ "AMDI5017" },
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, i3c_hci_acpi_match);
+
 static struct platform_driver i3c_hci_driver = {
 	.probe = i3c_hci_probe,
 	.remove_new = i3c_hci_remove,
 	.driver = {
 		.name = "mipi-i3c-hci",
 		.of_match_table = of_match_ptr(i3c_hci_of_match),
+		.acpi_match_table = i3c_hci_acpi_match,
 	},
 };
 module_platform_driver(i3c_hci_driver);
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
