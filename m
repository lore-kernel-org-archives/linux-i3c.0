Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE0DCA0EFA
	for <linux-i3c@archiver.kernel.org>; Mon, 25 Aug 2025 17:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BI8doXkoWy8EhMBwGz9ejddG2qB448kltY2ChC6nT4w=; b=CRE9Rw/NGeRhtL
	UUpe4C2/wRnyMM6AwifUgGSgS/FnM3StC+KF3+b2TA7tqVzOf49YfCWYjBD6J8gghJocVdQ2+nHLt
	lSnMKia8yeW68lcRxKJu2XutRKJYjdz+f/OL6o2O6FnEugwRoYqVeEkM5GXBWbyfBY3l3sXtWPAv6
	SHwsYFeG3ZwJnFyJh86Ee5cWp9LtNPfJEiWKVXfSF1KgO/5dxfW9vOUADdUWTkic8iccDFtBjjyT5
	Hgo96lh4H8owLLzajvtQkTByjwuccpcA8Z9RDkmbuL8YtiuU9YfZED9fWozfWAaqNDvW+GrthRD95
	cYu70RTdGjgRNi0g70iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqaZ9-00000008kyR-29Ve;
	Mon, 25 Aug 2025 17:01:07 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZz5-00000008eQJ-2xd8
	for linux-i3c@lists.infradead.org;
	Mon, 25 Aug 2025 16:23:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KG9sCepTok4zK7DxzJ8+nTyAUTkYn1BivAgJM/z3eI4SepMtw+ON5TOBD4uku98TiJgBIBzCqlwCcLw4HzDgRCwXl508X9thxGBYtDqjc2R5lepG5DdKv2m6DkkaZEZfKkWCeo4T6EFMFPniDD1cJY8LLm99e3JJkl5ig76k+1yl/QAv9Srr02++uOXKetioYI9yBUAfWHUmPYyoeBy3+r0YSXaAH6/dwQQIRY35quVo2omvNIUX/st87ug/5vo8tfCP31ZDhQlmE2MYyUF//IsPdU2ASClYUByJ7zj99WNIZN3BTyJn/wl6Vi0Inb/kd9V0ltEj/hbyScPakMRR2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/P076x+RXQTo0pRKQPW07M94MR3gp5fp7DcLiK6oLEQ=;
 b=W+31fpmbi5x4KkFTkWQ8sIXavuWvuZvPWIhtuy5nBa8cGymaWXUA6ZJNAM+DrCJz85pe9885yDav+tQLOdM1tkV1g1Vg3mzR8noz8d9Zf1HdFH03rHibtR0FbBLPiOSMYKMXOkvngpYIOBN3tVsI06HulkbZno773/4rMoWHKgosp48+zu5KcgAOs3VfRM8e0eKdQcxodIkpmyx5N/r26xA7ZV7fCDxcYLcb1AtLpJSxVllbd9qWLGjJ2Wg3n5J0qerGhRrJraMVolJpq+WaZh4crXeWz7bFtKwPPjYIHQpwn8Ls0S9std+r9LU048z4SWGfD9HdXEyaXJN8n40hoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/P076x+RXQTo0pRKQPW07M94MR3gp5fp7DcLiK6oLEQ=;
 b=LLrPdbp/Gal1nA1Cn+pAH4w3LAJBe1tHmbW6s4VGOY0uu+m4TkAwhyskx9PlurOlaXISA+EXC6Yto3RgS5cEMCCnHkaPnis6swQF//DVzDm846k/o6DE0W+xCnshQSgWpMRf5Kf+sUQSUTFPxJJVe2w8F7enugMnU7uEbbbvaNQnXfWsWjt6JMC116OUgBS90HcXilxhVnknfVaAbkiwuigqIWzkj/E//qsOtbNcuLA5jYAKfWfBsJOydLC80etxxhV3eHbhVCmPPpU9OwT8rFb8onXEDvd36MmEKL6+vAWFIhI9TEYcSLx7zZNcBmDfXzipvqHtnzu9aWO+6JKH/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AS8PR04MB8499.eurprd04.prod.outlook.com (2603:10a6:20b:342::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Mon, 25 Aug
 2025 16:23:47 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9073.009; Mon, 25 Aug 2025
 16:23:47 +0000
Date: Mon, 25 Aug 2025 12:23:41 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v4 2/4] i3c: mipi-i3c-hci: Use core helpers for DMA
 mapping and bounce buffering
Message-ID: <aKyODemS7jryOn8E@lizhi-Precision-Tower-5810>
References: <20250822105630.2820009-1-jarkko.nikula@linux.intel.com>
 <20250822105630.2820009-3-jarkko.nikula@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <20250822105630.2820009-3-jarkko.nikula@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0299.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::34) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AS8PR04MB8499:EE_
X-MS-Office365-Filtering-Correlation-Id: 21ffb28c-cc79-41e9-5226-08dde3f3c4da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|376014|52116014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kDtFRyci5DbSmwzHhfPM4AUN6LHd0cvIK1wsj621wkiua84sdU+etfMiklOy?=
 =?us-ascii?Q?lxCFqAIbbgbMGwUGeTuWVsmrdy1sigSXfen4WekZMbSQqOefwwGY08mdxZcJ?=
 =?us-ascii?Q?BYWyysz8XwLzdHDYVAp0BIcNFzSpcaru3R1MeN8soSvp1k7AJ7HOVMOlGELM?=
 =?us-ascii?Q?6BRBImc+n89dHqeVuqQamWKpV8oakKUp9NwcszhZbPVnzGaZm+9xv9zkndol?=
 =?us-ascii?Q?H24Jko5x0v796xo7M4nbM6g/2E2/VkFAQbfxe6iEtjolKLtcU/iCmZLz+e0r?=
 =?us-ascii?Q?6BhcCpx6+lJ/wO0p53DjPcj2iev19rLGdjZUL5sTDKMZ1EQTmZ3Fk+Ow2ZJd?=
 =?us-ascii?Q?Rei05oNdaW0vQK9AFhnvtP0yyv7F0mxw2LcyQOtJfwHsHfflake4Z2Qke/k8?=
 =?us-ascii?Q?m/dYcmXcHkBI+PtsJUH9dpO0giVz4/tyPX162SPHY8psP/egdE1cQetTHtMx?=
 =?us-ascii?Q?SEaiGnEcWKjRHk5BnJv/OSfWYNoQpBGO5qK/CWHHYOOdPISMXbiwdQ8RRTwe?=
 =?us-ascii?Q?1jF+d9elerK2UQmIvQiMh8TnO3bDwMruJHMOlj+UXdcPd6GDowMZSEhDJnrB?=
 =?us-ascii?Q?w86coA3D7C/F/+/O6E/qoP2MnJW/WDM4B9QOeN4gs/KsqZWTMHMY2nIAm0cI?=
 =?us-ascii?Q?NedIoJvl6e+vlRcrDuoBK95uDImAzFm5s2Z8phMKz3e61BUOJ+zd3gK+zl18?=
 =?us-ascii?Q?0vK1vSP4XzM0wVTdJ3x2p3HY7iAbkWOnl5kWLboAeUXuMELnUkH/lc5tlK5x?=
 =?us-ascii?Q?Gl7k/KHlnka+x7xr7oc0ds/OvuhYV18xXOggrDvq/hH3KnEhVWHTxFC50Rgc?=
 =?us-ascii?Q?jkRwTgRl4cs9leUbyAyIdt8vSlgfa2euSuDaJazSAafXwxelReOB+Sx1zx1h?=
 =?us-ascii?Q?JVAyQMcDz1+7ljegmOEDmck2u979rjObuIho6+NxsM+5iscv943JqKngi5i8?=
 =?us-ascii?Q?uUwp+OJowyHnq51E9sSqCE0eNqWr7X+cxljMPraJwoHHDSP/rkjDqKOnOtCl?=
 =?us-ascii?Q?IIGksiX+Ttt3ToVzm8HlS/BYOT9S0IwjPJ2o4WK22IqMpgoina4AEFolNR1V?=
 =?us-ascii?Q?YEDtxJ4Zn8dVhmjk/7WasHzsX7UgJCi38zeHzavjTiEARNQPdHUNl32xHn6F?=
 =?us-ascii?Q?loFxvcqjooAzRLgO0M0Ly5Uok7LE0/KmGykgQEFRrmpKyWEyiHhmr1rad9NI?=
 =?us-ascii?Q?o073dax7pLkbYfHmLYARH84v5yeV/UBLDhdrKgYJ6b+4NTrw8Iyl3Jhp6FXI?=
 =?us-ascii?Q?cMTxBJ4kJuD+OQq4EM3wNLF5mtrzGRA53Lx82YUwSweDf3qSzGk1CGS4Bhov?=
 =?us-ascii?Q?m2VcW7Rwgibw5rQ/untbGPj03AEDQZeFVMePw2npjzANEcwaJfK+16uLTFMv?=
 =?us-ascii?Q?8JN1v2EM+ClFsdbqNvO/G+MTcgpGTUr/9igJkUZAnh1g0hTPehAIoIBJHRJG?=
 =?us-ascii?Q?tFpPCQNGGsOfpaSv6GjxKGX1WTqtufB4qA39tgDM+SQs1jT3GNHd9cBa8v0S?=
 =?us-ascii?Q?Akt+MpYTtt9J6eU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(52116014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9Bp4u6F3hg+yFRCZPLmppecNh3IAA70/hYWtU6vRE4iZQ4EKSGPizpLplY8M?=
 =?us-ascii?Q?2joVzqe4FR3jaLwPavqx/Sgt+1iLWMLWF8tfBzz4OBO1fzeHm4ZPdJ5x/4+q?=
 =?us-ascii?Q?GmzJy1nvgo9gLEHxAwQkq1ZvTKnjLkOrVYBiO+yvLil+dcgDJArtHW8KFvS6?=
 =?us-ascii?Q?AYH67GMVbR5MZ9tE3GeXyXNPCOvMPHSrf059Xst58nqNIRMndDSaoJjiWQaX?=
 =?us-ascii?Q?sNsAxB0hL5DqbCved4nQUYuAw5Z8qVdcEIWXcvMB2rrEqXVEuEjHddiqX93f?=
 =?us-ascii?Q?Vdg9RtjDy36bNnRhBVrqQx92cORpMQMjcWrgnj/lxXSXbmh17VFvpDc58y4n?=
 =?us-ascii?Q?tOMHV9zBUwFoglektEq51tMDK1HdDG4kOgyH9cNJX7r48C8AMrgso0t4t77H?=
 =?us-ascii?Q?0catIPpI3zF5u0p0GOxasZ3J0zpghNX/uf865QNumOLc8jV975oOIrFLaapU?=
 =?us-ascii?Q?QKQcGC1waXWJL93r5cMKi+gvVhfF8t13GyhDgVr1sQy4Dn1Rusc6TPK+d3ZR?=
 =?us-ascii?Q?eZ7uvP9xq8mOJzuerp6fKVjZIeNebnxqUslE7PhkKfWmf/cpd34/g406BzcA?=
 =?us-ascii?Q?EIrOQ78ovUIZF2cAYNjRKZodcjG1MWnhVUYpuMfmtkAiXAuxIEK0CQIoBIkr?=
 =?us-ascii?Q?pL0axfA3ecLFDKpI+qUr7MrjKKkjAdsmALWnBI0Dc4t2A0bZwBgcaxWF1fjD?=
 =?us-ascii?Q?VsfC0gpZD8P7n4bJHUGV5DkPQWrcRveavzDKPtwF5eGwVLWOP6UUZztD6rBw?=
 =?us-ascii?Q?4rh0K1/EGtazvkJUAfqVHeMpiPjiPphJZkck9uYUsCUgo8qeNFGZ3Y7SYm7n?=
 =?us-ascii?Q?skphvES0R4b4YHhCkTFH2rK+TVCtZolk1Jo4VHyFaSTVGzg/g6nu6Tt68vi/?=
 =?us-ascii?Q?Mii3UXd66Gvlto7xvh/D3MBrZLYcar1FOcZYs42AigB2wM4qCqyujrBTjV7q?=
 =?us-ascii?Q?rQl758yG2X7A2mdSbprNyIlVTODI86Fw9IgX5OPVapCpM+oFix49XH6ca/yj?=
 =?us-ascii?Q?m4gktj9Nt8f5DL8ba36kj2b+d5tpJ2YK9t3cYq1SOQ9tLHmvULss9gXJbG0O?=
 =?us-ascii?Q?PHXFwR450Uu5au+7iXge0zD1yMBhTmGak3fs/k0yGqxE39JnNZE8h4PFZfJx?=
 =?us-ascii?Q?VMemQ88gbG5fwr4ImgRqsWD+eqc+b0tPQxL08dipY1AWFnuXesAX/DI0G+dw?=
 =?us-ascii?Q?t+nWsKUcWriFdg2K/f7RlUTPc0X/8ch2mPuX7V7EdFaprUhhVtbbJ9FDjZZS?=
 =?us-ascii?Q?0f3jfrLt8StDG85Zr8H+Q/CI4CvClgMaInPnFC5ZEQbkoR1kDwoNv+jfe/N7?=
 =?us-ascii?Q?zcO38oPl4oSRagwMGUaSHyitOwaSI1U4La2wb4ReB+9OUVMOGdvQaPJ5OnKG?=
 =?us-ascii?Q?9vPTnTW5X1yOzGjmUx8S6byh7zvEc4Qn+vV5/zcRWeNHDiecvyazFbpQgcIn?=
 =?us-ascii?Q?hxAm4hzlxVUWu1WbBMgLgDBePrDyqezlF22sg3uAbl3TLBXsfaCl1tn9JcDT?=
 =?us-ascii?Q?wSLbh4i9aEb/67kO8ZnikBzDbciGDs6/EaegXlldtKmrfP8fGRYv49oJ3x3k?=
 =?us-ascii?Q?CF5Snx6aFxT/jgOB/1oSpXAZe8aj/L1kubzvaRaG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21ffb28c-cc79-41e9-5226-08dde3f3c4da
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 16:23:47.7677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NhxT3wT6aenWeXvYP6b2fk3uj/2dr5wLCPuBd+kyXV+pKzQW4Nwuu7n+mrA6oiCeYqZvNKq3R7x6sxKr5BCezA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8499
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_092351_901208_BE43C3EE 
X-CRM114-Status: GOOD (  29.36  )
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

On Fri, Aug 22, 2025 at 01:56:28PM +0300, Jarkko Nikula wrote:
> So far only I3C private and I2C transfers have required a bounce buffer
> for DMA transfers when buffer is not DMA'able.
>
> It was observed that when the device DMA is IOMMU mapped and the receive
> length is not a multiple of DWORDs (32-bit), the last DWORD is padded
> with stale data from the RX FIFO, corrupting 1-3 bytes beyond the
> expected data.
>
> A similar issue, though less severe, occurs when an I3C target returns
> less data than requested. In this case, the padding does not exceed the
> requested number of bytes, assuming the device DMA is not IOMMU mapped.
>
> Therefore, all I3C private transfer, CCC command payload and I2C
> transfer receive buffers must be properly sized for the DMA being IOMMU
> mapped. Even if those buffers are already DMA safe, their size may not
> be DWORD aligned.
>
> To prepare for the device DMA being IOMMU mapped and to address the
> above issue, use helpers from I3C core for DMA mapping and bounce
> buffering for all DMA transfers.
>
> For now, require bounce buffer only when the buffer is in the
> vmalloc() area to avoid unnecessary copying with CCC commands and
> DMA-safe I2C transfers.
>
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

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
> index 491dfe70b660..351851859f02 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> @@ -349,9 +349,7 @@ static void hci_dma_unmap_xfer(struct i3c_hci *hci,
>  		xfer = xfer_list + i;
>  		if (!xfer->data)
>  			continue;
> -		dma_unmap_single(&hci->master.dev,
> -				 xfer->data_dma, xfer->data_len,
> -				 xfer->rnw ? DMA_FROM_DEVICE : DMA_TO_DEVICE);
> +		i3c_master_dma_unmap_single(xfer->dma);
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
