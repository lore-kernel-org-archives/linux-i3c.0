Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1356CD3428
	for <linux-i3c@archiver.kernel.org>; Wed, 12 Nov 2025 16:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N1AUoU60Ux3g5twsZBzqHgbAgvWersGgtW0hrFWvp4s=; b=iw2T8SOT7iUyPK
	lPavTyuuFoGEeR36u4iYCAPSL+Ucizl1uqTuR98RrRNJ+31Be7/I4+2g73exhQ08h85tRwXs94pcO
	7glTVHEqCF6PUG2WkM/uKCu9brfMVeSr7+rFTSENjNuIdD/E24p+q3M7Rl4F4FGMToJWAULvXPI91
	l8s6xP9VGFtMi03lND6F9qS8dMC99mzaL+HKVqTAESgvtcWEDdDwOHIbpu/ReACA6JqqKEsUqPuBX
	WvvhCn1OLIxHb4bpgUqcjThqvP1kFRpIdKbf5jroVHTxfR2gkqKPowMfX0znIyyz01TZ2h2170JEf
	lRQAwV1NzfA7EiJmoD0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJDuw-00000009CN0-35xZ;
	Wed, 12 Nov 2025 16:41:58 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJDut-00000009CMN-2h56
	for linux-i3c@lists.infradead.org;
	Wed, 12 Nov 2025 16:41:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lE2aCTcCHHuB7khsskhv/9HIt6J9WASFFuC6PJWcAdqASwV2XaYQm+iBmN2HvVrL5qhKlx5YzSAISGYWB5W34gvg11VkuDKJmNGC/tEt1jjWUec/DMlB8vjJL2BDYWa+bPU3DbHa6Yh4H8RrQJ+Ddyxy/GeF5/uNPEhjhY7BKS9PuL9oHmLBm/qGvLfApQ48Gomhcj5SGSG03yPahw9T9oJnUPXRjTgkxaNLqvC+ak2wXBMl5DVuZkEyaMSOJ8FEFoRsDRI6JCKEBvlJFCf8q6h+fMDHN0RVQdeFTAwYrXMAmYBljVaHnnitwU13rDET/6rhmWI6/+ynajuaXnARrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1iMkRZw1RW6Y3SbHNPo6uLS3SoB9Rc5GrKr7vkN2STc=;
 b=wx9vI1BLe3MSry4JFU0a6FbL6+WyoJStxbF9IRgGtjjbIjU34qVW+hmqSf7/zkTL9BzfpsFi5O0e0ZVNAVn+j76zG1uXBAP0AA41nHQRc4wk7hw5Ybvug5pBdrzv1/TT+okjaC9SWIM7mC5YHDhCCfbQR27qU9oxqrltzkT3U3I4LYDdyOYoxX6J8r8fMXg0F+roBQRE79n9BK5EyxXTyPl7syayZFeMKHaDbD+WScrFYjUT86Lc9FxyBy+Ju1ILOzBDVkkQi311FXxzaVTH9EPgC1KKYa+7FMkZhOVtCWwN5aUGYcV72RBimW9CCq3k16aI3B/00ETZG+l7PxUm3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1iMkRZw1RW6Y3SbHNPo6uLS3SoB9Rc5GrKr7vkN2STc=;
 b=BWXFTglo3ZMtkvJaJbXH4Nfut9QSqareTkwqXN+dN9fEIyQThfcGbfOBU0M3QV2fMejXHhrp9V0O8VBXU7GkUV0HsdnR6GkZd2DGGobnAP44PG2bKyW/KELWwl6VRiv5TgbS6q8hsh5DmriJukoPwF4QEpIw8nC15vzCCxnXrDy6mMuMQb0XUbsOQtk+bRVLLMK32YW5eFJBDUmlPUAnaf+HXtpmA6sYxnn1mEUkBy6ZhVf0RyWKkArwNG5Dda1/BDojT+Kj/s5VjD6Q0zEgoYSoQ2pohAmejDkoMiu/v1VwwLS8bw+sARdRCmVNtaOIwMTbQbyH6SMNOUZzXdhtDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by GVXPR04MB9951.eurprd04.prod.outlook.com (2603:10a6:150:118::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 16:41:51 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 16:41:50 +0000
Date: Wed, 12 Nov 2025 11:41:44 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH 08/13] i3c: mipi-i3c-hci-pci: Allocate a structure for
 mipi_i3c_hci_pci device information
Message-ID: <aRS4yBCoVJfecs4t@lizhi-Precision-Tower-5810>
References: <20251112100339.51726-1-adrian.hunter@intel.com>
 <20251112100339.51726-9-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20251112100339.51726-9-adrian.hunter@intel.com>
X-ClientProxiedBy: PH7PR13CA0010.namprd13.prod.outlook.com
 (2603:10b6:510:174::20) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|GVXPR04MB9951:EE_
X-MS-Office365-Filtering-Correlation-Id: 85fccd89-22cf-4556-e75b-08de220a60b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|1800799024|366016|19092799006|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RnXC3FEA38A07mlQoMHv6XKQ+i11fQ5+oDX7gBCKKa+Fmz/InuMOWEzCckCY?=
 =?us-ascii?Q?TLhWAYtoUYZzFTq0J4GP688Zjx4zIozFvBA5Sm0W/IZBqhJ9ZRfQ9mHmCp1N?=
 =?us-ascii?Q?Y77NnjUa1zuNJu40OrKUII0nx/H7Lz6IDHmHGeHZIz4HhCUjYXab+NdVLsds?=
 =?us-ascii?Q?WdkAM3BosP5y88rn2Q3gpkFoKsFRG/bAqWkyMotECLnOC5YEEmW9UV2ZxqpS?=
 =?us-ascii?Q?ppsvApTGABZJtj7ezLaZzbfIQCN46VoZwiD5sZVoBHoS/jw0EH08NID6+NMo?=
 =?us-ascii?Q?xrvwsPQ4qb+pl/f1UhhfVqar8A2zbvZzyFO8iwcXwnzn8V8+6ZeSyV4RmkML?=
 =?us-ascii?Q?H4uIFxIaFhol6xBWdjyWuJtDel8YvKtnsuLhMVYh/UtyPxPgfMk0fxY8tlkw?=
 =?us-ascii?Q?YfvTybMFzekE0kIwYwlSKqHSv5NRz0iEaUyF/fRF4YA2VAvDLfterReIATHa?=
 =?us-ascii?Q?8gbP5h9bNedZtvgK7CWeuJ1DC1XPew2rsSVSewuY421qVf0zJqA+1H7dfLME?=
 =?us-ascii?Q?MY2GUSXf4sQrlsweY7GrqYlqnEkUx7q4cADD5E4ulU79XjUW4KmscfFtlprV?=
 =?us-ascii?Q?08KUw5giPX+7I6SegNcHBdxK8xHjD0eGiVTbeZLizlfWjsiayulLvmFR+7aM?=
 =?us-ascii?Q?JsWygPM+uTr06ixVm+oWsgrfoZbDf7F4jq6qd/Ep1aYG7JtD3F6oKst8Rx5V?=
 =?us-ascii?Q?scqNSBffdYqAg8kfuZiJI7QpFaR8PTWOinMYQsNx/6486NWh6+I9NB8dmO6T?=
 =?us-ascii?Q?PDbsaKXYoPvkHLum/rVKbGk1AZ1HHx2y7Kf7E9rD9AqCY1DLg83kXAzI2tXB?=
 =?us-ascii?Q?Nz5XPMpJGdpQTgxi6G9EukjgJ03UmOAzdWL8LLNM1R2+O5XTz0bYw2ySe4Ko?=
 =?us-ascii?Q?bDEXmZMu3NmwUnyqKwgrBtFyxzhfbkwrJU89vQ+6L5KmuOKLvnit602iBt32?=
 =?us-ascii?Q?wbktNmAa9C90FVQtTRc2AeGiYfnHuCe1nNe0iRJo2vy2hAtdSESQzqO0LOdO?=
 =?us-ascii?Q?wRzcWnTjhPIZx2O7xgAKX8GphFP/AOckOpTp/H1wncVQSDRM8uYw1Hl/Zn8D?=
 =?us-ascii?Q?QUDkBmSUKfsS01IgOzMYddpZvGLEnA660aHidM44ovr5sJeI+1otvz3gaUzC?=
 =?us-ascii?Q?YFbstQ4IdHwHvQPsfuIcKucmZ4u4rCYyfZMa7qIeQQ+2RzQalT6Q/PS9NKDw?=
 =?us-ascii?Q?bdzLIpLb2ZLyDAqOnnjkCkOCi7BDif3xeSsmla8Vcj91Dq24AqOc+fTtfIlV?=
 =?us-ascii?Q?TbqeMJx3h61lAJqrCShfSzHNeNsk/d0UwzmQpTnX3ykVT7RXoZndN8Y5ia41?=
 =?us-ascii?Q?gk9kvJ14NdR4dR9xxwwZMzNfK9s9Myf2tKx/ZmxiFXKCDQ/oCoYMYAgeHZ3T?=
 =?us-ascii?Q?hKIfrhvcQU4qC7SYx+AZZr5aiLRIl9foRsYxKlqdH0S1Re8qKgYer+4wA509?=
 =?us-ascii?Q?2BUaisQokqQ4dXV1Yma8dgLByvxZH/TPYzUR9T551qsD19w73ug7QZzaC8ma?=
 =?us-ascii?Q?H8xMZADutKWtaQBCokUCWYjjiaZIoQ5M9Wi4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(19092799006)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OvhmbW2hamcc4TseZUzZwZtrhcAEwniIi3emSNfzA2O0rDVKacl+k3NotA28?=
 =?us-ascii?Q?UxW3hyDDFtWyIvthh9RhoB6Lr7MzfLD5RAJeWILXi9WgdR7W0PG8Q+0S0/MZ?=
 =?us-ascii?Q?/MSI6cekGBjgcAOhuFD9T9dBTegYNu+PfINp+9B3h7IBHJbJf8GdkhZhpMp+?=
 =?us-ascii?Q?G5Ig01awC3qhovJawS4tRO0wNqWQ/oEAY6ls7+kG5ChdLr2vlYrXYkICT3Go?=
 =?us-ascii?Q?r1nJv0sGKpwH8gsE/OMo/47lS9hMZLt4Od5G4B6im73QkIeD4bJQtsOxRr+X?=
 =?us-ascii?Q?2FXCk2/xhQDmEzyj2QIAR4Q3RfKNRwMyGCYWje3qE3OVjHO4WcjT6nGabwyb?=
 =?us-ascii?Q?pip1Dw4uQMOnrqQeJ++B7NdycpnjoAkFZ5Fp1gi54T55DcR3olR59nzyxLkx?=
 =?us-ascii?Q?SOGerDOpT4ZluhWrsADf0zBZL7AUw36ZE5n1OCk+o30+cvSiTBVGRygcGNuh?=
 =?us-ascii?Q?qR9l5pXkgGxTWJk8cMRA1/4pvwaBHh9s2+07uy8yH/O3p3y0XHSrmBtDnIL8?=
 =?us-ascii?Q?dRHKiq9u0mLhVEh3ACm/Bn1cmSPOehEw4g9u+5dkL35axPO+zPsyRSzb+mzR?=
 =?us-ascii?Q?ibk3wMms2iMj48Yc8z29nAaBiWQvDuFis5SteAASV8wR1kn8akKWEip/Ie9M?=
 =?us-ascii?Q?zZKzH3Zn1V/37G4oA4GUyf33sUudP6rKTMRKnNkEq8T5mk+u9+IgOQQb5LWQ?=
 =?us-ascii?Q?t25oBMRwSi6zILi4b6YRaTWYUibq1lRFj7eU6dqMDY43qXX7MPKhfanHFYR0?=
 =?us-ascii?Q?2oi5P+oASKuv/bLAOMr4str82r+8IekOxP8ChmjCmvd/2VvHbsJ9+g/YhVYE?=
 =?us-ascii?Q?yEOLuZYykQBl+YpkIpNWZwZYA+MLq1AHj9HflFzCaPVQUes1ZOkQZ9/1siuZ?=
 =?us-ascii?Q?CrVK196Y42nKfIetygvxLzn+wpIfb4K1qLp3I67VR5dFlwusqwrILR8IcN2C?=
 =?us-ascii?Q?HP8o/8/WkGeDEan5w+9AKqreVQWOXu4GnuyHRC4JuILNF9h5F6RbjPQZJhDt?=
 =?us-ascii?Q?cY0GywKfg+zy9ZXDbsbRtlTGuQ1HOr0Ctt/GfAUc396tCXT8yotWCmt9arp+?=
 =?us-ascii?Q?Bj5gmnmM7coL7+BOy+kDklgWykJiPEkR4yX9NjtDHpgJVylswIUXthZ4tloA?=
 =?us-ascii?Q?fgpzaGGnRiUqxzW3YASuFL9kDuSXYbbUvBvI70aUvmkwCmsC+EUu0e+KDnef?=
 =?us-ascii?Q?3ma3gweLaDGkeyOuzLp3w1oSl7+0r7n8PIt6jjetHzYOh+m+q8vo4WetUJ4Y?=
 =?us-ascii?Q?YuBvLK133byNlBK71A+mRQJotPYpuiOvLNp4PnF0XsYyLIIe+UxxiS6MVd2/?=
 =?us-ascii?Q?jlFYifCCF0T3Elu9fbMDhkthP1I9Xqly5+4S3RaBlTU65GDsO7Dde72DvcPc?=
 =?us-ascii?Q?LJt2Smk6lb2lJsn934nxJE8rx8fsiAI+PT01onug26JLgS9V5c7TB8fJenSB?=
 =?us-ascii?Q?6Sv1DHxKX4EXnVvUNsQCo/YiM1dJ18Jm51ihFy+LjpL88MwThVFnkSPYs0JK?=
 =?us-ascii?Q?dFTkg/otM605C1KSz1hzApZajy7bp8O3rWPu/DJUHidyXVkBHRBvU19YRrd0?=
 =?us-ascii?Q?NApdWxCpGtdUuoGtxq5960R7eBPdDKbR1qTvNozv?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85fccd89-22cf-4556-e75b-08de220a60b7
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 16:41:50.8042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OoXvxOuLvpD7xcAJoElj0lAbInxGzaUkdy5wgR4tvVIHFeDbQroV51zdG10DNSAM1ckV9zWVitd1ssnVBWKfpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9951
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_084155_730179_E2053E92 
X-CRM114-Status: GOOD (  21.17  )
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

On Wed, Nov 12, 2025 at 12:03:34PM +0200, Adrian Hunter wrote:
> Allocate a structure for mipi_i3c_hci_pci device information, in
> preparation for additional changes that need to store mipi_i3c_hci_pci
> device-specific information.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
>  .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    | 29 ++++++++++++-------
>  1 file changed, 19 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> index b3b6b6f43af2..9fa89af7479f 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> @@ -14,6 +14,10 @@
>  #include <linux/pci.h>
>  #include <linux/platform_device.h>
>
> +struct mipi_i3c_hci_pci {
> +	struct platform_device *pdev;
> +};
> +

Is it simpler by using platform_device_register_data(), pass down platform
related information by void *data?

Frank
>  struct mipi_i3c_hci_pci_info {
>  	int (*init)(struct pci_dev *pci);
>  };
> @@ -71,10 +75,14 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>  				  const struct pci_device_id *id)
>  {
>  	const struct mipi_i3c_hci_pci_info *info;
> -	struct platform_device *pdev;
> +	struct mipi_i3c_hci_pci *hci;
>  	struct resource res[2];
>  	int dev_id, ret;
>
> +	hci = devm_kzalloc(&pci->dev, sizeof(*hci), GFP_KERNEL);
> +	if (!hci)
> +		return -ENOMEM;
> +
>  	ret = pcim_enable_device(pci);
>  	if (ret)
>  		return ret;
> @@ -95,14 +103,14 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>  	if (dev_id < 0)
>  		return dev_id;
>
> -	pdev = platform_device_alloc("mipi-i3c-hci", dev_id);
> -	if (!pdev)
> +	hci->pdev = platform_device_alloc("mipi-i3c-hci", dev_id);
> +	if (!hci->pdev)
>  		return -ENOMEM;
>
> -	pdev->dev.parent = &pci->dev;
> -	device_set_node(&pdev->dev, dev_fwnode(&pci->dev));
> +	hci->pdev->dev.parent = &pci->dev;
> +	device_set_node(&hci->pdev->dev, dev_fwnode(&pci->dev));
>
> -	ret = platform_device_add_resources(pdev, res, ARRAY_SIZE(res));
> +	ret = platform_device_add_resources(hci->pdev, res, ARRAY_SIZE(res));
>  	if (ret)
>  		goto err;
>
> @@ -113,23 +121,24 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>  			goto err;
>  	}
>
> -	ret = platform_device_add(pdev);
> +	ret = platform_device_add(hci->pdev);
>  	if (ret)
>  		goto err;
>
> -	pci_set_drvdata(pci, pdev);
> +	pci_set_drvdata(pci, hci);
>
>  	return 0;
>
>  err:
> -	platform_device_put(pdev);
> +	platform_device_put(hci->pdev);
>  	ida_free(&mipi_i3c_hci_pci_ida, dev_id);
>  	return ret;
>  }
>
>  static void mipi_i3c_hci_pci_remove(struct pci_dev *pci)
>  {
> -	struct platform_device *pdev = pci_get_drvdata(pci);
> +	struct mipi_i3c_hci_pci *hci = pci_get_drvdata(pci);
> +	struct platform_device *pdev = hci->pdev;
>  	int dev_id = pdev->id;
>
>  	platform_device_unregister(pdev);
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
