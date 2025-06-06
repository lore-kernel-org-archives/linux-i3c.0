Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F36C5AD49
	for <linux-i3c@archiver.kernel.org>; Fri,  6 Jun 2025 15:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VJlOKR0yA1NI+6R5xDNMlMzJAHzx0J+TDj6D/NhFFG8=; b=KEsctlbE+aEl9K
	F17VW0YamPdRw/WzkCdga8mFpEhP9tlyfcc+KrMZfb+iHfATPfPzzdUHsgI3usnBIU0MfZ7asc0QG
	k4/jHYlxHa/aYkLq10p9Rkl4uFCuBfBRNffk6oRV86vS92blJz40yTJ1C+ew0Mch5LJpZ4V28oawI
	cu+5EPoquSmuFcGsNOt+2FMQ5jCz2NKVKYnjnOujza3aKU1D8Ahl6yBaK3NHirxuKzXu77oLsG4YS
	ket4U1q+4tlKFUkDwItmARAdSTxPbk2Fs8rw3IgCTmSU+Eos2iKj4r5j07NSZ6x5eviIy22cVZOT4
	NNsLbQy0+vViHQZsxTwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNYao-00000000Tfe-3asB;
	Fri, 06 Jun 2025 15:02:50 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNYal-00000000Tei-1qer
	for linux-i3c@lists.infradead.org;
	Fri, 06 Jun 2025 15:02:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DdVSdxEDcIgX4A/spw5UIK2/STM7aKuSHZd0hJfYAqJpvfSiJYpEFwH0G2orXAMIjcPfD41QLzIG9lwND4IOp0osqtXtfIcUgV42lH6EfQVKz0SElBsH3+lsMyLoOfEyijFVpj1WrA6bvtNODbT8STPc0anCtOMpIOWXyf9P04ndqTnDE+sO1VViaDu6vdGubkdWz3hMcm7x8kYjfjBsX/ZWglhIjDBXLSRoyKtRpN2evTgJ9xhVLsLAM286ufbNplkG3lA+Tn//iKpysZyQR9rvDULgqucfWzwuEwCF35wsJaQMYl52G0HrmW/t2A9tEMeOSbml9EnFmvxTAkztBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ND4LLeUoUztbsyg2PmKouRAr27poXe8S/7m2L+ukjaI=;
 b=poJ0H5rFcpJMzUfb8CknWSzLMZPStU0afuIEgRk6rREUa82I6afi3dCT63cso7UkhevX2k0JFbV63JkXNAaLmGitAxsz9ahpfxuAHUW6U+54IWhZ9pigNkZGtUHj3gLDgGy/WB1DMayI1/AiwhxwIv2ZgeY43t/WE0RdfQD4A47JLURUXeFPq5ESkITJKAg6bKrepwtRKy8+OfvVTWKs09zvKjNDgLR2uV9yjjp4dJf/WBrBupH+9ouFyfCsG6Adcq7VefZqH9dgRHyn2vQ/GTSNnLi5UTKGrgqufXeYA2NRZy8MXbNikWDZlxuBESVAY+iHBW7cHN5ipU5mfpcjMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ND4LLeUoUztbsyg2PmKouRAr27poXe8S/7m2L+ukjaI=;
 b=F/LtwHE1CyMFTc2oEO/arPceU3agA9saC/3VBlMS79LkRIRddOysKn22wvfKfisR1D+FUxkLvQ+lbCxLup0NU8E7jVk8HkXWLRmt7tFUH6flhozBH5psW57jMLHegBPf+jP0pJnyKKjWbdSXQEAZ3Oc0nLrVkHZ3YGPH32mEBrwL6rHYdGqvu5GYluJbxR6rxdwjyIgKzTEAqYUi8TgIdq49Up2cHLfRtgkzLy0KNxoyB6EzaZ1+CDTOqYxv/GN9dVhEgjCiZPOBe0voMJhyPxDvenvoEYsLbaDK5xFzxv/UzN4D++0NLFkV9Tm/D3/1c9WqutRFP/cei0XsIOjhUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA2PR04MB10185.eurprd04.prod.outlook.com (2603:10a6:102:401::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.23; Fri, 6 Jun
 2025 15:02:41 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Fri, 6 Jun 2025
 15:02:41 +0000
Date: Fri, 6 Jun 2025 11:02:34 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 1/3] i3c: mipi-i3c-hci: Make bounce buffer code generic
 to all DMA transfers
Message-ID: <aEMDCi7RYbQud7WZ@lizhi-Precision-Tower-5810>
References: <20250604125513.1593109-1-jarkko.nikula@linux.intel.com>
 <aEBfpZ6Fa1DoFVS3@lizhi-Precision-Tower-5810>
 <bc599310-9287-4023-a204-682771574528@linux.intel.com>
 <aEG0DitRE/49aXI5@lizhi-Precision-Tower-5810>
 <37051b2a-0969-4482-91ea-85b1a9c2fc5f@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <37051b2a-0969-4482-91ea-85b1a9c2fc5f@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0190.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::15) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA2PR04MB10185:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fb789f2-3517-4c51-e79d-08dda50b2f34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Kmt+ZaHsFhN95cspydHQpfJ4NFKj/dyhXUvEhmQaCBSYgnh+o/KHHY7rvPaJ?=
 =?us-ascii?Q?I4sscO7LS2uqksut781WmwKXh6HHp0kVrbXGcGioOVP2xikdSGrOL9yb1/iN?=
 =?us-ascii?Q?Sw9bpa9A/s/j9/UiIRCvVoZE4F+j6xSY60rt59q6oVnTFYbkbzAEoHVNPMu/?=
 =?us-ascii?Q?TtyEqzaDcqwQKFcwjirV8nzHE1mzHD8SfLo1hQHnz822uGmTs8bYV2902fi8?=
 =?us-ascii?Q?7K+XtRR+K++FEWJItygs9c9HNOhXwE5CVgVGvzeClg5IeHipgND0V8VUjHcN?=
 =?us-ascii?Q?HAWNwwP+1NOUzAEMEZzhI/Eb1dVxo0I8syoBUQ+1GOOuKpU57o+RpMunCdKx?=
 =?us-ascii?Q?crnHOJV4Ydyup1MfOk+0KkFUV9s0hCYmMxAjcqh0CIJgl8EAaPu1/SLYwhJc?=
 =?us-ascii?Q?l3Szl/aAAU7ZNdPJtPITykFDyUyC2LVHVvSJX+Irgl3/HSYS4Q3prCgEbV3L?=
 =?us-ascii?Q?RUxLLLjtJd9a7N20oyfBXW8liKfkkxXW+mKIVmeKx4dlxC+OdSA5gYwDIz+o?=
 =?us-ascii?Q?H3CUuqSWUjQWV5cAh/x4ebzKwnTD8S6+vVAUoZIQLCRw3FFNYI/2Fw7cEvwK?=
 =?us-ascii?Q?PJI0N4tLL7kulJ37OHylFzXg0q/l2v4oSy6Ws3IoD++m0y70pLuxSv2TTs+n?=
 =?us-ascii?Q?XcIq/QIe73QRiP4hVcbebyTTNgX1tke4XVTarsjuWg9NGYQ7uk6CQ1xhCwi1?=
 =?us-ascii?Q?JlPGb9/eFNoV+jcCeukASHe+bZQ5vJlv8bGyK47W4d9qPprDdM3u3/D/j8AF?=
 =?us-ascii?Q?8msf0pIXGewsBhFotc5Edb5ssrhw2DNqAqy99L8R7U8zaF+Mxn9bNCY6VvIz?=
 =?us-ascii?Q?yn36ICd2IMGAZLQvIrCHrwk0w/YdmPFi2VlbgbvD3RtkLaIPENju5hZv6ZJn?=
 =?us-ascii?Q?DITXHw1kj59npS5wUZzaKtCCR/FtHaUpPUyxSjBxegQ2KTHICRK/nhFqQ45J?=
 =?us-ascii?Q?u+qh/EKit5PtJ2Nj+2Mgwic9q4R6lEVzoS6B5patg0rTetAAQiOUap86mdfj?=
 =?us-ascii?Q?L8pmKbsBdrh32Wt6T0B9Ip478L3iau4kjczFtINw6MEOEgb+IGMM9IMT5i8X?=
 =?us-ascii?Q?/4aJsEgxGZmLPbpiAQOluMGBjfAaUblD7LQCR3+0D0hUqmJ6dUPsIyEOQxU9?=
 =?us-ascii?Q?V6ZvLN55hB/FICxZnR6YVV9GzT0lgoSjvUDyOaE54I/2qdJSq1zKNUzZmsFf?=
 =?us-ascii?Q?HsC4doPYpNKdaasd8RWxZU7UhKdCCpRoP66+WSDNK1k6V3j1fxp6R3PN+P4h?=
 =?us-ascii?Q?p0ZIjlBGPlGooIboh7N/B6XxYxfBrkjYRDum6QVscjjx1hVWEiOsb3HWo+Za?=
 =?us-ascii?Q?WLdnlTXWzIZKjBL3+okojGJ+1uBnCRWEXbzbwpC/i29tcKvVioLc9U8+4RiX?=
 =?us-ascii?Q?9SE3T7UWOCtfph6AmBx6Gay3moml3UzGOPLXtzKV2kAWpfaBYQnRi9lhMbhj?=
 =?us-ascii?Q?hPDVdUm+jFtLyXtc7CBOFpsFrBsZiJqofzM4ie5MtM7G9VmYwNdkk0qehYc6?=
 =?us-ascii?Q?lxMlGxyvdiJErxE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qMCkWnKzaAZ8tQNGAOv3tKFu/MtOQ4Tvrvsj8OMCMVuwloMv9Qx35T1yVbXP?=
 =?us-ascii?Q?mR8LftZEJjjyfs1Y30Z0rd59HpYqt4ETt5VHt1ttL4XCTOnW1IoV4FWDXICN?=
 =?us-ascii?Q?lE0cBciXvvho7kwLw9Culz9oEFve4YleCjz/RTETCQZdOhNvnWrihMJ8/vBh?=
 =?us-ascii?Q?sOtAljCxL3zlvcVqSBxu5bvihcnarxz3o6Cvy5N3drNju/BYS1TT5l4mziJM?=
 =?us-ascii?Q?o1LkgfOwlKcDCl5PF1WecVU+eJBjIa+DoJgzfNNEjS68+N2S6mtopCnbeip+?=
 =?us-ascii?Q?f3Atn1LjMXHQSa1oQGCS/8CKlwHpj3wqDSQrq5PmbT66J/de/SCkg/epjdJe?=
 =?us-ascii?Q?0nzI3TbsJp8oA+WYnf51wC8AYiztYGmU+v5AB4Fc68okFdc7TJxju+9/kt+3?=
 =?us-ascii?Q?yE9cRbd9bKUx9ZwYJY/JbtcUBqi9DCAIxV4exgLizKUr396PQjApUlgS3UwR?=
 =?us-ascii?Q?UaBI8CVVVNEPAM93nSYIQ5PamBC+x35zAsuigU2E04/biYgB0AJ6olJbLthr?=
 =?us-ascii?Q?jSvao5Xf8UPINZT21+BptqHFI0gg7xt2YjyeUSY6pITk9hZeWzEAEf5jUF4h?=
 =?us-ascii?Q?zIhZwq2Q5tBbdWSVt1J8XZ5rWce6JHDrkMNOVEy+SS2l/K1Wmad5JQMm8SW4?=
 =?us-ascii?Q?N4GvAlKjkkBEW3dUwnY2cH4nLA+WeB4U0VGdRUatPef8FDSKld0RwPULJeWU?=
 =?us-ascii?Q?9xc1WEmKnemXDMSXoSX0H7mVNK7acM0dyD9kt+BHfwTzAZY4uMGDmEbdSypS?=
 =?us-ascii?Q?nihUJWxCsBVYrfKN4LzDPGQFo+Wpf3Ww/qejZhv5N8tUiglpl3UkwwHChjhL?=
 =?us-ascii?Q?RIhS9vIbV9bsYtJ23U2XB2xGKWEJZ1xBdZyDqdlOIfjO8CHpn1fKAaPdbcX8?=
 =?us-ascii?Q?8RWxkSuhkulqBiem3x4HwLUFup1Vy3ka/oc5rpzU3n6OF8SkdHvtEEL5UXaU?=
 =?us-ascii?Q?1+lG6eUI3lXWvb2zEqSMStsHBBCOJ2GBXmgMRC+2CRkcwtynKagu7U/zpjjp?=
 =?us-ascii?Q?OhjyUmrAkQ4qGofL0ndRW1z9F+uVcMAQWavKGNbyIK25evTTjecqIPwNpKC9?=
 =?us-ascii?Q?pHocNL7lcv50AddyF58LC2MvZwF4Ud6huacZ41v96Z8lpTHV/Bmv5wHcgGzC?=
 =?us-ascii?Q?Z6h+ToSaUZmsydFt8lhTc18RYxS0ysjw1nhBRaFu60/uA7cyRMVpljsha0Kc?=
 =?us-ascii?Q?5FWf0AQ0Gc0u1AY1f5tdAhQxc52VcGA+YCXx8yRhPvq1ae3lO6YdagIuaqeW?=
 =?us-ascii?Q?5fyXCCp1PpZA4Zt+Wz+1swQwfOssNC/ckLQ8NXZVXdbSglhNvMDJ177RYyib?=
 =?us-ascii?Q?zWL5Q6gHYFzOmrh0SWRdF+KIprF0l4JqovVybv9dg3/RA2h2hdLQkh85x6tf?=
 =?us-ascii?Q?iDBaSx+2Uxz1azPr0FqR545WsT0UgaGrcdYHLPobanSruZWwyfsiL2donl4x?=
 =?us-ascii?Q?FzsV3pIjwBuUQaarpxbb/xVz8nuF95fDUC0n/PIlf9L30BggK8tZFYgpCPI5?=
 =?us-ascii?Q?kCe0im0zE7BnJ8X8BZG9K/z3a8SgT/+SWNJdc5j9EHA/ddbS4H2x7KZfRBs4?=
 =?us-ascii?Q?TjaqxN+mVgSiEnjyaiViPduIjwnl/Eyjr9QwhWlW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fb789f2-3517-4c51-e79d-08dda50b2f34
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 15:02:41.4700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N27okI23MULYTJCWVdMqqtQDj1HWv2ixFNPiK8Iv4DdtQvJrEoGV0Ooy+Benzl6BI/V6kjBvmSIJpoW3frHTOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_080247_503998_9E697472 
X-CRM114-Status: GOOD (  41.63  )
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

On Fri, Jun 06, 2025 at 10:16:44AM +0300, Jarkko Nikula wrote:
> Hi
>
> On 6/5/25 6:13 PM, Frank Li wrote:
> > On Thu, Jun 05, 2025 at 05:07:19PM +0300, Jarkko Nikula wrote:
> > > Hi
> > >
> > > On 6/4/25 6:00 PM, Frank Li wrote:
> > > > On Wed, Jun 04, 2025 at 03:55:11PM +0300, Jarkko Nikula wrote:
> > > > > Move DMA bounce buffer code for I3C private transfers to be generic for
> > > > > all DMA transfers, and round up the receive bounce buffer size to a
> > > > > multiple of DWORDs.
> > > > >
> > > > > It was observed that when the device DMA is IOMMU mapped and the receive
> > > > > length is not a multiple of DWORDs, the last DWORD is padded with stale
> > > > > data from the RX FIFO, corrupting 1-3 bytes beyond the expected data.
> > > > >
> > > > > A similar issue, though less severe, occurs when an I3C target returns
> > > > > less data than requested. In this case, the padding does not exceed the
> > > > > requested number of bytes, assuming the device DMA is not IOMMU mapped.
> > > > >
> > > > > Therefore, all I3C private transfer, CCC command payload and I2C
> > > > > transfer receive buffers must be properly sized for the DMA being IOMMU
> > > > > mapped. Even if those buffers are already DMA safe, their size may not
> > > > > be, and I don't have a clear idea how to guarantee this other than
> > > > > using a local bounce buffer.
> > > > >
> > > > > To prepare for the device DMA being IOMMU mapped and to address the
> > > > > above issue, implement a local, properly sized bounce buffer for all
> > > > > DMA transfers. For now, allocate it only when the buffer is in the
> > > > > vmalloc() area to avoid unnecessary copying with CCC commands and
> > > > > DMA-safe I2C transfers.
> > > > >
> > > > > Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> > > > > ---
> > > > >    drivers/i3c/master/mipi-i3c-hci/core.c | 34 -------------------
> > > > >    drivers/i3c/master/mipi-i3c-hci/dma.c  | 47 +++++++++++++++++++++++++-
> > > > >    2 files changed, 46 insertions(+), 35 deletions(-)
> > > > >
> > > > > diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> > > > > index bc4538694540..24c5e7d5b439 100644
> > > > > --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> > > > > +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> > > > > @@ -272,34 +272,6 @@ static int i3c_hci_daa(struct i3c_master_controller *m)
> > > > >    	return hci->cmd->perform_daa(hci);
> > > > >    }
> > > > >
> > > > ...
> > > > >    }
> > > > >
> > > > > +static void *hci_dma_alloc_safe_xfer_buf(struct i3c_hci *hci,
> > > > > +					 struct hci_xfer *xfer)
> > > > > +{
> > > > > +	if (!is_vmalloc_addr(xfer->data))
> > > > > +		return xfer->data;
> > > > > +
> > > > > +	if (xfer->rnw)
> > > > > +		/*
> > > > > +		 * Round up the receive bounce buffer length to a multiple of
> > > > > +		 * DWORDs. Independently of buffer alignment, DMA_FROM_DEVICE
> > > > > +		 * transfers may corrupt the last DWORD when transfer length is
> > > > > +		 * not a multiple of DWORDs. This was observed when the device
> > > > > +		 * DMA is IOMMU mapped or when an I3C target device returns
> > > > > +		 * less data than requested. Latter case is less severe and
> > > > > +		 * does not exceed the requested number of bytes, assuming the
> > > > > +		 * device DMA is not IOMMU mapped.
> > > > > +		 */
> > > > > +		xfer->bounce_buf = kzalloc(ALIGN(xfer->data_len, 4),
> > > > > +					   GFP_KERNEL);
> > > > > +	else
> > > > > +		xfer->bounce_buf = kmemdup(xfer->data, xfer->data_len,
> > > > > +					   GFP_KERNEL);
> > > > > +
> > > > > +	return xfer->bounce_buf;
> > > >
> > > > Why need use bounce_buf? why not use dma_map_single()?, which will check
> > > > alignment and size to decide if use swiotlb as bounce buffer.
> > > >
> > > We do pass the buffer to the dma_map_single(). I've understood swiotlb is
> > > transparently used when the DMA cannot directly access the memory but that's
> > > not the case here.
> >
> > why not? even though you have to use internal buf, why not use
> > dma_alloc_coherent().
> >
> I don't think it's suitable for "smallish" per transfer allocations/mappings
> and buffer is not accessed concurrently by the CPU and DMA during the
> transfer.

I still can't understand why need this special handle for i3c. Basic it use
dma transfer to transfer data. Can you simple descript hci's data flow?

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
