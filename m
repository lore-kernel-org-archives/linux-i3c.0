Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB36BD148BE
	for <linux-i3c@archiver.kernel.org>; Thu,  8 Jan 2026 08:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=o4pyihll4M0W85dqce0/VZEpnHN03IzZZfR9ZJOIpeE=; b=OeBSklGCOMceZSI0b3fV6Uq6Pd
	3wvkvcOytLo2DJeyZMuofYPRNhPCh60fZmuFwGogrt8e/wAVEtQoOHOTtSR6P6I31KOFtfr4vvgJQ
	AgYLuPKLj5+vncCLRwJQ4Gx3dAl6fvyWGFP1zKzXT94oFjGW7hDGcgLfFYglCk7BXtlEwEgr/pYMZ
	DUoGaEaaPBy2FfJITvRXxh2SKOzyZDUlnwuCpEX/l6uJsoCHxcTUc2HNOrSrJnD9vEMJPDA4wZAQs
	2XV9rkOMApcajES7VzC9d2LxEFjZDtNs2lu+/0hERt3OwGItQj7Oz8k6R47rbiDntQ6omgJf+OBdE
	zsQX0bYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdl0b-0000000GChE-26k2;
	Thu, 08 Jan 2026 08:04:41 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdl0Z-0000000GCgr-2Bzu
	for linux-i3c@lists.infradead.org;
	Thu, 08 Jan 2026 08:04:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767859479; x=1799395479;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=U5+wMz4rFS784PJnPEClwsUL7suwY5ilGVKivAzJK+I=;
  b=hG+XzWLbIspbm/tFJkxJvxxAhUO+tuxXlX1S3Q5lepp6VnOa54vefOEE
   WfJZhEko5hmeFm4AAwM8x3VvA++GiO8OIrpTLVNOr0y1o/3luvRPUUYpm
   zU8TE8xYYPF+NTrVblNBd6XepwDrTeaNTdWtH9k8WDpJ6dzF7gZ1z7hA8
   a40qU6L3yUrHSJwxPFurx8vad95bqZ72CHUN9QAWgfeFMT4RDFsVmkZxH
   BwISCy08zo497FQt2B6ZL+/EjZY7r8tmDD8QYUDLrhjH2/Z3zBepadKf2
   hVLwmACMBVoOhoAIkr4dYqOB2Dn1uzD84dgfUGiZBZycoeaa6kOZbwFeW
   Q==;
X-CSE-ConnectionGUID: gQCiSeiaSX2vZmb1JCXABA==
X-CSE-MsgGUID: DWLaPmitT3G5pwFevvhk3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="80596126"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="80596126"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:04:35 -0800
X-CSE-ConnectionGUID: GthB/xb2RsmGveVJzqTmYg==
X-CSE-MsgGUID: whLt3WILTNiuHw8dKVhrRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="203160081"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:04:35 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 00:04:34 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 8 Jan 2026 00:04:34 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.63) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 00:04:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EFC29uDkd2dZv9cSuaEZEzWRr5u8/JjhiiR23ozhf+XaWOq1m0kXaUIqJtJVsNoLikFIccDOjg6a1j9NZjF7uu9cBCg+YdbyupSSg9B4zboMk0+4mDmHy17TnbApSKIglx02bOgWcIc9SdCkTjctYT/sq2RejTV7+224YjYzW6AXdf5TJkjYj86vKTaZ0QRyZZdBN/RPEgtpu1qP7V6yHiwDmq7BdkxuY8F6KEGqaUGuhhL9JlyjuytGGDMumpL0xMQFD3QfE3SL3fHdXuOyxPSD1N4lkx/FFIhPsF1EW4Ge+m1TE5t85Z1coCA+nv8QxENwM2PRW8IfezJU2gwOLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SJKrnsZbaCCyB4IAd1mILE/AXdQ7gKABxjSyUSpnpMw=;
 b=n1SXSh89kDfalf+U2xoFPFMz1rRbDRPGhPO12boOG79cyIqAN7I44vQHJFY1wvttDNdOkKvDmA2nhBoNL32OTQUHcG7NB1dv78Mh6tJfxeu2UMb5erTjyKQpeenzS52CZFOUdiCCk5lcgf8GUzLcdLrfUP8OqqDVpr2dwUA42L9C/CumHRQlY1oHcoGLdOV3nx8mxOrGbD8aYti2E2z1OnuVVSSKos7/SGFJm1C96faazz6Laj/JdbjaSk7JVBEZ6mC8VZik0YOhtyAF2cEi2Bgu028hYuw/Balu0rzeBZbLSS+HZuF11NSpAMcj55ujm333LwmiKEx7Tr/BTF1Q2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by DM6PR11MB4740.namprd11.prod.outlook.com (2603:10b6:5:2ad::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Thu, 8 Jan
 2026 08:04:27 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 08:04:26 +0000
Message-ID: <cdf4a5c4-5483-43d7-8b26-a5090ac12b33@intel.com>
Date: Thu, 8 Jan 2026 10:04:22 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/17] i3c: mipi-i3c-hci: Manage DMA deallocation via
 devres action
To: Frank Li <Frank.li@nxp.com>
CC: <alexandre.belloni@bootlin.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Aniket <aniketmaurya@google.com>,
	<linux-i3c@lists.infradead.org>
References: <20251219144534.84391-1-adrian.hunter@intel.com>
 <20251219144534.84391-8-adrian.hunter@intel.com>
 <aUV+LTLg5dq/cjGK@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <aUV+LTLg5dq/cjGK@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: DB3PR06CA0036.eurprd06.prod.outlook.com (2603:10a6:8:1::49)
 To IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|DM6PR11MB4740:EE_
X-MS-Office365-Filtering-Correlation-Id: 044e43eb-2cb5-4fcb-cb79-08de4e8c8ada
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R3l0TmJRUXFYZnBPMi9FeW12QjRzUVJxYkdISVlXbjdTeDAyUklvWTZXZXUv?=
 =?utf-8?B?VGZDNXdTM3pDbTVnaHY2VEtLUGJVL0NRWmh1YTgzd0tyS2EzVjhLNlJsQ0dC?=
 =?utf-8?B?Z2tQSTlYdmpmYXZHZVg2ajlUQmpYeHJMNEhCRklralVKMVBjWlRwblpPdHhx?=
 =?utf-8?B?NE9PdTVHNjlwVTZBM3FBSEFxTWovWGJReGgxc0pKK1hoN0MzVmFCdDd4cnhC?=
 =?utf-8?B?K1VFV1E1ZDc5eDZubzdQdFRBTkx0dHI3SHd3NW1tUWduNUF6WU1VVkhpSXQ3?=
 =?utf-8?B?cUFVSnBUT2Q2WXFZSVFQenN5NVFKNFQzWUFLOXE4T0tMTUo2QjdyU1lvLyt2?=
 =?utf-8?B?N2hPR1UrUXdFWHFZWVo3Nk9uNnF0MmFka050VkNIMk5BTUJjS0pEdlR6VVZ5?=
 =?utf-8?B?bmtRUXJjTGpYZG5QaEx6YjJMQmc1ZzVuMlJreHF6cXV4VXA4NWIxVUNXTU1x?=
 =?utf-8?B?Q1BoKzI3TWFSaFVFQzE4VWdMZ21GWVZ3ZDV4M1p6Wm02TzhtOVRwRWpMMWkv?=
 =?utf-8?B?RDMzdG5ydGtjM2szenVuUGc0OU5hZ01oZkc0aG9ucWNkRFZBZ2czWmQ0K1Zo?=
 =?utf-8?B?Q0M3SmFoWTdTcmxLTDl5RUY4R0hibHdsY1JjOXVmSnRoVzRUSGVEVkxCOUZB?=
 =?utf-8?B?MnJBREFHMlBCdWdMeUNkVWs0bUJKZnlHRUZLbER1NzBpWHhRU1Ntbk8zVUdi?=
 =?utf-8?B?eWUvbXkxZlBnSWhpcWJLS0VzNmZQWTdiM0lnWUN0UEtuTndzc1hZWDRhNEpN?=
 =?utf-8?B?b20waFozSjB4V3h1ek9pTEhwLzJBNG5aazdISXJ2Wi9SQzdJcFFXNjBoVU1U?=
 =?utf-8?B?eGZoWklUVS9TUTU2VE1wNklzZ0lnTWRPdE40aGpBSU1VNnFJREh0OUNDMW44?=
 =?utf-8?B?NkRSNG4wNDVsN0p2bmRERkM3R0ZJazhmUGNMam5NTEs3Q2Vjc1NFMEttWHBL?=
 =?utf-8?B?NkYybzMra0J2NVE4WnZGY3FJVDZEMkpKYnJVSUhjSHR0N1ZJZUJYbkYvMVY4?=
 =?utf-8?B?aEQwZnV6NUJPQWRyVUpXUDJLVFNMam1qSWNyN0xsVnBzWGdxTUFRdlBVTVZ6?=
 =?utf-8?B?aXRzazRnb1ZBR2Z4QncvZ1VZQmFGR0dMbExIMkpiQTErSVQzOWp0UTNMYlE5?=
 =?utf-8?B?eHhxajJUWlg2R1NvbVdhS2Z1dmluZkNxQllndHFEZ1R5S00xVDZ1cUJQZ29l?=
 =?utf-8?B?T3hncDRCbjh1U0xIMjFtdG1UYVRVclh2dVJncFBKQ3ZySFAzV1RsWUhSdDRj?=
 =?utf-8?B?VUQxQnlnNzVObXNPbHhUYlFobGZJZ1NNYW90MGM1ZmFDMVcvRi9UNFNXVXhj?=
 =?utf-8?B?TG9yOFYrYjg3NnRUb3JMVzNXN3Jqc3JieHpMbzh3MDJISkR4QURRSi82YTdy?=
 =?utf-8?B?bXdxYkFLWGR1NFZSQW4vdWpEaFlhVng4ZFVSZmRMc0IxS2RvWnh1R1J2Z0xN?=
 =?utf-8?B?dmZtKzlxN0U1QjRwN3dlaDRodkptL0lGdVh5dkxnWUtUVGROVnlSUEt5eTVF?=
 =?utf-8?B?RjJHa3RVdjV2THlCV1VpaVVRU25sVUJ2bzJxb250a1Z4cmN4MUxpS2c0b1kx?=
 =?utf-8?B?WVBnS285L0Y0RWkwWXY5cjBrNDdxMEhyUm1McGFoUEdpaWVaYUwvRDkzLzBB?=
 =?utf-8?B?dWdtSktrbyswV2c0cFUrcnFBcExsRWszNFQ4OHpYUEI0N0RKRFNpTWNNMDZk?=
 =?utf-8?B?bzQ0U2tMT05lMFFER2YvNkh2WnR1bWRKeGlBSXJKWTc0aE5BRmZyQTBsM3cx?=
 =?utf-8?B?b1ZMLzc3KzZzZHRZbERKcFpuVWdIb0VIWDFhTmozRlBrdUJZVFd1a01Tdk5h?=
 =?utf-8?B?cGYvL0dQeG9MbmdoWGxNMzhhekNGbmJkSzdXVVdMODRMU1ZGZW9GT005OXAv?=
 =?utf-8?B?SHVJb1Z3azNRZFVWRlBQeWxJRnpYUXp1Zlk5czNZUWl5M3ZnWnVwcDB5VkdI?=
 =?utf-8?B?c1N6OUhHckl1cHY2aFd6OEYxcTdsUHpRTDZiakMxelBmdnBWMmJwVnB1VXRo?=
 =?utf-8?B?aG5QN1VYM1pRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUZWa0V4NGZXYTdLRlU3WEFxbExUdWtNQ2ZVaXcxZ1U4ejdmOHJ4MlAwRWQ0?=
 =?utf-8?B?eHhDMlE2emFwSG5aTTJzU3V6T1ZQNVpZdm1EbkJwaXJCZkc1MEU2b0JCb1ZJ?=
 =?utf-8?B?YWJuSTQvU2Z0ZmpkTFhicnBURkVuR2llSlEwYzVXTThMNmMycWoxRTVjZVpz?=
 =?utf-8?B?bEZFL3VmdGYvWVJkeUQwSVBBRDlZOUM2KzN6dGxmTHo3TkNHSzRZM2diTjRh?=
 =?utf-8?B?UFo5Y3dVRkdJUTlNN0cwU2FmUVBUclh1ekt6Y3hRNmM4ZWRZQVV3ajNVVmh5?=
 =?utf-8?B?SEhpZHB2RWJYTkkzeTlMdFBQSHlXZ1V2VmJMSzlCNWoyTVdDWmRkRndxbW96?=
 =?utf-8?B?MnNjKzkycmVCalhHb255RWUwc1dXaDJadEF2MzJhVmN1RVdNL2N5b2drSkhn?=
 =?utf-8?B?K01yRmN4bk5Hb1R3cHdpTTdnRjlFU2N1UWNQY0l4YzJ4NGhFSEp2ZVV0TTBa?=
 =?utf-8?B?N3VOeTUra2pjU1lhekJnRi8wUnNrOEFzN1pDbk5jV3J4MmFSNXBOTlY4MEph?=
 =?utf-8?B?SDZpZy9qcnc3WE9YMFdyUkVRMzRKTzlSRFFaeEsyMUNaMG1ra01mcXd2V2dV?=
 =?utf-8?B?TjhYaGErK2dneDA4eTAvUEszZFpHWldhTkFsQlF2ZWozMDNyZElwSExEQkly?=
 =?utf-8?B?VXlaZksrR1pJUnZTNy9KRjE1WDhrY3ZtZTFkNEhUOTJ0WVdRUkd2aXlEUUFL?=
 =?utf-8?B?bmRqYlZDM3FqUE0vdHUzYVZRbC9PZVJvMndYc1VMYmc3WExrV21EMGlOZDlM?=
 =?utf-8?B?bHAyOVF0SGxIMkNJdVI4bVFhZlJ3SEU5MkNtSnFwT0JSZGFZdlI4aVpmKzUv?=
 =?utf-8?B?Y25salU0d3VjNHUrSEtPcStDeVN0VlRGRXdLMmdueUFybHhmanJiU0hoRC9W?=
 =?utf-8?B?NTR4enMrWDdobWcwZlVWRVROelYxa0lNZFREU3k0T0lDRWo5dlZWVTZNdkNO?=
 =?utf-8?B?S1d6dWZEUDgyZzF1dVJLNXQ3K3UzWno0ekh5R054VzNUS29iUDdjR1J1QzJH?=
 =?utf-8?B?RndkbTFsc0pIY1MxWXhBWU92TXhmNkE1cXBYY2F3Ujg2aHdQbzZEMmRlRTZq?=
 =?utf-8?B?NHZGemhIV2d3cG9FaG9HN2daNm94MkxmNGRVRjVKOWlFbm8rVGJtNHVlSk1J?=
 =?utf-8?B?RC9qVnlScDZKaXprUG9JM1I0a0VlazRKSDNBWnV1ZytqejI3RDh0WmpWRlFL?=
 =?utf-8?B?VzdVWjlDSmczcGsyOGlVNitOMURFSnFncFFsbjhuMEdvOXFZNUk1Znc3V0RY?=
 =?utf-8?B?RkhPcEdkZFA3UXQwSW5zZm1GWlI1L3h1VU9PRXhDc3MwTXAzdnFxczUydlBv?=
 =?utf-8?B?WE8vN1oxK3lMaHNmaUppcEpuMnYyZXRYTlFzZU1HMEhxMWxaK3JXTVJjM1E0?=
 =?utf-8?B?M1U5dHBOT2lJNlBFYUZ0cWI5SEJqUmhQK2t4aFE5ZHlZVGlkK3FMWk9wQzg5?=
 =?utf-8?B?RkdwUWFNbEVGN0pUZk9mKzVNU3NrN2ZqbWxxUzkrbnhxemxTNng2TDhoT3pO?=
 =?utf-8?B?MldRTFFXVEdMT2hkNGs3WFNaYXRXbElwdWJNZk83dnd6elJscnVYM05YVnM0?=
 =?utf-8?B?WHNlZXZxamtYZ3ByRS9PL1dNcElqQTZtSW95L1ovZGFWU1djYmljaEV6Vzhy?=
 =?utf-8?B?UDNkaHBSeUt0YnpUV01wQkV6ZVZuRFRYL2xHNkxvWnZJTG5iK1IxYVU5Qkhj?=
 =?utf-8?B?NGhVR3l4T1N1QXdrY2tSUUxyeDBNR0NSL2xEaW1lTUt2b1BHK3dENkgzbVlZ?=
 =?utf-8?B?ZlQrSzRZMUFyblNZbFpPREpOeWlpYzlOaENkTGYyOUd5NXNNVG1jNU1Od1g4?=
 =?utf-8?B?OCtwbWpmdjZZOU00Qm1QaWlpTWJZL0dub2kxNDV4Q0lsSXVHcGEvOFc5YmVm?=
 =?utf-8?B?dWVOanoxUjF5TDQ5TXVQYlE3MjY5R2loakFONHhOM0RiQ2w1M3Jzb1ZPd1JL?=
 =?utf-8?B?VFdHZ28zMEtRbUNmWUJ0MGVTNUdURDdYTDVRSXhUa2ZqS2JocXczb3hXb0g5?=
 =?utf-8?B?dDdZWWQyek5zRHFhTzFXSnMxZmpkckFTYllZeHo2MHNSNUhGeXZFQitNL0hi?=
 =?utf-8?B?ZzZ4a2dXcnhEajNFa0xWcS9xaXZYRXVSNFVHbE4rbzVzTGErcXlNbmdhL3RY?=
 =?utf-8?B?WUtWd1FGc0J6UllPZWNnKzZWSSt1RzBiZ1oyRXFzWTUzc1hPVGdwQVhjMHRs?=
 =?utf-8?B?S2tZVnpWZjdoMnBUaFhQYzFVanZmRkk3UEV0Q3ROa05TUlJVZ3NTVFpoM21B?=
 =?utf-8?B?Zi85bWNQUjhOUS9PREIvdnF0cGhpcG1mQ1MwNVlKdmJ4SWsxNEVucWpoWGVC?=
 =?utf-8?B?Q1hoOVNIRkNsS2REQzRDUWlDS2hTU2ZCNHpYeVlXdTdLK2xhbDZ4UT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 044e43eb-2cb5-4fcb-cb79-08de4e8c8ada
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 08:04:26.7344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JgtdA60GTpK2w2hzDh78sH/THT+VPT1eJwZAp/o4Suzg0HxZoV2Myrhdo8PUlzvc4ZShRFkk3tLIyeco/VqZlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4740
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_000439_581906_43F17A2C 
X-CRM114-Status: GOOD (  12.84  )
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

On 19/12/2025 18:32, Frank Li wrote:
> On Fri, Dec 19, 2025 at 04:45:24PM +0200, Adrian Hunter wrote:
>> The driver already uses devres for resource management, but the standard
>> resource-managed DMA allocation helpers cannot be used because they assume
>> the DMA device matches the managed device.
>>
>> To address this, factor out the deallocation logic from hci_dma_cleanup()
>> into a new helper, hci_dma_free(), and register it as a devres action.
>>
>> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
>> ---
>>  drivers/i3c/master/mipi-i3c-hci/dma.c | 53 ++++++++++++++++++---------
>>  1 file changed, 36 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
>> index 54849aa98fad..703d5cf79d5e 100644
>> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
>> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c

...

>>  static int hci_dma_init(struct i3c_hci *hci)
>>  {
>>  	struct hci_rings_data *rings;
>> @@ -359,10 +373,15 @@ static int hci_dma_init(struct i3c_hci *hci)
>>  					   RING_CTRL_RUN_STOP);
>>  	}
>>
>> +	ret = devm_add_action(hci->master.dev.parent, hci_dma_free, hci);
>> +	if (ret)
>> +		goto err_out;
>> +
> 
> use devm_add_action_or_reset(), so needn't goto

It doesn't work because the error path needs to call hci_dma_cleanup()
before hci_dma_free()

> 
> Frank
>>  	return 0;
>>
>>  err_out:
>>  	hci_dma_cleanup(hci);
>> +	hci_dma_free(hci);
>>  	return ret;
>>  }
>>
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
