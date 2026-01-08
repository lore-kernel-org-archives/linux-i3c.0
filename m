Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 694BFD1D47B
	for <linux-i3c@archiver.kernel.org>; Thu,  8 Jan 2026 15:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yYPE1buLY9Wsb0cTSgrbFYqgi2yrh0sHHlTMYDYS0yQ=; b=hTFcHp02da3JPt
	0ePG5CTBJCOR9+qfomub04h7l+yAATGOUXN/T1ya9eNvz64A4snhEykeveFUhevlsLMFEe2W1Bbg4
	Xa3LjKiFZY2eH47keE7M8G8YCNVRzoHr75s6/+5iORgL5qMKN6WMNStoc4cQ7ea6r1u5taF3Mat9H
	FBU5Wxk1tuAC3rD2D7/tEB4YxnvOKlYol0VEXwzjjuLOmwwBZx8Dn/3pJqfFLM2z5KxnWt5j5nmPI
	PXSTcppD3IM/7bYSFcxeOfdIO2xFrFJSQ+N4PEt2bK2+/UBnnH/asqrVAR385Nq9bqsEX5W3XjPi6
	XgmA1+xJwn/JvSIEq7PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdrta-0000000HWD5-0jqf;
	Thu, 08 Jan 2026 15:25:54 +0000
Received: from mail-francesouthazon11011031.outbound.protection.outlook.com ([40.107.130.31] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdrtX-0000000HWBA-45Na
	for linux-i3c@lists.infradead.org;
	Thu, 08 Jan 2026 15:25:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n5wFBYrSgb0GF+7Dk9KjbLqr277M/gaekG07y+PgVzrKG5XNSjIEhzoB8Bc6vC/6iORVOyVujwdi4iqi1EthsAir4+nuxMeeg5wlFDQoZMgJthqRY4P46hg0IbBsg7FgF2EMh0Gf110TOwAzjZ9OpquHG6UDj+pLd7vasfUcP8Q9AhNs4uw7L7h5yC/LDEj3OytQr0iYhyxCgdAHRwPoUopgwvANz2Jiv5i16VROfnEX320v+csk/YoRowAkTf2hYJ4Gt9WSTVzNi9u7vil0ND0g+LRATGHudcGKc6dAuo7PT+mkRkrLJH8u2HKL/zgupIkIZuyIiXgykH7n0x1Yug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f7pmYoO29wmwL0MaaNtB9jmWosYmbMrvr3cybsi1/+U=;
 b=traRu+daZ14aOETdDNv/4HIfFv/JHLvZDCFCBPpQJCsQpXgN7a2PHAKmCWHOk5A14UQFCzf9GbnU+CVkC11wsWZ6BF5GZoWrAbd/NWk1mBHN1vuWDhBEo67p6YbD7irVx0Fc8joivEVnGQBGYkDjNPkvEu4xZq/8yjqhYRhIgoZYOYFDBlVONrjyVek+C7zMDnipYrZhtKhg2pzn0GFPQfzVOYz8rc6CULeNK1pwDU3UD7KHByK/92uc1Wvz8ixNJVxeLE48Ww9pEYBPL5xKL1VuTZ/XNZbCZ2te4dQdXgEZBQRaq6CA/gwFmh92G89EofXPWLiAn0zyv9Dg6xUqkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f7pmYoO29wmwL0MaaNtB9jmWosYmbMrvr3cybsi1/+U=;
 b=l0ucmcwXrQMbiJS40F8zvpAuEeTQuXhhcJl4Toke73HLTe2jXOCSd6J4Di0aBDenAirHnAknAflhwfRT5VxAe/5WxDeGeA5/IcPnQZbJOQo3Rw789cJJYLc7q+lMQMoxnN/SjS0h9kxl8/ogbVMdAuqYRN9KEw35C6n5X6E6UXLp/wIwS7DwPYerydZioeSR/beq7z2lSglfcUWCHGLUa9IpLPX6k4AobGIpcH/p7PJI/lqpyNV6F1AaXLCl8N9DSPZQZCS/ckhknZ36XoIO5JjE7q+OTyEjm69hASaLpCH5bxGxIsmoLmHQ0qtJdUAJ5Ot7VGbqwszQdD7RupLdJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DU4PR04MB11007.eurprd04.prod.outlook.com (2603:10a6:10:582::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 15:25:44 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Thu, 8 Jan 2026
 15:25:44 +0000
Date: Thu, 8 Jan 2026 10:25:37 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V2 16/20] i3c: mipi-i3c-hci: Factor out core
 initialization into helper
Message-ID: <aV/McWAd528d2pv9@lizhi-Precision-Tower-5810>
References: <20260108080558.21767-1-adrian.hunter@intel.com>
 <20260108080558.21767-17-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260108080558.21767-17-adrian.hunter@intel.com>
X-ClientProxiedBy: SJ0PR03CA0170.namprd03.prod.outlook.com
 (2603:10b6:a03:338::25) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|DU4PR04MB11007:EE_
X-MS-Office365-Filtering-Correlation-Id: e166e4ee-a398-44b4-ee26-08de4eca3108
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|376014|366016|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tiRU59YYrRF5lFF+UPOrntMmFjVguWdQT9aWTstYP77VXwGL23hHUtbRqUae?=
 =?us-ascii?Q?KXXICKEBtbaKmdQ70oW1IwF8oObEgZE3qXeqNNcf6GheyzJdF5NvL890iY24?=
 =?us-ascii?Q?lirC+zF/hdbuCiC6sKW+0HJ6TJrUVX/4/PpfoTBrAEAY0hPn2iDCjtFTxdL1?=
 =?us-ascii?Q?j1hBzNzINrjYaqHmFOV7G+XO0RwBMnIH5fM2KBrqoVbNbiqEM45yRfpbG0Ou?=
 =?us-ascii?Q?gdwIxTwbe2eEUt5sDHT9uuH4oCf6HD4xeXSMHeWGwljtuFIr9s+QiMRXdLe0?=
 =?us-ascii?Q?r+S5Ue+PjjC92XMVYqjlym1VHwh50hProSgtU0D0zn33L/HWv69z8P6Ai/qO?=
 =?us-ascii?Q?vBjOjtGWhdrrrGlgWiUCPy8tASoWfz9/UCogaQ1LONoLmCV0KB8FBNyFp89H?=
 =?us-ascii?Q?rGi3ltYyAPdIkl2vi45s1pY8GuVTZm+rhnnS/g4d1VgAcruuTpEFpWnyYUzy?=
 =?us-ascii?Q?gv36fm+mpAr8WJeiwqJZnoz+PAfd30jSLK1XRRcXYGKVIAjG/2zINr6L6SHr?=
 =?us-ascii?Q?z1gED+mxFCIb7FwphyIy2aUAwQ7axpZo0bJQRubdkJqD/OG6y6H28tAbm76J?=
 =?us-ascii?Q?xXYErwDsByaCjL5v6Oz0kezrfpkEVIoHWtcerEseKil8taYSsZrNvhk4RrZA?=
 =?us-ascii?Q?gwnOhoUCHgflrV8Lqlfszod1yD3VqWKiSPq6YYBqJaGDWjI+fmpEaCKwABBg?=
 =?us-ascii?Q?89XaCRoN8AHt2btmWNbrGnITdS4zReT8XMu9hXSAQAmMhazIiVwWr7N5vomF?=
 =?us-ascii?Q?gm495Ia/BIxYQf+CHFJZW6NtrP18+56Q/gOcmx9215RvqI+FjQD56EkXyrWM?=
 =?us-ascii?Q?pNICTFqahUuT/oXKkvlLb94k4BNKlxtr+DpRoOSXJgaWk8QomZN3xbEmK7FC?=
 =?us-ascii?Q?njHV+g4CancKbL/VOvg3NemTAkr8MafnxFrhY6pnO2BkRruvt/PK1kEoL0T5?=
 =?us-ascii?Q?pcagOIKS1qAG2ZMXJPdEsuuTOW4CwA/rmhz3mn2GRDexpgI8HpglHOxiO0Ro?=
 =?us-ascii?Q?O17iOb69XmYWkpTOQrqdZWtSO3sh6gt34hDaIXp6zdLHOrAcra3CTlviFO48?=
 =?us-ascii?Q?NtIhoAb3V9iWvwR1QtqtlfgDf/TMD7MvImS4c/d66ZixCWpLPhVRdLWcZJGY?=
 =?us-ascii?Q?YJtJqGijMvhrNi3edCgTMjNrFmqjPSd3yyQNjROI1RYAjAXrco3QHdSmXYMn?=
 =?us-ascii?Q?HXJ99i9SNYtAQKwhX6KCGFSFhYvHFRICNgue7l/fKA+KIceUgV0rtAcEMc0E?=
 =?us-ascii?Q?mdiWNHSlpJJqzlNXJMDG/xWjrqxp2ZwHWAs86AYeorKqFKjn63ITs2V1eVzV?=
 =?us-ascii?Q?rOi9at5O1+O+2Wq3q6sGp/G4PSddPgNeqm6E+0yWY0+UAYooot7culLrkIsH?=
 =?us-ascii?Q?0w2VRRu9rFkdVI6NtLRcvaXkEjmTQAxA08gvWxAe65GpVshgxCne5XEFD0wH?=
 =?us-ascii?Q?fC4ZuT11gaMlOAclRpmfWjcO4SZxJXf49JeV5Ib4AnZFHhCx5Q9dGvjqmAXy?=
 =?us-ascii?Q?BxMDjgKsgL4v4min2XxiDw4WLWwStDG/yarW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PbNeBsRpVm10zFrUrb/H0uQkori3WrSNGGOPJNWAUEmzIN2eYzT5nqIeeeNq?=
 =?us-ascii?Q?ThG5TwN9rljMcYnAUtBMMgA56XLdB8HuRsZCvlaJOJkI5kaVcTxeUAp8Ma8Z?=
 =?us-ascii?Q?yTlE1B0fw0tjPMR0eDXUJRVfILBSFnoVREf0RgUXw0cf/DMjQlj19TtKMJ3b?=
 =?us-ascii?Q?pOw9bWJfTyCRMU+EiAOf1KaQ4kz4fq0TWfSiPDEalXI5BLqdUTc3RVC0cPUe?=
 =?us-ascii?Q?v5F/znDZzqGdAwF0HQHBhmWyB8B2KMxx0IorxQ/G4NGUDW2wAKVGHJYUCQxi?=
 =?us-ascii?Q?pSaD8AiixbHsjmYm/lzvberwmc/e/tlFZU+ehxnRwrDhFH171z4kr3Eq3i7I?=
 =?us-ascii?Q?rSNblAJ3KC5zMi6zbX8Jg9+YQNhm/EtGxCEyY7M6nVgXHLoZOZohr/XvFChF?=
 =?us-ascii?Q?XllFLsNQ1YvtBXPGEL9yrQ+rOUnVE30BlkkUGFLqqdFaMBm89ocgi3vt20EW?=
 =?us-ascii?Q?soPSiuuE7wQhdkvmBky6ZEBR6Uvut9fGgnQah1EtKH3QjGl/l9fSUOJmy/Cf?=
 =?us-ascii?Q?fAxuAJjFOrIadxRqaKOX4QBhFcyQaCex6GoXGIhl46b8qpdcQbF0bSR5a6oS?=
 =?us-ascii?Q?ZyQkfI6t3DaQWwUbyPBRrrCTxAT1FLgFth4o4Wm7MhamGtTPSKgtbJ5k4DRy?=
 =?us-ascii?Q?4Gzck035+m836XWP6+zWRCfwIrdRrCbNt4NWbhvU6xThNyodEYO9Be9/Qvm6?=
 =?us-ascii?Q?hGND9pO7oODgR3kgYubUbsyMapB65SOYsj9CqGoG85CiRj0w3XarXJtjvvyb?=
 =?us-ascii?Q?yIiKib6BMuInqq/RCNxK1je/hIBC3sNIbLUf0njhAaZGpKK6XQhYU4RsP+3X?=
 =?us-ascii?Q?iAQSGN9U7PhrFxGCbaB6qmlj1is3PihdJkXOhsEsKxYlsODhckzKZeLHgok9?=
 =?us-ascii?Q?/7Mse/I4Bvj/pEDR2Fll7GS1gJc9z7JMmfaZ8xdJh9hzPnA7VtTw5/q6PmCP?=
 =?us-ascii?Q?kJb07lEZ5vMesPZFTnJhEOOMsAwFguZNySPb/BzGQGJh9SPeD2PLGNnF1zoB?=
 =?us-ascii?Q?7HL6ovu5yaxfno1DU0w/rkyTZeU6Xl7gZJhkqxX7ET5vA1VAGyybyArc4Hzx?=
 =?us-ascii?Q?pF4VNrJP2XcUWaiLPKfcu931++GSOqlUBhgsF3xqGe/4FCW/2ugvNl3Njg8p?=
 =?us-ascii?Q?FxvdePkgOAPcZvnJ2jQ91NdIkyfllZ8KjhQ2mD3Ap/QPwyQDRgrWbYEYG/Ov?=
 =?us-ascii?Q?ovSIprKM0a2tBCWwb+swz6wzi1NyzBLBNoR6OMinTzfkmmSCLdV8V5jMgGOB?=
 =?us-ascii?Q?F1wEtpNmPzNQZ9w1FAWHQnMbS6CVaZShegC+kSWHvauSMD/ES/CnxYjRdp5g?=
 =?us-ascii?Q?yeRfQ1Uh8U2uF2STQP73MseFrSWL2nwO2AdybYEzeAD3UD9gKeM/gLCgsgX0?=
 =?us-ascii?Q?mo+oePGXMDmuuHeJHBxjep4ny2NfwP/Lhw3c6MzfcEkhVUxGxxSpTimnzewH?=
 =?us-ascii?Q?dS/7dwMhuTixmIgeMVvBNBKO+nac5G2pSgAopP3UWkl+FPnEJNGdDXd7qCSZ?=
 =?us-ascii?Q?H9XUZz7ieNOPm9byepFgt/vWqWPY+QxU4R0tGYSEDrDF7FKHlYPbK6MlIDDo?=
 =?us-ascii?Q?WqiQtcQniactl6k7Cn31796ma7K49NPCDuLkrq3stpwIkJedkkeoT/K5zsVG?=
 =?us-ascii?Q?gEAtB4CSTUh50NvkKMXMc1VOrycMsv+8UvVeQmZaQecqRa5Yl8q+tTXK6bZi?=
 =?us-ascii?Q?Y2QWxZ7tM3puSJgvi4TyVhHgrM1Ud8J+DmHZa7EvaS6i+e7S?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e166e4ee-a398-44b4-ee26-08de4eca3108
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 15:25:44.7326
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: thuj4cnGGJt8lbCTAgqgcjyXYxMnCLVf88GwQKrkvJKQ7xhjeoX5FJxHLPo3VfBrq5Nk1Np0mDh2lNQX+MMwJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_072552_180052_4A72500F 
X-CRM114-Status: GOOD (  26.02  )
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

On Thu, Jan 08, 2026 at 10:05:54AM +0200, Adrian Hunter wrote:
> Prepare for future reuse.  Move core initialization logic from
> i3c_hci_init() into a dedicated helper function,
> i3c_hci_reset_and_init().
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
>
>
> Changes in V2:
>
> 	New patch
>
>
>  drivers/i3c/master/mipi-i3c-hci/core.c | 146 +++++++++++++------------
>  1 file changed, 79 insertions(+), 67 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index 569c8584045a..fc0a47a36961 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -639,6 +639,84 @@ static int i3c_hci_set_io_mode(struct i3c_hci *hci, bool dma)
>  	return 0;
>  }
>
> +static int i3c_hci_reset_and_init(struct i3c_hci *hci)
> +{
> +	u32 regval;
> +	int ret;
> +
> +	ret = i3c_hci_software_reset(hci);
> +	if (ret)
> +		return -ENXIO;
> +
> +	/* Disable all interrupts */
> +	reg_write(INTR_SIGNAL_ENABLE, 0x0);
> +	/*
> +	 * Only allow bit 31:10 signal updates because
> +	 * Bit 0:9 are reserved in IP version >= 0.8
> +	 * Bit 0:5 are defined in IP version < 0.8 but not handled by PIO code
> +	 */
> +	reg_write(INTR_STATUS_ENABLE, GENMASK(31, 10));
> +
> +	/* Make sure our data ordering fits the host's */
> +	regval = reg_read(HC_CONTROL);
> +	if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN)) {
> +		if (!(regval & HC_CONTROL_DATA_BIG_ENDIAN)) {
> +			regval |= HC_CONTROL_DATA_BIG_ENDIAN;
> +			reg_write(HC_CONTROL, regval);
> +			regval = reg_read(HC_CONTROL);
> +			if (!(regval & HC_CONTROL_DATA_BIG_ENDIAN)) {
> +				dev_err(&hci->master.dev, "cannot set BE mode\n");
> +				return -EOPNOTSUPP;
> +			}
> +		}
> +	} else {
> +		if (regval & HC_CONTROL_DATA_BIG_ENDIAN) {
> +			regval &= ~HC_CONTROL_DATA_BIG_ENDIAN;
> +			reg_write(HC_CONTROL, regval);
> +			regval = reg_read(HC_CONTROL);
> +			if (regval & HC_CONTROL_DATA_BIG_ENDIAN) {
> +				dev_err(&hci->master.dev, "cannot clear BE mode\n");
> +				return -EOPNOTSUPP;
> +			}
> +		}
> +	}
> +
> +	if (hci->io) {
> +		ret = i3c_hci_set_io_mode(hci, hci->io == &mipi_i3c_hci_dma);

This one is additional changes, avoid mix it to such trivial code moving
patch.

Frank

> +	} else {
> +		/* Try activating DMA operations first */
> +		if (hci->RHS_regs) {
> +			ret = i3c_hci_set_io_mode(hci, true);
> +			if (!ret) {
> +				hci->io = &mipi_i3c_hci_dma;
> +				dev_dbg(&hci->master.dev, "Using DMA\n");
> +			}
> +		}
> +
> +		/* If no DMA, try PIO */
> +		if (!hci->io && hci->PIO_regs) {
> +			ret = i3c_hci_set_io_mode(hci, false);
> +			if (!ret) {
> +				hci->io = &mipi_i3c_hci_pio;
> +				dev_dbg(&hci->master.dev, "Using PIO\n");
> +			}
> +		}
> +
> +		if (!hci->io) {
> +			dev_err(&hci->master.dev, "neither DMA nor PIO can be used\n");
> +			ret = ret ?: -EINVAL;
> +		}
> +	}
> +	if (ret)
> +		return ret;
> +
> +	/* Configure OD and PP timings for AMD platforms */
> +	if (hci->quirks & HCI_QUIRK_OD_PP_TIMING)
> +		amd_set_od_pp_timing(hci);
> +
> +	return 0;
> +}
> +
>  static int i3c_hci_init(struct i3c_hci *hci)
>  {
>  	bool size_in_dwords;
> @@ -708,43 +786,6 @@ static int i3c_hci_init(struct i3c_hci *hci)
>  	if (ret)
>  		return ret;
>
> -	ret = i3c_hci_software_reset(hci);
> -	if (ret)
> -		return -ENXIO;
> -
> -	/* Disable all interrupts */
> -	reg_write(INTR_SIGNAL_ENABLE, 0x0);
> -	/*
> -	 * Only allow bit 31:10 signal updates because
> -	 * Bit 0:9 are reserved in IP version >= 0.8
> -	 * Bit 0:5 are defined in IP version < 0.8 but not handled by PIO code
> -	 */
> -	reg_write(INTR_STATUS_ENABLE, GENMASK(31, 10));
> -
> -	/* Make sure our data ordering fits the host's */
> -	regval = reg_read(HC_CONTROL);
> -	if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN)) {
> -		if (!(regval & HC_CONTROL_DATA_BIG_ENDIAN)) {
> -			regval |= HC_CONTROL_DATA_BIG_ENDIAN;
> -			reg_write(HC_CONTROL, regval);
> -			regval = reg_read(HC_CONTROL);
> -			if (!(regval & HC_CONTROL_DATA_BIG_ENDIAN)) {
> -				dev_err(&hci->master.dev, "cannot set BE mode\n");
> -				return -EOPNOTSUPP;
> -			}
> -		}
> -	} else {
> -		if (regval & HC_CONTROL_DATA_BIG_ENDIAN) {
> -			regval &= ~HC_CONTROL_DATA_BIG_ENDIAN;
> -			reg_write(HC_CONTROL, regval);
> -			regval = reg_read(HC_CONTROL);
> -			if (regval & HC_CONTROL_DATA_BIG_ENDIAN) {
> -				dev_err(&hci->master.dev, "cannot clear BE mode\n");
> -				return -EOPNOTSUPP;
> -			}
> -		}
> -	}
> -
>  	/* Select our command descriptor model */
>  	switch (FIELD_GET(HC_CAP_CMD_SIZE, hci->caps)) {
>  	case 0:
> @@ -762,36 +803,7 @@ static int i3c_hci_init(struct i3c_hci *hci)
>  	if (hci->quirks & HCI_QUIRK_PIO_MODE)
>  		hci->RHS_regs = NULL;
>
> -	/* Try activating DMA operations first */
> -	if (hci->RHS_regs) {
> -		ret = i3c_hci_set_io_mode(hci, true);
> -		if (!ret) {
> -			hci->io = &mipi_i3c_hci_dma;
> -			dev_dbg(&hci->master.dev, "Using DMA\n");
> -		}
> -	}
> -
> -	/* If no DMA, try PIO */
> -	if (!hci->io && hci->PIO_regs) {
> -		ret = i3c_hci_set_io_mode(hci, false);
> -		if (!ret) {
> -			hci->io = &mipi_i3c_hci_pio;
> -			dev_dbg(&hci->master.dev, "Using PIO\n");
> -		}
> -	}
> -
> -	if (!hci->io) {
> -		dev_err(&hci->master.dev, "neither DMA nor PIO can be used\n");
> -		if (!ret)
> -			ret = -EINVAL;
> -		return ret;
> -	}
> -
> -	/* Configure OD and PP timings for AMD platforms */
> -	if (hci->quirks & HCI_QUIRK_OD_PP_TIMING)
> -		amd_set_od_pp_timing(hci);
> -
> -	return 0;
> +	return i3c_hci_reset_and_init(hci);
>  }
>
>  static int i3c_hci_probe(struct platform_device *pdev)
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
