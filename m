Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 802AEFD4F16
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Mar 2026 19:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=38zUNJZV/VDrDADGtulM9uNbBPgHh+xbxuhfMF4l1JM=; b=nF1ls/xCZTiNJuOZ2biUpxoJ0v
	l4y2ydBZIKClkPbjmDVpOUCX1OKhwjvwVezuv3AV6ntdZiXxAhnaJRlc6W4Dn1se+1VjXQyfRIwHk
	rcdgQj3vbLNVh74aNBB85QTUcPGmPGnrK5Mile2Mk7S9+Hxg3uWSPyHZRcTueWFlwZ9dKm8/Vonqu
	ayXkAKzcb7UHGZNHaFca1ggZo2ATm5ecRqQ7OnqqqzGeDvGSc4hvfU77XwPf4fuEVqreZePztk68d
	4bdAVMQoRORdTvtDQI5OjLVkHXxmYFRVJCcjjZffMkYqxulpdgdihgPcMnLfJYLh6kkah83XoUsw/
	4WkxnFkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w02Wg-0000000A9pe-0ujf;
	Tue, 10 Mar 2026 19:13:54 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w02Wd-0000000A9p3-42VW
	for linux-i3c@lists.infradead.org;
	Tue, 10 Mar 2026 19:13:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773170032; x=1804706032;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=aR92f+i9fS8aIHBSZhs+MW5gFeFn914aivdNXmZXxik=;
  b=nGkvoHqGIab3gLVeKd6XUmdooLnXoNPnJYSAuLT0YDQSmh4Ic6y2V3cr
   V2ykfLtNyq9/8A4MeI6+evcyDfhP9O/kUsFBbyOFJXi/XGOOydVAe5x2w
   Q1NL9fugX1c5PGWEgcnVoEV7mAG7a2fxWvQiMZT3MSDsPOp4+RRoVWENV
   fEUeOzTy+ZMuWAnbOr16DTa8RGZ5daG//7P56eHMvZ3wtJM0FyyyXEMFq
   R2JQkSEkqT47B8VhExur8n516t+h4l3zlyaM+CgO1ZwvQfAJz2Kc7tgav
   v6kEDumZYZ26md6907Zd1CBK56tX1GrFXPHaR+H9D30bxZPFx9ut5GsqG
   Q==;
X-CSE-ConnectionGUID: fMaoBHL2RIqlhs/Kvw7zPg==
X-CSE-MsgGUID: Djs1u3xURnWUcfOfH29xNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="77832707"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="77832707"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 12:13:51 -0700
X-CSE-ConnectionGUID: tqQL5JETSGaAM7QZWtl9mA==
X-CSE-MsgGUID: lad3K2NBRY+klI50mPvSMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="225172479"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 12:13:52 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 12:13:50 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 10 Mar 2026 12:13:50 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.18) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 12:13:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PPnoLL0Nab620B7pq/K7R8ILSTxY+0ucoo2n9/TZM9J340xcZJRigSOQaJc5JMo8WEd+EgRC62qbng+Xv7+FsQS4zqdy3jHEhbcE83Bbzjqhu77OW+1F3JGLZ3mHTSzunb25PPfkTA/gsvGvip6t5dBbM6KVn2Cdn45a/R272m4ePqskIHedOjZ3+7pm74o8hAnJqsijSgCp8wX/GCv2CSzBVjGcDyMKn0X3pS2Oq3zWuM7Vza47x/o6iFBT03i/tzcRlPi070V6/r79HkUjV+HOECdH/gEzWkXQSPI5WdoPbBgFq9nUK53imkgD552p5IgZYNsbqay9vIorCCU+9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TkYVrpPc5xn3lY/ph66FjgD2ZwC5Hln6LKygyIj45oE=;
 b=ljfJONcqUBvIP7Jn8rLu/lLbVpskl0gE1B3+FTa8/m99O1RNRuDc5UJ54ajY5sqe+jUaejQ5rY+EvhiIFtZyuEVYGYKzFzzEcZa6azOmHSbSiXTm3L1Eh6unwOyNhL8RCo2WGFjpA/7lmSEj/oonwaUjKqsp8IULv3oix2qg4eAGmm+y9oE/ENv5Gp0t3sGghcdcekyDjjSF1+1gxIWklZ9I2cccsRRdq84RdcNhwiDjNmZ3YCn+7tCCfmLU7p5+XKJ87p253yIpRY8rZ+6QRzwvityDLJ6uzAsAa4gn3XXB6oU4kdG2LE32AL9KTbpqVpr250Ebo/5AHwygCGcYOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by CH3PR11MB8240.namprd11.prod.outlook.com (2603:10b6:610:139::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.9; Tue, 10 Mar
 2026 19:13:45 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 19:13:45 +0000
Message-ID: <92bd5f35-7238-4084-b315-cccd5e7c596a@intel.com>
Date: Tue, 10 Mar 2026 21:13:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] i3c: master: Move rstdaa error suppression
To: Jorge Marques <jorge.marques@analog.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>,
	=?UTF-8?Q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>
CC: <linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Dan
 Carpenter" <dan.carpenter@linaro.org>, Jonathan Cameron <jic23@kernel.org>
References: <20260308-ad4062-positive-error-fix-v1-0-72d3c5290b4a@analog.com>
 <20260308-ad4062-positive-error-fix-v1-1-72d3c5290b4a@analog.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20260308-ad4062-positive-error-fix-v1-1-72d3c5290b4a@analog.com>
X-ClientProxiedBy: DB9PR02CA0015.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9::20) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|CH3PR11MB8240:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d7c6918-6c11-458e-a7dc-08de7ed9263b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003|7053199007;
X-Microsoft-Antispam-Message-Info: udK9DCIAsJUcw7BIUHV7krLz/F+K20A43SKxY3JEwP240y1gOLOc3mSivY5TXKcGdDkzpK3Aztc4xz0OncA+ZRTNx7+5ma8oFx4rQWJyJ26XdTb6ebyvSvuzejI8/BX65mSdHtZLheNmrp4eyOEcZWwGVY0nfiOneXPqHzJ+LfjySUBomJuDPGgB0NcWE8xEXSyYsqgnlNVYm9dOUEH2w8J7Pcw+D9G76pMgefRDrP3cffKMTec9M0cENuFp0yce8MM0PX8FCJmScAHOGg4dsTuEU8I1HI9q0nbVWl2tV2qjcPkvrHFAq8rPkQhcPTwOCEbwlFDFLCI7o+5ix8lxeX/bQVuUlJuNiSkIf9SfRVzOoVvcxjZ5LVttWkTy+7eGQMgEzm/XhwC14APtXkr3oKhpXRi8D/X+b5ldYmzZ/ATqSKU+fBl/YDBs44z35IkOLQ3b+CuCWsNayUng0noPaKNBstdPLzoRv04ffIFhRQ2tWEyo2q8zhXr/YXAXnHdDAVGQex1ogw+YuQR6RXoSFTB+NfQ85ShNO3Teppk2UZdHjHdnYmfZHNQXA/EP+FG92GFvZJV6ROln42P2djinYnUf3vQknshcVL91H8q1ekH0LcJ2BuCaUt3GQ97ZzL5MKPM9PeO98z09nOf8qHjyH/EGOPM3ByOALXTcHAOQAqKb1NGwWPumN13VcTrQwTnORSJjD2teW4lUZc5+kvdfRU6MjIv+MyflkUIEACgkJmo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnAza0duWE9iWS9Geld6NlNOWnY3L24yVDd4U2lYWjUvcS9WY0Q3U3RpUFR6?=
 =?utf-8?B?QzEzcGtLd1E0UjkyQWN5Rzk1MDdDdlNwdkhFcjhGOGRQVVdzd3dLaCtKbUdk?=
 =?utf-8?B?UkM5Y2tMam1ZZ0cvUHRkTFFTa3JmeDBqd252NlhnUHpLamw4TlNPaVVDU3F6?=
 =?utf-8?B?aW9mbVRQZ0cvVmNNRHZFYllaS0ZIa1N2cG5YcFNJbzB4V3c2cjRIcUoveEwr?=
 =?utf-8?B?b3BNMmduYjB4c2RpUUhEdlo4T2RBdldGUzVpRDNDaVN4M0tvMGNBckkwR1JG?=
 =?utf-8?B?R1dwVHpqQXJFS2VtU3V1Z2RQVHhaRjNwaTI0VkVaMm9JQTF0ZTRFcnRVSldR?=
 =?utf-8?B?K1V3dFloZzdQSDQ2cjEzYXpIWHNtR3M3b3FRVTJONXJJZ2xEQnRDUEw0aDlo?=
 =?utf-8?B?RkRzbUJhRWp2WE05V2NGSHhhcVl6UXNaWDVwTVZsRlVBZVhMaFlqY1ZYeWpr?=
 =?utf-8?B?WVcvbHpCellnalI3QTNzUy9jZUFvN05JMTRqb2tES2N5TFY3eE5aYUgrZ2Nq?=
 =?utf-8?B?WmZiRklCMTR6dXpENFdjY0cyTCtJNExDbVZxaE55MnpLR0FvRnhablJnVk5k?=
 =?utf-8?B?Q0owNE0rTDBidFlzZEM4S0lIRzNRdTNleU5jOFdXV1JWUWtBb0Z4L1lXenBq?=
 =?utf-8?B?RzZOZTBYaFVXNWJjV1Zzb3Vmck9HVytKSDZ5R2lObVYrUkRnMy94THdGMFQx?=
 =?utf-8?B?WUlRKzNlTmRWd3FuSWs4N1VDR2NFMkZ4c3c1Q2QxSERqKyt0VWV5YnkwRnNJ?=
 =?utf-8?B?dXVXb2Jna1E0QU5pQlhUeEJjWXh2QmFHYm1PVUNXZE1pclRoQXprMHVwem1W?=
 =?utf-8?B?UllWNjZNWEhxYzR5eUIyVGgwakRiYW9QOUZPakU1YTREcGhlbmxuVWN1UGIz?=
 =?utf-8?B?cHNyRWFsRW1CTHRLb0I2SkkxNVovMWt1MUtVZHRXMDZXdk5LRW1EWTNSZTZN?=
 =?utf-8?B?UEEwWU1VT240NlRrK0NwK2tWU3pzQjlDRU83L0k1ZzFQMVFuQTJiZE8wQVVG?=
 =?utf-8?B?L1M4eld3YTdmU3pXOGpwdjFJaGxOc3MraHZ3RU1GYXFnY3VxaHU2ZGJ6dTlI?=
 =?utf-8?B?TzhwTkJ0TkJVSTFhcUd6cXNJREJjbUpYK3hWS08vSkRwTi9mamhZTE9zS00w?=
 =?utf-8?B?RlhmOHhsOXFlcnI0REVvWUtOUCtXbDlYaUFZakFTVDEzN1duSUhKVHpZMFE1?=
 =?utf-8?B?akorQXlmcm52ZDIvSmN0VUNXYnBnbXR1eFVydmNwQnkwa3RWdTlRcFVhL1dx?=
 =?utf-8?B?YU95eU5xZmtRcXQvVUZaRVJKMmx6eHpsbDhtZU5xd0YzU1BhanpOZWJscmYz?=
 =?utf-8?B?WWFRZW94K2FwSGlUVXBCdXlDc1k2TERnOEF6ZGkvQzJjMDJ5RzN2LzltOEUz?=
 =?utf-8?B?UHlhYW5IRVpJSEJWWlRxNlp0Rkg3ekUrV1FzRGdjQWdobElEVWN1RU14YUl4?=
 =?utf-8?B?UmFGNXlsOU1SazZUZ3ErYWtSZytGdldTZ3BrYVBwd0cwaklVQVNFR1VYZ1g2?=
 =?utf-8?B?cU56T3hqVmRBYTFMQTQ5Tk0zcnBHcWhQTHRwcC9IeExPYlNnN09rNkk0azJy?=
 =?utf-8?B?eXErMVkxUUx6TFZ6RlVJL0ZJc29uWkdkRU9XUmhMM0cyZTJWeE9ka1BFYVds?=
 =?utf-8?B?clBSem5RSDNheFhnQXJXWkY1eVo2dGNYVWR4TE1HZWY4YytWT3FiTmV5QmlB?=
 =?utf-8?B?U01nb3BWN1VjNGdyT1FjNjh0ajBMTkkyTW1wTkQ3Q0NId1phNEJwSElmNkJq?=
 =?utf-8?B?MzE1MXFXMHlzOUdWUW9uVXpBVzB0SDR6a3lLMDhoWnQwZkF6NEZ0bjJDc1BQ?=
 =?utf-8?B?V1ErcHYzdklvYzVFYVAvMDhyVXhiYVFjWlJJQlkrRWJqTzJiY2dsYllLSFpk?=
 =?utf-8?B?QXIvRjB3VTdpclJmdDk4a0hLdDcyR21mc2YySTBETW5kWlIrVE1MZEtQOSty?=
 =?utf-8?B?bkI0Uy8vKzFBSDIrSE5TWmFWZnVaNXpEclgrUFNyaGlmTVhlZ0RlTjJ5bSt6?=
 =?utf-8?B?bi9jSllDVXlqYTZNV2tFUDV2Mit2bFh4Ukhkck1KNU41TkIyT3l5bXprOWJk?=
 =?utf-8?B?bDVSZzVuZmxQNkhTVzNtblVDKzMzTVZZVS81Q0RwNGJueHZ2OGFZRjRMcnR3?=
 =?utf-8?B?Y0JmM1dNWjJHbEhvWkw0aGVJL1VUT0wrRnVsRWsramJENDlXcTlDZ3hxQnBa?=
 =?utf-8?B?a2ZDRWZaY0g5Nm02Q0ttUlJGVjZYcDdaTWVLL0c3aGxQeWdQTStCSm9LWTZB?=
 =?utf-8?B?MmpoNUlJU3psTXpuYVFaU2VlQUtMWFU1M0o4aVdZOEwwc3V3d291R3crWWJw?=
 =?utf-8?B?QU94eGxzbHRUQk5FeUdmM2dQNFdZQnU0MlJjQnlqemttdlVuZUlMQWdyQnZN?=
 =?utf-8?Q?ZfRIng/JJEQVATPk=3D?=
X-Exchange-RoutingPolicyChecked: nDSejd+4Im7CrUIJ4FnG9Ttw3Vw2kh1H1evn06bQ9WBx++it6fr5k+KTimNQO0F0yVnvAf/xzAT1MopPEvChRP49WSV/ze06PTZ5kJ/k2+jT0RKQSpZoDEYLDYlqylAP885A6e9hnrxGAJbsUKKNfd0wP3C/aRyrxFw0WJdwVwWPbnbqIDB4TUgxNVWst4oOtErvd7cW3BB30dCWBMLGsEc3tR7uqo7xonC68WH86ku9IlOIetMoAQ1xG79XaQfa7/9Go3P0M5E0h/yNAG52smh/TLLTTliJS+IklJvBaUnXSzc44kDZGXow+EiN3VgFmuDRcNzjHRV6A2RDVTaVBQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d7c6918-6c11-458e-a7dc-08de7ed9263b
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 19:13:44.9861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k6kIUYZ35u2XkdRLXozsNno07U2bDzK+RqAZNWqF/1b05I602/fxEyIuMOvEmHgUe5Q9bEdBya5bMtfWtJOk1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8240
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_121352_057784_727BE0FE 
X-CRM114-Status: GOOD (  19.39  )
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

On 08/03/2026 18:47, Jorge Marques wrote:
> The CCC RSTDAA is invoked with i3c_master_rstdaa_locked
> even if there are no devices active on the bus, resulting
> in error I3C_ERROR_M2. Handle inside i3c_master_rstdaa_locked,
> checking cmd->err directly.

The commit message could use some explanation why the change
is being made, what it achieves in terms of preparing for the
later fix.

It should mention that there are 4 call sites of i3c_master_rstdaa_locked().
2 ignore the return value, and so need not be changed.
And the 2 in this patch.

Also, since this is a prerequisite for a bug fix, I would
suggest a fixes tag.

> 
> Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> ---
>  drivers/i3c/master.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 9e6be49bebb2..31822fd5ffde 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -1016,6 +1016,10 @@ static int i3c_master_rstdaa_locked(struct i3c_master_controller *master,
>  	ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
>  	i3c_ccc_cmd_dest_cleanup(&dest);
>  
> +	/* No active devices on the bus. */
> +	if (ret && cmd.err == I3C_ERROR_M2)
> +		ret = 0;
> +
>  	return ret;
>  }
>  
> @@ -1785,7 +1789,6 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
>   */
>  int i3c_master_do_daa_ext(struct i3c_master_controller *master, bool rstdaa)
>  {
> -	int rstret = 0;
>  	int ret;
>  
>  	ret = i3c_master_rpm_get(master);
> @@ -1795,9 +1798,9 @@ int i3c_master_do_daa_ext(struct i3c_master_controller *master, bool rstdaa)
>  	i3c_bus_maintenance_lock(&master->bus);
>  
>  	if (rstdaa) {
> -		rstret = i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
> -		if (rstret == I3C_ERROR_M2)
> -			rstret = 0;
> +		ret = i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
> +		if (ret)
> +			goto out;
>  	}
>  
>  	ret = master->ops->do_daa(master);
> @@ -1813,7 +1816,7 @@ int i3c_master_do_daa_ext(struct i3c_master_controller *master, bool rstdaa)
>  out:
>  	i3c_master_rpm_put(master);
>  
> -	return rstret ?: ret;
> +	return ret;
>  }
>  EXPORT_SYMBOL_GPL(i3c_master_do_daa_ext);
>  
> @@ -2093,7 +2096,7 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
>  	 * (assigned by the bootloader for example).
>  	 */
>  	ret = i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
> -	if (ret && ret != I3C_ERROR_M2)
> +	if (ret)
>  		goto err_bus_cleanup;
>  
>  	if (master->ops->set_speed) {
> 


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
