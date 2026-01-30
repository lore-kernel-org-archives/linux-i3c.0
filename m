Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55CB6E6BF2A
	for <linux-i3c@archiver.kernel.org>; Fri, 30 Jan 2026 16:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=AT7uXAy2HljTM8OXhJIlnjSMp3FZbqo811+9E6/m8OY=; b=GEf5LeIAerdl/vai6UJBWyPkMc
	/+wWP8InqB/DajamYzFeItXS7SHo/BwctDx3uRJeLWewoYc11u4yVot35t5OsOgbkpIPm8TnX0BVT
	c1tO13KoqfwcGONbqVHV8+XYhMBDOFPmpba6j3O+CVIyyFZqkI3i4CdxXG7bX5yIYfZMXoEJc1c5J
	GZzh/H0Bb/xR6vlnOjLthbfReNy1/eITY220Bu1QWXon+TNazFdVphdb4Acjj8Yz+C7KGPPyNbC+m
	qBtlnbT4k1PG9ts3Oq+MyhyzS9c3UuiLayHsDQKU45CNDnrxsxENOlurcTB6ljKxrO2CmPFEtWurn
	Rs9OvMog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlrSM-00000001isK-0Fcp;
	Fri, 30 Jan 2026 16:34:50 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlrSJ-00000001irx-13Hm
	for linux-i3c@lists.infradead.org;
	Fri, 30 Jan 2026 16:34:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769790887; x=1801326887;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=9oJ773esYT2UpbPh3JKpSwryV712f+y+FyFKvCGfXbI=;
  b=P2liBTOuZ520NiGZ9mGex+QtgOve3VDQVxJQchG8Pmrs1pbgWrOIoZ8R
   YotbzH/klYequUxqZUHQbQAlnrKkmaZvgOScEOsmrAJ09Zpn94zr9+P2f
   vA6syFucUyLPQKmfzms+peSeduSNh4I6a5lypJ4PAgVZ5CPy0YJIA7tms
   8RQempcFe1f3TBYAb46Xl97r9Yrs/DbCv5m6HjLuoqe/hjyVwk5um5a6W
   Wqen6SpItbnKqFmE9jJVIvaaKQGCv0H73QQqbLO4PJn9MDqCHEYZNSReT
   Otx3TUj8Ph+YGNs0eeVLtzI8mW+28UNymA73+i0S9+LfTbi6RC8QvFtU6
   g==;
X-CSE-ConnectionGUID: udlRxp2+Ry6IkqUpTxU9Xg==
X-CSE-MsgGUID: jAe1MukzQHSlUgQ9eivaJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="74666619"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; 
   d="scan'208";a="74666619"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 08:34:46 -0800
X-CSE-ConnectionGUID: 2ajle16CTIu4ddLIynbAcA==
X-CSE-MsgGUID: QwjLKBo6R0CaBLpUvmalhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; 
   d="scan'208";a="213789819"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 08:34:45 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 08:34:44 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 30 Jan 2026 08:34:44 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.22)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 08:34:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jMbkx0ZdsVzO5zjjKtJPUdThL0O2TCGJICu+hR7QijWf634g4N739OvXRd5yLfHjiAtVJNzSrLhYoVICzrso6EnFtOUugkVJEDCBvUIKJtsD+CHzRDrBDnED+RPFswc+NTVYzGZZcr8Ixq5tRdIwV8XrRJ+uGAiZ88V5YA/9r2DWxPB/1FYfhUIBYYwcQGGaqLYO38r0oBbUGRFBOXBYf60PeCCgt2QxDx+DbGbq6SVqSC/yw7v2mWWLPlSFKerEhz/mgcV639WMrOSkby2XX2qqO94E/Se7LnXeaAGoVPLhe5AdYBmItRoP9K3OBoATpAUWoRbERFn6XZeCYenwRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/9ge7XVFIbmjJwqWsIPCi6NXeH+QsX6Yim+Yn3bxcEQ=;
 b=fHG7aHl/Xn6akh7H5x47YXaGGB6AVmfUEdZS06qnNjiHwzW5DlzAyZ4SahV8tBFo0VercEg9h80SikPA6Ntm0ztUuWzk3ubVPOPZ3/a6Yltdv9ILopKvHhmmsZcs7qsXxRf7QyHJZuu01755yFcvOZzXukwb7jFWIPPo8bxOjVJlaXxmIRH+LNYGUF8yGVb6xJE0WEDoAMC+x5adID8vTXlShuQfZEiDmXvVfxWJRzDK6QSQ+R9ZXU0ni4jpA6My+52X/bG0jPHQ8lpJNmbOYep51zsTfvf+0e4hCtSI4gFOfNAeCjLFy2SBtYwS54pm/7JAOSQhSCTLlA+FhYrxtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by SA1PR11MB6893.namprd11.prod.outlook.com (2603:10b6:806:2b4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.12; Fri, 30 Jan
 2026 16:34:41 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 16:34:41 +0000
Message-ID: <09622627-2ff3-4fb7-80f2-686d6474e417@intel.com>
Date: Fri, 30 Jan 2026 18:34:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] i3c: mipi-i3c-hci: Allow parent to manage runtime PM
To: Frank Li <Frank.li@nxp.com>
CC: <alexandre.belloni@bootlin.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>
References: <20260129181841.130864-1-adrian.hunter@intel.com>
 <20260129181841.130864-6-adrian.hunter@intel.com>
 <aXu8TiFpMiIVk5Iq@lizhi-Precision-Tower-5810>
 <dd681a97-de37-436b-b09e-5173c1de2f24@intel.com>
 <aXvKZK8tTnCDGzth@lizhi-Precision-Tower-5810>
 <a8a608c8-c6ce-415b-ac02-db1246edb15e@intel.com>
 <aXzIeLLDxsmzUhI+@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <aXzIeLLDxsmzUhI+@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: DU7P195CA0001.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:54d::15) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|SA1PR11MB6893:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f20a2d7-0460-46bb-e514-08de601d77de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WjU0bW5nbEZWdVJ1RVF5a3kwNHRwaFdabGsvRG9SQ0c0K2VOZG0rbXBSYnNU?=
 =?utf-8?B?TllCYkE3aklaUjVhRUNvRzlwM2E3Y29aMEVrRWNCWUkrN0twdHZHcGNiNGdZ?=
 =?utf-8?B?YTVRTzBxN3RZUDRNTWlxQXFDczByNzZHZXY5aEViUVU2R21KbmhTNFFrb2ZY?=
 =?utf-8?B?R1FlMTlWbjE4TXZsbWRxMTNhWVRHWm96Q1BrSVpQejVOYVZoVVF0WFQ0MmFO?=
 =?utf-8?B?cEpHMjVVdmxxYXNiZkQvaGlRRlRUeXpYSWJBSjNHRUZXd2FCdmJxU3JqSlJZ?=
 =?utf-8?B?QnJuT0x2bmkvbm9YV2kwQWJlTXhmZ2tTcHBraml2UDR6VkNSY2VsNGx0Vkc3?=
 =?utf-8?B?elNEUVJLTWNGcXRreHBNWVR2VFVPbnRrK1JvNi9GOVU4VUNPK0I2WU9Ec3V5?=
 =?utf-8?B?Q2JYYlkxRkkrVzMvZGorL09VcU5qaDR5cENoN0ZZUEJmaVBlalJRU0Y1elNK?=
 =?utf-8?B?cmxzVHN4RitqTGs3TWRlTjVlVmEwSEFrWldTb1l3dW5YaHpqcEw1ejlUOTZM?=
 =?utf-8?B?L1NQUnoxZ3p3eisrOHlBUGh1TFc4bVZCYnpLN1lsUFhnTG16U1p2Zjh1eEFy?=
 =?utf-8?B?T3RwNUMrR2ovRFRwR0c5YllCamwyL21MT295ZGowa21pclpISVVBRFhyZlRX?=
 =?utf-8?B?eG4rekl0REtLcG1aTXlTQzdzRlhJaVMvKzZqVlhLbkhNeXZWYnZjNmwyZ0tR?=
 =?utf-8?B?UGU3cVRwWXR4S2ZUTWF5Znp1WW1rSXN3b0dmN2piUXcwMUtGK29aZmdtUjdY?=
 =?utf-8?B?alFGSkRBcnFvbG1RR21rTmp5OERLcFhxc3hoZGVjRHh2SWxNeEJIZGFCd2Nn?=
 =?utf-8?B?QnlJSERvWGZCVmRiN2gvaCs4RWFXWUhNN0wzUWpKcWQ2N242UkYzRW5oOGxJ?=
 =?utf-8?B?UjBZSmQzdTM3cWV4YVl6SWRMVCtyVWp6S1ErTk1XR29zQWZJenlpaWFod0Zj?=
 =?utf-8?B?Q0NSYmF0NCtycGFrVjdIQVNYK0NJN1A4YmFTVTlTWjVlUnNrRFNPOEduNjRX?=
 =?utf-8?B?d0p2L1VSMGdsTkxGV2pObGlHV091d1Q1SUhPd0s1QXk1UU1IZVhlRTdxeFVZ?=
 =?utf-8?B?NnMvcjRQR2h4UHBMenRJeWRoUG5kb2VTTk5qSExoSk8xNlF6R0ZaUEFibVFy?=
 =?utf-8?B?U0hQSlhmSXhyNmNTWVBuMFRSUjlvYk04MnF2Y0RQWTlVd0Z2eHlwNzVvc292?=
 =?utf-8?B?TVBoWk9UYnc1Wk9VZlFzcDZ6QU4zV2tJNVZyTGpOQ2JiTFBDUE54SUozZkNq?=
 =?utf-8?B?dkJtSHRkeWw0NlBIVGJRbWk4eVY4RWpBMFhKQkdBQi9ma0J0d1lHV0pCTWxo?=
 =?utf-8?B?M29HNWlmSXZkVWllek5iQVVJb3VjMFVzejBwYnkwRlZWMWg3MWVXT2QwZHFl?=
 =?utf-8?B?MWlheUhKLzh4Tkc2VkxBeS9WUmI5OFlmOCsyTjYxVytNZjFmU2xIWTYwSDNq?=
 =?utf-8?B?cCtYSGN0OVZoUkhuUkp3ZDBSUTR5cUNYQzBzNEFXSUpwK01zVlpuQjRtZGN2?=
 =?utf-8?B?bmFDcXRCOE5JZGloTDhUWjNoK24xa0hrdnpmdGgrcmZ4UXQrT3lzYkVxc1pl?=
 =?utf-8?B?QXdyb2U2OVFtcDkvbjFoV3Mwdm00MUlJQVpVMEhnYzRFeE53RjZhRC9HVERa?=
 =?utf-8?B?THdwWGw1TDhUZEFJVHZwREpNT3VWcDBYQi92cVVDbSt0NjExankxZTJJMk9Y?=
 =?utf-8?B?TDQ2YjdPUFdpSDBIY2dseG1zampHU251clBRL0Q2MStjOU9wY25ac2N3VG9n?=
 =?utf-8?B?M3lxOTRacUpId0EzdjlRNzVSSUlwM1ZwVW12Z0RpSjRiL0gzMjhvZXlzQ3dN?=
 =?utf-8?B?TlZKN0dHd2NTaWNnOHZjNXFDSVVDYXRhZHJSSFhsalhjVzJlQ1QyaUFzMkdp?=
 =?utf-8?B?SnpPVk9COTJYODdSNklZclJ0WTFYeGNrZGc4RjA3b1A0ZGFmbDJDTGZTeGx4?=
 =?utf-8?B?WkphK0RwRytMY2FkbVJ2bHZGQVpsTFJRM1JYWlhoRVRFUUNSREhld1ZhTURv?=
 =?utf-8?B?b0NMM241YkFkWG5lZEl6YmpKQUkzVVR6a253VmYrVWx2MzVlU3RIeWZ2K0p6?=
 =?utf-8?B?WG14ejBUcmExMnM0M3lCbno4Vi8rNG5OaGgzSHVuaHBUZ3RocFJTQXFWOXZN?=
 =?utf-8?Q?kRwY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGFJeWU2ZVRQM3lJczlCZkxsNEU2d3o0NGZ1a0s3NzNxa0Z3NlVnWGlrQTZY?=
 =?utf-8?B?NFNkeEE0MGVGUURxQ2MzbDdqVDZLVHdGMGlWajJoYjhnOEJOTCtUN3Joak96?=
 =?utf-8?B?VCswdnl0YzI1VW9KRnNITGxwYzFHcDNISVVCdHNPMzJSemF0WDBLRTFFNXU0?=
 =?utf-8?B?WkpmbXlYNm1aY2haWVpQTVJDaTBKakZDcW9kekQ3c1YxN29ycDg4N0xlWTJk?=
 =?utf-8?B?blI2RE14TXdsckFjdVhWUmllV2NORUJuaXR2bDl1WXdPdzVlQlVITWdTamt0?=
 =?utf-8?B?ZEpVbVF4S3NVTnQwU0IremgvV2tNemJWb1duZ3AweiszUHhOekNqckQwbHpW?=
 =?utf-8?B?eitpdnpJaWZYdTlCeDlBR0pITGlLNVRlWEFJWGh5amdTSHJoQzhqSHlqY3I4?=
 =?utf-8?B?b09XQ0hhVFRZUU9BT3lZL1pxWXRDMlJOcUlvWURHZTBmamNiaXk3bUZEVU1B?=
 =?utf-8?B?Mnk2Sk9KTEZFeGJzWld6VXorN2YrSVplMjdxYno3SERHVGUzQStqeXcxK1l1?=
 =?utf-8?B?bFFNVm9YNk9aaWhQU1ArZUhyV1IvWWp4b3BmVEluamtJM3VqU3NSblZHYkts?=
 =?utf-8?B?U0wrdDFnNTV3MmFmODZUdS8yQVZCeTVPdHd3VWZQQ3BGUTlvVGY3RlYxR1Fw?=
 =?utf-8?B?TG5ieUdEbytYbjJpUy9uUDBOWmUwS09ETUdWcEFEOEVUSlpYOURMS2ZZaWpH?=
 =?utf-8?B?a0RnYnBVd1p5czg5b0kvWHVQUmo1RDRxQzlYUTliY0FwOTBra01GQ0JBeWhm?=
 =?utf-8?B?c2Jyby9lZzdoRVl3NU5mM2FhcjNhckRrdW9ESkhvSnIzbXk2d3VSNExQbTI1?=
 =?utf-8?B?ZjkvakJuVjhkbEpEZDhWaVJrWEpnSEN4MEpPdHkvSDY5RFFJbUxFcjBLU3JW?=
 =?utf-8?B?THFoY21FTXNwUmdSaXRUYVVGR1k3a1gzUDNVNksxU3dHQlpiL3pGdTlvWjgx?=
 =?utf-8?B?UHBlK3dnbnV0YTBsMGFYWTBqUnYxTjQzM3ZML0g4WFBYWDdIZUNnc3lqcTlp?=
 =?utf-8?B?aGpuUEJicmJPNWtMYVAwYzh5cEpPSW9hZmFjZzlDOVlCczd1dktVUnk3cGdT?=
 =?utf-8?B?OHRYWGpyRW45RTB2UXhiR3EyWGQ1a3kzazdvMFF0S2tuRHI0VUdOWW4vZlh3?=
 =?utf-8?B?NGJPSlhBMDBWWkg3MlBzbTRHS0ZiSG82UjhVRlVmS1F6SnpUQWtveUhlVmpv?=
 =?utf-8?B?MmNUVE5oZnVpbS85RnlPVFcrSmppZlEvaDFIZ3gyR1p2a0JSNWNpZ1I4bnhY?=
 =?utf-8?B?RjIweFJ3TGVwZDZ5ejZNcFJLZUZjOGpBUHBMNElIQngvOWNlczNOTWU0R0tn?=
 =?utf-8?B?NWhYMnl2S2kxdndxM0RsYUhHWXNMMDVvN0VGNnVDRGVWN09qSStZc1c3SmFo?=
 =?utf-8?B?Sm9ZNUxheXc3TGJNMnJrT0J6emI2MjloQjIyTndxaGZVcDIxZ1JPUk5xYXFj?=
 =?utf-8?B?Z3FZSWU2UFplS3h6cTdqMW9SRm1DQWJNSzkzZTNac09NeTlLN2tlVzJRS3ZV?=
 =?utf-8?B?Z0tXbTd3UzFMaHByTStRSnBnQVRLWHp0ZlFXL210RW1xNVl4aGZvWHhPZWNa?=
 =?utf-8?B?MW92TWh5dks5Mnoyc0U4VXV4MHU0bE9FUGRtanMxNDBRRzlPRVFJNXVxeUYw?=
 =?utf-8?B?RzZ6MmQ1Yk5Zc3BZQXV3WG1YWWhlUDRUREtYcUo5RnRrajFrVkZyL2J1ajVY?=
 =?utf-8?B?YjZkalRxdjRBV2owYTBqKzZld1Z0ZTZqK00wOWwwcG5GSnpDczErcUx5bjh0?=
 =?utf-8?B?NEFNK25iSUJhUEwwaEx5YjlBR2lTcEk3MTVEeHpxMHQrczNDcm5MUFBXcSs4?=
 =?utf-8?B?L2N5UnltcStPWmtxVmxqWGJXM3hiQU1xUUtpY1I1eTY3MnZGdzg3YWJjMHc1?=
 =?utf-8?B?Um5RdHRWZFc4RVZmSTdlUmZuZ3pUajJvQWFnV2QzUTFpMFcyU3BzNVhmVkhQ?=
 =?utf-8?B?SGlNWDd5SzQ5UnFwRVNCR3loY1U3Yko0TmdncmYwa1ZucXlDTXYwNlJpZ283?=
 =?utf-8?B?Q0k2bUR2RThkVlJ4Rk1mWllJK09JSkVkQVlucTlOMk42V3FaN0NpUnJsbE5p?=
 =?utf-8?B?SXpnVUFBditJV0duMTllTW1CbkNVaW9xUVVOTlNrVVpLSTR6cHNhNyt4MFZM?=
 =?utf-8?B?dUp6VXlCVkdQM2cwcGxoMW1wZDZ2cTkzZWRzNkJkbzh1UW5jTlFpNVFCTldF?=
 =?utf-8?B?TkZab1JXWllWNTYrQTZsNS9QUTd5M3hvNjZwQ3pBK1JJRnJ6MzZmSVA3VzhS?=
 =?utf-8?B?b2dmcjRlUUIwbkFleWR6dUpUbnZDU0d1a1c4NjVBR2E2RGxKcDd4RUNDV3Bz?=
 =?utf-8?B?bHdnK1REZDg5bjFNY0FCQndsc3dlM0RGQTg2MjJlcjFMWWRpd0Z6dz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f20a2d7-0460-46bb-e514-08de601d77de
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 16:34:41.6596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +XpGpHUO++5/spof0brRrNV2D1xGwCM62xxSgEnVMSRsL/yBM+spZJ9wka3c1J5CiwSvOMnfYfpyVz6/iobVGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6893
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_083447_370060_A556F6B5 
X-CRM114-Status: GOOD (  21.59  )
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

T24gMzAvMDEvMjAyNiAxNzowNCwgRnJhbmsgTGkgd3JvdGU6Cj4gT24gRnJpLCBKYW4gMzAsIDIw
MjYgYXQgMDk6MDA6MzNBTSArMDIwMCwgQWRyaWFuIEh1bnRlciB3cm90ZToKPj4gT24gMjkvMDEv
MjAyNiAyMzowMCwgRnJhbmsgTGkgd3JvdGU6Cj4+PiBPbiBUaHUsIEphbiAyOSwgMjAyNiBhdCAx
MDoyODoxNFBNICswMjAwLCBBZHJpYW4gSHVudGVyIHdyb3RlOgo+Pj4+IE9uIDI5LzAxLzIwMjYg
MjI6MDAsIEZyYW5rIExpIHdyb3RlOgo+Pj4+PiBPbiBUaHUsIEphbiAyOSwgMjAyNiBhdCAwODox
ODozOVBNICswMjAwLCBBZHJpYW4gSHVudGVyIHdyb3RlOgo+Pj4+Pj4gU29tZSBwbGF0Zm9ybXMg
aW1wbGVtZW50IHRoZSBNSVBJIEkzQyBIQ0kgTXVsdGktQnVzIEluc3RhbmNlIGNhcGFiaWxpdHks
Cj4+Pj4+PiB3aGVyZSBhIHNpbmdsZSBwYXJlbnQgZGV2aWNlIGhvc3RzIG11bHRpcGxlIEkzQyBj
b250cm9sbGVyIGluc3RhbmNlcy4gIEluCj4+Pj4+PiBzdWNoIGRlc2lnbnMsIHRoZSBwYXJlbnQg
LSBub3QgdGhlIGluZGl2aWR1YWwgY2hpbGQgaW5zdGFuY2VzIC0gbWF5IG5lZWQgdG8KPj4+Pj4+
IGNvb3JkaW5hdGUgcnVudGltZSBQTSBzbyB0aGF0IGFsbCBjb250cm9sbGVycyBlbnRlciBsb3ct
cG93ZXIgc3RhdGVzCj4+Pj4+PiB0b2dldGhlciwgYW5kIGFsbCBydW50aW1lIHN1c3BlbmQgY2Fs
bGJhY2tzIGFyZSBpbnZva2VkIGluIGEgY29udHJvbGxlZAo+Pj4+Pj4gYW5kIHN5bmNocm9uaXpl
ZCBtYW5uZXIuCj4+Pj4+Pgo+Pj4+Pj4gRm9yIGV4YW1wbGUsIGlmIHRoZSBwYXJlbnQgZW5hYmxl
cyBJQkktd2FrZXVwIHdoZW4gdHJhbnNpdGlvbmluZyBpbnRvIGEKPj4+Pj4+IGxvdy1wb3dlciBz
dGF0ZSwKPj4+Pj4KPj4+Pj4gRG9lcyB5b3VyIGhhcmR3YXJlIHN1cHBvcnQgcmVjaWV2ZSBJQkkg
d2hlbiBydW50aW1lIHN1c3BlbmQ/Cj4+Pj4KPj4+PiBXaGVuIHJ1bnRpbWUgc3VzcGVuZGVkIChp
biBEMyksIHRoZSBoYXJkd2FyZSBmaXJzdCB0cmlnZ2VycyBhIFBvd2VyIE1hbmFnZW1lbnQKPj4+
PiBFdmVudCAoUE1FKSB3aGVuIHRoZSBTREEgbGluZSBpcyBwdWxsZWQgbG93IHRvIHNpZ25hbCB0
aGUgU1RBUlQgY29uZGl0aW9uIG9mIGFuIElCSS4KPj4+PiBUaGUgUENJIHN1YnN5c3RlbSB3aWxs
IHRoZW4gcnVudGltZS1yZXN1bWUgdGhlIGRldmljZS4gIFdoZW4gdGhlIGJ1cyBpcyBlbmFibGVk
LAo+Pj4+IHRoZSBjbG9jayBpcyBzdGFydGVkIGFuZCB0aGUgSUJJIGlzIHJlY2VpdmVkLgo+Pj4K
Pj4+IEl0IGFsaWduIG15IGFzc3VtcHRpb24sIHdoeSBuZWVkIGNvbXBsZXggc29sdXRpb24uCj4+
Pgo+Pj4gU0RBLT5QTUUtPklSUSBzaG91bGQgaGFuZGxlIGJ5IGhhcmR3YXJlLCBzbyBpcnEgaGFu
ZGxlIHF1ZXVlIElCSSB0byB3b3JraW5nCj4+PiBxdWV1ZS4KPj4+Cj4+PiBJQkkgd29yayB3aWxs
IHRyeSBkbyB0cmFuc2Zlciwgd2hpY2ggd2lsbCBjYWxsIHJ1bnRpbWUgcmVzdW1lKCksIHRoZW4K
Pj4+IHRyYW5zZmVyIGRhdGEuCj4+Pgo+Pj4gV2hhdCdzIGlzc3VlPwo+Pgo+PiBUaGUgUE1FIGlu
ZGljYXRlcyBJM0MgU1RBUlQgKFNEQSBsaW5lIHB1bGxlZCBsb3cpLiAgVGhlIGNvbnRyb2xsZXIg
aXMKPj4gaW4gYSBsb3cgcG93ZXIgc3RhdGUgdW5hYmxlIHRvIG9wZXJhdGUgdGhlIGJ1cy4gIEF0
IHRoaXMgcG9pbnQgaXQgaXMgbm90Cj4+IGtub3duIHdoYXQgSTNDIGRldmljZSBoYXMgcHVsbGVk
IGRvd24gdGhlIFNEQSBsaW5lLCBvciBldmVuIGlmIGl0IGlzIGFuCj4+IElCSSBzaW5jZSBpdCBp
cyBpbmRpc3Rpbmd1aXNoYWJsZSBmcm9tIGhvdC1qb2luIGF0IHRoaXMgcG9pbnQuCj4+Cj4+IFRo
ZSBQQ0kgUE1FIElSUSBpcyBub3QgdGhlIGRldmljZSdzIElSUS4gIEl0IGlzIGhhbmRsZWQgYnkg
YWNwaV9pcnEoKQo+PiB3aGljaCB1bHRpbWF0ZWx5IGluZm9ybXMgdGhlIFBDSSBzdWJzeXN0ZW0g
dG8gd2FrZSB0aGUgUENJIGRldmljZS4KPj4gVGhlIFBDSSBzdWJzeXN0ZW0gcGVyZm9ybXMgcG1f
cmVxdWVzdF9yZXN1bWUoKSwgcmVmZXIgcGNpX2FjcGlfd2FrZV9kZXYoKS4KPj4KPj4gV2hlbiB0
aGUgY29udHJvbGxlciBpcyByZXN1bWVkLCBpdCBlbmFibGVzIHRoZSBJM0MgYnVzIGFuZCB0aGUg
SUJJIGlzCj4+IGZpbmFsbHkgZGVsaXZlcmVkIG5vcm1hbGx5Lgo+Pgo+PiBIb3dldmVyLCBub25l
IG9mIHRoYXQgaXMgcmVsYXRlZCB0byB0aGlzIHBhdGNoLgo+Pgo+PiBUaGlzIHBhdGNoIGlzIGJl
Y2F1c2UgdGhlIFBDSSBkZXZpY2UgaGFzIDIgSTNDIGJ1cyBpbnN0YW5jZXMgYW5kIG9ubHkgMSBQ
TUUKPj4gd2FrZXVwLiAgVGhlIFBNRSBiZWNvbWVzIGFjdGl2ZSB3aGVuIHRoZSBQQ0kgZGV2aWNl
IGlzIHB1dCB0byBhIGxvdwo+PiBwb3dlciBzdGF0ZS4KPiAKPiBPbmUgaW5zdGFuY2UgMSBzdXNw
ZW5kLCBpbnN0YW5jZSAyIHJ1bm5pbmcsIFBNRSBpcyBpbmFjdGl2ZSwgd2hhdCdzIGhhcHBlbgo+
IGlmIGluc3RhbmNlIDEgcmVxdWVzdCBJQkk/CgpOb3RoaW5nIHdpbGwgaGFwcGVuLiAgSW5zdGFu
Y2UgMSBJM0MgYnVzIGlzIG5vdCBvcGVyYXRpb25hbCBhbmQgdGhlcmUgY2FuCmJlIG5vIFBNRSB3
aGVuIHRoZSBQQ0kgZGV2aWNlIGlzIG5vdCBpbiBhIGxvdyBwb3dlciBzdGF0ZSAoRDNob3QpCgo+
IAo+IElCSSB3aWxsIGJlIG1pc3NlZD8KClBvc3NpYmx5IG5vdCBpZiBpbnN0YW5jZSAxIGlzIGV2
ZW50dWFsbHkgcmVzdW1lZCBhbmQgdGhlIEkzQyBkZXZpY2UKcmVxdWVzdGluZyB0aGUgSUJJIGhh
cyBub3QgeWV0IGdpdmVuIHVwLgoKPiAKPj4gQm90aCBJM0MgYnVzIGluc3RhbmNlcyBtdXN0IGJl
IHJ1bnRpbWUgc3VzcGVuZGVkIHRoZW4uCj4+IFNpbWlsYXJseSwgdXBvbiByZXN1bWUgdGhlIFBN
RSBpcyBubyBsb25nZXIgYWN0aXZlLCBzbyBib3RoIEkzQyBidXMgaW5zdGFuY2VzCj4+IG11c3Qg
bWFrZSB0aGVpciBidXNlcyBvcGVyYXRpb25hbCAtIHdlIGRvbid0IGtub3cgd2hpY2ggbWF5IGhh
dmUgcmVjZWl2ZWQKPj4gYW4gSUJJLgo+IAo+IERvZXMgUE1FIGFjdGl2ZSBhdXRvIGJ5IGhhcmR3
YXJlIG9yIG5lZWQgc29mdHdhcmUgY29uZmlnPwoKUENJIGRldmljZXMgKGhhcmR3YXJlKSBhZHZl
cnRpc2UgdGhlaXIgUE1FIGNhcGFiaWxpdHkgaW4gdGVybXMgb2YKd2hpY2ggc3RhdGVzIGFyZSBj
YXBhYmxlIG9mIFBNRXMuICBDdXJyZW50bHkgdGhlIEludGVsIExQU1MgSTNDCmRldmljZSBsaXN0
cyBvbmx5IEQzaG90LgoKVGhlIFBDSSBzdWJzeXN0ZW0gKHNvZnR3YXJlKSBhdXRvbWF0aWNhbGx5
IGVuYWJsZXMgdGhlIFBNRSBiZWZvcmUKcnVudGltZSBzdXNwZW5kIGlmIHRoZSB0YXJnZXQgcG93
ZXIgc3RhdGUgYWxsb3dzIGl0LgoKPiAKPiBGcmFuawo+PiBBbmQgdGhlcmUgbWF5IGJlIGZ1cnRo
ZXIgSUJJcyB3aGljaCBjYW4ndCBiZSByZWNlaXZlZCB1bmxlc3MgdGhlCj4+IGFzc29jaWF0ZWQg
YnVzIGlzIG9wZXJhdGlvbmFsLiAgVGhlIFBDSSBkZXZpY2UgaXMgbm8gbG9uZ2VyIGluIGEgbG93
IHBvd2VyCj4+IHN0YXRlLCBzbyB0aGVyZSB3aWxsIGJlIG5vIFBNRSBpbiB0aGF0IGNhc2UuCj4+
Cj4+Pgo+Pj4gRnJhbmsKPj4+Cj4+Pj4KPj4+Pj4KPj4+Pj4gRnJhbmsKPj4+Pj4KPj4+Pj4+IGV2
ZXJ5IGJ1cyBpbnN0YW5jZSBtdXN0IHJlbWFpbiBhYmxlIHRvIHJlY2VpdmUgSUJJcyB1cAo+Pj4+
Pj4gdW50aWwgdGhhdCBwb2ludC4gIFRoaXMgcmVxdWlyZXMgZGVmZXJyaW5nIHRoZSBpbmRpdmlk
dWFsIGNvbnRyb2xsZXJz4oCZCj4+Pj4+PiBydW50aW1lIHN1c3BlbmQgY2FsbGJhY2tzICh3aGlj
aCBkaXNhYmxlIGJ1cyBhY3Rpdml0eSkgdW50aWwgdGhlIHBhcmVudAo+Pj4+Pj4gZGVjaWRlcyBp
dCBpcyBzYWZlIGZvciBhbGwgaW5zdGFuY2VzIHRvIHN1c3BlbmQgdG9nZXRoZXIuCj4+Pj4+Pgo+
Pj4+Pj4gVG8gc3VwcG9ydCB0aGlzIHVzYWdlIG1vZGVsOgo+Pj4+Pj4KPj4+Pj4+ICAgKiBFeHBv
cnQgdGhlIGNvbnRyb2xsZXIncyBydW50aW1lIFBNIHN1c3BlbmQvcmVzdW1lIGNhbGxiYWNrcyBz
byB0aGF0Cj4+Pj4+PiAgICAgdGhlIHBhcmVudCBjYW4gaW52b2tlIHRoZW0gZGlyZWN0bHkuCj4+
Pj4+Pgo+Pj4+Pj4gICAqIEFkZCBhIG5ldyBxdWlyaywgSENJX1FVSVJLX1JQTV9QQVJFTlRfTUFO
QUdFRCwgd2hpY2ggZGVzaWduYXRlcyB0aGUKPj4+Pj4+ICAgICBwYXJlbnQgZGV2aWNlIGFzIHRo
ZSBjb250cm9sbGVy4oCZcyBydW50aW1lIFBNIGRldmljZSAocnBtX2RldikuICBXaGVuCj4+Pj4+
PiAgICAgdXNlZCB3aXRob3V0IEhDSV9RVUlSS19SUE1fQUxMT1dFRCwgdGhpcyBhbHNvIHByZXZl
bnRzIHRoZSBjaGlsZAo+Pj4+Pj4gICAgIGluc3RhbmNl4oCZcyBzeXN0ZW0tc3VzcGVuZCBjYWxs
YmFja3MgZnJvbSB1c2luZwo+Pj4+Pj4gICAgIHBtX3J1bnRpbWVfZm9yY2Vfc3VzcGVuZCgpL3Bt
X3J1bnRpbWVfZm9yY2VfcmVzdW1lKCksIHNpbmNlIHJ1bnRpbWUKPj4+Pj4+ICAgICBQTSBpcyBt
YW5hZ2VkIGVudGlyZWx5IGJ5IHRoZSBwYXJlbnQuCj4+Pj4+Pgo+Pj4+Pj4gICAqIE1vdmUgREVG
QVVMVF9BVVRPU1VTUEVORF9ERUxBWV9NUyBpbnRvIHRoZSBoZWFkZXIgc28gaXQgY2FuIGJlIHNo
YXJlZAo+Pj4+Pj4gICAgIGJ5IHBhcmVudC1tYW5hZ2VkIFBNIGltcGxlbWVudGF0aW9ucy4KPj4+
Pj4+Cj4+Pj4+PiBUaGUgbmV3IHF1aXJrIGFsbG93cyBwbGF0Zm9ybXMgd2l0aCBtdWx0aS1idXMg
cGFyZW50LW1hbmFnZWQgUE0KPj4+Pj4+IGluZnJhc3RydWN0dXJlIHRvIGNvcnJlY3RseSBjb29y
ZGluYXRlIHJ1bnRpbWUgUE0gYWNyb3NzIGFsbCBJM0MgSENJCj4+Pj4+PiBpbnN0YW5jZXMuCj4+
Pj4+Pgo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogQWRyaWFuIEh1bnRlciA8YWRyaWFuLmh1bnRlckBp
bnRlbC5jb20+Cj4+Pj4+PiAtLS0KPj4+Pj4+ICBkcml2ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2Mt
aGNpL2NvcmUuYyB8IDI1ICsrKysrKysrKysrKysrKystLS0tLS0tLS0KPj4+Pj4+ICBkcml2ZXJz
L2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNpL2hjaS5oICB8ICA2ICsrKysrKwo+Pj4+Pj4gIDIgZmls
ZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPj4+Pj4+Cj4+Pj4+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9jb3JlLmMgYi9k
cml2ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNpL2NvcmUuYwo+Pj4+Pj4gaW5kZXggZWM0ZGJl
NjRjMzVlLi5jYjk3NGIwZjllMTcgMTAwNjQ0Cj4+Pj4+PiAtLS0gYS9kcml2ZXJzL2kzYy9tYXN0
ZXIvbWlwaS1pM2MtaGNpL2NvcmUuYwo+Pj4+Pj4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyL21p
cGktaTNjLWhjaS9jb3JlLmMKPj4+Pj4+IEBAIC03MzMsNyArNzMzLDcgQEAgc3RhdGljIGludCBp
M2NfaGNpX3Jlc2V0X2FuZF9pbml0KHN0cnVjdCBpM2NfaGNpICpoY2kpCj4+Pj4+PiAgCXJldHVy
biAwOwo+Pj4+Pj4gIH0KPj4+Pj4+Cj4+Pj4+PiAtc3RhdGljIGludCBpM2NfaGNpX3J1bnRpbWVf
c3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpCj4+Pj4+PiAraW50IGkzY19oY2lfcnVudGltZV9z
dXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikKPj4+Pj4+ICB7Cj4+Pj4+PiAgCXN0cnVjdCBpM2Nf
aGNpICpoY2kgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKPj4+Pj4+ICAJaW50IHJldDsKPj4+Pj4+
IEBAIC03NDYsOCArNzQ2LDkgQEAgc3RhdGljIGludCBpM2NfaGNpX3J1bnRpbWVfc3VzcGVuZChz
dHJ1Y3QgZGV2aWNlICpkZXYpCj4+Pj4+Pgo+Pj4+Pj4gIAlyZXR1cm4gMDsKPj4+Pj4+ICB9Cj4+
Pj4+PiArRVhQT1JUX1NZTUJPTF9HUEwoaTNjX2hjaV9ydW50aW1lX3N1c3BlbmQpOwo+Pj4+Pj4K
Pj4+Pj4+IC1zdGF0aWMgaW50IGkzY19oY2lfcnVudGltZV9yZXN1bWUoc3RydWN0IGRldmljZSAq
ZGV2KQo+Pj4+Pj4gK2ludCBpM2NfaGNpX3J1bnRpbWVfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRl
dikKPj4+Pj4+ICB7Cj4+Pj4+PiAgCXN0cnVjdCBpM2NfaGNpICpoY2kgPSBkZXZfZ2V0X2RydmRh
dGEoZGV2KTsKPj4+Pj4+ICAJaW50IHJldDsKPj4+Pj4+IEBAIC03NjgsNiArNzY5LDcgQEAgc3Rh
dGljIGludCBpM2NfaGNpX3J1bnRpbWVfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikKPj4+Pj4+
Cj4+Pj4+PiAgCXJldHVybiAwOwo+Pj4+Pj4gIH0KPj4+Pj4+ICtFWFBPUlRfU1lNQk9MX0dQTChp
M2NfaGNpX3J1bnRpbWVfcmVzdW1lKTsKPj4+Pj4+Cj4+Pj4+PiAgc3RhdGljIGludCBpM2NfaGNp
X3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQo+Pj4+Pj4gIHsKPj4+Pj4+IEBAIC03ODQsMTIg
Kzc4NiwxNCBAQCBzdGF0aWMgaW50IGkzY19oY2lfcmVzdW1lX2NvbW1vbihzdHJ1Y3QgZGV2aWNl
ICpkZXYsIGJvb2wgcnN0ZGFhKQo+Pj4+Pj4gIAlzdHJ1Y3QgaTNjX2hjaSAqaGNpID0gZGV2X2dl
dF9kcnZkYXRhKGRldik7Cj4+Pj4+PiAgCWludCByZXQ7Cj4+Pj4+Pgo+Pj4+Pj4gLQlpZiAoISho
Y2ktPnF1aXJrcyAmIEhDSV9RVUlSS19SUE1fQUxMT1dFRCkpCj4+Pj4+PiAtCQlyZXR1cm4gMDsK
Pj4+Pj4+ICsJaWYgKCEoaGNpLT5xdWlya3MgJiBIQ0lfUVVJUktfUlBNX1BBUkVOVF9NQU5BR0VE
KSkgewo+Pj4+Pj4gKwkJaWYgKCEoaGNpLT5xdWlya3MgJiBIQ0lfUVVJUktfUlBNX0FMTE9XRUQp
KQo+Pj4+Pj4gKwkJCXJldHVybiAwOwo+Pj4+Pj4KPj4+Pj4+IC0JcmV0ID0gcG1fcnVudGltZV9m
b3JjZV9yZXN1bWUoZGV2KTsKPj4+Pj4+IC0JaWYgKHJldCkKPj4+Pj4+IC0JCXJldHVybiByZXQ7
Cj4+Pj4+PiArCQlyZXQgPSBwbV9ydW50aW1lX2ZvcmNlX3Jlc3VtZShkZXYpOwo+Pj4+Pj4gKwkJ
aWYgKHJldCkKPj4+Pj4+ICsJCQlyZXR1cm4gcmV0Owo+Pj4+Pj4gKwl9Cj4+Pj4+Pgo+Pj4+Pj4g
IAlyZXQgPSBpM2NfbWFzdGVyX2RvX2RhYV9leHQoJmhjaS0+bWFzdGVyLCByc3RkYWEpOwo+Pj4+
Pj4gIAlpZiAocmV0KQo+Pj4+Pj4gQEAgLTgxMiw4ICs4MTYsNiBAQCBzdGF0aWMgaW50IGkzY19o
Y2lfcmVzdG9yZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4+Pj4+PiAgCXJldHVybiBpM2NfaGNpX3Jl
c3VtZV9jb21tb24oZGV2LCB0cnVlKTsKPj4+Pj4+ICB9Cj4+Pj4+Pgo+Pj4+Pj4gLSNkZWZpbmUg
REVGQVVMVF9BVVRPU1VTUEVORF9ERUxBWV9NUyAxMDAwCj4+Pj4+PiAtCj4+Pj4+PiAgc3RhdGlj
IHZvaWQgaTNjX2hjaV9ycG1fZW5hYmxlKHN0cnVjdCBkZXZpY2UgKmRldikKPj4+Pj4+ICB7Cj4+
Pj4+PiAgCXN0cnVjdCBpM2NfaGNpICpoY2kgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKPj4+Pj4+
IEBAIC05NjIsNiArOTY0LDExIEBAIHN0YXRpYyBpbnQgaTNjX2hjaV9wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQo+Pj4+Pj4gIAlpZiAoaGNpLT5xdWlya3MgJiBIQ0lfUVVJUktf
UlBNX0lCSV9BTExPV0VEKQo+Pj4+Pj4gIAkJaGNpLT5tYXN0ZXIucnBtX2liaV9hbGxvd2VkID0g
dHJ1ZTsKPj4+Pj4+Cj4+Pj4+PiArCWlmIChoY2ktPnF1aXJrcyAmIEhDSV9RVUlSS19SUE1fUEFS
RU5UX01BTkFHRUQpIHsKPj4+Pj4+ICsJCWhjaS0+bWFzdGVyLnJwbV9kZXYgPSBwZGV2LT5kZXYu
cGFyZW50Owo+Pj4+Pj4gKwkJaGNpLT5tYXN0ZXIucnBtX2FsbG93ZWQgPSB0cnVlOwo+Pj4+Pj4g
Kwl9Cj4+Pj4+PiArCj4+Pj4+PiAgCXJldHVybiBpM2NfbWFzdGVyX3JlZ2lzdGVyKCZoY2ktPm1h
c3RlciwgJnBkZXYtPmRldiwgJmkzY19oY2lfb3BzLCBmYWxzZSk7Cj4+Pj4+PiAgfQo+Pj4+Pj4K
Pj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNpL2hjaS5o
IGIvZHJpdmVycy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9oY2kuaAo+Pj4+Pj4gaW5kZXggODE5
MzI4YTg1Yjg0Li5kMGU3YWQ1OGFjMTUgMTAwNjQ0Cj4+Pj4+PiAtLS0gYS9kcml2ZXJzL2kzYy9t
YXN0ZXIvbWlwaS1pM2MtaGNpL2hjaS5oCj4+Pj4+PiArKysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIv
bWlwaS1pM2MtaGNpL2hjaS5oCj4+Pj4+PiBAQCAtMTQ3LDYgKzE0Nyw3IEBAIHN0cnVjdCBpM2Nf
aGNpX2Rldl9kYXRhIHsKPj4+Pj4+ICAjZGVmaW5lIEhDSV9RVUlSS19SRVNQX0JVRl9USExECQlC
SVQoNCkgIC8qIFNldCByZXNwIGJ1ZiB0aGxkIHRvIDAgZm9yIEFNRCBwbGF0Zm9ybXMgKi8KPj4+
Pj4+ICAjZGVmaW5lIEhDSV9RVUlSS19SUE1fQUxMT1dFRAkJQklUKDUpICAvKiBSdW50aW1lIFBN
IGFsbG93ZWQgKi8KPj4+Pj4+ICAjZGVmaW5lIEhDSV9RVUlSS19SUE1fSUJJX0FMTE9XRUQJQklU
KDYpICAvKiBJQkkgYW5kIEhvdC1Kb2luIGFsbG93ZWQgd2hpbGUgcnVudGltZSBzdXNwZW5kZWQg
Ki8KPj4+Pj4+ICsjZGVmaW5lIEhDSV9RVUlSS19SUE1fUEFSRU5UX01BTkFHRUQJQklUKDcpICAv
KiBSdW50aW1lIFBNIG1hbmFnZWQgYnkgcGFyZW50IGRldmljZSAqLwo+Pj4+Pj4KPj4+Pj4+ICAv
KiBnbG9iYWwgZnVuY3Rpb25zICovCj4+Pj4+PiAgdm9pZCBtaXBpX2kzY19oY2lfcmVzdW1lKHN0
cnVjdCBpM2NfaGNpICpoY2kpOwo+Pj4+Pj4gQEAgLTE1Niw0ICsxNTcsOSBAQCB2b2lkIGFtZF9z
ZXRfb2RfcHBfdGltaW5nKHN0cnVjdCBpM2NfaGNpICpoY2kpOwo+Pj4+Pj4gIHZvaWQgYW1kX3Nl
dF9yZXNwX2J1Zl90aGxkKHN0cnVjdCBpM2NfaGNpICpoY2kpOwo+Pj4+Pj4gIHZvaWQgaTNjX2hj
aV9zeW5jX2lycV9pbmFjdGl2ZShzdHJ1Y3QgaTNjX2hjaSAqaGNpKTsKPj4+Pj4+Cj4+Pj4+PiAr
I2RlZmluZSBERUZBVUxUX0FVVE9TVVNQRU5EX0RFTEFZX01TIDEwMDAKPj4+Pj4+ICsKPj4+Pj4+
ICtpbnQgaTNjX2hjaV9ydW50aW1lX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KTsKPj4+Pj4+
ICtpbnQgaTNjX2hjaV9ydW50aW1lX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpOwo+Pj4+Pj4g
Kwo+Pj4+Pj4gICNlbmRpZgo+Pj4+Pj4gLS0KPj4+Pj4+IDIuNTEuMAo+Pj4+Pj4KPj4+Pgo+PgoK
Ci0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
