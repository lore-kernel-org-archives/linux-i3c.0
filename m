Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C0D1109B489
	for <linux-i3c@archiver.kernel.org>; Tue, 31 Mar 2026 15:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bb6pzjzJjvnubgldUHlVHxQxu7H4drF4hTqV8NZOquU=; b=hPy6JEH9XOoWtP
	kVYl5RdQzAHl7Ww7RzmtOuifzticpSGRM3zIogvD+UjNn76JTV+cGRS+6A6H/Zv8D1r5alKF0B5+v
	Nyzwykl48E/iClv9cdPx4BuY0UT8PB0NoiNYBJhOFydWaBjsJHQKjKHespiLY3xRCKNRF+HU3Sur3
	XIXj3+VlpEiswCCl5+6iHQSXPt80qVc8JRVfKNgemrxkzBlos20BPgDFITZqU8UOgveh/mVTp4QTb
	jgtx6EQlwO4kZOUIgJ3Ob4rafarW3vkiMdNR+UAg4iXjgm3U0FBv9u54q3EhxkO8VoWsjSUIVohxW
	DjePpj/4/KCw+15De6dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7afh-0000000D96I-3eeO;
	Tue, 31 Mar 2026 15:06:25 +0000
Received: from mail-swedencentralazon11013005.outbound.protection.outlook.com ([52.101.83.5] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7aff-0000000D95P-2SR3
	for linux-i3c@lists.infradead.org;
	Tue, 31 Mar 2026 15:06:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HLktymsBTgX2XYyI69FpKEKarxyfV6VIHZsR6yKciF1mgTq06POU0S5ERx3WlXFueuxKSaYHxAsZqY4pbU4XX+7AauqUJUaiGO/+mue6YNeKOHYLDivmDmQmY0P/Fai9wMvOS111VnGMREPocAbbPAcrW+z0tstepkP/SpOi45QnHn23uvngnv3OytVywSvu3MhRgSwVPGPEvyY2Z9E4Yu1Z7bVOiVLI8pbJYS1HnadwfmuaxjYxjY0IO2jIQH/5lEtbK2J4c1f5j3f1j5yZeMRCd88zctTO1oDLl+7eSCtkQrJP3mqipq2e2uV7h3JwsKPrrYdnx+Fqr10QmoJrNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WPg5wrhUFv68K5bxXz9MKVsotT8PqwqsfWt5bsNgCLk=;
 b=eq2qsVnHhHXhmk88ZQbrJgHtZi69Aes+QesWY3wPNmMH32jsumbVeGLLTN9Dz9vxpAe942uomIzGjOWbPchpusad3BGVyzeFeWtFRDc+YMZ07wGzQ3OWB28TPPrqSFoOjglVJw3LPQwHEffIhrnq92KDxotMfEYglLrQiwiBbOUarSgYDnxUyPxFSgl4kfs4BzuZ5JJeXHzWMa0LTspXNcloOv/GwawA+Z23IGcPD+O1rfCihNNFWIWu6mxJo/KTdglE5n23KFuxwvytYNuE1LArn3jIMv05QSS17KkBLcnZss7ySzDLgIMUw46vV7ccJzjHWWTKgs597ku19P7J/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WPg5wrhUFv68K5bxXz9MKVsotT8PqwqsfWt5bsNgCLk=;
 b=WQp0zoHdX5QRSuqHo7DdUuJLADpvfhgzFounHn8h0fG4l/AeiezQtp/pTcQLzWExff1uktwhvHm5d/HnP1aLg4Yx7JJ/z52MtAnw9d003LJBJVCCXrw/X+64LGcBWVdIlraxnwkMpCy68YqInuN7Kb14TMwP+ykZMhr1Fm1SDgQGEd1knawKhT2vcAuDlO9EPd8SPcMgI/DFjUTPn0BAnoCzxOikLW4KpJB2miiiT7NySHOC43MtIyb0wz4WDFGFkt7TzaMIysK1yTSgUuitcgIJMouR6y/eNk0NUDLUHYPY+dveN/uz+i0tLZ5xlbj5BoHc06frIlwa1v6D7jU/aQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI2PR04MB10977.eurprd04.prod.outlook.com (2603:10a6:800:271::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 15:06:17 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 15:06:17 +0000
Date: Tue, 31 Mar 2026 11:06:09 -0400
From: Frank Li <Frank.li@nxp.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Nicolas Pitre <npitre@baylibre.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: mipi-i3c-hci: fix IBI payload length calculation
 for final status
Message-ID: <acvi4Uy-2kdsnlrl@lizhi-Precision-Tower-5810>
References: <20260331-i3c-hci-dma-v1-1-e5cd295c44ff@aspeedtech.com>
Content-Disposition: inline
In-Reply-To: <20260331-i3c-hci-dma-v1-1-e5cd295c44ff@aspeedtech.com>
X-ClientProxiedBy: SJ0PR03CA0202.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::27) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI2PR04MB10977:EE_
X-MS-Office365-Filtering-Correlation-Id: ad62ea27-8d3a-42ca-05d9-08de8f370f30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|52116014|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: EkLB0F8OL68IwOStNvpF5GZOVYTiMdz3RxFT3AhyB68uyKl5o23Q9XXwRndls/2usd/75mBcFvWFWz8uC2+1SNaXbYdwnCXIgHm9RphO/EYfaHrIqR8YLhD7mMjclXUVo0wBzwm+BZL9mRqczuEwOCLFb8PCWrdSSeMlmp/Ddp3cTttMzssb/RnHvr3DKIyC64KGt5X1hKjFw32gaC+D3pGj9YHkH7vKxQtqFfvTXjcQ70GdiCjg1cJkj6PFj7KdQjx+9VEmOe+otE91UIPWRbOknmYMBIzo2WaIzRhc18Pg3mrGriETtpzxVr+59IRF2JlcpwzoHTajGtvjg6GH0/tJC/PyzEZeTJ2GUP1+F6gh4BEQJY+CE+XvBNueUURr6DgYNplUj3a/exmnT1NAppA9wu7QKP2eUsf0kIvHuXsONwJJ49QlYE9d5lVfEje0uJgYM0oareMjhH0fqM3AEPxTG0DKemoM2Gn6f9h/dKQOcBq1Q08/8bJI/xCQb4F6/9ob8w3BBxIa12FwWQt0xOzLg0AhnSn3ZWbjyoobQu01uAa+i3NEQ9aAiVBnTaDu89qswPGfROPL4enoYkQ0P7WLwIBMJPTHuvUIVFHixVenRh+vVXco/13cuEBjyW3FXyfiZfNvp+q4+tWyR+6IEhd021gxyWA8wBxzUwDT9mpkQWsl7B2ZiKcXhPE2OgUK7sA7iCHhKmF5P0MGQx+L8kPCSnqX4gzyXQYULV6vAZECseFNes6i10Sos0dxEtLo/9zYvNtYv0acDnvhCuWFVib8fx1O7d5lJYh+SCK0FG8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(52116014)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kwwUi9HB9efYNGurkSHjcMrbjjC9gTawFsos5rzwg3vPuUP0+llZtTMENano?=
 =?us-ascii?Q?HzoWmbIEv0clqMEdF76NMxyLWyG0fNPzEmoY609fU2zOBUp5r/CR7Tj5fM1t?=
 =?us-ascii?Q?LP6NQro1u9KLvoXL5BUJ4a0exn5d0vDhXs2vzecETsbsrsFv3nhjEwIIh8hR?=
 =?us-ascii?Q?8qQPUX+xJkvb2Q/tExNzFDoP3/pNYomaNIHfogTCklOzZdtbD4DbxWO281qm?=
 =?us-ascii?Q?JtVKrqbDljMzRcjGg3nAGOvCjs+lo/MCQ7BPRau+inmbXe69cdmwd5epAoCU?=
 =?us-ascii?Q?cT1Sn9wIh2FAT4JmpVKgifvAcCRcSC+VW1hYqCMtk/nQsr7olYCwlcOzuj67?=
 =?us-ascii?Q?iKvW1krbp7Zs8C/74bbAU+6CfLgTHcZCoiPdJ9GSo1Dzs7eB4GZLGW9Q+ns0?=
 =?us-ascii?Q?Zg2ckvVepFe0r5BQN170MryEjvH0NFGAndIUUAWdueNCUMPl3pdN3ifacv8M?=
 =?us-ascii?Q?XAM4ovX5s288gL2eLb/gCGpQ03j1HzsARWbPJGFODZARvuZyclFQ5Iy9iql8?=
 =?us-ascii?Q?MnhwhL9i1wsVs63MuiUT6EaN92Kf8qyJWDVicOEup5bTpJAaI4c/C0epFh/b?=
 =?us-ascii?Q?Szla8Ac6kfe+nxjPRXvKGdOGNixVo5Lau2+IDjdKq34Mk48nSahC+RQgh5Og?=
 =?us-ascii?Q?ndDtF/mqL3JrTb2JsXoqe5SM5gBwXm6+r5mtLo1aDgi3aJx1E4sDi910nT4I?=
 =?us-ascii?Q?v75ZswMIRDBwPWKNr7LMmKxAKUh813r9MhU1vTgKMOBcf3WTAEC/zzHrLYDK?=
 =?us-ascii?Q?nXRJ6HrNSeuZw6IqaO9cDsVxFF/O1/mb0QrJHFVkjzyNxId4eGgulwdKHjx6?=
 =?us-ascii?Q?UXRTP1Aubo35MrgtGm0+BC1+S0bvmkn+wc/aCcvE6yRKJSsFTw1w+k8jmc/d?=
 =?us-ascii?Q?DRZxH53WK021QuIY6iyM60MwbEES2YxahOas6FcwyJ49IsZGnGk1i7SiKTI2?=
 =?us-ascii?Q?mH6s6QqPTNFopoM5CpYUGueVq8hPKTpVAYTvYGg+HTRGDL01dzhbA3WRii/y?=
 =?us-ascii?Q?f0Z1jvS5c3uCSidNDrzgFqCvnoViLHHVZomQlZ6rWQA4JxoRY72/aiBzRC0Z?=
 =?us-ascii?Q?HYXIyxOs08UvNjpADFxO+QuLKKU/U787t7yPahicUxBkknZY4r++AgDlE01W?=
 =?us-ascii?Q?nFC2UJJilFjvBSBn0XhlBWFtdPH80VlED81Sd27QFIJM9HIiGgmpWJ+YNpZU?=
 =?us-ascii?Q?F3lfo03KkUDjUApvXrkX2p+TDQuF6q3wIXBN5zdJxeVluSBoVqYZCr5TEpuG?=
 =?us-ascii?Q?cZEBZjagbp76XVEjmxz+f2tc/9IDHNk8lPA9KZnHIeK1OHdSlyIF3NBjg2PZ?=
 =?us-ascii?Q?cOy/UdDafaa+x9IjYBLZbvtndlioPviUcpXXhqNySBc5f621LhK8ZU5wp7RJ?=
 =?us-ascii?Q?Liv7zhEzLV/tOpWUgdgx7Q9nAqjjzTh1wRTsipYLrNGzschby2Pe1NhtJoPt?=
 =?us-ascii?Q?W+63W8H7bQhEk3XM8kzynRkg55jAKsragNaJzRD6sx4tSIRHgADZKnqTVEmm?=
 =?us-ascii?Q?ngVV8iV3WylOpTjxfFXXKWOuKhRHQefJp8B2XH2e0Knd4rYhI62WlZCS9fQ2?=
 =?us-ascii?Q?vCJOgZyWvLbotCId5DPZdYEEkGxQiHA7pfmL3e0+jFNUovU0LxmFc6fcXQfi?=
 =?us-ascii?Q?v9PA74VUE/k6ZZLC2m5ZHbn4zydACY8Ogw3r7mLJPlCs+EPH/xcdxp4FLjVT?=
 =?us-ascii?Q?kQTU4S8WBN2Z3IFf1s7pBS37uBwUXBYMUHqiADlm7npcg+pJ9xsXVXQT5mKT?=
 =?us-ascii?Q?7P+dcRuLRg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad62ea27-8d3a-42ca-05d9-08de8f370f30
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 15:06:17.5249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tl60/QNutreVGflL9TfRTCzvzi/g1oC78VceNAIdv8rYMrx4soh+Xnl9z9guBVh2xKcFbLP7vwzKPiC6+oCIIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10977
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_080623_649760_451D218A 
X-CRM114-Status: GOOD (  19.92  )
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

On Tue, Mar 31, 2026 at 06:27:30PM +0800, Billy Tsai wrote:
> In DMA mode, the IBI status descriptor encodes the payload using
> CHUNKS (number of chunks) and DATA_LENGTH (valid bytes in the last
> chunk). All preceding chunks are implicitly full-sized.
>
> The current code accumulates full chunk sizes for non-final status
> descriptors, but for the final status descriptor it only adds
> DATA_LENGTH. This ignores the contribution of the preceding full
> chunks described by the same final status entry.
>
> As a result, the computed IBI payload length is truncated whenever
> the final status spans multiple chunks. For example, with a chunk
> size of 4 bytes, CHUNKS=2 and DATA_LENGTH=1 should result in a total
> payload size of 5 bytes, but the current code reports only 1 byte.
>
> Fix the calculation by adding the size of (CHUNKS - 1) full chunks
> plus DATA_LENGTH for the last chunk.
>
> Fixes: 9ad9a52cce28 ("i3c/master: introduce the mipi-i3c-hci driver")
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  drivers/i3c/master/mipi-i3c-hci/dma.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> index b903a2da1fd1..f4c76f168276 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> @@ -721,6 +721,7 @@ static void hci_dma_process_ibi(struct i3c_hci *hci, struct hci_rh_data *rh)
>  		if (!(ibi_status & IBI_LAST_STATUS)) {
>  			ibi_size += chunks * rh->ibi_chunk_sz;
>  		} else {
> +			ibi_size += (chunks - 1) * rh->ibi_chunk_sz;
>  			ibi_size += FIELD_GET(IBI_DATA_LENGTH, ibi_status);
>  			last_ptr = ptr;
>  			break;
>
> ---
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> change-id: 20260331-i3c-hci-dma-3aae908b4e8e
>
> Best regards,
> --
> Billy Tsai <billy_tsai@aspeedtech.com>
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
