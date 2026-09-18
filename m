Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C8DC982DA
	for <linux-i3c@archiver.kernel.org>; Fri, 18 Sep 2026 13:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fCMj/VNtIQwXzFp+Gjj06yu0G6PwfsPvScOk5AXEJa4=; b=Kl69Ecj90jv8je
	zKyD78wf0rkO7VoSQekP436vsltzCnUk6CIFbVIQNM8uoGr6BECecPqx/PlpS3p5SaNIGNZEhUKQW
	Rly6L7hWDMZiIUwJGRoU+x1ZxRlXdQBdAJ8zR0jvSwZMjMgVJ2YcRJ0sAZDbLywmcJshJUW3JyQ7Y
	DcG5UlpdfuiiUGmxN7Rgb6PriPw5CUQao5ZIE9EpZWnQ8s8YxhOhF+3FyPopwZ4hwuxU/qHua1V7g
	oEr4xQgo1GAH2I5LpZTPjSfeAOXp5iA8cZspuHVWXnMuXKoB9maMJemolkVuvUYgwoeeSbw1wSooA
	V2DPnNOPy6kvPPTNDWGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Ytg-0000000EcaK-2Cow;
	Fri, 18 Sep 2026 13:45:00 +0000
Received: from mail-norwayeastazon11013034.outbound.protection.outlook.com ([40.107.159.34] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Yte-0000000EcZw-3WY7
	for linux-i3c@lists.infradead.org;
	Fri, 18 Sep 2026 13:45:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y4HgTLcwCOYpd0rRxW1jhgQRYBmWUp+07f9nriKE/m96jwnxiiqP12FE+z6dtYKy6zAqiC+pwAmIBAtAeA5gq+mxrptFwjcwpt8UTNZX4kaM6M3fj0H1s1tonR2y9cCT9PvqrwwD1+327LcOD4aQSIfHNWMGGOE93bxtj8ccxsVWQvzLz5H9lTxuxXstUp7E8HUpOkWABWWXRjR3dHp+XoxZJQcfLjVApSoOhwdFk1V0QuV4IqHOVeHdJiRwFG7qZW+XdQc+KyDpMv9ME9BZq2Vr6FF5vHjrmEt56Ie+z8VZsmcDJWf6conFlgd6dN/DKZlnO0+qa9iiD+pGXDG8Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sIvix5E+E0rDBEr4JAOR8xSRnFCL8sk7suCoIO/SwV0=;
 b=NRBkKiADt1bPItHJstnROSLSLTpS4urKt/alWeALfbcET0fdJcrF+7691OuQB4CksFIq3ha+98xNT+DJglcuhtCl8VTnH2g/HzgiP/13s+vw3Iwz5Pfidy9YNgVRTaYVA6a7Ldj9GTx7f+v/dnOwpNp6Xe0L9PDL2J6Llt6NYkj2RIyMvctJd9UBtVRyBVBH+MguUlXTH2xSTwy+fuQAgKkqnme40cih0VKz8vx3dOMYb/mkx2N2a4SSde+I9daDjPb0Qql1n2B3kmHCU2oYzqaLtVxFQPZ5fjseUW8ReK1GO4b3NjHia0TW9W1vxHSquzAEXDb1GcQXlujgx8DnSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sIvix5E+E0rDBEr4JAOR8xSRnFCL8sk7suCoIO/SwV0=;
 b=unkamdm27mWhzTaPQ/oe2XAeUd7DO4r4/DagHhaVd7EleQ9uP1umiFeuEuV7XeaZ2ZfJ51yVBLi27IP9TgnTMxMpjb+Z00pEpNhpYET3GR9XcCQgUnLBgwPCE+Mq9Zsn3YjYPqIEwR59lguiRHNC6p4OgP9l8LW94tfsgPcnaIrYO3L1F+oHEaVKHUaxwhLQyPh7zZR7JHC598Q9qvoY1lpHEeAYOaTLDYr3Ml0KGLk+NIKtrPKqHIJSAkOyF3e580XTBhKrJ9UcLsw1wqKOW5mt6i4Y4qknxWjGBUBc7X1Dp9WmVuE8qNjtI2NOOLoNuSBSjfgTsbs38StuJP2yqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MIWPR04MB343215.eurprd04.prod.outlook.com (2603:10a6:290:d8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 13:44:54 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 13:44:54 +0000
Date: Fri, 18 Sep 2026 09:44:46 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 15/17] i3c: mipi-i3c-hci: Support configurable device
 NACK retries
Message-ID: <aq1ATowMFPLv3KuU@lizhi-Precision-Tower-5810>
References: <20260917191356.133242-1-adrian.hunter@intel.com>
 <20260917191356.133242-16-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260917191356.133242-16-adrian.hunter@intel.com>
X-ClientProxiedBy: PH8PR02CA0027.namprd02.prod.outlook.com
 (2603:10b6:510:2da::18) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MIWPR04MB343215:EE_
X-MS-Office365-Filtering-Correlation-Id: 4293dd9c-190d-44a9-64fb-08df158b04d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|23010399003|19092799006|1800799024|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: MVv2lfT9sz6Btbb9M6VSs3QHrEC5YOCF8RH+2KMZuCJiIuMcIltFErHT0saokpKpJEkHCYUJx5o9VXFEmuvMaEGwH55FFQ3j6aWGVzYkXZJ5O8kxeA84TqTEEDOXUZ/RHMuLPGrxbJEzZzabpUVGSOz7+KCvYKquP3rcHlp3QEKhRYWgo9UPEP1pzpmbJOE9IDlJGhMbs/ucg30oik5UyMtCHkuDserGQd8DAFcJrF2oPy7PrfkrYOxkBts2jIIBaSrRWeaWC6joZY2vv2LzvnY2abExcFdVSKZJpNWo9vyOEcvaMWeZm8lQA1MubuszGBBWuBB51U6ht/S2hMzlL6c36dJPOmbVa5IuA3B0odUIhpM6tli1TfskE9E5dLkyBk0vIOaqk7ySIGWXtGTwKxBhMsvxKpdnuwz5NzS5mrDAfgw6GpBnxoWoa9kEvh2WHoZWyKptl3eNa/rLjkfO1sLaVPvN6hFjSMsQnhT6fYHb+jVVOOaRUw5Q0ZyjHJJfZzBYKwOTDIW1fAqOYzmHIeaFvXi0IvtCK38cjI1fUgB6uCa7B9Ow1w/X7oV3b10Bls9E4wiF0pwj/GP8y2NnQCohTjUbxao3IhQZA92KTIrlp0Z8FiDgMzsUrJ1dkT0lt75M7tvFu6h+iYCucWlXD+RFEBQZRAGbLC/ObyeVfsg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(19092799006)(1800799024)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hsRjAiCdVZR3nJBA7ryRqHtfpD66yzzfYyDvgWOR8rpFKKIq0qkrcK9ZGmz7?=
 =?us-ascii?Q?6XnDuA4fpqwIR9LrHdY+V5BkcpTkiEFRBVlhv2+zELAVPkEux9veo5iFLMz3?=
 =?us-ascii?Q?awqizbouthzqIqRCSr7r07x0mXdnVIFy7CrwGkcz9hWwE1Vk4WAiOrUzuz0c?=
 =?us-ascii?Q?5t25E/4xiA4pNRFD8cbH31xcnRJYsxGPS6aeBH8wE5RW3tyN75ms+vVKACuh?=
 =?us-ascii?Q?nC+7WFHAwV7Uq8A+J8b1HeyOkYDvwb4Ez73A6qcuEX+ZESZii6JK+4dXuZj3?=
 =?us-ascii?Q?aLi7Wwm70GdXZ934yBYbsFCvcA5+Rk4TrKLJ1ZxVt5Fosfe8BmLVUPw+0e3k?=
 =?us-ascii?Q?S234MrvzOqadRHL4pkNloq/FQkt80gA+fi/avcHTXEtVKv//GM8M9xamCZfX?=
 =?us-ascii?Q?UNY833I+iA39fgw6pGqQQf/UmQXiRyEQgaOpEfrPjofyDZ7vfeVCXui5nI56?=
 =?us-ascii?Q?EWP/qUFX/BvhtPvqG+9hzcQnQhnCHS11SWBFxlYIuMRvjVl3ycfGM1qVQtQ3?=
 =?us-ascii?Q?S4tNhgeSFDiVLjGlRzGzQy7qhRd64OWRne1JttM2JqkhnclxVtwvIrRx9G/y?=
 =?us-ascii?Q?6RoZkTaY3Ed1yYpvpmulaNd3/TYQg+fndUDhCztNI0LWZxr8Hlz2ne00HGKv?=
 =?us-ascii?Q?28Ddcbh3BKSe3MlJu6X+zHBRyaL0l1S8CFnO55H0QaW7l3o1L8TuyQTWMwB4?=
 =?us-ascii?Q?YPxwfB+3wbvkPaYVnj2aD6/MRiiYTsmjftytrGYulSpZfyvwuNA7And7iEwI?=
 =?us-ascii?Q?Zp2dMQbWp4Z2Q3MnO42LYDUWYjZAivR6YeTU/T//RTAdNhiZ9fhyq/LGyHbJ?=
 =?us-ascii?Q?oA0dLYaa4ULo8Ez2FSGlUp+acgHYgfFj470nqOdbB7yIY55l2lJEHTsx/dCE?=
 =?us-ascii?Q?Y/QXR5T0Ds7kg5nsyCD3ITQ+jhMjFZeutWVKmQ/AbaZxSFyk8GQQjGsm0VJN?=
 =?us-ascii?Q?oJOvShKwuVxHz4bQ01hArwy4J1EqGDIlR3CCifmDwmlNsKKJAXq7Xl8bJeuP?=
 =?us-ascii?Q?yvpYFFRtPra6TACCIIM33qFKF1/Q9uPzkU400sZldc9Advi+fa1MBiWIeVwe?=
 =?us-ascii?Q?QphHSE8g2bHsGoFfwnbIhJcNgqcfklrFP3W5Vt6KB6dhVN13xuaRVYRxqxFg?=
 =?us-ascii?Q?vfokK5tyaqfjJpNnC/MGNaGPq67OyHiiI3h3utGJnfEF+cR/zOI/vULmFfbH?=
 =?us-ascii?Q?nlVdFSNxcUiI43CCagoJPsx5zixNu/yr5MQ/WrYDf0asexHRy0NbZf46/hyT?=
 =?us-ascii?Q?NoRCjsYMeQ6HFx+5fLWzqhCxjG4Hfom0RMNdc4GIhppDYrok5hP+a3eUN8Ir?=
 =?us-ascii?Q?WJG0oisAOj9EyQcKWjt1CD1YcDhAS2MgwujvDmvD0mdzDGNI0EwQ4ipXSJOc?=
 =?us-ascii?Q?fxlVyYYsyvWoshUXvNVe7MeZY6h/khKdHQFwXLKl72OqQRWhTKaguppeKHKq?=
 =?us-ascii?Q?pfDPVnGQ/s+rwwomn5/nBpSSw5ux3cmNnAPqag7hXkLJpypf9cGjZmpbjz4u?=
 =?us-ascii?Q?51pA6bsIbt9s7sNHunWU/5nNIsZj3SQCkuXVZIAT4xWa2i80ZFtP8TL2WnJy?=
 =?us-ascii?Q?wcb5C3JO3Xy1Vl9BWpWa8tBVDNsHp3wnF3Anf4rWL1o6xpxVQwe3bz1Xoc8W?=
 =?us-ascii?Q?JdHpwmYzjT5GHXDVpzNhE3rOodh2QDAKdsXg0RXWHw4cVqkZCuhNSEQM68Qt?=
 =?us-ascii?Q?EtYMvklp1ak6Px8Tt7H1b1sRIXaCWdmZ5ap2bLRBRVqEMbkXKv6lNM104gIp?=
 =?us-ascii?Q?D+4eCdI0MBs9Z4B4h0MdlbgtEVmPo/BWyp9cJ88aC9Hv1fzEwZBb?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4293dd9c-190d-44a9-64fb-08df158b04d0
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 13:44:54.0011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ymgk0ej54R7vqDKkIFOVxhFZ6gAfAXc8f+pZjfcuMYC1ThuVDUyAXgfYFbBx002S/+73VHi4fd0r9CCIr7gQU1oZTA47QZV5PTp1Nqasq8WDerOeE4wDAPDpXhFG2Fd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MIWPR04MB343215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_064459_024564_657B8BDB 
X-CRM114-Status: GOOD (  11.04  )
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

On Thu, Sep 17, 2026 at 10:13:54PM +0300, Adrian Hunter wrote:
...
>
> +static void hci_dat_v1_set_nack_retry(struct i3c_hci *hci, unsigned int dat_idx, unsigned int cnt)
> +{
> +	u32 dat_w0;
> +
> +	dat_w0 = dat_w0_read(dat_idx);
> +	dat_w0 &= ~DAT_0_DEV_NACK_RETRY_CNT;
> +	dat_w0 |= FIELD_PREP(DAT_0_DEV_NACK_RETRY_CNT, cnt);
> +	dat_w0_write(dat_idx, dat_w0);
> +}
> +
> +static int hci_dat_v1_set_all_nack_retry(struct i3c_hci *hci, unsigned int cnt)
> +{
> +	unsigned int dat_idx;
> +
> +	if (cnt > FIELD_MAX(DAT_0_DEV_NACK_RETRY_CNT))
> +		return -ERANGE;
> +
> +	for_each_set_bit(dat_idx, hci->DAT_data, hci->DAT_entries)
> +		hci_dat_v1_set_nack_retry(hci, dat_idx, cnt);
> +
> +	return 0;
> +}

why need callback hci_dat_v1_set_all_nack_retry(), if it just call
hci_dat_v1_set_nack_retry() in loop.

Frank
> +
>  const struct hci_dat_ops mipi_i3c_hci_dat_v1 = {
>  	.init			= hci_dat_v1_init,
>  	.alloc_entry		= hci_dat_v1_alloc_entry,
> @@ -199,4 +222,6 @@ const struct hci_dat_ops mipi_i3c_hci_dat_v1 = {
>  	.clear_flags		= hci_dat_v1_clear_flags,
>  	.get_index		= hci_dat_v1_get_index,
>  	.restore		= hci_dat_v1_restore,
> +	.set_nack_retry		= hci_dat_v1_set_nack_retry,
> +	.set_all_nack_retry	= hci_dat_v1_set_all_nack_retry,
>  };
> --
> 2.53.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
