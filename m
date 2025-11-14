Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A759CEACC1
	for <linux-i3c@archiver.kernel.org>; Fri, 14 Nov 2025 20:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=C0ZlNHrfmbYdKAgIDQu2xOoO7pz1ulFr18ww5etWJeI=; b=nO/uSQXekwoX7GClmdvsvlUkMI
	L6OIZtOJub5AWfAFWnp0KZE1wgfKDt1dj6LNZGdo9bfq+2vU0VH+hV1LZLdAZs6qwSRBf4nRiOmmU
	yWcXIRmHor20G7lwJVtbJ2VZ/k+viDyZ65jgza1ScEOXDN5NFcvWH7gACFAn3vbEnbQoLRZxB/EWM
	r8Wfr55oXGNDufz8T2sS3HbM6N5kO9uJlw2nod3eQ8X8pUPUBVJZ5q2i8w9blrO/xWbJzSkyJILwB
	cJk8H+cgTH9cUgf9bhqnys+Rn9TbouAmbI+J4pkFJdOe7LxFlQYyVHUvWRnbisvBPFzCrzDRHt2SR
	NNqQJ0PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJzxh-0000000D2wN-0vVG;
	Fri, 14 Nov 2025 20:00:01 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJzxe-0000000D2ve-3Ipj
	for linux-i3c@lists.infradead.org;
	Fri, 14 Nov 2025 20:00:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763150398; x=1794686398;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=P2sqpuCXH9u46bYtpfEO6SSVFIKHMYFUnxcJ0PrqwNs=;
  b=JL6DeoiY9E2yN3qS6rsQzmHGyIEJ3TQmiP39HU9ADkYGA/KnXkKSIDLX
   gaRvc/Y1P44uMOnuFElFPYG4s28tJw7XC1H7nUG5qRnM+6SrleqlvcDQ8
   YT0tC/AFMG51RoBZoSEQv4cOuukz8IfuK9D7QfkQwIPz4v/4TnAHXnR5K
   ZcfOBVwNnR0/gedAWmPzvUvpTjn65DOu/r/v//r6ljLvCT/jU30eCCa66
   WvaF1LnqD5rRZSGN8ONDHNFqxrSdvN009gCYjq/ry1ujEqYBxRyaqRr9l
   V/bkUWxDyeoNB6pbhISwhYNEY+3APBMzF+B23WgC3l3SraTWmCtx9L2if
   g==;
X-CSE-ConnectionGUID: 45SmjiuIR+SJC39yJEa6Lw==
X-CSE-MsgGUID: DQdVU+CAQzOfjMmjzglHOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="90730407"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; 
   d="scan'208";a="90730407"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 11:59:58 -0800
X-CSE-ConnectionGUID: rE1rmcKoQ+uWUrslV+YRsQ==
X-CSE-MsgGUID: z/0J7U/UQuGpBBwWKbiMIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; 
   d="scan'208";a="194298479"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 11:59:59 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 11:59:57 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 14 Nov 2025 11:59:57 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.24) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 11:59:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ck8SunNFNSyMJhMvBQzaxNdRhRHCQ3Xnm8SNG/Aq8JpC2eg2J43yEeMtMhl8P9ZNkhw4iE8GQlO6htjCPndGxziSJblClJXuyjzs1hDeydGx5E4+JQ4IQlNQs98QV9urtMgM8NppJluaxpxUp7zch5SKYz12NWczdOYKCIbR3CmQICnKY17+vvb0WW8mk7aa6vVihIFH9/nimU3hYw2e+YbTyTo5rRrihrYoMnK5AeIrW7U6Yqf1bAiwVdiomVn/O9fP9N9QXe0mXSvr3cy1f7gsp2ZnUTGV2dVv6LJRcmgSMKR12o3Xf1YNo7i/uDGT+WLxXVMS74EVxL1g1X9wbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IFGvNw7qOnRC7mPNWwnESLUOrIPXeFNwhXp4vBImZ9M=;
 b=cQ01oJqHmL2uomWb5kcz/wgYONYJ3YkpNEo3HCmkeE/mgXqL2WICQmark9C0/x1z2iQ3jwj06xqeWN/nCsEVwvgHrkD5udcbKqFMIOrXY++aNMbJj6Gek7Xo3d2FYdDIZb7Jg3VS+12ZPJVrYBoFnH138aOrHagkxDnoPt1W9GHl3vaByAmwq+9yAYhXinwyr9NO/KRdB0qyW8EG1DjLTwtNuBWrHOzJ6JJJ7wV1xayzwB+N5TGhb4kWklBqdrS0RUXtLm2fPGXhdiyIJeln6I1LHrCdQsWoH0o20MvyVFzTix0ezrdErCuzdlC/m4hY1cyrbOtV+rFJHhvmS9FwPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by PH0PR11MB5157.namprd11.prod.outlook.com (2603:10b6:510:3d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Fri, 14 Nov
 2025 19:59:55 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::eeac:69b0:1990:4905]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::eeac:69b0:1990:4905%7]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 19:59:55 +0000
Message-ID: <c5d1a701-4365-427d-ac0f-cd662ce01231@intel.com>
Date: Fri, 14 Nov 2025 21:59:51 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 10/13] i3c: mipi-i3c-hci-pci: Add exit callback
To: Frank Li <Frank.li@nxp.com>
CC: <alexandre.belloni@bootlin.com>, <linux-i3c@lists.infradead.org>
References: <20251114181356.66515-1-adrian.hunter@intel.com>
 <20251114181356.66515-11-adrian.hunter@intel.com>
 <aReIjGV3FfOd/Q3W@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <aReIjGV3FfOd/Q3W@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: DB8PR06CA0054.eurprd06.prod.outlook.com
 (2603:10a6:10:120::28) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|PH0PR11MB5157:EE_
X-MS-Office365-Filtering-Correlation-Id: f81438df-7ec6-4cb6-3028-08de23b8618f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?THdvdVErbk9pYVhRNDB5bG9GZ0ZDODBBQnpTeFlxUGJVRkhuVE8ycUVVTjh3?=
 =?utf-8?B?Y3AxcDQ3emdJNjVyeW5sbThaTzNvRjRubThpcDZuVkVrZGovQnpsaTV0dFVC?=
 =?utf-8?B?ZWtNMGJrVFB3Q1Fac3FXYTMxMWdpRjV2UzVvVkRPcW5qUXljeWpCSkg5c2hx?=
 =?utf-8?B?bjhDTEx1VUY5b1Fmbm1oQmh0SlpGM1lxZEVKa1g2OG5EcG5XckNCRGxpUDg2?=
 =?utf-8?B?OHJOT3hUazFCS1lLaDZRSm94ZGFXWVpYM3RDTFNYQW1saUhPOFZjWEx0MXdP?=
 =?utf-8?B?cXMvMTFJTE9lVThxTEZXZlpkam84NkVIWkRsTXlIYlV4dUxPVG9mNW5vTjVz?=
 =?utf-8?B?ZGFSTnFjN2l3TjJYWXlpejBxWWw5UStBZS9MVlFDWndmWUdNMGswRldSWUZW?=
 =?utf-8?B?d2pZZ0xBM3JkMDZHbEVMWWZnM2tSeVF3YUJpUy9Id1VhK20vRFFZd0RUQlhD?=
 =?utf-8?B?Y0R3bldMM0g3bWpGNjZkbG5RZzhaazdVb2JEQjI4dEJiOW1WbW82TE1GTUZm?=
 =?utf-8?B?dTZ2WUZMdVZUY28wQzAvb05EZTBsekpQTzZxZjZuTHpzTWVBL0dHbkpqK3ZV?=
 =?utf-8?B?dTEzUWR0NGFET25TL2gweitlMnhDcGpQYW1maWJVOHhiMjF4OEhySTNTMkZy?=
 =?utf-8?B?QTh5U3grVXhuN1RRUkI1MzJPYTlxc1pJWkJGeE1pWFVJblg2M2liK3ZlZjM3?=
 =?utf-8?B?MUNtTVUwWHdOL1laR2o4djU3NUhtZjA4enpCQkxDblFPYkxNTm5mOXdmOUlB?=
 =?utf-8?B?NGYxejNtNGZRNlQ0NW93RzRoT2lYUExFUzhRNCtFbXhPRHFRZ2RJOHRkVFRm?=
 =?utf-8?B?b0FaWGtSamhyR3RDRWxDKzVGbkVtUXRFK093UHhyNzZTL2NLeHEva3dMMzRO?=
 =?utf-8?B?R3VDZXVRbEdRT0JLeHlxYjJUUEh4dWVuMFUwTU9ueXEwaDV1dGdLeFF4ZC9p?=
 =?utf-8?B?WXJZQlZMclRuL0lFL2R3YWpHMUI4Y2FtUm9pdDMyOWRiQS8xRzhqOFFFam05?=
 =?utf-8?B?czBWLzRBVkhoZVJIbTBOQnF3cHk3aEFxOTBxUHRzMDdkNXdNZ1o3V2VUSisv?=
 =?utf-8?B?c21UQlRlUWV6dWQ0SkZkZVVrRmpDZnNPSHAzQnE3RWhVK0FMZlF0ei8waHF3?=
 =?utf-8?B?T2tlUFNBODFKV0hNcGRMWVVHS1ZjbWVxeXhMMEZlcWJaVEZBeGdGZ1NHRHFY?=
 =?utf-8?B?dExaV2JaNHQrSlJCb3JnVkNzV1c3b1UrYXhqL0dMbXFjSlJQSUhVcS9vbld4?=
 =?utf-8?B?U3dETmZwYjVRNkpuMlg0K3hLcmNwQkVXU1k1bmRtc1Z1Z1NmTlNKVFN3YzJm?=
 =?utf-8?B?VnhzZFV6bXpaVFdyOFFVY0VacVE5QmJPcW9LTE83WktQTm9qd1RtemJQbEFt?=
 =?utf-8?B?bitNSktpbTRWU0l1U09VUFVmRzgxRS9NYjhZU1IyVTJ4bnJtS21qVDgvRWFy?=
 =?utf-8?B?U29kcFcyemI0OWZZbThDR0ppOWtGcjIrL2djWkJoRzNLMFI4RWE3QmlpVGR3?=
 =?utf-8?B?cEYxM3pBemg2dDdNRHcwUVE1UFQ1eW9ieEZ4SHVzOVZWd3JyNW1YRzMrQW1X?=
 =?utf-8?B?TFFoc01OSER5M2ZBc0ZyTi9KQmNHd1dQeHA2K3pmbHVodStyQU1LKzd0NXl3?=
 =?utf-8?B?Vm1Ca1NSR0h1QVhFOWtQdTB1ZXozNmNhc2NDMWRzY2ZFVE50T0t6VXRiR3Bm?=
 =?utf-8?B?cGpESXJ2UWJqQVMwbWhzRlQ2SEFHdHdxaHJkNVdXODF5czFBRFR1WWxvL1B4?=
 =?utf-8?B?dldBdkI3elFBTVhtNm4rY3RKK2Q1Z3k5R3M3VHR1NzYyc2RGY01FdldQcjF5?=
 =?utf-8?B?aUQxOHd1SkpFOG9saWZpK2xRTndieWtSaVl0TStNMXg1SWh5elNWc0t1SSt4?=
 =?utf-8?B?dlVqcTg1b2l5bktZY2s4cU9jLzNsaWpsTEVTeDhVSXlEL3I2Z1lMclN6TUxX?=
 =?utf-8?B?QmFWcGRGMXZ6N2lDa1BVbTBnRnlROUJTZitBRGpiaFZ5RHpkSVVjbENIRDFQ?=
 =?utf-8?B?bHo2THVkNUNnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGlBZkxId2dNWTZVUHpNb3Jibmg2UHhDbE5MaThoUFFQNEJsQVo1NC9ROG5E?=
 =?utf-8?B?OGlGQzVyY3dKMWpPOHIyRzlyaU1TYmQ4Z2o3bWRxRjlteHJlQmltRDhVUzBH?=
 =?utf-8?B?S21NSEQycEFESmFBczQwMDVieVk0dm1NLzJXMkUwSEczN2dSdjArQ0NCdXkv?=
 =?utf-8?B?N0RTSlpyUXZrRUtKYVVramQzZnVkcC9iaENmNTNrS1VXWW4vUXh4T1hzMTNZ?=
 =?utf-8?B?b2ROZ010SzJ5L1FUa0lQeWhPV3hwbXZ6ODNBRlF1TUtRblBWc3hMc3lrcW82?=
 =?utf-8?B?M0tnUkx4MmVvalJ2S0xPdXB5ZWJjZEJIWEFHV3luOGJZZDNJb3BCbE1ma3FQ?=
 =?utf-8?B?ZmJWc2FueDRhVXB4cmQvTmwwNnI3TlpVemgwYVgrMCsweHZYU3BrckdDM0ps?=
 =?utf-8?B?OGFTOGdIaUkxNUxjdlh5NTd4WVFreGpFMXZVUUlzWUxiQ0N6UU16WWRSQlRi?=
 =?utf-8?B?b2pQQ3Y1bm1UNmhqRThES1RmY3kwaU5HUENhcE54VXVobFdzeis0S3VvWE5z?=
 =?utf-8?B?MHRDU1ZkL3lORmgvREVLRVpYRGtTckszR0UxZHNQVEIyaDJKeHprZG80OFFh?=
 =?utf-8?B?dFZCT2UyRTJQZStLeUJDOGdaRE9EWjNrYzJpM29ndWJYQ1pZL1huckxBb0ta?=
 =?utf-8?B?cXF6NlFMNFZYSDcwaU1wazh3dEIrV1I4QjZ3eU1FUGx5SCtFaDZ4VVdaWGJY?=
 =?utf-8?B?QmdBWWlHYlNCVTY4SHFhM0ZiL05VUzFKTVdaZFBhSWpGRjU2dVNHMCtyZWhT?=
 =?utf-8?B?aHNUUnNIdkY4bTJndVk3Q1BWR2ZkYXNNUjZvakZZYnVaeVRUeVFuNW42Znhv?=
 =?utf-8?B?cDcrRnFuSmEwN05CbFBvYlNnZ1NqbTEvZU4wZ2hndkhwNVpZeVN3MXhWZ2k0?=
 =?utf-8?B?RWh5TEVSOXRlclE4TElPU2FnSGh6UHZqYnhYbnZFa0svNDhTM2VsRit1RnhY?=
 =?utf-8?B?NElGS1RjNnRvN1U5dzRQRUl5VkFrZUd1WEV5N0tycHVrc2xnemYzejBieWFJ?=
 =?utf-8?B?b2NabmJaQ25XVDRpNUpnSVAvV000aHFZSHprdGJzVmFLL3d0RkVpa0tlUHM2?=
 =?utf-8?B?eE04SXhRYUdBSGhpRFRPcVJSQnM1UjR5S1hOWlFsdWJuVkJ2dWYwYm5IQnUy?=
 =?utf-8?B?VXFva2dTcFhDZ21EU1luSzBHOXRLVkE2Sys2M0ZtK0dsL0dnc1Z4eWxVb0Zw?=
 =?utf-8?B?YVR5KzB2UVU0cXp3VndpZldYVHVCWFpZRXBNWUxXdGxVa3R6YnZIQXJoLzZU?=
 =?utf-8?B?b3AvbzdTeENjL1h4VWJ5TFoyREkwV0RKZ0xpNTFpWDBQM28zUnB1OUZJS1FN?=
 =?utf-8?B?MUx5RjBUWis1U2NYbG9sZkdad003NmJOR3cvL3BvRDc0U2libFRvQnloQWpw?=
 =?utf-8?B?TXBnZ0w1eko0UjYvdzVoTlNMYncwdEsyckhlUVRuS0paNG52eUZpajRtcVVw?=
 =?utf-8?B?SWpRUGZzd3BaR1lZSWZSRGF6YVRkWFMwNmIyRENtSE9yekl3NU9MSjJGUEFL?=
 =?utf-8?B?SS81TFdUSWhhRmMrSjU0eEE3RVN3dCtzYkdHa00rSmFSaXBHZDNTcVNWTWZz?=
 =?utf-8?B?MFcvTlVvVWRla1JwVFpjSDNRRFpSZEN3dmVraDl2T0VCTVFpTUZaWTBYT1g5?=
 =?utf-8?B?blFlMXc5V0kzYnAzc0o0eUhtWG11VVc1OHFuS1dEN2tzRmErNTNZYkM1YTUv?=
 =?utf-8?B?aFlvcGxvSG9nWEM1MGNRc2pGOUpMejZWQ2xhMml2ZitHb2VUdnMySTNMTUR6?=
 =?utf-8?B?Mmx0WVNYVjhoL3FIQ1hTdmFSRTZYS3NxV3J3b2VHZkZ2NXNoeHc0b3RUQ25w?=
 =?utf-8?B?cHgyUTQwcWUvLzlFV1BwZXBYSi85QktqaE5HSC9XNHZWdmNiUEFUMExnTjlF?=
 =?utf-8?B?TTRkY2tKQzByckVtRTh1S2xNY3ZSTFRZa08yYjBkMytOSGpneW1TVmRlUnBW?=
 =?utf-8?B?SnNrZEVJcUtvNllleUc0eHJHMUJHUnJvRUNBTjdwdks4REErQjB3ZXAySlQx?=
 =?utf-8?B?TTM0N0xFdkN0OU15RG80QXBzbGszcXd2VDgvUmVHMjlnd0lYNGI5Q3NrTTA1?=
 =?utf-8?B?S28vMy9hMXBpQUl4Tmd1S0ZZMWl1SE1CV1BlZXlkWHZ2RmRxU3ZnSThLQlhv?=
 =?utf-8?B?Nnp1b0UxRWxWbVd6VU8zSmIvS0pwYXFiYTk0MmdONTQvbzg5ZEcwUGpUYlFL?=
 =?utf-8?B?MkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f81438df-7ec6-4cb6-3028-08de23b8618f
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 19:59:55.3187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aVtFhn8FWwz+LmIl0xt/6cE3tlkib+tf5xxLtajVGksAydx5rtm7II2Z62DZxqKnZnqVZR9I9nPpaOqW0daqNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5157
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_115958_897221_0EA93AE6 
X-CRM114-Status: GOOD (  16.91  )
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

On 14/11/2025 21:52, Frank Li wrote:
> On Fri, Nov 14, 2025 at 08:13:53PM +0200, Adrian Hunter wrote:
>> Add ->exit() callback as a counterpart to ->init().  This is in
>> preparation for adding device-specific features that require cleanup
>> upon driver removal.
> 
> Prepare to add device-specific features ...
> 
>>
>> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
>> ---
>>
>>
>> Changes in V2:
>>
>> 	Re-based
>>
>>
>>  drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 12 ++++++++----
>>  1 file changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
>> index 7bfb9fe337b6..b962d3c2d510 100644
>> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
>> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
>> @@ -17,10 +17,12 @@
>>  struct mipi_i3c_hci_pci {
>>  	struct pci_dev *pci;
>>  	struct platform_device *pdev;
>> +	const struct mipi_i3c_hci_pci_info *info;
>>  };
>>
>>  struct mipi_i3c_hci_pci_info {
>>  	int (*init)(struct mipi_i3c_hci_pci *hci);
>> +	void (*exit)(struct mipi_i3c_hci_pci *hci);
>>  };
>>
>>  static DEFINE_IDA(mipi_i3c_hci_pci_ida);
>> @@ -72,7 +74,6 @@ static const struct mipi_i3c_hci_pci_info intel_info = {
>>  static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>>  				  const struct pci_device_id *id)
>>  {
>> -	const struct mipi_i3c_hci_pci_info *info;
>>  	struct mipi_i3c_hci_pci *hci;
>>  	struct resource res[2];
>>  	int dev_id, ret;
>> @@ -114,9 +115,9 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>>  	if (ret)
>>  		goto err;
>>
>> -	info = (const struct mipi_i3c_hci_pci_info *)id->driver_data;
>> -	if (info && info->init) {
>> -		ret = info->init(hci);
>> +	hci->info = (const struct mipi_i3c_hci_pci_info *)id->driver_data;
>> +	if (hci->info && hci->info->init) {
>> +		ret = hci->info->init(hci);
> 
> This part's change does not belong to this patch.

hci->info is used in mipi_i3c_hci_pci_remove().  It has to be assigned.

> 
> Frank
> 
>>  		if (ret)
>>  			goto err;
>>  	}
>> @@ -141,6 +142,9 @@ static void mipi_i3c_hci_pci_remove(struct pci_dev *pci)
>>  	struct platform_device *pdev = hci->pdev;
>>  	int dev_id = pdev->id;
>>
>> +	if (hci->info && hci->info->exit)
>> +		hci->info->exit(hci);
>> +
>>  	platform_device_unregister(pdev);
>>  	ida_free(&mipi_i3c_hci_pci_ida, dev_id);
>>  }
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
