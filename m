Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE0CC52D71
	for <linux-i3c@archiver.kernel.org>; Wed,  7 Aug 2024 05:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u691ApaMExGhTQ2FnUDPMYCWU7PBXz5jrUdwLeTWTKU=; b=kxh5zp+K2Uu5lQ
	+eOt9HBO7A8xq5J+x+9udssrOU4gu0shu0Zi0z3qJlnInRu/+Wnka66LzKvQJI/kVJMams5gcvHeZ
	J/h5xn+GpCr+AF5CLvCnE8D2ZeUfDcyeQwmJqQv3FJAFRnoxtrbUpmMnIHoPTh1bnKappIIxcMSUN
	1xA5z00w5EjYWtuwBQrfpu4q2MFKehGgPTYgEfq2pzcIAW6nW5kHhmFm/yXPKPhdJ/XNVUde9y/at
	GogyRSCo2XZpfksEVZIiXGvvLF78bFKjypieJCKUhKpEycdobDv+sWoOdzDhl8hR+Zmrx8LXkM9nz
	Ul4Ve78EjwBkDiQcnVUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbZAi-00000003rM7-3zcY;
	Wed, 07 Aug 2024 05:25:16 +0000
Received: from mail-bn8nam12on2061e.outbound.protection.outlook.com ([2a01:111:f403:2418::61e] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbZAf-00000003rIb-1rux
	for linux-i3c@lists.infradead.org;
	Wed, 07 Aug 2024 05:25:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aYbp8UGUowJckJnfi5yuDU1NkqZwX+YMhO4mmMijLkQaYBlLMQ1q4SutL++C9mbekrnC4i6beqrgfqtDQj8a3Ik4TYdnKxzSvLhnpbLZDJD+yPLOPPzqVW9ONHuRCcZJLq5vXcapSNQAQJAdEmEZgy+5j91nA3C58330TuJV0HNQw9FTqR9gvc2f5T5A4EY3Ay2naqMGRNgEiq6T0hP8ydizwmSA4TfX2aEejbtoVFq6+/JPh96aZq9xUyTAUj8erB9yo4DxmMddoh9Rz+i+MMKq7USYfGrGxiXrcz+bF8Hbmxn2c2lfbGjGNrcTPkXrrZAfAL6sQQjOcRnVYGIrmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zvzbnoS4IqnMS3jMOr8EVpyDh2YGtwmr5hmnktC+l20=;
 b=pAbnxg0LqzjANp9dymc65arXI8PLEWdq7U24KLaz0QVgVYKdaJPC0ECLg2SF+AR4BDelFJZeYVVSy0fr9RF6Uof+EBMbZpHEsB7Ifpu4w4e6yz8DFBTm8po8B6EDF3bAIkihNE4jN9z6GIQZ4siaqToqZh1cckhrQpNyQ9GorlOruW6kihRatrH1eMn0ae2V9ZTUvFf8UYwD6OKYlgGoLsKDk1us1dlX2a/PDWVqVTshwbaihAw/lqlpA+s6YifdO7WeVMvMT2jnHoi5PBYWexzdH9f50yapUTFCyU8GuyBi+xm7gYCo1nDRDwriAk4zk9OgPz7a0bOOjTG4qAayvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zvzbnoS4IqnMS3jMOr8EVpyDh2YGtwmr5hmnktC+l20=;
 b=oGzarOldrsqOwIxFBOw/SvPyJ4cIhhauFdtYyBB9xlQ1B2wEOppAx28Er8dEAOE63dO74j8aSCi0h1P+d/mXw5p5g5hZ6iT0Kunmoh8sxGZQX+LR5YQCsMs5aU+de37R9yS5dF1iZKxeuuJonLFW3K6f0uMxeB7WqjYWnp21fyE=
Received: from SA0PR12CA0022.namprd12.prod.outlook.com (2603:10b6:806:6f::27)
 by PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Wed, 7 Aug
 2024 05:25:05 +0000
Received: from SN1PEPF000397B0.namprd05.prod.outlook.com
 (2603:10b6:806:6f:cafe::2b) by SA0PR12CA0022.outlook.office365.com
 (2603:10b6:806:6f::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.24 via Frontend
 Transport; Wed, 7 Aug 2024 05:25:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397B0.mail.protection.outlook.com (10.167.248.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Wed, 7 Aug 2024 05:25:05 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 7 Aug
 2024 00:24:58 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jarkko Nikula
	<jarkko.nikula@linux.intel.com>
CC: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>, Krishnamoorthi M
	<krishnamoorthi.m@amd.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH RESEND v3 3/6] i3c: mipi-i3c-hci: Add a quirk to set PIO mode
Date: Wed, 7 Aug 2024 10:53:56 +0530
Message-ID: <20240807052359.290046-4-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240807052359.290046-1-Shyam-sundar.S-k@amd.com>
References: <20240807052359.290046-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B0:EE_|PH8PR12MB7446:EE_
X-MS-Office365-Filtering-Correlation-Id: e619b7c5-e09a-43f3-6492-08dcb6a14b8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5B2wb2bdWvBU3hT3lVLHGuKxQDcwSFU6phXvkVBUenrWPkFo3ZE8foC04jyS?=
 =?us-ascii?Q?yDb8AJR4gJPIaPuVLL+Iv5FBkd3DxadhOmGGBD6k+Pj1zewneabACo7BOvm4?=
 =?us-ascii?Q?LFJ3qxoBN04qnGWJ4N3F4sm1nal/vcJ9mzH1cMTW9ZOy7Ss7Rl49zxqOpIKc?=
 =?us-ascii?Q?VnVe/2OO6VEXJdMRyrWP67bXjG7NHrzT8/X1eqXgGipxT4qLe59I8TrWiri3?=
 =?us-ascii?Q?RGiUuXpvVymxI1EZWBtuceC5lj8ZRVmByWhEfSVJuC9KGaN86NTdlvPKJZ43?=
 =?us-ascii?Q?QAAaitvuh5cWLSWCQzjasuFBYcQwAMDZC8y8zqhyq3hGKe44dXQr3KuKgGZ7?=
 =?us-ascii?Q?f1WEL1WCJhcX1t4XWHA72FsLNJw8bqZZFny6zkdova79VpvRD9buO/dv/WYz?=
 =?us-ascii?Q?iiSmi/ZQlXrV+bEdD9zB7GdGZJbw4s6LLq1i7Cwa8xQlSxBhz+zuYrOHyz4j?=
 =?us-ascii?Q?rKil3MRep9AqjS4Mj3AECRzM9uJpqRTVWw50r2yugsXemZZuH/xvQrclP1l4?=
 =?us-ascii?Q?LHCEx5C9SrDIfLWddYNJrA4heSKuWIXfK2w94AskczKMwJnar2s5rmJ3IN0A?=
 =?us-ascii?Q?HuPRarcEZMQAf3GkQI+Imcx7lacCEBS0iWWS++cEoGOVMLWEmU/frQP5vyUw?=
 =?us-ascii?Q?ymk8SuQ6n86lTd+reBlP0bbrAa0e1JpWSk/0ZG8wgulQl9ubR84zIW4aWWuO?=
 =?us-ascii?Q?+l8hUDMJUnV5MZ9IAWr2F8IRiB3dfj+1k74pPH4qcaqYqVhuZZIScwaPim2p?=
 =?us-ascii?Q?OjeExpbk7581IwN9KFNwBtqdDHBNcrDCouC6LivcrT3DEVDeY6EzjTccxKW0?=
 =?us-ascii?Q?ZmFS7/f9Qh3dn2X0EpWFZ6O9Xbyji1OCoOdqfdAC2lRrbYGk7JCRrDxAcF18?=
 =?us-ascii?Q?2W8g9aAZG1tNIUSoDdurO0y0jVMW07XVzdW3OjBFi2xpTxLz0CkieaC2T+6B?=
 =?us-ascii?Q?HdbCqQSpr6SN9ETa8E6LpHHfkgA0FgpI8w/JfjQxiG1hDLS86EbI0IRhFC+m?=
 =?us-ascii?Q?W+cdLg4rldZq8leYGaQhpyT2jtfdj4ILW6GN6XZoFkK5EZ5qN4Va96QAsa2D?=
 =?us-ascii?Q?Lb6+3GpazlZxNWjeMhK2II1DacULseEEfh7k83cPftyAgDG6TvUjUfx7AnFN?=
 =?us-ascii?Q?IE+a35lPi6z9cJ3MR9FY7vJvlhy7Tk4ueyS9z8GA/Fv94vEQCaFrHtQcx0gl?=
 =?us-ascii?Q?6TLUFSbrSmZMiMrhHHYZWBXyQdHAPJ/C3fbJaUGAjkL+zSAQ9TOQCeGoY16c?=
 =?us-ascii?Q?CsqbKCBvCKd/jDJiORAzm60K9YzkEMWdLqfKk27+aPgJcam6blaHTyzL3Hxw?=
 =?us-ascii?Q?jkFfDeawZCeG5IsmcaSb+1BreyyLL3Z8n/+heET67PrzRdR3RYoGdMjx8za2?=
 =?us-ascii?Q?FYfMjzxpnLv0oq1CGXpTlzm7h3HKBODIYznSEYshcFcPVncX/K8Z+VECNbEH?=
 =?us-ascii?Q?kLf0n4AiSumtrh3p0hSpRjXT/XSdqfsr?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 05:25:05.2599
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e619b7c5-e09a-43f3-6492-08dcb6a14b8e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397B0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7446
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_222513_605241_64EFDA79 
X-CRM114-Status: GOOD (  17.85  )
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

The AMD HCI controller currently only supports PIO mode but exposes DMA
rings to the OS, which leads to the controller being configured in DMA
mode. To address this, add a quirk to avoid configuring the controller in
DMA mode and default to PIO mode.

Additionally, introduce a generic quirk infrastructure to the mipi-i3c-hci
driver to facilitate seamless future quirk additions.

Co-developed-by: Krishnamoorthi M <krishnamoorthi.m@amd.com>
Signed-off-by: Krishnamoorthi M <krishnamoorthi.m@amd.com>
Co-developed-by: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>
Signed-off-by: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/i3c/master/mipi-i3c-hci/Makefile     |  3 ++-
 drivers/i3c/master/mipi-i3c-hci/core.c       |  7 +++++++
 drivers/i3c/master/mipi-i3c-hci/hci.h        |  2 ++
 drivers/i3c/master/mipi-i3c-hci/hci_quirks.c | 20 ++++++++++++++++++++
 4 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/hci_quirks.c

diff --git a/drivers/i3c/master/mipi-i3c-hci/Makefile b/drivers/i3c/master/mipi-i3c-hci/Makefile
index a658e7b8262c..1f8cd5c48fde 100644
--- a/drivers/i3c/master/mipi-i3c-hci/Makefile
+++ b/drivers/i3c/master/mipi-i3c-hci/Makefile
@@ -3,4 +3,5 @@
 obj-$(CONFIG_MIPI_I3C_HCI)		+= mipi-i3c-hci.o
 mipi-i3c-hci-y				:= core.o ext_caps.o pio.o dma.o \
 					   cmd_v1.o cmd_v2.o \
-					   dat_v1.o dct_v1.o
+					   dat_v1.o dct_v1.o \
+					   hci_quirks.o
diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index a16da70bdfe1..4926fde6087d 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -754,6 +754,13 @@ static int i3c_hci_init(struct i3c_hci *hci)
 		return -EINVAL;
 	}
 
+	/* Initialize quirks for AMD platforms */
+	amd_i3c_hci_quirks_init(hci);
+
+	regval = reg_read(HCI_VERSION);
+	if (hci->quirks & HCI_QUIRK_PIO_MODE)
+		hci->RHS_regs = NULL;
+
 	/* Try activating DMA operations first */
 	if (hci->RHS_regs) {
 		reg_clear(HC_CONTROL, HC_CONTROL_PIO_MODE);
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index f94d95e024be..a7ea37f8f8e0 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci.h
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -135,11 +135,13 @@ struct i3c_hci_dev_data {
 
 /* list of quirks */
 #define HCI_QUIRK_RAW_CCC	BIT(1)	/* CCC framing must be explicit */
+#define HCI_QUIRK_PIO_MODE	BIT(2)  /* Set PIO mode for AMD platforms */
 
 
 /* global functions */
 void mipi_i3c_hci_resume(struct i3c_hci *hci);
 void mipi_i3c_hci_pio_reset(struct i3c_hci *hci);
 void mipi_i3c_hci_dct_index_reset(struct i3c_hci *hci);
+void amd_i3c_hci_quirks_init(struct i3c_hci *hci);
 
 #endif
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci_quirks.c b/drivers/i3c/master/mipi-i3c-hci/hci_quirks.c
new file mode 100644
index 000000000000..897c0231f585
--- /dev/null
+++ b/drivers/i3c/master/mipi-i3c-hci/hci_quirks.c
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * I3C HCI Quirks
+ *
+ * Copyright 2024 Advanced Micro Devices, Inc.
+ *
+ * Authors: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+ *	    Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>
+ */
+
+#include <linux/i3c/master.h>
+#include "hci.h"
+
+void amd_i3c_hci_quirks_init(struct i3c_hci *hci)
+{
+#if defined(CONFIG_X86)
+	if (boot_cpu_data.x86_vendor == X86_VENDOR_AMD)
+		hci->quirks |= HCI_QUIRK_PIO_MODE;
+#endif
+}
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
