Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB7E606A33E
	for <linux-i3c@archiver.kernel.org>; Wed, 18 Nov 2026 03:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qJEQJZSm;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=opFlTzW5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QS4DBKyTCSjbKfjj2g7rPPH7ymiQXNN1gJVmbn6Rs88=; b=qJEQJZSmUiJq/TV/IPmv6KkbfZ
	2Rv/LdNU+WTFzy2F73B93NVI8ZfHq4GpUZDRDCeXHBgXCEZKd1gq4/KG/c3Q1We591uEd20o/MY6L
	qqu7Y7TtrzTo/rMmEg9RrnomY7NYhwnjcwo/DgcOHERi5vvmbSoONPwgTxRSk0JheFkAQwUNNzjO0
	cfDZNK/XT6IP+RA55pavJrVyfpHJKeV7gS4+SJPIdwzUeovuYPwsDkdXTIZqs92l23qNk0/wq1Cxv
	vXHuinwVxKkC6990h6r+l4YdF6QKFD+JupeI02zL1YNDW12Vn6nZp598Z74pOH/fEcgHHUtfwOoSl
	VzU1kDEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTWPL-00000007eCp-1zcM;
	Wed, 18 Nov 2026 03:32:27 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTWPJ-00000007eC8-2QcH;
	Wed, 18 Nov 2026 03:32:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w0EhD5qs4A951vAzJboe/zc8nKV6HrG+y4aS6nEBTwOh7yKjvC9QoROQ6LcYuEOADwQtMAi2EPhlAI44vvnHltzzh09UTaCZxs4HkDCrmvmWQZ4rUS6uPZQT6wZwGNjUKPH2ZIYG2+QlEvP9BTO3+J/PwYCaDLMXisbzweatUTZ9HGnZCxRFs7WmFEyjlKBU2S9eR6UHuelMCoPW4qPEAb8yz5hIwMZe4LiNZAY+EDye/71k7A6adJJYg5HPa/tNh+KpQNDpLOsp0C4qGHd0rfwN7rq8p4Pwk+jnKKBtRnrIwjjEzJMBLERE9gNXGiTq/R9AWtBq2ObdZZ1dUutgWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=awx/jlrCKfTcHpeyeG9prOlcTmrzWR7zJ064mfXIBDc=;
 b=dMBqakk8szwtXTkMR2Ewibjmg1ZhzlZALzjBgUXNDAWUUOZicBgfpyw9zo5A7B+1ZymMuWCiUVQGJJUWwbl2zsVWpPCVS375S1coT/OrUOeWb87leKoBb9RCWYflc1PiSRK4ncROB/t8pj1QQdNR6esXz/5tW9LMR8pYFdPp75VhWgRVwEDbCGfGC+D6GFHvHkQkZJaxUft3Uh5X28nlN3lFfGp+eXcFeBa1kQzU3p1rDNDca55MWudt/WnQxnfFZVD8JWknDXke89h6EByrkVYFKCqGEC1Qr5HkCEU+4ZHAFL9P4cd3JChWVeePyEWwnzH0UicWJA7IqOnN+E3/eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=awx/jlrCKfTcHpeyeG9prOlcTmrzWR7zJ064mfXIBDc=;
 b=opFlTzW5HJoN5ju50Hd3HJuOrQ5pPds1Rj3n5a3q/uWMqsBVhYtZDQ0QuoVYjR9b+bme2H0BVu6F0SCz7CaDzfBRUardM7m+ut3bmKLfUUt+bhUYAFOwRZjhGfA7MT0TKhC56im0Ojhf0Xn6KbnGTFO3nwr79KKNvo6+VGZRG82D5dVlxRMl1RCOO7CraiXOQcbPGKmNFMaIfIKiPQ9hgiA7jbFgn0oNiYX6eSJYUwh30fySKy+goQH2m/kqX66tlfLdsOmv+WmN1V1txPyrJK3f7bZ92Gh20mfKTfpBYTBjQqhcD6+30i8WDih2jnRwAIAlrUEMeaZuB9/DnA+YLg==
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com (2603:1096:604:29c::6)
 by OSNPR06MB9002.apcprd06.prod.outlook.com (2603:1096:604:49b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.8; Wed, 18 Nov
 2026 03:32:22 +0000
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::92af:c9d9:8779:d19]) by OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::92af:c9d9:8779:d19%5]) with mapi id 15.21.0639.006; Wed, 18 Nov 2026
 03:32:21 +0000
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
Subject: =?big5?B?pl7C0DogW1BBVENIIHYyIDcvOV0gaTNjOiBtaXBpLWkzYy1oY2k6IFByb2dyYW0g?=
 =?big5?Q?AST2700_IBI_termination_threshold?=
Thread-Topic: [PATCH v2 7/9] i3c: mipi-i3c-hci: Program AST2700 IBI
 termination threshold
Thread-Index: AQHdcYsUM/sgV1Aoakuu6XYDn3sxSLcpHvkAgAoXjYs=
Date: Wed, 18 Nov 2026 03:32:21 +0000
Message-ID: <OSQPR06MB72523D56B87D06FB5A5AF82A8B7A2@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: <20261111-b4-i3c-hci-ast2700-v2-0-4d8fff5c5196@aspeedtech.com>
 <20261111-b4-i3c-hci-ast2700-v2-7-4d8fff5c5196@aspeedtech.com>
 <avSkAIS82rYaLZvH@lizhi-Precision-Tower-5810>
In-Reply-To: <avSkAIS82rYaLZvH@lizhi-Precision-Tower-5810>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR06MB7252:EE_|OSNPR06MB9002:EE_
x-ms-office365-filtering-correlation-id: 7502c2dd-92ca-476f-7ab4-08df45248e4d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|7416014|366016|376014|1800799024|18002099003|22082099003|261009223027099003|56012099006|4143699003|261026140227099003|261028144727099003|10067099003|261026121527099003|261022105027099003|38070700021;
x-microsoft-antispam-message-info: w7EZJG9dq+e3szrQSPuNAADzEFYd/UDL61VN+ssND7oqSghaL5J30c+2P8DZQbzuVNZBvUfqlSyTb5TmU9FF7Js1CdBWo0NMSytx/JEv3GyvzwFD9jvr7b78ZV+P9bwNvRT/NYtM6XxxC3E/TaBN1xkgsKB6t81ph+nhYgFzsvjSmsZnYwLyfz+765Hzpzz1k3hbMF283JXxltzazgJtHnJnZmxOOLMacl5P+hzzryEhs1Wh7MWYanhpVIRkCJl8ZjTBlOeTRyYcpuUP0/tG0tyzlQ8TuaEaG4pjEosCh3OmwLU+ew7JuvUE/jfPnZQFKAGNr6//wGDc7R+XKMyy/BR/y2+tlHZfPmdB2IEt3W6WpdDV3D6jdSkRFu1U2CYZl8yC/FtmntAUpmIEGBJB/78yxsTm9TD46H8cuuGWMzJYIpAObj0ibsIFoRqZBKwYUmfdn3NhoQUR4EpKr3EPvJWTCWfILOlCz2dRROYOMB7wxYks1inGS9C1wNOzFB9FSeYpgQ6ARIJhqAbYyqRmQwcvZPymhQ9lYGSHipCYv8udwkTpdCGpXmU9hbvBQjYAXIh6LD7eBr0uHnlx/xXvznruWO5ou9BK5DQ7OsooHnUi6GwfCGxOnRyY4PNYS3n70nBXmzt/Kg1K9ideBJYBP0i2+AxmH5ZDFg02tIRjlzpJtveqanLMoqvHi4sKwL8y/93KKcmaoteSNgYYPoukvw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR06MB7252.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(366016)(376014)(1800799024)(18002099003)(22082099003)(261009223027099003)(56012099006)(4143699003)(261026140227099003)(261028144727099003)(10067099003)(261026121527099003)(261022105027099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?big5?B?ZEljSGZsa1k2OUdaamhpL3Y2bm02TkY3eSttN0xOTkVsaGdhRTg5MHcrVlh4RFlj?=
 =?big5?B?elRxblhmakFJYWdOVTdRSzM4bUxEa0FseGZ2ZEdpdFBMRjNwaVMyTExkOE9FdnRJ?=
 =?big5?B?czhnS2JwbkZJQXlrSmVja2IxZlg5R2Rhc1ZRcVJkdzhoTHp0YWtjUmlaeVBuQm5W?=
 =?big5?B?QVdWL1hUVnVWcnh4dmw0WjNOQ0xFbGsveFVSY1YxK2krbzZaMGpGNmtzQ1Z1OE54?=
 =?big5?B?U3g1bEovTlEwR0V2a2lhT0tTU0VRMUdrUE1hV01KTkJlWTFSNmY0THN1SmdBL0hU?=
 =?big5?B?S1g2M3FySTJFMGdneU1QaUNjeDdhbkxhNmowRm54R0d0OEdFWnpUZEZERDJPVDhX?=
 =?big5?B?WDMyYzFLSjRNSzV6c2JwVUhnd1JqZ1lqN05jYllpU2dRTkVUb0p5WjNFU05nT0hG?=
 =?big5?B?YUJRUTNyYldTS3l6dWxZMFl4Q3RiQkRYdm1yMjFuRjB4akZ5am9rTUtNc1MzZVlR?=
 =?big5?B?bW92MGcvYnNIYWpVbGYzQzJLcXZTWjVuK3ZoaHlxK1hDRzBSV05pSHdlNEFCVThj?=
 =?big5?B?S0tVMUhPMFhJVm1EdXJnZkhUcUp4dnBIcjhTdXRRejRjYTNHREo5dzBHNTZXaEtz?=
 =?big5?B?d1NVSE9FZUh3QXJ4dThEbDBEZHQ0eU1LRlJ4dGF3K3NqRjdBL05nN3pablJMM1li?=
 =?big5?B?YzRRM2p4T0xHUUNWSlBXOW8ycmlwckw3SmpJSTdMNTdlVEFFMzJqWGFXYnprcjVi?=
 =?big5?B?UDRqaHpEcENTNTFWRU5icExlNERuTSt2L0RpdzNsQkNBVktJa0NGR284N1JsK2tr?=
 =?big5?B?Z2E5dGxOMHdSWDFRcDJkT3duOGtUS0kwRWhZS21vSnlDcm1FUmlQZzVMTmZ1L2Er?=
 =?big5?B?Y1RhWnlUWlVFK1FScXRGMjlweDN4Ri9DY04yLzd5L3k0dFFCTGxQdWsrSGZja3Ey?=
 =?big5?B?ZE9BMzFXZnZqMklIWC9pRnRkS0h0UnJlbjh5TEdqYWFRVVJTa1g3dkl5TSszbGZD?=
 =?big5?B?c2VkZWlkK0VQNjBXOEh1TVc4OEJhbCsyRFV3SS9GSndBandYMDFaTzRJQVpYL3Fh?=
 =?big5?B?NHVGL2tHK1U5U1JSell2ai93dVVYeWtuaWdBMHlJenc0Nml2VE5wVTU2cVlOWEtH?=
 =?big5?B?Vzh5bGR6SHBsbEpKRTcvQjFqbWVLTjNXNUllQWhWQU41VFlDU1BIOWljQXNhRDRt?=
 =?big5?B?c0c2bEx1WTJxUW1IRFlvZ1puVE41NEc2MGhhMW9JWTJ1NGlzbVlyUVp6SHo3c2ho?=
 =?big5?B?TW9BKyttei9XOENxeUx5NVBzZVg5akcrWUpiTW03RXdldDFEaFJUaVdMcjRUM0xP?=
 =?big5?B?a1BDSjhpT1NKUktsU2FOcU5MdjBsMFptZkVKaEM0K1ora2tEK2dXYVhFbUhPY3di?=
 =?big5?B?Sng1OVE4TEpsU21LbzNNTDl0aFczdk0yNlFrREttbmJTVit2Q3l1VVZzQjBDZFBT?=
 =?big5?B?SXdab1FuNFYwSzNXa2x4ai9QdGxZSHdQdHQ0Z3hUekFab0xNeDJhSFpVOFYzRnVK?=
 =?big5?B?R1haZ0owcWh4YXp2R0pycGM5anBjTWZwWURWRlUzc3dFMEVTUno4N1FkcThDc1dn?=
 =?big5?B?UzV2c3RkR3ljVGhvaWZ0Yk4wejg4bWFQU2pGWEJVNHU1bGVnNmFkZnlOcE11ZzFp?=
 =?big5?B?cUxaYUVUdHV5N3hCaDVjUG5pUFJLdTdDR0xrSEU5SFVpdlpheXc1MDY4dGFLL3pI?=
 =?big5?B?THVBTEJOQ21BSUU0aWREY0NRU01jS1ZybjllM2pEamd5clBoQWp6VGFTRk1SWlhK?=
 =?big5?B?K09ReHMyRFFBbEhnemNsRW01ei84L1BldGNseVJnaGsxUEw4YUcwYTlxZ2R4MHJ0?=
 =?big5?B?a21HOVFPK3VSZ3NTRE1pOEpmenQzNUc1THJyRy9zQ0JsdkF1bFlHYXNncjFyZXhl?=
 =?big5?B?dnN4T0tQQWpUMytma2FpVWlaa01neEUyU1VmakFLT3FoZmoxdURrUW1KZFRxek1M?=
 =?big5?B?dWdlWjRqVWVBVVdSMHV2Z1E4WHFweSttSG9QaVZCOENDUW9TS2RxYlNvcXZCRG5y?=
 =?big5?B?b3c3cVdSUDRLTURhdkI0eUZqSml5RGdGTFpWYmdibmZ0Mk5GcHA1TWhKVTlIZDF6?=
 =?big5?B?Qk9EbE5aL3N1TXJuUjBGQnU0V2RRUFRUclM3R1ljQXBLdHlyRGZKMkd4VDZ5VmRM?=
 =?big5?B?eld6ZHZMSU5zS2pmYjEybU83RGZZaStrZG5pUGhkOC9HVEhkTEtRdVJiKzhnT3Fz?=
 =?big5?B?V1FFN004RDlJeS91eW5pdG9GYjdjdlArd1dWZm5KNDVuMWlZaU1hL1BwQk5mM0dm?=
 =?big5?B?bVpCSTQvZWNFODlUN09JSXFKOVpTQT09?=
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSQPR06MB7252.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7502c2dd-92ca-476f-7ab4-08df45248e4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2026 03:32:21.8364
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WQ4qLPgTOh+NmKt4bzJw8lHN5K7gDUGc8boWr7S6gIb7UJ1FPdmp2ADQLEiicNd9COheaqQzEUouO14CT1yYyGqucLPz+uTr4v/tbB5ILzw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSNPR06MB9002
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_193225_624810_F231D0CC 
X-CRM114-Status: UNSURE (   8.73  )
X-CRM114-Notice: Please train this message.
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

> what's happen if device A have payload 4 bytes and device B have payload
> 8 bytes, you set payload thld to 8. if device A raise IBI, what's happen
> if device have not sent out earily termniate?

Device A is still protected, just at a coarser granularity.

ASPEED_I3C_MST_MRL's termination length is one controller-wide
register, not a per-device limit, and aspeed_i3c_ibi_grow_threshold()
only ever grows it, never shrinks it back down. Once device B
registers for up to 8 bytes, every device sharing the bus is capped at
8.

A well-behaved device A terminating its own 4-byte payload never
reaches that threshold. A misbehaving one is still forced to stop,
just at 8 bytes instead of its own 4: the threshold backstops an
unbounded payload IBI, it doesn't enforce each device's own length.

Thanks

Billy Tsai
-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
