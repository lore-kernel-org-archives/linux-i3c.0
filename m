Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A729ED41D65
	for <linux-i3c@archiver.kernel.org>; Thu, 11 Dec 2025 16:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hxNG4qinISo7UiqK6ug+QlkD+p+p/pG7ITBOKFBFNBs=; b=Im/xNZ76HhZhsJ
	NiUAgAYdFGhnVFq5P1Ywdb+eOyHILicZesjQWlkldpjYW20B96sLB/nFparxYC2fQIOa+ZIiMGp0V
	0WqZrp/JPolMRi99EWFl39DhkBrlbkU9oujhpOXPcvV3JVWjpWVkyBP92Q0VNuZDrSEVk3EOcWKti
	Gj9kwgeVNLyCBlgJ7GTwFpPD/5mUDbJfL9yCVYCJoagwXmLyVAOCHfVpXCGmZIfNaMu5DDQfGiiha
	2nOfXkBVUBngIgPcQNZemL/CmcbFr5J23J8ZgGVMXyBx5zSWsyQEjHtUT7IGyQtUHYK5ZtQpnAlhK
	PI6qDyfJj91Px3BLVWAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTjMx-0000000Gp9c-1SRF;
	Thu, 11 Dec 2025 16:18:19 +0000
Received: from mail-westeuropeazon11011046.outbound.protection.outlook.com ([52.101.70.46] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTjMu-0000000Gp95-1BLT
	for linux-i3c@lists.infradead.org;
	Thu, 11 Dec 2025 16:18:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aImJ0ratcME6L2thB7va8t39oeCUqajj/oUAHMrtmsGILml32+nN1QQnupTBHU/gqdLYvpkWCBYBGcUI/CmKVJc//qtQoA1AdYArx+oG2IsyjOWsCasTP1U0kNJ/i318m1WA8atJjdPY87EvNP9Mk8cKUxm37hXYDReAR64Rih+bLxnpe4SPSY6ewdxzK+j8yJGcyjh2AM5FXX2z4txmt0qHMYotR6/dwsKM/+f8X7cIX6wLfjo/t8W7rL/yxgyhzif672OKYtH3XyAyaNdhXk0gBT6iUtk8gPWr4EuBk318UKWYKa4gypUChORG1GcfCDzzOoz4FhwK+1YSkaFewg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4xD6fgr1Yz2DDW+uPjeA2veF8af0bppHJHOk08bgPUw=;
 b=IMZaM6QExIYUSOh2+a2XqNSl6oDk/eFpgZtUFUITedDpA1J0UImJ6fM53nj+DhOr2nYrRVYahrkFiDRoHAQg2AcYcwyvhVRRT4dCmwclQtmjfrfpvcnEn7pi5oe2XJojFwxOZ8Kqa2OzxIr1NMnMhg0hr681HHrTZBT9Kkk4fHfOE/IaBHtIxgoCc+oL6nBikngTl6I/9v8ltCFv4CJ7di+B+fsPi6D/zHAsm48+V81TbcXcZ5nlTlqalXQYgdJFsRiQgg/ZTCMqmWUcs/ehO2ONfjvgO88jpPaPylRphFG4NIq11XCcA3kJU0IWgxJ/hsw3cM7WsEpiauz/VwLAPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4xD6fgr1Yz2DDW+uPjeA2veF8af0bppHJHOk08bgPUw=;
 b=hErWI1O1Xu0r6v43RbkyfVW2WvHfGPRrK0CeExAl0AtwK1o7krXsPTsIkAHH4Keq987/FkQwHIR577fh/gt4hB8/u8MUiio1Vje6uAnvhkWRruI8FGCqJQxNfo580Y3qSef8LuZ93jG1ULBTJlZ8qapRT6rwLlYMTgiulzOhfLiE4Kw8vbzPFdvHoMaTwYiVVYLvuW7UogpahCeiwVQQxX7YbkIr94tjS5TqZtuPgkWpZtXU5we9sD2xSVC2yt0ePJnwqzSsKWD1MQKUrGpWkPFM93+ucXDQSe4E2qIRr4FPIWPcnpnlzR5IZGdSmrmEMu50diF1RVTzlIUxv0hCzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by PAXPR04MB8317.eurprd04.prod.outlook.com (2603:10a6:102:1ce::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Thu, 11 Dec
 2025 16:18:11 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 16:18:11 +0000
Date: Thu, 11 Dec 2025 11:18:05 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V2 08/10] i3c: mipi-i3c-hci-pci: Convert to MFD driver
Message-ID: <aTruvSnXN4KNAXWp@lizhi-Precision-Tower-5810>
References: <20251211134809.75872-1-adrian.hunter@intel.com>
 <20251211134809.75872-9-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20251211134809.75872-9-adrian.hunter@intel.com>
X-ClientProxiedBy: PH8PR15CA0017.namprd15.prod.outlook.com
 (2603:10b6:510:2d2::7) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|PAXPR04MB8317:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a149021-6e48-47c0-afc9-08de38d0e122
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Rft2T8Y32ID0DxyNmSzm+C/9WhcLK/s/OQrrReXmw07dN/8D/I3PXAQcP3n0?=
 =?us-ascii?Q?TrhW/tnLnIegeEaFnYaWwLTCPRh7sAMR3CSPLy95u3Z5PRa3TFCk/UWFHHP3?=
 =?us-ascii?Q?9Blpm7XyqZ8Za3LP+i5TbFxpmJXii88c4yq7ZMtzIbqcCzDoYyauKTlvlI0A?=
 =?us-ascii?Q?QI0egVjS6RqWLvS27aDyHZ7KAzXFXmlYvk5gTUHzBbKGkkB/LV1Wb5hchB12?=
 =?us-ascii?Q?Wckac/2UzMdiR2+MRDkzg7cN2tYeMLbZMlyHYcCPplNuq5TzHgeuFS9acLzc?=
 =?us-ascii?Q?CTDRsczaEthfIgGLpCWYPR2S/KxYETHeiQz4KIPlWw55MPxV3IZnBC+/xCjY?=
 =?us-ascii?Q?lXboF2x2OSTQC0EW9uPiHA0tDeQRA/Irlg/uEFej/ut9W6dBJGqDG3wZMrwS?=
 =?us-ascii?Q?0esr6AvbuJCni3r7rI4pfwn9zTHOLGgIZ4/DCkNwWixSSqbOFbIt8ebxgM7A?=
 =?us-ascii?Q?T8CvW5FJhLeR56STs/oo4K0PrZGYhFD6jet0qPNPtCJ+Vq6MLAiX0k8GcRpi?=
 =?us-ascii?Q?+O9DuOn18amyR6RMz/cdPtNq7LwvE+KgpxLwZocpg9+mP6Qgopq3sIWxFu4U?=
 =?us-ascii?Q?Nh/P5y6ZY6+9w6Q/CWHHtCAyYn4A18aLc4kKv2dz9xT4DPd1yveybpBrjA/N?=
 =?us-ascii?Q?s2JRQhOp2215Xk8y+hAKZfSIuJUHkPigqLQB0AwUwy8cvUbVSJVOVyQCxEwd?=
 =?us-ascii?Q?1finc6grdqoXWTEzSSMI64zGlnHIq76ijn+R2ovIUWNQJ47/0spNwpExahfG?=
 =?us-ascii?Q?Euqco8APsdJqmmXQGpc9toaVrj96wdSKIe1mQ2Ph0MQwuI3xaAFGT6ueveE2?=
 =?us-ascii?Q?lIHKTgAslLLyQnM3RbcxIiXMJNOy3gnyKYwIBZRm4pHnKz7zTrGOriF7s9QS?=
 =?us-ascii?Q?7Ok3uyFGpHSF7OLw0y6ZRX1pZ9B19SbqCAdE91zR/5wROqhmQdPWjTFLciqH?=
 =?us-ascii?Q?AJF64tQ2JcLmpcxDD3KC/LgeKkfH+C4jZqBhZ6hs85QKPfpHr3lbCg/lfNLj?=
 =?us-ascii?Q?Tc8Nc1aJzxAgJTZeVQ7dfetu2DH8bT2LzLIFG3ERysrqKXrSVeG9tdcOcJCr?=
 =?us-ascii?Q?AEbC/5Nx682IHY4rzT4Zxru/OI40mbmvHYeMKAffhJuMQPWOzoNr/QHz6+8M?=
 =?us-ascii?Q?+8jtLdy6igB3ZWxrOTpzPGVAZeEOcXk6iDTmBsRldw1owo6+SFs17g6JTeKu?=
 =?us-ascii?Q?n+lTxbpPX2v/8+HRw/wxTG4iJcL8ng+4xmSGQ6yRVLrZoS/3Ipr/rxU2R5/7?=
 =?us-ascii?Q?Bfv4YwZA7FNRE1ay7eDPGD5iUrmZc+dZTR+AH7jQrBIGyCM7uR5uUHm2zWsB?=
 =?us-ascii?Q?V5iDJ1JkbZswsANlTuFgeXD+itgYZ4ultmxbDuhibtEbg59rAy/+DNpqgmEL?=
 =?us-ascii?Q?PyBolDwKvcVLGvY0Lh1G4Jlb9TK1oms+IxRY3XjuxnUg4xk73LZfM+HFMDmU?=
 =?us-ascii?Q?C9Nu9LXsEqe6Lei/2qoG5Xnh4ttrVYibO5XqTUyn70Xh/uOlLbidsOtQGvXU?=
 =?us-ascii?Q?J2edDUuAfJVcy8TzZLULYSu9kZ5I9qAXi0of?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i8+lWUqvgq5tAoH5N/ZzeSNndzgnt5faNypxl84/VZN6fvPGd4+rzWInDK4N?=
 =?us-ascii?Q?PAk5HSLUpv1hjHrbvuNZEoVzSb9uJKJkH7O63WHmq5kESDwp1sJsXgP8XIse?=
 =?us-ascii?Q?wei+cCo39Ku9yyZye0CBIiKu2HgZdFkNooOWb1cjGl7q3OTDL4mG+C3ZT65u?=
 =?us-ascii?Q?zXtRf5vjmNxybs04LyEfG4UIGVMTff9prC0V5wSUDf/uxrvuk/hC83yYUdbu?=
 =?us-ascii?Q?k18xJLH620KhYgeHvDOBxhRXjlPqBFxB17cOwgR9MnPoWBGSicA279Qy1Jus?=
 =?us-ascii?Q?KS9DaXXJjfpm30OmauIhL8NZE8Z2PugdUbS+03NRXmWGYvexqM6aEeb9z9Ta?=
 =?us-ascii?Q?lEczRbtf152PMAGu8S/8pMnUdNm2ff9n86gh2z8vsM5QXKh4A/9rRqSqGVpl?=
 =?us-ascii?Q?zHoI+wQz9KFwJ5o1VjFJI2Ep41aVDbcp3sjktMy14n5GxUrmQW3rBz8bKFk9?=
 =?us-ascii?Q?s0FwmyYPlKKbPDtN08/dsW+VmKwxZyivAKwtezVY4w0aRbyuh5LEWXCHf0sz?=
 =?us-ascii?Q?7BQFPutdXlnRjJLlO/BB0DYA/iEkumTMGN5CMGXcQiQhDJ8FxwfF9hP73REB?=
 =?us-ascii?Q?hfzUi95vN6QR2FGO+vO3J2PPRzD2Bjx1DZmyrCpI4j9vksjwc1xo4cjcQWQq?=
 =?us-ascii?Q?iusCnFas4YXl4thqQ8Y3kth2YGxy9vpGQZp5IGjra6NFFjKJNe3vB5h9aAHc?=
 =?us-ascii?Q?fv+pxoxWbaC+1lQEXM+qo3yaj03yTmBKXnr4GWu1ihxmMLHTk9t/uiYRkFdR?=
 =?us-ascii?Q?1Q3YlG1vesa5v7AjVqwzVJhye5SBFN2XHa1HtSST4iAiaW19Mt98+dL8BuAS?=
 =?us-ascii?Q?/9SHL4flQzOXMRZdXgRIIFo7Pd50lv2yfOtu3juNXIGKcSUkCwGWc5jgYYVo?=
 =?us-ascii?Q?lUVnSAo3aa3+9hK3TZq0Iny0JnktOHyAYhJxHCwE7ZYvsYqY2mQGAt/SPilS?=
 =?us-ascii?Q?obxh4W1s+pR8cSz2ly1IO5r8tffEviAcVSZHsGUmMz0XPISsA/Oqnj2GYFMR?=
 =?us-ascii?Q?rmzcubUgQng6qXNbetsL6vduq+58fo0AbxHddg+POYxbkQU2xHtpVRD9ZBrQ?=
 =?us-ascii?Q?ok0vJYJ0DK9E1R1f2nVHgPmroBbw/Q7CtHzpjO2KP0fOxWSPow1Gm+PNuqdi?=
 =?us-ascii?Q?hDsclzLR1Ibf9k3j25+eV9mAVzH/3qsZg+R5avpidh1txIS5BqvzxG4aRudq?=
 =?us-ascii?Q?PbxjgyD/gtMrvHliFl8GH/zYBUzbrl/DKpbXT/T1hb3b+3W04tvrJLlf3AoF?=
 =?us-ascii?Q?CW0uA7R76+lHaRBQPgXjlt+81daJYTrc5bicrkilwgbknw9w781LUPsoi4Cs?=
 =?us-ascii?Q?2T73OiBfTIVMhyFGObJqt8vE6tI5XZzqEn2xabLWamNw3nNULW/qbdHoqJV+?=
 =?us-ascii?Q?OQM1yYn1RxqR+dWDVVAAscc6B8BuYqAqz+Fp3ZKGGnhlFnBdkn3t8966NjUi?=
 =?us-ascii?Q?bmOfocvLH/rzCr7swWpPH1UghZHmtDrl0uBBQ9sj7ajNUz8XIve5623e8/jl?=
 =?us-ascii?Q?KgLQxJrWU8I6jB+h9UxRGDsQofonP/EsZH+FHFlG+0pDfbGZbUivMWkbLfaM?=
 =?us-ascii?Q?jsVwsNPw4aRuOfBdoKtYVjjIsLWunaPiGJRj3o2O?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a149021-6e48-47c0-afc9-08de38d0e122
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 16:18:11.6301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PKqdGVa5/g15MX2BTOndric1IAtBAsC+aXIUKGw7SfT1pX3Wbz2M+Dl30oCaA6giCRpEVbzr6KDc7Vs5LGkPug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8317
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_081816_326670_91F20FEC 
X-CRM114-Status: GOOD (  26.01  )
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

On Thu, Dec 11, 2025 at 03:48:07PM +0200, Adrian Hunter wrote:
> Prepare for Multi-Bus instance support.  Convert to MFD driver but still
> support only 1 instance.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>
> Changes in V2:
> 	New patch split from "i3c: mipi-i3c-hci-pci: Add support for
> 	Multi-Bus Instances"
>
>
>  drivers/i3c/master/Kconfig                    |   1 +
>  .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    | 100 ++++++++++--------
>  2 files changed, 58 insertions(+), 43 deletions(-)
>
> diff --git a/drivers/i3c/master/Kconfig b/drivers/i3c/master/Kconfig
> index 82cf330778d5..2609f2b18e0a 100644
> --- a/drivers/i3c/master/Kconfig
> +++ b/drivers/i3c/master/Kconfig
> @@ -69,6 +69,7 @@ config MIPI_I3C_HCI_PCI
>  	tristate "MIPI I3C Host Controller Interface PCI support"
>  	depends on MIPI_I3C_HCI
>  	depends on PCI
> +	select MFD_CORE
>  	help
>  	  Support for MIPI I3C Host Controller Interface compatible hardware
>  	  on the PCI bus.
> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> index 0180d99a37e4..68088967942b 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> @@ -12,6 +12,7 @@
>  #include <linux/idr.h>
>  #include <linux/iopoll.h>
>  #include <linux/kernel.h>
> +#include <linux/mfd/core.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
>  #include <linux/platform_data/mipi-i3c-hci.h>
> @@ -20,8 +21,8 @@
>
>  struct mipi_i3c_hci_pci {
>  	struct pci_dev *pci;
> -	struct platform_device *pdev;
>  	void __iomem *base;
> +	int dev_id;
>  	const struct mipi_i3c_hci_pci_info *info;
>  	void *private;
>  };
> @@ -178,13 +179,59 @@ static const struct mipi_i3c_hci_pci_info intel_info = {
>  	.exit = intel_i3c_exit,
>  };
>
> +struct mipi_i3c_hci_pci_cell_data {
> +	struct mipi_i3c_hci_platform_data pdata;
> +	struct resource res;
> +};
> +
> +static void mipi_i3c_hci_pci_setup_cell(struct mipi_i3c_hci_pci *hci,
> +					struct mipi_i3c_hci_pci_cell_data *data,
> +					struct mfd_cell *cell)
> +{
> +	data->pdata.base_regs = hci->base;
> +
> +	data->res = DEFINE_RES_IRQ(0);
> +
> +	cell->name = "mipi-i3c-hci";
> +	cell->id = hci->dev_id;
> +	cell->platform_data = &data->pdata;
> +	cell->pdata_size = sizeof(data->pdata);
> +	cell->num_resources = 1;
> +	cell->resources = &data->res;
> +}
> +
> +static int mipi_i3c_hci_pci_add_instances(struct mipi_i3c_hci_pci *hci)
> +{
> +	struct mipi_i3c_hci_pci_cell_data *data __free(kfree) = kzalloc(sizeof(*data), GFP_KERNEL);
> +	struct mfd_cell *cells __free(kfree) = kzalloc(sizeof(*cells), GFP_KERNEL);
> +	int irq = pci_irq_vector(hci->pci, 0);
> +	int ret;
> +
> +	if (!cells || !data)
> +		return -ENOMEM;
> +
> +	hci->dev_id = ida_alloc(&mipi_i3c_hci_pci_ida, GFP_KERNEL);
> +	if (hci->dev_id < 0)
> +		return hci->dev_id;
> +
> +	mipi_i3c_hci_pci_setup_cell(hci, data, cells);
> +
> +	ret = mfd_add_devices(&hci->pci->dev, 0, cells, 1, NULL, irq, NULL);
> +	if (ret)
> +		goto err_free_ids;
> +
> +	return 0;
> +
> +err_free_ids:
> +	ida_free(&mipi_i3c_hci_pci_ida, hci->dev_id);
> +	return ret;
> +}
> +
>  static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>  				  const struct pci_device_id *id)
>  {
> -	struct mipi_i3c_hci_platform_data pdata = {};
>  	struct mipi_i3c_hci_pci *hci;
> -	struct resource res;
> -	int dev_id, ret;
> +	int ret;
>
>  	hci = devm_kzalloc(&pci->dev, sizeof(*hci), GFP_KERNEL);
>  	if (!hci)
> @@ -206,41 +253,13 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>  	if (ret < 0)
>  		return ret;
>
> -	memset(&res, 0, sizeof(res));
> -
> -	res.flags = IORESOURCE_IRQ;
> -	res.start = pci_irq_vector(hci->pci, 0);
> -	res.end = res.start;
> -
> -	dev_id = ida_alloc(&mipi_i3c_hci_pci_ida, GFP_KERNEL);
> -	if (dev_id < 0)
> -		return dev_id;
> -
> -	hci->pdev = platform_device_alloc("mipi-i3c-hci", dev_id);
> -	if (!hci->pdev)
> -		return -ENOMEM;
> -
> -	hci->pdev->dev.parent = &pci->dev;
> -	device_set_node(&hci->pdev->dev, dev_fwnode(&pci->dev));
> -
> -	ret = platform_device_add_resources(hci->pdev, &res, 1);
> -	if (ret)
> -		goto err;
> -
> -	pdata.base_regs = hci->base;
> +	hci->info = (const struct mipi_i3c_hci_pci_info *)id->driver_data;
>
> -	ret = platform_device_add_data(hci->pdev, &pdata, sizeof(pdata));
> +	ret = hci->info->init ? hci->info->init(hci) : 0;
>  	if (ret)
> -		goto err;
> -
> -	hci->info = (const struct mipi_i3c_hci_pci_info *)id->driver_data;
> -	if (hci->info->init) {
> -		ret = hci->info->init(hci);
> -		if (ret)
> -			goto err;
> -	}
> +		return ret;
>
> -	ret = platform_device_add(hci->pdev);
> +	ret = mipi_i3c_hci_pci_add_instances(hci);
>  	if (ret)
>  		goto err_exit;
>
> @@ -251,23 +270,18 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>  err_exit:
>  	if (hci->info->exit)
>  		hci->info->exit(hci);
> -err:
> -	platform_device_put(hci->pdev);
> -	ida_free(&mipi_i3c_hci_pci_ida, dev_id);
>  	return ret;
>  }
>
>  static void mipi_i3c_hci_pci_remove(struct pci_dev *pci)
>  {
>  	struct mipi_i3c_hci_pci *hci = pci_get_drvdata(pci);
> -	struct platform_device *pdev = hci->pdev;
> -	int dev_id = pdev->id;
>
>  	if (hci->info->exit)
>  		hci->info->exit(hci);
>
> -	platform_device_unregister(pdev);
> -	ida_free(&mipi_i3c_hci_pci_ida, dev_id);
> +	mfd_remove_devices(&pci->dev);
> +	ida_free(&mipi_i3c_hci_pci_ida, hci->dev_id);
>  }
>
>  static const struct pci_device_id mipi_i3c_hci_pci_devices[] = {
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
