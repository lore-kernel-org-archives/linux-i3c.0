Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC1AFEFB44
	for <linux-i3c@archiver.kernel.org>; Fri, 27 Feb 2026 15:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IR6BKRYcDW0ske4/NJSfoKeDGhaUx7RAYoE0zPsBe7A=; b=yMP+ORneDczsjx
	0ddKobPAnWj8DtG7mN5w9p2E3rVjmxwL1lE0cjQhetzr48gbDP4nOeWJwhne9QgmLBjWXfpuloGww
	VMWN5y9d66KHLUFNcIudaTXpM9zpS7LjGZI6WgAoLLCKa5jYg9e1zFEvQNoblli77XF0SBkyJOKSk
	EUbiWPgLT2scCIEaKSDRVWrpGtGPAe5pUGWGuCtHjqS9FjddKI5gLOOGKbyFWYd2IMLezUv0sjqDJ
	pVRyOWWBBnYPMqbSa5BNwjvUTBrY0Z2ebDcieoCAMGKTkrBo8ygU31EP+yj+eUjmfEF9LnMPYlhDY
	vEdhYeNRvlR+I6bfRIag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw0ES-00000008h7e-2eSs;
	Fri, 27 Feb 2026 15:58:24 +0000
Received: from mail-northeuropeazon11011019.outbound.protection.outlook.com ([52.101.65.19] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw0EQ-00000008h5c-2iQ5
	for linux-i3c@lists.infradead.org;
	Fri, 27 Feb 2026 15:58:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FBNjzRty+6CnVdW0d3pW3qPeAeAiCx97uY16C+jBr61e8dGnBjR2kdp8ePxcSgq0cVX0+i3kQ9apw2Il+YAf/ybFjIbQ5YWL35CLEVQu8qv0VggS9dvrSRZA09fwI/leaHmx+y1MYVt6jv5cl9AAb1yLQdxlf8LhpAoCmFyjaRgqEL2jr6BEeQbyuzu5gTHHNZf9p2N3f4+vKsGgmym+OyGFuPccnDHhnSj3QH4/BniyPxtzG0thHbQ7DGgXuiOTGIv4mM+BVTK+IhLk0TBf8xOy4W858UFq0pRsFp9VUwp+WCGMiyDxru4007ADXTscY6gQ9NZl/YXUo+quTJAvWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M/Rvcg3QXJbEFPGaDMfRYV5POqXEiZYCWl69YYeIRjQ=;
 b=igdMCy85cL8mA+ymwH4ES5VUp08xTewOLyXldBTN++l2lY91ImdgQc+rb/+BIJBd7NcaccH3zu1DXeumhIk+moXheezGswbPSeRO9ESxQysMo9aHSHk7+U7LPqCa9XSotGH1o9n64VptMBvFuHl6YKCFhhrGRFyVWdznxAuQRukwz/DG2EGOF+ZrZj6GxUlzl972uFoMwyxe5b+SPhKkCEmE64CSwgvjMmLVQ/BsIMhknSonuEO+dlhzXNDvE3Fv1onGz2F/hNU0MAC7Fisb4fpuZXZpIxKV5W1dn3UGjWaL1UlRI9v2UfL750qs0weRWJu6JKRrZ9JXMWcx2FV3Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M/Rvcg3QXJbEFPGaDMfRYV5POqXEiZYCWl69YYeIRjQ=;
 b=gA9oQY9c4RjSQtgHodFp3bou/MSUeGo728679rR2OGCy9w0Yuj84waNvpXlqXtxu5JTCTJMrBtpkYVY4RjrmkalL68JIhi10K/gJ/r2Xj23S9JtO63oSgE4wfiFbZpicI4w0R0X1z06t88c2kfkBbyJRcaXhqnnByW5fkvVQ9pyvdTy0sQIBh4+0ph+9UCYWbYiglHNGyIRFekWYSe52B1fkOPYqSbPUZjX5KzkCPnNbmtNmfgLo2URj41W8a4S2aIi85K+yMETcUqVnQS6ldiUerqBujBPmTFpg+WXTI+Pu8rYKg+JFGhSzxVwNAztJ8gbyPbJpLUP750IBe04gUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by AM7PR04MB7063.eurprd04.prod.outlook.com (2603:10a6:20b:11e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Fri, 27 Feb
 2026 15:58:17 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 15:58:17 +0000
Date: Fri, 27 Feb 2026 10:58:10 -0500
From: Frank Li <Frank.li@nxp.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-i3c@lists.infradead.org,
	Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Fredrik Markstrom <fredrik.markstrom@est.tech>,
	Ivar Holmqvist <ivar.holmqvist@est.tech>,
	Jorge Marques <jorge.marques@analog.com>,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Zilin Guan <zilin@seu.edu.cn>, LKML <linux-kernel@vger.kernel.org>,
	Aniket <aniketmaurya@google.com>,
	Jianhao Xu <jianhao.xu@seu.edu.cn>
Subject: Re: [PATCH] i3c: dw: Use more common code in
 dw_i3c_master_i2c_xfers()
Message-ID: <aaG_El2oEFOwjn9l@lizhi-Precision-Tower-5810>
References: <2411a872-5bf5-4353-a754-47fa54d69c46@web.de>
Content-Disposition: inline
In-Reply-To: <2411a872-5bf5-4353-a754-47fa54d69c46@web.de>
X-ClientProxiedBy: SA1P222CA0108.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c5::29) To DU0PR04MB9372.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|AM7PR04MB7063:EE_
X-MS-Office365-Filtering-Correlation-Id: 04cf47cf-043d-43f1-58b5-08de76190542
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|1800799024|52116014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: y/w7HZNWgBiKNDgpOkWc6XHeltJs1K/HRWoUbrhl0MZTwWcQ+DorI3fzWhY8iEgvHcoZCqEp0V7remLHk38IkIYuMUctPsv8pSNKXw3ErQiQnb03DBlwcYoB5EOkaOdnlLyefqvS7OaiH2QO+aWr6IFtcl7QncdlkowlvMlOCpijPL3koM6wNEt9pSp4xal80hOcIfhJzbcDClcauKPNjWOTgVqM/ff7maoF6U9RNP2QPWA+GH9JuXk6Fq0FtgUOSmf7xrAJkjWWrs3pyA5SKn49LmB/zMeHT/GVRq+Gg7G6xk4Du0q0opGeD9+hTqYRX9H+T8tWDopNMEA+oSUg1RoYNrPWfipMDBonw28IgS+H3MfDHIAwaVAsgx0Vsxc1PfoI2OpSdH0uDKMkvDoUphnWUR6aPOHG7BveVtf5NCcXOIWBiHobgf4yeiDp4cifhibnZ8c8i+1m/y0OLW2H1Tpm4wyJqGw63IowiQrJGmSW2KQ6t4kbbFrRtd9GOhN2Oy6p9tQe7M6FT0SjOgoyEVwdHfGQWTwUZ0EzYAntm7pNwpG577nCDcv29BFD9GF5ekw3QpShCHe+0AiI67palUQGPb5Umr72H7VuVpnlQ9RgGJhqAlZTyiip7zczQWrJl4CJ2kNQFOlDug6sVafu1Gix2pxcmF1x4mT6YHBtqrnStKUB1RFc0ykRLkGyzuRc98d5Ks3SlL0SziVWlCqn2a8ATcwkSmmSRFC3HdkOPhyXLAUrTqBbgb6Tcs0EUBQO71tGQWBl4yCNk0wjW3gUyCPiSL0VUvqlyiYsTMt61u4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(1800799024)(52116014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OaLFogiPybSlBwPiaij6agh3k0i7OySY8CvjHz1KczvopI/TUzzygyunvLsy?=
 =?us-ascii?Q?DbG/Sr0qmOjLqSZz7fz24UgptyD4BxHD1iq73gDSbQFMhqkZAoIG4ib5l3ep?=
 =?us-ascii?Q?HAM3V7MYJpKjzT4d4ZeC21pbh9boX1Hk0v2Xbc7J+KAF6ANSOvDGELqOzfAX?=
 =?us-ascii?Q?3jKj6Bkakoc4eUqfOA3dr8l7Ix5PGlH4zk34SciZHHpNXaLMxp/GmKMZnUkK?=
 =?us-ascii?Q?sFGveHPlwcNIdETc/D1kCNLgY0VRsFEX05Xyzi4hGvq1K0dpJwk67mtG/fq9?=
 =?us-ascii?Q?VjOS6mcwWbKI30LmjF2S5T6J6yRhsH9kKK0sJfZ/fcgjFSJH/r1habtqgiPY?=
 =?us-ascii?Q?IWXgM3BUa0E8zduofnwuNpTNIVj3fS0eHDneaq4Aqqx+d/bFQqwn3ISnjCSx?=
 =?us-ascii?Q?lo7EiGlAjq4sgybC+SFml7V43kgdMwki523bPmg8nDfj7vKk8miLR/Y3OowV?=
 =?us-ascii?Q?XQALDBnTf1nOqniVHWKqcMoTNhnjusLv9oEQz1W1c12Y1bMPGTPupQrnp0RK?=
 =?us-ascii?Q?TiSCujoLRhcOey+AzFQTJAsL02TALgY20A8tgCaO2B4acGt5ye1wqk+BaXgE?=
 =?us-ascii?Q?WVyxuF7mypC+YxPKehxJ5+4PAcFkZ3fbbHar3HNlZvEb6B7oMeb1j4rxVfSJ?=
 =?us-ascii?Q?qS5Nia9Tq4NL01GwsJjLcGscr/dQl+VNda3ohgp/vk/PHYA3qMhP6WI4JM5t?=
 =?us-ascii?Q?TP+breJ+m+PXUpT48BPRw/XGOdCV7o983qqlqpJEYUqmCVIr7W1bNvNLOWLK?=
 =?us-ascii?Q?eqpCfdIx5rkddb+hNK7+pymIkJVRIe+bkDvtUz2Hc6eWjGkHoqqd34xgkDOF?=
 =?us-ascii?Q?1xjfBko74Mo4Fe2T5s5SxyzVdFUhhtt33gbgzF0kw69edCulSaFcjqNuxMSg?=
 =?us-ascii?Q?eeu/8uBag4CgvWwmzYzDktVFfTlRkvZfGfLwTQxqxP+NvU+8xZ52FX8jgDFB?=
 =?us-ascii?Q?Jo8p1M5Xo87Q33eRMU9WgVLAKONQ6ec2M9pbMgKL93F9A6a0KqOayy0PlZ3p?=
 =?us-ascii?Q?dhfNxmclZWnbq87/7wPqV97U9v6WzFe256cDtUmZqCy8dMj2nFi8MUgEvMOq?=
 =?us-ascii?Q?KBg9hcNi/JZTjPwCdSD5b7Hxoz57b9MQ5VgtN86LIcpDbcEen83Y+ZMMx8k7?=
 =?us-ascii?Q?/Hx/HM+dSyHv+NPANha5rfJ7/LM0+OfU5wu+bMaxaeyOjxfL0R0xA/3yzlzP?=
 =?us-ascii?Q?D5nsbzn8GXWx15RS9cCUxIgDnkXPagPn7sb8MYOpgloQ3qLrds8hC0HmqfaB?=
 =?us-ascii?Q?y08jvR8iT8qaFC0bmNxRSJ8nk6wRob7o6qVk7mgWVUW60N5cvOTXSzGNouhh?=
 =?us-ascii?Q?QhlHbahHXCubl+0+3pXzlbvgBLmWQriSPywZrjlGlLptIMmzqi2RjgdBINdo?=
 =?us-ascii?Q?CnT73I2P5ltJ9hGsdqzMIMDtBqsQrrZQtF+jx2rbcUyV8S81lxTublzgXh7D?=
 =?us-ascii?Q?gL7FPWoiknWsEo1le9dOJ3Qzsk5baP0oxP6k/9PBdnXO6mSHpTASve3TxtD1?=
 =?us-ascii?Q?QWIsd0yNHsN8EdN62GL1YSpluQ/VT9q4NvI4FDkWVDJd+Qbz6mTnImgKQKBG?=
 =?us-ascii?Q?caAlg/0e177zYJKQrET26/snchtqIRGGncCmoqm1AGTE+AAVW5DOmZhf7k9Z?=
 =?us-ascii?Q?7W85ixHVVKLPr5mW0H5I2/Rpz53AzhH/llb9kq0Bv4i1zS0cE3scaeSZStx8?=
 =?us-ascii?Q?thrEzFEs8wu49cV+V9+ZqK6nemA9xx6CX6cr1mVGIeq4I/Tl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04cf47cf-043d-43f1-58b5-08de76190542
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 15:58:16.9393
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lnAfbqu8vPQOzgOs6WqdAd4wJfhiS1XowzEB95OyexrDGcuTVUTmBgXLYsuOCf3NsRJlOyrjjr3lCJUBlMEN3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_075822_699161_1C54170E 
X-CRM114-Status: GOOD (  17.63  )
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

On Fri, Feb 27, 2026 at 11:20:59AM +0100, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 27 Feb 2026 10:16:50 +0100
>
> Use an additional label so that a bit of common code can be better reused
> at the end of this function implementation.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  drivers/i3c/master/dw-i3c-master.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index d87bde3f7700..beb40d947e6e 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -1113,8 +1113,7 @@ static int dw_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
>  		dev_err(master->dev,
>  			"<%s> cannot resume i3c bus master, err: %d\n",
>  			__func__, ret);
> -		dw_i3c_master_free_xfer(xfer);
> -		return ret;
> +		goto free_xfer;
>  	}
>
>  	for (i = 0; i < i2c_nxfers; i++) {
> @@ -1144,10 +1143,10 @@ static int dw_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
>  	if (!wait_for_completion_timeout(&xfer->comp, m->i2c.timeout))
>  		dw_i3c_master_dequeue_xfer(master, xfer);
>
> +	pm_runtime_put_autosuspend(master->dev);
>  	ret = xfer->ret;
> +free_xfer:
>  	dw_i3c_master_free_xfer(xfer);
> -
> -	pm_runtime_put_autosuspend(master->dev);
>  	return ret;
>  }
>
> --
> 2.53.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
