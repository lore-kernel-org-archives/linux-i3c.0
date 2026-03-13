Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA8E107BCD6
	for <linux-i3c@archiver.kernel.org>; Fri, 13 Mar 2026 18:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Hrq6ZLj4A+3TUt3clNmU808MbjLi5rEBoyo+Kmu1jI8=; b=Sqd54+mbWJSV4BJf3c6vhUltcz
	nqdtemPkoE+xcKDfZN6Q2JjUmWIJrslwr7b2D/fXgguCgzVZuMmNDz8rStMOW8v1csolCzQ9V/7GK
	WP+rodyPCqS/4cvZcDGMpm7LbDXFxhrZQdYh8NOchjC90CsK1VY1hVuWBTm/5JU66kAGzuWnxpKLV
	OSEJZ0Xjgq60Elwwz1uxWJAN430Sbiox68QzJvH8Riehy0gVcajm1cLYo9NuYs1JsjSkW6r/P+pEg
	uZ+9XU/ueKjc7SRSvaKufzGXM+dBpxkKZvkOVhKzng2YhqEL9susPeO6Epb+Ah/oJ28Kh0baTx+HN
	3GhOXISA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w17Wa-00000000xND-1LW3;
	Fri, 13 Mar 2026 18:46:16 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w17WX-00000000xLp-1hZ7
	for linux-i3c@lists.infradead.org;
	Fri, 13 Mar 2026 18:46:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773427574; x=1804963574;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=w5PBElodFeDz7b7tSQv3wzSa4C+ePtWLQk8o7WyfBH4=;
  b=n0neVCjJ3fJy/t8tX3tCU5SdwZZYJ8vFYZ+UenQn6WR9VpkiJumlxIJ4
   aV9RpfRlX3LN8fJR3kNJI0HJpfuVA8i6qg4YD8wixtCPmIdKAzlVaT8eB
   mGO/yaGr1MnTPy2nilvGeMVMc7I+/ETqq6f70vGPudvVZiur4tPxhp4Ov
   vYrqK0Wtii0gbnvCUOJSetGA4/U1+ZONdOZjtFneuKM5Ion9qGEzTmH0E
   J90AZPpjUsB4x+hdwLE1buokgNSWOwfrLc8ug3QPeFY+SmHo1pnwqtOZd
   mJDX56bzmUnwqapg3Mt6isEhc6XXQcYbBjRdk2EofEl8t+OScO6J6JXQY
   A==;
X-CSE-ConnectionGUID: Fg/yq7mWSzCe1U4H0i6hVw==
X-CSE-MsgGUID: noeWKD0PR9Kmhaed92/akQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11728"; a="97153012"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="97153012"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 11:46:13 -0700
X-CSE-ConnectionGUID: bkHLx4bMQaCfpX0S6dCbKQ==
X-CSE-MsgGUID: GLV2PcCBQQGtS/2mCQZ0yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="259145836"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 11:46:13 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 13 Mar 2026 11:46:11 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 13 Mar 2026 11:46:11 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.9) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 13 Mar 2026 11:46:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FK9tHnuxisK1UGNcdJ+knOyI2W1Ot5JescZxWoCxGKL0JX2gFhWg0dibP6Vey6JCb2VYiNFtRsWQBmn1w0YZ08mgKpCWGSjmmmI9ty19KWJ9wrdNUxb7t5JJg+dbinLt+Igcj0IpdHJXz4PEg8f8emo5xBezvFJj9/Hbesm1I5sW7ml3Je54g/deKyObXUJy73Cfv6qPA3X4HBd3dU/A285fkOxuQfU3YIzTZ32+LLmx2EKWDOxAg3OEZemx5BdX33b1FdHzqZdiGj5a21YGp3pFCX4we424ooZ0vRlLlwjAfSav3AkgevXPADT89QFYh7GScsAZzW/yYocdhF1DQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vDhafRAh2pBQQsepMjM/6FIeP3iTvyj1KoS/n2mK/58=;
 b=NzMN3Pb1ByPgHz+e0Nfwm68rFfT7tjJ3k8tW7dsvSkirkL4CyMlGX/WLhzZCVe8V+WATOVFVin0ig29eEZJnVtTTM2hDGe7U3YQoOLSvvxQ9I4XZGeoUq/loSo6YNBnYr2s+5QpnuiWboeKOJBIGFIJqdqlVCgZ7w2l+L4T6NIsju6U8mzHzBIx6CMEjQI0CUROPANK8MGQ2UmZK0I+Vfi+41Qn/84jlIHPuEpTjHY0GgDn9jNoxz9lUiJlRjkbUjjj6qfRqy/hZvO/9vbLWWx8s8eEV1aOy1EGFgqfJrcEZM5WEomqisi3iizkkLVJNXFfuKY/o/I11kzKUFUVJFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by CH3PR11MB8315.namprd11.prod.outlook.com (2603:10b6:610:17e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.8; Fri, 13 Mar
 2026 18:46:08 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9723.006; Fri, 13 Mar 2026
 18:46:08 +0000
Message-ID: <832d6dcc-c854-4459-a25c-e9bfbbb6a78f@intel.com>
Date: Fri, 13 Mar 2026 20:46:03 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] i3c: master: adi: Fix error propagation for CCCs
To: Jorge Marques <jorge.marques@analog.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>,
	=?UTF-8?Q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>
CC: <linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Dan
 Carpenter" <dan.carpenter@linaro.org>, Jonathan Cameron <jic23@kernel.org>
References: <20260312-ad4062-positive-error-fix-v2-0-1c933b5c7ed8@analog.com>
 <20260312-ad4062-positive-error-fix-v2-5-1c933b5c7ed8@analog.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20260312-ad4062-positive-error-fix-v2-5-1c933b5c7ed8@analog.com>
X-ClientProxiedBy: DUZPR01CA0223.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::10) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|CH3PR11MB8315:EE_
X-MS-Office365-Filtering-Correlation-Id: e039dece-d863-4594-a817-08de8130ca33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: pB28Gd1Z95JPdxjaaGcC6MD+zhSL+SW8RfHMjO0ztHk4IKmHXVQJ36I4NDpeS1A5mqSA78GuEBEyoE7q/nkI/+pCuxOSfRfxJ1qNaiKnII1551WVd2DL+r3MOdbZ7VoWLM3ASdVPs+YWyF/SJR2g043y+XaQb9Oza6XectHTLabDWDlUW8f4AWNQwMojtSpXUYmZfRcs02p9EFze+MWOPc23Js+/BiRbSZiGEqIKIACB18mmppwipYRXAC/AR8qp4u78+PJMI/d5YD9TXJtaN3Tyu5FJ8qhirCufDWgbbcll6gUfaTzEQgj8uSN1bCRlsVK88dzMC6FkiJP6+VXM/oZlbcton2EBhpw+7AlCUFbYIinzpxFD8e1EB6Z38YAqATfSYjvNa16QzF+HzjmFRn98KwGSPwFj0QYnxAKRRqjjOG79n8IBJRVDre9+LTiIOXpVCuEwKfEVP/VoQSb6wczicf47o3lg+ZTQfU0eceFRQcXKXXsdj+nmWzgR1mu57viBgb0mC+LgSH4AEEgt5JNHRxSSZrT1da3/2rkocZ8JOfLH3h10FNnZjFfpgsy2ZT74eV935zIs4n87o61kF+hdxV8BQMxsa7M/VzNVklbhCkh4A8UDpxhxfEZQ9oYpyUI6TTaeRUhVB9JqwtHWAxTHwOSpA1Lws9jc+/8vvGiNqn9utdsmKSwXuofV+kXWLo6UuPXdF7UwHJj/ib9W3mcgXeNkzWsuwTLnqcfP4sE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1l6cHpvZ2NJMkFoOGM4YUpCeVM0eUkvc3lmOWtSUmkzZXVydzdoSW9xeTc3?=
 =?utf-8?B?emdNTUdBd05BZHg0OXJjK1FyVlVLU25ncVdla0FsUS80bVpyS3FXT2ZtelQ2?=
 =?utf-8?B?bVNFTyt1STZ1c0VPRVUxLzhKNHJ4UE0veTdJcGMxMGZKbFd6bmh6V1dKQjU5?=
 =?utf-8?B?RTZPY0VNbzdxNFNmN2hyaGVqNFYxWDVrSWhhU2c4dmU0bTk1MUZMQm13Z2pL?=
 =?utf-8?B?ZWp3RWh2emd6clVkMXhNdUpJQ1RmdU5VVXJyRGhnTmVRNzZ1Q0pBL25GbDds?=
 =?utf-8?B?ZUlOT2hjS2lCK1czaGRjamtuMTNhTVRiWUEwZ1NXUXU3S3FZZjZ3WDB5Ylov?=
 =?utf-8?B?dDc4TXZtenVGcmUvM01uaW82ekU3Z2FmcHQxcnlZdVhqbFlqQytTWTNLS1J5?=
 =?utf-8?B?V0hNNTBoZk1QcFQ5TE05OUptd1RGUnVoU2JmNnovaVJZV0VBUi96THFJbFJH?=
 =?utf-8?B?WE9kVnlGWGNRNU0wRE83MzFKQ3NKYjBOZHVjYUg4NEtkenZZMjhOeEtQUVdx?=
 =?utf-8?B?cnBHMGE1ZEFETEl1YmlhQjdubEV3YVMyTkVzaS9uME14TFd2U1NjbUI2eUZy?=
 =?utf-8?B?YzlMbUtHaEpIbEhacTUyU1ZmTlp3SzQ1YXRmTXZJU0krZXRMRll5M3p4TWtZ?=
 =?utf-8?B?ZzUrWE5yVFFXbFJaOWxzcmtKZVJqd0d6cE9Ic3BJMU9QYTRHc1NWd0hrQnFm?=
 =?utf-8?B?eDNRVTkydEZMWlBKVUp0TTBQc09HMnk5TWRZOFFnUy9nVEFtbUJOS3hwWXNR?=
 =?utf-8?B?dm1XT2hVRTB6WGtQZVl2TklMd2NvT3gyakpiVjZZT2hIamNtWGtTcjlKb3pU?=
 =?utf-8?B?Sm5wZW9FeTZNNTlZdll6YUpqSEVCTXJvbU5ieU5CbDQrUTVkemFhM0RubFlC?=
 =?utf-8?B?SUlYRkhMVHVVVm9ZVHpRQTZmM1phZzNWc1hEZUw3WkVWTHl6b3I5RC9sUXFG?=
 =?utf-8?B?aE1BREJNaFMyaDZsN3VqaFAvUndoQjJmY3VJM1lPNlNhRVcwU0JZSDcraU85?=
 =?utf-8?B?MEZ5dXY1NW9ocUNtTHhHQnFyQlRySkZ1RnI3blQyVnhEalZPMzhtQXp1UDV4?=
 =?utf-8?B?REVhTTB3QlFGZlFCK3VlSkdCRDJRd0lVV0t0L09MTGRtMkRoWlpOY2luelZR?=
 =?utf-8?B?NFVueEdoQlN6R29DQzNnbHFQMWZJbDd5VWw5cHJHM3J4N2IwYlpTQXVHQkk4?=
 =?utf-8?B?V0VxZGtNbmVON0lZRkw0dHRNamRqRUJaVmU2RjEvZzhpVlFyd216S1BqRkJu?=
 =?utf-8?B?aWNwViszZUJXY2crQjVyUFg3QUY4U2V1eFlWaXdIbEZrWGxvOHVOR2gzTDdU?=
 =?utf-8?B?emxqanMxbGk1MDFrczd0Tm9pc1FrazdBQ2l1RHJqNE01UzVDWmhpZy9ZTVY2?=
 =?utf-8?B?YlNYbmcwSzFzTmlxR3MwMk8yNHVlVElXWVg2aXNIYmhDK1ZNZnZGblI4YWhT?=
 =?utf-8?B?Qk1sWEF4RGJuNkRtcURldHJKY3dSdTNWWlYrZDQyb0xWY3g0elNPMStidE8r?=
 =?utf-8?B?ak1ZVS8vMEh3NE02RUdHdXcwV1AzUEJEc0s3OHMzTlhFeldTQW5SVGhJSjR2?=
 =?utf-8?B?czJ3MTJ4dU9UN0xPLzN1dFlTUGJYL1V3MHZZOWlPbWx1NXhkekp2ZSs3N01J?=
 =?utf-8?B?Ti9EcHBDZ0JpUnNmOTRHd0p1RVBmMEJTZlBodEdncXZUMmlSNzJaUlg5Wngr?=
 =?utf-8?B?VWJ1aThJMUM5aHBhUkFHeHoxd0pVNzRQcGZ5WmxkVFJzaG9seWR6eWRPaHhJ?=
 =?utf-8?B?MUlwdHRHckNaWDdrRzBmV1FMcnhnTm56UTNyNk1DaTZURFM3b3FmU0FBeCtQ?=
 =?utf-8?B?NjRDTlRidktTRXlHRjdYY0pRMWE0dzc0UkhtOVdxT2FUMi9qQm9xd3BQV1pF?=
 =?utf-8?B?eEY3NjNScmhkcXVpTnBTNmdjVkZaMElXMlRFY2VaYUcvaFoxaUlhZlYxUHlD?=
 =?utf-8?B?Q3RJTzluVW4xRFl0RVdIeDlNaXFSaENXT3U2dy9taVpFaUFFdHRnNFBBNmx2?=
 =?utf-8?B?U3VtRTdLWUM0cDE1QitYaHFXUnljSjZrTWd4V0x6NlArSGNVQVFuTnplUVRz?=
 =?utf-8?B?R1lsa0NmcndFWW9NNFZsVnZqak92ZkJ0ZVhSR1A3OTgyMC82MDdzTGFmdTl6?=
 =?utf-8?B?QWVLY3ZBNEtubi9tSUszUytXZ2FJRmtWZnB5Mk82SzlUNVAvT05KZDhCUU1F?=
 =?utf-8?B?QVRBZ05oTk1hLytONXQzeEtYR212eDAvN0xzS290UmI1ajU4VHk0RFN2MlNu?=
 =?utf-8?B?TzBmdjEvUzJ5OER1UE5vQUhrWTJSQWNDcEpKakdsWVhkZ1JIbDZtRGp5dnlN?=
 =?utf-8?B?OFR4MnM4aEtTQjRpQk5wc3ZzNU5EbC9UckUvVnAyb3JkdXlXNWkyUEU4NUhn?=
 =?utf-8?Q?pgulb2d6aCUwBGFM=3D?=
X-Exchange-RoutingPolicyChecked: dMYMiPcXZhc+aWl1DDUchvr2Ya86olSbsnkX6CyA6SZx3HYYocOxqyKTsykbSsE/EA1uumvjsKHMAMkcrNqpD9bTeKVpXUiZx7RNX+jMZFN0eFbHbUfjqc74yFS9x2iaO4hcj8CBdqtQ9pmcNjJ0I0Krg7uZodJnxAwkLmP2psLhYlodLMvfT4FaEghdGEQjK53guDh+kOY0ad/XCjFShW9lIRIzRsPozgWRl7WNDFnj+pZVaM8+JbjRN/c7/TVMDSgPFDOXeVZJRC0PS4MHYpauZjtxPSr9+h8NZB+swo3bapXVOqH7SL0Hr53SA/a+K7GU+BRsa1kF7xLvsnFJFA==
X-MS-Exchange-CrossTenant-Network-Message-Id: e039dece-d863-4594-a817-08de8130ca33
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 18:46:08.6434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vhqj1CDD3iaNR+ADSWfHLj6QpdRYiK5BnPNGO+IXZNDE1vPjer0RJSSExkXn1edA+74//+3VTudFDvvzARPCxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8315
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_114613_501579_91C96FD6 
X-CRM114-Status: GOOD (  13.63  )
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

On 12/03/2026 18:38, Jorge Marques wrote:
> adi_i3c_master_send_ccc_cmd() always returned 0, ignoring the transfer
> result populated in the completion path. As a consequence, CCC command
> errors were silently dropped, including the default -ETIMEDOUT and
> later overwritten by adi_i3c_master_end_xfer_locked().
> 
> Fix this by returning xfer->ret so that callers correctly receive any
> transfer error codes.
> 
> Fixes: a79ac2cdc91d ("i3c: master: Add driver for Analog Devices I3C Controller IP")
> Signed-off-by: Jorge Marques <jorge.marques@analog.com>

Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  drivers/i3c/master/adi-i3c-master.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i3c/master/adi-i3c-master.c b/drivers/i3c/master/adi-i3c-master.c
> index fb9a488304469..047081c9f0643 100644
> --- a/drivers/i3c/master/adi-i3c-master.c
> +++ b/drivers/i3c/master/adi-i3c-master.c
> @@ -361,7 +361,7 @@ static int adi_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
>  
>  	cmd->err = adi_i3c_cmd_get_err(&xfer->cmds[0]);
>  
> -	return 0;
> +	return xfer->ret;
>  }
>  
>  static int adi_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
> 


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
