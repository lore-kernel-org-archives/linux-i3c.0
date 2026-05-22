Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED938CD5BAC
	for <linux-i3c@archiver.kernel.org>; Fri, 22 May 2026 19:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YQAzvqBzLWzV613bIfuiedV75KNhctvY+xw8L0WKjn4=; b=PVxlwNytQLMLQ9
	ooMxwfhDB57puUwFa7EWRwKh2wHp6KSIu6q2q4VMSHmlppMvOHEXiOGYiknpaoUDNsah7npmLwNmZ
	TQJb491ZnSpEqGwz/yE2vxCI1s+TU6H68yFqSPgXyuVvXBqlxTDjH+FpY/GXyjCMcgxeJAquFgzm0
	njHfNQT4iP1tJ8GzOlqWCb/TLH/euvh1NkJmbAUW67hvJPv+dlmqliB7dfapcf3R9FYiQBZqo2Tm3
	uqT8Fvqe7LGX3vEswOqNvoiiZPfojjLVODjRBapSwCkSO7lM5TN820CWaewEYcuYmQvnk7qTXVQ+r
	qcOgUOHKpxQdXjIMjWDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQVHR-0000000BkHf-26NF;
	Fri, 22 May 2026 19:11:33 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQVHO-0000000BkGu-3iOc
	for linux-i3c@lists.infradead.org;
	Fri, 22 May 2026 19:11:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ih29QXDvM2iD7+WHTTBquSQzUoP+AGGILnfts+5p6cYDG1ANWt4K9L93lMAEKC3K1438tO7WK/JJQuuklJyYESDk7Q5x41qnJsHtCYNNwn+1OCbFu9WvtiKmqtC4GyeJkSe0oycC0CqYm8RJMHKagomns4Fv08rFt01KG+OBB/XCrZwx4iV5HwsMyiECSPcTUltzULg25B0Vpyte0Jduceq8yIv8N/15YrfA2KrWX5StL0kEy2MRs7YFtSfSBkvAFzV4IPEN4HvGwNSH9ng2iIQpiuw651g/95K3nnEA8JZNCOEuHNB64bZqTTheW42uX4ITmumbsoevKo+aObbvxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DbncGWTYuVAT+iZMRao8S3m9b2JF9eQyAAb3VM8KmqQ=;
 b=bQhZA6tdHY+2bXg9QzCZJCT4IaLa8MzfNTRKznoPoYTSFCAdRu8M4dbF8pn/WfMzNiarUTz+fJWNtdKrh3axxQtM48aY8bgfipj+zwc4FasAcbrGMNhLiD9/lPeWgBsHZqs8OiV90GX//Lq1Qyb59nmT48oy35IfpAWXO+8yuk0Gx8zsXDXskTlrtiviQfhhje+WwkBGUVyuZe/SaxaEdLESHBaiob/hKXuAuMNAmNRIm0sCMd8CNJkMwXN99vwQxpJAqfFMSj3lbWL341ZE92Vmz370s1sxj6zxzs0mRwxNE2w0irjsWeODyyzy1X2KOHz4ufWZrJ9EXlMFxovBuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DbncGWTYuVAT+iZMRao8S3m9b2JF9eQyAAb3VM8KmqQ=;
 b=CSQlT28gFKQ3nQT+NBSfSmZx8jVXriE8yzC0uJs/4sThWJRTaIaq3uMx1HbiU3NM4k7rJbJio8shmuCCyYeIZrJuKwy+mVWNbchY/CFKnYSXh6EKifAD16ZCeQL95r31S3aHEkDo/yxU5QwKyWTnQTmbiZj9Z+9LDkZjbTgfZC02P3TXWU5G509C5Ve0Qk+ayQFEDJCbwb1NKndwFpJUyk5jb8DvhQwBisvNtydHU4liLiA4dF5iWH7K8vNb8Y9tQGmi7A4Bb1c2/iJq/qunSLOQpEiQNtbHLWN5wVTy3Gf/iikYJdyY8Ofj/NcWiYB9w/LzC4gXdQMZrZWivHoVRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB10300.eurprd04.prod.outlook.com (2603:10a6:800:218::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 19:11:26 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 19:11:26 +0000
Date: Fri, 22 May 2026 15:11:20 -0400
From: Frank Li <Frank.li@nxp.com>
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com, p.zabel@pengutronix.de,
	claudiu.beznea@tuxon.dev, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH 04/17] i3c: renesas: Follow the reset deassert order used
 in probe
Message-ID: <ahCqWABV7Li4ZqSq@lizhi-Precision-Tower-5810>
References: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
 <20260522101815.1722909-5-claudiu.beznea@kernel.org>
Content-Disposition: inline
In-Reply-To: <20260522101815.1722909-5-claudiu.beznea@kernel.org>
X-ClientProxiedBy: SA9PR13CA0005.namprd13.prod.outlook.com
 (2603:10b6:806:21::10) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI0PR04MB10300:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ae73f12-d92c-44bf-ed3d-08deb835ebad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|376014|7416014|22082099003|56012099003|18002099003|38350700014|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: Xl22BjtownezqfADzI2bDJMTqEhBkla4nBnwCBIg0beZktTp8GDbwWkJCzf3A1m/LtQ0XuGEt+g7zNtKbvPP8fm1mdR+0iKMtK7MoOW54hBi3xSMKYq/D97DLRnv6ET0fChX8CfplUjusLzgFTFou/B7hL5g+fXEQHLJ58xwi1ZBdhI8pZg5joqJWfWFpJ8PI6LgGsjIWZ4RUEt1HB688PZn5doaCmGwAXKzCIa8xenZuBKUQsn9jM8jnVvuoBIsqu+j8gHFwouirr0jDarzI5UIzuywFVk0ebfcjgsEo8jy24qjK/44rXvzL82TLMrs2w8u9cjh/TD2pEBfDNthQtV78//26CBwSEuk5ef3mkozvUeuLmfhSXTXrO60TiibtvJwqTfyHqoD3pFJzuRlUvynCMnEqw+SbE4IJv8rMp7GxRH7BTKF7hglluyJBPhkBIdHGVztRuehvrHVtok6OEJYNF3GkuVfKqjO3ShKkxqrglT2G4h4OYxmrvIERrbye4lvQc5YOBYBBB/rOQS6JM6Trsto/XS3Wvxb67JPeWajOdSe5LfzmPgomExXLATwfk91MaQlkjnaT4tKkSRR8Ady4V/MqowU4KTM7TwwkER61aOEHjdLfVbKWToe1LpwN2dMDKCvWLfUsskLrxX3UJXjoDyocasZSNumoX3f0KCNkqjm6d25czXltRnL2meroNtlXcbmfVS9ZtmLljVpPfLBCNJ9ueXDPuKbMtckV07bIhUN2cgBgGRDzVPuJokZ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(376014)(7416014)(22082099003)(56012099003)(18002099003)(38350700014)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IohoBjhc2ftW9HbJCeVJ+XnGufaNOdgiI4rhTflvHUTcLvBGkEYVu2PV0c8+?=
 =?us-ascii?Q?SvkbSiw4j8bcAP6sXkzzoKdxOkI21Au9/KRVw2QToB4884z5QjJGUkZ2uAVZ?=
 =?us-ascii?Q?0YKEZYynceMxK9Uv1wMBewgAUSC3PqFVaBHDKc27roSfehPvSpUD2P2UO8bg?=
 =?us-ascii?Q?gDHClXMJyJ3N8oGYOK5VeTF5ldNwbIj8X2xeXuLm8ghKghGXJDIYdFaA4wnM?=
 =?us-ascii?Q?QaSpHnoJrI9a6GsRsm8hnt/bpX+oxXo/+l8ql/ztiBSMIp6+d8EqOE1K2Tq7?=
 =?us-ascii?Q?hO6GgyR7aTJUhWQy13txxWnx7MMXkrochTlBG2flDhX/uPCAiCYeNa3Qxf0j?=
 =?us-ascii?Q?D+gHeZG9f8w0Vu+h8nAQ90repb0jYFwxSpbPPqHlbNY0A09fsHQZF2TO2m03?=
 =?us-ascii?Q?N1iYTi3V7MC1LlhfMq0vDYNBUOef9M1FEzf7HIc4AoGUxwBwRjJ+7ryEAJTN?=
 =?us-ascii?Q?UBqOpiA2LOlHcFWzE7Mv27z5RUqwgII+wzPUU49VD2cbGkAeuG87AzsjsO0u?=
 =?us-ascii?Q?rcWs99W95iqjOz+xXluWJclkdV4gsfXQtYOqJrhpwlXtS7lM+mKCKRsHimkx?=
 =?us-ascii?Q?5GCnSVKGmW/Skm3znY4HGibFwaPyT+J7HZOzgb7SFygHAvMp3vhUz7DewOaH?=
 =?us-ascii?Q?B1NNu5Z22mFynvXR5bu4CX2B1+5caJaNUNFlTXLAWBOU2EWz+MD7pCTcvE6P?=
 =?us-ascii?Q?XaRz0cBLERgmfIMHvteokCoEnctEjaS0gjtOYEy5/wamlAyncWJBeYuwvmWw?=
 =?us-ascii?Q?Mbrzvx/DSrR7qyNfHizL/lXMU8EhCTd1eaVOC0zU2pbf0ISZ2yEqUdQtWVsv?=
 =?us-ascii?Q?3cib29YvgBYnLUZP4AiSYyZLNtrYHR1yfcNAw9hPw5X5C6qXqg0yNvC+5ATe?=
 =?us-ascii?Q?1mS4769Luty/sxWU3WXzguW/u4NPJuk6QxB4JvzRyN+sHvm51KKy4zgHTVaD?=
 =?us-ascii?Q?gX0cgA/y5keJyQISF55wkk87TgxecbVbDpHi7K65kINyDR3NdMHhuye5ci3D?=
 =?us-ascii?Q?oCOuQU5xTHYwJje8U62ce/+tJBHYMi13HHUJailowUkuxAZ6mQ9pIr3hOmIq?=
 =?us-ascii?Q?RN3dfkoijT4PoLZFWSNCDvNh16feWl32p9eaHMTwn4woyZis2WbC1mUcRKCt?=
 =?us-ascii?Q?XFd3mMoRNeSKuwpCGvy4Ns+5LQucwOhjCU11DgaYWJ25mrH52qGVJMOSuJCh?=
 =?us-ascii?Q?qZblCRK13Vh+PLQGO+tYlUs9XU8l9amHIDecdw1nEH3sEGwtMjuZ7RsUaNVE?=
 =?us-ascii?Q?r2C2l3KuVgQRwSJWzT5yXlmyjkXuSHGLlIfnco9thO9DT6l31vrIN+W9JM30?=
 =?us-ascii?Q?5QHRZhI+ywiern/kK0BvGYpN+eWH1sQiWbpz/Lc2p5nG/G7xtqX9HgB+IMTU?=
 =?us-ascii?Q?Rs/XOi4PzjyEZL4RujbuAY8y15OOhLckwsWbZ9LZWos+ki7KOS5uKIZmkszk?=
 =?us-ascii?Q?8VZai9dLo+8/cEyIXTCB3oCz/A4LTus4R7KeO9oi1V25BS61yPxfslZlEgR0?=
 =?us-ascii?Q?jpF+V0opZY0R82xcyeVXWsFVWbXy4mTbT6j127pwUz+TLvpEsO6jgZAQkjlZ?=
 =?us-ascii?Q?T+SDS5+tpUGtNugCT/R2/WDk+o3teHr2fycmuMJ63PgH1nLTFeuLIp7ta56g?=
 =?us-ascii?Q?dM81acWmOgMp0uIN2B8oi3RsimQkJEKwAvlfM8uN08AlTATDTN8AiG22komr?=
 =?us-ascii?Q?99ty9vQBv1GRdd1xcRwBhntN1/FoVk3CECvc26OJL0mSqh6k6DOtY9Nqk62l?=
 =?us-ascii?Q?9odmyw9AFw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ae73f12-d92c-44bf-ed3d-08deb835ebad
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 19:11:26.1180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ym+AtHqts58qJq2Z3FE5pfRRLWcFsenS/YmzkPP4E6GfVz/fh+SU16h7MAWwmgYxL1nNGK8svI3l1+aHMC3wHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10300
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_121130_931700_831494E4 
X-CRM114-Status: GOOD (  16.15  )
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

On Fri, May 22, 2026 at 01:18:02PM +0300, Claudiu Beznea wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Use the same reset deassert order in the resume and probe paths to avoid
> potential failures due to ordering differences.
>
> Fixes: e7218986319b ("i3c: renesas: Add suspend/resume support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/renesas-i3c.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index 6c23f956ad2a..d2f29ed0b6ed 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -1434,17 +1434,17 @@ static int renesas_i3c_resume_noirq(struct device *dev)
>  	struct renesas_i3c *i3c = dev_get_drvdata(dev);
>  	int i, ret;
>
> -	ret = reset_control_deassert(i3c->presetn);
> +	ret = reset_control_deassert(i3c->tresetn);
>  	if (ret)
>  		return ret;
>
> -	ret = reset_control_deassert(i3c->tresetn);
> +	ret = reset_control_deassert(i3c->presetn);
>  	if (ret)
> -		goto err_presetn;
> +		goto err_tresetn;
>
>  	ret = clk_bulk_enable(i3c->num_clks, i3c->clks);
>  	if (ret)
> -		goto err_tresetn;
> +		goto err_presetn;
>
>  	/* Re-store I3C registers value. */
>  	renesas_writel(i3c->regs, STDBR, i3c->i3c_STDBR);
> @@ -1465,10 +1465,10 @@ static int renesas_i3c_resume_noirq(struct device *dev)
>
>  	return 0;
>
> -err_tresetn:
> -	reset_control_assert(i3c->tresetn);
>  err_presetn:
>  	reset_control_assert(i3c->presetn);
> +err_tresetn:
> +	reset_control_assert(i3c->tresetn);
>  	return ret;
>  }
>
> --
> 2.43.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
