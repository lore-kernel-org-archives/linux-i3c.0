Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48BB7C5321D
	for <linux-i3c@archiver.kernel.org>; Wed, 21 Aug 2024 13:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=91dWbeK8Gl7zbG2sCYigZb4dmr7/LJORK7YQXk+Iqcw=; b=Uy5Mu4+p1Cf0b7
	lO+gYKi+dKkunQMkuLUaXoFsI8vOMPY81Ff7IQkhRjPb1ruDj+V8qrX9wAAY8/1Mrz/8w4w5RiESS
	+AtBvXPulM6/nmiJYEIe78MpDtWAQma36BO2HaGnkUIU6xgTHgWIrNPzrb3P15zk5kYOPqoSTWNcc
	I9TPaZfKPqvp109SMkkcjtmhXCJ9Z16WzG+eGgH6m5W8IWe1Arg+d6t9KkbbRxcy0Tula1yAjUzFK
	6XT4b0pxOA3n6WXB4edg3eooTgeSVknRfTGaiEGlLfjjnNKx05TQDo7tL4d2pQXJzVUWTK8RVQX3U
	Vlds/KKKaiI87FVGv7Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sglW2-000000099ER-46lr;
	Wed, 21 Aug 2024 13:36:46 +0000
Received: from mail-sn1nam02on2061c.outbound.protection.outlook.com ([2a01:111:f400:7ea9::61c] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sglW0-000000099Bg-2bCV
	for linux-i3c@lists.infradead.org;
	Wed, 21 Aug 2024 13:36:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XgypvoMpS4QmatfszvlDKIUlSTdLVOYCiGT+lA7MJnujJZh33t8O1HjlMwbb0XyI587Uaa6yWxWyy8nnwQrPzQlXlqTfrHj6TPsVXN02ecJw1V3T3386lqT4T05vS7qG6NNQohQgIBJ5DPn5Iyaq32XHxi/aGMkCCX9WuCE/pLyNHPdrV4iUJom8ZZpG8v5AhFKFCCssOV6BbTUwXfFDqQwDf+OygLS+FqzeQvl+/x5pqwHrI+3GtddrK8JyTYaUToqIeU57kTbv8py7i0LIGP4WL1jN9I5xuQn1HiIfpmGJXWd/5Mi9U3P3v46QhXfEQE3uKhII09cnj/tui34QGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kYLFoqW6M5Jzy78TlleUbBdALl4mB7DN4RzEDjKHDz8=;
 b=ee5SJ+VCT0GeAaC23LEfCwZAqMnkPbtEE1J/0XNtGz6oyFpJ0nR00EKq8pR86YAVpC0xaO+zwhC0deCs0Y/bBNEQto9CVIg8hzUT8EfKi6LQzq4h98CQdjO/0MnSaqe5JFdfl6z8v/zYX7xbbQJTVfoj5OTPpQ6SOlPJquQ68r/EqPfi2VR2BtS+mI78N4j2oUH2A3oyPS1DICYo/kUR8ljBEFqOq5U3kFIkwkMce9lzrje5G6SQpsAxUd1iPiLYz9P0P6dSZ7ACJcxzZGQAGANK85w9yQvRpW4jH6Is4BKTMEUm22AU8vd/eEDQw3/WuIslSPKiBGHpBP2TWIGpIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kYLFoqW6M5Jzy78TlleUbBdALl4mB7DN4RzEDjKHDz8=;
 b=Nj/2OYTjU++JtfzG53Q2G7cmsroXaECguXtRpeDchJ2E4ykWHYaatg2BOcvK1nCS8r7Fhktt1MzgX5a9hUK2cfp+STjZhOxWfiQZ37mkQYrpsZBXOm4eteaVnW+bt2x/dGJE/AChuuP9JxEpZq95loXZWBwnLU1mQUDpXovoiDw=
Received: from BN9P222CA0014.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::19)
 by CH3PR12MB8211.namprd12.prod.outlook.com (2603:10b6:610:125::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Wed, 21 Aug
 2024 13:36:37 +0000
Received: from BN3PEPF0000B06B.namprd21.prod.outlook.com
 (2603:10b6:408:10c:cafe::3b) by BN9P222CA0014.outlook.office365.com
 (2603:10b6:408:10c::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20 via Frontend
 Transport; Wed, 21 Aug 2024 13:36:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B06B.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.4 via Frontend Transport; Wed, 21 Aug 2024 13:36:36 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 Aug
 2024 08:36:34 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jarkko Nikula
	<jarkko.nikula@linux.intel.com>
CC: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>, Krishnamoorthi M
	<krishnamoorthi.m@amd.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v4 4/6] i3c: mipi-i3c-hci: Relocate helper macros to HCI header file
Date: Wed, 21 Aug 2024 19:05:52 +0530
Message-ID: <20240821133554.391937-5-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240821133554.391937-1-Shyam-sundar.S-k@amd.com>
References: <20240821133554.391937-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06B:EE_|CH3PR12MB8211:EE_
X-MS-Office365-Filtering-Correlation-Id: 2beefdf3-3b20-4aca-86ab-08dcc1e647bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?T3w7Yve5/ddZl55GfVBUuyhvMPjT9e+EUENCRXcEFANa3RY8QjG9yQYLOyL6?=
 =?us-ascii?Q?bJvfhAj0X0bEv15AN5moKYOxB3nhHGwGMkDX6HTsSAVEpqRTOMfh+0g56XzD?=
 =?us-ascii?Q?PAMs32wPkqIJ1MC8WeaisWnXGwtxJR4A5aXF5iTeogF90kfreBZrwDA3sbTM?=
 =?us-ascii?Q?u9KvDXl6Q+OiVDieNSHDoyh849jgl+HUlF0hOpbcDFVitsrIPCaaDzqF6z9J?=
 =?us-ascii?Q?B8oonZLdgIwPBFRDcOj3ldv+wYOigKGLW5tefE9RH/d7mgjvCckWX9ZmFGon?=
 =?us-ascii?Q?J919RaG9Tx2yHcbjEeRRu2oCCBRiZYdd0s53bfVvgV7D4VNKJsgLnJJ4kFB8?=
 =?us-ascii?Q?olVli2tEIErXYFuqumBKA4xnC2DaIrX/OvKvEh1uvj/Xjuoj5hGBN1fxHl78?=
 =?us-ascii?Q?czQaysYp41kXNkRuOcUcP6FZkYJzb3o7G2Psv3bEFoUDBynrSrGRoglZEgOz?=
 =?us-ascii?Q?IB3f4r2OTWXbGI9z9cJbQM/YqFGOUxWEYGCFLNlzDxLHDsYib+JWbWZVeffU?=
 =?us-ascii?Q?vVNXFNppqEj2SmB9i7Qxt6xfMMYcLE4eRNwGCHG0A5htk6N38DDZaLMdXYo4?=
 =?us-ascii?Q?uQLgrePVVltg3nwzPir8AdomYgYL4bkq9r3qeHpES4yFGEuSdNI4Re31KX/P?=
 =?us-ascii?Q?hZadb0QbjLI0f3az9r8c5rTfqAhpAGPKhKprlSSTnJBWETEFCoD5JYd+s6Vs?=
 =?us-ascii?Q?NeL4k2EttuULBzpMAAb/0DVU0N/+cUtGKT8WbXBD86KnTmLLcH7Ah8FRrevS?=
 =?us-ascii?Q?g3wRO9lt5X1u5kYMDyHSFyChShAzomyFP9HcJoQTfi0lJueUEq8Xo+cRYXGE?=
 =?us-ascii?Q?8iy+rhyeSbO8wEvwYajOynxKuubwZgbDr8IxmrYWi2lo4HELr+ziIPJCJOd+?=
 =?us-ascii?Q?JskxRqelZdJFopnQ1ir1i2kIsFVj7u45fI5BAr1MW3vbxXqDh1wo5T7Csnho?=
 =?us-ascii?Q?Rn7TtC2yzk2Y4m9G2tMFSVZkSlWfMX8T+5wdHU1ZX+XtczfECXHOsWKuQ/NB?=
 =?us-ascii?Q?OZQZvczkXulkHPyoOzBwrCAukiKimi1jQofCPTNkGVeq6sSNFjKv2qLpQc3Q?=
 =?us-ascii?Q?5IntSZgFHafYaB9wDZa6t57EOt66UY3yNLWGfP9f2VdBNOkIXcFsmnpCflQ6?=
 =?us-ascii?Q?u1rHgB+iHfTh7WrMwl8qJCIoNP85OGOrHJfI4Agda/hFTNFnCZIP297asCvM?=
 =?us-ascii?Q?2cDRO4G2yglco6259MJMsO3eNMH9CC3OAVqn2U4A75G2Ip40XjYVUCujAG2C?=
 =?us-ascii?Q?Swy+3ERnn2D28QfUQNOWKBS3vXgH2JRSFOHNpJQyQJR2BB3CQZp17TKGRZ0g?=
 =?us-ascii?Q?8vugXtoEIf8LZrF9s9ldFAeY1ya0GTuTLkKVc/cEW/swMVr4Z/v+ua9BIFiF?=
 =?us-ascii?Q?o4ob+WlrWWBoiJ+mNofET4hXL81uJOrLroyBoeZdt3Mk5q6+FdXwSeuFT4zb?=
 =?us-ascii?Q?M/9x0JYzn9zhTwqgFv0OBNLCn5bzjvTE?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 13:36:36.9228
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2beefdf3-3b20-4aca-86ab-08dcc1e647bd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B06B.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_063644_684172_456A4297 
X-CRM114-Status: GOOD (  12.47  )
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

The reg_* helper macros are currently limited to core.c. Moving them to
hci.h will allow their functionality to be utilized in other files outside
of core.c.

Reviewed-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Co-developed-by: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>
Signed-off-by: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/i3c/master/mipi-i3c-hci/core.c | 6 ------
 drivers/i3c/master/mipi-i3c-hci/hci.h  | 5 +++++
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 3aa4aa9deb56..c0f3c0ce9f6a 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -12,7 +12,6 @@
 #include <linux/errno.h>
 #include <linux/i3c/master.h>
 #include <linux/interrupt.h>
-#include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -27,11 +26,6 @@
  * Host Controller Capabilities and Operation Registers
  */
 
-#define reg_read(r)		readl(hci->base_regs + (r))
-#define reg_write(r, v)		writel(v, hci->base_regs + (r))
-#define reg_set(r, v)		reg_write(r, reg_read(r) | (v))
-#define reg_clear(r, v)		reg_write(r, reg_read(r) & ~(v))
-
 #define HCI_VERSION			0x00	/* HCI Version (in BCD) */
 #define HCI_VERSION_V1			0x100   /* MIPI HCI Version number v1.0 */
 
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index c56b838fb431..76658789b018 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci.h
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -10,6 +10,7 @@
 #ifndef HCI_H
 #define HCI_H
 
+#include <linux/io.h>
 
 /* Handy logging macro to save on line length */
 #define DBG(x, ...) pr_devel("%s: " x "\n", __func__, ##__VA_ARGS__)
@@ -26,6 +27,10 @@
 #define W2_BIT_(x)  BIT((x) - 64)
 #define W3_BIT_(x)  BIT((x) - 96)
 
+#define reg_read(r)		readl(hci->base_regs + (r))
+#define reg_write(r, v)		writel(v, hci->base_regs + (r))
+#define reg_set(r, v)		reg_write(r, reg_read(r) | (v))
+#define reg_clear(r, v)		reg_write(r, reg_read(r) & ~(v))
 
 struct hci_cmd_ops;
 
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
