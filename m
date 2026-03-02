Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A04CEEB3629
	for <linux-i3c@archiver.kernel.org>; Mon,  2 Mar 2026 17:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Az9wyqiZcAhTi6kHdSevznnSEfVqlMT/O0Gt/R8+TIs=; b=dVyx5eTsxPmmmC
	nCbN9C6t6gmvDJpMC7wLYZIzfP1Q5dKLpPJ3cw8CFugteZ4RULKYiNHyZJFzCk35hk2T0fZj3y0cn
	QCLtgO7bM9H3D+ndLe9NKeAfEIMTfuP+plYON5Db7ptRv2itOlQ4/+G9qOZSQGMho9sykqPd/So9A
	1BkvOO62sV+RlhFPmZIcizUcaG3sk21o3YSNkkMdKM3AQIXPiNjo+LuVvMPR+Bc61BOJdte7TBHtK
	Hf2iH2kzcsnsXzT2ORfhp7WBqQ+dYG0O29LYKBnBK/0onadr/vWMbcdOQWCTAPG7uTjvB18JaRfYa
	aJst9jVcZdV3nQQGtliw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx7PI-0000000Dcgk-1g1S;
	Mon, 02 Mar 2026 17:50:12 +0000
Received: from mail-francecentralazon11013068.outbound.protection.outlook.com ([40.107.162.68] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx7PF-0000000DcgB-1AYP
	for linux-i3c@lists.infradead.org;
	Mon, 02 Mar 2026 17:50:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cAHa9pN3mBgUDWGYJBSCQf8eTdiWAKoltSk/gjg9H2iJlPqyljTuYDtL4JczOQmbI+Aq/PP49jncIJZ63AADGcAtaXzLjilAZkP8CdyF+7owimIIKg4guYnuXpJr/dqdpLtp9PnWkqkGpfE7lo5xbm/UXBBwJLeTBiEQebP92ZxvdwgU/F1sAhyMxnMTJy6FnI/WMdOlmPGGy0r+v9Jlo/4vbMluoRQj1uSSgWYlMgLRENxDxwYrWryv4hC4vYKSTDA4ISs9AUeqeiBzejqh1hru5jomW9SGfsFEKMGzFPDS8DwcBexUTQ/VU1wHKFzRLe9GXyTrJbQ8lM/tVeodNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QrQwOsO/n7wUo6/37/LOKPFm4enjVMWNO9xm0Ems37w=;
 b=C6g9sk117S5aNowElJRZmKCctbIECCU3wznrPg50Q5PrWCGxIxXaoXtra1ufLjFT4ZRmMKYApcM04MmJ2ufAaEgLYZXqROUcezEPdCmh8WJ+yAXmRe7wvB54xm/iLkm8ORYcfr1Y+EUaHgyRE5ioSy1P4TzipMo2n26Fx4mijgdS4UhdFaQ21k+WQ4luRiQ3QmXTQ7FdT0g2oWFAZfLEwuYav5T8ONvV9cVkWodEsX03EV0XmdI+kq6N8PzzyyNpQ4Iv9dIdTd5gOES+uUJ7OLU805IV6bapJ8ZD6CKFY+lzL0Ra8G+hQ8Cpq1PaADIu51MVzvAIL/EnXXEvTU69rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QrQwOsO/n7wUo6/37/LOKPFm4enjVMWNO9xm0Ems37w=;
 b=CLclqU5rmWLrslViIFoO4qmIv+Ok0APBNMhoftTwMTUwbbM94+KzwD6ughYDLxxE2vyuVoOmxP+sEduJ/4F7cTAVI8YLSOO75rjvUVyRvlx+OJuwZBD/o83ZWvKaaEZN2tnQpAbLNJlVcgJj9yk28XCjn3Qoqy93YnNXpIVLw4vBDCVtoQ9gHoNuhTj3kUwY5AlUjoK9+FQXxBM3FylqtaF1iYxTztS7dddIjGwFY28W0pfM+nfFgwLXl/dwCbqBuO18EYo9BHOqFXQYGwqMi+hoEKCbLWruYJ+LayBVG3VKk5gwBBbKiOr017WkIhUmffqD0DB2U4iTDGBn62pHVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU4PR04MB12327.eurprd04.prod.outlook.com (2603:10a6:10:631::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 17:49:37 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 17:49:37 +0000
Date: Mon, 2 Mar 2026 12:49:32 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH 06/12] i3c: mipi-i3c-hci: Correct RING_CTRL_ABORT
 handling in DMA dequeue
Message-ID: <aaXNrJ9R8ekU45AA@lizhi-Precision-Tower-5810>
References: <20260227141149.184980-1-adrian.hunter@intel.com>
 <20260227141149.184980-7-adrian.hunter@intel.com>
 <aaHFjYAWOlvNkYDQ@lizhi-Precision-Tower-5810>
 <e20c5876-01ba-4153-8317-25e70337144b@intel.com>
Content-Disposition: inline
In-Reply-To: <e20c5876-01ba-4153-8317-25e70337144b@intel.com>
X-ClientProxiedBy: SN1PR12CA0043.namprd12.prod.outlook.com
 (2603:10b6:802:20::14) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU4PR04MB12327:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d63707f-634d-47f1-c2b4-08de78841273
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|19092799006|1800799024|366016|13003099007|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: UPCs4KgttUAy7uMHy0Wp96h0p1t+hHWcP6MaZReh3hDnVrp5L6p5QkfpGBcx8clCUww4uCs4/X+uNNjd3iG3YdR9IXqKGipaz415DRc6BeHMVZeZvOZlzGVLAbAmVWDM51FOlaS1ffU2gamQETSiYYmn+PrBKStObkkFoWvvttbMUStG5nighQdFplGffOdoK5O/WNheRKGa8dmRKJIo4ORQz+9e+n3x04+Ws7VT8wUCp2YbEXUF1Zj4+LIZ6gxGvsoxW+JhSoL/LuHtRvW6il+t1hrxcvMI9qYhCIBs2uKznrjX1UQwXMrQveBVslZGD0LWjav5tB2LeY8n/2ANl4+AB+ksY4moo054yxeyVg/FXoQ5LPlXqlrzVNy8QwzTsCzlGqF35nO12cl9h61pkIriwIrUV5M+PIYrFWe4I7W2hR4ebqJfm6SpUsOu8xf8AFhmWEmSTWO0CbeQLtHiYN7Iq7rLhHJBLt8P6ZmBpyVoWMv/yBdGoM5dwAO4pT1xwOpQ2j7qJeNaXy9PDWqaHYE6tUnDT18f22s+7vVUM845xH4uNZq2j3deBktKGlLYHva4C8azKkOgzWdj6K+DkogczFsmGhUodwGFp0npiVRndUMESEB07a40OaeYK69TdIUlNXdzlxDfF/sVYrIBlft1FMZuSDKc067nRDbtDIQeaEGlBzlWo549f+KVbn3BEUkC4Y4cW9apjfzXu89CpLD39U/510XEAuKaztDy15zTlFIZiuPCGj6woM+uOOmuIq1dEJ5LCi5h+hSalS4Zva9hoSGMatZyx4xjxiHgasQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(19092799006)(1800799024)(366016)(13003099007)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1pxplkgik5KVqlDGeCLdo749DVvdbTr7or7jNrkINldXE+KiBjfXhcInGz3D?=
 =?us-ascii?Q?gQg9VuZ78GwRer1xiXpLiXQE1sXQkTLuNfThvxzeGvad8O/3zG1RpHPrF6bU?=
 =?us-ascii?Q?8vLvxpyxPAVn9dIN0x5bHP6JDB0IHVt0Ko71SvS9T6KTvc5GjpAjIDI/UTVh?=
 =?us-ascii?Q?+3X4nqBRHH/YerJh7Im4GncNu/4O3AVdSgdd8mCA9ZTEnm/rwsiSA0ZCMNNC?=
 =?us-ascii?Q?zw9wRmA8KP3gdOMd6lyNql12LOUfOCv1CyzSWy4FYPtNauaGcEKPqLHl0gB2?=
 =?us-ascii?Q?Fk63jbc3a6SLDJ747JNzjX7w5mTZNmgy8d8voEpQ/CmqAR1qRH8iPQHTEAIN?=
 =?us-ascii?Q?EyeqSsSWcP5PLErTi8oXLTG1CDHjMAHLKF8h7N9Mtq0XG3c0nEyMEbHUx2Lj?=
 =?us-ascii?Q?rYT1TPuyvTfN9je4EFobh3zWZ+/jqnAwr5YW+V9dyH2xxiPnBuml+E5Vlqbi?=
 =?us-ascii?Q?Gp1ZiuHeGCdpvZDBaviPNzZswhKpDivubt6ToeZ0n6K6XibMDnZtzwTbQEg4?=
 =?us-ascii?Q?BXiKm8nN9xNdwk1dYcHFfZQKS5Z1DnffbDxiBoTmBgFyBqYZT30y4rmw6sBo?=
 =?us-ascii?Q?GaQliJHXCstm/9/CiCxMO9bht1fhoPuVHdd6PE8KV60r/ymwT7zWWYheo/QE?=
 =?us-ascii?Q?9DB5+YFEqvPRaCRgzFyLr9FTyTVtNmCZ7QvRTNY0jZVBZ3ShuxBITEi3a42O?=
 =?us-ascii?Q?O3YegsPoq3RuOS/Vc0Pi8RVokdqlZGILbA+ZZcyG+3MPokKSHIPwSfbXGEjE?=
 =?us-ascii?Q?xcdD6FcaKI30rhPhWXcrAzfxVwJ15rTA1NbX0wTgBvI5wYtY/MY0LmKC8ICi?=
 =?us-ascii?Q?awLKjAFumPMxb+fARgkadX0X35G0qXAQuGpmC6hVkZbairIWEo/xgwLTxVlK?=
 =?us-ascii?Q?eXg/ZHb+Rm2wyoHYc2tKfoanb9ZKXnpw0iGyLVL1oKWS/oXxhelyDNPZFQ8Q?=
 =?us-ascii?Q?wv98n9YD9UThje/3qnbrN6L43roccdETiIewrABhLQxTh7dZ0XkiH66vA1Mz?=
 =?us-ascii?Q?UipiPT1D3QArLmpuK9Vlpg/Vz4D1vHz7K619USdUTWGWo+nBpZ8qDt3mERER?=
 =?us-ascii?Q?Se3W9aiWLchwGboTSGBhh9w+sQEZ2/PI9o0dU12PMTjqMU95KqkIhOI/pO6x?=
 =?us-ascii?Q?jcQvIfAQMNykEr9oSxtHKZp9tO9to8MVVmaUlZ0Y/z+Ycd0aJ0TMm6+/OJfc?=
 =?us-ascii?Q?OFY/CnMj9lvVEks/C54UaPb8qQkUyF/sjJlpGL7jJF4X0A1RwSRGlpn+D1GU?=
 =?us-ascii?Q?3rvanMS9OYExFitQdJWD/BhavMzEOA2YO68AVqqoTbsNzXhBBwQSiDeKS7sR?=
 =?us-ascii?Q?8HV9n3qwXonejgkhQTNqz0F+JY+2pZ70KCxg0pF32XGNxhb6hoKey49/chBM?=
 =?us-ascii?Q?hgXRo6h3o91lCbL3zcZHloQc7+PwezwXZ7FjDmKtuWUaZl27/ANPFPj3V1dI?=
 =?us-ascii?Q?EtGcCmrr949rmmgPByReC79IWZSP88hTm4P+b3zewZMwpXj3oLQdQwdh8VJ/?=
 =?us-ascii?Q?PKRLbgZEsSiasQkSabEhuEHlqY38QQ/RoApmjt0ASkEd3CmwQ8sWIJlrbP9Z?=
 =?us-ascii?Q?c1o/TAlu9exghTj5a+5QhUoni5grkPwAGd7WXHtH188tq7Ug3aDtIRTP7d9M?=
 =?us-ascii?Q?EGCcPgPUCowpUSPTRt13IZ/0PIC2S/ZFj6E4KoJziwCwOsK9HEJURbmUEy7S?=
 =?us-ascii?Q?L4Ir4kjaD3KF49fHt288gB47BH72s00MExrDAXwazkvx1k9/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d63707f-634d-47f1-c2b4-08de78841273
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 17:49:37.6062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uiQX7BFdCicfFA7W13nWXyT3XvDba/Sx67Wn9msMHUCv2Vp4N+mKTL42aN2/uV+6x0KiuYRhie8YuovCQ2ClLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB12327
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_095009_339898_12F751EC 
X-CRM114-Status: GOOD (  26.52  )
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

On Mon, Mar 02, 2026 at 10:45:11AM +0200, Adrian Hunter wrote:
> On 27/02/2026 18:25, Frank Li wrote:
> > On Fri, Feb 27, 2026 at 04:11:43PM +0200, Adrian Hunter wrote:
> >> The logic used to abort the DMA ring contains several flaws:
> >>
> >>  1. The driver unconditionally issues a ring abort even when the ring has
> >>     already stopped.
> >>  2. The completion used to wait for abort completion is never
> >>     re-initialized, resulting in incorrect wait behavior.
> >>  3. The abort sequence unintentionally clears RING_CTRL_ENABLE, which
> >>     resets hardware ring pointers and disrupts the controller state.
> >>  4. If the ring is already stopped, the abort operation should be
> >>     considered successful without attempting further action.
> >>
> >> Fix the abort handling by checking whether the ring is running before
> >> issuing an abort, reinitializing the completion when needed, ensuring that
> >> RING_CTRL_ENABLE remains asserted during abort, and treating an already
> >> stopped ring as a successful condition.
> >>
> >> Fixes: 9ad9a52cce282 ("i3c/master: introduce the mipi-i3c-hci driver")
> >> Cc: stable@vger.kernel.org
> >> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> >> ---
> >>  drivers/i3c/master/mipi-i3c-hci/dma.c | 25 ++++++++++++++++---------
> >>  1 file changed, 16 insertions(+), 9 deletions(-)
> >>
> >> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> >> index 8d5f808e03ea..dff96b84479e 100644
> >> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> >> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> >> @@ -550,18 +550,25 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
> >>  	struct hci_rh_data *rh = &rings->headers[xfer_list[0].ring_number];
> >>  	unsigned int i;
> >>  	bool did_unqueue = false;
> >> +	u32 ring_status;
> >>
> >>  	guard(mutex)(&rh->control_mutex);
> >>
> >> -	/* stop the ring */
> >> -	rh_reg_write(RING_CONTROL, RING_CTRL_ABORT);
> >> -	if (wait_for_completion_timeout(&rh->op_done, HZ) == 0) {
> >> -		/*
> >> -		 * We're deep in it if ever this condition is ever met.
> >> -		 * Hardware might still be writing to memory, etc.
> >> -		 */
> >> -		dev_crit(&hci->master.dev, "unable to abort the ring\n");
> >> -		WARN_ON(1);
> >> +	ring_status = rh_reg_read(RING_STATUS);
> >> +	if (ring_status & RING_STATUS_RUNNING) {
> >> +		/* stop the ring */
> >> +		reinit_completion(&rh->op_done);
> >> +		rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE | RING_CTRL_ABORT);
> >> +		wait_for_completion_timeout(&rh->op_done, HZ);
> >> +		ring_status = rh_reg_read(RING_STATUS);
> >> +		if (ring_status & RING_STATUS_RUNNING) {
> >
> > Do you need readl_poll_timeout() here to make sure hardware actual stopped?
>
> No the completion already waits for op_done

Okay, suppose check return value of wait_for_completion_timeout().  read
register also work.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

Frank
>
> >
> > Frank
> >
> >> +			/*
> >> +			 * We're deep in it if ever this condition is ever met.
> >> +			 * Hardware might still be writing to memory, etc.
> >> +			 */
> >> +			dev_crit(&hci->master.dev, "unable to abort the ring\n");
> >> +			WARN_ON(1);
> >> +		}
> >>  	}
> >>
> >>  	spin_lock_irq(&rh->lock);
> >> --
> >> 2.51.0
> >>
> >>
> >> --
> >> linux-i3c mailing list
> >> linux-i3c@lists.infradead.org
> >> http://lists.infradead.org/mailman/listinfo/linux-i3c
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
