Return-Path: <SRS0=hvQn=5M=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D94CC43331
	for <linux-i3c@archiver.kernel.org>; Fri, 27 Mar 2020 14:02:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A1C8206F1
	for <linux-i3c@archiver.kernel.org>; Fri, 27 Mar 2020 14:02:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lD8n0JmK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=silvaco.com header.i=@silvaco.com header.b="G4SX92K9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A1C8206F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=silvaco.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fsG70/IuFRcpXTTMhqEsT4M4HipCLzwoHHGC4kqzTTs=; b=lD8n0JmKDJPo62
	8QkN5hVuBDIcOJvunosj/StbYW1qXlmmf+MOSN5Qic8zPYO2WfCcFaP/6WGLJeRF1XF0MAXg+ObY7
	jSm62Vc7p2MpEkWlxLko71fzTiEiqKakV0Gp5x/e9ut/BS5b8158QFpywA3PvJ5L/xc91LfgAeONB
	d6xLRtvV7Zmxi30S2x1IuQTdrijDzX5als60EL4rdqlA3XghhX3Fzd8t9X+sAn9hXUErIH7w6dx7+
	8WQxbw11W0z3JxFGhZ2tkp+eaBJC7ioRNhXrZx99NWE/KJkeGvXyYta5tlujjmEzFq9wrwowgd84q
	Y7nywUCtv2ew+kmxykDg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHpZ1-0000iE-Ru; Fri, 27 Mar 2020 14:02:23 +0000
Received: from mail-eopbgr690050.outbound.protection.outlook.com
 ([40.107.69.50] helo=NAM04-CO1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jH8TV-0002r8-0J
 for linux-i3c@lists.infradead.org; Wed, 25 Mar 2020 16:01:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Se6Crpf0URmqnhaFiBOq6cIP0qwlg7MldMN+jKQkZ/9YK+2+V2Zbi1wQPzaMrd08RBCC1VK+9ZIghotl0tCT1RmaMnh9/UHRCLnt14LEloJLoiFdyO8evegrDGzrEema0SUiakzvt+9ouHCNKX+xk0KkglgPJChC1DpVlM6IFCcQZEwSZn+5jfmCfyRq4oN6415s1aJYDr0jfnnAEp6OmecP5Xf8KnoL+QW7kM3LudRX3alq8Mym7DIUxZGa9XFE5ty967GN5SsXCUzF3iJOcCYo5PP3qIprsilLdrVF1vAtfggbZi2Myb5/VWfpe7Q3oCZsfwOH5Ej4NhDwrODSIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GPmSGS7iGpCCx9A9aXxFfYV0W1yZVB5NX6+IPatwvpA=;
 b=hUJT62CSORHsGfLT+OCoRtrO01j8SQPtqxH7xTTaLxCvi1Kesz2Qz0GS8u4Z7ATwcSblvTZqFhwBsjE10vmVJPMAV7+oBdOtRaP4166DWH2Fe7VuXSiK+4iy575008Okglj+fxhS3IX6aO6ujxm2+hrznsGgDccDoH9P4Bcsj4aSqR3Dk3IvyFRI01lLiJebZYM0/Xgac0Pp8YAaWOmp0e9t1PE0yslJgTrvWB4rtOrYciskKgOXrC3/qf7rUp43Em0K5Gny7X7/eZDe8nE+Aeqr7NomLJivmR+mWSB+LQlY8eZWGhPSuobRwXsV/ftXzz+2i6hDYI8sMOI8Kip2LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silvaco.com; dmarc=pass action=none header.from=silvaco.com;
 dkim=pass header.d=silvaco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silvaco.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GPmSGS7iGpCCx9A9aXxFfYV0W1yZVB5NX6+IPatwvpA=;
 b=G4SX92K9R/7p0r/2EqtdrdYsnk7JHt03v6Q/6vi7e16U0x3WL1bMOD0zHGbsmNjXTYyppqdWGCxBtPuiVmU27LjdDSgVI5eZzj9w3U7PBNVhohhPF4ta/tpY+K23s59bXqHV8QN6yfQ3eF195Ql3hJ7WAW4B8J3+jioac89sw0U=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=conor.culhane@silvaco.com; 
Received: from MN2PR16MB2992.namprd16.prod.outlook.com (2603:10b6:208:db::20)
 by MN2PR16MB2813.namprd16.prod.outlook.com (2603:10b6:208:d6::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.18; Wed, 25 Mar
 2020 16:01:41 +0000
Received: from MN2PR16MB2992.namprd16.prod.outlook.com
 ([fe80::48d5:a180:c3bd:d466]) by MN2PR16MB2992.namprd16.prod.outlook.com
 ([fe80::48d5:a180:c3bd:d466%6]) with mapi id 15.20.2835.021; Wed, 25 Mar 2020
 16:01:41 +0000
From: Conor Culhane <conor.culhane@silvaco.com>
To: bbrezillon@kernel.org
Subject: [PATCH] i3c: master: Add driver for Silvaco I3C Dual-Role Master IP
Date: Wed, 25 Mar 2020 12:00:47 -0400
Message-Id: <20200325160047.11082-1-conor.culhane@silvaco.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: SN1PR12CA0102.namprd12.prod.outlook.com
 (2603:10b6:802:21::37) To MN2PR16MB2992.namprd16.prod.outlook.com
 (2603:10b6:208:db::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (24.99.164.72) by
 SN1PR12CA0102.namprd12.prod.outlook.com (2603:10b6:802:21::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.20 via Frontend Transport; Wed, 25 Mar 2020 16:01:41 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [24.99.164.72]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 802fec54-f9ae-4e27-e867-08d7d0d5cedc
X-MS-TrafficTypeDiagnostic: MN2PR16MB2813:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR16MB2813ECC9C09326CA488F8848F1CE0@MN2PR16MB2813.namprd16.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-Forefront-PRVS: 0353563E2B
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(366004)(346002)(39850400004)(136003)(376002)(396003)(6916009)(5660300002)(66476007)(26005)(2906002)(66556008)(1076003)(66946007)(6506007)(81156014)(36756003)(86362001)(8676002)(8936002)(81166006)(69590400007)(6512007)(4326008)(2616005)(186003)(956004)(478600001)(44832011)(16526019)(107886003)(52116002)(6486002)(316002)(30864003)(579004)(559001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR16MB2813;
 H:MN2PR16MB2992.namprd16.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; 
Received-SPF: None (protection.outlook.com: silvaco.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GlimIYUXNM79/F3NVKlp5/BvfavFjO5eiPwwOG1zIrhYG9o35r8p+Vx2IsGW32xs2Ko1FCSp4x/t81W91ip/GusP6MreKkWbvy9BJ0O00b/woWs3QnvOQ+W2YMC2ElNdrF3uFottMolWkGYxWswp2usJ2y+SSksnaScUmL49edKaBqC6UZ5/qdNUnlewcY/g8shjWUOtQPA0dZQ2dSpI3+WE2GyxmmlcTm44zRoL3DAjIfZsQ/tLUQqCQioTTFJtNXAtcAUY5S8n97W9h2rotv0hmUe8Y7tdJ8YplWzFwbU1dn00eCquj3gD8Dj45JGEc5afR0J+JrGKBKYt8YDf4EofjXf2SFQ3bnIuQgo3lTUWuESY9s8hLGq30G68OhelvsRKuXwmy4ourcfBM5wNRvMizku08EU9KZuiOEoVQL0PVf9VxnfKr+YvuqYJi3/AIYBJWkYoradeOfM3rP7eooAxPzjilAnVMioozWsloQLzaOftNcFCq1XJsVQT6BJl
X-MS-Exchange-AntiSpam-MessageData: 0dsWPdvPjBwTTAdxxHOPdOi/I7+3m6yTfmiaPtWTMpLKD2yumEtF/kwRzRVRJ4bN/vUgEuzMOPGIaULmW8iTUlVvkpfeE0sfNiXXwyKP0rLKCPUCvi1xKiHGe5nuwVshN8FFn4ywq2nw57q61ik3yA==
X-OriginatorOrg: silvaco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 802fec54-f9ae-4e27-e867-08d7d0d5cedc
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2020 16:01:41.6488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a05727a6-bf2e-49ca-8724-5589374698e1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dGMeT7mq6msUvW1IWF4dS6QATzSGulyDW4otNed/5h8P9fbv+ZoYwrnyZ1zdXFaIgj43l+VU8zFCCryMgSzEMeZ7E/rKlZMynuAHkj+F+kA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR16MB2813
X-Mailman-Approved-At: Fri, 27 Mar 2020 07:02:22 -0700
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

This driver currently supports I3C SDR transfers. I3C HDR-DDR
transfer support may be added in the future.

Signed-off-by: Conor Culhane <conor.culhane@silvaco.com>
---
 drivers/i3c/master/Kconfig          |    8 +
 drivers/i3c/master/Makefile         |    3 +-
 drivers/i3c/master/svc-i3c-master.c | 3801 +++++++++++++++++++++++++++
 3 files changed, 3811 insertions(+), 1 deletion(-)
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
index 7eea9e086144..e949dbd4f889 100644
--- a/drivers/i3c/master/Makefile
+++ b/drivers/i3c/master/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_CDNS_I3C_MASTER)		+= i3c-master-cdns.o
-obj-$(CONFIG_DW_I3C_MASTER)		+= dw-i3c-master.o
+obj-$(CONFIG_DW_I3C_MASTER)			+= dw-i3c-master.o
+obj-$(CONFIG_SVC_I3C_MASTER)		+= svc-i3c-master.o
diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
new file mode 100644
index 000000000000..5552a5aecbb1
--- /dev/null
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -0,0 +1,3801 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2020 Silvaco, Inc.
+ *
+ * Author: Conor Culhane <conor.culhane@silvaco.com>
+ */
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
+// Master Mode Registers
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
+
+// Slave Mode Registers
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
+
+// Master Mode Config (MCONFIG) Register Details
+#define I3C_MCONFIG_MSTENA_MASK 0x00000003
+#define I3C_MCONFIG_MSTENA_SHFT 0
+#define I3C_MCONFIG_MSTENA_DISABLE 0
+#define I3C_MCONFIG_MSTENA_ENABLE 1
+#define I3C_MCONFIG_MSTENA_CAPABLE 2
+
+#define I3C_MCONFIG_DISTO_MASK 0x00000008
+#define I3C_MCONFIG_DISTO_SHFT 3
+
+#define I3C_MCONFIG_HKEEP_MASK 0x00000030
+#define I3C_MCONFIG_HKEEP_SHFT 4
+#define I3C_MCONFIG_HKEEP_NONE 0
+#define I3C_MCONFIG_HKEEP_ON_CHIP 1
+#define I3C_MCONFIG_HKEEP_EXT_SDA 2
+#define I3C_MCONFIG_HKEEP_EXT_SDA_SCL 3
+
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
+
+// Master Mode Control (MCTRL) Register Details
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
+
+#define I3C_MCTRL_TYPE_MASK 0x00000030
+#define I3C_MCTRL_TYPE_SHFT 4
+#define I3C_MCTRL_TYPE_I3C (0)
+#define I3C_MCTRL_TYPE_I2C BIT(I3C_MCTRL_TYPE_SHFT)
+#define I3C_MCTRL_TYPE_HDR_DDR (2 << I3C_MCTRL_TYPE_SHFT)
+
+#define I3C_MCTRL_IBIRESP_MASK 0x000000C0
+#define I3C_MCTRL_IBIRESP_SHFT 6
+#define I3C_MCTRL_IBIRESP_ACK (0) // Use for AUTO IBI - uses IBI rules reg
+#define I3C_MCTRL_IBIRESP_ACK_NO_BYTE (0) // Use for manual IBI - force no byte
+#define I3C_MCTRL_IBIRESP_NACK BIT(I3C_MCTRL_IBIRESP_SHFT)
+#define I3C_MCTRL_IBIRESP_ACK_WITH_BYTE (2 << I3C_MCTRL_IBIRESP_SHFT)
+#define I3C_MCTRL_IBIRESP_MANUAL (3 << I3C_MCTRL_IBIRESP_SHFT)
+
+#define I3C_MCTRL_DIR_MASK 0x00000100
+#define I3C_MCTRL_DIR_SHFT 8
+#define I3C_MCTRL_DIR_WRITE (0)
+#define I3C_MCTRL_DIR_READ BIT(I3C_MCTRL_DIR_SHFT)
+
+#define I3C_MCTRL_ADDR_MASK 0x0000FE00
+#define I3C_MCTRL_ADDR_SHFT 9
+
+#define I3C_MCTRL_RDTERM_MASK 0x00FF0000
+#define I3C_MCTRL_RDTERM_SHFT 16
+
+// Master Mode Status (MSTATUS) Register Details
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
+
+// Master Mode Interrupt (MINTSET, MINTCLR, MINTMASKED) Register Details
+#define I3C_MINT_SLVSTART_MASK 0x00000100
+#define I3C_MINT_MCTRLDONE_MASK 0x00000200
+#define I3C_MINT_COMPLETE_MASK 0x00000400
+#define I3C_MINT_RXPEND_MASK 0x00000800
+#define I3C_MINT_TXNOTFULL_MASK 0x00001000
+#define I3C_MINT_IBIWON_MASK 0x00002000
+#define I3C_MINT_ERRWARN_MASK 0x00008000
+#define I3C_MINT_NOWMASTER_MASK 0x00080000
+
+// Master Mode Error/Warning (MERRWARN) Register Details
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
+
+// Master Mode Data Control (MDATACTRL) Register Details
+#define I3C_MDATACTRL_FLUSHTB_MASK 0x00000001
+#define I3C_MDATACTRL_FLUSHTB I3C_MDATACTRL_FLUSHTB_MASK
+#define I3C_MDATACTRL_FLUSHRB_MASK 0x00000002
+#define I3C_MDATACTRL_FLUSHRB I3C_MDATACTRL_FLUSHRB_MASK
+#define I3C_MDATACTRL_UNLOCK_MASK 0x00000008
+#define I3C_MDATACTRL_UNLOCK_TRIG I3C_MDATACTRL_UNLOCK_MASK
+#define I3C_MDATACTRL_TXTRIG_MASK 0x00000030
+#define I3C_MDATACTRL_TXTRIG_SHFT 4
+#define I3C_MDATACTRL_TXTRIG_FIFO_EMPTY (0)
+#define I3C_MDATACTRL_TXTRIG_FIFO_QTR_FULL BIT(I3C_MDATACTRL_TXTRIG_SHFT)
+#define I3C_MDATACTRL_TXTRIG_FIFO_HALF_FULL (2 << I3C_MDATACTRL_TXTRIG_SHFT)
+#define I3C_MDATACTRL_TXTRIG_FIFO_NOT_FULL (3 << I3C_MDATACTRL_TXTRIG_SHFT)
+#define I3C_MDATACTRL_RXTRIG_MASK 0x000000C0
+#define I3C_MDATACTRL_RXTRIG_SHFT 6
+#define I3C_MDATACTRL_RXTRIG_FIFO_NOT_EMPTY (0)
+#define I3C_MDATACTRL_RXTRIG_FIFO_QTR_FULL BIT(I3C_MDATACTRL_RXTRIG_SHFT)
+#define I3C_MDATACTRL_RXTRIG_FIFO_HALF_FULL (2 << I3C_MDATACTRL_RXTRIG_SHFT)
+#define I3C_MDATACTRL_RXTRIG_FIFO_3QTR_FULL (3 << I3C_MDATACTRL_RXTRIG_SHFT)
+
+#define I3C_MDATACTRL_TXCOUNT_MASK 0x001F0000
+#define I3C_MDATACTRL_TXCOUNT_SHFT 16
+#define I3C_MDATACTRL_RXCOUNT_MASK 0x1F000000
+#define I3C_MDATACTRL_RXCOUNT_SHFT 24
+#define I3C_MDATACTRL_TXFULL_MASK 0x40000000
+#define I3C_MDATACTRL_RXEMPTY_MASK 0x80000000
+
+// Master Mode Write SDR Message (MWMSG_SDR) Register Details
+#define I3C_MWMSG_SDR_DIR_MASK 0x00000001
+#define I3C_MWMSG_SDR_DIR_READ 1
+#define I3C_MWMSG_SDR_DIR_WRITE 0
+#define I3C_MWMSG_SDR_ADDR_MASK 0x000000FE
+#define I3C_MWMSG_SDR_ADDR_SHFT 1
+#define I3C_MWMSG_SDR_END_MASK 0x00000100
+#define I3C_MWMSG_SDR_END_SHFT 8
+#define I3C_MWMSG_SDR_END_STOP BIT(I3C_MWMSG_SDR_END_SHFT)
+#define I3C_MWMSG_SDR_MODE_MASK 0x00000400
+#define I3C_MWMSG_SDR_MODE_SHFT 10
+#define I3C_MWMSG_SDR_MODE_I2C BIT(I3C_MWMSG_SDR_MODE_SHFT)
+#define I3C_MWMSG_SDR_MODE_I3C (0 << I3C_MWMSG_SDR_MODE_SHFT)
+#define I3C_MWMSG_SDR_LEN_MASK 0x0000F800
+#define I3C_MWMSG_SDR_LEN_SHFT 11
+#define I3C_MWMSG_SDR_DATA_MASK 0x0000FFFF
+
+// Master Mode Read SDR Message (MRMSG_SDR) Register Details
+#define I3C_MRMSG_SDR_DATA_MASK 0x0000FFFF
+#define I3C_MRMSG_SDR_CLEN_MASK 0x003F0000
+#define I3C_MRMSG_SDR_CLEN_SHFT 16
+
+// Master Mode Write DDR Message (MWMSG_SDDR) Register Details
+#define I3C_MWMSG_DDR_CTRL_LEN_MASK 0x000003FF
+#define I3C_MWMSG_DDR_CTRL_END_MASK 0x00004000
+#define I3C_MWMSG_DDR_CTRL_END_SHFT 14
+#define I3C_MWMSG_DDR_CTRL_END_EXIT_HDR BIT(I3C_MWMSG_DDR_CTRL_END_SHFT)
+
+#define I3C_MWMSG_DDR_ADDRCMD_HDR_MODE_CMD_MASK 0x0000007F
+#define I3C_MWMSG_DDR_ADDRCMD_DIR_MASK 0x00000080
+#define I3C_MWMSG_DDR_ADDRCMD_DIR_SHFT 7
+#define I3C_MWMSG_DDR_ADDRCMD_DIR_READ BIT(I3C_MWMSG_DDR_ADDRCMD_DIR_SHFT)
+#define I3C_MWMSG_DDR_ADDRCMD_DIR_WRITE (0 << I3C_MWMSG_DDR_ADDRCMD_DIR_SHFT)
+#define I3C_MWMSG_DDR_ADDRCMD_ADDR_MASK 0x0000FE00
+#define I3C_MWMSG_DDR_ADDRCMD_ADDR_SHFT 9
+
+#define I3C_MWMSG_DDR_DATA_MASK 0x0000FFFF
+
+// Master Mode Read DDR Message (MWMSG_DDR) Register Details
+#define I3C_MRMSG_DDR_DATA_MASK 0x0000FFFF
+#define I3C_MRMSG_DDR_CLEN_MASK 0x03FF0000
+#define I3C_MRMSG_DDR_CLEN_SHFT 16
+
+// Slave Mode Config (CONFIG) Register Details
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
+
+// Slave Mode Interrupt (INTSET, INTCLR, INTMASKED) Register Details
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
+/*
+ * I3C Event handler function pointer
+ *
+ * \param   vp_driver    Pointer to driver control block
+ * \param   event       I3C event (\ref enum svc_i3c_event_e)
+ */
+typedef void (*fp_event_handler_t)(void *vp_driver, u32 event);
+
+/*
+ * Generic enable/disable definitions
+ *
+ * Use these definitions for driver enable/disable controls.
+ */
+enum svc_drv_ctrl_enable_e {
+	SVC_DRV_CTRL_DISABLE = 0, // Driver Control Enable
+	SVC_DRV_CTRL_ENABLE = 1 // Driver Control Disable
+
+};
+
+#define SVC_DRV_ERR_NONE (0)
+#define SVC_DRV_ERR_INVALID_PARAM (-EINVAL)
+#define SVC_DRV_ERR_NOT_SUPPORTED (-EPERM)
+#define SVC_DRV_ERR_NOT_IMPLEMENTED (-EPERM)
+#define SVC_DRV_ERR_I3C_TOO_MANY_DEV (-EPERM)
+#define SVC_DRV_ERR_I3C_BUSY (-EBUSY)
+#define SVC_DRV_ERR_I3C_XFER_ERR (-EIO)
+
+/* Maximum number of devices (slaves and secondary masters)
+ * on the I3C bus. Device table is statically assigned at
+ * compile time, so this directly affects memory usage.
+ * Note that this could be increased to 32 if required.
+ * Device available flags can hadle up to 32.
+ */
+#define I3C_MAX_DEVICES 16
+
+// Size of provisional ID reported by I3C slave devices
+#define I3C_PROV_ID_SIZE 8
+
+// Max value for the /ref I3C_CTRL_CFG_PPBAUD setting
+#define I3C_PPBAUD_MAX 15
+
+// Max value for the /ref I3C_CTRL_CFG_PPLOW setting
+#define I3C_PPLOW_MAX 15
+
+// Max value for the /ref I3C_CTRL_CFG_ODHPP setting
+#define I3C_ODBAUD_MAX 255
+
+// Max value for the /ref I3C_CTRL_CFG_SKEW setting
+#define I3C_SKEW_MAX 7
+
+// Max value for the /ref I3C_CTRL_CFG_I2CBAUD setting
+#define I3C_I2CBAUD_MAX 15
+
+/* Invalid address value.
+ * used for device table init and unused devices in the device table.
+ */
+#define I3C_INVALID_ADDR 0xFF
+
+// Maximum number of bytes read from an IBI
+#define IBI_DATA_MAX_SIZE 4
+
+/*
+ * I3C controls
+ *
+ * The following enumerated constants are used when reading/writing the I3C
+ * controls in the svcI3cControlSet() and svcI3cControlGet() API
+ * functions and are passed in the "control" parameter. The control argument
+ * specified is passed to the set/get functions in the "arg" parameter.
+ *
+ * \warning     The configuration controls do not change the settings
+ *              in the hardware until the I3C is enabled. It is
+ *              recommended that the I3C be disabled before modifying
+ *              any configuration values then enable the I3C to apply
+ *              the new configuration. Configuration controls are those
+ *              with "_CFG_" in the enum definition.
+ *
+ * For details regarding hardware specific settings, please see the I3C DRM
+ * User Guide.
+ */
+enum svc_i3c_ctrl_e {
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
+	I3C_CTRL_GET_NUM_BUS_DEVICES,
+	I3C_CTRL_GET_SLV_ATTRIB,
+	I3C_CTRL_GET_IBI_DEV_ADDR,
+	I3C_CTRL_GET_IBI_TYPE,
+	I3C_CTRL_GET_IBI_DATA,
+	I3C_CTRL_ISSUE_STOP,
+
+};
+
+/*
+ * I3C events
+ *
+ * I3C events passed to event handler callback routine.
+ *
+ * \warning     All events are interrupt based events. Callback is executing
+ *              in the context of the ISR.
+ *
+ */
+enum svc_i3c_event_e {
+	I3C_EVENT_NONE = 0,
+	I3C_EVENT_DAA_COMPLETE,
+	I3C_EVENT_RW_COMPLETE,
+	I3C_EVENT_RW_NACK,
+	I3C_EVENT_RW_ERR,
+	I3C_EVENT_RW_TIMEOUT,
+	I3C_EVENT_IBI_REQUEST,
+	I3C_EVENT_IBI_COMPLETE,
+
+};
+
+/*
+ * I3C Master Enable
+ *
+ * The following enumerated values are used to specify the I3C master
+ * enable when setting the configuration \ref I3C_CTRL_CFG_MASTER_ENABLE
+ * through the svcI3cControlSet() API function.
+ */
+enum svc_i3c_master_enable_e {
+	I3C_MASTER_DISABLE, // I3C Master disabled
+	I3C_MASTER_ENABLE, // I3C Master enabled
+	I3C_MASTER_CAPABLE // I3C Master capable
+
+};
+
+/*
+ * I3C High Keeper Implementation
+ *
+ * The following enumerated values are used to specify the I3C High
+ * Keeper configuration for the device when setting the configuration
+ * \ref I3C_CTRL_CFG_HIGH_KEEPER through the svcI3cControlSet() API
+ * function. The selected setting must match the hardware
+ * implementation.
+ */
+enum svc_i3c_high_keeper_e {
+	I3C_HIGH_KEEPER_NONE,
+	I3C_HIGH_KEEPER_ON_CHIP,
+	I3C_HIGH_KEEPER_EXTERN_SDA,
+	I3C_HIGH_KEEPER_EXTERN_SDA_SCL
+
+};
+
+/*
+ * I3C Stop Speed Selection
+ *
+ * The following enumerated values are used to specify the I3C Stop
+ * Speed configuration for the I3C master when setting the configuration
+ * \ref I3C_CTRL_CFG_STOP_SPEED through the svcI3cControlSet() API function.
+ */
+enum svc_i3c_stop_speed_e {
+	I3C_STOP_SPEED_PUSH_PULL,
+	I3C_STOP_SPEED_OPEN_DRAIN
+
+};
+
+/*
+ * I3C Master ODHPP Configuration Setting
+ *
+ * The following enumerated values are used to specify the SCL high period for
+ * I3C open-drain operation when setting the configuration
+ * \ref I3C_CTRL_CFG_ODHPP through the svcI3cControlSet() API function.
+ */
+enum svc_i3c_odhpp_e {
+	I3C_ODHPP_SCL_HIGH_EQ_SCL_LOW = 0,
+	I3C_ODHPP_SCL_HIGH_EQ_ONE_PPBAUD = 1
+
+};
+
+/*
+ * I3C Bus Device Address Type
+ *
+ * The following enumerated values are used to indicate if a slave device uses
+ * a statically or dynamically assigned address. Address type is stored in the
+ * device table \ref struct svc_i3c_slv_dev_s.
+ */
+enum svc_i3c_addr_type_e {
+	I3C_ADDRESS_TYPE_UNASSIGNED,
+	I3C_ADDRESS_TYPE_STATIC,
+	I3C_ADDRESS_TYPE_DYNAMIC
+
+};
+
+/*
+ * I3C transfer types
+ *
+ */
+enum svc_i3c_xfer_type_e {
+	I3C_XFER_TYPE_I2C_READ = 0,
+	I3C_XFER_TYPE_I2C_WRITE = 1,
+	I3C_XFER_TYPE_I3C_READ = 2,
+	I3C_XFER_TYPE_I3C_WRITE = 3,
+	I3C_XFER_TYPE_I3C_READ_DDR = 4,
+	I3C_XFER_TYPE_I3C_WRITE_DDR = 5,
+	I3C_XFER_TYPE_I3C_BCCC_WRITE = 6,
+	I3C_XFER_TYPE_I3C_DCCC_READ = 7,
+	I3C_XFER_TYPE_I3C_DCCC_WRITE = 8,
+	I3C_XFER_TYPE_MAX = 9 // range checking
+
+};
+
+/*
+ * I3C Bus/Transfer States
+ *
+ * The states of the software state machine that manages the I3C bus.
+ */
+enum svc_i3c_state_e {
+	I3C_STATE_IDLE = 0,
+	I3C_STATE_XFER_ACTIVE,
+	I3C_STATE_DAA,
+	I3C_STATE_AUTO_IBI,
+	I3C_STATE_IBI_REQ,
+	I3C_STATE_IBI_RESP
+
+};
+
+/*
+ * Common Command Codes
+ *
+ * Enumerates the Common Command Codes (CCC) defined in the MIPI
+ * I3C Specification. Broadcast CCC's are sent to all devices on
+ * the bus using the broadcast address while Direct CCC's are sent
+ * to specific devices using the dynamic/static device address.
+ */
+enum svc_i3c_ccc_e {
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
+};
+
+/*
+ * IBI Types
+ *
+ * The IBI type is determined when an IBI is received from a slave
+ * device and is available via svcI3cControlGet() with control
+ * parameter I3C_CTRL_GET_IBI_TYPE.
+ */
+enum svc_i3c_ibi_type_e {
+	I3C_IBI_TYPE_NONE = 0, // No IBI
+	I3C_IBI_TYPE_NORMAL = 1, // Normal IBI: Implementation Specific
+	I3C_IBI_TYPE_MASTER_REQ = 2, // Master Request IBI
+	I3C_IBI_TYPE_HOT_JOIN_REQ = 3, // Hot Join Request IBI
+};
+
+/*
+ * Vendor specified I3C slave device ID
+ */
+struct __attribute__((__packed__)) svc_i3c_vendor_slv_id_s {
+	u16 part; // Part ID
+	u8 instance; // Instance ID
+	u16 extra; // Extra, vendor specified field
+};
+
+/*
+ * I3C Slave Device Id
+ *
+ */
+struct svc_i3c_slv_id_s {
+	u16 manuf_id; // Manufacturer ID
+	u8 rand_id_flag; // Random(1) or Vendor Fixed(0) ID
+
+	union {
+		u32 rand_id; // if randomId == 1
+		struct __attribute__((__packed__))
+		svc_i3c_vendor_slv_id_s vend_id; // if randomId == 0
+	};
+};
+
+/*
+ * Bus Characteristics Register Masks
+ */
+#define I3C_BCR_SPEED_LIMIT_MASK 0x01 // BCR Speed limit bit mask
+#define I3C_BCR_IBI_REQ_CAPABLE_MASK 0x02 // BCR IBI capable bit mask
+#define I3C_BCR_IBI_PAYLOAD_MASK 0x04 // BCR IBI payload bit mask
+#define I3C_BCR_OFFLINE_CAPABLE_MASK 0x08 // BCR Offline capable bit mask
+#define I3C_BCR_BRIDGE_DEVICE_MASK 0x10 // BCR Bridge device bit mask
+#define I3C_BCR_HDR_CAPABLE_MASK 0x20 // BCR HDR capable bit mask
+#define I3C_BCR_DEVICE_ROLE_MASK 0xC0 // BCR Device role bit mask
+#define I3C_BCR_DEVICE_ROLE_MASTER 0x40 // BCR Device role master
+
+/*
+ * Bus Characteristics Register
+ *
+ * Set of flags describing the slave device's role and capabilities for use
+ * in Dynamic Address assignment and Common Command Codes.
+ */
+struct svc_i3c_slv_bcr_s {
+	u32 speed_limit : 1; // Device is Speed Limited
+	u32 ibi_req_capable : 1; // IBI Request Capable
+	u32 ibi_payload : 1; // IBI Payload Supported
+	u32 offline_capable : 1; // Device is Capable of Going Offline
+	u32 bridge_device : 1; // Device is a Bridge Device
+	u32 hdr_capable : 1; // Device is HDR Capable
+	u32 device_role_master : 1; // Device is a Master
+};
+
+/*
+ * I3C slave device attributes
+ *
+ * This structure is used to retrieve the attributes of a slave device
+ * on the I3C bus using the svcI3cControlGet() function with control
+ * parameter \ref I3C_CTRL_GET_SLV_ATTRIB.
+ */
+struct svc_i3c_slv_attrib_s {
+	u8 dev_idx; // Index into device table
+	u8 addr; // Bus address
+	enum svc_i3c_addr_type_e addr_type; // addr type: dynamic or static
+	struct svc_i3c_slv_id_s dev_id; // Device ID (from provisional ID)
+	struct svc_i3c_slv_bcr_s bcr; // Bus Characteristics Register
+	u8 dcr; // Device Characteristics Register
+};
+
+/*
+ * I3C slave device
+ *
+ * This structure maintains information regarding slave devices connected to
+ * the I3C bus.
+ */
+struct svc_i3c_slv_dev_s {
+	u8 addr; // Bus address
+	enum svc_i3c_addr_type_e addr_type; // addr type: dynamic or static
+	u8 prov_id[I3C_PROV_ID_SIZE]; // Provisional device ID (raw)
+};
+
+/*
+ * I3C transfer control structure
+ *
+ * This structure maintains information about I3C bus transfers. The transfer
+ * structure is populated by the application and passed to the read or write
+ * functions. Multiple messages may be passed to the read/write function by
+ * passing a pointer to an array of transfer structures and a count.
+ */
+struct svc_i3c_xfer_s {
+	u8 dev_id; // Device ID - index into device table
+	enum svc_i3c_xfer_type_e
+		type; // Transfer type (I2C/I3C/I3C-DDR Read/Write)
+	u8 ccc; // Common command code, if type is BCCC or DCCC
+	u16 hdr_ddr_cmd; // HDR-DDR mode command, if type is read/write I3C-DDR
+	u8 *p_data; // Buffer to read into (from bus) or write from (to bus)
+	u8 count; // num data bytes to r/w to/from pData.
+	u8 remaining; // Number of data bytes remaining to be r/w on bus
+
+	u8 stop; // Set to terminate transfer with a stop condition
+	u8 allow_ibi; // Set to 1 to allow IBI from slave devices
+
+	// Completion
+	struct completion comp;
+};
+
+/*
+ * I3C IBI control/data structure
+ *
+ * Maintains information regarding an IBI for a specific slave device.
+ */
+struct svc_i3c_ibi_s {
+	u8 ibi_data[IBI_DATA_MAX_SIZE]; // Data buffer for IBI data
+	u8 ibi_idx; // IBI data buffer index
+	u8 ibi_dev_addr; // Slave device address from which and IBI was received
+	u8 ibi_type; // IBI type received from slave device
+};
+
+/*
+ * I3C device control block.
+ *
+ * Maintains the I3C configuration for the Silvaco I3C Dual Role Master.
+ * Contains hardware specific configurations.
+ */
+struct svc_i3c_dev_s {
+	// Configuration Data:
+	enum svc_i3c_master_enable_e master_ena; // Master mode enable
+	enum svc_drv_ctrl_enable_e timeout_err_ena; // Timeout error enable
+	enum svc_i3c_high_keeper_e high_keeper; // High keeper implementation
+	enum svc_i3c_stop_speed_e stop_speed; // Stop speed selection
+	u8 pp_baud; // SCL frequency for push-pull drive
+	u8 pp_low; // SCL low period extend for push-pull drive
+	u8 od_baud; // SCL frequency for open-drain operation
+	enum svc_i3c_odhpp_e od_hpp; // SCL high period for open-drain operation
+	u8 skew; // SDA skew/delay
+	u8 i2c_baud; // SCL frequency for I2C mode
+
+	// I3C Device Table:
+	struct svc_i3c_slv_dev_s devices[I3C_MAX_DEVICES]; // I3C Device Table
+	u32 dev_available_flags; // dev table entry 1:empty or 0: occupied empty
+	u8 num_devices; // Number of slave devices in the device table
+
+	int daa_dev_idx; // Device index for next DAA assignment
+	u8 *p_daa_data; // Pointer to data bufffer for DAA info (provisional ID)
+
+	enum svc_i3c_state_e state; // State of the I3C bus
+	struct svc_i3c_xfer_s *p_xfer; // The current transfer
+
+	u8 ibi_data[IBI_DATA_MAX_SIZE]; // Data buffer for IBI data
+	u8 ibi_idx; // IBI data buffer index
+	u8 ibi_dev_addr; // Slave device addr from which and IBI was received
+	u8 ibi_type; // IBI type received from slave device
+};
+
+/*
+ * I3C Master Driver Control Block
+ *
+ * Specific to Linux only, this is the control block for the Silvco I3C
+ * Dual-Role master driver. Provides an abstraction above the hardware
+ * specific device control block.
+ */
+struct svc_i3c_master {
+	struct i3c_master_controller base; // I3C master controller
+	spinlock_t access_lock; /* Device access_lock */
+
+	// IBI Control Block:
+	struct {
+		unsigned int num_ibi_devices;
+		struct i3c_dev_desc **dev_desc;
+		spinlock_t lock; /* spinlock */
+	} ibi;
+
+	void __iomem *regs; // Base address for the I3C DRM register map
+
+	struct clk *pclk; // Main/system clock clock
+	struct clk *fclk_i3c; // I3C peripheral clock
+	struct clk *clk_slow_12_5; // Fixed 12.5 MHz clock
+
+	u32 i3c_pp_clk_div;
+	u32 i3c_od_clk_div;
+	u32 i2c_clk_div;
+
+	fp_event_handler_t event_handler; // func ptr to handler callback
+
+	struct svc_i3c_dev_s *p_dev; // Pointer to HAL device control block
+
+	struct completion daa_complete; // completion for daa process.
+};
+
+/*
+ * I3C Interrupt Service Routine
+ */
+static void svc_i3c_master_isr(void *arg);
+
+static void svc_i3c_interrupt_enable(void *vp_driver, u32 mask);
+static u32 svc_i3c_interrupt_disable(void *vp_driver);
+
+/*
+ * I3C Initialization Routine
+
+ * This function initializes the I3C driver and device structures to default
+ * configuration settings.
+ *
+ * The following default settings are applied to the I3C DRM master config
+ * register. Please refer to the I3C DRM User Guide for detailed information
+ * regarding these settings.
+ * - I3C Master Enabled (\ref I3C_CTRL_CFG_MASTER_ENABLE)
+ * - Timeout Error Enabled (\ref I3C_CTRL_CFG_TIMEOUT_ERR_ENABLE )
+ * - No High Keeper Support (\ref I3C_CTRL_CFG_HIGH_KEEPER )
+ * - Stop Speed is Push-Pull Speed (\ref I3C_CTRL_CFG_STOP_SPEED )
+ * - PPBAUD = 0 (\ref I3C_CTRL_CFG_PPBAUD )
+ * - PPLOW  = 0 (\ref I3C_CTRL_CFG_PPLOW )
+ * - ODBAUD = 0 (\ref I3C_CTRL_CFG_ODBAUD )
+ * - ODHPP  = I3C_ODHPP_SCL_HIGH_EQ_SCL_LOW (\ref I3C_CTRL_CFG_ODHPP )
+ * - SKEW   = 0 (\ref I3C_CTRL_CFG_SKEW )
+ * - I2CBAUD = 0 (\ref I3C_CTRL_CFG_I2CBAUD )
+ *
+ * \param   vp_driver    Pointer to driver control block
+ * \param   p_dev        Pointer to I3C device control block
+ * \param   base_address     I3C DRM base address (ignored by driver)
+ * \param   irq_bitmask      I3C DRM IRQ bitmask/vector (ignored by driver)
+
+ * \return  Error code in \ref svc_drv_error_t.
+ */
+static s32 svc_i3c_initialize(void *vp_driver, struct svc_i3c_dev_s *p_dev,
+			      u32 base_address, u32 irq_bitmask);
+
+/*
+ * I3C Event Handler Registration Routine
+
+ * This function allows the application to register a I3C event handler
+ * callback function. The callback is used to notify the application of
+ * events specified in \ref enum svc_i3c_event_e.
+ *
+ * \param   vp_driver  Pointer to driver control block
+ * \param   handler   Function pointer for event handler (\ref fpEventHandler_t)
+ *
+ * \warning     When an interrupt is reported to the application, the callback
+ * is executing in the ISR context.
+
+ * \return  Error code in \ref svc_drv_error_t.
+ */
+static s32 svc_i3c_register_event_handler(void *vp_driver,
+					  fp_event_handler_t handler);
+
+/*
+ * I3C Add Static Device
+ *
+ * This function adds a slave device with a static address to the I3C device
+ * table maintained by the I3C master driver.
+ *
+ * \param   vp_driver    Pointer to driver control block
+ * \param   addr        Static address for the slave device
+ *
+ * \return  Returns the index of the device assigned in the device table,
+ *          SVC_DRV_ERR_I3C_TOO_MANY_DEV if there are no more available slots in
+ *          the device table, or SVC_DRV_ERR_INVALID_PARAM.
+ */
+static int svc_i3c_add_static_device(void *vp_driver, u8 addr);
+
+/*
+ * I3C Set Device Address
+ *
+ * This function sets a slave device address in the I3C device table. This
+ * can be used to "pre-set" addresses based on address allocation from an
+ * application or higher level driver. When DAA occurs or individual address
+ * assignment occurs on the bus, this address will be assigned to the device
+ * slotted in the specified device index in the device table.
+ *
+ * \param   vp_driver    Pointer to driver control block
+ * \param   dev_idx      Index into the device table
+ * \param   addr        Address for the slave device
+ *
+ * \return  Returns SVC_DRV_ERR_NONE if successful, SVC_DRV_ERR_I3C_BUSY
+ *          if the device table entry is already in use,
+ * or SVC_DRV_ERR_INVALID_PARAM.
+ */
+static int svc_i3c_set_device_address(void *vp_driver, u8 dev_idx, u8 addr);
+
+/*
+ * I3C Get Device Index
+ *
+ * This function returns the device index associated with a device address.
+ * This is the index into the device table for the device that has been assigned
+ * the specified address. If no device is found with the address, the value
+ * \ref I3C_INVALID_ADDR is returned.
+ *
+ * \param   vp_driver    Pointer to driver control block
+ * \param   addr        Address for the slave device
+ *
+ * \return  Returns the device index if successful
+ * or I3C_INVALID_ADDR upon failure
+ */
+static u8 svc_i3c_get_device_index_from_address(void *vp_driver, u8 addr);
+
+/*
+ * Read data from the I3C DRM driver.
+ *
+ * Reads data from the I3C bus by issuing a read transfer to the bus. The pData
+ * parameter points to a transfer structure that includes the slave address,
+ * number of bytes to read, pointer to data buffer to receive the data and other
+ * transfer parameters. See \ref struct svc_i3c_xfer_s for details.
+ *
+ * This function DOES NOT BLOCK waiting for data to be returned. The transfer is
+ * initiated on the bus and data is returned via the receive interrupt. Upon
+ * transfer completion, the event I3C_EVENT_RW_COMPLETE is issued if successful
+ * or an error event will be issued otherwise.
+ * See \ref enum svc_i3c_event_e for details.
+ *
+ * Note: It is the responsibility of the caller to poll or wait for
+ * the appropriate event to indicate the transfer has completed.
+ *
+ * \param   vp_driver    Pointer to driver control block
+ * \param   p_data       Pointer to xfer structure \ref struct svc_i3c_xfer_s
+ *
+ * \return  Error code in \ref svc_drv_error_t.
+ */
+static s32 svc_i3c_read(void *vp_driver, void *p_data);
+
+/*
+ * Writes data to the I3C DRM driver.
+ *
+ * Writes data to the I3C bus by issuing a write transfer to the bus. The pData
+ * parameter points to a transfer structure that includes the slave address,
+ * number of bytes to write, pointer to data buffer containing the data and
+ * other transfer parameters. See \ref struct svc_i3c_xfer_s for details.
+ *
+ * This function DOES NOT BLOCK waiting for the transfer to complete.
+ * The transfer is initiated on the bus and data is written to the FIFO
+ * from this function and, if necessary, from the transmit FIFO empty
+ * interrupt, if the data size is larger than the transmit FIFO.
+ * Upon transfer completion, the event I3C_EVENT_RW_COMPLETE is issued if
+ * successful or an error event will be issued otherwise.
+ * See \ref enum svc_i3c_event_e for details.
+ *
+ * Note: It is the responsibility of the caller to poll or wait
+ * for the appropriate event to indicate the transfer has completed.
+ *
+ * \param   vp_driver    Pointer to driver control block
+ * \param   p_data       Pointer to xfer structure \ref struct svc_i3c_xfer_s
+ *
+ * \return  Error code in \ref svc_drv_error_t.
+ */
+static s32 svc_i3c_write(void *vp_driver, void *p_data);
+
+/*
+ * Aborts an I3C Transfer
+ *
+ * This function will abort a currently active I3C read or write transfer
+ * initiated with either the \ref svcI3cRead or \ref svcI3cWrite function.
+ *
+ * \param   vp_driver    Pointer to driver control block
+ * \param   p_xfer       Pointer to xfer structure \ref struct svc_i3c_xfer_s
+ *
+ * \return  Returns SVC_DRV_ERR_NONE on success, SVC_DRV_ERR_I3C_XFER_ERR
+ *          upon error.
+ */
+static s32 svc_i3c_abort(void *vp_driver, struct svc_i3c_xfer_s *p_xfer);
+
+/*
+ * I3C DRM Control Write Routine
+ *
+ * This function sets various I3C configuration and control values.
+ *
+ * \param   vp_driver    Pointer to driver control block
+ * \param   control     Control value (\ref enum svc_i3c_ctrl_e) \n
+ *                      Valid write controls:
+ *                      - \ref I3C_CTRL_CFG_MASTER_ENABLE
+ *                      - \ref I3C_CTRL_CFG_TIMEOUT_ERR_ENABLE
+ *                      - \ref I3C_CTRL_CFG_HIGH_KEEPER
+ *                      - \ref I3C_CTRL_CFG_STOP_SPEED
+ *                      - \ref I3C_CTRL_CFG_PPBAUD
+ *                      - \ref I3C_CTRL_CFG_PPLOW
+ *                      - \ref I3C_CTRL_CFG_ODBAUD
+ *                      - \ref I3C_CTRL_CFG_ODHPP
+ *                      - \ref I3C_CTRL_CFG_SKEW
+ *                      - \ref I3C_CTRL_CFG_I2CBAUD
+ *                      - \ref I3C_CTRL_ENABLE
+ *                      - \ref I3C_CTRL_DISABLE
+ *                      - \ref I3C_CTRL_ENTER_DAA
+ *                      - \ref I3C_CTRL_START_IBI
+ *                      - \ref I3C_CTRL_ISSUE_STOP
+ *
+ * \param   arg         Argument for controls that require an input value. See
+ *                      details in \ref enum svc_i3c_ctrl_e
+ *
+ * \return  Error code in \ref svc_drv_error_t.
+ *
+ * Input arguments are validated before setting the configuration
+ * value. If an argument for a control is out of range, this function
+ * takes no action and returns the error \ref SVC_DRV_ERR_INVALID_PARAM.
+ */
+static s32 svc_i3c_control_set(void *vp_driver, u32 control, u32 arg);
+
+/*
+ * I3C DRM Control Read Routine
+ * This function reads various I3C configuration and control values.
+ * \param   vp_driver    Pointer to driver control block
+ * \param   control     Control value (\ref enum svc_i3c_ctrl_e) \n
+ *                      Valid read controls:
+ *                      - \ref I3C_CTRL_GET_VERSION
+ *                      - \ref I3C_CTRL_CFG_MASTER_ENABLE
+ *                      - \ref I3C_CTRL_CFG_TIMEOUT_ERR_ENABLE
+ *                      - \ref I3C_CTRL_CFG_HIGH_KEEPER
+ *                      - \ref I3C_CTRL_CFG_STOP_SPEED
+ *                      - \ref I3C_CTRL_CFG_PPBAUD
+ *                      - \ref I3C_CTRL_CFG_PPLOW
+ *                      - \ref I3C_CTRL_CFG_ODBAUD
+ *                      - \ref I3C_CTRL_CFG_ODHPP
+ *                      - \ref I3C_CTRL_CFG_SKEW
+ *                      - \ref I3C_CTRL_CFG_I2CBAUD
+ *                      - \ref I3C_CTRL_GET_DEV_AVAIL_FLAGS
+ *                      - \ref I3C_CTRL_GET_NUM_BUS_DEVICES
+ *                      - \ref I3C_CTRL_GET_SLV_ATTRIB
+ *
+ * \param   arg         Pointer to location to return the control value. See
+ *                      details in \ref enum svc_i3c_ctrl_e. If NULL, function
+ *                      will return \ref SVC_DRV_ERR_INVALID_PARAM.
+ *
+ * \return  Error code in \ref svc_drv_error_t.
+ */
+static s32 svc_i3c_control_get(void *vp_driver, u32 control, void *arg);
+
+// Disable I3C Peripheral:
+static void i3c_disable(void *p_driver)
+{
+	struct svc_i3c_master *p_drv = (struct svc_i3c_master *)p_driver;
+
+	// Disable all interrupts
+	iowrite32(0xFFFFFFFF, p_drv->regs + I3C_MINTCLR_OFFSET);
+
+	// Disable slave
+	iowrite32(0, p_drv->regs + I3C_CONFIG_OFFSET);
+
+	// Disable master
+	iowrite32(0, p_drv->regs + I3C_MCONFIG_OFFSET);
+}
+
+// Enable I3C Peripheral:
+static void i3c_enable(void *p_driver)
+{
+	struct svc_i3c_dev_s *p_dev;
+	u32 reg = 0;
+	u32 mstatus;
+	u32 mask;
+
+	if (p_driver) {
+		struct svc_i3c_master *p_drv =
+			(struct svc_i3c_master *)p_driver;
+
+		if (p_drv->p_dev) {
+			p_dev = p_drv->p_dev;
+
+			switch (p_dev->master_ena) {
+			case I3C_MASTER_ENABLE:
+				// Disable slave, allow DDR mode
+				iowrite32(I3C_CONFIG_DDROK_MASK,
+					  p_drv->regs + I3C_CONFIG_OFFSET);
+
+				// Set up master config register
+				reg = I3C_MCONFIG_MSTENA_ENABLE;
+
+				// Timeout Error Enable/Disable
+				if (p_dev->timeout_err_ena ==
+				    SVC_DRV_CTRL_DISABLE) {
+					reg |= I3C_MCONFIG_DISTO_MASK;
+				}
+
+				// High Keeper Setting
+				switch (p_dev->high_keeper) {
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
+				// Stop Speed Setting
+				if (p_dev->stop_speed ==
+				    I3C_STOP_SPEED_OPEN_DRAIN) {
+					reg |= I3C_MCONFIG_ODSTOP_MASK;
+				}
+
+				// Set clocking parameters
+				reg |= ((p_dev->pp_baud
+					 << I3C_MCONFIG_PPBAUD_SHFT) |
+					(p_dev->pp_low
+					 << I3C_MCONFIG_PPLOW_SHFT) |
+					(p_dev->od_baud
+					 << I3C_MCONFIG_ODBAUD_SHFT) |
+					(p_dev->od_hpp
+					 << I3C_MCONFIG_ODHPP_SHFT) |
+					(p_dev->skew << I3C_MCONFIG_SKEW_SHFT) |
+					(p_dev->i2c_baud
+					 << I3C_MCONFIG_I2CBAUD_SHFT));
+
+				iowrite32(reg,
+					  p_drv->regs + I3C_MCONFIG_OFFSET);
+
+				// read current status
+				mstatus = ioread32(p_drv->regs +
+						   I3C_MSTATUS_OFFSET);
+
+				if (mstatus & I3C_MSTATUS_ERRWARN_MASK) {
+					u32 err_warn;
+
+					// Read the errors/warnings
+					err_warn =
+						ioread32(p_drv->regs +
+							 I3C_MERRWARN_OFFSET);
+
+					// Clear the errors/warnings
+					iowrite32(err_warn,
+						  p_drv->regs +
+							  I3C_MERRWARN_OFFSET);
+				}
+
+				// Set RX and TX tigger levels, Flush FIFOs
+				reg = I3C_MDATACTRL_UNLOCK_TRIG |
+				      I3C_MDATACTRL_RXTRIG_FIFO_NOT_EMPTY |
+				      I3C_MDATACTRL_TXTRIG_FIFO_NOT_FULL |
+				      I3C_MDATACTRL_FLUSHRB |
+				      I3C_MDATACTRL_FLUSHTB;
+
+				iowrite32(reg,
+					  p_drv->regs + I3C_MDATACTRL_OFFSET);
+
+				// Enable appropriate interrupts
+				mask = /* I3C_MINT_TXNOTFULL_MASK | */
+					I3C_MINT_RXPEND_MASK |
+					I3C_MINT_SLVSTART_MASK |
+					I3C_MINT_MCTRLDONE_MASK |
+					I3C_MINT_COMPLETE_MASK |
+					I3C_MINT_IBIWON_MASK |
+					I3C_MINT_ERRWARN_MASK;
+				svc_i3c_interrupt_enable((void *)p_drv, mask);
+
+				break;
+
+			case I3C_MASTER_CAPABLE:
+				// Not yet supported
+				break;
+			case I3C_MASTER_DISABLE:
+				// Not yet supported
+				break;
+			default:
+				break;
+			}
+		}
+	}
+}
+
+static int i3c_get_next_available_dev_idx(struct svc_i3c_dev_s *p_dev)
+{
+	int i;
+
+	for (i = 0; i < I3C_MAX_DEVICES; i++) {
+		if (p_dev->dev_available_flags & (0x00000001 << i))
+			return i;
+	}
+
+	return -1;
+}
+
+// Start Dynamic Address Assignment process
+static s32 i3c_enter_dynamic_address_assignment(void *vp_driver)
+{
+	s32 status = SVC_DRV_ERR_I3C_BUSY;
+
+	struct svc_i3c_master *p_drv = (struct svc_i3c_master *)vp_driver;
+	struct svc_i3c_dev_s *p_dev = (struct svc_i3c_dev_s *)(p_drv->p_dev);
+	int dev_idx;
+
+	// Verify no transfers in progress
+	if (p_dev->state == I3C_STATE_IDLE) {
+		// Point to provisional ID for next available device in table
+		dev_idx = i3c_get_next_available_dev_idx(p_dev);
+		if (dev_idx >= 0) {
+			/* Verify that the device address is initialized.
+			 * This should have been initialized by the higher
+			 * layer drivers.
+			 */
+			if (p_dev->devices[dev_idx].addr != I3C_INVALID_ADDR) {
+				p_dev->state = I3C_STATE_DAA;
+
+				// Save the device index
+				p_dev->daa_dev_idx = dev_idx;
+
+				/* Point to device's provisional ID
+				 * to receive the ID during DAA
+				 */
+				p_dev->p_daa_data =
+					p_dev->devices[dev_idx].prov_id;
+
+				// Issue Process DAA request
+				iowrite32(I3C_MCTRL_REQUEST_PROC_DAA |
+						  I3C_MCTRL_IBIRESP_MANUAL,
+					  p_drv->regs + I3C_MCTRL_OFFSET);
+
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
+// Complete Dynamic Address Assignment process
+static s32 i3c_exit_dynamic_address_assignment(void *vp_driver)
+{
+	struct svc_i3c_master *p_drv = (struct svc_i3c_master *)vp_driver;
+	struct svc_i3c_dev_s *p_dev = (struct svc_i3c_dev_s *)(p_drv->p_dev);
+
+	p_dev->state = I3C_STATE_IDLE;
+
+	p_dev->daa_dev_idx = -1;
+	p_dev->p_daa_data = NULL;
+
+	if (p_drv->event_handler) {
+		// Signal an event to application that DAA is complete
+		p_drv->event_handler((void *)p_drv, I3C_EVENT_DAA_COMPLETE);
+	}
+
+	return SVC_DRV_ERR_NONE;
+}
+
+// Read device attributes from the device table
+static s32 i3c_get_device_attributes(void *vp_driver,
+				     struct svc_i3c_slv_attrib_s *p_attrib)
+{
+	s32 status = SVC_DRV_ERR_NONE;
+
+	struct svc_i3c_master *p_drv = (struct svc_i3c_master *)vp_driver;
+	struct svc_i3c_dev_s *p_dev = (struct svc_i3c_dev_s *)(p_drv->p_dev);
+	struct svc_i3c_slv_dev_s *p_slv_dev;
+	u16 tmp_id;
+
+	if (p_attrib->dev_idx < I3C_MAX_DEVICES) {
+		p_slv_dev = &p_dev->devices[p_attrib->dev_idx];
+
+		// Populate attribute structure with data from the device table
+		p_attrib->addr = p_slv_dev->addr;
+		p_attrib->addr_type = p_slv_dev->addr_type;
+
+		// Process the device ID/capabilities buffer
+		// 48-bit provisional ID is sent MSb first and is
+		// stored with first byte received in byte zero
+		// of the provisional ID array
+		// [47:33] MIPI Manufacturer ID
+		// [32]    ID type selector (1=random, 0=vendor fixed)
+		// [31:0]  Random ID
+		// -or-
+		// [31:16] Part ID (Vendor Fixed ID only)
+		// [15:12] Instance ID (Vendor Fixed ID only)
+		// [11:0]  Vendor specific information
+
+		tmp_id = ((u16)p_slv_dev->prov_id[0] << 8) |
+			 (u16)p_slv_dev->prov_id[1];
+		p_attrib->dev_id.rand_id_flag = tmp_id & 0x0001;
+		p_attrib->dev_id.manuf_id = tmp_id >> 1;
+		if (tmp_id & 0x0001) {
+			// Check for random ID
+			p_attrib->dev_id.rand_id =
+				((u32)p_slv_dev->prov_id[2] << 24) |
+				((u32)p_slv_dev->prov_id[3] << 16) |
+				((u32)p_slv_dev->prov_id[4] << 8) |
+				(u32)p_slv_dev->prov_id[5];
+		} else {
+			p_attrib->dev_id.vend_id.part =
+				((u16)p_slv_dev->prov_id[2] << 8) |
+				(u16)p_slv_dev->prov_id[3];
+			p_attrib->dev_id.vend_id.instance =
+				p_slv_dev->prov_id[4] >> 4;
+			p_attrib->dev_id.vend_id.extra =
+				(((u16)p_slv_dev->prov_id[4] << 8) & 0x0f00) |
+				(u16)p_slv_dev->prov_id[5];
+		}
+
+		p_attrib->bcr.speed_limit =
+			(p_slv_dev->prov_id[6] & I3C_BCR_SPEED_LIMIT_MASK) ? 1 :
+									     0;
+		p_attrib->bcr.ibi_req_capable =
+			(p_slv_dev->prov_id[6] & I3C_BCR_IBI_REQ_CAPABLE_MASK) ?
+				1 :
+				0;
+		p_attrib->bcr.ibi_payload =
+			(p_slv_dev->prov_id[6] & I3C_BCR_IBI_PAYLOAD_MASK) ? 1 :
+									     0;
+		p_attrib->bcr.offline_capable =
+			(p_slv_dev->prov_id[6] & I3C_BCR_OFFLINE_CAPABLE_MASK) ?
+				1 :
+				0;
+		p_attrib->bcr.bridge_device =
+			(p_slv_dev->prov_id[6] & I3C_BCR_BRIDGE_DEVICE_MASK) ?
+				1 :
+				0;
+		p_attrib->bcr.hdr_capable =
+			(p_slv_dev->prov_id[6] & I3C_BCR_HDR_CAPABLE_MASK) ? 1 :
+									     0;
+		p_attrib->bcr.device_role_master =
+			(p_slv_dev->prov_id[6] & I3C_BCR_DEVICE_ROLE_MASTER) ?
+				1 :
+				0;
+
+		p_attrib->dcr = p_slv_dev->prov_id[7];
+	} else {
+		status = SVC_DRV_ERR_INVALID_PARAM;
+	}
+
+	return status;
+}
+
+static s32 i3c_write_ctrl_mode(void *vp_driver, void *p_data)
+{
+	s32 status = SVC_DRV_ERR_I3C_XFER_ERR;
+	struct svc_i3c_master *p_drv = (struct svc_i3c_master *)vp_driver;
+	u32 reg = 0;
+	u32 mstatus_reg = 0;
+	u8 addr = 0;
+	u8 buf_idx = 0;
+
+	struct svc_i3c_dev_s *p_dev;
+	struct svc_i3c_xfer_s *p_xfer;
+
+	if (p_drv && p_data) {
+		p_dev = p_drv->p_dev;
+
+		if (p_dev->state == I3C_STATE_IDLE) {
+			p_dev->state = I3C_STATE_XFER_ACTIVE;
+
+			p_xfer = (struct svc_i3c_xfer_s *)p_data;
+
+			// Flush the transmit FIFO
+			reg = I3C_MDATACTRL_FLUSHTB;
+			iowrite32(reg, p_drv->regs + I3C_MDATACTRL_OFFSET);
+
+			// Copy current transfer to the device structure
+			p_dev->p_xfer = p_xfer;
+
+			// Index to start of data buffer
+			buf_idx = 0;
+			p_xfer->remaining = p_xfer->count;
+
+			// Write the HDR-DDR command to the fifo if HDR-DDR
+			if (p_xfer->type == I3C_XFER_TYPE_I3C_WRITE_DDR) {
+				if (p_xfer->count > 0) {
+					iowrite32((u32)(p_xfer->hdr_ddr_cmd &
+							0x000000FF),
+						  p_drv->regs +
+							  I3C_MWDATAB_OFFSET);
+				} else {
+					iowrite32((u32)(p_xfer->hdr_ddr_cmd &
+							0x000000FF),
+						  p_drv->regs +
+							  I3C_MWDATABE_OFFSET);
+				}
+			}
+
+			// Fill Tx FIFO
+			while (p_xfer->remaining > 0) {
+				mstatus_reg = ioread32(p_drv->regs +
+						       I3C_MSTATUS_OFFSET);
+
+				if (mstatus_reg & I3C_MSTATUS_TXNOTFULL_MASK) {
+					if (p_xfer->remaining > 1) {
+						/* Write all but the last byte
+						 * to MWDATAB register
+						 */
+						iowrite32((u32)(p_xfer->p_data
+							 [buf_idx++]
+							 & 0x000000FF),
+							 p_drv->regs +
+							 I3C_MWDATAB_OFFSET);
+					} else {
+						/* Write the last byte to
+						 * MWDATABE register
+						 */
+						iowrite32((u32)(p_xfer->p_data
+							 [buf_idx++] &
+							 0x000000FF),
+							 p_drv->regs +
+							 I3C_MWDATABE_OFFSET);
+					}
+					p_xfer->remaining--;
+				} else {
+					/* Out of room in FIFO. Break from loop.
+					 * TXNOTFULL interrupt will write the
+					 * rest of the data when space avail.
+					 */
+
+					// Enable Tx Not Full Interrupt.
+					iowrite32(I3C_MINT_TXNOTFULL_MASK,
+						  p_drv->regs +
+							  I3C_MINTSET_OFFSET);
+					break;
+				}
+			}
+
+			// Set up control reg
+			if (p_xfer->type == I3C_XFER_TYPE_I3C_BCCC_WRITE) {
+				addr = I3C_BROADCAST_ADDR;
+			} else {
+				addr = p_dev->devices[p_xfer->dev_id].addr &
+				       0x7F; // enforce 7 bits of addr
+			}
+
+			if (p_xfer->allow_ibi)
+				reg = I3C_MCTRL_IBIRESP_MANUAL;
+			else
+				reg = I3C_MCTRL_IBIRESP_NACK;
+
+			reg |= I3C_MCTRL_REQUEST_START_ADDR |
+			       I3C_MCTRL_DIR_WRITE |
+			       (addr
+				<< I3C_MCTRL_ADDR_SHFT); // Bus Device Address
+
+			// Add transfer type to control reg.
+			switch (p_xfer->type) {
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
+				// Invalid transfer type
+				reg = 0;
+				break;
+			}
+
+			if (reg) {
+				iowrite32(reg, p_drv->regs + I3C_MCTRL_OFFSET);
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
+static s32 i3c_read_ctrl_mode(void *vp_driver, void *p_data)
+{
+	s32 status = SVC_DRV_ERR_I3C_XFER_ERR;
+	struct svc_i3c_master *p_drv = (struct svc_i3c_master *)vp_driver;
+	u32 reg = 0;
+	u8 buf_idx = 0;
+	u8 rd_count = 0;
+
+	struct svc_i3c_dev_s *p_dev;
+	struct svc_i3c_xfer_s *p_xfer;
+
+	if (p_drv && p_data) {
+		p_dev = p_drv->p_dev;
+
+		if (p_dev->state == I3C_STATE_IDLE) {
+			p_dev->state = I3C_STATE_XFER_ACTIVE;
+
+			p_xfer = (struct svc_i3c_xfer_s *)p_data;
+
+			// Flush the receive FIFO
+			reg = I3C_MDATACTRL_FLUSHRB;
+			iowrite32(reg, p_drv->regs + I3C_MDATACTRL_OFFSET);
+
+			// Copy current transfer to the device structure.
+			p_dev->p_xfer = p_xfer;
+
+			// Index to start of data buffer
+			buf_idx = 0;
+
+			p_xfer->remaining = p_xfer->count;
+
+			if (p_xfer->type == I3C_XFER_TYPE_I3C_READ_DDR)
+				rd_count =
+					2 +
+					p_xfer->count /
+						2; // HDR-DDR cmd word and CRC
+			else
+				rd_count = p_xfer->count;
+
+			// Set up control reg
+			if (p_xfer->allow_ibi)
+				reg = I3C_MCTRL_IBIRESP_MANUAL;
+			else
+				reg = I3C_MCTRL_IBIRESP_NACK;
+
+			reg |= (rd_count << I3C_MCTRL_RDTERM_SHFT) |
+			       I3C_MCTRL_REQUEST_START_ADDR |
+			       I3C_MCTRL_DIR_READ |
+			       (p_dev->devices[p_xfer->dev_id].addr
+				<< I3C_MCTRL_ADDR_SHFT); // Bus Device Address
+
+			// Add transfer type to control reg
+			switch (p_xfer->type) {
+			case I3C_XFER_TYPE_I2C_READ:
+				reg |= I3C_MCTRL_TYPE_I2C;
+				break;
+			case I3C_XFER_TYPE_I3C_READ:
+			case I3C_XFER_TYPE_I3C_DCCC_READ:
+				reg |= I3C_MCTRL_TYPE_I3C;
+				break;
+			case I3C_XFER_TYPE_I3C_READ_DDR:
+				/* Write the HDR-DDR cmd to the MWDATAB register
+				 * to sendto slave after entering HDR-DDR mode.
+				 */
+				iowrite32((u32)(p_xfer->hdr_ddr_cmd &
+						0x000000FF),
+					  p_drv->regs + I3C_MWDATAB_OFFSET);
+				reg |= I3C_MCTRL_TYPE_HDR_DDR;
+				break;
+			default:
+				// Invalid transfer type
+				reg = 0;
+				break;
+			}
+
+			if (reg) {
+				iowrite32(reg, p_drv->regs + I3C_MCTRL_OFFSET);
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
+static void i3c_stop(void *vp_driver)
+{
+	iowrite32((I3C_MCTRL_REQUEST_STOP << I3C_MCTRL_REQUEST_SHFT),
+		  ((struct svc_i3c_master *)vp_driver)->regs +
+			  I3C_MCTRL_OFFSET);
+}
+
+static void i3c_exit_hdr(void *vp_driver)
+{
+	iowrite32((I3C_MCTRL_REQUEST_FORCE_EXIT << I3C_MCTRL_REQUEST_SHFT),
+		  ((struct svc_i3c_master *)vp_driver)->regs +
+			  I3C_MCTRL_OFFSET);
+}
+
+/* Called to handle an IBI request from a slave device
+ * where the slave triggered the SLVSTART interrupt.
+ * This should only be done when the bus is idle.
+ */
+static s32 i3c_ibi_start(void *vp_driver)
+{
+	s32 status = SVC_DRV_ERR_NONE;
+	struct svc_i3c_master *p_drv = (struct svc_i3c_master *)vp_driver;
+	struct svc_i3c_dev_s *p_dev = (struct svc_i3c_dev_s *)(p_drv->p_dev);
+	u32 reg = 0;
+
+	if (p_dev->state == I3C_STATE_IDLE) {
+		p_dev->state = I3C_STATE_IBI_REQ;
+
+		// Reset IBI variables
+		memset((void *)p_dev->ibi_data, 0x00, IBI_DATA_MAX_SIZE);
+		p_dev->ibi_idx = 0;
+		p_dev->ibi_dev_addr = 0;
+		p_dev->ibi_type = 0;
+
+		reg = I3C_MCTRL_REQUEST_START_ADDR | I3C_MCTRL_IBIRESP_MANUAL |
+		      (I3C_BROADCAST_ADDR << I3C_MCTRL_ADDR_SHFT);
+		iowrite32(reg, p_drv->regs + I3C_MCTRL_OFFSET);
+	} else {
+		status = SVC_DRV_ERR_I3C_BUSY;
+	}
+	return status;
+}
+
+static s32 i3c_ibi_nack(void *vp_driver)
+{
+	s32 status = SVC_DRV_ERR_NONE;
+	struct svc_i3c_master *p_drv = (struct svc_i3c_master *)vp_driver;
+	struct svc_i3c_dev_s *p_dev = (struct svc_i3c_dev_s *)(p_drv->p_dev);
+	u32 reg = 0;
+
+	if (p_dev->state == I3C_STATE_IDLE) {
+		reg = I3C_MCTRL_IBIRESP_NACK | I3C_MCTRL_REQUEST_IBI_ACKNACK;
+		iowrite32(reg, p_drv->regs + I3C_MCTRL_OFFSET);
+	} else {
+		status = SVC_DRV_ERR_I3C_BUSY;
+	}
+	return status;
+}
+
+struct svc_isr_ctx {
+	struct svc_i3c_master *p_drv;
+	struct svc_i3c_dev_s *p_dev;
+	u32 mstatus;
+	u32 int_mask;
+	u32 state;
+	u32 reg;
+	u32 data_ctrl;
+	u32 rx_data;
+	u8 buf_idx;
+	u8 two_bytes;
+};
+
+/*
+ * I3C ISR I3C_MINT_RXPEND
+ */
+static void isr_mint_rxpend(struct svc_isr_ctx *ctx)
+{
+	/* No need to clear the interrupt.
+	 * Automatically cleared when reading rx data
+	 */
+
+	// Read current status
+	ctx->mstatus = ioread32(ctx->p_drv->regs + I3C_MSTATUS_OFFSET);
+
+	/* Read the state of the hardware.
+	 * Only perform this once as reading
+	 * may clear the state.
+	 */
+	ctx->state = ctx->mstatus & I3C_MSTATUS_STATE_MASK;
+
+	// Read the data control register for status rx count
+	ctx->data_ctrl = ioread32(ctx->p_drv->regs + I3C_MDATACTRL_OFFSET);
+
+	/* Loop here receiving data as long as it is
+	 * available in the RX FIFO.
+	 * This reduces latency reading the data.
+	 */
+	do {
+		/* Check how many bytes available.
+		 * If greater than one, we'll read out two.
+		 */
+		if (((ctx->data_ctrl & I3C_MDATACTRL_RXCOUNT_MASK) >>
+		     I3C_MDATACTRL_RXCOUNT_SHFT) > 1) {
+			ctx->two_bytes = 1;
+		} else {
+			ctx->two_bytes = 0;
+		}
+
+		/* Read the data based upon the hardware state
+		 * to know which register to read
+		 */
+		switch (ctx->state) {
+		case I3C_MSTATUS_STATE_MSGSDR:
+			/* For message mode, read from MRMSG_SDR reg.
+			 * Up to two bytes are available in MRMSG_SDR
+			 */
+			ctx->rx_data = ioread32(ctx->p_drv->regs +
+						I3C_MRMSG_SDR_OFFSET);
+			break;
+		case I3C_MSTATUS_STATE_DDR:
+			/* For message mode, read from MRMSG_DDR
+			 * register. Up to two bytes are available in
+			 * the MRMSG_DDR register.
+			 */
+			ctx->rx_data = ioread32(ctx->p_drv->regs +
+						I3C_MRMSG_DDR_OFFSET);
+			break;
+		case I3C_MSTATUS_STATE_NORMACT:
+		case I3C_MSTATUS_STATE_DAA:
+		default:
+			if (ctx->two_bytes) {
+				ctx->rx_data = ioread32(ctx->p_drv->regs +
+							I3C_MRDATAH_OFFSET);
+			} else {
+				ctx->rx_data = ioread32(ctx->p_drv->regs +
+							I3C_MRDATAB_OFFSET);
+			}
+			break;
+		}
+
+		// Process the data according to the expected state
+		switch (ctx->p_dev->state) {
+		case I3C_STATE_DAA:
+			if (ctx->state == I3C_MSTATUS_STATE_DAA) {
+				/* DAA data buffer must have been
+				 * initialized previously This is
+				 *  either done in
+				 * i3cEnterDynamicAddressAssignment()
+				 * or in the MCTRLDONE interrupt
+				 * handling during DAA.
+				 */
+				if (ctx->p_dev->p_daa_data) {
+					*ctx->p_dev->p_daa_data =
+						(u8)(ctx->rx_data & 0x000000ff);
+					ctx->p_dev->p_daa_data++;
+
+					if (ctx->two_bytes) {
+						*ctx->p_dev->p_daa_data =
+							(u8)((ctx->rx_data &
+							      0x0000ff00) >>
+							     8);
+						ctx->p_dev->p_daa_data++;
+					}
+				}
+			}
+			break;
+
+		case I3C_STATE_XFER_ACTIVE:
+
+			if (!ctx->p_dev->p_xfer)
+				break;
+
+			ctx->buf_idx = ctx->p_dev->p_xfer->count -
+				       ctx->p_dev->p_xfer->remaining;
+
+			if (!ctx->p_dev->p_xfer->p_data)
+				break;
+
+			if (ctx->p_dev->p_xfer->remaining > 1 && ctx->two_bytes
+			== 1) {
+				ctx->p_dev->p_xfer->p_data[ctx->buf_idx++] =
+				(u8)(ctx->rx_data & 0x000000ff);
+
+				ctx->p_dev->p_xfer->p_data
+				[ctx->buf_idx++] =
+				(u8)((ctx->rx_data &
+				0x0000ff00) >> 8);
+
+				ctx->p_dev->p_xfer->remaining -= 2;
+
+			} else if (ctx->p_dev->p_xfer->remaining > 0) {
+				ctx->p_dev->p_xfer->p_data[ctx->buf_idx++] =
+				(u8)(ctx->rx_data &
+				0x000000ff);
+				ctx->p_dev->p_xfer->remaining--;
+			}
+			break;
+		case I3C_STATE_AUTO_IBI:
+		case I3C_STATE_IBI_RESP:
+			if (ctx->p_dev->ibi_data) {
+				ctx->p_dev->ibi_data[ctx->p_dev->ibi_idx] =
+					(u8)ctx->rx_data;
+				ctx->p_dev->ibi_idx++;
+			}
+			break;
+		case I3C_STATE_IDLE:
+		default:
+			break;
+		}
+
+		// Re-read data control to determine if more data is available
+		ctx->data_ctrl =
+			ioread32(ctx->p_drv->regs + I3C_MDATACTRL_OFFSET);
+
+	} while (!(ctx->data_ctrl & I3C_MDATACTRL_RXEMPTY_MASK));
+}
+
+/*
+ * I3C ISR I3C_MINT_MCTRLDONE
+ */
+static void isr_mint_mctrldone(struct svc_isr_ctx *ctx)
+{
+	// Clear the interrupt
+	iowrite32(I3C_MINT_MCTRLDONE_MASK,
+		  ctx->p_drv->regs + I3C_MSTATUS_OFFSET);
+
+	// Read current status
+	ctx->mstatus = ioread32(ctx->p_drv->regs + I3C_MSTATUS_OFFSET);
+
+	if (((ctx->mstatus & I3C_MSTATUS_STATE_MASK) ==
+	     I3C_MSTATUS_STATE_DAA) &&
+	    (ctx->mstatus & I3C_MSTATUS_BETWEEN_MASK)) {
+		if (ctx->p_dev->num_devices < I3C_MAX_DEVICES) {
+			int dev_idx;
+			s8 dev_addr;
+
+			// Get next DAA device table entry
+			if (ctx->p_dev->daa_dev_idx >= 0) {
+				// We have an available device table entry
+
+				// Get the address for this device
+				dev_addr = ctx->p_dev->devices
+				[ctx->p_dev->daa_dev_idx].addr;
+
+				/* Verify that device address is initialized.
+				 * This should have been initialized by
+				 * the higher layer drivers.
+				 */
+				if (dev_addr != I3C_INVALID_ADDR) {
+					ctx->p_dev->devices
+					[ctx->p_dev->daa_dev_idx]
+					.addr_type = I3C_ADDRESS_TYPE_DYNAMIC;
+
+					// Mark table entry is used
+					ctx->p_dev->dev_available_flags &=
+					~(1 << ctx->p_dev->daa_dev_idx);
+
+					// Set the device address
+					iowrite32(dev_addr, ctx->p_drv->regs +
+					I3C_MWDATAB_OFFSET);
+
+					// Get next available device in table
+					dev_idx =
+					i3c_get_next_available_dev_idx(ctx
+					->p_dev);
+
+					if (dev_idx > 0) {
+						// Save the device index
+						ctx->p_dev->daa_dev_idx =
+							dev_idx;
+
+						/* Point to next provisional ID
+						 * in the device table to
+						 * receive the ID from the
+						 * next device
+						 */
+						ctx->p_dev->p_daa_data =
+						ctx->p_dev->devices[dev_idx]
+						.prov_id;
+					} else {
+						ctx->p_dev->p_daa_data = NULL;
+					}
+
+					// Continue DAA request
+					iowrite32(I3C_MCTRL_REQUEST_PROC_DAA |
+					I3C_MCTRL_IBIRESP_MANUAL,
+					ctx->p_drv->regs + I3C_MCTRL_OFFSET);
+
+					ctx->p_dev->num_devices++;
+				}
+			}
+		}
+	}
+}
+
+/*
+ * I3C ISR I3C_MINT_COMPLETE_MASK
+ */
+static void isr_mint_complete(struct svc_isr_ctx *ctx)
+{
+	// Clear the interrupt
+	iowrite32(I3C_MINT_COMPLETE_MASK,
+		  ctx->p_drv->regs + I3C_MSTATUS_OFFSET);
+
+	// Process the interrupt based on the current state of the bus
+	switch (ctx->p_dev->state) {
+	case I3C_STATE_XFER_ACTIVE:
+
+		/* Do not process the complete for the transfer if we're
+		 * dealing with an IBI. IBI and COMPLETE interrupts may
+		 * occur simultaneously. Just fall through and process
+		 * the IBI interrupt instead.
+		 */
+		if (!(ctx->mstatus & I3C_MSTATUS_IBIWON_MASK)) {
+			if (ctx->p_dev->p_xfer) {
+				if (ctx->p_dev->p_xfer->stop) {
+					if (ctx->p_dev->p_xfer->type ==
+					   I3C_XFER_TYPE_I3C_READ_DDR ||
+					   ctx->p_dev->p_xfer->type ==
+					   I3C_XFER_TYPE_I3C_WRITE_DDR) {
+						/* Exit HDR-DDR Mode.
+						 * Also issues STOP.
+						 */
+						i3c_exit_hdr(ctx->p_drv);
+					} else {
+						// Issue STOP
+						i3c_stop(ctx->p_drv);
+					}
+				}
+
+				if (ctx->p_dev->p_xfer->type ==
+					    I3C_XFER_TYPE_I3C_WRITE ||
+				    ctx->p_dev->p_xfer->type ==
+					    I3C_XFER_TYPE_I2C_WRITE ||
+				    ctx->p_dev->p_xfer->type ==
+					    I3C_XFER_TYPE_I3C_WRITE_DDR) {
+					// Disable Tx Not Full Interrupt
+					iowrite32(I3C_MINT_TXNOTFULL_MASK,
+						  ctx->p_drv->regs +
+							  I3C_MINTCLR_OFFSET);
+
+					/* Notify event handler
+					 * that write is complete
+					 */
+					ctx->p_drv->event_handler((void *)ctx
+					->p_drv, I3C_EVENT_RW_COMPLETE);
+				} else {
+					/* Notify event handler
+					 * that read is complete
+					 */
+					ctx->p_drv->event_handler((void *)ctx
+					->p_drv, I3C_EVENT_RW_COMPLETE);
+				}
+
+				// Complete - clear out the transfer
+				ctx->p_dev->p_xfer = NULL;
+				ctx->p_dev->state = I3C_STATE_IDLE;
+			}
+		}
+		break;
+	case I3C_STATE_DAA:
+		i3c_exit_dynamic_address_assignment(ctx->p_drv);
+		break;
+	case I3C_STATE_AUTO_IBI:
+	case I3C_STATE_IBI_RESP:
+		// Notify event handler that IBI is complete
+		ctx->p_drv->event_handler((void *)ctx->p_drv,
+					  I3C_EVENT_IBI_COMPLETE);
+
+		// Issue Stop
+		i3c_stop(ctx->p_drv);
+
+		ctx->p_dev->state = I3C_STATE_IDLE;
+		break;
+	case I3C_STATE_IDLE:
+		break;
+	default:
+		break;
+	}
+}
+
+/*
+ * I3C ISR I3C_MINT_TXNOTFULL_MASK
+ */
+static void isr_mint_txnotfull(struct svc_isr_ctx *ctx)
+{
+	// Clear the interrupt
+	iowrite32(I3C_MINT_TXNOTFULL_MASK,
+		  ctx->p_drv->regs + I3C_MSTATUS_OFFSET);
+
+	if (ctx->p_dev->state == I3C_STATE_XFER_ACTIVE && ctx->p_dev->p_xfer) {
+		ctx->buf_idx = ctx->p_dev->p_xfer->count -
+			       ctx->p_dev->p_xfer->remaining;
+
+		if (ctx->p_dev->p_xfer->p_data) {
+			while (ctx->p_dev->p_xfer->remaining > 0) {
+				// Load additional data into the Tx FIFO
+				if (ctx->p_dev->p_xfer->remaining > 1) {
+					// All but last byte
+					iowrite32((u32)(ctx->p_dev->p_xfer
+					->p_data[ctx->buf_idx]) & 0x000000ff,
+					ctx->p_drv->regs + I3C_MWDATAB_OFFSET);
+				} else {
+					// Last byte
+					iowrite32((u32)(ctx->p_dev->p_xfer
+					->p_data[ctx->buf_idx]) & 0x000000ff,
+					ctx->p_drv->regs + I3C_MWDATABE_OFFSET);
+				}
+
+				ctx->buf_idx++;
+				ctx->p_dev->p_xfer->remaining--;
+
+				// Read the TX FIFO Full Status
+				ctx->reg = ioread32(ctx->p_drv->regs +
+						    I3C_MDATACTRL_OFFSET);
+
+				if (ctx->reg & I3C_MDATACTRL_TXFULL_MASK) {
+					/* Tx FIFO is full,
+					 * don't write additional data
+					 */
+					break;
+				}
+			}
+		}
+	}
+}
+
+/*
+ * I3C ISR I3C_MINT_SLVSTART_MASK
+ */
+static void isr_mint_slvstart(struct svc_isr_ctx *ctx)
+{
+	// Clear the interrupt
+	iowrite32(I3C_MINT_SLVSTART_MASK,
+		  ctx->p_drv->regs + I3C_MSTATUS_OFFSET);
+
+	ctx->p_drv->event_handler((void *)ctx->p_drv, I3C_EVENT_IBI_REQUEST);
+}
+
+/*
+ * I3C ISR I3C_MINT_IBIWON_MASK
+ */
+static void isr_mint_ibiwon(struct svc_isr_ctx *ctx)
+{
+	u8 addr = (u8)((ctx->mstatus & I3C_MSTATUS_IBIADDR_MASK) >>
+		       I3C_MSTATUS_IBIADDR_SHFT);
+	u8 ibi_type = (u8)((ctx->mstatus & I3C_MSTATUS_IBITYPE_MASK) >>
+			   I3C_MSTATUS_IBITYPE_SHFT);
+	u8 i;
+
+	// Clear the interrupt
+	iowrite32(I3C_MINT_IBIWON_MASK, ctx->p_drv->regs + I3C_MSTATUS_OFFSET);
+
+	if (ctx->p_dev->state == I3C_STATE_XFER_ACTIVE) {
+		// [NOTICE]: Unexpected IBIWON
+
+		// Notify event handler with transfer error
+		ctx->p_drv->event_handler((void *)ctx->p_drv, I3C_EVENT_RW_ERR);
+
+		ctx->p_dev->p_xfer = NULL;
+
+		// Now, we are expecting it.
+		ctx->p_dev->state = I3C_STATE_IBI_REQ;
+	}
+
+	// Here: we only process the IBI if we are expecting it.
+	if (ctx->p_dev->state != I3C_STATE_IBI_REQ)
+		return;
+
+	ctx->p_dev->state = I3C_STATE_IBI_RESP;
+
+	if (ibi_type == I3C_MSTATUS_IBITYPE_HOT_JOIN) {
+		/* Reset the index to the beginning of the IBI buffer,
+		 * clear the buffer and save the device address and
+		 * IBI type
+		 */
+		ctx->p_dev->ibi_idx = 0;
+		memset((void *)ctx->p_dev->ibi_data, 0x00, IBI_DATA_MAX_SIZE);
+		ctx->p_dev->ibi_dev_addr = addr;
+		ctx->p_dev->ibi_type = ibi_type;
+
+		ctx->reg = (I3C_MCTRL_IBIRESP_ACK_NO_BYTE |
+			    I3C_MCTRL_REQUEST_IBI_ACKNACK);
+	} else {
+		/* Default to NAK the IBI if there is
+		 * an error finding the device
+		 */
+		ctx->reg = (I3C_MCTRL_IBIRESP_NACK |
+			    I3C_MCTRL_REQUEST_IBI_ACKNACK);
+
+		for (i = 0; i < I3C_MAX_DEVICES; i++) {
+			if (addr != ctx->p_dev->devices[i].addr)
+				continue;
+
+			struct svc_i3c_slv_attrib_s slv_attrib;
+
+			/* Reset the index to the beginning of
+			 * the IBI buffer, clear the buffer and save the
+			 * device address and IBI type
+			 */
+			ctx->p_dev->ibi_idx = 0;
+			memset((void *)ctx->p_dev->ibi_data, 0x00,
+			       IBI_DATA_MAX_SIZE);
+			ctx->p_dev->ibi_dev_addr = addr;
+			ctx->p_dev->ibi_type = ibi_type;
+
+			slv_attrib.dev_idx = i;
+			if (i3c_get_device_attributes(ctx->p_drv,
+						      &slv_attrib) ==
+			    SVC_DRV_ERR_NONE) {
+				if (slv_attrib.bcr.ibi_payload) {
+					// device supports mandatory byte
+					ctx->reg =
+					(I3C_MCTRL_IBIRESP_ACK_WITH_BYTE |
+					I3C_MCTRL_REQUEST_IBI_ACKNACK);
+				} else {
+					// device non-mandatory byte
+					ctx->reg =
+					(I3C_MCTRL_IBIRESP_ACK_NO_BYTE |
+					I3C_MCTRL_REQUEST_IBI_ACKNACK);
+				}
+			}
+			break;
+		}
+	}
+	iowrite32(ctx->reg, ctx->p_drv->regs + I3C_MCTRL_OFFSET);
+}
+
+/*
+ * I3C ISR I3C_MINT_IBIWON_MASK
+ */
+static void isr_mint_errwarn(struct svc_isr_ctx *ctx)
+{
+	// Read the error/warning register
+	ctx->reg = ioread32(ctx->p_drv->regs + I3C_MERRWARN_OFFSET);
+
+	/* Clear the error/warning interrupt by writing to the bits
+	 * in the MERRWARN register
+	 */
+	iowrite32(ctx->reg, ctx->p_drv->regs + I3C_MERRWARN_OFFSET);
+
+	if (ctx->p_dev->state == I3C_STATE_XFER_ACTIVE && ctx->p_dev->p_xfer) {
+		if (ctx->reg & I3C_MERRWARN_NACK ||
+		    ctx->reg & I3C_MERRWARN_WRABT) {
+			// Notify event handler that RW was NACK'ed
+			ctx->p_drv->event_handler((void *)ctx->p_drv,
+						  I3C_EVENT_RW_NACK);
+		} else if (ctx->reg & I3C_MERRWARN_TIMEOUT) {
+			// Notify event handler of timeout error
+			ctx->p_drv->event_handler((void *)ctx->p_drv,
+						  I3C_EVENT_RW_TIMEOUT);
+		} else {
+			// Notify event handler of other R/W error
+			ctx->p_drv->event_handler((void *)ctx->p_drv,
+						  I3C_EVENT_RW_ERR);
+		}
+	}
+}
+
+/*
+ * I3C ISR I3C_MINT_NOWMASTER_MASK
+ */
+static void isr_mint_nowmaster(struct svc_isr_ctx *ctx)
+{
+	iowrite32(I3C_MINT_NOWMASTER_MASK,
+		  ctx->p_drv->regs + I3C_MSTATUS_OFFSET);
+}
+
+/*
+ * I3C Interrupt Service Routine
+ */
+static void svc_i3c_master_isr(void *arg)
+{
+	struct svc_isr_ctx ctx;
+
+	ctx.p_drv = (struct svc_i3c_master *)arg;
+
+	if (!ctx.p_drv)
+		return; // invalid function argument
+
+	// init context
+	ctx.p_dev = (struct svc_i3c_dev_s *)ctx.p_drv->p_dev;
+	ctx.mstatus = 0;
+	ctx.int_mask = 0;
+	ctx.state = 0;
+	ctx.reg = 0;
+	ctx.data_ctrl = 0;
+	ctx.rx_data = 0;
+	ctx.buf_idx = 0;
+	ctx.two_bytes = 0;
+
+	// Read interrupt source
+	ctx.int_mask = ioread32(ctx.p_drv->regs + I3C_MINTMASKED_OFFSET);
+
+	ctx.p_dev = (struct svc_i3c_dev_s *)ctx.p_drv->p_dev;
+
+	// Receive data pending interrupt
+	if (ctx.int_mask & I3C_MINT_RXPEND_MASK)
+		isr_mint_rxpend(&ctx);
+
+	if (ctx.int_mask & I3C_MINT_MCTRLDONE_MASK)
+		isr_mint_mctrldone(&ctx);
+
+	if (ctx.int_mask & I3C_MINT_COMPLETE_MASK)
+		isr_mint_complete(&ctx);
+
+	if (ctx.int_mask & I3C_MINT_TXNOTFULL_MASK)
+		isr_mint_txnotfull(&ctx);
+
+	if (ctx.int_mask & I3C_MINT_SLVSTART_MASK)
+		isr_mint_slvstart(&ctx);
+
+	if (ctx.int_mask & I3C_MINT_IBIWON_MASK)
+		isr_mint_ibiwon(&ctx);
+
+	if (ctx.int_mask & I3C_MINT_ERRWARN_MASK)
+		isr_mint_errwarn(&ctx);
+
+	if (ctx.int_mask & I3C_MINT_NOWMASTER_MASK)
+		isr_mint_nowmaster(&ctx);
+}
+
+/*
+ * Enable specified I3C interrupt sources
+ */
+static void svc_i3c_interrupt_enable(void *vp_driver, u32 mask)
+{
+	struct svc_i3c_master *p_drv = (struct svc_i3c_master *)vp_driver;
+
+	iowrite32(mask, p_drv->regs + I3C_MINTSET_OFFSET);
+}
+
+/*
+ * Disable all I3C interrupt sources, return previous
+ * interrupt enables.
+ */
+static u32 svc_i3c_interrupt_disable(void *vp_driver)
+{
+	struct svc_i3c_master *p_drv = (struct svc_i3c_master *)vp_driver;
+	u32 mask;
+
+	mask = ioread32(p_drv->regs + I3C_MINTSET_OFFSET);
+	iowrite32(mask, p_drv->regs + I3C_MINTCLR_OFFSET);
+
+	return mask;
+}
+
+/*
+ * I3C Initialization
+ */
+static s32 svc_i3c_initialize(void *vp_driver, struct svc_i3c_dev_s *p_dev,
+			      u32 base_address, u32 irq_bitmask)
+{
+	int i;
+
+	if (vp_driver) {
+		struct svc_i3c_master *p_drv =
+			(struct svc_i3c_master *)vp_driver;
+
+		i3c_disable(vp_driver);
+
+		p_dev->master_ena = I3C_MASTER_ENABLE;
+		p_dev->timeout_err_ena = SVC_DRV_CTRL_ENABLE;
+		p_dev->high_keeper = I3C_HIGH_KEEPER_NONE;
+		p_dev->stop_speed = I3C_STOP_SPEED_PUSH_PULL;
+		p_dev->pp_baud = 0;
+		p_dev->pp_low = 0;
+		p_dev->od_baud = 0;
+		p_dev->od_hpp = I3C_ODHPP_SCL_HIGH_EQ_SCL_LOW;
+		p_dev->skew = 0;
+		p_dev->i2c_baud = 0;
+
+		// Clear I3C slave device table
+		for (i = 0; i < I3C_MAX_DEVICES; i++) {
+			p_dev->devices[i].addr = I3C_INVALID_ADDR;
+			p_dev->devices[i].addr_type =
+				I3C_ADDRESS_TYPE_UNASSIGNED;
+			memset((void *)p_dev->devices[i].prov_id, 0x00,
+			       sizeof(p_dev->devices[i].prov_id));
+		}
+		p_dev->num_devices = 0;
+		p_dev->dev_available_flags = 0xFFFFFFFF;
+
+		p_dev->p_xfer = NULL;
+
+		p_dev->state = I3C_STATE_IDLE;
+
+		// Reset DAA variables
+		p_dev->daa_dev_idx = -1;
+		p_dev->p_daa_data = NULL;
+
+		// Reset IBI variables
+		memset((void *)p_dev->ibi_data, 0x00, IBI_DATA_MAX_SIZE);
+		p_dev->ibi_idx = 0;
+		p_dev->ibi_dev_addr = 0;
+		p_dev->ibi_type = 0;
+
+		return SVC_DRV_ERR_NONE;
+	}
+
+	return SVC_DRV_ERR_INVALID_PARAM;
+}
+
+/*
+ * I3C Event Handler Registration Function
+ */
+static s32 svc_i3c_register_event_handler(void *vp_driver,
+					  fp_event_handler_t handler)
+{
+	struct svc_i3c_master *p_drv = (struct svc_i3c_master *)vp_driver;
+
+	if (p_drv) {
+		p_drv->event_handler = handler;
+
+		return SVC_DRV_ERR_NONE;
+	}
+	return SVC_DRV_ERR_INVALID_PARAM;
+}
+
+static int svc_i3c_add_static_device(void *vp_driver, u8 addr)
+{
+	struct svc_i3c_master *p_drv = (struct svc_i3c_master *)vp_driver;
+	struct svc_i3c_dev_s *p_dev = (struct svc_i3c_dev_s *)(p_drv->p_dev);
+	int dev_idx;
+	u32 irq_ena;
+
+	if (addr > 0) {
+		/* Prevent interrupt from assigning a device.
+		 * Would occur during DAA.
+		 */
+		irq_ena = svc_i3c_interrupt_disable(vp_driver);
+
+		dev_idx = i3c_get_next_available_dev_idx(p_dev);
+		if (dev_idx != I3C_INVALID_ADDR) {
+			p_dev->devices[dev_idx].addr = addr;
+			p_dev->devices[dev_idx].addr_type =
+				I3C_ADDRESS_TYPE_STATIC;
+			p_dev->dev_available_flags &= ~(0x00000001 << dev_idx);
+			p_dev->num_devices++;
+		} else {
+			dev_idx = SVC_DRV_ERR_I3C_TOO_MANY_DEV;
+		}
+
+		svc_i3c_interrupt_enable(vp_driver, irq_ena);
+	} else {
+		dev_idx = SVC_DRV_ERR_INVALID_PARAM;
+	}
+
+	return dev_idx;
+}
+
+// Set a device address in the device table
+static int svc_i3c_set_device_address(void *vp_driver, u8 dev_idx, u8 addr)
+{
+	int status = SVC_DRV_ERR_NONE;
+	struct svc_i3c_master *p_drv = (struct svc_i3c_master *)vp_driver;
+	struct svc_i3c_dev_s *p_dev = (struct svc_i3c_dev_s *)(p_drv->p_dev);
+
+	if (dev_idx < I3C_MAX_DEVICES) {
+		/* Only allow modification of the address if
+		 * the device is available.
+		 */
+		if (p_dev->dev_available_flags & (0x1 << dev_idx))
+			p_dev->devices[dev_idx].addr = addr;
+		else
+			status = SVC_DRV_ERR_I3C_BUSY;
+
+	} else {
+		status = SVC_DRV_ERR_INVALID_PARAM;
+	}
+
+	return status;
+}
+
+static u8 svc_i3c_get_device_index_from_address(void *vp_driver, u8 dev_addr)
+{
+	struct svc_i3c_master *p_drv = (struct svc_i3c_master *)vp_driver;
+	struct svc_i3c_dev_s *p_dev = (struct svc_i3c_dev_s *)(p_drv->p_dev);
+	u8 i;
+
+	for (i = 0; i < I3C_MAX_DEVICES; i++) {
+		if (p_dev->devices[i].addr == dev_addr)
+			return i;
+	}
+
+	return I3C_INVALID_ADDR;
+}
+
+/*
+ * I3C Read Function
+ */
+static s32 svc_i3c_read(void *vp_driver, void *p_data)
+{
+	s32 status;
+
+	status = i3c_read_ctrl_mode(vp_driver, p_data);
+
+	return status;
+}
+
+/*
+ * I3C Write Function
+ */
+static s32 svc_i3c_write(void *vp_driver, void *p_data)
+{
+	s32 status;
+
+	status = i3c_write_ctrl_mode(vp_driver, p_data);
+
+	return status;
+}
+
+/*
+ * I3C Abort Read/Write Function
+ */
+static s32 svc_i3c_abort(void *vp_driver, struct svc_i3c_xfer_s *p_xfer)
+{
+	s32 status = SVC_DRV_ERR_I3C_XFER_ERR;
+
+	struct svc_i3c_master *p_drv = (struct svc_i3c_master *)vp_driver;
+	struct svc_i3c_dev_s *p_dev;
+	u32 int_ena;
+
+	if (p_drv) {
+		p_dev = p_drv->p_dev;
+
+		/* Prevent interrupt from processing the transfer while
+		 * we are trying to abort it
+		 */
+		int_ena = svc_i3c_interrupt_disable(vp_driver);
+		if (p_dev->state == I3C_STATE_XFER_ACTIVE &&
+		    p_xfer == p_dev->p_xfer) {
+			p_dev->p_xfer = 0;
+			p_dev->state = I3C_STATE_IDLE;
+			status = SVC_DRV_ERR_NONE;
+		}
+		svc_i3c_interrupt_enable(vp_driver, int_ena);
+	}
+
+	return status;
+}
+
+/*
+ * I3C Control Set Function
+ *
+ * Writes driver controls
+ */
+static s32 svc_i3c_control_set(void *vp_driver, u32 control, u32 arg)
+{
+	s32 status = SVC_DRV_ERR_NONE;
+	struct svc_i3c_master *p_drv = (struct svc_i3c_master *)vp_driver;
+	struct svc_i3c_dev_s *p_dev;
+
+	if (p_drv) {
+		p_dev = p_drv->p_dev;
+
+		switch (control) {
+		case I3C_CTRL_CFG_MASTER_ENABLE:
+			if (arg <= I3C_MASTER_CAPABLE) {
+				/* Secondary master:
+				 * slave mode not yet supported
+				 */
+				if (arg == I3C_MASTER_ENABLE) {
+					p_dev->master_ena =
+					(enum svc_i3c_master_enable_e)
+					arg;
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
+				p_dev->timeout_err_ena =
+					(enum svc_drv_ctrl_enable_e)arg;
+			} else {
+				status = SVC_DRV_ERR_INVALID_PARAM;
+			}
+			break;
+
+		case I3C_CTRL_CFG_HIGH_KEEPER:
+			if (arg <= I3C_HIGH_KEEPER_EXTERN_SDA_SCL)
+				p_dev->high_keeper =
+					(enum svc_i3c_high_keeper_e)arg;
+			else
+				status = SVC_DRV_ERR_INVALID_PARAM;
+
+			break;
+
+		case I3C_CTRL_CFG_STOP_SPEED:
+			if (arg == I3C_STOP_SPEED_PUSH_PULL ||
+			    arg == I3C_STOP_SPEED_OPEN_DRAIN) {
+				p_dev->stop_speed =
+					(enum svc_i3c_stop_speed_e)arg;
+			} else {
+				status = SVC_DRV_ERR_INVALID_PARAM;
+			}
+			break;
+
+		case I3C_CTRL_CFG_PPBAUD:
+			if (arg <= I3C_PPBAUD_MAX)
+				p_dev->pp_baud = (u8)arg;
+			else
+				status = SVC_DRV_ERR_INVALID_PARAM;
+
+			break;
+
+		case I3C_CTRL_CFG_PPLOW:
+			if (arg <= I3C_PPLOW_MAX)
+				p_dev->pp_low = (u8)arg;
+			else
+				status = SVC_DRV_ERR_INVALID_PARAM;
+
+			break;
+
+		case I3C_CTRL_CFG_ODBAUD:
+			if (arg <= I3C_ODBAUD_MAX)
+				p_dev->od_baud = (u8)arg;
+			else
+				status = SVC_DRV_ERR_INVALID_PARAM;
+
+			break;
+
+		case I3C_CTRL_CFG_ODHPP:
+			if (arg == I3C_ODHPP_SCL_HIGH_EQ_SCL_LOW ||
+			    arg == I3C_ODHPP_SCL_HIGH_EQ_ONE_PPBAUD)
+				p_dev->od_hpp = (enum svc_i3c_odhpp_e)arg;
+			else
+				status = SVC_DRV_ERR_INVALID_PARAM;
+
+			break;
+
+		case I3C_CTRL_CFG_SKEW:
+			if (arg <= I3C_SKEW_MAX)
+				p_dev->skew = (u8)arg;
+			else
+				status = SVC_DRV_ERR_INVALID_PARAM;
+
+			break;
+
+		case I3C_CTRL_CFG_I2CBAUD:
+			if (arg <= I3C_I2CBAUD_MAX)
+				p_dev->i2c_baud = (u8)arg;
+			else
+				status = SVC_DRV_ERR_INVALID_PARAM;
+
+			break;
+
+		case I3C_CTRL_ENABLE:
+			i3c_enable(vp_driver);
+			break;
+
+		case I3C_CTRL_DISABLE:
+			i3c_disable(vp_driver);
+			break;
+		case I3C_CTRL_ENTER_DAA:
+			status =
+				i3c_enter_dynamic_address_assignment(vp_driver);
+			break;
+		case I3C_CTRL_ABORT_DAA:
+			status = i3c_exit_dynamic_address_assignment(vp_driver);
+			break;
+		case I3C_CTRL_START_IBI:
+			status = i3c_ibi_start(vp_driver);
+			break;
+		case I3C_CTRL_NACK_IBI:
+			status = i3c_ibi_nack(vp_driver);
+			break;
+		case I3C_CTRL_ISSUE_STOP:
+			i3c_stop(vp_driver);
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
+/*
+ * I3C Control Get Function
+ *
+ * Reads driver controls
+ */
+s32 svc_i3c_control_get(void *vp_driver, u32 control, void *arg)
+{
+	s32 status = SVC_DRV_ERR_NONE;
+	struct svc_i3c_master *p_drv = (struct svc_i3c_master *)vp_driver;
+
+	u32 i;
+	struct svc_i3c_dev_s *p_dev;
+	u32 *p_ret32; // For returning 32-bit values in the arg pointer
+	u8 *p_ret8;
+
+	if (p_drv && arg) {
+		p_dev = p_drv->p_dev;
+
+		p_ret32 = (u32 *)arg;
+		p_ret8 = (u8 *)arg;
+
+		switch (control) {
+		case I3C_CTRL_GET_VERSION:
+			*p_ret32 = (I3C_DRV_VER_MAJOR << 8 | I3C_DRV_VER_MINOR);
+			break;
+		case I3C_CTRL_CFG_MASTER_ENABLE:
+			*p_ret32 = p_dev->master_ena;
+			break;
+		case I3C_CTRL_CFG_TIMEOUT_ERR_ENABLE:
+			*p_ret32 = p_dev->timeout_err_ena;
+			break;
+		case I3C_CTRL_CFG_HIGH_KEEPER:
+			*p_ret32 = p_dev->high_keeper;
+			break;
+		case I3C_CTRL_CFG_STOP_SPEED:
+			*p_ret32 = p_dev->stop_speed;
+			break;
+		case I3C_CTRL_CFG_PPBAUD:
+			*p_ret32 = p_dev->pp_baud;
+			break;
+		case I3C_CTRL_CFG_PPLOW:
+			*p_ret32 = p_dev->pp_low;
+			break;
+		case I3C_CTRL_CFG_ODBAUD:
+			*p_ret32 = p_dev->od_baud;
+			break;
+		case I3C_CTRL_CFG_ODHPP:
+			*p_ret32 = p_dev->od_hpp;
+			break;
+		case I3C_CTRL_CFG_SKEW:
+			*p_ret32 = p_dev->skew;
+			break;
+		case I3C_CTRL_CFG_I2CBAUD:
+			*p_ret32 = p_dev->i2c_baud;
+			break;
+		case I3C_CTRL_GET_DEV_AVAIL_FLAGS:
+			*p_ret32 = p_dev->dev_available_flags;
+			break;
+		case I3C_CTRL_GET_NUM_BUS_DEVICES:
+			*p_ret32 = p_dev->num_devices;
+			break;
+		case I3C_CTRL_GET_SLV_ATTRIB:
+			status = i3c_get_device_attributes(vp_driver, (struct
+							   svc_i3c_slv_attrib_s
+							   *)arg);
+			break;
+		case I3C_CTRL_GET_IBI_DEV_ADDR:
+			*p_ret32 = p_dev->ibi_dev_addr;
+			break;
+		case I3C_CTRL_GET_IBI_TYPE:
+			switch (p_dev->ibi_type) {
+			case I3C_MSTATUS_IBITYPE_NORMAL:
+				*p_ret32 = I3C_IBI_TYPE_NORMAL;
+				break;
+			case I3C_MSTATUS_IBITYPE_MASTER_REQ:
+				*p_ret32 = I3C_IBI_TYPE_MASTER_REQ;
+				break;
+			case I3C_MSTATUS_IBITYPE_HOT_JOIN:
+				*p_ret32 = I3C_IBI_TYPE_HOT_JOIN_REQ;
+				break;
+			case I3C_MSTATUS_IBITYPE_NONE:
+			default:
+				*p_ret32 = I3C_IBI_TYPE_NONE;
+				break;
+			}
+			break;
+		case I3C_CTRL_GET_IBI_DATA:
+			for (i = 0; i < IBI_DATA_MAX_SIZE; i++)
+				p_ret8[i] = p_dev->ibi_data[i];
+
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
+// General I3C/I2C read/write timeout
+#define XFER_TIMEOUT (msecs_to_jiffies(1000))
+// Common Command Code (CCC) transfer timeout
+#define CCC_TIMEOUT (msecs_to_jiffies(1000))
+// Dynamic Address Assignment procedure timeout
+#define DAA_TIMEOUT (msecs_to_jiffies(4000))
+
+// Default Bus Clock Dividers.
+#define I3C_PP_CLK_DIV_DEFAULT 3 // Divide (Fclk/2) by PP_CLK_DIV to get PPclk
+#define I3C_OD_CLK_DIV_DEFAULT 3 // Divide PPclk by OD_CLK_DIV to get ODclk
+#define I2C_CLK_DIV_DEFAULT 4 // Divide ODclk by I2C_CLK_DIV to get I2Cclk
+
+// Event flags
+static u32 event_cnt;
+static u32 daa_complete_cnt;
+static u32 rw_complet_cnt;
+static u32 rw_nack_cnt;
+static u32 rw_error_cnt;
+static u32 ibi_req_cnt;
+static u32 ibi_complete_cnt;
+
+// move static completion into device instance structure.
+//static DECLARE_COMPLETION(daa_complete); // declares and inits
+
+// IBI event handlers
+static int svc_i3c_master_ibi_request_handler(struct svc_i3c_master *master);
+static int svc_i3c_master_ibi_complete_handler(struct svc_i3c_master *master);
+
+/*
+ * Device specific data fields used only in this interface to
+ * the low-level driver.
+ */
+struct svc_i3c_i2c_dev_data {
+	u8 index; // Index into the low level device table
+
+	s16 ibi_dev_idx; // Index into the IBI device table in master
+	struct i3c_generic_ibi_pool
+		*ibi_pool; // IBI pool associated with this device
+};
+
+/*
+ * Obtain a pointer to the structure
+ * containing the i3c_master_controller object
+ */
+static inline struct svc_i3c_master *
+to_svc_i3c_master(struct i3c_master_controller *master)
+{
+	return container_of(master, struct svc_i3c_master, base);
+}
+
+/*
+ * I3C Master Interrupt service routine
+ */
+static irqreturn_t svc_i3c_master_irq_handler(int irq, void *dev_id)
+{
+	svc_i3c_master_isr(dev_id);
+
+	return IRQ_HANDLED; // TBD
+}
+
+/*
+ * I3C Event Handler
+ *
+ * Executes in interrupt context
+ */
+static void i3c_event_handler(void *vp_driver, u32 event)
+{
+	struct svc_i3c_master *p_drv = (struct svc_i3c_master *)vp_driver;
+
+	event_cnt++;
+
+	switch (event) {
+	case I3C_EVENT_DAA_COMPLETE:
+		complete(&p_drv->daa_complete);
+		break;
+	case I3C_EVENT_RW_COMPLETE:
+		complete(&p_drv->p_dev->p_xfer->comp);
+		break;
+	case I3C_EVENT_RW_NACK:
+		break;
+	case I3C_EVENT_RW_TIMEOUT:
+	case I3C_EVENT_RW_ERR:
+		break;
+	case I3C_EVENT_IBI_REQUEST:
+		svc_i3c_master_ibi_request_handler(p_drv);
+		break;
+	case I3C_EVENT_IBI_COMPLETE:
+		svc_i3c_master_ibi_complete_handler(p_drv);
+		break;
+	default:
+		break;
+	}
+}
+
+/*
+ * I3C Master Bus Initialization
+ *
+ * Called by the I3C Subsystem after master registration to initialize
+ * the I3C bus. Responsible for configuring and enabling the I3C master
+ * hardware.
+ *
+ * \note    Bus clock rates are set in this function and are currently hard
+ *          coded to fixed frequencies based on the Fclk for the module.
+ *
+ * With Fclk = 25 MHz
+ * - Push-pull Clk = 4.167 MHz
+ * - Open-drain Clk = 1.389 MHz
+ * - I2C Clk = 347.222 MHz
+ *
+ * Refer to the Silvaco I3C DRM User Guide for details regarding bus clock
+ * settings.
+ */
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
+	// TODO: Write address to the master HW
+	//       The slave mode DYNADDR address register is read-only and
+	//       gets set from DAA or assignment via the bus. It is not clear
+	//       how we should utilize the address for the SVC master. It
+	//       may be that we save this address for writing when switching
+	//       to slave mode once multi-master support is added. For now,
+	//       the hardware has no need to know this address.
+
+	memset(&info, 0, sizeof(info));
+	info.dyn_addr = ret;
+
+	ret = i3c_master_set_info(&master->base, &info);
+	if (ret)
+		return ret;
+
+	// Configure the master hardware
+
+	// Set up I3C bus
+	svc_i3c_register_event_handler((void *)master, i3c_event_handler);
+	svc_i3c_control_set((void *)master, I3C_CTRL_CFG_MASTER_ENABLE,
+			    I3C_MASTER_ENABLE);
+
+	// Configure bus clocking based on bus mode (see i3c_bus_mode)
+
+	svc_i3c_control_set((void *)master, I3C_CTRL_CFG_PPLOW, 0);
+
+	if (svc_i3c_control_set((void *)master, I3C_CTRL_CFG_PPBAUD,
+				(master->i3c_pp_clk_div - 1)) !=
+	    SVC_DRV_ERR_NONE) {
+		svc_i3c_control_set((void *)master, I3C_CTRL_CFG_PPBAUD,
+				    I3C_PP_CLK_DIV_DEFAULT);
+	}
+
+	if (svc_i3c_control_set((void *)master, I3C_CTRL_CFG_ODBAUD,
+				(master->i3c_od_clk_div - 1)) !=
+	    SVC_DRV_ERR_NONE) {
+		svc_i3c_control_set((void *)master, I3C_CTRL_CFG_ODBAUD,
+				    I3C_OD_CLK_DIV_DEFAULT);
+	}
+
+	svc_i3c_control_set((void *)master, I3C_CTRL_CFG_ODHPP,
+			    I3C_ODHPP_SCL_HIGH_EQ_SCL_LOW);
+	svc_i3c_control_set((void *)master, I3C_CTRL_CFG_SKEW, 0);
+
+	if (svc_i3c_control_set((void *)master, I3C_CTRL_CFG_I2CBAUD,
+				(master->i3c_od_clk_div - 1)) !=
+	    SVC_DRV_ERR_NONE) {
+		svc_i3c_control_set((void *)master, I3C_CTRL_CFG_I2CBAUD,
+				    I2C_CLK_DIV_DEFAULT);
+	}
+
+	// Enable the master
+	svc_i3c_control_set((void *)master, I3C_CTRL_ENABLE, 0);
+
+	return 0;
+}
+
+/*
+ * I3C Master Bus Cleanup
+ *
+ * Called by the I3C Subsystem to clean up everything done in
+ * \ref svc_i3c_master_bus_init(). Thus function currently does
+ * nothing.
+ */
+static void svc_i3c_master_bus_cleanup(struct i3c_master_controller *master)
+{
+	// [NOTICE]: This function currently does nothing.
+}
+
+/*
+ * I3C Master Attach I3C Device
+ *
+ * Called by the I3C Subsystem every time an I3C device is attached to the
+ * bus to perform any processing necessary to attach master controller specific
+ * data to I3C devices.
+ *
+ * This function allocates device data memory and calls the I3C subsystem
+ * function i3c_dev_set_master_data().
+ */
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
+/*
+ * I3C Master Dynamic Address Assignment
+ *
+ * Called by the I3C Subsystem to perform dynamic address assignment.
+ * Issues the enter DAA command to the bus and processes the devices
+ * that respond. New devices detected are added to the I3C subsystem
+ * by calling i3c_master_add_i3c_dev_locked().
+ */
+static int svc_i3c_master_do_daa(struct i3c_master_controller *m)
+{
+	struct svc_i3c_master *master = to_svc_i3c_master(m);
+	int ret, i;
+	int status = 0;
+	u8 temp_addr = 0;
+	u32 orig_dev_avail_flags, new_dev_avail_flags, changed_flags;
+	struct svc_i3c_slv_attrib_s slv_attrib;
+
+	spin_lock(&master->access_lock);
+
+	// Determine which devices are available from the driver
+	svc_i3c_control_get((void *)master, I3C_CTRL_GET_DEV_AVAIL_FLAGS,
+			    &orig_dev_avail_flags);
+
+	/* For any available devices, initialize the slave address
+	 * with an address obtained from the I3C master framework
+	 */
+	for (i = 0; i < I3C_MAX_DEVICES; i++) {
+		if (orig_dev_avail_flags & (0x1 << i)) {
+			// Find next available address after the previous
+			ret = i3c_master_get_free_addr(m, temp_addr + 1);
+			if (ret > 0) {
+				temp_addr = (u8)ret;
+				svc_i3c_set_device_address((void *)master, i,
+							   temp_addr);
+			}
+		}
+	}
+
+	// Execute DAA
+
+	reinit_completion(&master->daa_complete);
+
+	ret = svc_i3c_control_set((void *)master, I3C_CTRL_ENTER_DAA, 0);
+	if (ret == SVC_DRV_ERR_NONE) {
+		if (!wait_for_completion_timeout(&master->daa_complete,
+						 DAA_TIMEOUT)) {
+			svc_i3c_control_set((void *)master, I3C_CTRL_ABORT_DAA,
+					    0);
+
+			status = -ETIME;
+		}
+	} else {
+		status = ret;
+	}
+
+	spin_unlock(&master->access_lock);
+
+	/* After DAA is complete, for any new devices added,
+	 * add the device to the master framework.
+	 * For any unused devices, reset the address in the device
+	 * table to invalid.
+	 */
+
+	// Determine which devices are available from the driver
+	svc_i3c_control_get((void *)master, I3C_CTRL_GET_DEV_AVAIL_FLAGS,
+			    &new_dev_avail_flags);
+
+	/* Find the new devices. Only new devices should be added and no devices
+	 * should be removed during DAA. This ensures that orig > new
+	 * in the following.
+	 */
+	changed_flags = orig_dev_avail_flags - new_dev_avail_flags;
+
+	for (i = 0; i < I3C_MAX_DEVICES; i++) {
+		if (changed_flags & (0x1 << i)) {
+			slv_attrib.dev_idx = i;
+			svc_i3c_control_get((void *)master,
+					    I3C_CTRL_GET_SLV_ATTRIB,
+					    &slv_attrib);
+
+			ret = i3c_master_add_i3c_dev_locked(m, slv_attrib.addr);
+		} else if (new_dev_avail_flags & (0x1 << i)) {
+			svc_i3c_set_device_address((void *)master, i,
+						   I3C_INVALID_ADDR);
+		}
+	}
+
+	// Unmask Hot-Join and Mastership request interrupts.
+	i3c_master_enec_locked(m, I3C_BROADCAST_ADDR,
+			       I3C_CCC_EVENT_HJ | I3C_CCC_EVENT_MR);
+
+	return status;
+}
+
+/*
+ * I3C Master Check CCC Command Support
+ *
+ * Called by the I3C subsystem to check if a CCC command is supported.
+ * Will return true for all CCC commands as long as the
+ * number of destination devices is 1.
+ *
+ * \return  true if CCC command supported, false if CCC command not supported
+ */
+static bool
+svc_i3c_master_supports_ccc_cmd(struct i3c_master_controller *master,
+				const struct i3c_ccc_cmd *cmd)
+{
+	// Do not support CCC commands destined for more than one device
+	if (cmd->ndests > 1)
+		return false;
+
+	return true;
+}
+
+struct svc_ccc_ctx {
+	int status;
+	struct svc_i3c_master *master;
+	struct svc_i3c_xfer_s *p_i3c_xfer;
+	u8 *p_xfer_buf;
+	u8 *p_data;
+	int i;
+	int ret;
+	struct i3c_ccc_cmd *cmd;
+};
+
+/* Send CCC Command:
+ * (Directed CCC Read)
+ */
+static void svc_directed_ccc_read(struct svc_ccc_ctx *ctx)
+{
+	ctx->p_i3c_xfer->count = 1;
+	ctx->p_i3c_xfer->p_data = &ctx->cmd->id;
+	ctx->p_i3c_xfer->stop = 0;
+	ctx->p_i3c_xfer->allow_ibi = 1;
+
+	init_completion(&ctx->p_i3c_xfer->comp);
+
+	spin_lock(&ctx->master->access_lock);
+
+	ctx->ret = svc_i3c_write((void *)ctx->master, (void *)ctx->p_i3c_xfer);
+	if (ctx->ret == SVC_DRV_ERR_NONE) {
+		if (!wait_for_completion_timeout(&ctx->p_i3c_xfer->comp
+		, XFER_TIMEOUT)) {
+			svc_i3c_abort((void *)ctx->master, ctx->p_i3c_xfer);
+			ctx->status = -ETIMEDOUT;
+		} else {
+			ctx->status = 0; // Success
+		}
+	} else {
+		svc_i3c_abort((void *)ctx->master, ctx->p_i3c_xfer);
+		ctx->status = ctx->ret;
+	}
+
+	if (ctx->status == 0) {
+		ctx->status = -1; // reset to error condition
+
+		// Read Data
+		ctx->ret = svc_i3c_get_device_index_from_address((void *)
+		ctx->master, ctx->cmd->dests[0].addr);
+
+		if (ctx->ret >= 0) {
+			ctx->p_i3c_xfer->dev_id = (u8)ctx->ret;
+			ctx->p_i3c_xfer->type = I3C_XFER_TYPE_I3C_READ;
+			ctx->p_i3c_xfer->count = ctx->cmd->dests[0].payload.len;
+			ctx->p_i3c_xfer->p_data =
+				ctx->cmd->dests[0].payload.data;
+			ctx->p_i3c_xfer->stop = 1;
+			ctx->p_i3c_xfer->allow_ibi = 0;
+
+			reinit_completion(&ctx->p_i3c_xfer->comp);
+
+			ctx->ret = svc_i3c_read((void *)ctx->master,
+						(void *)ctx->p_i3c_xfer);
+			if (ctx->ret == SVC_DRV_ERR_NONE) {
+				if (!wait_for_completion_timeout(&
+				ctx->p_i3c_xfer->comp, XFER_TIMEOUT)) {
+					svc_i3c_abort((void *)ctx->master,
+						      ctx->p_i3c_xfer);
+				ctx->status = -ETIMEDOUT;
+				} else {
+					// Success
+					ctx->status = 0;
+				}
+			} else {
+				svc_i3c_abort((void *)ctx->master,
+					      ctx->p_i3c_xfer);
+				ctx->status = ctx->ret;
+			}
+		}
+	}
+	spin_unlock(&ctx->master->access_lock);
+}
+
+/* Send CCC Command:
+ * (Broadcast CCC Read)
+ */
+static void svc_broadcast_ccc_write(struct svc_ccc_ctx *ctx)
+{
+	// Add one for CCC + payload
+	ctx->p_i3c_xfer->count = ctx->cmd->dests[0].payload.len + 1;
+
+	// Allocate a transfer buffer
+	ctx->p_xfer_buf = kzalloc(ctx->p_i3c_xfer->count, GFP_KERNEL);
+	if (ctx->p_xfer_buf) {
+		ctx->p_xfer_buf[0] = ctx->cmd->id;
+		ctx->p_data = (u8 *)ctx->cmd->dests[0].payload.data;
+		for (ctx->i = 1; ctx->i < ctx->p_i3c_xfer->count; ctx->i++)
+			ctx->p_xfer_buf[ctx->i] = ctx->p_data[ctx->i - 1];
+
+		ctx->p_i3c_xfer->p_data = ctx->p_xfer_buf;
+		ctx->p_i3c_xfer->stop = 1;
+		ctx->p_i3c_xfer->allow_ibi = 1;
+
+		init_completion(&ctx->p_i3c_xfer->comp);
+
+		spin_lock(&ctx->master->access_lock);
+
+		ctx->ret = svc_i3c_write((void *)ctx->master,
+					 (void *)ctx->p_i3c_xfer);
+		if (ctx->ret == SVC_DRV_ERR_NONE) {
+			if (!wait_for_completion_timeout(&ctx->p_i3c_xfer->comp
+			, XFER_TIMEOUT)) {
+				svc_i3c_abort((void *)ctx->master,
+					      ctx->p_i3c_xfer);
+				ctx->status = -ETIMEDOUT;
+			} else {
+				ctx->status = 0; // Success
+			}
+		} else {
+			svc_i3c_abort((void *)ctx->master, ctx->p_i3c_xfer);
+			ctx->status = ctx->ret;
+		}
+
+		spin_unlock(&ctx->master->access_lock);
+
+		kzfree(ctx->p_xfer_buf);
+	} else {
+		ctx->status = -ENOMEM;
+	}
+}
+
+/* Send CCC Command:
+ * (Directed CCC Write)
+ */
+static void svc_directed_ccc_write(struct svc_ccc_ctx *ctx)
+{
+	ctx->p_i3c_xfer->count = 1;
+	ctx->p_i3c_xfer->p_data = &ctx->cmd->id;
+	ctx->p_i3c_xfer->stop = 0;
+	ctx->p_i3c_xfer->allow_ibi = 1;
+
+	init_completion(&ctx->p_i3c_xfer->comp);
+
+	spin_lock(&ctx->master->access_lock);
+
+	ctx->ret = svc_i3c_write((void *)ctx->master, (void *)ctx->p_i3c_xfer);
+	if (ctx->ret == SVC_DRV_ERR_NONE) {
+		if (!wait_for_completion_timeout(&ctx->p_i3c_xfer->comp,
+						 XFER_TIMEOUT)) {
+			svc_i3c_abort((void *)ctx->master, ctx->p_i3c_xfer);
+			ctx->status = -ETIMEDOUT;
+		} else {
+			// Success
+			ctx->status = 0;
+		}
+	} else {
+		svc_i3c_abort((void *)ctx->master, ctx->p_i3c_xfer);
+		ctx->status = ctx->ret;
+	}
+
+	if (ctx->status == 0) {
+		// reset to error condition
+		ctx->status = -1;
+
+		ctx->ret = svc_i3c_get_device_index_from_address((void *)
+		ctx->master, ctx->cmd->dests[0].addr);
+
+		if (ctx->ret >= 0) {
+			ctx->p_i3c_xfer->dev_id = (u8)ctx->ret;
+			ctx->p_i3c_xfer->type = I3C_XFER_TYPE_I3C_WRITE;
+			ctx->p_i3c_xfer->count = ctx->cmd->dests[0].payload.len;
+			ctx->p_i3c_xfer->p_data =
+				ctx->cmd->dests[0].payload.data;
+			ctx->p_i3c_xfer->stop = 1;
+			ctx->p_i3c_xfer->allow_ibi = 0;
+
+			reinit_completion(&ctx->p_i3c_xfer->comp);
+
+			ctx->ret = svc_i3c_write((void *)ctx->master,
+						 (void *)ctx->p_i3c_xfer);
+			if (ctx->ret == SVC_DRV_ERR_NONE) {
+				if (!wait_for_completion_timeout(&
+				ctx->p_i3c_xfer->comp, XFER_TIMEOUT)) {
+					svc_i3c_abort((void *)ctx->master,
+						      ctx->p_i3c_xfer);
+					ctx->status = -ETIMEDOUT;
+				} else {
+					// Success
+					ctx->status = 0;
+				}
+			} else {
+				svc_i3c_abort((void *)ctx->master,
+					      ctx->p_i3c_xfer);
+				ctx->status = ctx->ret;
+			}
+		}
+	}
+
+	spin_unlock(&ctx->master->access_lock);
+}
+
+/*
+ * I3C Master Send CCC Command
+ *
+ * Called by the I3C subsystem to send a CCC command. Allocates a transfer
+ * structure, configures the transfer and calles svcI3CWrite() and svcI3CRead()
+ * according to the type of CCC being sent. Supports broadcast CCC writes and
+ * directed CCC reads and writes. Transfer must complete within the timeout
+ * specified by \ref XFER_TIMEOUT.
+ *
+ * \return 0 upon success, < 0 upon failure (-1, -ENOMEM, -ETIMEDOUT, etc.)
+ */
+static int svc_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
+				       struct i3c_ccc_cmd *arg_cmd)
+{
+	struct svc_ccc_ctx ctx;
+
+	ctx.status = -1; // General error
+	ctx.master = to_svc_i3c_master(m);
+	ctx.p_i3c_xfer = kzalloc(sizeof(*ctx.p_i3c_xfer), GFP_KERNEL);
+
+	if (!ctx.p_i3c_xfer)
+		return -ENOMEM;
+
+	// CCC is always sent as a broadcast to emit 0xFE address
+	ctx.p_i3c_xfer->type = I3C_XFER_TYPE_I3C_BCCC_WRITE;
+	ctx.cmd = arg_cmd;
+
+	if (ctx.cmd->rnw) {
+		// Directed CCC Read
+		svc_directed_ccc_read(&ctx);
+	} else {
+		if (ctx.cmd->dests[0].addr == I3C_BROADCAST_ADDR) {
+			// Broadcast CCC Write:
+			svc_broadcast_ccc_write(&ctx);
+		} else {
+			// Directed CCC Write
+			svc_directed_ccc_write(&ctx);
+		}
+	}
+
+	kzfree(ctx.p_i3c_xfer);
+
+	return ctx.status;
+}
+
+/*
+ * I3C Master Send I3C Private Transfers
+ *
+ * Called by the I3C subsystem to send I3C private transfers.
+ * Allocates a transfer structure, configures the transfer and calls
+ * svcI3CWrite() and svcI3CRead() according to the type of transfer being sent.
+ * Transfer must complete within the timeout specified by \ref XFER_TIMEOUT.
+ *
+ * \return 0 upon success, < 0 upon failure (-1, -ENOMEM, -ETIMEDOUT, etc.)
+ */
+static int svc_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
+				     struct i3c_priv_xfer *xfers, int nxfers)
+{
+	struct i3c_master_controller *m = i3c_dev_get_master(dev);
+	struct svc_i3c_master *master = to_svc_i3c_master(m);
+	struct svc_i3c_xfer_s *p_i3c_xfer;
+	int i;
+	int ret;
+
+	p_i3c_xfer = kzalloc(sizeof(*p_i3c_xfer), GFP_KERNEL);
+
+	if (!p_i3c_xfer)
+		return -ENOMEM;
+
+	spin_lock(&master->access_lock);
+
+	for (i = 0; i < nxfers; i++) {
+		if (dev->info.dyn_addr) {
+			ret = svc_i3c_get_device_index_from_address((void *)
+			master, dev->info.dyn_addr);
+		} else {
+			ret = svc_i3c_get_device_index_from_address((void *)
+			master, dev->info.static_addr);
+		}
+
+		if (ret < 0) {
+			kzfree(p_i3c_xfer);
+			spin_unlock(&master->access_lock);
+			return -ENODEV;
+		}
+
+		p_i3c_xfer->dev_id = (u8)ret;
+
+		p_i3c_xfer->count = xfers[i].len;
+
+		if (i < nxfers - 1)
+			p_i3c_xfer->stop = 0;
+		else
+			p_i3c_xfer->stop = 1;
+
+		p_i3c_xfer->allow_ibi = 1;
+
+		init_completion(&p_i3c_xfer->comp);
+
+		if (xfers[i].rnw) {
+			p_i3c_xfer->p_data = xfers[i].data.in;
+			p_i3c_xfer->type = I3C_XFER_TYPE_I3C_READ;
+			ret = svc_i3c_read((void *)master, (void *)p_i3c_xfer);
+		} else {
+			p_i3c_xfer->p_data = (u8 *)(xfers[i].data.out);
+			p_i3c_xfer->type = I3C_XFER_TYPE_I3C_WRITE;
+			ret = svc_i3c_write((void *)master, (void *)p_i3c_xfer);
+		}
+
+		if (ret == SVC_DRV_ERR_NONE) {
+			if (!wait_for_completion_timeout(&p_i3c_xfer->comp,
+							 XFER_TIMEOUT)) {
+				svc_i3c_abort((void *)master, p_i3c_xfer);
+
+				spin_unlock(&master->access_lock);
+
+				kzfree(p_i3c_xfer);
+				return -ETIMEDOUT;
+			}
+		} else {
+			svc_i3c_abort((void *)master, p_i3c_xfer);
+
+			spin_unlock(&master->access_lock);
+
+			kzfree(p_i3c_xfer);
+			return ret;
+		}
+	}
+
+	spin_unlock(&master->access_lock);
+
+	kzfree(p_i3c_xfer);
+
+	return 0;
+}
+
+/*
+ * I3C Master Attach I2C Device
+ *
+ * Called by the I3C Subsystem every time an I2C device is attached to the
+ * bus to perform any processing necessary to  attach master controller specific
+ * data to I2C devices.
+ *
+ * This function allocates device data memory and calls the I3C subsystem
+ * function i2c_dev_set_master_data().
+ */
+static int svc_i3c_master_attach_i2c_dev(struct i2c_dev_desc *dev)
+{
+	struct i3c_master_controller *m = i2c_dev_get_master(dev);
+	struct svc_i3c_master *master = to_svc_i3c_master(m);
+	struct svc_i3c_i2c_dev_data *data;
+	s32 ret;
+
+	ret = svc_i3c_add_static_device((void *)master,
+					dev->boardinfo->base.addr);
+	if (ret < 0)
+		return ret;
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
+/*
+ * I3C Master Send I2C Transfers
+ *
+ * Called by the I3C subsystem to send I2C transfers. Allocates a transfer
+ * structure, configures the transfer and calles svcI3CWrite() and svcI3CRead()
+ * according to the type of transfer being sent. Transfer must complete
+ * within the timeout specified by \ref XFER_TIMEOUT.
+ *
+ * \return 0 upon success, < 0 upon failure (-1, -ENOMEM, -ETIMEDOUT, etc.)
+ */
+static int svc_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
+				    const struct i2c_msg *xfers, int nxfers)
+{
+	struct i3c_master_controller *m = i2c_dev_get_master(dev);
+	struct svc_i3c_master *master = to_svc_i3c_master(m);
+	struct svc_i3c_i2c_dev_data *data = i2c_dev_get_master_data(dev);
+	struct svc_i3c_xfer_s *p_i3c_xfer;
+	int i;
+	int ret;
+
+	p_i3c_xfer = kzalloc(sizeof(*p_i3c_xfer), GFP_KERNEL);
+
+	if (!p_i3c_xfer)
+		return -ENOMEM;
+
+	spin_lock(&master->access_lock);
+
+	for (i = 0; i < nxfers; i++) {
+		p_i3c_xfer->dev_id = data->index;
+
+		p_i3c_xfer->count = xfers[i].len;
+		p_i3c_xfer->p_data = xfers[i].buf;
+
+		if (i < nxfers - 1)
+			p_i3c_xfer->stop = 0;
+		else
+			p_i3c_xfer->stop = 1;
+
+		p_i3c_xfer->allow_ibi = 1;
+
+		init_completion(&p_i3c_xfer->comp);
+
+		if (xfers[i].flags & I2C_M_RD) {
+			p_i3c_xfer->type = I3C_XFER_TYPE_I2C_READ;
+			ret = svc_i3c_read((void *)master, (void *)p_i3c_xfer);
+		} else {
+			p_i3c_xfer->type = I3C_XFER_TYPE_I2C_WRITE;
+			ret = svc_i3c_write((void *)master, (void *)p_i3c_xfer);
+		}
+
+		if (ret == SVC_DRV_ERR_NONE) {
+			if (!wait_for_completion_timeout(&p_i3c_xfer->comp,
+							 XFER_TIMEOUT)) {
+				svc_i3c_abort((void *)master, p_i3c_xfer);
+
+				spin_unlock(&master->access_lock);
+
+				kzfree(p_i3c_xfer);
+				return -ETIMEDOUT;
+			}
+		} else {
+			svc_i3c_abort((void *)master, p_i3c_xfer);
+
+			spin_unlock(&master->access_lock);
+
+			kzfree(p_i3c_xfer);
+			return ret;
+		}
+	}
+
+	spin_unlock(&master->access_lock);
+	kzfree(p_i3c_xfer);
+	return 0;
+}
+
+/*
+ * I3C Master IBI Request Handler
+ *
+ * Called by the I3C master driver when an IBI request event is received
+ * from a device. Allows the IBI to occur by starting the IBI process
+ * in the driver if nothing else is going on.
+ *
+ * \note Executes in interrupt context.
+ */
+static int svc_i3c_master_ibi_request_handler(struct svc_i3c_master *master)
+{
+	int status;
+
+	spin_lock(&master->access_lock);
+	status = svc_i3c_control_set((void *)master, I3C_CTRL_START_IBI, 0);
+	if (status != SVC_DRV_ERR_NONE) {
+		/* This is an attempt to clear the IBI.
+		 * In all likelihood, the IBI start call above failed due to a
+		 * busy condition. We really should never get an IBI request in
+		 * that case, but the only remedy we may have is to NACK
+		 * the IBI if it is possible. Likely cannot even NACK if we
+		 * are busy, but try anyway.
+		 */
+		svc_i3c_control_set((void *)master, I3C_CTRL_NACK_IBI, 0);
+	}
+
+	spin_unlock(&master->access_lock);
+	return status;
+}
+
+/*
+ * I3C Master IBI Request Handler
+ *
+ * Called by the I3C master driver when an IBI complete event is received
+ * from a device. Copies the IBI date to the previously allocated pool and
+ * queue's the IBI to the I3C subsystem.
+ *
+ * \note Executes in interrupt context.
+ *
+ */
+static int svc_i3c_master_ibi_complete_handler(struct svc_i3c_master *master)
+{
+	struct svc_i3c_i2c_dev_data *data;
+	struct i3c_dev_desc *dev;
+	struct i3c_ibi_slot *slot;
+	unsigned int i;
+	int ret = -1;
+
+	// Process the IBI upon completion
+
+	// Find the slave in the IBI device table by comparing the received
+	// IBI address to the dynamic addresses in the table
+	for (i = 0; i < master->ibi.num_ibi_devices; i++) {
+		dev = master->ibi.dev_desc[i];
+
+		if (dev->info.dyn_addr == master->p_dev->ibi_dev_addr) {
+			// Copy the data to the pool
+
+			data = i3c_dev_get_master_data(dev);
+
+			slot = i3c_generic_ibi_get_free_slot(data->ibi_pool);
+			if (slot) {
+				memcpy(slot->data, master->p_dev->ibi_data,
+				       master->p_dev->ibi_idx);
+
+				slot->len = master->p_dev->ibi_idx;
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
+/*
+ * I3C Master Request IBI
+ *
+ * Called by the I3C subsystem to attach an IBI handler to an I3C
+ * device.
+ */
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
+	if (IS_ERR(data->ibi_pool))
+		return PTR_ERR(data->ibi_pool);
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
+	if (i < master->ibi.num_ibi_devices)
+		return 0;
+
+	i3c_generic_ibi_free_pool(data->ibi_pool);
+	data->ibi_pool = NULL;
+
+	return -ENOSPC;
+}
+
+/*
+ * I3C Master Free IBI
+ *
+ * Called by the I3C subsystem to free/release an IBI handler from
+ * an I3C device previously attached with \ref svc_i3c_master_request_ibi().
+ */
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
+/*
+ * I3C Master Enable IBI
+ *
+ * Called by the I3C subsystem to enable IBI's from a device.
+ * Issues the ENEC CCC command to the I3C device.
+ */
+static int svc_i3c_master_enable_ibi(struct i3c_dev_desc *dev)
+{
+	struct i3c_master_controller *m = i3c_dev_get_master(dev);
+	int ret;
+
+	ret = i3c_master_enec_locked(m, dev->info.dyn_addr, I3C_CCC_EVENT_SIR);
+
+	return ret;
+}
+
+/*
+ * I3C Master Disable IBI
+ *
+ * Called by the I3C subsystem to disable IBI's from a device
+ * Issues the DISEC CCC command to the I3C device.
+ */
+static int svc_i3c_master_disable_ibi(struct i3c_dev_desc *dev)
+{
+	struct i3c_master_controller *m = i3c_dev_get_master(dev);
+	int ret;
+
+	ret = i3c_master_disec_locked(m, dev->info.dyn_addr, I3C_CCC_EVENT_SIR);
+
+	return ret;
+}
+
+/*
+ * I3C Master Recycle IBI Slot
+ *
+ * Called by the I3C subsystem every time an IBI has been processed by its
+ * handler to free the IBI slot from the IBI slot pool.
+ */
+static void svc_i3c_master_recycle_ibi_slot(struct i3c_dev_desc *dev,
+					    struct i3c_ibi_slot *slot)
+{
+	struct svc_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
+
+	i3c_generic_ibi_recycle_slot(data->ibi_pool, slot);
+}
+
+/*
+ * Silvaco I3C DRM Driver Methods
+ *
+ * Defines the methods exposed to the I3C subsystem.
+ */
+static const struct i3c_master_controller_ops svc_i3c_master_ops = {
+	.bus_init = svc_i3c_master_bus_init,
+	.bus_cleanup = svc_i3c_master_bus_cleanup,
+	.attach_i3c_dev = svc_i3c_master_attach_i3c_dev,
+	//.reattach_i3c_dev = svc_i3c_master_reattach_i3c_dev,
+	//.detach_i3c_dev = svc_i3c_master_detach_i3c_dev,
+	.do_daa = svc_i3c_master_do_daa,
+	.supports_ccc_cmd = svc_i3c_master_supports_ccc_cmd,
+	.send_ccc_cmd = svc_i3c_master_send_ccc_cmd,
+	.priv_xfers = svc_i3c_master_priv_xfers,
+	.attach_i2c_dev = svc_i3c_master_attach_i2c_dev,
+	//.detach_i2c_dev = svc_i3c_master_detach_i2c_dev,
+	.i2c_xfers = svc_i3c_master_i2c_xfers,
+	.request_ibi = svc_i3c_master_request_ibi,
+	.free_ibi = svc_i3c_master_free_ibi,
+	.enable_ibi = svc_i3c_master_enable_ibi,
+	.disable_ibi = svc_i3c_master_disable_ibi,
+	.recycle_ibi_slot = svc_i3c_master_recycle_ibi_slot,
+};
+
+/*
+ * Silvaco I3C DRM Driver Probe
+ *
+ * Executed by the kernel upon detection of master in the device tree.
+ * - Allocates memory for the driver control block
+ * - Registers the I/O memory space for hardware register access
+ * - Initializes the driver configuration to default values
+ * - Initializes clocks and IRQ
+ * - Initializes platform driver data
+ * - Initializes IBI data
+ * - Registers the master with the I3C Subsystem
+ */
+static int svc_i3c_master_probe(struct platform_device *pdev)
+{
+	struct svc_i3c_master *master;
+	struct resource *res;
+	int ret, irq;
+	int reg;
+	struct device_node *np = pdev->dev.of_node;
+	void *p_tmp;
+
+	// Allocate memory for the master:
+	master = devm_kzalloc(&pdev->dev, sizeof(*master), GFP_KERNEL);
+	if (!master)
+		return -ENOMEM;
+
+	// Allocate memory for the svc specific device control block:
+	master->p_dev = devm_kzalloc(&pdev->dev, sizeof(struct svc_i3c_dev_s),
+				     GFP_KERNEL);
+	if (!(master->p_dev))
+		return -ENOMEM;
+
+	// Map the register space to driver I/O:
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	master->regs = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(master->regs))
+		return PTR_ERR(master->regs);
+
+	spin_lock_init(&master->access_lock); // initialize the multicore lock
+
+	// Initialize the driver parameters
+	svc_i3c_initialize((void *)master, master->p_dev, 0, 0);
+
+	// Initialize the clocks
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
+	p_tmp = of_get_property(np, "svc,i3c-pp-clk-div", NULL);
+	if (p_tmp) {
+		if (*(u32 *)p_tmp) {
+			// must be > 0
+			master->i3c_pp_clk_div = (u32)be32_to_cpup(p_tmp);
+		}
+	}
+
+	p_tmp = of_get_property(np, "svc,i3c-od-clk-div", NULL);
+	if (p_tmp) {
+		if (*(u32 *)p_tmp) {
+			// must be > 0
+			master->i3c_od_clk_div = (u32)be32_to_cpup(p_tmp);
+		}
+	}
+
+	p_tmp = of_get_property(np, "svc,i2c-clk-div", NULL);
+	if (p_tmp) {
+		if (*(u32 *)p_tmp) {
+			// must be > 0
+			master->i2c_clk_div = (u32)be32_to_cpup(p_tmp);
+		}
+	}
+
+	// Init daa completion
+	init_completion(&master->daa_complete);
+
+	// IBI Inititialization
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
+	// Register the master
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
+/*
+ * Silvaco I3C DRM Driver Removal
+ *
+ * Executed by the kernel upon removal of the master device
+ * driver.
+ */
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
+	{ /* sentinel */ },
+};
+
+static struct platform_driver svc_i3c_master = {
+	.probe = svc_i3c_master_probe,
+	.remove = svc_i3c_master_remove,
+	.driver = {
+		.name = "svc-i3c-master",
+		.of_match_table = svc_i3c_master_of_match_tbl,
+	},
+};
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
