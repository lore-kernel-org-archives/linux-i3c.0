Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33211C43458
	for <linux-i3c@archiver.kernel.org>; Mon,  6 Jul 2026 05:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IibtjfeKVF3T0ZBjrI3iQiCMCLvrUgVCl65aHAu3qjY=; b=exDFg13valUrrH
	QnYK93zpD1nCSUsAYofgvM8WEY1nbA89cuKa5nR1huKhgNAxR9SVg4yvBgMV/YMyvY6TRffmpbTfN
	/bs22LmOEdRRhMABkwSwDGpBedJpi3pDJCy0KX6Ksu7NFQPrkmeXqApOUm9IO4GJRyLYCgHXr5ofy
	/mV72Mk/V2GsqMjIAfwI/NqyvFrsj98xNWwjVjV7EJ4fAWN9FHd4Pc5yT5Ygc28OFLoJhzbE8Yi99
	lJayATfNFOS+iF0GafYFQKFqkCbjHbyw5y01cWC1ocYM+HfdC/XuB72UE7GmEBgtC99vXOo3IUfVI
	hUQc7hoaJ1vyjWAd2jQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgcJy-0000000BYhq-36t9;
	Mon, 06 Jul 2026 05:56:46 +0000
Received: from mail-westus2azlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c007::2] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgcJw-0000000BYh1-0XCM
	for linux-i3c@lists.infradead.org;
	Mon, 06 Jul 2026 05:56:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R3Jk8idmFU/4bv9gVETzjpRiR8yYDng5nvZOtOr9+qNoBkct4EDtSxvdoFZL8kbETEBG2XpP6NfWYqKF4PNmyrVdmkSLy0k8N0r8QMBf36qdDviWaEt3F8AWnWU0qiepIXhrD9OQDBK53UNJ+wlxo8G/ULup3gXcE8mTSWMmM6FsRSRaVW4r+6S+WW5lCRgFBWqgunu77vMUWH3rLHLpkQnhSEf6gKGKSgCKLwDUQR65bndrebpnS2uTHAiu2n4/ocSaEy0zy1ZXwLDx8S4fqyC5sUzxig0FDAxgwG9ReeZo1MP9+xAB5O1GayVdgrFH4521K1JodOmuNCkY2BLNtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AoWRT7P/mBSquGCTMnOdF21CI7z+utArqoqh+5IRzT8=;
 b=lRDCQiXa520/ncybYHdRLyjws4B4ZWJ2rfj6XoD70KJoyLcEEEd62ydqeB7X+fbE1aEfr0Bx5GnCmcjZy/kQK/WuY3Q2x1aa183JzwGMiP9KucALJUzlQDdhwpas9m16cQn8FdLNfl4WgupUTa3/qkWcKXcE6C5CyKBIVyfstkS9u4htfqRtbs0sLRwenNgKmJJHqppKxg/f1cBSiLs5K4kcKjdhLftM1zMjY92XkJiHS/ue9eSbtl32C3n/Bet2DBhQ5VhrC/cYBIqIREP+oX3ujhyobL1zV25TPyWWFb3cwOBe/q1tgVqy+yqd4ZJ9AjMEobU9pxu4nh7SvNyiOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AoWRT7P/mBSquGCTMnOdF21CI7z+utArqoqh+5IRzT8=;
 b=jSsyROUO8bzhOBWXr7708sVQ/sljd37z00pgMxWKh9IO7tRM0/qoJ7T26WT+36a3njSf682V7Km1KNhtDeBG2DQBc4mOO2vZE1XkjuOEdPVrXRci+yRATsQLV8u4oztbagv2QzSaJ8yP5qmfEOiSSSjL/J21yVip9MYBfzNzK63pmR/VZk/bQYWlKugCR93xxVtnm8NugkplnwTotd5lHNXJCfMJs2/750pCjMSDHgPKJCsp6ylZIKUw/YPyqWYWUjSV62yCwLVSZt7emULzGmk1P3fiPVRI4si2BrKBh7gDuFE6j+RORJl8DWz3o9te77COH6kRJRspXSy0HItPSg==
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by SN7PR03MB7207.namprd03.prod.outlook.com (2603:10b6:806:2e4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Mon, 6 Jul 2026
 05:56:37 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0181.012; Mon, 6 Jul 2026
 05:56:37 +0000
From: "NG, TZE YEE" <tze.yee.ng@altera.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, "Frank.Li@kernel.org"
	<Frank.Li@kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
CC: "NG, ADRIAN HO YIN" <adrian.ho.yin.ng@altera.com>
Subject: Re: [PATCH v5 3/5] i3c: master: dw: Map CCC hardware errors to I3C
 M0/M2
Thread-Topic: [PATCH v5 3/5] i3c: master: dw: Map CCC hardware errors to I3C
 M0/M2
Thread-Index: AQHdCtnjnz0nRNJUy0KvJZeMk+WUf7ZboFcAgARiXQA=
Date: Mon, 6 Jul 2026 05:56:37 +0000
Message-ID: <eceadce6-8782-4cb9-b3af-c5451c20cb93@altera.com>
References: <cover.1783074850.git.tze.yee.ng@altera.com>
 <7b85402977d59f7f3d28f15fa7005bbfafffbe20.1783074850.git.tze.yee.ng@altera.com>
 <20260703105931.103B51F00A3F@smtp.kernel.org>
In-Reply-To: <20260703105931.103B51F00A3F@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB5950:EE_|SN7PR03MB7207:EE_
x-ms-office365-filtering-correlation-id: 827efca1-d328-464f-8651-08dedb23578d
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|6133799003|3023799007|22082099003|56012099006|11063799006|18002099003|4143699003|55112099003|38070700021;
x-microsoft-antispam-message-info: 9umkDa6eKluc9kZWAPpuH4WRsJVhhkGSNMJouiKStxbdnbvAfb+D5jpj8jfXGL+Lb1zMG0TD9leejUQdhYsc5TCMnScMu9gHW4M+oqKcbdZbySQnDM4VQL5SNP+8oNrp1SI9nIWrBfLV2BhMVcDQsAXT06oYW079DE/HAURbTKEq6ZRLLCJEs1PLGQ0wGyTUh/R6vXrUa4U/uGaR/6U+Q0KUZBtGIieRhpd4NeZwmqmPN/zbdZ9HHnSPjbEKSMctP4OF+p5DT/7A6W7VifRxCc2KIE8PRksSwHF6RE+DuA6LKGxXPwBoO7F31UHtrUNNjA03y1zBK8hlQphzB36Wzm58BR9GVYdIGh1/OsJDqeM4rnEExKoLjkMKQFQ0F/W7KBdGgx5rdEV5cddhdj14g675ruSOWGc1KpiDC3jZ94xVEzNavwN1IoI1tukIHQHpoHaV6NfvCWemad9vzldbe0qLLwN3IJpuDF92q63Ed4fR9UzcYqJFl8OctLWxLQC7RwhfTOiSQ0jl6wGXaUPXBk6ZVaCtyjiBNPj94oQSHGeMB9bU6bK1MynVvEilXr06la/F2N+lpUqP7tyzt7Cnewi7XcI1Tq8VYSED7kgrwQpYP5TJfpPTOZu8QTSX4vMbBwkPztuzyGS+Judpjui7V7PN8lVHJWfIci9xeOu7gfmsfbNiA8ZNjCUvS75g28P9d7VsIWqfSZEo07YCTL7Mzg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(6133799003)(3023799007)(22082099003)(56012099006)(11063799006)(18002099003)(4143699003)(55112099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dzdDRUZKY1BKUHpZOFl3YkRnTDByS0cxZVJXUnYrdnlmM2YvVWtod0ZmYXdE?=
 =?utf-8?B?cnBGbWlPRWxLZHpzMm9aSFU3ODhaTjBzU0NCVURJbmRHYXhNME1vV3kzVU9j?=
 =?utf-8?B?YXRraGJoYjdTWmtodkp6TGxkMkdUb0lCdVFRUk0xYmxuUFJGamllUWIyZXcw?=
 =?utf-8?B?T0pXMnpRMEk5UUQwWk1YMVRQV2NrdDVYU2R1MFIvVk9RUDRTYXdYRmZJaEJV?=
 =?utf-8?B?Y0dkYytqVEg1K0xqY0Z4U1grUnZ0Umt5cUhlME55RXlvUm5jbFd0TEdibVRO?=
 =?utf-8?B?czdYOUpuajc3QzdWWjg1dDhXTlMwbHd0ZEdCc1QzQ3JtM2E4bi95WlRFbUV1?=
 =?utf-8?B?UzZEK0ZKMkJzODJmdFV2eFhudXE5TmZhbFlST2cyYVFjVE9jSTNDaFN6bEs3?=
 =?utf-8?B?QmhMUTdZTlhKN29FdFM4TnJOdGtvbU1kT1lPTS9aM2NhZUgwS3lqYW9mMTBZ?=
 =?utf-8?B?MzBRRWc2NjRGaGFFTmRpRUtDQTlvSG1WNFhXUFVpS21NNVJXRk1HYmJka3hB?=
 =?utf-8?B?UkZod0xTN2FpZTRDeGptT04zNm9wWC9hejAzVHpxL255b0VLUXBNYTZzUzBs?=
 =?utf-8?B?NnQwYzhxa0lWOUM1UmZ5SVBPUUVHanVUNjE1TEFDWWpDZE5OczYvZENLdUZD?=
 =?utf-8?B?Wmhkb2dhUzhVVW1ybDRXaU1kQVhJUVVCK2dBaG51a2hrRFFKWElIcmd6WnlD?=
 =?utf-8?B?ZWxRSXVzTWQ5cUVtQksrbGg1dGNpaUpPUnA0VzlEeEFUN1dWcVhUYTFKT0VC?=
 =?utf-8?B?MFRJSnlsa3dGM1JvYlhBTDBQaU9qL2NDa200ck1wU2JwZ2hvaGJYbjBlUXJ6?=
 =?utf-8?B?Q1Z0YXppbWRzUHVLakFKUmhxSHBDajJpTGUxamtKdWFaS3hxL2F5NFpQZGFI?=
 =?utf-8?B?c05pZENoUEJzVUVvQ1hZOVlPdkh3L0xNOGpXOUlJRlN4a0orUnJENUM0aldI?=
 =?utf-8?B?VWpETHErTW9kZHZQNnRFVXhaSGxPWTVWZCtNMGdqamFIajBBSDYrZVNnWGcw?=
 =?utf-8?B?VVFvdXZ4NkVnSnpRcWZQWXJjYlZpN1NvVkdsYUd6THo4MWIxVzdjTGMreFhE?=
 =?utf-8?B?WGN5MEcvcEI5VjZGeURlSVFSRUNCTmZXMDdWMzJ1aXBaOXhubnBNSkdwVmt3?=
 =?utf-8?B?anNDQXZ5WVlJNHA1RkIxNHpBQ2ltd244aWJ2UlZlZzBYUVBQc1k1TGU0YmZp?=
 =?utf-8?B?T0s1WC9JN2Jma1FYMVN0bUsyOWNraVdxREFKSHFDT3BUWXRWWE1ObzBQM2p4?=
 =?utf-8?B?NEU5WXhyUWk3SEpmcGxVMlowOEg5dDV6WkRoR0VLR0tJQm9ZWUdJcmxQTUZh?=
 =?utf-8?B?c01BcGsydmlBdzUvNEdzYXRCSEl5NnJkTjQyc1hjb0Z3dGtzaEJVL29tNkU5?=
 =?utf-8?B?WFB5SU9hdEpqMFdBb1FuSzFER3hZUHNudU15d01RdDFCRVpVbXBjVGhINTZX?=
 =?utf-8?B?QWV0NkdjamYyRkpycStiKzVlV1ZmUGtDTHlNTG1oRFNGZlRMOXY2UmpCVlZm?=
 =?utf-8?B?V2dEL0VtL2szZVJyR2NKL1RGRSthUWVYVGxZQmNzQktJL0p3dlhwVjdFOUdo?=
 =?utf-8?B?cFpPUHcweVQrOEpZMmQ3bXY0Y1dCQjFQMktWOWZMc25QSFBUVVZVUkVrOHlD?=
 =?utf-8?B?RXZvS3lDOG8xTUI3alNWNGxVdktya0dHbjJJR3ZteFBVWU1JSURaK05sZyta?=
 =?utf-8?B?MTFlQTRQa2tHSGZYVGZLWEEzaDlCMnJ4YlB4T0JaODJVYjNUMXhBS2VUSTJP?=
 =?utf-8?B?RTdacmFjSVRvVjBtK1NhZ3V2cnpWQlRRVzBxRGlCTGZtNWJvM2tQQTZ0UFhQ?=
 =?utf-8?B?c21PRjlFa0NmVlB6d2RwSTJrN3dUdWtYejVvd05lWGdoamZrWTFvYzljVTN2?=
 =?utf-8?B?bmZrbXhDVVBMUU40U2lVaHUveWk1Q2ptcEZ0clJJaGxRbUVwYXIyMmtvbnM3?=
 =?utf-8?B?dWlyenZYTkg5MjQwWTdtc2FnaE9Sb3dxZEVvb3pjVUFNVFlJZG42UHhlSmw1?=
 =?utf-8?B?Qms0Z1Baem1FVnZrcG4wWkZhMkRxYm5ySjkxUzEvVUZpZ09DT0M3dkhMQTA0?=
 =?utf-8?B?N2FVbitScUkwUGVYVkVwS25iVTlXTVFaTjl1QXJRVmE4TEhhVG5SSE9jME9U?=
 =?utf-8?B?MTdOVmZtNnIwbERxNFppUlNhMzVrTFdzRi9STE1uUkxnaDJKYTdiQ3NRQ01P?=
 =?utf-8?B?Wk04Tm9EQk5yR2dLRUUzSFFzd0h2WW9BOTBaZ3N3NjBwRy9jMUVudkRqWVRx?=
 =?utf-8?B?enVrb1JWdVQwMFRZbGdaZENBak1NTkNEbHp0R2V4cUE2ZFdMWWR0eW1FdSsx?=
 =?utf-8?B?SEQ2RkwxT3FDVk0wNmR2QndleVErQlZiZjhxM1FsRHNNcTRBd2JTcWNTNWZ3?=
 =?utf-8?Q?aKBkgEpgTci7y4bA=3D?=
Content-ID: <E3320D889D10554CA33B342CE50D7102@namprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 827efca1-d328-464f-8651-08dedb23578d
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2026 05:56:37.2100
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NdVtyzy7X7sC5h7kFbw8F+sSEEGKmRtBYWrNDFgTFLaTAMbXojhDGWkEKa6hvR/Ieajd+FNwbYaJvSYmcoVFoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7207
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_225644_195350_4FF37A0A 
X-CRM114-Status: GOOD (  17.51  )
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

On 3/7/2026 6:59 pm, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] dw_i3c_ccc_set() fails to use dw_i3c_ccc_map_err(), resulting in inconsistent M0 error mapping for CCC SET commands
> --
> 
> commit 0ce229b1e86f48f8bc79433bee08c7da0909bad8
> Author: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
> 
> i3c: master: dw: Map CCC hardware errors to I3C M0/M2
>      
> This commit maps DesignWare I3C master CCC hardware errors to I3C M0/M2 error
> codes. It introduces a new mapping function to handle this translation and
> updates CCC commands to use it.
> 
>> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
>> --- a/drivers/i3c/master/dw-i3c-master.c
>> +++ b/drivers/i3c/master/dw-i3c-master.c
> [ ... ]
>> @@ -781,10 +800,9 @@ static int dw_i3c_ccc_get(struct dw_i3c_master *master, struct i3c_ccc_cmd *ccc)
>>   
>>   	ret = xfer->ret;
>>   	cmd = &xfer->cmds[0];
>> +	ccc->err = dw_i3c_ccc_map_err(cmd->error);
>>   	if (!ret)
>>   		ccc->dests[0].payload.actual_len = cmd->rx_len;
>> -	if (cmd->error == RESPONSE_ERROR_IBA_NACK)
>> -		ccc->err = I3C_ERROR_M2;
> 
> [Severity: Medium]
> Should dw_i3c_ccc_set() also be updated to use the new dw_i3c_ccc_map_err()
> function?
> 
> It looks like dw_i3c_ccc_get() was updated to map M0/M2 errors, but
> dw_i3c_ccc_set() retains the legacy hardcoded check:
> 
> drivers/i3c/master/dw-i3c-master.c:dw_i3c_ccc_set() {
> ...
> 	ret = xfer->ret;
> 	if (xfer->cmds[0].error == RESPONSE_ERROR_IBA_NACK)
> 		ccc->err = I3C_ERROR_M2;
> ...
> }
> 
> Without using the new mapping function here, hardware errors (like CRC,
> Parity, or Frame errors) during CCC SET commands will not be mapped to
> I3C_ERROR_M0, resulting in inconsistent error handling compared to GET
> commands.
> 
>>   
>>   	return ret;
>>   }
> 

Hi maintainers,

Sashiko's comment is valid. dw_i3c_ccc_set() should use 
dw_i3c_ccc_map_err() as well. I will fix it in v6 so SET CCCs get the 
same M0/M2 mapping as GET. SET CCCs are not retried by default, but this 
keeps cmd->err consistent for callers.

Thanks,
Tze Yee
-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
