Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C63CCD98CF
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Jun 2026 09:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PGwZxGcewJ5UVzU5UPHA74+LBC8DWG9Kt6pmbY8nkVc=; b=Ad41R5kcYwqeKy
	minPhsw9ULq7cdRqFGCTu9hXVscgBQxIDdREvvsyyDdw16UYTlGn8ERQB/TAWYBnJlYAW553qDTAm
	/s4gF8jQs3+ra6h8Um+/IQATw2/N0r73pv56+8T4lDGv3nasdFMt1W+GbSLaqEtytDSJ7IlD4D0m1
	/2dd287WmBPt2nrAwNZcYJ4rRMZmjqoc+afY2EM3KkKk3Ll1gAxly+DwS1eymiwqBOBoTWH3LWp1d
	LRxqJtBA3KI/AZdkzzUuZybOOS3YUwY5opw1pbL2RdGWMn6EBX6qiqESmW/Kw3vhzqUIfkh61r3Co
	gRT5BLg1mDGqOJY9OeGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZQXj-0000000FYQt-0hvV;
	Tue, 16 Jun 2026 09:57:15 +0000
Received: from mail-westusazlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c001::2] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZQXg-0000000FYQP-3d07
	for linux-i3c@lists.infradead.org;
	Tue, 16 Jun 2026 09:57:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JpQVvHduXmYaDedBklmtZnX4wx6PLU5iooGP4HpmNGES1Au22ppPVEzqebDXrBhaQpj7pvLcaGzg62b2v9I535+UmxNAGVRbBv5B7HMS6pBduigXCPYOqH9gSnGeBm9rlhn33Fiq+MI8M8+kEQ7wfjdIuvEd4XOKnfEZ1M5k8aeUsOQ3HlJ7HDj7WyfQjqGS2TzbOWmXK5TyokB/AG1ZnaLIbE0tfZsCwlTcs65oYcdIWNHKrMVY+sBaO1nepNm/IkXm18irLqNGhyS2t8bag71oJu/pZqeog8bE4lZahSkiL2oe1pVnwUW5PtKLitZ3nfP/6VmsIdYgZg8q31kiqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jtvjV/RtRcHHFKSSF7NdolOLRiWSglucIGUw3uR6XdQ=;
 b=rLU6nUuRr+UNyBTYJB5nqXyhbpGxjLGNZz79YiOpvfmflCudLK/fean83PHTTLfdSGFxnuLCdxWkkexgX0Xai1zp6BVhXdPkHLLKNWZImlWhr/dmlAuc3BERYL/WhzBg37ShR8c0zZPz1jJ8SRORPFG3JS4yG/weSv1AMYpQetEzqNkpjRktx7oDJQkyDF5Ha/paV1LmGwKbJlla4/RAbH0FwyM74ZJbzbBWSMGUMdQBdE+WksKvokvQzacsKHN8Bl5BPf4y9K/X8W2hwWifg/7kHBAY8ULyIZR0BofuvFU4cGvOhXYr677bzkaleTFww+MEzYBP+1ckK0gkfescYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jtvjV/RtRcHHFKSSF7NdolOLRiWSglucIGUw3uR6XdQ=;
 b=KWVNFh1Y+FD/qWa2nKKBFNh+Hcg2gR2kGMcwbYLxEK9F+mma/S+vnrJjelsUBgQ3rxm7KATFkqIHEM8XIKMCyCggW4SoCogRyFjBhUDv5b/jv8gdOkXaH6tBYGSLhJq69zHjpjz5m1xDAGr57TGES+rcbRD/3/fpORRkfGKHhtywuvSSqdYvh884gjcBGqcIIfJzIqOFw/dwM2TOWDtJdDC3AVrEy5zREcZKvBo17p7ss1kIsgbRgQKE43Um0XJ+O01rtIf6z+O+/7r/NoJa9OHVSRt8IWA1OeLTbl7DGLEyIi8ESm0SeNAzGEVfszGUGWup2aPXXvJrJzjuml2LUQ==
Received: from PH7P220CA0087.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32c::35)
 by LV2PR12MB999072.namprd12.prod.outlook.com (2603:10b6:408:354::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 09:57:09 +0000
Received: from SN1PEPF0002529E.namprd05.prod.outlook.com
 (2603:10b6:510:32c:cafe::3a) by PH7P220CA0087.outlook.office365.com
 (2603:10b6:510:32c::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Tue,
 16 Jun 2026 09:57:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SN1PEPF0002529E.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Tue, 16 Jun 2026 09:57:08 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 16 Jun
 2026 02:56:58 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 16 Jun 2026 02:56:58 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Tue, 16 Jun 2026 02:56:54 -0700
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
Subject: [PATCH v4 09/12] i3c: dw-i3c-master: Add ACPI ID for Tegra410
Date: Tue, 16 Jun 2026 09:54:23 +0000
Message-ID: <20260616095429.3947205-10-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616095429.3947205-1-akhilrajeev@nvidia.com>
References: <20260616095429.3947205-1-akhilrajeev@nvidia.com>
MIME-Version: 1.0
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529E:EE_|LV2PR12MB999072:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d7a3d71-4e96-4085-7d24-08decb8da0d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|82310400026|36860700016|23010399003|1800799024|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: PlNtfZ52k67Uw5VrrAsq11XyxfpbNrlntvTAJMkj1QcYMzeAMZRwN0JrW7fBUthDcEAeWvDIS6AzsG15hWlTBWPZYiLN95ZL9Ag14Yg4eRHaZr80EmS3ITZVTjhm5Zp6MSU7+1NxvEsiezRlltxCe6N92f0l7BhX9e7khR4zQJKPQJB5ZZUeQR/MsJ9IDHPzuR+0xPKYF4Yi03Jjqktfcs8GObngnw3XoqkEuDSMHEnPNhkbCZay3W4/UyxtYlIVWrDFzHaoSMIRNnbPE8vqGN0iSWvy6RXDSVNjrkrx+8egKpq7yNkmOFyJ6fYrs16ufrIbax/PUYcTxH7ulPr6Vce4O/wLmC8nHE4Jyz63Vjfay5fcdUvOhzYWvW3B7gKwGdyzg3dMlgSIYFDvk5xgQXc+MmttTkPYAy0Bo8LjCATpuzW7NdSCjVyj8i2JnpS7UO4P3ffngr2/ATzaXCyhk604bY5nnqNAVtgUsTi5KBV1cI7GcDcNBbahJhqGp8UHzRK9g8quhtTtD9pmzyPPZalYH0xMZIRuSjsE3IV04RgqktYXyta2fKLKk37Rq/c4Exx3VGg19Ue0dYgGdc8xe1SIjqmi36ij2a8Iv0K0PdZJYFnbc3PztiOkeIysflRUEzzfhy9sPEm1KQXbo0p7puPvXIqQlynrExZFSAFmjDj5h67hZ+K9ZREeDRezwkyzR0QL0fZzKPjILglNaVbfwxYXhPijj1IAPZOaxZS+kcg=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700016)(23010399003)(1800799024)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: VNO5zkd+f0b//hD0hMTjVkynHX13uP5GxgabjD16PzqYIKt2/Xa+mbb6zquLytc9KVIdJs01gPr5XlnWE9MAzqMqpIpWg6HSOXt+oLGgdBGvPoe1jk3B8KVCjNHdo8MkbtKKs/OO9dASsHQHcthcCKRV9zpSH4BHhJ56c8FdChEitpSiLscFiRpfM5JuiWpGHNxsm/kwoFG3CPr7pOPPcR8FyrL1UZuMkS6e6+jJyop+qrQdU+5rjwQMhlKDohqRUHO1/za2yLyVI1GExNERSKUkJPjLL3eJJ6K7V527jXiAyYjdJXInnIRSlqdJuqjhYtdTTYZ/x1xyhOs0M94E6sFAN7CZMlcsJxrIbXsz0Juj//3aCHjuB0W46CuqRrhQrsQj1I9k2/p/WZG213m6dLpfInDZ37ZUVnsc40BiDCo0HmwPvfAt5lJcgC/YuxGN
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 09:57:08.1228
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d7a3d71-4e96-4085-7d24-08decb8da0d7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002529E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB999072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_025712_908340_FA412C4F 
X-CRM114-Status: GOOD (  10.89  )
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

Update variable names to generic names and add Tegra410 ACPI ID to
support the I3C controller in Tegra410, which is a DesignWare I3C host
controller.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i3c/master/dw-i3c-master.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index a2a4b88c2017..fbe8dca22f07 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1856,11 +1856,12 @@ static const struct of_device_id dw_i3c_master_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, dw_i3c_master_of_match);
 
-static const struct acpi_device_id amd_i3c_device_match[] = {
+static const struct acpi_device_id dw_i3c_master_acpi_match[] = {
 	{ "AMDI0015", AMD_I3C_OD_PP_TIMING },
+	{ "NVDA2018", DW_I3C_ACPI_SKIP_CLK_RST },
 	{ }
 };
-MODULE_DEVICE_TABLE(acpi, amd_i3c_device_match);
+MODULE_DEVICE_TABLE(acpi, dw_i3c_master_acpi_match);
 
 static struct platform_driver dw_i3c_driver = {
 	.probe = dw_i3c_probe,
@@ -1869,7 +1870,7 @@ static struct platform_driver dw_i3c_driver = {
 	.driver = {
 		.name = "dw-i3c-master",
 		.of_match_table = dw_i3c_master_of_match,
-		.acpi_match_table = amd_i3c_device_match,
+		.acpi_match_table = dw_i3c_master_acpi_match,
 		.pm = &dw_i3c_pm_ops,
 	},
 };
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
