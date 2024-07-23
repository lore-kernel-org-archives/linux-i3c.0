Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CDE6C3DA7F
	for <linux-i3c@archiver.kernel.org>; Tue, 23 Jul 2024 23:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=64kwzfA36HbkL9LkFfz8bGXhaZzwPvHzdCaOJ3I8BJE=; b=e4wnYK3gwQx/Bu
	CRoTUe9leTKTHt+XVaIoc7zDPQOgkASW5hWF6SfOTW5cJc4qem9fHDocWSI1u6gYeGofE/0ol1ZAx
	luSdsHY6sLhvmDpq6nquKj6uu9mPzTtE2Z2QSVud01vyj0ig6kRY3UbXxLEZPIYtx6svCtnSEd9V2
	TH3BAcfEMf7TeEgSO4bz49A4aflVKGQE4r02uq/vYQmlZe2ZcwAYmZlJ/trErYnyV6WCddna/4nGS
	wTvBtDUcnuyiyYaqpoHsJyC0/YlUGv4N5sG0rfmny5FhJ4xhpyBWZq/G58ESzvGdjfnY1MNyehAIW
	BmeHc0byjwLUBQXIm32Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWPDc-0000000Dp07-3pdo;
	Tue, 23 Jul 2024 23:46:56 +0000
Received: from mail-bn8nam04on20625.outbound.protection.outlook.com ([2a01:111:f403:2408::625] helo=NAM04-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWJR3-0000000D8eu-1Tz3
	for linux-i3c@lists.infradead.org;
	Tue, 23 Jul 2024 17:36:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rujTyDbHt5hXHkSds3l9ZglH0zqIG3LTW+SdwGZIDEn2ylhPOTXDqxPG6aPydvuPdvPJLo+9GaEA1aVNkZpMBRJs3evTthe01kFQnhq/xChHFEAXYUaUhUezVhqx6P65nUBLj3Zj/rU8g6WpFwNjXy2/Ap/KjHE7HmY5ZkAEn310NHywtfAYvlMX0l4OdN+PEIvI/zC/jov60oxTPmnd178jFdY0ZVMc+DbahJibyZ63wQO/O7XKpeevxomFYSoVJ67BZwHPREQ9kdmvfsvzUXT2+I1llpvKxpVKwLvIEphon8XOvXNswpFCGkdqH7FFDFSXqpe/gnQSHpBoWQuzgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EMrvv5KaVaRLzkoKWn7MmSXd6PTY5shWek6qlzF7EXo=;
 b=m0HmOeBUon13w+TBDZSz5tKI73oTA+1/sKaVybtteLTy7TY1Fto64R5611+WSs8BKZLycnIL2vHDINEGR5K32RTj8xb031Q37sdyIMLfJOlpKpnE07sqXo336T+2mox+T20+k1S1K7v2xmPYEAaOHAoVCDmMGnFpnSUPQ4oXXWjfwAKPzhXNDVJFyht1nn0FI1scyqJzA8VRtjXQqIXbgm/oj2wptz7yDEGqNoOzqo77m8xiqdkYbv7rsWzzZo0b/oZ6PbFIzSAx3KKL/LlePA+qNO3EklppHLEA/YyoLzD7KiXanVdqQNV8HMYxG187jL5FnNUVrL8m4HGVOvINFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EMrvv5KaVaRLzkoKWn7MmSXd6PTY5shWek6qlzF7EXo=;
 b=jp11sr8YjBlb4YJ1XoLoexnfp2N7gw9AJE9UDA6PZKkInIYq1Z3GeLXeq/ksTfmQRKkxDvSwOQJIxDrjXEddDk1IbHcTQaxlZge67uK27B9YyMRR3qWnccvdjXIZ9BuoX1sgM6v/uMfNqOB/n7isAAPU/pWyQIMH6LYJjhU3aPc=
Received: from BN9PR03CA0665.namprd03.prod.outlook.com (2603:10b6:408:10e::10)
 by MW5PR12MB5599.namprd12.prod.outlook.com (2603:10b6:303:194::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.19; Tue, 23 Jul
 2024 17:36:14 +0000
Received: from BN1PEPF00005FFC.namprd05.prod.outlook.com
 (2603:10b6:408:10e:cafe::d3) by BN9PR03CA0665.outlook.office365.com
 (2603:10b6:408:10e::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29 via Frontend
 Transport; Tue, 23 Jul 2024 17:36:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00005FFC.mail.protection.outlook.com (10.167.243.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Tue, 23 Jul 2024 17:36:14 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 23 Jul
 2024 12:36:11 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jarkko Nikula
	<jarkko.nikula@linux.intel.com>
CC: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>, Krishnamoorthi M
	<krishnamoorthi.m@amd.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 1/5] i3c: mipi-i3c-hci: Add MIPI0100 ACPI ID to the I3C Support List
Date: Tue, 23 Jul 2024 23:05:34 +0530
Message-ID: <20240723173538.3493935-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240723173538.3493935-1-Shyam-sundar.S-k@amd.com>
References: <20240723173538.3493935-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFC:EE_|MW5PR12MB5599:EE_
X-MS-Office365-Filtering-Correlation-Id: c6beedfd-f2a2-4667-9d4c-08dcab3df36e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jtKd+eEJdud9QksjNdyowTenHAGvuTZI9szFcAupjt8T3m/Bk0iPYaM+SkXu?=
 =?us-ascii?Q?I0wmHcEPpnmX7NL9lx3iqNXRWd3ULfK6tRI6yooig6m7GMQDauM1vkYl4UIa?=
 =?us-ascii?Q?POv3W2L9KVRLgfEj7ngd1/evpSDv+Ti5rc1B/JN9uDQhmrmfqMWiqkr1imqW?=
 =?us-ascii?Q?69sAIXcsKDfgg4joctcgt7/193yBhcEbbayUs5fMlxBkxaRKTatKM7WQ6qP+?=
 =?us-ascii?Q?OIdZ/bvjjfF6wdDo4AVwJQQljNt8IwFoTF0WRQ5MR+/OZwLoVbqwojQPQTCw?=
 =?us-ascii?Q?pVYQ4RB7TB9yDiTGvK/lDM6VBrv4fKXwFrtshDl+O7Xj2R0zGIUmCfZn5Rvs?=
 =?us-ascii?Q?sCu9yvIveG7GS8RwwfhqEqG39EX12NaCM0fDqidGRNxroZhNqoNajorB5k5r?=
 =?us-ascii?Q?t4rq+PDTfxRmYjftUMonvXjh7x67/SJLyqunWfOWCmWN+7etrLMaGjGweUyV?=
 =?us-ascii?Q?HxHwbw7DxUQ3wy3+IvStP+QPYV+oz4Q99pXZZZLox/jdqsXxV1cxkdxl/LNr?=
 =?us-ascii?Q?YOpA0/B1CGPXxRlhoAv3DJrxRfcfC1Ow22uBJc7paFR0vDnehYV2ettRIexp?=
 =?us-ascii?Q?mmjQX5xVZ/dWRiSif2cmOWcauhtYupSilG3obVnwcTIJPJzLLmgUcoT1+a0w?=
 =?us-ascii?Q?ANXkKHU5FOF42GhUebmxnTSzc6vLyB1pF/WEpmSonFPoUMYV4oNixvRGzrM4?=
 =?us-ascii?Q?OlEqYjVJIQ5L6p2/oL/zcHYJ+ytv1W0K4ar8rbGuEqZ2Gi4Mpzm1BtoS/rd8?=
 =?us-ascii?Q?1bYTmQXenlc53Izd0ah30Ji1kGVThR5U3Xam1FAcaBLvQCPZDicGBEQR+huF?=
 =?us-ascii?Q?AaJHnXLqocqM1vRMTAzcuYV2wGbCD1RQZK2rcPeHvKurOCueMWDlTAcgWNua?=
 =?us-ascii?Q?CTuv0zCy4rqyg0QNBEujhhizID6ICZ5aAUBG76IlX1rbe8n2UpnfWqx9kIER?=
 =?us-ascii?Q?FQH8MaJWHFy6WFfQer+StsEAPE9u+3hS5VMAYBciTuTlUGriR554IzKW7Xcl?=
 =?us-ascii?Q?N6h2uvd56bXTqfmN/5eFnqZoJFyTJYwjP3xpb80uhqIxUmQnRi6jRWnzNkPx?=
 =?us-ascii?Q?vyU8/QoPZ1KA10ZpWcOekwhg1ATpKOmycbHYBZIZ7EYRTgOuoN64F521vTNF?=
 =?us-ascii?Q?XCS6JMrU17w/SzTPasRa648iJqH0M4HokCIFNR0dlek+LPUAuOUDO6lrlQt6?=
 =?us-ascii?Q?OveBaP90wFwIEbWkokqP/QPaYAnwoUqYrBARmTLln12WyGLNicAux12+0gXQ?=
 =?us-ascii?Q?Uj0Ihuh8grnptEzUqibEnTYAe+Shnq+nmkhryKvOga5ulYvwEzMgUyXUpIO0?=
 =?us-ascii?Q?70la0LACiFAslnhQ494GwO0zhq6fh2SGqxDCMy1LsnhOIcaEmNSZJD6xoR3a?=
 =?us-ascii?Q?1ALxpKnTyLTwJNOXLE7zAwO6wRACYzeoHc0Io6V/bIafKCb7tfGYOjvodYms?=
 =?us-ascii?Q?JedP/OqOhN8sONeRdDZNrjzRnnSZEWER?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 17:36:14.3672
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6beedfd-f2a2-4667-9d4c-08dcab3df36e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00005FFC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5599
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240723_103625_457271_D45F4668 
X-CRM114-Status: GOOD (  12.31  )
X-Mailman-Approved-At: Tue, 23 Jul 2024 16:46:54 -0700
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

This update adds the MIPI0100 ACPI ID to the list of supported IDs.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
MIPI0100 is the ACPI ID as defined in the MIPI I3C DisCo specification.

 drivers/i3c/master/mipi-i3c-hci/core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index d7e966a25583..dbc8c38bd962 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -826,12 +826,18 @@ static const __maybe_unused struct of_device_id i3c_hci_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, i3c_hci_of_match);
 
+static const struct acpi_device_id i3c_hci_acpi_match[] = {
+	{"MIPI0100"},
+	{}
+};
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
