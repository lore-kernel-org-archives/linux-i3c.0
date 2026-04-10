Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4A09F36B9A
	for <linux-i3c@archiver.kernel.org>; Fri, 10 Apr 2026 02:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rtHvRFJhFQyiNk7Ua57Q3u0zp7PaxRS1W+WZJ687DZw=; b=S0+dS5xngmCF1x
	kGjQgF+UDOuPJP2SX6XlbRDMMl/A3GYULu5j9XGJfxj6+7Sg2sFhUkki58TLZCtdouGhNZs6vqsAJ
	76Mula4DTF11mC6Wb8uWjv3QsrgH6RasBe+ZTxB4hust9K96iY42MZDJg/NLOmX3jg/uHHZGYPQ6S
	NwC4Ymm0G4Qky/mF+ACkhj8IXIGJZHgjHwAKefMrdz4MpW/8uZCuq0gFhTrDkmIsNAEXBxcryOp2M
	55BxQXapSpwxTDTIMMnG7LsrhuXcIKghbZfRdPAo4knCWNjNxdAVnajfsCLtrEviGyyYEoby5esbj
	eiNmdcosJtxPIfYXrOWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB1nE-0000000BUA6-1RWA;
	Fri, 10 Apr 2026 02:40:24 +0000
Received: from mail-westeuropeazon11013060.outbound.protection.outlook.com ([52.101.72.60] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB1nB-0000000BU9k-2xLH
	for linux-i3c@lists.infradead.org;
	Fri, 10 Apr 2026 02:40:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SDRTjJLlXDMFHOiwt023F7QsMEz+qAIQEj608QZXtoE0QJAo+paDQG8YQwPVxDPIAYzyi2VEs43fup5t8HW1RRCd6CxpiJL5Td0Ziz/1nZaCtF6oFDl166p/t/l9pBt3HGl0Yh/HAz4+ZgQ1V3eKKqCp2m8gCKc67OEDWLhO2YFqIdXm68ZqFHvxEhA740FUWWqo/S3V0LSj1En+3Ksg7+HgknzPvqmhVsy3P1Xgd1ALItA2A0NrKwZ8E++FikP/KjiWA5jjyYay/SKMzW4BsGIS0MOAr9RU8FAoHfbrrw9nYlbkUx2PvTVo6PzLtA80jA9HDuHZYyjpK9wiO1kE6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LzBAvPAntKTA3gp7hnShzEmq7zZb9TrZlqzm15UO03I=;
 b=stM4Pcddt8tJgIvLIkFueFJInRdFZ9xQ4kAn3P4xTSFXAT6Q4YCWOScj5sCwezjR1HVn3p/mmNL4UEzEpbGnny8YoLN26eL8ZhizAQn/wgcAJRWIfSWsorMDoRNEuQi4eQCkDnCTWnrXnKQRwWq74c6EbUoK9GvwDA4MxdirrNfp9fjxVTdRzIS7/xr7A98qQyDzEmTby7dEduO3WtdeoSVxLY2DxKOPvdaW9ZQeNKZ19oMU8d9mf2pygmwVJzFORwypGaYBqdbqBYhFCL1I9F2ECZ9bjT19nrNjbtLLlN2mDVeivAI3CbR5tqcgYGltUVc7nDdWCisQL9OqWgo0bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LzBAvPAntKTA3gp7hnShzEmq7zZb9TrZlqzm15UO03I=;
 b=gl73emMFIMliUv9hbr/IMIUQi5KCv+5eDA5nN/urg3zG4BTweeoeCl/vvPYPNPDJ6fIXbvrdMi9boWcnxlM18YXFkKWU11YQxgaHFtP8EV9DNy73CNPY30/+6oGbvzZuqdvQ7ARTZquEgoPZ6um4q5wHpldZFbpbNDjouea+czy5miov874jmzmoN+8oqVf9Vo+ukf8gU1rINnUMvfDqr9f+NxZacEOHjM2vvArfKzwAe/+e+LxnKTW2iEwJQmbWy1D1XcqeFHYBBWQQ1QnMS1yzI+oqfvbtKOaaXxoiwjilDxa/ZNxreKI4Zv8GuSIZg/H3xM3fesCuf4mwrVJPTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM7PR04MB6952.eurprd04.prod.outlook.com (2603:10a6:20b:107::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Fri, 10 Apr
 2026 02:40:17 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9769.018; Fri, 10 Apr 2026
 02:40:16 +0000
Date: Thu, 9 Apr 2026 22:40:07 -0400
From: Frank Li <Frank.li@nxp.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Robert Moore <robert.moore@intel.com>, Len Brown <lenb@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Eric Biggers <ebiggers@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 07/13] i3c: master: match I3C device through DT and
 ACPI
Message-ID: <adhjBwxSZh5ZH2Bn@lizhi-Precision-Tower-5810>
References: <20260409105747.48158-1-akhilrajeev@nvidia.com>
 <20260409105747.48158-8-akhilrajeev@nvidia.com>
Content-Disposition: inline
In-Reply-To: <20260409105747.48158-8-akhilrajeev@nvidia.com>
X-ClientProxiedBy: PH7P220CA0008.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:326::7) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM7PR04MB6952:EE_
X-MS-Office365-Filtering-Correlation-Id: 66f56b88-1857-46e9-38dc-08de96aa7fdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|376014|7416014|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: tl37pBVcyHddKCMffcPZjcmIEXYXKGQYW5PYs8/WuBvHrJ7c844D2ps0UKQQ59Vi2Y/4btIva0rnKLShuBNj1BA9QWHBdiMDE7AYEAkScG+MFcAMfwftbY1Uh9u0z0jXGudbhoyil4dQn67hMI2ylmxXITDhsxJIvbLn8/wMj04YIzOSfBizYqJ9iS0GY/KYKafyYrc27yIGoMGHPlmsbxJ2z65qJUhcktaagX/LgNx+NyV3Z+i48Chr4sXdm6DKFXzQiVGtQK1ZPfdc9S8/B7/DlENh8gieoDpHK16zla0Y2CwAEROsbaP8OWD+yyOldCSproB2TmzOixLoyS+DHsTxRKl/I1IwXUHjC1L7dnKhojTP5WT0Vs1d+jO4lIbOzwNKmNPDKALeciQlE4H4o1Q5Tak6El6Ixpc62d7GQPV8CgU+AcywkkXaJ1TJfgY9GoUHCTRjfadbQJcrzGrUSX2sJwVtWSznED7ZeF04mIl0PHCYig/YizfhkRu3CkEu5ttRsWw51aaV/dJSDOVQLAFE5cn6I1fTsJ4tTZjtHMAeVmY8ZpNENHl85zPFqA1WUvCz1SWGLDIVVtg5R/WB5DYOuKqXWXPOyG9PrcysHfEbd1LDCbTrSEH/HMq+JgiR3tfOqxLZvdpF+Io4rPVB7RDG85q6X6pNyMmT1UEas3xBILMwLJrWpqK5WbvjwdFm2d3/jh+gTm4I8peN9Smm7ctkK0aVRFOTgaHd2jkbzzJSSXge8s5fZ9G6R+JCvAH7pSp8bp1LFjeSSyzEs/6Pp/wGz3+Bio9LoH/yc5np/nU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(376014)(7416014)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LFPkvrGNxqmudJUyJ0pEBiQS1tNqoHSR7E6NLlzu+lAvuvsCYrbrIqQKEMAO?=
 =?us-ascii?Q?oWqnI18v5Yov37zqyFCQ9B3Mf3Wix9bChLvLewDr8/D1HJAesOrYu74MgQGf?=
 =?us-ascii?Q?JIpoYZA0uAofo+T8CfG6EIHy31YP+rqiLyt7sAe/QlsB763IyPD9TS394cfB?=
 =?us-ascii?Q?dIQHx9cWVc6fW5QLXFeNW96KcQsqugWBmywdL9XUSY2XZOjUwsmKLs6eZ0WY?=
 =?us-ascii?Q?jlWfTues1D47fGphij5NjUCZIfo01H8MaNmVkcGceSNmxldahq8TVM93KpBl?=
 =?us-ascii?Q?eL0Wv50H0qMSy1A1l8XsfUcfpUoNwlGeUE5KvnJlvCjrPtZ+r3P0Y6/sUFUP?=
 =?us-ascii?Q?EKGUE+ZMKzf0rFwAUqbiiegwUG7JdfQGFDyQ9XRYGpr5DhdTCu485zSmeWSL?=
 =?us-ascii?Q?DHzHOxZqmq9Q8kNggo3WvLAeZAJLUzXwNy1k0SgT4LqAtDj17h7UBAWcEBJ7?=
 =?us-ascii?Q?0mPvCE/c+mhRpqIuziAMuP+XzgnyhKPnkRgr0PbVVcn1gxfoXfLo7m8iSKAs?=
 =?us-ascii?Q?pjYlC86rozLbv1jUwDF8EdAmfeNTzN0Bgu+UarDwq0R9Z6VZ3i3sjTUzPMmL?=
 =?us-ascii?Q?kLEf87g9PNvbUIxnyfFPmw+oK323J/Tq5tLJx/urlrlhD330sxtQeGsCHUMX?=
 =?us-ascii?Q?D6gAo1Yisdyvc2T3KJoIbiJm7S4dRDdb6bP5MOQ1uT01JElorWwr4bYPqJfA?=
 =?us-ascii?Q?wcNLu5XZJJF3DQzkuWYemYhMYH3ERNmXctwIzt0P64ZT9dQCVY7FQ2RyX2ES?=
 =?us-ascii?Q?ZZQ7PIBfS1f6GmxjWxtKc13zXwLCHheijpL8vA8HKIvD0BYSUVKqmaroz5jS?=
 =?us-ascii?Q?kNA1ykJzk1Sn6RSh20nBgFhrsbiYG0G2cRA07pZwCHyai+joDdJSsSPjmTdo?=
 =?us-ascii?Q?6bqecYTYTZfp1oA7kDfs7MpPIhuVB+MfSj5AS2q++O5dWsPoRmPkOI2gHgDc?=
 =?us-ascii?Q?/vvZP672ViLB5p1AjX6UEhxv/Ptoyl7mDRaXR+bD8NcnHBKgTuePPY0+2c1y?=
 =?us-ascii?Q?qCFEvQZuSnOxg9PmD96GoqFWt+8cP0+foH0JSJIHtKJXyGYEarEPiyvMgOWO?=
 =?us-ascii?Q?D+KI6fCS71Uwt6CDAQyyAfePYqeki/nCvCQMtpFx+BMD5ouenkBUD97cm7hu?=
 =?us-ascii?Q?17eitnOaOB+XL+a03o6cQBH1YlBsR7YpA6Y9uMmmPzP6s4E29F+vVSyFRLDx?=
 =?us-ascii?Q?ALlt1IMyqQRQ8fbAJNmDhe2i8imzf+anwzOimVwn6Wgo8ofVm9RgFr0W4mKq?=
 =?us-ascii?Q?2S9FWPcIjouNDIta4iTm32qcDWc+iCoVcUzlcrQNxInsPza9W2oyGCQ7kXLq?=
 =?us-ascii?Q?31++Y+6/hXzkYTWuXx7JrAoFB06iXoOU9V93t0T8Es7CFWFjj/43U38LMK0v?=
 =?us-ascii?Q?riJZQyEkOARgq1/aCmSfIwrvQ0CrTmbiwgfJbzaASO+ZspVPlvEpf9LqKSAj?=
 =?us-ascii?Q?T7lFEQuiilFaAOXV4VuVb0t8xOVkT2KF2XkBiaFXxiWfh/WydROXhFtINAs4?=
 =?us-ascii?Q?Jty9GdYuzFYGblZClRPfVPNMu7n92VZyRBC75JLX0GhPR13gKE4MQASNP172?=
 =?us-ascii?Q?fGIl5LYmflws04s13b2m0Ep9v/DOISwmzr4cNdDPOE1Sm3HH8tgso/4rbcRW?=
 =?us-ascii?Q?F1hFNzVzRKYuBXuqfcxM5KthGATqqfncvPsYndYL6wpdfuaA2U2zQAEShua/?=
 =?us-ascii?Q?glNc7/F8rjOg2puWmM7H8CZbojUvOeg1dVS4KGC/AKOxQM47OQ8XQFqAPbQ4?=
 =?us-ascii?Q?6QCn1hYlhQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66f56b88-1857-46e9-38dc-08de96aa7fdf
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 02:40:16.9512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lLmL3SAwW4t/08yp5UaOZLbRkpRszxvtg9dNBn62gnUOIGRw08aMhrt9kRnYH6pJPgF9poA5O0IG4vE7HPrfWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6952
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_194021_746889_6AA884C1 
X-CRM114-Status: GOOD (  19.95  )
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

On Thu, Apr 09, 2026 at 04:27:37PM +0530, Akhil R wrote:
> SETAASA based devices cannot always be identified by PID or DCR; the
> standard I3C id_table matching may not be applicable. Allow such devices
> to be matched through Device Tree or ACPI
>
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  drivers/i3c/master.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 324a0440724e..f9f682a881be 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -16,6 +16,7 @@
>  #include <linux/kernel.h>
>  #include <linux/list.h>
>  #include <linux/of.h>
> +#include <linux/of_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/property.h>
>  #include <linux/slab.h>
> @@ -342,15 +343,32 @@ static int i3c_device_match(struct device *dev, const struct device_driver *drv)
>  {
>  	struct i3c_device *i3cdev;
>  	const struct i3c_driver *i3cdrv;
> +	u8 static_addr_method = 0;
>
>  	if (dev->type != &i3c_device_type)
>  		return 0;
>
>  	i3cdev = dev_to_i3cdev(dev);
>  	i3cdrv = drv_to_i3cdrv(drv);
> -	if (i3c_device_match_id(i3cdev, i3cdrv->id_table))
> +
> +	if (i3cdev->desc && i3cdev->desc->boardinfo)
> +		static_addr_method = i3cdev->desc->boardinfo->static_addr_method;
> +
> +	/*
> +	 * SETAASA based device need not always have a matching ID since
> +	 * it is not mandatory for such devices to implement deviceinfo
> +	 * CCC commands. Allow them to register through DT or ACPI.
> +	 */
> +	if (i3cdrv->id_table && i3c_device_match_id(i3cdev, i3cdrv->id_table))
>  		return 1;
>
> +	if (static_addr_method & I3C_ADDR_METHOD_SETAASA) {
> +		if (of_driver_match_device(dev, drv))
> +			return 1;
> +		if (acpi_driver_match_device(dev, drv))
> +			return 1;
> +	}
> +
>  	return 0;
>  }
>
> --
> 2.50.1
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
