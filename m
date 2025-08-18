Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C463CA0EE4
	for <linux-i3c@archiver.kernel.org>; Mon, 18 Aug 2025 17:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hxZMD2rh8xUXNP/SAmrr1XK9x7Fa2BBv3rKHmjhg2kE=; b=HrSVVc9GgUuftL
	DWz/uc/7gR0Ah9nS5XCryx+F+jiIE89dyWOgEmc6h/seovMNlDE5OIdAloD0nDPY1deQimCrmdURD
	w1r8lWGklx5+BAULiMZNk74FGb1ICt+udx0mNXCA+xpGGz+Zz76ST1QbOi6GCVEPvNBqR7HgEHL/s
	Rm3ULAu3CoKAYBrbtgoeIDIwtQUZiYJxuEqVojzdRXsUV81Ngy449I9vHbWRHVyI25XZ1icpzfNRc
	974cWFZ6BTnk5Cz/qcdiCJLrQOk8Pu5h4UkluMBJdocioxYltScvtydYSFPvRo2mg0mU+d4pDa2Hh
	wlsgGvcY6uVtJ6uSH2Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3jl-00000008CYL-0YxO;
	Mon, 18 Aug 2025 17:33:37 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo2ir-000000081dB-0Yag
	for linux-i3c@lists.infradead.org;
	Mon, 18 Aug 2025 16:28:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RBOii58mT98tiaaDCtEYbNoBp4j0TXjFGQNDTEise4idodlO+Dle3J4h7cqcgaBq94wVSBNg+PjBmKp5ng1xyjiY+lH7+dq4Tipsd/Wk7RQ1FxiuA/9kcD4MsY7ejFjDuSTtzsCf29hIwL4su/vjHTQhJx0OX2SASg3gZmy7X43MI3McMdilXoJTvZ47n8Rb0nrmNvqrn43pIs+vvoSLSE5bOeWdiiViR+i+wiehSTaBkBNcQYOuUZPWA5gqgwth1InN25mkBCSJqnYf5KYDgV0AJ+QlT8at7uyeEpe3CtwbvOO6WduikexQhP48CUXA96pYwsDe6hjUCElAMyDxMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IRcs5hHKV1HNOxU7M4vTlysFLjHptTspok+xtdUaMis=;
 b=yAHamemnuQ5FSoKPungdR8/q7HxIV4kQP4KVcx/hm3mZTd2kFYUJAiDXIaNIz7xZz9fAFYBm3qx6KdsTaCUvPhaIUd8T2vHxYZctK5ZmQwn0Q7MYWDL7hXpvuqcSjg/ojFp9HK/YD7MLG8CGeBwR30tmd2jlbdI2LEC/BS0M6klPfMIJPaOt5i/uIl8xeLKnBJ5JrbQIBeFdm38x9VBlr2RQfLgPQc5W4Nw1YRvf4hz88hgmRZ7aqB5LKPFTs+jYQqwhpEW5SXhVlwlux4cgIrwtGCTGAwH94zyI61oqgDOrSRN+i7DiKa2oIaUdsWBNZPW40nt8uurqfhblPolUsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IRcs5hHKV1HNOxU7M4vTlysFLjHptTspok+xtdUaMis=;
 b=D45qIHTFx0kDDYjR35sL18efiXqa0r8UnfEUCUssKpQX67zqat0Uwgpmm9OVO0wJnb+z7bxIXZr/gJ4RozPpMK0DLbjoWFVAwmU66mDF+080qz1fw8xMmZKNU/agF1zx0Udf1P88RsJtrRlt95J0DA1vLrklax2oIyh95YRy3gLP1ACqQl/bM+I1uJf2pUxHazj8t0YDjK4d7CWgzVRZwILoJGD116naC4QT83cpPlKOz0QxbkcUXI9QhuC9nMnTRSquWDZ0C+Bs4V/DaRm/Hv8EVCh7v7sFd9FckkQatkznyLd/uogWG7Ee7RdMNwJ1FgaaIZ0fCdyTCsP1kZfEyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8827.eurprd04.prod.outlook.com (2603:10a6:20b:40a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Mon, 18 Aug
 2025 16:28:31 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9052.011; Mon, 18 Aug 2025
 16:28:31 +0000
Date: Mon, 18 Aug 2025 12:28:25 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	"Prabhakaran, Krishna" <krishna.prabhakaran@intel.com>
Subject: Re: [PATCH v2 3/4] i3c: mipi-i3c-hci: Use physical device pointer
 with DMA API
Message-ID: <aKNUqY4h9DEAP69o@lizhi-Precision-Tower-5810>
References: <20250815141242.2013767-1-jarkko.nikula@linux.intel.com>
 <20250815141242.2013767-4-jarkko.nikula@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <20250815141242.2013767-4-jarkko.nikula@linux.intel.com>
X-ClientProxiedBy: BY3PR03CA0014.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::19) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8827:EE_
X-MS-Office365-Filtering-Correlation-Id: 9942f3b2-c634-4a78-d001-08ddde744513
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|52116014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vwaDXVo5F/nNNz4TsdEsFHHgO71Y6Eu/h5mjTP1Hb/jSSVypZZRq06+dW0pG?=
 =?us-ascii?Q?/IyRbEyu9cnmY+QuQgcWKSsFDgiCPogo5owFDT01Yw7ozhdbL69l2d1dekRh?=
 =?us-ascii?Q?YHH+3o3jKp/xF4gKv/BtMW4UuWC7J/unTgzxQiENEveZrzDMCS4kNq3457Ed?=
 =?us-ascii?Q?1oILLOpml80HpK29ybv5Vk3aTtJ/uEhJENo2GfiAcpiU8XDpXK/dC5aX81wa?=
 =?us-ascii?Q?XBKlkg4i8l+vj6b1CqeomkXrdjWOtkkTZoxan2mPOOpF3VPtagu3DWgdrysq?=
 =?us-ascii?Q?N3FzjwsrPCgPC4abkQ0RlLqCHUivwmoCbHsVcGqmDefVBAlfmeqM1frq+jJI?=
 =?us-ascii?Q?amXFxXRH7u/zOHSKu5UbfbVrISUoCbCHtufk0JG0zCDRAzaOVgH2h4OW42fc?=
 =?us-ascii?Q?JR90BhDFgUKLAybuMJcsnqg+MN5pkSgpWfoqlnzkQdhTOQ4Td20OXm/S9r4R?=
 =?us-ascii?Q?zbi3iOtODgJS7dGqJl3CVs8YRb5U2ulxoWXd48HlenP5kEll2PvXJhetxsfF?=
 =?us-ascii?Q?h8ksEetQomo4962pNM5GzWIQDc2MEplFTcDQ5Vhsv4gyQetEF/HWEqzRPduu?=
 =?us-ascii?Q?tHvq5lTAyNCfGGxYe3AE8/9GXQALHANK5wLS18LZb91oPgaI8SWkLRaH/j0A?=
 =?us-ascii?Q?Weefqt4gMWashWr2+NjATb2cZMiD3K+1bmlxJS1r2HlVoqPWIoF481tWNvtf?=
 =?us-ascii?Q?9qpsVnU3jpkBX3XenQj0RFcB3h9uRtQOK8H1nCEHK23zJFpeaMT4O2qF8sz0?=
 =?us-ascii?Q?4ZpUOTM9l6KW7+JQaIRSWdJb7vnjs6cVlK5ihqlCIz3BgE4pwhjh4Ys7I7Xz?=
 =?us-ascii?Q?z3tKMdOXMN0m1F8GBlAO4V2ZfdY1TorvEjmeRDTcIPPPjEojjNXLtAIFJHw+?=
 =?us-ascii?Q?xRuSds0TqfUKOAr9lT/201XHjwpDSpK0WuPSfJCU9QW0phltxyiUSdOB84Ga?=
 =?us-ascii?Q?Xt1qYOQZzl4WIUjVHh0ogIbp2JshVJhsn3hIvwXoWzrSFFIwk5aG+6ZQBQHA?=
 =?us-ascii?Q?euv/1nwg3NXey1XaJvxPfDrE3R11G4ejW+HrlRQYZ8q7VBCTvW4G4BkImil5?=
 =?us-ascii?Q?nXiHHkbab3bJZmJa+6v5J1r03ZEau1TkOAUKeGBAOM4STs3LgUB0csPs0ZJc?=
 =?us-ascii?Q?uMG1wPemEcsfRehvDMK2a0SBg2DAE1Lm+tmOS08lwCqnRapE/FWWXHs2r3Fg?=
 =?us-ascii?Q?rBP7BFdsvUbUAguHpPv1hqJKuzqvm8tPLPgsLPx1n9P8Om846dPdELQ6hOlb?=
 =?us-ascii?Q?AAGFkBNLgGRyZhuXqYT+Rr9nRA+5ODfCnxNNcfZr16uRBJufXhkncq0wG+LB?=
 =?us-ascii?Q?fEp5HiNW+28pw9VZIfZge1/J+a+xkdi8SF6vzZF1gSdg166xD4rVo7iyQr3g?=
 =?us-ascii?Q?KAfA5sfI9nrDlgn1kRF2hjO52MkoWQdR9DxLFXv58JLaw1mVYqalGVnOXdY6?=
 =?us-ascii?Q?ApwQQ2s17KI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(52116014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lGCzlXNu9cwj+rB7V3eJwampt4GZJAlp/yLqqsvlkhPODPJytRy8m87kVw3L?=
 =?us-ascii?Q?AkDQAujaCEvbYMqpf/Yd7Nsab0dWjtgiwVGFichjC4+m9TK44xexoXEaHUOH?=
 =?us-ascii?Q?0upIzBKBUThrRvKbNKV8UEJ/7kZH/9iP0OJTwCndK3tFuU34Uu6sZ1Onrn3H?=
 =?us-ascii?Q?TsO0Nir7hu68yfIudrtuOfWb13tghwZGPminMlcve0wluzPr+1SszMSy4Fql?=
 =?us-ascii?Q?htyKz4D9ILAHH6+CeTMdb768xs+N0/zf3/Xge6yqDIMFsPFfj4hLtbnpO0OR?=
 =?us-ascii?Q?eRYLWk514L600+uowlJ5R+qGrRtcWot0E/fnJpzSe+5tkdJ/izJgwDOpHhx5?=
 =?us-ascii?Q?JARf0n4AhDG7REI/azc1C3GYIMEv27MOupI9vemf1VfMGKwT2s4NfHF29LHZ?=
 =?us-ascii?Q?B0G0GIHW+uDiDzg0Y7knKjY52yxyovBTgg2XMm6I9VxCE4bAXb7fdNPGJKT0?=
 =?us-ascii?Q?H7WvRoey2fzCx2vE4VlXkG1dvsvK+joGG9pVkiDwmomCHEtodMPlsURyRx/g?=
 =?us-ascii?Q?QqsBsAUUfPHvCmPZq67tCC+uS3h4Pt6TY2No7d9Jylpy2bD837XarwI6AOPY?=
 =?us-ascii?Q?AGGvBvfakol25Dm+/9hZQBMJ+hvGDpXkXSNaVSZFCEsM/kO5IDi1l7JH+VlX?=
 =?us-ascii?Q?nXneYsT6zLROujzCXEVFFOuFPzI44G3gAfRt4W+xCLGNWO67Y5UD3j6prmaK?=
 =?us-ascii?Q?Koa2rniJeIsjjV4B1EnJGzAmK6dqvpuIuSIx/KTWitsONPNQRmPxVlY62bK8?=
 =?us-ascii?Q?judyWQsKDI435IntmttURbPdTYYMpfvYfWMWPHzsvnn/zTy1H0uB0BMAe9ai?=
 =?us-ascii?Q?zLTOBOiYaFdlrDJ8ZZX3KsoquYAFlUm+u3nUHsOEpQEu2Wztv+3KbueZUrpm?=
 =?us-ascii?Q?t/liYOTdhLCC995ORoC66zhQodl1W3kNa8ao6IiyxQAiSATXPuyEnpqWDqvr?=
 =?us-ascii?Q?39/fLdHxxhnBgKSwgN19kWbVbUvzWFxBXOJ4nNLQrZdqEkmRSNkczDQVTMsU?=
 =?us-ascii?Q?DimUCQqjAVixqM5F+NY9qohBYml456oUJznHIz/F5isseiWv4d06+8kaIfJq?=
 =?us-ascii?Q?2jCnReLw+dOLngT6FJVjd725Ka3f/VKA9f1kl7rN+PG1ZBekcN7x7rrz6DEe?=
 =?us-ascii?Q?ef0ecotp1PSGsk5l42tY6Yg9q7RIkKKBVz6vCq3BYA93HAx9aF/IoznzBLjX?=
 =?us-ascii?Q?Zge89wogWSku+bXAQtYvWK2EVxJoZw7fFNJgByZCZoInH388WaL2I5VRScRl?=
 =?us-ascii?Q?Qgts+AzuHi9/h58GBzpLYNVezIL9KTRZ/htcasXBhdXz7k9Z6DefBzoaLqeq?=
 =?us-ascii?Q?D+Q1A3RPHNKgNCPElLg7jTatF6iowRq6E+owDEFFdmW6ks3hMg2r7ybtUnSZ?=
 =?us-ascii?Q?aAYW03Y3ATLjaaQuGmJdX7oIOK6t40QWS5KUJqXf/1UTt0ey5NbcU2p6ZDmt?=
 =?us-ascii?Q?SiJhK9ZPjuEDq39urHOHL8Qkb93d/ycj4N6FtT49+IYLRNENNY0xkcv/9Emi?=
 =?us-ascii?Q?6y6OuxGmj+FjNiYflx6OiGq5H4HLPA8hWsYZp4Tx0xUz8hWojePC4V5pjEo7?=
 =?us-ascii?Q?Hlwyzcrhi0yytAHFjs1K/IfpR0lJo1Pt4E6xTVRL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9942f3b2-c634-4a78-d001-08ddde744513
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 16:28:31.4474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: glXG4ds+S6M+lZ7cCiCxpoHeLanb+CwiCxk9V2nzwUeU4xLKOWvLsZiPNw2hTEy/kC2+6ZtskAwWGQRdpFnEZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8827
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_092837_332677_88655972 
X-CRM114-Status: GOOD (  29.44  )
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

On Fri, Aug 15, 2025 at 05:12:41PM +0300, Jarkko Nikula wrote:
> DMA transfer faults on Intel hardware when the IOMMU is enabled and
> driver initialization will fail when attempting to do the first transfer:
>
> 	DMAR: DRHD: handling fault status reg 2
> 	DMAR: [DMA Read NO_PASID] Request device [00:11.0] fault addr 0x676e3000 [fault reason 0x71] SM: Present bit in first-level paging entry is clear
>  	i3c mipi-i3c-hci.0: ring 0: Transfer Aborted
> 	mipi-i3c-hci mipi-i3c-hci.0: probe with driver mipi-i3c-hci failed with error -62
>
> Reason for this is that the IOMMU setup is done for the physical devices
> only and not for the virtual I3C Controller device object.
>
> Therefore use the pointer to a physical device object with the DMA API.
>
> Due to a data corruption observation when the device DMA is IOMMU
> mapped, a properly sized receive bounce buffer is required if transfer
> length is not a multiple of DWORDs.
>
> Reported-by: Prabhakaran, Krishna <krishna.prabhakaran@intel.com>
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> ---
>  drivers/i3c/master/mipi-i3c-hci/dma.c | 46 +++++++++++++++++++--------
>  1 file changed, 33 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> index 295671daae09..8cea91d4d3bf 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> @@ -14,6 +14,7 @@
>  #include <linux/errno.h>
>  #include <linux/i3c/master.h>
>  #include <linux/io.h>
> +#include <linux/pci.h>
>
>  #include "hci.h"
>  #include "cmd.h"
> @@ -138,6 +139,7 @@ struct hci_rh_data {
>  };
>
>  struct hci_rings_data {
> +	struct device *sysdev;
>  	unsigned int total;
>  	struct hci_rh_data headers[] __counted_by(total);
>  };
> @@ -165,20 +167,20 @@ static void hci_dma_cleanup(struct i3c_hci *hci)
>  		rh_reg_write(IBI_SETUP, 0);
>
>  		if (rh->xfer)
> -			dma_free_coherent(&hci->master.dev,
> +			dma_free_coherent(rings->sysdev,
>  					  rh->xfer_struct_sz * rh->xfer_entries,
>  					  rh->xfer, rh->xfer_dma);
>  		if (rh->resp)
> -			dma_free_coherent(&hci->master.dev,
> +			dma_free_coherent(rings->sysdev,
>  					  rh->resp_struct_sz * rh->xfer_entries,
>  					  rh->resp, rh->resp_dma);
>  		kfree(rh->src_xfers);
>  		if (rh->ibi_status)
> -			dma_free_coherent(&hci->master.dev,
> +			dma_free_coherent(rings->sysdev,
>  					  rh->ibi_status_sz * rh->ibi_status_entries,
>  					  rh->ibi_status, rh->ibi_status_dma);
>  		if (rh->ibi_data_dma)
> -			dma_unmap_single(&hci->master.dev, rh->ibi_data_dma,
> +			dma_unmap_single(rings->sysdev, rh->ibi_data_dma,
>  					 rh->ibi_chunk_sz * rh->ibi_chunks_total,
>  					 DMA_FROM_DEVICE);
>  		kfree(rh->ibi_data);
> @@ -194,11 +196,23 @@ static int hci_dma_init(struct i3c_hci *hci)
>  {
>  	struct hci_rings_data *rings;
>  	struct hci_rh_data *rh;
> +	struct device *sysdev;
>  	u32 regval;
>  	unsigned int i, nr_rings, xfers_sz, resps_sz;
>  	unsigned int ibi_status_ring_sz, ibi_data_ring_sz;
>  	int ret;
>
> +	/*
> +	 * Set pointer to a physical device that does DMA and has IOMMU setup
> +	 * done for it in case of enabled IOMMU and use it with the DMA API.
> +	 * Here such device is either
> +	 * "mipi-i3c-hci" platform device (OF/ACPI enumeration) parent or
> +	 * grandparent (PCI enumeration).
> +	 */
> +	sysdev = hci->master.dev.parent;
> +	if (sysdev->parent && dev_is_pci(sysdev->parent))
> +		sysdev = sysdev->parent;
> +
>  	regval = rhs_reg_read(CONTROL);
>  	nr_rings = FIELD_GET(MAX_HEADER_COUNT_CAP, regval);
>  	dev_info(&hci->master.dev, "%d DMA rings available\n", nr_rings);
> @@ -213,6 +227,7 @@ static int hci_dma_init(struct i3c_hci *hci)
>  		return -ENOMEM;
>  	hci->io_data = rings;
>  	rings->total = nr_rings;
> +	rings->sysdev = sysdev;
>
>  	regval = FIELD_PREP(MAX_HEADER_COUNT, rings->total);
>  	rhs_reg_write(CONTROL, regval);
> @@ -239,9 +254,9 @@ static int hci_dma_init(struct i3c_hci *hci)
>  		xfers_sz = rh->xfer_struct_sz * rh->xfer_entries;
>  		resps_sz = rh->resp_struct_sz * rh->xfer_entries;
>
> -		rh->xfer = dma_alloc_coherent(&hci->master.dev, xfers_sz,
> +		rh->xfer = dma_alloc_coherent(rings->sysdev, xfers_sz,
>  					      &rh->xfer_dma, GFP_KERNEL);
> -		rh->resp = dma_alloc_coherent(&hci->master.dev, resps_sz,
> +		rh->resp = dma_alloc_coherent(rings->sysdev, resps_sz,
>  					      &rh->resp_dma, GFP_KERNEL);
>  		rh->src_xfers =
>  			kmalloc_array(rh->xfer_entries, sizeof(*rh->src_xfers),
> @@ -295,16 +310,16 @@ static int hci_dma_init(struct i3c_hci *hci)
>  		ibi_data_ring_sz = rh->ibi_chunk_sz * rh->ibi_chunks_total;
>
>  		rh->ibi_status =
> -			dma_alloc_coherent(&hci->master.dev, ibi_status_ring_sz,
> +			dma_alloc_coherent(rings->sysdev, ibi_status_ring_sz,
>  					   &rh->ibi_status_dma, GFP_KERNEL);
>  		rh->ibi_data = kmalloc(ibi_data_ring_sz, GFP_KERNEL);
>  		ret = -ENOMEM;
>  		if (!rh->ibi_status || !rh->ibi_data)
>  			goto err_out;
>  		rh->ibi_data_dma =
> -			dma_map_single(&hci->master.dev, rh->ibi_data,
> +			dma_map_single(rings->sysdev, rh->ibi_data,
>  				       ibi_data_ring_sz, DMA_FROM_DEVICE);
> -		if (dma_mapping_error(&hci->master.dev, rh->ibi_data_dma)) {
> +		if (dma_mapping_error(rings->sysdev, rh->ibi_data_dma)) {
>  			rh->ibi_data_dma = 0;
>  			ret = -ENOMEM;
>  			goto err_out;
> @@ -369,6 +384,7 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
>  		u32 *ring_data = rh->xfer + rh->xfer_struct_sz * enqueue_ptr;
>  		enum dma_data_direction dir = xfer->rnw ? DMA_FROM_DEVICE :
>  							  DMA_TO_DEVICE;
> +		bool need_bounce;
>
>  		/* store cmd descriptor */
>  		*ring_data++ = xfer->cmd_desc[0];
> @@ -387,10 +403,13 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
>
>  		/* 2nd and 3rd words of Data Buffer Descriptor Structure */
>  		if (xfer->data) {
> -			xfer->dma = i3c_master_dma_map_single(&hci->master.dev,
> +			need_bounce = device_iommu_mapped(rings->sysdev) &&
> +				      xfer->rnw &&

why only read need bounce? if iommu have not map enough size, still fault
for write.

such as you try to map IO space [0xffd,0x1000). when hardware try access
0x1000, iommu will capture this type error. Maybe it is hard to meet
allocate io space at close end of page, you have not found this problem.

Frank

> +				      xfer->data_len != ALIGN(xfer->data_len, 4);
> +			xfer->dma = i3c_master_dma_map_single(rings->sysdev,
>  							      xfer->data,
>  							      xfer->data_len,
> -							      false,
> +							      need_bounce,
>  							      dir);
>  			if (!xfer->dma) {
>  				hci_dma_unmap_xfer(hci, xfer_list, i);
> @@ -578,6 +597,7 @@ static void hci_dma_recycle_ibi_slot(struct i3c_hci *hci,
>
>  static void hci_dma_process_ibi(struct i3c_hci *hci, struct hci_rh_data *rh)
>  {
> +	struct hci_rings_data *rings = hci->io_data;
>  	struct i3c_dev_desc *dev;
>  	struct i3c_hci_dev_data *dev_data;
>  	struct hci_dma_dev_ibi_data *dev_ibi;
> @@ -688,7 +708,7 @@ static void hci_dma_process_ibi(struct i3c_hci *hci, struct hci_rh_data *rh)
>  			* rh->ibi_chunk_sz;
>  	if (first_part > ibi_size)
>  		first_part = ibi_size;
> -	dma_sync_single_for_cpu(&hci->master.dev, ring_ibi_data_dma,
> +	dma_sync_single_for_cpu(rings->sysdev, ring_ibi_data_dma,
>  				first_part, DMA_FROM_DEVICE);
>  	memcpy(slot->data, ring_ibi_data, first_part);
>
> @@ -697,7 +717,7 @@ static void hci_dma_process_ibi(struct i3c_hci *hci, struct hci_rh_data *rh)
>  		/* we wrap back to the start and copy remaining data */
>  		ring_ibi_data = rh->ibi_data;
>  		ring_ibi_data_dma = rh->ibi_data_dma;
> -		dma_sync_single_for_cpu(&hci->master.dev, ring_ibi_data_dma,
> +		dma_sync_single_for_cpu(rings->sysdev, ring_ibi_data_dma,
>  					ibi_size - first_part, DMA_FROM_DEVICE);
>  		memcpy(slot->data + first_part, ring_ibi_data,
>  		       ibi_size - first_part);
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
