Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A1ACD6E4D
	for <linux-i3c@archiver.kernel.org>; Thu, 13 Nov 2025 13:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Uhf0LaasCTgw5ahQTzrPFSOQPc+I00j/bD/4c88ro28=; b=JDLtTxekeVJIPFbhrdd4R5R9Rg
	Vvnk5Wt74qo9mEUv44wX9A08svsH0TXP63zbrOoC435sqhBbLoP/vylqhXjRZYL5nn5OlZuWy0sWu
	IGJXNE5gLPWUw2ynUTRrsI7Wn7obKEfjET9KG38QLjO6cnrL3btff1d7nS3o1Te4y7cqlkHcOJJ9w
	PJMxYvws6jeo+lRpsoiyAYeVS+mEbQA+o1xg34lhU/ZSfe42c8mmsDQ/qAHZ8MxDA+/D0CRlDo9R/
	eskcgADQb4mesTBYMGvR7xNqB3In5J4x0RmRCKRsHhLCx3efmFSi7CFBf1EwpNIaInovoA8Y18OU2
	6VMhKqMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJWwr-0000000AVUo-0Cug;
	Thu, 13 Nov 2025 13:01:13 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJWwo-0000000AVUD-2IFJ
	for linux-i3c@lists.infradead.org;
	Thu, 13 Nov 2025 13:01:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763038871; x=1794574871;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=eJ5ZBowCin0pKkg+1JE8kSFBrU1cpU3jP7LzMtsFUyc=;
  b=oIWTNP3z2FCyd+iWXInCrzVNd3/girOzg//h01Anid4KflpxOzgz6fWv
   +auYJZreECSL47OJHY1liOemLL5E9I9WDmZDBvCW+x7dOxkm0qrZQaagw
   q3e32aBmjmzCvYC8ducruhCUC7clUZKJjcR411ZtlEeoH9e4wupvTto2p
   FaqYvBB0hjA0U2tLO8nzSqYqLscRyrD/X+gk0SWXdbvevj82/lLl9Scq+
   C7ZX2QGeH9MtB+w7mXpjuq2TXAptxGszA/nuFMyGZc+jwEgRL06Zd2O9u
   qjGLwdn3Z2d5KhCwKY/Pw1bdmfQ0V0+ke891nRreIuBcOoVdfmDx+uadk
   Q==;
X-CSE-ConnectionGUID: iF3iaH6JRi25Iy5yWPVzzw==
X-CSE-MsgGUID: i+094MpiSPqA5pzgr4xjNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="64124224"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="64124224"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 05:01:10 -0800
X-CSE-ConnectionGUID: a+SDONgkQtqJEAYoLZ4+0Q==
X-CSE-MsgGUID: 1lhD1W8qQWiU/ByMQXQlrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="193930250"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 05:01:10 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 05:01:08 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 13 Nov 2025 05:01:08 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.58) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 05:01:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MhXSsZnwpbYAHmX9DQJONMT0tG6CZB8zKwWufOkFGomSvBjEun/o98AP1K4N3B+HbsISO8hq/sWrJdpj6iF1uehlGYxIrG6o/g4sKdNgMiWmTvCa/ucCAnQhRxZd9ejXFxKCOVVmJ+99Y7wy6TKEWzWI5+JygrqsYWYD29wxcRvmGxolAhyMD1GV45M9ZhwzcIMJQPrpjIarr3MmgbzD0EyxOhXvi2Zdifp3bLsc6xumUxwKfg7NTLAzSJ/C03z/IUFA+C/pAb7WlxF6zG84rQZnjgkAwVVeNLl9IuLK0XHBCB79HgKvcD6siQApWKmdUQcOuCQxdwSArEU00Gcg0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T6qeNNVKV9lr9Kk/UuJvBDFVW96lo3XP7WClAfmtsL4=;
 b=JM0++Zo8ai/0ox/bZJ4/oDpNnZNXfpybgfbbmbsQDKMcntQHlfdz3+Cj+d0y3YGfutHSV3igLbPnWTSbP6G7ThW8ZuOkRIdSKUhIEArsVyCqKUDPybckwtSFf5ZAD+IP6XeqjyJyWDvPd7Tw11ut8eLHok7dOjthpXRAomG6+BcYo3xAhG1I+k/03wJxymla7syt3FbA/8KuCaWVWJPD1Nmsh5Kpv20+lUgtlhbi95oEaU4TQwz8tH15oEnD1Qddik2jh0MjFZ5INq22WU9107D9ReYjiSCiYcFV3CYC2Y5hJZwbCjzWczi35Xp/q9DyRkDAFd8/+IQc/oiveQp8Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by DM4PR11MB6407.namprd11.prod.outlook.com (2603:10b6:8:b4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Thu, 13 Nov
 2025 13:01:05 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::eeac:69b0:1990:4905]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::eeac:69b0:1990:4905%7]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 13:01:05 +0000
Message-ID: <ce8fb9c4-53f0-40ec-a296-d8cabef5dfe7@intel.com>
Date: Thu, 13 Nov 2025 15:01:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/13] i3c: mipi-i3c-hci-pci: Rename some Intel-related
 identifiers
To: Frank Li <Frank.li@nxp.com>
CC: <alexandre.belloni@bootlin.com>, <linux-i3c@lists.infradead.org>
References: <20251112100339.51726-1-adrian.hunter@intel.com>
 <20251112100339.51726-4-adrian.hunter@intel.com>
 <aRSuXx00hYqbMzIQ@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <aRSuXx00hYqbMzIQ@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: DU7P194CA0026.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:10:553::23) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|DM4PR11MB6407:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d87abe1-b36f-4af3-436d-08de22b4b4c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cHBoWkNLZUwxUURrOXNoRWVRYkpQSXkwVXA3bjFOVWV0NHkrczZOUkx5b1JS?=
 =?utf-8?B?MVNDUDVxb3VwUE5MbEdwOXR2U1YzODVaQlVlZkZZMG40QnpubEdmd3NkeWVY?=
 =?utf-8?B?c0Y2MjhVaTdzWmJwbzNOWitvby80NDRDQTNLaHFxcUE1YzhKdzRjeUFJQWs0?=
 =?utf-8?B?ZEhKTEJIZGhWbUpGaFVHemF5UWtDZXR3WUk3RFptdjVFNHIwdGg5QW9qVlZx?=
 =?utf-8?B?QkY3NkJjTmRjM3hST0Nqd3RnbVNlbnF0YWZqV2hlMHJPY3MxNXp4TUh0QVAz?=
 =?utf-8?B?ek5mM29SWDFhR0E3bEMwWEZta0VIS2t4V1dUdEpQckE5RXBQamlxRmFNaTlO?=
 =?utf-8?B?T3d5YnhvRWp2dzJXQnpjdDlSdnN6UTlYNnFYdG1IY2FDVGpRWlQwcndyQ2pL?=
 =?utf-8?B?RGNPTzd3eWxYcnAxNy94dUVXeHhycml0WFlZSEJCaE1ON1lyT2t0Ry9aZU15?=
 =?utf-8?B?azBFS3FrenJrUy9IY3JOMjMvQXdSUGdDS3phc0lhYjNlZktlQUtoaStMY1Ey?=
 =?utf-8?B?LzNTNG1IdUpDc1BiWmU2a3JGdVBXTS9KQzFpVjQ2SSsvQ3lpajFFNXJlM1Yv?=
 =?utf-8?B?T1RzaUo0MTlELzNrRE5tb2hwOG9UUWdYZGRIN2JNb1pEZHZ6RnZnZkR6OVk1?=
 =?utf-8?B?NTlFaVRTc1NISWc0ZEtsWWtPOHFLK2kzYnJSQ1NnN1MwVGlKcFowb2U1M3RW?=
 =?utf-8?B?VzRRTDdHbWk3SVZLQ3M5Um5aQ0V3UjVaVnBIdEx2RThwNTNlTWpQMWgvSklt?=
 =?utf-8?B?MldoaWF5U3hLcEhvcDhTMlJDejRUM1owblFiMkptQmE0K1dTbHBXa0grWWpz?=
 =?utf-8?B?c1YzcERVUnREcFA3Y1ZLSkJxZWJvTkw2M2F1UVVZL0Q4eGt3NDUrb3Rzb214?=
 =?utf-8?B?UERZcEtySjhHYzRMeDFOZkpVTGNYRzFVRnhRbG0rcWtrTnk3aW5uWjFwYndy?=
 =?utf-8?B?VUJXeFJwRDhKV2l2bUc1cm0zdjRZQ29UQmN4MGJKclRxcXo5UTkzMk5WZHhj?=
 =?utf-8?B?NFNJOGZLdkhGR3pZYjBWdzVwWnJxREpzUnRzTG1LWFpITW1LaUU2M2lwVzBj?=
 =?utf-8?B?NkRBcHFDVUNocUcveU9adG04N2NaU2VOcUFGMlJjanpncTFQVjR4OGluZkRk?=
 =?utf-8?B?eGNjVTUvbFpDMThoUXkra215ZGI3YjBpUHRBZkNzZUExTWt2L1BsTHVXRDRI?=
 =?utf-8?B?dzA5Y0hFM3NJaU9PSEs5dWxTMUs2L1FYNHNHY2J5QUF1RWRQdjNnOEViempF?=
 =?utf-8?B?NWNqSEd5cUJjdTlpQ3VseDZxazM5K1Rzd1BlVVFHL2VXbDZaQ1pYVktobUh6?=
 =?utf-8?B?Q1BaVVY3RmRTZzdieEozQXRvMHJwdlBoTjdIMjJjOEZ5cll0OE5XZWNlMnZl?=
 =?utf-8?B?cjdVbkphT0N3ZFhKdS9NcGZ1Z1lWOUVJbHBleS9RQ0pTTU0zaHZEU3RjQzRo?=
 =?utf-8?B?RklkaXpROVlZVzE0UStRNUFiYkwrMVowbjFuWmVzUE9Yak5ETXhhK1VkRERn?=
 =?utf-8?B?bUJkTUx3TVFPTFFFVXNKNDNQRmRWMjduUkU1UytBeHVyaysrR1paVjVRRjkx?=
 =?utf-8?B?aGsybEJsS2hLTUw5cUZHNEw1d1RXazRBSW5TV2pTYjRlaS96VjhQNXBEVCt5?=
 =?utf-8?B?ZkpCOU9kQTJLQzBsLzlkaVpIaTh2NlhmMk9CcGJvckRPbXlJV3lMbVk4MVZi?=
 =?utf-8?B?cnc0UEJsRXFHSnFRZWIyMnRHbjFhWXd2akQwZjl1MHhURXZrUk1vRWpyOXox?=
 =?utf-8?B?ZUFHSWZSMDRWbkRLR3RoYmlUUWN3cGFGN29lU2lva293ekVuVEJQRXJPWXdr?=
 =?utf-8?B?WjZkbnRUNXIvb3J2N1k4Wllzc2tHU3VkalNPVll1SDR5aTJBcmpTZVNSWjZP?=
 =?utf-8?B?WW9vT2tRalZUakdUTTVYWkgwWXF3SE9mOXJuRW9XQlV3bW9xd3hqY2xMaDhK?=
 =?utf-8?Q?pS1A4IlwvSmGkDojFWw13LxRgKdnrN4I?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjllNnQwdm8yOGovWUZJeTR6UEs5ZURycXBUb1ExR0l4bkNwWGtPMndIekIy?=
 =?utf-8?B?dTdaN2ZtcDRlL3dxck9ZeTA3YjNqTGdsa1RCK2RYbHRyenpXYjdwVlhpY0I0?=
 =?utf-8?B?aEdYVGxWQ3dEWVJwTHdrcUx6REV4UmxuUkVnZUZUZnNSZmNkQlNjSGk2cWRs?=
 =?utf-8?B?UkRUdlV2RGt4d2kxSEV5OUlYWGpIYUVkWHRTRE9hTm1oSEFMV1Z4emgwZm5q?=
 =?utf-8?B?Wi91a0NHZ0lCbHBuWXUzWkZhUXdKbThKaDdPN0NObklEMFpXMUc3c0cxZThq?=
 =?utf-8?B?a2FYNGRvT2lTNnBXSWwzVVg1Sk1sK1pEajduVlljeUNIOUI1cm5WOUJTZHQy?=
 =?utf-8?B?Q2NLZCtMNHJoNVJGY0Q3V0NUZXdPRysxRzNnTXowd2UyTFBjTXJML1RoQlU5?=
 =?utf-8?B?QUloWDd1SjBUUDFWSkhyVGt2WFlCYW9EZXd4RVlEQnVyQjFYakloemwxZUJz?=
 =?utf-8?B?b3c1bnhWaWE5NWZoUWdPd3B2Z3o3UE1NM25yN1BlUTRBR1ozYWcxZVdLb3dB?=
 =?utf-8?B?QXRwelBITTVjS3U2TTAwOFEvV0hYZXZSRXBBb05UencxOFNleGdrRm1IVWxW?=
 =?utf-8?B?MG5aNHRacWNkcStja0N2YlpUMG14VGM5MEVTZUxDQTUvek14QXZndXhMd0dX?=
 =?utf-8?B?end5cVkyUldiWWQ4bk80TyszeGEwUTVVcTdCM1kyNlY3MVlyV2FQc1lsWWhn?=
 =?utf-8?B?REo1dldUM0VZMzExa2RXRkdCa1NPaEZXTjBrRUw5TXlXUm05d3dlQWxiaXdh?=
 =?utf-8?B?YWpGR0ZmMEtIR2tmNkFyV25obU9LSDJrbnRpSnhzcHdXcHJ6Q1M5NW95NldT?=
 =?utf-8?B?b3FLSFMvOS9zMnNBek1rRHpaelByRnZwRUxIWWIrOUpDZlZiQ3VZVFVjTGNS?=
 =?utf-8?B?SXBFcERZWGNMdVNDckVIVUJXSzBlWm5OTjMySDJzZHFGaVJjcUxsL3h0MXN0?=
 =?utf-8?B?TTJrWlJacEEwUmQxZWp1b1pwbmx1NmlmcDQ4RHZsWXVKSi9odG92N0V0dkRx?=
 =?utf-8?B?TjdmeVV6dHdXSUdweEpQRitNNGpSM1hxZVlTRS9GRGcydFN3cEtsdGI1R2xQ?=
 =?utf-8?B?TGNPOTFrUng5UjRHUW80WjNHRld2NkRlUTliZUQ1WFFPbEVXemQ2d2g1d1pW?=
 =?utf-8?B?SzlPNFJndHo1RTV5TDhyWGhiZ09aZ2ZEYjZDYnJ3cUp1cklHU3BmRno2WEd3?=
 =?utf-8?B?ckxqSSsrTWVUVTNISVZYWjZoVUo0eFdJNVNoUGxqemlkK01SdE1VOHBLWExa?=
 =?utf-8?B?bmY3ZDEycnFmZzhUcFlSVDNJQ25hbzd3N2RPemNlQWQrWmhvNmxzSHEyNVhI?=
 =?utf-8?B?TUZyUGdyWDFOK3hJcmFGbFdRZHhBeWVyUWYvMlQ5NXpNby96NisxOXBMV3g1?=
 =?utf-8?B?WURIcTRxTHcyTmtaeFc3SS9KelRrMXJJUlRNVVIvVHRDRFcyemEwRThINndM?=
 =?utf-8?B?UkJQOStWQXliUW1qZTFYMnZWbXdSWkVXL0JGREo3YVFSekNWL3htSzFuR1A4?=
 =?utf-8?B?RVdMcjZxb3B1aDNJbEEyWUZHbVR5R3V1VmQrMHJ2TDhqdlJNTDlycndBVTIr?=
 =?utf-8?B?cFFmOUhSazhQOVBrL1JSRWkvd1huemg5ajU3QWhVMnQrNlkybmNjYUZJS2x1?=
 =?utf-8?B?c1NQOVQ4c1RNSDZTUlYwTU45VXdOeHVqQ0wwWUljQ2NrYkRLcjBpOHJvanc5?=
 =?utf-8?B?TjM5SUhjci9KWVpDMksrZE5HMFluV3c5TzEwQmpJdmt5VHBjOWQ2cVRhL3pp?=
 =?utf-8?B?MSs2bVdZTkRVU2prczVWQnhMUWZTNVN0LzROSnhWckhsK1ZEc3VvY2RONHZJ?=
 =?utf-8?B?T3FYR3Jaaks3UHE5Wkk3Z2g5SC94Tkk4S1cxazBNQmRJaWQwVGxYdnRqdTZi?=
 =?utf-8?B?cHJhTU1xNHdVM05meGpWNnRkeEFEcndvWmdIeXd6Sno0cmc2djkyWU9CNVNi?=
 =?utf-8?B?bHdxbXZEMitIYm45dFdWNDNLeEFGNXU1bjN4TFJ4d2NORUtSRUs3K3Z6aUs5?=
 =?utf-8?B?ZjJNUHJpTnU0S3hVdWl2bHNkZUd3dE1jSlh1eHgrV2FBS3BMTHkxVEtRTGh3?=
 =?utf-8?B?VVdVM0daNGxoTEF4cWQwODFMNS9WbFFzcjZmUnFQL2pkdmZHaWNoM21waEVY?=
 =?utf-8?B?SGd6bmd2SUp3MVEwdVdHWUs3V1pSRlR2VmNPSHJiM2s2Yzd2eGtPZ2NpT01z?=
 =?utf-8?B?ZFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d87abe1-b36f-4af3-436d-08de22b4b4c2
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 13:01:05.7615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xdAOvI++uhYQ7LHfaxfTRIQIMIQ4H1+KyDokVJ65FnmPrrwrMMZYpuBjI7L5F/wHgk4i8ermQEKowr9uqv1q0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6407
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_050110_604577_E8154BA7 
X-CRM114-Status: GOOD (  12.84  )
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

On 12/11/2025 17:57, Frank Li wrote:
> On Wed, Nov 12, 2025 at 12:03:29PM +0200, Adrian Hunter wrote:
>> Rename some Intel-related identifiers to ensure Intel-related identifiers
>> begin "intel_" or INTEL_, and for brevity.
>>
>> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
>> ---
>>  .../i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 18 +++++++++---------
>>  1 file changed, 9 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
>> index 617826628dc4..c74cc511a344 100644
>> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
>> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
>> @@ -21,11 +21,11 @@ static DEFINE_IDA(mipi_i3c_hci_pci_ida);
>>
>>  #define INTEL_PRIV_OFFSET		0x2b0
>>  #define INTEL_PRIV_SIZE			0x28
>> -#define INTEL_PRIV_RESETS		0x04
>> -#define INTEL_PRIV_RESETS_RESET		BIT(0)
>> -#define INTEL_PRIV_RESETS_RESET_DONE	BIT(1)
>> +#define INTEL_RESETS			0x04
>> +#define INTEL_RESETS_RESET		BIT(0)
>> +#define INTEL_RESETS_RESET_DONE		BIT(1)
> 
> These are already begin with INTEL.

For brevity.  They are long and "PRIV" adds nothing.

> 
>>
>> -static int mipi_i3c_hci_pci_intel_init(struct pci_dev *pci)
>> +static int intel_init(struct pci_dev *pci)
> 
> intel_i3c_init() ?
> 
> Frank
> 
>>  {
>>  	unsigned long timeout;
>>  	void __iomem *priv;
>> @@ -42,21 +42,21 @@ static int mipi_i3c_hci_pci_intel_init(struct pci_dev *pci)
>>  		return ret;
>>
>>  	/* Assert reset, wait for completion and release reset */
>> -	writel(0, priv + INTEL_PRIV_RESETS);
>> +	writel(0, priv + INTEL_RESETS);
>>  	timeout = jiffies + msecs_to_jiffies(10);
>> -	while (!(readl(priv + INTEL_PRIV_RESETS) &
>> -		 INTEL_PRIV_RESETS_RESET_DONE)) {
>> +	while (!(readl(priv + INTEL_RESETS) &
>> +		 INTEL_RESETS_RESET_DONE)) {
>>  		if (time_after(jiffies, timeout))
>>  			break;
>>  		cpu_relax();
>>  	}
>> -	writel(INTEL_PRIV_RESETS_RESET, priv + INTEL_PRIV_RESETS);
>> +	writel(INTEL_RESETS_RESET, priv + INTEL_RESETS);
>>
>>  	return 0;
>>  }
>>
>>  static struct mipi_i3c_hci_pci_info intel_info = {
>> -	.init = mipi_i3c_hci_pci_intel_init,
>> +	.init = intel_init,
>>  };
>>
>>  static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>> --
>> 2.51.0
>>
>>
>> --
>> linux-i3c mailing list
>> linux-i3c@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-i3c


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
