Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F730C282EC
	for <linux-i3c@archiver.kernel.org>; Tue, 18 Mar 2025 13:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/JA4p942SG4Rt+FXm/Edvw8DVPl243FK+so8/sl0sVg=; b=y3mplxDm7Ute7n
	6cPP/sd5+UwVCZclOOp2uuATXvD2K78b+FPv88XOFjaGpV7ExbQgV1sxgH8aC5xscBHDTsL+Sf1PC
	cgyxOTmR9BnxmF7JZjU5gWA4db2dXekyqBnnKFrlddmBsplP4qzRlW22ErecU/B2DR9QH7/SsjRDM
	8yFO5Gt5uHkri58QhxlvAHEi/2NNXK6ejKlRJTpBpiGkzXp8dcrJU5IQn2eosjxiwQ97zcsIm1hqu
	/f5yZ3Tt7zx/a19+CBzWwyExNMuWUkIrUzhpd/i5QRw0YRU8h6csKmcvKJbirsObHiKakl/0kqT0Y
	ESDEQ+TItu2jruUzpSSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuXJ6-000000064Oq-3Nxg;
	Tue, 18 Mar 2025 13:48:36 +0000
Received: from mail-am6eur05on20620.outbound.protection.outlook.com ([2a01:111:f403:2612::620] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuXBF-0000000638P-3DuY
	for linux-i3c@lists.infradead.org;
	Tue, 18 Mar 2025 13:40:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zEK46n5+YejyIrBNAJvyyoA5ZXaR6O971/ulaYWXhGI61VkLZwJZUdxUzXfjQ8/5LZOsh0b7jH5IjMdo8I02g5KXBZoZHbLzoPG/YaXAkUhfsi9xAZGiFSV4SSEt+9NOz1TuW6U9HTOe4v9KJ+E9exrcT58e9OEPUAsHJJ0OmXzHWKclD02T0NWQqsP+/sCUqc7mjqIhrcyEsECOuNBd+qVjR5i44Byd46xEOTfevCpmBIVWEovN9lJ4NcJViPLk6xTC4uV/OZeeyVGpNJJBxRSFc5tpXFRxZn0UCu36jdqNh4DKpaX+8HsueL6alZyfFL20Qo0s5yYrNTU+GAh5bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qG2jfe/GVz6QXwuMny2pglGQCa1u0xnkFtw47yRKBIE=;
 b=O0FO0fZY7DvxqzrUdKZfNArmMlsLiLPwdYHtw850EHVryTB2rvkHe762390zYrupm7L7300e84x9DB9NJByCRlu0oYApRxikgiRsmvTRe+m03/96s8v1nFO5ds2YMSG+2q63+1JeFSgJtfCv/8bff2zjW8OojNUjyOqUKIMNap5O5bJxUQJeEDy1fL0h3P50vSFNCvaIDCF624+88CDwDvVGhX7WS9+w+li9q2/K3+xQ5CtfUCzsa93ysoJ8iqQD63SuVwlmrwkuzPCGSA+zabQ2wyO6xzGEjqg4ko1uOooyVgFoiWcTyeZZSX4fQ4jc4is6ruz6bZ3F3Wzl5OF6pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qG2jfe/GVz6QXwuMny2pglGQCa1u0xnkFtw47yRKBIE=;
 b=Err8CBXl5BHs05Mc5lI2MhXR3PZ5WsSwUU12c8BkOv2YTpBa9HmVJpjX2127KyM6ouHb3RtwiK5AVAo98H1MJg8DtjvSLR5tnci3MIpCUMjqWiT0ANvW1phq65qVUeQiupidZXRyEw1SKXWWZc4y0dnvC8Zi6Qs5aznqrt9Mg3PLeIcTZDAUscln/ef8+ohXnpK9IA+IxQHzfoLty5v83RhY+XKxtqOcHjqSLvN0rs80ueLC1GplNZhL4lRanCFo6j+F0I/kwrVT1n2Xd0vS16xPmImy98cwUDyXg/SA2iESWH/XfrefU0i8A/H4hwKLxg97T7u/933ezeSd26gH2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI2PR04MB10906.eurprd04.prod.outlook.com (2603:10a6:800:277::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 13:40:24 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 13:40:24 +0000
Date: Tue, 18 Mar 2025 09:40:17 -0400
From: Frank Li <Frank.li@nxp.com>
To: Qasim Ijaz <qasdev00@gmail.com>
Cc: miquel.raynal@bootlin.com, alexandre.belloni@bootlin.com,
	linux-i3c@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: master: svc: fix signed/unsigned mismatch in
 dynamic address assignment
Message-ID: <Z9l3waI5EdrWmYC3@lizhi-Precision-Tower-5810>
References: <20250317101516.19157-1-qasdev00@gmail.com>
Content-Disposition: inline
In-Reply-To: <20250317101516.19157-1-qasdev00@gmail.com>
X-ClientProxiedBy: BYAPR06CA0042.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::19) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI2PR04MB10906:EE_
X-MS-Office365-Filtering-Correlation-Id: f35a0f3e-74d1-4c70-f7c1-08dd66226f44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|376014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T01rWFp3Q0xBSU5UYUw2NVJ5b3M3TWwvNTNQQWhBN3hGaFFlbDVpUXJwODZZ?=
 =?utf-8?B?blFKSTZ4czljRnBtVWJlaFB6V09kditBQWtjWnJQUWZwdGh1Z3VXVDBrdzcr?=
 =?utf-8?B?djNtd3pnUXpCalVqdnAwbUllcWxPRzlCYjlhamZFSEdzZFdWZEYzbDFzV0cr?=
 =?utf-8?B?NjZMYTRzME1oZkltazRCMCt1OTZHRHY1SXE2d2kralpHdXZ3azFuMGNvcS9Y?=
 =?utf-8?B?T0xUV1diaUppZmtnT1Y5WDRNUkZydWJoSGpRR3ExSXU1d2dZaHpCb0xIRXlp?=
 =?utf-8?B?R1NxQWgrZVFOeVVkMHdvSGtBdnpNUlNQSVRrL1lmSjh3Z2FDaTRlMUhSU1Iy?=
 =?utf-8?B?R1VUQkxBS3NRMWRKUXJON0tva0V0N3VUUERJK0dhUUNNL3AySkhaMnBiWlNK?=
 =?utf-8?B?SEtWOHorMy9SZHVoalJDZzBZcUhpdnhBcDRaRmdzRVIrRUs4RGxtSDhhY1Q5?=
 =?utf-8?B?ZnRLaHAvT3JsM0hVaUgvR0lhOExNUzM0VEF2cFVYZE5WcjdpcGRib2YyNy95?=
 =?utf-8?B?YU1JSGpDOFhtNDFMYVppUmhOVm5EVjFWMUNMT212V2hMYkJpRXVNOElrRnZM?=
 =?utf-8?B?aHA5Q2F2Nkp3cFZFbEdaNEFhZUREaE40WmNsQnIxSGEybjhQMEg1dVV5aTNt?=
 =?utf-8?B?bmRwT3BOVnNLU1BBWWI4dTZPUWhJVjlLR01nV1pwdWdFejNBa1ZCaWNFRDl6?=
 =?utf-8?B?b0p6c0ZKajVLVGZMdlAyMjJ4bVZ3UFNrU0ppWUpaa3BEb252aURJSHh6RU0x?=
 =?utf-8?B?NEJ2c3VmcitSWWhMc3NSWTU3UGVOQnNseFcrcHh3bzZYNDU1VTFrd3AwTjdy?=
 =?utf-8?B?d1NZUStFcjE4eHNMeUpDcnVVeGNNK2ZOUTFjVThLaVovQm05dmN0SmFxY0l4?=
 =?utf-8?B?SUJ2RUhORE5ObTlpS3FLYmxQakxRRCtqMGhWRjgwb1VVVUJaYmxqa3UrY0k1?=
 =?utf-8?B?VG0vckxjblZ4NVkvVmU5d1QrcXo5WjBOS1RpSDdQN21zVUtNTUJXWUxKditU?=
 =?utf-8?B?cmZsckV6Rm9UZmMvc0ZmcGFZWkNjWVRkalcrSWdyUEdnYnpVdXZkcFZzblVD?=
 =?utf-8?B?ZGNxSnlzN1M3RzAzZkFNSk11NHRvK0ROVWliMU4wbGp4cGFGbC9LNVM0NU9E?=
 =?utf-8?B?NlROMWpZYzlyN2o2U0p1ZVkyK21tb25SeElXcEpmVVJsQmRjcFlTVHB4dzQx?=
 =?utf-8?B?MmFaMzVYOUtSZGl3dEpyanM1UWt4ZGRPOTcyeWNnM216d09ma1h6YWZPODlK?=
 =?utf-8?B?eGl1b2VrZEcvWmFCZitDWURGN2hiY2xTM2thQ2YwTFFzUllLR0srNitvaVdk?=
 =?utf-8?B?RWZBd0g1aVRTVTc4YU9vN1pvdmdzV0JMcW9mRGlORzJQZ09lQ3hhZ1NIenRS?=
 =?utf-8?B?NmhiYmVvTS9RTGF3VFNnMnVBVmhXRHhkYVk0NnRqZjZDU2JTcTYvNHExbFUr?=
 =?utf-8?B?cmQ1cURJbnJuZlNJODRKMG44VEVDcDlvNjN1OXZWOHVTaDJ0YnBrRzd2NDBE?=
 =?utf-8?B?UEZxSGZTaFUzbVBId1F0b1A2aXpRbzZKcmd3UDZOaHh1Rjl5OCtLUXV0VW9u?=
 =?utf-8?B?eGZJeGI0dHJKSTF6NjY0NEVLNUVpVWFMWGNSU2pwYUpuazRqSDNaTHVFVUJ5?=
 =?utf-8?B?cVZUSU5JU212NkZ2K1EveFR4eTVtb1pmd0phdkZ1bXU5aDFqdzZ0NTJETDU2?=
 =?utf-8?B?djJ1M0pycWpDSFhBOE9DWnJQejlaZlF5UkJJOE9uaUdYdGFRQVJhQTEyeTlR?=
 =?utf-8?B?M1Fyb3NGTVg3RllpRmdKaHUxdHRJMkFBNVA3eEJacWhuUkZSNFR1Qngvd1Fa?=
 =?utf-8?B?b3A0QUZYVkw3WFlGMTg4eU51T1ljTEI5Rnd3aHA1K0x1L2R1WUdKd3lSenlD?=
 =?utf-8?B?S2RNandobDY1SEFiODhELzFUN0ZYeUphNDBjM3FDWklSYWc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEx1YzEwcVlhME1jdFdrQ1hzNWhpMytkWmxIU0RwZEY3Y2lMT01zRUo0REth?=
 =?utf-8?B?a3Z2MWhOZFZGamZaQzZGOU1Fd1p2UW9MVVVqQThSWldTUEVaZE5RekFFSWUx?=
 =?utf-8?B?aWl4QmYwS09LTEVrbUxqY0VhazdQVVVqaXhVczR0T1grQURQSkdzVVo4Tkg4?=
 =?utf-8?B?UlFqUFBabmtuajNqdU1Ockc0N2RaK0NzOFowN245aGJwRC80Z20wbTc2ZjZG?=
 =?utf-8?B?cndxcDR2Ujg1Y3VvaGF4VG4yM21ZejBRc1FiNU1hd1l4NjFOY3hDTGNjU3px?=
 =?utf-8?B?Nno3ZVVNYm5kMzNWaVJVdlljNit0SHNiRDF0b2YzZDRDOXJuTGFxV3JJdEhP?=
 =?utf-8?B?d2JDWU0yeHhSYVd4QWo3dlVCa1RFc1FjdTJPOGdGN3pubnlhZUNwaEJyVmNi?=
 =?utf-8?B?QTFSY0x4bTJDYUd1aFF3SWhXaW1aeW16L0FYUWVXblpiS3NoS0x4UGI2cE9D?=
 =?utf-8?B?STlPZUZzZWdYclVrNkRGU2Q1eGU3VTB0aVhCaWY0UVZucDNlWFJBblh0Y2ZM?=
 =?utf-8?B?MzFTdWN1Y2NKRTNqVEZhc0VUdit2MExsMkVRRWdPd3ZUNEM3NjhsRmR3OU15?=
 =?utf-8?B?Z2xLRVVQazcydGtFaXIyOUpOUVlVZWo0SmN0cjlTRi95RlN2d2ZDSFFKaWdm?=
 =?utf-8?B?ODQzazFDZkdnQmx5UzNBNEEwQnFvRTRiUnNIMGJUWFRCWlZ6RWxIRFV4V3ha?=
 =?utf-8?B?akRoQXlzQ1dCQUdzOFlIc0tCVHM1K1VoUXBuZUNoTGpqRzhWM0JZTVlCdURx?=
 =?utf-8?B?dWpiMUgzRHFBQmZqL3JLbUJQblZnWUNPemk1YWRCeHdyMWF0b3JPM1dXMzN5?=
 =?utf-8?B?bDloRk5TUFVBSmg5M2t1L3RxSGFFZXhmallYRGFpT01UMisxLzd0NjBoVlQ2?=
 =?utf-8?B?cFNGVXJ1S3ZyeGFoeTdJbzZKTEN1Z2E2TkljUk5ZRDdrWFM0T0w0LzBiOVhq?=
 =?utf-8?B?VmdaWEJTemk5a1l5azNHc2pPZHpWSTVrSWZ0czNCdU9OdnJCNWVQOWFaNklL?=
 =?utf-8?B?RFkyRUdESXUxR1FjdUJPOHpnRWJ4bEVrMVZQREV0WjFqbzNCanptTnBJUzFi?=
 =?utf-8?B?R3dDdFEvNkdlMTJGb2NNV1p2d282dEFnVlJJZUdxQldIRC9KODlReXRDZlRs?=
 =?utf-8?B?OEIvOUVPNXRydmZaTm5ZdE5XMG9ENTdMdnpqcVhSTHVHRHdMQUZjUHVKa25S?=
 =?utf-8?B?WVlvTGFVMTlyK08wbnlqL3laUkJLVDh3bTB1U0NMVlJHSGZ3NkZFWWRPc3Nx?=
 =?utf-8?B?NXlrelRDdVRmRmhKVm16T25ONkdvNWN3b01ZVll0b29IYXVrdFo4dG1MM21M?=
 =?utf-8?B?cXVpZEFzUFlHOUFFMVpFK0pzK0dhS0hzdGw5cFVTL3FEZjlvRWw1WGdrQ0lp?=
 =?utf-8?B?MmkrWVQrTFpFL3NWM001WEFJZU10ZjJmQnlqdjNjVHFEK2xydkJ0T2tBMGtq?=
 =?utf-8?B?Zk40ZlNrVDV3eHZnRTVjL1R2WEJReXJFWFBkQ0haSHZYazFmUWRYZVNyK2Fu?=
 =?utf-8?B?TmxlTTVNQXFuTXgwZk44Vk54K0Rpakg2bzlUVmZhM1B5QVFySUF2eXZpcGpL?=
 =?utf-8?B?a1VDWVQxSHNscStnOFJpREc5cjV0QTFDVXROYXlCNCs4VWpEd2s0SGxEM2dN?=
 =?utf-8?B?MXFBUGt3K0RFWndIVEkzVUFmYnYrRUt6NEFVYVBSWEVKTVNNN3cxdXMrZjli?=
 =?utf-8?B?aVNNQi9kSDNMK21tazlBdVpkZGRsL00vUC9hemhJT2sraHluV0s4YlNHYzNP?=
 =?utf-8?B?OWd2dVNJd3NaNjdEc1VMalVBTFNOVjFQNHpPNkV1RGNBbVhGdWZhQ2gycnN0?=
 =?utf-8?B?OE5WQ2FUZFVLQ1ZZYUtxMm8yMGhrWWZ2REtGQzFSZ0k4aVF6YmZYSS9EMis0?=
 =?utf-8?B?TWxaeU42QWthTG9maWRtN21iUDJnVEhreitid0Nqem51L01IblgwN1FIa3lI?=
 =?utf-8?B?RFMzaFJFWE1YZjB0NERkWWlpcmdZTE5DdFNjSEVIZW8rS1pPTnpYbFFrd2Jn?=
 =?utf-8?B?L1d1dGRSemYxcHVPdHpGdEFNMnNwZUs2R1Q0aWdqMklVTERYamUvTkRZR2dp?=
 =?utf-8?B?VkpDK2QydHN3ZWhTWEdrTWJVSVlwalA5UEFQbFFPdS9WaUdxdGl4ODkyZFQ4?=
 =?utf-8?Q?Xrio=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f35a0f3e-74d1-4c70-f7c1-08dd66226f44
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2025 13:40:23.9931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Az1uNEloROkRVaQkWPnmBfr1GkQJzavF+QVcjU/FgOecBKbNN8IyUowdMDTO5CyUjdRgvUenZ+CvHFK5/8fN7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10906
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_064029_807750_854C228F 
X-CRM114-Status: GOOD (  20.59  )
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

T24gTW9uLCBNYXIgMTcsIDIwMjUgYXQgMTA6MTU6MTZBTSArMDAwMCwgUWFzaW0gSWpheiB3cm90
ZToKPiBzdmNfaTNjX21hc3Rlcl9kb19kYWFfbG9ja2VkKCkgZGVjbGFyZXMgZHluX2FkZHIgYXMg
YW4gdW5zaWduZWQgaW50Cj4gaG93ZXZlciBpdCBpbml0aWFsaXNlcyBpdCB3aXRoIGkzY19tYXN0
ZXJfZ2V0X2ZyZWVfYWRkcigpIHdoaWNoCj4gcmV0dXJucyBhIHNpZ25lZCBpbnQgdHlwZSBhbmQg
dGhlbiBhdHRlbXB0cyB0byBjaGVjayBpZiBkeW5fYWRkciBpcwo+IGxlc3MgdGhhbiAwLiBVbnNp
Z25lZCBpbnRlZ2VycyBjYW5ub3QgYmUgbGVzcyB0aGFuIDAsIHNvIHRoZSBjaGVjawo+IGlzIGVz
c2VudGlhbGx5IHJlZHVuZGFudC4gRnVydGhlcm1vcmUgaTNjX21hc3Rlcl9nZXRfZnJlZV9hZGRy
KCkKPiBjb3VsZCByZXR1cm4gLUVOT01FTSB3aGljaCBhbiB1bnNpZ25lZCBpbnQgY2Fubm90IHN0
b3JlLgo+Cj4gRml4IHRoaXMgYnkgY2FwdHVyaW5nIHRoZSByZXR1cm4gdmFsdWUgb2YgaTNjX21h
c3Rlcl9nZXRfZnJlZV9hZGRyKCkKPiBpbiBhIHNpZ25lZCBpbnQg4oCYZHluX2FkZHJfcmV04oCZ
LiBJZiB0aGF0IHZhbHVlIGlzIG5lZ2F0aXZlLCByZXR1cm4KPiBhbiBlcnJvci4gT3RoZXJ3aXNl
LCBhc3NpZ24gaXQgdG8gdGhlIHVuc2lnbmVkIGludCDigJhkeW5fYWRkcuKAmSBvbmNlCj4gd2Ug
a25vdyBpdOKAmXMgdmFsaWQuCj4KPiBGaXhlczogNDAwOGE3NGUwZjliICgiaTNjOiBtYXN0ZXI6
IHN2YzogRml4IG5wY204NDUgRklGTyBlbXB0eSBpc3N1ZSIpCj4gU2lnbmVkLW9mZi1ieTogUWFz
aW0gSWpheiA8cWFzZGV2MDBAZ21haWwuY29tPgo+IC0tLQoKVGhhbmsgeW91IGZvciB5b3VyIHBh
dGNoLCBidXQgc2ltaWxhciBvbmUgd2FzIGFscmVhZHkgYXBwbGllZApodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC1pM2MvMTc0MjI1MTU4MjEwLjE1OTM2MTAuMTAwMTg4MTI3ODA3MzE4NDk0
MDkuYjQtdHlAYm9vdGxpbi5jb20vVC8jbTUxMjBlMWMzNjJlN2U1N2Y0Y2FiMTM5YTQ1NDEwZmRl
NDIxYzJmMzcKCkZyYW5rCj4gIGRyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jIHwg
NSArKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jIGIv
ZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMKPiBpbmRleCBmMjJmYjllNzUxNDIu
LmVlYTA4ZjAwZDdjZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1t
YXN0ZXIuYwo+ICsrKyBiL2RyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jCj4gQEAg
LTk5OCw5ICs5OTgsMTAgQEAgc3RhdGljIGludCBzdmNfaTNjX21hc3Rlcl9kb19kYWFfbG9ja2Vk
KHN0cnVjdCBzdmNfaTNjX21hc3RlciAqbWFzdGVyLAo+ICAJCQkgKiBmaWxsaW5nIHdpdGhpbiBh
IGZldyBodW5kcmVkIG5hbm9zZWNvbmRzLCB3aGljaCBpcyBzaWduaWZpY2FudGx5Cj4gIAkJCSAq
IGZhc3RlciBjb21wYXJlZCB0byB0aGUgNjQgU0NMIGNsb2NrIGN5Y2xlcy4KPiAgCQkJICovCj4g
LQkJCWR5bl9hZGRyID0gaTNjX21hc3Rlcl9nZXRfZnJlZV9hZGRyKCZtYXN0ZXItPmJhc2UsIGxh
c3RfYWRkciArIDEpOwo+IC0JCQlpZiAoZHluX2FkZHIgPCAwKQo+ICsJCQlpbnQgZHluX2FkZHJf
cmV0ID0gaTNjX21hc3Rlcl9nZXRfZnJlZV9hZGRyKCZtYXN0ZXItPmJhc2UsIGxhc3RfYWRkciAr
IDEpOwo+ICsJCQlpZiAoZHluX2FkZHJfcmV0IDwgMCkKPiAgCQkJCXJldHVybiAtRU5PU1BDOwo+
ICsJCQlkeW5fYWRkciA9IGR5bl9hZGRyX3JldDsKPgo+ICAJCQl3cml0ZWwoZHluX2FkZHIsIG1h
c3Rlci0+cmVncyArIFNWQ19JM0NfTVdEQVRBQik7Cj4KPiAtLQo+IDIuMzkuNQo+CgotLSAKbGlu
dXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
