Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10785CD98CF
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Jun 2026 20:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+AJ26E/IPwWqp7ML5pukaQ7lfdAuC95RDAeQdlx9/P4=; b=fZWart7Da6I4kJ
	0flp0IR6/LjdWyZBluwd6histPasd44vqfSfusBE5kR14IOZvwhwb6aWWOsuuGQ+d8MfeetvvqTof
	OSyiQq3M6tMbo0YSo7vDtTV+0WPl+aGMUcAoK4Ak4E8GluP3miPiw2uGvvKEo71UOZz5WhDhM/m3S
	BPUsm0fEjcFia9PCFPkP16WhjFBzkPwq3b8+qfIByeBSIDKbnMJKHubSn3MoM9zrNOgKRCzAJT0ge
	Kl4k+j+i4ib+9QPrQFPoPVuDRwiGN2Kr8DcDQRkiRRq5eIvSDuxQojzbtqWapvC0vY24aFqDckeba
	CFl0FenaFslnHWD3pOAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY8Gu-0000000BX5I-2lxI;
	Fri, 12 Jun 2026 20:14:32 +0000
Received: from mail-francesouthazon11011037.outbound.protection.outlook.com ([40.107.130.37] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY8Gr-0000000BX4a-1i45
	for linux-i3c@lists.infradead.org;
	Fri, 12 Jun 2026 20:14:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fELPlKbnBbADU/N5v4l8qgrSUP+HKqrDctEB7BGBDb8kZ36Vk950U70k3y4tGR7wEhoKOwhq0jCTW8Yy9gAmiAVuWeyhfEFrZIko6RwIXovicqhb6vrL/Tat39G/VxfxGZNUi/QopITh0jCrkhlJ6xUEQ2s0FbH+XqWjmTw+3r66oLzHxe+hvhwPHjNY+CaMWc22b3bq7A/fq5uoIfYcOsHr/5CNPW+2EZJhuM+BNYtaB+pA4R9Vnk46l/eDgbB5U+ufNjeXiZpr3ma8Il6GlIRdvSfg7d7tIU7nKB1sOZLs0yQu3bDZ5TGNa04rKv5KFIUBVqSO6jJeCjSGlsslvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=41dSjCgBPVv2W6tFEp5QB6BPGT3SxHk7+8EqFmYrpmI=;
 b=vbbuIOQM8BsiV5mzhaVazqHepfE3DSDknW6IOAtq67kkKMFItfoUfuaksQZLrSY9frk70768W6Ti98pMRiAdl5aQFNOqy9TQ5lcIteEquDQMQZAquZkF2Yf7SUki7MOpHxm6Gtz36T025c80gSMfXUkr7vsvKkzY7KBRt7kQ26ZDYp2paNzZPh6HMjL82CwLbKy0O4Ui9lmJNKSu0ZCRGsxtHnEnhgn/xptVsUG0VbQrYIdWd+xJL8PL48/JE4asF1kdfWHBQc9bG9r+ljMZNhaziNEgKgFLYPX0mNOVq+9nazZPjMOXXIAfCevhSbvLmBl9q7ub4trPQ9nQV4nq7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=41dSjCgBPVv2W6tFEp5QB6BPGT3SxHk7+8EqFmYrpmI=;
 b=YnBH1GE6BJ/VG2QG1GxPCfFPGqi9tF/kk7kYx84HLIGhpDTRtsJgsRs8+gGtnQNa1P3a7zu8OxXYhoV8ZEVkiw7RDy2GJe1h/eBEXJypQAc26XPah1Ws7uRBA1W9cqQDc20+vwsYTCt8c+kOtStIqlfCF9Oimrce8X0UEddnbZZQhtMNDxE4YUQi8RVsVYp5BA6hnFagU7DRFCGonGyNQQRWy8xfiGw9de8bK9Wm8fPTxB4k7u+qBRpX/htGXv2J3eclcf/n90RQ1Rv/fy4lkNB4+DCHvkgtyZNBIa/e8kNZLAZLst2aY8gImjy7VWrtIvuLp1o/Sz+IkiK899SMOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com (2603:10a6:10:623::11)
 by GV1PR04MB10200.eurprd04.prod.outlook.com (2603:10a6:150:1ad::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 20:14:23 +0000
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de]) by DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de%5]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 20:14:23 +0000
Date: Fri, 12 Jun 2026 16:14:15 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Lakshay Piplani <lakshay.piplani@nxp.com>, Frank.Li@kernel.org,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	conor+dt@kernel.org, robh@kernel.org
Subject: Re: [PATCH v11 8/9] i3c: hub: p3h2x4x: Add support for NXP P3H2x4x
 I3C hub functionality
Message-ID: <aixol03VstxFCZ3T@lizhi-Precision-Tower-5810>
References: <20260612111816.3688240-9-lakshay.piplani@nxp.com>
 <20260612113948.F33BF1F000E9@smtp.kernel.org>
Content-Disposition: inline
In-Reply-To: <20260612113948.F33BF1F000E9@smtp.kernel.org>
X-ClientProxiedBy: SN7PR04CA0074.namprd04.prod.outlook.com
 (2603:10b6:806:121::19) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB11791:EE_|GV1PR04MB10200:EE_
X-MS-Office365-Filtering-Correlation-Id: 40f4bc02-a3a0-4556-21e1-08dec8bf3118
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|19092799006|1800799024|366016|11063799006|4143699003|56012099006|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: cVe0U0uAQCulQSkbaHvS4sMXJ26OH0E1yVNKs9aYlmPMQjbUGm58YrV2hWb6bimtTs1vp++bdU/om2yaNng0PWh3Nz6GANUtjRd5vBmN6RCOXVzZkmyVrD1SYno+vEERqaf9s1xsz1LbAanoar5Cm3GxDAJy9dzeZOTPeiVMYQpZGwGQP7W5TQ8SVqq7OL1kd5jZTLGfJ10AEDQdZG+snZtwb23zTrd4qBvVNh6sXtKgAnxOQKwvpd9gGzpqBHQEBvc0c6SeMoEIxzYkooRfbTQ6xwhuwS7BcgjOYw7Z7/OdF44UdV4StDbqrp1hVHcSJsUxwlq/pi5xgQ3wi/ugo9oY2ISNnCABYD76gGdo/kgBKG6C1jIhzV/LYY+MkeMjR8fKcqsGRxAzTrCcKeeG7sFX6SgBUaUPTdv7TxCtlKQy7zzLIjNY2+w9HxNm0WnF/qBAdASP6UyO7lytXjM9sQkQ5zRTUm00SN0LVJhym6y9pZ8Au3l0TomGhZNUjHUNfpn5IwPLYM5LQUYdUR+G7rky+NwlUDetRPSJedoLO/ukI/BAYAP/uZxx+sCfsdMerhbQOrYoNt8QlFkF6Ke8Ru4xTasW+Pn4t4CtyHoec/iJC4/RFLDBwkL5bmKxHEAX6ZRh7Nw3JRHxArdTGUWSqQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB11791.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(19092799006)(1800799024)(366016)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?xoQaASlSUI3TKBFmfLXYbAPztRbdWKfq8oaBgy7XYvSNka4fROJS1DgpTZ?=
 =?iso-8859-1?Q?2hbNKKfi6QVaieY6fv05UcSap+AmR1VMCd94XJVFFhZRXBNUzdnqFaMxrZ?=
 =?iso-8859-1?Q?jzXD/dmxMQY34NoKRtyi765RLliPBH0B+9h350U3NX+boA7ApdlzGsoOk4?=
 =?iso-8859-1?Q?+rLSC03HTnOZ16WeCR40O2wfvxa0XizJDSdvD/ghyeYxoNa4TyL5yQ94kc?=
 =?iso-8859-1?Q?4No/KCED02yjlY0FUyHiP+PzjG6KbH9GY8jvi/zdzoVGIma53g5FI/bBOZ?=
 =?iso-8859-1?Q?KJBhmnk2/jFlZTbKs3cStP7xtSeLErRHUJ4dC4F51lgERQPMdWs2N0vCHY?=
 =?iso-8859-1?Q?9OTHeV+7Qy3GDO4EaAaNftuxBxy5X3VobvsCkK/iBHs393ay4tXHVpkY+u?=
 =?iso-8859-1?Q?kfbS1b1gZ/5BEG5BlPTqa+WvjaDFv9uvlwOlGeZSl3aU1qrHAWSQulJThs?=
 =?iso-8859-1?Q?IbWqbePpCzgMUS2BnqGK319bQzQWXPnA/AInysZhAMjBjaSpLNY9BPmwUr?=
 =?iso-8859-1?Q?2G2fCam5lqnUtj0HqwHXnNsANAyyycal30lx2ysWOVjPMxjfp6BvcPRrLr?=
 =?iso-8859-1?Q?sFz0SGFZHm5As1vN5BOjiMWP1b1qiXWiBbqFLulmKnl3zQlJwvfua7JarN?=
 =?iso-8859-1?Q?cmIM++9k+QXJ1crj+NqXk2N6TEH8pppM1WyEV1Mb4bsVNvuROp9dG9VIrb?=
 =?iso-8859-1?Q?OjnwwU22+/x3qUOUuqJNVFXfR+i2j6xV3Cagff46KKIde0R8uYR+EyRNsG?=
 =?iso-8859-1?Q?QeoX6oO1TLHQ6s1S2EsKfBAtQXQ4ab6QZkVdh7cNsjLRTSboBba/MpNorP?=
 =?iso-8859-1?Q?XOQhqgoPNJMK+z+552Mqn/N0bgOD05M6dRtc0a2VIACTzFYCZhonKranh9?=
 =?iso-8859-1?Q?6VB2oCiNubKNMOqtH8i8eRCMF1R1R7XX42onSGCEA5Npw/FT12Xrt2QBsO?=
 =?iso-8859-1?Q?Di1txOGnCMCNQe4fGrehgeqZ41PELlSFu++z9CgK2CLf87ymIdFLkoQbEg?=
 =?iso-8859-1?Q?fe3cnQnwgtGuHU0Dv+YejFRHvIMg8k6VFHKIsRrJZ18KUu0DK0aFpOuZPQ?=
 =?iso-8859-1?Q?NuEaOa0e6mnNApF339Gf+5wOMt9bV/kvfW1iYG9a4uVmJ3XvW9SPKft61W?=
 =?iso-8859-1?Q?DXIEd1s4J91Tdv3NNhV/e/qCe4FRusxZPWkjJi0dOtxgHh1GBIJa+tBj2k?=
 =?iso-8859-1?Q?yX9QbDEqXgIe4s0VOS+KmOBV0pbKR23Mp4VsCZN0vtzweiYw79LIGs/1pa?=
 =?iso-8859-1?Q?utH3VM0v8TziXTwxcnUx8L3ggNbbp11nRQUAH0MST57VQ2e1S7NT83ktUt?=
 =?iso-8859-1?Q?0yVtMf3UIrF5lz/hsjYSa6NTkYQvV4CEnwXFNCJ82OrSlLrn5OEGJFlVpC?=
 =?iso-8859-1?Q?RZHy3bl3dqiaTlQpk0jHrUbU7FsokF+ZynPOE8TkcvjyJ+pWyRezsh76os?=
 =?iso-8859-1?Q?czaMWifAFCg1cuc/pufwlux10JLumdd1r/xYdLUAqw8Y9RBBvmOzSZXThI?=
 =?iso-8859-1?Q?Kzd6+DJdnlyK+dGE7eqYFDY72UmNHUso6O5zfeXrE+UHhUkMCOx44J1bBj?=
 =?iso-8859-1?Q?4T/zL4Kny5BjtLds3Mpwf7C/EVno8rUjcfqbpGjb/BMkZnWvD6WNFLMqSi?=
 =?iso-8859-1?Q?joNUMh48r5IEigtJP+2LXhtHF68zsawFWSZCwY7E6PYKas8wefqMZmnT3g?=
 =?iso-8859-1?Q?AUC23dO0tbgP9LhEc4QjEERsGyvu9eyOzCPgZ8CZQCL44BBZJbEKeTlJrd?=
 =?iso-8859-1?Q?I2t0wsiIy1jglOGYND3Vs5XlF81EhtnUt6yGNywEfELtCsvo14JTpwM2Pi?=
 =?iso-8859-1?Q?6Rza22nKXN+hHwxs1DAMN3cTFqap83fgDCfZOw8M/Cz+Hzwc8H4I?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40f4bc02-a3a0-4556-21e1-08dec8bf3118
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 20:14:23.5200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r8BH7sbBtTaBoTTyeV68fEDU89PoGY9+PHZOitNFjQ1Z2yHEfCcY6EA0l5o/pGfsqoIAjZErwwrmlNmNdARgrojPm31goIFKMqvsH9KIxVQ1VEldGRx4C1nElEAe9Sc1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_131429_612856_755A574B 
X-CRM114-Status: GOOD (  38.01  )
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

On Fri, Jun 12, 2026 at 11:39:48AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 10 potential iss=
ue(s) to consider:
> - [High] Regulator devres cleanup actions are erroneously attached to the=
 parent device instead of the child device being probed.
> - [High] SMBus I2C adapters are not unregistered on probe error paths, ca=
using a Use-After-Free.
> - [High] In-Band Interrupt (IBI) remains requested and enabled on probe f=
ailure, causing a Use-After-Free.
> - [High] Unsafe reliance on non-deterministic delays without polling the =
SMBus finish flag causes premature data reads.
> - [High] The driver dynamically overwrites the shared platform device's `=
of_node` pointer, corrupting the core device tree state.
> - [High] `regmap_update_bits` uses the configuration value as the bitmask=
, failing to clear stale bits.
> - [High] DAA is performed on the upstream bus before the downstream targe=
t ports are physically enabled.
> - [Medium] Target port device tree node references acquired during probe =
are leaked on error paths.
> - [Medium] Default configuration structures are populated with enum value=
s instead of Ohms, causing misconfiguration.
> - [Low] Dead code due to incorrect `IS_ERR` check on `devm_kzalloc` retur=
n value.
> --
>
> commit 8d18a29a52d0297c45635edaf397ce828e709ef9
> Author: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
>
> i3c: hub: p3h2x4x: Add support for NXP P3H2x4x I3C hub functionality
>
> Add I3C hub functionality for the NXP P3H2x4x family of multiport hubs.
> These devices support downstream target ports that can be configured
> as I3C, I2C, or SMBus.
>
> > diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_common.c b/drivers/i3c/hub=
/p3h2840_i3c_hub_common.c
> > new file mode 100644
> > index 0000000000000..fedcb978f07ee
> > --- /dev/null
> > +++ b/drivers/i3c/hub/p3h2840_i3c_hub_common.c
>
> [ ... ]
>
> > +static int p3h2x4x_configure_ldo(struct device *dev)
> > +{
> > +	static const char * const supplies[] =3D {
> > +		"vcc1",
> > +		"vcc2",
> > +		"vcc3",
> > +		"vcc4"
> > +	};
> > +	int ret, i;
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(supplies); i++) {
> > +		ret =3D devm_regulator_get_enable_optional(dev->parent, supplies[i]);
>
> [Severity: High]
> Could this leak devres memory on the parent device? By passing dev->parent
> (the MFD parent device) instead of dev (the child hub device), the regula=
tor
> cleanup actions are attached to the parent. If the hub driver fails probe
> or is repeatedly bound/unbound, it looks like these regulators won't be
> disabled and the references will be leaked.

look like make sense, please check it.

>
> [ ... ]
>
> > +static int p3h2x4x_configure_tp(struct device *dev)
> > +{
> > +	struct p3h2x4x_i3c_hub_dev *hub =3D dev_get_drvdata(dev);
> > +	u8 mode =3D 0, smbus =3D 0, pullup =3D 0, target_port =3D 0;
> > +	int tp, ret;
> > +
> > +	for (tp =3D 0; tp < P3H2X4X_TP_MAX_COUNT; tp++) {
> > +		pullup |=3D hub->hub_config.tp_config[tp].pullup_en ? P3H2X4X_SET_BI=
T(tp) : 0;
>
> [ ... ]
>
> > +	ret =3D regmap_update_bits(hub->regmap, P3H2X4X_TP_PULLUP_EN, pullup,=
 pullup);
>
> [Severity: High]
> Does this fail to clear stale bits? The third argument to regmap_update_b=
its()
> is the mask. By using 'pullup' as the mask, it seems this only applies
> operations to bits that are 1. Any bit that is 0 in 'pullup' is ignored,
> which might leave stale hardware state (like pullups enabled by the
> bootloader) unmodified. Should this use a proper mask covering all releva=
nt
> bits?

Make sense, please check it.

>
> [ ... ]
>
> > +static void p3h2x4x_get_target_port_dt_conf(struct device *dev,
> > +					    const struct device_node *node)
> > +{
> > +	struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub =3D dev_get_drvdata(dev);
> > +	u64 tp_port;
> > +
> > +	for_each_available_child_of_node_scoped(node, dev_node) {
> > +		if (of_property_read_reg(dev_node, 0, &tp_port, NULL))
> > +			continue;
> > +
> > +		if (tp_port < P3H2X4X_TP_MAX_COUNT) {
> > +			p3h2x4x_i3c_hub->tp_bus[tp_port].of_node =3D of_node_get(dev_node);
>
> [Severity: Medium]
> Is there a resource leak here on probe error paths? This manually increme=
nts
> the reference count of the child nodes using of_node_get(). While
> p3h2x4x_i3c_hub_remove() correctly drops these references, if
> p3h2x4x_i3c_hub_probe() fails and returns an error, the remove callback
> isn't executed. Without a devm cleanup action, could these OF nodes leak
> memory?
>
> [ ... ]
>
> > +static void p3h2x4x_default_configuration(struct device *dev)
> > +{
> > +	struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub =3D dev_get_drvdata(dev);
> > +	int tp_count;
> > +
> > +	p3h2x4x_i3c_hub->hub_config.tp0145_pullup =3D P3H2X4X_TP_PULLUP_500R;
>
> [Severity: Medium]
> Are these default configuration values being set correctly? These fields
> appear to be designed to store physical Ohm measurements, but they are
> initialized to macros like P3H2X4X_TP_PULLUP_500R which evaluate to enum
> indices (e.g., 1). When the default value 1 is later processed by
> p3h2x4x_pullup_dt_to_reg() using find_closest(), it would resolve to the
> closest table entry 250 instead of the intended 500. Should these initial=
ize
> with real-world units?
>
> [ ... ]
>
> > +static int p3h2x4x_i3c_hub_probe(struct platform_device *pdev)
> > +{
>
> [ ... ]
>
> > +	/* Register virtual I2C adapters for SMBus target ports */
> > +	ret =3D p3h2x4x_tp_smbus_algo(p3h2x4x_i3c_hub);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "Failed to add i2c adapter\n");
> > +
> > +	/* Lock access to protected registers */
> > +	ret =3D regmap_write(p3h2x4x_i3c_hub->regmap, P3H2X4X_DEV_REG_PROTECT=
ION_CODE,
> > +			   P3H2X4X_REGISTERS_LOCK_CODE);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "Failed to lock HUB's protected regis=
ters\n");
>
> [Severity: High]
> Are the SMBus I2C adapters cleaned up if this final regmap_write() fails?
> p3h2x4x_tp_smbus_algo() registers adapters using i2c_add_adapter(), which
> requires an explicit i2c_del_adapter(). If the probe fails here, the adap=
ters
> are never unregistered, which leaves the I2C core with active references =
to
> devm-freed memory. Could this cause a use-after-free?
>
> > +
> > +	return 0;
> > +}
>
> > diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_i3c.c b/drivers/i3c/hub/p3=
h2840_i3c_hub_i3c.c
> > new file mode 100644
> > index 0000000000000..38505dda0e81b
> > --- /dev/null
> > +++ b/drivers/i3c/hub/p3h2840_i3c_hub_i3c.c
>
> [ ... ]
>
> > +int p3h2x4x_tp_i3c_algo(struct p3h2x4x_i3c_hub_dev *p3h2x4x_hub)
> > +{
>
> [ ... ]
>
> > +	p3h2x4x_hub->hub =3D devm_kzalloc(p3h2x4x_hub->dev,
> > +					sizeof(*p3h2x4x_hub->hub),
> > +					GFP_KERNEL);
> > +
> > +	if (!p3h2x4x_hub->hub)
> > +		return -ENOMEM;
> > +
> > +	i3c_hub_init(p3h2x4x_hub->hub,
> > +		     &p3h2x4x_hub_ops,
> > +		     p3h2x4x_hub->i3cdev);
> > +
> > +	if (IS_ERR(p3h2x4x_hub->hub))
> > +		return PTR_ERR(p3h2x4x_hub->hub);
>
> [Severity: Low]
> Is this IS_ERR() check necessary? devm_kzalloc() returns either a valid
> pointer or NULL on failure, never an error pointer. It seems this block of
> code might be dead.

Make sense, please fix it

Frank
>
> [ ... ]
>
> > +	for (tp =3D 0; tp < P3H2X4X_TP_MAX_COUNT; tp++) {
> > +		if (!p3h2x4x_hub->tp_bus[tp].of_node ||
> > +		    p3h2x4x_hub->hub_config.tp_config[tp].mode !=3D P3H2X4X_TP_MODE_=
I3C)
> > +			continue;
> > +
> > +		/* Assign DT node for this TP */
> > +		p3h2x4x_hub->dev->of_node =3D p3h2x4x_hub->tp_bus[tp].of_node;
>
> [Severity: High]
> Can dynamically overwriting the platform device's of_node pointer corrupt=
 the
> core device tree state? By changing p3h2x4x_hub->dev->of_node in a loop
> without saving and restoring the original, it looks like this permanently
> changes the node the device points to. Could this break device tree links,
> sysfs topologies, or devres lookups that rely on the original parent hub
> of_node?
>
> [ ... ]
>
> > +		/* Perform DAA */
> > +		ret =3D i3c_master_do_daa(parent);
> > +		if (ret)
> > +			return ret;
> > +
> > +		ntwk_mask |=3D p3h2x4x_hub->tp_bus[tp].tp_mask;
> > +		p3h2x4x_hub->tp_bus[tp].is_registered =3D true;
> > +		p3h2x4x_hub->hub_config.tp_config[tp].always_enable =3D true;
> > +	}
>
> [ ... ]
>
> > +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> > +	ret =3D i3c_device_request_ibi(p3h2x4x_hub->i3cdev, &p3h2x4x_ibireq);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D i3c_device_enable_ibi(p3h2x4x_hub->i3cdev);
>
> [Severity: High]
> If a subsequent step in p3h2x4x_i3c_hub_probe() fails, are the IBIs safely
> cleaned up? The devm framework would free the p3h2x4x_i3c_hub structure,
> but the IBI might remain active on the master. If an interrupt fires later
> and accesses the freed structure via i3cdev_get_drvdata(i3cdev), could th=
is
> trigger a use-after-free?
>
> > +	if (ret) {
> > +		i3c_device_free_ibi(p3h2x4x_hub->i3cdev);
> > +		return ret;
> > +	}
> > +#endif
> > +	ret =3D regmap_write(p3h2x4x_hub->regmap, P3H2X4X_TP_NET_CON_CONF, nt=
wk_mask);
>
> [Severity: High]
> Does performing DAA here actually reach the downstream targets? The DAA is
> executed earlier on the upstream bus inside the target port loop, but the
> downstream target ports don't appear to be logically connected to the ups=
tream
> bus until ntwk_mask is written to P3H2X4X_TP_NET_CON_CONF at the end of t=
he
> function. Will downstream targets receive the ENTDAA command if DAA is do=
ne
> before the physical ports are enabled?
>
> > diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c b/drivers/i3c/hub/=
p3h2840_i3c_hub_smbus.c
> > new file mode 100644
> > index 0000000000000..edb75f790e92e
> > --- /dev/null
> > +++ b/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
>
> [ ... ]
>
> > +static int p3h2x4x_read_smbus_transaction_status(struct p3h2x4x_i3c_hu=
b_dev *hub,
> > +						 u8 target_port_status,
> > +						 u8 data_length)
> > +{
> > +	u32 status_read;
> > +	u8 status;
> > +	int ret;
> > +
> > +	fsleep(P3H2X4X_SMBUS_400kHz_TRANSFER_TIMEOUT(data_length));
> > +
> > +	ret =3D regmap_read(hub->regmap, target_port_status, &status_read);
>
> [Severity: High]
> Could relying on a fixed timeout instead of polling the hardware finish f=
lag
> cause the driver to read stale data? Because the top 4 bits of the status
> register are initialized to 0 before the transaction begins, they remain 0
> while the hardware is busy. If the transaction exceeds the timeout (e.g.,=
 due
> to clock stretching), status evaluates to 0
> (P3H2X4X_SMBUS_CNTRL_STATUS_TXN_OK). Should this code poll the
> P3H2X4X_SMBUS_TRANSACTION_FINISH_FLAG instead to ensure completion?
>
> --
> Sashiko AI review =B7 https://sashiko.dev/#/patchset/20260612111816.36882=
40-1-lakshay.piplani@nxp.com?part=3D8

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
