Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B4C2D16818
	for <linux-i3c@archiver.kernel.org>; Fri,  9 Jan 2026 11:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=r26nedxf3GIJ7zNhwBRGI+0I9zBNqhP+j43iS9HtnrY=; b=JS1g6OGDdUmAJUNw5XpJYyVfF7
	EtUbnnUMN7C+r29wT4c2+WIqQMNrI4gmQW++JiioPyv+4bQZhUoEz5Wnf2Wlw1bZKGdtRp+M5BMzs
	ozcSKUNf9qRJbQpwci/DCKNvkNZbVqO8kbSvD9cHMxcd7KWTCczJLkLZrqvB9/0aXoVOWHbMGRxdY
	FP2JtthItl2Lv16qupFAzgc0gpfLDBFhVc7Y3xS7XCkAXL8E21LQM7NNRoVGFv70KhcBhbSWFIo+H
	LPDgtTqX88a2Cd0tiIhH+uSEVPoKaR0aIHzJ4Np6YRREVwFuoNo+Q2CmpT5bdD9estuHoscnZhPJd
	eYjd8TXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veAsk-00000002EfW-3Ntj;
	Fri, 09 Jan 2026 11:42:18 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veAsh-00000002Ef3-292N
	for linux-i3c@lists.infradead.org;
	Fri, 09 Jan 2026 11:42:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767958935; x=1799494935;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/6Z8AS75JAphj7jQQH54VPA6V2+CjR3/ax8Z1taI5No=;
  b=Dp2L3yufAtLzq6hJuZSdg3Zdb6bgMokr4TI+iIXw57N532SPGZSxrHC/
   2rWiGOY4XLafYGVcPBcgTrDoR01+8vq4R3fwfKLcWv9LYRsJEBxrZ7A6h
   CiAHgJoDhylRQKxB3KzieQvv4l5GUU99IdP8SmDlkTdJqwlCQVWbpT9kI
   SNygSRsA8e3WZgS/kEewUNwxQtfP+LhRtP3WE4U54tgHJCkQoGllemjWw
   LqomzBP62y3IvqNetLplzy7rW4IekT+XQKdYhB/OgYtOMBSg0M3Zz193s
   7267aCAGWaU1hepsS7VeyJzPzfwdZxY+YFHAJL0hcR1LYjJo92ZwVbPzC
   w==;
X-CSE-ConnectionGUID: DEYIQahdQBmT2z3esh24kw==
X-CSE-MsgGUID: pIes3HeLSlq0wk4U+WtMkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="68537583"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="68537583"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 03:42:14 -0800
X-CSE-ConnectionGUID: wxoJMB/ARX22gQuz/93jTw==
X-CSE-MsgGUID: bblGSRAzSquEFiWH1biGHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="208508190"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 03:42:14 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 03:42:13 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 9 Jan 2026 03:42:13 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.12) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 03:42:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nsn9Lc0s9uAxwxYCa98+aZ0zJX9VH145JJQgWUpv6LdcrYKH+uf1rsKxL5VFTsmenop7FNx8pp/7tpzI69pdzMR/b+h30uxXi6xT71HrsJv41nWZYxICZz0tZI6jVXepAhE+n79TxP+xh8MXPgyp5zGsft7kG1o78KzW8DvzFMt5aEwHxVEa1A+pauelX8KH7XccnOnXDWuanVB7SO4blTXz3STNYTmQA/tpKPEeGNRPBUeqyBe4u1Fvy/HUVYeOqCUcyUUX21wcCMmw75XrEoHGi8vL9d8IFlwRrHvoelH2Sk4l15JbVONGiFS8a/YQZa5Wc3+lv7O4oAnkux4/qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PBV1mdpt/jmyP+5PzltNbF95IoVROXZR2pnj1fFT4aI=;
 b=J4DklqzW63fo3yf5reIiW5jTNvzD5zsTAlCtI2mVrnRIZ3LDGdHVZXwYg2fgy1ai6LP/ZX6YsKPvbnxeXdBHexYr5qoZrg8eJ6E4Zf9UfC0R8z5A1DG1w6MCogQZUXxEQGS0rjqVALgo7wkY8iYA7C7A0BiDwKPB7FV80CBnnQ/shbF68vQq6iok1cHuQmpRNX8rOMd/Wl+xR+S5O0oH5tr5rgQGRbP6X1JxUmaLcOZzwXBXebk8p4aQQFujie7K7R51BpLiyLs240XXAKyQQ5qBld3x2FtqtzaNeiBadT3RceNE5EwqExoGnLkCkxk1s17AWdl03cH5e/AZeFWh9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by CH3PR11MB8494.namprd11.prod.outlook.com (2603:10b6:610:1ae::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 11:42:11 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 11:42:11 +0000
Message-ID: <c8ba6f17-9a90-4da5-ade8-f0515a69ddc1@intel.com>
Date: Fri, 9 Jan 2026 13:42:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 18/20] i3c: master: Introduce optional Runtime PM
 support
To: Frank Li <Frank.li@nxp.com>
CC: <alexandre.belloni@bootlin.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Aniket <aniketmaurya@google.com>,
	<linux-i3c@lists.infradead.org>
References: <20260108080558.21767-1-adrian.hunter@intel.com>
 <20260108080558.21767-19-adrian.hunter@intel.com>
 <aV/Ix3i4/nO54vDf@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <aV/Ix3i4/nO54vDf@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: BYAPR08CA0048.namprd08.prod.outlook.com
 (2603:10b6:a03:117::25) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|CH3PR11MB8494:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f15dd3a-ce93-4558-c0b6-08de4f7420a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aVJVMFZSZzFIWGJKZFpLa3BDY0RIOHpKOGh0T3d1a3FvV3YybnpwRGFjT0VF?=
 =?utf-8?B?NVJvdEtxZlVtSkh2eVVNZXIydEpIcG9Va0llcVBXNkh4Zm9DNXRtcjg3eXVL?=
 =?utf-8?B?NWRuRnFSd2ZrQmUwQ2FzNW9OallTMlNlaXlpM1BrRzlVUDVyZmczRlZ0MnlY?=
 =?utf-8?B?cTdZemdCNGZhQ3NmdCtucE5laU9Bc2Q3VlhRYzNsWjlsTDlaeUNVV2lhNHdU?=
 =?utf-8?B?SlFBcXdLT2F5TEt5R2Z5c3Zkc1JMY3pnYmtEMGFDOCtlS2hJNDFYYlVpK3pG?=
 =?utf-8?B?RmRrNDFZMXloc1pJTjhQYWJVNHpHSy9KdndLeVNCWEhzU0tvSVJ5RS95WjBD?=
 =?utf-8?B?S2h6RndOdEUzME9pREFlRHhXY3h6QW0zcWpxakR2YWRyRHZzZ3hEaUNjQVha?=
 =?utf-8?B?MHZadnFBUkJhKzVTYWFMWkpFVm9KRmhTYVYrMXBKUGhZZ1A1cm0ydVJQdTFw?=
 =?utf-8?B?U3hRZ3pRYWxEVXV1TitWcFAzd3MyZlNkWiswNVRXL29NQ1V4QVM1Wk1LQTg3?=
 =?utf-8?B?c2dVYStzWFFCN0lPT25Dck9aT29STklIa2RSRDdYNW43SUVBMjRTZnc2d1Fw?=
 =?utf-8?B?TVhzc1lhTEZZR2J4MDZ2Q2N0WG1EQzhvUmhISVRTRDAyL0FjUzcrVmZLM3ZQ?=
 =?utf-8?B?cGhyQjRWSGVDbi9oTmxNbk9Jc1BURWZ0Z1l0Z0RGV2Zxem1LbHNVRmh5dDkv?=
 =?utf-8?B?SEw2UVlOT2NyNysyZk1mSkw2U1QxVlNKdE9CU3Z2UDM0cGdCRkpaV2QzRm5K?=
 =?utf-8?B?cHhBYXh5VDR3Rnh4ZEVuNkxsQjltdzFJZnRYditiSkxldzh1bzdIYXBndXF1?=
 =?utf-8?B?bWlRM2paQVluNHZ0N0RlZ2xVZUNMZ3JzS3FCTmt3VjRHMldJSS9jalNRckkv?=
 =?utf-8?B?Q2U1R2RYbFp0K3Q1cERWQzczT0FqS00xa01pMXR6ZzdpS3BWaCtKb3p5WlZE?=
 =?utf-8?B?TU9pM09lVkQyM3RFMGVVUFAybnBhUUhEQklYdldFOGQ3UmFxQTN5TGxBOEI2?=
 =?utf-8?B?Wk5uQ2hsRkIvcVlMcFNlb0hVcVJ0MzNHbTJhRkhvWkhqUHZZODBSeDhtcTNp?=
 =?utf-8?B?V2tlYXZxNGJIZGVNVVUzNmRJOG44VktmZmJ6blg5ZlpWUGZwVjBIWlYvb3BP?=
 =?utf-8?B?Yjk2TTNqYTZPK1kwVGZ6b2w0VktHbDVKeXRlYXJLTW8wUGZ2QndXdS9aNkhL?=
 =?utf-8?B?N2ZEOHhjY01aNzM2dUpSVExYQngzcGdkZVBKOVR6MjliS21BRjRscnY5QlFU?=
 =?utf-8?B?WFpQZWJXNG9IbGpIUTJiZEdtWFFCdzkyaHBRV3JsNGlxdzBhTXExSStXU3ZQ?=
 =?utf-8?B?RmliM1c0RExzNlBacTVJazh0NC9haUQ2b1loV0hQZDlaSTNEVTBNWTJ2c0Zv?=
 =?utf-8?B?aGFKSXZSYzZ6KzMxbmozemwrcDNZNDFROGdPWGpPRXdSeGRlNkFQS21EODUx?=
 =?utf-8?B?R0VyVElvWlVCL295YWZnMGNaZW9kOHd0TU5iMG4vQ1VadVdsN2V6U2pGWEZz?=
 =?utf-8?B?WXc0SHJsOSthMis4Vm1NVHJmQmJIOU11Y2xaSmNQRExUd3RWKzlUZkJ2SERz?=
 =?utf-8?B?MDdlQlRVeDNJbzFyaXRlajVQZTBKU25PaUkxL0J4MUZUNnJRdmM4UmZWMFgv?=
 =?utf-8?B?bmpUSDRLM0tuZytMWGFLR1lEdnQ4MmNnclRwM1paK2kyendQdTVEUDhyQ1ZB?=
 =?utf-8?B?M2dCOU9ndUFlMHNMc25IT3FidFdBRlZob3MzMmlnT2hRVnJuZFI4c0habTRq?=
 =?utf-8?B?NzAzaWRKTlYvZFZPNnE0NHQ3ZkdKbTZqeUQvaHQ2SlZNYVhtT3VGOWxkU0lj?=
 =?utf-8?B?MUc0ZWp0V2ZieHRhR2ZsM3BLU2lwdWhJWGpiTThDSnV3c3VzTTJzUi95R0Zl?=
 =?utf-8?B?ZnZ3S04rTTYxVVg1bFdtNytaZzU1MlRZWk5Nc3VXWHlQamhNcHhaV0I3SHVP?=
 =?utf-8?B?bStiNGcyZE9lMTZ6cmRRcU5BK1FwQWt6NnRnL2FZRmo1TFhTVGFuQUJuNWdx?=
 =?utf-8?B?SUlWbUYzNTNnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWowYmlFV1hxWnhDVDFWQjh0Y3ZYWEtGM3NOL0tIQ1EyNzZzT0F4RUFEYzg0?=
 =?utf-8?B?Szdvcit2VkI4VFE5MVFkem8wVjZrK2xXbEw2T3VyTjZSM3d5TVhQbE5iVWVP?=
 =?utf-8?B?eG1MOWNEQVhJbmxvSjZyeHFIbjBxbjJ1VVhad0RTeFFmdmpEY3JPdnVtaHVR?=
 =?utf-8?B?R0VKZHk5NTVuQlBxbGZzc1Fsbk0yS1lMZDR2L2VNaUQySDExKzlhV0JzQnN1?=
 =?utf-8?B?RmNMMVZBOTRLc0xpQStvOTR5KytEa0MwRWpxQ0RIV0g3azZRaHMzK1JuS0lC?=
 =?utf-8?B?YWFwdStCTDFZbU1uak5Bc3ozZEUzU0QwS1FrUVgvTUpBTk9CVG1RSjhnWS9y?=
 =?utf-8?B?L1NQanh2MDVncTl3VWJpS0VwamhQOXZOSytnUXNVelp3eE13emhmZHNtOFR3?=
 =?utf-8?B?VnA4RDFlWGJ5WXNyZE1xNHJjYzNmSkViQ1dDSi93Nm5lZjdRcHhXTU9HSklG?=
 =?utf-8?B?QU55ejNYV05Ock5mZ3dtV1BPUzI5WmpNa2paVTUvTG5YVXVJM21MTklYNEZq?=
 =?utf-8?B?ZGluRjNmVkdXaGZML3dUdWNTUS9CdXJISkNGYWQvajhwVzgzRUVVcHc1YkJ4?=
 =?utf-8?B?SnZtblZpRkVMWU1qaDhIdFlOdGs0OUpHVy9jQ1crblg3a3FpT0d6NU1KbFRI?=
 =?utf-8?B?SG9WS2JubWNBd3BhVWlORnlFaVRtUXBzam5jMXlYcjdPYUVNckRGMythbG8z?=
 =?utf-8?B?aUdXUDh3V0FpbXlSaWR4QVFnMUI0em9VZjBIMlY0bFh3VlRMaWt0R1N1QXc5?=
 =?utf-8?B?RDBXNTFyUTIzeEI4VE5jSUxRc3NPNEJwRVB4OHJOSWtYUGVzMFI2aEk1UFBp?=
 =?utf-8?B?QVpWSHp5L0ZpU0dQQWd1TTBOU05GdkFoZkcrOE5TR3lnclFYOHBwUVEwd2lZ?=
 =?utf-8?B?NTgrQWFQVkw5cTMzT3N0ZmhsUFY1L01rSlZvYUthMWp0bDlzSWdZSWdxUHd4?=
 =?utf-8?B?L1JOek41KzZsVkZoMVFEWmpaSHJ6SWxraTd5ekNFVEF4Q3pXaTcrTSttdWw0?=
 =?utf-8?B?NUUzellvQVhVSVNWVlRvZXl2SWFGOWdRT1dSSUdiUmpmeHJ3MFArVnN5Y01D?=
 =?utf-8?B?UDRNK0lvNHdPaEN5OGRGNWEzTEJldGtmY3RKUjBIYy9UcGdtQU5PYkFvM09l?=
 =?utf-8?B?anVURERDVHR2NkhlR1FPMy9PSFdVTzlTa2VzRG5sVFF5bURWejhlZS83YkZV?=
 =?utf-8?B?NWY2L2dlYkJ2OVBXQUhtck5mVzJBUnNWSGpWbUlrOHJkRkI2L1puY3Uxbyty?=
 =?utf-8?B?K3RBaGY1WmlqQzBMWU9vNW9qZi9VTWdPVnhkMGtQb2RRei94OHhTeUJXRGh5?=
 =?utf-8?B?dWhBaWlNb1VkQ3piaWpDdnlWc2JFSS9lcEhKVktiaU5rczFTYkdObmtvTU1B?=
 =?utf-8?B?V2o2akh4anZjK3VUa3NtYm13d2FpcW5CdFo5Z1lMZ1lhYnZyZFVlYlR0eGlj?=
 =?utf-8?B?ZVBnbGpuNk81UzYzR3hheW0wUkxnazNIVzNhY09rU2JkVWw5Nmw0TU9xcGFU?=
 =?utf-8?B?RzdkMDRZbjJySVR3QUYzRERiMjZTWU5hMG54ME8vL2l4TWxzSzg4dHVOd0Nm?=
 =?utf-8?B?ZktKMTR2T1BtVDROeFkxMitXOUdGOHlRNEdTN2dmZEUwMUQ5TnhRalhwU3dw?=
 =?utf-8?B?UlNoaklENU5ONisraDNtWUd3Y1RUckNDWEZ2Z0owamNDZzkrZVlBZzd3WHZy?=
 =?utf-8?B?SW5kMytNcTBqdHd5UHF3cVRlUWtjWlc0M3B0K05BN1FPbUJKdDdDQzJtNzJI?=
 =?utf-8?B?T3ZqQnp3Rmc5NUhIN2pkaVBuY1ZqR0xUdFhybm40SDd5TjBuZUtFdjdNWjBF?=
 =?utf-8?B?Rm83QjlDMEcwRm1BbGFnbHFXdlpmVkRPUUNOMnZwNlNWQUYwRSthNUl6QmRs?=
 =?utf-8?B?QWMwalBBMElzNi9kVjZGbkduSjJRNFFVa3VDWVBTNG55ajVWeEFpSytEdzU4?=
 =?utf-8?B?a2l0N084WHMxTm0zY2lIMWxLT0NOZlFhU29sOHFVRUJ2Y09UM2FtZWZpZ3VR?=
 =?utf-8?B?cE5yd0x0NVVyMEY2MndpUTJGZy84OThwbzdJbGRKakZVSDRUeGxVVEFQbFcz?=
 =?utf-8?B?aldGZU5UZGhtMDBIdS8vS0RXUVBVTEROb3FBLzBvTGZ3VjdqTjEyVnFRMkhJ?=
 =?utf-8?B?TUVNaFNpc3dvdTN1QWNNVnRkNmxmL2pwYlhSR0t1SXRNRHNzNjA2NE5sNWRz?=
 =?utf-8?B?emF5UHVEVHMxWVltY1g5YUNYZU1UQ3NzaTVNSU9jem5LbUFJV1UwU0V6NU9W?=
 =?utf-8?B?ZjJrN01PN0REbGlnaklPMUdubC9zVzYvVVR6aWtWTCt1N3hQOWplRGd2KzZp?=
 =?utf-8?B?cGJYcmliREhhKzEwQ1N4V0Rrem5IMC82V3lZNExuc3JMMjBOTStFdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f15dd3a-ce93-4558-c0b6-08de4f7420a2
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 11:42:11.7249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DI0I8OUqo9ms1U7okEIQOad+Ql47OZJVl08ooTkW0icrT1+eDd1tciBhJTH8Y/UkQbAy/v3Kd+u5swcNJ8TFIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8494
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_034215_630409_44740C62 
X-CRM114-Status: GOOD (  21.78  )
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

On 08/01/2026 17:09, Frank Li wrote:
> On Thu, Jan 08, 2026 at 10:05:56AM +0200, Adrian Hunter wrote:
>> Master drivers currently manage Runtime PM individually, but all require
>> runtime resume for bus operations.  This can be centralized in common code.
>>
>> Add optional Runtime PM support to ensure the parent device is runtime
>> resumed before bus operations and auto-suspended afterward.
>>
>> Notably, do not call ->bus_cleanup() if runtime resume fails.  Master
>> drivers that opt-in to core runtime PM support must take that into account.
>>
>> Also provide an option to allow IBIs and hot-joins while runtime suspended.
>>
>> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
>> ---
>>
>>
>> Changes in V2:
>>
>> 	None
>>
>> 	Frank suggested dispensing with rpm_allowed.  That would be OK for
>> 	drivers that do not enable runtime PM, but the drivers that do
>> 	enable runtime PM (i.e. dw-i3c-master.c	and svc-i3c-master.c) might
>> 	be affected.  rpm_allowed can be removed when they are converted to
>> 	the new approach.
>>
>>
>>  drivers/i3c/device.c       | 46 +++++++++++++++++--
>>  drivers/i3c/internals.h    |  4 ++
>>  drivers/i3c/master.c       | 93 +++++++++++++++++++++++++++++++++++---
>>  include/linux/i3c/master.h |  4 ++
>>  4 files changed, 138 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
>> index 8a156f5ad692..101eaa77de68 100644
>> --- a/drivers/i3c/device.c
>> +++ b/drivers/i3c/device.c
>> @@ -46,10 +46,16 @@ int i3c_device_do_xfers(struct i3c_device *dev, struct i3c_xfer *xfers,
>>  			return -EINVAL;
>>  	}
>>
>> +	ret = i3c_bus_rpm_get(dev->bus);
>> +	if (ret)
>> +		return ret;
>> +
> 
> Can you similar method
> 
> commit ef8057b07c72a817537856b98d6e7493b9404eaf
> Author: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Date:   Thu Nov 13 20:33:33 2025 +0100
> 
>     PM: runtime: Wrapper macros for ACQUIRE()/ACQUIRE_ERR()
> 
>     Add wrapper macros for ACQUIRE()/ACQUIRE_ERR() and runtime PM
>     usage counter guards introduced recently: pm_runtime_active_try,
>     pm_runtime_active_auto_try, pm_runtime_active_try_enabled, and
>     pm_runtime_active_auto_try_enabled.
> 
>     The new macros should be more straightforward to use.
> 
>     For example, they can be used for rewriting a piece of code like below:
> 
>             ACQUIRE(pm_runtime_active_try, pm)(dev);
>             if ((ret = ACQUIRE_ERR(pm_runtime_active_try, &pm)))
>                     return ret;

In this case there is little benefit, and it introduces some
ugliness.

PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND() cannot be used
because the runtime pm is conditional on master->rpm_allowed.

New guard definitions could be added e.g.

  static void i3c_master_rpm(struct i3c_master_controller *master)
  {
	BUG();
  }

  DEFINE_GUARD(i3c_master_rpm_active, struct i3c_master_controller *, i3c_master_rpm(_T), i3c_master_rpm_put(_T))
  DEFINE_GUARD_COND(i3c_master_rpm_active, _auto, i3c_master_rpm_get(_T))

And then used like:

-       ret = i3c_master_rpm_get(master);
-       if (ret)
+       ACQUIRE(i3c_master_rpm_active_auto, pm)(master);
+       if ((ret = ACQUIRE_ERR(i3c_master_rpm_active_auto, &pm)))
                return ret;

But the result is ugly and there is only one place that it
simplifies the error path, and then only slightly:

 int i3c_master_do_daa(struct i3c_master_controller *master)
 {
 	int ret;
 
-	ret = i3c_master_rpm_get(master);
-	if (ret)
+	ACQUIRE(i3c_master_rpm_active_auto, pm)(master);
+	if ((ret = ACQUIRE_ERR(i3c_master_rpm_active_auto, &pm)))
 		return ret;
 
 	i3c_bus_maintenance_lock(&master->bus);
 	ret = master->ops->do_daa(master);
 	i3c_bus_maintenance_unlock(&master->bus);
 
 	if (ret)
-		goto out;
+		return ret;
 
 	i3c_bus_normaluse_lock(&master->bus);
 	i3c_master_register_new_i3c_devs(master);
 	i3c_bus_normaluse_unlock(&master->bus);
-out:
-	i3c_master_rpm_put(master);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(i3c_master_do_daa);
 
> 
> Frank
> 
>>  	i3c_bus_normaluse_lock(dev->bus);
>>  	ret = i3c_dev_do_xfers_locked(dev->desc, xfers, nxfers, mode);
>>  	i3c_bus_normaluse_unlock(dev->bus);
>>
>> +	i3c_bus_rpm_put(dev->bus);
>> +
>>  	return ret;
>>  }
>>  EXPORT_SYMBOL_GPL(i3c_device_do_xfers);
>> @@ -66,10 +72,16 @@ int i3c_device_do_setdasa(struct i3c_device *dev)
>>  {
>>  	int ret;
>>
>> +	ret = i3c_bus_rpm_get(dev->bus);
>> +	if (ret)
>> +		return ret;
>> +
>>  	i3c_bus_normaluse_lock(dev->bus);
>>  	ret = i3c_dev_setdasa_locked(dev->desc);
>>  	i3c_bus_normaluse_unlock(dev->bus);
>>
>> +	i3c_bus_rpm_put(dev->bus);
>> +
>>  	return ret;
>>  }
>>  EXPORT_SYMBOL_GPL(i3c_device_do_setdasa);
>> @@ -106,16 +118,27 @@ EXPORT_SYMBOL_GPL(i3c_device_get_info);
>>   */
>>  int i3c_device_disable_ibi(struct i3c_device *dev)
>>  {
>> -	int ret = -ENOENT;
>> +	int ret;
>> +
>> +	if (i3c_bus_rpm_ibi_allowed(dev->bus)) {
>> +		ret = i3c_bus_rpm_get(dev->bus);
>> +		if (ret)
>> +			return ret;
>> +	}
>>
>>  	i3c_bus_normaluse_lock(dev->bus);
>>  	if (dev->desc) {
>>  		mutex_lock(&dev->desc->ibi_lock);
>>  		ret = i3c_dev_disable_ibi_locked(dev->desc);
>>  		mutex_unlock(&dev->desc->ibi_lock);
>> +	} else {
>> +		ret = -ENOENT;
>>  	}
>>  	i3c_bus_normaluse_unlock(dev->bus);
>>
>> +	if (!ret || i3c_bus_rpm_ibi_allowed(dev->bus))
>> +		i3c_bus_rpm_put(dev->bus);
>> +
>>  	return ret;
>>  }
>>  EXPORT_SYMBOL_GPL(i3c_device_disable_ibi);
>> @@ -135,16 +158,25 @@ EXPORT_SYMBOL_GPL(i3c_device_disable_ibi);
>>   */
>>  int i3c_device_enable_ibi(struct i3c_device *dev)
>>  {
>> -	int ret = -ENOENT;
>> +	int ret;
>> +
>> +	ret = i3c_bus_rpm_get(dev->bus);
>> +	if (ret)
>> +		return ret;
>>
>>  	i3c_bus_normaluse_lock(dev->bus);
>>  	if (dev->desc) {
>>  		mutex_lock(&dev->desc->ibi_lock);
>>  		ret = i3c_dev_enable_ibi_locked(dev->desc);
>>  		mutex_unlock(&dev->desc->ibi_lock);
>> +	} else {
>> +		ret = -ENOENT;
>>  	}
>>  	i3c_bus_normaluse_unlock(dev->bus);
>>
>> +	if (ret || i3c_bus_rpm_ibi_allowed(dev->bus))
>> +		i3c_bus_rpm_put(dev->bus);
>> +
>>  	return ret;
>>  }
>>  EXPORT_SYMBOL_GPL(i3c_device_enable_ibi);
>> @@ -163,19 +195,27 @@ EXPORT_SYMBOL_GPL(i3c_device_enable_ibi);
>>  int i3c_device_request_ibi(struct i3c_device *dev,
>>  			   const struct i3c_ibi_setup *req)
>>  {
>> -	int ret = -ENOENT;
>> +	int ret;
>>
>>  	if (!req->handler || !req->num_slots)
>>  		return -EINVAL;
>>
>> +	ret = i3c_bus_rpm_get(dev->bus);
>> +	if (ret)
>> +		return ret;
>> +
>>  	i3c_bus_normaluse_lock(dev->bus);
>>  	if (dev->desc) {
>>  		mutex_lock(&dev->desc->ibi_lock);
>>  		ret = i3c_dev_request_ibi_locked(dev->desc, req);
>>  		mutex_unlock(&dev->desc->ibi_lock);
>> +	} else {
>> +		ret = -ENOENT;
>>  	}
>>  	i3c_bus_normaluse_unlock(dev->bus);
>>
>> +	i3c_bus_rpm_put(dev->bus);
>> +
>>  	return ret;
>>  }
>>  EXPORT_SYMBOL_GPL(i3c_device_request_ibi);
>> diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
>> index f609e5098137..0f1f3f766623 100644
>> --- a/drivers/i3c/internals.h
>> +++ b/drivers/i3c/internals.h
>> @@ -11,6 +11,10 @@
>>  #include <linux/i3c/master.h>
>>  #include <linux/io.h>
>>
>> +int __must_check i3c_bus_rpm_get(struct i3c_bus *bus);
>> +void i3c_bus_rpm_put(struct i3c_bus *bus);
>> +bool i3c_bus_rpm_ibi_allowed(struct i3c_bus *bus);
>> +
>>  void i3c_bus_normaluse_lock(struct i3c_bus *bus);
>>  void i3c_bus_normaluse_unlock(struct i3c_bus *bus);
>>
>> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
>> index ff6cbc044787..594d61edcef4 100644
>> --- a/drivers/i3c/master.c
>> +++ b/drivers/i3c/master.c
>> @@ -106,6 +106,38 @@ static struct i3c_master_controller *dev_to_i3cmaster(struct device *dev)
>>  	return container_of(dev, struct i3c_master_controller, dev);
>>  }
>>
>> +static int __must_check i3c_master_rpm_get(struct i3c_master_controller *master)
>> +{
>> +	int ret = master->rpm_allowed ? pm_runtime_resume_and_get(master->dev.parent) : 0;
>> +
>> +	if (ret < 0) {
>> +		dev_err(master->dev.parent, "runtime resume failed, error %d\n", ret);
>> +		return ret;
>> +	}
>> +	return 0;
>> +}
>> +
>> +static void i3c_master_rpm_put(struct i3c_master_controller *master)
>> +{
>> +	if (master->rpm_allowed)
>> +		pm_runtime_put_autosuspend(master->dev.parent);
>> +}
>> +
>> +int i3c_bus_rpm_get(struct i3c_bus *bus)
>> +{
>> +	return i3c_master_rpm_get(i3c_bus_to_i3c_master(bus));
>> +}
>> +
>> +void i3c_bus_rpm_put(struct i3c_bus *bus)
>> +{
>> +	i3c_master_rpm_put(i3c_bus_to_i3c_master(bus));
>> +}
>> +
>> +bool i3c_bus_rpm_ibi_allowed(struct i3c_bus *bus)
>> +{
>> +	return i3c_bus_to_i3c_master(bus)->rpm_ibi_allowed;
>> +}
>> +
>>  static const struct device_type i3c_device_type;
>>
>>  static struct i3c_bus *dev_to_i3cbus(struct device *dev)
>> @@ -611,6 +643,12 @@ static int i3c_set_hotjoin(struct i3c_master_controller *master, bool enable)
>>  	if (!master->ops->enable_hotjoin || !master->ops->disable_hotjoin)
>>  		return -EINVAL;
>>
>> +	if (enable || master->rpm_ibi_allowed) {
>> +		ret = i3c_master_rpm_get(master);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>>  	i3c_bus_normaluse_lock(&master->bus);
>>
>>  	if (enable)
>> @@ -623,6 +661,9 @@ static int i3c_set_hotjoin(struct i3c_master_controller *master, bool enable)
>>
>>  	i3c_bus_normaluse_unlock(&master->bus);
>>
>> +	if ((enable && ret) || (!enable && !ret) || master->rpm_ibi_allowed)
>> +		i3c_master_rpm_put(master);
>> +
>>  	return ret;
>>  }
>>
>> @@ -1712,18 +1753,23 @@ int i3c_master_do_daa(struct i3c_master_controller *master)
>>  {
>>  	int ret;
>>
>> +	ret = i3c_master_rpm_get(master);
>> +	if (ret)
>> +		return ret;
>> +
>>  	i3c_bus_maintenance_lock(&master->bus);
>>  	ret = master->ops->do_daa(master);
>>  	i3c_bus_maintenance_unlock(&master->bus);
>>
>>  	if (ret)
>> -		return ret;
>> +		goto out;
>>
>>  	i3c_bus_normaluse_lock(&master->bus);
>>  	i3c_master_register_new_i3c_devs(master);
>>  	i3c_bus_normaluse_unlock(&master->bus);
>> -
>> -	return 0;
>> +out:
>> +	i3c_master_rpm_put(master);
>> +	return ret;
>>  }
>>  EXPORT_SYMBOL_GPL(i3c_master_do_daa);
>>
>> @@ -2065,8 +2111,17 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
>>
>>  static void i3c_master_bus_cleanup(struct i3c_master_controller *master)
>>  {
>> -	if (master->ops->bus_cleanup)
>> -		master->ops->bus_cleanup(master);
>> +	if (master->ops->bus_cleanup) {
>> +		int ret = i3c_master_rpm_get(master);
>> +
>> +		if (ret) {
>> +			dev_err(&master->dev,
>> +				"runtime resume error: master bus_cleanup() not done\n");
>> +		} else {
>> +			master->ops->bus_cleanup(master);
>> +			i3c_master_rpm_put(master);
>> +		}
>> +	}
>>
>>  	i3c_master_detach_free_devs(master);
>>  }
>> @@ -2421,6 +2476,10 @@ static int i3c_master_i2c_adapter_xfer(struct i2c_adapter *adap,
>>  			return -EOPNOTSUPP;
>>  	}
>>
>> +	ret = i3c_master_rpm_get(master);
>> +	if (ret)
>> +		return ret;
>> +
>>  	i3c_bus_normaluse_lock(&master->bus);
>>  	dev = i3c_master_find_i2c_dev_by_addr(master, addr);
>>  	if (!dev)
>> @@ -2429,6 +2488,8 @@ static int i3c_master_i2c_adapter_xfer(struct i2c_adapter *adap,
>>  		ret = master->ops->i2c_xfers(dev, xfers, nxfers);
>>  	i3c_bus_normaluse_unlock(&master->bus);
>>
>> +	i3c_master_rpm_put(master);
>> +
>>  	return ret ? ret : nxfers;
>>  }
>>
>> @@ -2531,6 +2592,10 @@ static int i3c_i2c_notifier_call(struct notifier_block *nb, unsigned long action
>>
>>  	master = i2c_adapter_to_i3c_master(adap);
>>
>> +	ret = i3c_master_rpm_get(master);
>> +	if (ret)
>> +		return ret;
>> +
>>  	i3c_bus_maintenance_lock(&master->bus);
>>  	switch (action) {
>>  	case BUS_NOTIFY_ADD_DEVICE:
>> @@ -2544,6 +2609,8 @@ static int i3c_i2c_notifier_call(struct notifier_block *nb, unsigned long action
>>  	}
>>  	i3c_bus_maintenance_unlock(&master->bus);
>>
>> +	i3c_master_rpm_put(master);
>> +
>>  	return ret;
>>  }
>>
>> @@ -2881,6 +2948,10 @@ int i3c_master_register(struct i3c_master_controller *master,
>>  	INIT_LIST_HEAD(&master->boardinfo.i2c);
>>  	INIT_LIST_HEAD(&master->boardinfo.i3c);
>>
>> +	ret = i3c_master_rpm_get(master);
>> +	if (ret)
>> +		return ret;
>> +
>>  	device_initialize(&master->dev);
>>  	dev_set_name(&master->dev, "i3c-%d", i3cbus->id);
>>
>> @@ -2960,6 +3031,8 @@ int i3c_master_register(struct i3c_master_controller *master,
>>  	i3c_master_register_new_i3c_devs(master);
>>  	i3c_bus_normaluse_unlock(&master->bus);
>>
>> +	i3c_master_rpm_put(master);
>> +
>>  	return 0;
>>
>>  err_del_dev:
>> @@ -2969,6 +3042,7 @@ int i3c_master_register(struct i3c_master_controller *master,
>>  	i3c_master_bus_cleanup(master);
>>
>>  err_put_dev:
>> +	i3c_master_rpm_put(master);
>>  	put_device(&master->dev);
>>
>>  	return ret;
>> @@ -3114,8 +3188,15 @@ void i3c_dev_free_ibi_locked(struct i3c_dev_desc *dev)
>>  		return;
>>
>>  	if (dev->ibi->enabled) {
>> +		int ret;
>> +
>>  		dev_err(&master->dev, "Freeing IBI that is still enabled\n");
>> -		if (i3c_dev_disable_ibi_locked(dev))
>> +		ret = i3c_master_rpm_get(master);
>> +		if (!ret) {
>> +			ret = i3c_dev_disable_ibi_locked(dev);
>> +			i3c_master_rpm_put(master);
>> +		}
>> +		if (ret)
>>  			dev_err(&master->dev, "Failed to disable IBI before freeing\n");
>>  	}
>>
>> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
>> index 6225ad28f210..c1ec597f655c 100644
>> --- a/include/linux/i3c/master.h
>> +++ b/include/linux/i3c/master.h
>> @@ -504,6 +504,8 @@ struct i3c_master_controller_ops {
>>   * @secondary: true if the master is a secondary master
>>   * @init_done: true when the bus initialization is done
>>   * @hotjoin: true if the master support hotjoin
>> + * @rpm_allowed: true if Runtime PM allowed
>> + * @rpm_ibi_allowed: true if IBI and Hot-Join allowed while runtime suspended
>>   * @boardinfo.i3c: list of I3C  boardinfo objects
>>   * @boardinfo.i2c: list of I2C boardinfo objects
>>   * @boardinfo: board-level information attached to devices connected on the bus
>> @@ -527,6 +529,8 @@ struct i3c_master_controller {
>>  	unsigned int secondary : 1;
>>  	unsigned int init_done : 1;
>>  	unsigned int hotjoin: 1;
>> +	unsigned int rpm_allowed: 1;
>> +	unsigned int rpm_ibi_allowed: 1;
>>  	struct {
>>  		struct list_head i3c;
>>  		struct list_head i2c;
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
