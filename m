Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D73DDC52D6D
	for <linux-i3c@archiver.kernel.org>; Tue,  6 Aug 2024 07:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=czpzSvTviQfe43b9+Ob5LDQsZZiXQmwonYX2SccCNjQ=; b=dUmQaNMXp0DeOB
	joBSQ86eKIfmiYwSFr37Ns6Kla8B0QFw4DZBw88554q9Yub4ohcYuKGXRvrOdLQQNji6FnYXOPS7N
	uw+abOc9Fr71Aaz2mvyYIS5P38dyRBM0wByAMDND0piw7rbf+2URDdkcYLDiCKlOIK3C0rwihqWjA
	zevzyJ/aGU7SGGI0K20Rpzw4pnSajXvWQ7MEeKqdsAIAnl0LCG54SLDU0/5ch+W+jgtuqLLT+rnKG
	QzgbWEOGMuQ6X3buVV34wj9ZBNpOV49jIguAFe+6/C5HKVtWwcoNziZqqUBl2h7mP9JhuzB4YKYqC
	q/w3B5ZvzrKg/et5zo9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbF6M-00000000rTl-2EBL;
	Tue, 06 Aug 2024 07:59:26 +0000
Received: from mail-co1nam11on20601.outbound.protection.outlook.com ([2a01:111:f403:2416::601] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbF6I-00000000rQb-2auc
	for linux-i3c@lists.infradead.org;
	Tue, 06 Aug 2024 07:59:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SLX/Z1yx6uRIcUbKeAmRnocZebFw/CDSUvu1LO88T34L244thmEgDYm7i4UZ8ywbzSVL+iU6LOQyGe6ga3M33sVUxczXJElH/P09k7nKrTJ01SVqkq5xi23uL3tMUdcLlG3lOSo25EvglPEZRTAap9NUDWVFK7hqaKOPLkt5qVVkpKSDOVwd38v7V5ooMzovRxUxH1IVsnUDoRrIHnYmhD7HMQQi8cCAAtEtQzrr8gw1/uv0Qpl1sjGk7jfrysUfSl0aA1tM5BeM/Wz6d+ohrOxFyNsMG31OZKTnpE7uqKTyR69ceM9k+4bNHHOEknC9yn1o0ddcZSADHosbHz4W+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OyEJrgrTsFRdzf2iEC9xm5OzcqbgtowxN2k5RjCNlJc=;
 b=EJ7Sa7BE/TbaG32QUR7dBUI6W9Nxlxt0qocsIWxCaF/4wgXv5Ch+1n3sk118ita0Xx5+Ix9Qmu6YMdsvOlbdJxdPFW3gO5KE8hObKCfBxUKjNj0a9kjshX3v0GMJKSbYBhzezwDtHhnAaHYwBIQs55S6uP5Cx0x0kCmpy0yYhXd5BzoK4Iz3FG/mMsZNZ8yZqyi15OQmf4K0XAytKwcQ/1yECPBnolliWG9ZYe85SAAPku/3uIiNaFGodQlV93XGoGnkTn4j7tQz2GOuglRqF3gh//yBywOO9soPqYt9QuLXCfI2A7m+sCdnLJkJHIP+A0Hr9FyciuEHx2RxE+RBYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OyEJrgrTsFRdzf2iEC9xm5OzcqbgtowxN2k5RjCNlJc=;
 b=teW7+pvKqMDK6DZbbjAAngvwxIYUmtdMV+Vi/D8lnmOdp2hjncvcj9baY8F2MpgtEQUlSmmoHE9i4Hzht7SeJ/BLlcw/RZq3AEmtVvkbB3zrQCQPWRp/dGeGREjpNBlb14cbR3fIXLKfPtERXPuLy4wHmIbgI7lz+jMH8vH9ZOw=
Received: from SA1P222CA0172.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c3::28)
 by CY5PR12MB6456.namprd12.prod.outlook.com (2603:10b6:930:34::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Tue, 6 Aug
 2024 07:59:14 +0000
Received: from SN1PEPF0002BA50.namprd03.prod.outlook.com
 (2603:10b6:806:3c3:cafe::50) by SA1P222CA0172.outlook.office365.com
 (2603:10b6:806:3c3::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22 via Frontend
 Transport; Tue, 6 Aug 2024 07:59:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA50.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Tue, 6 Aug 2024 07:59:13 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 6 Aug
 2024 02:59:10 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jarkko Nikula
	<jarkko.nikula@linux.intel.com>
CC: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>, Krishnamoorthi M
	<krishnamoorthi.m@amd.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 3/5] i3c: mipi-i3c-hci: Relocate helper macros to HCI header file
Date: Tue, 6 Aug 2024 13:28:41 +0530
Message-ID: <20240806075843.277969-4-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240806075843.277969-1-Shyam-sundar.S-k@amd.com>
References: <20240806075843.277969-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA50:EE_|CY5PR12MB6456:EE_
X-MS-Office365-Filtering-Correlation-Id: ac7ddbfb-9ef3-4fba-6030-08dcb5eda9c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jXE2yJM0TxXo5ZAeBrjAtCTa/pw7/o4bX4kQCPlf6JnYzfLWmFSTsrYE5Z0/?=
 =?us-ascii?Q?rEea9ydjllZEYYsf8lLbgnTOjD0+lcCQeOU7PdtG8S6mYHa8dBYqdnYUM2rd?=
 =?us-ascii?Q?Hq5qzEj1Z0WDvXGahReJE73c/Z1Su5yWjwkdZe9LcCnQBIV2dmFJaVaS3Sfc?=
 =?us-ascii?Q?ARK8+Px5Aah29eBhq5+zMFqEEdW7KYQEclPNbVxu9RoBtOnT11+LvXoke9Ns?=
 =?us-ascii?Q?+dFO8swteClIRZua00VjoDFweYuuETBBNrqb3wLJrUDh3j4uj8ILHP+kRkJZ?=
 =?us-ascii?Q?Cl3DxYeqNZmCkNGl6fu55WrDqHR8RREifCbVzXzGGJeGIqiSfEgLOaDULLBK?=
 =?us-ascii?Q?Nyil28N9FGsEuq8tHRER4w0MSkvW6WLKPjshoikSD/yYxmua/dQwn65f26Xv?=
 =?us-ascii?Q?ebpzaDe71Ce2sMJSklJh/VPj+EjQkZTpABGhe39MR/OanNxDfmZCde37UOVZ?=
 =?us-ascii?Q?InE9rtPMJSxRMMjtpKf2dW96+sQUCSdcuBFhGk3rx1IY2su/lbd+xA/hpboI?=
 =?us-ascii?Q?oNMNA9FfqDu1TNvzThGioVnXbqHdaSdDaxZrMA8vGITF3e1+YPy3yujWnUaN?=
 =?us-ascii?Q?drOjSCTyS1ulq9+Fl4X3nJBIWXL1spWadppGY+l9Y+Tp345sHc+o1knC0Xlf?=
 =?us-ascii?Q?nFNiDTggvvf7gr4rVPm30Jk80QyNwWDxxJRxWW5FpbvhX3hKtI8PXMWwIWeN?=
 =?us-ascii?Q?mutOInIkiMyCcJ4HWjf4KvgcP2Dw+0aEW2L0PA0hALbdUU6YnksTHibsOPqF?=
 =?us-ascii?Q?mH5Z3THvqSs+P7BoPtTOcWi8C+EibSl2SHmAZV//DDEF5tzn0EyzZcMdA7Zd?=
 =?us-ascii?Q?fZMHFdj8AysxaqSA1pAElre9h9wX6zvz0nvcTXYs4YS+CRPwne8qh1h1PXdL?=
 =?us-ascii?Q?Jjh9DvkWQMECpWSL81v5yppNUGQ1EXv0Kk/fLkEOaQhPWwCOQGOXivLVRUPW?=
 =?us-ascii?Q?QJhM76LPD/blAnhG1VLj/HqMde+uRl9uh+a1H2a2RKeRLx+tL77u1jqDhp1+?=
 =?us-ascii?Q?WlKFDJF8LT+7/8QXW68i5XmeU95MML0jN51ZG8q5H8EjmyfRb2wpdtrjIBVg?=
 =?us-ascii?Q?AswCIAVClnxsVDS4vukGo9nNxoFQotD9BGvgknKvd9od4vy7zexLhPplXfFh?=
 =?us-ascii?Q?/w0nT4nbXYW1EtLtIMbwTSascT7kdxBASBy4+/ykW8+OWDkxI4aJjPiTX69W?=
 =?us-ascii?Q?rkUU7OSfr0OsB9SKFG5u+xfB7FjXtY6DGpmbFW2GdVVWPEo/LbDLx0VNJ7Dh?=
 =?us-ascii?Q?PH8m9I5IGJacKL3zpWzCe04sT2o9CrtzTiHITQXjRi1yjesI0OrZvj1YpZfK?=
 =?us-ascii?Q?MhA0z7pEYQ62ExjYaIOorWgLccFhbG8bfjwssUOkOuYue6RMCP3ap413jMBh?=
 =?us-ascii?Q?DBOr4P9dJa+Z8GkibqLgt7eFZyyurG1i5IZgbsuAXSEyY7dRs8AG2vJeMzC3?=
 =?us-ascii?Q?cbQ4MM0L3I9YF9tV9BdtpWC+hEY1nZvR?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 07:59:13.9057
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac7ddbfb-9ef3-4fba-6030-08dcb5eda9c6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA50.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6456
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_005922_685694_8472C0EC 
X-CRM114-Status: GOOD (  11.02  )
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

Co-developed-by: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>
Signed-off-by: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/i3c/master/mipi-i3c-hci/core.c | 6 ------
 drivers/i3c/master/mipi-i3c-hci/hci.h  | 5 +++++
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 7843a3ac2121..5c4fcb740856 100644
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
 #define HCI_VERSION_V1			0x100	/* MIPI HCI Version number V1.0 */
 
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index 91e8a3833f3d..2b7560149520 100644
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
