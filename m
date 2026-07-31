Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45029C54F54
	for <linux-i3c@archiver.kernel.org>; Fri, 31 Jul 2026 04:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cXeFAYN9mr2cZchiRAaKJOAa306FOQRTE0yJ/2EGDb4=; b=MWUGm6m/5pOFm0
	1uThETwlPEF0rpWjscUoQu3t0lwFUcHAFii8chVJ04RsiEBH+5/JzfXFf1COnCrun0k33TM6V+ENT
	+RY9Eul9iHS1WJl/eBPTwPaFk79j6mm1EGWlyHSvR9nuDouHCVVUE4uXbGtiD6SIvQtdoth5XB/w+
	W5AATk2EWM8d+71Yaf6VhGAcVwdee4hcy2grErokygy+QU5BWMGCWn26R5AbLmVPSM1SmGbu0X3sp
	wLVKiGe1NpDxjqjGfxJaVghVuG+Z1yNCusCrNPfGVqYFZCqIuJhf7kSFqqidZkPjAMiQnpXCQ3KuC
	4HlaSOpUul6lE6JsudUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpemG-0000000Bjj8-2mA5;
	Fri, 31 Jul 2026 04:23:20 +0000
Received: from mail-westus2azlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c007::2] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpemE-0000000Bjif-2gLo
	for linux-i3c@lists.infradead.org;
	Fri, 31 Jul 2026 04:23:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H7N1gs1igNSq/ddd2/zZ7ptyisEHi2dbNUwW2xQtl1NqS/blUvBCLuK0kT6lYDeMITHmzqzPHWwKfeWRUE0FicFE3PzmIgL2yur1HbhzvGJgK0U94VkqGPN8iT5Kny6GQNKM6LB42CZLyLU3I16FezWudi6tZNj8k+ZM7nklU/Me3Kl8eAQf8sdLjeB0ILeHwf1UhWGtiCzJRjhYWjFCAwZDOixz//Iugkssttgjygep88HpN9l1x361cbYf/pccba2Xu037TVr9LhJIwQba9Jeiv/8EMXpcU+Cux48SVPYIlUeY1ba5ulRIs9Bh85t/FPsf2XTkIItmhXlnRULOTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+SMFiz/gemhJlkh9dqq7ej2xInVnyLUD5bloF9+cwZI=;
 b=wWdKfSPLBvnabOdrOIYv8R8WR7EjAqIUNEWZ0Kc+LqTMcYk/a1ISq0vjyIOu0JtKUQSiFiKP9qCHNB0neA9dw0FQb17PQrr9n8DfAbm9TLq1CbLy6vOj0S5FHN/9elvUFSCxnwp0vhTAQJeDOU4LOepyChf0HsM8BR+4R6TBtDH0VNLPRir2m8H+9lTKZ3Ntw6BCB1Iy3O0tqDvptGLadrwpP7p2/kjw0izuwkZdZpzBTMLOvSr7RhCKZ+CoTiiYySb0+OK9s1YNqHISFJFV2jVVLXynK0RW+VDLLrbBCME4f+xDIXD7Har6qe895KZi6RHjVKf26FlBJhzbI9G98g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+SMFiz/gemhJlkh9dqq7ej2xInVnyLUD5bloF9+cwZI=;
 b=lWTQ4alA5IdDwrrl5QZVQ/F7vZhvth0HvuDCVy4nd6znPVbTF558GR/Goe860IFAhoRMjtCR9gDamiMtmqKnN3FMGxsSKHxaWY/KOy/q5r4KwFw6AKLsxo7HmTnW7R0PGJczpp0Z2xwbjrI5NeCnB0uPYaCDciDknYUwTA4yCET35p7KV2HZYWXk1HAzJCtF3UUrqSjQr6wzld9nfTkEctVGKMbaSSHigE1ur1j4cNFXKSLrGGLApti7zdBhlg66qTE30u8hpNS8Dw39yksnazTvu9wm7nCEZqTr8OZFtSD5tkdUnx/T7t+t5wDahlNT3xAm1ZxyuBY7VN+tPogTVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by MW4PR03MB6967.namprd03.prod.outlook.com (2603:10b6:303:1a6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 04:23:09 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 04:23:08 +0000
From: tze.yee.ng@altera.com
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	Felix Gu <ustc.gu@gmail.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Akhil R <akhilrajeev@nvidia.com>,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] i3c: master: dw-i3c-master: fix OD timing for first broadcast
Date: Thu, 30 Jul 2026 21:23:03 -0700
Message-ID: <c2d80c4fabd36aa00dc1fc507ff20211bba10c3f.1785471627.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
X-ClientProxiedBy: BY1P220CA0008.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::16) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|MW4PR03MB6967:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fb36ff4-6cfc-4b83-7ebe-08deeebb6bdf
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|18002099003|55112099003|6133799003|10067099003|11063799006|56012099006|921020;
X-Microsoft-Antispam-Message-Info: RQxUEQnJeTkqIY49p8QAOv/nlYvhD3IHhYPa4CMn70Y4HlRqHuWBL0/xFwtjb1lLrwmBz+Py0sbB1/jAWkJdITNqq+97JChNW2XhVwogy/MU7RBZkyIEm0NhCmv2CaIHTl5sSx+daHZl4DQ8Wlsnw8qnIotWT9sKuuiEeDNTdbUEqPHh9lANluHDxKrXZMQJuIsBhjmZI60posDrhmb0IAGrhBwBGsjCl9Xqc1e03pesgzFbmdipEUHxx8VPf9iX0dd9Y+ADXs9+YuQx0Mfy3qhDyTbR0wrJaFy09SNFaAnnqEWAPH2/hWkQknAjXcNPELpDlnSXIn5WUPjUgTfqOJDXxX/gJqV4pAptWFH3WkfaeOD43ryXCxsI1YWnB4KDP4RhORd207aXezSfNWcU1V8GjWmHXI8/Pq05eSDkaeNzGb7Z+/UbBp1HSM69DftAR8MVeBM8y0l9bwEiovDrQZ3x+IjP5u+wiuY9FC+RvHS7nxBUcPKgnAxQoHFZrv/IpElhtWs2gRaFgxwGPfKI7DQDLeP9byaObpYsYoUNo/Rw01yfXfcuUiitIamvHdMUmR1qX06Za0abrG+5e7vnqVN9XZjX0IM0c74KJxa60nvJWECWNxpXCWIa1lxMFgNQojFocrqhsPpe5yEfvGlqn4DWjEIiz6qqCayDUSOqof6KZTC51Qa4nOoXlNdb0WTbIlqsNp8qVu+0KSn+r0O/+g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(18002099003)(55112099003)(6133799003)(10067099003)(11063799006)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VmsnwYBrw5jl7dw/PTxK+wocvGjAMmAGRQ1hiNdNKEEJu2f0OQ9yROlAmlxO?=
 =?us-ascii?Q?sFFe9/i+fOlkYwU0O1QJk8EwTUbnbMxB74rNCQadoeDq+WHKuY+G9f96sZHo?=
 =?us-ascii?Q?AaefkIRCb/Ow6NpB1s3EWbUs8IPP+6F3IP/iyD8oOSx1mqoCdDoKO/vlNubI?=
 =?us-ascii?Q?5uyurcoa8scrxNxRUd/z/3elLyE6jrjiSony7gJ/v4R7eTD+Wr4gzlLr/9nE?=
 =?us-ascii?Q?BLvx8Ppk3a5AbVnwsoS6xT0yh5ULISXpaOwwQ6injYLY95GALuyOHynMt4h3?=
 =?us-ascii?Q?5bFa9k3oe5n64FUwZqeSVHj1Z2x8g5mQ9IMOijxwxeVK3NSWGcn+ltC0ocQp?=
 =?us-ascii?Q?XxFLW08eYOiJtKWFFXu0S8KZHsgAfUVyY0s1Y8dqZMa1VrTx12m3P1Qh605H?=
 =?us-ascii?Q?Qx6WsjNBwErNLPeLTMLiLITiiPUpp50piD0f09gH8pfAiEjWnmOdNVzGMv98?=
 =?us-ascii?Q?CIX2Jup9sSmL1TSD5egY86hyjZmNBgw3nOauKkOnaNksa4CRbGJAFmOlyQgw?=
 =?us-ascii?Q?y1l23D7khAv+W8DiRKisSafJIFigmlFyrlWOBp4pNmkTIocd9fPiHTSJ/LBe?=
 =?us-ascii?Q?iPWVcqGJTe3fIb5s2FCEWYbqB03pO+GLLV/82jqduqjQ95mPzVWKImtlLzvu?=
 =?us-ascii?Q?x00TBucYfmcRDxuKbL+wwZw4o9Me5Rw1RPg9IhQzFu5M0oBlJDlFKRgTVALW?=
 =?us-ascii?Q?N8c0A06akgTPDDpUamnt2FS+Hh2Ru2CP0GC2QzCM0u1AYuX2qNu67hmEHKvf?=
 =?us-ascii?Q?v4d87iaaVCHwSa7vFcAGcbsxh9wka/geuxdLHT/GbUXuLV/n8x+jCaHCNStl?=
 =?us-ascii?Q?De84ijzcHnC7OqgS5w31XNRrg7d1nYYXJXfFoIh1V9fQhGeMq4q1Ts+lBE6c?=
 =?us-ascii?Q?4zxkex3fM4di3oexmQI1uFndZSbxc9eSjgMPH1y5sfSkFplOS5+YQaRwF/ce?=
 =?us-ascii?Q?TEwLtEtBDNfcDz2luV+cXOO6R02TNKU7dNZX7qED9/cI4FoE6T98HAb+7ay9?=
 =?us-ascii?Q?cIlIIaVzsiEVoFMp0AMNM4k3P2xlWvqaiUs5dmlvKsqMWVek2P2wbk6HRqor?=
 =?us-ascii?Q?c2eBZqvW9wvNJRyJ9pdJt5AD9OyXKDG55NaO81K4HMV8WD7jpgzd665/Xo+c?=
 =?us-ascii?Q?vgl8WVRExjs+Bw4BPP0C+r8FCS78D0DSIJw22vFpaRwjHb094d1ArznyhYzO?=
 =?us-ascii?Q?bnROZCSXMDgq/o6vQrFP35oqcXyFF78zPhWjhAZ853x3de6J+SlQxKKrLTGb?=
 =?us-ascii?Q?RkY1OFoiLCHbLzHJwfKBMTl4cjGNjmVrDt8+NNGiy7z3apTZsFsnKnGBPGBM?=
 =?us-ascii?Q?8weME+4Ial8brq2HGlB8VIKWs7ez1EDiWcCyBmwJuwVSlc9o1UqjTHBa6mLV?=
 =?us-ascii?Q?4ZxNli+7np1KPsPZl+1P5oyPtpDvxHNiqhNOFqyfoZqWGa0jHbrrEXEUhABj?=
 =?us-ascii?Q?qNJJinVaXw7gdvZz5fmGFiLdI9x1RHuWE5hihb/6HpLqYl2yKMRMkzC/CF/0?=
 =?us-ascii?Q?tc5bTJGsVYaUmvNdYQ+wWyJ8ejNDZPoQ+7T33axJ1MpvIWDPbuKHD0xQQWG8?=
 =?us-ascii?Q?TvO9OnSN2hsL4Jb9BHEz+URaDdZPgC2VxV0f9ULPHyQFjISFqbuCPW9TMiGe?=
 =?us-ascii?Q?UDQTCzjFOUb4jprpG54q+e8aqN93gqZIJi3KuwJgkvncp+vAN0xMxDMOmkY9?=
 =?us-ascii?Q?a1RgmZXqFVt64Gfdh6Fqc/P6uSTBtK3gwLqQPLQH+Z+Ls/gmN+L13SwEmge5?=
 =?us-ascii?Q?5W90+I3eYg=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fb36ff4-6cfc-4b83-7ebe-08deeebb6bdf
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 04:23:08.1939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HyoQdvfcrqITdCK94nTkEYTFrKcxRYx0MAivL0wca7pJHl1vc4VsZ3Mj2A0EVXa1D7cqd6vBRu8EGlQ4+jBugQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6967
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_212318_727169_87C6D2B3 
X-CRM114-Status: GOOD (  18.68  )
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
Changes in v4:
- Rebase on i3c/next.
- No functional changes.

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
index 3816a50a52cc..11ae517cf2e6 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -572,6 +572,13 @@ static unsigned long dw_i3c_master_get_core_rate(struct dw_i3c_master *master)
 	return core_rate_prop;
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
@@ -610,6 +617,18 @@ static int dw_i3c_clk_cfg(struct dw_i3c_master *master)
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
@@ -825,12 +844,6 @@ static int dw_i3c_ccc_get(struct dw_i3c_master *master, struct i3c_ccc_cmd *ccc)
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
@@ -840,13 +853,6 @@ static int dw_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
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
@@ -1531,6 +1537,50 @@ static irqreturn_t dw_i3c_master_irq_handler(int irq, void *dev_id)
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
@@ -1585,6 +1635,7 @@ static const struct i3c_master_controller_ops dw_mipi_i3c_ops = {
 	.recycle_ibi_slot = dw_i3c_master_recycle_ibi_slot,
 	.enable_hotjoin = dw_i3c_master_enable_hotjoin,
 	.disable_hotjoin = dw_i3c_master_disable_hotjoin,
+	.set_speed = dw_i3c_master_set_speed,
 	.set_dev_nack_retry = dw_i3c_master_set_dev_nack_retry,
 };
 
@@ -1780,10 +1831,7 @@ static void dw_i3c_master_restore_addrs(struct dw_i3c_master *master)
 
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
index 2dc139a217bf..c3df1c187050 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -269,6 +269,7 @@ struct i3c_device {
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
