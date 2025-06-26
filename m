Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3BB8C7EE2A
	for <linux-i3c@archiver.kernel.org>; Thu, 26 Jun 2025 01:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D4CrPVNEghIGLCoYruumsko7RMnP7aiyxfXZOUDgzkA=; b=KIEkHfR/wJcoa3
	N46fN48pHhzVTa0l8sZuJ0TCKGjk/CFmfq9LsTEy+XEQNtJ7L03x8F3+re2gZJAf2kl3gvPp7pRVo
	FJ2LQimrsCRN16/0NB2OacFWdZI8GFSiF57Dh4FMysNzut5/8DLCY2WQucPOSqAArjRgIVNMxPV3w
	bvXYWjcGBTH37S9o6PJ6t0fs+fk2iJAXtMAWSjtAGM5/ThisYnLMnR+dYeGbluOiQO3KA6NW9S+jO
	7fCRMFNURFG3kXzmkQErY6GbBPinUFH/6U440rezLlbk/iBnbf2Y/0Ph547XOA1qecYSljb6QxoVb
	NHH5KmLyHP0IPDZhfw7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUbYd-0000000APNG-1hjV;
	Thu, 26 Jun 2025 01:37:43 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUbYa-0000000APMo-3c4H
	for linux-i3c@lists.infradead.org;
	Thu, 26 Jun 2025 01:37:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tUwOmYx6Qw8jRSBel9AHN/xEtzUwjb28sh3mChZ/AcjslJ8i69reRQ6yiQp3E8PoZDDAFNMlj6NRKHMgTOXpByHWCJ/7yK/8vReZpMT3pP88UChH7G2NMUFN0gn+JOTNkrNMxQ+zywttOVtGeKVOkCg0BQ4n56xYrlkMyQyyAs4vglkxiuGtJ3Eyj41HNICjayWJCZ+jSTKGQ7bau3TuRrU66IpttlpmnjSmFhRYYdLQK2wVYW4p9dCxAwo6nTfRIlQIrMfD0GtogEMbUbliNOCIEEn1f8VqXJoiAyB0K6uOrC5GAy76zEBPk017/Ma3eakXqJxRvXb/86ecVAtQfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ecd1bjD0ONYE8/Lbxr1eFevLKItF6FTN/HpHbdMu1A=;
 b=PvWzyMwgbKSDOMV7MLursX3OLxfuHfK65TEnja+weKjC6l7r4KphHW6m8rwWF51dHD+gp+FJtIf3eFw/Fmn4EdKMN/cxNGPvuJH92dhEGVdBV89pA7DC2xLAYSY3qUd3asSdgKF0X04EW/tgwMbUCRDUMoLxTICUdJp+H5TWxC3KEj7HlCchvT6NciZFxMF9rQdMxU8Zx4qd7OHtpmLFDP/yy/hjT1zrT1yfB6QGrNS3LlFEFeKpbnozVEYLG1luyCuFKUlXHksEEUHbS5p1zFo5fE0L9Fyczf+irVHjVd92pGl2q1HGT04gaZk6nTYJeWPkFOknTgZkv0XH0fOcsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ecd1bjD0ONYE8/Lbxr1eFevLKItF6FTN/HpHbdMu1A=;
 b=MYcu6IeywKaM8Zrmjj//9S1LjXUn3233R5m7P/j9LYwYJO5Iv+IKJr3h/6n3Cs8O/blUVeYqd+QtLtmEG3Tal0I7Z/zv8IIDhSwDLom0knsRnlZuCzRdfdg6rG/yrEKz8/Jw6761bz8jvM+IRYcTncJpfFqo3DJbLu+/O7mBV3JqbqtPTDlDb27rOa2W8Sl180Mvf5fTzaRq/uqm2tVHsmbGZVkqTTj3RsnrFcihtj9Nj4bAWQ6kR7iYL28XpZogcryJk3FfUjKWrDujOpq5gRuFnBJRDWrUsERfCw1Okuoz1LfnbfNXL3SQ981ywXJFcVYTIsGAWwEiRI0xMsOB5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU4PR04MB10339.eurprd04.prod.outlook.com (2603:10a6:10:565::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Thu, 26 Jun
 2025 01:37:26 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.015; Thu, 26 Jun 2025
 01:37:25 +0000
Date: Wed, 25 Jun 2025 21:37:21 -0400
From: Frank Li <Frank.li@nxp.com>
To: Rob Herring <robh@kernel.org>
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 3/7] dt-bindings: i3c: renesas,i3c: Add binding for
 Renesas I3C controller
Message-ID: <aFykUQR4ZOJ6pm3/@lizhi-Precision-Tower-5810>
References: <20250611093934.4208-1-wsa+renesas@sang-engineering.com>
 <20250611093934.4208-4-wsa+renesas@sang-engineering.com>
 <aEmjbY8ifoI5Cs5t@lizhi-Precision-Tower-5810>
 <aErkyDQvV3C0TZSu@shikoro>
 <52401543-28df-4f13-8b7a-6463fe54cd5f@bp.renesas.com>
 <20250625200451.GA2117971-robh@kernel.org>
Content-Disposition: inline
In-Reply-To: <20250625200451.GA2117971-robh@kernel.org>
X-ClientProxiedBy: AS4P189CA0037.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dd::8) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU4PR04MB10339:EE_
X-MS-Office365-Filtering-Correlation-Id: 06e5723c-be32-4006-7116-08ddb4520128
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NKXIS2E1E8mN4dFZPaGsJeD2i4x4EGbPBiqzqs2BuY8QQQpIfmSBh0BNyQyu?=
 =?us-ascii?Q?Dns5LcsvBY9GY/8hk4EWoux2eUXi/2zqltJWX95dmFdPVw8RhywJrD7C2WYV?=
 =?us-ascii?Q?ojNaNI5nn4YO8uSu8RNJWLxApnCtwWraGQETNaj2O4dZrrttuqkRIuZqWp3I?=
 =?us-ascii?Q?DGLwCoQFWE888InmKKK05qkxU0GunenE4x3Xb6J1XYalY7ELBbnUw/3I1yuv?=
 =?us-ascii?Q?jTTkcGi0qMCjJ4tpHG96r49J8NYhPjbTubaMss84VNUOvuiY3B/i65HKYJHw?=
 =?us-ascii?Q?zx7z1QwFWnrLv72glGQmVp4ZJiU+FkwZXPVj3LGYBObVdn14CPF+BMs7M3Pf?=
 =?us-ascii?Q?epAThMSthF+pZptUmzqBI2XQnXnGdmUslwvJ7ouejFi0GcHLQoaTI4y5C8ai?=
 =?us-ascii?Q?gvsRg+/gOuiTlgzIJhGRvhkeChVrViBs8JCMWTV6kKNog24lwRzQ2/smxJgE?=
 =?us-ascii?Q?59CKIXIFg6+8X+aYkl1AhccaY1XOv2S6p+og+jwH0GaJhLfVGvUBaIJO8a36?=
 =?us-ascii?Q?WeGRls8300C+RbIKlBJBu+rx6Cq+cKMmXiBeAGT7qyZyf6ryURgJh0Bd4gbU?=
 =?us-ascii?Q?oZnrINkPWQeFaX6BwcQKPR1om3J08KahGWz1nFZI3kyg5WeOwNDtbGnwPrrA?=
 =?us-ascii?Q?/1+sytxZpDNOQM3eD6JfDqvZsbRsne42xLdwpbvifh+w4H6g8l+likbB+Wym?=
 =?us-ascii?Q?Wzo9amoEEOgLLdT/4CJlZ+rjc/mvlEKIaNJYvwm/I6VXogeYvUXCEhhd50xm?=
 =?us-ascii?Q?I+xkvjFpzUoX5cOX5Ho6T0IqtFHiCydtiyl00V8tCBMZu/BdeuG9FDKi1RJf?=
 =?us-ascii?Q?D5OZ1cvuevjF/7oACIuA7CP/Urjup0Y0XJoRyyq5NzUq0cRrKMJp/QCV4ARM?=
 =?us-ascii?Q?4zq9rI/ULEHQIeDSzzwAQbDpdmsuRrsadSeBe/p4SjGHi7Y2qvMcND7yDPTr?=
 =?us-ascii?Q?4dNLmlB3H3U2MXq8Ld5bhln3PcLxcIvBFYwbjHHJfVQbAWhtSO9/kfZrhPGy?=
 =?us-ascii?Q?G/J9GliDJarJ4DTPdFiS0qpPt1HsM8SU6O1JUHNfSgF55fwfCho7oyFa9Nru?=
 =?us-ascii?Q?MX8fbFO6SkFFQBLKavKVfqmJUAb/bMYzvjpFlQZJM7muhh0b10EMI5IRDRqP?=
 =?us-ascii?Q?0mpOX+HHVZdg5j7DzxpMWgTc7wFZs0NdmhS2T3kn85yNtFFh7lKtiZ3WE+Zq?=
 =?us-ascii?Q?B93Un5x4iAPMt7lr304pClP4+JN55R/4s3ig7EDhm3IaW7eCWQA9R26Oited?=
 =?us-ascii?Q?ABva067hb+8W9Xw0XoMIrzBVT5uDAN2oHySdfkoHacIja0aLfw2qAuUE6qbV?=
 =?us-ascii?Q?y2Dbs6DDKTQ+h+uWgwP3ieWW3Ch8r5s6IjB9Cs7N4I9avDbpZxYRnUcSAmkM?=
 =?us-ascii?Q?x/lJktkAMuRS0B9UvhK+IHc/BqzOdFWvrAAOEGUD86u2zyjQBu7Mi9+JruDO?=
 =?us-ascii?Q?xM2G5uiRWpPhicdBkBtzongwhn0uM1k+Ma2iHGHQyLvVf2VbbwDmjvfj475y?=
 =?us-ascii?Q?ZYgR1OduYgJ54oI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SWX9OlVzEg3lURabQEHWqbHZF/XoEVbww222WS3mIhOZ2XrY8PYVhnt8iE8y?=
 =?us-ascii?Q?yWwMa0R72omho0JzxhGAP1gBpABej9vYLUUSiObVt8yG+eyE06EHjWuQs5J8?=
 =?us-ascii?Q?pUMeEig/fLQH45DnJYfO6R9i+tGdPRgblWCEp6O3jLQbDL0HXPqdI6cPE8Kb?=
 =?us-ascii?Q?3DS0Za3CSKnxWyA/lS8IHgF4o/ve347+PB1wR6Y4DDza+eS/qKJluclmTUMP?=
 =?us-ascii?Q?Ij1Xg0V9bCKIMggHuW4Yx7Ivr0QCAI3CJmDy/YkZ+dIjnFEpBWXvF0jl1ITa?=
 =?us-ascii?Q?YO7yyuG/uSi4AOu0U2ft4oV4YEKe3qRI9y2p+cbpMP49Bm8118vOKzDsH4WK?=
 =?us-ascii?Q?Dsy/2cvujTafUQ8AfDMJIocMnaxxbm4msBAM7YuI79n6ZQwpgeltHz7A64EJ?=
 =?us-ascii?Q?4aw9Nc91aftKvayGhaEXQD+f8T8OeJ542qZgybeUw6CpQ9BGVGtzCX1jcnNM?=
 =?us-ascii?Q?5fLplLnxFoLzvHoyRxWtCXz34b8vG3EjfdzW9llB9g80ZqnUpJ7pvm3AfJ2q?=
 =?us-ascii?Q?STcJ290QMh5ysyh474cNiOZ91xrTHITNTpkDT6jZpSHHfKWcwHQpOniQDczA?=
 =?us-ascii?Q?vpnl7+SICf8A5ojgDjnXB7Pr0YV5dZJnhzPBZJ3fexDB/FOziGHKk25f75Ef?=
 =?us-ascii?Q?AijKtW7BROEmraRzy2xRi6nnlN23/LptzbF1ENddiV6lIQkK7x67n9gtibB/?=
 =?us-ascii?Q?B1T9ORwTunlHSZq5r//Dd2rSPV97innb+PloXVdME9UtWMg52UCpl2uN060A?=
 =?us-ascii?Q?GjGoRbTLTfcxWGJqmJW6nt9sutEhjO4suvmGEITTv0M0ns3Bmpdty9PVsgkW?=
 =?us-ascii?Q?Ybg7pQH8rtPiS9n5iwb66NQRr/+8agCzGTEeviVEsYL38Nux6DkrvwBYoX0t?=
 =?us-ascii?Q?wbPrFR8paxsMTjRCwSbmsOa7uboXkJhIqfd6mQS0vxnj8CVLJ4rmsrN9JSq7?=
 =?us-ascii?Q?ABtoK5r1zBGEgBKDEissd9u3I/zvyYt2lQy0kYpBYb/EqFM/2rDFul2BzR8L?=
 =?us-ascii?Q?oY0HI6r5j4L7lImR5FhoySxkamsqExlPwm2O/1NqpwuEmifjwRgxDvf0M42t?=
 =?us-ascii?Q?tuXeqWOrj9ZrE4UQglPwHXJ9OYvuoaKBu9YVwSH7zyR3mi1zKXpE5ZgYWdKa?=
 =?us-ascii?Q?S0QkVJ5hovYqAx8VR4bP/la20yH0PdNFEtP20v+IIGnQiv5lx2m5v7gPpcx3?=
 =?us-ascii?Q?PbQ+yMo26ALHXubWTt5pONdjnJPgW9UYnZgc7HUbsnv+YiItvzwTUVPfAB/L?=
 =?us-ascii?Q?VIFMoHCjqMVuPYF1mP21qMKLgthqACHLzxpW/uVM79zXu+o3MyitjzKbI59U?=
 =?us-ascii?Q?aabpjEIV0g38jaIhwuPwy1BDbwCO6EgsYFfldwAJ2knAC/6COuAVDROtIbN7?=
 =?us-ascii?Q?Yl7A2q6yHGkz/NNI8628DlrsXy0WzxN3BsaKUEvEFkdYV09ug9rNdY6qaYoy?=
 =?us-ascii?Q?nQFfcJnO+0cWN3cqwNVRTiz8MBJFigr3RUTOflawEI4YWAJJXBkAgdN6CSSC?=
 =?us-ascii?Q?t7DPrNJBqvGRKOt0V1yO9I5fjdTzcKayD/0oI1MIBcuePTT55XJ+1SGB/XBy?=
 =?us-ascii?Q?6YgUavIbnDNez5OPRCI=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06e5723c-be32-4006-7116-08ddb4520128
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 01:37:25.8872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fxZ+1ZeyxGePOsLtzwNv22vOcek7wi2uc0L/WYDdVGXqnIYIS7v9KuLnaX9uZLeoq9DDbAEep6o7keYfL9/q5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10339
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_183740_901635_71D8AFD8 
X-CRM114-Status: GOOD (  21.09  )
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

On Wed, Jun 25, 2025 at 03:04:51PM -0500, Rob Herring wrote:
> On Thu, Jun 12, 2025 at 04:51:42PM +0200, Tommaso Merciai wrote:
> > Hi Frank, Wolfram,
> >
> > Thanks both for your work.
> >
> > On 12/06/25 16:31, Wolfram Sang wrote:
> > > Hi Frank,
> > >
> > > > > +  clock-names:
> > > > > +    oneOf:
> > > > > +      - items:
> > > > > +          - const: pclk
> > > > > +          - const: tclk
> > > > > +      - items:
> > > > > +          - const: pclk
> > > > > +          - const: pclkrw
> > > > > +          - const: tclk
> > > >
> > > > Suggested clock name is, apb, trans, srfs.
>
> Suggested by who?

It is my suggestion base on
 - 1: needn't clk surfix. But you provide rule below.
 - 2: pclk, tclk ... can't provide any meansful information to user.
It is hard to know what's that without check binding doc. And most case
there are not description under clocks.

but some common clock-names term for IP, like apb, bus, which will be easy
to know apb (control access register). 'bus' feed into i3c bus clock speed.
'bus' is important for i3c to set 12Mhz or lower freqeuncy for old i2c
devices.

Frank


>
> > > > Needn't clk surfix and provide meanful name.
> > >
> > > ? Why can't we have the name from the datasheets? It will be
> > > unnecessarily hard for users to verify the correctness of the clock
> > > assignments if they need an artifical mapping of these names. If they
> > > are the same as in the datasheet, the same task becomes very easy.
> > >
> >
> > Agreed.
> > Since the name comes from the hw manual I think is better to leave it as is.
>
> Agreed.
>
> While 'clk' is considered redundant, naming clocks 'p' and 't' is too
> terse even for me. So the rule is clk is redundant unless it is with a
> single letter. The rules apply to s/w folks making up names, not h/w
> manuals.
>
> Rob
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
