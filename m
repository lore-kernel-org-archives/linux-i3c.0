Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D272606A883
	for <linux-i3c@archiver.kernel.org>; Wed, 18 Nov 2026 03:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dDS/zE5B;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=dxHvd2PH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FZKMyLwL9ErLuM4epBqOe+BrRCjCjSmI+idkmmWzUfQ=; b=dDS/zE5BUB3Ncuz+NkO6qyGUNT
	gB0feeK6llFcVQdEFzT5ONNKjhOZNyQWzGzPgG9FP2kza8hPj5LfNxo9o2Ohza0fmBojHTCizbyD8
	WxnEPpN8IKpa87nhoVtqbCK9sZAHtKr9KKn7G2PX4aZjkaswqT9UUq6cuwXfgk/xmHV4gqFcXeKDN
	UR1b+7jNs5HGjeUeclTMlIHYuN4s10qgnrD8vpaD4M62JLfsgJ7lQCsZUnXhQJSg8xcavGIo7rnOI
	3A+X2BzI27gi/5/220wYxTVkRAVL9N+y0ZL7Z4SMLD/rmgMU1B0QEZZiYKuo84sDEhWHi275h1R7b
	lYzez/+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTWK0-00000007dOH-0U5g;
	Wed, 18 Nov 2026 03:26:56 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTWJw-00000007dMd-1SYK;
	Wed, 18 Nov 2026 03:26:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P1CErrfSzclA1GA0AfU3U066GiPfGxO4JvtpAJojImU/o6+Yz8OCBpEEGBnSBClaolhWWtlVb7p1HsnsyqFzJe//ooAnFv3lyGK5U8lF53yNu2lpb1wfnqWME5iFotVEkfwRX1LIZMqOvmfgkc8ThcvfQRwY/1fHASu4CPcQ0ym1IMMWvjpyhv9w1icw/w+Mrcz0gXHH/mLp0AT9nx3iR7Yod9cRGCjMRuZh61pIMcQ0J1Qf67st8lMgsS5uwV5UVqykZyzhRXcs3xKJiv6tzZrRCUhog2eZhF2ifNtje+06o3UpnHM7p/5ARLfuByio7wJ/QDsPN+QljTAF+ZvP2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tPymqVUmTFuIWhkBVbk4nsDCJUO8vmN9WbimdVQ8XPE=;
 b=dHP0m56N0Vksq9/PD24oK3kyLIQ3s1l2CQzpDc5NajrsDXQ7DMc5Y8QWHKjLKRRB4ihiORwYVEl8QYUVW5U22dtVlWyYYGNdP+IdsbKUaN2NCKCKdj0SCkyreztFKpmAEUhUV9Jgg3jeGuIGcKqXfB0TD5SmxjB0yiMAhGXxe//LVZoYDKPlGgUDMh3Hz6KYOrXKYcxDR6bU5/ofCDR997Hi3PyDODot7bAIV4js65cQ88KUU3HfGrTQzP2Rv18G3DLzoT23+M2rS06CCCQBPwRSEWRBuf71i1u7aVXzvo4zbIIuKrarAYJLZhKBkdAdMK9iHO4DV6jm+t3f30ftFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tPymqVUmTFuIWhkBVbk4nsDCJUO8vmN9WbimdVQ8XPE=;
 b=dxHvd2PHkhAOI5FSrkvNT/NFLdlPJDdNlxV0uJT0fuO0g0yDp5/waOj1vdtGGQcE/nH17h94gjHyVaj+oSwv0iFA/A4ZCcPDIXOiKwYz5/i8DJkV5UpXMlk484qEbFsa3+ZICiH6IUYy2soB7oAnM3p2AkRq6gJchAvSW4Nz4rZzXSLuS7+99EAzaWboVuBSSYuQALcRkBCdk6bpU3akQ3wQvn4XYQtP1AmfX4+AzvDo59KL22IqK5x6zV5yRCn9S0aVQA07pdYbqCcvbv7FP3yqYSZrGrDlmUHSVGkimOfOtZd5a8+OKqNECwwuy6tNGN4QhIVIf5+aK2JNIbVMoA==
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com (2603:1096:604:29c::6)
 by TYNPR06MB8829.apcprd06.prod.outlook.com (2603:1096:405:3c7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.8; Wed, 18 Nov
 2026 03:26:43 +0000
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::92af:c9d9:8779:d19]) by OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::92af:c9d9:8779:d19%5]) with mapi id 15.21.0639.006; Wed, 18 Nov 2026
 03:26:43 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Frank Li <Frank.li@oss.nxp.com>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	<joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Philipp Zabel
	<p.zabel@pengutronix.de>, Miquel Raynal <miquel.raynal@bootlin.com>, Ryan
 Chen <ryan_chen@aspeedtech.com>, "tbevis@amazon.com" <tbevis@amazon.com>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: =?big5?B?pl7C0DogW1BBVENIIHYyIDEvOV0gZHQtYmluZGluZ3M6IGkzYzogRG9jdW1lbnQg?=
 =?big5?Q?generic_bus_timing_properties?=
Thread-Topic: [PATCH v2 1/9] dt-bindings: i3c: Document generic bus timing
 properties
Thread-Index: AQHdcYsQu2j3zyDLfEW7mmto+L8ne7cpFmUAgAoaI2s=
Date: Wed, 18 Nov 2026 03:26:43 +0000
Message-ID: <OSQPR06MB7252FD524944EAEC81F8C71F8B7A2@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: <20261111-b4-i3c-hci-ast2700-v2-0-4d8fff5c5196@aspeedtech.com>
 <20261111-b4-i3c-hci-ast2700-v2-1-4d8fff5c5196@aspeedtech.com>
 <avSczhZGS9cCcNSu@lizhi-Precision-Tower-5810>
In-Reply-To: <avSczhZGS9cCcNSu@lizhi-Precision-Tower-5810>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR06MB7252:EE_|TYNPR06MB8829:EE_
x-ms-office365-filtering-correlation-id: 130c06db-3935-4316-675c-08df4523c478
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|23010399003|38070700021|4143699003|5023799004|56012099006|261026140227099003|261026121527099003|10067099003|261022105027099003|261022075727099003|261028144727099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|3023799007;
x-microsoft-antispam-message-info: 65UDZZXvz2n+L5lQkk9EW3O8NNXIL+t9XvFkEhSCAXVQhvS6zUQihxNoy4Rdeyn95NTDHC4r70BtGAJRmYwHesF3YEOBVSR2K6CqMPdkS84/bePKteoWaV5ahWt8doEmgYsNg/32Uusz74gZOMCph9mszS795m01vCk+JZ30TIcAB9Co9AreXnA9hCQ9ND0Lddzvh3Mhf1CU+hQ3ApqwI1opAWm3EseQJQN438ie4Ev78mAeZcaO6HXA9i5ieKlv2+YTgai918lz7W7gteIWXJWMMidYY28yD7wJ+/LMu3jrV3WHfqNA5fQQbPxTdvtD0coUBrjE1hMlxL59kseyRhFBH2S+61g5etLXlDNKFx5VJQoAuE7j8NKX+AtQnTG8j+yOBdYPXu3NukULsylP3sAFP1W3Ylo0ae+BxIGKC9Ni3vvt6rzm6+NHIDKfh+vip7i2uXN9ECMwMR3Fl+vmNIIouqvI0wfi4BQG5urgM8HBi42RpJC/+/o/zcq305c3Z/fNYlpcJCa/8ZnKM4Q8BhoXLnyWveUqSX8uUFLQ05WnKhB387LV7gxXZvdQX8oYn6Zr6Vfko6E84awAGWk9VYH2TGGgHZGYMazBVJ3Chusf5mPhFgkSb4MFD2ybxi6FkvaslRvIqaB2reS7iHiJhXBbMzhV38Ne3tCMmHxj2XLoLE5QH1/rih//Nv0FXb/BLCFJgFmqyDudIHmU3gvvhHBJ8Q8aF42WnkUM/jXooCo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR06MB7252.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(23010399003)(38070700021)(4143699003)(5023799004)(56012099006)(261026140227099003)(261026121527099003)(10067099003)(261022105027099003)(261022075727099003)(261028144727099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?big5?B?cnVOeTVNaWduMnAzT0MyenBoNWRQSUZUNi85U0NJUDJUWTNzYThibG42SDFJbmRO?=
 =?big5?B?QmlHczJWUFR5SHhjTFVTNFpFRUhmbDYzNXd6YzNReFEwM21LSm5JNXBqZkVCYWpk?=
 =?big5?B?OGdob0RKWnJLaExYTkpOWW5TLzllcGZobSt2RFRaajBrNXlYRytqaUY2dURuWDEv?=
 =?big5?B?MkdtOWo0bEdUWmVhNlBXZ0RXbXk1WGE0REVFR0liYkFVemxVVEpRalQvdXczc2th?=
 =?big5?B?RWV1ajhIaDF3ZEhFTDEwbnQrdTNET1JkVzJRSU5mRDlZanQvTDM5bGV3MWlhSE1Q?=
 =?big5?B?eWhiemNsTmVMY05BM0RWRSt1VitxdmxlZEduK3pPNWROSDlCWGh1UUx4WWV4d0xq?=
 =?big5?B?NUhlbE8zaWVaRUtvemtnQ0hrRUR2amkydG1kcTZVcUpETmxtLzZocGp2ZXFwalli?=
 =?big5?B?VWRCaUNMVklEZUMrYUhDb1Rncld5OTEzWjlHVFpCanZ0N3V4eGxKVTJsSmUwcG0v?=
 =?big5?B?dTFmbGM1U0pKeUZ5SVNoQXc4d2NIRUhuQm9WTTRMcjBWVkhwNkkyMGdmZUFyWUda?=
 =?big5?B?T09rcDRtRklhVTg3bVpyM1hxbXhYNXA3b1ByamJqaVFkVzBrc1B2dEZWSFI1YStq?=
 =?big5?B?NCs1YUEyMXRtWk95QmpOSTN6eUdKTTNSeko2em14U3Z3T2tHenhiKzhzT3pHeFFr?=
 =?big5?B?MHordjMwbzMrUzJwNEZBSTU0S0pETTR4L0Y2bllmMDl2aXZObHpMVUMwMGFlb3JV?=
 =?big5?B?NWVKYlJNTkhGTW1qSStXTm5ydlNvVkM0S3pxa2tWZk1WbzlxMkhjWlBpa214R3g5?=
 =?big5?B?ZjNPQXg3dnhVNk1jcWxwcmxHTlo0SUxHaGk1dFlrdjRhbngwaDF4VFZFTFpIN0s1?=
 =?big5?B?V0s2ZFNSQXVFUkFtL0pRMFg1WnVLQXVFV1VOSG9hZWphbjRZNVNGL0VOS25KcVcr?=
 =?big5?B?Mjkrdk4wRXFlS1BUbUViZXI2Njhac0ZCdHJ0Tnp5V0dLNHNkeHQyQldDZVJSZ3My?=
 =?big5?B?U28wbk1ITC95b3Frb3pIY25aTUpjZHNKNGFMbXRKSmkxY1RLVXd3OWZROU9sTWEv?=
 =?big5?B?RzZpM01XcTlMeCtzL3FkTGVTTktJeFg4SFZrQlhRaVdESm01MGFzekhoOC9TVm5K?=
 =?big5?B?VjQwTG00KzhOWjRxRFcxYkdEdUlDQ1liZjNLa0hLU3p5V280ODQvL3V5Q2ltQUpQ?=
 =?big5?B?WTlrNVR2NmRJL1dUa29pUGN3VVgxdHhkRkZKUDkrVnI3R1lwNFpuUE4rWFVDRlVx?=
 =?big5?B?dkxXcW1mMmFaSTllMUZUYVgvVmtnZWFLVEhJMys3MGx3T3A0V28vOVV5eEpEczMr?=
 =?big5?B?YXp5ckdNUHRhNnhaeVAyaEFCZVhENHNDcFQ2Wmp6eTd1NXcrZm1Ib1dBTUNBMEpY?=
 =?big5?B?VHVxV2J1TXVWaE0rb0ZJVlhDYmt4WVp2NXZqY21YT3J5NkpYS0V6WkM4c2VKMDNI?=
 =?big5?B?UHM5UzFNb1oyS1VsREtaeXJHRkdzWVY3VlZVL2cvV21tRWNnaUpTUW9YMEI4OTF4?=
 =?big5?B?TnBaZHpWUVlianBTdUFIbEsrYkxMeWtoVFM2aDIxajhGNXhqeEVLUGxETXpHUmRP?=
 =?big5?B?Qk9PZ2x0M1RyQ3gyMmhoZndNVEpYaGFscHI2bzB3WkRNd01PODN0V2c5aXJjMDY2?=
 =?big5?B?ZGpxSmNHZ3EwVHhRU2U0UHd4ZHBCS1NnUjdPYVk2RTkzSlptZWIwcURjOWpkNlFr?=
 =?big5?B?UXFRSStOVms1RnVDMmFWKzViR2FwRzE1dWpZdGpvM2FlazVhMFZLNFA5cHNLd1RD?=
 =?big5?B?b04vYkhGbnY2VHR3bUhzYXFYUER6ZlR0dGtHT2R4cWNidkQ0cENlQzZ1RzBVNFJI?=
 =?big5?B?UTlYTTh5VlozYW5rRkUzWHplQ1YyMVk3UzhDTmFQRk84TC9JTUN4Q2RnSjBSZTY4?=
 =?big5?B?clVhQndyYXZsQ2hqcWlXcy81SHhsUGRRQllQa0JoVW5uMTMzdWhoR0lCR2dWUFZ2?=
 =?big5?B?aHNtaXh0a3hPanNMVEtOcDhNK2NEZ3ZieENSZEhWWWxuRlVIOE9GbENEalpGYXlQ?=
 =?big5?B?THBySlpEU09Gd1Z3NUxoTDQwT2p1SnUvY1QxL1diWHh6ZUYrV2JQRW1SYUtITy9q?=
 =?big5?B?VHlWSGFPK3FNS2lyT0ljV0VEM3oyWVRnQkJDNllUK1psU2s3emhMVFNWNW8zeTBN?=
 =?big5?B?a01zcFFpRDRnd3lXdVdQcklRRXVBcStnU1Q4UE90b2tJVzdWTEkxaURQWjBPMkRU?=
 =?big5?B?WGJCZ3kxUUFUbVpXR2N0ZnhaK0NVU1JEcTJvTGh4eWMrRTJlb3doQ0c1RDNrdEQv?=
 =?big5?B?MmxBOTlZeGJQdnJjMEFDUjhEamJCdz09?=
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSQPR06MB7252.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 130c06db-3935-4316-675c-08df4523c478
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2026 03:26:43.1531
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HulRUPDy15RumDWzQQuyBYcCGe0od3KaQ2vMP8+2dasYx8hF3nqgGZfHtyuQaQyUcc9vpdnzz2Sjb7GfbNeHFoSt8kh4LcDQXGuWv/GnYbY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYNPR06MB8829
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_192653_145522_BAA79C9C 
X-CRM114-Status: GOOD (  10.97  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> > +  i3c-pp-scl-high-period-ns:
> > +    description: |
>
> Needn't |

i3c-scl-hz and i2c-scl-hz above already use `description: |` with the
same blank-line-separated two-paragraph shape. Keeping this one plain
would make it inconsistent with the rest of the file. Did you want all
of them changed, or is this one special for some reason?

> Add
>
>    minimum:
>    maximum:
>
> to restrict validate rang.

Added minimum: 24 to i3c-pp-scl-high-period-ns and
i3c-pp-scl-low-period-ns (tHIGH/tLOW, MIPI I3C Basic Specification
v1.1.1 Table 87), and minimum: 200 to i3c-od-scl-low-period-ns
(tLOW_OD, Table 86).

i3c-od-scl-high-period-ns, i3c-pp-sda-hold-ns and
i3c-sr-p-scl-low-period-ns don't have a clean fixed value to add: the
spec doesn't give any of them a single constant minimum. I'd rather
leave those three alone than make one up.

> +dependencies:
> +  i3c-pp-scl-high-period-ns:
> +    - i3c-pp-scl-low-period-ns
> +  i3c-pp-scl-low-period-ns:
> +    - i3c-pp-scl-high-period-ns
> +  i3c-od-scl-high-period-ns:
> +    - i3c-od-scl-low-period-ns
> +  i3c-od-scl-low-period-ns:
> +    - i3c-od-scl-high-period-ns
>
> why need these dependencies? Suppose it should be default value if not
> existing.

tHIGH and tLOW together make up the SCL period for that timing mode.
Specifying only one leaves the override incomplete, since neither
value alone describes the resulting period or duty cycle. The
dependency keeps a half-specified pair out of a validated devicetree
rather than let it describe nothing meaningful.

Thanks

Billy Tsai
-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
