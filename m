Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A89EC4452B
	for <linux-i3c@archiver.kernel.org>; Tue, 21 Jul 2026 16:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l+zlfqzrxPcyIWgW8XntzLtx/JxVLxYWgzjDutzOW+w=; b=Ko2+B/nlXYeD7D
	VqYMLgvSAc4OEu3XECFWve8j+FZ6FJ7Z22sJXht9hLH5zenIG+C+Haw1L/l/4acEq6EMInjlJgU9u
	MeR1abIS54e4Ab4SL+rHyn3sFK6rtSy0gQXajv9asLLjSMcaVACM3BqJ70V9linWLQxfzlfJYdvrk
	hWJq781SG3IhLjEjZNZhm60HGgqUhHurLwb6HXikcJ7ce+nf2O3scA9CgSqcNAWeBqw3y9Lh69JPs
	ZVJIh3GrLnDELeldR4xjW8BUo3QE2NUNaxCWF4ierC0xTs/Dl0QRQg9gREwkz3M0LlQx7QEFe+XH+
	4FggZDxN2aP8od/I1k3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmDnj-00000009zZd-2dhm;
	Tue, 21 Jul 2026 16:58:39 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmDnh-00000009zZ1-4A37
	for linux-i3c@lists.infradead.org;
	Tue, 21 Jul 2026 16:58:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YRK4+pEhu0y2ursTNpMTyns9DrL6Rlfr9Y1g28RghnX5jx1xI0PQukXcOkC6m91tBcwV/LzPPa5/7USPn3CfjdCc9sQVvnlPqs0Sp/DBxcoh1op8A8fkIxjqHJChQzHuXWy8nLQ2vH567KDKNT8MwEx/5dY/UwHjdF6cL0ch7FoX3Wqi2TuhhOiFSaAL2lsPRIZ5/pkptxTcsDUBu8At5d34cql3p9IvQD1gnaCIDV3eDiioBYqhdB6VHxxyomNEg4xTYkOnoEcPac4f3ceS7trccwbhLJEKQMbcH8bZ9ZkfGQVe3dIB9yjbLCcOS6QpyPPT2F6r/Cb3X/abAXHuyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qYKq+veDhBBNXsv47hFw4oHUFrFv4ezcrOScxxxaRH4=;
 b=ddt57PLcyYQHFXWO/xZfHVclzzIgmNgMuxK9UwQxh9L+mfYOZyZq900JH6ZQTL5N9w64omdUpRN7OevJ64iqR27ipdy9uBSomnVUX9xhiygLQlbRu5KyO3Gnn+xXpfrzpN7t22RvLRsVfTHUFvxkOuT8k8FrolnP3DG73VrZydDSgd5+B3RxSxB83GTqbujDqb74kBW03TwRaUc+5LatFm48DT736f+fVI4Z4wURbxpr2MTna0rBBO7duON8FYm6J9nd9z83ckFyrlJI5KlM+/9xi3P0m5KMq05WkT6E1m92MqTa2SiR9670QbGF9TNdlZ8gtUGWJxih3oSM6029wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qYKq+veDhBBNXsv47hFw4oHUFrFv4ezcrOScxxxaRH4=;
 b=RjV1XAOrnOrAq6HZQlftW7LmZ6YD2wx1T3FA5M75dpAH32NgXek1S0c9WE4FqHZJ7HVbzLIl52qLLddXaRCDucloECSDbzfpdLQiDsxwLqx/edbBTLanlMqe2mrob3drJ0SOV0/8PTOQjg7cys/xElbNroNsR7bbJrGd0jtPQp0Bwk3ijGJ4LYmloYHzXZDyrzGMTjcYhZAwqWVLk8cZPbYsf1ifNixMrLBfwTRXDLQqB3emKfnXEGLNq0F0qbkP7lo9+vNjvlM70ncntPFXPlDjVu0+uzAXfQUGD7IHuArXgqG0KiLw1JXWuVeSSKwd5UVqIe1VncDKtR2Cen9zFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV4PR04MB11379.eurprd04.prod.outlook.com (2603:10a6:150:29b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 16:58:33 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 16:58:33 +0000
Date: Tue, 21 Jul 2026 12:58:27 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: tze.yee.ng@altera.com, linux-i3c@lists.infradead.org,
	Frank.Li@kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v2] i3c: master: dw-i3c-master: fix OD timing for first
 broadcast
Message-ID: <al-lM4FdoekyTk4r@lizhi-Precision-Tower-5810>
References: <20260721033159.11789-1-tze.yee.ng@altera.com>
 <20260721034751.35EE41F000E9@smtp.kernel.org>
Content-Disposition: inline
In-Reply-To: <20260721034751.35EE41F000E9@smtp.kernel.org>
X-ClientProxiedBy: SA9PR13CA0146.namprd13.prod.outlook.com
 (2603:10b6:806:27::31) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV4PR04MB11379:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c4aec62-7553-4cc0-78e0-08dee7494c53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|19092799006|376014|1800799024|366016|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: +rs9BaLLAXvEGb2evOiZTjw5ErJ1IJ8jGCU6S8sKEaus6i1UIpojOfnzmgEQwD0gLFFIurCWxFpDvIO23fokX/F090gDGLzR7+PiqvCTeQ5vY52T21u+aG9QPaIuEvAR6PF6gqOoKojj6Gu43OJFln6gTrFG3XFLpbrXEwToPRQ0Bh5hfKmfPDirEF+8hDQMOkJ9noF2Z7jF0YBZe7RbEwGmLnpMBhnmuUOTLggxycBaBm7civBu/wv+hPQZF3kvB+QJ+S2vWp6TOSIKfWjv02wzi2h8WAZwSKHibyOlVHBdBH7nyul0GWFvacCKicAuQFRr8h39y9FlEqew7kdIIgOQfnclRnCPHHhSMkRQ1pAbRUGUsqeuNtuNhk0UA5X01JNtQUpAWEtfrNUc85kGtLgS3WfunNtnCwIznUiI8ZTZkAVLIH8fLF4e6kCB3CSRUV88d5EcmQo8J3HEA+jmL/EnxVQGVpX+zhzacvkLRv3SnMOWd+42ic6bJ8FyFYXhPhTzgpUIdb0I2VXDWmJSMBMICnNTk7PRbEGETHZX5bK/PCKzwiBUHW97xbHbsQAx2MyLxcUmoxEFoFSvc4fac3bICWa9UR7j+oA9s0RxWBk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(376014)(1800799024)(366016)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Btx5Qx0V+vxd+qoAfD1twdC/1XTpjAO+nJnEoLaS5RrthAqjYaYAdhu2RG?=
 =?iso-8859-1?Q?3xP/w5zgVy55kOEVPq8XNjCkC5Bh647RoiKoTjtpal2AzmA/vTMw1FLyZh?=
 =?iso-8859-1?Q?+qGpbxvKF9xqqBXEL2Bv4laLaU7lTITB5qaWa/ABjHkhCC5WRZRJBlQy5H?=
 =?iso-8859-1?Q?nabIVbNPwvBDrwhYnE1JadDh9IOF3gcq9xolrWm1dR1CBbI23m5I6XhGnD?=
 =?iso-8859-1?Q?roEmJU4OlDvC+XlY4LkbiOouApZYDvtIkkgjBb1DmrBeGi3kNvfCi3da7/?=
 =?iso-8859-1?Q?Qx0huaYEY3Np0e2/C4DxlxMsiVgVYfwhdUAybYYA38yWannXn1hkrNE0pB?=
 =?iso-8859-1?Q?+a/MXeVXhGSAyLOWN0s6omd6dSqbDZ/LVgAm+DFlEiGQ8SSN/6FHkYrMhN?=
 =?iso-8859-1?Q?qxeuC4bnxkiVZQg4BPSGUxN8C0YoHw/sPY7LmH1Rm6rTrHRNoX/1onNZgG?=
 =?iso-8859-1?Q?ekezQ1e7D5PUTfgSZQ6Wlr7YHDY0rOvEXtrKHAcv/OUxBdFK2ni2k2Z3Va?=
 =?iso-8859-1?Q?n5YyqvSc14fL51lbNbRIkxqZjWgFtCMS0IFiGqz4VVwMr5SzV+veaxrkau?=
 =?iso-8859-1?Q?NZ/lhUQl59az8dyC/+Ljw+n40dQ0RVb7YqxLP+278deMwrJODMa4C+9q9S?=
 =?iso-8859-1?Q?ojXtdZ09GE0zLqI74UdexJoQTxIq72DkPQobdghLokwqySaU0Ij079LgvF?=
 =?iso-8859-1?Q?S4uzYAYBPRhSryRQ3J8fFEqbNDqsBPbZSUkSj+LEENF99u1dJ35a09PwGe?=
 =?iso-8859-1?Q?H6AZNw2Gqpzo7jQK2dGbstAX2wNIMsePgLCgLFh31JTk02fW0/OJe0c6Kq?=
 =?iso-8859-1?Q?2KbeH+hIswfSSc/mnpldS+Jcclk0APMBpQKcpozihHid2ofk+donEz/YrZ?=
 =?iso-8859-1?Q?7xb5co0hDJNDLoQx7l3YwFu/fQsrzZtTNQZDe3eid/VKyEv6DsfxGQ5mBc?=
 =?iso-8859-1?Q?1ES6pBD5bvSt/qOJTgKDAyhQJStHiNL1iR8PfVzVA979edCHvU15LQKnr6?=
 =?iso-8859-1?Q?M//f7eji8uPPg+VnbE+zjCTil6SFP4SOaWjl910nJJJ40jdLuDtB9821RU?=
 =?iso-8859-1?Q?leCI2SKZw0L7SFH4XxHs+2aUTt8INY0qpYT6TeIrgs+4uFnV2ULsZbkwom?=
 =?iso-8859-1?Q?SpKO5QbMJ8+pt8+jksSbKv7rX+3SmjcXVsUF3O1ZRGd4tSdd6g8tnUQJMA?=
 =?iso-8859-1?Q?2R/NCJM/12h2o9PDjH3DuRJcJKL/OmkEYnVEluDaRhBaUZNsLtF5KehUNB?=
 =?iso-8859-1?Q?HmYcrQgx2zZGCgemkNeGfSvlt9wR6KAvKb5ia5t12pMa32DOjJYT0sK1hx?=
 =?iso-8859-1?Q?It3qAyIc689CvoLWPyV+Jh3dLr/wohEFWoEHh4098BTIk1YCS2atA4DFKP?=
 =?iso-8859-1?Q?Fh1yQGj97sIoPNqybCQuR6U9szbCoGfBfhAbH/WSbTkBZMET8tYtsAYl5G?=
 =?iso-8859-1?Q?+75GiF4Ek4RHaxFHbgBTaJkXzsKbCW5xvsoQ7jU2aJerOf9Z2heYV2lQqs?=
 =?iso-8859-1?Q?KAoVgnUsT8n8bKk1B49iJ38hrgR3DwcsIQjii4tePagGS7NkPNxEkSeJ3c?=
 =?iso-8859-1?Q?dwdXZ8CLdRwGBMakcbnLoZRacwAF46tTZ9ftNZWqo3h0G7zT5yt96O1pNx?=
 =?iso-8859-1?Q?UqGuRNS1JUY057lOZL9PvW7TARnNuc2cR91CB2zVcOfZxtoMZYrEvd1OTO?=
 =?iso-8859-1?Q?s0CEcvgo3uuUTNiV1bYGD8Hk+dlxWpOxIBxKY22NkG4a/yeqB3wq6rZ/Vu?=
 =?iso-8859-1?Q?ZniKQAALT4RseDp3rzsib2ZHiVaS43g4HnvsYLoojRJLyofVp9BWuCwBeo?=
 =?iso-8859-1?Q?wbJMNtCZS3cA8SwMxI2Nu+W5dfXiDvCxfMvL1IwVLmEc5m0L2Od6?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c4aec62-7553-4cc0-78e0-08dee7494c53
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 16:58:33.4937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uUCzGO/WPZMMXQrt7mpMsioAEqMpSwT/CHWZQ1depkGSMvlQTExcVAABZYvMxeJgtpPHiU8id+jYhUUH2mehdPVKbOkUPgGJcucd0aeHIXauTukotq6t9/pi1dNuiDAT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11379
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_095838_035611_7C96ACC1 
X-CRM114-Status: GOOD (  23.20  )
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

On Tue, Jul 21, 2026 at 03:47:50AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Medium] The calculation for `od_hcnt` can silently overflow its 8-bit =
capacity if the core clock rate exceeds ~1.28 GHz, resulting in an inapprop=
riately fast open-drain speed.
> - [Low] Using DIV_ROUND_UP() with a 64-bit numerator or divisor causes a =
linker error (__udivdi3 undefined) on 32-bit platforms.
> --
>
> --- Patch [1]: [PATCH v2] i3c: master: dw-i3c-master: fix OD timing for f=
irst broadcast ---
> commit b82f29a59ae98bd18cbb544ded9a3bf8f8d60fc6
> Author: Tze Yee Ng <tze.yee.ng@altera.com>
>
> i3c: master: dw-i3c-master: fix OD timing for first broadcast
>
> This commit implements ->set_speed() to switch open-drain timing for the
> first broadcast address according to the I3C specification. It caches the
> normal OD register value during init and uses a separate od_hcnt for the
> slow path so SDR extended timing remains derived from the normal PP hcnt.
>
> > diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw=
-i3c-master.c
> > index 84ffcb1893389..077f2bf4b0b3f 100644
> > --- a/drivers/i3c/master/dw-i3c-master.c
> > +++ b/drivers/i3c/master/dw-i3c-master.c
>
> [ ... ]
>
> > @@ -1513,6 +1519,48 @@ static irqreturn_t dw_i3c_master_irq_handler(int=
 irq, void *dev_id)
> >  	return IRQ_HANDLED;
> >  }
> >
> > +static int dw_i3c_master_set_speed(struct i3c_master_controller *m,
> > +				   enum i3c_open_drain_speed speed)
> > +{
> > +	struct dw_i3c_master *master =3D to_dw_i3c_master(m);
> > +	unsigned long core_rate;
> > +	u32 scl_timing;
> > +	u8 od_hcnt, lcnt;
> > +
> > +	PM_RUNTIME_ACQUIRE_AUTOSUSPEND(master->dev, pm);
> > +	if (PM_RUNTIME_ACQUIRE_ERR(&pm))
> > +		return -ENXIO;
> > +
> > +	switch (speed) {
> > +	case I3C_OPEN_DRAIN_SLOW_SPEED:
> > +		core_rate =3D clk_get_rate(master->core_clk);
> > +		if (!core_rate)
> > +			return -EINVAL;
> > +
> > +		lcnt =3D SCL_I3C_TIMING_LCNT(master->i3c_od_timing_normal);
> > +		od_hcnt =3D DIV_ROUND_UP((u64)I3C_BUS_THIGH_INIT_OD_MIN_NS * core_ra=
te,
> > +				       1000000000ULL) - 1;
>
> [Severity: Low]
> Will this cause a build failure on 32-bit platforms?
>
> Using DIV_ROUND_UP() with a 64-bit divisor (1000000000ULL) will likely
> result in a linker error for __udivdi3 on 32-bit architectures like ARM32
> or i386. Should this use DIV_ROUND_UP_ULL() instead?
>

make sense,

> [Severity: Medium]
> Can od_hcnt silently overflow here?
>
> Because od_hcnt is declared as a u8 at the top of the function, if the
> core clock rate exceeds ~1.28 GHz, the calculation will evaluate to a
> value greater than 255.

less possible, but suggest fix it.

Frank

>
> This would truncate when assigned to od_hcnt, bypassing the minimum 200ns
> requirement and potentially causing spike filters on devices to drop the
> broadcast.
>
> > +		if (od_hcnt < SCL_I3C_TIMING_CNT_MIN)
> > +			od_hcnt =3D SCL_I3C_TIMING_CNT_MIN;
> > +		scl_timing =3D SCL_I3C_TIMING_HCNT(od_hcnt) |
> > +			     SCL_I3C_TIMING_LCNT(lcnt);
> > +		writel(scl_timing, master->regs + SCL_I3C_OD_TIMING);
> > +		master->i3c_od_timing =3D scl_timing;
> > +		break;
>
> --
> Sashiko AI review =B7 https://sashiko.dev/#/patchset/20260721033159.11789=
-1-tze.yee.ng@altera.com?part=3D1
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
