Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67295C87FD2
	for <linux-i3c@archiver.kernel.org>; Tue,  5 Aug 2025 17:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u4HCylnPT4xaKFrUASjGGC2Ku0cHUVXWiTrs74u3cao=; b=wFZGJoyDA8v4O4
	ACNN5nzI+8XPboRSYjOSt14X7+fo2+fJI4YCGdtkUew2OTO3sTuIMl3kcp7su/GKxIfEKl/uE9LyQ
	KYVADr5FBiJCZFpwVjcC4P7V7aVoE16NjXAUsO4BWSc/wpEUfrFUnCGfgkwWSmAdG7LEgEeDnzHc/
	6T9CW90n9CBvdKlJDZ2UhFD7lbdN4E/bYpmfFVS+V234qb/XUQp1LOska2S4CiXL0U3s26DJ9ypCf
	jJjDhvgxQe1OKd5IfRwQck1PnRfeoyyk1qY+hi0GEM3TZiGpHFdKdS0Q8YkpHl/bChKfOUvx7IXwB
	Ui91x7qlI932bqGVyqeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujLBZ-0000000DO8E-0hKH;
	Tue, 05 Aug 2025 17:10:49 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujK3F-0000000DDEI-0REF
	for linux-i3c@lists.infradead.org;
	Tue, 05 Aug 2025 15:58:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lDhFRqUV1o6caN2Lm0d7hd0d2NHpKVb28T7pmHikTQYqu3B8VhGdIyt7connCcZE+NiS8Rw4ZkhtUQ6WtC7T/DAnkZcJD1hY2sbliG24WnWGaeG7+F13H8ckqGhDQ6bEt8YMwHZYG5Q6bsUB53CaIp3yPJnw079Hzkmt5s0h6rLj6z1EIPQ0dk10RqqoxXULnMvELzDnW3iKY0f6TausXsX0QZaxRo8WBGeKumcg2ho6WLt6Q/0vfWbULB5S/chTAwoNh1++/oVd8QKpRV1Jo7SBawuFXlBUeiPpv8WiUCG1XX0O5k68SqrNRAzPUe6yA1UeCAh0zS7AMeCDKKcb+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eqDvuHYJvkTn8HqUW+7gezv0YdI2xXJ+2R6+Usu5q/8=;
 b=H8xc5Dy1OyGeqt1a9Mr/T48jQaSm1WMi9lPYcNsY5gldkEVn/DAzyqfbCdvbb6lBJ7UT4hhyoeI8CnrhjqmsMe+TjK/qCHNR+xbS3W9HmfFFZKGLtnUkriQzzuJLopUaA2lX6ImD8mEbBbGGZ8K6ZJdz0czk0KhPzL1S5V0Uya4qHHQcOMEJsMscnr7RvTPEtuHfxSMXLyjQsjhSAtLNBy5uchkadKL7N9CVg5yJmP/2AyOfynjdURBw363/wSq+vZ7oXzvSbK/ueCUbsjCCgLWfmlTp1Kbg9b6PrJuX2FcXmsyLWFGIfo7VK30Esr2KM/vbK7AUe7BMlEWL+mrw2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eqDvuHYJvkTn8HqUW+7gezv0YdI2xXJ+2R6+Usu5q/8=;
 b=JzYYA1Y6tUDYdphZkWHuDrR2Ivc8bju+zMVTXpF0/xBuk6rZBnelBLFXN1d2XYyJUd28bXnPHqjFa1GQVuTf+yUy12Qwy+R7yDRSZzD7McQWFdwhzKWEjZqw8Uv0AWwKvDjleHyhWqIyHMLFrX+XPAyYysJzzajmJ68O/aBXDrq6hNy/2Odj4fSUwiXcF58wLP/QyTJYO/z9OnIFP6kvcWmUWjE6lrYErt5DupdSsKvrwLVRELiNb9zkfHlDy93Fq5SMuD2fAWICdD09J9U4ciylDm9SRJCRD/uns/uLib68C3ZGuSxKHbfFyFkJPZXii1PID1U9gCIraYZBxlXLDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by OSKPR04MB11464.eurprd04.prod.outlook.com (2603:10a6:e10:9e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Tue, 5 Aug
 2025 15:58:02 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 15:58:01 +0000
Date: Tue, 5 Aug 2025 11:57:53 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	"Prabhakaran, Krishna" <krishna.prabhakaran@intel.com>
Subject: Re: [PATCH 3/4] i3c: mipi-i3c-hci: Use physical device pointer with
 DMA API
Message-ID: <aJIqASvSIySvt47y@lizhi-Precision-Tower-5810>
References: <20250731141420.422525-1-jarkko.nikula@linux.intel.com>
 <20250731141420.422525-3-jarkko.nikula@linux.intel.com>
 <aIzlNOxl3R6LMczU@lizhi-Precision-Tower-5810>
 <5aefebb0-f5d7-4169-be06-d334ee00913f@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <5aefebb0-f5d7-4169-be06-d334ee00913f@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0172.namprd05.prod.outlook.com
 (2603:10b6:a03:339::27) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|OSKPR04MB11464:EE_
X-MS-Office365-Filtering-Correlation-Id: 8edd8112-1299-470c-e136-08ddd438db0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PZ/WyKv8QY9UBdaEE0MJUrhYxwnosAgIwQUhxg6lYZLQpMKFFS6gZ3orT2M5?=
 =?us-ascii?Q?R3ovTFamLhk/l2QbtMf7JU9JbSFpxOlxpecV+y56KyzBJqT2vVGwpUVMzxn9?=
 =?us-ascii?Q?awebTHe+5CjJWVjX9+T4n4OrA3LvVCWrekBSUsEr3qxEYPdLrk40wkbMpSrC?=
 =?us-ascii?Q?4w19QbZomIR2WT2SUYyV/KJUyK4drFJ8E/Q+djYsd0dLE0iR/CCs2rSlQ8F0?=
 =?us-ascii?Q?MbqtuU6Lt9VB/2ur1gTolBHOc/CUd1hfbFZwgPFAxBA6rO0GsQRtel9CjzWM?=
 =?us-ascii?Q?wcsbk8fzSTFZzHdc/D9qGYdu18SQAMwtenAXVhwbbr7LP++68sS0RPgfrXpf?=
 =?us-ascii?Q?2Ap0ntj9H7rwTi5AtCxUWzzZqmcuG6HjGH/P197eCRdBXk9gd5MIo8/ZNF/i?=
 =?us-ascii?Q?SQBMpUaTBCcCyHaF02sdogGglwYIda7q9SBl/oc+Z4H2jAxXBjC7xHPL8x6d?=
 =?us-ascii?Q?iqqvGIP4syAF4Reh01TPxvcLSBGZLbwiU4+7igWk4M7/lXieJa7XLwgRi6gP?=
 =?us-ascii?Q?5vTeS5T0lyfIJUH0u9zvgcEmQLcNeO4NaMRuq/s7jJx6fdqLiSlU5MgUDIHO?=
 =?us-ascii?Q?qXyvTsYAA2Bnyfeqjj1PrVZpkwIgEzQy7pdRiathbhvF6x2DORclSdK8CsVS?=
 =?us-ascii?Q?Kzs92Z4hHa7GH2AkGMFYka2AffHkc6+xAqDNiEo0KvdPdZjmnbu6F3F2ZAkI?=
 =?us-ascii?Q?xhUZJEJj5F/eIZXMAqZJmfPkOxCSgPNuZDwHcVPKeUQtrtDDzJSjaydCsjKg?=
 =?us-ascii?Q?RWPwfAv0YqdB47MRjxfq8s6nEjFXdaYiXgs+jAPSJ4WYNBbWgIWMyPzlQFkX?=
 =?us-ascii?Q?ubbfwzIBy/8j/3mGWmfxgVvMzLykexlE2gAMSM9ixZ9J1CcsC4LqDWSBrHxw?=
 =?us-ascii?Q?wC5mPde+y3rpe2Q/tZ1YsdjeKGlo8bjzkEASyLfnRQ8Q6BJWFcOhG5glURfw?=
 =?us-ascii?Q?y125lM0z8cqbeXqxdt2zR2NTPDMhwWZPxyyxVOtZ908NDSt0+2AljZaFIGtQ?=
 =?us-ascii?Q?4SypLCN4kVdl9LzAuXlAJiX5S+RL18uWgZqAgmIC+CiSpT7jIs28tQjidFZK?=
 =?us-ascii?Q?awvN2uOmZbT+PLBRsNy0eURJpJRkQMHe55KVSAWvuS/uuTWdNwgbRdb44NT0?=
 =?us-ascii?Q?w52HPI/KL5oesWR4o9TRkrkh1NUhtJIk5Z6kSFJYfx4v1a3JflUTCN78sC4m?=
 =?us-ascii?Q?eEvsuMsjCZzBx3vrgd6GwAVrHFzwJnTrEDK9dB5FftIndhbSZdbYwGCQKDu2?=
 =?us-ascii?Q?f0PsDo7Ae+H6Ids2LbCIMrQvfoy3BtK8bjCKjn4fTSuq7DMNZhijWU+a47/x?=
 =?us-ascii?Q?kFp8+6wdkFiMS0j67reJE+MkQ6k3pA1aN/STgjzOhUpXyLdh9L9VAvarcKRy?=
 =?us-ascii?Q?UmG/jbJ1hFxiuiuJz2QERZ3jjUFEEikLRIvY46cScx6z/Y38T+nN2XDAbYhP?=
 =?us-ascii?Q?W8zbmqw+SD9/UMi1yWslKo7qY8wqkjUnavbwQvd6m9t7YlsKkYnDzOl+nfnJ?=
 =?us-ascii?Q?FuwGn5JLZIctfx8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i7ZyW5I1e7lmPfB/l/BGqNRRrnF4LKVz3WXRpvdy5sPp33s1BhKxKw7l5TZc?=
 =?us-ascii?Q?syl3iOTi2mt8rS5p20yWTLzJAhHhIXDLtrJNjQZpAnOVJRC1DsYhxyFPnRSg?=
 =?us-ascii?Q?qnfVKI/bPOVayGGFYoU3HTdrwKzsp4Ww1fRFNrhpRtulq2tpXM0ghJkyokiH?=
 =?us-ascii?Q?lpESYXwjIk4iMnUwojHplhmOdchlS4UsVmSDlaCCWHRBw6oWRQ7DqWKMjJVr?=
 =?us-ascii?Q?F0xZg5HKl2SA8xx78APR77gLhLJmdRTQ4v+UrolIA/Sk4G5naduHOuTPPUnv?=
 =?us-ascii?Q?9fn649b1ZP7B1NAUC/eUaywSkrSc8nFYaOZl8CU+JXeACN3R2kJuhCO8E1WM?=
 =?us-ascii?Q?fqKJe8CGZjjRkhfSsNYpR7TzBP1Ij+ADdcysoJNdm7xn2zALOglO4C29m9YW?=
 =?us-ascii?Q?6txxyZ/uNgRbwRrlv677Evq1qnvIolWxfnEselfnQKfXH+/sDJZgAfSFMnNs?=
 =?us-ascii?Q?rg82YnR155KThubduyQB6CA4R/llsphf4qLDh8q4zOh5oqMkW7M4z0mXkijT?=
 =?us-ascii?Q?2f6sbE4Z4WGiDDWnVZ2HBuCZgDZfgjbnfnaGkMBRXbCUcyWwKbQzbaCeEu/O?=
 =?us-ascii?Q?vEghmEKgCY62KP0EPBsm971SlyrVksBVTI/RePitPcpsmCgbav6i3lx9MQs9?=
 =?us-ascii?Q?/oJOoll1BAIrzUG8fhxDyNzvoVngjvPgLcqz8fqdLK1gP4y0kM50yNoQvbB6?=
 =?us-ascii?Q?lWDosDUaEO2ICQNNQOvDOfpXMMEsce5rZCY420WOfld9O9E4UfEchadIl8fH?=
 =?us-ascii?Q?Hy05yKRoZfmyQhgUARs+kgR2fVGoG7gyncQAeAdGsnL2t5bc+VaFeyTysqCO?=
 =?us-ascii?Q?pNBvlq12IdeIwfbqvaQqha6Lfg0QSCRwYAFmYg5GVV5La4zOsVquVoOzO0/6?=
 =?us-ascii?Q?gntGe8S4AbkOVTH6PP0r7alYrJedBIuRt13HMREfoJOzyQLxCRmzcwYTeG/U?=
 =?us-ascii?Q?+bLjtgv5R5YiBX+iHXR6jgjM6mJ35XQVOV44wb8eIkCm6SosleOdXiwEpEmo?=
 =?us-ascii?Q?yve5uuPo5PQGVvilfsnevvl+78AQ6/JyDxJ2MUFQFw56X8pR0dcXMF0745tG?=
 =?us-ascii?Q?XypH91gWUcPXVok85MWGXLZNKKrOI6+HH3FrK2PYQ2h4fvhTw0Ol8wnpyFKd?=
 =?us-ascii?Q?tPoUcKgk+AxVA8RCLJ/B7g09pdeyXWVOb7bo1xcuHkEETIHaVwQTpMz7z1y9?=
 =?us-ascii?Q?SyawaQtooTpqgLeMaHd7wNsrP5GDHHQq7Z4wFXB+5eArptwBIXNfT8TR2duH?=
 =?us-ascii?Q?PXoZj+0GW+i6LTssIZzrtF2uTmz6ZlvVEolLQuVILBRYhZ5dFBaIampyd/Nt?=
 =?us-ascii?Q?Dggzxn9DPh7eBv/2VUeObJqqkr2IfxB2H34m8uIkjseTXrxiJV/lZW9nnLDa?=
 =?us-ascii?Q?aobihRZqxaoRvdCzr2ZD8uHc0fTrHsaT/mCU5YdNNEpHUiJjK6ZtlpE/h4SH?=
 =?us-ascii?Q?QJC4g6y//EhBQofLgLWuQ0F8w+k+L6rB09ZuEjvIqd4mlUAKfk9bGgDHj+Xb?=
 =?us-ascii?Q?EChsawGZjzP8iPl1FhjbKJvL44jpwjKC8y2XTIg22QndNmeGjYb5hBT0GlXx?=
 =?us-ascii?Q?9d2lJ1/T/J81mLX8CrU=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8edd8112-1299-470c-e136-08ddd438db0c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 15:58:01.6726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x2sj6yL3386Td14tGCalNLuBPFuB5xLBMl8udFysr9WN2eOQID/TvVPt0p3SIjD/rRaqASqDCuNqsQ0OHTicMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSKPR04MB11464
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_085809_166350_4ED7819E 
X-CRM114-Status: GOOD (  27.68  )
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

On Mon, Aug 04, 2025 at 05:34:39PM +0300, Jarkko Nikula wrote:
> On 8/1/25 7:03 PM, Frank Li wrote:
> > On Thu, Jul 31, 2025 at 05:14:19PM +0300, Jarkko Nikula wrote:
> > > @@ -194,11 +196,23 @@ static int hci_dma_init(struct i3c_hci *hci)
> > >   {
> > >   	struct hci_rings_data *rings;
> > >   	struct hci_rh_data *rh;
> > > +	struct device *sysdev;
> > >   	u32 regval;
> > >   	unsigned int i, nr_rings, xfers_sz, resps_sz;
> > >   	unsigned int ibi_status_ring_sz, ibi_data_ring_sz;
> > >   	int ret;
> > >
> > > +	/*
> > > +	 * Set pointer to a physical device that does DMA and has IOMMU setup
> > > +	 * done for it in case of enabled IOMMU and use it with the DMA API.
> > > +	 * Here such device is either
> > > +	 * "mipi-i3c-hci" platform device (OF/ACPI enumeration) parent or
> > > +	 * grandparent (PCI enumeration).
> > > +	 */
> > > +	sysdev = hci->master.dev.parent;
> > > +	if (sysdev->parent && dev_is_pci(sysdev->parent))
> > > +		sysdev = sysdev->parent;
> > > +
> >
> > I am not clear about how i3c master controller device create in your
> > platform. If use DT, i3c master controller should direct refer to a iommu
> >
> > i3c-master@123456 {
> > 	...
> > 	iommu = <&smmu id>;
> > }
> >
> > Is it children device of a PCIe devices?
> >
> The master.dev is a "virtual" device object created by i3c_master_register()
> and for that there is no IOMMU link obviously. Only this IOMMU exercise
> revealed we were wrongly using the master.dev with DMA API.
>
> For the OF/ACPI enumeration the physical device is in pdev->dev in
> drivers/i3c/master/mipi-i3c-hci/core.c: i3c_hci_probe() and that is passed
> to the i3c_master_register() and can be references via
> hci->master.dev.parent here.
>
> PCI code needs it's own module mipi-i3c-hci-pci.c due to each module can
> have only one module_driver(), i.e. module_platform_driver() and
> module_pci_driver() cannot reside in the same module.
>
> mipi_i3c_hci_pci_probe() creates a "mipi-i3c-hci" platform device and sets
> physical device pointer pci->dev as its parent. So in PCI case the
> i3c_hci_probe() don't have the physical device pointer in its pdev->dev like
> OF/ACPI cases have but as a parent of it.
>
> Not very clear but that's how drivers with multiple enumeration need to cope
> with.

Okay for here, idealy framework should auto search parent for suitable iommu.

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
