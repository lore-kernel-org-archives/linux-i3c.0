Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36FD8C87FCA
	for <linux-i3c@archiver.kernel.org>; Fri,  1 Aug 2025 14:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1PP5LZ4XW4MAV6ijdd9GnPUTEnDf3vK8UguoW8BxMS0=; b=LTkaVQS8N3KMyz
	tbR6DNpi1L7DKHVJwFOTz4VMFoZshUgp9t621jXUD6qt6ZpiBILNJsf+tR8eV4GO4GEXEtFM5bVfv
	kw5o5JWzeUF0TjBOEqQU1luDtuwPbM1yHs8VyL3M1BdRDC6MXZJ+aV9SMVtZuYzdR/+hchfbuTYo4
	mmJPT1Y7NHGbpY67F+zrlr/9++5lv0zoJW0P+nxzO1XRPhaKQlEQTUNbKS5q8kAp+8TmsYrsipThj
	GIELfeS7TeZQSi6tlgXIN7x4aU5d80uC1XdUr3tTgq6IjC2XhFwACJpkP+oCpxvOnqn5zjc708skB
	8RP92IkHdHTiNZ5hM39g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhqyo-00000006GHS-3YZA;
	Fri, 01 Aug 2025 14:43:30 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhqxC-00000006G6f-2InL
	for linux-i3c@lists.infradead.org;
	Fri, 01 Aug 2025 14:41:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mglYU04DYq43EXJGdHI/cSX0kdQdFo4AosqsUAyA3IbWhuhSn69WDYMq+GGnFQsZLuBvGtbhrp75nyX9a/+q5d8ydrQ+LsQswxgv/m2ID6khY3i31ure/UHN5NPRxNO24JWu0zWHo/yGuzUFavT10Cxm6buNLRafB0Rw+VwAkLS+8A8htbDTCBSYNNyI0z5XpSxvcKUxvdj2s1+J5e1JhD5yEGe5onWPwdai7wRtV9QqqeqpquRnSKh+FanX6RGeTyHDt9IaqtbTUp0ijC4HbQOp2ZFI8g+EO3GfGfEuOTq2DJ5s4ZMJUosyjriNFFk04stIOTd122PzqYovuqXwVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DaltO6K22ajdWUSNnCGt05+wvuAtRCClKNA26a0x+Jo=;
 b=oLnh/cQOsdiRrZLBX2aCIGltYKxSmVRp7QDUCMT1Qz37xs1s//E8hfmTieL0UWLQ8dBl0J2OuxOp8iGqCv15HPJ/Y8aDsALnTuxyM58OUn56SjULGl3/yNRExgsVvw8JFOsGpZnRxth7FKdymZeEFRDx/932qZASvWfhDg0aR1t/aM9AYCBCG38JeuvZtDrBjuUvRxrzDPvPmGSwx4S+5w/JmI5iYenjTE17B+U7yCybWnbTVEW2UZZ+vLb6Nxp/McIJxgBWyCUB8RI0Cr6iCWtKKJZpAVF/x2oTRa/a0nglrq+ci02wEW14Q3O0izQV4nG+3MTLBq8X3SBagKG9cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DaltO6K22ajdWUSNnCGt05+wvuAtRCClKNA26a0x+Jo=;
 b=MSlGHh1zOUFRYLAijhAZvft/DeMunKNOeoYFAuA2m/YfbJk0mg4pQJZZWqu5lneilrD6digY6nHAENd4KkgUw4VzZzFBgDdu3WcmmSJWjkVM2o3M3Hu9RYBmbtQp4KuqoSBlPppgV1VYgAVkDeqkY5BpKYIyZgl6XtY4bvufyCCZml0KqOs4NoXWdoUPJRLofHaeVwaTchwn4Hb6tydN3//9AFWgzfNBoO51tSVplbwEA2vhGz0RZFCkVG9fYIh6ENZ4U5eg35fQfa6h4l8uTgHzXLN0dexOdR+CJ/UaVRega9e7UUCzMZ3d400GJ8iIPI6Oq1AO70bSP/JYO8rS/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM8PR04MB7332.eurprd04.prod.outlook.com (2603:10a6:20b:1db::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.16; Fri, 1 Aug
 2025 14:41:42 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8989.011; Fri, 1 Aug 2025
 14:41:42 +0000
Date: Fri, 1 Aug 2025 10:41:35 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 2/4] i3c: mipi-i3c-hci: Use core helpers for DMA mapping
 and bounce buffering
Message-ID: <aIzSH+vCz4ZeEJ0Z@lizhi-Precision-Tower-5810>
References: <20250731141420.422525-1-jarkko.nikula@linux.intel.com>
 <20250731141420.422525-2-jarkko.nikula@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <20250731141420.422525-2-jarkko.nikula@linux.intel.com>
X-ClientProxiedBy: PH7PR17CA0064.namprd17.prod.outlook.com
 (2603:10b6:510:325::21) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM8PR04MB7332:EE_
X-MS-Office365-Filtering-Correlation-Id: 837e61a6-c80c-4897-18da-08ddd10987af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|366016|376014|19092799006|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?v870CpOcO3xkYluUxA2X1HozWofyMvqf5aD8avI51CT0sL79C9urP89TTHCU?=
 =?us-ascii?Q?y7ax+lV2n5YKbpu8AKE8C6jtbpxARVXbtlfgPTfJJfrUM15rhXYdxWwfZYC8?=
 =?us-ascii?Q?6hvjsHqQ3qQ6F9UKghCelOMp2BDd5Coxzc3h0t+PDnQPcFJJu65Umy9NlNZY?=
 =?us-ascii?Q?bYd96XAHXATnfV3zc/BpzJ1V/OL+N+P6QbQHeaay11DwdGdf0cMxLvKdF1Be?=
 =?us-ascii?Q?mGlah+jd0jwUsO5n4eHxfMqMc4djokKNhqfa5cPoanL16WIqwUq5NjKKmtMB?=
 =?us-ascii?Q?Q3wVHOWGBlDEK6tZrnnLkmTPhWXiyeCu3DBRP9KM9LtPIMDlnFOu0fLrv0Gb?=
 =?us-ascii?Q?64voLUot4e1eICXipbp4WYUVAV+EN+yiRMIgLdCrEzz9resp7f60sTXvIJB1?=
 =?us-ascii?Q?JjsKofOnIYaDyyuGuQfmNRbWmpahyp/P2BYNgjWLUmqotTz0ZiwJEphHdPO5?=
 =?us-ascii?Q?UzShfIHtH6lDhT7ax+Fjgf4E41YM0SVwwOzx1rppRepkl1117YOjTyvdva4J?=
 =?us-ascii?Q?uFmHHCLgFksFWZWSNZrq8yvx5WBYLCs4C/wswSOHGTWiagmFffdJm8czaDkU?=
 =?us-ascii?Q?39MXDAYHGqC28uHaSPj0efeh8OknZQ4cj7n2HBOPg25f01jezsMwNbeIMqzA?=
 =?us-ascii?Q?Ojy8HY0uVXUhXZZrHBdkvqJNRprh/prTnEQw3ep2OWREHQZu7sqnMyVcx3+6?=
 =?us-ascii?Q?/Xz6JwAO3kCv/IKOE5ai9Tw2Ro0A1RyT3UPRXdC4wiM1eAhY3Tj000/DDGDV?=
 =?us-ascii?Q?CjCDDRKHqhQ3A/MNEjpk8/FasOes3nul8bvleDKpP5Bh0QqhFuRoCaPmqGri?=
 =?us-ascii?Q?eE76bc6SghECy0vnDRteecIUThsPdl6NwGVWP8pFYHgKv6JUjkTC25X/hsoK?=
 =?us-ascii?Q?FOg/IFTs7JL1UEgxZ1AY17HPki1dUaAEc0KIdgRp+mWeL5cqTEiOW+UCh0b7?=
 =?us-ascii?Q?L/p1nMie/KcFHDDqUSfg8EBwx4QsPJH2rO+Elcgejnn1UroNgaR//VtC9TFZ?=
 =?us-ascii?Q?iBnc+Kj+wrjR37o53olVDfsJ+9b/x1DNOoXvrTmrP+5lKOJSviOqhLwM+Ah1?=
 =?us-ascii?Q?t935UcJ/y4f64hPYK8scEYtZrI4iXv0dke5XM7/lACBxt88N9aqHkhbR6LH0?=
 =?us-ascii?Q?Dmy1we1OPVLS7G7wz+wz0eeXHiOoP/RREFtY1CcoaDScTzQgBnpUEHqn96oT?=
 =?us-ascii?Q?9ccs/8acL5zPdyZRdhl5Ha/2Je6DUGD0zm6MseBLIT2oQtdGhFN5d3KxsyzV?=
 =?us-ascii?Q?e1fuu7s0Zhq1D1024AUr/cVqTcysdkHe0HTzkKRo33I0ZtBY+vBo+4UZfkPu?=
 =?us-ascii?Q?/ZyPRFdUZfNj72W9SvNt9bBHRyxyyu6MRYz4+uGIJftP5S1h97MxannWJroe?=
 =?us-ascii?Q?DySQtulmjs54OFXbb49ccOTYVJewkVqasYEfBYy3Iw8OydLPlr/5lCP/0Z+R?=
 =?us-ascii?Q?zwKCYkksHw+0welHfRtQn5fubSJwDcqtdVRpZ6oag/6ioBu3AZI27oYg0muc?=
 =?us-ascii?Q?gklsztNLLBQ+PZA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(19092799006)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qkPiX4sYJnwUnxSWnep8gMxB88BNy5Zc8QFElxBe8uaAa1Uw5sJ7Xk1Q7VUe?=
 =?us-ascii?Q?unG1PaFFRqDYeLl3aIq/YWbW0cgWQXDuR5uAbr7A6cMpMx5exjv5IFbzzp1g?=
 =?us-ascii?Q?bPhC8nqptx1hL7ivi0RBtt6gJuQ6LvsbVADR90hIqzOMjC/eTt5er9gXkd91?=
 =?us-ascii?Q?R4WTMxkTOrtu28Bg599VablE9nO4M7LfIEeFJ3wqZP9hZ7kdjaG3T1mxdfPF?=
 =?us-ascii?Q?0lbMn/weGkJsRibDfISJmzDJ/6YlWyIB/hVyiQnXc6U93mOFQiJvYxlHAYXa?=
 =?us-ascii?Q?6yl8jpeyCDdIj3pfdquH+4Op1HFYmBph82XFiAYXFOEWfUKItaR5+8PBe5TT?=
 =?us-ascii?Q?zcFoDHSw3mpqBwNFgpu2HdPbaDC0pZALn+71loWRn5e+5s336SNhOPl7pHhP?=
 =?us-ascii?Q?ULcw/ga+5CCzVQBl8qLnREFR6xysr8RyEFnxCcyjll6HK+kA4oB9N1isnoVE?=
 =?us-ascii?Q?5gQkGXYVfKu1ZZbBDmXb1NFVAf1OS7iE2l+CL9jqh/1MaY4ghIjU6sRjiNbK?=
 =?us-ascii?Q?baVsjmzU9klKv9baZUMfzmfnvVyC2icnlim3BOnzCpWptBj1S2mZgu6mPi3x?=
 =?us-ascii?Q?QroC+2OZKJRxMYjyfV7dw9N2U2RR8Z2Izc/VshiR+DgH9ABGBnHBiWVvqCI8?=
 =?us-ascii?Q?OKd1HjswDp5wvSYaYrn9XF8zt0mQJuAgpE77F9yD9tm3vIq4A59H3yQLjaFk?=
 =?us-ascii?Q?Hu1gTGJkE7GseYk6RZc0klxYTKdrAYrXTB78QwXL83oUUmaRT0vKi/yVTh4i?=
 =?us-ascii?Q?0NjRbb6YhWGrEdsZWZU9o4iKaxbmh0U1zFxv4rK9JGAP1+747Yuo4eTmtgBD?=
 =?us-ascii?Q?0QnKdZIL6GPtxgFKGsVIjj8dysii7NwV9dDMpY9fAiFVEDSlN2hNmhL+8BmJ?=
 =?us-ascii?Q?E/mMbIiI/tOrMgtVLzXY/5payE4bAtbD3NRznqS0Hh3kBtq6bpcDREipLWVQ?=
 =?us-ascii?Q?FOftQdogw725hconLkFrLjo41TOECSW+7Bu7e2z682bkb4bpC/AsjMyudpYI?=
 =?us-ascii?Q?Yf4pZIabfkQL4omUW9s8+R4ohwRfyTNHXUn0a3Q42rlHJAuW85729M/z/Taq?=
 =?us-ascii?Q?YS75Kl8QgznHC6YU+HkEE2Izf8kvxyLw7idwYGvGY+3O55zVuF8Bkh/20nrL?=
 =?us-ascii?Q?+qa/PWrrKn0DLtBvuj8xMv5Eg6qU8GRjN8sqA0UQMs8rVXRSSpW4eQlN5bTO?=
 =?us-ascii?Q?lMY35kzphU5P2Ja6SBckxLqlyCTGjeUnXc2/zYNwB29a7Ibz4nbwyFnEf5dC?=
 =?us-ascii?Q?mEGVLAw/u/tLuLLpYVLaNxS+rD6Kk7Txoea0BPKkPpwt98MJmoA0gg6WVmrL?=
 =?us-ascii?Q?ScrnM2WuAwHF2wbbKAI4usfb1e3WumJtbnkSZ8HfmBfLTshg24cbNkHwLZNI?=
 =?us-ascii?Q?ii+s0uVeGUOBxwRGYkRtVJJsPZsy+oNOWLyD4MAsruncSf+nfdpgF5q5MgLW?=
 =?us-ascii?Q?UPx5VJnrCFTx5VKulRDmRldddBTkugkZVhzrYGZov1Nw730xvFDmvkmqokXb?=
 =?us-ascii?Q?PJ2hZ8sRxKtEDvJW5MagE2XpPnlgrrMbcdR3igb5+HL7WUXk3DPG1uoEmcPg?=
 =?us-ascii?Q?PRC8yAJPhU96o2CqUvBkUQffq1xROaget3cRAnKr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 837e61a6-c80c-4897-18da-08ddd10987af
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 14:41:41.9876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qy6UHrmWEsfXcg5q7z+VNf2ZyOWyC3Z+aYcAi7NNLtrtqQddZiFTxwN7p0pUjCWYWTt0COo8eu13QAiSMhUY7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7332
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_074150_742029_91DFD856 
X-CRM114-Status: GOOD (  32.94  )
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

On Thu, Jul 31, 2025 at 05:14:18PM +0300, Jarkko Nikula wrote:
> So far only I3C private and I2C transfers have required a bounce buffer
> for DMA transfers when buffer is not DMA'able.
>
> It was observed that when the device DMA is IOMMU mapped and the receive
> length is not a multiple of DWORDs, the last DWORD is padded with stale
> data from the RX FIFO, corrupting 1-3 bytes beyond the expected data.

Some I3C controller such as ..., pad with stale data from the RX FIFO if
the receive length is not align with DWORD (32bit). [when use IOMMU] (I
suppose it is same behavor without IOMMU, you find it just because IOMMU
capture this problem).

>
> A similar issue, though less severe, occurs when an I3C target returns
> less data than requested. In this case, the padding does not exceed the
> requested number of bytes, assuming the device DMA is not IOMMU mapped.
>
> Therefore, all I3C private transfer, CCC command payload and I2C
> transfer receive buffers must be properly sized for the DMA being IOMMU
> mapped. Even if those buffers are already DMA safe, their size may not
> be, and I don't have a clear idea how to guarantee this other than
> using a bounce buffer.

their size may not be WORD aligned. (Actually, it is require cache line
size aligned.)

remove "I don't ..."

>
> To prepare for the device DMA being IOMMU mapped and to address the
> above issue, use helpers from I3C core for DMA mapping/unmapping and
> bounce buffering for all DMA transfers.
>
> For now, require bounce buffer only when the buffer is in the
> vmalloc() area to avoid unnecessary copying with CCC commands and
> DMA-safe I2C transfers.


This patch major purpose should be use new common helper function
i3c_master_dma_map(unmap)_single() to simple mipi-i3c-hci code.

>
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> ---
>  drivers/i3c/master/mipi-i3c-hci/core.c | 34 --------------------------
>  drivers/i3c/master/mipi-i3c-hci/dma.c  | 27 +++++++++-----------
>  drivers/i3c/master/mipi-i3c-hci/hci.h  |  3 +--
>  3 files changed, 12 insertions(+), 52 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index 60f1175f1f37..b2977b6ac9f7 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -272,34 +272,6 @@ static int i3c_hci_daa(struct i3c_master_controller *m)
>  	return hci->cmd->perform_daa(hci);
>  }
>
> -static int i3c_hci_alloc_safe_xfer_buf(struct i3c_hci *hci,
> -				       struct hci_xfer *xfer)
> -{
> -	if (hci->io != &mipi_i3c_hci_dma ||
> -	    xfer->data == NULL || !is_vmalloc_addr(xfer->data))
> -		return 0;
> -
> -	if (xfer->rnw)
> -		xfer->bounce_buf = kzalloc(xfer->data_len, GFP_KERNEL);
> -	else
> -		xfer->bounce_buf = kmemdup(xfer->data,
> -					   xfer->data_len, GFP_KERNEL);
> -
> -	return xfer->bounce_buf == NULL ? -ENOMEM : 0;
> -}
> -
> -static void i3c_hci_free_safe_xfer_buf(struct i3c_hci *hci,
> -				       struct hci_xfer *xfer)
> -{
> -	if (hci->io != &mipi_i3c_hci_dma || xfer->bounce_buf == NULL)
> -		return;
> -
> -	if (xfer->rnw)
> -		memcpy(xfer->data, xfer->bounce_buf, xfer->data_len);
> -
> -	kfree(xfer->bounce_buf);
> -}
> -
>  static int i3c_hci_priv_xfers(struct i3c_dev_desc *dev,
>  			      struct i3c_priv_xfer *i3c_xfers,
>  			      int nxfers)
> @@ -333,9 +305,6 @@ static int i3c_hci_priv_xfers(struct i3c_dev_desc *dev,
>  		}
>  		hci->cmd->prep_i3c_xfer(hci, dev, &xfer[i]);
>  		xfer[i].cmd_desc[0] |= CMD_0_ROC;
> -		ret = i3c_hci_alloc_safe_xfer_buf(hci, &xfer[i]);
> -		if (ret)
> -			goto out;
>  	}
>  	last = i - 1;
>  	xfer[last].cmd_desc[0] |= CMD_0_TOC;
> @@ -359,9 +328,6 @@ static int i3c_hci_priv_xfers(struct i3c_dev_desc *dev,
>  	}
>
>  out:
> -	for (i = 0; i < nxfers; i++)
> -		i3c_hci_free_safe_xfer_buf(hci, &xfer[i]);
> -
>  	hci_free_xfer(xfer, nxfers);
>  	return ret;
>  }
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> index 491dfe70b660..669d026646b4 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> @@ -349,9 +349,7 @@ static void hci_dma_unmap_xfer(struct i3c_hci *hci,
>  		xfer = xfer_list + i;
>  		if (!xfer->data)
>  			continue;
> -		dma_unmap_single(&hci->master.dev,
> -				 xfer->data_dma, xfer->data_len,
> -				 xfer->rnw ? DMA_FROM_DEVICE : DMA_TO_DEVICE);
> +		i3c_master_dma_unmap_single(&hci->master.dev, xfer->dma);
>  	}
>  }
>
> @@ -362,7 +360,6 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
>  	struct hci_rh_data *rh;
>  	unsigned int i, ring, enqueue_ptr;
>  	u32 op1_val, op2_val;
> -	void *buf;
>
>  	/* For now we only use ring 0 */
>  	ring = 0;
> @@ -373,6 +370,8 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
>  	for (i = 0; i < n; i++) {
>  		struct hci_xfer *xfer = xfer_list + i;
>  		u32 *ring_data = rh->xfer + rh->xfer_struct_sz * enqueue_ptr;
> +		enum dma_data_direction dir = xfer->rnw ? DMA_FROM_DEVICE :
> +							  DMA_TO_DEVICE;
>
>  		/* store cmd descriptor */
>  		*ring_data++ = xfer->cmd_desc[0];
> @@ -391,21 +390,17 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
>
>  		/* 2nd and 3rd words of Data Buffer Descriptor Structure */
>  		if (xfer->data) {
> -			buf = xfer->bounce_buf ? xfer->bounce_buf : xfer->data;
> -			xfer->data_dma =
> -				dma_map_single(&hci->master.dev,
> -					       buf,
> -					       xfer->data_len,
> -					       xfer->rnw ?
> -						  DMA_FROM_DEVICE :
> -						  DMA_TO_DEVICE);
> -			if (dma_mapping_error(&hci->master.dev,
> -					      xfer->data_dma)) {
> +			xfer->dma = i3c_master_dma_map_single(&hci->master.dev,
> +							      xfer->data,
> +							      xfer->data_len,
> +							      false,
> +							      dir);
> +			if (!xfer->dma) {
>  				hci_dma_unmap_xfer(hci, xfer_list, i);
>  				return -ENOMEM;
>  			}
> -			*ring_data++ = lower_32_bits(xfer->data_dma);
> -			*ring_data++ = upper_32_bits(xfer->data_dma);
> +			*ring_data++ = lower_32_bits(xfer->dma->addr);
> +			*ring_data++ = upper_32_bits(xfer->dma->addr);
>  		} else {
>  			*ring_data++ = 0;
>  			*ring_data++ = 0;
> diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
> index 69ea1d10414b..33bc4906df1f 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/hci.h
> +++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
> @@ -94,8 +94,7 @@ struct hci_xfer {
>  		};
>  		struct {
>  			/* DMA specific */
> -			dma_addr_t data_dma;
> -			void *bounce_buf;
> +			struct i3c_dma *dma;
>  			int ring_number;
>  			int ring_entry;
>  		};
> --
> 2.47.2
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
