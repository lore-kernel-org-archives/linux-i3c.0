Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD32CD5BAC
	for <linux-i3c@archiver.kernel.org>; Fri, 22 May 2026 19:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EwkqNvpa+9GHhwWwr6lTZ9R0uFRY2eYiiI4zWtfk6W4=; b=c/nP/FwbmSN8E5
	yQwSRcMDUSgp1X2ve/dSkPcwu1eA6SCEZ2m60XwjQPkq58nRyv6gCDarw8/ZC1HOfmWbbp/RxCaQ6
	bf3TCxO6fcDILrfNUmy/Pb/xIqc+JANehj92HMsuR3o3/hSAUh0i4He4pUUIa7/uURqrPcVnngJ+M
	NITDoIg9bfUujcGYUFy5PmCkQCGaNVOwPgH754D3FtbKwblwVTe8XASVrcyqaLNrfb+ZGLDapvp3q
	RZ3l9mwzfQNsacFDSM07qp1VT2TadYcJcLdAZntyyYXzBipqEhl4FqcJHQEYYxkfEL0I78V3i7/NV
	GZh+ZabbP3kyubsKUMvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQVuf-0000000Bopb-1L1l;
	Fri, 22 May 2026 19:52:05 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQVuc-0000000Bop0-4ALJ
	for linux-i3c@lists.infradead.org;
	Fri, 22 May 2026 19:52:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I/4eO955y9SHw1J5kyFzfk2bewE6dJkWhDQ/BAvsLtCtI6Nl3Ivqby2JM2zYO6tuOkhI6D84PplJ4WB+0R3o6Saedc0DHvlFjnKnatwx7qEiSiu3YaK+/jt1WTjrzhh/s2/u9tGxZhrKypBrsWhSJdCCUtfCOYpH2HcxBibeBsho//1GyOHtCs49HrIudtFSZCASL2seOwuVfuzEyWj+ENJ4sdYe/6QF4n8+aCvZGYqisBUm6ZVWsfY9nMf2wo6GpxCVr5hXThdQP6J2T4sOBuWIWbHP8DRk+idTw8L5ag00RMYRMDknWH1vFezn8sfBBV0WASBe7d3Pyei7MI40Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GILfI3anGHlRwzK+89ntv/NL592uOeivN2QuJLiC+5A=;
 b=nVG+bmhMYnJeqAu5I6cdSOtQHQlLigIj+5A1pArtLfrswO0eMSJHKPNzJUrts30xMB0SgRySrYu94Pbn2HzkdUN/fSKt6iRozchSaXQoe1BSmOZKV3jKQ1OpPxxyr68mZr94M6O+kBLSewKx8LTqMsCP5Nn/LthyieVRSXuyl8sFQC6+ixrgvR1fumfa6pQteWyzhbJqj0F9n+BX+kF0vWsdv+BLEULWIf3cQsvXfzsBUCqy9wU7GY1/itoRo+7LqvyYhaLxShp+d80xOeez84dLj2DN3cnwl8sTJmr36m2sZB9pbcriEHWbj+Hnkbk4BdTSt66/B4/126ugA+bK2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GILfI3anGHlRwzK+89ntv/NL592uOeivN2QuJLiC+5A=;
 b=R5NwjIcv3W7N60sB9Vvykgw4CvtRPcYqokoBJnFZfAtBTsOkT4u2MxC81Ypt5/jd0DLaqnkqDT92xqN9vAKs4UgvQp1KA80L7pYD6/xdEf8+qXP0chjrLcHcRXdkXTE8QRp1g66MVvT5sBeP0tgG4buRrOdfrDVIK821OC9SwNVvS4cJjBUKaWRbFoMBSxKXy+YTuCmEUAAIGaFP+kbOkbHK7B/BaaZ6qdDASy60jLK1NS/4U+2CgcXYhcGXc3Hq2S+YDPpOt3OuLUHcTmRJu38JSdwzc05mxMg4tIPrGa9VK00LTBFc/xx/zk/9cq3FEbkuIhhUG3/7Hy6sSnfx0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI1PR04MB9906.eurprd04.prod.outlook.com (2603:10a6:800:1e1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 19:51:55 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 19:51:55 +0000
Date: Fri, 22 May 2026 15:51:48 -0400
From: Frank Li <Frank.li@nxp.com>
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com, p.zabel@pengutronix.de,
	claudiu.beznea@tuxon.dev, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH 15/17] i3c: renesas: Use the "dev_name:irq_name" format
 for the interrupt name
Message-ID: <ahCz1ExvmaSfwizc@lizhi-Precision-Tower-5810>
References: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
 <20260522101815.1722909-16-claudiu.beznea@kernel.org>
Content-Disposition: inline
In-Reply-To: <20260522101815.1722909-16-claudiu.beznea@kernel.org>
X-ClientProxiedBy: PH7PR17CA0014.namprd17.prod.outlook.com
 (2603:10b6:510:324::29) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI1PR04MB9906:EE_
X-MS-Office365-Filtering-Correlation-Id: 25a6756c-bec7-44f6-6570-08deb83b9397
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|52116014|7416014|376014|1800799024|366016|56012099003|18002099003|22082099003|11063799006|4143699003|38350700014;
X-Microsoft-Antispam-Message-Info: Y3d3hGBi2QRKlUptJeo4fWOD1rNASyBKlNMBnHNlDG0vQKl/fBqK/tUmpnPLbJl7W+paIEdcwALlpirT0Cco23d9ml+oPzhQQuS+uNWKjArDMJiq4dcMeXkAse/fxr5bTRkpRcixR7Isvb1s9Sk2GtTjmGKZgAmh56VhoW3AXSXNkVdlUwFqrU9hh3IE5SdO4S4xwqWvukxi48jPLWvEzhYLSOzPcpVJwr+70I5YDmu8amjUeuv4ow+rsgdaD3/gP38L0AADf55Tjvydk7qnfj5fsnZM9xaBXbvdEvTp+pHW3Ghvri8y2dAawHVkDLiCRvkpu5SHxR+nxdKJC6c19Hr+77wBeCYwV0TOBKWprGuy7aAh1LoNu0uPwcsa3NhHVH/S/09COaYY1dbSQ8/k/mgn7Xo1GwfIOODUAi2NFaUaxR4aJfkAh5jWgvrIDV9wb16vMEscthmg04URhfdslc+JqrLJLXw+sMMyZRAkLu44ofUbsuI1xw5JGYwlEya/27pSj4JTQWaD6ID4RCRWCFHdoWc1GG6likOeDTVurflzKzm7vq6rfLeKDfdi3+/owbNdWtAJ8gKH8vig+/ArDADuXIOYvnFlfsdgOCAuxg03BkAoOizdrV1Yqv7X1PWCz6rlqNWPS//j01Dqz8au3Hid39NKsbiODUq7EvnvmNuYCarMEMHdx1BlnH9AM5x90ZQxGq2EjHn19Kylc65d4W3yxjDr78MpEUZSHXvG4sokHCTE0xvZ4wwIAiYVyWOE
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(7416014)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003)(11063799006)(4143699003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ki7lHgHXXHQ1w2qYC685lhJ1QW+qyrw72V1MA5Z588IxQFnycxlQ82tND0mV?=
 =?us-ascii?Q?/7wypOH091ACtFW6yMnuc/c9/XTrJpVUH61fdnBd0vaXUrrHewtn8mZRgk3K?=
 =?us-ascii?Q?EaefFy3dzAYQeyGYJ9DduPDEyY+m487fF/QKK7kmBg8rgBTawEpdOIEQY5my?=
 =?us-ascii?Q?5CBFCTq0TO6mlhMgbXwsznAlYSfF15aisq9Sqn3ZmxWClYkYT27/CJssoN76?=
 =?us-ascii?Q?ce+CcUWGPmbnrR+SJN68LVkWZrFSXYiWzxfp/gaUIX+UOG+CaqB5+m/+piz2?=
 =?us-ascii?Q?AogRo/oJrFljMVqDS2/BFhfx9su6PN5nVuSz0/9SpPw1qey9WTffH5O7lL2p?=
 =?us-ascii?Q?kf0kfVAS5gA8aGVcchmfAaxXs7TpG9Ad9Q85A15X3mY0Kpfo9WMjOZd5cG/z?=
 =?us-ascii?Q?vr1ltv45r5CoME7Oe+mY8NZ+l5/KaHn3JRPmbb46gjZBgcBcQNtBsDm6s0uM?=
 =?us-ascii?Q?/5wKFxg2MJcJlm38n2oYnAOaqe5sfjRU4oU9ADw96S+lOegjyNS0W15hirJ0?=
 =?us-ascii?Q?JHxRrpu/Urn4XiSecvUh6ZfasnsonGOOgXwWjoSTCEiwelIneGXjFuBlPP6Y?=
 =?us-ascii?Q?FemwCIWeaeVPUvN49CAtr905SHltA4espF1MHX3An8rKM6sfGWb9DE84I7Hn?=
 =?us-ascii?Q?MY4c9C/oNjlzltY5SK3u2EysPdZI7KpAktguVqUpIzTR7nEdcMY/08+SWjCf?=
 =?us-ascii?Q?B67CZpo3xQJSZWophslFt3mXXzbuTz4/tYGL7hpJppihIOuJINaEOTrys6hX?=
 =?us-ascii?Q?TxB0+H2fUqPffpAojC2lzWscZYJWlgau1iCWKmuvK5rIlgrLqZYaFGhaDG53?=
 =?us-ascii?Q?Udv6UOfTMokh0Z4Hn0bUXJUlagTB7hcF4Ciua70LvuUhDcAnyB7Rn2pX/h7y?=
 =?us-ascii?Q?kBO9TFTBBTHI9D8w6IawUPLC6GuHqoDI/41bAozkCV4bp2GstBUJsAgZQlBa?=
 =?us-ascii?Q?JvyK3MVckikYLjDf17pIIfDJxrixbxkeBu7T+UtUdPTfQCVhH8ti5cU+MPnB?=
 =?us-ascii?Q?VmQH408Fj23SCOYildCszK+OE34oXkt47awWUpp28U20rQJ+E4p9beS/WM1P?=
 =?us-ascii?Q?NK0+vUH3WtGA3aacjGmrUFUVIu1JrMd6qvsfbBM8cJDkTXmSIuMWoQTV7/iX?=
 =?us-ascii?Q?RMpVAt3iuZwEwjpuXzC3f76DlUiBFvHjVjWtWXmUINHaZ+kKDIdEfi1/YvfO?=
 =?us-ascii?Q?TNIkqIEEOFtP3V8LSYMdHCafUhRST1T2O6Esxy/l4Tox/15AnPeFrc5FfI1F?=
 =?us-ascii?Q?ACwU6whT9QWFgmH5lqg5hiF1guIim4RS9bcmDkgnJnnnIJ6ZCWU3kzJzi7Um?=
 =?us-ascii?Q?zeBZipL8rwzGxAJ/ZFdEAU0xH+zNX5uqBdHboVOq20iH0qy1DyNWoW3eeTI0?=
 =?us-ascii?Q?C29yTgHrlb9H015XniidVBBfapCK4jXO0NtnLwFmRH9RwdRbL0UMJP9KpD/v?=
 =?us-ascii?Q?okZVcKd4NtJ6NYBN47BtLELfZdIgYHPH+waevDLIZYeq2C3+ZgmNgakyEeTj?=
 =?us-ascii?Q?FVQg0a9Pu7trFiDMT7y7WFI+s7C7+DmVdWPgt22d6pfYO53fq1xNcfyuDpZk?=
 =?us-ascii?Q?58wIr0C9WWVCdGn40VxNLQtFoc14Laeu+G5LbNCNBzuLX5rXvoXjF7eVHWna?=
 =?us-ascii?Q?Y147nxdFZuwCeg7jLwsXXKIalzetrvseg6G+pDP23Vf1yYGGxlllWp6Cbt3G?=
 =?us-ascii?Q?pr7zLxwh2cTgKkB8u6uNTCZVJa50hansGyK/ahc3HO+JmdOHYBU4RgfoK2bT?=
 =?us-ascii?Q?HwShfJDh6A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25a6756c-bec7-44f6-6570-08deb83b9397
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 19:51:55.3681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ugk7Rn0HDQRY94K+8eXTOQSL/mLPWGgnzZAVZZ/bb291dv5b7a931faUOoco9cqGToe7zuUWl+TfkSSyoPv7hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9906
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_125203_037060_BE19C607 
X-CRM114-Status: GOOD (  18.22  )
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

On Fri, May 22, 2026 at 01:18:13PM +0300, Claudiu Beznea wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Use the "dev_name:irq_name" format for the interrupt names. This makes it
> easier to identify interrupts in systems where multiple devices may request
> interrupts with the same name.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/renesas-i3c.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index 5614ed99553c..e6e05ac03082 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -1385,12 +1385,19 @@ static int renesas_i3c_probe(struct platform_device *pdev)
>  		return ret;
>
>  	for (i = 0; i < ARRAY_SIZE(renesas_i3c_irqs); i++) {
> +		const char *irqname;
> +
>  		ret = platform_get_irq_byname(pdev, renesas_i3c_irqs[i].name);
>  		if (ret < 0)
>  			return ret;
>
> +		irqname = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s:%s", dev_name(&pdev->dev),
> +					 renesas_i3c_irqs[i].desc);
> +		if (!irqname)
> +			return -ENOMEM;
> +
>  		ret = devm_request_irq(&pdev->dev, ret, renesas_i3c_irqs[i].isr,
> -				       0, renesas_i3c_irqs[i].desc, i3c);
> +				       0, irqname, i3c);
>  		if (ret)
>  			return ret;
>  	}
> --
> 2.43.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
