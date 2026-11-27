Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6AD606A329
	for <linux-i3c@archiver.kernel.org>; Fri, 27 Nov 2026 13:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kfJfx7D/;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=Z4sUDsjg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5UzzYF+47jYQ67o2l5dlRfkyW6IFbawrlsVNF2kQoEQ=; b=kfJfx7D/cuSzFyJ/5R0n0EQKOu
	gxUzS78c9jFPkTFmcoNlLin520FBlrgBTtvyv8KBDnOhQr508nc+rNwEJOP1s9GI2i6EiXEZni5Qo
	I6JeM894vkqGc048ttAEUCYY7mbB0IVXxfZmcTKPQxbjuZhBdJvdUrqbmlqQbn5czs7R1lPywls7d
	xlXHlDSSIAbaF2ONx+3p5JhrznaKdzh8pz70pRpn5eAwRp/Te1fv2cm5t2f7TprqtXRKHTzXRR4Yy
	ADXQmPSiHU38ki5du9uki+r8G+4Is9b1CdurM2EVBxBEjkLZ7s3+Ch1khZ+u6GjVQuak1fE2qCKyg
	em/oT87A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwMR-0000000GJ9p-2RYl;
	Fri, 27 Nov 2026 13:51:35 +0000
Received: from mail-japaneastazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c405::1] helo=TY3P286CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwMO-0000000GJ7T-2YB9
	for linux-i3c@lists.infradead.org;
	Fri, 27 Nov 2026 13:51:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qt1FhDVSSPsEs02ppDIfHhzGEI0WuKaRoVOk050z+odmUWKC7tN9g7Uu6XqCSbKHPbqWDkH4Nl3vC64cKPBeA4rk5Ov2kks6k9/Cig2vORQfju3mYqPDgCLQP8cm4ww/33/BlFXDKMoe2xUvTP25alBBzvuiJR8TanwkYH/sWC+BCwj60UvUokmSjSOUflNr02NFvvPIDVy0V3QyMdnfmvyIuiQgOwBOd3jApbSfcez2U0sauTVbSGDfzgq/zbpP/HcWUF9Q1Jnu4RJjBk4wDKbJFFeEUvAdPyxsAqxxMPP41EIdXz/lVkU4gtQXElAsBQGAVN9RRv9YP0TJiRhZZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zfo3H2DVXSEm3U1wLHu/CQbo35QCCW4YqgWXFfojTIc=;
 b=Se3gQL/OpXpI+6mj4Z/VuaXE2Hx0rTA8ylhjijW1BR6P66W4ba0sBHASbp3ujLauCXE67yR51angMvScY56FHo6v9tQlnFl174OHNZfP6FP/4x7FOY9pWE19DJCLf4tchLCLGPEDs0+qrfMiHzMgCt+D7AZVp2oXrH+pi2kwf5JY6MtmQbZrcJFkF/86zEXsZXmoHySKWxQYHFVEenFnVxSDn/TgFRrVqCPm5BEWYkWbVJDx9l4AmN9gnRBVdzflYd3PocnEkvRma/LASbjzXkcXRjzTbrjqS3++fLUIOQz/WW6asd85SiJxmINDoFQfzTK0/784DyoNmgFUioQLOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zfo3H2DVXSEm3U1wLHu/CQbo35QCCW4YqgWXFfojTIc=;
 b=Z4sUDsjgZ+TrWcPSAaJ8nNsW3tnaEv1fPwQ6RQxmmpInd3fviSxnTBb4y1qN5Gi5soI9gO7iY2uslzaLmqGwGrVoQWGhIBMrWvqIgM9PKbeeWaa8XLFnjK3okM5SykjHlMaEkcwgGeZKSIKAHa3nokllyiiu9VOJlwLAzFpI404=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15118.jpnprd01.prod.outlook.com
 (2603:1096:405:1a1::11) by TYWPR01MB7307.jpnprd01.prod.outlook.com
 (2603:1096:400:ea::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 13:51:25 +0000
Received: from TYYPR01MB15118.jpnprd01.prod.outlook.com
 ([fe80::1116:d56:8164:63b4]) by TYYPR01MB15118.jpnprd01.prod.outlook.com
 ([fe80::1116:d56:8164:63b4%6]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 13:51:24 +0000
Message-ID: <d132b7e9-ead1-4f6b-a3c2-7240b89156ae@renesas.com>
Date: Fri, 27 Nov 2026 14:51:11 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] i3c: renesas: Fix zero I2C SCL rate on pure I3C
 buses
To: claudiu beznea <claudiu.beznea@tuxon.dev>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, stable@vger.kernel.org
References: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-0-2e76b87209bb@renesas.com>
 <20261026-divo-ssgrlpcsrc-2966-i3c-v2-1-2e76b87209bb@renesas.com>
 <bd8014fe-6a77-445d-b73d-e87404638593@tuxon.dev>
Content-Language: en-US
From: Diogo Ivo <diogo.ivo.sx@renesas.com>
In-Reply-To: <bd8014fe-6a77-445d-b73d-e87404638593@tuxon.dev>
X-ClientProxiedBy: FR4P281CA0271.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::20) To TYYPR01MB15118.jpnprd01.prod.outlook.com
 (2603:1096:405:1a1::11)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB15118:EE_|TYWPR01MB7307:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b2956d4-8272-40ff-a0e0-08df4c8d867c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|11063799006|4143699003|18002099003|261009223027099003|261009221227099003|22082099003|921020|10067099003|56012099006|261102123227099003|261028144727099003|261026140227099003|261026121527099003|261021123027099003|261021121427099003|261022105027099003;
X-Microsoft-Antispam-Message-Info: jCeLZr7PB/SXjpp0MLhCNulA1HblVsB7f6nYO/Xwh37XtD4Ry5MOZwuWd2i/6FFZvuaMy5q3ROt1HB6LejiS/U30U2DFkD7soywZ9KWtt/Xxerhu5cwxm5VbRWRkZjPEABgTI8JHaYLIMH3B01lazK0XXJnmeqG8TrjgvPsNne+ac1ok8ifKgcXnU7k7lYgX6msipEvSpGkJJx/pG7TGJORNqx+ex5dAJzmSzIxswip/7a5wnt3E2RkSq3Y7fX/y75LNXqEcaa/lfU/LjK5eVfIBKEniBHh2GarA9zK1Odu1haXmQBOEiy1hr9Z6kqZNkBXvE78U5oosqzy6JfYGFQLFCktt6krPCCL4MXIynsK6vO58dAepLdOXVNreKM0cEAwAX/ivNgGMY+vNmnll1rjVcm4lpl/cm1UwxexRDKTXw4dzZOzC643ae0ehraD9GCLKRtyA/UKVoqVXv3K4hV8AVbrCTBQsHz8uxQW5kyrUcdGCycw5z4sPD5q3lGvYhVgDVQ0m66+AJC9q4kvgMlo7dQ4Avu1rr1U//AkLTOtF9KRHuq85CIIM1aMhM6hEo5Rjr7fj/LrGHjsu6X1RRQ3N3MPOrfECKafB0cLwH27ALT/PCptBB182CYcXNgqYQ+bsMGGmuOJOLA9clwzaqP59TI04lAYQ5GpEXFvu6e26J5kNUlUhaCD62N3Z4jK2j0Lp5nzFvVfTJnhO3Ih1+Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(11063799006)(4143699003)(18002099003)(261009223027099003)(261009221227099003)(22082099003)(921020)(10067099003)(56012099006)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(261021123027099003)(261021121427099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmNMdmNBSU44amU5V0V1NDNhcU5aWEpTcGxlRU5GK1hSZEpYRDJ6ZHRVT0dC?=
 =?utf-8?B?cTIwTmVhS1VoeFJFOC94aGFjd0c3RzZ0U0dheEVqaHJQUjNaRHBsMUFqV0Jm?=
 =?utf-8?B?emxIVDNiYjhMaEhpVzFXL1plSnNwYW03OFpRQVZWdGpreUx3VEM1bm1oR2Zx?=
 =?utf-8?B?aVk4amUySlk4ZHJjcU9VQWlQS09rKzRsN0hMS0RjeTdrYkVCbkprRE9Cdy8w?=
 =?utf-8?B?b1U2Z3hibUJYQUlWME9icEFQOFhLOVpLS1gxMXgzMWd1b0UwUVlCQ0M0M0Ur?=
 =?utf-8?B?aXRzNGtOaHlkVEl5RzRZdFN1MUdEQmorV2tlU1dNWHpuRnAwb1FZdCt2QTJr?=
 =?utf-8?B?RnJsMnN5MjdBa3VsbE5YUUorUllzc0ZxNHpnaDl4OU91LysvRE9ZcUdCcmNp?=
 =?utf-8?B?bTFFMCt2enFzUlpvT2d1M01kUlV5SnU1TGVWOENxOXlQalBZNGdYb3JjMEpB?=
 =?utf-8?B?RWFHNEI4UXJsT0ZwQ0JMcXBsV3ExWlR0VkEvUzFyYkhGSlZTQXNZTUs0K1Ry?=
 =?utf-8?B?akgvalJCWHdEeitXTFVKa3pSTVJXMDJrQnFIcU9VbUdSdzNXMkVCSEFzUkJQ?=
 =?utf-8?B?N1dHRUYrbmJsN01jZUpOY0hsbzFickFRdy9TTFFVR252NWwwOFFmVTN5K3Vq?=
 =?utf-8?B?a0RlYythN2Mzb3o3U29jcnBUNW9JaGliQXY1NG1JTmQxK2FOeFV1WTVIOGlM?=
 =?utf-8?B?eWFjdFpXaWM1T1BtY0p0QWpaWjVBTnM1SzB3SCtacUdsWjFmY3U3Vndjd3lF?=
 =?utf-8?B?TllIN3RVcUFqVGV3MERQL0Z5dENOamJXem40cEM2RW9pM09YOUtJWGZ6eXpZ?=
 =?utf-8?B?ZmJ1Y1NlN1RPdmMyWmM3L3g4M0lEbFdRT0VyMG9RL0ovN0ljVjBFdk5kaWhB?=
 =?utf-8?B?WEZVSjlHc2I0Y0hWWU1XYWNSQTdyQW1WZHJqcWlyU1FaNytwamxlN1NwR1Vm?=
 =?utf-8?B?RlJ6dm1JMm1TU1dxYVpPWG4rQ1lXS2JINURwVm1VcHlObUFlelExWHMwNW5S?=
 =?utf-8?B?bVZVS21IRFh6YVhiZ2t1ZUJaU0JBNFVCMnZKSWhkRitkaVBZblVGUFFEaldH?=
 =?utf-8?B?azJzNCtxYWpVdlF2SU1pdk0zRGNRMUVUTHJKbk9sblRJQkxWSlpvVzVYcUli?=
 =?utf-8?B?OCsyWDZHY2VvU2xjMFl0K2xVRXdGRndFQzhlY3BMMExkaE9OLzRMVW5qY2lz?=
 =?utf-8?B?bElKa2lHNUtyMUFhb3hXL3R6UjF3SjBpR0JNZzJtM25JOTFpbGZ4VXhWejR3?=
 =?utf-8?B?d2Z0NUVDekxuM3hPZldCS3pKMHVxakNsUzY1NzZ1T2tlTEdSRmRqanJwY2s3?=
 =?utf-8?B?eXFwTWdYcXJxV0djcE91YlpDcmZVWmhBRytzNlY5ZkJRZHlTSmhva1lhNTVh?=
 =?utf-8?B?V2RlMEU4WnNPMUZReGthbUY0VTBtV3VWQjVnd2U0SW1rNWdVL0lEbnVqNjdS?=
 =?utf-8?B?S1RXY3FveTFrbU1tOVZtVEpld0J1YTJWcnFSc05kbzBMMkloNUpnSXpiNVQ3?=
 =?utf-8?B?UmtwaHkrd2ErT1pvRXNQY2dDeDhveXRycmZ2Y05YdWQ0eDh3OEtqU1JNbGpi?=
 =?utf-8?B?VjJSMis0V3hLOFZuckxhbVpFRE1oMmRQRlJYMVVzQ2Z4eXlIYzVHSWxDTkN5?=
 =?utf-8?B?SFhrN242RS8wc0ZGZmNGWWxVTlBlcjRqTjN4dUxyYnJZTG9Kc1FaUzZHdWZo?=
 =?utf-8?B?K3BaUUYvRWNrdHJJelE3Szhzb0dwUkhUK1EzOEMvNmFCNDlJUDJjVnhsWkVD?=
 =?utf-8?B?QUIwQXJ6cGNqOXJobzVDWmw2ZEpTRkVBMkkzQXFvdEFmbnZDa2tLM0IvRERC?=
 =?utf-8?B?NGdDOEhmMXlkZ2ZMc3k1dWtKNDBFdWV4U1Bua2tHVVZSMmZMY2pvY1I2ZEVX?=
 =?utf-8?B?aHJnMEJ3UjdrMFZRdXd5SG83TjdWQmR4VXZwQ29pM0JtcmN5ZUcrTG1ya0hM?=
 =?utf-8?B?d3pNZFhFWHV3TnNQUTE0WXZRVU1sNkVYaFF6NU84WUVNcnpJZFdUV1NNVFpJ?=
 =?utf-8?B?RXFlNHZCdk9VYkwraTUyaW5EY2lFY1dOOFN1a0VrSGw5N3lWdDJ2VWQzYS9k?=
 =?utf-8?B?bzZDNEdUc21ERnVvbG1qT0dsYW9VYldWbU9TdTltcjlGSS9EUTQyd2t6UmxO?=
 =?utf-8?B?blVVZmx6WWNHaHRIUVFKclBIV1dQSGUvVDJ0ck9TSG81MkkvaEx3ZWJNejMz?=
 =?utf-8?B?dStwZStFdG50MnN3SGl4UDkwNXNpOCt4ZzAwQzNIU2NlczZHbEV5L3NEQXcw?=
 =?utf-8?B?N1dYRjFKekR1OE9FMzJqc05HcmZTODRRd0Judi9WOWQzelFzRmFma25ManpI?=
 =?utf-8?B?elpWdU9JVFpYU0lZeHRXV1JrS1VUOXp0cW01ck1qVVFuK2FXZkhkbFlEcXNG?=
 =?utf-8?Q?j+wx+zhAeENYhzIE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b2956d4-8272-40ff-a0e0-08df4c8d867c
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 13:51:24.6549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dgmXsENx4njtMFIbbJCyalU+AWzcUlC8Bmylu/NWVJGeuGG6/rkz4kCU+2H9P81QsQcLQoSUeQlU1X11PbouwXHc45js2BjIBaUkaNmPbq8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB7307
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_055132_661851_46689515 
X-CRM114-Status: GOOD (  25.53  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMTEvMjcvMjAyNiAxMDoxMiBBTSwgY2xhdWRpdSBiZXpuZWEgd3JvdGU6Cj4gSGksIERpb2dv
LAo+IAo+IE9uIDEwLzI2LzI2IDEzOjM1LCBEaW9nbyBJdm8gd3JvdGU6Cj4+IE9uIGEgcHVyZSBJ
M0MgYnVzIHRoZXJlIGFyZSBubyBJMkMgZGV2aWNlcywgc28gdGhlIEkzQyBjb3JlIGxlYXZlcwo+
PiBidXMtPnNjbF9yYXRlLmkyYyBhdCB6ZXJvIGlmIGkyYy1zY2wtaHogaXMgbm90IHNwZWNpZmll
ZCBpbiBEVC4KPj4gRGVyaXZpbmcgaTJjX3RvdGFsX3RpY2tzIGZyb20gdGhhdCB6ZXJvIHJhdGUg
cHJvZ3JhbXMgYSB6ZXJvLXdpZHRoCj4+IG9wZW4tZHJhaW4gU0NMIGludG8gdGhlIFNUREJSIG9w
ZW4tZHJhaW4gZmllbGRzLCB3aGljaCBhcmUgc3RpbGwgdXNlZAo+PiBpbiBwdXJlIEkzQyBtb2Rl
IGZvciBleGFtcGxlIGluIERBQS4KPj4KPj4gRmFsbCBiYWNrIHRvIHRoZSAxIE1IeiBGTSsgbGlt
aXQgaW5zdGVhZCwgdGhlIGZhc3Rlc3QgcmF0ZSBhbiBJMkMKPj4gZGV2aWNlIGNvdWxkIGhhdmUs
IHNvIHRoYXQgYSBzYW5lIG9wZW4tZHJhaW4gdGltaW5nIGlzIHByb2dyYW1tZWQuCj4+Cj4+IEZp
eGVzOiBkMDI4MjE5YTlmMTQgKCJpM2M6IG1hc3RlcjogQWRkIGJhc2ljIGRyaXZlciBmb3IgdGhl
IFJlbmVzYXMgCj4+IEkzQyBjb250cm9sbGVyIikKPj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5v
cmcKPj4gUmV2aWV3ZWQtYnk6IFdvbGZyYW0gU2FuZyA8d3NhK3JlbmVzYXNAc2FuZy1lbmdpbmVl
cmluZy5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IERpb2dvIEl2byA8ZGlvZ28uaXZvLnN4QHJlbmVz
YXMuY29tPgo+PiAtLS0KPj4gQ2hhbmdlcyBpbiB2MjoKPj4gwqAgLSBTdWJzdGl0dXRlZCBpZi9l
bHNlIHdpdGggdGVybmFyeSBvcGVyYXRvcgo+PiDCoCAtIFBpY2tlZCB1cCBSLWIgZnJvbSBXb2xm
cmFtIFNhbmcKPj4gLS0tCj4+IMKgIGRyaXZlcnMvaTNjL21hc3Rlci9yZW5lc2FzLWkzYy5jIHwg
MTAgKysrKysrKysrLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIvcmVuZXNhcy1p
M2MuYyBiL2RyaXZlcnMvaTNjL21hc3Rlci8gCj4+IHJlbmVzYXMtaTNjLmMKPj4gaW5kZXggOGIy
NjRmNzJlNTVjLi43OGQwYTJjNGExOWUgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rl
ci9yZW5lc2FzLWkzYy5jCj4+ICsrKyBiL2RyaXZlcnMvaTNjL21hc3Rlci9yZW5lc2FzLWkzYy5j
Cj4+IEBAIC01NzksNyArNTc5LDE1IEBAIHN0YXRpYyBpbnQgcmVuZXNhc19pM2NfYnVzX2luaXQo
c3RydWN0IAo+PiBpM2NfbWFzdGVyX2NvbnRyb2xsZXIgKm0pCj4+IMKgwqDCoMKgwqAgaWYgKCFp
M2MtPnJhdGUpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPj4gLcKgwqDC
oCBpMmNfdG90YWxfdGlja3MgPSBESVZfUk9VTkRfVVAoaTNjLT5yYXRlLCBidXMtPnNjbF9yYXRl
LmkyYyk7Cj4+ICvCoMKgwqAgLyoKPj4gK8KgwqDCoMKgICogQSBwdXJlIEkzQyBidXMgaGFzIG5v
IEkyQyBkZXZpY2VzLCBzbyB0aGUgSTNDIGNvcmUgbGVhdmVzCj4+ICvCoMKgwqDCoCAqIHNjbF9y
YXRlLmkyYyBhdCB6ZXJvIGlmIG5vdCBleHBsaWNpdGx5IGRlZmluZWQgaW4gRFQuIFRoZQo+PiAr
wqDCoMKgwqAgKiBvcGVuLWRyYWluIFNDTCBmaWVsZHMgb2YgU1REQlIsIHdoaWNoIGFyZSB1c2Vk
IGZvciB0aGUgREFBCj4+ICvCoMKgwqDCoCAqIHBlbmRpbmcgcmVhZCwgYXJlIGRlcml2ZWQgZnJv
bSBpdCB0aG91Z2gsIHNvIGZhbGwgYmFjayB0bwo+PiArwqDCoMKgwqAgKiB0aGUgMSBNSHogRk0r
IGxpbWl0IGluc3RlYWQgb2YgcHJvZ3JhbW1pbmcgYSB6ZXJvLXdpZHRoIGNsb2NrLgo+PiArwqDC
oMKgwqAgKi8KPj4gK8KgwqDCoCBpMmNfdG90YWxfdGlja3MgPSBESVZfUk9VTkRfVVAoaTNjLT5y
YXRlLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnVz
LT5zY2xfcmF0ZS5pMmMgPzogCj4+IEkzQ19CVVNfSTJDX0ZNX1BMVVNfU0NMX01BWF9SQVRFKTsK
PiAKPiBUaGUgbWFudWFsIChhdCBsZXN0IHRoZSBSWi9HM1MsIFJldi4xLjMwKSBtZW50aW9ucyBv
biB0aGUgZG9jdW1lbnRhdGlvbiAKPiBvZiBCRkNUTC5GTVBFIGJpdDoKPiAKPiBTZXQgdGhpcyBi
aXQgdG8gMSB3aGVuIHVzaW5nIHRoZSB0cmFuc21pc3Npb24gcmF0ZSB3aXRoaW4gYSByYW5nZSB1
cCB0byAKPiAxIE1icHMgKEZhc3QtbW9kZSBQbHVzIFtGbStdKSBvZiB0aGUgSTNDLWJ1cyBzcGVj
aWZpY2F0aW9uLiBTZXQgdGhpcyBiaXQgCj4gdG8gMCB3aGVuIHVzaW5nIHRoZSB0cmFuc21pc3Np
b24gcmF0ZSBhdCBvdGhlciByYXRlcyAodXAgdG8gMTAwIGticHMgCj4gW1NtXSwgdXAgdG8gNDAw
IGticHMKPiBbRm1dKS4KPiAKPiBJbiBjYXNlIHRoZSBpMmNfdG90YWxfdGlja3MgPSBJM0NfQlVT
X0kyQ19GTV9QTFVTX1NDTF9NQVhfUkFURSBzaG91bGQgCj4gdGhlIEJGQ1RMLkZNUEUgYml0IGFs
c28gYmUgc2V0IGZvciB0aGUgb3BlcmF0aW9uIHlvdSBtZW50aW9uZWQ/IElmIHNvLCAKPiBtYXli
ZSBzZXQgdGhlIGRlZmF1bHQgdG8gSTNDX0JVU19JMkNfRk1fU0NMX01BWF9SQVRFIHRvIGF2b2lk
IGFueSAKPiBmdXJ0aGVyIGNoYW5nZXM/CgpJIGNoZWNrZWQgdGhlIFJaL0czTCBtYW51YWwgUmV2
IDEuMDAgYW5kIHRoaXMgc2FtZSBibG9jayBhYm91dCBGTVBFIGlzIAp0aGVyZS4gSG93ZXZlciwg
aW4gdGhhdCBjYXNlIHNob3VsZG4ndCB0aGlzIGJlIGFwcGxpZWQgdG8gdGhlIHdob2xlIApkcml2
ZXI/IEZvciBleGFtcGxlIG9uIGEgcHVyZSBJM0MgYnVzIHdpdGggYSBidXMgc3BlZWQgb2YgMTIu
NSBNSHogd2hhdAp0aGlzIHNlY3Rpb24gc2F5cyBpcyB0aGF0IHRoZSBiaXQgc2hvdWxkIGJlIGVu
YWJsZWQuIEkgY2hlY2tlZCB0aGUgCmRyaXZlciBhbmQgbmVpdGhlciB0aGUgQkZDVEwgcmVnaXN0
ZXIgbm9yIHRoZSBGTVBFIGJpdCBpbiB0aGUgcmVnaXN0ZXIKYXJlIGRlZmluZWQsIHNvIGlmIEkg
dW5kZXJzdGFuZCB0aGlzIGNvcnJlY3RseSB0aGUgRk1QRSBiaXQgc2VlbXMgbGlrZQpzb21ldGhp
bmcgdGhhdCBzaG91bGQgYmUgYWRkcmVzc2VkIGZvciB0aGUgZW50aXJlIGRyaXZlciBvbiBhIHNl
cGFyYXRlCnBhdGNoIGFuZCBoZXJlIHdlIGNhbiBrZWVwIHRoaXMgc3BlZWQsIGJ1dCBwbGVhc2Ug
Y29ycmVjdCBtZSBpZiBJIGFtIHdyb25nLgoKQmVzdCByZWdhcmRzLApEaW9nbwoKPiBUaGFuayB5
b3UsCj4gQ2xhdWRpdQoKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtaTNjCg==
