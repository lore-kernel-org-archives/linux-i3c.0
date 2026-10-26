Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FB1606A31F
	for <linux-i3c@archiver.kernel.org>; Mon, 26 Oct 2026 20:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hsDxEFew;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=A3FJttmi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4+Gy3WAXR3R7cLbsEFq93tsRwrPtJ4H47GzNzoaT8eE=; b=hsDxEFewHfn8Nwqy1Sgyv6lzFy
	SHc0V4dZ0KSxC6/aooFsAywEXFZRmUSQKTVkeXwDjs/JOsvzRvGLwBJgiIAW8kR6rfbb/DFgGdko+
	6A/QdwFPq/FVsUnXVmJBNhPM7OEXRpH2jLqH4ru0hJ8U9ZGWX5l+vRHaINDODHx3D+/cna9Ug8e0L
	E5wwMKF/QwpV16mm5FaqVZxWARUZrv9tmAQMDbOwPgDtHB0sAvwGryh1XjcgxVvxUcukgxproY/De
	OU6Lu5uMZOVKE856MKpK+X5LAqfD1kJ8GbO+nVpoV52asWRUOxec5haPZh7dIDtw236FjdcwyDA+Z
	As8yGdFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLRF3-00000003DMV-3iXQ;
	Mon, 26 Oct 2026 20:24:25 +0000
Received: from mail-westeuropeazon11013055.outbound.protection.outlook.com ([52.101.72.55] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLRF0-00000003DM9-2yhz
	for linux-i3c@lists.infradead.org;
	Mon, 26 Oct 2026 20:24:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=odgowE8+rEyYnT4g0C7ldlXmnnx7WFkWGi2j8L/e8DwqLlh+5a73qJPt2OW8VtJRa9ICCobj9FSnEQVZHsB5AKzA48DRsetkJ9LMJ05QEIwVQWExImqDY4sBa74Hw0W9ZtglnTXyhjIyLY9bYG3Ov6ED8Ok6RNj+di62TOGJ9TrhmTJBUyDvBv0E+LuwpjJfRSSqhe9762BSq0C1KxcY+hvPnGg0iRRdEoI4uykAeXLiy6jtTWSPhsIFjYhCKwBjYGnrZNVAoQL61dgXKx3D4nDSOPrLZi049ILbWUdnnqLah/HLih76x3XX4A2xAFJ8TAu9XfEADlc+5tBvy4cWsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SgVJb4h6XK2+irnLfPO1jG/0wdeKUmteLBCXL6o2cVM=;
 b=lb8OZqr0oMLA0e7CJrVYD7OT3s7EiQIVzln/P34kyfeV/DafPCCwtonHr46c7dRELldk8nNUSfLyGmyejozx/+XswFOGVOgKCtcOXAkV7cOfQH81ELyoVHnOSS0A99YTuInz04pTlYOsCxnh4F2VQ0iwqywdEgBZdQ/XP703IdNyR39n8MTdIbHHV6Q3N11frP6veVQJtg3sb/zj02Pg0/Dixa9Bb9Mjj1k61teXylZ10CXNYNgsUvhNZlsbJaT2ovpBZR0Fx9VsKWjxo9NlQfmEhMqbpKAYgfSRPdWBGuoSjiMHK+rUZeXSD8D+yEYgZJgEKM1iYkj/eW3oD42Kcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SgVJb4h6XK2+irnLfPO1jG/0wdeKUmteLBCXL6o2cVM=;
 b=A3FJttmiXt85AErFOegofIgYx3INZs1n7SAF+u9VTqGj85Xtgx82jzLP5AGt2jgZNoU4Ks4lBwv1/IbbFtn6n+YR3Ac9Zzdgx58nitfyERyXQss4JBYqWlZhOtOZldNnvWwJK7uhZ59h4eblU9z32r/4i+2RaZrJdfim6YOWgta0QeVvq/Lv7IiVO0vm3DdMQX6IJ0sfMK/NGYiflO1WlxjmpAZA7GQo1bZXZ0yeBvZwzDWsqNMTCjDp0Csw+ysgrcvq0nvvpFc1CoEMHDYSZMaFQxPKj2xY6ZwW92bYqnD/kWG4QfO55bVFrfGzgyJd5J/V1ft3k+XFh6rptxHn3w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DU4PR04MB11361.eurprd04.prod.outlook.com (2603:10a6:10:5cd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 20:24:17 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 20:24:17 +0000
Date: Mon, 26 Oct 2026 16:24:09 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Diogo Ivo <diogo.ivo.sx@renesas.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Linus Walleij <linusw@kernel.org>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/7] i3c: renesas: Fix zero I2C SCL rate on pure I3C
 buses
Message-ID: <at-26QiDtxJUra5p@lizhi-Precision-Tower-5810>
References: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-0-2e76b87209bb@renesas.com>
 <20261026-divo-ssgrlpcsrc-2966-i3c-v2-1-2e76b87209bb@renesas.com>
Content-Disposition: inline
In-Reply-To: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-1-2e76b87209bb@renesas.com>
X-ClientProxiedBy: DM6PR08CA0054.namprd08.prod.outlook.com
 (2603:10b6:5:1e0::28) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DU4PR04MB11361:EE_
X-MS-Office365-Filtering-Correlation-Id: f1d42f11-b642-4ae1-5c56-08df339f1c39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|23010399003|376014|7416014|366016|1800799024|4143699003|11063799006|56012099006|261021123027099003|261021121427099003|261022105027099003|261009221227099003|261009223027099003|10067099003|22082099003|18002099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: 5bqER+VOEOyJqXkpxguEFE+RvLm+kDQva2fTsu6TxMVrB2BnwtAmKciTxP2DdFXxi4+b+u7Z9KhLzNVcLBZlyQMbKzCFyVeSlgz2k5NpifxOyaT+fv9iTLRowFlyqwrsuv2CjDpLfkmeqVGKgIXbEQWZ/naPlYCE+7MPB4iWTaNnEWRHFKn1VyEHDv/QfP+hYnTMJPYoAzgOlD4kvBQhymfWW3iuwskqok9x1mP05PGg9RFE7IQNr06cj0iHk+LAFobd0/vJ4Jem6LWr5TXir5409jBuIyLwWiKa1SkkoYhf828tCeFVtNJezZwO37WaisHR1XP5MD3oqP5DGhC3jZ9W23hrrj65kUfm333m30BFUlMkJ9s+GSQe9nPcfECwEV7m5cyVwdkKO4P7c6EvQ2ybyQMn95RcPcyLOoknN/ewH5sojJ+tHH6CojCXQgEP67tPPS4UzL3oMhjjBz1dXziTNwPHnKG7J0qQw0wUdxwmT3fKLFo5HT7fm4Vitg86GG89MOaJgmrXWugaLFpQjHQTNxPSb2mruC++1wh1yc3P8N9d4zrJe3uXRbNQn3wXQc+QiAC11Q6gfHU5Rap+SzEBVphb/77yjObe4AJkni14KABCsZTQYflu+NkZXmhBtdHb+YAQOdnZjIUq+CAt2jsnFsgsCaNI+YdxA3n17RU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(376014)(7416014)(366016)(1800799024)(4143699003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261022105027099003)(261009221227099003)(261009223027099003)(10067099003)(22082099003)(18002099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tFN/YGbC49i6GBJXfH3efhaKTYp/EnktbrWbd83Irglhchyl8E3pxjOBjdlM?=
 =?us-ascii?Q?Kkn9HLc/pHtSmxMT7EF7gpOSRRbBhuXYxIC49SRCqqrsPkx2M6MxYBki63mt?=
 =?us-ascii?Q?Dn03Nt7dXBg+3SurE5OLU95DAevHYwPo8amn1D4whkM0RrR9c2+P0EOpP3rP?=
 =?us-ascii?Q?6hDXtfJow6gzoUGz77XRxIq4K6RrUxxgIqX5n5NEV0IqTxorjNUMnHD3C7nZ?=
 =?us-ascii?Q?517eUyYmTonyfGx0bWWK2hlKeNadawqFSnDQfXfdptrgpgADvP3Zx3I3LBoF?=
 =?us-ascii?Q?cniAAHrVs7EtVHVmaymnKKBq11he60hBtkeGLbiJmCnnlkTqczD+7xzqfL4V?=
 =?us-ascii?Q?gsiX2m+DrIXFpQ4ymG119Z4JKXwt6ZYCysX154T3xy4uHl/qadTX5PlbojWy?=
 =?us-ascii?Q?aIcyeeEHNMmlRcaJHhKhv09FmrU6H8ddPtzqUsx2HCLtsxaf/VuCjDoztfAF?=
 =?us-ascii?Q?lsx9euUB1r8JagK9qMQb2o8jv3CRrA1QftrwJ+YPTzl9CLcl3h+Mq12K2IKo?=
 =?us-ascii?Q?pT9YaCsgne8qLAwmarCpMcMUR/1Ukwi1gLj9mCFhy0Mr14iAMjtiU83B01OO?=
 =?us-ascii?Q?PxuUApr74JVmTUS1agaPSw/CLfXESysQ2yxGwnARidtvwUQkGMVTxCC0pNk9?=
 =?us-ascii?Q?JYQ29VNBtlz8u/avpPr5r8ZzkS9P2e7L3uLhM+XaJNraM5anHwMOEqVL/Jk5?=
 =?us-ascii?Q?jrgSAcI+V14rbANjacT+ai7FRJZFIs1QdaC/Zw/i1eKqiiJLb9I6xvdFJT4K?=
 =?us-ascii?Q?wxQoZMu0Ry21EksvFvQ+CsGemdm9OV70bfGSjx3DTaMrlayc9t2tSd2SKf9V?=
 =?us-ascii?Q?uGHjQfEgKBdFPcAdfcAu26dEXxAfPuR1kTYn1T1vNYO7MKNrD9xpPiXFO7bV?=
 =?us-ascii?Q?tUw3OQRgcSCjbiCiCVi+TI8TxSB67LCSe/0Wj6tzkhm0T6ug6FIoQ1rO34Cg?=
 =?us-ascii?Q?cmfTSMFoEBX5YMFDrH8M+fXjtg7tjOwnzyK78yJpmh0Xi9QExLQU3/NaRN4g?=
 =?us-ascii?Q?1jr858UErjFmYem6AnhV/+tsC8PjCwsw8mC/JQvGZ9zrlbEaVmGPLVgIapLY?=
 =?us-ascii?Q?dl0lxurfGMjeUu7Pjae+4lKEwzF8cgeQOzIKiPTeg6+lUntCCeujv6jbAk5d?=
 =?us-ascii?Q?ghKLbgJEQjLRmOgz8qM1wYEhzpDd0DoiSFL7qMWq6Y6bqtt6q68+CJpmaz54?=
 =?us-ascii?Q?Hqb31cZkn5VU8MjB1gD7DR2mziG0wLFas6VouFEras8vxXiQVawDt0PPWI9g?=
 =?us-ascii?Q?IYW/50UOSbIMG+Dm8YY2XLQX94d/2a7dyluxY1XRkKDHEVXQmkaOvcavYpJR?=
 =?us-ascii?Q?pvCQtoLH8eqPZ/ipnlNfVXnd4tscdke2RQv4+C/VFkYAp8VLFCg35C9BQe4R?=
 =?us-ascii?Q?DX9wk7HLiVW+HKB03nLEreclRGgebZJQ8jL/oRMbn224jJ0qU2uf9tK9nE5k?=
 =?us-ascii?Q?NcxwXok/twW9xSXeYl+oI+2DIP9gVe1DDQeny6zsy7rtKFF7wc3OiSQ1BQ/6?=
 =?us-ascii?Q?PwR4Ov/e5dgH5SYfftvelhqgKjoPS+tPD3KTvMHcoMvCFmaggIEntrnXUpJJ?=
 =?us-ascii?Q?G8sfEPfxv2GoRYRLSZNb58i8HkFWBEZdgQ791VZdcPgJvsg65WNjXqIdoqAD?=
 =?us-ascii?Q?e0haelI2MDWcrqeOnmiqIq1+2rkJGURafbmKfZ09+bk5vZOOhKWPdV2LN1ti?=
 =?us-ascii?Q?VoP/+NxQbmv/kjnJyA5LswqHNmxjxwfDQf4KZcBinSoqZirIsbrkLXXday6Q?=
 =?us-ascii?Q?0e0keADI+SDno/bNeuNjX/kgxntMbBBh/ihYFPs6s7yiYtsaXfip?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1d42f11-b642-4ae1-5c56-08df339f1c39
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 20:24:17.7053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sXarn4ESrdYAAy+CfXv0SZpVFxGZIWViswrjU8Z+e+3rmiJx6lfpF+Qlw6stDLP3/HuNxlZpFTsyu9cOTELLOeRewE4FsNCy8PEPhrRcaW4D2jNQ2vFDlwlqdGsFj6Pb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11361
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_132422_756981_413DDF35 
X-CRM114-Status: GOOD (  21.46  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 26, 2026 at 11:35:44AM +0000, Diogo Ivo wrote:
> On a pure I3C bus there are no I2C devices, so the I3C core leaves
> bus->scl_rate.i2c at zero if i2c-scl-hz is not specified in DT.
> Deriving i2c_total_ticks from that zero rate programs a zero-width
> open-drain SCL into the STDBR open-drain fields, which are still used
> in pure I3C mode for example in DAA.
>
> Fall back to the 1 MHz FM+ limit instead, the fastest rate an I2C
> device could have, so that a sane open-drain timing is programmed.
>
> Fixes: d028219a9f14 ("i3c: master: Add basic driver for the Renesas I3C controller")
> Cc: stable@vger.kernel.org
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v2:
>  - Substituted if/else with ternary operator
>  - Picked up R-b from Wolfram Sang
> ---
>  drivers/i3c/master/renesas-i3c.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index 8b264f72e55c..78d0a2c4a19e 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -579,7 +579,15 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
>  	if (!i3c->rate)
>  		return -EINVAL;
>
> -	i2c_total_ticks = DIV_ROUND_UP(i3c->rate, bus->scl_rate.i2c);
> +	/*
> +	 * A pure I3C bus has no I2C devices, so the I3C core leaves
> +	 * scl_rate.i2c at zero if not explicitly defined in DT. The
> +	 * open-drain SCL fields of STDBR, which are used for the DAA
> +	 * pending read, are derived from it though, so fall back to
> +	 * the 1 MHz FM+ limit instead of programming a zero-width clock.
> +	 */
> +	i2c_total_ticks = DIV_ROUND_UP(i3c->rate,
> +				       bus->scl_rate.i2c ?: I3C_BUS_I2C_FM_PLUS_SCL_MAX_RATE);
>  	i3c_total_ticks = DIV_ROUND_UP(i3c->rate, bus->scl_rate.i3c);
>
>  	i2c_parse_fw_timings(&m->dev, &t, true);
>
> --
> 2.56.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
