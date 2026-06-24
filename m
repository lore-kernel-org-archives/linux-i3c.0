Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F3D9CDB479
	for <linux-i3c@archiver.kernel.org>; Wed, 24 Jun 2026 06:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VoA92Gra/CLN6csNCO4KovnUbbuJZpt/FelQMErXvNc=; b=GN7c0Ww5BX91p7
	gdLv9F9VFAAKgP2adAZS4AHoknZ8CnB/XQ+OFzOfkBdnFILW1likzIMXl84MySmmx5jLzPhnHpWYK
	vibETTbN9+8gyfRM6n1a25sPp0VywEfdAldssD+YeFR47CHQf5/iHU2cbeVxclAe7ZpaO/hDGjG7M
	jTCzyyNZS2D4b0C/vq31lTlpH+B2ILtCuOWbUOovevsNHktV/vEiVHKUPi9VYSBTN1fqtRRlqiLYH
	MKgRgNV1Ch9NxZH5rMbkxu3W5GYFXODjRIwPeGcHEogCNQ4fTM/diqGbgiPHs3593yHcFGBDt68sZ
	K5sUTlhZmSgqNmbPXpww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcH8S-00000007EL7-2WKo;
	Wed, 24 Jun 2026 06:30:56 +0000
Received: from mail-westus3azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c107::3] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcH8G-00000007EIj-1an8
	for linux-i3c@lists.infradead.org;
	Wed, 24 Jun 2026 06:30:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GAGVvUokKP6qt3fMg7frWQxRP9AJdAn1d2f/tI+oHPPhpW4V6OnGJzwIHeknjCG1tYVZRAnqdfM4nkxofHZl0eUwgjqtYeJDvWfwsoBEe7m1NYnhIJn3jf5/5aOMF/3lvSSFdOCo1wA3q5d7c10Y+9RWtoSOmou9xQx1uq67F63zK+GDnG8Hb+AB6mNMfOxrGvLJWkSZPgQgjOd0Kp+ub46HQ5RL2JU1Bb190W9gfMg5Pb5B6GNOPn4C4eObnd7zU+tmcS3qRJ03ofW7RM2Uu2dTtij93ck7N6PfnrJyoOjqbqO8XzZEkvETU9/uKuUNzTlVUKc6iH7UzJ54yqxBRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RSy2T5vDZ9gsOglvL1X1Ii8PmZ0aPxv8AnYoKxA0PWU=;
 b=vE7WEeqWvR+/cgDO0osqaHUvCij77TIZ5un3nipvZFuXlXt24mE/JiZtdMLpukrnEq3+bAJOhL50a/QyLRj0ZM0Jxv6csMD4IH10mtt28nLxcirsyrPFE9SKIRm7FlXJh6K67Yi9uc7Daveqi/TSwZFmwzzYQp34Vl+SuJRi3mnYimRxmSxRvRyFUL/YmDJ0yqGVQP+kTWkzSHislwFBJPWOvGIyjChD/e6OuCns7nhfTd5xe8ZQ1XYKKVZlC2mXq+giTSwnP3q4QVIccE6BfD+HcKeaFMk+pI1ajZaZyzrffaOlgr6Apu1JFeo3q63KS442WkiWD+Z6HgMpINCJ7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RSy2T5vDZ9gsOglvL1X1Ii8PmZ0aPxv8AnYoKxA0PWU=;
 b=aBtW70v+Rvcx59Tvtq39X6E6HMGxBqIBFvw0X6yGzNMP42guIegguL6MeUO09q961gKHDnSofF+zre83oqh+Ytl8OjZYGvpjAiXO4ZMhfD+Y/ShsSssefvemfSu0DtJ4rQ5SHnFaIIl1t/Tu3cPrBjUkzlA1iBsg58RHLz/apS4cEs/JJY9kYzKQhQladkevco5RafCxAZ+ENS0WruRjVs2K1BE98wEFT93yk4cCP5b4HIbZHbv5nyUAgm0Fg+wsN85CvcevnFkgi0egPhXSigq1svtMn/wQWH5U1k1Q/sh2LggjZuMMwzxWq5160rIXXhL6i/69AaODWa03OId9Mw==
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by DS0PR03MB7679.namprd03.prod.outlook.com (2603:10b6:8:203::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 06:30:38 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%4]) with mapi id 15.21.0139.018; Wed, 24 Jun 2026
 06:30:37 +0000
From: "NG, TZE YEE" <tze.yee.ng@altera.com>
To: Frank Li <Frank.li@oss.nxp.com>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>, "NG, ADRIAN HO YIN"
	<adrian.ho.yin.ng@altera.com>, Felix Gu <ustc.gu@gmail.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Manikanta Guntupalli
	<manikanta.guntupalli@amd.com>, Jorge Marques <jorge.marques@analog.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>, "linux-i3c@lists.infradead.org"
	<linux-i3c@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/3] i3c: master: dw: Report actual GET CCC payload
 length on success
Thread-Topic: [PATCH v3 1/3] i3c: master: dw: Report actual GET CCC payload
 length on success
Thread-Index: AQHc+UUy7uoauaxvN0aLsIYjzevEsbZGTwwAgAcEWYA=
Date: Wed, 24 Jun 2026 06:30:37 +0000
Message-ID: <b8c9e0a7-d4b0-444c-81a0-538fcfe2aba7@altera.com>
References: <cover.1781142158.git.tze.yee.ng@altera.com>
 <b7dff215ce161fbff18949a12442eac5d189347e.1781142158.git.tze.yee.ng@altera.com>
 <ajWWqkwDzzhEMXZO@lizhi-Precision-Tower-5810>
In-Reply-To: <ajWWqkwDzzhEMXZO@lizhi-Precision-Tower-5810>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB5950:EE_|DS0PR03MB7679:EE_
x-ms-office365-filtering-correlation-id: db623996-3a98-44f2-8daa-08ded1ba1abf
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|56012099006|55112099003|18002099003|22082099003|38070700021|11063799006|4143699003|5023799004;
x-microsoft-antispam-message-info: Oq885ws6Nphn82Shl1fjJUMU3XVow9JQk1DlmSL1G8y4GXx/As0WRW8zIt8eU61aEhnLuRnLmgkeODbKiiTWfCGlsI6XtxPXiut9zmo9L62Nwm5mKRZ61z54brJUnocApD/qOzfzHmh4IN3jDQdLp8Tfq8oLU4Nt6kYtuWXcJtyQftvhF40lhKicW4Zqb9CvxuS7YjhS/c05e0O1A99E8A9SxB7BjBDfgt2ot+6CQXMMiIwseOzE3vyqYDWW334Uy3MRYzCJZMt4fZuJuSrF1F2tTqiRk9th9/s/Wgkh4bNMjvE/I3NSai26nctTFLxRhMLCxdW4pdlUVH/PVh4O4M2LqXENn+tkCUdYEK90myo0tdN91OUj1kAeDPMXlshhCJqbiwyGxeI+i5lIv46bynLQzJxO4F28GZy+4gSqI0k9EvVnCZr8ILbr5+j9MD+fFEYZcMoPqLLfR5vRAS2hCIVuIYChL48GOi2Jx1a0TvZWkH94Le4nuM5EXV3rP2prJsN8U52uawYGUjRPxANHSbOSvHDpWGIJSNPVF1NfMFhAb/dcDFKZ7clXcN5v18M17oUhIdTAtJu1Tuf4J/G74+CeQgULamBa8/CLTH1Q8DEEwncc8zJeSVjtG0mDbk/ldCfSnnHlRF5d7SmEceyq108498CtrMqF6odbJE42qz/PXbANYOoVwYptuVVrOshp/ljSpDQ3mdh16Kv4czNSKozXR8GyGHkVbBz2YKuIE4g=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(56012099006)(55112099003)(18002099003)(22082099003)(38070700021)(11063799006)(4143699003)(5023799004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q00yemF1VHJjejczbDYyYis0MURwakovMGY2czB5bzY2N2VXZDFlODZIZU9F?=
 =?utf-8?B?Z3dIa3h3WXNZL1dqek5jTDljWFljQXRwZlExVmVEWFlXai9wSzQyUmtNQjdi?=
 =?utf-8?B?KzhIN1hHSFE0eng4SlVpMlJsSjNpZmpaVnFnRi9jQktMdHJHL0F2RzZkMUZh?=
 =?utf-8?B?SlgvRFVYQ21UWE9nT1NoQndSdDdEbjFxRTc5QTBMeGRkSEtKTHkxZjZNMURo?=
 =?utf-8?B?WnZ1VHdPVWk0YlRiajE2OUNyaEhMdE5SbldXQ0x1djM1YllrRndrWGs2UUNa?=
 =?utf-8?B?a1A0d3pleUhpOTg1WklxNjl5UGZIWlNkRUt5RzR2d3dpUFNuSGJBNDFMbjl1?=
 =?utf-8?B?MklzOGYxNml0M0J4cE5RdnlNaTBaQXM0RlpYMHp4OG5YeFMwMjgvSkFXdWxv?=
 =?utf-8?B?a21lVllJRjBTSzdCenFsdzR6SDJGSlh1SEpjcHhvRVBOL1N3Z05LdkxxN0lU?=
 =?utf-8?B?cDE2RVhmb1FqUnBTWmNFV1NCTXpJZmhKdDZqdG1MR04wQ2hISXo4bGdaUDZk?=
 =?utf-8?B?cU9zSFpaZ1M5a0VHY2I3ZCt2aTBPY1hWdTZIRUFsaVhwcVJEMWFXbWRZQXNx?=
 =?utf-8?B?VU82L1FtNkR3dks3S3lmZnFmNTRneE1hdmd3R1I0bmY4UTJxcGdWSkErc0t5?=
 =?utf-8?B?UU1WTDJmU1Eya0p5ZkZHN1ByQWswdmtTWEFrMSs5bmMwTkY2NjNuMVNPbWZa?=
 =?utf-8?B?N1Z2UGZsUm1SamVCTmx2ZlFtcnZlZlB5ZytQNW5XSGdoT05kR001RytGeEdI?=
 =?utf-8?B?N25acmhBb3VLZWU5Q3pDd0dNcjl4c3phelgzem5wL211UXlVTnM0bFQzcHht?=
 =?utf-8?B?OUVpMzBiTUk3VEVxc1FjL0tiOUF0Q3llQ0tDSHhuUSs5OTZRRjBhdDdSRGxB?=
 =?utf-8?B?RU9tcUdNMXl2SCszUUVZT1o3ekZEMkcwcnk5UnFCTHNTM0F5cHhJZWtvQkh1?=
 =?utf-8?B?U1BEbmNIY3JWRWZOcmRQcHp0QUp4dGgrUmVuRXBCSHByQU5lUlY3UFRmcUhs?=
 =?utf-8?B?T1Z4Zi9YVkg2Lysvd2tPbTJNdU0vTGxQZkcvUkRVd3NSYWhaajdFQ0JhSmhj?=
 =?utf-8?B?V2U3UkllVTF4anUrVWxmR3I3cTdlaU5xN2dmQUVHZ3NKL2F6NUpuNnFsQzJW?=
 =?utf-8?B?SlRDbFZlSjc3djc3OWhZdHBzZmtwLzc4eDRVVTZVU3R2ZS9sMXhGSk9ESEQ5?=
 =?utf-8?B?cG5abkhnanIrcDM5OWZ4L1A1a3JrZFNqdjErSTFBMlEzY0N0NEc4RlVHVEV0?=
 =?utf-8?B?akdLMDBTS2oyN0NxZnh2RGVyMEFIZGphMi9pL3NJY0Q3SVIyVGF3UnB3MTFV?=
 =?utf-8?B?UTBWS2dwWEhXOWtKcW1hMzhWWEprQWZSMXJJWUdXaHFDVkdPOG1VQ21UaHlZ?=
 =?utf-8?B?WURLcjkxb0dmRzdZYzRQYTQrL3RNM2cwRjZGWkJKdzhsU1lSVU9HVjgyeUxD?=
 =?utf-8?B?VEZLYXpNQmNWYzRUMENEd3FTdmZaTzRqZUo3eEJ4M2hJOFpHeVgxekswNkx0?=
 =?utf-8?B?N1phZkU1Nlc5a1NWRnJheUhJbm14eCtRN2dJVmhxYlRjR3dxR0pHR1VEYURp?=
 =?utf-8?B?QTNESnVJeXo3Uit2bExXeFZZWVNsQXN3Q2FSWWYvcG5YUVlHYmRuMkdFTU9Z?=
 =?utf-8?B?Um5SQW9FTm9hVG96UWlzcUR3S2c4RUxXbkNiVlN3UkdKYlhPbjRSeCtXeUJS?=
 =?utf-8?B?RHVRUmhRVHBlTCs5c2MvRVpEV1czQ09jSGZYTnRjUm9BV2Jsd1VPK29vSzF4?=
 =?utf-8?B?QTV2UG9DVUpYTTVTdHBpcXlEN2F3alE2ODVZNUlTcVNGNHc0NkdieFJWRE9S?=
 =?utf-8?B?VktWZTIxV21ncTFSaldjSW4zcmtMclBHNUNSS1ljZlFNR3BGajMzSHc2V3B5?=
 =?utf-8?B?aHF1YUpYaWVWZ3dXYUdPTWFzS3ExWUN3aXA4ZVBXaUt2SlIyNnZVNmp2cHdW?=
 =?utf-8?B?VU1rVXhYdzQ1SkJQbTE1cWZtTUt5YVd3aTR1NkI3NExJalduQjExVlJGQTFx?=
 =?utf-8?B?N1BOdGJkTzI1MVpRM2gvZ3RIbS91cTlEVzA5MEZEVE9HZ2xzWHVVT1FmcVlx?=
 =?utf-8?B?aWRrZC9QU2J3eTI0MEh2RGZRbnVGYm1qc1dTcm0rNUxjUFdLd2tzNTN1NVVE?=
 =?utf-8?B?Skd2SlVSWnhOVTBTeDNSTUs2eWxrVGFiZnA0ZW1BWHVHeDlkM2dTUlRPRnFr?=
 =?utf-8?B?UjVNQUgzb2ZmditLRW9OODNkbWNmMWV0TVk2WGN5b2JERDhFUGFmb3dMYTA3?=
 =?utf-8?B?OGxlU3hOSytTNy95WEdJdHFmOXhRVjBpSWU3Y1ZFWGt0QkV5VVQwVHNhQkIr?=
 =?utf-8?B?bWFNMUNuMjJ5VnR4VW1BN29uemdaZmxBRTYzOHNBTkQyNzRod3BCQkI5c2N2?=
 =?utf-8?Q?+xdpyUIHsSXgKp90=3D?=
Content-ID: <836939BFF72EA149A473F0384CEB78F3@namprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db623996-3a98-44f2-8daa-08ded1ba1abf
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2026 06:30:37.5831
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lwqICL3ANNcRys6Ltx63oxPYmAd27hkM3V4fI2OEF6icTc7syAhZwppsxmVMVovSphm9OWkO/QHuF9j3siOG0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7679
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_233044_560348_8FE7ECAC 
X-CRM114-Status: GOOD (  19.40  )
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

On 20/6/2026 3:21 am, Frank Li wrote:
> On Wed, Jun 10, 2026 at 06:54:06PM -0700, tze.yee.ng@altera.com wrote:
>> From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
>>
>> On successful GET CCC transfers, set dests[0].payload.len from
>> RESPONSE_PORT_DATA_LEN so the I3C core receives the number of bytes
>> actually read. Core helpers such as i3c_master_getmrl_locked() use
>> dest.payload.len after the transfer to interpret the response.
>>
>> Save the requested length in a local variable before programming the
>> hardware so the caller's buffer size is not conflated with the bytes
>> received.
>>
>> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
>> Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
>> ---
>>   drivers/i3c/master/dw-i3c-master.c | 12 +++++++++---
>>   1 file changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
>> index 655693a2187e..06fdf8857b9c 100644
>> --- a/drivers/i3c/master/dw-i3c-master.c
>> +++ b/drivers/i3c/master/dw-i3c-master.c
>> @@ -751,21 +751,24 @@ static int dw_i3c_ccc_set(struct dw_i3c_master *master,
>>   static int dw_i3c_ccc_get(struct dw_i3c_master *master, struct i3c_ccc_cmd *ccc)
>>   {
>>   	struct dw_i3c_cmd *cmd;
>> +	u16 req_len;
>>   	int ret, pos;
>>
>>   	pos = dw_i3c_master_get_addr_pos(master, ccc->dests[0].addr);
>>   	if (pos < 0)
>>   		return pos;
>>
>> +	req_len = ccc->dests[0].payload.len;
>> +
>>   	struct dw_i3c_xfer *xfer __free(kfree) = dw_i3c_master_alloc_xfer(master, 1);
>>   	if (!xfer)
>>   		return -ENOMEM;
>>
>>   	cmd = xfer->cmds;
>>   	cmd->rx_buf = ccc->dests[0].payload.data;
>> -	cmd->rx_len = ccc->dests[0].payload.len;
>> +	cmd->rx_len = req_len;
>>
>> -	cmd->cmd_hi = COMMAND_PORT_ARG_DATA_LEN(ccc->dests[0].payload.len) |
>> +	cmd->cmd_hi = COMMAND_PORT_ARG_DATA_LEN(req_len) |
>>   		      COMMAND_PORT_TRANSFER_ARG;
> 
> not sure how req_len help it. Prevously everything copy into cmd.  now copy
> req_len then copy to cmd,
> 
> No difference?
> 
You are correct. Saving req_len here does nothing useful as payload.len 
is never getting overwritten. I will drop req_len in v4; keep using 
ccc->dests[0].payload.len when setting up cmd->rx_len / 
COMMAND_PORT_ARG_DATA_LEN.>>
>>   	cmd->cmd_lo = COMMAND_PORT_READ_TRANSFER |
>> @@ -780,7 +783,10 @@ static int dw_i3c_ccc_get(struct dw_i3c_master *master, struct i3c_ccc_cmd *ccc)
>>   		dw_i3c_master_dequeue_xfer(master, xfer);
>>
>>   	ret = xfer->ret;
>> -	if (xfer->cmds[0].error == RESPONSE_ERROR_IBA_NACK)
>> +	cmd = &xfer->cmds[0];
>> +	if (!ret)
>> +		ccc->dests[0].payload.len = cmd->rx_len;
> 
> Only this line is validate.
> 
> Frank
>> +	if (cmd->error == RESPONSE_ERROR_IBA_NACK)
>>   		ccc->err = I3C_ERROR_M2;
>>
>>   	return ret;
>> --
>> 2.43.7
>>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
