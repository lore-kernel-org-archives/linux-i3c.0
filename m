Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F06B5C4345F
	for <linux-i3c@archiver.kernel.org>; Mon,  6 May 2024 05:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/EvtNOgxvbz5KBoFRsnSZ6J6/okdaEPvcfpg3t2BQDw=; b=K78gMoweIi4Z5/
	YEOltXx5H3GYWzUMBnozcdT1Bn2Un5eOI7NJ2gmKILB7/7fWcZI85z9M5sbXHDTOmI8GrqUfo9iwr
	dTe5VYLYDmA659piWmEzoqxegXqv7J1PdZH7G2Ye8Kd2NBs2krv4yJS14H/FuHpp9cxj8fJcn22AZ
	3lZEsftPjBKM04GEm4oRYCgR7ITzzLEZ7Sf//YoLlctY8M3izk1Nr+4IWg9JzUUxJnjgapQL+GeHz
	GvQde1a0lQQeiCdpbQopEgJJth2ZG61ISO1G87Srzwcyk0wbBHr5vd2I3sP7xn4270HYaUFSJqPik
	hbUr40pkgRrcTifDimkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3rDv-00000006DUC-0p9D;
	Mon, 06 May 2024 05:49:15 +0000
Received: from mail-psaapc01on20727.outbound.protection.outlook.com ([2a01:111:f400:feae::727] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3rDs-00000006DPt-1wUn
	for linux-i3c@lists.infradead.org;
	Mon, 06 May 2024 05:49:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lg2vRN7/m2op1zjIiRXH+3A3aSzUZowfbbEJHFlN1EkhN3KWEbif5PlL0RD7T1xueAA6sE261kHhC3ZFawHI2dG+JXj+/KgeRg5LTObDfAKiOpoVXj8h4xcJZSSC5JNQ6g2Be+TQZcL3hgcEiAgd6YmVTnuDQQD/DUMBG8TWBWVBNs6GA3aCQRzSSXVRjlJ36Hqt2rzdzoSpY8V9h2inmtaMKuB+pxitTjPV/m2EBI9Dnvq6W96eAfrTlbvTyi+jvN8L0A/TmmuTeUzGvE7BzRsOwJogxKjcbqAYgrIaBIjMP+7zrMDxiwMExiEII6QNRW7TpT9auxhQbfnw/whN4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yGIu441crHucRHSZmbZWjFQ8YhT5XFTAOi8MEM5iWTM=;
 b=hh07NXREx30s2uAy8iPeEo0flmIqi/FSWBcQ5Zabk66zzAXrREGNFLOcwkYk5uhAMMUxTl7Ru1dYU1yQ3kF6hWyLdFEbfPYm1bhtgNfJy7gUxelXOiA/HGswGpXIjI0LbVhKTpes/fe/bG3fp47hT0hzPYFesoAuvdJPfGkY9Al8ZVuwXbRMoD1KhisUWXX+XOBP86CtSYx1n0zrTjyjsUqgzUxjlIi1Cz8Y9jQjHj94FzZtw/C8lBjpNmstewzj72Y/XJQFtW/xZlxco5hX6QfQBptvYQNoERDFS3MiFv+xFs9UYcEBcTV0tMAx/N2LRvjGpMXTDiQ3pLzSw/SE3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yGIu441crHucRHSZmbZWjFQ8YhT5XFTAOi8MEM5iWTM=;
 b=cmNaQdYnPzrmPG9XDH41HvHDws4dILmAvVQI1Pa95xybRp3/5JIqkznXYTPD9h7hvvEvzDMKzosUEdC47OmY5UdD2uQYaa8bLVEjiQFdd0bq6YzJWlh/G3N1xlOmcz38m60DLwIdwkbqJYcTAg1XzIPml+btfhNfz3p/GcoeVAhPcPN1YKJ1uQV1ntz4OA6jAHyUKxT+jxh8fBxTqWSR4kzQ6Mq7OYVBoTwCTJtl8CTiYCOnKGb0HX0dvLQzWKHy7AfFXhYwmFuFDYhIEgQ5lRfGvilLfcXmR5FoypM/e1n16jHCW2P/pexwSamIH2GJULT6ifUIMNll/gDz8CkJvw==
Received: from TYZPR06MB6567.apcprd06.prod.outlook.com (2603:1096:400:465::12)
 by SEZPR06MB6718.apcprd06.prod.outlook.com (2603:1096:101:181::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Mon, 6 May
 2024 05:48:50 +0000
Received: from TYZPR06MB6567.apcprd06.prod.outlook.com
 ([fe80::6f8f:f3d3:493:bb86]) by TYZPR06MB6567.apcprd06.prod.outlook.com
 ([fe80::6f8f:f3d3:493:bb86%4]) with mapi id 15.20.7544.029; Mon, 6 May 2024
 05:48:49 +0000
From: Dylan Hung <dylan_hung@aspeedtech.com>
To: Jeremy Kerr <jk@codeconstruct.com.au>, "alexandre.belloni@bootlin.com"
	<alexandre.belloni@bootlin.com>, "joel@jms.id.au" <joel@jms.id.au>,
	"u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
	"gustavoars@kernel.org" <gustavoars@kernel.org>,
	"krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
	"zenghuchen@google.com" <zenghuchen@google.com>, "matt@codeconstruct.com.au"
	<matt@codeconstruct.com.au>, "linux-i3c@lists.infradead.org"
	<linux-i3c@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: BMC-SW <BMC-SW@aspeedtech.com>
Subject: RE: [PATCH] i3c: dw: Disable IBI IRQ depends on hot-join and SIR
 enabling
Thread-Topic: [PATCH] i3c: dw: Disable IBI IRQ depends on hot-join and SIR
 enabling
Thread-Index: AQHaSprFD5IIKTS6AEypynuES/HNLbGCio2AgAFFYZCABoIIgIAABIeQ
Date: Mon, 6 May 2024 05:48:49 +0000
Message-ID: <TYZPR06MB65678EE7611DDB825E5404C19C1C2@TYZPR06MB6567.apcprd06.prod.outlook.com>
References: <20240119054547.983693-1-dylan_hung@aspeedtech.com>
	 <563ad5613e9c5f0671e1f49f2d9ba71d8735799b.camel@codeconstruct.com.au>
	 <TYZPR06MB65675E5D43EE265DD702E5689C182@TYZPR06MB6567.apcprd06.prod.outlook.com>
 <645d4f645b1296d54573c4fe734768adab160035.camel@codeconstruct.com.au>
In-Reply-To: <645d4f645b1296d54573c4fe734768adab160035.camel@codeconstruct.com.au>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB6567:EE_|SEZPR06MB6718:EE_
x-ms-office365-filtering-correlation-id: fd2c3e88-a751-4c1f-03f4-08dc6d9033f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|7416005|376005|1800799015|38070700009|921011;
x-microsoft-antispam-message-info: =?utf-8?B?Y2hIMERxZU9jd0RnSlBHZHFDRlQ3ZmZPem1kNm1HeUVqZjMzOGpGUTlFRUlV?=
 =?utf-8?B?VG1rSnRVQkJFT3VJZnBXWmlSMVU5a2N4d25lTW4vaHpkbnNQWlJHOWlSak5z?=
 =?utf-8?B?NjF6dUJ3M252OHhGWFdJSHNQRU0wVzg3SFhVZENsbGRsUVhOYVV3VkFJcjls?=
 =?utf-8?B?VHpaSUcrM3ZkTDlCWXJXSUovVXg0MjlreitYNXlTWVpMZmRkT3pneVAzSWtK?=
 =?utf-8?B?NmMwOXFCM1ZBYXBKc0NkZVFEQjZYZXVYNU5NVkZiY1Y1Z3ZnRjFSOVVWd2Nh?=
 =?utf-8?B?S2QzaU5wT3lnVlluYnVYaGJiL3A4MmE4TkFIWWdiOHV0T083MDhuMUg2ZVpt?=
 =?utf-8?B?emkyUXlHdE4zZi91STdFWWZheHFnRDI5ZitTQWMyT09NVkw0NGVoR25mNVFL?=
 =?utf-8?B?dDdETjVqZlRiM25SSjBvbHMrZXEzRHVyeUlHSDJ0VHN6Snl1dDBpbUdNSHF6?=
 =?utf-8?B?ZTE1YlFPUHozMWVTUG5kT3VIODZhcWtRQVNYSDhId1oybmlOdnNrQXpPdlR2?=
 =?utf-8?B?czBaQ2s1SStnOHVIMXYxeUw1WTBFZUxPVXZQVitEQ0dLdGVpSEJseGkwWVRz?=
 =?utf-8?B?NXE2d25xcjRndXBVOWl4NGFaTnoxYXl4UFJVSjJIUTNScEVlQ29meVVOcWNq?=
 =?utf-8?B?QlFqeDhnbDIwbkFmS3NkSVB3WXpVQ3RNdit5b216RDU2S1BFR1JGbXZSVnYz?=
 =?utf-8?B?R0VoTEhjcm9rbEx1UjE0emRORGdrTGxSdk5RRFZabCs3SUN2T1VDRkdBSEw1?=
 =?utf-8?B?c2ZHTUZOZmJlalBEcEtPZkdSS3VaalFmSk5tNy9uRXVLdVdvWUtGaGJDNUo0?=
 =?utf-8?B?ekpBKzZmTHIwYzV2eEJndDF0c1lhYUhYaFppVDJUaDlwMXhUNk4zajRucXRX?=
 =?utf-8?B?ZnUxUnZray9tMndJeWhRTDB1dS9ORUJyMFRFdEQ5WUNrZnlNNTJ3ZDZwRUZD?=
 =?utf-8?B?QVQ2YjNTNll4NnlHeFBiMGtFVGIySTI0dTRaTUtDWGdmWDgwRmF5UTgxOGlS?=
 =?utf-8?B?ck5kYjJqK3REZFdRQUVISHJwNDdYdmtWUGJueXNyR2VwVTEzNnlyV1FJTFg0?=
 =?utf-8?B?S0o3MmpXWE9IN2w5NGwreURKbi9tUXlBZVc1QWZaUHpYRE93M3Y3RFJZL3VX?=
 =?utf-8?B?eHhXWVJWb0lhSGhXSDEvclBhK01TUUdKckI5VitJWFBScmZRaW02YjV6ZWdy?=
 =?utf-8?B?WmJzamRYUnVSS0syNC9aQ3FRN3AwZkErcE5JUE1SOHJhYWVtaW4yYkR0Z083?=
 =?utf-8?B?b2ZaVHQvaGljL0FtdUJSZTRNV25oU3NPWDJ6NlpWNlpuSG5BMGdqeXJTNmFE?=
 =?utf-8?B?bXZQbjJ3TmlmSUprNEEvZkRIUHJhRDJ6MDVoNzVIQ2cyNDFEMEhwcmxDaTJi?=
 =?utf-8?B?Wnh0WXZkZHF4RTJqNWZzc2doSWljQUZIZEU5c2tTRTFkbW5yaHc1L3ZNVUZs?=
 =?utf-8?B?R0hvTkJBMkZDSDdhTHdRNFgxaHd5c0lwSllXLzRuU3dCK0NKdnNrM09xZ3p5?=
 =?utf-8?B?cExEK3cxQjZNMHhRdDRrdVVoNFYwazN1L0lVNjRoQUNYWjZWTDRNSjBDOVlz?=
 =?utf-8?B?LzNXZjhDaHdYa2t1eUdMVy9xZVc0OG5Yd01rWVpFcWs4WTJHSG1NNDd6NlZQ?=
 =?utf-8?B?eml4UTBiQkNCeHNzMVYvbldCb3gyN0VCSW9ES1VVaDdEL2s4N3crVUZlbzBT?=
 =?utf-8?B?R1k2YVp2YW55SjdPbVgxbXNRQmtXM2dCVzU0OU8wcVJYTjQvQmQzNlUxbEV2?=
 =?utf-8?Q?XF85dKmJNRWjFkeASg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB6567.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(376005)(1800799015)(38070700009)(921011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K3BjaWpRNDA0S29ESGNPeTlOT2VUT1BYSzd0YnVyNkFxZk5SYWJXOHdHQ1Z2?=
 =?utf-8?B?NWhLS21IYTVVdXF5UHVwR3NRTUJKK3RWQnVBUUhvdHJOZmRuaGQ3WjR0UVpP?=
 =?utf-8?B?Q3lCNkZYUXh5MHFFRU5PZmJWR3hZYStqK0lieENiN01SdzZFSFBjK0JDcHI3?=
 =?utf-8?B?NGlvNDdYVTlqMVk3d3FXeklVb2wxdGlxaW53WnZ0SERnMEdyNjRlUTFBRHVL?=
 =?utf-8?B?b3k0WVBEREtKMDVoUkhRWU9rczZabHNkdTlvQXk0SWNnRVFGMjhwL29VeDBB?=
 =?utf-8?B?ZzN2aHB5R0dXWjB4NHRLKzlpMjVvNjdtdnVYTGtZa1A4eFRFT0ZocW5nWEEy?=
 =?utf-8?B?VGtQNjgvVGFIVW90MnBiTU9xVUdmbC91MitXN0xhc0hlakhsOERtL1N6MWZa?=
 =?utf-8?B?YWtNSkV6aXpaWmYvblErZGJIWlNBZmNBUjhNMkgxNzdzYzRnTkRwS1ZudDNo?=
 =?utf-8?B?aWNVOFJlNDN3b0MrUW5acnlWQVIwK0FsTldMMVU1QUliV0RTMisvWFpEWUNN?=
 =?utf-8?B?Y0g5M3V6L1FqeHM5N2JXRmVHbStrMVo4enAvMjcyTUJkQzZwbVNSalNsbGJX?=
 =?utf-8?B?dllOUjlCME5tOWJFbHI5c0hVNTFUSkl4UytsVHYyN2NHMzljdFhxbWxYcU1j?=
 =?utf-8?B?aThKZ2ZMdlduenJnNnY0ckhmS2l1Y21hK3FSQU1JTHhZNjZscGZNTEZqSW5h?=
 =?utf-8?B?N0VFUXIzQ1NQSFJEb1FJY0RQVXVQV1dhQUtheVBkRk44bjVOMXZkUWVjS3oz?=
 =?utf-8?B?SG11bkJReDc1UUc5U2gra0VrN0JxOXFhTkZFR3VBRnhwTi9hK1FjOXdTRDV5?=
 =?utf-8?B?elVRVmlCeEYvRXZNU05nU0ViVy9BSlFiM3NHM0Z0ZWtTZlhkaW04dmhlODZN?=
 =?utf-8?B?ZFVwdnhMci9ES1VvWlZaWXRtUzVwdS8xcnkyMDVMZkhyZ2J1NDBmQ1l3dm5B?=
 =?utf-8?B?cjhjM0lWVEJPNGVUdVFIOXp4R3hURU1EMS9BZER0NmtYdGNZem5uZm5EUG01?=
 =?utf-8?B?NjVqSTlVenNYR3oyeHVOdGNBVkhpRHpCd1N0L0tGNmJzZG4wNXZCQUMxamg4?=
 =?utf-8?B?bkFWbnlsK0VueUpsOUlqK2IzU0doSnI0UlNhWTg1RFBLV2dsRkN3clFEWGhu?=
 =?utf-8?B?bE1valhOR0tZZ21aQjRyKzRodGYzbzFUNkkxL3NUakFxZmo1RVVGdlBJdER1?=
 =?utf-8?B?UXNHYlhIVzhKNTlWUkRWOFRUbm51YmRneVhzVUd5WlBQVnR2eVd0Uk4yaE1V?=
 =?utf-8?B?MUJUeXR2ekkxZTZ2bkpsNXJLY2ErTGpzWUFYUEVQTTFZNEFBMHdIaDVBK2Zh?=
 =?utf-8?B?OXF4akZRcDA5VERsNXVoY2FJYjRZeVB6YXBseFlYMTZnREViS1VFTUxDQndE?=
 =?utf-8?B?SFFESGNiclI5YUEwOE9RaEs3aU1id2Q1eDArc2dIR3NpdUNCZGp5UFBXUGhp?=
 =?utf-8?B?dFA5bFZqYi8wSXJkSkZFVk5ZRm9VRFBpVjF2c2NoaGJGRGpiSWdneGtXMEkr?=
 =?utf-8?B?ZWlkNjdhakVpNnF0M3V3djZTVlN4SHc1N2V6MWpISnVaNGR1NXFzcVBwcVpy?=
 =?utf-8?B?VlZPNzBTOVBHeEhuNFo3RmpKWjlzdUhXV09HTVVzaENVVkFjaE9SdnE2bXNr?=
 =?utf-8?B?RUJscUFhUHZrcVovaG1KdkVxV0x4ZFkrbFczV1N1d0VqZW8vL01QbEhEdEwy?=
 =?utf-8?B?Sk9YMlhpOG1YWXNOZ05USGRWQTVQMjNBYVRPaGlWTkpydW5VWUllSllkcTh3?=
 =?utf-8?B?djMyWUkreTBjMGxwUktpNnZ0WFE0YkZTamxkdkxSdUZ5YjUwMGswWitvbk9h?=
 =?utf-8?B?U1FiOG5obkZqbXZNMDVJM2xJdEFrTzJKUU5TeEZXaFFkdXVWOWVzQW5Ibk1K?=
 =?utf-8?B?RlVDQzAwblV6QXVMS2N5NDJsVSs5UXgvSU4xRXA3Z3hKanJGOS8zajdpNllU?=
 =?utf-8?B?VWQ1K1ptQnZUTmpFSkgzbjlyVlZFNUkwT29acTQrSmg5aDVjOXpobE9iVEZz?=
 =?utf-8?B?Q3FrVzZncnBWZGpIRDlIcUlHZWdCV0dWMEFVN2dPakh5S29kZlJOUU5pWnhD?=
 =?utf-8?B?M3RKWG14YmxEZGtHOEZIT1VXSWV0cFBCZ2k0UW5yYWwvck55MTlWSktudlox?=
 =?utf-8?Q?YNSmndpA0Uqp2XiCyVtE/3fAi?=
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6567.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd2c3e88-a751-4c1f-03f4-08dc6d9033f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2024 05:48:49.4044
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GohdejZrcG7gSfG8oUSTf1dDvTaqDm/JMOovWe3r6H3jAGukt1jgn+/Rq7i/ik+lAY8TukKF0u/g7csqZdxs4QZpAOuQwFWFJBOBmQ5+7s8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6718
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240505_224912_518816_AE269CEB 
X-CRM114-Status: GOOD (  25.88  )
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

Hi Jeremy,

> -----Original Message-----
> From: Jeremy Kerr <jk@codeconstruct.com.au>
> Sent: Monday, May 6, 2024 1:10 PM
> To: Dylan Hung <dylan_hung@aspeedtech.com>;
> alexandre.belloni@bootlin.com; joel@jms.id.au; u.kleine-
> koenig@pengutronix.de; gustavoars@kernel.org;
> krzysztof.kozlowski@linaro.org; zenghuchen@google.com;
> matt@codeconstruct.com.au; linux-i3c@lists.infradead.org; linux-
> kernel@vger.kernel.org
> Cc: BMC-SW <BMC-SW@aspeedtech.com>
> Subject: Re: [PATCH] i3c: dw: Disable IBI IRQ depends on hot-join and SIR
> enabling
> 
> Hi Dylan,
> 
> Thanks for the response! I have a couple of follow-up things though:
> 
> > > My interpretation of this change is that we keep the "global" IBI
> > > irq enabled if hot-join-nack is set (ie, always, because we don't
> > > support hot join, and configure the hardware to nack all hot join
> requests).
> > >
> > I would like to clarify the control logic, incorporating the principle
> > of disabling the SIR interrupt signal:
> >
> > Case 1:
> > When `DEV_CTRL_HOT_JOIN_NACK` is set, indicating `hj_rejected` is
> > true, it signifies the controller's non-receptiveness to the hot-join
> > event. Consequently, we can safely disable the SIR interrupt signal if
> > none of the target devices request SIR (reg == 0xffffffff).
> >
> > Case 2:
> > When `DEV_CTRL_HOT_JOIN_NACK` is unset, indicating `hj_rejected` is
> > false, this indicates the controller's readiness to engage with the
> > hot-join event. Therefore, it's imperative to keep the SIR interrupt
> > signal enabled, even if not all target devices request SIR. In this
> > case, `global` is false and `enable` is false.
> 
> Yep, I see what you're doing there, but it looks like the correct state would
> never be set if we're not enabling/disabling the IBIs separately; with this code,
> we would only ever enable the SIR for the HJ if we
> *also* happen to enable IBIs.

When we want to enable the SIR, the current code doesn't check whether the
hot-join is enable or not. The modification I made pertains to disabling the SIR interrupt.
It doesn't alter the logic for enabling the SIR.

```
	reg = readl(master->regs + IBI_SIR_REQ_REJECT);
	if (enable) {
		global = reg == 0xffffffff;
		reg &= ~BIT(idx);
	}
```

> 
> The initial state would be to have all SIRs masked.
> 

Yes, indeed. The "global" variable is also true because "reg == 0xffffffff" is true.
Therefore, the INTR_IBI_THLD_STAT bit will be set in the following code.

> > Billy recently submitted a change to implement the hot-join
> enabling/disabling. Therefore, it is timely to consider the hot-join
> functionality.
> > https://patchwork.kernel.org/project/linux-i3c/patch/20240429073624.25
> > 6830-1-billy_tsai@aspeedtech.com/
> 
> Yep, I saw that, excellent! It's next on my list to take a look at.
> 
> It's just a little unusual that we're enabling the HJ interrupt before actually
> having the HJ support though.
> 
> Cheers,
> 
> 
> Jeremy
-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
