Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6018D2E017
	for <linux-i3c@archiver.kernel.org>; Wed, 23 Oct 2024 05:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PFnSbfJiwW46xQHC1p0w38zucn8ZZaBd+P2hiHx8smk=; b=sG22MdT4sDbpLC
	II99IqKGMs+vV7HrFZGiPzIEr6j/FRcrwtxjgr7s7pCSb9wyynFnz7VC+ZEwAmfzJV1fdmwI7oj2x
	UABPtMKqRf1in0zx6yldCcarhyGMsmaA68UOIKgylNDHpAlg8Hyz+0yrVicmx47A1k5DcOXJH2uBX
	1VAuHqLmWxqqiNmlCkCVyXo/blEZ5XrrSRQkJhkTpU/QsgOCQh1513gzwTr5H+gKWX3pQ5Llv05Ls
	tcDUR9zxyYktPGYt7sj3u9riWUPkuM/vQDm8uvYm0D/YZ6GLilR6QgHHXz2O0PLoN1U3E+v9x63Om
	H/P6mcJ+4BfN7Ansve2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3UIW-0000000D7Ao-2xtP;
	Wed, 23 Oct 2024 05:52:44 +0000
Received: from mail-dm6nam12on20602.outbound.protection.outlook.com ([2a01:111:f403:2417::602] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3UHo-0000000D6wY-1T0K
	for linux-i3c@lists.infradead.org;
	Wed, 23 Oct 2024 05:52:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iZ0eEnY8f63TJjHgB2jDqOwKmBiIn5ijtecCck6uLMULne9zDwaGbPxytFLzms7OmOOygkmVcs4tJUqvEd8m0PX2xMajpjSCCop73+X1rHBrfAGUMpUsdmkerzv7w8aMDEMBv0FNGNxNNtAeW2FrxE+wSFDVg9cXm2G/Yl4HZHbpuqykgVJhjbiN04rq7RnIWL5vnE+4+oJxfObCxNJkwA+PK+hU2Na0AlGjj3bHvrRFakSFLpNFt/7ZrZlrqJoXsGFvh3fo7WUauqpPxOnOCYmmIcKPGeMDnFY9YMsmvjt3BhKMGX9ceGGPaTypmphdK4nIl63LcsDV+Gt8AgthlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fyCntB1VLsro0rubp3zJRN0tGl138L0AFiJhGCW3vVg=;
 b=lz4zBtYF18rAVzeBnLUEYdFrcxCGGK2zUuNju6f2eKdWLlNRUAoR12622iNv2mYasaSIY3l8bSdk3IzQNeYKv7UW9ASrnlvKBY6nLdCNl9OmgZr73DkWs7f2ij9hBPDczQQ/0/8cNV5eGsEsndBbrCcOPU0CMXp7950J59wXcjHyOcMUGoIfT/ztHlyCs8Kff3VcUcoEoR/gMPV4RFXlLj8bWXDm4PHbYz/aHyZXPNSJuhIZb3SYmZPq0na/+4CqIv9FcxW9yfwldxLKM/YTYQNvc3EMKwUAYbwjCK3Fdt62gUD3kn7NS+1e2e5A0rLbJZ+HoqjsTnaLwiIbRr4Nmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fyCntB1VLsro0rubp3zJRN0tGl138L0AFiJhGCW3vVg=;
 b=tQnkE3WVBNl8n6DPO8J+NeQv7KXQDHdpkmGSaOw4nX6f2VI92aatdgn2cmSeKDAiqvq60L1GNcbd+835BHe/dHK2CI6QUbOtsxJmvyjrOXazWD58L0PHpyAehEvIO/wjwJkN6KI9RSLRtp9R8gfeppr2qeQ1AHQKWH34qBnKRS0=
Received: from PH8PR22CA0008.namprd22.prod.outlook.com (2603:10b6:510:2d1::20)
 by MW4PR12MB6874.namprd12.prod.outlook.com (2603:10b6:303:20b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17; Wed, 23 Oct
 2024 05:51:50 +0000
Received: from CY4PEPF0000E9D8.namprd05.prod.outlook.com
 (2603:10b6:510:2d1:cafe::16) by PH8PR22CA0008.outlook.office365.com
 (2603:10b6:510:2d1::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16 via Frontend
 Transport; Wed, 23 Oct 2024 05:51:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D8.mail.protection.outlook.com (10.167.241.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Wed, 23 Oct 2024 05:51:49 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Oct
 2024 00:51:46 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jarkko Nikula
	<jarkko.nikula@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 0/6] Introduce initial support for the AMD I3C (non-HCI) to DW driver
Date: Wed, 23 Oct 2024 11:21:12 +0530
Message-ID: <20241023055118.1400286-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D8:EE_|MW4PR12MB6874:EE_
X-MS-Office365-Filtering-Correlation-Id: 41b1beb6-6282-4eac-64ae-08dcf326c97f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DwfTDvkHFdG11LcCS61mE6hidY6iatoNvXM5akAmtR87o4dtFrSHwkLyYwvn?=
 =?us-ascii?Q?hIUUEpFxzxnw/a3QZhcRhcVJRvxKPgEWDxBhPOOQ32MCQPqvfa4AbfvBBkJr?=
 =?us-ascii?Q?2n3QwQlsE0eCqblwZQxkWQlejTkLDJp2kUkLs9lGZYRzU6ymw1GctbmT9qot?=
 =?us-ascii?Q?zqNgx4bLIFzYlRz0mGbE5Xbsy3aVsCRL9WFYQKS6kevnX1wd8GkgQtOzA+Pg?=
 =?us-ascii?Q?aEvD+xiVikpXYrMuiHuDIecocZhJp8hbpa2noTuZbsdMZqUQ2np8L7S/gZOq?=
 =?us-ascii?Q?DPGI5BVNXkmQN67nj4dxbjDbY3pz/EMgkwvT0dhZadNCX1hJe4aVXS73v/RN?=
 =?us-ascii?Q?f2auSk7NNf8ZdZj5/Q9nRYRYMmGr5e86NlqlAOwP53i5uSPt+ERT5fWvAlhF?=
 =?us-ascii?Q?CCRnIalG+1/+WAPUa1r7Gk+6rSQYoOzrt9E218VW1SMpBGgfl4Z/r3hJ+CGy?=
 =?us-ascii?Q?KXFTeN7SVmilJuayj/VvmYFUtyKsraTMyswEJLDEbWMUiYeLyE4PcSBoQ4e3?=
 =?us-ascii?Q?tSubxGWuHncnGCp+GoVHmxyf1rG7Ke8nlgwqxCvZOdMMwy0/Xi8735AQmmo0?=
 =?us-ascii?Q?/0iKJON6lI5w/R+EUhv4cUgb9BL4gFKuXcr2IIA/Z+ythBeTGeLwh6fYX/sO?=
 =?us-ascii?Q?RYI8WTSVUnybhV8DZh3a3ue6OgxynxuHJcd0e6YwvpBdn3x0W+7oCOeAfH90?=
 =?us-ascii?Q?PyTuLNrYYw7zYsVhuw3nXnZGZ4DW6Ffkvn8BkjkXSjOlfeue4goFCWf3cMmv?=
 =?us-ascii?Q?79FzncZwUM14MNuCcodOgczIfxMQCaE57aNk94iY140aNtHAfb+TfB+/5z+s?=
 =?us-ascii?Q?JhVn7DnFLbeduqAWQOewANmwVbFqwL9Jjkt+MzY/dRVmwm8w5sI1T9310bnj?=
 =?us-ascii?Q?memuhqGwYcg3ECquYO+xEAQv3H/94Mn2cj6TLoUR+V9+++IQ7oshNGe36txl?=
 =?us-ascii?Q?S5mVw/W48foCdSLZ8cgNthDRchRBowEN/As4l6//+/laL/GUWS+X2pLGyJxZ?=
 =?us-ascii?Q?apyccP28pVmmJ/sLEm4ixxPFUhx+ApvsBv723gMOXXTpZ6yQFDj16vATNXtZ?=
 =?us-ascii?Q?wiNZ7vuKXoD4KXXOvSyzTVt7waxEQ4XSIOKTgDae9zJZX1TvQCAyCWpSNUiB?=
 =?us-ascii?Q?88i3QSr0qHfXR/38iej+JapF4+8G69TBMGkdZ4CoHS4CCeHwZYB3v2OGcjaJ?=
 =?us-ascii?Q?Hfsej65TvPMIbnPNEGluy0i1b3RSZJF3bS1eoQG4fXTYe9ZcKzq2R3M9dVxQ?=
 =?us-ascii?Q?nM0F6bRTRGMsHztdykuiA9G9y8rKpbAMTZdpUq2n01rsCBibNZWqUt5ksULw?=
 =?us-ascii?Q?f9/TQvl97BdCf/Ic7C7rDONcYyBRI7Vp0QtRVhwX1WiXNoclR/tv5U+4uk6V?=
 =?us-ascii?Q?mm5QmYo5ebf95KCGlS7Cf/kkRz+BGcpIxj1hZ0/qny8HkJa7eA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 05:51:49.2925
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41b1beb6-6282-4eac-64ae-08dcf326c97f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6874
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_225200_463195_9322E531 
X-CRM114-Status: GOOD (  12.61  )
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

The AMD EPYC platform design has DIMMs connected over the I3C bus, with
each DIMM containing three components: SPD, PMIC, and RCD.

To access component-specific information within the DIMMs, such as initial
dynamic address, static address, and provisional ID, ACPI support is
necessary for the I3C core. This requires adding ACPI binding to the
dw-i3c-master driver and retrieving slave information from the AMD ASL.

Currently, the code is closely tied to dt-bindings. This initial set aims
to decouple some of these bindings by adding the AMD-specific _HID,
enabling the current driver to support ACPI-enabled x86 systems.

In this series, support for following features has been added.
- X86/ACPI support to i3c core
- Support for SETAASA CCC command
- Add routines to plugin a SPD device to the i3c bus
- Workaround for AMD hardware
- Add dw-i3c-master driver with ACPI bindings


v2:
----
 - Address LKP reports issues

Shyam Sundar S K (6):
  i3c: dw: Add support for AMDI0015 ACPI ID
  i3c: dw: Use IRQF_SHARED flag for dw-i3c-master
  i3c: master: Add ACPI support to i3c subsystem
  i3c: master: Add a routine to include the I3C SPD device
  i3c: master: Add support for SETAASA CCC
  i3c: dw: Add quirk to address OD/PP timing issue on AMD platform

 drivers/i3c/internals.h            |   2 +
 drivers/i3c/master.c               | 157 ++++++++++++++++++++++++++++-
 drivers/i3c/master/dw-i3c-master.c |  44 +++++++-
 drivers/i3c/master/dw-i3c-master.h |   1 +
 include/linux/i3c/ccc.h            |   1 +
 include/linux/i3c/master.h         |   2 +
 6 files changed, 205 insertions(+), 2 deletions(-)

-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
