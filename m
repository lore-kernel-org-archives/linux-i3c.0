Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23EC9D7879F
	for <linux-i3c@archiver.kernel.org>; Fri, 19 Dec 2025 16:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hpb2Ws0yr/DhTYXPAaMq/fmY6MqmpEoLMFRtsDNhcqc=; b=03JzfIRzWK+DZE
	OzAsSUaDtmYxvPJZC3qWXEgTcSDczbpCdB54Bm7VaR5+epG2BOKzieXYERPPcpX7KapE/lDPahGM3
	Raz6B2AHC8nZkBU2X9pDmM3P1B8eo9TYLoRbn1kiLZ2s8dgjbQG+8/ilVUAbXwTQ1aT1LEer1hGoX
	Qlfm6VbHDFE98a6QGtCmKa5Sml+qsUYZfMl7shTemZQjJ9K4m116QdSLaP7fqEXQ408/VpoLh/7AI
	cck9NSx+DoU0tJNcrGFBoAOR/xAg8imMB1Wlr5zT00aLTGlERFhzbhz1XhZWPeoJgIGXZN+FJBnHn
	zSqoDKCQxd9qDdlVCATQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWdcc-0000000AfMw-3jxQ;
	Fri, 19 Dec 2025 16:46:30 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWdca-0000000AfMT-1ufe
	for linux-i3c@lists.infradead.org;
	Fri, 19 Dec 2025 16:46:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sp2h375EHV0n2VH+le3pH+w2sCH86w0pkn+pJp2rxvJPrFzPoe4RolB9boRoCkqUvchzr1gq6maYms8aTEqkwWkNs+sOlnsflC1QLs6asiS0WZTbaoBgEiY2GnQd4pFZaLp/bRuyBDh5VWkxivWeIh5L7nmnx6ERyWMtgma52PQeS9ccq49znkq/whAGVidn2JQ39Da70gNHo/QXEfM9hYqiQ6gEOKuJrvgl77oJOUEFwzwvNqRd4zSH2YRwfA/y4NAgCZemEl6Lv/K892jsSr4RNrDjOxXm//GZArHoK2DuiRDZUTAmG6q8sP+skKaPN6sWPQHhkvOVhjDGlppREA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7RomoHuNZw/oiO+Y4cjLiKrfwcWYWErdc1qy2D7DsU8=;
 b=p3iUAs3ONs8wTNs2xcu9hgWH4DrQIaMnw3zbevoMOBSXVBmxTrcLwXPmgAMsTgW+ke8eHGi6AMgSvLubcfWOqEPPJ4G1G1kzznSq75XomNC+P7fwbuGijmTn5Yamc9lY0l9tAtLbliBJAA4AV/WGnaXG3b0655QDmOqYVy2668LGJPSk9PK4QNn+vUMUvxMaA/ETlH0/z6bVYAo9uHvOjtx4QNY5Mwi3rtMqPwzyRMhawg9Mwk/OVAps7lsd87aNF68fqJubJrYYMne88CZnI3iy9ZZoMDW4Rd3P0yCgHBr8nzKX9l76pGH4t585JuL/x020rTocN5jQjlV45ECOgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7RomoHuNZw/oiO+Y4cjLiKrfwcWYWErdc1qy2D7DsU8=;
 b=XcjNDYZfQuzxF9aotyhVj1LY0UbXKq0WXUhCfRWtt1Wt6F2DwUWd6CA5g1mdtseSoIxZiasmmQ0hX/xWzGEOtm9boicJVfiqFbcm8SPxBcWcVCyIxrzp5n+V9TF7dy3agLEwiqr8qBamlcsidcfjlgSe45v3cWos7sWRyygrVQpbuXxHdzhS4GOt9QWwXof7Wj6R7CIVC1EMbLUqsuyGyeROEIJXRLxf0amGxnvOeqxOByiDO9RLa0nj6ZcyAaGUMQWWc++teSHllsz9sBDYE47NF60rxzlNyeSjodt0v9x+leLSSl1IGDmUXuT3kL0v4N2vCUWeDVEqvzl8uwr8PA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AM7PR04MB7063.eurprd04.prod.outlook.com (2603:10a6:20b:11e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Fri, 19 Dec
 2025 16:46:17 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 16:46:17 +0000
Date: Fri, 19 Dec 2025 11:46:10 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>, linux-i3c@lists.infradead.org
Subject: Re: [PATCH 12/17] i3c: mipi-i3c-hci: Refactor PIO register
 initialization
Message-ID: <aUWBUqu3gYt+tdsd@lizhi-Precision-Tower-5810>
References: <20251219144534.84391-1-adrian.hunter@intel.com>
 <20251219144534.84391-13-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20251219144534.84391-13-adrian.hunter@intel.com>
X-ClientProxiedBy: PH8PR02CA0047.namprd02.prod.outlook.com
 (2603:10b6:510:2da::8) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|AM7PR04MB7063:EE_
X-MS-Office365-Filtering-Correlation-Id: 4846e48f-6aed-4bf8-eb26-08de3f1e20c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|52116014|376014|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?x6p2zfN/ALIsZ73v6Hj1uOtsMjO+4B6bNB6y8abhTQH9rhXnACCQ9xvMlgo2?=
 =?us-ascii?Q?j67PvYjpNP8IJaCA0KJ6xrn52Kpas85EKitKCNBuJsH5yFwbXnrQNSUpUsZY?=
 =?us-ascii?Q?wNDP54HpOmX5o7Xg3aq09w+yOl0NitAkHvTwHwcBQltzq9/2dEg0jp5oumx8?=
 =?us-ascii?Q?BhWBKneJDpa/lwWixiMOu7FNsdZrx3NV/s6CT9TVu+UvvMbJytKcYr64ycny?=
 =?us-ascii?Q?STnWMnn9qTvvQG0lXpGNjYJNfaL6sHwSYRJ1r2QM08GjOURCFASXR0slBQen?=
 =?us-ascii?Q?xVjVrnWHexyhyr2LdZ7lx18kKLzE7lM5gu8J5xxJC3p3QBq+JlibPG7RxCq5?=
 =?us-ascii?Q?RDAbKbyY/DtU4LI5jdojVmNrazyDPWJ0kyI+bJP4I0ebhWyMYXbhuM2/Pw8b?=
 =?us-ascii?Q?QPaceJfqGt2R029/n+QiPDenBdjivBlVvumMzwX1YFNKNrZRy+N+mY/bi34R?=
 =?us-ascii?Q?0o8XOF7LSfvRKGs7yu9XALnB80JhsLGfc/9p36KUMJmk8bvLjV/8sZHiT+kU?=
 =?us-ascii?Q?04P/1esVP+wToRUnKNRC+VgqbUYY9NMerC+RJccgm44KXC3VULFRyIZAVsty?=
 =?us-ascii?Q?/S9SUfYKFEYchoFuKBPWy0t1oc1zHgSFtzFI/dxzqvU818SzEr26Ff95/5dw?=
 =?us-ascii?Q?IAYOx0FJsGcgTx7RoywGMIIz4SNw1VwNz4yu6w8mo0zMzm5ZvwWWi3hre9RB?=
 =?us-ascii?Q?ywSKfPOymhqwnvL4BwVisbdmI94QubUuk0EJ9XvUsbmmmhC+X6jDbT2MJpoQ?=
 =?us-ascii?Q?EA+nBLRTByIpOHgczkwj11pqJEG35+SNgjnE9M95EG4T5UfLCTd2yuNAl/jj?=
 =?us-ascii?Q?CDuOtbrX6rZNAW8xUKGO8TTWEh50ZTvBn6m5xLiEOx6sbtP66KOJz+eEyzJ8?=
 =?us-ascii?Q?O3ed8ugEKMFXCVuwRBMEGk1ekqZCasbJ7cx7/2RFV6172Hp7ua5VMNenkCTm?=
 =?us-ascii?Q?EkyvUsHi0Wlmm4UtXfnByWZuhUE+I2lNLEKFf5XSMK9iF1dzO11IkAY1vfiR?=
 =?us-ascii?Q?aYOOWzNGPu0N79Om9+TsfIXhZWnXG1HB99CVsSJKhkNrmQ3hrpHChhkmFY4L?=
 =?us-ascii?Q?XOFWIIPmUVJW0LL8UaYOvqvDlzUydcLRk7bg+wd6FJZl+pdn74Ib3h/WCARI?=
 =?us-ascii?Q?pkxdghM4+FvgcAGuaDfsRKoBfnbPY/PXeqH3GVfFf8RKPPsLzgs5A6RRHtJm?=
 =?us-ascii?Q?Qr0+v8h8IEwYWGFhte8DSOsq+Wi0FH0weiaA6e6HTJ6yexj8PyQrGVoL1HDs?=
 =?us-ascii?Q?f82SqSmk9nbfnUpK591lpmoOHbWvVtp/UOntefOzoUR6n5oGGqWM811d9JbV?=
 =?us-ascii?Q?+yfM0OGi4jFGpNR7EOm9Jvnm/yAvFuTIFuVLje1pv+hxifiRfrfkzmAouZ2t?=
 =?us-ascii?Q?/2pZ/x4n3TbkRsjjxtgWAIYD2pjB4ltz12sxWms9/2jy60fHqkfz+GO29abA?=
 =?us-ascii?Q?6bm3XFe3Y1p1yfKPvvwfcohKboGsItcWSnBMrHo6N9/UNaUE+oght/ew6wPS?=
 =?us-ascii?Q?iaeO1dTg1bu1ZRhvPG2gFuxpQwwIVwCieRAC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WAr+YcWd7gJQDIbkSYwx+PQiMaJyhCSDnGDruKVXTvav31pyRQeDBLr//DBT?=
 =?us-ascii?Q?fkfldX0IPw6b0ZVUzXI0xJWxfolPVQbhcsSeq/XDRhzIbzVBiEhqHhPbephv?=
 =?us-ascii?Q?REiCcNVD2rSbl/UB96XORpya0/+Tq0NZAf/d5eXVqdmESDDxqtIn6vEBNWen?=
 =?us-ascii?Q?ulBiE4wXHffiHO6SnnICZVDZUU7h/7DBUAc6IBHVzjdUKeDfWha2men0UC07?=
 =?us-ascii?Q?NkaNWT0DD4PIM98wznezzIFxb4YHKFjGhbucFlo+au74nAmYUXKZ+F8NkrV9?=
 =?us-ascii?Q?3cXl0hdu7MTBK/xnNXU4gx7gJTqHM3Rit7srw1pxb8gK5dMElWdN3DUbWGO0?=
 =?us-ascii?Q?PJqfMnRlD1rgwJTdIUMWeydjoX2MKEiG+PoS8Cyt9pmCIrX9NPJOBy+sG2Wk?=
 =?us-ascii?Q?IUSI4h+Y6OvEXY9ZDkoldLj13ARhPAHrJ9qxAf83iGHRxKz//xJfuay+i3FE?=
 =?us-ascii?Q?SW1dVBsRRl0skMTVh1VZ/EipP9b07muWV+pE4Rm4EtT6KMiQMjMoU9EGMwUp?=
 =?us-ascii?Q?4GrcTUXJNnJwlGdcE/lsRkXaU2zVBJTcA7ncaeuF/DcpFItMIhUPfoSPlnma?=
 =?us-ascii?Q?CDIr99OeOMno47sZ+/yRE3fpagNuMJgSJk+VOxIRiQWHmtneqPzOInVJ7P1e?=
 =?us-ascii?Q?uYqUPH40EGLzrY2gs/hHK0y4I2kdugJP2IGl9FjKJtEetHm6D8LInRIVeIwA?=
 =?us-ascii?Q?1ZU/q9utNnGiFcbtEig/e/RHz6BGoiMfyG35h0CR+4GMhHzPMm7r48lMmAkA?=
 =?us-ascii?Q?bJh0/42nsA9DP21NKt0M2EUSWjQYYkKfXsm9IMKyxeFsHaOwnQJRd1zPA1g0?=
 =?us-ascii?Q?kE+r3pkOd63fyul7NM98WUZ8cyffxYdtpYS45UwzgAf+bdZ8lk5OPZmboGNn?=
 =?us-ascii?Q?dbjg9jQmh65dh0R/9BpaM6l6gzEqGN2+FnNlpaqvhMbp4JXzlnJ6W/8jaggu?=
 =?us-ascii?Q?aYy/PeEXiJpbruE4JsZTgnNgfLMqH5MIKJ6DWOf5CU9VdOEd4Ey1VOEFunRa?=
 =?us-ascii?Q?CIHIyfvyDxaNKrUx3S+H2ycDgGDI3xCl6sADVap5Wi7uqi+pAZGgxThPh60x?=
 =?us-ascii?Q?12jtQFrhLosJqbwTZhWODz2YHWswEzXpwZ8ZYMzeLfI16+IcuwkcYL4CdIe1?=
 =?us-ascii?Q?OMmWFgEEmUW8x6ddZ2OeA17YoESNG4lW7bL+cJsgLDjbJELx0HbejCRY2hMs?=
 =?us-ascii?Q?HohtNsFHbdxUennqQuNIPrgJTr81OXODi+9SMgWyTyfE49botlQYiQ3hucnY?=
 =?us-ascii?Q?6Jkj9bYkGDvGTAoJB2L0CicWJ2JXqLUw8ESCAywIX/02LU72RMePaXqZTrKA?=
 =?us-ascii?Q?VebhjNEqv1Sj3EeE2y2r8qrCMxiFLn9Oju4xs0QqtJBtYq43OodgWhwEwTrK?=
 =?us-ascii?Q?Mojq0K02d0/+jpuv0KIXMu/fMoX2laETCW29AD3Ok8NMDXrX3YcipMPdkIR0?=
 =?us-ascii?Q?jbDSoAP5Lpy+RnnuG26EeWkwNxH+g+glQ8slMaHYMWy+kaDO3iHQwyKILLva?=
 =?us-ascii?Q?OazuanZY/ibI3B4aLdH7Jy6Tl6ht/AcwRwroKmT5xkSugP9M2sBLBKNNAf06?=
 =?us-ascii?Q?Rml2AMiIsq8fwuz5hYmPeBdDw6rHCMfpHF4XQp8O/tb+V3NGXTtBbjmFtXMq?=
 =?us-ascii?Q?X3m3Nc4aI6tcJugYsmF/5YARE1LqjtK4M7qJj3oKjjvCkuVugv8tcvw6avJp?=
 =?us-ascii?Q?YpcKQUuAxvsU39dmaU2Ez1R0qQRokYXA7ylPK3kyLZyDYApdMRxvogtBAUtY?=
 =?us-ascii?Q?9XqoezZ+sw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4846e48f-6aed-4bf8-eb26-08de3f1e20c6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 16:46:17.6944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: POMUZph0C59662nQ/RujVrm0Iltb7fSoqvxQ2mrYce1XoSq+y1fAcLbMtnzJA6IU2+gl9nLI1HLoQNeJTtau0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_084628_526374_8A07EA1A 
X-CRM114-Status: GOOD (  18.80  )
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

On Fri, Dec 19, 2025 at 04:45:29PM +0200, Adrian Hunter wrote:
> Move the PIO register setup logic out of hci_pio_init() into a new
> helper, __hci_pio_init().  This refactoring prepares for Runtime PM
> support by allowing PIO registers to be reinitialized independently
> after resume.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/mipi-i3c-hci/pio.c | 45 +++++++++++++++++----------
>  1 file changed, 28 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/pio.c b/drivers/i3c/master/mipi-i3c-hci/pio.c
> index 3d633abf6099..52d9f01d9ca9 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/pio.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/pio.c
> @@ -135,27 +135,14 @@ struct hci_pio_data {
>  	u32 enabled_irqs;
>  };
>
> -static int hci_pio_init(struct i3c_hci *hci)
> +static void __hci_pio_init(struct i3c_hci *hci, u32 *size_val_ptr)
>  {
> -	struct hci_pio_data *pio;
>  	u32 val, size_val, rx_thresh, tx_thresh, ibi_val;
> -
> -	pio = devm_kzalloc(hci->master.dev.parent, sizeof(*pio), GFP_KERNEL);
> -	if (!pio)
> -		return -ENOMEM;
> -
> -	hci->io_data = pio;
> -	spin_lock_init(&pio->lock);
> +	struct hci_pio_data *pio = hci->io_data;
>
>  	size_val = pio_reg_read(QUEUE_SIZE);
> -	dev_dbg(&hci->master.dev, "CMD/RESP FIFO = %ld entries\n",
> -		FIELD_GET(CR_QUEUE_SIZE, size_val));
> -	dev_dbg(&hci->master.dev, "IBI FIFO = %ld bytes\n",
> -		4 * FIELD_GET(IBI_STATUS_SIZE, size_val));
> -	dev_dbg(&hci->master.dev, "RX data FIFO = %d bytes\n",
> -		4 * (2 << FIELD_GET(RX_DATA_BUFFER_SIZE, size_val)));
> -	dev_dbg(&hci->master.dev, "TX data FIFO = %d bytes\n",
> -		4 * (2 << FIELD_GET(TX_DATA_BUFFER_SIZE, size_val)));
> +	if (size_val_ptr)
> +		*size_val_ptr = size_val;
>
>  	/*
>  	 * Let's initialize data thresholds to half of the actual FIFO size.
> @@ -201,6 +188,30 @@ static int hci_pio_init(struct i3c_hci *hci)
>
>  	/* Always accept error interrupts (will be activated on first xfer) */
>  	pio->enabled_irqs = STAT_ALL_ERRORS;
> +}
> +
> +static int hci_pio_init(struct i3c_hci *hci)
> +{
> +	struct hci_pio_data *pio;
> +	u32 size_val;
> +
> +	pio = devm_kzalloc(hci->master.dev.parent, sizeof(*pio), GFP_KERNEL);
> +	if (!pio)
> +		return -ENOMEM;
> +
> +	hci->io_data = pio;
> +	spin_lock_init(&pio->lock);
> +
> +	__hci_pio_init(hci, &size_val);
> +
> +	dev_dbg(&hci->master.dev, "CMD/RESP FIFO = %ld entries\n",
> +		FIELD_GET(CR_QUEUE_SIZE, size_val));
> +	dev_dbg(&hci->master.dev, "IBI FIFO = %ld bytes\n",
> +		4 * FIELD_GET(IBI_STATUS_SIZE, size_val));
> +	dev_dbg(&hci->master.dev, "RX data FIFO = %d bytes\n",
> +		4 * (2 << FIELD_GET(RX_DATA_BUFFER_SIZE, size_val)));
> +	dev_dbg(&hci->master.dev, "TX data FIFO = %d bytes\n",
> +		4 * (2 << FIELD_GET(TX_DATA_BUFFER_SIZE, size_val)));
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
