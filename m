Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F0FAD5E147
	for <linux-i3c@archiver.kernel.org>; Fri,  8 Nov 2024 07:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e3V0X3PrNfh+F5UDvXZRmvE7FI1TyQbJX09z6T+qHcg=; b=iR+HeZijWQBnMc
	TaV4jCiwMI9bxmh0JiNMSbZwqGNptI0fhxbcuW3g0rCrBE+BVdjRh3gVY2Fj1h8um+S12CdWSf678
	wy/p9/vECfjAJI0skns1JdftYVRhuxzAdSlmbVcXtgC7UaTdmGOUw9hA+lHprmF53jNAOoVG2Ebdn
	tbAOZZPmh9SdsChpUwBc4ocqj2eHQ9PtsJMHMX71srHeG2NOj4vP1N1ONWDa7QFgbIokQuHH7AcQP
	ztpviPQpOdoAD3PyBro/m+D6YFYmKi6YYU+K7nVB2q50+aQ0qvIXs1BpmPnGDXZRI0w4Uxmw5/jQV
	qYNX2iyXKhY7iiS/caRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9JVa-00000009d26-4093;
	Fri, 08 Nov 2024 07:34:18 +0000
Received: from mail-dm6nam11on2061f.outbound.protection.outlook.com ([2a01:111:f403:2415::61f] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9JVW-00000009czP-3uXK
	for linux-i3c@lists.infradead.org;
	Fri, 08 Nov 2024 07:34:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PGM1vIZKiYj2DCz3mQUVMhGofI6waQ9HbtVQ1tvrIDfODxb9rSVNjvMhzGUWXyfLIu4Qa1T2sNlhv7RX5B0DKp1oqkmk3j3dzT7LTWB2Im7k2iAZMcuROtaPBWYkIS6/QNnkmwYDXMJd4y+9VRerO595h8zGkLAoL4Wo9FVCymsBxEuggxcMXkgjhyaw/AetH3LR7lHHBQy9yXtHCqKHDWw78phhcj4mny2+P07XSxWZ8TV6K0Sx0AWe+vCHzCYuUnJq3muNxFqX9WN6xS1WY0NoiAefajQx3WoZUjXmLYvYS318Lb/wKp00/PUXTPivg0rLD5kGMjSd4YFVa2Dpng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sRXYIMj9DXO5K83mxgz8Uk7g7yYrTUHeXmkGzndIkcE=;
 b=v1ziww842Owd45hDIi6W7OA1DUwS4HE6WysP3jsoqcxn59UpsI5VQDAiSrpSDQ1TosaBTgZC5artcQR/im4X2BF2EhRbyWeXEjHAWddV5F57w7U9y8O9GvPe78lV4uONIkidKKjqCmc24+CG70uemlvv5h4yd7GtvE80n7cvakS9IOLm8vv8D/75OziS/ENgzqzc4zwp7g+vEPRuXAgmVMDu2BwUo3fZINnkI3fGGypEFl563OkaEYliqLe+qg2Ec6CD9/pbF8+bOiNItdr5zW8g/vxxHZ0HPYznlMUyRhcg2vYw1XcpTf8dkwBPf9PMMTuKO5fBwnv4FwizRgCqxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sRXYIMj9DXO5K83mxgz8Uk7g7yYrTUHeXmkGzndIkcE=;
 b=PEpYro58GuWF7KyU/5SdMjwCuNoVUHQJ7ncrGBnUueZl8bAxC1PrGS+xDpWgdTInetZm6lyAQZ4QeVwDpKA6evKPrkK/F0ZixLBkwkU/1OmKEG0UbQ06lUjtuO7vh3HLvW+z6no2MwF1fLAmKMoqKM193d61WHDxqJMl4gbgDME=
Received: from MN2PR01CA0060.prod.exchangelabs.com (2603:10b6:208:23f::29) by
 SN7PR12MB7228.namprd12.prod.outlook.com (2603:10b6:806:2ab::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8114.30; Fri, 8 Nov 2024 07:34:10 +0000
Received: from BN3PEPF0000B06B.namprd21.prod.outlook.com
 (2603:10b6:208:23f:cafe::4d) by MN2PR01CA0060.outlook.office365.com
 (2603:10b6:208:23f::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20 via Frontend
 Transport; Fri, 8 Nov 2024 07:34:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B06B.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.0 via Frontend Transport; Fri, 8 Nov 2024 07:34:08 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 8 Nov
 2024 01:34:04 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jarkko Nikula
	<jarkko.nikula@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	<linux-acpi@vger.kernel.org>
Subject: [PATCH v3 2/5] i3c: master: Add ACPI support to i3c subsystem
Date: Fri, 8 Nov 2024 13:03:20 +0530
Message-ID: <20241108073323.523805-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241108073323.523805-1-Shyam-sundar.S-k@amd.com>
References: <20241108073323.523805-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06B:EE_|SN7PR12MB7228:EE_
X-MS-Office365-Filtering-Correlation-Id: 51b1944a-ecea-46e2-688e-08dcffc7bb3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Bxd6FqmmyKLm8wosaBInKbzEtiiYsFRy49D+ls8cVP6/elb1kDqcjudgHDPc?=
 =?us-ascii?Q?eSZPRFity9gvPRFYKtos7bhDa9gHUX6r/6BMk7gM2K7MznH5I+zeKiCW01IW?=
 =?us-ascii?Q?8T0zUrg/z9pkbtH37p9xMWgqUddhT91fnu1hGiucRNVTJ1kMwU9+lwmGofRC?=
 =?us-ascii?Q?Zz8swlCdAMqUIl5HY80RBGyKuf/c/+7Z2YY2SfbrgNitGKaMj2omPZjx/Ixq?=
 =?us-ascii?Q?Dy5c2wO8wukebfYL6SIy81bbLzgaxg6RpdjZpAu7jGO3YsR5LnDSESWrdU/G?=
 =?us-ascii?Q?vNJdyo36akZUsdlnfa56r1Z4Sq28fz21EAy8X99Amo5N2I3R8D5Oj966gW19?=
 =?us-ascii?Q?PGXnCNHkzua2i6wrawvhDQCEoWvUrPEkiXXGG0GOeOTEocO0wE1wZuP/ODnw?=
 =?us-ascii?Q?kgeVIZjzgba9Hh4RGr6Tcblt1oz18/jzPUWUuglByR4vbQrZffaCUQpLfsa9?=
 =?us-ascii?Q?gWUkX8FNHyXOLs7S09MEMaTXw6YOBPQcgECh1nH4ErTO+u1L7TTqkB1nuWbs?=
 =?us-ascii?Q?ahhidPpkGBY5HfwVgYA6K8tHEuVADxFo6/qbjqvSlJxia9xv+zq5JQgUzIu6?=
 =?us-ascii?Q?eCc2Dp2ez2SQ4Mxyv46+zwwaByjzl/p4DBx4xUCqVzYA3YcnHnaldgzVpMog?=
 =?us-ascii?Q?VcVFWPJg+7INDBtpSoo0ae5aV/veU7i2lFjUg7poOYN9R9zvvARC9Mdev6Aa?=
 =?us-ascii?Q?AQtixYBfEYJg/GHmcc9h4qAOHF5URtI0Q2m/R85Ib1g4+10Tp1cFTlAZOl7q?=
 =?us-ascii?Q?emH/kmhNZEYaOY/1tDkzCqz5zHKjklH4ncxe5zeNIKfJDsbZJOklrAEmjpon?=
 =?us-ascii?Q?f0DnQm7nJparaItObv5IcnwBpzjHmE+xqYTNeg00VxkBfw0zDvWoTsOI6gUM?=
 =?us-ascii?Q?VWvjLe3DfGxKyza5GVOEGgWdSW5jlvf++wQ+IBRYOLLxPZFPMmkweB/u8e7W?=
 =?us-ascii?Q?/9IAwpqX1AqQsOpmPqKOd5iKmcxxk5K8NB1mhCUILoptbJMPWSpAJoq3P0ME?=
 =?us-ascii?Q?Tnk6v+vzWM3KiCdB4WLg+WV9ZcBqTMP/9rhXBrzwlCWoj761zMnwk38Wt1hf?=
 =?us-ascii?Q?rMDICSWYDM+bDc3hTPZJBVfc7djqyv5wUt0+cT1+dE69l0+rvI6YT0D4Ku7W?=
 =?us-ascii?Q?fXnVMiHUWYiu+IU4CFvU/KskYcMl7yRVGe5NXsWtF+MY/MYH2HtGK7HAaFps?=
 =?us-ascii?Q?N8FyuFqgoBUfxn9ercJH9uX8AjLGPgm91dD2u3rfP4LsVZE7xPJgH98BZqO5?=
 =?us-ascii?Q?303LYNmigKpDeqA2xdX1q+OQ3+kte+CMYnbqiFRbTAeXAOriDPGLWBGLYduv?=
 =?us-ascii?Q?NTQl6iPECb2expq053AJXjPPf+/zHdDPs1hThIyRsiPT43Cfvh/mmcuvUntk?=
 =?us-ascii?Q?z0TvTOEX1iXk2R5YoJTtSMwqfw9p7qmf6TXZa+SfvUJN/sBAmg=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 07:34:08.3884
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51b1944a-ecea-46e2-688e-08dcffc7bb3a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B06B.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7228
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_233415_001530_32B9D744 
X-CRM114-Status: GOOD (  20.85  )
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

As of now, the I3C subsystem only has ARM-specific initialization, and
there is no corresponding ACPI plumbing present. To address this, ACPI
support needs to be added to both the I3C core and DW driver.

Add support to get the ACPI handle from the _HID probed and parse the apci
object to retrieve the slave information from BIOS.

Based on the acpi object information propogated via BIOS, build the i3c
board information so that the same information can be used across the
driver to handle the slave requests.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
Cc: linux-acpi@vger.kernel.org

 drivers/i3c/internals.h            |  3 ++
 drivers/i3c/master.c               | 84 ++++++++++++++++++++++++++++++
 drivers/i3c/master/dw-i3c-master.c |  7 +++
 include/linux/i3c/master.h         |  1 +
 4 files changed, 95 insertions(+)

diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
index 433f6088b7ce..178bc0ebe6b6 100644
--- a/drivers/i3c/internals.h
+++ b/drivers/i3c/internals.h
@@ -10,6 +10,9 @@
 
 #include <linux/i3c/master.h>
 
+#define I3C_GET_PID		0x08
+#define I3C_GET_ADDR		0x7F
+
 void i3c_bus_normaluse_lock(struct i3c_bus *bus);
 void i3c_bus_normaluse_unlock(struct i3c_bus *bus);
 
diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 6f3eb710a75d..0ceef2aa9161 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2251,6 +2251,84 @@ static int of_i3c_master_add_dev(struct i3c_master_controller *master,
 	return ret;
 }
 
+#if IS_ENABLED(CONFIG_ACPI)
+static int i3c_acpi_configure_master(struct i3c_master_controller *master)
+{
+	struct acpi_buffer buf = {ACPI_ALLOCATE_BUFFER, NULL};
+	enum i3c_addr_slot_status addrstatus;
+	struct i3c_dev_boardinfo *boardinfo;
+	struct device *dev = &master->dev;
+	struct fwnode_handle *fwnode;
+	struct acpi_device *adev;
+	u32 slv_addr, num_dev;
+	acpi_status status;
+	u64 val;
+
+	status = acpi_evaluate_object_typed(master->ahandle, "_DSD", NULL, &buf, ACPI_TYPE_PACKAGE);
+	if (ACPI_FAILURE(status)) {
+		dev_err(&master->dev, "Error reading _DSD:%s\n", acpi_format_exception(status));
+		return -ENODEV;
+	}
+
+	num_dev = device_get_child_node_count(dev);
+	if (!num_dev) {
+		dev_err(&master->dev, "Error: no child node present\n");
+		return -EINVAL;
+	}
+
+	device_for_each_child_node(dev, fwnode) {
+		adev = to_acpi_device_node(fwnode);
+		if (!adev)
+			return -ENODEV;
+
+		status = acpi_evaluate_integer(adev->handle, "_ADR", NULL, &val);
+		if (ACPI_FAILURE(status)) {
+			dev_err(&master->dev, "Error: eval _ADR failed\n");
+			return -EINVAL;
+		}
+		slv_addr = val & I3C_GET_ADDR;
+
+		boardinfo = devm_kzalloc(dev, sizeof(*boardinfo), GFP_KERNEL);
+		if (!boardinfo)
+			return -ENOMEM;
+
+		if (slv_addr) {
+			if (slv_addr > I3C_MAX_ADDR)
+				return -EINVAL;
+
+			addrstatus = i3c_bus_get_addr_slot_status(&master->bus, slv_addr);
+			if (addrstatus != I3C_ADDR_SLOT_FREE)
+				return -EINVAL;
+		}
+
+		boardinfo->static_addr = slv_addr;
+		if (boardinfo->static_addr > I3C_MAX_ADDR)
+			return -EINVAL;
+
+		addrstatus = i3c_bus_get_addr_slot_status(&master->bus,	boardinfo->static_addr);
+		if (addrstatus != I3C_ADDR_SLOT_FREE)
+			return -EINVAL;
+
+		boardinfo->pid = val >> I3C_GET_PID;
+		if ((boardinfo->pid & GENMASK_ULL(63, 48)) ||
+		    I3C_PID_RND_LOWER_32BITS(boardinfo->pid))
+			return -EINVAL;
+
+		/*
+		 * According to the specification, SETDASA is not supported for DIMM slaves
+		 * during device discovery. Therefore, BIOS will populate same initial
+		 * dynamic address as the static address.
+		 */
+		boardinfo->init_dyn_addr = boardinfo->static_addr;
+		list_add_tail(&boardinfo->node, &master->boardinfo.i3c);
+	}
+
+	return 0;
+}
+#else
+static int i3c_acpi_configure_master(struct i3c_master_controller *master) { return 0; }
+#endif
+
 static int of_populate_i3c_bus(struct i3c_master_controller *master)
 {
 	struct device *dev = &master->dev;
@@ -2771,6 +2849,12 @@ int i3c_master_register(struct i3c_master_controller *master,
 	master->dev.coherent_dma_mask = parent->coherent_dma_mask;
 	master->dev.dma_parms = parent->dma_parms;
 
+	if (has_acpi_companion(master->dev.parent)) {
+		ret = i3c_acpi_configure_master(master);
+		if (ret < 0)
+			return ret;
+	}
+
 	ret = of_populate_i3c_bus(master);
 	if (ret)
 		goto err_put_dev;
diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 1a7c300b6d45..d44b771d03e1 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1602,6 +1602,13 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 	master->maxdevs = ret >> 16;
 	master->free_pos = GENMASK(master->maxdevs - 1, 0);
 
+#if IS_ENABLED(CONFIG_ACPI)
+	ACPI_COMPANION_SET(&master->base.dev, ACPI_COMPANION(&pdev->dev));
+	master->base.ahandle = acpi_device_handle(ACPI_COMPANION(&pdev->dev));
+	if (!master->base.ahandle)
+		dev_err(&pdev->dev, "Failed to get acpi device handle\n");
+#endif
+
 	INIT_WORK(&master->hj_work, dw_i3c_hj_work);
 	ret = i3c_master_register(&master->base, &pdev->dev,
 				  &dw_mipi_i3c_ops, false);
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index 2a1ed05d5782..367faf7c4bf3 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -523,6 +523,7 @@ struct i3c_master_controller {
 	} boardinfo;
 	struct i3c_bus bus;
 	struct workqueue_struct *wq;
+	acpi_handle ahandle;
 };
 
 /**
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
