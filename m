Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1977EFEFB6E
	for <linux-i3c@archiver.kernel.org>; Fri, 27 Feb 2026 16:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j10hIw+qMNsz0SmuA9fiGPVXJzeYA1XY7gnQ1bCbd30=; b=Y0irFpm9OuVjNc
	d3Yg8zsriap5RFIFoxso0wkaDhbY2NTkXzWJ/t19HhuWHr1VZOoUKxPeUCOZKIhfXU+UkeZr2ElpX
	g33GqumZC9Nphvx2QIkxgdH/etSrJTtwlfdyTy0U7bSFtPDnpJ949CnG6taCxXuusEiiq6TocOHWh
	IOLDZYGYRKP1P4WUQRUU6WiOTb5iRfv+BNBDZQUG4cvxtmHwCWi6LpKDEaJ7/yRi4awb1Ttd4+9/F
	kmiyV5UFY3GVJfNa4QNOqaarSbLoSlojSTtbKlpsf8Cbt8mz76SfukymWvHyApvm2bdV6KBTrTkBa
	E5q4cIGcQiAsc/krYyyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw0Yh-00000008itc-17i2;
	Fri, 27 Feb 2026 16:19:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw0Ye-00000008itH-2lYW
	for linux-i3c@bombadil.infradead.org;
	Fri, 27 Feb 2026 16:19:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JEoBsVfaw1MiV1GUxXlnRCxCiOhFIYEViq7/QclJfxI=; b=QdEUMt04+q8MGEHIXpcFXUzszo
	NWpYSl69SDQrpOddYxDM8DJPg3gz/IYP2y+BYVjzzTbevAz4ukmftd6xtdA+SeBNLZonc+7Mio3NV
	KOPA22TLA6A/Re9R0p5seKNMuKDzAAIJaQWqgjY+bHgLBWPHg7iLBUtN+3ii12+5Cr8VrQsqPj4WR
	aSDEj5yVH+49EVAX2crWzd74xkWni1p9WNxohs26hq0JopPXrR2xwi7qsLJ9p0y/jv0s6T2ucSjMw
	fEvfvqxocWKhmjnvipRsaqjAgf8Cu2pw4dpYyNWICV/jPMWnY40e/+6XartuQODxG5FEI99Dz9Lsq
	Re9YmFIQ==;
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw0YZ-0000000DU4k-3PJp
	for linux-i3c@lists.infradead.org;
	Fri, 27 Feb 2026 16:19:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s+nbbwDJGrvE31lLdI4b076T81fxkCpORZWjkEfj5YpDuruwqfwd90QRWuCeZf7RutUnXTgqPKbr5FfudSXJ5z8pN1nYb6tlV81BjZmNMtlcMFQ86Vzqp3D0ZupcmYY87SapdkTP3kaR3eOKpGUMwQH4ery8MRrb1ROfGTvAGsVEDKP7CuQF6AmXnQa0LKknL7/fgNlopoSi750H+uKEc4860yimZqSzlsqEHD4xmOIuoItVEuOnKrctFNxwGbzVsmUo4h7iy5+S/3j66h6cbHC7JipNDqgel0UC+0xOgy1/8s2uowq3P+YCvwJ5G91Dqk/THeD7dFBu0QX7R604WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JEoBsVfaw1MiV1GUxXlnRCxCiOhFIYEViq7/QclJfxI=;
 b=pFXJfkL55S7MTC6gwI+aNXl8C6sjNgqTB1eg8UG+QRGRm2nE7sftMwcj/azs0GG5rUomOt709FdpYh6oEILsd/WH50is6g88rW6TlL8HpCExnRK+j857CUhmjFeObPBsqdxEdcsjiUJZhIkFQOs+U86IuUrDsvEqP4D+zDBnlKV6Jhjx6nxyTC2KT29zCxxH+ufRCKFiLRDskwkGCF787CkmCScCpz+GHFOMF8+KxHpcpLEFl5FGDlarXxPNCvinYsdXhBoKlhHT7L/xFHPSYjFbkE+NyPvD0ZAJ1+Wjfpa06IUbFkfv069y16vnvzL8AIV5GJU+UTeiXOiSjGkA+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JEoBsVfaw1MiV1GUxXlnRCxCiOhFIYEViq7/QclJfxI=;
 b=SqeesOxyNU/YiGombF+MimDk7nEr+ablCD8S58oE6hAk/Pzlnop3BLyFfcr3y4Kjml+rjSWsGcl/y7BtsQik6fpuatmBoy1+SNmY0mHSVP3RyPU4ucCi2J84b7uT0DAsbYwcccukUIxL/o4crpsP7LTcjz8Jjq4qARKpQaTj2r7Dmb+omrom8wQ4gfurPhUmDyPBxpNKJDNCcubUsHON+lGIttXpgoTXTqze5YFtRswKlvAQKWS3WLjvSQAubi7nSJlw8NVaEos3uxKrINHOEt0woBG8T00NLedgDaj2Vhuj3BLV03HdSnLSNA6miTgBmbfXfvhsfn01GUfzX0UKpw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by DUZPR04MB9898.eurprd04.prod.outlook.com (2603:10a6:10:4d2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Fri, 27 Feb
 2026 16:18:40 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 16:18:39 +0000
Date: Fri, 27 Feb 2026 11:18:34 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH 04/12] i3c: mipi-i3c-hci: Fix race in DMA ring dequeue
Message-ID: <aaHD2hEUcfji9WKe@lizhi-Precision-Tower-5810>
References: <20260227141149.184980-1-adrian.hunter@intel.com>
 <20260227141149.184980-5-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260227141149.184980-5-adrian.hunter@intel.com>
X-ClientProxiedBy: SN7PR04CA0005.namprd04.prod.outlook.com
 (2603:10b6:806:f2::10) To DU0PR04MB9372.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|DUZPR04MB9898:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b4ae9da-2ed6-4ba1-a2c0-08de761bddc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|52116014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: P6iF/U1R1kKnwmyN10qBRWU4GgNkL8mNFJIUll5QnWoQF4AYgnapGUXtawr4L7QgEd7MSQjDmaOJehraQH7rZTGfZRTOtwCqmbW67IZe1qpeliR8TGVnpjUfJgBAmSMSdN9UMnHBvt0QHOjbj9aUoDCuZIjluT4Wif2oHw5pd4SytxVEbS/86KstOOzi/vVujccMvovXI45D8QvalioMNxv/NlD4jZ1blfWDrx1BO8icC+zBdY+fYCgAqu1Egu0jZRZopcWVR1OnUphh5nWX5GhtS7UjHnoutjwz/AjTk7H46jCI4LDag2QJQniZ50wFM4zqS0Darf+wKb0OmstkgacGqU1b7V/n940g5GrS/93eih71xBzrDGkpRNAc5YiA/Zv0IlNpo2lbB7Smo/6OTE6JMglUC9WzzVw73QVKaEpGz5NRRsU0nmQLG4sc/haO4fFLjDaOxHivPpJ/JktabHVZdRYXATqKOtrGxyeLisQMer9zMBmz8PUddeBlWadA8GHVwNCWkpfHFHfv5NO80g5WRlyHrLYBLP7Vrs3giagHG5rcH9DZYoFmYgrDiB9FDLprUzhtQtSe0sXzgfEnnq4m0eJlzPX3U5HkDEZJwHWvYallZJuXXWBOuICSYRNG8QGPDnRmam7+iuMqxgXwYssiGewFj4olDHcwRfzNPyPcrDdRVjffS+bxMpbC4r4JNeHXzwNJ55uyd01RCg2D0Tfrhdfwji1PKrH2Gp0pMhB3Al6398ZeEUTWt01UyxzcBRQYcR1s3zwLwNoJZRw4sVQHLdoxnci7EgO1H/AHg8I=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(52116014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8JSEL+EM9t/sD2zMtJ/iTDv24xyZWEiKLXSaS9KeJrn+gU2TpIkpR9cFpDYa?=
 =?us-ascii?Q?0wdO9u9ucGwwZa6YqDOMvHIpPcTUgfg/ij8Z5n7Tczw5yo4sdcmoEdnQf8zk?=
 =?us-ascii?Q?rZ23edehe8pijpObrabWV5zc3heGwesWImwJ7OdRMcZvT6QZRhU8DdA/W6tc?=
 =?us-ascii?Q?IYZ6h9oclnUIF3sdNPJOwqTo1BI6g9N44ZQk5KUz29ftkMyB/ZpRDw/q7rXf?=
 =?us-ascii?Q?og6PTHSw+EqTvjUuQa0ovavQ9OueHZCG+yjIifIj9GTu6FMOdro/K+2ntIL+?=
 =?us-ascii?Q?Blm4B6W15ChNN/FjVyhv/vQT3EQZGNJMwOogQU28RggL3ulZBeoeDPYRclIY?=
 =?us-ascii?Q?Mu8JhUxkpHjDxlJ1++ZBs39zR4kr9HcIBb3KFlLf/1NocPOdaksKOQx547OO?=
 =?us-ascii?Q?5sCduayWraC0xA+3MLeXOoeDCMH6zeT2/x3n+2fLHZC7pj7zcWVkOxtnQI1h?=
 =?us-ascii?Q?WkaBx6hCEHjhGTaIVuGibqF6M8X5ds1ljl5WhZGPZPLKkbyVgOPabi8+tlGN?=
 =?us-ascii?Q?YXWoXu2LQhmq4oc/naLesOAVIFj4lng9thKNUz6m9kfc7Sh+lSPv2KVWeooK?=
 =?us-ascii?Q?OOr4HNpg7YRVR1h2OePHtXYl+/SdGbtiKYGuobr/NKcIAWKoxKAD7V2CtYet?=
 =?us-ascii?Q?VoaOD6P7PPHbh742rTzfUDVJwpENhR0KoyRIm/gutbWG1JPFEAXN03lWAm/Z?=
 =?us-ascii?Q?aK6yooDOyRSYLjLfZDt+bAZ/Gq/knoeSxvVXy9I5tZYlCOaqT1G0mqpl6DRz?=
 =?us-ascii?Q?sw1NaYwmL7t6Fwd1mp5Yt8mTxrYcMjRhhElXygYEsirVpe3jNyiRRtv5Tgc2?=
 =?us-ascii?Q?fr2pE6ToBrVnMHDY1vwYOdBCs1IoZf2pCC6HU7S8EZ8dYkWdkZ/zHhSkFAlP?=
 =?us-ascii?Q?wAZnsBaMibyYGAoh2uwPHvE7ugaPsLARqx0Il8Gj98Lr2n29J6hEp8NvK3KQ?=
 =?us-ascii?Q?RGdWqYYlzqJ52fN587pCJdILeBH063Zgjr+873hzPqtJVdRa48jlA1ToCF1f?=
 =?us-ascii?Q?lQYpKa42t9WmYGEfXBZ6zdm5KXf5ZYMStC30Hr49XpUMwEOqYcDAQtzrvGya?=
 =?us-ascii?Q?Ci+t8MdfQOizsKKxUiVi31FzctzY0v9G+uVphzhTTc5zFR7C0hk+9A/WgO/l?=
 =?us-ascii?Q?S1TuANu1dUbFX8weNyOoSLwTqqCF+kSw/GoUFLSHYeAUnu91r5zbCT/bvDUl?=
 =?us-ascii?Q?0ke/eybaBNSpqUcHDHUIhwHbso6uH7ezzwyI32FBd64JOVeH0v6r59k6Gvif?=
 =?us-ascii?Q?4etwnWx88UEMTYvkfUnhNealzpX2w2/trEOf55Y39y6qSylOQt8PTlM9NMSj?=
 =?us-ascii?Q?y/Chqw/xAEgyvM10w1m3N6YoZUAG/SoZSoJgwWMEn86xuCZq3M+yl453rSuv?=
 =?us-ascii?Q?A36X40M2hH/a1rreHoIySoTTITpqIZcuJTtZHV0rV3xyvcdjAeRdrwrrNj5r?=
 =?us-ascii?Q?1rlkMar1R+irmhPsluDNj44ox9t6mo5J+9PFXbF9ClGZrYnoaoSw76U0Szyt?=
 =?us-ascii?Q?Cq5TZwljsJJGH9w6HBVFrCpTjt9meQvAgHVIchBPOnolWFU/Rl8L8KrFkO7L?=
 =?us-ascii?Q?bIzqghT5CC39uYKJbmyCtPI+ySiDecKoV899myA5KqKKa83ZcVgMdTlHSgsF?=
 =?us-ascii?Q?z9Wjyz2wZY5gGwLHGb0MfqmbkexlV/LQHZ+15CHaMsA/09O1zB9+KymrPAxL?=
 =?us-ascii?Q?1ZZigGWGnPx6EqH1N2JnTNVTZgnVYX0C8x36dwJ3Y19aSGx5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b4ae9da-2ed6-4ba1-a2c0-08de761bddc0
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 16:18:39.2799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gEN5bxGrQnlgUgt1x53U3QzIy9+Nycmmktgn15eY5qcDJV+Sc3yvq5AmEVN9ao10SogH797WBRAJ9noHmAaN0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9898
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_161912_428334_2C68034D 
X-CRM114-Status: GOOD (  22.13  )
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

On Fri, Feb 27, 2026 at 04:11:41PM +0200, Adrian Hunter wrote:
> The HCI DMA dequeue path (hci_dma_dequeue_xfer()) may be invoked for
> multiple transfers that timeout around the same time.  However, the
> function is not serialized and can race with itself.
>
> When a timeout occurs, hci_dma_dequeue_xfer() stops the ring, processes
> incomplete transfers, and then restarts the ring.  If another timeout
> triggers a parallel call into the same function, the two instances may
> interfere with each other - stopping or restarting the ring at unexpected
> times.

how to sync with another hci_dma_queue_xfer()?

Frank

>
> Add a mutex so that hci_dma_dequeue_xfer() is serialized with respect to
> itself.
>
> Fixes: 9ad9a52cce282 ("i3c/master: introduce the mipi-i3c-hci driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
>  drivers/i3c/master/mipi-i3c-hci/dma.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> index f60654fbe58e..5a9af561e4cb 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> @@ -133,6 +133,7 @@ struct hci_rh_data {
>  	struct hci_xfer **src_xfers;
>  	spinlock_t lock;
>  	struct completion op_done;
> +	struct mutex control_mutex;
>  };
>
>  struct hci_rings_data {
> @@ -347,6 +348,7 @@ static int hci_dma_init(struct i3c_hci *hci)
>  		rh->regs = hci->base_regs + offset;
>  		spin_lock_init(&rh->lock);
>  		init_completion(&rh->op_done);
> +		mutex_init(&rh->control_mutex);
>
>  		rh->xfer_entries = XFER_RING_ENTRIES;
>
> @@ -549,6 +551,8 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
>  	unsigned int i;
>  	bool did_unqueue = false;
>
> +	guard(mutex)(&rh->control_mutex);
> +
>  	/* stop the ring */
>  	rh_reg_write(RING_CONTROL, RING_CTRL_ABORT);
>  	if (wait_for_completion_timeout(&rh->op_done, HZ) == 0) {
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
