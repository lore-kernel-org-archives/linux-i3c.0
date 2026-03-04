Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A811EFCE37
	for <linux-i3c@archiver.kernel.org>; Wed,  4 Mar 2026 20:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x0rBphXNx7QyNNH7NRoWOSPTOSxpaz3z8MEJRF7tM84=; b=cCvMxOllaxvRTS
	B7SBDDAgzJIIgoyQXRWShW+yVNnhoQfhdRYJNiNWgZ741/NNhdw5dFvxrVGXruMxojAv7SmWRDhv6
	xGtFh5kzlxNwxLWeOfUz636+F+erpbcKmotWLI22+nva+PbRyb9vtqtWaw/flNld2HdYZPIyCpRAY
	WC8h1ADMz/ArGqC+Rrvtc5lDBrJJpslqf7Zc5bwHltnkfcLfSlMwArocTSt3k4eNGK/xN8ZCyeNT4
	MHQcCWLwjITc+r3jvXQc46rJdLl9kdn/m/Ed5rfDxtFEQ9s2bl4slrqrUe15ApqoYS1keMiNVsuG8
	/TMEr8BElGjx1O5e/+8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxsTi-00000000R0o-1H6d;
	Wed, 04 Mar 2026 20:05:54 +0000
Received: from mail-northeuropeazon11010004.outbound.protection.outlook.com ([52.101.84.4] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxsTg-00000000Qzr-2L14
	for linux-i3c@lists.infradead.org;
	Wed, 04 Mar 2026 20:05:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YpEb6bz31J8ZNZpTLrBvpKXrQ8UeE9QGqSV67Qw1PjS5os8OXFOUf5g12yf1q+RuEVavaZNHz2nynAVN8kB61IHC+IAK348KU0TWTWCAkExRnE2k8MpAn/RKd+UCsfe/cz0U2hal7A/4OQiQOEaU3tPG3hESQwfewOLs1MfVG1fq1cwCGiMrIlPkz+5SiSMfpQRTSufqf0ShPYbIse4vXgcYjgeWSoHiAonMPuMTlPDlP/b4xA7GgQhXIopG2LvaqLoGJ0oi32xXhMxecpb04uzv8ts8htAWZHxgc4L546n8hn1dPPzXeyvGoLdlcPMkkKU7LpT8aMr1xyyJKN/hdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SbkWzDYfOVBTzGwetpzUYce718nsFu+FupwjiOmMbGk=;
 b=m5sipGeFxLO0NkSGVLmRIWvLovzGeorC4ckRO1fDolngvzB/NjaPVPJDWfEUye811Rd7+2UczWFnSti60c0DyUUMtz/0kQukuj3GMLY3C2VWGBWYQb+5CRIi3nWRYeD+3vSGV2/b4uvTMHwlqYIV6M+3tD4K6TcPtx/FfleP/DQkrrsPWnyfHzRelN7RsFXwwCpD4KjG4BrIaVvURQAIg+61dKZSqsq2/2ZdNWkdxsO5GiyoZZJZICQ6mT+A1PEwFgs8UltEJxJYdKy3/iFFPifcYChtUPhqkBOSU/LdSi8b9qWTPu3kZCCFTBEwNEcwQai2M5vWxVAoowg/4SsENw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SbkWzDYfOVBTzGwetpzUYce718nsFu+FupwjiOmMbGk=;
 b=JwX3K/gav2litUAucJSfLeXqE2/giJnf6pvE7Tb+8dESOw1haM4ntNs3pnu8LTA3Czx5W66+9zAp6DttwJwUiIakewn4/unIi1ACRCWShYtCBzDtoewpKlpNp0WymYPYbvtDZuEMVds0a4Q0McgjYLIx/qjpSYlMdq+jmFRpgTm6DsXC4C4z/9Buf3B6Of5yVxevqQtxXarq7UrQqSPbbNzpUDWmZPPn4jb3yG8WeQ3Ah6C9X99OiPABTKKL9ShXp2zZmD/IJ1k3LhySlaLuJoZuF4aagtwzIZxZ9BGsWO0CzdisojeNNEztKAj+cM8zvxUc+dJsDijZqMugQMIq8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VE1PR04MB7406.eurprd04.prod.outlook.com (2603:10a6:800:1ae::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 20:05:47 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Wed, 4 Mar 2026
 20:05:47 +0000
Date: Wed, 4 Mar 2026 15:05:42 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V2 07/14] i3c: mipi-i3c-hci: Fix race between DMA ring
 dequeue and interrupt handler
Message-ID: <aaiQlr5XdQYB33r3@lizhi-Precision-Tower-5810>
References: <20260304181706.143841-1-adrian.hunter@intel.com>
 <20260304181706.143841-8-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260304181706.143841-8-adrian.hunter@intel.com>
X-ClientProxiedBy: SN1PR12CA0084.namprd12.prod.outlook.com
 (2603:10b6:802:21::19) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VE1PR04MB7406:EE_
X-MS-Office365-Filtering-Correlation-Id: b28d7b9b-bf53-444e-1815-08de7a296d04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|19092799006|376014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: Oi4R8hVIA2xtqnnUeQdy7cR69oAupR3XGWVKYcnKrn/oxWjsxWmRtxfJjxhTM3JT+nZVAAupCWTlfd1Dje56R43gdAgc9ZZ4i3WLBvsZQvruUdv+dhQ7NimM5UmvO/guJTCY+mEJa+ncC42p8KL8cqSgkbMrVjLx4JpQdjY/ap5rcSec05FkNWTXSAgpvzaEaps0W13nBder450w5OemI5X7a59OwI14t0PjNlUNxkH5XTefvW/1VKR8/VBbHQCcBdi0IIneCqX1KLIyBIHJcgS4f9KEQ9ChPP6gHm9xX4aDvFHJWTpLXoYaMdfyPG9h3KQZwNlaNHe8s5NuNeZ5fZE7k1JRZFElUgnjfqBvKWck9Sn2tcl0HpMcm50axrBZq+J5NN44Io1RWFqydtg/GsJdT7O9xdBKYgGqBbxYR/I5LqGvF0qqxk17c1LhOMCZ5+lkz5HMGLQgTTQWZMePFAVcKb4/WgzOewekhmlaLtR0+K/I7nf7oO492Ovtv1SDZptz10mPia6UK/8ndcRG5nLbtKYkB6qtaw6S2tNRaQqtOSpA///7WypLf6Cm1b4g8uwyeusIJNyulEmxoARA5ohktnapNEthCQDb2exBdETsGSQKEyQqSjuSHq0jH6DYqjSxJmUr998h7HgjoQijaROHc/L2scW6mIR3AbE3S7yBCx+HkTGmFDLzM+uDwcy8Xi9jMdOz1CAVDau2D88aiFzRblCFm/lrrx9cdNu2OFG3HDRrjLJ8oJN3DX5/SXsgkRxJ/EPckniTbJwJ+6qSN9F8yP8acGzx2586XQxVvyE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(19092799006)(376014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XDpgBk7VyRtohOapEkqJS6h2xxGAhPu/iAjZBRpElOp2LY1Xeke7lj+RmXhD?=
 =?us-ascii?Q?kz7LVwCGvjmGeld1WrUoLTmGD1cynWYiDi7+DC8mo2qV95BCZJJ8prl1ToDm?=
 =?us-ascii?Q?6o7Vj5d+RqztBZRud5bs+cwtEI/BgE2l/L3Juh0jrWI/xshMXejIr0HcyUnQ?=
 =?us-ascii?Q?WGmrPYJA58Vh4rQW4dWLAoA0hCcT9nYofLfv9HVwCUZ3GEiB/X4636NZI8iK?=
 =?us-ascii?Q?e8NA7Yg6Fq5jSB2on2S45TJATs6+zhmEp5nXsQ7aaByF2mhvrhqxHoH/3NpT?=
 =?us-ascii?Q?/DtAcBMckemNRaS3miMHL+OWQMVYR221sObTnzErw8omKcU2zEAJSrHRy1Qc?=
 =?us-ascii?Q?nqHAGeg3/aKhqDWEGBQ+iEbkF+14Z6BnKidxuKvDPE1JskR1qyN0wbWGCZ7x?=
 =?us-ascii?Q?MbB8Hou9ELe6dbP6hqooTkE+YPQzR8YJiN5KuxhbPJkECycOyNqOs7HR7UPH?=
 =?us-ascii?Q?gf9VZnsweV/8WdKbSKfCMru+4ZfWtjho3IlKpU1WDdZj3XfP5KmydEE1Iz4m?=
 =?us-ascii?Q?g5VWGECgWlTkm0PKGhTGxTIMgW/aidj9Wbvd0hhxNYPLb001CoSTyganELq9?=
 =?us-ascii?Q?s9VKC9P2yRwXEUEYj+qjA9TYPozr4TdTcrsMrs48vEcH/6w5wqdoA2HOgoHE?=
 =?us-ascii?Q?/Xv/oRbi/zakGmjrTZ25qDcci2AIkK8BJRC/04osYOLxl0V/YjDGGpcw5lr+?=
 =?us-ascii?Q?xFL8EpICKi6/3/h8t82BpBMUrRdPymcJ9k+nEifjusSCLQKtxajPnOhLlo+S?=
 =?us-ascii?Q?gAutT6N7SjNoZ90IAEyL5ydF24X5aeLjGzaiFCPpiWr2SCnJopcPNyfv8Sgc?=
 =?us-ascii?Q?WzJmMPgxXosGCn8VCSWUjUndwUOlfQycW3IPuAjD6gnLbqXKA7AlUgVmCd3C?=
 =?us-ascii?Q?QP2QrdxS7v0VFbC0xyakKNKPke4ClNKQBANJzkryTTkzng+7uBZAYIJ983aD?=
 =?us-ascii?Q?D7qU2hxbcVxZ6OB79hTh1Ioq07/zGoD93yvzLNCiObk5VleJbo+A5rwt9+RT?=
 =?us-ascii?Q?1vMT+nzj0zUhLG1vdYueNJW4rawRgbPa5qeDZjwQC9pZGIQVu68nBjoibM0a?=
 =?us-ascii?Q?A34YVgakhvc5Buq/lN2gmFEH7QZidhlLnZWJQsYRFkq4+5kJjL2lGJMXnuYE?=
 =?us-ascii?Q?hLZTbur4nfswVxgAEu3oD+nSCc8IVb76LzBzFypY+ux2IHsxddT0NUcJ6nYG?=
 =?us-ascii?Q?eP2cLnsnjlBVQIwdbwqOsxS3MfcVFJ9xtdUhg9kxcJ0Aw09mhbgI/Ju+dRPr?=
 =?us-ascii?Q?0AuTInOd4Rx7KoEMpaP5I4sMdw+ilXmlOSaWqjP5ZZwXkoVBTCak5q4SVfEJ?=
 =?us-ascii?Q?96X46aGlwaUeju4fhjxWpj2K1JUxilxyDMKvqkoyFzEPAhU8br+YRcrNCkLq?=
 =?us-ascii?Q?4JAlHqizqM0sWkzUOnx5fUf5ceH1y6WzXR5X7ZKXpHcpV1XDqI3zT8RyGx7y?=
 =?us-ascii?Q?c3lJwGxUkR2b0oIqU2CgAguEAdkmv0cb7fb/3PLyzKNxcDe+9U660g1LsSm7?=
 =?us-ascii?Q?rmRAp1oGfIEXXBi5X+24YAU7VgDywSPkX1UMbfpLMILXxE8eeD9rB3YUeWF8?=
 =?us-ascii?Q?sZ5Y81dcpqy6PLdd8HGF1pzePHUEGgKquKnTaRMN1TaiaeIRWgQ99E8+jGVs?=
 =?us-ascii?Q?/F3u2Q48dHl74Gaj9ZXDo9zhnNiYF9t/VrXIs3mTM4PIGTVJgxZclltIqyfy?=
 =?us-ascii?Q?8G8WLZwxR2yBGptkW/lu8FCbAVqT7Omxv8WOYZ4MlIE6SksW2ms4jW3ncdJ3?=
 =?us-ascii?Q?DObc4relUA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b28d7b9b-bf53-444e-1815-08de7a296d04
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 20:05:47.6421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: br/kFyceZPVywr38ywADwVcDXX9swBHkh4NhVR7JyNYTjMwgsEoQa7z3oRKgTCZc2h5/tZP/fNU8Hz+KH47c5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7406
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_120552_606035_3580F8A2 
X-CRM114-Status: GOOD (  30.63  )
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

On Wed, Mar 04, 2026 at 08:16:58PM +0200, Adrian Hunter wrote:
> The DMA ring bookkeeping in the MIPI I3C HCI driver is updated from two
> contexts: the DMA ring dequeue path (hci_dma_dequeue_xfer()) and the
> interrupt handler (hci_dma_xfer_done()).  Both modify the ring's
> in-flight transfer state - specifically rh->src_xfers[] and
> xfer->ring_entry - but without any serialization.  This allows the two
> paths to race, potentially leading to inconsistent ring state.
>
> Serialize access to the shared ring state by extending the existing
> spinlock to cover the DMA dequeue path and the entire interrupt handler.
> Since the core IRQ handler now holds this lock, remove the per-function
> locking from the PIO and DMA sub-handlers.
>
> Additionally, clear the completed entry in rh->src_xfers[] in
> hci_dma_xfer_done() so it cannot be matched or completed again.
>
> Finally, place the ring restart sequence under the same lock in
> hci_dma_dequeue_xfer() to avoid concurrent enqueue or completion
> operations while the ring state is being modified.
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
> 	Now uses unified spinlock (as per earlier patch "i3c: mipi-i3c-hci:
> 	Consolidate spinlocks") and extends coverage to the entire interrupt
> 	handler
>
>
>  drivers/i3c/master/mipi-i3c-hci/core.c |  2 ++
>  drivers/i3c/master/mipi-i3c-hci/dma.c  | 11 +++++------
>  drivers/i3c/master/mipi-i3c-hci/pio.c  |  6 +-----
>  3 files changed, 8 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index 061e84a5c412..adf35b7fa498 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -567,6 +567,8 @@ static irqreturn_t i3c_hci_irq_handler(int irq, void *dev_id)
>  	irqreturn_t result = IRQ_NONE;
>  	u32 val;
>
> +	guard(spinlock)(&hci->lock);
> +
>  	/*
>  	 * The IRQ can be shared, so the handler may be called when the IRQ is
>  	 * due to a different device. That could happen when runtime suspended,
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> index f7d411e5e11f..d7840ff69e59 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> @@ -560,6 +560,8 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
>  		WARN_ON(1);
>  	}
>
> +	spin_lock_irq(&hci->lock);
> +
>  	for (i = 0; i < n; i++) {
>  		struct hci_xfer *xfer = xfer_list + i;
>  		int idx = xfer->ring_entry;
> @@ -593,6 +595,8 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
>  	/* restart the ring */
>  	rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE);
>
> +	spin_unlock_irq(&hci->lock);
> +
>  	return did_unqueue;
>  }
>
> @@ -618,6 +622,7 @@ static void hci_dma_xfer_done(struct i3c_hci *hci, struct hci_rh_data *rh)
>  			dev_dbg(&hci->master.dev, "orphaned ring entry");
>  		} else {
>  			hci_dma_unmap_xfer(hci, xfer, 1);
> +			rh->src_xfers[done_ptr] = NULL;
>  			xfer->ring_entry = -1;
>  			xfer->response = resp;
>  			if (tid != xfer->cmd_tid) {
> @@ -635,14 +640,11 @@ static void hci_dma_xfer_done(struct i3c_hci *hci, struct hci_rh_data *rh)
>  		done_cnt += 1;
>  	}
>
> -	/* take care to update the software dequeue pointer atomically */
> -	spin_lock(&hci->lock);
>  	rh->xfer_space += done_cnt;
>  	op1_val = rh_reg_read(RING_OPERATION1);
>  	op1_val &= ~RING_OP1_CR_SW_DEQ_PTR;
>  	op1_val |= FIELD_PREP(RING_OP1_CR_SW_DEQ_PTR, done_ptr);
>  	rh_reg_write(RING_OPERATION1, op1_val);
> -	spin_unlock(&hci->lock);
>  }
>
>  static int hci_dma_request_ibi(struct i3c_hci *hci, struct i3c_dev_desc *dev,
> @@ -822,13 +824,10 @@ static void hci_dma_process_ibi(struct i3c_hci *hci, struct hci_rh_data *rh)
>  	i3c_master_queue_ibi(dev, slot);
>
>  done:
> -	/* take care to update the ibi dequeue pointer atomically */
> -	spin_lock(&hci->lock);
>  	op1_val = rh_reg_read(RING_OPERATION1);
>  	op1_val &= ~RING_OP1_IBI_DEQ_PTR;
>  	op1_val |= FIELD_PREP(RING_OP1_IBI_DEQ_PTR, deq_ptr);
>  	rh_reg_write(RING_OPERATION1, op1_val);
> -	spin_unlock(&hci->lock);
>
>  	/* update the chunk pointer */
>  	rh->ibi_chunk_ptr += ibi_chunks;
> diff --git a/drivers/i3c/master/mipi-i3c-hci/pio.c b/drivers/i3c/master/mipi-i3c-hci/pio.c
> index 02866c2237fa..8f48a81e65ab 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/pio.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/pio.c
> @@ -1014,15 +1014,12 @@ static bool hci_pio_irq_handler(struct i3c_hci *hci)
>  	struct hci_pio_data *pio = hci->io_data;
>  	u32 status;
>
> -	spin_lock(&hci->lock);
>  	status = pio_reg_read(INTR_STATUS);
>  	dev_dbg(&hci->master.dev, "PIO_INTR_STATUS %#x/%#x",
>  		status, pio->enabled_irqs);
>  	status &= pio->enabled_irqs | STAT_LATENCY_WARNINGS;
> -	if (!status) {
> -		spin_unlock(&hci->lock);
> +	if (!status)
>  		return false;
> -	}
>
>  	if (status & STAT_IBI_STATUS_THLD)
>  		hci_pio_process_ibi(hci, pio);
> @@ -1056,7 +1053,6 @@ static bool hci_pio_irq_handler(struct i3c_hci *hci)
>  	pio_reg_write(INTR_SIGNAL_ENABLE, pio->enabled_irqs);
>  	dev_dbg(&hci->master.dev, "PIO_INTR_STATUS %#x/%#x",
>  		pio_reg_read(INTR_STATUS), pio_reg_read(INTR_SIGNAL_ENABLE));
> -	spin_unlock(&hci->lock);
>  	return true;
>  }
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
