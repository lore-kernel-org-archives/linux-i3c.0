Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B14C52D7C
	for <linux-i3c@archiver.kernel.org>; Wed, 21 Aug 2024 13:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zXA3J+86XdiQPC8UDo7I0b5z0Rg8ausIoHlB27+33qA=; b=ims+UP5cn1Q2o+
	KJNliLNxymqNmVqy/UI3QbfvYuuDdKJDiXB3SoUrZgzgU80RIPyi5k2e61kuG2s44t4U9xRJDdaWa
	rOrH8KYKnruj3YkaqhenS7tJpPDwvV8eq/PrLj4Hu7Y0EQIic5SwTHJC8gJUhb4+t6jTMoT2H9iRp
	GVVD777MU7gfQE6IXYxmLxbf9Y1UEE+ikNykoDhMNUp35DNu1T3r0OgwuTSf/FgmPT7Dfy23nHptt
	bOl3UZLPqrzvNJgHnQN1XnWLSTT7LWAF9KqXojZoqJvBwFcnbteCb+27z64lfz3i05+Il+f/G2Arm
	WsU1a2CVzoImkMFCut4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sglVt-0000000998y-0VT0;
	Wed, 21 Aug 2024 13:36:37 +0000
Received: from mail-dm6nam11on2061e.outbound.protection.outlook.com ([2a01:111:f403:2415::61e] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sglVq-0000000997q-06Nk
	for linux-i3c@lists.infradead.org;
	Wed, 21 Aug 2024 13:36:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w/p2Tt3X4b1KzmAd44KOz4IUVmW6x1cfTUAYehu7PdMoLGKTFzRbwHlN8Klz8sqRITW/RHdq+G2QWfq9hrSC/hsOnkByefARe6Ix123bsJPLypwIOE/0POfEZNrSc3qhpAgKlbl0E9zP/gK9hdpTC4mbc+17WISbM4pvo9QNIPJFxvRpF8A7iI1zJtdI/nlsc5LWzEh95biAZjt48GtkXmirzy5YakhdXkN5YTGlyyQrUN0uDy38OYwQbx2jR1DtFdU20/Xqe0tQ+Y05I7f9QhgXz+LqE/PTLhPv6xhGYC5lSYtYszcwQSdHgb6dL0HWOGYMVneXyR3oCpgj6l05Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kO9XXcYzkynjmrliLcKf8WL28zG2iOhuUjHL8J3p6cc=;
 b=R8ZRPY2tqYOGZNrHr4+LuLO54cy70bLgLsLZwEoRCkA/E7ItsIvnB7TyrzLDFOmtw7idXia1Jd1h1kSzrAf1LMl2NC2M2gWYVy/QHYVvyOgNMfw4ir5NzTzGUrgB0AdjBwB9isAmJv/ZfI6+q/PQuG6chHzQm9hp60+S+8JAGoQsfIILmS15LFBh3d0mNktFRNvEjmNsIv9VV5hPe6F5QzyFpIpNKv8DM2SibaQ9ocmUh/qpBCQvgeCtBIkbXON6JAg60SZDv9vhO4jQiPUoO/LAgrekw86PxmOJw3EizACCfLoiiy/7swZmi8Pdo4GVmY89/nA6BCIzPd5debQNuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kO9XXcYzkynjmrliLcKf8WL28zG2iOhuUjHL8J3p6cc=;
 b=4n4T7C/XxvSy3RtAjuEvL75uJk/EzAmuig82rAVfsXhpPj9xZPGZSjlmmj0alWwrehN52OhUWutn4z/gx1tYX952wQ0qZ37jnMkczdiAa7Rzsbl/Tx0pfMQn2CtcAc+AetXBVG8iyN+f4bI1JRSGOi9rDwawsi3vHZ09uONRwMs=
Received: from BN9PR03CA0127.namprd03.prod.outlook.com (2603:10b6:408:fe::12)
 by MW6PR12MB8663.namprd12.prod.outlook.com (2603:10b6:303:240::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.29; Wed, 21 Aug
 2024 13:36:28 +0000
Received: from BN3PEPF0000B06F.namprd21.prod.outlook.com
 (2603:10b6:408:fe:cafe::53) by BN9PR03CA0127.outlook.office365.com
 (2603:10b6:408:fe::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Wed, 21 Aug 2024 13:36:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B06F.mail.protection.outlook.com (10.167.243.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.4 via Frontend Transport; Wed, 21 Aug 2024 13:36:27 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 Aug
 2024 08:36:24 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jarkko Nikula
	<jarkko.nikula@linux.intel.com>
CC: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>, Krishnamoorthi M
	<krishnamoorthi.m@amd.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v4 0/6] Introduce initial AMD I3C HCI driver support
Date: Wed, 21 Aug 2024 19:05:48 +0530
Message-ID: <20240821133554.391937-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06F:EE_|MW6PR12MB8663:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f365493-c5f5-45f9-28bb-08dcc1e64203
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Jb2oOw6XiFB8Cu2jF0CBBBKDSfzj3K/p+TuS91RIRh/A62AGhnmGvIM8JV4m?=
 =?us-ascii?Q?yWE3WTlWQNzfttJW5LuPsp7Nwk2cPh+/5ZkrKYN4zRHdks44X0i3+Zk7Srpj?=
 =?us-ascii?Q?+R/QRAWHZ3QXYNYsLP1NlqB+ajeOn1SrabCGxE9IH1xTIW4qz1KdUktGyUCl?=
 =?us-ascii?Q?JuDQmRf8O7GukIKan1kAjfNhoL4Qwcf547yRH5lPLuQWwXWr2nmU0VCZJTm0?=
 =?us-ascii?Q?dX0mMH9kAa8/PZliROnTvI5Z+V5Zu9AeEbaJgdL1CFZP+g1AoNcbSQLZFrh2?=
 =?us-ascii?Q?FLfWP+g7QqSLpcEsh8w9xcDkxr82YnJHROIlefr40yq3F9APct3+ZfljPOB8?=
 =?us-ascii?Q?fDU5NbqwlWESsYhDcpE1FV22cCxb90xT7Tes/WpnIrQqBqnZuCZiLnmkfMp5?=
 =?us-ascii?Q?oUQyrmhtdyARKAEfhowJSkZuIAZr+qQUEWebsqgv29UbRPJRhWCyR8jL8bLX?=
 =?us-ascii?Q?tg+CQzj6bLw9z1MbIHIG3lza/wyyfNsNPxnEsDHs0eneJ3z0QLsb2M7He6Fn?=
 =?us-ascii?Q?0rEIjAb2ruQDoJ9fLqUJr8qXWtKgDzRaJxlVRAm0UHGqLwSKbybgmbP4eVq2?=
 =?us-ascii?Q?bRmnCRiCeflOed4NKPxrenAXVaGZehzprH/RYisv1/XPzU8dOXNV79XLHgoT?=
 =?us-ascii?Q?Fv8XNtavrRetoqgW33bCd0rCsCh7FJnX8nC2fweh35hPI1w4JSHdcdq5oJ6r?=
 =?us-ascii?Q?bSIZPBS/5iauQb6qhovAgRSeeh4zYn7CgFzQtjMnMc0GkN3UpK/gRwVDdKYg?=
 =?us-ascii?Q?xNSOWTQ2dhp3d8k0vfMZkqelInfgdEfh6tLA1KnH5uSd+/Q9jzQWReKrnJnC?=
 =?us-ascii?Q?cggeznIDRWeqZU1A+VGEV7oF93INg5bdDHQG1Pn9OmylUhLz/odUdHE0gK9e?=
 =?us-ascii?Q?Cuw5+gsdYs2tZPf1FsCir9+ec/ZDuyseZKJFmdlMF74kx0gZgbF9WaIu7Qi3?=
 =?us-ascii?Q?3h1mg7Nuy3rJY4QoeulRVtLx/qh8tm/htyI9dpXPzwiGgob8FB9So2uaCVDo?=
 =?us-ascii?Q?cjkYHEkEKS1YizgsfOgzyU2sVVt9bRp+yF+iagB4RoHp9gv8kX/kcQhQUaga?=
 =?us-ascii?Q?WkhiSDx0RuE+Uso2YxheGzDrOkIBfrb2u5KWJWlRyjgfFqzPAxQ+ww8NIF8e?=
 =?us-ascii?Q?gwR7DXYUUE+RTinZSzaJRBubMGJVZfpn+4nqFl7T36igCHKARR8McK4QXZo9?=
 =?us-ascii?Q?Q04gepVpuYTAYDzn2pYj/u0LGgGeYAnzOo3Lh36rZE1LbfOwQqaTTK3W0Bxy?=
 =?us-ascii?Q?Um4IYjtysNnFqb8/3gy96vWZ5qdOpyM6Y21v1j2QKa4WDD/GiJxfZiz7GQcy?=
 =?us-ascii?Q?AlNW7osNL8YQzmhXwL06SlIKx24A+ngAfCribgtMPabpthgcXwBBLTwNEFPO?=
 =?us-ascii?Q?2hdJEItsZD9mNvzBKIFAALJMggzbE3cWLq6rwhAXmlmQAojyiLvIhdEnK8je?=
 =?us-ascii?Q?2oIbjmf3eXM=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 13:36:27.3284
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f365493-c5f5-45f9-28bb-08dcc1e64203
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B06F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8663
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_063634_098953_80D7E4F3 
X-CRM114-Status: GOOD (  13.60  )
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
 drivers/i3c/master/mipi-i3c-hci/core.c       | 33 +++++++++++----
 drivers/i3c/master/mipi-i3c-hci/hci.h        | 10 +++++
 drivers/i3c/master/mipi-i3c-hci/hci_quirks.c | 44 ++++++++++++++++++++
 4 files changed, 81 insertions(+), 9 deletions(-)
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/hci_quirks.c

-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
