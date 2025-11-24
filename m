Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 790B9CFD313
	for <linux-i3c@archiver.kernel.org>; Mon, 24 Nov 2025 12:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:CC:
	To:From:Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=62EOqmpVpoOgmQ6HGd1/+2cdfegUC1wr8K53oAC103s=; b=dm1sC7ZSTuSZBZ
	zj5EnOzTSKxzSpPoIAT4qj6dakoiMBZ1mq3Uho/K/jKA08QXCsD7Nca/gvmG/100+0iP9+5qKO38p
	WjoNaV5EwNrie+R72QeX6PvWcXXVpRHIYkveO2jzr7qORcT81mnGKS76X/FRQN7B9unbmz+f701rz
	/EiFK5gjPq0F0rh5IqA9gWZxZuqG+IgpXGN10sU8MhhMKtw+s1PkUR8OY/+WqX1AaGIeIap35cKyP
	llbpm2jSzl4VUmc+O5QJhI46euF3HgVR4fkqq1qcYoI7nwA9tBJwoZuVFpgMDnywDtZYj6jtbr5J2
	WN0E1Nwdylcn0hM1SC7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNVhE-0000000BeZj-0nlf;
	Mon, 24 Nov 2025 12:29:32 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNVhA-0000000BeZH-14Ob
	for linux-i3c@lists.infradead.org;
	Mon, 24 Nov 2025 12:29:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763987369; x=1795523369;
  h=message-id:date:subject:from:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=D9Okhbd+WMGHGfNqk6Mqs4Ku9uPRu3q3STtzkQLM/ks=;
  b=FlJcgjDAC3aG7Rag6YX938rsO6pj3PotD89Ipe3lQA5/S5dX7ruRCrv+
   MBithApmV3334ToPPeGsl1EwiNSGWy6Awbo5O4q3Swtwhx0mWLoVb++SO
   EqPUtbTEAhAajwxxNnyOZB/nLqGFvn4Tg3/ddctcAh4T8ewhfsIo97uQU
   1pyT31ODDloC3ePNk0ZnvFFzffYKTUKEFiiqHKTj3TZCx/u1vyp3qzgQN
   1/kfUkhZLCArE0jLpEMLihfhBcJ6bc4a1nZiNuFD6GOya5FGiAtV8zgnG
   ai0zlt3GHHKWGPYBYi5Jjq2TnwVSe4zuGeVE/icpAynx/ncdT106+GyTK
   w==;
X-CSE-ConnectionGUID: wEiDgIsmRXWRR524y229gQ==
X-CSE-MsgGUID: WUe4urFLQ02AKJaxpLdMlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="83372972"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="83372972"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 04:29:28 -0800
X-CSE-ConnectionGUID: yR6KHBTRRd6V4WMHZskPig==
X-CSE-MsgGUID: +h88LxPgT0SjMyn8OmDYYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="196612712"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 04:29:27 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 24 Nov 2025 04:29:26 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 24 Nov 2025 04:29:26 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.67) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 24 Nov 2025 04:29:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O6JtAxHWGYkArwXJq0b8ETJ7wgUOCcPdo2APIAW2cSTWE/KFZd65JVOk+Q7Qffdmj8Oz6WbCAMoYC7zz/LJrPfA2bncCKHND+1q/Kx7UBoPwx4lH0eL/1You/Sr07bdN/i4Ucj5RvqgJY4vz1B61GN9Gl+hQF1vwuLQD5T5trKZgvFRXNI/bmP6+xiXYQg/dzd85ngjn6MSxL9NsxdOFul7c0hvqx0lK+7z2efVhwr1tb+jG/raHG8CNkgX19sfzrlkB9uZmlLTrKfG7R0rI5pvPZXImz/81grNLz8KM3hW3H2ipnHGR81xDH8LifHgMopcXVC+z+D6XMXVnBYxWFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U30Ggx3Gs9d1LMPy09Gp5xPreBe73OYnWHq/Mo8rkaU=;
 b=W0dXry33kE8XyDXkeVY2kPBHSdR+uB+rhI8ZUALT2dB92f1rsFiK59UW+hV73DqFWYmv3aO1SUOXgZsbAjx9VfhtSwBHpoAwfx00PAu2xi4FmIqSiXhdLzBUAdYXurzzZ2JG3n5UglATLlfdaImJjqILDZ6was67TCTEmzq7qRzt2QqbzbPwID6Wr0aXC1Gypd+6nu93mJ3NbKVI8OmEy+1XqtcSqDhoBRt+gBj35ii3XBU//XaXaIZvHo9/p5ITS+WMWuaFz+F34eaXaTF4HbLKlwDreltciWCCP/1krf2X4J7rpO5iibw0ysXwvq1v5s+Jtnf9WMiyZQMgHdaZfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by SJ5PPF89507EDE4.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::83e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 12:29:24 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%4]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 12:29:24 +0000
Message-ID: <c33d4de9-cb5d-497f-b6fd-1e781822c792@intel.com>
Date: Mon, 24 Nov 2025 14:29:17 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 00/12] i3c: mipi-i3c-hci-pci: Add LTR support for Intel
 controllers
From: Adrian Hunter <adrian.hunter@intel.com>
To: <alexandre.belloni@bootlin.com>
CC: <Frank.Li@nxp.com>, <linux-i3c@lists.infradead.org>
References: <20251118164453.55532-1-adrian.hunter@intel.com>
Content-Language: en-US
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20251118164453.55532-1-adrian.hunter@intel.com>
X-ClientProxiedBy: LO4P302CA0035.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::11) To DS0PR11MB7215.namprd11.prod.outlook.com
 (2603:10b6:8:13a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|SJ5PPF89507EDE4:EE_
X-MS-Office365-Filtering-Correlation-Id: b2858cb8-2a92-4f3e-12e1-08de2b551926
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cWpuZ1FDSFc1aW96KzFtV0RWKzg0dmlEVzJQdllad0JQMG9iaGpoa09TSlZH?=
 =?utf-8?B?b1hDYVBWMzFJZ2t1WGJ3U2ZPcHNvc01URVJYNU92ZmdWTGV0V3ZmRkhDQ25q?=
 =?utf-8?B?dUhDZ1R2NFdDSkpENE8yRmxJYXU2V3BISXEzVGFNL2dTc0tMRzRhNk9iNU1z?=
 =?utf-8?B?MzM3ODYzcHM4YmV6T1ZiMERBTmlLVjVEMEV5SzBCUVRYeTRzY1VTOXZRTkJh?=
 =?utf-8?B?amtiSks5OXdvdFQ5cG1xNG1TY3A4TU0raExkNjBhWVhJbXJadFZGQ0RGRHZa?=
 =?utf-8?B?MDRCMFpybHpXMENyNGJkcmpLRWp2ZVdXYUVSMS9ZMm5hWTZCL29Md2lhdUpL?=
 =?utf-8?B?eXZnY1grNHJsQWRBRDJjVW9haEdYQjhvbi8rMmx5cHg5Tm5McDlYSlowc2Nx?=
 =?utf-8?B?Z0RVRTRkSndpa0RZZ2VsMGZmU29IWXBVRTM2dnBCNW53RW5CenFqNmMyLzFz?=
 =?utf-8?B?RXFEWG4yTEJQb1VpbEpoeGp4YlFWc1FiQW9ORlRjSzQ2YWdxN1BDSVJ2Zks4?=
 =?utf-8?B?eWQ3NUtTa1BlR2MrNUF4Zk1sTXFxZFZyNFYwcTQ5a3FLaUxVdy9IN21MMmQw?=
 =?utf-8?B?b0tFY0NsNFhIRFNYcXJoRlhvbnMyVnZFZDY2UlFWa3A1VHR5VzM2cHk4dWx5?=
 =?utf-8?B?aWdOWlZwbVd2dW44aHhzMjNuZUtIbjU1Y1kyUXkwaEFsWGNYSWF6ZmRqU0J5?=
 =?utf-8?B?Ty8wNVBoZzlSUVpTZUtNdFlsRVJFVUtXTmxNanR1NFpDdjRyTm1Yc1IycUEr?=
 =?utf-8?B?M3J6ZFMzd3ludWhaK2ZJZk9PUDkzbS9TMlc4cHpzcE03ejJhRTM5OGc0VFhT?=
 =?utf-8?B?WlBYRGVHTUkxMDV2NFN1TGNKZmNFY3hKeDVqSGxPcVpOeUlyTlo5RHE0YnBJ?=
 =?utf-8?B?N0VKMHMwWWowTGM1VXlvclZINEZRaEpnY2pIWUpCcmZsNjRUTFpOUEZabmQy?=
 =?utf-8?B?OXh3R01ITjRYRU82enQvVWJld2VLRFdVTU5mSTJLWmFaeEJSak1ZVzhRR0Ra?=
 =?utf-8?B?d0xoYlQ4bXZFNDI2NGFuMFVPeWdOZ1VPdVFhdHVVSk9TZHdUeHNTLzB6enp6?=
 =?utf-8?B?UC83ZFR6M09malBrTzhGZkh3dlpXTU45SXRjYTIyUmYyUTFLbDlYbkpEdWpY?=
 =?utf-8?B?empDd1dnNys4MGhQZ04xVDIzZll6UWh4cis1QUNkSDdwWnA1RjJHdnRZSXdr?=
 =?utf-8?B?LzV6U0UwT1B4VUxmMmlWRHNPVWUyZmk4Z0VtSk1TbGNxd3lscUl0MGFiRkJy?=
 =?utf-8?B?RkF2WFFSaWVkVy9veTZrNDc2NVpsUkNVSUNCTmFUd1FwYWNSNkxaek8zVVAz?=
 =?utf-8?B?YzRkY3NQL2pKVWJTYjJvOE9mVkREY1d3QmNZb3ExTEtLaktEKyttbmlwUjE2?=
 =?utf-8?B?aGZBWVg5ZWtsaEdhejBtVDNYMkpIdlBnTFgwYzU4M1VrSEpMRjRTSEU3Skkw?=
 =?utf-8?B?ZWJDRXh3enZ3QVF3Q1lyOTNSKzczbWZ0d3FGYmZwSGU0TU96b2lxa0NLRnA2?=
 =?utf-8?B?VEkvTmhrTEZKRXFnbGdWL3Q5ZzFadkJFNHAwWmxzMy93ZWtJVmV6R292Wkhr?=
 =?utf-8?B?eFViRGY0R056VUVJVHNqbXBYVVZ5OEhUbGdsc3dwZXRGVStjdTA1MEl4RGhk?=
 =?utf-8?B?RjdMME9YSjR5cEJWRlhQMVJOeTVlYTJKRWdqUkZkMndaOGx6SndTdWVPOHl1?=
 =?utf-8?B?Sm5uYjdjYlo3T1BpZFY1Q1ZvMFczRmRwZGFEd3lWN0VBK2ZjQjR6cnBMQnJV?=
 =?utf-8?B?TFZFZ210ZnNQcVpaT05LYVg1dEdMTEhEVlV1VnRwbUNKZUNETzhZZUVBWmJ1?=
 =?utf-8?B?T0d6cnBQWmE1MzlYbUJoeDZzbEF6RC9pSXArVnN2YXh3RVlxSGtWbFZaK1NF?=
 =?utf-8?B?SlZXZU1CYVBDd3VFL3NuaVcxc0h4VHJ6cDJ2R3Z0WklsYk5JNlZjcUc0Zm0r?=
 =?utf-8?Q?/QrqaUy7RNxXMPtn5nHYvUY3iYau2BzZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFlqb040bE1LYVBuR1ovQjllUVArYUR0TW1tbGwvR3VrYm5rQm1wRkh2dlA3?=
 =?utf-8?B?cHFaTXBZTWtrZ2MzbVhlUGdtK3hNQXlFeGtZc3U1QjN4ZklMa0c3dWE1RWht?=
 =?utf-8?B?SEZkTGI0Q0VEZjFKYUM1bjdKckp3RlpXYldYalJlZmN6VCtXMWxSUUE0WkNm?=
 =?utf-8?B?L2V5ZGtIMjRlYXZOZ0R2dzZxb2d0aTR3NC96clJ5cmk0d01zS3d1b2pPQ3Ny?=
 =?utf-8?B?NzBWSUdGNjk2ZTJNcnQ0bENJRDFyRkEvUkcvQlFMbGtOUGdjVXlpdXFzV2lU?=
 =?utf-8?B?eFNGL1B3SzlUVU1keFVXRkxqRkVOVHV6dWJ4aTVQYTVqTnNqYWloanhiUnk1?=
 =?utf-8?B?UU5vZWEvQ0tDTjdDeDcrSis0SktvbENtWTY3RnRGZXh0aDluSVVkbi84ak9K?=
 =?utf-8?B?U1ZjWGFzV3M5UlhnV3NCcGRLMmRzTFNqWDg4Mzlkam93RTB4UVdsQVExZmlo?=
 =?utf-8?B?ZXhTdmRJbEpkQXZuME5xYnZjYmxJYnQyS3ZxdWJPVUNUNDZVSTg2eEZ1QW82?=
 =?utf-8?B?bzRrSlNkc2U3WjN1V1FsZkVaZHRrNDlzTDVpOGFLVjdiNnJ2UjMxVE96ZGg3?=
 =?utf-8?B?NzFMOER2TGs1cEp2enFmSmdlcmtkMmVRVE05ZXl0a0tIK004OW1MZ00vS0dM?=
 =?utf-8?B?WktyU3czeGVZSTd4bVo4Q1JRTmk0ZlhjL05OcEQ3dlNVRDZ5Z0FKRDRZeDBZ?=
 =?utf-8?B?dStQWTExbWM4MDNwakxrRldRTEJ3OUlqdFlsVE1yZ1Bzb25HRzdhbUVLZVc0?=
 =?utf-8?B?Z1o1UEd3YVRjVW9PQjQxNFp6WjNxU1NYQ1BpQlEvL0NrV3dRbk1zZkJRMGtG?=
 =?utf-8?B?SzFSYUR2KzZDY2NJYUc3LzFDb0FaM0t2dWFBeEFIZTZuR0lmblM4aFd1SVRD?=
 =?utf-8?B?UDlFN01VK3NhbXpHZmh6QmlDN2FQVTIxc2hHcFk4REpYMWdvVDg4Qmh3cldE?=
 =?utf-8?B?WmRFQlIyN1FqQmVEWmtFRXJMbUZUZlhkayt0Vlk0bUJiOVRMNzR6cy9OU0JD?=
 =?utf-8?B?RG8rbm5PRGRoRStYTFJDQXdaTHhDLzlqcDNabUM1cG5kMExNQTRNOTRhV0Zy?=
 =?utf-8?B?VFlWL0EySWpZbVl1UTVyMXJzMno2MldaekNra2I1dnFWUllBK05MUlhhcFhT?=
 =?utf-8?B?cHFNbXRrejRkMllVL2Y2Rng3alNoWTRtYW9KTGQxUnZjcm40VTd4K1VXT3Bs?=
 =?utf-8?B?dkpNREJFbXNZS3FOU0hQRnJZak0ycHVrenhrSUhSQ2NTLzVSdHR0eVF6dVBF?=
 =?utf-8?B?TWtQQnhmMm1JcjU1NFBhRy9ZVUdVTmxJV3dzYklIcjdGdG00SkpseGxEbTEr?=
 =?utf-8?B?aGlvQjRiQ3JEVUlFNVcxVmNSa0tvN216MmZ1YTNXdjVpS0lBUnpNYXBmN25M?=
 =?utf-8?B?OEVjZG9ZSmZNUlNNQys0OUQ5dllyN2RvUVhkSlBpcmFLVTRITCtLUkxyNkJH?=
 =?utf-8?B?R2g4TCsxYWxpNGw3dFFjU2tpQnNuUjh0QTlxbFdjcktOdE5vVzErM1V5VnRF?=
 =?utf-8?B?RlVnZ0pLaGc1Qldyc0ovOHpXQ2NZTW9vS281ZGdTQXNMRVRrZ0NDY29PWkU4?=
 =?utf-8?B?OUYrdEtOaUJ3WTlTVTF4MlhOL0o2UXpZODFuelp3U0g1SW52bmhzOE5TTWxW?=
 =?utf-8?B?cGVMR09sbVE1TUdLak1oUjg3ZTJWM2hzSGZrSlUrdUx4M1I3YmM2OG1mZFd3?=
 =?utf-8?B?aWhqamtuNS9iTi9YTlI5UmxJK0tPRFA1cHorZ3BUaEtRTXF3ZFFVWjcwaUdX?=
 =?utf-8?B?TjA2ZEJ1OUZ1b1lxaGI3S3lMcHk2ZENrMHlMNnFlVEtTK2I1eVVVNXJaajRm?=
 =?utf-8?B?ZUlTRHNKM2FCR1Z6MVNJN0ZCcEswV2ZTWk5mR1Z0R2dVOXA3aU52VGgvSVdV?=
 =?utf-8?B?VlV3NUxpYlNUNFV4WnVaaVFjZ2FwZTFCanE0WS9XMW5LRlZxMjNEMmt5amI2?=
 =?utf-8?B?ZG82OTcycHhJRmVkL1c0QjZxUURjeU45MXFudUN0cndGSDcwQktuVGJxbGJH?=
 =?utf-8?B?dW1jZVNybHhid1JxRTdQT2JXWm9aTDM4bVZZUmlCUlI0TXVMK1JNNEJzZm1u?=
 =?utf-8?B?emc1QW1vVmZsUFRTZG84SDY5dnNHVmR5cmxaZjlWVU5sUnBwNUFNZFRPZEhM?=
 =?utf-8?B?NEpnZERNdUtVTXYvQ0QxSi9vdzlLZm9razd4UnRQQmRaVXhPTnV1dlRSajlx?=
 =?utf-8?B?Mmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b2858cb8-2a92-4f3e-12e1-08de2b551926
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7215.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 12:29:23.8837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SvAdPshaNAsEvW9ApkQdr00ERjBZM7UxHaA3oDazxatiZHEeHgbuU0tCDAkWoMmcXmzoPHIFFZtfWnCg/afCLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF89507EDE4
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_042928_381927_2C06C7B7 
X-CRM114-Status: GOOD (  16.37  )
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

On 18/11/2025 18:44, Adrian Hunter wrote:
> Hi
> 
> Here are V4 patches primarily to add support for Latency Tolerance
> Reporting (LTR) for Intel controllers.  Most patches are small tidy-ups or
> preparation for the main change.

All patches now have been Rev'd-by Frank.

Are they OK to be applied?

> 
> 
> Changes in V4:
> 
>       i3c: mipi-i3c-hci-pci: Set 64-bit DMA mask for Intel controllers
>       i3c: mipi-i3c-hci-pci: Move all Intel-related definitions together
>       i3c: mipi-i3c-hci-pci: Change callback parameter
>       i3c: mipi-i3c-hci-pci: Add exit callback
> 	Add Frank's Rev'd-by
> 
>       i3c: mipi-i3c-hci-pci: Add LTR support for Intel controllers
> 	Drop intel_actualize_debugfs_root() that created 'intel-i3c'
> 	debugfs directory.
> 
> 
> Changes in V3:
>       i3c: mipi-i3c-hci-pci: Set 64-bit DMA mask for Intel controllers
> 	Omit mention of IOMMU in commit message.
> 
>       i3c: mipi-i3c-hci-pci: Rename some Intel-related identifiers
> 	Add Frank's Rev'd-by
> 
>       i3c: mipi-i3c-hci-pci: Use readl_poll_timeout()
> 	Add Frank's Rev'd-by
> 
>       i3c: mipi-i3c-hci-pci: Factor out intel_reset()
> 	Add Frank's Rev'd-by
> 
>       i3c: mipi-i3c-hci-pci: Change callback parameter
> 	Improve commit message.
> 
>       i3c: mipi-i3c-hci-pci: Add exit callback
> 	Improve commit message.
> 
>       i3c: mipi-i3c-hci-pci: Allocate a structure for Intel controller information
> 	Squash into "Add LTR support for Intel controllers" patch
> 
>       i3c: mipi-i3c-hci-pci: Add LTR support for Intel controllers
> 	Squash "Allocate a structure for Intel controller information" patch
> 	into this patch
> 
>       i3c: mipi-i3c-hci-pci: Set d3cold_delay to 0 for Intel controllers
> 	Add Frank's Rev'd-by
> 
> 
> Changes in V2:
>       i3c: mipi-i3c-hci-pci: Set 64-bit DMA mask for Intel controllers
> 	No need to check error from dma_set_mask_and_coherent() with a
> 	64-bit mask
> 
>       i3c: mipi-i3c-hci-pci: Rename some Intel-related identifiers
> 	Rename 'intel_init' to 'intel_i3c_init'
> 	More explanation in commit message
> 
>       i3c: mipi-i3c-hci-pci: Use readl_poll_timeout()
> 	Change 10000 to (10 * USEC_PER_MSEC)
> 
>       i3c: mipi-i3c-hci-pci: Constify driver data
> 	Add Frank's Rev'd-by
> 
>       i3c: mipi-i3c-hci-pci: Factor out intel_reset()
> 	Move location of intel_reset() to get a prettier diff
> 
>       i3c: mipi-i3c-hci-pci: Allocate a structure for mipi_i3c_hci_pci device information
> 	Add Frank's Rev'd-by
> 
>       i3c: mipi-i3c-hci-pci: Add LTR support for Intel controllers
> 	Make use of FIELD_PREP()
> 	Improve handling of values that exceed the maximum
> 
> 
> Adrian Hunter (12):
>       i3c: mipi-i3c-hci-pci: Set 64-bit DMA mask for Intel controllers
>       i3c: mipi-i3c-hci-pci: Move all Intel-related definitions together
>       i3c: mipi-i3c-hci-pci: Rename some Intel-related identifiers
>       i3c: mipi-i3c-hci-pci: Use readl_poll_timeout()
>       i3c: mipi-i3c-hci-pci: Constify driver data
>       i3c: mipi-i3c-hci-pci: Factor out private registers ioremapping
>       i3c: mipi-i3c-hci-pci: Factor out intel_reset()
>       i3c: mipi-i3c-hci-pci: Allocate a structure for mipi_i3c_hci_pci device information
>       i3c: mipi-i3c-hci-pci: Change callback parameter
>       i3c: mipi-i3c-hci-pci: Add exit callback
>       i3c: mipi-i3c-hci-pci: Add LTR support for Intel controllers
>       i3c: mipi-i3c-hci-pci: Set d3cold_delay to 0 for Intel controllers
> 
>  drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 215 +++++++++++++++++----
>  1 file changed, 177 insertions(+), 38 deletions(-)
> 
> 
> Regards
> Adrian


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
