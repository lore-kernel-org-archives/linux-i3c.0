Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B727C44536
	for <linux-i3c@archiver.kernel.org>; Thu, 22 Jan 2026 03:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tK1BNhGHnpLhr3YhIudcJ9rleAyrNuhZlx9JBgmo4x8=; b=vUnYX++wU0QNYY
	vhi2zLeTTpyXBqSjyeXudlm+mANAI7bIWU/pI7DrfsLMbNq0iRCFbt/n9zYOBOY2OtNCPMyta1br3
	3Q98BKIqeSvN36ZNu63JUQ6QTpfGzxQ073MZu22+Dj939Z1+BWLEpw7nEVIDr+7YS8H06wIuYI+wQ
	idBN2px1EqqROtpILDqyNhTSE5BqkwcmrDmn2J+ILQX5S4LM3GtTluSesefNmmUfKYc5EcqmB2XIQ
	uYQb05YYayAE9dLCe3/jQ2xUEx1Qp/7yQUMQApXg8Pav4vZ6y4QPn6SEBIMGGanW5Ykg3UjZJRPvb
	mx9Qlyk9DCVguwSPONEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vikyL-00000006LrV-0iel;
	Thu, 22 Jan 2026 03:03:01 +0000
Received: from mail-westus2azon11012004.outbound.protection.outlook.com ([52.101.48.4] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vikyI-00000006Lr8-0neu
	for linux-i3c@lists.infradead.org;
	Thu, 22 Jan 2026 03:02:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JA5SD4znuZyUbqykma0tlgPx8qwi5yo2czTYHR1Oq48t2n48Mf7zw1mzJgq8KJzacZiIcICY4ds9ceY7YWu+UcsfMBiJvFxWL40JzGFyjc0VtQK6y7v9OCnRst4Tu8ZNua1CrCyM4RVs+20VRUCZdUdqTrBHJkHYXidwoPbQOiBJZTD0yJbI7HHK/FCppaA66VElyPEA0BpvIR/r9n7iIIoLs81Xx2mQmVLE9SHL0qoiX4kT24gLG0VLiX303PsaYL/lVdPDFKANmC/PN0XqxaUbAgkYHHkK29+X836TpVDUcaVuVf6ni78V8ifJtiNNe31OXaq6I9dnlOWOXbLDmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KaVvIt5ACXrtvID9aEytkZgBKIMbtyb1KxHI8lhbsZk=;
 b=oZHOYKDXVua6lb79czXZSbsSnmcw8Q2uEB6dJtgoRtvYXl8QIJfwMKrkHwDZiYMUrnnRTQ4h7xLfttRTHyQks6qA8F7pgMDcCIG+ugcLeNcGzFpg+Rui3Hu6CaNVCViG8YTZaecBkLiPOR1vZup+6WNV/g3+2ar+Ek2UU/qKaVZSdBrdXAQWoYEl0pTIboFXdsGrVRT8Y0CGruWCidgEnyTJDH1llRsLYvH4cJtvwU93yTXxZxiMbhashsEHv7y59hAvaD0wGjObB0of4nQ+rgKpmPXJe+Gd5Gs5P4DT/HC6HVfovk8NPOeZ4i5TZ5Zz9808CqVPPW7v3tjFEFYlvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KaVvIt5ACXrtvID9aEytkZgBKIMbtyb1KxHI8lhbsZk=;
 b=FKiUN1EFhccnKRR8bPlw+VbzhxA+1euOhxEIvNLz7UUaXe3I1bAnT3PYb8T07/BawkMplEV3Jhsurfz5/XnJHFYsV6+DDZbZ2yQWBYZZzTNluQkWOzcNLhFwBzGrvQ2VPFu7oAeFJEKfcAht9xYegKKs0H+6ZSBvI+3ANiqzKj7v+WYKr7MvgJWat2Z4hEzaZFo4l0vIS9L+PjFJtWOTKIC2gHmkgayeKDdv5F1yibQED1TPKCtk/D3thXq2ujrFN+v8mKrbDHQEmTro21BJCxdYsOqgXPyW4oy57kInTSeGc0PLmnpnDQ/oRGyy4BG5IwIQGmk1bkDMGSxe+RaylA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 DSWPR03MB989104.namprd03.prod.outlook.com (2603:10b6:8:35e::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.9; Thu, 22 Jan 2026 03:02:52 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 03:02:52 +0000
From: adrianhoyin.ng@altera.com
To: alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [PATCH] i3c: dw-i3c-master: fix SIR reject bit mapping for dynamic addresses
Date: Thu, 22 Jan 2026 19:08:15 +0800
Message-ID: <2362f68b74f2a2d930ca80131d573f4078e2f425.1769047347.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
X-ClientProxiedBy: KU0P306CA0064.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:23::6) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|DSWPR03MB989104:EE_
X-MS-Office365-Filtering-Correlation-Id: a141549b-ed67-4930-fc98-08de5962bbc9
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NRBDvcdyzV3kLmALodW+hEmU3RzuNnkZ39NtpUm56ZxuLQJ1LO6liyLTCmFZ?=
 =?us-ascii?Q?mRQvToihy8vM3+Tdj3NXwIgw7yXwEB0ssrupCw72ZJcpD0bL6ztMmxUzVkT+?=
 =?us-ascii?Q?BWEAX379yuZpyO3leRYYpmaYcXpjJ8hlK3uFbIUPHDawSGMpsyMXiOzz+9va?=
 =?us-ascii?Q?pllYUIGF1sM3X7T1fkyoH6kYuBw0ok6J8CjHYebt4+iRozVnpm8uSGTecxei?=
 =?us-ascii?Q?7SKWUX3GiKJzgy9ASfJpdlC6gBvr8zDxzee4qTD9/svzWYjlwKZnoucQUDrl?=
 =?us-ascii?Q?TvwPvf6DM8wOxbHUsaBB0m+zNjTc2MQ3HLmfGTNx8bdG1uM/d2cOFvmwuxl5?=
 =?us-ascii?Q?U0bEOYzs6Nrdr+qbgt1yn4tXyF6jwJnaOvFqUc8teSNOU6b6TG27eS+ROUbQ?=
 =?us-ascii?Q?sgwMzhyXK4kamaWyUyrOtxoO9tkKuRRyK406IQ+s1z2JB38v3PnsAkS40HgR?=
 =?us-ascii?Q?PI/JnK95q509hVg7ljYVVAyV9BeziHwr4ed7lObJ6ncyoZctUvCPafQ7EnU2?=
 =?us-ascii?Q?+0CP+dk81OgzzsIrkatL0hNXz9SahR2GzZhmGxyWJHIuMDB1e/q2T9Wvj5jt?=
 =?us-ascii?Q?1LRqVEPaHYYO0Z8ZyH4rpUBxQdfL1eZl22g/okgcHWSffAbNFfcK83gF/5FY?=
 =?us-ascii?Q?7BoiR69PqIWv+EVTmZe89jDDJH453ijih0w+rheG4TJKtShY6ZLUjXyGuznZ?=
 =?us-ascii?Q?aQOdtAZxwGBQHFoEqy1kzeWiCDfImi7F5Ht4VW86o+2nxfZt0q2uV3xcfF83?=
 =?us-ascii?Q?KpcIz0m1m2JpyYYeo0N45/hmvRJDR9RWXVs/CKesKnP6aExr4+BkkhBywB9l?=
 =?us-ascii?Q?fJtJnUDAQ4KjHO4O+OzPKsYOYfmddbrJvY2IqMSq8jQ8BRPUM6JsiXF/uUac?=
 =?us-ascii?Q?Epryt7P4yxNSqcXscJR8fbrUEj5U/621EVOIHSZ2W/xgqCKrLoeh94eGfIcI?=
 =?us-ascii?Q?RSHGw3KZqCADhIIDtE53zH9H/4/CRNmmzuszeHc6kVGiIYZ3RbiirnV3fd0t?=
 =?us-ascii?Q?AIzNDqzlfo60ypY7LxICkNRXUgc+p9FQX8hFhMeQyu5qQSQWo1+ZwZKcf9tx?=
 =?us-ascii?Q?lJ/e5sLEFohovsG4IhzGs3cvr7GE+7MWvoRjFsQ9iy59mkIv3lj4AAZdmnHs?=
 =?us-ascii?Q?DIvnmCm4uereC8ybrTgSWJObIFcsgo35THBU4zImCr/4I6MjkgvVbfUBEc6b?=
 =?us-ascii?Q?6vmTwbLE286toyhnXcQ9NeF1WLEeNS+Ge+fiXNf14PvlegWkAMePy3rBzs7q?=
 =?us-ascii?Q?dRWTcfqF0kalteymndOOhGRtFS9YU6acTLI5ljEmIw5NbRocKST2tGhXIoPC?=
 =?us-ascii?Q?zhxgogvo+MQ5QyNesn8aSCj8Tyd4HLamM3XCao0PiATsi5g/9SfMW6Zt/Vjl?=
 =?us-ascii?Q?SvvyYCqSBIycdYQQ0wjF8iYpxVewPpz82vlUMFSgfThPO6fFw0kmqCiyNi1d?=
 =?us-ascii?Q?6RJbRAVsHmwH49/OuEWHDgnFhTZ3OcMKO4/FA0cj5T7hS6XZQL2s9UOsxGM2?=
 =?us-ascii?Q?x3lqsoAugKM4uw4EKtSXLIIsJkz22ikxHctguOGUs4XgsXy4vgxnBmW3peJ9?=
 =?us-ascii?Q?MZ3cXeJIsqFbet5kNl0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MZfSzcfuklEyIIJgrR3WTIh2v4OuYhERwod0MoQDuGU5fgD82UJRmVh6NTTS?=
 =?us-ascii?Q?S/UuXTeuLMqBQEMvPkrEWnPZDEr+PIZ+i6AhJdbjhnPkYoaXmhNjzaS9hTAT?=
 =?us-ascii?Q?ooHUO57im33xZsz+lMZcWV7EpEFkFaFMsSprqff259nQpFCqggH0iCD032iP?=
 =?us-ascii?Q?24Z5tU1hPoAhOk8+3uPCtXDz7CjXcz33pCFtKYlaOMHTcj//msp4+d4JIi6r?=
 =?us-ascii?Q?bVW+R0D9Hx33r0Ti+flBRdbk8Qab2QVgu8NDqZyJAhezQwqhQKdJK7fUPbip?=
 =?us-ascii?Q?uvpP3NgJ1kW/wyBejQg8jT4c7wWYAfITOqHe1Alc9MDA0VCh637EWByzMILF?=
 =?us-ascii?Q?wKRwDiUKFak1gJKIg3fHlhGTXxqxR1aQnIXGfGbv+tZSqZWuD2seg0KFxBl7?=
 =?us-ascii?Q?b9etARcUC/HvDME+in90wwM5nSmJTyP1naobi3Fj+3QbrJNcG+CtOUL5Utvq?=
 =?us-ascii?Q?55Z0xfHx4v+AHR+Fdz3BNWJb28qqlS++e/Jh/ZKnPJLLUTFtqNuEvd8XUq06?=
 =?us-ascii?Q?aTpR3XN91cSBZYKtaRxtrd9/TPvsJEjyrG32d/ndmdTXcNMzgyY+IFYPA4/q?=
 =?us-ascii?Q?fyJU4LIZnVZNfjbLKMAaIyjI6J4Z5fMGv3mLTSbXXBFJhLKzU3oWfq9NzAsY?=
 =?us-ascii?Q?jfM43ji8sGH4eR4Q7dAImJBBVQscDQYYTKijB+KC8+d0o8vVqRusDSq7UlZL?=
 =?us-ascii?Q?zTfFi6sXca6vate/E6PXiTPjWkvb9EyEVPf/wbt/eKVFt0ftdiANekaGNecg?=
 =?us-ascii?Q?pUEN9hHcUIoOxOA2bxoB+muXY8QzykcYk3OEDEeZBZFd98VvZ97WfHaNJNuM?=
 =?us-ascii?Q?5cy8ZCeKKQQEiBELZ5AyUGBXd3POVqADbMjx3PIS/GgXcJjU75VcecuR1pPR?=
 =?us-ascii?Q?bjjilcyC9b0/TDQOXzQ1a7qne5nsRYIzJyK39KCfr9c/emLdOIdpaei82kO8?=
 =?us-ascii?Q?wa/UnVKVN6+YSh7rDwB7L1ar7CpDIz8cBAca5aRffEPZKFvCMhm/TlCHpgFM?=
 =?us-ascii?Q?iwJYlWS9o5rd1FY5hg8Ikp4O983dDs5B6XGRATrC+PmVKnLTYggucOJ8u1LM?=
 =?us-ascii?Q?TrnlPC2sksoRY9Fpkla2/KrLv+n9pDwD+rf2YLMnSVSvvrd6leRK7jaWOKUX?=
 =?us-ascii?Q?sqk/hXKJcCWU/3sZ9BCHyifEs40ehZ7RL12M0YeUMm39x8/jQE5Uf6WM1zUZ?=
 =?us-ascii?Q?BxPYEXV4jLKITy5/+XGE5JO3wROoadupxRVcXt7q/mARWcIHvBH2HjSktGZr?=
 =?us-ascii?Q?mn77HJaGPYhnQUnqBR1JsFU9VwwyRIjucUK9hi/8lOzQnSMWR39jnOWBiPHi?=
 =?us-ascii?Q?cfLgR+wyBd0hMG2Vo5p3xI4WLt7B3lAso45GeCnhX4ltKC4mSs3NDatdtpyO?=
 =?us-ascii?Q?YBTVdL9ykthDIFdtK6Ph7qlugpPZ70K6TU7LZEKVEEyoA6pm+My1C3ReJU8J?=
 =?us-ascii?Q?L0zKgxKHUU3POI+QHGezORobLjUd/ngD7p8Dd/jnetnHrK39x/Ov0nTL3ED/?=
 =?us-ascii?Q?7YhwTlVpYdKKOlB2hFipa77XRE+cDy6uo/XbfHgv73JY/gqVyr0/G0Z2atXo?=
 =?us-ascii?Q?I1/DIvOb0amWXTlwpQq/zfayXmpEpxOy0hrnYHsYLIZrtvQBgw0H4NR5ROed?=
 =?us-ascii?Q?6IJvMQd35y6ilwlQmu7RNNxoOehTIArGtviM20Kn7TwkGx8VD2dvaGOXnZYE?=
 =?us-ascii?Q?OcBesb9jMtrj2AhfCku6ixlX2YNoX2/Wa/bUAJF5Cgw2bucYa/5RJzHdFMQV?=
 =?us-ascii?Q?luQFaIqfFOfwyZheJNLVbdHUJV44AnY=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a141549b-ed67-4930-fc98-08de5962bbc9
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 03:02:52.6515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SUBkR3l26OKaOTU9o6vy9Netx4Xzcn6Ysqaj5t2S+H09FgTFlclrs56BNiqjx35FDi66VpaPn5UqtSq8GdKC9ny/W/HBE7kuks9YVNixj0k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR03MB989104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_190258_248112_F30C20D8 
X-CRM114-Status: GOOD (  14.86  )
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

From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>

The IBI_SIR_REQ_REJECT register is a 32-bit bitmap indexed by the
dynamic address of each I3C slave. The DesignWare controller derives
the bit index by folding the 7-bit dynamic address into a 5-bit value,
using the sum of the lower 5 bits and the upper 2 bits, modulo 32.

The current implementation incorrectly uses the device table index
when updating the SIR reject mask, which can result in rejecting or
accepting IBIs for the wrong device.

Compute the SIR reject bit index directly from the dynamic address,
as defined by the controller specification, and use it consistently
when updating the reject mask.

Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
---
 drivers/i3c/master/dw-i3c-master.c | 31 +++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 48af00659e19..ea2c13c97c0d 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -205,6 +205,12 @@
 #define EXTENDED_CAPABILITY		0xe8
 #define SLAVE_CONFIG			0xec
 
+#define DYN_ADDR_LO_BITS 5       /* lower 5 bits of 7-bit dynamic address */
+#define DYN_ADDR_HI_BITS 2       /* upper 2 bits of 7-bit dynamic address */
+#define DYN_ADDR_LO_MASK GENMASK(DYN_ADDR_LO_BITS - 1, 0)
+#define DYN_ADDR_HI_MASK GENMASK(DYN_ADDR_LO_BITS + DYN_ADDR_HI_BITS - 1, DYN_ADDR_LO_BITS)
+#define IBI_SIR_BIT_MOD 32       /* 32-bit vector */
+
 #define DW_I3C_DEV_NACK_RETRY_CNT_MAX	0x3
 #define DEV_ADDR_TABLE_DEV_NACK_RETRY_MASK   GENMASK(30, 29)
 #define DEV_ADDR_TABLE_DYNAMIC_MASK		GENMASK(23, 16)
@@ -217,6 +223,7 @@
 #define DEV_ADDR_TABLE_DYNAMIC_ADDR(x) FIELD_PREP(DEV_ADDR_TABLE_DYNAMIC_MASK, x)
 #define DEV_ADDR_TABLE_STATIC_ADDR(x) FIELD_PREP(DEV_ADDR_TABLE_STATIC_MASK, x)
 #define DEV_ADDR_TABLE_LOC(start, idx)	((start) + ((idx) << 2))
+#define DEV_ADDR_TABLE_GET_DYNAMIC_ADDR(x) FIELD_GET(DEV_ADDR_TABLE_DYNAMIC_MASK, x)
 
 #define I3C_BUS_SDR1_SCL_RATE		8000000
 #define I3C_BUS_SDR2_SCL_RATE		6000000
@@ -264,6 +271,14 @@ struct dw_i3c_drvdata {
 	u32 flags;
 };
 
+static inline u32 get_ibi_sir_bit_index(u8 addr)
+{
+	u32 lo = addr & DYN_ADDR_LO_MASK;
+	u32 hi = (addr & DYN_ADDR_HI_MASK) >> DYN_ADDR_LO_BITS;
+
+	return (lo + hi) % IBI_SIR_BIT_MOD;
+}
+
 static bool dw_i3c_master_supports_ccc_cmd(struct i3c_master_controller *m,
 					   const struct i3c_ccc_cmd *cmd)
 {
@@ -1246,11 +1261,21 @@ static void dw_i3c_master_set_sir_enabled(struct dw_i3c_master *master,
 	unsigned long flags;
 	u32 dat_entry, reg;
 	bool global;
+	u8 dynamic_addr;
 
 	dat_entry = DEV_ADDR_TABLE_LOC(master->datstartaddr, idx);
 
 	spin_lock_irqsave(&master->devs_lock, flags);
 	reg = readl(master->regs + dat_entry);
+	dynamic_addr = DEV_ADDR_TABLE_GET_DYNAMIC_ADDR(reg);
+
+	if (!dynamic_addr) {
+		dev_warn(master->dev,
+			 "<%s> unassigned slave device, dynamic addr:%x\n",
+			 __func__, dynamic_addr);
+		goto unlock_out;
+	}
+
 	if (enable) {
 		reg &= ~DEV_ADDR_TABLE_SIR_REJECT;
 		if (dev->info.bcr & I3C_BCR_IBI_PAYLOAD)
@@ -1263,11 +1288,11 @@ static void dw_i3c_master_set_sir_enabled(struct dw_i3c_master *master,
 
 	if (enable) {
 		global = (master->sir_rej_mask == IBI_REQ_REJECT_ALL);
-		master->sir_rej_mask &= ~BIT(idx);
+		master->sir_rej_mask &= ~BIT(get_ibi_sir_bit_index(dynamic_addr));
 	} else {
 		bool hj_rejected = !!(readl(master->regs + DEVICE_CTRL) & DEV_CTRL_HOT_JOIN_NACK);
 
-		master->sir_rej_mask |= BIT(idx);
+		master->sir_rej_mask |= BIT(get_ibi_sir_bit_index(dynamic_addr));
 		global = (master->sir_rej_mask == IBI_REQ_REJECT_ALL) && hj_rejected;
 	}
 	writel(master->sir_rej_mask, master->regs + IBI_SIR_REQ_REJECT);
@@ -1275,7 +1300,7 @@ static void dw_i3c_master_set_sir_enabled(struct dw_i3c_master *master,
 	if (global)
 		dw_i3c_master_enable_sir_signal(master, enable);
 
-
+unlock_out:
 	spin_unlock_irqrestore(&master->devs_lock, flags);
 }
 
-- 
2.49.GIT


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
