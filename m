Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30C84EE20B5
	for <linux-i3c@archiver.kernel.org>; Fri,  6 Feb 2026 17:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5yrOcTntWRwIQcBIIJe3/BOJqHtkQX0PHmnPIy4S+vg=; b=GzNVrKEjSlf4lF
	pQ8CwGVlBwDi69lpTGfl7CVLDnzf6jf6Cn1Pb0a3KUt2bPLY2gEBlwgXnMrvl6K0fBQWubuzML3YN
	PVJH6dtV7VACBwjiepRBd0xdzL48BY4hig5ijI4TDKpxi+4VMWh9INuoqgAoA0mDrPScCqHLjhj6L
	QG7nZupWDotACf5rGB4DRu+3jM4DgKhgwdEJMCq4Y82C1GKOBKSAxuhJNj23AM6YO2ZlrOfTr/1W+
	E6iRLTEbsJ9EhsEQV2KjehwilUL/lItHMWO4Mp9IUpWSTJJCGPttIjI0auqhH1lU+t9vxEOBzXumH
	FSXeWPHW55tfUylcP1lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voPUS-0000000BcOx-3Zff;
	Fri, 06 Feb 2026 17:19:32 +0000
Received: from mail-swedencentralazon11013054.outbound.protection.outlook.com ([52.101.83.54] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voPUQ-0000000BcNt-2TCV
	for linux-i3c@lists.infradead.org;
	Fri, 06 Feb 2026 17:19:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i4BHMlzNm/kpXxHZD35n+XtQa1+nzIyLmO/p/6j1hW56a8yRZwkdY5w7ooF2LXorUdRAnwG6DiOTULiwremxBSl6j4p9IpFNSDZTVJsN/UcLK7TXES9CGGz4pix9246DQZiTaJ9XiyXE841LPcobUQ5GhRCwiqlF13zKUXeXv+oe0ktipCW8iKABpBhmVG37KTbR1jIGupG+JtLovZxWqCPd95XcBim/DxYHt+3EFjVWNM8sPcgE2bHb1Bk3IYlz+0/0uD01XbW8hHQ9wiQzTaFXlxVyFpetw/gTecG3F6jb24HjJQoJDcAQ2dJu/wytnQ5+97zVIaoNoc7vkybNTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ikTrnCEb0evHjxEgTmp5dXcWiUh8N2CNw5Yfz8itnco=;
 b=kF+YTIEaJiwP4Ax/W5kEg/y8ksmSbzp2hzKGcGTWUe8gmjt6Q7p4bNIrS0vMh9UnA4aDEqAg5rtL7ia75BoSdJ9xl6ttCiESTMWPcXZoEmTR4FB9jmmCP/wxPjzjHBiZLMLyNdyPDfct+DiKHFeD4I6zfzHjKcDpok0D/YT60Ec80OqQeASeTqY82VeUpUWbLiC/lDurbZOWye1O3B+Enr5dVW06e4EcJqm36euOXABUS4u3dNpebYPQ9wvUqnf5ijdTtBkc8m7+/fnDe4y1zIK8sIsQhhi3ZyBAdFAVXTYqYuIohk/2Gav6xuQl5Km0k2X2ZHpFUQ4GmyQSJy+A2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ikTrnCEb0evHjxEgTmp5dXcWiUh8N2CNw5Yfz8itnco=;
 b=G1l62FKqmAZGRxub1gl7OSNH3q0Zpi6iKReBdGVP5wp4UBR3qqUvr/g7AjLZ/uQKeJGz7I66gawg4iIxzvdYveh2yJjy8Nfr1PgsEkbQnNmjNN2GyGV/9a+URIpfiSX/wYlt1kwlPaFLxDclj93RFGdKnvRfExgaC+DiOFHjhNRju2X4kAF/oM4D4FQZ2HBSAh77X7/wlyNCx1buOhikKsycWIQiTDWLGhq38kYFKAQpcdOTDxs5jFl5B2CDhTSs/lHqfHm/2uO9dzbzXAdIHi6F1HWYA7/EsHkeI/ffHBFMkHw9RTho8gdOElUrck/QYjoZS7HOrW8KiGLWSmWg/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU4PR04MB12300.eurprd04.prod.outlook.com (2603:10a6:10:62d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.13; Fri, 6 Feb
 2026 17:19:26 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Fri, 6 Feb 2026
 17:19:25 +0000
Date: Fri, 6 Feb 2026 12:19:17 -0500
From: Frank Li <Frank.li@nxp.com>
To: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, broonie@kernel.org,
	lee@kernel.org, lgirdwood@gmail.com, vikash.bansal@nxp.com,
	priyanka.jain@nxp.com, shashank.rebbapragada@nxp.com
Subject: Re: [PATCH v5 4/5] regulator: p3h2x4x: Add driver for on-die
 regulators in NXP P3H2x4x i3c hub
Message-ID: <aYYilSSZKcx0LauR@lizhi-Precision-Tower-5810>
References: <20260206120121.856471-1-aman.kumarpandey@nxp.com>
 <20260206120121.856471-4-aman.kumarpandey@nxp.com>
Content-Disposition: inline
In-Reply-To: <20260206120121.856471-4-aman.kumarpandey@nxp.com>
X-ClientProxiedBy: PH7PR10CA0022.namprd10.prod.outlook.com
 (2603:10b6:510:23d::6) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU4PR04MB12300:EE_
X-MS-Office365-Filtering-Correlation-Id: 691e18b0-36a9-42f0-e080-08de65a3e08b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|366016|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?x5AASYROdKbBWsq4zrDLXDvmeNxGTm8SZ5sUmShuppK1w7wI8rvNEr1da0L1?=
 =?us-ascii?Q?5fHR12BpKi5jgzSK9GC/WIHnfdJ8Acg/695bqLsq+2RlrMtb1DtRzMrs4tMD?=
 =?us-ascii?Q?aemlnLclNdt/P2nZWFmld5JrmYVLiwrKr/s6ploZLiOoQMFMsAFnPkM8GbZ8?=
 =?us-ascii?Q?SqBZswWB+BgRQtQOX4W2cc3DOXYG5EMS00KrN39iKT7hDW1gBt+f8njNsz3M?=
 =?us-ascii?Q?f6TsQtBJeE+RYtOtpYPoAAjVf0o20GKp9PkRRpxdayQJihDmzRsR8LzpdZCf?=
 =?us-ascii?Q?2632HUcFgEda5WFn0tjNr/Qicr61KD5Y3srsLhzGGPnTO1/9xwF3+EYL5Iic?=
 =?us-ascii?Q?dKUe4yWEhVNi2EYqcyqzfNYm0ISV/GXykBLXblTgDSJYIaQaGAA3S/sJzpxq?=
 =?us-ascii?Q?R1rqmpx/ExRTYQ92n9zNt3CgE2MmyQSK5LH5xDSJ5xnZCiGvW7gxhzslP5Iu?=
 =?us-ascii?Q?Gy3NjtOjBGighjkToliu9ybD7yOhlkP9GzS142V/5Z5Iw5FYzcN0RoUTrApi?=
 =?us-ascii?Q?PGMP3Pyc7q5ucj4zBtVf+KgmGhEq5WAKhvJnrMatyLtLc3bmRAL8M61tjgFb?=
 =?us-ascii?Q?gAGInqsFwSDuNrfxwuYhp+snmP8Fby7pptInS3KEhcUPfLKPB9k38MXlRwxD?=
 =?us-ascii?Q?li6agDr51AEBOLUpqqLpjwJvFOjWjMFrld9Fc6KWHO2OEaH3BtWHlbBIpf2j?=
 =?us-ascii?Q?9URj5v8kY0+DdBndWyJTt1rYOq3Hu05+y8cPaohkj23kS03fVmM5j3fu5+vP?=
 =?us-ascii?Q?afV9XnISV8dj9Ji4Usnt1T2+4r5ejUicO1N2xbhAM/lFnccBb0sLTpbZ0zST?=
 =?us-ascii?Q?jkjN9qWBqN7D6isyN23gnhtgeADtYedin4wSKJwIo6Wf7K6YrvKSH2L/K9eT?=
 =?us-ascii?Q?slq48LxqwqcT8UiwSXi4kmr0zcJ8xytaMluutACAALWjGEeOL7xUrPeNK1mM?=
 =?us-ascii?Q?cUocswrDOm4zpRZPyv+ySww1D+BNdy3mXdU0kEgKcOWlSdymHZak72HVw1vJ?=
 =?us-ascii?Q?DNo9eyejj4LK7rKvMQVPQUD9sAkQx+mFP498esmDTYrnkIglA/Mkxvlj1SUT?=
 =?us-ascii?Q?vuNxrwv8Kz8mtrbECHw5OiD8XlRhLMDHezsOudBNS+EGfvh0G8NPh4D5pMxW?=
 =?us-ascii?Q?EEfzBquNP6FtGupTsg81vQ3i7LojkfwwBuo+qU5pxJC1L/LrcabykoTZ3I+i?=
 =?us-ascii?Q?cpnICJLfKe9k2qV3XC8/1S6P9uJBPUHT8i1EZ+bA29p8fwrm04ANc+CCIarO?=
 =?us-ascii?Q?QFOgCyV11s8yCAMiZCJpWdDJKo00ROhXHcNlheMggWkiX/GLDK65dX4xY1zV?=
 =?us-ascii?Q?9aDmvuMiIiJjJh7Yi4GL1K1pVl7G8EdvAZiltYaxQAC/sRBiZhQE75cAW3AI?=
 =?us-ascii?Q?mop+LS9EXVDn++XO7WJRbeGq+vqB3et2DfSvMKVlEqdIyLJGQ5E9nStD3GjH?=
 =?us-ascii?Q?lRu+FXJ5zu2kxcOBMtV2OrOzHUQZ/H3swuvRTO0Zdhgz72sQ/j4WdbLSN2ui?=
 =?us-ascii?Q?G3YVJS3Bjd9dsmTiE1H1/XI6YfZzWIaWTOGWHYE4cUEfu/TfmmfoqKnpzVdG?=
 =?us-ascii?Q?XBOr4i8bOujsOSDerBF5i6VgVIGujR42DmGDnKacQvqXh1GZbF3U/CjxFyZZ?=
 =?us-ascii?Q?jW4+ZLP6MXTGVY1mgQ9ekX4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yXuO+x+Ap2hHgJGIL3+IHigtsYjMTcFSl0iTXeFX9igIguXvfxztdgzuLNxp?=
 =?us-ascii?Q?u+c7qciQ2FCZpfdDvSu8SqSGKEqTpBWTyV5j2NB0XnWvxWL9Skt3ljjBPZWu?=
 =?us-ascii?Q?GNPKAcvYcHCU4qF3XO8IG7BVjrGy86PUcnPIMplWVTg1kJ5X290KrFcVrb7M?=
 =?us-ascii?Q?DHVsR2W7buyMf/XM3yKg8i57zGSywDa098+d4ASWzkgI7obbRi2/WVep+xKt?=
 =?us-ascii?Q?1AGdhputqzKNRTXzPg82oMDFbbtym0XAtHgZpqK+HUaseV7veYlFwiwmxcw7?=
 =?us-ascii?Q?zxMZDoDbCH+I1G87OFqR62J+tES2rp6CCLuOh2nDyFStrCMWMX7mnSg0aJ/Z?=
 =?us-ascii?Q?Kkw8/x6lea96VSQ1j70vnfE5OAndJZWB/ZZ3KlDu0uH5KvKTQr+A+UtQK4F5?=
 =?us-ascii?Q?WpfUwWZHfWgus5vtZ1Lt+RY3sIqDYYE1zD3oF7hqEoysUEAgdEWzwUGhWLNf?=
 =?us-ascii?Q?wDryxmFWTY9Bg4n8RzwLS0eScJR5XwGKUDqDmVwrs/muDPQUEmpfZQcX/yXU?=
 =?us-ascii?Q?p1/xmVFBvJFXTJ25BLxIjVYl3R3h0GWbL/d4JJIF4LaFiednAglsueULPHRf?=
 =?us-ascii?Q?Wc/HdTuNJGw2OfExXmOXJ5PVJzwqquEeeXRwonzaxoAoESRF82WzTxb75536?=
 =?us-ascii?Q?aQib4s00Uaaeo4CbOW8QbzfTJZ0pAfo8BIoFAyXP44SNxCYTgbhvYQYqI/f0?=
 =?us-ascii?Q?zkzzS1B8fdO9Kh5gfroYMeNXwYzQ1mpHBvArgzs14EmrKdomwiqxWMYCLTYW?=
 =?us-ascii?Q?gv2cxqIAxczN6gz9ey6Ao7f07u0QZlPw6VoobuL6Pmi3Qh1wjlMgsrGxiS7W?=
 =?us-ascii?Q?6soHzd3DCLTNrk/l+Za1fYEbk4+pMlhmYFGBYFF38pr9UzwPcE09PyqXVY7i?=
 =?us-ascii?Q?OAOfpkcNZNOYraW9BlGMNJe5VLLIDGygEd1q31HEAxUTwouVEAB8+ifttoLT?=
 =?us-ascii?Q?QqvFE8iQRegxaEBHGefv/QHv6Sf2E8o7vcdwYZO0HQNmshjeB4dHeUUqTmui?=
 =?us-ascii?Q?M42AJXlIeg0mzTVleORy4zAC4jM9vfGNXpPrn+C6DkVS0Oqv0IqAslmYD/iu?=
 =?us-ascii?Q?NrEIZo3mZjoECyKzAjvcYHp3V8W9I9VtSv3bhmanJy3rJjD8/fTZBGvhfU42?=
 =?us-ascii?Q?c2517FcESH91kyQFrZSKgCMOuexge/oy6eXe97/IIvKehdDlX6BYzpfToQEB?=
 =?us-ascii?Q?ksBwWHtm9w5hNotlbHBjX7ql4ep9ULSwQUfgpNGwdg2PFBSvir9PnMARpXv6?=
 =?us-ascii?Q?62rFqxUEnds9lmWjzEKcA50OKDpcmJLaNKsspknj+EMpju+wyr7KGlLG4rUm?=
 =?us-ascii?Q?ErCF37NY8heysIt45vcDCSQ6+C7qFQs82Lm03Ud8oDoEtrY9VFQvHldDKjwJ?=
 =?us-ascii?Q?AquoKVwT/HtjwjiTNbzNcLycycWiAq1eJ2tU6mK0uvV9529OUJ30A8wC7mpD?=
 =?us-ascii?Q?qyiv5AzlQWooc3Eg++kXfrK9QOW6OPhbALF8pqWk0G5Az8n9qzGs/ErQ4igz?=
 =?us-ascii?Q?YuOP3cDpJFTf1rmVLqCMYMESo4ZbRSnZANqlJsW/53Hw3xaXaBV9vGpyk05S?=
 =?us-ascii?Q?0HSSZT1qo2sPjKEXPsawjPLK6bGFbzuviDUbMV/H4VzbCXjY4rox8bnpWO6k?=
 =?us-ascii?Q?I9WjQMjMapLYo3zc4V8DNJxnBz2vVB3cCdc0jTFTT3bntEK8lyHFJyafzlhh?=
 =?us-ascii?Q?86ybGavGqrSIIChmiLcEgMDKTGRiltPgrURW9oUla7kTbbfF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 691e18b0-36a9-42f0-e080-08de65a3e08b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 17:19:25.8081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4hmFMB0JK1oKcR1EL057RWwlca/yX/Lj/koZ6OcjLrpNXDn2jJJ2sjjGPsXcXRH9aRiqwXZVf8iMg2u2wOWAVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB12300
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_091930_792833_19E86AEB 
X-CRM114-Status: GOOD (  26.65  )
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

On Fri, Feb 06, 2026 at 02:01:20PM +0200, Aman Kumar Pandey wrote:
> The NXP P3H2x4x family integrates on-die regulators alongside I3C hub
> functionality. This driver registers the regulators using the MFD

Register the regulaltor ...

> framework and exposes them via the regulator subsystem.
>
> Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
>
> ---
> Changes in v5:
>  - Updated dev_err_probe() for regmap_init failure.
>  - Updated module description
>
> Changes in v4:
>  - Split the driver into three separate patches (mfd, regulator and I3C hub)
>  - Introduced driver for on-die regulators in NXP P3H2x4x I3C hub
> ---
> ---
>  MAINTAINERS                                   |   1 +
>  drivers/regulator/Kconfig                     |  10 +
>  drivers/regulator/Makefile                    |   1 +
>  drivers/regulator/p3h2840_i3c_hub_regulator.c | 247 ++++++++++++++++++
>  4 files changed, 259 insertions(+)
>  create mode 100644 drivers/regulator/p3h2840_i3c_hub_regulator.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6c247e4a0c12..6601830b6e86 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18914,6 +18914,7 @@ L:	linux-i3c-owner@lists.infradead.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
>  F:	drivers/mfd/p3h2840.c
> +F:	drivers/regulator/p3h2840_i3c_hub_regulator.c
>  F:	include/linux/mfd/p3h2840.h
>
>  NXP PF5300/PF5301/PF5302 PMIC REGULATOR DEVICE DRIVER
> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> index d2335276cce5..84684701dad7 100644
> --- a/drivers/regulator/Kconfig
> +++ b/drivers/regulator/Kconfig
> @@ -1010,6 +1010,16 @@ config REGULATOR_MTK_DVFSRC
>  	  of Mediatek. It allows for voting on regulator state
>  	  between multiple users.
>
> +config REGULATOR_P3H2X4X
> +       tristate "P3H2X4X regulator support"
> +       depends on MFD_P3H2X4X
> +       help
> +         This driver provides support for the voltage regulators of the
> +         P3H244x/P3H284x multi-function I3C Hub device.
> +
> +         Say M here if you want to include support for this regulator as
> +         a module. The module will be named "p3h2840_i3c_hub_regulator".
> +
>  config REGULATOR_PALMAS
>  	tristate "TI Palmas PMIC Regulators"
>  	depends on MFD_PALMAS
> diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
> index 1beba1493241..145138f437d8 100644
> --- a/drivers/regulator/Makefile
> +++ b/drivers/regulator/Makefile
> @@ -127,6 +127,7 @@ obj-$(CONFIG_REGULATOR_QCOM_RPMH) += qcom-rpmh-regulator.o
>  obj-$(CONFIG_REGULATOR_QCOM_SMD_RPM) += qcom_smd-regulator.o
>  obj-$(CONFIG_REGULATOR_QCOM_SPMI) += qcom_spmi-regulator.o
>  obj-$(CONFIG_REGULATOR_QCOM_USB_VBUS) += qcom_usb_vbus-regulator.o
> +obj-$(CONFIG_REGULATOR_P3H2X4X) += p3h2840_i3c_hub_regulator.o
>  obj-$(CONFIG_REGULATOR_PALMAS) += palmas-regulator.o
>  obj-$(CONFIG_REGULATOR_PCA9450) += pca9450-regulator.o
>  obj-$(CONFIG_REGULATOR_PF0900) += pf0900-regulator.o
> diff --git a/drivers/regulator/p3h2840_i3c_hub_regulator.c b/drivers/regulator/p3h2840_i3c_hub_regulator.c
> new file mode 100644
> index 000000000000..1e9abc398f5a
> --- /dev/null
> +++ b/drivers/regulator/p3h2840_i3c_hub_regulator.c
> @@ -0,0 +1,247 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2025 NXP
> + * This P3H2x4x driver file contain functions for enable/disable regulator and voltage set/get.
> + */
> +#include <linux/bitfield.h>
> +#include <linux/mfd/p3h2840.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/driver.h>
> +
> +#define P3H2x4x_LDO_AND_PULLUP_CONF				0x19
> +#define P3H2x4x_LDO_ENABLE_DISABLE_MASK				GENMASK(3, 0)
> +#define P3H2x4x_CP0_EN_LDO				        BIT(0)
> +#define P3H2x4x_CP1_EN_LDO				        BIT(1)
> +#define P3H2x4x_TP0145_EN_LDO					BIT(2)
> +#define P3H2x4x_TP2367_EN_LDO					BIT(3)
> +
> +#define P3H2x4x_NET_OPER_MODE_CONF				0x15
> +#define P3H2x4x_VCCIO_LDO_CONF					0x16
> +#define P3H2x4x_CP0_VCCIO_LDO_VOLTAGE_MASK			GENMASK(1, 0)
> +#define P3H2x4x_CP0_VCCIO_LDO_VOLTAGE(x)	\
> +		FIELD_PREP(P3H2x4x_CP0_VCCIO_LDO_VOLTAGE_MASK, x)
> +#define P3H2x4x_CP1_VCCIO_LDO_VOLTAGE_MASK			GENMASK(3, 2)
> +#define P3H2x4x_CP1_VCCIO_LDO_VOLTAGE(x)	\
> +		FIELD_PREP(P3H2x4x_CP1_VCCIO_LDO_VOLTAGE_MASK, x)
> +#define P3H2x4x_TP0145_VCCIO_LDO_VOLTAGE_MASK			GENMASK(5, 4)
> +#define P3H2x4x_TP0145_VCCIO_LDO_VOLTAGE(x)	\
> +		FIELD_PREP(P3H2x4x_TP0145_VCCIO_LDO_VOLTAGE_MASK, x)
> +#define P3H2x4x_TP2367_VCCIO_LDO_VOLTAGE_MASK			GENMASK(7, 6)
> +#define P3H2x4x_TP2367_VCCIO_LDO_VOLTAGE(x)	\
> +		FIELD_PREP(P3H2x4x_TP2367_VCCIO_LDO_VOLTAGE_MASK, x)
> +#define P3H2x4x_LDO_COUNT					4
> +
> +struct p3h2x4x_regulator_dev {
> +	struct regulator_dev *rp3h2x4x_dev[P3H2x4x_LDO_COUNT];
> +	struct regmap *regmap;
> +};
> +
> +static int p3h2x4x_regulator_enable(struct regulator_dev *rdev)
> +{
> +	int ret;
> +	unsigned int orig;
> +
> +	ret = regmap_read(rdev->regmap, P3H2x4x_DEV_REG_PROTECTION_CODE, &orig);
> +	if (ret)
> +		return ret;
> +
> +	if (orig != P3H2x4x_REGISTERS_UNLOCK_CODE) {
> +		ret = regmap_write(rdev->regmap, P3H2x4x_DEV_REG_PROTECTION_CODE,
> +				   P3H2x4x_REGISTERS_UNLOCK_CODE);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = regulator_enable_regmap(rdev);
> +	if (ret)
> +		return ret;

AI:
- If enable fails, protection register is left unlocked
- Should restore original state in error path

> +
> +	if (orig != P3H2x4x_REGISTERS_UNLOCK_CODE) {
> +		ret = regmap_write(rdev->regmap, P3H2x4x_DEV_REG_PROTECTION_CODE, orig);
> +		if (ret)
> +			return ret;
> +	}

AI:
- `p3h2x4x_regulator_enable()`, `_disable()`, and `_set_voltage_sel()` have identical unlock/lock logic
- Should extract to helper function

you can use cleanup to define macro, like mutex, use guard(...) to simple
code.

Frank
> +	return 0;
> +}
> +
> +static int p3h2x4x_regulator_disable(struct regulator_dev *rdev)
> +{
> +	int ret;
> +	unsigned int orig;
> +
> +	ret = regmap_read(rdev->regmap, P3H2x4x_DEV_REG_PROTECTION_CODE, &orig);
> +	if (ret)
> +		return ret;
> +
> +	if (orig != P3H2x4x_REGISTERS_UNLOCK_CODE) {
> +		ret = regmap_write(rdev->regmap, P3H2x4x_DEV_REG_PROTECTION_CODE,
> +				   P3H2x4x_REGISTERS_UNLOCK_CODE);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = regulator_disable_regmap(rdev);
> +	if (ret)
> +		return ret;
> +
> +	if (orig != P3H2x4x_REGISTERS_UNLOCK_CODE) {
> +		ret = regmap_write(rdev->regmap, P3H2x4x_DEV_REG_PROTECTION_CODE, orig);
> +		if (ret)
> +			return ret;
> +	}
> +	return 0;
> +}
> +
> +static int p3h2x4x_regulator_set_voltage_sel(struct regulator_dev *rdev, unsigned int sel)
> +{
> +	int ret;
> +	unsigned int orig;
> +
> +	ret = regmap_read(rdev->regmap, P3H2x4x_DEV_REG_PROTECTION_CODE, &orig);
> +	if (ret)
> +		return ret;
> +
> +	if (orig != P3H2x4x_REGISTERS_UNLOCK_CODE) {
> +		ret = regmap_write(rdev->regmap, P3H2x4x_DEV_REG_PROTECTION_CODE,
> +				   P3H2x4x_REGISTERS_UNLOCK_CODE);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = regulator_set_voltage_sel_regmap(rdev, sel);
> +	if (ret)
> +		return ret;
> +
> +	if (orig != P3H2x4x_REGISTERS_UNLOCK_CODE) {
> +		ret = regmap_write(rdev->regmap, P3H2x4x_DEV_REG_PROTECTION_CODE, orig);
> +		if (ret)
> +			return ret;
> +	}
> +	return 0;
> +}
> +
> +static const struct regulator_ops p3h2x4x_ldo_ops = {
> +	.list_voltage = regulator_list_voltage_table,
> +	.map_voltage = regulator_map_voltage_iterate,
> +	.set_voltage_sel = p3h2x4x_regulator_set_voltage_sel,
> +	.get_voltage_sel = regulator_get_voltage_sel_regmap,
> +	.enable = p3h2x4x_regulator_enable,
> +	.disable = p3h2x4x_regulator_disable,
> +	.is_enabled = regulator_is_enabled_regmap,
> +};
> +
> +static const unsigned int p3h2x4x_voltage_table[] = {
> +	1000000,
> +	1100000,
> +	1200000,
> +	1800000,
> +};
> +
> +static struct regulator_desc p3h2x4x_regulators[] = {
> +	{
> +		.name = "LDO_CP0",
> +		.of_match = of_match_ptr("LDO_CP0"),
> +		.regulators_node = of_match_ptr("regulators"),
> +		.volt_table = p3h2x4x_voltage_table,
> +		.n_voltages = ARRAY_SIZE(p3h2x4x_voltage_table),
> +		.ops = &p3h2x4x_ldo_ops,
> +		.type = REGULATOR_VOLTAGE,
> +		.owner = THIS_MODULE,
> +		.enable_reg = P3H2x4x_LDO_AND_PULLUP_CONF,
> +		.enable_mask = P3H2x4x_CP0_EN_LDO,
> +		.vsel_reg = P3H2x4x_VCCIO_LDO_CONF,
> +		.vsel_mask = P3H2x4x_CP0_VCCIO_LDO_VOLTAGE_MASK,
> +	},
> +	{
> +		.name = "LDO_CP1",
> +		.of_match = of_match_ptr("LDO_CP1"),
> +		.regulators_node = of_match_ptr("regulators"),
> +		.volt_table = p3h2x4x_voltage_table,
> +		.n_voltages = ARRAY_SIZE(p3h2x4x_voltage_table),
> +		.ops = &p3h2x4x_ldo_ops,
> +		.type = REGULATOR_VOLTAGE,
> +		.owner = THIS_MODULE,
> +		.enable_reg = P3H2x4x_LDO_AND_PULLUP_CONF,
> +		.enable_mask = P3H2x4x_CP1_EN_LDO,
> +		.vsel_reg = P3H2x4x_VCCIO_LDO_CONF,
> +		.vsel_mask = P3H2x4x_CP1_VCCIO_LDO_VOLTAGE_MASK,
> +	},
> +	{
> +		.name = "LDO_TPG0",
> +		.of_match = of_match_ptr("LDO_TPG0"),
> +		.regulators_node = of_match_ptr("regulators"),
> +		.volt_table = p3h2x4x_voltage_table,
> +		.n_voltages = ARRAY_SIZE(p3h2x4x_voltage_table),
> +		.ops = &p3h2x4x_ldo_ops,
> +		.type = REGULATOR_VOLTAGE,
> +		.owner = THIS_MODULE,
> +		.enable_reg = P3H2x4x_LDO_AND_PULLUP_CONF,
> +		.enable_mask = P3H2x4x_TP0145_EN_LDO,
> +		.vsel_reg = P3H2x4x_VCCIO_LDO_CONF,
> +		.vsel_mask = P3H2x4x_TP0145_VCCIO_LDO_VOLTAGE_MASK,
> +	},
> +	{
> +		.name = "LDO_TPG1",
> +		.of_match = of_match_ptr("LDO_TPG1"),
> +		.regulators_node = of_match_ptr("regulators"),
> +		.volt_table = p3h2x4x_voltage_table,
> +		.n_voltages = ARRAY_SIZE(p3h2x4x_voltage_table),
> +		.ops = &p3h2x4x_ldo_ops,
> +		.type = REGULATOR_VOLTAGE,
> +		.owner = THIS_MODULE,
> +		.enable_reg = P3H2x4x_LDO_AND_PULLUP_CONF,
> +		.enable_mask = P3H2x4x_TP2367_EN_LDO,
> +		.vsel_reg = P3H2x4x_VCCIO_LDO_CONF,
> +		.vsel_mask = P3H2x4x_TP2367_VCCIO_LDO_VOLTAGE_MASK,
> +	},
> +};
> +
> +static int p3h2x4x_regulator_probe(struct platform_device *pdev)
> +{
> +	struct p3h2x4x_dev *p3h2x4x = dev_get_drvdata(pdev->dev.parent);
> +	struct p3h2x4x_regulator_dev *p3h2x4x_regulator;
> +	struct regulator_config rcfg = { };
> +	struct device *dev = &pdev->dev;
> +	struct regulator_dev *rdev;
> +	int ret, i;
> +
> +	p3h2x4x_regulator = devm_kzalloc(dev, sizeof(*p3h2x4x_regulator), GFP_KERNEL);
> +	if (!p3h2x4x_regulator)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, p3h2x4x_regulator);
> +
> +	p3h2x4x_regulator->regmap = p3h2x4x->regmap;
> +	device_set_of_node_from_dev(dev, dev->parent);
> +
> +	rcfg.dev = dev;
> +	rcfg.dev->of_node = dev->of_node;
> +	rcfg.regmap = p3h2x4x_regulator->regmap;
> +	rcfg.driver_data = p3h2x4x_regulator;
> +
> +	for (i = 0; i < ARRAY_SIZE(p3h2x4x_regulators); i++) {
> +		rdev = devm_regulator_register(&pdev->dev, &p3h2x4x_regulators[i], &rcfg);
> +		if (IS_ERR(rdev)) {
> +			return dev_err_probe(dev, PTR_ERR(rdev), "Failed to register %s\n",
> +					     p3h2x4x_regulators[i].name);
> +		}
> +		p3h2x4x_regulator->rp3h2x4x_dev[i] = rdev;
> +	}
> +	return 0;
> +}
> +
> +static struct platform_driver p3h2x4x_regulator_driver = {
> +	.driver = {
> +		.name = "p3h2x4x-regulator",
> +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
> +	},
> +	.probe = p3h2x4x_regulator_probe,
> +};
> +module_platform_driver(p3h2x4x_regulator_driver);
> +
> +MODULE_AUTHOR("Aman Kumar Pandey <aman.kumarpandey@nxp.com>");
> +MODULE_AUTHOR("vikash Bansal <vikash.bansal@nxp.com>");
> +MODULE_DESCRIPTION("P3H2x4x I3C HUB Regulator driver");
> +MODULE_LICENSE("GPL");
> --
> 2.25.1
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
