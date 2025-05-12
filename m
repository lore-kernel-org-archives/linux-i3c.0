Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B667C54755
	for <linux-i3c@archiver.kernel.org>; Thu, 15 May 2025 10:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cqUBEHndll7ti7p2I5xw7jE7YesNMQCtKQY2wmEwvkY=; b=XljyWOV5HUOfV3
	vOVsiE/ZyY2N6AhJpMzGkQEITO24DoX1uI+5wUenUiKs8Kk0xvJRI57tLA0CggI0+A2CoBAoUKd3L
	S5ceJh3m0rBWJAIKW/IihBHRcufxVjviYUvGLc63ddbE7FaHuxLeYWWazX2uR0KpFPhVAQfgaLjba
	+17bJyf+xTN4bsB2IBAFLlRQEgkzDxhtIcuy41pTXFVczc/NJGDRPOh1vMQR5YYh/1eiV5puiEubm
	Mv0HrLfNKzPTP26gAZGBUTt1aMr0HeYjgbMRfL6n7NxQQhKsfC1Myr8tpEBQizJ1z3cOOvpiFotyA
	kgYCio5D2yoC05F3jN8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFVuw-00000000J4I-3yjA;
	Thu, 15 May 2025 10:34:22 +0000
Received: from mail-am6eur05on20619.outbound.protection.outlook.com ([2a01:111:f403:2612::619] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uERbh-00000009Hwq-0jL3
	for linux-i3c@lists.infradead.org;
	Mon, 12 May 2025 11:46:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FdXiM9hRzhIqT280FbaIvIQtgpxvuSIdNuFMwYqqgWVQ6z+RF8T8wjOPkoMPD+yXtaLl1DMit2Ts13y6YAIVmB0awl4lM8nj8pvmLpQ35ZkbS4mBOu4vJaULPInrtDIRBSDHuwf6Zkiktee0yGb5ukgo5zOiioaEJeTRJulERj9opjvsO/RM3AK/22yk6QgUJz+zCE0MAyT6zzB84dFkJrCMViT1UMUUGkpcIdWOeU63rKuEUlpjTYgcdLxtw4AhlRKeVyLmiih1z8CyWoORKrRwriNEJrec6zNYTASEnh+Wazq3AGtK1MbPYYYi+oOB/AGjCxiGsWlTkhe+lx83lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=90nPnDLqayZBKqbbrrVGrz1B4rHpGqOoqs+kKx7POh8=;
 b=eloPsVcaps2bsooC5nEv3O8L+NktQVBLlxY6Ruf1QmFQ2BS8PxStYi6V4LxwNCiM9HINAmqHbGqCGSLLk63ftxVZyccQ2v9k1bxRGrlMqsKx8d5vcDo6smTvkiwg9sCiCulZeN2h4wbgF9aDWP0Ncu2iqkizNHZIwFIPiZ9INjuwcnH0bN3MrudWSWivf2ceC9auxrnJh98CdNU9cFriHgiCQUpoB4K6IYWzehcZTLaytTlSYY18Pm3mtfXzrvgCO+6R8aD8XM5kPOzGh1oOeg9CQ95V8KlroH5Kejy6KlzDFnsihBEkIMhrBm9Lqptbj3iJtwTtfrw7BKNjr+WZYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=90nPnDLqayZBKqbbrrVGrz1B4rHpGqOoqs+kKx7POh8=;
 b=lBvM5waCd6imI8BFMmlcrgEpFnS5YbB6rUH463uXTLVDMJO5uK/5Y1f4bRRkxo6PmClg59DhXFJc2y6PPIjdhqR8C9tu3hISiIHc/p/hP+7hhXer26LfXV0rFz9UCCFi+aKLiYA+H1d+APx+p1qPcwxt0YzOCUMXONiVO+bk3I6PxdovFKNuB0YNaTtukGtu5EkevxBRw34q6kYRoxBh6lqeARoBvxr/uT+yhn9DwfKB8nsHEqo/gyvBCM44vMSA/2nOAHxxzyBDEvum42v7fm5y+iwxgAdf+9BZQ5r7N/x0KlsauaUts+MA+jwm0UImDnk42C0jyUGFdRsnUXP5HA==
Received: from GVXPR04MB9778.eurprd04.prod.outlook.com (2603:10a6:150:110::18)
 by DUZPR04MB9982.eurprd04.prod.outlook.com (2603:10a6:10:4db::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Mon, 12 May
 2025 11:45:59 +0000
Received: from GVXPR04MB9778.eurprd04.prod.outlook.com
 ([fe80::9b3c:ef2d:7475:5df8]) by GVXPR04MB9778.eurprd04.prod.outlook.com
 ([fe80::9b3c:ef2d:7475:5df8%5]) with mapi id 15.20.8699.019; Mon, 12 May 2025
 11:45:59 +0000
From: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-i3c@lists.infradead.org"
	<linux-i3c@lists.infradead.org>, "alexandre.belloni@bootlin.com"
	<alexandre.belloni@bootlin.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
CC: Vikash Bansal <vikash.bansal@nxp.com>, Priyanka Jain
	<priyanka.jain@nxp.com>, Shashank Rebbapragada
	<shashank.rebbapragada@nxp.com>, Frank Li <frank.li@nxp.com>
Subject: RE: [EXT] Re: [PATCH v2 2/2] drivers: i3c: Add driver for NXP P3H2x4x
 i3c-hub device
Thread-Topic: [EXT] Re: [PATCH v2 2/2] drivers: i3c: Add driver for NXP
 P3H2x4x i3c-hub device
Thread-Index: AQHbv9W1RwXGJFV3KUGQHgcEBwZgX7PIP+uAgAakUnA=
Date: Mon, 12 May 2025 11:45:59 +0000
Message-ID: <GVXPR04MB9778CD46464F6BEE25D5D0529997A@GVXPR04MB9778.eurprd04.prod.outlook.com>
References: <20250508045711.2810207-1-aman.kumarpandey@nxp.com>
 <20250508045711.2810207-2-aman.kumarpandey@nxp.com>
 <b46e3766-75b7-4635-a505-3039e4394f07@kernel.org>
In-Reply-To: <b46e3766-75b7-4635-a505-3039e4394f07@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GVXPR04MB9778:EE_|DUZPR04MB9982:EE_
x-ms-office365-filtering-correlation-id: 6dfc3d11-eaed-4232-bac1-08dd914a90a1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018|7053199007;
x-microsoft-antispam-message-info: =?us-ascii?Q?dq5bIDIduAeMxNbWCEahTFLfJwSGcnx+aHd690B2aQSzXkha2lmDbwPd3F9s?=
 =?us-ascii?Q?zdajCmPX6JKJdnIUzG8ZmuysqUMUlFKmS2s7+N+7BsduttNDJFAQSmwUBGeM?=
 =?us-ascii?Q?iNpF5Xw+CFOtrYCfFFsVwTFomtrYxgeldZUosC2ILFFh9MZTZMWoIzUxUpag?=
 =?us-ascii?Q?3cJ/GrxADXDxtZRiYj6+QNAuoJmUBGlsKM1idHkicSV8Qvohu+YKlkN4pPRV?=
 =?us-ascii?Q?tsSmNGskCkm+2LYdyePTP3GTU/ntHkUQRVc98p5dO10Wi9cUyNuUvD8yZhSa?=
 =?us-ascii?Q?Pe/GtyNpMeWJ6chvzi4d/W4TWAOza+1hSTuiyIOtnYA7Js+wA+XqGYs0ZvF4?=
 =?us-ascii?Q?95WrNZTVPEegBmusrV6nypzrsd4Wz7K3SX7quFTieyc4ruwnP/FzcOl9Xngm?=
 =?us-ascii?Q?KBGA5dMdlykHby0vdi401LKHriVQRQfgdlVIp6EAX1f1yfPiUAPD+K5+CFV+?=
 =?us-ascii?Q?7VGNs/5uyThj+6sgldHlatLgTuTxjAReDzJtyDOedwcrbEysaTeioGRZ9Qv8?=
 =?us-ascii?Q?y5WKZ7Xk18I3/WEyoErj3pf8qqpOhbemfgca6Nqm4hS+yZQjDTwpONklJE9D?=
 =?us-ascii?Q?C3Y9uu7Oc4pyTaSQQj6fFW7O+l1QvZLgwtjc4Ojkfoi+k3bIrI/p96pJqRyY?=
 =?us-ascii?Q?YTy/1Ym48dzd6lkgb45r6jitcx1+dq+EnpCFyW1bXz/pXY8SBayeEQuHBG91?=
 =?us-ascii?Q?XHoqHLs/QY37J5IV7FjFhlnWRdqgm+2qM8536Y7uJfC0Uqy5p+/+ij5fcY3d?=
 =?us-ascii?Q?qhxOFNpMVqQ2nN+hVHxfHS2ni5TvQWqyd54X+uIV5I36KgW5OlTkdGFRKQbY?=
 =?us-ascii?Q?l++45I88rVlcqXa9NzU7PuVo0Q+ZYcfj1NxDCPEItuKFmKVdd/BtJ2icaHVY?=
 =?us-ascii?Q?Cj5DIb60GStylbCqsAxBN09gSImssKwdhk02bAX905V9v5lkZwV8HStTe7Cq?=
 =?us-ascii?Q?pXApNHDN0yjy4XHOM6VgBNo3J1fbpjKJ9ZMAGMt3FFMS0Htb7jMy0WYUYOx3?=
 =?us-ascii?Q?WmAAyLTVamX7vuQe1a7MgeNtPDfSL8vUsTsm5/yPA5fwsV0LpKfXga9KXyVa?=
 =?us-ascii?Q?h90ockM3BXeKwBSsnxF9Fy/Dez5PbrVVTPqMYgB9lmsX1JBmUB+kh7yjCB1w?=
 =?us-ascii?Q?FYiKnlLuvqqI1qFygUj3Jj6N6BAlA4F4kIpCnA9kUj8QGOh/QC/O018PMOqK?=
 =?us-ascii?Q?RboImpMBIaXaAxYSJ/BRZcdQUGVGhO+KsKShvvJg+SOQO/q1AVbv9Bpxi2RE?=
 =?us-ascii?Q?f4GZHO3mwo+pjYbGSgkZTzVwWNaFXh+DhPrwJEb0Wx6wFiPSfaukohAM8hWu?=
 =?us-ascii?Q?9bsUGIDHBgJvEPFisNMEjYvxAQjNDSp6kWvhkCfVKjXHeZ1R6fL2DkhArXGa?=
 =?us-ascii?Q?JzJqKIdjVwIPCk+bM+YS6Yik8xAGGpemASBCDedeBEDC34bJton1QtkwM7wd?=
 =?us-ascii?Q?/F5LYMhpbiVitajcXUQ2x6/LvXBSkNdNWwfFefsKooIjJeKXFpOYdw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB9778.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jBrtHHhWg1smTpTGosiXo/NEaaFiqpJdy8nilmXcgdTSRwO1t81/HlKy6SOX?=
 =?us-ascii?Q?PQDnzY0/zr7MxECaOjdxjUMrbE6Ov/Z7zdpQ8itFbeBuJD14cMSpWNOvwfc4?=
 =?us-ascii?Q?cXhajglPzbh+VstXSr+5wW9LgxMNN47NFCZsgmjRQipUDsZzR5iUFDG+pz90?=
 =?us-ascii?Q?EKBKnzvIPw4Z3IAZVjNl1SU5Wlwq5/EV4hCtA3BK9KDzyaRJnycwpcGhFJr+?=
 =?us-ascii?Q?DKkv4n3yyAELyh+rzTUhSdwi+ho7K9CvTSefPUneibQkH25YgblJ1SfbmCLR?=
 =?us-ascii?Q?vGduKSVGIpz3WIl7rXofUz9g7lHAM+J1p/EckmqVeVBMXVErb2P5HeBRhRC4?=
 =?us-ascii?Q?U59bywA9YrC6UZ5kA6KWSmR9QNd2WfQElHzjvkf2EKmtgVP9YTczDLPDHBYz?=
 =?us-ascii?Q?y+rEFS6Y3+ZRfdd5CZFSqReNYRISFA9MtThdXXnsJkwpcgJyEilqka/s+FQW?=
 =?us-ascii?Q?anU5CD3APyKLTBV4icRcsy7xj5hpwHQxve52+6GSvOIykx2dEP4z4adEktoF?=
 =?us-ascii?Q?Kj76/N2XxDlQlsg26aT0NMFgmjnIrLr61//8gZ+6GpkuwueDrPOACSHJ8dTH?=
 =?us-ascii?Q?FA7GJ6P/GOO/yN2NUzUozSb2DYSJFfKTlIvB1r4UzayTcKXOSsCI2sjxfyyf?=
 =?us-ascii?Q?AasQR8Z4kVoKIQBAerIP8io2oQzBjHRjEukx4bc88HbjslfRx5yg+lMSaTb6?=
 =?us-ascii?Q?TNoBNN2dBYKvKz1Zuz3wPKb7UMh6ijkei3DT752ROWF4sAkkj6xumLwmoXbR?=
 =?us-ascii?Q?G4Rv9sd8HHeRtrzvV13sZ5irYKAoxNWaLVF4LalMWG3QufqJ2tql3N8cDfPT?=
 =?us-ascii?Q?d/NPIYbgKDzOX7AWim2XIvivpVTdR6a9wzu+hFu2V7IkP73QJdxid40uQYST?=
 =?us-ascii?Q?wSZ0KGxk38cmg5cLhUGeu/lW95vsOvEi+J86qS8FPk7/2muKgRaGb5Nh0Wz5?=
 =?us-ascii?Q?gikZ5GGFdT+mp6WBIbm/lQfdMsKvg8+LE17ZWEvxjIPYTjHqKlzMJQsNreN3?=
 =?us-ascii?Q?fTYFZ9TkxfF6n1lr9sOAkjZVm1yqo+OJIaU0ORwmvauB/QCiS/fDWQBA3Vr+?=
 =?us-ascii?Q?QmJL/+EcQnsxHCZ/VTQECvJgsSL5h2MlTu0qmu5PptbdtCdDnd0A1YT4QRu0?=
 =?us-ascii?Q?FpZLv+tEZ7JpbZvMNSu7Lc947ZBEqOfBDauA9IZxKxjTv6cMm8b0Bfi65rY2?=
 =?us-ascii?Q?u9uh9OpWlsZ1GaGyyppJattEoXJG6TVPbrAdq7SqWdTI5L7q/RRfZWawodMp?=
 =?us-ascii?Q?5B9oNxDytfSdQrM9m+/qIy8Ax3/y9+jsqemHCsUBFoAFafQ6OeJEEV6oGJTD?=
 =?us-ascii?Q?TW1p1+MOYnxvayDfJrT/rxyRFnq0xxY34e+X03fz7n2gijke0VndsSvqMUF6?=
 =?us-ascii?Q?wkiEGsPFMRISBpHsFp+sWPTAOsxE7X10USLDriakZU3Qh6Cud2ZaBPrP6R4P?=
 =?us-ascii?Q?pe6K83NZbkJ40jcHGi7ARkiJ7BMLpuMmBFeC2FEmXHEDfuTx5AcMOaboLsiM?=
 =?us-ascii?Q?7DtsuzpofSPyzgjFK8Wt+spocSvaPnDcSouuWIPpbKMM7y927exYiQ7K8eCy?=
 =?us-ascii?Q?jD0Gs6mKGsE7XolZNSpwTVCeAuDht/4xZyzjxXt5?=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB9778.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dfc3d11-eaed-4232-bac1-08dd914a90a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2025 11:45:59.6067
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tiL0v7Apg/buiFqOJiMB7nFXfEVit6IiT7qj2jlysm5TDNhJ9Glwektxaszi7/6RNyoP1viyzbyBR1ZWElFbbBPiLkDa/WtllC/7sUsazYw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9982
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_044605_213600_E7F557E2 
X-CRM114-Status: GOOD (  16.33  )
X-Mailman-Approved-At: Thu, 15 May 2025 02:17:28 -0700
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


> -----Original Message-----
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: Thursday, May 8, 2025 11:40 AM
> To: Aman Kumar Pandey <aman.kumarpandey@nxp.com>; linux-
> kernel@vger.kernel.org; linux-i3c@lists.infradead.org;
> alexandre.belloni@bootlin.com; krzk+dt@kernel.org; robh@kernel.org;
> conor+dt@kernel.org; devicetree@vger.kernel.org
> Cc: Vikash Bansal <vikash.bansal@nxp.com>; Priyanka Jain
> <priyanka.jain@nxp.com>; Shashank Rebbapragada
> <shashank.rebbapragada@nxp.com>; Frank Li <frank.li@nxp.com>
> Subject: [EXT] Re: [PATCH v2 2/2] drivers: i3c: Add driver for NXP P3H2x4x i3c-
> hub device
> 
> [Some people who received this message don't often get email from
> krzk@kernel.org. Learn why this is important at
> https://aka.ms/LearnAboutSenderIdentification ]
> 
> Caution: This is an external email. Please take care when clicking links or
> opening attachments. When in doubt, report the message using the 'Report
> this email' button
> 
> 
> On 08/05/2025 06:57, Aman Kumar Pandey wrote:
> > +
> > +static void p3h2x4x_of_get_tp_dt_conf(struct device *dev,
> > +                                   const struct device_node *node) {
> > +     struct p3h2x4x *priv = dev_get_drvdata(dev);
> > +     struct device_node *dev_node;
> > +     u64 tp_port;
> > +
> > +     for_each_available_child_of_node(node, dev_node) {
> > +             if (!dev_node->name || of_node_cmp(dev_node->name,
> > + "target-port"))
> 
> 
> Same NAK as before. You ignored the comment and nothing improved.
> 

Thanks for reviewing the patch.
As per your comment I have used proper function to get reg instead of sscanf. And our driver is not having direct interface with userspace.
What should I change here ?

> > +                     continue;
> > +
> > +             if (of_property_read_reg(dev_node, 0, &tp_port, NULL))
> > +                     continue;
> > +
> > +             if (tp_port < P3H2x4x_TP_MAX_COUNT) {
> > +                     priv->tp_bus[tp_port].dt_available = true;
> > +                     priv->tp_bus[tp_port].of_node = dev_node;
> > +                     priv->tp_bus[tp_port].tp_mask = BIT(tp_port);
> > +                     priv->tp_bus[tp_port].priv = priv;
> > +                     priv->tp_bus[tp_port].tp_port = tp_port;
> > +             }
> > +     }
> > +}
> > +
 

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
