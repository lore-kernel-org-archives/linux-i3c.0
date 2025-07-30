Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F4F8C87FCB
	for <linux-i3c@archiver.kernel.org>; Wed, 30 Jul 2025 10:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AMs9mZVntxjegiBsddrK+bEbT7zhiXdcvyKTU9n1c1A=; b=Auu1o6PSrG/kgk
	GXiG+ndLaPmsjPhcqMmjz+Y9XdYvPpx41dYSYuQw2LvjbitKEiUVnXjmS1JJ1iEbBiy4G02WPBmXF
	5jsGwUMsnV134sJfq97QvxJVC3WDdgKeUA3gUjm5WZwo6Uyq98BJJuqH008VIfQqbkv1nnYg4LyBx
	Oyt7GI+tf7jB+l2gMl1w4H5NjwCmWIALmCUvw8ZzrpwqtJ4Fz5rxsoUcVBSKpnXDUoR+BVBZog2ES
	zwLYjmB+wQSCrorH+UtTw6n6MYDFeXQ+aX2QVYjb2xQ1YURud6/QWGGVsAevQfiBcsiXQsk2LMiVk
	e7zoXAKXEWBRx6kjOwJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh4Uh-00000001Gru-0Ezq;
	Wed, 30 Jul 2025 10:57:11 +0000
Received: from mail-bn8nam12on20601.outbound.protection.outlook.com ([2a01:111:f403:2418::601] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh4Sy-00000001Ger-0oXD
	for linux-i3c@lists.infradead.org;
	Wed, 30 Jul 2025 10:55:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RM7g58P+Itio1PW7mXcWBGcAe8M3FJZ2h97BCG0bBrmKtrSbWM4QpVDGePXCrIQ/chCkmQd0PXfyvk/MRMFO6UYU8QpauOrYB50JypQbAYdqg2MfVQ6qhHEjrE9hhn91mb4OQybMyhPOSyjpiBqcF1st/vKUCj9lpusRdIm1vNcvFeKdzh/b9h//NMT2qFnnIVmYy+Z4nofib+vy/PeespPmVmdg5wNehBHH00jozfHvwQxFeGQUoTN2+BOkVZurr7KWfwmSVTnpC3oSZisfyTebGKhSO9G+c06YDjlJJLyGYTuqWxwWUT9eERc04F8/r8u83GQshAjSC1mVVAtUBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4FbsbWCC9zLxH+69fuGXC35DcHpAiJr9gn6C8geYuX8=;
 b=tN3V4V8Nt33sfFxbLqcBUSyTtp6DPEi1qPskUDdV+wBnqWVlPomPiE4S+m/UbHPspLsi54zx0Q15mYjsI/JurWf9s96L3kwapNo/tdKpcuksk6DFCVAZfJbepcWb4WhkDY4EAy+3GQJIEoAhZjlfOPsa6DzgqSP9+HtasQONOTTa09OTmAyujKig/quZxv2cOUf9TskOW6feHX2wKz33CPgV66TYC0hrsDtKEQJ/nDKzfZKQA2QTKZcpBc1UsAL2rfbOMfdZP9wqgHu1e4ob21k+BECPbZY96Srkrkp/DllEKCSHxXrflr0tmTrI17X6YduHCg3VFHZ76PPrrsLIfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4FbsbWCC9zLxH+69fuGXC35DcHpAiJr9gn6C8geYuX8=;
 b=rcF0cbwWFV59S4isoOVSf9MXBqFNFexo3U+iuBmjXToXWHU1VFxRecgBeieZSM2hk+cTYQmRUo84oN690oNtuFBMHLrW7v6QvxrhCYQ7EC4YF67FGJv5NdiebxFNsneranWrWH9+fR9pnaQThp+eJCId0ZU8tVmvDlS1m0AhbwAETaX0TuqAMTeByaswhzqC1Zx+YVfH4LDz6C2IMdVkDVvtDnqEfu6GK6u1cNB3F7zOJsfmWX0sDrBF6SAS+wo63vsCOdPOnPl+nzhHM3r7dtCqX47MD27p3e0mx9RElGlfDiAwFwyYU+c6nbAHoENju91tvarAOaeH9yKiD7EDyw==
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 SA1PR11MB8318.namprd11.prod.outlook.com (2603:10b6:806:373::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Wed, 30 Jul
 2025 10:55:19 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%4]) with mapi id 15.20.8964.025; Wed, 30 Jul 2025
 10:55:19 +0000
From: <Durai.ManickamKR@microchip.com>
To: <linux-i3c@lists.infradead.org>, <alexandre.belloni@bootlin.com>
CC: <Hari.PrasathGE@microchip.com>
Subject: [RFC] SAMA7D65 SoC I3C controller driver
Thread-Topic: [RFC] SAMA7D65 SoC I3C controller driver
Thread-Index: AQHcAUBw/g7Jq56vsU2oNRZ7iPPRow==
Date: Wed, 30 Jul 2025 10:55:19 +0000
Message-ID: <cbe773d1-f056-49b1-8c64-eea57ca8a9ea@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB6541:EE_|SA1PR11MB8318:EE_
x-ms-office365-filtering-correlation-id: d0b866b3-f455-45f9-190e-08ddcf579349
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?KytwQUpQMHBCdjB3N2J4S2tITEMxRHZSZkxZSjJ3S1dlTlorcnN1ZUI2RkhD?=
 =?utf-8?B?bGc4Ykk0NHhDMEgrTzZTZUY1czYzUHFSTkdQRGhOQVA4a1FqYi9YZXV0bVR0?=
 =?utf-8?B?OHUvcy9RamwrRUU5MlpWdmxZejByUHZwajMrcDBKcG1IUUh0RmVwRlROWVFQ?=
 =?utf-8?B?NFZnK1Z1V1c5eU11VHRIU2c1TkR6UTA0MUk3L1pQMnRuaURXbEh0WE12V25w?=
 =?utf-8?B?eGpQNUErT2h5UGFibFhJYmF3NU82bE1sVEZVRUtHZDdqbUFhVDE3b3pCeFlJ?=
 =?utf-8?B?eDlWRyt1RVQzblZyMkkzdE1SelViOXFMcklvbzBjWmtILzNBWnFCbkdBTnhl?=
 =?utf-8?B?VG5waHAyTUVtaEh5b2ZoV1kzb29kODFxSmxQeE8ycE5MU1dXN0g0eHpNOFNV?=
 =?utf-8?B?N3BXbnA1T3NFOXVTRTFReUhhRk1PMENZbE41dUs1cUhCLzljQzVub241Uy9h?=
 =?utf-8?B?OGJDaHNzektiSk1WNmQ0Q3pXTUY3b29iQXdHUE5wemU0blp4Vk0wZ3ZVWnZh?=
 =?utf-8?B?ZG1nK0JzTkl5T3VlalFpam1ORytmazkxY2hVUENkZEIrVjFRSURXMGM5azVM?=
 =?utf-8?B?ZDhrTkZqT0tpTG1YcHVHK1kwRUt4c3diVks4eFpJdXM2ai9PcURoclpZK3lF?=
 =?utf-8?B?RXNCeDIxMEhSaFpTbzF3TFdYYUhXSWU0aHJjN3orWmpPd2dvWmxUajV4b2l0?=
 =?utf-8?B?ZzNTODJpbkQyaU9vb3NaeE9EWUlBckRtM3drckhXcThkNjYyZ2tNWk9OYWVV?=
 =?utf-8?B?TTl4RkZPQnl5K0JqTlh0cEhTN1FjZDhYUmtVcERHa1RqZS81OGxTbklTUUg1?=
 =?utf-8?B?NFNjS083Y3lBanJaZ3dLcWgzU0I5UFBMVkFMdzBacGtFdDBXNDdrclBaYkIz?=
 =?utf-8?B?V0U3NTFLNVNybUFvOWY2UmtSN3lKU2xTR21KM29wUTJoMEs3N0o1d0tpaklO?=
 =?utf-8?B?YmxCYk4xTWhOZXBORm9IdXBFcGpCUnFVbjA2Y08rQWdWeGRwcDlwNzNIQ08z?=
 =?utf-8?B?eHNJZGZ3cFU5YWd0aGpsZUF6bFhuN244TmJOY0IrOW9WRHlOS0I2ODZmWXRM?=
 =?utf-8?B?akJLczBIUzBzWUFaaGxNUUw5TW9YbXRzU0ZhNlN4bXRNdUgyZHVkT1hTOGFt?=
 =?utf-8?B?dWlTM2pJYWVJdE9MVjJoLzlsVnhMc1pCWDkyOFpYMnovUi9odndsaWhTdUs0?=
 =?utf-8?B?eU4wdFUrZEJRVmhtOEs0eFBKdjdsa3hVSDJCTmVGbFVxTWZJRGs1YkViNmt6?=
 =?utf-8?B?U1Fya3dLa2U5UUdCZGRhVjBqamxXMnIyS2pLOEhvZGppY0VraUx0WXRpUW84?=
 =?utf-8?B?MW91ZzVzdnVxckRtM21yMUQ5UDF1a2FOQWRUWGZwTE9NWjE0c1poOVQ5Ymxh?=
 =?utf-8?B?YzN6SzE3Q3NlZEdGQmkyWDJVZkQ5M1pldkVMNzlSWjJndDNZdlFrNzNUY1Nr?=
 =?utf-8?B?a1JYK0RraC9SelY3ZkJubGlYazJwdFdSREo3aGZPa3BmcVhCYUF2MEVsY0h1?=
 =?utf-8?B?VnA2azZOclZQSWdOK3A5TGRlVDhmeGYrL0lGQnRTTmhBRURmQmtxVk1sUkti?=
 =?utf-8?B?VHRabnYwbVZhcndSUGVqU08zeVZ5Qy9nWExUQ2Q2L283VTR6bUlEdFdqc1hW?=
 =?utf-8?B?TkR5OWlMSm5NRWt4NXQ3WmFWR2puSFNzQTEzT3laRjlsdTNvQlVPVVE4T2FF?=
 =?utf-8?B?ak9xeHR4RTJwNGRQUXlXV0dPUDBiTGVKcjJZaC83azRNUG1YYXNJS0N2Q040?=
 =?utf-8?B?eVBzcXdJWGg0NmcyL2dXbFgvMWRtMGlDVVl5WlhKU1hSOSs2UlFaUTg2YlFK?=
 =?utf-8?B?OVc4MTRpeFNlT1J4TTE3OFArdWlvamcxRng2bFFtVG9sdlZmdGFxTDFlaVpv?=
 =?utf-8?B?TlBQTjhmVWJzMEl5c2lLMmZMNWt2eXRtK2cvVDVMUVRkZ0dvUFFXZ3NOMDdz?=
 =?utf-8?B?dTZCRnNxMVVWY2pLK2lwTGV4TTU5Zk4wdUM0V1JlMHp4OGxibVJxbUJNY0ZK?=
 =?utf-8?B?VW1HZjVlMjBRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6541.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c0pvaXIycWJSTHFaQjh1bEVCR2Y4eWVoY1A2VUc4TU1ZektrUGt6NCszZUJN?=
 =?utf-8?B?aHNVaWFHa2w2ekRzc0FxOGZ1SFVydVROMjU3Q3BBY0N1YVlnUjZXL0x2UHQv?=
 =?utf-8?B?SjZ1TDljNlVzUHZTSGVEa29WTDdnVE5oYU4wWVJLMFRiZml6aDdxV3BCaDNx?=
 =?utf-8?B?cGNabU5LZ1BPcjZMZHRRN3pGVVZPTUEyZEpDTE1vQUZhTWQyQ09HSUt4RXBk?=
 =?utf-8?B?K05KeTNsL1ArRVVVeG5yL3NkRTJjMG9Ca3ZKaWVrYnlQNmtuaHV2N1JxdzJ2?=
 =?utf-8?B?ZWtMQVJFQlQweklIQ2tmMFBXb1A3K3hXdkdRTTBCY0RQU1dCMCsvUjE2WjE0?=
 =?utf-8?B?RUFyVTV6aEZ2K01MTU5sZ0FVMTlRM212NnFzbUl2a01YLytlMkp6MXJ3RmZM?=
 =?utf-8?B?cld4MHJoeTlEcUlPR3NpSTQxcS9Jb3dRQ1pjWW1wR1FTOW5uWktYMWlPZkNk?=
 =?utf-8?B?bzkyNEI4TVY5aGE1OU1mNno5N0pCYlVrclNiOXhKN0hjVytHTlJkSHFWVzlv?=
 =?utf-8?B?TlhQZXVZb0xxN292VFdBYXNTYXRZRGNRakkwd2NyTWV6c0lXeUFVdEFZMWY2?=
 =?utf-8?B?SWpTNXI4UjNnL0s4OWRmNHVZWkxHaHpIZjBweStLU0U0YWR2WXhYVWptRDZR?=
 =?utf-8?B?cHRhenAwS0V0NzRWVU5xdTY3Q0NYbXVhSU15NWNMc1d2cHVvYXBPQkhsN1Vi?=
 =?utf-8?B?NUVSQkFkaVh3bVU3aDRXUEhlWjlVcE85amRWdUY1UzB0bTcvRnlTclZmS3ND?=
 =?utf-8?B?NXdDcHdKanRrTFVVeXlxUThCTDVVUlZtdFpXUjJWdGRtMVd6SUMvZzJMd0hG?=
 =?utf-8?B?Q3pEdE8rdGxEdTdDWVhLY3VjZVpqSjBLTzJHcG03SmJvSCthVUk0ZklTSFJw?=
 =?utf-8?B?QnBmTnV0bVRDOWpIQ0hBeXR4b3FJYTZPTWtTdm5RQ2c2aEZ1blc5MFNGUGZv?=
 =?utf-8?B?OVN2OEtnL1EzZlhiM0RpVTNIWGxMRGlIakZpOGNJTFF1SGs1ZkpvTjNnRlZM?=
 =?utf-8?B?QU52K1FadFdvNFFtVmhVajJwK05vdTlBWnhVN3BUaVJvRFIxL2hCdW45eU9V?=
 =?utf-8?B?RFpPRUVzSlNvUzlGWjJuRGZ0d3RNSGtlNFBZUTY2aEVzdXVvaXRLOWFwUUZE?=
 =?utf-8?B?b1ZQZENqMklzVFBIR3RnOEE0VG5BTzJUQW9qKzdvZ0ZkT01WNVBKNU1lWm5n?=
 =?utf-8?B?Y3NTSWl5S2VaNkw4enFJZ010NXR0Sm1ZT0QwTW80WWRPamVLNU1Rejd0UXFZ?=
 =?utf-8?B?TDhCY2tYMHc0aTJZRHk1amlVUm9tL0VzckpnSkdwS0ZBNHJxVENXUUFaNEFx?=
 =?utf-8?B?VzhLb3VyaUlUcURrVXlTQzh3MFlicDZBdDBvQTF0aCtZcWIzYmVuSStWdzcx?=
 =?utf-8?B?dnZoaFBRTDEzZXlXbWw5bVNtbjR2aUF6eUpvS0RDcEhOb01uRFdua0hocE9n?=
 =?utf-8?B?RDhsTHB1WDZBbVdkdm9iTUdFRHlFTnh1MjZsbktBdlFhRWErYTZIRG5ZSzRh?=
 =?utf-8?B?NzRLNm5CdTB6dkxCaC9na3Mxc3pWMUNnNHVvRXJ2RGtPWEIwVjFmZDFsNzds?=
 =?utf-8?B?dXE1OEdvVDVkblNLSU4wVTRCRkNsS2VMbjZ2RlNZWGlVSUN2WVAwZWRrNlov?=
 =?utf-8?B?YU9VR0Z3VHkwbUxxT3d1b2dFNDhUR1RiQ0Z4dkJBdjkxWktPZFE4eEVBWVdp?=
 =?utf-8?B?OUV5NlgvR1g4cERqdmJwZUU5akM4UFVlQUxLTmYwQ0VRMndjbDdHZWFjQlNX?=
 =?utf-8?B?U1BvOWJPT0hIZWloWjZpbXlwcUdxU0dEU25GU0pNMG5vekxBRTdreVVGUWZI?=
 =?utf-8?B?OXhsRUU2K3Z2SmlpSFdPVGFuc25HQ0FEVjB6ejhVczk3ZnVZa1o1cjZBbkRN?=
 =?utf-8?B?aWI5QnhtK2pOdnRwWGx6WUVueXIvVzdwZm9UTi9KVW1ibGxOMTRGRG9mNTgv?=
 =?utf-8?B?L2V3cmRSTjZVZ01mVlpvMEYzUEFhdjRxenhjekFMODRndkJEa3VZeVhicnhC?=
 =?utf-8?B?bVFzU0ZxMDdzTlBoWnRaRXVTd00zV0xOblJHUXMyTHVYQ0tpVjVQOGd4d1hJ?=
 =?utf-8?B?WE5FWFRycElhSTdWOEpGbjJGbERpakRwY2N6b052ZDlFS2loK2lScEFUd0M4?=
 =?utf-8?B?QmMrcitobnozOGRLQ1VXL2V4MTlOdUV3c3VYM1dyOVhZY2grZEljQnhXWGds?=
 =?utf-8?B?Wmc9PQ==?=
Content-ID: <3F00AB419325764F8D0F8696E5112274@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0b866b3-f455-45f9-190e-08ddcf579349
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2025 10:55:19.6598
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O1zjru4OaL0CPQ7Wq0XtFQIi0p0bGvUOoYvevlbxA49pIrjEBg6waaATGvxPb4pLdG94tSrMR87OIMr+ZaJf/cULbjXYZuAjR6GhB2VlLLs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8318
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_035524_239033_510557F9 
X-CRM114-Status: GOOD (  14.90  )
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

SGkgQWxsLA0KDQpXZSBoYXZlIGFuIEkzQyBjb250cm9sbGVyIGluIFNBTUE3RDY1IFNvQyBiYXNl
ZCBvbiBBUk0tQ29ydGV4IEE3LiBJIGFtIA0KdHJ5aW5nIHRvIGFkZCBkcml2ZXIgc3VwcG9ydCBm
b3IgSTNDIGNvbnRyb2xsZXIgd2hpY2ggaXMgYmFzZWQgb24gDQptaXBpLWhjaSBzcGVjIDEuMCB2
ZXJzaW9uIG9mIHN5bm9wc3lzIElQLsKgIFN1cHBvcnRlZCBkcml2ZXIgZm9yIHRoaXMgSVAgDQpp
cyBkcml2ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNpL2NvcmUuYy4gV2UgYXJlIHVzaW5nIExT
TTZEU08gSU1VIA0Kc2Vuc29yIGFzIEkzQyBzbGF2ZSBkZXZpY2UgZm9yIHZlcmlmeWluZyB0aGUg
Y29tbW9uIGNvbW1hbmQgY29kZXMgKENDQykgDQphbmQgSTNDIG1lc3NhZ2VzLiBFbmFibGVkIHRo
ZSBmb2xsb3dpbmcgY29uZmlncyBpbiB0aGUga2VybmVsIGFuZCBhZGRlZCANCnRoZSBJM0MgY29u
dHJvbGxlciAmIEkzQyBzbGF2ZSBub2RlIGluIHRoZSBkZXZpY2UgdHJlZS4gV2l0aCB0aGlzIGtl
cm5lbCANCmltYWdlLCB3ZSBhcmUgYWJsZSBzdWNjZXNzZnVsbHkgcHJvYmUgdGhlIG1pcGktaTNj
LWhjaSBkcml2ZXIuIFRoZSBob3N0IA0KJiBzbGF2ZSBjb250cm9sbGVyIGRldmljZXMgYXJlIGNy
ZWF0ZWQgYXMgMC0yMDgwMDZjMTAwYi8gJiANCmU5MDAwMDAwLmkzYy8uIFNvIEkgaG9wZSBSU1RE
QUEsIERJU0VDLCBEQUEgYW5kIGNvbmZpZ3VyaW5nIHRoZSBJM0MgDQpzbGF2ZSBkZXZpY2UgYnkg
dGhlIEkzQyBob3N0IGNvbnRyb2xsZXIgaXMgZmluZS4NCg0KS2VybmVsIGNvbmZpZzoNCkNPTkZJ
R19JM0M9eQ0KQ09ORklHX01JUElfSTNDX0hDST15DQoNCkRldmljZSB0cmVlOg0KY29tcGF0aWJs
ZSA9ICJtaXBpLWkzYy1oY2kiOw0KDQpUaG91Z2ggd2UgdXNlZCBzeW5vcHN5cyBJUCzCoCB3ZSBk
b24ndCBoYXZlIHN1cHBvcnQgZm9yIERNQSBhbmQgZmV3IG90aGVyIA0KcmVnaXN0ZXIgY29uZmln
dXJhdGlvbnMgbGlrZSBsZXRzIHNheSBzZXR0aW5nIGVuZGlhbmVzcywgc2V0dGluZyBjb21tYW5k
IA0KdmVyc2lvbiBhbmQgc28gb24uIFNvLCBJIGhhdmUgdG8gcmVtb3ZlIGFuZCBtb2RpZnkgdGhl
c2UgaW4gdGhlIGV4aXN0aW5nIA0KZHJpdmVyIHRvIG1ha2UgaXQgd29yayBmb3Igb3VyIFNvQy4g
U28sIHdoYXQgaSBkaWQgd2FzLCBpIGhhdmUgY3JlYXRlZCBhIA0KY29weSBvZiBjb3JlLmMgZmls
ZSBhbmQgaW5jbHVkZWQgYWxsIHRoZSByZWxhdGVkIGRlcGVuZGVudCBmdW5jdGlvbnMgDQp1c2Vk
IGluIG90aGVyIGZpbGVzIChwaW8uYywgY21kX3YxLmMsIGRhdF92MS5jIGV0YykgaW4gdGhlIHNh
bWUgZmlsZS4gDQpDcmVhdGVkIGFzIGEgc2VwYXJhdGUgcGxhdGZvcm0gZHJpdmVyIHRvIHN1cHBv
cnQgdGhlIGkzYyBjb250cm9sbGVywqAgaW4gDQp0aGUgcGF0aCBkcml2ZXJzL2kzYy9tYXN0ZXIv
bWNocC1pM2MtbWFzdGVyLmMuDQoNClNvIG15IHF1ZXJ5IGhlcmUgYXJlLA0KDQoxLg0KIMKgwqAg
V2hldGhlciB0aGlzIGFwcHJvYWNoIGlzIGNvcnJlY3Qgb3Igbm90Lg0KMi4NCiDCoMKgIEluc3Rl
YWQgb2YgY3JlYXRpbmcgYSBuZXcgZHJpdmVyIGZpbGUsIHNoYWxsIHdlIGludHJvZHVjZSBhIHF1
aXJjaw0KIMKgwqAgZm9yIE1pY3JvY2hpcCBJM0MgYW5kIGludGVncmF0ZSB0aGUgY2hhbmdlcyBp
biB0aGUgZXhpc3RpbmcgZHJpdmVyLg0KDQpQbGVhc2Ugc3VnZ2VzdCB1cyB0aGUgYmVzdCB3YXkg
dG8gcHJvdmlkZSBzdXBwb3J0IGZvciB0aGUgU0FNQTdENjUgSTNDIA0KaW4ga2VybmVsLg0KDQot
LSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
