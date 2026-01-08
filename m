Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C02BDD1D46A
	for <linux-i3c@archiver.kernel.org>; Thu,  8 Jan 2026 14:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/S1Bl8R2r5eTkc4A7XS2EtlTZQ6ZBa/haeZTJbw2iNI=; b=b1HIFWdqmdmiUM
	foXV5C07raoDcB6EBG+CblD49FvTcZZ0eUE57mGsBZF3adbpKWvcsafAWb6Bet7Iwm4iybIISnW/E
	2WnafYv3/2yzP7H75Hp7cZn10zays9ZM6gVh+l9qfstmoHtifYsY62Ol4e2LruRektbvA5ifQCBch
	HBvg7XBqL51bHqOW/Ccealhh2nIcoM+rkij5UUUPktqOa1DzHEUD0hGJUC/7VsXvC9Q4IJINRjdHN
	ulnfpAphk46UYeBCMu/1e3MW8ebnd/+7bRb62p3CwTUUcaEGUFfZRslNv0i3wMbyu9p1AZ66n3lRl
	czfjx+kPQkDREoJbmOkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdrSn-0000000HQwR-2Bcu;
	Thu, 08 Jan 2026 14:58:13 +0000
Received: from mail-norwayeastazon11013020.outbound.protection.outlook.com ([40.107.159.20] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdrSk-0000000HQvA-2ISN
	for linux-i3c@lists.infradead.org;
	Thu, 08 Jan 2026 14:58:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XeGJIVivmGPDO/JOnzqIwINGWSWIb+XdUzll+ZGoWctgJTt8jK1cFlmlFsPMk3zs+wT7WVR+H7Xb0kPWgFee5K6yFqmzKjK7J2lyfxMqL09mfJeQKfEUyFIJmhFXFRR7oA7tT8Va2dhrWQ9yi6tW3pFihfHYtYsk9lnZCB+35PMdUaZp6IqaOm+Z1sCiZyrl/NE+0qc6KctiKxsQE9Ueyp/HmkuyJXfIdF2nyPJRusw0zSMukT9Xg48n+NDHLJbCM2ZnXe1YVTPHHK+up72dhrc89IW+9bj8mN7WlnrzWuM1l2QZp6uBbXVDfB02wq1kRIHZCBkL8nCwAwhbrFu/mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4uRP9YwZmFHwmDS7RJvornohPIyTuZoa58GYN4ewAYU=;
 b=mDMV1PB1qIq2aCOHX77k3yM6FCQ9B0JWnYPSlLFPDMCoNxMp3BWN4XFar9Rsr7ZdKMDwnwW/6+uJVdS2Tw0pgRvULq/e05xVMbOnEUXlZpmJ5P7niXn2vv6YMMjBfWCR0z/J72XJ05cW6xn+J33dBI3fNnH7lymeYB7fYGETZYetr/cN1XxiBixvPKZCcMsPSrH83Dp6fW0weA6UhZJsJnttMmlRDgl0HtDc5E/g91P8iPcuLuucUrNDLXe+sIE6N+gYMWrPotAPnb4Ws9ajfcaULrmckI25EalyeDtcLhiAncP/ugXvjRX7hkxRZ0a1256YfA9IZMwfxfWpovMu1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4uRP9YwZmFHwmDS7RJvornohPIyTuZoa58GYN4ewAYU=;
 b=dqN4ENO8kvh6h7YLt8f44HZmhArlKKYtUBmYPX7Vrxy17k63te/uwVW1NTQxX/KGKaDhZpyeOBgGFGA26hR2qXL600t9U9n4dxnUuqscSwvFlmyXiqMtTDgeUvwh3rfYoF1AckiMMzxcQDXe5ktNYxRAX+4yM2GwvX/X9YHxpaLyV7OHGvlK+NIOp5cVj2IEg5aMAGQ17Wxucs64a14URmB3NV+I6DwfIuqFeOlo8lv8z9bAxAXEdm+KOcCCgneBrdAy7hjg2WJKRIlK1wm0qBZeYwfp9GU9bfXgBfLIObUHXkA4Pc9LgDgGiOsp4CfGC+1VqG+B4r20Xts5M1dT4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DU7PR04MB11236.eurprd04.prod.outlook.com (2603:10a6:10:5b4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 14:58:05 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Thu, 8 Jan 2026
 14:58:05 +0000
Date: Thu, 8 Jan 2026 09:57:59 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V2 14/20] i3c: mipi-i3c-hci: Factor out software reset
 into helper
Message-ID: <aV/F97hEKC4KBYjY@lizhi-Precision-Tower-5810>
References: <20260108080558.21767-1-adrian.hunter@intel.com>
 <20260108080558.21767-15-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260108080558.21767-15-adrian.hunter@intel.com>
X-ClientProxiedBy: PH8PR02CA0019.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::27) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|DU7PR04MB11236:EE_
X-MS-Office365-Filtering-Correlation-Id: 74ab6d91-ef41-4835-74fc-08de4ec6540c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|52116014|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HiBz+ukZmghGYTith9G2p2plk1f3p9IKbiEwGhdfPVswN/JON7zhCk2F5eR+?=
 =?us-ascii?Q?Mh3Er1YYTIleNeoDS+J0jQmwIwcZacbU3/2h9Giv4eEl7wwwDbSkHYAjW3CB?=
 =?us-ascii?Q?G2kHcW5MIbDAWdxgUdrwEuMzJs+idwsyiEiSX1v9ADuIpCeD0zNJUF5QrUpP?=
 =?us-ascii?Q?eD5fyqGu7Ns4qk87ix+qbENk1JLPdk2R94cj+u0Qhmm2AeFIXx4CzNJlGo6h?=
 =?us-ascii?Q?SRxFJp8IbKWukDdfEwC48zMVC6xh3+ATlV2S/UHZNX2wdRDON20GvRBQ3kHf?=
 =?us-ascii?Q?URVW4RTaNVwanLH33NZ7G6RYRUFh31vQwgeBIuxNFMpldxl8uFbdwY3GO5Fr?=
 =?us-ascii?Q?x11G56eupTXHsIZcsWMIjNt6jSBA/BHU4EmDkcBi5NgSMFVlP7Exo8sy9Ecb?=
 =?us-ascii?Q?EVYIJOH6E9AjOM8oNioGLhgYp2OP9AoADW084/FgTSu0K3kPQwX+CReRDq6f?=
 =?us-ascii?Q?Ffl1u2Ga2lwjHlq1UM6R37BaY+qc8v4zcp7y9/m6TphBLE6eq06NwLaw88f+?=
 =?us-ascii?Q?g8GGNIv5C5y+gLaDInDbRlfIAaL4xNTd0H5J+U6XZH63g1WRtjqyOh58H+8P?=
 =?us-ascii?Q?lRLKRHRjojvdLeOgprCE0ELKiC44bzUp6tpBFFbj5qqlwb4jwrYrRoTMvJXq?=
 =?us-ascii?Q?9HH8aJ1yoRaKAZcEOx5uplXZTSEt5WEZWvKz/FLfq0Sqfz9n2+OWWdLPfg4A?=
 =?us-ascii?Q?8DEfAt/Gn+F7T7Im6VBBovr6ryORJ84Hd6EDFbv/78QQ+GMR2w8TkrN4EOin?=
 =?us-ascii?Q?7SVrk8jxhwqjxg6gmxBZDJ9rL4xsgRu5ZFSI0HqeirLU4+p1E65Z4vjEz1AE?=
 =?us-ascii?Q?DxDkODYeI7EtXMEgSfJtgxjx3uOQ7S6dlHO5FUYtpezEZEMjfsUU4SdBnWJJ?=
 =?us-ascii?Q?HGaY/jl4rytqZqNhMe3m6LyM5qErtHcRQZqzJRKpuTyvZaeuTVjMBSORbwcB?=
 =?us-ascii?Q?4URm2rqkr8ZnO8gEyMJm04D/4yUn9CFoW7Ha7VUtf+Qq1uH0F4WLzbdju+w4?=
 =?us-ascii?Q?t703vqaSSHY4QCB6Gjh7RnzSwdOeaGsLyetx11mgaJVFo6AXoT6KRyY4IdbP?=
 =?us-ascii?Q?ESSGusqAAfvBY7xqvmGmfnKpQAkeb00O22FvgkrR0QYyV+Z1m/lHnnVovJLK?=
 =?us-ascii?Q?ectbh+sXfm+nqItUmRSRU2MhAEcwXAjxNZjXtRGKZ4ZN8nin6xOQrbMkE4Qf?=
 =?us-ascii?Q?tBJxjMq1WzS7Bn1e0XboVk6SY/2awITWbH4Rjge2A6BmS8b0uTVW0zWgyY16?=
 =?us-ascii?Q?wiYShNWdedAhD6Bp43CjNJHGkUz6x/4EWIiM8N5wfv7M3GbKeKjIMn8oIJn5?=
 =?us-ascii?Q?PVxObxpXzC7yeyDEe3tVRin34cMTNfq2Ua6DvDv0GACKHW6/9sUNbNpOTdeK?=
 =?us-ascii?Q?xEKpWeFytUehVVvxxz/iKbhVRLOktX2Snz8B/eO8+0rWHFdsPtMRasr3NXld?=
 =?us-ascii?Q?2jj2wSKzda5ZUag65IHFJ2x4+g0FjdkCDzPq7hdYx73lr7AImJz/84aE+KHH?=
 =?us-ascii?Q?R/VC4rZjiPuenVtydA1BX0VuyqoWNc52dZxq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?62Vehj+TggmuzDNlEgs3bT3bN4ujqRNP3tfmzaTCClUuJQp7GOGN0xw0S/SD?=
 =?us-ascii?Q?bls5WDuE9jAkAEBJnRsygM+yoMEgelvmUyNah2mprHREZiYCsJeErXIaSkqh?=
 =?us-ascii?Q?iOa3PUtrkDBmA5MXtI1QfiQguLAkT4TiJsOeNZC3tWOuj8vwa+bsqJOkvNjR?=
 =?us-ascii?Q?flOUWuavEIpreVFUIleuyR266y7EAqUlsjRlYxXGuQMkz+N6rIGcW2nIenOL?=
 =?us-ascii?Q?6rBut8mCNIf4WFS0ogIRuIE5CDKqcit0Iw8qfdKVFn84ZWG4qmsYk2o/gjOy?=
 =?us-ascii?Q?OqEzY23b2Os9V9mWjLe9czBx3Mg52TNT+0tRGK+vlaYk1QNCo08+D672j+uR?=
 =?us-ascii?Q?CCuWFSIYUwmfL0JbojcBfBsNSuwxqjdMdeYSrvFaXPEeJq71D1NkbfGVxon1?=
 =?us-ascii?Q?3Dd7EW3K82Wgwz/C/PzvJyvByIc5uS1Q7YPZiCtZ2V88VTyHDnc0Vt4lNlhS?=
 =?us-ascii?Q?MmgF0d1DTuDG5s1UfIMvI6f9CB/Ai8oJyckhI2s/bIP0a03PyaqE8q79k5sd?=
 =?us-ascii?Q?RWeUbDoxZmlfZnE+pA8Bb5jciaY/kY6VYNLlLvM3vDWcx+eNfD+C59aRmvbx?=
 =?us-ascii?Q?bv/NXsfH2XYBr0LaS5TypE7AQh16R40b9DcdUszlAnRAwzOMpPsy2jf8DNn+?=
 =?us-ascii?Q?/JtbOjCo+FAuMMFvV10llTSyspvtC8lHZ59WgwP4mM+RKuomVJzuCTdqKsar?=
 =?us-ascii?Q?SykOo4Jz+JdpLWBdQksIsDeqvJKotCH4H/lRovqzdCtDMImR3FuTPtRs4JSI?=
 =?us-ascii?Q?C6Q64NCUkHLneDUdjS+Flo9HPamjmWW9Z5yOl1Z4diZFJwbD/y/X2AvLQcLA?=
 =?us-ascii?Q?FfuRxzESqPUWOxArCmbB+B+UO0/xqc0qzlr5Wb8RFnHDuBXDgJWHX3IqyLB/?=
 =?us-ascii?Q?v04kBLX564ouSM2CbTP+C94h3FnTQcjtOP9qx6/pn2vzVM3CeqkQU2u4nnPr?=
 =?us-ascii?Q?iHyDO+JFgvDwFklKAFRJC5LFhG2lW91OXUCWGZ4H4/ttxg5OosC7AC3k/PGK?=
 =?us-ascii?Q?LqRdE9HEQ/n/4iVxmO3aHtB0/+LWDYgrTYEPUNqRfbmhQONUQkO65DATcuyY?=
 =?us-ascii?Q?SvrRWCF1C2dS8whmu5DXhKWC1lXxv/nHZKDh/WSyE3Me+j97CzfA5zi7OYKx?=
 =?us-ascii?Q?M70IOMJ5eVI9j0b9lo69YjSm4Zqq1959hcMIt6mNI0+av24L2ss4vOSqRvFV?=
 =?us-ascii?Q?2eoTtfVUuNa4gYrzWr4ieFgEiSj+uHAlIZj+Pu5fr8OtF4mzV8CHMcKqIFO4?=
 =?us-ascii?Q?l1dI2jzNDA020b7XovhbIJ/IlP1fkR4iXy7+R8WBE09StfaTZqY8PCAUi/GA?=
 =?us-ascii?Q?r2IlZrnLIlbYm4f2+SQNoq2Cq3Mfj0vTG+cXdWa3mqSjvDWgg4GnZdoKRDzi?=
 =?us-ascii?Q?FzmooOsqCKugmJIWTg9YZKnNnGrZwMrgDcUc7r+jAWLwE09RtLY+BYFXof8Y?=
 =?us-ascii?Q?dQQCipdaWvXc1Jz/YYnG3RrKBMnW5BDxABy7ppqFik81r0RVzDgOityHECma?=
 =?us-ascii?Q?0QUWTYdqdvSjQhBF6MWLLnYlc4QaQCyyLDKg/udRehu9lWCAoIjVOEjLUCEh?=
 =?us-ascii?Q?itrz9JIFLu59LRRkeWJ+kloRPN9NUPpHHUChU6v/aafWUKenqxX8PDv59hZ+?=
 =?us-ascii?Q?aZz29LkbGfpoiYZTdoeZ/kEi1Uh7GJEbLSQNGgtQxER8+gPxQQil6Tzt0kYg?=
 =?us-ascii?Q?Q4WPOiScrKZkCuYWa90rBd+H1zkJUpi0GZvIRBsHo7Ipcsn4S5cFpu4fy300?=
 =?us-ascii?Q?ZEQOiE0Fzg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74ab6d91-ef41-4835-74fc-08de4ec6540c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 14:58:05.5072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8JdrPVqSxHhcok1AXv3kdLFpu4Btfio0qGruAhNiB7Assc+AMzKwuUY/Ax9cEg8vVbffwHBRHR9IaSKwrF7jrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR04MB11236
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_065810_615540_252BF8A5 
X-CRM114-Status: GOOD (  24.04  )
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

On Thu, Jan 08, 2026 at 10:05:52AM +0200, Adrian Hunter wrote:
> Prepare for future reuse of the reset sequence in other contexts, such as
> power management.  Move the software reset logic from i3c_hci_init() into a
> dedicated helper function, i3c_hci_software_reset().
>
> Software reset should never fail.  Print an error message if it does.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>
> Changes in V2:
>
> 	Add to the commit message a sentence about additional error message
> 	when a timeout happens
>
>
>  drivers/i3c/master/mipi-i3c-hci/core.c | 41 ++++++++++++++++++--------
>  1 file changed, 29 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index c4b249fde764..3b0609cb7da7 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -585,6 +585,34 @@ static irqreturn_t i3c_hci_irq_handler(int irq, void *dev_id)
>  	return result;
>  }
>
> +static int i3c_hci_software_reset(struct i3c_hci *hci)
> +{
> +	u32 regval;
> +	int ret;
> +
> +	/*
> +	 * SOFT_RST must be clear before we write to it.
> +	 * Then we must wait until it clears again.
> +	 */
> +	ret = readx_poll_timeout(reg_read, RESET_CONTROL, regval,
> +				 !(regval & SOFT_RST), 0, 10 * USEC_PER_MSEC);
> +	if (ret) {
> +		dev_err(&hci->master.dev, "%s: Software reset stuck\n", __func__);
> +		return ret;
> +	}
> +
> +	reg_write(RESET_CONTROL, SOFT_RST);
> +
> +	ret = readx_poll_timeout(reg_read, RESET_CONTROL, regval,
> +				 !(regval & SOFT_RST), 0, 10 * USEC_PER_MSEC);
> +	if (ret) {
> +		dev_err(&hci->master.dev, "%s: Software reset failed\n", __func__);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  static int i3c_hci_init(struct i3c_hci *hci)
>  {
>  	bool size_in_dwords, mode_selector;
> @@ -654,18 +682,7 @@ static int i3c_hci_init(struct i3c_hci *hci)
>  	if (ret)
>  		return ret;
>
> -	/*
> -	 * Now let's reset the hardware.
> -	 * SOFT_RST must be clear before we write to it.
> -	 * Then we must wait until it clears again.
> -	 */
> -	ret = readx_poll_timeout(reg_read, RESET_CONTROL, regval,
> -				 !(regval & SOFT_RST), 1, 10000);
> -	if (ret)
> -		return -ENXIO;
> -	reg_write(RESET_CONTROL, SOFT_RST);
> -	ret = readx_poll_timeout(reg_read, RESET_CONTROL, regval,
> -				 !(regval & SOFT_RST), 1, 10000);
> +	ret = i3c_hci_software_reset(hci);
>  	if (ret)
>  		return -ENXIO;
>
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
