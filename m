Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 709FCCFD374
	for <linux-i3c@archiver.kernel.org>; Tue, 25 Nov 2025 03:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rEsm6618XjeYiNhjyEvUP0RyL9tbZoXTf8R0KCk43w8=; b=bKWnPUX9lGV2u4MGLiB8RNBibJ
	wfrP4Uss3drjeLCd4oH3MgE4R7ovN/sMIaF+WFvuDO+w5RJex8QBoHyzcq+aICvgeo2SoNM0TeCUw
	TrXEyEHQOQznJiznc+lHCCtz93VvLWEK1pz3+IDfLfRriKph3pdoF2T5UEkfwDjTKEHOTIIqciYft
	dYR6XkitTkhJWHosqsOcHR0JZsftz7qnyGm9rgUkfSloH38PvwzxuNMPjl7vmNiuz1Nxost5KlrGr
	mgRHy7A+EMBwrUO9bCpJj1H5gJ1eiK9xsKmln/avxc7pNTsUaeofZeeZuJnuEr8hM2YW1Mi2B8tK8
	xMzcED4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNjbA-0000000CfRp-0mjg;
	Tue, 25 Nov 2025 03:20:12 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNjb8-0000000CfRH-1ikE
	for linux-i3c@lists.infradead.org;
	Tue, 25 Nov 2025 03:20:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hGpX4XpJWU+AdkjBcWew7G5xywrR2SW95cRQO2CZcplYoDJyIqBN2sMb8Wwmvi2yjsI/O8QUpp448wUWVylgW+ENf9xqM4V240GDB4/lx28RSn0JD/IsGUSAODQuFcHfBU97ChCA/+8TN3HVvcJyOa8BFIWk9pHWjFAg3UVZA+JNE+Dp3estARra7+ZNSHmn4VR1mswwCJGWzozsw9yEil7evuckTvO1m5B6uj4K5U7hnNRKmnHFvQc33e3Zs+oksg4L7Gxq3HAx2CyMpSYcDE+QgwiRnZlPtrnDjNh8m1nxvNFiuo5lgR6e5zmgkCTjCesyga/XFreoGcRZ36JqMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h8pEZd22ZAYtFt1/KV9notLdkAoyHGn//ROBc7ATXIU=;
 b=AzYXI/PtYT1c1tSMXg1La16rfQipHUjvLzZwHypAR/P6043+4QEXOZ//P4bXOROeTgujxCdTvo4vuS1CuNYnCxdcV9r5Ll/tCl2woaEBxXoM1dUqPMS8UL6/P6BPhtee5uTBsm6fUbfFDnBvmdOdUhR4/kMyBzMjyJJ6pfihU97eStzcKjNf3/K305swmntwrL8d1ElDdRVciXTXYLvsPHQWdfAUpfgEqWO1er2HKXR0iAhcQ7Qg5KM0bz8cV2dktSBO5xgK6MWlG2J8Gp6Vhi6VasJZKD7zZcewRzSYA1ZOTB5GeXH4VOgQbcJIxBsr+GYok+N/Pjplch0R8D0fDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h8pEZd22ZAYtFt1/KV9notLdkAoyHGn//ROBc7ATXIU=;
 b=bjRfQ50P8SYb4U0H0rmeh4ZtXUEXuoWqT+/dfziDxbyVtSMXcyQL6TrxgaL6fnGLzI2gd+8f1yd25W5jtaqRcw4MUu2pkwPWmbtLqRq5e5Eur0o2z0Gxh2lu79JFyqDmBHncw3P5pqK61UNhV8rRlr1CmHkgnJ/x2nbcTOO99gVx5beLld+68e3YqpVHwiyn3/7qs4CFEIQEVP+ZL+VssNoLtEzfroJQxX/ob0c7h84NeVfzw59+XhA/kb/KMqswauOQ/1vgujDBnupNZ3uGPLReo2pK5VwXK9od29yxD9HweDPTN6NOo2obDhccJp1Bft1eIxJVam5VXyHCQ3uvmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 SJ2PR03MB7093.namprd03.prod.outlook.com (2603:10b6:a03:4fb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 03:20:04 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 03:20:04 +0000
Message-ID: <f5ff6901-ada5-47ce-822d-11aa35adabc9@altera.com>
Date: Tue, 25 Nov 2025 11:19:58 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] i3c: dw: Add sysfs support for Device NACK Retry
 count
To: Frank Li <Frank.li@nxp.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1763747151.git.adrianhoyin.ng@altera.com>
 <a700d805a5f3a04791bb4516d6f67f6bd8a80616.1763747151.git.adrianhoyin.ng@altera.com>
 <aSSdEW4/WCpGxJ/o@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: "Ng, Adrian Ho Yin" <adrianhoyin.ng@altera.com>
In-Reply-To: <aSSdEW4/WCpGxJ/o@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: SI2P153CA0030.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::15) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|SJ2PR03MB7093:EE_
X-MS-Office365-Filtering-Correlation-Id: ec33bdfc-3202-4476-1951-08de2bd18671
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c3MyZmdtZytrQ2Qwa0d4UEhZZnhVelhGcklVNkQ1NGJicFZnVDhHTWJkMVMy?=
 =?utf-8?B?S05RUU9rRXFwVFl4T0NIa0NVbUl2SkFDNW5mdlY2eEZ1NWdQY0tFY1lqdm0x?=
 =?utf-8?B?ZFFUdFlIeE1WSmt4SjdJM3Rvdytmam1tYTU1NThQc3UzRmE5UjlkdmQ2MUpJ?=
 =?utf-8?B?ckpmQ2J4MFg2bXRKajJnVEkzOTE1djk3WGYvOHNmc2svc3AyNEwrQ3ZCTHNH?=
 =?utf-8?B?UkNjV0E0OEQ0RSsxNU9kZG0xQm9UQ0dndTN3NXdJbFh0K1JTTzh0NENxWDA0?=
 =?utf-8?B?NGNQOXF6OFdRakFRdmdLTDc1YWxtR1pGZzlqNm1lS1pld0ppa0tJQTZ4eDVv?=
 =?utf-8?B?Vy9nazUzYllPSEttQkh3VVlzZk8yMmxGWFp6Vlk2U1ZRb1kwZE12Q09qUllu?=
 =?utf-8?B?L1kwT1I5Qyt4N0J2YVIxV1lqTmJlakh2NS9HbWU4VVg3TGtSenhWWEt0MDJl?=
 =?utf-8?B?bmUvOGp4RmtUWGg3bE5sSkU5TmNtSnJTUUl5akRDMWQxeWJWWVFiemo5aW0v?=
 =?utf-8?B?bUhkUFJWdzc2K0pZUFVqTVkraEhsSVJOY3FIQ0xXMlRMNnptb2lyM01nUzhE?=
 =?utf-8?B?TEZ6cEIzaWdhV2pNOXhFUWswMVJiRWRYNERwMmtPdzZkdVJ6ZFpNSDJxWmJC?=
 =?utf-8?B?dlJ1ckxjb3RlKzJYQU1MNzFmVGd4Ty9lN01qdFFpZ25MOW90VzA4R2NvSE8x?=
 =?utf-8?B?SlFTT1U1T3QrTUtiZCt2OU9oVmRBbGlWMTN4OVhxY3h2UG45RzUvb1JJMCt0?=
 =?utf-8?B?SmNnRnNCYWxnSm56WDV5YTBER25xc2JEdnFjN2kvTStzb2lYQTQreC9XOXJL?=
 =?utf-8?B?TWtqa0JvUzV5Y1VaTUduamdDMllVbVE3ZmY5TFBkZitQd2R4cG9IZmd3V3lz?=
 =?utf-8?B?eC9GblYxZmI0bTBuYUd5VmNMSFNNYVFZaG9CMGZMV2g2NmxpNzd0aVdhWXZD?=
 =?utf-8?B?NVpka3RSRkw3bDd1djlnSFR5Z3dyU0w0NmpSdTBqK3JuVXRLdWRiZWxSczEv?=
 =?utf-8?B?R1NVTEYyRkNVeTl1UmdBWVFZZ3p5bmpHSERsalV2YlM3MW0waVpZVll6c0k3?=
 =?utf-8?B?SkQ2bSs2OStBZWx2SzJWRlVyMVZabDJBb0daTHdNWjFHelhjdGY2NlNsMUxm?=
 =?utf-8?B?MWZqWnBRYlZsK3Q0RGJQdDVYYTVLdmZnTEpDV2RkZGhMMzYrYzhuUi8zM3o2?=
 =?utf-8?B?R2NpbmFXa0lBQitmbmJ5K0t1REhEK3IwUzdPQjR2M0dQVGpZRElFdnVOaHg4?=
 =?utf-8?B?dzNMV2xOSzF3emhLZnV2S08wQXgrUHVXYnZ2U0xPSXB6R1ZvWnVpNnM5ZTFX?=
 =?utf-8?B?dDZmMFgxOWtESGhUTVZsQThUUi9IRWlBRmx1YXNSbWdBNmJRMVZpb3NUcUNw?=
 =?utf-8?B?WnBEbFBQL3FvU0pkMXdSN0htTUZtSnhOVDhxVWlCek1lTjhoSjh4QUhBMjAw?=
 =?utf-8?B?czVlWkxSNkZKNnVOSEIxMkpFQ2hLWGlDUHAyWUtiOWRzQVhma3UrOTZYYlJC?=
 =?utf-8?B?clljZXRnRDlxMEpSdUdscUxFcFNLdEt2eno0R0RtRWVoRUV0d3duZDhYSkFB?=
 =?utf-8?B?dHY2SlJPY25ONWZidTRHbWJiRkxXMXZmMWUyc3kyd1pWNG0vUTRRcDNMcTBL?=
 =?utf-8?B?T3NlUElTaWlMOFhQNTZJZkU1ZmVoVDA4ZUUzdjQ3TkZEcEs1N2FQamRrQWE0?=
 =?utf-8?B?TEdoek1qYWNYVHB4U2dWS0hPcEQvd0FVbTJEV1EvTHJxN3hMc0xjSjZPWkJq?=
 =?utf-8?B?M2t5dm1lMWNhNU5JRGFnNlRTb3FQcjZRdEI2ckZEaUNFMmQ4NFkxVS9VZys1?=
 =?utf-8?B?T0JnUDZuN25lbmRZd3dueTBHK2hrY2ZGZGplaW4xYWhQeDFZR1ppMDRHOTlI?=
 =?utf-8?B?aDVYRmQxOUFVT1NuTTdUaWZ0M0p3RnI4ZTNrTG5lY214K3lpbzJjWWFRcWhY?=
 =?utf-8?Q?O/GHbguwhY2YunvqZfceCYgRVFKs8gUs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1k0N1hkVjh0TGs4OE9uT1NxbHgwb3d4UVJkSWRUNFdPSW9MMHVoOWR4TG9C?=
 =?utf-8?B?UFJYdm5PY3dsblU3UVJ4b0RtTmVKaGtnSU92eTBwMHdNRWVaTXArZ3FPUHVY?=
 =?utf-8?B?YngzNjZYajZzdnFkdjZDek40Y1lrMUZTMy9vZXBEbkFXSXIvMXhJTHppUFFu?=
 =?utf-8?B?aXl1clVuai9BZTRIMzVYcTUwdzBPMjNHSk9xWUEraFZxOCtramk0MjBRbXFF?=
 =?utf-8?B?Si9uUFhESTJMZDhDUzFxTWVVM2drQVdUWDFpUkdwU3ZHTTZ0bUQ0KzZDOFhl?=
 =?utf-8?B?RWovMzN2MmJrT0YzOGJxR0hnMXptclhacFZLcm45cFFPekZ0RmF1VCtOSFhF?=
 =?utf-8?B?TDB3NVMvSlROaU5ONHUyMU9VaGZUYXBjSTBXWUgwanZMTWRWQkVtaDFsa0hL?=
 =?utf-8?B?WC9Gb1lQYmZ4NHRZVXVhL25SME9hT3NCaCsyOVBGNEJjRFpBaEU0RDVxbXVs?=
 =?utf-8?B?MjV6dVZheGZxZndnNHAxSGw3cyt3eitXZmMzQXJKd3k2aGJrQ2ErbCs0dzVs?=
 =?utf-8?B?Qm80RmJBZnhmL0E0V25PNVFtV0NnNHRXeHU1dG9GZkpZOEpEK2xnSTJjblhP?=
 =?utf-8?B?d2U3RkFwN1FTQXJ5a3VjYm9CUFVFdXJQWUR2SldUV2ZTbW1IU0wvUTJNQU12?=
 =?utf-8?B?a0ladFFwVXNSeTJHUTBXZEJ5SitodGluTGNhVlROZEVsNlAzZW1Sc3ZpNUl2?=
 =?utf-8?B?M2JwRVlDSldqbUlQTjlUYXdaOU1OY1ZmS2pBT0dRaDhvU1h0ZnoyclMvUFpl?=
 =?utf-8?B?Sko2dzl1UXJhM1RWcjVrWnFvcGRDeDRaVUtNazdzem1jRTdWTHVmRzJIQUdW?=
 =?utf-8?B?cjVvV05KVEJTNWpQVlA4ZmQrL1N6aDkzdkxxTUlyUmF1eU1OQ2hPYTYrdzRM?=
 =?utf-8?B?MU9Nazh5djU0THNuOE14ZjVicTI2WDJhTzNwODNrNWxQbVdNS24zcXpUWXYw?=
 =?utf-8?B?Qk9COVFmR0JTWlc2cGZYRk1sSmRhUXNmNnZMMS9NTnlTSitDd0VXUkpzekZh?=
 =?utf-8?B?TDA0UDNFQ0VmK2Qvc3pHQ3ZNbGpwYkovd2s3S2FKTEtWVzQvLzdCNUU3MXlj?=
 =?utf-8?B?UUd4SU1hYzRnbWs0UVZtU0I3dTVSZGdYYWlmWERXSUJjVGIwS21VYmFTeHEw?=
 =?utf-8?B?TEp0ZEg4NU0zL1RTYzRTQUxSZ2YrSGg1NDFXdjU0TW1ndkhjOVhwZWZyL3hB?=
 =?utf-8?B?ZjZraGJ6VjlqZkpXa3k0QnUzTXI4dGxEd1JlVnM3ZVBodDhmaHFBWjZiRndJ?=
 =?utf-8?B?amF5RGI4R3ZYejY2d3ZmcHN5ZkxibnE1ZEhodmJDczB5Z1pLL014Q1FIZjFj?=
 =?utf-8?B?K1BldGU0Y253TlBIMDBmVFZudjV3aTV0NURLV0lQajhPOUZYR2s3NG52RGkv?=
 =?utf-8?B?WnNoZ0srcjZmZDJBVS9ONnFKZjZkbS85cStPSDZhQnhUaHY5TDZsZUdrOGN4?=
 =?utf-8?B?Q2FabGxQV0xWKzVtdWZodUFRL09oeHl5bkRRMzY3MlNKV3BmY3lreERQd1Nl?=
 =?utf-8?B?S0NGSmJCVkMwcFlDSUplbUFiNU5LaFp3WUZpMXpDWmxlQ292K1YvTmdFMytu?=
 =?utf-8?B?OG5IQlNFdnhWanYxNnBQbTY5SGtpenh3UXUyVHJUa3VXbGV2Z1JybUpTNUdH?=
 =?utf-8?B?ZEFTMnlweXY0KzJUbzNvYWZLWVNpaThTL0JWWkZ4QXEvbmgybFZzM29TTGhM?=
 =?utf-8?B?ODhOVnFIZnM2aW92MXZ0SW1zSkc2eUtYdS9CeU9UUEVVb2pmSm9BM0JJL3M1?=
 =?utf-8?B?ZWl2dmhhTHF5dlRjM0hpUFlweGpYVUp6WkZ4Vk5ZNnhBWGRWMTUwYVhBYjFY?=
 =?utf-8?B?ZVVWTmp1aG9Dc0pHTVYyZ2srVytZS1EwQVp4RTN0cUJDZHhFbnNEdHppREFQ?=
 =?utf-8?B?aVNNcVRqck15Kzh6L2w5WlpJYzhadTEwK3A4SE9RTW55MG1XekFrdlg4dmc2?=
 =?utf-8?B?Vkd5OXgycnB0MHB6NTJYWnFDcEVNQS9YTWJsdUhoUlEyVkJycThuQXNFenBO?=
 =?utf-8?B?bThwaDV3RmFpd3ZjeUhEcm5BczdVeDFNNVNqZTFNZGplcjBsV0RyM0g0L2pB?=
 =?utf-8?B?NHZ4dkQxSDd0Q0RqZkNKVXo3eTNDOURmSTRodDFxYXRRVlNVeHkrNHNSc3Z0?=
 =?utf-8?B?WUwyeXFaZ1VkMVBBeEVXWnV0dmNNME1zdzc5emgxQlNVTjFvWEIzYTJSS2Qy?=
 =?utf-8?B?eEE9PQ==?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec33bdfc-3202-4476-1951-08de2bd18671
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 03:20:03.9841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YIl6mr4iXrUy9ZA5/wyqaiCipRD459bglS7qS1xvUVJDmTWViqk/LavWuhDI8cahc5JnNOTJj19y42wDD26lFjVtM/qUlNxiEepIdU1VAQc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_192010_472502_FCD69D7A 
X-CRM114-Status: GOOD (  10.70  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On 11/25/2025 1:59 AM, Frank Li wrote:

>> +
>> +	master->dev_nack_retry_cnt = val;
>> +
>> +	spin_lock_irqsave(&master->devs_lock, flags);
> 
> I think you'd better to hold i3c_bus_maintenance_lock() lock to make
> sure not transfer on going.
> 
> Frank
Hi Frank

i3c_bus_maintenance_lock is a static function in master.c. So should i 
update it and expose a public helper to take the maintenance lock or 
continue using the existing spin lock to protect the DAT updates?

Thank You
Adrian
>> +	/*
>> +	 * Update DAT entries for all currently attached devices.
>> +	 * We directly iterate through the master's device array.
>> +	 */
>> +	for (i = 0; i < master->maxdevs; i++) {
>> +		/* Skip free/empty slots */



-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
