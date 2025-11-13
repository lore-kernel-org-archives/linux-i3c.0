Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE09CCD4F2F
	for <linux-i3c@archiver.kernel.org>; Thu, 13 Nov 2025 13:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=dKJNkAu/ekk92OG7WiK08AKdOMBwIkRXbHw3+o8qok0=; b=lwHE/AHw/kaCMxj6v8t7v65H7k
	oTDi7LCXcDta5/rFXMkHzo13WtmwX8fvlytZH+mWmVvutJ0rPoli8Oh/m64Ei9VwV4lmU4kTyltho
	ncntcGFntSsjqWBVjrD6byYYXsJOqDy3stw4s/pNPvJ8o6N4nDSMHzQSPWmMtZnvAi7wGVL5Asy0G
	337FFnJq3KfLhPxuwToWJJFhvPzSRtdkcgz4oYtlgV8TwLlrIVIURg2S1eWi2iySWnUDyyU5yBlCU
	iSfL3caRRRkZkvzEm1LadKaSUNPvBXNN6r55F6J47bdS2z+rvjQ5CckpfPXjEgz6cQZnVNedKNjIA
	/amTpACw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJXAu-0000000AWkp-2lLV;
	Thu, 13 Nov 2025 13:15:44 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJXAs-0000000AWkS-2EUq
	for linux-i3c@lists.infradead.org;
	Thu, 13 Nov 2025 13:15:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763039742; x=1794575742;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=fZnyXBpxkZWAxm0N7zzL5PjRdLAe4Z2gUyoEa/n7N9U=;
  b=Tp5dkVko1bJR3mqfq/QPkX0LFrcKtERstL/ah+eJAZz40zRWKr7iMDXa
   3yMU8xuhBXORtvUw4Ej40UkEWADTDxaEyB/RvVKNFW6jogAhMOY1A3FMY
   gutWqFOrPhIaSIecic1KJd00oGE9aveVaAl2yhecpnY4ywUI4L98cBIcu
   FcBxoaYAWv9ataF18zOl6DZtyhezVoNKbklrzM96b+g0vjgjPAvZCmejM
   bkvN2pfpUrcmKTIUyAskPHKU8jx7hoQHISf/05eaG3YdSKMql3av4qsfR
   fa0hnn3uaZLKgcOFgk9lIACNovSmvr8IWkwo2TlVpRO2LYLuIsjIIlwIC
   w==;
X-CSE-ConnectionGUID: jXCJbisPTGCaKSdCN4evPg==
X-CSE-MsgGUID: 397bdKMvSdaipGPlUebPLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65024218"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="65024218"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 05:15:41 -0800
X-CSE-ConnectionGUID: PuyBQkYnTmmEsu9Xo8wXJg==
X-CSE-MsgGUID: a45AbqfgSqOY/EJihoBc6g==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 05:15:41 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 05:15:41 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 13 Nov 2025 05:15:41 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.38)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 05:15:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZOngjKuNX932DQHusPniW15YPHfl/g+6x2vNO6bsMZ+xHMJkEcq+vL/4uK8u3kYpdk0K83WzElobE0UWYpl2uRloaDkQdLWATIAwBPkcrTFZhDu8zok/HP0ujtL5uL7FV9y+3EdKbJ8h7l+wDadMhyX/VmTNGvpvLVzuC74qmeaN4UCvpMHt7tNPh5N1/vJnf/PJGozN50SYtqmKsKQF5uVjJ+qiYlLLqyzutTlk3E9iQTc7QwRVop5nbiIdYI2YSVKNVAmALYtw7E1i16HXSMAloYrN19QG3XYp5XrjH1sghDNyp6iC3uiqv27B7AkCo4rMszXazdlrHtr+MmhN3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3S0E+b/LPGjImxKai+Xsp1QmTuaUojypVoFXyGpL4HM=;
 b=bZ+A1VdOdpjLnv3GQgZkfISnZwmQGe1kz3v2aQY2BUpEeZphl12uz2MthCGCaXWQsPUSlFXZ6jvEtOzQlLn2oJH1ZT7NQpBNS3m0fD1PDHC+WzUJ3TVTFkKRsOW34ZIpW0zNapqkgqVB+z29bf5Ez3h7V51ZXY0UxyE9eiJzAQTo/FqM7F2SETvvmpiBcPORxIfMnz9FgjAgX9s+oVyi9COdCfw3Ygp2TVlAsdYGRz/iIGLFuZP1lCtBESsCbrxAe2w7ujhbhHpQDA0s3Cbc84jJFixjf2G4LB0tKnweGLl3aOsMajupQyaTV3krNkirFpndGW1e4vGIJJ3nwMDWNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by IA1PR11MB8174.namprd11.prod.outlook.com (2603:10b6:208:450::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 13:15:38 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::eeac:69b0:1990:4905]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::eeac:69b0:1990:4905%7]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 13:15:38 +0000
Message-ID: <27b81657-56ed-4af4-a632-b234da7b4413@intel.com>
Date: Thu, 13 Nov 2025 15:15:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/13] i3c: mipi-i3c-hci-pci: Allocate a structure for
 mipi_i3c_hci_pci device information
To: Frank Li <Frank.li@nxp.com>
CC: <alexandre.belloni@bootlin.com>, <linux-i3c@lists.infradead.org>
References: <20251112100339.51726-1-adrian.hunter@intel.com>
 <20251112100339.51726-9-adrian.hunter@intel.com>
 <aRS4yBCoVJfecs4t@lizhi-Precision-Tower-5810>
 <2c4c5eee-9228-4790-9954-07e9e9ecfcde@intel.com>
 <aRTrSjchN8vbkhf8@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <aRTrSjchN8vbkhf8@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: LO6P123CA0004.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::11) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|IA1PR11MB8174:EE_
X-MS-Office365-Filtering-Correlation-Id: d6c5dde4-f5c6-4bc3-df4e-08de22b6bd26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TWFlYU1MM1d3V3RwcEs5c1FtZVlrSjdtNkpraWFlTEFya3orVnp2WSswdXhl?=
 =?utf-8?B?WE5tTFZMNmFCNUVXVExlTXRUTEdSUC91S2RXNFF4d3c5cG9iaE5keCtnMHc3?=
 =?utf-8?B?NngxNE5KaHRKSXdOMExCNjBIUVlHUUNRZThhMDk2ZjBvcmduK2FGcDVzWElQ?=
 =?utf-8?B?VGtVQmVJcHovdXM2Z0RTNlA5bEw4Y3k4b1p0YmlWYi9NS1ZNSFhCVlluSUtG?=
 =?utf-8?B?WjV3d21sMXpyYlpMb2RxcWNnK202cDlIVy92UkpVdU42Q1A5SGhOYytWdDBj?=
 =?utf-8?B?QW5keTR5R3NiS3kzbjh0Q3g2VGdCNTFqalZITG93STNXTHkvQW5PL0NzNXph?=
 =?utf-8?B?anBhMDhkanhXUFdNVThwUll5MHl2dVJEREFtUWU5SVF6cjZUb0Nub1hQWnBz?=
 =?utf-8?B?SDB0QUdtY2NTbXQvNUFnZzZMMzVhM1VMWVI2dTlvVWlhaU5EdWhJSUxUMHB1?=
 =?utf-8?B?U0pCVzRiYmNzU1BuYnNUU0N1Zzhqc0kxTGR6b1NXYlBYTWVaRGVFaEJWTENs?=
 =?utf-8?B?ajBlVUZRQjA4MlhhZjFDbFBFUFpPcnNONlNrSTU3S0tUSDlqM0dDekxwTWNV?=
 =?utf-8?B?a3QvYkgrQjl0THVtOTRxMG9lbitMUlpFNFNlV0VOWE9UR3BwaElyenlaVUx4?=
 =?utf-8?B?S1VYaTJ5ZkkxTzVjS0ttNmx2SnRGUTU0MDVpMGdaSHA2d1lOMlNGR0dKTk9u?=
 =?utf-8?B?WlZmcVJIa3RYM2hiRU1hTG5pRlJqU2lNRWp2b2NmZ0hUN3dSSWgxYWpmUzRn?=
 =?utf-8?B?Sld1NW5BWnZRNzRjeFlzUzlhMVNsc2sxaklkcGYxUmQ0Z3NORllHVWFzbkg2?=
 =?utf-8?B?ak8yekhka3l5dGdaYzMvL2pobjl6V0NpcjRUZDNtQnhGa2Nscng5MXB1T2Z1?=
 =?utf-8?B?K0xUUHU2OThjT245Z3RCSXdreHMwZW9mODdOUmkzR1FnT21Fb1NEOGliRzVl?=
 =?utf-8?B?RlZBZFVneDF3czVsS1VsMlB4aDErRkw3R2MrcitXNEpKVy9ORmJ3Q2RYalVV?=
 =?utf-8?B?MDJZanV6K3pFd2FrZEN3dHdtRm1Ha2tvZWVzRnBFQWVxTEdtV0VZalBNNzAw?=
 =?utf-8?B?VHlaSVhmK0FoQUlMK05kaUFMc0crOHlrVTFXdVdCNk0xS04yWTN1b3Y0SFM3?=
 =?utf-8?B?T213RTFEMHpUOUJhUlNLUEZiZzVVRUNxMW5hQXNzWjhlVWtXd1gwL1NiMXdI?=
 =?utf-8?B?Y1JOdmVzV3ZsT1VhOHdzckVoTmdFaWtRdnZUaVdBSUFuc2twakNEMUp5Z2dS?=
 =?utf-8?B?SXNwTEMwNzYwb29rWVBPd0lBQXFaSEpCMkVKZyt3UnNQd3RmL1llR1U1NGhs?=
 =?utf-8?B?RW1aemtWYVc2TGVwbTdlZjhWZ3JwTkpqOFlFSVRQTXM2T1IvQkdLUmFURGI5?=
 =?utf-8?B?T3JRa1haZUhjM0tsNGpWTGY5OG0zTVI5RmVLUXZjSmpDVUQweUFncWRTTTd0?=
 =?utf-8?B?cVJTM0QrSjVEdTE1a3ZoMFdCZ0JOaUZ2VmI5b3lodGRxVnBZQ3YyWjdIMXdv?=
 =?utf-8?B?R1VRT2NSZTh4eFBpUGNLdEtWNTBIV2NtV0x0eGo2OEc0alpEQ2hKSXd5dTZr?=
 =?utf-8?B?VmMvZXJIdGNuVmRqSXQwSkJ3cDlJQmJpZ3lQNVJqZHg4WlFoS0ExMG16U0Ns?=
 =?utf-8?B?bHpEcGU3ZVdYNGVhOGxwQVVOUjZsVlM2NC81N1NuNU96MHpFTUowWjlvTjRP?=
 =?utf-8?B?L1pVeWZhNHFaUjh0RGo3YjhnSk1ZTGdSNVNySzFlc3NGY1FtUzU1WW5YWHZJ?=
 =?utf-8?B?RTdMS2EyemRHUW1CR3FVVXBYL3VFT3VkYUFjQjB4bGFrVnEyYW43QXd4VGwz?=
 =?utf-8?B?L3JNOUQzUUxEUGhUNGZDSHo0V1R6UUNkR3Uwc0tjZHVqVlJpMWlINU5xMnhG?=
 =?utf-8?B?cTVWV1RoL2FHSTRQSk5lVlVFVU9VSUNDUklFY3ArVmNMWUpucFBsNDJHaktn?=
 =?utf-8?B?MFdBVTBpY3o5MDFjcWNFS2oyUjh4NTBqUmNvYS81N1Q2ZmxqdFU5MmM0SnBZ?=
 =?utf-8?B?QVJFaUVpdGFBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NE1HdklPSzgrVjAwMzJ3M21heElscEQ1a0JDY3FiL3RJTzlSUDBIWDMyenRQ?=
 =?utf-8?B?ZGJHTmxCUkJiczExSW4yVkFZcWVtb2Z0TWFEbzE3TG1JL1ZVU3ZwK0dUYVQ2?=
 =?utf-8?B?UUI4dUdGMnRPZ3JNc2V1dktNOXVaODdmR2RkTDN4M0l6Y2paQ096aTlLM0tR?=
 =?utf-8?B?MzRHU3plUWphM2lPRm5DOU1BTStlNzhGZUh0Qi9hc3ZsQTY4K3ZrTmsxbitk?=
 =?utf-8?B?WUxyTUgrbG93OTZiT3JWT2hVYUg5V1VvY2kyUUxPNitZRlNMbE42OEx5b2p2?=
 =?utf-8?B?a3czZnFGWmFNaGs5VUpXK1J5bGs0ZWhjYWkvYzV2ZnFhZURZUS8zWXJwZTFt?=
 =?utf-8?B?VFRCYUlUUFhEalVHSDkyMmtlem5qSmphWDJqTWZTWkFsNTJGeXBjSFhjS2Ra?=
 =?utf-8?B?SDd0K1VidWpHc0hrLzBSQXE1Q1JWN3kvcjJSNGRNRytBaWdqZTlOc3dHU1la?=
 =?utf-8?B?NGJDZVlONDIyL2xpdUl0YkVBQ1MzNVRISmhpeHpQbk5JOElETVdjcXZObldm?=
 =?utf-8?B?MUdram9HeDFyVk5kNFVMNDVMem1iUDRQU2JRUVErRWVEVWlJRERvN0xZZHhh?=
 =?utf-8?B?aGFrU1RSdDZuVFpJOGdBd3dBcHBlSlF2Y0cwNlgzY2RnMEtPWW85TERnYSth?=
 =?utf-8?B?QVJ1T1hueXdBM2FNWXNqdHAvekxHWGlYVFdrbHBlbXFIZDc3OHFJUGFCNk9i?=
 =?utf-8?B?MFViVnhUSkF0T0V6aDBWTGZpeW1tMi9nOVZ3azlUTmlVS29tTXc2Sm9FaUho?=
 =?utf-8?B?V1JOcWYzYW9NV0NpMXVUbEp0TFJXVnRaRkltOFVwUUY0Y041UURFbW41bXVO?=
 =?utf-8?B?TVBHQ0tiVUU2bEcza3NOeWE5ei8wanpVNEFTdlkyRXkvd3QwYkw2ekt1Yk9M?=
 =?utf-8?B?RUN3eHp2aS8vZFlpeVFRYTFMdWh6SkRzQmUvY1VteXllNDRjS2VrclV4dXhj?=
 =?utf-8?B?NEl4M0xQZ1ZCUW9wQTVjMHdXKzRrUlFrK0x3NGVCOFltODlicXMvdEM3QjFz?=
 =?utf-8?B?MG9oNjNqL1QzYTlUaXBLK21yMHc4cWFkV0hVVytYZ05EemdZZkNoVlExWlNC?=
 =?utf-8?B?cUtqekpkbEZoeUgrY2I5WUVhaFVLRDlONzE3bzQxTmE2UDlzbkl5OFBUU2hX?=
 =?utf-8?B?Rit5QmY0L1FRUWx1ZWRQUmsvdjdrL1I0ZVJJTEtsb1ZGL005OVh3K1pZb0N4?=
 =?utf-8?B?T3FjYlU0alNlUFFxQSsvcG02SGZMdE1kZ2xOdy96NVQ5WEhBNzUrV3d2K2tB?=
 =?utf-8?B?bTQybDNrTHBkZlRIMHd2MnhiTm0yamNwcnlJcTlYeUlYT2dCMDFHaGdxZFgy?=
 =?utf-8?B?UG9qYUg5empWUEtyYytrdjZFQkgwM3ErM1F2VjdaTmlWMUVGOWlyMkR3Nk9t?=
 =?utf-8?B?eGFYTGQ5anBmU0w1ZjFXMzdtOGhRYUVjdmZjd3FiamZJckU1SHRaSUVQUFMz?=
 =?utf-8?B?bjI4N2xuck55MUpUY2VueGYxU3IwZVBwQ2ZIRS82ai9mYlllQnJhSHQ5MEVD?=
 =?utf-8?B?OTZoT1JRcTltaDF0dTdMZHdTcE84bE9JanNPVW8yOWhDN2QrVk9kdFdXUlpl?=
 =?utf-8?B?c2gweDZUTVJnWDhWZVBzZ1F0L2JRK1lXeGZ0UWlFcW9DTzRKL1ZLQjJ4NWNY?=
 =?utf-8?B?cjdLMnpFbVNlSmQ2TW1wTmxzM0ZqQWlKUnE1Q0gwbXNOY3V2d3MrSHlVMTVC?=
 =?utf-8?B?Rm1BU2hUSnFPSTlpNXUyQldDRXFWWFQvQmRTblloakN2eldJNnMzbE1WLzFK?=
 =?utf-8?B?NDI4cXFXMHZuV3cvWXJ4UE90d3M4ZHBHYmZGaG4yckJhTzczUzV1MDRpUHZw?=
 =?utf-8?B?LzIyMU9ybS9oTUpEdnU4K3BISkZ1eFZJdFhUaHc3KzRnMnBoc3FaVDN1NjlD?=
 =?utf-8?B?ajNrOC83TVBoVWl0dmRSREl2QmNxR3RPVnZoNTk1M1MvV3BIa0RGUiszV0Ns?=
 =?utf-8?B?TXJKanhHRWNXOFVKbDduZ3Z2YU5wTTQrTVEyelBNclo3U3NnMERQTGxMWWx1?=
 =?utf-8?B?cStqQURHMDBMOVh3MUN1UU5NV1VSY1FhRGNnVVE4dFVaMEdoOFJrMGVhRE5p?=
 =?utf-8?B?VSsrdXJRNnZMNWJFWEY4MHExWmd1ZllyT0RySnVCUEJMOFV1OXM5Skw0NGQ4?=
 =?utf-8?B?bG4vZWErbFRoT1hta0pHMm1EUVFKZU50NUNjM0VBeTgrQzU1WDMxQXkxdUZl?=
 =?utf-8?B?Wmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d6c5dde4-f5c6-4bc3-df4e-08de22b6bd26
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 13:15:38.8033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2OsnxIw5NCDxGs2pUdFa6moGLkiHCM6eDMR4Ji+6kAPZZqsPrTyUQt0PCGREuEU3db8F1udlrqTE8PIkHc0wUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8174
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_051542_645700_3C6A054C 
X-CRM114-Status: GOOD (  21.99  )
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

On 12/11/2025 22:17, Frank Li wrote:
> On Wed, Nov 12, 2025 at 09:25:14PM +0200, Adrian Hunter wrote:
>> On 12/11/2025 18:41, Frank Li wrote:
>>> On Wed, Nov 12, 2025 at 12:03:34PM +0200, Adrian Hunter wrote:
>>>> Allocate a structure for mipi_i3c_hci_pci device information, in
>>>> preparation for additional changes that need to store mipi_i3c_hci_pci
>>>> device-specific information.
>>>>
>>>> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
>>>> ---
>>>>  .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    | 29 ++++++++++++-------
>>>>  1 file changed, 19 insertions(+), 10 deletions(-)
>>>>
>>>> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
>>>> index b3b6b6f43af2..9fa89af7479f 100644
>>>> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
>>>> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
>>>> @@ -14,6 +14,10 @@
>>>>  #include <linux/pci.h>
>>>>  #include <linux/platform_device.h>
>>>>
>>>> +struct mipi_i3c_hci_pci {
>>>> +	struct platform_device *pdev;
>>>> +};
>>>> +
>>>
>>> Is it simpler by using platform_device_register_data(), pass down platform
>>> related information by void *data?
>>
>> No, this is just a normal allocated structure for the PCI driver
>> (mipi_i3c_hci_pci) to put information related to the PCI device.
>> It is later used to store the current Latency Tolerance Reporting (LTR)
>> register values.
> 
> Is it static value, or does it change after boot in other words?

Dynamic

> 
>>
>> So it is not the same thing as platform_data.
> 
> Base on your code to create platform data is duplicate what's did by
> platform_device_register_data().

It is not platform data

> 
> The pci device create platform devices,  platform driver should not use
> pci's information directly. platform driver should be reused if it probe
> from acpi or dt-tree.
> 
> I think it'd better pass down platform data information, which can include
> callback to fetch needed information for difference's parent devices.

PCI Latency Tolerance Reporting (LTR) has nothing to do with I3C
or the platform device, so it does not belong in the platform driver.

> 
> Frank
> 
>>
>>>
>>> Frank
>>>>  struct mipi_i3c_hci_pci_info {
>>>>  	int (*init)(struct pci_dev *pci);
>>>>  };
>>>> @@ -71,10 +75,14 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>>>>  				  const struct pci_device_id *id)
>>>>  {
>>>>  	const struct mipi_i3c_hci_pci_info *info;
>>>> -	struct platform_device *pdev;
>>>> +	struct mipi_i3c_hci_pci *hci;
>>>>  	struct resource res[2];
>>>>  	int dev_id, ret;
>>>>
>>>> +	hci = devm_kzalloc(&pci->dev, sizeof(*hci), GFP_KERNEL);
>>>> +	if (!hci)
>>>> +		return -ENOMEM;
>>>> +
>>>>  	ret = pcim_enable_device(pci);
>>>>  	if (ret)
>>>>  		return ret;
>>>> @@ -95,14 +103,14 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>>>>  	if (dev_id < 0)
>>>>  		return dev_id;
>>>>
>>>> -	pdev = platform_device_alloc("mipi-i3c-hci", dev_id);
>>>> -	if (!pdev)
>>>> +	hci->pdev = platform_device_alloc("mipi-i3c-hci", dev_id);
>>>> +	if (!hci->pdev)
>>>>  		return -ENOMEM;
>>>>
>>>> -	pdev->dev.parent = &pci->dev;
>>>> -	device_set_node(&pdev->dev, dev_fwnode(&pci->dev));
>>>> +	hci->pdev->dev.parent = &pci->dev;
>>>> +	device_set_node(&hci->pdev->dev, dev_fwnode(&pci->dev));
>>>>
>>>> -	ret = platform_device_add_resources(pdev, res, ARRAY_SIZE(res));
>>>> +	ret = platform_device_add_resources(hci->pdev, res, ARRAY_SIZE(res));
>>>>  	if (ret)
>>>>  		goto err;
>>>>
>>>> @@ -113,23 +121,24 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>>>>  			goto err;
>>>>  	}
>>>>
>>>> -	ret = platform_device_add(pdev);
>>>> +	ret = platform_device_add(hci->pdev);
>>>>  	if (ret)
>>>>  		goto err;
>>>>
>>>> -	pci_set_drvdata(pci, pdev);
>>>> +	pci_set_drvdata(pci, hci);
>>>>
>>>>  	return 0;
>>>>
>>>>  err:
>>>> -	platform_device_put(pdev);
>>>> +	platform_device_put(hci->pdev);
>>>>  	ida_free(&mipi_i3c_hci_pci_ida, dev_id);
>>>>  	return ret;
>>>>  }
>>>>
>>>>  static void mipi_i3c_hci_pci_remove(struct pci_dev *pci)
>>>>  {
>>>> -	struct platform_device *pdev = pci_get_drvdata(pci);
>>>> +	struct mipi_i3c_hci_pci *hci = pci_get_drvdata(pci);
>>>> +	struct platform_device *pdev = hci->pdev;
>>>>  	int dev_id = pdev->id;
>>>>
>>>>  	platform_device_unregister(pdev);
>>>> --
>>>> 2.51.0
>>>>
>>>>
>>>> --
>>>> linux-i3c mailing list
>>>> linux-i3c@lists.infradead.org
>>>> http://lists.infradead.org/mailman/listinfo/linux-i3c
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
