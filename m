Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A37D7879C
	for <linux-i3c@archiver.kernel.org>; Fri, 19 Dec 2025 16:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k946M8eBns33MOglbmAfW4wWryQXxAwZltSimMjYIUc=; b=JryHW/rDR2W53H
	1WPNJZ3HgrisQrwvrb29yU16wdc0VDhM0F7CRTS2A0Eu88a/DScDAAwhB2UDhnQ8LHrcX+U+FSHzF
	z6A1XXsrxa5/TrHlnlroOTL/Sy5AatCGSN1MZJBS2CDRJUCu7RLco/XvZk943KMAzh1HTn18Q4lqa
	voBGRbe2xhh8d1ZVPIMep8pB6ajUYA4ljLGOFX3t8Ma9Y3PLFMt66O5jwJ1t0W4DrLjRRlpJRMcqZ
	HPkW6CDJ7nqIxPsIW35LCRIl57Mh3RYkXv8gwIcyoUBv3zQO0fBU20IZDjfVztSUDx2WJl0jRgJG/
	ZQDkFC3MG91BfDnz/FMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWdT1-0000000AetK-0ccb;
	Fri, 19 Dec 2025 16:36:35 +0000
Received: from mail-westeuropeazon11011035.outbound.protection.outlook.com ([52.101.70.35] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWdSy-0000000Aesj-18Hk
	for linux-i3c@lists.infradead.org;
	Fri, 19 Dec 2025 16:36:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oTUZH9m1rSJix8g/AFoCoCUfv61B7N6vODXxRiC1YtuWQmbr9Hk1CemttYprbCzwOfACD8AlabbJRmgiv+V2WZ0oVtAXMP/TYLQ3T4Yo51JXYqASDzrPtmGXWMMeZSnJhuw9HfsrLX+lXxw1BD8TDJIPRsNig407Mhmt8M0MLaNnL0HeGgp4NE5xuoeCUiQ/hzvMtiXSCEUUDLCnuQ23Jju1uhvuyN9EDbDAM8NIFUeTP0ZlLpV6eferDrwxja62CF/SkCQ1f44+Xoz2Ze4CYjXpFw8BZiW2ajeurd1fZ+b65fcXe/BcgiSss2MlYgknAOlSRfFGvmi5EgZ9GpsYtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aRZhlqZw84u3EZuuZoalvpzfNTlvO96JGlUBun4gyOg=;
 b=qFeMlvxkCjT8OjoWyHzaeZ+JojGpDKANZ1Tk/Ylq2giKv18GVqZNiWHCH2UzDV0MFddKDQupVcU4zsQnZST4mYxjQ02K6KRcwXTfkwrgIh3UwKdieEeR0PwOkbR8CBfPI8eiGYFTmGlxbi6OEtr7XOBpwLJ9Zi6KzbqIFTSbGQ2E0BwTCS6lqlIshNJv6AsPlgLVwvkP3E4PRTiExvTDXr5IRCxPNOrxsiZt5Fk4QHdtLsJdvLDw+pp+F62z0gkiAbGvgz7Gl2u9P4LF2CzxE0+WqF0grmXNWpf/TU4g2OxXYF9tkOve/W1vQ7sqEKNxgnzKUwNb1MY7AgYuv+vRIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aRZhlqZw84u3EZuuZoalvpzfNTlvO96JGlUBun4gyOg=;
 b=TQQdW/A0wfEbZ3aQzBs1hgqyL63IrGPTUarF8AERcclEOYMIkvbHl7JkQd+WNPq1EpKTfhSjNmzgKx6T++eLEO8OItEQU45hPY9UlUEHxR0I5SsWzgSZ7nOf27dLqArpLwRSCULwZ0CrNVO80Rj1rxZ2DPeBg1+1fE8VJJKrwffLDGsthlIKtrfk+Y3WzCllYAf7qLusbCFJYViGHqFq1zCzFtMrIvp1QRwgCQQupkKeO5Xel1VdX+AI2Dw/JxUmsPRM15yR5lhVrYpsbX6e5I4qOMRGnHtC+TbFgNsxOedpyBIeGH7PDWqJy90L0hpGZQ4zGmpXHgvJ8HnTjFTnNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by PAXPR04MB8376.eurprd04.prod.outlook.com (2603:10a6:102:1bf::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 16:36:27 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 16:36:26 +0000
Date: Fri, 19 Dec 2025 11:36:19 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>, linux-i3c@lists.infradead.org
Subject: Re: [PATCH 08/17] i3c: mipi-i3c-hci: Cache DAT in memory for Runtime
 PM restore
Message-ID: <aUV/A+SehdunAW5V@lizhi-Precision-Tower-5810>
References: <20251219144534.84391-1-adrian.hunter@intel.com>
 <20251219144534.84391-9-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20251219144534.84391-9-adrian.hunter@intel.com>
X-ClientProxiedBy: BY5PR13CA0031.namprd13.prod.outlook.com
 (2603:10b6:a03:180::44) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|PAXPR04MB8376:EE_
X-MS-Office365-Filtering-Correlation-Id: c7e3454c-0b2a-4aa5-4bf8-08de3f1cc0ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|366016|19092799006|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?axYioX+Xi/M5qnFmOOgcnhwyj8ZL8nqOEp0Wjr62XHIMJkr1VBhVEoo5caB7?=
 =?us-ascii?Q?TU/QhQU4LA5Ez9W6Fx0TBEQNj0f6jF7Qe4p63taDYyB00VMyojSlIT/VqRsh?=
 =?us-ascii?Q?VCMs5gQzIjXs7ZAM64UWtBPTZoDqyb4IqlCmjdcTWtGO8svVVsS8OTVoPrGj?=
 =?us-ascii?Q?CYeFtWSURAmOqfnlMwAGC6wVOF155qfK9m9maZJu6ezn1Q3mn6zEtQy5Pm2O?=
 =?us-ascii?Q?jbWKryZpFw178IEDm6jwRjWVuPd/E9KM2o4m7Iqu2gG2yypa16XLVRMz420X?=
 =?us-ascii?Q?qtWxnm6Je6TAIQha8QuAEZIb0yWr4wiyKKaLNIzTbfZnA0yfflaGfCjfNnws?=
 =?us-ascii?Q?NKrMIlJwxSvtX5cHZWHi8M1iqGnQP2F3Y76RzqDO4Gv1mOG+9/qZsqz5RQ20?=
 =?us-ascii?Q?hNQ2dOlr7kP9siAao+Iwh2AB6eYOFTpHwpe971XvyejZamM/ba4KFblRvvCf?=
 =?us-ascii?Q?5vlc6T5do0UmnQ09kwJwKi7mk7AcIYUVXjPiogxUBwyb47rgeUXYkVrOzDwN?=
 =?us-ascii?Q?89C/6CRd4yXeVuAYxz1/GjPObZ9UsvDeI/wfW+GjQU+5MrwTIN63gnDp38uu?=
 =?us-ascii?Q?k0hDyhxYpr67HvRZJH40MoaM45CnRFupYoJiAq54Uxq7hNDmNSnjg4MQXAtf?=
 =?us-ascii?Q?yUNzks5pHYLmlXeRsQbVkY4RbORF1AMHrR7aw5LD8Z3oYo3jvf7nys1ZZX9U?=
 =?us-ascii?Q?rfxJly4dwpch4uRwQc6mtHp3SqdC3Jd0D6+COLAVs7+xwWa+XfzipeDjQAKw?=
 =?us-ascii?Q?ADX+EoznmyA295pGnl8o/jODehWIZX4iCZUJau4th0QeWLRchxZgEOugIqMa?=
 =?us-ascii?Q?QGDm+L7xZdD+2e9e/fIIgMob/7046RH6VoU3VyY0J/XcFuAHJ8ziEIJq1+Q2?=
 =?us-ascii?Q?sY0gL4kQZys0buXJlcEnNgiiVtKwZw7UBjo46zWbvueUm6obhCPJ5n/IFPiT?=
 =?us-ascii?Q?82Oe/4stSOgf2uj8LpWOiRMLPT/vjhPzJ/9IFOrA1hoaCkKJQ8kEBLw3nj7S?=
 =?us-ascii?Q?m7fQlA6YM/u9qzwBPekVTNMUFQyYI3yDiShqpeVS+aCmdHQn4/fjftLz1HlB?=
 =?us-ascii?Q?r6Ds4Eu5cOdzp+m+EOrxp0jBrJues1H4R/ABCdnBr/gUqZySmS9rJWfPW1Jv?=
 =?us-ascii?Q?Y0bie2CXt3ODES93EK7IkqyF8I98VS0oGt1mMz9DjQaxAJZ+Oj+vEos6YFWT?=
 =?us-ascii?Q?tBeqfc209wpvT8voT/RazgI+hgWjqkd54OOBY3ziQCpyn1Z+lRbEXKDbm2F7?=
 =?us-ascii?Q?uRsnsxDLre66RmNwIKVaqjrLJNXk4F2KMh1DP3GcG16AWJeROm0pwcgGy851?=
 =?us-ascii?Q?ALTa7tpy1wgdXtusKsxopsyPGbtG6xg7QvcZ27AqHmRNHLlxaLOdtHebKdra?=
 =?us-ascii?Q?95qYgcxNivIs9qQ52vNYyZVuWfwUqbKSqBCunSY442/Qcu4Np69cIeejOdi6?=
 =?us-ascii?Q?q930xTZGFdAxjzxok/9vWB1kzHYVBYTM4xCzWAtBJa0b48e1daXVRO79c81i?=
 =?us-ascii?Q?1x6eYUoMGxJbGnChNwCaMB73PiSuzxOJHmE0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(19092799006)(376014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8MT+x+vfjcayFyBWMHcKRmKwSZg8rPZ8n1L4yeCKnKGLT6p27drARULW3oJM?=
 =?us-ascii?Q?TtQbvx2SXHN3z0xV2It3LqB9Amc3Z3AsbnjPjuCWosUmu559FdNoHfV0tq6B?=
 =?us-ascii?Q?r1MA7MAuHTAkkB7+P3rIkd2wJm+1ZFJRUPwpKRAfDEzNKZ5Om+pzKSiXDj90?=
 =?us-ascii?Q?kwqowHOjU7mGJj0yoiSpGxXCgI9RxoyVSeE15OSR6cBegk3ppGH7GeD15yxj?=
 =?us-ascii?Q?9GQrbGcSimGTmm12NEWaQ59K/5a/RFNqefNbOuqDr7buyo0gkkGHczzHAK6T?=
 =?us-ascii?Q?ZNZH0UjtPTahRgtWEjd1vPy1CA9REVu4Zex+9jeUVdqPw/ZAiocAqeUxXPOs?=
 =?us-ascii?Q?46IynFk706BoqcuUQ7Y+44HDvmIFt1mlYh7yN5uUQe4qJN1RnzzfY/oC1O/c?=
 =?us-ascii?Q?QIiW4rZc6baZahuwTW688eKrnnnWFEVpFlFSCNoYqjn9BMH5rRzAG1+Q9Zw2?=
 =?us-ascii?Q?tDfIQNwtoJSVFr0kwfv6gii7kEgb10VrlKBAWz60RgnajhUwrURd/qx17yBi?=
 =?us-ascii?Q?U6Fs3VVRlvl44nYuN5mbVwZvbmarLcP2uUwxO6PJsGThxLqrh+E+2XafZFe6?=
 =?us-ascii?Q?oBBqVfGrnOjN4WZBiO9S29oCa2r4l0fyaarB1kyYP7HQFDP0ksBbKpEMUei4?=
 =?us-ascii?Q?yF0vlngyEpE5VpGVlKs5ZCMpgL/zmkHpAF7Z/tenk0UHE/rxRBQ+tpmna8wR?=
 =?us-ascii?Q?i/x2MK8fh2CZgS69esWBMixz2fQhD4ofmVe/6Q6FWL3frf2dbzXLf9tcTNi1?=
 =?us-ascii?Q?9zGLm6vcHbS2lErld2qEKiFDZzqYOF4Ilom+mLK6yrJzcSOgGJGW06OwOu2j?=
 =?us-ascii?Q?dOGd0L1Wn97ur7GK6jIBswlsv5Gw98FQ98ocW2XEhBBOtA1VdpOqSgz+cffQ?=
 =?us-ascii?Q?03fP/nWD53647V+AXW52/r0Pm+zkSPHjwEjxP19Zfga+rcT+FpcyWc4Vr28E?=
 =?us-ascii?Q?Z+biXhuDfKm/L9uTPcU4/RU4jSYXnfnwmujfSGqbA6MBFJvhr9cyELg1IQna?=
 =?us-ascii?Q?vCR23B9GtnkPY/2ocqdYIzhcNENCNVLfmnZURaXPtverYwMebc/wsKLsn78z?=
 =?us-ascii?Q?1EC7QOLzIXnii9Y5MX49+qZhgmaQwTna1av7N6bXvXlzojN0vqm3sz7WuY0Y?=
 =?us-ascii?Q?lEQXq1hUHyie69twklXvahjqpGrtZActzomxY4R0jGpH/hY3bffJa+r1ZfMX?=
 =?us-ascii?Q?LkX2FpTajrlh28VOCY7UI4dFZhXWYIh0c5ysRMZnl6KyrADsDKyTXGelbk40?=
 =?us-ascii?Q?xR+KV2j1pXM8hoQA8f+IVHxaX4y51LUKkO2Km6zES7z/MguLc8CNDhYDGHf/?=
 =?us-ascii?Q?DiShXyokz6MCZocJlZZwPERxoF1BtvNIEwz7ysnD7IggZscwjy+KdLAI/30f?=
 =?us-ascii?Q?6sZ3jpPlMpaPHyJhrHdGe4Md4fE4sAO8YH+KPCMGS6GwSkqPWThDkPQ6Fr1h?=
 =?us-ascii?Q?2C/i2tnopFbQa6yz9oACI4xKUvha67L4p70973v9A1mC+Xpd9qtMWG3a3Zm5?=
 =?us-ascii?Q?dYhpFTyypibK7itzlEQ5IRPgl8zZtdNHi6Sc9Ij+emAsA3jRbwEi1l2bI9Zt?=
 =?us-ascii?Q?WMzocqqpmMYMqWiz5pZY8rgof13+mpI4rW/m1N7F4lHsCohzKPo3xtDl17kE?=
 =?us-ascii?Q?O5DSQ1G7QcociiQ43qUfCiRv9I8POcFWDV94ZaMUCZJzc5i1TKvJbDh+geVV?=
 =?us-ascii?Q?Y5GWx+ygai71x2llgpuTn3qLSzjFp9Vwk6tEiPV+xGSMs/5NRLy6OFV9Y7i+?=
 =?us-ascii?Q?JrYL8tYL7A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7e3454c-0b2a-4aa5-4bf8-08de3f1cc0ee
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 16:36:26.4534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uMzu8eb5Vu7d6LGbAI8NjBOeP6MchUg2lv6pLY4Anguw4mIMJxg9XMOyCEIsZupwQiPOa9+OKJnH/TUMQrSicA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8376
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_083632_322830_4907D475 
X-CRM114-Status: GOOD (  21.75  )
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

On Fri, Dec 19, 2025 at 04:45:25PM +0200, Adrian Hunter wrote:
> Prepare for Runtime PM support, which requires restoring the Device Address
> Table (DAT) registers after resume.  Maintain a copy of DAT in memory so it
> can be reprogrammed when the controller is powered back up.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/mipi-i3c-hci/dat_v1.c | 29 +++++++++++++++++++-----
>  drivers/i3c/master/mipi-i3c-hci/hci.h    |  6 +++++
>  2 files changed, 29 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
> index c60ef5d77ca3..644ab939be1c 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
> @@ -34,13 +34,26 @@
>  /*	DAT_0_IBI_PAYLOAD		W0_BIT_(12) */
>  #define DAT_0_STATIC_ADDRESS		W0_MASK(6, 0)
>
> -#define dat_w0_read(i)		readl(hci->DAT_regs + (i) * 8)
> -#define dat_w1_read(i)		readl(hci->DAT_regs + (i) * 8 + 4)
> -#define dat_w0_write(i, v)	writel(v, hci->DAT_regs + (i) * 8)
> -#define dat_w1_write(i, v)	writel(v, hci->DAT_regs + (i) * 8 + 4)
> +#define dat_w0_read(i)		hci->DAT[i].w0
> +#define dat_w1_read(i)		hci->DAT[i].w1
> +#define dat_w0_write(i, v)	hci_dat_w0_write(hci, i, v)
> +#define dat_w1_write(i, v)	hci_dat_w1_write(hci, i, v)
> +
> +static inline void hci_dat_w0_write(struct i3c_hci *hci, int i, u32 v)
> +{
> +	hci->DAT[i].w0 = v;
> +	writel(v, hci->DAT_regs + i * 8);
> +}
> +
> +static inline void hci_dat_w1_write(struct i3c_hci *hci, int i, u32 v)
> +{
> +	hci->DAT[i].w1 = v;
> +	writel(v, hci->DAT_regs + i * 8 + 4);
> +}
>
>  static int hci_dat_v1_init(struct i3c_hci *hci)
>  {
> +	struct device *dev = hci->master.dev.parent;
>  	unsigned int dat_idx;
>
>  	if (!hci->DAT_regs) {
> @@ -54,9 +67,13 @@ static int hci_dat_v1_init(struct i3c_hci *hci)
>  		return -EOPNOTSUPP;
>  	}
>
> -	if (!hci->DAT_data) {
> -		struct device *dev = hci->master.dev.parent;
> +	if (!hci->DAT) {
> +		hci->DAT = devm_kcalloc(dev, hci->DAT_entries, hci->DAT_entry_size, GFP_KERNEL);
> +		if (!hci->DAT)
> +			return -ENOMEM;
> +	}
>
> +	if (!hci->DAT_data) {
>  		/* use a bitmap for faster free slot search */
>  		hci->DAT_data = devm_bitmap_zalloc(dev, hci->DAT_entries, GFP_KERNEL);
>  		if (!hci->DAT_data)
> diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
> index fd08b701d094..aa8a03594e64 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/hci.h
> +++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
> @@ -31,6 +31,11 @@
>
>  struct hci_cmd_ops;
>
> +struct dat_words {
> +	u32 w0;
> +	u32 w1;
> +};
> +
>  /* Our main structure */
>  struct i3c_hci {
>  	struct i3c_master_controller master;
> @@ -51,6 +56,7 @@ struct i3c_hci {
>  	unsigned int DAT_entries;
>  	unsigned int DAT_entry_size;
>  	void *DAT_data;
> +	struct dat_words *DAT;
>  	unsigned int DCT_entries;
>  	unsigned int DCT_entry_size;
>  	u8 version_major;
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
