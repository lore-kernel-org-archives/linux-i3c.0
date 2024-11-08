Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 765D8D5E145
	for <linux-i3c@archiver.kernel.org>; Fri,  8 Nov 2024 07:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mALFPuWoPjmZlSw5Dvep7QeQOruPn52dCii+Ly5KntQ=; b=V26HUYdoyFF7u3
	/vbtn1SEsX+5KedQbVFEV12uP9YoqwpYICJRh+4CcwreJqPuGZT3Mo7okjxTFU6OfL+rsK4aSHGKk
	vIXmUjOHOomkpRiF/UT9KL5293I+rbukXZBh7j7G3cDhi3KY8fJ+6922oTOZqJ05WnjPcpwc1hS3O
	KfKfON68SEcn24kBePM8px6wXZp0pTjVvB7SnZDh2C7pwEqfS1aZaIZIFfh56eWJPcxQWBFzXad2S
	SY2ITH2LL7K0EWYFcxEQphxGoE6D+gfwbMc99E9UBz4Av+yZ+JzW5YpzDghAv1Cb4qVTZmnZYhig8
	e+KEbs0yOnYOmAupLZWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9JVX-00000009d0F-43Bt;
	Fri, 08 Nov 2024 07:34:16 +0000
Received: from mail-bn8nam12on2062d.outbound.protection.outlook.com ([2a01:111:f403:2418::62d] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9JVU-00000009cyV-3NYg
	for linux-i3c@lists.infradead.org;
	Fri, 08 Nov 2024 07:34:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QNLQlu/pqbj7RXljicKm3vICHBCxJro7AB6aDad129YD5opOwRfB4mqPBiKUPJxLZHD1rU6LSHQDXoI49q8FVTEABpNW0Jc16j5XwzIroZ1CQvE1oYaTQKVMzbzqUfURq6s14hlEeUEV1mZlU5e7eYHGnN2cEBDNM5Am1huKbkW3u07ZMMGMjzJ47f4m7ijBxzCwsnT9Q+kQYvWKMjilgPeEwu+4tm0Blpor4bZrAirHAOpmv9Rt9J6jBQrF09bIYzhyeQilZCNuaErvwF0gAVHpAqWiEYamnV/TO/nu1WmT7PkoFP8IhHY2DurYiO8MWDUVViUcQ6COxlVOBUxXIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZjwErfDQy6CzaMnw4++rs8wsNhqpWYxjOdTyHdGRSDQ=;
 b=qw+8o6hmeK5Mml7S0+z5uhfo4pt0DT6MDi/jsEPAJWklgBraVn/voV71m9V6A4bufDCV2Ap/Kf85h72Ci4u+xlrtg/htvN+vPldTHHGqPYdemWULk94w4L6ANjmBgmHebCqHA9qaFDzoEQI7zaUyiyiv22y81yhH3Z7IcIvk5wmJEKM8mlKkZTCkwLPTuhz+jxF/cXlH1RkJxhmB5WHzM9uKUQhSm9ODr+GggAmJpmWgAdt7Tiv2I2NwQNyUMFy73srTxe6fhIMnSJddJ4C/P+UZIXj76yWIkTekKtE1PgTgpvQ73eFJonXRAo75mFYKqa5RUwoBgolb1Evs775YjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZjwErfDQy6CzaMnw4++rs8wsNhqpWYxjOdTyHdGRSDQ=;
 b=s3SHmX2uALhlDc04lIW9E/WUD8s0lBLrWBplRo1V+gHBGuWRxEsBAVKw072npB5Pu8vSDe7+FqRTxw3YKXZCJnseM9DxHF8IorflBkdXu4sTMeKU0uzGnt/n6RjZFZd8i3KLlriQ0E1fwWmBd6prfJ/iTZH4ao4ULR+QRz0Thwo=
Received: from MN2PR01CA0063.prod.exchangelabs.com (2603:10b6:208:23f::32) by
 DM6PR12MB4076.namprd12.prod.outlook.com (2603:10b6:5:213::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8114.31; Fri, 8 Nov 2024 07:34:05 +0000
Received: from BN3PEPF0000B06B.namprd21.prod.outlook.com
 (2603:10b6:208:23f:cafe::b2) by MN2PR01CA0063.outlook.office365.com
 (2603:10b6:208:23f::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.21 via Frontend
 Transport; Fri, 8 Nov 2024 07:34:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B06B.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.0 via Frontend Transport; Fri, 8 Nov 2024 07:34:04 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 8 Nov
 2024 01:34:02 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jarkko Nikula
	<jarkko.nikula@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 1/5] i3c: dw: Add support for AMDI0015 ACPI ID
Date: Fri, 8 Nov 2024 13:03:19 +0530
Message-ID: <20241108073323.523805-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241108073323.523805-1-Shyam-sundar.S-k@amd.com>
References: <20241108073323.523805-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06B:EE_|DM6PR12MB4076:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cbec23f-7213-4bad-09bf-08dcffc7b935
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9ikngAceGnxJTp6B8PUBAqLKCKSfW0HrFijBA/eN71o++jWDYXWp6GvSmfg8?=
 =?us-ascii?Q?a+T319+9cJOeYflft3rMIreH/DZY6WvRrAHK/Ur84XMPGPSa5l67cGNL9Z6D?=
 =?us-ascii?Q?kf6zHmVccINMttS8E3tLef/0CpsbSlKiQH86e3b/QGxqip3T/kCr+7aZwKsw?=
 =?us-ascii?Q?HhgeDfWZ1Ou6uDlzdR7fxQ+fB/jWkWjKmO2uySKGqojaESh7zhjRO3nNuzJE?=
 =?us-ascii?Q?jl2xDuRmQtYOf0fCYOr1drUh/i1fovUWu+ElN9kBXPaawi1umqPvTvrrmyas?=
 =?us-ascii?Q?EHu6/cyppRB0Y6U7cGNbyZ5vTiNjk7z0A4dbgwB1Ly4TmgWmOKvSRVdmoGwf?=
 =?us-ascii?Q?zd7ifWxSWxVyrwZS2r5oM52M+nw04IOc1j7/1P1+jicNoNd8wNE/fBkUwRBm?=
 =?us-ascii?Q?PWeo44z4EH2Y6rrOMGaMz1vZkejGSC1G80fhXhBgJ5wzihp7lkex1fbby0pO?=
 =?us-ascii?Q?d0Iy9Ci8kvGqSczNFPLzliqYxOTQXTj9i8Whaiyu+nfkahOeWnqh7L1lVl02?=
 =?us-ascii?Q?tHnDhX+xSeAeg00oUNEZXKFh8O1Z0P1L0LNNzHW0eQauaNwll4pC2NAjAuis?=
 =?us-ascii?Q?9uA9WFPJ8fIBsTWiqD24isvkIhBVncmTzdqEolI+DLHZUYbix+95KNj6hQEy?=
 =?us-ascii?Q?IN58HuQYGgdPg8UOxenrJLVvookCUnMxABHGQOIQ5GpPbtm4+2C1BaCQCTUM?=
 =?us-ascii?Q?HhPFRoWcSszPJj85yRZmupjgZ1pOw/T0K/qWh5V4FQ/F6wzzpu1E858EfWBY?=
 =?us-ascii?Q?klp6U7PTStAGdlCPRGg5L7TEXrDC5xz/o4X7d6Jp4f9FlXuSUH4HXC/pDDT+?=
 =?us-ascii?Q?anbCbL6SWjgjT2bNmXAVfDGKn0eUKt7gKsvzXu93exWTZJDQfdICXpYbqdfs?=
 =?us-ascii?Q?OwQftuynqU8w5lKPrJbL87EfuEi/GZcG1mVhPRuOpIa9+omQGpIpNDidFgMR?=
 =?us-ascii?Q?exQVJPmNQG7v3/dn82kR3FU9KIyQuTwrEYvx0PBvj1ZOr+ANeOjRyEex0lPB?=
 =?us-ascii?Q?KTed8QdSsL25/zGLXXqQ9WbWrOq2PM6kfYVw48+gBEvSoE0HZNURVmmO2Nlf?=
 =?us-ascii?Q?Am+rp0DOYcICMsYUrjCPZTciU9ZX6Q2BnQFaU0n2LbpVlxbtbRsXE+woUESb?=
 =?us-ascii?Q?yjepGHbinU+nXqoY68NU5ixUUgm+czdkkl7CsrmJH0ymUkTItyJr69xGPmtL?=
 =?us-ascii?Q?ROnrJB5UqvzsJBL3KfFgaGt7Z6+039UkW8G70C4QRjuLywbAofo5GMAhmzuW?=
 =?us-ascii?Q?fmzrV690JmTOdsmLHAKv+6QAXLux/um05xTGe8pzy13FT/UHDjEtbSUs1yZK?=
 =?us-ascii?Q?AWL7eT1U5V8ExX92u4nAHNkGwjKrAGOqXlI/6EI4mVVBw9VoMjceiySnLtxe?=
 =?us-ascii?Q?eIuzkj5q5t9ID4DtTCKvPcyBChd2zMNU5Bebmhi74r1qsTGkKw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 07:34:04.9978
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cbec23f-7213-4bad-09bf-08dcffc7b935
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B06B.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_233412_874963_01F3D463 
X-CRM114-Status: GOOD (  12.39  )
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

Add AMDI0015 _HID for Designware I3C driver so that the dw-i3c-master
driver can be probed on AMD platforms.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/i3c/master/dw-i3c-master.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 8d694672c110..1a7c300b6d45 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1748,12 +1748,19 @@ static const struct of_device_id dw_i3c_master_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, dw_i3c_master_of_match);
 
+static const struct acpi_device_id amd_i3c_device_match[] = {
+	{ "AMDI0015" },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, amd_i3c_device_match);
+
 static struct platform_driver dw_i3c_driver = {
 	.probe = dw_i3c_probe,
 	.remove_new = dw_i3c_remove,
 	.driver = {
 		.name = "dw-i3c-master",
 		.of_match_table = dw_i3c_master_of_match,
+		.acpi_match_table = amd_i3c_device_match,
 		.pm = &dw_i3c_pm_ops,
 	},
 };
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
