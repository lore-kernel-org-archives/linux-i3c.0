Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F79D7879C
	for <linux-i3c@archiver.kernel.org>; Fri, 19 Dec 2025 16:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GiP4pK1da/hlDLE/vIDiFyQMtPQJ7QzvmX/GTHuLLzk=; b=vYRMtUvLp1m5Yc
	pbXrvGn7vl4vjEccf4bRZT10JiZzmVccqSsI2FbwxyjQNmVvwhItwIMlFpjvFZVfOcx6tOmk4lSek
	A3qk9htWJgM+Xh3sHWrUymznFqOibMirrstLh8MqQGrKX9kTNt52fkgXtA4L/xznKmn3StwhbH7Ap
	Mr/xVE+6sgmDPvlWNGMgY2Zf7dTCYy5ZuXSLy7jK3oz+H2FDmdYZLDKCrcweJ8LOtWj23dkWfRY2q
	xucTJLb3U1G5reYZ435uPPLJCgoUGZTgjMRw8o+3ftkf+focb6aHOjhqOKa294mTBdL/GcOnOfNCY
	JleUei4zMaC448ugONIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWdPV-0000000Aeby-1iFw;
	Fri, 19 Dec 2025 16:32:57 +0000
Received: from mail-westeuropeazon11010052.outbound.protection.outlook.com ([52.101.69.52] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWdPT-0000000AebT-37Gd
	for linux-i3c@lists.infradead.org;
	Fri, 19 Dec 2025 16:32:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JizC+5eXHWDU+BavrG6MRUL/JgquVJbXuHAuJHI/Ho0+dxQSN6DBbD+AFXyyEn0NidjYL3+WkCSfyUAPU5AmXZqmz6fD4Vm8gl1hAwCl3tGt5NIAoWBKw63hdZ30BnpfW6LrS4DWvofQrCgVOthgFD+P/LipKjOLFLBtsEyDoIKBZHJinss9nf3k7437IZQl9Tbf7adG20zHvLwT+ioVamQZLL7bQVHie/hPmv/sNC34M4B3p6t/wQgRcOdvqoIeMR+nZVf4bk/swkQ2GA98P9a99pbHZJ9RaclQNaLuWAQGYJRuLGeqUov0J4Q64h1QTtLH379/DG1WPlLSPepaMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g6Gi0v885UweG3AS/5sUT5QPm9dL5EoBypPpnCXScIo=;
 b=WmDc51sN+hXUxKW8+WgAQkzn7E7MvA8IM69LhJm8dPiWd8LISRdSqxFRINzMOAJRxt403vipYICiRWcquUqcjEmXLPLvwPEhmQrUPcVfO3r5Qk63cOIRTzk7KGMGVzoutMxuBQvVwjq0c1nh0u2oDEh2MyT7t3OPOzLem9lXtsOf2mfjZ6DP0NR2wy1jc89PF39LAyMSbqpiaYUl3w6tMtDF0gMOHuh8TAWWoiQC0QNXnC4EPHzKww3WNbrFfpNK3xCYMmO4GBe9bzmYlHcsjWT3/CxGUr3dEo55ypDSU2rxLBftOcUpHK+9O2vmCHJ3gJzMGkV0Yux93NQBTgPKtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g6Gi0v885UweG3AS/5sUT5QPm9dL5EoBypPpnCXScIo=;
 b=nQoWOJGBh+Sw6tmczUzv/yAKnfpUm5U+KyqYcRdv9mJ/PglGUw4Hbxe6DVEyp00Bf2G6uJ4/+UL8yA3IRLOoFXj/ObTGv4o1N1FZXo6NoplSjRJjhF5oM4xXqGQ7DcRnBHZthi4GfrYN10pew+UvxWpd4KRf5DX6bIZwBmeTsuK9pRapo7J6zlDj5IRNL+p2TVFxJn3kn/qlTnol8fR2vyyh4jaLET+npl+g/UdzX68pTC18UruNo482kj7WwG6eN+368srLYJbGQV+KHuiReKw+1QcJnI/EBfnDRjPXWBPjWhgEVbYQvR14/MDwouGrLdAa62W/ykVwtind5lJN6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AM8PR04MB7300.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Fri, 19 Dec
 2025 16:32:52 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 16:32:52 +0000
Date: Fri, 19 Dec 2025 11:32:45 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>, linux-i3c@lists.infradead.org
Subject: Re: [PATCH 07/17] i3c: mipi-i3c-hci: Manage DMA deallocation via
 devres action
Message-ID: <aUV+LTLg5dq/cjGK@lizhi-Precision-Tower-5810>
References: <20251219144534.84391-1-adrian.hunter@intel.com>
 <20251219144534.84391-8-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20251219144534.84391-8-adrian.hunter@intel.com>
X-ClientProxiedBy: SJ0PR03CA0078.namprd03.prod.outlook.com
 (2603:10b6:a03:331::23) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|AM8PR04MB7300:EE_
X-MS-Office365-Filtering-Correlation-Id: 6245b2b6-f38e-4caf-3415-08de3f1c412f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|52116014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mdEIwnaHMIW98vJFerXR86b2uHC3YBlkilpVrnW+igv2EgfkUy40gFwVZdtJ?=
 =?us-ascii?Q?nXIA3W/lkGRHkiGHjimtTiQonfV/XD4Tf6ckyyzd5JA4aakVp/hMP79sbvnz?=
 =?us-ascii?Q?uDV4xxreiH36Nc5T9ok0WK1XdFvOiVDJsx4ydFP6Ka1IdoOUdyjLAbXt8JJs?=
 =?us-ascii?Q?Q2gxaAftC2n/ndmOJlP5dxNdAvuCYON2aXjadKgfYO2ixpOrZ0BuLhNlqnlS?=
 =?us-ascii?Q?aBYkYdZEK49JwvbXue9pZ4hhxjmhhg6X2uSfjUBas6S4CVtXjPedVpk0rjmL?=
 =?us-ascii?Q?ndsEBxStKMzjhNV2dZYe52R38KP6y0VpkmTMeUGp+NNaaO7w/npZrbas428K?=
 =?us-ascii?Q?L69b55JX0AjIhj9s6tr6wsgv/p/KMlzprh1EotaU6c2/9WxOUGWPks5pW3/F?=
 =?us-ascii?Q?++3jgkebvFKO9IAY9vrdyUDxhKAFc2HUOakb/58N2Nhtc0hfpNdaljspjs5C?=
 =?us-ascii?Q?Qclrfny9CiRO1kNHVLJq7V8UBo948fYdOE2VUIoOgcA7l23bWeafkzbOoGxH?=
 =?us-ascii?Q?s2vSuhtt3N+mWMbVLC2aWz/ik9qvtcUEZWXCqYg+QMBcrrRCuPMCSM6Qs2l2?=
 =?us-ascii?Q?k+Voku+cUGfpFGDLML9eyjvoe0L84LFaP1QtvEnyfZWQ3OLy3LnQ/PjZLqzn?=
 =?us-ascii?Q?G3n+mXoVl0ffWxPSdV1uXRVRWsxsZ8mKVrC8heW3e32Qf9vvX9UNV1MJWN52?=
 =?us-ascii?Q?nC3tWq4zr7/lWSeaTHmAG47uoQrAhaR63jjY00wPy8RQC1lvuskHKoWWpak3?=
 =?us-ascii?Q?UW084JVU2/CM0cQWrlh5j+RZWRvTcDBoOArQG14cxQtkSo0nR+J3cRwW0O6O?=
 =?us-ascii?Q?jrwR01T8+sQwY3JAcLf0v5a3ehpzVzY6OIYAvoJqbzQFKdC+icRkdGx55r07?=
 =?us-ascii?Q?XQVfZbxgIP97wWmYfgjB4Pv+y44+oGU7V7SJ+6aCNiKTnWinFFktrkYalcKv?=
 =?us-ascii?Q?EDykrmc0nDqjgJOYB8BocJ/TcaXsxaLHkSmHxwG83Eu769CL6uZROsxlglP1?=
 =?us-ascii?Q?Kvgy0/Hk/kyB4MqbeRTemoDj4ellQOkL+S8Jujlc7zSQQt05GE8gzRqh91Ya?=
 =?us-ascii?Q?9AfIxxj+SNIgek8fXfmN1otVBsYbZ2RvLXzYXRDmvWOUhUJidcEtZCTS4hCQ?=
 =?us-ascii?Q?7vEQs9vJ3rLPfBLsvEw2mfAC0ocxe1qsIYbDDVGOldqmr2LNn0FY/kLdG7No?=
 =?us-ascii?Q?U50Id7dwq8/374yM2dXyaf+B1xqiughR9nthNes49ncl2ZSILa3HauNfP5n0?=
 =?us-ascii?Q?drepc00sRQdlWE1T1mSXgSfqR1kFes0YkTOAbTZmTAW5kHswDECaBSSkMfEC?=
 =?us-ascii?Q?y3eEBnWNSIH5pBNsz9B85WpOjzBSm/hrtE11AqYDO5rQO4V9OF7loSxrnlNv?=
 =?us-ascii?Q?N4CtnWvzOIoK3PJ9EZXGIb/z6wP9hX5h5JvI6CrzuH4vn2ZnjkLvi5td+LeI?=
 =?us-ascii?Q?iWPUIJTRTEG1u6PGRXGpudWgS0fIQI6SaS4LIlrfEF0kmEEYsM+wkTGoSlsY?=
 =?us-ascii?Q?/kIOEDyBPW7rtg+01f2TXVkGHpgHMQzjEpza?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(52116014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uvfqE3u06Q+ERL1WxhF3pHdHrvWxjpjov93mcpoVfcj9IjbbqrBNGXzZsxNp?=
 =?us-ascii?Q?Ab4v04rB0sXT6GFosz+EMwqBFCeRfqllgNAzobUPwR2ZJlzSh0hiMQjgkqZ7?=
 =?us-ascii?Q?j4Qg1Nkou/+8s/h+undpKPmybBmhT2iN7Pf5u2hb/y7OIYYupwb0bNMw5Tp7?=
 =?us-ascii?Q?pFHMvYqIcixHqPoejLIesV1kmvxgY7J/EByok/+dqXZBL9C6vCNsMEhbQ0p6?=
 =?us-ascii?Q?0ew5oSqi49lauo7XbOtxWyxMPJQ5dIElC9I4RGMNiKjLZUEvFKjBe9jhTLig?=
 =?us-ascii?Q?92l9TXrerNEr2A3rLVpDJJ/hRGwKNBFzsBdvDZ5LkwSptLFagr/1M+wBWyzT?=
 =?us-ascii?Q?sCQ8/Ezj+OTufEwWVj6TdzeG2HOEOvn0oHtdCQ4MIXBy6xqwS9wIWaVe7qX9?=
 =?us-ascii?Q?Un1q7CRX595+BOaRY5AABwzEgzht9yOjfWrWgasydCV/0NIHCTpOZh55oe0r?=
 =?us-ascii?Q?Bz/mAuN42MsTXq6UZsjL6XWzO8+N57pcZTMswBjASr+tknKkrR2zvAeqBqJ8?=
 =?us-ascii?Q?0lVAXHoZjJLBFKjSMdswi/08Jod3aE9UMOuasMTlR3f5Btm6gvL46oeROYl6?=
 =?us-ascii?Q?BsJWvvYf/A5xrS2WL0+upiDscbKC5D2PDSqR7e4DX/Ct3k9AFemn637VzllN?=
 =?us-ascii?Q?J6ZOuCjz114RMZLFSAZrKEr7xEiZJcsN9ZbYA7e6aywQUO8X+d+1P/NnfBeS?=
 =?us-ascii?Q?Z3wEJMKG55QM1Z7GeXi8+nKjMmghsK2OyEYo6jjXT1TceRTD3ZMHr1tIhxJS?=
 =?us-ascii?Q?RjHpvy9TVDb7nCIstKCFf3XKXJ4LtdzrOkoTzxDblNhYQwtPDAfsgPA8lXwP?=
 =?us-ascii?Q?RG6uTdmw/OjoQ1BhNjmGIIK52DA9CsiL1bW0It/DoOf57ky44nePybAZ2467?=
 =?us-ascii?Q?cBCMlDLPF7plikNWj0GV5BRgXPHIQmUKiKHTCvGkLVP3jsLQ8gsADlnXBmoe?=
 =?us-ascii?Q?sy8i8T24PacRuuZ8BdeVybI3VTz19ZDFpeF78mRaQhAO3WrkD03lFRmClCcf?=
 =?us-ascii?Q?EOHdg3fCsvbPwLvHS9ZeniKeG/RswVD2e//0RMeTMVhAGas4q3CDeBtS2xv/?=
 =?us-ascii?Q?juV7VvaL7muSpifMjfgtJ4FXYhhthPnhO7bqTV3GI+jQJkJA7wNtsO2okDHS?=
 =?us-ascii?Q?TlcrTQpZXpIYTTlVgc4CFbkCSES/Z2ByRxVf6ESTpxbyovHMvqcqBegSxCJj?=
 =?us-ascii?Q?onyUnOGGdTLfCf1+9t5Y8uvP4W1bIcHuyRa+2bMaDH/OL6yGfuXeSgR/yOQD?=
 =?us-ascii?Q?DlZZJCV4sQk/IzI8POZ+SI4J5ZcjJEgpwmyxWb1VCs9k+6NujEwHyaH3tFjS?=
 =?us-ascii?Q?4/pTEPTjEWGBSfjrsGRhofO/ZUsEjl1LO8skoGA5t5pz4UTgPahm2atUK1UM?=
 =?us-ascii?Q?G5W/ZpyVIlPkn8xtBd8opQr0YMoml2YSL1hlaz192aOmy6IycTl/HN8FQpRB?=
 =?us-ascii?Q?ZaK6f1qNyoOzJH33c5iHKv8HXbHV2ZBKdfJkdtEbthIKLiT3FFb/Qv9C0y11?=
 =?us-ascii?Q?xAa9rnMZAQtX2fSJx8B4sKmgLlc/vug2FYjpW1Gy4AjcNFLiF7hoPZkbWHPJ?=
 =?us-ascii?Q?h+gppnirahIE8ts1HRulw1s/POvlNvsDDrOiJpAolrDUjEHHsffWxGurlv53?=
 =?us-ascii?Q?MQL25mRPU5mEB9PER4J3J847ZictOAb6aGA2YDCFqLtNaGsobVt901H114dP?=
 =?us-ascii?Q?Osii6NRtfu4K32/tigEBYjFY8ifqjiST+YKtGbbV7CNTl++AH/GfBOll4Rj+?=
 =?us-ascii?Q?m1vpKkf8og=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6245b2b6-f38e-4caf-3415-08de3f1c412f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 16:32:51.9683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: euq1sNpmySle6YK4zYWBv994mFT8g2Zjy63glgc+757/TgCKTpfwr6uKeEfvg8QaqRrAZ/sgHfpnRNUkCtPrUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7300
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_083255_787319_3668DE19 
X-CRM114-Status: GOOD (  23.35  )
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

On Fri, Dec 19, 2025 at 04:45:24PM +0200, Adrian Hunter wrote:
> The driver already uses devres for resource management, but the standard
> resource-managed DMA allocation helpers cannot be used because they assume
> the DMA device matches the managed device.
>
> To address this, factor out the deallocation logic from hci_dma_cleanup()
> into a new helper, hci_dma_free(), and register it as a devres action.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
>  drivers/i3c/master/mipi-i3c-hci/dma.c | 53 ++++++++++++++++++---------
>  1 file changed, 36 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> index 54849aa98fad..703d5cf79d5e 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> @@ -146,30 +146,18 @@ struct hci_dma_dev_ibi_data {
>  	unsigned int max_len;
>  };
>
> -static void hci_dma_cleanup(struct i3c_hci *hci)
> +static void hci_dma_free(void *data)

can you move hci_dma_free() below hci_dma_cleanup() to make patch look
better to review?

>  {
> +	struct i3c_hci *hci = data;
>  	struct hci_rings_data *rings = hci->io_data;
>  	struct hci_rh_data *rh;
> -	unsigned int i;
>
>  	if (!rings)
>  		return;
>
> -	for (i = 0; i < rings->total; i++) {
> -		rh = &rings->headers[i];
> -
> -		rh_reg_write(INTR_SIGNAL_ENABLE, 0);
> -		rh_reg_write(RING_CONTROL, 0);
> -	}
> -
> -	i3c_hci_sync_irq_inactive(hci);
> -
> -	for (i = 0; i < rings->total; i++) {
> +	for (int i = 0; i < rings->total; i++) {
>  		rh = &rings->headers[i];
>
> -		rh_reg_write(CR_SETUP, 0);
> -		rh_reg_write(IBI_SETUP, 0);
> -
>  		if (rh->xfer)
>  			dma_free_coherent(rings->sysdev,
>  					  rh->xfer_struct_sz * rh->xfer_entries,
> @@ -190,12 +178,38 @@ static void hci_dma_cleanup(struct i3c_hci *hci)
>  		kfree(rh->ibi_data);
>  	}
>
> -	rhs_reg_write(CONTROL, 0);
> -
>  	kfree(rings);
>  	hci->io_data = NULL;
>  }
>
> +static void hci_dma_cleanup(struct i3c_hci *hci)
> +{
> +	struct hci_rings_data *rings = hci->io_data;
> +	struct hci_rh_data *rh;
> +	unsigned int i;
> +
> +	if (!rings)
> +		return;
> +
> +	for (i = 0; i < rings->total; i++) {
> +		rh = &rings->headers[i];
> +
> +		rh_reg_write(INTR_SIGNAL_ENABLE, 0);
> +		rh_reg_write(RING_CONTROL, 0);
> +	}
> +
> +	i3c_hci_sync_irq_inactive(hci);
> +
> +	for (i = 0; i < rings->total; i++) {
> +		rh = &rings->headers[i];
> +
> +		rh_reg_write(CR_SETUP, 0);
> +		rh_reg_write(IBI_SETUP, 0);
> +	}
> +
> +	rhs_reg_write(CONTROL, 0);
> +}
> +
>  static int hci_dma_init(struct i3c_hci *hci)
>  {
>  	struct hci_rings_data *rings;
> @@ -359,10 +373,15 @@ static int hci_dma_init(struct i3c_hci *hci)
>  					   RING_CTRL_RUN_STOP);
>  	}
>
> +	ret = devm_add_action(hci->master.dev.parent, hci_dma_free, hci);
> +	if (ret)
> +		goto err_out;
> +

use devm_add_action_or_reset(), so needn't goto

Frank
>  	return 0;
>
>  err_out:
>  	hci_dma_cleanup(hci);
> +	hci_dma_free(hci);
>  	return ret;
>  }
>
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
