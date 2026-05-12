Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E4BCD4F21
	for <linux-i3c@archiver.kernel.org>; Tue, 12 May 2026 12:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:CC:
	To:From:Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fqvIrSyXGh72o09myPJ/YbZB5kQ3t6OWE/oC6M0MfjM=; b=uI8pjinFz1WxKe
	/B22aJ2GTI/ByXYDC9f6ZxW4SYupWbgxlUf3nqhzi0pXbRifkUrzofK7NhWdWZl5f30BlyYFwpt5U
	nVBoir7X7Qqgdghi/QiMeLy3g7RFShLIeJyauPqjJyh6M8H8L5bHmRh69ncSO16Jk9ETsdb5v4u2f
	Tsa0GrWFgkBliZgSDN1POvKLC0hRysRv2zZPy4sAjSRQg2JPQL/yiidQT1ia799VMlIhzNLNn7eEj
	A0Er5ZdWm6N+WlLWHm+/2QQmGKaWEZRA2EfsiUyyXTQ0WZk3ZsF6r8WZVCTPVHNBR3Ai2erVcugXS
	FjVjv5Y6jDw6NXVhAtGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMmKh-0000000GgNB-32Au;
	Tue, 12 May 2026 12:35:32 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMmKf-0000000GgMZ-0QI0
	for linux-i3c@lists.infradead.org;
	Tue, 12 May 2026 12:35:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778589329; x=1810125329;
  h=message-id:date:subject:from:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ub7580m6mKnWJMDxGkI9Da4uk8RHPCshEeH0w29jCuk=;
  b=RYefMr8n6br2fy9WJtLqGb4QYNxcZ5Is56udVd6Mt3fz83xu6TpwNA5b
   /BMBxN467zarw+KYOeYSh1kiz8sFaE7EI+/XkcZUnd+ZSygBvo3G8deKV
   6ZISd9AU3RgXBOaIF9XuSik6aIlRAfrlOtiSv0XFQR4V1hNHzEM+mLN2B
   XztWuGGHnSVpeqNLzTSCEYgq9R4irtwXmFhXKfXVyb+dmhNUndt5cay2L
   KTmraW3NPyp/yfJX+2U4u9+rlHJzAp0nA3bEPMwkinXZOTChv3bjKN3yg
   zxKjNtcA1rpug+0SZ9zKe7jiRSA/CTo4/vaP6jyD/q3Vdfb7cRSuUm8rh
   g==;
X-CSE-ConnectionGUID: RHDP6FPySoO3Er8dXYzJzg==
X-CSE-MsgGUID: dS/4v+lhSkGTk/QqBuN73g==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="78642672"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="78642672"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 05:35:26 -0700
X-CSE-ConnectionGUID: b4t5N+X8TaCqmcT6zV/A/g==
X-CSE-MsgGUID: tYBMqWAsQyyRZ8ARWY9Qug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="242726858"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 05:35:26 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 12 May 2026 05:35:26 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 12 May 2026 05:35:26 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.63)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 12 May 2026 05:35:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UXjd875bexWO9r5OAeXfq0vJSU0N4AjsBZ93UbFYabbJ6OBPzKBGzXdDMRipszHJgIrJ9aEBYm39lmdLAT7fNKuZjnO4z4MRkdFuuMRbNhxh4xNxV7iftyoRseb/r0+hMLtj/P/9P8gWrtZY2Zhtgj+KI4TweU/cUMjKKBFf07abEW5hg80LAr0tY4JCyKmcLRxR0+tvsbND7BVlXfXw8i5llmN/xJ087eNJ6NwTAd408XNVobKvQGnSNu+asLCTTHxhK7TMBRbMS2VJOuqY5ieEBFodMdGJ+sdubQokw37xYqprME65Uh3dulDdiyn20fEywybKSxUx48c8xYNIZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ckBxmFj3Qj0gmMuUnDskjxIt51cbwrieIxOj6Zje3ng=;
 b=FP6QWJLAWDTddr+KQ81JetiQ3PmAtw5+XRL9ToI+fB2CLYW3QgVAiakUYPI9ylFk59GZYBEvB0PvfZAJvN4ma3Wyx2rKL1zDOHLiqxdsIFHZS/o5frdNJfqLicJ3NljkESw2lRUvSdgBCKU1ESeM6cFoVKN2Lkla+mtAE9TymLrySQrWnM8d/+yZ79SmimyKWR76wTZnitRL+fWvNwTbmuByrf18L0qjq38oBem2oG8hH9DzCIhylmvWKsOLG4o3lejCgxZmi1mdA8un/gFmdEWeec206609Yw9Y5k4abOgFewdb8Bsk3eSpt5af8rA5t71SV9I/ZMrE8AgsWKuqXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 12:35:22 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 12:35:22 +0000
Message-ID: <d803f8da-edaf-458f-a059-8df3ffe1316f@intel.com>
Date: Tue, 12 May 2026 15:35:18 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 00/16] i3c: mipi-i3c-hci: DMA abort, recovery and
 related improvements
From: Adrian Hunter <adrian.hunter@intel.com>
To: <alexandre.belloni@bootlin.com>
CC: <Frank.Li@nxp.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20260504113352.38490-1-adrian.hunter@intel.com>
Content-Language: en-US
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20260504113352.38490-1-adrian.hunter@intel.com>
X-ClientProxiedBy: DU7P190CA0026.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:10:550::10) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|PH7PR11MB7593:EE_
X-MS-Office365-Filtering-Correlation-Id: 39d8e352-f674-45dc-47c8-08deb022ef21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003|3023799003|11063799003;
X-Microsoft-Antispam-Message-Info: txAjNhEsT17cbfiL1ZDwUUS//AVncC7SJLxlTLQ/s2T1I+tBg+wLjfvuW4PE1LN1epY73tgHQpyKCW0ROg3yMNIRv56Mz5MyGDaDh4vKm2/gzzd2HqHQisQKRF3Z7olsVwqa1U27DUXAWc3erOl97UYyS/0d/m1lPjP5/FXBpGjfzAPM771pcQ+mbqH/Orm1uGSj5pEeg32RZkf5W81zdYtsJpKsPh+zQY3fpeeJgjk9DC4HxUm46vXLwFv+UMaWksd94gO+yWtVPDkcfZ3cGo5mRh/oPbXTJcNGBLWK1P/QzICC+U23ogEH0VBs/VW1msnuEewR76gr//C8rh2CZw5AbxH0NeOABkNVqAANddBxOFSR+Wtq5Mja1GF9/fL5/SI9Ty92ILC9QxpHD3GX+r6eCJxNx9F8HWt8VILg31Baq7oycrhmuANzpCwp7c6UuY3Uu4x5SlPS4LyUjpoGowr5M4N1l85n75Dbyp80leNam2jwzPqwNxfOYivVagBdw4UJc0XMXQfATUr+KdueDsTJGgEACWX1sqnefxAkoa5eigPKqNwFX0dUr6kplnBsBUQSqP5y98HkIbA86UvhFesfy2B55Z3OQwfv0HaNdcPu1+FK2nOktiKi6z5+n2i83ln6+0kp83ET45aoDB+14Gx13vjRJ9+bO9JIrMswqvYUISf28XfJw2z7vZJdX2Uc
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003)(3023799003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHVrV3VObVJZVzFKWDZwby9kWEhGb0xySFg3NlBsdUIzMW9YTkdTVmNuMkZQ?=
 =?utf-8?B?VGNxQXVCU2hSdFJ0TG0rdU44Z0Q4Ymw4dGErcjNBaWFBbVc2M1hlMmlCd0FI?=
 =?utf-8?B?d2U5NTMwbWhlOGQwMVNoZlZRYlFIUkVBSTN1SCsyQ0pOMU80VE1qT21nT1ZX?=
 =?utf-8?B?b0l4d1ViL3kyaENuZTNSa2Z3RlA4Snh6RytITjJOY3lTd2U0T3hEdVdHZ3Jo?=
 =?utf-8?B?RmtUSXcyOGNieWt6OEpoZldQaU9tTW9EYk82MlZxUjVreFhSZnBqWTZHcGJY?=
 =?utf-8?B?aWlZK3pCTEZaRFc0ZEJwTXRKNHdTUTJxVmx6STF5alhFdXNkT0pWT29kYmRj?=
 =?utf-8?B?UWZ5UFhzZ1c5M2o4NnNtVFRVM05kTXVKTUp3K3h0dDVWRDZCRitsTENEL2h0?=
 =?utf-8?B?YThRVzN6czJ3MnMxTFhtZDNTMkZydlRXVHA2MFZEYzdCM1dMYnJMem14cGJW?=
 =?utf-8?B?L3FuOEFQYzk4QnVJWmV1QUpjVnNzYmtqYnVjUU5xMlN3YkRyZmdXQlY5aTBC?=
 =?utf-8?B?UHM0azZOQXFPanlCVDd3azdCN0x0WnpkQ1VueEhpbmduVzI4S0RYb2RIbUs4?=
 =?utf-8?B?c3BmM2FnMWQwRS84ay8yTm9RUS80eG40c0Y2bTJhaC9BdkdENWVISTdYRUtY?=
 =?utf-8?B?dWoyYWJUN043WkZWUU1MckZYeDVGTXZ2bUE1T0xDM2h1Z21KQnU1ZWU5eGRr?=
 =?utf-8?B?aUtwaFFoQzJXYXBaZkFsOFJiVzRidWRxMUYwd1dBeHZWNHBlaXJwVm1tcFNK?=
 =?utf-8?B?aWJzaVRMOXRNN2tDZ1J3S2wyMFNETHJoK0pFVmhxd3N1bzl6SzNTcTJ6Qzgv?=
 =?utf-8?B?QW1BNzE2Vk1reHc0VmxPRFRENjBpMngwaWpLUDZOVW50Yk00WnRvYjh1b1NR?=
 =?utf-8?B?THVZY0Vld1lkODUvVW1EdThNM09HOU9RRVRiK2tTQ0FIeWtGWnJOYkZhY2tt?=
 =?utf-8?B?RTQ4bk5yclgvR05NK2drcjhPTDFKUVA2NmNhZkdJYUtBZXBTY1RYWEpYTGVO?=
 =?utf-8?B?WTR2N2paL3lIOXlBY3E5U3dTSWRRb0ViazROM3BNc3hxRXZvbFYvNkdQUE9J?=
 =?utf-8?B?c25Eamx3TDNYejUwSm05N0JWa21vQWFxMXVNMUdLVGhlamc2S1V5MDJyTWYz?=
 =?utf-8?B?bkdYOWE0d0QrRzExeTJoYnF0Y0RzS1J2UzQvTkJNOVdMK3d0Mnhtd1hRMmtk?=
 =?utf-8?B?cDNveThpUEFaeE1JN0VUaUFFRnV2TWpLdFpqWDF5dDRjTlVwNDhzcjBBZG8x?=
 =?utf-8?B?dzhEbHh2UWNaY0ZUWjlmR2hSQWEvbjVxNDFCTzdpbG5ibzZUOHhBUi9nOUxj?=
 =?utf-8?B?U3RKNGpWQ09pVExkWnpZQ2Jkb2pqcGFua2Y0T0lwMUlHVUc2QjZxdm1hVzc0?=
 =?utf-8?B?NUFUdGFIUkd4Nyt1UVJER1hiL1hqMjI3QVJaaHpQSzBONnNVa0ZvNEluT0dN?=
 =?utf-8?B?QmFzeFZqdEVtZXUyZXZEWFZLbkN1aXRBZUt5ZDBWOHpNMiszQjFwTU9ZM1E2?=
 =?utf-8?B?WGcycnhDVmpZNHVLeHBoNFFhQjNmLzE3Z0xxOWtIbUFTUVljYVo3NUV4YW53?=
 =?utf-8?B?MEcvRXJvQTltTEpwOS9TZ0l6WUhzVDFEVG4yaEtpdlJYbDh3dUpSaEJtOXpY?=
 =?utf-8?B?V29LTFhzL3Z4a1kvS0NFb1Byc3Z1Y1ExSGc0S0s1ekJaYisxazl1Rlh1NVlR?=
 =?utf-8?B?blhPQUtIQjlzaXkzZUFXQVRlTUl0RUpkU1diOW50azZjbUdlQVQyR1A5SlF6?=
 =?utf-8?B?aG9WN1VzbDU4eld5NGlMK0Ixd0VubTJzbHgyTlZlcS9uSzhZTVhORnpKbWN1?=
 =?utf-8?B?UzZ6UytzclZ5cC9MK3VUWlg4WU1XT3Zubkd5UXlTNmZVSFlFU1BEZnlTU3Jy?=
 =?utf-8?B?WHZhQTBjeTFOMEo4YU9mbTUvVlVFUU5KQXhUSGVEbnNWR1FMcDd6YmlZc1pH?=
 =?utf-8?B?bFM0dCsxaUc1YXpkNytERFZEOE1ueGsrTTNmSi9RRTkvSDJONTdjeUkyM1NN?=
 =?utf-8?B?NkJxT3VRSFBCRDhGSlRKUkpWTHA1SlVZdC91aXV3QTN2V3dUZTAvcVFhU29L?=
 =?utf-8?B?NGVEMmV3T21jcTQ4Q2M3MXNESDJwOXlEZTk4OGFtcm56S1JQUVk2cGluOWhy?=
 =?utf-8?B?ZncyUVNwRStVTHBMY3YrekxjbzI4MlQvbU1yWDdoMVgwbTJ4NVQ2YjhpZUN3?=
 =?utf-8?B?Q1BCRGxvT0VwRDZRYTdEaGpzUDhKR2hiazFJM3RKY3BjVjFjNE1kM1JhTlJN?=
 =?utf-8?B?alI1eUdhUVVDU0hiakFWMWxaT0FrUHB4Q2ZTMGEvalhVZyttZ2U1eGlweCtG?=
 =?utf-8?B?NkdTWkIwbFE3dks4cGY5Tzk4UkFTTkJpWWlxWllRYVJjZzJDUFR0Ylk5TWw1?=
 =?utf-8?Q?qW3FeGJrGE6VdQYc=3D?=
X-Exchange-RoutingPolicyChecked: NIBSpDtnnfnxwBqXAgRTRBtm4QKRKyWGdbVuPUXXRH51zigmgQwURHKExa6I3JdiBP49qY5VwojfFN2GPPVK2uDJS5/MH9E8l9mTAFi+ys+5DWRKD2D4/Jt4UsCWUc1ftSazVgCGgxI0D/T0gIg6smhJ7Ld9+I5CVTlAaVy7eBdj2/Tobq1rJMnQgIy8W5SAFHZUUTk2ypqTXYNo2snnq0o/fWyfoH0XwycjmTCuWJ7yw7yDllBxJ6oaFtzDoBLUGad30cFI6kxw90L93ySvA8i2RPo+tFAzY/s+0PDpV2KWM5mF4vM5DHno3mrC22VGc4GtFATMdn/mwmP3io6NCw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 39d8e352-f674-45dc-47c8-08deb022ef21
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 12:35:22.4258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sJJomY1HgUh5ySF6SB1RtcqBtKOXlWZmkYM9rL/o4iD0eECBgZGVNe66zGfah50/tjAbNVkZ5QOIY6tTDY1zxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7593
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_053529_239497_FC5F6D16 
X-CRM114-Status: GOOD (  22.39  )
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

On 04/05/2026 14:33, Adrian Hunter wrote:
> Hi
> 
> This series improves the robustness of the MIPI I3C HCI DMA mode driver,
> addressing issues observed during error handling and recovery.

Any comments on this?

> 
> Patch 1 ensures suspend always invokes io->suspend.
> 
> Patches 2-4 fix issues in the existing DMA abort path: preserving the RUN
> bit during abort per the MIPI specification, blocking enqueue during
> abort/error, and waiting for ring restart completion.
> 
> Patches 5-8 improve how partially completed transfer lists are handled
> during dequeue: moving hci_dma_xfer_done() earlier so completed
> responses are processed before NoOp replacement, completing transfer
> lists immediately on error rather than deferring, and detecting when an
> abort races with transfer completion to avoid restarting the wrong
> transfer list.
> 
> Patches 9-10 add Intel-specific quirks for DMA ring abort: a PIO queue
> reset after abort, and an HC_CONTROL ABORT before the ring-level abort.
> 
> Patch 11 factors out a reset-and-restore helper from the suspend path
> for reuse.
> 
> Patch 12 adds a full DMA recovery path for internal controller errors.
> When the hardware reports a TID mismatch or the ring becomes stuck, the
> driver now resets and restores the controller, terminating all in-flight
> transfers with an error status.
> 
> Patch 13 makes NoOp command handling observable: instead of discarding
> NoOp responses, the driver now waits for them to complete and triggers
> recovery if they fail.
> 
> Patch 14 adjusts transfer timeout accounting to start from when a
> transfer actually begins execution rather than when it was queued,
> preventing premature timeouts behind slow predecessors.
> 
> Patches 15-16 are minor optimizations: consolidating the DMA command and
> response ring into a single coherent allocation, and increasing the ring
> size to the maximum 255 entries to avoid ring-space exhaustion.
> 
> 
> Changes in V3:
> 
>   i3c: mipi-i3c-hci: Fix suspend behavior when bus disable falls back to software reset
>   i3c: mipi-i3c-hci: Preserve RUN bit when aborting DMA ring
> 	Add Frank's rev'd-by
> 
>   i3c: mipi-i3c-hci: Add DMA-mode recovery for internal controller errors
> 	When erroring out transfers, ensure the final transfer of a
> 	transfer list is processed last
> 
> 
> Changes in V2:
> 
>   i3c: mipi-i3c-hci: Fix suspend behavior when bus disable falls back to software reset
> 	Always return 0 from suspend callback
> 	Amend commit message
> 
>   i3c: mipi-i3c-hci: Preserve RUN bit when aborting DMA ring
> 	Improve commit message
> 
>   i3c: mipi-i3c-hci: Prevent DMA enqueue while ring is aborting or in error
> 	Improve commit message
> 
>   i3c: mipi-i3c-hci: Wait for DMA ring restart to complete
> 	None
> 
>   i3c: mipi-i3c-hci: Move hci_dma_xfer_done() definition
> 	Add Frank's Rev'd-by
> 
>   i3c: mipi-i3c-hci: Call hci_dma_xfer_done() from dequeue path
> 	Add Frank's Rev'd-by
> 
>   i3c: mipi-i3c-hci: Complete transfer lists immediately on error
> 	Rename completing_xfer to final_xfer
> 
>   i3c: mipi-i3c-hci: Avoid restarting DMA ring after aborting wrong transfer
> 	Rename completing_xfer to final_xfer
> 
>   i3c: mipi-i3c-hci: Add DMA ring abort/reset quirk for Intel controllers
> 	None
> 
>   i3c: mipi-i3c-hci: Add DMA ring abort quirk for Intel controllers
> 	None
> 
>   i3c: mipi-i3c-hci: Factor out reset-and-restore helper
> 	Drop redundant i3c_hci_sync_irq_inactive(hci)
> 	from i3c_hci_reset_and_restore() because it is called by
> 	hci->io->suspend() anyway
> 
>   i3c: mipi-i3c-hci: Add DMA-mode recovery for internal controller errors
> 	Rename completing_xfer to final_xfer
> 	Add hci_dma_xfer_done() before checking for an already complete
> 	transfer
> 	Improve commit message
> 
>   i3c: mipi-i3c-hci: Wait for NoOp commands to complete
> 	Rename completing_xfer to final_xfer
> 	Add missing reinit_completion()
> 
>   i3c: mipi-i3c-hci: Base timeouts on actual transfer start time
> 	Do not flag the next transfer as started when there is an error
> 	which halts the controller
> 	Instead flag it started at the end of hci_dma_dequeue_xfer()
> 	Use hci_start_xfer() in pio.c
> 
>   i3c: mipi-i3c-hci: Consolidate DMA ring allocation
> 	Check for failed allocation before assignments to avoid doing
> 	arithmetic with NULL pointers
> 
>   i3c: mipi-i3c-hci: Increase DMA transfer ring size to maximum
> 	None
> 
> 
> Adrian Hunter (16):
>   i3c: mipi-i3c-hci: Fix suspend behavior when bus disable falls back to software reset
>   i3c: mipi-i3c-hci: Preserve RUN bit when aborting DMA ring
>   i3c: mipi-i3c-hci: Prevent DMA enqueue while ring is aborting or in error
>   i3c: mipi-i3c-hci: Wait for DMA ring restart to complete
>   i3c: mipi-i3c-hci: Move hci_dma_xfer_done() definition
>   i3c: mipi-i3c-hci: Call hci_dma_xfer_done() from dequeue path
>   i3c: mipi-i3c-hci: Complete transfer lists immediately on error
>   i3c: mipi-i3c-hci: Avoid restarting DMA ring after aborting wrong transfer
>   i3c: mipi-i3c-hci: Add DMA ring abort/reset quirk for Intel controllers
>   i3c: mipi-i3c-hci: Add DMA ring abort quirk for Intel controllers
>   i3c: mipi-i3c-hci: Factor out reset-and-restore helper
>   i3c: mipi-i3c-hci: Add DMA-mode recovery for internal controller errors
>   i3c: mipi-i3c-hci: Wait for NoOp commands to complete
>   i3c: mipi-i3c-hci: Base timeouts on actual transfer start time
>   i3c: mipi-i3c-hci: Consolidate DMA ring allocation
>   i3c: mipi-i3c-hci: Increase DMA transfer ring size to maximum
> 
>  drivers/i3c/master/mipi-i3c-hci/cmd.h  |   6 +
>  drivers/i3c/master/mipi-i3c-hci/core.c |  82 ++++++--
>  drivers/i3c/master/mipi-i3c-hci/dma.c  | 344 +++++++++++++++++++++++++--------
>  drivers/i3c/master/mipi-i3c-hci/hci.h  |  22 +++
>  drivers/i3c/master/mipi-i3c-hci/pio.c  |   1 +
>  5 files changed, 365 insertions(+), 90 deletions(-)
> 
> 
> Regards
> Adrian


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
