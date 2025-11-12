Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B17CD1297
	for <linux-i3c@archiver.kernel.org>; Wed, 12 Nov 2025 16:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fEZ7kWOdKkpacCNcCozD0RhpBccqMfHhwTsWPhulUGM=; b=dOULVI2ZCN139l
	mtdHZOLgfCJ+GVTQUnV3WU6hSfdZz5z9/nx3VNpHBjmKKqw0I9HmIkoCTOy5jYH0E7Dvger4MqvXm
	1n3Kf0kTGygAlJEGlkw3lLjJlz6SpGYQfmsm4ukFqDbn1EpH5aq1ZlXxLqaJg7p4WKhBrJW6av1uQ
	Q4qD3xJxCC9gQUs7QN5RtAegS/YRtEkflvbREGfdyHNDw5/Vhdm+q6c/GzKF57S2NuNKJJXkmY4j7
	ryogOd3U3FXY7TQTCVt1NbJyhVwXjPtwoFZZtfz3YM4osbmo+ZSRuDbt2eajizoep2v7nArky4viN
	0MjZtuKC2qiBGIpRFsRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJDIO-0000000996I-3GX5;
	Wed, 12 Nov 2025 16:02:08 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJDIN-0000000995s-0Ell
	for linux-i3c@lists.infradead.org;
	Wed, 12 Nov 2025 16:02:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kovo+Bws4oROpvKcvBO6ON8wc3nWAmtghfon66/620hVt1HiYlJltCg/ZOHMnR6NzY6EJdk6th7MpWS5NhMlVPzhmho6HYNSTqn8ZubuDKtPZa273QzWxG8Rw97yAMMy++r2Mf/+btvP9C02bgfAjzM5UHMSHG70gSdXgq4but9XByXnnRqJjEIigm9iUlpJnfG6jVsCTfPXVz4TnOsORaLB3q0uf1G1+CtkqVVbsJlfELPADfO16foBrv7KPxle7JEBD1Xk3xbFvnjrrhuCNdSPrTvzQ8881lTyUJgr+zmriS1413PfkYVwevw5Zb5/2RzRIQ0fjkzisn4sFqOpRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iSDgTsaCJhSNAIe3PH9EV2GCX5xsaqDRw4ZpMmCoHS0=;
 b=mG4/2shp8nFYrD74oHBhmD00lnqGn7RDZzrVwKowKRpCaqY3l68noRthavVlTHAhaD1YrUv5O7+ot+sfC1rteuhf+elFJAqPXLafZxoDV5PGNnwAPGJMxMCINUPpFji3+llFQwLgqxSu8hg4e5QN43zKgFA//ksP6vKr19HKdNAFVsqYn0iI4PgYgklv1vTydRZBfnELQTr+62eRnOoypCx7l4Vty74+U18OnHn5ZQbTLNo5jmtC4EZXdKHADZ+ahJdSomRXk7e1uGvg3QjbRn7IgbChqzDdxuocMErBGcMYRsM6Gn1C77YS8eg34ClhHqBHgeEySPt3DtoS6K9yQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iSDgTsaCJhSNAIe3PH9EV2GCX5xsaqDRw4ZpMmCoHS0=;
 b=MLNNDDc7NNpoX7gqep5ukkDtWxMwwzShSA/j2tl/hQrXltMTm4vffen5mlyUXjDfKzjMAydweOZzgw2NGveUM0OLA7erPnCMmy4hOsE+5gvXBRqoP+IcN2QHb4fgeLwhc5D8hoTgxifwe1n6Spb9qtecATS80l+bllMUrIH4zHxd49Eei3IyKkdcgIIhm5SbSGbgwQDsz9I94PxifF2anQWs+bAJji/dnu63fhjnET7idMOXvDIpQQOuUw4fXxjKwaGAO2a+G+zchVmJxftCLvam+3jbfS+okH+d3f88rcALQamuS1Uqa5pjD8sbdT1UtPMCFWy4DurWAKQgqRjI6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by GV4PR04MB11452.eurprd04.prod.outlook.com (2603:10a6:150:298::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 16:02:02 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 16:02:02 +0000
Date: Wed, 12 Nov 2025 11:01:56 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH 05/13] i3c: mipi-i3c-hci-pci: Constify driver data
Message-ID: <aRSvdCYXV3y3dcZn@lizhi-Precision-Tower-5810>
References: <20251112100339.51726-1-adrian.hunter@intel.com>
 <20251112100339.51726-6-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20251112100339.51726-6-adrian.hunter@intel.com>
X-ClientProxiedBy: PH7PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:510:339::7) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|GV4PR04MB11452:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bd2baf9-e16e-41e0-a182-08de2204d13e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|52116014|366016|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PYHpHJ+MGXJCp8PyUa5YnnLSAYMft3xXOvf+jVLv7XSsygD2lgyoZYiCpegQ?=
 =?us-ascii?Q?ouMxAqY1q4Tp4abhqI2wv64XVnry7r9SulGmAYMoDmwWney8eDcLRx0pIIGV?=
 =?us-ascii?Q?7yjeDaQbdFwKwJO1Wbw6fnvvNZ9cmSDKrCHQLAgVl9rJFDlG4vp6ihh0D9dV?=
 =?us-ascii?Q?sv9IwJeY1eMwrnCNu9ExsjgxNEixao81zil4gTApV4+9IScQhEhco34UEF7d?=
 =?us-ascii?Q?gT0Mo1IXShu8liW1t2Hx7+mAV2tDqT8QRfOU2UywmzYh99N1AXpfF2/hTa0I?=
 =?us-ascii?Q?zGwKqykTd3x37vrzesqh/f8vRqTaXhr5pdt67tmiXtdh2dtlPaq29Sn7RaEF?=
 =?us-ascii?Q?nOGWsLj6U48RchK9xeGJTepXx4rHT3hNMC2ukIIxiWJVimpJRVkNND2qA+k8?=
 =?us-ascii?Q?BJXWkaun79eDBOtc12Ku9nmf/ZXyS4DrThbbzbDPjcHQAIeiLH7QR/gvM+4n?=
 =?us-ascii?Q?Ek1PmSdCGfBGrldfWVHMExv6tOwySE+sQ0YGoPRasHa7IXvbH4nZC8ijKPfe?=
 =?us-ascii?Q?UtDcFMQftvWkxhrsEmCz5Tp+YDJHk4WPFa4UORDaOwbsuwNADkQeP/hhkV5b?=
 =?us-ascii?Q?bNWpyEqjHs0cMNFa4g3NAY+yBYoczFmVYee1FqHn4JfFT5ORjn0AsAE/e2GZ?=
 =?us-ascii?Q?+Lft/1LciV/cvT0gE4okggesh7KVp4XX1nt3DnhQe7UeoKQdMlF3A0S+opmr?=
 =?us-ascii?Q?7GXdyutBCSLAuedZ9KOgNfY6iGfymBczd2wsU5pt93wd5u2WPCU9XedNKSxn?=
 =?us-ascii?Q?msi2Dw/pP0gFakB2+0t7NkDR6AofTqqjO6CzhF7OZ1vxiMYICQYR9mNrM+YQ?=
 =?us-ascii?Q?iui8zzX3CVz9vGyjk34wAzaE3/oAv+Lk3ZyZwwGlwgc/MWjbM22eus+57XBo?=
 =?us-ascii?Q?U9nuPPA4bELcvGdXpn/tG850bpj+t5PCne3nD9UtkRjGn9R/QzrU86xMwp5u?=
 =?us-ascii?Q?1WoyTiBRJbHdxXx+/OZZ9z3+aR2SKWYpkZwESYICHup9rILg6UFQoYpSQT0f?=
 =?us-ascii?Q?IACcVWv4Yvo+khURveJ7jXXRHkJisGPZal7CrILZasSM0ZfxA3l0UZDUBpOz?=
 =?us-ascii?Q?jJ27JX8HHxDfiup7iebor4xIYiv0da934BqGnovldUTSRl6Q8/ZdTe7nio6K?=
 =?us-ascii?Q?IyAMwh8VwUxM7KT36ejHAtOB0c6LVUL2UOIuuRxP8BmQ7KAYIXrSu8DbsHZ0?=
 =?us-ascii?Q?NgJP1vXSd0PHmhyNn+Hwo1WgOoI4yni4d1czxiY9hLuwxV6LgNiA6SxoED01?=
 =?us-ascii?Q?rqq9Xzxp/mvpvSRveuDq4s1PObMk035IHhmFdaG3PvSw1Liu9+gchi/RwPAj?=
 =?us-ascii?Q?2aLRZ2i5aAphNowj9pYvGDvk7ojXqsX4fE6lcmF3R5eO0zqbWf5sJxKecpse?=
 =?us-ascii?Q?eQsYSk+2UANyiJMnMgNwCL/Wy3bmXqGvRMTGZRykLpRd3yhX3lH2ARrITNf/?=
 =?us-ascii?Q?C/SkOtj9vLmCZKTtlPsnIkIIdeFQxy7rgYVpwgUh+3OTvI6RLWd1TD1b0TDv?=
 =?us-ascii?Q?9Kl1JbLX2MIGwjB2ZX9L0mbLa+zW6PP5yklT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(52116014)(366016)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Syoqbfk8hgUNlfTbU5VQ7flZy/ONz8DlpjR+Q4z7qnY8BzftVOVl02di5SoO?=
 =?us-ascii?Q?BruG07IA2RH0N23VtnCztzb8TQeYsByxVEmX1+CWkWeynYm699i+vsNi0Hs3?=
 =?us-ascii?Q?6C+sjnFUnTR+wG+imV4yal0KeYn+VErO7Sw79YoA39wVsvqktg6CbziIAZL6?=
 =?us-ascii?Q?rbPwYf0Eu8NOeE3CjTpaZXUpk/qUPZlZr1PZoUqvCZPyT0pfRtUOoIwfOCtb?=
 =?us-ascii?Q?1qzLQR2HGqwKln1dKqUxbUqkcAp6fndjQbB0dHEYAo5vLFv5Do5/DbkoW4l9?=
 =?us-ascii?Q?8Ue/5leS4UHX7754Cst2cJQZLMuF0vbgk4npIhKqkQWZEnE/7j77tyqxK+nM?=
 =?us-ascii?Q?KdZ3o7rFQKfXWauJ/3OTRXD8mDx0/VqnocPSGKos+VaapDcjiym+k2IMzenA?=
 =?us-ascii?Q?IVYqVsiwWqKZSSSJ+ESmynxxZNdTjPg39UgjkzU9HazTzReu+lz6QQmp5Fxr?=
 =?us-ascii?Q?US+cmFY6CE4muklzkJ+LqeaHgwJKGisDPheLfnCtaHONYgESH2p1xbuD6IkI?=
 =?us-ascii?Q?/vqNXUu/QkoaHbe0QeCKY4pmjHpQFogjS3+hanHEHkJvsO2P/NJY84b8foQw?=
 =?us-ascii?Q?5P1rXrgkIC+l03WDcqjNOFAt6mV0VM/p0bwf5NTOs5RwFoW7y/uzJvyvl0Qb?=
 =?us-ascii?Q?F3W0thnXTzU7O3kY5M+OKNTOC2Z9cNHz/rUSeWei4g6FcwUrBJQNtVqIBoJW?=
 =?us-ascii?Q?d8nHdpsKEYK4L70SvrwVH9GZYWPJzY9lEScxiDQPlS6QOjxAEmtrQJ27AW8U?=
 =?us-ascii?Q?nOzgXsT6hwU9dAQwr/LhYZYECqOUcrlU09NXF5Acf7F8w4XNL9Zc2fi/WHjq?=
 =?us-ascii?Q?AC8Fy2oxUKasF+GtPtCQnzCROHi5hP39QdHbZEiNtUnDs+3q3r9yhHhQyjmx?=
 =?us-ascii?Q?1ty6ruSNa5D8YLtNLgM7hMffx+peuVfdEaXudn6dvZh+2JgnDYEFVmMX/cHx?=
 =?us-ascii?Q?8G8fUJ3b0TpppxyJtyQj7qAXd3isaHTv/7dyMrVUC5vqjpfb4CmflL7Y84qt?=
 =?us-ascii?Q?FlUYPwFI+WAeoILTzqrtR2XB+NXn5UASTfWzQDUI5JZ3F+m+fXW2Pgg7IL/T?=
 =?us-ascii?Q?1LFO0tr0v3ZX2qKcLDUSw4OO8VgnKyQV7D0qx2kZdjNQ+G2eC7mNArvfnG8j?=
 =?us-ascii?Q?Rtl+qdNWtXcNKGOwDh1UsOEG/4siEmwno9GWQVn2BjeyE9QEAWzTFDNS3aNk?=
 =?us-ascii?Q?KC09KtnTcP76v8zgOpx2XJolh+nEzM2ShRCvYDQigcV4oJRJju79eEj5blQS?=
 =?us-ascii?Q?e2mqoawabyA2Sn4woylsl8p7a7LlW0c2UbvqESJJAYkLhJlLi0VHgdrCWdog?=
 =?us-ascii?Q?U62AcF4F2WJRxrCXrVXaMlSqsod7HRzn5hjfikOhkI/xWWbCevQJHp4SLQFS?=
 =?us-ascii?Q?EuSsqm/nRTuaahT2x05qv+VgXsrLUdPQYcjVZfpcXRyMmp7QuyQPXdhf+1Sf?=
 =?us-ascii?Q?SBe0DAZONHtZiJje8K0pfaUql1IATxWkGx1Zp0PIxE/8VKKX0LNz7f+q2UKw?=
 =?us-ascii?Q?YrO2CzCHQmVqKdGrWzavCq9P/s5XdF0OlIjRodwBy3rbn3MgN4fx7eeIy3Al?=
 =?us-ascii?Q?7pFUeuTaFI/JMhomQeMJe1SCw2ETJW+xQpmUmsIO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bd2baf9-e16e-41e0-a182-08de2204d13e
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 16:02:01.9973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f0rnLo/JeT2AWsPjH0AfEviyQygGFnFZJEaWyVu6kJBx+HQR6Soqa/fwUHfSQnR2Rjjt8O3P5ji30qkvZbbT+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11452
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_080207_123475_9207933E 
X-CRM114-Status: GOOD (  18.02  )
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

On Wed, Nov 12, 2025 at 12:03:31PM +0200, Adrian Hunter wrote:
> Add const qualifier to driver data because it is constant.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> index c15e0556a691..59c592446b5c 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> @@ -53,14 +53,14 @@ static int intel_init(struct pci_dev *pci)
>  	return 0;
>  }
>
> -static struct mipi_i3c_hci_pci_info intel_info = {
> +static const struct mipi_i3c_hci_pci_info intel_info = {
>  	.init = intel_init,
>  };
>
>  static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>  				  const struct pci_device_id *id)
>  {
> -	struct mipi_i3c_hci_pci_info *info;
> +	const struct mipi_i3c_hci_pci_info *info;
>  	struct platform_device *pdev;
>  	struct resource res[2];
>  	int dev_id, ret;
> @@ -96,7 +96,7 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>  	if (ret)
>  		goto err;
>
> -	info = (struct mipi_i3c_hci_pci_info *)id->driver_data;
> +	info = (const struct mipi_i3c_hci_pci_info *)id->driver_data;
>  	if (info && info->init) {
>  		ret = info->init(pci);
>  		if (ret)
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
