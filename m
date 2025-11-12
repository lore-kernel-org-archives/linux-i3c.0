Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2BFFCD13DF
	for <linux-i3c@archiver.kernel.org>; Wed, 12 Nov 2025 16:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+zdLPnIroudC70pHKHqj7Ikzdf8luZTLiU7YU2X7WSk=; b=obsBfP9cQC7B+L
	BcUgqMMtLOsm93m3qUBjHtmLHIB26PgwobQug/FxDy3TGH1EC3YTg668jVpQY5PJ99AZl6EhCZUub
	gum5Jeu2NYKCOkONaoylylVlIP8k5VtvqysNgs6lkxWbI1SGt4f1Jxv0UoTJkXZ++DcZyNhvJA4Xy
	5FLzTMt9rFN1ZjFR0UO82mm4KYmhKlGgfdATQS33taOn5BM6AwAo+vJFqfm5XHn5piY6cb1zGVoPT
	lSq+0Hs2+eyYKXDlIYw8cGunH0ZAlfaZCrNMNMxsY6RSp19CYoGMINAVZvU1E8ShKR2oFeiv2HYSN
	JG2Qw/p2Jn6+KtCcqbag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJDTK-00000009A27-1da5;
	Wed, 12 Nov 2025 16:13:26 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJDTH-00000009A1f-0Dhg
	for linux-i3c@lists.infradead.org;
	Wed, 12 Nov 2025 16:13:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ib1ZyNuy6uX7uVAT88934/2X1V6XWjnbe/Gv+Ssuw+wt5XLjnmVPXWKJaUvgynaHSCjesiy28aGAqJFcVdQbvZ9x+p5Yp81ej4YgrssoAu2VMuubOnUVSKk1tNQ7rgKWRvFPwBJeVuk+LDWLcULEZMz4h6bOuIMB76mhOZSeiT1hRegsUgWZWHIT4wEcAkSTZSrweq3nE4WFdIswesu+m7nPLMReYeHVMcVPPY5fIWJfl9qeK71TTeHy9fC0rrgkHs/fbpoMAyvmcN3SuBNe3IJw3Pv1d9TL5DkJahkOBTuxI7dfxyECtYCFEMAGmi1KJMoOo7lLYdoN3mcHiw6QfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AB5T2aNOcKZ9+9PpiGns0QzuTdpp5pUyYHx0P/4U3Ok=;
 b=nhlTsN18arRZKCAAXCHEBVreoWiWyz9vvHyKhvXRtCSZwvR5u/OjPn1+hHpeWkX0tXahA6rvhttgjGGd+FB3Os5LMaLNb53T1vno3+KDb6WO+vdwJhx4gj6MFKoPvNGAFIGEcDHAMphDGUnn7ISbMRCmAQ1LCc+Fh3PoYAkbpQpRiHXONsidjWqfqduBcfkMNE997fEG9UOvB+zQP2spE+BW7wpTuEYsBG8ehvlOTbpuUF7i9F6gosj4azJ+Clyt/uOtCNuoGpjHwU5r+jI2wVxlg8YWPFCQ9aavXfg9dX7lMAWSVsdvxBwFhFhvZplEjOAbZSMvVPo3o8m5r/6/zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AB5T2aNOcKZ9+9PpiGns0QzuTdpp5pUyYHx0P/4U3Ok=;
 b=k+ZiOK2pmUqmSpBz4wo3/BSlXCK5LhRNwm3qwqlhJOcaSAL9w0uRGyMuQmKgMKxH88sDAbab+L/20Z5szmD3Go9K5t8CjBdUJ8uRNFOcw3NXfyilDyjg3va1gmODFNCHtXj6ZonZ6P/DPBLP80+9+sWLGOiPiPXJKIUJsodVmRgR2PbEHt2z/VsG5qj5skRzuG0TTDcJCBpmPr2s1yo1o5Z6Dr9WF6bMDTdBf/qW/pWugrQGpXYSK5eKvxHG7hhXDbfbB0HklRT/tyKpHi1oVE2YGkVZN5eYqQE9PiWwEvmWJG+dYRTIM+eMg5WnBopP9+K5PoqNnDWnS+xHQhIHpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by GV2PR04MB11682.eurprd04.prod.outlook.com (2603:10a6:150:2ca::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Wed, 12 Nov
 2025 16:13:17 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 16:13:17 +0000
Date: Wed, 12 Nov 2025 11:13:10 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH 07/13] i3c: mipi-i3c-hci-pci: Factor out intel_reset()
Message-ID: <aRSyFk+wFpE9WpNm@lizhi-Precision-Tower-5810>
References: <20251112100339.51726-1-adrian.hunter@intel.com>
 <20251112100339.51726-8-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20251112100339.51726-8-adrian.hunter@intel.com>
X-ClientProxiedBy: SJ0PR13CA0075.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::20) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|GV2PR04MB11682:EE_
X-MS-Office365-Filtering-Correlation-Id: 65fe8dda-d0b7-4c80-46e9-08de220663ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|376014|366016|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2DT9pAfU2dPMHcXels97QxBklyszxctF+2dtHUXswpHftUDGYvANCDxWwZNF?=
 =?us-ascii?Q?iMowbmAYd+z0w8zQfwEKmngNx7Ms4bhgH/dT5NtxshvPzSeATiPMZJ/shG8t?=
 =?us-ascii?Q?g+8foHnXiobvEkSSh5agKaiSl+V8iUU5A+r8ff+XrZi/9x+4YNCeZv07Ps96?=
 =?us-ascii?Q?ILuIM7QJJ+ryHecdAVvCJQL0cAesp/Zusu9FFsA9hwz9am72zwkZtS+nTMlZ?=
 =?us-ascii?Q?kjCEX79JdKy1aDWaotNk999dmR3UEfzgrHTfYbiwt5GkYWqkBusM/Dvrugrb?=
 =?us-ascii?Q?e5qT5EYrPx7xqK+qAc+DJe/n0vkKztjb29d2IOwfv6HmmCMaPPEuYWrn3Vo7?=
 =?us-ascii?Q?pCp1bT+cV4iC5AqF2LkWcGy78vJwNW14fM+0miBkej4eT2zEBtn7tCEe/gUF?=
 =?us-ascii?Q?sxC3f3m6RXxCpT//K12jsQyPJVlsKm+29gbc0ZcBGY5x7m6EgNhz6nFOpett?=
 =?us-ascii?Q?a2VTh2X4HlD5lI9t1i2tyNtfMmBWClkYFMxr1jUP0V0ZxdTH3Hp8ZxYJnDmo?=
 =?us-ascii?Q?RbSgP5nXXnNNMSRKMOWH9C0x8lIveJAiReAXQzu1tqI91MWY7lgh5cbJiwvI?=
 =?us-ascii?Q?zop+6rwab3hqWg0sF/dJPWf1uNO5l+b4ltJoF7jg0cwOuXx/yyzopz5tCY/K?=
 =?us-ascii?Q?T7Bg8YsqrGkZy79HVnTZCIiA34id6MpAqTjIHJkE1pobrToQ9CCjv9ApIkwn?=
 =?us-ascii?Q?ooyo+CqGvG1EfrkTAFbYMdYy/g8GhAyur6Io4EFww9IyRaojrb/sShXbRwt1?=
 =?us-ascii?Q?Ib4gNcsfwjnDmu46iXMFyn9zq8diwSRSms4GbQeByBBmDoSugqvrSZkzGBOZ?=
 =?us-ascii?Q?nAzFyanUPI4HUBWA0kUqReOJKOBehSFdxIAeXtubapMOjMcBMY9SXI9wtbfQ?=
 =?us-ascii?Q?YomspJVsJiB7z9Y0XuLYPJFIWg452B6ujxEIeHVOCrldcfxFioad1/jCUIQy?=
 =?us-ascii?Q?5F0RqhbkejiUPyDRjCSFbZLyxzdnhiNRfCnG4fLMIv8KSLMaZojXOqpQuUP+?=
 =?us-ascii?Q?bvWsNT8mpKIdszBqxZjJDocxPpgbgU8ZzZWBrT6Pjvtk9wVvr59UnshIQNIj?=
 =?us-ascii?Q?RdmiKGgazF34lDTKlswOOkoWO/jzt92k1YmUQIj4ojbTlOSo4zClb//u0wgv?=
 =?us-ascii?Q?DQjVL8nv49BXUrA2vcbLeG2ylWm5rCswPaaalnPkq/6eFVUy5G08XE3+6oX7?=
 =?us-ascii?Q?Es8yvg1jv1kiFguSNluYw4eeKN6N6YfUnQ7Uwfk/XGmC4sGWtUlxls5eH0L5?=
 =?us-ascii?Q?XBvfHy+5xEAfNSwgJdOATqKAEOaDKTdwKP+M4II57fdtThFLw1iuVG8Y2HtJ?=
 =?us-ascii?Q?okrzyroysSiIr0fLnIt12Xf7NBJXds0+TpRA0bbKk5NwSw/792HR4yebL5QA?=
 =?us-ascii?Q?SimPRKsNskJVUk8TBtrnHFantxGS20w4FG/LRrEJezYrti6Nsw30V50hELge?=
 =?us-ascii?Q?n80mVvViaIdwvhPuqx9RnZkfh8kbUczkuBP27qkUzqScXBIqCtf0qf0mtu2P?=
 =?us-ascii?Q?pF3psMsBQjT7+U/P731ItSkvo2kuPoDGRxhu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?99QkXVGVtulOyNavb/yUlTU06IuJoSslgjcUGPkxgj0JBwBEXzZyeExG78gE?=
 =?us-ascii?Q?R8JBwyfxRNSZMdCb7Ql6amfxKGwK/BxKInULHQbm/mq8i+CpY7QSCxl3ExPz?=
 =?us-ascii?Q?Xg5+e27XlhDFKA7zLcsnxt/+25wBNdLD27GiXhpLWQGLDFUhHVAFJWwPaT1W?=
 =?us-ascii?Q?d0GuNtWs3avbNUKayW7EfELXq1tXokxOF+FFbl4fdV/kVPmdT5CJSlVWoGJf?=
 =?us-ascii?Q?7sLnC8jO2dikWPqDAOBEsRpZXQLxOpdCxk3lX7kUdmYNqo3kPYM6SfU6Zod6?=
 =?us-ascii?Q?jJt7vwoVbP3AFsVBKFhwz5LrPtSp/YJjskm6/tUkh6btexvxfKrAQW4dCFSf?=
 =?us-ascii?Q?jG8A4E5zlUYoZ27U63utA7+BD+ZSKOXJVAGlVaF8Ju9f5xB3BWutJE465Pl8?=
 =?us-ascii?Q?UzPdytV+gTFTy26CdwWv4FC1dI8dPXhqpu6A8ep/5ZG6aTkIFCdQfMI3EF8C?=
 =?us-ascii?Q?V2npkzLfobIIyR9yhUwEk7jXjT2AoFDxivO7rwHMJl1xvKe58oeZx6cMweyx?=
 =?us-ascii?Q?ksWievRTUjH0sgOjgqalCaDURiPkmyMU/3PvVzjNCu+YLg4Nn4AX4cy5WbDD?=
 =?us-ascii?Q?QieT39FABGx8tC3AdHrVtjfWusZhFoMgvmdZzgOj2ItBWs4QduLzQaO3FWhI?=
 =?us-ascii?Q?7qMiOmIAaM61kNvM5opmPy2EqqeggTh/vlh1pGtU3nicPSgQJW0/ZQLfoXg9?=
 =?us-ascii?Q?kXQs0bbFewLFyTnOD1/sC/8euJoxvS1eL9iNDlTzmis5OuZrd0gpvA5Pf0w0?=
 =?us-ascii?Q?MeP6ISy1J1elfW8TvK27n9Jhrd7oa/KlE6vAqD0EKniH4M6oI2gYCBdY1ci4?=
 =?us-ascii?Q?1RG3M+1Te+UcztptvHWVTozj9VnstXnItMcyA6ko6N7HLY/gY/SlDRqPSPHO?=
 =?us-ascii?Q?Dr85SQG4tmgMZt64gefXUciwN87GzxnFLyCj8NeiOmUo25z81Xj91gKnjIZi?=
 =?us-ascii?Q?rnOUivh2XMu5nrfXB/BpUNQ+tzkdhzGuLPhEPTexUtU89fJ3bnd988l+g+vW?=
 =?us-ascii?Q?3380HlXfuKotj0xR5T82SvrK6KRHqR/rAqu31XzFfjm8Xm56jZLh/CAFz4Xw?=
 =?us-ascii?Q?k9m7ee/r7dnWMBCFjZmCLRV3wlxpE1FlEh5qg+7ulujxzK1croycAdQyVErJ?=
 =?us-ascii?Q?2+jyTgHi3l8NH3acCtZluS/eno4GtL6Xzk4GYUnoBGCpodV/KUZtHehhe19S?=
 =?us-ascii?Q?/gP70M4rEO+i2b5PN1jES0bpp9WBibxrQs5zrEzOXEfSCMfmkjil+/fW8XAC?=
 =?us-ascii?Q?jEhW55umnIxZ8/ITq6MmZwIrrcR9cRz6SzLJukZhw7fpxyRkkbZ5l3zP1fKg?=
 =?us-ascii?Q?R+HRDCYTnxdYIngxnc3zboA7xX2SKUFNvtcfxmNDQSvp3TbfSKvc1u5WlVPQ?=
 =?us-ascii?Q?DexgYis6csVhl47crEmrWNx5GIyj1vMdHGpc0RUyhkq+BZya8aBuR0nHrujy?=
 =?us-ascii?Q?C6iuWOK3r3ZVhRtulwPre6ZwE5vDGVlLiEVcO5qT4ilQog6Qa/Ermh8DKMVn?=
 =?us-ascii?Q?e8gFV3LORLnIrrpaBfMFI+ruGNdRrBSPjHUnpi5ttQfwjuttK6hDMPxG3DJz?=
 =?us-ascii?Q?svTMDdNmHfD6XTtsC0s/I+8fD0xxV0WPW9bJ+BZO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65fe8dda-d0b7-4c80-46e9-08de220663ce
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 16:13:17.3955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V1+mb0CEv3Omw1vayGkNIK/V0B5KikkZufTy4txHVJncoHwkZLjggJhsYUR/k3cdKIcykJj4WtmyH4VOYmVsFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11682
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_081323_118416_263C6B84 
X-CRM114-Status: GOOD (  17.80  )
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

On Wed, Nov 12, 2025 at 12:03:33PM +0200, Adrian Hunter wrote:
> For neatness, factor out intel_reset().
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
>  .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    | 26 ++++++++++++-------
>  1 file changed, 16 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> index 003ae61e9f6c..b3b6b6f43af2 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> @@ -34,18 +34,9 @@ static void __iomem *intel_priv(struct pci_dev *pci)
>  	return devm_ioremap(&pci->dev, base + INTEL_PRIV_OFFSET, INTEL_PRIV_SIZE);
>  }
>
> -static int intel_init(struct pci_dev *pci)
> +static void intel_reset(void __iomem *priv)

can move intel_reset() little far from intel_init() to make patch look
nice.

Frank

>  {
> -	void __iomem *priv = intel_priv(pci);
>  	u32 reg;
> -	int ret;
> -
> -	if (!priv)
> -		return -ENOMEM;
> -
> -	ret = dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(64));
> -	if (ret)
> -		return ret;
>
>  	/* Assert reset, wait for completion and release reset */
>  	writel(0, priv + INTEL_RESETS);
> @@ -53,6 +44,21 @@ static int intel_init(struct pci_dev *pci)
>  			   reg & INTEL_RESETS_RESET_DONE, 0,
>  			   INTEL_RESETS_TIMEOUT_US);
>  	writel(INTEL_RESETS_RESET, priv + INTEL_RESETS);
> +}
> +
> +static int intel_init(struct pci_dev *pci)
> +{
> +	void __iomem *priv = intel_priv(pci);
> +	int ret;
> +
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	ret = dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(64));
> +	if (ret)
> +		return ret;
> +
> +	intel_reset(priv);
>
>  	return 0;
>  }
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
