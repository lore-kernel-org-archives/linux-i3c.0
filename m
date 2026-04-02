Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD2BD3942F
	for <linux-i3c@archiver.kernel.org>; Thu,  2 Apr 2026 14:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KZyMMBNoiGybb59YcO799oY7rnPi0XcSEMgcWtD9TgQ=; b=CrPvrr5bI298E+
	xeLkQyNlD5kPJSZTWF9nQLEITLrJQJo0bmLuYGG70D1tqldte4L6IwVKaxZhxxGixYq09sWItRyev
	FEa3ncQZFF2dVclQs3T8kVEgKgII1R7iMDCcIJ0eisyFcxETmP0ts+SjpJCT37OnSLZ/KfpnDvwb/
	h35PKXDru3AXrVekjVOxmDCTCv5QUR6kvDh2S7AOwZrBs/89aN5wmhvZx3I5LlQowTN3KETDjmAft
	PRUKmkCFyXNYX96NgJGJ1h3YkKtYKDO/HZD0cYA7XN5yGUuPMP8QFGmX7nfx9vZy3UnVwpAfvBg63
	Jb8jKtrZpxLe+6ppMMfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Iuq-00000000Jj3-0OBJ;
	Thu, 02 Apr 2026 14:21:00 +0000
Received: from mail-northeuropeazon11010057.outbound.protection.outlook.com ([52.101.84.57] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Iuf-00000000Jhu-2Ht9
	for linux-i3c@lists.infradead.org;
	Thu, 02 Apr 2026 14:20:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NdDHF9GQsZfQR4UCdprJf7ErmuarhDiCPBew5HCPSqvmStai4hYxPzr6gbRBW6VS66PF5H8pkyc5wMFyr7IW2stim49NU+Opd+ZdGrs/Ve2uy4EdrHPNfjc5HbJUd5elTGfN/T7uIVp/r5zN8uM2WgfNvEQ9H/Q+LIsanzXWCEtcaZ0flWfos4zLY50VX94c7RqmyDNhSD5+zwcApWTrSfu2Nv2YRIEgXOpq7Ht5h0SqbPq91neOUgzWbwjtatVKZrYZgvkgmwHw+Zoq9OtDPmIA7bTGc61FpiOrnjYFIopJKpSUnmrhYUjG+FvDNK+pnL8trTj4wOxFG4a9L2zZXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PVpYSh66mX75SXcRqPC7oJTRm0JM0A75dwGVXsb4RW0=;
 b=eM0GjK7EMe1PXescx8JP98znLPDJfQOXkjqxv3XyiT6jdgcNHVxjLdXZI8sbp4qXgmUeasnLmhpdAH5g3EPpTVM6oMlXsl+t8feWPdYMjmxpjl0t9xfL36vwyBTZPrqxJuAFWy+BHUD0opCyggF+4a1JMWcr9rJb1r2oL5r5iE18nPTGlOXvcVL+j18ihfRR89ZkXhOGlIfKiVX/0uE8RQPOFrrnIzFnWOyXt2D6F3+Wpo+DcMhT5YlLXaxGRPtQuBHB8DTLvTU2EMcFz//DE6W8p3k4uxSrYN7jvM0kH1cmpMfpEYRJIxcRbI5koxwUhExfaOmltCKsPvL+/aVJAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PVpYSh66mX75SXcRqPC7oJTRm0JM0A75dwGVXsb4RW0=;
 b=csD6EsWVxKRQA5CQCvQ4rBLuav65+3Q/rw2VqCf3jPqS9FLALBJQQMdQMMbtgUtKkYf2fPJ57WaTKGmAR9uXIKfz/L2J+qAmUvPA7DNdZ0tFfXHr3fgFg/f31t3tVRDo3NerZdRfnWpy7+/qV5oa7jAN5h5pgBZRTF+mWtspfOzd/i9PR5GbJJWvj+nKdjGDTFgKnuAnkeeEPlz9u7lQQspf+XAgCFhRhaz1QQ4/KQKauhF/t8yvJTH0PtZotVUnYLHFuVi9MtPNQwqPpPxWlvKmcAhywhgAyc57qagR8ULRP8y7bVvdxh/4d+MFhZwKPeNgKopxeRH34Bg9F1A9Sg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA1PR04MB10626.eurprd04.prod.outlook.com (2603:10a6:102:48e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 2 Apr
 2026 14:20:46 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9769.016; Thu, 2 Apr 2026
 14:20:45 +0000
Date: Thu, 2 Apr 2026 10:20:40 -0400
From: Frank Li <Frank.li@nxp.com>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: master: renesas: Fix memory leak in
 renesas_i3c_i3c_xfers()
Message-ID: <ac57OE5Nflp24bAm@lizhi-Precision-Tower-5810>
References: <20260402-renesas-v1-1-369a7d867502@gmail.com>
Content-Disposition: inline
In-Reply-To: <20260402-renesas-v1-1-369a7d867502@gmail.com>
X-ClientProxiedBy: SA1P222CA0176.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c4::12) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA1PR04MB10626:EE_
X-MS-Office365-Filtering-Correlation-Id: fbfc2f1e-4b90-452e-f9cc-08de90c307cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|376014|52116014|1800799024|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 5ZByHn6vdBwwswGBrEjYJk8ROkilpptv/9Y/RMuOL1OExd6DJHXglZNaMxGl06XY9w1BHyapALUybz5DtREINcKVwOCGBJ2GvSvGSqX+h8li9ytR6NOcz6QwhFA3Na8vocXB4TjDnwmbJlZSggyZbjNqV/0AkVwJkiYqu27md62qjbyPvCFxlePuh/usDpgRrWaZM0BwRRXESsfm17I+3Y3lflO5cA1WT/+QNUAGqPT0e1ijxHsSl942LhvkmV5q7eOWDHre3pLHp/QKboimHBtmXu8eApesZYI49SXIFXMsBwj58bhqhgWwduCWEmz4Nm3pCrDHL5cqddfNtxs8Wn0hLEmRGyAjdNnpMLxGeyd3QtILYlShgvOGDmx6G1LJXhn88l6yeLDzjrqp9xOewT+pLSEbv5lKpaMqjMuJ2tNnB5RoXlnABifeqr+aQBIiI9epGIq8VRb1X/1RKyvffpDwZUs/6BP/THd35s4dr3QwL+knRtknPXDx1O4/1lAL4ECq3DKmJw7uaALrUij52IPjMJ+Ryg8+FACd57wLSD8UWgR0Bjj3wpv8UvSHrAoDlH9Q9MuL3/FB9KanZVYwsQyiJ3I6WJ3grNyrr6HohdVqT5Zhu468WOeorY4JOI7uzmPZUCMWIGx+io/90uqilKRbEXZICZnKxqtu+JZh8aXHdLMetahSm0t5dLA8F7HvaPpdygkqJzmyh5x9jbCvlbHxIYoENFkBUDdmucBbMdyrVUFIlbMuVSPDuOvHrunc4LxwCH5Mk8X7Xe/QL/VkzjQ2iHRaUqZ6d5aRh2kXGCE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(52116014)(1800799024)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uHIhIwzuoFMkaxjjJVr9U8zBdwLOmzHhnMiXf5sKbJMVzSjDVAsUIezLlBMx?=
 =?us-ascii?Q?MkYjfpocpHpFS34f6uFa180fHNnEAYuX7k++5okFw8kcbyu2o4K6Do8WnKh2?=
 =?us-ascii?Q?4G/Y0d7x8p73frLbDUQ9fqdtfJY/zq1AOiXFXaboVjt8VsGlrYF/7b3Om9Oz?=
 =?us-ascii?Q?p8CqnAU98jmLbqE2I1MGqW5wxhBDySa8xWxDUwwoqavwiWTL3TRi1S/eQIL1?=
 =?us-ascii?Q?kN5fHrP+/UU1LcxshMV7j9ldHnSsYyCuMYIbGZEzZWdWy90NyYU4OFZMIx/w?=
 =?us-ascii?Q?2IxRO+KJGUShjQ7xu+BedZlBh813yZHSWD0Wyx5V5pp0qHY2twTGd206GtHq?=
 =?us-ascii?Q?UrVWn9kdaqC+HmbSchy5/4aQB1e0GactGLSErl/7wOz0KDY9oDfXXPpzt6oC?=
 =?us-ascii?Q?zFP3lNMvCV260PGzK21MRb01Hb4ng8EOHcTdKlGbaqQIOkQ3WY4AYZC7RUME?=
 =?us-ascii?Q?t+amUC9nr9AgI/Bk5WI86ryxlhVscoNfikLA8oq1ZNrGey4LaFFcPPTWzpfF?=
 =?us-ascii?Q?ZNP7MBlklw0vkS72zWRtqpxnlGmbMNgM/r4aA22oGG+g9SNxgenhpKg6z5ie?=
 =?us-ascii?Q?qsvOtOxGndU3jYlHOf9R5OT4kYvLdiPBT/93ebrx9r0MaIxufO0bXnv1Y6l1?=
 =?us-ascii?Q?Hj7W1Y8y9nN8rETL/A33Bx+jAre6XKdveDr89D5xEyiLBzUCVSZAaEQiWIJ2?=
 =?us-ascii?Q?0FfX+fbgOUnhbKKXqLYCasxRyEA2fsBnfyIoVsmU7EO0XFS0R9TZX8gn28kB?=
 =?us-ascii?Q?GYGbf9HyJAh/KgX3Nhi5Yf70wzqa9t4Tuajyg76vp3zJqq6OZENxmC0U4jde?=
 =?us-ascii?Q?XndqgYrOU+FWS60+jEBeY2LRIe4NbRKbMm6PeTv+p3cVlBBT6dOy38C+UQoT?=
 =?us-ascii?Q?5FmACoDEHIH3udY8S/5WI1ncl79qLuCSl3SC+q0qEkSn34ppd7GKtBMoe9yP?=
 =?us-ascii?Q?+Xp97YG7t1UXKdGO/30Jxn1EIMDw6IYxAd2R0lqOeeDiEznnZvZifj47PsKe?=
 =?us-ascii?Q?d4tb9hXK7SF6AUGxbGzyIDVhQP5Cy+3l0lzmx7n6LxBL5R9KhB0LNvdoAVRd?=
 =?us-ascii?Q?DP9fvJQPcwGSmAgr8KZWwTwBAPjDbrndrSQIVD4mIiWuuccS3sejsFVMaggW?=
 =?us-ascii?Q?22/JD9sE1g4ajJgdb/Mr9aONaTL8SskpFJphWggTaOeEkRhsyYIxDM03sMoB?=
 =?us-ascii?Q?RyxwlPmjGt9ZNzcD3ngjj/35Jc8CiajhIeKpoHOOp7LAu5bR22/y7yH0FH1X?=
 =?us-ascii?Q?Rn3KT47y+xNsWv66BbOC4gt6BEDzSi3emQnfIxebFEXD7Z3mqtTdxudo78K7?=
 =?us-ascii?Q?nrxfdha/2+xFjC12/3+lRP1wdp6v5dcqC19h+ENw5Pf4kIlejOIRuWMF6lHC?=
 =?us-ascii?Q?Jy4aMaPLFCUXbXdBHVRDGCLBGdUImARTVgqA8YdFSAWnknu347SYKcfBsZuZ?=
 =?us-ascii?Q?QPmA1AfKm92AafNUhs6Zld7LoIyCCNug//gR2bzQy8gCn89biApvL8r3fyXB?=
 =?us-ascii?Q?iroWMp39gtMrBex4Gf1P68mwRAHrE3oPhJCLyoyDsLW4Rf00y8FVzk4fLOFO?=
 =?us-ascii?Q?BWcF5BRDwz6MBm4hEzYTRkF/jDRv+FBfO/nvwuRBb1dAnILodTcHOqGWY/2n?=
 =?us-ascii?Q?VuMHEVnNxSIWkYDl7UhuGNm0wnLjV0qBjLx2BQCU6hd2Lo2aJfqpH/0BEnm0?=
 =?us-ascii?Q?loHLYpzTGoAGYib7K8fMRGkdXSBIIbBSCkS2ZVQKuYlmknjw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbfc2f1e-4b90-452e-f9cc-08de90c307cf
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 14:20:45.9086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ni55qsR/cU0PtPoUdqnDeoF9wR4/AOzrv3TcVgQIHogqTU8uvv8gIovA3rvajLic0fqS2y9eoUJPGTcQkYqdQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10626
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_072049_609146_A322A2EB 
X-CRM114-Status: GOOD (  18.40  )
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

On Thu, Apr 02, 2026 at 09:05:48PM +0800, Felix Gu wrote:
> The xfer structure allocated by renesas_i3c_alloc_xfer() was never freed
> in the renesas_i3c_i3c_xfers() function. Use the __free(kfree) cleanup
> attribute to automatically free the memory when the variable goes out of
> scope.
>
> Fixes: d028219a9f14 ("i3c: master: Add basic driver for the Renesas I3C controller")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---
>  drivers/i3c/master/renesas-i3c.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index d9f5b30a4b2f..11f2d6f7c701 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -817,13 +817,12 @@ static int renesas_i3c_i3c_xfers(struct i3c_dev_desc *dev, struct i3c_xfer *i3c_
>  	struct i3c_master_controller *m = i3c_dev_get_master(dev);
>  	struct renesas_i3c *i3c = to_renesas_i3c(m);
>  	struct renesas_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
> -	struct renesas_i3c_xfer *xfer;
>  	int i;
>
>  	/* Enable I3C bus. */
>  	renesas_i3c_bus_enable(m, true);
>
> -	xfer = renesas_i3c_alloc_xfer(i3c, 1);
> +	struct renesas_i3c_xfer *xfer __free(kfree) = renesas_i3c_alloc_xfer(i3c, 1);


Add include <cleanup.h>

Frank
>  	if (!xfer)
>  		return -ENOMEM;
>
>
> ---
> base-commit: bd0f139e5fc11182777b81cefc3893ea508544ec
> change-id: 20260402-renesas-c6afdaf9bc2e
>
> Best regards,
> --
> Felix Gu <ustc.gu@gmail.com>
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
