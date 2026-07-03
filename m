Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74B68C43458
	for <linux-i3c@archiver.kernel.org>; Fri,  3 Jul 2026 09:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eOXI5fWkt3CxEMFzQwlTRPQZxfn9UbDuEjWukP5DXzk=; b=dYRMAAbtHsueme
	hQgHSQWw2K08PSrzmzYduOO4p6X8f4/e/VnqvWgDySCCEdyjgELOkrEKXu38lIAf4IT2TPkJGme65
	Ckdj5eT9Ezt0tMw7xDkrzOY63epsdQSqy+zc/1xbZEdyVJPEcTvpzM0ER+37mMhhexbZc+kT+PLrd
	mjBuk3WammUTpEDWs2QYyfmiCH3pGHKsWZG0alXl0D2Y+UGVq8JVJkW6jASuwq1rOm/40OmGqDKi1
	sOkBMYcIybWq+D3VP1UySZDi/f4coUW9T11mtMQNIWAgBhww1rdShzXrmdO64KO6pCkisRLQIM5iR
	Uxiby84gx7c4ztRWDn8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfZty-00000006Rg7-113m;
	Fri, 03 Jul 2026 09:09:38 +0000
Received: from mail-southcentralusazon11012030.outbound.protection.outlook.com ([40.93.195.30] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfZtu-00000006Res-0gxl
	for linux-i3c@lists.infradead.org;
	Fri, 03 Jul 2026 09:09:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s/sGNrc+GOk+9gGb0gxu3cvbsG0E2Ii6TVwepKFqxlomn3vSq8pbrELISZKeSGdg+YUzj69AIqzPrRF/qDdySCfhzZhXfqNc8FjNXEbuYoLCrNIDCurKCRwRcYAVA1qerTJu94bb5MvATf9s2ArM7hCrbvLYCMg9OKY63r01Gtn711F6HVXbsFvr3QYkvAVvLzblQ0UL+APtBNPGED2zrrWjP74IUCLVBS4ce/3qmp8WEZsBLvlkY6VIBSSMT0vOiFCWHEXr9o4+X886/CQO8fDnpVjIAL40OQk3snTbUCOIsy2Vd+TzAt0x7yAzWt8N3CM04r/SlsxExPk1s3Lbag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oLigl7TbZmSi9KnrB8/oBGHttstowUN7HTBJmcdiA9w=;
 b=VJkJkbNoRuaFMETUAGYc1W130e6C0xIhc9xlZugCCoffBcdlSHX52jgtGGdELSPXsRlUmMYDfH+adFcq1VoCXd+fsCrPMaTHGwUROX7u/mO69z1oyHBMXAOGRoZEpVEPz2r1sTGLtTuIdPlEAiYDQ2p+H7SlZp7DagyZpa4LELyKNdGpt8AlYjvJTgArSQsaTv0Mx8zYZipFnrqrLAGlD50EJ4LdDIgQC7sJcFzWsYeiiOzhjnhYyvnpldCa0mRrJLiXBLHrR4Y7jFOcQWc4US8Bw/NZP20sZAf3IHqU5d5goDoq1FN4gFoxyXCsfTYP6vz0j1FQv82fI5uJPF3fLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oLigl7TbZmSi9KnrB8/oBGHttstowUN7HTBJmcdiA9w=;
 b=NzaahNzKmKWbwQ2XZ4HVbUUa/PIsFgTIALBd/hEiMFgsdJpDjVoifYsE7w/7Rvf/TvVH2uZ9nCWc4igAikTozeeD5iXjQnvWXEF50ciXdZSiyfLY0Qyq1+XMH7dHBbeqc5oyoZANNJwLr0Yb05FTEP9r8ttOyQS7A5N1JNCcPhuxX5aeenDmWY+O2tr0xabtfit8hD6FJli9rGg+ynCWRgSBpx37EUomvh/hU90LcTNwInS5OtrS+Hn7chhobM0pS4s+UicE+WJWm7lS4qwF6bXglbiLRzCBo9+A9W4H/Huhsy1Sx4rAfP3xc/DeoOC3lY+D2eLNROaNDMOLBNepag==
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by PH0PR03MB6464.namprd03.prod.outlook.com (2603:10b6:510:bd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 09:09:25 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 09:09:24 +0000
From: "NG, TZE YEE" <tze.yee.ng@altera.com>
To: Alexandre Mergnat <amergnat@baylibre.com>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, "NG, ADRIAN HO YIN" <adrian.ho.yin.ng@altera.com>, Felix
 Gu <ustc.gu@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>, Jorge Marques
	<jorge.marques@analog.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?UHJ6ZW15c8WCYXcgR2Fq?= <pgaj@cadence.com>, Tommaso Merciai
	<tommaso.merciai.xr@bp.renesas.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Adrian Hunter <adrian.hunter@intel.com>, Jarkko
 Nikula <jarkko.nikula@linux.intel.com>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>
Subject: Re: [PATCH v4 1/3] i3c: master: dw: Report actual GET CCC payload
 length on success
Thread-Topic: [PATCH v4 1/3] i3c: master: dw: Report actual GET CCC payload
 length on success
Thread-Index: AQHdCJM6q1TT8Qkxikud8GTrgU5NsbZYefkAgAMMJ4A=
Date: Fri, 3 Jul 2026 09:09:24 +0000
Message-ID: <ca7545d9-9738-42af-aa53-397e8909196e@altera.com>
References: <cover.1782824628.git.tze.yee.ng@altera.com>
 <b99393b7761ff249dfd147b5ac028ea2e48915ce.1782824628.git.tze.yee.ng@altera.com>
 <178290222674.176638.15906284505119583670.b4-review@b4>
In-Reply-To: <178290222674.176638.15906284505119583670.b4-review@b4>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB5950:EE_|PH0PR03MB6464:EE_
x-ms-office365-filtering-correlation-id: a40b4cba-6387-4c01-dc80-08ded8e2c6ca
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|38070700021|22082099003|18002099003|11063799006|56012099006|4143699003|55112099003;
x-microsoft-antispam-message-info: opt3kVwAIQmDN8c3lVo1mHfq13yRzmIvtZwtvYtNkAXE1znvBNgn5FXG28FHRI7TOqULcVZBeSvvBDEUZanDdsLqtctUuFasUGv69XeDgQ58lRsXzXp0c7W8O/FRKBXBYQt1jS4PbLl5k/B6OyzEXr5xHVKwWI+kAnrOVBJ02SnoU8RF9l1dUF4De7LUibVXtpOjBWYjusQbGECpJ0O2aNQNeA5R+OLrEDLv6bBNFJV4fh8jCvidmYfbZJrlqAX8YaQW2lJIaANMpoqGUFtSx8BjmdM5PmyFdc4T+b5i9k9FKI+Y7y5cu0z+AK1j+kljfpJcSoV0AzJ13rpqB3E7edSdik+RmHkjcA3klueJ8tcUR4Nmj/KPIG5dwoz+IG/96SGyj0h9lne65nu0acgnJC8FBDecqZAyATr2gzNPQ2spqc4MZTO1qgyDaCbdfx8Zdt1YT6DtjFTAHngydLNM0sT+acQw5Ls3OQjJKWgrWLVcqyzhn+YCSY8Z5CIXw865uTQWz4K2nFPFzU11QmRjxXrXZGlh3HXTF+ob841g32etNkXhk6CfZ72fa+QqrAUuEuDrugJwwNI9st+4Uw/+MB/IjyBjrKdQFyjIMSQdmH4vhsYoo2EVhyu/4aEDAqoB4vswsVY+L6LeCZ48bNp3Tuo/Qzlv03jCh1q6P4y+6HZqHqfHRqsqnaq4vtZFK3xwJX8TfX4VtUH6j6OeGMXmlBoNgh7m9+UsfXwF/cFlbsk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(38070700021)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003)(55112099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NmhuRjZKeDhmbENYV0RReU9XSUhYeTZOR3AzdmUyaXF0TG9uQW5uVHVuVmRY?=
 =?utf-8?B?dzRKeVhaSVAwTDY2NExzTW1HeDA5U0p1b2hlTmlJUVFWZERVV0RBTzA0aElZ?=
 =?utf-8?B?MmdyMlJNbEJ2TzcxVzVXNkpRUnptRXN3Q3lDa2Rub2o0TjJvTVZIakk3dmM3?=
 =?utf-8?B?Z05ET0tHektIQm53aFMrVG41VkttcVpPeVRrKytxRlVjWVh5dUtWZ2l4eDRN?=
 =?utf-8?B?RHVnU2htdkxjVDNCbXU5MWh1NFZUQXhOMTBrNTFMK2hST29uTVdHMGNXanlr?=
 =?utf-8?B?dnhNY1dhRTFoa2RLemV2MStOdlF3N0dMbG1nSDJoTXdZNlE5dlFrZHNzdklo?=
 =?utf-8?B?NTNVM0dVdjB5NU5lSVBJaVpkSUhHckVZR2lwSjFwMWdIZW1OL0dIcTk2TDVr?=
 =?utf-8?B?MmQ4bkNDTFdGbVhxR1E2dUwyZnArclNKazdwZUJzUEc1ejlvR25VWHdtZzV6?=
 =?utf-8?B?MXlCQXNQM04vVVkwNmRGZDNycXRNODZzQU5pWFNoQUtYYTNxWHRaRVg5bVE4?=
 =?utf-8?B?dUJiUEUyNmNaUEtTakVyREpxV1hORy9icEVheW5EcnpIN2RIT1VTK2g5Q1lh?=
 =?utf-8?B?TVBhLzB6RVZIVEtCZm9oSSt2MDRZbzMrZ3Z5YldSd010RExhQkozeEhXd2tu?=
 =?utf-8?B?TzBBTncrbnNSL2dzNXI3Y0x6L0RaUGR1MW44QUdOL1NRTTZNSmgyRHlMMGdS?=
 =?utf-8?B?SHhaelZ2dy9ZbjU5OFlDZVRRbVZrY1U3R2VyZFMrbU9hRXpxZHRmcEVVOVZJ?=
 =?utf-8?B?aG03WjMwY0I5RHVEQnBCSzg0QkhRcUt0T29namJIYXpxa3Z0aytpZXdTazlk?=
 =?utf-8?B?N1JnNGlyTllTeWNZVTdOVWtnaXQrcDJ1MWQyd3p1QU83Y1ZabytCbmZvV1dq?=
 =?utf-8?B?eTlHalVORFh0QUxrMzJtVUY4Znc4NVNYNUZMa2pudVo5blNMaWh4b0JnRGcv?=
 =?utf-8?B?M216VG1uV2VCRWtQSWxoQzMzYlUraGkrcnNPbVpMZU1tYmNFUUFhRVR4RFJB?=
 =?utf-8?B?RVF0TmJJVTJPWFNhUXlLYWdqK1RoWk9RZ1lPNnU4N1JiZWNXQ2Rua3liWjBS?=
 =?utf-8?B?MGRWdkh4SkVTZzJIY3JVU1RqdWtzdXBOaWk4dlFSdlJBVDZuWm9LS2ovZWQw?=
 =?utf-8?B?dmJPMlo4dkFxU2F4OUNrNFJSMnlGeGYxQUVVY2hCcmZ3RnJTVzhUSW1ZNjYz?=
 =?utf-8?B?NTVwajBsY2xzOTFNa1dOL0dHOTVDQThVOTRRcXJ1UW1mNzRFbE9zQUFncHRH?=
 =?utf-8?B?TThpbXUxOVl3UHpzZzZLUEdLc1M5aXNPS050d1FvdU5BR2ZzK2JoZmZDdU5a?=
 =?utf-8?B?VkNYY0laK3lDNHNYVHE4ZU1ibUhFemxIaUNlOG9EcnEyM01GNTFRaXVIK0JF?=
 =?utf-8?B?bDJ6SFZuVjk0bDBoRDJrdGJjd2VEeGdWNGUwNEljMUFDaVM0N2hhdXRIMmZs?=
 =?utf-8?B?aHQxbWFmYzVrS3FrQTVkUk1GNUxxVjhEYzh1UXhNaDFuZnVuUFg0bk9jeUF0?=
 =?utf-8?B?MHdTNjFJY3dUek16cGRyUEF6QmhXc2tVVEptUDBERCs1YXVQMU0vbVEvMDFr?=
 =?utf-8?B?c0ljeExzZkt1SEs1dzRYbVRmaFNEdThNcHp2bWJiYm1PdHNPMytuVzZmSGRs?=
 =?utf-8?B?RTBnTVZGd1FTN1p4SkgvcXBBTVJBNktuWW05RTZIVTZES01HekJybDFTOWov?=
 =?utf-8?B?ck1RWTEyQTBGYit0Qkl6UURSN29LZGNjYlQ2aEsxaFQrNVk2ZEhNL0EzMWR6?=
 =?utf-8?B?WEgzNllSVlU1MFhuSDY4U3dCdmZvRmhreGtGUHFHckQxdHRTSlRxSGFoU05m?=
 =?utf-8?B?SW02MUNCREFKNVlxYkhHMVdrVXA3aFF3dXFSbTgzRjZrOFNHSVo5TThOWElH?=
 =?utf-8?B?WUNUalR5aHV5Q2MwNVlWMEdERW1sZVAyR2dQWnVlV0dTRkd5S2FZWHdGZ0N1?=
 =?utf-8?B?NWt6YndReXlyWGJCeVhMSTR1RlI4QjMwVEJXcHArbjdWU3IxU2N1dTdZcitk?=
 =?utf-8?B?V3RMejMyUS9rdkJ6Y2NDZ2h0clR5NktJU25URkdobHo4M1BlQmoxcWxGQito?=
 =?utf-8?B?bnJDUmJhK2cybUhYWnh4bGJYVVNTelV3N2t6d053RUh2ZFNPbnZXU2c4ZlRo?=
 =?utf-8?B?cDQxVTNKYWRKRnBycmhwZjJSVTlnOXBtQWMvRi9rYWJBZ3Y0MStjN2w2NFd0?=
 =?utf-8?B?dE9qWE9USFZaaUdyM3pBWVJJankvMGNaTzFNaGxoQ0JaaS9JUzNJaWE3eUo5?=
 =?utf-8?B?Rk5WT1VlSjFucnJ1ekdScVJaM0lDdTcvWTlHNCtDcDlUR2p0Vk1vdGJuVUpw?=
 =?utf-8?B?VVUxTDJaWC9QcXh3TThNVGtyb2ViRVRoV2cyRDg4bWltOHlYYUlXZz09?=
Content-ID: <ADFD40CE838020459D0019AB50534CAF@namprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a40b4cba-6387-4c01-dc80-08ded8e2c6ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2026 09:09:24.2167
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6w1J5BVu7kxw5atet8ru+ebl11TeIW9/Glmj1cFyErv4CDldgmqiox1JS+TYrTVzKqSLt3LnRyFgr1PysE1RlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6464
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_020934_219180_4345FAAF 
X-CRM114-Status: GOOD (  16.66  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

T24gMS83LzIwMjYgNjozNyBwbSwgQWxleGFuZHJlIE1lcmduYXQgd3JvdGU6DQo+IFtZb3UgZG9u
J3Qgb2Z0ZW4gZ2V0IGVtYWlsIGZyb20gYW1lcmduYXRAYmF5bGlicmUuY29tLiBMZWFybiB3aHkg
dGhpcyBpcyBpbXBvcnRhbnQgYXQgaHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50
aWZpY2F0aW9uIF0NCj4gDQo+IE9uIFR1ZSwgMzAgSnVuIDIwMjYgMDY6MjA6MjUgLTA3MDAsIHR6
ZS55ZWUubmdAYWx0ZXJhLmNvbSA8dHplLnllZS5uZ0BhbHRlcmEuY29tPiB3cm90ZToNCj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIvZHctaTNjLW1hc3Rlci5jIGIvZHJpdmVycy9p
M2MvbWFzdGVyL2R3LWkzYy1tYXN0ZXIuYw0KPj4gaW5kZXggYTc1OTNkNmVmYWM1Li40YTk4NGE1
YmUyNjQgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIvZHctaTNjLW1hc3Rlci5j
DQo+PiArKysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvZHctaTNjLW1hc3Rlci5jDQo+PiBAQCAtNzQy
LDcgKzc0MiwxMCBAQCBzdGF0aWMgaW50IGR3X2kzY19jY2Nfc2V0KHN0cnVjdCBkd19pM2NfbWFz
dGVyICptYXN0ZXIsDQo+PiAgICAgICAgICAgICAgICBkd19pM2NfbWFzdGVyX2RlcXVldWVfeGZl
cihtYXN0ZXIsIHhmZXIpOw0KPj4NCj4+ICAgICAgICByZXQgPSB4ZmVyLT5yZXQ7DQo+PiAtICAg
ICBpZiAoeGZlci0+Y21kc1swXS5lcnJvciA9PSBSRVNQT05TRV9FUlJPUl9JQkFfTkFDSykNCj4+
ICsgICAgIGNtZCA9ICZ4ZmVyLT5jbWRzWzBdOw0KPj4gKyAgICAgaWYgKCFyZXQpDQo+PiArICAg
ICAgICAgICAgIGNjYy0+ZGVzdHNbMF0ucGF5bG9hZC5hY3R1YWxfbGVuID0gY21kLT5yeF9sZW47
DQo+IA0KPiBJbiB2MyB0aGlzIGFzc2lnbm1lbnQgbGl2ZWQgaW4gZHdfaTNjX2NjY19nZXQoKTsg
aW4gdjQgaXQgaGFzIG1vdmVkIGludG8NCj4gZHdfaTNjX2NjY19zZXQoKSwgdGhlIHdyaXRlIChT
RVQpIHBhdGguIEdFVCBDQ0NzIGFyZSBkaXNwYXRjaGVkIHRvDQo+IGR3X2kzY19jY2NfZ2V0KCkg
KGR3X2kzY19tYXN0ZXJfc2VuZF9jY2NfY21kKCkgY2FsbHMgZHdfaTNjX2NjY19nZXQoKQ0KPiB3
aGVuIGNjYy0+cm53IGlzIHNldCksIHNvIGFzIGl0IHN0YW5kcyBhY3R1YWxfbGVuIGlzIG9ubHkg
d3JpdHRlbiBmb3INCj4gd3JpdGVzIC0gd2hlcmUgY21kLT5yeF9sZW4gaXMgdGhlIGNvdW50IG9m
IHVuLXNlbnQgYnl0ZXMsIG5vcm1hbGx5IDAgLQ0KPiBhbmQgc3RheXMgMCBmb3IgdGhlIEdFVCBD
Q0NzIHRoaXMgY29tbWl0IHRhcmdldHMgKHBhdGNoIDIgbGF0ZXIgbW92ZXMgaXQNCj4gYmFjayBp
bnRvIGR3X2kzY19jY2NfZ2V0KCkpLiBXYXMgdGhlcmUgYSByZWFzb24gZm9yIG1vdmluZyBpdCBp
biB2ND8NCj4gQXMtaXMgaXQgcmVhZHMgbGlrZSBhIHJlZ3Jlc3Npb247IGtlZXBpbmcgaXQgaW4g
ZHdfaTNjX2NjY19nZXQoKSB3b3VsZA0KPiBtYWtlIHRoZSBwYXRjaCBtYXRjaCBpdHMgdGl0bGUg
YW5kIHdvcmsgb24gaXRzIG93bi4NCj4gDQo+IC0tDQo+IEFsZXhhbmRyZSBNZXJnbmF0IDxhbWVy
Z25hdEBiYXlsaWJyZS5jb20+DQoNCkhpIEFsZXhhbmRyZSwNCg0KWW91IGFyZSByaWdodCDigJQg
dGhhdCB3YXMgYW4gdW5pbnRlbnRpb25hbCByZWdyZXNzaW9uIGluIHY0LCBub3QgYSANCmRlbGli
ZXJhdGUgbW92ZS4gYWN0dWFsX2xlbiBiZWxvbmdzIG9ubHkgaW4gZHdfaTNjX2NjY19nZXQoKTsg
cHV0dGluZyBpdCANCmluIGR3X2kzY19jY2Nfc2V0KCkgbGVmdCBHRVQgQ0NDcyB3aXRoIGFjdHVh
bF9sZW4gPT0gMC4gdjUgbW92ZXMgaXQgYmFjayANCnRvIGR3X2kzY19jY2NfZ2V0KCkgc28gcGF0
Y2ggMiBtYXRjaGVzIGl0cyB0aXRsZSBhbmQgd29ya3Mgb24gaXRzIG93bi4gDQpUaGFua3MgZm9y
IHBvaW50aW5nIGl0IG91dC4NCg0KVHplIFllZQ0KLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QK
bGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
