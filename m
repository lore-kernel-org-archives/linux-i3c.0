Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B48C982C7
	for <linux-i3c@archiver.kernel.org>; Fri, 16 Jan 2026 15:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m/8FNDOnUo9oMERzEvZFgEwL8Xqe/2Fybc9TEXYg+lU=; b=aUHwX/b+A00LSK
	YWnaNkxMcAqwN1zle9JgKiErRTRFhb3l2SQ7cVNPspDc1ZFBJ+/GN7NhtjOo2+o+uXqeeJ5x47vG8
	XLk4RAITW4TSNRIbVO40pHMx+FQ2jVeM1BmCAuxwaFRYOtlU3N0cMvJiNgEPwGIXLnL7gmIVRnmHI
	Ag7vyWE7WS9/S4nBVc8pUas+bdk5YWOYh9k44PyWdqMBXmtqX57fKn/MuJjixq4oT+qfml6hVB4Lb
	b/XTdzPH6yRcloIPZ1Un8SWtUJDKe7MSQ2ngIa1QX6mIbtLnu8tEeSIEHhGK9tWANhziWlsupH26X
	eNW//OlbgudOgsVgjfRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vglm8-0000000EMjh-1Qln;
	Fri, 16 Jan 2026 15:30:12 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vglm5-0000000EMjF-12hL
	for linux-i3c@lists.infradead.org;
	Fri, 16 Jan 2026 15:30:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PpH9mYAi1orFeuzwan6swAob3BWz9ClkiUrbH04USg+D8fIdRFbrN4mJVG7qWHdXPSH1tnx0EaghpezJENhZJKY17IF9SXX2lXSOFwpo/upbIFzU2Sy9HZyyNoHnrCVav6ydYUblSlCCg+IDt/sM52Ta0eo2qbArM5H+eKA4DeQuEQNxC4vMTzV9riu+ORuUGKlD7koNaTP0dbx6y//5iHw82Hll4n8TiyDCt0yog1ERSmSn3o8jH7xVOln8JOMzl0eWbI9E31ap7B0isjHDeTwqSsECxPCsnUUOGt08drRQGQ3Ihkr5JglaI32ItJp4Uubq3wQ2OVW/4uvUax2yzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VqN/gOWTMGKbpAceKYfCGk3TFVGX1tSwjtzwzIGl2eI=;
 b=pxZ4RD4PFZM4wC4W2FPVs2b0924Ijx3uZ5MpHV5vjlhiTwwvR6RgvKo4W2VBq66x4WeucIS/4Hx2tk+GP76XknSIEEXda7zm8dROB18kuYwtkwHIrp7cJ4sbbslqbjAAeT2xSAqz9Yq1nsNmLhCjPfuvtJoXnjLZN0CRgECRnhg8Vmr6MNb+YHQSqcHwuKRGmfzaPOu+VF0Nk5oWKGdUYDvy2kOFSyDOmBQUll1UZoAo6D3Kmn6NPtZ4eaqC45lgbUEQhZt7vuz8ljtQYPsRqBeWblmUFjo41MMECppxoSaFoKrL/aRyIyfo78WbHBhRrCr8PnPYO97AuMFrK4FxjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VqN/gOWTMGKbpAceKYfCGk3TFVGX1tSwjtzwzIGl2eI=;
 b=R8aPiej4VdsVzfJiEDyuG4n6SFeFIawU2gdbZ4FZBLQO0x73XqUtJGJnzgyQ8kwJz0YYipIOpagZgofrcpjeane/ZFIfpTObWmJmkzDx2/3y4GEmosBbeEt5FLbY01lvLjcQ8rulZzhOpn1I6iOm2vN9fCbxLoqZTefqTztb0k2EAhAa6liiqXvy3O9JxJJtAo9ZvuwzNVd++o/foDuacRMLIlhj0nUebv6LKus5J2uXQlolRR/YL/czYYdI6J9fMCU1Oxzuaj1YaVhNfRJtoiUgUOuCb35tDow6gcChcj0K/Tfa1bMI8f+XIYqdQmGfgJfnJiKwVq7t7eVihD9YlQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DB9PR04MB8377.eurprd04.prod.outlook.com (2603:10a6:10:25c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Fri, 16 Jan
 2026 15:30:04 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Fri, 16 Jan 2026
 15:30:04 +0000
Date: Fri, 16 Jan 2026 10:29:59 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i3c@lists.infradead.org
Subject: Re: [PATCH 1/3] i3c: master: Add i3c_master_restore_daa() for
 post-hibernation address recovery
Message-ID: <aWpZd0t4OMHrmtWW@lizhi-Precision-Tower-5810>
References: <20260116151237.96721-1-adrian.hunter@intel.com>
 <20260116151237.96721-2-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260116151237.96721-2-adrian.hunter@intel.com>
X-ClientProxiedBy: SN7PR04CA0116.namprd04.prod.outlook.com
 (2603:10b6:806:122::31) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|DB9PR04MB8377:EE_
X-MS-Office365-Filtering-Correlation-Id: fc2d04f5-7b2a-4a9c-72be-08de55141f03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|19092799006|52116014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4nD/PRaCQNE8qE9Pd9CNvBuPOeQFI8f7AVq/8ZULhVKeNbkpe8oCkq9J7qC+?=
 =?us-ascii?Q?7cRbzy32QtlyQYoEsaOjTIxSISgJohdo9gNPCsdjNjLQ/IwybcyhRpANQFP4?=
 =?us-ascii?Q?GtkTG1Zrk24qFkoFlrZyeY+CPkQHTljPmaLsX8b0KuiGxxdAQu0j58Stgwb6?=
 =?us-ascii?Q?e+zq3g+9YcaT5635s5N3xzBekB3G++Q+/e5LpTEsemARBPlHkqFfPrC1VhfZ?=
 =?us-ascii?Q?Vqu3FoV1UDs9OjI72gWeDxTb/RyOeYUBuKFvPSiYqcOwjGVt8c5a3ycO4rW6?=
 =?us-ascii?Q?Xk5S6GocE7GkFbruewuGN+noS3bWhg9C0Hhyv3fvwkvtDMSK6gHkLZxVVvOa?=
 =?us-ascii?Q?+66r0JxjgNG61RwEsQS1ksXqFVGng23VFBEsvWmxbow9tFZ7WABKehhJUd5D?=
 =?us-ascii?Q?6oE45zY3apC6EFegXrqocl7lGyzfaQVlSI6q2QQ3i/gJ9UkEB2VCUuCBe18V?=
 =?us-ascii?Q?oLyDCP99f3YkeZbj/buc4gIKRBpNcj6uIOgCj+LfXU+GIC0LdLNlMyPrS9ZF?=
 =?us-ascii?Q?xC3taHsnsUckh2FrG6JBuipA/uw3wu+4bjOGEIAHp9Eeq+itha/NjjH4lOq8?=
 =?us-ascii?Q?74mfAKyMoh4hAk8Wx/3idTu4EkJnMMhe2+Vomc2/8ucjSQlkEDT58DDKokIO?=
 =?us-ascii?Q?5K9aMp07YG4WXN+lIDHLH3dfcdQWTyBuz/0Lh0Nwfo3zECfkMIKeUMnepufw?=
 =?us-ascii?Q?+yfoo8i9Rii6lAxPZrvRfZuS29SqDSC8U2IaD+I/oan6HLfQdF7yhBlnieLg?=
 =?us-ascii?Q?NtN5NCeYELHh357bwMKBQJtnbbqq9zVNir9+MwgYCEJ79g3KfcTd1EHgaCh4?=
 =?us-ascii?Q?+IWiIgV8joVOkFG1UZjyrDIpB3mr860PdvHHl3O4KDJNbKzXhfKNQcXkGMFb?=
 =?us-ascii?Q?lk0hxauqL+jusIZHtquaPgAIrLWIJ3BoEdmFAPj5Ub5NiuiQGielbZxs2kS1?=
 =?us-ascii?Q?039DWR2uZBzQkJcbcSqYOLk0OazzSnI8Eys4UiRtDMtNxzR0nztiJpQengYy?=
 =?us-ascii?Q?DTs27zQ5kAv5KPb+wOazGTnsMSFajsnIiDoP3VLynw17htqPuOvRQgZuzY3X?=
 =?us-ascii?Q?MEjHDUxwpY3E0z03MhOb991G0wnR0qc4uJ/aKQ2fHHxWBSZjDQUTYztzSOsb?=
 =?us-ascii?Q?ONMVI5tHydfwB/WW8xEwYGBNNuII7Bor3NNOS6O09i1kEjxRu0pX7zMxvLZp?=
 =?us-ascii?Q?jk5izpfNuqmATLIpwhbkgZeSsg8PDwy+LxVhG2o25+rF8DHtcDFpAlsYACox?=
 =?us-ascii?Q?7Kc4VYS1sl47KcW4fmY3a6vlAuwnoGSddb+AX0bPMrOuNhcZ0iBUEHFrIw/p?=
 =?us-ascii?Q?Y0H6fzoIXK/17JEfAH8boHCADZmMpyKYtk5ED2FViouYaJNNga4bJ+l6OAF+?=
 =?us-ascii?Q?/ahVAHq772VBZzPPTjfBuAIob/3dKxR1wBdf6qr6TJAnFuxnJKk4U4j73SKG?=
 =?us-ascii?Q?vfm9dcGPq/kHT0/74PZCsC+NvlFQzQfO5Kq9KnKBHE87hwCNawjLtqvXZ2X2?=
 =?us-ascii?Q?ruGi1wVRIxwugzmxow9vl2PRDbKNTevTt/RVcPzIu/0oCdS/Ul9r1B7rnwZb?=
 =?us-ascii?Q?r2R7/mknNA36m2F3qVnFmlRUel9mu18sCSk325Buc6LEjdA7fA2zGWE23SFq?=
 =?us-ascii?Q?j70lvJuiH5+jkdcXN8HGRqA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(19092799006)(52116014)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9mrr5+bOtD+tGfO85dSB76mjMBBqgus/dLalKajTDAp+nmlQRVxnL0WO2t80?=
 =?us-ascii?Q?L8lacaoe7aX8qODti4nRXaWbTfMfwfsolaBLLMTyi4Gt7gT/H8NEXbYCoXpo?=
 =?us-ascii?Q?YKOpXkK0lvq0jCdpDnPhQw561gVxoSmGpcnybMa0Z4zip1dr8dxPvFOebuil?=
 =?us-ascii?Q?WT+OeZsqj2ot5ECdSxBy6HBoLn3V2UFYocp7LNrKyghqlKgYRoZtNpJQnGOi?=
 =?us-ascii?Q?Yte7PA9XMkGmX4gzdLXrTRZ/8wYfoD/I1NJ0vm+hVpF983xMiIQZmLzkv5og?=
 =?us-ascii?Q?MlCnaTVHmDEcCxiv8UPaOXOZmMO1RQsciE0AQIQ1MirKx8VrqMVVZA7Bn5YU?=
 =?us-ascii?Q?opJmvHC5tV//SDScsawee9TDKid/J5ldWE2DJ2N7kqAWG7Ng0ERG8kqLBaPS?=
 =?us-ascii?Q?8vQAJyWl7/S5hqUeu3TwvYZiJKtidQDS8F1y7s/w3izUQeylnyIY6u5MfCtu?=
 =?us-ascii?Q?50e4uXe7gHx2GMJ98mzTSXq5vrhD7CmaPiW/AOBhPLuObxrIDWcHbgxZWe0x?=
 =?us-ascii?Q?SbYGmhSHgnMFikC+5l5ZUh9GzOWNwaPEcCrti3an26WEBWGhNoD5azV2pvK5?=
 =?us-ascii?Q?uAkewv3iLvhirJ8m37NeT4vZGiabp2LB9VwS92z7wznqpF1E40LZag3+iX1C?=
 =?us-ascii?Q?JncmCRQBIInRGhxN1MQLnAHWJZcrEpUvktBzcXD+Rcnj7w119iQlYtqRoboQ?=
 =?us-ascii?Q?VOMo6qyfh/skLlBReYgilibaEapbA1kJ66/jo6bgGhHzTFf4I3fCy5MJY2kr?=
 =?us-ascii?Q?hKqiql8eubi4QqwPy6fblgU98XOESP4Kdzhcnpz6CYrpLRjA7VL8f9OS0bP4?=
 =?us-ascii?Q?/zv8NPxCNENv667L/OfAqb3fOTqKQbBSF/2TgPntTI/A2+mtDWhELV8F/VHx?=
 =?us-ascii?Q?If5zZeeMx9mk8VnYmHMizyfbTb+OEhp5uOORtuw5jDWLQ6S/3l8b0e0/0HtO?=
 =?us-ascii?Q?XC9Ali+72wFCLRx6EM4A9MDWGSnpjsjrTg76yA+jTOb1j3yftvfAsqGg2H7y?=
 =?us-ascii?Q?szCLSg8f+blHd9FDUreJBO5vQhCaWgntfyZ3NtiB99wwQnf6FdQUJ5UoNyIt?=
 =?us-ascii?Q?X5BmOnDIq9pRZVv38TdwLu3PtiBhNX87wQe0IWFOUxikxOpyZiOJGaaSsGRx?=
 =?us-ascii?Q?hQRbtFR3Cw1rfkLqLpH0x3w4+Tzkz5AQCBHP67JWQf6A6QbdrQyZmCBmxUGW?=
 =?us-ascii?Q?badfScw+Ry9aoU4WBPduLWvMdMaRQyDqQXMqv3fdaCySVYhV+ha3aLx2dpBk?=
 =?us-ascii?Q?Xug9ieMVb8rDMILnMBjRD7IJ7YvxqQXjzn6oPyUrZHFbcZe/M0kOpt/RaG9e?=
 =?us-ascii?Q?3ozVefQD6YcUc+BKL57ZO6AUqZoQ2/yj9ojb+2Be7ala4RqWWqlzKTY2hEOo?=
 =?us-ascii?Q?6iOuqO+UAJDxGv6PQRJgRgHkGovtwKIZ/SEHdMCnZgyYWEQHst3A2ORlHXG+?=
 =?us-ascii?Q?6HldEv+iu+yHQyRvPhdW9FaUl5UqRXY0xrjDts/iqp+8fBkbyxmfy4/rrREN?=
 =?us-ascii?Q?QAE7dfpo3s80pKYvhHeQbYK6uDnsadvhPz6pqDu5IlwKJSfFafvJAWhPWKud?=
 =?us-ascii?Q?O5tn6WJA6ZcUTjdLFQparhAuU4FO3IXCnH8+o0SGfFC5Tj9oKqzl1dTj+HsF?=
 =?us-ascii?Q?xX0i+QjC91js1FkKtet7yvoF2+tFcjh683Ss2+65RCB63+OY7SwJcct5Nd2i?=
 =?us-ascii?Q?NA9KT7M6TSuZvuVpWzikEAqW9yHxweFTVkSySpHcWVZubM7j?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc2d04f5-7b2a-4a9c-72be-08de55141f03
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 15:30:04.2641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2QaeNN5heuHH/1sMaQlUoZ57meSKqnLc7zxfEX4PlFLIRISk4zdLkjxx1qZe+W/uYSoXKMGODkbM+wFjZ4rAvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8377
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_073009_317769_E40A2F37 
X-CRM114-Status: GOOD (  30.35  )
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

On Fri, Jan 16, 2026 at 05:12:35PM +0200, Adrian Hunter wrote:
> After system hibernation, I3C Dynamic Addresses may be reassigned at boot
> and no longer match the values recorded before suspend. Introduce
> i3c_master_restore_daa() to handle this situation.
>
> The restore procedure is straightforward: issue a Reset Dynamic Address
> Assignment (RSTDAA), then run the standard DAA sequence. The existing DAA
> logic already supports detecting and updating devices whose dynamic
> addresses differ from previously known values.
>
> Refactor the DAA implementation by introducing a shared helper used by both
> i3c_master_do_daa() and the new restore function, and correct the
> kernel-doc in the process.
>
> Export i3c_master_restore_daa() so that master drivers can invoke it from
> their PM restore callbacks.

It is good. I3C Hub also need it.

>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
>  drivers/i3c/master.c       | 60 +++++++++++++++++++++++++++-----------
>  include/linux/i3c/master.h |  1 +
>  2 files changed, 44 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 594d61edcef4..1ba5d08365b4 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -1734,23 +1734,9 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
>  	}
>  }
>
> -/**
> - * i3c_master_do_daa() - do a DAA (Dynamic Address Assignment)
> - * @master: master doing the DAA
> - *
> - * This function is instantiating an I3C device object and adding it to the
> - * I3C device list. All device information are automatically retrieved using
> - * standard CCC commands.
> - *
> - * The I3C device object is returned in case the master wants to attach
> - * private data to it using i3c_dev_set_master_data().
> - *
> - * This function must be called with the bus lock held in write mode.
> - *
> - * Return: a 0 in case of success, an negative error code otherwise.
> - */
> -int i3c_master_do_daa(struct i3c_master_controller *master)
> +static int __i3c_master_do_daa(struct i3c_master_controller *master, bool reset)
>  {
> +	int rstret;
>  	int ret;
>
>  	ret = i3c_master_rpm_get(master);
> @@ -1758,7 +1744,13 @@ int i3c_master_do_daa(struct i3c_master_controller *master)
>  		return ret;
>
>  	i3c_bus_maintenance_lock(&master->bus);
> +
> +	rstret = i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
> +	if (rstret == I3C_ERROR_M2)
> +		rstret = 0;

looks like you missed check 'reset' parameter.

Frank
> +
>  	ret = master->ops->do_daa(master);
> +
>  	i3c_bus_maintenance_unlock(&master->bus);
>
>  	if (ret)
> @@ -1769,10 +1761,44 @@ int i3c_master_do_daa(struct i3c_master_controller *master)
>  	i3c_bus_normaluse_unlock(&master->bus);
>  out:
>  	i3c_master_rpm_put(master);
> -	return ret;
> +
> +	return rstret ?: ret;
> +}
> +
> +/**
> + * i3c_master_do_daa() - do a DAA (Dynamic Address Assignment)
> + * @master: master doing the DAA
> + *
> + * This function instantiates I3C device objects and adds them to the
> + * I3C device list. All device information is automatically retrieved using
> + * standard CCC commands.
> + *
> + * Return: a 0 in case of success, an negative error code otherwise.
> + */
> +int i3c_master_do_daa(struct i3c_master_controller *master)
> +{
> +	return __i3c_master_do_daa(master, false);
>  }
>  EXPORT_SYMBOL_GPL(i3c_master_do_daa);
>
> +/**
> + * i3c_master_restore_daa() - Restore Dynamic Addresses
> + * @master: controller
> + *
> + * After System Hibernation, Dynamic Addresses can have been reassigned at boot
> + * time to different values. A simple strategy is followed to handle that.
> + * Perform a Reset of Dynamic Address (RSTDAA) followed by the normal DAA
> + * procedure which has provision for reassigning addresses that differ from the
> + * previously recorded addresses.
> + *
> + * Return: a 0 in case of success, an negative error code otherwise.
> + */
> +int i3c_master_restore_daa(struct i3c_master_controller *master)
> +{
> +	return __i3c_master_do_daa(master, true);
> +}
> +EXPORT_SYMBOL_GPL(i3c_master_restore_daa);
> +
>  /**
>   * i3c_master_dma_map_single() - Map buffer for single DMA transfer
>   * @dev: device object of a device doing DMA
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index c1ec597f655c..ea757b92e440 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -598,6 +598,7 @@ int i3c_master_get_free_addr(struct i3c_master_controller *master,
>  int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
>  				  u8 addr);
>  int i3c_master_do_daa(struct i3c_master_controller *master);
> +int i3c_master_restore_daa(struct i3c_master_controller *master);
>  struct i3c_dma *i3c_master_dma_map_single(struct device *dev, void *ptr,
>  					  size_t len, bool force_bounce,
>  					  enum dma_data_direction dir);
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
