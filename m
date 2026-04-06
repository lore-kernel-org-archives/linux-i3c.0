Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0600EE9D82E
	for <linux-i3c@archiver.kernel.org>; Mon,  6 Apr 2026 03:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=btNjIICzlp9tMIW7h2yifsxKD6lV0jarXM3ou7qqA48=; b=wwHK+Wl79MzlTJ
	3fZkL1C7nEd5nGSzoPjlVzny8P+yZVmnF/4uGIgypsA45ZMIm4FcTDn4XujVlUZ6U5bjKCCRJl55A
	mg1wgnFDET/9HJAAyM2ssV7B9mfNInIBb1DWaGIS+qy4QUbHyRa4epzOz3MgSnbdYZ8yuyhV9KRaz
	tTap8ojSZNA/Wm5zrp3btI0YU9hlU/srFxT0ttMalpLHBewK9c/ZAmYjQZa2nXdE3Zjg79es4CeGC
	jhZ0xJ7htDV9HSrqeHE7O/nLW3jnY3dJ9MJKJoNFs0UwLul7ojsybUiamyA6CwJAa0wZzNBSyhozs
	mR/uNVtB8eKG2Nqs/rLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9aHu-00000004j4C-2mWT;
	Mon, 06 Apr 2026 03:06:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9aHt-00000004j43-0QKA
	for linux-i3c@bombadil.infradead.org;
	Mon, 06 Apr 2026 03:06:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Q/QCuviczJr9IYpIPx/YcxlMp+avKs5yuWlk4dQADcM=; b=cdIT8xUB3yk46aILQmnjvl8g/W
	gbYuWnQX5msZPrCw7JnEcFsTjvq/xKU5fDfcMAVALT//ql6u1QW9Ucoj3IwKOLNsgcVo9hmfSLKVI
	0I1EQYZOJDOCh7JsGAgdM0KGnh4DVHs0mQy/6XGOE7YRbktmICtE8olZee4+g6DxJB2XA7qO4whAe
	0T2QDEi70LdwVKUlyFA4kuicxnWap8kYvAm/P/Rwbg7wQHmCSUe0w15rA2OFplpUfyIywlbigKxU9
	q6ecr8S0P4BHAIFDWpCIJ/lvX3m485Qps4tfrUkZJmdcCXbksO6C9alNOaBieOpwknwSyv2H+IlJt
	40Q9i8FA==;
Received: from mail-swedencentralazon11013014.outbound.protection.outlook.com ([52.101.83.14] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9aHo-00000006MLX-32qd
	for linux-i3c@lists.infradead.org;
	Mon, 06 Apr 2026 03:06:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rFNTpTLUK2yF2O4or3Qjupv802fsx2guWZVDlLgoG9ex12od0rPy/g8tph+FWkJLfd8FLUZJ/1FlS30yK+8B00VH7gtwfG4uV8byGop14bF7bfh7T+1pWvInJpm5Kr8DcvWTKb2ihaoQvRQeB8Ag6or7sZX3s/71EsLUCShlPo1abY+0PEFrIuBYaTGkTypXsesN3OmjV8uavKqkQf3bsL52ju7AIHiv3+/zngMFNpLjneCuS3Ozkuf7XzEwV25p/AGPm4rYQJFQARwnA3hhf/JgRxT0sIyy+xKN1ZZN+P01JfoFs+UrVZPNsojtiiLfM3k78d+YqC6ena8bXzcwtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q/QCuviczJr9IYpIPx/YcxlMp+avKs5yuWlk4dQADcM=;
 b=BNsN82fgjOEeAwXTCkStwgA4H6r44BquyqI84+brrc+ewRPV+nfbqoWQsjf8c7I8Klhx9jYv0GcJAYh8XpergJ2C1rQM7aNT2Kg8AKOoqSeONZrPKTT3oWOqMJmtzkmQ2YwbeKOVYAzryuQMYw766Z4fL7ZL3xvBvtS1EubIl64sdJaqBlt+nbTAdZvZEvFheuo/v6VkR153b1nSO9ZguU1PtRQdcYeT1jBBX8Soqjdala4O1V2jjiG9FPQDqOXrpBep3efIKUONw8T/ecDYztvekPg91A0zwfiAvJauy6TNZF7sz6xV3isFqLaqnyhELbgwdcSCRRRlJCLRaeSTqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q/QCuviczJr9IYpIPx/YcxlMp+avKs5yuWlk4dQADcM=;
 b=boparxeGxsRTcScrBkGmBbjjTKYQSpcF8LL+/sfAlh/JXosJMxuLlBktlgnlqFOf02eshO18yN4c0sMO1vHlv+Gow9XrfuUyPHvpvDM0fliPr/xgnZ87d9UTh3yn/bSaeMqemXf38fan6md4sto6H3srVKJSlFJfdvscjZAdY3u6UP+Kxxuo4Ki944GYctOgpRT2JdeSj8xX7dItvFWGVG8XxWeP/rQs53VZT65zuoqe8AMzvy4I1TtfrHcLRxom0xtDMTM9rBrAFXGcLwI9RH7Yz/ntOThwzPm3urpANlEQR02at4qeqnOsCs+92+M06ruMwDtLzHtXiX4E15dATw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM7PR04MB6791.eurprd04.prod.outlook.com (2603:10a6:20b:103::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Mon, 6 Apr
 2026 03:05:57 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9769.018; Mon, 6 Apr 2026
 03:05:57 +0000
Date: Sun, 5 Apr 2026 23:05:51 -0400
From: Frank Li <Frank.li@nxp.com>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Aniket <aniketmaurya@google.com>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] i3c: dw: Fix memory leak in
 dw_i3c_master_i3c_xfers()
Message-ID: <adMjD5qrfXjtioDJ@lizhi-Precision-Tower-5810>
References: <20260404-dw-i3c-2-v3-0-8f7d146549c1@gmail.com>
 <20260404-dw-i3c-2-v3-1-8f7d146549c1@gmail.com>
Content-Disposition: inline
In-Reply-To: <20260404-dw-i3c-2-v3-1-8f7d146549c1@gmail.com>
X-ClientProxiedBy: SA0PR11CA0144.namprd11.prod.outlook.com
 (2603:10b6:806:131::29) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM7PR04MB6791:EE_
X-MS-Office365-Filtering-Correlation-Id: 02e05840-0e81-4a1b-714c-08de93896c3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|366016|19092799006|1800799024|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 2g50+g1U6FSaP6sgGpZjGV5Ab3SLDaywxkKeiUgKjCWU6x213X/pOaiwTNO4oJ7vHGVSvE7mIGP4RWni4M8xUC+JiFyEM0Ydg3uHZRqBww+8RADhgo9zIZKTaupNCPiFxkmyF4rNmxSCxRf3Rk+sOCqjxw6LcRiPaL6n9H08XXIBiNn7dVGYXvilUWO3ccsSIINmHTpO0l0zUNDGNDUGrE9PT1vX8FjW5uSF11EYgEDA21NL+Q1VvatzOffhxopcG5uCsH0HdjSCy4kUZz8XzUnv30fZUw3+1qai9u9YnZjFKLxLyCrlSI9n/aYXTH8GSBQfkPnK3TDd+tn4uai2qXvukHYURTyS0kIHqWlmvuUCUGaED6nkgnYCPpl09ZwjSLirhZzKK9rYYPOnF/Lbzss/QR8cTG8FB5Lv5AHVhYRhVZz5pEN2NoBTGZI7M9j11Ffj1FZzohxn5gkEK9VdE6zrDf0uYge5TTlsq2ewSuqomO/3txeJgNiKz4RE9WLsQzCilFpl9adXJZ3roG4LJBvGl3y98TrmPVun1B2yUAb+Z8hqOb/mzMYOcu6kVGHXicf0JTSLb82waY0oOGnF9Jwke0jpseG21ugJ8Aut+pqYwzesuykX4dfxnUtPVAbLcvzc/cuRHof70RO8+acH4kLFw92f8IhEcMeaL64wiqwjnPeOpMuOMybmsOzX5TIRdWcRLhDdpGesqKyym233kIaY8nag41FFa5lrBM62NTgWRXT9quHkaV7ExqPVkqHXCiQpKMZ+uO4JFcFVvsOFWDoCT+ENhLzxe7NAoAlR3+4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(19092799006)(1800799024)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KMHVWoUB0bltKS4PWVdfWAKAVcGN3tkLsoI9zQw+fOyAk7Vq7798fZM+s4CZ?=
 =?us-ascii?Q?Ugl/tte5ECQWCI+BKmdUL4aSvt9OhxctIcjJXmNO1t0vsVGHqCtWz9a7I2uP?=
 =?us-ascii?Q?zmGtMUUdLIimdVVgnutywE2/IJ9q/Fiv3hx2XS21P3fIjOMp1WUdYBkMu/PC?=
 =?us-ascii?Q?HAj97Ddp+TvYZLYnVP2P9ZpPOOO4SoEGJ/QDCj6KtUEHTF1E4hNO8rEpM+G2?=
 =?us-ascii?Q?eYNqyt3EiQjaH+cphkwFEKl6i8NWQ+MoxLxI7j0NBqe3rkJFMDWXw6C4veGs?=
 =?us-ascii?Q?2iWnuz9C07bqM3p6Fs7sZsADStsHNJcf6LH0n1TaZbEPpUHnOZJJ69p49HKJ?=
 =?us-ascii?Q?HFjpyfPowHe7E5P1pPW2VAz69ATRUH3lgr2YeGCzZA93IPFJWaL3bQB1rIIZ?=
 =?us-ascii?Q?EEJiewLg2h7cTwmg+eJudXrEr7ywiK15oBufLsiQjqoPi7WkQ17QLTxPKls3?=
 =?us-ascii?Q?QqFS34eoba5bmTb106PI7m67kIcaCV6oK2ypjybtA7mVNt8HGYz6j02pIWU5?=
 =?us-ascii?Q?iQeSZbLxe8wJM5kPMZwR2KJKHn/1QC5RixHqFlqub8To3bq6lA335GqHltpl?=
 =?us-ascii?Q?POY677JJzEcBYf95xEgvv6FYXw8+Vxu/lTZJHGRILlUyR/8iw86GGV5U1MlV?=
 =?us-ascii?Q?eJeKoQaUu2DaKJIPbBEMuERnSY1DqhmYRDro+YknL+lcY6iGVc24Y/cuUhER?=
 =?us-ascii?Q?df7mwrNEIXBs4aGOBlLkwgWARuUKL6SjF8Okhfr5qXTKCxkFJsUg/SVFYhvx?=
 =?us-ascii?Q?f4Ulf/U+Wlof94Ic0FRHjGe1tPemBZst7+ekj2WPJJ/YomNC/bH5y55VBphk?=
 =?us-ascii?Q?g8v5696/J01GzO/bUjy/N+hYuZsYQV4h6K/2xm6HOoaGtuSQOaEHftAu2bnB?=
 =?us-ascii?Q?b0DGyvsyIw2C3wdE41zk4YcFhte/ZLCjFbJwWlPFKf4kHjHWI3WDmSGly49k?=
 =?us-ascii?Q?6/C6d1fHligZ+Bc9Cs2TeU7P+YVssV+f0G0fjjUtShXh1nA4Z3A6OKviTrLO?=
 =?us-ascii?Q?unB+qzGTpDwA2KMNfxw8+aqlr23orVE/1MMj8QATVl1l8AU6KI64Ummew/kd?=
 =?us-ascii?Q?vO2S/EGJZGj4/0BpYsfzJTqdQUsJbux/RVnISuPBYG3m5YOpBV2LVumgpP9T?=
 =?us-ascii?Q?F2620L9V0a3gtQmyKxR6ZdFLL5kPXUyKfdUjg+RssQDIm0nkJYbPeXm37uCe?=
 =?us-ascii?Q?/39CPRCl56O7hxAJWSQbdDr26CVKAAjPBEZ1+DbHINXwyUDNn6pLshOU39CY?=
 =?us-ascii?Q?ZnKpDr5xc54KJgmi2Usxc/izVBocRLjttQ+zFUdf4dR8jr7l77c4QdxBZV4P?=
 =?us-ascii?Q?CUEP5d6zNWXvhoFGFXuywvssHT2hZV9fjxZgSjP7eCoZmel+vuyV+KwsZJBm?=
 =?us-ascii?Q?yV1JayOCR8vmNWI0QJbaFPTkAzPl9sCWjG2T1H2of4GQ00Lnc7dXVgf46gec?=
 =?us-ascii?Q?THow2TZARx1NIS53m/Q19nnBwLpM7sAcL4JhVKYaYP2VIFRS9CQdH2Tdn7AF?=
 =?us-ascii?Q?l3AIOxBVxOQmXGOFUWFnl1ruyG5xMwFM9xDEZ+IrBmOJCcsmes0iuIekGvzT?=
 =?us-ascii?Q?XtVtT5Pquis0gcxhy58xmcrDR2+uQKBKHb18Su3y/ldaGEkPtl+27ApMUFWH?=
 =?us-ascii?Q?MDPHZb+6pECa9TS/DjraET6j/Q+Unn1D54OQsS4xLTw/bKle6vH9St0X4TRX?=
 =?us-ascii?Q?1GT5GlWSanFkGjdKiL9kQpFuJ9vySnK49+MtYZJEgzrHbEQD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02e05840-0e81-4a1b-714c-08de93896c3c
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 03:05:57.1788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ziw7OntpTes/R+K1Sdgs70XVZ+thXcPkN7xPqlr/vPn0y46QOJom59Iw1JtPIOBNPoXm/toTAR4yyPYE19KZ2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6791
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_040601_337977_22BFF868 
X-CRM114-Status: GOOD (  17.85  )
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

You misssed Tommaso Merciai review tags in v2

Frank
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
