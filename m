Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB5FEC2A099
	for <linux-i3c@archiver.kernel.org>; Mon,  5 Jan 2026 10:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zgppy0QUOP1QcDJxLOUMbiZJelQsIYPCQhmRYr7NSKE=; b=jhCHkMok8Fl/wQ
	qdPNtMIh/qC3I4IFevKRIxeyNBErhDFjO8CIHCM6BIf5mB8beXf0trfWa8GDSC39CD/7uYoFjHdhc
	1vgXUrb9mGzmRzZlldcyEgXi1WyQa2DB4L9xDPuFEWA8iCpyCAHSJBjVq9Qd5uV1lBeMMVvo6c95Q
	Yr99WUGJl1xCx5qt+xz8rxlPOJtYiDNggjp9kIanK8jjShODJClTg3OUXqaxOQeZDo54drl4miqGA
	cfPn8p4xqKZ9bJ0xy50gcbfMzzo8FjFzy4vP01NlFlmOzN4M+XTCK/BuZ1sM/O/H2wYytzHPp3Xko
	n31beLwAjVu4whUZ+kFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vciDP-0000000B96y-1kcD;
	Mon, 05 Jan 2026 10:53:35 +0000
Received: from mail-japanwestazon11010027.outbound.protection.outlook.com ([52.101.228.27] helo=OS0P286CU011.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vciDN-0000000B96B-18Xa
	for linux-i3c@lists.infradead.org;
	Mon, 05 Jan 2026 10:53:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RvIhcnjb3DOKxPMxA0pDGYYWPPCYUVVeAIe6lR5AfCPgBXlwLGcBT/Tl2NgVqsfFOAmlAJbqOPAteC+TXM2SSYkJuMflLEG8/x213UxSKnpkSc1YFFq6PftCs3jG6GW21h2s2XTBySm54XAl9dA3HGYBLbn4TlArjBs8UtGUQSwYStp/cfLl72VJAI/lXloYL6rMYs6GBa6y6xLXfRyNz8N++hN/6IXLBgH+AlbAtHvc0Bil1TPFOgMpDhC2p1y8mskd44cspTsuiKEq8YzSMAKvlwZTz25peitWOmz0MvECe3psI3Qm/OzcHsKJC5OVvkXbflurQLZ2Tb2gBw1SWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Gs382aZgfw8FUAVutLharoap7iR4S49bCh6TdJeIOE=;
 b=aNJbkTYHmuZyZlnfcp7SHt40SLw1jnzlyPaZ/79S6H2lR+lOy5xBVZrYwmcoqVGhon9J62TCanau3FGZ+CHNcnmVoACmQ2PNfdzfu++XtBWvkgilMEKpPzPQAGeswI4F9g8lmRLBSkYRuyVT8NS99t+BbdWRPm84RTE7jRJ6heRUkkXYZ+N2csJjyJMaypq4aehMcpggm5EWle9ENe1642oyDhyCEKpadGo9YUp83NJLUSwx7wjerUwzjRS8YUYLL+DYGt2/l21lRhM1rv8WWKWsJp6NyDZudFh0Is9/OItAjSFrT39pPY8PO3OG3fS7Gx2U3vwxVFzOHnaxasUtjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Gs382aZgfw8FUAVutLharoap7iR4S49bCh6TdJeIOE=;
 b=WNUCdJ6G8Q0j2CRLekR836QN1UWeFU1nEwz87TpS9HxjsTiWcgXWTMeqVpCJRpUAB+M07iQIpI2SSBkgB9HMK1bDdsQuY2rLq9weUu+hmB1cCiLRmzv3M1hrXvNP2xbDfDfrOwFbVeo66+yW2+44Dsqx5sswFUDcoEfWBWHtR/Q=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS7PR01MB17111.jpnprd01.prod.outlook.com (2603:1096:604:456::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.1; Mon, 5 Jan
 2026 10:53:29 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9499.001; Mon, 5 Jan 2026
 10:53:29 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Tommaso Merciai
	<tomm.merciai@gmail.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	wsa+renesas <wsa+renesas@sang-engineering.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
	magnus.damm <magnus.damm@gmail.com>, "linux-i3c@lists.infradead.org"
	<linux-i3c@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 2/4] i3c: renesas: Store clock rate and reset controls
 in struct renesas_i3c
Thread-Topic: [PATCH v4 2/4] i3c: renesas: Store clock rate and reset controls
 in struct renesas_i3c
Thread-Index: AQHcfjEfY3un8CtRKUuW+5tvWfpCebVDZflw
Date: Mon, 5 Jan 2026 10:53:29 +0000
Message-ID: <TY3PR01MB11346F08CE5CFDFD010A58C9D8686A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <cover.1767608450.git.tommaso.merciai.xr@bp.renesas.com>
 <9c36f4107b257409a513fd6095fac3635411ef7d.1767608450.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <9c36f4107b257409a513fd6095fac3635411ef7d.1767608450.git.tommaso.merciai.xr@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS7PR01MB17111:EE_
x-ms-office365-filtering-correlation-id: bd85a835-0eda-4d03-010a-08de4c48a976
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?wQ/p0y8W/agJV+yMeKJ2Bb0/SnYx84jL93+1lmYDH5eQvmpAcRTw5mo2gTkp?=
 =?us-ascii?Q?uxugJ0VmFA+q82BwNZTuvCA/Hx/XT2y+HDtcUSLO24TKBDuQUP7U270XwLxl?=
 =?us-ascii?Q?lxJCOeaK5+pMR1dRGA8S/aydUPgx72lvvSpfBF/vU3pPIC+rMwSv70TVKF4+?=
 =?us-ascii?Q?Yit4R6xtKa6/aECgKENx5vlbEEqLITo+LDvQ8QARCwwuyn1+piysAkVta77p?=
 =?us-ascii?Q?RuAfUy/Og4/lNovEQNCH3IXtSYRKC1Y9csy/Z2TCMsT4Uq/LfxEmRyboxBgn?=
 =?us-ascii?Q?f8yg0ssL+7zq9b2hQ5lazRr9FGVZlfAkR2MdJJro/yiMfWGZLkcqpvHqXg1+?=
 =?us-ascii?Q?0hko/6xbiHkRFr6naEVB40evrJGa/wKsFMoMHQWxPWrFPWrOuTo0+NjEgLD5?=
 =?us-ascii?Q?L8H0Xt85ArorfKroeorwpHp4nT523oWvtVVVIgK+xu0my1kXN/7X6zv3zqZB?=
 =?us-ascii?Q?KJXROJqDVTc2bM7BDsUlYhP+3dEH0rlReC+isPwsucdWpCaGvgw8YsO3013q?=
 =?us-ascii?Q?q3K6AYkDmALaPxjIdWU/J0jlgWg6WhWBlzuFqwkaqeHwk7Ggh68ijL8RfTbY?=
 =?us-ascii?Q?1AgdQOS0ABtk/bzCV35mvP5meyI+eTauUvQ17MMRRZUbp43jdj+hldOGG0+A?=
 =?us-ascii?Q?BNqq12Emu0YrTf/NcGvmFrrJ7yy6C4hm+OzgkK8aD6jDZCpPIwtYoymbfL39?=
 =?us-ascii?Q?8NQSvjHlV/cN3iOTZwaHvBY9Y1T0UeER6yRuP4G15SFyVmR8EqQb7P3wKkE6?=
 =?us-ascii?Q?YFy7efpOt0/WeyKYSFgl1lI7DLqkFbkCipXrEFq6NvT1rTA9x6ShgSLcGhBQ?=
 =?us-ascii?Q?MqM/9QR+IkfsgbRy8VVQfoDeDaIfS6t9V1NChnT0s62SPg2cXVqTFop85wEz?=
 =?us-ascii?Q?P2TaG8uI+98dI1VcUwkxTvBSZr/7JxA5M81QgAvr0pBGSVRpS+P2V2AaYwIa?=
 =?us-ascii?Q?FhWysLPFilzVH3TpxBIDQEsU1NBdJ6sceFhaBHFETsmMjnSxV+4TMV2dL56o?=
 =?us-ascii?Q?UcuW2Ng/628k0EjflNuUL/ydbMM0iBN/Br048eRPmckeiDBr91fSdVtcLXC7?=
 =?us-ascii?Q?Xt0IWTGsLTk2Uu1YAEkQQKC+6OF1TGMI2SdThw48rSlzo3HS3gs0p/RPwKtv?=
 =?us-ascii?Q?mlp8Irtw3fIRlzblbP5gqkThHWBenDIvmJ24BYKW57DFGQIWFR+MLNxRSlk1?=
 =?us-ascii?Q?y/LEelzsvlRhh3xZGBsmax1yeKr/z5z86UThXK/7D6HhQAplYukRoqwZXXfQ?=
 =?us-ascii?Q?Q6EoNCqJr0VY/4CxJohgzpypwp59XRHjbGCmG/Stm7Y308b43zWBZeRpP+sL?=
 =?us-ascii?Q?Gu9+74POdpjfAlB8oAeHpenrW97GECnyXYk6STQyQn52WcG5Ss8wPE4DWXig?=
 =?us-ascii?Q?qkvI6PRW+nVn1F4PjXjnG+NPlXrq0gCmcgeTcKlQ/yIMuThbr668qRzVb4uE?=
 =?us-ascii?Q?nAaiuOJzYMuTDyvsWcYSuNQrgvLcg0m0Op7b9NsvI4i2DA8byY0dqCnH3BrG?=
 =?us-ascii?Q?z8c1pPSeTF64lP2H9lkJ+8aZv09p/TP8gtxK?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SoiLD0w0Fa4YrQw1YflTgQ+t6SRzNpDgSmExPBR82wrP40OWZFpn4Mcej6Ri?=
 =?us-ascii?Q?PSutw4svLWFsUunCKrv94kEx8oOFVAnZokD9ACXYl7SiY79qAAayT/8lqld5?=
 =?us-ascii?Q?jb++vwb1q+ZJ6bVn0qsdYQ+1ONQ4uCnFNwfoHhArvaqbvIyPxkJ5sT9D7h+Z?=
 =?us-ascii?Q?FfIXt+nn5VPSCABNqXM1HUhMgsp7IZM6S/nXZnTAQTxo6eDjYBwz30oGMSrz?=
 =?us-ascii?Q?+JQ7sflJb6t01iRjyJs+YfbHPE3QKKoD1bAwizwvfbhhNCE6qWyv7lPl1wyj?=
 =?us-ascii?Q?qSUfsFn0gxWgsR5Z6a4wR1yikxkp/5oMZX5yB4j9FuH+SQipeb9boTRG+pxt?=
 =?us-ascii?Q?HEFxvyoRJKWbrAMLmslQwJKhr16l8UorqE+MHpXdqsqtIcvgsGbxYWe0HvDG?=
 =?us-ascii?Q?2bfK9DM6ezyqhVXuwnpsOSMefwORB5bjz3z255gI0e2ysCzql9YM3YzpCXTS?=
 =?us-ascii?Q?JxMBw7HjCpkuNoV67OTyBP8mqHBwPELkmLxVR/UYgMU2Xz/UGvaTlH/nI7BO?=
 =?us-ascii?Q?91OPQ3HA0ugtzllC4CfLCMvfBbiukzprZL/Aiq8mezkV1Z9hnrgFUqb+a94k?=
 =?us-ascii?Q?J8JNnIUSnW49JvqCHtMd+dP0zy+YA5qDiNMuTcjZJU6wmSdNKTDJLmRGwBXw?=
 =?us-ascii?Q?E1Ezqe8IC+oCCEtfR0MIVKT357OvZOFxxb/xnDF3PBzvBsuWn7Er1nOMZ5Fk?=
 =?us-ascii?Q?Y/9HekQ2hthAJFuKFZrooum7gJnzms4xhXwmgmkiE3vZXaTJ8j2L+fa0s386?=
 =?us-ascii?Q?qmTVtnG6HK9WF6YengZ7GqBqQEyyvseDhoidHAA2l6Ct02UJ3VHC58ss6rSA?=
 =?us-ascii?Q?I3CmLNe0ZP0GZ+txIksBkFhdmhRpPT+HhV7OWgxCRAjeW59Pamn+uajc0rcm?=
 =?us-ascii?Q?ZUCAcRBvM+je2GiTqvgyh2nZk5Ba49nyldoa3NfJqZ3RfvQZkK4Tp4aUus2M?=
 =?us-ascii?Q?e7078DouQXqYUVtx+xmhoYQUSeuP/5PiHFj0xnDAaCS6+UanNM/m8PsubUIj?=
 =?us-ascii?Q?AZgMkJXWVfyjqhzUTB3yRiXNKg3innzhyb13hYaN/uUJGNS2DwMSClh8Mf7P?=
 =?us-ascii?Q?Kq1QxyOzeW9P6m3AAo3PV6r1kHrkOFSZVBssNncExdsDQUMmKUfChW9cGRK9?=
 =?us-ascii?Q?1fTLM6HXPVSRgQArgO9dTokmlnHVq23yw+vhIu/0x7KOv5NVPvfxs2zKDUPx?=
 =?us-ascii?Q?eeSqiMF7M82z1+DOideyb9L41qb1H135gM2EgMV+nQSu9ytygP9Qv8qgDWc0?=
 =?us-ascii?Q?LF3OgCmlUaw2EXowJnT2UwqgzRXIb1CRkyS9B6elMGMdBErVrfFwxCDkPufj?=
 =?us-ascii?Q?4apJKyJcncncvEZ41uIc3gH9tW2SVrCWzL7ps/62F4UVaC+2l5dnBo+6v6SV?=
 =?us-ascii?Q?1sXDArwaF8qDD0jx3Oed9Y1swU+ia8pZntsKNvRrGidQ6F/PUvuCTRBj5N0+?=
 =?us-ascii?Q?qged62TJ2lAg+ydCQpZxy3Vvi0C7honMsI1th8R7KnJXE2cWw7VmEt7gUV6g?=
 =?us-ascii?Q?94oFfPG9ICkPRjL/dy++72oifEdBASMSCLzkpFtaixdOY4mB3MD/7XILH9LN?=
 =?us-ascii?Q?0PFTG3tHOSIGIAS/DjrRLWZ4xCYGH4xpll+OwrZmDuip/SqHrQ7oJjU+L6t+?=
 =?us-ascii?Q?LYstu79H0A6gYqgOczmAkCi28aaDFl/edxKdsBRdSnv6A17RcIdS7R3wJxWk?=
 =?us-ascii?Q?grtTadRaF2CtKE5EsZF/lgHF42dzipN2n4vwUO5OskcHBPGoGfJC0glw9pkJ?=
 =?us-ascii?Q?1DL+KVThgw=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd85a835-0eda-4d03-010a-08de4c48a976
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2026 10:53:29.7592
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x2jica9YLzJprZ66ybjG94F8I1BTDw2TD0uJ1zkKIrQ7vPuPDdWdR5f4yTUra4rNMVH2oGByRu+7dYfYhdvF4Tvr130G3Huhbo0XIFixhtc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB17111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_025333_427494_AA645AD8 
X-CRM114-Status: GOOD (  18.87  )
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

Hi Tommaso Merciai,

> -----Original Message-----
> From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Sent: 05 January 2026 10:50
> Subject: [PATCH v4 2/4] i3c: renesas: Store clock rate and reset controls in struct renesas_i3c
> 
> Update the struct renesas_i3c to store the clock rate, presetn and tresetn handlers. Replace local
> usage of the clock rate and reset controls with these structure fields.
> 
> Simplify the code and prepare the driver for upcoming suspend/resume support.
> 
> No functional change intended.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v3->v4:
>  - No changes.
> 
> v2->v3:
>  - Collected FLi tag.
>  - Improved commit body.
> 
> v1->v2:
>  - New patch.
> 
>  drivers/i3c/master/renesas-i3c.c | 39 ++++++++++++++++----------------
>  1 file changed, 20 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index 1b8f4be9ad67..7359f71f78dd 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -258,11 +258,14 @@ struct renesas_i3c {
>  	u32 free_pos;
>  	u32 i2c_STDBR;
>  	u32 i3c_STDBR;
> +	unsigned long rate;
>  	u8 addrs[RENESAS_I3C_MAX_DEVS];
>  	struct renesas_i3c_xferqueue xferqueue;
>  	void __iomem *regs;
>  	struct clk_bulk_data *clks;
>  	u8 num_clks;
> +	struct reset_control *presetn;
> +	struct reset_control *tresetn;

Can this be above num_clks to avoid padding?

Cheers,
Biju

>  };
> 
>  struct renesas_i3c_i2c_dev_data {
> @@ -482,22 +485,21 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
>  	struct i3c_bus *bus = i3c_master_get_bus(m);
>  	struct i3c_device_info info = {};
>  	struct i2c_timings t;
> -	unsigned long rate;
>  	u32 double_SBR, val;
>  	int cks, pp_high_ticks, pp_low_ticks, i3c_total_ticks;
>  	int od_high_ticks, od_low_ticks, i2c_total_ticks;
>  	int ret;
> 
> -	rate = clk_get_rate(i3c->clks[RENESAS_I3C_TCLK_IDX].clk);
> -	if (!rate)
> +	i3c->rate = clk_get_rate(i3c->clks[RENESAS_I3C_TCLK_IDX].clk);
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
> @@ -510,7 +512,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
>  			pp_high_ticks = ((i3c_total_ticks * 5) / 10);
>  		else
>  			pp_high_ticks = DIV_ROUND_UP(I3C_BUS_THIGH_MIXED_MAX_NS,
> -						     NSEC_PER_SEC / rate);
> +						     NSEC_PER_SEC / i3c->rate);
>  		pp_low_ticks = i3c_total_ticks - pp_high_ticks;
> 
>  		if ((od_low_ticks / 2) <= 0xFF && pp_low_ticks < 0x3F) @@ -518,7 +520,7 @@ static int
> renesas_i3c_bus_init(struct i3c_master_controller *m)
> 
>  		i2c_total_ticks /= 2;
>  		i3c_total_ticks /= 2;
> -		rate /= 2;
> +		i3c->rate /= 2;
>  	}
> 
>  	/* SCL clock period calculation in Open-drain mode */ @@ -539,8 +541,8 @@ static int
> renesas_i3c_bus_init(struct i3c_master_controller *m)
>  			STDBR_SBRLP(pp_low_ticks) |
>  			STDBR_SBRHP(pp_high_ticks);
> 
> -	od_low_ticks -= t.scl_fall_ns / (NSEC_PER_SEC / rate) + 1;
> -	od_high_ticks -= t.scl_rise_ns / (NSEC_PER_SEC / rate) + 1;
> +	od_low_ticks -= t.scl_fall_ns / (NSEC_PER_SEC / i3c->rate) + 1;
> +	od_high_ticks -= t.scl_rise_ns / (NSEC_PER_SEC / i3c->rate) + 1;
>  	i3c->i2c_STDBR = (double_SBR ? STDBR_DSBRPO : 0) |
>  			STDBR_SBRLO(double_SBR, od_low_ticks) |
>  			STDBR_SBRHO(double_SBR, od_high_ticks) | @@ -591,13 +593,13 @@ static int
> renesas_i3c_bus_init(struct i3c_master_controller *m)
>  	renesas_set_bit(i3c->regs, SCSTRCTL, SCSTRCTL_ACKTWE);
> 
>  	/* Bus condition timing */
> -	val = DIV_ROUND_UP(I3C_BUS_TBUF_MIXED_FM_MIN_NS, NSEC_PER_SEC / rate);
> +	val = DIV_ROUND_UP(I3C_BUS_TBUF_MIXED_FM_MIN_NS, NSEC_PER_SEC /
> +i3c->rate);
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
> @@ -1300,7 +1302,6 @@ static const struct renesas_i3c_irq_desc renesas_i3c_irqs[] = {  static int
> renesas_i3c_probe(struct platform_device *pdev)  {
>  	struct renesas_i3c *i3c;
> -	struct reset_control *reset;
>  	int ret, i;
> 
>  	i3c = devm_kzalloc(&pdev->dev, sizeof(*i3c), GFP_KERNEL); @@ -1317,14 +1318,14 @@ static int
> renesas_i3c_probe(struct platform_device *pdev)
> 
>  	i3c->num_clks = ret;
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


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
