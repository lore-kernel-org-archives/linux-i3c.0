Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A7AD374A8
	for <linux-i3c@archiver.kernel.org>; Thu, 17 Oct 2024 15:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZXUce/ZJyXzl993eNmHsMHPebBpB0H/OAuabmuVE8w4=; b=uWGx3ih6X9L05n
	90Zkz0D3xHyGo/9GaCbLUtjWc6cp64EDpr1YYyGS53tQO1EIi1FatP/Y7BOx2wjwb8kV72AAr8hZ3
	/NRKpiYh/+L3a/depK0cQdS5zlF1X5vvCjFcQEbvPPntWhQbIhe3wtygMcA8TB6WbLkOP+9hQuVaP
	125nhSX06Di31xdRWrw949kZ2hen52gmpsoerKBxspT4Pp+5wyUKmwuiX9aqZQk3azzPT/OmM7OoL
	pjsi4jtwDAN8UgRHtNZv/ixiK+88ztJGfAsJCrWpMqt4+Hk8mZA112UKZArVJx7dW7VdaDQmEh3BI
	f4h+O9tz+TbgtHlRN9HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1S30-0000000FDM6-03gg;
	Thu, 17 Oct 2024 15:04:18 +0000
Received: from mail-bn8nam12on20600.outbound.protection.outlook.com ([2a01:111:f403:2418::600] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1S2t-0000000FDGb-0QnG
	for linux-i3c@lists.infradead.org;
	Thu, 17 Oct 2024 15:04:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X8Af2WQgDXL48NniQnHU4Spc9TviFiE1PGsZpCJPqhjzufxJursFVi8Lf/sfenzalHKJui2w8ThKxVQEeU+/ed1Oqg8IAMK7R7pUsIzx7Q9EJZtd/Kg01ZToOTdyQJZd3a8cKaX1fwLD1d9TXwpoHaEZNKDAq5+DX5TPMRX38k4v4AbaLvOS50r5+/rgPdNHK64Bp0eBdu+gqAttqE65T1KrSkclplgsezy3dNRw0CUXbgqhkwY1G5snr4xso5JVcGYL2zEjHIgX9s8DDeEjqCIW5Y8eDJvhF/e4BnXsF36wnb5gXORPVwMiKrSLvjE8tEMW2Sg7EoH1dM8vBnEYUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6JP+lLh+VBj7U/HVW4Zwu26Phb/E8s9kqAACnP2rIZ4=;
 b=i7dV/6ylfMkeAKDEVD8lzE+bsh209mFXriYXclAEa1rWvXAK0OEhNWFV67epkXWs5DTt8keEKUhg/D1XfHhUQ6khgQcbmTHcRWTcGpAXbe53r2IPyfmVHumAbJpd1BURvlgZlEuiOcX1quPD6LNNcf14poqSxrDU86qyHSAojG2Fe79Fgc2vXpcci5J2Ll01O2zjkh4AohbpY7YiA3tbkNRPevcMK8mkwC0nOUerEp6W2yvgRA9qXS/Uu04nBaiikqASXb6SsI2W4ZYVZwWOo7MQld+bGme9Vf/2a+kBSTAf2SYrLVIdl2ttEx80YsZaT6iooasWAopu0fIyP/kSEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6JP+lLh+VBj7U/HVW4Zwu26Phb/E8s9kqAACnP2rIZ4=;
 b=jEOk9lmlvW5fXwQ8nCGWDA0DcHlt2RbYYxvfhjtpBoi/Vcqb28TThohoQhiM0w52HnxpIgJ2S6DFUyuX6VwygnzJEAwoVYnmAOab1XHpSpDiyYdpyyU60KnJcrRsY818cOyKFV1BXBmfEwhCu5M+jpSY+Z1R44ZTqEA3v12mNoI=
Received: from BN0PR04CA0145.namprd04.prod.outlook.com (2603:10b6:408:ed::30)
 by SJ0PR12MB8091.namprd12.prod.outlook.com (2603:10b6:a03:4d5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Thu, 17 Oct
 2024 15:04:05 +0000
Received: from BN1PEPF0000468A.namprd05.prod.outlook.com
 (2603:10b6:408:ed:cafe::f0) by BN0PR04CA0145.outlook.office365.com
 (2603:10b6:408:ed::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.19 via Frontend
 Transport; Thu, 17 Oct 2024 15:04:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF0000468A.mail.protection.outlook.com (10.167.243.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8069.17 via Frontend Transport; Thu, 17 Oct 2024 15:04:05 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Oct
 2024 10:04:02 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jarkko Nikula
	<jarkko.nikula@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 5/6] i3c: master: Add support for SETAASA CCC
Date: Thu, 17 Oct 2024 20:33:29 +0530
Message-ID: <20241017150330.3035568-6-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241017150330.3035568-1-Shyam-sundar.S-k@amd.com>
References: <20241017150330.3035568-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468A:EE_|SJ0PR12MB8091:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ae3b502-e9ba-4fd0-f133-08dceebcf1b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NmnhdIF9AKr5Qs37HaKJvykawizInI3htbjFDTjFmjSvbbUmiEso1bhAzN1X?=
 =?us-ascii?Q?g7rg1JsYPqshsC/RIx0yXEYpm/9MZKJZVxR1JIFcJB54FlHSDQL9XtAiVg5/?=
 =?us-ascii?Q?AXk1h/tpTRcXPiz3m4fjGhb3X2uWtNWRR+MNHfgPs9QWPTYgoDCcDYoay1RB?=
 =?us-ascii?Q?Jwo4upBkt90geerZD6tIVo5DYk93EYEwP77oXJgti903PFXDWFIsfR1Wk3mb?=
 =?us-ascii?Q?o6Wcrd4rXqZ/mmZfmQCGCKdB7pLNu0mY8nFXR9dOLZ6rUwHfBvaGefINiyAj?=
 =?us-ascii?Q?+30naNDo7+jD82JixG0/QTCj5+jHvQpMCXVT5EBhwYNXi9QODuZq/F58hFgQ?=
 =?us-ascii?Q?ZKMlIX5cuMWxfKRPFw8C7Au/KdCealYhnjNZRFlMGCShMPSh3ZNonHEKZr5R?=
 =?us-ascii?Q?irs7uM1awrCn1VA1XvuMz4Ksf0x3Pn0VzHB/os1Lhrunphpg2WC6uvKHoc2A?=
 =?us-ascii?Q?FjyFfkWFfRfWCD+bFTUNsWG0Akp3Eg18UmLKd9pxcZwczC69bqlMGidcwsxF?=
 =?us-ascii?Q?FlMEcDOvOTOqqe17tfdwnJcv/CXkGHFaRiAcE0eg91F1kzeOayIcWG68ibeV?=
 =?us-ascii?Q?qOJBhGzCkFE0YKO2M9PDXdoK5D84hJqrWLrw9EcBZ9tNx9TGg1WFGhHAaV8I?=
 =?us-ascii?Q?akiBfPcoziNbUAQKSusHP6rLfyh3Ck5ckCLrbszKFSahxjuilwEhgxNgJLOa?=
 =?us-ascii?Q?Ddg+9QaEfBwXphghaO0WjmcRCpkIihU1MtruAC7zAJNjUXOqCGOxfwELxtu0?=
 =?us-ascii?Q?THx87t6JDx018/pT8v4b3z4Ytjyj2FBpZ1JXZmKNB7AhuclCqiWvG+wkyc06?=
 =?us-ascii?Q?HT6H/hyGq+kjWEAJm8X3DblTld01z+YRbRnzmL1oVZwmCGYdeDHh7nl98oW0?=
 =?us-ascii?Q?H8EJ229EHYLqkZnLuV6i6O4sKlKIBKLhU+YUf+eXw36aDE28nE+zgn6KqfzA?=
 =?us-ascii?Q?AJ+C51muF5zO0aOvjf52ogSzOjgIVOAaUJhySdwRslmCSSVA2os3SFOOFkC6?=
 =?us-ascii?Q?ykIEMzr4OnpBkXReuUjur+/mcj6RyvTgr9LfoHkMrE8g2yRBjHOOuC3u5KvY?=
 =?us-ascii?Q?2nmiQL3mtezpMTgO3dzeTzTWXqMt4M0ccmEnfOJefBO29YD4CYEPynWkVFIs?=
 =?us-ascii?Q?iRW+sFKuIMV9jlAwNjHXYm0bFu2V4gcO77CP+5bP91urHWM4TzT7O3sKp5Up?=
 =?us-ascii?Q?9Nj39J3GlZGKdAUNzjd+3sdxH7IxrJDoHTjbaUGXYEHyiRmePgHVbXaSiEDH?=
 =?us-ascii?Q?33M/RtFxKlIzdoiujbAzKyxViCfaM8f0LUcXFMpJO0lNh4KU/eF/d1RqfqDI?=
 =?us-ascii?Q?3d9PrQv1Rm3p8RwMHhIxiSCC6jcUK7qJ/9tQLj3Ko8S7IODve6NNAtnH179o?=
 =?us-ascii?Q?vX+JzQE=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 15:04:05.5063
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ae3b502-e9ba-4fd0-f133-08dceebcf1b1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF0000468A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_080411_178569_B697B933 
X-CRM114-Status: GOOD (  16.72  )
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

I3C devices like DIMMs over SPD use SETAASA for bus discovery instead of
SETDASA. Add a new routine for I3C host controller drivers to use. If the
I3C slave on the bus is an SPD device, skip the regular DAA process.

According to the SPD spec[1], use SETAASA for bus discovery, and avoid
sending RSTDAA and DISEC, as they are considered illegal. Skip this entire
process if the slave is SPD-compliant, as indicated by the "jdec_spd" flag
from the BIOS.

[1] https://www.jedec.org/system/files/docs/JESD300-5B.01.pdf
(section 2.4 and 2.6.3)

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/i3c/master.c               | 32 +++++++++++++++++++++++++++++-
 drivers/i3c/master/dw-i3c-master.c |  1 +
 include/linux/i3c/ccc.h            |  1 +
 include/linux/i3c/master.h         |  1 +
 4 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 4f149519170e..0fe3e315d6cb 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1657,6 +1657,21 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
 	}
 }
 
+static int i3c_master_setaasa_locked(struct i3c_master_controller *master)
+{
+	struct i3c_ccc_cmd_dest dest;
+	struct i3c_ccc_cmd cmd;
+	int ret;
+
+	i3c_ccc_cmd_dest_init(&dest, I3C_BROADCAST_ADDR, 0);
+	i3c_ccc_cmd_init(&cmd, false, I3C_CCC_SETAASA, &dest, 1);
+
+	ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
+	i3c_ccc_cmd_dest_cleanup(&dest);
+
+	return ret;
+}
+
 static int i3c_master_add_spd_dev(struct i3c_master_controller *master,
 				  struct i3c_dev_boardinfo *boardinfo)
 {
@@ -1684,6 +1699,10 @@ static int i3c_master_add_spd_dev(struct i3c_master_controller *master,
 		i3cdev->info.pid = i3cdev->boardinfo->pid;
 		i3cdev->info.dyn_addr = i3cdev->boardinfo->init_dyn_addr;
 
+		ret = i3c_master_setaasa_locked(master);
+		if (ret)
+			goto err_free_dev;
+
 		i3c_bus_normaluse_lock(&master->bus);
 		i3c_master_register_new_i3c_devs(master);
 		i3c_bus_normaluse_unlock(&master->bus);
@@ -1907,7 +1926,14 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
 		goto err_bus_cleanup;
 	}
 
-	i3c_master_add_spd_dev(master, i3cboardinfo);
+	/*
+	 * If the I3C slave on the bus is SPD device, then do not follow the regular
+	 * DAA process. Also, as per SPD spec SETAASA is required for the bus discovery
+	 * and sending RSTDAA and DISEC is considered as illegal. So skip the entire process
+	 * if the jdec_spd flag has been identified from the BIOS.
+	 */
+	if (master->jdec_spd)
+		return i3c_master_add_spd_dev(master, i3cboardinfo);
 
 	if (master->ops->set_speed) {
 		ret = master->ops->set_speed(master, I3C_OPEN_DRAIN_SLOW_SPEED);
@@ -2310,6 +2336,10 @@ static int i3c_acpi_configure_master(struct i3c_master_controller *master)
 		return -ENODEV;
 	}
 
+	status = acpi_evaluate_object(master->ahandle, "_STR", NULL, NULL);
+	if (ACPI_SUCCESS(status))
+		master->jdec_spd = true;
+
 	num_dev = device_get_child_node_count(dev);
 	if (!num_dev) {
 		dev_err(&master->dev, "Error: no child node present\n");
diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 8d4583bc2113..8f452976dd7c 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -282,6 +282,7 @@ static bool dw_i3c_master_supports_ccc_cmd(struct i3c_master_controller *m,
 	case I3C_CCC_GETSTATUS:
 	case I3C_CCC_GETMXDS:
 	case I3C_CCC_GETHDRCAP:
+	case I3C_CCC_SETAASA:
 		return true;
 	default:
 		return false;
diff --git a/include/linux/i3c/ccc.h b/include/linux/i3c/ccc.h
index ad59a4ae60d1..a145d766ab6f 100644
--- a/include/linux/i3c/ccc.h
+++ b/include/linux/i3c/ccc.h
@@ -32,6 +32,7 @@
 #define I3C_CCC_DEFSLVS			I3C_CCC_ID(0x8, true)
 #define I3C_CCC_ENTTM			I3C_CCC_ID(0xb, true)
 #define I3C_CCC_ENTHDR(x)		I3C_CCC_ID(0x20 + (x), true)
+#define I3C_CCC_SETAASA			I3C_CCC_ID(0x29, true)
 
 /* Unicast-only commands */
 #define I3C_CCC_SETDASA			I3C_CCC_ID(0x7, false)
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index 367faf7c4bf3..cd8390d8b469 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -516,6 +516,7 @@ struct i3c_master_controller {
 	const struct i3c_master_controller_ops *ops;
 	unsigned int secondary : 1;
 	unsigned int init_done : 1;
+	unsigned int jdec_spd : 1;
 	unsigned int hotjoin: 1;
 	struct {
 		struct list_head i3c;
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
