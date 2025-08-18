Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F2EBCA0ED1
	for <linux-i3c@archiver.kernel.org>; Mon, 18 Aug 2025 17:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kB4oc+ZqiXfLm1ZfTwe0yMJ2mGqEcw1HRPzq54/KpZI=; b=3fAXl06IoRtcfu
	9QHogkq8rGEI960+nKiiZmYqh81tnUNI6ozHm9BhU0xh+9GU1nGWaYZx69nuPOt8v5bu6u+LmDp92
	0ePZsGtcdFUqJyCFGnrKi7IF3Uu3zrYy9/dz/imHPf58ZRVWM68/VU6zkvnr6lkuc5KKkB/+YTTkW
	4q9LDuKO8QrW5eRGsgeWPwQGWo1OcDqmdJCwwG3XV6Wy5C2t8vNSazO2j9q5txX76cTQKxCINglw4
	aWwK/i2VnSMC/Y4qwtHC/OHCcx9TYSfBvRaSVXDT6Y9MyUQnmJy2G8R0fpKANdh+EtDz5+Qekv4Uj
	pBcIo/ixR2BBrbG+N+3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3jf-00000008CPM-0Dmy;
	Mon, 18 Aug 2025 17:33:31 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo2Xx-000000080dK-3zj7
	for linux-i3c@lists.infradead.org;
	Mon, 18 Aug 2025 16:17:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UQNkcUlF9rHXST5yZHXJgUhWad+agqFEe/5lYBWRvM+4s/M93zr8HlD6JEBqb7+0vUUNSokPZef2Wb3n8FIlWh7TMC5XXp9NpqarhjOw7jN83g2Nn/p5kOnosAsW4BXJOwzbP4pySD9/lL5mQp2X3FloQIjzuarwbfN8seo+kDYdoyN+3tVHSFFzFttEygsFCLbwW9AOOBaPBnu+X7LEqCb67Jm5ntK9n3H6zKsOxlUU+pnH36lKU5YXahPrTT97mcRE730d6kUYfwNrDiDhnB+LtlTxLcis6m2cSM+B8enaZX6BoQCln6G1dDCbKLzgbrGFDnOAfz24Q7Q+139deg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qq86tM5gcoItmjnbxC9oyGrNy5aCAI6QKjXGnEAY9ZA=;
 b=rToCdyd0P3Z7VgOIvUK93oIDGHO9jTyU8HBeg6Yq5zP1WRrEP3PqqHrVRxiqcbOjYMIjhzhRcPYQXbumDBqM3BK3mmjpK7Y9TdiHgWaQ8xVF6t/sy0X7w0nXM5tqmay6Cdde5sSIyKKNk7+GCJh406ykyPpQkFF+cXrGdb00APrKEhdcZQpzjKkjw/dCvyBfeT+fTIt9LVvC8GMK/+5kiJzOgCuDpj0R+YuU7rmqhxKrJ2yn1f3y9JLvhlCd+RO+LSAt5IkRZwkQkH9mo8nHrRJ4p71w3N8hOaIcvGv1ANJS8bZX17/tC7ZplVd4aXO8hX9aNIAd5ZEwTXBo6PSzmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qq86tM5gcoItmjnbxC9oyGrNy5aCAI6QKjXGnEAY9ZA=;
 b=UESx0W7nAT91Sa1qoigQEAYdpvVSXeXRWb+AC4d4Wh0OZya01H7L6bG3E1huTv/+NZXVXADyFuzNwR8W49P78AKaVWOzy1rqtK3JdPf3abgCCRRtisWPZI+tP61a7CHk7EmmCQJGxJlGCF21q1zRblvblElv0VnWi+FfVV5mfOddzxfyzi+++f0Yuu5Hab5z68j+zaLMvHVkyR7gCvy6cS1Suo3v6l4BiqB0MOe6TikkJuCyNa29ibDIaAj3sOvaKF8ZpI8DEk9xRzht445jiSDwVwumIz09OP3+erQ5wi8tLgc5g4xIZT4Y2K6Q72GyawWRZuIVBQRfy8u6BQQTsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU2PR04MB8998.eurprd04.prod.outlook.com (2603:10a6:10:2e1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Mon, 18 Aug
 2025 16:17:15 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9052.011; Mon, 18 Aug 2025
 16:17:15 +0000
Date: Mon, 18 Aug 2025 12:17:09 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v2 2/4] i3c: mipi-i3c-hci: Use core helpers for DMA
 mapping and bounce buffering
Message-ID: <aKNSBaRgLusZE53R@lizhi-Precision-Tower-5810>
References: <20250815141242.2013767-1-jarkko.nikula@linux.intel.com>
 <20250815141242.2013767-3-jarkko.nikula@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <20250815141242.2013767-3-jarkko.nikula@linux.intel.com>
X-ClientProxiedBy: PH0PR07CA0058.namprd07.prod.outlook.com
 (2603:10b6:510:e::33) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU2PR04MB8998:EE_
X-MS-Office365-Filtering-Correlation-Id: a7b86b52-69b1-4002-207a-08ddde72b201
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|19092799006|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5hGYWFLIZavylOi/2S++ybqYU+q211JpnQNh3M2fJc8Unc2b/TbvcgaDOmvi?=
 =?us-ascii?Q?+gTnBpN3OR0ja2IDr5cl3G027GDZOWPC1b2gTg9Joqk6bMowpjEqqIRFUSpa?=
 =?us-ascii?Q?XI2kUiyEt2OKwJHjLceCB6FF5hi3TsgajefDbVZXsckGnzhJrY4YYxt9nyrS?=
 =?us-ascii?Q?r53/dq661yR5/C5Kb7U1dWtbtgDUJYzI/dLAgomPiFkr64NfWsS1GO1ghdSp?=
 =?us-ascii?Q?eCdSzIDcngSwsU6PN4i2MvOIH5j2fL8O611QjuAZh31YymcPUpPEQMtNqFCL?=
 =?us-ascii?Q?hLl/5a6SNwtYSaQrK9AFveL7pa7fycKiuulLEMZzDKyJEgdsUnH/kfBLnvoa?=
 =?us-ascii?Q?SU/UuB/+tr10/yPelGNuMoUoP2h0A3RYIdRXibAeS0QybtKMe8TGkl2XNd4s?=
 =?us-ascii?Q?vnwOgHZWpM2Fwg/8dqu9RAXEDsvYf9UmKVNW7tolvv/6P+Bx8yHJYmZjpHv0?=
 =?us-ascii?Q?EeRbOFBserufMiy6WhknU6aCjV0/XPAkSvyeGeI3JKIBvT1HKe1s1Ptc/o6K?=
 =?us-ascii?Q?2PnZZg8C8Vj7prHSgUnmHhLtveF5G9+wx0RfXupgaIV5Hodgfm17nhgGl8j4?=
 =?us-ascii?Q?uqUAX0PskwBnyyV1sZHEc0c0Xx0FUke8sd9swQnTxrGKx4c7M8o4GFN6ACnz?=
 =?us-ascii?Q?jHRsNNEqoYE9cBDQsgTMvUVkx5dfE9APowbhzqu9MEf+WxudjT2f2DMlGTM+?=
 =?us-ascii?Q?wLJkfSU6nyMZuYzzzfpbzXziSPBZ2sBxuKvqZNs10KgoAy0q2b7IyChtcj5E?=
 =?us-ascii?Q?fvvzRxUO0lfK1+jmyXhUZCgOPjE/EjnRLUFvHFTrO0SPfxpWlMd5rLxCrhHy?=
 =?us-ascii?Q?preuj7v09tTbwftWq2HLCAA5XC49pAoJoVOwe96E0Q4yX8XBY5lHOH5395hH?=
 =?us-ascii?Q?RSQf+0+jBrEqYgmkW++pG80QwS7hFTmOv86pRCM31LyYe0WK0XmjOUEwV0Bv?=
 =?us-ascii?Q?jd4wl4GR9LEA+SlrwMWZ3axgl7ElF2ivVBCZYQKlBoPGwNxV1hnUQs4nquZ+?=
 =?us-ascii?Q?rLGt9o9ZbIS2mN/38vRN6n5N/FbrC35yQRH2UINbxV1K9yiUKBCU+iAzbW+j?=
 =?us-ascii?Q?zTMEi1zNwYnOVyouoja9JSrJVJYHVP87Bpj5k6j1aP9GvptvZdz3CvvJkfnr?=
 =?us-ascii?Q?7qnZsCj0U34bgOse9HKYQ7TIXzHwINST34B5Bpb0KPfj3/SqCeu9XkOvTEIM?=
 =?us-ascii?Q?VpN4tHx5P1N/YhVVrl1K3WoFO6QS1LSMITCSymUodUflcGy1pFGX/C05qs8F?=
 =?us-ascii?Q?2eKnc9oBc9GgYgAoJ4SCWYcZat/ujrJ1YCUyUQNBGgKmMpj2IcC1LiAor+zG?=
 =?us-ascii?Q?spjXUaSQwXd5AiTPeNbD2IJ9V9WP+NauCaTnZpcugHxIe+66L7rXPhYM7nLD?=
 =?us-ascii?Q?dgDJka7xjYyzvLbEArgdzgY89aGs3d89ZaGywbWYuuiHyMH8jD6d2G/fw5yb?=
 =?us-ascii?Q?pxPrJ8ToDZg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(19092799006)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O3sSJa5EZ/rT+r0yUeB6aOiugXfyEBE0yS3CDIQsfuTxusA9rOQKDsQbpEYY?=
 =?us-ascii?Q?sDEDkEh11A6hWVEQ7bdWC7Btav8PHr1GdWCV60oPuhfaaQmG70r0L8bCjUU5?=
 =?us-ascii?Q?PZHTvsFipNZU/oTeE/k8FR5pNGz2//CMgaT91rEo+NJ2TUpH2huBW1dbEQPu?=
 =?us-ascii?Q?ri0a3F3jqmSGXSTbjKEDFvsvjSBIHImmc70GJsam5S8ED6cxgqPX9HPBB87G?=
 =?us-ascii?Q?5I+gbcpRdjZVzVhb0YKdbEFjbdwYXNAGU14ZNdp+ZzcVuc82BSzeCUI7FOzB?=
 =?us-ascii?Q?vnfEdaJjZJe4o2o6ald04Yy6y9r3+3by9xUSFsAst5/6qve2skFMk6TQNKah?=
 =?us-ascii?Q?ccUXYedXn+Vs5XPaf6xkU9m2NQ58MkWCvmVFv0N9Z95X94BWEu9koJaJ4JFk?=
 =?us-ascii?Q?YakF80M8u6T88CzkUuTk2dkFHQyXmBu9rEhr6Wq2VXwhxmkqdb9lFba7DKoV?=
 =?us-ascii?Q?j03rE3SfBVEn1lpcfk4cyc8GdQhxewZuealH5YJaq+PL33XDOQNmSTwhyju5?=
 =?us-ascii?Q?bTVdCyP6goZ+xsdiVAoFePqhihd4GLnGnqKOeiHObSaiKmeprfTm6NA1FeHy?=
 =?us-ascii?Q?UCs1cdxweVM9172bHh0MTOhpSP4r5UdVJ8doQq8VHBftes0b3C2+tcra5ASS?=
 =?us-ascii?Q?hqi51TAx+n7ltb92+eTEppkomPj4EUy079iyhK74EbcuV5NunhqO+uTflmLq?=
 =?us-ascii?Q?tzAP5LG5c7xSS3y0z8UjlUQaAFMjf95cPWZ900ZSz/GQKEf/se+oTQ/Wz4t/?=
 =?us-ascii?Q?cSBwccQ2NYKK3jgg541eOMQBAaHACRqMI4SBNx5bK1L0Lx7uw/UEZKRMfov2?=
 =?us-ascii?Q?mpTf8vI9XARjhTgBHbVrY4uLTD55eCS+LqDa+Bz/Z0RydSO/cD2rtbttpaQP?=
 =?us-ascii?Q?nJAGcjjm1UfAdNzujp+8qyWCUFmawsOVd6pMCvJ4BHiufx1XNeA2svttGZxA?=
 =?us-ascii?Q?2K8bhXrWV/5Xzx+8FZNrYzzhCApHigYdJnSN53UIwOt2MyG2rimp38oyE8Q9?=
 =?us-ascii?Q?eOMtQXqnH4HfL4HYu+w263u+VIgrk+IM1d7ingBTHCud7i9sA645h2o3rx1o?=
 =?us-ascii?Q?c28wdB3IHyW99q3UP6weBuogn5iEHLoBe6Occ7rz+f7vvh/DSEHGykDQyOm4?=
 =?us-ascii?Q?HVYRNxGptmIq3Bl3+U8W9NLn5iP5p9EXgp8inXvMJiBsFwujhZOo157146wk?=
 =?us-ascii?Q?NocKDEHed/RkRVpvhRyYqlP1KxQuoEvcnPOOOZvwG2PIyqR9hYtcIikJQmYO?=
 =?us-ascii?Q?czRxY8Y/byf+1d87Yix8q4GeqcMxqGPdNyWkpOm1wMwXHZ+qh5eNwUnIbrm3?=
 =?us-ascii?Q?6c6D/LYxDGwmGpNXgWRNTy7XCCKMKh0GDSuF1Bmi/HxRSkecwh69pARLZran?=
 =?us-ascii?Q?AntuBcT3SzKzjiEM+D9yzLEvu69UowqjplPWThtAveAdqjrEmivcy1ocniXQ?=
 =?us-ascii?Q?VsbxvPtuoRWGyjKYZJgtR3og1m4bfTAy1g0KjIYE9C7ZOSvOXsgHGOQKZyew?=
 =?us-ascii?Q?xdqvJEmwW41Rv/y2wqfJgLmTn9+1f/Cp/t2dMqiR0M0tal/tnIkqGyT457BG?=
 =?us-ascii?Q?qcRaRtkmPcsWQdViIH/Fx5o9QPV/FhI23CqPQzLo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7b86b52-69b1-4002-207a-08ddde72b201
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 16:17:15.2070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZmxwNfjHLffggMDWzIiz1//vgIrrFzwz36V+emkoHGoC/uqPBgG/x/eDwGXXdlu3tV8yYJDFsZBN+EaSd6SjBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8998
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_091722_000903_AAC16993 
X-CRM114-Status: GOOD (  29.61  )
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

On Fri, Aug 15, 2025 at 05:12:40PM +0300, Jarkko Nikula wrote:
> So far only I3C private and I2C transfers have required a bounce buffer
> for DMA transfers when buffer is not DMA'able.
>
> It was observed that when the device DMA is IOMMU mapped and the receive
> length is not a multiple of DWORDs (32-bit), the last DWORD is padded
> with stale data from the RX FIFO, corrupting 1-3 bytes beyond the
> expected data.
>
> A similar issue, though less severe, occurs when an I3C target returns
> less data than requested. In this case, the padding does not exceed the
> requested number of bytes, assuming the device DMA is not IOMMU mapped.
>
> Therefore, all I3C private transfer, CCC command payload and I2C
> transfer receive buffers must be properly sized for the DMA being IOMMU
> mapped. Even if those buffers are already DMA safe, their size may not
> be DWORD aligned.
>
> To prepare for the device DMA being IOMMU mapped and to address the
> above issue, use helpers from I3C core for DMA mapping and bounce
> buffering for all DMA transfers.
>
> For now, require bounce buffer only when the buffer is in the
> vmalloc() area to avoid unnecessary copying with CCC commands and
> DMA-safe I2C transfers.
>
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> ---
>  drivers/i3c/master/mipi-i3c-hci/core.c | 34 --------------------------
>  drivers/i3c/master/mipi-i3c-hci/dma.c  | 32 +++++++++---------------
>  drivers/i3c/master/mipi-i3c-hci/hci.h  |  3 +--
>  3 files changed, 13 insertions(+), 56 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index 60f1175f1f37..b2977b6ac9f7 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -272,34 +272,6 @@ static int i3c_hci_daa(struct i3c_master_controller *m)
>  	return hci->cmd->perform_daa(hci);
>  }
>
> -static int i3c_hci_alloc_safe_xfer_buf(struct i3c_hci *hci,
> -				       struct hci_xfer *xfer)
> -{
> -	if (hci->io != &mipi_i3c_hci_dma ||
> -	    xfer->data == NULL || !is_vmalloc_addr(xfer->data))
> -		return 0;
> -
> -	if (xfer->rnw)
> -		xfer->bounce_buf = kzalloc(xfer->data_len, GFP_KERNEL);
> -	else
> -		xfer->bounce_buf = kmemdup(xfer->data,
> -					   xfer->data_len, GFP_KERNEL);
> -
> -	return xfer->bounce_buf == NULL ? -ENOMEM : 0;
> -}
> -
> -static void i3c_hci_free_safe_xfer_buf(struct i3c_hci *hci,
> -				       struct hci_xfer *xfer)
> -{
> -	if (hci->io != &mipi_i3c_hci_dma || xfer->bounce_buf == NULL)
> -		return;
> -
> -	if (xfer->rnw)
> -		memcpy(xfer->data, xfer->bounce_buf, xfer->data_len);
> -
> -	kfree(xfer->bounce_buf);
> -}
> -
>  static int i3c_hci_priv_xfers(struct i3c_dev_desc *dev,
>  			      struct i3c_priv_xfer *i3c_xfers,
>  			      int nxfers)
> @@ -333,9 +305,6 @@ static int i3c_hci_priv_xfers(struct i3c_dev_desc *dev,
>  		}
>  		hci->cmd->prep_i3c_xfer(hci, dev, &xfer[i]);
>  		xfer[i].cmd_desc[0] |= CMD_0_ROC;
> -		ret = i3c_hci_alloc_safe_xfer_buf(hci, &xfer[i]);
> -		if (ret)
> -			goto out;
>  	}
>  	last = i - 1;
>  	xfer[last].cmd_desc[0] |= CMD_0_TOC;
> @@ -359,9 +328,6 @@ static int i3c_hci_priv_xfers(struct i3c_dev_desc *dev,
>  	}
>
>  out:
> -	for (i = 0; i < nxfers; i++)
> -		i3c_hci_free_safe_xfer_buf(hci, &xfer[i]);
> -
>  	hci_free_xfer(xfer, nxfers);
>  	return ret;
>  }
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> index 491dfe70b660..295671daae09 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> @@ -342,16 +342,11 @@ static int hci_dma_init(struct i3c_hci *hci)
>  static void hci_dma_unmap_xfer(struct i3c_hci *hci,
>  			       struct hci_xfer *xfer_list, unsigned int n)
>  {
> -	struct hci_xfer *xfer;
>  	unsigned int i;
>
>  	for (i = 0; i < n; i++) {
> -		xfer = xfer_list + i;
> -		if (!xfer->data)
> -			continue;
> -		dma_unmap_single(&hci->master.dev,
> -				 xfer->data_dma, xfer->data_len,
> -				 xfer->rnw ? DMA_FROM_DEVICE : DMA_TO_DEVICE);
> +		struct hci_xfer *xfer = xfer_list + i;
> +		struct i3c_dma *dma_xfer __free(i3c_master_dma_unmap_single) = xfer->dma;

same here, directlly call i3c_master_dma_unmap_single();

Frank
>  	}
>  }
>
> @@ -362,7 +357,6 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
>  	struct hci_rh_data *rh;
>  	unsigned int i, ring, enqueue_ptr;
>  	u32 op1_val, op2_val;
> -	void *buf;
>
>  	/* For now we only use ring 0 */
>  	ring = 0;
> @@ -373,6 +367,8 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
>  	for (i = 0; i < n; i++) {
>  		struct hci_xfer *xfer = xfer_list + i;
>  		u32 *ring_data = rh->xfer + rh->xfer_struct_sz * enqueue_ptr;
> +		enum dma_data_direction dir = xfer->rnw ? DMA_FROM_DEVICE :
> +							  DMA_TO_DEVICE;
>
>  		/* store cmd descriptor */
>  		*ring_data++ = xfer->cmd_desc[0];
> @@ -391,21 +387,17 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
>
>  		/* 2nd and 3rd words of Data Buffer Descriptor Structure */
>  		if (xfer->data) {
> -			buf = xfer->bounce_buf ? xfer->bounce_buf : xfer->data;
> -			xfer->data_dma =
> -				dma_map_single(&hci->master.dev,
> -					       buf,
> -					       xfer->data_len,
> -					       xfer->rnw ?
> -						  DMA_FROM_DEVICE :
> -						  DMA_TO_DEVICE);
> -			if (dma_mapping_error(&hci->master.dev,
> -					      xfer->data_dma)) {
> +			xfer->dma = i3c_master_dma_map_single(&hci->master.dev,
> +							      xfer->data,
> +							      xfer->data_len,
> +							      false,
> +							      dir);
> +			if (!xfer->dma) {
>  				hci_dma_unmap_xfer(hci, xfer_list, i);
>  				return -ENOMEM;
>  			}
> -			*ring_data++ = lower_32_bits(xfer->data_dma);
> -			*ring_data++ = upper_32_bits(xfer->data_dma);
> +			*ring_data++ = lower_32_bits(xfer->dma->addr);
> +			*ring_data++ = upper_32_bits(xfer->dma->addr);
>  		} else {
>  			*ring_data++ = 0;
>  			*ring_data++ = 0;
> diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
> index 69ea1d10414b..33bc4906df1f 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/hci.h
> +++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
> @@ -94,8 +94,7 @@ struct hci_xfer {
>  		};
>  		struct {
>  			/* DMA specific */
> -			dma_addr_t data_dma;
> -			void *bounce_buf;
> +			struct i3c_dma *dma;
>  			int ring_number;
>  			int ring_entry;
>  		};
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
