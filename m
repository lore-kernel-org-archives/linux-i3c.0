Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B7FD5E13D
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Dec 2025 18:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:CC:
	To:From:Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dqqpAp3F/VFAkoSGWqEvikO1ifZZi5pctgb7KDkAVcI=; b=c8TLhj+jtGDuGg
	t0UOnGMGx7qGfOV9QLr6nwS31BhEn0KvzmpYATZTeJoKC9CD+yy1Yg59hIlXjLfX0hCyZw9rM4Jy8
	hINxf97if3PPGuYv260z6y4Ce0yU1QlavWQp70YA0jA1wRxnCcqUCk+dxceviyhNAnB/cTpg3XnYZ
	18eGZlofRwR8FBQjqGUkK8ngyqPmJB1/fvxO6YCMZqhgYhZkFEe0IS9x4URCQ9c9WITR0zwy8YxsM
	yvZPRV5QYAsRhgjAP6TvhWRlduxUgCdAQnrngqpt/MJY235SQQhZkD1KmN8ndLCOrhGW9dm8J1OJ0
	VrjT3TpE4ZAM29dsVzPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVaDg-00000005j8M-1Wfb;
	Tue, 16 Dec 2025 18:56:24 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVaDd-00000005j7w-0E0E
	for linux-i3c@lists.infradead.org;
	Tue, 16 Dec 2025 18:56:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765911381; x=1797447381;
  h=message-id:date:subject:from:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=mq3uZiEYpphWKudX/+uGU93aXHU3CZaa4y9ymzi5E80=;
  b=Faxk36gVRvHZpGJCp1DH2oGtrVqHP7xhQFHB5AJ8ZSUyKu/sBL733JvN
   SNFPSk1BYi9Hz352oczKBPSa5oqyTRUIQe9W1TqHqM6Q1iKBrS5CHFNRR
   84Rf0wxHBdKwzqe5mtktWOMjPKrD97pVrEKf9vIe9D24DMGx3+CcujpTk
   DwHpoD4DG+c8+GiiLQcPI93ejWyalPhigfiuJenulmlpEPbuAI7ikfiSo
   m3lwHMnEzR9NBB9ShH8wAJMpCwAQrHTe6QgjOVZGR33i5Ifr7YTZwNj7J
   b2FuIQpn6cDP41GqFnCOC09N3dY52QDgP5KFcOYYe3hG9OibWAWgzKWbw
   w==;
X-CSE-ConnectionGUID: Mk2F/XSeRxWOfHElDLWgbg==
X-CSE-MsgGUID: KDVLQZ64SVK+VXi7tF9vqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="70417629"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="70417629"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 10:56:17 -0800
X-CSE-ConnectionGUID: 7GIr63hvRei3dyohqTDhmA==
X-CSE-MsgGUID: u/DTVgbwQPGPeTx4FQRBFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="202496296"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 10:56:17 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Dec 2025 10:56:16 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 16 Dec 2025 10:56:16 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.34) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Dec 2025 10:56:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lF5Sy6d9mA9/KL6cmX7TQbjwvqkCtUnR0UsqVKuzIjsIKhxcVoM16T4hX3N9f3A88Cjp8aj2VM9eYA5pIt+bR4emgelK2XLcmNvcL26LHSJUEC6vVOqgw1d6dat/gIRRNnOjHUtj19ttqrDnUqURJd3hib20QLvq0Gzxsx/vJcWQ2nUUWn0Q0MulgVNhZTr1ellkensz2SNbkkTW42Us41Rt2LpTwnaIhC55VfRDiAhXSb7l43Ma1N2HgbHAh+HAVQ0s+cnetzryCA1E7MIYbrin9HvmaFJTmYX739E4A8w6tjcJGQxO01ej4h46YNtrVDRzPDnw4/IMosX6Qb5j1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JjhSkcU5glWb2TUAKvPVpOn6jHl2rkIZgjpRs+LwaGo=;
 b=nw0WbwwgeyEoSkj40vArYgez7SKPLvinP+7vHpbBILI7Bj3r1UBvXRPl88LJbu2xAuM5+s3U/+fZtduVouj2Wk3EUWzfjtHniWi7/6gGuFVKzSpdZaUJviYP2AMOAkVnaj50S5qMGIJruBOf7E3Rbs0iWMSsYda5miHP/bwTtDPCdACeSvsRVJvfHOTC/TzbGTgR8b11nptVuBBhj8e170/WNwtMBJL8YNiVDJoSiP4q88dcpMvS5QHfLrqZ/Uu4VN6T7Z6w3GwHcjmP2GMew+Wtg65pVWgsRGdpR1LKdwNgEJ+Yg3ItM+/7ZlsioDdii74FmunqrpNAilzFpBClnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by SN7PR11MB7667.namprd11.prod.outlook.com (2603:10b6:806:32a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 18:56:11 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 18:56:10 +0000
Message-ID: <c604dd45-fd23-40fd-b757-623e98e96ef2@intel.com>
Date: Tue, 16 Dec 2025 20:56:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 06/11] i3c: mipi-i3c-hci-pci: Assign unique device
 names and IDs for Intel LPSS I3C
From: Adrian Hunter <adrian.hunter@intel.com>
To: Frank Li <Frank.li@nxp.com>
CC: <alexandre.belloni@bootlin.com>, <linux-i3c@lists.infradead.org>
References: <20251216165642.164583-1-adrian.hunter@intel.com>
 <20251216165642.164583-7-adrian.hunter@intel.com>
 <aUGSHCqJ5+4Jwdh7@lizhi-Precision-Tower-5810>
 <bc482da2-5ef4-4162-861e-3f2f0cc9f938@intel.com>
Content-Language: en-US
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <bc482da2-5ef4-4162-861e-3f2f0cc9f938@intel.com>
X-ClientProxiedBy: DU7P251CA0006.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:10:551::7) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|SN7PR11MB7667:EE_
X-MS-Office365-Filtering-Correlation-Id: f42bead8-4833-4e5a-605c-08de3cd4c6cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SEx6eGFHUWhTa3dMYk1GemQvVzZzRGVMdzk0WlI0a3J5YWtDQ3dSOEJVZEI4?=
 =?utf-8?B?VjNMQTRQSVFRcGFrZkxUcENBd2NreERibjZ5cmtSVjJHOTY1RjZMelB5Yzdu?=
 =?utf-8?B?bEZXdEdNdFppSWFLd2dwWmd5OEhRNUpDb05vK3RhUkFFZU1vMDg1QlBVakhM?=
 =?utf-8?B?KzJ2RHNmYTVEOVBTK3NleGtxU21aWTZEVkVzTmFwY3RFUGI2RFRzNXFxR25O?=
 =?utf-8?B?SGZmazVWc0RzZ05VcFplYVJWVUVxVE1Tb3VBaGJGamVvYnhzbnRnMXNJMGo2?=
 =?utf-8?B?M04raUR5ZGRxZTFUcXVROTNVV0VINUphUHlYVVE5bGZrYkZQK0xtelZDano1?=
 =?utf-8?B?MGJuRHVaTWhMR3dhclRRd1cwa0JsbGx4ZzBNUUVFWWhCcUVHUXl6VmRKMlF3?=
 =?utf-8?B?azhtZStlR052bDQ2WjFVMHo4aEs0VDd6UWVvSzNZM0p4cEZsaWJkY0wwajlO?=
 =?utf-8?B?aS96NzJZZHhDcmNwSlpmRldVblpCbkkvM296L1Z6VmJuUXRTa21Tby96aERL?=
 =?utf-8?B?OE5YeHlxZXRuY2w3dDJVQ2FJMWxZZnVjb2lyYkhzbGFuZ1U3aXJacEFHU0ll?=
 =?utf-8?B?RTZ5TmcrSGRIYXNjYng1cldHWnIzeWxQdzUxOTdUNkk4d2QvYmJTSHJ0Nm9V?=
 =?utf-8?B?VEZTL1NnSkpZYjBMd1lMZDhCSjRBVDFTZWhIdXoxV3RXMEN5cUZVVHR6RWZH?=
 =?utf-8?B?YzZ3VVI3eE94S3Y3UGhrbCtlaG1Lby9ma0JjZlF5dENNL3Q5N0w3S3UvV0Iy?=
 =?utf-8?B?b01jQXRGZWswUjBPZmFiMnFuYTdqQUdZazU3Vy9IQmJqZGE5cjA3YVdvTFN1?=
 =?utf-8?B?NnFaOFZEZ1p1QnRIeDFCWFczNFo4Z2J3Y1JsUXc1eW5Rdi9Id0lUZnVtQ1ZZ?=
 =?utf-8?B?cGZWdTVTQUlUeHBRUjMyZmlsZE10c0ZKRTAzNlg1RWVRL284QVc5Z0R2RlJG?=
 =?utf-8?B?bEw2VXVXNlhIMEl4MHlKTzdWaHd3dDdPMDA5cENWbDVlTGlUKzdxS1ZyVHo2?=
 =?utf-8?B?aW0wSWI1c0tJUnpjdlV2YURUcDN5NHpqanAvd09tTHMyMUlmRldzMWlGZFBs?=
 =?utf-8?B?SUpub2VBcUFqWWpDQTFRdG92SC9oUzVNWGIwMWtOcThQZDhDN2k4VWNEYnJi?=
 =?utf-8?B?bFE2eVJpcGJOQ0FvY2tiUEpWSHZvTCtyTXFmbEtVZDlGYklNSHpVQ0VqbHNz?=
 =?utf-8?B?QUpFQXFHUTBhU3VHOEIzaHZlMUw3T1liQm5ZS2QralplY2NyOVBrZ0hLN09a?=
 =?utf-8?B?TUNSaDFUcnhmU1FMcE5POFN3U1c5SzZBYTFITjVxdDRIcnE2R0N4ZERubWdz?=
 =?utf-8?B?cjJDVThJMER4OEsyTXVLODNuczZ4TFdsUXpnbktOS3k2VU1iM0RIQVF0Y1hZ?=
 =?utf-8?B?b1NvT0tUTCt0VlZQVjlSSzBYdll2NTlhQ1FiS0h0M2Vxdjkwclhyd2EvL2xG?=
 =?utf-8?B?Sk5maitNM3I3eTBNeTE0dlczOWVLeUFWWG1iaElhMGtxZjhkNGoyakdzY1Rt?=
 =?utf-8?B?ZEdLMFNsdGZBYmxTOHpFUE8welJQYTFqb1MzaVgxVW83SjAvOWNZL0M1L01J?=
 =?utf-8?B?eHJiZjhpZUhkWlNmbEdhSVRxQW03MVBkTXR2bCtuajUwNVB5bXB6c2tTVUJ5?=
 =?utf-8?B?QWZ6N3lCd1pYVC9ZNm92WEVpZk16bHN5VHBxTnJsR0lXMDNmOUgvVk0weXYy?=
 =?utf-8?B?cENHZ2dtakxRRVkza1ErSGFMMGMwallzaUNGNlNJVUMzQ045a2wzbnlQQ1FP?=
 =?utf-8?B?ZTk2aGJMVWRURWRMbk55UE5FWXkveXFVUUFIelVWV2tMa1hzWUVvd1JEQlE1?=
 =?utf-8?B?WTRYZFkwYlVyNEREL01WV1lWQWlHcnBEaU84QjhTRDhVaEgxSzlLZjYyYkkx?=
 =?utf-8?B?eTFRdytRZnlRMGpIbTRYN1Yrd1VxaFd2NkdBMjFzd0dyN0tSZ2Y3ZHBwbmo4?=
 =?utf-8?Q?ajBk+cdYddVx4oIh/4iJmAht4bT9nrW2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHRONjlNYTZneGNXYzVLOXpBaGIrN3NpVS93cmM3SkRhOFQwMnpuZVNWYzZI?=
 =?utf-8?B?MmN4YWs4R29xYkRDVG96MVMvbjZsQ1RBckljVzJOK3VIbjc2UHdoTkU4cG9N?=
 =?utf-8?B?emNCUWpaRFJ1Nmo5Qml2Z2ZaMFI5QnJITGxJUlo3YStpbTk4QTcvSjVnMXhF?=
 =?utf-8?B?dW93RDBMeXROQzhabGduUFFienlpQmdGVXo1UDhjOGRmTzcvaUdtSWp1NldD?=
 =?utf-8?B?SWNXbUF4dlgwd3V3aFYyNHN5WGFEbVpNY2NYUWVML3dvZy90dUJMNk0xTFE0?=
 =?utf-8?B?N3NsOTRsSkFnbTEvK3AybGkrRjluOTlaR0pSeEQwNDcyME5jVC9rSVJGbko2?=
 =?utf-8?B?Q3p4cERUM1Fqb1VuVTl5amtnYXF0NDBPaEhOMy8zcWNERDhlbmh3dDkxL2x5?=
 =?utf-8?B?VmJVaGVydjZVRUVEUUVKc3RjL0NGN2RPSmRWdG1od1FJd1FzckVyWmp0S09D?=
 =?utf-8?B?ZjFvSlJQK1Y2RFdBS1U0OGJKeHd4djBxUWRCM3U3WlJhY2ZIY3gzL1M0amlJ?=
 =?utf-8?B?cTRVQU0yTWp3cHh0NjZQcG9qbDl3eFJYSmFoUzhlbHFJNWozejJ1S2dja1Jr?=
 =?utf-8?B?SDBJTkZGR1V5c3FFeFNMS2VCZXRFeWNvejJsb0VHYlk2VEVsUjZNeXNPTnpR?=
 =?utf-8?B?dXlWam9NaWJRbkJGTml5TjNIU2ZMVWNoL1dueENOSzJ5Y212S0haOUhBb0I5?=
 =?utf-8?B?bTNUdkdqQjQzKzdPdHRXZCtwTzJHanlkV3FsdU9icmE3eUcvV0NieTB6M1pl?=
 =?utf-8?B?emdWMG9hQThKN0E2TWs0cTlCSVlUUlhhVS9WaFRNaWdiUEJLcXYva2FNSGtD?=
 =?utf-8?B?SXdPMVB3R2M2QWJMbVhIdGNrdUI3NDlxS3hySHZUbjNGTUpJNU5GTnBQQ2Yw?=
 =?utf-8?B?MXhPc2JtdDJsakVUUWp1aXBLMzQraFF6RFlOeEZURUpsMnlHOUxLaldXV3hj?=
 =?utf-8?B?R0x3V0NvQ1RJUmN0cTNhVWxsa3pmMTd4OUJnZjJFRG9OdlpsNjd3a0hIRHl0?=
 =?utf-8?B?RWFHWXJsRXMrcDNYaEZLWE5URUxrbjhEbVFXYWZNY0hJdUx0VWFyYWc4WjRD?=
 =?utf-8?B?YjJ5eUxTa0x5cGZFVlJ2MSttZ2xZaXhHdFBSaHJOTktNcUhkekR6SldFdzNQ?=
 =?utf-8?B?M0k1ZUI3V1FHTmh1TVVudXZ2cGpsZ3g1dzdLdUg4MEYwbmQrdFpWS1pOeFN0?=
 =?utf-8?B?ODBDT2thRnRpa01OdWV0NkpnbndXbGYwaWF3ODhEd0VpL1Vsei9OenJQT1NT?=
 =?utf-8?B?WVdUYkVMd20xT3I2TUd1VW9uNDg4L2p1L2JPL0tmT1NEY0dnMkhBTTFqL3pJ?=
 =?utf-8?B?T3VxdGNaL2tOUmg4by9FS3hlUGZJcFA2b0hzZXJScHB2NEdINXBkOG4wZUZz?=
 =?utf-8?B?ZlJuM0xib0dUejJLU0ZZaXRaRWpEMUxiaEdwb01ZaERUTEhKdHhITHRMTVkw?=
 =?utf-8?B?YUZta0MrL0p0OThkR3VORlVrVWY0UXlEMUdMOTlwQzJQMHJBRXo4TCtZWjI3?=
 =?utf-8?B?aGNxZkFkangxOHpTN0VyUzQ2TUZURHdkQUF6QUI2ZUxiR0FlUThOd1Rld3JN?=
 =?utf-8?B?OURONm53UWxkMCt4cVlVMWJIK0poWlVmbWovQzR2UERRc1ZQSTVzd2doa1Zm?=
 =?utf-8?B?dExhYjd6aUxEa2RxUjZwNDdhRk10N3oxQTU5bTdidVhQVG5OL0cwSy9QYWFX?=
 =?utf-8?B?TWpGbUQ4VThyRlBoQUhyQUhJZ3lGa0U5dXZ5aVVDbnJ6OSt1RTIxZ2pnc2kz?=
 =?utf-8?B?YUJvcnZjY1RYTjkxT3NlVTlKakh2Tnd6MEdtdC9ud29KcFFjUWVDemFJNHY0?=
 =?utf-8?B?ZTY3Tjk3MzlWUkIycklEcUliWllEenpaV05sdm9CZDY1STNFS29pU0JWR1ov?=
 =?utf-8?B?WjkwVW51NzBGdlhsRlRwV2N5UVp2WGxxanBzbURpMEhxU1pkMm1hWmN5U2pX?=
 =?utf-8?B?ZGp5ajJBb3lXbU45U3AwQnBOVklXOGFFdzZOTjBPdWM3TkFjbHRub2QwYkQr?=
 =?utf-8?B?TUFQa1h4cndjKzRFOXdMQ212QVBOcUxEeWJXSnB1Sm5kU01zRDdyWk44MWht?=
 =?utf-8?B?amswSlhVTVpEc2pwTHZPY0VPT1BsRkIzb1ZBVkllVnM1ck84bUhnQU5Qdktm?=
 =?utf-8?B?cFRoUHh6WDVSeWNNUU1jZlNqeG8xc3hnTmlhTXZoR3NoZnNPZjBZVDlrenV1?=
 =?utf-8?B?QWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f42bead8-4833-4e5a-605c-08de3cd4c6cd
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 18:56:10.2139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vKFCx0AcharS+K8fI26vXfWz+WVNyUAhTKIAIIm3Mc6OXoRlKPKd6UItm44Q+B/GUL+YrA64E7EXB0PGwmZiCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7667
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_105621_144812_6EE7DC2E 
X-CRM114-Status: GOOD (  14.88  )
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

On 16/12/2025 19:14, Adrian Hunter wrote:
> On 16/12/2025 19:08, Frank Li wrote:
>> On Tue, Dec 16, 2025 at 06:56:37PM +0200, Adrian Hunter wrote:
>>> Simplify the code and ensure names and IDs align with device documentation.
>>> Use explicit device names and IDs for Intel LPSS I3C controllers instead of
>>> dynamically allocated values.
>>>
>>> Add "intel-lpss-i3c" to the platform_device_id table in the mipi-i3c-hci
>>> driver and use the same name for Intel I3C controllers in the
>>> mipi_i3c_hci_pci driver.  Assign hard-coded IDs to reflect the hardware
>>> layout.
>>>
>>> Intel SoCs include two I3C PCI devices in the Low Power Subsystem (LPSS),
>>> each supporting up to two I3C buses. The second PCI device is assigned ID 2
>>> (not 1) to match this topology.  Additional IDs will be introduced when
>>> Multi-Bus Instance support is implemented.
>>>
>>> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
>>> ---
>>>
>>>
>>> Change in V3:
>>>
>>> 	New patch
>>>
>>>
>>>  drivers/i3c/master/mipi-i3c-hci/core.c        |  7 +++
>>>  .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    | 43 ++++++++++---------
>>>  2 files changed, 30 insertions(+), 20 deletions(-)
>>>
>>> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
>>> index 07fb91a12593..3d6544a64188 100644
>>> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
>>> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
>>> @@ -790,9 +790,16 @@ static const struct acpi_device_id i3c_hci_acpi_match[] = {
>>>  };
>>>  MODULE_DEVICE_TABLE(acpi, i3c_hci_acpi_match);
>>>
>>> +static const struct platform_device_id i3c_hci_driver_ids[] = {
>>> +	{ .name = "intel-lpss-i3c" },
>>> +	{ /* sentinel */ }
>>> +};
>>> +MODULE_DEVICE_TABLE(platform, i3c_hci_driver_ids);
>>> +
>>>  static struct platform_driver i3c_hci_driver = {
>>>  	.probe = i3c_hci_probe,
>>>  	.remove = i3c_hci_remove,
>>> +	.id_table = i3c_hci_driver_ids,
>>>  	.driver = {
>>>  		.name = "mipi-i3c-hci",
>>>  		.of_match_table = of_match_ptr(i3c_hci_of_match),
>>> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
>>> index 0fd3587671e1..3b319fbf18ce 100644
>>> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
>>> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
>>> @@ -27,10 +27,10 @@ struct mipi_i3c_hci_pci {
>>>  struct mipi_i3c_hci_pci_info {
>>>  	int (*init)(struct mipi_i3c_hci_pci *hci);
>>>  	void (*exit)(struct mipi_i3c_hci_pci *hci);
>>> +	const char *name;
>>> +	int id;
>>>  };
>>>
>>> -static DEFINE_IDA(mipi_i3c_hci_pci_ida);
>>> -
>>>  #define INTEL_PRIV_OFFSET		0x2b0
>>>  #define INTEL_PRIV_SIZE			0x28
>>>  #define INTEL_RESETS			0x04
>>> @@ -179,9 +179,18 @@ static void intel_i3c_exit(struct mipi_i3c_hci_pci *hci)
>>>  	intel_ltr_hide(&hci->pci->dev);
>>>  }
>>>
>>> -static const struct mipi_i3c_hci_pci_info intel_info = {
>>> +static const struct mipi_i3c_hci_pci_info intel_1_info = {
>>>  	.init = intel_i3c_init,
>>>  	.exit = intel_i3c_exit,
>>> +	.name = "intel-lpss-i3c",
>>> +	.id = 0,
>>> +};
>>> +
>>> +static const struct mipi_i3c_hci_pci_info intel_2_info = {
>>> +	.init = intel_i3c_init,
>>> +	.exit = intel_i3c_exit,
>>> +	.name = "intel-lpss-i3c",
>>> +	.id = 2,
>>>  };
>>>
>>>  static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>>> @@ -189,7 +198,7 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>>>  {
>>>  	struct mipi_i3c_hci_pci *hci;
>>>  	struct resource res[2];
>>> -	int dev_id, ret;
>>> +	int ret;
>>>
>>>  	hci = devm_kzalloc(&pci->dev, sizeof(*hci), GFP_KERNEL);
>>>  	if (!hci)
>>> @@ -217,11 +226,9 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>>>  	res[1].start = pci_irq_vector(hci->pci, 0);
>>>  	res[1].end = res[1].start;
>>>
>>> -	dev_id = ida_alloc(&mipi_i3c_hci_pci_ida, GFP_KERNEL);
>>> -	if (dev_id < 0)
>>> -		return dev_id;
>>> +	hci->info = (const struct mipi_i3c_hci_pci_info *)id->driver_data;
>>>
>>> -	hci->pdev = platform_device_alloc("mipi-i3c-hci", dev_id);
>>> +	hci->pdev = platform_device_alloc(hci->info->name, hci->info->id);
>>>  	if (!hci->pdev)
>>>  		return -ENOMEM;
>>>
>>> @@ -232,7 +239,6 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>>>  	if (ret)
>>>  		goto err;
>>>
>>> -	hci->info = (const struct mipi_i3c_hci_pci_info *)id->driver_data;
>>>  	if (hci->info->init) {
>>>  		ret = hci->info->init(hci);
>>>  		if (ret)
>>> @@ -252,7 +258,6 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>>>  		hci->info->exit(hci);
>>>  err:
>>>  	platform_device_put(hci->pdev);
>>> -	ida_free(&mipi_i3c_hci_pci_ida, dev_id);
>>>  	return ret;
>>>  }
>>>
>>> @@ -260,28 +265,26 @@ static void mipi_i3c_hci_pci_remove(struct pci_dev *pci)
>>>  {
>>>  	struct mipi_i3c_hci_pci *hci = pci_get_drvdata(pci);
>>>  	struct platform_device *pdev = hci->pdev;
>>> -	int dev_id = pdev->id;
>>>
>>>  	if (hci->info->exit)
>>>  		hci->info->exit(hci);
>>>
>>>  	platform_device_unregister(pdev);
>>> -	ida_free(&mipi_i3c_hci_pci_ida, dev_id);
>>>  }
>>>
>>>  static const struct pci_device_id mipi_i3c_hci_pci_devices[] = {
>>>  	/* Wildcat Lake-U */
>>> -	{ PCI_VDEVICE(INTEL, 0x4d7c), (kernel_ulong_t)&intel_info},
>>> -	{ PCI_VDEVICE(INTEL, 0x4d6f), (kernel_ulong_t)&intel_info},
>>> +	{ PCI_VDEVICE(INTEL, 0x4d7c), (kernel_ulong_t)&intel_1_info},
>>
>> If there there are two 0x4d7c pcie cards in system, id will be the same.
>> Is it okay?
> 
> These are not cards.  These PCI device IDs are unique to each device
> in the SoC, so duplicate IDs would never happen.

Note, that an id value can also be PLATFORM_DEVID_AUTO or
PLATFORM_DEVID_NONE, so there is still flexibility.

> 
>>
>> Frank
>>
>>> +	{ PCI_VDEVICE(INTEL, 0x4d6f), (kernel_ulong_t)&intel_2_info},
>>>  	/* Panther Lake-H */
>>> -	{ PCI_VDEVICE(INTEL, 0xe37c), (kernel_ulong_t)&intel_info},
>>> -	{ PCI_VDEVICE(INTEL, 0xe36f), (kernel_ulong_t)&intel_info},
>>> +	{ PCI_VDEVICE(INTEL, 0xe37c), (kernel_ulong_t)&intel_1_info},
>>> +	{ PCI_VDEVICE(INTEL, 0xe36f), (kernel_ulong_t)&intel_2_info},
>>>  	/* Panther Lake-P */
>>> -	{ PCI_VDEVICE(INTEL, 0xe47c), (kernel_ulong_t)&intel_info},
>>> -	{ PCI_VDEVICE(INTEL, 0xe46f), (kernel_ulong_t)&intel_info},
>>> +	{ PCI_VDEVICE(INTEL, 0xe47c), (kernel_ulong_t)&intel_1_info},
>>> +	{ PCI_VDEVICE(INTEL, 0xe46f), (kernel_ulong_t)&intel_2_info},
>>>  	/* Nova Lake-S */
>>> -	{ PCI_VDEVICE(INTEL, 0x6e2c), (kernel_ulong_t)&intel_info},
>>> -	{ PCI_VDEVICE(INTEL, 0x6e2d), (kernel_ulong_t)&intel_info},
>>> +	{ PCI_VDEVICE(INTEL, 0x6e2c), (kernel_ulong_t)&intel_1_info},
>>> +	{ PCI_VDEVICE(INTEL, 0x6e2d), (kernel_ulong_t)&intel_2_info},
>>>  	{ },
>>>  };
>>>  MODULE_DEVICE_TABLE(pci, mipi_i3c_hci_pci_devices);
>>> --
>>> 2.51.0
>>>
>>>
>>> --
>>> linux-i3c mailing list
>>> linux-i3c@lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/linux-i3c
> 


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
