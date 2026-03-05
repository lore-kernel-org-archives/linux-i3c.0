Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09793F30928
	for <linux-i3c@archiver.kernel.org>; Thu,  5 Mar 2026 10:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=qutKp2r79//tzX2MREm6AaokYRjr7W0x7AZUA70dMMQ=; b=25aqeNqP5WDtD6jGzWLDCslBk4
	b6PlKfYjruQ60XQwLQaKaCM0Refd3x7FMu8D/6ZYZp+i6lvNKMbVkqmuW3AzkIIblGsmyWWHSJ0rI
	6jdXYs4Ifa6tQP4J3TgnUGkOFAvrafpFrMitwyN8azlljjjaDv0kG+PRAkCF8J8l/lVzVqQJJgF1R
	QO3SCv+xGwyP55E7Oxu8/uxN7j9mdfhquq371164TqRrJ8N1XkQVQo0tZoBw4sYQ6cq/Sf3HvLE+C
	iAYdP6x/RNJWxu77Cdtk2wGi7y7XqKZBhJ+eO+DTw9SMfDYQ/lmQuaMXYzLJSZQ61zVPExppHeelv
	0RdYzd7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5iR-00000001X5g-2zFJ;
	Thu, 05 Mar 2026 10:13:59 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5iO-00000001X4Z-4Bh8
	for linux-i3c@lists.infradead.org;
	Thu, 05 Mar 2026 10:13:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772705637; x=1804241637;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=92dL5l5HeY1yffhq0vj8L5qeux3Gj5wYGkGSP2KOBik=;
  b=JyBl8wm+t4HbElc3hewkDLF1XRmoJUM7tiB+uFvx9ZGjM60aOvr2aQ2x
   wO9WQ+6+Ls/DTvYNDqp868D99/c27u8vtuKT6aShsdHfulKHDMKZIjN6M
   gwCTB4Gs7PxvVi6xy6vAdTcSILNaxCVZEOoUTjTyrmWlkJiyACjVTdFYQ
   3fZ3YEz9rFwEmMyuRN/4n8NHj0gdB6xIDRoGg/tVVpXMvWoZi1IMqueOz
   5ID9Rjo0aW+LbRicsUhp+IAjYU//CHIbppSqb7ei/Hnf6ANStNb5ySG/v
   NXvZHU99nuTJq3vTZ9O05J6C8IOQCXkcsXMMyggZcHf5ZPFc96UhVVOoK
   g==;
X-CSE-ConnectionGUID: xPqBDB5PSPKD5lsyLxG8iQ==
X-CSE-MsgGUID: +GMzrLKzQgWysIGc/DzjRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="91180575"
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; 
   d="scan'208";a="91180575"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 02:13:55 -0800
X-CSE-ConnectionGUID: jvOL7fjURGyXMFJZMVdlOQ==
X-CSE-MsgGUID: h/itUbrBTOuvxEILq3iCJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; 
   d="scan'208";a="218597551"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 02:13:56 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 02:13:54 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 5 Mar 2026 02:13:54 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.8) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 02:13:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LvhvfT2nQBBWIgRB4ui3TIWzQBTD4q1Y6MmpN4vMwECPKKodgWAJQ8H/bTX5reDWJl1Q6AV5ir9KLnqc3cfSywgXzQA+eIA9R8FwWgisaH3qS+Z4drk9Pd0k/uB6KPKxzc7N7sQhE8lMx0C1B73ui75qsD9BnrRH6Q4YclEvN/b65X4ViUF5XlFsczetDBoQFpDgbE+a9/6QYub2Qvly3w/UdYYKB2xlL1nxAkEww0nTw4bG6CgTD35RO2jfao0aEVSiw+i7C4MZcWLaNIfYALt+rr2QNgo3YHZvCFI3pC+RJs9uDeut0351drT42mq9hZFOFQ/jM6R0iBamHNwoIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U4DVOK82jk35j1JKdIJ6lwIo6h3RrxfOif3gWjhnkQM=;
 b=vU0uczWmBQ1xV7zZ7J+YN3r/2aAHAIJnxDwulmi5pqNUe/I3oePvBbhjQGxVvpaR6fZLYFAVFaYMZBO3x3kgK1Fow8KLT/2AmbkXvrcxceRakNWk67mhTp5nrw/XTOojuQo76GXzGvG0aWD7F4e7c4QMn51Ot6M6okuazm5ZNXBXMF89BQFGb+ujpPNp+eVc/dd2RzKj8W9+RD75Ss7X3mb+li9i5ENXlcIABqRJirheBS6qy9jXkmzvkhjsyb/ZoHbqEdC2jSGasAaYZTQOfuA99M8MT0e5kV/roOeXdiuSfGCQdkU759qL81RapkzOLLw2AaotKQr6DzNR7ytM2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by PH7PR11MB6524.namprd11.prod.outlook.com (2603:10b6:510:210::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 10:13:48 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 10:13:48 +0000
Message-ID: <3a7eb9fe-f5bc-42ed-9cb1-c3aa8287ce4b@intel.com>
Date: Thu, 5 Mar 2026 12:13:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 06/14] i3c: mipi-i3c-hci: Fix race in DMA ring dequeue
To: Frank Li <Frank.li@nxp.com>
CC: <alexandre.belloni@bootlin.com>, <linux-i3c@lists.infradead.org>
References: <20260304181706.143841-1-adrian.hunter@intel.com>
 <20260304181706.143841-7-adrian.hunter@intel.com>
 <aaiPcEN4D3uFGeXF@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <aaiPcEN4D3uFGeXF@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: DB9PR02CA0023.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9::28) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|PH7PR11MB6524:EE_
X-MS-Office365-Filtering-Correlation-Id: a199ad96-c7f5-413a-8dd2-08de7a9fe441
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: EdX14e/GcIhJx2a261jWvxNHrGI9+NUxDK3dd7+HhqocMSa6exlf5Ymvcgu/BiKRw/pi6Q3zMjq/SWjPwein5zjUGiE0ZHPyhKvHBF58nL+dUQhpdoybsDoeQfcdQhT9HCAuvizMhq3bp3yHZS/DwoXJfJn61bOkjhGDOJ3woMWyvvRonJNb6Q3Jn0jLjfc3WH9BlvUsoV0C/j6uu+00Bi3zOO1nQPKZ4mSSGCDr1eZBmfMrMwbEnUUwYsnzCHFAVATM5Xvb8sFUozCt7xYdN6zsPgnFL8vpw8WQVxTt+DEHzTxbDEvP3Ay5yLfMh5KbOpwqycY9WEumGug8FZdL9SY3E/TJv4mdnuGmhhRmz5UfEk/kIh5Bc7AcZ5yrxegvA741BIb8z1PJskFvVOcYqpjysrITY2GujKO5h8oY/+jRvIFU8SATm3pv+thO8sDFmsHtc/1EMDwsHc0BxiTHmYl17ZAwS4Zexfl8GzfbFO/T5Z9mzihW79CsfrkOir/8S2pawDRPCTX+ZDe7KJwWpOXEbeoxjaVATX8leqdoSpCJnkPpDysWcWEBWOhyZpQVzq/IyjffnFModXhYfwTZIDFTEB3n9R2S++6npq1XsMblVYLahs+71AUHtdhDonPH7LMkmXe7Id6Tc3bU9shSNmL1+y7TRa/ClKFK/WyjezFSr0btJ3w4kJW0g9ChL+HljnA5HRt6y4WqhqiscCIv8Epubm1yoEg0Yod5ML0GMkU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDQyOGN6Qmg0Ym5uZFgyZ1piV3FKZGlJSks3bmlyVFpFSWEyRHVLT21DWDll?=
 =?utf-8?B?YjFMRWJFbnpiRE1OMkxWSzd3QndHQzhKUzJaajkvbjVxbXIyL0lPSW9xOUNT?=
 =?utf-8?B?Y2FvSTZ1WXBRZFB0VCtURFlPZjVPTzMrZGVYSllsVUhMVzh4ZFhUQS9tditn?=
 =?utf-8?B?c0hudmFEZHdQTHBEVHZBa2hGV3ZhTXpOM0pjOW1rdm9OZkdYWjFvVCt2R3FK?=
 =?utf-8?B?RHpYMldUeGxHUDljLzA1UjJKSm1EVnh2WWJuS1ZvRnZpYzYzeWg5RitYMVJ4?=
 =?utf-8?B?cGxVVC9yU2w3WTBoQ29yVndtZnRLc0JoMVNrdkdNSGlVRGhhMjJCSjhtMXRo?=
 =?utf-8?B?UVR1QUVrQ2xEU0NSdjhiT2U4NnJoQXhCWlJsMzFsVktzY3Z1eUZnUzFsMmRk?=
 =?utf-8?B?a2pncCsxMS9xQWpKd1F3VXIxNHFLOVJBamdSaFZrMHF0T29kSnhIdVFVbDZZ?=
 =?utf-8?B?cDdEeCsrWUovN21BdkplY3hTcHVtTFNrcmpNeG00cXZObmRwdTBBdVZqKzZL?=
 =?utf-8?B?bnltODJTZXA2ejJFdjM1UVIySHNMMnEzc2FUdDUzWTZLRHN1djVITVZhU2t5?=
 =?utf-8?B?WEtxUlZRR0tBd0JCZjcyMkNJNVJaRVViVDJ6VFAveU5GWFF6Z1JPYnlMOVpH?=
 =?utf-8?B?bmh3L1F3NU4rUTVXdmd5WnJHZU13aGprc0YyZlBwUUE4bHp6SXhGQWlmTE5n?=
 =?utf-8?B?eDNCZmxTR2ZPWTdjOVBZajFiRm9OVHkwa3RNNWZXSVg0OXBnRXU2UzBrdXpR?=
 =?utf-8?B?Wm0zNzVDd2Rzd2xrd0lDTzdXRlcxcTZTWWxTWStpa0lYZlYzcWxXbnJoVlAv?=
 =?utf-8?B?U202RGVHS3FVd200OXBMbXVSbTVwRjFoSnZrenFDZkR4TDFzNDAxc0s5czB4?=
 =?utf-8?B?N2VEQm5TNGk1WlVEc0tGOGU3bG84aFZOd2g0TnBiYXFXYlhydGlBTEswTDY5?=
 =?utf-8?B?aTZsRzUzNks4R3dTalhMT1lsQStraStyQnpKL3hhTzRvcHF2TmdKMTV2dmNl?=
 =?utf-8?B?K2xMa3N3YmRXSkFhMS9MWk93Sjl4aGx5UUxHbEdBRVBoQlFoZ0dyUENzVWdS?=
 =?utf-8?B?V2h2NTROWUkvK2U5U2lrdW9pQXcxSVBGeHdkWjhCcUxWNnpERjlNbk5QUGVT?=
 =?utf-8?B?REVvd0J0UmkvNVR6Rm4vT0NUYStKdmFKb1F6c3lFeU9qNWFKQXlCMndxRVlY?=
 =?utf-8?B?dHRKUG16aUpyaUgxaVlwZXlXMGRra3FOQmkrRkFrYmNETVV6UXJSZDFDdTE4?=
 =?utf-8?B?SkhZVU5RRWJjWDhobkNWRWk0dzdHbnV4enFIYnBncXlZNEFYYWNGTjM0d0k5?=
 =?utf-8?B?QmU1MTRZUGozYkt1TkZzVUI0bk1hbjBtR05POHFZcUtDdE4rYTY0NzBSY21i?=
 =?utf-8?B?NkZVWTdhR25Nd25xeTRlSWdzV0dnTTRydnhXMzRQZ3ZzM1NZUjZubWs0LzBZ?=
 =?utf-8?B?c2JZT1hMRTFGN2Q1R29wOGZ6S21USDVkK3kzck1ZZFYxOWNoY0FrWTF1MDdZ?=
 =?utf-8?B?RUpCdnRMbUxKcHlVOFpSS05hbHpJbG1KYkZCaHcvSkQyNThYRVM2d2xpdllM?=
 =?utf-8?B?WnVOMXJNcWVmVitkQUZlcy8vY1BXYjFXRUlmNU1LdG4zeUl5T0g4a0lRTWZZ?=
 =?utf-8?B?QnEwNVFpN25lUWhLMHk1dnNyUDdaanlER0hTbmVxVjZvZWdES2ppRUlGYmF4?=
 =?utf-8?B?UTVYZkRsSndDb1Fodk9sT1VXUjBnbjhoZGpPeHhZNHRIalVPRVdsQ3lZRDlu?=
 =?utf-8?B?N3hSKzZHdnRPMmlaelNlOWlQdnRscXR4ZnV2eGpjMldBYW8rdUNnTm8xdkFl?=
 =?utf-8?B?VDdKNk9ZT2VxeEt2YnhnTGZqSSt3elR1bnpGNEp1Ry9uYkVyY1ZlSWFGc1dI?=
 =?utf-8?B?Mmp6TjRnMk40WTJCN1U2dzhiZTFqamlIdEl0OXplemNMenBwcndMT2VGSnV2?=
 =?utf-8?B?VTVlQUdKSkM0UitOeGI2MUgvcTJaYnlZamVMVnJtRUd0WFNJYzlUdWhzQTBq?=
 =?utf-8?B?ZVA3Nnc1VmIxVnluVktPK2Q5Ym81TU5WNUZuL1craXJDNUR0TDI2dVk2ejB5?=
 =?utf-8?B?czNvbmltaUtNTWJwKzlObXp0Z2ZJeWp4elQ3Y2JrWDFzUkZvL0xXUWh4N20z?=
 =?utf-8?B?Vlo4Z1pWaXc5S0p0ZXBFNEVJRTRyOE1pYkdMYVM3UzI5SVp5dFo4MVhUVk9W?=
 =?utf-8?B?ZXJJNmJoQUw3cDBJTy9WNUl5Y0VlTmpSVXlmVVhpcGEwS3VKZGtvUk9CQ2V5?=
 =?utf-8?B?a0xCSVlpL0NXS0hFRDhmbHVRZXBlNTVmZG9Gc3V0WGo4R2VyVTVHanpzOTVU?=
 =?utf-8?B?M05Kenlvc3Rydnl0WjJvV0JMV3RMemU5dTVOejlTKy9FMUxIbHB1SVhzQmV4?=
 =?utf-8?Q?alHdRVInnC8v6jiE=3D?=
X-Exchange-RoutingPolicyChecked: fJ/2fZtffPNyMZ1EDddsB9u2dKIjs4YA2pvTQUzW7HHZ+0VBebKJPZ6TrmdiUzSG8AD5nfkEaj6RKG8RzgfFjmaKoSOR3WlO6s55llF56FyoOpSLiFyyVJFPskFKJWynkYAj8koU6dYp4UZbHbp31spNsY2/wMLNPC/Q8ycLt7vDIyqoqQE51+R8Dn26xDYBXtqYHQAD1vNxKFADF5rGgeEY9bMNrpeNtIBPeRjGH//lfxmPQ7LalTrutd8ALV2Cp5S4J9Aq8Gx6ztcp9XNEbO/AHAnN2iBjjwqtz3BEcCnhzVBtlA/L+zIUH+AFb5iopaYAsy/VeKf9ubsAsuNQRQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: a199ad96-c7f5-413a-8dd2-08de7a9fe441
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 10:13:48.3518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fp83RZ7g/+Z1jF+Fxm2Er/wffNKkIATdsrxNy6LKE5RqwFa5eWIGf7mIuuc+cE8oPh0UH5OUY4zmxwvzUYA7WA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6524
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_021357_126214_CE3290CF 
X-CRM114-Status: GOOD (  18.04  )
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

T24gMDQvMDMvMjAyNiAyMjowMCwgRnJhbmsgTGkgd3JvdGU6Cj4gT24gV2VkLCBNYXIgMDQsIDIw
MjYgYXQgMDg6MTY6NTdQTSArMDIwMCwgQWRyaWFuIEh1bnRlciB3cm90ZToKPj4gVGhlIEhDSSBE
TUEgZGVxdWV1ZSBwYXRoIChoY2lfZG1hX2RlcXVldWVfeGZlcigpKSBtYXkgYmUgaW52b2tlZCBm
b3IKPj4gbXVsdGlwbGUgdHJhbnNmZXJzIHRoYXQgdGltZW91dCBhcm91bmQgdGhlIHNhbWUgdGlt
ZS4gIEhvd2V2ZXIsIHRoZQo+PiBmdW5jdGlvbiBpcyBub3Qgc2VyaWFsaXplZCBhbmQgY2FuIHJh
Y2Ugd2l0aCBpdHNlbGYuCj4+Cj4+IFdoZW4gYSB0aW1lb3V0IG9jY3VycywgaGNpX2RtYV9kZXF1
ZXVlX3hmZXIoKSBzdG9wcyB0aGUgcmluZywgcHJvY2Vzc2VzCj4+IGluY29tcGxldGUgdHJhbnNm
ZXJzLCBhbmQgdGhlbiByZXN0YXJ0cyB0aGUgcmluZy4gIElmIGFub3RoZXIgdGltZW91dAo+PiB0
cmlnZ2VycyBhIHBhcmFsbGVsIGNhbGwgaW50byB0aGUgc2FtZSBmdW5jdGlvbiwgdGhlIHR3byBp
bnN0YW5jZXMgbWF5Cj4+IGludGVyZmVyZSB3aXRoIGVhY2ggb3RoZXIgLSBzdG9wcGluZyBvciBy
ZXN0YXJ0aW5nIHRoZSByaW5nIGF0IHVuZXhwZWN0ZWQKPj4gdGltZXMuCj4+Cj4+IEFkZCBhIG11
dGV4IHNvIHRoYXQgaGNpX2RtYV9kZXF1ZXVlX3hmZXIoKSBpcyBzZXJpYWxpemVkIHdpdGggcmVz
cGVjdCB0bwo+PiBpdHNlbGYuCj4+Cj4+IEZpeGVzOiA5YWQ5YTUyY2NlMjgyICgiaTNjL21hc3Rl
cjogaW50cm9kdWNlIHRoZSBtaXBpLWkzYy1oY2kgZHJpdmVyIikKPj4gQ2M6IHN0YWJsZUB2Z2Vy
Lmtlcm5lbC5vcmcKPj4gU2lnbmVkLW9mZi1ieTogQWRyaWFuIEh1bnRlciA8YWRyaWFuLmh1bnRl
ckBpbnRlbC5jb20+Cj4+IC0tLQo+Pgo+Pgo+PiBDaGFuZ2VzIGluIFYyOgo+Pgo+PiAJTXV0ZXgg
bm93IGRlZmluZWQgaW4gc3RydWN0IGkzY19oY2kgaW5zdGVhZCBvZiBzdHJ1Y3QgaGNpX3JoX2Rh
dGEKPj4KPj4KPj4gIGRyaXZlcnMvaTNjL21hc3Rlci9taXBpLWkzYy1oY2kvY29yZS5jIHwgMSAr
Cj4+ICBkcml2ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNpL2RtYS5jICB8IDIgKysKPj4gIGRy
aXZlcnMvaTNjL21hc3Rlci9taXBpLWkzYy1oY2kvaGNpLmggIHwgMSArCj4+ICAzIGZpbGVzIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFz
dGVyL21pcGktaTNjLWhjaS9jb3JlLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNp
L2NvcmUuYwo+PiBpbmRleCBmYWY1ZWFlMjQwOWYuLjA2MWU4NGE1YzQxMiAxMDA2NDQKPj4gLS0t
IGEvZHJpdmVycy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9jb3JlLmMKPj4gKysrIGIvZHJpdmVy
cy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9jb3JlLmMKPj4gQEAgLTkyNyw2ICs5MjcsNyBAQCBz
dGF0aWMgaW50IGkzY19oY2lfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPj4g
IAkJcmV0dXJuIC1FTk9NRU07Cj4+Cj4+ICAJc3Bpbl9sb2NrX2luaXQoJmhjaS0+bG9jayk7Cj4+
ICsJbXV0ZXhfaW5pdCgmaGNpLT5jb250cm9sX211dGV4KTsKPj4KPj4gIAkvKgo+PiAgCSAqIE11
bHRpLWJ1cyBpbnN0YW5jZXMgc2hhcmUgdGhlIHNhbWUgTU1JTyBhZGRyZXNzIHJhbmdlLCBidXQg
bm90Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNpL2RtYS5j
IGIvZHJpdmVycy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9kbWEuYwo+PiBpbmRleCA3NGIyNTVh
ZDZkMGYuLmY3ZDQxMWU1ZTExZiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9pM2MvbWFzdGVyL21p
cGktaTNjLWhjaS9kbWEuYwo+PiArKysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNp
L2RtYS5jCj4+IEBAIC01NDcsNiArNTQ3LDggQEAgc3RhdGljIGJvb2wgaGNpX2RtYV9kZXF1ZXVl
X3hmZXIoc3RydWN0IGkzY19oY2kgKmhjaSwKPj4gIAl1bnNpZ25lZCBpbnQgaTsKPj4gIAlib29s
IGRpZF91bnF1ZXVlID0gZmFsc2U7Cj4+Cj4+ICsJZ3VhcmQobXV0ZXgpKCZoY2ktPmNvbnRyb2xf
bXV0ZXgpOwo+PiArCj4gCj4gaWYgZGVxdWV1ZSB1c2UgbXV0ZXgsIGVxdWV1ZSBhbHNvIG5lZWQg
dXNlIHRoZSBzYW1lIG11dGV4IHByb3RlY3QgdG8gbWFrZQo+IHN1cmUgbm8gZXF1ZXVlIGhhcHBl
biBkdXJpbmcgZGVxdWV1ZS4gT3IgeW91IGNhbiBndWFyYXRlZSBlcXVldWUgbmV2ZXIKPiBoYXBw
ZW4gd2hlbiBkZXF1ZXVlLgoKVGhlcmUgYXJlIHNldmVyYWwgb3RoZXIgaXNzdWVzIGluIHRoaXMg
YXJlYSwgYW5kIHRoZXkgd2lsbCBiZQphZGRyZXNzZWQgaW4gbGF0ZXIgcGF0Y2ggc2V0cy4KCkZv
ciB0aGlzIHNwZWNpZmljIGNhc2UsIHRoZSBlbnF1ZXVlIHBhdGggaXMgYWxyZWFkeSBwcm90ZWN0
ZWQKYnkgdGhlIGV4aXN0aW5nIHNwaW5sb2NrLCBhbmQgd2Ugd2FudCB0byBrZWVwIHRoYXQgcGF0
aCBhcyBsaWdodHdlaWdodAphcyBwb3NzaWJsZS4gICBBZGRpbmcgYSBtdXRleCB0aGVyZSB3b3Vs
ZCB1bm5lY2Vzc2FyaWx5IHBlbmFsaXplIHRoZQpjb21tb24gZmFzdCBwYXRoLCBzbyBpdCdzIG5v
dCB0aGUgcmlnaHQgdHJhZGXigJFvZmYuCgpBbHNvLCB0aGUgQUJPUlQgaGFuZGxpbmcgaXMgb25s
eSByZWxldmFudCB3aGVuIGEgdGltZW91dCBvY2N1cnMKd2hpbGUgdGhlIHJpbmcgaXMgc3RpbGwg
cnVubmluZy4gIFRoYXQgc2l0dWF0aW9uIG9ubHkgYXJpc2VzIHdoZW4gdGhlCnRpbWVvdXQgdmFs
dWUgaXMgdG9vIGFnZ3Jlc3NpdmUgb3IgdGhlIGNvbnRyb2xsZXIgZW5kcyB1cCBzdHVjayAtIGJv
dGgKb2Ygd2hpY2ggYXJlIHJhcmUuICBDb21wYXJlZCB0byBvcmRpbmFyeSBlcnJvciBjb25kaXRp
b25zIChlLmcuIGEgTkFDSykKdGhhdCBzdG9wIHRoZSByaW5nIGltbWVkaWF0ZWx5LCB0aGlzIHJh
Y2UgaXMgbG93ZXIgcHJpb3JpdHkuCgpUaGlzIHBhdGNoIHNldCBpcyBhbHJlYWR5IHF1aXRlIGxh
cmdlLCBzbyBpdCBtYWtlcyBzZW5zZSB0byBkZWZlcgpicm9hZGVyIGNvb3JkaW5hdGlvbiBjaGFu
Z2VzIHRvIGEgZm9sbG934oCRdXAgc2VyaWVzLgoKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0
CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
