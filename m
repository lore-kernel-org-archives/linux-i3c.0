Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83708CD98F2
	for <linux-i3c@archiver.kernel.org>; Fri, 19 Jun 2026 19:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B2RJszJy+G+JScDum9n+VzL4Y/gMxdf2eWVomTBEH40=; b=V/afNkDfFsr14R
	HA2FaUkl1gmm2lSK8U5vcoPCOLEaY2ZXrHR7+mshnHdprEarWMwD4zQVFYi20wtjoq6Y8GtBUl/SA
	HVEMZZKPFtaJ+EdkHZ8wXux40VUn+MhQNLB8oyg0kn5yDT80GQlP9LVuOoveFULCNDCG+0NyUc+ZV
	8cNT2fEn99nfbGA3JxWlnF6Hpx9RADZmAFWHFNhnKyWVbVodu+RsLjvvMdi3/8Dqu1DocGpK6i5Dx
	4Fxzn8whyreIqsxUmBne2FqifoKn0R8YJ7qF83euwWhXIrf6A2jMG2A25ojffRUamzxKl/GEQG3Y5
	z6WtHvgqwcPDZt0d5yFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waemQ-00000002uYj-0g5p;
	Fri, 19 Jun 2026 19:21:30 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waemO-00000002uYC-0Ydr
	for linux-i3c@lists.infradead.org;
	Fri, 19 Jun 2026 19:21:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a/7ho1o5MIaWW3/8FIe48P+oLgYDfiKb2SCvdMp7mlOPWH9p0P8buyPTamM9Y0oxF2Dzvwd/489qKOrbXlMOCRxZw63bv57JNsRgHO6LK/yNlZHUfi50+Ys3Rc1PuCOcKMZ5JhJdD5GJQ2/V5LE8eAz289oanPOHLS75W4Y1rc9XTFIR8uSrURmnfOsVfQWnl4qO5xe+AUk9gqNPPNbBbafZOitlQ7cKKzKuaLsV+Wo2R/6NGWL0JPBXYRq/W3hoO1o6vRvxxDFHcmmCQxABw/T+OmGoxup5HEOQdiEq5asidcu3iV/QzGtjQBxYsvvTu1p6W9/7PqFTfjMA+m27Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OdDo3gAPmlS+ruFdOcylpfh/BXnwv34YjEnc8X8bEqk=;
 b=Eu5os79cK9HKLOE5pnc095krH6zgEXYnEUqAugZnwwKIq3cLFBjhMyGgjEQqauVpAyN0odL6SbK0Ceo/LCNBbzpsfDo4wDGS6jt93GpCrBp7yJbi6SwhkyrPUmoTjRyF04W8W9gFCdsu9Kke/Qax+lxDg0NPnRYnK21kEnGlzOfvVSz4Ird5v8eiGn+mO4CbCblWPaiSXX1IKySzFsnTDUXGRLxRlJH3NFVts386gBWm9kC9gqb44AWKBJEcoiCoHuZE79J4aZpHrGuWhco6frPo8uBD4j0RCXicI1UMEgOMMuGzJSvEIa+cndEwWRT6zZq/SpFvxDiJQUQq/igozw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OdDo3gAPmlS+ruFdOcylpfh/BXnwv34YjEnc8X8bEqk=;
 b=lI5LuFy25lkHutSySLXcY/aT+NGdUO5eOS2S8GxDVXK322Iq+93lseOqORlIAMBszd7S2PpaFvlp5SUhvdLbzgho1A+/Op79b1ZN2eqOcmcHlC9ChZdmGtRBubb+dtwBjjJMsXZfWXEN2hd6z/8n/divwsqFDVDt2x448BmXSIxlEqiXSks2fWl2DyGerpstfxAUVCY45xJWXmWupdweigZWtiacvgID6rOa2uiSaIpvTnkrIQvdJHCyH6BD/aM9zp6HnzacpsvMmgEQyqkShw2ImoGQ+2uD7/5Kffepbna5uBmYfleKIPjpTEvxcMCPZIVbcRO25ttiRRfo8cw0Ag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8437.eurprd04.prod.outlook.com (2603:10a6:20b:3dd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Fri, 19 Jun
 2026 19:21:23 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 19:21:22 +0000
Date: Fri, 19 Jun 2026 15:21:14 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: tze.yee.ng@altera.com
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	Felix Gu <ustc.gu@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
	Jorge Marques <jorge.marques@analog.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] i3c: master: dw: Report actual GET CCC payload
 length on success
Message-ID: <ajWWqkwDzzhEMXZO@lizhi-Precision-Tower-5810>
References: <cover.1781142158.git.tze.yee.ng@altera.com>
 <b7dff215ce161fbff18949a12442eac5d189347e.1781142158.git.tze.yee.ng@altera.com>
Content-Disposition: inline
In-Reply-To: <b7dff215ce161fbff18949a12442eac5d189347e.1781142158.git.tze.yee.ng@altera.com>
X-ClientProxiedBy: PH7P220CA0120.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32d::22) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8437:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d1ea174-8b86-4121-c9e0-08dece37f2f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|366016|7416014|376014|23010399003|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: ELA0e01dVo9shnJam3tDrJgoKYz2R51SbvoUaYcQ8GWP3PuRe0uUIGwjfDSkmj2OgEsfPNZjKmQoTmDxwySGAt/HUzV2RU7PafSUsdvOEpRBrLFlhwDSSy1e9u1usFiiN9brpPL0IBvd6xeyml3muBlAOO7TgW20VB4gkdb6+3q8BtC5XSiqQnqbscshlZ8pCZxvAyY64gy5+lZavLCCY93ONWHOXsQ/xDHY+yLeGWSTFUBo+2C3JNhobzgaC6vwj1lZL2atJ0o7SwKDstvv+CEv1zcjdih7NAYLCS7UiGdVjEVlCt7v/VxilUIYmRdyUUv/1IdX4MVcEDwsOEyKcP7Ih93t39TfFzf1ouaiKVSPXb+oaYWjeKTExXXAtxrLMZfWxhmt50nva4ILtBjWV/XVs8vMgmr1nLlf6OttK2tLmBqAuIkOiYJliv7gox/Ps+LftYarcu78i1VJZ5PkHedOHuLEo8d34bLA004jCwTT6VJ3rGI3lE9JcE2e+23Gl4zI1SE3Z5ab/ex5tW9hpUd1+sJ6tRU2myt4yzu/Sk0HXp36TuDBFw7/+6zjJV9w+QHn+RDOezVwfet7n2ztgP6VD/f3nDOVyyG3VvrHpTGyXMEUV/Ny1yjtHhJGgeaTAy+V7but4N9CVe2mawqEGxT2NgfcZrQB/f2RKh1nHdc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(7416014)(376014)(23010399003)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mAYgHt24JGlRThERiqmidH6Pwd8+L+htfAhxJi6a9gsKXevhMhmJ0TiqCCKV?=
 =?us-ascii?Q?rouvK9aQHAvFzgQWs/xJ/D+bifZ+lWVAiwEE5ZFN+yWK7phhgyv/begAIH5W?=
 =?us-ascii?Q?eRabRmsC41MJvSVgd0n+kLiH7lDt1rcNJ3KZA+hMYifK+suaMyZRTKYKmllN?=
 =?us-ascii?Q?vKLQ2Z1C6i8RDESMy+5d18FOgcFZqx3jYK8y3rqQtrBiXHnYV14QbqRe2gQY?=
 =?us-ascii?Q?BWtIn6aw3eK8hNTqJoSv6vJQZlp2/b32YNPlDasdOQYQYKxSggsDmYvECztd?=
 =?us-ascii?Q?0KhnDHtWCcf5xthk+vvq46MXoXj9SrfdaQ95c83YsrVWBplys0GosHc3kV53?=
 =?us-ascii?Q?AP3UTD9xyOSPn2XWGucLLmW2qD8FIyJfkDfwNRrKPsEwck34KE6CCDfXK6XG?=
 =?us-ascii?Q?I6f7bKNLtIkHeppDd96LWAlPMBvCtDvk3tiQ0uKx2qYWKIODAiwqujYLtPEW?=
 =?us-ascii?Q?a3StrUK0+DB1Ki99yXz5m39LKsdHGflEScZl2pt1q0XlzqHTSg4w2rucdEcl?=
 =?us-ascii?Q?8frR5slQFn9IDvCwedgTK2S4s1hXOYfPBf2IVyxg7NKpr3hsB6MSeFjONKy2?=
 =?us-ascii?Q?1kPIQCiEdJbWp8kTMtLYbjnrOWl0ZxOXGLPXh/dZznYEhSwdsKQu9O62nFuM?=
 =?us-ascii?Q?t0y/T6hi6pyIUIK3w316Isk6zfRrDWVY5unSlI/jPTT8rhE2Xve2pirvvm3v?=
 =?us-ascii?Q?GaOB2TUJZD465lgVKGif8Kz02lDiL16vNd9ejlZIVBO8ocembM8Kt5pBhesQ?=
 =?us-ascii?Q?Vfv6nl+bIX14pjfzWxFbjU+br5aD6TKQW4V/4qXQJP7zR6hbrlT8JLWaJUAC?=
 =?us-ascii?Q?FpoNLWfJqjKjpgDOe0vvGjY6rJA3Sh9y7jrkNnuFSTRP7sLxR1Jfc+5BRZiy?=
 =?us-ascii?Q?aMU2KQJkwiTGrKSKkrM+3UKrShAtF6sIVfDPH28027dfbBhJlmPE6fPzYvGd?=
 =?us-ascii?Q?pbalKldBNspAcfBwMAtrvK/pvLYowsRJ7SEoUdQ/SBb5o99YZrO6ptFhlt/8?=
 =?us-ascii?Q?R/DhqV3RnhSIbCvfo0ukhzu9RFG32zagOvLCTEUa/kGSE2ixo63R49r5Mcw0?=
 =?us-ascii?Q?uFhsnQw6Yf6H9dTy0UxcG6E4iF5EE61u/RR66BDl3ZrR2RtY3HHNEVOyrQxH?=
 =?us-ascii?Q?MTLnKmvd7ldW9RFwkvphQaPbAGbojNXOXbr3taT9a57dryhP6Xp5s2YODoMl?=
 =?us-ascii?Q?wEISnly5sN1xeKxbnO4jpqq5+ulIOLMuqlEICeHCv3SeJB3qdiEXde67yPI6?=
 =?us-ascii?Q?TDj5Dk/dlbOgfN2E365AxrUM1shv1AOUGG3fuRmRNspmbaERkuxq9/1UjwyK?=
 =?us-ascii?Q?DM0+C8rH/ypNgmRyRUn4ff7zHTcAvIuHHPetQz3iOui7WjnShpf2SvmJ+H67?=
 =?us-ascii?Q?KF+2bPeg84Z453go+WW+h4dLEdfDTmQjwUzAF15V1IOKziGwINENDmayL6vh?=
 =?us-ascii?Q?o6Qr0wJ8TC0Blk2Oo1e8sxFcJDJGCIZ7YGby2tbUcP9fETaFy1JNind4fkjc?=
 =?us-ascii?Q?DQnufA/AlIl9QjexZxvwul8y/ZB+OArBY7pO+DkSkbfU8SbpQoJ1IXPpJFH9?=
 =?us-ascii?Q?SZ9AAJNBTfwPxbn92HIrnzvklIibiVYeE7qt+WYqJygIwIapng1rOP+bbN2/?=
 =?us-ascii?Q?iuMZLfOKfDFZHtpz1mQo4T2D1UoOEqmvfLNDF+ZDGFiIX9xWBWvG+a0wFPlM?=
 =?us-ascii?Q?GpH+7ExxoKZmPW/BYusefGdB2O4A4dg950kNX+MrlunZ0HJNTeqtx1RONlaM?=
 =?us-ascii?Q?SshIVxcD2M9hf8xKmVpioN2Z0ZudoDVTSpPZmi971lyrbYoDleGr?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d1ea174-8b86-4121-c9e0-08dece37f2f1
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 19:21:22.9270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4MbTHP67tB8ykML9N5nCtz21+6ohLUff0aIbvjJP7hWoIX747E0mAno+px5LkvyRFHnjR8v0aRNcfw3FK1DSLSF1fB85qGeHIDKj4xXHiu4woVLS0eW3ysiomFahihjX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8437
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_122128_176250_4458BA0E 
X-CRM114-Status: GOOD (  17.81  )
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

On Wed, Jun 10, 2026 at 06:54:06PM -0700, tze.yee.ng@altera.com wrote:
> From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
>
> On successful GET CCC transfers, set dests[0].payload.len from
> RESPONSE_PORT_DATA_LEN so the I3C core receives the number of bytes
> actually read. Core helpers such as i3c_master_getmrl_locked() use
> dest.payload.len after the transfer to interpret the response.
>
> Save the requested length in a local variable before programming the
> hardware so the caller's buffer size is not conflated with the bytes
> received.
>
> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
> Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
> ---
>  drivers/i3c/master/dw-i3c-master.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 655693a2187e..06fdf8857b9c 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -751,21 +751,24 @@ static int dw_i3c_ccc_set(struct dw_i3c_master *master,
>  static int dw_i3c_ccc_get(struct dw_i3c_master *master, struct i3c_ccc_cmd *ccc)
>  {
>  	struct dw_i3c_cmd *cmd;
> +	u16 req_len;
>  	int ret, pos;
>
>  	pos = dw_i3c_master_get_addr_pos(master, ccc->dests[0].addr);
>  	if (pos < 0)
>  		return pos;
>
> +	req_len = ccc->dests[0].payload.len;
> +
>  	struct dw_i3c_xfer *xfer __free(kfree) = dw_i3c_master_alloc_xfer(master, 1);
>  	if (!xfer)
>  		return -ENOMEM;
>
>  	cmd = xfer->cmds;
>  	cmd->rx_buf = ccc->dests[0].payload.data;
> -	cmd->rx_len = ccc->dests[0].payload.len;
> +	cmd->rx_len = req_len;
>
> -	cmd->cmd_hi = COMMAND_PORT_ARG_DATA_LEN(ccc->dests[0].payload.len) |
> +	cmd->cmd_hi = COMMAND_PORT_ARG_DATA_LEN(req_len) |
>  		      COMMAND_PORT_TRANSFER_ARG;

not sure how req_len help it. Prevously everything copy into cmd.  now copy
req_len then copy to cmd,

No difference?

>
>  	cmd->cmd_lo = COMMAND_PORT_READ_TRANSFER |
> @@ -780,7 +783,10 @@ static int dw_i3c_ccc_get(struct dw_i3c_master *master, struct i3c_ccc_cmd *ccc)
>  		dw_i3c_master_dequeue_xfer(master, xfer);
>
>  	ret = xfer->ret;
> -	if (xfer->cmds[0].error == RESPONSE_ERROR_IBA_NACK)
> +	cmd = &xfer->cmds[0];
> +	if (!ret)
> +		ccc->dests[0].payload.len = cmd->rx_len;

Only this line is validate.

Frank
> +	if (cmd->error == RESPONSE_ERROR_IBA_NACK)
>  		ccc->err = I3C_ERROR_M2;
>
>  	return ret;
> --
> 2.43.7
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
