Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3408EC88E53
	for <linux-i3c@archiver.kernel.org>; Tue, 15 Sep 2026 09:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=mAUvMJvyCD25b8I593gHh57CxpcFspTRPx5A2LxN3KY=; b=mCX0vE74COq522CSy/2vbQHeH7
	gaLJNxwyXkw7OoXV7jawu2SEuvPAdC5LgwcvHWtjgQ8z8ARwOJbb4CMRZYzY7QSj8kQlH/0Vjq50O
	miBggmMgj+xjy0OMbl5/zCAZq1BKZJMr1NiAdDB0Mi6sHyvBWMcVdzIaGUJ7AWLpM7AfXxox3JtWB
	6F42NySm+MoljufTYhzIi4AcSQR4N4sMy9MLY0R9Ro/eMFBT91KV4uFdod4fljm8wuPS5dVJn2o6n
	/EhgQyEE1AwZjvqajYVUpxv6G94f0cZ+LcXVFkCtcXgSrOloZeMBsJqWlWCFhBKJZsKCIMEQzsWN9
	AXZPM6vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Pah-00000005noE-3neF;
	Tue, 15 Sep 2026 09:36:39 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Pad-00000005nnI-12Mf
	for linux-i3c@lists.infradead.org;
	Tue, 15 Sep 2026 09:36:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789464995; x=1821000995;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=vNBYbIoRmk2bpyVCT65TrkyJPlXq5mwW3r7Y4OyC494=;
  b=mPT6xrRxtM4WtFJhkM6JrcsDMlKyd6cL6wG6mvjyZzLNBPhCt8h4ul6f
   iUboPBPIUsht5BsVbPvMqiq3/ruSLU1/LcS541HIBDHpx1ChHuS6Db9ye
   GVuVSbHFw8vH+faOO0s6AipDBtnpbIhfwf3tVlI57UAVYoRetcRI35CPj
   lkA62pGZ4f7JrZt7gbCVRL4KcQmUqlq5otwl1pP4yPrr82ngQePPHVhGB
   AVc+fNJ4rZDSj6Tv+kOn5pS394KVEze2fCGvCIQ24JTS7dUuAOgdQNhOk
   Ts5weS0M8ufummd+lnLyvI8ykmJQz3vyy5186OuZraIinEJqhuiYJax2K
   g==;
X-CSE-ConnectionGUID: X/JcWSTuSHG5APooM/rygw==
X-CSE-MsgGUID: yUMyeprqRAaYgJQU6cjo7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89693658"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89693658"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 02:36:34 -0700
X-CSE-ConnectionGUID: bgQE1j21R7CoPsyk2QRR1Q==
X-CSE-MsgGUID: iIHvzAgdR7mlE8WCWDflDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="311200673"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 02:36:34 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 02:36:33 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 15 Sep 2026 02:36:33 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.49) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 02:36:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eq0bv7Cvzozvlbd2WSwd7Inq2AfWKvzovxP5MR27XQ3Nt4C4JDEZLoFtGXECXyJzdr0JsJhmUzOPVqHM1YiPCYGKVodXeJNLt40RyAg5hsnhrIVr6yUvfsiYNoIHLLHXaeEGKG60aasd1BGtozoc4A+5SAFwXgcg98HXNtx9CnIHlIAo0c5IohIjN+yKowLRoKPmTAGu6RbGlyAQQwhx0M+5kglgEpOS1rG026NGgpH5Yp3C1L1LFRinh8dTQYJylqqj6o0wloxTlwVq6iyUpL7uwhAMhwu4346hYqvx3sY6bm6N+qAZoTPrrOkNdTw7X+GLiSbY+o8erjFrEJB5Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KgeO7G0RToMVJJmGBrtGZR3SjOphOTAHdX7yLkNgZxQ=;
 b=HVpP1yxewaV5711B0pMCMPkAxNKAgYoRzQENUY7/4dkHDemMnzRNtwPK2zK4e2WazNbZjaPZNvZHFQ4rJblZWF2dLEQMEamJeLXrLoOfJUHZolb40PWNTGbgfwCU8D/bsSPBy4W97m+ZC9ZetJWvMOgDe3RQeIaE2tyynHwi9bcgjmugIhsZBAJARGWrxhQZeJflpiu+Oe/U08lK9RNcOZoUeGkBQjkQ/TVExaNsMNfhbB5596rq4eFTP7s+z6mxL5Q0+mqM8xgaSePJAp5tBAdB8re+QaV2P4fMn63q8V8T7EYudf0rFTyOjlkK31DenGUjpLbLTA0E052mbgYSUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by SA2PR11MB4905.namprd11.prod.outlook.com (2603:10b6:806:117::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 09:36:22 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 09:36:21 +0000
Message-ID: <d3856e19-f063-49b7-8f63-c6df32b8e204@intel.com>
Date: Tue, 15 Sep 2026 12:36:17 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/17] i3c: mipi-i3c-hci: Process multiple IBIs per
 interrupt
To: Frank Li <Frank.li@oss.nxp.com>
CC: <alexandre.belloni@bootlin.com>, <Frank.Li@nxp.com>,
	<billy_tsai@aspeedtech.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20260914113003.183150-1-adrian.hunter@intel.com>
 <20260914113003.183150-10-adrian.hunter@intel.com>
 <aqgkovU6i2Mm2sXI@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <aqgkovU6i2Mm2sXI@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: DUZP191CA0016.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f9::15) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|SA2PR11MB4905:EE_
X-MS-Office365-Filtering-Correlation-Id: a85668aa-849b-4046-1a85-08df130ccd47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|6133799003|18002099003|22082099003|4143699003|10067099003|11063799006|56012099006|5023799004;
X-Microsoft-Antispam-Message-Info: LFMkA2IjMUSdtLgtJIrKmJSiu+60cPJhrg2EuIfbtM5eyO5b8tahSoPBhCg/p5+nR7zMHxWzRFg3JEC0L87aEEPo3arMHHBAyhSshihviQP40KRCDnEc/IYj4QMpzjiBGYbQl/PLcAK4DjDHjIQGx7GVACM86995FTOe2NeTANHCF7FgVOxWCqfQnPXS5vdCDiRcMtNFSb+I5Lv8Vmcr5JaOoQbjWJQmI010ZvW5E0dzFoQJcU8tDA90p1GYZxxm0OJJj92hYsz3yMt0jHM3IidVUzvrzkwxU4p7Mby1gefqMga5i6hmrL5Ib5lh+au3qFvQmJC+iqyqwFKAk3w5qqigv/vnYVNbefbX0xwfqQWJ2SQWAqHZCk0rxGTV2ylcVYzt5F9juro1tTkU7Fen42AjZ0eR75RdR4KQIyCcM7Q0r73Lx6lUbfjdLy/96z0UNrO1sqH4B2soLb29CcNcHiffqQ/Jt4wFO//Ewo1Q4WQ+eQ4SP36jbRzTziWF0sM4aZvyfonqoNgqYBm9CE0eLbk8zGL2YEA890a/AW/swXKbyNx0lgM3HozfLNkg8k0rbuSw7wk1YZMc0tbaf5HsVOPzK0Ug/mwdh+GOLxxLQQ0NDmTsxBJ9e6Dj2EzktW99cg8FUk/3sl5aHEbaS9Y5g2SVqskj9nu4tDx7YMDt6ls=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(6133799003)(18002099003)(22082099003)(4143699003)(10067099003)(11063799006)(56012099006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXBXeDFUMDhIYzV6TWtRd2ZpWmkvQkFLeDJZVUJOV1F0OG5pem00TTRFSmtW?=
 =?utf-8?B?NkxkVEc1K2ExSmJWOEFqR2ZlbUJTYlBQS25pR1hyU3NNT0ZPc2M0Rzcvek5N?=
 =?utf-8?B?YmlhYzkzWU9MSy9mdGhIM3AzcDNGZlN3TnlYZnM5SjRUNUdtbHcwVkZUN01k?=
 =?utf-8?B?aTQ1NlVIajBTMXltUE5VZVpuNHpOQ0t6QW02dEVYaFJ0c1llaXE2cHI2OENh?=
 =?utf-8?B?NWd1NG9qMkUvQlUvL2ZHWGlxYW9xSTBZV1RQMXlUc0NsOVE3M2gvSVZzSDRn?=
 =?utf-8?B?OVMrYWlsMjVVb0QwdzVrS3U4YisrSWJzQlpiMjRCZDIramZjTzV0VHVuRlRr?=
 =?utf-8?B?NHFuUjhQZGxXc2hnaGFuUzg3YTFqYnM1UFdUeWo2NjFWTGVyTWVkSm81WDE5?=
 =?utf-8?B?SjcweG95ekVtL255RHJ4NVg2emxCSXVRTGprb2NvNjMyNGk1azJzLzZSVENW?=
 =?utf-8?B?RVJ0MzdKUzBzaHRiUVNzSmM5OWFyUEtSZ2lXZVl2dTJVOGw0c1dMR3VEdVVK?=
 =?utf-8?B?VTVBK0h4NnluWjFPSEhuMitYYzMxc0h2SmpEeE9ESTQ2VVRkakh3VjhBdERa?=
 =?utf-8?B?cjdMaTYyYzlVTnQvTHhwdW5NYm1waFlzY0xmR29ZVGd5c0ZBTTN3OTJGcC9t?=
 =?utf-8?B?UjMvS3JQeUo3ci85NmNKWkRabTlKSUdqSEZScGJtNEVhVnhyWGlMYlNkRmt3?=
 =?utf-8?B?OVJiUk5LRjc1dmhUTnBOMHNORWJpay9ZSGxkMDk5SnV0dHY3eVBNTDlXbm9H?=
 =?utf-8?B?R1RaM3JWaTRHaG8ybUFiVkx3WER0TnNmUW40NFV3c1YrL2huMnIyVEo5VXA2?=
 =?utf-8?B?Z2VZcDlPWUZudVlZYXRkWVk5amRqSTdFRXhuVGNpT2RubGkyRVNtZFJ3VEFD?=
 =?utf-8?B?UzltSlRnUldyWWhyQllYVHlQWlpvOG51M1lkVENDa2JnbXptcEgwZEttdnFT?=
 =?utf-8?B?djQ5OC9JZjRld3JPOEtUTlhHMThGVk1YSjNNTEU2ZWNjT3dHcTZGTHBBL29X?=
 =?utf-8?B?eEpZdVY4TjZlQWJuOFRpRGZ0eXd3eG84elRMa2VRdXRyMzdESmJ0aXlOVXR0?=
 =?utf-8?B?UzlqZTB0Q015a0F6Mzh5TGd0YkttNWlSY3o5bDZzbkZOTXVRV2FyRkRvZmZl?=
 =?utf-8?B?TTBqZHY5cnJMNVREcWl0b3IzK1RuYWdPWElkSlAwdW83cjg1QkNPcmdlZHRx?=
 =?utf-8?B?dnpyOFhydnRxNmQ4SnEwa2FXK1NTSjNXRTEzQytKZE9hZmFYRDJkck45RTBi?=
 =?utf-8?B?VXg2MHNSUllibXU0cmlUNVhGNVRKT29yWlIwakdiUU50WmJEQUhDV2Q2U3d2?=
 =?utf-8?B?SjZVYWJsKzZWK3MvS2Vab0NMTmExWG9tRC9PZ2FEa2pzMFdHdjBxWlhzaGdO?=
 =?utf-8?B?ejlTdUhvbDllZjcxVlJXeXJRNFZPb3UrU0tCZFVLY1puVG9WeXQ5ZEJqODdI?=
 =?utf-8?B?NERFZVJJMVorVlpKakhtRkUzSVBmb1ZOK0xZNUVWTitkRndtUWJCbWRxRVFE?=
 =?utf-8?B?aGNtamQ4bzkxTVJxRkVxemdGUnhteHM5U2ZXb2JrckJpUzhuWmkxWStJaHJi?=
 =?utf-8?B?TXJKa1hEV1BHWFJNM05FYWptbm5pYy9rbVd0SFNtaU1DUVdxUVYrdWtBTDU3?=
 =?utf-8?B?aHE4bHl0ZlhoQk01b0RQdVdNV2ZzVmZLZW5JRVExMW41NFBnV1YxOFBGTmlt?=
 =?utf-8?B?dW03aE5sdjJlZjNRMkZXaHlqaXV2Z0w3Z29TMVdBQXZvM0JTZWdqcVNLeUNs?=
 =?utf-8?B?bXJucTkyaEd2TWFhS3A3UjdPazBhSXB1YXluTmF5WnRreEF2VkVTRFRwQXZz?=
 =?utf-8?B?eXRmdE9NaHFLcTFDNlR3MVQrTkY5SFN1NGEwVUtWRWdzNm5Db0VsVGZRNVRi?=
 =?utf-8?B?V3FhMmJ5Z0dvTmhhSURqTlNDZlR3aiswTHdNMEI3RDJPMm5sWDlCRHVUc0tJ?=
 =?utf-8?B?UXgrT3RmRmw5Ujk3U2R6aUpjY2JkbnBuRk94RFd5SGZzU205NVRjcGtnSjl2?=
 =?utf-8?B?UTkzREVzb2dmbkc1TEVvdU04R1QwQjNiZ0t2M3BpdUE2dmYxdTFiYWpQRjZG?=
 =?utf-8?B?K2tEbDRBRlJhOU5pR1VyRGxRWlhRT2k4dncvWFFoOCt2TUpJU0NyaXdpbTVv?=
 =?utf-8?B?cjhwS29CUi9iM1RZMkZSMzJHdEhuSlFCTHN1bkhUN01OV1J4dHhhOHB0YVA2?=
 =?utf-8?B?N0lxV3QyTU1wZkVvcTFXZGdIL0g5NEoyNHJBdnNmdkplYXNveFJRWkpXQXls?=
 =?utf-8?B?OU96aTRwa2N5R0tpSmJBZFVHb08rRmw1YmRlbkltUzQ2MjhNUkhGVE5SRW9S?=
 =?utf-8?B?aHZ2WGpYUXpKVEhUVGJLUHhRZWlRTks5ak9QOXVPenZ5bWEwSGErVXptVTk5?=
 =?utf-8?Q?7enhJAI9jSVvnjus=3D?=
X-Exchange-RoutingPolicyChecked: bcjrMngb5XZf7h7w14+RYuSxKwXigu3Bfg18oQ0Auh3mK7AqhcVrCynRHBXOyzX5Lk4lEqWa4P8BlWqFdfscfYicR3kGT+ucwJamHAyMdXx/RZUadYjpUj52aiqbV2fVeeGRegQpEl18B0SUblwcz+uvTwzOXnKO0X5G9bmMIP+iDOdF5N3LUz7FNkEeZIrA35Z3E2TB325kCSngetuwLRHY2c8UAdPtC/97PVl/QpaQ7XA0RwoFc+KLrFGutIErQfK6SnVhXngaEObjnA4xV2okS/nwPGDiI9EpkWaWbIQTMm199JZyzRUct1LjbZMxhd0S3epUFte4w7oYx8zdNA==
X-MS-Exchange-CrossTenant-Network-Message-Id: a85668aa-849b-4046-1a85-08df130ccd47
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 09:36:21.7092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gRPQ4p5q6/JkVUwjdGmFNtiHDsD3wmcq8v1FM+EsMXeYbv7Hnuv00/MdmHBr/8FqmgQmbNqGWAn8uxo6eDvZoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4905
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_023635_311671_2F4135C5 
X-CRM114-Status: GOOD (  22.87  )
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

On 14/09/2026 19:45, Frank Li wrote:
> On Mon, Sep 14, 2026 at 02:29:55PM +0300, Adrian Hunter wrote:
>> INTR_IBI_READY indicates that one or more IBI Status Descriptors are
>> present in the IBI ring.  After clearing interrupt status, the interrupt
>> handler processes only a single IBI even though additional IBIs may
>> already be queued.
>>
>> The controller does not reassert INTR_IBI_READY solely because entries
>> remain in the ring after interrupt status has been cleared.  Consequently,
>> the remaining IBIs are not processed until some later interrupt occurs,
>> and can accumulate if IBIs arrive more often than the interrupt handler
>> runs.
>>
>> Process all IBIs that are pending when the handler runs: capture the IBI
>> enqueue pointer up front and continue until the dequeue pointer reaches
>> that position.
>>
>> Fixes: 9ad9a52cce28 ("i3c/master: introduce the mipi-i3c-hci driver")
>> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
>> ---
>>  drivers/i3c/master/mipi-i3c-hci/dma.c | 39 +++++++++++++++++----------
>>  1 file changed, 25 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
>> index 5b195978f376..a798b0648922 100644
>> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
>> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
>> @@ -868,25 +868,24 @@ static void hci_dma_recycle_ibi_slot(struct i3c_hci *hci,
>>  	i3c_generic_ibi_recycle_slot(dev_ibi->pool, slot);
>>  }
>>
>> -static void hci_dma_process_ibi(struct i3c_hci *hci, struct hci_rh_data *rh)
>> +static bool hci_dma_process_ibi(struct i3c_hci *hci, struct hci_rh_data *rh,
>> +				u32 *op1_val, unsigned int enq_ptr)
>>  {
>>  	struct hci_rings_data *rings = hci->io_data;
>>  	struct i3c_dev_desc *dev;
>>  	struct i3c_hci_dev_data *dev_data;
>>  	struct hci_dma_dev_ibi_data *dev_ibi;
>>  	struct i3c_ibi_slot *slot;
>> -	u32 op1_val, op2_val, ibi_status_error;
>> -	unsigned int ptr, enq_ptr, deq_ptr;
>> +	u32 ibi_status_error;
>> +	unsigned int ptr, deq_ptr;
>>  	unsigned int ibi_size, ibi_chunks, ibi_data_offset, first_part;
>>  	int ibi_addr, last_ptr;
>>  	void *ring_ibi_data;
>>  	dma_addr_t ring_ibi_data_dma;
>>
>> -	op1_val = rh_reg_read(RING_OPERATION1);
>> -	deq_ptr = FIELD_GET(RING_OP1_IBI_DEQ_PTR, op1_val);
>> -
>> -	op2_val = rh_reg_read(RING_OPERATION2);
>> -	enq_ptr = FIELD_GET(RING_OP2_IBI_ENQ_PTR, op2_val);
>> +	deq_ptr = FIELD_GET(RING_OP1_IBI_DEQ_PTR, *op1_val);
>> +	if (deq_ptr == enq_ptr)
>> +		return false;
>>
>>  	ibi_status_error = 0;
>>  	ibi_addr = -1;
>> @@ -936,7 +935,7 @@ static void hci_dma_process_ibi(struct i3c_hci *hci, struct hci_rh_data *rh)
>>  		dev_dbg(&hci->master.dev,
>>  			"no LAST_STATUS available (e=%d d=%d)",
>>  			enq_ptr, deq_ptr);
>> -		return;
>> +		return false;
>>  	}
>>  	deq_ptr = last_ptr + 1;
>>  	deq_ptr %= rh->ibi_status_entries;
>> @@ -1015,10 +1014,9 @@ static void hci_dma_process_ibi(struct i3c_hci *hci, struct hci_rh_data *rh)
>>  	i3c_master_queue_ibi(dev, slot);
>>
>>  done:
>> -	op1_val = rh_reg_read(RING_OPERATION1);
>> -	op1_val &= ~RING_OP1_IBI_DEQ_PTR;
>> -	op1_val |= FIELD_PREP(RING_OP1_IBI_DEQ_PTR, deq_ptr);
>> -	rh_reg_write(RING_OPERATION1, op1_val);
>> +	*op1_val &= ~RING_OP1_IBI_DEQ_PTR;
>> +	*op1_val |= FIELD_PREP(RING_OP1_IBI_DEQ_PTR, deq_ptr);
>> +	rh_reg_write(RING_OPERATION1, *op1_val);
>>
>>  	/* update the chunk pointer */
>>  	rh->ibi_chunk_ptr += ibi_chunks;
>> @@ -1026,6 +1024,19 @@ static void hci_dma_process_ibi(struct i3c_hci *hci, struct hci_rh_data *rh)
>>
>>  	/* and tell the hardware about freed chunks */
>>  	rh_reg_write(CHUNK_CONTROL, rh_reg_read(CHUNK_CONTROL) + ibi_chunks);
>> +
>> +	return true;
>> +}
>> +
>> +static void hci_dma_drain_ibi_ring(struct i3c_hci *hci, struct hci_rh_data *rh)
>> +{
>> +	u32 op1_val = rh_reg_read(RING_OPERATION1);
>> +	u32 op2_val = rh_reg_read(RING_OPERATION2);
>> +	unsigned int enq_ptr = FIELD_GET(RING_OP2_IBI_ENQ_PTR, op2_val);
>> +
>> +	/* Loop is bounded by enq_ptr. Further IBIs will re-assert INTR_IBI_READY */
>> +	while (hci_dma_process_ibi(hci, rh, &op1_val, enq_ptr))
>> +		;
> 
> You just read once RING_OPERATION1, I think you can read in RING_OPERATION1
> loop, utils hardware not pending irqs.

I think you mean RING_OPERATION2.  That would lengthen the IRQ
handling, potentially making it unbounded under continuous IBI
traffic.  It isn't necessary because a new IBI raises a new
interrupt.  I would want to see a real use-case where it makes
any difference before trying to process even more IBIs in the
same IRQ.

> 
> And I am not sure if op2_val is always mach op1_val by two 32bit read.
> is it possible op1_value changed, when read op2_val?

op1_val cannot change between the two reads.  Every field of
RING_OPERATION1 is written by software, never by the controller,
and it is always protected by hci->lock spinlock.

RING_OP2_IBI_ENQ_PTR can advance at any time, since that is the hardware
side, read-only, updated by the Host Controller, but the two values do
not need to be a consistent snapshot.  enq_ptr is used only as a bound on
how far to dequeue.  Anything the controller enqueues after we have read
it is simply left for the next interrupt: the IBI Status Descriptor is
enqueued after we cleared INTR_STATUS, so INTR_IBI_READY is asserted
again.

> 
> A new irq status may be trigger later, but it become empty ops at irq
> handle.

Yes.  If an IBI is enqueued after INTR_STATUS was cleared but before
RING_OPERATION2 is read, it is processed here and the interrupt for it
arrives afterwards.  Then it finds nothing to do, but IRQ_HANDLED is
still returned because INTR_STATUS was non-zero, so shared interrupt
handling is unaffected.


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
