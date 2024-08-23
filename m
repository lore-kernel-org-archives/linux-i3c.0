Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 417AFC52D7C
	for <linux-i3c@archiver.kernel.org>; Fri, 23 Aug 2024 14:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yqvEvDhX1JJrWhnO/QjYVpLfJKYEXQ2C1FzjQd3mbYw=; b=bhb2d1394l8kFA
	v+1sRTAzMU/ORabXzSUKn+dCdVtOXhTP/X4AkjwQJ834O9IWzLI/f373/quB3ARj6DWItstDIgXyD
	jTgt7A0dprhESNhMxxy8iGxoCHBMdY/RHy9WAK6JZuyfDc8w8VcLuQ4+zGj6CjSrNxfRdRMnsN40y
	npv7cger6etydVmdR1NQr8Flsq2eZeKxtSsg4GLimCoEvAP57tQEzZi3O9az7i5trHVefgxfSbFhC
	+/2Q4QWmD3Gi5zpB9iYdkeYleBlHbR9+g9RtD/M5fxYqDiAY6V6QibEe+YVqVFZ6u+yWV+FpXhqXp
	Ne29VFQvCaw790jmC0Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shVAr-0000000H4Qx-42Z9;
	Fri, 23 Aug 2024 14:21:57 +0000
Received: from mail-dm6nam12on20613.outbound.protection.outlook.com ([2a01:111:f403:2417::613] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shVA6-0000000H4Et-27AX
	for linux-i3c@lists.infradead.org;
	Fri, 23 Aug 2024 14:21:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i/j7BWJ9+flnHidT7kEi32wPRMRZKSIdLnOYru/m8TqmixFdm7RoSuqnGC0XdWwIA0EvAJhbHRPw2G7I5AbfbAY1R+X3wooHOmSN5M514BN00f5Fp7f9aFIXRicRqW/OHHdJGh6n3ayKEuihVREm1w0Sf8f07GudYThe3oyt3+f6MgAyM6wqxWfN1zO+gk/2TSNTl8c4MC5jYft6eo8th59RuBSY6MMb/8d1d3N5o0bBdflv9997gwPF5DUBdP26P9+nroTxYHGy9SztE9iTbxd3vNQLLsuxRSNcpox9CHprKxO/InueE9D4lC/fuvEcSFoI+m3zD5vDefyRYd+GmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QdW0ZluYv0uTIXnmLUpn+8Gp1rCsUIqTvyQ3h36Yahs=;
 b=T3HgUvwuGS2qn8TqwWABOgdG33kgsiajv1Uikc1boTyGpUcwtbQkcaLvPlM+LaiQ6TTt7aNWAzDZtbpaj+phYk/50qO8TUp6bUi/FLGY4/hKjcoczA5d/PfXuZ4HNM52RSWcfk6RC82oXjcqcVnZIiE1rFrWppSxUjmimnAc5EV49YYtnUhPP7wiP9ggCBR6xQ3/0Ef9zIt9fsa9eSEnelb35/KA2OJC+FN9b/a8eT3IEzTdKqNfoLbsEc5Hz7sswtu2v4WfQyygGDgYThzP2GDhNvov6by9C+EO3DoJNMVhTLzqr4qqG5O3Nx3vzMNVsZ8iSLnAG8lYxgwf08xGVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QdW0ZluYv0uTIXnmLUpn+8Gp1rCsUIqTvyQ3h36Yahs=;
 b=2LkTtnD/LKP95vIVwfdo4o7zJR275CLAQHkkzsiCdrUyhLaWQBbH4bcFJ9nxSeP6/zVx8zMJtUMUqVRITzhzHp0h3CTis369TgNQSQHPETSCU3Nhh1yz4IaRl2gzdxK4bn/cAk0UUiL2sykI9Dt3Io0a4hkFTjN9INSgq4e/FMk=
Received: from DM6PR02CA0140.namprd02.prod.outlook.com (2603:10b6:5:332::7) by
 CH3PR12MB8075.namprd12.prod.outlook.com (2603:10b6:610:122::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7875.21; Fri, 23 Aug 2024 14:21:05 +0000
Received: from DS3PEPF0000C37C.namprd04.prod.outlook.com
 (2603:10b6:5:332:cafe::1c) by DM6PR02CA0140.outlook.office365.com
 (2603:10b6:5:332::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19 via Frontend
 Transport; Fri, 23 Aug 2024 14:21:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF0000C37C.mail.protection.outlook.com (10.167.23.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Fri, 23 Aug 2024 14:21:05 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 Aug
 2024 09:21:00 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jarkko Nikula
	<jarkko.nikula@linux.intel.com>
CC: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>, Krishnamoorthi M
	<krishnamoorthi.m@amd.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v5 4/6] i3c: mipi-i3c-hci: Relocate helper macros to HCI header file
Date: Fri, 23 Aug 2024 19:49:15 +0530
Message-ID: <20240823141917.692336-5-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240823141917.692336-1-Shyam-sundar.S-k@amd.com>
References: <20240823141917.692336-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37C:EE_|CH3PR12MB8075:EE_
X-MS-Office365-Filtering-Correlation-Id: 43a9ce0e-5858-461a-0751-08dcc37ed324
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QF1VVTy668+gJbNgDuKAZkBa0uvfipPwS/hQ0nIHpHZBpMucUOUZwDR/tSSt?=
 =?us-ascii?Q?LgRe0gD5EhBt5TXZidqZbfhh+06Zjn4KCd2WFncQBDs/zs4xgSFs0XIVUqM4?=
 =?us-ascii?Q?9hvgDQcK3PO+w+mN0zIJgE87pXNdBmKQxqIK+WeLO9zbwGoxwxiABGSGugw1?=
 =?us-ascii?Q?gsWifBxQfawKk30Zq4RPZWN1EsZ5w8Pp0Sm4+pIKg1PEcXqhC28DL/CqqTcW?=
 =?us-ascii?Q?SlKEfILGNauJacQIIiI8hR6KaddjKSOuYYooRFakGk5jNOcMgk/7YokU5cyd?=
 =?us-ascii?Q?E9/0S8ouM9pqQvbY3MJwlavAo4P1wiETkPioZge6EQdFCPRWAQpr9kSt/mq3?=
 =?us-ascii?Q?vxtN7dwEqA63wgQcAlTFs5wFD2OoTRt5Tld1eXD4KCcljORYcnfcIsZFJFLr?=
 =?us-ascii?Q?isIiqqsS7wUBnpaUVzRpJY6bhW/7qp6RDJVzCORsoNtS8cxfcxR4wcUqLLRM?=
 =?us-ascii?Q?2Z4/abUvM+uB73bgPVPgzvGqTCHUb3kumN+XuKFWZvGd6iD5ddh72PUPm1iI?=
 =?us-ascii?Q?KuWrHN/W7C/dkW3r4xUZbpNC/XqvEYdS7feywXJrXS5c+GNPHF5VObNMjqxc?=
 =?us-ascii?Q?GaOwxOQZhlXyIWj3LGec3FTW0HBe0scf6UWwxtHvvxISIttiF0JP6W3QUfGc?=
 =?us-ascii?Q?2FTh273D9cvgrkbfTzTW1j1sCaWOJErthduB+KRc4Jv0TQU/B+qgJcq5ZOIG?=
 =?us-ascii?Q?i6ZjsgIyhTZJ7Rv+9nB9fB3ipKilT1c3SBlPQ3d9i9IbrPQbOHNxVECq6J28?=
 =?us-ascii?Q?eL3uJRQpEEYleqBk4ukGkCXhg97gaBLV884xWPfTIUKjygOajf5s/4reaOyj?=
 =?us-ascii?Q?a48lvz51q5mPl6ZNYyfAhIWzoQB3uYzhpl9H12JTa0GKCCfWTHYBA8u+gv6N?=
 =?us-ascii?Q?/TVfDUIJ82tAG6x2nQMLBNUeK8tXZhsaVUpvdxq9BDv+hndj6dP8FfTm624g?=
 =?us-ascii?Q?jcrTcfvmBaUXvqBYgn0ZPsX+xs1EaIRdMMbgAVHobFwElkbsvEUPTK66w1EM?=
 =?us-ascii?Q?4wMgjPWJB0Awt8M614fr+zfQDZGcLHaHVn3BxXlREaPP2v9RliBCjqRaFCpz?=
 =?us-ascii?Q?869GDNFhHcPkhm5OuYuf1KT+unLfmOJvByNb29YyeJmxWufKLhxFGf7XyCYt?=
 =?us-ascii?Q?XVi0AdSmrcNXzyrvBQs5SzeW2T4D6POrho0Pb5PFfSrQKhqarCtU0XWTmMeL?=
 =?us-ascii?Q?bhw0+oJBSOKJ8RhVQdYmXs5r7t7sUTIJiUQ53YbjsDO6ijyKLrPzmWJEIEy0?=
 =?us-ascii?Q?qbLso/Cz/vWQq/2pNxUv0WAK0l8pCFaHGJbH2svmyIt8xa4afD2D5OWcKboR?=
 =?us-ascii?Q?go4AiwVd7mOvkFuEK6GqHzwwBsF2GEGz5b/9gGq0PXXFo9tpar5zf4tgedPU?=
 =?us-ascii?Q?8YaTC3jF/ZgBXTqdNScQQlAs56sCeublc1vb7xvD/v9S9I3T2ofa3a7w7j9t?=
 =?us-ascii?Q?Bq0Ck8OoFslX8yaiZhqGhAQRxqmpnMm7?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 14:21:05.4323
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43a9ce0e-5858-461a-0751-08dcc37ed324
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C37C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_072110_573214_AD77C10E 
X-CRM114-Status: GOOD (  11.16  )
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
index 03a63ad205ae..a64657ab5007 100644
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
 
 #define HC_CONTROL			0x04
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
