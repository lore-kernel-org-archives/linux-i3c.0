Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC12C531D0
	for <linux-i3c@archiver.kernel.org>; Thu, 23 Jul 2026 18:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4NDiAGy+ATCL3okSipCIWEG+HYXdrFH5A9jE5fen53k=; b=2IO342KI1shmQ9
	d2K/wrSA45CHn5x2xF3aTcGdlR9nB03U1RrfHTR3Dpt6sty7rGiMj3OhSATAAqnHgPK74TMPC+SWa
	b7XIaVGH/3KZoldTrqKkE7XHhT8I2rz0YAwxS5kzERBZON9RqXnoC7fIzYOL/JiLHzt/2nV3/77uT
	h+e6HGKjc94Z8zeORXdD9J+FYzU0ecn9yo7JHlyRg7ABSU7Z3D7FyH2ZEf1eABQpdidrEjECSCizy
	CaM03pHthwlxx0KPZUyqlwUo2DU44RPk1E6QD7lpCjqysjdwvxe5phSxmcsCtf18hfm/Wlpe7BDJh
	uIx+KM00V7hHuoDr/Irw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmy7V-0000000EsyE-2ksj;
	Thu, 23 Jul 2026 18:26:09 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmy7T-0000000Esxq-2K7h
	for linux-i3c@lists.infradead.org;
	Thu, 23 Jul 2026 18:26:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iG8X45WA/qNMN5J/5pbkSpUzcdoTuJ7EX8yDlnyNo6xKennpsIDWNDPZkUl8b/8e5RsyMaJy7h+rWidfwEBmn31KjcPieaEa/ydOJYg6QrSy+5n0M2YQI9WdCof7L5vJw+BcrwTIrCj1k0nd1fyniND68e8ZxGWSEa/tCf6RnvnKpDMjyLkEgbzZ+iO8cWJTRBfQ1aSvOmPIo0vMCBEB3UMGNU5jOp1uHtsmGCiB6gbFxyBJvE8nyku13hLuo68I8QFCgcrQwVgJCHh7bB0lKlhquWEvAjQl3vh6mzj4SRwBnU16SodsL0YA8chbE29BZOkMHrSAKrskvijQJl9nyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yV3njo92DVDpv5AK5dy9f6QwO2F/Y8Hx63DQ9HrNfZI=;
 b=uLaSyMy9OhGZbAyFgyA31xaW5KOsZgrfbBRxdfjlDQAXoov7TdFZxjDXtrVr29CEX5JrFPpYggP3mD7RY8V6aCQ5OLqwOrdmnAiiz+NcRWyXUl/7+QavceY2MrWWgexlAwL8/REHRlLBsFelAbca9rWm0FjKO24wHe/+dtHjI4B/Wlq+ZBSjmeNfN0RaUha/v9WwJA9Hf9hSuP+oLuxeB8n7hheRZlTKZhbnH7UKn7DbFXjbJKgRyldwDryxeGdXswRlKX6ccgxXrz3KYiy1Zjeljkp2h75cBgj9Mnljam+wxTtE+lYQvX0GV0ojX5yWtgksPiMCXYBHVBWm8VtiJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yV3njo92DVDpv5AK5dy9f6QwO2F/Y8Hx63DQ9HrNfZI=;
 b=VYlupkenSB1SHb0/cRmwpYVHd5WzHJF56z2yCzOV9Vqxe7gKRozfNPWZBrxpc5RZ4S2tuEcjubOYUqcTvdlGEy3e1Eot9lLQ0ukFDgfHTMeLHRJGUEscINADK8Pk1CjwElVJqFkmhpCIpLKm9Vzco4N2mmKRQ+7K5SxtKgopph8jqgg49D9kjdL8b1OrlKnYXi+l3V0svItl2Aoi2/RZwn84cZf3P65+5ikPHXL5eXcXWph/i0/o5v7OmAXdTIhUUwTxGmx0KcLOp/IyVeIdDPDl+LNLVnYHCtXNAzv21Ah4gU7//k3b+Iy9j9vazhnNRkOvWTEP1zIEuctq27Wyig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS1PR04MB9333.eurprd04.prod.outlook.com (2603:10a6:20b:4df::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 18:26:02 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.010; Thu, 23 Jul 2026
 18:26:02 +0000
Date: Thu, 23 Jul 2026 14:25:56 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: master: Fix info leak and UAF in device unregister
 path
Message-ID: <amJctAYeAwPdnyeb@lizhi-Precision-Tower-5810>
References: <20260723075747.34049-1-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260723075747.34049-1-adrian.hunter@intel.com>
X-ClientProxiedBy: PH5P222CA0003.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:34b::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS1PR04MB9333:EE_
X-MS-Office365-Filtering-Correlation-Id: efaa3e24-95c9-4315-e2d1-08dee8e7da08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|19092799006|366016|376014|1800799024|6133799003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: iKgG1tjLPlRTXj7GXTvkwt1m6kXaynVN9VJ5+HQRvYJimWrvbrHRCzgz55jqD+Wa/VEh9hYygCsXELPD2RKTzHWiSC9ZaOYgrCw11nYr3vBcUgrSIJnFIMSHj7LrY1Ogd3SNZ174htmp2lW0KrABeCFZu9F9EXxZM5BOhJrWHzLpCCPfSKVogTkGuNhx3RisPIyaqm6Ly4GPmfi5TSs1gb8eMWiL2Kng6ijJ7M/7ZQOeyPYZnEB6U3KyEnNFZIABR5r+2I7o8y5SSMaIpfLaLcWBsplnuJSq/M8OjqjooZgKs9n9ep1Wn/5EPMTybP5JgMNtDFpIhPAyryfxwkHPG2yIcBhp09z4TwMuACziY9S2YS5axJmLS7W9143Ww/8KS51DyRiJIQyT2ny674ngdNJ7MqdteT5q7+NhHevpq1BwFPcDI+TfDgRw0S1JutzImCPP7ynRdi/uKWWxaN61QIONT206i+9F//ErsRa4rMkwwlE8KPA2fwto9HW3PnitGfz1qehWqcaNkbIWhBbB41pefsjGAOQ5YwssMy3xOn3u6lUEnVPAtsSNF1BpSciqPWSrlmjLwVU8NehLIsYJdOGUoYLd70ucn+20TsE1Nv4C5ULXVaHiHhf7x1bV7QDanLQ71LDN/t1YyhvGyOKNhXD4x8bRRyPy3+36+jvs7BY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(376014)(1800799024)(6133799003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m1TzNH11TrMw8Kz6sMXzcNMepFiM3ROiP3qke7sR8IwJfxsPBF1OqRM0ddv/?=
 =?us-ascii?Q?WiQhZHNiblwPrVXnDlEZ8zXZ7GWp+hssyPygbaBbM0w9NWri/03h8qeVjHMm?=
 =?us-ascii?Q?8uOXaliZkKgGSykhvh6LQs3xALJVtR9xvK4cCa1/xIYTrG3YV75eugmoH8f0?=
 =?us-ascii?Q?UJxZIk/2FPSzI5/cPNe6SV7K3BegcYzxpqulTAEY2KwabkY99y66m/oIaBwX?=
 =?us-ascii?Q?gWx2Se1phuNIQa2h+qccAALQk72cRGENxeKvapWGmNdVRFWQCaoXOyft8UEQ?=
 =?us-ascii?Q?4lecZHDAAt+obpJ/l7cU65Id/qHnwbEv8GWhOPoDf3PKDYLifqTN6qFZijLq?=
 =?us-ascii?Q?79TbbxtFhPi190J1ixzqshHScb080uNDd3CpWio2/OpymAOwwi3e4tbV//Ra?=
 =?us-ascii?Q?0iVqyHAakw0QzvM6WGlM529MH0MO9Zj/WDQoCje30GQHVZb0kC3lbKH42Xel?=
 =?us-ascii?Q?2iyhbjYrFCgdkp2JxveTRU/k9w05IYj8qffAp8P6etP7JzEbf5euQ6jegRUn?=
 =?us-ascii?Q?+a4TypM710v+59Akxm7ccghVDrWh2cggDPHlC1j3AAzgkbLIDkjwUrdyu3Lh?=
 =?us-ascii?Q?XfjUsXn6KRCLGmv27zxGQe3hFArya7IIVuDLhtk/SYbEVaayK4cY8a7UYa5J?=
 =?us-ascii?Q?OOThYO8D4nnekqi+dZO6aJI9kQpea9tpm2QUVor9biSo4t9tv6BytQUb4RZF?=
 =?us-ascii?Q?VTu349Zqc72GKb2o21a9hRw1RJOmotRARfzwgv7NJowksgvn90syfnsoZr5C?=
 =?us-ascii?Q?S1KkrUu+dIquQb/1mODTQR974bGe76a0a59DOqxZZUgSy/vzMKJ6XF8aMBIH?=
 =?us-ascii?Q?pbkxmrh+3ctSH1j8USQOYg9ZyBl9RifWSXVLvcrRea3IGFXapPeJrz8Q/TNI?=
 =?us-ascii?Q?2YQUFVyw4AKS5rqnARLQFE2wuSLckE1DdKh0dLtJ2b/eiEOL8mBIyjaXoFQg?=
 =?us-ascii?Q?ZN882Hv/vxCTYEqLilJhxc9I8Wo91WOY6QnbuAXkjyH+El+fb4gJ5H+qFYEB?=
 =?us-ascii?Q?N4lu3zM/2KqiRlOXT7ypod3jsV23LU9DzkcaZzx7xxbLaB4e14IrtRGbIXSm?=
 =?us-ascii?Q?IVS7bJGZjBrzNnrWVktuaCiUTRYHxbszex6jHLuFQqFcHt+ej1yic3lGMkte?=
 =?us-ascii?Q?QjXp4tTprFUgh+B1AOLqDdeVJ7XgJn+PbDFsW1aQxrbYGCtJYbSBKEPf1079?=
 =?us-ascii?Q?FiRTkN419+3MEOWiOREFmsagt9zLt5G5cE/s8mNZbtF1fT1rMgcIiZux4T65?=
 =?us-ascii?Q?5VEo4ASamts39ANXEPN5vZirCEgYpvxh3LGEndEgjkA2BjAqdD57UrOwma2Z?=
 =?us-ascii?Q?htFg0GI/0owNhWYrwaEGebxwwJ4uscgwKLHtsXCBlhoyzq4+GHCu+baO/hDu?=
 =?us-ascii?Q?R2pIFAq5VxHTqmKlj8Fw19/Kkj791BNYFrJ0B0LATgIiBu0o31a//OMJFBkV?=
 =?us-ascii?Q?Z7uBSNaDIDMZrQu31dGtfuNw9Ra8/RnU+fu+dXU2ZKJGc5D/BvRxsXjM9R2Q?=
 =?us-ascii?Q?zaUuEK8/+vCMZWyiLLbF+iKbVaJ/YEsMgAJHnGC8MiuC9a6s2smcOY9xJgSN?=
 =?us-ascii?Q?sxr3HME3zxHvl4cBV1cGcJGZBehmrv2PLPTp77/TnzKvS0I/dCjtcsbq1IZp?=
 =?us-ascii?Q?bD4mY1MaVJL5/7+hyTcD/5cJ3ErwyEUU3w/ZYv9qvOoUb5umvduvbEhthzPw?=
 =?us-ascii?Q?eF6IcxHpd4xt93gc2ziFoXUoh7RMl9r41Om23t7zy73xNNfyJIwII+xC7vEM?=
 =?us-ascii?Q?zD3hy33C4kvUmn9XjLv+Tbh1hAYhxBANams1ojsN4n8la2rHzxHC?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efaa3e24-95c9-4315-e2d1-08dee8e7da08
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 18:26:02.8105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7nDwMHJ2724BoR1m/4ewfcwcTFa4xlvWmUGXhnQ8twq62KAckdHlk8aEiJxXzOswjM4dfarHKWRNVGVYyT03nSMRmTncoAgZKO04keAgsbidCQgldSOfd7xymD9F6HCw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9333
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_112607_630676_C50D526F 
X-CRM114-Status: GOOD (  18.49  )
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

On Thu, Jul 23, 2026 at 10:57:47AM +0300, Adrian Hunter wrote:
> i3c_master_unregister_i3c_devs() clears i3cdev->dev->desc before
> calling device_unregister().  During device_unregister(),
> device_del() emits a KOBJ_REMOVE uevent and unbinds the driver while
> the device descriptor is still expected to be valid.  As a result,
> i3c_device_uevent() and a racing modalias_show() can observe a NULL
> desc and fall back to an uninitialized stack struct i3c_device_info,
> leaking kernel stack contents in the generated modalias.  Driver
> .remove() callbacks may also encounter an unexpected NULL desc during
> unbind.
>
> Keep desc valid until device_unregister() has completed.  Since
> device_unregister() drops the device reference and may free the device,
> take an extra reference with get_device() before unregistering.  Clear
> desc afterwards and release the extra reference with put_device().
> This preserves the release-time invariant that desc must be NULL while
> avoiding both the information leak and a potential use-after-free from
> writing desc after the device has been released.
>
> Reported-by: sashiko-bot@kernel.org
> Link: https://lore.kernel.org/linux-i3c/20260702190003.8BF741F000E9@smtp.kernel.org/
> Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
> Cc: stable@vger.kernel.org
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 659c14c2c192..433dc7531701 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -3083,11 +3083,12 @@ static void i3c_master_unregister_i3c_devs(struct i3c_master_controller *master)
>  		if (!i3cdev->dev)
>  			continue;
>
> -		i3cdev->dev->desc = NULL;
> -		if (device_is_registered(&i3cdev->dev->dev))
> +		if (device_is_registered(&i3cdev->dev->dev)) {
> +			get_device(&i3cdev->dev->dev);
>  			device_unregister(&i3cdev->dev->dev);
> -		else
> -			put_device(&i3cdev->dev->dev);
> +		}
> +		i3cdev->dev->desc = NULL;
> +		put_device(&i3cdev->dev->dev);
>  		i3cdev->dev = NULL;
>  	}
>  }
> --
> 2.53.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
