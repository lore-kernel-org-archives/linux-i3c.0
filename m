Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A270C4453D
	for <linux-i3c@archiver.kernel.org>; Thu, 23 Jul 2026 02:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tTPJwH5dzdeLCbQ3In3T8IQ7mT9U1QAk13fXecZG++8=; b=mVC1Bc0O2OWPZB
	jVupEIEpSWo9m00qxrCfax3QnR9Yz8dE508EtlP4YB55jxJoGZRAV+npALpbG1iN12wqXPqojjruO
	4KEf+B5SI98mkoQvsF06B+/UX1FkqqFHB93NhJgQcP/WaH2ZezD/M8EUCr1Qvy7L6jOlFDTL9axOw
	AW42kpMAheNIc7w77aV0l7qEC7Ux2Dc+a9j9GUP78wjna5SQqQVcUeSzumy0GBSHO1hCg4b9huCJu
	GCGVFSp27NYQg7G7dvcQNOMT01Sv9gOHGkGKAgjiGYYCoSSkfSm9FPoV7BhgwnxamFkKGm0ABOzfJ
	IAKC+CGXkmYN1t5OIEcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmjd6-0000000DGvs-0L3I;
	Thu, 23 Jul 2026 02:57:48 +0000
Received: from mail-southcentralusazon11013015.outbound.protection.outlook.com ([40.93.196.15] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmjd2-0000000DGvX-46Wy
	for linux-i3c@lists.infradead.org;
	Thu, 23 Jul 2026 02:57:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lb55QRhvwDUPQVrYs5T1jv4YLgmA5jULqr4oB35+fFndIz21elXKU7aF+ySFzHv2oU/wvxKwP5gukdN0kD92aLWlGR7ftelxcD6ELQsyTveBCgqx3i/wiqQcYgBuN7ku1c14REBSd6qenhcnoDDrDPVI60PLA3FrChDnTosgIO0FxFSfCwDXO4aTWA0bm7EFhxs5oKcKCZvEq+aoLd6at1wl82odbgKVSXgZG6dXp2aYOMN2MY29ujtEg3QmsyeOYk4Av1ycOJImTywoKmknZAzKZKxKUMnLydkBOaLv7RvvR1pX6/5a3YZS8Bc1dMnjNxk9aX/b88puSEU75sosmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3wD8Wna3M1ipIYXq8TopWjSuAA+qR+gDHy9T8Mcack4=;
 b=EoRZm2HXnesI6Fqb4Q4c4pllx1FQwjiWaxoyOO7hF9yc94+Y40C0NLksAmWCUPIeAOWtxZM+1UljQX3kQZJ5Od69k1VbnD9wx6oxWUBNa11y76wfmJo7nVLD9Mrh2vxQaUqhg8a9NH/wDsR9LLZDTRfRRaU68BU9If6jFE1tCYzFkvIRA+NKFoEFZMpKG+nHztc1vFFabjaAbOdhvfR/dSBfUDoOL6tMmXsuT4sCJwhWU2KemYbOf/PhJzBZq3Iyt7yHrf8HtoIArghSPjIkidJaiL0IdvtUrmVErp01MrZ0E1nQSe9e8nItI8klCqDk4Kj/gM2buVf/mHkF3cJ6TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3wD8Wna3M1ipIYXq8TopWjSuAA+qR+gDHy9T8Mcack4=;
 b=t20AcvK45SY20fPuypvzGmCIKbISOEfkyCKhXoo7Y+dxwlU73f6R4ZSxY2LwIoMyXD4shlhU5P4G5QkLvLhpNbkYeElH0RYmXjFu0UFSJlxJiUaciHSg/HTvbLHDP3zT0V6LFg5Ob3OOEctsuEKIIEWt7LyNHye+N/5UyBWx+Osbld4yT/6/VE4mZbFM9ygY3NCD9cDeMhMxPmxKVu3YyLuacnecCOVYDFlaRe8eIN+jsoMZlPnxDSoJLNxHQrGKVEPNLDhgtlTAYlCQo1AUbrOXSUxJnOU4gF0gRN9lP/myafnm5pllkj+5CxJTdJsYHMNRHsHpK6WEqlg5Fr0SfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by CY1PR03MB8122.namprd03.prod.outlook.com (2603:10b6:930:106::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Thu, 23 Jul
 2026 02:57:36 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 02:57:36 +0000
From: tze.yee.ng@altera.com
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	Felix Gu <ustc.gu@gmail.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Jorge Marques <jorge.marques@analog.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] i3c: master: dw-i3c-master: fix OD timing for first broadcast
Date: Wed, 22 Jul 2026 19:57:33 -0700
Message-ID: <1573f05c63fe965c3816bf90d29c6cd16557a326.1784775201.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
X-ClientProxiedBy: SJ0PR03CA0254.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::19) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|CY1PR03MB8122:EE_
X-MS-Office365-Filtering-Correlation-Id: adc4e6db-1763-42cf-a266-08dee8662660
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|921020|6133799003|56012099006|10067099003|11063799006|55112099003|18002099003;
X-Microsoft-Antispam-Message-Info: b/ymXlXFR3lU/gUHdL/gytKTZqrVLzSGgQge/DZbs1+1gvceoEIp9T1rX6NhTWybMMsHH5EhDCmRuUKWBpc5Xe7KTCo3cUYr39OTHEf2zGOQPHy1hutqU/plia0hqSxt/HZMv0hzgdeMhUYsE0oTscOe66kDiLJCD5ePVNAIF1P1E3/ebrRONuqdeLLhv6FX2C2Va1OgyEtxCI9roZdjLp/muV0UA3JcN7zeo6DwgfRnGVQ8V2SCajiZSvTg366rinFoFeYVwKhJMXPe7q5NGiWKtuxEMLR8iru9e1ARFKZy0GGGmJWjRXcjSB1tL5TrTFS6Pow4obPSECWvE6yy96B7+plDhNJb58p8XOgG0GU1NmX9nacD9rYvnUgmAostI8QSxgzPMTUyBZ49D3HuN7xKGEKklMpalIwLauztvSVKci+JQIlvE/5042LgKCYdUES07pCw9Ll8zn7n+Ysv8WYfGLoK+phB/vm0AiY+RTAAWExogbdSDb2X1UQKVLhq+l5ipOlBdVlRgduoW+CbdvOoGVEYIZAxvmstPn0sC9s3HGlB4e2GtHegYJAORU39tDqx5b0/r2gCa4e3EuzIovfRc3sjR0OwIBV+G6SXZG716x8PKbq2FeczokVEYLvN/1r0iWvk0mDOwsBdH0MJsscdNaqHMA74WbDz7BXxH6CZIBEEJJ/aLsDilAHRscbfBiwh/hGyDLT3UNcK3pXWnA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(921020)(6133799003)(56012099006)(10067099003)(11063799006)(55112099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CE9SA9qj6HZdaZlRLHrHYJ530fNRyTwnqxEKtmeZWsQEpIDDZDdPHU0PNJ34?=
 =?us-ascii?Q?XUKlNGqglT/AfJzD7hQ8NkM2qo9GxT6bc1LR0nTer2KruHgITx0HrwruGMbn?=
 =?us-ascii?Q?FjW59//gNQUkvL3FYExDzQ+g2JImLzNScMGK+HmzttYYUcroYi4H6UQZn/DO?=
 =?us-ascii?Q?/crmO7jYur7KJPLM7TPZ1+VUcVg4PTVbLWZtuEUzgKoCblnae826ZG9o7OFu?=
 =?us-ascii?Q?9alk9VonGHPbykHY8Jb+Uy4pU/B5sC2QTKzooE7+ycXKz4f9lEQLoPKsCbJC?=
 =?us-ascii?Q?fsrVdKWUG8peHAM7k2h/433Kuk+zNzweJ7ms2bpWtULVkAt8/lapKP5VGm5J?=
 =?us-ascii?Q?u3upJE7m9mfCDohrO5gawHZZLUCX0CZm7iJwrSj5fGV1nCibDH+X56owRTJx?=
 =?us-ascii?Q?QFuM5CpX/Bfm95xWcPUZvUQ/wcy/h8jZNiMbf9wRUtvekkOf8CE7Yzla+ViT?=
 =?us-ascii?Q?lsC75p6HqwPAi3trX4mf8vEFawtuJMuut7vsfPiQyTAH3xtbybszCWlB9WSj?=
 =?us-ascii?Q?eRKJEf4FEkmQg/jQJOh7S4GOQTUhzZ5+YatHdcra8xEaZiIXPcUVKnIv2Xzs?=
 =?us-ascii?Q?INuk//Qj8jPZO453nb5Z6Bl5zEpfh3sQMDvWxn6uU/BpDMjBzQ5wfjsQmBm6?=
 =?us-ascii?Q?vsSL71EYU9nepcMhNQG83Vb4eFVJ+HwJNpj1bLWUghHXluXd7Lu8dz/udFZg?=
 =?us-ascii?Q?5Xe/5jDH949A16sYq30axWdl7U6S2WL8rJWTLca/tTRu/XTEp/BJNrFtAu9H?=
 =?us-ascii?Q?DfyDfmYjWJyVH0l5yp5RxZAvU6u+VaHmAK3kvX0cJDM+N/zMMGyShyKgBz5x?=
 =?us-ascii?Q?N3+W4jFwsKhvMpJKQQWt7cKoJTaLD3HzlQzdnoDki+brDxC8mLMEC5jrZHtI?=
 =?us-ascii?Q?6buAfD20TjzkbJHme1bLhbJmlM5v7oG/ups8RTvW5ZE0jvMpk7/0w9+yIByA?=
 =?us-ascii?Q?+HlWwkh/1awxx1snbvTmEB/1+Kek/cubShjDG64WQMzpTKcVINiQKP21agbF?=
 =?us-ascii?Q?S/YwuSCD/YbYItozkf38q6SymJ2yNVB5niHvwQpHdmWNBdX+fwsXLdihzO7E?=
 =?us-ascii?Q?ePOapimzjLgJfSkUfCp6hPzcfvRp70NPjGd23k+aR44+m0YhGLyawcQaai66?=
 =?us-ascii?Q?pQSGD88hl9GnL2OvvItqzhgpXcd0nOsaaI1iEcHiGokmlChvAHB75yLvfL86?=
 =?us-ascii?Q?tiSo0b6hfg7MXyqEDF6apn5YJdbttBlmJkdH5UJ10ZGG13XRShiVLD990crm?=
 =?us-ascii?Q?CcmIKHaEWLLOvwHdkURWiveZqnVBxFJRtOER3CD0L90rOI4kAcM6GP4X2EZ2?=
 =?us-ascii?Q?t755gzkHokz/JtcqWnvc+TaGHAKS54kldcAYFKcYehoAnz5YAx1O3Q9wfFFH?=
 =?us-ascii?Q?ZLAUMLF2ot5d9JN1jTcwiRrOP3rz+5SiqwwRCDn2DBPVKfC+S6d4uhLsmV+Y?=
 =?us-ascii?Q?9fvjpbKo9vyeJN+nQ8RF9SL0u1uPhcHBX0ZxGXZDcg7LZ/l9JHEqEs81duUp?=
 =?us-ascii?Q?T0oAwOK5+JDjU/x5GeEk51rSUTluy7PVRlkHbmz5ci8RZ8+u/CF9cgtAdmWG?=
 =?us-ascii?Q?KSYj2m2ZFsIE9VHEs8Z4sBrUkANvkJK1XTeDMV8Dfszc3jsx0oxHosqQekmY?=
 =?us-ascii?Q?BxOIKhpNTEvNeBZ/cvPmiKeYYxOFQuWTfvxly6gDt097kOuwniaC2i1ev5Gt?=
 =?us-ascii?Q?/sStCtcSYsdD4y1Pgm78X0dDMm5yntM819xi2TYdm67jhfkX4kjmV3mvn9Lt?=
 =?us-ascii?Q?qFpK2CJ1Jw=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adc4e6db-1763-42cf-a266-08dee8662660
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 02:57:36.2611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mgf5gg89PhVdK+XbVR4jvDxF0253B2RQ0Igx8rz5ywj0/IcBxDKD9iE82TmgxuyEkgD3QWTzYL7aDw8phDeNdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR03MB8122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_195745_271166_F3C22F08 
X-CRM114-Status: GOOD (  18.06  )
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

From: Tze Yee Ng <tze.yee.ng@altera.com>

Implement ->set_speed() so the I3C core can switch open-drain timing for
the first broadcast address per spec: I3C_OPEN_DRAIN_SLOW_SPEED programs
tHIGH_INIT (200 ns) before RSTDAA, and I3C_OPEN_DRAIN_NORMAL_SPEED restores
normal OD timing afterward. Cache the normal OD register value during bus
init and use a separate od_hcnt for the slow path so SDR extended timing
remains derived from the normal PP hcnt.

For AMD_I3C_OD_PP_TIMING, cache AMD_I3C_OD_TIMING as the normal OD
baseline and stop rewriting OD timing in send_ccc_cmd()/runtime resume so
I3C_OPEN_DRAIN_SLOW_SPEED is preserved through RSTDAA.

Use PM_RUNTIME_ACQUIRE_AUTOSUSPEND() in set_speed(). Compute od_hcnt with
DIV_ROUND_UP_ULL() for 32-bit safety and clamp it to U8_MAX to match the
8-bit I3C_OD_HCNT field.

Fixes I2C devices with spike filters not being detected on mixed buses.

Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
---
Changes in v3:
- Use DIV_ROUND_UP_ULL(..., NSEC_PER_SEC) for od_hcnt to avoid
  __udivdi3 linker failures on 32-bit platforms (Sashiko/Frank)
- Compute od_hcnt as u32 and clamp to U8_MAX to match the 8-bit
  I3C_OD_HCNT field and avoid silent truncation (Sashiko/Frank)

Changes in v2:
- Recalculate od_hcnt with Zephyr-style formula (Sashiko)
- Fix AMD_I3C_OD_PP_TIMING interaction with set_speed() (Sashiko)
- Switch set_speed() to PM_RUNTIME_ACQUIRE_AUTOSUSPEND() (Frank)
---
 drivers/i3c/master/dw-i3c-master.c | 82 +++++++++++++++++++++++-------
 drivers/i3c/master/dw-i3c-master.h |  1 +
 include/linux/i3c/master.h         |  1 +
 3 files changed, 67 insertions(+), 17 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 2f8c0c4683e0..2867ffccea3a 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -554,6 +554,13 @@ static void dw_i3c_master_set_intr_regs(struct dw_i3c_master *master)
 	writel(IBI_REQ_REJECT_ALL, master->regs + IBI_MR_REQ_REJECT);
 }
 
+static void amd_configure_od_pp_quirk(struct dw_i3c_master *master)
+{
+	master->i3c_od_timing = AMD_I3C_OD_TIMING;
+	master->i3c_od_timing_normal = AMD_I3C_OD_TIMING;
+	master->i3c_pp_timing = AMD_I3C_PP_TIMING;
+}
+
 static int dw_i3c_clk_cfg(struct dw_i3c_master *master)
 {
 	unsigned long core_rate, core_period;
@@ -592,6 +599,18 @@ static int dw_i3c_clk_cfg(struct dw_i3c_master *master)
 	scl_timing = SCL_I3C_TIMING_HCNT(hcnt) | SCL_I3C_TIMING_LCNT(lcnt);
 	writel(scl_timing, master->regs + SCL_I3C_OD_TIMING);
 	master->i3c_od_timing = scl_timing;
+	master->i3c_od_timing_normal = scl_timing;
+
+	/*
+	 * AMD legacy platforms need fixed OD/PP timings. Cache them as the
+	 * normal OD baseline so set_speed(NORMAL) restores AMD values, and
+	 * set_speed(SLOW) can stretch HCNT while keeping the AMD LCNT.
+	 */
+	if (master->quirks & AMD_I3C_OD_PP_TIMING) {
+		amd_configure_od_pp_quirk(master);
+		writel(master->i3c_pp_timing, master->regs + SCL_I3C_PP_TIMING);
+		writel(master->i3c_od_timing, master->regs + SCL_I3C_OD_TIMING);
+	}
 
 	lcnt = DIV_ROUND_UP(core_rate, I3C_BUS_SDR1_SCL_RATE) - hcnt;
 	scl_timing = SCL_EXT_LCNT_1(lcnt);
@@ -786,12 +805,6 @@ static int dw_i3c_ccc_get(struct dw_i3c_master *master, struct i3c_ccc_cmd *ccc)
 	return ret;
 }
 
-static void amd_configure_od_pp_quirk(struct dw_i3c_master *master)
-{
-	master->i3c_od_timing = AMD_I3C_OD_TIMING;
-	master->i3c_pp_timing = AMD_I3C_PP_TIMING;
-}
-
 static int dw_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
 				      struct i3c_ccc_cmd *ccc)
 {
@@ -801,13 +814,6 @@ static int dw_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
 	if (ccc->id == I3C_CCC_ENTDAA)
 		return -EINVAL;
 
-	/* AMD platform specific OD and PP timings */
-	if (master->quirks & AMD_I3C_OD_PP_TIMING) {
-		amd_configure_od_pp_quirk(master);
-		writel(master->i3c_pp_timing, master->regs + SCL_I3C_PP_TIMING);
-		writel(master->i3c_od_timing, master->regs + SCL_I3C_OD_TIMING);
-	}
-
 	ret = pm_runtime_resume_and_get(master->dev);
 	if (ret < 0) {
 		dev_err(master->dev,
@@ -1484,6 +1490,50 @@ static irqreturn_t dw_i3c_master_irq_handler(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static int dw_i3c_master_set_speed(struct i3c_master_controller *m,
+				   enum i3c_open_drain_speed speed)
+{
+	struct dw_i3c_master *master = to_dw_i3c_master(m);
+	unsigned long core_rate;
+	u32 scl_timing, od_hcnt;
+	u8 lcnt;
+
+	PM_RUNTIME_ACQUIRE_AUTOSUSPEND(master->dev, pm);
+	if (PM_RUNTIME_ACQUIRE_ERR(&pm))
+		return -ENXIO;
+
+	switch (speed) {
+	case I3C_OPEN_DRAIN_SLOW_SPEED:
+		core_rate = clk_get_rate(master->core_clk);
+		if (!core_rate)
+			return -EINVAL;
+
+		lcnt = SCL_I3C_TIMING_LCNT(master->i3c_od_timing_normal);
+		od_hcnt = DIV_ROUND_UP_ULL((u64)I3C_BUS_THIGH_INIT_OD_MIN_NS *
+					  core_rate, NSEC_PER_SEC) - 1;
+		if (od_hcnt < SCL_I3C_TIMING_CNT_MIN)
+			od_hcnt = SCL_I3C_TIMING_CNT_MIN;
+		else if (od_hcnt > U8_MAX)
+			od_hcnt = U8_MAX;
+		scl_timing = SCL_I3C_TIMING_HCNT(od_hcnt) |
+			     SCL_I3C_TIMING_LCNT(lcnt);
+		writel(scl_timing, master->regs + SCL_I3C_OD_TIMING);
+		master->i3c_od_timing = scl_timing;
+		break;
+
+	case I3C_OPEN_DRAIN_NORMAL_SPEED:
+		writel(master->i3c_od_timing_normal,
+		       master->regs + SCL_I3C_OD_TIMING);
+		master->i3c_od_timing = master->i3c_od_timing_normal;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int dw_i3c_master_set_dev_nack_retry(struct i3c_master_controller *m,
 					    unsigned int dev_nack_retry_cnt)
 {
@@ -1538,6 +1588,7 @@ static const struct i3c_master_controller_ops dw_mipi_i3c_ops = {
 	.recycle_ibi_slot = dw_i3c_master_recycle_ibi_slot,
 	.enable_hotjoin = dw_i3c_master_enable_hotjoin,
 	.disable_hotjoin = dw_i3c_master_disable_hotjoin,
+	.set_speed = dw_i3c_master_set_speed,
 	.set_dev_nack_retry = dw_i3c_master_set_dev_nack_retry,
 };
 
@@ -1728,10 +1779,7 @@ static void dw_i3c_master_restore_addrs(struct dw_i3c_master *master)
 
 static void dw_i3c_master_restore_timing_regs(struct dw_i3c_master *master)
 {
-	/* AMD platform specific OD and PP timings */
-	if (master->quirks & AMD_I3C_OD_PP_TIMING)
-		amd_configure_od_pp_quirk(master);
-
+	/* Preserve cached OD timing; it may be the SLOW setting from set_speed(). */
 	writel(master->i3c_pp_timing, master->regs + SCL_I3C_PP_TIMING);
 	writel(master->bus_free_timing, master->regs + BUS_FREE_TIMING);
 	writel(master->i3c_od_timing, master->regs + SCL_I3C_OD_TIMING);
diff --git a/drivers/i3c/master/dw-i3c-master.h b/drivers/i3c/master/dw-i3c-master.h
index 28e9348f2153..17ad817d1f8e 100644
--- a/drivers/i3c/master/dw-i3c-master.h
+++ b/drivers/i3c/master/dw-i3c-master.h
@@ -46,6 +46,7 @@ struct dw_i3c_master {
 	u32 dev_addr;
 	u32 i3c_pp_timing;
 	u32 i3c_od_timing;
+	u32 i3c_od_timing_normal;
 	u32 ext_lcnt_timing;
 	u32 bus_free_timing;
 	u32 i2c_fm_timing;
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index 4d2a68793324..eca79ea1598a 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -259,6 +259,7 @@ struct i3c_device {
 #define I3C_BUS_THIGH_MIXED_MAX_NS	41
 #define I3C_BUS_TIDLE_MIN_NS		200000
 #define I3C_BUS_TLOW_OD_MIN_NS		200
+#define I3C_BUS_THIGH_INIT_OD_MIN_NS	200
 
 /**
  * enum i3c_bus_mode - I3C bus mode
-- 
2.43.7


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
