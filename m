Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA704606A33D
	for <linux-i3c@archiver.kernel.org>; Wed, 11 Nov 2026 16:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nyeTRVfn;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=CJRYa/Po
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kCuGMuqZ2jaDiILTjZ4E2xE9rfK0fMbdkYCyBdz1eUs=; b=nyeTRVfntKtXRvawJKRLKYSrrN
	d8wLcaKSraY13ur9i09QGeiS8vAORkBajB1bBMRvYuxiN6a6k4RnIwNgwjepK8rfMAqi+SgSkBWK/
	u6NpQGrb1W3SYtmXlLZH+Fb0Z3DU6P1Ryd0a2RcPudlYwrwju4xj7EHEybNhE2kYVrD22I0cxsAPZ
	CMtrs7/1SxF7Bg2BXmaNlybQ5SSD1zy5l7qoCPF+m76Plk1I3Skp7sc5mBrscWMVZn5kKAB79WB7S
	YXHs3Xne4lLlWfDyjqt0qWkjJewdJXQvPm8Pc2Q8ik/LNvId/Pweq3de3dsRIBu+6uLM3CbxhvJQg
	AwMjr1Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRBWv-00000007FKs-2mZD;
	Wed, 11 Nov 2026 16:50:37 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRBWs-00000007FKF-2ncw;
	Wed, 11 Nov 2026 16:50:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UZm2sKic8UttRCL0SChy/SugyFelrL4k6AuBOGrMSMYQwJ3iMZVHO/Tjhhl0akdlKLTbFMT0aCk59wIBGV9yl4417x/XnWecHhe4Ne6H8VZcUtxXUHGIDi5ZqDhVmkGp5UBy24a5YXnG2JhDdxtidrC8vxZJHyLwomV9eXsxYjxi9MBtwLtV2dUy1I/Ck6s7DSZRduPoB3OXhDx5sS8I2t0M60Em9Bd4Uq/HzUqMLvVcnat1ArytH/gKiml1Y8CPRnq7Oa2h1rxZKUJJxNDPCNt8HV94h5bFKsXtIaYP9Uigbn2uBNaFkQXDmOiWKdRRovOa2GQl+6y7e6CUw4D/Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1NN0HbzSKxHThYGDasp4fu7PUBHzIf6sPu96a0RGN/I=;
 b=bbJDUDD38OLnufTTu6m7ZBe7cOqub5BvSHfN41yCPs0ld89+MEFBeMtNHjPqMARStVrvmr8n+ZBmTXi1P3ZuHmBSDHlDCf9GuVimZXBhhGeKZM4ECUIvDfECWRFivePiH6+0NT/TMafkbRl2Fsil8mg4B0SFFMnrDEpreKFxbr+MiAFtKRm99KB2BF30GG0XfmSeWsGRMkR/TNsXIAjhmxUQJg7Sn5AMYoi+kpTGojD03Hg8ynqJJdDLiqc0C3QUN1AGDED01b3xk8c9ksiuEhS428bZliZuJmLiz48f2MfGhYyt2tLYG7h+NvLRgjOsalgeI/EqOAbZfx/zvx9o8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1NN0HbzSKxHThYGDasp4fu7PUBHzIf6sPu96a0RGN/I=;
 b=CJRYa/PoDnEK26VM0d9J30vADR/NAiV3n7jtO7DsO4i0uEt9CuhSWGdck8cfWltljFuC9A/os7Xb7Bk/H+MO8zNgaSAhBmgib/XffzmUFmDIeOIAcvqsBLIf7+DeAex00vKuhsUGuGf9ugN7mu/8sGUhCOPU6e2esA/SP2s4Iby1AULEGVlHVhiNU+N9E/1KUE3oT67GnXDlIetvVra8Z7ZLSWdWquAU4DdGtwXm34Ze9hBlvm+1F7QRTh5bSkeJkN04fRwSqNEVb4AjTInPXQSjmm6S5s29ph0ijAuPwZWjRuTQDSalm/Zfg3h1SB2V0yUT2+auvWA99qAnQ7ry8Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DB9PR04MB8379.eurprd04.prod.outlook.com (2603:10a6:10:241::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 16:50:30 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 16:50:29 +0000
Date: Wed, 11 Nov 2026 11:50:22 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Ryan Chen <ryan_chen@aspeedtech.com>, tbevis@amazon.com,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/9] dt-bindings: i3c: Document generic bus timing
 properties
Message-ID: <avSczhZGS9cCcNSu@lizhi-Precision-Tower-5810>
References: <20261111-b4-i3c-hci-ast2700-v2-0-4d8fff5c5196@aspeedtech.com>
 <20261111-b4-i3c-hci-ast2700-v2-1-4d8fff5c5196@aspeedtech.com>
Content-Disposition: inline
In-Reply-To: <20261111-b4-i3c-hci-ast2700-v2-1-4d8fff5c5196@aspeedtech.com>
X-ClientProxiedBy: DS7PR03CA0119.namprd03.prod.outlook.com
 (2603:10b6:5:3b7::34) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DB9PR04MB8379:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d53db86-b58c-4362-5675-08df4013e4d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|19092799006|366016|22082099003|18002099003|261009223027099003|3023799007|11063799006|4143699003|56012099006|261028144727099003|261102123227099003|261026121527099003|261021121427099003|261026140227099003|261022105027099003|261022075727099003|10067099003;
X-Microsoft-Antispam-Message-Info: AKpj/MhLO/Xla+SgHmOliGOSmtR64MQvGHAdn1LISVxH4TtFrz+vFtsdTK0wq8frF96ebHqIxirig+tZY2kVivBhpLCdXv1GNMe3ByU/9xVHSRc7DlTIb/7jDovBCiXPvKvpSx5PWW/jx1Q5KkrH1+rqPbShOtfav8EmGjkzJ3Hr4tDykTFSIH4P8GI43qFeFkExzXhwEo8MCUn2fPH/SDcQBLN90vRk/X4ZmK0ZzxjAjqoeRgyHIfDobYbEUIWwDBJ2+QvC7jTkol2fZTuV+tSX06iESKqeG+gmVsIlwT2fHBwVm0S4okAPsAYlXIs6kVcI4ijhIDYLjeBuStpDRR21huhsKXh837hEFLv9gPzZF0VByLkUJFaHoMvNc+siWpC3TemiorrMH8QMFdQ6nVaJnHgYCp6Hgv1Rjf/jiOMIUHULhbvg1g8nCEqn93/BKUDH+efqoH9CFnckMHWjt+LtyDPIAtHBG0yN0yTJeXT9rWHHHSHhcvvENQmEBSNOY9gaUbOyFexfi4vAMY2T8BRn8aPM9Q3jcV6JA7Z6FG/HamP/SoNRBazcRzcWhLEDBafQJJGVSoGgb8bPuRZ2SRlVuGUrsS8RSLOl+Kz4TN/Fbq4E6jox1ajWTYYF+Zd0YZ+lsXJfM3BwdNUd8rhHJTzdWcWMnMf0esuNm2LeT2c=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(19092799006)(366016)(22082099003)(18002099003)(261009223027099003)(3023799007)(11063799006)(4143699003)(56012099006)(261028144727099003)(261102123227099003)(261026121527099003)(261021121427099003)(261026140227099003)(261022105027099003)(261022075727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9GWnyXibWy0s0KHsl+iGoPsXXZWjN9xGtM9plB8QWbNy7vL/OgPQSA5bFJRH?=
 =?us-ascii?Q?4C2iGuSlab9RX913Jti0otfJufynzPfCsh99q+oXGQR77r8WN/8OCFjR0wa+?=
 =?us-ascii?Q?0GqHRVulGFvw/AFEjAFce3n7+uEzZPv4DiZlLgMQ0f67LqF89EToTVPVwmK7?=
 =?us-ascii?Q?NUDe3XVV/D8ClkwKG5xnESh4b7jTKsAddv6+k70beL2fuNHg1iw15Z6ZhEba?=
 =?us-ascii?Q?TXcSbuh2VrGatVwZ6mxbMbJW/XA8wKM4luddObnyNRxxgyt6miY7qmTW4ofU?=
 =?us-ascii?Q?mOkI7SUQr9lD+fthTmCXRtqZxXMXXE0X09AKtX3Kfipz9fQVsn8EjgpzasWW?=
 =?us-ascii?Q?YwfeFJaGQar6wlDI3Uwy1AMW9CVjqejWdmMU11+0Q87/e9lhSf1NJyzL0yPP?=
 =?us-ascii?Q?X/+khhKpBy5/mS2zGhHpOhPBoveqv7HZg3yB3Lna4uLaoRR0lS4sy7My4IP+?=
 =?us-ascii?Q?YG/oeB3vrXdxRZrzh2ue/qYyDXG9UUMB8mBlzeRwwi3q7Nel7quimThdgOVg?=
 =?us-ascii?Q?Sl1DViDNJXrDf5gnUW/wD+9A2TgBIELzmDGRAtq16820G6M3Mwyah/qsNnHj?=
 =?us-ascii?Q?be2qgmhmYOsRT8BSxVzs1tuzrGWN9BX/MGPMVssPxFFQ2dZ+zo/natdgziJ/?=
 =?us-ascii?Q?fJ0PBFbfgirnli7j+6wyX+RPpcglN5P6a0amdBPELVf/dRHc3wGIY3m7+X6k?=
 =?us-ascii?Q?v0qSBaLCDCizsHUiRc3x6HSqmRqSguXlyH62Yvblhli9CEtdmwp6008yekzB?=
 =?us-ascii?Q?3kM+xYs1vp4wyeR91WEKyBi36uebsBagZJGf5xbjxYzoZ8BTzDBAAWhI1rPd?=
 =?us-ascii?Q?hYTc5uwlJhL6ntDJarz0gGVW+sQBgUEyFOoGBzvw2ciEL9w3JEqczIbyQRhJ?=
 =?us-ascii?Q?3KIzI55AAJoXKjQ10qicrWq/9Ijj5wEuT28sTGPsOmBcLSCu/bZ20PHrvd2m?=
 =?us-ascii?Q?C31cSTKeCCs+i1hCHnMy4IGW4YNKO8hThJMNbc8u4F6Ib9BH2EjwKT0B2TbB?=
 =?us-ascii?Q?FblbnUx1pc/uet4vYL73dDfoiyt7z/gmy621TKisZFb34/NWSue0l7OJ0fws?=
 =?us-ascii?Q?vCVlBLESCRhxf+zykyDETgaQ7InnC7f8FqUyCQ0rbzmev1iDG+tn+3TwfsPt?=
 =?us-ascii?Q?Kohl2PSHDH+ekgUJlm4TAsp15QkOps71A+cvWK0yzRYo5UavN5C1ZUx92Sg0?=
 =?us-ascii?Q?Rvc0PdTg78DSgNm1ef+eLw8m3r1+Y9/s0tIyD3tb5Wci8u/KIPwxbgENght+?=
 =?us-ascii?Q?sizMHfJvm00FyKEsvF/l3PM3KtFXPmj6coGfjdiRAPTDwHH8h3XAhYbLub9/?=
 =?us-ascii?Q?YXKE/Ff6D3WWUkN4ZCf/RoPQwr1sjaSMWr/EL6WiKuZMns1RcI6QCuKFEkNB?=
 =?us-ascii?Q?Xzcn9VdZapPADn1tWaqpmjOjpuhtf62TZpdG5jBEwIagr/ccqj7KakCwp/hS?=
 =?us-ascii?Q?7OgNohqPpDUm2z1DLG2TIIviyWViLJLd8GOhP8XHB6iIZn6Ny8Dq4EwonE0d?=
 =?us-ascii?Q?lq0rMHAgIsGfRdj5OktbC0RarfpG/e4Tt+tp7EMdVNjot2RPCH7qY0KwkX/c?=
 =?us-ascii?Q?FjUC0pvndnti82b+/eCeUGaKYPKtPEI+zHZbsMuYKHQWYcClTy9U34Z5DahS?=
 =?us-ascii?Q?W52JhEQa57lUT01eAWTRG8DUUwWBNPlgm8eFuAdYem1DP7CNxPUsiX4rxrTK?=
 =?us-ascii?Q?eZo/ilXjBVk84tXK3hk6uWFYIJ9fE+JTcG3+tPXmixPmlkIR9CTztBJr5lvI?=
 =?us-ascii?Q?zhtbtp/o27s8Rl+3SzJnZ5ds8Ug/l7MI+zBG9C6StaXqWYhRCZMK?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d53db86-b58c-4362-5675-08df4013e4d2
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 16:50:29.8540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 38iLylBEaCBpHuEVRuSOAZpMfQo5tubd2PmZgpU4w9Yzhvkiet60V9LuthNfhD06CDuzulRGlQZzZ/Cko2i+7Vh/noQVSlb2l0dRX/54oRJKr3D7CRI/apCY1E8lNEC0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8379
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_085034_737052_EE843148 
X-CRM114-Status: GOOD (  21.54  )
X-Spam-Score: -1.0 (-)
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 11, 2026 at 11:16:29AM +0800, Billy Tsai wrote:
> The push-pull and open-drain SCL periods, push-pull SDA output hold
> time, and the tCAS/tCBP periods around START and STOP conditions are
> normally derived from i3c-scl-hz, but board-level trace length,
> pull-up strength and capacitive loading can require different values
> than what that derivation produces for a given board.
>
> Document properties to override each of these independently, naming
> them after the MIPI I3C Basic Specification v1.1.1 timing parameters
> they adjust:
>
>  - i3c-pp-scl-high-period-ns, i3c-pp-scl-low-period-ns
>    tHIGH, tLOW: Table 87 (I3C Push-Pull Timing Parameters)
>
>  - i3c-od-scl-high-period-ns, i3c-od-scl-low-period-ns
>    tHIGH, tLOW_OD: Table 86 (I3C Open Drain Timing Parameters)
>
>  - i3c-pp-sda-hold-ns
>    tHD_PP: Table 87 (I3C Push-Pull Timing Parameters)
>
>  - i3c-cas-period-ns, i3c-cbp-period-ns
>    tCAS, tCBP: Table 86, Figures 144/145 (I3C Open Drain Timing
>    Parameters). These carry the protocol minima as constraints.
>
>  - i3c-sr-p-scl-low-period-ns
>    The SCL low period held while a Controller stalls the clock in
>    the T-Bit phase before a STOP or repeated START, per Section
>    5.1.2.5 "Controller Clock Stalling" (Figures 19 and 20). The
>    specification describes this requirement qualitatively and does
>    not assign it a dedicated timing symbol, unlike the other
>    properties above.
>
> Any property left out keeps the derived default.
>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  Documentation/devicetree/bindings/i3c/i3c.yaml | 86 ++++++++++++++++++++++++++
>  1 file changed, 86 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/i3c/i3c.yaml b/Documentation/devicetree/bindings/i3c/i3c.yaml
> index 5603f2e7807d..30f65fd1afa7 100644
> --- a/Documentation/devicetree/bindings/i3c/i3c.yaml
> +++ b/Documentation/devicetree/bindings/i3c/i3c.yaml
> @@ -57,6 +57,82 @@ properties:
>
>        May not be supported by all controllers.
>
> +  i3c-pp-scl-high-period-ns:
> +    description: |

Needn't |

> +      Push-pull SCL high period override, in nanoseconds (tHIGH, MIPI
> +      I3C Basic Specification v1.1.1 Table 87). When undefined, the
> +      value is derived from i3c-scl-hz.
> +
> +      May not be supported by all controllers.

Add

    minimum:
    maximum:

to restrict validate rang.

> +
...
>      type: boolean
>      description: |
> @@ -67,6 +143,16 @@ required:
>    - "#address-cells"
>    - "#size-cells"
>
> +dependencies:
> +  i3c-pp-scl-high-period-ns:
> +    - i3c-pp-scl-low-period-ns
> +  i3c-pp-scl-low-period-ns:
> +    - i3c-pp-scl-high-period-ns
> +  i3c-od-scl-high-period-ns:
> +    - i3c-od-scl-low-period-ns
> +  i3c-od-scl-low-period-ns:
> +    - i3c-od-scl-high-period-ns
> +

why need these dependencies? Suppose it should be default value if not
existing.

Frank

>  patternProperties:
>    "@[0-9a-f]+$":
>      type: object
>
> --
> 2.34.1
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
