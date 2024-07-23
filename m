Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E49C3DA63
	for <linux-i3c@archiver.kernel.org>; Tue, 23 Jul 2024 23:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eIK1skuPTlDJp1OgrNYC+UrDXIoBr90/ebeG6ewqy/4=; b=2lltfMjk6azmfM
	wT4HQ1eptftFjTsCg4+7wI/Rft8jAFXdDlc3c6Y4+iVEkAh1GGS/1miqQXnbo3kwF1GJOQjoSfkE2
	V/ctvSxqhXc6xYJhXGfCJXqQU8DjFr6lKZ8jcwVsohuj7hMjGEsYIyHl3s0oOpMA4ooE1zhC8gQc0
	IU0GdZRygL9+DClGR5tuwF2eUb03qRGU4Pr/NMXVxgx5742Uctslze1CZ/kEeVR3048K+DWQyi5rJ
	EMAQUqrEx8ckpWtsNwK07Y+tsvkOdrU9D5MrPVjPcNZ14/Lm+2Ln6kyf0cvbQ11gww4nqxVmZpQJ7
	+lA88cOJTaMAiSg8xrBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWPDc-0000000Dozv-11vZ;
	Tue, 23 Jul 2024 23:46:56 +0000
Received: from mail-mw2nam10on2060a.outbound.protection.outlook.com ([2a01:111:f403:2412::60a] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWJR2-0000000D8ep-3Nvy
	for linux-i3c@lists.infradead.org;
	Tue, 23 Jul 2024 17:36:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ivx0G9NHlBJ51VhvNlK3X8i92tGykMItV1tLaGro8dwEZ5JXZJakNLP0B7ZPxPVbBnWhvhhEZ1Mag3DN10oLQoz3HGPrnnuudzfbQPEa0IiAYp5anGtLo1HTWN6b2+P7idapkwGFQQGJ10fWWUX7uoVUw+ErA8Kk9OEGj9traTfyqfr9C6N8KiiJfqLcR2hYj+t0JF7jibMLnsy/qCNZCbnUfVo9pLZrvehNmlKZD7smtvxF4bcE/jTBm88cTmw+6d3BbvKRLMgql7mYQzGJab4JDRMCnJuUHa1Tat7t2YokUCD18AuKZUitwodFRkLNgfBoIdCWrc62CkSsiUM2Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BvZrqMZ9W8UiEt83xOhu+KWH4VwhnQBbxYoQrYpUxLI=;
 b=qr0LPcQwAMaumOOVj623ZdWySox1/RNZr2z7RuPdMHhet9mmYpdGfryEJkMEqTIiQ/ML5RmKGKfQZSBWuoipf3ZF2pIjdm+i41J5EFhasCnOeiSvnpmwQ5T2YF7wxLfpDt5M6lg03kaN5mNzw0DPYS8ye7zCMU+bOhgIo98/i6/z8Zg4VGsCfYvw87T/i90iT/L0O5VUOP2S1o4zxjZ6bV4j6g5VqyJKFvCyEDb4Bh/btJRa6h9aQ0LIsdsATC6uZQItFtfUzAeRc0BKCGggELqNuwZMJf4+U2TtOGWzwxaJGYoH95mwi2XffzK9mkDN+K7/aJoPQMVMbimTiZKChA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BvZrqMZ9W8UiEt83xOhu+KWH4VwhnQBbxYoQrYpUxLI=;
 b=FMwk4nGYduAhgjQo+kjDnDz7+9rMN4H/YMGKdqMxai8wmBFCx5yzOZ3G9fsgXJrjq1GGCHJmQwNY4NLm+3EYWBwq10DFY+GPaPL1LOnN/3KPYAtbZ+AyXSX1CAylYx1QF38k+/o0IY970FpnoYh+A2H1vqFfLVyy4y3hX8WothY=
Received: from BN0PR04CA0077.namprd04.prod.outlook.com (2603:10b6:408:ea::22)
 by PH7PR12MB7330.namprd12.prod.outlook.com (2603:10b6:510:20d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.24; Tue, 23 Jul
 2024 17:36:13 +0000
Received: from BN1PEPF00006001.namprd05.prod.outlook.com
 (2603:10b6:408:ea:cafe::88) by BN0PR04CA0077.outlook.office365.com
 (2603:10b6:408:ea::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.19 via Frontend
 Transport; Tue, 23 Jul 2024 17:36:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00006001.mail.protection.outlook.com (10.167.243.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Tue, 23 Jul 2024 17:36:11 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 23 Jul
 2024 12:36:09 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jarkko Nikula
	<jarkko.nikula@linux.intel.com>
CC: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>, Krishnamoorthi M
	<krishnamoorthi.m@amd.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 0/5] Introduce initial AMD I3C HCI driver support
Date: Tue, 23 Jul 2024 23:05:33 +0530
Message-ID: <20240723173538.3493935-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006001:EE_|PH7PR12MB7330:EE_
X-MS-Office365-Filtering-Correlation-Id: 74d2f8b7-86b8-4184-8a50-08dcab3df223
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bTnA2nSjNJQwboRVlnBa+WSjTvJS7RzjXRh5evWarwRrirGgimcOz2RsUF8l?=
 =?us-ascii?Q?850ukJK05bQRvfU8j3tll0zdpGvBeXcG+ZoImREb/ydbf+EAlW2Z7c93g+ts?=
 =?us-ascii?Q?U/z+vLXVrp4ewt6j1DMW1F7SAot4QiAvzeaI1uA1RrLSlBS6QBMzgY8NH3IT?=
 =?us-ascii?Q?LZxSJit9SyccOnedXYPlICK7VGTHgUMh67pQMV13sz7GkKIZtI2LSQkOVyk6?=
 =?us-ascii?Q?N8graDwdTR1/sDJuvbFUta3F4vkNdy8DSkJlMmwJh3PxZPgBHNQdCGhTIcD8?=
 =?us-ascii?Q?W5VzTlFOQKuoJ9j2CG/fZy4ZRdhJPikzCxP0aJ5Ys7KfjMgCGwFEvms5zUVM?=
 =?us-ascii?Q?a6M4EJF2+62jqnDZ1pqqpzRZrnwnYii8LDyTJH2UjwGDos9XK5Y0Xs8mm1BA?=
 =?us-ascii?Q?9UUKxWnb16anUXRcsU7TEYrFdY/5ETges4cv1f+1+y+c5m197P/BQ+Ig9eDm?=
 =?us-ascii?Q?thUrSHQSWhDJJ6cpAJF1cg/xbBOSIJiYHhp++pGF34l5qGIDXcn5BaNV9K9y?=
 =?us-ascii?Q?ry5ap6zPe59oX/h8287vgeQEatQE8sy+W1wofXbcAal1OPvY4GIqUvuoEIBW?=
 =?us-ascii?Q?V/v0yremqtaQ7l6+E+Dsy8F65QyYXV6D8ZLCw6Ep/kwLOHfXEkM2jeFgB9nN?=
 =?us-ascii?Q?YppkrbzfGtVmhGB7oqCOS/OEWV6K4b4q1XayrHkOVhlvZmyW76C2qnLW60SK?=
 =?us-ascii?Q?KDhGnpgBvQfOqfnldmJduZZkesRo/zS6+ylNwMIuNNgVr25KPArO/19nzTFo?=
 =?us-ascii?Q?gChmTEBAOFSYMVkge4ltqjycuJhHJB5Lrvm8WnfTHmhdizNzsTXG819ppIg+?=
 =?us-ascii?Q?tGGof2fJfy8TBA+LtOdEQu36b8YB/T5i88NhvYJaNuXHocIrGZbfELUbqa9V?=
 =?us-ascii?Q?6aHYFrnOsWQHUY4fMsG9U7PxvfVBhWokHdEHvH6aAOiZFaFezpvL0bl7V+PN?=
 =?us-ascii?Q?pOhg2qHTIKCCSULjP0ivF+FaUYHYFTxBeeY9sT24PR2kLoU1oWTSLQSTTwnK?=
 =?us-ascii?Q?qo9pgHr4wDUViJDTA1r0a1lfN3IlIoC6/1jbpQGFXbNHLsFblRc3OlEMqBqW?=
 =?us-ascii?Q?+oyNNcksJprDk8u6VDZyZ//0KBCMyALkGDPQ8jvIR6L0gyerZG2zMT5GgZ7y?=
 =?us-ascii?Q?kjV6aAiqbl71TE7a9uSI8HOwbo/0c/mZS89SPBRqgqcOaIw1Myt/g5vxpaJA?=
 =?us-ascii?Q?fex01Oa6EXKoGbL+NghSX6d8Qnt2soQ2kd2EeHFFPt3R4NYFF4t8jiURVk++?=
 =?us-ascii?Q?murtcmEBlpuflY5HJXedVO6Uv/v4m1B2l1VvkL/jQkdEPoMtrs/hLQ77bOKg?=
 =?us-ascii?Q?aa6+tLwpTAL25U/8mvyq7BtUgb/TYzC8EBNiVemPdKX8NJIkK1HktHHekiWD?=
 =?us-ascii?Q?1xB96vtgKl/UVaF1EhphUHLr6gIZFm+wYr24uNcv6wEGxueD5Gua6gxyUa1k?=
 =?us-ascii?Q?mrK3I+SXs+c=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 17:36:11.9475
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74d2f8b7-86b8-4184-8a50-08dcab3df223
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00006001.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7330
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240723_103625_168621_56F80D0E 
X-CRM114-Status: GOOD (  11.36  )
X-Mailman-Approved-At: Tue, 23 Jul 2024 16:46:53 -0700
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

The AMD SoC includes an I3C IP block as part of the Fusion Controller Hub
(FCH). This series introduces the initial driver support to enable the I3C
IP block on AMD's latest processors.

Currently, the code is closely tied to dt-bindings. This initial set aims
to decouple some of these bindings by adding the MIPI ID, allowing the
current driver to support ACPI-enabled x86 systems.

It was discovered that the AMD I3C controller has several hardware issues,
including:
- Non-functional DMA mode (defaulting to PIO mode)
- Issues with Open-Drain (OD) and Push-Pull (PP) timing parameters
- Command response buffer threshold values

All of these issues have been addressed in this series.

Shyam Sundar S K (5):
  i3c: mipi-i3c-hci: Add MIPI0100 ACPI ID to the I3C Support List
  i3c: mipi-i3c-hci: Add a quirk to set PIO mode
  i3c: mipi-i3c-hci: Relocate helper macros to HCI header file
  i3c: mipi-i3c-hci: Add a quirk to set timing parameters
  i3c: mipi-i3c-hci: Add a quirk to set Response buffer threshold

 drivers/i3c/master/mipi-i3c-hci/Makefile     |  3 +-
 drivers/i3c/master/mipi-i3c-hci/core.c       | 34 ++++++++++---
 drivers/i3c/master/mipi-i3c-hci/hci.h        | 11 ++++
 drivers/i3c/master/mipi-i3c-hci/hci_quirks.c | 53 ++++++++++++++++++++
 4 files changed, 94 insertions(+), 7 deletions(-)
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/hci_quirks.c

-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
