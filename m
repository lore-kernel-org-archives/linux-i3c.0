Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9363CD98E1
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Jun 2026 16:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Lyjon025PD7p06G6QQImeoSk/JLuTpd6DxvFuDx91r0=; b=pRpQW9J68Kl67vt8dx2AI2voE7
	mK/bi3LEOW9YYljTPxf8aAS9Nzoyg8jrFONK1XP3gOTDOqQ/6bALH5lggyFOuF88p3dbOy3fqoTHn
	Sa+q/KBOBrZjYbwompuibeew7PaKRTPQtHxVwHMph8uaQWNjsHwt+gllDzpmW2Q4iex/UAiFB3UP+
	hczbmuNiRghOrmlpIDg4trMGDmmzca2x0u+nDtl7vuxe3m+qdNHBzdc4IszQTIZqo0gFiB9wa2CRk
	8N9I1d6hvyuw5szftPqCiRKXym5Z5uq1JD8tgacrYSS3YyPYLb/6D3Ks5mQWwhA2QqkiQcg9PvZ7+
	sG1/GHPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZWGE-0000000G4U0-1mkJ;
	Tue, 16 Jun 2026 16:03:34 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZWGB-0000000G4TE-30NP
	for linux-i3c@lists.infradead.org;
	Tue, 16 Jun 2026 16:03:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781625812; x=1813161812;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=XYikTrvjHrOGc53PLKMCy4gybG7RGSheKSasdU0egeE=;
  b=Xm3rLEshmqPzKZ52D4bsLZb1C4TpOE7yZKmn+kKYU+JjhqSArFvNO7UA
   9I91VClfbWs3BrFCItzYlaftmLXb/9jdl8OdoFPPojFn+cRUi+IbUXaqc
   ViwFyc5K71oJXZNaJ88tSU6XWXyQSgMMA2jNGZkYVFFV/yhe0jL1x/Nev
   2kiGGgB8dTiZG3MyMXsoZRrpvj4KUu0NcqVXEENC9Irg6/jMbCs3NRpfg
   UiLYOjjV77/vzpdOq7o3QkYopTd62aNfyFsA8xikBQHCqkq9QIK6bOzsC
   FCeWAtIJku6j6FMxiuzY7P288z7HjAxnx3uOvBdc2iWYgvVTFOQqWZoOl
   A==;
X-CSE-ConnectionGUID: ok3c87SPTd2UfY8keNTRDQ==
X-CSE-MsgGUID: Bj2cam5QR9KhhX3Ak/i/iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82501539"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="82501539"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 09:03:31 -0700
X-CSE-ConnectionGUID: s7k1tPn/T0em1APwb/cusQ==
X-CSE-MsgGUID: QjwGpT1qTgi8s0C7eyamNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="252115453"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 09:03:30 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 09:03:30 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 16 Jun 2026 09:03:30 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.35) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 09:03:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XPIpeXLYr41QfYgnfaCEOn4DOjVCrDUidIYU93ugSwGhWJ6W34Xp4gx4JUzoS5NmCqB6noD27nVwdXabkjKSFnK/8iVeFd6a0HhfoKPOXjNtV0hXTuHZel1744SYkl0I/Yctn/fS/af3cyWoto0gnH8rj7/BE3OddVAtP+U+OA44CGR/tjeJN3Avl60zv5tNYZsYsjW2lfQ3N22k3zuVJ9+qhyhCh/ZxXWBpWD/ahQ8COAyBs5/Jj1Z5vsa711dbDq/4JPpCgPtnA9pQ49smKP15xxuu1vx0NKn2UbY4NMO3McNRwjjKlPQuGXrvuoJHN9ahk/ZrOgZqGi//2phRtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H53zWKsmXgiGUasqgISibwzc9qOgPmjE3W/OdPO1Pdc=;
 b=a0V1CuEKbQ+DrzI5z1RQcJBZe2awKB8Zl6S3NrjOUIDTzr6UkF5beYi9E/Elg2j7/y1bNbdTQ4Njs/fU1gc6ogyZNhIDwpHj7B1dauC4MyBDnCxrMei83Ir+b41OKYKlg9Yna2xoH7nWgpNpOLfksXISPlFV9skFyKeGlE/hjyT01FRcYEJkzamHBJhErYDGrWgYq3QDX0oirWnbslyjx4cPTNZvC+LPlqgIc9v0X0uj4SIsVRtOLspXna3fIIg3s0KRF9Vqd4hivxkfBFMS4iw6uwzNAdFP5AiT/5AxW+RjDhkZaa4idVoj1DPm2XOzkuPg60yQHJpbcNp3OoptXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by DM6PR11MB4659.namprd11.prod.outlook.com (2603:10b6:5:2a5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 16:03:22 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 16:03:22 +0000
Message-ID: <08f674ce-c37a-45f6-80fe-2516c0205f60@intel.com>
Date: Tue, 16 Jun 2026 19:03:17 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] i3c: mipi-i3c-hci: Use named initializers for
 platform_device_id's .driver_data
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
	<u.kleine-koenig@baylibre.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>
CC: Frank Li <Frank.Li@nxp.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <7c006616f72748fb4deccd197ca2b6427c006f79.1781620397.git.ukleinek@kernel.org>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <7c006616f72748fb4deccd197ca2b6427c006f79.1781620397.git.ukleinek@kernel.org>
X-ClientProxiedBy: DUZPR01CA0219.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::16) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|DM6PR11MB4659:EE_
X-MS-Office365-Filtering-Correlation-Id: 587507cd-a65a-489c-3764-08decbc0ca0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|5023799004|18002099003|56012099006|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info: RNzDCoryHdsykl+QfJMhgIvHi1FjCn2QOKjRESdF6Rdrn7m5RCydlKA5v+Aa8T0C0GS/CcDNbMrOgvqeE6qVPve2rVE30WGgA9AzIYGXjZcFEZWWF2HkKcNypsnnqI/mcJT/uP0EJBlsSKwOAinfReRJoLUF3fzfU7p6I04Xfr927zXmtSdqYn8ph5LB5F8wR0OA2xsznvSsnjGUtel34Zl6m6x+Yrwb0Ja1aNV5qWaZen5P2jL7Z77z0Zx42H4dgB8mlyFdJ6GloeP5q2CbfswxYy9hDzdE4Oic5Ni+oAS3FbtzKlxCVeaSaAOQ3Is5/Js5giXFZqiA6pJghLXoPgG6MiefSv4MzW/+ZUVhC4Pa2nP+O2hcGUsOp2ZkYlQ/6OZSStihhmpX/bjX9Vq1XgMlgiO14mLvxtHRJXKFwbSFAaxAijSol7GYBj0fOCyoJPPx/W02BAKlYSCgU1n8F6vjX1e6cptvg+M0iwwGk8oblhbVtsjUKv1GHsPMpET//J8x9mSo+Pl8wE16iJrJxaxzkejP6EnjRUivBLczWJNGSqSkHR3Mv2N0gAgk9sxMlyVMe3BEz1PSCUhDDEM9/VMvCEcIKlNKMSWh92Vixhu26XkThv9p+be2x4mGUWuFQK6cKn3HB6N8flcgqd21UkpbTSmslaEA36jzRMxy496vuRKSijBw5jUILIarmx/T
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(5023799004)(18002099003)(56012099006)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S051N0c3NjNpN0tOaHNyM3NkSEpsdUxiMWorVy9ka1hxV2tCbklkaVdCaHV0?=
 =?utf-8?B?R3hWMU9OM2k5N3lmSWpEMGNuekRXd0hXbngvNGhCZy9YZFFkblo4cmlpQjFk?=
 =?utf-8?B?UmVSblZZNXV6Vld6LzBUcGR6TlpIT2hlOFdDZDYzR3VkZkprWWFXcVVXcTZI?=
 =?utf-8?B?cnFJTU9lMXpSM3F3bWU5bGVLWmxJc0JpS0ltMHpRZTlhUHJhQ2R5TzNvd0FI?=
 =?utf-8?B?dlVKOU0rc09EM09vN2Y1U2xHOWRLbFFtRzRldDhxbkdvazU5MDZSWlpWZDRu?=
 =?utf-8?B?MzVUN2pQUThoNFVSbEZvdzdCRStVSktCOHdLb1g3YVVuNFlLcU42d2kxREhT?=
 =?utf-8?B?ckdwRjhFRHdleXc1dElXV2VwSnRaNy9hTzJCVG9yN2ord1lwVVk4S3NEaGhP?=
 =?utf-8?B?WnBRZWg2VUFRS0padnREL21EQ01iMkxQZ1VPL09nOElJWnN3bDdjUmVVYm9E?=
 =?utf-8?B?Z1QyWC9rYW15T3QrdXNCOU81KzVUMVFRVStVY21zdDJEQUJLVXJ6MjRiY3Rl?=
 =?utf-8?B?aXlsVVBwZld0WE1yYnZIb1NNRWVkU2pSdi9zYk9DRWhaVGEyemNCWjN1cjFF?=
 =?utf-8?B?Ukc3RnhhMjlGd2VtajdXbjVsamNHV2tGUWNzVHlsQ2JUeSt2d2o3YWZnL0RH?=
 =?utf-8?B?U0xuK3FRbExzMUVwQTk5REhUa1ZKNHk2NEE5b0FKalJObXRxU1lYdUI1Q2Rh?=
 =?utf-8?B?ZUJOUHgzT0cxemRWNlcySmRpaFE3SE5neGlMK3lzcWJrY3JxakZTMHpZNmJQ?=
 =?utf-8?B?b2N3VjMybjJCRGVWeW1zaGpKU1VhNm1ISVVzRlBYbVcyQUU3V0MwTlpCdGVn?=
 =?utf-8?B?RWpqOHNJR1B6NHpNenY1L2xIQXVkdnVGTnAwMzNJOWhlZHVpNHRDN2hQdEc3?=
 =?utf-8?B?dkhXNjlxZnN4dWwwN0ZkYXc3SlRvZ05CWDdNZi9Va1Zoc2lOV0Z2Vml4S0xW?=
 =?utf-8?B?eGcyc0M4U3Y0bUVCOGdXUkNKMHdNSnRpb056NWpmODgyUTJQU1VBTkFhdGUr?=
 =?utf-8?B?bC9yTktJR2xuQ0Nxb2tQVFZMVlBqWnV6b2NvdHMwVEd3eU5YMFNWR3BnajYw?=
 =?utf-8?B?RlpFT0ZPSi9uTmovbDJ3aUttUmQ1cUdxU1JhUVZDU2gyTUw0UkNjYWxNcTQ2?=
 =?utf-8?B?cTl2aU5QN1dJM0YxN3BvOUdhOXlpNEloUkRmdjc2TzlMcnIwZFdwblVoZEtj?=
 =?utf-8?B?YVFCTnhObHRweUp6M1h6N2UvdlVZWGg1Zlp0dWlxOHdLNDZZSzFJQW51a09I?=
 =?utf-8?B?aXVsWmNBUU50RTl4Y1JDb0pZbWxobEFNSUZTaDEyK3N0S1NJM2x6RVV3RUsz?=
 =?utf-8?B?R1pMU1N5bE01THdneW1jWm1rb2dpK2JoRGYzbm9GbkQwUjdIZWVoeldNUEtV?=
 =?utf-8?B?VjJsSjNJem9XMDRVbXU0MnA5WnUxVXk0eEltcjVRR2JIcUV3MTRhSUJEREZa?=
 =?utf-8?B?czRHQXArRzFDZFdxTFh3WXVvZWJkRkRDRHg5Tjd1RXBiSTc1UG5CWm5YWmhx?=
 =?utf-8?B?c3N5cHI4SEhtYmlaNDJnQ2tHS2Vsdzh6RU5BSWQ2OS85NTVhbVY2RStUeXNM?=
 =?utf-8?B?djFiajJpdkxQOGg2dHc1ZjFQU2FyNkNWeW1MYndqOTROWE9aVHJlWm1saVZ1?=
 =?utf-8?B?bVRxR0ZXRm1ickltQmIwVFNsQjRLTnZlQzFpUG5lS014NmdrOERSOU1DOUky?=
 =?utf-8?B?bXY5dTIxUXZ5WnNDNUdoNExrZFJEaXRlU0ZyVitDbUozL0ZCRWxNVFdleUcr?=
 =?utf-8?B?YW0rUlZUM3dValhFQnc3MXdsUWxjOGI5d1dLb0dvdTBEVXNubHhYclZaREZS?=
 =?utf-8?B?dkt1Z0hMSzFiUVRKU0t5SE00UTNrZGYvRmJHTVJ2UzhvN09JWjN1UHB1OC9K?=
 =?utf-8?B?UkNhK1ZYeGh3THVaTEl6U3pZNk5sbEpzN0wrQWVYQytQSnZkY2hENDNidW9v?=
 =?utf-8?B?Z0JwcWg4VzA1M01Ycm45TnBZZUI4aWtJTEdLODUyQVBNTGFGYmtnVWdyN1Ni?=
 =?utf-8?B?aW00QTVHYWVORXAxTjhEVHhzRXBVMWNoNlY2dEhzaHBRWDZNZHVwdTBvbHVJ?=
 =?utf-8?B?VWdRWDA1ZjMyMnI1ajBEZkpNdjFzSUhHM0xuYlBLNlRqTlJVUmFXaWlqWXlz?=
 =?utf-8?B?c3dVNVNMTjhONi9XMGRqSUpLSmNXTm9QdTdPZzVFLzhBVGo5OG5PTzFsSk1E?=
 =?utf-8?B?NUhnQ091L0RYY3l5dmRVWEx3cjdtKzd4ZGpEZXBEekhKcWhjNG5oSlJJWnpQ?=
 =?utf-8?B?bVI0cnBSOTYvMTVZMGJHeHdFMXFKVUhOL3l2YjRTa1NEcE5zeG9sQzJYWmJm?=
 =?utf-8?B?cW5HbXVRMys4NmpFOVdCM2o0eUJsazBXODVDWUJMYXltZlB0TWZSSGR1Wnkw?=
 =?utf-8?Q?HdWQKvaVmEDoQTnI=3D?=
X-Exchange-RoutingPolicyChecked: MmwxnqeDWYDpn2Ey/qm2yZ9qttvIfiZ4F0Gk4oj21MBka6ihCP4fMqHA3/HwRilW6HVXlUwjPPxj5rLiy2xn6J+Kh3QoxkMLAgrorfQnJaK2527TRXJHgu+HWUCMVOGcDpQfmgkOMNirg22SklycxSe7dnddHbq3j0yz9TqGCbVSnFfGPsqp+BcyjMCFAa5gy6AGztwiUKCxZZ7aaFUgze7GjLkzpkpHoJYPwmTwXQNORPwMwRfutuyOf+tgXloVvMXtRBvsH1OMSlSVbkS5tbv0YbevIKglxVFlZkhQOUVSjuWvZiU8x7+Z6NEoJLjdkeBY3p51dohos1ju8NGvhQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 587507cd-a65a-489c-3764-08decbc0ca0f
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 16:03:22.0351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8kuCvkTlJNrsDOf9XlZAnbOZdXwQdrlJcpk4zpbuKYyf0PpJODfjot3JnA8Klv/il370lfRMj/znYfdFYWereg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4659
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_090331_783820_47DE764F 
X-CRM114-Status: GOOD (  16.44  )
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

T24gMTYvMDYvMjAyNiAxNzozNCwgVXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yikg
d3JvdGU6Cj4gVGhlIGFzc2lnbm1lbnQgaW4gdGhpcyBkcml2ZXIgdXNlcyBhIG1peGVkIHdheSB0
byBpbml0aWFsaXplIHRoZQo+IHBsYXRmb3JtX2RldmljZV9pZCBhcnJheS4gLm5hbWUgaXMgYXNz
aWduZWQgYnkgbmFtZSBhbmQgLmRyaXZlcl9kYXRhIGJ5Cj4gcG9zaXRpb24uIFVuaWZ5IHRoYXQg
dG8gdXNlIG5hbWVkIGFzc2lnbm1lbnQgZm9yIGJvdGggc3RydWN0IG1lbWJlcnMuCj4gVGhpcyBp
cyBuZWVkZWQgZm9yIGEgcGxhbm5lZCBjaGFuZ2UgdG8gc3RydWN0IHBsYXRmb3JtX2RldmljZV9p
ZAo+IHJlcGxhY2luZyAuZHJpdmVyX2RhdGEgYnkgYW4gYW5vbnltb3VzIHVuaW9uLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIChUaGUgQ2FwYWJsZSBIdWIpIDx1LmtsZWlu
ZS1rb2VuaWdAYmF5bGlicmUuY29tPgoKUmV2aWV3ZWQtYnk6IEFkcmlhbiBIdW50ZXIgPGFkcmlh
bi5odW50ZXJAaW50ZWwuY29tPgoKPiAtLS0KPiAgZHJpdmVycy9pM2MvbWFzdGVyL21pcGktaTNj
LWhjaS9jb3JlLmMgfCAxMyArKysrKysrKy0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2Vy
dGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21h
c3Rlci9taXBpLWkzYy1oY2kvY29yZS5jIGIvZHJpdmVycy9pM2MvbWFzdGVyL21pcGktaTNjLWhj
aS9jb3JlLmMKPiBpbmRleCAzYTNhOWEzZDRkZWMuLmU4MGFhMWY1NzIyZSAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNpL2NvcmUuYwo+ICsrKyBiL2RyaXZlcnMv
aTNjL21hc3Rlci9taXBpLWkzYy1oY2kvY29yZS5jCj4gQEAgLTExODksMTEgKzExODksMTQgQEAg
c3RhdGljIGNvbnN0IHN0cnVjdCBhY3BpX2RldmljZV9pZCBpM2NfaGNpX2FjcGlfbWF0Y2hbXSA9
IHsKPiAgTU9EVUxFX0RFVklDRV9UQUJMRShhY3BpLCBpM2NfaGNpX2FjcGlfbWF0Y2gpOwo+ICAK
PiAgc3RhdGljIGNvbnN0IHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2VfaWQgaTNjX2hjaV9kcml2ZXJf
aWRzW10gPSB7Cj4gLQl7IC5uYW1lID0gImludGVsLWxwc3MtaTNjIiwgSENJX1FVSVJLX1JQTV9B
TExPV0VEIHwKPiAtCQkJCSAgICBIQ0lfUVVJUktfUlBNX0lCSV9BTExPV0VEIHwKPiAtCQkJCSAg
ICBIQ0lfUVVJUktfUlBNX1BBUkVOVF9NQU5BR0VEIHwKPiAtCQkJCSAgICBIQ0lfUVVJUktfRE1B
X0FCT1JUX1JFUVVJUkVTX1BJT19SRVNFVCB8Cj4gLQkJCQkgICAgSENJX1FVSVJLX0RNQV9SRVFV
SVJFU19IQ19BQk9SVCB9LAo+ICsJewo+ICsJCS5uYW1lID0gImludGVsLWxwc3MtaTNjIiwKPiAr
CQkuZHJpdmVyX2RhdGEgPSBIQ0lfUVVJUktfUlBNX0FMTE9XRUQgfAo+ICsJCQlIQ0lfUVVJUktf
UlBNX0lCSV9BTExPV0VEIHwKPiArCQkJSENJX1FVSVJLX1JQTV9QQVJFTlRfTUFOQUdFRCB8Cj4g
KwkJCUhDSV9RVUlSS19ETUFfQUJPUlRfUkVRVUlSRVNfUElPX1JFU0VUIHwKPiArCQkJSENJX1FV
SVJLX0RNQV9SRVFVSVJFU19IQ19BQk9SVCwKPiArCX0sCj4gIAl7IC8qIHNlbnRpbmVsICovIH0K
PiAgfTsKPiAgTU9EVUxFX0RFVklDRV9UQUJMRShwbGF0Zm9ybSwgaTNjX2hjaV9kcml2ZXJfaWRz
KTsKPiAKPiBiYXNlLWNvbW1pdDogOGQ2ZGJiYmUzYmE2MmRlMGE2M2U5NjJlZTAwNGFmYjg0OGM4
ZTNhYwoKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
aTNjCg==
