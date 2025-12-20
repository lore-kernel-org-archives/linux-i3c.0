Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B40D7E668B4
	for <linux-i3c@archiver.kernel.org>; Sat, 20 Dec 2025 14:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=COlRja4DgVK/hszsPB2i8Rd8Rj5d8MdvQ8xTnaGN4+Y=; b=ucPQgwYxjf/9PbfjNcyEJmqXIS
	1c27DGgAjqN7M0BVAfhE/wLY5z17WpTDVtSkaoyB+3+3/tXUvCuSP/2+Gb7rP07pp7WkdnYi1Azex
	S962DOE8rvMM+Xp38KZRIObs1woIbhUolSVOKsdjGkBC6XP4rFuxaw8NA55oH6ANkrlUGNqFvN3xj
	2WNLzCuLp03/DulU1HKRKg9HAUhli/ek5i8UIt54miEG8vsbOfGP2u3lkUKFnE3K02fWPv/paHQ9P
	tLnVhCCegAjpsLREnbIRuVoB7XvBZiqNN2haAlOTG2ihuRUH81vwG1FdCoZWly9gYECv98GYCzPu9
	eo+wz50Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWyIK-0000000BfPQ-1uuy;
	Sat, 20 Dec 2025 14:50:56 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWyII-0000000BfOy-2MAc
	for linux-i3c@lists.infradead.org;
	Sat, 20 Dec 2025 14:50:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766242254; x=1797778254;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Vx1cMkFX/vZPatqBtmZhMBCZdA3HiPRfXW/cs7SRfNE=;
  b=hMnA+XhBByukoxEA6R/Q2O6kLgKxx0iPfgy9dX5WFJVXRaq0FAlsHyvQ
   4GIgwb1FjvhjLN2LC+wt4V8X2C/68cllt+RYzhXqzHH6tbklCRFYnbra1
   NxydpXydGd9Qzu3S7U1rV5yAOyaxDGbsCUEBZSc1YTUeWVROhjidR+2Da
   yTdUmGjr7+ZQP40KaAdbW7Rc+UmNwZ0dTRPZdS3YV/YCJNtmqo9gJGWPD
   n+fmz8FCnUMr24jkUjSAaX9qjq9LqMeF0Ic6cgmWIxrwL85X601+qZh3C
   LWQtfhUT9Qpdp75ezYa3ICTXL3KxWdEne9M8t32no3gDK05LelqX6pxPd
   g==;
X-CSE-ConnectionGUID: I9XGJcjbSTWVA1EWoJxYaQ==
X-CSE-MsgGUID: KmbuIy9ETGOEBsxlmmleLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="68253934"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="68253934"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 06:50:53 -0800
X-CSE-ConnectionGUID: ylq6XhsgThS6ALPvbrJQSw==
X-CSE-MsgGUID: qpteIzvpQCmYaJhPLaOukA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="204175939"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 06:50:52 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 20 Dec 2025 06:50:51 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sat, 20 Dec 2025 06:50:51 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.49)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 20 Dec 2025 06:50:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yTs0vYs3sZhhjz0mJtgHo82HjkfGNNYH3yd15xSbzOW97YGuhu+7mYqrNHoJOJUp/HSDu86YlDDbMVMGyjuE0yYY5Q2KehP8OIuYw1ExGfCZp2MJ5e5hxCKlGnghdanqMrduWJw+Ti7CVPgT/qkquyBXCjd/10z8u+6D+etZtsEgjMjg9NzeX5KVEQ/xOt90lSzio2RsOurn9x4zWiJjg+BvWB/e6RyDMR+Jt4C/OR7nZlqwcD+ZaQHEErLWzyaQaVsNXmQClmkJcymmJdlexYjtJ0ml2X+nDlUFZZrsN0bMW/1f08ASO8Tz0N/Qm2pzD7Jt/QW9CLpbTLgcjya85g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r/8oS8p9Nmp79mnRp8gt4NkXIzSYY+8Wvj8jwgX5qzE=;
 b=gOXOnUAxt+9hmULmKdpF948iHDrMAfw/opEuGfTO/jXJf9oZv6G4HnQrR+HEOSvMYosdFpoNPF7+iwcp4fYNo2Ur4MGkbHWjBgPLBczflkF95WiL3LYcw3iTIBYJ+qj4+tBRD/VJt2qP5dhvSIHb0jp0AkufgIexSShSGh23lsGIvQdTaMdso/gxXzseheQCk5QIcok4qstbzsFGtlI+z76mj+GK/Ex3Jr7yjXLQSY2KOdDgie2/axzeGsXeU+kfufloKSvzEPJKGC39bTeFuHn/QnFgta9T7XkiUeR2iyIr4YXBtgUxtaOzVHEwIjv0Kha5godwwjAkwImDs3XELA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by SA3PR11MB7655.namprd11.prod.outlook.com (2603:10b6:806:307::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Sat, 20 Dec
 2025 14:50:44 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9434.009; Sat, 20 Dec 2025
 14:50:44 +0000
Message-ID: <a9d2b023-46c7-4dba-b453-2e82948188e7@intel.com>
Date: Sat, 20 Dec 2025 16:50:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/17] i3c: master: Introduce optional Runtime PM support
To: Frank Li <Frank.li@nxp.com>
CC: <alexandre.belloni@bootlin.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Aniket <aniketmaurya@google.com>,
	<linux-i3c@lists.infradead.org>, <miquel.raynal@bootlin.com>
References: <20251219144534.84391-1-adrian.hunter@intel.com>
 <20251219144534.84391-16-adrian.hunter@intel.com>
 <aUWGhscb+6ZYRhzx@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <aUWGhscb+6ZYRhzx@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: LO2P265CA0258.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::30) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|SA3PR11MB7655:EE_
X-MS-Office365-Filtering-Correlation-Id: aeda1fff-171f-416a-735f-08de3fd72761
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QUhKbHF6enFsekpXQmtQOEl4aktHM1dMOGhrc24yanN5VkRzNnZ4ME8zMG5z?=
 =?utf-8?B?aEtXT3RMajZLZU45OUUxcmpnL1RoZUtrWTNOL0J1NjJUS3cwNzliNC9IWjBu?=
 =?utf-8?B?dkIzYzVDRVJRcnU1VXN3OWpEVUhvS21vclRyZEw2cVlNMGNMQjVDTUVlSDh5?=
 =?utf-8?B?RVp6bFJkUGFIUmpwbGN2cXdxdFJXaU8xQS9xVmZYbjJINjJ2bTFuODRONCsz?=
 =?utf-8?B?S2d4MnVKQ3QvQzZSRVFLOXFFcXNVeEl2dlhjOUE0ZERsMGZYYVZ6U3YxWlBW?=
 =?utf-8?B?QUxUTlNwc3M0Z0ZaQllicm54UDBFL2xLQkQxODJNT1Q4Z3pZSXhBR3FoOXd6?=
 =?utf-8?B?cmlyLzgzWWNQTDdhWDhuMWtCUVhlMm4vcXowakJTSnN5VWYxSThpMVJQT3Ex?=
 =?utf-8?B?SGFuM1QzdGU5bm5UdFV4ODV4eFc1dnlmdzU4NFpsVVlnYWMwamIvT3Z1MXFP?=
 =?utf-8?B?UHBHL3NiYjk4aHZ0bDB1R1lhWW44QkxPSWI2VWZ2TnR2SXp6V2EwU0FWMEhB?=
 =?utf-8?B?NzJ0WHhTOW9zSkpyNVh3UW5iZ3o4TjdGN3hYWnNXWHh0UU5mNTRJYVM3L3dw?=
 =?utf-8?B?bHFlby82UmEyR3VnTlRxNVhuMGRvVVAwa3UrUGJ1RGdUWm14Lys2STNjZ3lN?=
 =?utf-8?B?Vlc4M1djTHRueExPUW83eElqdFR4c2Z3dVZlZ3hvQ0p0TDlmcWUyYWtGQUdn?=
 =?utf-8?B?a2tzcHg4WkVTclJYaTdnOGJzWGhlbjZ6blRqVi9YN0RBS2k0Tkl5SnFScjNa?=
 =?utf-8?B?S3lqYVZFcStkWS9zalpYOCtqU1J1eGFUL3NnZDlOQndPbmcvSm1OeHdISFAr?=
 =?utf-8?B?UnAyemU4TWhFRTZzeWVsVEk0ekFxRG1qczFreG5SWXNXWTlCNDlGbEFhSk5z?=
 =?utf-8?B?d2lJVExLVHhEUFVRelY5bUxUV09zdWIrazVmdEkzaXJDWnRDWHZjUFpwTWdX?=
 =?utf-8?B?V0VhOTEyS21ISU1TUWMvYmVMaXc4dXNyaWcrWFRqRmE2WlJZT3FIeDNQbktD?=
 =?utf-8?B?bG9UalNQUmJWUHZMSURxQ1h2MHk4NWdsZ2dFWkIvakRienpKNG1kM3dJeFBz?=
 =?utf-8?B?aUVGK1lOUGxBR2pMZWlpcXJzRndyQ2orbHFpUE1DTjd5TW5aM29iNXd4U252?=
 =?utf-8?B?SkNDL243NWt6Z1l2aStNQkdWb1NocE45ZThpdi8yOVdReTgzV0U3Yml6OGlz?=
 =?utf-8?B?RkMzK2szSWVMSkRrMnpjallReVluWGJXYTltWG9aaVVTeHZ3NUlLdFhNMTN5?=
 =?utf-8?B?U3gyNjhIMDVLek5BWTNWYlZKMVFlS0J1aVRicTljczQzTzh3R1VxMjRjQUF3?=
 =?utf-8?B?SVFtdmwrN2wyWVBLVDlpNnN5V01LZVZrSnJDRmN3WGRrLzFKcjl4Znk1bE9j?=
 =?utf-8?B?M3pyT0JZWHNzUGNTK0IxNENNSXE0WEQ0anNPbHZPR2JRNVRHTHc5TzJpZTRi?=
 =?utf-8?B?anZ4Zk51dEs0TUM0NWlSb0lxMWp3R0JTay9Eb3oyNHByc3Nub3NITFJUMmlY?=
 =?utf-8?B?MnVnb1htVFltTFhKU1NQakVnWVpvQ1hldUIrYWY0ditWZkJiNFRibkhCUWJB?=
 =?utf-8?B?Q2NOd0J4ZU1USUhrM2svUzRtRGlUR2xyclpsZXB0eTE3MDYrYXZHVWdwU2p1?=
 =?utf-8?B?aS9qRmEwZ0wvNkFGNFRkVU5ySlRPVEJ2Q1IreUdyODJRNTJkMmd5MFlYb0xG?=
 =?utf-8?B?OWFGaDE0S0VoZWc1endNaERtNVVvdFRlcFB3QVdyRlRkS0VZM0Q5ajZXUXNZ?=
 =?utf-8?B?SjF3WUpGZzFlQnlNWmlSMWVRTFIwd0cvVmFFSXhRSXYwdmdkaTNJcjNxenZK?=
 =?utf-8?B?akFScXUxNG16SjlDeDRySmRkb0dkaTl0d0s2VnRTZ3QwdCs1c0VpcUlJZitQ?=
 =?utf-8?B?K1hqYVVPKy9RTlFFaU15eG1PQXdPYkswdEFERDA4cjYxem5wK0dJSWVmOXd6?=
 =?utf-8?Q?USLpRRnGxLIHZyWFwXZB8GlUQblsJCrt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WU1oWXFPMzJtSHNPK2RtK1E3bHlHNDFpeE9DbzJuaXRwZTJXYUZNL0FUaEhB?=
 =?utf-8?B?UkNBNEFOZS9pMXI0ekZKWUdDYlQ5bXRkRXViRUhNVTE4Ly9nbGpBZ0tadUtJ?=
 =?utf-8?B?TzBGNEhrcCs2WnR0ZGRJclBCSzVLRzFwMTNRdTUxYWFSOWRMVis0K3RmTG5w?=
 =?utf-8?B?UFF1WG1MbFFidlFuSVJpdlFFdUlTcW9uVk5WOFRTMWpwdlA4czlZV25iRWdl?=
 =?utf-8?B?R3lFU1ZaZXZaeWhyQ3hOWFVYcEYrM0JDeVU1WUtXanRDR1N0SmxXd3ZaaUQ2?=
 =?utf-8?B?SitQZTFTWnVjOXFpZHRvV0JtNzhHTE5MTjAwYnZ1QncwSmRIZU9hZ2Z1ekNM?=
 =?utf-8?B?eHJsT3RzVW5SbWxBSFk2L1NVVS9kRE5oWjZ5d1FtMHRtZHdBTldHYlFiZXJi?=
 =?utf-8?B?ZlZnL2RkNjN1azFRdzNnR2syN21WYmZ6SWFVUmVxbEVsNHdIY2k2c1pMU2hn?=
 =?utf-8?B?Y2VMOXJWUEllUG5oS0ZTZnBycHBoWHc5VW93Qy9JLzZjZFV3RFJ0UmJKWmJh?=
 =?utf-8?B?YlhPaytCK2VGSzRFNVphMlVDUUhBazl6RXI4NFFpTE4vMGkwSDhKQzk5ZUFN?=
 =?utf-8?B?ZHlaTThRNENza29hUDJ3QjhrYU56Q0taOW9HV1lGemJBR2wxTFJ5VkJHZFAv?=
 =?utf-8?B?WFRMS1BacWZ5WkFuK0ZGTjlSdDREbDJlUjE3NDZSRDgyV2R1MjBPS2h4eWd5?=
 =?utf-8?B?eUE1MW1rRjN4cmFnRFlQbEEwdzI1QVZkK0pYOWZreGxyVmE2UEhSdzlmMlJT?=
 =?utf-8?B?clRiQjh4U2VTN01oV2JJVmcwK3p0NFRyUGROKzRsb3NqUGhlYmkxczVyRkcx?=
 =?utf-8?B?eTNKTzJhMWg3RjRpR1FxUUYrUXAwVlRNN3hDbmVVS2VkUnllamMrS0FEc0VW?=
 =?utf-8?B?SGU2ZjV1eU44Q3FGQW05VjYyc1ZzNytJQVZHS0gvUUVXVk9nUTBZcUJaeTN6?=
 =?utf-8?B?OHRjL3ljaUxsS21lb3kvb0dFM01FejFPd0o3akllcllVUnlhQ0p2czlGcUlx?=
 =?utf-8?B?VTVybC9Xc1BTbW1YZGJhSnVzVkhTeFlzS2RCZzFTUG0zUFlPS3o5U1R2RlhF?=
 =?utf-8?B?dHlmdmR5TjRINUs3cTQvMnVuZXZZVDNwcWtrWUM0NHZMTStETitqRjZGUHQv?=
 =?utf-8?B?TmdlUzdjN3p1MEpQVmM1QzdTQXNtOE5yZTAyV2NrR1huektod3RtL21Kc3Qz?=
 =?utf-8?B?MlFLcDVSMWV6Qnk0OGVwWjErOXFZYWhiZlpmWkxjWENBaUZBZ3VDd213djFH?=
 =?utf-8?B?bU5uTHZjSHF1WlhWQ0xDMWljajdwS1llWUV5cGZDVCswR0pUTThrbUNBYnJX?=
 =?utf-8?B?Y25HSHlFRmxvMElzUkZzZGNScW9HRFF5aDRZbW05RTZacDJrY0dXSTJ0ZXhq?=
 =?utf-8?B?UW0xN2tNVkpkTWYxSW5oKy9tOVowcEJuT2NiTGpMMUJSTW02MDZxTXdQQUdZ?=
 =?utf-8?B?S1JXUWVVZlBleUlEQjYzMGh5V0tsenBqS2lXaW1ZZTU4WGpJakRIQVFaZjBt?=
 =?utf-8?B?WWI1TjU5L1UwdWZteVlJK1p0L1pQcUN6SmErUzd3WlFMVEY0T0I3TG5YL2Qr?=
 =?utf-8?B?RU1BYWRaTm4zd3RBS3VnNCtBSDZyOUxIRm5wN2hGUGRUdlkrejIwRnowQmV6?=
 =?utf-8?B?bmNIenN6RFNDdm84dHVpVkRwUHl3cS9qMVpQZGZqS0NVaSt3OEI0RU1jSlpI?=
 =?utf-8?B?SGY4cVQraWMwNVBScFRvd0RzaDBwUy9wRmlsdkZMZktla0hhT1RzK1dZZmk1?=
 =?utf-8?B?VWtnUXpIK2dJcG8yRm9vV1Vjdm5OYWloeHJNYlNBc1d0UWpKQkpHaWRpdzcv?=
 =?utf-8?B?VStMd1pZdXdWYXR6eFhKcEFvcldCMDhhUWpWOVRlTnlvQWNKb09iWnRVZlVm?=
 =?utf-8?B?ZTBEWGNjLzRuMXpCbWFDRVl4Nmt6LzlMakJmZ2hUWmluVEQ3YzR3eittdWF0?=
 =?utf-8?B?SmtvZE5ESDVwMTR6NkpMbC9xclhsQlJpd2NKQ3UwWHVhaitCcThWZE5yQXRF?=
 =?utf-8?B?SXBib0syanNkNEJieTZqRmFFTDA3bzdaSTc1aWxpRkVqY3NuYlB0SWdLMlJ4?=
 =?utf-8?B?Ylp4U3ZzN1o3bVRNWDVLb0FINDBZcmJqeHhtUjRpeWRLbFBwK2hYa2dPU3dE?=
 =?utf-8?B?Y2h5Qjl1aVZsQnZ4RjdGV0NBYURIdXVRUlMyQ0hqSEV6eUI4VHNWUDhvYWVE?=
 =?utf-8?B?N2RTenB0Q2tDVEVCK2tqbXlKZWcxSGV0SFpwMkNkcVZKVG1NMTNxQ3F5cHZC?=
 =?utf-8?B?bFNTUW4vQVgzYlF6b0duTGlpKzNTVFRDdTZLUTdncmh1YVI0NHZQZ3FvREFq?=
 =?utf-8?B?NVpZMDVnZEsyTHhUU29uaEZ3dGFNU1hieXBOdVJrTWpjc0VQOE11QT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aeda1fff-171f-416a-735f-08de3fd72761
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2025 14:50:44.6349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 96idyex53dhbwk9ApxSJFK3SpigKvzaRSfLmMK+ULLor0DPjkDd9OQh3EPFXdge1CFnzieOOy3gtIV8E0fgyNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7655
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251220_065054_699696_3C35C832 
X-CRM114-Status: GOOD (  16.13  )
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

On 19/12/2025 19:08, Frank Li wrote:
> On Fri, Dec 19, 2025 at 04:45:32PM +0200, Adrian Hunter wrote:
>> Master drivers currently manage Runtime PM individually, but all require
>> runtime resume for bus operations.  This can be centralized in common code.
>>
>> Add optional Runtime PM support to ensure the parent device is runtime
>> resumed before bus operations and auto-suspended afterward.
>>
>> Notably, do not call ->bus_cleanup() if runtime resume fails.  Master
>> drivers that opt-in to core runtime PM support must take that into account.
>>
>> Also provide an option to allow IBIs and hot-joins while runtime suspended.
>>
>> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
>> ---
>>  drivers/i3c/device.c       | 46 +++++++++++++++++--
>>  drivers/i3c/internals.h    |  4 ++
>>  drivers/i3c/master.c       | 93 +++++++++++++++++++++++++++++++++++---
>>  include/linux/i3c/master.h |  4 ++
>>  4 files changed, 138 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
>> index 8a156f5ad692..101eaa77de68 100644
>> --- a/drivers/i3c/device.c
>> +++ b/drivers/i3c/device.c
>> @@ -46,10 +46,16 @@ int i3c_device_do_xfers(struct i3c_device *dev, struct i3c_xfer *xfers,
>>  			return -EINVAL;
>>  	}
>>
>> +	ret = i3c_bus_rpm_get(dev->bus);
> 
> Is it i3c_bus_rpm_get(dev)?  dev->bus is parent of dev. in case i3c
> periphal need enable clock or other run time pm enable call back?
> 
>> +	if (ret)
>> +		return ret;
>> +
>>  	i3c_bus_normaluse_lock(dev->bus);
>>  	ret = i3c_dev_do_xfers_locked(dev->desc, xfers, nxfers, mode);
>>  	i3c_bus_normaluse_unlock(dev->bus);
>>
>> +	i3c_bus_rpm_put(dev->bus);
>> +
>>  	return ret;
>>  }
> ...
>>
>> +static int __must_check i3c_master_rpm_get(struct i3c_master_controller *master)
>> +{
>> +	int ret = master->rpm_allowed ? pm_runtime_resume_and_get(master->dev.parent) : 0;
> 
> I think rpm_allowed is not necessary. If don't allow rpm,  i3c bus driver
> should disable runtime_pm.
> 
> I remember pm_runtime_resume_and_get() do nothing if runtime_pm disabled
> (need double check).

Yes that would be OK for drivers that do not enable runtime PM,
but the drivers that do enable runtime PM (i.e. dw-i3c-master.c
and svc-i3c-master.c) might be affected.


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
