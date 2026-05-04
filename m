Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F8FFF885A
	for <linux-i3c@archiver.kernel.org>; Mon,  4 May 2026 20:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9yQoh+wnAzRXreDYEa0RBGngy4BkGT/aX11tGF04HV4=; b=udllPHlKjdRB3I
	lGxkTmuFGOHw5FMYinmjMV9HhyTzyYbCjXSlygPOS1OQYKf5LtdFbcjRTFwsUfATTVTsUuWTZCaNw
	dJDIjsDo0HuJMv0gCnWHWpHLFIDcHAKZ+eHvlIHxlb3EtBmrxtiNV42+nQvUvrQmBRWlSLta1dh04
	BQRHZkJn9uv4bvMlz7nuj7dA1lKtOkR9jgfYGeUnvrUZOr53AJvuw1n8vdRlwOZ+vt3/OKYZTgKwL
	Lhlb8dtTO7j8NP/TB5xPU7IRvoZzd/33P8lqbnfMVlhlxYYn8pZa5pDGgUyekNgbqMjfBjAmn5EBu
	dDOKuEAWMiNem1qZ3A7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK07j-0000000EHWc-2DSj;
	Mon, 04 May 2026 20:42:39 +0000
Received: from mail-westeuropeazon11013061.outbound.protection.outlook.com ([52.101.72.61] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK07g-0000000EHVv-3AKL
	for linux-i3c@lists.infradead.org;
	Mon, 04 May 2026 20:42:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bMp2+St+NBITRwC8Hb+ppqQakfmmMbLWNigK43CKkGHtoaM/vrNcDjWA+8voE6jlDbyFWKPcaFG+KayNpiyMbzAqQyW9uLalIojtKNFVn56oEGOB5KyBFltx1HiHoqZBQDF+5/KT37QVR+6ZzA/Z6HPWOUthdvcUWGJ8KTQrFKJXoe2IM1jIM5EJAomw2rM5mtMqroFlZ6H1cV3Pa/Tz+Z6807Jrw8mHtviGAuJhclvXcbCCfilzUT+HjeFJEI7eiPPjuPCw79ESmeOMDLtDFc7bMhMsPo3OJmjKeXW5jflUk+ZPD+QupxvnDt2lF7VCepmZ9+L4iOsOC5FYZ4QS6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fI/6mNO0Lu72jHUi7m9/5HBupjKWFXNW8meFczDOO+M=;
 b=n/YVdN5sCE5jNG8e5DAch7U6jy4WW7+XMCV0BVvpZ1lfLgsH4xhD6rb1rwQuL9uZWTSrDLEvRQvAHLKH9iXvSOI9/+aqIl33X3oZxfR54g/fFP7RD8+siLrP8IRz3018ELR6jw4h2HCSYuHbYyoAXqpqtNi6WDprTogih+eWKKpkYu9VEe4izcZR/lG6THA1HrsTopr8YWa4mD+YTthAQjwdCe9Cr+u/+Fgp4VrAGi+XDLPiwnBAq38yZJ4n9Fzgw3Y4C6f10dGJRQo7v8PYoATmVpf/I9RceW1tSzq8djLHFD7ciVSrenXAgBV6rp0gmsLp2eGr6iFguSehQAjtfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fI/6mNO0Lu72jHUi7m9/5HBupjKWFXNW8meFczDOO+M=;
 b=AEPwsHzgdp32gF4jDKzvILkSigEgqaHO0Spr1woYhhkDwMdCFbFGO70Sy/8zgyjYKP3xTbwhPGNRX4nzGWcxksAngbpuqcJfS9+ZBG44u2j0pHWWT/84j6FETAMCYoXzWB88vlAtlt69iRk7sde7i3yHjh3oAYF3hpGKH7EVdUNfW+TYw3r7G7pNwp0fi1ANQO7f17C6F1+XtfNzW4w1mj1g8O94hNwuBsSIn9a+Fa7Xa/V5p9t3ONIiRagP4RKD0/WUimngO5hj6g0l7oijLsNxTfQjK8iulKLX5g9zU1ttVj0XUGQ0K28LRzNpe+2/GoNmUv0v236mFTqAwTWIEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI1PR04MB9977.eurprd04.prod.outlook.com (2603:10a6:800:1d9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 20:42:32 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 20:42:32 +0000
Date: Mon, 4 May 2026 16:42:26 -0400
From: Frank Li <Frank.li@nxp.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Markus Schneider-Pargmann <msp@baylibre.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: Consistently define pci_device_ids using named
 initializers
Message-ID: <afkEsk9Faf8wizWd@lizhi-Precision-Tower-5810>
References: <20260504143324.2122737-2-u.kleine-koenig@baylibre.com>
Content-Disposition: inline
In-Reply-To: <20260504143324.2122737-2-u.kleine-koenig@baylibre.com>
X-ClientProxiedBy: SN7PR04CA0166.namprd04.prod.outlook.com
 (2603:10b6:806:125::21) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI1PR04MB9977:EE_
X-MS-Office365-Filtering-Correlation-Id: d0aeaa23-7328-4ee8-c949-08deaa1daa87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|52116014|1800799024|376014|366016|22082099003|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info: bOhUNDciNE/Lp27NrKk/ke5p5OZuqo6X/lAJ52068/a8mZMCcCwaVdhdM9RdS7hHoLgOGvyEmRxD1TMa4oJlfrVuDEtx0c3TQ/Aklu5nhWG1/lzdxEkDj7ddK7tJTdBiYzsPtuZGGnytX/l7rkq5j7h12lgaYxbnACUA1vgNZmncBLYgT0dwHwH9MZuBe/CFZHvBdN5McRFVS0odgMjIrIJwVIGDe40bJGGfRIYcy3Sqc2ahwsIyDUijxqYPZSl9sHtcM9xvYkVW2zIhK2SrgyD7ezR1za3sVANdRdBr0alcL/wSEKVxgc9EcAqbNCvnsCgiH7HQ39ysHbo8wyKPQ6JMP0AQ4lEpzdSt2jS/FkNE3kHqm7a2C2ijESjI4c2zi0jg3cPY9biM8nRdXy75sGqBjdVLyPmn2eecNmqD3hYvfPJA5iJkRH9zUCoVZ93PxtWRzuRq9L+qI/Xd0ljAA6OkG6TkNyrv/+5V+MckA6+EDScZ3j7QKUsPfJ0HqvN1PbUrHGVc5ysOmxr9T4FqOqkmHjP1h2gPdtjaU7WsvrvcRyRMXB7xwx6D5X3wuhgGhqzA9SrEZqwxc0sYZzf4hhovu5iTJDR8HU03/opxYa8aoqU9MZqqDqdFBlueXnBQCqTmj29Qd17ju46lYge4KWvzEMEToEX4kJQWi5e6A2Oy2bezAdsPTJzyvs1Dz0hRJ7XbXwrkOW6nHLt0yQtG2mJZb6AZjDaapT03+68k4mIMbkIj2QEJIRHRG26YPPpL
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?wMQFdBqpB0iV3AZ14zV23CxcFqmzvvFXKLW8EKZniQ8FAy1JAGN1AKEwyZ?=
 =?iso-8859-1?Q?9IWXvvbRU0FSE9XvieNeY1wx8Oevlefouk3d3pM8rFCS3zx0AsrcG14sCN?=
 =?iso-8859-1?Q?Woh/mEl7jkZLhJq4KV8JhGA9lpmkjd8wzygM7DSyBQ9n7JiJ2YOelXODIQ?=
 =?iso-8859-1?Q?/v74GBEvRBFUZwFL5UiymerAWFZD5hGnxfBzALzhVmZj6l0W8Fq/COyi46?=
 =?iso-8859-1?Q?HhBJVeBp0zLutsV5bY73yA8IsASHuYZgHzK4S93okiAjQFfN2/IdXDYqT+?=
 =?iso-8859-1?Q?7qSTwWogveb0vFoo1Gtu/nz6cR9xk9+aoP4xeSZYzp0ZEliEY43FGaXzjw?=
 =?iso-8859-1?Q?kVy4chTb5RMBu1qDGn62sgrjZIGpYFZJBUCfctYSitq6IPbv2RWZ3laEFF?=
 =?iso-8859-1?Q?QuGc1QshHnvrek9Jawh9+JUTSGv0y5IUELB7GJUkc+fBAXQ4OXsNET/9BP?=
 =?iso-8859-1?Q?e5Co2i2o/mK76FDfEOUd2vWZt6XRJ1obxMY9EiccVQLa/uLBe5/VFeFQFL?=
 =?iso-8859-1?Q?NagwiXxS9sVKakUabGfaWrBd2EDtCs+WDJx/wN1BhxrC2A9g4RpG4qCyyj?=
 =?iso-8859-1?Q?zI/aTea9GalWck8jGNfTewK1/dsmjc0NxOPvTLdkpjeQye4JbiNpA/tG91?=
 =?iso-8859-1?Q?PxLWC8fSalxnXornJEDxcNY50edHNDnfB5s+ARWoXB6f8YP0JskA5ib4hN?=
 =?iso-8859-1?Q?XhVCIj1IzTdUh9vTKmN5Sv1nyG+54u3b3QyJR5bXl/3OBcVcnqJC1qFqRP?=
 =?iso-8859-1?Q?9/1PoiMWoRPmj7qU4qaI1ADeSSGJqErrfH6T6lZP823x0IPhL+DAHePh6O?=
 =?iso-8859-1?Q?WyUWfOogEYIHOVns0Q7dUN6WrAM3b0C6KtF1fTB7eIwr/YprcTOp7HXGLU?=
 =?iso-8859-1?Q?D0ecoErud/iDk6nnWy2XgeF2SZVUqs0d4eGhQEjOW/DISP4FSikbYzTKDx?=
 =?iso-8859-1?Q?hVgEvKFdUUiFGV0+o/9j7+sDI/i3CHkW7IROhpHz0Dq78Upmwy/zi92lIc?=
 =?iso-8859-1?Q?Sr3zQgFJfZsgN5JzhslbHggykGG+thsm18LyDOnBJ8r0Yklt1muaMdtSmc?=
 =?iso-8859-1?Q?pxOMRqQoeQ95wz3zkiR4lzkyXF1er/7wX/nfq6bKhr+NP171ZFDoGu0d1g?=
 =?iso-8859-1?Q?2EOjfykcCzX6m0KTwm5xlmPJtjXoM+KQ0AdgcpR/d52niQ2Dg8QVqSmAkf?=
 =?iso-8859-1?Q?/etO2cZQurgMzHjry5SHCOP4DCgpXal1WbY+JPFauSJRzVmAqsi/txuauD?=
 =?iso-8859-1?Q?YPoSrVQI3f2fflmsN0hzyxa1qSkE6AhLTrrwpYIss93Anao9s8JY2rXxXE?=
 =?iso-8859-1?Q?N3J9+BMqg7zGM7cgbhBUbZ2sbwLj2/AYT/VUyX7TD+pnsMUl/iw/W1uxxL?=
 =?iso-8859-1?Q?ftSfrSHtheZTGwWttN3spqBrKY0vbeIB/g+FxsLAMyC/EqUVNHAIjabV1a?=
 =?iso-8859-1?Q?IBpQZr63UHGbOkSFU+5rAQXx8hlp9PbO7N3Vj4IJCh7giEPUJxaVzvKHyK?=
 =?iso-8859-1?Q?efc80bE2riLerrE24jViik157+Dp2P4otic8wkivGMPij/QulSVveInUmn?=
 =?iso-8859-1?Q?gSFi/hHWtPzmAPBcPe4vxB+4GqIR5Md/V1YTW1xHKOTGBswca2IUfT3n4I?=
 =?iso-8859-1?Q?y5kG3yb+lNDsniei4A1aIxMrJPI6wAM+ak7LrUvAjvO3eyLS+i6gRNNzB9?=
 =?iso-8859-1?Q?q/OAwJT8R7qodVSaADhXCg5kpWxYWORBaCUbgoErCzh0uJwzPHuABwzAvv?=
 =?iso-8859-1?Q?KJYqsllYVOv/NZE5fmg8IH8nNkZoZ9HwF2HI0XWB/FvXg1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0aeaa23-7328-4ee8-c949-08deaa1daa87
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 20:42:32.7511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r3z/Hi6mL4Av0flOIKMo5hkChGNubZJNCe95gGzBRC6SDEVHj3QQ5A4ySZy8Yy74YAf3+QLj0ohf2Qm2ZIHMrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9977
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_134236_794957_BCAA556B 
X-CRM114-Status: GOOD (  23.04  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Mon, May 04, 2026 at 04:33:15PM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> The .driver_data member of the various struct pci_device_id arrays were
> initialized by list expressions. This isn't easily readable if you're
> not into PCI. Using named initializers is more explicit and thus easier
> to parse.
>
> This change doesn't introduce changes to the compiled pci_device_id
> arrays. Tested on x86 and arm64.
>
> Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@bayl=
ibre.com>
> ---
> Hello,
>
> The secret plan is to make struct pci_device_id::driver_data an
> anonymous union (similar to
> https://lore.kernel.org/all/cover.1776579304.git.u.kleine-koenig@baylibre=
.com/)
> and that requires named initializers. But IMHO it's also a nice cleanup
> on its own.
>
> The anonymous union will allow changes like the following:
>
> -	{ PCI_VDEVICE(INTEL, 0x4d7c), .driver_data =3D (kernel_ulong_t)&intel_m=
i_1_info },
> +	{ PCI_VDEVICE(INTEL, 0x4d7c), .driver_data_ptr =3D &intel_mi_1_info },

I think it is good. Can you directly change to to
	{ PCI_VDEVICE(INTEL, 0x4d7c), .driver_data_ptr =3D &intel_mi_1_info }

I think use anonymous union {.driver_data; .driver_data_ptr} don't impact
the current drivers.

Frank

>
> (together with the respective change in the code when the value is
> used). This gets rid of a bunch of casts and thus slightly improves type
> safety.
>
> Best regards
> Uwe
>
>  .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    | 22 +++++++++----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers=
/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> index 9468786fb853..5a9e2a43eff8 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> @@ -461,21 +461,21 @@ static const struct dev_pm_ops mipi_i3c_hci_pci_pm_=
ops =3D {
>
>  static const struct pci_device_id mipi_i3c_hci_pci_devices[] =3D {
>  	/* Wildcat Lake-U */
> -	{ PCI_VDEVICE(INTEL, 0x4d7c), (kernel_ulong_t)&intel_mi_1_info},
> -	{ PCI_VDEVICE(INTEL, 0x4d6f), (kernel_ulong_t)&intel_si_2_info},
> +	{ PCI_VDEVICE(INTEL, 0x4d7c), .driver_data =3D (kernel_ulong_t)&intel_m=
i_1_info },
> +	{ PCI_VDEVICE(INTEL, 0x4d6f), .driver_data =3D (kernel_ulong_t)&intel_s=
i_2_info },
>  	/* Panther Lake-H */
> -	{ PCI_VDEVICE(INTEL, 0xe37c), (kernel_ulong_t)&intel_mi_1_info},
> -	{ PCI_VDEVICE(INTEL, 0xe36f), (kernel_ulong_t)&intel_si_2_info},
> +	{ PCI_VDEVICE(INTEL, 0xe37c), .driver_data =3D (kernel_ulong_t)&intel_m=
i_1_info },
> +	{ PCI_VDEVICE(INTEL, 0xe36f), .driver_data =3D (kernel_ulong_t)&intel_s=
i_2_info },
>  	/* Panther Lake-P */
> -	{ PCI_VDEVICE(INTEL, 0xe47c), (kernel_ulong_t)&intel_mi_1_info},
> -	{ PCI_VDEVICE(INTEL, 0xe46f), (kernel_ulong_t)&intel_si_2_info},
> +	{ PCI_VDEVICE(INTEL, 0xe47c), .driver_data =3D (kernel_ulong_t)&intel_m=
i_1_info },
> +	{ PCI_VDEVICE(INTEL, 0xe46f), .driver_data =3D (kernel_ulong_t)&intel_s=
i_2_info },
>  	/* Nova Lake-S */
> -	{ PCI_VDEVICE(INTEL, 0x6e2c), (kernel_ulong_t)&intel_mi_1_info},
> -	{ PCI_VDEVICE(INTEL, 0x6e2d), (kernel_ulong_t)&intel_mi_2_info},
> +	{ PCI_VDEVICE(INTEL, 0x6e2c), .driver_data =3D (kernel_ulong_t)&intel_m=
i_1_info },
> +	{ PCI_VDEVICE(INTEL, 0x6e2d), .driver_data =3D (kernel_ulong_t)&intel_m=
i_2_info },
>  	/* Nova Lake-H */
> -	{ PCI_VDEVICE(INTEL, 0xd37c), (kernel_ulong_t)&intel_mi_1_info},
> -	{ PCI_VDEVICE(INTEL, 0xd36f), (kernel_ulong_t)&intel_mi_2_info},
> -	{ },
> +	{ PCI_VDEVICE(INTEL, 0xd37c), .driver_data =3D (kernel_ulong_t)&intel_m=
i_1_info },
> +	{ PCI_VDEVICE(INTEL, 0xd36f), .driver_data =3D (kernel_ulong_t)&intel_m=
i_2_info },
> +	{ }
>  };
>  MODULE_DEVICE_TABLE(pci, mipi_i3c_hci_pci_devices);
>
>
> base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
> --
> 2.47.3
>

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
