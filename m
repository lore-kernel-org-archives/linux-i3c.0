Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C331BC52D71
	for <linux-i3c@archiver.kernel.org>; Wed,  7 Aug 2024 05:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=01zjn7DKjZU0qrCm4xglwSoOHg+ytNBPMgTcUMstLV8=; b=juX4zriq6+pE3s
	h/AVe/togeGPmC/siD1dPFe3Ks7QWNNSuVWwWkyptxemYIoTJdNOWT/EYcyrI0j/Ayn3vGtBHgX61
	TRjSR99fbMQnXvq46c473g2SPS128BN6YkYcZp2jU9A5OIyYzJYJMHdYVGpaLTujzTMAp8HeGanMa
	y88zQ6LNpzWrEsRmOoVkfRj3XPmR6fREx2rCkeZRYCo5EnvyByrBljr40naS/NrTIZl3M7qz1koOQ
	ljdeBiXV/oA1awAznWbHIZc8j5PzcfarW5MlmG1IzuO72F7pxcQCSY07z+0lCrAcesU/5Ts8KLQua
	K6r3wJBxO1YgTAe4Ejuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbZAg-00000003rKM-1evo;
	Wed, 07 Aug 2024 05:25:14 +0000
Received: from mail-dm6nam10on2061a.outbound.protection.outlook.com ([2a01:111:f400:7e88::61a] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbZAc-00000003rGQ-2vOF
	for linux-i3c@lists.infradead.org;
	Wed, 07 Aug 2024 05:25:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VMkefSUJ93xTyRcKYBZWo1HzHittEFbN7fSixycl6yOsiMQGQh5f8of/BztSwVjQlj3hJ/hYPKcr7bSi9sX15ic5xJYntaG0kvtXMJ5lP+e7EBC+9ck1lTOn5PkXqJcn9+7tOg6/3lDTJXInLmUPig7OP3mD3pjWtDiamg/CmqM/Y4oNfr6T1HC019IfUeQ938eC2ZCBJ8qk6/UJ0CXx7uznuI1xcjYERcBqxfGmiUfeHNZO9I6lvk9dM+igheEcdsmNrfH5xctkNynDF3m/Ahzc3ElUuydgV9R3Qvp6Muiin+cBYzrCwDyKZ/u5yi8MA+duQ7X5Pz3IaMdT/g09zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0Ah+0HEp0hETirlk44jCsQ9TQxNjMfHJewZjUR8Ri0=;
 b=BifZoz1Fs3M4AXO4LwU+Oy9+h3m/G5B/xwKdiRh2ed4bq+78551yGUqDxl+xjQOXLB0OUlA88c1qH+qc5xf6JHc6BrJlT8mRQgVHt6brmPmVRoz5nADFw8UxrbPzgTSHShTZV8eYOowuzATlojyUX9NHz0qSI9hKAWUczwQO+VrO+U4BBQDRtjqeBer0LtjmDFNOe/si9fBEpVgjHyyF1eaRmO/nRnlU4SR3fOfSrLB6PASZ+MOFsJ1g4uqW2mKgrZnFMVY7dtezb6Njyb5jKW2PtqMnEWiWeI/rMCUik4EfCtwbL/0GgKWn6t1HY3PGpjs6CvzpD2YcEiZQip9k5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0Ah+0HEp0hETirlk44jCsQ9TQxNjMfHJewZjUR8Ri0=;
 b=dWcIYZB8ieLUybWjlYi1Mp2kOanrBVS2wdzP7T+bcdX8QHPl685AExABvU3+WOrPgL5nm9dpYiO2mS/oXnhW+4GGLDsN9C2wJ+hZCbQCTspUnd6rW1CoFPDA3dw0bSr2Nn9RLrmqlvg4daEeQY80D34tXQAM3NNpVQ3veCk5KPE=
Received: from SA0PR11CA0078.namprd11.prod.outlook.com (2603:10b6:806:d2::23)
 by SA3PR12MB9179.namprd12.prod.outlook.com (2603:10b6:806:3a1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.29; Wed, 7 Aug
 2024 05:24:54 +0000
Received: from SN1PEPF000397B5.namprd05.prod.outlook.com
 (2603:10b6:806:d2:cafe::16) by SA0PR11CA0078.outlook.office365.com
 (2603:10b6:806:d2::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23 via Frontend
 Transport; Wed, 7 Aug 2024 05:24:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397B5.mail.protection.outlook.com (10.167.248.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Wed, 7 Aug 2024 05:24:53 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 7 Aug
 2024 00:24:51 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jarkko Nikula
	<jarkko.nikula@linux.intel.com>
CC: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>, Krishnamoorthi M
	<krishnamoorthi.m@amd.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH RESEND v3 0/6] Introduce initial AMD I3C HCI driver support
Date: Wed, 7 Aug 2024 10:53:53 +0530
Message-ID: <20240807052359.290046-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B5:EE_|SA3PR12MB9179:EE_
X-MS-Office365-Filtering-Correlation-Id: cd2438db-5eec-4dc4-93d1-08dcb6a144c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6VJihn/odg3sdbeqUchC74/WaKp5/YEJKzj92o0j4194ATEn10GnlO+0Pxwd?=
 =?us-ascii?Q?EHmCHpmz6yGwQ744qjc+BWXziT7Le8QfRSvQdFiqfOjTv+ISFCEBtL5wg8uo?=
 =?us-ascii?Q?bpV03/zoDu0Lv3SR7U0VvHGtvl11IpghMqSC1zvjA6mrM4MxRps1Ft+f7ney?=
 =?us-ascii?Q?/0cHtpO/c9d6dUqmEMWvIHoVjKLSF6rOo5ocft4xOT2YfLwRT8Z65Ji8yY/5?=
 =?us-ascii?Q?JWrNGF4r0Hn0zFzflR1EXdkjZwAQ68qqMWN/P0UK3H5DyPsZd7WoaSQyYG2X?=
 =?us-ascii?Q?+hJImkn76B4zNIWxUHxiyJiy2WvrIHVpk9oUgtBZwT+vZmQ6PTT9uZ378mcm?=
 =?us-ascii?Q?7aSUkzpU7jUrfytHOe3QtfMSB9LXmVhGCV9pu5gO9BN+KGRqlHX5FtxnUNT4?=
 =?us-ascii?Q?Q2YUevpQbdXaGhwgncjnuByGr/KVsiSoR13t00NOAQLTfA8PA/kc8km7uqqL?=
 =?us-ascii?Q?B+BCcWnuZwCkRIcJ1Wj3cTBR36sWjeXpCsvb2aqR0bFD0hSU0ei1plMAMYXK?=
 =?us-ascii?Q?JY31G9ehj+oqnYd08CwvSXRLp/Hz2giauhFpz6eV7TC0mGB99pDV26/3WzUM?=
 =?us-ascii?Q?lHl86HmF3KdkUEHCcW5Sj6tSbeqMP8H/HQVPTA/UK/vGc1/b2JgoXR4CJySW?=
 =?us-ascii?Q?QhJLJQy3/Tho5Ro67ZxUY5Zcq+HyrtToXvLn/ySgjK5tTUQhEFW+ZnPg5Z4R?=
 =?us-ascii?Q?4spRkkiTv93zo1dnWIdO7DYgUQWXaUMpXiA9CoI8uFyzmm3H1QP0wF/92Y5O?=
 =?us-ascii?Q?PfjFLAyK+g8oKSE3ZxdoPd3aJ/H06BZwsuI6fEPM/FtwM6uBmEf0VM74q/IU?=
 =?us-ascii?Q?rpcln5k+hW5LbvMyLLb3a9bRKLPrDmVqHaTupTOVgJ/Cs+KctGVNJ/PHsQ1v?=
 =?us-ascii?Q?JgHEi7foRgbB3m7jxzQmC9ps2dYDnByk9mhfaGnbwMfVXbRDPlHiBCZs706J?=
 =?us-ascii?Q?MTLTiGOKK5dTxU8Wse57UAN5Ctt1144pS3FG+yiMgARHwOHuG7qvp1pxS0VC?=
 =?us-ascii?Q?XMDYe1z9CeMSZrZQ3DodeB+VKivA7ASKRulsqAXb5qKBLta5omZn7vBlydsf?=
 =?us-ascii?Q?ExfZPjoY1YZorYuY9lmvsm773vHQSWKNz2XC3LGtX8gJNxYDOiLY/wzeJ5Mz?=
 =?us-ascii?Q?aqjVfq9B/4oaGBYl3HzhU7IgJ3kAdlHBIgSY+w6bvNnknnNO64iyM9bGVlAN?=
 =?us-ascii?Q?8n0DaAK25ztxIzq8B46RA4ZNlf8nJARAV4OoPyvvkrh7ki/CePRqn5EDzrGc?=
 =?us-ascii?Q?F5QrfXACsqFfXlzBehcFmO/8KI6+nxYIESiJw9HKC8UvE3o3h59qY1K/xwn+?=
 =?us-ascii?Q?ekEVPHq/Gm4H/rNQzz8wSXlCRWNtf7L6rXgaEfClYIkvVaOWT1HYJXUmJo8Y?=
 =?us-ascii?Q?aMUyLedAkAFJexn6w9V1AjrNlyS2SNOWQz92b6KGqRb3Upu4YaTLs0yRHfOg?=
 =?us-ascii?Q?K8lcKd2X8tg=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 05:24:53.8357
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd2438db-5eec-4dc4-93d1-08dcb6a144c1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397B5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_222510_745310_9B7BD415 
X-CRM114-Status: GOOD (  12.29  )
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
 - address comments from Jarkko
 - split version check and quirks into separate patches.
 
v1->v2:
-------
 - Address LKP reported problems
 - Guard boot_cpu_data usage with CONFIG_X86

Shyam Sundar S K (6):
  i3c: mipi-i3c-hci: Add MIPI0100 ACPI ID to the I3C Support List
  i3c: mipi-i3c-hci: Read HC_CONTROL_PIO_MODE only after i3c hci v1.1
  i3c: mipi-i3c-hci: Add a quirk to set PIO mode
  i3c: mipi-i3c-hci: Relocate helper macros to HCI header file
  i3c: mipi-i3c-hci: Add a quirk to set timing parameters
  i3c: mipi-i3c-hci: Add a quirk to set Response buffer threshold

 drivers/i3c/master/mipi-i3c-hci/Makefile     |  3 +-
 drivers/i3c/master/mipi-i3c-hci/core.c       | 33 +++++++++---
 drivers/i3c/master/mipi-i3c-hci/hci.h        | 11 ++++
 drivers/i3c/master/mipi-i3c-hci/hci_quirks.c | 55 ++++++++++++++++++++
 4 files changed, 93 insertions(+), 9 deletions(-)
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/hci_quirks.c

-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
