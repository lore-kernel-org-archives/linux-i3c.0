Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E58C83F1A
	for <linux-i3c@archiver.kernel.org>; Thu, 17 Jul 2025 18:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cHSkC3rqaqEC4ivx7iZUp37GpNFruOyHr92VD3vbIuw=; b=S4bnkDIZkIPzuU
	LZEhLwfbu8iJEScRHgWFAZxp8Lk4eqRk0H9KgVsrFZOmYfSxiJBbQGyt7avr7W50KhzQ3OgnLS1VU
	FvytIa7AKo/8Ll3bO20aSTDBkUDjnvpXPa8bUW9jPyj0dH2tQksekUGzc4BUAooXFtm7gcrnsc9je
	NAWKMfl4rHsyUpWMg0Rq0lFAGPg77KsyXTNuL/nOEDRhPW4ZA7e3ZTtbu3TOJYCBQ+w52utS0Ru2B
	ew/pLBK6ny6Mhe7zSD3StXrAot2mYNLMlNFdLZ7ocKk+JC7cYEHNTUv0LwIa9fpnqnfAUGlbHGDq0
	xcRxduwesOrwTbFoTkLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucTRK-0000000At7N-0OIO;
	Thu, 17 Jul 2025 18:34:42 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucTRI-0000000At6D-1Yal
	for linux-i3c@lists.infradead.org;
	Thu, 17 Jul 2025 18:34:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nfDQ4C7MuFeCGI/wSageygnzu4bRvGT41HqA7w+7ismSs14TQ7f4luUoabg8tyZb28I323JMQhpk1hm8Fjsden/03oHSCcfgcHKBaEjg2v/05QaCLQGeC2E0P47yZwhi6PwO4KZvfs+tddAGbmNcOEfyGjqY3BwEQ2j6qPdYR8yNiJsuT2d7Ee39wnvQYZDBGtVw1I4eKR542DLN2/4dKCdrpGuBAxASD3uaRgMUUcQDhOT4ho20hBqs1TBwW67RS4YvLFCIiErjYjz4zCh0bb8SariYs4cR1rtZDxdhcbZO+BlNYpThPEoGzZROlecc3ilWp2/jCZbznrI9kvXKQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8f67fBDrkti8g7bxxl+kHF/q+hlJ71mNj1YqtCMVLwE=;
 b=fO8lkK0Ve5D6l89wU7VIFNGKbSPTQqDr0SG2Xs8CyePJFYUTgs2iacwULYsnnOhNfRpZc3Lu2hc9lUsbcRLHfFdSd4W6KM+zXJxpm39eCuypfvnt1loCqCeTX6YGy63xKR67klgcPcAlHWuy2xgcCdTEdnX7wQTqv/eEalOHblJCb77IODwCVa5STdzvGKBK1rH1rrEpfhohJyDFjUJ7RdO70Fv6kXEB9SCxhugZfbtCY7NeMdsIQz+EC6PzpoD+aGwug4rF1ud/AkbBdOAaCeWah7fqPIJQZp1nTRrFMea95589bKikK5g1qbcWoYKtj+k8qeSNBtqKgDHfji6SDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8f67fBDrkti8g7bxxl+kHF/q+hlJ71mNj1YqtCMVLwE=;
 b=KHJOQrg9ucRnIKXeSXXuzCoUV0FOMX1+9n5WOKmuhGHbq+WoupKxdasD+sI0+H1Ib8T9vV5ve4u6Y911vqM7oQHKw5fO5XmSRCc7lep5Re/Dpo9ODg7fyqT8ZN4JhJHTT2So6GJVw1Z9xJLy0eBscZ+obGCB6IYNi50AjHdRTWDgCGBk5EVUX6Ltu5PGeZuNSwmCFMzWHjubQg82fPl+lxozxjXkzRzi8DGXucBgmmhk0SSSv0esg2q5ppCtlMB1OQtjApX0HJ2R3g4YfkKdRneYVEyCxpsvkfHmGc+v0ErvCxtVqIlc2V9iC1RZi0RicO846Zu+Npz7pdf8+GHgJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU4PR04MB10576.eurprd04.prod.outlook.com (2603:10a6:10:58a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 18:34:36 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 18:34:36 +0000
Date: Thu, 17 Jul 2025 14:34:32 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jorge Marques <jorge.marques@analog.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	gastmaier@gmail.com
Subject: Re: [PATCH v6 1/2] dt-bindings: i3c: Add adi-i3c-master
Message-ID: <aHlCOD/Xjw0Z/Y8h@lizhi-Precision-Tower-5810>
References: <20250717-adi-i3c-master-v6-0-6c687ed71bed@analog.com>
 <20250717-adi-i3c-master-v6-1-6c687ed71bed@analog.com>
Content-Disposition: inline
In-Reply-To: <20250717-adi-i3c-master-v6-1-6c687ed71bed@analog.com>
X-ClientProxiedBy: AM0PR04CA0095.eurprd04.prod.outlook.com
 (2603:10a6:208:be::36) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU4PR04MB10576:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c0b96f1-85d6-462a-d415-08ddc5609509
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|52116014|19092799006|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OTRoT2JGNzBFMm1aVmV1bDU0NW0vd0JvZGpMOHorNytkS1ltejZ5dVZ3K3lH?=
 =?utf-8?B?SXJ4d0ZCQXhzdmFQU2NXbTZ4b21wcmtCbC9uL1RkQ2cvQWY5c2FGTitoamdu?=
 =?utf-8?B?dDRqMWt5Sll2dXQyUWdrTjcwWitHcitQdGxCWUJ6TDZPdElPc0lOdEc1K0sr?=
 =?utf-8?B?cHRXNmh5amZxenBhY0JkZmxrd1V5YW1CVlJ1RnFPaTdFWFkvSVBOeWFjdG82?=
 =?utf-8?B?ZFNlU2djc2JuMVhtQmZTL05QS2d2RndNUWRDNkJvNGhZdnpid3lYa3QvY1FJ?=
 =?utf-8?B?QkZBVU40TEFIaGZwaThYMmFTRkplQ0IzUnBBNFhXa3Nub1BYa1hDazVNYVl0?=
 =?utf-8?B?d3A0cy93UzM3VnRaSWxlQk9DZ05SQ0NDelJBZS9FVmdZSVlURzFpMGpZWFdp?=
 =?utf-8?B?QUk3ZjRSeFZKeDdVVjl1bFFiK2wyWFBKcmErN0dpS0hTam5OZkE0VXo2V0xm?=
 =?utf-8?B?ek1ocGFrbUtUYjB4Nkp0SUdBK2JITzZOSnB1QW9lNDVEbzdTVGlnVEpCSkUy?=
 =?utf-8?B?Wmw2WWNQT1VnTUlnMkczNjhHd1JSL01sSW5Ra3d2Z3NtQjRqWW5jV2VjL09m?=
 =?utf-8?B?aktTNzZ3K2Q4d2t1by9IU2F2UGNEeFZWdVZlallGMXluTCtPZUdVY1FIaW5R?=
 =?utf-8?B?T3BJZmlORVlaNFlFbWpqVzROZ0NiakdIR2JVVDdyWXVyVU83ZWJPWjN6bW5K?=
 =?utf-8?B?TEM4WWV1Sm5QTkd5WVo3RldINGloYVBBeHYzZ010TlhDaG1VVGRFaXk2UUhC?=
 =?utf-8?B?cWxaMy9lOEdaNSswUkgyT2p1LzNnQUFSRGp6QVcrK3ZwcnJMQ3VncmVpRmxk?=
 =?utf-8?B?Q2JFOEVTdHgweXpwbmNJL1pWc0xad2NMUnJINzNWMGlrY2RzRVpLcUxYL3Fw?=
 =?utf-8?B?NzNldnZQdGJyV0VKc25PWFhzVW9kTk8wWFlPNXBtQzVSWUVDV3VQc1c4ODJO?=
 =?utf-8?B?cmVRL1JLMVJMZk91bWJiaGx2R2VjbWNXbzlwNFkzYXpGVXJCK0o1bjhkZnJQ?=
 =?utf-8?B?OEZUUHJYdDJFK3hYMi9BZ2lOSnFhT1ZoUFczREJLdDdHektnQ05IeU1oQVhw?=
 =?utf-8?B?ZHk5UStyWk8zYVFZbVlYZVg3QUxCekdBNWVJMTlzNndTN2E3Qk9OWk1kUTNz?=
 =?utf-8?B?UFlzMG84UDRtNkEwb3g1N1I5VkMrMDF4d3dYb25TejlnR3crZ2Roa2h1ZFFq?=
 =?utf-8?B?ZFU2bEJmTjdVUFVOVVJibGtDaTFFVUowR2hCTWRRcWpGcDBUU29jSStnUElq?=
 =?utf-8?B?NUlITFl2RFZuVUd3ZWRxSEdQTmJWUy96MEFyZmUxN3NkZFhaeGhIM0ptMVlH?=
 =?utf-8?B?akwrMmV3bFV4SFVkZ1FEcSt0bVlsaU54UzdsdUFQa1g4MU9rUzQyQWdPTVpC?=
 =?utf-8?B?RVFTNlh6T1BDSE56S3dBY1R2dk9oOHlkcklHbmFmZGtPRTFPeExzOWpZK3Uy?=
 =?utf-8?B?Z1lra0FzeGpQRWMxTjI1bEk0M2FQN3N2ekRibFc3TCtMZndMd3RNWCtvYlky?=
 =?utf-8?B?NkdJalNvR2hMWFc0MzBydHMrd05WWllxUVJOVjAyZ215ZGcrM053bENQcDhn?=
 =?utf-8?B?djk5MTBBRnpJU1VtTlZTeEFmY2hCc045WENlSjBVQkp3S0JBM3d1OXB5Zjk4?=
 =?utf-8?B?a21QMVljRkpoS2J4emxLd3hpWXJHblNSSE5rbEhWWk43cDlVL1NRcXU3ZTlj?=
 =?utf-8?B?dVZvUjlGWG80dFBWYzZaSk5tSm5xZEQzdnI5cjlWMTVtNThHK2o0Ym9qL1RN?=
 =?utf-8?B?VkwrZEc5QzdaMWlKR0p5ZVNWeGhJZ1ZkZEFESlJ4Q0N1akQrVi81bUNEQXNj?=
 =?utf-8?B?U0pETVBYSXN1aWZZcy9vRWlQV29NeUlzNUJpQ0xsV1phcHFwSFpUSlhlK2ps?=
 =?utf-8?B?YjhXY3N6aE9hQ0JvT3BESUExblA3R1VHcW9LTlNhOU5CdUdZOFRmWEFObkFJ?=
 =?utf-8?Q?EbvFq9CJCi8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(19092799006)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1NDdkdaMmJpYVBzYjRjZ0paYjZnejBLeEhBaVZwaTZwSkZ1QjZvRklOSWls?=
 =?utf-8?B?ZE81WnhZZFZxTWlZdG51SjVHOXZiSnFkaTRuUG92V0Q5bmdrWUNwRVovbC9G?=
 =?utf-8?B?MVAySkh2RGNSMkF4RzErZnRZcm1GdFFzcHlDQTR4NHppVHp4UEd4NEFiMzYw?=
 =?utf-8?B?ek5FU2g5bXVvNjZyeCtNVThkaUFQaDl4MUpJSHVCZW9NcnB0N1BIcSsrN2VE?=
 =?utf-8?B?a0QzaVJ3Zy9LeVc5Ui93SWlydTNvZkY1ZExQbjVQNndLQ0xmS3ZLNldpeUc3?=
 =?utf-8?B?NUhqbTFmNFc5WDNKMyt6OTQvcXltdTVWT2FiVzBybkpEZkFjVk9qUk54aWxW?=
 =?utf-8?B?SG11d080d2FCZ0l0NUNGeFZqdXNwWUtRd20rM3ZvcjJrc1BhTThUQkkwd3BB?=
 =?utf-8?B?Ty81TDVtZkxhUnZlVTV1RGtHWkp6a1V4dEowM3pFQWZlYW4vSnhRbnR2MGxa?=
 =?utf-8?B?Y2MrVWZTUDQ5eXBEK3NPZlVxbWVadGJ4ellLTzZ3SnFSRHhPZFdJTG9QUVZS?=
 =?utf-8?B?WFUzWVNKVTgwRXJzbGUwelZmR2NWZkN2SWRTdVZ5THN5ZjczaTFXQzV2MXVP?=
 =?utf-8?B?N2hEcHdIQTVDVUJJOFh6MStyLy9PQ0hrSENlQmJIQ2ptNHI5KzZZaldrTk5Z?=
 =?utf-8?B?WjZRVFphZ3VQbGJCNWpQS0lUZG1BNEFMaGdvWlZ6a0Nja04wcWRTQm42UTY3?=
 =?utf-8?B?NUhKMHdKMkc1MEJ6SXA2Rzd6RnJIb2JrUzZWaG1CUEQrOU1qOHVyZE5ldDZj?=
 =?utf-8?B?a0hkL1l4aFYwbGlwNkdTTXgzM3dpZ2pmTTc5ajRIMFpoTnZ2QUIwNFJSN1Js?=
 =?utf-8?B?YkxweWVHeWFHay9WczJHSWNsaHZ0anNTSmR5V29xMlAvNmdBT2FRNXNrY0ty?=
 =?utf-8?B?RkhRVTZMMmJJTDN3anVpTEQrMkVXVDJpUGc1eC9KZjgwcDR6RmFobVUzQXFi?=
 =?utf-8?B?WHlSbVZkSkdVQzM4Y1pVSVg4RVY0T09OQmpLMkhiQWs2VTNPZk5aNXM4U01w?=
 =?utf-8?B?VEgzTE9YMDk0d2dhS245U29EL1doaWZwbGtvZVpUam9GbSsyN0NWT2VhUFZG?=
 =?utf-8?B?Q1Y5NXVaNTYzSGt1K2V1bmxBdVlNNm5nUGJUbEVhd05FMHllRHZwaDhVL1ky?=
 =?utf-8?B?VEZrYmpYenl3bklSaGpXV2p2Z1RTMnQ4QjFSZS9LNElEWUFsSEtKZ0JxRjlh?=
 =?utf-8?B?d2dkRmE2UWdGdXpraFBCTml1bGJieG1tcThkNVVjNkpjZnY0SWFxNitRVU5F?=
 =?utf-8?B?b1pEbkdDQjBBeU5OaGJMckZpbHl5ejlRMFQxZ3lTTFpRZWM4OWZuSThXblN3?=
 =?utf-8?B?YkVzUHA5VWNpNmlLaUlTMGtxb3k2Q3ZDSWNWTFdReGRuVG1xUW5WQTU5VDF4?=
 =?utf-8?B?c2JHRk1NY0l5emxWeWx3dExSMDVaOVppUXpKanp6QW4zM2IralNubkN2aUZU?=
 =?utf-8?B?RzRETFZRYWtraTI4NEtTOHZOdC93dS9TVTYrM1RNaWJ6MXBZeWdhL0dmeGNG?=
 =?utf-8?B?U25mUldsMlQzNUlQaTZLcXIwc1BmeXFzVzFMbitIVmtoTVpwZm92ZCtsOS85?=
 =?utf-8?B?KzUzRnY3ei8veExkOFZ2aGF0aGRkZ3BQN1VYWkowaHVIZ1d3NkRxSmMzQmtr?=
 =?utf-8?B?eE01R3UwU0cwaUt1cXJzajlQT2tUcEFWNnVUVWorNldjUWZlc2pkVlA4dGlY?=
 =?utf-8?B?K3p5UDFiMlE4ZTVRL3U4UVRmK21NZE1zK1dDYjRwdlNNaTA5bisyNzJnRFpQ?=
 =?utf-8?B?NC83ZVZNUzBsSU40ZndiQ0p2R0cvWTNUbWZwMEdQYWx1QmFvUUErYm9RcHVt?=
 =?utf-8?B?MlJYR2pHMW9WQy9PR05TS3YwQW1ja1VJQ3R5bVRudDlQVVhPUTlVTTRsK0Fq?=
 =?utf-8?B?cHY2RkZjcnpnOFJ6R3FGbXQ5U2hBTUdYSjFMbDB3bk40RWNRK3Zya2xLYkxa?=
 =?utf-8?B?NldmRE9IWnlLSGdQNm5PWWMvSnpmOHhaekphVHE2L2RhN0V0MS9zNnFpRXFo?=
 =?utf-8?B?eXNwVkxZKzhKZnRUbkREWndERDhxanl0aFpmdHNiSXBhQTNnVFdzSHU5U0ha?=
 =?utf-8?B?OHZRSTNFVXIwQmtGdmN3TDlWaENXSjBlR0d5UlpVQW4wU0ZNWmRzOXhXNGtU?=
 =?utf-8?Q?5CCxijq5Ye/LIgYVkF7GBNS1N?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c0b96f1-85d6-462a-d415-08ddc5609509
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 18:34:36.6292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tDkw3ESJsrKDj6FeSTAKVL339chnMVl/h7g1jJ3uz2rl/LxXUTmuNvs8gmoDBWHA7guOtkwalDKtnTp+g+MEQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10576
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_113440_412707_7034708B 
X-CRM114-Status: GOOD (  18.47  )
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

T24gVGh1LCBKdWwgMTcsIDIwMjUgYXQgMDk6MDk6MjBBTSArMDIwMCwgSm9yZ2UgTWFycXVlcyB3
cm90ZToKPiBBZGQgYmluZGluZ3MgZG9jIGZvciBBREkgSTNDIENvbnRyb2xsZXIgSVAgY29yZSwg
YSBGUEdBIHN5bnRoZXNpemFibGUgSVAKPiBjb3JlIHRoYXQgaW1wbGVtZW50cyB0aGUgTUlQSSBJ
M0MgQmFzaWMgY29udHJvbGxlciBzcGVjaWZpY2F0aW9uLgo+Cj4gU2lnbmVkLW9mZi1ieTogSm9y
Z2UgTWFycXVlcyA8am9yZ2UubWFycXVlc0BhbmFsb2cuY29tPgoKUmV2aWV3ZWQtYnk6IEZyYW5r
IExpIDxGcmFuay5MaUBueHAuY29tPgo+IC0tLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9p
M2MvYWRpLGkzYy1tYXN0ZXIueWFtbCAgICB8IDY3ICsrKysrKysrKysrKysrKysrKysrKysKPiAg
TUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNSAr
Kwo+ICAyIGZpbGVzIGNoYW5nZWQsIDcyIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTNjL2FkaSxpM2MtbWFzdGVyLnlhbWwg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTNjL2FkaSxpM2MtbWFzdGVyLnlh
bWwKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAuLjhmNTMyMzg2ZGUyYzA1ZDNkNTE0ZDQxZmY0ZDZhMzdlYzg0MDY3
NGMKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2kzYy9hZGksaTNjLW1hc3Rlci55YW1sCj4gQEAgLTAsMCArMSw2NyBAQAo+ICsjIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlCj4gKyVZQU1M
IDEuMgo+ICstLS0KPiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9pM2MvYWRp
LGkzYy1tYXN0ZXIueWFtbCMKPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEt
c2NoZW1hcy9jb3JlLnlhbWwjCj4gKwo+ICt0aXRsZTogQW5hbG9nIERldmljZXMgSTNDIENvbnRy
b2xsZXIKPiArCj4gK2Rlc2NyaXB0aW9uOiB8Cj4gKyAgRlBHQS1iYXNlZCBJM0MgY29udHJvbGxl
ciBkZXNpZ25lZCB0byBpbnRlcmZhY2Ugd2l0aCBJM0MgYW5kIEkyQyBwZXJpcGhlcmFscywKPiAr
ICBpbXBsZW1lbnRpbmcgYSBzdWJzZXQgb2YgdGhlIEkzQy1iYXNpYyBzcGVjaWZpY2F0aW9uLiBU
aGUgSVAgY29yZSBpcyB0ZXN0ZWQKPiArICBvbiBhcm0sIG1pY3JvYmxhemUsIGFuZCBhcm02NCBh
cmNoaXRlY3R1cmVzLgo+ICsKPiArICBodHRwczovL2FuYWxvZ2RldmljZXNpbmMuZ2l0aHViLmlv
L2hkbC9saWJyYXJ5L2kzY19jb250cm9sbGVyCj4gKwo+ICttYWludGFpbmVyczoKPiArICAtIEpv
cmdlIE1hcnF1ZXMgPGpvcmdlLm1hcnF1ZXNAYW5hbG9nLmNvbT4KPiArCj4gK3Byb3BlcnRpZXM6
Cj4gKyAgY29tcGF0aWJsZToKPiArICAgIGNvbnN0OiBhZGksaTNjLW1hc3Rlci12MQo+ICsKPiAr
ICByZWc6Cj4gKyAgICBtYXhJdGVtczogMQo+ICsKPiArICBjbG9ja3M6Cj4gKyAgICBtaW5JdGVt
czogMQo+ICsgICAgaXRlbXM6Cj4gKyAgICAgIC0gZGVzY3JpcHRpb246IFRoZSBBWEkgaW50ZXJj
b25uZWN0IGNsb2NrLCBkcml2ZXMgdGhlIHJlZ2lzdGVyIG1hcC4KPiArICAgICAgLSBkZXNjcmlw
dGlvbjogVGhlIEkzQyBjb250cm9sbGVyIGNsb2NrLiBBWEkgY2xvY2sgZHJpdmVzIGFsbCBsb2dp
YyBpZiBub3QgcHJvdmlkZWQuCj4gKwo+ICsgIGNsb2NrLW5hbWVzOgo+ICsgICAgbWluSXRlbXM6
IDEKPiArICAgIGl0ZW1zOgo+ICsgICAgICAtIGNvbnN0OiBheGkKPiArICAgICAgLSBjb25zdDog
aTNjCj4gKwo+ICsgIGludGVycnVwdHM6Cj4gKyAgICBtYXhJdGVtczogMQo+ICsKPiArcmVxdWly
ZWQ6Cj4gKyAgLSBjb21wYXRpYmxlCj4gKyAgLSByZWcKPiArICAtIGNsb2Nrcwo+ICsgIC0gY2xv
Y2stbmFtZXMKPiArICAtIGludGVycnVwdHMKPiArCj4gK2FsbE9mOgo+ICsgIC0gJHJlZjogaTNj
LnlhbWwjCj4gKwo+ICt1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlCj4gKwo+ICtleGFtcGxl
czoKPiArICAtIHwKPiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJv
bGxlci9pcnEuaD4KPiArCj4gKyAgICBpM2NANDRhMDAwMDAgewo+ICsgICAgICAgIGNvbXBhdGli
bGUgPSAiYWRpLGkzYy1tYXN0ZXItdjEiOwo+ICsgICAgICAgIHJlZyA9IDwweDQ0YTAwMDAwIDB4
MTAwMD47Cj4gKyAgICAgICAgaW50ZXJydXB0cyA9IDwzIElSUV9UWVBFX0xFVkVMX0hJR0g+Owo+
ICsgICAgICAgIGNsb2NrcyA9IDwmY2xrYyAxNT4sIDwmY2xrYyAxNT47Cj4gKyAgICAgICAgY2xv
Y2stbmFtZXMgPSAiYXhpIiwgImkzYyI7Cj4gKyAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8Mz47
Cj4gKyAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47Cj4gKwo+ICsgICAgICAgIC8qIEkzQyBhbmQg
STJDIGRldmljZXMgKi8KPiArICAgIH07Cj4gZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJ
TlRBSU5FUlMKPiBpbmRleCBkNWExNzNlOTg3YzA2ZDc1ODQ4ZDExMjMzOWUzOTk2NmYyYjcxY2Vh
Li4xZjIxMjUyOTI3NmY0YWIyOGY0YjdkMTZiNDEwNWE4Y2Y5ZmY1ZTJlIDEwMDY0NAo+IC0tLSBh
L01BSU5UQUlORVJTCj4gKysrIGIvTUFJTlRBSU5FUlMKPiBAQCAtMTE0NTIsNiArMTE0NTIsMTEg
QEAgUzoJTWFpbnRhaW5lZAo+ICBGOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
aTNjL2FzcGVlZCxhc3QyNjAwLWkzYy55YW1sCj4gIEY6CWRyaXZlcnMvaTNjL21hc3Rlci9hc3Qy
NjAwLWkzYy1tYXN0ZXIuYwo+Cj4gK0kzQyBEUklWRVIgRk9SIEFOQUxPRyBERVZJQ0VTIEkzQyBD
T05UUk9MTEVSIElQCj4gK006CUpvcmdlIE1hcnF1ZXMgPGpvcmdlLm1hcnF1ZXNAYW5hbG9nLmNv
bT4KPiArUzoJTWFpbnRhaW5lZAo+ICtGOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvaTNjL2FkaSxpM2MtbWFzdGVyLnlhbWwKPiArCj4gIEkzQyBEUklWRVIgRk9SIENBREVOQ0Ug
STNDIE1BU1RFUiBJUAo+ICBNOglQcnplbXlzxYJhdyBHYWogPHBnYWpAY2FkZW5jZS5jb20+Cj4g
IFM6CU1haW50YWluZWQKPgo+IC0tCj4gMi40OS4wCj4KCi0tIApsaW51eC1pM2MgbWFpbGluZyBs
aXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
