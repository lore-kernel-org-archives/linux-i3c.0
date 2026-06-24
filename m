Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C652CDB479
	for <linux-i3c@archiver.kernel.org>; Wed, 24 Jun 2026 06:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ln0QwFpeIKuVYJTP24wo2UfVLQb0YawPnksb47Vtg00=; b=QHAzdZ7mT+q2OJ
	MwAylEbda9IcY4f30I960de0MWd5M3RGZYSbaFbsnCG5v3cj0tdDei/cyl/x/r7iU/waAjzD5/pv3
	udVourKiIGf1D2nF8HyRvIAPcpJ/xtOcKhfWAPMjBHP74EZVs2Jl4JdXsWlv4Ps1ufLKqHGsqPQy2
	hubp5D3YvoPlU4QFu7Hcsj3fA51o9QbAZrob9WuP+hpuaOYIV6go2tNjPudIqMkfoHc1WxsMAgRfa
	By2JCamL6z7chyX7t1JH5X0xgiwDwlS1sit40ncLH/gaJ5n2xzpEztwRLaZusHr9BclDqgIJZQRPf
	Nt/nvELHAlPALunw4EAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcH8G-00000007EIp-04gN;
	Wed, 24 Jun 2026 06:30:44 +0000
Received: from mail-eastus2azlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c110::1] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcH8D-00000007EIC-0Hlj
	for linux-i3c@lists.infradead.org;
	Wed, 24 Jun 2026 06:30:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QaVgLKj3QrEc2QKegWun7N/pe+WYwbqWC2qPRzaVSSk6P49VoBwqUSLoD6u75Rhgo1lTEORRkx/jct07BYU2QTs8/zRmYfay04FkliybjStaHbQSwEhElQedsDjX6aYATazaNNZpN5BY/XtlFZBDJu24NmtuxSgudi8K2sHYUFDszVwtvSw9RFlFSYVDbR+Fbi0aB1hW3O+Zp8irhIp+HqAaFvESeAlkOt3IOn1/pv8lKGJM09uUoHU7EYyMi/jt4OZkYFYQRHzfVJ3br+yEiYZ3C+q+JpA+Zx7YqST9KKlGl7ebURmCaTsB/pdJEby6GxGzIbTmP+Xo9ovGWM404A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rR7ZXIRRIXMyQJPYzabgVv0GiqhVOiD5ErKXLvCw7GY=;
 b=HWN3rAOA90vdntJ8TcNl9GlmO/i10lu+H1O8dPZ01DNEOGIoggAOCbWirXmjlBAicQvsxhQKYUJvrooZFTOHvL5HemlH6WDKLx5GVAizOSOACAIYTOE2o1xmc/xzAwezj2+BoA5BO5hGaUNtPQsY5hMOMMVFq5z0J78aBgyeTtz0NDAX31bHYx568IuLIVsZTbKoguwZ/5pKISdTmfmbfqpYkaAbS0MJ3DqYIQGFO1yinLPemzY84PsQ88NNa3ZRhi2+3wg+LjcA1RgYvLhNZT7LqUMaVdazq+eFT6l5MjbCKGbC2bFxRDQRyoMmypeDfR/gzPUIwb+r/xTjE8siVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rR7ZXIRRIXMyQJPYzabgVv0GiqhVOiD5ErKXLvCw7GY=;
 b=JN1FvQEtVRpiFTjMXF8nAxgpYYW5IRvkBwtoEvPuIGpd9AVHaUXB6wMVB3d0On4DjinJBR3dGigR0v/a4gDy1ky9JyTMn+0UTQA78JJLpMnzkmaOGqwlGkmXWUrULvYUJEa5Yn8PAzI/7AiDkMNO8oVtsrql8+f79RRPXxcWK06mz3NMJMK8ikg5pmwg5Mkces+2x1dJ0h3Sv2T45SS5hbABg2toyReXLWKOxFV+eWRYAbBkKRFkvj4xcdlSqagCwqlI5nNM1CLr7jaYDVNJgKVDVeihZv77m0jfpZ60X1x2WIZgzyOw0UQJZLF4qlbxByX1dLDECft+RM3nGQqsWQ==
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by CH7PR03MB7954.namprd03.prod.outlook.com (2603:10b6:610:24b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 06:30:32 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%4]) with mapi id 15.21.0139.018; Wed, 24 Jun 2026
 06:30:32 +0000
From: "NG, TZE YEE" <tze.yee.ng@altera.com>
To: Frank Li <Frank.li@oss.nxp.com>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>, "NG, ADRIAN HO YIN"
	<adrian.ho.yin.ng@altera.com>, Felix Gu <ustc.gu@gmail.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Manikanta Guntupalli
	<manikanta.guntupalli@amd.com>, Jorge Marques <jorge.marques@analog.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>, "linux-i3c@lists.infradead.org"
	<linux-i3c@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/3] i3c: master: dw: Map CCC hardware errors to I3C
 M0/M2
Thread-Topic: [PATCH v3 2/3] i3c: master: dw: Map CCC hardware errors to I3C
 M0/M2
Thread-Index: AQHc+UUyxLHWbO5IV0GUTgDxg98TnbZGUHgAgAcC5oA=
Date: Wed, 24 Jun 2026 06:30:32 +0000
Message-ID: <5c4091ce-2430-4a5f-adc0-9614950671bb@altera.com>
References: <cover.1781142158.git.tze.yee.ng@altera.com>
 <a4d909479fb8d78e930398fbdc94289d0a173a09.1781142158.git.tze.yee.ng@altera.com>
 <ajWX3JExFZCqXj13@lizhi-Precision-Tower-5810>
In-Reply-To: <ajWX3JExFZCqXj13@lizhi-Precision-Tower-5810>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB5950:EE_|CH7PR03MB7954:EE_
x-ms-office365-filtering-correlation-id: e2f7245f-8b62-48c9-42a8-08ded1ba178b
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|55112099003|38070700021|22082099003|18002099003|56012099006|11063799006|4143699003;
x-microsoft-antispam-message-info: COFtDq2la1V9kLdlwtnZgwOaGySnCTE0rj+83UvdL/kp9vvnvu9ZWEeEPfpxF12CCR7cEErzB6S/PE56bo4hMCZbfiq53v+0YktdvjIugXgUP83i7pCai3WllUbEX/coa5mS0QPjPmWjtkk/oNOO4ro3mjkc8Qr4J4HgBGq5aqKgi8e7WVSzlCy7y0Yrv3QZDTBDeOX4wvENfPodZRV9+l2pqyZld/3plz1/O/IW4EImOjIFbm2ksZQ2eZmrHNWToboiqL7N7bozwaczpm5jKum54jl6uvjvoqfA0sdYc+eJzlGc+JcIlAyE5w5Xdy01Ee9TA5UxUBWdp1DWzc4ndSEkaMRdCnromQIaxtm8zfuFsJKF9JMjzdAeL9N0xok4GO9NChkEtU9RSnLJmpQC+IMXFzxVQ0nOkEyW6fgXRzOcNHKW1ChkVC6PMqMNiLbt3b9Oz1cp9V6iQ0ahmOwMJo6UV2zI2TQx9qAo4oWCUBavEIGizDc2/+xWSAHtuthDu5qt9NEPv04AUBJ76HcDx/c57723xknxweKdzWYZu65hAj5yaBs+RlqhMx5fRVnYCCu/1bwF1aXnlbTsVC7LPwZjhzCY11VCBzg2hs/5yGwIXj8Di/7ZqdnKLAagtLPTHk39KGGebe268U4PMvyMsZitVFsp6bGUtLHbg06y8mqRTKhupGuoyk/jc+ggvsyqDJRJsXxbhougHb82TYzKZYcWdLSSFnKuuS0ygUf9xPM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(55112099003)(38070700021)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RXIzNjlWOU9nNjRxVTR3VWZValYwSnJUcU1JVFg4dnFBUTRsbDhkWlJNQnNo?=
 =?utf-8?B?NEhDTUZwSTJnSWdjYU5VdHpjVFhuM2xFNHJta2VBbG9SSTFnbklEY3BGeEJj?=
 =?utf-8?B?SDZ0Vm11SXJtZkhLdjNqMkNTdWZtUkdpNUVycDhZRGwrMGw5L2hGb3IyTzh2?=
 =?utf-8?B?eTc5ZjYxQmpVQVAyMUJwalJqeDMwbTMvY0pyK2N6bTJQNzMxbldHdHdaNHA1?=
 =?utf-8?B?S2ZRcUc5TUthUE85b2srRm5mQWlVWG1FeUM4Ry80U05kUkxVU1EwMk5WdFlT?=
 =?utf-8?B?ZzZTVERCOXJoc2U3UnFXRGtEQ3BqRTdaQ2o1MmNjOHhOZ1p0MUhoZEFFRk16?=
 =?utf-8?B?UDlZWDFSZGIrZWNPdUliaU0wOUJZZ3pHYkx4ZkpLU01zdzNuZ3ZpMHdpUDFP?=
 =?utf-8?B?ZkZtQ2VwRHpudndkeDNRSFVBY1lKSGVRUmQyaHVXNVFZZ2pIZW5FSEVyZlc5?=
 =?utf-8?B?NzQyNFJBNnlWQzl6bzZ0c1Z0U3FyY3RPdUJReENVdWFYQnExZjBOVlZXUnQz?=
 =?utf-8?B?empTK2xhT2FwOGprek5xWDgvUUgyRzVQL1VvdVRObnl1clI5U2lPdVZQK3pX?=
 =?utf-8?B?aVd2T0U0cVNYcnpVR2Jqa3RRS3RqRDBGaXZ3elk5UlI4MEdVNFNTbXF4YVYv?=
 =?utf-8?B?NU40dHJ1ZURQc2NRTmpjeGVxNGdKRkhMb2tUa0hMdk5vRUNrUFdDZUZiRUJH?=
 =?utf-8?B?UENDWEZnMEsveVp6a3RKUWkrbDNMVk1aM0ZjNW1FK3RxMGljbjgrWjlOV0xt?=
 =?utf-8?B?RlY4NC94c0tYZUJKV052UVp5dGV3UXpWNU1qT0w2aGhIZkRtV091VWJUQVh5?=
 =?utf-8?B?QWlVRnRRWWl3ZTRJQld0dWVvK3Avd2QxeVJreTc1WkQxc2FTVzRjaEFXU3NP?=
 =?utf-8?B?ME1GMDIyQVhRNE4zVUJjdk44MnU3Ly9QTEFlZUI3cGlLczJ6R1VNZFZNOTQx?=
 =?utf-8?B?cTNBNmNFUmJsRGJxMHF1eXFHOEtQYW5ESDZrblhCdUJsVDlOYnA3MEE2NC9o?=
 =?utf-8?B?ZjhndWJRcVF1K3U2VFZldmF0MGxGSGRCQ3Fub2diSUM3QTRxOFhHVXg0K212?=
 =?utf-8?B?TnNVTjlPY1lqVW5DbG9jaHhKcHVTSmtqbGFIWXErLzFVckYzL1YwTXFrMGZV?=
 =?utf-8?B?WHE3bytKdTJmbnhGakdKL2NPbS9QUjFkWjVveGxvNGhicGlZU21namE5R0hK?=
 =?utf-8?B?S1diMUJxR2FCQkhXY3NERnVYNnBBWFdnL0c4Ui9ZU2xkL3Z4b1dhaHpSOXl2?=
 =?utf-8?B?Z1hOSUMycmg1c1ZZeWpCMkhQVjVYWGV1Q0tpc09nR3hSZFVKRklya1JiaFNG?=
 =?utf-8?B?ZWpGQitUalg0NW8zaExzY2JaUzRsNTE5VmYreHpQUjZkbkFOcDNNYXBVODhp?=
 =?utf-8?B?SUlISXUxTVA2V0NTM1Y4elh0RmFuaExFb0dKT3V1Ulh6T1hHSndBQy9iWExz?=
 =?utf-8?B?SjRGeWJnU1NpYmFqTGFjditGTHFNRFFTekZEc013UUdGMUNHbkpIdFNiak1y?=
 =?utf-8?B?eC9HWlJWRm9lUlIvRVBjekRWdER1YUF0dllrcFZsZmZVN2xvdFJFcUF1cmYx?=
 =?utf-8?B?Sk9ka0VOR2lWak5GUFpiWGI1cytPRG56eDlNYTlJN3M2dHplQWQzdUo3cXVi?=
 =?utf-8?B?RVhDTERhd1BFYy9EdUVNRStmSGVxMitZcGg2Nys0djd1SVluUGpQdWVxdHdz?=
 =?utf-8?B?SW1wL3JMbDRDUm11VXJaWmJXLzVONHR5MlFCVUNGQmlvMHV5R3VnMWUxbkp1?=
 =?utf-8?B?TCtuVXdOUFFCMnlrdEhFL1pTWUpTa2pTRWtHOUMrL3FBOHI3SUd0WXVRd0RD?=
 =?utf-8?B?WG1EWDhua0tNUFJJSTEyaGtoUUlHT1RmWVQxcFZ6SnpsRVliNGVHU0kyeEhZ?=
 =?utf-8?B?cUdFUFVOZDRTc2lKM2dGMHozaFJGdWtFeEE1Q3JCK1M5YVgzQTAzYk8xTEEy?=
 =?utf-8?B?M3ljNWV4SzNObERYRXMzMXo2UyttdE5nc3pGMXc2eEgrNzVEdjhPZjB4R2U2?=
 =?utf-8?B?QjVKM243UmgySmxnOUJMUnM2aDF6M2w1eFowUWp2RnRCRTNTNU0rRWFkSlk2?=
 =?utf-8?B?VExwcEJuZ3FBajI1eUMvLzUyaUNQdFlIS2lqdEpFOFozVjRzSFlydVBLUGV4?=
 =?utf-8?B?clZWTW95dnNlaTRDUjBaY2pNK0ZmZExTMjFGR0JVbVEwTnEzV1REU0VQZTR4?=
 =?utf-8?B?VUc5eU9uZlpqbVJKREVHa1lqYUQzQUpZMlFBeXVlYlpjcjZXSzRPUjJVNFBH?=
 =?utf-8?B?M3dSRDczVEF5d2twWUxwTzAyZk96WVY3aWZVMUUyRWxBa2tPT0NzdTJwcWtz?=
 =?utf-8?B?em5RdFNmR1h6cnB0cndBaVkyMUZFbUoyRWNxYkVtUDR3NklNNG5RVlQ4SzAr?=
 =?utf-8?Q?T6eC3WXXk5TKlHFg=3D?=
Content-ID: <7F959CCAF930234D974B760C65726B0C@namprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2f7245f-8b62-48c9-42a8-08ded1ba178b
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2026 06:30:32.2189
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cpwo8uEgsE3EW5N3+83s/C4FwCDhfX7wbib7aeNiZdWR127Y3JmrbEUJpGBZoHhA8cotOV9kuVXWB+rTUxfgOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH7PR03MB7954
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_233041_188082_93FDAF43 
X-CRM114-Status: GOOD (  17.78  )
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

On 20/6/2026 3:26 am, Frank Li wrote:
> On Wed, Jun 10, 2026 at 06:54:07PM -0700, tze.yee.ng@altera.com wrote:
>> From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
>>
>> Map DesignWare response-queue status to standard I3C error codes in
>> ccc->err:
>>
>> - RESPONSE_ERROR_IBA_NACK and RESPONSE_ERROR_ADDRESS_NACK -> I3C_ERROR_M2
>> - RESPONSE_ERROR_CRC, RESPONSE_ERROR_PARITY, RESPONSE_ERROR_FRAME and
>>    RESPONSE_ERROR_TRANSF_ABORT -> I3C_ERROR_M0
>>
>> Return -EIO for RESPONSE_ERROR_ADDRESS_NACK so bus NACKs are not reported
>> as -EINVAL alongside I3C_ERROR_M2, consistent with IBA_NACK handling and
>> other I3C master drivers.
>>
>> The M0 mappings match the generic I/O failures already reported by
>> dw_i3c_master_end_xfer_locked() so the core can retry transient bus
>> integrity errors on CCC transfers.
>>
>> Reset ccc->err to I3C_ERROR_UNKNOWN before each transfer.
>>
>> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
>> Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
>> ---
>>   drivers/i3c/master/dw-i3c-master.c | 31 +++++++++++++++++++++++++-----
>>   1 file changed, 26 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
>> index 06fdf8857b9c..45bde92d0342 100644
>> --- a/drivers/i3c/master/dw-i3c-master.c
>> +++ b/drivers/i3c/master/dw-i3c-master.c
>> @@ -493,6 +493,7 @@ static void dw_i3c_master_end_xfer_locked(struct dw_i3c_master *master, u32 isr)
>>   			break;
>>   		case RESPONSE_ERROR_PARITY:
>>   		case RESPONSE_ERROR_IBA_NACK:
>> +		case RESPONSE_ERROR_ADDRESS_NACK:
>>   		case RESPONSE_ERROR_TRANSF_ABORT:
>>   		case RESPONSE_ERROR_CRC:
>>   		case RESPONSE_ERROR_FRAME:
>> @@ -502,7 +503,6 @@ static void dw_i3c_master_end_xfer_locked(struct dw_i3c_master *master, u32 isr)
>>   			ret = -ENOSPC;
>>   			break;
>>   		case RESPONSE_ERROR_I2C_W_NACK_ERR:
>> -		case RESPONSE_ERROR_ADDRESS_NACK:
>>   		default:
>>   			ret = -EINVAL;
>>   			break;
>> @@ -708,12 +708,32 @@ static void dw_i3c_master_bus_cleanup(struct i3c_master_controller *m)
>>   	dw_i3c_master_disable(master);
>>   }
>>
>> +static void dw_i3c_ccc_map_err(struct i3c_ccc_cmd *ccc, struct dw_i3c_cmd *cmd)
>> +{
>> +	switch (cmd->error) {
>> +	case RESPONSE_ERROR_IBA_NACK:
>> +	case RESPONSE_ERROR_ADDRESS_NACK:
>> +		ccc->err = I3C_ERROR_M2;
>> +		break;
>> +	case RESPONSE_ERROR_CRC:
>> +	case RESPONSE_ERROR_PARITY:
>> +	case RESPONSE_ERROR_FRAME:
>> +	case RESPONSE_ERROR_TRANSF_ABORT:
>> +		ccc->err = I3C_ERROR_M0;
>> +		break;
>> +	default:
>> +		break;
>> +	}
>> +}
>> +
> 
> generaly this type map function like
> 
> enum i3c_error_code dw_i3c_ccc_map_err(int dw_err)
> {
> 	....
> }
> 
> ccc->err = dw_i3c_ccc_map_err(cmd->error);
> 
> Frank
Agree, in v4, we will change it to return enum i3c_error_code from the 
DW error code.>>   static int dw_i3c_ccc_set(struct dw_i3c_master *master,
>>   			  struct i3c_ccc_cmd *ccc)
>>   {
>>   	struct dw_i3c_cmd *cmd;
>>   	int ret, pos = 0;
>>
>> +	ccc->err = I3C_ERROR_UNKNOWN;
>> +
>>   	if (ccc->id & I3C_CCC_DIRECT) {
>>   		pos = dw_i3c_master_get_addr_pos(master, ccc->dests[0].addr);
>>   		if (pos < 0)
>> @@ -742,8 +762,8 @@ static int dw_i3c_ccc_set(struct dw_i3c_master *master,
>>   		dw_i3c_master_dequeue_xfer(master, xfer);
>>
>>   	ret = xfer->ret;
>> -	if (xfer->cmds[0].error == RESPONSE_ERROR_IBA_NACK)
>> -		ccc->err = I3C_ERROR_M2;
>> +	cmd = &xfer->cmds[0];
>> +	dw_i3c_ccc_map_err(ccc, cmd);
>>
>>   	return ret;
>>   }
>> @@ -754,6 +774,8 @@ static int dw_i3c_ccc_get(struct dw_i3c_master *master, struct i3c_ccc_cmd *ccc)
>>   	u16 req_len;
>>   	int ret, pos;
>>
>> +	ccc->err = I3C_ERROR_UNKNOWN;
>> +
>>   	pos = dw_i3c_master_get_addr_pos(master, ccc->dests[0].addr);
>>   	if (pos < 0)
>>   		return pos;
>> @@ -784,10 +806,9 @@ static int dw_i3c_ccc_get(struct dw_i3c_master *master, struct i3c_ccc_cmd *ccc)
>>
>>   	ret = xfer->ret;
>>   	cmd = &xfer->cmds[0];
>> +	dw_i3c_ccc_map_err(ccc, cmd);
>>   	if (!ret)
>>   		ccc->dests[0].payload.len = cmd->rx_len;
>> -	if (cmd->error == RESPONSE_ERROR_IBA_NACK)
>> -		ccc->err = I3C_ERROR_M2;
>>
>>   	return ret;
>>   }
>> --
>> 2.43.7
>>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
