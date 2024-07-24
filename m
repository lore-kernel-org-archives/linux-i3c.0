Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF01C3DA61
	for <linux-i3c@archiver.kernel.org>; Wed, 24 Jul 2024 07:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NJ2jfhEikbKsV3iO2HQozed2lPeHxWQBrJYa8To8DdE=; b=tCZvb269UvL73W
	ggATTtqNGAYpcjqe2Lf4kbAbg+4/5AXF3YABNrZmma9N9yRA3M7lsysJpnBb8/K67fvJHWvp49uai
	sYWcEu/px++bevZ2f/iElfNwyMXuELwla2wN0oTtMvLdHsCkQP3R2Mcq8xxKXHSxbokE29ZartgO6
	6kzoIXvUy8OfcR7u00v+mn3qwKs0c4FwQQS4OaS2hvg1BQoQ2jUbhPVgQjH5R/tgVM3IuS3KqDFqk
	TK/eu4uTaKGet9IT6182uH7FEiLvLJ5+U+jJYyBawT+nqkBQSPi1NihvBI64edB7AsDwLjaYJMCo2
	uyAfdKDk+Gh7iiM5aN9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWWBm-0000000EarL-1wfo;
	Wed, 24 Jul 2024 07:13:30 +0000
Received: from mail-bn1nam02on20619.outbound.protection.outlook.com ([2a01:111:f403:2407::619] helo=NAM02-BN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWWBk-0000000Eaq9-0HCq
	for linux-i3c@lists.infradead.org;
	Wed, 24 Jul 2024 07:13:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mrE7wtHGVfD+yazKoApY2Evqs7kcb3seoD5fY10fNQ++LqsZqfnBI04PlYWqxvVs3bLDCPgBWlRZFdUWH2bxECOYRKoz2ZT0dbcgGaRbPsJY/3YsgSnZ63wYLBbEDL972tCaJFbmN38ILs7vJYp7KWPsYg9PyedWtPzUp33eLkLaAZFwBYSx1/C/U/NzdW/gvaiML7Pz/UHAqhPLIWdLoflnUUv/7wjFP9PNdtYHg2cmKXmgUFth3FI2cJZgLsteguo3MVB6nP/gHeGqofl3bfgpQa6SyLrIs7m4XxrjXn9QSHLMftvee4xeai1px4tB5lG+XxO7iaVgCBQQ6YNY8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cEwNApABykYuCcz7eUAEN8wjeJN4gEDzFQcfAZ0wNCs=;
 b=PE36J+uBETBOmzS46H27NP4uk5G3vyz5tUpg5IlYQyIdMDl7bXeTqEJEth0RBFDIW26ZE+zmWTXeudX5pm8aKfoY0YZmyxzwJjnKKJe84ES/B/QCHalbfPgzcLu/Tlfp+jupLw7qJdVbK/0+kwKR5TzblQ1PhIULoTnWst2pGGcL4nvSBodtuQGvKbJXQf0aphKPJEiHyA6m8cVdZ6WK7nZawU9qiPoIyR/O2ITcoRvCvur4Wz/wxfV+h0CEqXbBJ/RyKxn+9COFiqr0qlqx6PF9rmV94DXUBoV/ibqVyAHKuNmFtUQqEqHPsCA6T6AcAuwEDxAONJnXpZYzBGpREQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cEwNApABykYuCcz7eUAEN8wjeJN4gEDzFQcfAZ0wNCs=;
 b=LsKmtxRiajXFRRKXpM+2olz2rWnE5Q6l/+o5w6vPziW+fNAtizbxkIPs8LJ692JXHvB/IwGqfGV4fMAHHiSAK+6Zwn0QG15Vdxpakosr0rHKDnPvFf8/+OIq1cDA+swlidh3Fq4Rc3PoiBkX/cduXeZcrUzkSfJdGWsMeVeWb9o=
Received: from BYAPR07CA0101.namprd07.prod.outlook.com (2603:10b6:a03:12b::42)
 by DS0PR12MB7996.namprd12.prod.outlook.com (2603:10b6:8:14f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18; Wed, 24 Jul
 2024 07:13:23 +0000
Received: from SJ5PEPF000001D7.namprd05.prod.outlook.com
 (2603:10b6:a03:12b:cafe::48) by BYAPR07CA0101.outlook.office365.com
 (2603:10b6:a03:12b::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20 via Frontend
 Transport; Wed, 24 Jul 2024 07:13:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001D7.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Wed, 24 Jul 2024 07:13:22 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 24 Jul
 2024 02:13:19 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jarkko Nikula
	<jarkko.nikula@linux.intel.com>
CC: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>, Krishnamoorthi M
	<krishnamoorthi.m@amd.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 0/5] Introduce initial AMD I3C HCI driver support
Date: Wed, 24 Jul 2024 12:42:40 +0530
Message-ID: <20240724071245.3833404-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D7:EE_|DS0PR12MB7996:EE_
X-MS-Office365-Filtering-Correlation-Id: 181cf4fd-4006-47a7-8dfb-08dcabb01a5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZLpG1YrQXrNmevhhg8cwb0TGCvG67HMUUIN9EV0hivkNWLeztvwuFkzXR7XW?=
 =?us-ascii?Q?+VOCyuk0jvjLxxYPJF0OPjtYhx88/nj6Eh/rIA1xL6yBwo9WABexdnt9MbNn?=
 =?us-ascii?Q?AvKHGMmGsgDR+FxcRGiySTgJ0NGVhdEoDTGuTFMYUCoavY5QQqMZjbtEvhVi?=
 =?us-ascii?Q?7Xso28X4M7DUQHZ/G+8FRF8MGQpE2lKNbThx22jKStlQMMkXdAHvSN/9GKLy?=
 =?us-ascii?Q?KQYv72nz+8FFzneWdKPGgo7vp9s0jfhqCi7sLAJBMylmhLlh/ToAmK/Tk0y2?=
 =?us-ascii?Q?U/9jWOE75fbwjkGCzJHrJDVeUZbtaiT3rZnIeTZuG4CNKKbY+DbDBImZ22CI?=
 =?us-ascii?Q?LBHuNX5Dx7rkgNK02jdaI1nWNLeOolqojipwChF15KNKYNKL/+deIYtHKCyw?=
 =?us-ascii?Q?YYKo63qw9PGVfPoYftkem1DL9C2FRCYGDMiQuaxiH7G8ce56hZqjGbNctWlS?=
 =?us-ascii?Q?OYucXKlXATX20z5VIiJeKLlJCuqLr1PrVJf+yomMClrXM2ButRU7Wat+bm8i?=
 =?us-ascii?Q?kkHFwxBqxs3OhWvEo/RcQtagS7Wu/3+FtAHK8fkIESr52dDjl4Iz8REm23gl?=
 =?us-ascii?Q?F+e75KEYUyX3uKnJgGKoQKspuV8JECKjEsYw+m1ew7xDfM0c6fkeU6zcaleg?=
 =?us-ascii?Q?6yDEUlyd8FXbLkMrV370CiQUHRYcVUpnGEEm76zpAuVV/fGSgHg1DXrPynTu?=
 =?us-ascii?Q?exbRnw8s9fCc1WukoHbMtpqrdh1QBxb9JhVtHxesOItlwiefZAwl1lNuCaoF?=
 =?us-ascii?Q?oJF3yDkiEt68ynF0EfM0li5UF0QAMFVCyDsFy+oh/o2f9WkpGYDxKDBJYe+P?=
 =?us-ascii?Q?bPn1NUe8/qwTA4a+wThcI/+GbdZ3yS/TpDLFVOOih3Iu8+z8/NJ4j2SNozUB?=
 =?us-ascii?Q?HV23PtfuYu8zfn8FbgLadLttyfSONRxUqC2wucVL5pgfXhBg81Rrn3sP06k8?=
 =?us-ascii?Q?U3iWhepuqgJ/fpLea7WiliPkqO5doCF8nV1pFxTSH17H8urerr41LXdFMEl8?=
 =?us-ascii?Q?JDKGuSmelb2NZIrA3UWgM2mEMHPVvFJeV2WgUkT508UcochexgW3jkHgdrfL?=
 =?us-ascii?Q?jrGEDmAfSe4xEc/HypNjUzQdPmTfEUXC9A66FjGcBU4CHp36e4T84sE6WRmS?=
 =?us-ascii?Q?0YWLd2tf+CZey7tq9gSClz/WIW0BN3ePZYVhXgi2ZslvpzTwRXiK/aUUr9H/?=
 =?us-ascii?Q?2jMI2YAux0nUKY3oTegPWOS7s9nFELE2ggtRzIHKLEzc2SYDeGC8V7GScnoM?=
 =?us-ascii?Q?ZmVzDL2BIDG6r58kqSNtrF7w04cdxnN80YOn03BxtwpdakgOhM1ZF5KSMGJE?=
 =?us-ascii?Q?l7pxSEo9LloSYuAdVWXM8//wjYIh6b3aa+bdHwI+SuBTgm2a8HBbTYCraxXc?=
 =?us-ascii?Q?dFrgP52EyIIszIwaAjqSooWlznAtmf+eEtMUAlZt3cSUr1EQCjA0mXZdZ10z?=
 =?us-ascii?Q?kOQ4va08UpU=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 07:13:22.2356
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 181cf4fd-4006-47a7-8dfb-08dcabb01a5d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7996
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240724_001328_132799_7C3E11C3 
X-CRM114-Status: GOOD (  12.93  )
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
 drivers/i3c/master/mipi-i3c-hci/core.c       | 35 ++++++++++---
 drivers/i3c/master/mipi-i3c-hci/hci.h        | 12 +++++
 drivers/i3c/master/mipi-i3c-hci/hci_quirks.c | 55 ++++++++++++++++++++
 4 files changed, 97 insertions(+), 8 deletions(-)
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/hci_quirks.c

-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
