Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 143EDC35FFC
	for <linux-i3c@archiver.kernel.org>; Tue, 25 Mar 2025 14:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nII660y2y40tp7agKFeNJjxPUgdrOmrCgKSAZ7S8ixA=; b=ZYKArtsm5I6X8E
	MGjejfeG+KQD7LXGpLljzoGrq36Z/f5cnKOvEno++yWFdJigBImIsymifcWOuVMPn87us2gn5gKpt
	hg7ccAZl2Z4V+I8FRj0JBWLIGejGRg8NJkTxNHE06e8x+3Xet+Z5alFZ5sMztZJmD0wXqrSDmBBVw
	9ts24Prk1+nPJ4FbcED472jR+Ip2DiFLRw2sGfMnD2bqdxfjHsf0f7L6FF8ib0K/32CDJGwC/CJ5U
	Z+lyVSUivi8gHE3VTx8+Z6hn4L85Hl1V54IIpleO0XGUO7KrzyQVWKH0zcXhWRwY0OUNzcm7ihb0X
	vKhs47OVRUNF9Nh5t71g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx5Uw-00000006ERu-3PJD;
	Tue, 25 Mar 2025 14:43:22 +0000
Received: from mail-am6eur05on2061e.outbound.protection.outlook.com ([2a01:111:f403:2612::61e] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx5Uu-00000006EQn-2A5d
	for linux-i3c@lists.infradead.org;
	Tue, 25 Mar 2025 14:43:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DxRnDSixXAy31Npls5K41jmOlNVqBNmu0ex+Y/8NNAT4ZxYjNiSQezjaKZUjqpWle1/E1e4E67kJNTeyom95uLcJhC7VqTZB5ObPZZ+xiANSoj/ir4Q3VhLrJuGNLtRT0ahnSELgENW8T5MmK5SCjOtgWH3BKuyLV4MCcRXgrRrr0fSUhYPCfTFAeRrUnLmzj61wK6lX9SrIQsfSCHyhVVyxr0Gc4tZTmkZ4MlRILzBTQBvsw8X9bnRp9Od9XJPD4nKcyFPu1B8ttbTsa5dlqLl1ZDTgWkZUxcqwzBed9l0b2kT7ObCMcHwzRwomvCAQ6Txb7DiKqjmvjpKgUDMCSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SqLieZararY2a89MGSOnnaZ+l6/L2B7Svm/AjzSn0MU=;
 b=Ee0rwVtZSIvNP90tJ7UAKyRXyaNKR6hjWiu5JpDlNzUGt33n3rxQkbwhkRcciuvYUkGbPAxYrk1ggJx75Z6wakCE2XtTF2h8V5ANN+RdqcEkeY2kYmyHxXFPObfF9Ut/hQEjintWFpfu4O/V0SPa9avqw55A8ZtAtAn0n7u2yucDymPaZFnQN/MWkcxWaquAwn/wjkAEZ2ZoUV11olZFRrmxSgqNq0+kIW2hRwvHcbnchHjRXcnPQDmcRH1ytE1ME0G58RlnCFykcZCG1UdCTwYf4Ez4/uOplFzMbouSNt0AzxOe1NysQ9wQG3kZ6fDM/ZLN22OlyGeMELVmRB8UBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SqLieZararY2a89MGSOnnaZ+l6/L2B7Svm/AjzSn0MU=;
 b=d9KLtByFEfSWurVf/sIO+gc9+HDAnbjdxP7v883us5guz4w3jtW/Zzf8XYuAI1+wf7lW5wkO6YIdCu1zeQEdq7sYZwLndIBDJeZ40Ytkdsfk7a7d6lOBZ38BKsQDcHv0FNVWeCIt95h65mKHCMxg+NgHUg4XyRjAHhkAmqBuKao5fHVqNBSffutkSW/F0Fq1TPjpu5aSw8yx/oExhhDK6oj+drWSRpgtr0Vuj7yIZoA+c/ME1MFw4Ai/xHRxfezcF6OcSM2sXg889pgiyCRjTjsQG/N1E0BY6UWzbrEOkxRTj4l5aqZQ8y55U8cq73J4xG9Z6fPu7tazrYuj1SCKtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU0PR04MB9300.eurprd04.prod.outlook.com (2603:10a6:10:357::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 14:43:15 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 14:43:14 +0000
Date: Tue, 25 Mar 2025 10:43:08 -0400
From: Frank Li <Frank.li@nxp.com>
To: Manjunatha Venkatesh <manjunatha.venkatesh@nxp.com>
Cc: alexandre.belloni@bootlin.com, arnd@arndb.de,
	gregkh@linuxfoundation.org, bbrezillon@kernel.org,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	rvmanjumce@gmail.com, stable@vger.kernel.org
Subject: Re: [PATCH v5] i3c: Fix read from unreadable memory at
 i3c_master_queue_ibi()
Message-ID: <Z+LA/GASTPMMcVpC@lizhi-Precision-Tower-5810>
References: <20250325102332.2435069-1-manjunatha.venkatesh@nxp.com>
Content-Disposition: inline
In-Reply-To: <20250325102332.2435069-1-manjunatha.venkatesh@nxp.com>
X-ClientProxiedBy: PH7PR13CA0002.namprd13.prod.outlook.com
 (2603:10b6:510:174::6) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU0PR04MB9300:EE_
X-MS-Office365-Filtering-Correlation-Id: a557149b-8307-447e-84b6-08dd6bab5fb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?KzFJelNHT1J5U01kZlVNNnN6U044R0tGSkw2eFpOSml5NDRHMEpEVFNaZTN1?=
 =?utf-8?B?ZDlYNlRaVDdLdk91TXVsTGMrYjIwVWE1ZU5YYWpIQ3MwUlJHMjhNVkh1Ulho?=
 =?utf-8?B?RU9RbU1SMTNMaXF6Mms4a3h5Y0xPc1hWeUNXNHVza3B3VjZjT1pRbHFMQlZu?=
 =?utf-8?B?MXd6dzFQdi9zbHV2S3RaQmJZSG1rV2g3MEVMZEVTTlQweDhCUGV3MUtXb0c0?=
 =?utf-8?B?N0dPTU4zYlo2NS9hMWNGSm1wZHNUSDVWSEJRUTJaN0oxa1N1L1FiYmZHQmJH?=
 =?utf-8?B?UWFES0w2SGtkQVJadmRxVDRBMXFmZE9jVG9kTm1FUFFJNVRCZ2VVU2hJdE9v?=
 =?utf-8?B?OWpQSnNvQXJETE9vODFhVTJ3OVYrR1BtbmJTMTVVcXlZcnpxUStJZXNzVjhv?=
 =?utf-8?B?RHQrbHRjYzRXQUYzMkNBaEtUWVJSc215N3pIOUpvckt0R0RlMWxGRCtxM0Y5?=
 =?utf-8?B?b3NvNjJHM0dvNWlYenY0SEFRK3lEWWxKNk50SlQyMlBjOXVzdDFTRXJqeDJP?=
 =?utf-8?B?TFI3T28xVnAzeTFpNFFWOGkrenJSYkgwaEpKdTI2ZkswRXU4MUJFam1QUkJt?=
 =?utf-8?B?QUZLWk4wUnRySGZPelBzdXJBK0ppTGZ3b0tDRmZvUTk4S1ZnZFFwZFFLYW80?=
 =?utf-8?B?QVBMQ2Ezc0Y1aFB4N0I2TmJXV3JoamdYSlptQ0VIL3lMU2l1SGwxbFo0cmh0?=
 =?utf-8?B?Rm9NR25vNk9qaWh4Um8yS2NKQ0QrcDRQdGlYMXd3UHVSQjVKN2ltejM5cU5N?=
 =?utf-8?B?TmJBN3c4dVZ4NlhvVWwrbUJwYlJ1VlpGazJtb1JvUGhJTTBPTVZXWlh5SVdJ?=
 =?utf-8?B?UzJIWVRnVG5FMWFuZDMyQi93NnIzVWQyWWg2d1FoSzJZQ2RHcGNvN2F0Si92?=
 =?utf-8?B?U1RyRCtUWHJQNTlPbFFrdkplWnlBLzZZei9GdURjMXRxNWVESHVQcEticVd2?=
 =?utf-8?B?cTk1eGxWc1l3TG5HTlh6UHZiRkVOVEJWekRhenFRK2JOT1B0aHpYS0phaWgv?=
 =?utf-8?B?Vm9QbzltNzdCYUlJamJTQTRqUHk2WUxQMGJiYmZhUDlEZGNpYW9FWE9HWW5w?=
 =?utf-8?B?OVVrcVYxMnJraHRsYytOdnI4T2NibmlTOFh6V1VyZmpnejJ3enhLUG93VWww?=
 =?utf-8?B?Yi9KY0d2YTBNZGJzdWRTSkZLVDNWM2xBUlY5ZWNKL3gzYVFxRHhuVndVMnNO?=
 =?utf-8?B?UFFZOXNxT1VuS1JrTTVuUDJCUjJwMWgyYlg1Y1o1OVRDTXJJcHI3V3dZVXFU?=
 =?utf-8?B?Y2VCejh5dlhnTzZkcW0xcHd4VmdLS0lOdGNEdVVQckRCanlvVHB3dXFZdU00?=
 =?utf-8?B?TlZVaGlpM1pTSUZ3VXFDM3pCeG1xWXM1VHNDUkZ5MHR1T1ZaeVBSL3RCNG54?=
 =?utf-8?B?MHl2Q29FVktoVW1aRlA2R3FhWWFkTXB4YVFKc08xYnUwT2hTRW5PSkc4ZHN6?=
 =?utf-8?B?NXlVSzltYitKZjI2NTNqQjNBZm1TWUV4MlhUa2JMQmxGbGdlOXc2OGp6WnBF?=
 =?utf-8?B?TXE1bHFMcCtEN0lsREhDeUs2d2krL3cyV01vYzdtRndlRStYRUsyYVVHYVhP?=
 =?utf-8?B?WVB1Zk9tRENYK2xCRW40TEFaYk9FeHpDbnkrdlhPc0VMbGcxMzZIakNlcE5i?=
 =?utf-8?B?QzdjMllhVmlKSklGa0R3U1RSUHVFaHhvTDQvUDRucFdtS2RRYVh6c2UrbFJP?=
 =?utf-8?B?VVFFdWhQNjN1alhDYTZtSkMrYVFTZStZendYeWJ2QndNRHpKSkRWRStkV1lL?=
 =?utf-8?B?WlVSVWlsRXk0TEFYdUhWa3VZSGhBOVNuSHMwNkdqZmpFbS9kNmZkT0grUjhB?=
 =?utf-8?B?SjFqQmwxQjhFMlVuS0QxdG80c1F2NTllR0M2MVBIeGRBbVV0TCtUUFlPNlZq?=
 =?utf-8?B?WDRpRGxwRlR5RUxUcE9pYWllMWpLTEhyZjZLU1IrMmZ1SmpidEFYeUcwTnYv?=
 =?utf-8?Q?LIcJPHz4LukyYmHqGcaBESHpU49/rktN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXg0Q1BvVlZkOFlpem03S3FEYWdyWktrdmpKQndIamhwcnd0MWRlVXBJNFE0?=
 =?utf-8?B?SkxwZFdkdjVwbVNYOFBpQWtQM1FYR3B6N3FGanJzNWFKbG51NnY1bUd2em5K?=
 =?utf-8?B?WFVJMkFhaDhLY0VoTXhIeVI0aFd6RGd1SkIvUTkvcTcybTdCU0xONUVJc1VU?=
 =?utf-8?B?MnM4czhQS0NwYnI1eXlGd2FCRkR2NUF5RWxUUm9MMElvUzZQdWRMaGxOeVRz?=
 =?utf-8?B?d3IzNjdqRnA3dHhwdmtaaG5pREUyQUlpNTFNRkxEaW9IVEU1bnZ0bTNMY08y?=
 =?utf-8?B?OVN4alJ2ei9iY3lzZjVsR1FxeG9pc2cxNzhEZkFGSjNKRE9ldVZSTjZBeWJR?=
 =?utf-8?B?ZmpGbitCcGJJbXBsU2krblZraXRGeXJ6NDF3TkdHMU42UmY5b0ZuRzNHZkEy?=
 =?utf-8?B?b2lVMlFoWHZ5Q2dWQUM1U1A5UjdQN2VFcUxLZTRNYUJEb3h5QUQ1aytKVXFy?=
 =?utf-8?B?RVQ5cW5jSGhHMVlOR09EVit3ZHhQc0ZkbFBEbHJpeEk1Q0ZYWGhkaDFTeGF3?=
 =?utf-8?B?ODhVLzVWYTMrTW9jY0FmWk5TNDIxNDlCUEJER3U1dDJhWU9ZUTRzVW5yZXdQ?=
 =?utf-8?B?MDZ3RXVxWkM5QS9aQzQydFBUQkpsMStqeFlRQUwrUDYwQ3lXcVhOT3RPblJj?=
 =?utf-8?B?MXZIR09IeE9qdmtnUlZJdk9yd1NvQ0srQ0ZGMklyRzFsUEVVRmhESFBqQzZq?=
 =?utf-8?B?dWJMcGxTb0I3cWpwa05qMnVaRUpzWmpxWlBYVVBFaFZHamJWRGlMT1J3ZkVG?=
 =?utf-8?B?RDY5dXJ1bCswTVZUV0F2am1EMmZQZ3RXSkFCK29NUXBlMXg5a3U0VzFZMWpR?=
 =?utf-8?B?Rms5cGN5M3FBRlBYeFpQVk1ObUlUYTRLWlhNeGh1QUhpMVBHajlWdjBYbnlU?=
 =?utf-8?B?TmJDSUdPKzNBZm9yYWpmSzFVenplY2ZSSTVqUGFrOFBzb0QvQWFZM1lQaDZ3?=
 =?utf-8?B?czUzeURwZkY3Rmo3WEtJZVNyVFg1TUhrcGhqMVEycFlVRmhsa2RuYTFJVkxQ?=
 =?utf-8?B?N2hYbWNMajQwU2xkMW1WTVFsNG90TGVRRGZHV3lFM0pqTzQ5NDhkdXJNVWg4?=
 =?utf-8?B?ODEzd3ZQdnBLdDZ5UXBUZlBBSnRNR21tcWFCS2JpMjl2MXJLbDlnWFJ0TlpI?=
 =?utf-8?B?Z24yZ3R5cGE2WU4xRkpjYTFCWWFzUW43NlJiVHNkSHZLc3VoMXNMS1hTMDh2?=
 =?utf-8?B?Z3JCNHV2R1htSnZmRTFEODZlRHNVa2lNYkZEbUp1Y2d6N1ZLY0FNU0EzTjVs?=
 =?utf-8?B?QUdhL0FudGkrejcycDBYRGxFMGVzU0ExNUEvUG52UzlBeVMxZDMzWjhjdUxY?=
 =?utf-8?B?eGFyOGlralJBNmJPUklQNm94Zk5aeHU2UTU1K2M1a1BjeDRqT0lVMVFwUFZV?=
 =?utf-8?B?TjhPd3dNZEQ0THhvV2RxUThwYmJpMWc3VWhtQTJDM1ZEbXJudlk5MWpCRkxn?=
 =?utf-8?B?QWFKa1ZsYU93MmZieEM5UzdXT1BrazlYeURJZk9RajR1MzVYOUZlRHBsVjhS?=
 =?utf-8?B?TUpWQzRST29NNmQ5WnA1eWs3VGUwa2ViYVY2OE9zWlppTHlvUjZPNnhLUXlC?=
 =?utf-8?B?ZkRQM1l3MmpFeGFrRkJFb0kxMktJNENBZ0JPSU9qaHRmN0wvVlJ4MzdOZ1Ru?=
 =?utf-8?B?K2xaRUVpVmg2ZTljd2ozUW02d2xnODhCUHR2cjZ6WDFCK2puTlpsL0JUWUpY?=
 =?utf-8?B?bm95UlFBMStNUjN1M2ZTTnp1LzlEUjR5OFRLY1pQbTdXbXNibm5Wd3dQMmFm?=
 =?utf-8?B?cERlMDltejZWUHpZclRxQ0RjN0Rnd0dFNllpN0MwYlN0U0ZtN0pvSmdSOGpT?=
 =?utf-8?B?NWsrcDk1eCt3cDVucSt2M2tobElKa2E0ODE1VTBTNkY5WDM3RlM2OXp6WTRn?=
 =?utf-8?B?dlR2aDE3eG83dGV6dGJOV3YycUpwaVdESThKaUtGbWd6cmdjTGVtSDg5eXF5?=
 =?utf-8?B?MmU5U05wWCtFdzEzYld6K1FSM2psbVc0TmZPWWh3dWlrbXhScjVETlhBYjQx?=
 =?utf-8?B?TEpIZGQ1NEFqTGJ0U3JvMXZYQWJ5amJNdEtPUUJta0xSbE5rRDlQTGhXalhx?=
 =?utf-8?B?ZXM4blh4Y1ZldDg3dVdKZUEzTElIb0UvOHArOUtBQkNqS2FVNWltYUpMZXRk?=
 =?utf-8?Q?KWYfRfmvwKFCyW/l+qH2YiJtg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a557149b-8307-447e-84b6-08dd6bab5fb0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 14:43:14.8022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P9opJ5ZgYyW4NN/fgy3+qNq/kyzANsHw2pml7uumBRXHSAZfyaaAIyC5dqTfNPwfNPXZxONeF2A7YXhcdTdLqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9300
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_074320_570210_4812358F 
X-CRM114-Status: GOOD (  26.06  )
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

U3ViamVjdCBzaG91bGQgYmUKCmkzYzogQWRkIE5VTEwgcG9pbnRlciBjaGVjayBpbiBpM2NfbWFz
dGVyX3F1ZXVlX2liaSgpCgpPbiBUdWUsIE1hciAyNSwgMjAyNSBhdCAwMzo1MzozMlBNICswNTMw
LCBNYW5qdW5hdGhhIFZlbmthdGVzaCB3cm90ZToKPiBBcyBwYXJ0IG9mIEkzQyBkcml2ZXIgcHJv
YmluZyBzZXF1ZW5jZSBmb3IgcGFydGljdWxhciBkZXZpY2UgaW5zdGFuY2UsCj4gV2hpbGUgYWRk
aW5nIHRvIHF1ZXVlIGl0IGlzIHRyeWluZyB0byBhY2Nlc3MgaWJpIHZhcmlhYmxlIG9mIGRldiB3
aGljaCBpcwo+IG5vdCB5ZXQgaW5pdGlhbGl6ZWQgY2F1c2luZyAiVW5hYmxlIHRvIGhhbmRsZSBr
ZXJuZWwgcmVhZCBmcm9tIHVucmVhZGFibGUKPiBtZW1vcnkiIHJlc3VsdGluZyBpbiBrZXJuZWwg
cGFuaWMuCj4KPiBCZWxvdyBpcyB0aGUgc2VxdWVuY2Ugd2hlcmUgdGhpcyBpc3N1ZSBoYXBwZW5l
ZC4KPiAxLiBEdXJpbmcgYm9vdCB1cCBzZXF1ZW5jZSBJQkkgaXMgcmVjZWl2ZWQgYXQgaG9zdCAg
ZnJvbSB0aGUgc2xhdmUgZGV2aWNlCj4gICAgYmVmb3JlIHJlcXVlc3RpbmcgZm9yIElCSSwgVXN1
YWxseSB3aWxsIHJlcXVlc3QgSUJJIGJ5IGNhbGxpbmcKPiAgICBpM2NfZGV2aWNlX3JlcXVlc3Rf
aWJpKCkgZHVyaW5nIHByb2JlIG9mIHNsYXZlIGRyaXZlci4KPiAyLiBTaW5jZSBtYXN0ZXIgY29k
ZSB0cnlpbmcgdG8gYWNjZXNzIElCSSBWYXJpYWJsZSBmb3IgdGhlIHBhcnRpY3VsYXIKPiAgICBk
ZXZpY2UgaW5zdGFuY2UgYmVmb3JlIGFjdHVhbGx5IGl0IGluaXRpYWxpemVkIGJ5IHNsYXZlIGRy
aXZlciwKPiAgICBkdWUgdG8gdGhpcyByYW5kb21seSBhY2Nlc3NpbmcgdGhlIGFkZHJlc3MgYW5k
IGNhdXNpbmcga2VybmVsIHBhbmljLgo+IDMuIGkzY19kZXZpY2VfcmVxdWVzdF9pYmkoKSBmdW5j
dGlvbiBpbnZva2VkIGJ5IHRoZSBzbGF2ZSBkcml2ZXIgd2hlcmUKPiAgICBkZXYtPmliaSA9IGli
aTsgYXNzaWduZWQgYXMgcGFydCBvZiBmdW5jdGlvbiBjYWxsCj4gICAgaTNjX2Rldl9yZXF1ZXN0
X2liaV9sb2NrZWQoKS4KPiA0LiBCdXQgd2hlbiBJQkkgcmVxdWVzdCBzZW50IGJ5IHNsYXZlIGRl
dmljZSwgbWFzdGVyIGNvZGUgIHRyeWluZyB0byBhY2Nlc3MKPiAgICB0aGlzIHZhcmlhYmxlIGJl
Zm9yZSBpdHMgaW5pdGlhbGl6ZWQgZHVlIHRvIHRoaXMgcmFjZSBjb25kaXRpb24KPiAgICBzaXR1
YXRpb24ga2VybmVsIHBhbmljIGhhcHBlbmVkLgoKSG93IGFib3V0IGNvbW1pdCBtZXNzYWdlIGFz
OgoKVGhlIEkzQyBtYXN0ZXIgZHJpdmVyIG1heSByZWNlaXZlIGFuIElCSSBmcm9tIGEgdGFyZ2V0
IGRldmljZSB0aGF0IGhhcyBub3QKYmVlbiBwcm9iZWQgeWV0LiBJbiBzdWNoIGNhc2VzLCB0aGUg
bWFzdGVyIGNhbGxzIGBpM2NfbWFzdGVyX3F1ZXVlX2liaSgpYAp0byBxdWV1ZSBhbiBJQkkgd29y
ayB0YXNrLCBsZWFkaW5nIHRvICJVbmFibGUgdG8gaGFuZGxlIGtlcm5lbCByZWFkIGZyb20KdW5y
ZWFkYWJsZSBtZW1vcnkiIGFuZCByZXN1bHRpbmcgaW4gYSBrZXJuZWwgcGFuaWMuCgpUeXBpY2Fs
IElCSSBoYW5kbGluZyBmbG93OgoxLiBUaGUgSTNDIG1hc3RlciBzY2FucyB0YXJnZXQgZGV2aWNl
cyBhbmQgcHJvYmVzIHRoZWlyIHJlc3BlY3RpdmUgZHJpdmVycy4KMi4gVGhlIHRhcmdldCBkZXZp
Y2UgZHJpdmVyIGNhbGxzIGBpM2NfZGV2aWNlX3JlcXVlc3RfaWJpKClgIHRvIGVuYWJsZSBJQkkK
ICAgYW5kIGFzc2lnbnMgYGRldi0+aWJpID0gaWJpYC4KMy4gVGhlIEkzQyBtYXN0ZXIgcmVjZWl2
ZXMgYW4gSUJJIGZyb20gdGhlIHRhcmdldCBkZXZpY2UgYW5kIGNhbGxzCiAgIGBpM2NfbWFzdGVy
X3F1ZXVlX2liaSgpYCB0byBxdWV1ZSB0aGUgdGFyZ2V0IGRldmljZSBkcml2ZXLigJlzIElCSSBo
YW5kbGVyCiAgIHRhc2suCgpIb3dldmVyLCBzaW5jZSB0YXJnZXQgZGV2aWNlIGV2ZW50cyBhcmUg
YXN5bmNocm9ub3VzIHRvIHRoZSBJM0MgcHJvYmUKc2VxdWVuY2UsIHN0ZXAgMyBtYXkgb2NjdXIg
YmVmb3JlIHN0ZXAgMiwgY2F1c2luZyBgZGV2LT5pYmlgIHRvIGJlIGBOVUxMYCwKbGVhZGluZyB0
byBhIGtlcm5lbCBwYW5pYy4KCkFkZCBhIE5VTEwgcG9pbnRlciBjaGVjayBpbiBgaTNjX21hc3Rl
cl9xdWV1ZV9pYmkoKWAgdG8gcHJldmVudCBhY2Nlc3NpbmcKYW4gdW5pbml0aWFsaXplZCBgZGV2
LT5pYmlgLCBlbnN1cmluZyBzdGFiaWxpdHkuCgo+Cj4gRml4ZXM6IDNhMzc5YmJjZWEwYWYgKCJp
M2M6IEFkZCBjb3JlIEkzQyBpbmZyYXN0cnVjdHVyZSIpCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5l
bC5vcmcKPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sL1o5Z2pHWXVkaVl5bDNi
U2VAbGl6aGktUHJlY2lzaW9uLVRvd2VyLTU4MTAvCj4gU2lnbmVkLW9mZi1ieTogTWFuanVuYXRo
YSBWZW5rYXRlc2ggPG1hbmp1bmF0aGEudmVua2F0ZXNoQG54cC5jb20+Cj4gLS0tCj4gQ2hhbmdl
cyBzaW5jZSB2NDoKPiAgIC0gRml4IGFkZGVkIGF0IGdlbmVyaWMgcGxhY2VzIG1hc3Rlci5jIHdo
aWNoIGlzIGFwcGxpY2FibGUgZm9yIGFsbCBwbGF0Zm9ybXMKPgo+ICBkcml2ZXJzL2kzYy9tYXN0
ZXIuYyB8IDMgKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPgo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIuYyBiL2RyaXZlcnMvaTNjL21hc3Rlci5jCj4gaW5k
ZXggZDVkYzQxODBhZmJjLi5jNjUwMDZhYTA2ODQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9pM2Mv
bWFzdGVyLmMKPiArKysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIuYwo+IEBAIC0yNTYxLDYgKzI1NjEs
OSBAQCBzdGF0aWMgdm9pZCBpM2NfbWFzdGVyX3VucmVnaXN0ZXJfaTNjX2RldnMoc3RydWN0IGkz
Y19tYXN0ZXJfY29udHJvbGxlciAqbWFzdGVyKQo+ICAgKi8KPiAgdm9pZCBpM2NfbWFzdGVyX3F1
ZXVlX2liaShzdHJ1Y3QgaTNjX2Rldl9kZXNjICpkZXYsIHN0cnVjdCBpM2NfaWJpX3Nsb3QgKnNs
b3QpCj4gIHsKPiArCWlmICghZGV2LT5pYmkgfHwgIXNsb3QpCj4gKwkJcmV0dXJuOwo+ICsKPiAg
CWF0b21pY19pbmMoJmRldi0+aWJpLT5wZW5kaW5nX2liaXMpOwo+ICAJcXVldWVfd29yayhkZXYt
PmliaS0+d3EsICZzbG90LT53b3JrKTsKPiAgfQo+IC0tCj4gMi40Ni4xCj4KCi0tIApsaW51eC1p
M2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
