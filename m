Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1561EB362E
	for <linux-i3c@archiver.kernel.org>; Mon,  2 Mar 2026 19:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WjuvdVNGWJMLXsqYY6/H5stmtflKL8wwQODkzdHogzU=; b=yDqgpJPWH/16Bn
	scEYmm2jMIDWCUDetcB+Xj0A2hDieQcwP8XpfOIONILeBCLKa4zvY5mjzY/OFGeZHDpvk5jFPhwgB
	VQ1o9L5W0yFldVl7oCho5RxrnTdBthoXWWk3hMMAv332JMtlGEC1x64PY5OQN/4q05moyXyUKWeAe
	MGhIT3RQJyc3IVHOc8pNxx1XPvx/xGKp3ZRHgCjI9wLS/QgcMZY91DDFHnjz7dYBnnjcXhHyLAEl6
	Q54zxI3RzMxtH1tuaCMcFToGjwu34tJWA/7/F1MNgN3Fs03Zkruej/E6On/joapHk55ERZPLneZiL
	9rdJHpS+hn2nqYLmbBQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx8nQ-0000000Djc3-2f1E;
	Mon, 02 Mar 2026 19:19:12 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx8nN-0000000Djb6-2IlK
	for linux-i3c@lists.infradead.org;
	Mon, 02 Mar 2026 19:19:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b71U7psYDIMXLxvRLXwlTa4kqBinUQjO6mdACqsijLUa2F3vYnyljMya8ZuIblCrfpmQNw+3bRSNz71WS/HRdNzfXOVRZSxrLIWrf0KEA8Wdrpt65fI6bTCGXPFETg4LNiNrZD/8FSyUuwRNBr3VZXOm7YnaLh2/FKuRXspvBBXbM2Viz/JE4UMznjMd20Cgqb01zzKY2lQCZSHxf7ErhB4nz33IY4vMuuYO6hzUQjoJ4DHP/77B1tuhRg4l9figl9cGbAlCortL85AFh0a60e1bqU+POfhG9giHmQZ1dJMO3Pypl1uG3fuf61FjVlwymttgRFE/O+zoOYJRJ/8l0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g0FPHW4ByV8opO52bm04Ucgn1bi4DMiRMXXxVG07IJ0=;
 b=wyN2ukAotmZlhLhRb5CBrgQhC1vmnf7cEt8JVTivRwp7ZkE6OvR5tsWaXB+0nRnpZR1yHTjLetvaLzK/wduAoVnjbCev98jGyGTrt2EVgWraz1bJ4GTTzP0xeykcKn06tCfQu4Bs96DwZFnoZmXuay9vvEdjfey8odO3nt8RmmTCP7r+F1CFCZ/1futKiPteT0dgLX0KVuf7WJNN4f0AZLPr48pY8aPMjD/6Oj6h614wrXqSXBEcCWrW57DOppdf0xLnPA+T2063v0EUKucluP2UqltfbUNNPtTxEZz7Tmw+R3Azd2M+IRiFmuoQiTUTw+15mbrkbFD+ialiLbVchw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g0FPHW4ByV8opO52bm04Ucgn1bi4DMiRMXXxVG07IJ0=;
 b=XU9McZIvpZsstsjEqXryn8rFLNHf31VpmfwdWWnJZ+1dnMjb6mZfGFSwX414/9rd5pIVR4/Ks3zZshM1C3/hEPRgvcjFaodGkLmcPCrYhaYqaCpbyUhdF68m2UG4XlHWqR8Lsptk7El4HPGL0Sa5Li50uZ+Oc8R3uw2NmRGoYFYiBPQiIeJnYioerAcJo+gu4eMLKTf/SyA6YwyEnlEJOI0xnSuEbmhhAFp4on0nCuwkLG+lLsVXBZjnkBguOacsIp1HZdJo8rIKxU55uUyVS8Sz3dtpCdgM9LSkyrB9CF6wM14if79sp2XKeUTKeLqo6eEkiVc2wYRS9zSpIUi5cw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DBBPR04MB7884.eurprd04.prod.outlook.com (2603:10a6:10:1f2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 19:19:04 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 19:19:04 +0000
Date: Mon, 2 Mar 2026 14:18:58 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH 11/12] i3c: mipi-i3c-hci: Fix handling of shared IRQs
 during early initialization
Message-ID: <aaXiokObGlvMzI_o@lizhi-Precision-Tower-5810>
References: <20260227141149.184980-1-adrian.hunter@intel.com>
 <20260227141149.184980-12-adrian.hunter@intel.com>
 <aaHJfRoutBmihGjR@lizhi-Precision-Tower-5810>
 <91727532-d899-40ad-a59f-2344e0f1d2ca@intel.com>
Content-Disposition: inline
In-Reply-To: <91727532-d899-40ad-a59f-2344e0f1d2ca@intel.com>
X-ClientProxiedBy: SJ0PR03CA0081.namprd03.prod.outlook.com
 (2603:10b6:a03:331::26) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DBBPR04MB7884:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bac66ad-046f-4f8d-1d47-08de7890916e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|52116014|13003099007|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: 0frouYuNkuYPPraslH3/tr3Z6Leb5FqOj2qCeFUAOfyVJ/6gwrPoq91WnbR2M9ZlCgO2sNdzoUNrXnVjw3FT7kQ2du//IoKxt8Y06Y+7TH0+ZmoJJwdrpQ0GmsqBZTRQxefUrhIGrMYDLllvYyVeywx1+S3AKrsfurusfhq2usB/H/NiGSXNAc8WTkIHnd2nzijNoHc7bO8N3mY0zQ6O/rNNbFCGMz0jAR5/hSR0Bl03HIuN8002p1vKhx99QwCqKD7bUSQ/gYNUNoxTJ5dZEWWU6QHOZlxYguPAAofmTlNerrVpvkaavFXtE3oQ15yw4hOQ3AzRQZ7WcgoVwKRTzAVqQvAR/qTpv43aU/jRabQZt6X6eD36vZE+p65p4W9VAPV9GLbefA3gRLbHNbxTfOHb80TtTxSDpeAxDiF+D7D1Y31X09O/lulJ69YMmT23p0v8OZ6un1OusceSOzmbE4pKOi+KpFvRJYaBSzuEa7Mq8jr/I9zjcZ22Y6oBJtZqMmZhGPhoxcpwEqecV2ja+kgWRmbHcE31Gce9ze/UnC1hmx7hnykafOwjKXUUD5HX1e8uU9jH1IWoexKLg2u6fAv8Z8s/2imeIBEq+jQG6Yt/XncZ8ro1i2tSDvMh7dEs7gfDeKTzOAvxDh15jz9o30xXx/V6NX67pNd39TzEKpNQAKdpxB64tmR9qqENZ+v45HQoQfaLrdOlDB6sUjZvxdiBuDXdrnfQvvT0UIoe/0mQ6DuJHCejIGQI2mjrjAar6Rw6zWlnpwbYU58CXRw4m8s9lfS9P0W6ksVbR1pEqK0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(52116014)(13003099007)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0fjNwn+VV9eGBaLkYL9xtfebnFKYDkceaEBBAs6DXCS42kApG+/y+FS4QfvZ?=
 =?us-ascii?Q?rbl4sHriSVUubiL8oUhn8nVSZwKR1XxZEMcrNFkq1s9YXHUVDjSbWuwv7uGK?=
 =?us-ascii?Q?63r9T1gncNaoHhTXQ4ESjLzVVUufw0fCmBMUJfowsrk+g7mTujSu4MMFp0+/?=
 =?us-ascii?Q?rXmIo0+kItxxajuPXsRqy0mtkl2494F+TDqqkjGKj/NBzueGf6G4L9FDTNM3?=
 =?us-ascii?Q?7L5s8a8CfLq3D47++xgsV49q+sO1w/4yMOlg96VdjOrhyuKe2UUZgbTUn60d?=
 =?us-ascii?Q?Ubr0+0ww3ohLPTWGoS6tmxC9OwxmbwHrbCX33n02tdAlEKi/cgAfyIYYAdgT?=
 =?us-ascii?Q?VU4o5XTal2HbcekJzNg0jgSsXi1jxfamZu6Fb74TZuf+RN+jI7ejm3QsygqM?=
 =?us-ascii?Q?e+5XdGsoH3j8CdihMhLkFDeCPnRyJoKUVbMnsipBRpnD25CZCB52255shILr?=
 =?us-ascii?Q?ZBd6FZ9TtGpgktu4AapcX2AEyy2U3Nq7EUXkiHMUqh0I7Us9RJovJjWOjo3d?=
 =?us-ascii?Q?Z3bZvXimg+mKdAmfRkajCUmLr4avqsleq2cLPFa7xOuZo0pq8KIYhUb10Ezq?=
 =?us-ascii?Q?MpF9X43JUnSDZIyot4GOqXbiamHk9lH1Cg+1JyTERHf1ozLA3cQTup1iqoBd?=
 =?us-ascii?Q?KZEmpIvF3flTaTZGULABgjTcNIM4lkVUyPaNJZEOyNdj+u8m3glPd8nkaIcP?=
 =?us-ascii?Q?3KUygq63OfXOZRcMvjtvkaVmZCV4mxP+Fy1Z4t5skXrFixgmdehrWkCnMcrh?=
 =?us-ascii?Q?gzwvmjzvC9G5hmjvFrTnCX6utlYKR/zCLcUfc7A/KeysNkePMcPigN7ixCea?=
 =?us-ascii?Q?Jp9fwNOLxDwxj1cwL+wbCWcDd+5HQOZpfSdHDuHoV7MxD01MtRYPRN03Kqag?=
 =?us-ascii?Q?/92mqhejWvcTucIR1zIcaipUaqHpmrI1hZQp2ofycE/lzunmNlZ2MUqOPPPW?=
 =?us-ascii?Q?ILEuZVAnQucavUdiZM+adYa8IpNQ+CkgBj95RLOvOFsR9uGPJyz1hKj4IQNX?=
 =?us-ascii?Q?/SObEC/GrSx4oujSsaqdDbJHIPrFuRv2XmnQe499aBB72D/PshqxgT5YQACF?=
 =?us-ascii?Q?9a5/0QSAcSV89woeCZhbpswao9/M6gY8OBh/sTjTVMoYu6agIyMW0MJShigR?=
 =?us-ascii?Q?hsKKPrLo4mahaNySqX7mTqm039lpwDAUtc16HxRf6nRx50uGn23dFQ6UV70N?=
 =?us-ascii?Q?PgP/OA8V17cLLA2Voad4pdWdeuCZj4PBzaIYL7j2Vx59O88gIW3+W1zErh71?=
 =?us-ascii?Q?3rjpzqyUe0vW4//Njks+Rj8Ur6SqiiqeXLoywURyt3WOMliHWIx6rfVsY/x4?=
 =?us-ascii?Q?Yljysd6JMKpoVSlj1d/KsHok6fEyIDVZSPEGvdneuy8M3DinAq3APyxJNUkZ?=
 =?us-ascii?Q?ZeFKYNXOjp/FJ1S0NzRAtxXhr9VVorT7r5bbPWPxLEoCTCJw6uBlpeAEl+Q0?=
 =?us-ascii?Q?9NTPakPxTMqbSWubC1ajnzW5U8JB6224Ec6M15WkhTlHLhyDGr9r5fGeoFIw?=
 =?us-ascii?Q?2MsdREe4WrVX3q2PPMTAX9YVqEfoMh92SCZkIP4AqTdDTs5XLuvKGbIVCGke?=
 =?us-ascii?Q?taf7NezM+jkKl6HHan9TWJW4S3UXhjJ6rsfbnJpOVHaetcxIjsPruoc3woO5?=
 =?us-ascii?Q?HL3UJKAzHF3OwQkGivWy4/hIJcboXHMXgnxuhDfK+SXrsbUyju2eZYZGx1sj?=
 =?us-ascii?Q?Gfv/tdTBGq/jm/VkHawQZ2dgTVqIgqoeSMshbldKxd5bq55lryl0t9NQMQbo?=
 =?us-ascii?Q?ex6Wp4FQ6A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bac66ad-046f-4f8d-1d47-08de7890916e
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 19:19:04.6023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +IVZ0GpIwkobm2ARJfviJiTRBKV7AcB9PzUNE9lEINkmoO1OFObYeB4x2LeCdpDwCI2hccqXTzT6ni8nuOEWQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7884
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_111909_603058_E2A9AC5F 
X-CRM114-Status: GOOD (  33.70  )
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

On Mon, Mar 02, 2026 at 10:43:53AM +0200, Adrian Hunter wrote:
> On 27/02/2026 18:42, Frank Li wrote:
> > On Fri, Feb 27, 2026 at 04:11:48PM +0200, Adrian Hunter wrote:
> >> Shared interrupts may fire unexpectedly, including during periods when the
> >> controller is not yet fully initialized. Commit b9a15012a1452
> >> ("i3c: mipi-i3c-hci: Add optional Runtime PM support") addressed this issue
> >> for the runtime-suspended state, but the same problem can also occur before
> >> the bus is enabled for the first time.
> >>
> >> Ensure the IRQ handler ignores interrupts until initialization is complete
> >> by making consistent use of the existing irq_inactive flag.  The flag is
> >> now set to false immediately before enabling the bus.
> >>
> >> To enforce correct ordering around transitions of irq_inactive, add
> >> explicit memory barriers: place smp_wmb() before updates that clear or set
> >> the flag, and add a corresponding smp_rmb() after testing it in the IRQ
> >> handler.  While kernel I/O accessors already provide ordering guarantees in
> >> practice, adding explicit barriers makes the intent unambiguous and correct
> >> on all architectures.
> >>
> >> Fixes: b8460480f62e1 ("i3c: mipi-i3c-hci: Allow for Multi-Bus Instances")
> >> Cc: stable@vger.kernel.org
> >> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> >> ---
> >>  drivers/i3c/master/mipi-i3c-hci/core.c | 16 ++++++++++++++--
> >>  1 file changed, 14 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> >> index 741f543aae68..2909e3d35d8b 100644
> >> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> >> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> >> @@ -152,6 +152,10 @@ static int i3c_hci_bus_init(struct i3c_master_controller *m)
> >>  	if (hci->quirks & HCI_QUIRK_RESP_BUF_THLD)
> >>  		amd_set_resp_buf_thld(hci);
> >>
> >> +	/* Ensure changes are visible to interrupt handler */
> >> +	smp_wmb();
> >> +	hci->irq_inactive = false;
> >> +
> >
> > I think you should use atomic_t, which already consider barry.
>
> No, atomic operations do not provided barriers by default.
> This is very much about ordering.  Making sure memory changes
> will also be seen by another CPU when it sees irq_inactive = false

Okay thanks. But I am not sure if it necesary because reg_read and reg_write
already include dma_wmb();

>
> >
> > Frank
> >>  	/* Enable bus with Hot-Join disabled */
> >>  	reg_set(HC_CONTROL, HC_CONTROL_BUS_ENABLE | HC_CONTROL_HOT_JOIN_CTRL);
> >>  	dev_dbg(&hci->master.dev, "HC_CONTROL = %#x", reg_read(HC_CONTROL));
> >> @@ -184,6 +188,8 @@ void i3c_hci_sync_irq_inactive(struct i3c_hci *hci)
> >>  	int irq = platform_get_irq(pdev, 0);
> >>
> >>  	reg_write(INTR_SIGNAL_ENABLE, 0x0);
> >> +	/* Ensure changes are visible to interrupt handler */
> >> +	smp_wmb();

reg_write() include dma_wmb() before write register,  If you want to make
sure write 0 INTR_SIGNAL_ENABLE before hci->irq_inactive = true.

smp_wmb() is not enough, which just serilaze between two core's access.

need dma_wmb() to make write 0 INTR_SIGNAL_ENABLE happen before
hci->irq_inactive = true.

Frank

> >>  	hci->irq_inactive = true;
> >>  	synchronize_irq(irq);
> >>  }
> >> @@ -592,6 +598,8 @@ static irqreturn_t i3c_hci_irq_handler(int irq, void *dev_id)
> >>  	 */
> >>  	if (hci->irq_inactive)
> >>  		return IRQ_NONE;
> >> +	/* Ensure irq_inactive is read first */
> >> +	smp_rmb();
> >>
> >>  	val = reg_read(INTR_STATUS);
> >>  	reg_write(INTR_STATUS, val);
> >> @@ -779,10 +787,12 @@ static int i3c_hci_runtime_resume(struct device *dev)
> >>
> >>  	mipi_i3c_hci_dat_v1.restore(hci);
> >>
> >> -	hci->irq_inactive = false;
> >> -
> >>  	hci->io->resume(hci);
> >>
> >> +	/* Ensure changes are visible to interrupt handler */
> >> +	smp_wmb();
> >> +	hci->irq_inactive = false;
> >> +
> >>  	/* Enable bus with Hot-Join disabled */
> >>  	reg_set(HC_CONTROL, HC_CONTROL_BUS_ENABLE | HC_CONTROL_HOT_JOIN_CTRL);
> >>
> >> @@ -970,6 +980,8 @@ static int i3c_hci_probe(struct platform_device *pdev)
> >>  	if (ret)
> >>  		return ret;
> >>
> >> +	hci->irq_inactive = true;
> >> +
> >>  	irq = platform_get_irq(pdev, 0);
> >>  	ret = devm_request_irq(&pdev->dev, irq, i3c_hci_irq_handler,
> >>  			       IRQF_SHARED, NULL, hci);
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
