Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82301EE57E9
	for <linux-i3c@archiver.kernel.org>; Wed, 31 Dec 2025 09:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GhxKpxxw22LNkpuEPiqMfDiZEO4FPHKtNWFrx11OZ2A=; b=xXIjIW42qoRViW
	DUbXW0TVUpNdWOyZR9Mjevt2dm8LZ6mxBfNXuKYi9m1ydW+5krQwdJSG/xLvZS0vlEKtWo4SqVt+C
	lfbHOlJ3HKMbwFTTw15sgqK9pR6i4RSqPIN4lFDTrX4Y/V51YcL9FCfN+CXBtp5/MhB0yvbSFm0Y5
	KeIYk7ajE1Rl2mLskhDdHeEsU2jX3UWM95AVh7eae6317WDZOC5glPQFZFed4VUCxdDcUIHC3Ko93
	KcVVGEkoCiktHCGRd+11wdAPXu13zVjlxoKGS3LgwC445n67ngeZy4NmcZ2zsgoYJKZqQw+z8NSln
	YzBmmuVHcI7KxnCuPlpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vas86-00000005oDy-32kI;
	Wed, 31 Dec 2025 09:04:30 +0000
Received: from mail-japanwestazlp170110001.outbound.protection.outlook.com ([2a01:111:f403:c407::1] helo=OS0P286CU010.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vas82-00000005oDB-3KcW
	for linux-i3c@lists.infradead.org;
	Wed, 31 Dec 2025 09:04:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dSlTPbbBM/Kuw0nPSK26bU8CGV/tGNpZi9E7S2I483j6gcwlW9AkckVdbrp+3fqtuLdSA73l342Z9fQ17vFAr3qLr7M5LI6uFh0/ae3UBU/GTDU/i461IsNlxD3OJXGhwko8W32Ra8liwziyhn2A8bOKOfLwIbb3e1i3Jag+pSeeivUevTAScRhz5h9oJFRWUvfhz8rKH05S5gywvXEVJMdnvmPf3+s/1fM3/k+cQn4q11MbWlvui10VGdRzPgN2uLKEx5KJsUqou+27D55arUInMcn1TeuAcEoV+/901IVdmkKGGQjjVNoWFDUVS/D2iv1bSbt0GUzM7AhzO969sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TOla/7ccesDnDtV2Ds1c9KTh9zvckSHax6jvmvHlz6w=;
 b=ZQtU8WOCpJhCcgGN/jGp43uOpJIUmsM6Gz8TLleeSEurTqt8/nkxzRNYLRKxpaFPYKX8Dfl342FvFp0NCF8vOP2C2oL+f4w8+bSMy9etrR39oyeILKlAyO7hGvlLyBiwP2GFEm0YCICQzR3Ce/UJ+oXEEqb8tgJrPeGgznDAikCu2nhEzEnINUBvc29b1jD1tsiprbpsy3Ax030G2qT5PWgm1RQX+A5JYBjZM9aIyJt2OVvVRyFhUoEn4Lt9kHCZC36ue78Vz7ZTLTBy6mjC52yO/GV9Uk2fAn79c5/gnFx9+8F+wmhok8e14thrMnc872MHdQgCk3+bY9hDIlNWAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TOla/7ccesDnDtV2Ds1c9KTh9zvckSHax6jvmvHlz6w=;
 b=wWNxAoyXFJoJrPjpSsm5YWMYKPxfH+jC8wK02v3O238P2W4KaQVMnLfduzbYdlAsb8zrwMafLIXXuX66c4r1f1ljXwQbwICh9p9fA8+H+X0q4sNZRCVtA4GSYBkDihe5xIU0nY9evFxVHTS4AHU+4Z/LYvQ8xrf7ZvhWvLwuZYA=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYVPR01MB11261.jpnprd01.prod.outlook.com (2603:1096:400:367::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 09:04:17 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9478.004; Wed, 31 Dec 2025
 09:04:17 +0000
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
Subject: RE: [PATCH v3 4/4] i3c: renesas: Add suspend/resume support
Thread-Topic: [PATCH v3 4/4] i3c: renesas: Add suspend/resume support
Thread-Index: AQHcei7JxBZxwv/PikKoXTQSaVLoTbU7c6sQ
Date: Wed, 31 Dec 2025 09:04:16 +0000
Message-ID: <TY3PR01MB113467FFD21E457C2B06EC8EC86BDA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <cover.1767168766.git.tommaso.merciai.xr@bp.renesas.com>
 <bccb1a911e76d771dc457012bcc1b943a8c1cdf5.1767168766.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <bccb1a911e76d771dc457012bcc1b943a8c1cdf5.1767168766.git.tommaso.merciai.xr@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYVPR01MB11261:EE_
x-ms-office365-filtering-correlation-id: b4b221ee-0aaa-469c-0973-08de484b93ab
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?obmQuUfToCN/IYqECti1pteQwxPtrxtDLSaUVptS6aoXFQifrjBrjrf/O6j5?=
 =?us-ascii?Q?F+9v1pLhjqd2r8JRFRzhP/F8FnAF63PadQwya4LC0n6dhvQ9IQueMAa0nPJo?=
 =?us-ascii?Q?JT0HyDtrOXkvOKsdNn1vYE4h9Et/ZT9O2B5hpGZWDCzBbzsGZgUc0SuTdjuG?=
 =?us-ascii?Q?2g3NxWg8xh37r5oTDeel+z6stgl877BDzivs0xllemWatOguFo4MG2OE67Yp?=
 =?us-ascii?Q?QUikrRC5ci6IWbEoSmQvaFr10ek1yj15knSOZSawE1hl+ayo0neGTHeWPWYQ?=
 =?us-ascii?Q?ptyLNYuwpkSyf8h7gKGHIWnPTP4NZBNftUtADSfpfdGoEBhZXF6GdBNNgiC8?=
 =?us-ascii?Q?t3/ulgFuxOacvxRQGe/IPSNECdJI723m+RzPo1AlwmQ0PLkqvcEYcl1l9OuP?=
 =?us-ascii?Q?v5RYLZUYlWLJylR7IPMISiUnYGq9mkAsqXs3gz9tUJWx3V2G3cY8BSP+GfBr?=
 =?us-ascii?Q?QFaeYyZlSpuPwe01X3crntPIYIniLr6BC29LKOlGb2clsEOdBsNchT1w3ExM?=
 =?us-ascii?Q?mFE7hzBVEbjv4XeepYjVytuaoU8pvP6v0EMMk9o9oQeDHHqjwZeazF07bW3e?=
 =?us-ascii?Q?BQpylTJ/V2NvemCcAG5k/aITgD3UVIzCf7SdoINQgY5cHnfonLk7SBz6a4Hv?=
 =?us-ascii?Q?eWX4UOljizFCdfY/Z7hjZE9THT8owZ9QJWyAqBp5r1D3GjQ6lfr/YE9wPvYF?=
 =?us-ascii?Q?EOK9GtxH6p2gZDf3P9tIL05Sn2alGwCsQpb2VY3XSkBancbyZsU6PfV6NFiC?=
 =?us-ascii?Q?LDgC8nnGyVCzwI/6wi42TQ5EcS3sP/V4UVPMgewf9rCIPfVUW0UJQibUzgiZ?=
 =?us-ascii?Q?hw58smZ38pJY599CjMk3gCZoSMf0xAYzNzasqEjMs2pVaq0schH/BQiA2JIT?=
 =?us-ascii?Q?HidFsaw3do34hNTQsPOObcw8qym7CPb9eejNBV9T/xViKRyqt/xV+9eRu2RS?=
 =?us-ascii?Q?IDxaMF2uHa48iwoSKFrfN9C7WDM+t/6y4PgZ+ViIjX+HbYuMN67/UPllX9w1?=
 =?us-ascii?Q?NvDhYDtxGD5KpZuQxblVDYCcyEkNPX/wGx8mRryKr3DJmY2loIGHmnuGxNPn?=
 =?us-ascii?Q?E5U3G91bsbU0SmJZp26nvDfrcmeYiw9YLXxuy+Tkg+Lu6xWKzA4x1epHtwIy?=
 =?us-ascii?Q?c0yZGibFNVSqapUxzqYtJ9bpBBZVRhTliqBVv5WaKq5w+cJyAia7wKMDxCt1?=
 =?us-ascii?Q?ncc6NYMmuPrj+H3PirrDFeU3RnJje0Z0rR/SsEC0WtGvQgcPFEFnzznSE8th?=
 =?us-ascii?Q?N2bj2Yyvhu0iyBNxyZXdW8ER7ibXP8JcC6Wqo4vsdeqOIZQY6hB9SvcEihOE?=
 =?us-ascii?Q?u0KvG6bYfWuxcLUMS+GnQ3ZnppsbKu+IgV2vPFB2VKVNkifdUsA1rbUXA7+g?=
 =?us-ascii?Q?cwVfgGwaOr3SCI/UeYbB7KPCJ8Qp1ZCWMgo9ZzhrtEB1qH9LyrHMH+9xJgQC?=
 =?us-ascii?Q?FjfHsUbMzJAQllUzcU4rob4JfZwHHtg2PdUw3hKjM3tr9vL+dCTLMrnx+MB1?=
 =?us-ascii?Q?A5WkeGZT79E5mF5rI9OKsdlT1QUSrhnODe5f?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jcAvdXJcxpnKQPKMo/oqpnGXSBgOxKnHsObqWJAfNFNREq3PTBH3XKLsjCZ2?=
 =?us-ascii?Q?bZcgulzL0VrVoGWbri5o5y/zuu1zCCol2i2IozVzBCi4t2WQiv9GAf3O03j0?=
 =?us-ascii?Q?vIeSHfuUwhQqiNxd6Ai9imf7Rfby5VrGXxt3maDUcE5yjREdO2gfwdadqxKb?=
 =?us-ascii?Q?9RRfXiGZwMm3KNVL1+48c57urz65aTJ9cMlpnGWAnQICjHOEOjpB3UhsxwHY?=
 =?us-ascii?Q?vD0nPMn5pEGoSrbAZxR1SAVD4AoLPrv/dX0QwvNEP+a93id/Bqjd4AGXjlj9?=
 =?us-ascii?Q?eCVqpWGsSwqkFr0RaiHgR8MmE/MjK46NFfYQvlC6ZUp3nApEw6mIvM50rK+H?=
 =?us-ascii?Q?5V4RGVaTiDjPh3FQMkgGmpOIE1QjmLDHZHACjRNiIbmon6Ag4EtDU278lLZc?=
 =?us-ascii?Q?h7kAR6Uapx24CL9zZUu8K8uOHrQYoPDpx+u53rvUrxO5WF7hO9q7jE1sk8cL?=
 =?us-ascii?Q?deTCgYKhaT/gXU0dK7pylRpwnrqWQq1lWqos0v5ksWW0+emOX+DBTKm396bS?=
 =?us-ascii?Q?GYzwwDGxabn6RWOvPjOvqm0tBxTQvA6TEUPCC3eu/iFkIOcGQyqVT+VAAqF1?=
 =?us-ascii?Q?//EdoMKXxwhq5hvDTsZjLrXbOcO1a8nzNfkawvkccfwkbPOYj0xrdooWX2O9?=
 =?us-ascii?Q?e+d4m0yDw8+TIX6N//XO0UTL8gNbddObMRck3ANq+DUW0dis2uxjmFjh+GJm?=
 =?us-ascii?Q?iyd0drccduyTjXT/FE6Gp+JjcBqybJYyYmFitgv42JmvOY/HMsTAAOdpGzrk?=
 =?us-ascii?Q?QgJVxyPyb+gYfrJk6j6NQwyJpFztmO799qwYkfffYvlxZbxug6hDvexh/aCq?=
 =?us-ascii?Q?zygUeoEaQM/XnNj2yYKZJGHf4XEuxZ8Jg6i/vDieL0Wh5WQSMIjyFcCfdA8A?=
 =?us-ascii?Q?1jxJMa9fUaI8A3hVJaCIBf9IqlnL8eRKSpzXuz9kkas+AzaKCpos28C+msoY?=
 =?us-ascii?Q?J94yaFuMrqGM+jwLAD8nStEhmQ51YxUUc/69sIheI1LubaMRVoS4QahijA1w?=
 =?us-ascii?Q?HKi+OxZQG0mH/ubSRfTgsQjeYYNmKfiGHGj/W73vJ2+utGcjkRxgMyIvWAPN?=
 =?us-ascii?Q?yMGrIX46b3SdS9QOtdjjRctmIjdqoewZcL6JzT4PU9Fi/a/ygwjiprP5Ol6i?=
 =?us-ascii?Q?3yi1zb9o/DdcsbtAXuXMl00orks3AGP6wvWtixXPTR8IDDnPMmHs4VsHFbqA?=
 =?us-ascii?Q?YLvWYPkZBbqtbWEEP5Rs0Ehx/umTTwbyr6pHqPmLkHGkh0ygjsTUCgfEs+Qb?=
 =?us-ascii?Q?N6mUCRyM/530/eSCOSFC60RVNXxKfvmuD3T82qi4MV0kw48euikEl/w06MqZ?=
 =?us-ascii?Q?6JitMsrSQplt7j+AvTxk+E2d49AlIACyr9gTpBHPmdrgQ2uHrw06aXRv+OxU?=
 =?us-ascii?Q?1LjbNfSYw3IEg1KzjiThQpnDmHKB4427riidSdz9T+KQwgtNvZeoNqNOf9cJ?=
 =?us-ascii?Q?aXryZ7GMmYImjFcrCpU4hHwyCayQHx5PQ8Z/FwR0nXZdaDoHjVkKr0ztY3LT?=
 =?us-ascii?Q?EocYVsHBxBBWRFg4GFdYQ15qdGuxacF3bdIU2U5tQ2/WGyqkzwBwRhSqUAMQ?=
 =?us-ascii?Q?kIBocSplJMA1WqVF6AkZ8N+Jz7nh08UZbSHv1IMb3o5EmHmIEN1vWTIfbDF0?=
 =?us-ascii?Q?kWl0Zt1nqCFfcvHEf+3Yz5wFZ4LBuTOhnqXBheDeOVflI65drfIMDg5WcugY?=
 =?us-ascii?Q?bDUbtLEXSEhML0F3sSHqBx8muMApXsPijgVhWtbovQuDwJn5kKyvcWSP5WL8?=
 =?us-ascii?Q?JGQZkH20LQ=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4b221ee-0aaa-469c-0973-08de484b93ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Dec 2025 09:04:16.9778
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2SBMOIOdXGY6r+MnayYRZ+r2SNG8vzJEE2SblDVpmIJGADKNvj9PjtNbPJHiqfLsXyrauvB9mKPsnMs32U0NWs0yaUsxhcs7K+lnSqAVorE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB11261
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_010427_063266_9E0079EA 
X-CRM114-Status: GOOD (  25.40  )
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
> From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Sent: 31 December 2025 08:23
> To: Tommaso Merciai <tomm.merciai@gmail.com>
> Cc: linux-renesas-soc@vger.kernel.org; Biju Das <biju.das.jz@bp.renesas.com>; Tommaso Merciai
> <tommaso.merciai.xr@bp.renesas.com>; wsa+renesas <wsa+renesas@sang-engineering.com>; Alexandre Belloni
> <alexandre.belloni@bootlin.com>; Frank Li <Frank.Li@nxp.com>; Philipp Zabel <p.zabel@pengutronix.de>;
> Geert Uytterhoeven <geert+renesas@glider.be>; magnus.damm <magnus.damm@gmail.com>; linux-
> i3c@lists.infradead.org; linux-kernel@vger.kernel.org
> Subject: [PATCH v3 4/4] i3c: renesas: Add suspend/resume support
> 
> The Renesas I3C controller does not retain its register state across system suspend, requiring the
> driver to explicitly save and restore hardware configuration.
> 
> Add suspend and resume NOIRQ callbacks to handle system sleep transitions.
> 
> During suspend, save the Device Address Table (DAT) entries, assert reset lines, and disable all
> related clocks to allow the controller to enter a low-power state.
> 
> On resume, re-enable clocks and reset lines in the proper order. Restore the REFCKCTL register, master
> dynamic address, and all DAT entries, then reinitialize the controller.
> 
> Store the REFCLK divider value, and the master dynamic address to restore timing and addressing
> configuration after resume.
> 
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v2->v3:
>  - Fixed error path into renesas_i3c_resume_noirq() and
>    renesas_i3c_suspend_noirq() function.
>  - Moved up one line sizeof(u32) * i3c->maxdevs into devm_kzalloc() call.
> 
> v1->v2:
>  - Updated commit as v1 has been split into smaller patches.
>  - Use clock bulk API into renesas_i3c_suspend_noirq() and
>    renesas_i3c_resume_noirq().
> 
>  drivers/i3c/master/renesas-i3c.c | 89 ++++++++++++++++++++++++++++++++
>  1 file changed, 89 insertions(+)
> 
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index b065b8d4b138..e33ff16efdb3 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -256,16 +256,19 @@ struct renesas_i3c {
>  	enum i3c_internal_state internal_state;
>  	u16 maxdevs;
>  	u32 free_pos;
> +	u32 dyn_addr;
>  	u32 i2c_STDBR;
>  	u32 i3c_STDBR;
>  	unsigned long rate;
>  	u8 addrs[RENESAS_I3C_MAX_DEVS];
>  	struct renesas_i3c_xferqueue xferqueue;
>  	void __iomem *regs;
> +	u32 *DATBASn;
>  	struct clk_bulk_data *clks;
>  	u8 num_clks;
>  	struct reset_control *presetn;
>  	struct reset_control *tresetn;
> +	u8 refclk_div;
>  };
> 
>  struct renesas_i3c_i2c_dev_data {
> @@ -609,6 +612,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
>  					   EXTBR_EBRHP(pp_high_ticks));
> 
>  	renesas_writel(i3c->regs, REFCKCTL, REFCKCTL_IREFCKS(cks));
> +	i3c->refclk_div = cks;
> 
>  	/* I3C hw init*/
>  	renesas_i3c_hw_init(i3c);
> @@ -617,6 +621,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
>  	if (ret < 0)
>  		return ret;
> 
> +	i3c->dyn_addr = ret;
>  	renesas_writel(i3c->regs, MSDVAD, MSDVAD_MDYAD(ret) | MSDVAD_MDYADV);
> 
>  	memset(&info, 0, sizeof(info));
> @@ -1362,6 +1367,12 @@ static int renesas_i3c_probe(struct platform_device *pdev)
>  	i3c->maxdevs = RENESAS_I3C_MAX_DEVS;
>  	i3c->free_pos = GENMASK(i3c->maxdevs - 1, 0);
> 
> +	/* Allocate dynamic Device Address Table backup. */
> +	i3c->DATBASn = devm_kzalloc(&pdev->dev, sizeof(u32) * i3c->maxdevs,
> +				    GFP_KERNEL);
> +	if (!i3c->DATBASn)
> +		return -ENOMEM;
> +
>  	return i3c_master_register(&i3c->base, &pdev->dev, &renesas_i3c_ops, false);  }
> 
> @@ -1372,6 +1383,83 @@ static void renesas_i3c_remove(struct platform_device *pdev)
>  	i3c_master_unregister(&i3c->base);
>  }
> 
> +static int renesas_i3c_suspend_noirq(struct device *dev) {
> +	struct renesas_i3c *i3c = dev_get_drvdata(dev);
> +	int i, ret;
> +
> +	i2c_mark_adapter_suspended(&i3c->base.i2c);
> +
> +	/* Store Device Address Table values. */
> +	for (i = 0; i < i3c->maxdevs; i++)
> +		i3c->DATBASn[i] = renesas_readl(i3c->regs, DATBAS(i));
> +
> +	ret = reset_control_assert(i3c->presetn);
> +	if (ret)
> +		goto err_mark_resumed;
> +
> +	ret = reset_control_assert(i3c->tresetn);
> +	if (ret)
> +		goto err_presetn;
> +
> +	clk_bulk_disable_unprepare(i3c->num_clks, i3c->clks);

Why can't you use unlocked version clk_bulk_disable/enable(num_clks, clks);
for suspend()/resume()?

> +
> +	return 0;
> +
> +err_presetn:
> +	reset_control_deassert(i3c->presetn);
> +err_mark_resumed:
> +	i2c_mark_adapter_resumed(&i3c->base.i2c);
> +
> +	return ret;
> +}
> +
> +static int renesas_i3c_resume_noirq(struct device *dev) {
> +	struct renesas_i3c *i3c = dev_get_drvdata(dev);
> +	int i, ret;
> +
> +	ret = reset_control_deassert(i3c->presetn);
> +	if (ret)
> +		return ret;
> +
> +	ret = reset_control_deassert(i3c->tresetn);
> +	if (ret)
> +		goto err_presetn;
> +
> +	ret = clk_bulk_prepare_enable(i3c->num_clks, i3c->clks);

Same here.

> +	if (ret)
> +		goto err_tresetn;
> +
> +	/* Re-store I3C registers value. */
> +	renesas_writel(i3c->regs, REFCKCTL,
> +		       REFCKCTL_IREFCKS(i3c->refclk_div));
> +	renesas_writel(i3c->regs, MSDVAD, MSDVAD_MDYADV |
> +		       MSDVAD_MDYAD(i3c->dyn_addr));
> +
> +	/* Restore Device Address Table values. */
> +	for (i = 0; i < i3c->maxdevs; i++)
> +		renesas_writel(i3c->regs, DATBAS(i), i3c->DATBASn[i]);
> +
> +	/* I3C hw init. */
> +	renesas_i3c_hw_init(i3c);
> +
> +	i2c_mark_adapter_resumed(&i3c->base.i2c);
> +
> +	return 0;
> +
> +err_tresetn:
> +	reset_control_assert(i3c->tresetn);
> +err_presetn:
> +	reset_control_assert(i3c->presetn);
> +	return ret;
> +}
> +
> +static const struct dev_pm_ops renesas_i3c_pm_ops = {
> +	NOIRQ_SYSTEM_SLEEP_PM_OPS(renesas_i3c_suspend_noirq,
> +				  renesas_i3c_resume_noirq)
> +};
> +
>  static const struct of_device_id renesas_i3c_of_ids[] = {
>  	{ .compatible = "renesas,r9a08g045-i3c" },
>  	{ .compatible = "renesas,r9a09g047-i3c" }, @@ -1385,6 +1473,7 @@ static struct platform_driver
> renesas_i3c = {
>  	.driver = {
>  		.name = "renesas-i3c",
>  		.of_match_table = renesas_i3c_of_ids,
> +		.pm = pm_sleep_ptr(&renesas_i3c_pm_ops),
>  	},
>  };
>  module_platform_driver(renesas_i3c);
> --
> 2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
