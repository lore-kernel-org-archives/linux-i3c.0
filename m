Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF498CE8D76
	for <linux-i3c@archiver.kernel.org>; Fri, 14 Nov 2025 19:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7KbgqKT0l1qX3WSAbXt4vZzS7VJku18JnR+PkPMQbdY=; b=DIqszYqt7cj9rV
	lV5zwD40JDj1J0U5AtEwuioNy5wCjonfVmicujq0zL+M+vcWUC76lnmfrdM3qhHd7lBhHm69arxvc
	qrRVVs07gREOxUznjuxlfLiQKWOxYoxMys3nzD8mXwi4YDdQ1v3wsTpo9dNhiVnyevbu0NdvW2Pbf
	PWDrL6Adot4siJoFVHvRXrcRJ0Ppdl1+fx0meMVJdVgC64cZuugtcmf8pmFD43NUC3F2rKqcMA7Ud
	VNUtBOgf20kn1h+TJeNRO46aJ+1+wILHQVj7jgUF0SJTvvUVzcueeSjaA5Oh0FxKsxTGjXMrCTINp
	gu28jDLXKtrXgsiYRMBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJzkw-0000000D2HZ-2BC0;
	Fri, 14 Nov 2025 19:46:50 +0000
Received: from mail-northeuropeazon11010031.outbound.protection.outlook.com ([52.101.84.31] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJzkt-0000000D2HB-2Vq9
	for linux-i3c@lists.infradead.org;
	Fri, 14 Nov 2025 19:46:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rLBGhwE7klPS/sC0P8+2pSIEjUWruAF+IULaknIaR17ITgPMQ5jPyEjKQBvYqkVOi6hlAmHOe6gF8rnnRzPx82rVhX8CZQ8aSkY/0jp7oglwaFM1kkpbcu8/XXFWv5wDQstO7h93KIO2mj497c7hYwwdCu3jlEGtfjrT/L+bScqL/5V9AfAbvRQJSJe7t5zTvj6epyl8j+zfqGirL8yhzvKV/DuJTXMjo6MFV0t6P7nqVFcnih4Lo/C6pbaK8zyyxhAIhsiJaTnT3pTENNsZxuBSIdQdgR1TvQL970icLisaiM3AfvcwJZQH0pLSU/Xburjl1Gy3UzeFmHMTZRSfaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VQ3ife5jSzL00P/mRyGE9hCDQUF/G1R5wRn/H7T7IrM=;
 b=f9LbuS9+9pGv4UDGQ6B9ByfwDES+vuoJ88RUc6ZfmvM3KYm+tTK/6A+Sz/3gV7VUgve0Rg4BA6ZfLyy07/RqQpARYn/lENqXh+gd8kufGdxa5EjHG2IQCC7+tddfHzVFYE5/b5YuMRV2YARXP25lNG3A3kBIqnJjQqKTOlaCmiRShoLApjtCTOaNqz3F6sUUM3PVxT9gNHJboiij6tdHsCB1YQwoQMHKFYQndsYBuCkVL5Zf4Sh3MMFuodRHrSZjAMreek0qKX59lrX2b+XoOwr/IFyqKQZ4ahFKe5IdPGfrx4AEXFuDTmZY41e3Tx4WM2MJNznPn8R+PQMVBVBk7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQ3ife5jSzL00P/mRyGE9hCDQUF/G1R5wRn/H7T7IrM=;
 b=KtnhmdPShMmvwaeWWpe8kpgfZl1aab80oADRuCrXmRDfseBS17GSD3ZpUXBSlnBX0FlREvbAOgMzUocSZTOY+N+78QijfskunNoCuGyy0wUsqG8/VuK/LJwhi84WX3Kxw2w3LTdbD5VLwsgp+jCkaauFLj6hP82amWtRZXlb7s5HsJXv163x/DAv/xSu1SWkUc6NM1N9oOke0hVwRY76VPteVGmrdYpch1fcQjvrM60SiD30CRTeJHvgcjL3fwnwQ0yrmSOAs27tKbeb+dMnC1n+g/8Q+Fe6aIsjkSHCZEpqrljY1jtcv5l+Ia1hr0yBITV3DjSwq3mRZ7FCOkNRlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PAXPR04MB8475.eurprd04.prod.outlook.com (2603:10a6:102:1de::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Fri, 14 Nov
 2025 19:46:43 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 19:46:43 +0000
Date: Fri, 14 Nov 2025 14:46:37 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V2 07/13] i3c: mipi-i3c-hci-pci: Factor out intel_reset()
Message-ID: <aReHHa+Mxf+URO/c@lizhi-Precision-Tower-5810>
References: <20251114181356.66515-1-adrian.hunter@intel.com>
 <20251114181356.66515-8-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20251114181356.66515-8-adrian.hunter@intel.com>
X-ClientProxiedBy: SJ0PR13CA0117.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::32) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PAXPR04MB8475:EE_
X-MS-Office365-Filtering-Correlation-Id: 87022473-1629-4c6c-7f0d-08de23b689c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|366016|1800799024|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sz4+EydF3f8Yrei3nCB1jq1EWaYB+WlVsRpuGo5JbBIGPNUpapZaG7VAjwbt?=
 =?us-ascii?Q?KEHyu2WVowjE0arzL5ixB1xus2zB1fU83IWlpsNtTVi92rcB5MKPkQykR+Kg?=
 =?us-ascii?Q?vAuM7ZneKjkPBzmht/EpfSOfr8NeIghRFpE1WpDXpWqKpX8yDHS7ADeoh1MN?=
 =?us-ascii?Q?mtsjSe+gfhj62vcjSN1lsqvb/3mN0fxcRG4WxmU1D8zk4+borzi9NZRmvVBK?=
 =?us-ascii?Q?4lao7G7OdrgzN7iF7gsA7wOE/kvRRUFyUBQ/XGO3oMq6VrbOwYIBn81gdBEy?=
 =?us-ascii?Q?LyK24ayAZSCThX5ivWGA086hsBBGp9neFe2XllzcSxcADPiMv/+sAqS4m+xf?=
 =?us-ascii?Q?jXa564CbkOUYc0ytMNxY5JssSjrMGm99UAwiEd5OrxZk2jCiTuJS0oJAKdJh?=
 =?us-ascii?Q?KM53QwBH0uOtoHPDgaWTxBNbpKsJ+hmKfzpjuAB2hWva7TMx7TBS6m0SDTcB?=
 =?us-ascii?Q?hmVjnCwaQFUdW9DHyZ0W8AgxOjSSDYIW/WYn9fFoMsALveIdu4PAjUTMk/S9?=
 =?us-ascii?Q?eX3Lu7e5tvEF+9HsYPhYU3up46pABzmkmPwhyJYm3hzq8y2ztmyd94QbtbTx?=
 =?us-ascii?Q?NKU4epe+tV9RF90HeSZC+H71rgzNCi9Ykt597xSSoBmMbM3qQY3IrmRl/Qxp?=
 =?us-ascii?Q?BB5wvIgGCcJoPj0pTV9E5tMQDaKh8zT4U04m4VqgYx/Z9rwshYeb7xz0awy5?=
 =?us-ascii?Q?gOIt/H/WaijGUWY1o+Aq+Iaz14j80gZUlFcTBmC4c14Z+dGcByH9Lmu1HcYz?=
 =?us-ascii?Q?mkeRzHqKs8uYmafa+rIZNznzBAkj+XnsHey3RX6eqRutvf04uZiFw3sVXEIG?=
 =?us-ascii?Q?JiVIdwJHaTJh82YXmHaslqSi+q425rR1LvuwVhAmk10pFRz6f0hPF36NC6v0?=
 =?us-ascii?Q?VWDCnVgQEWgot0zdxzSScERX8mf1hmytCmson7jquWGZidzV7wZaG+z0tt7d?=
 =?us-ascii?Q?86PtIUuccZ0o5dwzrEd/mxB5/fdHX/Xcz35VE8KoWuLnID5U1SNVbu4yBUOL?=
 =?us-ascii?Q?DQhqsJ+CV8Nq3DwMDTIbDNJ4cwBE9qQ/ztcKY+RjuYF6Ibm7vcnTz+jOKnEM?=
 =?us-ascii?Q?cpi2rAarKbMWpsLqWRliwL4VNRtz6fqxSW6RxGEZDt/vEOevPb5gMHlcFmfY?=
 =?us-ascii?Q?BOnOnMn/Vy+rA6gp3Gpp846xkREoiiWPSKar8woGEy+0Ycf4AaminS1sP7o/?=
 =?us-ascii?Q?5Wkrj6JwGyH+753254abCY3+G1eyeyGEEhiYGT4g/8BcWCogy6VFSZNjaq/4?=
 =?us-ascii?Q?Ggn1Fsz2Cy2siLYyIIvvzFnVj1/j4f6I7njWp9Jn+Zm74Nk7t7T8sOGTvH7t?=
 =?us-ascii?Q?fv4ahZMgvrjrwj0nUfcwLkdrdQBf1+8uZKfUrkcetb2JXe6rLYu3NArFgBbU?=
 =?us-ascii?Q?XleLBk7cHuWHJQ1XG8C3udlZUo97oVoO8ud4mknPZSrpQFRQafpNJPXS46XP?=
 =?us-ascii?Q?wNJukK+jO9iVG1VQVXfm7/6Ve+Mk2USgwnEcVgdCmlE16XbEA7pkMRQDdXYQ?=
 =?us-ascii?Q?32szjW09W8TAIbap2HocuMrUh9Q6SN+8UHHq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?21ygDr6Y8hc1GOxOLz7J5iYpkBYUU94M2/zNF1IHotX+sZSkCamuvhQduPXV?=
 =?us-ascii?Q?Ee41BK4PZoFSD8eUKHPuqkQylRIdsyxOPnNRWvNN+mhr1HBSy/OG6OOqDFg1?=
 =?us-ascii?Q?dHs8lfR4b+6c+mEn/px0jjq8859OG2nTgXx3nwBE1HZJazjZg29nB6aFlRcK?=
 =?us-ascii?Q?NUXklH2n/3IYZA1Ijs0VBCZ5ZCPBTVcoqn/kOwXVvUoumx8pZFHglVa/1JCK?=
 =?us-ascii?Q?xr0JJk8Im6jW9UiyLV8kENzUfH+ACBt5tqELulwS4oHFMFchyGBflEJuEEdO?=
 =?us-ascii?Q?82Z22omTvgTsNE7eNDBZRtrF6mJ25P0JE4nvbcNYqk03egtGet6Tl6BOaOS+?=
 =?us-ascii?Q?N1bP2vRMLPD0yT3z9y7IGbzxw7j/+U5xswfdwckhJ8abxfPhhNxsq0DTmI4y?=
 =?us-ascii?Q?ifamgkAL/h3o2XAO3PbHyfkg8yfSTTsR9lql/eo52Par2QICmwwXmtgksb11?=
 =?us-ascii?Q?irWiJa9BxwlrBRoA4zKftNg79ZR2o4BzTJvu/R34cgLFoNBo3HhQMqfXx2LB?=
 =?us-ascii?Q?m8ZvlREOoIDryLRfw2O+jZLgH4ahM+8jWhnOldmuDcTaLNgw7UlZhkI/ApdU?=
 =?us-ascii?Q?ZGpmiUE3EzcH2aRlniNHxfJ5KlJbuiX35QkiwDj0EbR06zWwjC3CdXzLcple?=
 =?us-ascii?Q?LI/+RsOGwlj4DdffdnZdj2JuzPNXJoHkLmCIz2hjpiCbNSF94UI5ALpiPX6P?=
 =?us-ascii?Q?wZ6Er+q56rFXEZmsTZmJapByKn9K6OQy4VFrMxpFZAMMcMWOffcFLoFcgxJJ?=
 =?us-ascii?Q?6i3jpxVyYK5hygZRZ0rXw6cv4JMpJYycaYN9TX4mN+7hkZ7LZGisMt1y21p5?=
 =?us-ascii?Q?/id+kgdwWmqXNAJ1vJTDKWVhLy2I/pnBAgk+W8VPxyAzzbucfPZ4P29HrjdY?=
 =?us-ascii?Q?ikiIHeW8J0xsBRNeApAv2FHYplEYa4qqbpIHY+If8ycTmGoffbYJYjYS33w4?=
 =?us-ascii?Q?TwArwq0fBZibQoHRJWrKWuUUn90HGHBqkNdytXCtnB4UdLZQC2xf/ZvRMbmV?=
 =?us-ascii?Q?Zws0ZA1mOw8fZeTPqSxphBtHHv1EoUe/kcRFkR6zqiyeC0GIFsV6UPamo59j?=
 =?us-ascii?Q?EUtuNH8MUYYt5pxC62Ag/qoC/eQ/w5Vwd/MKQ8OpSLpP4UQBh8MiOvTc4Mpf?=
 =?us-ascii?Q?zokyzSpUdQ8qfsCYVvZ7Q9zWcUGLFhtxaupdgDVVz6ToI98cnd2SA3AasTac?=
 =?us-ascii?Q?1lO8EPBLZComYRjdaqDs5iIOX1ZhNIFCocjNiG2usAw4lZN4NcBwL0jYw6A6?=
 =?us-ascii?Q?AyZ7CNElAOOjE7sA713Ki/HAPAQmOE3tgutWiWxqJ/6S30oKDqojIQdqgkX/?=
 =?us-ascii?Q?Qn4j7Qvawxx/d8ump3+o7/UZw9pEQBKKFEbWFfJew9a+7JwqnizEdENLldAt?=
 =?us-ascii?Q?iPIidrEuXQ3ZBc/O+F7skXgN4jAWkOyUN2kvfitovUVwbiYpdUhhbtFAkoYD?=
 =?us-ascii?Q?e5wbygB2hOXaZ74HTa3JipI3gIgfm6lBi+9daMqqZxSDRWkdk0trWdozINNP?=
 =?us-ascii?Q?Q1pwi9oP2C72015GXWNf8irP1aUUmfAV0t7tvM4hwBS8KBiPmtda9cUwnr9n?=
 =?us-ascii?Q?4TpkiweUX1k4fbj9fzuZZ0WIrR/sSamYoe/uA/zg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87022473-1629-4c6c-7f0d-08de23b689c0
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 19:46:43.7254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 54m11scrFmE0RXRNvT9fIdocW1u7PPELV9HmwRaSyLMlfn1y6qtX977xgERdaHOYZQZl3Akg+guzMOKKzJwUqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8475
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_114647_641018_E065EF20 
X-CRM114-Status: GOOD (  18.71  )
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

On Fri, Nov 14, 2025 at 08:13:50PM +0200, Adrian Hunter wrote:
> For neatness, factor out intel_reset().
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>
> Changes in V2:
>
> 	Move location of intel_reset() to get a prettier diff
>
>
>  .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    | 20 ++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> index 1e1f2c42bd74..b9794212b2fb 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> @@ -27,6 +27,18 @@ static DEFINE_IDA(mipi_i3c_hci_pci_ida);
>  #define INTEL_RESETS_RESET_DONE		BIT(1)
>  #define INTEL_RESETS_TIMEOUT_US		(10 * USEC_PER_MSEC)
>
> +static void intel_reset(void __iomem *priv)
> +{
> +	u32 reg;
> +
> +	/* Assert reset, wait for completion and release reset */
> +	writel(0, priv + INTEL_RESETS);
> +	readl_poll_timeout(priv + INTEL_RESETS, reg,
> +			   reg & INTEL_RESETS_RESET_DONE, 0,
> +			   INTEL_RESETS_TIMEOUT_US);
> +	writel(INTEL_RESETS_RESET, priv + INTEL_RESETS);
> +}
> +
>  static void __iomem *intel_priv(struct pci_dev *pci)
>  {
>  	resource_size_t base = pci_resource_start(pci, 0);
> @@ -37,19 +49,13 @@ static void __iomem *intel_priv(struct pci_dev *pci)
>  static int intel_i3c_init(struct pci_dev *pci)
>  {
>  	void __iomem *priv = intel_priv(pci);
> -	u32 reg;
>
>  	if (!priv)
>  		return -ENOMEM;
>
>  	dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(64));
>
> -	/* Assert reset, wait for completion and release reset */
> -	writel(0, priv + INTEL_RESETS);
> -	readl_poll_timeout(priv + INTEL_RESETS, reg,
> -			   reg & INTEL_RESETS_RESET_DONE, 0,
> -			   INTEL_RESETS_TIMEOUT_US);
> -	writel(INTEL_RESETS_RESET, priv + INTEL_RESETS);
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
