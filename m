Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C898FD4F16
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Mar 2026 19:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=2FLrSm+dYsym3klzX3fpAIHlk1/yugN65aJsWm06JDI=; b=hkmTyrBRzDVQxrfM4gsj2Geetd
	urvY5G5XU3GLiTmzG7GfBDvaPOZiE/KDGnWW0YEyuMr/MsVhXJU49crmaS6xikrbfYEyOxIRmhW15
	I+5UFVJvF/sOIhtC+ZexezK4M/+alCDZsBJlwavVGzx4OQkjuG5Nok+e8g/TLhVDuOSgC5FVTtW5d
	uh2jjMbTL/Ani3pJ2YvqeljUZ96TBUMWdZ+YFH8R/mnrk+Rubm2EQW8nYa9OQiL6KsxwisVMoxztv
	d0EPhzlghO5FU09USYVeT5YzMo87vpiKDr919oiQxSa/CBjPpafW9DLWfL0AcRi7NRQxfIh/jMpe8
	WgraJJCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w02XT-0000000A9vB-05q3;
	Tue, 10 Mar 2026 19:14:43 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w02XR-0000000A9ue-0FMm
	for linux-i3c@lists.infradead.org;
	Tue, 10 Mar 2026 19:14:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773170079; x=1804706079;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=vIFLZUKvRcuLDyB6xYkv640N1RdTQ0kPw4/GPObvgDI=;
  b=QYpu+F3s2BEp2VaUh9FI9NQkNPFKTJnjfu1FAwZWbuh8xFWpifEi5S83
   fR8/pzZ0XNIHZhJ2wT0AeCbTPx+tz/vIHlWo3RphOPDW1Apr2iz86j55j
   5UGAX8nhzYJMiLpNFBZCk97CMfNDLHLXJRsJ4Z3LUGjmmvNATYSgx0rS7
   IAtP8s78KrBzXtkk1DiW4mA2dt2I/PZsoffsOmVmEIiqL4rKjO0zVgSmZ
   smg8W0Zf1LmmOYNoTySGqy3iU97rVLeqGvw8wBnwrAuqcb+3MjEgKdClW
   n+ukQ/14GqvlqPID/tXqPYmcJCo74pRXMuRBLSrr2CyGZ+k/QUr0MX0wl
   g==;
X-CSE-ConnectionGUID: IyShji4BQGW54ATgcrtOyw==
X-CSE-MsgGUID: 5AD4o/+hQ/eOEU+aQPnKmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="85319780"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="85319780"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 12:14:38 -0700
X-CSE-ConnectionGUID: Jc4ByURJTwCLeKxdVB4V9A==
X-CSE-MsgGUID: hbpX1bcsQWawOwh/gxwANg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="258138265"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 12:14:40 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 12:14:39 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 10 Mar 2026 12:14:39 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.49) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 12:14:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b630OpnY7GvHdS6wgOeEAPaHys6sap8D/taIMowEKrSanR9QeQ7SQC68Urn0MfWSZ+YmBkilT5yDxfaXuwWxDP9Ybv+uTgqdUQdSkhRmO1c8VuIc4hhII8OBJbu8+zmYO+H1swGwZwS3Rhti/50eV5QxBoWvpUpXrqnPmLrtoAxgJydFkDYQckzbV292Ysa4AbeyjzhAra+9EVquNGdIjs0+K+Hfa1NbYRNYJkKpjP6DrpgEnspCsgS5jknOybI91dasapDD1jgowZnbNLZg12rkYwLApFamrVp+N23TSzAIb1qLeQYFXP5O5q2rztWhXY1IBXyGfJNFt8Tno87WqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KCkbC6YL9LyYli41muiK9q3gT+ZyYoyib1vKVoyAqOg=;
 b=qiR4ruUB8Sa+auwCei80xkN/AeIV0iTqhem5oP5D9ENQ3zq37x96vvxMmPJHLzcgvLb7ITazh6RUPIsz6yn3HzYo6U5ZyJnK89gpluhx5ReE3ItnNN9NeBjfZ9vk+HvxMPHZjS6N98EyzgD/UA7/7uTVBEBX8pn7XE4w12BgfUAL5UYOWuUZggvcr1XFKFnv1Ay0QL7gMH3PWP+vzhPkTl178RikBQfq8iYJURvDeMRm7+AayJyz3IRcBJ9ne5iCIdYf65lwUNDSXHuWlkbvTugLKJSJVzsHiXADHtYv2Mp3ruOvEIh8UPeKAIiYoVo104II4jPz7ApD5n2bAqnSSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by DS4PPFE901A304F.namprd11.prod.outlook.com (2603:10b6:f:fc02::5b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 19:14:35 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 19:14:34 +0000
Message-ID: <6d526ec8-af80-460c-9663-67ed7ceb78bb@intel.com>
Date: Tue, 10 Mar 2026 21:14:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] i3c: master: Move bus_init error suppression
To: Jorge Marques <jorge.marques@analog.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>,
	=?UTF-8?Q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>
CC: <linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Dan
 Carpenter" <dan.carpenter@linaro.org>, Jonathan Cameron <jic23@kernel.org>
References: <20260308-ad4062-positive-error-fix-v1-0-72d3c5290b4a@analog.com>
 <20260308-ad4062-positive-error-fix-v1-3-72d3c5290b4a@analog.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20260308-ad4062-positive-error-fix-v1-3-72d3c5290b4a@analog.com>
X-ClientProxiedBy: DB9PR02CA0029.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9::34) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|DS4PPFE901A304F:EE_
X-MS-Office365-Filtering-Correlation-Id: 998e30c4-bacd-4965-8d31-08de7ed943d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|56012099003|22082099003|7053199007;
X-Microsoft-Antispam-Message-Info: ruKk5jNH3NqIgd7jpRXC+r9lm/E1WPRtV5OpQKQaczQmNaXU/mOh9ITky0GJR1BHy9x3Mgmm1bTDS1L2rJ+/K/C2k8GcmFp7dCe6E1c7tPRAcTfA1rslqkXguYjxNfCZLDUpj69iaJibpLVG/6oZRyyy4Hod6/cw9u4D1ZPVAI7LkxrrekDdJKgeBv8pNmFaVhF65ue3xaSajnLpemMXxrwDyzFmgsySJfzV7gluyqqIJSa8RHAh8aM9cyZZ2DwoYTQZFs6T8nWEwUnjO1GTMcp2lHUhuxlbxE3YxRz9ZbJD0ZlhRpcR+8AaShDMgyz3My/qHfXgk2g/gGS5neoAF/HMXozCZeZoIGhQ7xTx6QaXk2v59Q8OaUtkfHigUCKwiVgeMv7bIt+IbhUzQ5IHrQo66ZwlovJtfLhy3IF5erSqUnr2K5psZAptVsgqtDXc8A/fVK4Bbsds3bXyZqhAAKFKFVV3lwiWZEow4PYKvxES879Xzd6xUjI6UtQN/FK9/wY4z0DTROeY7G8869qN+NYR3YLR6fofdWmmNSqC+thWyK3wofWNVvVzYcRT4eFzGr9hM9ajubOUFv5xni/zJ2ZeeHCtRMU11h4Z0yCE9pNJcjYLGKpmKYleMYZ859hRd+FVEsXP4+BZtPlyC7g5yvDKsLuDLEbLGjzXyoSwj8xNzLVbn8jNz6oGA/WnQAVXt1fwiGkzoHSiBithpRlZzFCNY7ed+uREKf/l4stWbXk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(56012099003)(22082099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K08rRmlJd1JXbTFIYjBlYnM2WHEzR3ltZENvSDVuYnlqclExbWp2WkFFQ3RL?=
 =?utf-8?B?OWR1bnBFa3cxVDlEMUVqKzZhNkNVc2V5VERvajJxV2srSDB6dmVGcWdFTm0z?=
 =?utf-8?B?MnpvdlJoQk9ERnNRUEZpNFhWQ2JsNGpEdGdPTkxNQ2pCa1ltY3lMVHY5V3U0?=
 =?utf-8?B?V3pUTmVCQVNkMnNLNE5nRGdINFFwdmUwOXN4V21Oakt1WVlhS3E0Sm9KUEt0?=
 =?utf-8?B?dFlZVUJUQ0p1WThqWG5nQkNDTEhXczY4ZFBaR0tRU3RHMkQySVBNbUROZlFw?=
 =?utf-8?B?N2ZaYjFBTmttaWFMNEtyTU5BVTQ1RUZTakFLaEpQazArbHBJQ01RbEx4andw?=
 =?utf-8?B?Zk5zam1rSTY3NzFBa1Yya25qSmZBYmFtQ1cwSXEyVGF2MHNvNHNkT05NbG9x?=
 =?utf-8?B?ZTdoYVdSbVZsaXFUdDhXTmNNeG5NdERIaU0xaXlQaWxFRWVGOFVjZnUzWS91?=
 =?utf-8?B?SE84alJpQVlRQU16cmcrWUV6NE9pRWl1K1NzMXF0TXZSNFNuWHVVQ3A0QmxH?=
 =?utf-8?B?R2NVeFNlRVJOUUJqNzdtekw0MDR0blNTOVJld3BsWFU2dDhWeDJjNmFjVnM0?=
 =?utf-8?B?YVhQYjZzdGF4cXpXQ25mSThsdW9HbkNaYmtENVd0ZmRqb3BsRC9OVis5OUw0?=
 =?utf-8?B?WHM1czBxSG5TT1NKUkZGVlBRWDZVNlBKUHFxTkswdUwrRmlUWDg4dnVxYXF2?=
 =?utf-8?B?Z2xSN1VTWDM3WEJLVmFVOWpFYTJPVnk4TmEwRXdxd0RKZVR6VEpEYXBlUVIy?=
 =?utf-8?B?S0NJT1RrYTlsbk5lSTVnSjZFdjV3Q3pLWU10S1M2dlBKcWRKZVl2VFhkSnVs?=
 =?utf-8?B?YXA0ZmFmdTRUL3lKSmhIL0FWLzhJdUlQT2xEM3cxY3YyR1R4TThVK3RGNHM4?=
 =?utf-8?B?ajBkd2tHZnhXYXZaa0NHVkxFMnJPMitxUTc3ZTBCblJCUkFzS09ZQzlGQ3BZ?=
 =?utf-8?B?Z2djTlZFVGFvT2ZUdDFYMDdZS095TVhFMzNqMC94dDgza015Wmo0K3IydDhy?=
 =?utf-8?B?a3czVy9odlpWZ21NU1RHSzVuM1VBYnRiV1NrR0hxb3kxdGNoZGFmTWFEbE5R?=
 =?utf-8?B?M3JRTXBsMitVMjhNOWRvY252NzMrQlFrTm8xWndwVFE4UHgxVmVHYU9FTG9I?=
 =?utf-8?B?VzQ2Z2tacHVhdGM3NVhrQW8zR0svZkhyYUQyUmlaWDUreDFLQjFMM2U1eFZ3?=
 =?utf-8?B?QmxXalNqYzZFeWYvUVh3V215cnhJUHdoanJicEsrN0IzU2w3aXF4RUFCRVFx?=
 =?utf-8?B?TldSZGZpL1daU1l6Yi9hRnl3NE9od0lXRjVweFQ2c0pNK013WTdKMkI3K1ZX?=
 =?utf-8?B?QTdsSzVPcjdaZHhidllWUzRkVDV3L1VJK0ZnSEVVK3Q4cnVUMnVNcHgwRnVY?=
 =?utf-8?B?bVhOT3BVd1VTSXJhQ0V3YXBSdnB4WWFkU21YZWo2Zm40ZkZXWm5tRnBFakY0?=
 =?utf-8?B?Ky9LQ1BUekhEUFhsdFJXY2FaZm5OenNzdnd3V3BZTUxKU1k1eDQ0eSswa2pC?=
 =?utf-8?B?bUI1SkQwY01TbkgzSmRHL2g2UTF4NW5mb0RpWXF1SjY4NnZtTTlTVXFHUUJX?=
 =?utf-8?B?b2hydVpmemJJdTRWdU5weWRjRlpHekxnbnV5Mk1ZUFNLTENYRit1Z0FEQWRW?=
 =?utf-8?B?bEhSZEZ1RFRnTVBrRDZ3Qjhzd1FaY1VTckNZRENsRUFnaVdxbk1OR0prbGZL?=
 =?utf-8?B?QzhyTG5LSjZNVjFUUXJsV3Q3MElWM0oxRzJWU3pzNWxkNUx6ODN5dWcvMnBq?=
 =?utf-8?B?elQ5Tlh3bk0rMVR5OC8vQUdGMjArUWI0bXpIazhZWWhsazZLbUJsVW1KZ01K?=
 =?utf-8?B?djVIRDlVMEVQazNyRGdpaDVSeW9xQ1NWY1Z1d0EreHVUSitiN0FDM0wyK0Ja?=
 =?utf-8?B?SkJDMmJqMU9aNnRjWWJlNnl6TWxjcmdjcWlPMWQ3eEtOTEFQcXF1cmUxUnU0?=
 =?utf-8?B?V0FET2ljbmkzbnUxRFIwN3VYTm42WkZuaks1ZC8ydGMxamEybWRQTlVpOWg5?=
 =?utf-8?B?TFlJOXVFMW9KbnA1dWZKWXR1MXkzcWZQalBLVjdSVnhOU2luUnNoUUJDeXM3?=
 =?utf-8?B?RVA4SWxLdUI1UmNiWUUzL1MrdnVqVTRkV1Y4VjNKblVvL1Fvb3F1bTdxSGd0?=
 =?utf-8?B?Y3o4UWZ3MDNxVXNjbVBqbjd2bHNLTjU1ZmluUUwxY0ZYTm1LMWRuY2ZzQkFh?=
 =?utf-8?B?SkZhVjhMQlZTa1BTOXNTSklhYjJwQlBoSnBNVnh3Z3diK0hmMTN4SmNZNkx3?=
 =?utf-8?B?T1R0c3dBdGZCVjVxYnBhSElhL014Nmp4L1VlM1pITDVmUHRwNTIweElLTnh1?=
 =?utf-8?B?RjFseWlTT2VGTHdZM0ZYMWdyZFlzUkRWYmlCaG1JZEYxaW5Ec0gweDFtaTBC?=
 =?utf-8?Q?+2ULs848JH5XOwsQ=3D?=
X-Exchange-RoutingPolicyChecked: oCRB8AA2ElbYcc39Ru//eFJh3FVJhUsM9nabBo32BCsgXLq08sBg/wQAa/Y0osXlbWFoGhatm+OWlUjWPwR+Hw2ysRklaX2HMlPhaDj5ZPTOf4z44RHBsZ3nWu7gUhZ1k3XbAr3F6yltV/ddLY1IBqPbOJeHt/LKJFLL8Gbzg1jOugeBy3onfVcVNYyZzmbUqsFNUYv4QjYeTMm/AibmqpTLoJOnqQQ2p2xEqvVm8ibdPsvnVt3HOlkR/7PRF+9atDxuVovBHdtZaiGuF+B7o+BVjstHiNMPo91nCRVXseZqzC2VHze846B814oLLl60mj6SnAAT+s9QJclCLnEA/w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 998e30c4-bacd-4965-8d31-08de7ed943d6
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 19:14:34.7421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ht+EILG9SCxeKdh5BnCmUJdJiXuu/0cP3KTXa4otBzIPyRnicnOQMhqbbX/ozPhjh07wjIAssjTECNshYhl4xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFE901A304F
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_121441_150657_D1FB2E6D 
X-CRM114-Status: GOOD (  20.27  )
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
> The CCC DISEC to broadcast address is invoked with
> i3c_master_enec_disec_locked and yields error I3C_ERROR_M2 if there are
> no devices active on the bus. This is expected at the bus initialization
> stage, where it is not known yet that there are no active devices on the
> bus.
> 
> Handle inside i3c_master_enec_disec_locked the exact corner case to not
> require propagating positive Mx error codes.

Commit message has the same issues as patch 1

> 
> Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> ---
>  drivers/i3c/master.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index ce1898345810..3e465587c9c7 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -1078,6 +1078,15 @@ static int i3c_master_enec_disec_locked(struct i3c_master_controller *master,
>  	ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
>  	i3c_ccc_cmd_dest_cleanup(&dest);
>  
> +	/*
> +	 * If the addr is I3C_BROADCAST_ADDR and enable is false, the return
> +	 * error is cleared if the Mx error is I3C_ERROR_M2, to match the
> +	 * initialization state where there is no active device on the bus.
> +	 */
> +	if (ret && addr == I3C_BROADCAST_ADDR && !enable &&
> +	    cmd.err == I3C_ERROR_M2)
> +		ret = 0;

Seems a bit ugly.  Maybe it would be better to pass down a parameter
to specify caller's requirement for M2 errors e.g.

static int i3c_master_enec_disec_locked(struct i3c_master_controller *master,
					u8 addr, bool enable, u8 evts, bool suppress_m2)
...
	if (ret && suppress_m2 && cmd.err == I3C_ERROR_M2)
		ret = 0;

> +
>  	return ret;
>  }
>  
> @@ -2112,7 +2121,7 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
>  	ret = i3c_master_disec_locked(master, I3C_BROADCAST_ADDR,
>  				      I3C_CCC_EVENT_SIR | I3C_CCC_EVENT_MR |
>  				      I3C_CCC_EVENT_HJ);
> -	if (ret && ret != I3C_ERROR_M2)
> +	if (ret)
>  		goto err_bus_cleanup;
>  
>  	/*
> 


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
