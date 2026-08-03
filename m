Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 093B0C55184
	for <linux-i3c@archiver.kernel.org>; Mon,  3 Aug 2026 15:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=OlDAs4UKL5iV3rCebzNVWG3HXdSA6RsrcVyEpnU8If0=; b=lqkYEb0Zg6vrVJtfzgMgiHVUZs
	4vQkK5g8/NBvIDY2LNbBkqZ0aSUuJBHcNR3O8HJZpa1oB+OxIgWSq9J9X1WX4ajy5jMRjOVtm5VU+
	pB3L5jMl41kVt5G7wqpxZAK3F9LqYLeL8CFW9Hd85+QBWkLG18kowqpJFw9aZ7YcRYEx3EjlrVhuT
	TDDX/k0UVxGciYAJ8A7BjjfFPfb5UHD7WAiUSfa9+Q35DdUGM+9jcWO3JPUhN7gmSY3czpKbTL3n0
	e5mjGqtMDL9hgVmsvdc6ukIboR3bM0fsZnJjLNmjctdcCrpG7ooWmd0/uKuJycQgOzB2ciiKUgk2m
	tloJnGgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqv2Y-0000000Haw7-302F;
	Mon, 03 Aug 2026 15:57:22 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqv2W-0000000Hava-24sT
	for linux-i3c@lists.infradead.org;
	Mon, 03 Aug 2026 15:57:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785772641; x=1817308641;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=sBg66uMzZal61hy46iFQVQaDXX/fpPj7bxJIXdTlAsM=;
  b=doyGbPgUsywr0rkkupsbYvfYhI3a4OqjZcm06d4CsAcTuTB8FKfaWA4M
   lJwQA5MDSpMSlh8wzy61TrMCh6YFBu3fWb7JawognsiEjerg/8lXDI1Sy
   N811oVKWb34Mpq3rIAjznRdlbU43NEKcuMMJL1WQlLs2a13YWUGX0P4UN
   G/yHMCdSqzdpJUyV5stYCrZh9SnbOd7nIBqFhy48c07i67M36LfZf0Lkr
   LH6pY188yV1ZcprPS34N86oocu3vlnHpxh3pURwvp/xBYqmBhnFzE1uC/
   eesqP9dmYOkoEumaEemNvKeApIOW/nFDoqyhnPAI448uVFEDqW03zNtEK
   A==;
X-CSE-ConnectionGUID: BpsekV4oTE2zdueWu9JUUQ==
X-CSE-MsgGUID: Z/BSk92BQbe4Ae/gOpw56w==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="90124124"
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; 
   d="scan'208";a="90124124"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 08:57:18 -0700
X-CSE-ConnectionGUID: p82x6rBtRWq3Z/QqxN17qQ==
X-CSE-MsgGUID: VdeELORVTR2DJqrjcCyQ8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; 
   d="scan'208";a="263238599"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 08:57:17 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 08:57:16 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 3 Aug 2026 08:57:16 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.33) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 08:57:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mmygw62ib5dY53tOPsBwpIR5uadI7i/C8AlWC+8+lHck8oDIBTCBqNa1juDsaGxpXPF8uodNhwe6b0l3fyzItF+mFPlMafEXCZhahGN0rcI+Ve51NayeYCzigx3MvaneHrSFmmr/2gTM/ZDiZQRfZt8KAojzQZv6+UFoJygSvS6PBgeYANlT9nyVg1kt42bteUply6NZ+dGgGsarQysBsbbdJ+U/KWFEf1YZ65q81T7B2HduOxVsAPNIxi2+s+lu4264UwRFQdalTluG4p7FL7ytinjI8LqvI92vcBf3+6vFCGtQEEyIlmIFYK+P3HNVoY3+K1IirSCVMX3IYsZsHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=//eibO2nFdVYf1LDql3HsluxzbTZP1ihYzmzgBn996o=;
 b=bPg6+nKlqkdDv+RuOVIlCs9H6AJL6I/sn4vfSDUkhq2SSMt6Jo0CyP5kQPSa0+o3P17TImKNBDYaRUZYg9d7R0S9abbeySuegO6mca31nmHxCP4FIMtwqnJ20fUIvhA2+ybi9MZhUcyQYfZJ6wD7ZIuvhqyL5oHpduLJeCUClxGFydIEgMjKTbfxaAwkFJeJIpjDTzj8HKjqxYuc+3zTdrO+Me7iZZKAhX++5N9ZLKz//cHsH2E9xn2orMO4HqmWlf/uxVUZgv88VEUSNcobVeZi4sg8aB6yoBFr4sN2Hw7QcA46GReCmjpDjZxJwDgpmoRiAtAgvOW1fr4Qi0e/MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by LV1PR11MB8819.namprd11.prod.outlook.com (2603:10b6:408:2b3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Mon, 3 Aug
 2026 15:57:10 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 15:57:10 +0000
Message-ID: <cfc12bc7-b001-4088-b010-0d9ca4d30996@intel.com>
Date: Mon, 3 Aug 2026 18:57:05 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 7/8] i3c: mipi-i3c-hci: Factor out i3c_hci_sysdev()
To: Frank Li <Frank.li@oss.nxp.com>
CC: <alexandre.belloni@bootlin.com>, <Frank.Li@nxp.com>, <rafael@kernel.org>,
	<linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-pci@vger.kernel.org>, <linux-pm@vger.kernel.org>
References: <20260728155308.142713-1-adrian.hunter@intel.com>
 <20260728155308.142713-8-adrian.hunter@intel.com>
 <amkMqm-o8OSeF9Yr@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <amkMqm-o8OSeF9Yr@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: DU2PR04CA0052.eurprd04.prod.outlook.com
 (2603:10a6:10:234::27) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|LV1PR11MB8819:EE_
X-MS-Office365-Filtering-Correlation-Id: 97851f94-6f63-43dc-0d27-08def177e03a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|11063799006|56012099006|10067099003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: qDcyrhSsScd1xfl9TkOz1c0cETdqT2gndljkMdlxHRjVzbSov8wpymDyUIQEQREy6qmOTAYVjU46uUqjQ8vrn3xKk9MlAWe3DFbMU46q/SzdAcAEcgmxPcMGUtSO3ELWoJVmBGe+ECRS8x7s6pPsGumYk3183C9vKL/7HI1L9B0813ivxMTslQ6AJwoRa3QWznnR0jx2L3x0kEuP3K8GqojjaMrCsCrljCyqEh5qpCZ8zNgpliZSeOXESANRkyjkt5fZtR+KGTWVIA++JwxVRLxyEw5zq41FR+rNPPbL1/L9KfR5GFxtItoy0nR04Ej3HtE3RjADUfleeHTbeny+IXrAleK8NWRpebS3ub2R5NV2nAomkcO93Gw5oS/6l0XVNZ5l4XURCbIY09gm+3JWdcZJwQFNiq8qU7dsqcf1U9UeHJ4b+5X7Jh+uicypOrRH+KKKZtHysYq7Q8PQTvtPdZPu7FjVfSge89xVMV45cc1a7kGBjvGDFXMM6bPXAqp5kmIDNwmgV9O7zXVC7OqkLueLFbSO81e686NJLbojlDif6WqfacaJu5qKZk2YRup3pjwcGQm8JiSmgtEiNU4LWqvbqfJ4WdYOWZs1iCMRt+ifzA2MODxQrY5FQC5vjACNsRpcRUfae6UidUTr1stgr5j61y9+9QBHP0qAg5vYwc0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(11063799006)(56012099006)(10067099003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c01wano3RWMrYTBZQWF2VWp3Tk1qZ0hOR0VNSGZCbXpyaE13VTN0WnVKRnBi?=
 =?utf-8?B?MUNVbEN2NGwvbnp0QzkvWmtqQWtlalBJM04yQkJCVXhWZjdYZisxRkJTSGZl?=
 =?utf-8?B?MmIxQm5BZnlZM1VDYW9CMVhkTUtGUFZ1czBiaVdWZU5CODZCaUhRaFVVd0l3?=
 =?utf-8?B?MHBxZFk2MGRSRDBuSVl1UG40UzhaSWNpRUdaUlVnbmp5R0VTOE1QQ1JhMU1B?=
 =?utf-8?B?Uks3clRFalJMNTd1UjQ2dWt5QmhCTTBQaFBJNkpHc3FvazdXb2ErMFhmZUxE?=
 =?utf-8?B?OVRqNzVseG11Mi9vQTkxMzA0NWxpUUtPM1NVeU5lMW1QSnA5UFVNL1Y3L0FE?=
 =?utf-8?B?MVhwanZTMEprMkt0NHJUVFM3R0VTTTR3bXB3bHRIRDhaYzBta2RBcEx3dUw3?=
 =?utf-8?B?L1luUHJrVmpDYTRWRk1vQUpQbURZbTMzQjZhMWV1SHRFcDc2REJocGUvTHhU?=
 =?utf-8?B?a3pSQnZtTVAva1JoOFMxcFhOY29kM0ZoNUVJOXZua1hCS29oaDNkaWc5SWhu?=
 =?utf-8?B?cGN5NWloTkcwSmsxbHdBc0I4UC90Smd2ZHVzY3pvZG5tM3JJcUJkODZYaWpE?=
 =?utf-8?B?akg3U28rYWhuZkIxZHhUc1VYTCtLM2RwUnorMVdpM3VybUVUd285dmU4a1JL?=
 =?utf-8?B?bXEvOHN1SitBWmpWaVRlTThHWThaZmxpcnJxSllZVm5tQnRWZVhmUWhDeTMy?=
 =?utf-8?B?aC9uUktMYmlJNXp0dHgvWk8rc0pIanFyZDduMHZqOVdyZWxpdm5Ic3dCdXpi?=
 =?utf-8?B?U2ZuU2xmS1B4cFB5T0lxWVVKZTRrRW04cmJSRWlEbmZ5MzFoTmZ5TXU1WW1u?=
 =?utf-8?B?YURxMkNwTlNhK2krdGQrTTkyTFhhR28reEErUW1YSlM2RWE0YUJtMEtuMzlK?=
 =?utf-8?B?enQwaEkyWGhTUkNEOFQ3ZTd6RDRVSWEyS3RoL2xFdUxRSnpwNEU0M2doemdU?=
 =?utf-8?B?WlVKRkxpbDBEYVBSYVM1dEQ2UGZmTGZaTU1GRUI5MmxqazJMSGVqQVJ4UEE1?=
 =?utf-8?B?VVhmNDgva1BobkVJbDNRTnpzZlV6dzBjVzRKN1daakZhRUQ0Z2RtNkluTFpX?=
 =?utf-8?B?SkRxNHJiY1pHREY1SUhqN3lDeDVDUGhFaUVML0hkLzM4UGkrUDZ2QWoreDB2?=
 =?utf-8?B?eTNQelpWTzJ5U055a1lIdHRZM1k3b3VRL3VqK3V1TlVkcGx5WkpXelk0T1lH?=
 =?utf-8?B?SkJZRnd3YkNVMUt0b1U3dzhYMC9udy9EZkNJbURVWWFWVjRjLzhGcEI3T1V1?=
 =?utf-8?B?SjluYi9OTE4yYXFXTHRvZ05CRjNjb1lJMU9qWWgzZUpBdTZxZU5URE52cVNI?=
 =?utf-8?B?TkdPaW1HYjMzTFZZVXV0b2JGcHZ5NG9rcWlwaGlZTVg4RjcreFBmOUpjQ0I0?=
 =?utf-8?B?TmxzSGtCM3dUT2FtNVp0T1pqN3hCMDAzeXduay80emZ2K2owaG51ZnprQkdt?=
 =?utf-8?B?WUpkTGsvam00aWVOMytEc3VBbWVuSWxxSHNId1h1Y0tkQVpJdmRPcms0UmZo?=
 =?utf-8?B?b3FCZkw1Q2tCdjhvYzdOQ1VqZzRINCtlWnNVeGFoTjQ4WkNqcE5MQjVMSmdO?=
 =?utf-8?B?dnBTZndCaXBUK25BSmlIVGZ4Z3p3eGkxVkQwbjY4b0pjUlo2bFZZRVVJVFBz?=
 =?utf-8?B?Q1J3ci9udmxiN0Q4L3JNZDNTbWJ4bnloNXVFYmc2RVl1OXErVHpDVkxmZEdm?=
 =?utf-8?B?cWxYbHBtM3kyWU56S2J0OEdJRnhUdmtsNTBWY0ZsQ01NVlFrdFR1SGZIcGF0?=
 =?utf-8?B?OEZuYmI4VFg4aHJvQkgxaDIzdEEwSythZExZcXl0VGVwV2xQWkpCUXFJRFJi?=
 =?utf-8?B?eTdWK0VGejBWc0hsdm1mMFRVWGZTVnNPdFRDL2ttRHI3aWczZWlsc2liRGJW?=
 =?utf-8?B?Y1h6Zi9yYVBLcmRnT00xTlpvc1k3cDkvNjVsRDJJVWNHdkFGN1ZMcTExeExD?=
 =?utf-8?B?RVJGQ0F4VnFyQmZwMkNvajRrOU1tRC9YT3NDTE1DUWhmUzN2Q0hYWjIra3hw?=
 =?utf-8?B?RnZNL3c0MUZHbmI3Z0l5ZjNxSGxXbUpSNW41bllQTzFuSG9RY2ZXOGk1djJk?=
 =?utf-8?B?Wk5Pd2E3aFEwUnU3MkdvbjU0UWtkQVdpbUJPRytmanFHNWgxbk10RzgzWE16?=
 =?utf-8?B?bGd2b1B5STc1K29KYnlKQWY3R3U5aGx6Q1pTM2I2OFR1NEdUTEVMb1Z4bXpm?=
 =?utf-8?B?VHNtYkVRWnNTem1WVkZxaUdISnd0M1F1QlpGTUxDTDczRldNVi9Zajl6dzQ2?=
 =?utf-8?B?enBVNU9lcHMzOURGVENuRFhLSlR3QVlGdTJPN1Bzb3BwNEtwWHYvOHc4N2li?=
 =?utf-8?B?NEpneCtuaFFMemgzaFU2YzBJbkVrd1A4eVhRWm9SQVVsTWFKRVJ6emQ5TEYw?=
 =?utf-8?Q?4uIys5by2cdowKbc=3D?=
X-Exchange-RoutingPolicyChecked: qhHkQdJQju1Qi0FNv9/9ZdOryc9suTNdMRfr8FTrIIlmZf3YyGYe0ztm7Nu4/D3xENKyify0qs8skCL3KPdi/NnQ9EpZVbB4ORcAOnys3BDuwXIzTmalgA7CNn1zwQHKZr+4DU6VJc+25adsr21YaBiYGhMfRZ6mjlISWOd99cjs+Lml9RvNCUuK6yjtJWJY3MzRdzxUFKcn0StPS/fYJ347Wa34dnOr+gzAZBbkgvF+Nw6WLWabvwB9FyOHcd87iW/2GfasmwZbndB+LDI0/nyRjGBYaa1zdIcBleyTFi1JRd+sUGgxyotsugFoS1JHHcgGyuR+7Y+JuCVvZ5MDzQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 97851f94-6f63-43dc-0d27-08def177e03a
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 15:57:10.0270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EaFgjuyh2DCeygOomj0cJ0QoBDOjctQDjQZdxj2jbhAIfNu7EgVTRBP+OpUU1NVWDv/XkRLC/oFPj9Of2mCWcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8819
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_085720_553907_5584F7DA 
X-CRM114-Status: GOOD (  21.05  )
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

On 28/07/2026 23:10, Frank Li wrote:
> On Tue, Jul 28, 2026 at 06:53:07PM +0300, Adrian Hunter wrote:
>> The MIPI I3C HCI driver needs to identify the underlying system device
>> used for DMA mapping and PM operations. The logic for determining that
>> device is currently embedded in the DMA implementation.
>>
>> Factor this code out into i3c_hci_sysdev() so it can be shared by other
>> parts of the driver and keep the device-selection logic in one place.
>>
>> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
>> ---
>>
>>
>> Changes in V2:
>>
>> 	None
>>
>>
>>  drivers/i3c/master/mipi-i3c-hci/core.c | 12 ++++++++++++
>>  drivers/i3c/master/mipi-i3c-hci/dma.c  | 15 +--------------
>>  drivers/i3c/master/mipi-i3c-hci/hci.h  |  2 ++
>>  3 files changed, 15 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
>> index cfe9b5390b56..0212c9e984cf 100644
>> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
>> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
>> @@ -15,6 +15,7 @@
>>  #include <linux/interrupt.h>
>>  #include <linux/iopoll.h>
>>  #include <linux/module.h>
>> +#include <linux/pci.h>
>>  #include <linux/platform_data/mipi-i3c-hci.h>
>>  #include <linux/platform_device.h>
>>  #include <linux/pm_runtime.h>
>> @@ -117,6 +118,17 @@ static inline struct i3c_hci *to_i3c_hci(struct i3c_master_controller *m)
>>  	return container_of(m, struct i3c_hci, master);
>>  }
>>
>> +/*
>> + * Determine the device that does PM / DMA and has IOMMU setup done for it in
>> + * case of enabled IOMMU (for use with the DMA API).
>> + * Such device is either "mipi-i3c-hci" platform device (OF/ACPI enumeration)
>> + * parent or grandparent (PCI enumeration).
>> + */
>> +struct device *i3c_hci_sysdev(struct device *dev)
> 
> Is it simpler if argument is struct i3c_hci *hci

It will be called before hci->master.dev.parent is populated,
see patch 8.

> 
> Frank
> 
>> +{
>> +	return dev->parent && dev_is_pci(dev->parent) ? dev->parent : dev;
>> +}
>> +
>>  static void i3c_hci_set_master_dyn_addr(struct i3c_hci *hci)
>>  {
>>  	reg_write(MASTER_DEVICE_ADDR,
>> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
>> index 0672ed1132f8..7c2b20474130 100644
>> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
>> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
>> @@ -15,7 +15,6 @@
>>  #include <linux/errno.h>
>>  #include <linux/i3c/master.h>
>>  #include <linux/io.h>
>> -#include <linux/pci.h>
>>
>>  #include "hci.h"
>>  #include "cmd.h"
>> @@ -301,23 +300,11 @@ static int hci_dma_init(struct i3c_hci *hci)
>>  {
>>  	struct hci_rings_data *rings;
>>  	struct hci_rh_data *rh;
>> -	struct device *sysdev;
>>  	u32 regval;
>>  	unsigned int i, nr_rings, xfers_sz, resps_sz;
>>  	unsigned int ibi_status_ring_sz, ibi_data_ring_sz;
>>  	int ret;
>>
>> -	/*
>> -	 * Set pointer to a physical device that does DMA and has IOMMU setup
>> -	 * done for it in case of enabled IOMMU and use it with the DMA API.
>> -	 * Here such device is either
>> -	 * "mipi-i3c-hci" platform device (OF/ACPI enumeration) parent or
>> -	 * grandparent (PCI enumeration).
>> -	 */
>> -	sysdev = hci->master.dev.parent;
>> -	if (sysdev->parent && dev_is_pci(sysdev->parent))
>> -		sysdev = sysdev->parent;
>> -
>>  	regval = rhs_reg_read(CONTROL);
>>  	nr_rings = FIELD_GET(MAX_HEADER_COUNT_CAP, regval);
>>  	dev_dbg(&hci->master.dev, "%d DMA rings available\n", nr_rings);
>> @@ -332,7 +319,7 @@ static int hci_dma_init(struct i3c_hci *hci)
>>  		return -ENOMEM;
>>  	hci->io_data = rings;
>>  	rings->total = nr_rings;
>> -	rings->sysdev = sysdev;
>> +	rings->sysdev = i3c_hci_sysdev(hci->master.dev.parent);
>>
>>  	for (i = 0; i < rings->total; i++) {
>>  		u32 offset = rhs_reg_read(RHn_OFFSET(i));
>> diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
>> index b3d9803b1968..b8d2a3d680f8 100644
>> --- a/drivers/i3c/master/mipi-i3c-hci/hci.h
>> +++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
>> @@ -184,6 +184,8 @@ void amd_set_resp_buf_thld(struct i3c_hci *hci);
>>  void i3c_hci_sync_irq_inactive(struct i3c_hci *hci);
>>  int i3c_hci_process_xfer(struct i3c_hci *hci, struct hci_xfer *xfer, int n);
>>
>> +struct device *i3c_hci_sysdev(struct device *dev);
>> +
>>  #define DEFAULT_AUTOSUSPEND_DELAY_MS 1000
>>
>>  int i3c_hci_rpm_suspend(struct device *dev);
>> --
>> 2.53.0
>>


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
