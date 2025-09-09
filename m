Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC980CAC58C
	for <linux-i3c@archiver.kernel.org>; Tue,  9 Sep 2025 15:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aclcTAGNypsj1f42AgNBQMjbo+0iQGbO92ihm7R3sZ8=; b=b9sxwWVTC9SZiX
	ODZqduHz4Ln5mkXKiLdefZ12UfrJSych4B8izXBfX2c0zgIlzAftjo9VgcjwTJjAMkYa/H0K8ipdf
	7Iz/xQOWkuT0fQmUlkhod+QOCEP6Mydg7BCOv8/on/KkfFjLU9rsN45jGaH9vy4kBqUMZS2PxWz7w
	ucjm0lL1NTofKy2z2tiZSWFLl0u9U+qSqYBzhiaZmlpMZm9rhcbwR7OppCbHTynCA53xzO9v2Lc1+
	RweYZFvoPnUmBei+PmoY9p7CX42mbNob5nB0v1nm1NWUY1WH8/jfIIvFMmFmrF6Ew1JJTC1peejND
	4XbMO/ZROGrkGjkfAaSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0VG-00000008E1O-2Mli;
	Tue, 09 Sep 2025 15:43:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwNg-00000006gEn-0IN9
	for linux-i3c@bombadil.infradead.org;
	Tue, 09 Sep 2025 11:19:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:To:
	From:Sender:Reply-To:Cc:Content-Description;
	bh=/Io+q/801HDTbZj2109RngbWQ9/KAw2YcODB5D3TKpg=; b=qJSO3B1F2n6osqY6zMTvR+DrOX
	1rEPioVpEQ9Thsv6g0ucsKe2lBfGJ7iDaMfrlqkQAcN6m5qJmACavwri8HdGWQhgb3GFF8oavoVli
	TWuHDLHGvWolv9wXZAtVmqjHqKeq3+7F2CRaF9iP+zv88T/tMChHLtCu5xk7zdgSNZeAiQB6JwlCP
	EptxhM9H9n/c5YUbbZJnrXRvsvY50fXOMXGIlhB+3IuF+y1XipTaqbk5HHpTLkl4g8Ya0zE2en9OA
	BCo/XeXfPCkbxX03r7Yg/dzXfDyQPWNNoBTBxEByK6y+3sSmqIkrvitbQDdf60tKbi4rc54snKTPq
	9ClRjlWA==;
Received: from mail-mw2nam12on20617.outbound.protection.outlook.com ([2a01:111:f403:200a::617] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwNd-00000005Irb-0QT8
	for linux-i3c@lists.infradead.org;
	Tue, 09 Sep 2025 11:19:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XVc1fjcfM0ju0p2lqr0dpKvW6kDgaEtfiuLTSWXE9cP9YnAK+kJnwtezwB+r6jRv7KpNmQAm/ueBN20U1LXswTz6Go9BVyBFNvytXfYTGgl5gO+mitBvGD3gycBqb5vV7Qap6uArvyrh4cEiFC6GtSLjkVpy6QXZEouZkVugHNniuRZvFTzogjmhIf0JEoQn4vSyEcEf/n7wtMd4bl/fJBxu+0RQYQp32JhydplY/vo1F4nzQB7rnmM5jZ6PXH/lQzXHMNnvbrhE8bE1/YLbuO+H0KSHHt5WzPh2iy3+I8UE3UFIcE/FmFLPJLjgbkury0WlxJI5xC3RH4TSJ3/glg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Io+q/801HDTbZj2109RngbWQ9/KAw2YcODB5D3TKpg=;
 b=dEsT3jkozwu7HPW8rVtz+fGWucbaugL0+FyNC3doSNfFI3tgSQLfjGbfciM4nyk3LSrS11ZhpXutk/fk1sB06deZ6E7mKKZyhvVzqIFVfdkDKE+6OIUd61YZ8PaM5hwPBFGHhPNU2JBymdejxpoSJsJDmVkjL6/mjgWjBRJunoYDyJlgbzKBuPqZRg0D+YIZg8w8wfXB/ngS3rghWxWe7Q/NFIa/qE6arCdKeniZtajYzEB6cRwP+ICAXNkIdHQMWSF2GihGFkWd+ig17ryppCqHEpJphhbmstyiOhCmiCSCShevo0wZdPbISou1coW0iGM4jianHm0+NmnyLgqc6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Io+q/801HDTbZj2109RngbWQ9/KAw2YcODB5D3TKpg=;
 b=zK3Pp3ujjD8PRt3TaliwVNLwVu4sCkBW2m5uxnEJAVB4ZEL5ngXY4N6GGMyt8xlfGxughcGtcs4D60wVrvNYbdqEiRV+EnvLuFgx7z7Fftg42EYrpRqp5JbbR8ubJHZOmunfq4Oz5HUEhA6II61VO9TPLw+w+l3/Y2+h9yFX78dkd3iEDB77NLT8Ik2zhqvcX4IutQ8LKS7+jOGevuR/5nh2gF3s+jRvbicoLzmVY8oo942DQgw8q5/BU9VJzNmIa4Hk4KZyPAxTBGg9LiEUFPqFN1zGYYzCTgY+/1q7XttIjTY86Q67IQ4J2P1Z8O5Mk51XfgunupMe/PUIonzIpg==
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 MN0PR11MB6088.namprd11.prod.outlook.com (2603:10b6:208:3cc::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.22; Tue, 9 Sep 2025 11:19:08 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 11:19:08 +0000
From: <Durai.ManickamKR@microchip.com>
To: <linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <alexandre.belloni@bootlin.com>,
	<Frank.Li@nxp.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <Balamanikandan.Gunasundar@microchip.com>,
	<Nicolas.Ferre@microchip.com>
Subject: Re: [PATCH 1/4] clk: at91: sama7d65: add peripheral clock for I3C
Thread-Topic: [PATCH 1/4] clk: at91: sama7d65: add peripheral clock for I3C
Thread-Index: AQHcIXrab/QyMa1RnU+sGDpA2xPiCbSKtCYA
Date: Tue, 9 Sep 2025 11:19:08 +0000
Message-ID: <bde8c4e5-6116-40ae-8bd3-e76d5954c461@microchip.com>
References: <20250909111333.170016-1-durai.manickamkr@microchip.com>
 <20250909111333.170016-2-durai.manickamkr@microchip.com>
In-Reply-To: <20250909111333.170016-2-durai.manickamkr@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB6541:EE_|MN0PR11MB6088:EE_
x-ms-office365-filtering-correlation-id: 97d865a6-5491-419a-7e3c-08ddef92b1ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|921020;
x-microsoft-antispam-message-info: =?utf-8?B?SUs1d3R3bFUzOXJDZGZ3SlBrVWgzMU1OTlJuLzN6NHdQQ3N0UFBsRG5BYS9D?=
 =?utf-8?B?MWh0aEtYRG1XS1U5QURSSTN0Zks2aDR2dTgzQlNmaGgySDhleGxsOUdkVzRD?=
 =?utf-8?B?V2RpMEVJS2hVTEU2c0h2TU5SS0thRzFGNjRoS2NzOStIdXJMZmM4QnlLeWFq?=
 =?utf-8?B?SHRqN2MvSTk5aU5mempyS2d4SzFZcWNodVBKdHpJTXBNbjNLd0ZFelh0clp0?=
 =?utf-8?B?VjQzMWladzMzYkRJajdkWTM1UURLcU1EaG1keFk2d1FxRXl4T1MwWGMwaFQr?=
 =?utf-8?B?dWZaWlF4eVZoOG1MZjBUYjFVTlRnMTN2QWpkZjM2NExnN2xvblJQOEVpQmxr?=
 =?utf-8?B?YzY4cmdjeVNBYkh4YmJLTElDanJvUnk1SjFyWjVBa0cvaGFvK2dHNVNRNXZ6?=
 =?utf-8?B?Z3BjMzI4Yzl6VmNmZTVBWjY3WVpiKzZZSVBBSUpuaFA3alF1MVlHZHorbUNP?=
 =?utf-8?B?OExZUTZwZlNPZVl2TnpYUzZpcG1QUTJyUEVxbENOS0pMdko4MkdkVEZjekxE?=
 =?utf-8?B?Vk40QnYydHZYMFRQVUdlUlpuRVkvRGVkd25xVEk3Ukhyem5xT0dVcmpySUh2?=
 =?utf-8?B?Y1lBUGJ0SEZoQk5rQ3dVZXR3KzBTRUM2eC8rUXcwa2tVRkJib0N5U2xrZU9l?=
 =?utf-8?B?VjdFeS9tMDUraGplNzlXQml4MVJwRFJZOEpReXIrUFRablZxR0paVVM2Qm1r?=
 =?utf-8?B?aE9pK0JlQXhLZ3EzWGp5RUxHRzVWbEJTUDJpalhOdjdZbzVhTHpNU3JneHh0?=
 =?utf-8?B?NUt5a3hRN0lMcHZzSlFaYkNQVUdWb2sxRjZvb0duS3FqejJYUjhjdFc5QVhO?=
 =?utf-8?B?N2RrZFI5bUFZMW9qZVFHNDVwc3M5b1ludG9UV29HNWk1THplcnhpRU1Yc2tt?=
 =?utf-8?B?VEFzdWJycUlvSnJtT2ZRWUMxR0ZUdlQ5dkVEM3NZNEh6ZnlOMEJaYkFpWGZS?=
 =?utf-8?B?aElYSXo1aG1kRnRZZmZ3aEgwTWpNekZRMEYxV3lWY2paaGF5Sm1jU0puK1ph?=
 =?utf-8?B?ZG1qT3cxbS9wRTBrSDZpb3pYbFl0eEE5ZVJkUHEyUjhrTDl2aEE5Ky9tVFhE?=
 =?utf-8?B?RCswOXkvaHppVlNuaWVqLzlLdHJTcW5XMWwzUzFxZHUzRUJ2U0dTdGpKQUpE?=
 =?utf-8?B?UzMzaVR0L3ZJY1ZHWkdQTWRESXJGajZ2NUpORDc2REdyeFRtcHFxM3VNOWhw?=
 =?utf-8?B?bWNHMWFiMzlFT21leGk3QjNSSVJ4bWJ0ekw1WkNwSjlJc0FYY05kR3VNMElw?=
 =?utf-8?B?U2FIdCt3MTNuQmZ5M1VFbGo3azhmeXJCRTZkZHhVSUlZOTVyaCtHMzUxd1lv?=
 =?utf-8?B?YkRxVzBaT2NOa2F2Nk1vUkU3VXZKYi9wMERWcnJEdzAvdGZ5U1AydC9MTjRX?=
 =?utf-8?B?UWdPUGlXbVVJM3RCSXpDLzVjOFFEejFXc2pEdHlsR1B1NTdjZzR0SEluMHJm?=
 =?utf-8?B?WloybnR5VEpYMnUwb3kvNTFOd3E4QlBxM09uVnZzWEdwN0dSejRPMTMzdThF?=
 =?utf-8?B?c3JkM2pUK1B6Yjd6OFNZSGJLamhDRlBOMVl1M3M4dXR1OFpXek1qQ051dFA1?=
 =?utf-8?B?aXozSnA0Szhwb1RsMUN6UDE1TjRiUDlONDM3SHZTamwvUTRBaUlBLzhDMHNQ?=
 =?utf-8?B?bVg5NklNN0xUWkYya1VhT0czRUpheFgwNkZFQnpZVWl4MVRONExBQWU1eGhh?=
 =?utf-8?B?UEJtTWlYM2xieTVialZmQ1dpQ09mYjNlZmd2ZUpZRkErczhRVnVXbk9peFZh?=
 =?utf-8?B?SkhPNVNYTWhjYWRJYVJEMjdqMW1DY0g5aDU0MjVTdUQrUWwwVE1pcXRLTVpo?=
 =?utf-8?B?VWJML2F6Rmk4aVEwdExoRXVPN0VKY1A2WVo2bDJLSTJNTG1QOG5VZDl0TEVU?=
 =?utf-8?B?MzEwNURyZ1J1ZXBLdktvRTE4TEJKZVZ5WGEvQTlrV2VHWVc4S0lvamYzVWJO?=
 =?utf-8?B?b2FqV1B1OS9KWDVzQ2Uxb2JESDc3VG03QWVSUWxDZjIvRGpaT1hQVG1aM3JT?=
 =?utf-8?Q?F4Su6Zw5cYOm03RTTiAZIitIJ+ryVs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6541.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OXdUUnVlMU81QmQ2SHVNUnlTWENuUGFYNVoxNC9FLzBGWG9oQTEwMDFnOXcy?=
 =?utf-8?B?UDgxd2VYQWZrSUF0SUUrc2x4UWVZbEJYZlFHai9JaytlV3EyNWZXWE9qV1V4?=
 =?utf-8?B?WU4yZjVXRkMrSmEybEVYYjY3VTk3dCtGVk9QYmd5dnlwK3NYK0N0bzZtcm0y?=
 =?utf-8?B?b3hEQ0VIaklkdzVHU05tZHlsanY5Sm9qakwzQTNSbEZGWmNsVjRSWWFCSmQx?=
 =?utf-8?B?NUJoeXA1VkJPb1J0YmNUVERNSktWeENkMUdGQWZWTkxod05qNWZHUFV5Yko5?=
 =?utf-8?B?ZW5hWk4wZFJXY1VianVWQjVrRU5XdFhzbzM0MTNQY2llWUt0NnVpWWQyNnUz?=
 =?utf-8?B?RkI2RlJBUjYvTkxEY2dFaHI0UmV1NEk2dkRneExZTnhpNEYzaFluUlpZQk5R?=
 =?utf-8?B?em5sOFdNY21CRm5iTWt5TU1hNS9oVlh0QXIvRTJOem1mZnZLTEZRRmFrYUJ5?=
 =?utf-8?B?Tm1QbTJ1cFlJYXhKWVVOblBndWFlMEhPWHBSOHVjNFdpMzg2RTJ5dlVMYlFj?=
 =?utf-8?B?Q3VQWldMQUFLRUlpR2ZkQitFTWZyUTh0OEJLVXlIZE9CS3VDQmtOZEFUNWNG?=
 =?utf-8?B?a3RSamU2NXd2T29RTERGbEMzWGlobzRsUW8rTlE3cVJEaGtVakVtN0VnSE1v?=
 =?utf-8?B?aStmZE5ZSk8rcGJjS0ljN0owS0l0Vzhocnh0eFp0WDl5RUtuVGVjV2o0WXE1?=
 =?utf-8?B?WVFMY0pDU3hKNXVmN1BjL0pQWmdHdGIvc09aeTlRWnJEb0k3SE96SFhwR3lR?=
 =?utf-8?B?QitRWGlNR2U1ZzFoQVJIbUgzTEplU2dDQ0lpd1R4b1BaMXNnOUkwRmJHMkZK?=
 =?utf-8?B?cnpESEVoNjFsMzhDdzAzSUMyNW8zY0xjUjFuZW1VOTVoSS8vb0EvUHNnUVUw?=
 =?utf-8?B?c25EOGVMbkhnS0lpaW5yTWltcEFyNHdSVVA1MlVNTWNYMHc2S01UcnhkVmIr?=
 =?utf-8?B?bEhJcllVUW1GY1hhc2xkRC9TVHhKZ0ZocjZ4d0p3d2dGQzFUQXhmV2JqSXgv?=
 =?utf-8?B?dmY3YmNHNmJoZUZwT1oyeSs5TzQ4bnMvQWpUT1hzcjVzeER3ZlA3S05USXI2?=
 =?utf-8?B?bExOZnpkbkpJanNhNThRNDhDWGRDMTVMT3JwcUhDeEFLZm56dG12Tm5OMzAv?=
 =?utf-8?B?d0FZWGI3aUVCV2pEeHAwTTFhQmJZRmJTU2gyeWtBUVZNZGpXa0krUVVVQkdO?=
 =?utf-8?B?TDMvMlo3eXlaKzRFbjViNWprQktMV2RDeUtTVTdQdHZlMnB5VkR1b0p2Nm44?=
 =?utf-8?B?KzFObkllNmZuUVorL3V1WDJzUGVHSGhwekRoQkEyaWFrNnNOOC9udTZwQTBP?=
 =?utf-8?B?L0hVeDNJd3lyMTlnUE9RQlBpSlk5N0diLzRFNHBLV09OWWhpZ3JWSitnSnN0?=
 =?utf-8?B?c0E3TnRJRGk0RkwxT0ZZaHR6bVc4bUMvZkVOUzlFS3o1b0Y2cDRqeGhFL1Iw?=
 =?utf-8?B?dGt2REt6TmxrQUUvalgyOU1SREdHYlVvam9aeFkyb2RNSjlXRURNdERiZ1N2?=
 =?utf-8?B?SmY1UENZeUFIYnNHMmNER0VwMlpzMTdReUQ4VzR0ZVE0ek1ibnlxRW9zZDR6?=
 =?utf-8?B?L1JZQkZZWGFOck4ycURXVDZkTlBwRHIwR3Y2TUIrbHVpbnM2SCs2RDlUSVhp?=
 =?utf-8?B?KzBrUWdQWFJkWHcrUHJWcGpVS3BQMHRIOUNuQlUxTHdIK1BYVERLTkxMVU1Z?=
 =?utf-8?B?OStoQzBsQytGdlY5MWRWcVRyVDY1T0dvTTk0UFc4SGZzNzhzTWVFUE4yYUtT?=
 =?utf-8?B?cjZ0dTNFaHdNMmJ1WUNla1hTWUpqZzU3a2RiKzVnMW9KZ1NjM2lvZkVwOEFk?=
 =?utf-8?B?QW0rTmdwek5aT3lVVFZub3Y5OTJ5elNCZ3UrTll4ZkJEcjFKa1Qzb2lkdG9n?=
 =?utf-8?B?MmFUTmNiaDJieitxM3puaVVORVQzYzRURTJTOVU3VjNCbTZXeGhUdDN1RUww?=
 =?utf-8?B?QkN2b0Z2T0t4b2owU2JiNzdXZi9UcFhhTlNoejRXRW1oSHBFYzVvNXN3NWkz?=
 =?utf-8?B?MDc3Z0lTY2FleEJOTzVpeXlVNlR3ZktJd3YzM0o5dUtjaklkOGY4WE5kK2tN?=
 =?utf-8?B?MEpycHUydk9GelYrTWoveWVsSDE3YksreWVqSFUyK3l1eStuQUdJeGQ3bWVl?=
 =?utf-8?B?Y0JVa3M4eXRBYkZ4OURXSFVDbERvSkhqeUVHR2VHQ1d2ZWg1NGlROU9ZMVk1?=
 =?utf-8?B?M1E9PQ==?=
Content-ID: <CD9397EEAB37F54C9314B2651E34A242@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97d865a6-5491-419a-7e3c-08ddef92b1ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2025 11:19:08.0883
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AGKF3ik8jZpdiqfjsA5Tnal5DPPaOlRdB/BS9n5Q0WnQE+KAxcLSpMmxMt1swEjoidFelloc4NBapDMhq/nFLQC0lRvOJdfS6gnAanKaS5w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_121921_361085_DC8BDD8A 
X-CRM114-Status: GOOD (  13.75  )
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

On 09/09/25 16:43, Durai Manickam KR wrote:
During cherry-pick wrongly added 3 lines instead of i3c clock changes 
alone. I will resend this patch in v2 along with the other comments 
which is yet to be received, with only changes specific to i3c clock.
> Add peripheral clock description for I3C.
>
> Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
> ---
>   drivers/clk/at91/sama7d65.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
> index a5d40df8b2f2..84c6bbe20873 100644
> --- a/drivers/clk/at91/sama7d65.c
> +++ b/drivers/clk/at91/sama7d65.c
> @@ -671,8 +671,9 @@ static struct {
>   	{ .n = "udphsa_clk",	.p = PCK_PARENT_HW_MCK5, .id = 99, },
>   	{ .n = "udphsb_clk",	.p = PCK_PARENT_HW_MCK5, .id = 100, },
>   	{ .n = "uhphs_clk",	.p = PCK_PARENT_HW_MCK5, .id = 101, },
> -	{ .n = "dsi_clk",	.p = PCK_PARENT_HW_MCK3, .id = 103, },
> -	{ .n = "lvdsc_clk",	.p = PCK_PARENT_HW_MCK3, .id = 104, },
> +	{ .n = "dsi_clk",       .p = PCK_PARENT_HW_MCK3, .id = 103, },
> +	{ .n = "lvdsc_clk",     .p = PCK_PARENT_HW_MCK3, .id = 104, },
> +	{ .n = "i3cc_clk",      .p = PCK_PARENT_HW_MCK8, .id = 105, },
>   };
>   
>   /*


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
