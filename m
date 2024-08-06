Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71ED8C52D6D
	for <linux-i3c@archiver.kernel.org>; Tue,  6 Aug 2024 07:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZtNAp5gJs7+p9dyBYnu+SeEMsHKv7I4XOEgRnT+fplI=; b=VMnZJiGzstfPoK
	8eGi0NhTKdzl8fBHB7U/hwaqSm6F/LW9O4cBtTqCf6WZtYi57wbrabSLtFtWhLM7UcyFycrwcsQUq
	Ll1iCUgqiAakFoQhe3rXWfqhcD2f18f84ajO+ud3tkmmuniwQsPPOtLHQ7SnLo0ZN5QDni5tcGn7v
	7Gz4vJNPU4ozMBLqdiEuHUFbMe0zBtKPVo1qHeZnoBSNjdc37Mtn1N4z+PVQlTep0fyesQAEc6KaJ
	JyiwGFyYKZMgug6u+5uAbwPs5TXgIdtZznxjNFFgObqK5rHs4EA9g1BMLx8pjJqPtKg/CgiqJa9LV
	Lehf3SbPx4M+Pgpi9tpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbF6H-00000000rQY-3BCZ;
	Tue, 06 Aug 2024 07:59:21 +0000
Received: from mail-mw2nam10on20606.outbound.protection.outlook.com ([2a01:111:f403:2412::606] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbF6D-00000000rP0-3F5W
	for linux-i3c@lists.infradead.org;
	Tue, 06 Aug 2024 07:59:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dds+oNxg4EB8XFxyKvAfhn1BgbCnAaSLrC/v9fhV4opPIEPkXdzD5eyNxWqCHDaCS/5L5bo7Kqg+eBbVUv5uxKRD+oWbk2Wis5LiMsk1gBfaSBpeRpb0CLMJehsMzcgGrRwu8hSfPpMmN2wRNZ3HUrhWNAWh+mjA0RTzqOg1ywc4/H6mgiFsNC1e+NiExOuY2oxbxKpZFsq4z1qikM04rddw4MIWvbgdb3TdXd2buyXx6oBGxBZToxpM4ySK+4K72N08fMDCVX4CWRQ2JyeTvhEu/bB/6KkutdspsbjHXMaYAV/kS4+D6qG3q6gpVN7BF8Kie4eayHWrXfBDQhvOSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0atsmJPLEIiTVCAcMnSzPIm99IKSnYoihtQvdA8WALg=;
 b=eD2a9YgymDla6D5IkPAvE24fN6bs79B3UIP98jdNrsHahamHT2sC1d+jDHqeDbY/V1Rvy274+HQszPG2hVTVcsoELXXL0vcAjHICR9/txcAnqP5mgdGbwh7Yfi9mcUD0xKbg0ySRVOXG3U0SA6ycjBqFcfCAGWK1+haYclf5I1zoAZgwATyfG79ey2iRUAv5OizO9ucVN59oUhhoQwAGPU5TSLy67UvBagaEUL4kFNsD2gAsQWm84uGN2LQELQ71B0c2vY2iG4aeyD8ta3l1i/zTi/OY7aUIlqzoGHNKMYH7SjRWkxATL2kvAeQqvWyojVZDPUJNqdYd8xNFCtIvDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0atsmJPLEIiTVCAcMnSzPIm99IKSnYoihtQvdA8WALg=;
 b=lOCjL0NvJoxyKf9NMRRhSxOY2owGHO/3OHcIKC3jm0nBs4VYh8ARChW9X72ljfN4Z1U2G5yLJwBwlBXwNFlzEBc9jpVQ96e7KXTO9x7/Va3SkwNdCzf74AlcXA5cokrtf+tkYn61OCLNvWozcqBnvSOfrLXMZlTWEg+hrcaBsgY=
Received: from SA0PR12CA0002.namprd12.prod.outlook.com (2603:10b6:806:6f::7)
 by MW4PR12MB7285.namprd12.prod.outlook.com (2603:10b6:303:22e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Tue, 6 Aug
 2024 07:59:08 +0000
Received: from SN1PEPF0002BA51.namprd03.prod.outlook.com
 (2603:10b6:806:6f:cafe::9e) by SA0PR12CA0002.outlook.office365.com
 (2603:10b6:806:6f::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.24 via Frontend
 Transport; Tue, 6 Aug 2024 07:59:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA51.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Tue, 6 Aug 2024 07:59:08 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 6 Aug
 2024 02:59:03 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jarkko Nikula
	<jarkko.nikula@linux.intel.com>
CC: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>, Krishnamoorthi M
	<krishnamoorthi.m@amd.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 0/5] Introduce initial AMD I3C HCI driver support
Date: Tue, 6 Aug 2024 13:28:38 +0530
Message-ID: <20240806075843.277969-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA51:EE_|MW4PR12MB7285:EE_
X-MS-Office365-Filtering-Correlation-Id: d923079c-1d5a-4766-7823-08dcb5eda649
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vdYmFuhJZCPQWqUzJqg4mw/L9plpCHyALy0kp7GTsMo4ucobRfoBpVtkM/M1?=
 =?us-ascii?Q?6Yf55ROoW0dreF6VM56gjwiVRzaaKYS0sVI33Jzg8a8TNeda2BKpV+JnR9rz?=
 =?us-ascii?Q?KcObutiaTp5VuHjQ9b+IcANms8mTK+GGP57MDxzmowPZwoWlsazJSzLl0JIS?=
 =?us-ascii?Q?6qDq6x1eXnG89wE6H96RCF1bKk7JNoEKlO8lLFFG2NiC7E9+xmszEOwAkKKv?=
 =?us-ascii?Q?N0Mb6k/AdS8Cvfs5CLfNPBakzdbwwO1ZuDyFsC+gUdmgjcv4heiZI20Q9SLJ?=
 =?us-ascii?Q?t0AKmLSjt/6QGa2vUv2JSbliv41+vPcxYrZGDbfAqmnR0nmkrNcyfpI4L/Xb?=
 =?us-ascii?Q?OeHMkwRrys1UAdX1/esGEbgu7TddQkz0Yq5EkjfJo4ThO5rUbg+9MmwG1wZi?=
 =?us-ascii?Q?hAEwTmxSbKLf8/uP+u0ZHD7OyHXJ50uG5asFoW+VfEvkReCdISscDTkb0xPH?=
 =?us-ascii?Q?Sz7XYLRBZXGkTEpr2ntY7fRraobVdbWvlwmgrHdrVrLfx6NbNY7legk1ZKHl?=
 =?us-ascii?Q?8LgTbzWXU8/5VnyjhzOGWyFvNupBsZ8wCNNDzzqaWN9IvReeReYX/j2eMiLX?=
 =?us-ascii?Q?//6WGdJLqQuSxgPPQiRqQDX/ZlOtPnTttm0qurho82cFkswXyWdNUsTop/J8?=
 =?us-ascii?Q?u9hY8+39vT6FGjHpY+hrPb5Su9GEdTjJEFNBVFxGdBRC7UgbsHfBV8+d/FXz?=
 =?us-ascii?Q?y1tZiu1lvKG5nU4k1gf7aHQ3emKMZxtCKXeSdE+iAhzOT+vGzCauvo7T8xKw?=
 =?us-ascii?Q?BJ8WbLzzoFwYrVXyvdIe5ZczuIhsNYSdeMjwNy0ik50fzAY8h/5vFrQO3lRx?=
 =?us-ascii?Q?/LVvhvndWEkuKgY3R8ShggbghBgPTHUPwPTSA/qki2vW4yMBV8NnUmM7Myl6?=
 =?us-ascii?Q?kETTAy1PcZx+EwxGjVa21wwZGMzku/4du1vGUPFLnhQ0HIsXjWINt+t4UQo8?=
 =?us-ascii?Q?BkTlCLG6aV1GfuThv46SbYA7TJB8kTb9j1VzRI9tAvIDQpPdJJophu2IoMD+?=
 =?us-ascii?Q?rGkJYmfd6DodwUhXCq8FaPxLodkz4X2H36WOJcWasqg+WkESh13ldTmCJRLu?=
 =?us-ascii?Q?zbUa97F+DPp+j5qYZ4Z+K8tdrUyKfv/5kNUmjUgu8FFjwFoyELje9aE17ze6?=
 =?us-ascii?Q?FpkUSwYxLoUwlYLh+UhtmoLe/UD3BOgn8rwqU4OIQ1UkBQqosMe9I2wQRQPe?=
 =?us-ascii?Q?3nOzvlKQ/pNPZBaKnyK/2+4+wowoszcavmPdwAfBkOIZ4cUeLi7yjxkCrgL1?=
 =?us-ascii?Q?Agx3XmBw9xEHghHxD0Y9vZw+mai5yAJcpBZSpEmv7/jDWQAeRCOXk7agZb5+?=
 =?us-ascii?Q?R3HiTL+lHHsCakD3zGzsui/dXRpeAw3SAvzsCEnhGKLegwbaIwu2SFv86tsG?=
 =?us-ascii?Q?kWJxy2oQVlHxB68Ot4RWHn/z/X4EXVSWok18/G5kL+yYnvYpzvZ9QtsCKdoP?=
 =?us-ascii?Q?ObVJRAu+udk=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 07:59:08.0695
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d923079c-1d5a-4766-7823-08dcb5eda649
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA51.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7285
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_005918_164636_75AE3766 
X-CRM114-Status: GOOD (  12.05  )
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

v2->v3:
-------
 - use MODULE_DEVICE_TABLE()
 - realign patches
 - address remarks from Jarkko
 
v1->v2:
-------
 - Address LKP reported problems
 - Guard boot_cpu_data usage with CONFIG_X86

Shyam Sundar S K (5):
  i3c: mipi-i3c-hci: Add MIPI0100 ACPI ID to the I3C Support List
  i3c: mipi-i3c-hci: Add a quirk to set PIO mode
  i3c: mipi-i3c-hci: Relocate helper macros to HCI header file
  i3c: mipi-i3c-hci: Add a quirk to set timing parameters
  i3c: mipi-i3c-hci: Add a quirk to set Response buffer threshold

 drivers/i3c/master/mipi-i3c-hci/Makefile     |  3 +-
 drivers/i3c/master/mipi-i3c-hci/core.c       | 36 ++++++++++---
 drivers/i3c/master/mipi-i3c-hci/hci.h        | 12 +++++
 drivers/i3c/master/mipi-i3c-hci/hci_quirks.c | 55 ++++++++++++++++++++
 4 files changed, 98 insertions(+), 8 deletions(-)
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/hci_quirks.c

-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
