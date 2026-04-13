Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B6AE9380B
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Apr 2026 03:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QoIS3ErnPESxW1yaYiv6+ejQUGRJFTZMh3V0smamWZ4=; b=FxUldyHha8Y9gH
	gvR0jH1nj37z9c0eQ5v+YWKkd0n5uRMPn1hv7J4amaNfotRQDvIKd+fG6+RLgV+xIRQ5JJFPZ5Ktf
	e7SHymvcmyj6fkDXRn2Iur31R6uWgbQpGQ4FIsVG+3XONsOJbGcGWLNlzTZVfcMj8stBTNu2CHvBu
	VEdiOJz6qbYREbW2i3PZ2Shtkn+mpslz5TaAOuBECKq40NhuhRCQKVrpJeU9wn4s74LUyaakwIRJD
	Kl+Am8cP8gHRBz0MSAEvpkUJnlMIiZElC8rEJSt0p22SQwCHjtl5IIwL7lbMF6qXL0wzFx7XwWka+
	Opt1IF93sFzD7NdInu4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC7X9-0000000Euvp-2xId;
	Mon, 13 Apr 2026 03:00:19 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC7X6-0000000Euuy-0hhK
	for linux-i3c@lists.infradead.org;
	Mon, 13 Apr 2026 03:00:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TkGZ4U8vrzjnF/1gMuJkhZcf8bV8wZEtmz4OoeFH14TGJn2yRCu+ZK821NzJLTcF6WyMnEdkEMSYxFl/De9GYtoIzMEUZ+BecgrpxlYcOn3N/rjrI6DpvLIBXYHfJblfY10ERzFIKb47i8gm9KjFFSGK19gX6OHu9cFqUSsvBotMYjNntY6gjqw88VHnIajYovPOJqgeq5Er0cRJO0mRm3nfQfvqhr/m6c7Bo1Y6jl9IU0HDdCcLZhwbDK42az1LIkZbs7Vf+bZFvRVmiFQ42c5TZuDbnIfMib3IYZOPPjQpD9qL0CSpm7tFhFdaxuV7Z9W1sAsHEMHR9RUMKWx2Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MyXj22PlYzk8IYZuHp23tqUpOCx9frygwohGCF5Io8U=;
 b=aq5EzSOfq4x3IGgMWL84/BR1RZs8l3GoC8XVYfnUU2MhR2884Y0JAIQG0ZX1QCV7NCC9QhwBD3bevhdzzxkhPVRGiwkkwG9HzPEmsCV1dfbmipIS2WfJmRuZT7lTJ6YXyD4sDzkm4vcfmojQ/ACw9fOsTi+JLu+UbjuacqaEPBrUM2gW0gwKahqs/3b6+DYseuVjbu1CbsfV4hniwYbuSn5TBMve9wOFQsnnVET0kkG30wAYGxhDRKQkn1o3/u/LzJ+shvgbKdO40H3wPKY3OZsQumztZmZmIQ1F6F4E5FCAbGk1COlCgebURdttYaBeecMp4+vLTzBkNxFZaQPavg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MyXj22PlYzk8IYZuHp23tqUpOCx9frygwohGCF5Io8U=;
 b=LIurL4D3SgAyh10DNfCT9r//pia6SQs0rQGgkaZi1FJmy1wrGd6ciU/A0g3D8uHjeXNURqRY9BXWc5YsRrL4Uh1cfzHmA0Q40B4vaOAxJNuYBzbrUyBNBimLrKvoo76XfZ/b0PsllG23Y/9Z2tx+YcN3nn7FSzieY+0eRAE3L0NefL+TCsyGcycPpd0tt7oAi5MAaY/HyIpcSoOc1Z93pcQT5cnCefh7WzNd7Ot1lfDu0EpgtlcNyDYc//Zbyi0+YgE2KPd5TyJR6l3zh9N4bCtq33GzMoT2CNOI39aSifios3t0sAHtIGkN4iIer45GIzrf/HJ0nvLa3M69nnSL8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI2PR04MB10569.eurprd04.prod.outlook.com (2603:10a6:800:273::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 03:00:10 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 03:00:10 +0000
Date: Sun, 12 Apr 2026 23:00:02 -0400
From: Frank Li <Frank.li@nxp.com>
To: Stanley Chu <stanley.chuys@gmail.com>
Cc: miquel.raynal@bootlin.com, alexandre.belloni@bootlin.com,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	tomer.maimon@nuvoton.com, kwliu@nuvoton.com, yschu@nuvoton.com
Subject: Re: [PATCH v1 1/2] i3c: master: svc: Fix missed IBI after false
 SLVSTART on NPCM845
Message-ID: <adxcMiW7HWr4KutC@lizhi-Precision-Tower-5810>
References: <20260413005040.1211107-1-yschu@nuvoton.com>
 <20260413005040.1211107-2-yschu@nuvoton.com>
 <adxD10wsP7hJdR9y@lizhi-Precision-Tower-5810>
 <CAPwEoQPsp6mEqHaztnjKvh9qd49H7jKbq0EGBBR_fa70e-iR=g@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CAPwEoQPsp6mEqHaztnjKvh9qd49H7jKbq0EGBBR_fa70e-iR=g@mail.gmail.com>
X-ClientProxiedBy: BY1P220CA0026.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::17) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI2PR04MB10569:EE_
X-MS-Office365-Filtering-Correlation-Id: ce19aa75-2043-4c99-52e5-08de9908c691
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|19092799006|56012099003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: S4BTUih+mdfXNRrTp3da4Ng3JNDrNg+Ey7wrcEtMyrkIHZDEVGGVM5jyj09OHqJjISOyD0caraCysj5pa6E9UBY8XV0E7+j/fEwc/d4Puyyab5i+TUbv+z0ssuruMg1QvbADmNL1VTONRMsXxBrl/ggSWN7acMDKND64M+psbiq0U60NHHBx5RuO0DtOhotLwS4rpByKE5u8RR3Ci/wGrU8gx+wVqZ//ImUP/D2KsmMpDhhk02ScJ9qz3YAV1dtpwwAoYqgREgHr2zfa9Trbs11mvYIOvoQqZS1oZDVCde9kOsSaZCdv4rP9UN0MymdyqDFIhsr5tyL3VgkjyPrDZKLivf7+XI2mL80/S3gpbPiVbqFf4XMKGBnfULV0yV6VXoLtBHtJl1rioJdZaUZ4/vJ8RoUoKtNtpDu8U8ueQN/CWi1e9nqG1W0BZ/pV0VG6hGsmZh8XoPQUP093h38by1YMFGMkdHVZE//kZCmRf6Ejowk+LOYp9Aft448RiMk+DZZG0Ww3c0nq1I5tP1ITQHc+lpNgj6tLqfTN0mx+q87SCJHbzixMLdiUxnBuMqIN+0FY+Y7tN2S4k8Z4a6r1eIG2XU2o83nK7h+zVUc3gDR9xctdlBSXMKGKq+eQM91pCWC8/8qGqK2NEE5JoUOD9Hboan8MJ2w9wy5cWFfXaS3MRyhtrcizfwzUero2FGZSuQ60YXyBh+Q1r0tkR5ydXhsfbkxoEHXQPGxwaA7NxaxxZcSCl66H+WSje8B9bvGigV52bb1eLyRUca1CTbUzxvG/7V1BCVnn6PIYVf4z3Ew=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(19092799006)(56012099003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkV2NUMvZGNhYkN0NFVxKzJKN1haeEQ5Yjhra0Zod21uN2xGUWlWaFVTOEh5?=
 =?utf-8?B?UmFVd1R3YTRIbUZRc1ZJOXd6NGd4TEhQNDQrOHBmYmZrdVBJZzZaK2NMeDVB?=
 =?utf-8?B?OEZ3VU5QdTN5bFYwWEFIMlp0OUFaZVZuY0g3N1NHNWxaTUdYL0RBeFQrRnFk?=
 =?utf-8?B?dHRjMzAyVXloSUVWV0t3bWlNYTRtZEthQ2ZjWnFSWW0yYTQvWG1hdkR1am5x?=
 =?utf-8?B?cWs1cit6bEc0OEduZkNtSFhrT01ESkFXeUVBZmU1NUNsc3IvTVVVNUMvSGww?=
 =?utf-8?B?WTZUK2djUHl4ZmVnNVBPYWczVERpTEw5aHFjd0tFVGgyaG11MmowQXJUVUgy?=
 =?utf-8?B?cENqMlBLS0Npa0ZSRTZPUGlob2drQ28vQ2cyUEQvaFpjaUdqVmVFM3JPZ3ZH?=
 =?utf-8?B?dUVIdU0xRjJYSGZ2R0Y3TnBrNlNxejRzWDdIR2c5ZGZ0bkFnOEJwUEZCOGdY?=
 =?utf-8?B?b3VjVTlmMkhRdXcxblBYdHRMVlNuektuQ0ZUeUg0RVFrdlh1c0xTbEdMTGZr?=
 =?utf-8?B?M096NlVHNGFHQjZJVGs1cFVqTEs4RTdRbHBLUGRTSGhPNXdNcHI2bm1GaXEz?=
 =?utf-8?B?N1hROGd6aXloanQrVk44bnArQm1rT2RXS015TjNpaEdrRTRjelFKNWZYcEMz?=
 =?utf-8?B?SWdjTlFNRW8rbm83ZEhiZjgrbHdPTmFtRjB6aHRlTGs4NWxjQUZaWnNGVlVj?=
 =?utf-8?B?WUp4MHYyS1BXSDZWMERzUmdUb2lORGhZY3hET2RpeFIwM3ZjdU5XQ2MxMjdj?=
 =?utf-8?B?aTNTdTMxZVJqdUY0WE1qVmpBR2RSaVU5REYvbE1iT2RsK3N1czJNQ0h6ZSto?=
 =?utf-8?B?emJGVnNobUpvZ3lhWlVINE5MenEzMlZ0UnFCaG54bGhML2Y5ekt4RGR6UGl6?=
 =?utf-8?B?ZTRuSGlZd0hFTnRNWTcwTUJ5Ymd3RlZYeDhBUlNWZE1ibG55UjhEUlJpWUd4?=
 =?utf-8?B?eWZIVk1GaHh4NmVyVEFwZkdmZzY1akUwR25ZQ1VTaVpQTEhCNCs5eW1nQ28y?=
 =?utf-8?B?SncvZjBvSDFvejQwcW01L1pMcVNEbkRrR2lEZE1LY3VUQ1JNekprZXFobW5F?=
 =?utf-8?B?M3V5b1BlMlVoclh5eWVpVGE0N3NZQ1JySUx3MDRtUVdqbXNoZnd0ZUdkZnNl?=
 =?utf-8?B?akh2SWhnUnpWWkp2eERTc2lMTzBTUmtiSW44c2k3MmZEeUExbUZpMVhJNDhw?=
 =?utf-8?B?YUhmM2gwTEJxaDVYbHB1aFFPd1pEb2FOKy8vb3FLWmE1UnhrK1JmelA2RGlL?=
 =?utf-8?B?MjJqbStzQnViYmpKSlAxYy9Yb1VmZmZGMmcvcFNWbys4cGkvM1pReXN1ckFn?=
 =?utf-8?B?SWFGMVFHL3lFWGkvV2RPZ1BVbCtncjBYdjJnQ1NWYUFrWmdPcGJTdXIyOGFU?=
 =?utf-8?B?azdaZDBWMW4yTEl3MUtqaWFEcGRFQnpmbmRoZDJpSUI2RUpibjQ0WGU4Y1pZ?=
 =?utf-8?B?TzlnM3lzRHhhZ1hIdHVmZHVhZE10MEJLajdPMzdnRHRXWE11RXRCUWVoMGRI?=
 =?utf-8?B?U1BhRmlyY1BYclZVRnJpTGZLNlRtdU1SNTJwdlRHWEpydW16Y1dIL3NzVEt4?=
 =?utf-8?B?OFU2L0FwY0Z6Y1M1ZkxEdFRHQm1QSE5ZQWpXbmpKa2FXWFNNNmZON2JiTkJy?=
 =?utf-8?B?ZkVVODJtRi9NeTVwcTNZcmRzUE9nL1FVS1R1NG1mTk1IUGllU1F1ZUtYYVpa?=
 =?utf-8?B?QlFwMWd4TlB4NkQrRWpqajZXMGhFRlZxUEp1WENSSGVXQUdHYnBoVFlQdUVo?=
 =?utf-8?B?QXo4S1U3bS9FcUpLcm1HY1BDSGlvaTR1cVJWSjVlZUFEUnlxaGVSSUxjdFZh?=
 =?utf-8?B?WUViejhIQUtCZG9KbmQrd2cvQXlmZ3NhUlhPa3p5VE1PY2lucWE3aGVuOEx2?=
 =?utf-8?B?L2ZEaE42ZnVUS1B3SVlWSTRTU1JEbmY4WS9BTUNWOXZQTlpZNkdCZlVpT2dK?=
 =?utf-8?B?Q2lWOXgwMWVXMEExSll0eDU0cXNnUEpKeE5ZK1ZuZnJNVDBWeWJXVmVlMlRY?=
 =?utf-8?B?MUpmbGMxWHBBUGNkOFZ3WU1XRU9DQ3pXTk1INU0wQWFWY2RNL0RuSFNsRkla?=
 =?utf-8?B?RTB1OVViUE56YXVIWGJaWnc5VWt4bjdQN3VUNlE0Sld0UWVIckM1S3JxVHRs?=
 =?utf-8?B?UUdwYk1TUzQ2bDF0c0pnVjI0M0M1ejhrcVNKN1hiYlF5RkpmVnhKQ0szTldl?=
 =?utf-8?B?NkRKL2IvcW1jd3lMUW9qQjZUNUJEVkJrQ1VsUlBsK3Q4TzU3ajZCdit3U3o0?=
 =?utf-8?B?SEZmRWt0WThPYnFhR1RLOXNPVnpMek9FNm15ZSt6TnROUzhYbVpaa0lUbjI2?=
 =?utf-8?Q?PK/34UyKFxyYHymOve?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce19aa75-2043-4c99-52e5-08de9908c691
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 03:00:10.5007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: maiUzBYIcydcbqRl38LXO6fqBFa3bnaMaBoqNoCsGlZDl2+ifFWDgKjXvAeSP3Efz7FdVxpzSQFYNSu9KsGaHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10569
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_200016_224241_102485A8 
X-CRM114-Status: GOOD (  28.39  )
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

T24gTW9uLCBBcHIgMTMsIDIwMjYgYXQgMDk6NDA6MDJBTSArMDgwMCwgU3RhbmxleSBDaHUgd3Jv
dGU6Cj4gT24gTW9uLCBBcHIgMTMsIDIwMjYgYXQgOToxNuKAr0FNIEZyYW5rIExpIDxGcmFuay5s
aUBueHAuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBNb24sIEFwciAxMywgMjAyNiBhdCAwODo1MDoz
OUFNICswODAwLCBTdGFubGV5IENodSB3cm90ZToKPiA+ID4gRnJvbTogU3RhbmxleSBDaHUgPHlz
Y2h1QG51dm90b24uY29tPgo+ID4gPgo+ID4gPiBUaGUgTlBDTTg0NSBJM0MgY29udHJvbGxlciBt
YXkgcmFpc2UgYSBmYWxzZSBTTFZTVEFSVCBpbnRlcnJ1cHQuIFRoZQo+ID4gPiBoYW5kbGVyIGZp
cnN0IGxhdGNoZXMgTVNUQVRVUyBhbmQgdGhlbiBjbGVhcnMgU0xWU1RBUlQuIElmIGEgcmVhbCBJ
QkkKPiA+ID4gcmVxdWVzdCBhcnJpdmVzIGFmdGVyIHRoZSBoYW5kbGVyIGxhdGNoZXMgTVNUQVRV
UyBidXQgYmVmb3JlIGl0IGNsZWFycwo+ID4gPiB0aGUgU0xWU1RBUlQgaW50ZXJydXB0IHN0YXR1
cywKPiA+Cj4gPiBIb3cgdGhpcyBoYXBwZW4/IElmIGlycSBoYW5kbGVyIHJ1bm5pbmcsIGhhcmR3
YXJlIChyZWFsIElCSSkgd2lsbCB0cmlnZ2VyCj4gPiBpcnEgbGluZSBiZWZvcmUgaXQuCj4gPgo+
ID4gRG8geW91IGVuYWJsZSBvdGhlciB0eXBlIGlycT8KPiA+Cj4gPiBGcmFuawo+Cj4gSGkgRnJh
bmssCj4KPiBPbmx5IFNMVlNUQVJUIGludGVycnVwdC4gQmVsb3cgaXMgdGhlIHNlcXVlbmNlOgo+
IC0gSFcgcmFpc2VzIGEgZmFsc2UgU0xWU1RBUlQgaW50ZXJydXB0Lgo+IC0gVGhlIElSUSBoYW5k
bGVyIGxhdGNoZXMgdGhlIE1TVEFUVVMgcmVnaXN0ZXIuCj4gLSBCZWZvcmUgdGhlIGhhbmRsZXIg
Y2xlYXJzIHRoZSBTTFZTVEFSVCBzdGF0dXMsIGEgcmVhbCBJQkkgcmVxdWVzdCBhcnJpdmVzLgo+
IC0gSFcgdXBkYXRlcyB0aGUgU0xWUkVRIHN0YXRlIHRvIGluZGljYXRlIGEgcGVuZGluZyBJQkku
Cj4gLSBUaGUgaGFuZGxlciBjb250aW51ZXMgdXNpbmcgdGhlIHN0YWxlIE1TVEFUVVMgc25hcHNo
b3QsIGRvZXMgbm90IHNlZQo+ICAgdGhlIG5ldyBTTFZSRVEgc3RhdGUsIGFuZCByZXR1cm5zIGVh
cmx5LgoKQmVjYXVzZSByZWFkaW5nIHJlZ2lzdGVyIGFuZCBJQkkgcmVxdWVzdCBhcnJpdmluZyBh
cmUgdG90YWxseSBhc3luYwoKcmVhZGwobWFzdGVyLT5yZWdzICsgU1ZDX0kzQ19NU1RBVFVTKSwg
IG1heSByZXR1cm4gdHdvIHJlc3VsdHMKMS4gYmVmb3JlIElCSSByZXF1ZXN0CjIuIGFmdGVyIElC
SSByZXF1ZXN0CgpIb3cgZG8geW91IG1ha2Ugc3VyZSBzZWNvbmQgcmVhZGwobWFzdGVyLT5yZWdz
ICsgU1ZDX0kzQ19NU1RBVFVTKSBhbHdheXMKZ2V0IHRoZSByZXN1bHQgb2YgYWZ0ZXIgSUJJIHJl
cXVlc3QuCgpGcmFuawoKPiAtIFRoZSByZWFsIElCSSBpcyBtaXNzZWQgYW5kIG5vIGZ1cnRoZXIg
aW50ZXJydXB0IGlzIGdlbmVyYXRlZC4KPgo+IFRoYW5rcy4KPgo+ID4KPiA+ID4gSFcgc2V0cyB0
aGUgU0xWUkVRIHN0YXRlLiBIb3dldmVyLCB0aGUKPiA+ID4gaGFuZGxlciBzdGlsbCByZWxpZXMg
b24gdGhlIHN0YWxlIE1TVEFUVVMgc25hcHNob3QsIHJldHVybnMgZWFybHksIGFuZAo+ID4gPiBt
aXNzZXMgdGhlIHJlYWwgSUJJLiBObyBmdXJ0aGVyIGludGVycnVwdCBpcyBnZW5lcmF0ZWQgZm9y
IHRoaXMgcGVuZGluZwo+ID4gPiBJQkkuCj4gPiA+Cj4gPiA+IFJlLXJlYWQgTVNUQVRVUyB0byBv
YnRhaW4gdGhlIGxhdGVzdCBzdGF0ZSBhbmQgYXZvaWQgbWlzc2luZyBhIHJlYWwgSUJJCj4gPiA+
IGR1ZSB0byB0aGlzIHJhY2UgY29uZGl0aW9uLgo+ID4gPgo+ID4gPiBGaXhlczogNGRkMTJlOTQ0
ZjA3ICgiaTNjOiBtYXN0ZXI6IHN2YzogRml4IG5wY204NDUgaW52YWxpZCBzbHZzdGFydCBldmVu
dCIpCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFN0YW5sZXkgQ2h1IDx5c2NodUBudXZvdG9uLmNvbT4K
PiA+ID4gLS0tCj4gPiA+ICBkcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYyB8IDE2
ICsrKysrKysrKysrKy0tLS0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCsp
LCA0IGRlbGV0aW9ucygtKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFz
dGVyL3N2Yy1pM2MtbWFzdGVyLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIu
Ywo+ID4gPiBpbmRleCBiODRiMzI0ZTQxMTEuLjdkODhlOGZlMzc0MiAxMDA2NDQKPiA+ID4gLS0t
IGEvZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMKPiA+ID4gKysrIGIvZHJpdmVy
cy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMKPiA+ID4gQEAgLTY3MiwxMCArNjcyLDE4IEBA
IHN0YXRpYyBpcnFyZXR1cm5fdCBzdmNfaTNjX21hc3Rlcl9pcnFfaGFuZGxlcihpbnQgaXJxLCB2
b2lkICpkZXZfaWQpCj4gPiA+ICAgICAgIC8qIENsZWFyIHRoZSBpbnRlcnJ1cHQgc3RhdHVzICov
Cj4gPiA+ICAgICAgIHdyaXRlbChTVkNfSTNDX01JTlRfU0xWU1RBUlQsIG1hc3Rlci0+cmVncyAr
IFNWQ19JM0NfTVNUQVRVUyk7Cj4gPiA+Cj4gPiA+IC0gICAgIC8qIElnbm9yZSB0aGUgZmFsc2Ug
ZXZlbnQgKi8KPiA+ID4gLSAgICAgaWYgKHN2Y19oYXNfcXVpcmsobWFzdGVyLCBTVkNfSTNDX1FV
SVJLX0ZBTFNFX1NMVlNUQVJUKSAmJgo+ID4gPiAtICAgICAgICAgIVNWQ19JM0NfTVNUQVRVU19T
VEFURV9TTFZSRVEoYWN0aXZlKSkKPiA+ID4gLSAgICAgICAgICAgICByZXR1cm4gSVJRX0hBTkRM
RUQ7Cj4gPiA+ICsgICAgIGlmIChzdmNfaGFzX3F1aXJrKG1hc3RlciwgU1ZDX0kzQ19RVUlSS19G
QUxTRV9TTFZTVEFSVCkpIHsKPiA+ID4gKyAgICAgICAgICAgICAvKgo+ID4gPiArICAgICAgICAg
ICAgICAqIFJlLXJlYWQgTVNUQVRVUyB0byBvYnRhaW4gdGhlIGxhdGVzdCBzdGF0ZSBhbmQgYXZv
aWQKPiA+ID4gKyAgICAgICAgICAgICAgKiBtaXNzaW5nIGFuIElCSSB0aGF0IGFycml2ZXMgYWZ0
ZXIgTVNUQVRVUyBpcyBsYXRjaGVkCj4gPiA+ICsgICAgICAgICAgICAgICogYnV0IGJlZm9yZSBT
TFZTVEFSVCBpcyBjbGVhcmVkLgo+ID4gPiArICAgICAgICAgICAgICAqLwo+ID4gPiArICAgICAg
ICAgICAgIGFjdGl2ZSA9IHJlYWRsKG1hc3Rlci0+cmVncyArIFNWQ19JM0NfTVNUQVRVUyk7Cj4g
PiA+ICsKPiA+ID4gKyAgICAgICAgICAgICAvKiBJZ25vcmUgdGhlIGZhbHNlIGV2ZW50ICovCj4g
PiA+ICsgICAgICAgICAgICAgaWYgKCFTVkNfSTNDX01TVEFUVVNfU1RBVEVfU0xWUkVRKGFjdGl2
ZSkpCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICByZXR1cm4gSVJRX0hBTkRMRUQ7Cj4gPiA+
ICsgICAgIH0KPiA+ID4KPiA+ID4gICAgICAgLyoKPiA+ID4gICAgICAgICogVGhlIFNEQSBsaW5l
IHJlbWFpbnMgbG93IHVudGlsIHRoZSByZXF1ZXN0IGlzIHByb2Nlc3NlZC4KPiA+ID4gLS0KPiA+
ID4gMi4zNC4xCj4gPiA+CgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWkzYwo=
