Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2586CD1D468
	for <linux-i3c@archiver.kernel.org>; Thu,  8 Jan 2026 14:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K1Yf/zy2AV2t0sOIHk+h+OpkZh/GpzieViBzprXHAwI=; b=utlDA0ToysxxsK
	xs8cZjrTG3wU7MdW4oZ4apXw2aBFJBsG1VFsYVPQ+yzRqJEOBd6H2zDYQWz1Q9QmvgovO/fdyKnOC
	RXp7MrPSbHcnfBmWZ10oXsxLzj1w2yMWCUHTdPZPxu+2w+VoOtHkZC9VzyihsjhKEVIL6GhEBylcw
	BVs93j1cCHyIHWGRj28Okh6Gbpv4hSwj71Qbo/21aSmIqbi9BwDv+iniLyavcilI8Up5fAtK8uL8W
	JiRPRebQQ1ni+CM8frYizUayZ5KyLqjRzwUtnAbFLjEKzlcvCb3Z0c+EF7DKxkbVpql4e6IFWJHAM
	2aTzPvQVTdZS6Khn2hWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdrR6-0000000HQev-3YDI;
	Thu, 08 Jan 2026 14:56:28 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdrR4-0000000HQds-3Xkl
	for linux-i3c@lists.infradead.org;
	Thu, 08 Jan 2026 14:56:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bs+6EMegZ7sBIXW8gpWC+F/2XhYl02kB+d4Y6kxzrYvg78+10+WVuYij2Ht1kVzZQ/p8JhW4C6dS3tCemKrZA37KhgdaHRmx+SRt1rGmW6NtrRhvJLhA8ZH86WYh7vGTU3UZsW8yOOmkDsbbI4jtL2E03S3jlhEHlbUjZ1fT9mMVS5Pw9Rb0w2g1JpvnrR6QBkPag8CHRfUN2OlX2sdtwWraJfTFNVK5VIFjFh152/CkArKrK4VgcoT9wvzIYi720cdYcG2JvxLL90LddLcCfKhOi02fT3iBjLGKKJONTvM8oJBC2XC1iqEIWUrywCEylF0M8hDhD8G0kqNGqU6t/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8O8G2dLEvwc2seeluXGACXw7T18edGKzfFR/eBu6TiI=;
 b=lfvUuT3+dkopkqaAZ/CY/8+XB4XsPBfNYPJPTALWU3xOw7HE2mx+cvo5xW/j6GQFVZtFjDHJrdwge/3Fo11EC3gDTxK7RWjHlU+q2aBTzY1lL+Jp1Y6pbaEGCHJMTY9e2adLmX2CK1tkOl6a9L5yOwgRT85dOaLt3WYkEz/X0jVg4AOwtSHdeNPJmSy2lNHRhQ5AUysUsR21t0XhkWgros2X9gJp89O4Wapl0ntIaxYekW7QBRCujhbb48ZIkcRHzwvhVo77gGJXCTgFuAmzo4MSyYvY0fIUiaM+lkxcW3+hS7VIZkRo/5gaCdRpuLuJywuSaCbM2vondXamimqVng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8O8G2dLEvwc2seeluXGACXw7T18edGKzfFR/eBu6TiI=;
 b=PqODs0uHNAsWI3HUcCg5UREXeyx5+p8Wot7OVwJA/61uhWICqHgVGwyjb7M8CEhrl0UODbAoo0oRJkelQNBhCTMitxOHn2A+XOk782eecStPhpL+Yw7kAcotFDYDFLdi9lS2LDiH2VCTVhRUVgX0yNA08fXcZVV1+WT0LB2veXdS6Gja5FtK5lEaFKdIyrWyhaVQEQb3CE0UuP9WNftUC66Lg9BGkrzmjV6PkkFBja/4KnURSMueVfRCskGlN4+Nvw9k1vBHk3w/dHAX8P0F3/grY3mX4wjLgdR6S/zOL4lrOuROMpaFlr4aAFTC91FEA+WtON/1crEn3l3BJyKTVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AM9PR04MB8098.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 14:56:20 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Thu, 8 Jan 2026
 14:56:20 +0000
Date: Thu, 8 Jan 2026 09:56:14 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V2 07/20] i3c: mipi-i3c-hci: Manage DMA deallocation via
 devres action
Message-ID: <aV/FjmlCqmfNWHWK@lizhi-Precision-Tower-5810>
References: <20260108080558.21767-1-adrian.hunter@intel.com>
 <20260108080558.21767-8-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260108080558.21767-8-adrian.hunter@intel.com>
X-ClientProxiedBy: PH8PR07CA0037.namprd07.prod.outlook.com
 (2603:10b6:510:2cf::17) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|AM9PR04MB8098:EE_
X-MS-Office365-Filtering-Correlation-Id: c97034ce-ef3a-44de-bb4d-08de4ec6157d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|52116014|376014|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9uwznhl0GeTyIMBEnkJknYqw/Ny6tP133J2N4VYgPErI2GKXt+CoM1F+Dx9z?=
 =?us-ascii?Q?myYXZDRyIUU1eorC35thsRPEdYzIpPthQv5IrxSdWXUiC5KBiBN5BapddQPZ?=
 =?us-ascii?Q?ZtgNRZwUqZvNyNm/IprPQTwkSP2hWaA0RWJ86r8cN75fVMto4oPqvQUeV1Iy?=
 =?us-ascii?Q?tlf3kFBsDmFyGsbg8so7ll03HoAXimHh71bdn++4mvTbseiwj8HEtvijDIaf?=
 =?us-ascii?Q?XXUw+iYixgo52EDXzZ/uTc+W6ER+uaSuXboXUw0Rr0YNwqozroTeH7ltQ3z9?=
 =?us-ascii?Q?CgsxnHRK7z4oRASoJhqmVWjNBQkzYng7Y+Tzq2vUzJYqxQjRUGyL+Qz8owOE?=
 =?us-ascii?Q?bWCAxX7M85UgylP9aoEetLNBk6YidbjPozo3imkliB6vpz4r4BJav0AXUNgx?=
 =?us-ascii?Q?mFuOeOtgMByPJ/Lm3L4M73v+snTM6JgMY8gXl5MeHgBt0GKu7rvUEIpeQ2PE?=
 =?us-ascii?Q?qwycrkiQI6Mt8Dny5fTi3FBV41HUbLD9TMHgmIMjmVcwqa1SMlVqlYKBJ+wh?=
 =?us-ascii?Q?c3Z01+mAS0cdkDVnayN4hVuqVjiLoFEH4FaEBxQlnuY0WlncSOJ3sYTYm3E9?=
 =?us-ascii?Q?fwNtA+f2IYzjvJC7KB9Pxn7JLFL75c32DUKo8yTrErCF4EUIhsC95NSxRjbI?=
 =?us-ascii?Q?4OUL7o1MMCVvff6ge+zCkuJC5Vs/umgmrKfsz6olfppu+rcd3KLfvIbsQttK?=
 =?us-ascii?Q?ZV6QNwXVZ+Vawla/jIVQIDUh1uaVOOphgSu0Cy4QrqcwR3Wl6q3vgxJ8E/pX?=
 =?us-ascii?Q?3v+tx2LSp8NNgr6JYX15vwKePz7zU0WDK3bUl8G/Aoa9sdhKem8rBI/z5OnO?=
 =?us-ascii?Q?VgfA4AoUQirDTbMYiPWnWitwpRDChtR9E9O+S5Bv5HoRL5WTNrHpYjpHAmO7?=
 =?us-ascii?Q?8263pfiyxESZOlkagS9rZnkikedUQIi2IinjqOlhaNtcJl53r949bMfFxhzf?=
 =?us-ascii?Q?8DcyMx2J+UeAmnRwpNDqQ6e2IZD4eDkDFKqxaVnyW5QdDEbkudyotk49MfT1?=
 =?us-ascii?Q?oCju6h01zvB3wTaYXluhYsWWEcV9LNL3NTKdTsZam+89ft9XRFY/ZIk+TI6b?=
 =?us-ascii?Q?Za8Ml5+2QQLXFg6wgNnrzgsQ1PSfrOLWDlfsD2nHAo1g+kzhGU+ru+GioBXh?=
 =?us-ascii?Q?QRuaKfrSXTOUC0bWcq96fLoXS+RwUf2J0cpSs91ApHbU2IAPa2n7zS7YK+5V?=
 =?us-ascii?Q?M09OBrUk7wXOLJfElwVtSvKYpR26DDmGdPkSbj5BT2wyvo5ANGxUtkPlYY9D?=
 =?us-ascii?Q?504D58qZDJGhJyn1/W04XsYGeEakbbzeV0BD5jXuvxfx/P4BbUmBJW32k6bi?=
 =?us-ascii?Q?RRTukTFHyc6I8PxW61INMtb92zNqh4pKfLwOTfgDAn5IRrrjJQ+fRgRx/+Is?=
 =?us-ascii?Q?kdB4W4ra3wxs1bwLhXWtKYYxZpz7++UzI15emjRxZSrhhj1hScpgPUyNO8vV?=
 =?us-ascii?Q?9uXD50q2I8+9Xs6K5maMWT1MiF8TIEefyYuCo0hmGtCJ/j3U1CsyM5pxlcXu?=
 =?us-ascii?Q?Gd/4rU+isk6na0cYvm/1PW95NaVVNgVyRKaV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(376014)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iEUpliHmiGWIDWo3tZe5YXX4DlLhXTQinaQDE+32Z8h7eBlsKrx0ZVF62AHm?=
 =?us-ascii?Q?W3viCAsPb3yNprj4cHoD/+ZZtSnDe9BPqyKmZeddBG9U2LhILjVnUB2Gaffs?=
 =?us-ascii?Q?1YfyWAzdldiYdAxyc4m91x/0XMce0kbXLmDpFzscvUDa2qPs33+Ys9Als+gP?=
 =?us-ascii?Q?EQIl/6HaYrV6N6Hgze7HgQcMyx1U3fxV0omCjwDbx0Y+XXV/OZ6kPe+mVH7C?=
 =?us-ascii?Q?KMTieb2O4vD4T9Rsf5fRRr6oLSx8CrSDAwWUmoUzRbE0z03hjTzljOoZhmvn?=
 =?us-ascii?Q?siNf0MJe0vMmaKGy2xi6BDBkjhRSvV8wsz5YHz5HGqECIz46hQwnCdMmj9Oi?=
 =?us-ascii?Q?t0PaeqYb2tGGSMvpkVoJDCbgkMMXN7+NKIZUENxaP+aZqpDH6KhCU62Um8Jd?=
 =?us-ascii?Q?BY2Q4BDTGfR618or72EtPwAj+i1u6o3tHpHwXjMRmn6pWElDQRx27+iic7JW?=
 =?us-ascii?Q?7vvXeJ8ttoIwR6qgUfOCEzk1P8tWJB43at+E9UmwWI/d9YPynwNy7iEIyoEj?=
 =?us-ascii?Q?dZj5iWlayL+8OObDZCMtM+2u0MQJk3SICgKT8lA7JO4DdMsU/a0bvMGhsg4G?=
 =?us-ascii?Q?o7v33tslMZrMfW455kAbjbW+93hI08N/TUh+tLvz/fNot1itBsKOqu7frflt?=
 =?us-ascii?Q?xveKs0gXbuYGzuZqEMQ8uiHkU/e7wB7L5TrJOgCNpEtLgsKPq6l86jOmTStN?=
 =?us-ascii?Q?4KHVdqcdZSKim/GweDI3PaD2GHl7d7e+/K73bjK+IWTr7suoehNxrV9+WVEV?=
 =?us-ascii?Q?kvnKiCGtRg8piuQlveEnR0vN4z0zJ1PyvQa2sfhSHSE+jgJFKYty2/2xkXZL?=
 =?us-ascii?Q?Dlr7YFIXeKKZOVbKArwQA26hgOkUfm4/pS1TccnW2vKrBlqTbVhsI/91zIUP?=
 =?us-ascii?Q?HfSG0XFTAzK3qjGOIUKNw8TULH083FebkzrTrZbfRHTD8cEDw5s5s1BIMyb4?=
 =?us-ascii?Q?DV7TqWKSaBPhTYPOsO6M5MiXYNtzbLpHnHgyZ7bKnDwBKl3il+EPVFoLQJBP?=
 =?us-ascii?Q?+T08flHoMuHOD1WspO1loTLWKlVFVjKMEL6b1MMIxgdqpGHXdA2bPp/jRiGs?=
 =?us-ascii?Q?H41SvWR2mWufEkhy20P6ZQ8rOyUYPPgaKtNdaeDFYH9BuucNyUr/Gstd9t6d?=
 =?us-ascii?Q?Q48qlqLhsEwxIMzmr6aSZAOjEo7xFKXKX2UHyDTVSh/asW/Pg2pcORpO8/Hr?=
 =?us-ascii?Q?sJmlTE4OGVa8J5UQ6xADcVLFJOdY04J+D86RNgb9FVh3vVkZ7Ps88pgTPcI+?=
 =?us-ascii?Q?U71eK3u8vkQ56/3AWa7C9ybnez4ym3ID1YY9chx7DdWsEiXpT2wnIBg4t2Bm?=
 =?us-ascii?Q?TQrkUpyAKscPJKoXDlLFkSQNCNU0N+57v+GpjEw9WIAtnyLlInCRepOF+17n?=
 =?us-ascii?Q?HrW+eoojkCp2EEO6+i5+MQPP1PQba1r/Gmx36teCkW6DGkk3xzUQXr2tm1p7?=
 =?us-ascii?Q?FlCJv3fmqw8fV0vroxzEKCAJLG9p6vqh2QzkFdkGm61z80WUbpVmpJMgTIow?=
 =?us-ascii?Q?WOyB3bkgqIX6g8hTOvq4Oc+3z/cv2aFAcz8otZfNE7itX6UWRgssPtmQr6rh?=
 =?us-ascii?Q?hBxMalqHQTwwmQbbQgAWUac6i4HDZlgf/AX/tghAQsUNkqe4b7Cf8LPkyTLF?=
 =?us-ascii?Q?KvId/ibWtp/oG0+Ep3KTK8LechDEPjGknHFE4vvsjHI8LM7bm09CIUfgXkAi?=
 =?us-ascii?Q?AIvspOCYgYZEs/xX2fGFlQfZqdoEgjfB4HK8MQs2HISTgdM27DFdSFduVxpw?=
 =?us-ascii?Q?WNgcfwvWRQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c97034ce-ef3a-44de-bb4d-08de4ec6157d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 14:56:20.5448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oWtsLLMnDYWMjwCfeZG8Q+dE8wFbsawsrdhQQRbTq9lNNbPZgpmwYyde8r+yo8WrlSTaAYKypRV/3YeENgE6bA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_065626_886544_140E14D6 
X-CRM114-Status: GOOD (  23.54  )
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

On Thu, Jan 08, 2026 at 10:05:45AM +0200, Adrian Hunter wrote:
> The driver already uses devres for resource management, but the standard
> resource-managed DMA allocation helpers cannot be used because they assume
> the DMA device matches the managed device.
>
> To address this, factor out the deallocation logic from hci_dma_cleanup()
> into a new helper, hci_dma_free(), and register it as a devres action.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
>
> Changes in V2:
>
> 	Move hci_dma_free() below hci_dma_cleanup() to make patch look
> 	better to review
>
> 	Frank suggested using devm_add_action_and_reset() but it doesn't
> 	work because the error path needs to call hci_dma_cleanup() before
> 	hci_dma_free
>
>
>  drivers/i3c/master/mipi-i3c-hci/dma.c | 23 +++++++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> index 54849aa98fad..4999cf3d9674 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> @@ -169,6 +169,22 @@ static void hci_dma_cleanup(struct i3c_hci *hci)
>
>  		rh_reg_write(CR_SETUP, 0);
>  		rh_reg_write(IBI_SETUP, 0);
> +	}
> +
> +	rhs_reg_write(CONTROL, 0);
> +}
> +
> +static void hci_dma_free(void *data)
> +{
> +	struct i3c_hci *hci = data;
> +	struct hci_rings_data *rings = hci->io_data;
> +	struct hci_rh_data *rh;
> +
> +	if (!rings)
> +		return;
> +
> +	for (int i = 0; i < rings->total; i++) {
> +		rh = &rings->headers[i];
>
>  		if (rh->xfer)
>  			dma_free_coherent(rings->sysdev,
> @@ -190,8 +206,6 @@ static void hci_dma_cleanup(struct i3c_hci *hci)
>  		kfree(rh->ibi_data);
>  	}
>
> -	rhs_reg_write(CONTROL, 0);
> -
>  	kfree(rings);
>  	hci->io_data = NULL;
>  }
> @@ -359,10 +373,15 @@ static int hci_dma_init(struct i3c_hci *hci)
>  					   RING_CTRL_RUN_STOP);
>  	}
>
> +	ret = devm_add_action(hci->master.dev.parent, hci_dma_free, hci);
> +	if (ret)
> +		goto err_out;
> +
>  	return 0;
>
>  err_out:
>  	hci_dma_cleanup(hci);
> +	hci_dma_free(hci);
>  	return ret;
>  }
>
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
