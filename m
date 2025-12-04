Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F43D1CDB6
	for <linux-i3c@archiver.kernel.org>; Thu,  4 Dec 2025 01:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NQV4ltDP/Wh6Msnzb6Tr0GNAeJaN3+tvMmOtvOgA4UY=; b=Xtd6AHt0g0FPra
	Ok9xz4WjqIhOFQPKYgpm+HgdUy+XLbEmEtlPwF7JB1bq73o4qu0bmkzCQbiRuAiHXprd3E1H7A+Db
	iUGuDLpunCze1Gdw28ZJ3YrFlYkMZDjaZvc/HLvMYUJmTgmNjBtHgseIjQlaMB2G+eW46mGwsddcR
	mvhDvjXwgt/QaCsZK9FbWO6/sjunYkkusJFH8M+KqMJZ8o/5LCqfU7djJ3WKdox9PKB0+ithL90ii
	t8dpK4kmzhhvSl4VlsTTUZa/bGc7TssH1L/weyIhMH4vpARLRHODAud2JaWwXKc+CHouo9WhHoJ12
	eFEz5wNxb4RRgOgBRLBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQy3l-00000007KXU-2RX7;
	Thu, 04 Dec 2025 01:23:05 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQy3i-00000007KX7-3I3r
	for linux-i3c@lists.infradead.org;
	Thu, 04 Dec 2025 01:23:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=leZst43LtGn/65EiQyFJo3TJUzQ/ouYfLykI8Dkyyev5GPTxTLhUKsZBXNXg1kG99Kpa4rpKWKYBUO9VMRbwiW6iXOjkr5c9nFarYW8uZ/ukXrwUG27JUgbu3+bYnKf1iGJn17e2J0qy8NsJV1eaafjiTajrCxFiaFQmC1ewp5btTbeLq59FdcQbNIu6Kd7Cnht/FCP3SdIl+B4WgFBrbxzHsmYnZTSX8DZSIfr12og2s1eP+4Mq+kUlFKH8w7hcpJF3dm2D8WjJ0MwL9JQO9RRFmExtu3g39TAxgtrmApWF2K/pt/AhZIVKP+70AuFIdTVA8j8BKxttXT+TeBalsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6bThQ1a9Kn6MOgii1HQKxmiMGNAq8dO3MWodfFKLpWw=;
 b=RwtFy3llg7GoW7yyQq8UNceM6EZKxyKjZHAEIFuZcanWPAiw7ObIddUzcP0QuBnTBzow01giC23wWP2dR97yPyWXbWLYRh6XlJ4Cmjm9oGp82amLzAjXq0+G72PVsCEzChuCGEIA9GcNLdLboiONErtHHo8jBYe9iOyknFI+hPCEjhk4E2c8BU4L3GmXZzyEZ+klJ+aVUtmR8nD6SJu3e61cG8E1BqsoRpp1uiQgEHf462yBnKO1gEWooWlDwGSo1p6x41s+t9mAhNsq81Z51rytcvkmParmChWpiDTs+UhuzOf9db0J4A1rtB30hbBThu0OssxYXRXjSHu15T/tgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6bThQ1a9Kn6MOgii1HQKxmiMGNAq8dO3MWodfFKLpWw=;
 b=NOFpnHyINW9Dpl+70yMs/Sg7OgGOVYy8XZIddWyPI2tL8/CQdJiSfazkvjyQdayvud1h7L59HrpfCqQrsWyNogrh3m4WOlGWCh6vU3RDy+K1wTEVTv9iX7kls4nPj+gc+gMcoWPEubslbKCFDilc7He/tm7q6les2jAKkHMAgMm1T9ec1qZExsE+PlHZWs3J7Sj1NwDe+1iyMIl/Nxdd5UTXbXQ/B3lnx0RAQtLohlu1sAz4XfH9YLyufoPmBTFkU9zx3JXPiGj8ZythRu3kMr510G2UYvoOS0mEtdbppDLoako4DbNhsawSh0Vs1E6Hyl8iZ9FJt00BoOLnsT3wdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by GVXPR04MB10994.eurprd04.prod.outlook.com (2603:10a6:150:224::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 01:22:58 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 01:22:58 +0000
Date: Wed, 3 Dec 2025 20:22:50 -0500
From: Frank Li <Frank.li@nxp.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-iio@vger.kernel.org, joshua.yeong@starfivetech.com,
	devicetree@vger.kernel.org, linux@roeck-us.net
Subject: Re: [PATCH v11 1/6] i3c: Add HDR API support
Message-ID: <aTDiakSN34TCIskS@lizhi-Precision-Tower-5810>
References: <20251106-i3c_ddr-v11-0-33a6a66ed095@nxp.com>
 <20251106-i3c_ddr-v11-1-33a6a66ed095@nxp.com>
 <16428df229c494c807ddc75009feffe219f11a22.camel@codeconstruct.com.au>
Content-Disposition: inline
In-Reply-To: <16428df229c494c807ddc75009feffe219f11a22.camel@codeconstruct.com.au>
X-ClientProxiedBy: PH8PR07CA0039.namprd07.prod.outlook.com
 (2603:10b6:510:2cf::7) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|GVXPR04MB10994:EE_
X-MS-Office365-Filtering-Correlation-Id: 8811cd67-841b-4815-9403-08de32d3a89c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|19092799006|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VCt2cDl0K0FNaGlOQTFkMGRYUFJhNDY3NFBUVDZ0TnhMTTBOckZ3eDdROFdY?=
 =?utf-8?B?c3JGRmxlajRsQWlqUWdWQ3gxMlZ6WE5yV243V3pyWnpRK1h2a2hGVWMwb3JV?=
 =?utf-8?B?QmErVnViUzV6Mkh0bkhxTGxscnozZ2FHWjltbWJzQ240LytUSXVjR2pxQ0Vk?=
 =?utf-8?B?QUswVitRRmJJdnlyVlpaVFovQWxUUGJ5ODdKM3g1TXlCVVNFZjdCVGZBWjJ1?=
 =?utf-8?B?OEo3MHlnbHV5YUlFOUVsMkVHVFRPQ3BmWEUyTG5zbS9yQVc3VExXeDRWcnNX?=
 =?utf-8?B?NGU3NGFuc1B0NExNbStWOE5JQ2tnMVRlOUlaN1pteWpIL0tVTU1jSVhnWDk4?=
 =?utf-8?B?WTNzbEhaV2lEbmxWeHA0cGVOQXA3a3dpS1hRTkIxQ2hESFhOTUczUUlBcmZ6?=
 =?utf-8?B?cGRGU3pPVkdQQXBrbEFyNCtPbHJuVGxndkVPZDREZjB4MzF0UnpSMlJyWEdZ?=
 =?utf-8?B?bk5QY2RtLy9zVVZCeW5XMVRZNVpyd0o1TXpsNzRmdXQ1a2I2eTJncjlrbTlC?=
 =?utf-8?B?WVY1bi9RTGR6WE15Y1h0eW9kc0sraEVYcExPUXBLUm9pUm1WMHF1YW1ucWdr?=
 =?utf-8?B?c0ZKYVVhbWZOaHJSYUlxTGloWWgzdXd0bENrNFVUMXdkM20xNlJERkxyUHZw?=
 =?utf-8?B?MzJtM1BZNUx2bzBWYXpyenZHRlNiOU1zbEhlb2NuTzVYZksrWTh0NWRLUU5R?=
 =?utf-8?B?VGZ5WDR0emxKTzlBSUV2TFJ0THozKzdIdFlFcjZRZnBWOUd4TEwvejRKWlJo?=
 =?utf-8?B?TGRlY3RMVlpXSk9XMWVlVFNJUWtOWXpkblJ3aUFUNmZVMGpiYlh6RkNQaXdC?=
 =?utf-8?B?ZHJYV2twRVlRcDdTa1BZMmhEcFJ4NlAxbVo5Q0FDWmZYVHVmSjdYaUtrcTRQ?=
 =?utf-8?B?U2NGekg4WCswTktoYTdib3cwRG5yVG5sc1RWNnBPN2hQOURtbVpyZFFhWTFP?=
 =?utf-8?B?ajBsN2FtSm1zK1lsQ2ZEMzI2V29IKzlQdkNMR2dYNTJTWGIxeUlNZ0J4amQv?=
 =?utf-8?B?MWplS2tZY29Kb1YvSnh6S0ZZQ1NiaXExSW1wcm9mNFhqUnRNcUJTODlXR0xM?=
 =?utf-8?B?UXlZVm9pd29ER1h2WU1jcnU5VVNjU2FnWnU4YUdQUXhoK0M3bCtuY0dnS2hj?=
 =?utf-8?B?Ni9rZk15RlU4bUI3NmQyVHhaUFVTTDB6dEkwemdYMW5RUmVKRzdlaGZGcDY4?=
 =?utf-8?B?bjJuSks1T1Ewbm4wdDFnS3pZZlFGL1ZnWU5zNTB1RVBqeUxHbXpmV1lnRzlq?=
 =?utf-8?B?ZU5nbjkrUDhzSUsxMHBJUnFUTFN4QzYwclNQdEhwNVk0Q0pONHVmc0Rnd2JZ?=
 =?utf-8?B?Unk5V1Z5WStXeHBuNjVsMERneng3V3VyU1h3QUxMVGJmQnRHRloxa1pMOHlI?=
 =?utf-8?B?L2tqbmV4aUhjL2dhUkpKNkVlWEdqS2ZubHB2aGFpSlVzU3JYVGcxallTallK?=
 =?utf-8?B?cWZOWEwvWERoQnBQck8zVXNLUGhXeHFLVVVYUndzKzdqWkx5UUJLc09ydjhG?=
 =?utf-8?B?bUpoOStFb0pQVEllNHlsVWoveCtpTWxUWHBORFZndHgySVNOdnlXWTBOK0dX?=
 =?utf-8?B?NVd6VDdnQmhTTWZlcEVaRlFOSC9SVnhVMVdTTWpSVnZBeW5KRy8xa0k2eVZs?=
 =?utf-8?B?eGpxM3Z4dWRtQUdFTU9OUTVZbUdsSGwvNEN0a1pPcXpqdllzMU5IMnN5dkpG?=
 =?utf-8?B?eGF2YlYwWnh1aDhqZm5VcUJwN2xEL3czSkk1VXNPUm1kZHM1bFFCQTh3cHl4?=
 =?utf-8?B?bm1vTGVZb2JRenpHaWQ4cllNQTFhbnVRRFV0S2h2NVBSVzR1VXM1VnJ5a1B6?=
 =?utf-8?B?Ujh2dy9FWTA2NGFvc1JoaG56Q1FCV216anVvV3pzM3l3eDFrQ3NyeC8wV3lF?=
 =?utf-8?B?c09sd1I3cmFDMnVEbkk1ZnEydTd6b1dPaSsrNjlPM1FRdlBvbXIwc250eEtT?=
 =?utf-8?B?TmhlTTBobGVLWWhXUHo1a0xHeXJYWFBJcUg4cW85elF3YURXMGlzcHFWNzdm?=
 =?utf-8?B?TmFybExzb0JwZzBWcWgzblZnaHN0TXlZMFgvdjh0TjloeERGN3hXdHB2OGhv?=
 =?utf-8?B?T0RaanVzMVkwZWFiRHFkeFAyY0M1SEFZaHFUUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(19092799006)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEdramxTSXFnVC9McGRRaTdoREtBN2hOMWgyZ095VG9mazEyMFRwQWFQRWl0?=
 =?utf-8?B?allTd0RoTnNGU05NQ3Y4Wk1UNTJZT2RVSWEvYUpiT1VkRGFNaHJrNjR6ZnhO?=
 =?utf-8?B?TDhPa2xXMVNLY3lYZVNFc1NJUmlVdTFSU3NqVkJqUDRkNXBOVHlnZ0phbi9z?=
 =?utf-8?B?c2gzUHhnOFljQzlRL3FCQzRrTWhCY1ozcnZpb0dDTkJIK3lWZ0lxY0RPWEZk?=
 =?utf-8?B?N051Y0R2SGtCUGdwMXVGMlQ4YjRXcFoyOGphWktibVovOCtmanlnbVgvZWFO?=
 =?utf-8?B?ck9KZTNUQnRENjhoR3d3dTZlVy9zSjA5WDJwNW1BaE9BSXdKVEppZ3R3UU1o?=
 =?utf-8?B?QS9xUERIRE4yMzNDbzdEdE9BbHBRNUNKUVAra0pOaDFPaE95ZThlN2pxZUIy?=
 =?utf-8?B?dHBzMTV2LzdOY2dGSDhOWm1sbkQ4dzZBb0ZMcXl6Rms2M1ZKM2FnT0o1Y0ht?=
 =?utf-8?B?dENoeWxJbWlBeVZFSERiQUkzTUpESDladmZSVHNOSnR4cnlzQklYM3hFRXd1?=
 =?utf-8?B?NHdlRE9PQ3lZZmtBOUs5dnVaVVBHOUJyb0JPQXN1cStrTUZicW1ORVFQb0Iw?=
 =?utf-8?B?alVnMW9Hcmg2SS8wc1pEbHRHNkk0UHBTT1RQYUpmaVVrUjFSdC9RTmhzMHYz?=
 =?utf-8?B?eVhaQWhkeGhKMmUzZ3R1RjlzT2ZQVVhtZm5aQWg1QkpoZ1B4RURPMlBoZ1FF?=
 =?utf-8?B?T0JhZG82MlBJNzRjVmgyemtYVUNUVGpodVRtL01NSGkvZEcxanhLcGZUb0d6?=
 =?utf-8?B?dE1WM202Wi80YWpUdGhueng0cXNWNlNHQ1NtYUNjUFRWSm1wY2QvOVFxMi82?=
 =?utf-8?B?cDlFeGF0WjUxTzRsWEtLTTlWYmJXUFlmR1lRQ0xGNEFCMWZSazA2TnZjT0t6?=
 =?utf-8?B?Mjg1bkZ3QzdjVkdwTjBHOHZUeVI3Njl6Vm5OeEduMWJ5b1VMdnFhTk5WdnYy?=
 =?utf-8?B?dFVTU3Q1WVdqRGF3aW5nWmpRazl1VmlMNUlORmd3bkZUaWZOYURKcGQ1d3RP?=
 =?utf-8?B?cEJkbVAySTZtMjVBeDdkbHAwZ1l0aEJOajVxeFJMUUVmSUpUR3ZNVEF2OFFJ?=
 =?utf-8?B?aXV2eUw0TFFEajlqejhvSDFITGFVdHk0ano3WTVESE1FSXVMM28zRE8wQUVL?=
 =?utf-8?B?dExpcEgzYk9jQmMvbW5jb0xvK3NVZko3dU9IVkIzZjF1eUlwREJ1MEtPTlhU?=
 =?utf-8?B?TFVUdmtRYXcyUmwzRDVxdkxJRkszYWpmZkdZZ0l4VFB5TE8ranRuRjF6Nlo3?=
 =?utf-8?B?enh6UTlwblFLeU9oMS9CS3kvcHhJNEhGemgyQXNIcnlIMXhFQktwSE1YL2RH?=
 =?utf-8?B?VTNqZ0NkOTJaa0RmNi9tL0pha2l4dXFKQXdNbytmL1JlWE9ySlFTUEdEaUsz?=
 =?utf-8?B?eVM1UWxHejZQMXcvRDI0S2w0eEJZUWtkb0NiVXZCNGlrdDRqdGFDdkNhSzZ5?=
 =?utf-8?B?TkNHRGI0VDhIVUVnNi8vc0dSUVR1MkhrVVhBNWZ0OUt5b2F5Qk5LUGJsS3Fi?=
 =?utf-8?B?dGJpZ3k0aXp0SEl0bjRzNnk3L0FjQ0JWOWdFRGtYcFVDeW45aW5jbkNpQytL?=
 =?utf-8?B?UUNXM2pGMGZNOEhBbDN5SktRbk11d1lidWJCbmNERmMvV2NMeUUySzRaOVlX?=
 =?utf-8?B?WDlVNzVkMzc0R2dBT0hGekFEenpjV3BVbXlVdmR3Smo2ckViS1lxQjRBWEdt?=
 =?utf-8?B?MEdKN1V4Z2V2WjVCQWRMZElPSkdMbUdwdTdFUS9rMElCVFlicWlaRXlISktm?=
 =?utf-8?B?MmsxY3BHQmtsOXNDdThmS05BekhrV1l5UHJNU1FNeTdIcFVIdGFqUzl4cWU5?=
 =?utf-8?B?SzlNcndjcjJsWGgvVWRHMW1VS1VqeU9VaThXbG01ZC9JTThQK216OU53eitN?=
 =?utf-8?B?Unp0VEJkOWpkc3Fac0d1WUZmWGtWTDVUYjZ0WXA5K0FlMkllRlZCK3dJaHpr?=
 =?utf-8?B?aFZNTkxRTlg0R3BEV1dKbXViMFZuOEVBTlRXdS9ZQnBDNlZxRFNUTXc4NlBv?=
 =?utf-8?B?dkVTTUhCeHpUNmFnWFFGK3ZEdG9tTnFybnFkTlpNbzArQ2ZPM3RhYkpVUVRx?=
 =?utf-8?B?MnhrdHpJdHRlaFp4c00vUldxL3VjUUFPVTg0bTlIdU9wQURiZ2NvVWdJTGIr?=
 =?utf-8?Q?IxcISB2zlKyJB8NfRGO+8BMJd?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8811cd67-841b-4815-9403-08de32d3a89c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 01:22:58.7286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A1izKkialTGsuzO5qubEvLYiXg4OTq3AWP+RQaORsJLahILAIYAjuDa7rRmT14Wx5GMQgwLYqVn3+pg+wcErkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10994
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_172303_544146_5D927037 
X-CRM114-Status: GOOD (  34.63  )
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

T24gVGh1LCBEZWMgMDQsIDIwMjUgYXQgMTA6NDc6NTdBTSArMTAzMCwgQW5kcmV3IEplZmZlcnkg
d3JvdGU6Cj4gSGkgRnJhbmssCj4KPiBPbiBUaHUsIDIwMjUtMTEtMDYgYXQgMTI6MzYgLTA1MDAs
IEZyYW5rIExpIHdyb3RlOgo+ID4gUmVuYW1lIHN0cnVjdCBpM2NfcHJpdl94ZmVyIHRvIHN0cnVj
dCBpM2NfeGZlciwgc2luY2UgcHJpdmF0ZSB4ZmVyIGluIHRoZQo+ID4gSTNDIHNwZWMgcmVmZXJz
IG9ubHkgdG8gU0RSIHRyYW5zZmVycy4gUmVmOiBpM2Mgc3BlYyB2ZXIxLjIsIHNlY3Rpb24gMywK
PiA+IFRlY2huaWNhbCBPdmVydmlldy4KPiA+Cj4gPiBpM2NfeGZlciB3aWxsIGJlIHVzZWQgZm9y
IGJvdGggU0RSIGFuZCBIRFIuCj4gPgo+ID4gUmVuYW1lIGVudW0gaTNjX2hkcl9tb2RlIHRvIGkz
Y194ZmVyX21vZGUuIFByZXZpb3VzIGRlZmluaXRpb24gbmVlZCBtYXRjaAo+ID4gQ0NDIEdFVF9D
QVAxIGJpdCBwb3NpdGlvbi4gVXNlIDMxIGFzIFNEUiB0cmFuc2ZlciBtb2RlLgo+ID4KPiA+IEFk
ZCBpM2NfZGV2aWNlX2RvX3hmZXJzKCkgd2l0aCBhbiB4ZmVyIG1vZGUgYXJndW1lbnQsIHdoaWxl
IGtlZXBpbmcKPiA+IGkzY19kZXZpY2VfZG9fcHJpdl94ZmVycygpIGFzIGEgd3JhcHBlciB0aGF0
IGNhbGxzIGkzY19kZXZpY2VfZG9feGZlcnMoKQo+ID4gd2l0aCBJM0NfU0RSIGZvciBiYWNrd2Fy
ZCBjb21wYXRpYmlsaXR5Lgo+ID4KPiA+IEludHJvZHVjZSBhICdjbWQnIGZpZWxkIGluIHN0cnVj
dCBpM2NfeGZlciBhcyBhbiBhbm9ueW1vdXMgdW5pb24gd2l0aAo+ID4gJ3JudycsIHNpbmNlIEhE
UiBtb2RlIHVzZXMgcmVhZC93cml0ZSBjb21tYW5kcyBpbnN0ZWFkIG9mIHRoZSBTRFIgYWRkcmVz
cwo+ID4gYml0Lgo+ID4KPiA+IEFkZCAuaTNjX3hmZXJzKCkgY2FsbGJhY2sgZm9yIG1hc3RlciBj
b250cm9sbGVycy4gSWYgbm90IGltcGxlbWVudGVkLCBmYWxsCj4gPiBiYWNrIHRvIFNEUiB3aXRo
IC5wcml2X3hmZXJzKCkuIFRoZSAucHJpdl94ZmVycygpIEFQSSBjYW4gYmUgcmVtb3ZlZCBvbmNl
Cj4gPiBhbGwgY29udHJvbGxlcnMgc3dpdGNoIHRvIC5pM2NfeGZlcnMoKS4KPiA+Cj4gPiBBZGQg
J21vZGVfbWFzaycgYml0bWFzayB0byBhZHZlcnRpc2UgY29udHJvbGxlciBjYXBhYmlsaXR5Lgo+
ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEZyYW5rIExpIDxGcmFuay5MaUBueHAuY29tPgo+ID4gLS0t
Cj4gPiBXaHkgbm90IGFkZCBoZHIgbW9kZSBpbiBzdHJ1Y3QgaTNjX3ByaXZfeGZlciBiZWNhdXNl
IG1vZGUgY2FuJ3QgYmUgbWl4ZWQgaW4KPiA+IG9uZSBpM2MgdHJhbnNmZXIuIGZvciBleGFtcGxl
LCBjYW4ndCBzZW5kIGEgSERSIGZvbGxvdyBvbmUgU0RSIGJldHdlZW4KPiA+IFNUQVJUIGFuZCBT
VE9QLgo+ID4KPiA+IGkzY19wcml2X3hmZXIgc2hvdWxkIGJlIHRyZWF0IGFzIHdob2xlIGkzYyB0
cmFuc2FjdGlvbnMuIElmIHVzZXIgd2FudCBzZW5kCj4gPiBIRFIgZm9sbG93IFNEUiwgc2hvdWxk
IGJlIGNhbGwgaTNjX2RldmljZV9kb19wcml2X3hmZXJzX21vZGUoKSB0d2ljZSwKPiA+IGluc3Rl
YWQgcHV0IGludG8gYSBiaWcgaTNjX3ByaXZfeGZlcltuXS4KPiA+Cj4gPiBjaGFuZ2UgaW4gdjkK
PiA+IC0gZml4IHR5cG8gRGVwcmVjYXRlZAo+ID4gLSByZW1vdmUgcmVkdW50YW50IG1hc3Rlci0+
b3BzLT5wcml2X3hmZXJzIGNoZWNrLgo+ID4KPiA+IGNoYW5nZSBpbiB2OAo+ID4gLSBuZXcgQVBJ
IHVzZSBpM2NfeGZlciBpbnN0ZWFkIG9mIGkzY19wcml2X3hmZXIuCj4gPgo+ID4gY2hhbmdlIGlu
IHY3Cj4gPiAtIGV4cGxpY2l0IHNldCBlbnVtIEkzQ19IRFJfKiB0byB2YWx1ZSwgd2hpY2ggc3Bl
YyByZXF1aXJlZC4KPiA+IC0gYWRkIGNvbW1lbnRzIGFib3V0IGNoZWNrIHByaXZfeGZlcnMgYW5k
IGkzY194ZmVycwo+ID4KPiA+IGNoYW5nZSBpbiB2NS12Ngo+ID4gLSBub25lCj4gPgo+ID4gY2hh
bmdlIGluIHY0Cj4gPiAtIFJlbmFtZSBlbnVtIGkzY19oZHJfbW9kZSB0byBpM2NfeGZlcl9tb2Rl
Lgo+ID4KPiA+IGNoYW5nZSBpbiB2Mwo+ID4gLSBBZGQgRGVwcmVjYXRlZCBjb21tZW50IGZvciBw
cml2X3hmZXJzLgo+ID4KPiA+IGNoYW5nZSBpbiB2Mgo+ID4gLSBkb24ndCB1c2UgJ3ByaXZfJyBz
aW5jZSBpdCBpcyByZWZlciB0byBzZHIgbW9kZSB0cmFuc2ZlciBpbiBzcGVjLgo+ID4gLSBhZGQg
J21vZGVfbWFzaycgaW5kaWNhdGUgY29udHJvbGxlcidzIGNhcGliaWxpdHkuCj4gPiAtIGFkZCBo
ZWxwZXIgZnVuY3Rpb24gdG8gY2hlY2sgbWFzdGVyJ3Mgc3VwcG9ydGVkIHRyYW5zZmVyIG1vZGUu
Cj4gPiAtLS0KPiA+IMKgZHJpdmVycy9pM2MvZGV2aWNlLmPCoMKgwqDCoMKgwqAgfCAyNyArKysr
KysrKysrKysrKysrKysrKy0tLS0tLS0KPiA+IMKgZHJpdmVycy9pM2MvaW50ZXJuYWxzLmjCoMKg
wqAgfMKgIDYgKysrLS0tCj4gPiDCoGRyaXZlcnMvaTNjL21hc3Rlci5jwqDCoMKgwqDCoMKgIHwg
MTkgKysrKysrKysrKysrKystLS0tLQo+ID4gwqBpbmNsdWRlL2xpbnV4L2kzYy9kZXZpY2UuaCB8
IDQwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0KPiA+IMKgaW5jbHVk
ZS9saW51eC9pM2MvbWFzdGVyLmggfMKgIDQgKysrKwo+ID4gwqA1IGZpbGVzIGNoYW5nZWQsIDcw
IGluc2VydGlvbnMoKyksIDI2IGRlbGV0aW9ucygtKQo+ID4KPgo+ICpzbmlwKgo+Cj4gPiDCoAo+
ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvaTNjL2RldmljZS5oIGIvaW5jbHVkZS9saW51
eC9pM2MvZGV2aWNlLmgKPiA+IGluZGV4IDdmMTM2ZGU0YjczZWY4MzlmYjRhMTgzN2E4N2IxYWVi
YmRkYmZlOTMuLjdmNzczODA0MWYzODA5ZTUzODgxNmU5NGY5MGI5OWU1OGViODA2ZjkgMTAwNjQ0
Cj4gPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2kzYy9kZXZpY2UuaAo+ID4gKysrIGIvaW5jbHVkZS9s
aW51eC9pM2MvZGV2aWNlLmgKPiA+IEBAIC0zOSwyMCArMzksMjUgQEAgZW51bSBpM2NfZXJyb3Jf
Y29kZSB7Cj4gPiDCoH07Cj4gPiDCoAo+ID4gwqAvKioKPiA+IC0gKiBlbnVtIGkzY19oZHJfbW9k
ZSAtIEhEUiBtb2RlIGlkcwo+ID4gKyAqIGVudW0gaTNjX3hmZXJfbW9kZSAtIEkzQyB4ZmVyIG1v
ZGUgaWRzCj4gPiDCoCAqIEBJM0NfSERSX0REUjogRERSIG1vZGUKPiA+IMKgICogQEkzQ19IRFJf
VFNQOiBUU1AgbW9kZQo+ID4gwqAgKiBASTNDX0hEUl9UU0w6IFRTTCBtb2RlCj4gPiArICogQEkz
Q19TRFI6IFNEUiBtb2RlIChOT1QgSERSIG1vZGUpCj4gPiDCoCAqLwo+ID4gLWVudW0gaTNjX2hk
cl9tb2RlIHsKPiA+IC0JSTNDX0hEUl9ERFIsCj4gPiAtCUkzQ19IRFJfVFNQLAo+ID4gLQlJM0Nf
SERSX1RTTCwKPiA+ICtlbnVtIGkzY194ZmVyX21vZGUgewo+ID4gKwkvKiBUaGUgYmVsb3cgMyB2
YWx1ZSAoSTNDX0hEUiopIG11c3QgbWF0Y2ggR0VUQ0FQMSBCeXRlIGJpdCBwb3NpdGlvbiAqLwo+
ID4gKwlJM0NfSERSX0REUiA9IDAsCj4gPiArCUkzQ19IRFJfVFNQID0gMSwKPiA+ICsJSTNDX0hE
Ul9UU0wgPSAyLAo+ID4gKwkvKiBVc2UgZm9yIGRlZmF1bHQgU0RSIHRyYW5zZmVyIG1vZGUgKi8K
PiA+ICsJSTNDX1NEUiA9IDB4MzEsCj4KPiAweDMxIGlzIDQ5IC0gaXMgdGhhdCByZWFsbHkgd2hh
dCB5b3UgaW50ZW5kIGhlcmU/IEZvciBpbnN0YW5jZSwKPiBidWlsZGluZyB0aGlzIHBhdGNoIGZv
ciBBUk0zMiBwcm9kdWNlczoKPgo+ICAgIEluIGZpbGUgaW5jbHVkZWQgZnJvbSAuLi9pbmNsdWRl
L2xpbnV4L2JpdHMuaDo1LAo+ICAgICAgICAgICAgICAgICAgICAgZnJvbSAuLi9pbmNsdWRlL2xp
bnV4L3JhdGVsaW1pdF90eXBlcy5oOjUsCj4gICAgICAgICAgICAgICAgICAgICBmcm9tIC4uL2lu
Y2x1ZGUvbGludXgvcHJpbnRrLmg6OSwKPiAgICAgICAgICAgICAgICAgICAgIGZyb20gLi4vaW5j
bHVkZS9hc20tZ2VuZXJpYy9idWcuaDozMSwKPiAgICAgICAgICAgICAgICAgICAgIGZyb20gLi4v
YXJjaC9hcm0vaW5jbHVkZS9hc20vYnVnLmg6NjAsCj4gICAgICAgICAgICAgICAgICAgICBmcm9t
IC4uL2luY2x1ZGUvbGludXgvYnVnLmg6NSwKPiAgICAgICAgICAgICAgICAgICAgIGZyb20gLi4v
ZHJpdmVycy9pM2MvZGV2aWNlLmM6OToKPiAgICAuLi9kcml2ZXJzL2kzYy9kZXZpY2UuYzogSW4g
ZnVuY3Rpb24g4oCYaTNjX2RldmljZV9nZXRfc3VwcG9ydGVkX3hmZXJfbW9kZeKAmToKPiAgICAu
Li9pbmNsdWRlL3Zkc28vYml0cy5oOjc6NDA6IHdhcm5pbmc6IGxlZnQgc2hpZnQgY291bnQgPj0g
d2lkdGggb2YgdHlwZSBbLVdzaGlmdC1jb3VudC1vdmVyZmxvd10KPiAgICAgICAgNyB8ICNkZWZp
bmUgQklUKG5yKSAgICAgICAgICAgICAgICAgKFVMKDEpIDw8IChucikpCj4gICAgICAgICAgfCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefgo+ICAgIC4uL2RyaXZlcnMv
aTNjL2RldmljZS5jOjI3Mjo2ODogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmEJJVOKA
mQo+ICAgICAgMjcyIHwgICAgICAgICByZXR1cm4gaTNjX2Rldl9nZXRfbWFzdGVyKGRldi0+ZGVz
YyktPnRoaXMtPmluZm8uaGRyX2NhcCB8IEJJVChJM0NfU0RSKTsKPiAgICAgICAgICB8ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBefn4KPgo+IFNob3VsZCB0aGlzIGJlIGRlY2ltYWwgMzEsIHJhdGhlciB0aGFuIGhleCAz
MT8KClllcywgZml4ZWQgcGF0Y2gKCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWkzYy9h
UzhZS2ZoUEF4dnBqNnh5QGxpemhpLVByZWNpc2lvbi1Ub3dlci01ODEwL1QvI203MzY3ZTg4NDVj
MzFiOTI0NjcyNDQ1ZGNmNjM5ZWVhMzkxMTJhYWMwCgpGcmFuawoKPgo+IEFuZHJldwo+Cj4gLS0K
PiBsaW51eC1pM2MgbWFpbGluZyBsaXN0Cj4gbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcK
PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwoK
LS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
