Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87492C77B7F
	for <linux-i3c@archiver.kernel.org>; Tue, 24 Jun 2025 19:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k3G4cKrApfUo7pygE8ArDEwW22AEwU77jVFf23xKXZw=; b=VVmmanL4hPfj9L
	ar94m+LRb107sIZwbjvg1PK22ReQHeTKD9YAbU/e8sMTStkMHjGJLSfNA3+ZGvoFJh8/ThZ6b4kE4
	D6uKIyyi5Fp2oFcd9ueKnAOVd2nyAvnyjCI05DHeZCM0sQIDWnvwHmNmlGOYMhZPKkXPir8pci+rA
	tV2NwvH8JaLJxXxc1UjTIhiLboaFrKE8hDWLTqNmfgBHqf7BmfJ+HyyTBzyyKNj5Rb8Dun2DZcohO
	KyxymuPZkMj4q9+eKvXfyQvSWuHubJhJ1RZk7qIw7mpQuBP0YAp7Hq4rImyA8VNQI1MvRt1ifWybn
	SWQrdqHpFjjHiRHOH2tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU9k7-00000006gwV-3MYQ;
	Tue, 24 Jun 2025 19:55:43 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU84o-00000006Si9-2Qdm
	for linux-i3c@lists.infradead.org;
	Tue, 24 Jun 2025 18:08:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vH6OjSrSPNWdRUo9TZBO9U/2RDT6TZvB0VQ41ScwjeaguqG78mGNhT2GId0712a8l+NRZm/Zi+f8UjF1PJgrnm51XrMjZKzCtaINFiqxAdtnT0NpTJTf1Ej23jH5TDAbO/6Rm6qUVvR9YOPl/WGo2CzUmeiOfkbRofO+qpgMeIcfr+XxCHa+9rM1O8M9377q2AUEuFic3Z2oe49JucRQMHxLzb9uxcexrDTeOqiVeOeeImE5HB5JEAw9DxIG1hpFZDPVTy2G2T/JUzb+IrXcOeUQYjuUW/PnKBihKBOKvXAbyRjERdb8rBBhjYghGGDveHKxbwy8Vqe4rtTlk8mwtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/WDN1MvReBAN8Ie74BZ4rpHoP/3X3pa8DgZNCgeYVhE=;
 b=S9Dt46u+wCbYt8Wl01MrvsE/fgf5MXWrmWUVZCs6fFlAh7RAsMsvo9lWFmVoDuxdajIuaiSTNp7tGgsxlupmLkxvMNFGMZvoaM8fjZOw+4Q0IoNRH3OZqhl/5TIBL56q0cB46FuGrbPoxtFB2Yt0wD6GP0qokKmXR+GI/xuOFaZdlhyLjAWwCdAF3hS4/n+hwaVOhTr4IBmvOC+GZGnjitmrRfIMK2s32Sq2nhPYm4a4YpcaTg33D1CIBRGx5lSoJVyjMGoRJaNtjeiMVNI94B4ytDW2f0iTUh2N6IhGF/rQbWyT0wDaFZtL1PsaGP5CyhqZtN60XWPNQcLLNZEI8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/WDN1MvReBAN8Ie74BZ4rpHoP/3X3pa8DgZNCgeYVhE=;
 b=HWuXR1kWXnN1A557eL/hQF63lzHsZ9awkAodYjdTK8j3y7KolZfGeQq+SudofNRPAys9elRa/lqN8loICmA+tASFZjGBmIAuV6BUA45HwhdqKX+ffj/gYdaHmY6brbV0dglOcrV9D9KHM8KlrVe4Ho6OaCIcHsE8+fmQf89yqjUCGOzjzSQ3DOtbZCkoKW9Hf4EECMEVXSetwd478YMwy+UIMLLT3h6itgUOpLmpiMxAOJF13H2TcAmTVPGmZlA11N2A91edD6YZ4yHhDzo68EHV1yqztvwFn4SHuT8z4DoDMAcIkz5B3mzwtzdr0Pen/m1+p0FJInPe1w9PNBE/9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAWPR04MB9837.eurprd04.prod.outlook.com (2603:10a6:102:385::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Tue, 24 Jun
 2025 18:08:50 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.015; Tue, 24 Jun 2025
 18:08:49 +0000
Date: Tue, 24 Jun 2025 14:08:45 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jorge Marques <jorge.marques@analog.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] i3c: master: Add inline i3c_readl_fifo() and
 i3c_writel_fifo()
Message-ID: <aFrpra9j69OkkMbL@lizhi-Precision-Tower-5810>
References: <20250624-i3c-writesl-readsl-v3-0-63ccf0870f01@analog.com>
 <20250624-i3c-writesl-readsl-v3-1-63ccf0870f01@analog.com>
Content-Disposition: inline
In-Reply-To: <20250624-i3c-writesl-readsl-v3-1-63ccf0870f01@analog.com>
X-ClientProxiedBy: AS4P189CA0017.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5db::7) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAWPR04MB9837:EE_
X-MS-Office365-Filtering-Correlation-Id: cd6c7c76-4aea-4aac-f636-08ddb34a2b53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|52116014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?91TSRCGwkWSxvobyqqggj/59Wqd5qjhQ8lo+YiMRqLbumhnddgdAMHfYXzYU?=
 =?us-ascii?Q?xrMyM+9tXuo3T/OAz4rkpajrqJNEFSdqWAqfhNzCbRZ14TbW65S8UKW8lOTZ?=
 =?us-ascii?Q?KJjSrVqsm9nHE5qy8bLqUBfyuw8ZWC6QGycaaz/VE9smKJOLjElKlJen8VD5?=
 =?us-ascii?Q?IsWeSAF8dcuIeUvUB+PsHT7nkBGNAoXV57vmjivfMHkhAiF7Wmg0FQHTKomH?=
 =?us-ascii?Q?5qDNQio8Z6qS/69et83QX8huI1WDAYt4YovghVA/vcH8KBYKx5bWw8NtIur0?=
 =?us-ascii?Q?pZT5mqSjXytS0nILbJ7dqIIj6Jkhc04sHiOMy7lpxjLnRrB5KG4sb05LgwN+?=
 =?us-ascii?Q?lCfPfppFBToU+3mGlHA8ibu8hU0x6UfpdRB7LStTa3NsrTkcj0+mbycjuy/a?=
 =?us-ascii?Q?/t5EOPs/Jpvsz6vOQdjOf2FQEsFAAH4jv9jrMmyOiOouKPLMNxH+FhyQi0t1?=
 =?us-ascii?Q?Q7kf2ozMNcMB96pnu3c+2nPgTWqJ8aQiI++DreQ+NXW8M97c5vGAqdhFiz3I?=
 =?us-ascii?Q?dvzEpAwq31pkZa/nZk4oAjl+JwRxtYu58piGN1aMlYCpWitehTMU50g73bDE?=
 =?us-ascii?Q?fvU4opW3DZu4BfPOGZTtqq/9qXCC4PP8/fRBnYx/C4A2Yj6vWeLykX75NeBF?=
 =?us-ascii?Q?+yXWODCqjQDy45237b6BE6JvROMyZW0oaAMaeSTXxa9cb4vIHnW+u5I7/PBh?=
 =?us-ascii?Q?q026PEqfop8HOmpi1HevSxREtwxO+9NiJtHuIH2tnNOqAPWU4MIck8Iasogz?=
 =?us-ascii?Q?CYA5ER+dy4l6NPHUlKrxcyiofCiXHgfZrgY5ns05IgMsSukc9zcEqIms2KGE?=
 =?us-ascii?Q?s9dYpO4ACIRPOVg/Rjm4RNRKAF9yOixJUJjTyDKy7CAn8FNaY7psLKGjTupg?=
 =?us-ascii?Q?AeRlE/McouSw8U1zxIbYyIYMN2FhDOiraGiZFGXheebWV0hMsx4lesSWgHGV?=
 =?us-ascii?Q?v3zEihSmVpjPlk4hbhgKeY9GUxbQ9oGeXgYi974g2JAcqWvoGQS/WgVNBnnu?=
 =?us-ascii?Q?YHYbX5OjBNr2CRU6L8SvIUVCPV1A5Mb143mrrOOTfpYRjAr2oNGqrKShpy6w?=
 =?us-ascii?Q?NC1U1Ni50j3xlqEK+4L6lp76esZIUWHxwXpC9XXnVtHuaUxnhuU7mNWEfG9+?=
 =?us-ascii?Q?2fWU5CYb3xPv4L4DJ162+KOpVfSMxkq//K7Eak0ogTNfG9V8jVlZtl2amogS?=
 =?us-ascii?Q?ymQAJ6hXpx8KajLGECaN+e41dbUWEF5EtP+L/CweIHUcYz+K45aiCd+JVBy1?=
 =?us-ascii?Q?2yMLY3HHvJ6GohUN0Es33LapolCd9ziQplrheAGaOLE02OV2GBGl8FzO5QOL?=
 =?us-ascii?Q?/lN6Ukqt1dChQODJ3yodctbnRtuWt9wpm6dTogIVg6zcMZyjmrX0T+CvG4H4?=
 =?us-ascii?Q?uKp7GnktzF5rorPcUVosi/g9Zz6isAyK+lxLYeNlO8NfSCr9enmh2SdUQ+V4?=
 =?us-ascii?Q?vFI6j2aKi2p90YRZmreAh7Lex7zPLs2nvUXbQcZLCXwI8sf5ildt9A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+kL8demnZHuD8l8RNfAogt+1OZpJzV3b8l+Uvvtf7sbxa860k6C0fdy4L1q+?=
 =?us-ascii?Q?lGyXBscVj1tQGBmWJaW8g/oHNvJdtLg7e6lcAn9rM/XDLhyr+/bTftPZ6qnT?=
 =?us-ascii?Q?4e53BIXr08TvW1EylH19QwhuzjXnVNeDdKktETBGEWjNKIMbDlqZ2vi82URx?=
 =?us-ascii?Q?iYlNNglsPQpzU6BiOGPaNK84g7iiHqlpa1yCskazsO6Fud7DG+DudaiqQ605?=
 =?us-ascii?Q?+h/qzrIwveyJdZotoHxaVFOLZnKm6yL3AXAHuLRkx9G0CKuNRxmJatyk9kD7?=
 =?us-ascii?Q?XmBQjVAaupmbUAtIVJSP3bk6yPBQuWu78hERD8MaoS+g7vfKkoKvFyU5lXRQ?=
 =?us-ascii?Q?RMNd2IGcwDYfpNKo/65R4uCvaN6BsMPRiEGt7l1ezK0TINQC62lv87/Turzf?=
 =?us-ascii?Q?h7PfM06rkT4Mt9euA8Gg7eY0j+QvE2rTUhhvYI/HtEVW+b3Bej3+xBLe+Ekd?=
 =?us-ascii?Q?ibO6ZnCX/sVTYqdJrz/qG9+XK0X71GmFch0e5izPt0Xy04RGXT0NJxSU7FmP?=
 =?us-ascii?Q?fTB7cC9J4v0/CMIV8Tm7H6maTMhJNfrzA0hwmTX9hAWXdh1SicF1Z7D3TkfQ?=
 =?us-ascii?Q?ZYVrA8NWveGPhQ4pvEh3tdz6ejOIDHRaGNx8Adg5eQdNjAzr42n44d+BOOUA?=
 =?us-ascii?Q?DIBACWq7FC2jJ/SKGQtIKp/q9WR9p9RIKaZnpkF8MCVlqCaEsOKQXpAxxPxC?=
 =?us-ascii?Q?ivyhhNl2Wpb8uKWxIGnmLfe6H6pj6DBT03az5BAddMhsU7VGZ5MzLl4Uv8Kk?=
 =?us-ascii?Q?/x+USVxQPf2rOMj3dgK1FuCSAtkk2MFBGMRGbIbF6zs8M83Ui1uxm7RBTaZl?=
 =?us-ascii?Q?6f2fSK6xmbQAcqw+UP3dbY4G2zVFe+URWsQwmBytW/2bbpWLeTsDjpbAoxy8?=
 =?us-ascii?Q?QDdJWXxPzO0egSOwFzBMrqq5S+F8OyE8DQWZzv5gMgIbxu4OUdso116omzor?=
 =?us-ascii?Q?SObjCBapgcCLt+xu0znZ6WmDCAXmizD0zWo02oGdUCFxJ336wqwgCTxcxj6s?=
 =?us-ascii?Q?NKWkZk5SAOkXWgrTBANNjPWZ0xP2TD2cCrwH+lG02bEVEvu/pK8A3QXrQ6/d?=
 =?us-ascii?Q?0anObOEQj+j1ueHBBSAZHmNXGO89FgwfEcJHIl7q6hdA1kC3E2khq9Xqrc5l?=
 =?us-ascii?Q?vq0aiBcLulQfiTo7HXhIpVBMXnWykD4496nNI3Uz3vLTvVZtXiRnGr1ioGcP?=
 =?us-ascii?Q?rKziZmfg5GTWuy0I19chSyq7ESchrEL9950umLMlH5NX/NKEXz4kb5g0vW9o?=
 =?us-ascii?Q?9v2jk2SGRsGwdBcgHBBRe5hP9ztfi6K8uRDyzt9m4Pw/BJp29MnCFXVttnLR?=
 =?us-ascii?Q?BCGr4Fu3Wz7tkY2Nhb1UPlgU8IMZCqsbVXqdD0BGxRQE4ymdYq2zLwHMGuPP?=
 =?us-ascii?Q?Q7gnMCKpvSMeuRMNtwfJukAIVndKB4bYddF0bbwo1ZkucGdlTMqNsvh9qogE?=
 =?us-ascii?Q?RsS25G928DAgLOpqqVwwo+GDgAfnsyNFq84+dvSAsYJlXlNngJRmMClHxNzr?=
 =?us-ascii?Q?ot8ac2iJ7jGUeeoWnnvZLkdGBSIW96Nt/VAxw8bCHz2QxABAnOvNwCuOX7jH?=
 =?us-ascii?Q?wR8TBWBPlzW6IlHSGMA=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd6c7c76-4aea-4aac-f636-08ddb34a2b53
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 18:08:49.5511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7cFimDRaLNNkOLQFca6Pmpbs2kfXWuExt9zEeJi+4YvyUs9yYU5g13foTwGHbeE8VfC6Uw24+KpfndW8ol3u5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9837
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_110858_643534_88FB8A73 
X-CRM114-Status: GOOD (  19.45  )
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

On Tue, Jun 24, 2025 at 11:06:04AM +0200, Jorge Marques wrote:
> The I3C abstraction expects u8 buffers, but some controllers operate with
> a 32-bit bus width FIFO and cannot flag valid bytes individually. To avoid
> reading or writing outside the buffer bounds, use 32-bit accesses where
> possible and apply memcpy for any remaining bytes
>
> Signed-off-by: Jorge Marques <jorge.marques@analog.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/i3c/internals.h | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>
> diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
> index 433f6088b7cec8c77288ee24dbee8b18338aa1eb..6a11437fee47bd1d19354e983d4a561a4356b08d 100644
> --- a/drivers/i3c/internals.h
> +++ b/drivers/i3c/internals.h
> @@ -22,4 +22,41 @@ int i3c_dev_enable_ibi_locked(struct i3c_dev_desc *dev);
>  int i3c_dev_request_ibi_locked(struct i3c_dev_desc *dev,
>  			       const struct i3c_ibi_setup *req);
>  void i3c_dev_free_ibi_locked(struct i3c_dev_desc *dev);
> +
> +/**
> + * i3c_writel_fifo - Write data buffer to 32bit FIFO
> + * @addr: FIFO Address to write to
> + * @buf: Pointer to the data bytes to write
> + * @nbytes: Number of bytes to write
> + */
> +static inline void i3c_writel_fifo(void __iomem *addr, const void *buf,
> +				   int nbytes)
> +{
> +	writesl(addr, buf, nbytes / 4);
> +	if (nbytes & 3) {
> +		u32 tmp = 0;
> +
> +		memcpy(&tmp, buf + (nbytes & ~3), nbytes & 3);
> +		writel(tmp, addr);
> +	}
> +}
> +
> +/**
> + * i3c_readl_fifo - Read data buffer from 32bit FIFO
> + * @addr: FIFO Address to read from
> + * @buf: Pointer to the buffer to store read bytes
> + * @nbytes: Number of bytes to read
> + */
> +static inline void i3c_readl_fifo(const void __iomem *addr, void *buf,
> +				  int nbytes)
> +{
> +	readsl(addr, buf, nbytes / 4);
> +	if (nbytes & 3) {
> +		u32 tmp;
> +
> +		tmp = readl(addr);
> +		memcpy(buf + (nbytes & ~3), &tmp, nbytes & 3);
> +	}
> +}
> +
>  #endif /* I3C_INTERNAL_H */
>
> --
> 2.49.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
