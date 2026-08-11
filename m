Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6828EC5AC67
	for <linux-i3c@archiver.kernel.org>; Tue, 11 Aug 2026 12:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=CPSEjdpFO/5y67Zrvdp/+IVQaSL31t8Z5staJ94Df4Q=; b=R4jGJwZYEJSh6Ua2WiCkmF0Srt
	uYN0W7JKqsHFMLyMB12wlMZvnPVTEJz/H6oGbti0I/ZohObf3aIVqOwBGu3TNrq5YHOUy7zUAYrZT
	O9UsuMnlazWhfD9CZstYHSsFilHniFVu7+wN8TofDracWomlhg2M53HDRILmAiHJ0PFxNYrWhhORM
	CGhxW28/EvRUrFhOyAD9accV5G0UcdBiL/spMCGEIbtNIHyd50sNln4CWkRIj3hC5zgup0kVKE9kH
	20J8Nu2U/a3gDbWu0xiUwBvNVTHey0uWXfrw2L7w/RZz4jrLeQypoWDCjwzcFGNwWGaTk2QIghsRd
	zGdLhQJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtlct-0000000E1wa-0NOu;
	Tue, 11 Aug 2026 12:30:39 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtlcm-0000000E1ve-0LXH
	for linux-i3c@lists.infradead.org;
	Tue, 11 Aug 2026 12:30:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786451432; x=1817987432;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=XZudpw/DgTZCtjAPJYvsV72aY+mKQfnD5dHFmAAMHtI=;
  b=QGrQ+/Bu4SWVcDmT2w8Mt9773RUOm6TNpJTu8MOO5ql1E/WzsEbLooqo
   2WuoEGsDCm1EoRRpb2ZlX9DquDbAoGkjsus4cV4Y656iFb0p0PZ1h12wb
   NfCZSKyMx/TPGx5y4bnfePQpIGj3YTWQ2e8YreJFRDPdm5iuCZkUy1lVv
   mAPCVMKPqOo9UICrKNRyFskSNQK8vdDwa26FzRJXvGHsGKBaO4hXa2RcN
   2k9I7tQfEMHe8lOjRiPueR5UlLKsy6VCoPyOZ+wK57MfEAqOBq9i/Lpot
   RVv56yJanMkYbYkTD+D3gzVFY59OYrveEsfmNhhluoJD+YyOfyvNPqv1A
   w==;
X-CSE-ConnectionGUID: bcvb5FdkRg2vIC/89vv1aQ==
X-CSE-MsgGUID: d/zoyuRpTiCoukPTpQNwlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="87057625"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="87057625"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 05:23:32 -0700
X-CSE-ConnectionGUID: YE/PGQwUTAOvxwmUikfmkw==
X-CSE-MsgGUID: jLdwUWlKSymuA1fo/bglgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="288033608"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 05:23:32 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 05:23:32 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 11 Aug 2026 05:23:32 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.54) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 05:23:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QDBTDKtWTpKyeeR+YtwUCArqOvf4SHlWVJUmO1/g75VjyPpT4EyN4xZHIPgnc+gpyUYAEDi9Wqs+vQM5AisNeC2vg9CYqyM4IvLjMbp0PCaBa0wiBwj+on5T/UxLLIn7arCFkCDXDj1++Eg9tQTVJHBZmtKUalsBpLuHEYaoopPcTTuFiVUFnyxEJ4JPWIfAzaNYLi87C7yRXJLjD1Vkc4RD3+0sO9eX2gv1+k4ovitZIojC5n9usievQplNctjASbF3/wzG0qq3df8y+1mMh2tZ9gry0R03T6q6RmjwoXrW4oSAUb2QyVJyFkT1NKK7C92vYB7k3sXqUmUQ9ZwIhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UmHSJ0UktQQtRVopzsixwg4dCzBNdnSNpA2K6gGhdes=;
 b=RxPTHvFmXOUZkvibBlPpYeCyeq5qtguBMuuDc45B62jQlrKFH6MDkJ7S4qp5MrCIGziN2Q9ZPWVmFCCFH7VTFMeLvAsaOAOL5SMf+ODsBzs9X3NXQoYKAp3PS8yYcj43zu/QnLzwuSICXGuYaBEbwY7C3jW/pk/mJ3ozZGdbQc676j7DAUPF02+Br9uGPCcJDeRSX004qsG6xhqS6w4vlHXL22WKluTn9cKNZMMWj+JxZHpz4fpUDlghVCAQgajL9UeNh1LVTyCXy6UG49YB5WNyUAXNKhRj/smdoLq58JBWM0jrPFEQ/J2x6Py0WLitep6qrP891lmN7/LEH9vMFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by DS4PPFBF67129C1.namprd11.prod.outlook.com (2603:10b6:f:fc02::49) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 12:23:30 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 12:23:29 +0000
Message-ID: <69b591ef-4f21-4d91-abf0-758ed30761fa@intel.com>
Date: Tue, 11 Aug 2026 15:23:24 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] i3c: mipi-i3c-hci: Add PIO queue management
 support for HCI v1.2
To: Jian-Ming Liao <tim678910@gmail.com>, <alexandre.belloni@bootlin.com>
CC: <Frank.Li@nxp.com>, <linux-i3c@lists.infradead.org>,
	<Jm_Liao@asmedia.com.tw>, <Chloe_Chen@asmedia.com.tw>,
	<Yd_Tseng@asmedia.com.tw>, <Patrick_Yen@asmedia.com.tw>
References: <20260709071744.333403-1-Jm_Liao@asmedia.com.tw>
 <20260728093239.487156-1-Jm_Liao@asmedia.com.tw>
 <20260728093239.487156-3-Jm_Liao@asmedia.com.tw>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20260728093239.487156-3-Jm_Liao@asmedia.com.tw>
X-ClientProxiedBy: DU2PR04CA0082.eurprd04.prod.outlook.com
 (2603:10a6:10:232::27) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|DS4PPFBF67129C1:EE_
X-MS-Office365-Filtering-Correlation-Id: 13576d09-3639-477c-f4b5-08def7a35a27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: xDYBJiylSkyfEMn9i8NsUY4sGX8xD82vv9nvk5XwOvagryoZAauZK3d80FQ1O5rL7jj24Bx2H32+oWaLBMU9SP4EnIblKGSTEcYB4sRAJfwdQT+qaQjrYo8+4YeZ9mnrfePZycg0lUEO5Bnxcz/R7tNuGLY9v5JuAd0xjqoGEZg7SwndnS0hx5+M44fRuEqjAoxnhrbVaYwhjtIjv3OAgQBMncnU6Qes4WP5KieBLYl6wlEsF0GymLHjObx+Mdw0NvYiFun0IcoZpQ/EyufmilQEw9KrUpLjXL79N9RUh4+NY2eL4vHhPPREoN6ZdpTW/TilIDNv+05IhmYv2exIl+nXZu4n+DvQUehjEQ4XtAqA/wMmrTTWmG+b1cwVx2nCG7LGjd7tac59bk11xgLe1B2eMS7hhKRxDI1sZxoLEbWrHScPRIuiUbS5Y3PfgcjPo07vXYVIUCf/jmlg0WNPDI//mA+7d25/s99xQmzfMDi9CoYe0mkOnZ9KoHrVfJkdRXlaE1pQvJOKFxWbmkkfDCsrmykSyHNZOplrXTTG/sZtK8m4whNiVafcuCB9QhsX3PDYwAE/KnfR7dod0SxfMY7f5II38e9vIYm7gb/PJAT7Kix9qS5aEQ62auHJCMhaWRw8HO2X/grurmTv3UKEUFM112ZXVhw6FOdceviO9sU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2tZS3hNTmM4b2Mrd2k5dkhPN0hoUnlmZ296dHBMZlQ0NWZVQ1lUamlFSEpM?=
 =?utf-8?B?T2JCWHlIUVBXeDlVMGliREI1M2RBYjlTdEhBWVUyaSticHlTN0xrN3d5VXNs?=
 =?utf-8?B?WTVPOFdHMzE0dnV1NzZ6emRsUThsa3hpVmNhWW1HNzU3N2VHY1pWcXp3SkYr?=
 =?utf-8?B?YmZZcmtGd2hxVnZTL3ZLaEkrOUVhZGJYZWxQWXNlaytmZVNsVmlVL0FFTktG?=
 =?utf-8?B?WVZJMTMxaUMrb0p5RTgwOXJmYmpxYmdtMDBCcElsVEVBKy9vMGtMQ1pQd1lG?=
 =?utf-8?B?Q0V4WG95cklZYWJzaVpsbGFPZ01TWGYzT3RNMFp6M1hEMTU1TkxtUmtjRXYv?=
 =?utf-8?B?M2RGOW4vRnlLR1FWOXVCU0JuakU0K1grbWdlYjNvOXVGMjZqUTNxck9JQm0r?=
 =?utf-8?B?eGVoTVV3dUxsMU0yV3AvbXp4S2kwYThJSnUyRm5LNUpKM1VaTkpRTmtERjMw?=
 =?utf-8?B?Vy9WOW9JZDdIdXpNc1pwbXB3U3NyMlo1ciswNUhhYTdhU2g3TEwwNE05d04w?=
 =?utf-8?B?MUkrTXJ2S0tXa3FqdGdXSUNWSlhONWNWNTZVd0UxdnNhZ204Tmsyak1Oa2tu?=
 =?utf-8?B?N2V4U3phMU8zMVFHYnlKbEJvV2oxQ0t5SXk2YncxdUxhZ0RJSWp5OFdadVQz?=
 =?utf-8?B?TEh4VXIyaktGWVBjZGY4c1IxNmliKzVUSWxDSi9nV2RTVzU1dFRuT3F5YUsz?=
 =?utf-8?B?T1czQTdsRWlxRzEySkpyTVEzMUt3eXZGM1QwamVib1h0cTRKWWU4SkRlS0J2?=
 =?utf-8?B?cGc5eTJYYlNGWDRXeFlwUUFGWXVXWWJWM0JucWdkVG5FbmJZL0NMRFQ3TVlk?=
 =?utf-8?B?TGRkVmNTQ0NzaDlvbWI5eHMyTGFBOWtkZTZENjFUOU1VSFI4OU5MWVU5Vkxv?=
 =?utf-8?B?c3BIQUcvNXRIOXJEZ2FZSnRlcnVHM0c5VlVkbDZYdzZPRDdsNGVwTVZLc0JE?=
 =?utf-8?B?ckRra0dlVzh3WkNXUXVJQ2ZOZmNjbGZvekFObXRqNXV3Q1FBRVZjaEdDNGEz?=
 =?utf-8?B?cVRXV2ZMQ2NTanVoUExDZnd4UTVjLy9zNk05UW13dHRTWjRvVlVtc1ZVSHo4?=
 =?utf-8?B?YzF6QVdoSzhhc0hXVTN5NkgzendXaDNGZm1Sc3hYYTg3em5LRHBOZE9XdGt6?=
 =?utf-8?B?RzRRT0FZemxneTNjbFRJZ3FvNDFQNm9Zc0t2UW5vVGdMRktwaHJ3aU9STDIz?=
 =?utf-8?B?VzVnL1lvdWRBWVlOUXIvWWhERXRWUjNqSVlpRmkxdTV5ZTU3S2FJM3VBbmpV?=
 =?utf-8?B?LzRib05iYXpGdHpNZXlzY0s1eDNwL2QyVlA3U2Q0a3BTazFXYnVNYXVQSmtV?=
 =?utf-8?B?RnJxS1JNY1dPZkdMQ094TjdyUlFXRVV2MUZ1MzRJa3AvV1B2YmRObWRDWUps?=
 =?utf-8?B?b0F5eVcxakJiY29ELzJaa2xVREQxQmo5V3F4OEhTRGxiZWVYYUZURjBtUHJl?=
 =?utf-8?B?cWdwOHdqWlUvTTRNRzB4ZHBsSzJxUWh5RzB3UnY5b0xXdW1JVDhUWnl1TDRs?=
 =?utf-8?B?K3ZlZmMxTHFmT3ZqckdlVVFnM0IzY0ZqYlFZK3puTXJrWnNubEF1YnBwTzEr?=
 =?utf-8?B?bklyVy9aYjRRZzV2VmE0ZGRQeUxvWGhEQmxvSlJ1VXlhZzhQSk14Mk1LWlQ0?=
 =?utf-8?B?cGEva1RVNWl5TDlaNjVacThsTlFMSm5uSmxFdmU5dWFOMHdPUWdycVY5aHQx?=
 =?utf-8?B?U1RsdG9abVc1blZqWlovUlVEeUZOV2JMVGg1NWFmbUpCK0drOVB1R1VpSThS?=
 =?utf-8?B?NXhLQW1hUFIzbXYwZWlxN29CNWZ4QzlWbjVzUmh2YytQOEk1elRaZmgxdWJZ?=
 =?utf-8?B?Y3p2OVlQSG13UldVeG1IV2pBS2tEYm5VeCt6Sk9xWGJwV0JKR3habU8vR2s0?=
 =?utf-8?B?OVBVbGFmejY0cFM3cURwSVNuTVEzby9MNEEzVWRjK3lOMHNWZnk0QlBtVHd4?=
 =?utf-8?B?S2pEU0t0Y2xuMVV0KyttQmVkQXBTV2FPTytXa2lZdFM3b0VlZnFaM09FMi9w?=
 =?utf-8?B?ank3M09PekZLY0hWUm9zVCszOWhCWis4dkJpRHgxcC90MmpPZm1zOWtXZXFN?=
 =?utf-8?B?cms1WndmU2hrVkhYZ0NmeXVWM01TS3RPVHRYOFBCZnhHYW54ZUc3STNQWDAv?=
 =?utf-8?B?Z1JaVWQxYUdHS3hPK09sOG8wZWhtVkZwdXA3R3VMaEVHeWkrQmN0OWQ2RU1v?=
 =?utf-8?B?NlNBRVQxa2hiNzMveFowOThKOTl2Nmx1b3pBQ1FXS0U4aDlyblQ0K1R4SVQ5?=
 =?utf-8?B?MHF1Z0g3Szd6eG1LcVBPeDdmMHdzd1lzYU5yMWhmSnFUSW1aZWoyR2E0RWRq?=
 =?utf-8?B?d0NidDJUckNtZEtwSnVCc1VSM25VdlR3Qk5iMUVvZmxxOUZXeXNHczB1YTZI?=
 =?utf-8?Q?MUfAiZEFPR5dkrv8=3D?=
X-Exchange-RoutingPolicyChecked: B98IrwM3N8dnhWKTziDHr6PRXI5ZM0tri7nl5p9x2vY65rEENtiA768pohxZ1oUHjjYP5YdB1szS3UXnnimdhGx1CLxIvES8sEjULitDcMfExoMneFylJHOiyVo3jtgnwJ0vzVY9sWCzL/S+5ZqjtoWfFEtkhnQsM07dlCX79x8OOtZpXURoXhvfYmU0OcMI/q6ApeUP6ajxBBj7APKwhmEOUpJZ8EzCNIMmX/+jKwAzxdUXhaqHpwbBKptuuw/ot/n5ZnSC9R0lXLllGeJIisY29MN1TKqGEEbf4xqj/09PsmhjCbq2pxmmkBo0X1ytFFnDZIjNuvr0G2KSvI2YlA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 13576d09-3639-477c-f4b5-08def7a35a27
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 12:23:29.9243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q4X2PciW7ISKMBq1bVCw7qg5EjQGszPfXA2EKbL6ga9T8IX23aBvqi1OV8AXtobsJiSJEOKGTCoWm/MaY4YFVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFBF67129C1
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_053032_250774_B448DAB1 
X-CRM114-Status: GOOD (  19.10  )
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

On 28/07/2026 12:32, Jian-Ming Liao wrote:
> Support explicit enablement and starting of PIO queues as required by
> HCI v1.2.
> Handle alternate PIO queue sizes via ALT_QUEUE_SIZE register.
> Implement explicit PIO queue stopping/disabling and restart logic after
> errors.
> 
> Co-developed-by: Patrick Yen <Patrick_Yen@asmedia.com.tw>
> Signed-off-by: Patrick Yen <Patrick_Yen@asmedia.com.tw>
> Signed-off-by: Jian-Ming Liao <Jm_Liao@asmedia.com.tw>

./scripts/checkpatch.pl warning:

WARNING: From:/Signed-off-by: email address mismatch: 'From: Jian-Ming Liao <tim678910@gmail.com>' != 'Signed-off-by: Jian-Ming Liao <Jm_Liao@asmedia.com.tw>

> ---
> v2:
>   - Removed '-' prefixes from commit message per maintainer's suggestion.
>   - Aligned GENMASK bit definitions with existing macro styles.
>   - Reverted unnecessary dev_dbg line movements to keep the diff clean.
>   - Removed manual kfree(pio) as pio is managed by devm_kzalloc.
>   - Introduced/used helper macro for HCI version checks instead of hardcoding.
> 
>  drivers/i3c/master/mipi-i3c-hci/core.c |  1 +
>  drivers/i3c/master/mipi-i3c-hci/hci.h  |  5 ++
>  drivers/i3c/master/mipi-i3c-hci/pio.c  | 67 ++++++++++++++++++++++++--
>  3 files changed, 69 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index e80aa1f5722e..dccc974ef15a 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -1031,6 +1031,7 @@ static int i3c_hci_init(struct i3c_hci *hci)
>  	switch (regval & ~0xf) {
>  	case 0x100:	/* version 1.0 */
>  	case 0x110:	/* version 1.1 */
> +	case 0x120:	/* version 1.2 */
>  	case 0x200:	/* version 2.0 */
>  		break;
>  	default:
> diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
> index b3d9803b1968..becccb1a8cf5 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/hci.h
> +++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
> @@ -30,6 +30,11 @@
>  #define reg_set(r, v)		reg_write(r, reg_read(r) | (v))
>  #define reg_clear(r, v)		reg_write(r, reg_read(r) & ~(v))
>  
> +/* helper macro for HCI version check */
> +#define hci_version_at_least(hci, maj, min) \
> +	((hci)->version_major > (maj) || \
> +	((hci)->version_major == (maj) && (hci)->version_minor >= (min)))
> +
>  struct hci_cmd_ops;
>  
>  struct dat_words {
> diff --git a/drivers/i3c/master/mipi-i3c-hci/pio.c b/drivers/i3c/master/mipi-i3c-hci/pio.c
> index 9df114ef0278..43ef05468cc4 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/pio.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/pio.c
> @@ -45,6 +45,11 @@
>  #define IBI_STATUS_SIZE			GENMASK(15, 8)
>  #define CR_QUEUE_SIZE			GENMASK(7, 0)
>  
> +#define PIO_ALT_QUEUE_SIZE		0x1C
> +#define EXT_IBI_QUEUE_EN		BIT(28)
> +#define ALT_RESP_QUEUE_EN		BIT(24)
> +#define ALT_RESP_QUEUE_SIZE		GENMASK(7, 0)
> +
>  #define PIO_INTR_STATUS			0x20
>  #define PIO_INTR_STATUS_ENABLE		0x24
>  #define PIO_INTR_SIGNAL_ENABLE		0x28
> @@ -72,6 +77,11 @@
>  #define STAT_RX_THLD			BIT(1)
>  #define STAT_TX_THLD			BIT(0)
>  
> +#define PIO_CONTROL			0x30
> +#define PIO_CONTROL_ABORT		BIT(2)
> +#define PIO_CONTROL_RS			BIT(1)
> +#define PIO_CONTROL_ENABLE		BIT(0)
> +
>  #define PIO_QUEUE_CUR_STATUS		0x38
>  #define CUR_IBI_Q_LEVEL			GENMASK(28, 20)
>  #define CUR_RESP_Q_LEVEL		GENMASK(18, 10)
> @@ -173,6 +183,14 @@ static void __hci_pio_init(struct i3c_hci *hci, u32 *size_val_ptr)
>  	 * IBI queue size within allowed bounds.
>  	 */
>  	ibi_val = FIELD_GET(IBI_STATUS_SIZE, size_val);
> +	/* Adjust actual IBI queue size based on v1.2 ALT_QUEUE_SIZE */
> +	if (hci_version_at_least(hci, 1, 2)) {
> +		u32 alt_val = pio_reg_read(ALT_QUEUE_SIZE);
> +
> +		if (alt_val & EXT_IBI_QUEUE_EN)
> +			ibi_val *= 8;
> +	}
> +
>  	pio->max_ibi_thresh = clamp_val(ibi_val/2, 1, 63);
>  	val = FIELD_PREP(QUEUE_IBI_STATUS_THLD, 1) |
>  	      FIELD_PREP(QUEUE_IBI_DATA_THLD, pio->max_ibi_thresh) |
> @@ -192,6 +210,17 @@ static void __hci_pio_init(struct i3c_hci *hci, u32 *size_val_ptr)
>  	 * IBI routing yet.
>  	 */
>  	pio->enabled_irqs = STAT_ALL_ERRORS | STAT_IBI_STATUS_THLD;
> +
> +	/* MIPI I3C HCI v1.2 requires explicitly enabling and starting PIO queues */
> +	if (hci_version_at_least(hci, 1, 2)) {
> +		u32 ctl_val = pio_reg_read(CONTROL);
> +
> +		if (!(ctl_val & PIO_CONTROL_ENABLE)) {
> +			ctl_val |= PIO_CONTROL_ENABLE;
> +			pio_reg_write(CONTROL, ctl_val);
> +		}
> +		pio_reg_write(CONTROL, ctl_val | PIO_CONTROL_RS);
> +	}
>  }
>  
>  static void hci_pio_suspend(struct i3c_hci *hci)
> @@ -210,6 +239,7 @@ static int hci_pio_init(struct i3c_hci *hci)
>  {
>  	struct hci_pio_data *pio;
>  	u32 size_val;
> +	u32 cmd_sz, resp_sz, ibi_val;
>  
>  	pio = devm_kzalloc(hci->master.dev.parent, sizeof(*pio), GFP_KERNEL);
>  	if (!pio)
> @@ -219,10 +249,24 @@ static int hci_pio_init(struct i3c_hci *hci)
>  
>  	__hci_pio_init(hci, &size_val);
>  
> -	dev_dbg(&hci->master.dev, "CMD/RESP FIFO = %ld entries\n",
> -		FIELD_GET(CR_QUEUE_SIZE, size_val));
> -	dev_dbg(&hci->master.dev, "IBI FIFO = %ld bytes\n",
> -		4 * FIELD_GET(IBI_STATUS_SIZE, size_val));
> +	cmd_sz = FIELD_GET(CR_QUEUE_SIZE, size_val);
> +	resp_sz = cmd_sz;
> +	ibi_val = FIELD_GET(IBI_STATUS_SIZE, size_val);
> +
> +	/* MIPI I3C HCI v1.2 supports alternate RESP/IBI queue size */
> +	if (hci_version_at_least(hci, 1, 2)) {
> +		u32 alt_val = pio_reg_read(ALT_QUEUE_SIZE);
> +
> +		if (alt_val & ALT_RESP_QUEUE_EN)
> +			resp_sz = FIELD_GET(ALT_RESP_QUEUE_SIZE, alt_val);
> +		if (alt_val & EXT_IBI_QUEUE_EN)
> +			ibi_val *= 8;
> +	}
> +
> +	dev_dbg(&hci->master.dev, "CMD FIFO = %u, RESP FIFO = %u entries\n",
> +		cmd_sz, resp_sz);
> +	dev_dbg(&hci->master.dev, "IBI FIFO = %u bytes\n",
> +		4 * ibi_val);
>  	dev_dbg(&hci->master.dev, "RX data FIFO = %d bytes\n",
>  		4 * (2 << FIELD_GET(RX_DATA_BUFFER_SIZE, size_val)));
>  	dev_dbg(&hci->master.dev, "TX data FIFO = %d bytes\n",
> @@ -246,6 +290,9 @@ static void hci_pio_cleanup(struct i3c_hci *hci)
>  		BUG_ON(pio->curr_rx);
>  		BUG_ON(pio->curr_tx);
>  		BUG_ON(pio->curr_resp);
> +		/* MIPI I3C HCI v1.2 requires explicitly stopping and disabling PIO queues */
> +		if (hci_version_at_least(hci, 1, 2))
> +			pio_reg_write(CONTROL, 0x0);
>  	}
>  }
>  
> @@ -766,6 +813,18 @@ static void hci_pio_err(struct i3c_hci *hci, struct hci_pio_data *pio,
>  		hci_pio_dequeue_xfer_common(hci, pio, pio->curr_tx, 1);
>  	/* then reset the hardware */
>  	mipi_i3c_hci_pio_reset(hci);
> +
> +	/* MIPI I3C HCI v1.2 requires explicitly restarting PIO queues after error/abort */
> +	if (hci_version_at_least(hci, 1, 2)) {
> +		u32 ctl_val = pio_reg_read(CONTROL);
> +
> +		if (!(ctl_val & PIO_CONTROL_ENABLE)) {
> +			ctl_val |= PIO_CONTROL_ENABLE;
> +			pio_reg_write(CONTROL, ctl_val);
> +		}
> +		pio_reg_write(CONTROL, ctl_val | PIO_CONTROL_RS);
> +	}
> +
>  	mipi_i3c_hci_resume(hci);
>  
>  	dev_dbg(&hci->master.dev, "status=%#x/%#x",


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
