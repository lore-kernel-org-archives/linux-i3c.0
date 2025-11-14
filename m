Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C4DCEACC9
	for <linux-i3c@archiver.kernel.org>; Fri, 14 Nov 2025 20:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=djIcwLMXZ+nEmxi57mgQCuy/chu61vxVc1sokFF0zfo=; b=syNRly2EplHlhJ
	QmhgCxeFY3AgBI3rqrr2n4ectLt9nrmLuuDgweq75lTErYzCYuxRK0WCyuAvlc2rWCTGMFTg6xqjp
	Bbj1Dy3zMUQwzgBeBkJUhebmw0p9BsFZ0SoO8WrkMowABq2hPGJRQx9/RRoYECUemwJJVw3yTJJWK
	uCEG0FihRpgrIQ5rOrYVlitXkAS+IKZQgiKw0dUaJNpTs1wlSf0A19uEdjSU4tJGqgrii33RC95N2
	L1qa+cRExlfwjGX2D+T/1ykFQ77MisrRjmwbExDMnSTEGE5jQGIg2Vmqd+teXq1bOBezrupxNKwbl
	iEJ8UWc4RrW86GJX7ZLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK09F-0000000D4Hy-2cF6;
	Fri, 14 Nov 2025 20:11:57 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK09C-0000000D4He-2pBR
	for linux-i3c@lists.infradead.org;
	Fri, 14 Nov 2025 20:11:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yNDRVsm7x4mEYi2Ng9ove+/MidBA+l2APvi8icc7fZtWvFpFMgthcQ2k2W/ABsTkzVcSBU5KTMUZiPHczszlRKYyWYR+WXZJx+KJyl2BwqlnQ0i4DlTT4gR0Q6XnLNffrZ+nl1rkdvxyuSfcItidqSfA2AcSL2aXgndgb4cYkF8oz/M4RspdGNNB/9WO3KvGdkJBFZRQr3jWDgZ6tgWTPEPEYErDJKTaIEvCWVpsZxdEegCgtweVedDcH0z0K0lp6ZJ0/FwTl2V94XR19loYMR+jntnunVJrpx2yRVKnotVeyTgvDSfMNi0IXWYBws3nGk1CvL/s5/NjdxYDPU2r9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ov+peXCjOaBOAommRZawNFuqfyZJhboYBo8nQRdDNdQ=;
 b=byaQPjbYcmeI5pO7ANbnP+LDhxJtOp6eZdpM/eIr8nxBoaklkF8UD5xZC4zdsLU8LXtMypAS4Ir+BpZW3xeXFCxe58fF/BUveAk0vKhBxC86jvHVF5SoQkaRnZONfqF4WT+Eub3/yGtCawDAjs7Q/kM2lxSvkLeFZTqr/+URwah/5U2hPtGa+7+F5Cl55cFCpLAONhEMunqDcLL2r2w4z1zwC1zTUf3KBZd9X/r9B8zYsLTrl87pKO82IMG+oA/1RrHN9XixMWHQTSRqq2AUiW15Ii35oVNTyU0h9922Fq67FNtDkNr1KrKAW2t/C8np/ysA/IlEy1A7qyvso4xX2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ov+peXCjOaBOAommRZawNFuqfyZJhboYBo8nQRdDNdQ=;
 b=h4pqaAH2TtEFc2OK4CBOoaIgoY4WIXTH3j6svS3jHTjmSla3nQ8FdnCGYm5xhrodk0RHeKYOZ1OAsPoOyzUIC2rPftfH6MG+e+o1fAYhqq96ZVKrLhd5R8gOgziG0drEBlk64TbyeOYS280XcvRYxxWM5l22DWToML/LsE+CDdtlvgk9KFG1XxHC5QWp4gbYPbMlG7AFX/lPatSsCm5V/XcZung4GkDKCRVpPxdgbfEcklwsP02BxdC/zqFz8WIMeqoBMP34HuXLDLGcdt4e3tZ5jronG+bKcTJPA8P+akES00JTTyavZ/X4x60sxh+bxsn1WpMb5RChi7W+trtHVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by DB8PR04MB7004.eurprd04.prod.outlook.com (2603:10a6:10:11c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 20:11:51 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 20:11:50 +0000
Date: Fri, 14 Nov 2025 15:11:44 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V2 11/13] i3c: mipi-i3c-hci-pci: Allocate a structure for
 Intel controller information
Message-ID: <aReNALkIKGcQGZfY@lizhi-Precision-Tower-5810>
References: <20251114181356.66515-1-adrian.hunter@intel.com>
 <20251114181356.66515-12-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20251114181356.66515-12-adrian.hunter@intel.com>
X-ClientProxiedBy: BYAPR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::16) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|DB8PR04MB7004:EE_
X-MS-Office365-Filtering-Correlation-Id: 4524c909-e368-4774-9bc8-08de23ba0bbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|52116014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UnwI8fL99VQSoWIOVTYWvtUThfKVpbUj0Nxh/HotNA2xv6/XyvIOkS2IIwa3?=
 =?us-ascii?Q?45xDsCaaxpALoIf2ILt359roVVxE4bRzrcrXoN8vNx+2ilQeH3+zLW4SOCa/?=
 =?us-ascii?Q?B5BPsm6XIDLDxyYXs/7lHtb0naovQswrN33STnbla7n9X79CqpEjGxZgz5GS?=
 =?us-ascii?Q?+24X+c+k34f19oKifyxHOeEqc0JquOirm4BBPIJoMjc26Oewnsh6thVpNsRY?=
 =?us-ascii?Q?DRKKbesJVg/wWyARt5U85eduxB9IWFNo7nXqNx3JYDIOtssBtq2DAWg0dhQc?=
 =?us-ascii?Q?BiN37mz4N8yT9yoAWscwvFvePnrRAeeUJw8ATRLXtZOEeAUTedlObu1RozAp?=
 =?us-ascii?Q?muwh8lJ4RQOaKSs/9YKLv9GAF67ueSPijpOF3pMJhJY5YZn7dSz/CV6+QmLs?=
 =?us-ascii?Q?EEyK6ad+ONIVgRenjeWm7ERZsl+mALlPJHx4qS5tP3CKT5t1Al+xqz/DNeGh?=
 =?us-ascii?Q?FsWGpXI3UZhIFI5RQF4bdl+yfaON0ELl7nkXXNB6FwnJlEOiEdyMmBfe4Myi?=
 =?us-ascii?Q?yGP6JQNiuTPuLweBlzSoqc/BCBuqO7AMn+AXfYdCdjKUDfYp9ZS+kNfkSubf?=
 =?us-ascii?Q?QNghVAeL0Q95ATK8zKzvnivnumdAGC9ZHuZGIydQdblrOS/rdmK60m5BIkl0?=
 =?us-ascii?Q?havy9ztxquG95mcO8IwKFU3g9PGyhP5qVD/YtPTMvSzUMQlvlUXotd+hUGYp?=
 =?us-ascii?Q?8Uesj5s8G117zhFcFc7g1bCf72QniSggXJ32kqJeUQrb0slcHdaHEESDQJtY?=
 =?us-ascii?Q?3o6SGhu5foNReQeDxY/gab/AtFliqlm3BsylCHldcHN8ET7hTuYg73sHUxGW?=
 =?us-ascii?Q?7s/k6ai4i1KcLu0RSdGPoGXOkxFSmKam91amSpiyuXQJGi1ocNSGxo+HxV4p?=
 =?us-ascii?Q?b9PO8HT8cvrFCg6YcoW/b8JTa7jJiXW3M1gmN2SgcE9SL5Ih/Od66VZXXFnH?=
 =?us-ascii?Q?BOWyLFVs3pR9ltXGh8M7Ngrrq8GgIvjXauAHg2iodrXdqeg/U5WWf3T9vjkM?=
 =?us-ascii?Q?rz7lMPkRSiQGK+yDcUYg4z5QPAQ4goGn21UzEe5R67Pg+IPBKw1rul+vd1qA?=
 =?us-ascii?Q?MpcQSL8KmkXFRTvHmWB9MnxR8jYs3lV/fKe8mo3W4y1x5a4s7kbt1M7NKPFm?=
 =?us-ascii?Q?BtfuSmdl5xf4QCBXJT1/UtA9/ifKT3o+j5c7ziEKoF0J0KD26wKCybzO82nI?=
 =?us-ascii?Q?low8dG8T0mAp+ODmN57cx5Pb9MyAehxLKmqpEhl9cTdMG7Q0eo9RAvEW/cOW?=
 =?us-ascii?Q?9bHtMOFEy2WVPBSsK2TDmZWXfkzM8HRLt4B8CvymW9UuwBsdHCtm/RUZmo5D?=
 =?us-ascii?Q?vQ0k4FB2yW9isA7ywAzsrahMDJTjWlnTjDB926qUxXtJW25eGpM8sGfFC85F?=
 =?us-ascii?Q?qYshNXLYnI/tnSLXLIcAA8uDRiBMkgP5FOOAK2asJjJ4I/YxrZTx9eXbHDH2?=
 =?us-ascii?Q?aSswCPGt4IvOXt288tqzM17SZDWECz415ILbisMiE07wEe+v2LsmODS9V9Dv?=
 =?us-ascii?Q?P5ZqP1QwxieKm3G9Rh1K6//o1rDTZUEObDrs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(52116014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bCay/NBJTmi3eL/vU+7TmwiWpRbeXUZ8QOZaO7THhBKL4qHFMgoMUWmCzX4O?=
 =?us-ascii?Q?ink7iVW0g8cRq7UqKMI1moR+F7kvi6awfZtbdMdLMzc7VA4ZvoYy6vUJG7IP?=
 =?us-ascii?Q?KHE96Amx6R1YFW8Q6pI6zcrI8kpK8icLh9OjjHlvOyVjPtWyRD7Q2Ia+pJyA?=
 =?us-ascii?Q?DT67fOYYjydoMSOmuQWH2wvoVU1G7PllfR9BjFxeMJWOCiyQe2LDeRdws/UG?=
 =?us-ascii?Q?7kFq8Ubfijp3unFmSMGqWB7y8Fmebkd+fYXajpI8pNmF9lB5uM3slj8t8VHs?=
 =?us-ascii?Q?CF1wNUsIsxYnX+yxiYrtYMr+P03RiDGIG3oXIrzkWz4Z9p6jHlVoaesLzfJ0?=
 =?us-ascii?Q?ssc14GfYYwi7GBa9ciq2uNOdEjdSW+357m+mYe6qdKZc73ff2CL2RUrUaZs6?=
 =?us-ascii?Q?aQSNDMHicFuzU3thnlfbo9H6HCXK2s8sS62y/0goQfkJRlNCRxZnKeIiuBQ7?=
 =?us-ascii?Q?QaJN89OvSIVSEbJ8yPYXhiFYxp1rmE8864ox5mCI5j6blcDcItcZraxx1wrv?=
 =?us-ascii?Q?d0OsjZoxBlmH63pZS3EeXX993vneg3MOwcMKIDoeVmZJ2yMu1BkDPzAiTAM5?=
 =?us-ascii?Q?cqRk0p5VpQTYOePE+yf2+rQxtSmo1Ao0obEKZeA53klukd+UTADFHGE/1Sg8?=
 =?us-ascii?Q?wfcnEAdq4ifiX2wcCpmqX5itzY58BY/bQ8sUJZ95he/bO5tHKxgBNSoMqTbh?=
 =?us-ascii?Q?0UrMb/HEGpMeLiyG1IGuidnjstulefGiDekBgZAMMifN3nLbBWajcvgzY79m?=
 =?us-ascii?Q?I0muM6WtULDd2y6L1zwPVJQOSZKVqZBW76NibkpNdHiaIAC57XJVg1AaBZOC?=
 =?us-ascii?Q?BTnvoGnpL0xsDvPLyagFVHpF31BxNGJND+pMZimHZoOtlEG1z+UAzKd+snJL?=
 =?us-ascii?Q?iGVTYY6CtRHNYN6AMeS0yP7wJv+p6gAcGEprUpGv4AroF/Chn35LB5KK6X9I?=
 =?us-ascii?Q?ZuRCyanvgbJp8Rdrhght9+zv8XYoGVY88EB83ViYA8LtxHaApdmxU4n1VNSd?=
 =?us-ascii?Q?xkK1EG3D6tXugMASGTZPnuiJxz++JFR4haofWGTKklynI1vpkLkNe+MLf2DW?=
 =?us-ascii?Q?8aGLRT8cxh4EQ8LCzLmZSk/EViw9fJop10F/tOoPDZRCvTgzveHUMLMnyyb4?=
 =?us-ascii?Q?RPKM4N/rwiAlbBuZDunwGkNCFWrMlNTGG7i2S1l0QF1OGivLjcv2y8R6XReB?=
 =?us-ascii?Q?spFmmv0bOEnnMuRcXcvBF4+9AGlqA0kNvtJc+VpMqisfaJQ8iDQJwu3N/ryc?=
 =?us-ascii?Q?X7nPMU97WKqW8c/Vpr+bXb9uynO7mSSTTLR2fyQRbEW74sJ2E6KQW2pQqRWB?=
 =?us-ascii?Q?LEEArzQq9GUP/mH8V5O1WXqf841aCPEMqEdOqhtt3FsMiujrADgg895uZK2s?=
 =?us-ascii?Q?pINvnACX3kSgP8b1HuCphZ6QvEvbP3RaFXSPLQpW8PrgRdeJ8h9S49ytT6ex?=
 =?us-ascii?Q?e1Ka6RN/w/bdw8EW7zhEI99I3AcDYRd+Ozn9x0Ny/TVGW094Uie0otoIqmGq?=
 =?us-ascii?Q?2CC1yY4ElSsVEQoZH9KdYHOCHrjNfvTVB92Edem3ziPc4f7AmXZkbsokyno0?=
 =?us-ascii?Q?QQQ4/131B/v/LfO34Q42vHBXbQF73tupik/6DEfz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4524c909-e368-4774-9bc8-08de23ba0bbc
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 20:11:50.2403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h6ac5QpJHnr8iZmDVYNqcGxDK3oW7qsAWYvxOqQqy1nNjunE7yKc7UCgE+rD4zYAuz9yA/Hw0E/g2SjS3q3s5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_121154_737601_75C44904 
X-CRM114-Status: GOOD (  21.47  )
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

On Fri, Nov 14, 2025 at 08:13:54PM +0200, Adrian Hunter wrote:
> Allocate a structure for Intel controller information, in preparation
> additional changes that need to store Intel device-specific information.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

I think this patch help less, you can direct squash to next one.

Frank
>
>
> Changes in V2:
>
> 	Re-based
>
>
>  drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> index b962d3c2d510..3f391b0854ae 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> @@ -18,6 +18,7 @@ struct mipi_i3c_hci_pci {
>  	struct pci_dev *pci;
>  	struct platform_device *pdev;
>  	const struct mipi_i3c_hci_pci_info *info;
> +	void *private;
>  };
>
>  struct mipi_i3c_hci_pci_info {
> @@ -34,6 +35,10 @@ static DEFINE_IDA(mipi_i3c_hci_pci_ida);
>  #define INTEL_RESETS_RESET_DONE		BIT(1)
>  #define INTEL_RESETS_TIMEOUT_US		(10 * USEC_PER_MSEC)
>
> +struct intel_host {
> +	void __iomem	*priv;
> +};
> +
>  static void intel_reset(void __iomem *priv)
>  {
>  	u32 reg;
> @@ -55,13 +60,17 @@ static void __iomem *intel_priv(struct pci_dev *pci)
>
>  static int intel_i3c_init(struct mipi_i3c_hci_pci *hci)
>  {
> +	struct intel_host *host = devm_kzalloc(&hci->pci->dev, sizeof(*host), GFP_KERNEL);
>  	void __iomem *priv = intel_priv(hci->pci);
>
> -	if (!priv)
> +	if (!host || !priv)
>  		return -ENOMEM;
>
>  	dma_set_mask_and_coherent(&hci->pci->dev, DMA_BIT_MASK(64));
>
> +	hci->private = host;
> +	host->priv = priv;
> +
>  	intel_reset(priv);
>
>  	return 0;
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
