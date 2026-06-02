Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94AB4CD6E55
	for <linux-i3c@archiver.kernel.org>; Tue,  2 Jun 2026 02:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WPWKl7axk5S6XDUXi11eny3F6u82R+SEKMZir5Am7PM=; b=cF4PcmvIrESuK1
	GT+wvVDwCQG6gD5DwqnEAn+zpI/xrwf1oSQOx+TbMvzMt9b5JrzUAfB3hV39YVbxWkmBsjNPvvUYh
	dTIOY3pWX/RuviUFFKhl9uiu0ZT0gmwmfCcl5frw6+C7+B6rWEnqSbdbb9emjCO35LAqb9/vO4Wb7
	7PxePaTXptKLlPOPH8D8xQkaDtzL5hROVtKc/qyG+mrvXSp8xfdNQ/oI5kmRmJw4sjitZYJ+iuW0Y
	/NWrPx6HTu41Rnwk04XgFdSRHKOafgDFgmV4MzS5++Oa8Z0KvieQQ4jynerIRrw77lbnnrgQNwajN
	SXV9jXkFRi8ajFgGc9Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUFCJ-0000000CCJj-0xp3;
	Tue, 02 Jun 2026 02:49:43 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUFCG-0000000CCJO-1O2V
	for linux-i3c@lists.infradead.org;
	Tue, 02 Jun 2026 02:49:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=anJy+j+sN+om0OJXMDYpJbujbva0EpiU+YagKO5uQ7ZlXh5VdF9mKwyH6poCPOHuMZ1kKKbfh2s52KqNM6Y9zPB0PF5WXgJOLPWXraIlEBfOFVn4MJste1bErgdYSXPVxBGMjdFXB+K52wj7yWxSqYBBQ3E9NrS7pZqSSGXtF7fXRSkp+HlR9FuJJQzsCorn8q6prsbqb0V9q3cPALMrGfXcDfB/y964IOnBM8o5RODe4Tit68WlUwQe+VKhIhu4SMdr+kuAvqayC/2wFMMF7dj96Q88xn6hjPlblcH1aFC0Q9prZLv4VjxC/WSRkj+++am9kelNBkee/uM6nIrgsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F1hG0h9UAEuSIhVHKQ4dxH+QRxlNGwGe5A9YTWjndD4=;
 b=LC4cckty1oQTzippe9PKQY0jLkBuHl6RloJIdW2tiQ40OtEeFUHhazkPYhJXlx2o+K/l7mn7qoGvstonwcWSc7brP5lgBAoIkDl9M9RZdg6Kc15r6vHlwCUSOKLl6AcJ/XlJuNBgAI/yuJJCIyD/t7ZObk0r+WwLXHRy2BAgc+x7MaI7vDDLdyFoD/fMvJCRzMD1d7k6m5H0GfK0DyChwCaKe+pr8czC3edQgTCuK3KeSZEh+ec8Wv8tC3MmtMW0qb1mW+sa1VM5KEnl8hD9OKZ96cTk7Tr+0Ou1Hl8ZtGJAbdJQlThT/qjUkQhYvwIjSKlObPcvxUh5TqaOCQmvJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F1hG0h9UAEuSIhVHKQ4dxH+QRxlNGwGe5A9YTWjndD4=;
 b=PJkiagFV1mWL5k3jGqNYb+B25GqleTY6fQE3f3fBq8e4AxcIiWp2e/RsSJ5kuS40XwM23CREPFS+QOAyGTbHK6xoxrTn6x4dus9Nj5TN2o0/ZcflPQDLVZPZxkGRbFZP6KvS8wZRhLk/vVnqQK973d+wnx0TrqhXPQC1gK/IeFI5Xz0nYjfG9s/he4RC0uNF8Q4F6KP0OMNSZONgpuYWA/y7RsNVz1dr7fs7m5X8gstDPhXVlNQ0tsMIPnyiw0hLPgqCehjZ23NLFvSqB5YKCX4oBUC4QaYxBZSRRCjJ+Vsks5fcSl+zpAxktldH2PkPkMyhGB6mu3pcB+B5LZEcEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU4PR04MB12149.eurprd04.prod.outlook.com (2603:10a6:10:642::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 02:49:36 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 02:49:36 +0000
Date: Mon, 1 Jun 2026 22:49:30 -0400
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4 08/17] i3c: mipi-i3c-hci: Avoid restarting DMA ring
 after aborting wrong transfer
Message-ID: <ah5EuqFJPRyL4llO@lizhi-Precision-Tower-5810>
References: <20260515162621.57719-1-adrian.hunter@intel.com>
 <20260515162621.57719-9-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260515162621.57719-9-adrian.hunter@intel.com>
X-ClientProxiedBy: PH5P222CA0004.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:34b::7) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU4PR04MB12149:EE_
X-MS-Office365-Filtering-Correlation-Id: 12b9e8d3-61a7-4ad3-a377-08dec051952f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|52116014|1800799024|19092799006|11063799006|4143699003|18002099003|56012099006|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: WHWVi6QkxsGKJkEy4/nlBb2suIUTtxAXY6f/00R4VmqtfhtOX7oIWeZj+V7bhyFTjItBkMqRM98VErxZwUYiKVAXayB/nNdH2uvsgxi23K2uqW/vtM3plWXnozpBDgNn5NUifriYpC8DkqH8r9UtMIECVzoev46FWDqo1EDHToDD19apL4lpXgDMmECwqUpFCVLoyL6cWKbXquJ4HTqdH2SUnBTtsxHHVm5L/zSJ8R/EE6rsc7ffYmJm2ILhTOw+r1SaIX3RjinUQ25/8nHAnowwpSbDvwcaZfgOAL6X5dmwOdDf2pGnUgH9ptlWO5eyuWo/5AOPJ7kqp3novaAvmTE7kxVO0rOs5QxpfHSXvvSa3gunb/Ssc9fjAZT5S0iRCRQ9fyxbWOLyDzguuT4519moY4ysJh1JMN9d1PFX7p6RQrS5ExxncbuX/Dwsnoou5XxhXa9c48mqjlzR6X6eQBf/zn9fML8jsBs2JHV8SuefksYAHZuw8bMxgUkaHTG+2Qz5V2/9gahlX/7IPmrDYD4F//ZCCINoa3ToIePiFEpCmFK3cXkHChyEzTMbdHeSQv5FZ09zYPjO53gjicvIr7qqJbBRsqnmpF7n90MUTL1JVlzgRnbOEmPGhfFQxYJYYfzWow407vOkMtOEwS0E44GZZwviLjGChKRrHwc0KuBqa7LOoJpUci+vItlfRTZgim2cW0/6STQY0QFBSBMdHuAvYk01E369vh8Rd6GD6F2MVB0oYX8kUy/sm8D3uVgt
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(19092799006)(11063799006)(4143699003)(18002099003)(56012099006)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9ZZE17V+S+dafjSsidpKoLnCaMud9m9vHrtcBKI0SVTEOxupZhoy0fdw8bqD?=
 =?us-ascii?Q?ltCu/w4uune4hJBSVsIp+/nE+OnO7n+lUBzDuLTXFxKJ7wG6MRGlgJ265Jhd?=
 =?us-ascii?Q?OUmenCcYvauymsqUfWxB3kgR9E6QTZkH8JHIppg2lOHKTzWclv3R2tRO9zLb?=
 =?us-ascii?Q?sGP3dQjjHLCnFVHHkrBiFyrPeoYiDSjJdQwy/gMhnNTSmiFs4EdwSfk+D3lx?=
 =?us-ascii?Q?c/nveOPK79KIXCGCP7VKSRZACfSn5yzxwOzHvhIeeISKuMzb3LtPj5nQ+/PJ?=
 =?us-ascii?Q?5emA0ZfRtso/Cqr4EtBlRSD1JnsrsmuVY7YnrRTqMZu71xBkuDNHxiEJnNjC?=
 =?us-ascii?Q?s418ZkywDoQoS0VmdcPHNKaoEspQgVSgOJwBKXyjkn2wzER1CmZ8yF1UOe83?=
 =?us-ascii?Q?3evULm00MAO+HWtnaWAh/b0KS5leAYg6FatqJ/Ycm69ZB44ddRLwGhwjMtgn?=
 =?us-ascii?Q?HbtjhEmuhx3HQJIOvARSjO67149fFe/hmDDe9tHC5Xks4MvQnyn+AR67oc6I?=
 =?us-ascii?Q?GSO0hkDAirmxseNAgXZn0N+o3Vd1XOJeDbV+OQT4tR83jiW7EVtIB1o8Q6Qo?=
 =?us-ascii?Q?JPfh0vsWzLFG8zgYNgsBfmMcwLWJLtF0a4W8APw0JkB1/u43LnG1+D6K0O/q?=
 =?us-ascii?Q?Tq80iUg/jpUwlX/W6DIGIeFfHNsdA28th6/oZPkBVVLd8l9cNxvseY1lZPr/?=
 =?us-ascii?Q?bVMTnUcq1NvFPERwzwRmTmTlyPlvS38+FIfvVXUFDmT7cX57km7FnI7HGABS?=
 =?us-ascii?Q?LmFvysQzKHA6j6Lf2CdAQHXOpstVPE35VkMYocuGjUXT9Q4k0iBfwXtv/NtB?=
 =?us-ascii?Q?fs//i1dAN/I5R9ULXK2jgiguTbJ8JGpF54KDlu/Pi9HylHsoZkT8vKifvxZZ?=
 =?us-ascii?Q?1VtUHm/SXXSShpXFe4KqNQ5lIyOAYRprNzlgQZDbLXGjRrs5iTgLIekL/ppl?=
 =?us-ascii?Q?Uus2acIzhZNrSQYTRAYCjGRZCOgLxVgzSAR9JHiZnaTWP45jgVN00z2496N4?=
 =?us-ascii?Q?OU+AzpKb5RKLc9Jscml1+EzzgATuarkZ7UkXK2Ai5GG3BA4LFsoacs17MNOL?=
 =?us-ascii?Q?J1dGegvjuRtugL5jWPuocUE2uq4asmY0Xm4d/gLEgCmABKxJIh09xJACyfAQ?=
 =?us-ascii?Q?P9yy6O5ZFDXHTGbQeU3xJIPWs7TXPoq+ulqhR0JmZPifoUHkXylhgbnbNY5V?=
 =?us-ascii?Q?oXDJJLQtaN43TbVgvlsa2AOh2QACy2ubllzaVXiF9VTzDpSBNyFXur74ECM2?=
 =?us-ascii?Q?qg9b+V+8vcCKgEu5kFHPK/5iIGgETXOgZHtTSAk2aQKUUshzP7MyOMuYT912?=
 =?us-ascii?Q?OfbgJVwH+f32S3EfGXvYf8V10PlfWc5axVxCYfgtBIaP538EEWhf3g/vrolH?=
 =?us-ascii?Q?grG/97E20G4HEUlYLthL4AtmTaFolwgiWGZmKP+UNLdTWQ+l0FWczJ2f0dEa?=
 =?us-ascii?Q?aXaJ1Xt3P6M1guv+LQCIp2ytOYYtJfCUuXeZ5FUmgZTT8ymGUE8YOEN4lNsl?=
 =?us-ascii?Q?tfbkrLRhMWHDwpuyAk48xn6E8zds/CuAhrr3o5ho4lWhQ5BWgASt5L35lwr3?=
 =?us-ascii?Q?QdqSlpTDftI3+vPEIC1kwOhmt1E3dblOQ0xVCHLAnP35szmFon5Y6+y7zmeM?=
 =?us-ascii?Q?ENIYrTk5aCtt8UzqGWoTzjLt07Oo9QpX9rWOmHBPCIsXJUzlPbbSWwiqDNqB?=
 =?us-ascii?Q?Yci/4AhjuLavuvKKropNQEq8OYnRsjUNZMONwpKHlYeuB9uY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12b9e8d3-61a7-4ad3-a377-08dec051952f
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 02:49:36.2201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OhIdrGixoteOLD6yUYROhkNstXM7oxw6mGI1+2JuRKx7yvQxw17WVu0kDsisH1ws07K5AS4lI6ZBIR36OqgKog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB12149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_194940_744830_F6410ABD 
X-CRM114-Status: GOOD (  28.50  )
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

On Fri, May 15, 2026 at 07:26:12PM +0300, Adrian Hunter wrote:
> Software ABORT of the DMA ring is used to recover from transfer list
> timeouts, but it is inherently racy.  The intended transfer list may
> complete just before the ABORT takes effect, causing the subsequent
> transfer list to be aborted instead.
>
> In this case, an incomplete transfer list may remain in the ring and has
> not yet been processed by hci_dma_dequeue_xfer().  Restarting the DMA
> ring at that point can lead to unpredictable results.
>
> Detect when the next queued transfer is not the first entry of a transfer
> list and does not belong to the list currently being dequeued.  In that
> case, skip restarting the DMA ring and defer recovery until a subsequent
> call to hci_dma_dequeue_xfer(), which will safely restart the ring once
> the incomplete list is handled.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>
> Changes in V3 and V4:
>
> 	None
>
> Changes in V2:
>
> 	Renamed completing_xfer to final_xfer
>
>
>  drivers/i3c/master/mipi-i3c-hci/dma.c | 15 +++++++++++++++
>  drivers/i3c/master/mipi-i3c-hci/hci.h |  1 +
>  2 files changed, 16 insertions(+)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> index 83b553e1ab0b..8e27fb6f18f5 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> @@ -503,6 +503,7 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
>  		u32 *ring_data = rh->xfer + rh->xfer_struct_sz * enqueue_ptr;
>
>  		xfer->final_xfer = xfer_list + n - 1;
> +		xfer->xfer_list_pos = i;
>
>  		/* store cmd descriptor */
>  		*ring_data++ = xfer->cmd_desc[0];
> @@ -669,6 +670,20 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
>  		}
>  	}
>
> +	/*
> +	 * A software ABORT may race with transfer completion and abort the next
> +	 * transfer list instead. Detect that case, and do not restart the ring.
> +	 * It will be handled by a subsequent dequeue.
> +	 */
> +	if (!did_unqueue) {
> +		struct hci_xfer *xfer = rh->src_xfers[rh->done_ptr];
> +
> +		if (xfer && xfer->xfer_list_pos && xfer->final_xfer != xfer_list->final_xfer) {
> +			spin_unlock_irq(&hci->lock);
> +			return false;
> +		}
> +	}
> +
>  	/* restart the ring */
>  	reinit_completion(&rh->op_done);
>  	mipi_i3c_hci_resume(hci);
> diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
> index f07fc627d4d2..83d4f13a68a3 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/hci.h
> +++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
> @@ -107,6 +107,7 @@ struct hci_xfer {
>  			struct hci_xfer *final_xfer;
>  			int ring_number;
>  			int ring_entry;
> +			int xfer_list_pos;
>  		};
>  	};
>  };
> --
> 2.51.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
