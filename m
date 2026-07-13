Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBFB8C43458
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Jul 2026 16:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cMSpOsyodAqyKPNIyXce0JyC5lHc4JKGe0g7Pb1lIBQ=; b=CJpkJxbbVtZEYU
	5jJIKdgkqHZ5xXUIDW3MFx1YxW7R83vX5XwvSwZ8dUv8/Hz7K9byumDrljG132a96q+mlLj8flf9q
	wkygKF7sqX9Y5ZPrS43Qgpl7qpH3YfHASFaDG8Qa5SgrmApxAQzRugQXZgXBPqs5vLCYYu5A15iDn
	X1vyusVhOYa1L58QYjrRzJxEUtfiRqttdQYUAAEgLH7sP2Vtpc5DdBB+G2ZJkT2vFoepl0ga2vrxO
	oXhVR7WIc9paOS/3TjGsnnPb03Ao1kJjBW0RxYecA5Y8yYyTovuDBQ8hAqEVWodXqOOQkEep6JYhu
	X7s2TlDsTuxpM5dIWb8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjK0Z-0000000A2Ws-29SY;
	Mon, 13 Jul 2026 16:59:55 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjK0X-0000000A2Vn-0WfP
	for linux-i3c@lists.infradead.org;
	Mon, 13 Jul 2026 16:59:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XA3KTUWk/7XglTCyGY8RjivOvUjz3/uja8GUZdEOy1hGSeP8LXUWrt6m4dDICuASEMJUiLtfe3F8bYBQ5UQ5pvJKFREvEUBbRrB55G1YLPJNG2WWXgLf0g4mhNsldnoQiNWSIUPV32OisOpdzN5LLryCLVZrHI71oIhBI/DKTE9i3+xSGtfJ9nMSMYPXPn63bnDtDrA8vvO2AQkplHdGmFtq76o2P4i0Qpsl7lkM0Bl+P51GfnOgKRi3u3y2SOQ4DUK3drlin+pmDkads8bqtKYRTAZOab8b3VOzErbn95YSjAcYzkvp9PLSfklCBKBx4+mHV/U1/+Fgau4Ve0ljjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g32cPXUFqv26D8G8PXCYguyvNFpuPR2fYQMvf5rPmac=;
 b=GQzhehWbuSLhOoxIk1vss1I7SiT/3by1t1wn6q+XT7C/Vog1eMoQ0ZvP3Qb412++PJA/CVeS7hplSsGc91E+ZvMu7IEpw5Tz3O/GSH9FJjs4SH69HxPMAq+kkbU+KN6PCZZwPb7rfPRuY6YwK9K0qhKZYM3DkfuDutpDHe0WTUSv7HCDZYFmI6hMmq7EkMG+fTdjFYJrAwPX/WxuWHjp8GVLgZAx4LyRim+dIOuDmzO6nGlGzvuSXUIt3xWViyqB7yOHOoSv71TVxZ7FgHBHE88g2NMzPNrsT0kw3Hzb6Qx0Nr2coaeP4xaCg/B85V3KF8a6qopU7uX5z1mJuyzW9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g32cPXUFqv26D8G8PXCYguyvNFpuPR2fYQMvf5rPmac=;
 b=B3JPTtjGo8NKXmWXzD0+ZHmmr57Dmpk9yiNJur+Txo0S0keKKTQxZhF1ssjCYIPao9XoSRqGG8IXFnTmL3ZU8w7JF2DQ6ic3njVkwjIVX7HpEpjWeRu+QmTXnMzlzFI4nkRXhTxarm8jgXePLJye7Tg4mDO8aOy1tu/a1z3oF1NI2c84OLQqwewt2236wtRhjzPeV61QW0E222oNqctWDK2RH9hW6Tzd4kAuyySMZ07sBimJWIUCLFQwgUbjTBEH+z/LlXEG1jCw/C7ft1xbcQj7FVdd4ZW91brVvHk5xtfXL8ZR6TwxGuPq+Ibukm4GR/nUrCXqsUZfP4WqWsTT5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VE1PR04MB7342.eurprd04.prod.outlook.com (2603:10a6:800:1a0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 16:59:48 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0181.019; Mon, 13 Jul 2026
 16:59:47 +0000
Date: Mon, 13 Jul 2026 12:59:40 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	wsa+renesas@sang-engineering.com, Frank.Li@kernel.org
Subject: Re: [PATCH v5 06/17] i3c: renesas: Perform Dynamic Address
 Assignment on resume
Message-ID: <alUZfNwy4VlMr06f@lizhi-Precision-Tower-5810>
References: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
 <20260713130545.568657-7-claudiu.beznea+renesas@tuxon.dev>
 <20260713135032.ADFB41F00A3A@smtp.kernel.org>
Content-Disposition: inline
In-Reply-To: <20260713135032.ADFB41F00A3A@smtp.kernel.org>
X-ClientProxiedBy: PH8PR07CA0036.namprd07.prod.outlook.com
 (2603:10b6:510:2cf::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VE1PR04MB7342:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f7f9c2e-9b37-4dd1-c846-08dee1002550
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|19092799006|366016|1800799024|18002099003|22082099003|6133799003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: JbQInkzOFXUIDvzbQa/Ashpbb4TxCwiaV8cZz7jLncoXKBm0z562DI4d0mjcHEaqocMllp5Y6uIMJjwH4lYJPAEUjRJ4BY62lf4jRAA5RFq2XAFWWckWyFUu2uWiqTTY2C9mCshM5FIOJ5n8QzNaPmceArHNoaMgTnaA0VumqpcNntRBJBkKDhX0WyxcVxzZAEnS3+P/pYpDw8FNik49N5mkRjqjiDHu8yRa8eYcRkFpJRHlr+RN7bJF+5YXB2UJ34XbT8SjV2H7ufszhXqYjOu6AFvPxdzOE+pT+mS4aVzq9xcRdB5qmjQlYoZ4sd7F2YSWDo6B4dc7d0nRvMV/xk77D/Q83hW4wyd2QyYEW9SXyuJh0vAxixIX81cPPxxAxtg2nrFuxFtQiCG1NH7PsCt6Va58sM1eYuIJ0hdXBBn2hjZzmUWvn/JLRW2Uq1TpptKO5ph7CIU5Y5bCORjsAkwcoDqGBBkzaSciP/n8sfa2VAfaxY0xv/onQ8Ca9Fo8XQnK6bwM/LO/5IFSepNbqzIQOTTRANG+TgLUEfSZbaiJ03CZQJbCz9EEC1rYy2UVEH3V9xTTd6or4s4DUhTxy4Uevlz8SDHg5qbCygfcPZw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(19092799006)(366016)(1800799024)(18002099003)(22082099003)(6133799003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?m9uBzakLe3M60aNZlQazigaUuETaub1BIaXhEaUwueSpFxIGthXyOYcbhd?=
 =?iso-8859-1?Q?pQ9D/OFiReDkhf7C4JwQd+pfG5Jd/xBGmRr0AonrCeHiVmICWodOcTIJcu?=
 =?iso-8859-1?Q?tky5ZrAyGZOUjTUaKnYOHrDf1vn3JURDy2uUqoXFhOIvcnBlIJ1+Vk3SJG?=
 =?iso-8859-1?Q?AmbsJ6oQkk5j2Rvop0ebujOK9zrkCFSkMQbFE9O18mQTxMMOuhznRPgeQd?=
 =?iso-8859-1?Q?2IufDNYYMW4Au120rFXkq4E9RbngQk3CIpMirln1/Imn+U84AtSnXZGb/S?=
 =?iso-8859-1?Q?EqXRh0HJ94drnXjjETbq8C7IasNV/v2P9RMH0PpqpYT17mkrB5AqiMvuYP?=
 =?iso-8859-1?Q?x2toNgxJUXYh+i17uYCUjTXxPnX8nsOto1znIPfkFldBA433zEDCScYWxv?=
 =?iso-8859-1?Q?S7LZyF+Yas7cjPWucgPkcA19H8LB4/VwOYB0Sm99Gg27P2EzsmT0CWWdoW?=
 =?iso-8859-1?Q?mSy5OYrekm68WrT0UVIWS+KXr7wSWlvib1Cqe5ROHMEoR23VZu2S2bAHQ6?=
 =?iso-8859-1?Q?aN4aJnV7aXBNcJ1QctCCZ1K0T54JuKl4Ax0XSKHUFIC88htJmsPteVXdO4?=
 =?iso-8859-1?Q?fatb4mhrxKDQAuTh630i9MD/WcUv6FdoE55ojAqRfTfr/JU27fduuO14Zf?=
 =?iso-8859-1?Q?tck2PEtMr4EWSQMVLleNTQkR7/ivgBMJfZPtERf1qskyL0S5E1JyBNPPnb?=
 =?iso-8859-1?Q?RlW+VtKWi241/QFxtU83g/8uI4n+NpjT8J7thVew85jMpFzd2JhJsRZb1V?=
 =?iso-8859-1?Q?zWFg2RXzfQ/8/qOZA5zs3xxZuMedWlSvp+pLt89GKv0TSr/KkO00dlMXsf?=
 =?iso-8859-1?Q?e8PmzzBSsiovw+64ZzYTXqSJWe8Hp7l01VNjwrdE0Nur7WiR0lNys1kFK2?=
 =?iso-8859-1?Q?gvvbtd0qmVGZFh3Hjy+2Zv+vuNQJx39FSscS02XiqaRbwbxmAPiiKHfUn9?=
 =?iso-8859-1?Q?VmEGFx5gYja3LUBxKTzA31VK+lAtivYIHF+3iSaqkVknX4j47pnQOrkCRD?=
 =?iso-8859-1?Q?x83QpXn0+Ezty2xUwlpaNVgRj2yHNjBDVQaPPmHX4vcr7qIBTzBGWiCwdk?=
 =?iso-8859-1?Q?+FgiI6kTEkeH3Eu5pGv8fw1Oa2HfeJDlwjagvORjSNpYOIK8Sj57aKj8vX?=
 =?iso-8859-1?Q?uFs/H6eSavF2RHpJpBQU9yzMgZNffdnMhohEEVABUKS5KaUIq/YeNeAU5l?=
 =?iso-8859-1?Q?UL4rNOI33pcehUyf/Tz1a3cvyxK8dYTlMZlewqT/EyTusE4NbunitWAuKL?=
 =?iso-8859-1?Q?TvK78LgTgby4BulqI6ihUP0AaiECJKwSwwby5PT8Tok9LNe45zi6W9upiE?=
 =?iso-8859-1?Q?XlHGIKNq6uKmvGPRTPZAWnnUwXv1Z1vWpIrZf7nByidyHc/Kv9D9Wk7Dpx?=
 =?iso-8859-1?Q?lt96USXYxtX86O3SPoN0wo1G5Hxp2wo8KF+1y8xp7rzlpkZp3MTHePYNdS?=
 =?iso-8859-1?Q?pfo6xuf5a+waFA1tli/K5vh79VeGGMjwOMvXyrAoZ/xO5rNv8cT1LCQfsi?=
 =?iso-8859-1?Q?H7WjJlqc7SSyeSrgF84TvKd43t8ULvtUJiZ8QAkikfWk99YIXyi3tl2mW3?=
 =?iso-8859-1?Q?Gl/0bkRS+Nfi86uWsX7ZXkA+z10g8Ban7MWaUlsZVvTvjj2yVntRgQnsGu?=
 =?iso-8859-1?Q?Fea58ALDtz67w7sTh7cvoCm2CJAwoPlV4KluYCLk2hb3rfZz7D3a1umofq?=
 =?iso-8859-1?Q?Y5MFJiWHu0aQ2IquccB0Bdx9pZxzd1Yr40H51rUgiyWpWw8tcvUJ5lB5WC?=
 =?iso-8859-1?Q?tA+ouuieL2g6roz8MXDc3YWfeuL1J5c5Bf6vGVDFphFxn4PC6+IULqvp7h?=
 =?iso-8859-1?Q?1ToqR3kFkQnGLKB/LeCOrCq02Mv/UU/Sq/1RvKRNJKF/muRx9vTn?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f7f9c2e-9b37-4dd1-c846-08dee1002550
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 16:59:47.7174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MruybRC9z2iA7Ef6MxG7OkErsnI/2z0TSe67qhftpt/ldscH2bzzrGmH4vLQPDMBD+L4ICiKtGu6xZQ2Gyj+CcsSq8w5bcEx5DCdNbdg7ABNhKf9TTgK5BNtmGBCj6hH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7342
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_095953_168232_3F3924A3 
X-CRM114-Status: GOOD (  23.50  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Mon, Jul 13, 2026 at 01:50:32PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Removal of the DATBASn save/restore mechanism completely breaks =
the I3C bus upon resume for previously attached devices, and fails to resum=
e if the bus was fully occupied.
> --
>
> --- Patch [6]: [PATCH v5 06/17] i3c: renesas: Perform Dynamic Address Ass=
ignment on resume ---
> commit e4ac838c055dc33beb2ff4e8968a032da48a2a47
> Author: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> i3c: renesas: Perform Dynamic Address Assignment on resume
>
> This commit updates the suspend/resume operations by moving them out of
> the noirq phase and attempting to perform Dynamic Address Assignment on
> resume. It also removes the save and restore of the DATBASn registers.
>
> > diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/rene=
sas-i3c.c
> > --- a/drivers/i3c/master/renesas-i3c.c
> > +++ b/drivers/i3c/master/renesas-i3c.c
>
> [ ... ]
>
> > @@ -1495,15 +1484,19 @@ static int renesas_i3c_resume_noirq(struct devi=
ce *dev)
> >  	renesas_writel(i3c->regs, MSDVAD, MSDVAD_MDYADV |
> >  		       MSDVAD_MDYAD(i3c->dyn_addr));
> >
> > -	/* Restore Device Address Table values. */
> > -	for (i =3D 0; i < i3c->maxdevs; i++)
> > -		renesas_writel(i3c->regs, DATBAS(i), i3c->DATBASn[i]);
> > -
> >  	/* I3C hw init. */
> >  	renesas_i3c_hw_init(i3c);
> >
> > +	ret =3D i3c_master_do_daa_ext(&i3c->base, true);
>
> [Severity: High]
> Does removing the DATBASn save and restore mechanism break communication
> with previously attached devices upon resume?
>
> Looking at renesas_i3c_daa(), it explicitly skips hardware register
> initialization for previously attached devices:
>
> renesas_i3c_daa() {
>         ...
>         if (olddevs & BIT(pos))
>                 continue;
>         ...
> }
>
> Since the controller was reset during suspend, won't these hardware
> registers remain uninitialized (0) if DATBASn isn't manually restored her=
e?
>
> Additionally, if the bus was fully occupied before suspend, will this cau=
se
> the DAA process to abort entirely?
>
> renesas_i3c_daa() {
>         ...
>         ret =3D renesas_i3c_get_free_pos(i3c);
>         if (ret < 0)
>                 return ret;
>         ...
> }
>
> If the bus is full, free_pos would be 0, causing this to return -ENOSPC
> immediately. This aborts before the ENTDAA command is sent, which would
> leave the previously attached devices permanently stranded without dynamic
> addresses.

Please check this sashiko review result?

Frank

>
> > +	if (ret)
> > +		dev_err(dev, "DAA failed on resume, ret=3D%d", ret);
> > +
> >  	i2c_mark_adapter_resumed(&i3c->base.i2c);
> >
> > +	/*
> > +	 * I3C devices may have retained their dynamic address anyway. Do not
> > +	 * fail the resume because of DAA error.
> > +	 */
> >  	return 0;
>
> --
> Sashiko AI review =B7 https://sashiko.dev/#/patchset/20260713130545.56865=
7-1-claudiu.beznea+renesas@tuxon.dev?part=3D6
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
