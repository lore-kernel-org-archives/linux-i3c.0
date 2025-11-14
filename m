Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E6DACEACC1
	for <linux-i3c@archiver.kernel.org>; Fri, 14 Nov 2025 20:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rbfd63kUR9nFuZfTBLhQLQ3GH3zVTe8GrIqG9nazekg=; b=BZ4wN8gv7UYKcs
	NviWVVa1z3KFhFmBsIIB5snIOMv1Gj41t4foE5mONmv/wovdJakpGzchHd5eofGY8xgqquIfqqYWe
	CraLIDpnSzSHaf1/wsbB4PGpXeVKbzlWeacpXELTtIVqKnuBXz3mWzRzWnhC51LjB8m18otE8oPxM
	xOxZMYJ4vj1yO1SaRgND+zXqnu3xnO0s08TLby+eaUFxhk6tyzcW6UAXEgvLgltA24kprFDDz3OUz
	v9p7Ufi2l5HtjqtNhbTHyXTBb/DOJebqjxpqKsX5SnILyWGfNSJAF1h39TibKVzUcL8F6jyi4kJMH
	GoG64sn9MyUAe43Dyqbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK07i-0000000D4Di-3wLG;
	Fri, 14 Nov 2025 20:10:22 +0000
Received: from mail-northeuropeazon11011064.outbound.protection.outlook.com ([52.101.65.64] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK07e-0000000D4DK-42cb
	for linux-i3c@lists.infradead.org;
	Fri, 14 Nov 2025 20:10:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WNWwlZJ+ehE6HinC9AZdohkGT1C1om2pMx7BcZ/mtBhMXZxNWsWOZr7QNuMKtZ48wFrbS2fHNjOfcYWGgk4j9Tmed3emXKc2fHeVQQRnXDoCesYANWpxadkBl4CRdFbPBJ7afElAiXZGxW+FYSE+a/UKuv4Y1YynO+49KfaaCTngny3WFMFLSpx2Dh8saT6FGNDoWN7CcdXvbo/y0hs6anlgG6Aprg+oeRCZl+L9smjW2j4qdV22GnhZxxNWiEJKAscT2WkVSYv3omREtLp6Gwq+Chf2C5L1YoOG8LhCMmUG9T20Iu1rOgWyNwA7aVrgVMTdLoK02+DhZpKyGu/KuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8AmPoLkhN8pJGGDYBx/A3ZSQDRqxoFMaPnAVDm6vaLs=;
 b=baIGKLOQc1R5shqCfXfetHfhHiHgao3F9sOB6t3U/USCIOtplxkY0oibZBfVPtRDYhE4LZf23Pjvek+BRDBseul97dBhmcP200aRjpVWNK0argBfvM4dnvhDSCgfImTrtwWMcg3jmsbqGtOfz1dOiHEi/yNrfujhOwnpqXxVDJRJzVOO5eqY3Uo5NS/dqbczC8QiHAJaaQvqA7jKHZcoQ/OfKyFSpkpBmW6Zixf4guyGl4QDhqrY/kOTZgv4tvVIhhqYT8SlNHszqY7QgSFPh6dqDN41MEADsEsqkr9zjCvKzsh/juH5+byA2DG0zhQLdmJfUI8mCIOarv0a5e/Giw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8AmPoLkhN8pJGGDYBx/A3ZSQDRqxoFMaPnAVDm6vaLs=;
 b=mgcr96oybCUQAub5DizDl34w0ejiMvN9nLczHmOM2k3mXZeCszFBBQJKyNCM+wgIj2Sp9sDbJEnCk0kA5djqt5l5I28YspT06H+XOYRlSk1fHV3aoeRRHBOrNLRpW5wObCKaBP8MnCHi5CCG+bdX5nbPGiZzwvR8KFRhmaUhrWUjA2GwRJmTpE6BZ/OVZAGb43/2mmMChNYngtVexePIIOe6wxnap+O4RHsRwAMDomkkGFJRStSvE9Um0TFBWtoZ7rvmr3c8TMxrD1rPqKbbiVTGlROGIRO21XNYKMlxc3zu5byq7qsRLd4PhZk8i99slAKdA+lzODXbE+wiiAmiAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by DB8PR04MB7004.eurprd04.prod.outlook.com (2603:10a6:10:11c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 20:10:12 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 20:10:12 +0000
Date: Fri, 14 Nov 2025 15:10:06 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V2 13/13] i3c: mipi-i3c-hci-pci: Set d3cold_delay to 0
 for Intel controllers
Message-ID: <aReMnvpTrnxP3PwL@lizhi-Precision-Tower-5810>
References: <20251114181356.66515-1-adrian.hunter@intel.com>
 <20251114181356.66515-14-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20251114181356.66515-14-adrian.hunter@intel.com>
X-ClientProxiedBy: SJ0PR13CA0132.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::17) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|DB8PR04MB7004:EE_
X-MS-Office365-Filtering-Correlation-Id: 13a4a1e5-d023-480d-2c88-08de23b9d1b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|52116014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Qfyxiyn3tN6afG5doHxsY7mSCmZ+NLMWU96ofsg5H3VEcN55j4Cwx0ye7C7O?=
 =?us-ascii?Q?heHWYA1j1362NAjsbVwXuIxmfj0/k3Wuae35lim50j6UZ8laSJDDM7e7Fdto?=
 =?us-ascii?Q?Lgfk4tyedaiArLIVRCWLQcCbZjMTbo8D1+ubACBlWwTaLCCRzxNrCQWAX5bE?=
 =?us-ascii?Q?NNKx8AcJ5WGNgycFNv3ifelAu1HIWI/laFtrK3NIW9iWhNIgle3dyJYUPCt3?=
 =?us-ascii?Q?7jarQYny9BHt7gj35hJ5IGTuVjuKNCtn4jzzfo5+eaKK8aoELXlMzG7DBFO8?=
 =?us-ascii?Q?lF+FZ+AeM4a399193/N5NvwzVPBjvsVm35IsO7gz+8FiKCmHHr5P5+cN8Gb9?=
 =?us-ascii?Q?PqOk/BWQtKmHcVA4H24MpjJibo+MS9Sx/35JD1qccHJJ0BrF/VQay7WzfdRn?=
 =?us-ascii?Q?U0pOk5yj56IFmGeUT4U7cQO2lThziyjTBBWbaPY8AvOlaLg0I82o26WLR4EG?=
 =?us-ascii?Q?in38UBga729EPQ0SbbjLt1SG5u4sKj1lc12k0g3sLbqA/STZiSzwjrc5vWQy?=
 =?us-ascii?Q?WviVFCqNEv3MEpNr03nPe+KqgN4ocsfDIvYD7/rrkdv3TvPd2bWUd8UXA1Is?=
 =?us-ascii?Q?7h9GUYftSoOweg4m0lM3sVBLooBSOj/qO0cctmeUliU494vR1tbTearEzSSC?=
 =?us-ascii?Q?zayQuAnLg7+UUCS9A8XFD8LEDtiaPNMHRbEOZ4oLqWlnIlO6Qy40BgmU5KID?=
 =?us-ascii?Q?aN8zL+racRNsV/Q2cBfco19xdvNAdsjk7+BeW4+2lxhvwwrxwh4CYWNzLyWk?=
 =?us-ascii?Q?rlct51TF2hFJZoE3ZFi6LNXGp+AV0I1aZhUpxxFFr6LY+vHNPdjAPX78n/Sm?=
 =?us-ascii?Q?wPVuS39UR8Huld9Vfkzsj8InRt9GiI21BVw9WmCTCKE2ClAhRSL/ripTwWFv?=
 =?us-ascii?Q?j3Z3xLP3wnc1VF3qp9q+QVMZjuq4m1lYghUVlXi4aVTyPmLdBtBqG6njHzSV?=
 =?us-ascii?Q?x+1ibAf1DSribDBWTFJ7hJ8I7om08bPM7/uGEYlimtfj3YiX0Wh9EZIHBSJr?=
 =?us-ascii?Q?i2PtB9GoR64ZrNyYW6qYwbF0XPTbb+j0J+Ld9oOs5tIh1BFtiRSph74Pi4oF?=
 =?us-ascii?Q?4mK5tO1PfkZQ7Sn32dkhvfWn2N/dBVoXEwBXRX8FfGZuBY9f7mXFd4Xutswg?=
 =?us-ascii?Q?l9MiMV4doC8dPhXw2KVWhm9wmlNNF0oVrZqxkrrr82+PqjAiDPGJ6zfBevkP?=
 =?us-ascii?Q?JQ1Dvn/nj1FL86Y7uuPZnN8MM/qzlKtKOfNKEzE5fPAIi1UTSJsL5qPxrfa7?=
 =?us-ascii?Q?BUmOos6CS6aBSWwy/1AkdDRIk/X5OKJcly/9eaXNQ5gbXXg1YS06iANM9h0w?=
 =?us-ascii?Q?Cm1zdY7J/KS/JLOuKz29x3Qlf1nB8QcUdF5mh8M7iXbP3T56AmHOEjjL2c1J?=
 =?us-ascii?Q?3UpS1YPzkYa5MHnKdQEta4rm2ZMHIvB8L9wkIo9Jw1n9kepjQWDurPNC7E1d?=
 =?us-ascii?Q?0MlLnz0FMZtKtbsa++UhoaVL0ootAiI4G7qWa8z8IYxuki6qqbKkHfK9Ra5+?=
 =?us-ascii?Q?tjelCXZrcPs4w4kEFXsEbWHANvFGSMK1QOeQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(52116014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4wR993K9JrY6nxNBsMq+w+6LhV3beCJJICjDajj1gWyIvOxuqd/RsdoWqigQ?=
 =?us-ascii?Q?b3az2SmATCPefjx/fYgrVAeOFcmEhH1pa/g1AMYWxbfNgigxkgCfkpA3BQpM?=
 =?us-ascii?Q?uQ6sXFz9kMtP2MFyxrgGMX3oTTDYz7FFVdFGP0H1g/xBN7kzitG5WbEaqaOb?=
 =?us-ascii?Q?H1ZbrLHpRwZM4qwksYw8zB3EO8qz08RKgDDn6Z936v3PV2fSZWXNwjNiyZ90?=
 =?us-ascii?Q?GSskR1uouaLCdXJB/m8cPlfK4Tq9BjHo8/C4vwVaQJU0tyMFrHytVgewHsEY?=
 =?us-ascii?Q?LUqJQYgbXLLuEi6Xrv6odUneKPCAQxPqiv2PunnokghHWf9ULfvJJmdwJFdF?=
 =?us-ascii?Q?FF03rEFHuqi0GPplksij5umDCPIbwHHMjgaKRWTzYPhxVrV2VeCqeQExiDjW?=
 =?us-ascii?Q?tEwG6wwGTLl2pIgbqKvrOULfRQ9J/6K4uoDO8KuaSUk14pMeTZ56MpazcUIH?=
 =?us-ascii?Q?oFMaPjR8O2Oxuml3t4bSaRXKDh97oHp66zgqy/9dPi96rYJJMDiUxRa3Tx5Y?=
 =?us-ascii?Q?HI5q5eaAlB008l5zaySIwgpX1pYHIamaFYKT26nd1KIoyukvbg8RuXtlHKb2?=
 =?us-ascii?Q?I+pjpyfP2ZnUEXG8MevfoNn8M3Gf61AjJwwl1cewh9K7lLvKyB1cau1SBHb5?=
 =?us-ascii?Q?v078VvXpNELv3/mmOiYnwiTzIu6qzk8pwikpiKBu6fvArL93erIVKB/trKYA?=
 =?us-ascii?Q?LUU4ed2U/HnyFSeUm5T1RVB8J3oRUS+F9+t6RZQXlP32FoYa5dLpbyFBhqRV?=
 =?us-ascii?Q?zsUKD0W5oDZzZ6f0oXt2yc3AQSXpn8IY75XR4LFFAWFZlXLLdgtthaipK1di?=
 =?us-ascii?Q?1dP3UMnlvW1hmeTGOde7o6H3Zh0xNpzJ63lrmagV1bWHhuVeW5EKUEvG4gmm?=
 =?us-ascii?Q?ZqPDouU+tcVoaFuu8a6sFaND1xk0hk380G6q0RJickz/0awWMCgTQzQvA4QN?=
 =?us-ascii?Q?a/Cg0g/TvI4KoMr2soNi/OAGRQsjeclN9e5paGGWQhC2GI+Q9qbwNu5GoTUb?=
 =?us-ascii?Q?L75FI1jNDSGM4i9JUC3uLg6m6vm8iIEEi7fMZmKkBFgpuKjQUWM7j2pKN29t?=
 =?us-ascii?Q?6cEOyUb7lu9yix9/lDxbz6+LK5pmX+2DA6sjbQb66DiB0wFVQr6U01JKsofl?=
 =?us-ascii?Q?7jGq2Cy4OZ3sVIJ4qk/P0I4SiVfT7M+KIMEv8VNrJWOfPiZdKBZUnOiAx6L/?=
 =?us-ascii?Q?2UVRodhR8fqFcy8wvMiGuFHYGCQghp5X3y5xm1tI1SPFtQjcy9JNQJPvJl3g?=
 =?us-ascii?Q?oNhkQwkNJAXJGeMQmqM5UOMU9kFqr0fThmITKaXGr5eVmNk29n4Y78Lzb6S8?=
 =?us-ascii?Q?ufOA9c/xYvnDvI6e2E9gusdQT287e3+548r+QdPxoVPnyGRh4zE0H1tosZin?=
 =?us-ascii?Q?97mVx4zrKJaLLqNVUbpJp1eCRXwQ/BjTJovFLL/LCz+MvQhNHCTM1PVrDW4A?=
 =?us-ascii?Q?JdIt0W06Tu0uAFb4lAX7Gq+H/8VJ7ZPD4zzlILFe9/1Pq7rbeDfbYhfadN2f?=
 =?us-ascii?Q?4FAwRIRr/xbwVijcF3iwrnATMYNpUtc+ShO6a6D8sMEG5MDqklin4Z0AMY5x?=
 =?us-ascii?Q?scDnhl2vQGcQl+Nxjupt3l7pwyPD8Na8Uk3HLuaF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13a4a1e5-d023-480d-2c88-08de23b9d1b7
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 20:10:12.9049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZAV19Fpjso2Fyx1MPp/uuQLPOmvndlVvBq4P8NcpixqcMZPWNWteQ+qLSyLZcinePQf6fRVjjnPOktkZCsZjVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_121019_003659_0E5D5F4D 
X-CRM114-Status: GOOD (  14.95  )
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

On Fri, Nov 14, 2025 at 08:13:56PM +0200, Adrian Hunter wrote:
> Set d3cold_delay to 0 for Intel controllers because a delay is not needed.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
>
> Changes in V2:
>
> 	Re-based
>
>
>  drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> index 2c827e877d29..58e00301e5db 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> @@ -183,6 +183,8 @@ static int intel_i3c_init(struct mipi_i3c_hci_pci *hci)
>
>  	dma_set_mask_and_coherent(&hci->pci->dev, DMA_BIT_MASK(64));
>
> +	hci->pci->d3cold_delay = 0;
> +
>  	hci->private = host;
>  	host->priv = priv;
>
> --
> 2.51.0
>
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
