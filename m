Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B95BCC5CFDB
	for <linux-i3c@archiver.kernel.org>; Thu, 13 Aug 2026 20:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2mTgfUqACfq5BClGwVie9qPeXiCykjSKgMZ7H0L5Gos=; b=1pxtBM5vcvWKYd
	rxV+3UZ7qqeIiWJDG4LSCHXUEH87zHj7ZUj9PMIw+h0H8b4CbZUM/7FVFPK4i59GfnYQPexax7+na
	XPcu394epU84uG+vDrcYc0lXnltqQMQ35jsSz062wkLb6dG7yxxzzFla5X0wss3UbQtwA+8aPS5YT
	sm9YssV3g6YpIdgY4mgScKIJC2pBHjJ73ATnsswLiOkdPbGWsm+I6hD9AYg9fN7UIuSJGqPFfFfY4
	hBQF1j+oNXgsX0ZP3GvzN0EpGBcapeAnUkoDCx7PbewnGTKVjpZyQN1uFDDJKYO6qkNQxrJhNRMWv
	23qNJjk6m8rneySnDmKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wucIn-00000001Wl9-1iJC;
	Thu, 13 Aug 2026 20:45:25 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wucIl-00000001Wkb-2xVk
	for linux-i3c@lists.infradead.org;
	Thu, 13 Aug 2026 20:45:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ctcVoVJ8Lk1HEGYo5nTwPsZZnLXCsdt4YduDu2H5qo1R7tiKxArceyNVSAao3rnTW54693+7qioVXLTGNr51Hf1WFoxuULItDi1/SbEZwpcHSyluCCtTr0aRw7zvDwmAdKhYF+5gULZi0gl+GprsVeEz2SUbW4sJaGKMGEsKmfx9e1ONuh4arELqmauDkLH/wLF46G4TQvoHA9OxTFxikk8mgkacu8fY7+Y7cfOLljtdCs5ZCUgJzS1xb/zhhisJ2RekWSr/Mtj6XCAu5DIf7s3JpPN/BR6xQ9eWeS7zlmKrTWZauP09+nHduWFG0p9WYt45/G6126NE8C60mhIk4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TC7Uk540XlTDNsmzW5MvS/XRjIen6R3Dp7hPlRVePKc=;
 b=HdXaqSyYkDO+TLiVUrqKX+xMwAr72P1OuV/RPriAlLg4Uy2Bxr75XjA0htiQOMGDWBX/MVfav1FpQBJuG9OuAlIXjzOe/MD9g1RFkmwXjEqI/eC7zZV10PCI3mTFtt24z35ep+iPQUt3ouosZ1tqgetwtCIFRs/BlhlTIBUv9Xfly9OdSBGWT+fpm7PNZGiI7cvzSZKKwAZ8DuXm1mfG6CNvLTSq7iuWhSzCOKed/z7CBFpr3iT8mJ6pKLSDL1P1Qm+6xhUjKBU0xa/Z0QsFf5JtszQU6l0+DP3Nbs2yhMnAiuxmNSCw0LL3O251CLnpwE5g79HZwMk/KMOE6DcsAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TC7Uk540XlTDNsmzW5MvS/XRjIen6R3Dp7hPlRVePKc=;
 b=tc6FcbPD08yjc+QN7lLJEUb1tk2Ag8aY8UPGtmCqA4lvjiboAGoLU+u6LNu5HDZLa7gD8b+DUmNgsJcKV3gB9Iz4X9mjCEOY+yk4nkraY0TnouqiMmv47eZNPJfHfgOZac+RzrcftUKtr63rKMVQdj2sKi0P/KqpihS62QpGai4aFanIb9D0bWyxFR9b0bQY7A4Tx4XgnPXgaerHeYiZsBYQviXgdJ1IKU6F5M5UI/YdXvp+N+IDjNNzxvD66+D+br8LTUlRpo+Hwq+yWNRo06abqvtBFcsMAYh22g4aXOYKRHXPYe1M97IMn3nuQ4BYNmdAeYEYUZL6TfZjBpudEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB7697.eurprd04.prod.outlook.com (2603:10a6:20b:2d6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Thu, 13 Aug
 2026 20:45:06 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 20:45:06 +0000
Date: Thu, 13 Aug 2026 16:45:00 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: dw: reduce do_daa time if there's no client
Message-ID: <an4szPcr_GFmcSFw@lizhi-Precision-Tower-5810>
References: <20260803140307.12665-1-jszhang@kernel.org>
 <anOXjxCRfW4qfPaM@lizhi-Precision-Tower-5810>
 <an1OaevoSHlA8U1n@xhacker>
Content-Disposition: inline
In-Reply-To: <an1OaevoSHlA8U1n@xhacker>
X-ClientProxiedBy: SA0PR11CA0116.namprd11.prod.outlook.com
 (2603:10b6:806:d1::31) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB7697:EE_
X-MS-Office365-Filtering-Correlation-Id: 37bf11af-b207-4f81-9386-08def97bc1ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|23010399003|22082099003|18002099003|56012099006|11063799006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info: EBBIaFfhnF+OSEDjt0rWr9TYGmRqVzjx/olRRFK9YXkoRZJ+Lgur+ppVTDwuc/c/vGo+wOpYcKqQXwNavSnuYKgTGtJXVyKMX7y+Xi4iTI/ZT0Kg0PhS9ZQPLbbtR9qrDUMCDYhxPPG7q3aiEnelanswzlUd+yRT5lUxxwG+7rs0MldVlgOzZjfv7Ty9/nSJqpSftWmKFzGa+T8n/teyRsUVpEMm1+7a3G9OLpVOKprsyYH/xdbWZEppJJ/vFA+9zbY51omdDg2/gCtKM8jxKs8I6XVoccY0QERo0Vk5iY5n7TvCzAKMpc/Ys+fHRNwTVEHAdoLoksIF5b13I75GqwktOfSJ+AH05kRXatZuqKmTfifST8Nrj/mWwepXYNoeaQmFqD9bWRXgZ7NzOTHwb1Ck2gJhBoJTPiQE2I9Jo9kk70F6ipeMBTjKncqIeZdnrssI/TttJulYHa+5KCW+gtNUZ8ysuvSYQ6eOeiKHvm8jwcf0A1YAhdt/Oo8exjSYSj2flqgHc1KjeqFX5AdmDqKga3ksMFcz/JkQyGcmBwfr4f4XfrUx2yWARsvNqPWkf9fLt80uhz2okquSJkAlv28MUsskaFBXXnld7DpHnjMfS3yCOFKAIZ7T8zteyqJacETpl4Rk4wW1qIbp/5uEUQmTvauQI1nVrVaDRqj8LDs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CCYc+hJgnYF5uI44xVH09FK+i4x2WIEzsbbwRgNm8/g2tIbViMdX76A1P5Xi?=
 =?us-ascii?Q?ZoVZ30Z5b5zAuG3ebyukpyCMauCIWSeOEb1Vl7DxcpHK+RUk9LA/KjMxce3h?=
 =?us-ascii?Q?yhwdKZKC4tGLxG9+IpMD8A1m+aTKIGtmkGqkvyKxrhOJbDFkU6gY8sTaz9MT?=
 =?us-ascii?Q?sJuFes3nEasJJRnNo0YjdJKZ7fZxww15ZhqyMvJ0aQriJuWfOkpZZCb0CfZ2?=
 =?us-ascii?Q?DH99cLoxTSTsIZt/OXhyzl7kkonqR8yI1cQBAKDTlCW4sTYh/HdmoxMT+hZI?=
 =?us-ascii?Q?dvG8dGkkFp4C79v/ReleKH0wcrtoz6lL0dbIilD8oVk3aijKskcuHlj1Krtu?=
 =?us-ascii?Q?AbX4y4DRT+ZpzBesBsFYqO7P1GadTWGi62ns7Xzkl2SE9L65cGya43NGHAm6?=
 =?us-ascii?Q?DxjOaixT+q6NWpbJ0yiCzTsNTeM7lt9AClj95QqNg11z8+xcLI26DTOaka3G?=
 =?us-ascii?Q?VLqK8sSk1plcmjw9hQwm/xK9fY/98qw2lqBlAa2hZzMCnqUQc59uGfmU5Rj9?=
 =?us-ascii?Q?T+K/T8S3o/ZNLGDZhRNLJL34LUbnQ5+mQpRrA/CIIu+H4J0j20QmfFL5rxYR?=
 =?us-ascii?Q?Q1qDRdnGmdfZp/HISSvdXYjnKSUrGk42rjXey806uw9uOvljAAyplqXQUyjA?=
 =?us-ascii?Q?WJ+I7nwhXxwHFLGtLLJmOaBWMk8QcrDXXR6v2UKucadrx9qzjXl1x909M0OE?=
 =?us-ascii?Q?nidMPGf+BUOQ2MpovalATLk7d+s1KPjOq5j1JiZRPIQG4tBQEjuuu++0bwhY?=
 =?us-ascii?Q?v5V42/Qf7kINUsLIFpcDhUagYMlh3NyZMtUfMytdSLKh3gaOcdO2wzMpmdy7?=
 =?us-ascii?Q?FClshcdEKisU60T3WEG++IggV1VwIi9r6o4UcS6C2yggEoeyhMHKCSBgcsD3?=
 =?us-ascii?Q?XidEfOuVy/41CqAwBRTqb4SLwXbyFmVgay92kXU7+dHpiW2DyuoYMPwv5ecj?=
 =?us-ascii?Q?gAhUkWJtK0hokWQQTKJV8FoRU4KhCz5M/yxL/TC3r53UnPJQkVTeQqOCAWoY?=
 =?us-ascii?Q?WtWGpX+tRUqqIEQ1Pfa1wzPrZ2qCyYNNq9EykajP1UbXFfhqtXpylxa6Ww5A?=
 =?us-ascii?Q?lsElx3VuDRawRSlGItHjtQw6+XyfPUaQw9rey5hp+MDMoyF4S6pL0zcsK5i0?=
 =?us-ascii?Q?51lEt1i2giuTyl5hU0GFSbUgDDEO4uPPWDSrBtRsy+YyjtgGESiLNKDZ6dFM?=
 =?us-ascii?Q?1UhWHwDkqNgwQuMQbhf+Ng519/3R2k85JGOXCaSixq5GMie3NpMl2wABIMur?=
 =?us-ascii?Q?qq1dAXkxq6akQd6DzoRMGM15ei0PicZ7gD+XAPKU2IsmsqJrtAKH8ZAqeU06?=
 =?us-ascii?Q?pfDP6K4Wa+C0yPA5tpQBQB6o8Ch00WMziNdChWyGpS5TGe29/yjGhLtOpoaA?=
 =?us-ascii?Q?jiJwm411ugahpRVqoCwUY3COjhWHYi0YuzQS8GE3XTNTJCRxfDa2kUlDfeul?=
 =?us-ascii?Q?CYZ8JbIXEeJMV7kwgCW+RKfGYdB4URlAFpIflh0Gb3hxILjij8xSGyWQwqbv?=
 =?us-ascii?Q?v0Cg6/EXIaMJVquS9c0bc7lGdGC6ub/2931Q0IXtcHukuaV9sPgKlKF/JcTJ?=
 =?us-ascii?Q?VT2A46DnM1JAKw2hHKdMuuQteqZjUqvpxmGOsVBJsEhGrWPJkA/lGn/S4BYj?=
 =?us-ascii?Q?sNqxnj7rIKNEu5xDqdaMvAtM5P8qG+EyoL/rLhXLBYu9LKpoOIS/lP3JT22W?=
 =?us-ascii?Q?ym+uD1fWyg+l7rFLWAlYpClDRAl6hfweiq5+Jz7eVqusz1yYtORfgKPFWAE+?=
 =?us-ascii?Q?6ppeUbbv6UoIvenlRsWVq6kbjaitSv8reuYy7VxVH7QjKH5LBlFv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37bf11af-b207-4f81-9386-08def97bc1ec
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 20:45:06.5652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zXyiQlKf+QAkg2bwI96X770YrJmi3yGrMxH5/0m9hoNmFJCV1q46nG8Ax1Fl2ms2gfUkQcAYZgxSSOUzJy9xVmFhF0YURAyz/SkaoyAbc7KTipc55RFBaZ6AaRv6ULFY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7697
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_134523_746026_39A582A1 
X-CRM114-Status: GOOD (  22.60  )
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

On Thu, Aug 13, 2026 at 12:56:09PM +0800, Jisheng Zhang wrote:
> On Wed, Aug 05, 2026 at 04:05:35PM -0400, Frank Li wrote:
> > On Mon, Aug 03, 2026 at 10:03:07PM +0800, Jisheng Zhang wrote:
> > > If there's no client, wait for completion will timeout, then there's no
> > > need to add i3c dev at all. This can save boot time by ~6s if there's
> > > no client connected to the i3c interface.
> > >
> > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > > ---
> > >  drivers/i3c/master/dw-i3c-master.c | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> > > index 0625587f1527..18ebf304029a 100644
> > > --- a/drivers/i3c/master/dw-i3c-master.c
> > > +++ b/drivers/i3c/master/dw-i3c-master.c
> > > @@ -885,8 +885,10 @@ static int dw_i3c_master_daa(struct i3c_master_controller *m)
> > >  		      COMMAND_PORT_ROC;
> > >
> > >  	dw_i3c_master_enqueue_xfer(master, xfer);
> > > -	if (!wait_for_completion_timeout(&xfer->comp, XFER_TIMEOUT))
> > > +	if (!wait_for_completion_timeout(&xfer->comp, XFER_TIMEOUT)) {
> > >  		dw_i3c_master_dequeue_xfer(master, xfer);
> > > +		goto rpm_out;
> >
> > not sure why save 6s. timeout already happen, does register i3c device
> > takes 6s?
>
> sorry, typo, s/6/4
> For example if the maxdev == 4, when there's no i3c device connected, the
> max cmd->rx_len = 0 after timeout, then newdevs = 0xf, then go through
> the i3c_master_add_i3c_dev_locked(), each take ~1s, so adds up to 4s


https://lore.kernel.org/linux-i3c/20260731070150.2519825-1-tommaso.merciai.xr@bp.renesas.com/

Need fix newdevs, it should be 0, not 0xf.

Frank

>
> >
> > And if do_daa find 3 devices, then timeout, you skip register found 3
> > devices.
>
> It's the addr assign cmd timeout, so if 3 devices respond, the addr
> assign cmd won't timeout.
>
> >
> > Frank
> >
> > > +	}
> > >
> > >  	newdevs = GENMASK(master->maxdevs - cmd->rx_len - 1, 0);
> > >  	newdevs &= ~olddevs;
> > > --
> > > 2.53.0
> > >

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
