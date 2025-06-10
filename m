Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B054C677C4
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Jun 2025 22:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Td3gUK5nFUPskZRDc4c3SoCty2b/jsqNDbFReFX6FJo=; b=esgVWbQ9d/hctN
	XdDIxnG8kBfMJ0nq1laQMcmO9+9jewAOQnbC2tAxzPP5JtFV7VZIINTuY7rMelP8PupbO8RNW4TXf
	5mVca2FDJmlXH03TTXhVglBiLuwYgTt9dBLq1ybWazlX4WXgqhnw54intXzkEJqAIHlAFx9lEhMTg
	7kTZFVv3JnEvnZtLdDsrbm1Tv1ZJi4rPKET4ffLw1Mbdaz18JNbhtclTA4LT3vuJvd1kBAlyEMG5G
	J+MEjifX0FxCZCahY4ByThhL5uRMUpRaLEKjBBrxpiQK1QNfPAxklTv041/Wfj3CW/H/GKywU2xCM
	Kysi4CBchovD7zn5cHnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7lC-00000008EdI-3Hva;
	Tue, 10 Jun 2025 22:48:02 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP2SW-00000007Zwj-1B8s
	for linux-i3c@lists.infradead.org;
	Tue, 10 Jun 2025 17:08:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F9hQEUitjTsyZdoS4/3FzDzz6qKo5S2ErHWJFWfn1CzjzB6MXJP54UaNJvIdLUwlJNIGs5Qkqs2oib9vxn8ta3lQsFpp2kcG41BOTm5FvPfi3l4dT2yxvRjgmBIwF5/CFil82nS6GmY8PG5Q3X0eHGECKb/ulXPffDg/1fipIU6Fh1L4RirOdBAbaZF6KrVEwdacQDauMDgh5/E62OPqqKc1AYcvGNtpw1eO0d8looKnw+PElqWmNZAXP/Vjvvti4alEMGkUwEnnCwdXl1VaJ2hXJdmhLtV/PTMF1bGsojLo9HS8vw/lismEH452omjToOdS+imDgzTOsYbr848vQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eokMmDIGaqHUMhhq8Vdy7PxBnS3FohCo9d5Qs4bghyg=;
 b=Sy7kUUsCn0wpkOofHg5LMFVHWq0TPjGlbLLlYSdmwkmrdzj0uuQXLh6kX/K8MnpYO40CE88cInHsXlMER6l9aTk6x/W4DOamK+zJ3yUSVNBImllXopUV/A8Hjlgc65tVP29vV6IdWNGoDb6mboFotRsIVUk4wc/NDBYEwQIYdh9sH13GEuFz/73oTcBjls8l3rgW59bLH8hjCltGOwEbe6XPS+Qcpji2Tz3h46AGnHYuMs9mnsunQSNCBFYlnrAh0LIS57xeBq/Bq1nPsyb+kidOhM2q9//Rith6L1G7MwO8MBubIE12BEqwQu/dB/+vmaWmnzuj0Qx7W9r+9pSimQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eokMmDIGaqHUMhhq8Vdy7PxBnS3FohCo9d5Qs4bghyg=;
 b=ffxp3c60j/Xaecn0BQECojMu/jNjvJDR1zS1dmJtrdYTuCBbONtm3WwNnqzDr4ZjUNuODl+SlWeFKktXFg+EwQkOSgL4L1njCIkYjDd6dkkgxY15u6debRqZu352UqM6hHfCz2QU5O+5RWkDz3BIaIqzSEYcuZx88cLrgLqPiXd67Ut4bTNBegknMdUkpd/F8ho5Kuvno5FL5ytWBDiswb+WKeSgfGNiw7YO9Ki74aOQDpcX7ITSWyF4t5kikAZCRdnbPextXOwvJhvWN/KAowKnF49XN1M+opMWj5K403uaiGXul8HbJ+gbZO1J+t5Y5Yx/0SntRUOJxNfzlRgY4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB9176.eurprd04.prod.outlook.com (2603:10a6:20b:44b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 10 Jun
 2025 17:08:18 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 17:08:18 +0000
Date: Tue, 10 Jun 2025 13:08:12 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 1/3] i3c: mipi-i3c-hci: Make bounce buffer code generic
 to all DMA transfers
Message-ID: <aEhmfNObvH5Dm4+W@lizhi-Precision-Tower-5810>
References: <20250604125513.1593109-1-jarkko.nikula@linux.intel.com>
 <aEBfpZ6Fa1DoFVS3@lizhi-Precision-Tower-5810>
 <bc599310-9287-4023-a204-682771574528@linux.intel.com>
 <aEG0DitRE/49aXI5@lizhi-Precision-Tower-5810>
 <37051b2a-0969-4482-91ea-85b1a9c2fc5f@linux.intel.com>
 <aEMDCi7RYbQud7WZ@lizhi-Precision-Tower-5810>
 <367523dc-d91b-4792-ab8c-f8d7e26379cd@linux.intel.com>
 <aEb38qRGQ5AIqy7R@lizhi-Precision-Tower-5810>
 <ebc6a6f1-0c9f-4ea7-8af1-585fce6ad9c6@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <ebc6a6f1-0c9f-4ea7-8af1-585fce6ad9c6@linux.intel.com>
X-ClientProxiedBy: PH8PR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:510:2cc::25) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB9176:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ebd40bf-0155-43c1-d599-08dda8416533
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ACC3do5DN92QAxuTCNKxNiOeA9NXxoKvghuC7OKM90SeaXCU8BFdjIznWNOf?=
 =?us-ascii?Q?Z0Z6b56k/9osImdl0F+bn+PWpmN+l8GpdQl0NbmylmylDp1f/VZtHx7hYz4A?=
 =?us-ascii?Q?5nwRV6U6adQx+nN8xJ24iwwFzl66GagGhgbC8YPp1hPMkk3Ae6DBqkrcIvUt?=
 =?us-ascii?Q?QpZWoPMc/PBrd53vAT1t+iZ568OEl9bIpoH5xAd/GugRPde16IGTj0VRjwdV?=
 =?us-ascii?Q?rwD/bMh9UXD9Dqrigy+X553TUnulCFDjH/hrOf4KNAscUuMQZyD6Kwu1E+lC?=
 =?us-ascii?Q?DBMaWpbha09UowbFTD7h7c0z5Sj/GomsYwYShV9c1lkMeVE7n8s4SY8KedzR?=
 =?us-ascii?Q?L/yeaIuvXl9hSta8f6hfX95O1vt/KAnYjURZaBGHI9vasWK+z9KZSvTIFqXL?=
 =?us-ascii?Q?J4GePE5WI8hJeyLcbLB+q1w7rWV7+9JZOrznrsqaj2KFco8mlmYmZi1Hyi/7?=
 =?us-ascii?Q?bR9zv4RHo2NnB2PLtYKSkDjTpk5NFa9kX0+3uTXNMy3+9Axz+uw7U832uGnx?=
 =?us-ascii?Q?wDZA3MkzZn2/jKyjV1QtHtNVXMGz7vLXUK3/ouIlmZ014pytPjBgaRZd2EOp?=
 =?us-ascii?Q?JBZuHV36psnF0+QkXWfl/O0TYptznSEd1/w3vG0256mVZyPMJygvJcDLJiMF?=
 =?us-ascii?Q?rCOLxmRjjTIhtTD/7HWt4JVN4Kxb/avMvenmgCDgPx3ScVr2YN79MCy/EwBn?=
 =?us-ascii?Q?UI0rlPGEQhCNDjYFjOxSW4K1uXaaCEyJA4nIO9l5Rk26aGhJCkCudMJlKran?=
 =?us-ascii?Q?mVh6CVDeX7/GqYEBkNsyH0UTyVGmklf853EiGrvtytFU9B03DqYDCwcVE03Y?=
 =?us-ascii?Q?a0KIwqgY+1YMxwmVwWFebePn1e6ONT8jwYePZrkdLHT5j1TT4iZ+6h3hg9ak?=
 =?us-ascii?Q?giWZgoN8/kz97DfSJA54s1Ulo/VktmhxUGsGoXzzXigM8BBMp1CBCNdodmV9?=
 =?us-ascii?Q?jj3ghd074eYYZUZyywyj7UB7OlomXibJhpAg4AclNWYMsoAyte/OHjlYAO9d?=
 =?us-ascii?Q?UnNzsxG3hekw0w6OQQcSdyTdiXPiS91C8Z37h7itb/YEKXC1hBMIoyehWU9p?=
 =?us-ascii?Q?QAMnIlBUPOf3ZX9ZSdaaMX7hSAQLDyYRiKCrgD+UqFG3ezEcs6OpHytnDIh9?=
 =?us-ascii?Q?+akp73VrGw1egOc1h+9clNt3CEtR8QBzp0HDDV7Lpw6Oh0pKQEddewumJJ+Q?=
 =?us-ascii?Q?JBMVdhalRbZ2IOqHJ35yF+bFOP4swWHmd+wYQkUE9aDfqYa5R9/D/nGB1ORm?=
 =?us-ascii?Q?luNLkPIbpJMJHCaR62qxwX8aQVaDcXLvxb6CYTJ7uGXuV9nLBPeS/5cgH38Q?=
 =?us-ascii?Q?S1Etq5WiqAaWkZvxPi4/SWTq5c2Am/PIyyExhInCV6TbtqySWGfP19fMEIg8?=
 =?us-ascii?Q?Hm+NSMFzGBmxWOZ0tsH0F1JPUd2QChmULIvoukfJjjHGG2xKDC2RQ3I25mAK?=
 =?us-ascii?Q?xi2ekKbeTwvmtWFlK26ClOhZWqtW2j4j9yymgJOpo88l3JFoZWlyhH6BrcEf?=
 =?us-ascii?Q?Hweaefny/qXFbgI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?whF+QNgIizyV8Pwbbe6ArYVC1kLn2Y6IXBbGH+zJOEGA/TLhao3d1Fsq6OmK?=
 =?us-ascii?Q?VSGT3rhdQG6UuAV2MO/q/ptvN5SJyPSV4i2ftzUIwi/L0pBbqC7I0GvUljDs?=
 =?us-ascii?Q?MJzpGaML2+5opKMNE0EAfjHNP1IHAUNs/RAFaGtCmFoIEfhH2ZSdCcTTyIgA?=
 =?us-ascii?Q?Rjg0Aw0A6ZWu52kkg0LshYrkWKZ9qdBKTjjxl+WtbSYZ9UDaCdIwF46exif6?=
 =?us-ascii?Q?6FICMoPOM9MGXEYrrbJAeH/4LmqpN2AEtNChJ5eCRH+1CzWgsyLmfGXerRde?=
 =?us-ascii?Q?6uar5FbXCHWMBKQyC1onkcZm7Iu2THY7h67OGZ4M3B3QzvQ/5rxXXZbUvOM0?=
 =?us-ascii?Q?XSatxnx8n7yX/N+SWQMWFZ26RZAf8Wfre0zO4IX+0crmWgMrOuaodfM2+tjN?=
 =?us-ascii?Q?9KRfZYaDOnjdb0Mex1COfiLBYUr1W+6PfJgzWWybTfGdrUO6GwYzSpGy5hSX?=
 =?us-ascii?Q?KIyFIhFvqxUyyhkkzghQaeUqPQq40rVNq4it7ptPifwAGPEyniDX0bJanBwd?=
 =?us-ascii?Q?w1LcijlvDTJy6uaCyUC2aRVGzkuemXOIg92vWhjRtiV2YvhS/n/94OZKb83G?=
 =?us-ascii?Q?ILnn7EWUIPlGCcFNTTbYpYsOzJwiMNRWMRqxUTmkgTIik2mqa17xKfQIHYoA?=
 =?us-ascii?Q?5OirfrSMNckHju9K3Lcek+sYmOJkh6U46g0E9vcvg22IaLFzMIQirIM2Xqf/?=
 =?us-ascii?Q?oHLgVuZzFGkHK1raa+DmAj5i5FbWPDJUarNPTXecdugmdcl6yfEHKp1UjfZK?=
 =?us-ascii?Q?EyWUM0ASsIKXnKeWNnt9FAeAibgwLEa24ZDsxmSjdWpsUFEAms9neEdRM+Q0?=
 =?us-ascii?Q?2yTOY4+ZXU1OMjhesTKB6xJcgq2S1NlRRXMciBsKnKMUzPu50qL/q54t3Gky?=
 =?us-ascii?Q?+unC5et+NrBmxhKb59cJLM4F7yKgmpF7DeWazQTfxD0VM4bfnx5GgNlPWzKd?=
 =?us-ascii?Q?8na/Ps1VZDgxFbFUHTmgyTfQB0auPDBi3+J4XSInCcrwaWzx2tasJ1r40OnP?=
 =?us-ascii?Q?m/FO/OLDgI+f6GAiZIw/FKeSbO9cs86RDntcLzoqCyhl8nZm0WWtTlRT4flp?=
 =?us-ascii?Q?SQY6dsY7ksm+n5nSCTdAoAXqc/6b4GN+f6PGR/LeNmmcdXATLMGfTyIXS8eb?=
 =?us-ascii?Q?v3/EOqj9C4ihRIbab8WJ/Lh+HAQFhjTCYYYYTH4/U8LgBGj/Z0vglJ9+9AUq?=
 =?us-ascii?Q?l6yv9GZsvREZpmdxqdOmDaf9RKpt7UIZvOP0sRgqnvEFAbeNdqwNKY9WrOUc?=
 =?us-ascii?Q?AjTDetvM62AFl3jwMR1NB6J1orVFKsIMoMzDFmrRj9oGnkdSWCvMUyFxsqwM?=
 =?us-ascii?Q?4X1hiqitNy0G8c7GBxoS6rgScwDR+sPr/J+MrHpJkjScOrwjF3EPx+y1ebCv?=
 =?us-ascii?Q?tqiIKACWnSWeVvATlEk2iU6P0MoyAxROO1QigG4gpLkLsnkYJ3AIIXS55OaW?=
 =?us-ascii?Q?sxH5kMCw9cKfxGEnot521LWIFNigzy8zgUVg6NGoIoKpdvbxZv9Osk4mE6fL?=
 =?us-ascii?Q?sZ/pq9QxNh+FuYbIVLVoqmLzz8haWXUYr98h80ox9JNA/USzc/qepcZGCe5U?=
 =?us-ascii?Q?bycCzYFEBs3ybKPDCQwttBRFpcQaeJavP832RcIu?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ebd40bf-0155-43c1-d599-08dda8416533
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 17:08:18.3163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k/CIj222AdCpJ9xEnmDg/HaALm6JO8rLuvdzjXTFezd5sQFWbzjD1+mQ70UqhgCm3reDFOQcFIOrWyyGOOxybQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9176
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_100824_501848_26F04C4C 
X-CRM114-Status: GOOD (  50.82  )
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

On Tue, Jun 10, 2025 at 04:42:35PM +0300, Jarkko Nikula wrote:
> On 6/9/25 6:04 PM, Frank Li wrote:
> > On Mon, Jun 09, 2025 at 05:15:44PM +0300, Jarkko Nikula wrote:
> > > On 6/6/25 6:02 PM, Frank Li wrote:
> > > > On Fri, Jun 06, 2025 at 10:16:44AM +0300, Jarkko Nikula wrote:
> > > > > Hi
> > > > >
> > > > > On 6/5/25 6:13 PM, Frank Li wrote:
> > > > > > On Thu, Jun 05, 2025 at 05:07:19PM +0300, Jarkko Nikula wrote:
> > > > > > > Hi
> > > > > > >
> > > > > > > On 6/4/25 6:00 PM, Frank Li wrote:
> > > > > > > > On Wed, Jun 04, 2025 at 03:55:11PM +0300, Jarkko Nikula wrote:
> > > > > > > > > Move DMA bounce buffer code for I3C private transfers to be generic for
> > > > > > > > > all DMA transfers, and round up the receive bounce buffer size to a
> > > > > > > > > multiple of DWORDs.
> > > > > > > > >
> > > > > > > > > It was observed that when the device DMA is IOMMU mapped and the receive
> > > > > > > > > length is not a multiple of DWORDs, the last DWORD is padded with stale
> > > > > > > > > data from the RX FIFO, corrupting 1-3 bytes beyond the expected data.
> > > > > > > > >
> > > > > > > > > A similar issue, though less severe, occurs when an I3C target returns
> > > > > > > > > less data than requested. In this case, the padding does not exceed the
> > > > > > > > > requested number of bytes, assuming the device DMA is not IOMMU mapped.
> > > > > > > > >
> > > > > > > > > Therefore, all I3C private transfer, CCC command payload and I2C
> > > > > > > > > transfer receive buffers must be properly sized for the DMA being IOMMU
> > > > > > > > > mapped. Even if those buffers are already DMA safe, their size may not
> > > > > > > > > be, and I don't have a clear idea how to guarantee this other than
> > > > > > > > > using a local bounce buffer.
> > > > > > > > >
> > > > > > > > > To prepare for the device DMA being IOMMU mapped and to address the
> > > > > > > > > above issue, implement a local, properly sized bounce buffer for all
> > > > > > > > > DMA transfers. For now, allocate it only when the buffer is in the
> > > > > > > > > vmalloc() area to avoid unnecessary copying with CCC commands and
> > > > > > > > > DMA-safe I2C transfers.
> > > > > > > > >
> > > > > > > > > Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> > > > > > > > > ---
> > > > > > > > >      drivers/i3c/master/mipi-i3c-hci/core.c | 34 -------------------
> > > > > > > > >      drivers/i3c/master/mipi-i3c-hci/dma.c  | 47 +++++++++++++++++++++++++-
> > > > > > > > >      2 files changed, 46 insertions(+), 35 deletions(-)
> > > > > > > > >
> > > > > > > > > diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> > > > > > > > > index bc4538694540..24c5e7d5b439 100644
> > > > > > > > > --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> > > > > > > > > +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> > > > > > > > > @@ -272,34 +272,6 @@ static int i3c_hci_daa(struct i3c_master_controller *m)
> > > > > > > > >      	return hci->cmd->perform_daa(hci);
> > > > > > > > >      }
> > > > > > > > >
> > > > > > > > ...
> > > > > > > > >      }
> > > > > > > > >
> > > > > > > > > +static void *hci_dma_alloc_safe_xfer_buf(struct i3c_hci *hci,
> > > > > > > > > +					 struct hci_xfer *xfer)
> > > > > > > > > +{
> > > > > > > > > +	if (!is_vmalloc_addr(xfer->data))
> > > > > > > > > +		return xfer->data;
> > > > > > > > > +
> > > > > > > > > +	if (xfer->rnw)
> > > > > > > > > +		/*
> > > > > > > > > +		 * Round up the receive bounce buffer length to a multiple of
> > > > > > > > > +		 * DWORDs. Independently of buffer alignment, DMA_FROM_DEVICE
> > > > > > > > > +		 * transfers may corrupt the last DWORD when transfer length is
> > > > > > > > > +		 * not a multiple of DWORDs. This was observed when the device
> > > > > > > > > +		 * DMA is IOMMU mapped or when an I3C target device returns
> > > > > > > > > +		 * less data than requested. Latter case is less severe and
> > > > > > > > > +		 * does not exceed the requested number of bytes, assuming the
> > > > > > > > > +		 * device DMA is not IOMMU mapped.
> > > > > > > > > +		 */
> > > > > > > > > +		xfer->bounce_buf = kzalloc(ALIGN(xfer->data_len, 4),
> > > > > > > > > +					   GFP_KERNEL);
> > > > > > > > > +	else
> > > > > > > > > +		xfer->bounce_buf = kmemdup(xfer->data, xfer->data_len,
> > > > > > > > > +					   GFP_KERNEL);
> > > > > > > > > +
> > > > > > > > > +	return xfer->bounce_buf;
> > > > > > > >
> > > > > > > > Why need use bounce_buf? why not use dma_map_single()?, which will check
> > > > > > > > alignment and size to decide if use swiotlb as bounce buffer.
> > > > > > > >
> > > > > > > We do pass the buffer to the dma_map_single(). I've understood swiotlb is
> > > > > > > transparently used when the DMA cannot directly access the memory but that's
> > > > > > > not the case here.
> > > > > >
> > > > > > why not? even though you have to use internal buf, why not use
> > > > > > dma_alloc_coherent().
> > > > > >
> > > > > I don't think it's suitable for "smallish" per transfer allocations/mappings
> > > > > and buffer is not accessed concurrently by the CPU and DMA during the
> > > > > transfer.
> > > >
> > > > I still can't understand why need this special handle for i3c. Basic it use
> > > > dma transfer to transfer data. Can you simple descript hci's data flow?
> > > >
> > > Unfortunately my knowledge doesn't go deeply enough in HW but I could guess
> > > it's somewhere in MIPI I3C HCI DMA engine implementation and/or HCI IP to
> > > memory bridge/bus integration.
> > >
> > > If it would be a cache line issue then I would think we would see corruption
> > > independently is the DMA IOMMU mapped or not and in larger number of bytes
> > > than 1-3 last bytes.
> > >
> > > Also another finding that if I3C target returns less data than expected then
> > > there is also padding in the last DWORD with the real data. But not more
> > > than requested, i.e. 2 bytes expected, target returns 1, only the 2nd byte
> > > contains stale data and bytes 3-4 untouched. Or 8 bytes expected, target
> > > returns 1, bytes 2-4 contain stale data and bytes 5-8 untouched.
> > >
> > > So something around trailing bytes handling in the HW when the transfer
> > > length is not multiple of DWORDs as far as I could guess.
> >
> > That's reason why should not manually handle dma buffer here. It is
> > small memory and less proformance requirement.
> >
> > If you use dma provided api, you should not take care such detial. DMA
> > buffer at least one cache line size. otherwise, dma may currupt some data,
> > which is hard to find.
> >
> Do you know what solution would solve the problem here?
>
> Let's take a look at the CCC command which is the easiest here. For example
> GETPID where payload length is 6 bytes and is allocated using the kzalloc()
> which guarantees the buffer is cache line aligned and ought to be DMA-safe.
>
> i3c_master_getpid_locked()
> 	i3c_ccc_cmd_dest_init() // Allocates 6-byte payload buffer
> 	i3c_master_send_ccc_cmd_locked()
> 		i3c_hci_send_ccc_cmd() // mipi-i3c-hci
> 			xfer[i].data = ccc->dests[i].payload.data;
> 			hci_dma_queue_xfer()
> 				// bounce buffer stuff, this patchset
> 				dma_map_single()
> 				// setup hw with DMA address
> 				// and queue the transfer
>
> The DMA streaming API dma_map_single() maps buffer's CPU virtual address to
> the DMA address and we use that to setup the HW and do the DMA.
>
> Assume now the DMA is IOMMU mapped. DMA writes correctly 6 bytes to the
> payload buffer + 2 extra stale bytes. In this case perhaps harmless (due to
> kzalloc() allocated buffer) but nevertheless corruption which KFENCE may be
> able to detect.
>
> More difficult territory are I3C private transfers and especially I2C
> transfers. I3C private transfers are expected to pass a DMA-able buffer but
> I've noticed it may not be always true especially when I3C support is added
> into existing I2C or SPI target device drivers and that are using
> regmap_bulk_read(). Those use cases may pass a stack variable (not DMA-able
> and will be rejected by DMA API), structure member or buffer index and
> pointer into those come as it via regmap_bulk_read().
>
> I2C message buffers are not even expected to be DMA-able.
> drivers/i2c/i2c-core-base.c has a helper i2c_get_dma_safe_msg_buf() but I
> see it has the same problem than with the CCC command payload buffer.
>
> So far I haven't figured out any better solution than using a local bounce
> buffer for all of these transfer types.

Thanks, I finially understand the problem you faced. I think other master
controller face similar issue if they use dma. Let me think more. If alloc
buffer size is not align to cache line, swtlib will bounce again.

rough idea i3c core layer provide an i3c_(un)map_api to do that.

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
