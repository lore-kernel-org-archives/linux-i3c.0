Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C147DC7115B
	for <linux-i3c@archiver.kernel.org>; Fri, 20 Jun 2025 18:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oQ5yNlvUXEbSrCcdEwNJ1lHPokd+hRti39wgWWNqMgY=; b=28B9BQrw2ajQhE
	aLBffK62MO8CJ6JkMeIlBKmrK0lNkECJwI1bjHxErKUJVTrdb+XeksA7BnVr8cWpXbFL8T/qIkR2y
	7TzXO/JOT2JhQStcrPVYb90sU5LdpUBYN4bQYERos+lkgUdd7T/BUAhNHKOqVTSW7ssmn36r4kBSz
	LL+jCi3hiyrMjt0hEkAi8E9Vc3EHH0HMXrpKEry+duSQjVCOh8YvvFc055eP26uXr+bNAQ08IeTt6
	GhBUJpVdneNUBtBXkQRXSQDJElQowhFEvjgaCFSXGbl9QIsmX5hhfi9vxUr4Fk2YoNdrLiB4Wl1Ca
	UtH/k4U3GhaVVEXQVcug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSgak-0000000GNTK-2CEl;
	Fri, 20 Jun 2025 18:35:58 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSgUv-0000000GMgE-2OlF
	for linux-i3c@lists.infradead.org;
	Fri, 20 Jun 2025 18:29:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JVpuukPyAf7w6XAxOKcosmM5tXrV9BSsnQ1xRPoBUvWDHoosTmGRvuWL/PzE9beQno2tMzVtxf9+Nl5lrQjeZMSPHDgmGVTdZB1LG2DyLSdykYj1xTnZg43Zq7A6e5N0NRMuJyHgt573MSx+Z81xCFtgTmCc6/YfpAI6QAHUrWKh5umVtYTQ8B53FovmAF2voiMzbii5b96SKEJEa0E0l368GPVz3pccpTbwmkQyeChyWFlMB6VskHClpzVgekdMU7mMdkDD0Irl2s/vdiDwVliCNA6PzzA4j7OI114S8TYwqfJaNcOkSOBUaEmyHb8KZhYiovfLQzJ1RqF+NqhFSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bfIFh5nUxAK0g250P80aH4cGGm/GMR7duQZs1BVFdu4=;
 b=WdD89ysHMe9J/eRWtqDHI9SHy9lov04ni9lntfrg6/9ATRi9q5TF7BffKFg6AsuiVCCaI2JeH0jZ7C7IHDbPO16tXFmdkZdIgmTwS6KqaiDsFjjVqv2n4aZ4fhnvjKBGGQQTlw60lETXGf81XXa2E8xei+idu+q5REGaKsK1FODDTbwo43t6swVZTTZkJ3P+BvAYyjgV1iAntsUujgc1d9MjGVusuGvmDNXbbwV2c2hVqf2H0CulOMeudGu+wamFDsYzLV55r3CLXQ/UjmNeH6uaXNgK9MtNptFG1PGN0ZCljNVKTRvp/d+Rqaxe0TvQ4bqcB5J3ZuHibTIxMRfHNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bfIFh5nUxAK0g250P80aH4cGGm/GMR7duQZs1BVFdu4=;
 b=XgDTtnBjzFL2SqLnMt53CVifgAAAvI1EP9wrbNzbkDfqSXgEkc0zJsaQyZrAQmrROyUeAXEmb72Ljw0tsglHFNGwTYz4on2CQZMLiNWZNvV/hRWxMsxLis0pY+pUgb23ss60QrxJFLiyKmc2LnD1FO5SDJUCveZydi4+48Cp1kVCfi/FgPJ4G7OAgp60kyWwvXtq1wA5m6n8utLnLaLrfmyvOj138AxyLCo84K5vNkPYNoPJnIj3k3fhtzKfsp3eBRtHR0T3yqaZ1TT2y68UIRAz1h3JGDEIblO4LLjwv18059+KhJsSU8t5cTxa5JMtJ9R+PVZhm0C48uYpqbDMzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GVXPR04MB9949.eurprd04.prod.outlook.com (2603:10a6:150:112::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Fri, 20 Jun
 2025 18:29:54 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8835.027; Fri, 20 Jun 2025
 18:29:54 +0000
Date: Fri, 20 Jun 2025 14:29:50 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 1/3] i3c: mipi-i3c-hci: Make bounce buffer code generic
 to all DMA transfers
Message-ID: <aFWonk18She5+cdD@lizhi-Precision-Tower-5810>
References: <bc599310-9287-4023-a204-682771574528@linux.intel.com>
 <aEG0DitRE/49aXI5@lizhi-Precision-Tower-5810>
 <37051b2a-0969-4482-91ea-85b1a9c2fc5f@linux.intel.com>
 <aEMDCi7RYbQud7WZ@lizhi-Precision-Tower-5810>
 <367523dc-d91b-4792-ab8c-f8d7e26379cd@linux.intel.com>
 <aEb38qRGQ5AIqy7R@lizhi-Precision-Tower-5810>
 <ebc6a6f1-0c9f-4ea7-8af1-585fce6ad9c6@linux.intel.com>
 <aEhmfNObvH5Dm4+W@lizhi-Precision-Tower-5810>
 <aFGFNdM+F9SUQIgi@lizhi-Precision-Tower-5810>
 <8a3b32df-b687-47be-ae4b-99008d000542@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <8a3b32df-b687-47be-ae4b-99008d000542@linux.intel.com>
X-ClientProxiedBy: AM0PR06CA0093.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::34) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GVXPR04MB9949:EE_
X-MS-Office365-Filtering-Correlation-Id: ca58a838-9c4f-4d21-b770-08ddb0287373
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bNGqoy77gf9JI101lU66xEO+s4rmSCJadL2p7tDqp6wwmvKahoMRGSSAYaUR?=
 =?us-ascii?Q?8nxjpFUg6wYkq7drwy1iD7lSslYJ/mz5iyVED8FrTd3Z2biogNirms1ZizPb?=
 =?us-ascii?Q?gIj5ckWT3qFIYrFOvxZ4g2O+1uTo/sLkCsvE76N6W8A1DhI5sEGDpHwNXE/r?=
 =?us-ascii?Q?JWzcnJcPBYVrfqnZJ8Ei6b3gUSgf5y+W75+m2JtRjNxKbz/NxfN9gU+4o3J3?=
 =?us-ascii?Q?wmcaYmXOznQ7P1dEsoXo/q/uflW/575NXQSJTnIAXiHG+VlHhimZ/oWpuxVd?=
 =?us-ascii?Q?6+W2tkK/PaVcrNPwiPs/m7lVmRXaZ/yul8Lk5jmDxqNGwAmgM2k+hCSpYg4n?=
 =?us-ascii?Q?u/ffoH6TUQsFetjBuGJx0y54AbHnSjCuHPOi9MIvaBUyousd2Q1nkmqv+60/?=
 =?us-ascii?Q?JEcVX5/V7pljWsE6nW4hn0UZJxuSKjAZQOZTmrR82B3CGcEFtyOHxiY6QNtM?=
 =?us-ascii?Q?PKuPvs6euu+atkBnW0wDdgoVnV9Agu2tttUwiZR/jH+cn/nRiviWgY5UX9Jg?=
 =?us-ascii?Q?ZvWIVeSTgxJ1ECOU727EMQYHxFtpGjpV8+o4A15vIu2yD4XptI+OmgY+DqZl?=
 =?us-ascii?Q?1E3Z6sPxLbXeiOj0z8U0O50KhU5jhvAyjI37YrGXj7BTxKKnQCkW6q4X0E8t?=
 =?us-ascii?Q?k2eKIAC96gYNfMweYW/3OrcYFoPS+IurI2c5mdqojSWUdnPEDcHLExPeNhb9?=
 =?us-ascii?Q?SBs7Tuo5v04960mqdJa61JwRJ1W2AwHy0f94lKbPeZ1jDurnNtNl0PAL2IYi?=
 =?us-ascii?Q?XK8NN0mVkh70hmm+bVmDx6DXJvp/x5OyOJipZZF0SzGrS+FPUGOpwoPA7l0Q?=
 =?us-ascii?Q?iIYoSkD1SzbjCFiIOInWdsI8ppCQHWGlMZpnYQX5SrF84z52frwUJhkuat6J?=
 =?us-ascii?Q?WUUjszK3/7t6o2C8jyVGHoj624P+OBHw6r9dqXpB4Z+gDMmKzv80L+Soz7RK?=
 =?us-ascii?Q?2bdzz3kvr4z6I4qK2bKoUyawlk8R9839sf4Ri8IwK2CHN1ZiNg8AmGRCDOFy?=
 =?us-ascii?Q?we+j9cPY7LMh5rb0IoxMIIzU1AT/81RjoQAcKpyH/+kpMZRlklWK5ecfs33t?=
 =?us-ascii?Q?+cTl/W16AQp1elYhqiTdfaWXf6wZm9Tj9OfhVTQJ3HLPiQlkTAMnvz/ew+LF?=
 =?us-ascii?Q?XJENx26VprmfHriWCXxKNQna5r8TZUJay5uyufpWeBvd7ycaQcQfu/puFNsC?=
 =?us-ascii?Q?4A+EVRuTGhG1LyqPvrrFNzFvBoNtvhCrcdodMlJi2yd3XLTwQ1LXdaNQQQ0A?=
 =?us-ascii?Q?EktdwkMMDmkXWUrODVL8HLP/88rOJF49B7dOsv7vp7y7uR38ANg6rzV2pp0u?=
 =?us-ascii?Q?q7J2SN4PvHzOfFSjljvzhZGWcOQzGt2veRqRaudJJzfhGrlvIWyPL7WpEFke?=
 =?us-ascii?Q?jOzFINA0oD2saKljEYN7RGbCz5Z+it0JTtQC6gARwkj2uvo5m15XwPj8NAje?=
 =?us-ascii?Q?nf/iExKATCDfxNlm+fA9e0w8xuOSDipsIB0H2LSp0TskQEkWfd0VwTEmxt2U?=
 =?us-ascii?Q?cgAgpfuFBW72Wb4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vWY3XxUnWe2uEGyh1oQiPTZ0emwDtSdkJz0ztsjDOqHDCu5bjQDSfMMMv+hU?=
 =?us-ascii?Q?Wpz08KKKGvRMcscbmFa1y7QwWhUvO9MS2WHjwuLaK3CnRNZNvPgiJeN4sv8j?=
 =?us-ascii?Q?OehyNiknOBSwZOcARU/rvH3mYApJfBPfAX3owsmx9F85LJoeYd/UdDcN1sYT?=
 =?us-ascii?Q?YoVngcwBMw+oiBF7iTZZ5J9qzEwdMnETk+K2ifU1vSSJyUrN1uOuUV1+XSbS?=
 =?us-ascii?Q?v/gGghae4OGR0VdxWbcVegURiHeUVvqLzimqmqRXYBd4o2d5/vxKcO3EPo85?=
 =?us-ascii?Q?poZt295kqJxElmI/E7/D7F4w86hVGgLAae4wps3HmZVq0WEsg4+Oe08qc5dA?=
 =?us-ascii?Q?RcC/I4mI8F8ol1jkLVLjQal+oig1MAar/GYnT8jko8gwGMVoVWK2DQ1gYhqE?=
 =?us-ascii?Q?CNQQe21JG4S/UsQ4Q98JNj9fl8IHNnvBDABCh8oNJeR+4GYSQ4RJylVZ5bqF?=
 =?us-ascii?Q?aJLEGcIRmWsiJciiltBTRW08vs2zonxoU40HT/gnWZbkY3hlvtXOOOjT/+nR?=
 =?us-ascii?Q?4Xs2gv9ddZNB9gI8yjA+JPfMxP+txvkC1S/X1wOBmtUzamB949d+8+1iR5f5?=
 =?us-ascii?Q?Ppv0Rf4jV/Ho6IKJPTd+g/m165JPBhqV+a34xRGvpT0FTBDfqaj/FeNXfp6s?=
 =?us-ascii?Q?Vr8yPxEbPVT1czKYCYC5D5eZWk9vsyJuvEL74FkP+i3kbMWHq9YhziOtO4rR?=
 =?us-ascii?Q?qmw2yo7iHWj0yZgARE5xXe9bUt6uWDztx11ctQZ4oua8luHnAG+W/PXBzdcI?=
 =?us-ascii?Q?ShjrHYsf6+1tlg2NJk6wRG06Yl/6mWUnziBo+bwRtNA6+dNx2TvwmS1rita3?=
 =?us-ascii?Q?z1WuTq4vDSu7ApVGnDOQeU2qdm26/wB4ggYI6vGZIJynVSiVHVyzOEADq0/c?=
 =?us-ascii?Q?Tl8Vx7Amg1NSHlfM1+TUbu8cJJSCfZqFLoQMTRf5tU2K0puqIZck3rajlXOd?=
 =?us-ascii?Q?ZqYv+hzT80KskagiAblbWEJpY5LOvqpt6bh3b2+4tJE/P5tm9j5YE5Z//BXZ?=
 =?us-ascii?Q?OdFfjaKkoB4rGMiHm6iXh4IE6c8cnJ1WwN7p9LKHEMSsgqbFRKCW8Wm+Q7ox?=
 =?us-ascii?Q?cXM094TJwkzChoktxnp0Doy9qNOZwUd/sDRLt9A8Nqr4lRrdT53lkAQaRE6k?=
 =?us-ascii?Q?KTaCaRI5p2NBlImzlVYLMH/sUXfOb8diVTlVpYRDHVZoDVh7pK3HgN5UG+/2?=
 =?us-ascii?Q?TzPoeclx2tYYUVO4jtNOE8xzi+HfcS8esFd0Q+LSUSPrisnq9aLo517RiEQ7?=
 =?us-ascii?Q?jUt/8/D2QutbuKUpBKonNvenPUCR6ihvQV1T3pFbnIlnLJzQVQPrUSnxpMP4?=
 =?us-ascii?Q?Tt1dYx3/z+/mLyQMwmOoYWu0BDtxCaJ3uSr4xY78YFJLm1Nu9l1hsuCJFqfx?=
 =?us-ascii?Q?S+r/tDXdccMHegi/fiCvjDVsFggx7KMRuDyumpLSAy/T8Grt4HcKugbonAQD?=
 =?us-ascii?Q?c0F4oQYvCKsg6nCJ2dIXfTeZfy/8Fz4wgNzefqzXQkX5sjuLTwh3xcTM//ni?=
 =?us-ascii?Q?AySaGJ1B/z3bW/7oKjx1WZ+BV+NFywFiTvFbCNafaatfV4LfxjFnIpfLqRbb?=
 =?us-ascii?Q?XXbPTs38TNsAG7u8JOs=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca58a838-9c4f-4d21-b770-08ddb0287373
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 18:29:54.0298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h4c6E+Z1E+qvkwJibW4a9G1TbwqUWF10d1srv70HJtxlLYt55OAVSd5UoZhBHAMNK8I6FIYxS4C/RJOJU64shw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9949
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_112957_618439_A0BEFD43 
X-CRM114-Status: GOOD (  18.37  )
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

On Thu, Jun 19, 2025 at 04:37:30PM +0300, Jarkko Nikula wrote:
> Hi
>
> On 6/17/25 6:09 PM, Frank Li wrote:
> > > Thanks, I finially understand the problem you faced. I think other master
> > > controller face similar issue if they use dma. Let me think more. If alloc
> > > buffer size is not align to cache line, swtlib will bounce again.
> > >
> > > rough idea i3c core layer provide an i3c_(un)map_api to do that.
> >
> > struct i3c_dma {
> > 	void *bounce;
> > 	dma_addr_t addr;
> > 	enum dma_data_direction;
> > 	void *data;
> > 	size_t data_size;
> > 	size_t bounce_size;
> > }
> >
> > struct i3c_dma *i3c_dma_map_single(struct device *dev, void *data, size_t sz, enum dma_data_direction dir)
> > {
> > 	struct i3c_dma *p
> >
> > 	p = kmalloc(sizeof(*p));
> > 	if (!p)
> > 		return p;
> >
> > 	if (is_vmalloc_addr(data)) {
> > 		p->bounce = kmalloc(align_up(sz, CACHE_LINE_SIZE)); //avoid swtlib bounce again.
>
> I'll try to look at your idea next week. Do you have pointers to the above
> allocation size rounding is it required?
>
> I've understood from the Documentation/core-api/dma-api-howto.rst
> "Architectures must ensure that kmalloc'ed buffer is DMA-safe" and
> "ARCH_DMA_MINALIGN must be set so that the memory allocator makes sure that
> kmalloc'ed buffer doesn't share a cache line with the others.".

But sz in dma_map_single() will be checked by swtlib, if size is not align
with CACHE_LINE, it will bounce it.

Frank

>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
