Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F25FD374A2
	for <linux-i3c@archiver.kernel.org>; Thu, 17 Oct 2024 15:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mALFPuWoPjmZlSw5Dvep7QeQOruPn52dCii+Ly5KntQ=; b=F5QgpKUJByo3U5
	Wqg5qwHZzbpcd345uJ18kBd8uM9tSYDpsqUMtUdIKwwiVbFhppy0lumm48cYU5HJvbXss0f3KSK/W
	NKPYnTme6axwph3EOo6jsB05NVXaBMARP9HH3qmMjHp6rN+E2NAqDFDk8cfjQIQQjQClqUAmwfiIr
	WhPO7sQrrlhKzBeniOvWkIqllTIn44LRgD4yBaurByB/Eh973cTbz6Hf3BaQ5HpwenHz3/ifwoCQU
	5SK9Cy9JuNcZ4TrCDRNCqN/8m04BKXjn/8g/3qm/OMKc2wUJEPIjebUkACyuCm1D/eodWP1OApPmg
	VzQms7u+X+6psZy5NT1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1S2r-0000000FDGJ-1Grj;
	Thu, 17 Oct 2024 15:04:09 +0000
Received: from mail-co1nam11on20601.outbound.protection.outlook.com ([2a01:111:f403:2416::601] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1S2j-0000000FDBH-0iCy
	for linux-i3c@lists.infradead.org;
	Thu, 17 Oct 2024 15:04:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MeogcvnoRBLcZ4x7AGuVQBsv0Se4RngHGL8MF3MTVr6DYu7mKKqDGsQOoIIiTN+HbNcMmx2PiICGC1ZgfGv/ASigbaVm5JRDiMLB/DibSF2EaTw13e5FN13Ua2IsIi76MlcXv9tTXtzoLLr1v/nBYMPEQtdHa6j2UlZVM65vQDDJ4mJYkPrztsHLfKGk0jCyeXxfm29KYvsl/cHZr//gH0batudJZqpfSQGdehUB9jb5Nas1l/cG8es7uJMXo2FErr1wTkh5QQJMmF9TokR1qeM+3AzfTmNu7UP0ZFxQys33g0h/Uu51WbiperWdZ0Zl2ZgRQV3mTPC1E3Y6P8CsLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZjwErfDQy6CzaMnw4++rs8wsNhqpWYxjOdTyHdGRSDQ=;
 b=KAS3D99/CLw8Z/tcryy8K8PwTVvnGGa6jU2y35kr1v2aTNYmXIY03EXGYuEtOdxowcC1e+lfbEyousaSLjSmWE+rWGHzs3LLccV1lIW0xBAkfQtPod8lE4MwzQtJkNBzRil+lRMVGWw/0X2cFUqszBYr4d/cKE2jmTdIfy9j63UQrqd0FwTgzGjHtBsyTbECgT6DJpjSy1tb1yGNsYvUtc5dlkY3G/3XJa6+XXIoGdRIgVGpDmG6zwCzlrxMYCx/MqwNXJ4aghFnwBaXfztjkHg0ui4gLcgpxsjzmug2SPD7BdMfcN4KIHYpsBWfaofy0Yl+4s5/7CU74CU/XgSrQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZjwErfDQy6CzaMnw4++rs8wsNhqpWYxjOdTyHdGRSDQ=;
 b=jZ8uG/ixv7TeFXNy7+14eJH907cLIQJdXJdxB9iuOACuskoXK89JrjxZOqI8kA9jH4slJ6TnJn0ErFZ5iEvu+Su5TAwU1XJNVHuvmeak6RzFGkRHlfsjFeSJICYTsqayynWV6sShhdTxxoAA1s0Dtc6fEUGb154U8sNuU8rUpbI=
Received: from BLAPR03CA0138.namprd03.prod.outlook.com (2603:10b6:208:32e::23)
 by PH7PR12MB8121.namprd12.prod.outlook.com (2603:10b6:510:2b5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Thu, 17 Oct
 2024 15:03:55 +0000
Received: from BN1PEPF00004688.namprd05.prod.outlook.com
 (2603:10b6:208:32e:cafe::76) by BLAPR03CA0138.outlook.office365.com
 (2603:10b6:208:32e::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18 via Frontend
 Transport; Thu, 17 Oct 2024 15:03:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004688.mail.protection.outlook.com (10.167.243.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8069.17 via Frontend Transport; Thu, 17 Oct 2024 15:03:55 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Oct
 2024 10:03:53 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jarkko Nikula
	<jarkko.nikula@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 1/6] i3c: dw: Add support for AMDI0015 ACPI ID
Date: Thu, 17 Oct 2024 20:33:25 +0530
Message-ID: <20241017150330.3035568-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241017150330.3035568-1-Shyam-sundar.S-k@amd.com>
References: <20241017150330.3035568-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004688:EE_|PH7PR12MB8121:EE_
X-MS-Office365-Filtering-Correlation-Id: aea2ad5c-0bd2-48cf-5384-08dceebcebcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?om5+FwV3xyTJAzik/NUFlY1QFuaQqrACPMa76ydeYyIfnViD6jn9vWgLDoKo?=
 =?us-ascii?Q?d/eJvkcIAdvgROURnL6iB4lRThWGO6kHUuNUwUNqwNTT7yGQLyzHL2Nm6VkK?=
 =?us-ascii?Q?H+NEskK3i52NhmlpT5Sqc30wpphKt3J5wpNRrbrad9MNC7n7OgPWz4QmyC3Q?=
 =?us-ascii?Q?HvSnUbQ6mrzVbrn4efBoM+5a6t9Tc8favPZZede2U30X1Ova0C52wBAGyzdg?=
 =?us-ascii?Q?lHt1wDRE0rkZkmkjU2Yho9YYWIVUWZoDjP+98/5779UaL7SeD8wI6nI+6BqD?=
 =?us-ascii?Q?VNFusCpMtLHktHK4KUMPNdmF8uSkDIqKjzZyZjTJg5pA/M5pn/Q8cGDDWMYW?=
 =?us-ascii?Q?V/9j0iFVHnhE9smdRk4WxAImNy87ynb5RnS4Y6TYkeBR0CMi9HLNRVSwavB2?=
 =?us-ascii?Q?+ZgF9aiWmF4Nn2SSO4s3vOsAxpTemVt2eLIMGCqJBegYIxkPtv+k8EBrUk7m?=
 =?us-ascii?Q?h1YgMZAG1wOWFLLTaBOonBKgLeaer1cJ/dKmisH19RmraRQE9+8YSLxMHg8Z?=
 =?us-ascii?Q?gL21RGQVZDh19waWwhZqFhBcczuQxCF5A8gUsKLVaQlB15Tbo4YLKzG7OOyc?=
 =?us-ascii?Q?MkPMNf0FgalFx8CeGA+k3jCUF4LJtXwxXIn6OLwtRGYorKx1lYsNNW5gBE49?=
 =?us-ascii?Q?DtK2ectXKYH6e0+x59fq4XY8asE+WaHht/jJy2IDExSsAMPFXAZ2DFUw7VZT?=
 =?us-ascii?Q?L2BzSaqdCB5ESv9gXQNIOkV2umVC7HnTh1yS7o/UsNdxp8Mt2TumK1+2aWEK?=
 =?us-ascii?Q?yAR4as/hn1C0F7OSVPa5ei/vtWsT5fqUL2WuyL/oPMAGdTuMA63xGJqFMtU8?=
 =?us-ascii?Q?Tkrk9BkgcmvVxDSNekZnQgxqCHJu2pCFuBVAbBsrdV/N/vWjKU4cUNp3rDKf?=
 =?us-ascii?Q?UfafUS/dgJD0Wqj63QIcJZ3TVl++DfTLpjBasyqgNME0X4NE/qITXKFXbvYL?=
 =?us-ascii?Q?3VM/KAl2huUdKyG3wjPR2TipjRo1z9e+bf/CCkydoMaRKtJHJfmbJo0ilJTF?=
 =?us-ascii?Q?9r74wdYFUj7C2M3tKImDUisJ7spuKHU66JdB5hiwgOpu3VWqRzYtPiSQ8GGP?=
 =?us-ascii?Q?yWp+MJP6RznSX6nbmyL+Vdwy7EKXo7RQG+XRwjl1+bxXRE3vCsrt9Z0n7ILf?=
 =?us-ascii?Q?8lBEeHoe06dMFA4/MysFATZzt+5saZSSqI1ElGECtbtdFzG+rBdGidomRDyG?=
 =?us-ascii?Q?ammoBNHorFzTPyxPyGTPgQACW2EYNA7KG4z3nOKfp9/RiLDR+dMCyF5jtSR4?=
 =?us-ascii?Q?yyiYXKgVOs9KP3y3zFJeQCZ4KLGJuVFWLNruY57NVBKWoIxzmeF4fgbICGp4?=
 =?us-ascii?Q?X5uK1AyIUZkZgudeIZEBygs8kd/auhfZoJiE7aP7wsDV+HdtunGJr5PCVjut?=
 =?us-ascii?Q?x2fDmHlPkjy+4lpehirGkc3bx3eo5CtP0yIASrdB9SS29p3TFQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 15:03:55.5660
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aea2ad5c-0bd2-48cf-5384-08dceebcebcc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004688.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_080401_231751_FA09FEC3 
X-CRM114-Status: GOOD (  11.56  )
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
