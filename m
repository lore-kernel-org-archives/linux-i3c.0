Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A9F4C5518F
	for <linux-i3c@archiver.kernel.org>; Tue,  4 Aug 2026 10:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SZXAR37YatT4ockD695WdsK6EprO2PQBcgASgtfjWFM=; b=fYNrNs6naNxHs/
	kBExLfE9AvzJLsfc6e3GbI/iU/g0F2Y9xevl6Kxhn3eZcZJsINuqsRZ+eEujDfLE1D5zbngY45Zrh
	AdIpYHvRI2LeqsFtMJqIu7wSyDy5xUlTI2Aw5vxDL2KqYoJ2HZg4UPa94L4iXE/gnbS8WifC00uI/
	UZViLtuxwPxPh8dVhUgyvjF9edAKr0MdYvq3GorcKxRidut91UGZKo5hhermlvKecplkPZytqGaHw
	hAiivdzk7pIRHz/6if3QnR8VmkKv3l+OVUGq8015qLt2GqxUBXmYCEu+3u5VdpCRjFaP41DgGtGZJ
	AYFKSC+2/5SmQm0NDtKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrC9r-00000001Wmx-1602;
	Tue, 04 Aug 2026 10:14:03 +0000
Received: from mail-centralusazon11010033.outbound.protection.outlook.com ([52.101.61.33] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrC9o-00000001Wm4-37O3
	for linux-i3c@lists.infradead.org;
	Tue, 04 Aug 2026 10:14:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qR0r3GxC1srWlrFirVS5RigPrHITMhVS6rcJhTzJF06uqkJURTMJn+/9KrAOQbYYQagQnkFp4NhoXVOZuNGrFDvhCDdz/xtMuFNS35zXpVOXQB1zEsR//J6cRUCgdZjDZfbatV2F+LtXuPG/wZgTTaIYKPb5XaYULB/hkf17HDnBYwPATHmx9191fLEmBG1AKQ0blANanhqGC3YcFlMowLr5wonium0JM6gzAX0DnTJpgvMJU8quVlG8YnBQY+1wr0vxXZ5SzIQSSD3b4OwdszNWEP1Ot5eqt3op9Bm+2pNWgcWEmPJ1C5e3A3X+YxI4PJbun1s2GUm0n9pXBQpBWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ev2cf9LjZQbzdoul9Oqi6NMr67KFyKnHZBAAuVifTRE=;
 b=hgZZ4KndGZzrqm4mUninCrSYi8uGwendNw1OFSAokR2gt6VS74AqUXzqGT3cK7cvEXYvOzXOydyv8jSP5+ESDZkUMWoit4sr6J5FXzcXRz8L9U+lTYUdGffl4cFSG+GmTWWhtPDKdxkf2iuNN7j93piblCZHAwPwHuBT2AFa9Cv6MJYfU7/BtWrcJ8cNKIcL/VpUgUu5h42UvU5NNzCyEyRjOuw0OLPpgA3S0QpTgJQ8DlyPou7rMnTwr7jY1LINnHj/fZNByli7MRWrqYHlx1fE0Y6OFIbxTE+Fl2MYh2AcIpw/zLVAvQRAwf59V8gGHoPSzSkaWtU6JH+2Xa9Waw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ev2cf9LjZQbzdoul9Oqi6NMr67KFyKnHZBAAuVifTRE=;
 b=RZ9/NdBblOrp8DWy+taRLl28HHJfQSFUg6sL/Kk6FPRu6mKk4IpkiQL9y89MjYzKZ6rzi2qi0JGpBPem7TSOlDJ3leaXDIoB7RwjhhZir3Ydk0qMfb+gwjsJpbatkGM4mEdwAJiIejeKBXrPERbO5azkeJ9tg/XiWKPQInSH7BZBY+C9ROwtKTfPgvo0tau46H6Zt5K9BadKPnXxHdWpY+JXjNq8ZsFr4IxT1TXnT98oxEhKWAyzVlu0ph9kZ2YyuKpHyRxj3mciZpVGwkEFAgnPea/DwFemMextPUo8s1bRMfb5s9HM/w5MWF1Rs9Lj7RZwzL6wW+nmgQ4Rbx5Kew==
Received: from BN9PR03CA0071.namprd03.prod.outlook.com (2603:10b6:408:fc::16)
 by CYYPR12MB8962.namprd12.prod.outlook.com (2603:10b6:930:c4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 10:13:47 +0000
Received: from BN2PEPF000044A3.namprd02.prod.outlook.com
 (2603:10b6:408:fc:cafe::49) by BN9PR03CA0071.outlook.office365.com
 (2603:10b6:408:fc::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.18 via Frontend Transport; Tue, 4
 Aug 2026 10:13:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000044A3.mail.protection.outlook.com (10.167.243.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Tue, 4 Aug 2026 10:13:46 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 4 Aug
 2026 03:13:32 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 4 Aug
 2026 03:13:32 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Tue, 4 Aug 2026 03:13:30 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Adrian Hunter <adrian.hunter@intel.com>, Akhil R
	<akhilrajeev@nvidia.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 2/5] i3c: master: Fix refcount of i3c fwnode
Date: Tue, 4 Aug 2026 10:12:58 +0000
Message-ID: <20260804101301.2975911-3-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804101301.2975911-1-akhilrajeev@nvidia.com>
References: <20260804101301.2975911-1-akhilrajeev@nvidia.com>
MIME-Version: 1.0
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A3:EE_|CYYPR12MB8962:EE_
X-MS-Office365-Filtering-Correlation-Id: addd7646-b7ca-48c9-126f-08def211127d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: zunJyVq450+GXid+6Xy4x+9JRpigyBOk7537lChlcyyXMCde5pzivJIhN5iN3l7j7x8p1nC7pa2xc+kWbNIgmE6tV7jIr+B10fn7IAJokHzFeMjXd20zmcZ5pu+6ibBt9EyrLKNNpMeUDSyN2vpA+7BjcvYyhxaGeY/AGodB2BrUr7MwtvTgbhUlnUChI+1CkG1Yg34/RRPUOm9pmgdpQKB5i/W8vIKZqLVKkhTaLuc9XK7JXRfcxszUWytixkUB/hwNe1qP5xKRN8wPR8ONgtnnXPBgAxkSBuZ1Q2xcQcgqAAVBPq5/dr6VBIkV8nRXNpPMefl3KcDUUmQUJ+gfoLLg5aomEwyNEmpuAXBeaVLxxd9S6u3FQwgEPiv5gRiyQKILpSgnLk3iGMgR7nDBprGuTxbDuXCImWadJmcBj/wbHL94A7POmILsYmhTBuK21X962XgirEfIZ8eNsQGWW8Vi2iBiFnbAMlytzwr6LMJ2IZFnQ4GCFHsDinItLOXBCyKOC5JJt6f2EijiYaYZq9On+yvmP+0Ds75cJNyIugixen2L3UYjAGMSmCXoNIePs7pZKlklVlPgXOLYRTmOJaiyJSKzTDAD4xLVMIL8/fQXEkUtho1ak4gQocLkmhsyXHczaXPplsutrTT3KRhfGL9RokNxOkIMMoPkXL3YFtNNtjlstSuJuyuJI6Pg4uyorcwdtW0mFMjmfdiPpRSsSg==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: PUqg9Dl9ltNfDTD///9pA+HpCGO2xfuyaNcrIMQU5UkbaOSL1NSNc88RcS705BuAqgcSrU7j5BQx5N16Q7otD50vHThDCwhRRuxGzE7/xiLSRsC8s68eb5dy2TQxctHQ+CoQfsUbEUsMVILOxyDs6gQCQjxI1Nb+sVZ+OSIntrbg+FTUySI5VHYJdsMMkXqSiIKz9CKWDzgWWy47IcwP1/PvHc8hv8vt8vrUkh6uI63HiPLYG9KoB2BprUswELOLhwLGLkCvaEKhO2y0KTvI0ollMJ7B9FUL4aW6q+no3i2WakvPPfh+Gs8nUgr3bmz7YWPuiMNmljkVDTrmuH+X5ykCJPE/EX9zQTX3L6P6PERXw9c74YwMbZoXoTcPS9OcFQ5LirfJS1vs9Xh3LsEZQ8ARUBUDpNGdxEOLc8XrI4zkLEzzuH4iUZZR7ySKuMAc
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 10:13:46.9875
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: addd7646-b7ca-48c9-126f-08def211127d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8962
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_031400_786582_BB87333D 
X-CRM114-Status: GOOD (  12.58  )
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

i3c_master_add_i3c_boardinfo() takes a reference on the firmware node of
every i3c child described for the bus and never drops it, while
i3c_device_release() drops one that the device never took, as
i3c_master_register_new_i3c_devs() assigns the node of the boardinfo as
is.

The two mistakes cancel out for a device that is registered exactly once,
which is why the imbalance goes unnoticed. Register it again, as happens
when the bus is re-initialised, and the count underflows, so the node may
be freed while the boardinfo still refers to it. A child that never joins
the bus leaks its reference instead.

Take a reference where the node is handed to the device, so that the one
the release callback drops is balanced, and drop the reference of the
boardinfo with a device managed action, as it is done for the i2c
boardinfo.

Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
Reported-by: Adrian Hunter <adrian.hunter@intel.com>
Closes: https://lore.kernel.org/all/97465893-3650-4f37-98b7-1db76fc6fd03@intel.com/
Assisted-by: Cursor:claude-opus-5
Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i3c/master.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 08dc10f172aa..568788e4cdb5 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2102,7 +2102,8 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
 				     desc->info.static_addr);
 
 		if (desc->boardinfo)
-			device_set_node(&desc->dev->dev, desc->boardinfo->fwnode);
+			device_set_node(&desc->dev->dev,
+					fwnode_handle_get(desc->boardinfo->fwnode));
 
 		ret = device_register(&desc->dev->dev);
 		if (ret) {
@@ -2994,7 +2995,8 @@ i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
 	boardinfo->fwnode = fwnode_handle_get(fwnode);
 	list_add_tail(&boardinfo->node, &master->boardinfo.i3c);
 
-	return 0;
+	return devm_add_action_or_reset(dev, i3c_master_put_boardinfo_fwnode,
+					fwnode);
 }
 
 static int i3c_master_add_of_dev(struct i3c_master_controller *master,
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
