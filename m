Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D00C2C531DC
	for <linux-i3c@archiver.kernel.org>; Fri, 23 Aug 2024 14:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zh5rOCx3Ps+lZo1DjQXe9TB/jTLy2ThhMHyk3/o0fqU=; b=TZ4JwbVkryBuER
	Be0VCKcJY1z/EeBsa7VVL/6QqWrS5BopzAHbbIDV8yxK8bzkiGEwbJb6t0p3fXguXluLg8haU5Jz/
	FnamtOG1BWy/2rfgdhbZntkI1pTD/wwX0DhYIK0BZiogrQy54axaUWUfFWCf2xJsjz7CNgZXS4sEl
	hhV3ARytviVlWHEFzBNuLXJt+nKzaCVX0nrluLkOig0/gW4qwp+iZs7oGEtyEeyzND4fjuavjvyYd
	Sy+qcMNGo+UilSBw/9l/N8Uteb1Z4W4GX01oIiSDodA/SaQSfn7ZAxrGCw5KAt2pcSeUYE0OqcKnd
	HmBwfZbGANoixlbvNVhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shVA3-0000000H4DY-0yzX;
	Fri, 23 Aug 2024 14:21:07 +0000
Received: from mail-bn8nam12on2061c.outbound.protection.outlook.com ([2a01:111:f403:2418::61c] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shVA0-0000000H4AY-29XT
	for linux-i3c@lists.infradead.org;
	Fri, 23 Aug 2024 14:21:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vfbQWX501Ki1/xoiT4GXfdFrJ3fUtyx6cc+VHsemF5nCG/0MHvSOEo9KJDB0cGxvpsGf3iHTjkAMxdcJN3gLr3aP4ow/dYg7iGHNfc6koJMO1xkTAn7b/oSxf6o9cIL5eoLkMBZXhcUWoaofOWJ3RxGgsdbdFTxaGJnWWKqPMq54ACe3S7pJHe8V3m6P0Htd4SjkNPJtelF3SpxN5yJaLcORJ2aJJfUNjhkEvoG0bkaR2vTMdsbAnd2UinPTgOjC2bESCZWXUPXGDMxuPlXxw+xIyDUwiXmEdnKJjRyJ7danA0O6ESbfYr5UhLOd3nrIRSRqS6DVhA0VyzWKQuJhRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Z+TdE3SFlAvXoB41sW8DJQv0DVmqxEN9Y3791LRtWU=;
 b=C6jwzXhIWvlfEUA+ZrbaxWMUVPRX+xqqbMsdpCnkpJv2e7HcpLXfcuysNpgNalQY3OZ2YrAGVR3CjD3STT3Q/Qm2baP9P9HLM+0FiSB3YoLqggxsAxqmOSub8aWd0Sf/G2zrxofwkXdy3E82aLXlPX2P5FgpiIhkMHUwwOu/nVroR6ZIqbDimTf1eRmQ4wAVfuVj277NIb4EdV2bEYh6yjmsJz36NUEkcIewYkHi/FCzdnYxCScaG4MC+aUdgm7Ps+gfh2vfBiKOiMKwFhUZTabUJ9ip3ZhNVenfOaifaYFj7FlGxQ4YHyhmYamu2Rak3iYyghaay5GkRqDRqaSQaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Z+TdE3SFlAvXoB41sW8DJQv0DVmqxEN9Y3791LRtWU=;
 b=39QgOPtkcrtGoF+dk3duSnh5dFKoM8ovA4ei+R45dxlPJPcpBo/leeoMxZu/FNMgGOTl9Xm2HIxyUuiePVysQgPvMXkzanE4tWAqfOUnrHR+cj45eSjLoOM4sV6E+1tYd9sjhJWkXv74niUTI9FJE2v3B8rIvAyW0bKoen+dv3U=
Received: from CH3P220CA0024.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1e8::30)
 by DS7PR12MB8347.namprd12.prod.outlook.com (2603:10b6:8:e5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Fri, 23 Aug
 2024 14:20:53 +0000
Received: from DS3PEPF0000C37D.namprd04.prod.outlook.com
 (2603:10b6:610:1e8:cafe::8) by CH3P220CA0024.outlook.office365.com
 (2603:10b6:610:1e8::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18 via Frontend
 Transport; Fri, 23 Aug 2024 14:20:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF0000C37D.mail.protection.outlook.com (10.167.23.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Fri, 23 Aug 2024 14:20:52 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 Aug
 2024 09:20:50 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jarkko Nikula
	<jarkko.nikula@linux.intel.com>
CC: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>, Krishnamoorthi M
	<krishnamoorthi.m@amd.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v5 0/6] Introduce initial AMD I3C HCI driver support
Date: Fri, 23 Aug 2024 19:49:11 +0530
Message-ID: <20240823141917.692336-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37D:EE_|DS7PR12MB8347:EE_
X-MS-Office365-Filtering-Correlation-Id: 82ccbad6-b497-4dab-9d35-08dcc37ecba8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jPxt9N55koIyLhd0Ur0ratFSRM0gIDwTnLq7rBXfLdUM8esbhfwFD3mJFrgO?=
 =?us-ascii?Q?GbfzQL7xCvPNW9rSM46IkuW8F5+QOixVoVRaBuxA497HQvK4+j+YOHdnD3ao?=
 =?us-ascii?Q?uP6RDDBJt5NkWih2nd4GZZb6fl3TSRzoDjoA3YKUhEAyIM27oWeIsueV5OPP?=
 =?us-ascii?Q?tj50l0I58FAn1E1efJ7hyxbl0rHeqdm4RRt+XWW7f8kA+gcGwp4ynJ/AmF2j?=
 =?us-ascii?Q?TDsHdIKVxiBvbU8H4b12kGhmPqgkLXTrDmfZJq2x1uW+o6ylm1EFgvecrG8J?=
 =?us-ascii?Q?UsWFwl+RzC1OcnryBILs3q8KPyOUggHuSCntH/BeO+2OisGvxKR4Mos3+UKE?=
 =?us-ascii?Q?TLBLbDP9UMLf7EZlljGDaGPHfPoYCc+JjxuuYOhhD3Z8k5iZjhgNjPms3aCC?=
 =?us-ascii?Q?1wiHTT9Lk1ulcYwXWuBhHXjWKG1z3krAy2YePO6N5xP82HUDPuKMfeUX/toU?=
 =?us-ascii?Q?TURoh+gusuze09AVF79RdmJeKLWfwofC0BtUKaBLfbQ9NeI8jc7h4eMu4TCw?=
 =?us-ascii?Q?7qjvEKimPOQhYw6hxlHFN/oSxqnXLJJiiIsYngUW6nQeB5L1nQxr8l7hrCu5?=
 =?us-ascii?Q?No86El81SSkGT5Ml/d4c0tTKhixQmQDAkDNjTm/lBFrON+B9zE8wH1HA32co?=
 =?us-ascii?Q?sZSsF4EoMq1jFxoM1EO/y+kWYOgwqeJuuKZ1sc3h+8KJI2zg6Zo5bP3voHRq?=
 =?us-ascii?Q?RtuYTn9fvAQpEsyGQwNI/iiaeCR7mZpCyenJ2GTsVnR391KqyNfJxhDV+Pbx?=
 =?us-ascii?Q?hAK21pCDwiRRgxw6ZQ0gHtNtlz6/oI2KZ4Kn1uSlaBMfNj7FYFOiFzmdoKqu?=
 =?us-ascii?Q?7vsjm1L6F38YM5aP55AA5iTyoLIsnGbo367y5No8amUJnXi8ia7Ol/zXf4He?=
 =?us-ascii?Q?2bnv77Qic7ZXGOEdydnyuq0dQDoF25q4lWtPaNR18CCUFL7J7LTky2RqFN0K?=
 =?us-ascii?Q?TjNqDZSRpvd6bNzknPGOEryzX4Ds+uwxoVs3T6yPk9EEWwSYygh3CMfcHVtA?=
 =?us-ascii?Q?D1M9DJmoBrBWd8amhyqS12xuYCtxGDUkk9coo5nw9kyhJl0xQb+fSJhMoDWB?=
 =?us-ascii?Q?ksk3//Enp5LO+IQBe+c2iX2LXg8zjydbhNs3nY8JxXT4nxLtpOfJPivKjT0K?=
 =?us-ascii?Q?HxPnE2UotJ3cdo3hxaprwV9rTuIZE7Kn6y7/OsvH9kY5EbZ8WgvQ1xJsObxq?=
 =?us-ascii?Q?wB+9Y3nYoRRY5K7sf5QmY2yVKyRcfJOh16hStExpBMnoAxhafvWyJvxEU5Jz?=
 =?us-ascii?Q?SkmEXjOxLEwy9ZiqrtEJy0+nAkhhIc2lykS6G+3ecGKKdkbyoYp/vW7tvbCO?=
 =?us-ascii?Q?d4K8LoeKtBp7ihDIAFN2qwVQDoa1QcxEXBrRAeI6+MnvRBuLQ8B6cjNe6KXB?=
 =?us-ascii?Q?HJYaX8GlfmAQwJ6tbjONyZvHX5x+tRxJSEVE9L87CWQ9Fp/5O5o1yEon0yIf?=
 =?us-ascii?Q?v09q3FYtZ+g=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 14:20:52.8794
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82ccbad6-b497-4dab-9d35-08dcc37ecba8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C37D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8347
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_072104_576764_769DB7E4 
X-CRM114-Status: GOOD (  12.14  )
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

v4->v5:
-------
 - Add Andy & Jarkko's Reviewed-by tag
 - Handle major/minor number check for PIO MODE support.

v3->v4:
-------
 - use AMDI5017 as the _HID
 - use quirks bits within the .driver_data()
 - Add Reviewed-by tag

v2->v3:
-------
 - use MODULE_DEVICE_TABLE()
 - address comments from Jarkko
 - split version check and quirks into separate patches.
 
v1->v2:
-------
 - Address LKP reported problems
 - Guard boot_cpu_data usage with CONFIG_X86

Shyam Sundar S K (6):
  i3c: mipi-i3c-hci: Add AMDI5017 ACPI ID to the I3C Support List
  i3c: mipi-i3c-hci: Read HC_CONTROL_PIO_MODE only after i3c hci v1.1
  i3c: mipi-i3c-hci: Add a quirk to set PIO mode
  i3c: mipi-i3c-hci: Relocate helper macros to HCI header file
  i3c: mipi-i3c-hci: Add a quirk to set timing parameters
  i3c: mipi-i3c-hci: Add a quirk to set Response buffer threshold

 drivers/i3c/master/mipi-i3c-hci/Makefile     |  3 +-
 drivers/i3c/master/mipi-i3c-hci/core.c       | 36 ++++++++++++----
 drivers/i3c/master/mipi-i3c-hci/hci.h        | 10 +++++
 drivers/i3c/master/mipi-i3c-hci/hci_quirks.c | 44 ++++++++++++++++++++
 4 files changed, 83 insertions(+), 10 deletions(-)
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/hci_quirks.c

-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
