Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F89D7497F
	for <linux-i3c@archiver.kernel.org>; Fri, 19 Dec 2025 16:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7iZnqgGdsBX+uSzm2Nwc+Ci67SNqpVvpTnmGVKPQjRE=; b=VW48WLGSJxWIWY
	wltYyIL8zU+WpOzAseGSTABz+RI62MA4mtNTLIUBg1vLqiTdyNIprKASvA2h6uCekRxB1QM97jL62
	gLK796zsMiAIt/t65z5KutsJ8zezf0SwXOYVOLFjJC09mAlBxzXn5VFn0W5ZRyIWCD82qcfkCDHUE
	tD7MqR5VKOT79wzQawFM93mXCaT7flrnwGM1bMoHjn9K4c+LCMytS2VtPjY4evpgm2Je9JiLr5IcP
	JUI8qSOconkzuyjgOICkSNrxWr1WQ/Q1zt6iBdR5/5Yf6e11TuQ+NFqUOyjFSwYueN3FCWSdhDo2C
	e8EvaFPCGLtGYooEkyRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWdY1-0000000Af8O-2y3Y;
	Fri, 19 Dec 2025 16:41:45 +0000
Received: from mail-northeuropeazon11011031.outbound.protection.outlook.com ([52.101.65.31] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWdXy-0000000Af7c-33a3
	for linux-i3c@lists.infradead.org;
	Fri, 19 Dec 2025 16:41:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QYzpHdJ8MtiJoMgTPM3p9AmXlPhE+DS34+cRV0xJDE5dv4VtOv/L564x5Z4ik4xQ8flMR3eHu8apBznaOSBJGwj28Xo6aU4o7cV4dXwh+5+7s1PnprMMj2DCnYyp7lhjNYYNb97xkjIy+eKXriPZvJQODv//sHUqMf+3IDCYsU1x8vRxUUsB4VX26VzwJYw2RU9UCrEU7W7PVqBiF5jfIufAhjHIlNlKigDSQB+UBOxDMHODLMxGtEgD9Jx1Qwc3l9XCNrfUBnglThEkpJI3n+Wwqi+kK+d7pBvVvdQ82MVTZrQC/gGPXCGYjL2bRDO0BA/x9QgcBHjZxQTpdu7Euw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+vvSu960gJ3R988Zeuk4YbacxjZLyTWz55LKEpYCi30=;
 b=KD/2Ljg24umYRgQhWLMpAKI+pqMBxx177dlhjcRV84JSDiJqKfS/F5O8ZjHmGYl/kBWhgk/ZxMWm+pxWW+OIHSQqFjliGBRHSH1c869d+eSj37DWnsDAeh9otceKYmtFMZxTtdGiqNHGpK1BOY9GleKbeu41lto59b0nmOkmS83nX5d2rHhWmJP5fZtaeQ069j+uXxM6WE/ctUmI1PHpRFDZdbGcG3Ht6LnPXunHwOMIixFID8t0oD7dOsxi3Z1beF5Ci/WR4tXIVhSx/SMM8DCgquxcqvkxQwEz3qL9UZRwWB4IhmFnklhe6wFe6Qo7uB1bUwAixLMpBhQzzHBFDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+vvSu960gJ3R988Zeuk4YbacxjZLyTWz55LKEpYCi30=;
 b=KGu5YiItQneqmKz5JOnI0swAiWjbjlyW59XFu5+KZavnLpuaY75+3Xhl8CxztQXridMG/ns3WY0vC9PpZwayp9YThonpDjUCvXhXDouibIfKxr6ej2Dr+oMayZTG1hLMEa+wu5Y6cQSMFJlTHi12hYC2ElZxkvU1pTE3rhf3z8Q270M1mDXKi8rRFqILDj7/3VxIipPB1ldwJWK7VOZXZwhN/NDGJ8sThScc20iiFLF4rlhoGSLPyC3BTS0dD1IFlruVPCkrxnGEWMzU/Z2MWBhx5YTObvboVlCW31yiM1/EZ91IvzOE6KvZJ66q4odUMvUz9oqp5YCq74kcS3RRzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AS8PR04MB8500.eurprd04.prod.outlook.com (2603:10a6:20b:343::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Fri, 19 Dec
 2025 16:41:38 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 16:41:38 +0000
Date: Fri, 19 Dec 2025 11:41:31 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>, linux-i3c@lists.infradead.org
Subject: Re: [PATCH 10/17] i3c: mipi-i3c-hci: Extract ring initialization
 from hci_dma_init()
Message-ID: <aUWAO9TRYeDdSteZ@lizhi-Precision-Tower-5810>
References: <20251219144534.84391-1-adrian.hunter@intel.com>
 <20251219144534.84391-11-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20251219144534.84391-11-adrian.hunter@intel.com>
X-ClientProxiedBy: SJ0PR03CA0227.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::22) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|AS8PR04MB8500:EE_
X-MS-Office365-Filtering-Correlation-Id: 20d0dd07-133a-4abc-d27d-08de3f1d7ab0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|19092799006|376014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xW5hPiygTdAjwOEAF2RNTiDzdpGoljFbGQlUwk3Bw1nPDzdmgxD3S1mtg/hb?=
 =?us-ascii?Q?++96nOMrnfchqA8dvHihjEZW+Lf7qIVut0ntjoIC1VPGBiWbsAqXwUMtJMNi?=
 =?us-ascii?Q?DFSsLK5EY5lrGnVFZnuO2Z2PwhbNndhEnLMlx2RhTDYok/Pnh3lhkjxM0HCD?=
 =?us-ascii?Q?ZBSG5kLjdcAx8udm7l8vo/jwyLyUjTyCOl4JPMb553MprRUkL+ciB3PAlEpc?=
 =?us-ascii?Q?CWM/weIijj0ef456RWu3uf667zFRWgkO+3j1HuPccA6stQWxZOBjk3VshZQE?=
 =?us-ascii?Q?5Ry8OVlrwXbtqUIebaq0+6Te47BlslKY4JBssnxV7MZCk8/OzSToVAmHVAaT?=
 =?us-ascii?Q?iLKB8xyQ3LSxTwGd2FD1XIHl1aHC2opAV+ivLzeDJCog/0B43FDg/+TuvH90?=
 =?us-ascii?Q?tYTkvBStnTOvKsKX5fX9pB5h3rNeVP/mWn12slh3xt5iUzbh2oMg8LzbWMJf?=
 =?us-ascii?Q?DOMirVPKOIQd4/E8FQvIh2OVn8N+dMBzPushWZ9EVHiwxPLq4d94LfQkymQE?=
 =?us-ascii?Q?ztYx2w6STPGpF8ChUxOvIR43Ni9QA1aylpBWwBS51jAw8xB/mi/zBqXwgGTY?=
 =?us-ascii?Q?SAKmR/XfG2iewf5PV+kxnFyI5eNxL6BSuau3xZ+UKEhLiL0yyKeRJYZ+16Rn?=
 =?us-ascii?Q?86GS2Va47UWAbwlPOZF0JWmsmmPYyoJsUyYV2+u84/nwgsKMfNHM7MCjRFHA?=
 =?us-ascii?Q?m2DO0Z10C+y76noi7GSFpoKlu/4WwpIH0GEi43WEbSFa18us9dzPdCghbD+l?=
 =?us-ascii?Q?gOJjwiqQPOJLRg+/ytP/y4/c5iAPhfyECJ22lq/knBtEenNOaVPIk9fIBXRX?=
 =?us-ascii?Q?TYQD4yQu4eGq/67bGRDOtPFV0RziWcMbF2NCeyg3KIlfORgsb2KQzwOQAfcW?=
 =?us-ascii?Q?aURJge6foe75zuXMFt2hSRwXDH1p0jNbxwcD46z5IRbHu1duMuz2Rbde1gYv?=
 =?us-ascii?Q?LO2HqpoDswrknOBYsFIQxr7VKjoV+IXl7EYuXGQE/+idxyR/iW8VHzQs1zlU?=
 =?us-ascii?Q?5kO1UMb+jU4XidHTsAQ8Y3MmPUj8SCYbyFV7ekszKq723XlkVKqVkUeAnIGS?=
 =?us-ascii?Q?0kB7pFvdxxgH5ooktUYOMAcc28Rz56kDmPw+J2JDP8XALFzc5cW0krQf2LEI?=
 =?us-ascii?Q?t1KdVTHKRglU32YqALEpUAb/lqB1nlTLIuyMbquVnP/yZT/VJFexVD01glNt?=
 =?us-ascii?Q?ZYykzgE3tZ+sSsTbi8kC+TpUhFz0Nfm3tCG6ZeFsnX4x/t0i2/lmA6ODuJMR?=
 =?us-ascii?Q?hHysLIH6KYiHuOV2qFxdTSsH6G/w1wTDgn+zsYAEV/cNNT+qluz5W6DYVEYk?=
 =?us-ascii?Q?4SDNQhtIbs8IfG+ZEjDyZt4GdXGMKXd73e1HS4JPyln0FG5y6AGH1XLidgKT?=
 =?us-ascii?Q?hYGrPtulRYCIHacO6W9ztF0EiAayKbmk5Cmdwdl4CtA3ir5JnS2cGktJ7B5c?=
 =?us-ascii?Q?AVQ2YQ6Vq6Ol5U0OnBF6LszScOqhVEArtiT3/WpeqfmC64k/dc2rel7igkR0?=
 =?us-ascii?Q?+FeZoIK6cL/e5oG7bzetNjHpKYXwZrgo8qhU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(19092799006)(376014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RTEHmRDuwu1Ccglv4Rqvm5bsOSKdT4sqWBvzv0W8X4VaQhyLlLgECSD7pNal?=
 =?us-ascii?Q?boL8FWxPpyc8U258pwDpFPCb+MWYYiHExhlcOyVeoo+yvD0xpJWI8LgvjI07?=
 =?us-ascii?Q?L91VB9N9mjgG1WIiwD0+t/XKFI6afSCAZ6IBYlzt34KF3MfaBC8SfU4VtIBD?=
 =?us-ascii?Q?B3k8e9Y/IYgsBXNJFN7BPr9Sug6kcENi3sAb7Ox2ELfPifqyy9RBUfCi0pFe?=
 =?us-ascii?Q?vGupNfOsLoehG+9LmQVBB31w8Y/ZXdVIV8fXuludEWJVHegQQiX5sA8p+krg?=
 =?us-ascii?Q?T+vM+LbLlc8Ob6rv0ySxGuJXf0Uw20gUFbj0j5tORgOccp1WFlSfy/grEqPo?=
 =?us-ascii?Q?Gi9BVvdVlkcglklZE3WsNyAFd48Akyn+Cw8e5RvS6qwHdaLd6i0IqoftpPke?=
 =?us-ascii?Q?m+DE0G8cMElH+TdD5iEZxFeOAB9ZGXfDpXmDaYl/w3sN7e6LZ8ARM/D6/N9Y?=
 =?us-ascii?Q?2xUCsosAFJhL2Eu4Mew1SQBjFndddtjrNnebZQ/lBb5IX1eYP58pvi/38nR6?=
 =?us-ascii?Q?hAvIKkuh2ojJNsWpqTEBqWY4GpBRXleYMnGoM+NKgXTv+GqzWwgVXEw+yxEg?=
 =?us-ascii?Q?HjZwWvYF5RTwE0TEgoF2YX9d5hJ/LWBPzX22YZV784ahonXN+wI9pnGk7tJu?=
 =?us-ascii?Q?BJWzo9tvbKccdCMpmxCCB76cwnh8Cp6vtiHpRl4MlwNvAhyC273fXDJV/iup?=
 =?us-ascii?Q?FShxJFfSEvHXfVknijKpcHRf+XkBZNLOhLQ4aPxW5jBD+QKvypNf2h+ZinQz?=
 =?us-ascii?Q?Ey+NeyIF8SHhCVgeu/rZUFyd6y3Da36+DPjcTDzPwG9Sdw4tKJHqZyJVahUN?=
 =?us-ascii?Q?O4XHjFEgDZr1vsDVeo54jOqGYqqb592YIYEGU47hKVrc73r6jcl9MUz1MquO?=
 =?us-ascii?Q?stwLy8wkGYvLTKAl5oVHiERTVW3k5EST7f+Fa4/orSq+QO4dL5qpZtpUfL7B?=
 =?us-ascii?Q?iECHy/NEXEK5efc3eHJ7hMzeeyS2+sFUfOlcUk2YbGzIlr+qodOmYX0D8Prk?=
 =?us-ascii?Q?1EU7qvabFnrxuf+L9W10WoJ6IN4S+yuohjLtBghz3sW6l7+XXZQDkHttNugq?=
 =?us-ascii?Q?EkAAh2d0YpsebPvcSKhtdjqE5bqqaV/vOL4LlKc1Q6WEodL7/iYCzlQYH+89?=
 =?us-ascii?Q?h4ZwYis2b/5DrYEVOGHhKAZ64c3b1NCWz1AWBewPwuz7Q6Vt9G6BPFzKoii0?=
 =?us-ascii?Q?Wl1KUVDAfTAr58JLLkCEB1sDXmnSIdoWBfokmeT+EjlzzrL1Tjc6pZUExzfJ?=
 =?us-ascii?Q?JwUUWferTFjJrkWfqZ0qujG+MK3zpUeNXgnseBnRcWcxdk5iN5PCwoBAc3FF?=
 =?us-ascii?Q?7BXOuW1dgdUxzYLYhOkS5dN5PbCY8u3UwNYDv9N+7q6DuFhI1v+mX8xMXxkc?=
 =?us-ascii?Q?GMEThRODEe9yrm4HlaxkeQGtgVWuCA2++R6an1qOTWmfPAARogkovKLr89N8?=
 =?us-ascii?Q?8TjLUV3kAKCewJMysTkotMfst+TheLyzAdjhWbRHtj8YpbpUoK3gtIZn7+Fm?=
 =?us-ascii?Q?/dqAGXVz7kZFu5GbF1QbARxdaqU5m8W0N8JbTPH7xpOv+W2dE2RXLlQfkobX?=
 =?us-ascii?Q?799Hw5hN5kCQgZXd8qhxu5W4FaRJLAG5GVPefChb1zdgAbGNyqQXN/TAWSLd?=
 =?us-ascii?Q?t7qhFoCtJqjGwDvYSdv2W+7klIcEpklcBWJQCc/41CxLHj+7mu8xb9XDEpWb?=
 =?us-ascii?Q?HLTUGIYenorDBDGiYs6veaxP24MC7GPdg/oK4WLjKGrspUeLePMgZ+QbxHqO?=
 =?us-ascii?Q?XDFsMl8ycw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20d0dd07-133a-4abc-d27d-08de3f1d7ab0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 16:41:37.9694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QQbTC6+244vKa4LmBLOz9AKWqm7Ies2jPep5ty9oP1twnGHa5UzGNpj2glOxTpHKSxe4HFtUSGsffWJfY4xzCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8500
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_084142_912055_BBA0B35F 
X-CRM114-Status: GOOD (  23.67  )
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

On Fri, Dec 19, 2025 at 04:45:27PM +0200, Adrian Hunter wrote:
> Split the ring setup logic out of hci_dma_init() into a new helper
> hci_dma_init_rings().  This refactoring prepares for Runtime PM support
> by allowing DMA rings to be reinitialized independently after resume.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/mipi-i3c-hci/dma.c | 118 +++++++++++++++-----------
>  1 file changed, 68 insertions(+), 50 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> index 703d5cf79d5e..d0fc245f8e8f 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> @@ -210,6 +210,71 @@ static void hci_dma_cleanup(struct i3c_hci *hci)
>  	rhs_reg_write(CONTROL, 0);
>  }
>
> +static void hci_dma_init_rh(struct i3c_hci *hci, struct hci_rh_data *rh, int i)
> +{
> +	u32 regval;
> +
> +	rh_reg_write(CMD_RING_BASE_LO, lower_32_bits(rh->xfer_dma));
> +	rh_reg_write(CMD_RING_BASE_HI, upper_32_bits(rh->xfer_dma));
> +	rh_reg_write(RESP_RING_BASE_LO, lower_32_bits(rh->resp_dma));
> +	rh_reg_write(RESP_RING_BASE_HI, upper_32_bits(rh->resp_dma));
> +
> +	regval = FIELD_PREP(CR_RING_SIZE, rh->xfer_entries);
> +	rh_reg_write(CR_SETUP, regval);
> +
> +	rh_reg_write(INTR_STATUS_ENABLE, 0xffffffff);
> +	rh_reg_write(INTR_SIGNAL_ENABLE, INTR_IBI_READY |
> +					 INTR_TRANSFER_COMPLETION |
> +					 INTR_RING_OP |
> +					 INTR_TRANSFER_ERR |
> +					 INTR_IBI_RING_FULL |
> +					 INTR_TRANSFER_ABORT);
> +
> +	if (i >= IBI_RINGS)
> +		goto ring_ready;
> +
> +	rh_reg_write(IBI_STATUS_RING_BASE_LO, lower_32_bits(rh->ibi_status_dma));
> +	rh_reg_write(IBI_STATUS_RING_BASE_HI, upper_32_bits(rh->ibi_status_dma));
> +	rh_reg_write(IBI_DATA_RING_BASE_LO, lower_32_bits(rh->ibi_data_dma));
> +	rh_reg_write(IBI_DATA_RING_BASE_HI, upper_32_bits(rh->ibi_data_dma));
> +
> +	regval = FIELD_PREP(IBI_STATUS_RING_SIZE, rh->ibi_status_entries) |
> +		 FIELD_PREP(IBI_DATA_CHUNK_SIZE, ilog2(rh->ibi_chunk_sz) - 2) |
> +		 FIELD_PREP(IBI_DATA_CHUNK_COUNT, rh->ibi_chunks_total);
> +	rh_reg_write(IBI_SETUP, regval);
> +
> +	regval = rh_reg_read(INTR_SIGNAL_ENABLE);
> +	regval |= INTR_IBI_READY;
> +	rh_reg_write(INTR_SIGNAL_ENABLE, regval);
> +
> +ring_ready:
> +	/*
> +	 * The MIPI I3C HCI specification does not document reset values for
> +	 * RING_OPERATION1 fields and some controllers (e.g. Intel controllers)
> +	 * do not reset the values, so ensure the ring pointers are set to zero
> +	 * here.
> +	 */
> +	rh_reg_write(RING_OPERATION1, 0);
> +
> +	rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE);
> +	rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE | RING_CTRL_RUN_STOP);
> +
> +	rh->done_ptr = 0;
> +	rh->ibi_chunk_ptr = 0;
> +}
> +
> +static void hci_dma_init_rings(struct i3c_hci *hci)
> +{
> +	struct hci_rings_data *rings = hci->io_data;
> +	u32 regval;
> +
> +	regval = FIELD_PREP(MAX_HEADER_COUNT, rings->total);
> +	rhs_reg_write(CONTROL, regval);
> +
> +	for (int i = 0; i < rings->total; i++)
> +		hci_dma_init_rh(hci, &rings->headers[i], i);
> +}
> +
>  static int hci_dma_init(struct i3c_hci *hci)
>  {
>  	struct hci_rings_data *rings;
> @@ -247,9 +312,6 @@ static int hci_dma_init(struct i3c_hci *hci)
>  	rings->total = nr_rings;
>  	rings->sysdev = sysdev;
>
> -	regval = FIELD_PREP(MAX_HEADER_COUNT, rings->total);
> -	rhs_reg_write(CONTROL, regval);
> -
>  	for (i = 0; i < rings->total; i++) {
>  		u32 offset = rhs_reg_read(RHn_OFFSET(i));
>
> @@ -284,26 +346,10 @@ static int hci_dma_init(struct i3c_hci *hci)
>  		if (!rh->xfer || !rh->resp || !rh->src_xfers)
>  			goto err_out;
>
> -		rh_reg_write(CMD_RING_BASE_LO, lower_32_bits(rh->xfer_dma));
> -		rh_reg_write(CMD_RING_BASE_HI, upper_32_bits(rh->xfer_dma));
> -		rh_reg_write(RESP_RING_BASE_LO, lower_32_bits(rh->resp_dma));
> -		rh_reg_write(RESP_RING_BASE_HI, upper_32_bits(rh->resp_dma));
> -
> -		regval = FIELD_PREP(CR_RING_SIZE, rh->xfer_entries);
> -		rh_reg_write(CR_SETUP, regval);
> -
> -		rh_reg_write(INTR_STATUS_ENABLE, 0xffffffff);
> -		rh_reg_write(INTR_SIGNAL_ENABLE, INTR_IBI_READY |
> -						 INTR_TRANSFER_COMPLETION |
> -						 INTR_RING_OP |
> -						 INTR_TRANSFER_ERR |
> -						 INTR_IBI_RING_FULL |
> -						 INTR_TRANSFER_ABORT);
> -
>  		/* IBIs */
>
>  		if (i >= IBI_RINGS)
> -			goto ring_ready;
> +			continue;
>
>  		regval = rh_reg_read(IBI_SETUP);
>  		rh->ibi_status_sz = FIELD_GET(IBI_STATUS_STRUCT_SIZE, regval);
> @@ -342,45 +388,17 @@ static int hci_dma_init(struct i3c_hci *hci)
>  			ret = -ENOMEM;
>  			goto err_out;
>  		}
> -
> -		rh_reg_write(IBI_STATUS_RING_BASE_LO, lower_32_bits(rh->ibi_status_dma));
> -		rh_reg_write(IBI_STATUS_RING_BASE_HI, upper_32_bits(rh->ibi_status_dma));
> -		rh_reg_write(IBI_DATA_RING_BASE_LO, lower_32_bits(rh->ibi_data_dma));
> -		rh_reg_write(IBI_DATA_RING_BASE_HI, upper_32_bits(rh->ibi_data_dma));
> -
> -		regval = FIELD_PREP(IBI_STATUS_RING_SIZE,
> -				    rh->ibi_status_entries) |
> -			 FIELD_PREP(IBI_DATA_CHUNK_SIZE,
> -				    ilog2(rh->ibi_chunk_sz) - 2) |
> -			 FIELD_PREP(IBI_DATA_CHUNK_COUNT,
> -				    rh->ibi_chunks_total);
> -		rh_reg_write(IBI_SETUP, regval);
> -
> -		regval = rh_reg_read(INTR_SIGNAL_ENABLE);
> -		regval |= INTR_IBI_READY;
> -		rh_reg_write(INTR_SIGNAL_ENABLE, regval);
> -
> -ring_ready:
> -		/*
> -		 * The MIPI I3C HCI specification does not document reset values for
> -		 * RING_OPERATION1 fields and some controllers (e.g. Intel controllers)
> -		 * do not reset the values, so ensure the ring pointers are set to zero
> -		 * here.
> -		 */
> -		rh_reg_write(RING_OPERATION1, 0);
> -
> -		rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE |
> -					   RING_CTRL_RUN_STOP);
>  	}
>
>  	ret = devm_add_action(hci->master.dev.parent, hci_dma_free, hci);
>  	if (ret)
>  		goto err_out;
>
> +	hci_dma_init_rings(hci);
> +
>  	return 0;
>
>  err_out:
> -	hci_dma_cleanup(hci);
>  	hci_dma_free(hci);
>  	return ret;
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
