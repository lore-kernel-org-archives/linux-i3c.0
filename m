Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA85EFCE41
	for <linux-i3c@archiver.kernel.org>; Wed,  4 Mar 2026 19:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xQjLalHdAXTwYi2aODqp+5/6P9i0S7+XKsTpRRikW9o=; b=KVH09wxYoinRDB
	0IHjYhneavQwyifDSEd9iI//VuZfPODFZasprqTcuGFPweYsFxZiADjvxkdCF7ybMTz75sOIsAkIk
	5MnlQl9lzu/w9TxCczx4oiyTqydQJl7E63DCyE8WpDr80v9w9G7e/tnmv/S+nieXXsAWAipSsT2N7
	E44HN5pVgxqCRSt/wKtEhdfqs285eIOXo3ofU2pmZyhQvNXypmew7dT3RqfpD1Lx9bC3GgQrA9ztf
	tyRVkeuPt2nMZlpS72Sy0bnJ0aPZIZ3Jxjl3r3kNqVao533Ewurz+mGhbvrKd2WoA9/L3XMd7pAfC
	NuGKerxsiWfjd6NwrnMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxsHn-00000000Q51-018b;
	Wed, 04 Mar 2026 19:53:35 +0000
Received: from mail-westeuropeazon11013064.outbound.protection.outlook.com ([52.101.72.64] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxsHk-00000000Q4V-2chL
	for linux-i3c@lists.infradead.org;
	Wed, 04 Mar 2026 19:53:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kPH+3KufT7tJ1msCHOgF2dC2DyK97LJJ9Kioi/tGvtNnqX3iA5n9A3VEh6AkMoq6zLgx/Dpfh2xh+tIR4+lOOLYlna8GbbXSFA21CgQjKmUrZNHIEtxjamZdamJI6oJUAuZNErEcdR2uy6HvP7UblK6WthTegDCdexsHIdIG1HT0fcHVlBCNs491XQvPDsfPl1UOWaetG+B+O3ZQelHgTLQle7fhRD5e87nBiMMCaZZi3MFIV7W26ImKVfrWXwYzZJbxqJxsAYsfnUVndUoF3tSSUZpWn0IGE8MOV6rH5H975ROp/M4cpBHWvofa2Q2LdC34Z0wFqvbST7xcfYM9nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WqvyETRceuYxC4g1wCruYv3bLoNbmzTK+hEox0Eq0aw=;
 b=POxAVv63ycYaftfRpCG3Hn410f0Bta3aKdWevPmciwLNplBuVfwE/VWvLVI+cssqGalSvLmBXpuipSjsrIqHt7beTohxGBdkZFmzxsLCswYY3p2KZ4JHYroSwfUI81yn7S6pGVoasCmp2BxY8joxHJxHQEgtevX99U/nNxq9ZWLomR+h4aKduPLG9XZSm2szW94Yngkz9rcZVC0r7OcdYcXBefaIv5viJMpJQdRNlHjJaMprkS+QBs5zOb+tJ+dX8D/LWf9hVKhOqeNOo/C1aCZWZ0YWVoALZmmSF/s5uPfvpWEAhUvGDMrLBS9JBjo5p6UCLkTntH+a+RqvK/sEgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WqvyETRceuYxC4g1wCruYv3bLoNbmzTK+hEox0Eq0aw=;
 b=fk+O1aOfMqpj2/oaq44wDJ90zY/jPxYTe6saGJgJW6GS3raixVRs2RqIq2JL0e2DWNzGDbBWE5JxvHdlIOsb1PeYOUOzY1Yp9VoC9rBcJMBbBdFSaAvaKFHptUAZHIJzd5aPgYMKWpDoMLsWGxj7XVb2UAYbLAe9INi9axZEYicqMsWq5MKD4HPA+3UFLJTWoMNYup6GHZ0HWZ0njfi79NTWHdQX6lLhrNPnKo4Z1Db1mTX4d8LoJ+Vlxk+vmUyNIc3MD9W90GKqLN0f5x470sDZ0t+26Y9QtE7antSjI2U9FF44Q1jyDmbL9X/5J1paUuKWPzIp2oym0VjC4t1C0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB8798.eurprd04.prod.outlook.com (2603:10a6:102:20d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 19:53:27 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Wed, 4 Mar 2026
 19:53:27 +0000
Date: Wed, 4 Mar 2026 14:53:21 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V2 03/14] i3c: mipi-i3c-hci: Factor out DMA mapping from
 queuing path
Message-ID: <aaiNsX2Pb4_DKERp@lizhi-Precision-Tower-5810>
References: <20260304181706.143841-1-adrian.hunter@intel.com>
 <20260304181706.143841-4-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260304181706.143841-4-adrian.hunter@intel.com>
X-ClientProxiedBy: PH8PR07CA0020.namprd07.prod.outlook.com
 (2603:10b6:510:2cd::12) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB8798:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c2b08a3-1909-4ec0-7321-08de7a27b3c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|19092799006|1800799024|376014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: FeTEuoSbwav7ya8RQJ0y4Zta98DVX4g9SLbrNnyX/G6xcoW/CPStpz8dx/9CeLQ1Me6HdYphhUrN3njJAu6OE19jIVwn/X8H1R5aTex2JjQNcwIOlRm97G4JD4+r3o9CE1uvN0d4U/KFcOh9nS5YP75IuRhUbvSrge1iwEacXJkDpzG2RxWoHrQcrStWHH8h99KajHjOFREYPvSe1KR55sFmnf8sN5nbRZ0P/N8DQLo04p3i2k7iMGFLk40YUiNgOVmyviwTEBem8UFB0Jb4F1XTa88Cq6F5Oi/OepxmyrQylvmZTMEhDoVHMwKPalr/gJtBGbyhpsdgoUL4+AEXXNtqqESrkjwkQ/VQWDI7Npp3iZGdZqZ+pdZdQTT9jlHzIIldQpWRfGf0udOcD3sUTBtogHl6o3SrZ/bh7JfeGOX7QcWiH/dzBzh4RVc/EGS2etaZIc0uUoIQyK1hGDTVRnHw6f/0kiR8vMOaFV6I2ig02RruD0AVDgrupC1avVPow6vUExX3KQmFKYrF6Z3nTo48UsLqTN04ohGmA4Kx2FcelQZS41i4t4B+qWPKmnsvd3k41xXndXSdFd8VkIxQlpWcRlAvSYCJ6fLqrgBefHwb1bt9kEDMIy46uJ9EinzLDCTsLiMVALc84bcA4zUiIzixBGd6VnzISFC8Ejyfjjg3e6VaAIMF0Xe2hXu2P9DcHGM5GTu5NDPm/W34dWbzk4jcyg3YZbjCsvC5drkfFPimkRe49l4cfWrlKcbl4wAJdQIJ6LgUhTtr5wnRVBt+inM2az+T88t6eW8u/UGUpAc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(19092799006)(1800799024)(376014)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xGdWRGwxnYZHDdxKDQW58ATn8YmVrv/WVo8M3Mkgcl5uK1zRHGMEEtYhcTCE?=
 =?us-ascii?Q?RVr44gSrBjQFSCbIP+1+iEzFU4XPAF4cRQohID7p7Qas/7bRqMxp6Y2ElxPA?=
 =?us-ascii?Q?sItCYiWBOQ5BHu76GJOpuT5lDMOfix6XNVOTDKKCAitZaVgTspY6cktpNeSX?=
 =?us-ascii?Q?QHuQ3Dm+Shfm2B7h93E2BvtrC03PnRC5inbLZxaJr3ySilRLVnqJUDVReh9f?=
 =?us-ascii?Q?ezSEc7JEvskmvnXFzSNs7uJsoJgmZ6HstVpuIaymVIfsS98dRuKuR9+dze/Q?=
 =?us-ascii?Q?ac+y5YeJE+vCGmH0Mr7kOnCohawHKHIHSzI5Y74uj1tYNIZBg2VXT+byLA9v?=
 =?us-ascii?Q?yw2y94a3h2EM8K4JDLuAxk9fAvTBxsmUASa36lsvo02jTctwYJ/oA5f8uFyl?=
 =?us-ascii?Q?Azj5BM4/wv20vtZXw/OG4MBusjTL3sONkndWCSrWYjBfJJBax9se/A3EECZ4?=
 =?us-ascii?Q?of0+uV4Gu3c17dWlSzUhopWDA8eWzouv90pbvDhFbGvkrfDZP1CLLOBSAZhR?=
 =?us-ascii?Q?yhwic3IzZsHSTGM2puS+pW1obBnmN0pV7ZH4bPCnibn7MyeYmyLXyllMYJQ2?=
 =?us-ascii?Q?uXHWeE0GkEEQDAYPfnMzZXb83tx6C0W2gzGzYilAJsAzmEJ06YkRgUINUg/H?=
 =?us-ascii?Q?ys+TA2uWgXzzmskzkCF/T3Mw/ZA4oQsbvPn9IPfNW5AS4sABZ0HTAPUamC6w?=
 =?us-ascii?Q?/l49xbQX43uCa2sNG05OPK1LZoLkspPlJxYTPrW6Wq7Uoxp68XzyfGzZlZzZ?=
 =?us-ascii?Q?N5GrSdvk3yFVSfhkr5VBHcDpnFhvSj/NFdB+NbFKIM4Co3IJKOoAlJyBtMvQ?=
 =?us-ascii?Q?eVBRWMfGCAFhac3/Y/RuFfhbkFcJWrM/zgK6GtMgwI7RtC78Oe8vlWK6iiB8?=
 =?us-ascii?Q?21E2UCzgTjQ89HYrbgiLjUrCR/toV6km/ySRm+btX98ASfOu0E4fXexcvnLy?=
 =?us-ascii?Q?sjb9mHD1kexS2p1i+yRrzISr07+sUJ5o2xJytR7TcUXg5pRz13miHAJkqgFs?=
 =?us-ascii?Q?K7TypZsdnuVwS4NYcBRjUJShWcoCDt7Fd24jV3+czTBHVyaGzxaQkAB8nL0T?=
 =?us-ascii?Q?gu/MKEqlLjyIsmLbaurvxhqCRdc4FKU3xDSF1W4S4+MTwlb6IIWDfqsbNr4P?=
 =?us-ascii?Q?BlfnQAPvsLopHVvRVwZ70A4REAduECnQum+U91d+gf0zZTXjQ9lOTygi4odf?=
 =?us-ascii?Q?bB9aaE7KYEle5oOd4CLtbwz4IPeuxbRCjouSbmzADfkc9Xq/5W/6wjtpDZoh?=
 =?us-ascii?Q?OY8mHymZq77dtPt2Y3ohHHV4W6E2vz5Ii8mLmJZMmDGUy/N2NKWy7Q2aWi6M?=
 =?us-ascii?Q?DNWhQXYXU6lo82RwQNXMXoG44yEuyhP5iuoXI9sgRd+l/djBxmWtX6Av49zo?=
 =?us-ascii?Q?W8sIYmAbgtUIJ/NzwGS8a+bTTFcCU67zLXaAcq4jpjdE/fQopJGGJ5hirARJ?=
 =?us-ascii?Q?N7kQjvQalR2hE3oWo2ieF4pkwxJqAY+8LScsHQp0UOIBNoS+IL2DR6rqzIzs?=
 =?us-ascii?Q?lCS/Tst3iJTOG8usJN1B+5JhQCZkx69Me1f5yUWg9m/0Wj1q2bKJOUUEHTo5?=
 =?us-ascii?Q?pghI3Oy71poApCYPhQKeEFBMAga1a+RAc8zIKLyENq0opK0z0zfKmr5u6HxJ?=
 =?us-ascii?Q?SJN9R07Ny14jAboQivULZoXjAAewoOJ1NMV2XKL2UDsu8abjVHpVUR16BLSO?=
 =?us-ascii?Q?9lIUJjiDP4N0/0hwZmz+DYxAsocQFm4YmNVRiLB3FUrDXw4Y?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c2b08a3-1909-4ec0-7321-08de7a27b3c4
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 19:53:27.6068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OMqD7vuI/K/fJN9M2lNQZQMcIpoCjIDtBrhIwhut/+yhSlUs5wClP+AnD4e96lCzWGTlH3A/6jpAfPfeGc5s1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8798
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_115332_680115_40279DF7 
X-CRM114-Status: GOOD (  28.54  )
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

On Wed, Mar 04, 2026 at 08:16:54PM +0200, Adrian Hunter wrote:
> Prepare for fixing a race in the DMA ring enqueue path when handling
> parallel transfers.  Move all DMA mapping out of hci_dma_queue_xfer()
> and into a new helper that performs the mapping up front.
>
> This refactoring allows the upcoming fix to extend the spinlock coverage
> around the enqueue operation without performing DMA mapping under the
> spinlock.
>
> No functional change is intended in this patch.
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
> 	New patch split out from "i3c: mipi-i3c-hci: Fix race in DMA ring
> 	enqueue for parallel xfers"
>
>
>  drivers/i3c/master/mipi-i3c-hci/dma.c | 49 ++++++++++++++++++---------
>  1 file changed, 33 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> index b903a2da1fd1..ba451f026386 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> @@ -439,6 +439,33 @@ static void hci_dma_unmap_xfer(struct i3c_hci *hci,
>  	}
>  }
>
> +static struct i3c_dma *hci_dma_map_xfer(struct device *dev, struct hci_xfer *xfer)
> +{
> +	enum dma_data_direction dir = xfer->rnw ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
> +	bool need_bounce = device_iommu_mapped(dev) && xfer->rnw && (xfer->data_len & 3);
> +
> +	return i3c_master_dma_map_single(dev, xfer->data, xfer->data_len, need_bounce, dir);
> +}
> +
> +static int hci_dma_map_xfer_list(struct i3c_hci *hci, struct device *dev,
> +				 struct hci_xfer *xfer_list, int n)
> +{
> +	for (int i = 0; i < n; i++) {
> +		struct hci_xfer *xfer = xfer_list + i;
> +
> +		if (!xfer->data)
> +			continue;
> +
> +		xfer->dma = hci_dma_map_xfer(dev, xfer);
> +		if (!xfer->dma) {
> +			hci_dma_unmap_xfer(hci, xfer_list, i);
> +			return -ENOMEM;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  static int hci_dma_queue_xfer(struct i3c_hci *hci,
>  			      struct hci_xfer *xfer_list, int n)
>  {
> @@ -446,6 +473,11 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
>  	struct hci_rh_data *rh;
>  	unsigned int i, ring, enqueue_ptr;
>  	u32 op1_val, op2_val;
> +	int ret;
> +
> +	ret = hci_dma_map_xfer_list(hci, rings->sysdev, xfer_list, n);
> +	if (ret)
> +		return ret;
>
>  	/* For now we only use ring 0 */
>  	ring = 0;
> @@ -456,9 +488,6 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
>  	for (i = 0; i < n; i++) {
>  		struct hci_xfer *xfer = xfer_list + i;
>  		u32 *ring_data = rh->xfer + rh->xfer_struct_sz * enqueue_ptr;
> -		enum dma_data_direction dir = xfer->rnw ? DMA_FROM_DEVICE :
> -							  DMA_TO_DEVICE;
> -		bool need_bounce;
>
>  		/* store cmd descriptor */
>  		*ring_data++ = xfer->cmd_desc[0];
> @@ -477,18 +506,6 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
>
>  		/* 2nd and 3rd words of Data Buffer Descriptor Structure */
>  		if (xfer->data) {
> -			need_bounce = device_iommu_mapped(rings->sysdev) &&
> -				      xfer->rnw &&
> -				      xfer->data_len != ALIGN(xfer->data_len, 4);
> -			xfer->dma = i3c_master_dma_map_single(rings->sysdev,
> -							      xfer->data,
> -							      xfer->data_len,
> -							      need_bounce,
> -							      dir);
> -			if (!xfer->dma) {
> -				hci_dma_unmap_xfer(hci, xfer_list, i);
> -				return -ENOMEM;
> -			}
>  			*ring_data++ = lower_32_bits(xfer->dma->addr);
>  			*ring_data++ = upper_32_bits(xfer->dma->addr);
>  		} else {
> @@ -511,7 +528,7 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
>  		op2_val = rh_reg_read(RING_OPERATION2);
>  		if (enqueue_ptr == FIELD_GET(RING_OP2_CR_DEQ_PTR, op2_val)) {
>  			/* the ring is full */
> -			hci_dma_unmap_xfer(hci, xfer_list, i + 1);
> +			hci_dma_unmap_xfer(hci, xfer_list, n);
>  			return -EBUSY;
>  		}
>  	}
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
