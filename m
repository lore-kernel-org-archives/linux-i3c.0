Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64146EFCE37
	for <linux-i3c@archiver.kernel.org>; Wed,  4 Mar 2026 19:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EOQzVRCrJ8QMtYYy7vKUEMuBjnedn4bDrKW8rElo8R8=; b=iP3ZKvnVS/WLOR
	N6DuAyete+/PmmtGeuagImrjxb9AwTmXzsLVwJ0wig5jLRXUCj3adG+hPmb2dwYviBZ7oWdWNuyou
	zBI/ZGMALjsXGoPFVZrLWCpDRTeZrGm6i6Y/oiENT2QdO9gp8u9YrDu98MvIeFKOtg6Qoml7AzFYW
	gwbByjDCScpDzrwrO4V5K0CANQYUdP7RjmFLcYSNh7GpuNhP4+hIo5tIt+nG3zD+EnOx+sLrdjyml
	jK1idV1nFyADUFCOPJV/XOFuCjXu9yHFOACz7Vq6bwmqS6GsmXGFAc+AL8ED0JSyXeliQjkPtFGpn
	5YKrnosHAEiKOw1JNA8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxsLN-00000000QHw-0M2A;
	Wed, 04 Mar 2026 19:57:17 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxsLK-00000000QHa-31ok
	for linux-i3c@lists.infradead.org;
	Wed, 04 Mar 2026 19:57:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZkKn0fk2dDXzGK8+IuX7wTbEskxCZ8dV1mF6lCzGJ5RpDEMe2lmXbK2j6lBWjmxgNBDPjXbleYAcvizs7PxqFSiC7adTaa6PEnOLPxTL02RDNNlOIJQYox04qY5PYypx2oTPTrta6/eNR60Xb1WkycdaBtyiC4EVwQ6OfJu9D4apGDduWJYjGgNNWXpDQYq7OT67Yo6OHYeWult0hqiwk1JziqKphwyp1FzmNqdlSU9r+FFLk4/oRx0omxKAZv1bzLd8BXy/Gh8S19H83s9YluzMLHDo+YB+GC/7mQusXxD3hi3XP9z8x4kyhHP9Fkf6SaZioRxdrLEIJuIDa9NEvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w/RaEqW3G53a3nEQDMSJFo/U1FtfThQy73x3xEvGZS8=;
 b=QWI3LarOK7jysoazCaX7Kd23rRBmmJFGw2vpIcxBSzUweVmMN86QBhHE8JjxmlitwFPh4LJQikB5cr/4GTd1mmZYSsDrmo6rJKHlDCIPKErah5z5pE/wfdtaJqNk+26nhYhhs3KCs2D46m5/3pYINURFhAXuitX0atEHZDf0aRChNSXneNPdMrK994seWS8ePBQMKOAU/NYCCD3vtt+GYHd7iDGGAJwiFxQ9PSHQXApIZf2bd24OuoBVyBrohatQUmFtyagtGbtuCACUEx7ZSpH0OQn4EvE24p+T+Jfp+WXZ4GXfHum4G9ABYi+wzjg3Zu34B7y6zEHVG5iMEXfkjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w/RaEqW3G53a3nEQDMSJFo/U1FtfThQy73x3xEvGZS8=;
 b=Vdb2wox0tYDbZnmU5kmHp/30f2TgWbocGAmWvEmiNwYIt5sRrX9Q0/kslWszx30RnQg9DrtKxNJD9z5QGkgGJySHniNDHHPmY8y5Hg1jKc5jZTqGfoug9yutbrofnvinzO07x65rJbEywjiJx7xVxG399YcR75kbz1pbBoRy4q67KLBQN59k9S6QFKRB9MSiNFnevcOs8iHodYgc1eUDqDiqCTF+VNc3PA9zTkFY2BxCp993o17p88Wvkw09p0y1LOfcdYm9+vNvxmHRQCUHHA32g1yDn0qGxqe0g4czMje+/3W24UU9BEQj+R3aeUXf5UFxLQPE1vJWKQD6svAJjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB8798.eurprd04.prod.outlook.com (2603:10a6:102:20d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 19:57:10 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Wed, 4 Mar 2026
 19:57:10 +0000
Date: Wed, 4 Mar 2026 14:57:03 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V2 05/14] i3c: mipi-i3c-hci: Fix race in DMA ring enqueue
 for parallel xfers
Message-ID: <aaiOj2yvYnWzAGdz@lizhi-Precision-Tower-5810>
References: <20260304181706.143841-1-adrian.hunter@intel.com>
 <20260304181706.143841-6-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260304181706.143841-6-adrian.hunter@intel.com>
X-ClientProxiedBy: SJ0PR03CA0083.namprd03.prod.outlook.com
 (2603:10b6:a03:331::28) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB8798:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a8f7dd1-201b-4f8d-6447-08de7a283871
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|19092799006|1800799024|376014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: Gj/rD6LmBCYD4n+NbJVhcGaIQqkFGMJYxc3EATYezcv8+H6u1SxmGSzLiiO5WhH3HpwtM5W45JlxIiF6pmKPpnTZkaOvB/hhjLLE+1IfpMFm33lf5Bgjral+lQLL1OXx/xMlwYMTLOE+h0bAJJS3OZwd8r3ZT5+mDw8TDbO+3B//NDf3BttlkAApw8vR5PRoNnlWTuMWfVD4II5weT50AAa+LX52ajsmfkz9mCdzW5ns1M6AodOd2oTSTGGKuGbPiks51C/M8/MtcgeD+h2Ewcr7hOQyoSuPocgAUNxRO3uo7zBZmX+sXBOxD72aauyYXj4KfW6WLAz6AoQ/78v6oDVcf7RuNvx2dwYhnyCsgS6ylg3JVxzf6ZcCk5rCXh4sRPAr4n7ND8fNvhDV+3FIRIkOysUiCRqDiFz07GwA1FbAvYQPnrBEYlDkHcMQPPZvcZzDsiHlltNU2y76raUfw1WBwb5oWqLpMFGAxs24J5giroPsd/SH37qH0CUzuVvjIhbyU9Jfva4gtPDcoE3rv3qjPlPPh41vko2QnftPdJwLRsOKr1D4NqPQ7uj6nKJkRngcHqCdLG1nvj+BQ4VfAKYlBnMu5S+0mvBUALCQ/QwOBwcMWvWnyWaABF02Sl6NHo2S8ZDqJ4cq5MwIAgwhKO9oLcn524uWO3vvrtCyPQjr1l1Lql7Y7GKl4uGb2ZVhqIvG+uD60zlzhQo9Wohw4HPomtqsgRUvIwmrkd19r0JijorbM/sKaXyTvQxa7iZh0Xy0cBZLgVAA05cOuuP35hyh6y7zqkbqFaoIkNFvDDQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(19092799006)(1800799024)(376014)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+WnlrcXS9WduPV4i7Yvn8rSTF7ENRLPFiXPrn/jyuHpOZUORoTSovdjSN2ct?=
 =?us-ascii?Q?e0OEBsNLLHRkT4T1YjMUpjdqg/nCZq33HsL1JoW4cQbqzd2WVXe6IizoznK9?=
 =?us-ascii?Q?9B1smKsvN5hNCnRCrXZftTSaMaaklMN4Zmerv0e1goMv34RSDp0CKqi7l4TB?=
 =?us-ascii?Q?tZi7MdI+WUq+/+IOqznv8GWWKcrodRAMgx7IU3FGQAMLEwoqbTd+MYhC7wF4?=
 =?us-ascii?Q?SBtJhwS8rtVDVaP87fofHo+iOjfMNFVj1yz8eRjVuyBsFJLtvKUP04wsrN/w?=
 =?us-ascii?Q?GfkKo0yvZu57QGkHM5uUilum5+HfMvlKBRmXBSEF0RpPkdcz+TsP2XDRnMCO?=
 =?us-ascii?Q?4UahrKWQB4094fjhGiUFkX8E2iKrZsdlbJCq1xDdeUZdBeI++BHx5gFlpG4W?=
 =?us-ascii?Q?fUASGXDldNAhQ7UExfW39fiTFFfIsr9q4MDScFsMhz3vxXcjAPV2TlH7wrta?=
 =?us-ascii?Q?TmSF2reoPxe2jdbQ5dcC5cDvx98+fXDyXfJQ1j+WHWxdlhkSHu6sx76ME5N/?=
 =?us-ascii?Q?dooXvUyj6G+iUKSO0DI8i1+386a/SsPUR5jB9IOziwMeyOOlxpocfSPoZE/r?=
 =?us-ascii?Q?Al81d7Z/0INSLxTD5Gn6V2gL/k1orp+WpN1/2TLRj1HSl23wmXRoy6ppfXPi?=
 =?us-ascii?Q?H7LvnKnO5Xqu936YR9Tk53rUJTpFXQFXmrQknd4jOYwMHQXH7uyBBUDQkLz0?=
 =?us-ascii?Q?WcO2olcKa+pPEyvlidsHb21j/7ZUk5V5eZSo8bXZa06P+sRBbXSrWmgjnrq9?=
 =?us-ascii?Q?QeRhpsp2Kya5Ob/0CZd97VdlnVVm0jkEVYp0aUtJXNUMybwQHMtg+sQCAXib?=
 =?us-ascii?Q?4gGh//35S21tgTm3mVmOtsUf6EW9rZMhtSx5uUdrseZAFbnzNX9ikQsDpHOb?=
 =?us-ascii?Q?TST8ZX6/nwK37oOQj57Yn8W6k3GHwzI9RnM/1sFIy0tGocwg3qcN/JOJ2rhe?=
 =?us-ascii?Q?zMS1hDWtgctjbzxT28eLs8GhlU23NmMuOtDwUZXcNwsMrXQro7JZvebbG+45?=
 =?us-ascii?Q?lsDw/sjgH7hQHuT+jxhxfADH102GZ1iY3wyZyZkKTvkzcXzXJ0/MF0Um/VRL?=
 =?us-ascii?Q?tHgcwHlZn5lHedd+z9voAeAV8hiwbOuqnaw/Qmzyohw7GlR7ZKa8PrTeroka?=
 =?us-ascii?Q?XkhnrlG/Rgen8QotLyxlN+Ly4NrRgdb7JNZm1Y/dJ3YXkZFzd/kJPv/D0gUN?=
 =?us-ascii?Q?WNA+9YwymO7lw420weFzh+ruwNeqtGXIZAsfAc0Te35a/aWeisezRRNk9zGa?=
 =?us-ascii?Q?c8sbLNWxNSRJBH5PlR8+TfSuVInLlH+gJpnvpvab3XO/YDZJW3PGmbOVXx92?=
 =?us-ascii?Q?uzScIYDCcjET5q9ZFLumX7ZBm0MeLuYOkoubbV70Y+2/iIaKMQ7DeTmCAx/F?=
 =?us-ascii?Q?iSNZkXLym3A6JJcL9rSXO7LrfCqgBZYu2JHg4ZyWHIImjShuw8V+v2OA2b3W?=
 =?us-ascii?Q?xYt4hW3mqFaEr7lBEIZEC7/kI5Z78CA8+IfcjS57+5I3Jemhu12BZAhXaSnV?=
 =?us-ascii?Q?C/1DujBTZIvODIlKSD1ciCObPZD7Pp18D2qzMFMRUeTKCzZFglPn8IN8s1XA?=
 =?us-ascii?Q?Fg+5Y6ebGsROYmu5kQOXES2FfQS9LkkhcaxUULJSjKQv05NIYZhVX1dlYnsZ?=
 =?us-ascii?Q?5NnWfoxRHDhDG4m9rSGRLveUYi9pJe/bOxMgWfLwl7aVd9iIU9NWxMmSbJ8c?=
 =?us-ascii?Q?OL6OSs7Zn+awxEaUnptsr4vGtpFTfNf5Gy6eoXkgQHHjcoZw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a8f7dd1-201b-4f8d-6447-08de7a283871
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 19:57:10.3284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TH9Qc28PlVuUpCY7N0kp1Ys0BSK9jjN4C+nXFiLBW/GccCeKP2P2VWYBkqEyYcH8zU5jWYpep6mmR6YUyMFavw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8798
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_115714_788394_6C08B71A 
X-CRM114-Status: GOOD (  28.63  )
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

On Wed, Mar 04, 2026 at 08:16:56PM +0200, Adrian Hunter wrote:
> The I3C subsystem allows multiple transfers to be queued concurrently.
> However, the MIPI I3C HCI driver's DMA enqueue path, hci_dma_queue_xfer(),
> lacks sufficient serialization.
>
> In particular, the allocation of the enqueue_ptr and its subsequent update
> in the RING_OPERATION1 register, must be done atomically.  Otherwise, for
> example, it would be possible for 2 transfers to be allocated the same
> enqueue_ptr.
>
> Extend the use of the existing spinlock for that purpose.  Keep a count of
> the number of xfers enqueued so that it is easy to determine if the ring
> has enough space.
>
> Fixes: 9ad9a52cce282 ("i3c/master: introduce the mipi-i3c-hci driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>
> Changes in V2:
>
> 	Refactor of hci_dma_queue_xfer() to do all DMA mapping first, is
> 	now a separate earlier patch: "i3c: mipi-i3c-hci: Factor out DMA
> 	mapping from queuing path"
>
>
>  drivers/i3c/master/mipi-i3c-hci/dma.c | 32 +++++++++++++--------------
>  1 file changed, 16 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> index 2442cedd5c2a..74b255ad6d0f 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> @@ -129,7 +129,7 @@ struct hci_rh_data {
>  	dma_addr_t xfer_dma, resp_dma, ibi_status_dma, ibi_data_dma;
>  	unsigned int xfer_entries, ibi_status_entries, ibi_chunks_total;
>  	unsigned int xfer_struct_sz, resp_struct_sz, ibi_status_sz, ibi_chunk_sz;
> -	unsigned int done_ptr, ibi_chunk_ptr;
> +	unsigned int done_ptr, ibi_chunk_ptr, xfer_space;
>  	struct hci_xfer **src_xfers;
>  	struct completion op_done;
>  };
> @@ -260,6 +260,7 @@ static void hci_dma_init_rh(struct i3c_hci *hci, struct hci_rh_data *rh, int i)
>
>  	rh->done_ptr = 0;
>  	rh->ibi_chunk_ptr = 0;
> +	rh->xfer_space = rh->xfer_entries;
>  }
>
>  static void hci_dma_init_rings(struct i3c_hci *hci)
> @@ -470,7 +471,7 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
>  	struct hci_rings_data *rings = hci->io_data;
>  	struct hci_rh_data *rh;
>  	unsigned int i, ring, enqueue_ptr;
> -	u32 op1_val, op2_val;
> +	u32 op1_val;
>  	int ret;
>
>  	ret = hci_dma_map_xfer_list(hci, rings->sysdev, xfer_list, n);
> @@ -481,6 +482,14 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
>  	ring = 0;
>  	rh = &rings->headers[ring];
>
> +	spin_lock_irq(&hci->lock);
> +
> +	if (n > rh->xfer_space) {
> +		spin_unlock_irq(&hci->lock);
> +		hci_dma_unmap_xfer(hci, xfer_list, n);
> +		return -EBUSY;
> +	}
> +
>  	op1_val = rh_reg_read(RING_OPERATION1);
>  	enqueue_ptr = FIELD_GET(RING_OP1_CR_ENQ_PTR, op1_val);
>  	for (i = 0; i < n; i++) {
> @@ -518,22 +527,10 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
>  		xfer->ring_entry = enqueue_ptr;
>
>  		enqueue_ptr = (enqueue_ptr + 1) % rh->xfer_entries;
> -
> -		/*
> -		 * We may update the hardware view of the enqueue pointer
> -		 * only if we didn't reach its dequeue pointer.
> -		 */
> -		op2_val = rh_reg_read(RING_OPERATION2);
> -		if (enqueue_ptr == FIELD_GET(RING_OP2_CR_DEQ_PTR, op2_val)) {
> -			/* the ring is full */
> -			hci_dma_unmap_xfer(hci, xfer_list, n);
> -			return -EBUSY;
> -		}
>  	}
>
> -	/* take care to update the hardware enqueue pointer atomically */
> -	spin_lock_irq(&hci->lock);
> -	op1_val = rh_reg_read(RING_OPERATION1);
> +	rh->xfer_space -= n;
> +
>  	op1_val &= ~RING_OP1_CR_ENQ_PTR;
>  	op1_val |= FIELD_PREP(RING_OP1_CR_ENQ_PTR, enqueue_ptr);
>  	rh_reg_write(RING_OPERATION1, op1_val);
> @@ -601,6 +598,7 @@ static void hci_dma_xfer_done(struct i3c_hci *hci, struct hci_rh_data *rh)
>  {
>  	u32 op1_val, op2_val, resp, *ring_resp;
>  	unsigned int tid, done_ptr = rh->done_ptr;
> +	unsigned int done_cnt = 0;
>  	struct hci_xfer *xfer;
>
>  	for (;;) {
> @@ -632,10 +630,12 @@ static void hci_dma_xfer_done(struct i3c_hci *hci, struct hci_rh_data *rh)
>
>  		done_ptr = (done_ptr + 1) % rh->xfer_entries;
>  		rh->done_ptr = done_ptr;
> +		done_cnt += 1;
>  	}
>
>  	/* take care to update the software dequeue pointer atomically */
>  	spin_lock(&hci->lock);
> +	rh->xfer_space += done_cnt;
>  	op1_val = rh_reg_read(RING_OPERATION1);
>  	op1_val &= ~RING_OP1_CR_SW_DEQ_PTR;
>  	op1_val |= FIELD_PREP(RING_OP1_CR_SW_DEQ_PTR, done_ptr);
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
