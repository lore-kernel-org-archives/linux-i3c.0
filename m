Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1361C02182
	for <linux-i3c@archiver.kernel.org>; Thu, 23 Jan 2025 10:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tvQwyPBMqYbtSSW/EcB1tyeAvrPlmOl7hHcA6cBfMnA=; b=Fk/kTjXNVzvi0f
	jJpMNsCGV30yHxLYInfPTr2UT5zv/NfjUIsQFAePWVDv7SXRX39QWLOoAD112b5e35lDDjFHVa9S6
	32ko59FhgDJURtrzKuamcWCjj4Cqbf1b+TP6rI8WzdgBXQr8TX34hlUlvuTcisSntxZIlQC6JQGis
	KbNNalZIJP3YmKtyJEJ1ybjF26rCTH9O39YecRmyjxcYLEoGY6yzXLM+x1P98fx35eCE3Yc3d8YO2
	jimarNdt/FejbHyRzgD8yjccNe9XO3fXk/YrlxnshBOHyEqVopdrxtTpgDg/Rwp7fg3HlI+Kuvmop
	y0fbGYCnS7RsYV79pYNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tauTY-0000000CDR0-2sFa;
	Thu, 23 Jan 2025 10:30:16 +0000
Received: from mail-tyzapc01on2070b.outbound.protection.outlook.com ([2a01:111:f403:2011::70b] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tauNP-0000000CBwi-0ylP
	for linux-i3c@lists.infradead.org;
	Thu, 23 Jan 2025 10:23:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A8lfWLQOfOs/v0+o+/hdsV56i0ooxbDjoK4fP2c02PHulYfpc2LhsYrP6S1hSX2f3ykw1tYdY53Q4kbx2w6rrd8X7qf/z4h9REpBZbT62OMYusd+jnHp2g+YpG4w2MYNrwx0tBJ20m1xHUsCBT5kWoganOHVIUo+A9lHgTxPv7RsQpKMX1UXOiJ1/7p99upMZpd+btnTD0AYShBi/MFHPFQaqdw8TeTWpPIMTtjL8foFA5i7KmGzNLB7WSBl0NeHxZ55B0FKykZ044GGnVa68h16Nxi5zAdli/ZtOm39kwVHrjTpo/jaBRg1vKNcFezmDdRolVl+qzwXnPh5JfRv9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bkb6ou3RNKnR0A42IEFiD6yxddcmhasxyEP9r7kRSGU=;
 b=WHOTvzx46w9cj+WjeH6QyWhVhaBdNmsiMUPNDdnNNYHKcWq06SKPv+jxNq7yjYCC3kvLmtbJhJO/9asEu5bsCyrH2hrgUY6J4e812lk+iZh/VsPxBBum0zjeqN8wM3Y/9wlISaP2QKLKS9zTvzIwLFdaC4IN958VOQ98j8XCcYuOPNaVm4yM5tRa5IW4K4zYU9rIuG8lXyHYIfxIsgYFNqoUqVlh2svIhlP6kx27ZSwUh7gZSEftkYkGV0UjvUzir0gLV5zdsKU8LpbFzcEH243vKTem8tqQka5o6LDsHfE2AjFfnlWV4zEvrZCEK7AMv41yDb1jfMg//jA5vYxnUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bkb6ou3RNKnR0A42IEFiD6yxddcmhasxyEP9r7kRSGU=;
 b=ewlhf1CuL4kJg/5Gx5236aDtypaEqrxjeVBFbW2vGMw6m+3pIObVjqyz497qUcszrxNlIlW3BGTNNFA0Rz9N4nZ1tS2UIME7EBxd7FviNq9H72qoCquAjynhC8o/UiwxAUY68er8ai3xrHFJVRyLFBWkgLIZa8vUpOzvXtHR3Z6KUeb3KoGvMymMRdLEtn6yXxnnmogA8wCQJydSRwxK430HBmGO3cmNuexEJN0rTz02u4jmrHASA+UL/bVL/s72zhfUG8B6RNeodf5HiV+v3BtEJutWt3Qp2zro7r6tF9dOdrhxqiRlgB68lyLmDGT10yn4deiWs95hnor7e7PvGg==
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com (2603:1096:604:29c::6)
 by TYZPR06MB6354.apcprd06.prod.outlook.com (2603:1096:400:41e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.13; Thu, 23 Jan
 2025 10:23:32 +0000
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::814e:819a:7d52:7448]) by OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::814e:819a:7d52:7448%6]) with mapi id 15.20.8377.009; Thu, 23 Jan 2025
 10:23:31 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
CC: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"pgaj@cadence.com" <pgaj@cadence.com>, "miquel.raynal@bootlin.com"
	<miquel.raynal@bootlin.com>, "conor.culhane@silvaco.com"
	<conor.culhane@silvaco.com>, "aniketmaurya@google.com"
	<aniketmaurya@google.com>, "Shyam-sundar.S-k@amd.com"
	<Shyam-sundar.S-k@amd.com>, "jarkko.nikula@linux.intel.com"
	<jarkko.nikula@linux.intel.com>, "xiaopei01@kylinos.cn"
	<xiaopei01@kylinos.cn>, "Guruvendra.Punugupati@amd.com"
	<Guruvendra.Punugupati@amd.com>, "linux-i3c@lists.infradead.org"
	<linux-i3c@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 2/2] i3c: mipi-i3c-hci: Use DMA-safe buffer for I2C
 transfers
Thread-Topic: [PATCH v1 2/2] i3c: mipi-i3c-hci: Use DMA-safe buffer for I2C
 transfers
Thread-Index: AQHba/S9FgV443uP6EiHG9tyXeFjFLMhzSYAgAJcIyc=
Date: Thu, 23 Jan 2025 10:23:31 +0000
Message-ID: <OSQPR06MB7252F57032DB4EC7DFC8DFD88BE02@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: <20250121110756.214714-1-billy_tsai@aspeedtech.com>
 <20250121110756.214714-2-billy_tsai@aspeedtech.com>
 <Z5AdbhSetlHIqAEN@ninjato>
In-Reply-To: <Z5AdbhSetlHIqAEN@ninjato>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR06MB7252:EE_|TYZPR06MB6354:EE_
x-ms-office365-filtering-correlation-id: e2069eae-88f4-4d4b-70f1-08dd3b97fc84
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?G7iC5w187y2+xyIhKchnTPXtCq/0k1caMSAm0TokR0XXHOaEEH/G8IbCMx?=
 =?iso-8859-1?Q?04bmi7Eb2WSCAsmsBxlSLp/ODQdZQNQsLvuFZ9ZymT+jDMgQAZ37ss35a6?=
 =?iso-8859-1?Q?pfj3a1KSEsivQRyK7ypfidi3Ab4Flt1RnU31PE0GaRGZ/T10J3606Ft7iZ?=
 =?iso-8859-1?Q?rjnnQuEDUK0T8t69drt8N716P2RMaFW2WuE/6XEzYsLU+wuaRGTO7n7nlD?=
 =?iso-8859-1?Q?OnBwgVuM5owPfCgjC+hlRHbaAB1T1WeSpMePWsWZ7xGCYsU5/UDczXsj6h?=
 =?iso-8859-1?Q?apLldHNUY9v2N6SIHvL9c/lVGJh70SCbYBsTM65ocjrtWY9qc4s2ENQg/c?=
 =?iso-8859-1?Q?iRTfs3+GgRtYHEw5SEvc46lOxnmYbzBFYzDFRTDa8qSNsxwhfQfcEaTRtq?=
 =?iso-8859-1?Q?zVtU2ggwNrQHq29Z+lrh/zsyT+X72yel8GiA/+6NLTBiSCTUPm90RQsJuF?=
 =?iso-8859-1?Q?fUZXLCSXEN5xWWoZ2K0lZ80Wk25ZJCKFRnI+KiLSdzEtRCb+i/Dwe2dX9r?=
 =?iso-8859-1?Q?a/1ASLA4tt1tL5EbsLXM7KJRxCpE/fNU4faT4F8F04FboNUg5U0PjebdkP?=
 =?iso-8859-1?Q?VjLhEunPXW8UjlZg1cs7Gn1OMm7ap0wYCU7a42FQd9Fr12xPAooFq36LNn?=
 =?iso-8859-1?Q?/kL0BEiJK6wWgRyhaTWh54hE4NXWjFqQJUWkuK852kqtILgJ7jR06+WON3?=
 =?iso-8859-1?Q?T5o3Lg/fB9endN3kRDeicw3PQxBbzc2FBBl6WeJlVx1swkMP76C01TsGK/?=
 =?iso-8859-1?Q?Knkan7JJbhZuQRoevM6VAR1ekrBWhizSyrb1xXd3YJEm369BIkRrok/bzM?=
 =?iso-8859-1?Q?nRczn7ZQ58jhrRXibTFYZl++zX+XRIIBSHXyxbLEfkuosdylM/U27OkHd8?=
 =?iso-8859-1?Q?E/GFR7FsS0rjypsY3y1fHKQQ/ETRqToKKmEqipm/gRsyzHGYBwUX9+kODx?=
 =?iso-8859-1?Q?DYv+lhNyK8cNzmGM3/pzbkdlibOks2Dy0jUbByJXWdlYMtnZZDS1iPSX/d?=
 =?iso-8859-1?Q?kr/aDRJVNtNNfV43vjvXnv7sCzzOjLDYPgRNt0LdQhauDY/XoaZpRBS6hC?=
 =?iso-8859-1?Q?v0fv4Tro4AIVqEkXSSOGsCFo+qO5OyTZQvnqzmSYvN66DcxNfrhG7ZzBVj?=
 =?iso-8859-1?Q?RcvaMdURGM+buL0WjKzLYAjFuW8S5ZFqTfd7wz3YIB06jENSH07vQETVmn?=
 =?iso-8859-1?Q?GFkLfOogFgvIHib+bgDNeLAvO0fDqPwWMUJULtaZFTnEYRhnWivyIb3jwY?=
 =?iso-8859-1?Q?SJLCME4/pbrJCSGUXAT92wru190oF64bSQqCHuKByfL9tczLNygIW/EIoR?=
 =?iso-8859-1?Q?rbxTCG8wyCm/Jrfx1kIHvW49sjfy0JCNxjrsbxd3b6bMTRJvkE/g015phK?=
 =?iso-8859-1?Q?NgqdlgwKh0lA02uGRISdxfKcAnyijGVxnW3pjJq2xJLCcSjrdeijGJvpOy?=
 =?iso-8859-1?Q?OLbjHfM1Ycspz51qmoe7kNv7pr1OvFbZ1ije139/yfdv3BIYIZmwceGDXN?=
 =?iso-8859-1?Q?pYV89vqBOIO/zTLJcL+SQL?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR06MB7252.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?qT2vyMSFYRsyK3Y6FQl50ymDpfsPqzApGLlGwUnwxPHuwbkhgtwOD9jJfM?=
 =?iso-8859-1?Q?eBz/lYXwYw7VizE6JfCWoXUTOu76WhwRg0FZ4JNgLB9wWzLyKFWNw/hJFF?=
 =?iso-8859-1?Q?TYtcG+M9L932MEXF5JF/Kh5ntXZXzhXtDZFNAx7fqu88h9vG1bkMTk2PVb?=
 =?iso-8859-1?Q?hDtdwBR1Y4qmyUrOexyUw+hBlD1xkMFkH3cjQTqhKba1dffV1zgga1dXUE?=
 =?iso-8859-1?Q?ogJiqqrBOG1g6f6fPBzUvFvmRrDOp6mnOC/KDMnv6gAo8atDUxwWbi6ZyO?=
 =?iso-8859-1?Q?CQ2MubUPaJWkjDLZRg6Q8Ff/PTYO+Ja+UMa9X3HQAbSSaMsqLj+KIqBs0n?=
 =?iso-8859-1?Q?xNbQfAPk9bEc+dTmBxHqYCrbAo65GLfmsFUwUsG9/fij7JkFEVn+vRWwNZ?=
 =?iso-8859-1?Q?aBh/SjmUwrBO6Sh4ZOOBpBIXGU9Kbt4Mwa8bPglU5C4LKd6yFKn4UmWCQ/?=
 =?iso-8859-1?Q?uNwYkW8auRAXHCPDlklFuUo6B2LPARHrYHPPbrPv6FH4572IEgJWxE80KH?=
 =?iso-8859-1?Q?KPrpBoHjKwAv2Ao3397ecg0nJANDlTkFFQjG+CcHQ/hszHwamhhnQ8W4dV?=
 =?iso-8859-1?Q?mlePVq6WFEioL/I+wEnkpCrva5ucP631wWVgfkJDmFHnr5bCgIpEDqzKur?=
 =?iso-8859-1?Q?i9iwxHulkMGGy9E7jOuXmpvexazK+ybtfsdZvM7CeuosCrkOjPKtjDUxEN?=
 =?iso-8859-1?Q?4Wi0A9yx0253bufw0wH0cHd2fka1A9mmVobD43wlZYkVdbg9zbXC4db46+?=
 =?iso-8859-1?Q?MnM70hwsrZSnSPbpiMhKs8Foys90ZSlj7WXVUKST+v5pCTGPnVV8OMRktL?=
 =?iso-8859-1?Q?M6m16TjdzWysfqUGp390GD0feC63iSBj/Oh9AG/kk1lDNrlZSjRDgl2qRT?=
 =?iso-8859-1?Q?GwpRQcGWe4USBpDM+q7/NGYs9nZ2710SjfpDcZ6frLJ7AtKsKEDDjGFnxo?=
 =?iso-8859-1?Q?0XmWwrz1opkzzlZ2ivHDYClmDDq3RULPusBgvh+ZcLDEscr9U4uwcwKfkP?=
 =?iso-8859-1?Q?l/yX7Fb7zm1KR+gYuFtetch7W+4FGB1s3/NqEiZccgMPEDNpIBKvti+8Vv?=
 =?iso-8859-1?Q?j44H8cvu0VwNyPpQihNDqFhGQ/c0D46uR2Ikq26ocDG8/elUsy+vRG7gkK?=
 =?iso-8859-1?Q?w2TRfi4pmoMD4xKI1GLQl4IJaaSy4qIwITztpQVJDOl1lm1WeueTJSzvua?=
 =?iso-8859-1?Q?+zt4aLNEse0xmpLFrXch+5dzYIumIlTWGUTvywxfxOt2z6q4fViohouLXj?=
 =?iso-8859-1?Q?c0Roxe3Awk+ehRf2Ci6ptgQy1wTEhjkfBKbWRsDwI9U3oxvfRwdyQbtw2J?=
 =?iso-8859-1?Q?+Rg0ygZr+MrIM899mFDy7Ccgwof30L4m52/bKTxWTvoeT6dP6TStF1Oovr?=
 =?iso-8859-1?Q?zRbGYixy9NJACrmnLGxZY/SilFvrEFGVCMPM6FiUrgSJTj7BE/aP1XocUl?=
 =?iso-8859-1?Q?0DvgZRRV7J5sO4QKBqE2+nsyIEmNk1Yqb9Gmq/TBBh9YqF6je4sMgPMje0?=
 =?iso-8859-1?Q?HbA/q5ZK4ku6e55iXrSvKt8RDp401tqEdceTGigqrl0UCDmfhjn+jjqHoB?=
 =?iso-8859-1?Q?bXy934+ZhkIk4vw69jgzq124YXaE1JvrW88s+mcxM/u5DocgS9oH3xa5n4?=
 =?iso-8859-1?Q?XXaecJaYZFPd9JxwvHXR618sln0fHrbeE1?=
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSQPR06MB7252.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2069eae-88f4-4d4b-70f1-08dd3b97fc84
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2025 10:23:31.8545
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: shebez7YC9E/YWT4GwYQpt+wpkdNcO10nUHPC5gIOtNnlE+tRa9fsvnOOapIbpFPuwEJC64MyJLWlUs+fW72U+LQOZj1DQQ6QLKP7f08f7g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_022357_189862_0E53E83C 
X-CRM114-Status: UNSURE (   5.61  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 xfer[i].data =3D i2c_xfers[i].buf;

> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 xfer[i].data =3D i2c_get_dma_safe=
_msg_buf(&i2c_xfers[i], 1);

> Where is a 'get' there also should be a 'put'.

Thanks.
I will add the i2c_put_dma_safe_msg_buf in the next version.

Billy Tsai




-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
