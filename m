Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A9DD2E01A
	for <linux-i3c@archiver.kernel.org>; Wed, 23 Oct 2024 05:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3isLz7MqROlG4SZ0tXp84UgMRiN9qDKdEc15gMvVHq0=; b=Jd/ZM+VqmC8c4u
	OfOG7Ta+7+UOrjfeYvg3Cu1+lNCBNWZw73ANLpGAc3gYibM7ff/z/lE3rBT3lYno1PBa0iy47EBFd
	5e4cst3g5sxRKxEfy7ulE6X4b6Jxklqg/UXcz58p/ppRzYNEWhuhQ9HauWfNINmW5LBCCgwT4sv7s
	442xXMdDuN6FVgONKzjHh/HAJHIVAhDxDS3myr4MA6lKoRRjcjoVRasklP9ggC5abnk8Uzr3nUcOj
	QQ2BAYor+h8AS+KrLTG9guKBlSL2cKx22FWG3EGkVxzhLVeRw9LccXhOM9SdRs0Fa2GXED02vmPqf
	2WL5BFJtbW2nLvTrLqjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3UIZ-0000000D7DM-1NoH;
	Wed, 23 Oct 2024 05:52:47 +0000
Received: from mail-mw2nam12on20601.outbound.protection.outlook.com ([2a01:111:f403:200a::601] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3UHu-0000000D704-34Cp
	for linux-i3c@lists.infradead.org;
	Wed, 23 Oct 2024 05:52:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W3iokkdk5kbZ/+WoBdc4CGWLAIyKRomj0rVe/98sQBgwJhtwQWEjYa40iAiprvCMfg4TPXWJP6djDgV969nPfsDxJAe9uevnEQQ5Q0IVZs7RhkkCcRJ6LTPIYyAwWCePDk6JOMCfQQU6Zebg9Rscbp3whNFFztcMvJGbwozSnGAI5zTjqTD+Y1m0B3shMKPysi3+0xb6Sj5flClrT0NfNSCtvJjrXnutultpvQe/PzsUyuW3q5ltuBSyKIlEJRWe1GCgFzI9wyNbIAZMBt2r4ebddGLuWLAP2otnH/v4fAHzMs9GTsm1JxmpWjUOaURWq4HhenPesZJJaD/t8BqJWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qMkF1sZQBYelH7y8Q/FMo+sKp9l4Kok+UrdyQTkkKc8=;
 b=v4l1Mc2oR2tAKUTFTTQtpy52GzcgjtLRY3eoVuhWKg/3PWEzZVSgaxSafLa+s3hQveqeeR3n7YHgwC06WfYEih4AMBVcGgWfBL+gqY7pG9u2AqBO+PXmW1YC7oYrhlVdCLXdvdCI4TborLu08rnXljYlJroZR8memHH+Tpeg9g+LE7wEnaCbbCtSD7qHr+5SivWtoW80prSljK+a400juCFMrlyA+D4lh++iv1FnWvn/0eBy8TOVSZsOV1WevIBCOI3EtOiBDE1Aeehr/KHiFD/tZ1G6fh1frx4eGsbiW6gFztO6jhYZD5FSOlat4LfTEXHyRsCCptHlcKKEHVf1uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qMkF1sZQBYelH7y8Q/FMo+sKp9l4Kok+UrdyQTkkKc8=;
 b=Bm1d+ngX7DA4htau4nSXitf5D5wcKGnKORadttaxXXqys1kLxeWLKURKSavp89rWYPSAldMc6rXmY1cX/HMBObMP35UZJYckAU49l7fYZc36w/4+/S77My9l18qVcsuHDogRR7E6XgvOFAUIu5wUvy2jEj66bFgqWYZf7ODTs0g=
Received: from DS7P220CA0068.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:224::23) by
 SJ2PR12MB7822.namprd12.prod.outlook.com (2603:10b6:a03:4ca::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.27; Wed, 23 Oct
 2024 05:52:01 +0000
Received: from CY4PEPF0000E9DA.namprd05.prod.outlook.com
 (2603:10b6:8:224:cafe::93) by DS7P220CA0068.outlook.office365.com
 (2603:10b6:8:224::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16 via Frontend
 Transport; Wed, 23 Oct 2024 05:52:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9DA.mail.protection.outlook.com (10.167.241.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Wed, 23 Oct 2024 05:52:00 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Oct
 2024 00:51:57 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jarkko Nikula
	<jarkko.nikula@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 5/6] i3c: master: Add support for SETAASA CCC
Date: Wed, 23 Oct 2024 11:21:17 +0530
Message-ID: <20241023055118.1400286-6-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241023055118.1400286-1-Shyam-sundar.S-k@amd.com>
References: <20241023055118.1400286-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DA:EE_|SJ2PR12MB7822:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cc4cf09-483f-444f-3ec9-08dcf326cfeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uiNh80Chn8Fu+ilDmJdWCiNlUAC3LxXxb1dcjFLsjRgMw2s0gt5fXJAjw9+j?=
 =?us-ascii?Q?GrCG+Nif38PA14d+0TkGZ1TSK//b2iy/VZYKp8858G9bmxDUk9Q8v72TnoMj?=
 =?us-ascii?Q?kM9jLTajIp5xlrUdMKoi6t+L9bPi0DEMZgbikJPI+FIW73f7RPY/9ucK00Qz?=
 =?us-ascii?Q?8R70czDanxGWGocl6yCjqJG5iNv4LY5dey05V4YIZbD2McMKMiYDHrYdOY0L?=
 =?us-ascii?Q?ysyZX0XPaHyc5uHn31oizGXsi+G5sgnaO3/gTLevnvitQEwvdoRo/xXiEQUN?=
 =?us-ascii?Q?ie9vtpMzSuR44XuNd3MVIXF7Ze4/IS+2Mr82B75TT+hkUWRGp+MvVaZluNQ7?=
 =?us-ascii?Q?+TIAWtmQyd+jiLLfxe7uGD5BLYj/KFI0XhF9mmZJFOUFWlBPJUStJ0ChiIyC?=
 =?us-ascii?Q?ixnihF0plUclv3crQHafQ9xO4wLOEYJp2YqcTu5qZIvT7k7mn/R6Ihk0cHLJ?=
 =?us-ascii?Q?MJbbiVAmAbE1gyi/ovQGOjvx6Vw2W6TLdFQGodoFCH6SRMEntk3b6TOaoTrK?=
 =?us-ascii?Q?kD5JXG1vqmCd+RfVudA4/HyCvN37N3r5UMjGECCvF8Jhn8SAncXZ3JLdvB9O?=
 =?us-ascii?Q?MXJSeW0tfoRVaplPCy+/6ROx8BIvC7fM7rzXsQ4uy2D/kzYIoMzcXtydkqnZ?=
 =?us-ascii?Q?Vuyn0vnnAgJ0JXLNA6v5LJvI8WscQZoMnqRiHsT6YvJdh3hfmdoMTyDXOU4D?=
 =?us-ascii?Q?UUY8sjTEpnBrmGahyDw4za1BTzOHN4wXW6LvPI7NBeEn5yJRdk7USHREpCMc?=
 =?us-ascii?Q?5adW/1d1cVuTpl/qeS2qVudiCWhJwI8h//BRExZ6oM6rgNSKpDpqafYdUOiq?=
 =?us-ascii?Q?DdOntsvA9QMX9Vxh0wuvWuzYRNyXvMQl0QYCa+A12WHPCLHGPNF77tTuQ/Nm?=
 =?us-ascii?Q?AlyHdaIOQ08BmpwLGNtEY0O2dcPCeuaHeG1EdrWdk77bQs/iC0UgwA1zNY2w?=
 =?us-ascii?Q?NNWseQzzQeYQFF+g17Abkqbxvxmxm3AWt8X2FbZYOgJSxVVPxPMmbmnD+Nwr?=
 =?us-ascii?Q?fjJv0lZ1oLsdgKNoSGaKr3i4WaaX/eG58wsWbIZuKBM2d7nvNIWwLol2LrgL?=
 =?us-ascii?Q?jbRskkre/S7Cq6tlZB9YzSLUG9VhDTzm7rrY6jFASLKWvWjxYNclLn5/gCTc?=
 =?us-ascii?Q?cj2k4AxIQhXh3WCKRneftNpZ0VqiYZwV7VvaoAZPdO+awtS91W28IRUkVUL1?=
 =?us-ascii?Q?0MLg/7WS52EZMhAx1mltVnCX99rQPAYepZb8VUzv1+xptfEKDOLaOx4PfHVx?=
 =?us-ascii?Q?EdQeauOrgeQk+sn5FXPJFXBYdZtLOIjE90OXE3eBy2ZA8fTbeMP7xr8k9Jqw?=
 =?us-ascii?Q?Gw5Vnhky1/qttLK0QVcnzYCoJizTutMjabnPg466qAkrtWyzsR4tYEk8oq7a?=
 =?us-ascii?Q?0E8iqyQ=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 05:52:00.0500
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cc4cf09-483f-444f-3ec9-08dcf326cfeb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9DA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7822
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_225206_835130_B0A2BA44 
X-CRM114-Status: GOOD (  17.50  )
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
index ba6f17cb8aa6..1596efd6d82a 100644
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
@@ -2311,6 +2337,10 @@ static int i3c_acpi_configure_master(struct i3c_master_controller *master)
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
index f683e2a398ad..90a43209e55e 100644
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
