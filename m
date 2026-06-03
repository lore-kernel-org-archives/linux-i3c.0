Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 476A1CD6E55
	for <linux-i3c@archiver.kernel.org>; Wed,  3 Jun 2026 07:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OfOlbPkQ8vpcl0xUOadk52Ni4qSCjgNKpIRqg7CH1xs=; b=mcsU3dp3yFT4vr
	VLza9YCjIvCKiOdPC+oHRJhSTOxFH9U2wkpeTsIaUJnX24/xmlxXuXyqWiUCEk2/EQM1FbLPJmPMQ
	gQa+dIJfedxlPdNJpUAiLNXGZ8xKcnnUIb0qj4mGqA2oC83WbHICyWKRn1GcugBFogCg7wiG/KzdH
	CiiCUq4sSFW0WMh+XPTNRZpUbk85AwJkGI08VSeyBVOYTjkE1cbp1DPP9ikdUM1o6r8PRqs44A1pC
	oIcaLSfeTTBEEDvJgtx0L0VtYsYT7PWKJMTOPNSva4uNhNiIAQo4Ec26l9+QqpexlzTCVU/ew+h8x
	ox2ub6VMoctIUHCWDZvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUfyy-0000000ETjl-0C4j;
	Wed, 03 Jun 2026 07:25:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUfyw-0000000ETjV-0mQW
	for linux-i3c@bombadil.infradead.org;
	Wed, 03 Jun 2026 07:25:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Pyn4TEasBxmCsj3hcKPw/KRgK/LKQ2C/+5FeyYUd4gg=; b=Ys7x1WF84kO/CGeeIsYk+Xx1Kd
	z+HRZycRJjrMs8IIXUbEvqDz+F8Nb0MgrZ60v7KiFY2M56E0y4sqJa/4xANWvb0OdSpaRd57Qcwcg
	03AxpdEpgiS2YGtf4pBXIi6Q63gLPeN/Z9jRBi6pfze2znY/X1fe/DXF5KPAsOBaDjG6KJ0cZqLlJ
	kiIfd3xh45FdvustImdTOxuuG4zIBQshYX6PFDusIVnxgJIXsbdF6vLBFJe9SdG3sOD4WPgCD9lgi
	0u+cq9P1D8759AVFkXY3COJm/xDOtpz14mCCfK11+CcSc+7i7Mr2RcIY7bBgQig8WpF9KULZOV0pQ
	rtRquIQQ==;
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wUfyt-0000000BQ5M-0U11
	for linux-i3c@lists.infradead.org;
	Wed, 03 Jun 2026 07:25:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eDWcEVzFtdLAOyje3121+ZYi1rxBguuM0i6aCUZyIhqaOYm2ScQK318oNYVf8D3OgpC93zP5sXMQQOp+IGporqmBcF5kVJcl162pR1WEqR8kwfcajLid0H4JhkDvhhQ24k67EEg70jnrgsE5UfmqFUfIKMkfeOLGCElU7x5OOoeD6WSUWSj2QF7hRFe7fTjyv846klVpSZiAAdNAd0u5eBc8Xrep1yIKTqa0ek6PiJL0rzODbJcm72uLjsGKJJ5SZdVne+Le+urVRgZ5zSt5Eh63OOAoDhWgZ67uaUDXf16V4sgSIWC1rox2uMAktu6xnFNw3PxD/aNmT1/atQRFZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pyn4TEasBxmCsj3hcKPw/KRgK/LKQ2C/+5FeyYUd4gg=;
 b=VqudxWr4CNxdnbBhvZoRjBoy6YlRMtrPvYpYCJlQalBKIZ7V/zGV4XPfaXkM/NLj2pgNXIMKA6LuJfLUhpEPAOlyqRiTeytIwOaU4QkgNYKvXAGURU5khW19qBPsYG0ifNkZKHCWR2Dpswu+1NhSTgn52icPMGxo1UxmFlmyQNZ/67RYhUxmTVjKTxOo1k8QuQ/Vyp5p3132y6NYrzQnKgpbWXNusyCAEl4u4mw4SnfwqH3wPtGesoHDKInNe9xmOukUX8LCqCsrq/s6Y3qkCqElkyQaJDFKs6dU9Aiidef5eqBTJ378sMyCsL7Sqhfog2g+4LnapM9Hyd2PUDSLFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pyn4TEasBxmCsj3hcKPw/KRgK/LKQ2C/+5FeyYUd4gg=;
 b=XLSGvDx9jjrxpYLkyJHCtkVCF0YinjFGIOPCzymFxAmSlEkzdhm7ZH4JEzyH9B382meX2QzFBtbo/kj/pzFhg9D5iw+wXTLPKvJi87diPKCSFy3qt/1t5yRk2bc55gHx8gx7swIXoh5LRC98TW6y1zlEBDcdpue2pKO0vHEsQQC4bS8gUix1tTpqIIMVHezGMC1oTNMuknLbHM1LArzH24HcZBBJYJ7oxe+TStDtlaBnS16KjN7XVqR4C4PG3BSFf8C8qXjrPsjyub7KvJh5KF0uZgJDLgHFpUioDS8VT7TxLvcm4ssDXKuo3+WxdXzIMUUE4iKwCDZDc/7jQU4F3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by SN7PR03MB7155.namprd03.prod.outlook.com (2603:10b6:806:359::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Wed, 3 Jun 2026
 07:25:31 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 07:25:31 +0000
From: tze.yee.ng@altera.com
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	Felix Gu <ustc.gu@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
	Jorge Marques <jorge.marques@analog.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tze Yee Ng <tze.yee.ng@altera.com>
Subject: [PATCH] i3c: master: dw: Report CCC M0/M2 errors and retry on failure
Date: Wed,  3 Jun 2026 00:25:28 -0700
Message-ID: <5cd9bc11797c7fec92d7ef2a16d4c78963754d06.1780470927.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
X-ClientProxiedBy: SJ0PR03CA0222.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::17) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|SN7PR03MB7155:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ede7078-4873-4657-479b-08dec1414ab6
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|55112099003|56012099006|11063799006|3023799007|921020|18002099003;
X-Microsoft-Antispam-Message-Info: /Magv7Iw7FCB+/syedErQD7hb4dY/gRvJ/Ds1jF5GebA27TXIP3M3PZBcmy6jOChlD/FYnSk6dyvIe11MmyJVYCOagfwK6D84ELZSAwV8/cwnUUdZy6rzvLuXQORleUuURi6GjRgy37YxEbCWawctjcZsMjqDtW4DLMewRHb/O9sJVrRodV5LZ9X0XJBgkoySY56bTv0687EwULLzxxET6f0nM1iHgJW/y0pD+kmag4yEUxK55F+ek2ZHl2bMy3tFeoXUL7aoI/bD/se9X/JN0wXKAfvCiTRm0eldITsHpwUy0064oZfW/L/MA9tsKvZ/WuHFmJeSYKvk2W0Ccl/Vgxw/Sk4gLSsLnwopnpVKL6VAK875EwWlcVlktJPMdl7zKr+IllGK8AhkWDj26rJGSTVpF8+EMVkDIBB3XYmtN1oCqnN5IajzFNzl79TURTsBWopb/qpjVAsZ3b1u15izlSuViNKJdcY7574EwKqscrHdQIRyOM4k/cQErq1fd5TEOqTuLPThyXLvvs//10VjtFluTmV88sHFw4e/mcwAs1/ibAPrcL7tkEcU0JYuPkK1mIz6Xm834WYe+dBpbKsjzKe3AfjDKoxc+kUIlNLADGsWWLgHobvdksUyQQEURUT2LugSxevrKmTjbqE2tbkLnO4KVaRISNzmm/UnrdNT16iNWfA5kvfGHK8yyRhRlI/8bEMGmeRklRHYGNz74HGHMoJoUcbS8XkyTPTGOhgOk4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(55112099003)(56012099006)(11063799006)(3023799007)(921020)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzViSGF3c2swbGt3MHdwR2pPa3JDdDljTmdPRjEvM3ZJU0NTQzllckhIMUhZ?=
 =?utf-8?B?V3FQRSsvOEhQaDNKamNkZDQxeTB2MXY0SGJnZ3lSSVd2U2dYNzdCVDFhK3Nn?=
 =?utf-8?B?eElNTkx1dVRyanJDb2NQK29VVEtvNzAyd2NQM3Q1bE94dEZWaVFWQ1BKQi82?=
 =?utf-8?B?Ni9jNWxFbzNyWXZNNXlCS2pVM3l4RXhQbzQzcjlmRnJJRHlvM2JJUnNEMElk?=
 =?utf-8?B?azNCb1FOLzZJUVNQV1lzZnFDdlJKcUc2Ty9IOFU4THBmUVN5ZWtIRGxUdDJU?=
 =?utf-8?B?bkZTVXFOVVdCSWcyaU90eEhMY0c4NEdlazhsV25FemRHbzRDWEpSazh0cS81?=
 =?utf-8?B?clFUWS82eVdYWElHcHVzNitNNk8xaVpzb0wvclgvV1VSdW1yUmw2MjlONDgv?=
 =?utf-8?B?OWUxeExaZ0tlaStpTTdCMzhGNWw2bFlQS1MxZjFTdkt3T1J1S2dDL0VHSnZ4?=
 =?utf-8?B?LzNlS2lsaStLTXNxemxlUHdtRkp5R0UrS3VxNFd4VW42YmxDakJnU2RKdkVF?=
 =?utf-8?B?VUszL0c2bGozZnR5Q1dxTE1sWS8rbGhRT1pyc3hhT09ycjNRNnJ1VGthYmVF?=
 =?utf-8?B?VWtld3JNQ25Mclg0SDVNQjA2bjZUMUpjbVRma0hwZTcrQXhoVFBoaVpwb1lG?=
 =?utf-8?B?NnNQN1hnd0pDTmJ3MlluUVRsSnZZcWcwOCsrcFR6V2R1WkRsZERyN2ltakJM?=
 =?utf-8?B?N1lvYXdBdmdyaVBKRzc3RURyd2lnQzhNOWlQbm1KRHJEMDh4dFVtMXUwNmxa?=
 =?utf-8?B?OWJaNG9vWlVJKzFqU2dnR0VwRE4zdUR0Y3BwNDNpSHVMZ242a1kwYXBXbElI?=
 =?utf-8?B?cmp2L0xoN3BwWG1NWFVCVWhmeDlrRm40S3RGb25hTFNMOEZHWStma1pZc0sw?=
 =?utf-8?B?eWNmUEVKY3NnMlBrRlYzcVJVdFZpM2tGVWFoMk1lTDMzWWhONWdlOXZ5Zmp5?=
 =?utf-8?B?M3pONjVDankvQ1RDVmJvSkVGcFJaZEpGSGlNUDBIWEo1bm8zVGJVU1ZiMXFB?=
 =?utf-8?B?SWJUSFdCUmVXUUQ3c1AyUW9GRXNaV2tEZzZsZ3FlTEcyT01CbU9UeWthY0lz?=
 =?utf-8?B?MWdNVldxUW96eXBzUmtXRVAvUVhIR3dqdW13c3AveVJnbUpUODA1ZlJQK2li?=
 =?utf-8?B?YW1HVWxjbjBUbkdtT1R3OWYyVVZwTUoxSXQvSHRtVWZaakZiUkJVWElZMUw0?=
 =?utf-8?B?NmZ1cW5nZjFaMkZRY21xL2l5UGxpdWsyeU1Bc1lMWGorK3FSdCtUWWlOcS9P?=
 =?utf-8?B?TC9IRVRXSWNiU2xjeHFJTC9pdzhIdVhRRCs1aW9pMkVYbEZ0eXlKd3BFSXJ2?=
 =?utf-8?B?a0gwMkpMNFpuMWJqSVlZOVd3M3ZHUnl2Q2lRT2VuSGJJeVRyVm1VQjl0Q3py?=
 =?utf-8?B?Ym9FS2ZQZmFRNFRDempjYVBKcElPQ1k5bkRpeTE3ckRkSnZReDhOTXFuRVJl?=
 =?utf-8?B?QTFLNDdkSnRKR0taeTd3VkF1T01JcC8rSCtKMlljWFpUMjZQb1pNeC9odWc4?=
 =?utf-8?B?eS9QK1VTMmYya0JnQjlkTVF0S3hBL1U0OWZmbzh5ZWxwL1JrR0wzSGJFVVZN?=
 =?utf-8?B?MUJJSVJkaVRUYTVJNW5zUGVmOHhqWlZJWU40Kzk1eHZYL3hXWDgvc0liMHFv?=
 =?utf-8?B?MWxtSFB0bVJCSmZFcUVBd25LbEdwYzdtMWJxcHBYY2FGWnQvcTl5d3lFZ3Ev?=
 =?utf-8?B?VUFJS0puMzhndzVUeUV5aXVka3A1cDRGRmIxK1Urc3BKWGJrcE1kZE5IczBl?=
 =?utf-8?B?TVNwYU9pRUordlA3TmNqaFp1QmJtOEVkUFBvYWE3S1FPdm90TzRFVUUrQThx?=
 =?utf-8?B?R295eGtWM0xyaXFOckQ4djZCRXZHMWlUdldtaE52Z3B3Ykl1NjJDS2ZOc29V?=
 =?utf-8?B?Z0dscklYUm0xdndrUjBBQkh2QURzNkRwbnZjVTFyNDJpWXZQMUZQRmMzNU50?=
 =?utf-8?B?eFJNQU4rVkxIZlM0UHlGZ3FIbGdvbFpmYkljRXNtMFNuRDRweTlQeHRkTC9H?=
 =?utf-8?B?T2xqZHBWbVRDMFA2WHFDTVpkU2QzdUlWKzQ3ZWFZclpxTTcyVTVOWUZFMURM?=
 =?utf-8?B?UkdXYUdsNmRIaFc0T2IybEJFcTVELytHdjBWeG5oZ3VDR2FyN2R4ZnluaUxp?=
 =?utf-8?B?V0QwM1haSlJTWStBSnNlTUFnc05CekVndEhIc3pJcHRyU25rTWpWQU9YNFBz?=
 =?utf-8?B?TXI3eUxocGxJTmI1ZmpNODFsNzViU3JseGdHLy9OVkFLRGtEVG5nQnFpUFIz?=
 =?utf-8?B?WW1MV0JaYWI3OVM5SS9zUmxaUEFib1o4NXBFaC84QURVRVJ2SXlHRkx3cnJG?=
 =?utf-8?B?NndpWHZZRVFMYXlIeEJ3SzZGU3VPQ1krc1doWDhIRS9Qb2FaSCtSZz09?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ede7078-4873-4657-479b-08dec1414ab6
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 07:25:31.0893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n18tNrSGQnAglBpRwVF8MuV7Cjboz3yM1BPb11YcB1cCAPODQRHNGIfzUOFdF9waN/XucqyNoOBGEWoKFvV1OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_082539_275429_1C2DED52 
X-CRM114-Status: GOOD (  16.64  )
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

RnJvbTogQWRyaWFuIE5nIEhvIFlpbiA8YWRyaWFuLmhvLnlpbi5uZ0BhbHRlcmEuY29tPgoKSW1w
cm92ZSBDQ0MgcmVsaWFiaWxpdHkgb24gdGhlIERlc2lnbldhcmUgbWFzdGVyIGJ5IHJlcG9ydGlu
ZwpzdGFuZGFyZCBJM0MgZXJyb3IgY29kZXMgdG8gdGhlIGNvcmUgYW5kIHJldHJ5aW5nIHRoZSBj
b21tYW5kIG9uY2UKd2hlbiB0aGUgZmFpbHVyZSBsb29rcyB0cmFuc2llbnQuCgpNYXAgaGFyZHdh
cmUgc3RhdHVzIHRvIGNjYy0+ZXJyIGFzIGZvbGxvd3M6Ci0gSTNDX0VSUk9SX00yOiBJQkEgTkFD
SyBvciBhZGRyZXNzIE5BQ0sKLSBJM0NfRVJST1JfTTA6IGZyYW1lIGVycm9yLCBvciBhbiBpbmNv
bXBsZXRlIEdFVC9TRVQgcGF5bG9hZCB3aGVuCsKgIHRoZSBjb250cm9sbGVyIHJlcG9ydHMgYSBz
dWNjZXNzZnVsIHRyYW5zZmVyIChzaG9ydCByZWFkIHZzCsKgIHJlcXVlc3RlZCBsZW5ndGg7IEdF
VE1STCB1c2VzIEdFVF9NUkxfTUlOX0xFTiBpZiB0aGUgYnVmZmVyIGlzCsKgIGxhcmdlciB0aGFu
IHN0cnVjdCBpM2NfY2NjX21ybCkKCk9uIGEgc3VjY2Vzc2Z1bCBHRVQgQ0NDLCBzZXQgZGVzdHNb
MF0ucGF5bG9hZC5sZW4gdG8gdGhlIG51bWJlciBvZgpieXRlcyBhY3R1YWxseSByZWNlaXZlZC4K
ClJlc2V0IGNjYy0+ZXJyIGJlZm9yZSBlYWNoIGF0dGVtcHQuIFJldHJ5IHRoZSBDQ0MgZ2V0IG9y
IHNldCBvbmNlCmlmIHRoZSB0cmFuc2ZlciBmYWlscyB3aXRoIEkzQ19FUlJPUl9NMCBvciBJM0Nf
RVJST1JfTTIuCgpTaWduZWQtb2ZmLWJ5OiBBZHJpYW4gTmcgSG8gWWluIDxhZHJpYW4uaG8ueWlu
Lm5nQGFsdGVyYS5jb20+ClNpZ25lZC1vZmYtYnk6IFR6ZSBZZWUgTmcgPHR6ZS55ZWUubmdAYWx0
ZXJhLmNvbT4KLS0tCiBkcml2ZXJzL2kzYy9tYXN0ZXIvZHctaTNjLW1hc3Rlci5jIHwgNzkgKysr
KysrKysrKysrKysrKysrKysrKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNjkgaW5zZXJ0aW9u
cygrKSwgMTAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyL2R3
LWkzYy1tYXN0ZXIuYyBiL2RyaXZlcnMvaTNjL21hc3Rlci9kdy1pM2MtbWFzdGVyLmMKaW5kZXgg
NjU1NjkzYTIxODdlLi44NWVhMGFmNTc3MTcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaTNjL21hc3Rl
ci9kdy1pM2MtbWFzdGVyLmMKKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyL2R3LWkzYy1tYXN0ZXIu
YwpAQCAtMjQzLDYgKzI0MywxMiBAQAogI2RlZmluZSBBTURfSTNDX09EX1BQX1RJTUlORwkJQklU
KDEpCiAjZGVmaW5lIERXX0kzQ19ESVNBQkxFX1JVTlRJTUVfUE1fUVVJUksJQklUKDIpCiAKKy8q
IE1pbmltdW0gR0VUTVJMIHBheWxvYWQgKHJlYWRfbGVuIG9ubHk7IG5vIElCSSBieXRlKS4gKi8K
KyNkZWZpbmUgR0VUX01STF9NSU5fTEVOIDIKKworLyogTWF4aW11bSBudW1iZXIgb2YgcmV0cmll
cyBmb3IgQ0NDIGNvbW1hbmRzICovCisjZGVmaW5lIERXX0kzQ19DQ0NfTUFYX1JFVFJJRVMgMgor
CiBzdHJ1Y3QgZHdfaTNjX2NtZCB7CiAJdTMyIGNtZF9sbzsKIAl1MzIgY21kX2hpOwpAQCAtNzA4
LDEyICs3MTQsNDcgQEAgc3RhdGljIHZvaWQgZHdfaTNjX21hc3Rlcl9idXNfY2xlYW51cChzdHJ1
Y3QgaTNjX21hc3Rlcl9jb250cm9sbGVyICptKQogCWR3X2kzY19tYXN0ZXJfZGlzYWJsZShtYXN0
ZXIpOwogfQogCitzdGF0aWMgYm9vbCBkd19pM2NfY2NjX2dldF9sZW5fbWlzbWF0Y2godTggY2Nj
X2lkLCB1MTYgcmVxX2xlbiwgdTE2IHJ4X2xlbikKK3sKKwlpZiAoY2NjX2lkICE9IEkzQ19DQ0Nf
R0VUTVJMKQorCQlyZXR1cm4gcnhfbGVuIDwgcmVxX2xlbjsKKworCS8qCisJICogR0VUTVJMIHJl
dHVybnMgMiBvciAzIGJ5dGVzOyBjb3JlIHNldHMgcmVxX2xlbiBhY2NvcmRpbmdseS4KKwkgKiBJ
ZiB0aGUgYnVmZmVyIGlzIGxhcmdlciwgb25seSBlbmZvcmNlIHRoZSBtaW5pbXVtIHZhbGlkIHNp
emUuCisJICovCisJaWYgKHJlcV9sZW4gPD0gc2l6ZW9mKHN0cnVjdCBpM2NfY2NjX21ybCkpCisJ
CXJldHVybiByeF9sZW4gPCByZXFfbGVuOworCisJcmV0dXJuIHJ4X2xlbiA8IEdFVF9NUkxfTUlO
X0xFTjsKK30KKworc3RhdGljIHZvaWQgZHdfaTNjX2NjY19tYXBfZXJyKHN0cnVjdCBpM2NfY2Nj
X2NtZCAqY2NjLAorCQkJICAgICAgIHN0cnVjdCBkd19pM2NfY21kICpjbWQsCisJCQkgICAgICAg
Ym9vbCBkYXRhX2xlbl9taXNtYXRjaCwgaW50ICpyZXQpCit7CisJdTggZXJyID0gY21kLT5lcnJv
cjsKKworCWlmIChlcnIgPT0gUkVTUE9OU0VfRVJST1JfSUJBX05BQ0sgfHwKKwkgICAgZXJyID09
IFJFU1BPTlNFX0VSUk9SX0FERFJFU1NfTkFDSykgeworCQljY2MtPmVyciA9IEkzQ19FUlJPUl9N
MjsKKwl9IGVsc2UgaWYgKGVyciA9PSBSRVNQT05TRV9FUlJPUl9GUkFNRSkgeworCQljY2MtPmVy
ciA9IEkzQ19FUlJPUl9NMDsKKwl9IGVsc2UgaWYgKGRhdGFfbGVuX21pc21hdGNoICYmIGVyciA9
PSBSRVNQT05TRV9OT19FUlJPUiAmJiAhKnJldCkgeworCQljY2MtPmVyciA9IEkzQ19FUlJPUl9N
MDsKKwkJKnJldCA9IC1FSU87CisJfQorfQorCiBzdGF0aWMgaW50IGR3X2kzY19jY2Nfc2V0KHN0
cnVjdCBkd19pM2NfbWFzdGVyICptYXN0ZXIsCiAJCQkgIHN0cnVjdCBpM2NfY2NjX2NtZCAqY2Nj
KQogewogCXN0cnVjdCBkd19pM2NfY21kICpjbWQ7CisJYm9vbCBkYXRhX2xlbl9taXNtYXRjaDsK
IAlpbnQgcmV0LCBwb3MgPSAwOwogCisJY2NjLT5lcnIgPSBJM0NfRVJST1JfVU5LTk9XTjsKKwog
CWlmIChjY2MtPmlkICYgSTNDX0NDQ19ESVJFQ1QpIHsKIAkJcG9zID0gZHdfaTNjX21hc3Rlcl9n
ZXRfYWRkcl9wb3MobWFzdGVyLCBjY2MtPmRlc3RzWzBdLmFkZHIpOwogCQlpZiAocG9zIDwgMCkK
QEAgLTc0Miw4ICs3ODMsMTQgQEAgc3RhdGljIGludCBkd19pM2NfY2NjX3NldChzdHJ1Y3QgZHdf
aTNjX21hc3RlciAqbWFzdGVyLAogCQlkd19pM2NfbWFzdGVyX2RlcXVldWVfeGZlcihtYXN0ZXIs
IHhmZXIpOwogCiAJcmV0ID0geGZlci0+cmV0OwotCWlmICh4ZmVyLT5jbWRzWzBdLmVycm9yID09
IFJFU1BPTlNFX0VSUk9SX0lCQV9OQUNLKQotCQljY2MtPmVyciA9IEkzQ19FUlJPUl9NMjsKKwlj
bWQgPSAmeGZlci0+Y21kc1swXTsKKwkvKgorCSAqIFJFU1BPTlNFX1BPUlRfREFUQV9MRU4gcmVw
b3J0cyBieXRlcyB0cmFuc2ZlcnJlZDsgb24gU0VUIENDQ3MKKwkgKiB0aGlzIHJlZmxlY3RzIHRo
ZSB3cml0ZSBjb3VudCAoc3RvcmVkIGluIGNtZC0+cnhfbGVuKS4KKwkgKi8KKwlkYXRhX2xlbl9t
aXNtYXRjaCA9IGNjYy0+ZGVzdHNbMF0ucGF5bG9hZC5sZW4gJiYKKwkJCSAgICBjbWQtPnJ4X2xl
biA8IGNjYy0+ZGVzdHNbMF0ucGF5bG9hZC5sZW47CisJZHdfaTNjX2NjY19tYXBfZXJyKGNjYywg
Y21kLCBkYXRhX2xlbl9taXNtYXRjaCwgJnJldCk7CiAKIAlyZXR1cm4gcmV0OwogfQpAQCAtNzUx
LDIxICs3OTgsMjcgQEAgc3RhdGljIGludCBkd19pM2NfY2NjX3NldChzdHJ1Y3QgZHdfaTNjX21h
c3RlciAqbWFzdGVyLAogc3RhdGljIGludCBkd19pM2NfY2NjX2dldChzdHJ1Y3QgZHdfaTNjX21h
c3RlciAqbWFzdGVyLCBzdHJ1Y3QgaTNjX2NjY19jbWQgKmNjYykKIHsKIAlzdHJ1Y3QgZHdfaTNj
X2NtZCAqY21kOworCXUxNiByZXFfbGVuOworCWJvb2wgcnhfbGVuX21pc21hdGNoOwogCWludCBy
ZXQsIHBvczsKIAorCWNjYy0+ZXJyID0gSTNDX0VSUk9SX1VOS05PV047CisKIAlwb3MgPSBkd19p
M2NfbWFzdGVyX2dldF9hZGRyX3BvcyhtYXN0ZXIsIGNjYy0+ZGVzdHNbMF0uYWRkcik7CiAJaWYg
KHBvcyA8IDApCiAJCXJldHVybiBwb3M7CiAKKwlyZXFfbGVuID0gY2NjLT5kZXN0c1swXS5wYXls
b2FkLmxlbjsKKwogCXN0cnVjdCBkd19pM2NfeGZlciAqeGZlciBfX2ZyZWUoa2ZyZWUpID0gZHdf
aTNjX21hc3Rlcl9hbGxvY194ZmVyKG1hc3RlciwgMSk7CiAJaWYgKCF4ZmVyKQogCQlyZXR1cm4g
LUVOT01FTTsKIAogCWNtZCA9IHhmZXItPmNtZHM7CiAJY21kLT5yeF9idWYgPSBjY2MtPmRlc3Rz
WzBdLnBheWxvYWQuZGF0YTsKLQljbWQtPnJ4X2xlbiA9IGNjYy0+ZGVzdHNbMF0ucGF5bG9hZC5s
ZW47CisJY21kLT5yeF9sZW4gPSByZXFfbGVuOwogCi0JY21kLT5jbWRfaGkgPSBDT01NQU5EX1BP
UlRfQVJHX0RBVEFfTEVOKGNjYy0+ZGVzdHNbMF0ucGF5bG9hZC5sZW4pIHwKKwljbWQtPmNtZF9o
aSA9IENPTU1BTkRfUE9SVF9BUkdfREFUQV9MRU4ocmVxX2xlbikgfAogCQkgICAgICBDT01NQU5E
X1BPUlRfVFJBTlNGRVJfQVJHOwogCiAJY21kLT5jbWRfbG8gPSBDT01NQU5EX1BPUlRfUkVBRF9U
UkFOU0ZFUiB8CkBAIC03ODAsOCArODMzLDEyIEBAIHN0YXRpYyBpbnQgZHdfaTNjX2NjY19nZXQo
c3RydWN0IGR3X2kzY19tYXN0ZXIgKm1hc3Rlciwgc3RydWN0IGkzY19jY2NfY21kICpjY2MpCiAJ
CWR3X2kzY19tYXN0ZXJfZGVxdWV1ZV94ZmVyKG1hc3RlciwgeGZlcik7CiAKIAlyZXQgPSB4ZmVy
LT5yZXQ7Ci0JaWYgKHhmZXItPmNtZHNbMF0uZXJyb3IgPT0gUkVTUE9OU0VfRVJST1JfSUJBX05B
Q0spCi0JCWNjYy0+ZXJyID0gSTNDX0VSUk9SX00yOworCWNtZCA9ICZ4ZmVyLT5jbWRzWzBdOwor
CXJ4X2xlbl9taXNtYXRjaCA9IGR3X2kzY19jY2NfZ2V0X2xlbl9taXNtYXRjaChjY2MtPmlkLCBy
ZXFfbGVuLAorCQkJCQkJICAgICAgY21kLT5yeF9sZW4pOworCWR3X2kzY19jY2NfbWFwX2Vycihj
Y2MsIGNtZCwgcnhfbGVuX21pc21hdGNoLCAmcmV0KTsKKwlpZiAoIXJldCkKKwkJY2NjLT5kZXN0
c1swXS5wYXlsb2FkLmxlbiA9IGNtZC0+cnhfbGVuOwogCiAJcmV0dXJuIHJldDsKIH0KQEAgLTc5
Niw2ICs4NTMsNyBAQCBzdGF0aWMgaW50IGR3X2kzY19tYXN0ZXJfc2VuZF9jY2NfY21kKHN0cnVj
dCBpM2NfbWFzdGVyX2NvbnRyb2xsZXIgKm0sCiAJCQkJICAgICAgc3RydWN0IGkzY19jY2NfY21k
ICpjY2MpCiB7CiAJc3RydWN0IGR3X2kzY19tYXN0ZXIgKm1hc3RlciA9IHRvX2R3X2kzY19tYXN0
ZXIobSk7CisJaW50IHJldHJpZXMgPSBEV19JM0NfQ0NDX01BWF9SRVRSSUVTOwogCWludCByZXQg
PSAwOwogCiAJaWYgKGNjYy0+aWQgPT0gSTNDX0NDQ19FTlREQUEpCkBAIC04MTYsMTAgKzg3NCwx
MSBAQCBzdGF0aWMgaW50IGR3X2kzY19tYXN0ZXJfc2VuZF9jY2NfY21kKHN0cnVjdCBpM2NfbWFz
dGVyX2NvbnRyb2xsZXIgKm0sCiAJCXJldHVybiByZXQ7CiAJfQogCi0JaWYgKGNjYy0+cm53KQot
CQlyZXQgPSBkd19pM2NfY2NjX2dldChtYXN0ZXIsIGNjYyk7Ci0JZWxzZQotCQlyZXQgPSBkd19p
M2NfY2NjX3NldChtYXN0ZXIsIGNjYyk7CisJZG8geworCQlyZXQgPSBjY2MtPnJudyA/IGR3X2kz
Y19jY2NfZ2V0KG1hc3RlciwgY2NjKQorCQkJCQkgICA6IGR3X2kzY19jY2Nfc2V0KG1hc3Rlciwg
Y2NjKTsKKwl9IHdoaWxlICgtLXJldHJpZXMgJiYKKwkJCSByZXQgJiYgKGNjYy0+ZXJyID09IEkz
Q19FUlJPUl9NMCB8fCBjY2MtPmVyciA9PSBJM0NfRVJST1JfTTIpKTsKIAogCXBtX3J1bnRpbWVf
cHV0X2F1dG9zdXNwZW5kKG1hc3Rlci0+ZGV2KTsKIAlyZXR1cm4gcmV0OwotLSAKMi40My43CgoK
LS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
