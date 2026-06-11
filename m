Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98EE9CD98D5
	for <linux-i3c@archiver.kernel.org>; Thu, 11 Jun 2026 16:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QUHG1Sz4rVt6DYCeE6vcOom2CgLbA0CpDMJHySNCcdo=; b=G5BHXLrudriBP3
	bnI/dR3MtYRAJJEuhMxKgSL466qVtclE8Z/6ghMNVSBvZOVu5t78yENHdPLjETZeQOR5g3v8xRip1
	iJne/v1JeoPETmwkcVedjiFas4pdY4iByX2MSvwBI433lQZPO/BxkAYieRlWu86Dk4x/Qt9takoUm
	uXcCTh4RFX+mrIxwz1iuOm+1soF3bdIN7m8qOH1bv4n47msQrfGirvrbFzGnIPJTiwzQMhmTvQWDC
	24J28CQ1oS5ZJBokHqj84lEs30jx9/dFWa2ltH+QPHudGQYkjPi94qXonyXkUrh1QkGMmFNYnlW1n
	ig4+hvl2mpkZL+AtUsgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXiAN-00000009khv-1IwY;
	Thu, 11 Jun 2026 16:22:03 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXiAL-00000009kgh-0I3x
	for linux-i3c@lists.infradead.org;
	Thu, 11 Jun 2026 16:22:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DtQDYloqqPG3UYhyL97CSAZgzmxK1m6+vmivHOsgAXH9GnQi3ecuZmyEuAFO/fnlgyJejrfhwITvSLOaVN+DwB4nB4LXQRW+muJWXzwFfGCdqeTRF/csfct3qiJ1nGbwNAlXuQ2FW7JYtgNh/rPLtJ5NbuoOc8ljJmuuM81iFkfpZMPpojv8ITsAMyIpousZe/ZXikiaNkZnBEN4zt2KAFbPb9MtKQ/toziFLzWMon/lFHRjUMg4OFQ2ghVqOBA98IuWIAvSKSHkma294/x5SFp8+47yFntPX9uSweJ3vYJk6yt68O/aML5PvBK2RnGiT1jlhTFkA12RaY9WkrWs6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jg28mzVgLMv/IJwWmY7aEa/1D3Mzzwcyrfn3WH/1JTc=;
 b=i2Ja/+13cbkDI7Wj69v+QumCJUOwxZ53jcG0CfYIIrlQhbsqnwM4xTpUBpx1TcWLLfvKURNSpfLvNH50v/SKIu1iL8a3/ga4WVc6P7PnJonl7Flnyd/YNY3gJKvFkHeNWSZthiAJAxcXGQ8OHFbuCjD2zdhdEKv8Ky3LzzZw5hQ+6qy0Gj6yUEb4FvTGggmPVr/WL/vMpOb5Y7/sK+bGPMyV/97iioTf7lwsU9M5n5k/IPu/yeyHZof+KBp/mhGHLETyzIxD75lk0K7UUOH00flWYEFC+U86jy0arxQEZkO1gcnghHv6IFh4txLhyvrhK/RMsjT7AIzhXhT0PJNUrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jg28mzVgLMv/IJwWmY7aEa/1D3Mzzwcyrfn3WH/1JTc=;
 b=lMfpwqV3pfk1Gu9xHyH822FlexinQrBs7EDJJuVHhtotFIbTLKiGUrH2VpTK4HRR0oX7sxheR9UrrZzaYpd72Vgg7oRDU1Myrk5BpEis5ic34jZ2+R9owAvl47LyVMwU/k9gXTnaVnFomS5hOTCnOC2TnAlQUjUqgDO7HvDToRd0bxaYAswU9wiUzvd2FJqeonGUrQ8gkwxdNNcyZWI5+uWO9hC6PRi+7YOtu9y7GZF3w3w+DB79O+uwruxEADedgb8dkvBx5tIp3yxbcMRGk3gUq+P+hmH1hamtAZtK1SiLxZ7xkMKnpSKMM72QGJWESOMHmqu6yvJ8tGLkhFDaJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8312.eurprd04.prod.outlook.com (2603:10a6:20b:3f1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 16:21:56 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0092.016; Thu, 11 Jun 2026
 16:21:56 +0000
Date: Thu, 11 Jun 2026 12:21:50 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: tze.yee.ng@altera.com, linux-i3c@lists.infradead.org,
	Frank.Li@kernel.org
Subject: Re: [PATCH] i3c: master: dw-i3c-master: fix OD timing for first
 broadcast
Message-ID: <airgnoB0Uh60mn8T@lizhi-Precision-Tower-5810>
References: <ebddb8b62eae92de0a7eeda93cb18213c677ae96.1781077653.git.tze.yee.ng@altera.com>
 <20260610083656.334CA1F00893@smtp.kernel.org>
Content-Disposition: inline
In-Reply-To: <20260610083656.334CA1F00893@smtp.kernel.org>
X-ClientProxiedBy: PH8PR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:510:2cc::23) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8312:EE_
X-MS-Office365-Filtering-Correlation-Id: d3a8f732-4591-49f6-a214-08dec7d58e68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|23010399003|376014|366016|1800799024|3023799007|6133799003|11063799006|56012099006|4143699003|5023799004|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: EOHlkuco3RCaBPNyCuzeZXhuDivTJ90zsvdYQCOUOuWBmidzOPTju9XZ9bM3MO/2EVhiOsr8FLnAO6zfUNeYF+s+1gpaup2AlMEjo/TU4+aBn0mCiPTGZjXNmo1E9QoCDoGMLlh5hK4Y6yQ7ilXls3h6RHPFIR6Z/Wo1p8m7qDxEWxnKUpNrD8VVe15yk66Vt/gFJK4TISPr3qsLGGZaEEJ79OLuP0gfMxtg/fM2PblrpSkFlJ/InbTq2u4KFGpXK3hxkKrtvfSw2deaPXgRE6VymL7Yu12tagNFpkaL8BW5I2UEpC2lk+w/Tycmil1jiqamDbedMvDaLrO6N4B167g+5M/4TCARV0cMfrMgIniDVx2hVqzBPr97UP5/zeG1NWU5AIt70WCWSzQWMi/OJAHnXS6J4+AG+yf2YaQYwVXpEzDvHsveG7UK5wB10dK2SqCQPyvK/LHwG/E+kbPRGnr6Q/tltFaktc4ug7EOh4pQyQM60V/vah4sHbRY2KNbMxC+wFXP7eF/qw5QzBPnI/BQkGCFRS0ig9wm0Xpqv6rUCaDhRbiJGkxeHczpShypA926oWbWZUNyr8YMqKOf/y2edYnFxgwvPY2DHQsiYRybrZ+ON+n8AnzkcPJnvbZKc6kRSO19Lgtt9Wkxl2bWxw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(376014)(366016)(1800799024)(3023799007)(6133799003)(11063799006)(56012099006)(4143699003)(5023799004)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Bv88Hwybq1C5Ransf5dWVeV2vgdgqm0k4Q1/+X/SWbjg5J2bYQuSVn8Tk5?=
 =?iso-8859-1?Q?/73VqOusEU0mXn2YjQXuLD2tnJEnQaOhM3j3fsYH0cEozZwCnogtTr+xz7?=
 =?iso-8859-1?Q?S2oLHzdGDXEJ7IEWrsiDTylGgk4kyrzk17GtG7cf1qNLDGuMjqGpoY15ZB?=
 =?iso-8859-1?Q?4jBSwFKdWeQsfwbT0PCSFUV+SgIR4zvhBl4PuXfr5KUSFFS3fpkAQatpP4?=
 =?iso-8859-1?Q?pmKCsd2+ztTf84l9rjVhAFE6jO4h9gjVwC7v3aGijjxIJywZCRrcZn9hqy?=
 =?iso-8859-1?Q?NAfaO5mrD1MGZQpG6ELxhF1fMlRV2vjdBtB8ukKpAPGi7Q3ro69Dth0peT?=
 =?iso-8859-1?Q?va27Qo0G08WaJSH9dNNysnOu3JUoXlRA3Km0npZBTpP2vCeRqOB4JBLeAj?=
 =?iso-8859-1?Q?Q3RjlU33nbxheilrxzhqcKE/kccysSToPoxcZ/eZqztv4T9Ur+PMvsB/dv?=
 =?iso-8859-1?Q?nDtWfyDBoEu6YZ3i+d4LHSFv+6/2VU/Q+9k0HGO7JDLP8jRAkwZ1enRiwy?=
 =?iso-8859-1?Q?MSdgY/9jj9qEklmWZDJ78Yq8rC+izcGvlfNYcIJJ0CA/qH5dXGK483sVWI?=
 =?iso-8859-1?Q?4LBTmXTpX287nltxwOU1NVP5WvRPy6XpScpiqmtdMviFx/oN/r004yRv0T?=
 =?iso-8859-1?Q?glzdGEV2oGU4dd62lu0dOMbnZm5zMscpDcKiVDS0WjTPoK4II68VJQN/bC?=
 =?iso-8859-1?Q?78xuj8NtbGw0FjFewbBwzjs9hpVAyIucExGtod6OY3I1hweddUTyvP06xr?=
 =?iso-8859-1?Q?HeRtk2qHkswGhqyQKczMPH4XO7UqM/P/OIANhZYDEQLSC/kWlwWfAuXY53?=
 =?iso-8859-1?Q?w/IA+0nsMA94JXLIiiaGbO6JvExehPl+qLrzZyeGV8nkJNjT4jqWnj3Ur3?=
 =?iso-8859-1?Q?cg+lHO4lYUU0xQ2hG1oNirdeD/1XXcVc4FXmDGJEC1rpyCl+ZnjuxHRvrZ?=
 =?iso-8859-1?Q?xxKV+nRK+SbY21vug7X1PH0l6F+NXHFjsgB4E70FfVIeEiS/q6KHFz7qvb?=
 =?iso-8859-1?Q?9VcT1c3FAwfswlLT1C+sSQ9O4P+GEpTWXez5fr6CUUxR3UOSv2UEFqR4sv?=
 =?iso-8859-1?Q?zxoF7f/w0Fy3RSqMQrSEaRtUClvGdNYu6jdvcpT68HyqohEsyAE7YPMZNI?=
 =?iso-8859-1?Q?0JBiBWyIHYeBgJX7s4kvcXZvc8Kew9KFrl5nKxKf52pemo/zQ+QFgUnO2U?=
 =?iso-8859-1?Q?DZQr03f1nF5VuDcOYHZq/xQ3ieXZ+WTDeOprOYZD/CLoY8of1UjUdFdlWK?=
 =?iso-8859-1?Q?QAcYg6+5y9M/mmZk7hVHaLW2+zAFJwrbqS5cgSbDxRK3FMohM7ul/wrO3L?=
 =?iso-8859-1?Q?F/mmYwblEWjdGwjzaVS9/2jY53QZ4TAK9BM7jLdqr83uQTsyaMx1ZuGGbg?=
 =?iso-8859-1?Q?s/hOPG2Pvj+q7J8OkLurps61c7thKm9VAv7dQKVkIMo6HxuRG7bDXW1Rf6?=
 =?iso-8859-1?Q?hmVaM7cxL5bGm0buaPQmJL5md+uQLcNRzlrmcQYHC1jG6N2DFKiI2Ze+EW?=
 =?iso-8859-1?Q?7rqEdshl7z6srW0EIRWWS71mq5bc0USlTew+6yrQsTYjpyat6pg/9M+l6g?=
 =?iso-8859-1?Q?cjS1/ty1xafi+0s7DngsAAo+WgWo/nPhStc1rg1pdJnf51dNEK4dQ7LQgL?=
 =?iso-8859-1?Q?ODtJd4AEYiKh/gmTPakO1ATOugzkEDIxlSNZNxWcaSQ7oduRSj2m/HMute?=
 =?iso-8859-1?Q?tJk9xHr5xIFTJFnZDK2OcoRyYbiTCOtMf1uBSFbLe0pfEl5RLbnIchTd02?=
 =?iso-8859-1?Q?d4sfk983Bx4Znydopf22e/a748F/2cclJZDIACYgYLG0RqO7EXNY65ACg/?=
 =?iso-8859-1?Q?S+97zYkIJtYHMMDFWuqwlgm8psi77hZ/ZE2kWm6aD/dsjpcRADGs?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3a8f732-4591-49f6-a214-08dec7d58e68
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 16:21:56.6077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nPN+PmuNKn6FUI5DX/0miWwzt4OT4qBiDDZxgMGFf7EYOCo3c5K+iPOK5u3CDZdIaM3wjwm8qs8tmPbRR1gQDtPSyaklpbKdtRNNFXA8GmdqkMH4+RkDGR+PB7dpRd3a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8312
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_092201_277084_A73D21DC 
X-CRM114-Status: GOOD (  34.72  )
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

On Wed, Jun 10, 2026 at 08:36:55AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issu=
e(s) to consider:
>
> New issues:
> - [High] The newly introduced `dw_i3c_master_set_speed()` permanently ove=
rwrites hardware-specific AMD timings with generic timings.
> - [High] The `od_hcnt` calculation for `I3C_OPEN_DRAIN_SLOW_SPEED` violat=
es the `tHIGH_INIT` minimum requirement.
>
> Pre-existing issues:
> - [High] The IRQ handler accesses hardware registers without Runtime PM p=
rotection.
> - [High] Use-After-Free and invalid `queue_work()` due to improper teardo=
wn ordering in `dw_i3c_common_remove()`.
> - [High] `dw_i3c_master_set_dev_nack_retry` modifies hardware registers w=
ithout resuming the device via Runtime PM.
> --
>
> commit bd5322e3d6d6cd3a6a8155f24cc89a12fe61be00
> Author: Tze Yee Ng <tze.yee.ng@altera.com>
>
> i3c: master: dw-i3c-master: fix OD timing for first broadcast
>
> This commit implements the set_speed() callback to switch open-drain timi=
ng
> for the first broadcast address to slow speed. It aims to fix I2C devices
> with spike filters not being detected on mixed buses by dynamically
> switching between slow and normal open drain speeds.
>
> > diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw=
-i3c-master.c
> > index a7593d6efac5a..6cf7071d3d06b 100644
> > --- a/drivers/i3c/master/dw-i3c-master.c
> > +++ b/drivers/i3c/master/dw-i3c-master.c
> [ ... ]
> > @@ -1484,6 +1485,57 @@ static irqreturn_t dw_i3c_master_irq_handler(int=
 irq, void *dev_id)
> >  	return IRQ_HANDLED;
> >  }
>
> [Severity: High]
> This is a pre-existing issue, but does the IRQ handler access hardware
> registers without Runtime PM protection?
>
> The interrupt handler directly reads hardware registers before checking t=
he
> device's PM active state:
>
> drivers/i3c/master/dw-i3c-master.c:dw_i3c_master_irq_handler() {
>     ...
>     status =3D readl(master->regs + INTR_STATUS);
>     ...
> }
>
> Since the driver does not synchronize IRQs in its runtime_suspend callbac=
k,
> if an interrupt arrives right as the device enters runtime suspend (or if=
 a
> spurious interrupt occurs), will this raw register read access powered-do=
wn
> hardware and cause a synchronous external abort?
>
> > +static int dw_i3c_master_set_speed(struct i3c_master_controller *m,
> > +				   enum i3c_open_drain_speed speed)
> > +{
> [ ... ]
> > +	switch (speed) {
> > +	case I3C_OPEN_DRAIN_SLOW_SPEED:
> [ ... ]
> > +		core_period =3D DIV_ROUND_UP(1000000000, core_rate);
> > +		lcnt =3D SCL_I3C_TIMING_LCNT(master->i3c_od_timing_normal);
> > +		od_hcnt =3D max_t(u8, SCL_I3C_TIMING_CNT_MIN,
> > +				DIV_ROUND_UP(I3C_BUS_THIGH_INIT_OD_MIN_NS,
> > +					     core_period) - 1);
>
> [Severity: High]
> Does this precision loss guarantee the resulting pulse is shorter than the
> specification minimum for certain clock frequencies?
>
> If core_period is calculated by rounding up 1000000000 / core_rate, using
> this overestimated integer in the division
> DIV_ROUND_UP(I3C_BUS_THIGH_INIT_OD_MIN_NS, core_period) - 1 underestimates
> the necessary cycle count.
>
> For example, at a 133.3 MHz core rate, the exact period is 7.5 ns but
> core_period evaluates to 8 ns. The calculated cycle count evaluates to 25
> cycles, which produces a 187.5 ns pulse.
>
> Does this violate the strict 200 ns minimum for tHIGH_INIT required by the
> I3C specification?

Is it true?

>
> > +		scl_timing =3D SCL_I3C_TIMING_HCNT(od_hcnt) |
> > +			     SCL_I3C_TIMING_LCNT(lcnt);
> > +		writel(scl_timing, master->regs + SCL_I3C_OD_TIMING);
> > +		master->i3c_od_timing =3D scl_timing;
> > +		break;
> > +
> > +	case I3C_OPEN_DRAIN_NORMAL_SPEED:
> > +		writel(master->i3c_od_timing_normal,
> > +		       master->regs + SCL_I3C_OD_TIMING);
>
> [Severity: High]
> Does unconditionally restoring master->i3c_od_timing_normal here permanen=
tly
> overwrite hardware-specific AMD timings with generic timings?
>
> If amd_configure_od_pp_quirk() is not updated to modify
> master->i3c_od_timing_normal, restoring it after a broadcast destroys the
> required AMD-specific quirk timings.
>
> Additionally, does dw_i3c_master_send_ccc_cmd() unconditionally overwrite
> the OD timing with AMD normal timing right before sending a broadcast CCC,
> bypassing the I3C_OPEN_DRAIN_SLOW_SPEED state expected by the I3C core?
>
> > +		master->i3c_od_timing =3D master->i3c_od_timing_normal;
> > +		break;

Please check this also?

Frank

> [ ... ]
> > +static int dw_i3c_master_set_dev_nack_retry(struct i3c_master_controll=
er *m,
> > +					    unsigned long dev_nack_retry_cnt)
> > +{
> [ ... ]
> > +	for (i =3D 0; i < master->maxdevs; i++) {
> > +		/* Skip free/empty slots */
> > +		if (master->free_pos & BIT(i))
> > +			continue;
> > +
> > +		reg =3D readl(master->regs +
> > +				DEV_ADDR_TABLE_LOC(master->datstartaddr, i));
>
> [Severity: High]
> This is a pre-existing issue, but does this function modify hardware
> registers without resuming the device via Runtime PM?
>
> The sysfs attribute dev_nack_retry_count directly invokes
> master->ops->set_dev_nack_retry(). Since sysfs callbacks can be triggered
> from userspace at any time, executing this while the device is runtime
> suspended will access powered-down hardware.
>
> On ARM SoCs, can this trigger a kernel panic (external abort) and allow
> userspace to trivially crash the system?
>
> [ ... ]
>
> [Severity: High]
> This is a pre-existing issue, but is there a use-after-free or invalid
> queue_work() due to improper teardown ordering in dw_i3c_common_remove()?
>
> dw_i3c_common_remove() calls cancel_work_sync(&master->hj_work) before the
> hardware interrupt is disabled and freed by devres:
>
> drivers/i3c/master/dw-i3c-master.c:dw_i3c_common_remove() {
>     ...
>     cancel_work_sync(&master->hj_work);
>     i3c_master_unregister(&master->base);
>     ...
> }
>
> Because the IRQ remains active throughout the function and during early
> devres teardown, can an incoming Hot Join interrupt trigger the IRQ handl=
er,
> which will call queue_work() to re-queue hj_work?
>
> Does this either cause queue_work() to execute on a destroyed workqueue or
> result in a use-after-free when the workqueue subsequently processes the
> work using the master object that has already been freed by devres?
>
> --
> Sashiko AI review =B7 https://sashiko.dev/#/patchset/ebddb8b62eae92de0a7e=
eda93cb18213c677ae96.1781077653.git.tze.yee.ng@altera.com?part=3D1
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
