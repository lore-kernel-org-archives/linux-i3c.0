Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C37C55184
	for <linux-i3c@archiver.kernel.org>; Tue,  4 Aug 2026 16:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=88Mh+3KfxO1COVGP1M+IUhwAhOOMiq9W5dvpglURX/s=; b=PoK24pU7rbbkRS
	FrZdaQBdVxgw/ZvrDjDOft5mG1YCc+GRBPCxzGac5oV41mko4mFQ/8Anp0nEbC6jbuhVSU0R1WqID
	zXqw/WhQYsoB8aUx9iAFdD6KlKnLCgfvFWN3VsztXSL8MNB/cXh+laBRPy6H9nP8HtpDwhAoTuB4D
	QyOB6pL7R+gZ/TdZQy0ecPxaN7uFeIZAuknTGYY4nzlVI2YsfpNHINMKgudHWiD8Kl4rUSYX/sbEN
	DDowmxhTFFe/xzT99tjFmy921tkh8XHJSrGoI5TNTTiLS7LQw9hCQoj0OiHuRa6o2BPtdkYAStUo8
	BVZt1nnT734HwJBZmXSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrILG-00000002OLO-0dWV;
	Tue, 04 Aug 2026 16:50:14 +0000
Received: from mail-westeuropeazon11013029.outbound.protection.outlook.com ([52.101.72.29] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrILD-00000002OJL-1YFA
	for linux-i3c@lists.infradead.org;
	Tue, 04 Aug 2026 16:50:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WBuuQnd+CStBT3G1SGD+cIq5gGTWHNfR4SK3upx7pJi2jMMrJzS3QFOIMJNlYeYKkO6aeAbPbMG7T694CuV1/1sLp2DfLSXgiYY5cBCmtZsOOblxUKVM7AeY6/Z6CpaiWAf3Wl826UdWUFn9fiBqVKVotLpd+pWwb8Gg4BAzlYgdRBhUlKdKp3R0vqUenvmIyJOyNNGkFcEc8BMBQYaWuAPCepCcfRryCdS4udabDY5w0z/xydm25i+mrmadQ+D3oeO/Hw60QuYB8GRDSVFNqxUs/Mn4SMUE+giRR0yw/tCUqKZQOoJfTnukuYvB9FeTLWrJuG6EKvF6nPFjn+ehKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q1sevjNqPDUZuHEMz8QJnhru5bgZcCSnZf2MI7Bm/OU=;
 b=R/RK1U3kXfko+0kdqMOCJc8MkzK+13+oCh1YU/qw9NpWI4LDdlOeSW3HuV0ehDRhcVZVEfH4TJSahMpvkvOVBWdvr1YxELJh2j1s3nWmOJG4xJ8Zkkr07ziXu1kBsPFGWvydET0ubOlKKhUwGZp3t1UHeK66DD744J2ulrnciuVTqqSWeSPf83X+m5UKRZSMNVoh25QKlcGoV5j+KnigD9aeevMjxIcz9xw4Ag6fFNv0wMYD0w2xKRX+pnpfPiXpQI48xJeEpjqMTpdF/ircc5WL1dhr+eG+AYLQM1HySPeVWQgZI9fh0CEcZxmBB0I9tONPNzdXzDTr/ZlBlp8Acw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q1sevjNqPDUZuHEMz8QJnhru5bgZcCSnZf2MI7Bm/OU=;
 b=qMBY8ihIN5988SjCcF+CGNTaGqkGoEjonXzd0+ENwx4RX4H7CSTyUiyBS30uudGds2EFbhsRRsYk/mje9qMWOLj0OUVooaFu8Kjqq/RuyvMk8rVCbZVEtRsgw1cMchHgl77Z6aXr0ALTbVocO3bVyL+sS5LYcnLk2eONmya/ZjKlovVcEhJnWi3fGo64kw4nURd0iVixSQIvnTY3BbzvDbR9J2G5rW/n6fnc594eMR8kGksqpJ/N4A8w68sMciSTaHGQrJ0Q7qzntTw2R5KWdZy9rimoD/5hhfLS63kkgioKOlrt47Foc6Ed/L6yA3bch9x4yYCNP2lZsopImBLsyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA4PR04MB7869.eurprd04.prod.outlook.com (2603:10a6:102:c4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 16:50:06 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 16:50:06 +0000
Date: Tue, 4 Aug 2026 12:50:00 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com, akhilrajeev@nvidia.com,
	rafael@kernel.org, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH V3 03/14] i3c: master: Do not treat master device as a
 duplicate target
Message-ID: <anIYOG3w7CtnUPOi@lizhi-Precision-Tower-5810>
References: <20260804133810.184905-1-adrian.hunter@intel.com>
 <20260804133810.184905-4-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260804133810.184905-4-adrian.hunter@intel.com>
X-ClientProxiedBy: SN7PR04CA0025.namprd04.prod.outlook.com
 (2603:10b6:806:f2::30) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA4PR04MB7869:EE_
X-MS-Office365-Filtering-Correlation-Id: 59119969-bb10-496f-0bdf-08def2486fff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|23010399003|18002099003|22082099003|4143699003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: vPkpXz6iM2dpuLk/AUq7elhCkrB2VNY1ocWOmaEjhFRWe7MDC1HkJoYipqyeso0KLzLFJzSDSWaisqGhx8Izrjbx19Mry/pzOQ+aasElUdDbiznI8XK+G+BS1/rZMh8QLZ4RQfgQtbHfmxJBGwyk2mmWuLrGtp9kHP1660++kPhi24Jh51HkU1TOuv8FU4DwY94TS1dM+aUNxw6qiKHnmCbi6A3Ic71FsnxWL6746pTqeeyPfCgBAB6QbxZ/cvtr0+G1pSOD6b0p0hSWtRbXT2ocAYQzHgKPs7XR0Wwgb8qZK93vTG5ii3udSkis6TlB0pWCVZu1DrYEkpSSqg6KrIQP9sc8fB3ZoA5v8wI8tQXbfXqAzXFoDaLNLLIy2BIhWJg1ylygSbrHejw60EszrDvRrTw/XoQLfrnmsrjDxQkSdlkCyi5WuXQwKwrZ5qC3FdcPC5B0swge07bi4iQE4CpJ3NsuRE+2M2OLW1nl/ztowQmFfuheSxQ6sGRNpN+i0ALINM8/ApeKeASyfIT3CcB4b8DoK2zJVSJU9FR5IRsoEx50Z+K7uXAAUiIHJRC8Bv0wW4cWkYvhBtNzJXV0AKf0a4Hm8DQY0maJA/3lnksiJ46yRvi7M11B2UWV3mv3GN+rLSQ5pxWVvfnWQbf7hvko4iPJnyNYZkRns/xDxMA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7sAMe7XUdG9wCGPXw33L3mv1i8TPd5/vWiTdKknqhu2LXHqVOzBkvK18tQym?=
 =?us-ascii?Q?d2w6BqpH8JD7J1w5npx7N76O5VOkM7Df8vDuT7EzqizY2VyEP7O4YZsKHXZp?=
 =?us-ascii?Q?5um1og+QMoXnJssdNqzBNSarqkoyq/+mJeGwR8K3JsnhcpWQ8DBJ/t46911+?=
 =?us-ascii?Q?zcasxKDE9xCoh30dYnFqYp5hSWuU5XrY9hQPqoJ/frP6d53nelYofy75Li2f?=
 =?us-ascii?Q?/2yBieBFYVkHsrguWjizZ7ByAkC+SbQ6OyN4VebNpGsE5PgW736jvnzsWFZC?=
 =?us-ascii?Q?tbcZT4xi9WBBXEIDSvlrL5s+L7QwNPmvgJpoGajKn/I/0RAq+iw2cUKOaOEw?=
 =?us-ascii?Q?FgK77s54gtlsvxdDeGxu6EQHV6MT40AwscujsYzmsqmXHffWuYuXvZmj8i3u?=
 =?us-ascii?Q?eHcY0SzObMMAQlCIL4BGouGj+GTNHZmVuVXg2IUPX9UrmGk/vqQLVhWuflPl?=
 =?us-ascii?Q?Xw6VoeZvF1JGxdZs3CPXaVpPF+bFZFy9nODsrYrWvy2ZI0/AE3GKasSt/jdl?=
 =?us-ascii?Q?QcgWUG2KscqdTCHuqYBO13rNhZo5jZBJxHV9RUaXwluGMxu8UyXQmtiAAyoB?=
 =?us-ascii?Q?Y0zUvv2ygKxYc777CeWFtBAB12WmSULUvVbxBr+d1wvkd0dm91Eem0ywrBRy?=
 =?us-ascii?Q?77u/Qq56AEpooigy8wsr9b71NFCT1FEZQ9VDCTeoJjUru7u8kVQ2IyLyl+Cb?=
 =?us-ascii?Q?qq8ke0Zwz94IfHXaBG181XdyBa73oN+6sJtT4MXpBau5w7bpmvSsQsdV2Pb4?=
 =?us-ascii?Q?4S4mP4Q8aAv/YMCT8bFcwaGMhl6uGhb7P/krMa3JOTiLD1RUz4qo6cbbHf//?=
 =?us-ascii?Q?OfZ+iQiUX4/Mq1lmgRn8TLikKd7G7L8yMmgqJvYasvd76CI3x8WPpNDsjy5v?=
 =?us-ascii?Q?pgA7FTpSiKZdoUyIrmrxqLVx6rC/OwYsZ4dSVK7dCBDHLX3FyQWIq338bhz2?=
 =?us-ascii?Q?QQW6JdN0mt+0aC+wpYoxcyX7ire68D9ZxPgD8k0ejWfTv0o8z14nuJsJT0yU?=
 =?us-ascii?Q?nOSuJ0mpXPiI5LMDK1rxhnbS7GDfETyJypjrm/qRTmvdEnW6vi6aMxZMIdJB?=
 =?us-ascii?Q?TfsNxXCcfAiJJw1dsPtLSys9VoNFvwtQY5gdB5y2jLk3SyTxuOBUOr8miwCP?=
 =?us-ascii?Q?MY1UtrNiR+a+pPmVT/XJckcM2SMT47uTB78NYdLs0av94yYilGxG8a6uKBYx?=
 =?us-ascii?Q?78MnhmHsvtXIi6VVxbpJYuOwSrQLcTh9RqRGH+XEtlHDHXmph9bLctG33FQl?=
 =?us-ascii?Q?wrYgb3+se4BbVYU09skJO30mX5CeI97edngh7DJIsQDjfRagWoS74ZBQ5Fuj?=
 =?us-ascii?Q?5YwVD1gNE59ccQBL4carKHAhQPpTetE8VlVB6fd+0DyN+cwuhmcHt9NqEK4y?=
 =?us-ascii?Q?zcPYy3L3eLiyfLbMUV9inLtuO2Au0its+rxjB6+CSDM0yyoJWr9MiE/ddo3j?=
 =?us-ascii?Q?00ywOTGkIu63dpRYwyz39jOM8qUicKGD6fI00Cq8Ix8sL2XelkJBA09cPR3H?=
 =?us-ascii?Q?sbpzayKkoSzSvPHWo+a8V8g7gvJnAiRxZCL1xghYoCACfCy6OopXbYOUaUQd?=
 =?us-ascii?Q?bYg2l6iyvBOszbuSe+VhwzBKm2wkU7g6zkdBzyyxmRV27zTCKOvji4AX4x2z?=
 =?us-ascii?Q?+4J2iFy21rHj1swtsxb6JWjO8RxjfDbhJnKJ1GG79uIFDK9skf6V83gTz3nf?=
 =?us-ascii?Q?l2fvgOAZz7K53xxL5aZiW4fyPAgc7r1rVlilw+oWmdhUg+eMIP5sDRCGG9ok?=
 =?us-ascii?Q?m7gMiHA3vdPuae/Cmaq3f1IbysWhRYs=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59119969-bb10-496f-0bdf-08def2486fff
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 16:50:06.5147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +z364VBlYJUeiwYKG0PR+4qeeOZ49yKI8I8RS/+D4LZzdw1k8N2QbeKY0vpdr7BJnGzBLdmSQ62BGVRVjsEAxOzCMWC2Dn4aXQbtLFgnB5WMJx5JNatmugfB3KDDPWQC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7869
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_095011_413784_377312BC 
X-CRM114-Status: GOOD (  18.71  )
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

On Tue, Aug 04, 2026 at 04:37:59PM +0300, Adrian Hunter wrote:
> i3c_master_search_i3c_dev_duplicate() searches the bus for another I3C
> device with the same PID as the reference device.  The search can match
> master->this, causing the controller itself to be returned as a
> duplicate.
>
> Since the controller is not a target device, it cannot be a duplicate of
> one.  Exclude master->this from matching so that the function only
> returns real duplicate target devices.
>
> Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
> Cc: stable@vger.kernel.org
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>
> Changes in V3:
>
> 	New patch
>
>
>  drivers/i3c/master.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index c7bb52b71d88..abb582645a2e 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -2545,7 +2545,8 @@ i3c_master_search_i3c_dev_duplicate(struct i3c_dev_desc *refdev)
>
>  	i3c_bus_for_each_i3cdev(&master->bus, i3cdev) {
>  		if (i3cdev != refdev && i3cdev->info.pid &&
> -		    i3cdev->info.pid == refdev->info.pid)
> +		    i3cdev->info.pid == refdev->info.pid &&
> +		    i3cdev != master->this)
>  			return i3cdev;
>  	}
>
> --
> 2.53.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
