Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F784C53219
	for <linux-i3c@archiver.kernel.org>; Tue, 28 Jul 2026 20:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8xClZPWJx/R4q168LBJLErEVTrHePVL3lTcyebVbrSU=; b=PHrV+q4Q+zaPQJ
	x9RWHqnGGzcApgkkVzby2+qI0ZdHc8BbGqyr1hIv67gqeFZBZtbDbnKxS4rnLvfnV+/VHzT7v8RfG
	S+3Fcy+NZm0Oxvwwsoz7sqPSnvFTgLLVD5TC/7kUOMLSxqBP29jotKrCLdV/j4CHZr1lFQCdfL7E1
	42alsCrSaPBFLfEC1RWarOe+93M25LK9+jWMTKeJNk77xqllcemGJ0kyjpOKcfdtlADE/uNT/mek7
	euc/qmO6sg0Sf1yUjwHIsjlN7EZJ0sg5KvRQ1zq1Jg6DLoj1NRVZuJAA+8KGjSMuldXVAzzbS54BV
	y+cFpCgPf3vOsvh0ObOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woo8F-00000006CFL-3UIk;
	Tue, 28 Jul 2026 20:10:31 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woo8D-00000006CEx-2cjG
	for linux-i3c@lists.infradead.org;
	Tue, 28 Jul 2026 20:10:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R/c/BYHPrEblem3ysW6B9c8uFnrmxVnbTYY1+F1MkVcbzl3YEpVXRveqqldKVO60jH5tuaF2XMsW2n8Xjs+tkpxaSQbKz3tCknVxPkex+yuOOTdl5SddddFh8iGJM/+SyC38KZ85VvXZGHUwnc7FZe8DdXuU6W1fRK37ZhSuY0U6vZ/ddrBWCM0gsiJqg9kENC+D2Z4VSZPm5Dpn/3GkwEOz/h3dGm35q8K2usQsdo47yj2UVCjF8vmdtVa1SqkuxB4V2pzsHFaksYd8n42gozYJKKgQQf/baTS3nCp+PYxt8tmmNLZiVSgODOB/jlEMaoxqo5ea0Hx6LENvccEYLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DdeCdq5zHPpdaOFROO5tBuo5JzTq/sIYwqGGdeqFeKU=;
 b=dEnzn2yCGVMaNqZoUH+mpXHsMgfPZ/X/SvlqDFHssSgK9HEtyzRsdlw8UASVsZ2FYXeeTtZi9bVcB7p+yDS84s3qF4b1dry2OwjK6tI/2RCmJJfiiUb5ZcZhSn4rmjMzYXLQf/8o9cWO+kHXWnVOrESWuAq1uaBhvhQALr6dtmxm3e8mqh6VdeQxe6BM3ur172ZUmlsT/04yV2p/LNJuev/Shbqy7Yfy1jlpqOq8utT/Nc8LnMws2SUbwkuR8HexgQ5+mHRDZ68iB+9WpW1oKxnFJ+/d/TI6yo3rfgUfRajmZt/81CC7OKVRaHrcAHvOcV4Ey5ALSwFUE9npUPI0xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DdeCdq5zHPpdaOFROO5tBuo5JzTq/sIYwqGGdeqFeKU=;
 b=MZOLt7vLgYwxFTwKb8NNxPPHEXluvaUA7FceBWmSfnskUGb+NXEpr8DV+737XjJSrO/nh4ixRE0ToVKLj6L68e5yLY091lS+R0FW1XYLaMdQgQDBR0as8Wyh9/TS0gABJ9w9kQm2GdEoNbw8ciNSqPRbPN9lFHrboPJ3fMYtf3fZn1QYwB6dpFjc+MebH89SJ51911rd77juaOJBrkaAtdRY2F/0CtK5tAzzQfVNM4vS+ngr76PALI5u/bJDVLlfj/fhQMcdxWDpIbDJPPYzxnhSL3/ZTOJ1VurZUc0Au/yZ7+pGmOATs9wdV+qWXc3sj5LrAA1/A2n/XAdW49tUog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA1PR04MB11084.eurprd04.prod.outlook.com (2603:10a6:102:492::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 20:10:25 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 20:10:25 +0000
Date: Tue, 28 Jul 2026 16:10:18 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com, rafael@kernel.org,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH V2 7/8] i3c: mipi-i3c-hci: Factor out i3c_hci_sysdev()
Message-ID: <amkMqm-o8OSeF9Yr@lizhi-Precision-Tower-5810>
References: <20260728155308.142713-1-adrian.hunter@intel.com>
 <20260728155308.142713-8-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260728155308.142713-8-adrian.hunter@intel.com>
X-ClientProxiedBy: PH7PR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:510:339::12) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA1PR04MB11084:EE_
X-MS-Office365-Filtering-Correlation-Id: 99201e20-c0a4-44b9-25e8-08deece442e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|19092799006|366016|4143699003|11063799006|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: JCNEzuv5xwBz8y2cJ3C8pMoKu9QIWtV7B7ZxHqzo+XivDgoFmGHw9dMnVBIhP8/rnptRv75NpYAM7WotsZBaZIrBGovW4AKgZTwkoVaE6yEai904hz90yoqzpSr9quVOLZD28d9aOteME4b+/s2r/JibMwaM43svPlkQbRwps83hTPy2T834vIWvtnlgWlV84KsuSCOy5paLgg4Sbmp7SFnZ7tgUGj7U3F5tdL3niEVY64R6jbDtUUN4HXysh2q+1pVNnvUFLbtFSMRaezqUBI/nXFVr7I+mJHZbsWbMQp6IW7hKwCxHGGPcyRPZferrBiABZWkfA6UxaJEfJNVVuNUC7xYx5wdCnxmgR6UgDWxZ5xO+37jRVCqJdGqohneGuxj0nEaOhZuWJJ6hzExJvSC3X32xfwo9eSROTCuoOHT76P9giME+Y32RJNNv7Z7zHCtWHhzClueegu53FXA6yQB0Sf224V+HrFDoZzo9D/suttYmHgWkvR4avA7eVv0JJTxfdjoHGCt8A5+UIMFnwakXlttNtHHr5qtffwoGXwA2lRfFnnOjcKnX2ZX3QZtvG6kp4Gl4RJhEsnAePdB4Ak4PdKLyHZRb/h0rSJpXiqjNaRRGHzJdK7mwJDmOmh81fkGnCMf9noPCWdKArOM3xwU1UuWK/XrRK7MhtLIajSY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(19092799006)(366016)(4143699003)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rGjsl84rI0KQNnwIfQGSMeBRzoh6SpM1bBrNmM4G8ur7FqZixyyKavilZvPq?=
 =?us-ascii?Q?sPaIOtFyx7urQvpR6u3rFQr0H/l0lfBk5VyS4WLb6qO+cwdevvXlWIzr3k+c?=
 =?us-ascii?Q?t3JLPkEN30p6c9xcSgwXArdQROFc5L57kbfrigHThMJ4SXZDvIHLiSD8uNyS?=
 =?us-ascii?Q?W7Rr0u7M+bYiTE9MM3/7PWUuhkeD2k+DgIOqZc18Y25rf/AnS17o9HLGcihI?=
 =?us-ascii?Q?JFjmhw48176X0YxknsxFgy+AsvbOfo8yjUxqbJBuknexulBInORqg1gUq2SU?=
 =?us-ascii?Q?cCHCptH4EYYiYYdy3ZVDXaeT3ShDCTiGpA44uhSWug5JexpCUl66wcLSQbhw?=
 =?us-ascii?Q?cE5eOn8b7sfF8UieeXlVHI5ezuWBwfqRQcZjJlHdFfhxytprR8ecNH9+ZhHg?=
 =?us-ascii?Q?QDKC76vAInGlEh2iCb6qv1AtG4J+8AocTyIaZUPhHEhPLpxLf7zBYSFM2mPP?=
 =?us-ascii?Q?GcRkpNfcOKJqwejEvvrD7fNhVhZctTM6wvSaOlBkej0wE0/UuFFlsYVsXXT1?=
 =?us-ascii?Q?C1pyx7ESKMgo9FPamnoQNYxgNdAhHAtywLBm2CsOqyRQz2oRdvYK6aGKKt0v?=
 =?us-ascii?Q?VO00UoV7VHzB3t++gd7OqexyheQfTx/7VFzBkYR1Riv7iwMRQnA9n0DDzzwE?=
 =?us-ascii?Q?y08UcexsuyYgBjPP6rmLNZpLIlFihobT29pWavXMN8OujJmR7qDQTbqG5bkB?=
 =?us-ascii?Q?zBCZw/wZJS7RwDwsK9yIzFXPkyFdgbajJRW9K8p6SrDbcG0BQ8O/0bFj2uUO?=
 =?us-ascii?Q?qlykPzCaPAXf8DUkfUNe1E6lK7Ke6Tb/FGl8u/6TeKUZNLGxm3f5wetwYY2M?=
 =?us-ascii?Q?9oOVR4VQtu2vhnzUNtilMm9f5yqiCn6eEMj5J2sFMrViovYys4TPvnElDbhB?=
 =?us-ascii?Q?BOqnXHi/YJtYSrNZN4LuMWLjJyBY0tkoUDXR+utAyOl+oODJ6V+hTnnTYOOU?=
 =?us-ascii?Q?q4vEmDiNbGTqruMkCC5B5mRxGQ1uHwkI213jikcf+/UV2bTf3nu4P0/uleIH?=
 =?us-ascii?Q?Ip3GMKsdjqwn8EXJx6xd2n7OrmHK+tRw1f3vI/1coQPAR/3mKGUho9EaF4mE?=
 =?us-ascii?Q?Cx2qqbzyx/alrN0YWm1rHwFPygyFo7wEcILn/v3uuEzeGFGTnnTcfMTlxgRs?=
 =?us-ascii?Q?cQyMpzdqRs5zMXl6oX8Nt8vjM3AO1Ihvk/dz4oDiOeRwgl7ELuNTTHq21VWK?=
 =?us-ascii?Q?fsdI9WMRWFfiW3MhEDdjzgb1pMgiVmHon18BKnBBkT7zNrhpTyIepypOmIyZ?=
 =?us-ascii?Q?P0kkrV0Wy+W/sQDJtGi5SMi62SJ25htFBdTWuSz5uSL4zEH8o3jmFMKjkSjA?=
 =?us-ascii?Q?6820sfHVwKiCpSB4t5WSljqKLuLZU5spr31TUJ45dQQPUZWpMBERK4v1bbs/?=
 =?us-ascii?Q?b0eDoDe+CEB+yrS6n3TC9Ck873It9Ck25iKPNUeRzmj+LIFDTJVLh4q0MqoZ?=
 =?us-ascii?Q?WR2yhKJmtFsfKYkhpvXQ8BZek/GX4iV9S4LB8r+yB90Ioz1rLX57ZS0+paFj?=
 =?us-ascii?Q?MMKOjxOGTSZ2BnBcxnOXrIpxSGUwNeq+icsrYwyt2YAi+HTEJQNrOAEKzMuu?=
 =?us-ascii?Q?QtCrQw0zKx8o/+KFWpHxVy98ydchKUn0593R7c2whAuDMgoC3iZ8mcgh/Dm+?=
 =?us-ascii?Q?TYD1CawSKr5G689lxIKMuDynl1D3DoKa3vDmfdXycSNAns2YxAoP2fN8KHeA?=
 =?us-ascii?Q?IiDnlKFiq9R0MlFWJ4mXA9nouC5orLycqlothLCdoUirQXzw/h/n3eDtXZX9?=
 =?us-ascii?Q?vkY8VwlXicdIDZiD1Udfg26lpyFeNb6IPkZoVLClbyWzjcAPL4jr?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99201e20-c0a4-44b9-25e8-08deece442e8
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 20:10:25.4160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cPSGVCisH8diMZ+/5pQoL+ECO6cp7+LvuqO0RxpAK0NmwY5UDym5DMxZr2fdQDFJuq7/0S6AXiQei5+9dvRSt6JIKUz3N75R2XiJPzTkuvXEH1S+jnq5vqUPsS5/UwTm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_131029_673323_44D83BD6 
X-CRM114-Status: GOOD (  27.13  )
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

On Tue, Jul 28, 2026 at 06:53:07PM +0300, Adrian Hunter wrote:
> The MIPI I3C HCI driver needs to identify the underlying system device
> used for DMA mapping and PM operations. The logic for determining that
> device is currently embedded in the DMA implementation.
>
> Factor this code out into i3c_hci_sysdev() so it can be shared by other
> parts of the driver and keep the device-selection logic in one place.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
>
>
> Changes in V2:
>
> 	None
>
>
>  drivers/i3c/master/mipi-i3c-hci/core.c | 12 ++++++++++++
>  drivers/i3c/master/mipi-i3c-hci/dma.c  | 15 +--------------
>  drivers/i3c/master/mipi-i3c-hci/hci.h  |  2 ++
>  3 files changed, 15 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index cfe9b5390b56..0212c9e984cf 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -15,6 +15,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/iopoll.h>
>  #include <linux/module.h>
> +#include <linux/pci.h>
>  #include <linux/platform_data/mipi-i3c-hci.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> @@ -117,6 +118,17 @@ static inline struct i3c_hci *to_i3c_hci(struct i3c_master_controller *m)
>  	return container_of(m, struct i3c_hci, master);
>  }
>
> +/*
> + * Determine the device that does PM / DMA and has IOMMU setup done for it in
> + * case of enabled IOMMU (for use with the DMA API).
> + * Such device is either "mipi-i3c-hci" platform device (OF/ACPI enumeration)
> + * parent or grandparent (PCI enumeration).
> + */
> +struct device *i3c_hci_sysdev(struct device *dev)

Is it simpler if argument is struct i3c_hci *hci

Frank

> +{
> +	return dev->parent && dev_is_pci(dev->parent) ? dev->parent : dev;
> +}
> +
>  static void i3c_hci_set_master_dyn_addr(struct i3c_hci *hci)
>  {
>  	reg_write(MASTER_DEVICE_ADDR,
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> index 0672ed1132f8..7c2b20474130 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> @@ -15,7 +15,6 @@
>  #include <linux/errno.h>
>  #include <linux/i3c/master.h>
>  #include <linux/io.h>
> -#include <linux/pci.h>
>
>  #include "hci.h"
>  #include "cmd.h"
> @@ -301,23 +300,11 @@ static int hci_dma_init(struct i3c_hci *hci)
>  {
>  	struct hci_rings_data *rings;
>  	struct hci_rh_data *rh;
> -	struct device *sysdev;
>  	u32 regval;
>  	unsigned int i, nr_rings, xfers_sz, resps_sz;
>  	unsigned int ibi_status_ring_sz, ibi_data_ring_sz;
>  	int ret;
>
> -	/*
> -	 * Set pointer to a physical device that does DMA and has IOMMU setup
> -	 * done for it in case of enabled IOMMU and use it with the DMA API.
> -	 * Here such device is either
> -	 * "mipi-i3c-hci" platform device (OF/ACPI enumeration) parent or
> -	 * grandparent (PCI enumeration).
> -	 */
> -	sysdev = hci->master.dev.parent;
> -	if (sysdev->parent && dev_is_pci(sysdev->parent))
> -		sysdev = sysdev->parent;
> -
>  	regval = rhs_reg_read(CONTROL);
>  	nr_rings = FIELD_GET(MAX_HEADER_COUNT_CAP, regval);
>  	dev_dbg(&hci->master.dev, "%d DMA rings available\n", nr_rings);
> @@ -332,7 +319,7 @@ static int hci_dma_init(struct i3c_hci *hci)
>  		return -ENOMEM;
>  	hci->io_data = rings;
>  	rings->total = nr_rings;
> -	rings->sysdev = sysdev;
> +	rings->sysdev = i3c_hci_sysdev(hci->master.dev.parent);
>
>  	for (i = 0; i < rings->total; i++) {
>  		u32 offset = rhs_reg_read(RHn_OFFSET(i));
> diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
> index b3d9803b1968..b8d2a3d680f8 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/hci.h
> +++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
> @@ -184,6 +184,8 @@ void amd_set_resp_buf_thld(struct i3c_hci *hci);
>  void i3c_hci_sync_irq_inactive(struct i3c_hci *hci);
>  int i3c_hci_process_xfer(struct i3c_hci *hci, struct hci_xfer *xfer, int n);
>
> +struct device *i3c_hci_sysdev(struct device *dev);
> +
>  #define DEFAULT_AUTOSUSPEND_DELAY_MS 1000
>
>  int i3c_hci_rpm_suspend(struct device *dev);
> --
> 2.53.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
