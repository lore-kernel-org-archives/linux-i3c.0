Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EBD4D5E146
	for <linux-i3c@archiver.kernel.org>; Fri,  8 Nov 2024 07:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XJqQIv2si8Vw5+pHAYLpt0cBvIJySsDj4glc3cAulKA=; b=SnrXW0qMJce4w+
	rJfXgdnTq8wcWqZNy5UVrgrQx29xjQKSLKfmzYP5J662uEUw3/s0CzjzSUjBaJWEWz/jEewYAjd21
	gPDNYhYw8LExwsta8k4Ob6E5Mm5pAKBr1HY26yAxjvMJGz6diVamzHFg4yflAAWuYVAyiuVDDtiIA
	aRZMtZiyvpzsXyPgxwDBgkAl7eMlmGeCX4gMJWdguq07XytaddvPdtqGENpJplxM4wpsonG2i+5ng
	R3JaX8RJxchEy2J9UbU0Z9tyIuuBNN+LEc8cr1t46WIGhAAMrs00wn3YcLzwL+FZtxQz80KXVW0LL
	k2InrARCK0aKq127SJPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9JVb-00000009d31-3WzP;
	Fri, 08 Nov 2024 07:34:19 +0000
Received: from mail-co1nam11on2060a.outbound.protection.outlook.com ([2a01:111:f403:2416::60a] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9JVX-00000009d08-4Bf8
	for linux-i3c@lists.infradead.org;
	Fri, 08 Nov 2024 07:34:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p92RYw6Pz9cmtGilcOSeg0PUrBCrnBavtWGsmatRDHWscUVN1UKvfG97fTHWzEG6oH+cV4Z8OF4i8+Pogx3sLsX85W0KlsDtrX3OwBWxVkT5w2hK0FVgWIFgZS1UdSbzisKfR/GAQeGRGjUl2TeyRyooDOiSKnJik12GtyTS12xee+RrTtDfsPiBOoUNZcZRUsYUqu0rnp3KJaiGod27WEOHoyMminJ7Y6yTTGypHSE9rr19pww/eDNErW8O2voYdHocrouM7rMIkC/097/LJQ7rrAmqgCCju/e9thdfT6bJG00ugiFuMoEMT7WGY34+FwIGgiyQNRJe2FdgbTRa7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1nWDynJuNFanjoN+/KI69qEqB2g6Mqrm/HnaGLHlblA=;
 b=NmEh/j6hWau/JZU1UmmcojICf6UcwyMk5UnH/Mbcrt4jY+qE/sBleYWKQDUOWRacla/DUOzuKQVcBQ5bl0FK70AdFE/GuBGb3hespxi0wAMSTY5LMMgM6yhG42pufU1M6Cz9o5z9ksEd5LIOeAdF0PNiPC23xyqwBW4K79URBaXun3ABpP+Voxcd01N5+9f7A1crueWfZeQc1sS5TYHNcIlOSzgiPbPjdAoAm/0WNnid2atU1FYy8TyDunBPW36rsf4FDZRkO7Uj5nalbTGtERWcR5p1tHbg4GAkEW9tnTkmoIK4ytLq96AWbRj3U78SZk9aLc+i000QXE5XUoQGAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1nWDynJuNFanjoN+/KI69qEqB2g6Mqrm/HnaGLHlblA=;
 b=FH/3jy16MxU26WigNUuMUeU/0GKAJ9llozDiw9c17OxYtDOTX3n25VmqABEbRTOaSb99FQlBHQQDmzFeJfw33M6L18uO8X4XYGdl4SlsGMoBoyDQ9VwmQbkDjphySV8PVB22ARpsIx28hUe+TCqMerOLZQfP0tTUAc4SAMoZcEI=
Received: from MN2PR01CA0056.prod.exchangelabs.com (2603:10b6:208:23f::25) by
 SA0PR12MB4463.namprd12.prod.outlook.com (2603:10b6:806:92::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8137.19; Fri, 8 Nov 2024 07:34:11 +0000
Received: from BN3PEPF0000B06B.namprd21.prod.outlook.com
 (2603:10b6:208:23f:cafe::2b) by MN2PR01CA0056.outlook.office365.com
 (2603:10b6:208:23f::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20 via Frontend
 Transport; Fri, 8 Nov 2024 07:34:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B06B.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.0 via Frontend Transport; Fri, 8 Nov 2024 07:34:10 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 8 Nov
 2024 01:34:07 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jarkko Nikula
	<jarkko.nikula@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 3/5] i3c: master: Add a routine to include the I3C SPD device
Date: Fri, 8 Nov 2024 13:03:21 +0530
Message-ID: <20241108073323.523805-4-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241108073323.523805-1-Shyam-sundar.S-k@amd.com>
References: <20241108073323.523805-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06B:EE_|SA0PR12MB4463:EE_
X-MS-Office365-Filtering-Correlation-Id: e8083113-a6f4-4581-44a6-08dcffc7bc9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bJd2mUFEmBBB3n2uptU4jqKJ9Pb7TLOBTP0kQSLuqOqzsoUtniXD12ExCJ/i?=
 =?us-ascii?Q?iuDZYA5vaiaLV+8TcytPIG5V6CDn2o2/Bd9j9qvicnnYBgAMyXW+V3+WxoEB?=
 =?us-ascii?Q?ZXEWPRNUU5cXg+t9eskPsFM+bdDfeL6NLENvePqbjtTa0ZWxuAwYlfXeIqOu?=
 =?us-ascii?Q?oEA4UP73PXSxRFKQwbIomeQvwHcdjfkLZKgeuxgMprH8ZA/QroPTlmrSjYjm?=
 =?us-ascii?Q?MxaGrqufA6BjDNgwr+fqMotFrthQzb0ZCm0TOZ++bkMwzFAkvq89kCh9iJn3?=
 =?us-ascii?Q?8sWJVXqhwaM+y+6jenWVfkAw+WX3JmoJZDXDfz4xzaldFO9/cSyKKDyYz7Fv?=
 =?us-ascii?Q?6ZIRtZXyuefiemwSheG5CQn5FpE0UVfjxTfSe6TFeOPCeLtWR1sPhRKYKWaT?=
 =?us-ascii?Q?XL+P/xNTgHvNjSn5qIGwQ6RmhV0GLce8+TCkN5O2a43CRdvFyGoCgJHCXjv1?=
 =?us-ascii?Q?olQBnVkVSrOh/eN/1GxJwJUbIM32o7CnjrKh4f6prfXroukmeKMCa5A3+M3W?=
 =?us-ascii?Q?lZcT8Vn/4O1+XYTM2VbMF2NVUCLgtFchUhhD53rESyIaTeYY0PZ38eclXnJm?=
 =?us-ascii?Q?Ff/HcTnKwLK9iX7E4rqQt/76FA4rCjzahfAw4WsvhTYr/Fm1XoVy9bcWaywJ?=
 =?us-ascii?Q?OETUFvVRlEl6fcHJgVfVVfuW5x3tu19btRFknjS8W3KxnaFrrFfaN2MwYZ+t?=
 =?us-ascii?Q?Y9sSkqEFPIoDBiAz+3nCH6RY/lGYYDzHZjVFGTyyFSMI5WNYd4f+Cn5yR6Ji?=
 =?us-ascii?Q?pHpJVBQ0krjmSqI9kjgbf0xbFr2+1T6iLwamcrT4jAEXH/m+q7a2whyAeGuM?=
 =?us-ascii?Q?ZWa6KFLCbeTKHkk9WaSu5HtMA6413hUNhtyD5Bp6YI8Lc3S1LMN2RSIW/nYI?=
 =?us-ascii?Q?JZtJsZA1lA7sLcJKaXlMojuQ3ZKJDfmm00zWojhYNwD+NSlmLJm20ar2iCMo?=
 =?us-ascii?Q?6SAvkUHGEW5EG4ovXtqLEvRJOPnPce+q26ABD5KsX/LW28JE3BUZY7RNpJNK?=
 =?us-ascii?Q?8KJqi+qkxMVm9gNsc1cCNofyXcsbitl1uRcf5cV00/X64rboU832vCum/9Rj?=
 =?us-ascii?Q?+jYXlkThOL6NcUutpre2K55SNcwSgf4PQkmU4OMAL2gDoudPKkX+v7QnMp1r?=
 =?us-ascii?Q?mvXuy7nROxClgXlP+3L/zaLVpeZvpq+im/kSxeFkMG/Ad4MgMcrX4gyzAxl9?=
 =?us-ascii?Q?UZoeelfqeZSpWWj8LOTRKc+i3ILXEFdY1d+fTo34bRVcGyEn/s0IsK2NiypJ?=
 =?us-ascii?Q?CO8M43fved3+IufMv1PbgyXJVgE8np7+p3gljFH9jHp/VGAyHbreb9NPH1cR?=
 =?us-ascii?Q?doj6GMJ9UWiV1uH4mbTDeKjseqHnZYOHrtS6hfw8iqNPoen3RgZypBlLSPlQ?=
 =?us-ascii?Q?I18NkEYT7tsnWrAGZxoIA91wkh9he73wC+IQPrlDZw5j5qIKww=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 07:34:10.7009
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8083113-a6f4-4581-44a6-08dcffc7bc9b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B06B.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4463
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_233416_632898_EE200E44 
X-CRM114-Status: GOOD (  14.00  )
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

Implement the i3c_master_add_spd_dev() function in the I3C master to
handle SPD (Serial Presence Detect) device creation and map the board
information into the I3C device structure.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/i3c/master.c | 43 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 0ceef2aa9161..8f37dcaa1efe 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1657,6 +1657,45 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
 	}
 }
 
+static int i3c_master_add_spd_dev(struct i3c_master_controller *master,
+				  struct i3c_dev_boardinfo *boardinfo)
+{
+	struct i3c_dev_desc *i3cdev;
+	int ret;
+
+	list_for_each_entry(boardinfo, &master->boardinfo.i3c, node) {
+		struct i3c_device_info info = {
+			.static_addr = boardinfo->static_addr,
+		};
+
+		ret = i3c_bus_get_addr_slot_status(&master->bus, boardinfo->static_addr);
+		if (ret != I3C_ADDR_SLOT_FREE)
+			return -EBUSY;
+
+		i3cdev = i3c_master_alloc_i3c_dev(master, &info);
+		if (IS_ERR(i3cdev))
+			return -ENOMEM;
+
+		i3cdev->boardinfo = boardinfo;
+		ret = i3c_master_attach_i3c_dev(master, i3cdev);
+		if (ret)
+			goto err_free_dev;
+
+		i3cdev->info.pid = i3cdev->boardinfo->pid;
+		i3cdev->info.dyn_addr = i3cdev->boardinfo->init_dyn_addr;
+
+		i3c_bus_normaluse_lock(&master->bus);
+		i3c_master_register_new_i3c_devs(master);
+		i3c_bus_normaluse_unlock(&master->bus);
+	}
+
+	return 0;
+
+err_free_dev:
+	i3c_master_free_i3c_dev(i3cdev);
+	return ret;
+}
+
 /**
  * i3c_master_do_daa() - do a DAA (Dynamic Address Assignment)
  * @master: master doing the DAA
@@ -1814,7 +1853,7 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
 {
 	enum i3c_addr_slot_status status;
 	struct i2c_dev_boardinfo *i2cboardinfo;
-	struct i3c_dev_boardinfo *i3cboardinfo;
+	struct i3c_dev_boardinfo *i3cboardinfo = NULL;
 	struct i2c_dev_desc *i2cdev;
 	int ret;
 
@@ -1868,6 +1907,8 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
 		goto err_bus_cleanup;
 	}
 
+	i3c_master_add_spd_dev(master, i3cboardinfo);
+
 	if (master->ops->set_speed) {
 		ret = master->ops->set_speed(master, I3C_OPEN_DRAIN_SLOW_SPEED);
 		if (ret)
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
