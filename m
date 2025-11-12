Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2043CD3445
	for <linux-i3c@archiver.kernel.org>; Wed, 12 Nov 2025 19:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=jlCBL4eezrsk1/gfaSvSCJrBwGv62xmnYFi6IyahAlY=; b=gFQqjM2uDovM5HoeS4z2qXoWif
	vwPlDKWFAOlUW5B79nZmhCDVcEhcY0nC0xJEJdPxmg/LYWof6PXlmLH5T6FbGnypf9TB6Tdx+nxSB
	Q15AbsTLKYpoP/oWA/kTgtyVSiwyR2L2efK78o/dFjy98gr4+KylwyHoXZmEuQ7idUfvEAVq9ah34
	g5H/3JFKsYJV2qeiqHuuWa+weCOY44GoKT1H6crNUWZuONjLeOT0Mk2tk2hQ4h/BHb47JyL2tI+x3
	HMPaeuvajZwpvn98VSa4iT4NkkUJRBLqd9qYloZs8tv15rnO7wY5yq2dxmuwKyTAHQiaXp+f9VIHD
	uj7Hab1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJGTC-00000009Pld-0b6w;
	Wed, 12 Nov 2025 19:25:30 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJGT9-00000009Pl7-1eTA
	for linux-i3c@lists.infradead.org;
	Wed, 12 Nov 2025 19:25:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762975528; x=1794511528;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=nuS4BLRwORZCUFQ8Q/dEv3LizmxJuXaV+IqztW9DsEM=;
  b=OQ1Y140CJDS/w8z2kSQ3DvEALebmaifr8U0DtYtk6t3GAZN+m7vlgDa/
   K0k5qdCMyZLbpLuyjE0XwqkTsWqJbCMOTsQ9TJLB4zCD1o3oRFjM5PDh1
   uLwlQGrSFv4atSlcJMobxY6MNHsL2eCHlGnKBQ1hl7A0WFbapv5UBMb7M
   lfrqi4ahB/KaG8V6A8EUxVWFDADl28QL1sr4tkadzGLzgdsbsvmknD/NU
   6l8m+TBQD8WcrOI6bcTyhI3Qu96+v8pufCKLzUPAaenEg9nTdJLPjodnX
   2OsrJ2aKUjLaxoxUVcLDOdajxcJEBeCA46zQYWbnpmnJ8Yl17nKHTQEFP
   A==;
X-CSE-ConnectionGUID: 6ULyxnMjQCSCofw8qDOvaQ==
X-CSE-MsgGUID: e/V9XrQ/Q+iWah0goDvyXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="76151281"
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; 
   d="scan'208";a="76151281"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 11:25:27 -0800
X-CSE-ConnectionGUID: DC4U7QRISX+kAEI/5QzTgQ==
X-CSE-MsgGUID: RJjQlD14Qz2yeFJatvei1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; 
   d="scan'208";a="189479922"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 11:25:27 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 11:25:25 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 11:25:25 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.10) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 11:25:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=palxam85fIRQXHm5WyK+O5eW3upSUgeZE0dli/8mHHaHx3lO1TtLEyLZj1NoOX7BNEcOijSNWoIc/68A4NoimOvvoXKfDAUk0vyXwerork8WmxzPFUeFYwVgPbmSLK1u5yqStLTMzd85Am0pca0r7M21pcmsOdG+LE0llbX3NA1d8x8YoORXL5iyh4+4juahJdPXSgsFhlHBJuZyi5XLTUGkJyZn9VQo8R3V/2bIaMVF+VFXt1gZyjlGZoPjOtFgILMYbOxuRl/nXhsJb9lt4/oqjJ2mMrMhYdejTR1GmMjOkAxtqC8L6WhwRlv3he6fDe2y4ObLVkgic/BLBDW0bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7o5Ps9jt5xXvu7QuB/NwXjxseRvwzTsLWxJhO2impSc=;
 b=PYNs0ACwZ4Gzl5Nbx9w5KDdNdLHv26PlL8YqZHd2we3ujTJGBafMl26Q3SCji8ugOl2/q+ZLhoXGc/09CwGvlY76fxO79LDiqCszNH8L+PKShDg6FDHp0RYM3hBd//xjIvpVI2oeCp2SLsXXJ3iZibf6vt20DfB5axlu4WGKdYKEFzSQfJOLmUxtadS8fkcKu+89dtlErbHAy4Xt51uZeGszEmSQzDlfKAJBXc+Vt9SZ3rPxudqlaTVAWfyLO1cPk1BAGJT/EG1Ww+B/aQuwI1x2vOFDZR2i43VTjjGk0BXBKF3Ybr0KpoClhq7XVATR0u1XTta1Wd40mXC8gq2TSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by IA1PR11MB8861.namprd11.prod.outlook.com (2603:10b6:208:59a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 19:25:18 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::eeac:69b0:1990:4905]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::eeac:69b0:1990:4905%7]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 19:25:18 +0000
Message-ID: <2c4c5eee-9228-4790-9954-07e9e9ecfcde@intel.com>
Date: Wed, 12 Nov 2025 21:25:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/13] i3c: mipi-i3c-hci-pci: Allocate a structure for
 mipi_i3c_hci_pci device information
To: Frank Li <Frank.li@nxp.com>
CC: <alexandre.belloni@bootlin.com>, <linux-i3c@lists.infradead.org>
References: <20251112100339.51726-1-adrian.hunter@intel.com>
 <20251112100339.51726-9-adrian.hunter@intel.com>
 <aRS4yBCoVJfecs4t@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <aRS4yBCoVJfecs4t@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: DUZPR01CA0353.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::16) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|IA1PR11MB8861:EE_
X-MS-Office365-Filtering-Correlation-Id: 98e2f057-c5d6-49ea-c4fc-08de222136cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N0NWWFdqbER3MUkrWEh2Yzh3V2hzVkkyY3BwaHpVbjJneDNUaFk5cjMyaDV5?=
 =?utf-8?B?bnBkdmo1NG9pZU0yVlRtSHBxQUJCeW1EUHdoMlpIOWhJZHN5Vy9tUUR2aE1Z?=
 =?utf-8?B?QW92bnExU2l0eFJqZC8xQnpYWjBxYk9aR1BBZ0s1MFBXQzIrWEltZVErMGhx?=
 =?utf-8?B?TDBVb0UxOVdXbzFvdHVPQ2Exc3NCbHY2N0VPVmZhTU1td3B3amJwME9kK1BW?=
 =?utf-8?B?YkFCTXpjWDBKbVFCTVBLSjBwdlVhNmFuZUIrRFZOOFV0OWEvMHpGMWFab2VP?=
 =?utf-8?B?cFdxRGlpbUJ1K05iNnE5U1lNOXZza2VEd1ZiRm10WERJc3VqZXRLcDVmTTBt?=
 =?utf-8?B?OFg0U3ZzOWpRaTZ0NThWRzBhZXFEYXd2NEhtdjZoQ1pGd0NzM3RBeHdIR1Rm?=
 =?utf-8?B?UWcrWFhxcUlFY0VhRm1pR1RtMUpvcXlMZ25qeXRHMjJWYlI3a1U3b2x1RDg0?=
 =?utf-8?B?VHQ0dzlaejhTeVVRbm10QlNNQ3IvYjM4V1ZTK016RXM2WTBZeEJJOHQzTUFw?=
 =?utf-8?B?MTFsSVNSZ2t5UnJyY1VZUzVGREZjK0ZiYlJtdkJXMDJObTFYU0RXU0JKYllY?=
 =?utf-8?B?eDhmVm9UaHd2MUg1OCs5UlhuN0kwaDdOcEt6TTV1VmVZYXRzQkl2aUJ6UEJG?=
 =?utf-8?B?TklHc0d0ZCtVaEN2VE14eHRIRlFHV3N0b3RVQzRWVGpIQTZRL3dVeGVjL0pO?=
 =?utf-8?B?UXNHZkJWZkpFT09ieDdFZkU3RnpXNEgxYzRpN3Q3VDlDYndrc0tyYzdCbDJu?=
 =?utf-8?B?QjJqUThpZ2htb1dtSTcvYnM0NTV4RHdobDlnUUI3TVU2QndXdW9McVFUaGNU?=
 =?utf-8?B?TnUyeUdPMHBMOHFCazA2R0NDWWRxY2FzR0NuNzV2N3ZzcTlRZE1URmhkQ1E0?=
 =?utf-8?B?cTNsNUlhdDhoRGZpamdpbXdoUTVRdmpYZG0ySU9CRWFGZVNXTDRjckhvU0VZ?=
 =?utf-8?B?a0JkUlBJd2VuZUtIblpyNjNyYXZzelBrMnBIODNWdzM2aFRTTXZPUzkxUmpm?=
 =?utf-8?B?VVpXVXE0TkZ4STR5VEFweVFjbTdnQmVEYWNkQ2NtVFhOMTV1UlRLTGYzc0x3?=
 =?utf-8?B?NGszQUNjUFp5STlCbHB4UjF0MkwzMDlKQ1hPbDhObWNzc2t1VVpqaTQ1NjYv?=
 =?utf-8?B?bXlPTlp4aEExd0c1SEFVeGNUcEN4emdzNk9xaVJoYlJKUGFhVFdMUDREV0ND?=
 =?utf-8?B?eVpJa1pYSlNnUGxIbkJLS0NxV2tsL1N1NkdNUXE3SXBOZHRuNEVUUnRWQm56?=
 =?utf-8?B?aG8valVjMGp4LzBxY2Y3UkdZNzArM3NnUEl6UkFpclhlWkhrTGI0UlVzc2k5?=
 =?utf-8?B?RnN1cStuWnE0OE01NkRPUlFBOG4zM0ZOaGdpaXRPTzFGbHN5ZTNNOHcvSGZl?=
 =?utf-8?B?TFRRbzlrT1VyKzlvUXNYU2NYSDdIK3YwR3VLZzJQa3dWU2FJMkZmbEdzd2tU?=
 =?utf-8?B?d3p3NGdmeWt4dTMweVVkc1pOVmx3cjlNTmhpclNobEZQUTFaR2FMNUV5bFZX?=
 =?utf-8?B?bytKSmVFakZ1LzltajYvd0swR1N1UkkyeDU4M0F1OTFBSytnQWMxbXdrVlMz?=
 =?utf-8?B?c1k5Yk5YK2g1S0d6UUU0Yi9vV0tYR2FVL2lwK2VWelNLNlRTZDdPUlUzUUNa?=
 =?utf-8?B?SHBtWjhXT1I5WEM5NVIzbVd3SWF5eWhubUNuMkhTbm1MaURaUVZpMUFUbkdz?=
 =?utf-8?B?NkxSOURSSDcyY1FBZHYwcUh0RFpocWh4QTYwcHdmZGt3UTRwRVBxdlRyOVZj?=
 =?utf-8?B?bVNoRG9qeHNYWTk2NWpwZk91SEhxZmNPMEU5ZndPUDFBRkM3YnVmYnNwaEs5?=
 =?utf-8?B?ZDh1L2U4ZjhaTXRBUE5KMWZpbzl2eGdUcWpEUy9tZWNXL0ZOQTc0LzJaZGdY?=
 =?utf-8?B?OGkwMXkwcGsvcUoxdW8zZGFwV1RyMGUwNTlIakFabXk0WU1FMkd5QjNxYXAw?=
 =?utf-8?B?R3BldC9aaVhVMm9XaklNRVhtdzM4NlBNWENGd1FuaERjZ0ZXangyTGdabnJu?=
 =?utf-8?B?V0dTa2MwUktBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkpNSHI3bGZFcWs3TEFWeVV3azFhNlJZRStBV0N5NzViSkpRbkNkZktLd3FP?=
 =?utf-8?B?WHBYcDdoWGZtRUt3VHc4Zk9vdldrOGwvMS9DRlEwVFBMSDZITVBrTmcrczM5?=
 =?utf-8?B?b0EyMkFhMGgzV0JiR2VRT3JRMUx2ZWJMc2hwQlJrSEtNUk5KWXlLSWE0L1NS?=
 =?utf-8?B?YmhocXBOTTBDNUVoa1U5YnAxcGMxSmR5U2h2Ris4QUV0Zk1ZODZHYmFxRTcz?=
 =?utf-8?B?TkVHNk8ybGZTaHpjZ2VrYm9lMXpaL1RQOC9vLzhmMlVybktNd3hhVEFIYUx0?=
 =?utf-8?B?M3VLcDN4SVJnak9VQWhVbld2TGRzdy9Wd3lDRE1PNXVNVkhraDZ6ZWp4MkI5?=
 =?utf-8?B?VXVxVlBOajI2QTg3U3JmS0REZnBJV0UxcGZFYzZ1MlkydEM0ZE9ENVVpNVZE?=
 =?utf-8?B?NVdiMkVtTndra200Q0FsRS9EejhSeUIvQ2dScXAxd2xtK2NWMFhXYUhodVAz?=
 =?utf-8?B?dVNhY2NnaW5tYmU0UTZnTDZlYk1VYzBCZXh1ZUNJNlNzSzd1N1lvelBuaitJ?=
 =?utf-8?B?VHhRWDZuUVYzUDg0dlVQUVhWSC9VU09rN1VyUnFQVDZ0NnVicWNST3ZRZUxY?=
 =?utf-8?B?dHZVbUFqc3BXdGNPZDhEQzZ1d3g2ckZhcHpVYWpiWDRaWER3L2UrVmY5UHhN?=
 =?utf-8?B?bm1mZ0lad1dnUEZ0ZURGVzZlT0g4OTFzQU1UbDZnR1dRd21VU1IzejNDSkI0?=
 =?utf-8?B?L2VxMEhEeVgxMjU4Mi9vbVhTaGRGcFMyQmtWdTVSZU80Y2VYNk5ONFM2YS9m?=
 =?utf-8?B?SnZacDYxTEFHb2lxSFNhczVFSlBjN29xZ3FWcm1wOEtzZ1laRFpjMVgrM21a?=
 =?utf-8?B?WjBYSVNHd1FnREtjbzNLQUdXaWJmZnl2bkdLMWY1ZUZuem1DZm9pYXdyTll4?=
 =?utf-8?B?Rll2UnJOS3hMTjZyN1VpRHg0NW9hckFYNFVLdVZvTDMrUkdRZmlINTBUczR6?=
 =?utf-8?B?OHdwekFiTlhWRHNXMVJsZk5lSEg3VGFRaUxyeWlWK1c4Uk1qY3kwdFJHSmpE?=
 =?utf-8?B?Wm02RVRHWkR4eFBWNTRwOWNmMTk3RE4vVVF6QlhzaHFMaTUwV3g1akRTTUN4?=
 =?utf-8?B?SGFSd0dINGxFRE1tYVJBZGpidVJuNGdjYlB4aTFrWUMrUFRsanlSamNDd0xw?=
 =?utf-8?B?bUN0OTZwYkJUZFRydTBKdS9nZjd3MkxhOXhDQ2prd2ZNQk5lQnp2TWhpMyt2?=
 =?utf-8?B?cFBUd3pVUlpQVTdzMDd2dldnaVhYdmt2WFhhcWpodUs0MUMwcTlDVUtUQ09r?=
 =?utf-8?B?S2RONzNEQmZTTkpKRUtKZHhvbEUzZVVKcFNNUzE0SkFkbzhsNjBQRm9aNXBx?=
 =?utf-8?B?Z3BUcG1kdEJ6dkNOanEwTmNkUDZOYnlzazR3L0hNenhpSk5ZamxsWUlCQUVZ?=
 =?utf-8?B?Z1VMNUVubzNkU2ozdm1sdEk3MGNvNHZlOEJ5Z1JRZnBoMVZDM0VEdFdYZStK?=
 =?utf-8?B?Zkw2ODZqUmd3blZXbW5MS2F4UmVONGg4cnUzOGtlRjdQMEZIZlBGVFRyMEE3?=
 =?utf-8?B?ckdnVk45c1M4ZFJ0Z3Y4VndFOXdESCt1M1F4TEVmZUVUejFhWlF3VUhBZS9j?=
 =?utf-8?B?a01yL0U5aTU4SzhQTk1jZGNmV1NZczl1ckREZzhhZU4velJvaWhncC8xdmY0?=
 =?utf-8?B?RnJ4SzNHSTlrSE52bjFMbnZlelJ2ZFYwOEJWRExUV1MxbWpQVi8zWU44YzNu?=
 =?utf-8?B?U29jUUhXOTJOMHJPSFJObDdPTndkUERyUURFVDFvVGo4RzB6c1dZTEJ3YTVx?=
 =?utf-8?B?WjFsRjNIQ3RsNXRIR3hCU21yR0hEdjVHTUh6SFg2ODVlbndKQzlSd0dLUXky?=
 =?utf-8?B?em84T1Y2aGh0cVdsdHBueEJ1Y2lxYTJNeE9zZnE3c3NPVG13RmxWTkNEd3Ur?=
 =?utf-8?B?RVYyUE1OVUxWQVNid3F1K3ZsQmYxN05DMVJiS1psbENIZCt0bERoZXRhWkMy?=
 =?utf-8?B?Nis2cDArMFBFN3hpTnQ3M0tCdUhIbFdnUTJxS3YycHlvbXlmTFM1enBjQ3dT?=
 =?utf-8?B?aXlxMlJxNnIvQ1l1YTV5THRvY25pNzdWZmE2OGRPU1RsTGhzL2hNRXEwMkt6?=
 =?utf-8?B?V2ZtZnBNTCtRaHVyTjRxY2NDMDBxRFdhY3NCU1AvdHRZbnAzamNwQW5FcHIz?=
 =?utf-8?B?dnVxczZBTFFUSTE3ajh4WEVZaUx2bzl1dUgzblNMWFMxOGJDT2tGdk84UkZx?=
 =?utf-8?B?bHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 98e2f057-c5d6-49ea-c4fc-08de222136cd
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 19:25:18.4217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: upAO6VtUe1BKLB1CKDPWkfetShUSn4Tm8ENtKwgvZOcx/ohWQaydfbGE8wMxIPwuRl2HYsW3X/iWmKC4XsTyKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8861
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_112527_500366_40F883E0 
X-CRM114-Status: GOOD (  18.27  )
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

On 12/11/2025 18:41, Frank Li wrote:
> On Wed, Nov 12, 2025 at 12:03:34PM +0200, Adrian Hunter wrote:
>> Allocate a structure for mipi_i3c_hci_pci device information, in
>> preparation for additional changes that need to store mipi_i3c_hci_pci
>> device-specific information.
>>
>> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
>> ---
>>  .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    | 29 ++++++++++++-------
>>  1 file changed, 19 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
>> index b3b6b6f43af2..9fa89af7479f 100644
>> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
>> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
>> @@ -14,6 +14,10 @@
>>  #include <linux/pci.h>
>>  #include <linux/platform_device.h>
>>
>> +struct mipi_i3c_hci_pci {
>> +	struct platform_device *pdev;
>> +};
>> +
> 
> Is it simpler by using platform_device_register_data(), pass down platform
> related information by void *data?

No, this is just a normal allocated structure for the PCI driver
(mipi_i3c_hci_pci) to put information related to the PCI device.
It is later used to store the current Latency Tolerance Reporting (LTR)
register values.

So it is not the same thing as platform_data.

> 
> Frank
>>  struct mipi_i3c_hci_pci_info {
>>  	int (*init)(struct pci_dev *pci);
>>  };
>> @@ -71,10 +75,14 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>>  				  const struct pci_device_id *id)
>>  {
>>  	const struct mipi_i3c_hci_pci_info *info;
>> -	struct platform_device *pdev;
>> +	struct mipi_i3c_hci_pci *hci;
>>  	struct resource res[2];
>>  	int dev_id, ret;
>>
>> +	hci = devm_kzalloc(&pci->dev, sizeof(*hci), GFP_KERNEL);
>> +	if (!hci)
>> +		return -ENOMEM;
>> +
>>  	ret = pcim_enable_device(pci);
>>  	if (ret)
>>  		return ret;
>> @@ -95,14 +103,14 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>>  	if (dev_id < 0)
>>  		return dev_id;
>>
>> -	pdev = platform_device_alloc("mipi-i3c-hci", dev_id);
>> -	if (!pdev)
>> +	hci->pdev = platform_device_alloc("mipi-i3c-hci", dev_id);
>> +	if (!hci->pdev)
>>  		return -ENOMEM;
>>
>> -	pdev->dev.parent = &pci->dev;
>> -	device_set_node(&pdev->dev, dev_fwnode(&pci->dev));
>> +	hci->pdev->dev.parent = &pci->dev;
>> +	device_set_node(&hci->pdev->dev, dev_fwnode(&pci->dev));
>>
>> -	ret = platform_device_add_resources(pdev, res, ARRAY_SIZE(res));
>> +	ret = platform_device_add_resources(hci->pdev, res, ARRAY_SIZE(res));
>>  	if (ret)
>>  		goto err;
>>
>> @@ -113,23 +121,24 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>>  			goto err;
>>  	}
>>
>> -	ret = platform_device_add(pdev);
>> +	ret = platform_device_add(hci->pdev);
>>  	if (ret)
>>  		goto err;
>>
>> -	pci_set_drvdata(pci, pdev);
>> +	pci_set_drvdata(pci, hci);
>>
>>  	return 0;
>>
>>  err:
>> -	platform_device_put(pdev);
>> +	platform_device_put(hci->pdev);
>>  	ida_free(&mipi_i3c_hci_pci_ida, dev_id);
>>  	return ret;
>>  }
>>
>>  static void mipi_i3c_hci_pci_remove(struct pci_dev *pci)
>>  {
>> -	struct platform_device *pdev = pci_get_drvdata(pci);
>> +	struct mipi_i3c_hci_pci *hci = pci_get_drvdata(pci);
>> +	struct platform_device *pdev = hci->pdev;
>>  	int dev_id = pdev->id;
>>
>>  	platform_device_unregister(pdev);
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
