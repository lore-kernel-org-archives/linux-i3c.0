Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E29CD5BAC
	for <linux-i3c@archiver.kernel.org>; Fri, 22 May 2026 19:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=43U9RqTq8rzPO3AUGP4OaJdOROfsdyhyU/4qSRj1yZY=; b=YczABeiYUVB7lS
	g/RprtSrnpEPfao6fiTHneUvHYk7SCidgLpZs4N/CzaidWJNZOG85qc7Hn61j0z96RrRK5gxoK5Pt
	ii8dEACSaAb9iwd6idz27R63pKuIflk8CSZIUKWEzSBCEky/PvM72F7yi7Ikq4j0wQ/uK2IxPSY0B
	olJQ3+gIJVH6UOTKLvH/cj4a6JLhE7xydYmVwDVrQEEQe/63Tg0otm8XExwtyOUFITrnRsueX5j15
	9EQz6cotKQ7OFlJs5xGEj70AQOTQUYziUJsruIO3oWgtmDzTBv74avNpnw6eJ7Q5Oxy/DrQSEYKE0
	S2N6Ze8ziFeWuq3Yznkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQVrH-0000000BoVA-3hIh;
	Fri, 22 May 2026 19:48:35 +0000
Received: from mail-norwayeastazon11013061.outbound.protection.outlook.com ([40.107.159.61] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQVrF-0000000BoUS-2wCf
	for linux-i3c@lists.infradead.org;
	Fri, 22 May 2026 19:48:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kqDN05sm9m+JDsejPmScWH5/WXfMkRZ/K7SvwNMgk42dELdhmO7RZallMJ8llfHorJ5bUV88FQmgh50qrLMWwAwW3cC7Jqza4Q8JFnWTQBVFxmsIS9HSFqHz5Lo4dV+bRSBxLxrnCGfpk6NoxnaheIMmQx52h0RFwzCGT5hkXdVpih0Q7JRXlxsgP1lxsNORNvB2fS8gHx37962KDaJEfhXicFZk7dB4ePxCBR2F7bcH6I4EN4xrc4C3URTwx4IHs2Ux+0IcatwwP5sX2SN8GqxLpAlIBXM8StFeV/We+xzWWBJO8GpcYjJilx2d/vGQ2WcPF1APhY86JKnkCevtMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cO7ki7qjt2JaLhh2jGGUvnSp1KOV2gofdNlIgkV9Hq4=;
 b=BBU6uollt3rnuyFnP/iaxMh8LB6oqyNgEPvEO+ESNAQ7mi5uezCRYNPMyk3KIBmiqlhIMQCREN48XSQCN7GpNNsAAa1m7A/SPwYwfIEiBPhxrzwHyZH3PpZChYJmpUkmivQkc2V9u78E6WOZ4+00O8uZfQALHvPld0c0hL896p22BlpO/jSIa4DJ0imwIPcU1O9Tg05vO+uu1Pn1DNHLYVUks+1F+5uoJ/5TiIEGR7C2lLIYPkzdQMdFqM37U+8QtMoPnzbtM4nJl5taJ1mKpm8qurMAj+YrRqK0F/EyGLiPlCjConzM0Vix+9gdaOC9zSviOrgkJ0zvRhSkUWoSxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cO7ki7qjt2JaLhh2jGGUvnSp1KOV2gofdNlIgkV9Hq4=;
 b=e+5n1PhwJKIgcEh6oS0PPBu4qhZC1qWgcv//ek50qEnV7L3OXP7pV/36lKNmWfJgdNNm3ljj/mjxzJI81fjOFsKMCoUyXCqB4cxa4frcXHH1/jzjuEowrGFEEyiCQZpHsy/hcNV+gdcvKlkU7y69/YF4fvfgD5uLEuTUaEKxgP7kPnkAvYgZ43mQ7HJpwjJGu4tL67a8FTPcyXQP93BhFNaDr0210/elODusEnJ7fK7rNG5SBNgzCYDf8MkpB1qUV4HMZTNIv95FWHbpr+0RmuwBZv/ebD4rqFUo+iB013fbWCufUzz7oKS2sNy6f1J7icWVBPPcNTKbhiNmloJ7jg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GVXPR04MB10753.eurprd04.prod.outlook.com (2603:10a6:150:219::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 19:48:28 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 19:48:28 +0000
Date: Fri, 22 May 2026 15:48:21 -0400
From: Frank Li <Frank.li@nxp.com>
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com, p.zabel@pengutronix.de,
	claudiu.beznea@tuxon.dev, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH 13/17] i3c: renesas: Update HW registers after SW
 computations are done
Message-ID: <ahCzBTwpdsbkLkLm@lizhi-Precision-Tower-5810>
References: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
 <20260522101815.1722909-14-claudiu.beznea@kernel.org>
Content-Disposition: inline
In-Reply-To: <20260522101815.1722909-14-claudiu.beznea@kernel.org>
X-ClientProxiedBy: PH0PR07CA0099.namprd07.prod.outlook.com
 (2603:10b6:510:4::14) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GVXPR04MB10753:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c08891f-16f1-44d9-d4ef-08deb83b1842
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|52116014|376014|7416014|366016|1800799024|38350700014|11063799006|4143699003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: ydrZNyuMZZXuwBYDgkYDl4CR45zlxNnzWJA1zZhcxSY0L6wRKwUmth0nLtZC1wVb92SiMOMuSTFcDCGq4sf9L4VPHFCbwPnZH6jiuyWk/pHBA+jOgCxJFDF9mMvxIQ3UE58eK9g7JMtsqMTyDFe8rNU6MT2vetPIcqCt6hb9Sd+1xLAq8zu3BNfyCP1XGqp/cuRBxYy5pfUrU+JvcYOuEqjwyPlThicTorY6jsAPL7ai/R4QJ4V9qvWAaFNZTBRSJCZkrpNKNqGZ/vW2hYoraV7glmaTdB1f7vea26KBIM5g6YlsI9pon3eBiv+GuB6yh87yLJXvpwZa7Heg/2fHzxFHDPMcH3WkJ9EzkNxqCfcJ+VHPSWMO3RqjHXFNa2P7lht/y6L1z1JFd5IlHaqkQbGFnVudgEqmaBrVbkBoVSScM9/OuwN8HKk/ycSpV+MmEKOMBTIGognyY+ST37oLGgR+LJU2hEgfAnQh/Zdw3ylrNL8Rz8NZwd03kPodMx0JUAiy69P/JIVRCzGg+1uLM1dr9LPgdW/d7M8FOW3yOFj00UaC3RgIVoMPurf+xKm6mIxZfIH7tjIPmC2wWVg+NsuspXeMuKGlxCbrQ9zdi2M6BUKSzPIozVoZ7IGjoI2RZM4boQWXWlRgAXj8cIgv+KdoWr5KztCGu4PiZzikPf4OR8YgOeZ9PE5dJkyeBkTc282FFdXNx57+c0OySsFkTfc3rgwc8UrU4FhQ68ewUaSzW6mNQBHhLNEJctR+RTZ7
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(7416014)(366016)(1800799024)(38350700014)(11063799006)(4143699003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QJJrtPtxQVB8t3c9EmeEChistDsBbyjxA90ZtDK4hXsOn89fltqPfF7FmQlK?=
 =?us-ascii?Q?EJNY6FYoGWVKb7qxRi8ECkX8soiuYEn8bH1Fwp+daE0XNuZiq7++XO4TH9B+?=
 =?us-ascii?Q?JfyO/8j/zmbZj6e74j4dXc0ujnb9HDyEvLp3FP87IqRnqDk9cGIxJPU9AlxD?=
 =?us-ascii?Q?MGoPLNkGHB/UXO5DgQl8Gk8hBc44WnxuYuDMTyqzVudXNLiyEGjzzWZ6G90z?=
 =?us-ascii?Q?bAdcxY5zeMJ0BkOqyYL7Bd0kY5hEp1TvgGDMBcsVPMExjLyAOe0Fcd3dugP/?=
 =?us-ascii?Q?9XVWlTNaWoOUbquwI1d1yqZOllfz03iNMXKCvqyFpAtLxVQvRb4xElJcGgdQ?=
 =?us-ascii?Q?eFvqZAdJoxZRvnxe3iwnmklrMdinm2UTkIRUimtwW/f+AXglF1Q6/FMvgnHT?=
 =?us-ascii?Q?eJ9iabYJVYcJRTIiKSoTzfHmAUAdSA7XN6TMy/TBpK/CuF7eyMzNVKVn9TF2?=
 =?us-ascii?Q?l848KQcoG05uyTGXGA+hEtrDruUAatQ7i/rJvPo5R2Wv+jfAYr5DsIrC0WOT?=
 =?us-ascii?Q?FsjEubzJ4/TevOItSJep5qnduvZvHw/K0R+deGPgMFZFjku3AbLDhgoft+6r?=
 =?us-ascii?Q?+pfsCYeiJt2pqahLm6j4r0b4K/+CfKtrttVlQfRQatVEoa6NDzvw2z2BlRWH?=
 =?us-ascii?Q?+MQ0mS4lNa6LdubttaJTf+0zqvFAHE9hEU52lHiGsIzxAe2kcNSQ1p5jaFug?=
 =?us-ascii?Q?r11vwOv8V3QV0Zur9xqJuxWWPoMCiy1xDsQMk3SmN587o6XC3F+x5YIlqMg2?=
 =?us-ascii?Q?Zme5IOa63FPUnU39SqTF0e+1MKTyhXSISdQJ9dJGmV+xpgIYY14BOUyWXcgH?=
 =?us-ascii?Q?KVrmMZ1ZCphDzRciUhweq8sEpDfTIA5YjiVEwhZeODqN9W5dU4rynZlRimsF?=
 =?us-ascii?Q?Wt1kSQHeB3hvwUE7ZURhnOMNdSlN/ZPfP4slxJGcT5uH5rh22QTC8J9B7TtG?=
 =?us-ascii?Q?qcFj//IDjqRMuPzhjPdFaIPE6ZtRDu6s3+SwrTMbhrxAlPxVxzv/xWQzZEaw?=
 =?us-ascii?Q?M3b5W+vIIpU6RYrvtgZVo25yT0AjY/giVDrTp4VnD3U+1bSndZFrXqfi7wKJ?=
 =?us-ascii?Q?CKa1HRps/likXWkzkk45X6FCI0SZBC7nFuFMo3hrkUxWb4jS1Kqk5RoBDCQT?=
 =?us-ascii?Q?yXAClGF6mkt+MuRRk5iB1tbEXk4m1SPqvW/fL4W5x/ivYYetW5gLtzF0Y58z?=
 =?us-ascii?Q?f8K9a/MQfp1b/v1emlM12WOo8UbX5B2Xp6WBVrv/0nCM1lT1xo/n4kwbrB9v?=
 =?us-ascii?Q?9Sv+CkX/wMm4DFr6z+zBfcM5eTTB6QgD98TLACqiBUrdHhHBrsHxRv1gKGy5?=
 =?us-ascii?Q?WXygOVKDU7Lzx63v739n9T96upB3TscAJoDbXYG/tWk47CA/6IMWthVxdBPT?=
 =?us-ascii?Q?m+wHLER5JmN4HNJai4gy8ACZvpJO6GRPVpcLlh7EYRPyRAHwuiOQM3q+ssG4?=
 =?us-ascii?Q?P0V73+iKtCqJMLaGKjyTJP+BAcE8OOS8CXX2Y6ZRS/J4POHmzzAEZ1HUBOwF?=
 =?us-ascii?Q?5TEIYgYSpTyj0jcNlXVdJjZkGT3rnRr0mgvLwN0UdP22AjpWghNQngWselJI?=
 =?us-ascii?Q?is9upLW9IdseVgcWDNHBL9tSr2JWJVlLU5fIKdBVBAwjknyI8ji1WWTXTOVR?=
 =?us-ascii?Q?OqovQ9ETLoLcQ5vl8t124UxPi86zx172xlomFYITh+QD72YPcCblgb5x2OQ9?=
 =?us-ascii?Q?YHjAcOSYqb6YoIgZ8fZkaBm2Q1XKupIlGXn0c5cHEBtFeLJP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c08891f-16f1-44d9-d4ef-08deb83b1842
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 19:48:28.4461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yt56M+SNL0sL5gA4jVuhIxcWkZe2rOedDJS2dUTR/bufd7jfJwbClTeRR872EAJdQdGcSBSyVyHKZHBzeWD30g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10753
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_124833_743861_DFF70F17 
X-CRM114-Status: GOOD (  17.45  )
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

On Fri, May 22, 2026 at 01:18:11PM +0300, Claudiu Beznea wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> renesas_i3c_bus_init() performs a number of computations and software
> cache updates, interleaving them with hardware register writes. While
> this works today, it makes it harder to minimize the time the controller
> must remain powered when runtime PM is introduced.
>
> Perform all software computations and cache updates first, then update
> the hardware registers. This prepares for future runtime PM support.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/renesas-i3c.c | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index 865e67ac0fd2..631c9c5d8038 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -550,10 +550,6 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
>  	if (!i3c->rate)
>  		return -EINVAL;
>
> -	ret = renesas_i3c_reset(i3c);
> -	if (ret)
> -		return ret;
> -
>  	i2c_total_ticks = DIV_ROUND_UP(i3c->rate, bus->scl_rate.i2c);
>  	i3c_total_ticks = DIV_ROUND_UP(i3c->rate, bus->scl_rate.i3c);
>
> @@ -604,27 +600,31 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
>  			STDBR_SBRHO(double_SBR, od_high_ticks) |
>  			STDBR_SBRLP(pp_low_ticks) |
>  			STDBR_SBRHP(pp_high_ticks);
> -	renesas_writel(i3c->regs, STDBR, i3c->i3c_STDBR);
>
>  	/* Extended Bit Rate setting */
>  	i3c->extbr = EXTBR_EBRLO(od_low_ticks) | EXTBR_EBRHO(od_high_ticks) |
>  		     EXTBR_EBRLP(pp_low_ticks) | EXTBR_EBRHP(pp_high_ticks);
> -	renesas_writel(i3c->regs, EXTBR, i3c->extbr);
> -
> -	renesas_writel(i3c->regs, REFCKCTL, REFCKCTL_IREFCKS(cks));
> -	i3c->refclk_div = cks;
> -
> -	/* I3C hw init*/
> -	renesas_i3c_hw_init(i3c);
>
>  	ret = i3c_master_get_free_addr(m, 0);
>  	if (ret < 0)
>  		return ret;
>
> +	info.dyn_addr = ret;
>  	i3c->dyn_addr = ret;
> -	renesas_writel(i3c->regs, MSDVAD, MSDVAD_MDYAD(ret) | MSDVAD_MDYADV);
> +	i3c->refclk_div = cks;
> +
> +	ret = renesas_i3c_reset(i3c);
> +	if (ret)
> +		return ret;
> +
> +	renesas_writel(i3c->regs, STDBR, i3c->i3c_STDBR);
> +	renesas_writel(i3c->regs, EXTBR, i3c->extbr);
> +	renesas_writel(i3c->regs, REFCKCTL, REFCKCTL_IREFCKS(cks));
> +	renesas_writel(i3c->regs, MSDVAD, MSDVAD_MDYAD(i3c->dyn_addr) | MSDVAD_MDYADV);
> +
> +	/* I3C hw init*/
> +	renesas_i3c_hw_init(i3c);
>
> -	info.dyn_addr = ret;
>  	return i3c_master_set_info(&i3c->base, &info);
>  }
>
> --
> 2.43.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
