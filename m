Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF9A2CD98DA
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Jun 2026 09:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=06UqQy6mZWYcOrFJ9sc06ZNcz82txGOJDwIQAKrK6dY=; b=1tg9C7amE9JO6H
	GHWmlvr1mT2/xZ08FAP/4nj845cpI3lTsA7JLSPacGCUQEtDOlQoqtqSKuw/eOfKhTeC12RuYT8zK
	dOt51G61llZq9RbeD9cFqnw94jAUhBSGRjLmxOlLfwTQ5eGWZ3Z24A33xghQcPT96S7Ip07Hef5sV
	v/71QRYY5+9GRu+7d1tSRtKTPd4svkHdNtSitu9rV73TUh6lrkfQYDbbokp3S1/SIAy9k3e/+gSXc
	c2f+jiXc09PoIP4bDxzLMJBWi5/BoXkRhQPZaxP2+CJeW4YcPJodEKkjZV/z4A2f0AJLZKfozDbFj
	EaDU8VeS2Gq6f7SnTqtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZQWx-0000000FYEe-25JQ;
	Tue, 16 Jun 2026 09:56:27 +0000
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZQWt-0000000FYDc-0wEN
	for linux-i3c@lists.infradead.org;
	Tue, 16 Jun 2026 09:56:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mjRunR1nbjCS3HI5MdVcCyTKj3tcHv7fdv/EdNU9L2pmrZm7+1+WGm6htveX0A+jdE7GlMlP2inghHhNStcZUEEqYmlIbfVGP2qWlRMn9jR0Ik0bBsZNE5fY+YDkyAoYa1K+ZG0+X9xJwe4v1z+4kXn4D8ShahabFh9AG6i6bu3WH6CDboHuqSuacbxxqeXWMbB/TiHVeHRtOP6lwWTsnJUOXcEFAy5UgagwVhZqHl0c7gorj8ZUJfptqfePKL39R85cQZXJPT8Dk56yYDJfeSLWn5N37+vyS5ua1MH+hNU2XF6tUTD3BV5aK9kHP6KBRBL3g66XG2ysWsuvnIgo8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TcGa+mMgg7WkPZ2HuyxKaJDvEuZAcuCN723hiWkxJXM=;
 b=E8UGfL3yRElcIN821+c12z0A8FW7H8WdmUMPyZr+J83dHHqfHqebhWFj9zXD7WmqOhrFrn2kHcwld2MMH+rbv7GMCmakzwgyewWljXfnXyzerLh7d0y1R/LI3yNdZj3YoIuuhsOTeVjneAJauyjvg1p00ok30wB5xteafc2JHl8Hhz8SsK49C+xnoeckAOtIXzjIkK/JzxSZ8DsS2++MwwF/xFmRCF+gSrMTQPiohjW0SSjsSvaaQXwFEqKmqGJUCIKyuXYFo2jeGJYDa8BFeZ9Jn83GhRxWikl+5BSEbeQYXBo9EznOL7OG4iyLxQ5ZtoaCvRB9P8CgDvtwx0uiNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TcGa+mMgg7WkPZ2HuyxKaJDvEuZAcuCN723hiWkxJXM=;
 b=TanFW1uIJuUXuzub3sVaat9b5mRwCZ0VZmwYyZi1j31fg27iAmz84dzqmcHJBt2DihdQysGddVC6xZuvxay5aVVfEhlfk/tbqN7PryuYoQ6vDBqNeq2PUegScThe+nmfDCqcAYCKzxrl8+hQ9pYNrcAaxbwm8mm1eX50A1tFG6CYw2pwpSdHSzOgzz+E/0j0D1tfZWBu/YraqRW5WI0b/2kx5/PyqB+XtxXvq3a1ok/+ODRKyIQqDcSg9P8zTofBqJM0spDyDADzO+3lb6IvANuKaPuQVVqW6MCFopDKbDMQ11VGcFR2Ag0sYVW9xLGpj0d/OClBqNY0FLD6hg0Ufw==
Received: from SN7PR04CA0204.namprd04.prod.outlook.com (2603:10b6:806:126::29)
 by CH2PR12MB4293.namprd12.prod.outlook.com (2603:10b6:610:7e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 09:56:15 +0000
Received: from SN1PEPF0002636B.namprd02.prod.outlook.com
 (2603:10b6:806:126:cafe::66) by SN7PR04CA0204.outlook.office365.com
 (2603:10b6:806:126::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Tue,
 16 Jun 2026 09:56:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SN1PEPF0002636B.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Tue, 16 Jun 2026 09:56:14 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 16 Jun
 2026 02:56:05 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 16 Jun 2026 02:56:04 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Tue, 16 Jun 2026 02:56:00 -0700
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
Subject: [PATCH v4 05/12] i3c: master: Add support for devices without PID
Date: Tue, 16 Jun 2026 09:54:19 +0000
Message-ID: <20260616095429.3947205-6-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616095429.3947205-1-akhilrajeev@nvidia.com>
References: <20260616095429.3947205-1-akhilrajeev@nvidia.com>
MIME-Version: 1.0
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636B:EE_|CH2PR12MB4293:EE_
X-MS-Office365-Filtering-Correlation-Id: dc8b4ada-c55d-4b6a-f2fe-08decb8d80cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700016|23010399003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: berao3PcwVTov/9Zoo2xb0MHsFAODOzn3x67j1NH/n+CtOuMbf6dHgb0BaVo13H4P46lidPyHK5X+azJJSu7R2RtDedlT6AYHEDUc1ogjUPISSO/X9YHBnJDI/9/hgXEPgz/x8dor+rNQE0Ok2nOQehD82M3tJ66P1rk0EmDFJ/0Me9CMtDO8a0LXF6NZBTHyKL0JPpudcPG4ixQvztdc713POgCby/mne0RlG0TSNwYDTNhV0RdE/P4mqTkhjR9H8zGgCJr4i7Ka3vQ2mVIMuz9VIu2vUjVzZYZ4k4enDqbOS+a9ibIpb3HGE2s6JvbKX5PuUjblD0eRUsF1ISSdjs4WtedCfDPvr+yo+Vt1iYcmaF/tnmSBnAcUY411snzkkDmSbrzFzQfxZD+FKlzVxPGYtWVjXSlX3K3vRWuesEOX+lsSdk0h6bmld/nW3Tdw1Ys4CYWmd9ZUA2/ECCm2x02LkQkUxuFmIo5SE8u6sLEJ9R3zJK8LNkH7x4wIXSNQI2y3bHFskqpt6zuL3rF/MREy0Kxy9K0LbN8qSpMurVTvxkWsApSXMl0UnjkqahwGSt/BWuDkSYw1ntE8Yux7G7/OZVOjFFQBwdw4c0qCb8QcAVZJ47eovBs9VTwOdfvfQ5Pp4T6F13ypT9Ht6RVxYcHNDC3evVU3qprJfg9eDQEc8VR4eeb++dwwqsf2JW7KlWtI4yGyCZv6dIUwv6kPicPU+ZlOcdPQM9n79aF2rA=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700016)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: GY8cLNQenVaBfB96d8/tma9rYIdCCDa4GCs2csO9adyk7Z9Nd7fyVgsSe2Wk7lp2CcoVvqZhT5tTlma7Tkjfk+zjI+9FzPuLcCSDwbeLD31eQejCmDmRIJKP8s0n5vskUDy0cSixCX3/PXy2Ml0PUaji2kWP0KQLyXzziWWy+YeSilURmpbQ5/Vv3uMCh3nwR4/J50ZgCjXkMO7qiTj27soaElXFNESYO8KbJ8t4BlexG/ETGYKAbyO7A8O9YpbjjEWjWqg+1r21TbhAMt27Tq0qp7NF+VP9UKBQpoq4BCgkKYqg9f3BYvOBAJvZKk3C27JMhsqtvUm6atyk64ucmuZF6fwSOe1Y6Ygem7tIyKLXxGdMpXEWzz7e5YPcTqG7fldG0wsn+oRfK2Oj3VATGPmea9uxCIElpwlx7LpCGVkCQt+LP/AZjils5LqOZkrw
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 09:56:14.3609
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc8b4ada-c55d-4b6a-f2fe-08decb8d80cb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4293
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_025623_380232_43789B12 
X-CRM114-Status: GOOD (  15.02  )
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
 drivers/i3c/master.c | 51 ++++++++++++++++++++++++++++++++++----------
 1 file changed, 40 insertions(+), 11 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 557332d93257..bcc9c2d29c34 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1963,8 +1963,17 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
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
 			device_set_node(&desc->dev->dev,
@@ -2357,8 +2366,18 @@ static void i3c_master_attach_boardinfo(struct i3c_dev_desc *i3cdev)
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
@@ -2372,8 +2391,12 @@ i3c_master_search_i3c_dev_duplicate(struct i3c_dev_desc *refdev)
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
 
@@ -2804,9 +2827,15 @@ i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
 
 	boardinfo->pid = ((u64)reg[1] << 32) | reg[2];
 
-	if ((boardinfo->pid & GENMASK_ULL(63, 48)) ||
-	    I3C_PID_RND_LOWER_32BITS(boardinfo->pid))
-		return -EINVAL;
+	/* For SETAASA devices, validate the static address instead of PID */
+	if (boardinfo->static_addr_method & I3C_ADDR_METHOD_SETAASA) {
+		if (!boardinfo->static_addr)
+			return -EINVAL;
+	} else {
+		if ((boardinfo->pid & GENMASK_ULL(63, 48)) ||
+		    I3C_PID_RND_LOWER_32BITS(boardinfo->pid))
+			return -EINVAL;
+	}
 
 	boardinfo->init_dyn_addr = init_dyn_addr;
 	boardinfo->fwnode = fwnode_handle_get(fwnode);
@@ -2829,10 +2858,10 @@ static int i3c_master_add_of_dev(struct i3c_master_controller *master,
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
