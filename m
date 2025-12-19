Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C290D78794
	for <linux-i3c@archiver.kernel.org>; Fri, 19 Dec 2025 16:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qr6s/AlKwm6IwM8ak1DjAHJmgaMn+F/lpH/9y4TR6+s=; b=AKxF76ywSGtnMq
	okKJwkHaCh6doj0gxzb06HBz9irNweC3QRj3VGtFHqKg6yKIseO1taYQ1ldc64ImCSYbh1ZR2eFKf
	ni8KnKlEP2wGFUCp9asH0UQpdSGQQIxU1eLsaKGHCvXiXZc3LJADBXTnhAtlUmD7VLqSCTPGOpZ5e
	Re8gkCvlPVNnPs2OBjr8h+gersPlkCCHxxGv/1lpn+fFS8yA9jGipG87i3XVkGdeS3lQEt1/rjNih
	v/cl0yqceIDaO+2JY+qEgHDq5oFCMN+7vnblunO/JRM5aeHJrqD6/u2Sc0wVoI8fRd2cEzLwU0ff1
	xSE4v64WC2PYMAfMYOtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWd66-0000000Acw4-46AS;
	Fri, 19 Dec 2025 16:12:54 +0000
Received: from mail-northeuropeazon11011063.outbound.protection.outlook.com ([52.101.65.63] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWd64-0000000Acv5-1kk0
	for linux-i3c@lists.infradead.org;
	Fri, 19 Dec 2025 16:12:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UbxobsTg94C08B/Bos6QhY9D74V7rVhq4OqTXxb2HG7N+HBZ43qWc92AyjiHFNZLpqz8M41Wazx0CekQc2dPDqLqpo/SwKx12AoYNJLqfYD9+OYrHR9l2Mb+O5+FTvLU/x1G66LOoo7KAW0/gBTjS3ApCmsICK57L6U081eAOhO71XU0OblltgijL1I4joVIUlUaSqF2LGUdcVDaVvTIwHlLEyWc63vBgJ5cj54CMN2eXinjqMEhkvtFKednNDwmVSvmYAgpig9pFd5Dy79/Hkb86ZIBLjvnVr3KC5yPQVa8rXNydK6U92RTmyYL/pEf4M0MJh33BGRRgu08LrFtTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IRKVFAq9gEEy3mLK6fyksCItAyPZyrov5pCRiOcNUnU=;
 b=wDcRHfplG6PiiFJjZeDybDV5acFEgrRsW34EIY3y/IaUAnADHIaBMTLj3R88NALBPYk6UtOIaBuJ1q8tq8Xvn+L6jlRA/w0HkYIjrncUm7ASPYFXsQhfi6iVlISCSK4FBK+feiQoLbEUX0uaxwyTkuX+FycZr7kSxGbTqltdFWq9RDh+UnOS/AmkvrZQc6lHc7ddUtF5FJNtfIYaQj7uNRyJUttYYQqILaGLtJ1VTUPA0LrAJ6mDRg+u3o9GAgCVpBCjsoxT5eogI4u0J3soCAK95bfgV3ScKBnskRXz7c0b60xm6Z1YwJiYO6hQmaLi7vVSSe7FdDyapxDBY2oVZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IRKVFAq9gEEy3mLK6fyksCItAyPZyrov5pCRiOcNUnU=;
 b=H66tWimZMCWVa47BA+P86VhcILX4eQ4D61whw7ypRdeW68xcvg8MtiFMpw2DgE89uZsPV58pH7lyC2omRbE3jOZClUn7I6xaQ/8wvIb7lchaejSKFdxVc1nESix7YLgOiVLl+p7MRBNQYJ7mCczfcXHoZh/bLZ2QkwUJpcQ8nKZ9tVjLnIS00geoTnMcFdpGm3ig5bzCZmvOOomuQ6R5xMg7+gYoVsM8BnignEmRA/V51ttixwjFh97KCNIg/Pn1qyGBAOSguKMO6CGrrfO7rlnO4qJ0zSAq0D5AJgTHqed9vi5F/fRO5EFoKfFM31p6cDkeiy+PWNVQqVm1t+Kqwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by GV1PR04MB10559.eurprd04.prod.outlook.com (2603:10a6:150:20b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Fri, 19 Dec
 2025 16:12:49 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 16:12:49 +0000
Date: Fri, 19 Dec 2025 11:12:42 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>, linux-i3c@lists.infradead.org
Subject: Re: [PATCH 01/17] i3c: mipi-i3c-hci: Reset RING_OPERATION1 fields
 during init
Message-ID: <aUV5ej7kGLOuddqs@lizhi-Precision-Tower-5810>
References: <20251219144534.84391-1-adrian.hunter@intel.com>
 <20251219144534.84391-2-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20251219144534.84391-2-adrian.hunter@intel.com>
X-ClientProxiedBy: PH8P223CA0002.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:2db::8) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|GV1PR04MB10559:EE_
X-MS-Office365-Filtering-Correlation-Id: f2d245d9-b4a1-41b1-1f5d-08de3f19742e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|376014|366016|52116014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?X0VemP/b+lSjXsXm9qzaanoGw6opHLtigutdn/mMzUS9pZQrpswQNZtjJI0+?=
 =?us-ascii?Q?sdr4xZm6S1hwb+6K7Fp1bib4b+JL056RwulCbL6TDxzeYwoR3IbqccRDD0M6?=
 =?us-ascii?Q?Y9Ssq4qYqKsKEWPAjEIXsF7yL7FYlkRyfYDVdR4ABmu9yWKc2NwEdOL+vXrS?=
 =?us-ascii?Q?Z6DMLp8yWhELycIV7p6btFEVT4/Q7Z4MQ6zwexUre0ncnWpaFUuUzUVT8oH0?=
 =?us-ascii?Q?FZf+kEf22ji3gQo2U/lbA+C0LxpbEBry3fl2Aw4hfesXCucJr2RUoFDIMQSN?=
 =?us-ascii?Q?w9ri569jULb4D7aBLqMABczD2k6WjPIRHfCA5qAHfFQaOLYZpcUcak9qEiO8?=
 =?us-ascii?Q?vL2tHEG2cxu4aWwvUF/5yvgZVOsEe7Jo+a1c1J/dF4e4YaqecFXs8ndyc1NX?=
 =?us-ascii?Q?DNk5I3VF3U1oRpCEdquaju+85uBNYIm2HUu/TQNco/AsJN/S80eLA/njVS/k?=
 =?us-ascii?Q?rwnr7l1p6WUAToKic/8FAKrWRcAlqWpalQZwyJBbE8w4aINsVEtu/MiFj4PW?=
 =?us-ascii?Q?hUELgst6C33e5snVM+lFGVDIvpVR+9+D5/R6OMyn3d3gTz7Hxwk/CMYuSvja?=
 =?us-ascii?Q?wODVntO5TMp2cRRpnUYVxk8L9+6cKaKISxLrnPURMWt6oZltJ1dumccI0pzU?=
 =?us-ascii?Q?6OwouF5a+cq7YSObs2J5fS+OjtwYgO33lI2BUxt3/7bDhtch8dimfeYnI8kp?=
 =?us-ascii?Q?jU7COzbp6lfakoJa4dRBBZVJR+tKOE/P/O7+vtlVXmDv1uVvhv0N4NJhjYPN?=
 =?us-ascii?Q?QDQe3EiAv7S3aW0TlToyGSL9EkwoLnqpXSToblWYUBm2KbB+XCct/nGG/9H2?=
 =?us-ascii?Q?rNDN4BUdZG1oY7spXVrEZHO9gn/1Malo3TkUltsJUbGBs0qDrjL/7jOC7lI2?=
 =?us-ascii?Q?HgWw7fYVCDdNaqfN7nRptfAnGMzVE+o8KTUrsMv8rC3T+y04YVZIc0c1TXBD?=
 =?us-ascii?Q?c9FkYLo6YT8DNiirc7UkODzLisJ88pcu28ZJUuvCXxPGBtfbkyr4ZCryUd6Z?=
 =?us-ascii?Q?0/ClymwFn7lpZ0N7AmpfIBm5SmtBRRQZfx0d3JY1r25BOX7UyEsO+438uam2?=
 =?us-ascii?Q?aL7sXIbVPlkUrYJbzjIqbeRuiHRqFJ10kJpUI2LV/b/VDAn5usI2iFho7qXW?=
 =?us-ascii?Q?wHVY0gkW/WK15dWWypQy2xgVa6TJ6B0uabDyIHIsfTcdhmrlAocnbGTUp2vf?=
 =?us-ascii?Q?7lcKvo+sbnkd0mH87XYi8mCAqBaaM3v1pPaMOZgV8QJPDpVYXAnV2/OIe6CY?=
 =?us-ascii?Q?UKJq9HXNPTcVSR8q7FnIvSzkOXpmgRfq0g3Y8QunataapSuEiEIqtQl/sQtq?=
 =?us-ascii?Q?ies9lko7+I1/tfWheIx4eZEfLeyNVEGCKFrC0i/52rrGhUjaNZZosY8zoO4s?=
 =?us-ascii?Q?CoSCgzijUeUprtyeoSit6qAiy+cofmVYaDFlpNluOFCJ/ddKndDMeD2WOgZ1?=
 =?us-ascii?Q?z1RvTL494QDjXhte2N/54B82gvOXyEI/JU7wPDLSMI3E0OC7dh9e0+x7lZKC?=
 =?us-ascii?Q?KJYYBz5LcLHmH0p9SUy2jJeI3je56HS4Oo+3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(366016)(52116014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oVNYfBYuY0Dmboh2mgmBy8WlMlku4XzB8GowqxbaQwk0roWsh2ecDld21o5p?=
 =?us-ascii?Q?VKbno7sHR/Noz+k1LKZ8C94RdN4J6CKMNEHNVk7TkcO88qr9svw36BbSeLFK?=
 =?us-ascii?Q?yOX/6AYdSaGDYQIKvHOswJ54XQH7FNja22cVKYEMPb8S5b2nuHHcnwEIeyEv?=
 =?us-ascii?Q?IPg6WgIuKUuPJoeCU5svb/HRrvW2hQOF8hwsLCDjTqSJ+SkTfZvswXM75xvT?=
 =?us-ascii?Q?gDKbty+RW2PZcPj3h2GPMQPasS+wNV5lnP+jJngOwif0e44QVDMciIV7o/E9?=
 =?us-ascii?Q?XfK0s91y34LtqOJ9CHSiu0y+yJKMZmlQ1pJU3eKgVNWEskgeXzN+pyM28CQH?=
 =?us-ascii?Q?NcuN5OCvEMLeTacm/VOvJ1XyH7DQuFwAkh+nYcxZrIXBqv8wR5CvkouJctr+?=
 =?us-ascii?Q?GZMVktbnqaJ+RBTv9mnIVIEv1Pj23COyPvqAFAy+drvqZInIYwqEi4DJCC4t?=
 =?us-ascii?Q?GLJxGSkJYcHdgldHtE7HvEyGljxorsn7PgfDTlP6VcPDtFoo5lCkI+R6xaxk?=
 =?us-ascii?Q?KkMk0mk3/iOLt8iBGSfMioLtnqwvXsEKvsnqujnMaPOoN2dC4Pw7PdIQAFts?=
 =?us-ascii?Q?CsRV3YigGeBTNdS/THdV/7h9nftmfHCeUWCV6TpDifDaf3lw6X8B8snEVSX2?=
 =?us-ascii?Q?TPvHqxyCPdWZJDf/TfF7LbbpPwlWyKle+nq2E5BNUr/cSkC+px2wyOeXfZmq?=
 =?us-ascii?Q?zYISxKB5Ayi7F/0mtesNGH1QHwHaIs/sZ0g+6cQ2UtpOUUBBVlg2+rdWCcVv?=
 =?us-ascii?Q?9mXvIkRYEIUcCu0famVRb/B2Nx58BL+uuNzkYSJGzjv+6jSXQco/h5oljHIi?=
 =?us-ascii?Q?nF1CPGMamGWCWV5NNvPRbIAh8zXARuMGPj/IVZMUDPRYrO8C4WAFcAqfmCgD?=
 =?us-ascii?Q?2qbBR5Arv4x7OQWMECRVuz0yaGrIuRzZCGnTZb0OR7f1X2nhMUzrZxSZ8GVj?=
 =?us-ascii?Q?hKgpfhA4gJzKlp2PMo/b2CfMWBNLR/aZYrmeyGIVQxi8BBOTHJ5YX3vOeKU7?=
 =?us-ascii?Q?/3/X+XhU9l4lw72xVOsD0iu4sq/lF/MYqWJTJkdqaBzFTmIWSD4Y9IQ76bmS?=
 =?us-ascii?Q?mpx8l166VLjMR/x7WaEo+C2BTBbl1J9I20unNReWuRRcHeKRktWh29XJknb6?=
 =?us-ascii?Q?3G+oHMI6zsb/6JcZSIddcha1+ddcdp7NDmADerY8cAHB+0G3LhyuhXOYBGYx?=
 =?us-ascii?Q?votKDnNZaL00iQiuz2fmUvYTi37FUZMTqL3vRtL2yjdGDGRUEGuYMWGPNHVa?=
 =?us-ascii?Q?NlyHe28GpOzt+3ySlB3/qGkUWMW2kw9kxV6TBS5nX4SwQErkz4M8c67PNMHf?=
 =?us-ascii?Q?ezYPu7B9jeE4SNTzCGB/mJIuSlq7R47hUeY9MfEyknK0z8CxxneQdjjDddzY?=
 =?us-ascii?Q?TyZHwm9b+Ke0aK+aahNId9RVaksidkYntWRsSN7kZ50v8L5S+H1D3+5qZ1v9?=
 =?us-ascii?Q?wJFV1rLcTZeSNIjJOX9AMwedToFH4tELVXsrnFWMM6dNgAcYGvvcklXvNdgi?=
 =?us-ascii?Q?juc4urQtO1hwxLVvKLS4lIdDecL+a8SAM6KBdfZ4UgGziYLZ9jj5wIRF6a7A?=
 =?us-ascii?Q?kcHcJaZjpkuWahqfYQr+16qBAMym7Clvf9hwZyxgGEDiZRJE634STO/zl1F3?=
 =?us-ascii?Q?Z56oI09PcSNxF6Ahg2bNIzdtagbvI7tnfygzgpgvLKexHPnrDii8zP60R3Er?=
 =?us-ascii?Q?6z4hv49fVcMc1RIz5HX3zm3TVBSb7+yiMbnym7PllEW8bmt3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2d245d9-b4a1-41b1-1f5d-08de3f19742e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 16:12:49.0000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6nwNsgZN/pyXvRqTSCSMSo6mgmkwhypmpQAOJ+Pr1rv6IfUWEouV6SxiOxG0QOpyzFn8VfqxWU2U7B1VhE7Zow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10559
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_081252_473864_168FBB71 
X-CRM114-Status: GOOD (  16.52  )
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

On Fri, Dec 19, 2025 at 04:45:18PM +0200, Adrian Hunter wrote:
> The MIPI I3C HCI specification does not define reset values for
> RING_OPERATION1 fields, and some controllers (e.g., Intel) do not clear
> them during a software reset.  Ensure the ring pointers are explicitly
> set to zero during bus initialization to avoid inconsistent state.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/mipi-i3c-hci/dma.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> index 0f6bbe184e85..5515ed740ca4 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> @@ -340,6 +340,14 @@ static int hci_dma_init(struct i3c_hci *hci)
>  		rh_reg_write(INTR_SIGNAL_ENABLE, regval);
>
>  ring_ready:
> +		/*
> +		 * The MIPI I3C HCI specification does not document reset values for
> +		 * RING_OPERATION1 fields and some controllers (e.g. Intel controllers)
> +		 * do not reset the values, so ensure the ring pointers are set to zero
> +		 * here.
> +		 */
> +		rh_reg_write(RING_OPERATION1, 0);
> +
>  		rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE |
>  					   RING_CTRL_RUN_STOP);
>  	}
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
