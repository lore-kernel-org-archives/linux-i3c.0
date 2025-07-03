Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03116C83F1D
	for <linux-i3c@archiver.kernel.org>; Tue, 15 Jul 2025 07:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IAamPgBDGONX8b5fGRaFIhz3O+ttHauA6opEScbKFOQ=; b=cb9Tjp665Q04I5
	LdiiXl6Bptqnawy+eW2B0NNv/q97BQKgBP82xNcappRVelhGsSgXHaJI2t1WXdLIz9RxYmJm2JODH
	fmkzGOVRQ9KicIw5+dQOcCgW1vI1pjVbxoYL8COeFO+tkP8FvJJYRBc3OI4FN93fcddI02QiNuLtO
	kQgFcNBXy/+EUGdE0ZhLWxSUIh+08YTtyZhnJUIx3/xosElRhL3ivB2KTJIeLDYHnXHfOIqJCxWNv
	Zfk6LY+fpH46IE9MdmsHODasOf2mUUlwoGpPLwDZMUokauG1F+66gG2ouHtaIVHXF/1Go1l6itOet
	D001iAC89DIrlY1ZXkgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubaJX-00000004Nlr-2wQU;
	Tue, 15 Jul 2025 07:42:59 +0000
Received: from mail-co1nam11on20617.outbound.protection.outlook.com ([2a01:111:f403:2416::617] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXHu1-0000000B85x-44Je
	for linux-i3c@lists.infradead.org;
	Thu, 03 Jul 2025 11:14:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ki6MaJfMfbLX7umHU+k9cWo8zVr+0sK1msV0xlbADFeZRmyCEQ4HJvOToX9oTICxix4tC9pNTr2ykckmkM/K2RmLSAGfvvVJM2tJIwc9AXJYeZMaXL5oJZpd3CNv6ouxqmReTPklZSmSKPXW+1BVjNX4s3cKoITMbLHa1h0h56STIRlTv7x2sO9vXzFbAcs9WfREDtkitBrg+Uku9AuV3FZsAq1gd8mTDf4ugas2RJ5Tjqp58YA/aEqz7uthtyJe2ssyboO8tJbmP/Rfmh1CpDFHTs1EmrNi3gNMB1h3VR2f0GQ6O1kiZX9oeakpEgtdDlYbvlueImWbkMMHuUDOLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ht2mb+8fauk9pDaQ5LmWohg5Cot9yFTujtwoaCJC83I=;
 b=PtNulOcF4SXkFNWo1Zr7yhv2sBWJODoQ9GeeEiGrhzXYxT9ntC5dTWwxb6peaSd4w0fpV9uo98JI5DdfyjDZ9C6Ucw8w3vjGMtm8t/aKaTjxUf75i5jKaq31CifzVF1qmgT1VhjfdE8vsgSxW1/vokWEm2/GpYFtCIG7pNLfzf5Kbtgq2I0Vh/iICJARYJhMDmdPpDPGstVCJB7ucQzpczxrN5g5NytdwKDEW3AzC/KMKVkVkk/KwQAZXJpRz3APB8lwzPMhLU30A34e2BhEwENVwQPDdYZKyaJyTwsklWIOExbdnIH5Mn63C0csLUu3ARGoWi+nKw7upIAuuKj4lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ht2mb+8fauk9pDaQ5LmWohg5Cot9yFTujtwoaCJC83I=;
 b=WSZW5BQNMSqax1XzMIfIhLv7IS3eij6ULFBA9nZ2TwJROHnzXLr64dXe0huJHIOxlfayWPKryXo4x25eiR21/Gv8yAZTfFOolHRr9vh1EZ/BZ71FQcXvqUdTDD/qiR+/qQ7Y9m5wwQMpRwqKTGSScq693vMY6eYVcZjjHBFtPOo=
Received: from BYAPR11CA0080.namprd11.prod.outlook.com (2603:10b6:a03:f4::21)
 by LV8PR12MB9450.namprd12.prod.outlook.com (2603:10b6:408:202::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 11:14:40 +0000
Received: from BY1PEPF0001AE1D.namprd04.prod.outlook.com
 (2603:10b6:a03:f4:cafe::e7) by BYAPR11CA0080.outlook.office365.com
 (2603:10b6:a03:f4::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.21 via Frontend Transport; Thu,
 3 Jul 2025 11:14:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BY1PEPF0001AE1D.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.20 via Frontend Transport; Thu, 3 Jul 2025 11:14:39 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Jul
 2025 06:14:37 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 3 Jul 2025 06:14:33 -0500
From: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
To: <git@amd.com>, <michal.simek@amd.com>, <alexandre.belloni@bootlin.com>,
	<Frank.Li@nxp.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <kees@kernel.org>, <gustavoars@kernel.org>,
	<jarkko.nikula@linux.intel.com>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-hardening@vger.kernel.org>
CC: <radhey.shyam.pandey@amd.com>, <srinivas.goud@amd.com>,
	<shubhrajyoti.datta@amd.com>, <manion05gk@gmail.com>, Manikanta Guntupalli
	<manikanta.guntupalli@amd.com>
Subject: [PATCH 0/2] Add AMD I3C master controller driver and bindings
Date: Thu, 3 Jul 2025 16:44:26 +0530
Message-ID: <20250703111428.2111484-1-manikanta.guntupalli@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: manikanta.guntupalli@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1D:EE_|LV8PR12MB9450:EE_
X-MS-Office365-Filtering-Correlation-Id: bf1e8086-a7a5-4b17-b136-08ddba22cdcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|7416014|36860700013|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rCrLulbsqHaZMCFIx/Lwp63tfZr0zUS3m4+Qxjwy2onrWYToRgqg4Od8zGt8?=
 =?us-ascii?Q?JTe1lnL2J1ekCfzA2awAG1raQ9s6HyYo/+JrQLFXGXIu/Zz7gMYKXO/vQY5d?=
 =?us-ascii?Q?4P46PkGvk6qvnjLn3JXOSgNRFF5lNchFGVS4Xp05Q7JeKdkoJGM7tgPCsncs?=
 =?us-ascii?Q?ylv5YfcReAe1p2FWaDdXZOBATQS9SvvIUlsS4UyyTNaeDV15T9+HRlpKdJBQ?=
 =?us-ascii?Q?CB1gOQ6PdeVTacn/569Bbs0aKCl090H+N34RMo8i2GJh/BUL3U8nvZALh/h/?=
 =?us-ascii?Q?wLR7iDFPMkWiDOUbBe7aFAn1gF3bwjCXT8blGVdTT5R3V8GYxF3hSTGSzRny?=
 =?us-ascii?Q?7o+7NWu+WF/9oW8lEg6LsaNF/awaG9RnB+nayqYRbCsgwNezeLs6ffE9vgBn?=
 =?us-ascii?Q?i3GXhRyakLomyLpuwl6WtwseB6dVphqr20tbydPC4GGTQDuZbYlEIIaZQjeN?=
 =?us-ascii?Q?YcFrd3bzXzy7NI/6oFAex9IqrwQwGzHxb83bV7ur/BuH/LI30q8inJCruDyz?=
 =?us-ascii?Q?bNoI+Tqlo7SpTPOEbOTvR8e3KZZhtipDlkQ36UGCbx5DgtLhJdwS+T1L3OcV?=
 =?us-ascii?Q?HOoxMT+bTYC2UrNN/JTWkIfjrZtCA8ix0OiBuPmu0K8NtpObmkcF02FnoWBF?=
 =?us-ascii?Q?YQhMoN7W1UOfHw9Yr+frzPzr849MGqtUis2kJB0zLhgthU4lg63d5bnzVvE+?=
 =?us-ascii?Q?PKedf1v2CtSMQfgGz/5X4bpEj+f+00oSTyzJjWVLUvt1TEaFAMOMtBofjgPs?=
 =?us-ascii?Q?OztJNePwdsQ3P4caKQSsavmJSljuMYSs4OlP0NgYfzPME8zBYLwZm4yAnEy6?=
 =?us-ascii?Q?zdWHYoBOCq3wC/v+ytELeUj4g5muswR77CdcnshHq8pQbhA4oQJ2pGjln3yC?=
 =?us-ascii?Q?S1Cjn6gC8l2oK2ml4RBzD3ELTXHZMGr3KsX8+il70dtsE8D+mSdZNut4MIhJ?=
 =?us-ascii?Q?OiQGG/z2JAyoJMEbxdppv0sNX3fPQ3A6iM0hjRHa5WXAaZczfLqO+G6Tvo+J?=
 =?us-ascii?Q?BBL9tiazgpV3WrrHdgXYRDo5D9+jZ4Py2KC/eaq2BsyXdcq3YCdjroQ+qGyI?=
 =?us-ascii?Q?hpeCNR6WihjJyWXGPMFQEytkH0O46a/+JH20oizYusiPIQqDeCxW2PGCW2ug?=
 =?us-ascii?Q?ouQ4CDYY2RDrp6d2OoZVsMvArORND8yjs3b0lDbXiTf97b0skHwAYZj1zFDh?=
 =?us-ascii?Q?ULQpr1OCNaVPFGDIzZO/aROLhnD8VQmVLyXDrtC88WbnGWPBC82ZigKzr87G?=
 =?us-ascii?Q?KpOG2Gc3FPsH/2Dxj9v1y5NrQs6+yttotJlFOx5/0mTFDc6KSTgmO2USIfoU?=
 =?us-ascii?Q?e19+1fJbZw0RdZ1xC8Me8jIB3cVRzk8tgJUgRVY2bOCBHxWaNPPBAzyl7+tW?=
 =?us-ascii?Q?dU0H18kRkFvn8Tv7ZvqfuJoJ5QNsJpS+Hac92c8l37SyjYUklmQHfwzu2py1?=
 =?us-ascii?Q?mPmcl16KGPLOpT/6LNC+usMLMKla0b5F+KlhJnKwsZnDLNQoSlrVwNoOqLmG?=
 =?us-ascii?Q?f+7RBVYC3tFj1cRs6yqGmuSk7s77niDDjbWQ/2BOTV88wmxkDiZDalXvaQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 11:14:39.9727
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf1e8086-a7a5-4b17-b136-08ddba22cdcf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE1D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9450
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_041454_205957_3BF89A34 
X-CRM114-Status: UNSURE (   9.78  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Tue, 15 Jul 2025 00:42:50 -0700
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

This patch series introduces support for the AMD I3C master controller,
including the device tree binding and driver implementation.

Manikanta Guntupalli (2):
  dt-bindings: i3c: Add binding for AMD I3C master controller
  i3c: master: Add AMD I3C bus controller driver

 .../devicetree/bindings/i3c/xlnx,axi-i3c.yaml |  61 ++
 MAINTAINERS                                   |   7 +
 drivers/i3c/master/Kconfig                    |  16 +
 drivers/i3c/master/Makefile                   |   1 +
 drivers/i3c/master/amd-i3c-master.c           | 945 ++++++++++++++++++
 5 files changed, 1030 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i3c/xlnx,axi-i3c.yaml
 create mode 100644 drivers/i3c/master/amd-i3c-master.c

-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
