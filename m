Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D73D3C982D2
	for <linux-i3c@archiver.kernel.org>; Thu, 17 Sep 2026 21:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1MjXZuqp6REZ+yD2q3mqP68/cSvCrPFgpKMsLY+sARk=; b=D2hSGzUBKH3aPc
	XsN5Dm1pi0EieQb0dXk94zUIq13fJ/MtYn4y4hhRpA3U20lyBbsFRZ3HuSrrL2cje6UPRVkjz9Ar/
	LyuaCeXbAQ45NWHODlaExd44fIdnufILI+XUagfWFuTXKTwjQ3H8ctm0tPANKAMGi98iCxxS4nzpI
	Gp+o3gF76CrGT7IXV3g7cMSAal0O39xvr5Klg8nwGVWXFpT5RARXG9wefejzwbQs6anzhwthG6F3H
	3nbwMVz4oItMGG4NkZK8ZgXvRNGTB8Lm7VSwtf2oWD7bcBV63H6YC2QZz+NrhVQyexkuriXIO+gak
	ZY2SotWA6GNcWSv4gMtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7JiM-0000000CZ2k-1XPQ;
	Thu, 17 Sep 2026 21:32:18 +0000
Received: from mail-northeuropeazon11012039.outbound.protection.outlook.com ([52.101.66.39] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7JiJ-0000000CZ24-3JYM
	for linux-i3c@lists.infradead.org;
	Thu, 17 Sep 2026 21:32:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cAhwVraoHhiCkAfR5OpDPZ9hkHEWQXiNX4Nrr/Uuvbv3gxry61ETG3eFCDvamnAt2Vuq+Yocqu9DvKoDdYw2FIsiV8VU/W+VP6K+PoeF/1WJIQhMxhDVPMuy6MPI4dbMDifmQhGjnkxaR8RZBggSuYdSmU0oPLUzRppEKv8Z+pVYyhGeuMCiQnirJgSpDKZMjzaS2F7Wcr5j0SYwP5s+o60NIhZD9dkuR1zJRe+MkkF+sgtOu57MU/z/I1WY2/wvd9505yB9Y/8HFPSHyTyH0IodTDFY4mBu/+dvDP4jBa0oJuJNuIk+cbkrvlPyBQDZUsxyRwoIutCw2yY6XjTUrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I0ppo30s1evXiPOcj++nS13zPHiBHCOoL4tvrTtert4=;
 b=bqij9WB+JM9S+YA86EoZYJ2p/Jaby5Za727DENfFiDa1BUtqW4Zre45w4Kff/fZJjWHfOnp+sgvYJQVuIpfTUPJOQLZTP4yuRlUNqUlBHTiF7oi/CgBu5XMN9KUrCUhKxbN5rSoPhk6+10oVkgZH6xABDO6UmD95SJ+/bLyhgur/9O7k87Yj7B5boUXzQbksnS/5F1XGkI7c1Po9kFgnzQf+MbUDhyZojv6JZeKMljJSMZjFebSXgARE8l9kBKVy33NiglaU8i/4C3mgIxQP2k3cc+IlnZsKVHbvZgYRRHzIr2MvDskjdl/m0KIuuwLbaQ40ith8xrrqmpJ8uA55rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I0ppo30s1evXiPOcj++nS13zPHiBHCOoL4tvrTtert4=;
 b=qh5is+btrLlU9eeS1Ihi7PF+oD8GRSYNHz5HsaS1EoKtCgaq7xKkuw7kH6AineRQQZOoOdYK75UIbDEfyHawmqN8Fwg/VRT37GkumY3NTwTf7Db7Y/tbOP/ECV3LncxyZtL03bFCyfTG0dc7OjMEN3Ajp7H8SVOK96wmR2sj7oz+vDEgsVPKAS01N/aU6B030JdRXiN7dkTp628Zb8sqJLbaUu5qiTAEZX7yPYgeHmdVl39VvXqYVusUeFmNboBqL3+FzhnQtm5VpWRkuml8eXlHgdBIqay/Z/nGAdzGA4ld+qKHmlpJCDafDOUBPu068YmaPZs53Cg8sDaj1RGZ3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by CPJPR04MB479668.eurprd04.prod.outlook.com (2603:10a6:380:10::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.11; Thu, 17 Sep
 2026 21:32:10 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.011; Thu, 17 Sep 2026
 21:32:10 +0000
Date: Thu, 17 Sep 2026 17:32:03 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 08/17] i3c: mipi-i3c-hci: Fix runtime PM violation in
 i3c_hci_free_ibi()
Message-ID: <aqxcU6bT5ALm-1-8@lizhi-Precision-Tower-5810>
References: <20260917191356.133242-1-adrian.hunter@intel.com>
 <20260917191356.133242-9-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260917191356.133242-9-adrian.hunter@intel.com>
X-ClientProxiedBy: CY3P220CA0002.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:930:fb::6) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|CPJPR04MB479668:EE_
X-MS-Office365-Filtering-Correlation-Id: 0704b5ea-fcb2-4d01-aa0c-08df1503217b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|23010399003|376014|3023799007|11063799006|4143699003|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: U1YCr7hBjyy89Ug9IxdjimPf5KG5jcpkDw2U1Xne37kz3dkMxKxnjLSnbB/jmaiDgvWjaSWqei52jAiBPsrqQIRDbo4g5krkcMmpH+Pfuvil04BedHMl4OBirMa+59sr8DLOckkeiwsS/l4qaDLHpKNpNZhf+WMli64uxOXtuXBad9Ns6vFurf2b1o71sg9h5zmA0Nz3SKIJdOJVnS5psUkO3tI6cVZrzqlU3pBQ+9/0CQ6+b9UMpdhkBinEgMF4PGUfnaFFP3+bewi4N35t5tAgotvSNZ32B4uscROxjjPHtvXJjnlieFjOSWOhQXLa8p5katuxy0JXUU4QvITia6PoH26zOy1h50w1uN2vcxYHOxpYydb68yM3dTydtyeHSL4x5edGfOkTkW3xRXIRCSffVY5FdjHmBG984QUl6wqOyBIEL2TylcXIIKbSwIS/se4uGPFxtR764InV8eLz+W2cFvIF9HaryI0KVKlivOCUv2Aojv4A7FtleoMFWJB0NOIHe+PNU+zqaptsYEHtsPqqYjV8mU7SebPDsmY0+hIfW5ujxMNClRYvP17hO66RIhjPOgn59lPvgUh0w7rFtQdpIMmzpyMJAbeyoKBQDPXmOqocLwjATUksoDqfkh8NrVvjAAa7/MftdE5TkcYwZ6A3w1CKDYGX56yphg0P3K8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(23010399003)(376014)(3023799007)(11063799006)(4143699003)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BHEPEcBcVFqeR5LQF/9y9hrbUKObT2Pd7PfT6OfOC/kea506Lb7QCNjoMm15?=
 =?us-ascii?Q?aoRGVHsvGJ9CXK5ZLK6RFnjadprjxE5gjGRNr5fJQRQOijDwL2sqVVJc+cnz?=
 =?us-ascii?Q?Uuhf0RKbuxTI9pvIITB6F9DbmSgiLAEYzL7rEi5zfxKYkRjpSHZbuT7W9EOk?=
 =?us-ascii?Q?68BH5bICBU8Q+NJ2ppg5wfRCSlg47q4H0py7OKjBVT4BefJhxR+Hk/nU7xKO?=
 =?us-ascii?Q?rJxSoPvU0uxrpyRpTcN9UA2slH9gHWqFtmuYiqvw2C7WPPam53py24NVxajM?=
 =?us-ascii?Q?QmBMbUs8zM6ZO3KhUka04tTkYvhCEeb7q0VbhheAfNEBrpmF0uopukZbWecl?=
 =?us-ascii?Q?nMqWhYpIkChpKojpv+algeBuUHNc2pmcSfV7ks3gb/YBYPErmPhdGritNI7E?=
 =?us-ascii?Q?B22bgsCJprSdy6h+RsVHehzEalQ/bi0v8mapg971Qi/xTbqa7GtuZnfWNviC?=
 =?us-ascii?Q?K5AMn3l4NU4kW5CcjWAiZsdnlPxHNTFBTPINa7v41u7MvTtg55BxeXHo26UW?=
 =?us-ascii?Q?ngX0zKDXZyY7zM7SySD2F4i8Ok6DaSVhmpELw+CHHKMZJqkTDDxGt37+FvlN?=
 =?us-ascii?Q?p8q7ZIXHCicHfobOH+wqPXga39cdm+wynClKIYPbnOAfxH58AfF34rondg7l?=
 =?us-ascii?Q?DPCSuP/rM6XEqFPbHsNx+UAMgJZbnmxEVeFHIYsLmI+eTO73oCb+WKGuZcD0?=
 =?us-ascii?Q?U6iky7Hhx5NjTnTZthh3HKOe2TqvGtXSPJrOytf6fsQGyo+O4FoxxhKdSGI1?=
 =?us-ascii?Q?5NPcsswC51ED0JvHmXqJ4RMc5x3IgQhNTFVW/nzOlEmP3pbEFtoTippmYSSc?=
 =?us-ascii?Q?Acfc9/FJe13VQQu9Q3j8mw/DU7r2xVj7Z7wArimuCVNnIyzDR4x/tdwWB0zQ?=
 =?us-ascii?Q?Z2o58tCfR6I0gikbHMGbOXvoUQ/TAqYBNR+wqm2UIVwRaMM0CqIoyWoEBWnB?=
 =?us-ascii?Q?jx5xRKEXAc5sk7ulMJcD1HhGYJfzywAasm4XDNZQeE0+wGv1BDX1dUvQp5Ux?=
 =?us-ascii?Q?wgp5FWXTsd17LzPENdErdM+qm76fp4OCFj7Qo61js5HnH6biZur8UTh5Tzvf?=
 =?us-ascii?Q?asucYZ1HtLrGF8AKfe8TJV8i6zK33iLxfxkeTCAwYKYN9HSpnGuwqVG3/aeB?=
 =?us-ascii?Q?zXqXG+afFMfiF1Dd3rrOFXjhF++l7jTPbjiFni9sVwJNFHmeMmisku537jM1?=
 =?us-ascii?Q?ivsgVtRMLHoRuA8zKJd5uBAA8eUhkdWXgyZ78OtMU/67SVUtW42tatpuXl4Y?=
 =?us-ascii?Q?bB942X27mSJx8TmI/IVSY9dps87g5nay3qCpyDl976bEukV7QSarWGl2IMAN?=
 =?us-ascii?Q?BZS05AwHtdvmMOiDrr/GUi+441tNn3aLqzrJ94OvAlXhoNUei2l+85c25M8H?=
 =?us-ascii?Q?ds6Kcpi12uObkxP8DNDxB+iu2hIgz7cc2Ab83ojSGu5YkaC7rkHxNsPUZI4k?=
 =?us-ascii?Q?XtilD6eIV04tTUMJ1Li9RB9GE1VWP9kg3ZKYk/aq+pYfXDxVdnngZPcDdVsE?=
 =?us-ascii?Q?Wn/dI/Bo+DxJVudoaHpB5De5/zQS//GMtvVy3TeV4K49pOeeGcjSx8lHeIMT?=
 =?us-ascii?Q?G8Bieikg24odKJ+MvzIa9xjUsuytdwsoCnCH+FCxUga3HCohVcSYyloJMTfq?=
 =?us-ascii?Q?wzY3L2IZXm+65ARc45jYuAr+cPUr4bLLikLXPUIjFwLoeKYxuh4FqNv7zLQK?=
 =?us-ascii?Q?rvN/wd3/pFkLMrgBKs0UJlfNghYcDdvoc0AT/IKlAvMpQDkbmTB/JR7cb+bq?=
 =?us-ascii?Q?BnvGxSfzUAA3TGzg/aTqaPRFbewxa4qOLiZ5jBfgQsFMvn50obvX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0704b5ea-fcb2-4d01-aa0c-08df1503217b
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 21:32:10.3065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ng293mYcF21Zr14UhZr/Ec6WL6TAVmotpT/r1/nSI8XVLwZPycAuprFB/SLMHu0rd0qhVQZEvZmEwF/y7ntPO+tj+/mv3pjUjdd0Yvau3GgW3dKQPYdObra55dXnVbS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPJPR04MB479668
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_143215_831023_7DD42157 
X-CRM114-Status: GOOD (  22.33  )
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

On Thu, Sep 17, 2026 at 10:13:47PM +0300, Adrian Hunter wrote:
> i3c_hci_free_ibi() calls __i3c_hci_disable_ibi(), but the latter
> requires runtime PM to be resumed.  The ->free_ibi() callback does not
> guarantee that condition.
>
> The cases where ->free_ibi() may be called without a preceding
> ->disable_ibi() do not require re-enabling runtime PM handling:
>
> - runtime resume failed in i3c_dev_free_ibi_locked(), so it skips the
>   IBI disable but still proceeds to call ->free_ibi()
> - the device has been re-enumerated under a new dynamic address in
>   __i3c_master_add_i3c_dev_locked(), which tears down the old device
>   descriptor and deliberately clears olddev->ibi->enabled (to avoid
>   sending a DISEC to the stale old address) before calling
>   i3c_dev_free_ibi_locked().  As a result ->free_ibi() is reached with
>   neither a hardware IBI disable nor runtime PM resumed.
>
> In both cases the important requirement is to prevent further IBI
> processing for the device.  That can be done without accessing hardware
> by removing the device from the ibi_devs[] table.
>
> Replace the call to __i3c_hci_disable_ibi() with clearing the
> corresponding ibi_devs[] entry under the controller lock.
>
> Fixes: 650716f23eac4 ("i3c: mipi-i3c-hci: Fix race in i3c_hci_addr_to_dev()")
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>
> Changes in V2:
>
> 	None
>
>
>  drivers/i3c/master/mipi-i3c-hci/core.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index f6a34ce7a295..b9b20797d045 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -675,11 +675,13 @@ static void __i3c_hci_disable_ibi(struct i3c_hci *hci, struct i3c_dev_desc *dev)
>
>  static void i3c_hci_free_ibi(struct i3c_dev_desc *dev)
>  {
> +	struct i3c_hci_dev_data *dev_data = i3c_dev_get_master_data(dev);
>  	struct i3c_master_controller *m = i3c_dev_get_master(dev);
>  	struct i3c_hci *hci = to_i3c_hci(m);
>
> -	/* Must ensure the IBI has been disabled */
> -	__i3c_hci_disable_ibi(hci, dev);
> +	/* Must ensure IBIs for this device will no longer be processed */
> +	scoped_guard(spinlock_irqsave, &hci->lock)
> +		hci->ibi_devs[dev_data->dat_idx] = NULL;
>  	hci->io->free_ibi(hci, dev);
>  }
>
> --
> 2.53.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
