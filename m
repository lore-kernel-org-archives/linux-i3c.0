Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D69C71135
	for <linux-i3c@archiver.kernel.org>; Thu, 29 Aug 2024 09:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=82qhB266s5vjhR0dpcw8fJp29UajZq883XdHNB6X/1E=; b=IOOGQv9RSwhYjU
	+5hpSSdFXubM7zGjz+y1DSEJqTEYxwQPE2A4GjmzjbbhndhshLRClchqNqCZ523nyhDWzw0+yP/d9
	E2DS7cnBShBHb9ES7RoqawlfPwsIeOBujOzwWiufQRgfNI9Io5drqxYXY0KY0glX1pFYCEvw9HzlW
	/KexaTe7+kKvzgQcnrs58uOkCdzAk1aDdzbUxRhCWA6qc2FsGKOGqthET5c5UI6o41Jvrfkhg28qx
	itKdkSzM6dZdMq0eTEgTdiU1KIKOrlqSb1SYGJpq6p3XwhKZpivCBKBGiCh/T88a01ITZSRatlCl/
	c8rSuUAkjygjhz46yGJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjbI7-00000001KHN-3c5I;
	Thu, 29 Aug 2024 09:18:07 +0000
Received: from mail-mw2nam10on2061b.outbound.protection.outlook.com ([2a01:111:f403:2412::61b] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjbI4-00000001KEG-2xv6
	for linux-i3c@lists.infradead.org;
	Thu, 29 Aug 2024 09:18:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PXadxcOTAoxgWtPy9lu74xsxcPR3zwJC7B24TDvM30v8KkM9HoY4+VWJcqpC12+o78cN+iHd4I11pVPYtkTr8AaNjPAbM/K0POMOYnUTh8f1+EkcSdsThWQ6eL+j7VZPh8kFrHNob9OrhTWzH6ZPgEAXSr3YEjQr9nmg+LhJjIsb4QB/EXebKliOc3Tl6uPYV3eCvza/dcoHOnhjDTdZHeauFlUCNlbBoDpNEWFnc7rrPns0PNbMPDKuvwO7n5zX8TK7dYFX2bxKKEor3L4gujsOqSIMK1/ESNaLrmD/lIkb9z21EPQW3HQvRozVitGnojqTyXlmsN7rGzkXXY1BFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9d5Gk5/JUm7XtUbQv5NU0gsffOG+nCOQ2JvPqACiu6U=;
 b=Sag7BImCl97lpJs1pe3L/aqRd6goE3MzHxEOGEFZFrgRxyzydm9q/9an1MKhfRqOYAAF5kvXldcn22o4A8fnpXCme7g5JIQrphFltiHkbO7ep5+iTV5mhSw4ulotqrso8ujGj2AXrnCkOmGSTmh0bgvLBdo89/Alud7ineoDPm3I7GqFxtlUx3FblCNv2FwR/bVfX4QhyDYAqE/OYrnW11wSm33ttTUH7DjIRNIWeT9RXFNYAPJ0gH09km6p3UP/NjsjcaPb+eN/3GGgK/xyQqEY/OJzeaXsfFCfXeDnxWwcIF65dpo914L1NMwp0dfWd/9kS1QG5B13forYVozAEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9d5Gk5/JUm7XtUbQv5NU0gsffOG+nCOQ2JvPqACiu6U=;
 b=JxnN9d+ZmLJjLKbC6UAnxt+CHSIHgMnGbTxudWkrsvPskAzy5EIqcSVZIDLvqPpqhz+I6QQryMCTwQVIW6IJuEKDjKjb1r7VH/HxN5cXAOaktqNSc3GR4jU62xcrbV8yfXnYw17vh+6BtH4Jtq+cwROLC/wH3u6ynpw2zg1+uaE=
Received: from BN9PR03CA0940.namprd03.prod.outlook.com (2603:10b6:408:108::15)
 by CYYPR12MB8938.namprd12.prod.outlook.com (2603:10b6:930:c7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Thu, 29 Aug
 2024 09:17:58 +0000
Received: from BN2PEPF000055DF.namprd21.prod.outlook.com
 (2603:10b6:408:108:cafe::fa) by BN9PR03CA0940.outlook.office365.com
 (2603:10b6:408:108::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27 via Frontend
 Transport; Thu, 29 Aug 2024 09:17:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DF.mail.protection.outlook.com (10.167.245.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7939.2 via Frontend Transport; Thu, 29 Aug 2024 09:17:58 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 29 Aug
 2024 04:17:55 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jarkko Nikula
	<jarkko.nikula@linux.intel.com>
CC: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>, Krishnamoorthi M
	<krishnamoorthi.m@amd.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v6 4/6] i3c: mipi-i3c-hci: Relocate helper macros to HCI header file
Date: Thu, 29 Aug 2024 14:47:11 +0530
Message-ID: <20240829091713.736217-5-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240829091713.736217-1-Shyam-sundar.S-k@amd.com>
References: <20240829091713.736217-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DF:EE_|CYYPR12MB8938:EE_
X-MS-Office365-Filtering-Correlation-Id: 4878e49e-dd29-4121-4a86-08dcc80b793f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NpqSBJg3AE1r1+WXD1lEpPe0h23KOBeVDfHzRPXeRH68SicuIM3EjszqEWN+?=
 =?us-ascii?Q?pMZ5/VooLg2LS1icyI++P85B5dGF+In79RsMk7ITSRJDmfLuhHjNa5jU5Dvx?=
 =?us-ascii?Q?ueEH9gHAsEc6X789eol/WUh9dZGiHttew21o1ZpR6i/coP4fekJ8jbOagh8Q?=
 =?us-ascii?Q?n8RALXFnyLSER3v3k885Go9c43LNSmBfXv9emjBCbd9mH2l9BcMEf6rxp6a8?=
 =?us-ascii?Q?eFrksgTyIQ0H/uXKyBalOMBBmi5a8rjgrpBD21ucHC1UWsFyBLIDKADg1YYN?=
 =?us-ascii?Q?ghhwxNi6iHToIwmGwF/zyWCzmCR7A+ArmVEZ1/Jzx02LEJEgoPKdzf2WpjG3?=
 =?us-ascii?Q?8349r5hLgtaJqE/kbbZb1puWSNFnKVWwK/JiehP6kbNqkyQaKWZI2COc9yMW?=
 =?us-ascii?Q?eqk5VxuBO+2LxkzDA5SMtNa4EFmh03VjohU5CBDD6LR1S4uI4GBPTBG7xmhy?=
 =?us-ascii?Q?VjljPxBprJe9jMrHTDBAN+ohwVyZPDUHdqGWb095uXqklejNmXQCJRNSdhvS?=
 =?us-ascii?Q?Z+G4SSRhC+2dwsQHIaNvSs3wcSRFpEj9Do62olVW/ZEnigIB0hKf5gYQScmC?=
 =?us-ascii?Q?VH1dROUvlr5pShbiZjEewApK0MOyZIJEhssZ52cEZlczzsXqn/tS9KSgrYqT?=
 =?us-ascii?Q?c7gc/5r7vNId8uZ7L8aT4imhWUG9tArqwhclehgSElQeveBjqq4MQyE3fYoJ?=
 =?us-ascii?Q?7GNneKGPzZAYHmxIswA8u1trZbJoM8hm0chFV3BerHHc0vF/RS5LxsOQ2B2A?=
 =?us-ascii?Q?87vBgoFECjrcGjiKDTpdn99y6Gok7WOyfY4/Yhzp0g8p+pew5eWhFzsn2gG8?=
 =?us-ascii?Q?O7yddrH3ozUqx7ufEZ8pu632tEIDJDB+hiyrKrznt8PwmeCVdUkneQD4lXwV?=
 =?us-ascii?Q?mRWBPchlLykgUvkH7TjfIX77vWuHOQbkse/r5kTOEYU9A4IJaSLWlocosUqv?=
 =?us-ascii?Q?2f9YEncAFF0CGwhtN2RcVYj4AXjSnjGGOMoJeW014OSXtNFxv9vXS9wt9Z0L?=
 =?us-ascii?Q?rWx05ZEG97GC8eQNOAHG8ysrWQ2lanqXhVfshetRvTaUj/M7pSaj0hgVRMUW?=
 =?us-ascii?Q?PX6GKJK1zGco4y3vzw66jiY0OaCZQwlFPhOp/I6Bgcqa3ScE8DgVmT2K9Ftk?=
 =?us-ascii?Q?JW0jNsctFcVOBZE9hdDNJbQVUhPVA8bWg8GLnKs5LMfoS8Pz1boQae8x1Boa?=
 =?us-ascii?Q?+K6vFvWH8AmVJa+Sw87QDGsXUYwK070V7FGfytdi+Oq7fqGfqRWTdXbrPXRa?=
 =?us-ascii?Q?ZlC3iAl35xMMuZcDBtEe8LJyut5BBTkvlrvcrK9zQq/vK/fDZmcSyKtc5sfF?=
 =?us-ascii?Q?WCXMAewUcA8bj+i9jp3aW7T2U8d6Y4Cxl96srHv8mPoaaqwnHXm6JuSN4L7O?=
 =?us-ascii?Q?0EgzsklaER8js1AFzlnrFeeNlvAg6MNLR7tAba7dcMQSDjaOAYbzh2ioyULB?=
 =?us-ascii?Q?cWiLDeTNEzpOSRtKkTE2toys9nALx79B?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 09:17:58.1654
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4878e49e-dd29-4121-4a86-08dcc80b793f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DF.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8938
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240829_021804_792391_002F3E7D 
X-CRM114-Status: GOOD (  11.85  )
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
index 23abf91b277b..c03e86690073 100644
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
