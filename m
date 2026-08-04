Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E7A1C5518F
	for <linux-i3c@archiver.kernel.org>; Tue,  4 Aug 2026 10:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=22NAjVSaqeLx+ohQQjdoQsPQOMilhOICOxrB/nYXpzA=; b=ER93G6T9fjDbFy
	OHVCecjOinIhCYCBeZktgiBABeVyLr11lw5d8g4lWanR2fsLD1nT4jef2j1566x0cUgTa2GXf08sC
	RZcCgKgBy3y4D4/ysttNBrxjUjrNUpC/EzldHczr66+PCdZtP38IxOs0/VxtUv9v0kg/7UV4zXUy3
	kfcBVwi+njYYLFuVTo0kXKetYU2YzLqm5JnmES05oeYWwRjcvzBfDfMM27bkdTe4DNOVDTGvnyMM3
	S34dYDGEneJCM7PB8eZ+fJBkDe8eRig8gKL7azxGisfgUQQtcwttTvLydXSLc8+KqHy48tqHhWsJB
	teHKWS7X2+xsdhBpvuTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrC9l-00000001WlC-0p0n;
	Tue, 04 Aug 2026 10:13:57 +0000
Received: from mail-westus3azon11012056.outbound.protection.outlook.com ([40.107.209.56] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrC9i-00000001WkU-2k0G
	for linux-i3c@lists.infradead.org;
	Tue, 04 Aug 2026 10:13:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dEuunriFLpSAMODdVRpv85MA4bFlBks6ZYRy8kJWM04W+pAXyJBJD0z9Qa9IIh8w58lL9+I9YOCWpYNk0J3OH8uRnAYlLIcTxL8/NoUdLFnrNEmwQvV3w+4Q/Ij+JvO3u6rx8s7XsImot2RGNXnf78H6n3dHU1t+y87w33DTqRcKVsJrybaMiiaaIssYDHu0XWkrvsyM8P/ZFJmd4FHfQfj0CKYu6NWaWiUFM8EquUzDdPaktIIR5v3/VghQIG4xpfu54wYPoJHVQflQ6MGrrSWUYvPGvEv8hVlV3T+A4cyf/SF4m9pblwjE6tkNwUkbW5dq1K4aVtZZRV8Pls/sFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L2VnCsUPCd4m+awsdNZzG6+0QyGtEc0jsH23ed1oo68=;
 b=s46MENRdM2jjz4zTqnlDTf2Tz/X+SGZrUEvHQsYi/s7P2RYIWyB2sbwzQH3R9yXLgFa3oa+GT/jA8LLf6509pIMvGlTQIV1W2/8u8tltiK0RpsDaFfQsBPUuFaE0xZSp0oWpUIqUPcKVnB9aWz451q7ibYK93drcFQv6B7kBd5NHbWjWo8f14eWNuD7i7YFwWtbuPt7d1+x7vAuARPAWWAhFX5WTY0ZYwsITBQG6AZ1VEa4wSIyx0A8inx5W2FHpxm4DOFgpmCm7KUPSzq8drTCpGpxhlrA2bpLn+/YH4xAhSBg8Rpp32QEHcvw24/srk58sUCRqENy8AbTh7dogsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L2VnCsUPCd4m+awsdNZzG6+0QyGtEc0jsH23ed1oo68=;
 b=tGcPSLMGxD9LR/HMvxCnbzUh6lGhFJXuX1gnUaQ72CUGZ7egTXiWn1ksC3nPTRnb8Tjb5l81P41anb0W9b1QE+LrjD9BwK6TpWLTHeSBLJe95wzjtP1ydCCeQ8yWIyg6NaoVAm2DfrFK7pmuBrIyRNlwh1qQVZvgmhzi+pUYvnb4+x73hpXZ3u/VQJBHgEV/bOO9bq348Hg6G950uffg4AHZTt2ROrXtaZf8X1pFuOEDQkgZjwyFAZvY4c0Ik237x3tYI3WDIoST5q7aTUHFt7RWLRBs1Vd7oSozodrCvtW5cFBcQK+GizuEiIhgpJHTGHPeKc1jLUhjR26/ZHjWJQ==
Received: from BN0PR04CA0199.namprd04.prod.outlook.com (2603:10b6:408:e9::24)
 by IA1PR12MB7734.namprd12.prod.outlook.com (2603:10b6:208:422::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.16; Tue, 4 Aug
 2026 10:13:40 +0000
Received: from BN2PEPF0000449D.namprd02.prod.outlook.com
 (2603:10b6:408:e9:cafe::29) by BN0PR04CA0199.outlook.office365.com
 (2603:10b6:408:e9::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.15 via Frontend Transport; Tue, 4
 Aug 2026 10:13:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF0000449D.mail.protection.outlook.com (10.167.243.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Tue, 4 Aug 2026 10:13:39 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 4 Aug
 2026 03:13:25 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 4 Aug
 2026 03:13:25 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Tue, 4 Aug 2026 03:13:23 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Adrian Hunter <adrian.hunter@intel.com>, Akhil R
	<akhilrajeev@nvidia.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 1/5] i3c: master: Release the fwnode of i2c boardinfo
Date: Tue, 4 Aug 2026 10:12:57 +0000
Message-ID: <20260804101301.2975911-2-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804101301.2975911-1-akhilrajeev@nvidia.com>
References: <20260804101301.2975911-1-akhilrajeev@nvidia.com>
MIME-Version: 1.0
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449D:EE_|IA1PR12MB7734:EE_
X-MS-Office365-Filtering-Correlation-Id: e700f683-44df-46cd-f3d6-08def2110e21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|82310400026|23010399003|36860700016|56012099006|5023799004|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: tgX/sk4+hC63CdTQKFh2LOZPZ7nxlEooNkvr98UdMbJFT2A+TLAYdrXBH8kH4uVs7vOYSbxP3u5PqcTPSdeZMq8OQOEazsGU6TFJ+Dj7YYjPQhRddNsGLECo2YVkAgeNTNhom9V9uQQTQm2PKhjpz2X40gjsMo8dgMXI3B9BYs+bMPvHpL6kJOTOIpyAwOkUHN6lB9vAalBL7yzA73JPITy2oCrKqtwOFtmju+NuJqw5je+irtDaasnkDGgIl8ShHJr711mzdwvbf3BwtL7o1NFYtl+DeWWypLJDBAK0J4kwLJOczxJJm+ouQQ3vEj/R/iBelGrWZH+AfRsoNYwZm/9c2GeRBYzSs28ohsAXtXbKNQ4B/0kxta3NCZEBuqqL/vnPmzdU5wBkNGktbRytNknLxSjKUBtN0vR5lGUFSDlrc7NmreVb+T0cGse2O5/uo9PGGKmYZpA/LT6IObWbwViUuOamIVDriAAvk2g9x9tRM6DXKds2VjC0NreEMJDnc/KvXCxRPlG+9XBDgdZP3tTWZSjhg9znrfaVUvs+zlpW+n0PWOAyIWj0G+H7Bq6erheKujLfnoXV1umbzfzzAoiTR0Cdf17tqfkIU1JUOQddMmO0qDWzCBRqVoJwOeXuwab8Jgo+X5iLmMkxIWHe0y9MHbgE8BLhGZhQ7+kEnymYqB9hFamStRsjhxS1CB5d+Myo1xrySS3TC/e5A83GcA==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(23010399003)(36860700016)(56012099006)(5023799004)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: oHZIlAtlYgkZDhf3G44UdQxthvGSVrC1mU76yyuscr5phADmrt3eaJT1oWglhIdsO6Gd0SDJqLJgfm+fBxq5QQe2fBlOIuDd3xyIqGMMGw1bH0pm00waOQiTayWFRSZZpFecMKgUzK9UzhNnEeVYvL/aTGzk5foW7HDmJY547sAtnISC8l/vOWATUrYpQMyVBz/mMN4GaSjJN1wUMU6kqUvIz7uY/c9CPUbVwAszTvX+bRwbvvYV/hLT0h4A17BmbTwmukYH49/natvvynxb+e8sg7DKHVm5PZVAoJl4I8NxqpaVLn4GHV3hl66McYsLSbOkqFpToHCC8GIes5lDd8xi3ibQ7j+6yHHd4LSCqXn9Q56LS0qH4j4VzxIgfPJ1Tvb/HdcU3LT5y5GXojwhD9xsfS5+NEYHo+v3EVYsY18wPJkl2FyWtyR1KM8sB03u
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 10:13:39.6880
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e700f683-44df-46cd-f3d6-08def2110e21
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000449D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7734
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_031354_696075_647608E7 
X-CRM114-Status: GOOD (  11.35  )
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

i3c_master_add_i2c_boardinfo() takes a reference on the firmware node of
every i2c child described for the bus, but nothing ever drops it. The i2c
core takes a reference of its own for the client that it creates, so this
one is never consumed. The nodes stay pinned for as long as the system
runs, and more references are leaked on every rebind of the controller
driver and on every failed probe.

Drop the reference with a device managed action on the controller device,
next to where it is taken.

Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
Reported-by: Adrian Hunter <adrian.hunter@intel.com>
Closes: https://lore.kernel.org/all/97465893-3650-4f37-98b7-1db76fc6fd03@intel.com/
Assisted-by: Cursor:claude-opus-5
Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i3c/master.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index f485b98805cf..08dc10f172aa 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2871,6 +2871,11 @@ static inline int i3c_acpi_add_i2c_boardinfo(struct i2c_dev_boardinfo *boardinfo
 }
 #endif
 
+static void i3c_master_put_boardinfo_fwnode(void *fwnode)
+{
+	fwnode_handle_put(fwnode);
+}
+
 static int
 i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
 			     struct fwnode_handle *fwnode, u32 *reg)
@@ -2913,7 +2918,8 @@ i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
 	list_add_tail(&boardinfo->node, &master->boardinfo.i2c);
 	fwnode_handle_get(fwnode);
 
-	return 0;
+	return devm_add_action_or_reset(dev, i3c_master_put_boardinfo_fwnode,
+					fwnode);
 }
 
 static int
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
