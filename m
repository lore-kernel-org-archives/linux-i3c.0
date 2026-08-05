Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAEB3C55174
	for <linux-i3c@archiver.kernel.org>; Wed,  5 Aug 2026 20:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z+YrTHDQ0iDIjNRf+iaKpzWaelkM/G9XS86/tKgPmGc=; b=fxJZZeIX5GnT7N
	bXQMlf3Sh/XKNUfkDr/WWKoJHZi2Q+hC331i6Vgi/H6GC55frWN5OUjxdFBf5SM05IuhootZZglAT
	U45GgmPhgbUR0FojsGimJ/YbxA3JPV4TGithaX9UUFGA1MaJbA0qo8AEjAaNhkjviAzb0mJdSKmeD
	iskG0MSNrV9zXnkJvMpa2It1lYsZjrAwYUYttKVjFOImrxHCHAgw4CldapkoQSxfW/+7bJDrZz63P
	g9moncqJavenmxjg/DVuBBsC9GRud1jCTJ4lRW/ZnO+jNpBELQHy03DldWeef4G+fLHimaByJxBqm
	+WVv3oyk/8wIRRrgC79w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wriHT-00000004Wz6-06OO;
	Wed, 05 Aug 2026 20:32:03 +0000
Received: from mail-westeuropeazon11011007.outbound.protection.outlook.com ([52.101.70.7] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wriHQ-00000004WyY-44pz
	for linux-i3c@lists.infradead.org;
	Wed, 05 Aug 2026 20:32:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gIdMh0Em09dwXt+Mk0p3V9rX2B+uHIzTac1NwO5qeI4kJq8QUTdtwS1OGjypSyfiOyBneStNUmnAlMTy3FkpDWFqxhUeFBBz/xGYISMSpM3eZOyQ7XHIs+RvuGE6sn9WxsfkzToqAQDaGJXw0vWilsgyPPV5j6K4stV8ki9uB8sT3kXLCHChr2F5LiFwzM4xIH+vp7dsRvlj09EdD9dYR+dQPGoQEVS32yraQ0CA6miqiBoNKW9xhZ4MmusXVWs9Afe+4qGvumhogtFUxx6oIdo7htQQZuuFyYCBjfPvEUnE13+PWPAWvIUyU1co7rEkiGvZRVTyKD4Oesb0BiJ8Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rlPg4fxddEYGBV7cAdKBo0SFI3/Htw+a80qUAAUG8RQ=;
 b=efbetMtsVejsR39jzI5krpo/yhZu2cKLOsShDZXaoBIhkV+ECE2pd+wNwxeO2A6eb+aKyh70SG6WbLyEQL+wCx3s+J5qTwFreKnkWyIqQIICcqglxnEzANe6uOv2JNd0BVL5KKlWnSLx9XkY5bq0UnAWHtzih3wGPnaFXeWvdkaEO9LrZ3Y/B3Mj5hg00HUUqPfFM+Y2DuUad2RkZETlZn3vcHKTJF05wuBXvOVM6fLdKNSS5sZ6LaLWuw93VRcLbqBLrmz0cvU2ZpUWY0pUIqkYxJuI8L9UcaxHF1oVUSOp9ZsJg0ElTeJg6COw2CRWKFvbgAEqGPaBp7+1Sya4aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rlPg4fxddEYGBV7cAdKBo0SFI3/Htw+a80qUAAUG8RQ=;
 b=BZURjIqWaEfoh+F9u/b9h/93Eu5CpD08h4o8FSvrwUSHdUl+dpElyGRCZ9YgynIi7SLrXkgZPOJfFfMQWgDle9/oj/+G6zIXQQsMuKyunTvD7oxVrUN2Sx6rfKjVq1NwNrlwj8LxDvHe6cc2fp20nJebV0lwcxlF8pMKacDPSMHTgxCEC/gpBjodV80rdxtGkIPchqaDcYs5aM4OrrJoWYyJvqE6OMr+oXF5VcnOE0qyQ3zU4T7boprK5IT3aPWQUCNlvCoV8CiOsmcccTrxiQEnmHPgE4dBJTB8gwfvmAoAzZ8KVusJ8UxoZEFpDZJhTrJ8L2I0K8L8GorA3XZ82w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI1PR04MB10052.eurprd04.prod.outlook.com (2603:10a6:800:1db::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 20:31:56 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0292.018; Wed, 5 Aug 2026
 20:31:56 +0000
Date: Wed, 5 Aug 2026 16:31:48 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: tze.yee.ng@altera.com
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	Felix Gu <ustc.gu@gmail.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Akhil R <akhilrajeev@nvidia.com>,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] i3c: master: dw-i3c-master: fix OD timing for first
 broadcast
Message-ID: <anOdtCbQF5ZOjfOB@lizhi-Precision-Tower-5810>
References: <d789219ca0418898a1ef2bf9295b4f96ca7b4209.1785484707.git.tze.yee.ng@altera.com>
Content-Disposition: inline
In-Reply-To: <d789219ca0418898a1ef2bf9295b4f96ca7b4209.1785484707.git.tze.yee.ng@altera.com>
X-ClientProxiedBy: SA9P223CA0019.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::24) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI1PR04MB10052:EE_
X-MS-Office365-Filtering-Correlation-Id: 92b599ba-b0de-4cac-e484-08def330978e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|23010399003|19092799006|376014|366016|1800799024|6133799003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: lpjSOAxvh7n8AemFCVNyw7yotUR6RJLH4EeU0Vjvr/UA1b79ms7IWnrVwPuOfxHbvSPYnlNt8EDneQ85LFhNon8zO7USinWgK/n+6iinCwCP13s80VxnaiSLL2qV7Rt2ZU8E6SurH1qrnTns1HE7P/frY3urPB7LK1omVpChmq12bYKgTtzrbTpAK0puuOPYirI4AN+VXk7oSw025mRJ5JpeFeUWz44Dpd5Xova+NnXUhRQx1HtT2OKThFFwG282LsQQb4TjiEgVm1jQIcpitEDMt6MbYKM1b77kXWB0GmYCjW90conteRgRol1KrKppwZHHZVCKnbnyP4scHfrCf6wRiUsyeWZz6Xz27N698eOmfPvk18rB1OWa2MQ5+4uWMe5eUQoMpk2dRWxt6EGuuIUqQQSxXryemhE+ecdRzydv/nXzqJAjPAmBj75WusPNv+2pPntkL4H1jYUaRxN8pC945TIo0eIqIBfB0ONr/OBRoXfLtM9pAz3JURI9KOITeqi0L7/cheg3KA0/wknv556/MJZuSSxEozDptEfw5KTAAAOrJI37ApcpdqRPTRdnwI9xoDxKvX+oayiIY0A6/7fsq1xgbOpSaM5dphPKuid35g2+X9tRwSX5yCZ+tv36/0ErAXs7WyohJwZZVW2+ML/H83phtaRfYFLkKApQukM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(19092799006)(376014)(366016)(1800799024)(6133799003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E5KJP9S1WCIchQRgjr94wZks5YsYUbS3qSegdYoIVV2TwxzXlYDkUG7nP7Yr?=
 =?us-ascii?Q?fyguDJzVAWoCY2V9JBB95gXVWdmakJYK1We3KVpIPN9HXZGtev6l0E1p0x2D?=
 =?us-ascii?Q?6cy9U+dsMJZoSAJNeOUBKy3ruin2RNrZAyz0RluKO2tfCmKybO7c/GQTDzRp?=
 =?us-ascii?Q?Z/xjLZIObn/UNUEysQbUCejIommRWy7FO4m0YYAbtjj/LhwjkPxvavKRNRae?=
 =?us-ascii?Q?8R7sn2KsblQMtDYZ2wEjzOV2aqkvS0+nyCkK27c/2HAzQ3H/TCwrKYNPacoM?=
 =?us-ascii?Q?s+k84RLFJjNR6DLFpMoCL0gb6oraTNylJlm1bSGRAeAn4Xo5Kfg26giCEUVw?=
 =?us-ascii?Q?A+E9pr7ltsIB5EOLWbRR45z3XRGJ3twY0fYDg2CSGFt42d/O4S/dug6N3jte?=
 =?us-ascii?Q?fzur9QzVjx37dlu2swMc7tGnWvMEXfPW4iPB1nNY8JWw7azzBROKD7wMPHZj?=
 =?us-ascii?Q?FnabnOe99yST1v4qFkEMIuhvdQCAt0od6HMiFCpsR1ZUwZ2VJ+aX3eGKAF/N?=
 =?us-ascii?Q?9z+aEdNmIps0lz9PhmUHpZpDeCy2vOZMT171DNoRqRDunfoyOFvsTRARMSl7?=
 =?us-ascii?Q?UkF5xLBH5WboReNptUwlJEBbQTcxdjFXHeJVME0gZo2kNAbEOES7OseZex8x?=
 =?us-ascii?Q?x36PPaXZntgFSz2EDKvMuy2/EKDL4+8z0L9b+eknR24389ZHccwm+OETQmf/?=
 =?us-ascii?Q?iFT8IdG+arxKm9AjFEHlxgJAUuab/bCn/sAxhne7c9wl08DGCp3NRc0OTbil?=
 =?us-ascii?Q?hDE58fA+PXPFAfOMQWr1nH8Wd947iTHob/9rW7sa52ZCbumF0uW1K9ADXG4R?=
 =?us-ascii?Q?94sSdZyb4pnxgpDd6SApHKIl1jCV84eULVy0gCHt9hFqITte4qiNai6U6/R+?=
 =?us-ascii?Q?fLkNg1YgiWynp8cLZbOWDKfmzoX+OWknnVEZhjRHHIZwMnuRQvEaiYI7AWPC?=
 =?us-ascii?Q?LwprJ9Ttj9yKaSC9MunZHX2muhP90jZ0xtzQ64PeinzbkK6DRy3+wuQAz3yY?=
 =?us-ascii?Q?/FJR0ULFDhLXn14t/uIUQzfbhNq9be6Hdxtl0pMtjfini/hA6g4UtkHLjVRw?=
 =?us-ascii?Q?19UC13mHkzEuzL9zA32au6UVjwTkzQIANRrIL72JNgD2EUitHoDtlN/H5uzt?=
 =?us-ascii?Q?KUsn69b29XIlsb1gfL0IkqX5kbQRegcMBnEFy6occWpS1Vp9VSlBv/bVNbhr?=
 =?us-ascii?Q?XkUemMH3Ud0BH8l5gNqsslcRq/LRW1SemP0Bu0gPJiOFg3/7sXAFM6JoahNL?=
 =?us-ascii?Q?vZjF41VpGsCqgk62sb/PXQkn7es+gy+al3GfDjqklQZeXIgK6tJje/pkcGcN?=
 =?us-ascii?Q?W0IouuAhc5LVrsRcnK8fTbbrrAd2joH0bY0Y3GKiB0Zrdbk1V+4YESsFaIPL?=
 =?us-ascii?Q?/QV3lpgqOIrajxmawY323iy9vQNoyQmqUEQrhF8xjf75lKJKlmo1fCOvnsEt?=
 =?us-ascii?Q?diELhn4VfinW3f2qvsLZS8cwrVSuHr/Lsc8ZHGMwq82U6qnEjFqpDrtqGZxJ?=
 =?us-ascii?Q?x1Y21PbMgZPq1hZOlDnGYhPiGOjXAAPD+eczA8M5X/MS5C14QqSd2UTYXLld?=
 =?us-ascii?Q?9Tv+o2/RW2zUWhkwla+8NiPIK9uhMX3QKijr462zO9ZiDcLA5CMzS2GfyY5f?=
 =?us-ascii?Q?GSyqTRZSaqVu9ieojf3nhiCphAi66t5Ac/+X7A/d346idj/+3WIdwYn5c9J7?=
 =?us-ascii?Q?93QxcnWz4UaLjBsBXakZ+VQyhUxdGjC/0dbF9VuPHR6qfLvesoa4meDOV7eT?=
 =?us-ascii?Q?0S3CpB8+BNnXGsRTi+6ERvN2OOYTh0qsCc2eq3vavHArHuMLnIN8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92b599ba-b0de-4cac-e484-08def330978e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 20:31:56.2468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RBGniMv1EmKXr/qns31DaLaTlb7FB3MxfNf6Urc8RXXksXAjr0wfKMqs2T0QjeOlkv/ykjGjgTbpPuEWJUBRgc3kbCzpkDu/JYI2Xxhp9Yu+JqvYl5TYRw4H5D5KHZwP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_133201_159981_0863FA5F 
X-CRM114-Status: GOOD (  29.96  )
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

On Fri, Jul 31, 2026 at 01:01:39AM -0700, tze.yee.ng@altera.com wrote:
> From: Tze Yee Ng <tze.yee.ng@altera.com>
>
> Implement ->set_speed() so the I3C core can switch open-drain timing for
> the first broadcast address per spec: I3C_OPEN_DRAIN_SLOW_SPEED programs
> tHIGH_INIT (200 ns) before RSTDAA, and I3C_OPEN_DRAIN_NORMAL_SPEED restores
> normal OD timing afterward. Cache the normal OD register value during bus
> init and use a separate od_hcnt for the slow path so SDR extended timing
> remains derived from the normal PP hcnt.
>
> For AMD_I3C_OD_PP_TIMING, cache AMD_I3C_OD_TIMING as the normal OD
> baseline and stop rewriting OD timing in send_ccc_cmd()/runtime resume so
> I3C_OPEN_DRAIN_SLOW_SPEED is preserved through RSTDAA.
>
> Use PM_RUNTIME_ACQUIRE_AUTOSUSPEND() in set_speed(). Compute od_hcnt with
> DIV_ROUND_UP_ULL() for 32-bit safety and clamp it to U8_MAX to match the
> 8-bit I3C_OD_HCNT field.
>
> Fixes I2C devices with spike filters not being detected on mixed buses.
>
> Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v5:
> - Switch set_speed() to use dw_i3c_master_get_core_rate() (Sashiko)
>
> Changes in v4:
> - Rebase on i3c/next.
> - No functional changes.
>
> Changes in v3:
> - Use DIV_ROUND_UP_ULL(..., NSEC_PER_SEC) for od_hcnt to avoid
>   __udivdi3 linker failures on 32-bit platforms (Sashiko/Frank)
> - Compute od_hcnt as u32 and clamp to U8_MAX to match the 8-bit
>   I3C_OD_HCNT field and avoid silent truncation (Sashiko/Frank)
>
> Changes in v2:
> - Recalculate od_hcnt with Zephyr-style formula (Sashiko)
> - Fix AMD_I3C_OD_PP_TIMING interaction with set_speed() (Sashiko)
> - Switch set_speed() to PM_RUNTIME_ACQUIRE_AUTOSUSPEND() (Frank)
> ---
>  drivers/i3c/master/dw-i3c-master.c | 82 +++++++++++++++++++++++-------
>  drivers/i3c/master/dw-i3c-master.h |  1 +
>  include/linux/i3c/master.h         |  1 +
>  3 files changed, 67 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 3816a50a52cc..405089f181c4 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -572,6 +572,13 @@ static unsigned long dw_i3c_master_get_core_rate(struct dw_i3c_master *master)
>  	return core_rate_prop;
>  }
>
> +static void amd_configure_od_pp_quirk(struct dw_i3c_master *master)
> +{
> +	master->i3c_od_timing = AMD_I3C_OD_TIMING;
> +	master->i3c_od_timing_normal = AMD_I3C_OD_TIMING;
> +	master->i3c_pp_timing = AMD_I3C_PP_TIMING;
> +}
> +
>  static int dw_i3c_clk_cfg(struct dw_i3c_master *master)
>  {
>  	unsigned long core_rate, core_period;
> @@ -610,6 +617,18 @@ static int dw_i3c_clk_cfg(struct dw_i3c_master *master)
>  	scl_timing = SCL_I3C_TIMING_HCNT(hcnt) | SCL_I3C_TIMING_LCNT(lcnt);
>  	writel(scl_timing, master->regs + SCL_I3C_OD_TIMING);
>  	master->i3c_od_timing = scl_timing;
> +	master->i3c_od_timing_normal = scl_timing;
> +
> +	/*
> +	 * AMD legacy platforms need fixed OD/PP timings. Cache them as the
> +	 * normal OD baseline so set_speed(NORMAL) restores AMD values, and
> +	 * set_speed(SLOW) can stretch HCNT while keeping the AMD LCNT.
> +	 */
> +	if (master->quirks & AMD_I3C_OD_PP_TIMING) {
> +		amd_configure_od_pp_quirk(master);
> +		writel(master->i3c_pp_timing, master->regs + SCL_I3C_PP_TIMING);
> +		writel(master->i3c_od_timing, master->regs + SCL_I3C_OD_TIMING);
> +	}
>
>  	lcnt = DIV_ROUND_UP(core_rate, I3C_BUS_SDR1_SCL_RATE) - hcnt;
>  	scl_timing = SCL_EXT_LCNT_1(lcnt);
> @@ -825,12 +844,6 @@ static int dw_i3c_ccc_get(struct dw_i3c_master *master, struct i3c_ccc_cmd *ccc)
>  	return ret;
>  }
>
> -static void amd_configure_od_pp_quirk(struct dw_i3c_master *master)
> -{
> -	master->i3c_od_timing = AMD_I3C_OD_TIMING;
> -	master->i3c_pp_timing = AMD_I3C_PP_TIMING;
> -}
> -
>  static int dw_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
>  				      struct i3c_ccc_cmd *ccc)
>  {
> @@ -840,13 +853,6 @@ static int dw_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
>  	if (ccc->id == I3C_CCC_ENTDAA)
>  		return -EINVAL;
>
> -	/* AMD platform specific OD and PP timings */
> -	if (master->quirks & AMD_I3C_OD_PP_TIMING) {
> -		amd_configure_od_pp_quirk(master);
> -		writel(master->i3c_pp_timing, master->regs + SCL_I3C_PP_TIMING);
> -		writel(master->i3c_od_timing, master->regs + SCL_I3C_OD_TIMING);
> -	}
> -
>  	ret = pm_runtime_resume_and_get(master->dev);
>  	if (ret < 0) {
>  		dev_err(master->dev,
> @@ -1531,6 +1537,50 @@ static irqreturn_t dw_i3c_master_irq_handler(int irq, void *dev_id)
>  	return IRQ_HANDLED;
>  }
>
> +static int dw_i3c_master_set_speed(struct i3c_master_controller *m,
> +				   enum i3c_open_drain_speed speed)
> +{
> +	struct dw_i3c_master *master = to_dw_i3c_master(m);
> +	unsigned long core_rate;
> +	u32 scl_timing, od_hcnt;
> +	u8 lcnt;
> +
> +	PM_RUNTIME_ACQUIRE_AUTOSUSPEND(master->dev, pm);
> +	if (PM_RUNTIME_ACQUIRE_ERR(&pm))
> +		return -ENXIO;
> +
> +	switch (speed) {
> +	case I3C_OPEN_DRAIN_SLOW_SPEED:
> +		core_rate = dw_i3c_master_get_core_rate(master);
> +		if (!core_rate)
> +			return -EINVAL;
> +
> +		lcnt = SCL_I3C_TIMING_LCNT(master->i3c_od_timing_normal);
> +		od_hcnt = DIV_ROUND_UP_ULL((u64)I3C_BUS_THIGH_INIT_OD_MIN_NS *
> +					  core_rate, NSEC_PER_SEC) - 1;
> +		if (od_hcnt < SCL_I3C_TIMING_CNT_MIN)
> +			od_hcnt = SCL_I3C_TIMING_CNT_MIN;
> +		else if (od_hcnt > U8_MAX)
> +			od_hcnt = U8_MAX;
> +		scl_timing = SCL_I3C_TIMING_HCNT(od_hcnt) |
> +			     SCL_I3C_TIMING_LCNT(lcnt);
> +		writel(scl_timing, master->regs + SCL_I3C_OD_TIMING);
> +		master->i3c_od_timing = scl_timing;
> +		break;
> +
> +	case I3C_OPEN_DRAIN_NORMAL_SPEED:
> +		writel(master->i3c_od_timing_normal,
> +		       master->regs + SCL_I3C_OD_TIMING);
> +		master->i3c_od_timing = master->i3c_od_timing_normal;
> +		break;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>  static int dw_i3c_master_set_dev_nack_retry(struct i3c_master_controller *m,
>  					    unsigned int dev_nack_retry_cnt)
>  {
> @@ -1585,6 +1635,7 @@ static const struct i3c_master_controller_ops dw_mipi_i3c_ops = {
>  	.recycle_ibi_slot = dw_i3c_master_recycle_ibi_slot,
>  	.enable_hotjoin = dw_i3c_master_enable_hotjoin,
>  	.disable_hotjoin = dw_i3c_master_disable_hotjoin,
> +	.set_speed = dw_i3c_master_set_speed,
>  	.set_dev_nack_retry = dw_i3c_master_set_dev_nack_retry,
>  };
>
> @@ -1780,10 +1831,7 @@ static void dw_i3c_master_restore_addrs(struct dw_i3c_master *master)
>
>  static void dw_i3c_master_restore_timing_regs(struct dw_i3c_master *master)
>  {
> -	/* AMD platform specific OD and PP timings */
> -	if (master->quirks & AMD_I3C_OD_PP_TIMING)
> -		amd_configure_od_pp_quirk(master);
> -
> +	/* Preserve cached OD timing; it may be the SLOW setting from set_speed(). */
>  	writel(master->i3c_pp_timing, master->regs + SCL_I3C_PP_TIMING);
>  	writel(master->bus_free_timing, master->regs + BUS_FREE_TIMING);
>  	writel(master->i3c_od_timing, master->regs + SCL_I3C_OD_TIMING);
> diff --git a/drivers/i3c/master/dw-i3c-master.h b/drivers/i3c/master/dw-i3c-master.h
> index 28e9348f2153..17ad817d1f8e 100644
> --- a/drivers/i3c/master/dw-i3c-master.h
> +++ b/drivers/i3c/master/dw-i3c-master.h
> @@ -46,6 +46,7 @@ struct dw_i3c_master {
>  	u32 dev_addr;
>  	u32 i3c_pp_timing;
>  	u32 i3c_od_timing;
> +	u32 i3c_od_timing_normal;
>  	u32 ext_lcnt_timing;
>  	u32 bus_free_timing;
>  	u32 i2c_fm_timing;
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index 2dc139a217bf..c3df1c187050 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -269,6 +269,7 @@ struct i3c_device {
>  #define I3C_BUS_THIGH_MIXED_MAX_NS	41
>  #define I3C_BUS_TIDLE_MIN_NS		200000
>  #define I3C_BUS_TLOW_OD_MIN_NS		200
> +#define I3C_BUS_THIGH_INIT_OD_MIN_NS	200
>
>  /**
>   * enum i3c_bus_mode - I3C bus mode
> --
> 2.43.7
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
