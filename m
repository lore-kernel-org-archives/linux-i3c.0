Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F44C54F4C
	for <linux-i3c@archiver.kernel.org>; Tue, 28 Jul 2026 07:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VReylto4K+YTWg+3XDYXdIFcnRqNA3X67fOQ5hPsoJM=; b=17UH8Bcarwe0oV
	VlrytU3W3Rj3N33Nuu09NTBtTCT1VcH0syhJGmLpZGoGkb/MvcWhXSR5pkkMxmagiapZYHDvlFjrm
	9IxK7H8xPkWpTRA85of1pwAnFWY6MVqpTPLuIhkneOEw6Et3od16wwQ2Gv+iIN90/p/qnzm+t9yRC
	et+tAJLU4QTrI0oOPlmBQoLLk7+hLfiuTogbXliPHMAoiHReWEz14s7qf8/PYrLN08Y9NWlm/9yJD
	/UT9OfzDHfym/GBD9aQLA/jF4R4cOpmLXAaNvaLGy6pQMwuuQIqmlk1DPg1caru8XcXg7Fz5qvQEG
	4tOQmXpfr+c0iS8525uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wobpN-00000004bDf-0urs;
	Tue, 28 Jul 2026 07:02:13 +0000
Received: from mail-eastusazlp17011000f.outbound.protection.outlook.com ([2a01:111:f403:c100::f] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wobpK-00000004bCm-2t77
	for linux-i3c@lists.infradead.org;
	Tue, 28 Jul 2026 07:02:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D30igDYJ9EAbKht6/SPO1bMZOBQL7QzfwTFdDVUALLU5TE73LCo9SmRtc0FMwEXLQiLwbOUgLtgScbdIgdUGAJlrYOCLFYQfVF3okfOAtV0WV3HVAmspGWtuCdeEJNGLCT/kqgTqdh2uNLOtm84llI8lXrXKEC72sEL5XCMlcLL20zLaS/WWHrlWeD3nRmBjfX/sxesXaC66Rxm2J497Xo367crJv56ZUS0W09hruUCV/g2pfuGvY4lWZCIpkMdUtJY//n4vRoEgiQn9xSLDsdICHSToUWC+G4TmLbYZ9zipmVzdCHt6u0BwbmEdal+5JO8jHQre6hxxtn0OOJJy+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nXiZLvmVNls5WTEyrIpukPGnAtpktQIzLU5eA+IgSlE=;
 b=W4cfmIDCjqpu3YxiDM1CXksWMJNCd6vI0ICOUJHiWF9eHRvQBBPIsJlFc7aJ0sqWz/3zAB7Ou5LPObNWApz77nT56E7GeWgB8DMPKN2JSFpQIubwo5UR1WfnyrlQUw9d1+oh3VgYLAUagDoswnPJSdj5F875tfFi3rWaMJM+14KEQy+9i87FYL9eNUbbc3DI0CAZEPR1e+kYDhM1bI9MDvYtKyYHu8JQcqUoAscnGQD4lAUI2P3KO3oKEGrqmwAoFqXwCAyKeGtzUPgNwtZSWQQ0n/1RmvVU5ziWqFVbVkkeKrNoKGwslD3OLIrZOVC0Lp82Ahcymj7OprbCNuGg6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nXiZLvmVNls5WTEyrIpukPGnAtpktQIzLU5eA+IgSlE=;
 b=EwP3vCNLj8TfLndbf9m8CDBlDpqZtzxiv3aip/qUBkBYJkwQZBAwMgZMQiTdBLs/9vC3WZ6mGhgpPUdUvV+T7nrtpz6h/Ds/A6IXEbKRyE3PH0e6KqyWtQJwCdMpPmMwqdrMh/b5O634QFP62/+tZ2HL9OdOjCvzh3WM1KzirJgGa4RL2l7ksMMP5cCJrN45l12lhtQKoi6dxTFbWytsVUAwJ6e0+qL5KarTgLnZNkcz3YXlaBwK3a+MyXk2sdyCipkCwIMbCVblUrsJnsWEq23tzdNhIxZBML9PyqHqiD6PPfZr6UPJLnOOtfOevIELpFh8DN2PVzhRwVDSk4BpGA==
Received: from BN9PR03CA0867.namprd03.prod.outlook.com (2603:10b6:408:13d::32)
 by SJ2PR12MB7798.namprd12.prod.outlook.com (2603:10b6:a03:4c0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 07:02:02 +0000
Received: from BN2PEPF00004FBB.namprd04.prod.outlook.com
 (2603:10b6:408:13d:cafe::a0) by BN9PR03CA0867.outlook.office365.com
 (2603:10b6:408:13d::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Tue,
 28 Jul 2026 07:02:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF00004FBB.mail.protection.outlook.com (10.167.243.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Tue, 28 Jul 2026 07:02:01 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 28 Jul
 2026 00:01:44 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Jul
 2026 00:01:43 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Tue, 28 Jul 2026 00:01:38 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Frank Li <Frank.Li@nxp.com>, Frank Li <frank.li@oss.nxp.com>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, Rob Herring <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, "Guenter Roeck" <linux@roeck-us.net>, Philipp Zabel
	<p.zabel@pengutronix.de>, "Jon Hunter" <jonathanh@nvidia.com>, Thierry Reding
	<thierry.reding@kernel.org>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Akhil R
	<akhilrajeev@nvidia.com>
Subject: [PATCH v7 05/12] i3c: master: Add support for devices without PID
Date: Tue, 28 Jul 2026 06:59:47 +0000
Message-ID: <20260728065955.809445-6-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728065955.809445-1-akhilrajeev@nvidia.com>
References: <20260728065955.809445-1-akhilrajeev@nvidia.com>
MIME-Version: 1.0
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBB:EE_|SJ2PR12MB7798:EE_
X-MS-Office365-Filtering-Correlation-Id: a99c7304-7054-49cb-1157-08deec761fba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|376014|7416014|1800799024|82310400026|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Qv4oB9traFdVCovlIQaMlX3bbsrBai/HqVPS6CCnjv8p0Gsl6eMMpQYcUQuRe9eVasdNqA//ItVdJnqSa39D7Bh2cCYv/WDfOupilWVXOdiCWB83Pj+yPPCOijfe2Y8ltaG8jwMFks03AomnxL7Zu6/utUSg+THj3lzzke0fzAj7PzXQNcMz5YkbBk/hQX4K3bxgEIGe6bWA/E3G7CaE93jI9IUcGmAMesrWCvHYoiAbKeb3PkRglPzMWJToZpIAcH2YkQcz6QAmNw+Yi7NuB1wJH28lBv7ZwSP1QXzRkSQSmLMyLP0I5O8gWBb5zvu85vcPIws/OgN4a/7Gqwgq7n38EG9+QB0uH0QEcUC/k6JlOIoEqns4cDVhIWeGx4MfjLu4USmAEQF41IZ7rpLNod7IiuPf6lVH9k8HYLhwfJfveMKrqc7fMprsGA9zXxfCZgp+8VPJ1LtQpJqK0jUNpS1BZTQAPTLo9ZTU0cftzySIjEi+wu/5nnDJOQTNU4iSmVV52DChBHqEhVkpxbMOE1332S5JnpW87ldgSZre/v/tSC67tuhGn+qu2cdX9oMfwuT+rSvGJ5i5PuslArVYfVoNfYtsUbTYk7weMPnMxRRMRE1HoBRE/4ysgQ2GY7/KPL9sDXJyEYsS5yWfE/Nu4fCyGF4vIjLUtrpypngL5toGDYJj2YUSHv9+uNgAp5p7qLY5WFrD9SfYFFU6Nc6mhw==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(7416014)(1800799024)(82310400026)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: E9DpCXwrRncIa0+ZhPxWdLKrGsEcKevzkYipQw9vpuyEkfGqKWonwLubUbVlZ6EhosCAaGWvqJQzDXeQ8UP29yx5gxMcHZ6PA6I2zTYOuq5dMPH1imQQGM5C5voc59Ct/NVOcNKfjQkp5k+dROe0ndQf07C8aiIhYTGkeStkTx87RDTueus1sPO/70XcyDIRMms4FgZdUD3NI+LxLX4eVNZYH3hgint6vxP3LorQb/z6ibyfMgwiYUDZrnpEOd9M9DWgjhkf8iZFfGdBgthUIDmmwnrt48MlxjrHcKpPOjWiQ659b14akp/1ZPFLXKqKcxcVyjfnf4piuqpvEX3bC/d93B9nyQfp64QUNZdFCDackQX8iQ6TlW1nIWumLV9ABR9J6m6igieaTtShCUzsjBSkNqcGNLQ68WkBPye32NtkqSnqsn44222dupPNUR4s
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 07:02:01.3977
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a99c7304-7054-49cb-1157-08deec761fba
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7798
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_000210_751558_3AD7ABAC 
X-CRM114-Status: GOOD (  15.26  )
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

Devices using SETAASA for address assignment are not required to have
a 48-bit PID according to the I3C specification. Allow such devices to
register and use the static address where PID was required.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i3c/master.c | 52 ++++++++++++++++++++++++++++++++++----------
 1 file changed, 41 insertions(+), 11 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 87749a739e62..488177d95e48 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2001,8 +2001,17 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
 		desc->dev->dev.type = &i3c_device_type;
 		desc->dev->dev.bus = &i3c_bus_type;
 		desc->dev->dev.release = i3c_device_release;
-		dev_set_name(&desc->dev->dev, "%d-%llx", master->bus.id,
-			     desc->info.pid);
+
+		/*
+		 * For devices without PID (e.g., SETAASA devices), use
+		 * static address for naming instead.
+		 */
+		if (desc->info.pid)
+			dev_set_name(&desc->dev->dev, "%d-%llx", master->bus.id,
+				     desc->info.pid);
+		else
+			dev_set_name(&desc->dev->dev, "%d-%02x", master->bus.id,
+				     desc->info.static_addr);
 
 		if (desc->boardinfo)
 			device_set_node(&desc->dev->dev, desc->boardinfo->fwnode);
@@ -2401,8 +2410,18 @@ static void i3c_master_attach_boardinfo(struct i3c_dev_desc *i3cdev)
 	struct i3c_dev_boardinfo *i3cboardinfo;
 
 	list_for_each_entry(i3cboardinfo, &master->boardinfo.i3c, node) {
-		if (i3cdev->info.pid != i3cboardinfo->pid)
-			continue;
+		/*
+		 * For devices without PID (e.g., SETAASA devices), match by
+		 * static address. For devices with PID, match by PID.
+		 */
+		if (i3cboardinfo->pid) {
+			if (i3cdev->info.pid != i3cboardinfo->pid)
+				continue;
+		} else {
+			if (!i3cboardinfo->static_addr ||
+			    i3cdev->info.static_addr != i3cboardinfo->static_addr)
+				continue;
+		}
 
 		i3cdev->boardinfo = i3cboardinfo;
 		i3cdev->info.static_addr = i3cboardinfo->static_addr;
@@ -2416,8 +2435,12 @@ i3c_master_search_i3c_dev_duplicate(struct i3c_dev_desc *refdev)
 	struct i3c_master_controller *master = i3c_dev_get_master(refdev);
 	struct i3c_dev_desc *i3cdev;
 
+	if (!refdev->info.pid)
+		return NULL;
+
 	i3c_bus_for_each_i3cdev(&master->bus, i3cdev) {
-		if (i3cdev != refdev && i3cdev->info.pid == refdev->info.pid)
+		if (i3cdev != refdev && i3cdev->info.pid &&
+		    i3cdev->info.pid == refdev->info.pid)
 			return i3cdev;
 	}
 
@@ -2860,9 +2883,16 @@ i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
 
 	boardinfo->pid = ((u64)reg[1] << 32) | reg[2];
 
-	if ((boardinfo->pid & GENMASK_ULL(63, 48)) ||
-	    I3C_PID_RND_LOWER_32BITS(boardinfo->pid))
-		return -EINVAL;
+	/* For SETAASA devices, validate the static address instead of PID */
+	if (boardinfo->static_addr_method & I3C_ADDR_METHOD_SETAASA) {
+		if (!boardinfo->static_addr)
+			return -EINVAL;
+	} else {
+		if (!I3C_PID_MANUF_ID(boardinfo->pid) ||
+		    (boardinfo->pid & GENMASK_ULL(63, 48)) ||
+		    I3C_PID_RND_LOWER_32BITS(boardinfo->pid))
+			return -EINVAL;
+	}
 
 	boardinfo->init_dyn_addr = init_dyn_addr;
 	boardinfo->fwnode = fwnode_handle_get(fwnode);
@@ -2885,10 +2915,10 @@ static int i3c_master_add_of_dev(struct i3c_master_controller *master,
 		return ret;
 
 	/*
-	 * The manufacturer ID can't be 0. If reg[1] == 0 that means we're
-	 * dealing with an I2C device.
+	 * I3C device should have either the manufacturer ID specified or the
+	 * address discovery method specified. Else treat it as an I2C device.
 	 */
-	if (!reg[1])
+	if (!reg[1] && !fwnode_property_present(fwnode, "mipi-i3c-static-method"))
 		ret = i3c_master_add_i2c_boardinfo(master, fwnode, reg);
 	else
 		ret = i3c_master_add_i3c_boardinfo(master, fwnode, reg);
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
