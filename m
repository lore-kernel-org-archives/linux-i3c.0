Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC648C77B7C
	for <linux-i3c@archiver.kernel.org>; Thu, 26 Jun 2025 03:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NChZqUohLQH15G4nRRIqZHgwXM6CfIKaYt5MnKVOeQo=; b=HaOP6au27R14eR
	C6QBslLXyjSuX8kWF7Z62v3Ns0B4ykFSeNK6K5Ed43bFAHFrBY1RPAt5LNGlab7z+aeZai3u7MfFu
	UEm40xiDZR4ToECVtHEESLbOoT+0FBRdHsTGxw3YUtLrjdoPjitbBhczhk112dYk/4h+/Mx0sIXNI
	sex0tXvarewLkea+XyDJPCMeURoN+DKoDS3iLgkqZ9NoRt2qClJJK5RoNqTPkV51cLZnR+vYcSQxQ
	vaJQ8tIAuxL4gl7RGPH/ynfW5rwPJkVqI31auU/ENKXj4nqSm+/ACtgtQg9xtq8EMv2b9h12DsgyK
	7QSmMOEXWeV/hL3VjvuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUcvV-0000000AVIm-301c;
	Thu, 26 Jun 2025 03:05:25 +0000
Received: from [2406:e500:4420:2::722] (helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUcdj-0000000AU3J-2tE8
	for linux-i3c@lists.infradead.org;
	Thu, 26 Jun 2025 02:47:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gRmhc0TkVjY2fqLX9NlmZmfFqtxpEzg/uJciMFsLw646onzsVSdAcwGluuDd/QhnaN8pUIvmFyHQOs0/HS52CT1j0jXYop9Lv65V80DypL/L9qqKrQ4OyVouHMy7mSzlctocDchWjgkq0rAZOYbF0A9y7gMM7evcIhDQpD+dJHk5ekuJVT27zU4E7c4TRvn6aIaOj59Qp1Px7PunxfxkbVcBdR6HZQvDOU+k2j+0nM3m/Qgaz3eUVtkEesSj4wX83oVjNsmLBEnYtsWn2lNjCjah3AhD7F143JeIO8OgypQWvXOBKJ7rHLwwf0kWDmiR0E/LTkGN2oiADQE1hzQCvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SxuQBY1NjR+oLoLCMjTE62ZPH5KdbgeiXGX4WkBfez0=;
 b=E9xrJuWutFw2+F72VJOWPiKxM1Q+0zJrbzs9OlonIN7z8eGshn/n3QcTr1nE55yMVlsbZEpoKcszkDlz46ioEEN0q8q8ELnFSHipMwOjoHr+NdLDdepGI/aAv16WFETJNdzzovJ91C2B1rQaAVWdu3RVKz+i8YbUOChjt2hN43xdsOCHA6yGKm++O0p4wH3nsvdMtBA7lzB6GeHNb1HCISGQmmG4oEJyLLPULVIg+2qnCyrIXVA8fQfXbDyqSxgCoFlZ0ZMQJk4mMYokKbhcGqwDgMzFj8/+P/ipgjhbCWFMua4yGWSMadAjnacTlam/AcmA19Wm1vohc003VClqoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:20::14) by SH0PR01MB0746.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:23::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.38; Thu, 26 Jun
 2025 02:46:35 +0000
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 ([fe80::81c4:2724:6a48:a18]) by SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 ([fe80::81c4:2724:6a48:a18%7]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 02:46:35 +0000
From: Joshua Yeong <joshua.yeong@starfivetech.com>
To: Frank Li <Frank.li@nxp.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
Subject: Re: [PATCH] i3c: don't fail if GETHDRCAP is unsupported
Thread-Topic: [PATCH] i3c: don't fail if GETHDRCAP is unsupported
Thread-Index: AQHb5arwMOuFZSgdAU2B/a+5YiZAlLQT/0WAgAC+dIA=
Date: Thu, 26 Jun 2025 02:46:35 +0000
Message-ID: <26c2b49b-713e-4e9c-8bf4-0ffbd0b4b050@starfivetech.com>
References: <20250625073505.7949-1-wsa+renesas@sang-engineering.com>
 <aFwUx65gdpv6H6rU@lizhi-Precision-Tower-5810>
In-Reply-To: <aFwUx65gdpv6H6rU@lizhi-Precision-Tower-5810>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SH0PR01MB0841:EE_|SH0PR01MB0746:EE_
x-ms-office365-filtering-correlation-id: 43521c25-c415-44f2-b050-08ddb45baab1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|366016|41320700013|1800799024|38070700018;
x-microsoft-antispam-message-info: QJzubMOj52aBbtraOG6gYddenMAe3qbFq8uaJGb7v3QWQeTKJ3sRRUIW+UfzRFqHzHMt751DQ93TLa8+n86Gc4/Uv5wp34A+GNEY3oXB/jLu/wpYg0vqGN6YdBW2iI+iV6UNznAnhM7BJBKKzqXYjHE2aeYUUBKDnGppbZq62PiIyT4NZjaZww/vZlrS0oJRqdLE+66YjnrXMaMKA7AYV+qOlORjiOQqK+1wg/tyOrk4L4GPIXasSkd2URln+kAZ6xmKl80YZHyR0/YdIz4LQU9S0mF12gUZuZ6DwvRzwnqRdyEWK62YscyUma/IvTqto+B2ItM3FjBg6Ao6wqH3YdlTHCrkDESxqm5OitTax05cJKjYCTjhdWwlceoCUmeaLiOtji4NGlQV4/Uy8nBtp3LJTvry+yBq0do4n2KrCGkUfqOULaqYdxlwIBO/rw3IwKhS7EnmdXcNiCrffvGm0bL4nNflG5Q3NqOX3voV/DJiUZ8kp0KGaV6vtLs5nQV1WZecB2LiEWorLSF/FiE9m9r+VqmZHMBMUQzwbrxJodyfSmCvt6kbjBh4EMXvoXHpa6L3GLKeTk6um5S8l8GTRgz9MxlVfIitA6X4Rn8SE7M=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(41320700013)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QWdYVHNEQXVQWkQ5OHhidHN6NWNmUlFjNUlpdVVPRHAva1p1NHhEeGwyRUlR?=
 =?utf-8?B?K2NmeGxFZCt1WUIveXh6Q3F1MkhpeGIvRE5CK2R5NEJRbGpqRzF2THhWQ1RI?=
 =?utf-8?B?R1UreGRkVTI1cmxpdVZOMTR3VCttVWQyNVBaVGR4L3JucmlpRHo3NXVKWWZi?=
 =?utf-8?B?VXEvNmlJQkRGaExJNUt5QkdJSFVLSXZyUENRWXdlZVlTMk91cGo1WFlMejZM?=
 =?utf-8?B?eWpkbENLY1IreGlvMDREdDRiancwaG5KN20wWmZPZGdZNEQwWExZZVNncmhJ?=
 =?utf-8?B?OGtPcG1kZy9WdTh5WGQ4dXMvbysvejBRalc5Q2lIWlJKWmNSL2RicCtURUdv?=
 =?utf-8?B?UXBlaFBwdnBDL1ZsMW9FTmFOb2xpdGJ6UENXb2ZOdCtIM3NsQlpKektJbVlZ?=
 =?utf-8?B?c3dGSVZ0OG14aFJ5cERuV3pnM2U3aFlOZHB3aFBHdWwybFByNDRWWFNybENW?=
 =?utf-8?B?K0gwckVwRzF0TmVzNGJodThMUzJUZEJmeDRmNzlkVmp4a0RrMUJ0TTFZVFNk?=
 =?utf-8?B?MHBEZko4OVlhSUxPUkxvSkJieGV2a013Y3A4WWs1OHZXTGwydGZxaS9IcFdu?=
 =?utf-8?B?OFpOU3ozU3JPTGk1Y2Z4UXN6SnBVRjkyNWMrWjN0UHdPdzVUM0FWYys5M1Iy?=
 =?utf-8?B?Ty8wL3pZQjF0ZG9JNTlwUUdMWFQ2Ly9SbjRxdG1yVU1BeXErYjlMNkl2WE5m?=
 =?utf-8?B?YnRRQVJzek8vaXU5cmt2Zk1MNkdPR3JGNDg5UEU5all1cDM5WUx5UFIzQ3Vu?=
 =?utf-8?B?UmtHdTQrY0NQeGJTaUhpeFA0WGVqeDF6UEdyYWdqY3duYkRZY1JWV3Npcklx?=
 =?utf-8?B?S2hFSVM0eno2bVB4RU1idzBPSFJvS3lUcWZYNk9qM0FnUXpnV2sxa0pQello?=
 =?utf-8?B?U21zQUYwT3E4SEhGdCs1UTIxR1gvc1RJQnI0K2diZitSbHl0UTVFYVN6WFpn?=
 =?utf-8?B?VlhTUUhDWGx2STVocXozUGowRFE0TVdJMys2S3JSZkc1amsyQjV3bnoxQTlL?=
 =?utf-8?B?aXV4THA0MzlBMFY2UnBocXRUS21FUWVvRTFvY1lzOWRERzBnWTlraENGY096?=
 =?utf-8?B?dXZqQmNDbGdPdUVXRWtMaU5Dbjhpc3NmRXBLNVl4VFUvYkdkckZYeDkxVGxE?=
 =?utf-8?B?NVVzdEFZdlJDc1dsK1M2VjZHZGFtVVhSdityYUtVVUVUZUs0dUxROFA2SUVl?=
 =?utf-8?B?TUF5VUZLclova1JUdThGaTI3NHVtRmZVTDlxYnVxUlIwQms5NHlxeWxsZmlC?=
 =?utf-8?B?Zm9TbHVIUFU3SFZnUjdma2R4aVlFdENaS3h2b2Y0ejFEa0l1MWpSK0s3V28r?=
 =?utf-8?B?M2FXS3B4d3hydjk2RHdGa3g4ZTdnOEVINSthbDhrNjIwN2s4alo2Y20wRnhz?=
 =?utf-8?B?c2xUbk5yakJqOVZrRENlbTYvRHZWYStZLzhhbE1MZUYzYnNsNnlYV3FBd3Vm?=
 =?utf-8?B?TnBQOCtVNzlzdXNkWWtmU3MxLzNFb0NEbW1yRUpZZGpYT0M4ekozQUVMNjUr?=
 =?utf-8?B?bjdKaHJWaFR2emNtalFXSGRwK2dhOEx4YzZ5cVNPY0VjUVFZU1Z6K2UrazVC?=
 =?utf-8?B?ekNQMjdlQkV4RWw0akhka3grWm1qMTJzVzhDQUFQeTZMYVpGdDF3YkJLTTIz?=
 =?utf-8?B?UGlpbTJyelB0WFBYQlZVUHpyTWFxeERud3djL21SREV5KzBxdExZZTh6UGxp?=
 =?utf-8?B?ZU5wL1I1TGtaV0FMZktFUHRHRnZVNW9Ca3ZJcm5qUFdzKzgzY0NRNktnUllk?=
 =?utf-8?B?cGMrakMxanZoN0Y0cjdqbS82aDk4MnMwZCtVY0ZCeG5rKzlJMkhINW5BUEF5?=
 =?utf-8?B?WllnUDYrTS9BYWJrQVdtVXhIU2djeXJ3UmlESlQrNU9RNjU3V1l5ajl1c3Fy?=
 =?utf-8?B?ZGVjc2VyTGFrbmlIdEdEakRScGpqTlNHR3VYK3l1WWtqY2JqRi9ETVJldkZn?=
 =?utf-8?B?ZFdxenVqZ2RzUmI0MDMxcmMxbmFmdVNTVUpQL0I3L2V4RTU0L0p5eUE3Wkky?=
 =?utf-8?B?cEpKUk9DRm5XV0Z6OEI5Q2EyTndoOThFTjhvbnJOdDVDMXVjMmJQMjdjVXVW?=
 =?utf-8?B?UmZHYzc1S1pJTkFQM29MeVFEMm9mdWdJZnlpRkZlaG5WaVVjNlB2N1BJT1Vk?=
 =?utf-8?B?QXpXRjhSeXZKSnVTWUp2dWZlUUtXL3gzS25GeE1jUjI4ejM3Z1RJN09IMHN4?=
 =?utf-8?B?a1E9PQ==?=
Content-ID: <051821FB34141C428F800370ADAAF659@CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 43521c25-c415-44f2-b050-08ddb45baab1
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2025 02:46:35.5200
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 31ZOjoVArbMWMWhdYJBZbkWysd+NYWaUWFRAdw3nsUn7/bk0KmILkfCkyL8H3WUjRIKWEXnLEgO3mGn+C0OB2jTPlSgm/1/LDTZvBYGfs5Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SH0PR01MB0746
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_194703_731405_953812BC 
X-CRM114-Status: GOOD (  19.41  )
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

On 25-Jun-2025 11:24 PM, Frank Li wrote:
> On Wed, Jun 25, 2025 at 09:34:52AM +0200, Wolfram Sang wrote:
>> If a target has the HDR_CAP bit set in BCR, the core wants to get
>> additional information using the CCC 'GETHDRCAP'. Not all controllers
>> support this CCC, though.
> 
> Do you know which target device support HDR? I3C master API don't HDR yet.
> 
>> This is not fatal. We can just skip it. The
>> information is not needed if the controller won't support HDR anyhow.
> 
> This is not fatal and can be safely skipped, as the information is not
> necessary if HDR is unsupported by the controller anyway.
> 
> Frank

Hi Frank

I'm use `MMC5633` to test out the HDR-DDR functionality master functionality.
The patch can be accepted as some controller might not support HDR.


>>
>> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> ---
>>
>> Found during the I3C plugfest in Warsaw.
>>
>>  drivers/i3c/master.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
>> index 204b96e6be1e..b6b96cf9e4e0 100644
>> --- a/drivers/i3c/master.c
>> +++ b/drivers/i3c/master.c
>> @@ -1440,7 +1440,7 @@ static int i3c_master_retrieve_dev_info(struct i3c_dev_desc *dev)
>>
>>  	if (dev->info.bcr & I3C_BCR_HDR_CAP) {
>>  		ret = i3c_master_gethdrcap_locked(master, &dev->info);
>> -		if (ret)
>> +		if (ret && ret != -ENOTSUPP)
>>  			return ret;
>>  	}
>>
>> --
>> 2.47.2
>>
>>
>> --
>> linux-i3c mailing list
>> linux-i3c@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-i3c
> 

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
