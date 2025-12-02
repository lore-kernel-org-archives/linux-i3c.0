Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01F5BD116F5
	for <linux-i3c@archiver.kernel.org>; Tue,  2 Dec 2025 21:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vBUpEsADEIxd38Z4AGBBX8NiAm/lQfMEtebo0eZkmDY=; b=k7tiXgJCx/zq4w
	XpjHvKgKTnOw/P/bKn/1X3/KfIZpiDsLzkmDQ9ZP3E5W2nF03S2xw/zDsoAGlfkzbL7w30WqlW3CF
	IUdmtx/Uk8FHkTzDJHc3dxTeLy6WFyBdqbJyF0LRXvkKs5VvSWURDJqqCcHmjFcL4i2FMjaAnWbQQ
	w75UgsUVJVYo7yf8ytGT78CLQOpizofh8BAypUVb07ZDdwA7j8GX5A3LlT2MQKjqBa/p+RqfPWj+4
	SXo2VibusET1rXmFwVEypUn3lTHjR0SU4wP7mpQSLwqPwPEuD4IXbQTPvS/f+W5CzE3GKkYDkzkOF
	GzL3QH7rXpVubt9h30Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQXjz-00000005qAr-2mZi;
	Tue, 02 Dec 2025 21:16:55 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQXjx-00000005qAW-23IK
	for linux-i3c@lists.infradead.org;
	Tue, 02 Dec 2025 21:16:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YJNau17LOLVj6b45WFpYPaG6JzFnjAUdU5YZq3ElEtLiUjGCCGowjRtzEZHgCIxeDgX4CRyllc8B+nEo+7S0mI5YWWhRjQXJXHgau1BQIY61TNSNtlxJZgknv2j5AEwpWRrk5ISuBAzDiwxz5ra6eiKnilCqbaFn0IjRJUj/VUc9YoFyrpe+D0QMpst3PE0Kd15qOe2IHwPIwpz6N4MujYWhaQO/18Z0ksuV6jxuIknv7avNIfhEz7j+8gx/KHo6Amhnlg5wy9AER7s+0dI2uTCbXCuf/jATCDhcJYYHYPUiEFxXrjhaHeIFySf+SuMkJxuTTBShXkYSeNI7Y0a1AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bPny8jTpXzIghyJfyxJZfG56LZLvssf+6CKfEx5lLnQ=;
 b=iiC91XN4iUFMV5zu8M+0M/CFVs8fxIo3aK1Aew7rkfzqdtv2B5PjC1aESrAT750rnTKOoGg2BAe1loCXy/63y3+XuVEf5Hz/rcdy6xGh6IuR46jXoCc4IP3sTwIgKI+UVee4ajKhhEzoOmRIpdz0+6UCHom+UF1pVrB9Fn8uo3/QLs8A2eRy2O1FN9KFaVuWkVKPoi7jfWw3DprFXsGlhMjIFX98SjKviUU/ih25StHvfDXNtbZ3iV7pCj/5KvNk7uucayxtOClvnI/eVAVRnvvVQCYR9Sd2dLn4fYQ07YiDooXD6q4vQocoPwCIrS1p2kQwTw2FByWqg5iAwvmpUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bPny8jTpXzIghyJfyxJZfG56LZLvssf+6CKfEx5lLnQ=;
 b=hDhj6yKQVSYspN6eN4V3xleoF3euJxV6Wo0oa7mqGOT98oZSAiS/10iZmDRDhzz1zXBtKBQrOoyRa4liulcZPXUSTTtodplxU+5H69YVxGAyuH5fXHYsk7TGgP/KVvg7WMd2MPvnSNgSKsFOwv0d7gjleyj/D8cZdWkie2WxF8BA9gzjV/cYhDmoHvt/Fm9kaaEhd3YpTrLWucLaWkZI7iwnTwvESbkgyDfT2/Gr9dWiZi/KUkof+ybTDd0Padw1iP+ImPUS63cJ1PLdk2dubL622lrUiXxwN862KJXiiaCoumSwY+F6RYLYNBb/DELYEP7kcRxqk67MqWlj0veygw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by PAXPR04MB8368.eurprd04.prod.outlook.com (2603:10a6:102:1bf::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 21:16:50 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 21:16:50 +0000
Date: Tue, 2 Dec 2025 16:16:44 -0500
From: Frank Li <Frank.li@nxp.com>
To: adrianhoyin.ng@altera.com
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/5] i3c: dw: use FIELD_PREP for device address table
 macros
Message-ID: <aS9XPPpmYna5kzDd@lizhi-Precision-Tower-5810>
References: <cover.1764663888.git.adrianhoyin.ng@altera.com>
 <4c4791c018d61beb9ff85ca68c5bf48940d2398e.1764663888.git.adrianhoyin.ng@altera.com>
Content-Disposition: inline
In-Reply-To: <4c4791c018d61beb9ff85ca68c5bf48940d2398e.1764663888.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: BYAPR05CA0070.namprd05.prod.outlook.com
 (2603:10b6:a03:74::47) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|PAXPR04MB8368:EE_
X-MS-Office365-Filtering-Correlation-Id: 97be32b7-4dc7-4506-4d95-08de31e81c1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|19092799006|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Rr7uAZpmPeV+1k5YPHTt/KbG84980lZ0BEG4P440CioTIInjvYBW2XEUcG3U?=
 =?us-ascii?Q?2HROkTITK1/NPQ5KLLOOyiCXqO+F8O9kZpgawlTsYFK1X/Ig+mhqhK0p5Asg?=
 =?us-ascii?Q?cQqMMRet6xR2R/5XAj1EK2p/NfommqC3K9VVESjQjKN1MVqdp6FPZOEFjuCT?=
 =?us-ascii?Q?sYSnxlCgxrk/JbM2v/PnR98qB8iTSjOU+Tcbt76Tbu1xaa1zn6NWHPsHjTC1?=
 =?us-ascii?Q?jwa24UO2GbOPqp9XthoHlD9WKI54E83WKFwNMlPPjFZ52Xkns8aVWATOm6Zw?=
 =?us-ascii?Q?gfDKlvSbmmGHieHhuSw/PYmmpB50bTcOwkbt2x8sUfxmncG0XdVvIzl/cbRs?=
 =?us-ascii?Q?T15TAemGgOkx76RkQBSGXQQWd1W6I2A/DoLUhzK/WYI5//dcsT0oB7TzAt45?=
 =?us-ascii?Q?WUIt70vEIE+mLAA7uitdslFnptHLWteL68TzfkBY4Qc+Z1kMfj22OWzEdO19?=
 =?us-ascii?Q?HcaOeS5RCpL8yGeTtAHUu42MhzlvvNuE8vU4AHZ7VxZrRORQ8lD9hH/KPetg?=
 =?us-ascii?Q?pVfH64YLHbtlXnGCUMY8XUGyCn+XacSi4QN7g1Pg7FavQTbr10nLFf7KUcUX?=
 =?us-ascii?Q?qEF6ntNrN+mO7ZrJdVjhGsoZs3pcBqpcDhS7h8jGOOex5IFKyMBS5klGQomG?=
 =?us-ascii?Q?r+Go4dJVUYDJ0PvJ3vdg4y6/um5jbEMJeeCzHzq4AFK5zxnKW0NVQsRcRMVX?=
 =?us-ascii?Q?tGG0xCHm7wCwND7HbmI2FbhSQA+id2LUL2XFlcR0AUPOdInGxT2BI6KGMIKz?=
 =?us-ascii?Q?z8oVkUWclRYVhBbcp6hozXqMpmqs/2sjMiTwx/xfgaRwSRS3pfcfK46/BMYW?=
 =?us-ascii?Q?7sZcpAaVtrnKmQRZxknezupVm8ngYs5/YI2AHYSpTDkjzzoac0SnZD6aUFaV?=
 =?us-ascii?Q?OgK+KDG8sB7v83fkEDhVvRlAbg3yoOQCiQaxPW+cx0btpWSEz9KZIXv9xiC5?=
 =?us-ascii?Q?tCEq2su8H1LAtYpRkDSUyJLIGDCZ7wZZ5IOZt0ked4NF3FiiTG+XIEdWd265?=
 =?us-ascii?Q?MBPtpsslMWSfNQ7dQlHXy3Z58j1Don6QyBKiVSIepLe7Zj8LUc14ntwbzcIP?=
 =?us-ascii?Q?imQG+G9/zo7yo1TvepenfVnGJynlQfpdkzj9QkgtJYnSNQSKEqGNVoaJMiKS?=
 =?us-ascii?Q?BnBM8v9Sf0XLereeixx1ZBHZPK9FjM4KCwgEE+k7IbuwG5mp4M1+7I6Xh1lZ?=
 =?us-ascii?Q?wIhEf6BLl06Mqfuxw7pMGDDnPqzNOfXBYWbYZutfHQbJGvR9auAxwM8EgKZI?=
 =?us-ascii?Q?zivhzU7IAGnB3LnoIZPxs9d8UuGtZSqDKUUpzWkS1+xmllOIZFcHatzcQJR8?=
 =?us-ascii?Q?ufL4fNFCUS1f+M98K09UKBykVjya/nyovITXklCZfeE5QGyfQZSDCwuLimlc?=
 =?us-ascii?Q?ztG4WGlFw9ST595aSDcS7ZvTm/E5n4Fj2tNrsw0QElCOYQD7Yn4PKjoM35H8?=
 =?us-ascii?Q?EnhizyShqpCRGSZS1WlCOQJkYgKpIJSyJDXF0nBS5dJQx3XyxPiMufsQEjBT?=
 =?us-ascii?Q?JvIAVFz78bm+MmYE+V6do6M7Mrt6pofBpAjT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(19092799006)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Vee/vfAhuK+F4iVK+ek2YIjlxUar2a53wCwnmowKsm8JB9RmnQv0n6eRl1NU?=
 =?us-ascii?Q?aKoAntWN2GKA77dfXiZMUt0pLY6O639O17+x2CHB0OXEibQz6y/Gle5sPYEF?=
 =?us-ascii?Q?LubnT9uLQOJVTJ8Iutzsy4Jhd3KHfw5kqoWjP9D3rHfDw6GkfVPOEoPbTMZ8?=
 =?us-ascii?Q?qiyzVIjDMeLfGqs8QAU5fLFExT3vOO7IPg1SWzjTg/ghjCobuFisGGmWQJtU?=
 =?us-ascii?Q?gLCDn6e3Tl5ES4ASNxV3bpK++lq82JwNtvP3wEhiS8CpFq7wTBz3W7fR73GW?=
 =?us-ascii?Q?ikcMDLP7qdvqHUJs6/lbiAnMmnDwInYwKPiC9Rx1lAIac4OVZcW1hu9A/dvu?=
 =?us-ascii?Q?qCDbNWzYzPbG/ODJzLrmpgVzgQTmfF9LS/mgxbh9SwhEXaoTA0aaOm73Kl/4?=
 =?us-ascii?Q?SSxMSbFBLLAjqNxL5aeW712nUxPmTioVlDfKVBygCRn34+cQ1+irV88155tn?=
 =?us-ascii?Q?g9eEBIXLOcqzmErno6bTuBfn3TlhGIXMmX9BtgeFudBeru1MUerSeYWcb9fk?=
 =?us-ascii?Q?azGL/z5M+dnDGp/z4LhEvpD/SzX+ol+hsqUBn6F2VUK4K+ovydxNzOP2/WxN?=
 =?us-ascii?Q?5zkEOE3qhhSVGoA01M7szt+cAwSR1n+50QkeYbnY1UrXNeytRa1LaTN6jyvk?=
 =?us-ascii?Q?a6bkyqGRVzZ114+0ccBVAR6L8kkXAmEYooLj1uGRlvV9IZcP6yywdOn2yYYm?=
 =?us-ascii?Q?0TeGm/cZyv0UJZY3kGvdnBP22z0ceNuhGz0XW/bN/0KWfOwYc+XKR/4srJTt?=
 =?us-ascii?Q?FIyiU/vHAhV7DUF1HJBvUiduX1FPut0pEeSWa2TMnuSWrqt5Vjxyfl2xzd17?=
 =?us-ascii?Q?vRwH1OLNH5YW4yy/j7OsuncnowDuJRXHIfk+MgOS4H8FOEUUBI00mHS5jdZC?=
 =?us-ascii?Q?BJXqAf+gcUIDUjRbWFQoaLnxrkd/wKjf3st3RM15MbjXh9GqEjDVOh+KNW+7?=
 =?us-ascii?Q?1+CfVQbM6l0OC7mn25ZODgSyzpzV3Cl8BLruL/3Ry1H/6stxNPWBE5FPIesl?=
 =?us-ascii?Q?GEHoGlssHIS/LL+GBhn742bIcF26Sts5+749PNRb80S5RLD1QCmpBji/dGMm?=
 =?us-ascii?Q?Jg6v74gu3TnoW6m2o+fx4uESMTxWIQ9AqmJM8WYr8jYdJLx8IyONd2gMqP/Q?=
 =?us-ascii?Q?QcYYdXBjqta+zZ5xzzPG8HqxCT5pDbR7DBzGdIUV2/kDFx0fdKbS7WOjefSf?=
 =?us-ascii?Q?DgEuF4HzgX0scf9nJ3sfzyJq1m4qbA8biAVizP6nA1CEe6gZVwiow8S5Nz4p?=
 =?us-ascii?Q?gomHMB0Fu3FXNcYz2FlnWoHCeaS4Spaf4lvMC6s4FM5BJKpVt+ZRrCnS9vmR?=
 =?us-ascii?Q?//7y1pyWLPV1qXisYTBd/6q5Lyilxgv2oKhQcsTljMILmx61f1UzS7Jj/Ytm?=
 =?us-ascii?Q?HXjDs7UcJUUDA7xMG/dISylLcj+4VG0ZEMZD9TggQRzjiYD9n0iwZh69DhAL?=
 =?us-ascii?Q?IsMCMraXiv6q4tmXvKQkKqdEQbFPtciVNNwqwWzBVMLhEOMA50fPbHX+/XDF?=
 =?us-ascii?Q?dwb8VhMSh3rVi0xF5rbmZarKrkVP0MZ3u+YLO0sclwPXEzLdkRNh5MKh/xDs?=
 =?us-ascii?Q?HfQTXHRHfT0vfWGwhQHfKo7pbjyVLZn2xbCabB3c?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97be32b7-4dc7-4506-4d95-08de31e81c1f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 21:16:50.8375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GvTu6wMnuR5goDbPWaO6F+tokp4lw0qm59PDYG6daTVec1OlVLr1a2N/NkmN2kJKfKvL7OwlwrsKib80wbUmGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8368
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_131653_552120_4E9C5549 
X-CRM114-Status: GOOD (  13.68  )
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

On Tue, Dec 02, 2025 at 04:26:12PM +0800, adrianhoyin.ng@altera.com wrote:
> From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
>
> Add DEV_ADDR_TABLE_DYNAMIC_MASK / DEV_ADDR_TABLE_DYNAMIC_ADDR(x) for
> dynamic device addresses and DEV_ADDR_TABLE_STATIC_MASK /
> DEV_ADDR_TABLE_STATIC_ADDR(x) for static device addresses in the I3C
> address table. Replace manual shift-and-mask with FIELD_PREP() for both
> dynamic and static addresses for clarity and maintainability.
>
> Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/dw-i3c-master.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 8288888be591..1c1418d0a62a 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -205,12 +205,14 @@
>  #define SLAVE_CONFIG			0xec
>
>  #define DW_I3C_DEV_NACK_RETRY_CNT_MAX	0x3
> +#define DEV_ADDR_TABLE_DYNAMIC_MASK		GENMASK(23, 16)
> +#define DEV_ADDR_TABLE_STATIC_MASK		GENMASK(6, 0)
>  #define DEV_ADDR_TABLE_IBI_MDB		BIT(12)
>  #define DEV_ADDR_TABLE_SIR_REJECT	BIT(13)
>  #define DEV_ADDR_TABLE_DEV_NACK_RETRY_CNT(x)	(((x) << 29) & GENMASK(30, 29))
>  #define DEV_ADDR_TABLE_LEGACY_I2C_DEV	BIT(31)
> -#define DEV_ADDR_TABLE_DYNAMIC_ADDR(x)	(((x) << 16) & GENMASK(23, 16))
> -#define DEV_ADDR_TABLE_STATIC_ADDR(x)	((x) & GENMASK(6, 0))
> +#define DEV_ADDR_TABLE_DYNAMIC_ADDR(x) FIELD_PREP(DEV_ADDR_TABLE_DYNAMIC_MASK, x)
> +#define DEV_ADDR_TABLE_STATIC_ADDR(x) FIELD_PREP(DEV_ADDR_TABLE_STATIC_MASK, x)
>  #define DEV_ADDR_TABLE_LOC(start, idx)	((start) + ((idx) << 2))
>
>  #define I3C_BUS_SDR1_SCL_RATE		8000000
> --
> 2.49.GIT
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
