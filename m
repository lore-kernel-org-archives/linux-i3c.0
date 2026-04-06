Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F19E9D82E
	for <linux-i3c@archiver.kernel.org>; Mon,  6 Apr 2026 03:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J2es993zGS9lrCXTBAGGfYvXd+YQNJOD8p18xvBCYco=; b=Su1KOkq+oaGtzj
	of6ePmfPfLRkYZ+Wf4Z0+ibBkLXnTXAlwTEB+K6yyZVvW4hU+Lf73Iahkc2arj04x8myFM6SxNNLs
	Sgdk9PUrigGtFL172OaXxif2hbDErWxrfp9YF2rFvucUJFsyEIhzj9bP79tsXBdV+vVgWTJ5AlXrh
	q/lNtBWS1Mh+dI0/gzbvWzLeozPWAjwt3f9u+0jxVskAdyE+tMgKHbsLAuSULUf0Yb8FOziFR6t/z
	BtLpj+yDaVdld/9yZA7phd/hVedojgI1WhM3RXf5K15y5+dx8YZwFopvkIHbIk/RPuxFFQhN+iD84
	hR3iG4qH9I/p+B/6lpYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9aCA-00000004iqj-2D1G;
	Mon, 06 Apr 2026 03:00:10 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9aC7-00000004ipy-1l3c
	for linux-i3c@lists.infradead.org;
	Mon, 06 Apr 2026 03:00:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zIHhnUIpaiG77wzYpEWltpKGO7w58wWAqcXXgf9WyuKJ6LgIbotg/lPbZHbKGEaUjOlN9Lt6AVmcKLRFHt+rJFjRGlDqPzEREscMnBYhVMgEbE2uk+REp2JKDFJ0M6Spt43RJyUtn2Tjd8V5TcTRRTM0acVTQfn0D4VncPv5rErloJ+FDID0rRPjaojetY6gxULI5JcVRFbR4dn4HENfs9zLHPtmfiBKoRU5cwkfMRgfHNAgG0TTX2+UF8AgUexJA5hWg1AarvQQNkScZkjrgfeLRHWycWIL3t4cBgec1cRd4m9Mry8TuliFHzzVy0Q40xrEodohEGGv5yp1l2H6PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3w3TOnBepzUwfNTWOeBkgJILOkjS12fTzHrsZmtQ0BE=;
 b=JWLxueT8VrrnHznPK3lVsSrBZOcxWSUnTisAjSuj0FFaK9ogq6rxax8lDH6BEKhMLdm3R4wnb7Vqb+liKuJ9tAwlMlK5kqNbVjIAwt5+FXvNjJur3hK8js4oIcUbpj58T91OANay71mSiUIBKA7insHgkwjYRtyc52KfdGCfWa4wU5dAOtpRxPVkcKv2hIC3iNsJIyk/2lzeaYcwX9nYZ8qV8WvjBtmqcJraI1f/Ww6Xjq+h3LL6+bN8/3btIVXHSEGhKG8Ljgq9C1MM2UtywxeH3++LbxlTxOWDcwGh/COGkUErqyoXxqpqIqW+6cq4ZP7YSFBGECrXra0mHCAI9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3w3TOnBepzUwfNTWOeBkgJILOkjS12fTzHrsZmtQ0BE=;
 b=LCXc/DYufMGNei9Vk/p5mLhwHEDa7eNhAB6it/yCKLiduz/xptH4bZBED4t1AD8mUvw/aaddK/40r7/CrL2BrgomsS385KUY0JmZoxmeh5ymd4eBN65gHNRkWOJnFPT+aXxUKeJp+qCt946pqtsuMNUjMW9lTCHqGbjQV72XRnoNo6NoYILYdhVIoCLmIRdUEhLF9Z23To4+xx7azOfioHIJXSFu93KC8eiPIyPwMveETpDjpx5tCaR2XYTF9S8gxTBx+FRLSQeS2/X+fzacO/PcHXszyRTDkrmzaTR/KjbRlV2SnudbH/MNPd55jj28pCkaxGFLQGxZdWk8oMjFyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM7PR04MB6791.eurprd04.prod.outlook.com (2603:10a6:20b:103::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Mon, 6 Apr
 2026 03:00:03 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9769.018; Mon, 6 Apr 2026
 03:00:03 +0000
Date: Sun, 5 Apr 2026 22:59:55 -0400
From: Frank Li <Frank.li@nxp.com>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Aniket <aniketmaurya@google.com>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] i3c: dw: Fix memory leak in
 dw_i3c_master_i3c_xfers()
Message-ID: <adMhq61VzPYzxfYm@lizhi-Precision-Tower-5810>
References: <20260404-dw-i3c-2-v3-0-8f7d146549c1@gmail.com>
 <20260404-dw-i3c-2-v3-1-8f7d146549c1@gmail.com>
Content-Disposition: inline
In-Reply-To: <20260404-dw-i3c-2-v3-1-8f7d146549c1@gmail.com>
X-ClientProxiedBy: BY3PR03CA0014.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::19) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM7PR04MB6791:EE_
X-MS-Office365-Filtering-Correlation-Id: 72bd745e-12eb-443a-de9d-08de93889921
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|366016|19092799006|1800799024|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: YuM9yX/o1WoZALqWuCqeKXx1EGt4iEh0+snLy8T2XMVtZ1pOJ7Aqkt6aGdXuT+UejvvGogWMjdyt7gdtRzkswp639bROry46tJDsigC9cCUiKviNEt0FVbtIlDs8S5oaFoTqk+EIXOqgMTeKamA7fuamEc8aq/Sn6vZy5amjp8CCnVfFMlDJA+o1YlflB83ZVoq8gPgq5sEjbIsppLuzWM9W/gKaG+/P3913ymwCS0bwdL4+SZcwnsxKXqxScy2bJHqhAwvsPMeU+hz6pCPXPsfotON9xLFy+qw4PFPblsOeaHE0DcwqpXLoTTrwMlNR/caOOm7EyetqjV9fcpVUfgSUmwdSHx9WcSxy96S3SPfP3ODfkBMaH7PlQBzaxyz+el5Kf1nr4jr1pENHwEIvbmOlveAPVqht8TnYRgYCnmrwqWAMuBAYxcQya6ndPcVBIRrZidmpel7ozVA6K5loAihzY5LGtUwrzpXgtpxsNwc28poB7KNK8aXex/Q2T3d1yNoTiLqDWe+YIM2JvIJZajIysyKf9il1c+i5E5+DoL4mmAkcmNPaEXrcfV21lxQUK+I90fWZ+1hklQjPg01+3J+Rm4I4CNpy1iKzf42Urig5Zkn9ih4d1So44zfnFmraYEk0AmNitFifweXeV/XZM1NvxRWcwcHQTYPUKsE1AK+rGy2YHZObZIOAWvKUmzWw88hi2j6fbAkTmxwu+BGclEenfysplqMucbNrKrUPoD4yX1wfgzcLEzi+VQj9nCcXptemG6TUfIZ0Fu8cNyrfvUZBGrUE4jEC0b9XR+tVM/w=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(19092799006)(1800799024)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/jjHRbacGUC8ibAx7t/0kPtHVhgoscnd6cW9Di+hbe9xiFGgPQeaLp3TdCp0?=
 =?us-ascii?Q?tNlXQKwu0NjpmZfivGbTImedVUPv1BXyRzTb8jb+i+vBqWhUAAHuLm4gpQ9p?=
 =?us-ascii?Q?sNX0VvRTALqgPW5IQznNrge2Ugvq0bNKg7yzqJJoMFwTSaHi8nXI7rlpI1oW?=
 =?us-ascii?Q?e+qWe5x4yYZXYlt9+p9HMxuo3uwXs9Dtud2wmbdeDwcpaNLmYbIR0TRQZq++?=
 =?us-ascii?Q?A9tdKXEt+NWMBwJqB0Z/2fyTQlJXA/C9AYte9xy7qoELp7BCpMi3P4+XjOTB?=
 =?us-ascii?Q?x9EHtKGHn56hV9jCxjKzbs8+n/GJQFUsXfyT2fWZ2rtdD8Yv5p33zzTdIL9J?=
 =?us-ascii?Q?5ASl4b5dHZmQl222KLj9LMeW2o6v5kx0ZFnjNWbcwxOZJEgJb/DGX89fBKjk?=
 =?us-ascii?Q?vOPuHqIFeN8W2z8wBXALJiiAT6Hx7mNZMThQF4h0yNTK3AUhVIB832FZ/Vdv?=
 =?us-ascii?Q?gvaHSjnu8wuHweL+SlAlNhre9OLh2LiPeA97ezomQA95E69DRfjhWrU32How?=
 =?us-ascii?Q?4ww3HrYOcbXIlG98wl+MbE7UjNYAnlQ164NCtHDt+TsnoZZwS4y849NST/tB?=
 =?us-ascii?Q?IDn+GelQwsT4e+V0F0KMA9aSbA30THtCb54JcZYyAbiE42scdKmt3SOHI3ZH?=
 =?us-ascii?Q?RbY7VRVgITVoBVi3lF1IP4PpZuIfSb1wLVQVGgahV1gfWX2skd2SHeR3CX9p?=
 =?us-ascii?Q?Q/xxrR1e435z1wchh/Q3mrN+dkZ+SPUpJI14OIBc9GH5UahX8MuYJ+uyF4eL?=
 =?us-ascii?Q?IL6rO3f09/Ak2t9QM3+4Z10aturhKWTjLkBetAvl3USCFaKiXzk0DTUz1n9h?=
 =?us-ascii?Q?25Zh2jtjZOH/Wj9tlBvaxlaaGqyQQzXQ2+AwqTnCRTV/GJuz3Bqd/6FJIG38?=
 =?us-ascii?Q?sNWAdvYUJvUC4o6UZ1AJfWXXdV32QpmkSX6/9oU99gYDks8/nCGBoNZRyhcl?=
 =?us-ascii?Q?5qEGGZToCvgTg0YvVcpj5hSUokIqJcPGfAnjEe2n7q6B7Q4P7S2KG53t0Plb?=
 =?us-ascii?Q?HkpCTn/Wa6Tci2VLeM3SnTXJYJglCgVV/WkGTxztDSnehLtd13x2A4nEZobO?=
 =?us-ascii?Q?a3E37P0dK4HSw1KDV5UJllpdC6/jfcacfGGi7e8VOhDQvs49VPs6UMVHhbwr?=
 =?us-ascii?Q?HCtfDU08ci7ju2dyIi70Ics53OJ0oF3NByUEMVwYOIoGiYCuhO1yGubmPl3s?=
 =?us-ascii?Q?z2CdaANV+rZPyEUj4cmcvKjoA87bJkU8lTqHYAqaZ4Y8JWUxlKcB6+CeE+pX?=
 =?us-ascii?Q?29KR6QURhHAc6QRSy6En/1OpvGCxMhKcb9vrk9oxtLpClwuXRyeWWoXv02b0?=
 =?us-ascii?Q?1VUGj+Nh6HtGz83Fn2bnf2Nxd01WexC2hM4+A11Yr8u/YCLliBms5HUaWTSN?=
 =?us-ascii?Q?GiE5OcHyqCs0dU7KCbW85GnffPR1wwYmJuDVxs5NR0yp43hXCwYdWjIFnyXU?=
 =?us-ascii?Q?L2pITrAOaKb2RMm6f4Ur0LtrHGBFPAa/kDNbemJ3um4EVqW0mRowzu8Gjus8?=
 =?us-ascii?Q?YtzJ3yyKyS01TeQfMRmyWbHjV+6Qb+rYIvGW7RpcCjjlEfMb2NtYX2vYPp1w?=
 =?us-ascii?Q?8aMlQHlbDIRdj+hNAPuniuyitdxfyUZ/MsebUpVFgeBEThlfGtqpbM66kHtj?=
 =?us-ascii?Q?qRzTDQtkCu4GPXQ7+tOMdL2zHYyH/8HMoECrd4LqkjJZLb4WP8fyfxKpO+Ze?=
 =?us-ascii?Q?u3DOrAFQfjL5NB4ZhSz0fqjVsjlSXZdAJT8BPdXyE96wuk1f2zknxDC7j7HA?=
 =?us-ascii?Q?7byOkDRyEg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72bd745e-12eb-443a-de9d-08de93889921
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 03:00:02.9336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6CqBGDG75XYjsRBvyhq3seTsarTSI2n9Dy0+LHD98Jcwb+/EP+9/cZ04EIidO2PhQQ2fDozlhWfGarn2IdP+5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6791
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260405_200007_467184_D6F6C66C 
X-CRM114-Status: GOOD (  17.58  )
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

On Sat, Apr 04, 2026 at 06:32:30PM +0800, Felix Gu wrote:
> The dw_i3c_master_i3c_xfers() function allocates memory for the xfer
> structure using dw_i3c_master_alloc_xfer(). If pm_runtime_resume_and_get()
> fails, the function returns without freeing the allocated xfer, resulting
> in a memory leak.
>
> Since dw_i3c_master_free_xfer() is a thin wrapper around kfree(), use
> the __free(kfree) cleanup attribute to handle the free automatically on
> all exit paths.
>
> Fixes: 62fe9d06f570 ("i3c: dw: Add power management support")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/dw-i3c-master.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index d6bdb32397fb..2e31228b3809 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -7,6 +7,7 @@
>
>  #include <linux/bitfield.h>
>  #include <linux/bitops.h>
> +#include <linux/cleanup.h>
>  #include <linux/clk.h>
>  #include <linux/completion.h>
>  #include <linux/err.h>
> @@ -924,7 +925,6 @@ static int dw_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
>  	struct i3c_master_controller *m = i3c_dev_get_master(dev);
>  	struct dw_i3c_master *master = to_dw_i3c_master(m);
>  	unsigned int nrxwords = 0, ntxwords = 0;
> -	struct dw_i3c_xfer *xfer;
>  	int i, ret = 0;
>
>  	if (!i3c_nxfers)
> @@ -944,7 +944,7 @@ static int dw_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
>  	    nrxwords > master->caps.datafifodepth)
>  		return -EOPNOTSUPP;
>
> -	xfer = dw_i3c_master_alloc_xfer(master, i3c_nxfers);
> +	struct dw_i3c_xfer *xfer __free(kfree) = dw_i3c_master_alloc_xfer(master, i3c_nxfers);
>  	if (!xfer)
>  		return -ENOMEM;
>
> @@ -995,7 +995,6 @@ static int dw_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
>  	}
>
>  	ret = xfer->ret;
> -	dw_i3c_master_free_xfer(xfer);
>
>  	pm_runtime_put_autosuspend(master->dev);
>  	return ret;
>
> --
> 2.43.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
