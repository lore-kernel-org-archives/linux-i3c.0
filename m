Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C39AFC55184
	for <linux-i3c@archiver.kernel.org>; Tue,  4 Aug 2026 15:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Joco3Iis8PVnLQIZNYY86YOZ8Otwc8qtTNRCOhhtnm0=; b=s3WqpIM9W+b+wsLdIDDQCG3PMV
	cMvmXxFCNAKwmvGAYsND8AsoNE092Uvjr9Au+x6+7WR5LPBgStjsoMXKL9nZzCUmIpDlcKxrp5tEO
	ILG0wl4Rwb7u0XodPf02I6EFpV+1o3gJ2qTViRTzekIVecl8S+E9pZS39ghrMj0vQFvNmmevXBt50
	+YVPx8g4x1jl4lrPeJCIv/je6XEGjIg+Q3JYcWYlhBPMlj0u06gg4A22YEscbnt5r0bcjkuapTp2e
	0cevbd5Dt0/mr6fQpCyMPx4C+VRnd1TVo/kHP6/1tnpfoRqLIOvanCTQ4k7Vl0EeBgyH3SOYXysjy
	/apwTUYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrHEf-00000002ERh-23cw;
	Tue, 04 Aug 2026 15:39:21 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrHEc-00000002ERL-0slw
	for linux-i3c@lists.infradead.org;
	Tue, 04 Aug 2026 15:39:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785857959; x=1817393959;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=psUQG3xPhb+lFfDN7jgAe41gYG6Y5erY+XATk+1xH8U=;
  b=MJK9vZg46rxnRQF5R3RHC05pN7ze8zlH8ybI5CJ7vVBogIYFg0fDVVQH
   m1qz2b8OFEGZKNzdT0xpmnLfVTh94bF0KLJ4oZOi2LiaCj6YvjUFffHXn
   cFnhNRgKN7SmhGVgPw7O1OlpM6WDu5HCJV65HqvJQN1CrbPLI5Bcn3Nxa
   Mqr2fjlcEbMlWSsmBzQL4I2P94uYYKHae0ZO0+gxHju/oRN21UEijPCQC
   NkgPMjrVtrB/I1UjVxlVQnRwCJ6ZAnE+LpNbb8ga2OomJ3JBAr2FTjHbm
   Pl3s7NPOI2zaREMSwx6hn76Ey4GqQiczF9+UBMFkECamo85EgeS50bIJI
   Q==;
X-CSE-ConnectionGUID: 8klHCbxhRgisuaPR7YPdpQ==
X-CSE-MsgGUID: DlJ2dAruRmaNBrFHiRNwig==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="97918272"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="97918272"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 08:38:13 -0700
X-CSE-ConnectionGUID: xDHMW25HQzCVp6OlZeqh1Q==
X-CSE-MsgGUID: jOgWrLUISwu1oIUe+Lvv6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="260959678"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 08:38:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 08:38:12 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 4 Aug 2026 08:38:12 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.1) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 08:38:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=su//xpkQvYWDoL20zuMw4PSg1M0+yeB45wkPAlAHnQ2mSDr1UZErLzbJiESsSPL3/sa/Uma2a3Wm4y6BrHmeOOG7oOIwbe8fSF9dnpzT7IE7UQxLXdLDl4r1lof1bcndFNqFkNq7BSkn0e5QXNf4uFmnf9rcmUrf37lxjoP41gnpPVhjS2gtPAyfHP1azt8wPxml8ULZ5Hv8eydGTAuNWPxGO4LQZYQ0LLXJKG8T0OWkyEdtJtMQ5+a1yuvqp6KfBZ4rs7dQutPqkNtr4iDucAtTHVDgSL+TfAcmFy6g2aEqdgpK9Y9W/UA5RgFFcPu6TkHqf85Y3/iOd+X4aDFQlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VfNalzrnBliBcgoxOgAg6Kfanq6DobJBZdYj5ATJOmI=;
 b=SV8SW2zH56Tce4g0KJR0ijpXi5keSCXc1Litc9b3rVfMLvbr3svl0wue8tGWRc4MrQ5ypXWQ+oTJi6Vx8a/IeiUXEmyKbJc3noTsHSSpFnZJtTJsorfV5chIeH13jcHc0dZDGsEwe+1fB9xqbgJPGiVDOmKt4jbFkIydwwXQaHglvDb2HXfQQEeNFllM4FFpznY7d5Em8wL809dgW/E+wD1RoS3HisFbVRDLSGxsdI8dXQPoXz26zIW1MK4kUkBkH7EsyiMcAYNXQ/59slazambauBDuoKgBTJ/2YPcVcfUwM2N9SYpnflIFey7Aj4s890e+tKDfHL1vD5kUQMnIOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by MW6PR11MB8410.namprd11.prod.outlook.com (2603:10b6:303:249::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 15:38:09 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 15:38:09 +0000
Message-ID: <bd6a9e30-7536-47cb-aa71-b160ffbf3ccf@intel.com>
Date: Tue, 4 Aug 2026 18:38:04 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 02/14] i3c: Fix unlocked dereference of dev->desc in
 i3c_device_get_supported_xfer_mode()
To: <sashiko-reviews@lists.linux.dev>
CC: <linux-i3c@lists.infradead.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, <Frank.Li@kernel.org>,
	<linux-pci@vger.kernel.org>
References: <20260804133810.184905-1-adrian.hunter@intel.com>
 <20260804133810.184905-3-adrian.hunter@intel.com>
 <20260804150922.01A091F000E9@smtp.kernel.org>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20260804150922.01A091F000E9@smtp.kernel.org>
X-ClientProxiedBy: DU7P251CA0005.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:10:551::32) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|MW6PR11MB8410:EE_
X-MS-Office365-Filtering-Correlation-Id: fac6b6e2-d881-4a4f-1dc9-08def23e62d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|11063799006|5023799004|56012099006|4143699003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: BmqDwkTv5KnV2Vctl5dGTe9eHoC5ILu5rJReoLHpcTVD8UfklAqHEjs3+yqFcYf4U/qmyOgl+o5yyoOk+wpdys16gcOkf0XvV6QmQ/5ZILWVL+nmfLQMedHJxwfcrRrtAit1MtyH10ZC0kNXmSM5xwCaOEvgNnkjKc78h4IUdnotFR/skbBDCGqkzQjggWnAGP+pas2SFoaWKpKvoDKEqsyHj4TLF4vsZU65SxEHzKwzPED6bm5pRPFV138t9Nqai57T6vKxOC/iCs/zwKFGWO4zZou60noMfic95cie49xTqbwlpl7YmEVpDr50dOCTEvOh/6J7tSwITfI31Emua3VwYkMCVCoG8/f24qK1ein1MgP8rEEnawVFkkX4/CGv0MCB4SmAwWItGNHgre4hjzMSiXUtxPXw33oCPwjYHIwTGvTVm4JzHgCKUDvMeaGVWvdKXbSsOYysyK1RJv8ZLwDIsMhMgHVavEx/iaDOlNawJtn+DVjVGhSiPRsN2eqFP6BMGurVWqmn7w95/ndoDtgiBF6PyLndG28PhIS4q/BOux4XzI2rKj4PY7dmgoKfYhsSl7EjFB/ZylSAd4ekAiE3osH7MTorGHHMAyd37WkAGx5LH+ktuYJqVmXwpItJD1fsXp6w4Pw5Met/auovilTZC/SdCb7n/8CddN+m1hA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(11063799006)(5023799004)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eERQUWhZMUVUMW16VlZ4QXJXb3RkSFVTRHF1TzFHNmQwaFpRWk9ld0J2eTZL?=
 =?utf-8?B?WDgydTJIMmR4cGVEQ0lmcTkzaEw5Sk9MVHNxbFRDZ00wbGljM1BpWGFrMUFl?=
 =?utf-8?B?VDlCZmJCZHVUY2FTWGlZVGpOK0RydElLU0ZmMnJUM3ZSblBYWDlwOEdvbWg4?=
 =?utf-8?B?QXpyWEtTako1RFNidTJiUUJoRmRtWWJNR1puK3MvMGJlVTJUYVpxazZJU1Nu?=
 =?utf-8?B?WkpSclRSRkEvcWFYNGpPYm40a0hlWHFGUWY0NWhrNnZMaXB5Tm5BbWFCRFJJ?=
 =?utf-8?B?SndQWWp4NWV0Y2YvWnpXYWw5WnhRTHp2VVJ0QUluUXJVdXRrRmNOVHFTK2Rl?=
 =?utf-8?B?a3RQTUVtUXhzeC9vT3BCQWYwMmI3YXM0cTA3Tkw1RThoblpVRHhXNmJNT0FD?=
 =?utf-8?B?TVJZc0pzdG1YcVJvSjJZNytpRzh1TzdpVm5WWXh2NG04dXBSclVTWlRUUVdL?=
 =?utf-8?B?aHVYUTFlbCtHc2l3WkF4cHMyZERNMVowUUZianEwVzFVVXIyMWVrckU3VFZm?=
 =?utf-8?B?QjNDWFBnZm9nQUdnUms3YmdZM2oyaFJmNHNTVW9DU2VsUHh3aUJpU0ZqZDRx?=
 =?utf-8?B?eDJhTUMzYXN4Y21ZdGJDeVYxeUx1K3pXZ0J5VXRqSXJDSTN5VHlGZmhRR05t?=
 =?utf-8?B?Tjc3RFg1ei82TlU4ZmhxL3VLYW1HRDNmVUwxVnZMeTdjamU2bWV6aFFpZncr?=
 =?utf-8?B?cXVBNmJGNzlhbkkwZTFJL1NvcVJxWEV1TjlPTWZISUdKOVB3K2prQlhlKzA2?=
 =?utf-8?B?Wkw5RzJUcTlIY0pLZHY3czB4OE5vUmZRSnkwUXFaaWxSd2lQdU1DUklEcm5p?=
 =?utf-8?B?a2h6V3J4QkhvQlUwcDZGUStHc3pON3RhdkRqcTJVVnNKblBka1c2MkEzOFhG?=
 =?utf-8?B?cThCRmtXamdpK04vK0tHbFJLN1c1N1BRTWUvZERYampwMmFpenU3WWNjRFdD?=
 =?utf-8?B?aVJFSzRUNzRXMXF1Uk9YZUlITFRveWNJWkZrY1hKVmQ0TzB1eUJnYS9xWWE1?=
 =?utf-8?B?MDNFOUdCRm1vd0tVbExwVTJtVno4YnR1MnAxVDdSTGxiT2dSRzM0Rk94UVhP?=
 =?utf-8?B?bU5hbGt1M1E3NDdpbmJjTkJuZUhWVE5Za0FnYy9pODdma2d6d0FBSGd1YVhR?=
 =?utf-8?B?TnBTV1hTeExVZXVJQ0psMStnY2p5VWs4aDB2R3FONHVPOUFjTDhmUDBxQVJC?=
 =?utf-8?B?TVZqSXJXdHprTDIwOHNqK3BqakZ1QlFMTmNvYnRCUDAxakFlMFRJbU04dVNm?=
 =?utf-8?B?SStjMlVXSG91dTh5VDRTS214NGlWRUw3RitkazgxajREK25vejVlamhuN3lm?=
 =?utf-8?B?NzcrdTl0bmFPOUxiR2FoTFRZWTZlbC92SzlOWjlyT0dpcEQvLzM0SXpsTFJK?=
 =?utf-8?B?aUk5aWk4U1BjclcwRHI3cGl3cGQrUE03eUhiUVVPbGhlOUdWYkt3bnljOUNQ?=
 =?utf-8?B?dXY4aWR4ajcyWTV4NXZoQXl1Q3dWT1ZKRHNhMDdjTmVSVFpjeWpmdE5GMXJ3?=
 =?utf-8?B?d3I1Rk5tMDhHZmFkUUZyYTdwdnFaNUkyODkwOGhmRldJOWFjbTRQc0FwS0ow?=
 =?utf-8?B?MXJKZE1BbGU1aEV3TUxPdGRueFJOclRDOU5YUTFIK1NTMFZZWEdUR3FXTHlm?=
 =?utf-8?B?ZDBmTnNZcE1oaXc5Q2sxV3Z4Qy90NmRrRERMb2FWUFRBL1pEa2N1ZFhQWFRr?=
 =?utf-8?B?UW9RVEJrVjZBZGZualNiZGpIczZUQnhBckdnSGtQend3NElnQnpIV2pHUnAx?=
 =?utf-8?B?N25WSWNjbDRna1lDNGo0d1F0UTJwSFdsWjM2S2txYTgrT2hnOXM1bHJNb0lw?=
 =?utf-8?B?MXhpb2NsSXMyYlNNbVhBTm9tZW0rcVA1OXNoUXh0aE5lQ3BKWnJ2cUllZ2tB?=
 =?utf-8?B?bHdKNUxYbW5oNmZVd0NBT2JOdk5tVmZ1ZHJzUVFWY201Q25WMnoweWFueFo3?=
 =?utf-8?B?Q2pLT2c1bEZlWTFLRi9IZFJPeGJoc2JnWXFlcHRTY0c3akxDQ2NNaFdYY0tW?=
 =?utf-8?B?ZXp2Y3kvVzdOOHpDWUJEYjlOb0p0aUROYUxMQjJaMFZGVWRQNi9hSEMyNmlU?=
 =?utf-8?B?RDBvV3FGVzlwbG9wZERRczFnV1FtZmhKNkpFVVZmNGRWN3dLam1rTWtNbDJp?=
 =?utf-8?B?Nm8zMko3YkpaUHdkMnUxVDlIdmpyZGp6dlBNR2w0V2dROFZiRGZ1MEN0b1hI?=
 =?utf-8?B?NTF3NVJmQng1Y202Y3BCREF1N0x6ZlMrbG12SzJaNzhzZGFHVVRSZnJsRWE5?=
 =?utf-8?B?S3pRbko0cElldTJ2VldWc3AxRElMd3Y3Wk5ma3V5SittNnBBeE5wRVlua2xj?=
 =?utf-8?B?MThjZmlQM2wvTWNGcTVyYk1GTFFKQzcrNkRXem9HaFVvcWhXVm80Y2xJdG9Z?=
 =?utf-8?Q?Bb7VNrsJsz+lYjsc=3D?=
X-Exchange-RoutingPolicyChecked: hk8uS76yYOUL7doXWdA0rOqNXQENITrD5xQkdhy2cqyJHA78N15OhrldIY0N649MF4mZt6ZoDCx1BQOSc+Wk9W7+YlzhKGZ7ygOLzKs2DID2zythaBIuzg7Bx1oz3Qj1IBejKhMIl6DyxSlF+rfGm8ktBTBqgXLHgGajNzzKMfcg8KC1mdKi6UQ+tam6mezedPA3upTRb3FQHIsFNcsd65CavgxHSYaiUThzPXd0Lw6OdvTCfs1kR2FYC2oq7n826WOQE2pN0LuwhOpbZEcaBe/R0Q0V6hKgIgXP4KTj5s3KXAZUqOQzTRC2flBgKJ/oJJI9IQ59W/nc5T+puzTjYA==
X-MS-Exchange-CrossTenant-Network-Message-Id: fac6b6e2-d881-4a4f-1dc9-08def23e62d9
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 15:38:09.5632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ITwX1ppfcqi/SJOFJ+3F6umO/fFSqN7HCjTn5GWZa55m5FiR8Uz7cEf8Y7/7XMp/mnwzGw1Os6NGOEhuOk+8AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8410
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_083918_410268_29CFD121 
X-CRM114-Status: GOOD (  26.33  )
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

On 04/08/2026 18:09, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> 
> New issues:
> - [Critical] The patch transforms a predictable NULL pointer dereference into an exploitable Use-After-Free of `master->this` when an I3C device outlives its master controller's unregistration.

No. 'desc' is never NULL however it could be being changed concurrently
prior to being freed.  UAF of 'desc' is no different to UAF of master->this
(which is anyway being addressed by a different patch
"i3c: master: Fix use-after-free of master->this"),
so nothing "transforms" here.

> 
> Pre-existing issues:
> - [High] Uninitialized stack memory (`devinfo`) is used for driver matching when `i3cdev->desc` is NULL.
> - [High] A Time-of-Check to Time-of-Use (TOCTOU) race condition exists when accessing `i3cdev->desc->boardinfo`, leading to a Use-After-Free or NULL pointer dereference.
> --
> 
> --- Patch [2]: [PATCH V3 02/14] i3c: Fix unlocked dereference of dev->desc in i3c_device_get_supported_xfer_mode() ---
> commit 97cfccca08da732124561cbc1aa49b571a84dd8c
> Author: Adrian Hunter <adrian.hunter@intel.com>
> 
> i3c: Fix unlocked dereference of dev->desc in i3c_device_get_supported_xfer_mode()
> 
> This patch modifies i3c_device_get_supported_xfer_mode() to use dev->bus
> instead of dev->desc to obtain the master controller. This avoids a potential
> unlocked dereference of dev->desc.
> 
>> diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
>> index 101eaa77de686..a3778282e84c2 100644
>> --- a/drivers/i3c/device.c
>> +++ b/drivers/i3c/device.c
>> @@ -309,7 +309,7 @@ EXPORT_SYMBOL_GPL(i3c_device_match_id);
>>   */
>>  u32 i3c_device_get_supported_xfer_mode(struct i3c_device *dev)
>>  {
>> -	return i3c_dev_get_master(dev->desc)->this->info.hdr_cap | BIT(I3C_SDR);
>> +	return i3c_bus_to_i3c_master(dev->bus)->this->info.hdr_cap | BIT(I3C_SDR);
> 
> [Severity: Critical]
> Does this change introduce a use-after-free if the device outlives the master
> controller?
> 
> When a master is unregistered, i3c_master_unregister() calls
> i3c_master_unregister_i3c_devs() to unregister child devices. If a child
> device has an elevated refcount (e.g., from an open file descriptor), its
> struct i3c_device outlives the unregistration.
> 
> i3c_master_bus_cleanup() then calls i3c_master_detach_free_devs(), which
> explicitly frees master->this.
> 
> If the child device later calls i3c_device_get_supported_xfer_mode(), it
> would dereference the explicitly freed master->this pointer. The previous
> code safely faulted on a NULL dev->desc, but this new path appears to access
> freed memory.
> 
> [ ... ]
> 
> [Severity: High]
> This is a pre-existing issue, but does i3c_device_match() have a TOCTOU race
> condition leading to a use-after-free?
> 
> drivers/i3c/master.c:i3c_device_match() {
>         if (i3cdev->desc && i3cdev->desc->boardinfo)
>                 static_addr_method = i3cdev->desc->boardinfo->static_addr_method;
> }
> 
> If i3c_device_match() accesses i3cdev->desc without holding the device lock
> during concurrent master unregistration, a context switch could occur right
> after i3cdev->desc is checked.
> 
> If the unregistration thread then frees the descriptor via kfree() in
> i3c_master_bus_cleanup(), the subsequent evaluation of
> i3cdev->desc->boardinfo will dereference a freed pointer.
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but can i3c_device_match_id()
> evaluate uninitialized stack memory?
> 
> During concurrent driver registration and master unregistration, if
> i3c_master_unregister_i3c_devs() sets i3cdev->dev->desc = NULL,
> i3c_device_match() might still proceed to call i3c_device_match_id().
> 
> drivers/i3c/device.c:i3c_device_match_id() {
>         struct i3c_device_info devinfo;
>         ...
>         i3c_device_get_info(i3cdev, &devinfo);
>         
>         manuf = I3C_PID_MANUF_ID(devinfo.pid);
> }
> 
> If i3cdev->desc is NULL, i3c_device_get_info() bails out safely without
> populating devinfo, leaving the stack memory completely uninitialized when
> it is subsequently read for driver matching.
> 


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
