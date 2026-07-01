Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52FBCC43458
	for <linux-i3c@archiver.kernel.org>; Wed,  1 Jul 2026 02:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vgprFSULbDJq/rbOod4drDw/n0lavhnDwwi0OVSFgbo=; b=qVWE6qgG4V5rFI
	992C/zVx4r5K65p2Ie8h3MCL3J/OIs65xbGlCFhAsW6uAg3JY0WRO22a+76Xa9MOiuRmVFosLRZJS
	5v+6fyUT+Q2p+1lNOkKqEcuMjmJuSFNDDr629DyN+yX7j0LTWAV+RR8jkeeSxv0eXhw2x19ME4L/2
	xT9XBbY/xuMm+96xq5wWLF2+UdwaluMLwFR0f49NY+PcfTUZoGNyqDRyRMB+W9r6u5slqPXfHy59u
	R9Snipe6It1PPABuSCGDppbGOZGEIqbPdnmpKlluIrUsW53NK4B/emxuaa+AJzDrwqhYzcGzz2b8i
	GQlaz7F/MK45qogYNIyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wekyc-00000000XkH-41wU;
	Wed, 01 Jul 2026 02:47:02 +0000
Received: from mail-westusazon11012059.outbound.protection.outlook.com ([52.101.43.59] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wekyZ-00000000Xjr-31bX
	for linux-i3c@lists.infradead.org;
	Wed, 01 Jul 2026 02:47:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XPHGK8q/Fg2rLC21jQQep0e5thz8YzgMS6Pvu43hpj1L0KbAHJq+iGD2idG16+Al73pC7vk7MC6B2LHM1+vUWk8Xvvk3KX+wJwPMHEBzKOaKUqS94+6yvUIJ+aICIn//tw0E9O8qFNOs/HsBWXGsQnqyTWvgw9Gm0CWWq8zzR1PI6ibmEhoPxN3rneg/AXCJXEdqM6VzGESjraoPDwZ9rYr5w5Xw2+KuzCzjb/D47i7VG69QhxZhQCuOtTVqHH1HOJ8fGv1DXOUxbULl9AyMo8EyHxi67SBerNepgR7fSpXflS3HjDXh3iODgAJlfijCjkayxDk7DdN5zdNszWl20w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wcnYbI9cwpA76po/O8KLLmDBojU6JHQweBk0LC1VgCc=;
 b=T3Dak6UdhZVXlEESLFuac0CEdonsqjR6UfgT0N4lo84UEk9ZDjVQRLEm7VeboW7GjnFJTruQtkfSCyiEGG7ZQoxGSN09rl8+hOSFa2X5vX7lOB53vQh/ETjKDira51lJmHzD9fhwric/GC8l/a7lXlhCTe46HBJZBWAyzSoOxT5YAujz2d761XnhVNz/V8SWk07amIir3iA/fojw5rXzydUjYB54QuiDuz25xuBy2SyuN+yxnOHgadXwuhgLNwZNP1kajVa9zTGeTC2WkEdlL4EwYTd+SMK1zoC8BKuUogoHE9+UTBoxmJtT7WjNxT+tGAJ+JbCFl4WBbAH3AejlEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wcnYbI9cwpA76po/O8KLLmDBojU6JHQweBk0LC1VgCc=;
 b=ncmwZY9n3QCtsvQxEztIWTm2fQ8Cf83ZzxFNqvLbK+dK2qT3hl5NxtrsDCO1LwS3QDyuOsp+2mrIz9cZae/HHKJED56tpOaYlPrXYQTX0s3/jcT69+l4mZ2pa86Cq3lkP/Nd1tFS+Kyb9qeg5amCrNfrjyh/78fsbZ0+GBaakGfMCXPUkPOp8O1gAaXDzqZH+Y2eCGNPiYAZ2qbodmCHimxfoJQ5F2cdKfsqhiNWX24AOXItJ9YM7vNixn7B1V7ZEENbfQ3cn26vHVgqlKE4TVdRp+gvL+lQm+P5V7WRSxID9ulycDdrWz0xdoA5rk0ItRjG2/o7jDj7wwtjF9G6jA==
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by DM6PR03MB5306.namprd03.prod.outlook.com (2603:10b6:5:243::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Wed, 1 Jul
 2026 02:46:54 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0159.018; Wed, 1 Jul 2026
 02:46:54 +0000
From: "NG, TZE YEE" <tze.yee.ng@altera.com>
To: Frank Li <Frank.li@oss.nxp.com>
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
Thread-Index: AQHdCJM6q1TT8Qkxikud8GTrgU5NsbZXU5QAgACjBIA=
Date: Wed, 1 Jul 2026 02:46:54 +0000
Message-ID: <dc82ea6c-77b0-42b0-83bc-928d8e05410c@altera.com>
References: <cover.1782824628.git.tze.yee.ng@altera.com>
 <b99393b7761ff249dfd147b5ac028ea2e48915ce.1782824628.git.tze.yee.ng@altera.com>
 <akP23nXJN5sBNb8c@lizhi-Precision-Tower-5810>
In-Reply-To: <akP23nXJN5sBNb8c@lizhi-Precision-Tower-5810>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB5950:EE_|DM6PR03MB5306:EE_
x-ms-office365-filtering-correlation-id: d2feed4a-e8c3-4933-3fb1-08ded71b02dd
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|7416014|55112099003|18002099003|22082099003|56012099006|38070700021|11063799006|4143699003;
x-microsoft-antispam-message-info: cSfoI/iYTHRl2cOIrS5gFCnRgFUsNVdFQF22ZU/Wlo8Qm6LKAhWbrUgC37ZvyIkiPeK7Z7taAgzwh5msInWyq4NAIIY+2F6LbPV7e52h/b7oANd4GdPrbvQQpOArM1J/CLa3Fdy3GqdDOdudgzNdv5GfB+t3wEl233ivAv+5bZ3hlzMGfe1y9N+ELADbc1jtZyl7TrHpOgGA8kAkUKwaruELHhcVP4Skr1y7vrzpdFlUTmdogmXK0lzvszlUrQC7ak467Tk6sPnD6q3Bn+Wcs59gArQQYgeN15uhGrkhQXXNhhExetdbthuE8YtO8pEGfI/7MLfhKBQ3JWaGVlcyUk43vGgP5vKiTMwjwuSlSGAaLeYBlym6tRMeccUDKnn5uAZ+FOLGcLdWxIUacnojCYOIkRAun+1UxgFLqKDDOS4jzazdc3zNQwzCeYu+llpQtIgGj9V4ahkexf/TRWEn9wsJCArkfcaS0y32MgmYbEjOojssP6S7/WXsKln9//9nAEql3+wnCxcTV/KIBg2Yc4WTEMrBA9U/2GMku9VVuoeyasqMN0zNWH5kzBYb3uZDiBkHAAdaq3iWtv4MknrwDZM318iAZ9E3f2UhkNRxK3FnghpTbLvZFGiF4HxjX2MMrATHdWcShsMwk1HultUt3mwi2KR3CbdOwFo5DwUpfFnZVK7Muv+1CoZywdTuK7xRovTtgnttDGb8CvQePwgbhD7vMNbqMDujFaDr/TrNMBc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(7416014)(55112099003)(18002099003)(22082099003)(56012099006)(38070700021)(11063799006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Sm4yK01paWJJM09vaFpYTGdBSklrMUhMUUJYUXJDbENma3RQQ3o5RXhhNFBx?=
 =?utf-8?B?SXU2eDNBUVRnUWJvREZPcDczMkVnS3JpUGlZa2ppZFk0cEVnODZLblNoRG0r?=
 =?utf-8?B?ekI3cTZCWm5Dc0tDMTFUWlQrQmRnOXJha054K2QzREd3RXJ1RzA1WWFtZHFx?=
 =?utf-8?B?R2dXb0lqUmhYbGoxL2VRY1NmWHNjMEFxQmoza00zNStoK2xKbVBFeHU5bVBX?=
 =?utf-8?B?Y21DUWpYL0lWL3NrcC9yd3NYNVU4Rm8rbkxESFpGYmVKZGRFVnlraEkyc3ZF?=
 =?utf-8?B?SW82eDBBQjRxYkNCalhCYTI5OW14akpkM1JoTG4zVGpsWkhMN2dsQXhNSFBJ?=
 =?utf-8?B?OURxOFhuWm03a0YvbVJFQW85QlJQNHZ3VDg4VVdZMFR4KzRHdDRvYzJWNUwr?=
 =?utf-8?B?L3d0Mm0rY3N2bFZOS2VOeVo3NzhCbThoTFdmWFA1QkE4aEJqWHFqeWpsaFJl?=
 =?utf-8?B?eks0bVJ3Z2JIYXZ3by9VN3RoeCtZenpqVnd4c0h6NkJFK05YTCtwZk5LeTlQ?=
 =?utf-8?B?YnM3bS8xUnptck53SE5XTk9jdUMrcnJZaXg0VllRbEtnUnZTbkoza2liTEo1?=
 =?utf-8?B?YWVabmJrOHZGRmhIZFhKamNGRHhUS01zTVdUWDJ3aU94bWJIV2lvQUx5d2c4?=
 =?utf-8?B?T3hJendNZ3UxK2VtUHBTZEg3TjRJdUpRYTJaUTl6TW13aFBPTk95eTZ2VFkz?=
 =?utf-8?B?TUNJQlZtWDBVSS9TL0Z6UEVVQVNybjI0cUlsVmFBSFFYMHJsdnc5NVRYK1dL?=
 =?utf-8?B?c0N2R2oyVFNlVi9DNU1oUnJNdFVjdUM3enNZK1JjL2Rud0UwSzRiUEVIMWE1?=
 =?utf-8?B?bkpjRks2NDdQNWZac1h4SVVCcTRhTmcwbEkzN1puMTZsZ0dsS01adVZBWGU0?=
 =?utf-8?B?RlFSeXFHSWZUdU9VQlo2d2l0d21nTmx5MFgzdWprV3Ztc2JNZ1B0Y1BUcTRm?=
 =?utf-8?B?UVh5UFZwWmdyWE9WL24zaW9BQmpOUDc4VmIyeVp3amtoemVTVEFlNVh5YzBa?=
 =?utf-8?B?NlZZdmpoVHhTOVg2bTFSVjVjMnd6QWoxbi9HZGpmY0NVZ2hEc3N6YjlOSVBK?=
 =?utf-8?B?dEVob1RrQjl6bVJ3bU9ZellBcjRxOE0rWDFkc1M1akVKdjJnVlMraHlhcEFj?=
 =?utf-8?B?eDRjNVErVWtSN2h2eUp2T2JGWWJHbXY5blNMY3ViTWRuTFl5VG11UHQvMWty?=
 =?utf-8?B?UTd4cmhieEpnUkdtR2RaNzk0TnlQRUN4M0wycVdnSmJZNkluUGtsN29NeXU5?=
 =?utf-8?B?RUZWenRxdEFORUt0OWkrb0EvOTl2bnlMbVVjZEwvSTNpNEJ6YmFtY0xRSVh6?=
 =?utf-8?B?UHRaaDhiTUs3bG1oaWpXZHFYMVJ1WElLUEtVSUtkMi9SV0dXdURTVHk3SjJw?=
 =?utf-8?B?NWRzSlBTN0loNzdjQ0V1b0ZKcStSVktpU0NqSXZxZkx2cndnV3Y0dkhqdzdG?=
 =?utf-8?B?bXhWT21BQmJmc2FvQTF4MXNxOTZOYUM5aStBRnZPdHVmeWVPak10VXhDRFdH?=
 =?utf-8?B?YmZKVW1nRmRIMVRUcXk5dUUzalR2MGQ3ZU1EWjgyS2paQS85MUhObjRZYUFk?=
 =?utf-8?B?aksyT3piSWlTa2FjM2ZMQzVtTVgyamZBRGlSYzlpc2srMTFJRDVML1hOQ0Fu?=
 =?utf-8?B?M29kZVM4MmVtYmR0QW1BdDF4VHM2cXdqZW5GQnd1Y2lkTTRaSGdSamlTc2dh?=
 =?utf-8?B?emRZRjBxa3l2dFYyYysrcllpeEZhUEVwYkFXa2NveXozaERHRjhLV3F2TUNO?=
 =?utf-8?B?MjN1dG9JMWhBS3lNMnl3TVgxeFZyKzFXQjJSVDcreUxSWmMrY2dMMmdnS0JY?=
 =?utf-8?B?OWtPNm0xRUhZQkV1d3N3bGltUkpnRDFtMTI1bENBbHA2QTVZSm9aeElCeWgy?=
 =?utf-8?B?a0xzMk9Ka2hDWGNJOVdsOWt6WmRDNUdCdDE2S0YxbGtRb1h4bk91eHA1aU82?=
 =?utf-8?B?b3hYMVpwSE1hVk5QLzFsc1pTMXdsVmwxQzRFZkh2VTRHZm9yYmVTdHJQWHdk?=
 =?utf-8?B?eHVOd1VFY2lsV3N4T0l5TnF0UTE5ZXBERk94R0wxcXZ5aUVpYkNaUG1WalVN?=
 =?utf-8?B?UkRFQko5SklTa2RwVTlPZXVIeDU0QXJIT043MlJha1lxdWdIdGVRRmJXdmtq?=
 =?utf-8?B?RExVNkt2YUNwQy9yWEM5YUJwbktuWDNuWk9jK0ZMV21MYktQYlpDREdjUEpy?=
 =?utf-8?B?aXJaclJlWHJWSVJiWXd1K2R2VFAraTEydlY3T2l1QVZzTURyOWJ0Q1NvZ0Uy?=
 =?utf-8?B?eW5sMEdpeGdFQVFRUUxUL1o3UGdhMHV1ZjdpUWQ5MkY1a1dkdU45YzRqYkI1?=
 =?utf-8?B?NFg3dkN5TUtPeG8yNVVnV0poVFdIZUp2Wk1VeFJNVzVpcGIwTUZsdVJTODls?=
 =?utf-8?Q?uUAruKajZZRZCMoA=3D?=
Content-ID: <50DF2039DE0E8743BFE6F21B8E30896A@namprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2feed4a-e8c3-4933-3fb1-08ded71b02dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2026 02:46:54.4730
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eTwJ5LykyvVSnJt+mxhaI3CCDVAflsjiddFLOKtMjmR9Gy9Ity4W6C0g71Zk/caY0vRSHYYgSUzd8PQBfmqyjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5306
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_194659_825908_938B2128 
X-CRM114-Status: GOOD (  17.04  )
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

On 1/7/2026 1:03 am, Frank Li wrote:
> On Tue, Jun 30, 2026 at 06:20:25AM -0700, tze.yee.ng@altera.com wrote:
>> From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
>>
>> On successful GET CCC transfers, set dests[0].payload.actual_len from
>> RESPONSE_PORT_DATA_LEN so the I3C core receives the number of bytes
>> actually read. Add actual_len to struct i3c_ccc_cmd_payload to keep
>> the requested buffer size in len.
>>
>> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
>> Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
>> ---
>>   drivers/i3c/master/dw-i3c-master.c | 5 ++++-
>>   include/linux/i3c/ccc.h            | 4 +++-
> 
> Can you split into two patches, first patch just add actual_len in ccc.h
> 
> Frank
> 

Sure, I will fix it in v5.

Thanks,
Tze Yee

>>   2 files changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
>> index 655693a2187e..856961da1827 100644
>> --- a/drivers/i3c/master/dw-i3c-master.c
>> +++ b/drivers/i3c/master/dw-i3c-master.c
>> @@ -742,7 +742,10 @@ static int dw_i3c_ccc_set(struct dw_i3c_master *master,
>>   		dw_i3c_master_dequeue_xfer(master, xfer);
>>
>>   	ret = xfer->ret;
>> -	if (xfer->cmds[0].error == RESPONSE_ERROR_IBA_NACK)
>> +	cmd = &xfer->cmds[0];
>> +	if (!ret)
>> +		ccc->dests[0].payload.actual_len = cmd->rx_len;
>> +	if (cmd->error == RESPONSE_ERROR_IBA_NACK)
>>   		ccc->err = I3C_ERROR_M2;
>>
>>   	return ret;
>> diff --git a/include/linux/i3c/ccc.h b/include/linux/i3c/ccc.h
>> index ad59a4ae60d1..d8052949e57e 100644
>> --- a/include/linux/i3c/ccc.h
>> +++ b/include/linux/i3c/ccc.h
>> @@ -343,11 +343,13 @@ struct i3c_ccc_getxtime {
>>   /**
>>    * struct i3c_ccc_cmd_payload - CCC payload
>>    *
>> - * @len: payload length
>> + * @len: requested payload length
>> + * @actual_len: number of bytes received on a GET CCC (filled by the driver)
>>    * @data: payload data. This buffer must be DMA-able
>>    */
>>   struct i3c_ccc_cmd_payload {
>>   	u16 len;
>> +	u16 actual_len;
>>   	void *data;
>>   };
>>
>> --
>> 2.43.7
>>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
