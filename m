Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C47CE8D6B
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Nov 2025 15:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=czJVzklP7tvlvxkdEtW+mhBbX9IacmGkTwFoB8ChL9o=; b=XCIID2/sm/RPRc
	xxRfG1XDHT9fSaOKuHkEGWJEwpBqcbUxm9aenVJqsyx2OS8HrMD0YyW8uiQ1xuXmP3SsqrQPiAMUY
	vZAQlX4gp3zE+cPuMOelcE9ZzLcU+Jas3pXcuUNcfb7NrY1Dous4gMBTlSwnoB+2NkAY8A93afyW4
	z7JhJUF1movBg1+Ny/iye3Ydg7qTmV10vUC868jb0+pjTOEFmBdfiXtnd/MalcGjQ+UXXNPGzNvbM
	7WVcB+/bAN1PlNISrz1IdFqP2i3ncOb7rWQGKm+KwEilPTLZbYGybjF4SyQrdL1r9AYPxPKEXN9F4
	95pK79kuwsg+PlrGwTIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL1FV-0000000GKgY-1mKI;
	Mon, 17 Nov 2025 15:34:37 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL1FT-0000000GKfz-3kiO
	for linux-i3c@lists.infradead.org;
	Mon, 17 Nov 2025 15:34:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MQbppwpLSpS71Xu0WF3T+TXyADBLmsHcaZ7SH/ydFiUV/fGCsKBZenBpDkDpd/w14wHH1PNL96AKGRQWnnvYsNiwnYiV7ipD6N7FQPRZ4C/+2hhCpqSYhbzqfYGjaDoOuB/VbSAr4cIBNtARjmUCyEfRovs+sVpOCP/RgLG9fQhYwiVOQ8whyV3n7YY7m/hbpPnsj86059zRcoBjkOt+shEYHOmgSKBRcquVSzzqdEUzcNFFy/gS/hG3Qkb4uqSAfyxY6j5qnRdVMzZAfJrSyp4SFTdx/2IdhRYUtMYJ2HTvjY8gLwW+XXzS83u/yNI80VCDnvQtudLNRRFUQPQ9oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FfFlBYkfE3W3AnvVkrSCRXv9GL6m8BwfSzLCPRfucG4=;
 b=Z6FDlEaHDQxyvuEvmzNatuRl9hngkwaOouQiYCaNI+wYvieu7W1fs30rpahXY58VDhjhyRNFPcTz/qvrzkucrrKSDAl2ev9nStR4tpHMTaxpz94fKPRBzdYEct1c6sB10FBvivbInOR/u93Uednp6YhbsDs4/fKPX3PZVNZ0UwRc5uF8EVuI438Qq0OQ0NOIsPVCERlgIg0+Z3kAj+l6PAdSDLucL+sAsS0Jwpd6QK3rmEEStEy0pnbaweA0XMNWiHm8IkRk0pAM5ktdo5arQYEylPHvnSsZ3naMwwEILcU+DsHfVEcJNzxpSMbpbCeu9NlvIRsbN9Q0KQt2OSP7Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FfFlBYkfE3W3AnvVkrSCRXv9GL6m8BwfSzLCPRfucG4=;
 b=ZlOln0QkR3hF6IyZvT0+xkptPmfzILHXqjvd4zhgo/2Cok18x085aVXiBEnRlGqpA949TwyI8w7wTMlzu2y0aJ3RBiesmVQXfniuDZuLiPJ0ir0RE+JWv1lFb199xotiSHFICwjsVKSwVXX9GKHC52RUhqCWyTFnajiByq+HewDSzaQjPFwpCsKCU4MNWydbhGPBWUE6YXMBi4I92vhGDiU6isjr4F8ihXT8cX5Ny+TkIW+G99Mbr6DYOn5nzu9X9YG4B2OHqtdFVbQcCEcUplB1FEB463JNhUQdk9XmHQTLNh4+XWvGN4+IryQtErO8/38tTVDdw0NG+D8n+RaLlQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by DBAPR04MB7416.eurprd04.prod.outlook.com (2603:10a6:10:1b3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 15:34:32 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9320.018; Mon, 17 Nov 2025
 15:34:32 +0000
Date: Mon, 17 Nov 2025 10:34:26 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V3 01/12] i3c: mipi-i3c-hci-pci: Set 64-bit DMA mask for
 Intel controllers
Message-ID: <aRtAgiN/HvgGPipe@lizhi-Precision-Tower-5810>
References: <20251117131609.65988-1-adrian.hunter@intel.com>
 <20251117131609.65988-2-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20251117131609.65988-2-adrian.hunter@intel.com>
X-ClientProxiedBy: PH0PR07CA0087.namprd07.prod.outlook.com
 (2603:10b6:510:f::32) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|DBAPR04MB7416:EE_
X-MS-Office365-Filtering-Correlation-Id: d1d85eda-6eb9-48b2-0e24-08de25eecdbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|52116014|376014|366016|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jrDwm+CT1X7AFQOm5Q/+y514tzEinfC/CDJkiRyy15PuCAId4E/VvlI4sVSp?=
 =?us-ascii?Q?RY+3+Ta1cHuxb4LE0BNqsYcoghrzGwX/m/AEIJgzPl3U7RS4cttdisrxbNQl?=
 =?us-ascii?Q?E6B6ssSRuTwM6+/AoHSchOTzNmIOLJtCwLJDR97Tn4ld5bIhTusQxbtIIuGU?=
 =?us-ascii?Q?U4bNZlsMS3V/yYgVClu5dpXeq2dZSrQKleOFyfrSu7yF613Lx6vlXHSmQubP?=
 =?us-ascii?Q?GBWp9B1fBBPR21WLMD2TGZLCGEAc14ekTJaYmOZSezCTfJ+LUkiNwiWDVNzw?=
 =?us-ascii?Q?W6JRiiqhijfHNFhb4KcZPXwGejwhBwVLlmR9+4Am9KEHvFYDMcJ7xZ8biDXf?=
 =?us-ascii?Q?XPcwNks+CYTIRHcdSyAwG75QWmpkYnJO507mR7tLfReqSAZoc+kik7lCJRLl?=
 =?us-ascii?Q?iKongV2h+MrUAWfVYIAhOeeOf5fp6E22DNCQIyVsfJkZ/pH+3qpyMGktCRdq?=
 =?us-ascii?Q?HxYIU9MLkF0Xtip165S8d9tQKwS3+5wIhvCiJX9lm8M10u7lF3H8LUVovVsg?=
 =?us-ascii?Q?u1aufeR2+Gs+x4Fn0EiFXFUmAG2CNQP3rue/tLjJ/9juLzn80XXghWvKF9N4?=
 =?us-ascii?Q?xrn6cc9ZNLAc9TSYWlHQJH7wEkm4jtcfbXv2jxcA6pqeyQkeZA96STE2U59d?=
 =?us-ascii?Q?FFP6OoUHEd2jFVtk1Jgmm55MLzTd6e9yNtZLkpkfK7Cgl403ndhGnqp3Rz4W?=
 =?us-ascii?Q?a9PQnOmWYYzZF8urHuKURCGd6rruFCT+xw0oPBSDHmUXLdyyTW+5bZfnYzUE?=
 =?us-ascii?Q?HP1hDbmBjZaR0xhcz04jS3r4seWhVEs0v2Oj0DoQ5XI6jKrleyYFDlEXQqD1?=
 =?us-ascii?Q?Z15c7grTJ4TTMx1V+QKVvre71KWmlRv9juWTEg685Lc0iznZznodfgXYAoUQ?=
 =?us-ascii?Q?F4QOR28HmtscLBDIfwiAqCYBgpTp0tatdmgyLx4evo1IoVGp0ai0k6n+1Ls9?=
 =?us-ascii?Q?PzkVlF5vUq+QvIx+jHLQ4h/uZbzztzmJaPG1WkIVpnBDM2uFnHEDrJEYuQa3?=
 =?us-ascii?Q?Bk3zcZ4XQkiFrnRsLpniUUOc89RdDpFyFV6BFm2hEUmRxPHD9ZbNxeaQHZ0m?=
 =?us-ascii?Q?T6oWTeUJrRcB58jQj0Qc0s1V9AJRs3nm6waKq6N7IWD/RhU4V3kU+KvZt+hc?=
 =?us-ascii?Q?uITs6o+nzIBOkijOWoXVeLDUQ4cBrvu2yuQzH+GpsGe7daYjd5KK8zo9oYGg?=
 =?us-ascii?Q?NKXI2lAprXnngfc8WxZ8JGSa2zI4lmD5kFLb9EZGE+j3ApE0qTDRAgYhyP60?=
 =?us-ascii?Q?6z0IWyOdEG7x+CWUTcxj2RB9iM0hpWsI4t/rzfeQJRg8z5zgPbdXXSGhJUz/?=
 =?us-ascii?Q?TL2/mMTuZIlhOVixWVvYq1gQ0MqhENxTLUWuc2jzhssACeyF56Do8L5lWmLN?=
 =?us-ascii?Q?UfGBgZDIm0nHrbI3GkVUW+fNb+slMrYI0ppCBKgumC5pq1LzU9VL5xP82t2l?=
 =?us-ascii?Q?1L4WjGaxsHnbCwMnjTIBJYk0YpS1yE3YE6ugCYxBvw7TY8TnywKmvHMbjBhj?=
 =?us-ascii?Q?OtoI0ctlfo3IzlPFyXsiSen6S42EnykXwJPm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(366016)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UsN1+6U521xDZ16nA/MVB1FkKSphnEtfrCbbGdPCWjURAmbbUi6AZzY0YT9R?=
 =?us-ascii?Q?tgR72qjHV4HNwSXg7ecSkv/Ifobxp09Tg4Do2jXQwlZQ3XfV37X6bJouKgR/?=
 =?us-ascii?Q?XY8Iyiartb99PNyrR5i2sRKWkRBNDr8R6odN17bk6srOcYJ4V8rz4BEjt43Q?=
 =?us-ascii?Q?zveQu5Ra7fny+RH1G4p20hLcngMv1d+eR49Ao0qpEVWje3ksz5rlhtz7H8cb?=
 =?us-ascii?Q?dGLCwomY8fl82mGBde/euYlU/7w71qAmYFXhtzv8rR/PdRRJOj+0mt+Fx/T+?=
 =?us-ascii?Q?vSQ67qn4193YHuGFGUK1V5qfbCxttcPfjZl/kDtC2571AeiftqRuowCd8Bkj?=
 =?us-ascii?Q?eoMWctg51XJiYgMkNaB7zR/MlDuiI/0tLUn/FfRXlA78i9LGRPaLqqfh6Yye?=
 =?us-ascii?Q?xVMj5rusAe2WYvyFRA0Z9LJpjmOLdPNHjoouLoIXnl4bHhVbeZvui/RfZ1Ax?=
 =?us-ascii?Q?VRggla1Dii2rLJMHsq3pxvYHf3pe296hBdsb+IEFsWIEe3ni8j3g9ZuX8Wdh?=
 =?us-ascii?Q?GoE7K2ft2qBn8tn9bwHu/T0iCiQvTBVrjsrJzHvPFtWEC4THniAM74EkIFMe?=
 =?us-ascii?Q?Nh06bW4qbZSmcdbymEpUZ1iRPLgPh329CBEiSL316UHRfNkGo32mcZ3j3xBb?=
 =?us-ascii?Q?sBiotjjVcYpWiYY+UNd2YKzzsar3Ya6okNiyxrwEfAAUzqBdWv6MeSlUUA+m?=
 =?us-ascii?Q?+s3jHB7t5+hgolGgZVRvvk1USPprKb36Wmx4lrbBcj+3vBs0QhrdG+laLrj9?=
 =?us-ascii?Q?QSi4jW77kgVtrQyswQzrD13iruYt4SppK1yO8Q5wfNTagDhJvgI0UW+a8hsC?=
 =?us-ascii?Q?OP8NQj5rBEb7CjxJPdTURwm/V8iwG1tJK5bPT7mIPfevZuE00k05cxVn5kCk?=
 =?us-ascii?Q?MCcMsoWN4xTdcgVWQLe7TIemF/YyIQsmbmBOZYEhac6QBiBz9PUEbmlU30dy?=
 =?us-ascii?Q?haYD1QsIrcRIIFOKncnFjUAuUxlpMPLtV3JwGPu52CbQKE/N7oT047VH0t7d?=
 =?us-ascii?Q?iuKi18BXpXrwS//MkKxhYdwTfgmw5pxhuvFB+sK3Vl4upasKpqAkqB2BcjTp?=
 =?us-ascii?Q?MuIvFZXka+ZBlYV2eCpJQcVVyPAU2LxrfZlWxqT7O3FtnJCPh1loNOB12bN3?=
 =?us-ascii?Q?ZjX46fECfB3zxmgy5YABHXB4h9HBoHs+k/XAharfNTpDox7NEx5CSUdWw5bO?=
 =?us-ascii?Q?Hq0L5C1xQbPZtVXh3N0kW95iFxDgg1BnCzd9EOjLIycwn5e7+ydNibwVQlve?=
 =?us-ascii?Q?M7xferJ4hpwQApANp8kyTaiVYRKp69SbK6z/Um1kyopoI0dHVzEO95uP0b0T?=
 =?us-ascii?Q?lu/ZHezyM6XvrXUqGlDrHWXCbvAAJbjZOfHOxcktm7xNYLhlNks1eyo+7uxt?=
 =?us-ascii?Q?JI6ZY/iYvCxgb9ovQFtqeLZok86WL4+GvV6SO3lOMYJS37sS9Io99tcizT5y?=
 =?us-ascii?Q?xRyc3D7tJOXXfSOLj4xt5xiUvLQ2+jCU/kkGgBFDYWMUAhff5PT9a+zER/z6?=
 =?us-ascii?Q?YIrBW9sP7v0nXukRmItrq3UUHEEi/QaCBLfqDmvrDyf965n3wKYOjglxKcz3?=
 =?us-ascii?Q?QVXQiamk9iOqob3mS1I=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1d85eda-6eb9-48b2-0e24-08de25eecdbd
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 15:34:31.9863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2HRIqAMNX8TREy9H4upVG1k0eHOzI9QpkuaONyuhdEbY6VWoPlvJUEjvx5Dd0k/dFgpOuiDUiW0XD9sl4yHI4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7416
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_073435_959971_5C1950F9 
X-CRM114-Status: GOOD (  17.30  )
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

On Mon, Nov 17, 2025 at 03:15:57PM +0200, Adrian Hunter wrote:
> All Intel controllers support 64-bit DMA.  Set the DMA mask accordingly.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>
> Changes in V3:
>
> 	Omit mention of IOMMU in commit message.
>
> Changes in V2:
>
> 	No need to check error from dma_set_mask_and_coherent() with a
> 	64-bit mask
>
>  drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> index dd4484eff2f0..3cd15ca7d391 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> @@ -36,6 +36,8 @@ static int mipi_i3c_hci_pci_intel_init(struct pci_dev *pci)
>  	if (!priv)
>  		return -ENOMEM;
>
> +	dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(64));
> +
>  	/* Assert reset, wait for completion and release reset */
>  	writel(0, priv + INTEL_PRIV_RESETS);
>  	timeout = jiffies + msecs_to_jiffies(10);
> --
> 2.51.0
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
