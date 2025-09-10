Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9591CA101F
	for <linux-i3c@archiver.kernel.org>; Wed, 10 Sep 2025 14:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=B5riv9lZceytyZ5u//ZIDlQrOEPGUmwmU73lFwGteBI=; b=X3ko8ZFrJtSkZu
	/IdZB1/SmCHtSZi4uZaYg9SpctXMmRudO/iV058jMmsv0M33o1HC0Gwh6RMJ/0t7u8pYUMVSrAbr8
	/xe3Wf3IfJBPviTeVupm/28KOHflHSQlAF49rCaS3TiMeKegCCJfk3DT/ccdpFlSiSZOIPDAKqr48
	a5oRq3wg+1StGsjMSyQDSDOZF0afWD58FqoFq7CE2vmXhfksb6617YF2F0QNvbZQqgBSooiKwYxtb
	bVKmHNNOK+pIL3+ANO09tauF3gp6XjDzC03oLsDZJpU4eldIMpspmbDyPzW0diHuHKtQC5EPT9fl3
	0dcOShaRmcs/TEffO72g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwLOM-0000000EYRW-1wd9;
	Wed, 10 Sep 2025 14:01:46 +0000
Received: from mail-dm6nam11on20705.outbound.protection.outlook.com ([2a01:111:f403:2415::705] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwLOJ-0000000EYPt-3J9b
	for linux-i3c@lists.infradead.org;
	Wed, 10 Sep 2025 14:01:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cTKKo+n/jyXki3tMrRwV6F7AF/nrO/NGrQAjZtHbKs20Ltt/l2Yvwzs+unjBjXF6xc21edVme0ydx0VohGrMUQ/dFdvp2j+e9dtkM4TZSvIsASHMFaQ7OyYYbGAkbyl48uoz39YeCQtY7t9+hf2IC2HO64Hhbz+CO0adG+9sqkHHkXARvCmxkx9Fo5p2YmGIiRRnXxIQid/Zw8/OZXnr3maq+4qFyvhVfNrEPnTe9ki8naeTvW9o1vPBC19cewxXGLIM6seDBtzLN60KimhZ2QcaKKeZUL30+KxTtzbRVa7VryAwJe1+niNSLuMGFt02JsW/1qPqGYbd/h+jBboWCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tpXNdfPBQzG8iVQYrLYjVZw8BeY9L06peqY446aEBGM=;
 b=EBSUdT89dIk8uu8el5WgcHhkFl6JsWlsbL2CBFGcgzhRQDFM3+tdZb+vf/QdBJ6ZP6+sjqnDWinLJjqCXKxPNaGbEu4HGalmUJe6rSan7qDXfteZnH6k8YNPE1eu5pyX208GUHwt6nt9roglFHXngwWe/LdNwKIA9zCWaRfbLe0oLXkUBjiQKS/kBceCH8zVWTxJO7ZTecbJBsRKLLFKdURu1289O4MJiZ01qqTNFVBeSnIzwVzzfTBocPKcVrwA4Dn6xSeDkT07Jzx8HlIp0YdutckzMF/r+w0DnDoG/HBbYZNwBMsnQQOaEbeshqCXYx6NGuVUWaZgbhUn3V6zqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tpXNdfPBQzG8iVQYrLYjVZw8BeY9L06peqY446aEBGM=;
 b=YkiLllJyPBDp2GF6d6rqE/iW4CLOvUlJPqFm8Dtchq80lS1laBPNAPeX1XyDwiMy2fNOMKENxQMz032prXBAC4TAqroGK4L+p5wuQwPwsNLZV1AFvIw58QlpPxwN4g2apj2OG0gfNsaBOc+3IEbDU/KKvUiuyRjJed4pSk4BpeGTKlQMkwgp6iwHv/Z3U8c3jndfW3dxrKYXL7bcthagY2n1kzkTb1uMmNoEudrYj9v/szg0XPOm/C+OVZmr4murnJ0dD2JXGqseuCqo4RU2WjrvVEFu9loOR6VLTGQu4zl4b3hO4XjRlTFn3XI0gVME01H1NQOIV/lTHvcomDiAGQ==
Received: from DS4PPF71D32B30E.namprd18.prod.outlook.com
 (2603:10b6:f:fc00::aa2) by SA1PR18MB4709.namprd18.prod.outlook.com
 (2603:10b6:806:1d8::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 14:01:34 +0000
Received: from DS4PPF71D32B30E.namprd18.prod.outlook.com
 ([fe80::7c46:661:da37:dc33]) by DS4PPF71D32B30E.namprd18.prod.outlook.com
 ([fe80::7c46:661:da37:dc33%7]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 14:01:33 +0000
From: Boris Staletic <bstaletic@axiado.com>
To: "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
Subject: i3c: scanning for i2c client devices on the network
Thread-Topic: i3c: scanning for i2c client devices on the network
Thread-Index: AQHcIls3B8in9f78u0ufe0uKmtCHyA==
Date: Wed, 10 Sep 2025 14:01:33 +0000
Message-ID: <DS4PPF71D32B30E58BEEB807E76DA5FF106DC0EA@DS4PPF71D32B30E.namprd18.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPF71D32B30E:EE_|SA1PR18MB4709:EE_
x-ms-office365-filtering-correlation-id: 22ad7369-b511-4f69-18f2-08ddf0728cc3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?reifKNIU248Fg1C6ik62i4a7fraPqTxONlD/wk/fzAKo63UY/sZrLg/59O?=
 =?iso-8859-1?Q?AjU2hUgsx1JsXzbMMfFX6J0qC1kCiyiQw++HQJDGyOWxJQQ6cNrhMfl2bS?=
 =?iso-8859-1?Q?TporaXpDGi1b47h4sooFlOMb11n+IV7N/lNGHAzK3nJoNtFFAxyyNUO9jP?=
 =?iso-8859-1?Q?XgNz+qu/D+GMHEk6RXfckF+8XMbEjhwpZ6vyeWmBs8Q/C4sIKMOEBS6u14?=
 =?iso-8859-1?Q?aXozvG4tPrpjL6bzTLdrCTE+yC1wUOlBc3O1H1yviNv90kvmYdE1FOIuPo?=
 =?iso-8859-1?Q?R8bcFmJ5eYW/3Vwd/1WCgmDpDc8kGIvnJZTpl4lLSq2lHxU/el5ITpAoBw?=
 =?iso-8859-1?Q?rfQHVH2OWnhtxT8qQv0sMJhOdA+OWdSEEf0KJzUdcRijYB6qaMn1neUGX7?=
 =?iso-8859-1?Q?ruDJAyWVTrNv1G37j5HY1F8jl3992qir6TetEy9VkX91qsCaoaePJ1AkXD?=
 =?iso-8859-1?Q?ZPebkvJcqKJkTjQ7ySRNhzKsA1FvBOONFLb5Rbj0yrNVuxB7hcevL9xsTx?=
 =?iso-8859-1?Q?G0yCShH2MnZ80bkGTviD8Fehm2TjWwNi4dx1PNUzi++Qq2yGhlz/KW70sP?=
 =?iso-8859-1?Q?oMGSEuhPyZTaHPGQeM6XH+GjA6FjlysbbS7jeiS14HjICVpaXO4qZ5wFEH?=
 =?iso-8859-1?Q?SKFJLoW55U8/AOVG0Rh4IramkxL3oOkIvlwEhmsdX4P2mx5HHTkZbjQWvE?=
 =?iso-8859-1?Q?58LxE0ul+BOdgn39CMLcrcpK0VunPApi8MqXHosgxWAIx2Yru37U8mP3Vx?=
 =?iso-8859-1?Q?kz6hSkUR0H9lEw3wzHnwh4wlzWJasYQPP3AEw0SuaqN+oeeukYBgq0Lr6t?=
 =?iso-8859-1?Q?AxiKRDc7EtPiwjSh5JPVkAVnbRKRsqKziAHU7T1Qtrlwh+AqMQZrFnhyK/?=
 =?iso-8859-1?Q?lteIim7SGmudPadh3qY1zogqWMManptl+PbKIP8M1Dak61QabZmUu5WboZ?=
 =?iso-8859-1?Q?Z7tNGoehDCZkXR1euLM/+RBWeIUtjAkOOlOA2AAh57yG3QpnXBernCquuv?=
 =?iso-8859-1?Q?Rc735CVkFWhBrASXXCKoCnpTTCkciYaaxGsNm4t/tpY9Uzbl5A7wANuo3m?=
 =?iso-8859-1?Q?e2wUSwcPY14eOQ31t+G4KRLxATED88vJddP1xwzvZbw8k3l+A90HBpPjcy?=
 =?iso-8859-1?Q?Ux9EBi8A80vqdpIJ5a2fOZ1O5U+7uoSewmG+i3/FLZsXn/90FQJ5/vjfls?=
 =?iso-8859-1?Q?wjBJjJXKs60CM+NBQVFr+Au4zGdVu1lpD7C8cKJ9USgDU25CBS8IdCNtBe?=
 =?iso-8859-1?Q?2wjBETUBkbtj+o+8m5MowZCwGFlWOr/Tit4YMOONa4NEmQ1Azk/ow3qq9Y?=
 =?iso-8859-1?Q?5e1LL+HAFhJcR+oJCad7ncs2QtAvXkfDn/OMFzFPnylN6jLDepbtN1GhNy?=
 =?iso-8859-1?Q?OlBUVTgxbEjmR5KbmU3LE+UQgBuZOvbtOjL6nbW01vu4JMVMLCXR6dIsUz?=
 =?iso-8859-1?Q?mwzDxCxpT4CfGgbFtjgtY6IhynE5vkgiGaZU7qxvsb6E50ATqQMn80uiji?=
 =?iso-8859-1?Q?QokJN1xETFT58c+8uOYtWEqjQuwL01JIA7gLu//Cjm8SYuUmpYmsXV1zKA?=
 =?iso-8859-1?Q?rRfnD2E=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF71D32B30E.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?XZXt5u6EeraxkTXNOf7Y3H3ehh2QaRC6v0T3tZORH4uYmwWj+kJWvNUAXG?=
 =?iso-8859-1?Q?erBuP3uUsMLFYoq3L4HTrQpMDMoMWHGeYOfayQNEkfIyeLoemUs8h81DQg?=
 =?iso-8859-1?Q?yTEJ3d3mfuvzL1r2u5izdo8ftvnnVnEpW16v0pOYxWV+5h3/JwGrp3uDlg?=
 =?iso-8859-1?Q?I++RfRatMy+oYquYfGssfnBismBvTdZfOqXVbYI2//439rKmNFtCszzeGV?=
 =?iso-8859-1?Q?jH73wqMFp4hCu7YFuaTCyrMehIjnNOGZl+eSQhztAmJcuC2rorSweDtJMN?=
 =?iso-8859-1?Q?62fwp4v29esRaM3NlwC7Qbl+1y+LSt67+2gMHdCLDJXPFaLKcilBPokJCL?=
 =?iso-8859-1?Q?2qVKfny6q2rDDDKDemAqSqCS7bEw1/Rgm4EhToWBluVPVQbt+pNM0+Reo9?=
 =?iso-8859-1?Q?EguKxuKKncbyE0DzHFwQ4mkRHUMR1FHLJ8FintduqHuqUfnvlUh4f2iO5F?=
 =?iso-8859-1?Q?7uyTZZ3+N6pfRF0dMm5UckIj+KKh9tsV+pVHvGhbGoIh1QvyPm5ls/dUlr?=
 =?iso-8859-1?Q?6v7Z5P2rF5/2uUKQphN3ubAUnb2fQ9SScpYCHdFXqwIqsLLsXT1qD/vMqd?=
 =?iso-8859-1?Q?iAFHxogq8UMnK/smKWbX0Ah4uziIiS0X9li1pf5qyXe/obbBpbErra4n6M?=
 =?iso-8859-1?Q?9ctcdlZbhqJn9gudrleCaxaknMtsJRO2scZpUVMqwae2TDj1zFd5Ppskt6?=
 =?iso-8859-1?Q?FIEfzB5mdcLJ7MJoy6jKrxiIR/XHH+3ihJD1ixVRWxqtUjZ+9YyexsVOOG?=
 =?iso-8859-1?Q?NZuGDlfLpsgfvnaTORjpH6wiXmbPLbNdqm4+7SWJQkLzHQ9Nq07uaJ7nv7?=
 =?iso-8859-1?Q?dnUwE1bsyoyyKMRXlX8xgxaX7SMKyyj0GAoeuKzvBF+ZpBPiwzKPiNEik3?=
 =?iso-8859-1?Q?cd9v95bDTrc6oUyuTi03FA5l9mpncPdDb929VtJc1zvaZgWoJHtPJwkKTl?=
 =?iso-8859-1?Q?qyiNb3ZJDDCqvMUl9gdTdW07za5w3RQbEx/olv6bRDn1WG1X2/LJAd9gyM?=
 =?iso-8859-1?Q?9r6rtZb8qzX0vWOIFifCSDIoceMo9Gtu9AZX3OyVT9WjX1luRp9xrQCK5i?=
 =?iso-8859-1?Q?DEmoLb/46bz7ygmkMwNLkb0JpY9SD/d3MZ3lgUch9eus8si9epoRox3UrG?=
 =?iso-8859-1?Q?ODDUmI+K7FtL38JT7rSKkkpcSCwkoSc6xpjvjczsAKqP1U2tCNzS3fxfR7?=
 =?iso-8859-1?Q?Ge1BjLTIExDKY2GegFgyEvCoqxJf555OM8A45kK+Gv5HG88TTbOw7xWK+Y?=
 =?iso-8859-1?Q?VU2YYYM1Oiqyr8nrw+igdVj/0lQ2sPg2VF/Iio5ou97BswzyZroiV9I5DL?=
 =?iso-8859-1?Q?C0Ivjs/kjASIIamzV/scETzcwdfg2rjPaYB5huZM1TCW66r24WygRtJw6h?=
 =?iso-8859-1?Q?2ZBN18mDORpIuUAtu1UqFcLm0ApQwDhes7vV6Y6KeYd8wPzXkBzgzSnMig?=
 =?iso-8859-1?Q?hQAoxdeeRTt64peVH53b4p0xJwZBQSOzpmTBeSs1u3K9fA80XBXpgYkMXu?=
 =?iso-8859-1?Q?s98fopdwCzxFcOxJf0niu2SYpxV/aCgzbvACsbk0iTOYHMzZWNAotjg7dg?=
 =?iso-8859-1?Q?nQGbxtN0NvlX80P3EJDS3Wr+UXXN2lfRAX6MO4pMiKCZFppScclA3qQiXr?=
 =?iso-8859-1?Q?OcPJP+2/ELdQY=3D?=
MIME-Version: 1.0
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF71D32B30E.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22ad7369-b511-4f69-18f2-08ddf0728cc3
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2025 14:01:33.4414
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mFEdBRm4Fyadrq/x+utEaHIvdQqsrGpzz8hJ2Dn7H7qfAwgGojW+vrgYGO+lY4fmBcfRhPm6pUn0H0pcDdElSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR18MB4709
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_070143_821198_ACC5821F 
X-CRM114-Status: UNSURE (   7.89  )
X-CRM114-Notice: Please train this message.
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

Hello,

We have an I3C bus where the user may ultimately attach an I2C slave with an arbitrary address, with the idea
of using i2c-utils to communicate with the I2C slave from userland.

With the current kernel, I2C slaves need to be known statically and thus i2cdetect fails to detect any slaves.
All communication attempts get rejected early, because i3c_master_find_i2c_dev_by_addr returns NULL and then i3c_master_i2c_adapter_xfer exits with ENOENT.
I3c_master_find_i2c_dev_by_addr returns NULL because bus->devs.i2c ends up being empty.

Since the I2C drivers have i2c_detect and i3c_master_controller has its own i2c_adater, I looked into what needs to be done for networks
with I3C masters to use the existing i2c_detect mechanism. That lead me to the following list of changes:

- i3c_master_controllr's i2c_adapter needs to have its class member set.
- In i2c_detect_address, temp_client->dev needs to be populated and registered before the call to i2c_default_probe.
  - Otherwise the attempt to probe gets rejected early, for the same reason described above (i3c_master_find_i2c_dev_by_addr returning NULL).

That much was enough to get i2c_detect to work with an I3C master.
To complete the use case I also needed a registered i2c_driver that implements a simple i2c_driver.detect function.
In my test, the detect function simply checked whether i2c_smbus_read_byte_data(client, 0) returns a non-error value.

Could anyone comment whether this is the right approach for implementing I2C slave detection with an I3C master?
The most iffy part of this approach is the need for such a dummy driver, just so the I3C master knows that "something exists".
I'd welcome any sort of feedback.

Thanks,
Boris Staletic
-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
