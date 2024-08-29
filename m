Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F37C71135
	for <linux-i3c@archiver.kernel.org>; Thu, 29 Aug 2024 09:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nFz1NiMG7btkxa5DAjUH3Iow3NzzVB4n5q2bUuogsUc=; b=Lk64HeXJ+W/Dd/
	L4kaCR8FL/EqIqYax3VBh4M77u2i2ddcvUT9gmlfnaH8kcUWAlcNYvStZcH5hIBfoWq1nr+CnbiCl
	ce1ptpW3SM4HumvySBQOsc72Bx6Zl6kLl9WZbLiIQAX4bdwW1aKVOEUW2NIPY0h9Z260Nvk10wHzq
	1IuhY+xT5rlmHabF2xWeqM0yR7qRYJ/r5kZL+0nJUdOBo1FaVIbBGHnhUY3GO9xS1cjYBVf8YwcDj
	/OMsjN7ocWywcijrmndsrjLtHu6ZT4qaEz0POCGls7aHC2SsiPWJTCqtXgGRslM3POEbytAScPuYx
	lfpHl4Q1d/wd0iez/9KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjbI1-00000001KCq-0wVr;
	Thu, 29 Aug 2024 09:18:01 +0000
Received: from mail-dm6nam10on20604.outbound.protection.outlook.com ([2a01:111:f400:7e88::604] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjbHx-00000001KA8-2IsA
	for linux-i3c@lists.infradead.org;
	Thu, 29 Aug 2024 09:17:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pLK3N/n6UUPKOpqL+YPmIVAlYAw8UTPNN82MGJUPTPn8voegiDt7pRn2aVR7X1FmzoAOtYuNVxNhJMuTgl0Ml5rmjAp5aaQSxTU8ERmNr1P5M0zfLsTgodmeP65Me0umLe7PMVgUA9+Gtp+h3e2XpWU7kVzohv1pIuoLKKQLLauCw7X6b5gAGOPNPEEE0L8+36QJTAhfJS4MapHQb+Z8JHOc/4z+VjsETYBF/Cl+CSoxHbYdQ5Zp3yk61e7FDtPjqjNnzWYATDoDIBsyK5u6sTvjufkBJeHZaJanQfrria7H2KuHnb8LkC9cLuwOUHtLKSGoPhZCmWfXEkEIDBspeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g6eJYaUD2KrwM8kDzAh0MWnKQ4TTHBuKIbcYeJ0sewk=;
 b=na0IV8MfL4bMQ1rjMKgXvbj+G+godIJIZQCErm37Q7YrYXZEX4blK8Edg/ShO+rSURO8Tr2FtNXRfbqYrYxJfDPoym8FZRC6GQfPQVqxzXYT+hrvJ2/z7ftvT/QVG0ArU3W/bECzluzIDHUulC4rMMwp/kQMEVpzae1OvaGBYFm2J0JzpKZTtVimob/AKkllgAuTYcNmIFZSLHn1CFI98JNZmJheLWXH+5FjkkYvatA07TAYWXIvMlx+0IsoPjBjU0xdLGkd0U/pHURuXb30WzwJ8fdZgCmgu0nghwWNBvVViZWDLNZlFweHGaB2TkNzc/tLYCZBxrSaLFjvdZVHKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g6eJYaUD2KrwM8kDzAh0MWnKQ4TTHBuKIbcYeJ0sewk=;
 b=jLE7NifZzg15M9LKz6huAaRUjj6ggZunwF17J9AnsOW4dcFfWid1Gq0L38k+8HnGSRN+vo1e2Z/dYEoZuS4a8qLV1QxjzEFoF0+Vz6biTXBsTTGFH3yTZM91tc5hp/xoCCl1XgRZNuia2jBKoPg5mWpx+j6j3/cuy+GlAXlc7NQ=
Received: from MN2PR05CA0017.namprd05.prod.outlook.com (2603:10b6:208:c0::30)
 by CH3PR12MB9196.namprd12.prod.outlook.com (2603:10b6:610:197::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.26; Thu, 29 Aug
 2024 09:17:47 +0000
Received: from BN2PEPF000055DD.namprd21.prod.outlook.com
 (2603:10b6:208:c0:cafe::86) by MN2PR05CA0017.outlook.office365.com
 (2603:10b6:208:c0::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.16 via Frontend
 Transport; Thu, 29 Aug 2024 09:17:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DD.mail.protection.outlook.com (10.167.245.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7939.2 via Frontend Transport; Thu, 29 Aug 2024 09:17:47 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 29 Aug
 2024 04:17:43 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jarkko Nikula
	<jarkko.nikula@linux.intel.com>
CC: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>, Krishnamoorthi M
	<krishnamoorthi.m@amd.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v6 0/6] Introduce initial AMD I3C HCI driver support
Date: Thu, 29 Aug 2024 14:47:07 +0530
Message-ID: <20240829091713.736217-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DD:EE_|CH3PR12MB9196:EE_
X-MS-Office365-Filtering-Correlation-Id: 085e20a6-c1ae-43c5-5a8f-08dcc80b72bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+tenwMypnMroNNVpSFJU6MIq9wW3evx76sQ7Rcypj05+ULUlzN1NYX8HBiK0?=
 =?us-ascii?Q?NIbXpLmmsVjWrsGD7wH11tZwPJ9Jg07oXMrTOpWeBG3tSZm3I2WfgqPlwcg8?=
 =?us-ascii?Q?kL1uQpmQZqzo33cvNmtx9fGX1su7e9Ixkxr+Hq0p4LpDj01hnJ26a4PFlG0j?=
 =?us-ascii?Q?XLTefhbzqUxsJShPxqaZOAKiqvY6BEMDkFclPFy8JerxT3dwHv08EkvzWeRI?=
 =?us-ascii?Q?pt4pKatO4XnlPTwFEJNF6DfGzw+xkIVis9XdhUubXDWoJt5HubZjCMYUfv+M?=
 =?us-ascii?Q?zmCAQSthjhpMkx277YQTubzVPdq1Dy8Xz5h2YKKg2eBKWmsJxyEPuocKYrdc?=
 =?us-ascii?Q?ac4ayD+c1gsge9h4KmamqMFLPM0mN+rPEvUn5sOCgrY09awYRQ2LIKq+pgEl?=
 =?us-ascii?Q?vbHqteqW3XcDICXgdXrtXHx7pAt0Iu3jXBAwMEFFIWm3lwqMCFI6vJ3z/8rp?=
 =?us-ascii?Q?6tvzclca7q5P2JW/iFhxVwxZEw5xsuya9fBMppKRNIUNIP7r0cyGTOWpiHDs?=
 =?us-ascii?Q?jJwUd5yBXjGW0vom6m0wbRhFnucRgPLkYzNNSjga3CmuHSzHGJzrkQSKusR6?=
 =?us-ascii?Q?6hw/Qd8AWcQSEx4kNC8ZIC3xZ0HU0/KjOAvKV3PZKWx32drbZIg17W4nIOh7?=
 =?us-ascii?Q?HirsB9stxFlt+TBBthfMpkIxejDafSg08xOogYNGgWBZY/9ZLQl2eeSnf/sr?=
 =?us-ascii?Q?7WwLXlrc0dw+n4f0kTRuUjPdPYfIoYLCpsr8FMPFx7fnv6PGCyL3UCPF2o8v?=
 =?us-ascii?Q?j2WbvlkkSoLINd5iMKOl90tUpeh4cUCTTdJ5BFPzXLi8JmQoNAUMMXCzqhFw?=
 =?us-ascii?Q?KqV7Of7QckSGBe2ProdGmk/QGoMny0DVXFhr7LvW2SMddG4KmixiBVRwEWwF?=
 =?us-ascii?Q?bBKPbiTbGCFTKBl759WpgSIfsfnXFXUSjkkimr5/ptZiaM2mTmxQG+PML4V1?=
 =?us-ascii?Q?drPI3D76OtEDg6Ka0T7h6HhP9UkkF+WTLUZj7zfNdUT6A71qy01LU1Q4OTu8?=
 =?us-ascii?Q?KR5+A+vuETG38W4Tv23STXqeGWDB3C4E/HXFn3kRYa0PfaU/W0D2DFOwTIy4?=
 =?us-ascii?Q?I6TzWFXW8sdOvHaO4FI06BqZh5Ugu2bBs2DV62vOb6VP0LVVej0ylYa0wv0H?=
 =?us-ascii?Q?bzjOyr9Z77ZdrozSPsW17PLqyw0OFCNM2hTQeg6ySZfHWZN9bF5RwCMVPBi3?=
 =?us-ascii?Q?2Uuy6nTkabKY7Qbhhaghe97T67EXLWLjvdYrL7EwUdkRAHO7+5rfkMC7gHtG?=
 =?us-ascii?Q?54l8ACUJAR4BArb5AbMZZZ5brKqjzeod95JFbxbZ6cf1HWpTC2iPi7Xn/xc+?=
 =?us-ascii?Q?QS7kWwTJe0tkYzD5JKStxMYNA/nxSVylAFQAUndEzj398lHf5ssFNLVavejk?=
 =?us-ascii?Q?EEz+c9zTzs9n3wZDJrllXLOD8Q+gsK0+/PhSVc8eGLaSGoxZ5Sm5wuQZNW8G?=
 =?us-ascii?Q?3LvHRSwfpUs=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 09:17:47.2319
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 085e20a6-c1ae-43c5-5a8f-08dcc80b72bd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9196
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240829_021757_619718_AC4592AC 
X-CRM114-Status: GOOD (  13.16  )
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

v5->v6:
-------
 - Add Reviewed-by tag
 - Update to variable name from "pio_mode_support" to "mode_selector"
 
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
