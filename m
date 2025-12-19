Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFFEDD7879F
	for <linux-i3c@archiver.kernel.org>; Fri, 19 Dec 2025 17:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+d4kWPCGswcdn6R3/XSvRf0De3kcEyJy6ER0A1cwGPM=; b=DYxnNWBYOv04UF
	7j1cLBCQ2faWiYZh6M4KOPcG4u7Yk6lbUXCDWR2mfW72MXwgl/fjOnsCvp6+dXL7SQTgD95CMfYtz
	4FLgQGpri8ixeH4aMHjAT4hsK1hkMD6z7bIg8g5r2ujvopBVRHo6oWKHDxOvmWbWGvQjOfD9pKOK1
	V8ljwaGkV3ZBmApH7Ke3atkbDKi8o8dfWob9kGSn7WsyjlL89ZyyIfdqgkS6AGisC0B1GQErys+mG
	DxoHCLI9wN43GB713IymzPUzpi6zC9es91QgFWhfcBTRma9ggOu8zdPZlJDU+iL5BeE4BNQyfWtuu
	RNWCx+Szt1F9t/S8WO1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWdy0-0000000AgnD-2ULh;
	Fri, 19 Dec 2025 17:08:36 +0000
Received: from mail-francesouthazon11011026.outbound.protection.outlook.com ([40.107.130.26] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWdxx-0000000Agmi-3glZ
	for linux-i3c@lists.infradead.org;
	Fri, 19 Dec 2025 17:08:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PmiFtEgAHIsYGqrIzukn50j844GCux1sIT3mjFPAN3KoJD8O4DGbvqI88l64Die2sA6vtg6lYohX8KfnzUQxwWhB6w9IJOuLQf03//DmFsGfpf45XfwXTL0xu5PVnaRhPdXMvZj6iDZXTVxPNSQSda/Q+A8emb4SfzxxDcBOnzBdiRrytBf8q0NgjDBhGoeCWn9SeMyZc/CAEhwVlhjMrWDIhZ1vrXvfD0rZC0Qjnd7IRCm/dF4gK+Nh3hsyKPsKnz+wxQ2fp8SqnCjWoe4NoQ7DTWl3obJ6j25yC7j1/ZRMw8zMO9SWgs01o5UIQZ6wtmAFKk4PdEv2gEVtQMQIFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vEiQ9tGUEbK4cRNBzzoB0Q9qj0EeKa60iXkCPYhCyiE=;
 b=M+ia89z313YC8duDSH3MCiUp4mVu1HBZvd5y1duF2aUcRpDV0cekrjmCdMNPxb5jCUkso3CW9jsY4zI66ruaWsNlyD4PMfFt9MuHRnIwJl1PkvqvrJKSWE3bUeZ4Yx0M6lTbQNEFmSbU24ik13RbjVHV3yJy++1gj96a4piHRejfbcOsTtkXEHCKw94DTTnRDigDO/wx4HWAhu0Mr8Rb6WCgo252dwlLANth4hdVPd70Hzi6vOmhiCq+1Xusi8QuoFdqhSuikgvE62sGrrJg9ysxPh2ckg6VeZb/uFEH/2XCMWvC4guX57YEki0dfiF68kQNPrqhvfhB4ipHwyYeKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vEiQ9tGUEbK4cRNBzzoB0Q9qj0EeKa60iXkCPYhCyiE=;
 b=K4aoRBJRlY1qdjjNZR8ikCx/HbiMzPyliIVoo3JzmQz+paw7eG8eEcZrj09XHWEctczF7+HfFRBMJHw80QBcdOWfMYb+iOVJUVMHOw/QP+pzeQHLnR8w6alY7zCbUbknhugk+bKoAav+Go9dGyz5eGNaF1bF+nSsKXVZFeky8NpVEBIR3fAfP9BnKi0T7N4gt3uCDg2ZlberANaSrbKYA8qb7/ziMULU7lc8Bt17vDmDSILrDaAGxwmsQCXPCKoFJvsfCmBJG/rbk2VnGuyhj/HODYcN+kJYm3g7OaUth+HlcQcFlxRKhGdqiiYYKUQ5ZPyXWb+xv4nUx1hBs3QHhA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DB8PR04MB7162.eurprd04.prod.outlook.com (2603:10a6:10:12c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Fri, 19 Dec
 2025 17:08:28 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 17:08:28 +0000
Date: Fri, 19 Dec 2025 12:08:22 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>, linux-i3c@lists.infradead.org
Subject: Re: [PATCH 15/17] i3c: master: Introduce optional Runtime PM support
Message-ID: <aUWGhscb+6ZYRhzx@lizhi-Precision-Tower-5810>
References: <20251219144534.84391-1-adrian.hunter@intel.com>
 <20251219144534.84391-16-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20251219144534.84391-16-adrian.hunter@intel.com>
X-ClientProxiedBy: BYAPR08CA0001.namprd08.prod.outlook.com
 (2603:10b6:a03:100::14) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|DB8PR04MB7162:EE_
X-MS-Office365-Filtering-Correlation-Id: c406cd16-e62c-4394-2560-08de3f213ad1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|366016|1800799024|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NPtGeQcQPGodokQzuBqwC/DKJvY6qUB+RyAD9mzLVg0S1gluKTug/FXtDGan?=
 =?us-ascii?Q?77dbp9CSwoRwe0lOT6vTVvOR6KtmhkqVetWfTKQcERR/io3dn5vl4GYAIJMI?=
 =?us-ascii?Q?EGAiblSbd1eMpeYYm30xWDP8v2wmcVc8aO/XBHe6lnrCrO1A0bBFkfRFp8ad?=
 =?us-ascii?Q?KZdcVhy0yPn7xj4/o56Vzgsv7ls/nauAMorqFb8y+3FN6d/YgbRMOidLhgWG?=
 =?us-ascii?Q?wFU8wTeVSeB63rdDYW+kUs2GV8QTevbLtkb8m6TfhDT4RkNp7Dn+HmRRJ/cP?=
 =?us-ascii?Q?DFj/J0Eze5pE6NYbey+KkcwTsgpEi+Ok9ZIa74ExXZhM/+w8C/0+h+NoXqpD?=
 =?us-ascii?Q?MQGjj9SEYlU2aDS3Eqil/czNVX8XEHALpLmwyTwfaHX9h1HmugUHFrmAMGHp?=
 =?us-ascii?Q?RZ4tvZsleBGru+SY811ltlziif2K71v0Rki1AmOFCCvBkdkIFkUFag6Gj+5b?=
 =?us-ascii?Q?kZPgaIXyIj7jUyiJHIraujaWi/RMdGO/XaqdqVMiPKQKivRxbr/PXGjmP4oh?=
 =?us-ascii?Q?9nEWd6tXOajkAKcJtXlW3X5tjVCYIlIVeAgTBf0Wmb97CRvLA+MCxM6FluC/?=
 =?us-ascii?Q?ztA5rHviM+JQHZamcy+oNCTA+sKY2gPRoNTG6Ty7GD7h4qVvg7JvCEbQuMRT?=
 =?us-ascii?Q?PYfhc0Df2rlGyhGoPZXv89ARXDMo/1+C+RDotxtJ2SBbFrnlQsp4gBfgk7db?=
 =?us-ascii?Q?HY3ZNcvPG7O5iEXp+COPQp3nR2ZBqxSzOSQbERJ0iuxMhbWIflQcbIX2wCwY?=
 =?us-ascii?Q?zCfZ72prDFaIRV6TU9M9AvH8FXVcPCjFngotG6gioOxw7k/fBJ+otsmfbOo8?=
 =?us-ascii?Q?U1wsvOYuwjGAkmhP4ZuA4CvsfKZ92TzA8Cj91nY4GGAJVjR0AhlPk/bOax6Q?=
 =?us-ascii?Q?Xxb6VSBSYjfss3xz+oIPww2Y+ic9+K1yx5fPXbnndlOpJPMmQreNI2uuLMwU?=
 =?us-ascii?Q?MAS8tCiK1SfO/zppBu1p79PXgODSw4LPhY4mxBYPBS5wPOAxW5dW0A3Tp8xW?=
 =?us-ascii?Q?aCBX/ssk79IZaP1BQsao8RY8nl5WrphUUk+Gaof6H8ETh2x+Wjgwdpqre7r0?=
 =?us-ascii?Q?UXQiae/x66wM0GCKm2KkoJ9eF4kdE7BvjpPwUo3mJxiKNUAwWuV3bDwx+8lp?=
 =?us-ascii?Q?sskVvk7kJCTEB1oqwL3ywnZsLJqSihlXk0X9qLJRXPOGz1ksfVCOZIVarD6V?=
 =?us-ascii?Q?8Wx1hvNcMAkGGKFfmX4potJ+tJw84OKfVZ3CFSUxweDYj1oKHQ77EFzKWFzm?=
 =?us-ascii?Q?g6zdOgZvwKSAiYHV1WM0n5YGGkTCQhhmR0A6defj8JCnrbgm1R9VZ1QwfdaD?=
 =?us-ascii?Q?NyIErbypy50Bl874CUXwqaMMbgKAOpXH7oImSRR/YhZx6w6npb4rm/YMyUah?=
 =?us-ascii?Q?yQXcIfdlBJAmhGRKpw4i5mU9fDTcWRDr87DEslWSFsGc9ZolkxBR7Txz4VSs?=
 =?us-ascii?Q?0UA63h+qCGzGmIL+OuDj/kgAMMArOzmMmPjM5A+tgOhb/iQzbV+TZfet2b5t?=
 =?us-ascii?Q?CIK0K9KTXPHXl8EWyx1zGDUFsqh8NknbXwZN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F6NB2shRK53CqnwwxhR4tNDGqHfBeaiHa4hX1R1n/+IsyKV71miL7KMiY8XZ?=
 =?us-ascii?Q?U23xAPIkz3IzK1MeDd1v/q15N6tgBPwudnfcbPSkI6cuQn6qRG2H54iFEh1X?=
 =?us-ascii?Q?wabEjrSMxbpKiI0YX5267splInV28MacEc5huGNUAVsMnvPdB3nlLVz4x7OF?=
 =?us-ascii?Q?32EbQK69JZb0MSsQxZUne+0i5N1w2jvYzPN21gDLfGtGec+d5AZqkrldjWGN?=
 =?us-ascii?Q?xZOcVbvvXzyDRAYsGvL+m72uU3fCjQqShptm7oFjM8078Dda5LrDX2CS0Z4f?=
 =?us-ascii?Q?LrApW9jNRdzt27CCPr+f0ENEJ21UXzKt8g1QweHN8yDymmL2GH00eKEBPaE3?=
 =?us-ascii?Q?0Rb4Ef/nZhEvAyTp5w4yiiIPlf2LhlUXlCnaeuw5ee8V9UyBZmUKKUeUQCBz?=
 =?us-ascii?Q?xIZCbRNj+f5IN6TwHpLX0XSI29Ry0p6/OwgWl9LffH1JRSG/issknloAoVDb?=
 =?us-ascii?Q?lIbI88tBqqKwfNd1T/WWzJn9ts3432WebxaGIEaAwzyGTJA9r7gq7Zu+Vwww?=
 =?us-ascii?Q?iuhQm9PVBRSP7pXl5YEEtvuWZNHyVbHIxrgdEX1t8jcU3RMUXv56HR8u/Y/0?=
 =?us-ascii?Q?z54V2/sB7jJzar2ldLpCyh08/DFKOThYXXjod+QIdQpUwc/SPi11qVLYpTV/?=
 =?us-ascii?Q?GdowZF+0bFaFn5915hEeZBoJa9dBAEw41HXczNPvPZb7++PkM9wbrO0MMTXZ?=
 =?us-ascii?Q?eTU2VLKJAl7LHRB5VpsCJ0i3pWCJUR56thpWY1+tOgH9zjKt/D1KPMTOenba?=
 =?us-ascii?Q?CSLJxuzbwWeoKXhibdPESmQHGE5oYnq/QFBLL38AwWyvLemDwSZwGCO36CBa?=
 =?us-ascii?Q?9a6agZCo7vchnkYy9QTeOYfkAJnHt70xm+9vJVhCK1srGlqn50PU23sP1Nom?=
 =?us-ascii?Q?TR8U4OUDUn9jJCyeYxoBwAN88fDTWbQMazo1FepmEtERqG0/AAKBNMkce0Fp?=
 =?us-ascii?Q?qJ7+9Dv7U+pKd6wR4kQRAvae0TGZzNhw468CGcbvin5OuEBG4OEUs8l2aiWZ?=
 =?us-ascii?Q?rHHBBDjTKh1VGz5VeDlGBBykmIqwgRbwvWVMYxgUKjP89LjUjCDBvkfYKzuG?=
 =?us-ascii?Q?hE4rkAXZlhxd31itq+WSrjjw7JukKKNt/Lu6aeAHw9SIrxJMjeV+/kTwjo0m?=
 =?us-ascii?Q?GTg9PAEMtmru8aQrz1E+mrEC8OMeE0lDiAlgoFyry0tsaEh1DBnB97RAqo0d?=
 =?us-ascii?Q?UWCr4p8g/QahflRnIaTFNNGQb0UAfQiKuJrPq936YWr6Kk6EuIfhHl1pNg/y?=
 =?us-ascii?Q?KIcx8DfwQZtycM3LzfNp2VaCi37mOgT2fK6FXaX4O+ToTnBjKxKPZXKsjdQ9?=
 =?us-ascii?Q?t+OlzNLEaEcxfjvEmXyu3DTbWaaiWB4EesOjq0AtcgO45iT2nxgCQlYR2gVE?=
 =?us-ascii?Q?T8rAel5ZojkZf/gRMiC3EXT0ptn5VwIqNIj0Gkg2z9K8/fQ42RUImgj3JvG5?=
 =?us-ascii?Q?bc+lzj29y4LZn8QW2B696GQQJTWzuMJZCJFoEcqn1bN4BsRo4jpImVjmrpVZ?=
 =?us-ascii?Q?VzmjuWh7JxAFBlFZqsUzmjnxxumSv2Lj1LzPRndrpKlHkJvZBfWOTW8RpyyX?=
 =?us-ascii?Q?+Gp0Okw1nYXSh1C7kOGGxCShkmBFtSSj1eES8KeO322nHx3h3SIznkwAetQC?=
 =?us-ascii?Q?igfD7ph8O8PvmH10lOjhr1/m/liIto7an0/drLIZEgEdlQukWxlsJmQqJD+t?=
 =?us-ascii?Q?wnK+8Psx6A9h1cYWVCfE6RwSl6f0OwhFyVyIwdaJCYHZ+PTuut6sC9om8LTG?=
 =?us-ascii?Q?6jnwVJnt3A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c406cd16-e62c-4394-2560-08de3f213ad1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 17:08:28.8190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PqrKOt69POri1Xy5tHnIoGLrUzrBi8sD4PhAheIvyL/Xx/S48ca8AEst04AisZzvnpL+AFEuAFAei4wTMXr79g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_090834_085078_8E6080D3 
X-CRM114-Status: GOOD (  25.45  )
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

On Fri, Dec 19, 2025 at 04:45:32PM +0200, Adrian Hunter wrote:
> Master drivers currently manage Runtime PM individually, but all require
> runtime resume for bus operations.  This can be centralized in common code.
>
> Add optional Runtime PM support to ensure the parent device is runtime
> resumed before bus operations and auto-suspended afterward.
>
> Notably, do not call ->bus_cleanup() if runtime resume fails.  Master
> drivers that opt-in to core runtime PM support must take that into account.
>
> Also provide an option to allow IBIs and hot-joins while runtime suspended.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
>  drivers/i3c/device.c       | 46 +++++++++++++++++--
>  drivers/i3c/internals.h    |  4 ++
>  drivers/i3c/master.c       | 93 +++++++++++++++++++++++++++++++++++---
>  include/linux/i3c/master.h |  4 ++
>  4 files changed, 138 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
> index 8a156f5ad692..101eaa77de68 100644
> --- a/drivers/i3c/device.c
> +++ b/drivers/i3c/device.c
> @@ -46,10 +46,16 @@ int i3c_device_do_xfers(struct i3c_device *dev, struct i3c_xfer *xfers,
>  			return -EINVAL;
>  	}
>
> +	ret = i3c_bus_rpm_get(dev->bus);

Is it i3c_bus_rpm_get(dev)?  dev->bus is parent of dev. in case i3c
periphal need enable clock or other run time pm enable call back?

> +	if (ret)
> +		return ret;
> +
>  	i3c_bus_normaluse_lock(dev->bus);
>  	ret = i3c_dev_do_xfers_locked(dev->desc, xfers, nxfers, mode);
>  	i3c_bus_normaluse_unlock(dev->bus);
>
> +	i3c_bus_rpm_put(dev->bus);
> +
>  	return ret;
>  }
...
>
> +static int __must_check i3c_master_rpm_get(struct i3c_master_controller *master)
> +{
> +	int ret = master->rpm_allowed ? pm_runtime_resume_and_get(master->dev.parent) : 0;

I think rpm_allowed is not necessary. If don't allow rpm,  i3c bus driver
should disable runtime_pm.

I remember pm_runtime_resume_and_get() do nothing if runtime_pm disabled
(need double check).

Frank

> +
> +	if (ret < 0) {
> +		dev_err(master->dev.parent, "runtime resume failed, error %d\n", ret);
> +		return ret;
> +	}
> +	return 0;
> +}
> +
> +static void i3c_master_rpm_put(struct i3c_master_controller *master)
> +{
> +	if (master->rpm_allowed)
> +		pm_runtime_put_autosuspend(master->dev.parent);
> +}
> +
> +int i3c_bus_rpm_get(struct i3c_bus *bus)
> +{
> +	return i3c_master_rpm_get(i3c_bus_to_i3c_master(bus));
> +}
> +
> +void i3c_bus_rpm_put(struct i3c_bus *bus)
> +{
> +	i3c_master_rpm_put(i3c_bus_to_i3c_master(bus));
> +}
> +
> +bool i3c_bus_rpm_ibi_allowed(struct i3c_bus *bus)
> +{
> +	return i3c_bus_to_i3c_master(bus)->rpm_ibi_allowed;
> +}
> +
>  static const struct device_type i3c_device_type;
>
>  static struct i3c_bus *dev_to_i3cbus(struct device *dev)
> @@ -611,6 +643,12 @@ static int i3c_set_hotjoin(struct i3c_master_controller *master, bool enable)
>  	if (!master->ops->enable_hotjoin || !master->ops->disable_hotjoin)
>  		return -EINVAL;
>
> +	if (enable || master->rpm_ibi_allowed) {
> +		ret = i3c_master_rpm_get(master);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	i3c_bus_normaluse_lock(&master->bus);
>
>  	if (enable)
> @@ -623,6 +661,9 @@ static int i3c_set_hotjoin(struct i3c_master_controller *master, bool enable)
>
>  	i3c_bus_normaluse_unlock(&master->bus);
>
> +	if ((enable && ret) || (!enable && !ret) || master->rpm_ibi_allowed)
> +		i3c_master_rpm_put(master);
> +
>  	return ret;
>  }
>
> @@ -1712,18 +1753,23 @@ int i3c_master_do_daa(struct i3c_master_controller *master)
>  {
>  	int ret;
>
> +	ret = i3c_master_rpm_get(master);
> +	if (ret)
> +		return ret;
> +
>  	i3c_bus_maintenance_lock(&master->bus);
>  	ret = master->ops->do_daa(master);
>  	i3c_bus_maintenance_unlock(&master->bus);
>
>  	if (ret)
> -		return ret;
> +		goto out;
>
>  	i3c_bus_normaluse_lock(&master->bus);
>  	i3c_master_register_new_i3c_devs(master);
>  	i3c_bus_normaluse_unlock(&master->bus);
> -
> -	return 0;
> +out:
> +	i3c_master_rpm_put(master);
> +	return ret;
>  }
>  EXPORT_SYMBOL_GPL(i3c_master_do_daa);
>
> @@ -2065,8 +2111,17 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
>
>  static void i3c_master_bus_cleanup(struct i3c_master_controller *master)
>  {
> -	if (master->ops->bus_cleanup)
> -		master->ops->bus_cleanup(master);
> +	if (master->ops->bus_cleanup) {
> +		int ret = i3c_master_rpm_get(master);
> +
> +		if (ret) {
> +			dev_err(&master->dev,
> +				"runtime resume error: master bus_cleanup() not done\n");
> +		} else {
> +			master->ops->bus_cleanup(master);
> +			i3c_master_rpm_put(master);
> +		}
> +	}
>
>  	i3c_master_detach_free_devs(master);
>  }
> @@ -2421,6 +2476,10 @@ static int i3c_master_i2c_adapter_xfer(struct i2c_adapter *adap,
>  			return -EOPNOTSUPP;
>  	}
>
> +	ret = i3c_master_rpm_get(master);
> +	if (ret)
> +		return ret;
> +
>  	i3c_bus_normaluse_lock(&master->bus);
>  	dev = i3c_master_find_i2c_dev_by_addr(master, addr);
>  	if (!dev)
> @@ -2429,6 +2488,8 @@ static int i3c_master_i2c_adapter_xfer(struct i2c_adapter *adap,
>  		ret = master->ops->i2c_xfers(dev, xfers, nxfers);
>  	i3c_bus_normaluse_unlock(&master->bus);
>
> +	i3c_master_rpm_put(master);
> +
>  	return ret ? ret : nxfers;
>  }
>
> @@ -2531,6 +2592,10 @@ static int i3c_i2c_notifier_call(struct notifier_block *nb, unsigned long action
>
>  	master = i2c_adapter_to_i3c_master(adap);
>
> +	ret = i3c_master_rpm_get(master);
> +	if (ret)
> +		return ret;
> +
>  	i3c_bus_maintenance_lock(&master->bus);
>  	switch (action) {
>  	case BUS_NOTIFY_ADD_DEVICE:
> @@ -2544,6 +2609,8 @@ static int i3c_i2c_notifier_call(struct notifier_block *nb, unsigned long action
>  	}
>  	i3c_bus_maintenance_unlock(&master->bus);
>
> +	i3c_master_rpm_put(master);
> +
>  	return ret;
>  }
>
> @@ -2881,6 +2948,10 @@ int i3c_master_register(struct i3c_master_controller *master,
>  	INIT_LIST_HEAD(&master->boardinfo.i2c);
>  	INIT_LIST_HEAD(&master->boardinfo.i3c);
>
> +	ret = i3c_master_rpm_get(master);
> +	if (ret)
> +		return ret;
> +
>  	device_initialize(&master->dev);
>  	dev_set_name(&master->dev, "i3c-%d", i3cbus->id);
>
> @@ -2960,6 +3031,8 @@ int i3c_master_register(struct i3c_master_controller *master,
>  	i3c_master_register_new_i3c_devs(master);
>  	i3c_bus_normaluse_unlock(&master->bus);
>
> +	i3c_master_rpm_put(master);
> +
>  	return 0;
>
>  err_del_dev:
> @@ -2969,6 +3042,7 @@ int i3c_master_register(struct i3c_master_controller *master,
>  	i3c_master_bus_cleanup(master);
>
>  err_put_dev:
> +	i3c_master_rpm_put(master);
>  	put_device(&master->dev);
>
>  	return ret;
> @@ -3114,8 +3188,15 @@ void i3c_dev_free_ibi_locked(struct i3c_dev_desc *dev)
>  		return;
>
>  	if (dev->ibi->enabled) {
> +		int ret;
> +
>  		dev_err(&master->dev, "Freeing IBI that is still enabled\n");
> -		if (i3c_dev_disable_ibi_locked(dev))
> +		ret = i3c_master_rpm_get(master);
> +		if (!ret) {
> +			ret = i3c_dev_disable_ibi_locked(dev);
> +			i3c_master_rpm_put(master);
> +		}
> +		if (ret)
>  			dev_err(&master->dev, "Failed to disable IBI before freeing\n");
>  	}
>
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index 6225ad28f210..c1ec597f655c 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -504,6 +504,8 @@ struct i3c_master_controller_ops {
>   * @secondary: true if the master is a secondary master
>   * @init_done: true when the bus initialization is done
>   * @hotjoin: true if the master support hotjoin
> + * @rpm_allowed: true if Runtime PM allowed
> + * @rpm_ibi_allowed: true if IBI and Hot-Join allowed while runtime suspended
>   * @boardinfo.i3c: list of I3C  boardinfo objects
>   * @boardinfo.i2c: list of I2C boardinfo objects
>   * @boardinfo: board-level information attached to devices connected on the bus
> @@ -527,6 +529,8 @@ struct i3c_master_controller {
>  	unsigned int secondary : 1;
>  	unsigned int init_done : 1;
>  	unsigned int hotjoin: 1;
> +	unsigned int rpm_allowed: 1;
> +	unsigned int rpm_ibi_allowed: 1;
>  	struct {
>  		struct list_head i3c;
>  		struct list_head i2c;
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
