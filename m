Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA18A606A331
	for <linux-i3c@archiver.kernel.org>; Wed, 11 Nov 2026 19:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FUiq74yT;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=CtTbxQq5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AzETpEFrGG2g8HdOKvv6Wj+wPrMdplPWzfwETpN3NaE=; b=FUiq74yT0dnDRrFBZH7vkuyGHh
	qgHHR8nrNZBs4nChWsgTdoPZdARMsXIW697X0J5UVNah4dn9hHoDi/0MVdsV7PGRMMVA0qPMHbMWm
	5NQ12W5YeW9CNe+W3R5gm8jcxRhYhig/TPky0YvzcgmzWWp+FWp2DPFMwtV+Xw5bzY9aPmWimsIMn
	Gr47M69vV2tQ19nALmpjvDPQg8tLkUJCcq5Rm7AZ/hlb8qUBXMU3WLuMsdBVu/iRAzZpXdXoWKmhG
	QW2ADe4b1pvpffvJHQ39i2CyVpViqXR1vjAmt8UopXBDl3Xx1cAWNx2vGiAZDYOuZQkJ+m7HsghLJ
	Nld/8AyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRE98-00000007XLZ-2uae;
	Wed, 11 Nov 2026 19:38:14 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRE95-00000007XKz-3oPd
	for linux-i3c@lists.infradead.org;
	Wed, 11 Nov 2026 19:38:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MSy0e16TPLBbtUcgGLoc8I2TbxS1o+RaY3wd6Kvvuy6QRPNMsUpBfjXSzxRSX1La0/Zl9i1hc+Y6Jqb50HvDNTcpwwALAzuaGgDwJOsw3+YVdWjo2e2N0nfId1nQnUjy2Q6yEZSQCRCbdcWLyzP+4QBqhUJ6+Em/SBDBXqIkLb0j2EPU/uLXsdr5XP9iSd5o5vle0oowsYk1vMGtki/tc5kk3BjhOrKK+jj4aPxuSRadK2662OhCcWOy0B0nL5/wOOrLOJfT1ptqSbZ7/Lr3ZiPnWM7s05hg9bBxIGzNCYBVQ1y2WazCR4Yk8KNSii76LuDZFirgkvLc45t7DU7ORw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/9XY6Ur1XETOoVyIS37zXAqklRsqHJaMAWXZ+BRmw4Y=;
 b=HdjnaTxRnEPG+HN0M4Eoau1HZpUMlGew1/6FrBkyP5FN/FFUJkS5CjQAr535Q8UyFijUwBS+JCbhVybSPMWEYlnScKzMCDnhG4IjicFa81E/zPJtGNaNDQo8xpr19gio8rQEENnTC69ovERwlOIBbXDyHeWd1oEW69aVbg05ezyKWJLQz8Rd6FvZeDC04vbRak7cJjNX2lJZ4016nKThRFuq+2oG9Xk+O6Q5gZa/o0nuzUgRQ8n2aOyNQQfe/aB6yAZjccldfGTTAg9EHkuu/ZNiZVN3exWvi+PzpR8QdLfbI15zBlR7YYcj80l45I8Fgoqdu6V9OYjtPafw9sPfdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/9XY6Ur1XETOoVyIS37zXAqklRsqHJaMAWXZ+BRmw4Y=;
 b=CtTbxQq5ZcQRWJUlf9FjfH15hIGg5dxDvVzwbLkqxaY5JPI6WQh8ITCyDrg18FaIEn1NxsY+CJEnjnb6/5FhYSSNxg5vLYdTJ95z0A8cU6kNCULalwzp4HwfzJ/Lli0OR4Dw46pgU9allnJXNQ+FcgjIG5iHhecVhKiL4YT9zhhX2O9ViR/1ej18OxisrTWpWW6sJ12SzLy8o0XdOnAdu8mTW/hDybc93fqktUU+MWJMfylYGXBZs5+FHifmN/CaEzmwGosm3hc3XWxfFOAla3uziK20JKakA58zV+K8ldGMC2B0fvOaqT2QJ7BgNbvLKlFC1Z+I+fb6rgn5o+8DzQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DB4PR04MB11279.eurprd04.prod.outlook.com (2603:10a6:10:5e5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 19:38:06 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 19:38:06 +0000
Date: Wed, 11 Nov 2026 14:37:58 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Joshua Crofts <crofts@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH 1/2] i3c: dw: remove redundant
 pm_runtime_dont_use_autosuspend() calls
Message-ID: <avTEFqDZwy7nbaqH@lizhi-Precision-Tower-5810>
References: <20261107-dont-use-autosuspend-i3c-v1-0-80a1546354ce@kernel.org>
 <20261107-dont-use-autosuspend-i3c-v1-1-80a1546354ce@kernel.org>
Content-Disposition: inline
In-Reply-To: <20261107-dont-use-autosuspend-i3c-v1-1-80a1546354ce@kernel.org>
X-ClientProxiedBy: PH8P220CA0049.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:2d9::18) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DB4PR04MB11279:EE_
X-MS-Office365-Filtering-Correlation-Id: 52c37970-363f-4895-2b73-08df402b4f0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|23010399003|18002099003|22082099003|261009221727099003|261009221227099003|261009223327099003|261009223027099003|261009220027099003|56012099006|4143699003|11063799006|261102130727099003|261026121527099003|261022075727099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info: +J+dnn0AGd2DuPftk33FuT20tXcOw9pSTJWrHT2S/uZN3btM3ROGt1pcLTWbVFEp5tTEhb6s1csUa9qfCgxKh3y7elPyULNN9MtTpI2GPFGyVehvB23wkkApFAduiTFEB4yBtdrAHCtvtO0609cXifYlVXVFsqVo6sbiLWuck0id8SDygd6qp6aflUVsWsJEe5pCqRTBmHeXMNDVH3N7KGFZUXQHKg6pKLjot04xYlSNfGCuQgN2lWVX8VbqtgZjvl3BdiSxwXR2434UP7iY2FjIWBzvJvnDZsTYrEP3KzU+Jwve10TMkKNbNQomWJoheTXNxAwUUtYXmflJGDNWMLh/HOcl/gJshrl9ub6maCNtGDAkOb8hlo/FsssaACwy3UvQEke3U7Y677yiCmQDyOiS6smbKfn3d3m+dt23yRMA+VzGd69XEZAK7aalsAkla2cm5r7a483oqoKIyoiH25zvmuLUbyEATPJCIjRWM0NdAGq16+7YV3W0Dw1tlwGPPjUqc0q9wq4aYn4Eu1VsIoQ8t84tvDG6AV/xu3SRpDMPLDHT9bMRQ7TUq5qTxrJeu7FMdfNJbOn1+e2zIFYsK0qMXuxyVdxx+9nnWhyeymuuJQ0OdN+vJmI5C96fx7cbFWlsQ6bjjFBcYHvXbqZk6SvaytXW3H0v+j1NnR+EHbA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(23010399003)(18002099003)(22082099003)(261009221727099003)(261009221227099003)(261009223327099003)(261009223027099003)(261009220027099003)(56012099006)(4143699003)(11063799006)(261102130727099003)(261026121527099003)(261022075727099003)(261021123027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NoKxSoptcWYhb3eDOLCdomj7np3ny97jEykfqO8jtq4cipDmS3wNEozPjVAl?=
 =?us-ascii?Q?4uHuzUf7xCrssDqz/COHUUtbA5/psO1Jv1CP+KAO1WjfD7PZj4HsYWdS4IsG?=
 =?us-ascii?Q?SJpYjLNZ5gc3CzFB3ShRjAmVUtVzuW5z+eFxqHDo5h6X+FZmi9oTMo12j/wY?=
 =?us-ascii?Q?r6sAgor+T6WhJjHMxLgTEIFxSlKzF40qyjIzIifx1WkfNpqsnqqNPNT7bmWB?=
 =?us-ascii?Q?cY0NnoRxhksyharp9xmWAnzc1C9A8ODaZTgkUwQOEiD6nFPBvc9OWJSabyST?=
 =?us-ascii?Q?5TaAuIjwsL0OIvE9bi8harbX0q/kf4EYjbEWmeGnN3qZ+yGpABLQ1+IJbRzg?=
 =?us-ascii?Q?NFpdpjQ0p7JlKZvTNsxdS1pt2G/zXcUKyWwccUR0pkH7JW/khqEQJd3JXyn3?=
 =?us-ascii?Q?fy9mL8cVVjlFuIeNjopb7Ape+qhAAiohBZ1l5sOUfKYvgGZ6Zv7Zj3LmmJTZ?=
 =?us-ascii?Q?P52hdKaND3DgP7IZ0rifE5SN2CJEAIMgY5DCZEXGlj+RnCq9VyMHKRAbyB1U?=
 =?us-ascii?Q?6n2NhpnlwpnMakg1vhycexMbVwsqnwPLXzjObYwmq6Dh4UfD8Fo52ISzvSTg?=
 =?us-ascii?Q?Iop8lVB8lUwExkRBpW1w/er11iX6c4OLDhzWOpXFZMgYIxwwePig+/SwOZcO?=
 =?us-ascii?Q?/L+tkDLBHIJ0z+tToseOl0W9K7u+xmfqJcUJRk6fCBebmf+YVxzwpKTMM7HT?=
 =?us-ascii?Q?/9xOm0ly5/2LFpRnhfY5bmPfuZ9yXX660BB3hw/fx5O59ocBmVcuh42ZxN1E?=
 =?us-ascii?Q?FSahJQb0Z5lQLli9nM0i9S3rukuXArOhd0OyNxWqsj9B/sYWkkyM7VVhWYg7?=
 =?us-ascii?Q?NzXnWZjGCgWywLHf6bGTxZ+MfvOL4xH5TWjOsnOtpSFrtN8XUdj1U5ds8Ux3?=
 =?us-ascii?Q?ST9g5rDWdzSppuEOTTTQI3TNU5iLj2eRolLy8m+VAl1pBfC8pmd+iEmWSUU7?=
 =?us-ascii?Q?CPGXJRZVvbpdVCAxy6xlGhH5owFFY8j43hW/f8cUyEDLwNvlHQdkIg8i1/On?=
 =?us-ascii?Q?veNK22BHElIXvcSEZPiV+SVFuE5KaAEuAk9P0d5epbaFYgV8Wa1gqgu39JJV?=
 =?us-ascii?Q?Y+IIuoeakNlA9VSIb1dQ/BJkoY1znUT0dk2dMpB2Tf6oINJ1DwBbvRW8hwiu?=
 =?us-ascii?Q?LpPKnLe5KMT2o3iqJVghpwTMwm6oX33nmHTjrRVuchBqbbI/jhpJcSs2MPyc?=
 =?us-ascii?Q?UXLWf1GwyZKzaJ2EDZSg9OpbDHc8wtswovO4TglsiGbg7ViTESnQsfASY1El?=
 =?us-ascii?Q?5s9UkSexIFEpfDCCSPxoFvRgbqgO/EBlWEF5RIqCyZ3M1yLKgzU1OnjmAgEv?=
 =?us-ascii?Q?UlN6TxheRGNHaRSmuPhdbH/zDUWltxKtLk1X2LHUJtEvGPrVW2bP8kdLeCFL?=
 =?us-ascii?Q?WVnsRASx9NcR/LBJn+3f+ETJ4dDVNW+wX9zosm6x5VuiLW6dHpkb91DfUWUV?=
 =?us-ascii?Q?kQVhdoISpjzVTwpxfB+2r9ZugSxXRKT56HkbLGXqxiamjLt1fnYMii1v7KBN?=
 =?us-ascii?Q?fIRJrv4v5ZteUtLwstIuiw40jE8IdbeagEZJfMgY/cpQl3iQeE0sPIlEYtn+?=
 =?us-ascii?Q?qe0r4ZWhrWV0UsdYzkglnObsOofUAS3Dd9G9HWA2HOUyTfg2gWAbuanAy2/R?=
 =?us-ascii?Q?8PCOcVnJG211cJo67dyTgtR11MCNbhuEDws8zz2/0VzO4lIji1gCQBqz5pf+?=
 =?us-ascii?Q?NPkr+X6Bms1d2QKh6Qk7QLPif0lXLrEP8klzMFMDzD9bXkeYg+QGsXsd4uWz?=
 =?us-ascii?Q?PokGMnBa3vOHwM002+H2bdV/aKK4CHXCCfRbNigPBHQitw3kz2Ax?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52c37970-363f-4895-2b73-08df402b4f0d
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 19:38:06.6526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RhW6CfAyGajiWMZUqgBxtivLY0VC46Cfflrj6UraC/dME3BNlNhc+HGIudtjzcGn9EDoZFBrIcb0VQtsR6OBOyj/bDez6DOsN5Y977p6OevEl8eoncuOHJ/NuuydAkL5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR04MB11279
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_113812_047165_1EE9D48E 
X-CRM114-Status: GOOD (  12.90  )
X-Spam-Score: 0.0 (/)
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Nov 07, 2026 at 12:06:23PM +0100, Joshua Crofts wrote:
> Since commit d1706f9da9f4 ("PM: runtime: call pm_runtime_dont_use_autosuspend() on reinit()"),
> driver core is now responsible for undoing any
> pm_runtime_use_autosuspend() calls on driver exit.
>
> Remove the redundant function calls.
>
> Signed-off-by: Joshua Crofts <crofts@kernel.org>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/dw-i3c-master.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index d1119f203d1b..f8fed797e0e4 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -1776,7 +1776,6 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
>  		pm_runtime_put_noidle(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
>  	pm_runtime_set_suspended(&pdev->dev);
> -	pm_runtime_dont_use_autosuspend(&pdev->dev);
>
>  	return ret;
>  }
> @@ -1792,7 +1791,6 @@ void dw_i3c_common_remove(struct dw_i3c_master *master)
>
>  	pm_runtime_disable(master->dev);
>  	pm_runtime_set_suspended(master->dev);
> -	pm_runtime_dont_use_autosuspend(master->dev);
>  }
>  EXPORT_SYMBOL_GPL(dw_i3c_common_remove);
>
>
> --
> 2.56.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
