Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A57F8E4A7
	for <linux-i3c@archiver.kernel.org>; Fri, 17 Apr 2026 06:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r1Ximbekqt2XrSQWqnqPrTBn6M2Jr3dwF1Kv19vvP70=; b=P7TwLzNCqJrMIQ
	ff1HAMf44/fGldIPAPt6glhL65ASL4dFEHiimAxJRefxYs/NDVtcpngD8Mx9hgJh/OzkZGTQyHL+n
	TgcWu+zJvC+9DJL8I0rHL+2LxwP/SawTQBuiYyY0UoU+wQDycdULhWBTSN3tdlGsFyW8c0yQT0OgG
	ld05/GGI7XvRCSKslTnuxR6P/ZP+P0mmu73TDebfH52Np93Fp+1aB9rqvKUx1ogk3wb9NZhCPbWpP
	BpXecWMzP7shR70jlUujC6FUoAu6GEWI1D0p6i7KCwkCZF1ko3Q9+Yvmf9m0+pp2WLZXVcPGBzTgc
	dKE+hMUTj2DKTfNeJXog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDd8B-00000003Z0s-1bjL;
	Fri, 17 Apr 2026 06:56:47 +0000
Received: from mail-norwayeastazon11013027.outbound.protection.outlook.com ([40.107.159.27] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDd88-00000003Z0W-3Kyp
	for linux-i3c@lists.infradead.org;
	Fri, 17 Apr 2026 06:56:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yqimv5ogJhLjkxZU8VEOkpudkUmIfSaUIINj8cun/Ux/Wyq7+VE9WEzGJEH1isHMHikBObfWLdfjO319qsnE8NEMi0/SbCmKtfJa+n2oMWefeKzB6eeZGl+7qDntW7Yx+bQ/7D4e4hVJOu7G07ttNrtGTNEgeqcUis+HUh97/vWj2/SvFfzfykG9G4O1yYNJ2/YVWqHryVHFltAHePFk05o0b2rUhqaezSXKtyScRZs1MmJO0oMLPME/NP745LBgWmcJDI1rVUY8TNLY8QtPsP0wgcRToCbTrU7997krxqOXKBZ4ggfr1DMccHbg8uQoskI1DT/dBoDKoBttYxiQbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4aJj8cXmzV5ASmRzYqU2OAs+GgFYGk5E2EOBoQda2b4=;
 b=ZwXG/OaHvUsaCxR8/cqwYxn2Q/cYMMTuhtUAc5+sD2ulDyd1s4ChzFg1pO69OlFQUox+Jq+e9PSGHno6E3TBdLCw9IiXK0Y1IHIe9EHFQwfKHXcmYpo6U/5S5ZA/MEs/+TtRekTIQFLLuZfcREhgVuRqOPfLpDE/GdHfKHTdMTo548z+K+DLaLEnKYiP5fLVFOEpwa21I4ET2NZ4DGqB1MisxC82JwZFtqrFsm4BmgiMdRrzsPyMRLqMWNRh9yo32E1FNtaAYuwHl2t1ncnzWuaOZpzXUOkUgvk4TdzQHz9j3BgHWfmbzkFE4PbbnxEVBTPPIEa6KOpRpvzHrs28UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4aJj8cXmzV5ASmRzYqU2OAs+GgFYGk5E2EOBoQda2b4=;
 b=TzV1lILHrwL8+RvkIOL6OEo2bsJ+1mNEdCg6jU6iOcr+rJ/FS9+Fa8gjOTKs1wT5zRoIJzqW07bICIO/t7QWqZZHDEJGduWXngu+V9KOvFwHXsqECcGRw9Fn1EOpbw0SKVW16Ngsy5wqDgl7BrfToPJTZselEob2zkEnF6/7K/FG5BdVkI4ebCU5i8WQ02lG0orpBpmzpqNS4CkYc3Z4+ValjPt8BwSZDJz6P9e65Ei1IlyfL5BOqC58sHDfy6vwZteRNILgMJQ6+LPtYSNEgYvwq+CY2+yGjz3VThRWvgsGjTq5QBXNcSArUw9b8I80siPM4d01EIgdkEFqdwLSRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB10949.eurprd04.prod.outlook.com (2603:10a6:800:26c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 06:56:36 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 06:56:36 +0000
Date: Fri, 17 Apr 2026 02:56:29 -0400
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/16] i3c: mipi-i3c-hci: Prevent DMA enqueue while ring
 is aborting or in error
Message-ID: <aeHZnUV0QlGHYlVA@lizhi-Precision-Tower-5810>
References: <20260416175704.41217-1-adrian.hunter@intel.com>
 <20260416175704.41217-4-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260416175704.41217-4-adrian.hunter@intel.com>
X-ClientProxiedBy: BY3PR04CA0022.namprd04.prod.outlook.com
 (2603:10b6:a03:217::27) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI0PR04MB10949:EE_
X-MS-Office365-Filtering-Correlation-Id: bfa8fdc8-c1b2-4b13-405c-08de9c4e77cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|52116014|19092799006|1800799024|56012099003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 4WAyiEn8KxTrNvcOW+x+X9GqKIO0Ra/eEFk7n0hMyRGqiexFNV4L/lL7CW2U9X5p9QJ8RTTgUsZfwUsrNOpN8s0vpYa5K4AuUQhcN5tIcagC5F0xy8dNAIXUkG6VlcChLBSadZFHQb6GQfIVetvPxEXCfHWWTdYqJhiUWyVX4uNG9Hmh7g/LjNInka2j/RUSZf6uFYNnfRwxs1tDGvRBoTdiMRC8+eif+l3ZdrSjKgwQ7ZCzaGD8rVe1TmRA1+yWd9kHmKKtbuQrCe00pIRLj7m06MlG/pzkUlbW42xJ7z0CQ18q8soEmPg3m5ul/bCYg6DJKZZC2bN1th0XmbvbHWPplp7mj4RVALTWx5VWq9Ej0BS/pv4xyej+B9ftFqndhczr9XKXRq0lw19y77tG3CcOjuahMzpy5KVjmEe1RCMh3gWGV8k69++AGxsyh/+N81dIbcLIYR1OnaRZaG+y6gCFQ/RqMN1wTLl/th3pK8esR3Vsw6a7hxLhzvlFfwzUUC5AlJc8sHOaiaok9GDenSOPNxFPw3BYqbDjj2bFN1xvx1W9S2NKCbRaQnjT+Q17rzFVfmC0/3vqWpKWqgvlGDW+2nTfk0V5EsW8ccC1Ktl4idZBIUtm/+iXgH04uGkBHPEJe2wihgo94xDFE3+qO+lFGFHt2hmgP9ocxXBTrjBzR0cRGaJ8AZESxJQ86BRsddtlP+YJMU8O0zfAnQeEaIfoFrAvpMn+m5Gp4Xx9zeP8jUWMBJ+17fXnCRhpsji7DqXtsO0iFyztZqjSde01mXPA18kGJYQvKw88TFYRSU4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(19092799006)(1800799024)(56012099003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q+UtzXUQkVcUg9mfOgrrE3yrWKkB8+oDinnt7hq1AMiMRhLfk6n0kz9tqVIl?=
 =?us-ascii?Q?mI2aT6JyEf8Are0ooCJkFSV1130Apq0I9i5UlpCGTTjt3YjmT1dxW/0RQjdn?=
 =?us-ascii?Q?5oI1CZ3DZUDd27ht09zcKtDs21qLKWp0yp7aaCdJOVCRVezb4la1M4+iv598?=
 =?us-ascii?Q?Mfbi9S/QGR8yJtzPEZ47D2PB4jPsqe9TGhEV3J29VnmRipouqObHa6WCOQh1?=
 =?us-ascii?Q?gHKSwXyarEv6fyjZ6IznbK8KZNH89sY4CHjK5FRyEPjaVxp+yQtUfvTLw7hR?=
 =?us-ascii?Q?mkFgTXDVzakL5HtFVCsIyuQAwdkl7Z2FEgkU2fBVpNRlWhj2ZsYXCbHkQhXq?=
 =?us-ascii?Q?6hBQPfFQehbBtToBKAnrSX3q3SauzRAcCoVwjXJho/ZaS2rSclsdOkGkRlK1?=
 =?us-ascii?Q?oTCyhoIrUk8fAtkP1TrxRiMnRP2PJKTFEMQD6EEZBaNxQIUKhD7s/HcKMV/N?=
 =?us-ascii?Q?kWYhYPQT5/eB72me/1/h6PWGmt4GM5haLIbwhOekCZnsflaZTY6TiQ136LJr?=
 =?us-ascii?Q?fOX3Ek6ijSqew0HxQ2rjRwdU5RFLwKKo/+ufUtT1dIaVKa5m3d+TA2Kk0m9Z?=
 =?us-ascii?Q?dnVOJOdS9GLgEZylXI+56fXlIbwM3D2Fd9c/hR2ocl7Iisx+xzK6+FtEB05y?=
 =?us-ascii?Q?3EZ48Np1asTOrFAPn7vS1JQW60FdEy5WX/YUtokuDGBEtz8/r4v8YoO1/MR9?=
 =?us-ascii?Q?UVqqLVUFX0VLhYV5Ng4DBpz0BbVe0kHCEXI5V8XYGmkSPLMguCCMbEORmlXX?=
 =?us-ascii?Q?DgNlog5/mVT5NJK+d8SXD2VtDbv/cQoeH9r1lS+YWZuvinyZxKuoz6tiiYas?=
 =?us-ascii?Q?IuaM1au6UoStfYw/UKMAstZG5+MRkwVvctPfA4bmOA5njx+5Bu1VqtmqCrMz?=
 =?us-ascii?Q?uaZKdcGZ/A+WeOySD2GyCuj/QxuVN5KKkNNpy//RC0en3FiC/Ga5bv8Ip8nI?=
 =?us-ascii?Q?3ELTiE/HJmTv6ZO2H7Mp5j1HnTp6OTnI2cz8Ex079HPn6yalVIwY2CDK7tFZ?=
 =?us-ascii?Q?g2YFr33TFZptNrmHtdoYDhPjO8WThDIS1wl5sLVPD5ngxUIKqxi1IKv7rGBS?=
 =?us-ascii?Q?NQOozRvwNpViHxFm+bJqlfZsW/SMiC4ssRbBCXlXXto8A6ZoUYNTmyom3WRG?=
 =?us-ascii?Q?kEZMotI00srsHSHNTJrm0ILYivv0K4T5U/+nbkZFLhMC+6/nmWhUcHwYKTll?=
 =?us-ascii?Q?devTGnrokWK+n7luoorTuKDI2m6LkNDiq7mr1FrgcOJeJ+CkPavY8nU+iT2S?=
 =?us-ascii?Q?GvtIac6ynRI8TSDCOmJf7koYSA1X4dnsItP82IB3RHrR5GDBNm9UnerxT5HZ?=
 =?us-ascii?Q?7xZWfFIMXbp+ilqx+Ta0j8/bXpHxnnek4G39GJ7qkvmm6OjRu3Oj4Z0Jaliq?=
 =?us-ascii?Q?FM+QYWDb/sChYYnpKcWq2lsHEi3gfvdBS6i/Z3a6e00K8nSyJoQ916M8k5bp?=
 =?us-ascii?Q?fJFDjj9uuu5L4LzqXnW+oD4gM5QYyxtXg8mnHvhyULlHkQmxu2kUzJxwE7On?=
 =?us-ascii?Q?My8rsPxZzQbiDBBj99KRdNQ3bIk+PmA2Cb0iWLO27+i7jxqFXA32WNcvn2lP?=
 =?us-ascii?Q?2eJejsUw+IyIzPTqb2Io3NyDQSEOXoedg7lGFGYzDlz5yd9tiHQQ89Nwoe2m?=
 =?us-ascii?Q?Bz857q80kDUbjTVRCgiVKfbxtplMq7dCjFx1qxU6FSpdjTRNAgZZz4lMf9Ly?=
 =?us-ascii?Q?oPOOnNcavSlMt4+By4ZGSAcR9PZBjO8Qo4Vl4kXMkRSoP9f30vEcJHheX6aa?=
 =?us-ascii?Q?ncR6pPo4Ag=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfa8fdc8-c1b2-4b13-405c-08de9c4e77cb
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 06:56:36.5948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gN9Q50u/GcfmuvL0zmRIw21JeKjhlQbXxNcgwO0mnDaxlclU5SkWUc8fsxce16dRsvvUzKbpFxqRXxnBBYMrZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10949
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_235644_862890_CA171131 
X-CRM114-Status: GOOD (  25.75  )
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

On Thu, Apr 16, 2026 at 08:56:51PM +0300, Adrian Hunter wrote:
> Block the DMA enqueue path while a Ring abort is in progress or after an
> error condition has been detected.
>
> Previously, new transfers could be enqueued while the DMA Ring was being
> aborted or while error handling was underway. This allowed enqueue and
> error-recovery paths to run concurrently, potentially interfering with
> each other and corrupting Ring state.

why not hold lock at abort and error handler? does it take quite long time
to do that?

Frank
>
> Introduce explicit enqueue blocking and a wait queue to serialize access:
> enqueue operations now wait until abort or error handling has completed
> before proceeding. Enqueue is unblocked once the Ring is safely restarted.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
>  drivers/i3c/master/mipi-i3c-hci/core.c |  1 +
>  drivers/i3c/master/mipi-i3c-hci/dma.c  | 25 +++++++++++++++++++++++--
>  drivers/i3c/master/mipi-i3c-hci/hci.h  |  2 ++
>  3 files changed, 26 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index bb8f2d830b0d..5e1bc6d819cf 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -976,6 +976,7 @@ static int i3c_hci_probe(struct platform_device *pdev)
>
>  	spin_lock_init(&hci->lock);
>  	mutex_init(&hci->control_mutex);
> +	init_waitqueue_head(&hci->enqueue_wait_queue);
>
>  	/*
>  	 * Multi-bus instances share the same MMIO address range, but not
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> index 4cd32e3afa7b..314635e6e190 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> @@ -484,6 +484,12 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
>
>  	spin_lock_irq(&hci->lock);
>
> +	while (unlikely(hci->enqueue_blocked)) {
> +		spin_unlock_irq(&hci->lock);
> +		wait_event(hci->enqueue_wait_queue, !READ_ONCE(hci->enqueue_blocked));
> +		spin_lock_irq(&hci->lock);
> +	}
> +
>  	if (n > rh->xfer_space) {
>  		spin_unlock_irq(&hci->lock);
>  		hci_dma_unmap_xfer(hci, xfer_list, n);
> @@ -539,6 +545,14 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
>  	return 0;
>  }
>
> +static void hci_dma_unblock_enqueue(struct i3c_hci *hci)
> +{
> +	if (hci->enqueue_blocked) {
> +		hci->enqueue_blocked = false;
> +		wake_up_all(&hci->enqueue_wait_queue);
> +	}
> +}
> +
>  static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
>  				 struct hci_xfer *xfer_list, int n)
>  {
> @@ -550,12 +564,17 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
>
>  	guard(mutex)(&hci->control_mutex);
>
> +	spin_lock_irq(&hci->lock);
> +
>  	ring_status = rh_reg_read(RING_STATUS);
>  	if (ring_status & RING_STATUS_RUNNING) {
> +		hci->enqueue_blocked = true;
> +		spin_unlock_irq(&hci->lock);
>  		/* stop the ring */
>  		reinit_completion(&rh->op_done);
>  		rh_reg_write(RING_CONTROL, rh_reg_read(RING_CONTROL) | RING_CTRL_ABORT);
>  		wait_for_completion_timeout(&rh->op_done, HZ);
> +		spin_lock_irq(&hci->lock);
>  		ring_status = rh_reg_read(RING_STATUS);
>  		if (ring_status & RING_STATUS_RUNNING) {
>  			/*
> @@ -567,8 +586,6 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
>  		}
>  	}
>
> -	spin_lock_irq(&hci->lock);
> -
>  	for (i = 0; i < n; i++) {
>  		struct hci_xfer *xfer = xfer_list + i;
>  		int idx = xfer->ring_entry;
> @@ -604,6 +621,8 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
>  	rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE);
>  	rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE | RING_CTRL_RUN_STOP);
>
> +	hci_dma_unblock_enqueue(hci);
> +
>  	spin_unlock_irq(&hci->lock);
>
>  	return did_unqueue;
> @@ -647,6 +666,8 @@ static void hci_dma_xfer_done(struct i3c_hci *hci, struct hci_rh_data *rh)
>  			}
>  			if (xfer->completion)
>  				complete(xfer->completion);
> +			if (RESP_STATUS(resp))
> +				hci->enqueue_blocked = true;
>  		}
>
>  		done_ptr = (done_ptr + 1) % rh->xfer_entries;
> diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
> index f17f43494c1b..d630400ec945 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/hci.h
> +++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
> @@ -54,6 +54,8 @@ struct i3c_hci {
>  	struct mutex control_mutex;
>  	atomic_t next_cmd_tid;
>  	bool irq_inactive;
> +	bool enqueue_blocked;
> +	wait_queue_head_t enqueue_wait_queue;
>  	u32 caps;
>  	unsigned int quirks;
>  	unsigned int DAT_entries;
> --
> 2.51.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
