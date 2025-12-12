Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2135D4922D
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Dec 2025 14:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=IzTjuem5CGu22agC2RvqczLnYXV8ngQuxqffeIgl1/E=; b=lP5CN7kjsU3QOC0IQRHJJgyf6d
	Ale852CqFQcvaSiSqsNcPMZFmotH5iXfFWDXwCjvGTjdlZ5efQyE5JyvcvH2ZGf59mAphvye4EoaE
	GZhnBQyoGnrwWosItCC78LIXSZarEt3DziZhKfM99lRFV5guHew7MOcVFYbjD6fpLkWW11Y3gBFxI
	DxRj6Pf4ZsDTaGGvgsWWrTUfTL6WmhAg+WtYsn7Q2rXvZMCN2xCXENHbpIJbMaohu8spX8GBvE+XA
	6iRmX72RCjn4p5iaXxgg6ADaC1MqjHtVpplrrcd5es0jlQFQ5rFTps/un5HNM1qeL9noGH3mmwTh8
	yb7CDtdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU3p5-00000000bhJ-1Rkd;
	Fri, 12 Dec 2025 14:08:43 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU3p2-00000000bgw-0sgq
	for linux-i3c@lists.infradead.org;
	Fri, 12 Dec 2025 14:08:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765548520; x=1797084520;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=84MfwdcScSj+E9hBWxZZts+VLRaPOmLL7FzeT8bDgng=;
  b=gpwgnt0OdDhXDZV0GP2ni0rwQlB94jAkEG2d6Tf9Bbwv5buQ/02dWp6l
   DoW/ugJmPnfLEyUXEX1AZrtSd2hvyXQOl9Egn2anPfl2PLVmk4tCfYEsx
   pWKbPdBf+rn63FEf+SLpnVAkcJAL4FCv47SghLFq0BW5ljmS4dnLIJEBi
   ni6pH6CqPlTGuogFFPAAZua0iH27buX35hOLL9gsSp1oMFMhtJlZ3cPyw
   mdM4wwPM8G+XarHx6614RNjnPobEHjWfA+oKgWN1jZLRRilu/0WpWKKbk
   ma72proYzrIshiYXCaecElvg5q8FzfBaOvnh7QSluYK430EOQjCmIsCaE
   A==;
X-CSE-ConnectionGUID: brIJ08oBQtCC2cRC+yiMpw==
X-CSE-MsgGUID: 1uQR/zPwRSCbaVyJMAzYOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="78188500"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="78188500"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 06:08:37 -0800
X-CSE-ConnectionGUID: jYpHaVWjSSKaJMAyQE0sVQ==
X-CSE-MsgGUID: nSCebBAZRba9RTHoKLHKWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="197162964"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 06:08:36 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 06:08:35 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 12 Dec 2025 06:08:35 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.63) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 06:08:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uG9W0XEi43k2JI97uvzeO2HGwnOUVPVhe04jL2TPOuyGpW1zosx/Y2k5i6A9yMA7CzZ0kqpTry9uOExS81GoTv47+4+jXAYC+ZfrrjSrjgQWHGFBMTirTaE8RapxbQxpEsvzzEr2vRV4jkcjOk2Ac2BrmnywNkX3djp8qy/+eXmGENJKPwIcApYDiu7hze7j2OdMuyBnOj5mv7sdWNRSrvb6KT4hkyd59UTwqL3DP9kTShTt9VbJ6hXU9NwhFX1ZSkr8+3m7OAqdG6333o4kYYwlFCI2QCDxiIHDxc2E+YAJiuONcEUsBuTTXhTa9sQzD6lpJOTWI8twKQWWOLy+4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cj2pylO1O3RDarU2o6TZP5JkTt7c4+urwIz/O6tfgWY=;
 b=dz88qcS1xnfMS07sUslPx19dvxN0Aqb2dsEhW/vGz/KdYaaS/B4n21DTNxLJxgNfrffIecDX2GJ+Ofljg9lu6Q43zssvg9c8DVac377h2oJ8VBEM2JGO03yBjB4tfAj8L0moLtkn6jRoKYvk0Knru9DBzeFoClI/TiQZ0vlOw/feYA02/AXOQq8UqJApKxXT6yNyCGTTpPQjRPdcJ/dusZ41KAocVi6i3aHzgsfLCln8eDWC++ygHSIjQtWfSupDRojqdI+maxNh9TapX+Ep2hChMcmKSa7JlcEW1bEUmdStKw6Hi8FgZhzSCkV8PjHJL1f/lhTfsboPlxUbGHXdxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by PH3PPF018EB8BEC.namprd11.prod.outlook.com (2603:10b6:518:1::d04) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Fri, 12 Dec
 2025 14:08:28 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 14:08:27 +0000
Message-ID: <a2f817dd-99ae-4631-8879-8c2f9bc2d6cb@intel.com>
Date: Fri, 12 Dec 2025 16:08:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 09/10] i3c: mipi-i3c-hci-pci: Add support for Multi-Bus
 Instances
To: Frank Li <Frank.li@nxp.com>
CC: <alexandre.belloni@bootlin.com>, <linux-i3c@lists.infradead.org>
References: <20251211134809.75872-1-adrian.hunter@intel.com>
 <20251211134809.75872-10-adrian.hunter@intel.com>
 <aTr07CVVD0YSN4Ax@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <aTr07CVVD0YSN4Ax@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: DUZPR01CA0170.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::28) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|PH3PPF018EB8BEC:EE_
X-MS-Office365-Filtering-Correlation-Id: c4c8ded8-99dc-4b5b-11f0-08de3987ec04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZDgyNHpJYnQwYnJCYWU3anNLaFYyRytsam8rYi9aVU44ei9wNVdjbEFsOEZK?=
 =?utf-8?B?Nm84Y01BTkR6T25Jb25xR1lCZktQZU1MRzhOL01UUnlFL3ZyelE4bHFUU2FJ?=
 =?utf-8?B?L1BaWWpuV0JvcGNVVzJuaGpOUE8xbTRLNG8yYUxpMTdUVFlFdmpweWg1eXow?=
 =?utf-8?B?NStNZTRoK2VMTG9mUEo0M0hxQjBlWXlVeGczNmVXZVROM2phS0luRVc4MnRz?=
 =?utf-8?B?WkVBRHNzMllDR0t5MEhjZ1BXWXU1R2t4ZXNWUUg3OUJybHpjMCtJWkJOT00w?=
 =?utf-8?B?OFNuTXN2Kzl5czJPS09tcFpFc0JEcTFRWXcxdzNVMmE2aEZHeGg0aGtFOHRP?=
 =?utf-8?B?Q2s0UGhYQzZlNGZGVkJraUtNdnJHOFM1QkZPVWxGUmtQUHFQSjZkSlk2aFJr?=
 =?utf-8?B?VXNJSzhkSVJnMHdlSTZNZS9OQ0NFM1FSNmZjOVNDa29NR016akZCUnVuNnVW?=
 =?utf-8?B?U1N5UFZMK29zanYzZUxWaGlSalkvczJmNi9zOXNxbSs3emhlZVJOTVJsQVgr?=
 =?utf-8?B?RnloSXBZSHJ4N0hmbGFyMUJKQmoxVUcrbTBLRERadmNoY2g1NUR3RmV4M2VY?=
 =?utf-8?B?SG1iWWtXcktxT3BWY3Q0RVFqaGlCZW9JaUF0VnE1N3Y1Q2RENXNXZEZQS3pS?=
 =?utf-8?B?SHVaVkwxTEhJeWxSQ2VyWU9OcHIvMDRJQk01ZEdVa200M2lrNTcvMUo4N00w?=
 =?utf-8?B?MFkrTFRRaGpkOFZIb1AzUlp6MXlubGZYdi9BbHJOOEJhNDVCN1V0cWlUcFNE?=
 =?utf-8?B?M1MrWkZEOFE0MnVuZE9MUjJsTTJBYzFlRHk4RGR3aHN4TGVVRUR3dThncEJp?=
 =?utf-8?B?aDFrUzcwMFVqU1RIZkp6RmFkR1JTZlFxVGtxUUQ5bS9ZSVgwRDlPN1N5MmlP?=
 =?utf-8?B?dmk4bjNZUWlGWUFkTU9ZZkk5MXIvVXZNUFdzVmVsOHVvMUdyRllNMzJmZDE5?=
 =?utf-8?B?b2FDbGJkMEdscklMNFZwZitHSmtudXpZNngybmMxL3MvSTZNOXZvOWFDTyt5?=
 =?utf-8?B?MzFrcWlJZHdKYlJyV1UyK0ZQcmJVck03SEpNR2JWcW1HVW9RbU93aGVsdXZW?=
 =?utf-8?B?UWRreDdaM3NhbStSL0gxVmlxTDJRVDlaMmYrUE5HS0pIT2o0VTBrbFdFb2hT?=
 =?utf-8?B?a2V0UGZTVW5oaXFObG1zZ3RyaXpiRnI5S0Vzc3JjUlFteG53R3Y4OGFBeFZY?=
 =?utf-8?B?STRhYVVSbGZRK0duS2dGT2dUNGljeFpZRXVuNHZvc1BLTzJjRFlNOEVXUDEx?=
 =?utf-8?B?WHlBVklzcTMrUUI2UHVPdWVTdExOeTlodkRiUDl6Zi85UUgrZHVweXZFS3Fr?=
 =?utf-8?B?N29mQUt0YVM3VTc3Y3RRMkpUb0twcWJTWit6MDJRdHlCY0hnbEZiZDJQdU54?=
 =?utf-8?B?eDI0RVhFMGNMS01zbTlCZ1J1NkwvNTh5SU1sT0pYRjZjOXdhQTYrTG9sc3U3?=
 =?utf-8?B?NFRCUi84SFlEdFVDVFkyYmZMZm9vMUhXaURFaTdUTG9tWGtTSFhUZGtjcEZz?=
 =?utf-8?B?dG1PWXlhR3dkaEsxbEwxekt4MXp4blZ1bE1Ia0t6bUgrRWJKYUx4cVJhZGhK?=
 =?utf-8?B?RXNXTzhwTHNWbzdkdVllUXp6TEZ6TU1EdmlPVURyL3lRZ3crcXRHWlNJTTRq?=
 =?utf-8?B?c1lsRzBUSnlpc1dwa2VSMWxLWGJsVTFaWElvSTYveWxsaFRPbEtaeVFGbTNh?=
 =?utf-8?B?RUVHeUxrbUw4Vk52amNzWDhVMUcwRUFXZTI3Yzh4YWd0TzhmWS9qalowSGVp?=
 =?utf-8?B?dXp5enRVNk1idUh1SkIrL0ZWVjRLbXdKQW5pVTBvZjBRQWN1N3RJQXlRL3B6?=
 =?utf-8?B?RTg5MjBLL0JLbTNYOURVV1hGRzBGTS91WXBZdjFrMFFUSVFzYk9aNWRnOVZJ?=
 =?utf-8?B?YksxTkVJR0thSGVqTEpESXRGcmhxaU1uYzB2RXVwOGVaZTBHUVhlSGJuWEVS?=
 =?utf-8?Q?4FafXmSo8nWall2Ezi+Np4TDyGptGtQd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmhlSE4veVpmdHQyRkY5dWJCd0JaNGxnV3ZZOUxrQUZ2dHR4QmpjRjhKY1hz?=
 =?utf-8?B?S21vaVNLelJaQTd0OTdzYmx2YmdkS3pOOUF2aVEvU3RLZDliN0pOcjRrVkVr?=
 =?utf-8?B?NVVvTm5GeVZJL2gwdUdsT1JDRm1mRy9yVXIvZnpGR0NCNjFHMkZybFVHaXBv?=
 =?utf-8?B?SnZKYTZjK3lSTGVoNmVsQXBZQlRqdk5MM0s3NWNNM0VTMnhKTWNvcks2Rnly?=
 =?utf-8?B?WVFscWlobW15dnFKYk1Sa09rUWJnT3pCVVZjZFFYdDdYclJVSG5pd0pvLzlu?=
 =?utf-8?B?QmdscDZtRnEySkNGdXB0S3ZNVE1tbFZleWpRdGE0czd1Y1QyYmk5TGZmMmRQ?=
 =?utf-8?B?aGJ6QlNpRURTMDYrU2ZsUWljMTVROEJla0tPU2FCSi95SVR2S1pJdk53eEE4?=
 =?utf-8?B?Tlc4QnF5SlJDL2tXMW94a3RYOTA5VzhjbmRFVDJuZTdrVzNvdkx4U0owbWoz?=
 =?utf-8?B?OHZJZXJVV3NWa3dRcTk4eHJ3anRuRUhrRzJ1WkNXNTh0akpDSTE4VU9yTEtX?=
 =?utf-8?B?bFhheFlrT0FtbUp0OWlTV3dSM3N0bVovaUVXV3ZWUVgrZDN0UWx6dTJhSnd2?=
 =?utf-8?B?dnJjR3RyY2ZOdzFSS2RaVDN3RWpQMCtWSE5tU0Q3c3ZlQVN1Z0JFVWRmSXBo?=
 =?utf-8?B?ZzJIM0M0dEhRTkpkSkpaN0tCWWRsajc0eGVTUnp2YkZYVE5ybjc5V1poVFRk?=
 =?utf-8?B?UjBvUTNSaUo4N1BrWVRmTDRZbGNDZ2VUbVdwWXN6czVJaDd0OTUwNEdOM3ZP?=
 =?utf-8?B?ekxFcGY2L1NxcmZtTDJzK2FIRDZGWXpObXJxck8zYlNnczNyWmlzSkxydmdw?=
 =?utf-8?B?MHFoZ0ovdkJyRG04Q2Nrd3ZqNEhRVHFYYWVKcGJnL2JiSW9GajV6bzNydXRD?=
 =?utf-8?B?dnBEUG9kZ0I2OVdRTlp0R054ZmxTcHJuUlBxMFk4ZVFOd3B6WmVwVUZMZkRY?=
 =?utf-8?B?S2x1Y1REbWJ5M0tNUmI1WnBwMlZ5TUZvZWQxZHZ1OVBrN1R3SUc1N1UzQnh4?=
 =?utf-8?B?aVJtOW4vWDlRNUp5bmx0eWlIMTR3U1dHMEliN1dZdjEvWEkzRk4xaUtwb0Fq?=
 =?utf-8?B?andCMjlUMFhmTFY3cWJvUnpBelZrSy91SWluVGxUemhEVE4zWHpkR3dHZjVt?=
 =?utf-8?B?OHdDVkJBN3NNU3NWRG5Yd3FnanBFUjIwcGVlOGhlanRpelJ3MW42Uy8xYjRU?=
 =?utf-8?B?UEVleVNidWREWnRJaG5yOEtIUVZjemlzdjZPYklQaUVSdUJHRnB2NjJJN1g3?=
 =?utf-8?B?anBKVEtJSjArRGlpN0EzOTdmWmt2RlJ5SVhGWVNOQlpUVHZwT2dBU0UwK09Q?=
 =?utf-8?B?RzRob2JiNVJqcDBlMFZHait2WUdUSU5JL21CU2VXTzNDZlZPRmdaWkY5d2tV?=
 =?utf-8?B?RlZ2aGYrSjZHQ3pEdkh0cEFreFBweHl0V0NDQ2pCaVNRSUFJRmdCUFluMHkx?=
 =?utf-8?B?aXExQUI1ZW9jL1YrUWdhVThOcVNkZk9nL2psd3F4bkk5YmhWNXo3MWRYVnRY?=
 =?utf-8?B?WjE5SUx0NnJKS0k1UTZLK2hkU0lzWWRDTE9sUkh6MXNTaHpvSXZ6aG5ZSVJD?=
 =?utf-8?B?cjJnVkJPSDBiUmR2NktncWk2c3NMWEsvOVBuVW5Ed3I2SDVkRDd1VGVuOFV5?=
 =?utf-8?B?dEdmWmRYZ2lvWnQ1RGNINVEvSEUydUxVV0ZXWEkrOU50ZzFMMHh2aW9uM1Ir?=
 =?utf-8?B?SERzN3Vxd1V0UkErM3ZacHBMRmdiNUdEd2xWV2U2aWlRSU9YS0NRS0FQclhZ?=
 =?utf-8?B?ODhyVjJVaUpJWXFqRUlrN0h2a3JmbEVDaGdhU0IyZ1pqS3dFWTFGbkdORWJX?=
 =?utf-8?B?eTBlWDJYMEs2a3hFVzUxUWVwZHlPVlc0WStDZWRKYXB6SmFKdVF6d3FjdWN3?=
 =?utf-8?B?SEdsa3RKanVVaW5qN1NkS0hmdVhXWCthRkpZTjllMkFQTWNCbVJvdUQ5c3Fv?=
 =?utf-8?B?UVMvS04zUmI0MVYvN2xuVXpERStFdmZmQW5CNXpOVG5vYnJkNEY2KzB6QkN1?=
 =?utf-8?B?SG5NeFl6SVk0K3VDcUtrcE1IdGx5Q2ZWL3huZFY5MWVOYzFnTmo3WkIzSlpT?=
 =?utf-8?B?UGNwRnlmWG44VWU0a0FSb1B5Vk1BRlJoWTFTd3labDF3Y3E1M2tvZGpZSkhn?=
 =?utf-8?B?aHRWbWs0YkI1VzNUWXJZZWpoZnVpMXZQb01pQXMvZ3c5NldvcnFPYVY1cXRY?=
 =?utf-8?B?NWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4c8ded8-99dc-4b5b-11f0-08de3987ec04
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 14:08:27.8511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EajlxzUZEzpUzR7nUJAfqOdsJ/C9fVreSHLZygE8Jv9v1ziC1uunhBmGZ0gnL8GuXE+jz/hjryODCVC+iyHDiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF018EB8BEC
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_060840_297951_FB1A1E56 
X-CRM114-Status: GOOD (  23.05  )
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

On 11/12/2025 18:44, Frank Li wrote:
> On Thu, Dec 11, 2025 at 03:48:08PM +0200, Adrian Hunter wrote:
>> A MIPI I3C Host Controller with the Multi-Bus Instance capability supports
>> multiple I3C Buses (up to 15).
> with single hardware function (e.g. PCIe B/D/F).
> 
> ...
>> with one instance of the HCI Register Set
>> and one instance of I3C Bus Controller Logic for each I3C Bus, in a single
>> hardware function (e.g. PCIe B/D/F).
> 
> Each I3C bus have indepedent HCI register space and I3C Bus controller logic.
> 
>>
>> Create an MFD cell for each instance.  Use platform_data to pass the
>> instance's register set start address.
>>
>> MIPI I3C specification defines an Extended Capability to hold the offset
>> of each instance register set.  However parsing to find that information is
>> relatively complicated compared with just including it in the driver data.
>> Do that for now.
>>
>> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
>> ---
>>
>>
>> Changes in V2:
>> 	Conversion to MFD split into separate patch
>> 	Simplify ID allocation / free
>> 	Correct use of __free()
>> 	Also define instance 0 in driver_data
>>
>>
>>  .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    | 63 +++++++++++++++----
>>  1 file changed, 50 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
>> index 68088967942b..de1f71763786 100644
>> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
>> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
>> @@ -19,10 +19,17 @@
>>  #include <linux/platform_device.h>
>>  #include <linux/pm_qos.h>
>>
>> +/*
>> + * There can up to 15 instances, but implementations have at most 2 at this
>> + * time.
>> + */
>> +#define INST_MAX 2
>> +
>>  struct mipi_i3c_hci_pci {
>>  	struct pci_dev *pci;
>>  	void __iomem *base;
>> -	int dev_id;
>> +	int dev_id[INST_MAX];
>> +	int dev_id_cnt;
>>  	const struct mipi_i3c_hci_pci_info *info;
>>  	void *private;
>>  };
>> @@ -30,6 +37,8 @@ struct mipi_i3c_hci_pci {
>>  struct mipi_i3c_hci_pci_info {
>>  	int (*init)(struct mipi_i3c_hci_pci *hci);
>>  	void (*exit)(struct mipi_i3c_hci_pci *hci);
>> +	u32 instance_offset[INST_MAX];
>> +	int instance_count;
>>  };
>>
>>  static DEFINE_IDA(mipi_i3c_hci_pci_ida);
>> @@ -177,53 +186,81 @@ static void intel_i3c_exit(struct mipi_i3c_hci_pci *hci)
>>  static const struct mipi_i3c_hci_pci_info intel_info = {
>>  	.init = intel_i3c_init,
>>  	.exit = intel_i3c_exit,
>> +	.instance_offset = {0},
>> +	.instance_count = 1,
> 
> just one instance? suppose at least 2, otherwise, not need this patch.

Adding multiple instances is in a separate patch

> 
>>  };
>>
>> +static void mipi_i3c_hci_pci_free_ids(struct mipi_i3c_hci_pci *hci)
>> +{
>> +	for (int i = 0; i < hci->dev_id_cnt; i++)
>> +		ida_free(&mipi_i3c_hci_pci_ida, hci->dev_id[i]);
>> +}
>> +
>> +static int mipi_i3c_hci_pci_alloc_ids(struct mipi_i3c_hci_pci *hci, int nr)
>> +{
>> +	for (int i = 0; i < nr; i++) {
>> +		hci->dev_id[i] = ida_alloc(&mipi_i3c_hci_pci_ida, GFP_KERNEL);
>> +		if (hci->dev_id[i]  < 0)
>> +			goto err_free_ids;
>> +		hci->dev_id_cnt = i + 1;
>> +	}
>> +
>> +	return 0;
>> +
>> +err_free_ids:
>> +	mipi_i3c_hci_pci_free_ids(hci);
>> +	return -ENOMEM;
> 
> You have to handle ida error, actually, it makes not big difference with
> mfd and add multi platform devices.

The ids have to be defined in any case.

MFD still handles:
	Setting the firmware node
	Deleting devices if 1 fails to create
	Removing all devices i.e. mfd_remove_devices()

> 
>> +}
>> +
>>  struct mipi_i3c_hci_pci_cell_data {
>>  	struct mipi_i3c_hci_platform_data pdata;
>>  	struct resource res;
>>  };
>>
>> -static void mipi_i3c_hci_pci_setup_cell(struct mipi_i3c_hci_pci *hci,
>> +static void mipi_i3c_hci_pci_setup_cell(struct mipi_i3c_hci_pci *hci, int idx,
>>  					struct mipi_i3c_hci_pci_cell_data *data,
>>  					struct mfd_cell *cell)
>>  {
>> -	data->pdata.base_regs = hci->base;
>> +	data->pdata.base_regs = hci->base + hci->info->instance_offset[idx];
>>
>>  	data->res = DEFINE_RES_IRQ(0);
>>
>>  	cell->name = "mipi-i3c-hci";
>> -	cell->id = hci->dev_id;
>> +	cell->id = hci->dev_id[idx];
>>  	cell->platform_data = &data->pdata;
>>  	cell->pdata_size = sizeof(data->pdata);
>>  	cell->num_resources = 1;
>>  	cell->resources = &data->res;
>>  }
>>
>> +#define mipi_i3c_hci_pci_alloc(x) kcalloc(hci->info->instance_count, sizeof(*(x)), GFP_KERNEL)
>> +
> 
> It is not good to hide hci in macro.
> 
> mipi_i3c_hci_pci_alloc(hci, x); or
> mipi_i3c_hci_pci_alloc(nr, x)
> 
>>  static int mipi_i3c_hci_pci_add_instances(struct mipi_i3c_hci_pci *hci)
>>  {
>> -	struct mipi_i3c_hci_pci_cell_data *data __free(kfree) = kzalloc(sizeof(*data), GFP_KERNEL);
>> -	struct mfd_cell *cells __free(kfree) = kzalloc(sizeof(*cells), GFP_KERNEL);
>> +	struct mipi_i3c_hci_pci_cell_data *data __free(kfree) = mipi_i3c_hci_pci_alloc(data);
>> +	struct mfd_cell *cells __free(kfree) = mipi_i3c_hci_pci_alloc(cells);
>>  	int irq = pci_irq_vector(hci->pci, 0);
>> +	int nr = hci->info->instance_count;
>>  	int ret;
>>
>>  	if (!cells || !data)
>>  		return -ENOMEM;
>>
>> -	hci->dev_id = ida_alloc(&mipi_i3c_hci_pci_ida, GFP_KERNEL);
>> -	if (hci->dev_id < 0)
>> -		return hci->dev_id;
>> +	ret = mipi_i3c_hci_pci_alloc_ids(hci, nr);
>> +	if (ret)
>> +		return ret;
>>
>> -	mipi_i3c_hci_pci_setup_cell(hci, data, cells);
>> +	for (int i = 0; i < nr; i++)
>> +		mipi_i3c_hci_pci_setup_cell(hci, i, data + i, cells + i);
>>
>> -	ret = mfd_add_devices(&hci->pci->dev, 0, cells, 1, NULL, irq, NULL);
>> +	ret = mfd_add_devices(&hci->pci->dev, 0, cells, nr, NULL, irq, NULL);
>>  	if (ret)
>>  		goto err_free_ids;
>>
>>  	return 0;
>>
>>  err_free_ids:
>> -	ida_free(&mipi_i3c_hci_pci_ida, hci->dev_id);
>> +	mipi_i3c_hci_pci_free_ids(hci);
>>  	return ret;
>>  }
>>
>> @@ -281,7 +318,7 @@ static void mipi_i3c_hci_pci_remove(struct pci_dev *pci)
>>  		hci->info->exit(hci);
>>
>>  	mfd_remove_devices(&pci->dev);
>> -	ida_free(&mipi_i3c_hci_pci_ida, hci->dev_id);
>> +	mipi_i3c_hci_pci_free_ids(hci);
>>  }
>>
>>  static const struct pci_device_id mipi_i3c_hci_pci_devices[] = {
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
