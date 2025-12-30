Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72574EE0213
	for <linux-i3c@archiver.kernel.org>; Tue, 30 Dec 2025 15:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MWXuHpBZ9iRTdm4p4kBdFnbPCeC12Oxp0bNq3t1clts=; b=HgzNweyeho7Vw0
	FxfI/b0yiV1ikGTS6j3X+pYWV1h43rc0agulWciWsIkNJLgbzDd2N8RQPD7Q22fgKFgtOABo+/p/U
	xOpMhLs11HDHuWXoWcYa6XWZLOX/eAzwttToGK0Va3vgLYJ3xLPcWGb5YTDwdQG7QHok1hTp99JSH
	KPasTpS/bCE+DmBU2vjNxIO7YH1x0mZMsJ5s2tVdqCJ6Gcau87nkA9zrlTWGddDV273/oSQYFQoW1
	GGLZDWL6AEp/y1PJwXKmy3a+wEl1qC97ur64pmSH+EY2OwALCN4ifKzkrkfvhP5Xl1R/Rq+d47L0F
	glLbEz9fZwCiOovQvaGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vabvH-000000050z9-0vBZ;
	Tue, 30 Dec 2025 15:46:11 +0000
Received: from mail-westeuropeazon11011021.outbound.protection.outlook.com ([52.101.70.21] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vabvC-000000050yk-2SfI
	for linux-i3c@lists.infradead.org;
	Tue, 30 Dec 2025 15:46:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rE6mVAZBiZpsdEWmD6RMoJ+xLQ3cIO2NSdTWS+W7oEtkP6/hJEKLD8W9+OFmhpd5utypMKQe+hOvVCckuZPSFfrH9KF6VTKDGgiGFNSxTZ1DF8WBfvObSarW9n07zTOTMoABNap7d2OXtnEYD5Xz1SStnFcufs8kXHY6ZlB+gcDJziQdwRpsvpHXqz8xMkRjfkD3xdiex29tEJ/A6/TOVmg4daxvWXQJ5NQfEX8a464A9fsWkggVQePd6oz1vATPAf+L6gQ7XNqdLSq9+kBz/VFE1bpaoLTzE8y+45wLT4ZIS4bTdMoav40DuAzRn46OhWzy8p3RCdw0s53TfXabEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y6TpI6IXjiDkdcN+xYMTJM5erOWYJXr03XPoOGE9Cqo=;
 b=izvSQIr0l1oT9qmp151a7cOZAOuj/AwNxybJYFPcbnPj0L7ZM+NwlE1w1FoY4zyQkH61iazKScMGpnI6lGO47fe5bma8XfI9U1f2s61srfwO3soNNjv+Y9oxoZn9R3Yl14I1R8Qf+5jqdiT7wgNTCynEq5yw2sO5DuvXDmRFSOqP9/3GpKPVh7VXJegeEvaC69scSpHDETQNfSAqWajRP/CIYXnEDUtY3BIpnXAXyvWNMjxv0XWuoaViCPpX6bd3iFhT72W1ZIW0tkrkJeLL2eE/4oU6hPK7FZryrD1shwA97iSs1GMtr9szrPpSIlHIzcNiFIaKGNfyS9gj1VjQ3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y6TpI6IXjiDkdcN+xYMTJM5erOWYJXr03XPoOGE9Cqo=;
 b=cfw8Lqu9E55VxT0ZlQ6RiBPiDKmRDfjtdMo06RHljV8OXL4VQb/XD+6mYy/9Xlet6uqHdUhA990ZvlldGW893FMyGR4GDPzJRB+dJ+7pEC4BfTWdLouPgbtpLTpO6fbXY963lz22ajiI1vxvUxCS1IVOHo325Zxv6mNtpJmluIOimsBWwt+vuTEgVYzSl67d4hmXmZZOpRRxN/PmljFGuq0H6HLuYXbHASLE++nDAhRFxyPoiUd02GbJT7zEJGC88MppxWRc19mOj+5M/T8iqGaM+GqQOgTZTSnhpMqgmAc+FDDeHqZEQ19f5TtPwV3N68Iov62BgG3ZxGrS2rw8og==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by OSKPR04MB11318.eurprd04.prod.outlook.com (2603:10a6:e10:97::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Tue, 30 Dec
 2025 15:46:00 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9456.013; Tue, 30 Dec 2025
 15:46:00 +0000
Date: Tue, 30 Dec 2025 10:45:53 -0500
From: Frank Li <Frank.li@nxp.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] i3c: renesas: Store clock rate and reset controls
 in struct renesas_i3c
Message-ID: <aVPzsUgARILuUw+0@lizhi-Precision-Tower-5810>
References: <cover.1767090535.git.tommaso.merciai.xr@bp.renesas.com>
 <d335f1986e23e75b10a5e9f39adbfbef94c58a38.1767090535.git.tommaso.merciai.xr@bp.renesas.com>
Content-Disposition: inline
In-Reply-To: <d335f1986e23e75b10a5e9f39adbfbef94c58a38.1767090535.git.tommaso.merciai.xr@bp.renesas.com>
X-ClientProxiedBy: PH8PR02CA0014.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::6) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|OSKPR04MB11318:EE_
X-MS-Office365-Filtering-Correlation-Id: a48fce6e-2d65-40f1-9bc6-08de47ba87f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|52116014|376014|366016|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?d71UAngUCUVjZLt0fzA1V7ZC1XRWhODTBfbaHQcD4KjfuqXJIAHhEdnhRqyt?=
 =?us-ascii?Q?naKwMlHrjrTJog9Q2zGna7glRj30zyz6+Cx3WI9mtI/SFHDbcaNWYQjQbI1+?=
 =?us-ascii?Q?F71ZETsLi+FdeXA5qgn+pgdXmDCXhQrybBPBESh/YNriPVMe7FbtjVVjYKWa?=
 =?us-ascii?Q?AlYoVwW5hUk3B9MaEbfn/0dwnsfZTqF+UADuaqPur94judljYOfl9yJ26kSi?=
 =?us-ascii?Q?sQRD5OhQqdUv6kmpqNlNzMpec9lbjzvI1bxFvBSoq3b36SlPzT1+271FN8q5?=
 =?us-ascii?Q?jP03+jgnJnd5VuiqZG3+04c0ta8kfXV90sALO9xFd/y/8/2glJ9ZWCBIv0Q9?=
 =?us-ascii?Q?o0E2NLCyI0HLG1ntN2K/UpzqXAhqHBr5bABkf3fk4ykR8OvKgIGc0RARplSw?=
 =?us-ascii?Q?yUIw2VTG6dsjjzNTmdzO0Pk2U07VRq1YgIOswn+O/VqZGblESas8625o0ZwD?=
 =?us-ascii?Q?xG5ojOciv6rWDC54L4CLwHt0W/Fr514MZ4hqoQXsvSq7KYeke3iOBUNbi0EL?=
 =?us-ascii?Q?isGj5q8pcoi+WDiijvWioQoHsie/0eNkch4ewgJlfhOs4iIupKxoaRi30LLq?=
 =?us-ascii?Q?Zoxl7ND2Gp1azj5Bx8V77/LSTRMfapgpqWdDK0XvW5FShmTkNKBJFJaffl5g?=
 =?us-ascii?Q?VAJww8xWJnEzZ5vZNksWd+GNtdSy/gkB8M/TH0rv3pTEUBxEJMV+U1zPdxwa?=
 =?us-ascii?Q?wQmLx0r327w42wV/nZPFacCOFgZI0kYOOvXp78rQgemng3TybRvTB8sroBLU?=
 =?us-ascii?Q?WgnlXxPmXrLFbTy5dG9PQMgQXdgsEO93CQUFDpvo2+h59mWL3Z6ESlJV6pLA?=
 =?us-ascii?Q?Lwjuq25u9/xVaIOKQ877qCk3LcXHkeKX2v5/X8ZXOVhU/aZnj1E7/JMkq5Z0?=
 =?us-ascii?Q?ZDBhjykeFREQgGy+AiZ1xCkqCDgqyNiJZHAVlvJ6fmN6WHPRrNcLqjQ4h+TQ?=
 =?us-ascii?Q?vqF+RZS9ybiFcmgwSBMDA+WcIkYn6cyX15bWj35VA7uOBQEVc7dfOtwdZwk4?=
 =?us-ascii?Q?2Nsi0M4th9n/XEJZRgryUjS0vqYdzdZ+JsHuzkbN3bxYURyjodZW9S2a8f8w?=
 =?us-ascii?Q?ClJS8zB3ot5DYRjbMyDkZWCRf3I9y05/0F7Koekl7B/GdibaQxOpZWCGrb8E?=
 =?us-ascii?Q?nFY+zYm64HwzwAzgzN9+bGC5sTiP7dXozMfr1Kjhe7lyUbfazTXW2FOaiTwl?=
 =?us-ascii?Q?cLx/njS0DxiOmmY5mKUZwilHzhOowvPtLkixeoTDq8P1CFCg7EyxoTsvJn8x?=
 =?us-ascii?Q?7LjfwYhrHb6dJ5BoEXRAPWL7xlTz4j1HoRVeqYsdW4LsTqzKiG0nDBHRhVO8?=
 =?us-ascii?Q?J/fRiRndP6oXPR5K7yXrnxbdsk9dFIfCTaKKq0FG6RVmUPhtmrOYATWzeEVW?=
 =?us-ascii?Q?nJ9XHW+P2T1zU6DkgLDF/mV8tz97PkaYpi+VfSp/jrty9yzfI49Zhud9KrSE?=
 =?us-ascii?Q?ZRDZs1kC7YX9YSSeL4d01Wmepcg5UTun00K7p0jxC/+fqxHnE9ml5qrywAws?=
 =?us-ascii?Q?lW+1J/FtPOvTJUOzwBuE5XIeQ83jkLVL+vho?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(366016)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kfEDw3gjS61O36TchkX9HdydZ3KQojOWqb06n3IP2XJxfWw2/Y5YWycgtgSH?=
 =?us-ascii?Q?LOfP21iklXbavIiLTvXctvCoy/H50fttwiqKydptJG2koTHkvZN4WndwCuSh?=
 =?us-ascii?Q?tNUyHl5XNi5D1D/voIAwpc2jRHOHkaakQdFZ27joj7MBdjRBL/udltPE/f/B?=
 =?us-ascii?Q?6RJPpJwN/xPyONbNXGs8YJGHD3lIHWyKTG/0sO6ve3WL+ilViNQDifkUZzkB?=
 =?us-ascii?Q?JbbhZepliXx8RTxRfKPhSf8X0RiFm0E5O2FfAHZQ6mZWue9yz7aHKVQLKOBg?=
 =?us-ascii?Q?4T66yLsO0oaw7Xioa/Yumjpfo/D9wUqjtbSiu5ZWn7RPNi+mX2oLJPd4DeMR?=
 =?us-ascii?Q?ZnqB5S6DVXkFgmCN/lGqJJ/iQNXz2VcSr2mf/l3VVHLHvvDu/lKbVVGPMRxg?=
 =?us-ascii?Q?a7X8mq8JAWwpprbYKrOahJsD9NH1hj0Wej4JQK0FtJ6PHqpB3RDCoDYWxaci?=
 =?us-ascii?Q?VouvtsnX4DhSEPMFVIFJoCiZWbOV7yLezrboPpQe3sTJY7r/cybdk62r4G4x?=
 =?us-ascii?Q?6vr9rhAxejBAJ4uJNZG1Q8q6cbw530gQTQ7Ze/Tk+ELJJamhVQwOSxUy3SEU?=
 =?us-ascii?Q?ReOrB39p6SfQ/cQqlKawcjd+917jnHR+wjP4/gQm2iJiqa3MyJnaLhyp5zgn?=
 =?us-ascii?Q?be3WgDe8BdFeMgtFQZK4Ir27e1HpD18wOOg+ixdFzS9LgAi1lSvABpEkmXvg?=
 =?us-ascii?Q?0ZMkdp+LCj2mG4Skvib0IzafBCJQOYIzS2TP+FDVs1nyWf4Y563oAM22aa4T?=
 =?us-ascii?Q?1IeIxYnPD3nb4+tMSGFkISMyhRzJovZYVe6N8RBy4eKQdmuqJr2pNhUWrvKQ?=
 =?us-ascii?Q?FZCLmhmtisOHU/+zeuvIepJ0tmzUYc+YioFeMWpylopuO/9xEVyekOitNWBg?=
 =?us-ascii?Q?TILlyk0BnQpnT/H0ittQl4c6zEhimaLHWem4H732saB4k4rAlfItYTYURuR1?=
 =?us-ascii?Q?JD4lzcUXH8iOgmBG+AsP+G56sMiQGFO4GfkYFGOVyED8TQzs1SL6c6kKSfVx?=
 =?us-ascii?Q?TgWXL0h+TuMZzpT14haOGP5FnMj9OOpMBaBkFI2wBl9OhF+2Xmz/69dQZw5R?=
 =?us-ascii?Q?yjkL9dUKQ8stEyeAap3zHG1Xwe5iaBTA746jLb0E1kXP9ZN1LGbCRPHqXdC/?=
 =?us-ascii?Q?3+K++70VqLuz5d9Ovb/2PHjenIyzHD8pOKo9xZ9JYUwCXa60y/Eq223Fy5BE?=
 =?us-ascii?Q?USRZCPJk2bqPOjh08n0oi4egIlBchy4J9yVgc1oPiKTuCuxgXQiMLW8OkNgF?=
 =?us-ascii?Q?jFwaE1aRCRTGbGPAlarihI2CYPmHpIl7PNEWBmq8p6qrV0+Xmo1z5LiYW0qE?=
 =?us-ascii?Q?H7PlsHHzvri2oRoD+WT8qYy0MbihIgb9qkmc/H0XQxdSqEianTxO6RPcjO/8?=
 =?us-ascii?Q?9BpxdawvTJKlYRk6KleK8klHh5ma/gKzFNpnn6MvAFTXGnlzJpv4iM2dM3o4?=
 =?us-ascii?Q?mYv9dIRYzInoJpV5mwAFolQY4NiTdqiufQ6y8RzVVuzYIXUsZiDHA7EsnUCf?=
 =?us-ascii?Q?ZPC9O7ZqUeOs7pn0xEwib6wslTAsjlA3AsmBg3H5L7fmWOIIXrJcVjCrgUTN?=
 =?us-ascii?Q?O8GNUHn28KAFiokc+HTTgj9QTpIV4Ha/rytyE+XmSiYcLm9wRRLTH2JZVrFo?=
 =?us-ascii?Q?lg3c7nZUzULT4mh7vhSL0T9OdvKuHTSLbIOjv3CluHFyaXjIQ5Jo/BQdtstO?=
 =?us-ascii?Q?JR05wmAz7xQFeBIIofN4I2iPHKRnm99eyYi8avx++3hoK2+TkF+/ghAlJxte?=
 =?us-ascii?Q?YEYzn7o70g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a48fce6e-2d65-40f1-9bc6-08de47ba87f2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 15:46:00.4586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XVs0yI45ewAAtwoNgrtxSoHnP9tWVf9va0refqjTgTs10VlP3btMsghm3dCA3inP+GsPbTD8y66k6lroDQ0GhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSKPR04MB11318
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_074606_759907_3EB57737 
X-CRM114-Status: GOOD (  22.03  )
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

On Tue, Dec 30, 2025 at 11:39:37AM +0100, Tommaso Merciai wrote:
> Update the struct renesas_i3c to store the clock rate, presetn and
> tresetn handlers. Replace local usage of the clock rate and reset
> controls with these structure fields.
>
> This simplifies the code, and prepares the driver for upcoming
> suspend/resume support.
>
> No functional change intended.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v1->v2:
>  - New patch.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
>  drivers/i3c/master/renesas-i3c.c | 39 ++++++++++++++++----------------
>  1 file changed, 20 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index 8ef6ff06df90..2736363c9074 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -256,11 +256,14 @@ struct renesas_i3c {
>  	u32 free_pos;
>  	u32 i2c_STDBR;
>  	u32 i3c_STDBR;
> +	unsigned long rate;
>  	u8 addrs[RENESAS_I3C_MAX_DEVS];
>  	struct renesas_i3c_xferqueue xferqueue;
>  	void __iomem *regs;
>  	struct clk_bulk_data clks[3];
>  	u8 num_clks;
> +	struct reset_control *presetn;
> +	struct reset_control *tresetn;
>  };
>
>  struct renesas_i3c_i2c_dev_data {
> @@ -488,22 +491,21 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
>  	struct i3c_bus *bus = i3c_master_get_bus(m);
>  	struct i3c_device_info info = {};
>  	struct i2c_timings t;
> -	unsigned long rate;
>  	u32 double_SBR, val;
>  	int cks, pp_high_ticks, pp_low_ticks, i3c_total_ticks;
>  	int od_high_ticks, od_low_ticks, i2c_total_ticks;
>  	int ret;
>
> -	rate = clk_get_rate(i3c->clks[1].clk);
> -	if (!rate)
> +	i3c->rate = clk_get_rate(i3c->clks[1].clk);
> +	if (!i3c->rate)
>  		return -EINVAL;
>
>  	ret = renesas_i3c_reset(i3c);
>  	if (ret)
>  		return ret;
>
> -	i2c_total_ticks = DIV_ROUND_UP(rate, bus->scl_rate.i2c);
> -	i3c_total_ticks = DIV_ROUND_UP(rate, bus->scl_rate.i3c);
> +	i2c_total_ticks = DIV_ROUND_UP(i3c->rate, bus->scl_rate.i2c);
> +	i3c_total_ticks = DIV_ROUND_UP(i3c->rate, bus->scl_rate.i3c);
>
>  	i2c_parse_fw_timings(&m->dev, &t, true);
>
> @@ -516,7 +518,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
>  			pp_high_ticks = ((i3c_total_ticks * 5) / 10);
>  		else
>  			pp_high_ticks = DIV_ROUND_UP(I3C_BUS_THIGH_MIXED_MAX_NS,
> -						     NSEC_PER_SEC / rate);
> +						     NSEC_PER_SEC / i3c->rate);
>  		pp_low_ticks = i3c_total_ticks - pp_high_ticks;
>
>  		if ((od_low_ticks / 2) <= 0xFF && pp_low_ticks < 0x3F)
> @@ -524,7 +526,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
>
>  		i2c_total_ticks /= 2;
>  		i3c_total_ticks /= 2;
> -		rate /= 2;
> +		i3c->rate /= 2;
>  	}
>
>  	/* SCL clock period calculation in Open-drain mode */
> @@ -545,8 +547,8 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
>  			STDBR_SBRLP(pp_low_ticks) |
>  			STDBR_SBRHP(pp_high_ticks);
>
> -	od_low_ticks -= t.scl_fall_ns / (NSEC_PER_SEC / rate) + 1;
> -	od_high_ticks -= t.scl_rise_ns / (NSEC_PER_SEC / rate) + 1;
> +	od_low_ticks -= t.scl_fall_ns / (NSEC_PER_SEC / i3c->rate) + 1;
> +	od_high_ticks -= t.scl_rise_ns / (NSEC_PER_SEC / i3c->rate) + 1;
>  	i3c->i2c_STDBR = (double_SBR ? STDBR_DSBRPO : 0) |
>  			STDBR_SBRLO(double_SBR, od_low_ticks) |
>  			STDBR_SBRHO(double_SBR, od_high_ticks) |
> @@ -597,13 +599,13 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
>  	renesas_set_bit(i3c->regs, SCSTRCTL, SCSTRCTL_ACKTWE);
>
>  	/* Bus condition timing */
> -	val = DIV_ROUND_UP(I3C_BUS_TBUF_MIXED_FM_MIN_NS, NSEC_PER_SEC / rate);
> +	val = DIV_ROUND_UP(I3C_BUS_TBUF_MIXED_FM_MIN_NS, NSEC_PER_SEC / i3c->rate);
>  	renesas_writel(i3c->regs, BFRECDT, BFRECDT_FRECYC(val));
>
> -	val = DIV_ROUND_UP(I3C_BUS_TAVAL_MIN_NS, NSEC_PER_SEC / rate);
> +	val = DIV_ROUND_UP(I3C_BUS_TAVAL_MIN_NS, NSEC_PER_SEC / i3c->rate);
>  	renesas_writel(i3c->regs, BAVLCDT, BAVLCDT_AVLCYC(val));
>
> -	val = DIV_ROUND_UP(I3C_BUS_TIDLE_MIN_NS, NSEC_PER_SEC / rate);
> +	val = DIV_ROUND_UP(I3C_BUS_TIDLE_MIN_NS, NSEC_PER_SEC / i3c->rate);
>  	renesas_writel(i3c->regs, BIDLCDT, BIDLCDT_IDLCYC(val));
>
>  	ret = i3c_master_get_free_addr(m, 0);
> @@ -1313,7 +1315,6 @@ static void renesas_i3c_clk_bulk_disable_unprepare(void *data)
>  static int renesas_i3c_probe(struct platform_device *pdev)
>  {
>  	struct renesas_i3c *i3c;
> -	struct reset_control *reset;
>  	const struct renesas_i3c_config *config = of_device_get_match_data(&pdev->dev);
>  	int ret, i;
>
> @@ -1345,14 +1346,14 @@ static int renesas_i3c_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>
> -	reset = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "tresetn");
> -	if (IS_ERR(reset))
> -		return dev_err_probe(&pdev->dev, PTR_ERR(reset),
> +	i3c->tresetn = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "tresetn");
> +	if (IS_ERR(i3c->tresetn))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(i3c->tresetn),
>  				     "Error: missing tresetn ctrl\n");
>
> -	reset = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "presetn");
> -	if (IS_ERR(reset))
> -		return dev_err_probe(&pdev->dev, PTR_ERR(reset),
> +	i3c->presetn = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "presetn");
> +	if (IS_ERR(i3c->presetn))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(i3c->presetn),
>  				     "Error: missing presetn ctrl\n");
>
>  	spin_lock_init(&i3c->xferqueue.lock);
> --
> 2.43.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
