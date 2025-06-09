Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F485C5B552
	for <linux-i3c@archiver.kernel.org>; Mon,  9 Jun 2025 15:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=40JawgJ9D0aEU0Hr1PRME+x68SlTsOgGqy1tCU7piNw=; b=IJeWzxMpXofvzW
	N0Ye1KNQwjMM41bcg6VQ4O7sudTJIQ8wpLLtyWgm1y+9/KN/4wwHSJlevhYvU77P+KoOW2gBr44V8
	Cgirb4xGQgzKeRWsFFFp5NA52xCy9k5u+fVjDG6bl6PQ7PHUKYvH6fNN/KaKAYFpyeCFRdDHc4RIx
	V6K4xFyVCYZSVbUH0H109T4ppfnRrpfYFPDyil01R9a7Z6nWJkm8NKejQtsxFqZ+npzqw2QE8WGid
	OjtwYdOdbaoo8170oULjCiYEQ7n+cO0pYwq21QhrpQCKW6UCBaDAJZGbRqindG/O0h8bkFGvP6QyJ
	0mJ7ppXJW6kxuHA9iFAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOeTW-00000004WpW-3YCJ;
	Mon, 09 Jun 2025 15:31:50 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOe37-00000004SP9-2xwW
	for linux-i3c@lists.infradead.org;
	Mon, 09 Jun 2025 15:04:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vvtdptUeHV7q89RJODqjokuEVDht0vGJQg1LPyLqwLi2Wv2kzUk3x2ZPsKWr2vZ7cbTPVUJ+VIKGsF26w+1gO3ZAqBKr/Mh0bYTSh2Fd0HVYAYbnOPP0EChE4HeJN0KhTUsVZc9lf9N2rnNidxzKhBhjTGzM1pzNeOTPnfuu40ngR+FotPhMYFGEbGbQ6mqWMGGmq6vBkGVDvU+ZzP44f43/TXUdJ9s+h2okkmDXV3fbrKWGbcouZQnL8JdCDHnupGRZx4NAvyh0JcZmJBUF6To9SPwdJ7KTAhWvVpNryatTzRmKnDZ1MQ8b3wwhbdtHNlLuUL5P/HDATYG0sz+IvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cirOJbEkeha19AlPBBXMiXmDuvbe543dndl6j/ez/OU=;
 b=I0AUeY0UPWmLC9A1i3M98IdwHLNiozuRRS8JVzxk0tFdcv7hxrUt7a3k4Vvf5ZMN2c08AQnBJT98d2gjy/AtkDy3JI/URIzIA3yARLLWW9fmj7X6H+A50sNjgAiQ5UWdZGjQbqjokLFBy8uI/dbvs/2l9RmpiaRSNneVbdjJrKlH+2W4kNEIfXuytcSSd/EEOyvEAMGgKbcZVWWuJvBrnN6zdOoCd+4rN+O7NbfBkdkWK7mMeyiTziX36P9wtou1r9KsB7CrNF474HU+msaQD6G5533gL+5sosbjayRrhacWtUh8pXuwNTpQlfuBzjCgBVQmikMTgQaA42CTVmHdoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cirOJbEkeha19AlPBBXMiXmDuvbe543dndl6j/ez/OU=;
 b=kcJuxZw/fD70lJTf86SAqh5/zeuVQYDzF8l0ZtwDRhUvTjyqi93xYE+Iz3O6kc5TO49mU/tfIz5ClTTl2Xg0eGgS9x+8x6qzTtimKukEBHU7ObBCHFgehonQmtuAmUT2JsrQ2NxZEaArzyYt5cpN2Ezb0SmbxA7tpq2bPMCcwUu0CMUsFvjeB/I6EUXSOCA2ew/i74X/EtqjKYNNTgPXosCEHrq3AbM07J42a8rnO2DDJB9I7w/ZoDfiMDEZkILmG2OCb/9NhI0/1YnHBjMkqWSGRCrnWOEw0osGGEjo/CPTWmLcyxadycWIk5X15G2UW7CZqXcSbYPNNtUFS1s6bg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GV1PR04MB10848.eurprd04.prod.outlook.com (2603:10a6:150:20f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.22; Mon, 9 Jun
 2025 15:04:26 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 15:04:26 +0000
Date: Mon, 9 Jun 2025 11:04:18 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 1/3] i3c: mipi-i3c-hci: Make bounce buffer code generic
 to all DMA transfers
Message-ID: <aEb38qRGQ5AIqy7R@lizhi-Precision-Tower-5810>
References: <20250604125513.1593109-1-jarkko.nikula@linux.intel.com>
 <aEBfpZ6Fa1DoFVS3@lizhi-Precision-Tower-5810>
 <bc599310-9287-4023-a204-682771574528@linux.intel.com>
 <aEG0DitRE/49aXI5@lizhi-Precision-Tower-5810>
 <37051b2a-0969-4482-91ea-85b1a9c2fc5f@linux.intel.com>
 <aEMDCi7RYbQud7WZ@lizhi-Precision-Tower-5810>
 <367523dc-d91b-4792-ab8c-f8d7e26379cd@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <367523dc-d91b-4792-ab8c-f8d7e26379cd@linux.intel.com>
X-ClientProxiedBy: BY3PR04CA0020.namprd04.prod.outlook.com
 (2603:10b6:a03:217::25) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GV1PR04MB10848:EE_
X-MS-Office365-Filtering-Correlation-Id: a4edd863-f1d3-4d6b-0811-08dda766ed3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2hQNd0N4OqwVWpbq4IzJZgrxskcSL4Lb7Jjzp6OBG0MInw8zZKq0U7h5/e7W?=
 =?us-ascii?Q?ELA2H4PxJk3OOov7NYN786ixpNNl12JOQ8rKAxaw6PnSLgNmvAfnPd8Ij0eu?=
 =?us-ascii?Q?HpnnGIzwbj0OlnJewVw5ihQTaEv1m2hA7n+ERUqqQCwE0LW7qKQhyCIEnzoW?=
 =?us-ascii?Q?MB6g0USZ68aJcQdAdAkoM1nHjDp9xw5F/FqSAnvLWhJfkWGbpXEwbONPuRCu?=
 =?us-ascii?Q?nJXk7OWUfKGc5+MtcV0oUyrEVpk6AAaHvP4F6LxhtIDCop7MJZVN5g8mHtsc?=
 =?us-ascii?Q?G8bkN3el8KwlqWm+LOAvbVbd4cBJyjRSDTD6CSFrlmYaQUA2pb8YSnAN/7G1?=
 =?us-ascii?Q?H4TBM5vbQFhoIRIXx1VtDRafSDP139gmJbzkVH+NNnhvpoTv2WSb4yJcqa0P?=
 =?us-ascii?Q?8Ww0F1TVJ4z31jogAakJ+ljsdppplluwk+gAi/SJlB175UWHlLu8nqJ1nFMC?=
 =?us-ascii?Q?OfjMcpptJ9smewz1twP6vSuvBH/HCzkFV+eKuDmey6XVKClkvTYWGbKBNPd2?=
 =?us-ascii?Q?vhyVDh/lXvMGP+HC7TP1xt5giYU7IsRZV2zQx2LVIGqnrw5b3iTYoYpGue7V?=
 =?us-ascii?Q?IpEL9HHUvXVXTJLTsQmKJXSZFTl5Y9tfX7yXYSHT+nwPn0yQE3uySUNqO8Tu?=
 =?us-ascii?Q?lfR0u6XoJaQBTHvgStsDedJWqVMrSwaW0BC6ThJnQn8as9+fuXp5ca8j5/Vs?=
 =?us-ascii?Q?1bpVixjjs3xZX5eiOess7PFC5iIAHRYplVhzVA36bn996mA2zfH33uhyPFJ7?=
 =?us-ascii?Q?Zkbs9+tBP3rXwJ++OKhexXAv/a2gIaokXMWVvTPTwu93p7ktQjjmL/MV4izg?=
 =?us-ascii?Q?iT41YIAGZ+RjDdPQ3fKlcQNksCxNlGitmOTX9rUiLoM6dOQquT/Sj3ADZiFN?=
 =?us-ascii?Q?ftmRzdei8e0haVZSdsZyVaX47TaMoaogcOfJpTjCH3bkbffstop4xL3gZUO2?=
 =?us-ascii?Q?WQ60MUTLNe7D9oR+VuScav3cslNQRm5efOuMKHyEW7H8+YUxRuJWwBJPAf13?=
 =?us-ascii?Q?tdTglHMVcK4NFSb6Z23FyyMvtwRAw84vyDJW47FORnW0MACGtX6vzbCj4uxn?=
 =?us-ascii?Q?h1Ox/Gb9kaOo78xM9URQI0yY9oeIfvZKjyOkfHlN/7+NOAgp5SSVXq0PlOYt?=
 =?us-ascii?Q?xiTbUf+lbP2fJW/E3SQg/xUdYm7GDIxybEW+Vafz1BNr+bFj2a8qIJAfHZcx?=
 =?us-ascii?Q?SAmAcP/tFjO8gp5Lq+5oDh8OTU7ln5XNBVKzOQGdUfhnfjgSEduuLz3jxhUy?=
 =?us-ascii?Q?spNwzypSK4juJrbosFyJwT5S1E1UXt5G0ZTd4NofW6HGOU9qjJuNSuW/3bWf?=
 =?us-ascii?Q?13f3pC7GzpwbKNR8mqJqq8yFaczCiMNBGxgbB8vwCECZhpWSdPpslH2G0QaW?=
 =?us-ascii?Q?4vSHJ8v38fjs+Y3NZpePbZp8pskwEJIGrgI0t0/quYZ3y67OswlrgZUoIG5V?=
 =?us-ascii?Q?mC8+3jIaEkWu6RhpkYa5aXqY5cnX+ZNmH6/T9MmQJIcrR636tFU5uxg2gFjx?=
 =?us-ascii?Q?ikVmCC8j36gEGrM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KuM4JgHTEi1NQnVQCvm+zeh79avjt/Mt2Wx9fiu7yio0TSuhX2Ywzvn32GGl?=
 =?us-ascii?Q?mzxfqGtz/Xkr8YEuoAShw3WTyvlvd7uAGdSUYin9KJDN+u52/8z6AKQWTW2/?=
 =?us-ascii?Q?whoarMHNCgkENsheZpX8fIQt7gtJzaPC3oAws2ScwAY83+Y9x4yU0yyGVUc5?=
 =?us-ascii?Q?OUzrcs6N7Fe6Rg0zeaj5nf8kCt2uLqwQfwxyTMDhXoYsoKXPgAUjdVYUmyRG?=
 =?us-ascii?Q?/96E/4+zFC8+mBnVC+R8x799PS0XCMUgRTHnEfmlhEYoKONTyBGJ/pDDA/CH?=
 =?us-ascii?Q?kydJcvjZb5DvG8ZDnH0rk2OYb/bFg0ZGMgqqb7h4kZ47WLpQCRGsy9PMFJ7e?=
 =?us-ascii?Q?9mEKxoRgNt6cxC1WGm5giWXihzZz8RTs7eYo4B/yopLe65IbIHzmHMast6jf?=
 =?us-ascii?Q?vZYD3yxd48j4vjDKhqPxNgkEpV9A9y0janGhkbJ7DYvopCGrCWZpKW35lH8t?=
 =?us-ascii?Q?GcRtMfTe+cLA2u5HHieNcOL8U1K6LVc1D10iTZfyGoEQRL3vxoh7nZAz6x7N?=
 =?us-ascii?Q?W4Lhg3woQR0b+8hgj3LXZNVwvrB22txtbieD0oWCMomCkiuiOh50XcK6L+iv?=
 =?us-ascii?Q?nqZN+49Y0Gh2wWXijhXmizQxt3U0bkTkSrtyXcgcMs2pKaz7us8xooghuWYR?=
 =?us-ascii?Q?YMjKZ67krd0rWUxWRwyF07cRYaS0NQtgGAjzMSgzHk/s8TzojwXg+wG4ogs9?=
 =?us-ascii?Q?zd2k2G3VQDWQd+ntB4h8tIQ6+r4MDGYfy0SlXBQbugsuYUmtxOc7cahQK/HT?=
 =?us-ascii?Q?LsHr3cZ5p59Gm+ceZjaB0jKF2kjoShtRkXMjpvJ+gnCKPTKOW9KXY99vpBsS?=
 =?us-ascii?Q?IW6jz4JWi+8QY9s6N7YloM+NcIMK0oF/A1zLsY0pqTZRh/m9Qc0FThr4owme?=
 =?us-ascii?Q?G5DNGnJFPV6zDDE+zEisXKxZXzatHFJ8TmcmUGMgdfGqrh4at4HUxiJDAr/I?=
 =?us-ascii?Q?lzqBZWyIhTiGa+2ekdk8NIkX7bHmChb6zHAwgasz4OummM43ldiAWHdwm19M?=
 =?us-ascii?Q?fZ8g2QdEGXlU3JV8kqqKVyG81uxbsvVeVYln4NTcUIx5M9/GgwXfkyCNedKT?=
 =?us-ascii?Q?wiNUvko2LmXg/aaqKOJiCtN5Tm3AFFJb1WXO6ViTDZ/34KGZ6YilLjtwe0yy?=
 =?us-ascii?Q?KBgQsCmpWE8m+g7KFLfR7mrLWhV7PQ0+sqY6z5pVzmou9FUU3bEEslvnxVAB?=
 =?us-ascii?Q?X55p042v3u4WuHr27IYwsfJVcPHGTzyZvcB1AT7fd27JVYMkwiVumQ7KXc6L?=
 =?us-ascii?Q?P3D3l4haamV1aa/yQ2m+UYe0T095epgrh7P3wE2lJ5YU8ieipJB9DwoS3X09?=
 =?us-ascii?Q?GWAeEbbeZAqL2SOWeJitTSItTqRk+83P1tlTOSTyJtP98o+zzXmD6UYgSjav?=
 =?us-ascii?Q?gj5P8+c2R+tGvJ/8pxsKPf1ys6VPrLE88mxQ1NnLGnPHnzqXjC6hcasNzgEa?=
 =?us-ascii?Q?ZUMJ9rrKiUT8M8SNrBXC/GJ5J9061FYD4ocByc4SgVHw3xXpauI8o8DSvEZj?=
 =?us-ascii?Q?9a454zoX4cfU/XJd/IMVtd/WwqtqCxfd1c+LwU3TsWuBCus0HA2UI6pyB10S?=
 =?us-ascii?Q?ufLgktAV719UO+abpWA=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4edd863-f1d3-4d6b-0811-08dda766ed3b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 15:04:26.7916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aUsXhGFr9ui9G1vFBQCN0wr0TTGyEWOrYdYp9aO99AnsQSORvbbj7oNt/4vYElqRQu8z11B6fC4KTJdDV/tYkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10848
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_080433_925637_97C4639E 
X-CRM114-Status: GOOD (  48.65  )
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

On Mon, Jun 09, 2025 at 05:15:44PM +0300, Jarkko Nikula wrote:
> On 6/6/25 6:02 PM, Frank Li wrote:
> > On Fri, Jun 06, 2025 at 10:16:44AM +0300, Jarkko Nikula wrote:
> > > Hi
> > >
> > > On 6/5/25 6:13 PM, Frank Li wrote:
> > > > On Thu, Jun 05, 2025 at 05:07:19PM +0300, Jarkko Nikula wrote:
> > > > > Hi
> > > > >
> > > > > On 6/4/25 6:00 PM, Frank Li wrote:
> > > > > > On Wed, Jun 04, 2025 at 03:55:11PM +0300, Jarkko Nikula wrote:
> > > > > > > Move DMA bounce buffer code for I3C private transfers to be generic for
> > > > > > > all DMA transfers, and round up the receive bounce buffer size to a
> > > > > > > multiple of DWORDs.
> > > > > > >
> > > > > > > It was observed that when the device DMA is IOMMU mapped and the receive
> > > > > > > length is not a multiple of DWORDs, the last DWORD is padded with stale
> > > > > > > data from the RX FIFO, corrupting 1-3 bytes beyond the expected data.
> > > > > > >
> > > > > > > A similar issue, though less severe, occurs when an I3C target returns
> > > > > > > less data than requested. In this case, the padding does not exceed the
> > > > > > > requested number of bytes, assuming the device DMA is not IOMMU mapped.
> > > > > > >
> > > > > > > Therefore, all I3C private transfer, CCC command payload and I2C
> > > > > > > transfer receive buffers must be properly sized for the DMA being IOMMU
> > > > > > > mapped. Even if those buffers are already DMA safe, their size may not
> > > > > > > be, and I don't have a clear idea how to guarantee this other than
> > > > > > > using a local bounce buffer.
> > > > > > >
> > > > > > > To prepare for the device DMA being IOMMU mapped and to address the
> > > > > > > above issue, implement a local, properly sized bounce buffer for all
> > > > > > > DMA transfers. For now, allocate it only when the buffer is in the
> > > > > > > vmalloc() area to avoid unnecessary copying with CCC commands and
> > > > > > > DMA-safe I2C transfers.
> > > > > > >
> > > > > > > Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> > > > > > > ---
> > > > > > >     drivers/i3c/master/mipi-i3c-hci/core.c | 34 -------------------
> > > > > > >     drivers/i3c/master/mipi-i3c-hci/dma.c  | 47 +++++++++++++++++++++++++-
> > > > > > >     2 files changed, 46 insertions(+), 35 deletions(-)
> > > > > > >
> > > > > > > diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> > > > > > > index bc4538694540..24c5e7d5b439 100644
> > > > > > > --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> > > > > > > +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> > > > > > > @@ -272,34 +272,6 @@ static int i3c_hci_daa(struct i3c_master_controller *m)
> > > > > > >     	return hci->cmd->perform_daa(hci);
> > > > > > >     }
> > > > > > >
> > > > > > ...
> > > > > > >     }
> > > > > > >
> > > > > > > +static void *hci_dma_alloc_safe_xfer_buf(struct i3c_hci *hci,
> > > > > > > +					 struct hci_xfer *xfer)
> > > > > > > +{
> > > > > > > +	if (!is_vmalloc_addr(xfer->data))
> > > > > > > +		return xfer->data;
> > > > > > > +
> > > > > > > +	if (xfer->rnw)
> > > > > > > +		/*
> > > > > > > +		 * Round up the receive bounce buffer length to a multiple of
> > > > > > > +		 * DWORDs. Independently of buffer alignment, DMA_FROM_DEVICE
> > > > > > > +		 * transfers may corrupt the last DWORD when transfer length is
> > > > > > > +		 * not a multiple of DWORDs. This was observed when the device
> > > > > > > +		 * DMA is IOMMU mapped or when an I3C target device returns
> > > > > > > +		 * less data than requested. Latter case is less severe and
> > > > > > > +		 * does not exceed the requested number of bytes, assuming the
> > > > > > > +		 * device DMA is not IOMMU mapped.
> > > > > > > +		 */
> > > > > > > +		xfer->bounce_buf = kzalloc(ALIGN(xfer->data_len, 4),
> > > > > > > +					   GFP_KERNEL);
> > > > > > > +	else
> > > > > > > +		xfer->bounce_buf = kmemdup(xfer->data, xfer->data_len,
> > > > > > > +					   GFP_KERNEL);
> > > > > > > +
> > > > > > > +	return xfer->bounce_buf;
> > > > > >
> > > > > > Why need use bounce_buf? why not use dma_map_single()?, which will check
> > > > > > alignment and size to decide if use swiotlb as bounce buffer.
> > > > > >
> > > > > We do pass the buffer to the dma_map_single(). I've understood swiotlb is
> > > > > transparently used when the DMA cannot directly access the memory but that's
> > > > > not the case here.
> > > >
> > > > why not? even though you have to use internal buf, why not use
> > > > dma_alloc_coherent().
> > > >
> > > I don't think it's suitable for "smallish" per transfer allocations/mappings
> > > and buffer is not accessed concurrently by the CPU and DMA during the
> > > transfer.
> >
> > I still can't understand why need this special handle for i3c. Basic it use
> > dma transfer to transfer data. Can you simple descript hci's data flow?
> >
> Unfortunately my knowledge doesn't go deeply enough in HW but I could guess
> it's somewhere in MIPI I3C HCI DMA engine implementation and/or HCI IP to
> memory bridge/bus integration.
>
> If it would be a cache line issue then I would think we would see corruption
> independently is the DMA IOMMU mapped or not and in larger number of bytes
> than 1-3 last bytes.
>
> Also another finding that if I3C target returns less data than expected then
> there is also padding in the last DWORD with the real data. But not more
> than requested, i.e. 2 bytes expected, target returns 1, only the 2nd byte
> contains stale data and bytes 3-4 untouched. Or 8 bytes expected, target
> returns 1, bytes 2-4 contain stale data and bytes 5-8 untouched.
>
> So something around trailing bytes handling in the HW when the transfer
> length is not multiple of DWORDs as far as I could guess.

That's reason why should not manually handle dma buffer here. It is
small memory and less proformance requirement.

If you use dma provided api, you should not take care such detial. DMA
buffer at least one cache line size. otherwise, dma may currupt some data,
which is hard to find.

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
