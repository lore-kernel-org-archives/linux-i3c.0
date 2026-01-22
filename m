Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62CDBD6CFA1
	for <linux-i3c@archiver.kernel.org>; Thu, 22 Jan 2026 18:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O1K/jQI4XtXrEqiPG2zAkTY5+EjT5ux3EkqqZbd+Rcc=; b=HAL7qTc5mnZzE0
	uf+MVSmbIqCXtSYCpoXSJxN/USph2CjlzWY6i/HG3iwRZiaiJCyUNr/Z+BIXCYM1TEImtwZmNlKrX
	lutVAzm8Q/4PRo87f+VLCvuZ7gD7PzVaJKsnXy2KyiuQ3QOto5HOz3IIGSrgDhSwyxyMkKCVbTAgz
	BYRHmiT31x/Nban4mOiH7w3MVsJCEiWSu+ty5XBYirH4+0EHUEwJiaUH9f6jFHY1qTy/Nfw4+6JK7
	udH84ey53DHArdFAdHQssinsOab+YQMx3Ae8GVK8Z8XZFxaUitAZZVaIGNIvrc4YwRRb8zGpcTKvp
	uRKxXp2r8aGUcHdGtCNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viz6s-00000007bul-0U5x;
	Thu, 22 Jan 2026 18:08:46 +0000
Received: from mail-sh0chn02on2093.outbound.protection.partner.outlook.cn ([139.219.146.93] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viz6o-00000007bu2-1ydp
	for linux-i3c@lists.infradead.org;
	Thu, 22 Jan 2026 18:08:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hhaioUM/EPmOb3QcjL88OPC6KepciEy6aNmAEVtQHxXktq1dip0Cu3iKoNVn5I1YFl8MvdocgCsSZKowmWzPw1QIhc5gHsrIpY7K32Do5qCZl0TVyn5jiELzQitOyTG0+DkUr4bKV7e5E5P7V3j09T1pR/AOK0uEavYyvTrECo4SsdBQR/pO2RUN8gizCPs0x4hv5gUIH9qXWe5hLmhLjYPi4ta2e9/DnmdJv3CAjRU0CcQYsRNY4qI7dFl45yPXAVvWhAh9F16qKp+qPrP8hvIvEivO08ZfywIdSi4T0cb3jypRZ0AxBpf93lMhVk7nmu3rVHVPYuxnfB8uZWTYNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q7hFkh6RkPuIFH+B/irw892/Q8IstVbmlLHKKPL6Cng=;
 b=dNHDpXJf2gZSipTCvpAPqWThe0Zd4/xSxrO0OCOr6eu3+yKbSzxWpodtET+6jrvn0kpK08dufvXP95lIZjizOfOUwWAoL94PqAwn17anp8813J5DvSGCX9L9CzUD23UUZspyYSvVe65xYe5PkYl1fMiFlJqunjcwv4+PUG7J/2HuBq3do1O662YvchmGhqiPytVSaByPTt5gx3npNHAxv+iOXEALBVoSe197a023NB30XKKSyoluFdI46W7SCcBojo61i9d+R4zl5b1sYrmwWfWNxsA+qWbUyF2Q/N4d9Ll+wUqZSjBAKvOQVlON8kMX4+CPOW0HuDBx9G3rRnAC7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:20::14) by SH0PR01MB0763.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:22::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Thu, 22 Jan
 2026 18:08:30 +0000
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 ([fe80::81c4:2724:6a48:a18]) by SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 ([fe80::81c4:2724:6a48:a18%6]) with mapi id 15.20.9520.009; Thu, 22 Jan 2026
 18:08:29 +0000
From: Joshua Yeong <joshua.yeong@starfivetech.com>
To: =?utf-8?B?RGF2aWQgTnlzdHLDtm0=?= <david.nystrom@est.tech>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>
CC: "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] i3c: master: Add sysfs option to rescan bus.
Thread-Topic: [PATCH v2] i3c: master: Add sysfs option to rescan bus.
Thread-Index: AQHci8jXfC4fs9k2SESU1S7V+9LN2LVee9dA
Date: Thu, 22 Jan 2026 18:08:29 +0000
Message-ID: <SH0PR01MB0841E47B510DB5EFB48B3460F9972@SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn>
References: <20260122-i3c_rescan-v2-1-84c74a483f03@est.tech>
In-Reply-To: <20260122-i3c_rescan-v2-1-84c74a483f03@est.tech>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SH0PR01MB0841:EE_|SH0PR01MB0763:EE_
x-ms-office365-filtering-correlation-id: 9ba5d725-817b-4f85-dfba-08de59e13f14
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: UFhbQKxXc0aFnGNVKXlAGGo/fNIy7y7GuY1g3ab6Td3m3QkWKRWApZAPEwlt4yapAKx+FxrKOr4lXTvAY6aEoTMj1KmwZakgxyjNTzFv+9NP4A+PCRqD6ixtMtaVKiYB1sHNn7eeDb9xvhn401chkPFzWA0iHpHnrgAYzZq2ZiRcGhJ/1xVumObj15VnBK1iYHNniRouqZ9SGdhR/PrXQfrPn2OkLi+ETa57wGI0IZUCzSiQIZIjYksdzgaqEvypr9RW9vc7ZN7jNIAdCnjRWtXjSDAOX0KNy3iYGF07xz11AdFAs/QrB10Qq7bgGC1bDGadlegWnZ61H/Ls1NzgK/rJrZeLBI94qD3cW7oK9YxNaML3G3YzndFOwx2b46sWKhKybfWgEVhzQnitWlyPT9I+rDGMlkIgC+Be7dJteirmS5ICSMxe2DB4k7fcVr0bx5mOcFRhLg+X5roysXYYIY4H0R6mfTKvBa0YHNosbZIMqqBaCYxXVIXBskAWQxlx/z4D0zpVPca4P2rr/P4oxVqKMtghoUqqaHdWrHauDUjpdMD2ZVraRlKBO1ejIM4qT4Pzw1+zDr2k+B6Jv+H5hmYwrZK1sSjV/ZMDnfmfVSo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Ri90NjFqcTlHRWJvbjM1NTA5ODZEbHRxU2pPdDdsSldybEZHdnJ4WDM5KzFw?=
 =?utf-8?B?bVFxYjdEcDk2RG5VSUMwa0ZnYjBKWTRHS0V5cmNiVFEwaTBSRkh3bngybEkw?=
 =?utf-8?B?UG92dTNWTnNEZkpTNUc1b1RJM0pNbVgxeldZdmhiT3hGclk3ODZUbG1ua2JL?=
 =?utf-8?B?WndONDRVMHFkNndQWTBUVjEySVcrS2J3VEo3T1pjWUl1MnFkRE9DLzlZWWI4?=
 =?utf-8?B?azdGUElyRkswQnhhK1VsMEJ5aWtoL1dyQzFhZXdFV3cxaEVyUlQzSVZsQy9q?=
 =?utf-8?B?VElBbkRGakF3RlBzR2cxWDNVNkI0QWtETzNHMGV2LzNIMEYxYk9jWFFVU2tH?=
 =?utf-8?B?K2hiaWRQRnVqZFNyU2ExZW40YTc5azdYeWhPUS96V3F3ekJIQlQvMjVpTzdx?=
 =?utf-8?B?NVR0Z2pWa2pLUHQvVzZHejBjVWE4cTNLRHFRRVZNVjBrT0JIZXNzNDBWeUtH?=
 =?utf-8?B?SVhmWXpWTllCdVpNdjJzVzh3bHovQTJqeXEweEhSNGFqVE1Ba1JZaDBQQTVl?=
 =?utf-8?B?SE5hSTUrWlI0cmx0aHBIRmhOb1VxbFJZc2tudWNZK2xINEtzbFZYcWhPSE1E?=
 =?utf-8?B?SWVtSjcvdjVnMmsrK3lReURBbytia2IxaDBMMisvNkpuVklxV3pISnlDQUdD?=
 =?utf-8?B?SHE3NFY5SU9RZEJ0d2VLSTdpQ3llSi9IYmsvdi9jeWszbHJkUnNLZytjSU1V?=
 =?utf-8?B?Qll2Qll2M3V4TEgwdi9PZ05reGtGRk5Bb3dpTlUvQnpQQVZMa2dxdXF5ZUty?=
 =?utf-8?B?SVAyaDJ5dDZoSUJuTkxjRkpjZnIyNURINjcxclplWTUyVmtjekdEZVZ0VVBD?=
 =?utf-8?B?NnRyWmU0dU1PcUlSTVhDeFJiR3I5ZU02S3g5ZTF4eFBoT1ZKRE1NM0dOYllj?=
 =?utf-8?B?VG1IMWlORXVGL0tpemNRT3V5ZnkvRUFGVlpubzFrc3o0M0tWMS8zL2RrOUZi?=
 =?utf-8?B?aFEyVHp6QjBZMCtJMzdkTXNjS0R3dzZldGgvSGY4ZmdWYkpQTjhwVjEvd1Jr?=
 =?utf-8?B?Tm16b3hDZDNjQytVVFhxV0dMOHFoVVZEa1RBWHR3aXpzOWIwOUwwSGZGZGg5?=
 =?utf-8?B?K0kwQWdTODVaZXA3UHd2ZjU3WTEyQmdMNXlncldmNHJZMk9IaXB4L1ZqTjQr?=
 =?utf-8?B?dHlYcWhlUkZOQzJhUUFnT0ZvRUJ5OVV0UXQ0dUtEdG5Gc3F2RThlNmx0WkZx?=
 =?utf-8?B?UnRPWmZvQVdrNUtOd0tqUkhmK1N6cFpKaHMweVVFY3g0aHM3a09UeUpYREI4?=
 =?utf-8?B?aEwxai9ILzZobmVIemtybDVIbnZvdzhCRFg1Q2VjL293czM4T1hHcDI4Um9X?=
 =?utf-8?B?WnhLQ1I3bkJ6UnZXV3l5U0RDdlZTV0Vqc040bmlpRzVCSm5PK2VpeUJWeWgz?=
 =?utf-8?B?Tk4waGdHZGlFRGYxM1Buc0Y0WVR6djhjbmNzaEVNWXhERFBjenVXenphaTFO?=
 =?utf-8?B?TjRiYlJISmZWTHdSQm8wMFhjZ2pkT0FVR0FJRVlNSE5IWm9sbkRmZWlKSUNq?=
 =?utf-8?B?OHptcmVSVFRCOU5mOWVWMVRpZ2ErSEFVT1c5OUswa0JrTEw0cVV4elh5U0Mr?=
 =?utf-8?B?QWpQM2RxdmFURW1RSWFZSjVyVDgzQnNEYmI2cjBwTG1wbkR6bi81My9LbitL?=
 =?utf-8?B?V0k3c3B2ZDFTTTNnd21oZGpQV3Vtbllrc2k1NWg2R0dIMHp0OHByc1FIMlFx?=
 =?utf-8?B?RUFTaUFCU2FBNzB1UjVPd0wwMDVDWW1QU1FNT0U2U1d0L2FwUG5vQ0gwdWF1?=
 =?utf-8?B?MlZmS2x1c1hNMWNtOHMrdVp0N096eUJIOXJiMGl2enFXUjdXL0tRQS9WVk1O?=
 =?utf-8?B?TVJjU3A5c2tQdmZTZEtrTE1BZTNqUE9aTi95b21uTkIyd3FkVldzcHdvWjB6?=
 =?utf-8?B?blNwRURZZldBcE5lUVZRc3RvallUaHgxWk9pRkppYit3RmdUOU43Z3F1ZmRN?=
 =?utf-8?B?NlJEYlF4YUkvakJRanAzTzB4UGJ4QmtPK3B1WTRxdE9TWm9PS09uU3BselFO?=
 =?utf-8?B?eGF2VkpwWnNVWVd4MU5LaWxPUUxueGJ1bDhkdk9lU2NkMlVyNnVVQStHNmtx?=
 =?utf-8?B?aEpBL3RlZEFEQ3gxekRFRE5FeHJiOFREL0tOUjUreG90alI4bExWckZXR2FR?=
 =?utf-8?B?TXhJaFpOcTF1cXRQdEtQc1lIbi9lbXRhZWhGVWk5d2NoRmdvd0h6bGZkNnpQ?=
 =?utf-8?B?VGc9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ba5d725-817b-4f85-dfba-08de59e13f14
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2026 18:08:29.3900
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /wz19gdzBe4wtldBBqrN/HxS8+H/dj5VlitkucjUHU2AYzgsTkmgJJBvVUY7FmBRuxSK0e/+oQ6vFoKYJsLV3HDa6YqFJGtpEhDuiBcMCqo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SH0PR01MB0763
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_100842_513520_2780B5D1 
X-CRM114-Status: GOOD (  22.46  )
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

T24gRnJpZGF5LCBKYW51YXJ5IDIzLCAyMDI2IDE6NTggQU0sIERhdmlkIE55c3Ryw7ZtIHdyb3Rl
Og0KDQo+IEFkZCB0aGUgYWJpbGl0eSB0byByZXNjYW4gdGhlIGkzYyBidXMgZnJvbSB1c2Vyc3Bh
Y2UsIGkuZS4gcHJvdm9rZSBhIEREQS4NCj4gVGhlIHVzZWNhc2UgY291bGQgYmUgZi5leC4gYW4g
aTNjZGV2IHVzZXJzcGFjZSBkcml2ZXIgZm9yIGEgZGV2aWNlIHdpdGggYnJva2VuIGhvdGpvaW4g
c3VwcG9ydC4gSWYgdGhlIGkzYyBkZXZpY2UgYm9vdHMgc2xvd2x5LCBpdCBtaWdodCBiZSBtaXNz
IHRoZSBEREEgZHVyaW5nIGJvb3QuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IERhdmlkIE55c3Ryw7Zt
IDxkYXZpZC5ueXN0cm9tQGVzdC50ZWNoPg0KPiAtLS0NCg0KQ2FuIHdlIHJlbmFtZSByZXNjYW4g
dG8gc29tZXRoaW5nIHdoZXJlIGluZGljYXRlIHdlIGFyZSBvbmx5IGRvaW5nIEVOVERBQT8gSSB0
aGluayByZXNjYW4ga2V5d29yZCBzaG91bGQgYmUgcmVzZXJ2ZWQgZm9yIGNvbXBsZXRlIHJlc2Nh
biBvZiBpM2MgYnVzLg0KRElTRUMgLT4gUlNUREFBIC0+IEVOVERBQSAtPiAuLi4NCg0KPiBDaGFu
Z2VzIGluIHYyOg0KPiAtIEltcHJvdmVkIHRoZSBjb21taXQgbWVzc2FnZSB3aXRoICJ3aHkiLg0K
PiAtIExpbmsgdG8gdjE6IGh0dHBzOi8vcGF0Y2gubXNnaWQubGluay8yMDI2MDEyMi1pM2NfcmVz
Y2FuLXYxLTEtMGMxNzA3MWUyMzJiQGVzdC50ZWNoDQo+IC0tLQ0KPiAgZHJpdmVycy9pM2MvbWFz
dGVyLmMgfCAyNCArKysrKysrKysrKysrKysrKysrKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAy
NCBpbnNlcnRpb25zKCspDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIuYyBi
L2RyaXZlcnMvaTNjL21hc3Rlci5jIGluZGV4IDgwZGRhMGU4NTU1OC4uZWRlYWU3NDkzYjNiIDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIuYw0KPiArKysgYi9kcml2ZXJzL2kzYy9t
YXN0ZXIuYw0KPiBAQCAtNzU4LDYgKzc1OCwyOSBAQCBzdGF0aWMgc3NpemVfdCBkZXZfbmFja19y
ZXRyeV9jb3VudF9zdG9yZShzdHJ1Y3QgZGV2aWNlICpkZXYsDQo+DQo+ICBzdGF0aWMgREVWSUNF
X0FUVFJfUlcoZGV2X25hY2tfcmV0cnlfY291bnQpOw0KPg0KPiArc3RhdGljIHNzaXplX3QgcmVz
Y2FuX3N0b3JlKHN0cnVjdCBkZXZpY2UgKmRldiwNCj4gKwkJCSAgICBzdHJ1Y3QgZGV2aWNlX2F0
dHJpYnV0ZSAqYXR0ciwNCj4gKwkJCSAgICBjb25zdCBjaGFyICpidWYsIHNpemVfdCBjb3VudCkN
Cj4gK3sNCj4gKwlzdHJ1Y3QgaTNjX21hc3Rlcl9jb250cm9sbGVyICptYXN0ZXIgPSBkZXZfdG9f
aTNjbWFzdGVyKGRldik7DQo+ICsJdW5zaWduZWQgbG9uZyB2YWw7DQo+ICsJaW50IHJldDsNCj4g
Kw0KPiArCXJldCA9IGtzdHJ0b3VsKGJ1ZiwgMCwgJnZhbCk7DQo+ICsJaWYgKHJldCkNCj4gKwkJ
cmV0dXJuIHJldDsNCj4gKw0KPiArCWlmICh2YWwpIHsNCj4gKwkJcmV0ID0gaTNjX21hc3Rlcl9k
b19kYWEobWFzdGVyKTsNCj4gKwkJaWYgKHJldCkNCj4gKwkJCXJldHVybiByZXQ7DQo+ICsJfQ0K
PiArDQo+ICsJcmV0dXJuIGNvdW50Ow0KPiArfQ0KPiArDQo+ICtzdGF0aWMgREVWSUNFX0FUVFJf
V08ocmVzY2FuKTsNCj4gKw0KPiAgc3RhdGljIHN0cnVjdCBhdHRyaWJ1dGUgKmkzY19tYXN0ZXJk
ZXZfYXR0cnNbXSA9IHsNCj4gIAkmZGV2X2F0dHJfbW9kZS5hdHRyLA0KPiAgCSZkZXZfYXR0cl9j
dXJyZW50X21hc3Rlci5hdHRyLA0KPiBAQCAtNzY5LDYgKzc5Miw3IEBAIHN0YXRpYyBzdHJ1Y3Qg
YXR0cmlidXRlICppM2NfbWFzdGVyZGV2X2F0dHJzW10gPSB7DQo+ICAJJmRldl9hdHRyX2R5bmFt
aWNfYWRkcmVzcy5hdHRyLA0KPiAgCSZkZXZfYXR0cl9oZHJjYXAuYXR0ciwNCj4gIAkmZGV2X2F0
dHJfaG90am9pbi5hdHRyLA0KPiArCSZkZXZfYXR0cl9yZXNjYW4uYXR0ciwNCj4gIAlOVUxMLA0K
PiAgfTsNCj4gIEFUVFJJQlVURV9HUk9VUFMoaTNjX21hc3RlcmRldik7DQo+DQo+IC0tLQ0KPiBi
YXNlLWNvbW1pdDogZTNiMzJkY2I5ZjIzZTNjMzkyN2VmM2VlYzZhNTg0MmE5ODhmYjU3NA0KPiBj
aGFuZ2UtaWQ6IDIwMjYwMTE2LWkzY19yZXNjYW4tNDkyMWQwYjQxYTAwDQo+DQo+IEJlc3QgcmVn
YXJkcywNCj4gLS0NCj4gRGF2aWQgTnlzdHLDtm0gPGRhdmlkLm55c3Ryb21AZXN0LnRlY2g+DQo+
DQo+DQo+IC0tDQo+IGxpbnV4LWkzYyBtYWlsaW5nIGxpc3QNCj4gbGludXgtaTNjQGxpc3RzLmlu
ZnJhZGVhZC5vcmcNCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1pM2MNCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtaTNjCg==
