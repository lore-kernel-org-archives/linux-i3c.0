Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C5AFCD4F24
	for <linux-i3c@archiver.kernel.org>; Tue, 12 May 2026 16:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5G8LxJsGnbjtJwN36wv+P6bVMhpOJafj3YlSsasAfco=; b=D7626x2NeElsEW
	4NHqR08H5bC/8ZKwdqavX/daLbY0BK+0KrvezZEfOL1/GAzHeL1h+Y3JHKhD5JIWzWC9BcXh5ZF30
	y/yGLYKM10aJVHnY1wgIxEy088BU0Uzi3JSB7Igea1g69GRLPrkX2Y4TE6PvdwpuZ/qLON2BmMLZU
	so0c7M3n2pXt8k6kn2Pk/QrAIphizI/o3U77fyEhEBWgwMSqwX/PcDQWLZ0IqVdJ0/S9SBMY/vfI2
	bj7M2tIUp5Uet8YUoXarFr4DavX5mw59H4emkXxCfgHE4ImszlqVMaFk16B0rFt+Wk/Bes8klJK3I
	omU8pC1hH0h7t21snArQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMqJa-0000000HRAp-0I3v;
	Tue, 12 May 2026 16:50:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMqJZ-0000000HRAQ-0UHE
	for linux-i3c@bombadil.infradead.org;
	Tue, 12 May 2026 16:50:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QM/9H1aA+cAybjpNBiS3Eik+9eQ8bFBCvdfDboWzUNU=; b=XMlS/TviC6kojihQQM1X7bpLRT
	yxYkBb72aQ10c2pBu7+jLtvBdm9M8es3oAQ7DRpSWPAHBoUWHoROKWC9sz8MO2Cod9sVtE2w4XSCl
	RkbW5GlxJRs9DHbpbmcwSWpwrWxfN8Q2E7cRUDZ/YuDTtU9DMQ1vRryR4abaBDhC6AO6Z1xqTj7eU
	A8Ew7ehf06dm8+X3sb09rJAqs7hYhc9zd6Lf4vyQw/Ryq64ZNvgm8HbN+fzf/gnS4QpA+hNkD054u
	ZTP+pb/5/U2MonuZp+LN0Ze8kiqhRA40Rdzck5nkOU2pBU/6kkRL7glvkASocPipqBtbB3i6nLOfn
	DNoQPr7A==;
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMqJV-0000000FOnW-46xa
	for linux-i3c@lists.infradead.org;
	Tue, 12 May 2026 16:50:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tlHea/WP3IVDYcsVjgAqHcjHHQqfl/QyiTVIY/TjZtesfzOQdlcnPXtupRDZA9C+alxVdojcMJMJBg87rRtShsKt2tgGslQP1QorMnBAofUb+jrIsDTSGHq9UPEMR0mbttlAutT0d4pyno5GJ5vOaK3lxXjcfxvQQVY+GPJC5GZLXLvDIrpXcvdWhWiarfoVhn0iK0RzD4fi9KmkDNjCYvlqmJrWeD+AxsSWaKeqEZug41mBRcOmF/7814URjW0XWt9O/ZvUqriJIdlwEEnkJWcizRlxhAj6chqscjxEp3PsrisxFJ9v3UbraxPcb4zfKjzF/H+x9z2WsncY/6I0yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QM/9H1aA+cAybjpNBiS3Eik+9eQ8bFBCvdfDboWzUNU=;
 b=M+o1Z+uI/8XXNbOxPoP/BbnxcGpjMOLON2xV/EH9im2+3TdJT0mOuI++4g+JM6Bs0od/vOBwuCki2MGL9DCjhedGbHIsKolsCTGTDCL8xgLl8I3Gn+H6e955cywNZHcLceE5MQ/vHxVTdapmFIuA9f/oQ3U0tmsRc5UeW1Ad1mUej9ZbrCGhFMda7Ebh97XPK53qxa4Zqu0GkdaFEu6NrVYIXotDIn/IFXrmLBXHu7KPB1MRvAkJNSQnmNF6K556Y5/NcnxOAiOBxgZWSPoi1A25019tsHpuD1F/4HracmWdxl9DoKU0WasR6udcEQf7Hzkr7QBbYJYavUaEBH+weA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QM/9H1aA+cAybjpNBiS3Eik+9eQ8bFBCvdfDboWzUNU=;
 b=fiYPrOBtHGzAcpi0iRIJvGmMq0aMh1Ju4NUAAHhoWu5dmNFoXP28vsuc+y8pB6xSNDxVy3xawR8LlxhUufOrQ7J3OnFDIfyqlHoTk1XQGVYJxj7YCfQw0/3JAn1QpGDSU/64FCXQA1WcnExotTmO1x5rMSSAen/lgvnmVbAD9UT5AYnnr5ZRLA0wJfIxi1kR5opS6PaT02c+VrSriahOczl2cMepxIbCyF94m3H+QW+mLd7rZrWXY8R4gZ0tca5UXDUN2wwTUvxl6VnyjZ9ej6fzGq0s3noFK/zmA2QaZKkFxjMhtPvpdhsVyD0aGeQEH6/WHhkqsXzBKThYA1/qrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU2PR04MB9195.eurprd04.prod.outlook.com (2603:10a6:10:2fa::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 16:50:30 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 16:50:30 +0000
Date: Tue, 12 May 2026 12:50:25 -0400
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 08/16] i3c: mipi-i3c-hci: Avoid restarting DMA ring
 after aborting wrong transfer
Message-ID: <agNaUSIjMc252Jj8@lizhi-Precision-Tower-5810>
References: <20260504113352.38490-1-adrian.hunter@intel.com>
 <20260504113352.38490-9-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260504113352.38490-9-adrian.hunter@intel.com>
X-ClientProxiedBy: SA1P222CA0123.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c5::10) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU2PR04MB9195:EE_
X-MS-Office365-Filtering-Correlation-Id: 908bc912-f57e-4de4-79be-08deb04693c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|52116014|38350700014|11063799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Ly3mNMIdPIQoS2MV+PqIA0ILK6ggC8iVi48W9YbRLAdYYVt/rpR/U34eqa24HQ2NhijmCIXSyKKqFfcEwd264St4fYyAG6v/Mi/wViX0ht+KhyKc1YQZXOVoqot9qhdYBJlT3zX/yjb5AsHpqneUwVO71HwpH4+rDrEcZrqKOVQGUKl1l0eT6qA/97S5523A/Yo1vuVCOVUQpKH8rUgBODCGlE1LMBKurT66qNN7VF+pmmHc1XTp31itEOt0YN9LASJ2rtz2AyCXxWQb2p6D/Mjxx6umERUEuCQf+322fGxcXm9VrpIeqmARBESwGrfGj2XD+5eiFfisLcW08K5mcF63PRQd8DcXfLNsxgFbQh+GM1HVhEbPQbumgFXbnI62bJ2M+8aW4bMVRbSymda1rXJWCdSr+tPSnSdqwPg+vj0YPWHJZ6t0lUfiV3iPjMeino6l+CqeIk2VyIDn6aSS5Oz0Eq9dBi1tmHdPeZCfZPkGQZB0cl6jGS21h9i/o2uWkaXpvJ3tbUdl3/j7xhbqtRXIa6WrZRY3TI99NN07c5C+oAPKUl9UUFO8pZQbgiZktM0cBiiC5yG3vgWY1bCBESPKVF9R71GO3JqSvcAgUBgHMLQbts+tQlyFIQohfqwAPG83/ayViHlrbJiOTP5yHI1s8zM224ThvnCv9muAqVuDCDaIFfkehPrUbs+C6knm3ni6yOjt6dI9iUb6ICuSiiGNs/BIcjUnn3TaMamokGf0Vn1R54tQrdIQCOROdHM4
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(52116014)(38350700014)(11063799003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AYkREWOSYMnNbFCZMMgB2pA2D2gDKu2GwuU4vxB5BTNI1HXXUXpK6vKR09v/?=
 =?us-ascii?Q?bYqP6n1d2uMIXT108AD3fGoYo1CGr7oM2Pj6JKfPsDpNPVnWSyELlJUDPgZG?=
 =?us-ascii?Q?TAflq+SykxUTeygsSNjsyhglJ9iTWYYcXkNsjSObDsJ7v/aiEbmtRh5uaIzp?=
 =?us-ascii?Q?H2zCXcsDnLFcgxZvhAKMVyhrWO3PFFjT+T7m4zCvCIkYvf5WMEcm56ZsrcxD?=
 =?us-ascii?Q?9opBJcBrR294tZ5YoZtvpq+Qizb0LmL9smeZFXzYIfqjeN2buXwPWlV8XEaG?=
 =?us-ascii?Q?w+JhSHXUJllb2FJ6Zb33wuSZPhCt1QQM0ONJIbrAsuo9s8FPkmc294mB4ksv?=
 =?us-ascii?Q?fvs/53/GN4voW8QteoSp3hXQLmD1XfC1V3NWubzWizxpGtFQUi+qqbaZe2uI?=
 =?us-ascii?Q?ZIZ6BIP50zT7Wh6yg5hF5V9YJoE9AA0tomZZPcwcEEYDZoW9/K+s5rdy4mGS?=
 =?us-ascii?Q?ruS79hAduY4Md6/FBHYSOh5tS+Ai9G+Mez4qkXBj7pnGJY6rWDRp3M7/k6eK?=
 =?us-ascii?Q?jQJFbUH6mtcRRm1bIrs5Hclhpawl+rJqmrArinVf9Gq2jpSFTzbzFon0gpHD?=
 =?us-ascii?Q?FmYVBQDHaTVV+uUHUK+Uqf2mX2kJJv5gb77RNfDUj3l+yiYjNTATcRTvsYjE?=
 =?us-ascii?Q?kP8CeyAzbNLCTf4nK+2RiVVwka+A55kFhhifUl0+DGO5kjNmXh31o7/+QJ+x?=
 =?us-ascii?Q?FNBZm25ezhXgQdTVQvATsOCdLhC4kmvlMDjltvWBsTclhI1RrxiwGxEtUZCp?=
 =?us-ascii?Q?FDNQTkIKSneEaLmAFO91Xk3qmWZEPHotuzEtenEu3MZqg9OALoo/kraDWftN?=
 =?us-ascii?Q?ojMp0KJZbM+MFkmjYRXJNx9PMZW5dkmebxeZc9aeuEu7B9UcZpJ69m2PFj7p?=
 =?us-ascii?Q?gxNnDIs78A1vzkMxcbFPkcB+ukWZMLkJE5WnSgtHRFBPxcoPwn14e3QbIW+/?=
 =?us-ascii?Q?zaIlMWzt4CQS7tTQXkW9tov0FLQW3Aji/AGT9i0RLt6lELqQ7NSVuuSlmPVf?=
 =?us-ascii?Q?7WgmtLasyfHjtK+RLFtstrZfGcEFP66yM3QvWsq5QCoTf+0pq1uXUuci0HCt?=
 =?us-ascii?Q?iDb9P+anNzZpp6r+hdq4HDN0dsOSnttX45zvOgauChH6PCxnIwuZKo52n8+E?=
 =?us-ascii?Q?YI+ni03fIJAPNOVxZPS7K0xAu+oOE34Twl8tt616Y3Hhk93THLW0KiCE9s8V?=
 =?us-ascii?Q?H7KZtV8Jen7gxp04X9nuqWCuFVXLCwG42AEwFltCUBwJzZZE9gPtgVxpmJVE?=
 =?us-ascii?Q?zTEv97NQNz/ZsUVDTxQtC9eTC69SApTGTH97CnY9RIOnCsuFpar5gmnTOfmi?=
 =?us-ascii?Q?YiD8M63UShkfKvkWSwvKQvBA/OPRYBDLfjapB6DxTWEZz3kARC0ynWOqs+JB?=
 =?us-ascii?Q?vua431YeY9u2+WJUVWSyN6dt5FJACwFC5ajFdWr4p0GMPJwreiHKuywYZB3N?=
 =?us-ascii?Q?hUJ3/UlFEa8DpeRN0jEE5xy+nRGd1upV5UeevB+M8ZEH+vbN5wtIbr7e7VtH?=
 =?us-ascii?Q?r0oL6+G4sgOT4W2KdU1U3sUBiQZRNYdzmszAj7oF8tRY4BR3E5j2VDXoZtUH?=
 =?us-ascii?Q?miQ2VtxCfY6l8lfKMt158Nki/685UQ68Q0vDIvDU6CFX850xp/6rA0UTDlgT?=
 =?us-ascii?Q?wDNI2NdNnWaQUYKd8hk/CiA+RikmoIdRFCPh+axnj6Kn7dMyAk0f1y/vXUUH?=
 =?us-ascii?Q?aM5+/H7CN4UivXvzn5uBN8Gh4WzDf9bPc/ChbxDb3BRF8/3G?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 908bc912-f57e-4de4-79be-08deb04693c5
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 16:50:30.7808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x1BluSgWdXRb6yJlL4lrvNRNqlSde6qT4DqMyefcL1YVN2JVjW9UfaUsxDB4LVkW6kVc5NoGl+MVCZ8SPJj8ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9195
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_175034_343959_34B7BF3D 
X-CRM114-Status: GOOD (  29.05  )
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

On Mon, May 04, 2026 at 02:33:44PM +0300, Adrian Hunter wrote:
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
>
>
> Changes in V3:
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
> index 899fdf6555a8..268f54b32101 100644
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

Is it possible to use auto cleanup to handle lock()?

Frank
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
