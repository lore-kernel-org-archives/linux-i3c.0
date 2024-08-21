Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24BDDC52D7C
	for <linux-i3c@archiver.kernel.org>; Wed, 21 Aug 2024 13:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n1yuYf/TcLwMuDPGhf3HLZ/ilX6RCAVMCgb1Nrp2NU0=; b=c8TBagXtPCLM8S
	jdD9DExR5yuZ0pxXFLwLaglvYqG/y/c96xTDYYNLw8oldX/E7VPT3Bdj/OMTm4H0s54r/HcMJle/Z
	X8tolvOfwqVOY2iZC4aInC+dHp8bJec4wuSxPP6FriHKVF2azR+3ZxV/iNfMAzY6icxIQ5mnvwZ2t
	qunkngjxcUUNAbM/BqtA86vHuIh0AO+YSCiHDr1v/SLSoLUWzPQflqgl0vxNVKnJ/Nm42q4R3X4xi
	T/fhOoPj1TErHW+Rh6ayUd7yYKfEZ0JuPAfPkiLtSPsOsC68LClv6/eBjn8UCswHePqT4XVaylUxo
	OuY8VmfMmCdjhNrx5sQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sglVw-000000099AT-3f1c;
	Wed, 21 Aug 2024 13:36:40 +0000
Received: from mail-mw2nam10on20603.outbound.protection.outlook.com ([2a01:111:f403:2412::603] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sglVt-0000000998g-3WEm
	for linux-i3c@lists.infradead.org;
	Wed, 21 Aug 2024 13:36:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K4rJZa1Pjyjn9W1Fi0KvhE7enWWDjW/4UP9Pr7gq7jpqURxtFOYZa5wxmXUkC0g6UuPE9UWYsqi+YleoH1l31Q1xGGasPkIsKBug8rz3dmLYt3zEjiCysRVq5SPDjjLFhz1yDejs3FrcmiQJn2WJhKJYaVKciaEfRSvPZFmJUhJiwqCT92PM4fXKPX8N5joMeQUqKf3MdGyuB6Tq1plaCf2xxDR6VPXLqMi/rTM7+gus0fiq1z1MLFrrwEIkx73CS7D7zUKeRBVgT+tXla/BfEBgKEKC5IQzNAM+cOrSVjkBzPmPiFMwIqnq8WmrqSr26eMtuESVGbjGRbRMfsLl6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IrkACrkJSCfrA89HtK87N21G+oA9tQzNZbJxm/EN1qM=;
 b=uW3IGfqpZp7EJ6dhjdQt+CLWsAJ/8cmEatOfMw0c1ZeSiukguKzGtdOkgGg8Hx1vOKxDEMYTwWhFmi3esRALdv4mkx06J3wwaEPSXEDdw9/ieBvYv2ok5B0WcyZNOE747cRBTXvV2uPOet27v/pc2mf4rAVhco/7EvpXWDc30WOHwkUw8dJdwv+7k08dYhUahpL247rv59Rl5cctzSVdPzZXPsTtzUqitv8IFhNHpOBYfH3l4I/3Mm+/okZRnAV81HV2+yPQIDfZidyPQd/S1z06UbSdu9LhuLikSfoKH2scIegpJJon0XETJ5S6HKkvxsjD/fegPwfTXsj4TE4hsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IrkACrkJSCfrA89HtK87N21G+oA9tQzNZbJxm/EN1qM=;
 b=r3A1lAoU8a4cwUoX3v668YF60B6hxUib7uUaiQmsMtff7JDTx9e3KkVSRfuW7DuzhlfL2bbSTx+2aWU71v9enDWZdGgJ7I/3GqdKajfUXGFUUkskVSMTHXMeTfC7gEJb6asu6CduIpkz3rG8OSCSt6/TfIxnKHb5Zo1F5/HXFV0=
Received: from BN9PR03CA0125.namprd03.prod.outlook.com (2603:10b6:408:fe::10)
 by MW4PR12MB6753.namprd12.prod.outlook.com (2603:10b6:303:1ec::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Wed, 21 Aug
 2024 13:36:32 +0000
Received: from BN3PEPF0000B06F.namprd21.prod.outlook.com
 (2603:10b6:408:fe:cafe::66) by BN9PR03CA0125.outlook.office365.com
 (2603:10b6:408:fe::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19 via Frontend
 Transport; Wed, 21 Aug 2024 13:36:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B06F.mail.protection.outlook.com (10.167.243.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.4 via Frontend Transport; Wed, 21 Aug 2024 13:36:32 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 Aug
 2024 08:36:29 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jarkko Nikula
	<jarkko.nikula@linux.intel.com>
CC: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>, Krishnamoorthi M
	<krishnamoorthi.m@amd.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v4 2/6] i3c: mipi-i3c-hci: Read HC_CONTROL_PIO_MODE only after i3c hci v1.1
Date: Wed, 21 Aug 2024 19:05:50 +0530
Message-ID: <20240821133554.391937-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240821133554.391937-1-Shyam-sundar.S-k@amd.com>
References: <20240821133554.391937-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06F:EE_|MW4PR12MB6753:EE_
X-MS-Office365-Filtering-Correlation-Id: d290cdb5-cb3f-4daa-2d0b-08dcc1e644f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gYQN5BkbTnXm39gpA3OCSXjvv2k7jrqxnyZtTq+2+Gv60IUm2kiUPEWqKULE?=
 =?us-ascii?Q?k5acSzdXVhvz+BFfLqVTKPXH1Ui0D6Ahd1h87IIYSTumrHJx/S7HkOj2aDdN?=
 =?us-ascii?Q?6kbV/lKlQ1cEucM3Y6Lm0M5XhPg2yu2Re/sDtqr9uNJQ82ryHqN159Pjuizh?=
 =?us-ascii?Q?LAP5dCoogbFf0OowQEPpHf2TYcr0H2IxKXHL81Uw3D7nhCPeaXkZ/Ez8awWN?=
 =?us-ascii?Q?75M6d924PCIpsSYCmIwm1+h0aCQgbIDQ/xrbMmWDx+9Xk+9AHPs0AGw4d7DU?=
 =?us-ascii?Q?TslR5uSNJgnPxgDQV2YdKeBz4677ZLXBuFQCrk9BUN7EJR+swJTiHCewpdnz?=
 =?us-ascii?Q?YuWTpNhIQZhpGgys4dfJUgTPneN3FbdIjr2fB3to12ufUGn+Z0irqtyBAIja?=
 =?us-ascii?Q?Lc+BhCXDOWjnzSSCPdGi9Ta7u3MNW2xhvP99yfhcpnF6pgLgB929EmvOlWNO?=
 =?us-ascii?Q?dbKThgSea+1e2OT3CoVV8swyx2jSo4X40qK4jtRwOWDq0gVML11poMJsCWhC?=
 =?us-ascii?Q?t/vdC5PaXC2TVeStT/OAMreSiLz33hzuzN9lpGDyVYdJBm0Qh5HqO9xwzy3v?=
 =?us-ascii?Q?wnnPnt+1oIh/sJCr9V6rUa5TDsxiRMeZiyC4vcN+mBwN/9/Mv3NwK8MVcfjA?=
 =?us-ascii?Q?XM36W8m/Pmhay2Ebmt7MYwS7X6OvQo6BDOnmRl/PLQiYN2ecmJejydN1GBWm?=
 =?us-ascii?Q?uZdgEFluH2IguTLIQIt9uWPNagqyUJHbaswRle55sg3se6WnqIivzpRt5w8z?=
 =?us-ascii?Q?PCceCGB17gjN4GbAkohFte4szU5Hw2jAjY9z3OYXU/xDR/YaVK+A3nuwHktw?=
 =?us-ascii?Q?dw5FQp6YC+t337OOuAc+xmISgXoNDYN+45xEGGuWR+NjaLRfyS8SK3i1Ltmg?=
 =?us-ascii?Q?oRT0z/dZsuJkCic4BFWQNogYOUSAvLZJNFKFvc0Q2CAjbJaizZJ09NAFXdNo?=
 =?us-ascii?Q?gWuGEM+YWg4rFkYYYGk2zJB8XPM3LMSeTYx3koxyHJLV5ql4FZh+uI+W6mWT?=
 =?us-ascii?Q?pob3GuoyZAJzoG68biPyB0gAjNZ4zlgdzHrv+jSfPeS2302ZFqdD2TVy4PJ3?=
 =?us-ascii?Q?6QyLFv4nhPd8bmQrC++PW828WsmWItgdfv3QoHYJgGeBnol1CE3dsW6o+1mP?=
 =?us-ascii?Q?IE/0dv7w0469QMvPXYrjrGFf3yaP79AlZ+h0Qg38ZN2OzOs47dSnEFpA54Xq?=
 =?us-ascii?Q?vTdV50BmhCIQGN8+Pvcgb8KHS+7VkvJtCX5qliqZoUIBNf8G44R5JJBl91LL?=
 =?us-ascii?Q?Kj5fjVaJ0JO+wF+tgRR/levu3NvZYauiuIr8e8yFuZ6Hlu4N3Duazz/l6ozN?=
 =?us-ascii?Q?GVZluvIG1ELfejZ8XljgTTG/rCF7B4i8N0J+R4mi7ZlRyjHKPZbgHfYzIPFC?=
 =?us-ascii?Q?3qA16OZcV4/jXwyDJGXe43hTiiPlf1tF2e99iQZlbcXSBLq4i3jVhgTwkrO4?=
 =?us-ascii?Q?kIjC/CzAYcTNLKH7WBHqCpUhcmZnP9sA?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 13:36:32.2503
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d290cdb5-cb3f-4daa-2d0b-08dcc1e644f2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B06F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6753
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_063637_908300_A6A69DF2 
X-CRM114-Status: GOOD (  13.93  )
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

The HC_CONTROL_PIO_MODE bit was introduced in the HC_CONTROL register
starting from version 1.1. Therefore, checking the HC_CONTROL_PIO_MODE bit
on hardware that adheres to older specification revisions (i.e., versions
earlier than 1.1) is incorrect. To address this, add an additional check
to read the HCI version before attempting to read the HC_CONTROL_PIO_MODE
status.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/i3c/master/mipi-i3c-hci/core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index b02fbd7882f8..d1952a5619d4 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -33,6 +33,7 @@
 #define reg_clear(r, v)		reg_write(r, reg_read(r) & ~(v))
 
 #define HCI_VERSION			0x00	/* HCI Version (in BCD) */
+#define HCI_VERSION_V1			0x100   /* MIPI HCI Version number v1.0 */
 
 #define HC_CONTROL			0x04
 #define HC_CONTROL_BUS_ENABLE		BIT(31)
@@ -756,7 +757,7 @@ static int i3c_hci_init(struct i3c_hci *hci)
 	/* Try activating DMA operations first */
 	if (hci->RHS_regs) {
 		reg_clear(HC_CONTROL, HC_CONTROL_PIO_MODE);
-		if (reg_read(HC_CONTROL) & HC_CONTROL_PIO_MODE) {
+		if (regval > HCI_VERSION_V1 && (reg_read(HC_CONTROL) & HC_CONTROL_PIO_MODE)) {
 			dev_err(&hci->master.dev, "PIO mode is stuck\n");
 			ret = -EIO;
 		} else {
@@ -768,7 +769,7 @@ static int i3c_hci_init(struct i3c_hci *hci)
 	/* If no DMA, try PIO */
 	if (!hci->io && hci->PIO_regs) {
 		reg_set(HC_CONTROL, HC_CONTROL_PIO_MODE);
-		if (!(reg_read(HC_CONTROL) & HC_CONTROL_PIO_MODE)) {
+		if (regval > HCI_VERSION_V1 && !(reg_read(HC_CONTROL) & HC_CONTROL_PIO_MODE)) {
 			dev_err(&hci->master.dev, "DMA mode is stuck\n");
 			ret = -EIO;
 		} else {
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
