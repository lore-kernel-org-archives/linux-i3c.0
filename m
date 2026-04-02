Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09ED8D3941A
	for <linux-i3c@archiver.kernel.org>; Thu,  2 Apr 2026 12:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=EV9RmMfOVMUx9Ck5I+JJF479J/yjeI8S/fEf3AgO0j8=; b=rdlDcpx9aeXQYN6UunEij3YcTj
	Ds1kIKwFeiaqQ5p2+BcWHA6MVGCGva+0Pwe6JmxKQfFcpCfsjXpNATvMpG1JYDQEvvRrQAmFjSIUY
	t2ikzMjjmEORAUqW5r5YXgQGFxGcw/Hekbyy6+wqJHIDU8UuphuZK4IbqNQZX+qu7ezJtm28Pdw9Q
	E2p82ijkypNfGXTZpFCCPmf3gv7V3XKxo9wdgZpsQ1qAsEQV574zeP+aQKiTcTJCdNADwA88U8+NK
	V1zuj8SFI9LORnPmyafrRxqTVSZiPYn9oWDdwxvw82jICeMp4V60FtsaU4lB8xwnAQTcRo/PZsm6g
	D6T8fTug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8HQw-000000006eH-3935;
	Thu, 02 Apr 2026 12:46:02 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8HQu-000000006dI-0mTC
	for linux-i3c@lists.infradead.org;
	Thu, 02 Apr 2026 12:46:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775133961; x=1806669961;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=zgmwpRv1viX3NiWRS5uSGQUj+GchXNWM/f9Qyas+zCg=;
  b=KHjIZonJUqVsF/jh3n5mv+N37vjsjcdgRRloKAXvNS93lbkCFpl6S7mf
   Uu86YRytWOzv4q8O/sqERcAiO8U+CCPxOGZXxj+9VGqWu83CEHmTD5eVn
   RGabpFjxqAfkAbIzZGJvLmqNImQHmcwkXJa+9zGC01TuuytfETAjmXW1y
   ifVZZ0P+zpVbfvZ+nDFVdtWofexWjpF6ZbK1Gg55SbCKwsyNiDhHRIt5n
   7Y6eDO38Rvd/FPdHwxcCCHLPKKk2rIanjfhL8Gy+OVZB7S8D+E+9epApJ
   5DD4gqWBI5H0Or0FxVQH/yDaT5e9u4KE2fW+AwNzAoHw3cO2z7GateqhQ
   Q==;
X-CSE-ConnectionGUID: YIdqq2XKSFSjBvNoxBa7KQ==
X-CSE-MsgGUID: NgCGYX/LRl2LKUxX9JcYLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="98803078"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="98803078"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 05:45:59 -0700
X-CSE-ConnectionGUID: ljWLUSrtQB2JN6L4rhdYGg==
X-CSE-MsgGUID: MtDVGK5nQzC+kgDykwpofA==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 05:45:58 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 05:45:57 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 2 Apr 2026 05:45:57 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.8) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 05:45:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E8qaYxU0yXxz90uqSbxpN1YU/NyndHAESecEtqWoNGmrG+q6CApUSQChyhWF8mC8eWkEJhI8IruMV5vh/aQQSZV1eopVKsPShrrHozqsheS0watJKT2hG79T8xvwmoLRbN/zFn8Hb6g5r6mKJ86MM1qPq/E4J67mdGethilm7eV8knRSsCdfyRxPm3mC0yUvZ75b1bIm5V0ROkvkWk9Hp8pSqSuQ+VYZ6vua53GSRmHTMkSfXumWWMG9GAQkOJyG9+HK2ZsLZh9h3YfU/0u30XV3P3dBZB1eYGtQNkNDElnloNYcOjC+T8b4uvFlVT5jJYz83HHTnxEo8bEWw7qNKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NiL3h3KUF9Qe2TXJ4V+dc/ReBrGnBPzdk43LPxQHkYw=;
 b=HgUyF4CX6JEVpnSKLBscO8Sz/WQ9WgUJ1PVsagPli50kd+ba/oks3xB4JXIFIdP+Fou+KF1ukEJRQ05Ik9wPJh4IaNp4YqEBKx+65gZIfbMGSsDOt7W10OQWv+EXEdaLXwSIfqXutStBoqrbgxvil/FLormHRnDghNqt2a+/YRKrfierjt0Yln+B7iUXLtMJ/qpSWzX9+t60h3usdkovkNduGNDv2EfIMHLdbE7IFA70OvO2DRyqK5QmIyMXJq+5EbQN6OhKrKuhLRcPZZQPff3GIsPs6z2U+sc1NiM0xOkJU3cwEcekoPTGf5sSLt3qU1DhSW139sV+0VMxlRKQ+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by PH8PR11MB9698.namprd11.prod.outlook.com (2603:10b6:510:3a3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Thu, 2 Apr
 2026 12:45:54 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9769.015; Thu, 2 Apr 2026
 12:45:54 +0000
Message-ID: <ebff1eef-7c73-4bc4-a15d-7ed796531965@intel.com>
Date: Thu, 2 Apr 2026 15:45:49 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i3c: mipi-i3c-hci: fix IBI payload length calculation for
 final status
To: Billy Tsai <billy_tsai@aspeedtech.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Frank Li <Frank.li@nxp.com>, Nicolas Pitre
	<npitre@baylibre.com>, Boris Brezillon <boris.brezillon@collabora.com>
CC: "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260331-i3c-hci-dma-v1-1-e5cd295c44ff@aspeedtech.com>
 <ad7cd33b-3424-4532-b38e-f8f9c5ee1ad5@intel.com>
 <OSQPR06MB7252F5318D15701533E5058D8B51A@OSQPR06MB7252.apcprd06.prod.outlook.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <OSQPR06MB7252F5318D15701533E5058D8B51A@OSQPR06MB7252.apcprd06.prod.outlook.com>
X-ClientProxiedBy: DU2PR04CA0151.eurprd04.prod.outlook.com
 (2603:10a6:10:2b0::6) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|PH8PR11MB9698:EE_
X-MS-Office365-Filtering-Correlation-Id: 40c6be16-f45f-42d2-aed4-08de90b5c72e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: p52+oYgI6XQrGrYKGwM+BdGDxzxVkvLbMyl0l5yfApsAZ5NdrY9/7hqeQ0aFdPVvJma4sDwIh35reQbWlhyxDPiakOqEfo0CkC6BbQfcauCGZKXYDmEZONUknJ5L7RACetFm5zI/VdGqCR64csHgeWSX7IaoG2+OH1O8vus5ANwvlb4thXX6KJbd+YPOX0F0me2w8KBKNh1mE3QKPsEJyWI0PfuGfrnSersZTbqYirQyy7PjLKIuo08q6Fz8VrOwBCk2AjT+2iAJ/UyKZU9rZ6l4z0n6thknM71yUsPV5kJCGbQ6rdBBWlJC0lT2Esk+/bNyWDMhdSvxenskUwu7VslX4uzRSUD+p6k9Ut1t8NSjVNM6Qrd8KOmLbijbdIa6CMKxvb9lxA2J288k0gceQPKf7vq+Uq7xXokW1z15+LAAXP7ge4oHQjRt0bQ/ZksBf+zjldEEDl7oqrdFPeVjmxTgEHBCwihikauJxg6tg3Yloywf3WVoW/aa7de/bO7R8c6+tQAXQ05WyLdjTVZTe6vKzXadJ5+EALzcJETzUqDR6rGATPOJocs7LHcww1kyUrSru+l/NLDgwHNmcbkfRbXuweD3C1XUSCksbh1bgI5TOfWz4x6d10irwmqP8M60ncIM3mBUiUE+I//QtNp7BMQJoEXK/DZ3ezeVOEDQNIDvVqvj8zHOxw70gWZkpO6M+KSxPbl5jQorKeQwph+QLw+oWrESGaPpPoaALFtHgsw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2FDV0tReFV1cG1xZlJrc3NZUGcxd0N1dlNxK0thRDZjT0cwRjRXM2hPNGlK?=
 =?utf-8?B?Q213SDk0Wm1lbFRhVEs3NTJsb1RkSDU5d3FFL2ZiaFR0TnNMaVNzc2hhZ1l6?=
 =?utf-8?B?R1JPNEhnYnJiUGp4Zml1UzJWWTZaUTZOMjVCUjRwYUw5T3dZWDljdVZGSVEw?=
 =?utf-8?B?L3FzZzV4eURRQndUTzdDanRqUFVMNzlOdFlwL1RtcjNVSDU3ZElkT3Q3aXFr?=
 =?utf-8?B?cVF0cTk2TkVuUnVlY25YeGFrY3ozd1NXWTcvSEZZSWdtK1Zjamd1L0dQNUFi?=
 =?utf-8?B?RkYvTEpDbXppaWFTS1dRZWN6TU9NaDRVZmpyemtTN2Nlakx1a0FWUGhlYUlI?=
 =?utf-8?B?VTlWd3NWcGgxLzRCWnlxeTY5bStwb24yWS8zWXRYUU5OR0pqcDBlNnZnMlk5?=
 =?utf-8?B?bkdEb3FVQ2M1TW15b0h2ZEhPVGRTL1BsTWdyTThGcnhmcEI2a2x2bmVKNVRp?=
 =?utf-8?B?Nkg0L1RJWjlrNW9LSm84VG81djN5VGxseEY4bGR4MTUvemUwV2xzejQySW5S?=
 =?utf-8?B?SDFsSzZpT2JPTkNzVFRJVXI5eFBCUTJxTFFZZzdRZ2tjMFE2ek9oRFZ4SDRi?=
 =?utf-8?B?OTBXcHB3MjVqanNMUkhHT3RQbG82TCt4UWFTZVFGbkxVL1o4MkNyTVNmVE9E?=
 =?utf-8?B?NzVoRm5neWlSWngxUnA2VTE0WTUwNll0eHFEYnV3RjhwbVZtakRVWTZJMmhI?=
 =?utf-8?B?anN0cjduVldkSFR2b3pqRDJIN0pRK29aUmlZS0xDTGtvUEtXcVNBMHhTVEpN?=
 =?utf-8?B?VjlJaVZMOWRCbWlpaWtMaHRuVGxCZkZjTSs4NkFhRVpWbVhxVGZtUGRlNTJr?=
 =?utf-8?B?ajZwb0hURjFtMU1ENmpXSkN5MzJidW1sWWFPSU5SLzJFUndzWTVRcHFTMHRS?=
 =?utf-8?B?M0Q2a2QzV2hPWEwveUl2SkJhc1QwM2NJTW1GcW9iT1ZWYjUydVZncWgzd0s2?=
 =?utf-8?B?NHR2bXlob3o2U3RFQm4rWjZKbXEyelRmTGFHOWlFdWZPMEFSZndOMXYrR0Ju?=
 =?utf-8?B?Z2lPd05jOVExNjdYTVhpLzJpMnNIVFdCUEludFhmNzhnRFdXUlgrQXQ3ekF4?=
 =?utf-8?B?aG5vYWQ2K1VGWFRheXYrY2JneTFCclFRRjRSYkw4bkVvNWpGK0lKWmJneGNt?=
 =?utf-8?B?c0syS1JMN0tXVWZlakNmbmFZdG96cm9DT3pKL2dJa2YwNjk3aGNxdnFheDV2?=
 =?utf-8?B?R3M2S2V5RTcwMTIzR090YmVGM1BNQ2pGSC85alVCS2RoN3VoK29LWEFGclhZ?=
 =?utf-8?B?NVB3VXAzdjZ0YTF2U0M2cHd2eC9UY1JqMEZmbEdFTXJ4WnJIOEhHYi9oa0FT?=
 =?utf-8?B?VFBSaWdEbWg5UzN0YmxEQkptelplMGxzVnhOdEdPZWZWMkVQWnFrMXRFZnJw?=
 =?utf-8?B?UmZWRFVLdTVsNDFIY1U5VVhxQk5uaGdEQzMzdENoRldpdHVNejJBTnlud1Nx?=
 =?utf-8?B?RC9RMFhmSWx3Z2F5K2h3Y1NzZGw4MEUrcWpsTWdPUWpXZTJyYVV0clYrWm0r?=
 =?utf-8?B?RWhzaU42NDVueXF6dW1VMW1RSmxTaWhMTzBiYUJyY2V1Vm5yL2tsak9RM1Va?=
 =?utf-8?B?VDZ2eDJldEdQOVZuTVNpbW4vejZrblRQQStiSCtreEVoRlpXUkxaU1FWWE1Q?=
 =?utf-8?B?S25zWEpZSTQ5T1VCM0ZpVjNPZ0VlYWVXdXNaN0dUbEZCR0dTa2FkYlpZQlRG?=
 =?utf-8?B?ZEsybTAwMjRGdFhWRldFMXp6dGJ3VzJoOG05L3k4cTlRRW0xQWR2M1dkbUFL?=
 =?utf-8?B?dkJUa0lrU2NEWDRjK3pkd3ZzcUxwYkQrN2lRbzRhVGVva3JtMXlkL3dTRi9M?=
 =?utf-8?B?S0RFQmVPd2pRa2hFc2VVL0NraXRYM0hCT1kvN0V6bHQrMXQ1NGR3U0hiUCs1?=
 =?utf-8?B?a1V1UndNZmM3dHA1b25xRFhTdWxpSFBRN1p1NGpkZ1RMYlNUY0x1Z3FqY3VN?=
 =?utf-8?B?MzlLMFJYWnFpaXhBNE5kYzJqZlVlcEFmZHAxcVplM21LVTB5d3ZJcmI5TlBW?=
 =?utf-8?B?OW13M0hibnVwSlpkaHhVTkkrbWNmYUR6cXFRZ2ZXcnh0bmF1SUNIcThZVDBJ?=
 =?utf-8?B?dVI0QmdSWHpFWS9yc0szZGQrdy9QNS9BWXNXNVRjQXhBWDNYUU9waXZQcGNQ?=
 =?utf-8?B?VXcxckZ4bHo5TlNqeStBTXViUWdxMklpeWxwL0N1TU9PR0lHUjBtS2p6MVBK?=
 =?utf-8?B?RFpuU29Udi9BcmxmUlFLQXdHd3NQSXlXRXh6SDFPSE5VRFJSMUdIanZNdjUy?=
 =?utf-8?B?dE4zN0llMUl3ZnhLblVFbUdldWd5UnFxdVB0M29tRVViREJZOWlTOFEwOUp0?=
 =?utf-8?B?U2l5S2pFN0RmQlFiQU9sV1l1Yml6VDVhZ2h6M05lMFV4RHN6L2hTK3BjZGhQ?=
 =?utf-8?Q?GFXKJ87+cG+8wuMI=3D?=
X-Exchange-RoutingPolicyChecked: WSV705ClgYDLQ2Q7vcs9Nlc3ypc+Vat/1ibcaFXP2OY9zwDFcgBvsd8Gl7624NDFu28Mv9zmy7f5Ll56HSFnmXQ7m1Q1xnumJ8HKsdGuuaYacPrkjnrKmHBOly7MTf1YAe8ma6V8DGLrI33mr5YmL4MbuZjCY/zft9BjwgG5Z+4MxtA1yBrE0W9S3wm5kyVXjxYDtbQ/OyF1EwhLxRrjqSOKYyNs1emcjaqWLJpbbjurNUiQLOOstF7beQCNxBVf7pM1CXIvpZFeMB3mzXrLEibXMgNu6fFdVQ6V0XVuFqMutYLB69J1vwMtGQK8hrOGQm+D2vI4ZCcSAKXr7FWp4g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 40c6be16-f45f-42d2-aed4-08de90b5c72e
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 12:45:54.2352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: atHBozABpd7FQ19CO6sZ6qatebBFKmETTPH+34QmkF9rR14n2whfPtxB5KPD6z8coD+FxDQh+C4wWTrdwPfkhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9698
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_054600_309134_ADAD5931 
X-CRM114-Status: GOOD (  17.13  )
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

On 02/04/2026 11:07, Billy Tsai wrote:
> On 31/03/2026 13:27, Billy Tsai wrote:
>>> In DMA mode, the IBI status descriptor encodes the payload using
>>> CHUNKS (number of chunks) and DATA_LENGTH (valid bytes in the last
>>> chunk). All preceding chunks are implicitly full-sized.
>>>
>>> The current code accumulates full chunk sizes for non-final status
>>> descriptors, but for the final status descriptor it only adds
>>> DATA_LENGTH. This ignores the contribution of the preceding full
>>> chunks described by the same final status entry.
>>>
>>> As a result, the computed IBI payload length is truncated whenever
>>> the final status spans multiple chunks. For example, with a chunk
>>> size of 4 bytes, CHUNKS=2 and DATA_LENGTH=1 should result in a total
>>> payload size of 5 bytes, but the current code reports only 1 byte.
>>>
>>> Fix the calculation by adding the size of (CHUNKS - 1) full chunks
>>> plus DATA_LENGTH for the last chunk.
>>>
>>> Fixes: 9ad9a52cce28 ("i3c/master: introduce the mipi-i3c-hci driver")
>>> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
>>> ---
>>>  drivers/i3c/master/mipi-i3c-hci/dma.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
>>> index b903a2da1fd1..f4c76f168276 100644
>>> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
>>> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
>>> @@ -721,6 +721,7 @@ static void hci_dma_process_ibi(struct i3c_hci *hci, struct hci_rh_data *rh)
>>>               if (!(ibi_status & IBI_LAST_STATUS)) {
>>>                       ibi_size += chunks * rh->ibi_chunk_sz;
>>>               } else {
>>> +                     ibi_size += (chunks - 1) * rh->ibi_chunk_sz;
> 
>> That assumes chunks is not 0.  It would be better to
>> defend against that possibility i.e.
>>
>>                         if (chunks) {
>>                                 ibi_size += (chunks - 1) * rh->ibi_chunk_sz;
>>                                 ibi_size += FIELD_GET(IBI_DATA_LENGTH, ibi_status);
>>                         }
>>
> 
> As expected, the value should never be 0, as this is guaranteed by the hardware.

Not sure the spec. actually says that anywhere.

> 
> If we add a check for 0, it may be appropriate to include a WARN_ON message to
> indicate unexpected hardware behavior.

Please no.  If the target driver does not get the amount of data
it is expecting, then it can complain.


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
