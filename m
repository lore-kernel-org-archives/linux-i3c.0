Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF16C282C6
	for <linux-i3c@archiver.kernel.org>; Fri, 28 Feb 2025 16:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/yfREFnVAIrbgWnSwMUgPJH4StnMA700qdb0CLPpf14=; b=X2J1D8rDU+tixa
	RlyTLktLrnMm7RfjaopQ/MeMT9HECHAoFhsV4JnH2TLCKY4NoY78yoB3+4nvSglo8wgOgAOEq0HZJ
	I0u5UlIKWY47aT8jpIW8VdreX6MKAaGBH6Fe0hhphuebfeuXZ0xVWG7AQvBdLVo81jvznlIA1M7i2
	IbxSaGZwQJz57d/IGY8ugF6U88HRbOcDwMPZd43PgFkd7UgZwh4BtVHFgxZUJ1DbnUXcIEsyFDIpW
	7jpoSfD5HGSvFfmJKFQtyahfxOJs0IaAtpgRw3dFxzo7pmqkKX/EfR2tBHfyKJ9fyMu6YeRVLSzBs
	kfwf/dnyCu00uZhG0RoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to31Y-0000000Bd9e-01Ng;
	Fri, 28 Feb 2025 16:15:40 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to30y-0000000Bcw3-0r9Z
	for linux-i3c@lists.infradead.org;
	Fri, 28 Feb 2025 16:15:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mTV2PjDAxkaGS8qb+PxK/snVmE5O0J4V4zzMF1adPKEpp7bGHJQq65e5lfz2rXIyUc3na+kfcVGAMDAoyNvw+DHSHFCfkzblhkoUuLPjc5w0Wodl4Mt5XNuTK3qwhU6HqfUtAqfzP3FAPwNSGg6qJJM7IdLGqgscrl2KNsTd35YTQYGxZBYLFN03aafn0iaFXhGFGFfTtXmHrsWGODfTZxjBOqYUXsv9/+L2XuoRzAYQVzFH+aA2eEqWA6mrNpMRDDxXNQidS7vbQlSHZ2zJkSAs4rkndhlTd3zuZR126hBJZ4lXM/dS2H4fhl3SXJ5hfYHZm+UGJ0+4AnjfhZpNZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/YITS7+kf8tzUCmPjc+MHkt5LLdMUt+/qDSmTPB0pu0=;
 b=PE2+DK2sUIJuyrRgnd7s/XCaWCgyDkap1W5y5DkNnNmCplE1QezwUrM1LTJQ8VipjEi8IMov0pSU1bpUyB16wRaxKa4LYQwXrNexsdMQrtnzwIk9j+hb+sqkzPLFaDR874kyU9/yRnUT9ZeUEVie2Ze6iJVBQS9aG42ZjmydBSnObI7qr623h6XJ+zUXN2PnVFwJsAt1tyv3A1rhNBQ7OPOMkkfL75xRhkVTTl0xo1j6kduhWhmqSySC7+UqM3co47x1iFNTdCrWR6vAXF4Frr7Qx5eCXo3ACn6NnNfLlwgD8ZUswxirxQJ7UzZzx2Cv7pVdr/MDRoxR0oD7IrYjaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/YITS7+kf8tzUCmPjc+MHkt5LLdMUt+/qDSmTPB0pu0=;
 b=Zul+K1QjBbiXH7QR68nx8GtZQ6k6zlxan1OEc1v+ZS3UK7+Iz50HshDKySpbXQo88FVeEcJV2C3U43qKEEN5ZF0O19L5vM7q3gqYB4bBl6qmvLo0Ov5eEo0zL13mbqHgYu6+67bYWPC2BAtd4II4vE+s87B5+y+TvUIPDGMtZCgISoDgOYAzGuyK3cjWYGfPRcof830R3RNB/b0bjvy6s7jjb6QQzGBgUKGjGB51lIghCKiNN9R2pGF068kDyhh21rxEqSWqTBx3FdVUVMiVEhOT8QEE3ooEiFJdfPVbm7DDPrY2Mv0m6k9dbypnoBQzt8K9Qp61Cvh6toXCcTAI5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB7814.eurprd04.prod.outlook.com (2603:10a6:20b:2a1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Fri, 28 Feb
 2025 16:14:56 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8489.019; Fri, 28 Feb 2025
 16:14:56 +0000
Date: Fri, 28 Feb 2025 11:14:50 -0500
From: Frank Li <Frank.li@nxp.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 2/4] i3c: mipi-i3c-hci: Fix handling status of
 i3c_hci_irq_handler()
Message-ID: <Z8Hg+o/oOPUd3oL7@lizhi-Precision-Tower-5810>
References: <20250228141802.1344453-1-jarkko.nikula@linux.intel.com>
 <20250228141802.1344453-2-jarkko.nikula@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <20250228141802.1344453-2-jarkko.nikula@linux.intel.com>
X-ClientProxiedBy: BY5PR04CA0003.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::13) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB7814:EE_
X-MS-Office365-Filtering-Correlation-Id: fd3f1289-a861-43c9-b14b-08dd58130ad2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KJelNucFI58gJUXUfqfjLpGeNAI7rzFZG3a6yHOh2HLAOAu6EnCVEyccQTGv?=
 =?us-ascii?Q?vIs64RWylrquZXxa3mbx2hnAC+ljeLxNc9+DtS3a2oDN1EQ45qI2Kasj6bME?=
 =?us-ascii?Q?LUlYJnGRmP9mVKeESOhLqpZgHWw6mpLLsT8egXnRyCtPjQFRKbMuOVIvkKB6?=
 =?us-ascii?Q?Z9AavTGxD8RwG1W1pE60duPyU0xkwVJ+sKrFr9PzvZ+lRVQjpxy1SzN+FB6U?=
 =?us-ascii?Q?VdRTU1tJRsXMhGZmHNi0j3ycOaVu6Gn0cRncEVCf1qkoi7TZx1mUUgsbT1ec?=
 =?us-ascii?Q?OYDxIw7CDSfqQ0Ua6VSlMFDl542cjURFBRbhblvwpD0MSQgxr63QroGBKRAI?=
 =?us-ascii?Q?UVJu8tTsPsImRhejS8gm8ldqzdssSmseTgUOTN0+gA7XO6pwugD8plXJeVld?=
 =?us-ascii?Q?YHXKoqmvoFxuHAwRA1bMhoTLgEl+LS81SVhInTQOE0Bg5nUe1nQkfWGWFkwE?=
 =?us-ascii?Q?cQND2+2HJEezgyl1Ema+wlRM4QCLpjp4ge7upRw47GfLLc0Gn8dl7l+PBXr7?=
 =?us-ascii?Q?BOWM+3S1dzmyd2HUNizXhsETmwRT/GSBr7ZiWKQBM9wX6h5rkt/QvNiOGXSA?=
 =?us-ascii?Q?Xuou6+H3Zqbp/bd6VVMasEPhx0ueBgu5rS6UoJrwf/DO+3IwkEc+Amar8S2H?=
 =?us-ascii?Q?JDKe0vqbEbkHjiQTCnlD60SBgEheL/MLNrqQqsUDUW9H1D5C/N4KfgjBvxAW?=
 =?us-ascii?Q?OHfwXmZNP1KE9yk1MGNTTyD+RIpGZwwRIDigUtfvDSfX8yDRKfAcoP5rEnKM?=
 =?us-ascii?Q?MHLvhaCRnMhwnBNxN1wARdWjyhlS6FxZkUWEn2bDLA58V1XUk3zgTdsGokIg?=
 =?us-ascii?Q?zGhe9YN0utAGCOtzhsnfSEkk2rShTIcuZ2peVzck0vQ85Jj9WztkSGImm0g8?=
 =?us-ascii?Q?rpsPxeVoNX+2UVFULlliH+75nd4JxYypnn6h+nJ6wyEVk7M36kMR4sfouI/b?=
 =?us-ascii?Q?c00AlEp0VogZY95Rpat0cU1xiaQ/WmYLkTYnbH+ls2FwlEbbYKSHntFbPq2C?=
 =?us-ascii?Q?ah+XchXw3Uq2B0tDJOHvNseEMbV+phOTUhqU1EoMoVESkPj/ylriZIw5ke7G?=
 =?us-ascii?Q?93+EK0d2Xk0Icll8aGDAAUpCQ3rxXuIUSOTQM40X1sHBZWxDgvUw9NC29inl?=
 =?us-ascii?Q?QUELl/33igIhVUFa4tIIx/rCRVxlxMaAeXNz6rPcCnDCdtKTp/Dh2aMu53HS?=
 =?us-ascii?Q?00pDC35mKHRIvDAoQqklhZ9GHgvJIsIOm7tjveqYE1LrHwkNI+pjvYL7LM4E?=
 =?us-ascii?Q?gPP5GUUhR8jN0fGZlYg+4S+Y85RnlGh/sBGIFyuSFrvkbuMjMV++vP9wYQwY?=
 =?us-ascii?Q?2GoLnqSS4yGQQthbCMLgM4A6i/zAVQu7JGnkNt7MU8ywMzdn+mbTnOniHJYL?=
 =?us-ascii?Q?xyFwSU5zpRHQpZ5SoeFMBsPFiqsv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YKjydVTyTjYokT0M8pnJIstGWepfTP3Xj3OV4+elB9xJiFs8+Fd7yWmYvo7f?=
 =?us-ascii?Q?KAi0RDK3L6un+V3pNUzV7L8DLrksheAEiWqmMXbrP4Ibk6TIWraq1NXMPrfn?=
 =?us-ascii?Q?9qSt4Hpte1jUvOtlV5h6KjH2qekmu024MuTMWP6374jreh+d8pKcOjMZPCQF?=
 =?us-ascii?Q?jjLTrXKMZov7wHIo5B+PU4GZtQcajva6AW/1YwmIL8g5IRITzy7KdEmeSMW5?=
 =?us-ascii?Q?Dxyj8FMmyudTXlFjMdvbhC2bPOqTBRFRMWhr3WIP1PwNrPaT760U7mq/JYXK?=
 =?us-ascii?Q?1NuVkzJ2TYTbYim6uz4ltfk/HZkpCIiB+rXZa3741MQmWWvIjndcnoKn2CQe?=
 =?us-ascii?Q?qImfUyDGoGL+fFieic5zTR+DxNjWFN82Lry9UxtuO67d44QxlPb7l8I+hx+A?=
 =?us-ascii?Q?HkI8VZwOaA4R2XbWx8rLZfCWnt/P6t8WHp0rsQhb4D08pD9nUXL9xMlcl24p?=
 =?us-ascii?Q?SvSRcS0jlAhRXsYp7OEWzcDTbYbAumqpuOYdRPfAVmygCHcMwxEEdXgh//2g?=
 =?us-ascii?Q?zQ16XJZA9S4ooiMmGaukuBUD826a7AZfru5qUWVj3a9L76vM/wRm1WywGWl8?=
 =?us-ascii?Q?yt7ikpOXjxDX9TaC3zxtfhuPkca8Hd3KwHZ2cR9xz1szqSjAVB2Ewg4Z1hbG?=
 =?us-ascii?Q?GSpqslG+sSlEL0dxh/c02szwnI83qo1o0CGCBJekQ4HLdlAMjYDwXXu+EL24?=
 =?us-ascii?Q?e8R2+MF4a45xrqmfzYMqp3PGrh5p/sD82vkfZkn4KtxFVIoCGd7279NGHADI?=
 =?us-ascii?Q?NLf/iw/7N4vR1Q7+7XLPHgpoprloRv0K2bwuDhHGNyp0vlkLWjeIoYprC8d0?=
 =?us-ascii?Q?k4uVESOXpaw2U1GlCnHpNiq86pVY25AGSkuhqgn0gF4laQWN0tdN3aC1+kG9?=
 =?us-ascii?Q?cBoa+lzZytUizhjoyeThZXwKwHvmAVNtMAs8HaZKzCdowKlNiNOp8fMM+I4y?=
 =?us-ascii?Q?j4Yhrzj2y2ULw2g1ZPWvrCVtcpFelu+akWNkx3vrnDnEmIXlRXzYukNEu345?=
 =?us-ascii?Q?pmhU4H6ua76BzgZ+VZOarnEOVrKa2iLa5oBkeJ+7tzFA3yLUhNoqjlfjcX85?=
 =?us-ascii?Q?ffEqBzqIRhlN9oOzTx6om2RAIf4EpmiV9vfIzcoksdjEUN+/3rBZ02d788Zy?=
 =?us-ascii?Q?oDWDbW/PMLc2jlKJRhQX2LyfhvOi3sNwZgrwy5AhSWkNTJoMUTkkKxz9wzOG?=
 =?us-ascii?Q?9gX45o+9u8IUpwWH0HtoUF6uqLvCxw4n6VhrIsWbaeB1cIa3wK/q1pl3m0kk?=
 =?us-ascii?Q?s/DSf1jStlnhe/rDK+ufVwqIN7FpcWhrxDkjJfm4067rJUXTJNQe5FFTrERM?=
 =?us-ascii?Q?D3AzVOwiGYEbxzpUGdKj0rIFf/EnjzRUo5JnJ1JZRHBYP2uOtSGucI2HdT2i?=
 =?us-ascii?Q?V46zomp0siVDgmnqzulgXKqUgEKd8ow87x2LoH4L6yOXodMWhtfbfi9eZw3V?=
 =?us-ascii?Q?qXdy+705CSe91NRk6qTt53WLk5qYNAVrvB6vjLBJ9KqYX9YKsQYt2jOKor9U?=
 =?us-ascii?Q?yIQsu2xECTPAoS0jLLGMWZt1T+iBhqXz98H4fXWtQFxV7QYjSEcrq++jwa/k?=
 =?us-ascii?Q?5n7pd1OJ/YEb5DVtNjw=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd3f1289-a861-43c9-b14b-08dd58130ad2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 16:14:56.6803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iQTO/RNzZVX4AJc/HBMMIWcfBJnWC4iqeRHORUz4XhXOU7G/xl76wJndlYlUd9Y6y9bOBZ8MYaDMSO7m1GOtvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7814
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_081504_243532_2AAA2D14 
X-CRM114-Status: GOOD (  21.32  )
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

On Fri, Feb 28, 2025 at 04:18:00PM +0200, Jarkko Nikula wrote:
> Return IRQ_HANDLED from the i3c_hci_irq_handler() only if some
> INTR_STATUS bit was set or if DMA/PIO handler handled it.
>
> Currently it returns IRQ_HANDLED in case INTR_STATUS is zero and IO
> handler returns false. Which could be the case if interrupt comes from
> other device or is spurious.
>
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> ---
>  drivers/i3c/master/mipi-i3c-hci/core.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index e139d7e4d252..e5593b6e897e 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -594,6 +594,7 @@ static irqreturn_t i3c_hci_irq_handler(int irq, void *dev_id)
>
>  	if (val) {
>  		reg_write(INTR_STATUS, val);
> +		result = IRQ_HANDLED;

Not related this patch.
reg_write(INTR_STATUS, val); should be unconditional since INTR_STATUS is
w1c.

I am strange why need return IRQ_NONE case. I suppose it should always
return IRQ_HANDLED.

Frank
>  	}
>
>  	if (val & INTR_HC_RESET_CANCEL) {
> @@ -605,12 +606,11 @@ static irqreturn_t i3c_hci_irq_handler(int irq, void *dev_id)
>  		val &= ~INTR_HC_INTERNAL_ERR;
>  	}
>
> -	hci->io->irq_handler(hci);
> +	if (hci->io->irq_handler(hci))
> +		result = IRQ_HANDLED;
>
>  	if (val)
>  		dev_err(&hci->master.dev, "unexpected INTR_STATUS %#x\n", val);
> -	else
> -		result = IRQ_HANDLED;
>
>  	return result;
>  }
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
