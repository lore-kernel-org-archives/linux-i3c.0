Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02211C3DA64
	for <linux-i3c@archiver.kernel.org>; Tue, 23 Jul 2024 23:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OR7PoRWKwCWRcofOGrCMmq3qEJa4DgeXJnkXh/L4by4=; b=iet427Cx/mI+og
	ds6aE/1Juj5qDw6D5gXfPfAq3Hxid5jTeccEiycdKWbkEUuDQo8nNUBJfqwTsUCS730DIvrzuqvHH
	v2gGINsGKHKX3YwUhSQib5lsf8XkSFgW3UkrP15gK4nhJFyJrf8KrkEkOtbcQehe9PxtmcfGtdtlw
	fsf0AFngWYLqvJPrCf7XZIo6l9NEV04OB8DY5/0hXnAwTrUYwp14eqpviYesQ/3pYCxlBN2rkgKZo
	SDFSC6T4XoA0PF8qMPh+riBbvRI56CsLTbekw+S0ZgxLhqf6qOil0iDcSkObpaRxhDrGe/8rIilAC
	rFagnwMcXTn355JA9Rww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWPDc-0000000Dozz-2YpW;
	Tue, 23 Jul 2024 23:46:56 +0000
Received: from mail-dm6nam12on20600.outbound.protection.outlook.com ([2a01:111:f403:2417::600] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWJR3-0000000D8et-0sUP
	for linux-i3c@lists.infradead.org;
	Tue, 23 Jul 2024 17:36:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=myMSWdfSBUJRjKyxwxPBlDD04+P4SvE0ImeAqOD9tj4Yj1nroIvjHVEJnlFykKAEBZEOmyHYq+qnHttLQ9QiQ8KIMXX6/UM7mfvBNUmQ6nncJxfLdij4W/F5ZLmFY4GEpFSFxsq7Nrp3yImzFu9Z1+vDX5AU/PXEnRiH2P27glqLmafEM3DqYU1ycKAUvuHnUiZyerpl1icSbvNvACJEpCe4uHmODz8wWJwscHz7cXDOT5v7UOUsNVwcnluhHqfOIRiQOnCmbvR2cpYVHlUzpzdPRANTv3ZaoZdE+z6FPdWsMmoAh/5h7vLHCShUj1P9Mjw1WCIJcGaFHSJmrCw1rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=abEkoVyCVlmnqZh0zy/ndC5u3G3HYVhEVLUPlH5dyIs=;
 b=lE/AVUDmak+qkCOiofeEF65LvmgS1/3sU5nQnL/T6ViylDlNpwFisaiPBIIoQfgYh7MsKx3tq3KigYV+dClAg7NYH/nkFgIpf/2PiTrPc/cZHanZvd/MTaPLwhJewaYwFS1YPfg+yxAE9hvk45rHQQNU10RGioKbud++SIYWNkOgMqq7UPqRKi7T0FDHMM1AKXZW+YFS34aZDaPKy4/1MfXBgyiO59cUUxrmLcpwYplrfiH0nJhKXyEJKpGjQQhNH797fNOB/duVXHoWLk25NLqAsYqDTq9yB5S6Hu78NEI632qXN0LoSAGrUdKaFP2p2ywBPa3qWLAosuB1nBQ0bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=abEkoVyCVlmnqZh0zy/ndC5u3G3HYVhEVLUPlH5dyIs=;
 b=F6kKzLDIjFC2+3EodXm/J68akJsFJxBmg2/cHs+73Pkj/fsBsP40RZ3ag2SMbhgud45wYAZFvKtX2QqfTTBLBIkhc1nl+OpZ5Pp6usv8PyA/dWtSRH1/Zygxt6dN0k9YCae6fBL9WF9HoaSmakS4BmlZGSErXYPceNDSme0rwA8=
Received: from BN0PR02CA0034.namprd02.prod.outlook.com (2603:10b6:408:e5::9)
 by DS0PR12MB9448.namprd12.prod.outlook.com (2603:10b6:8:1bb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.33; Tue, 23 Jul
 2024 17:36:19 +0000
Received: from BN1PEPF00005FFE.namprd05.prod.outlook.com
 (2603:10b6:408:e5:cafe::71) by BN0PR02CA0034.outlook.office365.com
 (2603:10b6:408:e5::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17 via Frontend
 Transport; Tue, 23 Jul 2024 17:36:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00005FFE.mail.protection.outlook.com (10.167.243.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Tue, 23 Jul 2024 17:36:19 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 23 Jul
 2024 12:36:16 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jarkko Nikula
	<jarkko.nikula@linux.intel.com>
CC: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>, Krishnamoorthi M
	<krishnamoorthi.m@amd.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 3/5] i3c: mipi-i3c-hci: Relocate helper macros to HCI header file
Date: Tue, 23 Jul 2024 23:05:36 +0530
Message-ID: <20240723173538.3493935-4-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240723173538.3493935-1-Shyam-sundar.S-k@amd.com>
References: <20240723173538.3493935-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFE:EE_|DS0PR12MB9448:EE_
X-MS-Office365-Filtering-Correlation-Id: b7355927-4f2d-4427-ce95-08dcab3df63f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?I+pNieW8Xjo+pGMav/dVwTECNIYWiBctUdxxv8AyTshUy0b/ibe54UibJrN7?=
 =?us-ascii?Q?wFrQY2pLJ850UoopWnkvDH9DLrTBPg2ys8EkRjdYlenUg+cZsKM4K6qjJyQl?=
 =?us-ascii?Q?CQtBh8f4gg2VjlH7JIwoeZRQgQYMESZtK4xTYTSSkSt56nVQJUXRgUgoztDx?=
 =?us-ascii?Q?UQxSOMf6Lyu4g0TVZoQzBRjC2kWgzIuZLtNnam0UqPyVGLQR2KglwR7qiMQl?=
 =?us-ascii?Q?Ykr6emhJq4b3wMrvVO+qp3VldRxU7axNxsN7qnr6+aeuz+fA0SqEeTZxPhdw?=
 =?us-ascii?Q?rC2oVrVBNc+cDVuy6uXUfyALyzvW+6WkLRf5J8xzKLfb8fVD1skNUbu6FsfV?=
 =?us-ascii?Q?7lZnKan/vDeZFqIrbjKi3HWgZl/KZGu2z6jOIDQQIxkYIpoObzkRa6BxFXUS?=
 =?us-ascii?Q?pimlsauxChYzfXb4d9Q1LgxwWHyVIxGL0KocrYNw2H99AABkprbqrrAl/1uQ?=
 =?us-ascii?Q?bdYldeJMswlqOYLepffjr7GJKnwiLR+oTOQDgEAZSsvlZynl0Sr1AkblOQnK?=
 =?us-ascii?Q?zfBmwk49t6xMoT8JMcVVEwsFIDDdkgoskASidDFZEpM2l3LWLSQAltyVn+9R?=
 =?us-ascii?Q?+6768YK4uuSrDdcgkeIlGV51Y9LijhheAFAEI4pZWBZPaEDkY9szmUFfyEpd?=
 =?us-ascii?Q?UhvUCmo9JrjnG6X1EMgWuKiDslmRAEYpY8aAB4h7rqKsnLU+dx6xdpE4QraZ?=
 =?us-ascii?Q?MEKezNUK7ztnaMTWfhslRnqFFOec8nOsyUmRZEBh132P+cZe8DfGelzrdROf?=
 =?us-ascii?Q?tmNy3srLlO5UBTQcq+PXpUeGIdBrRDqyG+K8EB20/MeM4K0V9tUacW5gbeBM?=
 =?us-ascii?Q?1PrjnpUUWY4PCrXuBUhXVJKweIXQA/mWh6D1CPB8shKZhCamrka7zjXAVFO7?=
 =?us-ascii?Q?YxA0iRTrRil8UBy45XjmggjQGviacw5IPtNSStE7bIXmDuI9P1nRxEwIoaI9?=
 =?us-ascii?Q?dShIDxC5BJ/NbwsK5sPbHGezHIwIC2Nq649LFnirfuzoszSuAipfB6DnXYyE?=
 =?us-ascii?Q?+WmrMSlk66xgdB+2m0XFWTOuDAaLbIp0VCCUJCttglGDBDqSSC5Jh9UX/WVJ?=
 =?us-ascii?Q?YqOw0wIM5I3lokASlrBPLJxafxzb9F1PPAcDYu0052SpXAdBtfupVjkmjNiJ?=
 =?us-ascii?Q?rGeE1Tk/ytUH3XOMStY7g+J5c/fGOVpKPVqcJP0psc6iWxwnep8DXafrR5oQ?=
 =?us-ascii?Q?Ldhq/KbL3VoKnlZvhdNQMJ/ESRlI2blMdkqqM6+Br1Z5wJKLQaZlzcG7ap5m?=
 =?us-ascii?Q?YSHPi+JFflZOVYC/25FI3fgAwSvKUXLjf5ijUyZoCY3iu76yLPwI5+oCPwW4?=
 =?us-ascii?Q?LABrdiI7DLyXUlyJmnA6xsBxbS6hZ/KPW8ghdtgDxazgWEtyLzlH7FmBM17E?=
 =?us-ascii?Q?3RMxRKxLs5QllR0s6joyvLX7JDhZfKescCFmbQo7V7qG1c/WYMCO8n+LQltx?=
 =?us-ascii?Q?/K8d1OjoCcMg4ErTbdQ0TkwN/hvn1Fqt?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 17:36:19.1874
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7355927-4f2d-4427-ce95-08dcab3df63f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00005FFE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9448
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240723_103625_370948_CF7332A4 
X-CRM114-Status: GOOD (  10.18  )
X-Mailman-Approved-At: Tue, 23 Jul 2024 16:46:54 -0700
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
 drivers/i3c/master/mipi-i3c-hci/core.c | 5 -----
 drivers/i3c/master/mipi-i3c-hci/hci.h  | 4 ++++
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 8bb422ab1d01..ae5b1a144506 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -27,11 +27,6 @@
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
index 046b65d43e63..56361adbcc14 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci.h
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -26,6 +26,10 @@
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
