Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58484C282C1
	for <linux-i3c@archiver.kernel.org>; Fri, 28 Feb 2025 16:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4l5FgH4c4VkslPpCfiqqlLZBcmOD2m3rJCyKNjRmck4=; b=Culp5BkZEUHZxW
	zcfDU+Pw5VZmFBTVrYGi9UhKMKHGjAto8zWmpqGrdyB9VljCwoU1Ai0v0v01fzHlJG0JrAxxuUMCq
	jlEQcAc9Anw9BQXPLXuWEgG6hl/XiWplknbJxxj7BKGoeShXZJVHX59InLyCg6LTOsdFccglVL45Q
	rfP99bUb98aKyolqV3Q+gTd1QccYa4emVXN2u4buzsOIv4E1V39bFkXQ0lXaLkGDvu516bSdvgSSY
	knBKw1quOVpwjpncu3ZODaiwx6d6Uduug3l5CR8yYAssQFcMDHyKuHylsz0vzDK2JHxomi9I023aJ
	3N/Q2a3QjKjm89poElBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to339-0000000BdOY-0Vic;
	Fri, 28 Feb 2025 16:17:19 +0000
Received: from mail-db8eur05on20625.outbound.protection.outlook.com ([2a01:111:f403:2614::625] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to32V-0000000BdIE-3Eeu
	for linux-i3c@lists.infradead.org;
	Fri, 28 Feb 2025 16:16:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NTqEMrDKKudIXhS+91H5+6eXPXG6nqe1Ed6IzEeIubEpyFUPGkcGCxE2HhGNstzK3G5RNmZ14rW5ov3Ly5QJ484gUkk12BjXwtFKK6mrRWONCzttyDC7YgGAbcpUWAtYfUdNxKBAbWqpUBAmdgXzBwP1NfO/qSaOw2ENkGz5V8n5jNBZUszBoVqBxAjCiyuWsuHPi0d+echUX2loPl3HMZWyZKsn21ROS9LjkBoyLVibgpQKwvMYHQrYJd6GEXnCRYaCL9n2F90QPmFfklnnbEQGa1myIcEs6jZBpIN3Feg4W925G6NsYu1fWy0SAgPO7hvAWQauEli9qIfyr4/muw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mq0A9BTbac5Fa919Kcyp6dS5rwqnQFrwRIbEiAPVSu0=;
 b=NWm+DFqPwQVy35Z1rz1fvIHqaLInrF8Cvy86khBqjthR9eKVc0sPz3q6jfjfdrHrVg5XQAxTg6HhMBsSe0jBGcgJPFOVQDZ9YATSDualHC4TfxCLFGeDHiFcwibivnLY67MGwX/aiOV1CTXHgUBWKn/9nn/CpoPsKtdSBo//N/CR8PQa58CUSkwJbGK1J8Hs2pZqJzKSwzhPXhFSM+1Kti1guU0QdVk3bOJ12PcCfd48uu5vxmOffgseS94yYAbekF5JbfRw1uMS7OIKrHYCjTC4lVg0m6nQpOwoDRLnvOGHy5TbJ+/q+AgMX0gnO4jD5IMpy2Ca7FeRU9ZpkVhsVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mq0A9BTbac5Fa919Kcyp6dS5rwqnQFrwRIbEiAPVSu0=;
 b=mdeoNvRNEtIWbhRXjc30Owh4mCmbddQzti6z/4re9ZX3rLmlPIDDdU7JALi+jSmt4UXUYg6S4PUnOB4Myhac/hxFnP0UtRUnuta6we5tCmZQDlJAhM/ESwnP0+2yLENR8Cf11mxOk8vsUvKwcM7bsg/4KfvkPZFJ0uNxBUeBldA7XIJi4yAz+WFRhg58dHooTA4nAA37KNE6W6b+HHe7DVxah3yFq51ENvK82p5G/IzDU4YRcyrQC94H6Q2EdLvQIqF8lIOW91gAhQMqtV362yzVDo1w/pF0cKcAcp+sbApQCnmygaQmR0j5+rw87Y2aUjgTUPDrYFj5FZr6CxQ7Sw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8880.eurprd04.prod.outlook.com (2603:10a6:102:20f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.23; Fri, 28 Feb
 2025 16:16:36 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8489.019; Fri, 28 Feb 2025
 16:16:36 +0000
Date: Fri, 28 Feb 2025 11:16:30 -0500
From: Frank Li <Frank.li@nxp.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 4/4] i3c: mipi-i3c-hci: Move unexpected INTR_STATUS print
 before IO handler
Message-ID: <Z8HhXlzXs62fVEyH@lizhi-Precision-Tower-5810>
References: <20250228141802.1344453-1-jarkko.nikula@linux.intel.com>
 <20250228141802.1344453-4-jarkko.nikula@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <20250228141802.1344453-4-jarkko.nikula@linux.intel.com>
X-ClientProxiedBy: BYAPR07CA0014.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::27) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8880:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ae04445-06e7-4926-3a79-08dd5813467e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CNdAELz1orrzS26S2zQRYJ5JXCauldnmJWNTudZffSsCnWg2Xu/LGsP282iA?=
 =?us-ascii?Q?QqfzBMAwrRoNVWtbSORrjiSAWX5k/ofuWqexyGhl+CUf4UFfobsT+VkUyX7A?=
 =?us-ascii?Q?iJhjVMlkSGvoYVTNMKU6BxBrpTk/SM1mabOyT7jYqyee0h2EfEJE/YlXfqgk?=
 =?us-ascii?Q?R20+9LtpSKHT1U0ebE48akUtGFDZCI3NQhItdsuofUlrXlL92hcRnfu4sweS?=
 =?us-ascii?Q?Pf1P/PSQX+W+uV61+GKVf4yqANUzMHyhyhZ5ITMn5JoQH2bltjoUYxVSaVq0?=
 =?us-ascii?Q?3mF8A8URIbgqt4Nmhe+ksoD21U7hWZS6+X9mAxVPTDB7Z9qp1VLU+iMGOJXK?=
 =?us-ascii?Q?CreqCKwKavuZaTB77gUiUkyxrcfswooVfJa7Ym3YICjMzgOqCZZHkPMnS8Hu?=
 =?us-ascii?Q?fpRwuyj5TJa14UeKhBjn8xdagYPOQppVTVLZoQXkqzAxKBNWSMLpr4UVP4s7?=
 =?us-ascii?Q?aZnJ2Jq/wLqW1b1w4rsrluJqmD6RcWy4zZdL11Z92bbbu2GjP97GeNC7rt/s?=
 =?us-ascii?Q?CY2FOVkvaYxYRwBPRDA7HKvZ3DkP1/m6CD864e+zHtGO2AnhCY5vhuT4xx66?=
 =?us-ascii?Q?ezSAQgEBa2enuItoTIcmCX8AhyLePEMcz3hFWZJCRWiCyFIZmrhsOZTX+c0K?=
 =?us-ascii?Q?i7eVeIz2KdiXKDd55CHS837SEv0+WshnyJQtYhSMEwqocGSv61wRV5d0nk5P?=
 =?us-ascii?Q?SJowOPRHeqFEU4Q5lvb7umhrSClEquWj/8Bdkdfpk++ZeUiNQBY6sqM/D/E4?=
 =?us-ascii?Q?j5eZWPk6WzQf4r3BSSI1eTorFGRFCkHW34iIYWnFJfhYajzFh0VWK8oRsRtc?=
 =?us-ascii?Q?WTSPY2oyEtjkOHFemUDWuV++3/ZD/HmLT7riod8ZIiuFq0Pdp69nryYzXauM?=
 =?us-ascii?Q?pyO0p/ozZAkpBuOFsbosFzPCZCBeG0gvln3DKIpRCkf8UtIjs4WCkQPM2BNf?=
 =?us-ascii?Q?v7vF21o1fUaNNDa/5sLCDg61Z/Thw+j0NT4USw33bnSegm54rPIBqwxJsawZ?=
 =?us-ascii?Q?INHECzx4RHWvufr9AA5WtaWeAGRIrRuz1gZWSnt61BZ13uEg8CM2p12UKFKn?=
 =?us-ascii?Q?005cdNn+z0YfjyZBmkNKDPya4MrYNx0IcOrxJGMxELRh6uShwao8TVRLTQvQ?=
 =?us-ascii?Q?Y9M4UqVE02oFcWJ+FYwCF+rp25Z/uXNLBHCUajdffZKrCrl73P0mVBDjlYSd?=
 =?us-ascii?Q?4w7w57ebb5mILzl7LRNPKOalVnATpsYwyOJg6zvk0JoG0/qkHpKBsTJXxYRE?=
 =?us-ascii?Q?SeS3QSscphfk1uEpFvY0E98t8ZAfeoxbMMEfj3MXxSAVxEEl0EBgDzuLPqmN?=
 =?us-ascii?Q?hzbxmOSNB5OY47VVWvr25ZXdx0xZEx4yTj/Woevh8zFSNsyOCaGpRaJyZNtY?=
 =?us-ascii?Q?u3w70OdSXpT31hNbvW1Mp71wvCel9LxtmLeN7eMH8n15i1QT+g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h2G88oybybApUyVOzlzl/gR24b091RflaXTmaDLu0oQZsn3RRmbSq9In4Liv?=
 =?us-ascii?Q?o1Ch08axm/zdviIf7TVhLrlCyXRBMPDps2RmC3gRXA/GIg7KyAmuaYuOkNWO?=
 =?us-ascii?Q?z15cn1UogIqeub3sRyZhKR+PkI60P+jR5IMg7QPqncwP7ssz36M/H3A8zWqf?=
 =?us-ascii?Q?Xg2ttzGWlvxAA2jm2kcK3hQXGBbHE56tHnuLyKNN1RlcVsmRjU6uuTTgS+3v?=
 =?us-ascii?Q?xnGJiU3x1Mt5ZI1G5dEqvMNs6+jsJEsZd9xV6SPkyQdaFkl59DTakrDzq4Kq?=
 =?us-ascii?Q?zBRWMhZ5KbW5FybYCpGxegWlxQimccE4mlYaYLJdbpEpXD2h0W8SQTmDV1sW?=
 =?us-ascii?Q?ZbdSA74InqBU0pSJjP1dccpqI8TiFJIjvniYt4RB5vJin91P1x9AJhDZOELP?=
 =?us-ascii?Q?PIw+D/MjqaCAMilPfyNfZCj7iyDy0bLp4jgrf0vKZ9xSLAeJFZmsihlDtDtv?=
 =?us-ascii?Q?2Kx8qHEYDMSiCzVgt6ZU4NVdX3fC11ToK7ekECbpwBMewo4IcunRkawEpuDM?=
 =?us-ascii?Q?v/b4Du/fOZpRIDvOqoCQ2WFptICck/O82sme32gCFduuGzGDqAqEvFmGRjV/?=
 =?us-ascii?Q?AqGUuFOtdCfojcMh2gvn8wirhU7cNNPpZJcpOUa2fUpZgUzQ16VM0y95LDpY?=
 =?us-ascii?Q?xdzfO4f0U9SQ3ZE2EGu5L3qILGTN4VpdrRKEcg24yxxfHBxGMAQ7/xpdgHAv?=
 =?us-ascii?Q?/tvyt5q3OL9jkFMCaO9QqTZTnUf8SL1OYFb07oPkpTRtbuPOMGGFFRpXVftm?=
 =?us-ascii?Q?idPqKb1Ec46V45tDyJWjds0PrbfsJKTVlp+dYz/jvjEx+QtfNtYtGxjjx9Cd?=
 =?us-ascii?Q?yEeM4HZH9rIhJQHBbMuwg72Xkyn/cuD1MbIc6xi/oAnp5E9GOilCNzu4+0hq?=
 =?us-ascii?Q?ay+fuMpiqrsbpSPpy5ye1DlIxpiAG6ioeIJy4SEG9ba2cyAVDBhAptXclKBm?=
 =?us-ascii?Q?Rk3P9ibNehxqYTKFzRdYsXqnXn7ylT4YY8VE1YVB9k1AagNxYFG2+ej1JUYM?=
 =?us-ascii?Q?gqhf4hPY3m+BWKcbh1eS7/OXMzNVOeAsBxuQDEPLtM8zuId1RDYJ91oNC01V?=
 =?us-ascii?Q?W7WnnoXNHE1fMkbMlafShlh8FLgHKzTKxx6446dcb65lnYVH0vbUq/3eczPX?=
 =?us-ascii?Q?S/FykADmLgIoaQs4Uit1GqiZgg6wmHIBVo8K3ERHTtoVFlgvogqYT/IPB8hS?=
 =?us-ascii?Q?3S343BvxtgspfRyFh3W/We9YlN2MRZtDKfdJNzXN45cKiH7YFtAZ5ZN2CxJm?=
 =?us-ascii?Q?PnUIiIvAl1uFh07tuJdOCXB0/NF+Gl9as2Fbea38knLZ+98NIu6Di89u1VL8?=
 =?us-ascii?Q?Q+lnor+4zw4SNuJkOCEIS6kJLOcA9w3f1MC6R5o4G+I30Ok/x/ZTqgyHK60M?=
 =?us-ascii?Q?0Cvgl0PetWklK1xOa77dLPmXCX2W3RHFDNL8s0Vm2vkI6hzHZGREOLfwCAzo?=
 =?us-ascii?Q?RVzg9keMzDa8ZlWsK3ov1HapMVgcecX2ewvy23EceykQgvcdMRCuWmtAQm68?=
 =?us-ascii?Q?gnqyl3lK8X8IQem6Rq+uPWqZURAM+lKoKs6UN8tZM3qOchNGoWKkutSGXvdN?=
 =?us-ascii?Q?9bK83a1n0WXQQgChN1/QSnYKYzk0UQ8xzVy87H9p?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ae04445-06e7-4926-3a79-08dd5813467e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 16:16:36.7654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KgydPJCEBTDWW4Oa3Vt9KYmmlO9156rQCGzBQ92Fpjqw0YUzwqGi4SULuGttWw6giFc45897UXbbuZuAGhwHOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8880
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_081639_817128_7C7274D7 
X-CRM114-Status: GOOD (  17.74  )
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

On Fri, Feb 28, 2025 at 04:18:02PM +0200, Jarkko Nikula wrote:
> Move "unexpected INTR_STATUS" error print before calling the IO handler
> as it is more consistent that way. Otherwise it may be confusing if
> generic interrupt related prints are mixed with IO handler prints.
>
> Since this error print is more indication of missing code rather than
> runtime error downgrade it to dev_warn_once().
>
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/i3c/master/mipi-i3c-hci/core.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index 84c372740020..5c173249c0ac 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -607,12 +607,13 @@ static irqreturn_t i3c_hci_irq_handler(int irq, void *dev_id)
>  		val &= ~INTR_HC_INTERNAL_ERR;
>  	}
>
> +	if (val)
> +		dev_warn_once(&hci->master.dev,
> +			      "unexpected INTR_STATUS %#x\n", val);
> +
>  	if (hci->io->irq_handler(hci))
>  		result = IRQ_HANDLED;
>
> -	if (val)
> -		dev_err(&hci->master.dev, "unexpected INTR_STATUS %#x\n", val);
> -
>  	return result;
>  }
>
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
