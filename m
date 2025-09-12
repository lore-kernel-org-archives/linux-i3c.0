Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DD16CA101F
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Sep 2025 14:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nBmQxXbxFUIZwuAYoprIPcJ1ftae6T1hH10YJKs2Rho=; b=Uqc9td7QzBKuyn
	x3v1nqMDwJ6y9y+GHaHe5/IyF8XwSVLY7fXTT4GgqvJaMf2aOvkdKluvOzRq+Xpz81dSh3WjLm2wT
	eVc/zRT2Gz8Z1i79VWhedShIJMbnJnbQ75mTYZR4sgBzFDUJfkxpa883dpM9iuvZenIYfgRNa+ZNL
	TJD9kQsufyI5deMi2ZGp8fo9CYLtrU9vK17/cSVNQM4rZisAyMErfq/WPooKVnjEibWwCDzl9f99x
	aF6WpvqHasDdMDfnmHeFcO2sDssYleIJAuVNRq4wAQcFpN8sfH08MAhQ3uoNqL60hiF0uriy+AEwk
	YSbj6hYkj7no8WJW9sgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4ga-00000009rBH-3jdE;
	Fri, 12 Sep 2025 14:23:36 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4gY-00000009rAG-1ivQ
	for linux-i3c@lists.infradead.org;
	Fri, 12 Sep 2025 14:23:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nXmdpsdW5XV3gfKfV+JWDp8T8UdA9tMB41AOLXEchv2i806vecKgQCObUnHKUe0V0aS0Z/VOin/mpVgHaFArqzYJ/1jcin14dXVSNJGzK0AVkZT6VGHastmTH2OZX3p8GNYVWvxtCxl1tiogpiNEIU9IJO0Ed64Jiwq2cHue4l7PSxdnKJ5xQ2G//diuPS3Xmy+DxU93I+KNnGSozcjHePBVIXekzeMjPuHZlqjriem7MRVYjRsB+3DY+5H7s86ePwwgkssaxfdMIq+/JNopFxqUjamHE2bupnNIF3C23XjWa55zmVz4qcLckaaGN3dYRimXZek05FDD4IZQtK6oEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vd+nhXm4FCYrE8Eaqmx/7O32RTJj1fk6wZA+MxeXvXM=;
 b=Vq+3BdqeYD9Fqdn+/k4i/WWE0+shRduxpq5gGwhH6VPOzEReGMyH1b0gGQElwCmIpEGx9O3DF7NddpPdafGy9szknhPtDaz3RmMyKohHTv7k12X1jZPwx2nWyfyQGau43AlUfnkNSB/REQn25coSc9kXDse3Lew9O5qpeKGGsRCKjvGfd04LsMGS6Kmf7IehANqODkEBIh6L9zj7ysUAOo6FDXVGeh6UFcl60jmN3Baqi9QWkK1J9mEHtKmAOgCR2OEz+QpJ5jNaLhw28s+JQaxD5MDK/gMMp1Sgscs1VeXtnIrVCNOdpfmlD0HesY3ESDE0qUeeDlw4Mpf4z46yLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vd+nhXm4FCYrE8Eaqmx/7O32RTJj1fk6wZA+MxeXvXM=;
 b=S4m08+4/4yhC6chV827M/TLndzypx+uLIAZi/UVPBp+/G2Y81HOrDUkHmb2BX9xmYjhS92wGNdcZfgtnehj4dGRGyII43gCU6hgwwrkrKEwszF5JGWeIjXpj6uNtY1UQH7AQfq2caUCvCiOsM6Bmm09N5Ndsa081lf7zFLwrcxaFUDy89njrg/w8gcwilzL8GDjfhCi+FNbrOcbU3evt3B9ul1c9KS4i3+pun33pqh3C/dOqg+2xH0XZS85h1ckTDZrcifM/6UdwrumLYnUxI0oLN5HH7Rk18c1Fm6cLYLfw/PqeKtT51nGjvyi8qX9qQcyVYkzx8MpVuMNlNlGF0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by GV1PR04MB10990.eurprd04.prod.outlook.com (2603:10a6:150:209::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 14:23:30 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9115.015; Fri, 12 Sep 2025
 14:23:30 +0000
Date: Fri, 12 Sep 2025 10:23:24 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 2/5] i3c: mipi-i3c-hci: Remove nonexistent ring interrupt
Message-ID: <aMQs3P9BNOMt/lve@lizhi-Precision-Tower-5810>
References: <20250827103009.243771-1-jarkko.nikula@linux.intel.com>
 <20250827103009.243771-3-jarkko.nikula@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <20250827103009.243771-3-jarkko.nikula@linux.intel.com>
X-ClientProxiedBy: PH7PR02CA0005.namprd02.prod.outlook.com
 (2603:10b6:510:33d::22) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|GV1PR04MB10990:EE_
X-MS-Office365-Filtering-Correlation-Id: a300e6a7-819e-4292-86f1-08ddf207f27f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|19092799006|52116014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?f9UwZZ+SMkIaiyMblk9B/vICO2kUoo49UTZW1YgZ148GWByquiqx3OeijfuP?=
 =?us-ascii?Q?qlCzCdVNxOqIHXMMPATPHKi1Hq6R+jQl0RwMo8diP1TSyuAFD+Vmp1FlOajA?=
 =?us-ascii?Q?n1mFUSU3gytD5O20mSUlZnz+9JJUN49iL9Ca7AA/r2TJs/3QJklS+OYDnAXr?=
 =?us-ascii?Q?YYJgiksgdI/Yz1v5xn/JyiogiMBWRuF0aD06DzOuC4jpcjPJ9DY12mznrMTZ?=
 =?us-ascii?Q?eBVIZdZ6Pe2EGb6hHghZ7kVUxO1wUyVWn13qnMazGx9BKoF/Fx8AzwVUAXez?=
 =?us-ascii?Q?2ZhRM0gze/P0UG4RY4Gq8AvBChELLj6YUQGE/TnccnhxCuJCypluOYUV2BQe?=
 =?us-ascii?Q?dOdMngV4DQIcrSp+IfzPUQK4U6YV7tAUQDKfcNbsvHKXOZVfE5M3CGHHnpGz?=
 =?us-ascii?Q?mYcsByWTydYBT3XLE2NmiUXWXM2Fzjo+9KCg3bl8XaPJixUd+e631bUKGsSW?=
 =?us-ascii?Q?8JvMCKq1iipncMEhTPnXBCNNd+rz1jg9J5eKZnJY3k+AoNPvzFndj/Y+zof/?=
 =?us-ascii?Q?QbMR/TPoCGhLoR+/cppukLSkeMrFcaDLFWj0LM6OHR4obWg9oxYjd2a3pgcL?=
 =?us-ascii?Q?GXojv7o5ME7jvQ+DdiZX/+9oxhiHMYeE3nlP/H1PtMQrIYt8lGbYvDZOza/e?=
 =?us-ascii?Q?lP52zhUSaavuPgxReVUc4yzCSo3xKti2SD+OvBg9MIurWsO/7pl7NA2t68yS?=
 =?us-ascii?Q?7bgdQPp0BenU81yGsG1leVUnCyztT3QrJoHsE8WwKIqvpQhaCE/wUGgPtLJN?=
 =?us-ascii?Q?XWw6z4BpX4Yo2izfsfMmkd5BbFfpypq2/ZJmOd15y0inLUljx8ILJyb+I/fJ?=
 =?us-ascii?Q?HbwFz6B6W3eiR14q8RdSuEJJMYuFCjlVWsXQ9zFtTMvpXDhBYsnBphYAhyLn?=
 =?us-ascii?Q?jrx5jbTpwt3Rj56pOi9MI00YlfS2hxEG9WOSZAJmWjIgcv2joeWAQpejANXJ?=
 =?us-ascii?Q?q3LcTEJntXwYO8+3b8oUSA/4BVwB4EmImEOVZEB6io4dh2+eqmnFHlM6YEoa?=
 =?us-ascii?Q?vjg0OzrdYzmOtqhNn/Ik1+RVLqbm38r9aocnS1OREAU3+NveD7BkvSszk1kO?=
 =?us-ascii?Q?UiKf4OPEa4Jv+Zx9qFV5DkcI412d1YwsPk+pTlPoSFVIN+KAKJr9iRUxY2mH?=
 =?us-ascii?Q?8V/0yQOIFQHm3OGNQUSxi5SbxMfsadiw0LLyubbtNkDwlGobr+YM/vTC3BI6?=
 =?us-ascii?Q?LzpAL8Pbn3IGsYg4cWNCF+R+jjT+F7PrTexRgnpqlKD9AB2gRJmoi9OqlQMH?=
 =?us-ascii?Q?fFw2BYC6nixjV9vnYH3THzFsUrHimxQiczdueHOgis58MPYlpIKF50xcvG8Q?=
 =?us-ascii?Q?ycvlUCyhuSf2WSOBUr9zXvogfpGZN/4hKq515ahsLK6Aydl8hAluSEybcAFd?=
 =?us-ascii?Q?SaKaVlh/Toc4LQTydKFv7cq32JLKYrKNIdMcAyg3MES0GqvpggT43v05OVwr?=
 =?us-ascii?Q?8Z87L7yUwo9ZAcc1x/aIkd+YLNPBlOKKKBADZ2mI12nqQGGllIitlSrjheyy?=
 =?us-ascii?Q?+nH/KF+ucbxP5AU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(52116014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NYUlbp35U6YqJA49sI/sJJqp809L3Iih7IOlELdXDvGoLJdjTtc0gwVg6uIX?=
 =?us-ascii?Q?plt9EuZ1HzLtq18lFpjS96wceXA7c0moTHTOp3MwqljOA7qVETOwJlDmcTQp?=
 =?us-ascii?Q?5yAspFjpFqBR5Y5WHVWwFBgvtzIfE5/ydbn63Z+5fbEJoVEcQyqrwtvzLM9z?=
 =?us-ascii?Q?G8RR6LXXUb9xhb/75Qp4lqmpfleX7tHWBrFjjInQHD8/Zj1GjSGwrXin5cw9?=
 =?us-ascii?Q?2J7hccZSIr5lEtW2nOTuJ0n4V2B10pWOghjS4+OngIPR2cqWCON3BYUXAjy4?=
 =?us-ascii?Q?OYDHEajY+JV8FQL6chXFF7o8E/57OEXCAsc4JozvtINRpH47ZIKOBeFPPqSc?=
 =?us-ascii?Q?2ZBtnPHNDwGu+O11/HSvZsRgahQ4CdWVFh3amVCDI4YxuVnueUsA7V0MWczh?=
 =?us-ascii?Q?Bpp0UfstY7pplCcdTLZuMJYJs4YH/G3Matg9wwIz25TEJhnYWxwby+y3zKmv?=
 =?us-ascii?Q?W5rT2nxk3KVSbq8yWlR2cXNW/SDasFTpnjowib4KvzXWU6bR3TcXaEcnHu45?=
 =?us-ascii?Q?Q/VAvlteWAuYmSfJfQpadMAXbfkkz7kcPlvdkuvK9G2Lu/7qNIVhIQIRFmGV?=
 =?us-ascii?Q?CUyKnaI/9uIBkXMHGlrbFkt+bqQwFXVMdsP2KF2Km5K+Fq/GJD0Cf7H8y1rR?=
 =?us-ascii?Q?ymrOBWkszv5cq1IKnUpvbmTWV4RrHS6ILd7lsAwlfddjw9A4I2NunMKolSOh?=
 =?us-ascii?Q?axX/+hsaqBAL1IcAUzvGlcR7IykajbjRvAJBSWmy0JG/EpsboQ3DP85ND+3g?=
 =?us-ascii?Q?czDlEJ4yW1OfN3VCW7rpf7RwoSKgep6qOwPb8wfd59et4+wHMkcOBMxNr4vp?=
 =?us-ascii?Q?D/qObFcZL6EPv+fnhNK+WwGhgbmy73xpmoD4aUPF4qF22mAHZfVzlM+FWXDX?=
 =?us-ascii?Q?TohSuPPLAJn8fShOUJFfFqFXzcqTzZDoHJFtWreUtaKVgKtOiulX/Jig3Yqo?=
 =?us-ascii?Q?5jEyYUxrfqQw7Ugr89qmXLs/OSc4DzKHqq3TY00UA/ESnqDo/ocx2JoFnSNz?=
 =?us-ascii?Q?S+YY1u+itL82Zcpms+SeRBjJGOOcxz5sLJlGD/fue/17S23tGMaILLrqja+a?=
 =?us-ascii?Q?2x7kPIHnIZVTxRyy2hK6DfumWY/ByboFnJvAICXqlBEFiz2dMeD1SRAEnr+D?=
 =?us-ascii?Q?SEH7bzkxFkzBU6G9zipYMJwyf9MNVSA/sptGcpi6Z2Jt9U95WOjiX8P03j4n?=
 =?us-ascii?Q?dfF7q0aghcUNIz2IkhSSmpmbjSH/kaXCjayAchb1PdWh0JooU7ncmmQItmdJ?=
 =?us-ascii?Q?9V53EYR6vGFq/e60PP9hTZu6SNQJQQiNo0c8830YKYlTMh0k7r9r2Udb1OzJ?=
 =?us-ascii?Q?lAVLckvQ+MUaeIUz7DREj0DW1DGZ+23mSbZIuOeqiAwDCEyF4+aUhQtazKKB?=
 =?us-ascii?Q?M5MTwKJtdBxGj261JHY9M4WDgOIEh5ySdOAHAfTK+8yUQ0WhpsJ6ddPMbTLJ?=
 =?us-ascii?Q?Qlk3RhPDIqzrePMXUioVwP9JaJPwGaZwrzVWolsr+2vsLgfThAt7hr22+Tbs?=
 =?us-ascii?Q?IxgOLImB8JmBdWzC7zhcBBPJRAL7ZNGoVcvcUzc206maVeeuUM285BQEc25q?=
 =?us-ascii?Q?qbrtIR7WuPGj+KVAM4Z9cP6cfdny8Z1cIB2O/C9J?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a300e6a7-819e-4292-86f1-08ddf207f27f
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 14:23:30.4426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dvJnlSFiOWW7B/KigqwKnTzKP3QaEQqOZcxNxZoCIknl/n5d//sEiQ3nrPqdnqMVFxqipMpNksuVKSqfrsZDfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10990
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_072334_458928_E137E06F 
X-CRM114-Status: GOOD (  16.25  )
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

On Wed, Aug 27, 2025 at 01:30:06PM +0300, Jarkko Nikula wrote:
> Ring interrupt bit 7, INTR_WARN_INS_STOP_MODE was probably drafted at
> some point but is marked as reserved in the MIPI I3C HCI specification
> versions 1.1 and 1.2 that came out after the initial code and also in
> the earlier specification versions so remove it.
>
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/mipi-i3c-hci/dma.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> index f5f5ab4db172..8bc9de189543 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> @@ -77,7 +77,6 @@
>  #define INTR_TRANSFER_COMPLETION	BIT(11)
>  #define INTR_RING_OP			BIT(10)
>  #define INTR_TRANSFER_ERR		BIT(9)
> -#define INTR_WARN_INS_STOP_MODE		BIT(7)
>  #define INTR_IBI_RING_FULL		BIT(6)
>  #define INTR_TRANSFER_ABORT		BIT(5)
>
> @@ -278,7 +277,6 @@ static int hci_dma_init(struct i3c_hci *hci)
>  						 INTR_TRANSFER_COMPLETION |
>  						 INTR_RING_OP |
>  						 INTR_TRANSFER_ERR |
> -						 INTR_WARN_INS_STOP_MODE |
>  						 INTR_IBI_RING_FULL |
>  						 INTR_TRANSFER_ABORT);
>
> @@ -795,9 +793,6 @@ static bool hci_dma_irq_handler(struct i3c_hci *hci)
>  							   RING_CTRL_RUN_STOP);
>  			}
>  		}
> -		if (status & INTR_WARN_INS_STOP_MODE)
> -			dev_warn_ratelimited(&hci->master.dev,
> -				"ring %d: Inserted Stop on Mode Change\n", i);
>  		if (status & INTR_IBI_RING_FULL)
>  			dev_err_ratelimited(&hci->master.dev,
>  				"ring %d: IBI Ring Full Condition\n", i);
> --
> 2.47.2
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
