Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A56F5D5B863
	for <linux-i3c@archiver.kernel.org>; Mon, 15 Dec 2025 18:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=qLfPtlIOyZ1mgcUIy+T7mzRhzQEeJxsv4nT25Cog0RQ=; b=OJ/cjduLVsZb/ULSy4yzSJLxSv
	D0Vkp9Ap5Nk9PZ8IjRGqgZ+7JkTurDjDKxztjL4JkZ4NCAQwS0tuhlOOCxYUNNtIzDbDQA0d0vwDx
	sTlRhOwYhizXtrsQqV3Nr+gVPSG4Kn465tiuuyg+NsehaNw4xxkFxZ5Ff8743VPrvYezhKFU/8kk6
	edsnl8v4jfuSWF9ZyGBsfNEmpziA9Ze6uRYEQFP/EeGfMHzrpfqwAMR27BF4juEHUUfB10lFrtchY
	+BkC6YOtoTa9MFDvf0jlEJSMp8Z8Gll98mLMrZe3pd/esaNyfCCRhDMlQUhevq1+Lwb+3YYxXjgwb
	jnfD5l1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVDAI-000000047vq-1mzQ;
	Mon, 15 Dec 2025 18:19:22 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVDAF-000000047v4-129O
	for linux-i3c@lists.infradead.org;
	Mon, 15 Dec 2025 18:19:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765822759; x=1797358759;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=aEQx2RD1Ttd0SxQBuXztx78tyYNrQckxoMtaPCdjajo=;
  b=bucU/cijxrww3kaG9RLZ8mV/U02vWGKlthlflJFaQ7PGcTRQ/3zwJ1ho
   p3dzPnfbI448/J+XtYj5gqKbdi1Za4JrXK2fsVE0a7G0s6MEpwDbowsq8
   CPNsR9a9iiLqGKNbXrRePw8DyUXKFeTRNFDOHm2eY+TX6hh0guLYBElYl
   dIysfVY10hqfQ7dcO2EN00/2pIPIOT2q5agbwic2VnxXuRRXTaNzbPw2I
   kSxk/aeX3HW0w9aF0UKBuI9w9ZN2CHIDaVvxe6JJxt3MQrbofxZVzzWDL
   uvx0XNsNX+pY6y1zNMCMikPbWkbN4VU9WQRxYt9eD+wS2eopODe4fmvwE
   Q==;
X-CSE-ConnectionGUID: aEiIX6rHQdWoct8jsbf91g==
X-CSE-MsgGUID: W2KIoI/LQqG0grUCtDF7rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67609945"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="67609945"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 10:19:17 -0800
X-CSE-ConnectionGUID: 1feEtLMbTEuo2Vg0AYlLgw==
X-CSE-MsgGUID: fCVr1jWETVK76LP5jzOuxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="197787114"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 10:19:18 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 10:19:16 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 15 Dec 2025 10:19:16 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.44) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 10:19:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OIH97QbxaEi8DqHzASTK5b6k/Iu9h8pwVXaPi+iu/Pr/rFNW1e49KFoTuc2hRy/PIZXdHsFeO+HYTDJkHHUQDu+BD46Rk4Gl5M4m6xuukwraDqFiyIq9e2zZ/uCONxp1I4HR7mznRCdMqE230pXqd1actMbZeeKhb4EyAUQE0S0oU1I5/5SuNRsJB6Sl6pIC/dt4ZcVWAd/SFYvCE/vbT22Li3h0aRWFs7ryrdC/KWPFzwO2F91/k4igUwSRMCjmjbZ7wbPwOAbNzg4hJ5EywrRNEXJ+YxuoLlO9vK2/pKpl7xe7Mg078NlhZTuaebonkuufoXELac7XNCLWWBokXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AO5LZIbLEo37XvDy12WYVP8c6fNi0BJWSKYp9JyvwTU=;
 b=Hk6pGX5H8IQZL7dMnyP/HMxhuGJKPu1XFdhfIxX046ClgGAaEkO/YO1GA3sI6ZqAOo2syspjrAlxQKLhhzZZsK/GQso9+niuZbWBEGCMO5bJNGEWwOKvw6q0q5VAfbWpo2oqcHv7TFUQK6ISggzxKbsSr5sAYRG5epRDXEtZZ+jiWtYylF9AeM5u9P0TRfhbW8eO7ALXCOk+qu0q9/oYLzLcgzYP4RNLSASnbkOZ/Os6syGzqZvH9gRQ6RqxwyZ5Da2SysCWn9YI7E5/EnNUmUAMVOzl2P5D03r5B4JUyNOrqwLCNt9IXlhjzuWxcwN0JdS8DO9N/s/nkSktFjOouA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by DS0PR11MB7736.namprd11.prod.outlook.com (2603:10b6:8:f1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 18:19:14 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 18:19:14 +0000
Message-ID: <339defb6-0fb2-418a-9f63-82e46c707f6d@intel.com>
Date: Mon, 15 Dec 2025 20:19:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 06/10] i3c: mipi-i3c-hci-pci: Enable MSI support
To: Frank Li <Frank.li@nxp.com>
CC: <alexandre.belloni@bootlin.com>, <linux-i3c@lists.infradead.org>
References: <20251211134809.75872-1-adrian.hunter@intel.com>
 <20251211134809.75872-7-adrian.hunter@intel.com>
 <aTrl9BMsbwMBCN+L@lizhi-Precision-Tower-5810>
 <3d540915-508d-4548-b63a-cbdd9812d454@intel.com>
 <aTxTBmeSBPv25b2I@lizhi-Precision-Tower-5810>
 <96366268-572e-4a11-bc94-058d37db2418@intel.com>
 <aUBJG6GjX+z5y4AI@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <aUBJG6GjX+z5y4AI@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: DU2PR04CA0197.eurprd04.prod.outlook.com
 (2603:10a6:10:28d::22) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|DS0PR11MB7736:EE_
X-MS-Office365-Filtering-Correlation-Id: efd61a63-b289-4689-2cd3-08de3c0673b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YW9tSXVaK0tJRUMyeWh0SVVOeVVDRWtCejlxZ1FHbGNGby9CWVNZYWlTOG5K?=
 =?utf-8?B?cjNQemM3c0pmRXpiL1lRRXN5NS9OOUVVdVdXelloV3F6QUxQeDBHN2Fnc2lX?=
 =?utf-8?B?TzBrQUZZNmgyZk00dmE2RWtiVEZYU1hLVTh3Tnp2MlFaL3p3VkVhbGlUOGhB?=
 =?utf-8?B?TmJIQUJNcmhWZjhRL05wVVpWWjBxcFJBSGUxQWpjOWZxQWZiZEJ4bGJ3dzhK?=
 =?utf-8?B?cmxndkRRaHA2RVB0TXlCOXVFTTcydEYycndhaHROSkppdkdzVWFXMnlQWWgv?=
 =?utf-8?B?cTBQR0diTmxGeXV2aWhMT2JGc3V5bVJORFJRVko0V3BMOFpPN2Y0ZHlOQktJ?=
 =?utf-8?B?U0hSRVRKOEhKME5sdWhoZGlka1VQUHhLUXcxd2xlV09XSjRwZi9rbnlPczNL?=
 =?utf-8?B?VnFzSmxVdCtTUE9LT3FQZVNmL1NZL0kxdEh0TW9HU0twaDhKQkdsNC9RUjVC?=
 =?utf-8?B?QWphSFRkSVg5U2pLdWdQRTM4MGJUbWZja1NlK0tLVG9aQ25KcFlCdHJLRjc0?=
 =?utf-8?B?T1pMRHNhVFQwSkREWWl2djdJL3FIbmpnUUZWQVpCbS9WUG1qNEdvRDdnd1Jl?=
 =?utf-8?B?Y2NYN042b0NmL0J2RytIQzljQVR5YTBsQnpoME9mWVpHS2NMSjY5R1p4cVNJ?=
 =?utf-8?B?UXEzbkJ4dldabUVpd3FCOFNROEFnck5jdUIwRG9td2gvclMwK2pKTmJMU0No?=
 =?utf-8?B?Zys2SGhxOVpWdEVCV01hWmRhaUY5ZFE3UjFlRE9XQlVla09PRzNxL0IxMldm?=
 =?utf-8?B?bGdsME02TU43ZjhoZVNCcDYrL1hUcWZKNHZUY1FBVlpGeHM3WGNiL0ZuS3RF?=
 =?utf-8?B?RG5VUTNRZThnNWowWVRkazFxc1pmbkNNMDhFVHo5Y1l3Tnd4b2psNkVSVWJw?=
 =?utf-8?B?M3BBanJTbm5qVHd6Q21PblpZWWJwQzBRVitiTHRvdEl2Z1M3b2hkUzhTTUI4?=
 =?utf-8?B?S2JnZ1M3dnJzZG9FeCtDZ1VkSVN1WWI2N21MUkRCNnBQL3B5dXFzeUpXcmJ2?=
 =?utf-8?B?YWVyb2p4YTUrYlVUaS93Ym1HenBrTmJZcW1lb1BuUkgycnNhV3ZQYjZadkZO?=
 =?utf-8?B?YjdPdGd0QmNWeURzclYzY0ZTOWl0VUdTT3FjbzdBSnY1akltdTdrajRyU1Zt?=
 =?utf-8?B?YVN0WnN2QnkyR04vSFlWL21TS3BVSS83WGlPc0dqK0RGZGRYM0p1MHNBWXhV?=
 =?utf-8?B?WjhvT0s0a1kxcWY1RkxhUXVKUUNKWVdyb0JPMXhOWnZmRWNodzN2NUtjdytU?=
 =?utf-8?B?eTBqbTVTMCs0eDRlakloK3ZEMmxDQyt2STJPQzJDbC9ibkRkUE5xQmcvY3lk?=
 =?utf-8?B?Q3QzUG1uNmxPYzJDNzd3a1h2cmhqaGxiZDNQUWptamMvcFBqTVY4QlhlQ3ZH?=
 =?utf-8?B?czkwYnAzK2hZWG1jMVhSTjI4UlRXd2VLS2ttSnBSblNlbFM3SU94WkdzRHRI?=
 =?utf-8?B?a0d2OUtOcDdxOWp2ZUg4QTFuY3c0MFZrQXd0UlVDenhMTnE4VFRkK015YnNW?=
 =?utf-8?B?UzhvM01EVFc5NTZSdXlubnFRbEVTTThCOXdsbzU5Z1krY25yM2xMQVhtYlB6?=
 =?utf-8?B?eEdHN1lmMk1RRHp1RUpVYmZyMzNQNEZyczRINU00ZWVmdk9wemJaTksyOGhI?=
 =?utf-8?B?ZXlZTGlILzFZSzdqZFNzYko1RWlsakEybEpKYjhPQ09VeGFkQkR0NHRMaVpX?=
 =?utf-8?B?TlZnNXpuNHhYcDc0MVhiTVFYeFA1a0tBM2dsM3g1OWxqQ3FZMzJDUDV6akRt?=
 =?utf-8?B?L1lFTVZDeFFkZWt0elp3cm9Hak5LQVBLZjhscGxvUjduajlZc3hDL09Rdzlm?=
 =?utf-8?B?ckh3M05jQm92YVZZdnpyMnA1Zzg1SU9LTCtvTlhibmVQcWJmNHhLWkwzMmt4?=
 =?utf-8?B?UXdRN3FFdHUyZjJDZ3BkYTdIMFcvTUtJMjNOZWlESGwyV0E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnV4TmFURkVRdnBZTXRmazlFK0hWOFhWVEU2RlBTWFBlellpOHRLRlBqcnJa?=
 =?utf-8?B?THJMRVNMSHR2S2VIN25jbWYzUTFxODZ4NlRXaUFLQmpHU3VWY1EwT0N0QjNG?=
 =?utf-8?B?Z21xaFVjZUh6L0gxZ3RrT054czJKc1k4SU4rd3YrZjRJdmRxRXcycy82dTNj?=
 =?utf-8?B?M2YyZUlPd01GaVdXL0NHc0xraDZaOFFoSnlaeWJ3cUhGZHdRM25BbDdrR1lt?=
 =?utf-8?B?cjZ4d0xINCtxa0xZV2hYTlh2K09HSG9WS015cmJvY3czRGxZTExNOTl5czZK?=
 =?utf-8?B?REpnaG54OUgxWEo0UDBENzZ3WkpSQjgrbnJ3YzQzM3IwQ2luNStDSW9aaXU5?=
 =?utf-8?B?eDFXQk1CYkdJTmthemtnSjV0clBBQzdGbGowVGI5ZUJJRmZWL2s3OVZqNUlK?=
 =?utf-8?B?Z1FROTFjbTllemtYWjRYS0NaYndmbEcwWlVFSjBOWWI3Y2xaZG4vemJpQURK?=
 =?utf-8?B?N3E0Ym9QcjFvV3ZEMUkycGFsQjd3NEYrcEhOTWJvY3N0ZjVVa29PMTlKV2p0?=
 =?utf-8?B?UjZoZlRNdDROZXNPRWUxQkExNjFPR0VqTHB4dlVyYk4zYlV3YmFmQzN5ZTZG?=
 =?utf-8?B?UVNCNVVmYXdud0xTdEVKbmpnTzlNU1VLeElvZ2Vza2ZsT25CQXUxbWZtaUVy?=
 =?utf-8?B?RFNTRlNUK1BHd1BPdHM5WE1WZzd0amR4dmpycDh1N3pHWkh3T3ZvNml3VHJ3?=
 =?utf-8?B?ZkZEY21XbEd3RFNaQ2JLdm56Vi8rSWQ4UTdDWmNyay9DT1RQb0pKSDltajhs?=
 =?utf-8?B?eXVGckZ3Z2FIWitlYVROdzBkdUt6MUw2UlVaWkFCVkZPQStOOXhYNjlCMWF1?=
 =?utf-8?B?MFNMTVBaUkZkSVpXNldEVkxIU2JwRVdkWWhrN3BPQ2RlbXIxbWJadUMzbEdl?=
 =?utf-8?B?a1RpQll3OWliRjdDZVlJenNEM1JOUzdEYlAzZThsb3VCZG1obG5mQ0lxRWJ5?=
 =?utf-8?B?SWdSZFZTZnRxR0p0bHJvUHA1VUlsSXZKTk5yTnV4NjkrVGdOemtNT2t5SWFB?=
 =?utf-8?B?S0o2dTRYZHhrcDJhTFl6QVcrc0dEa0FjWWcrU2dUbUltOHZlbmhnejcxdno5?=
 =?utf-8?B?dmxlS1BLMUcyNXVzYXQ2U2Y4bnZNb0pWU2FERzROM1ZJa011VTY2eXFxbDlF?=
 =?utf-8?B?RjZRWWtySFNKOUFhc2M5ZFpaNjZJaUE0ckZnYm01ams0WHZEL0l1SHc2VnM5?=
 =?utf-8?B?d21BVHI0MGxwZkpIVUxSaFd2RkdwMktZaTZJWHhKYlBjMHFBZDg0OWVKblNz?=
 =?utf-8?B?UUlHcG5FaExKNUxFRWZpNitIdHNIc2gyMGU5bncvQ3phbHdOcTZtTTlFVmg3?=
 =?utf-8?B?aUlUQnp5VkFEU0VPZ0p2dWo3blNadUxaSjhXMjEwc09kME9BZUhUb284czdC?=
 =?utf-8?B?WGhZdUY5cUNPb2lERVZWRStGT1N6RW1zekJVNHNzQ1Z3NHhrZlNnaUNEeHdI?=
 =?utf-8?B?UjdMNWhxNTBQeWtxVWxuKzVpZ1o3WVk3NEZWbVhZTkY2SkY0K2FCTFQ5OXlL?=
 =?utf-8?B?L21XdnJNK2tLOGFzUWJZSXZ0OGFmZGFpMStSTXF6dE5ZMXVpQ29HU1R5elhY?=
 =?utf-8?B?S3hzb1M0N3lvUVlDckN1RDhrQ0JkMnAxTEZmdG5XVEpJQlpBR0cybWloWUdY?=
 =?utf-8?B?T0VZS3lhdTV2eWFxS1ljWmpQUERxTHZIOTRDUkVKVTRoRWx3UFhnUzNlZ2FQ?=
 =?utf-8?B?cGJJQ2ZRNUZoMU9xcDI2K1F3Ulp0SkpRNThzOVB6VjlsZjJTR3pxU29qWitN?=
 =?utf-8?B?cjM2bmxXZEgvUHpWK2Y0cUt1NWszL2dCZjdMakJkRkdYVDBVcTlFRENpSHE1?=
 =?utf-8?B?elBhUWRXQnM4TDJEMStzdXRMRUhlUiszMm1qR1pVcHl4RXhmOFNGdkNFbDBZ?=
 =?utf-8?B?QWEzb3hWMEZqdkJhMHFoMWkvNkJzb3M4OS8yZlhCVzlwUWphS2J0ckdGTVV6?=
 =?utf-8?B?ajl5WjdFUEU4ZGYyN0xQR2FCaXpmTlBkQ1pLY2crZUhjU0hMb2Z4UmNVaWpa?=
 =?utf-8?B?NmFSSEs0SHQ1NGttR1cyR3dKdnBadlhIWTJ1V2syQmVramIybzIra2tZNTdt?=
 =?utf-8?B?Z1hRZ0prcDJheDlGM1JraHJuYTBlNVd6Z0tSNU9kU2w3Vm90OUNEV1pMWE1j?=
 =?utf-8?B?ZDVEa2lDbkdTQzV4T0pZbFNMOEhxeDFMU29YZXhNRUQzbEtmakdwVnRRdWRI?=
 =?utf-8?B?QWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: efd61a63-b289-4689-2cd3-08de3c0673b7
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 18:19:14.4871
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kiddE8ipj+0zSLsZHObw3rBqBrffdC5YXAsflp46cIirehEBq1F+p71Kkta3IgIcjjoqPGZCxzbyxiv8x7S6eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7736
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_101919_409723_6828E456 
X-CRM114-Status: GOOD (  16.19  )
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

T24gMTUvMTIvMjAyNSAxOTo0NCwgRnJhbmsgTGkgd3JvdGU6Cj4gT24gTW9uLCBEZWMgMTUsIDIw
MjUgYXQgMDc6MjY6NTVQTSArMDIwMCwgQWRyaWFuIEh1bnRlciB3cm90ZToKPj4gT24gMTIvMTIv
MjAyNSAxOTozOCwgRnJhbmsgTGkgd3JvdGU6Cj4+PiBPbiBUaHUsIERlYyAxMSwgMjAyNSBhdCAw
NjoxOTo1NlBNICswMjAwLCBBZHJpYW4gSHVudGVyIHdyb3RlOgo+Pj4+IE9uIDExLzEyLzIwMjUg
MTc6NDAsIEZyYW5rIExpIHdyb3RlOgo+Pj4+PiBPbiBUaHUsIERlYyAxMSwgMjAyNSBhdCAwMzo0
ODowNVBNICswMjAwLCBBZHJpYW4gSHVudGVyIHdyb3RlOgo+Pj4+Pj4gVXNlIHBjaV9hbGxvY19p
cnFfdmVjdG9ycygpIHRvIHN1cHBvcnQgYWxsIElSUSB0eXBlcy4gIERvIG5vdCBjYWxsCj4+Pj4+
PiBwY2lfZnJlZV9pcnFfdmVjdG9ycygpIGJlY2F1c2UgaXQgaXMgdW5uZWNlc3Nhcnkgd2hlbiB0
aGUgZGV2aWNlIGlzCj4+Pj4+PiBtYW5hZ2VkIGR1ZSB0byB0aGUgdXNlIG9mIHBjaW1fZW5hYmxl
X2RldmljZSgpLgo+Pj4+Pgo+Pj4+PiBwY2ltX2VuYWJsZV9kZXZpY2UoKSBhZGQgYWN0aW9uIHBj
aW1fZGlzYWJsZV9kZXZpY2UoKSwgSSBoYXZlIG5vdCBzZWUKPj4+Pj4gcGNpX2ZyZWVfaXJxX3Zl
Y3RvcnMoKSBpbiBwY2ltX2Rpc2FibGVfZGV2aWNlKCkuCj4+Pj4+Cj4+Pj4+IENhbiB5b3UgdGVs
bCBtZSB3aGVyZSBjYWxsIHBjaV9mcmVlX2lycV92ZWN0b3JzPwo+Pj4+Cj4+Pj4gcGNpX2FsbG9j
X2lycV92ZWN0b3JzKCkKPj4+PiAJcGNpX2FsbG9jX2lycV92ZWN0b3JzX2FmZmluaXR5KCkKPj4+
PiAJCV9fcGNpX2VuYWJsZV9tc2l4X3JhbmdlKCkKPj4+PiAJCQlwY2lfc2V0dXBfbXNpX2NvbnRl
eHQoKQo+Pj4+IAkJCQlwY2ltX3NldHVwX21zaV9yZWxlYXNlKCkKPj4+PiAJCQkJCWRldm1fYWRk
X2FjdGlvbihwY2ltX21zaV9yZWxlYXNlKQo+Pj4+IAkJCQkJCQk6Cj4+Pj4gCQkJCQkJCXBjaV9m
cmVlX2lycV92ZWN0b3JzKCkKPj4+PiAJCV9fcGNpX2VuYWJsZV9tc2lfcmFuZ2UoKQo+Pj4+IAkJ
CXBjaV9zZXR1cF9tc2lfY29udGV4dCgpCj4+Pgo+Pj4gT2theSwgaXQgc2hvdWxkIGJlIHRoYXQg
cGNpX2FsbG9jX2lycV92ZWN0b3JzKCkgcHJvdmlkZSBhdXRvIGZyZWUuIG5vdAo+Pj4gYmVjYXVz
ZSBwY2ltX2VuYWJsZV9kZXZpY2UoKT8KPj4KPj4gTm8sIGl0IGlzIGNvbmRpdGlvbmFsIG9uIHBj
aV9pc19tYW5hZ2VkKGRldikgd2hpY2ggaXMgdHJ1ZSBpZgo+PiBwY2ltX2VuYWJsZV9kZXZpY2Uo
KSBoYXMgYmVlbiB1c2VkLgo+IAo+IEkgaGF2ZSBub3QgZm91bmQgYW55IGRvY3VtZW50IHNhaWQg
dGhhdCwKPiAKPiAgKiBNYW5hZ2VkIHBjaV9lbmFibGVfZGV2aWNlKCkuIERldmljZSB3aWxsIGF1
dG9tYXRpY2FsbHkgYmUgZGlzYWJsZWQgb24KPiAgKiBkcml2ZXIgZGV0YWNoLgo+IAo+IHdoaWNo
IGhhdmUgbm90IG1lbnRpb25lZCB0aGF0IGl0IGFsc28gY29udHJvbGxlciBmcmVlIGlycXMuCgpJ
dCBpcyBub3QgYSBzZWNyZXQ6Cgpjb21taXQgNTk4MmE1MzljZGNlZGNmMWE4NzcwOWMwMTEyNWUx
NTk2ZWVlMmM5YQpBdXRob3I6IFNhbGFoIFRyaWtpIDxzYWxhaC50cmlraUBnbWFpbC5jb20+CkRh
dGU6ICAgU2F0IEp1bCAxOSAwNzozMzozNiAyMDI1ICswMTAwCgogICAgYWNjZWwvYW1keGRuYTog
RGVsZXRlIHBjaV9mcmVlX2lycV92ZWN0b3JzKCkKICAgIAogICAgVGhlIGRldmljZSBpcyBtYW5h
Z2VkIHNvIHBjaV9mcmVlX2lycV92ZWN0b3JzKCkgaXMgY2FsbGVkIGF1dG9tYXRpY2FsbHkKICAg
IG5vIG5lZWQgdG8gZG8gaXQgbWFudWFsbHkuCiAgICAKICAgIFJldmlld2VkLWJ5OiBKYWNlayBM
YXdyeW5vd2ljeiA8amFjZWsubGF3cnlub3dpY3pAbGludXguaW50ZWwuY29tPgogICAgU2lnbmVk
LW9mZi1ieTogU2FsYWggVHJpa2kgPHNhbGFoLnRyaWtpQGdtYWlsLmNvbT4KICAgIFNpZ25lZC1v
ZmYtYnk6IExpemhpIEhvdSA8bGl6aGkuaG91QGFtZC5jb20+CiAgICBMaW5rOiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9yL2FIczhRQWZVbEZlTnA3cUxAcGMKCmNvbW1pdCA2MDRmN2U3Nzc3ZDY2
MzAzMzA2Mzg4NmI2YTUzNjJkMGU2MDkyZTNhCkF1dGhvcjogTWljaGHFgiBXaW5pYXJza2kgPG1p
Y2hhbC53aW5pYXJza2lAaW50ZWwuY29tPgpEYXRlOiAgIFdlZCBOb3YgMjkgMjI6NDQ6NTkgMjAy
MyArMDEwMAoKICAgIGRybS94ZS9pcnE6IERvbid0IGNhbGwgcGNpX2ZyZWVfaXJxX3ZlY3RvcnMK
ICAgIAogICAgRm9yIGRldnJlcyBtYW5hZ2VkIGRldmljZXMsIHBjaV9hbGxvY19pcnFfdmVjdG9y
cyBpcyBhbHNvIG1hbmFnZWQgKHNlZQogICAgcGNpX3NldHVwX21zaV9jb250ZXh0IGZvciByZWZl
cmVuY2UpLgogICAgUENJIGRldmljZSB1c2VkIGJ5IFhlIGlzIGRldnJlcyBtYW5hZ2VkIChpdCB3
YXMgZW5hYmxlZCB3aXRoCiAgICBwY2ltX2VuYWJsZV9kZXZpY2UpLCB3aGljaCBtZWFucyB0aGF0
IGNhbGxzIHRvIHBjaV9mcmVlX2lycV92ZWN0b3JzIGFyZQogICAgcmVkdW5kYW50IGFuZCBjYW4g
YmUgc2FmZWx5IHJlbW92ZWQuCiAgICAKICAgIFNpZ25lZC1vZmYtYnk6IE1pY2hhxYIgV2luaWFy
c2tpIDxtaWNoYWwud2luaWFyc2tpQGludGVsLmNvbT4KICAgIFJldmlld2VkLWJ5OiBNYXR0IFJv
cGVyIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPgogICAgTGluazogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvci8yMDIzMTEyOTIxNDUwOS4xMTc0MTE2LTQtbWljaGFsLndpbmlhcnNraUBpbnRl
bC5jb20KICAgIFNpZ25lZC1vZmYtYnk6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVs
LmNvbT4KCmNvbW1pdCBhMjY0Y2VlMzFmMTNhZTNiOGQzMmIzZTUzNzc0NzU5YWZhNTUzNjFlCkF1
dGhvcjogU3Jpbml2YXMgUGFuZHJ1dmFkYSA8c3Jpbml2YXMucGFuZHJ1dmFkYUBsaW51eC5pbnRl
bC5jb20+CkRhdGU6ICAgV2VkIEp1biAxOSAxMDoyMTowNyAyMDI0IC0wNzAwCgogICAgdGhlcm1h
bDogaW50ZWw6IGludDM0MHg6IFJlbW92ZSB1bm5lY2Vzc2FyeSBjYWxscyB0byBmcmVlIGlycQog
ICAgCiAgICBSZW1vdmUgY2FsbHMgdG8gZGV2bV9mcmVlX2lycSgpIGFuZCBwY2lfZnJlZV9pcnFf
dmVjdG9ycygpLgogICAgVGhleSB3aWxsIGJlIGNhbGxlZCBvbiBkcml2ZXIgcmVsZWFzZSBhbnl3
YXkuCiAgICAKICAgIFNpZ25lZC1vZmYtYnk6IFNyaW5pdmFzIFBhbmRydXZhZGEgPHNyaW5pdmFz
LnBhbmRydXZhZGFAbGludXguaW50ZWwuY29tPgogICAgTGluazogaHR0cHM6Ly9wYXRjaC5tc2dp
ZC5saW5rLzIwMjQwNjE5MTcyMTA5LjQ5NzYzOS0yLXNyaW5pdmFzLnBhbmRydXZhZGFAbGludXgu
aW50ZWwuY29tCiAgICBTaWduZWQtb2ZmLWJ5OiBSYWZhZWwgSi4gV3lzb2NraSA8cmFmYWVsLmou
d3lzb2NraUBpbnRlbC5jb20+Cgpjb21taXQgNWU3NGE0YjNlYzE4MTZlM2JiZmQ3MTVkNDZhZTI5
ZDI1MDgwNzljYgpBdXRob3I6IENocmlzdG9waGUgSkFJTExFVCA8Y2hyaXN0b3BoZS5qYWlsbGV0
QHdhbmFkb28uZnI+CkRhdGU6ICAgU3VuIEp1biA1IDIyOjUwOjQ4IDIwMjIgKzAyMDAKCiAgICBz
dG1tYWM6IGludGVsOiBGaXggYW4gZXJyb3IgaGFuZGxpbmcgcGF0aCBpbiBpbnRlbF9ldGhfcGNp
X3Byb2JlKCkKICAgIAogICAgV2hlbiB0aGUgbWFuYWdlZCBBUEkgaXMgdXNlZCwgdGhlcmUgaXMg
bm8gbmVlZCB0byBleHBsaWNpdGx5IGNhbGwKICAgIHBjaV9mcmVlX2lycV92ZWN0b3JzKCkuCiAg
ICAKICAgIFRoaXMgbG9va3MgdG8gYmUgYSBsZWZ0LW92ZXIgZnJvbSB0aGUgY29tbWl0IGluIHRo
ZSBGaXhlcyB0YWcuIE9ubHkgdGhlCiAgICAucmVtb3ZlKCkgZnVuY3Rpb24gaGFkIGJlZW4gdXBk
YXRlZC4KICAgIAogICAgU28gcmVtb3ZlIHRoaXMgdW51c2VkIGZ1bmN0aW9uIGNhbGwgYW5kIHVw
ZGF0ZSBnb3RvIGxhYmVsIGFjY29yZGluZ2x5LgogICAgCiAgICBGaXhlczogOGFjY2M0Njc3NThl
ICgic3RtbWFjOiBpbnRlbDogdXNlIG1hbmFnZWQgUENJIGZ1bmN0aW9uIG9uIHByb2JlIGFuZCBy
ZXN1bWUiKQogICAgU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBKQUlMTEVUIDxjaHJpc3RvcGhl
LmphaWxsZXRAd2FuYWRvby5mcj4KICAgIFJldmlld2VkLWJ5OiBXb25nIFZlZSBLaGVlIDx2ZWUu
a2hlZS53b25nQGxpbnV4LmludGVsLmNvbT4KICAgIExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL3IvMWFjOWI2Nzg3YjBkYjgzYjAwOTU3MTE4ODJjNTVjNzdjOGVhOGRhMC4xNjU0NDYyMjQx
LmdpdC5jaHJpc3RvcGhlLmphaWxsZXRAd2FuYWRvby5mcgogICAgU2lnbmVkLW9mZi1ieTogUGFv
bG8gQWJlbmkgPHBhYmVuaUByZWRoYXQuY29tPgoKCj4gCj4gSSBzdWdnZXN0IGNvbW1pdCBtZXNz
YWdlIGRlc2NyaXB0IHdob2xlIHN0b3J5IG9yIGNoYW5nZSBQQ0kncyBkb2N1bWVudAo+IHRvIGRl
c2NyaXB0IGl0IGNsZWFybHkuIEkgdGhpbmsgb3RoZXIgcGVyc29uIHNob3VsZCBoYXZlIHNpbWls
YXIgcXVlc3Rpb24KPiBpZiBoZSBoYXZlIG5vdCBjbG9zZWx5IGZvbGxvdyBQQ0kncyBjaGFuZ2Ug
YW5kIGdvIHRocm91Z2ggUENJIGNvZGVzLgo+IAo+IEZyYW5rCj4gCj4+Cj4+Pgo+Pj4gVGhlIGJl
bG93IHN0YXRlbWVudCBzaG91bGQgYmUgd3JvbmcuCj4+Pgo+Pj4gIkRvIG5vdCBjYWxsIHBjaV9m
cmVlX2lycV92ZWN0b3JzKCkgYmVjYXVzZSBpdCBpcyB1bm5lY2Vzc2FyeSB3aGVuIHRoZSBkZXZp
Y2UgaXMKPj4+IG1hbmFnZWQgZHVlIHRvIHRoZSB1c2Ugb2YgcGNpbV9lbmFibGVfZGV2aWNlKCku
Igo+Pj4KPj4+IEZyYW5rCj4+Pj4KPj4+Pj4KPj4+Pj4gQW5kIG1vdmUgdGhlc2Ugc21hbGwgcGF0
Y2ggYWhlYWQgaW4gc2VyaXNlLgo+Pj4+Pgo+Pj4+PiBGcmFuawo+Pj4+Pj4KPj4+Pj4+IFNpZ25l
ZC1vZmYtYnk6IEFkcmlhbiBIdW50ZXIgPGFkcmlhbi5odW50ZXJAaW50ZWwuY29tPgo+Pj4+Pj4g
LS0tCj4+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+IENoYW5nZXMgaW4gVjI6Cj4+Pj4+PiAJTmV3IHBhdGNo
IHNwbGl0IGZyb20gImkzYzogbWlwaS1pM2MtaGNpLXBjaTogQWRkIHN1cHBvcnQgZm9yCj4+Pj4+
PiAJTXVsdGktQnVzIEluc3RhbmNlcyIKPj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4gIGRyaXZlcnMvaTNj
L21hc3Rlci9taXBpLWkzYy1oY2kvbWlwaS1pM2MtaGNpLXBjaS5jIHwgOCArKysrKystLQo+Pj4+
Pj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Pj4+
Pgo+Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci9taXBpLWkzYy1oY2kvbWlw
aS1pM2MtaGNpLXBjaS5jIGIvZHJpdmVycy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9taXBpLWkz
Yy1oY2ktcGNpLmMKPj4+Pj4+IGluZGV4IDhhZGU5MTFlMzgzNS4uMGZkMzU4NzY3MWUxIDEwMDY0
NAo+Pj4+Pj4gLS0tIGEvZHJpdmVycy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9taXBpLWkzYy1o
Y2ktcGNpLmMKPj4+Pj4+ICsrKyBiL2RyaXZlcnMvaTNjL21hc3Rlci9taXBpLWkzYy1oY2kvbWlw
aS1pM2MtaGNpLXBjaS5jCj4+Pj4+PiBAQCAtMjAzLDYgKzIwMywxMCBAQCBzdGF0aWMgaW50IG1p
cGlfaTNjX2hjaV9wY2lfcHJvYmUoc3RydWN0IHBjaV9kZXYgKnBjaSwKPj4+Pj4+Cj4+Pj4+PiAg
CXBjaV9zZXRfbWFzdGVyKHBjaSk7Cj4+Pj4+Pgo+Pj4+Pj4gKwlyZXQgPSBwY2lfYWxsb2NfaXJx
X3ZlY3RvcnMocGNpLCAxLCAxLCBQQ0lfSVJRX0FMTF9UWVBFUyk7Cj4+Pj4+PiArCWlmIChyZXQg
PCAwKQo+Pj4+Pj4gKwkJcmV0dXJuIHJldDsKPj4+Pj4+ICsKPj4+Pj4+ICAJbWVtc2V0KCZyZXMs
IDAsIHNpemVvZihyZXMpKTsKPj4+Pj4+Cj4+Pj4+PiAgCXJlc1swXS5mbGFncyA9IElPUkVTT1VS
Q0VfTUVNOwo+Pj4+Pj4gQEAgLTIxMCw4ICsyMTQsOCBAQCBzdGF0aWMgaW50IG1pcGlfaTNjX2hj
aV9wY2lfcHJvYmUoc3RydWN0IHBjaV9kZXYgKnBjaSwKPj4+Pj4+ICAJcmVzWzBdLmVuZCA9IHBj
aV9yZXNvdXJjZV9lbmQocGNpLCAwKTsKPj4+Pj4+Cj4+Pj4+PiAgCXJlc1sxXS5mbGFncyA9IElP
UkVTT1VSQ0VfSVJROwo+Pj4+Pj4gLQlyZXNbMV0uc3RhcnQgPSBwY2ktPmlycTsKPj4+Pj4+IC0J
cmVzWzFdLmVuZCA9IHBjaS0+aXJxOwo+Pj4+Pj4gKwlyZXNbMV0uc3RhcnQgPSBwY2lfaXJxX3Zl
Y3RvcihoY2ktPnBjaSwgMCk7Cj4+Pj4+PiArCXJlc1sxXS5lbmQgPSByZXNbMV0uc3RhcnQ7Cj4+
Pj4+Pgo+Pj4+Pj4gIAlkZXZfaWQgPSBpZGFfYWxsb2MoJm1pcGlfaTNjX2hjaV9wY2lfaWRhLCBH
RlBfS0VSTkVMKTsKPj4+Pj4+ICAJaWYgKGRldl9pZCA8IDApCj4+Pj4+PiAtLQo+Pj4+Pj4gMi41
MS4wCj4+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+IC0tCj4+Pj4+PiBsaW51eC1pM2MgbWFpbGluZyBsaXN0
Cj4+Pj4+PiBsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwo+Pj4+Pj4gaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MKPj4+Pgo+Pj4+Cj4+Pj4g
LS0KPj4+PiBsaW51eC1pM2MgbWFpbGluZyBsaXN0Cj4+Pj4gbGludXgtaTNjQGxpc3RzLmluZnJh
ZGVhZC5vcmcKPj4+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWkzYwo+Pgo+Pgo+PiAtLQo+PiBsaW51eC1pM2MgbWFpbGluZyBsaXN0Cj4+IGxpbnV4
LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCj4+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtaTNjCgoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGlu
dXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1pM2MK
