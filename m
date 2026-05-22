Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEDF9CD5BB0
	for <linux-i3c@archiver.kernel.org>; Fri, 22 May 2026 19:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yDf/twJWU5SuLFoZyPzTuhE+cDg+Bo20rNEmCBg+piA=; b=wvUJjK5lR8xAnt
	BygY8TJp5jnHDNuueCBatY0N2GoLPQ1yus5yV+HbGSmMGEeDfZAaQsauJS+sPm8fkhROOcsb3dxCb
	71VJAjxuxt2HciWglz989JxFgQqgWMIAwwkjEGCra2sDbqjVF9iko9SesyQqe2MGxJH0JFmcRwUOh
	dcTUGKg3VCVykhs8wj/pUOO3LM6iwWYoVR3uVivh97Hr76ZAvXApDVSK5maEfhoxQ0oNc0Gx+D9Qa
	rm8F6ILkGZw+qScIva/0XRLFQW+d3ncQw7jgwnCX1laaIiF3mEHNSglCG9n6ql/SL2phtt6YyNpuU
	LjO3F3YOyJXzGN9vvmaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQVNd-0000000Bkx1-2DQQ;
	Fri, 22 May 2026 19:17:57 +0000
Received: from mail-westeuropeazon11010008.outbound.protection.outlook.com ([52.101.69.8] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQVNb-0000000BkwV-3OSb
	for linux-i3c@lists.infradead.org;
	Fri, 22 May 2026 19:17:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ErJB+HbC84xRyUjLwzEg0fdVBi6GOean5+r5niZxFUgiVHXOuj/KO1RPmV9A6MqR8wUzaxRUbEp062iqv5XliPzhOjr0jwtnez8vbmOUL6o8L/9F8zRzpgJQGCUvZEWSQpkHgnlWGsdleXKHuxBOp2P7MMS6Mr6r6VTYMOdDw0gYXfvyDaebCU8aFGaVUecabn6gG5XEIKb+i5pjnNdoy0nynMekHB1CYwZIbUhVPOs+7WVAzgROzg9Vmvb6egPQiKArtlp0EU2nQ3Z9SiTEUjVcYx9/fu9SXWYJt6zdLnfbpus3vqolLNSg+Fv1nVVSlNWeSNaFDFLusy2JrqHETg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PRlxCcFyN4j4ftkRhYpNIx8GKR4bTuwriGx/LF7AzFc=;
 b=ap13qkUZUScy+burF/599jpiPC4p/+DibnJqHN6Z6j2Yg8TUsrFXn7dc6rW3AcL3sCGQ8sv7ezAjprgTk6oDhcLh7rCoYErN+wiiSLVZkHffabxs8JGi/0q9d0zSAtQOne7VNtL2SHyZR7MrePtaUcjE3FxrhPmID6MWFcSYfdMB3abBOhlBuoI2RN0ZvFm6miV4TIC6Z3pVU0JK4elQAfVUx4kiORB+rH/8iwV9n1dOkDCNdk0cSLFiJ5a5blfUJKgy+f9xyh+rHm1hVyveANKoRRSZY22TCB6xD6M2nAyQEzXO7mzWztzG3Krn8alqINmddvYkMkwuq9iD2Bd6Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PRlxCcFyN4j4ftkRhYpNIx8GKR4bTuwriGx/LF7AzFc=;
 b=NywAJWlNgQMog5/3DRsWMZMDn8XazwGDoAQ4V1/Y9eRQz38dr8z8XzB1GEsOXSSfNnM6SleUQEQ/UII341JdGKdOctT598rQ/+bZRA1we3ru9Z/tT524BgBXDWY9/xh6PNDIkaSdP2XmTsxpqzh4LcBv9kXhds/CNcfMicOYyDPgyeFHuKfG82bWwj4DpMNuDAF6DTVDMU445HzlaIXohEGJz3g7qccmiomyKCxYsiTBeB6GB1x/X3LNZCorwUlvMl2tNcIGBu77nOmStkVi8Szq4aTNK78KuIVyt+7Td7d6lbroxYK6adwnNg/OtAIg0JIoludFTP22Yg8lGoWXGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB12323.eurprd04.prod.outlook.com (2603:10a6:800:320::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 19:17:49 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 19:17:49 +0000
Date: Fri, 22 May 2026 15:17:42 -0400
From: Frank Li <Frank.li@nxp.com>
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com, p.zabel@pengutronix.de,
	claudiu.beznea@tuxon.dev, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH 08/17] i3c: renesas: Clean DATBAS register on detach
Message-ID: <ahCr1jJRRaqxTOiZ@lizhi-Precision-Tower-5810>
References: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
 <20260522101815.1722909-9-claudiu.beznea@kernel.org>
Content-Disposition: inline
In-Reply-To: <20260522101815.1722909-9-claudiu.beznea@kernel.org>
X-ClientProxiedBy: PH7PR17CA0009.namprd17.prod.outlook.com
 (2603:10b6:510:324::17) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI0PR04MB12323:EE_
X-MS-Office365-Filtering-Correlation-Id: 9862727f-f8df-42a2-eef4-08deb836d01c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|52116014|7416014|38350700014|22082099003|18002099003|56012099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: ygR5XUvI/sMXm4dDJJJwS0UV6h/U8CP/asT5AqShoW3EVvNvtOAEfttQxBig13ZJODGKOLeiUpCTzfuAIY8NkZFrwi1Lvueo2dYvvOmTOzZnZ10wxViHR9NO+iyLMjNLXDxHM1iwW8kHhdl8K1RJCATKWyxQaLfOlWzxFeI/1MqLjUXEsQHstMMMNWYeJ5DSth0goIuAtM12c/H0/dVOoZZ+FoQx2hm0DUCvkS2fA9i5ptLciMFEtnagZD38O8PtSOAUEAgA9qxSlBIIkYiumK1Oont1ppbdanJnystgy1/R9PyMbIcGwUILIsoRGKbhx5U3jJVG+TxuQ6J75Fzqw/eWZcQ25Nfxe9gXpkX5dFDpRyhKBTE1ipMHKx54fvDJiY9XXBzBAMtAwb3UzUWhrLJy995NazeQEMsrLWRnr4EgVOL/mY9MUjy5scXMWIbIVFzPnp0402kez6+aWyCPpgBpR6YGW3Fog0e6gANW94ZfUaCUDkOqVzeBKobPVK15wagBZwtDl0QjJGW6xOuYXU1ng3C8tooLwDEzoOC3xNH3zZL9sQyEf82lBaWLbe5zU0xJi4e8uHPdvUrqju5z4JmvxKdt5/RYlYNYDZy9rd9T5OKE7AQyv/Hz9uXkoWKj+qTMqfRSXxesrrisx1ipsc/ZVf4WDRwWO6vsmbRu2zWHqmoj9qkePPNrnhTLcTjmHrne+d/zLPK6z0jUwS0wCS/W6okF4RqNN31DV/l7DJdblmlevbgDgVa2p2yLyB5T
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(52116014)(7416014)(38350700014)(22082099003)(18002099003)(56012099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yOhCx7ALjy9/9XCtemnZr/9+r0ypiJ9QqE2gP8BxOXjZXO9P3bIUekBSKj3c?=
 =?us-ascii?Q?9u6D05LAnqehqoo17zz7RQNLoAotV0gIRqrugL5/wPtom44m3HaHr9sgOgpI?=
 =?us-ascii?Q?jsog6Hdpi417mU7kEIhptn+QgNiH1BMYXnIV8e3UYHS6umWBdysbN7KZxb/I?=
 =?us-ascii?Q?sckwHbqqzO1IENcMKH7b4vL34UPeXbmYBxOM105tE5iobXy9jpQcCImGIsnw?=
 =?us-ascii?Q?nzWm3BYDjbLhQuJjnB2YakTILmTK7JUvtKrE7+A5aroii1HhsBaLd68s+JWa?=
 =?us-ascii?Q?9mDv/TOV/Do4ozmKsGOToihSAIPka1mD0joEUf1cnUYv2jfUupFFwnBFokM2?=
 =?us-ascii?Q?S9l63F26+PvQtv/r8x8TchiYgjRGQrSyimFRZtRbxQSZer21qaDlaM+piBPn?=
 =?us-ascii?Q?1ygMhJOdmPArJhlma4hPPWwnQRIU5DijstYtwHxsoGBnCXsrrkm/FKSRJewk?=
 =?us-ascii?Q?3DIXC1yLoYSX/lj6LI7eoVtO+VbXTypkpqxDRkg1PYAeXDCFuZzaihMO6L1w?=
 =?us-ascii?Q?qGvs2I4uYTdHrgum5VMnTxgnFe8cmiue8u5JpB5JpUm0FX7UE+3LsXN8K8on?=
 =?us-ascii?Q?+v5CqZD0iohr7JmRoLiCszKLCCFxu6XmWb1wp3XDtHnceUVd9eI8L6c3Af1Y?=
 =?us-ascii?Q?HDk8MMhLew0bD4e/fV0OqXKIhh/HI6eb3e9YQIGbMjt9oUiBYb9AJPBEoNGu?=
 =?us-ascii?Q?Dr/p6rcZVL4F4YQGxpE54P68u4eh9Hz0TmgLsBrC8tpbN16800Lh9By9pViT?=
 =?us-ascii?Q?ighUUBw1yWdaV7wvKJdw/3CA0pjdQCdugHpt84lfWmN/MAaG+j4CwExqhaSS?=
 =?us-ascii?Q?kszr6ctz6pte/iuY5ahOWwuV+W5YZ2lOnb/CWSG5bCARcITZ4XwTH7wir0sp?=
 =?us-ascii?Q?9HDGa6Va2OzPCoRY3bxD4glo5yAtp8MBqnrI4ONPXZAT3+P6PvXLsUhOdXKO?=
 =?us-ascii?Q?kHz/t4c1SKtpGUPBbkcjNnxQ9ADGYw8zmlVDupicMvh8PLl2Q0o7p14GHDKq?=
 =?us-ascii?Q?6Y7asjsoFX67NrKMHggJKi/92FUbykaJQtDhwxarQ+Y/X9ndrKvOR+34xho4?=
 =?us-ascii?Q?jrsbjW641+68ufb5qPp5/Ndr6AxPbC6B3uzR3iIEju44LmlThe5n8Tq4fvbx?=
 =?us-ascii?Q?9orFPzBZAjTKaGIExrnKLNizwurtzOa8jAPnKGN4nT1P17vN/wBa0SPF530B?=
 =?us-ascii?Q?MtplXNBTXc5KQKgRK6AKGWeY+NxsiXVx8K/9kJF7atIHHdpvZx1EQudwL3Ei?=
 =?us-ascii?Q?g6La7DyMSUYcSLp1xQnUQrwtEKxzA2wAjxK34yjTdV0y2tY6iivzPUazva5n?=
 =?us-ascii?Q?uaoSn85mqAlWOrtQOzD4d384dUukD9yHfXyuAr3nE3wQUKfu1Sx+b49nhTDN?=
 =?us-ascii?Q?VWC5pluwonLRThoP2zSJRJ4W2frdomOnDQBBbHxAsqw7Z2E18p306hESgGh9?=
 =?us-ascii?Q?IR5cgu43uUKGCjUk0tLgsivAoz2VzXrMHPKIc6MaekivoPTMfRkTojnhEg8G?=
 =?us-ascii?Q?S16oh0XIG/4qFgVJgzX9Mwr9uR5Kx7PiyY0aYAcmXeK3LytOoW2mdqeGG6wZ?=
 =?us-ascii?Q?0HMoQpDT0qyNqIXbz1fVvUmslc4Di+rUXX72SljHNsBUtDtKODoxCfo0QAu2?=
 =?us-ascii?Q?aRKabMXiAm+ihgiT/LQ59OqHR6uFy8cKWHKo9YgadXzVZ0mSEV3rVDg7NSCJ?=
 =?us-ascii?Q?xOH9gm7ylDR5jlzVbtnTwMOzB8OJQLKLT8bJ2U0Qp1UeLnEq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9862727f-f8df-42a2-eef4-08deb836d01c
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 19:17:49.4282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bDLWw/pg6Cm2ehclXdCUaz9n5hZYGmRK0PWP0imLXbZuY9NvyOMmIAIcpPEUQlSdWjisHumsZ+LOB3at3eaMvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12323
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_121755_850163_3EA25AEC 
X-CRM114-Status: GOOD (  14.10  )
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

On Fri, May 22, 2026 at 01:18:06PM +0300, Claudiu Beznea wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The controller uses DATBAS registers on TX/RX logic. Clean the DATBAS
> register for the detached I3C device to avoid issues.
>
> Fixes: d028219a9f14 ("i3c: master: Add basic driver for the Renesas I3C controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/renesas-i3c.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index c009d0de6a2b..d32646deb69f 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -922,6 +922,8 @@ static void renesas_i3c_detach_i3c_dev(struct i3c_dev_desc *dev)
>  	struct i3c_master_controller *m = i3c_dev_get_master(dev);
>  	struct renesas_i3c *i3c = to_renesas_i3c(m);
>
> +	renesas_writel(i3c->regs, DATBAS(data->index), 0);
> +
>  	i3c_dev_set_master_data(dev, NULL);
>  	i3c->addrs[data->index] = 0;
>  	i3c->free_pos |= BIT(data->index);
> --
> 2.43.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
