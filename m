Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B700CA0ED3
	for <linux-i3c@archiver.kernel.org>; Mon,  2 Sep 2024 18:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dTmo0cdYlupFMb4E6tR5vclmK1Df/9jsLqJ2jwvEKGA=; b=oOojtxQLcg2dOj
	dmco6OBkcbVLATdyJ4wT0cPybtqd0eBxpLktxr7Qk1LXmmIL8izAkEQiTUhlTYndjQ+k6LI+7nBl5
	YGwrPNvmBl3eYFbuuZ5s2wgqvOTDvTK3WxQM/6EYAQO1VYtHt+mFfUU5EF+kVgKoUWHjq0LK23ocx
	O0/FCgMUGLIvP51rQrfGtUUz3wrPwpiwHzTxZzuJNF3C+QC2al14XnG6bphCsRi94w1BsvPJO7Wgj
	WDNpJwajBdCHvFSt7GX7tx0Dk5c/GqpREVikgw4+WRSogYzRyJ/jHuhFERGX2zoxmFjYCcU2QwnLh
	dCINwgBb4JSwnPpHOUmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slBfs-0000000FFZQ-20bQ;
	Mon, 02 Sep 2024 18:21:12 +0000
Received: from mail-am6eur05on20626.outbound.protection.outlook.com ([2a01:111:f403:2612::626] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slBfp-0000000FFY2-16MC
	for linux-i3c@lists.infradead.org;
	Mon, 02 Sep 2024 18:21:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GjRTL+XC0LbnE1NrFsxcLGirczyMzkSgySaVqQEeFzRViQYU/ftf6JCPpgFm1vZCJLzXNp8qYNDBpSnVMKQDdDbzxyiYwsZ9TlwZRKzzYiJp73NLyUvxCTvDKqK29MJBSvqmgvCDp4jYs6c+Hh04sDQV4ox/vAWmRQjq/Z4+zZW+PjSDV+HxbEbLZnVVN8aDb+rqiR6YzG0DXo8DMnmLeA8Yws/JH5w+KFUPs2/oUv8Dp/YkCk9LhlNYyzehSc+Iy+m3UvIJ47rbcB/Ors3kXAKA18RlN8BvkPLNLuoe7hmj0zu4+uzLqKP0qNMkotujcds2T3MZA7chZ4VHH3EShg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ubve0RSP5GjdDLG7Lml9kD1ZL3N9PacIiinSuVaKaV4=;
 b=s1AtlCW10WNJFV5+oQs1O0Xi47MGZoZUaZYeokDXWhhtrtdTsA1GbiyoXJSiON8f0tFGRYtK6zPF45HoGwCzUybt3m2tlUncYnKvneutvUWd1t4a1624AWZOxjeeqlkrMCh18lAE1HdaFOZI4wLlzxRLIR0HLaX0u6+dpgnAM75y+T0CXQuv2+Nltvh1Q/voMxLi9OGEQnJMS7PP2a8xuOmZr+6K3GwrxRlgVgHFKteWHw/M5I1/UHulgU1t66gAXi++Aqh+IL26ypok0hiephMYmL0VWRa2R9T0cJz+ph2Eo7YhoCGzztb7wdL9tJ7UQHr2jtLwNYmshnALEDhkiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ubve0RSP5GjdDLG7Lml9kD1ZL3N9PacIiinSuVaKaV4=;
 b=Tt9ufGKjiI6Kk3sHkFqWMmUch/8FhYk6dMKeGRItR2owkzP8Kbyoi1dT/QSXItCQTYy/6pNzkQMXatf0uRB0DS53dak/9dW8Vi4y706lN4SpTqsyccBRJOoAsrs/5uicCB/cJFh3mY7ICuMQFovPlztnAQZzaq2CcPOnfv8E+JuCyl7VNAWf/IETupLRCoA4YTBy5lYgvbJ7PHho8FINzMPDHYZ6SxBVJAXFtDkmLFC4xFrIFJc1loECIs9X+Ro65uAN43C0WIhA1ZNH25tOOlhUf13v92j6pUr28WSgzryaS9MToK6gL2hl4/BMTdLpHaWaLQR1nLK1pEzdfLXk/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS5PR04MB9731.eurprd04.prod.outlook.com (2603:10a6:20b:654::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Mon, 2 Sep
 2024 18:21:00 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.7918.020; Mon, 2 Sep 2024
 18:20:59 +0000
Date: Mon, 2 Sep 2024 14:20:51 -0400
From: Frank Li <Frank.li@nxp.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Parshuram Thombare <pthombar@cadence.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Conor Culhane <conor.culhane@silvaco.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v3 03/11] i3c: master: Extend address status bit to 4 and
 add I3C_ADDR_SLOT_EXT_INIT
Message-ID: <ZtYCA9cYywmUaJSQ@lizhi-Precision-Tower-5810>
References: <20240819-i3c_fix-v3-0-7d69f7b0a05e@nxp.com>
 <20240819-i3c_fix-v3-3-7d69f7b0a05e@nxp.com>
 <20240823180426.056ac093@xps-13>
 <ZsjNA9JV0UKONV32@lizhi-Precision-Tower-5810>
 <20240826100430.33194702@xps-13>
 <Zsylya9TN4mVFL79@lizhi-Precision-Tower-5810>
 <20240826184924.53b48861@xps-13>
 <ZszPrBeoPehGsocC@lizhi-Precision-Tower-5810>
 <20240902161250.26846654@xps-13>
Content-Disposition: inline
In-Reply-To: <20240902161250.26846654@xps-13>
X-ClientProxiedBy: BYAPR04CA0019.namprd04.prod.outlook.com
 (2603:10b6:a03:40::32) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS5PR04MB9731:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a38ef4f-4bfa-4fe8-6dfb-08dccb7bfed2
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?gAt3FtDyLOHY/pNeSM+kTiNkhz0DbItwQLw4ZXrYibpO1bdsV2ZaUPkgr4?=
 =?iso-8859-1?Q?VOE9g0VErWsZqiU1otPK2WYSlfQ0lQNu44frHUxqE7QMYYr7DJs3B5jPXL?=
 =?iso-8859-1?Q?NgqrUKMnawjNDKuPR6IGjAcyLjim3O2FlCngm4sUV/iNVplHv4tadsFjg2?=
 =?iso-8859-1?Q?+Anp2BEK4ZwdDKQwK87qDfW/SSygUo9vknvZgNNqpKwBCgb+1dFSk8i8v2?=
 =?iso-8859-1?Q?OO8dXja6SI14JGvRZO9P5WOhC5CauSdWEXYOtWDBtpsmDWir5wYyLLcDl1?=
 =?iso-8859-1?Q?V/+xb0QhzoGIkBOe0sTX1W7LytfuKEMveuor3j14gSSAK2kuJdgxfrKAk2?=
 =?iso-8859-1?Q?Xxb8/AGl3NQZKHDK/FXAUaWAH+mIL2DXj/U0fbCG1kqnwyt0MXmmPWN8tH?=
 =?iso-8859-1?Q?fRaI5cpQDv2ZF+We1JTAjGN2MUj34RFFgvnWcOTrHX6ZapB7/G5WtZgEkj?=
 =?iso-8859-1?Q?OUsBelQP2jE1fc7zTUpn/Kl3mBM7rGjqPokoVwhnPgDqlot/S6n8MjAvWx?=
 =?iso-8859-1?Q?OM6qK1jsxrwlHZCEwR5I9NCinaZnX53aaAjFhrCvMdUS5dvCd45wpTm+aL?=
 =?iso-8859-1?Q?IXAluWniwiR1ldGB89U8l+o2fpG07xsF3ZrVLcUKTzgbO/vGMk0rZo7fYs?=
 =?iso-8859-1?Q?3+M6YiZOI/hy8iKoQGEOGuwI3NIhU2AiXIekBVxEbBkF7NwT40vf87RGlV?=
 =?iso-8859-1?Q?SwaoCqXqgWPEJ7l/0m0DKB7goinEQ6aWE+y2jYrbKINEQQWUClH0pmD14r?=
 =?iso-8859-1?Q?7tzoFNNf/nhGuiY7WLlH++7e6/Hkfmt6Rd0UVxyv92RDyc3/1QAbH3af/g?=
 =?iso-8859-1?Q?k6OfHP9hVldJPU3Li/1zTNzV+2+EP0zG5WzkXaXB9Hl3tuTBScTDytRxv6?=
 =?iso-8859-1?Q?yWJECkqRp1FvJkKDE5tdTG1/P4w8rlp9d41pOpA2YYpoqF1xeYFu2pCyTo?=
 =?iso-8859-1?Q?RvzNrgiQayWiLzZOKqE0n0oUeBcuPIWDP65cJB0iwcugLPBsNZmS/zUaBU?=
 =?iso-8859-1?Q?8cfFMjB9EDWhhiN/g8TKGjOZhTV66Bq5dHOllNHe2J0B0HD+5/FfTjN99n?=
 =?iso-8859-1?Q?LZDrL2Q6WBvyuNUmDtDpV3W+BtEkGN+2BlkKsJm7sGIqv3kbFDHGGKUQFw?=
 =?iso-8859-1?Q?uhne6QlJcjiRSXvkkhvl5wKa5GY5OQ5GuS638aoL4+Hxx+jIZJy0tBkr3P?=
 =?iso-8859-1?Q?QV7bF350ICEcWn/TMktxa2lGdRvkmiaFLU2dnnwk0r70chluLYtYK1CtQn?=
 =?iso-8859-1?Q?eDoLXIB09+sibEMTwZ6bl/tcAyYmybWdnp2c5gXQQ27i7aGMIQSdFM5wIe?=
 =?iso-8859-1?Q?ewa3zNml8n/gjuaP17hGdQZRDv+vNIEpxwqrCBJmmW99jGFcRvvfexsL+F?=
 =?iso-8859-1?Q?KPQDwotG+BVQGwabj5dhXQdvg2odDMc00ISPTMaUDeLg6qCxrVcC6zzfzC?=
 =?iso-8859-1?Q?0ActzqtjrvJvXxT7mrJnXPayb9QCRfkxSoa/qw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Ewrxm3zGLJBAVpKM58frqa8VGOX+hDgcApTVu519KG1hWHhLDoNGwm0GN9?=
 =?iso-8859-1?Q?F0vGOw04C9aPCSfo4GOp6QP7BMrpi6STwOWPjCcfRYRYUyxZD8W0GVmK8H?=
 =?iso-8859-1?Q?Bweyalr28OOc3cGADXarhBDINSC52r8uS3mWGvo2QF66O1iYQ/XShJLdCa?=
 =?iso-8859-1?Q?McyTkknfOfZpMFIjSwLQam8cq7j9vtfPEnE3raIFsMXt/eBBPCJUehvuRu?=
 =?iso-8859-1?Q?lyuKP5wYlHi42J3Sy+IufdgvszgeEVcSbOSzURBdLFhuQKA2/e8Tofu8T5?=
 =?iso-8859-1?Q?OffOe8FBCZwr5bLFaSRIo81nh9xHJoOm5tdp/nZsIFgzli4W8RuNUcQrvB?=
 =?iso-8859-1?Q?xAx9EVutt/Vb/d3+HOiZ4/kNUBljx3EbkDrzMlXWr+1cGVdns/nlhu9IJM?=
 =?iso-8859-1?Q?UNn3poSw9NjtpCfHl1u83RY3vBt5R5zBDxMb6EneXmBmyAwKn8M2IQ6wC/?=
 =?iso-8859-1?Q?eTDRH+FAQaGaxAQcrXlPvjmQVnPe9nyo0PHaN2+mrNMgwq812bkhHDC5kv?=
 =?iso-8859-1?Q?9XeWN9KG6mGu2hU911CM71wtJZvR8eW6lbSsoKv8rhpjJU8Aq5Z3OsX/FR?=
 =?iso-8859-1?Q?PdaxlyJ5O84b0iyx20imTaVUxRc15nopiLlNASXj9eMHm1LeotYR/64yas?=
 =?iso-8859-1?Q?fmR3Ij3ag1ZDPSnNMNwndRQI0iAcWL7GR1DovK5e03n2CusSRTF9nLygw/?=
 =?iso-8859-1?Q?iY7Losk3EEwcte8hKjJr1gcC8+X4CuHewb77pGjfEFkiVeSdWsNVsxyNim?=
 =?iso-8859-1?Q?TtRLUGz/Dy1hltE0ps6F4dxAoKNils+Bcok0gWMSB/ncXJWEOemoPy4iDy?=
 =?iso-8859-1?Q?M7PaoObexqONHWuIPdzGBt2yCpiuzc0njJ2z9p+ivTXUp2gnzQtmjtqFbj?=
 =?iso-8859-1?Q?T5jX8UHXfDZQ6l+8Sot3NHaxE0d1rws4dp53kyq+NsQblQPe4UZVs0M/bg?=
 =?iso-8859-1?Q?lOTHHybF70cK+mtdVnhY8Ih/gd/SyGhjpFKIX23E+xO3dHqNs/ZlJV6Xif?=
 =?iso-8859-1?Q?1kBX6u68h3mXYZNzrnKcIg1lbU4Zz0ZOtLZSrCoYzj5mqqAj7wAK2bWRnJ?=
 =?iso-8859-1?Q?YliMoMsVuQEGBALzKEMZEN1xIfeMw/xTCxL8E/tXA7F9XyXzVA8gdfYo/2?=
 =?iso-8859-1?Q?4iJl1Q/vGRBxjlh3c/VlmXB8ZO0kFVijUPam1KadU7FYseiwdgdMtdJToD?=
 =?iso-8859-1?Q?Q61zLh3KgGCZ94dX0vFHX3QRTjso5zMv7RhLqbwtfPbg5EgEC270zdua5r?=
 =?iso-8859-1?Q?rcXFkcLYDPyu+51s/gqgYykgRcd98W9azoU6hVn5YvHeJlDNxOV+G4qIsZ?=
 =?iso-8859-1?Q?9xpZc+qL+W43149tS2IDgbr0bmyIdDXv6t73zJQRoYYuIzcsbAlTD9E98P?=
 =?iso-8859-1?Q?VSXMEWVp9RxZl63rn/ZLijXtLEtpx1JdBHX+0TjkBrz8Ue76wkiN58NOCA?=
 =?iso-8859-1?Q?12nNn2MVBCFc7xrCARcRT7M8mVSBC4NzlenPbul9rer/70u16aDTaF+lHr?=
 =?iso-8859-1?Q?AKeD+DiUcRH6w4DrFDb56SiPhri4x7SojEDPFFYlSlJnoqwXaAmJRJQHNp?=
 =?iso-8859-1?Q?KBpSD7b6x8UKshHjCpiNCOi+y/o9gQLlxLHzV7DGkSlTQcYDMKzCmJ2Mlg?=
 =?iso-8859-1?Q?FL/kbNqg43AOsmimh2rc9GC6bGus3DIlp0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a38ef4f-4bfa-4fe8-6dfb-08dccb7bfed2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2024 18:20:59.7920
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oiPMNmwkQ31Ya0UsKdv0fqrxTx9eDa/AaMiCK+eZFiRiJXIqoyt++GVWnBRYxnM4iZpwXv1TLjGp35UbmYwoJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9731
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_112109_331832_788F7596 
X-CRM114-Status: GOOD (  33.46  )
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

On Mon, Sep 02, 2024 at 04:12:50PM +0200, Miquel Raynal wrote:
> Hi Frank,
>
> > > > switch to this address if it is free.
> > > >  *
> > > > In step 1, i3c_bus_get_free_addr() is called. To optimize for step =
2b, this
> > > > function should return an address that is not pre-reserved by any t=
arget
> > > > device with an assigned address in the device tree (DT).
> > >
> > > This does not make sense, if you want to optimize for 2b, why not
> > > selecting the assigned-address property in the first place if it's
> > > available?
> >
> > This is my first idea. But I gived up this way.
> >
> > Select an assigned-address here will involve a big change in i3c framew=
ork.
> > There are no PID information in i3c_master_get_free_addr().
> >
> > In DAA flow:
> > - SVC is get PID first, the get_free_addr(). This case, we can use PID =
to
> > get dt assigned address.(if change/add API)
> > - But HCI, it is difference, hci_cmd_v2_daa(), get_free_addr() firstly =
then
> > send out DAA command. So no PID information when call get_free_addr().
> >
> > To cover both case, return a *real* free address here is simplest solut=
ion.
>
> But this is a limitation of the HCI driver? So why not addressing this
> in the HCI driver instead? It would greatly simplify the core logic
> which becomes complex for wrong reasons.

It is reasonable requirement to reduce stall SCL time. After get PID, SCL
have to stall low to wait for software get dynamtic address, I3C spec allow
relative long time for this, but still better if hardware can send out PID
and dynamatic address together withoug stall SCL low. Pre-alloc adddress is
good method if consider this.

>
> > >  Also, I don't understand why you would care to specifically
> > > *not* return an address that might be the default one for another
> > > device in the first place.
> >
> > If devices A (want adddress 0xA), device B (want address 0xB), if both
> > device send hot join at the same time. device B's PID less than device =
A,
> >
> > Device B will be found firstly, call get_free_addr(), 0xA will be return
> > if no this patch.
> >
> > Device A, call try_get_freeaddr() to get 0xB.
> >
> > So Devcie B will be assign to 0xA, and Device A will be assign to addre=
ss 0xB.
> >
> > After do_daa command, framework will add device B and device A into i3c=
 bus.
> >
> > When framework try to add device B to i3c bus, framework will try switch
> > device B's address to 0xB from 0xA, but it will be fail because 0xB alr=
eady
> > assigned to device A.
>
> Well, okay, but that's exactly the situation that will happen if these
> devices are not described in your DT. I guess it's expected that a
> device not described in your DT can be connected, thanks to the
> hot-join feature. In this case you cannot know what is this device
> preferred address and you might end-up in the exact same situation.

If not descript in DT, it means that any dynmatic address can be assigned.

>
> May I question the need for preferred addresses at all? Is this even
> part of the spec? What is the use-case?

It is implements detail. I3C spec said lower dynamtic address have high IBI
priority. Spec just said assign lower dynamtic address if want to higher
IBI prioerity. Using DT assign-address just is one implement method.

>
> Thanks,
> Miqu=E8l

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
