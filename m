Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86FD9CD37B6
	for <linux-i3c@archiver.kernel.org>; Wed, 13 May 2026 05:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=5RG1uWySBybvyQAZf+p1HnIHrQua0w4BRNlGuJ9AC8U=; b=KvUhOYHskJTZgxD67aB42x1GqY
	y1YZvuS0llRUiYcdsolTkqvw9IzDm1rWRnHkjx8VR6alarLEb46dfH1nftTrJbQfO64yYEYTZYx8u
	ggGV/NeCWkFkq6g8HPEAKlnoB+MfnbEYtCB+J8I1AfEGkkPdu+Jc6VHR8Aikp7UKLwIQJKSNwVaCW
	5B+31qPTtQVfAWcojZYauXvR5tXeTHDeTITfImfcrEW7QxX35VKejKiVh9aNuv2TfmpiZg/GwZKy7
	Q7WEsmqgPsHyPvfWYJpTLrI3MwwZxg7xDCNeZWkEVDetopGiW6ZmwsY6gZfmT7V2lKgzEPpqe1mBf
	n+zjYPtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN1ij-00000001HEc-0iIL;
	Wed, 13 May 2026 05:01:21 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN1id-00000001HCL-0dB9
	for linux-i3c@lists.infradead.org;
	Wed, 13 May 2026 05:01:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778648475; x=1810184475;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=dgfSDYqczt40A8ZA9gZz8tWDsQmmn1OwicX+JYE5H/Y=;
  b=Tung70DuRkyWi42Ch5anjQo7T0jmAxwCSMcx271IOYty5GU6x9/HCmwg
   DUuOqqlXdtfN4Il9C8E3ESmmDbrsJ8vx3iyNRPq5gs19EtE+nMrGGNWrB
   V66ZbhgWv55S8yjz0DpK4qQ7as+PTnspTHnkqTEMRvmaU8U+GgZjEp/Yh
   VlmWNP3065hbMrAjvTuZirBxmUM7dR6U1h+4xjzhmcEV1B2mxZqv9shOK
   0CFdKoKKkJhWYXAu5YoCo56A/yLQ+zMvSrELfMWCZxZirCGkdQrCZq1V1
   El5KtQuP2dX0Vkt/TdEAE+WyCtZ3/TgWcVZfEOvcRMuhl4RrLpncr5545
   A==;
X-CSE-ConnectionGUID: JBm7ZUvZSz20gjSSRtrx4Q==
X-CSE-MsgGUID: BaxBtMMMSLKeTZEUl6IGtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79422374"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="79422374"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 22:01:11 -0700
X-CSE-ConnectionGUID: AR5RamXVTVG0Bo2MgfCSUw==
X-CSE-MsgGUID: jjVePjnMT8eSYoAEC8gEXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="231584675"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 22:01:11 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 12 May 2026 22:01:11 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 12 May 2026 22:01:11 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.49) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 12 May 2026 22:01:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PEdsCkT3VOW5aaY3WWNmDPGvQAW01S2WQH78qglzJCl6tE8LZ0MhJnNuSVNP/kM5RqgTHW/9YuIWu55Coe3+ewyhorYD3cNtZm0LU9gOH/iI8RHfIDQXtdFkFrdt9gww0X2SRWpkpbHpdbdC7pRA4YKiXXEWmDU5A+3B8XNTlLplckOqQM8k/VBC1cYVCPFuK4x3mj0/aikcTGXZqXkp8qBCmwqG3pQoZRqV4H10Nw5vd4qjQ+N2cdQP+SakKQ2cWC0OS9SKlRVIu/AzCzzOr/gnIASLZMLcLZzHZQiyyO6MeWu9yQDPKCbjx7k3p7G2cCl+rlVCtzeVtgiT6nUNsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yCCFdc72mScJI/Ja+oTI/0KcLrIhWRzRZkrBHAhtsu0=;
 b=KxT91PzP2fuYd9WCgVqDHiSapHwUE8KNr5MrUGf15VxKUBrIeroYvcLr532cFcJRpX9ILevxk5U3yDcnNZIWc26i4n/1p5fSvh4OD1iiP4jFIH/XfMJInyzgJCxiIyh0p89lV0C3o4I5dwFgF7pWbHX955OSvGzp1Fnp6Rcg0ud2ENnDyhhhD21QZqQIDO46l9AIUlFmJ43zq+npy79LRtzyyWSx21ZaV1XWl5u58CxgQo8e1Bt9lPbSxBNXKMUmo5aGF7WFguWT+SJSRYq2u8oQRyUQKOqMN03un6mFGFrFu7WSy9rDynPE49Dp9L0ShC7Ko/nPy3i59QyXGB2GQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by DS4PPF990BCE628.namprd11.prod.outlook.com (2603:10b6:f:fc02::3d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 05:01:06 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.20.9891.021; Wed, 13 May 2026
 05:01:06 +0000
Message-ID: <571f1f5e-544e-4c1b-8ed1-4ddf6bfa9493@intel.com>
Date: Wed, 13 May 2026 08:01:02 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] i3c: master: Serialize i3c_set_hotjoin() with the
 maintenance lock
To: =?UTF-8?Q?David_Nystr=C3=B6m?= <david.nystrom@est.tech>, Frank Li
	<Frank.li@nxp.com>
CC: <alexandre.belloni@bootlin.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20260512121732.406009-1-adrian.hunter@intel.com>
 <20260512121732.406009-3-adrian.hunter@intel.com>
 <agNRR1wHi_FhHf4u@lizhi-Precision-Tower-5810>
 <e43cf38f-7878-b112-930a-0f9d3e34a842@est.tech>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <e43cf38f-7878-b112-930a-0f9d3e34a842@est.tech>
X-ClientProxiedBy: DU7P191CA0030.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:54e::15) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|DS4PPF990BCE628:EE_
X-MS-Office365-Filtering-Correlation-Id: a4ada3c7-1f13-4b6e-2a80-08deb0aca3c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003|11063799003;
X-Microsoft-Antispam-Message-Info: yJmqDfvZGgJY/E7J5t83SUn9FiwFVdJQjhF1c92pVeQaoDh90ocLdQE2O4Lui2M8oslqiRtpl4cyRMZL44LHI3YgZR525PWPgL7uJwPyticlSu26sWaSaHaYql3kjsIXHHqpI4zW6fDwmY3i/nvht4+9Gu4Ro5FCs04vxTqmxZc1X7r6i42MeuxXWEtR8BEyr2N9/PVlEm4Mesk0Z7vVfJX/q3v7XaD/GTKnoG2fa1DxD7b4RdjBxWJk1MWrVVfiLoSj4eHKwcj7wenCVHegcOHle+gM3T0vXmebez4l3GyFhINplyBu2K59vwMNZ7MtIo+A8yuvKTZ+TCOe+hltR967bJeMwIbA+b9BKIIFelnZLVvbplvrxKPgt8Kt+ip26cO8F1ptXkER3BVibeScWNhgCo3ZIQs6ehmhEBdXZsRpIvZGA6omaL92exlksJRIVH+4IPjnqn+qCebOUwL3DAP3VaUInoSB6ytKHuUzoSIIgqb22R2gVNHPQ1bGe2bGFE3jIwwXus7cdtxn2X1oyzl73aonStzJAemNDjhmWGQTCGNgi5t+WOQIHr3j2KQtKasgJ2DW1dy/RqqigIpYyvSrDWz5dD6Cj+AMtOfzLIEJ2IK9a8FjHFUKZB4AJ9IWsdzrlawm5l4uUKVFoRatcOYoLReJgSISNSJmylGBdLOSTzWowa9KVwlKTJi8grFa6cflF7eB7amnV1Duyzu8bg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjlBWU5heGVuUzUrV21UQ0NFT29ZbjJuSXgxeGRwcWxIVlR1dHVRWUZkVFBa?=
 =?utf-8?B?VTF6TkJOQlhOL0lGalcwdWJ5dG5wVGRjdWJ0b3BSMkdIZWRoZnVxdWxDTkdn?=
 =?utf-8?B?T2V4eEtLb2thSzZIRlZyV21HM3dzTWViNE1aZWpheHdVbW03SlkzcnJnSytV?=
 =?utf-8?B?VlFkMEdXb05ab3pZSHRON1Urc3F3cFNNZnE3NnVPSkxxODhqd3ppRlZrNlZ4?=
 =?utf-8?B?M2ZCRFp6VkRsbGRmWW1keVp4M2ZoWU9GYVR6bHBGZnhJRU1rN0VqemVYemg2?=
 =?utf-8?B?Nm1raGJ1NTBlMzRDY1BNREsxU29Xb3FTVUp1cURQS2h5dnZiUU1lOWZnREZK?=
 =?utf-8?B?QnBnNGV4V2ptRXRoREZSclVodTk2Zlh0bDBZOHlNcWMrYjliNld3d2o3RjQw?=
 =?utf-8?B?ano2dS9ZZlhpbENHaGJkK2lKMHpmUlpDYUlOdzFNUytIT2hOeXptN2dRMGRl?=
 =?utf-8?B?OEtTTUVWN3BGNlRSZTFoWVd3Si9vMlF3bmZrUmcramVjRmluWjFCb0pXNUI3?=
 =?utf-8?B?bnFhOVI1ZmZIemtQTmtrVGZMdVN2RXA5VVJ0R09MWWovRnk0T1JERlRFeTE1?=
 =?utf-8?B?Y0tLQXNXVldjc2tsakZQaElPZmJOTGF2SkFHNmwzSWdneEY2a3ZSR0pwQmtz?=
 =?utf-8?B?VmVxU05TRjMyQ3htMHBjbFpJTzBobFdIaDRLNDM3RUdXOVN1WjBCam1lKzRa?=
 =?utf-8?B?Q3hLQit5dW1OZTNHUmp1VGVFbkdOMThudnpzZStUbVc5Qllrek9odFllQ1BJ?=
 =?utf-8?B?KzBkKzhHR3dNN1NFWTJQZlBPeUgzMHI5b09BVTRtMUpVSUVmaGZIMGJFWGhw?=
 =?utf-8?B?ZnBMdTBmMHBxV3kyQTl0ekp4NUl4QUprMTBzMlNXd2Rac05wc2xQNG5NUkNl?=
 =?utf-8?B?eTZoK0t1VVd6SXRhWUVVNGl6NjZXMUR2NzJ3aXF5TklVYVQ3N0NocU4wUzk5?=
 =?utf-8?B?YmIvMWxoM2tsVnpXMkx4aGU2Z3BMZWNvUHp0NmlYSTNqNjg3MUJaN04vQzJa?=
 =?utf-8?B?WHhvNkQzNkhSRDArUjBqWWY3bW5YQ1dRSm53U0JONTZxNXBqNW9wN1FzV3Nx?=
 =?utf-8?B?N1JHb1FUczBCaGlhZWU2djlhZURyZzdnTXBjV2hQOXpJQ1M0UnRQc1BTdGJG?=
 =?utf-8?B?ME1XL1lNWXAvQy93U09LcmF6UEZaZnpWeW1wUWU3WHAzK0FiNU41OTNOVUF6?=
 =?utf-8?B?d1BQdTdXTTQ1elFXTlQzV3RTU1huZWJPZERxMnN1N0ZCblhocVo5UGhaUUp3?=
 =?utf-8?B?SkVJL09EYW1XT3pDbzZTcCsyTEZ3Skp4VlJqWEpNNHp5SHhmUjBoWGFKMFZZ?=
 =?utf-8?B?bTFFQjBnOUZTV2ZuWVhJZGxYVVZmZkVkdVVpVnNHdW9rRkNEbGhZNXlsVkdo?=
 =?utf-8?B?b0ZFMkNOQ0RQZkFHaU9JcDA3THlyKzZHY1A0SzRPcGRPUG5jc2djeEpLZmRM?=
 =?utf-8?B?aXlZcmVMaldIUkdYbG9UbHh1STVjUlhVdzRGT09iNUQ5UlhoQy9ORyt3TlEy?=
 =?utf-8?B?VmI4ckw5T0xaYXEyYTRHRzIzc1psYlRadkhjbXNZdDJhZzNZL1VHVlN2UU5n?=
 =?utf-8?B?ZUtNbWZiLzkwRmRqTXZTZUgxeUdxZnEyVU81RkRLcFhnZVVGWjMvajB1YTNj?=
 =?utf-8?B?Nlhqa2czQXVRSDFQa05OWVR2czdwSXVlZExEZ2ozRmI4b0NVMEVFNytIK2hE?=
 =?utf-8?B?a0NQd2VSTUVIK2hhR0d6M3Q3cElCOVNJTG1EZVdkOXhlSVNYWXlCNGFXTmpo?=
 =?utf-8?B?NnJLWlpyVlhlUjNMUm9iWXdhQVRVWFNzLzJDL2N5ZlJUQlNINkg2TzFMcUJS?=
 =?utf-8?B?bWNZZVEyUHMxbHhONmkxTnZBbWdUVFZGS1pMTmRqSnFHYy9KZGlSYnJBa3dq?=
 =?utf-8?B?Qk0vYWk2aGNMbGRIcFpjZ2R3dG5DcFNPRHY5SGZsZ1EwbkVBekhFYnY0azRq?=
 =?utf-8?B?U2t3cHJ1YkZQRXJtUE5ud1lRdWtXZG9OdnpBZUFPRXZLR2t5dThKd1V1ZlYv?=
 =?utf-8?B?SFcxaFVNOEFSZVN5VHlCKzkwampVQ1h3MVR5bGEyV3VEVmY1bTdCVkRxSlQx?=
 =?utf-8?B?QTRQdFpFaWFKVW5BY0duTmVXOENIN25ZTDBaS3d6ZjNmZmUyTWh3R0x2ZzJT?=
 =?utf-8?B?V2ZBNUx3dFFRanlHbE1TOEpmM0JBaVQ5cG44WE5LYjk4N01OeUZqTEY4dFZl?=
 =?utf-8?B?STJiRStzY2diQ2pwNnhnVWNpS0IrVTVqSWY5K1RhRzEzZEdzZEhYVVpsbjE5?=
 =?utf-8?B?cGh3MllmMlQ2R2FDODY4ZCtQWGtFZGlnM1MwOFRMWWJ0Uy9HMER5V0JVRTV6?=
 =?utf-8?B?TFhqQkc2d1A0Wml6THdkVkFUYmhsM3NkVmNYb1JuTDZaRmtpMDhFNkNnRCtO?=
 =?utf-8?Q?vqP+Ym52xaxrCa6U=3D?=
X-Exchange-RoutingPolicyChecked: bRQIE7RSlpit4QRxKICYUPpb4dPMkls+fl2NYIgbXjYV5RyVzQxAhy174UuKKEyizOtASoetmZmqikrJ/E+EQ+nRupzhqzxMPzgJVMS+aB7FU2al9ZoOkUQ9lraHYuocZ4KusoGTJ5MOaQvxqR1v449x8bTfD3LHKCQpB22wM5w43W+EIA6RuldOZ6qELq3wf4zFa7PE5wIcM6Fb0ENZj19rb/Bh1zTOl3/G4ZOLKSIomyt5M1qUYV3Qq8g2wFioSpe5pdpEbNsXq3OBfnTGfSqVp1XisXsrcKwrsy0ZIsGwjgp5gYbPb2k7VWhSGMicD1lpyMghq88oNHSN5iTgSA==
X-MS-Exchange-CrossTenant-Network-Message-Id: a4ada3c7-1f13-4b6e-2a80-08deb0aca3c2
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 05:01:06.3655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dwMESNDSyyb7c24YVcBn19BTM1jDTbwKFfNn3nl8fI9TwhJuikSE5/WQvuxwc9GrQKV8wTZLuWHKp2Z30jZrCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF990BCE628
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_220115_447286_F672FF32 
X-CRM114-Status: GOOD (  14.04  )
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

T24gMTIvMDUvMjAyNiAyMjo0MiwgRGF2aWQgTnlzdHLDtm0gd3JvdGU6Cj4gCj4gCj4gT24gVHVl
LCAxMiBNYXkgMjAyNiwgRnJhbmsgTGkgd3JvdGU6Cj4gCj4+IE9uIFR1ZSwgTWF5IDEyLCAyMDI2
IGF0IDAzOjE3OjI2UE0gKzAzMDAsIEFkcmlhbiBIdW50ZXIgd3JvdGU6Cj4+PiBpM2Nfc2V0X2hv
dGpvaW4oKSBkaXNwYXRjaGVzIHRoZSBjb250cm9sbGVyJ3MgZW5hYmxlX2hvdGpvaW4oKSBvcgo+
Pj4gZGlzYWJsZV9ob3Rqb2luKCkgb3AgYW5kIHVwZGF0ZXMgbWFzdGVyLT5ob3Rqb2luIHVuZGVy
Cj4+PiBpM2NfYnVzX25vcm1hbHVzZV9sb2NrKCkuIFRoYXQgbG9jayBpcyBhIHJlYWQtc2lkZSBh
Y3F1aXNpdGlvbiBvZgo+Pj4gYnVzLT5sb2NrIChkb3duX3JlYWQoKSksIHNvIGl0IGRvZXMgbm90
IGV4Y2x1ZGUgY29uY3VycmVudCBjYWxsZXJzLgo+Pj4KPj4+IFRoZSBob3Rqb2luIHN5c2ZzIGF0
dHJpYnV0ZSBjYW4gYmUgb3BlbmVkIG11bHRpcGxlIHRpbWVzLCBhbmQgd3JpdGVzCj4+PiB0aHJv
dWdoIGRpZmZlcmVudCBvcGVucyBhcmUgbm90IHNlcmlhbGl6ZWQuwqAgVHdvIGNvbmN1cnJlbnQg
d3JpdGVycwo+Pj4gdG8gImhvdGpvaW4iIGNhbiB0aGVyZWZvcmUgcmFjZSBpbiBpM2Nfc2V0X2hv
dGpvaW4oKSwgd2l0aCB0aGUKPj4+IGNvbnRyb2xsZXIgb3AgYW5kIHRoZSBtYXN0ZXItPmhvdGpv
aW4gc3RvcmUgZnJvbSBvbmUgY2FsbCBpbnRlcmxlYXZpbmcKPj4+IHdpdGggdGhlIG90aGVyLsKg
IFRoZSBoYXJkd2FyZSBlbmFibGUvZGlzYWJsZSBzdGF0ZSBhbmQgdGhlIHZhbHVlIHJlcG9ydGVk
Cj4+PiBieSBob3Rqb2luX3Nob3coKSBjYW4gZW5kIHVwIG91dCBvZiBzeW5jLgo+Pj4KPj4+IFRh
a2UgaTNjX2J1c19tYWludGVuYW5jZV9sb2NrKCkgaW5zdGVhZC4gVG9nZ2xpbmcgSG90IEpvaW4g
ZW5hYmxlCj4+PiBjaGFuZ2VzIGJ1cyBzdGF0ZSBhbmQgaXMgY29uY2VwdHVhbGx5IGEgbWFpbnRl
bmFuY2Ugb3BlcmF0aW9uLCBzbyB0aGUKPj4+IHdyaXRlLXNpZGUgYWNxdWlzaXRpb24gb2YgYnVz
LT5sb2NrIGlzIHRoZSBhcHByb3ByaWF0ZSBsb2NrIGFuZAo+Pj4gc2VyaWFsaXplcyBjb25jdXJy
ZW50IGNhbGxlcnMgYWdhaW5zdCBlYWNoIG90aGVyIGFuZCBhZ2FpbnN0IG90aGVyCj4+PiBtYWlu
dGVuYW5jZSBvcGVyYXRpb25zLgo+Pgo+PiBJdCBzaG91bGQgYmUgYnVnIGZpeCwgYWRkIGZpeCB0
YWcgaGVyZS4KPiAKPiBBZ3JlZWQsIEZpeGVzOiAiaTNjOiBtYXN0ZXI6IEFkZCBzeXNmcyBvcHRp
b24gdG8gcmVzY2FuIGJ1cyB2aWEgZW50ZGFhIgo+IElzIHRoaXMgc2VyaWVzIGhlYWRlZCBmb3Ig
Ny4xLXJjMyA/IGlmIG5vdCwgaXRzIHByb2JhYmx5IHdpc2UgdG8gcmV2ZXJ0IHRoZSBzeXNmcyBh
ZGRpdGlvbiBmcm9tIDcuMS1yYwoKImkzYzogbWFzdGVyOiBBZGQgc3lzZnMgb3B0aW9uIHRvIHJl
c2NhbiBidXMgdmlhIGVudGRhYSIgYWRkZWQgImRvX2RhYSIuCiJob3Rqb2luIiBpcyBhIGRpZmZl
cmVudCBzeXNmcyBhdHRyaWJ1dGUuCgo+IAo+PiBGcmFuawo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6
IEFkcmlhbiBIdW50ZXIgPGFkcmlhbi5odW50ZXJAaW50ZWwuY29tPgo+Pj4gLS0tCj4+PiDCoGRy
aXZlcnMvaTNjL21hc3Rlci5jIHwgNCArKy0tCj4+PiDCoDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNj
L21hc3Rlci5jIGIvZHJpdmVycy9pM2MvbWFzdGVyLmMKPj4+IGluZGV4IGFiMTFlMmQ3OWFhYi4u
MzhmZmM4NzEzMTY3IDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9pM2MvbWFzdGVyLmMKPj4+ICsr
KyBiL2RyaXZlcnMvaTNjL21hc3Rlci5jCj4+PiBAQCAtNjQ5LDcgKzY0OSw3IEBAIHN0YXRpYyBp
bnQgaTNjX3NldF9ob3Rqb2luKHN0cnVjdCBpM2NfbWFzdGVyX2NvbnRyb2xsZXIgKm1hc3Rlciwg
Ym9vbCBlbmFibGUpCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsKPj4+
IMKgwqDCoMKgIH0KPj4+Cj4+PiAtwqDCoMKgIGkzY19idXNfbm9ybWFsdXNlX2xvY2soJm1hc3Rl
ci0+YnVzKTsKPj4+ICvCoMKgwqAgaTNjX2J1c19tYWludGVuYW5jZV9sb2NrKCZtYXN0ZXItPmJ1
cyk7Cj4+Pgo+Pj4gwqDCoMKgwqAgaWYgKGVuYWJsZSkKPj4+IMKgwqDCoMKgwqDCoMKgwqAgcmV0
ID0gbWFzdGVyLT5vcHMtPmVuYWJsZV9ob3Rqb2luKG1hc3Rlcik7Cj4+PiBAQCAtNjU5LDcgKzY1
OSw3IEBAIHN0YXRpYyBpbnQgaTNjX3NldF9ob3Rqb2luKHN0cnVjdCBpM2NfbWFzdGVyX2NvbnRy
b2xsZXIgKm1hc3RlciwgYm9vbCBlbmFibGUpCj4+PiDCoMKgwqDCoCBpZiAoIXJldCkKPj4+IMKg
wqDCoMKgwqDCoMKgwqAgbWFzdGVyLT5ob3Rqb2luID0gZW5hYmxlOwo+Pj4KPj4+IC3CoMKgwqAg
aTNjX2J1c19ub3JtYWx1c2VfdW5sb2NrKCZtYXN0ZXItPmJ1cyk7Cj4+PiArwqDCoMKgIGkzY19i
dXNfbWFpbnRlbmFuY2VfdW5sb2NrKCZtYXN0ZXItPmJ1cyk7Cj4+Pgo+Pj4gwqDCoMKgwqAgaWYg
KChlbmFibGUgJiYgcmV0KSB8fCAoIWVuYWJsZSAmJiAhcmV0KSB8fCBtYXN0ZXItPnJwbV9pYmlf
YWxsb3dlZCkKPj4+IMKgwqDCoMKgwqDCoMKgwqAgaTNjX21hc3Rlcl9ycG1fcHV0KG1hc3Rlcik7
Cj4+PiAtLSAKPj4+IDIuNTEuMAo+Pj4KPj4KPj4gLS3CoAo+PiBsaW51eC1pM2MgbWFpbGluZyBs
aXN0Cj4+IGxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCj4+IGh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCj4+CgoKLS0gCmxpbnV4LWkzYyBt
YWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
