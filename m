Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55552D7879C
	for <linux-i3c@archiver.kernel.org>; Fri, 19 Dec 2025 16:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lmOSmIiQGFUNKYoAC62DlY0KE3bvqO3PrqTkErAT3Aw=; b=YxWYfIA0SGN+xA
	0oM0jEq9UQp72P0RCj3tozZru68do5JdO7PavakYCtxO3lhv80gN34dhZJaDMyBJOjliPsIBCfgrW
	txc/dlggkbRkbi0FiaWp30brUlrA514IMEQA5x9AoNmCaKnxQs33GatxXbgnzqZ25vllqRef6VIbq
	dj5HtCGzpYP6CaF8nhxVelSRufI4uzwdE7YdawQcIfHqOvVoVtDRbqS9R0LK+xnYjYHaVuwXeT3rZ
	KcwU3FKC8PrRvts2Zac2dZlAsnRUlC93h0SMSsXTjDDAi2l+PtyJPH4wuwtMU58JGWYIFdVAza+/f
	MhoUzuIOge7bm2ElyEkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWdZC-0000000AfE9-08Jp;
	Fri, 19 Dec 2025 16:42:58 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWdZ8-0000000AfDh-3Ign
	for linux-i3c@lists.infradead.org;
	Fri, 19 Dec 2025 16:42:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wXZZeQerc762vAhMtp5BFbmyjESvtQdR+ccq7d8zTpyp/likVNWbgfB5eC6oIqJuF12QZU9GYz57ISi/7fkKTb6I+LFSEicxtYrravCYHMk+miTfYJleaaFwKehN4EgnJzTPt1d60TU3cR+wtihxYXhr0W3kSm8XcDOaGDHxj9XX398NN5+uqAGMfO+hEfSqY+Nouhq2AlBdPD7+VoXjnqbJjC1ldVaGyj5z29aAY38KlTYxTOODLXV/uKftqCS4RB6B9+CRgj6AXCQYClqN0JvzSxyEc/uJE26v0XLj28mr3c2yoNCzTdyNClIwUgCF/wlGUWZVYEH+FiYKlg2WIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RaBx8Hb3AgA8lz4Oz6yMh0ppEoignJeQZl1V5CYK9oI=;
 b=ENeUtaLsjLH+Dp4tF8lmMTvau2ktpDSOpFeOh8yoWPtku4A9VX4F2+gpBDzrOmZ29yKUHAjY3tVGUb6lKnceZE4lAQo/njtnVPRIgvgTbYgfuY3E69A9KrFYBeHHTmhGwVpiSW+98+5IeG6JKZwvAee1est5m2NUyktTaWc4uUm4+uxprCjIaRzvJCKcoFyGWBJWDL+ebdsB+RHH7/zHCcE1KzaNRmWbI8MOTzpxr7K7oAo/ef4cTd0y2xEYC4yozhG6hnnuAHO6oZDBVAziB24OZNZU6Q04Y8ufJnmLNyRsi4foc7j4df/Z+2ZXk7xxGTgvpUoo4FL2sX/B9z7oDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RaBx8Hb3AgA8lz4Oz6yMh0ppEoignJeQZl1V5CYK9oI=;
 b=MrA3o/SeHkB7qZtPz0OaCO1B+BVMjzi5pkm4DGv8bVirxen7byCOcJGuEWc+9oDt2j5Wr29Rm0e8HPjzr3lEEo5P8mhIsuwdfkeRdZ1s+FQaFtBjk+WkM8TAP5Vbmaa0uaWHICDM34f1qgxOg72FDUnIzgthK3uKsixowRIB2t2ZD0bDLL5zA5bWIaHCV2D+loAyVhwmE3nxnqDpMd8TyURoJaD7PT9P5Nk93pREewRElX7aNK+RV9MN0yiSr9yrsKJ5wKPWN6GzJOgpShsZGUKMBRlz3YnO1eJQP4c/qk7g1xAxeFW4QSnKR4lJE/s0NU5GzusRz9DqkzqILPfgmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AS8PR04MB8500.eurprd04.prod.outlook.com (2603:10a6:20b:343::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Fri, 19 Dec
 2025 16:42:50 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 16:42:50 +0000
Date: Fri, 19 Dec 2025 11:42:43 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>, linux-i3c@lists.infradead.org
Subject: Re: [PATCH 11/17] i3c: mipi-i3c-hci: Add DMA suspend and resume
 support
Message-ID: <aUWAgz0ZRLt0Krbz@lizhi-Precision-Tower-5810>
References: <20251219144534.84391-1-adrian.hunter@intel.com>
 <20251219144534.84391-12-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20251219144534.84391-12-adrian.hunter@intel.com>
X-ClientProxiedBy: BYAPR05CA0051.namprd05.prod.outlook.com
 (2603:10b6:a03:74::28) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|AS8PR04MB8500:EE_
X-MS-Office365-Filtering-Correlation-Id: ec33543a-3680-421d-53aa-08de3f1da5ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|19092799006|376014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IeEKiHSr1rGpDySMFh84Rzu6D1Qew2kEJh+7XACBV7nLp3tRwTkuEEXc3B7M?=
 =?us-ascii?Q?fm8OXG1PKv7Jq23wFKhDRbSF9ClxnDpee0OX/1PUYertzj9dehHLh+i39+l4?=
 =?us-ascii?Q?OHnOlY8Tyq5l7wBzUGJC9j8iZyte+VCpFmcyIboQugSnhd/iJewdOqJLKir/?=
 =?us-ascii?Q?1/YrsL3Z1jY58L+3NeuVdvK4ptlYIIVvysqWyRpEyZjdxTff1MCSxvZQgW4S?=
 =?us-ascii?Q?/3o70G+1oeW/4TN1q/dV+quozZHAwAAfvPGchybcXc+XhzOuKTHyRYBsMiih?=
 =?us-ascii?Q?4Fo49xkaUi27VHi2ctE+DAjZXpKi+zt/dnqypjQvdoqmrCVKJ41v8Sn4k1Tt?=
 =?us-ascii?Q?y9gBF2j9SMjpI/EgWvCcA+tOY3/FVqef7BHbZpppA1DtRBEeT7RWMuYNRpFI?=
 =?us-ascii?Q?HnRPyfFKa6Z89Sf4rqhrrL1WhgcelQ7RDWWU7A/t3DyoyM8XSJHvsYDwgVeN?=
 =?us-ascii?Q?FW/qq6xS7TD9Eq8Nkcv3i9v7LMMVFUam7aCeK1ADxm81RQxvPXcXjOZ2Lt1N?=
 =?us-ascii?Q?JkKQzGOhaFbRmwDjhKUSBtata3PX6KRe9bnBOY69P68u2w62SV88QWWej//Q?=
 =?us-ascii?Q?Jy323kXLFfT1LRG+PZy8NvjFiQi2TPWs2TFwaNl9yQFM6LBvENQjO0OHHIxT?=
 =?us-ascii?Q?OnRwECNyHri1b49y9pNIV37EZx+jdBcIA8ssc29YHhsuEzabhueyHjpxXXLR?=
 =?us-ascii?Q?8gNRyE5nNQeCLMJhEX9mNv8rHnKsiJxtAsEzJhRZhULW2V001662dhx5Kp6B?=
 =?us-ascii?Q?q0Vdrems8/DjpMfr85+S8oW2J7LNihM+daS75UsH3TYjhfhUPOJEK/W+aB0O?=
 =?us-ascii?Q?FCoX3D1/scOyZIjeYeNwT09jqfsUfQAGG8ssBbCbtwM3Yi+segb9lU/NMQsm?=
 =?us-ascii?Q?1WXQvxdmPj9rPMtdPOnwqlChVp0SjIvk31V083+zFonYtq+GcprlrTjkmErF?=
 =?us-ascii?Q?1w7r3ZNucN2ZjQxRGKUhZE7ZGLrCsNUzk1Kbg3AYtSb+GUz8kMZ/q22YtLyR?=
 =?us-ascii?Q?X96JV+QHwibhbjN31WHf2O2uOzmuff2FfoFE1fKzyuAL21+iFEAiQSKOJQ+B?=
 =?us-ascii?Q?+MjsNuZN2+sUmmb3ivISDAd2MHq3Hu124TEyFGmxZLpAvSvyLs7SissJA4Gj?=
 =?us-ascii?Q?Er+okyGisawX+cCMQf0WGtzi+ZFclrcOLuftNi3LxiXHlhD4BbmQ8SzZByX8?=
 =?us-ascii?Q?g7pExdODMlmw31Q7D9VxukYiHc9ZiZGwn5642EhXHZde9ccyT+2T+LZwVhVe?=
 =?us-ascii?Q?M24H9/aK2Yxp7tmhhUu7q4yqYSAt+MEvW/nyAxAkkCWbWwsZnoP8OJHyeJ2j?=
 =?us-ascii?Q?Odf/AUQXqDyGlbgvRCmiF9lr+8dUVOFD2C8ylhT0OH45yZ/eUmpbHJbQz11J?=
 =?us-ascii?Q?lc6MlmJxN7RfiZwYpLwVOI3FdQ2bC3B7bHm+GDL79feoUsQJhmDyhocr3lci?=
 =?us-ascii?Q?/jsG/dYMZzJaFYAJHL+it7jTNiMWJwmhcGOtQfLMwbPMUyKrHv7T6m0aJHMn?=
 =?us-ascii?Q?rOsM7Q6NNnKXathsY7JzNH4VPmMJ4Nql30T1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(19092799006)(376014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZF7ZRfDCJoeVkjPuI+EV4X+1xL53hmB4vwRHxUI4IOAWdW2XvhxQNazEy3YS?=
 =?us-ascii?Q?q0+Q+uZMOGniqISbxuCaLBLl9D/yo9nZM23vtlaJ5rQyP2ln5CC/JdxIBiJI?=
 =?us-ascii?Q?jLRv9AXOpovHzQT3MKJlZeyJ6LKTlirPZe/4RUHFrEVm7g0M5QpnoOqF34n9?=
 =?us-ascii?Q?a6VLSxQlixPjLixSuISyMEtfL1zBSWgMIVobeFfMv2Aq3F//vsaFOsWNtRXs?=
 =?us-ascii?Q?mpapaxx8xj0HekT0B4750D7BuUzi1rPEeJCkBjnxdUBGoJKU/KqhWl+QBh5R?=
 =?us-ascii?Q?+MUmWtVAn6HCK6H9ZI6PaGuHRcteyn9Vc0iLTaj16jeGU1zMd1mzLU19XT/O?=
 =?us-ascii?Q?a4ciw9MrpbcH6WtzCtvpSOFM7/NWV5kUhysx+cnN7KIQWq9EQAaqbBy3GIuI?=
 =?us-ascii?Q?wiL4y9aazXCY6Xklv3q6eN4PrKGSQzLv6E+C2aVJEiFSewCSP2Xtf8QzAuBy?=
 =?us-ascii?Q?HAfajVr8lNxuavbPVPcoEPEXqSUusqGwjTML9tQoSsYCfncKpyNgShik6mkm?=
 =?us-ascii?Q?xXDhCY4pbGor/SO/uCzWpS7kyrbX0gyvz6sAaL0BE/uSzj3MpCm1kCaaa9wj?=
 =?us-ascii?Q?Dsizx/OEvNHm0HVoN6dzlbr5xoivjoamJAK8CKm36WeWUyLYduwr9wPHtacL?=
 =?us-ascii?Q?T83ZckIweczcVq88W4hY0DpMadI1mxTpI3JWNkaBCKI6jcEQILVtnNeorkqZ?=
 =?us-ascii?Q?rh7Pb/Blravtm9QpHIPTfQh5BhFDXL/R9lS8JY3jOQodkKBfg/ZV1xYzqMIu?=
 =?us-ascii?Q?7/V8gdKUEB0ltG686IEssoWN58b5pFSsdOtk6ZdWhLeq89AnC0Ug0UnrwhmA?=
 =?us-ascii?Q?jRAX8Dldg65PLsz7xa38BFoXQOvj2EHhJbCd1TMPOEwxoUS5N16MLZlyyeAz?=
 =?us-ascii?Q?6hrfouEtgVhKRkwBCWZi8yOE2HqL9iOJGOmBhua+5+vesC8NSAhwqRtkbeU9?=
 =?us-ascii?Q?u7B45Oxg83ABxi0vtAY+Zf+0XCWf0/ogkzaWpk6GitPGXwCDN/fExZKexJOM?=
 =?us-ascii?Q?ovbBCm8CrQ9qQMOOZaYqhPRHcfxAa1V6OokkIaLPSmXC8TNpUh/1pdRJ3ULk?=
 =?us-ascii?Q?dKvPKf8y/xGVfPgB29hLX8LCegj0fMC7Ghue0bTg9RtjkOxfYWs4JmXMSSWC?=
 =?us-ascii?Q?dYfypaw86TfazRF3T/KxYBpTnDvbbL9yEznjp+aH3c8fygmzHpnoQqFmtanF?=
 =?us-ascii?Q?dWJH1XpvzV0YcWcEGjgUg7u+O9SEhVpECAUYscMnUtv8bi59r+wYYllwrpiP?=
 =?us-ascii?Q?fk68Edm+QCnflFgyQlxtPLj7E/avVIZx3YM7hCluUIbtItLTwKOSkt0FewCs?=
 =?us-ascii?Q?GEfrUwEIzdpTiABYw0doNnZxgwkp27ByGJSrwHkRab48w6gldYegoKRMqHfF?=
 =?us-ascii?Q?ql7Mwo4W7m6hNPHY5vsa4gHsXg6TVmsqkXRQe1OUw3azqtRgbbMyZqsp6qxR?=
 =?us-ascii?Q?OlYcH7ZCg3fjj92rwPvEcDd8WnS9ZMyw7LGRaPk3ER4lVTYipryROiPbuCIT?=
 =?us-ascii?Q?UVOe7nMP1Ur3QRQ0asEN3/4adUtkC1IdGWakdje82jSUS1xaYZE6LkovZcQm?=
 =?us-ascii?Q?zH20wGr/rHIJEVK+5I5f1/kMMT7t/WtJCUgR5wu9eRbsrjKOK8MJp+2jrHQL?=
 =?us-ascii?Q?OBHtgCjWe2XQr0DMJ7AqIC8r5TExp9eLlyc6JTAb5tbRZz2VZoqDiCEF8e0r?=
 =?us-ascii?Q?poUYqfOeubpYjQAbeMXrAPbuVV52mGKITHV3t/CtdGt5Q+9S?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec33543a-3680-421d-53aa-08de3f1da5ba
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 16:42:50.1262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: stwRVZk2VrNzDDjLiTpwogndBUK50nPZa9gxamyFDIQNshQKNl5qRr1B2Y/8XUl36BTJIRpFW1cTEMJ2815ctQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8500
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_084254_826027_EED2C701 
X-CRM114-Status: GOOD (  19.38  )
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

On Fri, Dec 19, 2025 at 04:45:28PM +0200, Adrian Hunter wrote:
> Introduce helper functions to suspend and resume DMA operations.  These
> are required to prepare for upcoming Runtime PM support, ensuring that
> DMA state is properly managed during power transitions.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/mipi-i3c-hci/dma.c | 25 +++++++++++++++++++++++++
>  drivers/i3c/master/mipi-i3c-hci/hci.h |  2 ++
>  2 files changed, 27 insertions(+)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> index d0fc245f8e8f..6be97f0782d8 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> @@ -275,6 +275,29 @@ static void hci_dma_init_rings(struct i3c_hci *hci)
>  		hci_dma_init_rh(hci, &rings->headers[i], i);
>  }
>
> +static void hci_dma_suspend(struct i3c_hci *hci)
> +{
> +	struct hci_rings_data *rings = hci->io_data;
> +	int n = rings ? rings->total : 0;
> +
> +	for (int i = 0; i < n; i++) {
> +		struct hci_rh_data *rh = &rings->headers[i];
> +
> +		rh_reg_write(INTR_SIGNAL_ENABLE, 0);
> +		rh_reg_write(RING_CONTROL, 0);
> +	}
> +
> +	i3c_hci_sync_irq_inactive(hci);
> +}
> +
> +static void hci_dma_resume(struct i3c_hci *hci)
> +{
> +	struct hci_rings_data *rings = hci->io_data;
> +
> +	if (rings)
> +		hci_dma_init_rings(hci);
> +}
> +
>  static int hci_dma_init(struct i3c_hci *hci)
>  {
>  	struct hci_rings_data *rings;
> @@ -865,4 +888,6 @@ const struct hci_io_ops mipi_i3c_hci_dma = {
>  	.request_ibi		= hci_dma_request_ibi,
>  	.free_ibi		= hci_dma_free_ibi,
>  	.recycle_ibi_slot	= hci_dma_recycle_ibi_slot,
> +	.suspend		= hci_dma_suspend,
> +	.resume			= hci_dma_resume,
>  };
> diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
> index aa8a03594e64..38f927685d3b 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/hci.h
> +++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
> @@ -125,6 +125,8 @@ struct hci_io_ops {
>  				struct i3c_ibi_slot *slot);
>  	int (*init)(struct i3c_hci *hci);
>  	void (*cleanup)(struct i3c_hci *hci);
> +	void (*suspend)(struct i3c_hci *hci);
> +	void (*resume)(struct i3c_hci *hci);
>  };
>
>  extern const struct hci_io_ops mipi_i3c_hci_pio;
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
