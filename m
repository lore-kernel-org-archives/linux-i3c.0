Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC27CD484C
	for <linux-i3c@archiver.kernel.org>; Wed, 13 May 2026 05:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=jkRtYPqhmxjyxp1pUDhRo6b0uNVwoNDJK1uy1bk9pFg=; b=GDbRR/3FDtioI2n0A/9/R7mdFO
	CdSZAFaFZ/2zqT8FwPWYi5VzA00fvxJic3+Ui8N+gMrs8uvznOozKfwx4+OGSAnpCvBBbaqhf8diR
	DOyz/eR6t8wkdsLJHXlETWTJ9NHxviAfJTolCOoE4/tj7V2yvcVFCE2QTVXVG/psLuy1OiXc2JWN3
	sbk0V1Iti7yEOxYlbpLgzJ3/Vr5JfTBLX54msCEScAQRhiyQ5TPZkdA1DUTQ/70gI9UJqrmyIXRGM
	SsPr9tzcz1RmaRmP4BBtjJePW+ciIafVyh+/PEnGUDTAdoCoObGkbMnWInpGxUdJl2qe1gspU1+1D
	ZXTBwCow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN1qW-00000001I7B-009K;
	Wed, 13 May 2026 05:09:24 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN1qT-00000001I6k-01hJ
	for linux-i3c@lists.infradead.org;
	Wed, 13 May 2026 05:09:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778648961; x=1810184961;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=PugBNTkUbguKFfe+HYcTLXPPLmiiu/zO6b1N0cUu0yg=;
  b=dBmHdnM1bgc4WqdCg4qUFh2YZRvMvFIyGe5/zMY49+WqV/9j7xcbU5Do
   YKy5BHSiUEmNpgATxh0RQR22AMAAAmaJNOu1R/vorKxU1jvddB3az2YwK
   GCwnr20Rfbpuiu7KsXTrs/0WVBN3JfvjRRV0O0fF6smSvIROzNDyT3nu5
   sTd/ZSthgyx3F3fS3ww+4JNNiIkSmxsHWzg1yhA+Uj2f8dmA68aLbnlh5
   /7CcPOFoxVVLhpPEX70cDm7DZwSw/t8/wqJM/4YQFxZ9hsKrEX1yAPNWU
   RkXe030OYLTSjFvbEsQVb2rRWMI3USF/3+jRv98A8P0EHSAYf2MvqhHQI
   A==;
X-CSE-ConnectionGUID: CYaoBz/FSFqDmpnvGWL6/A==
X-CSE-MsgGUID: lqFNzwVSSFKGwPyFBqfzOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="78711555"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="78711555"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 22:09:20 -0700
X-CSE-ConnectionGUID: 7u5L9T4cR4yimH2QaBAEew==
X-CSE-MsgGUID: Zv+j6eD7Qv64zO5hDQNqDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="261466425"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 22:09:20 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 12 May 2026 22:09:19 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 12 May 2026 22:09:19 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.36) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 12 May 2026 22:09:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UcL85JzPvYLn+rcgIJFMX2gIVuFuNYE47tHOULA4X6D4W61BpDnNlsFtImwV6lr1DH3YrjWZrU99tPwSGMfuMoJmIs0rvv1kK51uf2rO2MK/PaQrkLGB69uY21ysldMlqC1hYCXmoyd+cuhkSZR4o9uSL7zlYMQh9CjqWZQA8k6mgv4iEvYh+Xm/KZYhMkLQir1OU/uoqCsXoJWGRrFZ5gAekkKDzf2zeklyNckN85evpC11d5u6epqFwkGmbTomTs+tn+aPbE/8FmFE1eZE7zlcnjrx+wFgap0qH9v+XXMYnzwXLpuPEXY4yhtIgRuvuxq8PK36Q1RrT0QSQpyIMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hvxVLyouGFlm+yO9Cvk0H59XXyAyB1BszK9cSWYNaAk=;
 b=VpLkdno9s45hdjMcA4CYa/kuoE5H7zo/2Q57dPVX3XNOA6kXuOnMpqgACTwYQUyvTnCuv4zstvY9NYiskbpqB0hqvrnOZ8Qtz+QeJBTqCZo8jAvWkvqcq9ChVFdyfFHwWtfgX7H+yBxUIwg/X9se0/zeyIzMeer2sMLaQYttjk+5Ti3q/J8VQ2iFeuy8BTOziER/DVEu78sqIcRPrjndPDY0dWZjRvn7sidVjGDNwMH7LPzhWzK6owoahqFwSRl005Wz1gjzOHnQOWLv5JarIbnvXaf0DBe0hmAASvfcW7eQvM2APxH6dpaTcs7CbJHvtjvKsnPwgYbez+V95b2dwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by DS4PPF990BCE628.namprd11.prod.outlook.com (2603:10b6:f:fc02::3d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 05:09:12 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.20.9891.021; Wed, 13 May 2026
 05:09:12 +0000
Message-ID: <21cc860b-e456-4879-b8b4-b699410d3662@intel.com>
Date: Wed, 13 May 2026 08:09:07 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] i3c: master: Serialize i3c_set_hotjoin() with the
 maintenance lock
To: Frank Li <Frank.li@nxp.com>
CC: <alexandre.belloni@bootlin.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20260512121732.406009-1-adrian.hunter@intel.com>
 <20260512121732.406009-3-adrian.hunter@intel.com>
 <agNRR1wHi_FhHf4u@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <agNRR1wHi_FhHf4u@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: DUZP191CA0011.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f9::9) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|DS4PPF990BCE628:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b4b5e4b-b57b-44c1-17f3-08deb0adc523
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003|11063799003;
X-Microsoft-Antispam-Message-Info: Zi71TWzjllprK6w/qoPutXsnkPc+uqXlc7N3hZCTqrLSGxgUNxjyO+yll3UI/53d8L7K2lz7IozZ3tMMwB/1wD/usNiBje9brjz1jJTxjV01zPCZAmRvgjp65W7/kEvVIYS/7pXgO3D4HDLznDgMMJNUFFVajGzB3c86PVI7gdgRLJjEa7UacVpHvAdCvAQqeDkhAefFQiVKhuFfRSTAUW4U13uhZ0Wqdgd3r31eNtOUyf1SMHJaMlCBDiT+DM79n6xr4/HONWPzbZhfGRrfmFElvxD0cPbR0h993GDJRo1SwCaz7v5J3WquB5S9eerNVIYuy9o1eSoJvHtTwCL+SXpbYhJswpkumqvSrIjf8DvgjrBOat47C+plNwLrdIgbZn8SRN/2Q5ksnq8wVXK8GqArsbehslIJmlZLnJxC9HQFdr1sBOEy2VXZm5yi5v4HQxs0jbj+TFesPxRICXUNGSSrpmf918EvcyprAKqyfWbfOhd8UVC5ywa8lxbi/pOV9hJiT5arZI96RVZZStwdAkNbyEiwxY4I4asvR33smZqgde//1dYB9CwLpmPH4Y+PU0Q+xn4XZjwvEgg2P9bIT3+YL7zJalw9Ptaw1/sXFI4XJDJkYIaGw9qQecpOWaEZPMJ7AoGFwGpOXHMzm2iNimEqJL4Je+M1vm2i9o21V5CbtHdU1gPH/FU4wKDCbkcM
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUk4YW8rUUpucWhnMzNMVHFlUUZlT0ZuVkIzbzVTQllrME02V2U2ZEs0aURZ?=
 =?utf-8?B?Z1lkT2d0bisxTmd6dU5KODRVcGxUY3Z5eUdIaTlwVWpkc1VVOGRkcmpaN1Uw?=
 =?utf-8?B?Q0U3SHgyR1R0YjNJVnFtcHljTHdQNnV4aVhycDczTm5hWUh1TThoWHB2bzBY?=
 =?utf-8?B?alNZQXZJQTR2MGFxT0h5SnhMeXRYeHArT0IvdmxFc3ZjVXRpOWNGZy92RThh?=
 =?utf-8?B?aHMwUnpmVDZvVVE0cDhBOWNpQ3RKTlpDckdSenI4RGtCWjlCMmR0c3Q5YURn?=
 =?utf-8?B?U2ZsVCtOL1hNYVFOSlk2OTZnMmQrVGJoZElOZW5ScnJvM0pwOERBNVZTeTN1?=
 =?utf-8?B?d0FkZzRGNXJ0RDhEV0RsVDNNSkxkQlhBSVdWazRMZDU0eDkwbXNUS3UyN0hO?=
 =?utf-8?B?YWZ1a3V0MFFHMHJtbEZhc2dhL1VpYjZRTGlkaTFtL2VYalRTWXdiYU9kVE9j?=
 =?utf-8?B?OGRiUnhXbjJrNXhnaHhCQlRia05uUHVIalBLK3ozczNuMHRiM09uUzIvTzhy?=
 =?utf-8?B?TTYyMThlbm1rb2RGU2xGNEpLd1VUWkFTeTF1ZFh5NzdtRW00NjVPbjYwZTBY?=
 =?utf-8?B?QkcrY0NhZ3o1M2xpOEJ2ZFRWTDI0K2t2cGNmdStKWndFRXdKQW56Z0NlM2xS?=
 =?utf-8?B?U2VYcW0vRWttSTdkam01c2VZTTFpOEc4NEFUK3NTU2ZYTnh1dWcwVnFlbHZU?=
 =?utf-8?B?RzJWNkF5ejJ5WTdtYTUxYkFnZEh6OU1JeHcyaXIrVTZ0MGNtWm9KMlRGYXRY?=
 =?utf-8?B?ampLQU9jSy9KUnZSOGNxZkZaOHl2TUxYdDgzckpwcGJPcERTSmdoWnJUcFZW?=
 =?utf-8?B?Z3VrOTE1YjlRNnJTb08ybGFQT0hNSldDdGEyQ1ZZbnJsVCtCb2xSOHdpdFBo?=
 =?utf-8?B?ejN1ZHZrMVRDckpSS1pZV0MwTVdhZlZrZjZPK2ttMFpjWVdSbFJTdTFDanNi?=
 =?utf-8?B?eVJpUGZyeHNrVUpMMy9kakQrd0RIR1NVRWEvSlpzTFdLY1hFb2lNai9wOTR5?=
 =?utf-8?B?OGZEYVowallhQWQyRm45anhTbGYxWTgvSjBVTnQ2YTJ4WDBRL1hkYW9vZzR0?=
 =?utf-8?B?aVBnVmtzZGttZllVNVh4U3k2RDFJVmpWcXptRzExNTRDVzRNN1VOelFySjZR?=
 =?utf-8?B?a0tTSldtRHBpUkx5MzNDT2owTTJGT2oxblVQOUU2RzJmSUVNcjNXUUVkUzQ1?=
 =?utf-8?B?SE9RUUg0eGcwcjAvVkh0OFJCYm9IQmFzc1VFV1k5WnRmKzJpZDRQRVd6Wi9G?=
 =?utf-8?B?S1FZbHJlVmd1YnBNQ1J4SzFoZEw0TGFqTjV1QWNxenFUTHloblo5OWdVRm80?=
 =?utf-8?B?VEk0TWY4MU45SmFLcjd6YTBpZEs0RHFzY1ExRnh5dFhCMkJtcTVoTXRyWTda?=
 =?utf-8?B?MWtjUSszTEdHbFBFRTcwY0FWTGU2OTV0dC9TRHBrSStKL1BJVWhIL2M5dzFB?=
 =?utf-8?B?bmhSRHpIR2FLQVhHRUcrdFYrR1hDaGlIMmdGZlJOVkNaZ1FMZmhOTTZrZG8z?=
 =?utf-8?B?OXhMcDM5Y1dYRDVSa2tKUWoxOGtVcGMxUUtoTWU2bkVORERDYlZWY20wUHpw?=
 =?utf-8?B?dHo4TUI3SGg0cU1kLzhUejh0TWd2UjN3ODVtamFHOXk0N2lmd2NjYTZ1UHNj?=
 =?utf-8?B?dGtJRm1aZjRVQmJqcEg2L0hybktGY01LUGVKN2RhK0F5VGZ2TE5DclNjY1V3?=
 =?utf-8?B?M0E4SXpkMFgyY2NCOHBkS01aV3pOdDR1VHRFKzV1RERYdnJCZE45UnJ4d2hn?=
 =?utf-8?B?ZmF1ZklVT0xSekhlckt6MG96UmswTVllZUpvZ0hDbmFwZTRTZUdSb2ZIVTB0?=
 =?utf-8?B?U2plY1Q0R3o3elVibTJncUhwb1FiQnllS2dKOVZDRHc4K2wxVzhGVEVwNE5U?=
 =?utf-8?B?YVZZWld0aWtuS01lQWl1WktxTGlXbDNNNE0yWEgrYVhzR3gyY3NkSDZVV1Fn?=
 =?utf-8?B?WTVXMjlXaG5ZWTZBd2Q3Z0EvbWljODZOZyt3Y201RWROQXIxVFZFVVc1UVl2?=
 =?utf-8?B?TFdoeDB2b3FFY2tta1FFblFNTGhYdExSdTJGN3hUSEhCYXBCMXBwcUtFWGhV?=
 =?utf-8?B?eXBxOVZ1T1J6b3pESndYV04xMVpNNjJxd1ZadmZmN29wTTZ6cGoyLzJUTXJt?=
 =?utf-8?B?RHV6cUMxbXhuN2JYdktNQzl4MU1uL2tzSUhsYmZvKzIrVnNxQXVFNkI5ZUVT?=
 =?utf-8?B?N2ttWEhsVUprenlVbmRGNm5aNTFyREhQcTcweFBXV2hFWTkwMGVxNkVYQ2pl?=
 =?utf-8?B?MGRGQ005aFF0djZQcUFUNFMxQkZGSGFiNHRrTGFDeUxpNE50aTNsNlpTS0NT?=
 =?utf-8?B?OUNweDVBRnlLN244RkpEUHlwaVV1NHM1cjUxZkZmVHYyMEdScDdsaVFCNFRh?=
 =?utf-8?Q?h4pZbSAAQjcDb+ng=3D?=
X-Exchange-RoutingPolicyChecked: MwZHVZVkeX6OoOn70U5ZzDYeuj61jPquTy3GgBrNleEeC/tw054jAJBfActfTlaiuV3k+Vcdsq9YW7YQEMdzF1viUAITx7S2wzKPcPDVNe0LHMM9yPKt0e33YPBVMM719NE+XWs73h/ASvV0QS5eihs3smVfntEpsfouSsHGbDTuRWQpdYEXg+8d6duxf2W6gQgrDbt2sDauX8UAgCZrC82vSpfE8nvcWT5S1/z6sFlT8kSKYS1pZL1axMvMM/TMij2fiaob+c+qE36RbDBmN2AzZHQRrgAxF/2I2AJws2VkfbF99/HLJ4CO4d7PV0Rihf6ysaJgFlRiCjnbqlNuBA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b4b5e4b-b57b-44c1-17f3-08deb0adc523
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 05:09:11.9442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vRi0z5+cuIWH2r4wl07s0af110nhUz8dTtGT5rFlCyiy5ldIrcA6uIb+300E8rvAkO1wFpNO3KDiB2Epz4iMfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF990BCE628
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_220921_065152_22077F1A 
X-CRM114-Status: GOOD (  18.09  )
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

On 12/05/2026 19:11, Frank Li wrote:
> On Tue, May 12, 2026 at 03:17:26PM +0300, Adrian Hunter wrote:
>> i3c_set_hotjoin() dispatches the controller's enable_hotjoin() or
>> disable_hotjoin() op and updates master->hotjoin under
>> i3c_bus_normaluse_lock(). That lock is a read-side acquisition of
>> bus->lock (down_read()), so it does not exclude concurrent callers.
>>
>> The hotjoin sysfs attribute can be opened multiple times, and writes
>> through different opens are not serialized.  Two concurrent writers
>> to "hotjoin" can therefore race in i3c_set_hotjoin(), with the
>> controller op and the master->hotjoin store from one call interleaving
>> with the other.  The hardware enable/disable state and the value reported
>> by hotjoin_show() can end up out of sync.
>>
>> Take i3c_bus_maintenance_lock() instead. Toggling Hot Join enable
>> changes bus state and is conceptually a maintenance operation, so the
>> write-side acquisition of bus->lock is the appropriate lock and
>> serializes concurrent callers against each other and against other
>> maintenance operations.
> 
> It should be bug fix, add fix tag here.

Ok

Note, currently it can only go wrong if user space is trying to enable
and disable hotjoin at the same time, which is already broken - user
space itself needs a way to synchronize its hotjoin policy.

> 
> Frank
>>
>> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
>> ---
>>  drivers/i3c/master.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
>> index ab11e2d79aab..38ffc8713167 100644
>> --- a/drivers/i3c/master.c
>> +++ b/drivers/i3c/master.c
>> @@ -649,7 +649,7 @@ static int i3c_set_hotjoin(struct i3c_master_controller *master, bool enable)
>>  			return ret;
>>  	}
>>
>> -	i3c_bus_normaluse_lock(&master->bus);
>> +	i3c_bus_maintenance_lock(&master->bus);
>>
>>  	if (enable)
>>  		ret = master->ops->enable_hotjoin(master);
>> @@ -659,7 +659,7 @@ static int i3c_set_hotjoin(struct i3c_master_controller *master, bool enable)
>>  	if (!ret)
>>  		master->hotjoin = enable;
>>
>> -	i3c_bus_normaluse_unlock(&master->bus);
>> +	i3c_bus_maintenance_unlock(&master->bus);
>>
>>  	if ((enable && ret) || (!enable && !ret) || master->rpm_ibi_allowed)
>>  		i3c_master_rpm_put(master);
>> --
>> 2.51.0
>>


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
