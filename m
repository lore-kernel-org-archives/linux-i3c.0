Return-Path: <SRS0=EbLq=4F=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DBE6C35254
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Feb 2020 11:03:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6EEA2072C
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Feb 2020 11:03:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CdQ8RgmU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=silvaco.com header.i=@silvaco.com header.b="IGCA+1Q2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6EEA2072C
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=silvaco.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9suDoFVMiIKHuvvbMg/3VXPQNFbnjkpUn3ggTpDMxz4=; b=CdQ8RgmUqVecv6
	tkFS1SoxM/z3iHSER1oBaCwJ7AZnra/Eogkx+zcG5U/xbDBqgv5RVAOW+kw/Gt4y0VnRCmStswnF7
	zEEkwAUp0dF5GlO7YIGcq5ijwd4pncs1KIhBeK+L1Xp2HSI/HWFFseDvB/rbPbBTREku7D30KWUoT
	sFZHy/c/d6jKvfGuEwTgXWWbzTx6BlGUy8xc3quw+6Co6w3KgLFS1ZvbTnxVpcQY51t/34Ia0AhZD
	9gk8SRSnk9vSAc0ZfPqtPrnpJkzpgQNnEUdkT6CDQpqZ3eBI6ALwHpfq5m6Nd/z4/6wik9xGoUZzM
	c5E5q4R7VgV4mkmVkcbg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3eBu-0001UW-2T; Mon, 17 Feb 2020 11:03:54 +0000
Received: from mail-dm6nam12on2057.outbound.protection.outlook.com
 ([40.107.243.57] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1Xhp-0001KD-9A
 for linux-i3c@lists.infradead.org; Tue, 11 Feb 2020 15:44:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PR4cJpz6/fv1nMWpztGNh85iTSSKaRn6xkXtz6BfS0jg9Ukfrp2eAbafmtAUMhJpNqR0TJoP8Og653hvLzxLAXh7++Fwn8bBp207SjQ58hjbR+R5rSgOSnMln7VHRu+g2/t1mW7JiVqHDytHpaWzNtCTffT7z7OeBzyAq7R9KwyQmdwS0xWSzfEM0aQcJ+pr/FpavUT4dAkMz8E630pEMLFQn1RjeTX2Pux71glNki+zzEYqd+W0sxsNLeZQlgb+1pJU8l2sspXiz9BcAtHDiVjvufTDxHc2lcYGVX9sunW6hugQUiB0Z2/W9I2jA4aSDMnfZ95/6f+5x2Se5yvcMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kBSkgV+hH90D2gXUoZjrVtJwpQu5dlGN9SY++zjFZF0=;
 b=RWpQmb+u5MBTdtaVqmTikWESRUhPcgYBTBXPPJ6oON29ZN9NY2Cf4GRLJe7TNkCaVfmWhpn6R2Wg6fW4tYhHo6V97+BgVp7OKT1BDAQR2b6HAsbWouFwqQQlVEnfzfcOhkNho5chMWg6pUZCpO17tVUlngPiFuGv31eKbxCMoHMZvjT8M11C90AtfXqFqu+xY/SSn4EqehZd+ovF+WBAxAL64wmsYKtUgMiGubI1diizVLY54q60qdmL2jIbrQPl0zYqheTZ8H2oAxEH3yMQhpVZNrzEgLWko3UVXSQLntpC/Au2ovdOMbgDHFyHWVGB2ghDmlgFAN7bjJcNEdzVmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silvaco.com; dmarc=pass action=none header.from=silvaco.com;
 dkim=pass header.d=silvaco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silvaco.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kBSkgV+hH90D2gXUoZjrVtJwpQu5dlGN9SY++zjFZF0=;
 b=IGCA+1Q2NR16ZDxDwUrd1ghjPCWnjqpMvKIZyRkIV4NxSEpCpliGVC6CRSWnpsVC4UF8e6NvkYiDAKcOTIJWM9CqQInHNVdGv5z/UMOXxquNvEJoVVyjcHFZ0PIHDT8uksifoJkBbBiMDJ991BLQEBns7kAaC0hBNDpYjfBH4is=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=conor.culhane@silvaco.com; 
Received: from BN8PR16MB2929.namprd16.prod.outlook.com (20.178.217.28) by
 BN8PR16MB2785.namprd16.prod.outlook.com (20.178.213.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.25; Tue, 11 Feb 2020 15:44:04 +0000
Received: from BN8PR16MB2929.namprd16.prod.outlook.com
 ([fe80::94e6:6fdc:3c5a:f3d5]) by BN8PR16MB2929.namprd16.prod.outlook.com
 ([fe80::94e6:6fdc:3c5a:f3d5%7]) with mapi id 15.20.2707.030; Tue, 11 Feb 2020
 15:44:04 +0000
From: Conor Culhane <conor.culhane@silvaco.com>
To: bbrezillon@kernel.org
Subject: [PATCH] Add a driver for Silvaco I3C Dual-Role Master IP
Date: Tue, 11 Feb 2020 10:43:32 -0500
Message-Id: <20200211154332.21764-1-conor.culhane@silvaco.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: CH2PR12CA0003.namprd12.prod.outlook.com
 (2603:10b6:610:57::13) To BN8PR16MB2929.namprd16.prod.outlook.com
 (2603:10b6:408:5c::28)
MIME-Version: 1.0
Received: from localhost.localdomain (24.99.164.72) by
 CH2PR12CA0003.namprd12.prod.outlook.com (2603:10b6:610:57::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.22 via Frontend Transport; Tue, 11 Feb 2020 15:44:03 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [24.99.164.72]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6000a9cc-5895-43f9-cc98-08d7af0938cf
X-MS-TrafficTypeDiagnostic: BN8PR16MB2785:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN8PR16MB278587BB31956307C997D5D6F1180@BN8PR16MB2785.namprd16.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:313;
X-Forefront-PRVS: 0310C78181
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(366004)(199004)(189003)(5660300002)(36756003)(956004)(66946007)(52116002)(66476007)(26005)(2616005)(69590400006)(44832011)(2906002)(16526019)(8936002)(107886003)(6512007)(6666004)(4326008)(66556008)(81166006)(81156014)(8676002)(186003)(1076003)(6916009)(6506007)(86362001)(498600001)(30864003)(6486002)(559001)(579004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR16MB2785;
 H:BN8PR16MB2929.namprd16.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: silvaco.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BmJIjqFSDmYe5G20isSAkUhOLUGT6cM+OZQkRibqMxjq9kw0Njg+e89rTTVf1t/L/nMEJcDjYkU0YgiwqcogTV16Zb+s1AHBM2YLG1fbs2shKxLnxt4uLoNYFRJ8/OdJmCyKUeeR2AZfGpS5EcB4yPh5dkwIu5e6TqM9RW0dOiIoTcc19vK4j55gPv+tjM9+byel4Li+PLkrSxJin8xyiZRpQpoAEbU29CNnbCdfx/eczBAPvQAh+KM66P+ik55C4xuzl956VNOl4BdPY4rAk4eIJ0SXXGhT+9L7IAxvcH4AkivlMZYTC4dVMVv6W7jbxr+nuRT+iD0mvNet7CDVKBj35B3M+KthLJ4I5p1nEEbVMP3PAoC+zTLF7rUxVbQCVnaTelO4TuRHShgAHRgyZTitxDwLGODks/5S+sDGTtS1K0mGYzmVA89LicpDzrNyORu2OKjA5rGaTfciYurdCH4p8pSIZUDJDqvd0L8IxLZHkg3YClbqbjt0VdTaSYgOvppWbpbqwXdtZ2URP9e0WxNKcQTAQy+FQqFvt2WYgs4=
X-MS-Exchange-AntiSpam-MessageData: adXFVxI1N4oP+PA2wKJ2ubcLtIhqto/RlhPm7Niix5EBa3oFC0CxS0vMJc1QxB0/+1kFIKJynToUao0YAIWBipkHqRCwy6cN7JfYU//3mPqaODImsQ4CDT6KGAbUwc5UvZfs2niOL/ronjfv9yZ/ZQ==
X-OriginatorOrg: silvaco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6000a9cc-5895-43f9-cc98-08d7af0938cf
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2020 15:44:04.1052 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a05727a6-bf2e-49ca-8724-5589374698e1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ltvP0e28HQT05dyor7KP4EvYVwZSpESFPNIfljfrLsIdV+92En23CRtE8ENuZzKFMcVNFL9FIXUaPDySxt5qObodAyakmM8DXOacev2I0YU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR16MB2785
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200211_074409_505330_3CC857CB 
X-CRM114-Status: UNSURE (   9.03  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Mon, 17 Feb 2020 03:03:53 -0800
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: linux-i3c@lists.infradead.org, Conor Culhane <conor.culhane@silvaco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Signed-off-by: Conor Culhane <conor.culhane@silvaco.com>
---
 drivers/i3c/master/Kconfig          |    8 +
 drivers/i3c/master/Makefile         |    1 +
 drivers/i3c/master/svc-i3c-master.c | 2863 +++++++++++++++++++++++++++
 3 files changed, 2872 insertions(+)
 create mode 100644 drivers/i3c/master/svc-i3c-master.c

diff --git a/drivers/i3c/master/Kconfig b/drivers/i3c/master/Kconfig
index 4e80a1fcbf91..032b4de14277 100644
--- a/drivers/i3c/master/Kconfig
+++ b/drivers/i3c/master/Kconfig
@@ -21,3 +21,11 @@ config DW_I3C_MASTER
 
 	  This driver can also be built as a module.  If so, the module
 	  will be called dw-i3c-master.
+
+config SVC_I3C_MASTER
+	tristate "Silvaco I3C Dual-Role Master driver"
+	depends on I3C
+	depends on HAS_IOMEM
+	depends on !(ALPHA || PARISC)
+	help
+	  Support for Silvaco I3C Dual-Role Master Controller.
diff --git a/drivers/i3c/master/Makefile b/drivers/i3c/master/Makefile
index 7eea9e086144..4efd244fdfb1 100644
--- a/drivers/i3c/master/Makefile
+++ b/drivers/i3c/master/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_CDNS_I3C_MASTER)		+= i3c-master-cdns.o
 obj-$(CONFIG_DW_I3C_MASTER)		+= dw-i3c-master.o
+obj-$(CONFIG_SVC_I3C_MASTER)		+= svc-i3c-master.o
\ No newline at end of file
diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
new file mode 100644
index 000000000000..38c79529a082
--- /dev/null
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -0,0 +1,2863 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2020 Silvaco, Inc.
+ *
+ * Author: Conor Culhane <conor.culhane@silvaco.com>
+ */
+
+#include <linux/bitops.h>
+#include <linux/clk.h>
+#include <linux/completion.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/i3c/master.h>
+#include <linux/interrupt.h>
+#include <linux/ioport.h>
+#include <linux/iopoll.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+
+#define I3C_MCONFIG_OFFSET 0x000
+#define I3C_MCTRL_OFFSET 0x084
+#define I3C_MSTATUS_OFFSET 0x088
+#define I3C_IBIRULES_OFFSET 0x08C
+#define I3C_MINTSET_OFFSET 0x090
+#define I3C_MINTCLR_OFFSET 0x094
+#define I3C_MINTMASKED_OFFSET 0x098
+#define I3C_MERRWARN_OFFSET 0x09C
+#define I3C_MDMACTRL_OFFSET 0x0A0
+#define I3C_MDATACTRL_OFFSET 0x0AC
+#define I3C_MWDATAB_OFFSET 0x0B0
+#define I3C_MWDATABE_OFFSET 0x0B4
+#define I3C_MWDATAH_OFFSET 0x0B8
+#define I3C_MWDATAHE_OFFSET 0x0BC
+#define I3C_MRDATAB_OFFSET 0x0C0
+#define I3C_MRDATAH_OFFSET 0x0C8
+#define I3C_MWMSG_SDR_OFFSET 0x0D0
+#define I3C_MRMSG_SDR_OFFSET 0x0D4
+#define I3C_MWMSG_DDR_OFFSET 0x0D8
+#define I3C_MRMSG_DDR_OFFSET 0x0DC
+#define I3C_MDYNADDR_OFFSET 0x0E4
+#define I3C_CONFIG_OFFSET 0x004
+#define I3C_STATUS_OFFSET 0x008
+#define I3C_CTRL_OFFSET 0x00C
+#define I3C_INTSET_OFFSET 0x010
+#define I3C_INTCLR_OFFSET 0x014
+#define I3C_INTMASKED_OFFSET 0x018
+#define I3C_ERRWARN_OFFSET 0x01C
+#define I3C_DMACTRL_OFFSET 0x020
+#define I3C_DATACTRL_OFFSET 0x02C
+#define I3C_WDATAB_OFFSET 0x030
+#define I3C_WDATABE_OFFSET 0x034
+#define I3C_WDATAH_OFFSET 0x038
+#define I3C_WDATAHE_OFFSET 0x03C
+#define I3C_RDATAB_OFFSET 0x040
+#define I3C_RDATAH_OFFSET 0x048
+#define I3C_CAPABILITIES_OFFSET 0x060
+#define I3C_DYNADDR_OFFSET 0x064
+#define I3C_MAXLIMITS_OFFSET 0x068
+#define I3C_PARTNO_OFFSET 0x06C
+#define I3C_IDEXT_OFFSET 0x070
+#define I3C_VENDORID_OFFSET 0x074
+#define I3C_TCCLOCK_OFFSET 0x078
+#define I3C_ID_OFFSET 0xFFC
+#define I3C_MCONFIG_MSTENA_MASK 0x00000003
+#define I3C_MCONFIG_MSTENA_SHFT 0
+#define I3C_MCONFIG_MSTENA_DISABLE 0
+#define I3C_MCONFIG_MSTENA_ENABLE 1
+#define I3C_MCONFIG_MSTENA_CAPABLE 2
+#define I3C_MCONFIG_DISTO_MASK 0x00000008
+#define I3C_MCONFIG_DISTO_SHFT 3
+#define I3C_MCONFIG_HKEEP_MASK 0x00000030
+#define I3C_MCONFIG_HKEEP_SHFT 4
+#define I3C_MCONFIG_HKEEP_NONE 0
+#define I3C_MCONFIG_HKEEP_ON_CHIP 1
+#define I3C_MCONFIG_HKEEP_EXT_SDA 2
+#define I3C_MCONFIG_HKEEP_EXT_SDA_SCL 3
+#define I3C_MCONFIG_ODSTOP_MASK 0x00000040
+#define I3C_MCONFIG_ODSTOP_SHFT 6
+#define I3C_MCONFIG_PPBAUD_MASK 0x00000F00
+#define I3C_MCONFIG_PPBAUD_SHFT 8
+#define I3C_MCONFIG_PPLOW_MASK 0x0000F000
+#define I3C_MCONFIG_PPLOW_SHFT 12
+#define I3C_MCONFIG_ODBAUD_MASK 0x00FF0000
+#define I3C_MCONFIG_ODBAUD_SHFT 16
+#define I3C_MCONFIG_ODHPP_MASK 0x01000000
+#define I3C_MCONFIG_ODHPP_SHFT 24
+#define I3C_MCONFIG_SKEW_MASK 0x0E000000
+#define I3C_MCONFIG_SKEW_SHFT 25
+#define I3C_MCONFIG_I2CBAUD_MASK 0xF0000000
+#define I3C_MCONFIG_I2CBAUD_SHFT 28
+#define I3C_MCTRL_REQUEST_MASK 0x00000007
+#define I3C_MCTRL_REQUEST_SHFT 0
+#define I3C_MCTRL_REQUEST_NONE 0
+#define I3C_MCTRL_REQUEST_START_ADDR 1
+#define I3C_MCTRL_REQUEST_STOP 2
+#define I3C_MCTRL_REQUEST_IBI_ACKNACK 3
+#define I3C_MCTRL_REQUEST_PROC_DAA 4
+#define I3C_MCTRL_REQUEST_RESERVED 5
+#define I3C_MCTRL_REQUEST_FORCE_EXIT 6
+#define I3C_MCTRL_REQUEST_AUTO_IBI 7
+#define I3C_MCTRL_TYPE_MASK 0x00000030
+#define I3C_MCTRL_TYPE_SHFT 4
+#define I3C_MCTRL_TYPE_I3C (0)
+#define I3C_MCTRL_TYPE_I2C (1 << I3C_MCTRL_TYPE_SHFT)
+#define I3C_MCTRL_TYPE_HDR_DDR (2 << I3C_MCTRL_TYPE_SHFT)
+#define I3C_MCTRL_IBIRESP_MASK 0x000000C0
+#define I3C_MCTRL_IBIRESP_SHFT 6
+#define I3C_MCTRL_IBIRESP_ACK (0)
+#define I3C_MCTRL_IBIRESP_ACK_NO_BYTE (0)
+#define I3C_MCTRL_IBIRESP_NACK (1 << I3C_MCTRL_IBIRESP_SHFT)
+#define I3C_MCTRL_IBIRESP_ACK_WITH_BYTE (2 << I3C_MCTRL_IBIRESP_SHFT)
+#define I3C_MCTRL_IBIRESP_MANUAL (3 << I3C_MCTRL_IBIRESP_SHFT)
+#define I3C_MCTRL_DIR_MASK 0x00000100
+#define I3C_MCTRL_DIR_SHFT 8
+#define I3C_MCTRL_DIR_WRITE (0)
+#define I3C_MCTRL_DIR_READ (1 << I3C_MCTRL_DIR_SHFT)
+#define I3C_MCTRL_ADDR_MASK 0x0000FE00
+#define I3C_MCTRL_ADDR_SHFT 9
+#define I3C_MCTRL_RDTERM_MASK 0x00FF0000
+#define I3C_MCTRL_RDTERM_SHFT 16
+#define I3C_MSTATUS_STATE_MASK 0x00000007
+#define I3C_MSTATUS_STATE_SHFT 0
+#define I3C_MSTATUS_STATE_IDLE 0
+#define I3C_MSTATUS_STATE_SLVREQ 1
+#define I3C_MSTATUS_STATE_MSGSDR 2
+#define I3C_MSTATUS_STATE_NORMACT 3
+#define I3C_MSTATUS_STATE_DDR 4
+#define I3C_MSTATUS_STATE_DAA 5
+#define I3C_MSTATUS_STATE_IBIACK 6
+#define I3C_MSTATUS_STATE_IBIRCV 7
+#define I3C_MSTATUS_BETWEEN_MASK 0x00000010
+#define I3C_MSTATUS_BETWEEN_SHFT 4
+#define I3C_MSTATUS_NACKED_MASK 0x00000020
+#define I3C_MSTATUS_NACKED_SHFT 5
+#define I3C_MSTATUS_IBITYPE_MASK 0x000000C0
+#define I3C_MSTATUS_IBITYPE_SHFT 6
+#define I3C_MSTATUS_IBITYPE_NONE 0
+#define I3C_MSTATUS_IBITYPE_NORMAL 1
+#define I3C_MSTATUS_IBITYPE_MASTER_REQ 2
+#define I3C_MSTATUS_IBITYPE_HOT_JOIN 3
+#define I3C_MSTATUS_SLVSTART_MASK 0x00000100
+#define I3C_MSTATUS_SLVSTART_SHFT 8
+#define I3C_MSTATUS_MCTRLDONE_MASK 0x00000200
+#define I3C_MSTATUS_MCTRLDONE_SHFT 9
+#define I3C_MSTATUS_COMPLETE_MASK 0x00000400
+#define I3C_MSTATUS_COMPLETE_SHFT 10
+#define I3C_MSTATUS_RXPEND_MASK 0x00000800
+#define I3C_MSTATUS_RXPEND_SHFT 11
+#define I3C_MSTATUS_TXNOTFULL_MASK 0x00001000
+#define I3C_MSTATUS_TXNOTFULL_SHFT 12
+#define I3C_MSTATUS_IBIWON_MASK 0x00002000
+#define I3C_MSTATUS_IBIWON_SHFT 13
+#define I3C_MSTATUS_ERRWARN_MASK 0x00008000
+#define I3C_MSTATUS_ERRWARN_SHFT 15
+#define I3C_MSTATUS_NOWMASTER_MASK 0x00080000
+#define I3C_MSTATUS_NOWMASTER_SHFT 19
+#define I3C_MSTATUS_IBIADDR_MASK 0x7F000000
+#define I3C_MSTATUS_IBIADDR_SHFT 24
+#define I3C_MINT_SLVSTART_MASK 0x00000100
+#define I3C_MINT_MCTRLDONE_MASK 0x00000200
+#define I3C_MINT_COMPLETE_MASK 0x00000400
+#define I3C_MINT_RXPEND_MASK 0x00000800
+#define I3C_MINT_TXNOTFULL_MASK 0x00001000
+#define I3C_MINT_IBIWON_MASK 0x00002000
+#define I3C_MINT_ERRWARN_MASK 0x00008000
+#define I3C_MINT_NOWMASTER_MASK 0x00080000
+#define I3C_MERRWARN_NACK 0x00000004
+#define I3C_MERRWARN_WRABT 0x00000008
+#define I3C_MERRWARN_TERM 0x00000010
+#define I3C_MERRWARN_HPAR 0x00000200
+#define I3C_MERRWARN_HCRC 0x00000400
+#define I3C_MERRWARN_OREAD 0x00010000
+#define I3C_MERRWARN_OWRITE 0x00020000
+#define I3C_MERRWARN_MSGERR 0x00040000
+#define I3C_MERRWARN_INVREQ 0x00080000
+#define I3C_MERRWARN_TIMEOUT 0x00100000
+#define I3C_MDATACTRL_FLUSHTB_MASK 0x00000001
+#define I3C_MDATACTRL_FLUSHTB I3C_MDATACTRL_FLUSHTB_MASK
+#define I3C_MDATACTRL_FLUSHRB_MASK 0x00000002
+#define I3C_MDATACTRL_FLUSHRB I3C_MDATACTRL_FLUSHRB_MASK
+#define I3C_MDATACTRL_UNLOCK_MASK 0x00000008
+#define I3C_MDATACTRL_UNLOCK_TRIG I3C_MDATACTRL_UNLOCK_MASK
+#define I3C_MDATACTRL_TXTRIG_MASK 0x00000030
+#define I3C_MDATACTRL_TXTRIG_SHFT 4
+#define I3C_MDATACTRL_TXTRIG_FIFO_EMPTY (0)
+#define I3C_MDATACTRL_TXTRIG_FIFO_QTR_FULL (1 << I3C_MDATACTRL_TXTRIG_SHFT)
+#define I3C_MDATACTRL_TXTRIG_FIFO_HALF_FULL (2 << I3C_MDATACTRL_TXTRIG_SHFT)
+#define I3C_MDATACTRL_TXTRIG_FIFO_NOT_FULL (3 << I3C_MDATACTRL_TXTRIG_SHFT)
+#define I3C_MDATACTRL_RXTRIG_MASK 0x000000C0
+#define I3C_MDATACTRL_RXTRIG_SHFT 6
+#define I3C_MDATACTRL_RXTRIG_FIFO_NOT_EMPTY (0)
+#define I3C_MDATACTRL_RXTRIG_FIFO_QTR_FULL (1 << I3C_MDATACTRL_RXTRIG_SHFT)
+#define I3C_MDATACTRL_RXTRIG_FIFO_HALF_FULL (2 << I3C_MDATACTRL_RXTRIG_SHFT)
+#define I3C_MDATACTRL_RXTRIG_FIFO_3QTR_FULL (3 << I3C_MDATACTRL_RXTRIG_SHFT)
+#define I3C_MDATACTRL_TXCOUNT_MASK 0x001F0000
+#define I3C_MDATACTRL_TXCOUNT_SHFT 16
+#define I3C_MDATACTRL_RXCOUNT_MASK 0x1F000000
+#define I3C_MDATACTRL_RXCOUNT_SHFT 24
+#define I3C_MDATACTRL_TXFULL_MASK 0x40000000
+#define I3C_MDATACTRL_RXEMPTY_MASK 0x80000000
+#define I3C_MWMSG_SDR_DIR_MASK 0x00000001
+#define I3C_MWMSG_SDR_DIR_READ 1
+#define I3C_MWMSG_SDR_DIR_WRITE 0
+#define I3C_MWMSG_SDR_ADDR_MASK 0x000000FE
+#define I3C_MWMSG_SDR_ADDR_SHFT 1
+#define I3C_MWMSG_SDR_END_MASK 0x00000100
+#define I3C_MWMSG_SDR_END_SHFT 8
+#define I3C_MWMSG_SDR_END_STOP (1 << I3C_MWMSG_SDR_END_SHFT)
+#define I3C_MWMSG_SDR_MODE_MASK 0x00000400
+#define I3C_MWMSG_SDR_MODE_SHFT 10
+#define I3C_MWMSG_SDR_MODE_I2C (1 << I3C_MWMSG_SDR_MODE_SHFT)
+#define I3C_MWMSG_SDR_MODE_I3C (0 << I3C_MWMSG_SDR_MODE_SHFT)
+#define I3C_MWMSG_SDR_LEN_MASK 0x0000F800
+#define I3C_MWMSG_SDR_LEN_SHFT 11
+#define I3C_MWMSG_SDR_DATA_MASK 0x0000FFFF
+#define I3C_MRMSG_SDR_DATA_MASK 0x0000FFFF
+#define I3C_MRMSG_SDR_CLEN_MASK 0x003F0000
+#define I3C_MRMSG_SDR_CLEN_SHFT 16
+#define I3C_MWMSG_DDR_CTRL_LEN_MASK 0x000003FF
+#define I3C_MWMSG_DDR_CTRL_END_MASK 0x00004000
+#define I3C_MWMSG_DDR_CTRL_END_SHFT 14
+#define I3C_MWMSG_DDR_CTRL_END_EXIT_HDR (1 << I3C_MWMSG_DDR_CTRL_END_SHFT)
+#define I3C_MWMSG_DDR_ADDRCMD_HDR_MODE_CMD_MASK 0x0000007F
+#define I3C_MWMSG_DDR_ADDRCMD_DIR_MASK 0x00000080
+#define I3C_MWMSG_DDR_ADDRCMD_DIR_SHFT 7
+#define I3C_MWMSG_DDR_ADDRCMD_DIR_READ (1 << I3C_MWMSG_DDR_ADDRCMD_DIR_SHFT)
+#define I3C_MWMSG_DDR_ADDRCMD_DIR_WRITE (0 << I3C_MWMSG_DDR_ADDRCMD_DIR_SHFT)
+#define I3C_MWMSG_DDR_ADDRCMD_ADDR_MASK 0x0000FE00
+#define I3C_MWMSG_DDR_ADDRCMD_ADDR_SHFT 9
+#define I3C_MWMSG_DDR_DATA_MASK 0x0000FFFF
+#define I3C_MRMSG_DDR_DATA_MASK 0x0000FFFF
+#define I3C_MRMSG_DDR_CLEN_MASK 0x03FF0000
+#define I3C_MRMSG_DDR_CLEN_SHFT 16
+#define I3C_CONFIG_SLVENA_MASK 0x00000001
+#define I3C_CONFIG_SLVENA_SHFT 0
+#define I3C_CONFIG_NACK_MASK 0x00000002
+#define I3C_CONFIG_NACK_SHFT 1
+#define I3C_CONFIG_MATCHSS_MASK 0x00000004
+#define I3C_CONFIG_MATCHSS_SHFT 2
+#define I3C_CONFIG_S0IGNORE_MASK 0x00000008
+#define I3C_CONFIG_S0IGNORE_SHFT 3
+#define I3C_CONFIG_DDROK_MASK 0x00000010
+#define I3C_CONFIG_DDROK_SHFT 4
+#define I3C_CONFIG_IRAND_MASK 0x00000100
+#define I3C_CONFIG_IRAND_SHFT 8
+#define I3C_CONFIG_BAMATCH_MASK 0x00FF0000
+#define I3C_CONFIG_BAMATCH_SHFT 16
+#define I3C_CONFIG_SADDR_MASK 0xFE000000
+#define I3C_CONFIG_SADDR_SHFT 25
+#define I3C_INT_START_MASK 0x00000100
+#define I3C_INT_MATCHED_MASK 0x00000200
+#define I3C_INT_STOP_MASK 0x00000400
+#define I3C_INT_RXPEND_MASK 0x00000800
+#define I3C_INT_TXNOTFULL_MASK 0x00001000
+#define I3C_INT_DACHG_MASK 0x00002000
+#define I3C_INT_CCC_MASK 0x00004000
+#define I3C_INT_ERRWARN_MASK 0x00008000
+#define I3C_INT_DDRMATCH_MASK 0x00010000
+#define I3C_INT_CHANDLED_MASK 0x00020000
+#define I3C_INT_EVENT_MASK 0x00040000
+
+#define I3C_HW_FIFO_DEPTH 16
+
+#define I3C_DRV_VER_MAJOR 0
+#define I3C_DRV_VER_MINOR 1
+
+typedef __u32 uint32;
+typedef __s32 int32;
+typedef __u16 uint16;
+typedef __s16 int16;
+typedef __u8 uint8;
+typedef __s8 int8;
+
+typedef void (*fpEventHandler_t)(void *vpDriver, uint32 event);
+
+typedef enum {
+	SVC_DRV_CTRL_DISABLE = 0,
+	SVC_DRV_CTRL_ENABLE = 1
+} svc_drv_ctrl_enable_t;
+
+#define SVC_DRV_ERR_NONE (0)
+#define SVC_DRV_ERR_INVALID_PARAM (-EINVAL)
+#define SVC_DRV_ERR_NOT_SUPPORTED (-EPERM)
+#define SVC_DRV_ERR_NOT_IMPLEMENTED (-EPERM)
+#define SVC_DRV_ERR_I3C_TOO_MANY_DEV (-EPERM)
+#define SVC_DRV_ERR_I3C_BUSY (-EBUSY)
+#define SVC_DRV_ERR_I3C_XFER_ERR (-EIO)
+
+#define PUT_UINT32(_addr, _val) writel(_val, _addr)
+#define PUT_UINT16(_addr, _val) writew(_val, _addr)
+#define PUT_UINT8(_addr, _val) writeb(_val, _addr)
+
+#define GET_UINT32(_addr, _pVal) *_pVal = readl(_addr)
+#define GET_UINT16(_addr, _pVal) *_pVal = readw(_addr)
+#define GET_UINT8(_addr, _pVal) *_pVal = readb(_addr)
+
+#define svc_printf printk
+
+#define I3C_MAX_DEVICES 16
+
+#define I3C_PROV_ID_SIZE 8
+
+#define I3C_PPBAUD_MAX 15
+#define I3C_PPLOW_MAX 15
+#define I3C_ODBAUD_MAX 255
+#define I3C_SKEW_MAX 7
+#define I3C_I2CBAUD_MAX 15
+
+#ifndef I3C_BROADCAST_ADDR
+#define I3C_BROADCAST_ADDR 0x7E /*!< I3C Broadcast Address */
+#endif
+
+#define I3C_INVALID_ADDR 0xFF
+
+#define IBI_DATA_MAX_SIZE 4
+
+typedef enum {
+	I3C_CTRL_GET_VERSION,
+	I3C_CTRL_CFG_MASTER_ENABLE,
+	I3C_CTRL_CFG_TIMEOUT_ERR_ENABLE,
+	I3C_CTRL_CFG_HIGH_KEEPER,
+	I3C_CTRL_CFG_STOP_SPEED,
+	I3C_CTRL_CFG_PPBAUD,
+	I3C_CTRL_CFG_PPLOW,
+	I3C_CTRL_CFG_ODBAUD,
+	I3C_CTRL_CFG_ODHPP,
+	I3C_CTRL_CFG_SKEW,
+	I3C_CTRL_CFG_I2CBAUD,
+	I3C_CTRL_ENABLE,
+	I3C_CTRL_DISABLE,
+	I3C_CTRL_ENTER_DAA,
+	I3C_CTRL_ABORT_DAA,
+	I3C_CTRL_START_IBI,
+	I3C_CTRL_NACK_IBI,
+	I3C_CTRL_GET_DEV_AVAIL_FLAGS,
+
+	I3C_CTRL_GET_NUM_BUS_DEVICES,
+	I3C_CTRL_GET_SLV_ATTRIB,
+	I3C_CTRL_GET_IBI_DEV_ADDR,
+	I3C_CTRL_GET_IBI_TYPE,
+	I3C_CTRL_GET_IBI_DATA,
+	I3C_CTRL_ISSUE_STOP,
+
+} svc_i3c_ctrl_t;
+
+typedef enum {
+	I3C_EVENT_NONE = 0,
+	I3C_EVENT_DAA_COMPLETE,
+	I3C_EVENT_RW_COMPLETE,
+	I3C_EVENT_RW_NACK,
+	I3C_EVENT_RW_ERR,
+	I3C_EVENT_RW_TIMEOUT,
+	I3C_EVENT_IBI_REQUEST,
+	I3C_EVENT_IBI_COMPLETE,
+
+} svc_i3c_event_t;
+
+typedef enum {
+	I3C_MASTER_DISABLE,
+	I3C_MASTER_ENABLE,
+	I3C_MASTER_CAPABLE
+
+} svc_i3c_master_enable_t;
+
+typedef enum {
+	I3C_HIGH_KEEPER_NONE,
+	I3C_HIGH_KEEPER_ON_CHIP,
+	I3C_HIGH_KEEPER_EXTERN_SDA,
+	I3C_HIGH_KEEPER_EXTERN_SDA_SCL
+
+} svc_i3c_high_keeper_t;
+
+typedef enum {
+	I3C_STOP_SPEED_PUSH_PULL,
+	I3C_STOP_SPEED_OPEN_DRAIN
+
+} svc_i3c_stop_speed_t;
+
+typedef enum {
+	I3C_ODHPP_SCL_HIGH_EQ_SCL_LOW = 0,
+	I3C_ODHPP_SCL_HIGH_EQ_ONE_PPBAUD = 1
+
+} svc_i3c_odhpp_t;
+
+typedef enum {
+	I3C_ADDRESS_TYPE_UNASSIGNED,
+	I3C_ADDRESS_TYPE_STATIC,
+	I3C_ADDRESS_TYPE_DYNAMIC
+
+} svc_i3c_addr_type_t;
+
+typedef enum {
+	I3C_XFER_TYPE_I2C_READ = 0,
+	I3C_XFER_TYPE_I2C_WRITE = 1,
+	I3C_XFER_TYPE_I3C_READ = 2,
+	I3C_XFER_TYPE_I3C_WRITE = 3,
+	I3C_XFER_TYPE_I3C_READ_DDR = 4,
+	I3C_XFER_TYPE_I3C_WRITE_DDR = 5,
+
+	I3C_XFER_TYPE_I3C_BCCC_WRITE = 6,
+	I3C_XFER_TYPE_I3C_DCCC_READ = 7,
+	I3C_XFER_TYPE_I3C_DCCC_WRITE = 8,
+
+	I3C_XFER_TYPE_MAX = 9
+
+} svc_i3c_xfer_type_t;
+
+typedef enum {
+	I3C_STATE_IDLE = 0,
+	I3C_STATE_XFER_ACTIVE,
+	I3C_STATE_DAA,
+	I3C_STATE_AUTO_IBI,
+	I3C_STATE_IBI_REQ,
+	I3C_STATE_IBI_RESP
+
+} svc_i3c_state_t;
+
+typedef enum {
+	I3C_CCC_B_ENEC = 0x00,
+	I3C_CCC_B_DISEC = 0x01,
+	I3C_CCC_B_ENTAS0 = 0x02,
+	I3C_CCC_B_ENTAS1 = 0x03,
+	I3C_CCC_B_ENTAS2 = 0x04,
+	I3C_CCC_B_ENTAS3 = 0x05,
+	I3C_CCC_B_RSTDAA = 0x06,
+	I3C_CCC_B_ENTDAA = 0x07,
+	I3C_CCC_B_DEFSLVS = 0x08,
+	I3C_CCC_B_SETMWL = 0x09,
+	I3C_CCC_B_SETMRL = 0x0a,
+	I3C_CCC_B_ENTTM = 0x0b,
+	I3C_CCC_B_ENTHDR0 = 0x20,
+	I3C_CCC_B_ENTHDR1 = 0x21,
+	I3C_CCC_B_ENTHDR2 = 0x22,
+	I3C_CCC_B_ENTHDR3 = 0x23,
+	I3C_CCC_B_ENTHDR4 = 0x24,
+	I3C_CCC_B_ENTHDR5 = 0x25,
+	I3C_CCC_B_ENTHDR6 = 0x26,
+	I3C_CCC_B_ENTHDR7 = 0x27,
+	I3C_CCC_B_SETXTIME = 0x28,
+	I3C_CCC_D_ENEC = 0x80,
+	I3C_CCC_D_DISEC = 0x81,
+	I3C_CCC_D_ENTAS0 = 0x82,
+	I3C_CCC_D_ENTAS1 = 0x83,
+	I3C_CCC_D_ENTAS2 = 0x84,
+	I3C_CCC_D_ENTAS3 = 0x85,
+	I3C_CCC_D_RSTDAA = 0x86,
+	I3C_CCC_D_SETDASA = 0x87,
+	I3C_CCC_D_SETNEWDA = 0x88,
+	I3C_CCC_D_SETMWL = 0x89,
+	I3C_CCC_D_SETMRL = 0x8a,
+	I3C_CCC_D_GETMWL = 0x8b,
+	I3C_CCC_D_GETMRL = 0x8c,
+	I3C_CCC_D_GETPID = 0x8d,
+	I3C_CCC_D_GETBCR = 0x8e,
+	I3C_CCC_D_GETDCR = 0x8f,
+	I3C_CCC_D_GETSTATUS = 0x90,
+	I3C_CCC_D_GETACCMST = 0x91,
+	I3C_CCC_D_SETBRGTGT = 0x93,
+	I3C_CCC_D_GETMXDS = 0x94,
+	I3C_CCC_D_GETHDRCAP = 0x95,
+	I3C_CCC_D_SETXTIME = 0x98,
+	I3C_CCC_D_GETXTIME = 0x99
+
+} svc_i3c_ccc_t;
+
+typedef enum {
+	I3C_IBI_TYPE_NONE = 0,
+	I3C_IBI_TYPE_NORMAL = 1,
+	I3C_IBI_TYPE_MASTER_REQ = 2,
+	I3C_IBI_TYPE_HOT_JOIN_REQ = 3,
+
+} svc_i3c_ibi_type_t;
+
+struct __attribute__((__packed__)) svc_i3c_vendor_slv_id_s {
+	uint16 part;
+	uint8 instance;
+	uint16 extra;
+};
+
+typedef struct __attribute__((__packed__))
+svc_i3c_vendor_slv_id_s svc_i3c_vendor_slv_id_t;
+
+typedef struct svc_i3c_slv_id_s {
+	uint16 manufId;
+	uint8 randIdFlag;
+
+	union {
+		uint32 randId;
+		struct __attribute__((__packed__))
+		svc_i3c_vendor_slv_id_s vendId;
+	};
+
+} svc_i3c_slv_id_t;
+
+#define I3C_BCR_SPEED_LIMIT_MASK 0x01
+#define I3C_BCR_IBI_REQ_CAPABLE_MASK 0x02
+#define I3C_BCR_IBI_PAYLOAD_MASK 0x04
+#define I3C_BCR_OFFLINE_CAPABLE_MASK 0x08
+#define I3C_BCR_BRIDGE_DEVICE_MASK 0x10
+#define I3C_BCR_HDR_CAPABLE_MASK 0x20
+#define I3C_BCR_DEVICE_ROLE_MASK 0xC0
+#define I3C_BCR_DEVICE_ROLE_MASTER 0x40
+
+typedef struct svc_i3c_slv_bcr_s {
+	uint32 speedLimit : 1;
+	uint32 ibiReqCapable : 1;
+	uint32 ibiPayload : 1;
+	uint32 offlineCapable : 1;
+	uint32 bridgeDevice : 1;
+	uint32 hdrCapable : 1;
+	uint32 deviceRoleMaster : 1;
+
+} svc_i3c_slv_bcr_t;
+
+typedef struct svc_i3c_slv_attrib_s {
+	uint8 devIdx;
+	uint8 addr;
+	svc_i3c_addr_type_t addrType;
+	svc_i3c_slv_id_t devId;
+	svc_i3c_slv_bcr_t bcr;
+	uint8 dcr;
+
+} svc_i3c_slv_attrib_t;
+
+typedef struct svc_i3c_slv_s {
+	uint8 addr;
+	svc_i3c_addr_type_t addrType;
+
+	uint8 provId[I3C_PROV_ID_SIZE];
+
+} svc_i3c_slv_dev_t;
+
+typedef struct svc_i3c_xfer_s {
+	uint8 devId;
+	svc_i3c_xfer_type_t type;
+	uint8 ccc;
+	uint16 hdrDdrCmd;
+	uint8 *pData;
+	uint8 count;
+
+	uint8 remaining;
+	uint8 stop;
+	uint8 allowIbi;
+
+	struct completion comp;
+
+} svc_i3c_xfer_t;
+
+typedef struct svc_i3c_ibi_s {
+	uint8 ibiData[IBI_DATA_MAX_SIZE];
+	uint8 ibiIdx;
+	uint8 ibiDevAddr;
+	uint8 ibiType;
+
+} svc_i3c_ibi_t;
+
+typedef struct svc_i3c_dev_s {
+	svc_i3c_master_enable_t masterEna;
+	svc_drv_ctrl_enable_t timeoutErrEna;
+	svc_i3c_high_keeper_t highKeeper;
+	svc_i3c_stop_speed_t stopSpeed;
+	uint8 ppBaud;
+	uint8 ppLow;
+	uint8 odBaud;
+	svc_i3c_odhpp_t odHpp;
+	uint8 skew;
+	uint8 i2cBaud;
+
+	svc_i3c_slv_dev_t devices[I3C_MAX_DEVICES];
+	uint32 devAvailableFlags;
+
+	uint8 numDevices;
+
+	int daaDevIdx;
+	uint8 *pDaaData;
+
+	svc_i3c_state_t state;
+	svc_i3c_xfer_t *pXfer;
+
+	uint8 ibiData[IBI_DATA_MAX_SIZE];
+	uint8 ibiIdx;
+	uint8 ibiDevAddr;
+	uint8 ibiType;
+
+} svc_i3c_dev_t;
+
+struct svc_i3c_master {
+	struct i3c_master_controller base;
+	spinlock_t access_lock;
+
+	struct {
+		unsigned int num_ibi_devices;
+		struct i3c_dev_desc **dev_desc;
+		spinlock_t lock;
+	} ibi;
+
+	void __iomem *baseAddr;
+
+	struct clk *pclk;
+	struct clk *fclk_i3c;
+	struct clk *clk_slow_12_5;
+
+	uint32 i3c_pp_clk_div;
+	uint32 i3c_od_clk_div;
+	uint32 i2c_clk_div;
+
+	fpEventHandler_t eventHandler;
+
+	svc_i3c_dev_t *pDev;
+};
+
+void svcI3cMasterIsr(void *arg);
+
+void svcI3cInterruptEnable(void *vpDriver, uint32 mask);
+uint32 svcI3cInterruptDisable(void *vpDriver);
+
+int32 svcI3cInitialize(void *vpDriver, svc_i3c_dev_t *pDev, uint32 baseAddress,
+		       uint32 irqBitmask);
+
+int32 svcI3cRegisterEventHandler(void *vpDriver, fpEventHandler_t handler);
+
+int svcI3cAddStaticDevice(void *vpDriver, uint8 addr);
+
+int svcI3cSetDeviceAddress(void *vpDriver, uint8 devIdx, uint8 addr);
+
+uint8 svcI3cGetDeviceIndexFromAddress(void *vpDriver, uint8 addr);
+
+int32 svcI3cRead(void *vpDriver, void *pData);
+
+int32 svcI3cWrite(void *vpDriver, void *pData);
+
+int32 svcI3cAbort(void *vpDriver, svc_i3c_xfer_t *pXfer);
+
+int32 svcI3cControlSet(void *vpDriver, uint32 control, uint32 arg);
+
+int32 svcI3cControlGet(void *vpDriver, uint32 control, void *arg);
+
+static void i3cDisable(void *pDriver)
+{
+	struct svc_i3c_master *pDrv = (struct svc_i3c_master *)pDriver;
+	PUT_UINT32(pDrv->baseAddr + I3C_MINTCLR_OFFSET, 0xFFFFFFFF);
+	PUT_UINT32(pDrv->baseAddr + I3C_CONFIG_OFFSET, 0);
+	PUT_UINT32(pDrv->baseAddr + I3C_MCONFIG_OFFSET, 0);
+}
+
+static void i3cEnable(void *pDriver)
+{
+	svc_i3c_dev_t *pDev;
+	uint32 reg = 0;
+	uint32 mstatus;
+	uint32 mask;
+
+	if (pDriver) {
+		struct svc_i3c_master *pDrv = (struct svc_i3c_master *)pDriver;
+
+		if (pDrv->pDev) {
+			pDev = pDrv->pDev;
+
+			switch (pDev->masterEna) {
+			case I3C_MASTER_ENABLE:
+				PUT_UINT32(pDrv->baseAddr + I3C_CONFIG_OFFSET,
+					   I3C_CONFIG_DDROK_MASK);
+
+				reg = I3C_MCONFIG_MSTENA_ENABLE;
+
+				if (pDev->timeoutErrEna ==
+				    SVC_DRV_CTRL_DISABLE) {
+					reg |= I3C_MCONFIG_DISTO_MASK;
+				}
+
+				switch (pDev->highKeeper) {
+				case I3C_HIGH_KEEPER_ON_CHIP:
+					reg |= (I3C_MCONFIG_HKEEP_ON_CHIP
+						<< I3C_MCONFIG_HKEEP_SHFT);
+					break;
+				case I3C_HIGH_KEEPER_EXTERN_SDA:
+					reg |= (I3C_MCONFIG_HKEEP_EXT_SDA
+						<< I3C_MCONFIG_HKEEP_SHFT);
+					break;
+				case I3C_HIGH_KEEPER_EXTERN_SDA_SCL:
+					reg |= (I3C_MCONFIG_HKEEP_EXT_SDA_SCL
+						<< I3C_MCONFIG_HKEEP_SHFT);
+					break;
+				default:
+					break;
+				}
+
+				if (pDev->stopSpeed ==
+				    I3C_STOP_SPEED_OPEN_DRAIN) {
+					reg |= I3C_MCONFIG_ODSTOP_MASK;
+				}
+
+				reg |= ((pDev->ppBaud
+					 << I3C_MCONFIG_PPBAUD_SHFT) |
+					(pDev->ppLow
+					 << I3C_MCONFIG_PPLOW_SHFT) |
+					(pDev->odBaud
+					 << I3C_MCONFIG_ODBAUD_SHFT) |
+					(pDev->odHpp
+					 << I3C_MCONFIG_ODHPP_SHFT) |
+					(pDev->skew << I3C_MCONFIG_SKEW_SHFT) |
+					(pDev->i2cBaud
+					 << I3C_MCONFIG_I2CBAUD_SHFT));
+
+				PUT_UINT32(pDrv->baseAddr + I3C_MCONFIG_OFFSET,
+					   reg);
+
+				GET_UINT32(pDrv->baseAddr + I3C_MSTATUS_OFFSET,
+					   &mstatus);
+
+				if (mstatus & I3C_MSTATUS_ERRWARN_MASK) {
+					uint32 errWarn;
+
+					GET_UINT32(pDrv->baseAddr +
+							   I3C_MERRWARN_OFFSET,
+						   &errWarn);
+
+					PUT_UINT32(pDrv->baseAddr +
+							   I3C_MERRWARN_OFFSET,
+						   errWarn);
+				}
+
+				reg = I3C_MDATACTRL_UNLOCK_TRIG |
+				      I3C_MDATACTRL_RXTRIG_FIFO_NOT_EMPTY |
+				      I3C_MDATACTRL_TXTRIG_FIFO_NOT_FULL |
+				      I3C_MDATACTRL_FLUSHRB |
+				      I3C_MDATACTRL_FLUSHTB;
+				PUT_UINT32(pDrv->baseAddr +
+						   I3C_MDATACTRL_OFFSET,
+					   reg);
+
+				mask = I3C_MINT_RXPEND_MASK |
+				       I3C_MINT_SLVSTART_MASK |
+				       I3C_MINT_MCTRLDONE_MASK |
+				       I3C_MINT_COMPLETE_MASK |
+				       I3C_MINT_IBIWON_MASK |
+				       I3C_MINT_ERRWARN_MASK;
+				svcI3cInterruptEnable((void *)pDrv, mask);
+
+				break;
+
+			case I3C_MASTER_CAPABLE:
+
+				break;
+			case I3C_MASTER_DISABLE:
+
+				break;
+			default:
+				break;
+			}
+		}
+	}
+}
+
+static int i3cGetNextAvailableDevIdx(svc_i3c_dev_t *pDev)
+{
+	int i;
+
+	for (i = 0; i < I3C_MAX_DEVICES; i++) {
+		if (pDev->devAvailableFlags & (0x00000001 << i)) {
+			return i;
+		}
+	}
+
+	return -1;
+}
+
+static int32 i3cEnterDynamicAddressAssignment(void *vpDriver)
+{
+	int32 status = SVC_DRV_ERR_I3C_BUSY;
+	struct svc_i3c_master *pDrv = (struct svc_i3c_master *)vpDriver;
+	svc_i3c_dev_t *pDev = (svc_i3c_dev_t *)(pDrv->pDev);
+	int devIdx;
+
+	if (pDev->state == I3C_STATE_IDLE) {
+		devIdx = i3cGetNextAvailableDevIdx(pDev);
+		if (devIdx >= 0) {
+			if (pDev->devices[devIdx].addr != I3C_INVALID_ADDR) {
+				pDev->state = I3C_STATE_DAA;
+
+				pDev->daaDevIdx = devIdx;
+
+				pDev->pDaaData = pDev->devices[devIdx].provId;
+
+				PUT_UINT32(pDrv->baseAddr + I3C_MCTRL_OFFSET,
+					   I3C_MCTRL_REQUEST_PROC_DAA |
+						   I3C_MCTRL_IBIRESP_MANUAL);
+				status = SVC_DRV_ERR_NONE;
+			} else {
+				status = SVC_DRV_ERR_INVALID_PARAM;
+			}
+		} else {
+			status = SVC_DRV_ERR_I3C_TOO_MANY_DEV;
+		}
+	}
+
+	return status;
+}
+
+static int32 i3cExitDynamicAddressAssignment(void *vpDriver)
+{
+	struct svc_i3c_master *pDrv = (struct svc_i3c_master *)vpDriver;
+	svc_i3c_dev_t *pDev = (svc_i3c_dev_t *)(pDrv->pDev);
+
+	pDev->state = I3C_STATE_IDLE;
+
+	pDev->daaDevIdx = -1;
+	pDev->pDaaData = NULL;
+
+	if (pDrv->eventHandler) {
+		pDrv->eventHandler((void *)pDrv, I3C_EVENT_DAA_COMPLETE);
+	}
+
+	return SVC_DRV_ERR_NONE;
+}
+
+static int32 i3cGetDeviceAttributes(void *vpDriver,
+				    svc_i3c_slv_attrib_t *pAttrib)
+{
+	int32 status = SVC_DRV_ERR_NONE;
+	struct svc_i3c_master *pDrv = (struct svc_i3c_master *)vpDriver;
+	svc_i3c_dev_t *pDev = (svc_i3c_dev_t *)(pDrv->pDev);
+	svc_i3c_slv_dev_t *pSlvDev;
+	uint16 tmpId;
+
+	if (pAttrib->devIdx < I3C_MAX_DEVICES) {
+		pSlvDev = &pDev->devices[pAttrib->devIdx];
+
+		pAttrib->addr = pSlvDev->addr;
+		pAttrib->addrType = pSlvDev->addrType;
+
+		tmpId = ((uint16)pSlvDev->provId[0] << 8) |
+			(uint16)pSlvDev->provId[1];
+		pAttrib->devId.randIdFlag = tmpId & 0x0001;
+		pAttrib->devId.manufId = tmpId >> 1;
+		if (tmpId & 0x0001) {
+			pAttrib->devId.randId =
+				((uint32)pSlvDev->provId[2] << 24) |
+				((uint32)pSlvDev->provId[3] << 16) |
+				((uint32)pSlvDev->provId[4] << 8) |
+				(uint32)pSlvDev->provId[5];
+		} else {
+			pAttrib->devId.vendId.part =
+				((uint16)pSlvDev->provId[2] << 8) |
+				(uint16)pSlvDev->provId[3];
+			pAttrib->devId.vendId.instance =
+				pSlvDev->provId[4] >> 4;
+			pAttrib->devId.vendId.extra =
+				(((uint16)pSlvDev->provId[4] << 8) & 0x0f00) |
+				(uint16)pSlvDev->provId[5];
+		}
+
+		pAttrib->bcr.speedLimit =
+			(pSlvDev->provId[6] & I3C_BCR_SPEED_LIMIT_MASK) ? 1 : 0;
+		pAttrib->bcr.ibiReqCapable =
+			(pSlvDev->provId[6] & I3C_BCR_IBI_REQ_CAPABLE_MASK) ?
+				1 :
+				0;
+		pAttrib->bcr.ibiPayload =
+			(pSlvDev->provId[6] & I3C_BCR_IBI_PAYLOAD_MASK) ? 1 : 0;
+		pAttrib->bcr.offlineCapable =
+			(pSlvDev->provId[6] & I3C_BCR_OFFLINE_CAPABLE_MASK) ?
+				1 :
+				0;
+		pAttrib->bcr.bridgeDevice =
+			(pSlvDev->provId[6] & I3C_BCR_BRIDGE_DEVICE_MASK) ? 1 :
+									    0;
+		pAttrib->bcr.hdrCapable =
+			(pSlvDev->provId[6] & I3C_BCR_HDR_CAPABLE_MASK) ? 1 : 0;
+		pAttrib->bcr.deviceRoleMaster =
+			(pSlvDev->provId[6] & I3C_BCR_DEVICE_ROLE_MASTER) ? 1 :
+									    0;
+
+		pAttrib->dcr = pSlvDev->provId[7];
+	} else {
+		status = SVC_DRV_ERR_INVALID_PARAM;
+	}
+
+	return status;
+}
+
+static int32 i3cWriteCtrlMode(void *vpDriver, void *pData)
+{
+	int32 status = SVC_DRV_ERR_I3C_XFER_ERR;
+	struct svc_i3c_master *pDrv = (struct svc_i3c_master *)vpDriver;
+	volatile uint32 reg;
+	volatile uint32 mstatusReg = 0;
+	uint8 addr;
+	uint8 bufIdx;
+
+	svc_i3c_dev_t *pDev;
+	svc_i3c_xfer_t *pXfer;
+
+	if (pDrv && pData) {
+		pDev = pDrv->pDev;
+
+		if (pDev->state == I3C_STATE_IDLE) {
+			pDev->state = I3C_STATE_XFER_ACTIVE;
+
+			pXfer = (svc_i3c_xfer_t *)pData;
+
+			reg = I3C_MDATACTRL_FLUSHTB;
+			PUT_UINT32(pDrv->baseAddr + I3C_MDATACTRL_OFFSET, reg);
+
+			pDev->pXfer = pXfer;
+
+			bufIdx = 0;
+			pXfer->remaining = pXfer->count;
+
+			if (pXfer->type == I3C_XFER_TYPE_I3C_WRITE_DDR) {
+				if (pXfer->count > 0) {
+					PUT_UINT32(pDrv->baseAddr +
+							   I3C_MWDATAB_OFFSET,
+						   (uint32)(pXfer->hdrDdrCmd &
+							    0x000000FF));
+				} else {
+					PUT_UINT32(pDrv->baseAddr +
+							   I3C_MWDATABE_OFFSET,
+						   (uint32)(pXfer->hdrDdrCmd &
+							    0x000000FF));
+				}
+			}
+
+			while (pXfer->remaining > 0) {
+				GET_UINT32(pDrv->baseAddr + I3C_MSTATUS_OFFSET,
+					   &mstatusReg);
+				if (mstatusReg & I3C_MSTATUS_TXNOTFULL_MASK) {
+					if (pXfer->remaining > 1) {
+						PUT_UINT32(
+							pDrv->baseAddr +
+								I3C_MWDATAB_OFFSET,
+							(uint32)(
+								pXfer->pData
+									[bufIdx++] &
+								0x000000FF));
+					} else {
+						PUT_UINT32(
+							pDrv->baseAddr +
+								I3C_MWDATABE_OFFSET,
+							(uint32)(
+								pXfer->pData
+									[bufIdx++] &
+								0x000000FF));
+					}
+					pXfer->remaining--;
+				} else {
+					PUT_UINT32(pDrv->baseAddr +
+							   I3C_MINTSET_OFFSET,
+						   I3C_MINT_TXNOTFULL_MASK);
+
+					break;
+				}
+			}
+
+			if (pXfer->type == I3C_XFER_TYPE_I3C_BCCC_WRITE) {
+				addr = I3C_BROADCAST_ADDR;
+			} else {
+				addr = pDev->devices[pXfer->devId].addr & 0x7F;
+			}
+
+			if (pXfer->allowIbi) {
+				reg = I3C_MCTRL_IBIRESP_MANUAL;
+			} else {
+				reg = I3C_MCTRL_IBIRESP_NACK;
+			}
+
+			reg |= I3C_MCTRL_REQUEST_START_ADDR |
+			       I3C_MCTRL_DIR_WRITE |
+			       (addr << I3C_MCTRL_ADDR_SHFT);
+
+			switch (pXfer->type) {
+			case I3C_XFER_TYPE_I2C_WRITE:
+				reg |= I3C_MCTRL_TYPE_I2C;
+				break;
+			case I3C_XFER_TYPE_I3C_WRITE:
+			case I3C_XFER_TYPE_I3C_DCCC_WRITE:
+			case I3C_XFER_TYPE_I3C_BCCC_WRITE:
+				reg |= I3C_MCTRL_TYPE_I3C;
+				break;
+			case I3C_XFER_TYPE_I3C_WRITE_DDR:
+				reg |= I3C_MCTRL_TYPE_HDR_DDR;
+				break;
+			default:
+				reg = 0;
+				break;
+			}
+
+			if (reg) {
+				PUT_UINT32(pDrv->baseAddr + I3C_MCTRL_OFFSET,
+					   reg);
+				status = SVC_DRV_ERR_NONE;
+			}
+		} else {
+			status = SVC_DRV_ERR_I3C_BUSY;
+		}
+	}
+
+	return status;
+}
+
+static int32 i3cReadCtrlMode(void *vpDriver, void *pData)
+{
+	int32 status = SVC_DRV_ERR_I3C_XFER_ERR;
+	struct svc_i3c_master *pDrv = (struct svc_i3c_master *)vpDriver;
+	volatile uint32 reg = 0;
+	uint8 bufIdx, rdCount;
+
+	svc_i3c_dev_t *pDev;
+	svc_i3c_xfer_t *pXfer;
+
+	if (pDrv && pData) {
+		pDev = pDrv->pDev;
+
+		if (pDev->state == I3C_STATE_IDLE) {
+			pDev->state = I3C_STATE_XFER_ACTIVE;
+
+			pXfer = (svc_i3c_xfer_t *)pData;
+
+			reg = I3C_MDATACTRL_FLUSHRB;
+			PUT_UINT32(pDrv->baseAddr + I3C_MDATACTRL_OFFSET, reg);
+
+			pDev->pXfer = pXfer;
+
+			bufIdx = 0;
+
+			pXfer->remaining = pXfer->count;
+
+			if (pXfer->type == I3C_XFER_TYPE_I3C_READ_DDR) {
+				rdCount = 2 + pXfer->count / 2;
+			} else {
+				rdCount = pXfer->count;
+			}
+
+			if (pXfer->allowIbi) {
+				reg = I3C_MCTRL_IBIRESP_MANUAL;
+			} else {
+				reg = I3C_MCTRL_IBIRESP_NACK;
+			}
+
+			reg |= (rdCount << I3C_MCTRL_RDTERM_SHFT) |
+			       I3C_MCTRL_REQUEST_START_ADDR |
+			       I3C_MCTRL_DIR_READ |
+			       (pDev->devices[pXfer->devId].addr
+				<< I3C_MCTRL_ADDR_SHFT);
+
+			switch (pXfer->type) {
+			case I3C_XFER_TYPE_I2C_READ:
+				reg |= I3C_MCTRL_TYPE_I2C;
+				break;
+			case I3C_XFER_TYPE_I3C_READ:
+			case I3C_XFER_TYPE_I3C_DCCC_READ:
+				reg |= I3C_MCTRL_TYPE_I3C;
+				break;
+			case I3C_XFER_TYPE_I3C_READ_DDR:
+
+				PUT_UINT32(pDrv->baseAddr + I3C_MWDATAB_OFFSET,
+					   (uint32)(pXfer->hdrDdrCmd &
+						    0x000000FF));
+				reg |= I3C_MCTRL_TYPE_HDR_DDR;
+				break;
+			default:
+
+				reg = 0;
+				break;
+			}
+
+			if (reg) {
+				PUT_UINT32(pDrv->baseAddr + I3C_MCTRL_OFFSET,
+					   reg);
+				status = SVC_DRV_ERR_NONE;
+			}
+		} else {
+			status = SVC_DRV_ERR_I3C_BUSY;
+		}
+	}
+
+	return status;
+}
+
+static void i3cStop(void *vpDriver)
+{
+	PUT_UINT32(((struct svc_i3c_master *)vpDriver)->baseAddr +
+			   I3C_MCTRL_OFFSET,
+		   (I3C_MCTRL_REQUEST_STOP << I3C_MCTRL_REQUEST_SHFT));
+}
+
+static void i3cExitHdr(void *vpDriver)
+{
+	PUT_UINT32(((struct svc_i3c_master *)vpDriver)->baseAddr +
+			   I3C_MCTRL_OFFSET,
+		   (I3C_MCTRL_REQUEST_FORCE_EXIT << I3C_MCTRL_REQUEST_SHFT));
+}
+
+static int32 i3cIbiStart(void *vpDriver)
+{
+	int32 status = SVC_DRV_ERR_NONE;
+	struct svc_i3c_master *pDrv = (struct svc_i3c_master *)vpDriver;
+	svc_i3c_dev_t *pDev = (svc_i3c_dev_t *)(pDrv->pDev);
+	volatile uint32 reg = 0;
+
+	if (pDev->state == I3C_STATE_IDLE) {
+		pDev->state = I3C_STATE_IBI_REQ;
+
+		memset((void *)pDev->ibiData, 0x00, IBI_DATA_MAX_SIZE);
+		pDev->ibiIdx = 0;
+		pDev->ibiDevAddr = 0;
+		pDev->ibiType = 0;
+
+		reg = I3C_MCTRL_REQUEST_START_ADDR | I3C_MCTRL_IBIRESP_MANUAL |
+		      (I3C_BROADCAST_ADDR << I3C_MCTRL_ADDR_SHFT);
+		PUT_UINT32(pDrv->baseAddr + I3C_MCTRL_OFFSET, reg);
+	} else {
+		status = SVC_DRV_ERR_I3C_BUSY;
+	}
+	return status;
+}
+
+static int32 i3cIbiNack(void *vpDriver)
+{
+	int32 status = SVC_DRV_ERR_NONE;
+	struct svc_i3c_master *pDrv = (struct svc_i3c_master *)vpDriver;
+	svc_i3c_dev_t *pDev = (svc_i3c_dev_t *)(pDrv->pDev);
+	volatile uint32 reg = 0;
+
+	if (pDev->state == I3C_STATE_IDLE) {
+		reg = I3C_MCTRL_IBIRESP_NACK | I3C_MCTRL_REQUEST_IBI_ACKNACK;
+		PUT_UINT32(pDrv->baseAddr + I3C_MCTRL_OFFSET, reg);
+	} else {
+		status = SVC_DRV_ERR_I3C_BUSY;
+	}
+	return status;
+}
+
+void svcI3cMasterIsr(void *arg)
+{
+	struct svc_i3c_master *pDrv = (struct svc_i3c_master *)arg;
+	svc_i3c_dev_t *pDev;
+	volatile uint32 intMask, mstatus, state, reg;
+	volatile uint32 dataCtrl, rxData;
+	uint8 bufIdx;
+	uint8 twoBytes;
+
+	if (pDrv) {
+		GET_UINT32(pDrv->baseAddr + I3C_MINTMASKED_OFFSET, &intMask);
+
+		pDev = (svc_i3c_dev_t *)pDrv->pDev;
+
+		if (intMask & I3C_MINT_RXPEND_MASK) {
+			GET_UINT32(pDrv->baseAddr + I3C_MSTATUS_OFFSET,
+				   &mstatus);
+
+			state = mstatus & I3C_MSTATUS_STATE_MASK;
+
+			GET_UINT32(pDrv->baseAddr + I3C_MDATACTRL_OFFSET,
+				   &dataCtrl);
+
+			do {
+				if (((dataCtrl & I3C_MDATACTRL_RXCOUNT_MASK) >>
+				     I3C_MDATACTRL_RXCOUNT_SHFT) > 1) {
+					twoBytes = 1;
+				} else {
+					twoBytes = 0;
+				}
+
+				switch (state) {
+				case I3C_MSTATUS_STATE_MSGSDR:
+
+					GET_UINT32(pDrv->baseAddr +
+							   I3C_MRMSG_SDR_OFFSET,
+						   &rxData);
+					break;
+				case I3C_MSTATUS_STATE_DDR:
+
+					GET_UINT32(pDrv->baseAddr +
+							   I3C_MRMSG_DDR_OFFSET,
+						   &rxData);
+					break;
+				case I3C_MSTATUS_STATE_NORMACT:
+				case I3C_MSTATUS_STATE_DAA:
+				default:
+					if (twoBytes) {
+						GET_UINT32(
+							pDrv->baseAddr +
+								I3C_MRDATAH_OFFSET,
+							&rxData);
+					} else {
+						GET_UINT32(
+							pDrv->baseAddr +
+								I3C_MRDATAB_OFFSET,
+							&rxData);
+					}
+					break;
+				}
+
+				switch (pDev->state) {
+				case I3C_STATE_DAA:
+					if (state == I3C_MSTATUS_STATE_DAA) {
+						if (pDev->pDaaData) {
+							*pDev->pDaaData = (uint8)(
+								rxData &
+								0x000000ff);
+							pDev->pDaaData++;
+
+							if (twoBytes) {
+								*pDev->pDaaData = (uint8)(
+									(rxData &
+									 0x0000ff00) >>
+									8);
+								pDev->pDaaData++;
+							}
+						} else {
+						}
+					} else {
+					}
+					break;
+
+				case I3C_STATE_XFER_ACTIVE:
+
+					if (pDev->pXfer != NULL) {
+						bufIdx = pDev->pXfer->count -
+							 pDev->pXfer->remaining;
+
+						if (pDev->pXfer->pData) {
+							if ((pDev->pXfer
+								     ->remaining >
+							     1) &&
+							    (twoBytes == 1)) {
+								pDev->pXfer->pData
+									[bufIdx++] =
+									(uint8)(rxData &
+										0x000000ff);
+								pDev->pXfer->pData
+									[bufIdx++] = (uint8)(
+									(rxData &
+									 0x0000ff00) >>
+									8);
+								pDev->pXfer
+									->remaining -=
+									2;
+							} else if (pDev->pXfer
+									   ->remaining >
+								   0) {
+								pDev->pXfer->pData
+									[bufIdx++] =
+									(uint8)(rxData &
+										0x000000ff);
+								pDev->pXfer
+									->remaining--;
+							}
+						}
+					}
+					break;
+				case I3C_STATE_AUTO_IBI:
+				case I3C_STATE_IBI_RESP:
+					if (pDev->ibiData) {
+						pDev->ibiData[pDev->ibiIdx] =
+							(uint8)rxData;
+						pDev->ibiIdx++;
+					}
+					break;
+				case I3C_STATE_IDLE:
+				default:
+					break;
+				}
+
+				GET_UINT32(pDrv->baseAddr +
+						   I3C_MDATACTRL_OFFSET,
+					   &dataCtrl);
+
+			} while (!(dataCtrl & I3C_MDATACTRL_RXEMPTY_MASK));
+		}
+
+		if (intMask & I3C_MINT_MCTRLDONE_MASK) {
+			PUT_UINT32(pDrv->baseAddr + I3C_MSTATUS_OFFSET,
+				   I3C_MINT_MCTRLDONE_MASK);
+
+			GET_UINT32(pDrv->baseAddr + I3C_MSTATUS_OFFSET,
+				   &mstatus);
+
+			if (((mstatus & I3C_MSTATUS_STATE_MASK) ==
+			     I3C_MSTATUS_STATE_DAA) &&
+			    (mstatus & I3C_MSTATUS_BETWEEN_MASK)) {
+				if (pDev->numDevices < I3C_MAX_DEVICES) {
+					int devIdx;
+					int8 devAddr;
+
+					if (pDev->daaDevIdx >= 0) {
+						devAddr =
+							pDev->devices
+								[pDev->daaDevIdx]
+									.addr;
+
+						if (devAddr !=
+						    I3C_INVALID_ADDR) {
+							pDev->devices
+								[pDev->daaDevIdx]
+									.addrType =
+								I3C_ADDRESS_TYPE_DYNAMIC;
+
+							pDev->devAvailableFlags &=
+								~(1
+								  << pDev->daaDevIdx);
+
+							PUT_UINT32(
+								pDrv->baseAddr +
+									I3C_MWDATAB_OFFSET,
+								devAddr);
+
+							devIdx =
+								i3cGetNextAvailableDevIdx(
+									pDev);
+							if (devIdx > 0) {
+								pDev->daaDevIdx =
+									devIdx;
+
+								pDev->pDaaData =
+									pDev->devices[devIdx]
+										.provId;
+							} else {
+								pDev->pDaaData =
+									NULL;
+							}
+
+							PUT_UINT32(
+								pDrv->baseAddr +
+									I3C_MCTRL_OFFSET,
+								I3C_MCTRL_REQUEST_PROC_DAA |
+									I3C_MCTRL_IBIRESP_MANUAL);
+
+							pDev->numDevices++;
+						} else {
+						}
+					}
+				}
+			}
+		}
+
+		if (intMask & I3C_MINT_COMPLETE_MASK) {
+			PUT_UINT32(pDrv->baseAddr + I3C_MSTATUS_OFFSET,
+				   I3C_MINT_COMPLETE_MASK);
+
+			switch (pDev->state) {
+			case I3C_STATE_XFER_ACTIVE:
+
+				if (!(mstatus & I3C_MSTATUS_IBIWON_MASK)) {
+					if (pDev->pXfer != NULL) {
+						if (pDev->pXfer->stop) {
+							if (pDev->pXfer->type ==
+								    I3C_XFER_TYPE_I3C_READ_DDR ||
+							    pDev->pXfer->type ==
+								    I3C_XFER_TYPE_I3C_WRITE_DDR) {
+								i3cExitHdr(
+									pDrv);
+							} else {
+								i3cStop(pDrv);
+							}
+						}
+
+						if (pDev->pXfer->type ==
+							    I3C_XFER_TYPE_I3C_WRITE ||
+						    pDev->pXfer->type ==
+							    I3C_XFER_TYPE_I2C_WRITE ||
+						    pDev->pXfer->type ==
+							    I3C_XFER_TYPE_I3C_WRITE_DDR) {
+							PUT_UINT32(
+								pDrv->baseAddr +
+									I3C_MINTCLR_OFFSET,
+								I3C_MINT_TXNOTFULL_MASK);
+
+							pDrv->eventHandler(
+								(void *)pDrv,
+								I3C_EVENT_RW_COMPLETE);
+						} else {
+							pDrv->eventHandler(
+								(void *)pDrv,
+								I3C_EVENT_RW_COMPLETE);
+						}
+
+						pDev->pXfer = NULL;
+						pDev->state = I3C_STATE_IDLE;
+					}
+				}
+				break;
+			case I3C_STATE_DAA:
+				i3cExitDynamicAddressAssignment(pDrv);
+				break;
+			case I3C_STATE_AUTO_IBI:
+			case I3C_STATE_IBI_RESP:
+
+				pDrv->eventHandler((void *)pDrv,
+						   I3C_EVENT_IBI_COMPLETE);
+
+				i3cStop(pDrv);
+
+				pDev->state = I3C_STATE_IDLE;
+				break;
+			case I3C_STATE_IDLE:
+				break;
+			default:
+				break;
+			}
+		}
+
+		if (intMask & I3C_MINT_TXNOTFULL_MASK) {
+			PUT_UINT32(pDrv->baseAddr + I3C_MSTATUS_OFFSET,
+				   I3C_MINT_TXNOTFULL_MASK);
+
+			if ((pDev->state == I3C_STATE_XFER_ACTIVE) &&
+			    (pDev->pXfer != NULL)) {
+				bufIdx = pDev->pXfer->count -
+					 pDev->pXfer->remaining;
+
+				if (pDev->pXfer->pData) {
+					while (pDev->pXfer->remaining > 0) {
+						if (pDev->pXfer->remaining >
+						    1) {
+							PUT_UINT32(
+								pDrv->baseAddr +
+									I3C_MWDATAB_OFFSET,
+								(uint32)(
+									pDev->pXfer
+										->pData[bufIdx]) &
+									0x000000ff);
+						} else {
+							PUT_UINT32(
+								pDrv->baseAddr +
+									I3C_MWDATABE_OFFSET,
+								(uint32)(
+									pDev->pXfer
+										->pData[bufIdx]) &
+									0x000000ff);
+						}
+
+						bufIdx++;
+						pDev->pXfer->remaining--;
+
+						GET_UINT32(
+							pDrv->baseAddr +
+								I3C_MDATACTRL_OFFSET,
+							&reg);
+						if (reg &
+						    I3C_MDATACTRL_TXFULL_MASK) {
+							break;
+						}
+					}
+				}
+			}
+		}
+
+		if (intMask & I3C_MINT_SLVSTART_MASK) {
+			PUT_UINT32(pDrv->baseAddr + I3C_MSTATUS_OFFSET,
+				   I3C_MINT_SLVSTART_MASK);
+
+			pDrv->eventHandler((void *)pDrv, I3C_EVENT_IBI_REQUEST);
+		}
+
+		if (intMask & I3C_MINT_IBIWON_MASK) {
+			uint8 addr =
+				(uint8)((mstatus & I3C_MSTATUS_IBIADDR_MASK) >>
+					I3C_MSTATUS_IBIADDR_SHFT);
+			uint8 ibiType =
+				(uint8)((mstatus & I3C_MSTATUS_IBITYPE_MASK) >>
+					I3C_MSTATUS_IBITYPE_SHFT);
+			uint8 i;
+
+			PUT_UINT32(pDrv->baseAddr + I3C_MSTATUS_OFFSET,
+				   I3C_MINT_IBIWON_MASK);
+
+			if (pDev->state == I3C_STATE_XFER_ACTIVE) {
+				pDrv->eventHandler((void *)pDrv,
+						   I3C_EVENT_RW_ERR);
+
+				pDev->pXfer = NULL;
+
+				pDev->state = I3C_STATE_IBI_REQ;
+			}
+
+			if (pDev->state == I3C_STATE_IBI_REQ) {
+				pDev->state = I3C_STATE_IBI_RESP;
+
+				if (ibiType == I3C_MSTATUS_IBITYPE_HOT_JOIN) {
+					pDev->ibiIdx = 0;
+					memset((void *)pDev->ibiData, 0x00,
+					       IBI_DATA_MAX_SIZE);
+					pDev->ibiDevAddr = addr;
+					pDev->ibiType = ibiType;
+
+					reg = (I3C_MCTRL_IBIRESP_ACK_NO_BYTE |
+					       I3C_MCTRL_REQUEST_IBI_ACKNACK);
+				} else {
+					reg = (I3C_MCTRL_IBIRESP_NACK |
+					       I3C_MCTRL_REQUEST_IBI_ACKNACK);
+
+					for (i = 0; i < I3C_MAX_DEVICES; i++) {
+						if (addr ==
+						    pDev->devices[i].addr) {
+							svc_i3c_slv_attrib_t
+								slvAttrib;
+
+							pDev->ibiIdx = 0;
+							memset((void *)pDev
+								       ->ibiData,
+							       0x00,
+							       IBI_DATA_MAX_SIZE);
+							pDev->ibiDevAddr = addr;
+							pDev->ibiType = ibiType;
+
+							slvAttrib.devIdx = i;
+							if (i3cGetDeviceAttributes(
+								    pDrv,
+								    &slvAttrib) ==
+							    SVC_DRV_ERR_NONE) {
+								if (slvAttrib
+									    .bcr
+									    .ibiPayload) {
+									reg = (I3C_MCTRL_IBIRESP_ACK_WITH_BYTE |
+									       I3C_MCTRL_REQUEST_IBI_ACKNACK);
+								} else {
+									reg = (I3C_MCTRL_IBIRESP_ACK_NO_BYTE |
+									       I3C_MCTRL_REQUEST_IBI_ACKNACK);
+								}
+							}
+							break;
+						}
+					}
+				}
+
+				PUT_UINT32(pDrv->baseAddr + I3C_MCTRL_OFFSET,
+					   reg);
+			}
+		}
+
+		if (intMask & I3C_MINT_ERRWARN_MASK) {
+			GET_UINT32(pDrv->baseAddr + I3C_MERRWARN_OFFSET, &reg);
+
+			PUT_UINT32(pDrv->baseAddr + I3C_MERRWARN_OFFSET, reg);
+
+			if ((pDev->state == I3C_STATE_XFER_ACTIVE) &&
+			    (pDev->pXfer != NULL)) {
+				if (reg & I3C_MERRWARN_NACK ||
+				    reg & I3C_MERRWARN_WRABT) {
+					pDrv->eventHandler((void *)pDrv,
+							   I3C_EVENT_RW_NACK);
+				} else if (reg & I3C_MERRWARN_TIMEOUT) {
+					pDrv->eventHandler(
+						(void *)pDrv,
+						I3C_EVENT_RW_TIMEOUT);
+				} else {
+					pDrv->eventHandler((void *)pDrv,
+							   I3C_EVENT_RW_ERR);
+				}
+			}
+		}
+
+		if (intMask & I3C_MINT_NOWMASTER_MASK) {
+			PUT_UINT32(pDrv->baseAddr + I3C_MSTATUS_OFFSET,
+				   I3C_MINT_NOWMASTER_MASK);
+		}
+	}
+}
+
+void svcI3cInterruptEnable(void *vpDriver, uint32 mask)
+{
+	struct svc_i3c_master *pDrv = (struct svc_i3c_master *)vpDriver;
+	PUT_UINT32(pDrv->baseAddr + I3C_MINTSET_OFFSET, mask);
+}
+
+uint32 svcI3cInterruptDisable(void *vpDriver)
+{
+	struct svc_i3c_master *pDrv = (struct svc_i3c_master *)vpDriver;
+	uint32 mask;
+
+	GET_UINT32(pDrv->baseAddr + I3C_MINTSET_OFFSET, &mask);
+
+	PUT_UINT32(pDrv->baseAddr + I3C_MINTCLR_OFFSET, mask);
+
+	return mask;
+}
+
+int32 svcI3cInitialize(void *vpDriver, svc_i3c_dev_t *pDev, uint32 baseAddress,
+		       uint32 irqBitmask)
+{
+	int i;
+
+	if (vpDriver) {
+		struct svc_i3c_master *pDrv = (struct svc_i3c_master *)vpDriver;
+
+		i3cDisable(vpDriver);
+
+		pDev->masterEna = I3C_MASTER_ENABLE;
+		pDev->timeoutErrEna = SVC_DRV_CTRL_ENABLE;
+		pDev->highKeeper = I3C_HIGH_KEEPER_NONE;
+		pDev->stopSpeed = I3C_STOP_SPEED_PUSH_PULL;
+		pDev->ppBaud = 0;
+		pDev->ppLow = 0;
+		pDev->odBaud = 0;
+		pDev->odHpp = I3C_ODHPP_SCL_HIGH_EQ_SCL_LOW;
+		pDev->skew = 0;
+		pDev->i2cBaud = 0;
+
+		for (i = 0; i < I3C_MAX_DEVICES; i++) {
+			pDev->devices[i].addr = I3C_INVALID_ADDR;
+			pDev->devices[i].addrType = I3C_ADDRESS_TYPE_UNASSIGNED;
+			memset((void *)pDev->devices[i].provId, 0x00,
+			       sizeof(pDev->devices[i].provId));
+		}
+		pDev->numDevices = 0;
+		pDev->devAvailableFlags = 0xFFFFFFFF;
+
+		pDev->pXfer = NULL;
+
+		pDev->state = I3C_STATE_IDLE;
+
+		pDev->daaDevIdx = -1;
+		pDev->pDaaData = NULL;
+
+		memset((void *)pDev->ibiData, 0x00, IBI_DATA_MAX_SIZE);
+		pDev->ibiIdx = 0;
+		pDev->ibiDevAddr = 0;
+		pDev->ibiType = 0;
+
+		return SVC_DRV_ERR_NONE;
+	}
+
+	return SVC_DRV_ERR_INVALID_PARAM;
+}
+
+int32 svcI3cRegisterEventHandler(void *vpDriver, fpEventHandler_t handler)
+{
+	struct svc_i3c_master *pDrv = (struct svc_i3c_master *)vpDriver;
+	if (pDrv) {
+		pDrv->eventHandler = handler;
+
+		return SVC_DRV_ERR_NONE;
+	}
+	return SVC_DRV_ERR_INVALID_PARAM;
+}
+
+int svcI3cAddStaticDevice(void *vpDriver, uint8 addr)
+{
+	struct svc_i3c_master *pDrv = (struct svc_i3c_master *)vpDriver;
+	svc_i3c_dev_t *pDev = (svc_i3c_dev_t *)(pDrv->pDev);
+	int devIdx;
+	uint32 irqEna;
+
+	if (addr > 0) {
+		irqEna = svcI3cInterruptDisable(vpDriver);
+
+		devIdx = i3cGetNextAvailableDevIdx(pDev);
+		if (devIdx != I3C_INVALID_ADDR) {
+			pDev->devices[devIdx].addr = addr;
+			pDev->devices[devIdx].addrType =
+				I3C_ADDRESS_TYPE_STATIC;
+			pDev->devAvailableFlags &= ~(0x00000001 << devIdx);
+			pDev->numDevices++;
+		} else {
+			devIdx = SVC_DRV_ERR_I3C_TOO_MANY_DEV;
+		}
+
+		svcI3cInterruptEnable(vpDriver, irqEna);
+	} else {
+		devIdx = SVC_DRV_ERR_INVALID_PARAM;
+	}
+
+	return devIdx;
+}
+
+int svcI3cSetDeviceAddress(void *vpDriver, uint8 devIdx, uint8 addr)
+{
+	int status = SVC_DRV_ERR_NONE;
+	struct svc_i3c_master *pDrv = (struct svc_i3c_master *)vpDriver;
+	svc_i3c_dev_t *pDev = (svc_i3c_dev_t *)(pDrv->pDev);
+
+	if (devIdx < I3C_MAX_DEVICES) {
+		if (pDev->devAvailableFlags & (0x1 << devIdx)) {
+			pDev->devices[devIdx].addr = addr;
+		} else {
+			status = SVC_DRV_ERR_I3C_BUSY;
+		}
+	} else {
+		status = SVC_DRV_ERR_INVALID_PARAM;
+	}
+
+	return status;
+}
+
+uint8 svcI3cGetDeviceIndexFromAddress(void *vpDriver, uint8 devAddr)
+{
+	struct svc_i3c_master *pDrv = (struct svc_i3c_master *)vpDriver;
+	svc_i3c_dev_t *pDev = (svc_i3c_dev_t *)(pDrv->pDev);
+	uint8 i;
+
+	for (i = 0; i < I3C_MAX_DEVICES; i++) {
+		if (pDev->devices[i].addr == devAddr) {
+			return i;
+		}
+	}
+
+	return I3C_INVALID_ADDR;
+}
+
+int32 svcI3cRead(void *vpDriver, void *pData)
+{
+	int32 status;
+
+	status = i3cReadCtrlMode(vpDriver, pData);
+
+	return status;
+}
+
+int32 svcI3cWrite(void *vpDriver, void *pData)
+{
+	int32 status;
+
+	status = i3cWriteCtrlMode(vpDriver, pData);
+
+	return status;
+}
+
+int32 svcI3cAbort(void *vpDriver, svc_i3c_xfer_t *pXfer)
+{
+	int32 status = SVC_DRV_ERR_I3C_XFER_ERR;
+	struct svc_i3c_master *pDrv = (struct svc_i3c_master *)vpDriver;
+	svc_i3c_dev_t *pDev;
+	uint32 intEna;
+
+	if (pDrv) {
+		pDev = pDrv->pDev;
+
+		printk("    %s: aborting transfer\n", __FUNCTION__);
+		printk("    %s: pDev->state = %d\n", __FUNCTION__, pDev->state);
+		printk("    %s: pDev->pXfer = %px\n", __FUNCTION__,
+		       pDev->pXfer);
+		printk("    %s: pXfer = %px\n", __FUNCTION__, pXfer);
+
+		intEna = svcI3cInterruptDisable(vpDriver);
+		if ((pDev->state == I3C_STATE_XFER_ACTIVE) &&
+		    (pXfer == pDev->pXfer)) {
+			pDev->pXfer = 0;
+			pDev->state = I3C_STATE_IDLE;
+			status = SVC_DRV_ERR_NONE;
+		}
+		svcI3cInterruptEnable(vpDriver, intEna);
+	}
+
+	return status;
+}
+
+int32 svcI3cControlSet(void *vpDriver, uint32 control, uint32 arg)
+{
+	int32 status = SVC_DRV_ERR_NONE;
+	struct svc_i3c_master *pDrv = (struct svc_i3c_master *)vpDriver;
+	svc_i3c_dev_t *pDev;
+
+	if (pDrv) {
+		pDev = pDrv->pDev;
+
+		switch (control) {
+		case I3C_CTRL_CFG_MASTER_ENABLE:
+			if (arg <= I3C_MASTER_CAPABLE) {
+				if (arg == I3C_MASTER_ENABLE) {
+					pDev->masterEna =
+						(svc_i3c_master_enable_t)arg;
+				} else {
+					status = SVC_DRV_ERR_NOT_SUPPORTED;
+				}
+			} else {
+				status = SVC_DRV_ERR_INVALID_PARAM;
+			}
+			break;
+
+		case I3C_CTRL_CFG_TIMEOUT_ERR_ENABLE:
+			if (arg == SVC_DRV_CTRL_ENABLE ||
+			    arg == SVC_DRV_CTRL_DISABLE) {
+				pDev->timeoutErrEna =
+					(svc_drv_ctrl_enable_t)arg;
+			} else {
+				status = SVC_DRV_ERR_INVALID_PARAM;
+			}
+			break;
+
+		case I3C_CTRL_CFG_HIGH_KEEPER:
+			if (arg <= I3C_HIGH_KEEPER_EXTERN_SDA_SCL) {
+				pDev->highKeeper = (svc_i3c_high_keeper_t)arg;
+			} else {
+				status = SVC_DRV_ERR_INVALID_PARAM;
+			}
+			break;
+
+		case I3C_CTRL_CFG_STOP_SPEED:
+			if (arg == I3C_STOP_SPEED_PUSH_PULL ||
+			    arg == I3C_STOP_SPEED_OPEN_DRAIN) {
+				pDev->stopSpeed = (svc_i3c_stop_speed_t)arg;
+			} else {
+				status = SVC_DRV_ERR_INVALID_PARAM;
+			}
+			break;
+
+		case I3C_CTRL_CFG_PPBAUD:
+			if (arg <= I3C_PPBAUD_MAX) {
+				pDev->ppBaud = (uint8)arg;
+			} else {
+				status = SVC_DRV_ERR_INVALID_PARAM;
+			}
+			break;
+
+		case I3C_CTRL_CFG_PPLOW:
+			if (arg <= I3C_PPLOW_MAX) {
+				pDev->ppLow = (uint8)arg;
+			} else {
+				status = SVC_DRV_ERR_INVALID_PARAM;
+			}
+			break;
+
+		case I3C_CTRL_CFG_ODBAUD:
+			if (arg <= I3C_ODBAUD_MAX) {
+				pDev->odBaud = (uint8)arg;
+			} else {
+				status = SVC_DRV_ERR_INVALID_PARAM;
+			}
+			break;
+
+		case I3C_CTRL_CFG_ODHPP:
+			if (arg == I3C_ODHPP_SCL_HIGH_EQ_SCL_LOW ||
+			    arg == I3C_ODHPP_SCL_HIGH_EQ_ONE_PPBAUD) {
+				pDev->odHpp = (svc_i3c_odhpp_t)arg;
+			} else {
+				status = SVC_DRV_ERR_INVALID_PARAM;
+			}
+			break;
+
+		case I3C_CTRL_CFG_SKEW:
+			if (arg <= I3C_SKEW_MAX) {
+				pDev->skew = (uint8)arg;
+			} else {
+				status = SVC_DRV_ERR_INVALID_PARAM;
+			}
+			break;
+
+		case I3C_CTRL_CFG_I2CBAUD:
+			if (arg <= I3C_I2CBAUD_MAX) {
+				pDev->i2cBaud = (uint8)arg;
+			} else {
+				status = SVC_DRV_ERR_INVALID_PARAM;
+			}
+			break;
+
+		case I3C_CTRL_ENABLE:
+			i3cEnable(vpDriver);
+			break;
+
+		case I3C_CTRL_DISABLE:
+			i3cDisable(vpDriver);
+			break;
+		case I3C_CTRL_ENTER_DAA:
+			status = i3cEnterDynamicAddressAssignment(vpDriver);
+			break;
+		case I3C_CTRL_ABORT_DAA:
+			status = i3cExitDynamicAddressAssignment(vpDriver);
+			break;
+		case I3C_CTRL_START_IBI:
+			status = i3cIbiStart(vpDriver);
+			break;
+		case I3C_CTRL_NACK_IBI:
+			status = i3cIbiNack(vpDriver);
+			break;
+		case I3C_CTRL_ISSUE_STOP:
+			i3cStop(vpDriver);
+			break;
+		default:
+			status = SVC_DRV_ERR_INVALID_PARAM;
+			break;
+		}
+	} else {
+		status = SVC_DRV_ERR_INVALID_PARAM;
+	}
+
+	return status;
+}
+
+int32 svcI3cControlGet(void *vpDriver, uint32 control, void *arg)
+{
+	int32 status = SVC_DRV_ERR_NONE;
+	struct svc_i3c_master *pDrv = (struct svc_i3c_master *)vpDriver;
+
+	uint32 i;
+	svc_i3c_dev_t *pDev;
+	uint32 *pRet32;
+	uint8 *pRet8;
+
+	if (pDrv && arg) {
+		pDev = pDrv->pDev;
+
+		pRet32 = (uint32 *)arg;
+		pRet8 = (uint8 *)arg;
+
+		switch (control) {
+		case I3C_CTRL_GET_VERSION:
+			*pRet32 = (I3C_DRV_VER_MAJOR << 8 | I3C_DRV_VER_MINOR);
+			break;
+		case I3C_CTRL_CFG_MASTER_ENABLE:
+			*pRet32 = pDev->masterEna;
+			break;
+		case I3C_CTRL_CFG_TIMEOUT_ERR_ENABLE:
+			*pRet32 = pDev->timeoutErrEna;
+			break;
+		case I3C_CTRL_CFG_HIGH_KEEPER:
+			*pRet32 = pDev->highKeeper;
+			break;
+		case I3C_CTRL_CFG_STOP_SPEED:
+			*pRet32 = pDev->stopSpeed;
+			break;
+		case I3C_CTRL_CFG_PPBAUD:
+			*pRet32 = pDev->ppBaud;
+			break;
+		case I3C_CTRL_CFG_PPLOW:
+			*pRet32 = pDev->ppLow;
+			break;
+		case I3C_CTRL_CFG_ODBAUD:
+			*pRet32 = pDev->odBaud;
+			break;
+		case I3C_CTRL_CFG_ODHPP:
+			*pRet32 = pDev->odHpp;
+			break;
+		case I3C_CTRL_CFG_SKEW:
+			*pRet32 = pDev->skew;
+			break;
+		case I3C_CTRL_CFG_I2CBAUD:
+			*pRet32 = pDev->i2cBaud;
+			break;
+		case I3C_CTRL_GET_DEV_AVAIL_FLAGS:
+			*pRet32 = pDev->devAvailableFlags;
+			break;
+		case I3C_CTRL_GET_NUM_BUS_DEVICES:
+			*pRet32 = pDev->numDevices;
+			break;
+		case I3C_CTRL_GET_SLV_ATTRIB:
+			status = i3cGetDeviceAttributes(
+				vpDriver, (svc_i3c_slv_attrib_t *)arg);
+			break;
+		case I3C_CTRL_GET_IBI_DEV_ADDR:
+			*pRet32 = pDev->ibiDevAddr;
+			break;
+		case I3C_CTRL_GET_IBI_TYPE:
+
+			switch (pDev->ibiType) {
+			case I3C_MSTATUS_IBITYPE_NORMAL:
+				*pRet32 = I3C_IBI_TYPE_NORMAL;
+				break;
+			case I3C_MSTATUS_IBITYPE_MASTER_REQ:
+				*pRet32 = I3C_IBI_TYPE_MASTER_REQ;
+				break;
+			case I3C_MSTATUS_IBITYPE_HOT_JOIN:
+				*pRet32 = I3C_IBI_TYPE_HOT_JOIN_REQ;
+				break;
+			case I3C_MSTATUS_IBITYPE_NONE:
+			default:
+				*pRet32 = I3C_IBI_TYPE_NONE;
+				break;
+			}
+			break;
+		case I3C_CTRL_GET_IBI_DATA:
+			for (i = 0; i < IBI_DATA_MAX_SIZE; i++) {
+				pRet8[i] = pDev->ibiData[i];
+			}
+			break;
+		default:
+			status = SVC_DRV_ERR_INVALID_PARAM;
+			break;
+		}
+	} else {
+		status = SVC_DRV_ERR_INVALID_PARAM;
+	}
+
+	return status;
+}
+
+#define XFER_TIMEOUT (msecs_to_jiffies(1000))
+#define CCC_TIMEOUT (msecs_to_jiffies(1000))
+#define DAA_TIMEOUT (msecs_to_jiffies(4000))
+
+#define I3C_PP_CLK_DIV_DEFAULT 3
+#define I3C_OD_CLK_DIV_DEFAULT 3
+#define I2C_CLK_DIV_DEFAULT 4
+
+static u32 eventCnt;
+static u32 daaCompleteCnt;
+static u32 rwCompletCnt;
+static u32 rwNackCnt;
+static u32 rwErrorCnt;
+static u32 ibiReqCnt;
+static u32 ibiCompleteCnt;
+
+static DECLARE_COMPLETION(daaComplete);
+
+static int svc_i3c_master_ibi_request_handler(struct svc_i3c_master *master);
+static int svc_i3c_master_ibi_complete_handler(struct svc_i3c_master *master);
+
+struct svc_i3c_i2c_dev_data {
+	u8 index;
+
+	s16 ibi_dev_idx;
+	struct i3c_generic_ibi_pool *ibi_pool;
+};
+
+static inline struct svc_i3c_master *
+to_svc_i3c_master(struct i3c_master_controller *master)
+{
+	return container_of(master, struct svc_i3c_master, base);
+}
+
+static irqreturn_t svc_i3c_master_irq_handler(int irq, void *dev_id)
+{
+	svcI3cMasterIsr(dev_id);
+
+	return IRQ_HANDLED;
+}
+
+static void i3cEventHandler(void *vpDriver, uint32 event)
+{
+	struct svc_i3c_master *pDrv = (struct svc_i3c_master *)vpDriver;
+
+	eventCnt++;
+
+	switch (event) {
+	case I3C_EVENT_DAA_COMPLETE:
+		daaCompleteCnt++;
+		complete(&daaComplete);
+		break;
+	case I3C_EVENT_RW_COMPLETE:
+		complete(&(pDrv->pDev->pXfer->comp));
+		rwCompletCnt++;
+		break;
+	case I3C_EVENT_RW_NACK:
+		rwNackCnt++;
+		break;
+	case I3C_EVENT_RW_TIMEOUT:
+	case I3C_EVENT_RW_ERR:
+		rwErrorCnt++;
+		break;
+	case I3C_EVENT_IBI_REQUEST:
+		ibiReqCnt++;
+		svc_i3c_master_ibi_request_handler(pDrv);
+		break;
+	case I3C_EVENT_IBI_COMPLETE:
+		ibiCompleteCnt++;
+		svc_i3c_master_ibi_complete_handler(pDrv);
+		break;
+	default:
+		break;
+	}
+}
+
+static int svc_i3c_master_bus_init(struct i3c_master_controller *m)
+{
+	struct svc_i3c_master *master = to_svc_i3c_master(m);
+	struct i3c_device_info info = {};
+	int ret;
+
+	ret = i3c_master_get_free_addr(m, 0);
+	if (ret < 0)
+		return ret;
+
+	memset(&info, 0, sizeof(info));
+	info.dyn_addr = ret;
+
+	ret = i3c_master_set_info(&master->base, &info);
+	if (ret)
+		return ret;
+
+	svcI3cRegisterEventHandler((void *)master, i3cEventHandler);
+	svcI3cControlSet((void *)master, I3C_CTRL_CFG_MASTER_ENABLE,
+			 I3C_MASTER_ENABLE);
+
+	svcI3cControlSet((void *)master, I3C_CTRL_CFG_PPLOW, 0);
+
+	if (svcI3cControlSet((void *)master, I3C_CTRL_CFG_PPBAUD,
+			     (master->i3c_pp_clk_div - 1)) !=
+	    SVC_DRV_ERR_NONE) {
+		svcI3cControlSet((void *)master, I3C_CTRL_CFG_PPBAUD,
+				 I3C_PP_CLK_DIV_DEFAULT);
+	}
+
+	if (svcI3cControlSet((void *)master, I3C_CTRL_CFG_ODBAUD,
+			     (master->i3c_od_clk_div - 1)) !=
+	    SVC_DRV_ERR_NONE) {
+		svcI3cControlSet((void *)master, I3C_CTRL_CFG_ODBAUD,
+				 I3C_OD_CLK_DIV_DEFAULT);
+	}
+
+	svcI3cControlSet((void *)master, I3C_CTRL_CFG_ODHPP,
+			 I3C_ODHPP_SCL_HIGH_EQ_SCL_LOW);
+	svcI3cControlSet((void *)master, I3C_CTRL_CFG_SKEW, 0);
+
+	if (svcI3cControlSet((void *)master, I3C_CTRL_CFG_I2CBAUD,
+			     (master->i3c_od_clk_div - 1)) !=
+	    SVC_DRV_ERR_NONE) {
+		svcI3cControlSet((void *)master, I3C_CTRL_CFG_I2CBAUD,
+				 I2C_CLK_DIV_DEFAULT);
+	}
+
+	svcI3cControlSet((void *)master, I3C_CTRL_ENABLE, 0);
+
+	return 0;
+}
+
+static int svc_i3c_master_attach_i3c_dev(struct i3c_dev_desc *dev)
+{
+	struct svc_i3c_i2c_dev_data *data;
+
+	data = kzalloc(sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->ibi_dev_idx = -1;
+	i3c_dev_set_master_data(dev, data);
+
+	return 0;
+}
+
+static int svc_i3c_master_do_daa(struct i3c_master_controller *m)
+{
+	struct svc_i3c_master *master = to_svc_i3c_master(m);
+	int ret, i;
+	int status = 0;
+	uint8 tempAddr = 0;
+	uint32 origDevAvailFlags, newDevAvailFlags, changedFlags;
+	svc_i3c_slv_attrib_t slvAttrib;
+
+	spin_lock(&master->access_lock);
+
+	svcI3cControlGet((void *)master, I3C_CTRL_GET_DEV_AVAIL_FLAGS,
+			 &origDevAvailFlags);
+
+	for (i = 0; i < I3C_MAX_DEVICES; i++) {
+		if (origDevAvailFlags & (0x1 << i)) {
+			ret = i3c_master_get_free_addr(m, tempAddr + 1);
+			if (ret > 0) {
+				tempAddr = (uint8)ret;
+				svcI3cSetDeviceAddress((void *)master, i,
+						       tempAddr);
+			}
+		}
+	}
+
+	reinit_completion(&daaComplete);
+
+	ret = svcI3cControlSet((void *)master, I3C_CTRL_ENTER_DAA, 0);
+	if (ret == SVC_DRV_ERR_NONE) {
+		if (!wait_for_completion_timeout(&daaComplete, DAA_TIMEOUT)) {
+			svcI3cControlSet((void *)master, I3C_CTRL_ABORT_DAA, 0);
+
+			status = -ETIME;
+		} else {
+		}
+	} else {
+		status = ret;
+	}
+
+	spin_unlock(&master->access_lock);
+
+	svcI3cControlGet((void *)master, I3C_CTRL_GET_DEV_AVAIL_FLAGS,
+			 &newDevAvailFlags);
+
+	changedFlags = origDevAvailFlags - newDevAvailFlags;
+
+	for (i = 0; i < I3C_MAX_DEVICES; i++) {
+		if (changedFlags & (0x1 << i)) {
+			slvAttrib.devIdx = i;
+			svcI3cControlGet((void *)master,
+					 I3C_CTRL_GET_SLV_ATTRIB, &slvAttrib);
+
+			ret = i3c_master_add_i3c_dev_locked(m, slvAttrib.addr);
+		} else if (newDevAvailFlags & (0x1 << i)) {
+			svcI3cSetDeviceAddress((void *)master, i,
+					       I3C_INVALID_ADDR);
+		}
+	}
+
+	i3c_master_enec_locked(m, I3C_BROADCAST_ADDR,
+			       I3C_CCC_EVENT_HJ | I3C_CCC_EVENT_MR);
+
+	return status;
+}
+
+static bool
+svc_i3c_master_supports_ccc_cmd(struct i3c_master_controller *master,
+				const struct i3c_ccc_cmd *cmd)
+{
+	if (cmd->ndests > 1)
+		return false;
+
+	return true;
+}
+
+static int svc_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
+				       struct i3c_ccc_cmd *cmd)
+{
+	int status = -1;
+	struct svc_i3c_master *master = to_svc_i3c_master(m);
+	svc_i3c_xfer_t *pI3cXfer;
+	uint8 *pXferBuf;
+	uint8 *pData;
+	int i;
+	int ret;
+
+	pI3cXfer =
+		(svc_i3c_xfer_t *)kzalloc(sizeof(svc_i3c_xfer_t), GFP_KERNEL);
+	if (pI3cXfer == NULL) {
+		return -ENOMEM;
+	}
+
+	pI3cXfer->type = I3C_XFER_TYPE_I3C_BCCC_WRITE;
+
+	if (cmd->rnw) {
+		pI3cXfer->count = 1;
+		pI3cXfer->pData = &cmd->id;
+		pI3cXfer->stop = 0;
+		pI3cXfer->allowIbi = 1;
+
+		init_completion(&pI3cXfer->comp);
+
+		spin_lock(&master->access_lock);
+
+		ret = svcI3cWrite((void *)master, (void *)pI3cXfer);
+		if (ret == SVC_DRV_ERR_NONE) {
+			if (!wait_for_completion_timeout(&pI3cXfer->comp,
+							 XFER_TIMEOUT)) {
+				svcI3cAbort((void *)master, pI3cXfer);
+
+				status = -ETIMEDOUT;
+			} else {
+				status = 0;
+			}
+		} else {
+			svcI3cAbort((void *)master, pI3cXfer);
+
+			status = ret;
+		}
+
+		if (status == 0) {
+			status = -1;
+
+			ret = svcI3cGetDeviceIndexFromAddress(
+				(void *)master, cmd->dests[0].addr);
+			if (ret >= 0) {
+				pI3cXfer->devId = (uint8)ret;
+				pI3cXfer->type = I3C_XFER_TYPE_I3C_READ;
+				pI3cXfer->count = cmd->dests[0].payload.len;
+				pI3cXfer->pData = cmd->dests[0].payload.data;
+				pI3cXfer->stop = 1;
+				pI3cXfer->allowIbi = 0;
+
+				reinit_completion(&pI3cXfer->comp);
+
+				ret = svcI3cRead((void *)master,
+						 (void *)pI3cXfer);
+				if (ret == SVC_DRV_ERR_NONE) {
+					if (!wait_for_completion_timeout(
+						    &pI3cXfer->comp,
+						    XFER_TIMEOUT)) {
+						svcI3cAbort((void *)master,
+							    pI3cXfer);
+
+						status = -ETIMEDOUT;
+					} else {
+						status = 0;
+					}
+				} else {
+					svcI3cAbort((void *)master, pI3cXfer);
+
+					status = ret;
+				}
+			}
+		}
+
+		spin_unlock(&master->access_lock);
+
+	} else {
+		if (cmd->dests[0].addr == I3C_BROADCAST_ADDR) {
+			pI3cXfer->count = cmd->dests[0].payload.len + 1;
+
+			pXferBuf = kzalloc(pI3cXfer->count, GFP_KERNEL);
+			if (pXferBuf) {
+				pXferBuf[0] = cmd->id;
+				pData = (uint8 *)cmd->dests[0].payload.data;
+				for (i = 1; i < pI3cXfer->count; i++) {
+					pXferBuf[i] = pData[i - 1];
+				}
+
+				pI3cXfer->pData = pXferBuf;
+				pI3cXfer->stop = 1;
+				pI3cXfer->allowIbi = 1;
+
+				init_completion(&pI3cXfer->comp);
+
+				spin_lock(&master->access_lock);
+
+				ret = svcI3cWrite((void *)master,
+						  (void *)pI3cXfer);
+				if (ret == SVC_DRV_ERR_NONE) {
+					if (!wait_for_completion_timeout(
+						    &pI3cXfer->comp,
+						    XFER_TIMEOUT)) {
+						svcI3cAbort((void *)master,
+							    pI3cXfer);
+
+						status = -ETIMEDOUT;
+					} else {
+						status = 0;
+					}
+				} else {
+					svcI3cAbort((void *)master, pI3cXfer);
+
+					status = ret;
+				}
+
+				spin_unlock(&master->access_lock);
+
+				kzfree(pXferBuf);
+			} else {
+				status = -ENOMEM;
+			}
+		} else {
+			pI3cXfer->count = 1;
+			pI3cXfer->pData = &cmd->id;
+			pI3cXfer->stop = 0;
+			pI3cXfer->allowIbi = 1;
+
+			init_completion(&pI3cXfer->comp);
+
+			spin_lock(&master->access_lock);
+
+			ret = svcI3cWrite((void *)master, (void *)pI3cXfer);
+			if (ret == SVC_DRV_ERR_NONE) {
+				if (!wait_for_completion_timeout(
+					    &pI3cXfer->comp, XFER_TIMEOUT)) {
+					svcI3cAbort((void *)master, pI3cXfer);
+
+					status = -ETIMEDOUT;
+				} else {
+					status = 0;
+				}
+			} else {
+				svcI3cAbort((void *)master, pI3cXfer);
+
+				status = ret;
+			}
+
+			if (status == 0) {
+				status = -1;
+
+				ret = svcI3cGetDeviceIndexFromAddress(
+					(void *)master, cmd->dests[0].addr);
+				if (ret >= 0) {
+					pI3cXfer->devId = (uint8)ret;
+					pI3cXfer->type =
+						I3C_XFER_TYPE_I3C_WRITE;
+					pI3cXfer->count =
+						cmd->dests[0].payload.len;
+					pI3cXfer->pData =
+						cmd->dests[0].payload.data;
+					pI3cXfer->stop = 1;
+					pI3cXfer->allowIbi = 0;
+
+					reinit_completion(&pI3cXfer->comp);
+
+					ret = svcI3cWrite((void *)master,
+							  (void *)pI3cXfer);
+					if (ret == SVC_DRV_ERR_NONE) {
+						if (!wait_for_completion_timeout(
+							    &pI3cXfer->comp,
+							    XFER_TIMEOUT)) {
+							svcI3cAbort(
+								(void *)master,
+								pI3cXfer);
+
+							status = -ETIMEDOUT;
+						} else {
+							status = 0;
+						}
+					} else {
+						svcI3cAbort((void *)master,
+							    pI3cXfer);
+
+						status = ret;
+					}
+				}
+			}
+
+			spin_unlock(&master->access_lock);
+		}
+	}
+
+	kzfree(pI3cXfer);
+
+	return status;
+}
+
+static int svc_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
+				     struct i3c_priv_xfer *xfers, int nxfers)
+{
+	struct i3c_master_controller *m = i3c_dev_get_master(dev);
+	struct svc_i3c_master *master = to_svc_i3c_master(m);
+	svc_i3c_xfer_t *pI3cXfer;
+	int i;
+	int ret;
+
+	pI3cXfer =
+		(svc_i3c_xfer_t *)kzalloc(sizeof(svc_i3c_xfer_t), GFP_KERNEL);
+	if (pI3cXfer == NULL) {
+		return -ENOMEM;
+	}
+
+	spin_lock(&master->access_lock);
+
+	for (i = 0; i < nxfers; i++) {
+		if (dev->info.dyn_addr) {
+			ret = svcI3cGetDeviceIndexFromAddress(
+				(void *)master, dev->info.dyn_addr);
+		} else {
+			ret = svcI3cGetDeviceIndexFromAddress(
+				(void *)master, dev->info.static_addr);
+		}
+
+		if (ret < 0) {
+			kzfree(pI3cXfer);
+			spin_unlock(&master->access_lock);
+			return -ENODEV;
+		}
+
+		pI3cXfer->devId = (uint8)ret;
+
+		pI3cXfer->count = xfers[i].len;
+
+		if (i < nxfers - 1) {
+			pI3cXfer->stop = 0;
+		} else {
+			pI3cXfer->stop = 1;
+		}
+
+		pI3cXfer->allowIbi = 1;
+
+		init_completion(&pI3cXfer->comp);
+
+		if (xfers[i].rnw) {
+			pI3cXfer->pData = xfers[i].data.in;
+			pI3cXfer->type = I3C_XFER_TYPE_I3C_READ;
+			ret = svcI3cRead((void *)master, (void *)pI3cXfer);
+		} else {
+			pI3cXfer->pData = (uint8 *)(xfers[i].data.out);
+			pI3cXfer->type = I3C_XFER_TYPE_I3C_WRITE;
+			ret = svcI3cWrite((void *)master, (void *)pI3cXfer);
+		}
+
+		if (ret == SVC_DRV_ERR_NONE) {
+			if (!wait_for_completion_timeout(&pI3cXfer->comp,
+							 XFER_TIMEOUT)) {
+				svcI3cAbort((void *)master, pI3cXfer);
+
+				spin_unlock(&master->access_lock);
+
+				kzfree(pI3cXfer);
+				return -ETIMEDOUT;
+			}
+		} else {
+			svcI3cAbort((void *)master, pI3cXfer);
+
+			spin_unlock(&master->access_lock);
+
+			kzfree(pI3cXfer);
+			return ret;
+		}
+	}
+
+	spin_unlock(&master->access_lock);
+
+	kzfree(pI3cXfer);
+
+	return 0;
+}
+
+static int svc_i3c_master_attach_i2c_dev(struct i2c_dev_desc *dev)
+{
+	struct i3c_master_controller *m = i2c_dev_get_master(dev);
+	struct svc_i3c_master *master = to_svc_i3c_master(m);
+	struct svc_i3c_i2c_dev_data *data;
+	int32 ret;
+
+	ret = svcI3cAddStaticDevice((void *)master, dev->boardinfo->base.addr);
+	if (ret < 0) {
+		return ret;
+	}
+
+	data = kzalloc(sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->index = ret;
+
+	i2c_dev_set_master_data(dev, data);
+
+	return 0;
+}
+
+static int svc_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
+				    const struct i2c_msg *xfers, int nxfers)
+{
+	struct i3c_master_controller *m = i2c_dev_get_master(dev);
+	struct svc_i3c_master *master = to_svc_i3c_master(m);
+	struct svc_i3c_i2c_dev_data *data = i2c_dev_get_master_data(dev);
+	svc_i3c_xfer_t *pI3cXfer;
+	int i;
+	int ret;
+
+	pI3cXfer =
+		(svc_i3c_xfer_t *)kzalloc(sizeof(svc_i3c_xfer_t), GFP_KERNEL);
+	if (pI3cXfer == NULL) {
+		return -ENOMEM;
+	}
+
+	spin_lock(&master->access_lock);
+
+	for (i = 0; i < nxfers; i++) {
+		pI3cXfer->devId = data->index;
+
+		pI3cXfer->count = xfers[i].len;
+		pI3cXfer->pData = xfers[i].buf;
+
+		if (i < nxfers - 1) {
+			pI3cXfer->stop = 0;
+		} else {
+			pI3cXfer->stop = 1;
+		}
+
+		pI3cXfer->allowIbi = 1;
+
+		init_completion(&pI3cXfer->comp);
+
+		if (xfers[i].flags & I2C_M_RD) {
+			pI3cXfer->type = I3C_XFER_TYPE_I2C_READ;
+			ret = svcI3cRead((void *)master, (void *)pI3cXfer);
+		} else {
+			pI3cXfer->type = I3C_XFER_TYPE_I2C_WRITE;
+			ret = svcI3cWrite((void *)master, (void *)pI3cXfer);
+		}
+
+		if (ret == SVC_DRV_ERR_NONE) {
+			if (!wait_for_completion_timeout(&pI3cXfer->comp,
+							 XFER_TIMEOUT)) {
+				svcI3cAbort((void *)master, pI3cXfer);
+
+				spin_unlock(&master->access_lock);
+
+				kzfree(pI3cXfer);
+				return -ETIMEDOUT;
+			}
+		} else {
+			svcI3cAbort((void *)master, pI3cXfer);
+
+			spin_unlock(&master->access_lock);
+
+			kzfree(pI3cXfer);
+			return ret;
+		}
+	}
+
+	spin_unlock(&master->access_lock);
+	kzfree(pI3cXfer);
+	return 0;
+}
+
+static int svc_i3c_master_ibi_request_handler(struct svc_i3c_master *master)
+{
+	int status;
+
+	spin_lock(&master->access_lock);
+	status = svcI3cControlSet((void *)master, I3C_CTRL_START_IBI, 0);
+	if (status != SVC_DRV_ERR_NONE) {
+		svcI3cControlSet((void *)master, I3C_CTRL_NACK_IBI, 0);
+	}
+
+	spin_unlock(&master->access_lock);
+	return status;
+}
+
+static int svc_i3c_master_ibi_complete_handler(struct svc_i3c_master *master)
+{
+	struct svc_i3c_i2c_dev_data *data;
+	struct i3c_dev_desc *dev;
+	struct i3c_ibi_slot *slot;
+	unsigned int i;
+	int ret = -1;
+
+	for (i = 0; i < master->ibi.num_ibi_devices; i++) {
+		dev = master->ibi.dev_desc[i];
+
+		if (dev->info.dyn_addr == master->pDev->ibiDevAddr) {
+			data = i3c_dev_get_master_data(dev);
+
+			slot = i3c_generic_ibi_get_free_slot(data->ibi_pool);
+			if (slot) {
+				memcpy(slot->data, master->pDev->ibiData,
+				       master->pDev->ibiIdx);
+				slot->len = master->pDev->ibiIdx;
+
+				i3c_master_queue_ibi(dev, slot);
+				ret = 0;
+			}
+
+			break;
+		}
+	}
+
+	return ret;
+}
+
+static int svc_i3c_master_request_ibi(struct i3c_dev_desc *dev,
+				      const struct i3c_ibi_setup *req)
+{
+	struct i3c_master_controller *m = i3c_dev_get_master(dev);
+	struct svc_i3c_master *master = to_svc_i3c_master(m);
+	struct svc_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
+	unsigned long flags;
+	unsigned int i;
+
+	data->ibi_pool = i3c_generic_ibi_alloc_pool(dev, req);
+	if (IS_ERR(data->ibi_pool)) {
+		return PTR_ERR(data->ibi_pool);
+	}
+
+	spin_lock_irqsave(&master->ibi.lock, flags);
+	for (i = 0; i < master->ibi.num_ibi_devices; i++) {
+		if (!master->ibi.dev_desc[i]) {
+			data->ibi_dev_idx = i;
+			master->ibi.dev_desc[i] = dev;
+			break;
+		}
+	}
+	spin_unlock_irqrestore(&master->ibi.lock, flags);
+
+	if (i < master->ibi.num_ibi_devices) {
+		return 0;
+	}
+
+	i3c_generic_ibi_free_pool(data->ibi_pool);
+	data->ibi_pool = NULL;
+
+	return -ENOSPC;
+}
+
+static void svc_i3c_master_free_ibi(struct i3c_dev_desc *dev)
+{
+	struct i3c_master_controller *m = i3c_dev_get_master(dev);
+	struct svc_i3c_master *master = to_svc_i3c_master(m);
+	struct svc_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
+	unsigned long flags;
+
+	spin_lock_irqsave(&master->ibi.lock, flags);
+	master->ibi.dev_desc[data->ibi_dev_idx] = NULL;
+	data->ibi_dev_idx = -1;
+	spin_unlock_irqrestore(&master->ibi.lock, flags);
+
+	i3c_generic_ibi_free_pool(data->ibi_pool);
+}
+
+static int svc_i3c_master_enable_ibi(struct i3c_dev_desc *dev)
+{
+	int ret;
+	struct i3c_master_controller *m = i3c_dev_get_master(dev);
+
+	ret = i3c_master_enec_locked(m, dev->info.dyn_addr, I3C_CCC_EVENT_SIR);
+	return ret;
+}
+
+static int svc_i3c_master_disable_ibi(struct i3c_dev_desc *dev)
+{
+	int ret;
+	struct i3c_master_controller *m = i3c_dev_get_master(dev);
+	ret = i3c_master_disec_locked(m, dev->info.dyn_addr, I3C_CCC_EVENT_SIR);
+	return ret;
+}
+
+static void svc_i3c_master_recycle_ibi_slot(struct i3c_dev_desc *dev,
+					    struct i3c_ibi_slot *slot)
+{
+	struct svc_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
+
+	i3c_generic_ibi_recycle_slot(data->ibi_pool, slot);
+}
+
+static const struct i3c_master_controller_ops svc_i3c_master_ops = {
+	.bus_init = svc_i3c_master_bus_init,
+	.attach_i3c_dev = svc_i3c_master_attach_i3c_dev,
+	.do_daa = svc_i3c_master_do_daa,
+	.supports_ccc_cmd = svc_i3c_master_supports_ccc_cmd,
+	.send_ccc_cmd = svc_i3c_master_send_ccc_cmd,
+	.priv_xfers = svc_i3c_master_priv_xfers,
+	.attach_i2c_dev = svc_i3c_master_attach_i2c_dev,
+	.i2c_xfers = svc_i3c_master_i2c_xfers,
+	.request_ibi = svc_i3c_master_request_ibi,
+	.free_ibi = svc_i3c_master_free_ibi,
+	.enable_ibi = svc_i3c_master_enable_ibi,
+	.disable_ibi = svc_i3c_master_disable_ibi,
+	.recycle_ibi_slot = svc_i3c_master_recycle_ibi_slot,
+};
+
+static int svc_i3c_master_probe(struct platform_device *pdev)
+{
+	struct svc_i3c_master *master;
+	struct resource *res;
+	int ret, irq;
+	int reg;
+	struct device_node *np = pdev->dev.of_node;
+	void *pTmp;
+
+	master = devm_kzalloc(&pdev->dev, sizeof(*master), GFP_KERNEL);
+	if (!master)
+		return -ENOMEM;
+
+	master->pDev =
+		devm_kzalloc(&pdev->dev, sizeof(svc_i3c_dev_t), GFP_KERNEL);
+	if (!(master->pDev))
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	master->baseAddr = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(master->baseAddr))
+		return PTR_ERR(master->baseAddr);
+
+	spin_lock_init(&master->access_lock);
+
+	svcI3cInitialize((void *)master, master->pDev, 0, 0);
+
+	master->pclk = devm_clk_get(&pdev->dev, "pclk");
+	if (IS_ERR(master->pclk))
+		return PTR_ERR(master->pclk);
+
+	master->fclk_i3c = devm_clk_get(&pdev->dev, "fclk_i3c_ms");
+	if (IS_ERR(master->fclk_i3c))
+		return PTR_ERR(master->fclk_i3c);
+
+	master->clk_slow_12_5 = devm_clk_get(&pdev->dev, "clk_slow_12p5mhz");
+	if (IS_ERR(master->clk_slow_12_5))
+		return PTR_ERR(master->clk_slow_12_5);
+
+	ret = clk_prepare_enable(master->pclk);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(master->fclk_i3c);
+	if (ret)
+		goto err_disable_pclk;
+
+	ret = clk_prepare_enable(master->clk_slow_12_5);
+	if (ret)
+		goto err_disable_fclk_i3c;
+
+	irq = platform_get_irq(pdev, 0);
+
+	ret = devm_request_irq(&pdev->dev, irq, svc_i3c_master_irq_handler, 0,
+			       dev_name(&pdev->dev), master);
+	if (ret)
+		goto err_disable_clk_slow_12p5mhz;
+
+	platform_set_drvdata(pdev, master);
+
+	master->i3c_pp_clk_div = I3C_PP_CLK_DIV_DEFAULT;
+	master->i3c_od_clk_div = I3C_OD_CLK_DIV_DEFAULT;
+	master->i2c_clk_div = I2C_CLK_DIV_DEFAULT;
+
+	pTmp = of_get_property(np, "svc,i3c-pp-clk-div", NULL);
+	if (pTmp) {
+		if (*(uint32 *)pTmp) {
+			master->i3c_pp_clk_div = (uint32)be32_to_cpup(pTmp);
+		}
+	}
+
+	pTmp = of_get_property(np, "svc,i3c-od-clk-div", NULL);
+	if (pTmp) {
+		if (*(uint32 *)pTmp) {
+			master->i3c_od_clk_div = (uint32)be32_to_cpup(pTmp);
+		}
+	}
+
+	pTmp = of_get_property(np, "svc,i2c-clk-div", NULL);
+	if (pTmp) {
+		if (*(uint32 *)pTmp) {
+			master->i2c_clk_div = (uint32)be32_to_cpup(pTmp);
+		}
+	}
+
+	spin_lock_init(&master->ibi.lock);
+	master->ibi.num_ibi_devices = I3C_MAX_DEVICES;
+	master->ibi.dev_desc =
+		devm_kcalloc(&pdev->dev, master->ibi.num_ibi_devices,
+			     sizeof(*master->ibi.dev_desc), GFP_KERNEL);
+	if (!master->ibi.dev_desc) {
+		ret = -ENOMEM;
+		goto err_disable_clk_slow_12p5mhz;
+	}
+
+	ret = i3c_master_register(&master->base, &pdev->dev,
+				  &svc_i3c_master_ops, false);
+
+	if (ret == 0)
+		return 0;
+
+err_disable_clk_slow_12p5mhz:
+	clk_disable_unprepare(master->clk_slow_12_5);
+
+err_disable_fclk_i3c:
+	clk_disable_unprepare(master->fclk_i3c);
+
+err_disable_pclk:
+	clk_disable_unprepare(master->pclk);
+
+	return ret;
+}
+
+static int svc_i3c_master_remove(struct platform_device *pdev)
+{
+	struct svc_i3c_master *master = platform_get_drvdata(pdev);
+	int ret;
+
+	ret = i3c_master_unregister(&master->base);
+	if (ret)
+		return ret;
+
+	clk_disable_unprepare(master->pclk);
+	clk_disable_unprepare(master->fclk_i3c);
+	clk_disable_unprepare(master->clk_slow_12_5);
+
+	return 0;
+}
+
+static const struct of_device_id svc_i3c_master_of_match_tbl[] = {
+	{
+		.compatible = "svc,i3c-master",
+	},
+	{},
+};
+
+static struct platform_driver svc_i3c_master = {
+	.probe = svc_i3c_master_probe,
+	.remove = svc_i3c_master_remove,
+	.driver =
+		{
+			.name = "svc-i3c-master",
+			.of_match_table = svc_i3c_master_of_match_tbl,
+		},
+};
+
+module_platform_driver(svc_i3c_master);
+
+MODULE_AUTHOR("Conor Culhane <conor.culhane@silvaco.com>");
+MODULE_DESCRIPTION("Silvaco I3C master driver");
+MODULE_LICENSE("GPL v2");
-- 
2.17.1


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
