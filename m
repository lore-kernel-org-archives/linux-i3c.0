Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D1B9D374A4
	for <linux-i3c@archiver.kernel.org>; Thu, 17 Oct 2024 15:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xYvS7pyQUcldhrJ8Cl11wguf/MM7njZDAmYTdvzR/qU=; b=SEDMRaZ6K4u/NB
	ayPDug5w2+5m3XYjzOGyBdt3gbrIhOopYpVdzdEXdiKCtsUJuYWH9LUgZt3XRN8ubDanbQTDpUsK0
	JEWXKPE7LVBP2gKvo5frkr6MmEJkSy4GhjweFKRrNVHR/WHvU+F2Ye6y+jgzb2N6XbG2zOa/nzJxY
	g9dc8MpEiGp/BR9rHkl25p6FGevwDVETTjPInHZTOweWsSr7pScUpHPF2biIovuwNb9x1PhMQr8bz
	1OnWDQHPt3FXnxQHGgyTfX6Vgehu0sDx2XVxGjMbyGrhkHAgD9/0w/WZP5m7b7ojdAxwcO0q3M2mm
	ARBvHDS+/E4V5hu5P68g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1S2z-0000000FDKl-01e3;
	Thu, 17 Oct 2024 15:04:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1S2x-0000000FDJI-2F21
	for linux-i3c@bombadil.infradead.org;
	Thu, 17 Oct 2024 15:04:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=fVBjuBGrxHvcx1b1cr3bkjVTxT31oAUSYIWliWUFSsk=; b=LKAzkFjXi+nAf8uABYIs4uPiIJ
	XgYUGArsvu9IVQ7upOlO5uRk3d1OfX+Dseh07vl/qr1Ni8JBcx1Pj/sv9BSJoNPIwdNAMreaYJO1Y
	/2jXwaczzzAMSzzZdgi7pEz8jWMPsvrOJwAjbYEMgRK03Kfylq3+1y1iQ4668jb1VjZBk5hTh0HW+
	5iBS6RUHHTegJ0sDE1+v3CIeySPcOU+WL11RJ428itGu2WzokW3Wxw597tyl/3OZ41gJHpgCsJ6Lh
	oj/k0/0Ol1khFRBOQZA63Icvh01MR3ZdLApdaQ7rox3rvTPvJt0qaLojL1N+Gwf+gJn11eDV33o2k
	L3gslWRw==;
Received: from mail-dm3nam02on20613.outbound.protection.outlook.com ([2a01:111:f403:2405::613] helo=NAM02-DM3-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1S2s-000000078JZ-1ECd
	for linux-i3c@lists.infradead.org;
	Thu, 17 Oct 2024 15:04:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ugme9+4fIvwis8eWcV2zzD/690LKg2tNvGXVZYsILWI4fJXJBnKYilqGzqM9aQjAzVAFpOqMlhbzUB7twgMsZAaqgRORR5uzPVxnI92Fu58Dkf1/jzAXq9y7Zq5chTnw7M3F9Y7KMAp79P0TfPHjp1PRtg3Fwy7zdE4dB+kiuWZxiiWg6KBebSkXyLEC7ByY0VMnDJMl21bPPgHUDt07RU7tvRsNa6QEZ/rnhYTXMBM8kqT5dBZwkdZsQPvx5QRJQUDMVhj69y39NJoxWydwRGkBzB8wnFI7eO3d7vZHSAmAgzcl01lTblah3mVjVfz7uUVIexPo3NyMLMzUkTebfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fVBjuBGrxHvcx1b1cr3bkjVTxT31oAUSYIWliWUFSsk=;
 b=FB4RlRa4sT6/euQJ8QAg2ba/RbLrpx/TjCkC3kD4JiFQL2tA6DTBt+0v1gpgGXtacbbTzUHvLqfp1E2eVm5LWOgdG9tAlgYMHWwP2J0DuJDKk/FBcjm18lM1joooc1D2tSAQTKFrpbOlS0P5JAsrdYkuYClT6iZ2t91dl7ccMyVOHkFmdpaZ1pl6ylNzlFy4lKM5/eIof1BvSL6MFJ0v8yeff+/2vD+19uwSMZzU2q8LrzIyWPb9udI1oxDijivZ3DBkZGlxyY3lwuC1qWmGWTWdMRCLt1n6MdYacg9XOVO6qc2fk3q7ghhXQpVoK07398cj5A8VgtkUwAqlao9QHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fVBjuBGrxHvcx1b1cr3bkjVTxT31oAUSYIWliWUFSsk=;
 b=0WkSF/yjDb7gHfwQ3wi0Z4n5s5D4Ns+qO/BTgA2HMf0AyXWMPQq1RgtGHdmb6T9S6h0U7IglxCGduDUAhf+cGeysMFwlry+vIO0RuTOygCg3qY3F0wgJdGCowjXK/Y8RC3AYirK1sFMtOcZTLNa74HxKPsGKgI92TYZHDzQLq3E=
Received: from BN9PR03CA0500.namprd03.prod.outlook.com (2603:10b6:408:130::25)
 by CYYPR12MB8856.namprd12.prod.outlook.com (2603:10b6:930:c0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.21; Thu, 17 Oct
 2024 15:04:01 +0000
Received: from BN1PEPF0000468E.namprd05.prod.outlook.com
 (2603:10b6:408:130:cafe::1c) by BN9PR03CA0500.outlook.office365.com
 (2603:10b6:408:130::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.19 via Frontend
 Transport; Thu, 17 Oct 2024 15:04:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF0000468E.mail.protection.outlook.com (10.167.243.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8069.17 via Frontend Transport; Thu, 17 Oct 2024 15:04:00 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Oct
 2024 10:03:58 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jarkko Nikula
	<jarkko.nikula@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 3/6] i3c: master: Add ACPI support to i3c subsystem
Date: Thu, 17 Oct 2024 20:33:27 +0530
Message-ID: <20241017150330.3035568-4-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241017150330.3035568-1-Shyam-sundar.S-k@amd.com>
References: <20241017150330.3035568-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468E:EE_|CYYPR12MB8856:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c1c2469-d2ad-4739-8024-08dceebceec9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EduaW7kp8q4qcKoU2hjezDXB0/F2YQcqil8kXq3hHZvgsdl5IQTe8PpYSQMG?=
 =?us-ascii?Q?PNggDcQ18QHmHoU3tl4xKjLDxR+kuQ9Bb7iGH6JQHp8dBLICnxAdFPa8eWCD?=
 =?us-ascii?Q?IhPbW9kx1xaQoUKQNmxBxQR63FuVYzZbrIpbqfTrSjtJx11fF5Zejv92pLpa?=
 =?us-ascii?Q?TU37oU1t3erPG6/nME02w2wrP6m/fb91L/atozgfilP7s9I6S8DNGXHzh6cY?=
 =?us-ascii?Q?asTEQK4engmfsAcNmQWx9m2OQNFxSUTjK1y3KBpnER7kWDpfIeoXLOafG/mp?=
 =?us-ascii?Q?MuVxKGsU5brkIi2w9jim5JZ2nZw/dQ8hLWfQU/YtMNSZmileTCpAyunXGlV+?=
 =?us-ascii?Q?CirkGd0IxavdcxghyRvnnX3W+BasYmdnJCB0s+mp0x2eF6C6F6DPts8TsPgI?=
 =?us-ascii?Q?99CGPrQrlF96MvREll9AOnEfF3dUGweuflJcUOuX00Pk69+baMQBvAx3l/DH?=
 =?us-ascii?Q?UWEG9hn6coAc4ymXNk+xUAl5AoM+RRG0PiObrRF1poiROgTF25qQGgCYOQlw?=
 =?us-ascii?Q?RdYd61f+ofK6rrf2I42omdSP2z/mglR5xkAjjb0HUHgoXvSmtP9qVqS2cLb3?=
 =?us-ascii?Q?74hdcwG9X9ByqRnEdCR2/TwJeI81xFTEL0kccoJVV4bF+06auAZANliKn7iB?=
 =?us-ascii?Q?dGfIGJac28O6cBpfgwmtAgLM99OG2o0sB8lLOA9XFmHKHysKPZ30tX3flAhP?=
 =?us-ascii?Q?RzgK3QIcMeulBHCSVoZvxXfmI1z2D1enJGwMhrrAOQ5igQmRYOqzyojLLw2d?=
 =?us-ascii?Q?vfNKJLYJ9kk0JU8X0M6rvy9wSDVK1wklSdn3HPosLZYRAZ9F+55OcUKdOahg?=
 =?us-ascii?Q?GXwMEEygFzzjPfWLtgbQh/Nw/KbRKGa2D73JdbAY66VyWbO8+N5/MlbMSiHa?=
 =?us-ascii?Q?qZ3i33B1Rba2BEplQUr1YtD5bjYleaAMmCclqfAdtouipUSAM9mEOPi1K4wi?=
 =?us-ascii?Q?NstolRyWW0eWl1C+q/fxCTEBDryKFaWY+rAamDZ0Ino0tQDbOwtD3jSK5AGv?=
 =?us-ascii?Q?IzoG4CKcCRbUDzCAMDERqYY6tBlH6fTiZChoVSQAwKI9VHG2VskeP5K0Zyg5?=
 =?us-ascii?Q?WXhabnOnTmLIMUe1un0BRDmoCbjkZ12PDv8gPcpAkNfRCKJVnbRLDvV02ohY?=
 =?us-ascii?Q?zmSjokVKAOsYvBioH2uJuiAZFYmogey39Ly8DCH55ZbxR9bNnp8n9hu0Lsj/?=
 =?us-ascii?Q?ajcT3r+XgSSMDRI+l1We3ZL7kFjfUJOQqKnM21TNOunXJ8Oghv2+IcqfgVWw?=
 =?us-ascii?Q?x7gLV+0GKUGtNYoP3eQ+k6AaS5KAddMlE2i0eSVI7hLGbilT4pUYBNyCOcVj?=
 =?us-ascii?Q?G+R6vFczQ95qoxTy+iJD/nGZDCGacrjZemjJ/qw+NQp/+3Bnuzo/wJpaPilU?=
 =?us-ascii?Q?ye2aKp5luDF4Q38OC/cPVwMpG5o91FenoX2kTTsgaObpf71Qpg=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 15:04:00.6431
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c1c2469-d2ad-4739-8024-08dceebceec9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF0000468E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8856
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_160410_631392_51FDF4DF 
X-CRM114-Status: GOOD (  19.76  )
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
 drivers/i3c/internals.h            |  2 +
 drivers/i3c/master.c               | 80 ++++++++++++++++++++++++++++++
 drivers/i3c/master/dw-i3c-master.c |  5 ++
 include/linux/i3c/master.h         |  1 +
 4 files changed, 88 insertions(+)

diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
index 433f6088b7ce..d2d6c69b19dd 100644
--- a/drivers/i3c/internals.h
+++ b/drivers/i3c/internals.h
@@ -10,6 +10,8 @@
 
 #include <linux/i3c/master.h>
 
+#define AMD_I3C_GET_SLAVE_ADDR		0x30
+
 void i3c_bus_normaluse_lock(struct i3c_bus *bus);
 void i3c_bus_normaluse_unlock(struct i3c_bus *bus);
 
diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 6f3eb710a75d..20b83ca52d31 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2251,6 +2251,80 @@ static int of_i3c_master_add_dev(struct i3c_master_controller *master,
 	return ret;
 }
 
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
+		slv_addr = val >> AMD_I3C_GET_SLAVE_ADDR;
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
+		boardinfo->pid = (val & GENMASK(47, 0));
+		if ((boardinfo->pid & GENMASK_ULL(63, 48)) ||
+		    I3C_PID_RND_LOWER_32BITS(boardinfo->pid))
+			return -EINVAL;
+
+		/*
+		 * According to the specification, SETDASA is not supported for DIMM slaves
+		 * during device discovery. Therefore, AMD BIOS will populate same initial
+		 * dynamic address as the static address.
+		 */
+		boardinfo->init_dyn_addr = boardinfo->static_addr;
+		list_add_tail(&boardinfo->node, &master->boardinfo.i3c);
+	}
+
+	return 0;
+}
+
 static int of_populate_i3c_bus(struct i3c_master_controller *master)
 {
 	struct device *dev = &master->dev;
@@ -2771,6 +2845,12 @@ int i3c_master_register(struct i3c_master_controller *master,
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
index fd58a95ae1c3..8d4583bc2113 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1602,6 +1602,11 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 	master->maxdevs = ret >> 16;
 	master->free_pos = GENMASK(master->maxdevs - 1, 0);
 
+	ACPI_COMPANION_SET(&master->base.dev, ACPI_COMPANION(&pdev->dev));
+	master->base.ahandle = acpi_device_handle(ACPI_COMPANION(&pdev->dev));
+	if (!master->base.ahandle)
+		dev_err(&pdev->dev, "Failed to get acpi device handle\n");
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
