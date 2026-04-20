Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D51FEA71B3
	for <linux-i3c@archiver.kernel.org>; Mon, 20 Apr 2026 02:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gh5GXmfakqa8looz/VJLPQiW5IdEkuy2Y3crcbIaPkM=; b=QkXGhP1SVO241Y
	d1oBnCnsA3IBnXLJTWLiEUyGAbUw5nBQuEEvtC8AzKU1Fi7metEvSCFkyJMYq4/9ZRzslpTr757ub
	snfb2+N25k8kbB55sGkbcyH8UugsFI08YJr6GEc17eGkpt9fuLj0HBvAg/XHu/HoSvWoOMky8IiSr
	LQewbhAIX2PGgjcAW3hYi0+yzYBAXiGVmU95XAdA9cgzf1Gg/4wf7l+lOkV0MHsBJu6rESRx9IHbL
	85o/iuRxNqTKVMA40qQUB9x+50BeFcilgI8+EwDD9pV5Ey010RRJ4Zl9JLsB9XeA2bKxq8C+5q8XB
	q5JgDXvirUHSg/avUMtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEeFs-00000006Jo7-3w1H;
	Mon, 20 Apr 2026 02:20:57 +0000
Received: from mail-northeuropeazon11012039.outbound.protection.outlook.com ([52.101.66.39] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEeFq-00000006Jn5-2Byp
	for linux-i3c@lists.infradead.org;
	Mon, 20 Apr 2026 02:20:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pcaa3yyYbnjAOjwj8QfnU34CNm8Pj+gCZA3/b1BGs5sRSX63qtc70n41cPGMTnUYtKTuBmLp7zbPPkA5zIR6h0J0ktBfzgujTJMxE+1cOmxRraOjK6aOi9QyAonAePmdfgIhEdoqVcVcurcWtLqr+5A7ThcvA9ZUVxxxalqzzysWCG3qnUExtXsu6skfThyzokT5fBPUjy9YghDgpDkUkdFxIKCSDSNQKXYJj61O2chqjO+St9ycDqcmWzFnZtcqaLT/Zu0DYwONBbkHVWzn38/lui2Sakn5n3Mz0jqvwS8GNu4iHRsRLIf8tPbumbJz8xfXu/x0J1Z+JwHrqNP8XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AuQUqz2ITs3BaHYKyFvhw/F/98QmN8dUrSxI2pCy0ZE=;
 b=q6zPP1PPtjcJBA3ITsdGIMGzb09uDuP2n1SD1Mte159HbJ3c1bfFGmN6BGFJfd2TQnDYta3MGSCpJMnRnEMaoSMLTUC8DBScAhuH5kP34l7rAy9l5SVJ5g82HOIn8ND+o4VRpt0mOzz8nQY9JWR25R5dHV+bwAGpha1cKkbpRf8P19Qolg5Tx1Yr7Sl9ewlQDlG/kk7HZ+lNRBPgBUE1jtVIf09G61+6mL159HJcxljEn6RXg2WVZ1xcDLy1VYyxB/LyL4KaL5NuS8j7vfs2gISm4HffxOrOCTqz8uMT9dZS1RqbBiWqi6RQ6nWWmO368Kp/EtOF4RuWlwFxLRYNtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AuQUqz2ITs3BaHYKyFvhw/F/98QmN8dUrSxI2pCy0ZE=;
 b=bW0gJyI5sSIMshZ6y1Hq0kAvuFSCruNMeH78MTYIex0eKCq6bIWs8tJmLhQs3CZ78WBuccCYHkeAOzU2F4LWG0z6QvmRoVkuHywnVvHN4xXfMRZlbmmuhGgKEFHk9WcfeXlCn6pBMOeV+/6ohoBncxXcpvTIsjdMbMOYp3omzzqfZ+bThGAF8FzBGY/hj7OIO538ND/euy96by68h43JDV+3kkRCIrQUTUSMRf3HWM/AFhlptr/cRFa65TwjPKM1T7sMtBUYf5jWnTgOoQGhWz35W9ywORfEF1XNtQPDxpnVb/eCeAFdUJnRNO0LlVHYeh6N5aMwclO7oOculX+2ag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS8PR04MB8037.eurprd04.prod.outlook.com (2603:10a6:20b:2ac::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Mon, 20 Apr
 2026 02:20:50 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9818.032; Mon, 20 Apr 2026
 02:20:49 +0000
Date: Sun, 19 Apr 2026 22:20:44 -0400
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/16] i3c: mipi-i3c-hci: Prevent DMA enqueue while ring
 is aborting or in error
Message-ID: <aeWNfN0x-Ptsj1-g@lizhi-Precision-Tower-5810>
References: <20260416175704.41217-1-adrian.hunter@intel.com>
 <20260416175704.41217-4-adrian.hunter@intel.com>
 <aeHZnUV0QlGHYlVA@lizhi-Precision-Tower-5810>
 <3db31a9c-443c-4d2e-a6fa-8cf16cb80bcf@intel.com>
Content-Disposition: inline
In-Reply-To: <3db31a9c-443c-4d2e-a6fa-8cf16cb80bcf@intel.com>
X-ClientProxiedBy: SA0PR11CA0204.namprd11.prod.outlook.com
 (2603:10b6:806:1bc::29) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS8PR04MB8037:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e806e23-5252-47c5-fa9c-08de9e837066
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|366016|52116014|376014|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: RsFACaAlhNSbQCC17Nb4VZQa4m65mBIm5hW5D99GvyB2BbnhCzTKpQydKA7MUl/ZauHspwc/Dd7KFahCBOSnFr18Iyi1fqOGjH+RobsgSeHsk6wsMVh1bX+Ehw1iLwBzS0ea1J5WakEaqzU9pfuIFEIF2ICuumV6q9Vk5ooTq712g6Aj1ferHRjvspmbYxokuHDKwLU8ZFw9D1VpZ9T/bw0m7ckgYxNx7gffc/gUWyKb68olUP8squ9A5SxT3pcGynWXJk7qQa8e1qsEygrN5+61xO+RDQ0pmJwD6fWmH1w4RgHN8lzqywzY5+IgmI+74mh0pwqrHmW8DMylieUdKeSVisW+flNRuqxZLH4dlytNmyw/G6HmEdJiJ0ofkFAmvHiNIiLTB8RGRpIO+/oiO/aV6dXD3n0MgFyMZVd7EX06cJ8WyDxTaIz8zfOcE3al461NZc8pHBtafXC87r0iRWbpT5OLdhWYfixb0CyNVsWvl2lk6J0nXWWHWVbq1uPjNC3YOkeU/HCaNAsUafTYNeuGX8Q/0BExe0apFM17e6wua7xyv4pgDGHUypfRdMrzzChUYcQHG+8PsiGJUJI6brzpBw9PgL3wXhLpFCSjtKFjJljf5vJQ25fkMAvwHft8GsHS0dlY5+WoBdlAmF5p/e6rScqhdaBLRYTpH4U7EHRunn7D1Ax10BYMq+DkTlm6fAGH5xyvP32iQ8z+FqgN+WnoukmUSkw3N2JMgL4tdC7JZfmfRnPL6QXHnYfQOr+INDaigyqkKsznRBImfNH4WwBai9f791J0kSeQrg1KdgE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(52116014)(376014)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+xoVbaQgi6+71St7jMP9FxDxG6+P2YBJ8t8Bv6K0QHYduNU+MsW5pRAiW6I3?=
 =?us-ascii?Q?s4JSebQirS2Q0krMO/MUTuS0zF2GXXwTrLBBQCeLoZzbbTFCPi4IB23AhaLK?=
 =?us-ascii?Q?1XCzhlebNj3i7/1lF8xCnXE5FkhJiuDYp51PeXbcOBUk9+U94o0682y40cTj?=
 =?us-ascii?Q?lWBQ24oPUHqNIMsRuqUr7ojTAqNK+VD6QV3QRVtWA8OZcUi5b8IFdnrH/i4P?=
 =?us-ascii?Q?Gs8YUwOnl9j4ngB81jA9glCQ1kge1z/tCs2iZSga1dYC9HXwpDyjjYuNX0qG?=
 =?us-ascii?Q?IDIVPn12QUkoiRXcEwC3kF3O5Zsbe8/uQioUhi0sByu1W9XBweOHk15W5zEB?=
 =?us-ascii?Q?6MEszAsWthrlDvmq09TR3D6bFbK2rTXgw4R7Zbw0gUr4keP/o5uCM8WhevZO?=
 =?us-ascii?Q?sA1n9Mqyo5ET7ekz8K+RAcwpoLM1n3NtXRpzyMtYfbWUqMdMVANJiUc08mdv?=
 =?us-ascii?Q?KHFUfiDwxHnXtwP+/5Eo6UIUSmLkt88eg+1QALXaCVdWeqbi2IJ0fqYXitIx?=
 =?us-ascii?Q?moaY8zRlTxgXGiuFjPQwUnMPR77pSIAp4yG6kIVIYbzYpklKHXahMvsDE5WN?=
 =?us-ascii?Q?C8m70ft+WNK3YDUmw/I/gUduT5M0yf6Kvp46/GfJRy5FyjA6qt2SOHB44uVg?=
 =?us-ascii?Q?IzLzwqY0Yi8GlOWvVgUa0fDpHQuJp9RrVonSTWWSwGqxlXU5tXP8SOzNLJiY?=
 =?us-ascii?Q?sysr8VQUpEs3Xd9hFr1Fd0BZpTInkjsm4Vb1awWpnYkaNdMSbM4JWOB6zIsW?=
 =?us-ascii?Q?eeJtxz3s8ceklQPgftyvxPfjwJLSmb3bT1Qe6UrQcqhqc6f5gFxu8AQajTug?=
 =?us-ascii?Q?8LNth2pi5zDpMqSZK37nBO8OUD0SYg0I34M/qebBtP7fzbShKdXpG34A/pwt?=
 =?us-ascii?Q?mRAM6wchN9wFbyU0+SaVgjBH9XJnPMNLxCtiKq0C3aAwLzC+XkFNfIq7c//o?=
 =?us-ascii?Q?gCXIrGBHK7IL8B8sy1wRD62iOz6Sgz4cz6ZvC63D5DowZ6zG8GEBw/9K+XIa?=
 =?us-ascii?Q?/OjCoRnbeygoDiV9Qk0Xa52PXq0zBeMnA2XDeM6ZDL8uCI9i2lO/Siwjo4YS?=
 =?us-ascii?Q?lIZv+aVeQxZmAlaVbnTQsyJCEvxRukuL+A5uOgGnPeZw8LYK9jtV71a7ig6Q?=
 =?us-ascii?Q?cIXjDzA9/7rZVcewjVllAoWHT0TSjXGRHoXi6bvotR+3t5xWZZ4/iw7i1ri9?=
 =?us-ascii?Q?8lnA6Z6MTR2lzuwQt+Wf1QB0dawRBOJk+bU8A4Rdowi/lANhr94Szk3hqvxH?=
 =?us-ascii?Q?1kRi/+q6H2oBK2k1ykDHtIMgn0cktQPEr9VZCT9JchY5C88ieGcauJJn0JWU?=
 =?us-ascii?Q?xVVgNGlhecHy7kNpnD4Iu4u3DMNPiK1y8DuCEf6u5oRSXtJhej65Da+lnN7V?=
 =?us-ascii?Q?Otgw0FQf3flJan4Y+IOPAwAbJ76ropD+LV2f2AYD97o5eZyQ2dAp/QqqfYhS?=
 =?us-ascii?Q?9GzwW9T9Ed4I/f5/ghFvA9pOyOFo3GlQbUFJ6aimeOc49D2kzuifudsTYUSq?=
 =?us-ascii?Q?CyWUtQ4L25Y24Wlno2Ou6Y+zYBZo4jkcwsCZkg8FK75H8lCZKJeKZJh4+PSI?=
 =?us-ascii?Q?QRxPjEmmzeyXOrgV4qgAEykArO113d6+EIE6/JN0Ezxz81+2KHW+6P7Y49VO?=
 =?us-ascii?Q?hBT8T2eboR4GAe3xoKWxIqURHmwPmv5cUsTBERWdDF1jbVpkD995BtSQJlXJ?=
 =?us-ascii?Q?1M2U6Nk+ar9hfpRNFD9Jqwviah1Vh0vYnNo5sWGB9NxKNHXo9OFBpvRBuKPe?=
 =?us-ascii?Q?c8EcjAfDKg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e806e23-5252-47c5-fa9c-08de9e837066
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 02:20:49.8424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JFYhUh9gmJjwFb1b6OBoJYXskFo3EUsMGOmK3fBUKm9pSmlj2fxcxQo527Q0tWMmeDpxSk3dl3z/soy5OGvvJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_192054_562575_A3511798 
X-CRM114-Status: GOOD (  32.41  )
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

On Fri, Apr 17, 2026 at 08:07:11PM +0300, Adrian Hunter wrote:
> On 17/04/2026 09:56, Frank Li wrote:
> > On Thu, Apr 16, 2026 at 08:56:51PM +0300, Adrian Hunter wrote:
> >> Block the DMA enqueue path while a Ring abort is in progress or after an
> >> error condition has been detected.
> >>
> >> Previously, new transfers could be enqueued while the DMA Ring was being
> >> aborted or while error handling was underway. This allowed enqueue and
> >> error-recovery paths to run concurrently, potentially interfering with
> >> each other and corrupting Ring state.
> >
> > why not hold lock at abort and error handler? does it take quite long time
> > to do that?
>
> hci_dma_dequeue_xfer() handles errors.  It is called from
> i3c_hci_process_xfer():
> 	on timeout:
> 		calls ->dequeue_xfer() == hci_dma_dequeue_xfer()
> 	on error:
> 		calls ->handle_error() == hci_dma_handle_error()
> 			calls hci_dma_dequeue_xfer()
>
> It takes the spin lock, but has to release it to wait for the
> abort.  There is no set time for how long the abort can take,
> but the timeout is 1 second, so it is not suitable to wait
> for.

Feel like overall equeue/dequeue and timeout's lock is too complex, it is
quite easy to involve bugs.

Is it possible to use simpler design?


Frank

>
> >
> > Frank
> >>
> >> Introduce explicit enqueue blocking and a wait queue to serialize access:
> >> enqueue operations now wait until abort or error handling has completed
> >> before proceeding. Enqueue is unblocked once the Ring is safely restarted.
> >>
> >> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> >> ---
> >>  drivers/i3c/master/mipi-i3c-hci/core.c |  1 +
> >>  drivers/i3c/master/mipi-i3c-hci/dma.c  | 25 +++++++++++++++++++++++--
> >>  drivers/i3c/master/mipi-i3c-hci/hci.h  |  2 ++
> >>  3 files changed, 26 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> >> index bb8f2d830b0d..5e1bc6d819cf 100644
> >> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> >> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> >> @@ -976,6 +976,7 @@ static int i3c_hci_probe(struct platform_device *pdev)
> >>
> >>  	spin_lock_init(&hci->lock);
> >>  	mutex_init(&hci->control_mutex);
> >> +	init_waitqueue_head(&hci->enqueue_wait_queue);
> >>
> >>  	/*
> >>  	 * Multi-bus instances share the same MMIO address range, but not
> >> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> >> index 4cd32e3afa7b..314635e6e190 100644
> >> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> >> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> >> @@ -484,6 +484,12 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
> >>
> >>  	spin_lock_irq(&hci->lock);
> >>
> >> +	while (unlikely(hci->enqueue_blocked)) {
> >> +		spin_unlock_irq(&hci->lock);
> >> +		wait_event(hci->enqueue_wait_queue, !READ_ONCE(hci->enqueue_blocked));
> >> +		spin_lock_irq(&hci->lock);
> >> +	}
> >> +
> >>  	if (n > rh->xfer_space) {
> >>  		spin_unlock_irq(&hci->lock);
> >>  		hci_dma_unmap_xfer(hci, xfer_list, n);
> >> @@ -539,6 +545,14 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
> >>  	return 0;
> >>  }
> >>
> >> +static void hci_dma_unblock_enqueue(struct i3c_hci *hci)
> >> +{
> >> +	if (hci->enqueue_blocked) {
> >> +		hci->enqueue_blocked = false;
> >> +		wake_up_all(&hci->enqueue_wait_queue);
> >> +	}
> >> +}
> >> +
> >>  static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
> >>  				 struct hci_xfer *xfer_list, int n)
> >>  {
> >> @@ -550,12 +564,17 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
> >>
> >>  	guard(mutex)(&hci->control_mutex);
> >>
> >> +	spin_lock_irq(&hci->lock);
> >> +
> >>  	ring_status = rh_reg_read(RING_STATUS);
> >>  	if (ring_status & RING_STATUS_RUNNING) {
> >> +		hci->enqueue_blocked = true;
> >> +		spin_unlock_irq(&hci->lock);
> >>  		/* stop the ring */
> >>  		reinit_completion(&rh->op_done);
> >>  		rh_reg_write(RING_CONTROL, rh_reg_read(RING_CONTROL) | RING_CTRL_ABORT);
> >>  		wait_for_completion_timeout(&rh->op_done, HZ);
> >> +		spin_lock_irq(&hci->lock);
> >>  		ring_status = rh_reg_read(RING_STATUS);
> >>  		if (ring_status & RING_STATUS_RUNNING) {
> >>  			/*
> >> @@ -567,8 +586,6 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
> >>  		}
> >>  	}
> >>
> >> -	spin_lock_irq(&hci->lock);
> >> -
> >>  	for (i = 0; i < n; i++) {
> >>  		struct hci_xfer *xfer = xfer_list + i;
> >>  		int idx = xfer->ring_entry;
> >> @@ -604,6 +621,8 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
> >>  	rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE);
> >>  	rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE | RING_CTRL_RUN_STOP);
> >>
> >> +	hci_dma_unblock_enqueue(hci);
> >> +
> >>  	spin_unlock_irq(&hci->lock);
> >>
> >>  	return did_unqueue;
> >> @@ -647,6 +666,8 @@ static void hci_dma_xfer_done(struct i3c_hci *hci, struct hci_rh_data *rh)
> >>  			}
> >>  			if (xfer->completion)
> >>  				complete(xfer->completion);
> >> +			if (RESP_STATUS(resp))
> >> +				hci->enqueue_blocked = true;
> >>  		}
> >>
> >>  		done_ptr = (done_ptr + 1) % rh->xfer_entries;
> >> diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
> >> index f17f43494c1b..d630400ec945 100644
> >> --- a/drivers/i3c/master/mipi-i3c-hci/hci.h
> >> +++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
> >> @@ -54,6 +54,8 @@ struct i3c_hci {
> >>  	struct mutex control_mutex;
> >>  	atomic_t next_cmd_tid;
> >>  	bool irq_inactive;
> >> +	bool enqueue_blocked;
> >> +	wait_queue_head_t enqueue_wait_queue;
> >>  	u32 caps;
> >>  	unsigned int quirks;
> >>  	unsigned int DAT_entries;
> >> --
> >> 2.51.0
> >>
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
