Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4DBBC87FCB
	for <linux-i3c@archiver.kernel.org>; Fri,  1 Aug 2025 14:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9zkQdqMuPtY9YMwKbjgV0RnxJZsroAYNTUE18+TpcT4=; b=PuHbDfpPryu9eT
	0qtkTddVI/ejTd60AkffypqGlbVKCLHLJ0n9/ZBksvH0f3oRl3yetTck3e8Fh5MCrhcmzPKpMO8GQ
	ElasFlnyDGx4x+G69VC97z3rs2c2fvlT6ltxhAfDHFrAvIO6InHY6NVCQLrH7ou+0WWoa+8IhR5zk
	ZOmvCfqmK/rtGqcdPWwBRhcmiH2a0B6OwHIZ+ZFm68WuRj50eIbyXOYo3r+W1GPQahr6x5xF7Vyc4
	kuRhyFYtNOYI1aGl/BOtDVvHbT2seUyNQoi5vlrkUYV1ZjfA/G7rW4PbNsjEUwRFBpRYlmtYCvUNi
	RLTawDdsjgNvkIbUCAnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhrBx-00000006Hph-2rpA;
	Fri, 01 Aug 2025 14:57:05 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhrA2-00000006HfX-0STe
	for linux-i3c@lists.infradead.org;
	Fri, 01 Aug 2025 14:55:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NNCZ8bSGlZg2a5TCHGw5FPYkuZ6q67blf1uqn7rFO5hqcnxDpw4t2MK9/USXFxMt/hnsxh8O7hl+8nJLCinyxZcUVdjXjjhHEKN4/x1zW7ulE6e9yxrDTnL6taZzN57xeSTC20HVKg6blyaoVkDrrQ6pzXOOp8tkeMB7bGoDcfNcOdc0WviFpUTVZb7MXvXfKkftsBeiovRUTvjTmoV27HPFuzlvrmXu3Ewiktf0C6+I5uvs8GZRuVZMW7BxDsn5O2Uvb48ulTJb/Yr8tQJXlSIet4XZCDR0fYjJrBQg1Hqzv6wSlFmtyM8K4Xa+AovciTd+/n1Ybt9Gm9Q6KcmpTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1MjxOG8UcTXG2FL8EF9ZSmWluTPELWPR8nRjeE2nlFA=;
 b=lZgiqNRe7rKd+2JJSUQX8m0OILOyXuw5czd4+wJ3BkMzhhGF2y6EXgUm9mTRMvnAPC8kXwDzn4IOGGmGTbFxhz3LQP4yTQ/55VNMLKRDEgI0Ym0Otg1WUJVYnSUpKWwSBuG2QpfqD7oHurH2Kas3uMF+9pRw5BMSrT5VWA8/NRrMch2SDrExkbYMBCXxC7Mb9sqfNli49JQWYsW6yPK+qnA2GC/AKdBDTFI8LJYTgz399p7Q6pid4mbd2336tRLyY6NdHuaDIqYb1lHZfZ+98X7sNfojmAWjqS9z+o5IVnTYsQlAhZC7vUbeurCARJMTbNZJWV2h46IwRJCYXIy4Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1MjxOG8UcTXG2FL8EF9ZSmWluTPELWPR8nRjeE2nlFA=;
 b=c87eynJ256kgEAJHPwo/hVYzoo4USm3myOWExgfKzDsvcrfz4Zk2LDPkzrXGa6oRiHiiU2vAhLAf2EzwoOdiomLR1xm6Yg5OW4x1LTDi321kSlABj2dOjf8kq7lE7GTeZGxO0sS04TMntzBRRdGwayBEoVrXW3Gieupr0UT4nTOr8P66OI9Wmw1pVucklsXc+UPvQzrmSAXFDDL5YRj/TeiaCM1GRj0KaKzYbpIajEItKWc5pAofjYnoZVXO7nSikWknt4ecOslS1F/MXqtFHMCARy3i6x2AN90b6p17D5M1mX1nI4rGnbv1QFGcYalq5ARDyoa+KKXh0VdGzLek6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB9093.eurprd04.prod.outlook.com (2603:10a6:20b:444::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.14; Fri, 1 Aug
 2025 14:54:57 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8989.011; Fri, 1 Aug 2025
 14:54:57 +0000
Date: Fri, 1 Aug 2025 10:54:52 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 1/4] i3c: master: Add helpers for DMA mapping and bounce
 buffer handling
Message-ID: <aIzVPNnrOkPQ3fcd@lizhi-Precision-Tower-5810>
References: <20250731141420.422525-1-jarkko.nikula@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <20250731141420.422525-1-jarkko.nikula@linux.intel.com>
X-ClientProxiedBy: PH7PR17CA0053.namprd17.prod.outlook.com
 (2603:10b6:510:325::8) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB9093:EE_
X-MS-Office365-Filtering-Correlation-Id: 55307eb6-2572-495d-d305-08ddd10b61f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|19092799006|52116014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ql70XOhjpfN6YCCUDAv8/wL9cVa17Fx2eEt7iSgTFwlhcGZjJUiU/hydg9Vv?=
 =?us-ascii?Q?7uGQRjdbk1Kg/7rHuGyjV+F34bnqWqNclyMFeQwC4r9vTHlCd2S6YHscVOav?=
 =?us-ascii?Q?xZaocMiozZXrvRg6/akJ2uJS+4P5CJGMATR6LQHRnb+UbdX8BTHe5gGGKbDa?=
 =?us-ascii?Q?7Tx+d1mL06BFVUzTnD+TLQ1rSu5Ll1kpwrKeF+AEqdGQ370H0p7f+xTI86wT?=
 =?us-ascii?Q?/yxmkXJ4kzcKnrpcy/tI8B4YjFukT9hGrISSU5pwvKql4MDQy15FNRk9QgFG?=
 =?us-ascii?Q?9Wpe5yH3kKXbM62GOxpnJCMYL5k5XaMCUBjeSCJv3VrbGM48WbGsJc7Shh1u?=
 =?us-ascii?Q?AR3nkSUST0FRKCx6UM2EwUmyQY/1ZhwrOc1Wi00tV1U9r1SoCaqr7AOvigin?=
 =?us-ascii?Q?Kfu7gyT0XM0DYg0X77kiolplxzGYK3jYXCBMFp9zRHYDJDekiP23TjdC7mVJ?=
 =?us-ascii?Q?d/7XihwyKkZzHeL0exwZ8tvS+1Fkj+dUg+vRiYKIyiwfRiXxQtoTAHgC3ESU?=
 =?us-ascii?Q?6NQFvEqwYV+3Us6rpk/5ROR7Lf6O4Tt705QzHRYRwTTGZnaCzY8uG+CtiTm3?=
 =?us-ascii?Q?B2agOzXJKqDrIVTSr/VadYVZKfug2YL+SZi1t6WZo8mMDv0j1IpObjldRpoe?=
 =?us-ascii?Q?LaA72pShyKjSr1Caqj/yQG2Nr84S+K9xmtWH+hLwalRUC3rxSUR81+Hs1u5f?=
 =?us-ascii?Q?Nleqgmrpci9DzdDgPwwyLAAPDA/em2qJF/aUW0BLREM17E6Pylnh8CmQQmkH?=
 =?us-ascii?Q?gdl23ZT8zY9alT59bb3/uZd840rHqUHELOj7QoNy/hspBOetxgaZ5rldH3rZ?=
 =?us-ascii?Q?cljJbKljLo+8S9LzMeuh0yTbm4AZe1m6K7gpG/1K0H5vBwMDRQntlN9i9/Ck?=
 =?us-ascii?Q?BMrg+0usSEA6utAhBdj8pFQ4LyEkKPlyCcCH6YYGic+3UPE+FL2YaSDI93Ia?=
 =?us-ascii?Q?vQ87XUKIZodO6NTQHmM6f1C82Jx//USeatZWTisS/GBY3+aY0FOct97fikfc?=
 =?us-ascii?Q?H5q5xJKxYPkXzg1087XMXZULlmet/VzHVhjQDakGp/VxmTaOh96D0/zMQsAo?=
 =?us-ascii?Q?BY5K3WcpQay+wmIbWWXsqhNRQaQMCfUMAedjk5FIQHjGq1gNHhDEEtq4CPkW?=
 =?us-ascii?Q?chG1cmulweNOUiE/O7gYftNNSuAXzQHEh3nkBa5wh/rLJAv8Ype8lZl6YC50?=
 =?us-ascii?Q?rcVzUdMnapDNLvPR5Iz4P1ClGUiZAX0tkCn9t74FQBvx+2OdgxjX378/0Rp5?=
 =?us-ascii?Q?qIKyx3hRoIa2x8vKOSOavIkVNBXOBDrc10zlBVhGuglK8KNGi8S3q5PU2CqV?=
 =?us-ascii?Q?KGQIf73OgRS3LBVbBzqLGKRLBdvZvIOBwq7SpetYzA3r7DEtZkDpI6jQotTU?=
 =?us-ascii?Q?l5skzylJWNx/fIiIrLVjrSC/Vau8llSse7A6ASNn5eofMQWHY09hRrC6Z5BD?=
 =?us-ascii?Q?fhPHR4N2v2Tw89IJEn1sTYb14KTiZE3UcJ8yKMSv4LfWeBeXvdPQzlgtJGXb?=
 =?us-ascii?Q?3/XolowarNnjfrc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(52116014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yhOVc9utsdEOqeMIKDhWZ2KbjIKXUMTxgYkDloT39QO+K6UWpFSO1vlLzbcN?=
 =?us-ascii?Q?86fptZWby9NiSG3pqmxyDeIKoBvUdHKhZergKhS0B/ak+bNrPbWtHLt83llX?=
 =?us-ascii?Q?J4dQbZEBAadoDqjUVHi2QIQEVvbtfoGs617uiLgF9MG5L7msM1Mo6zGraO0O?=
 =?us-ascii?Q?GKm9pD2F/igPoC5jahIK8Md8mijZn47OH3CzEcHUfs3N1A2hfQeqDDBA5RAD?=
 =?us-ascii?Q?/ON6USUYUlg13DGHC0D/dIvSJQjgbqvvROCzTMVvhB5KiOCFeOd0nVjgu5qh?=
 =?us-ascii?Q?Ycvx3oYrOGgvJqCEajzlZGlAd7CIVR59cGwCFyzBEmiUIYGEfhQltnvr9voC?=
 =?us-ascii?Q?Ze6CwXi9pDvVAS3JGjL+uhW24kVQNqtOxIrQnD9aVEKKpOO0qSf3owxMr3fX?=
 =?us-ascii?Q?2FkzH+ryDYKQzLk+zr/9Zp0J0h0HAh2fElUI1NzmvZEAfuFRlNy2pEF42sUY?=
 =?us-ascii?Q?aJZaKk1DQk+nZoAsyP/957RValfZubiADdVGDemBYvgQcjxw4fNY1cwJhJot?=
 =?us-ascii?Q?wNrNtLPFCk9Hy2Z90Aouzli6PgzmfSdVlteZGVZHlp9r8PSc8qt+NcUCikgp?=
 =?us-ascii?Q?DopTo9wOgg0GTfoQ7yx0eDX7Hh8IQVMwImnbu3gh0ruFttYtPq9VJRQl3xLq?=
 =?us-ascii?Q?I3xOGaiPnaf4Ns7KDC7NBaE9Eeyar1ZCZW1Ut5YvaMrnsAfie9JiuKa1JyRI?=
 =?us-ascii?Q?ClHYvpygmhEP2GhhXz23aGyx/+sgB103GBYWoWvapFAJ2JNbnP4OsPrGHXM9?=
 =?us-ascii?Q?4ldWrPZE5jlYNJi8H98+9dHQLCdxag/uzY7LKxzoMhdMqJtJicH+oeMuROfX?=
 =?us-ascii?Q?iUF45FECvdG7MOGBVug2Zz3HO3N5pbLxZA5X4ioeMqyQZifzlyg9s7o9R9cV?=
 =?us-ascii?Q?km8I8VbTvRLCK46RywEhxyVgOG9JT1zWwS/n1ooRUB6LpEmCm8pIZIEuGaoP?=
 =?us-ascii?Q?Q5X+0L8vlOkfouOLKB7x7GfxMYqIzgs81N1svkpirMyqzVqTH5sCAyuFeIsp?=
 =?us-ascii?Q?EX9NPJWWoY8qHyhcnSr8iphq4eziTRBZJLitn/EdZQ5jTiIjVuZX/jV/4dP1?=
 =?us-ascii?Q?4gZkDvPw7SBe7HppE85FVhhZyVsmiQCY1DK6ayKeDqrQL/1tgmWrb7/X5ZnQ?=
 =?us-ascii?Q?Lc+IYzcSievVmdk0JdJCVxUPvKQDnYKO3uct8hiBdgv+I7VSPKEPUGGNPm8V?=
 =?us-ascii?Q?hbxgLkhYaKlkdqBRROY8LQRYql8vQX7BGbPXRXQPhylP+vqkKLXysPxrE+gx?=
 =?us-ascii?Q?ESQo6dtmP8cQXH81WE3518BALu6f4AE3KwHBjPiDiHZ8TVCxzL7qf0I3/4hu?=
 =?us-ascii?Q?XaWMaxMJcPgsedPXjr9SWVHVnDJC8jZ8OvPNJis5CeAnpBcoEhcZ/E5jN5Zs?=
 =?us-ascii?Q?XukT4lPtszpnnCLS1t671L6LoqBn7UGg0CgN7V4heAwfIf4CxZ6hy2dTfLPH?=
 =?us-ascii?Q?k1hvKiTOWzJUiFGeGNoDp8Fxn52kNNcCQ/w4HlFo6UgzygZA4/vr6/Fh6jK1?=
 =?us-ascii?Q?CTV2Njknh3Q1tkKKf3WbFYHcpzg2wpiqWTwQqdeGZGPNu/xoGuzt1aPIiLQg?=
 =?us-ascii?Q?GmgL71QD1+iJ+vg8w0QpMZhWcUjdAYqAAffjp9Lj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55307eb6-2572-495d-d305-08ddd10b61f5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 14:54:57.6332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DEytHhz29d9jTYv9HCQgSNIbS/gGaL4zZDNT5OzCFvLJQzHJ53KUVo/G6Q+dm/U/PZlxTiebR5SsrEF6akAZNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_075506_173957_ABE490D5 
X-CRM114-Status: GOOD (  26.04  )
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

On Thu, Jul 31, 2025 at 05:14:17PM +0300, Jarkko Nikula wrote:
> Add helpers for I3C host controller drivers for DMA mapping/unmapping
> and bounce buffer handling. A bounce buffer is allocated if the buffer
> is not DMA'able or when the driver requires it for a transfer.

You'd better move some patch 2's description to this patch, to descriptor
why need bounce buffer.

>
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> ---
>  drivers/i3c/master.c       | 74 ++++++++++++++++++++++++++++++++++++++
>  include/linux/i3c/master.h | 20 +++++++++++
>  2 files changed, 94 insertions(+)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 2ef898a8fd80..a1daf18ea707 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -8,6 +8,7 @@
>  #include <linux/atomic.h>
>  #include <linux/bug.h>
>  #include <linux/device.h>
> +#include <linux/dma-mapping.h>
>  #include <linux/err.h>
>  #include <linux/export.h>
>  #include <linux/kernel.h>
> @@ -1727,6 +1728,79 @@ int i3c_master_do_daa(struct i3c_master_controller *master)
>  }
>  EXPORT_SYMBOL_GPL(i3c_master_do_daa);
>
> +/**
> + * i3c_master_dma_map_single() - Map buffer for single DMA transfer
> + * @dev: device object of a device doing DMA
> + * @buf: destination/source buffer for DMA
> + * @len: length of transfer
> + * @need_bounce: true if buffer is not DMA safe and need a bounce buffer

Is it possible auto check if 'buf' dma-able?

> + * @dir: DMA direction
> + *
> + * Map buffer for a DMA transfer and allocate a bounce buffer if required.
> + *
> + * Return: I3C DMA transfer descriptor or NULL in case of error.
> + */
> +struct i3c_dma *i3c_master_dma_map_single(struct device *dev, void *buf,
> +	size_t len, bool need_bounce, enum dma_data_direction dir)
> +{
> +	struct i3c_dma *dma_xfer;
> +	void *dma_buf = buf;
> +
> +	dma_xfer = kzalloc(sizeof(*dma_xfer), GFP_KERNEL);

If use struct i3c_dma __free(kfree) *dma_xfer = NULL; it simple error handle

> +	if (!dma_xfer)
> +		return NULL;
> +
> +	dma_xfer->buf = buf;
> +	dma_xfer->dir = dir;
> +	dma_xfer->len = len;
> +	if (is_vmalloc_addr(buf))
> +		need_bounce = true;
> +
> +	if (need_bounce) {
> +		if (dir == DMA_FROM_DEVICE)
> +			dma_buf = kzalloc(ALIGN(len, cache_line_size()),
> +						GFP_KERNEL);
> +		else
> +			dma_buf = kmemdup(buf, len, GFP_KERNEL);
> +		if (!dma_buf)
> +			goto err_alloc;
> +
> +		dma_xfer->bounce_buf = dma_buf;
> +	}
> +
> +	dma_xfer->addr = dma_map_single(dev, dma_buf, len, dir);

len should be ALIGN(len, cache_line_size(), otherwise swiotlb will bounce
again if need_bounce is true

> +	if (dma_mapping_error(dev, dma_xfer->addr))
> +		goto err_map;
> +
> +	return dma_xfer;

return no_free_ptr(dma_xfer) if use __free.

> +err_map:
> +	kfree(dma_xfer->bounce_buf);
> +err_alloc:
> +	kfree(dma_xfer);
> +	return NULL;
> +}
> +EXPORT_SYMBOL_GPL(i3c_master_dma_map_single);
> +
> +/**
> + * i3c_master_dma_unmap_single() - Unmap buffer after DMA
> + * @dev: device object of a device doing DMA
> + * @dma_xfer: DMA transfer and mapping descriptor
> + *
> + * Unmap buffer and cleanup DMA transfer descriptor.
> + */
> +void i3c_master_dma_unmap_single(struct device *dev, struct i3c_dma *dma_xfer)
> +{
> +	dma_unmap_single(dev, dma_xfer->addr, dma_xfer->len, dma_xfer->dir);
> +	if (dma_xfer->bounce_buf) {
> +		if (dma_xfer->dir == DMA_FROM_DEVICE)
> +			memcpy(dma_xfer->buf, dma_xfer->bounce_buf,
> +			       dma_xfer->len);
> +		kfree(dma_xfer->bounce_buf);
> +	}
> +	kfree(dma_xfer);
> +}
> +EXPORT_SYMBOL_GPL(i3c_master_dma_unmap_single);
> +
>  /**
>   * i3c_master_set_info() - set master device information
>   * @master: master used to send frames on the bus
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index 043f5c7ff398..e39350b1038e 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -558,6 +558,22 @@ struct i3c_master_controller {
>  #define i3c_bus_for_each_i3cdev(bus, dev)				\
>  	list_for_each_entry(dev, &(bus)->devs.i3c, common.node)
>
> +/**
> + * struct i3c_dma - DMA transfer and mapping descriptor
> + * @buf: destination/source buffer for DMA
> + * @len: length of transfer
> + * @addr: mapped DMA address for a Host Controller Driver
> + * @dir: DMA direction
> + * @bounce_buf: an allocated bounce buffer if transfer needs it or NULL
> + */
> +struct i3c_dma {
> +	void *buf;
> +	size_t len;

need dma_map_len to avoid swiotlb bounce again.

> +	dma_addr_t addr;
> +	enum dma_data_direction dir;
> +	void *bounce_buf;
> +};
> +
>  int i3c_master_do_i2c_xfers(struct i3c_master_controller *master,
>  			    const struct i2c_msg *xfers,
>  			    int nxfers);
> @@ -575,6 +591,10 @@ int i3c_master_get_free_addr(struct i3c_master_controller *master,
>  int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
>  				  u8 addr);
>  int i3c_master_do_daa(struct i3c_master_controller *master);
> +struct i3c_dma *i3c_master_dma_map_single(struct device *dev, void *ptr,
> +					  size_t len, bool dma_safe,
> +					  enum dma_data_direction dir);
> +void i3c_master_dma_unmap_single(struct device *dev, struct i3c_dma *dma_xfer);

needn't dev, save it into struct i3c_dma, so we can use cleanup easily


#define DEFINE_FREE(i3c_master_dma_unmap_single, struct i3c_dma *, if (_T) i3c_master_dma_map_single(_T))

Frank
>
>  int i3c_master_set_info(struct i3c_master_controller *master,
>  			const struct i3c_device_info *info);
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
