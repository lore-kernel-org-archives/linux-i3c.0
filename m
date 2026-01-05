Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62CB1C79FB0
	for <linux-i3c@archiver.kernel.org>; Mon,  5 Jan 2026 18:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kh11s1SlWEQo/6p1LHCQ83ovqgi/T4eJc6V0fjM91/s=; b=Qj6ndsmErAObTH
	4FoFnevVeNqvbW3koaXU7uHLJsRAJbtdAeXdULxL1V0Dn2ATX7eRypjBm0kWg3FsJCYN4OhPXOII1
	OtoOiVkuj4e4crA1ZdLxfV2CNDSoEjhsslKRuBLiBTQsrwCC3HazTJzWFlHOtJKCIfyb4OjvHNoPk
	X+orlKSQCg9Xfboc+XD4UzGgthcyW7WrAMuQPKTWEN2i5L5AuI4+w6cZDCnzGKHo7Au3U1DwgkcFY
	fJB35VcDhuX5Z0sYtJksqJshg/cKfqbB6gV9/GxO4o1bjji2DOw0KbC23OStSeBQENnsBC+dpzAkN
	kJu4ZHETqP7pBvGk9kdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcoyO-0000000Bu4c-0Xqx;
	Mon, 05 Jan 2026 18:06:32 +0000
Received: from mail-japanwestazon11010032.outbound.protection.outlook.com ([52.101.228.32] helo=OS0P286CU011.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcoyK-0000000Bu3M-3TWo
	for linux-i3c@lists.infradead.org;
	Mon, 05 Jan 2026 18:06:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tD6jpO+rGC68BqzGXPWncz12Zl6NOClnZ7Jhw/suq/3kS4GQTlzX1d74588Hjr5NXq1rVGM/Civbn/eIAbykKrgJ2iTY9/BPusZ11+ycj8462HP9O3B9bgi8RLcyFQyVapbh2249knG/gvc3Vrz0sIpS936GX2HAMOouF4eI0VLfDL3OBMmUJwI3E4yUp/mTapp6Us3TCd9G4mwvWK4GfVrSLV6ByuFiEm6bO3oC9H23ze2D8hymnRSRrQ+/+UW0ByjGplmmEl1kLZeFRdG07YmKd61TtoXtBd5eb6FP9Jx6JFjlxpYgCbYgaghY8KO+tQM9FWlBOJXGgfpaX4ltgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u3LcWsllV+mgOrtKktG0gko816OeurStZJuhI8LX1/g=;
 b=PFhsErravpZdQFOu+iRBNsHf0jaPeaz7cxWT01cfFegFE+yMDHq55MtsxHx1oTb1ppTFrKn9B02Gao2gr7NfgPkfmVvALAlGHsxzvRxaX2Is9BZohvwAC58i68hkupRbl4xIP1PgDh8LSYSqmNT9mEAC9jSY/xFAFFZfddE5z9FYLFt5+70m6G7QojfRvBRR/a7TksUM5wRJ32iqGyMDCQuoikcI5W9h+DjXIfgm2M+gBWnwAVyPiFSleycY21xEccuFbyjtIjST6xx0IKsmcDs1v46lFsgmNkdr1khWFqbmTtIPLSLPIGX2kPKVMBEMsEvsp91ZB41kR+Et3nsK1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u3LcWsllV+mgOrtKktG0gko816OeurStZJuhI8LX1/g=;
 b=hWOBfJUGVpL2ZieoIjzATryGvuQnffHjkmzKZf4lBwYvnrH9hx9iU1Bzy2kbnoabl47XK4Qgdl3WjtnbNGKwvbo0HfM7hU3X4BKiO+vrvsA/qcrV8kvBuFje5oLJ/i9uvv47z51T6sfRilbLpe4aARu0hwGThbz6zu0f7OSxjBM=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB10480.jpnprd01.prod.outlook.com (2603:1096:400:2f7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.1; Mon, 5 Jan
 2026 18:06:20 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9499.001; Mon, 5 Jan 2026
 18:06:19 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Frank Li <Frank.li@nxp.com>, Tommaso Merciai
	<tommaso.merciai.xr@bp.renesas.com>
CC: Tommaso Merciai <tomm.merciai@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	wsa+renesas <wsa+renesas@sang-engineering.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>, magnus.damm
	<magnus.damm@gmail.com>, "linux-i3c@lists.infradead.org"
	<linux-i3c@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 1/4] i3c: renesas: Switch to clk_bulk API and store
 clocks in private data
Thread-Topic: [PATCH v4 1/4] i3c: renesas: Switch to clk_bulk API and store
 clocks in private data
Thread-Index: AQHcfjEd/HHAzFY+c0mlsn4qV6uoULVD0GoAgAAOSSA=
Date: Mon, 5 Jan 2026 18:06:19 +0000
Message-ID: <TY3PR01MB113466E129D0970F0E2541F7B8686A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <cover.1767608450.git.tommaso.merciai.xr@bp.renesas.com>
 <94d378e99ded450ba118813b35239f9a10a73daa.1767608450.git.tommaso.merciai.xr@bp.renesas.com>
 <aVvw3pjhphnVv7g2@lizhi-Precision-Tower-5810>
In-Reply-To: <aVvw3pjhphnVv7g2@lizhi-Precision-Tower-5810>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB10480:EE_
x-ms-office365-filtering-correlation-id: 78c9fe08-7394-4013-0ef6-08de4c8520a5
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?BYTiTmEhMMqj2di2VKVYSA8ri77BeY7p6b0UV9JSny00II8rjrkMvEZsgZdc?=
 =?us-ascii?Q?fiQmI+E2AXf6hIfBVFK2XIddh5RrVojBoAW118L39oahshKEPZYkleu4dL+/?=
 =?us-ascii?Q?IvSWcfn/OCR2QPgLsj6DVYknamaKaAbhuOhhMvPO8UlJSBkneGbNZrovn8ax?=
 =?us-ascii?Q?/lu+R7u5Tfno8NdXTgnrOvUzjoKYZShJdzbs8vwWaqOzp/nH2+TmXMFYZxI3?=
 =?us-ascii?Q?/LAV83egJuZZ349/DzxOiHRCQltiTsAc9cGpiI0g+EGA9Bf8pCP6dDsCfCh7?=
 =?us-ascii?Q?BzNvE/v8IjkW+M7gcoA4TUMqITFyeA3320/2JsJsDCyo89b6TIXccVTekk7M?=
 =?us-ascii?Q?qFEAo8qXX9cpEnKP5+U5D2RIdEutK6dElr9MPCC/O8V/shleGvduASg4n6Ko?=
 =?us-ascii?Q?D8PM4aUpcj78bU+3MI8MJLSkmqLex4Me8G9r3Y/jnkG/5YN9z6JqZlq3MFel?=
 =?us-ascii?Q?W4sqfTxn0zCjck/ZG9vzWuhioE8mHixePSilTfwWxvgMS1ZWi7itQN0bA7OX?=
 =?us-ascii?Q?JgjtTuF4F633LCLjZ3tD5TKiqeTaJ5TsKQpVIzLfSOCEzCF5gBK8l38ACHZ3?=
 =?us-ascii?Q?MvjCceenKbsy+2h+RO6+pV72Pt+46/gzBFNYqXmvHCSGltoriJeTXCGj+Q2p?=
 =?us-ascii?Q?MghgWnsiXcxcksmq+Z2FSgvad6+gbPcffx/HHxM4XO8Y+9dM7EmX+AtFoDxr?=
 =?us-ascii?Q?pB4Zq7oYHWLtyFiazEqNx4jlg1BM3lvqa4ltA7QkiRz0Ko7TRhnQ9/fF6NeW?=
 =?us-ascii?Q?Ur8Fvi+xmX4lRR+wD1YrAtlQMB8FbnR9IwQqGRNNEPE2W5RqXw++/kQgzs34?=
 =?us-ascii?Q?vRd6fgbv5kp75NmXw0gpxkUkJWGBWUkWYKHTuNEN8kvczgvEdAHcpPIoYPzK?=
 =?us-ascii?Q?NnnJEgdzfDqMHWt/dk1Zqzq/pUojT32F5MaUh6y0Z8vpdBLAy+JKDhlvhRY3?=
 =?us-ascii?Q?AWtxXgrX9MM3y3owcP2OZAD93H6TJff+Oc9H//36mvjJSpntPPYyKzw2jH3f?=
 =?us-ascii?Q?XlPE5WMfUmQkHBPs4NDtceSXcoV2W6FrfOx5LobY8djyAqDT8zJonUog5wEQ?=
 =?us-ascii?Q?EdZ6LZZWDi1PlhoiPHyckQtzhDYIBy5XwNmFbySD0SboJQQy2RGn2cxkJ/NP?=
 =?us-ascii?Q?59ySxg/JAuXUla/6hT4dfTQ8yZjv0FByKN/t9CtcSZsd3i70/je2z9C7G4T8?=
 =?us-ascii?Q?awRgwPp72Vajzi3hfwUIlEeqOFJ5FID4MeTnD252fsQoxV9cP81gazluy+aY?=
 =?us-ascii?Q?bZl0cBAg/0bC8UXiUsX1FjNk3uzIhvYJicXiJRP5vWrL0gNU105etFMIuRLm?=
 =?us-ascii?Q?ejWFO9QrAxToL7XIhrih3HO1BX0NJzb2iSEI0KrL7CQ2zfGq9m7hD3EQ2oFi?=
 =?us-ascii?Q?fcuC3jcGXjLJZtX/thue5+AMZ2RYIaW4ztB8buMDZQ6KEnjZQB6f462+4R1e?=
 =?us-ascii?Q?Chj4V7TQdWhcwuz22T3EcNXzQwTibF7Q5R3lMWMFkEHj6fEnenLUKQId36PZ?=
 =?us-ascii?Q?gkHuN/Fzo0P5x+GotyZowpPZWRV8fwbvCemB?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8ilV/7+TbodA0Kx2D4413T4bOlxghmNojgvUe9iUIzRJ4anzcQIffZqpL1zv?=
 =?us-ascii?Q?6mXW8ralYh8Pb7ub44aYFkdSYSpllJ/0WCqJ3kfUPgqED5qGVhB7WmJDtf5w?=
 =?us-ascii?Q?o/lM6MtASlleAaUaIs6n4967/l2XpBz7M1kQ7Xzruv8IG4WB3IYhS2AwY8a+?=
 =?us-ascii?Q?aRJfX/o9XG2mWf4tFMji0caR/SrFtnph1fh28OdQGo4Q1sS8uWc5a46Uj+eN?=
 =?us-ascii?Q?jU3PpFTCRsnnpS/z1VcMCCQC5l827I8VnCDj7M2hpiS7O9fRjkA+J3KlmsNL?=
 =?us-ascii?Q?leLb/ECSqZ86HV8dIzLpg5BPORUpGNeu5/GABy7HMvO98o9alm1LAV8ghgDt?=
 =?us-ascii?Q?f38Wn/nd1uqcd9Xf8OKn2p60+5ZA+VvJM9xMnndPPjLuH1+Pw7iM+4PPtoD3?=
 =?us-ascii?Q?q1beEP/FhLaaQVxl1AyP+Nhidrs5coTfXSqBMN3EwCZQL1jWtG61b6wqZGh3?=
 =?us-ascii?Q?HTrtZS2njDTdBIxqwBeZ56jzRAbYKJ+7cBPLDqs4TAoSsyjruwhIAuezBHSd?=
 =?us-ascii?Q?JjlHdYriWP5NYpkYJNIyBpL925e7Nc+Ina9NUP4qF7TfzfzJ9VuWlEYlJWmv?=
 =?us-ascii?Q?GpOwisRKBzhb/1q7ullyOMNF7Ui4uBSKhIABi+Rf+wb32AeMAbwwxpoMZwx/?=
 =?us-ascii?Q?WN8a6FojE/00+lUnsZLYbzuAW0CKoDs8iVyS2fZcz8FWuLXhQ4QtuuGd7w5F?=
 =?us-ascii?Q?8EsgdsA/mcM0487HzObd5N7o10h4M+SuzCzkuqvfl2bT+d5Qn322iVPfGhuF?=
 =?us-ascii?Q?oetD8v7SH/KXAd7MRSWy/Xv6ntwLOkbIVFAFJzAtGNsnzJxd/GezqmeSi8Ek?=
 =?us-ascii?Q?2Cm4yeEB7e+1kpQ1Vpwc4SytXnZVOtgYr7o0GnnT3fztFSuMfTQHTlYH8qdH?=
 =?us-ascii?Q?XWKY/OamRyaJk8ZsLqlUpzKqNzUjcf87k5ZEu7u8UmqxOkZNN10IsUy+HyP6?=
 =?us-ascii?Q?AWYgWDbCiu1IXI2I0WA+M1FA7v3RA5ykMcicwOxCzDPjnFXTCmbqB8paNZ17?=
 =?us-ascii?Q?edu0i1JmZojabLMIh/vjcCPBEiakXx/0CoVbYNvmDwOv34vyn70KnF6h1ITV?=
 =?us-ascii?Q?zbhD0Zsuoypdr2cnkwSImAXxgsllgv0X56bEizRcWHGGAApZHrgw4mHTdsZO?=
 =?us-ascii?Q?B7EVWAfZQtrKNvU8kDBhRgybOdjhOGDZ35xMAN+pvM6q+2SZi0eiXWQkqC6U?=
 =?us-ascii?Q?xORexez1t/CGsdBRjqkiB+wpWZYxojKU9VrcVrw2XWPNbEtVc8udquYaZNg4?=
 =?us-ascii?Q?ZR6zTCBYc+nq0vVABoIdkNJS/fQKmRpXBjVvDd7FGSs90Jt9o7Lzop019458?=
 =?us-ascii?Q?oB8dwSYGYiDvPorbct599P1AuCjfubmk5AUDEov+RZdKYPNf/KwNFUi7CB0o?=
 =?us-ascii?Q?PdumyOzie/qomZAkX2oUJ8nBD9mb0z1mSR/ms5c4iIqE8c51NbPUKKTYxVoN?=
 =?us-ascii?Q?nNJt8i4ANcK2XSSiF5Z98U3dm5IJ26rxei0HooTQqRHFeyMdvqbezcH7m+l3?=
 =?us-ascii?Q?cK7ofamiZCtGkOakSPtEnbozTDWaC3lv/I6tRoMp4/yHDiV0XL+udjD6+MiY?=
 =?us-ascii?Q?/1CE+5YhGGnmnjGgfb/keUpwYssPlUdVtsTntK11QKtD07e/zbxuon51g74o?=
 =?us-ascii?Q?7HF7lFnelvagxV4vE8JWxTOMDWfAemJ4EwpCpMxcY7Nw97PqGcUt+dBiNDcW?=
 =?us-ascii?Q?0ptRigobAf7AXQdW5hnQ6bVzG3sBRViaHlUKdOQPlcMliwTBOg1bmP9IDGYr?=
 =?us-ascii?Q?A+pc0cQEeg=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78c9fe08-7394-4013-0ef6-08de4c8520a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2026 18:06:19.4743
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x7NgQnnXsh9cfnGgwg87xLekyazuI+0hHcLaJVT+UE7RXAu5VW++5sxB9MO52/IBJWCtp8ARCGsBhFslZvJXGflelRsO5Vnc/JXDpYsZV88=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB10480
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_100629_328969_158D2356 
X-CRM114-Status: GOOD (  27.75  )
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

Hi Frank Li,

> -----Original Message-----
> From: Frank Li <Frank.li@nxp.com>
> Sent: 05 January 2026 17:12
> Subject: Re: [PATCH v4 1/4] i3c: renesas: Switch to clk_bulk API and store clocks in private data
> 
> On Mon, Jan 05, 2026 at 11:49:59AM +0100, Tommaso Merciai wrote:
> > Replace individual devm_clk_get_enabled() calls with the clk_bulk API
> > and store the clock handles in the driver's private data structure.
> >
> > All clocks required by the controller are now acquired and enabled
> > using devm_clk_bulk_get_all_enabled(), removing the need for per-SoC
> > clock handling and the renesas_i3c_config data.
> > The TCLK is accessed via a fixed index in the bulk clock array.
> >
> > Simplify the code and prepare the driver for upcoming suspend/resume
> > support.
> >
> > No functional change intended.
> >
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > ---
> > v3->v4:
> >  - Collected Biju Das tag.
> >
> > v2->v3:
> >  - Added define for TCLK index.
> >  - Use devm_clk_bulk_get_all_enabled() into renesas_i3c_probe().
> >  - Improved commit body.
> >  - Dropped unnecessary static const char * const renesas_i3c_clks[].
> >  - Removed the need for per-SoC clock handling and the renesas_i3c_config data.
> >
> > v1->v2:
> >  - New patch.
> >
> >  drivers/i3c/master/renesas-i3c.c | 43
> > ++++++++------------------------
> >  1 file changed, 11 insertions(+), 32 deletions(-)
> >
> > diff --git a/drivers/i3c/master/renesas-i3c.c
> > b/drivers/i3c/master/renesas-i3c.c
> > index 426a418f29b6..1b8f4be9ad67 100644
> > --- a/drivers/i3c/master/renesas-i3c.c
> > +++ b/drivers/i3c/master/renesas-i3c.c
> > @@ -198,6 +198,8 @@
> >  #define RENESAS_I3C_MAX_DEVS	8
> >  #define I2C_INIT_MSG		-1
> >
> > +#define RENESAS_I3C_TCLK_IDX	1
> > +
> >  enum i3c_internal_state {
> >  	I3C_INTERNAL_STATE_DISABLED,
> >  	I3C_INTERNAL_STATE_CONTROLLER_IDLE,
> > @@ -259,7 +261,8 @@ struct renesas_i3c {
> >  	u8 addrs[RENESAS_I3C_MAX_DEVS];
> >  	struct renesas_i3c_xferqueue xferqueue;
> >  	void __iomem *regs;
> > -	struct clk *tclk;
> > +	struct clk_bulk_data *clks;
> > +	u8 num_clks;
> >  };
> >
> >  struct renesas_i3c_i2c_dev_data {
> > @@ -272,10 +275,6 @@ struct renesas_i3c_irq_desc {
> >  	const char *desc;
> >  };
> >
> > -struct renesas_i3c_config {
> > -	unsigned int has_pclkrw:1;
> > -};
> > -
> >  static inline void renesas_i3c_reg_update(void __iomem *reg, u32
> > mask, u32 val)  {
> >  	u32 data = readl(reg);
> > @@ -489,7 +488,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
> >  	int od_high_ticks, od_low_ticks, i2c_total_ticks;
> >  	int ret;
> >
> > -	rate = clk_get_rate(i3c->tclk);
> > +	rate = clk_get_rate(i3c->clks[RENESAS_I3C_TCLK_IDX].clk);
> >  	if (!rate)
> >  		return -EINVAL;
> >
> > @@ -1302,13 +1301,8 @@ static int renesas_i3c_probe(struct
> > platform_device *pdev)  {
> >  	struct renesas_i3c *i3c;
> >  	struct reset_control *reset;
> > -	struct clk *clk;
> > -	const struct renesas_i3c_config *config = of_device_get_match_data(&pdev->dev);
> >  	int ret, i;
> >
> > -	if (!config)
> > -		return -ENODATA;
> > -
> >  	i3c = devm_kzalloc(&pdev->dev, sizeof(*i3c), GFP_KERNEL);
> >  	if (!i3c)
> >  		return -ENOMEM;
> > @@ -1317,19 +1311,11 @@ static int renesas_i3c_probe(struct platform_device *pdev)
> >  	if (IS_ERR(i3c->regs))
> >  		return PTR_ERR(i3c->regs);
> >
> > -	clk = devm_clk_get_enabled(&pdev->dev, "pclk");
> > -	if (IS_ERR(clk))
> > -		return PTR_ERR(clk);
> > -
> > -	if (config->has_pclkrw) {
> > -		clk = devm_clk_get_enabled(&pdev->dev, "pclkrw");
> > -		if (IS_ERR(clk))
> > -			return PTR_ERR(clk);
> > -	}
> > +	ret = devm_clk_bulk_get_all_enabled(&pdev->dev, &i3c->clks);
> > +	if (ret < 0)
> > +		return ret;
> >
> > -	i3c->tclk = devm_clk_get_enabled(&pdev->dev, "tclk");
> > -	if (IS_ERR(i3c->tclk))
> > -		return PTR_ERR(i3c->tclk);
> > +	i3c->num_clks = ret;
> 
> Need check num_clks > RENESAS_I3C_TCLK_IDX to avoid outbound access at
> i3c->clks[RENESAS_I3C_TCLK_IDX].clk

I guess dt binding check validate this as well. Eg: a single clk defined
in the DT instead of minimum 2, will give DT warnings.

Do you expect additional check in C code as well?

Cheers,
Biju


> >
> >  	reset = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "tresetn");
> >  	if (IS_ERR(reset))
> > @@ -1374,16 +1360,9 @@ static void renesas_i3c_remove(struct platform_device *pdev)
> >  	i3c_master_unregister(&i3c->base);
> >  }
> >
> > -static const struct renesas_i3c_config empty_i3c_config = { -};
> > -
> > -static const struct renesas_i3c_config r9a09g047_i3c_config = {
> > -	.has_pclkrw = 1,
> > -};
> > -
> >  static const struct of_device_id renesas_i3c_of_ids[] = {
> > -	{ .compatible = "renesas,r9a08g045-i3c", .data = &empty_i3c_config },
> > -	{ .compatible = "renesas,r9a09g047-i3c", .data = &r9a09g047_i3c_config },
> > +	{ .compatible = "renesas,r9a08g045-i3c" },
> > +	{ .compatible = "renesas,r9a09g047-i3c" },
> >  	{ /* sentinel */ },
> >  };
> >  MODULE_DEVICE_TABLE(of, renesas_i3c_of_ids);
> > --
> > 2.43.0
> >

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
