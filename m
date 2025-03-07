Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04DD4C19F32
	for <linux-i3c@archiver.kernel.org>; Fri,  7 Mar 2025 20:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iXnHIp0Z3W09D56JhbM73J+hUMar1+KtFzq23jaJGIM=; b=z745+8i4saySO7
	IKFS16qVeqV6u7FynUsF/E500uUWlz3iWlTK0g1ix2fUP5uks1bkC059QPhRKeSuf39odZjUzEyiU
	2VUXROVPHFpwENdsj0A7DyIwDisGuuZaHek1bmJ6BTxIW8F8qGBD1iyrpXczMHVIVoLOQ868LkhQf
	DJePtwXZXKDBx9NtLnD8lz7mlRdtbXRhVLTA1O6occa184KW2MLrOQC/wazeeEWHIGVJYLJT4rEst
	kiqugeA3tzqSSCLceccsqFELNbdAC5C7JMco4JjjdhN8oIDz0ktT0gPXxwHLOOyZFr1lcQBk7eKde
	/bP4pf762LS95UoS+y+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqeOI-0000000FUrT-3DAP;
	Fri, 07 Mar 2025 20:33:54 +0000
Received: from mail-db8eur05on20627.outbound.protection.outlook.com ([2a01:111:f403:2614::627] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqeFJ-0000000FTuj-0526
	for linux-i3c@lists.infradead.org;
	Fri, 07 Mar 2025 20:24:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YBdiTURKQ8VqKimETyXcCLsu0SPUt0o1QlpRNcCOt9MqK5u9g+b806z20fQKrqDoA2W4Y24EFlID++PrVWTssUS6YjOXInHIsvsWHmrF7fWA7X678vccE247zoOfAk4vQO4w4JlDBGXSN/4kocIwqWAQx5x1q37UAyd+JEGCMxZypMF57mbhoBv6QhHc7ikhwHKI+3ltHEicabel+il0hGmNllmaQqM+Fn8DVRt+rWNJ//Rgqxd8t/x+tZLXfYiwVIF9cdFAyP3JZF4bXHZAK5rx4t+4t7YFJ8i6je8qUYV4N3uQJ+BQwqDGuP5fi0kpEXr0KtoTm2Nq0BZ5OQwVAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WXXzbmEZlVSnofi1P0umBNc9RWflpNPz7Pd6MgUtDr4=;
 b=lfewm9wLNB+Hl0Do9ro79K+A4zBapntnfoEYNuCbwLsCDLCv454cW2rnyFtf22Tw3v4IiFGH39c3q+aqFn5EvnZB2xLdgWjpBRo145py61wg/2Y+uPnYxyjdEJUfvgDY8l3RRf1NLVDQc8ln6Z7+LByYQ7mvx4KErLqFZWtKSKidKgX3D6csI1VVCj/jPNABFsnTviRVinPHA+8zBJy7XIHixspfutbypn0u2+HglApM6MwEmiuZM2D/7fu9fMq0tMbgfNwFotYhqzZi/kcXC/PGAoA08VQAWl+XeLWon44dLuowF1OksEM4hD62d19DosXgReq5ghhsdNlt5tllwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WXXzbmEZlVSnofi1P0umBNc9RWflpNPz7Pd6MgUtDr4=;
 b=X45yllQBNBzMfWuPdOpHUNx6F2SAQp+yVCDLtvPOR18owP06p0KbmhlDMGa4hxyfSdwQ3xps0QU8FEdrDsYZDQtnjIvAE8IN/0h5f0gmLS1E+T/b65Q+sg5EmLaKWVUw9MT4JUIpPIQfbGsqio+AUv+XrEkw66AJ/+vqy+c3d3zFvlNvqKlJGUg1Xu6JZblebMwWLFeqby8nAzr3GvKlNYdAPwEGaYyD5Qnl3313mbfJnyV2Wq1G4lAZJV2fi+gEMd3yqofV6TkPdBWbaagLrJF2fzWhtMbwNyKO5cSOPTCEsK1C/JNlJS32EpA2l4JU3wAUcixs299MekCjxrD/Ag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM8PR04MB7282.eurprd04.prod.outlook.com (2603:10a6:20b:1d9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.20; Fri, 7 Mar
 2025 20:24:32 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 20:24:32 +0000
Date: Fri, 7 Mar 2025 15:24:26 -0500
From: Frank Li <Frank.li@nxp.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 1/4] i3c: mipi-i3c-hci: Allow only relevant INTR_STATUS
 bit updates
Message-ID: <Z8tV+sBt+q72pqgL@lizhi-Precision-Tower-5810>
References: <20250228141802.1344453-1-jarkko.nikula@linux.intel.com>
 <Z8HduKx0dzRAqRev@lizhi-Precision-Tower-5810>
 <6947fe08-f479-4692-a5d7-5b54496e4909@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <6947fe08-f479-4692-a5d7-5b54496e4909@linux.intel.com>
X-ClientProxiedBy: BY5PR13CA0032.namprd13.prod.outlook.com
 (2603:10b6:a03:180::45) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM8PR04MB7282:EE_
X-MS-Office365-Filtering-Correlation-Id: fbc64bc4-5da0-479d-d067-08dd5db61224
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EBLBCiPUYcVrBPHKJI4kHNaOBKZVvsyDMua10oMZK6Nqd4mqPLUOUSkgq8vo?=
 =?us-ascii?Q?RTo0+Mu4unHFoXudIi7/bHvXR+gx4ozB0bTRBzJQ36EpcioKhrS/E+Uiv+h9?=
 =?us-ascii?Q?01wVsAMHyalJmWDJZKzgIp9Wlb02U8/Ab/z2wXAZgVkeq8iVcANUIG75ZlGV?=
 =?us-ascii?Q?nVb/BN2PqcRMmcqLS5X2RPrvADP5SHASaYHyC7Esjn/wmhCXxdvpAf66LIVB?=
 =?us-ascii?Q?Uc/irWcJrACxbylT5xGpeZReoRW7ylQpvzo+nncgYiTut+MWYMgOFdfCqAd0?=
 =?us-ascii?Q?NVeJI59VXLA9Nh0NNwBTlUU39Y8MHNK/iqa9SFslAhUF8cGNaVnmB8iQUqTS?=
 =?us-ascii?Q?aL/kBfltO49Hjiw/1Z7VPMIiIyo93u93G+4RfyGoXTv3QS5t4ECUIMVEL2+n?=
 =?us-ascii?Q?Pct7CAvRNK4cXK9LzshPJZ/rofoqIVRsyscZ3Abl9yU6088zEpHzYQ0rf/Iq?=
 =?us-ascii?Q?NbaUKnXx5/MjMGtwzR6VreLsTsvAljcH3PuGPVLL+9v6kBmwrgyvklryhiCd?=
 =?us-ascii?Q?wgd1iDvDelnmV9iSTq5E52V6sOVp17Y6hM8ztWhM7wERdc+oYcz8pNuGvjDR?=
 =?us-ascii?Q?RlFfvJAsgwX01h6hA7YmYeyOMVy2bFPuamI1iyA+v+HaQqbLDoJRSx7Sq2W8?=
 =?us-ascii?Q?hCxlfDaIuBnF26XvG2HY4c5iKH5k7pb8s74y/TtbWmZqI1GeGC6NZCRb0jJ7?=
 =?us-ascii?Q?Dukn6FSB7PoRwN01co91mVm0Tve+t8tYOdYnMRSmcsmQj38XqJLb2V22yUS/?=
 =?us-ascii?Q?0JumECaUbhrfLnJ9W6YwpBh5n2W6lDa1ZXep14gJG372b1o0G1KZjXVxxPKN?=
 =?us-ascii?Q?+cLZv5k2x7uWW399ukU0YipIS9Cnil/+PAvwy0Rgrv3ATuV0y10C5xVR9j+E?=
 =?us-ascii?Q?tHzKRyNtIKsw1aJQt2DfwE8JueZc9MsvHc2NC9vdkcIm4Pw1tczwyYl7EFHP?=
 =?us-ascii?Q?RGA/RGcU6yMMgTp7OfFJetXxLfa8O7i2zjCGavWK8AliGGBzpwruAwymYCJ8?=
 =?us-ascii?Q?RlhmpJn1Iz/qO9npQZdiUSodRRntz8nEzQ0zozeiZGPs08+Yr98hYqTj6eG3?=
 =?us-ascii?Q?Tly2VKL8+OdV6sqqPrph4o1f+i/Fk9dVWJfm0cBaIu1M3X2g4L4JG6QGvh6l?=
 =?us-ascii?Q?baRSRGXr1mDSJARtgxn4mKwb6LcojpXBD77VjoZ5SsEqon5PTxet2RkxqXrH?=
 =?us-ascii?Q?kHAJZZ8W1xns2ZzadDb+h0EGFqV/jjmsYo6SxRFc7q3mHkQvHVP2+FRMJ/Ed?=
 =?us-ascii?Q?LSBSKw0MkkTP/5alPEoxDP5RJX5xpDw4QPSLjo4NT8G2SPA9I3rEtZsF8Lc6?=
 =?us-ascii?Q?H1j54cRICkeVDB874tZSkfeiKghdjfhPnw+wNIgb62r//HyuntNa32ti19az?=
 =?us-ascii?Q?euv2x3Xe3KDKEnlGzE2R+TRYK5SrbhB4aXxufL1iGJl0dNQZAp6RV9EYV4Wj?=
 =?us-ascii?Q?8LYbC5uQSRpYnyVDBcHqnrYXuzqfCcmu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1CSWh9eWeXdfnoN0ED0ohC+JFizbNZ5L06Qb7HgrQwyOXiItXFbEM69oeZsP?=
 =?us-ascii?Q?kr3LuUmCHENdUFT+hqMnSgDTziml7+8bgq0ud0CmEfCCKfqNu1VoE7nc+KVS?=
 =?us-ascii?Q?SG3Hq6XMskHuPb6tulmi4b22O8E/31NZhj2kOsbd+fRxk8MeSGkDu/Zy0s1w?=
 =?us-ascii?Q?sWZ13u+PztRQYLGs8OXKNIsqNWaAKh7lAAjVCU6YxF3Nx6vLUojEM/Je2O77?=
 =?us-ascii?Q?ssik8ZEutVpIqeA6ZpLlCZMv3jPTTyE8ipEmDqZqDyinDL/B74vgV6Mg9DDi?=
 =?us-ascii?Q?6W9fhTjyOCkPLU6W66wuKaNcGt8xT+BqEmiwrQXHGj+pFMPaJEhePnC694w6?=
 =?us-ascii?Q?aCkFmMCVAA43lUdAYwGIuG8mQfXvsnfznaxTAAIIFqyvEIL4/I44mhHrRDBU?=
 =?us-ascii?Q?CpDogkADVNsISxo/S+j9KCclh+R/oUJaI4UbwiMRKQGmDsFYLsvmhTkYTbC4?=
 =?us-ascii?Q?ypd6azBOCFuRYPMlAY2qyRn6bsboPKqzFy0+niIEs3dqaCg7N2w+M3C3SSNN?=
 =?us-ascii?Q?/LqJUDHhEuioNY6pGMTXLwiNDpT1ickfAHKi4BX73zcY402uzIpAmDdk6VvZ?=
 =?us-ascii?Q?07Ux3UmiFzxfGe5Zy1E9Sj0WhzFm8eueagu2vYkDuAXQui0YUmQ8mJTRpkuR?=
 =?us-ascii?Q?taJ31ei7vApKL5JT1Grh8q85uc4Rgsmpm3xy8R5QQVpBq7sO0KeOxyYmJJek?=
 =?us-ascii?Q?TcFxLX0JfCBACU6oM1B71n3OPg0qMIH5ugs8mcx9m8XUjI1gASZ4UiZBY7g4?=
 =?us-ascii?Q?oCRJg9QrVHKK5hlxJcC15u02aGA3PUOqxtTdh4ML1t1rfesYq+Tit3wQ5T6t?=
 =?us-ascii?Q?uwkicEcH06GGaueuh1OtdMRYS8zv7b2/O+bUygyyd10Zn4wD8sHJ3wv9QYR9?=
 =?us-ascii?Q?3ptqj3go4auXPRWn7pbB1D6Uf0dupKY/hUgxuxI+qpQxh17GZHn5Lu9fqG3j?=
 =?us-ascii?Q?rAqaJClEzrha8pCuahRaoNYKplhQvpjgcsDcrPxnrt/Kp30Y3Qu8jT1EBtx8?=
 =?us-ascii?Q?w62f5DkIn20tS3XPVzPyXWOYKCe4ERAMjlEfDGb0jVJq0YJx5Ie5b8iF5fop?=
 =?us-ascii?Q?LSnXFmVFlOMDHKKfN1JQDxqMQJJfugD9yHt5+f8Pv1uWpWsDOW1QeD/xTX3v?=
 =?us-ascii?Q?UMpqtB440reyPg7dIsR/TlHp4ARUUi5RCQVde5pGlxzO5JFk8BNgi4LCC2fV?=
 =?us-ascii?Q?u3VPQKhmKNQ0WVNTw5cfsW1K8KNY1HxFVnIADAlYJHXYPGoJNPzii07bWref?=
 =?us-ascii?Q?8EsIC7rTpInXsDDGvijzfvpmG4ubQsSjLPNYyfsqAAyQeckNETY4kYeSMBQh?=
 =?us-ascii?Q?vzeURO2nr298yF53AI5mKkR0fjEBXlJot/BkcOyllS+5QHrbblWrx+ZPrhvc?=
 =?us-ascii?Q?qbSyJds6ip+TmqXkIQrrksA3Pl3RwThQymLhm72rNsvBCanMpiyOTx+6BJ7z?=
 =?us-ascii?Q?bkgMEmL5HYJ3zmMv80WxAQet+9OKGWAYmmKa/mk3gCTUaTMM+fEBDgzUDjHg?=
 =?us-ascii?Q?hhvj5MxYsAvRc4o+V8iw9qS8zkDWOIamRMQm4QJsTbTRX9cJ1DQ/ZSSHvti8?=
 =?us-ascii?Q?0p782kbvzLuUQ7IQ84aPXwlj3tS/cOcdyukoduzZ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbc64bc4-5da0-479d-d067-08dd5db61224
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 20:24:32.7711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eswb4xK/p1KraseCwpGe3bZEDAepMPg4mgGHDrl79PnEh3Cfj+j9V6T/n+3kIbxL4euagz5qRhwzJm5MoQxqTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7282
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_122437_077311_BA1C24BC 
X-CRM114-Status: GOOD (  38.09  )
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

On Fri, Mar 07, 2025 at 11:14:06AM +0200, Jarkko Nikula wrote:
> Hi Frank
>
> Sorry the delay, somehow I missed your comments to this patch :-|
>
> On 2/28/25 6:00 PM, Frank Li wrote:
> > On Fri, Feb 28, 2025 at 04:17:59PM +0200, Jarkko Nikula wrote:
> > > Since MIPI I3C HCI specification version v0.8 INTR_STATUS bits 9:0 are
> > > reserved. Version v0.5 has bits 9 and 5:0 in use but not handled by the
> > > current driver code and not needed in DMA transfers.
> > >
> > > PIO transfers with v0.5 would require changes to both
> > > core.c: i3c_hci_irq_handler() and pio.c: hci_pio_irq_handler() though.
> >
> > If reasonable, why not change core.c and pio.c?
> >
> I had two reasons for that. The v0.5 compatible IP I use in testing doesn't
> support PIO transfers and thus didn't want to add code that is not tested.
>
> Then I believe perhaps nobody will release HW with this old IP and thus it
> would be dead code anyway.
>
> > >
> > > For these reasons don't enable signal updates from INTR_STATUS bits 9:0.
> > >
> > > This change is a no-op for specification versions v0.8 and beyond but
> > > gets rid of "unexpected INTR_STATUS" errors if somebody (read me) wants
> > > to run code on old v0.5 IP version.
> >
> > I think, simple said
> > "Get rid of "unexpected INTR_STATUS" errors at old v0.5 IP version and
> > no-op for version above v0.8."
> >
> Makes sense, will change.
>
> > >
> > > Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> > > ---
> > >   drivers/i3c/master/mipi-i3c-hci/core.c | 5 +++--
> > >   1 file changed, 3 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> > > index a71226d7ca59..e139d7e4d252 100644
> > > --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> > > +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> > > @@ -699,9 +699,10 @@ static int i3c_hci_init(struct i3c_hci *hci)
> > >   	if (ret)
> > >   		return -ENXIO;
> > >
> > > -	/* Disable all interrupts and allow all signal updates */
> > > +	/* Disable all interrupts */
> > >   	reg_write(INTR_SIGNAL_ENABLE, 0x0);
> > > -	reg_write(INTR_STATUS_ENABLE, 0xffffffff);
> > > +	/* Allow signal updates relevant to IP versions 0.8 and beyond */
> > > +	reg_write(INTR_STATUS_ENABLE, GENMASK(31, 10));
> >
> > Generally, just enable needed IRQ in driver. Define some BITS for
> > difference type IRQs.
> >
> I was thinking too these need changes too but decided those are better to do
> in another patch(es).
>
> Currently all of these generic interrupt sources are disabled so they won't
> generate interrupt but their status will be printed when handler is called
> due to DMA/PIO interrupt. Known bits 10 INTR_HC_INTERNAL_ERR and 11
> INTR_HC_SEQ_CANCEL will print their message and unknowns just "unexpected
> INTR_STATUS" with hex of unhandled status bits.
>
> Bits 12:14 can be defined since v1.2 describes them. I'm open for ideas does
> it make more sense to allow signal updates only from known sources or keep
> all bits enabled so that in future IP versions "unexpected INTR_STATUS" can
> be seen from user reports if something odd happens and driver is not yet
> handling that.

I think we can defer it until someone really complain it. I am fine for
your current change.

Frank
>
> Another change is should known generic interrupt sources be enabled so
> handler will be called immediately when that condition occurs.
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
