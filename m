Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C509CD6E55
	for <linux-i3c@archiver.kernel.org>; Wed,  3 Jun 2026 09:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:To:Subject:Date:Message-ID:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=5GiPWWgB+vvZ7B10XUskFnYQjhS1xm3BG3F133dwwqw=; b=q6YvsJt3h0/h+iRg0LYo+/67xO
	BcRbDQFL+B+shhpk2Ttd4eSLgHEWPkgSP7FFulxOOiXpXb/UuEOV6zutscpIxbDvr+0Uckk3yep/z
	UKxUNh3z8sFUZf0xuamBqbl58rPxzlEIhxK4b/GRl6ITqbhYjMEhzhzq5oQclAEbx2JB3lG3qnzJP
	U0ddiKHoacus3/wMkyDvXbRLwL/8bgipWInApVsfpY809ff4NhJYDhI75yve2M2clRj0Illpf2pKq
	J1LBgEwDV9ccUG/ivyR74yuG2rPUu6aReEE2oI9MpGdQWg1QLhs7WcnRV5mpClIEOrFoByeCi6H5N
	y1KpLQpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhsp-0000000EhoN-1XUh;
	Wed, 03 Jun 2026 09:27:31 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhsm-0000000Ehnn-3GLg
	for linux-i3c@lists.infradead.org;
	Wed, 03 Jun 2026 09:27:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780478848; x=1812014848;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=BFtVPkATYeWiXTHH2WOTVSf+kOdAnXnucpVBHxY4xAs=;
  b=GY6GIgd93ypamq1Lvr//+chDOOOxhrsE5VmOsMBrfsrrmvxLvzRhD1Pr
   kfwivW+0RgDkuGtX5mEle8MnOgskinNnoDBymA9JKYr2z1eKzNHUrEkVC
   8h6zlng37NZbo1Aj3UNcbTMyoKa/iF/4y8YmUbdVZnCJ2OI0tBgRn5DIH
   kcu5Ta6NKT7Mm2X1/26M4A0NKYIHewRm6CNQ7Kc2V6PODC9Y2UpVEp3HX
   8lmqY47aT9vDjFQaLerKjuCUFGUnspITegz6bYSwJeEJNQjhyDO+b/3Wu
   mCwHX0/wuDy0+zEYFnfpF+k7XJ0xC+wK8zA19PNeMWGFWhJ7ShAYUB4rP
   Q==;
X-CSE-ConnectionGUID: tYCU6SkpRNyKrB8oR6VdZA==
X-CSE-MsgGUID: hQtAwnwbSP2wmBn6QTp/Nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81138353"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="81138353"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:27:26 -0700
X-CSE-ConnectionGUID: v5EB9Q9dQGyQpB7qrik2Dw==
X-CSE-MsgGUID: KIbWHGhsQCG5xXWnzI8hqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="274418963"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:27:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 02:27:26 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 3 Jun 2026 02:27:26 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.42)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 02:27:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nKNN0q/EJuELfhk89TVrdX8WCYpG1vhamoyZvHVLtzQCY7cbi8JVZ3C6eSZcUK4dKt+VSvSXGvnbjvH31rif0Kwcf1ndQWYgvaoau3pjQ2bID3GvFmMB0ITc96DCkuJ6fbALYaHZZpLCw/g1SfNBivRwI0we3IgCGNTY95Fs4kbHyuDseFMQ16BcX72qDpHXv+1LWu3FHeCIeG34Ko1Ok34NKfu4vqXdZbhBxT2NWBEhNW6kzLmZdEymiFcZ0fwEpXocmjatYBxKK7BLIhfOnofNm/+SU6lGicyhY5zbxC+v6iRh3e3Tm5lyde3UHn3fWO36T/xfqb2k1hT+vlebPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r1zT59pLl0AgayOmA7cYwawBFG9z1sjQA/ah8OtijFo=;
 b=ekcXsbXwK81QljBRp7+ZevNkhXQayM3EG0QGmIwAa0lzxqyrDNwBshRMEIrGpWH9DsXkcQDCaI7SsLWf9lQI/nMFXbYpVXpsakpbkVjeXLyoLTtczxYtb9OO07vscPy64g4BnXJOcoV8YdVuWwrXsiyZfAZl+17z0H0YnrKWV/HaXTFhGmAysQUDrbpSL/X3ZgSFqMCuu/fXHeARK/xWJU1IbPIiP7kA8sEwBLI3Eb15rG9dOREPjrU87P0L9gmEED+70f58HOCy87fF8tyaRevzda2LsubNHyaPG+vwSkkN4gie4viOikIHb0giK+/wPbWp8gvIhphHdUNU1fbivQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by BL4PR11MB8872.namprd11.prod.outlook.com (2603:10b6:208:5a8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 09:27:19 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.21.0071.015; Wed, 3 Jun 2026
 09:27:18 +0000
Message-ID: <36c9b61d-3022-4edc-9217-55b5f3d5dc62@intel.com>
Date: Wed, 3 Jun 2026 12:27:13 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i3c: master: dw: Report CCC M0/M2 errors and retry on
 failure
To: <tze.yee.ng@altera.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, "Adrian Ng Ho
 Yin" <adrian.ho.yin.ng@altera.com>, Felix Gu <ustc.gu@gmail.com>, Wolfram
 Sang <wsa+renesas@sang-engineering.com>, Manikanta Guntupalli
	<manikanta.guntupalli@amd.com>, Jorge Marques <jorge.marques@analog.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <5cd9bc11797c7fec92d7ef2a16d4c78963754d06.1780470927.git.tze.yee.ng@altera.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <5cd9bc11797c7fec92d7ef2a16d4c78963754d06.1780470927.git.tze.yee.ng@altera.com>
X-ClientProxiedBy: DU2PR04CA0161.eurprd04.prod.outlook.com
 (2603:10a6:10:2b0::16) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|BL4PR11MB8872:EE_
X-MS-Office365-Filtering-Correlation-Id: 87e2de18-6587-458c-27c2-08dec1524eac
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014|921020|11063799006|3023799007|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Ol3xXmOj2hagm2iUGy8vmPcdrs03D0kn0O0pjyoCUzC8guSpWj0vvVGAi9RQMHHsLGewkNdpR2HuniAxXJQ1RN/8aJn+x3s+BEJsMHRsQPPgmva+Jfj8O+nEkYLf+PnGgngvDWhBUdNr1n6apnTbO1UzNya76mMbx/PRYjHqv0s5/1uu+Nko4XN76BoRZbqk10RjKMfnElhMQp0uE97WDp+yKnLB/n3/lo9C7KNdgWO3UR11xtYwVP26e5wQQWy1juzJ8S5dQTQW8fAKEQSPTvcpyIRwGSIoXwmOgszZMlzzkkVDvk6vEnf+OdRI0Hv37N05LkCkDzYEytTWId+ThpyNh395kS0fghXpO9CRB7vlQMd5oIHM1v4IAn0Mv/zdv073J5zSFAyfHNYU2rRZRpoNZEruKN0VIdAV/m+EP2TlGxHhaCWfA5C7iiZ6BPtGVxaol+cj//CaMpgyX8KbBks+5UN+aQPwPt2xUS7G/UvfG5bQ5O75VUJg9yKQg6RUIcbU5JuoMHl9NcVfl2+KnM3LBjsRmiwo44b81LuhIyni7Z9Q47kXvmb4O+YTMo1v1ZuI4FaJxb60XiK20LcQFAYCCDb3fVZkFKCcEwobjMou0sGfwDJ02Y9yErK8H3h3QH3CpR1cURc0QbVBpd68vRGpsqmQorG/ap/E8TLpYP5goyBVelkxlmzqSgDOlzrygkFopPVbJ435UP1/0n40RHP9RNpU/yBi1WC5pPmipfs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(921020)(11063799006)(3023799007)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEFDek82N1o4Q3lIeUhuRGxjekF4ODh5Yjc2ZE10Q25EdDcwVlhZVTFwSGtB?=
 =?utf-8?B?QVMzd1JESFJyLzBnUDR4TVArM1FROVkzbklnV2ZUSFRlS28xY3Nwa2t0OGJO?=
 =?utf-8?B?TWkzd3ZZL0JvTCtORXBvbXE4MnZ5cHNyWHNPYWwrQ2g2M3V6bSs0S01BTzd6?=
 =?utf-8?B?cEpWZnNMYWhiUlVrd2dFUWxDQVc1L2RTWTZSeCsxZk9TbjZRRGFYWE5kejRl?=
 =?utf-8?B?dFdMM3JieVV1MVRZMWU0NjlsbG1nL1A2SGpyeUlhSndyWHhCRTlsZ1FKQlU4?=
 =?utf-8?B?L3JBOEZHZmk5ZnJBcVhIY2piSFJPK0d1OHNQamxmUkZQYysyZDRvQkFKUEJH?=
 =?utf-8?B?YVl5VTU0eGNxdlhJdUFkZSt3MWE4T0J3SDZraVVHaVQyN2lacm52Wm1UZGpN?=
 =?utf-8?B?bnQ0TlBSSU10S1Jyd2VIdmE1UkZwU2c2anRiRmQ3REdYY1N6QUdSUExQVFZR?=
 =?utf-8?B?V05VazdLNThVSjZLVDBuaWhzelBwY2xabHBoSXVvR2tYZE5INDBlY2ZUQ3dU?=
 =?utf-8?B?aUd6czhaNUt1emxTY2hFdldwS0h2dldoL0VNam1ZYmhVRHFTMWFvM0VCczNM?=
 =?utf-8?B?MWNhT3Y5QlJtK0hhMjVzMU5DdnBVVkFoazFIUU1JRk1KaWMzbDUyOXhrOTc4?=
 =?utf-8?B?NW1wV1Y2UTgxSDVibFRzRG05Ymk4dW10NWd6dUZhVEJNS0VJd2JZYkJGbVR3?=
 =?utf-8?B?MThYUFNUYmk4UmpsUmJIQUNRcW9lTUI5bGk4RUhKSDl3VHRlMjA1MCtGdWlr?=
 =?utf-8?B?OTBBZFo5b244akhJbDFPQTNzeUwxMHVyeDBQelRVV1lPMzY5SG5QMkdnSzVH?=
 =?utf-8?B?cU5RWFp1YkNhM0FMTFU0b3I0RDZOTTFEcWhSWHkzbkZTUWQrRkwxbzBCYXRo?=
 =?utf-8?B?eHVuL09PdXRzVTEwZ0hUdEFmWjhTZmZtTG56WFIvWE5DSWtpK3YreU9PTzM4?=
 =?utf-8?B?MC8xMmFEV1RtZkg3VDNMYTN5ejE0aEhZQ2pkTFdCT2FLcE8xb281elRkVjU0?=
 =?utf-8?B?cGZLaitSclczdU85SVhGeE5mTG5aZ0I4RUlCaWZ3U3FvaGVhY01CcXlYcEs1?=
 =?utf-8?B?MjBvbTJmTm9TZUJvOExjS3ZISzVFNi92Sng1UTFsUG1XM0JqMDdHSW84dnRU?=
 =?utf-8?B?NXNjSEQvZmNlN0taamxmY0loYVk2dTdHcks2YWhqZmxYTHJ0YmREWFJ5T05x?=
 =?utf-8?B?blZ5YS9POUpMV0h6ZzBMYWVFNjhlbFdMN2h0a2hiVTFjZWFWbUkyVDBMRGlW?=
 =?utf-8?B?Z2hkYXZLYjRDOWFZVHFXcUR4SExaRWZGYzFMb3B1Q2lZRllZbWdkUjVCenJj?=
 =?utf-8?B?elhESDJvQitIcHRoSXMzc0tadTZLN0NCYWdlZ0ZqZXNnR2NqY0V3b2xmUHdC?=
 =?utf-8?B?N0pvK25RN3J6Nit3cE5mQUFIdjcrSHpyMkhqdnZpQis5ejhPRlBZVWZlUmpE?=
 =?utf-8?B?UHEvV01nazFCVy92OE9wZ2tYMjI3amNsWThaTW9aUVUzM1VkdENxQXMxUzNl?=
 =?utf-8?B?SVNLVm5JY0JjRUIwMjhTalJqZFZMZVN5cE1TeUR3WkNtRHI1V3MzeVZZaVJF?=
 =?utf-8?B?SGV1YTZRVVJNVXo4OVcwQStNZXhsUHhKZUFUdVFXMGlOT3JFOGJjdFF6aUN3?=
 =?utf-8?B?RS92MWxwVElWTm4wNER0b3ZNNGpmOGR0enI1VU8ySHB0Mk0za3Nyb0ZOaTNu?=
 =?utf-8?B?L0grVDl1SG9uNzdmeWdoQmRZTzZ5UjZrdHU1UENLREpyZTFqdmw3c013aVZu?=
 =?utf-8?B?Zk9YWTAxOUdHcHJHam9nVml4ZXVBYlBkUytlazVNQlp0N2t4cGc3UndWaE1a?=
 =?utf-8?B?Ui9Jc3lzMVNOMGVkODJPYXNrV1JxQStoclJ4cEZyc3IvSnhMUHlwR1IrY1c2?=
 =?utf-8?B?OXhKcEt4aDA4Q01WS083V3ZKeWIxMkNjdkVldFE4d0NDdFIyQ0phUGkrTEdm?=
 =?utf-8?B?RU9EdzVFdE05eGpERnFIQUlNeklNVGlZZkZOSFo4UmR2L0s2cjArN2N0TTBR?=
 =?utf-8?B?REZ0SmhOQjB3RzFuTldOajhjVGdCcFJRSzBjbjNpMmFpTzJBR3FWYm8xR21F?=
 =?utf-8?B?a3dKbUNxVENPSkVqQUFUQldDamMzUlhGc3VhK1NtUkdYZDNVbmpQYWtuNDlv?=
 =?utf-8?B?aEoxK01pU2VCMFhlTFVIZVBlY244N2V2RU5wWklzVkFrMHhBQ2QzUk82a3Vn?=
 =?utf-8?B?aHRsbWVHdk9RazJFcklrV0J4YTV1QWRFazYwRkVGREFpNG1qNDYvZ1FEcFdR?=
 =?utf-8?B?enptOU4wV2RQVmpxdUR2ZjQ1cmdqdXdacGNvN01TRkYxeUNmb2lORXRmeGY2?=
 =?utf-8?B?MWtLODZPdVRoVU1acHZsRCtuN2VCYkp0K29nSEFBOHphbzRHWHFxeVNGOG9X?=
 =?utf-8?Q?ubWOFFPvvfHydqf0=3D?=
X-Exchange-RoutingPolicyChecked: SQwZZjrOVfD76kxQWoJMIOrR9qEmwZpxKX0mrVug1jJh66XnwoI/cxv2+Vpritgco0A60bXyx6bFOhLVUUJF6md9le/d/0OG2d9LuISsp2HshI6rQNUAjhZsJ4/6MTx6QhEDwQq97M63XZ3fPGl2E7p3AFnW4q/+ccVx02t1O1TpQHt2eAJ+x/JTpcjpqnbRXXgkhYpQ9p8xfGXZMIeB+JDvEf8ydIDzti3PXXf1elHWYylDET4WeoPrMIf+u8mjKJSJCCx55RG320T9l3O++9cdu05mHVSDAEiyEwCXgQslb+HfMb1rNo4xqze+n7zb2tU92kcpqPwYK04uqFM/RA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 87e2de18-6587-458c-27c2-08dec1524eac
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 09:27:18.6747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Vc2NouIzC+us7t0dM+CUNfW8NAJu/Vfwyake+L0FOlZPHNaC0z9qfmvSriuSNRlj+0HRC9KnlUbrZnHXi2B8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8872
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_022728_882769_3D2E9A33 
X-CRM114-Status: GOOD (  26.03  )
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

T24gMDMvMDYvMjAyNiAxMDoyNSwgdHplLnllZS5uZ0BhbHRlcmEuY29tIHdyb3RlOgo+IEZyb206
IEFkcmlhbiBOZyBIbyBZaW4gPGFkcmlhbi5oby55aW4ubmdAYWx0ZXJhLmNvbT4KPiAKPiBJbXBy
b3ZlIENDQyByZWxpYWJpbGl0eSBvbiB0aGUgRGVzaWduV2FyZSBtYXN0ZXIgYnkgcmVwb3J0aW5n
Cj4gc3RhbmRhcmQgSTNDIGVycm9yIGNvZGVzIHRvIHRoZSBjb3JlIGFuZCByZXRyeWluZyB0aGUg
Y29tbWFuZCBvbmNlCj4gd2hlbiB0aGUgZmFpbHVyZSBsb29rcyB0cmFuc2llbnQuCj4gCj4gTWFw
IGhhcmR3YXJlIHN0YXR1cyB0byBjY2MtPmVyciBhcyBmb2xsb3dzOgo+IC0gSTNDX0VSUk9SX00y
OiBJQkEgTkFDSyBvciBhZGRyZXNzIE5BQ0sKClRoYXQgc291bmRzIGxpa2UgaXQgZHVwbGljYXRl
cyBkd19pM2NfbWFzdGVyX3NldF9kZXZfbmFja19yZXRyeSgpLgoKPiAtIEkzQ19FUlJPUl9NMDog
ZnJhbWUgZXJyb3IsIG9yIGFuIGluY29tcGxldGUgR0VUL1NFVCBwYXlsb2FkIHdoZW4KPiDCoCB0
aGUgY29udHJvbGxlciByZXBvcnRzIGEgc3VjY2Vzc2Z1bCB0cmFuc2ZlciAoc2hvcnQgcmVhZCB2
cwo+IMKgIHJlcXVlc3RlZCBsZW5ndGg7IEdFVE1STCB1c2VzIEdFVF9NUkxfTUlOX0xFTiBpZiB0
aGUgYnVmZmVyIGlzCj4gwqAgbGFyZ2VyIHRoYW4gc3RydWN0IGkzY19jY2NfbXJsKQoKTmVlZCB0
byBjb25zaWRlciB3aGF0IHdvdWxkIGJlIGJldHRlciBoYW5kbGVkIGJ5IEkzQyBjb3JlLgpBbnl0
aGluZyByZWxhdGVkIHRvIHRoZSBwcm90b2NvbCwgdGhhdCBldmVyeSBjb250cm9sbGVyIGRyaXZl
cgpuZWVkcywgc2hvdWxkIGJlIGhhbmRsZWQgdGhlcmUuCgo+IAo+IE9uIGEgc3VjY2Vzc2Z1bCBH
RVQgQ0NDLCBzZXQgZGVzdHNbMF0ucGF5bG9hZC5sZW4gdG8gdGhlIG51bWJlciBvZgo+IGJ5dGVz
IGFjdHVhbGx5IHJlY2VpdmVkLgoKSXMgdGhhdCBhIGJ1ZyBmaXg/ICBNYXliZSBpdCBuZWVkcyBh
IHNlcGFyYXRlIHBhdGNoPwoKPiAKPiBSZXNldCBjY2MtPmVyciBiZWZvcmUgZWFjaCBhdHRlbXB0
LiBSZXRyeSB0aGUgQ0NDIGdldCBvciBzZXQgb25jZQo+IGlmIHRoZSB0cmFuc2ZlciBmYWlscyB3
aXRoIEkzQ19FUlJPUl9NMCBvciBJM0NfRVJST1JfTTIuCgpBZ2FpbiwgcGxlYXNlIGNvbnNpZGVy
IHdoYXQgd291bGQgYmUgYmV0dGVyIGhhbmRsZWQgaW4KZHJpdmVycy9pM2MvbWFzdGVyLmMKCj4g
Cj4gU2lnbmVkLW9mZi1ieTogQWRyaWFuIE5nIEhvIFlpbiA8YWRyaWFuLmhvLnlpbi5uZ0BhbHRl
cmEuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFR6ZSBZZWUgTmcgPHR6ZS55ZWUubmdAYWx0ZXJhLmNv
bT4KPiAtLS0KPiAgZHJpdmVycy9pM2MvbWFzdGVyL2R3LWkzYy1tYXN0ZXIuYyB8IDc5ICsrKysr
KysrKysrKysrKysrKysrKysrKysrLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNjkgaW5zZXJ0aW9u
cygrKSwgMTAgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rl
ci9kdy1pM2MtbWFzdGVyLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvZHctaTNjLW1hc3Rlci5jCj4g
aW5kZXggNjU1NjkzYTIxODdlLi44NWVhMGFmNTc3MTcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9p
M2MvbWFzdGVyL2R3LWkzYy1tYXN0ZXIuYwo+ICsrKyBiL2RyaXZlcnMvaTNjL21hc3Rlci9kdy1p
M2MtbWFzdGVyLmMKPiBAQCAtMjQzLDYgKzI0MywxMiBAQAo+ICAjZGVmaW5lIEFNRF9JM0NfT0Rf
UFBfVElNSU5HCQlCSVQoMSkKPiAgI2RlZmluZSBEV19JM0NfRElTQUJMRV9SVU5USU1FX1BNX1FV
SVJLCUJJVCgyKQo+ICAKPiArLyogTWluaW11bSBHRVRNUkwgcGF5bG9hZCAocmVhZF9sZW4gb25s
eTsgbm8gSUJJIGJ5dGUpLiAqLwo+ICsjZGVmaW5lIEdFVF9NUkxfTUlOX0xFTiAyCj4gKwo+ICsv
KiBNYXhpbXVtIG51bWJlciBvZiByZXRyaWVzIGZvciBDQ0MgY29tbWFuZHMgKi8KPiArI2RlZmlu
ZSBEV19JM0NfQ0NDX01BWF9SRVRSSUVTIDIKPiArCj4gIHN0cnVjdCBkd19pM2NfY21kIHsKPiAg
CXUzMiBjbWRfbG87Cj4gIAl1MzIgY21kX2hpOwo+IEBAIC03MDgsMTIgKzcxNCw0NyBAQCBzdGF0
aWMgdm9pZCBkd19pM2NfbWFzdGVyX2J1c19jbGVhbnVwKHN0cnVjdCBpM2NfbWFzdGVyX2NvbnRy
b2xsZXIgKm0pCj4gIAlkd19pM2NfbWFzdGVyX2Rpc2FibGUobWFzdGVyKTsKPiAgfQo+ICAKPiAr
c3RhdGljIGJvb2wgZHdfaTNjX2NjY19nZXRfbGVuX21pc21hdGNoKHU4IGNjY19pZCwgdTE2IHJl
cV9sZW4sIHUxNiByeF9sZW4pCj4gK3sKPiArCWlmIChjY2NfaWQgIT0gSTNDX0NDQ19HRVRNUkwp
Cj4gKwkJcmV0dXJuIHJ4X2xlbiA8IHJlcV9sZW47Cj4gKwo+ICsJLyoKPiArCSAqIEdFVE1STCBy
ZXR1cm5zIDIgb3IgMyBieXRlczsgY29yZSBzZXRzIHJlcV9sZW4gYWNjb3JkaW5nbHkuCj4gKwkg
KiBJZiB0aGUgYnVmZmVyIGlzIGxhcmdlciwgb25seSBlbmZvcmNlIHRoZSBtaW5pbXVtIHZhbGlk
IHNpemUuCj4gKwkgKi8KPiArCWlmIChyZXFfbGVuIDw9IHNpemVvZihzdHJ1Y3QgaTNjX2NjY19t
cmwpKQo+ICsJCXJldHVybiByeF9sZW4gPCByZXFfbGVuOwo+ICsKPiArCXJldHVybiByeF9sZW4g
PCBHRVRfTVJMX01JTl9MRU47Cj4gK30KPiArCj4gK3N0YXRpYyB2b2lkIGR3X2kzY19jY2NfbWFw
X2VycihzdHJ1Y3QgaTNjX2NjY19jbWQgKmNjYywKPiArCQkJICAgICAgIHN0cnVjdCBkd19pM2Nf
Y21kICpjbWQsCj4gKwkJCSAgICAgICBib29sIGRhdGFfbGVuX21pc21hdGNoLCBpbnQgKnJldCkK
PiArewo+ICsJdTggZXJyID0gY21kLT5lcnJvcjsKPiArCj4gKwlpZiAoZXJyID09IFJFU1BPTlNF
X0VSUk9SX0lCQV9OQUNLIHx8Cj4gKwkgICAgZXJyID09IFJFU1BPTlNFX0VSUk9SX0FERFJFU1Nf
TkFDSykgewo+ICsJCWNjYy0+ZXJyID0gSTNDX0VSUk9SX00yOwo+ICsJfSBlbHNlIGlmIChlcnIg
PT0gUkVTUE9OU0VfRVJST1JfRlJBTUUpIHsKPiArCQljY2MtPmVyciA9IEkzQ19FUlJPUl9NMDsK
PiArCX0gZWxzZSBpZiAoZGF0YV9sZW5fbWlzbWF0Y2ggJiYgZXJyID09IFJFU1BPTlNFX05PX0VS
Uk9SICYmICEqcmV0KSB7Cj4gKwkJY2NjLT5lcnIgPSBJM0NfRVJST1JfTTA7Cj4gKwkJKnJldCA9
IC1FSU87Cj4gKwl9Cj4gK30KPiArCj4gIHN0YXRpYyBpbnQgZHdfaTNjX2NjY19zZXQoc3RydWN0
IGR3X2kzY19tYXN0ZXIgKm1hc3RlciwKPiAgCQkJICBzdHJ1Y3QgaTNjX2NjY19jbWQgKmNjYykK
PiAgewo+ICAJc3RydWN0IGR3X2kzY19jbWQgKmNtZDsKPiArCWJvb2wgZGF0YV9sZW5fbWlzbWF0
Y2g7Cj4gIAlpbnQgcmV0LCBwb3MgPSAwOwo+ICAKPiArCWNjYy0+ZXJyID0gSTNDX0VSUk9SX1VO
S05PV047Cj4gKwo+ICAJaWYgKGNjYy0+aWQgJiBJM0NfQ0NDX0RJUkVDVCkgewo+ICAJCXBvcyA9
IGR3X2kzY19tYXN0ZXJfZ2V0X2FkZHJfcG9zKG1hc3RlciwgY2NjLT5kZXN0c1swXS5hZGRyKTsK
PiAgCQlpZiAocG9zIDwgMCkKPiBAQCAtNzQyLDggKzc4MywxNCBAQCBzdGF0aWMgaW50IGR3X2kz
Y19jY2Nfc2V0KHN0cnVjdCBkd19pM2NfbWFzdGVyICptYXN0ZXIsCj4gIAkJZHdfaTNjX21hc3Rl
cl9kZXF1ZXVlX3hmZXIobWFzdGVyLCB4ZmVyKTsKPiAgCj4gIAlyZXQgPSB4ZmVyLT5yZXQ7Cj4g
LQlpZiAoeGZlci0+Y21kc1swXS5lcnJvciA9PSBSRVNQT05TRV9FUlJPUl9JQkFfTkFDSykKPiAt
CQljY2MtPmVyciA9IEkzQ19FUlJPUl9NMjsKPiArCWNtZCA9ICZ4ZmVyLT5jbWRzWzBdOwo+ICsJ
LyoKPiArCSAqIFJFU1BPTlNFX1BPUlRfREFUQV9MRU4gcmVwb3J0cyBieXRlcyB0cmFuc2ZlcnJl
ZDsgb24gU0VUIENDQ3MKPiArCSAqIHRoaXMgcmVmbGVjdHMgdGhlIHdyaXRlIGNvdW50IChzdG9y
ZWQgaW4gY21kLT5yeF9sZW4pLgo+ICsJICovCj4gKwlkYXRhX2xlbl9taXNtYXRjaCA9IGNjYy0+
ZGVzdHNbMF0ucGF5bG9hZC5sZW4gJiYKPiArCQkJICAgIGNtZC0+cnhfbGVuIDwgY2NjLT5kZXN0
c1swXS5wYXlsb2FkLmxlbjsKPiArCWR3X2kzY19jY2NfbWFwX2VycihjY2MsIGNtZCwgZGF0YV9s
ZW5fbWlzbWF0Y2gsICZyZXQpOwo+ICAKPiAgCXJldHVybiByZXQ7Cj4gIH0KPiBAQCAtNzUxLDIx
ICs3OTgsMjcgQEAgc3RhdGljIGludCBkd19pM2NfY2NjX3NldChzdHJ1Y3QgZHdfaTNjX21hc3Rl
ciAqbWFzdGVyLAo+ICBzdGF0aWMgaW50IGR3X2kzY19jY2NfZ2V0KHN0cnVjdCBkd19pM2NfbWFz
dGVyICptYXN0ZXIsIHN0cnVjdCBpM2NfY2NjX2NtZCAqY2NjKQo+ICB7Cj4gIAlzdHJ1Y3QgZHdf
aTNjX2NtZCAqY21kOwo+ICsJdTE2IHJlcV9sZW47Cj4gKwlib29sIHJ4X2xlbl9taXNtYXRjaDsK
PiAgCWludCByZXQsIHBvczsKPiAgCj4gKwljY2MtPmVyciA9IEkzQ19FUlJPUl9VTktOT1dOOwo+
ICsKPiAgCXBvcyA9IGR3X2kzY19tYXN0ZXJfZ2V0X2FkZHJfcG9zKG1hc3RlciwgY2NjLT5kZXN0
c1swXS5hZGRyKTsKPiAgCWlmIChwb3MgPCAwKQo+ICAJCXJldHVybiBwb3M7Cj4gIAo+ICsJcmVx
X2xlbiA9IGNjYy0+ZGVzdHNbMF0ucGF5bG9hZC5sZW47Cj4gKwo+ICAJc3RydWN0IGR3X2kzY194
ZmVyICp4ZmVyIF9fZnJlZShrZnJlZSkgPSBkd19pM2NfbWFzdGVyX2FsbG9jX3hmZXIobWFzdGVy
LCAxKTsKPiAgCWlmICgheGZlcikKPiAgCQlyZXR1cm4gLUVOT01FTTsKPiAgCj4gIAljbWQgPSB4
ZmVyLT5jbWRzOwo+ICAJY21kLT5yeF9idWYgPSBjY2MtPmRlc3RzWzBdLnBheWxvYWQuZGF0YTsK
PiAtCWNtZC0+cnhfbGVuID0gY2NjLT5kZXN0c1swXS5wYXlsb2FkLmxlbjsKPiArCWNtZC0+cnhf
bGVuID0gcmVxX2xlbjsKPiAgCj4gLQljbWQtPmNtZF9oaSA9IENPTU1BTkRfUE9SVF9BUkdfREFU
QV9MRU4oY2NjLT5kZXN0c1swXS5wYXlsb2FkLmxlbikgfAo+ICsJY21kLT5jbWRfaGkgPSBDT01N
QU5EX1BPUlRfQVJHX0RBVEFfTEVOKHJlcV9sZW4pIHwKPiAgCQkgICAgICBDT01NQU5EX1BPUlRf
VFJBTlNGRVJfQVJHOwo+ICAKPiAgCWNtZC0+Y21kX2xvID0gQ09NTUFORF9QT1JUX1JFQURfVFJB
TlNGRVIgfAo+IEBAIC03ODAsOCArODMzLDEyIEBAIHN0YXRpYyBpbnQgZHdfaTNjX2NjY19nZXQo
c3RydWN0IGR3X2kzY19tYXN0ZXIgKm1hc3Rlciwgc3RydWN0IGkzY19jY2NfY21kICpjY2MpCj4g
IAkJZHdfaTNjX21hc3Rlcl9kZXF1ZXVlX3hmZXIobWFzdGVyLCB4ZmVyKTsKPiAgCj4gIAlyZXQg
PSB4ZmVyLT5yZXQ7Cj4gLQlpZiAoeGZlci0+Y21kc1swXS5lcnJvciA9PSBSRVNQT05TRV9FUlJP
Ul9JQkFfTkFDSykKPiAtCQljY2MtPmVyciA9IEkzQ19FUlJPUl9NMjsKPiArCWNtZCA9ICZ4ZmVy
LT5jbWRzWzBdOwo+ICsJcnhfbGVuX21pc21hdGNoID0gZHdfaTNjX2NjY19nZXRfbGVuX21pc21h
dGNoKGNjYy0+aWQsIHJlcV9sZW4sCj4gKwkJCQkJCSAgICAgIGNtZC0+cnhfbGVuKTsKPiArCWR3
X2kzY19jY2NfbWFwX2VycihjY2MsIGNtZCwgcnhfbGVuX21pc21hdGNoLCAmcmV0KTsKPiArCWlm
ICghcmV0KQo+ICsJCWNjYy0+ZGVzdHNbMF0ucGF5bG9hZC5sZW4gPSBjbWQtPnJ4X2xlbjsKPiAg
Cj4gIAlyZXR1cm4gcmV0Owo+ICB9Cj4gQEAgLTc5Niw2ICs4NTMsNyBAQCBzdGF0aWMgaW50IGR3
X2kzY19tYXN0ZXJfc2VuZF9jY2NfY21kKHN0cnVjdCBpM2NfbWFzdGVyX2NvbnRyb2xsZXIgKm0s
Cj4gIAkJCQkgICAgICBzdHJ1Y3QgaTNjX2NjY19jbWQgKmNjYykKPiAgewo+ICAJc3RydWN0IGR3
X2kzY19tYXN0ZXIgKm1hc3RlciA9IHRvX2R3X2kzY19tYXN0ZXIobSk7Cj4gKwlpbnQgcmV0cmll
cyA9IERXX0kzQ19DQ0NfTUFYX1JFVFJJRVM7Cj4gIAlpbnQgcmV0ID0gMDsKPiAgCj4gIAlpZiAo
Y2NjLT5pZCA9PSBJM0NfQ0NDX0VOVERBQSkKPiBAQCAtODE2LDEwICs4NzQsMTEgQEAgc3RhdGlj
IGludCBkd19pM2NfbWFzdGVyX3NlbmRfY2NjX2NtZChzdHJ1Y3QgaTNjX21hc3Rlcl9jb250cm9s
bGVyICptLAo+ICAJCXJldHVybiByZXQ7Cj4gIAl9Cj4gIAo+IC0JaWYgKGNjYy0+cm53KQo+IC0J
CXJldCA9IGR3X2kzY19jY2NfZ2V0KG1hc3RlciwgY2NjKTsKPiAtCWVsc2UKPiAtCQlyZXQgPSBk
d19pM2NfY2NjX3NldChtYXN0ZXIsIGNjYyk7Cj4gKwlkbyB7Cj4gKwkJcmV0ID0gY2NjLT5ybncg
PyBkd19pM2NfY2NjX2dldChtYXN0ZXIsIGNjYykKPiArCQkJCQkgICA6IGR3X2kzY19jY2Nfc2V0
KG1hc3RlciwgY2NjKTsKPiArCX0gd2hpbGUgKC0tcmV0cmllcyAmJgo+ICsJCQkgcmV0ICYmIChj
Y2MtPmVyciA9PSBJM0NfRVJST1JfTTAgfHwgY2NjLT5lcnIgPT0gSTNDX0VSUk9SX00yKSk7Cj4g
IAo+ICAJcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQobWFzdGVyLT5kZXYpOwo+ICAJcmV0dXJu
IHJldDsKCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWkzYwo=
