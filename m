Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D5B3CD98CE
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Jun 2026 07:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CHkUZfijZcUDoda+pkBmwE8QhQx4USN6Js1UW/VOFKc=; b=rEx6wFMIoQONQE
	h4AdDQZ3Gt1rVZeyolYb5QDQXjR9/kEBINUqShLE9AD1GiIn3ny/inh6Z1jY7SyJY84s8DCTNAsvI
	VkZjPPxpSnDiuduU5tREPZoKWQRmAT0mxUgtsHsNje2KmXFJYpcv/qEZvdFFcd3UwyPwUZKuWe40r
	MrE7S9KFDulYRoEqzwZHRktk9Pzyjq7ioTBDKcGNGF66ix8N5zTlQEpOB+DgWcyriX0QYtp2u2NBW
	1CNUaKDy/6/KfqcaLIaiQciaoxv+BSjF3/g9Wpccc1NpE0NhsPvxRmY/Re46eanJREmNPsB6py8iB
	0YUzmBF088YKEQa1AuPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwU1-0000000AU77-0qCd;
	Fri, 12 Jun 2026 07:39:17 +0000
Received: from mail-westus2azlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c007::2] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwTy-0000000AU61-3JRI
	for linux-i3c@lists.infradead.org;
	Fri, 12 Jun 2026 07:39:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lo6r8UCest51IsT+Tjk63qR1ACcQhVD7Q7tvpdUIgtUf7CEZnwEKTNv0nlewyMzY2SvcdTrvSWBDy6NJLPeyzZ71xmBl/wnNieFItefwh8ewatgAwLvuyMhPdVw2IhJN9aUqtfu9JoZDvws2uYjUizvLpvXgR59ItWzdVkFUy0pzFjYDlh9KywQPW2vgNPSpndyJXTNCltfrovACdhdahj0cYH8qwLnuKcA46JNjZ768DBGRmKQ8XQf28Hi2ELSIJlVs5EFgmQ9oapsPmzZLBLipJmuz4MkUdynCR5ALdx2VqsNURYqArnO3SayWH/1X09E49ZSHygRvATWt403IdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=04ly7LrqnxbKD66m8MU6awbcDEYv7LPPgdk9O1GJuTc=;
 b=ylSTHMH9lcaEu+0ybwOOShawIFcGUZIUMZyg4JdlplRhdO3iOKX8I777KxMbDPYMyVnkJmIb3Repdrh3AtF5gBPFwuUeWB6fJPAkk2ZGeq/v62QLBkN/nwBA9LnjwAQytM6MuI59FnbeLvRvjciBdtFarY7ek0j7y96eeJMQHsdoKuEO0PR47rClf7eR537u+WuCHaYi+0Vs4xySrG06fOdu48LApdzLnkaOkllP5oDU6QZkPauGwEPh01hXk3luh4PqdZ85VDpWdEasA18UbaFL3ljEwrW3gHVSyW+4sbMaH/wy/K5Bbd3WzyN9UJ/4ohJY7X8YwGhVccrTKaUiYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=04ly7LrqnxbKD66m8MU6awbcDEYv7LPPgdk9O1GJuTc=;
 b=Dnxl1/+UXFKINgDt0US90hsx/9rfjKWPuyv6pTGvJZFh9OIE++GufzbGdVgxgR7MuZT+RNIAEqqNUKo0S3Yk8UQz846qTOI1JJTTUlqs6D5h+mhsXI6bmVp0Vme0yeasjJswR1bKg6fUgZ/h6pA4D/kRkoBZC5OyTQyHesYAhx2qE5zcb1nRoUb124C5NFi3+xXsi5k5Lkb5hcZCvOAsLMiDrWOrJqkZpGTqfN3nSQe1be/QitEe1Ob/0T6gdK+fUvBwoJFGPmPtQU+5wf9u7tcDju9K8MNnSH8qzENKTuzcrL9yqdBgXz5hnSyERcm0QUwFBhYHrT2prdiykALv0w==
Received: from SJ0PR03MB5951.namprd03.prod.outlook.com (2603:10b6:a03:2de::13)
 by IA3PR03MB8408.namprd03.prod.outlook.com (2603:10b6:208:546::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Fri, 12 Jun
 2026 07:39:09 +0000
Received: from SJ0PR03MB5951.namprd03.prod.outlook.com
 ([fe80::f285:8376:68af:6acf]) by SJ0PR03MB5951.namprd03.prod.outlook.com
 ([fe80::f285:8376:68af:6acf%5]) with mapi id 15.21.0092.017; Fri, 12 Jun 2026
 07:39:08 +0000
From: "NG, TZE YEE" <tze.yee.ng@altera.com>
To: Frank Li <Frank.li@oss.nxp.com>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, "NG, ADRIAN HO YIN" <adrian.ho.yin.ng@altera.com>, Felix
 Gu <ustc.gu@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>, Jorge Marques
	<jorge.marques@analog.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i3c: master: dw-i3c-master: fix OD timing for first
 broadcast
Thread-Topic: [PATCH] i3c: master: dw-i3c-master: fix OD timing for first
 broadcast
Thread-Index: AQHc+LEozGDrj02IiUO6j7w7qF/viLY5itoAgAEA3YA=
Date: Fri, 12 Jun 2026 07:39:08 +0000
Message-ID: <69ac2725-bb2a-4815-96ea-397c01b9f185@altera.com>
References: <ebddb8b62eae92de0a7eeda93cb18213c677ae96.1781077653.git.tze.yee.ng@altera.com>
 <airgIomzsbZnRf6X@lizhi-Precision-Tower-5810>
In-Reply-To: <airgIomzsbZnRf6X@lizhi-Precision-Tower-5810>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB5951:EE_|IA3PR03MB8408:EE_
x-ms-office365-filtering-correlation-id: 29b4d7f0-e6e7-44e3-d7f6-08dec855b048
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|38070700021|18002099003|22082099003|55112099003|56012099006|4143699003|11063799006;
x-microsoft-antispam-message-info: qPH9Wx522cYRNxyUW4zul9oBFFXtKutT9d1sghf93m4zpBtRs715UsRhGqT3Llu3H4NEA8pOP2soHvuEHBYwoZf1bJKDDvn/ePk2aXhC1qJ0EDtaDWZhGyrxlWjw6q4xKTjbrWyFOka5+d3vHcf+e2mdFXneXbsHyhazceymgk7JWDGecISnZ7OZC0ztqZ50ZRwi+escpIQuK+raP5R+Q4dnwHcHR/u7MRHWi70vLGrPUW/0XRJplD7tw9ojolBsdid2G+eNoNCw8BLCWJShuS1Junn3dR5Z6yjs5xeh2LcQXsSc7Zx5g1xWmL8C4GLd4zARZ3faTrlGJn7YCcdSwXeTA0OCBZxTpuXEm8XUl0HrAO3sJRVPvhZDX1iN4NgoyWgOto1LjI71YSpC49OBZ5Bt7exJ4qpJ/irWvmX5xPDtFWbXMnx+qgv19c1vuE3ZdwLOisCL2qddJ14E91ug1xK5DfVROepONQcUaEe1W2VVHC2bwYF7hRNnSy87zjO3eP1PRamBsteP/HV5NtT97t4YF8WDc4nBQeYJZPydDNK24qfX64royYgo8UhlS3QZ24Zx8Bb1oNnK/eHFZs3X93NmvsY5K9rw2/bsPiKIlBT+GgB6r54xmiq3mj1bZl6B2L9h/W09lgdCL/r3plFtc9MNVVcG7vpC6WBM3q91sXRElNAij4Mh6HnCm8OZu3iphiOYU6UncFrbX7prHdUmmMS/Ke9zzLVSg5mS895cat+M3wwsKuHZxSQsOhUhbDFW
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5951.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(38070700021)(18002099003)(22082099003)(55112099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cFhsTEtRVGVXenYrdE83eWVuT1V6Nnp5bEJsK1BZbktNbzloMnJQbTlkaXFz?=
 =?utf-8?B?Y3VEYmpMMW5TV1FZWkc0RityNjE2S2pZc3Y2cVV6Z3ZNWW1aNWNIc3B6WC9r?=
 =?utf-8?B?dEZNbm1nRkcvaG01a1pwSXZqUE9xSGRwWHlCaFlkZjl6SXUwWUtWcHNmT1Fh?=
 =?utf-8?B?Tml2WUxJZSsrZ0c5d3hRZlA2RTNZY3ZJM0VtT2ZGNUZGSnR2eUxidGVMbS82?=
 =?utf-8?B?TEorUTRTQjVXZGsvVDY4VzVMN1FmblB0ZENRQzdza1NIMFNCYm51Wm5QbDBj?=
 =?utf-8?B?NXcwTDFFTDZMdWxtQjF3ZmtSaWVBVnNZeWg3ZTE1ZGhQcnNJeWpGZGJ6a1E3?=
 =?utf-8?B?ZkZSV3N0UnJkcldBSzdIWE9PMkF4Vm1mdGZncXRYSUEzL3NxZjQzT1NDYXA1?=
 =?utf-8?B?VWFmVFJRUDNKL0hvb2J6bHhMVVJ5STVOTHJDOEx3cmJ5ajR1REdaUkVEWGRo?=
 =?utf-8?B?OEMvc1B5RXVFbnNVNyt1c0lrTHljREZKK2Q3d1RjZ2F0cjFwZFhvdkE1dnJy?=
 =?utf-8?B?aEYzc1FZU2pOMUNMLzZhU0J3UVhXTDBOMDViZ2xjS2xlSGJOanZhaUZzeUQ5?=
 =?utf-8?B?WjRYazkwNGhJTUxFYUFVdXkvNHFQY1NpS1puYzlqQndWR1czekZEYlpvQSt6?=
 =?utf-8?B?QU5FYzJObDBCbWJBRm1pU0d1SW1qMHNZbmpHdXlRNjdkL3dKcFFjMEVRWE8r?=
 =?utf-8?B?OXhBKzBHOFdYdW5HNXA4WnlWM05UZSs2VHFhMU5LZXBlSWIrR1ZoRXh6akc5?=
 =?utf-8?B?eXZxQUFoWG1IN2ZPOXg5TC9TcWZ5M1YrNUZmWWl0bExZNDZBRzlpbndtbzJ6?=
 =?utf-8?B?L05IWmdOOXh2YnZ1RHJ6ZEwrdkVhYmZ4SmtjMDNLRFRNQ3piOGMrRUpiK1NJ?=
 =?utf-8?B?ZkJMNHcxakR2aGxPQU1Bb2ZNRmdTSDhnSGR4VXBiY2RyWlY0cG9ON2V6dWQw?=
 =?utf-8?B?Tm5yd0phU3RZSGVFaEs4RStCSkNhcGpVKzFpNUM3QWZveG96QUN4MHcwUHlj?=
 =?utf-8?B?eGlMUnNDVDFYTjRKSi9ieVkyRnhacklFT205ZzBpUVJ2VjdQRnVPME9QMVVV?=
 =?utf-8?B?c0swL3lWeUNpVU03blN2d3dOWk5kQ0RGci9VbU5JQ3V1S1JzTWJBbGxUWi9C?=
 =?utf-8?B?aHFpaGdlMEo5RUJwUXhRM3B5NElFdGZiVHZQRTRSUFVDdlBOR1pabFNJN3Fv?=
 =?utf-8?B?Q0hMYy9vMzB2SFEzSmNEeVRkVHl6R0cwNWZtd21pU3I3aXpYVkF2Y2hWN1Vu?=
 =?utf-8?B?SXhkUGpnRXhQOGVTWjMrOHVQRjA2bXV3dzM5eEs3VE02UG9ZdStNVDFBY2h4?=
 =?utf-8?B?WVJaVG1yRnlOSkN6cFZ1emVtbUU5OEZ1cWY3STY2SmNMK0RVdDlEVVVuL3ND?=
 =?utf-8?B?SzQwRzBVT3MxTThKM0NNeFc4Y2w2SGtibEVXdHB5UUh6L3F6cDBPVi9TOEY0?=
 =?utf-8?B?VVhkdlNubHNaZzQ3SEJBR3RtM3VlQVNEd09BajliRG1vUEhycGdrVVBieXBB?=
 =?utf-8?B?andiQVJvdVkzbE0yakJETVcxTC8vZlgvZk1GTmI3SWFPdnJGMVBUdy9qeStz?=
 =?utf-8?B?WVJ4d1crK2lxVGk5c0hPYS9oM0xUR2tqYzdsQ0FqUDNCVTNGK0FCWGJ5dUha?=
 =?utf-8?B?US93d1lUdFRNeWl0bndxUVdpMjVuVjBjZU51Wnc3ZDVNZnpWNnkzNmw0VUNN?=
 =?utf-8?B?NklnNmlyRzNvZXI0VVRtRkdtaUVIRHJmTW9GVGpSUDU2RTQzNEV4SFBBTWl0?=
 =?utf-8?B?QTBMNGFtM2ZLbHUxQkdaMVVwdXFnS1BvMmJLTEFDTWJQa3ROalZKQThJSFU1?=
 =?utf-8?B?bTRhYWtxdlhYeXJUckRiY2VLcDVrdVNaRUFVRzJwY1d3YmQrRnpjTXBEbUJa?=
 =?utf-8?B?SHJlWUdRUm1hdFVWdEFweG15S2FZdmVIM3IyV0pOaktEZG1BTElFQWNaRlFa?=
 =?utf-8?B?NTcvcTRpVllyZnltU01QelJxY0IyOXdSTmVmRUQra0ZnZXo1VjRJRXFQMk9t?=
 =?utf-8?B?S3FvSzFlZlh3UmZxSjlFVkV5S2JOaDFoWTZyN1lSaUFxVTV2VGVsQ1h3OS8x?=
 =?utf-8?B?NkY1Y1dJN2E1RmpubzJSWklPeE1XN3VEd2xERTZydDlSTG0zVUZLcUR3bDg1?=
 =?utf-8?B?UEQxc2tiQ3pvbkpWbWNLRnFwbHVJK25BaWlXUVNSMVQxSEd0akF2aDV6djlF?=
 =?utf-8?B?ZTQydVhCWFZuL1p4VGZLb3Z6bVhKSmxiVTRqdFFlTHZoSlNzT3BkandWS0VD?=
 =?utf-8?B?cXRiN1BsMlo0eFdhdTY2ZkV4dTVQSkpoSFFvQzNJWThwL1YwVlVqdkpsV0xl?=
 =?utf-8?B?R2dIdm1LTXl6VVZHTnpCVFpHTS9Ob3BCOHprVEtyUHZtVHlKUG92V2FuQUV5?=
 =?utf-8?Q?+OaogtA4JMomFb0U=3D?=
Content-ID: <80E97D904E30724AA9A41AB167A53490@namprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5951.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29b4d7f0-e6e7-44e3-d7f6-08dec855b048
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2026 07:39:08.8062
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L/V23KD53DlAoZt+lgzH+brvClhZo5NPtxSKYoDl6DV+x+R5uZacQQD1MHjUwGZ79c/b40pOjc1dn5fikCaeTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR03MB8408
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_003914_914357_0702C104 
X-CRM114-Status: GOOD (  20.15  )
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

On 12/6/2026 12:19 am, Frank Li wrote:
> [You don't often get email from frank.li@oss.nxp.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> On Wed, Jun 10, 2026 at 01:14:26AM -0700, tze.yee.ng@altera.com wrote:
>> From: Tze Yee Ng <tze.yee.ng@altera.com>
>>
>> Implement ->set_speed() so the I3C core can switch open-drain timing for
>> the first broadcast address per spec: I3C_OPEN_DRAIN_SLOW_SPEED programs
>> tHIGH_INIT (200 ns) before RSTDAA, and I3C_OPEN_DRAIN_NORMAL_SPEED restores
>> normal OD timing afterward. Cache the normal OD register value during bus
>> init and use a separate od_hcnt for the slow path so SDR extended timing
>> remains derived from the normal PP hcnt.
>>
>> Fixes I2C devices with spike filters not being detected on mixed buses.
>>
>> Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
>> ---
>>   drivers/i3c/master/dw-i3c-master.c | 53 ++++++++++++++++++++++++++++++
>>   drivers/i3c/master/dw-i3c-master.h |  1 +
>>   include/linux/i3c/master.h         |  1 +
>>   3 files changed, 55 insertions(+)
>>
>> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
>> index 655693a2187e..dbb801910b3d 100644
>> --- a/drivers/i3c/master/dw-i3c-master.c
>> +++ b/drivers/i3c/master/dw-i3c-master.c
>> @@ -592,6 +592,7 @@ static int dw_i3c_clk_cfg(struct dw_i3c_master *master)
>>        scl_timing = SCL_I3C_TIMING_HCNT(hcnt) | SCL_I3C_TIMING_LCNT(lcnt);
>>        writel(scl_timing, master->regs + SCL_I3C_OD_TIMING);
>>        master->i3c_od_timing = scl_timing;
>> +     master->i3c_od_timing_normal = scl_timing;
>>
>>        lcnt = DIV_ROUND_UP(core_rate, I3C_BUS_SDR1_SCL_RATE) - hcnt;
>>        scl_timing = SCL_EXT_LCNT_1(lcnt);
>> @@ -1480,6 +1481,57 @@ static irqreturn_t dw_i3c_master_irq_handler(int irq, void *dev_id)
>>        return IRQ_HANDLED;
>>   }
>>
>> +static int dw_i3c_master_set_speed(struct i3c_master_controller *m,
>> +                                enum i3c_open_drain_speed speed)
>> +{
>> +     struct dw_i3c_master *master = to_dw_i3c_master(m);
>> +     unsigned long core_rate, core_period;
>> +     u32 scl_timing;
>> +     u8 od_hcnt, lcnt;
>> +     int ret;
>> +
>> +     ret = pm_runtime_resume_and_get(master->dev);
>> +     if (ret < 0) {
>> +             dev_err(master->dev,
>> +                     "<%s> cannot resume i3c bus master, err: %d\n",
>> +                     __func__, ret);
>> +             return ret;
>> +     }
> 
>          PM_RUNTIME_ACQUIRE_AUTOSUSPEND(dev->dev, pm);
>          if (PM_RUNTIME_ACQUIRE_ERR(&pm))
>                  return -ENXIO;
> 
> Use modem QCQUIRE macro
> 
>> +
>> +     switch (speed) {
>> +     case I3C_OPEN_DRAIN_SLOW_SPEED:
>> +             core_rate = clk_get_rate(master->core_clk);
>> +             if (!core_rate) {
>> +                     ret = -EINVAL;
>> +                     break;
> 
> you can return ret; here after use ACQUIRE macro.
> 
> Frank
>> +             }
>> +
>> +             core_period = DIV_ROUND_UP(1000000000, core_rate);
>> +             lcnt = SCL_I3C_TIMING_LCNT(master->i3c_od_timing_normal);
>> +             od_hcnt = max_t(u8, SCL_I3C_TIMING_CNT_MIN,
>> +                             DIV_ROUND_UP(I3C_BUS_THIGH_INIT_OD_MIN_NS,
>> +                                          core_period) - 1);
>> +             scl_timing = SCL_I3C_TIMING_HCNT(od_hcnt) |
>> +                          SCL_I3C_TIMING_LCNT(lcnt);
>> +             writel(scl_timing, master->regs + SCL_I3C_OD_TIMING);
>> +             master->i3c_od_timing = scl_timing;
>> +             break;
>> +
>> +     case I3C_OPEN_DRAIN_NORMAL_SPEED:
>> +             writel(master->i3c_od_timing_normal,
>> +                    master->regs + SCL_I3C_OD_TIMING);
>> +             master->i3c_od_timing = master->i3c_od_timing_normal;
>> +             break;
>> +
>> +     default:
>> +             ret = -EINVAL;
>> +             break;
>> +     }
>> +     pm_runtime_put_autosuspend(master->dev);
>> +
>> +     return ret;
>> +}
>> +
>>   static int dw_i3c_master_set_dev_nack_retry(struct i3c_master_controller *m,
>>                                            unsigned long dev_nack_retry_cnt)
>>   {
>> @@ -1534,6 +1586,7 @@ static const struct i3c_master_controller_ops dw_mipi_i3c_ops = {
>>        .recycle_ibi_slot = dw_i3c_master_recycle_ibi_slot,
>>        .enable_hotjoin = dw_i3c_master_enable_hotjoin,
>>        .disable_hotjoin = dw_i3c_master_disable_hotjoin,
>> +     .set_speed = dw_i3c_master_set_speed,
>>        .set_dev_nack_retry = dw_i3c_master_set_dev_nack_retry,
>>   };
>>
>> diff --git a/drivers/i3c/master/dw-i3c-master.h b/drivers/i3c/master/dw-i3c-master.h
>> index c5cb695c16ab..c814087a6f1f 100644
>> --- a/drivers/i3c/master/dw-i3c-master.h
>> +++ b/drivers/i3c/master/dw-i3c-master.h
>> @@ -46,6 +46,7 @@ struct dw_i3c_master {
>>        u32 dev_addr;
>>        u32 i3c_pp_timing;
>>        u32 i3c_od_timing;
>> +     u32 i3c_od_timing_normal;
>>        u32 ext_lcnt_timing;
>>        u32 bus_free_timing;
>>        u32 i2c_fm_timing;
>> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
>> index 592b646f6134..c7d7448c4cd7 100644
>> --- a/include/linux/i3c/master.h
>> +++ b/include/linux/i3c/master.h
>> @@ -259,6 +259,7 @@ struct i3c_device {
>>   #define I3C_BUS_THIGH_MIXED_MAX_NS   41
>>   #define I3C_BUS_TIDLE_MIN_NS         200000
>>   #define I3C_BUS_TLOW_OD_MIN_NS               200
>> +#define I3C_BUS_THIGH_INIT_OD_MIN_NS 200
>>
>>   /**
>>    * enum i3c_bus_mode - I3C bus mode
>> --
>> 2.43.7
>>
Hi Frank,

Thanks for review. I will change to use PM_RUNTIME_ACQUIRE in v2.

Thanks,
Tze Yee
-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
