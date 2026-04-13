Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 564DFE937E0
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Apr 2026 01:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jQbVvsKS1rdp4turMa5K0mC4f7c3SDQze5zVYUokurA=; b=XI1Y59TnfxF6tJ
	YWEXm8G/iCZrEioetUK2Zj7OmlzK2LLzI1xYJTwJX2YSCxApUYUNjqZidCu5y99AVIEoQaIQO23oD
	H4iEdZxmngrZ0n/OxANnN3rleTe9Y5YQizJ8TCA3TOa48o5z0XkVdfDMIAkw2LTxC+5uyKz34d38T
	YjvpFLud3KKLv0/hh9A3VUBEfk22CXGDNFV11HfqQHVBKFqKfelR35wHS5qvxtBcnxUYPfmjApUUT
	p8Ab141YjmxqNo7l7bkFxVxA/HH2imB0RUX3ejsE1cLUMDAQ9QHae9LxS0NqYwltZEQ5eCV8GY2Wz
	4S7rksYEVUErTtGUvvpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC5ua-0000000EpqB-34Th;
	Mon, 13 Apr 2026 01:16:24 +0000
Received: from mail-westeuropeazon11011028.outbound.protection.outlook.com ([52.101.70.28] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC5uY-0000000Eppp-2jum
	for linux-i3c@lists.infradead.org;
	Mon, 13 Apr 2026 01:16:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=id0Tou4oE63l8GXFljYXL8DIB8qoBVITgqn0Aj+A4EPA6CDApTWOqwIuT9jEEYngvXMRrTW8RxBDlOahYrpRWQFj18mojcWfuhlkTVyY0SAwJ1spaX6opaU5dAlZXJ96uqM4JJVyNfNw6w7dMy1IC6wmRPDZ63C5wy06mkqMEj/vMH/1WcX8aDFbBSGQ6uBlTbUFib/CVHzpRL28i8rOzeCkSEMShG75EMa2ktOqB74rfGcg5PqtUrkUh2rFCMIbACUAJHMOruYTot5hGGdbOfNW1P92B/CmRV+6Jy3X/yakIMLPjKshCY7Cq0nKWeDJVYuNHyXCUG11drLjJgST3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M11vXV1kpjYP6413dsdlrqaB9ipXmKna0M/ZVXIqIT8=;
 b=aUbvS1SzEij0ReJgV8267FQyhB7jkUMhGRc+81QDX4vAAjKvMADjGWWQK61ihLE4tt6lfoBzyGXzLBdAjT2L9PV1zCumGEwHsmpP4BdIgRgnEMFlHMgqwSfruPkhNay6p9GoZcoweNsYiDJQymIA38Sy/iFCzOZb+PIrxF1p///yi//1bFR7H8yKMmBer0ugWtWvCCAa9shx/ZPjhJWRjFUzIHA/OifCZoUGhBfZZRkKM+C0tRizDlcwm98DdEnQ32jvD8wiv1hyDcfW+weNDVLkNQxsm24FxCs7Zld37XWegrSSK7LdolfAP5ZTOwuGCL/stf5v7+iEhiwQ80gWJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M11vXV1kpjYP6413dsdlrqaB9ipXmKna0M/ZVXIqIT8=;
 b=NIHYSAxVilu2frKhlSq2kpndeb7DoP171A3SzBmmMYqRba/fqZK+PuYhbAo5ns8sed+CONWeaWRtVZLy92H+WJoMcTFtXd1yNHI9ZdTqc11grLvxuRZht2TOkxfk/qa2iKyUbRSNyroOu3eeoJcUszNm5/z7pkXxLPNzyfe7zXjNcfrnfdSxhqCEICMtgWarsdeKbPmV0uhQ6lxc3BuUAYnUXLSLGy5VdyvWAsCuGHtFAEzlBFlqMQlYJsBMfI4lhHtJRkb8RKVNShd05qiG4kTDZdBrtF/GdEv/L+Z2r9+cepWemUQTv/myi7wujmheZzTI2vXvbI9qdaHAN61TGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV1PR04MB10703.eurprd04.prod.outlook.com (2603:10a6:150:202::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 01:16:14 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 01:16:13 +0000
Date: Sun, 12 Apr 2026 21:16:07 -0400
From: Frank Li <Frank.li@nxp.com>
To: Stanley Chu <stanley.chuys@gmail.com>
Cc: miquel.raynal@bootlin.com, alexandre.belloni@bootlin.com,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	tomer.maimon@nuvoton.com, kwliu@nuvoton.com, yschu@nuvoton.com
Subject: Re: [PATCH v1 1/2] i3c: master: svc: Fix missed IBI after false
 SLVSTART on NPCM845
Message-ID: <adxD10wsP7hJdR9y@lizhi-Precision-Tower-5810>
References: <20260413005040.1211107-1-yschu@nuvoton.com>
 <20260413005040.1211107-2-yschu@nuvoton.com>
Content-Disposition: inline
In-Reply-To: <20260413005040.1211107-2-yschu@nuvoton.com>
X-ClientProxiedBy: SA9PR13CA0132.namprd13.prod.outlook.com
 (2603:10b6:806:27::17) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV1PR04MB10703:EE_
X-MS-Office365-Filtering-Correlation-Id: abc9f90d-a415-4660-be3c-08de98fa4137
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|19092799006|1800799024|366016|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: olO0zgWnVwb9nnz8z1atL/Jrrw+gDFj/tmIUe15B2uPWRYXC1fcyh3QqcUREIuXIB2nOznDEzfF5oCOzgkRwbynRKrX9qFuf/Nl/olmH2jFaiCwMJE2UCP8a7hxqYYOQO/9g7onhLPv2R3bv1X4vr+bdiaGt5qjhXmFH+Te0iUAG/BrvBRSdwDEWEkL32NzYp5LAEnvRsnBFhHgzRS68LWZfz3mickW+xtb82j8M7YkSwjRM8r1fhw3OMibU8vFEcYi8pEaOMEIlnjumCkqI3Hvsa56yPwmMLcQUSi9D0QE2ygGpYIcxjf3hv0Zg3pLsDt4WqKiI2rNzq1VUi0zx1lYV7GxO7guQJ8u3WHD94gagYJipfvxjt3q15ELdKqi1rnA12r89CzyNHpOPZXdZWVwKuzLp97wIUVisnt5TfCziU4u+fgDQzCJXNgFfjFFv0YYAKmGc9Suvbl9uT4KtOi4Zwoe8QqDX6WNBL/agCVhJzHDF98nopJA7wb0p3nfbDGdJf30sUdNb8HkeHcCyOGcbDH5x4bLDO14Ce5B6MnjnjVYnjW3dtMRXpxgoqr6eHPQb1m57PT9brrDUT+qcjOkDTwTLtUx5AqM1AZNAD1FJ+62AuIXPA/k7MZtQjqPrHSyla0g95jP3Ree+ClxfVpSGrVuNNi7/m5TUvspv1JBi+ibNtnCJadQJnd/aktbcO5k9k7eqR+37tVCwJH4X1FUozJOQNp8qIefLnyMuKn2PSoRY5aDUlLfNdFO7D9YEF0eUSzVix2LM0pz99gWW+gW5jk596qjzaubDRLU+qF0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(19092799006)(1800799024)(366016)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xnpcA0J5ETLC4baBChOpO91cIsl1DpBsNMfUjoBwwYE0Pl9SjZ6RYbL5lt5e?=
 =?us-ascii?Q?l22vPegSCbqsmawsdWGRsazba+r3C0QY3iZBlcZw4FetYdjDsaQL9+9ZjawH?=
 =?us-ascii?Q?LGrNcAqx8orJcp37EG9roVdWwF2fYI/tUqVfdnJ+GrwU7kKO1a8LU3UKINyA?=
 =?us-ascii?Q?tuxUAHLTfME5PFVgresCU3675/cIv5rULbMREn0n/tIKbQkbbiMGb80gmJVz?=
 =?us-ascii?Q?QYcGIoBTFYe9h7ZudW63/QdPPCchQMjEkFXoDFzZQ3IePY7+kujiKCSeXBF7?=
 =?us-ascii?Q?YocLftQFAy0ksVBMlzabXAHVjSI6z3g4Dv+AblxOE3HXhcRCirSgdOwPRdhn?=
 =?us-ascii?Q?Ro+7w2M+sOuNhvlq+ubL8P0fbNnKcX4oSfmpce/MpwCFKBm6MI2sovm6Q3h6?=
 =?us-ascii?Q?YUx0g0CJxodZvE81L9Lg8bhH6NtbhnMpnn2sPoGVGfFnVAn35bIxjZ9FJ4oG?=
 =?us-ascii?Q?6+KQWneBsYbw+WbzciH3G4mRbkK738d0M4TdMlP6Uh/dGyJGerRuibgYUy6R?=
 =?us-ascii?Q?0UdN8o8MwO4/r8ZffFMVHmM5ZO74HnIddcjXoEZAWh7W6/930GtV7FVT3oRE?=
 =?us-ascii?Q?gHFASnGk1EGdYfHlOhr3Ie4HpTxfWjWn+vYdjArY8t/hanoCDciaNbiQXLJx?=
 =?us-ascii?Q?bBOP9jdxjQUBufrBXl/7VYIbmCjmRT741TJzq+LXz5zTxCmpkh1yDb3yzOSz?=
 =?us-ascii?Q?iNXP1weu6jmox4RHRIkFhCcuTFvPmt4zxD1gmH+aP9icE9OAvuClZ+ugFkkM?=
 =?us-ascii?Q?y3NdL4tBMGMs8Q4A1n/S0ZRSOyOBOkdcNErEnn68T5SjHv/y+leK4oIocWOW?=
 =?us-ascii?Q?pfiSQzLbXxx9keQohL6yVHiF3rnqZEeTQwvM6xbZ6MVefgshfOlO6tp2vVmw?=
 =?us-ascii?Q?npbsmanPyG8PiKoVaMP1Cj6jTfSXTOLD2oYSBZMc2Hw+VzQqx/Ri8kRBNLL8?=
 =?us-ascii?Q?O4M/dev+qeYIs+/Ga1iyF7LLa+LDGTRpBeRRfQFWcKV/s/pcAo9b24DkA1HB?=
 =?us-ascii?Q?9iIDsfUl5LEghHvDFfEgYv0nPdpKJ8eV3fdw/ThgUFFSBsI34/9uUjvJo1Z7?=
 =?us-ascii?Q?diFk/7TvwhksCX4ZexBE80Mz8CinNpMmr04pTkY4/51UrbK0hM4bKunPc089?=
 =?us-ascii?Q?C7ttak7ResbqoVwtfsjHLYzpaiPLrjvqlEBxChXWXN68jTQf8M6VAonjHoWT?=
 =?us-ascii?Q?MJn9pZaM5PGgOlru3snnJSW+BugAxOSv1lhb7JMA1h7kHyyE1J9/04n6FGk7?=
 =?us-ascii?Q?fL7XX8fvuw9p8upsuHXkb3p1q26VBMSo20jcv2PxgaiTr2dXLlrZ0WbjgQjp?=
 =?us-ascii?Q?HvBs93O/FL8uvrsANkNDVvYwOBOq7S5ItGt8aCPZgjZuTqM1WgD3mEHXo2V1?=
 =?us-ascii?Q?fer+0po6MeIm3y8RU1gwU0CXSKHyWrtLDFUITtqPpFtCzj121Nai1ScWelld?=
 =?us-ascii?Q?f6oBa5yuiLffbg6C0j3cfLTwTAi9lkj29oKTreuNFpz4sJDH9MXZ72yuDJVo?=
 =?us-ascii?Q?/rJGfNGK5jWkRuRx7lDY0leQBeypo7fbnGFg2MIZw3LvhxXbZFMYQTqc0H/R?=
 =?us-ascii?Q?NyuoyqRkEatx0qbct3RTQ8KehB1hMgV3ij9u2f/sDqXYNtfEjOWnt5smnVWW?=
 =?us-ascii?Q?YmEYK1X9bQcavyZZ4caClULTOMNzDlD8TOCFDYM5iMMFHNQXzbaQUNS4ABIT?=
 =?us-ascii?Q?Zi8oq2nDRsTxt1iG1sDiEaXPczAmjodFYoJpYfausRBsOSzy?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abc9f90d-a415-4660-be3c-08de98fa4137
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 01:16:13.8757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GN6pyehXjwAP+O2t/79t7WLTpPfp4jYB7cnxdW/8slf5XsJutRhkFWj7VW3zvWHwZtIuHftSnLwHtucYZPIkYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10703
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_181622_730043_E2EE369A 
X-CRM114-Status: GOOD (  22.26  )
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

On Mon, Apr 13, 2026 at 08:50:39AM +0800, Stanley Chu wrote:
> From: Stanley Chu <yschu@nuvoton.com>
>
> The NPCM845 I3C controller may raise a false SLVSTART interrupt. The
> handler first latches MSTATUS and then clears SLVSTART. If a real IBI
> request arrives after the handler latches MSTATUS but before it clears
> the SLVSTART interrupt status,

How this happen? If irq handler running, hardware (real IBI) will trigger
irq line before it.

Do you enable other type irq?

Frank

> HW sets the SLVREQ state. However, the
> handler still relies on the stale MSTATUS snapshot, returns early, and
> misses the real IBI. No further interrupt is generated for this pending
> IBI.
>
> Re-read MSTATUS to obtain the latest state and avoid missing a real IBI
> due to this race condition.
>
> Fixes: 4dd12e944f07 ("i3c: master: svc: Fix npcm845 invalid slvstart event")
> Signed-off-by: Stanley Chu <yschu@nuvoton.com>
> ---
>  drivers/i3c/master/svc-i3c-master.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
> index b84b324e4111..7d88e8fe3742 100644
> --- a/drivers/i3c/master/svc-i3c-master.c
> +++ b/drivers/i3c/master/svc-i3c-master.c
> @@ -672,10 +672,18 @@ static irqreturn_t svc_i3c_master_irq_handler(int irq, void *dev_id)
>  	/* Clear the interrupt status */
>  	writel(SVC_I3C_MINT_SLVSTART, master->regs + SVC_I3C_MSTATUS);
>
> -	/* Ignore the false event */
> -	if (svc_has_quirk(master, SVC_I3C_QUIRK_FALSE_SLVSTART) &&
> -	    !SVC_I3C_MSTATUS_STATE_SLVREQ(active))
> -		return IRQ_HANDLED;
> +	if (svc_has_quirk(master, SVC_I3C_QUIRK_FALSE_SLVSTART)) {
> +		/*
> +		 * Re-read MSTATUS to obtain the latest state and avoid
> +		 * missing an IBI that arrives after MSTATUS is latched
> +		 * but before SLVSTART is cleared.
> +		 */
> +		active = readl(master->regs + SVC_I3C_MSTATUS);
> +
> +		/* Ignore the false event */
> +		if (!SVC_I3C_MSTATUS_STATE_SLVREQ(active))
> +			return IRQ_HANDLED;
> +	}
>
>  	/*
>  	 * The SDA line remains low until the request is processed.
> --
> 2.34.1
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
