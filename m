Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C693FC52CD8
	for <linux-i3c@archiver.kernel.org>; Tue, 23 Jul 2024 23:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FVnadBdpwBzgwdomT0+vrDi8/GAPlqry7zZ//56n+jk=; b=O1ty4anMpA0YpO
	AMH6reQp/2l+ZJ0/l9EaxRK3ZcawYLAXddIfy8I9zHaWVBfW9PHpqsADnmbiPn32ArwppVvsq4TwZ
	Xr/P6oIbo2vFQeh8s/GD80ZpC9hClylRq9y7eS1j/+ZZ+uwLFTP1fIKh6L1kb3Bo8dWhkutNa1prs
	2QqF2cnAP23Yqup45vM+ZzGXNMLpEtfVIez2/C704hyU0qmqz4/H7og2mTYSsM6wUWjL0y00ZAUbt
	fV69DfGuLvotBIhNmvFqhg93LQsuQmNsqhyfiGei3vtnp23NVFMFH+9NdmVZP5HY0tYKIhwV1Y5I9
	+t+GoVmhR6EsCB1KJ2Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWPDd-0000000Dp0Y-2BPX;
	Tue, 23 Jul 2024 23:46:57 +0000
Received: from mail-bn8nam12on2061e.outbound.protection.outlook.com ([2a01:111:f403:2418::61e] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWJR5-0000000D8fj-1zXd
	for linux-i3c@lists.infradead.org;
	Tue, 23 Jul 2024 17:36:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dDki/NQ8bM0Hm/rhtyVTcXo/2UjEbpTh9l0apf/KQ/d6ArSNk2DuYoHKy6YS08u7fzviDw/FdyUQ4QZYD3xWofUKhuYJsXLbwcO4+kbJumynD4UkOIh4JergDrSbfgZj6hHrB4RV6z0Lq2Q2ASpC9P9m39mRpDva7p7jJzbMtxGHbsX+ZvqEApnZvjmLWcrNujq6/48LFZ09n715cM5HgM4UniDywK5rFbACWWsRLvwDpt6hkWjWzT5vP87LG4htqcXDcfefUu8AZd5Lvbx6TMfOpY/SyuJIPQPOc6oGP5ePhFghlLUmfBPbzBd3DPGOeyYrJoEr95VwWwYUt0ZLTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UtBl23dy1zJf9rkzc7HruH/ojUo1R9wqQ1CABqtj3vY=;
 b=CaFqvvLiGKYebsQlrez7gj/Q74KstqqpVWPkwFo/8jGjihjTgQlsOERE97PZS7hr1PxcoLglW4xmQhbE/ss3WvwgZjDAaHUCjmdu8K4W1+EzvDUbwOdfEAJPTwCcxQQuz5vFX455LZcXJCgeslyFL9pKAf5vmK8ZGeug9AMZcPwVACb4Zt9cxWzM3Y6L4EGBaAtdjCGvqv83d7KKBJsdNe0ZzEub+/hT+ojAqKeq5WircIGkTRALPMo54bHxN95br6ZVj1nq17KOuN2KZFMKUtXUEn560PnS6gvvFFeA9obHfSMKytNnyNuRq/Bbajlx/z0oUWNsMsfZccZzSmVMlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UtBl23dy1zJf9rkzc7HruH/ojUo1R9wqQ1CABqtj3vY=;
 b=edZyf+FNao4XvBCistEwSkSLmBZoagbsuwAwp47C9HCMMbIqlYyRoBB8FnxvzMYxY+1YrL0MrBDRZiTOUivWmeWdM9WujvO3VTQOYhtfYz5Vn4gabzdwSv7RtM3EwUK4nDre4hDV2C1aZsB+xhgubVxl69cmvNoILtRUJUqkdZU=
Received: from BN9P222CA0026.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::31)
 by SA3PR12MB8045.namprd12.prod.outlook.com (2603:10b6:806:31d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Tue, 23 Jul
 2024 17:36:18 +0000
Received: from BN1PEPF00006002.namprd05.prod.outlook.com
 (2603:10b6:408:10c:cafe::7a) by BN9P222CA0026.outlook.office365.com
 (2603:10b6:408:10c::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16 via Frontend
 Transport; Tue, 23 Jul 2024 17:36:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00006002.mail.protection.outlook.com (10.167.243.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Tue, 23 Jul 2024 17:36:16 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 23 Jul
 2024 12:36:14 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jarkko Nikula
	<jarkko.nikula@linux.intel.com>
CC: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>, Krishnamoorthi M
	<krishnamoorthi.m@amd.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 2/5] i3c: mipi-i3c-hci: Add a quirk to set PIO mode
Date: Tue, 23 Jul 2024 23:05:35 +0530
Message-ID: <20240723173538.3493935-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240723173538.3493935-1-Shyam-sundar.S-k@amd.com>
References: <20240723173538.3493935-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006002:EE_|SA3PR12MB8045:EE_
X-MS-Office365-Filtering-Correlation-Id: 106f0d17-761f-4c69-c49b-08dcab3df4cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CO60OEqPNSBJhpX1v7jbkuuWj+QL1sGMF5WfiUBw8tGJZcuzCj52KlJepEUI?=
 =?us-ascii?Q?12lqgmphNq9T0H6JxqHr2YoHooAquxEdUwoOB+29VM4R/1LfSM+OECkODSW4?=
 =?us-ascii?Q?PRO3kothMqPmZH159rxdWZQtZZMpZxTNsERTg9Y28x0g2VpGsKb6J1inGluV?=
 =?us-ascii?Q?a4hb+wOA2nBFs+edTLUiqkeF9XkzUu0fuyTb4nCrMy3jsg1mGa7PxPTz4xkN?=
 =?us-ascii?Q?HO3kM2RbbnQ0c51YM6fLAQV+eqYy+ZT9+hDmMNnKeVDMIyNJuQUB3KGu7x5H?=
 =?us-ascii?Q?WCckAoJfYu/i/iGr73snbL8Pij3MPmvQjDPwnds15YpvFCPk1xpXtj0lIuwH?=
 =?us-ascii?Q?dOzY4MVhoO8Y+N8Y2iBgMfgj8BcrfjHIXCX3bH2+GpVi8IkIJrbzAToEPoyz?=
 =?us-ascii?Q?3Md+woZ4TwHKQBLHDbXhY9DhOW+gwHuvigRsLEj04KiY+aZofOXz7gusa3+p?=
 =?us-ascii?Q?PDb/yWdN8e3FErXD+4zk26B8Pg68WtkgIm0dO0abV8vphrZ21Sl4aRz9mA2Q?=
 =?us-ascii?Q?GPi45oC/QChMXhdOr9HEIPq+y34MmlawD1ld4JHu0MvMj0AFf695PvpWDt/E?=
 =?us-ascii?Q?q0JB9xr+OvlEtrIureFK2bJ0RxKoqNBQJ4FbdRjK9Y2AFOWDj8L6OYM6oc/f?=
 =?us-ascii?Q?JMzYnQEuJoyUFPK8zOuV15IU2KRDaff6PhAd5R8tBIk7aPaQKOcOxfIgC/Hb?=
 =?us-ascii?Q?/AuPYQkmSdw34OgLmEu3BKPnNtFk+xHrpPus6L/dr8jcOV/Pq/9jds9qP6G9?=
 =?us-ascii?Q?86P/IkroW7KhHb32U2UaRuhEd08FOC1+FWL3R1aGQ9bVkE9Nixb9kssg4dqw?=
 =?us-ascii?Q?ICoawWQ65q75YkX7HZXINXbie0+hUOVPzPtgL1khk75RAKsa2Z7V0wf6nGr0?=
 =?us-ascii?Q?/ARIF1stvNyhV80hiVFJ4GdGCiZb1wPqo5uSRzMN0UiJjDAFBccsqXjgERbf?=
 =?us-ascii?Q?R3MpvR5TwSngHH0aoMv8K91plVnIEF0WbsJOrV3J3wnu1lXW9uyg3LTA0989?=
 =?us-ascii?Q?sVURw4aHsVhAQad0vNuGSANdXjvPB+EktdkpEp5k4YknRrzC2N12wjXBGsHx?=
 =?us-ascii?Q?bYM26nQm8iKuJ5nz5cp7VFhIes4O5hztWFH4JLGlmhFsa+wp0SAUNZ7lPai8?=
 =?us-ascii?Q?4e+s2TFoNx6RKiywpM115n85EhAcov6tdm5LOWwGG9YVx5+DFKcDhN3QSXot?=
 =?us-ascii?Q?kORi50spyxAjegNoljXQ5G1iJLk9pakAq7C7CKpNwEo5SxA8zkiSXzo37LXH?=
 =?us-ascii?Q?1CF1bdmfsNJVwtXoETaXK+GL2umIoo1k02IYxi/KC6na9wrYvkV5JNNhdjTD?=
 =?us-ascii?Q?Y/e8Jdxwhm+4RU1uU5k20kV1tG4ieISnuFjXIOwYUormkvBeABDpWnGnx9n3?=
 =?us-ascii?Q?5oyczD8GwGKurPpqw5h9qf33Mw8RWAZ7bccDuZUJ8e5x33wIQTJ0tFmlx7Xl?=
 =?us-ascii?Q?/9Ki109VHNFKQeWb1s5HXrqW3T6qa4/U?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 17:36:16.7465
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 106f0d17-761f-4c69-c49b-08dcab3df4cd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00006002.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240723_103627_541632_EC3AF413 
X-CRM114-Status: GOOD (  17.46  )
X-Mailman-Approved-At: Tue, 23 Jul 2024 16:46:54 -0700
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

The AMD HCI controller currently only supports PIO mode but exposes DMA
rings to the OS, which leads to the controller being configured in DMA
mode. To address this, add a quirk to avoid configuring the controller in
DMA mode and default to PIO mode.

Additionally, introduce a generic quirk infrastructure to the mipi-i3c-hci
driver to facilitate seamless future quirk additions.

Co-developed-by: Krishnamoorthi M <krishnamoorthi.m@amd.com>
Signed-off-by: Krishnamoorthi M <krishnamoorthi.m@amd.com>
Co-developed-by: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>
Signed-off-by: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/i3c/master/mipi-i3c-hci/Makefile |  3 ++-
 drivers/i3c/master/mipi-i3c-hci/core.c   | 15 ++++++++++++++-
 drivers/i3c/master/mipi-i3c-hci/hci.h    |  3 +++
 3 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/Makefile b/drivers/i3c/master/mipi-i3c-hci/Makefile
index a658e7b8262c..1f8cd5c48fde 100644
--- a/drivers/i3c/master/mipi-i3c-hci/Makefile
+++ b/drivers/i3c/master/mipi-i3c-hci/Makefile
@@ -3,4 +3,5 @@
 obj-$(CONFIG_MIPI_I3C_HCI)		+= mipi-i3c-hci.o
 mipi-i3c-hci-y				:= core.o ext_caps.o pio.o dma.o \
 					   cmd_v1.o cmd_v2.o \
-					   dat_v1.o dct_v1.o
+					   dat_v1.o dct_v1.o \
+					   hci_quirks.o
diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index dbc8c38bd962..8bb422ab1d01 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -33,6 +33,7 @@
 #define reg_clear(r, v)		reg_write(r, reg_read(r) & ~(v))
 
 #define HCI_VERSION			0x00	/* HCI Version (in BCD) */
+#define HCI_VERSION_V1			0x100	/* MIPI HCI Version number V1.0 */
 
 #define HC_CONTROL			0x04
 #define HC_CONTROL_BUS_ENABLE		BIT(31)
@@ -745,6 +746,14 @@ static int i3c_hci_init(struct i3c_hci *hci)
 		return -EINVAL;
 	}
 
+	/* Initialize quirks for AMD platforms */
+	amd_i3c_hci_quirks_init(hci);
+
+	regval = reg_read(HCI_VERSION);
+
+	if (hci->quirks & HCI_QUIRK_AMD_PIO_MODE)
+		hci->RHS_regs = NULL;
+
 	/* Try activating DMA operations first */
 	if (hci->RHS_regs) {
 		reg_clear(HC_CONTROL, HC_CONTROL_PIO_MODE);
@@ -760,7 +769,11 @@ static int i3c_hci_init(struct i3c_hci *hci)
 	/* If no DMA, try PIO */
 	if (!hci->io && hci->PIO_regs) {
 		reg_set(HC_CONTROL, HC_CONTROL_PIO_MODE);
-		if (!(reg_read(HC_CONTROL) & HC_CONTROL_PIO_MODE)) {
+		/*
+		 * HC_CONTROL_PIO_MODE bit not present in HC_CONTROL register w.r.t V1.0
+		 * specification. So skip checking PIO_MODE bit status
+		 */
+		if (regval != HCI_VERSION_V1 && !(reg_read(HC_CONTROL) & HC_CONTROL_PIO_MODE)) {
 			dev_err(&hci->master.dev, "DMA mode is stuck\n");
 			ret = -EIO;
 		} else {
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index f94d95e024be..046b65d43e63 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci.h
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -135,6 +135,7 @@ struct i3c_hci_dev_data {
 
 /* list of quirks */
 #define HCI_QUIRK_RAW_CCC	BIT(1)	/* CCC framing must be explicit */
+#define HCI_QUIRK_AMD_PIO_MODE		BIT(2)  /* Set PIO mode for AMD platforms */
 
 
 /* global functions */
@@ -142,4 +143,6 @@ void mipi_i3c_hci_resume(struct i3c_hci *hci);
 void mipi_i3c_hci_pio_reset(struct i3c_hci *hci);
 void mipi_i3c_hci_dct_index_reset(struct i3c_hci *hci);
 
+void amd_i3c_hci_quirks_init(struct i3c_hci *hci);
+
 #endif
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
