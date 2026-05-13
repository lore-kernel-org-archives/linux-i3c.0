Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52171CD4F21
	for <linux-i3c@archiver.kernel.org>; Wed, 13 May 2026 13:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pQ7rqgOUqwt83V3J9yrEuKhWQlXBEsy1wECCJyzE3U8=; b=OBmwv8Rn1cPqqr9uTsvk7pUl4O
	thZIjahdIf+ETfvDQl/KxG6upwvk3RVivpL63zdXeXqoXyo6+8YCZlpoq1qZ8p78VqmtfV+jTtFj9
	PqqgJcAwRrJBxcUkNVNTNzXl1qkedKRuR/bSqog4XzIobrZ8/mKm5DFkqF7z1E4TJKLqnhgHTXEVQ
	yQ0DkSXFJr1aleZQh8c1c+pRNwgQtKkm/rYDmPfQyfX5w0xk+SXMRWV39Z5Q/NRFuVS7gXg2eq3Bd
	awt+g4Uo6MMUR/iMmw26izx8tjKosl5qp6L8KmriFPzyDJjr/8sQLE0ab7vnMe/3i0LyJoked3koz
	gT2oR7KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNA6P-00000002qmQ-0Mtw;
	Wed, 13 May 2026 13:58:21 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN6ih-000000029cL-4Aaz
	for linux-i3c@lists.infradead.org;
	Wed, 13 May 2026 10:21:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bxE0KFPnjyBDslRxs8vwyUcIF5KWY/Vh/aTKx9v5nCjrUdkbqKZEeuJUkRH9djowiDTY0USU6AaKJPfZilpqFV6VV9dzsHPET1fUteG1UuRw/1/Htl1PSAgQU7NRVmi1v5NdWPimqtAnOqRnpLWLcaUul7+KfT3KSBg0SqxT2pExQ32c6MQVaCNowBaMtXWmzRYrtDj8fvznwIqJxko8f/XeUDb0Ti6Y22VCfr5syls+UEc3Jb56+0Zuct1fAbrj4lZdp+i41P5vHbL5lKk02JIzpB46uJIjKarFxpYKguaMfeM/uqozIa+/2btnXKidnl8m1oCdvFXlqT1QybD8bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m2sv6j2/l/zoyoW+oWQ8gNx0EOo+iN4thX42dSUqEMw=;
 b=KxDpYRVUWlHhiUiqEHGN2kaQPLr+yjvoZZ0wUQecJRc7dnZUKbKPzL2T6YaXpqnaTH0XQ/WzyulOHdrQu37MgSltaWDT1p3Vbhy5yUpWrhONp54Jfhv4nRYlpsk68VJ9f4yvmeU77lvpgipEZa+I5xFmDnCKL5i8adZdLU9rijdHlivPYsL++NUU8DgoxqkolxQlK9PUor3wKlNXnBvDP21TzL2nPA6dNVlH4iJkbob+QxCIoQH0GpH6Oe4MV0TTazcwbhKuBuomGYfowFT8pNSTR3QqJY8gxgzockDMaUoR9IXAI9gxYd1Um45Nlq521JIuFfUasevJ9LHLN7SKnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m2sv6j2/l/zoyoW+oWQ8gNx0EOo+iN4thX42dSUqEMw=;
 b=x5WIpe1RgTyrJdvMEk4oGUGt0Iw0iNVvJq9I9CxDfhdlQ9Q/C9jTJI6wQa7Rgny4AVIXaYEJmM67i091UbaoYZ7vsj5azIGhHiKtGYVGlUIBXkrODMcbZhZo602hZaglUoE1BXi4dpZA/nF2/yTNLrL/vXBb/UpP+4m/DwYMXHOhRvfAm35I5aY0TMTP38BqwKUxWM8+LoEeiacoWoyj2TJHjX1dfd8aDnAoVkgF7qxU550qbSs7KRTKmFvuH0Pf+Hz2sKFq3imJeUgrf+f6hgmZFyi3Lt6SosuKjhepr6N/A8MSYceN53y25jFZan5n2zBgyTsMyBmkjc/76KwwXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from BESP189MB3241.EURP189.PROD.OUTLOOK.COM (2603:10a6:b10:f3::19)
 by PA1P189MB3601.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4ff::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Wed, 13 May
 2026 10:21:37 +0000
Received: from BESP189MB3241.EURP189.PROD.OUTLOOK.COM
 ([fe80::49f:4bc1:672f:45c8]) by BESP189MB3241.EURP189.PROD.OUTLOOK.COM
 ([fe80::49f:4bc1:672f:45c8%5]) with mapi id 15.21.0025.012; Wed, 13 May 2026
 10:21:37 +0000
Date: Wed, 13 May 2026 12:21:33 +0200 (CEST)
From: =?ISO-8859-15?Q?David_Nystr=F6m?= <david.nystrom@est.tech>
To: Adrian Hunter <adrian.hunter@intel.com>
cc: =?ISO-8859-15?Q?David_Nystr=F6m?= <david.nystrom@est.tech>, 
    Frank Li <Frank.li@nxp.com>, alexandre.belloni@bootlin.com, 
    linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/8] i3c: master: Serialize i3c_set_hotjoin() with the
 maintenance lock
In-Reply-To: <571f1f5e-544e-4c1b-8ed1-4ddf6bfa9493@intel.com>
Message-ID: <dd5e6643-1a5b-52b8-e755-a21a83a8b095@est.tech>
References: <20260512121732.406009-1-adrian.hunter@intel.com> <20260512121732.406009-3-adrian.hunter@intel.com> <agNRR1wHi_FhHf4u@lizhi-Precision-Tower-5810> <e43cf38f-7878-b112-930a-0f9d3e34a842@est.tech> <571f1f5e-544e-4c1b-8ed1-4ddf6bfa9493@intel.com>
Content-Type: multipart/mixed; boundary=832332976160880117786676931620368
X-ClientProxiedBy: DU6P191CA0058.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53e::29) To BESP189MB3241.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:b10:f3::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BESP189MB3241:EE_|PA1P189MB3601:EE_
X-MS-Office365-Filtering-Correlation-Id: 1450c3cc-8587-472c-748a-08deb0d96a55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|11063799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: o/JsEc5nnlUjuUdGcQJ1IMZGmGVEsU0zgVYEtsIQ8ggx4HNmDmcH8cJk66UM1gK5/6GBTXfK3jF4/ZJqkhHEBLICL46O5Cfy3cG6O6S3WcwThWoI0ph8/GlZ5J3Bsm2qOm/eVxiiq62t3NgTapHzIA7V0fbsR3GHuDCALb7633nop6GOeQ6572gj00FERYJ2xIgrSeYcJs0a5qWJFkPFW0MQNJOigdadPUzOZw8xlNnP8ih41SKt/9MeLMptos1IMbXiea3MdGDCMHijV9VJDd1igZUytf/3qyX+xC9onKzcsbU8YXXVeuLmGbsQoe6gZ47cvEkJW/Z4HKCHI8cx0aTWcL6E+iqrDrggQG+/MW9kRmaIGHLRLsamF4fVkfM5dJLGye5g7Bsq+DXmxmWWG49HoleXJnmbWGdEdZksADkTss/rGAT9BVLApdO5q0c6lJwuB4u9rawtroQIF4X8BF4aYatsPhDGV3QPqhWinRLnKyEC3DXJdfdh96tDE1gt5jwWIDbVTOcnuAzkZztHSDzcofsrHw3+Qo7xipI1VxPyGAR0VkLO4diEEBEStf/iOLtqyOLJuXDGccosL2Zk0u8XjpRO9fHONYClD78b5q2iPKlf3NH9uV7ZbwGzW2/njxaG4JR2RkuNBHqX2Qi/qgK0MkhqFWVBZyDFkXIoyyMnLxK5p8jOMv4FO8dxoddrTF5eOomBTquOd7GZKc+I7w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BESP189MB3241.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(11063799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3dleDRqNXIwczhCVW45cjJURDQxTVE4VjNGclg1RTV6eldnVVlYM29STnlE?=
 =?utf-8?B?MVhuWGoyRDBuNTNpcTNldEtkVWRoZDcweGlVaTZrb25VQkpRaVFPUitGMSti?=
 =?utf-8?B?TFJPVkExYVdiNVZOZ0QvREYwbWNxbnRJaTBDVmNHZGRMT3QrMnU0bGpMR1Nv?=
 =?utf-8?B?Nzg1emRLa0xEanpvTG9PVmhHSCtWb1JkWDFueUlsTDVNa3VYalNRTTh0K01S?=
 =?utf-8?B?clFtS0NGemdCYXd3T1lzVkpScmc0TTRUYS8yanBadDZ0RXREaVM5dVdFSW8x?=
 =?utf-8?B?Y2d0SHhWWVo2WFdxKy9EN0dDM3JUclRwU3dteFVaWHlHNUw5Q1Brak8rU2x2?=
 =?utf-8?B?OUExdEFQYWQ1TTBGa0lmMTRYSndoZW9lbzVTNVNlaElwWnRFZUpnUGovT2ps?=
 =?utf-8?B?RmloSWdNbWpWb2tLeDJhNzRpZ0xSWHdEM05qVTRqZ0dSVThLNmo4YVlvS1d1?=
 =?utf-8?B?UytJQzlNNXkvNmVGWWhaalk5T21sZ0J6anRwejU4bFdvZnFDMmE4dHpqd29C?=
 =?utf-8?B?SnYwUEFUbXd4S3BUZ3NzbkNPeHZzRlp2YkY2Rno1aDlFZzNwL3J5eGdqZnF6?=
 =?utf-8?B?a254N1J2MlVIaGc1NFpUM3VoU2pINUp4OFJSd25BdHd5RHZaaHdORUUvbnA0?=
 =?utf-8?B?SzhTZzViYnE2cE1HT2tmekdyMlo2eEt0cm5BQ3VabHRXMU9YOGQxQTlWb05V?=
 =?utf-8?B?V3c2VFlZOXZCVGRad25aODlsUld4SmlSVTd5MzVDaldBMEFtdnZuZ0NWWU40?=
 =?utf-8?B?Z20zTGt0VXViRkpzR1d6WFZuQkZmOE5VRW90S0tnd3h5QUx0ZFp6UXhUUHQz?=
 =?utf-8?B?c01TclVTb3MrUG11dDJwZktCa0lVUFp0eGNJazIwR0thVmlOWXpCdllNcjA1?=
 =?utf-8?B?T0hpMUxmWmMwV2FhUDZIOTZ0aHoxa3NDUFp0VDVJRTU0VHd5TExXNmR0aGd4?=
 =?utf-8?B?MWh1THh5SXdRcm5ITkkvRzBzMVJpSys2dTlVV2lObEV4bXZCMkhsSzRva0RQ?=
 =?utf-8?B?SUtPOUpDZHFPWFdvTE5GTG1tbXhHY0tKODNvbW1kejBTOGNlSklmZGJ0djJj?=
 =?utf-8?B?a2hQQzVka0NpNElWRVEycnY2UUtEME53bVJ3K2Q1YStIdzZ3Y09DUEoxOU1U?=
 =?utf-8?B?aVB3V3huMEo3VFZINGdwZlFzaS8rcGlUbDc0RkNJZmZneGpnazNwSlJTd05p?=
 =?utf-8?B?cEMzdGdXMXF1Wm41eUxPdkpMWnRnczB5YnB3ZDJaT1U4WVdZZE1VZE1KSUJm?=
 =?utf-8?B?c0R4bXNBUFgrMUQ4UGF0M1ZKL1I4OEQ0dG1ZTTFiODRlNEFPVmNKN281ejVy?=
 =?utf-8?B?Z3NmWi85OXpaQWFrZUI4NUh3YllIYUJOVzVRYmppaGJ2TDBiRldIQWNWclpS?=
 =?utf-8?B?bnp5aENhek8yYmwvanp1SytMTUNwa09FZWxSanRMREl1UVUyNUE3RVZkd3FF?=
 =?utf-8?B?T1h2MzNEYUNHMWVRSmIyMndMc2tRNGgwT3p2VWxENHdEcm40SkU5aFRIYzJO?=
 =?utf-8?B?dEl0UGRaTkNXYXNSYjJxYmVvVzRPL3BsWHo1Wlh4cUhWKzdIVU90cFZCeVBi?=
 =?utf-8?B?Vlh6cHR3WHB0a1M2am5iYnZrbloveUpXNC9IeGZmWng2eCt3dW5sTjIrZEhI?=
 =?utf-8?B?ZWxnWlhKVXdzN0oycmszUGdMZ2s5aE9QMkd0elI2b3VQMDlrd3pjR0hpZEx1?=
 =?utf-8?B?UXZGaEZ0ZVlUeWNLWHA1eDVQY3Zub1pHTmlpdDFlUXQ0NnhIZ2dJMUVyTVJl?=
 =?utf-8?B?enFaUnVBMXJWb1BEVVZDamlnUzNUNkQ2c0NKYVNsZXpJbjJNRlAxd01EVHBU?=
 =?utf-8?B?ZUVYMVNGOUUvSlBzQXZKc00yVitibWtxdjc4akhqOGNLODQrMWJWcS9vUXN6?=
 =?utf-8?B?WTJWT3c1Zk5lY3Y0U3hZeWFPd3ExNVY4b1dNSXQ2ekRYRG9HWDIvSUhWa0Q1?=
 =?utf-8?B?bkZPWnlCRVplVVpMZkhCK29ROE1RbmJrWCtXMWdEVEdPREFpWnJIbHVYcFZq?=
 =?utf-8?B?YU90Rk5SVWZVbXdXaUt1ZFNmckRjSjZualVHUTFIMHlxVlUwOGtubzNJczB3?=
 =?utf-8?B?bnFQS0Z3UGtRVTBNVHVmUkJvUVpHY2czYTVpZko4OHNzRHA3ejJOZFdGN01s?=
 =?utf-8?B?citoRW9kNHZvR0ZpN3ZLbEp5b3JkWnFuMXVGaXVlMUlwVlhZV2pSbU00N0g4?=
 =?utf-8?B?SjJQTTB6WXZGNExtTkxWaXBOZWNYa21uOUdiYUlQdVhHS0tIanVrYTVRcnV3?=
 =?utf-8?B?bkpONjlMNTNHT2Nqb3FZWXRwUyt3TnRsQTcya1NmMURDTVJBWmFYeXJkQ1ZO?=
 =?utf-8?B?SEt4QjAyK1dSZ2t5TnlUQkZDUGNTK2h4Z202eUF0Y2dZT0lkdjFsUT09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 1450c3cc-8587-472c-748a-08deb0d96a55
X-MS-Exchange-CrossTenant-AuthSource: BESP189MB3241.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 10:21:37.2886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1+JZBGjt2rnmcc/n4e0Ozx1B10Tz+CdXDZw9+1lWVifLMVW0+X9lysTAA88Pc1k7zdGTa1FWH8CEBGCqqugLrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB3601
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_032140_035175_6DB10CEF 
X-CRM114-Status: GOOD (  12.51  )
X-Mailman-Approved-At: Wed, 13 May 2026 06:58:19 -0700
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
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

--832332976160880117786676931620368
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE



On Wed, 13 May 2026, Adrian Hunter wrote:

> On 12/05/2026 22:42, David Nystr=C3=B6m wrote:
>>
>>
>> On Tue, 12 May 2026, Frank Li wrote:
>>
>>> On Tue, May 12, 2026 at 03:17:26PM +0300, Adrian Hunter wrote:
>>>> i3c_set_hotjoin() dispatches the controller's enable_hotjoin() or
>>>> disable_hotjoin() op and updates master->hotjoin under
>>>> i3c_bus_normaluse_lock(). That lock is a read-side acquisition of
>>>> bus->lock (down_read()), so it does not exclude concurrent callers.
>>>>
>>>> The hotjoin sysfs attribute can be opened multiple times, and writes
>>>> through different opens are not serialized.=C2=A0 Two concurrent write=
rs
>>>> to "hotjoin" can therefore race in i3c_set_hotjoin(), with the
>>>> controller op and the master->hotjoin store from one call interleaving
>>>> with the other.=C2=A0 The hardware enable/disable state and the value =
reported
>>>> by hotjoin_show() can end up out of sync.
>>>>
>>>> Take i3c_bus_maintenance_lock() instead. Toggling Hot Join enable
>>>> changes bus state and is conceptually a maintenance operation, so the
>>>> write-side acquisition of bus->lock is the appropriate lock and
>>>> serializes concurrent callers against each other and against other
>>>> maintenance operations.
>>>
>>> It should be bug fix, add fix tag here.
>>
>> Agreed, Fixes: "i3c: master: Add sysfs option to rescan bus via entdaa"
>> Is this series headed for 7.1-rc3 ? if not, its probably wise to revert =
the sysfs addition from 7.1-rc
>
> "i3c: master: Add sysfs option to rescan bus via entdaa" added "do_daa".
> "hotjoin" is a different sysfs attribute.

Replied to wrong patch, correct patch commented now.

>>
>>> Frank
>>>>
>>>> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
>>>> ---
>>>> =C2=A0drivers/i3c/master.c | 4 ++--
>>>> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
>>>> index ab11e2d79aab..38ffc8713167 100644
>>>> --- a/drivers/i3c/master.c
>>>> +++ b/drivers/i3c/master.c
>>>> @@ -649,7 +649,7 @@ static int i3c_set_hotjoin(struct i3c_master_contr=
oller *master, bool enable)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return ret;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>
>>>> -=C2=A0=C2=A0=C2=A0 i3c_bus_normaluse_lock(&master->bus);
>>>> +=C2=A0=C2=A0=C2=A0 i3c_bus_maintenance_lock(&master->bus);
>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 if (enable)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D master->ops->=
enable_hotjoin(master);
>>>> @@ -659,7 +659,7 @@ static int i3c_set_hotjoin(struct i3c_master_contr=
oller *master, bool enable)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 if (!ret)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 master->hotjoin =3D e=
nable;
>>>>
>>>> -=C2=A0=C2=A0=C2=A0 i3c_bus_normaluse_unlock(&master->bus);
>>>> +=C2=A0=C2=A0=C2=A0 i3c_bus_maintenance_unlock(&master->bus);
>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 if ((enable && ret) || (!enable && !ret) || m=
aster->rpm_ibi_allowed)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i3c_master_rpm_put(ma=
ster);
>>>> --
>>>> 2.51.0
>>>>
>>>
>>> --=C2=A0
>>> linux-i3c mailing list
>>> linux-i3c@lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/linux-i3c
>>>
>
>=

--832332976160880117786676931620368
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--832332976160880117786676931620368--

