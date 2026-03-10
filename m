Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED4AFD4F19
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Mar 2026 19:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=9EjQOKAmhOXO1ftslFOSsSG3TGKZOWASF03SLCnxIMY=; b=ws53IsaiFavFTAeh9J7sI0sX0f
	jC2oQ7wlvtR3kIi7uw5P5IpxvbKciJaeUcp/0xauKbpy6KV0iIqHiVy3Xi4HtBbSkGG3iA2WGANuS
	9f4Ob+qJGj6MpkKf1nTrjGajD5P36vFtVQuul9/HiX8vsI92bec3sxlkaITyJ+eqX0U+WTaHqdev2
	9a9df+D90sChrPOhSv+Xfzik/jRvJnVLclijA4R5+QWuDxDVPImy4j35CUICwALSm1Un3OhhwbAVf
	tvaCQURIb7uR9GIUyO+JEWE5BltdFVYyBRIonLjdA2oL2PTceHFhOGG+glQRRCzpttsbWo0uVZ68S
	+N5Q2Nng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w02Xp-0000000AA2u-2NfE;
	Tue, 10 Mar 2026 19:15:05 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w02Xm-0000000AA2L-3DpT
	for linux-i3c@lists.infradead.org;
	Tue, 10 Mar 2026 19:15:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773170103; x=1804706103;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=OstLv5OZ5oEs32wUBOopH/AQvD4AjdMnjuMJvlm/4e8=;
  b=DMp3iLxU4EW15/v8u4PXdlbMpS2cf9+/dk49d0RnlfGwYjsdJlkKE0zH
   DXXFheudcpcAZxoniB+WGhbCvfFqXc/7AMZ3nHk1f5LcFcbDDCN/Jz3Si
   LFR88C7Xw4JlzflhW3yc4+OBxQJyQBvfziEMlR110/JKZdhNfG75YnHeW
   4VzEgqEXE+WNzV0e+mBdxoTqkr5gRb7sI8YKFioteHkXpUU+xLgGgkepi
   HCwPU1Vcp554C/fr0rC51u5luq7DtVBM+XNj3eMy10SK2fbGk8N3L2ic0
   bvLRhfmE+pugFnDtnfoLLcNTDHEZJjI4so3j7OeWVQnMPL16Pq+y5/rPY
   g==;
X-CSE-ConnectionGUID: auakZOXAQtGron0glUZBBQ==
X-CSE-MsgGUID: MwUn3PnTQ5mHimU4oL9VIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74419301"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="74419301"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 12:15:02 -0700
X-CSE-ConnectionGUID: W8pU+3l7TK2uXF/1OZD1lQ==
X-CSE-MsgGUID: TXQOMdXWTjSrIm5N+buUXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="220259373"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 12:15:02 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 12:15:01 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 10 Mar 2026 12:15:01 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.21) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 12:15:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fMaX++vi3hy7kWcXZyjGEiv2kQxaMU83+BOhRvvhZnced9BlxebhM2O9407f1rmVDgwovogUoHCA0TMQunfbLWRaWV0YdnQbU30X6YHxM5d9DRz16OleVClLTminLknSAOYchjApoXg+ZUtvt3XEec2XH2A4qKAARYdFx8/MJkRlrpekc/HhqpuojIuf/CWoclhTtBRLiFc3LaGpaQHwvfGKrVsCbYgp6g6Wg7LU1l9/KsRYlir7Yl/Wg4pK2kAV0gRx3epc8fJpXFiP7DCwe0oOXAKTK4gVTyApvpwrpSsFvH0BkIzuDB7pHvYtDUMro1PuRHL42tHjCG7XaMIxCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q+LZsz54vcl/PfLnapbJdCDNTOyXF3M3PjPA38pUZFE=;
 b=iI2V3KOKTlDYt+x2O2avxbvpd1e82fD3X8QkmLWszj5WGCGGhOjNCfqJEmwn+GJFbsMjRGYu3PX/4IAlaFaVdfRldnjlPeGtoabdT6+RTFudDzhTdhQwAt8vuFpsWqxbzQkYRxJMhZYRPIod0DsTw0+HZkiyUgJWz4tqaVff/bYvt/5HngSVfAiPKLQvoZ4SkCyMzfzFD9AVSg0OflZg5Gt29f6gJgGdMHmW5rbUapDmUq/KsiR8cR76SdtzLrnJDRpyFsq4357SP20kIWr+P9NS7jMahFnmSS8K0UVo6jwnYUPFiSPjyEaAyYr1d50h4UrJkOvYsUbbY3PpZlK7fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by DS4PPFE901A304F.namprd11.prod.outlook.com (2603:10b6:f:fc02::5b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 19:14:58 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 19:14:58 +0000
Message-ID: <a8bac9d0-3d7e-4d9c-8066-e030dd221153@intel.com>
Date: Tue, 10 Mar 2026 21:14:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] i3c: master: Negative error codes at send_ccc_cmd
To: Jorge Marques <jorge.marques@analog.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>,
	=?UTF-8?Q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>
CC: <linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Dan
 Carpenter" <dan.carpenter@linaro.org>, Jonathan Cameron <jic23@kernel.org>
References: <20260308-ad4062-positive-error-fix-v1-0-72d3c5290b4a@analog.com>
 <20260308-ad4062-positive-error-fix-v1-4-72d3c5290b4a@analog.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20260308-ad4062-positive-error-fix-v1-4-72d3c5290b4a@analog.com>
X-ClientProxiedBy: DUZPR01CA0320.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::16) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|DS4PPFE901A304F:EE_
X-MS-Office365-Filtering-Correlation-Id: 3538eb56-6913-4542-064f-08de7ed95223
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|56012099003|22082099003|7053199007;
X-Microsoft-Antispam-Message-Info: fgxFw9EkPACIPIzu2GbpCOOCUYYff4akA8Kr072Z/b9umWG7e3hiiPQ/N2ppgl9uV3tZQ4i7ozkyfXjXEraiv6SFS9hjij06JE+S9xDqBtxJqx3ccV/4dsKsZ44mRcdMG16s3xTzOwv81hHi4ekJZVOUzPyHPphKXES/8NrtJ6CEHR3O9+ViiQNrA5m3SdAsqKIJgBTFXWJmZy+xtZQYYt8ON1iMbhNPfYEVwhwT3qbaQNNorgtb7Fj+Y+RmhE/+oRnRoMm0sMTJNSRl/ngg0GxpyYxte0P3xGkeYPQHF1tQhGNJh6LMn12fkpM0gI3jTLYXLLgZQOIriHSnrqGCTbcywTYUaBdxoHCeOeA4XbwBi2ZurERevArarCGte6+oLSPvCd3HMokq1WgLcn9Kf8RoVEKJ5XkUaSEYmVOH5OIWoA5jorxI6PtmI4yAIC51InWERKudXbhFqql7aAivJpf2LYT7q/1Cgr9/+aG2lTUX3laFDpXiy8dCJurHvNP3EaC1yrc2QhNXbwGD8dhWlEJkWnQ5MOFaS99n2XhKyGcZGb+SDUkohfAitagsTQc11Kj8fLYCxlnmKrkHT9lnAYchXaIVE1wmUEa8ya822wzTYS5S+UnVB85POjohKBsSSAPxoLikwXeU9J6vczbxgwi3p/aXOyrVgCKqd2t/VKmPUBPXc5Fg/PrTOLk8qCfkvKH6bgOTw0wIgomOzXRn6HbZIctxq6aE5fIQ11U2bBzr9e4wNvuZwcPR278E+dJa
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(56012099003)(22082099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3lFdFlxQ29MTDViTVFramJHUitUOUdKTzhjTG9vV2F4emd4ZnN4VEJSb3pT?=
 =?utf-8?B?Mi8vcFZkVGtlRUtsdTV1bWp4eU9Gd3d6MExxOE44QXVMYlhmTU0weVdkZkdV?=
 =?utf-8?B?Z1FYMis4MVg2NWJBTTZQaVo5bk83dlJyZVVERElJRmpxd2RKR2srZVVab0py?=
 =?utf-8?B?dTFuRXdheGU4ZzhWckR1YjNGNUM3dld6YUVCa2ozcGhHQzF2V0I0VkJYM0xD?=
 =?utf-8?B?NFhrT0RFenpnaDkzdnZqek9lRlZOaXRDT2dFbDBwVWo5L0NWK1JZMHhKd0kz?=
 =?utf-8?B?eUlrMDlYK0VwUjhWWUZMUmI2L1FhYWc0TEcxQ3VwakNwK1ZKVmFXWVBMZlhL?=
 =?utf-8?B?UjFFM2dzNVlGVmlXQzZXc1R6Z2RGMi9Yczc0UWlqczdnWDJGRzB5MnRPNXJJ?=
 =?utf-8?B?V3pyelo2eWdNVWo0RHF0OTk3cWxGQlErTzlkTW1qL3c1RlQ2K0ZaNDVQbW9L?=
 =?utf-8?B?NDN3M1JFVHVONU90bGNFMWszd1lwQ2l4ZkRMbnovejBIR3dqNnR6N1JheDdG?=
 =?utf-8?B?RzJHK3JDSDBTZTJUYmpHTVBCbXBsQlk4Z2YvZTBzSEErR0hiYXZudVAzY2dZ?=
 =?utf-8?B?UDFXMEpxRGxjN3JjTFArVEJiSzlZRGRFQURraGJoRURzM1Z1ZTZoOElTVVR2?=
 =?utf-8?B?ZExkcDQzL1AxRFBaTHFtV0lycmlnMHNueEExcmwvK09MVllXK0ZtbkZKNUt3?=
 =?utf-8?B?Zm5XL0I3QUsxVk56d2VncWJPbUFXRXZ0NkVFaTJoRmpMV0wxRHJjMXBiam12?=
 =?utf-8?B?bVNxaHRBMDRUVlIzSHFkR3IrUmpPS0pmWnhmRWw3YStWS0ZHQWszMndxY0NQ?=
 =?utf-8?B?S1ExVjRXT1o2M2w2QWphekcwcDRnV0RlTmk2MXhKNXVtSHBzUXVFYmhYTFQ2?=
 =?utf-8?B?MXRZbGxncVQydC9sTnAzTXhyV1ZlTmRFcndLRVJTOWQ2dkhPc0ZOSHJueUY2?=
 =?utf-8?B?WWpUT2wrbEF1TS95Qkw0TVhjU2czeXFLU005eWZLbitZaHZLWFpDdm8xSXpQ?=
 =?utf-8?B?eVhQUmh0c0MwZFpTNzlVN292bjJZanZPOUM4cmgwcmFBclhGd3I2azQ4V2Iv?=
 =?utf-8?B?VUNsRjZLOWd5R2VBWC83T2hpbW9MTytIU3ZJQkNtaDhmTVpReEJab0dOdDlm?=
 =?utf-8?B?RkVFbUdEL0xFK2hBcEE3bkt1YmxYL2h4WmNENWJPbmxUOHpTOXJIN3MxSWhw?=
 =?utf-8?B?N0dKbnlXWElTQnYvejA3a1RJS0xWK3pNUEZpWjdrUWJQaUJmQnJ1MTN3MjRu?=
 =?utf-8?B?Mzdzeis4SkgvV1FxVGcvam1zSXRpa0NDd3RHYWF2VXRYelpacVBlUmVLajNF?=
 =?utf-8?B?Mnl6bWJJMzVWdU9vSiswWWZNMGtJY1B6Zjd1RkR3YUdmQVpnMUlybjNyK3Np?=
 =?utf-8?B?VUdGdkEyWUhWMHdYQm1XQm52dnNRMGYzWmNWeGtIdWFjQVVhZEpwYVVmL1V4?=
 =?utf-8?B?L2dyU1l3WklqVzlzVGtLMU92YjBrY1BUYmdNeFdoZ0Y0dWI2TDkvcisrU09R?=
 =?utf-8?B?YnZaT3R4bE9SZ2p3bi9nbXhJVXFwdkhXcXV0bUs3U0dFVTU3M0RUaWFNMUFt?=
 =?utf-8?B?QVg0ek5jMmczMWc1dzZXWmNQTjMzVXNQaFU3aXJvUEhqSXAvaEJXT1ZiWnRi?=
 =?utf-8?B?RlpoLy81OEtpcDUzTU4vank1MUw4Zng3SStCN2JhY1VnTllIT3NObzRJTUpr?=
 =?utf-8?B?aE9BR3pOaGl2VldEZGJzaXBZY21yb0JRL0w2bmFQSnFwb2tNNG53UUdCZE94?=
 =?utf-8?B?SC8wKzdXV3FkcjNtV0dPQmltVWtBY1RXbFRudVRUMVNsaTlCMkdPQlRLeFFY?=
 =?utf-8?B?SVd6TkoyNGdZOGxOeC9ObkZXMWxVdWF1RDA4eUlPUm1BcVlCL2VEVWhRK0Ri?=
 =?utf-8?B?MFNhR2RKREUrQmkvbmJ0QTZYU2UzMkswbUpnc3NmdXhiQ0o0RXU4VHRkb2ly?=
 =?utf-8?B?b1FyZ0hyZk9KcW43RWV1OEtTZ3FzdjFFNy9lbXhQMVpxVE9aaUNFOHlhd2tr?=
 =?utf-8?B?L2JHVEtCYUVlVEw2d29JcFkvb2lHNmkvTm93elNWRmF0Vmx6UnZIWjBNSVBn?=
 =?utf-8?B?SWtENWVFZDNYbjFvWXN2ck5EblVKbTZDSkZ0ZjBDUk9wVDRTZ21UdWdXMGpV?=
 =?utf-8?B?cDEvbS82N0Q1YjBaSjVGdDJlRE5pZDFQd2JKNnNadFlFalV4eWZwOGk3UEw2?=
 =?utf-8?B?anFSY2p2UjNvSFRXV2NFMWNiZXFXWFROWlpRaXZkeWFXeHlCdGVWOG1HM1RB?=
 =?utf-8?B?Q2puM2FZWi9oQ2s1VFhJNEs3cXBWdzRMaVZZYlY1YlhiUGc3SmVzS0I5eVlL?=
 =?utf-8?B?TWw3ZHhCeUs2K3JBOXhyT1FXK1g2a1FjMTArZ3FqU0IrRHZ4ME4yWjB4bjFV?=
 =?utf-8?Q?/pA2tUg2/dQa7R9g=3D?=
X-Exchange-RoutingPolicyChecked: uDvzJZWcpOOXM0MKSaBxGOYdlI9Ou9ca/Ws/d1rhallrKk3Wr+rK0APCXOSmjoMx6x73Ys0lWx4e+h4oTnStCwH1RujXZYFG1cIoTT2KJSVhpjDVUCD4WAsOrIwYLZli28NWvjJaBqR6/YiskN8+rVPvmTCCXsERrk2t20WasnYHR0Sj4InqQ2W+8M69VjoeE7Jo4Koa0x0/pYro4bjnzy8eAQDFLTpZXPyRzC3rdzbFvc7Xw73WPXQR8miPLXfSMJEmYP1DHe0dUyeaDDhMiijOqKjEkQY22oKP613do5TH1VJ0CM4nvsTK53BLdMDhbSK63cBzQAOIVJ8d/JebIw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3538eb56-6913-4542-064f-08de7ed95223
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 19:14:58.6251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7O9jHJ5sPfzzRsUm7R1ZN8G+MJiE4i1A87mocFWQYY/xzbUrXa42F53uzXNV/kkM1wpEfB7NOj6ER0tfZUIZQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFE901A304F
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_121502_872354_5F4FAC97 
X-CRM114-Status: GOOD (  19.88  )
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
> i3c_master_send_ccc_cmd_locked would propagate cmd->err (positive,
> Mx codes) to the ret variable, cascading down multiple methods until
> reaching methods that explicitly stated they would return 0 on success
> or negative error code. For example, the call chain:
> 
>   i3c_device_enable_ibi <- i3c_dev_enable_ibi_locked <-
>   master->ops.enable_ibi <- i3c_master_enec_locked <-
>   i3c_master_enec_disec_locked <- i3c_master_send_ccc_cmd_locked
> 
> Fix this by returning the ret value, callers can
> still read the cmd->err value if ret is negative.

You should say something about how you know that is safe
to do. e.g. although there are myriad call paths, the code
never distinguishes positive from negative error codes except
in cases where it explicitly checks for I3C_ERROR_M2 and
those have been dealt with in the preparation patches.

> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/linux-iio/aYXvT5FW0hXQwhm_@stanley.mountain/

Fixes tag?

> 
> Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> ---
>  drivers/i3c/master.c | 29 ++++++++++++-----------------
>  1 file changed, 12 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 3e465587c9c7..8459fffbdebb 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -898,11 +898,17 @@ static void i3c_ccc_cmd_init(struct i3c_ccc_cmd *cmd, bool rnw, u8 id,
>  	cmd->err = I3C_ERROR_UNKNOWN;
>  }
>  
> +/**
> + * i3c_master_send_ccc_cmd_locked() - send a CCC (Common Command Codes)
> + * @master: master used to send frames on the bus
> + * @cmd: command to send
> + *
> + * Return: 0 in case of success, or a negative error code otherwise.
> + *         I3C Mx error codes are stored in cmd->err.
> + */
>  static int i3c_master_send_ccc_cmd_locked(struct i3c_master_controller *master,
>  					  struct i3c_ccc_cmd *cmd)
>  {
> -	int ret;
> -
>  	if (!cmd || !master)
>  		return -EINVAL;
>  
> @@ -920,15 +926,7 @@ static int i3c_master_send_ccc_cmd_locked(struct i3c_master_controller *master,
>  	    !master->ops->supports_ccc_cmd(master, cmd))
>  		return -EOPNOTSUPP;
>  
> -	ret = master->ops->send_ccc_cmd(master, cmd);
> -	if (ret) {
> -		if (cmd->err != I3C_ERROR_UNKNOWN)
> -			return cmd->err;
> -
> -		return ret;
> -	}
> -
> -	return 0;
> +	return master->ops->send_ccc_cmd(master, cmd);
>  }
>  
>  static struct i2c_dev_desc *
> @@ -1101,8 +1099,7 @@ static int i3c_master_enec_disec_locked(struct i3c_master_controller *master,
>   *
>   * This function must be called with the bus lock held in write mode.
>   *
> - * Return: 0 in case of success, a positive I3C error code if the error is
> - * one of the official Mx error codes, and a negative error code otherwise.
> + * Return: 0 in case of success, or a negative error code otherwise.
>   */
>  int i3c_master_disec_locked(struct i3c_master_controller *master, u8 addr,
>  			    u8 evts)
> @@ -1122,8 +1119,7 @@ EXPORT_SYMBOL_GPL(i3c_master_disec_locked);
>   *
>   * This function must be called with the bus lock held in write mode.
>   *
> - * Return: 0 in case of success, a positive I3C error code if the error is
> - * one of the official Mx error codes, and a negative error code otherwise.
> + * Return: 0 in case of success, or a negative error code otherwise.
>   */
>  int i3c_master_enec_locked(struct i3c_master_controller *master, u8 addr,
>  			   u8 evts)
> @@ -1148,8 +1144,7 @@ EXPORT_SYMBOL_GPL(i3c_master_enec_locked);
>   *
>   * This function must be called with the bus lock held in write mode.
>   *
> - * Return: 0 in case of success, a positive I3C error code if the error is
> - * one of the official Mx error codes, and a negative error code otherwise.
> + * Return: 0 in case of success, or a negative error code otherwise.
>   */
>  int i3c_master_defslvs_locked(struct i3c_master_controller *master)
>  {
> 


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
