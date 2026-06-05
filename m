Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C32CD6E6E
	for <linux-i3c@archiver.kernel.org>; Fri,  5 Jun 2026 15:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:CC:
	To:From:Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nUSLraALvEx5782bh+CIwVSMedCG916pM3I+xur/DPQ=; b=Y4vOhV+4su1I+e
	Sc4dz6vUqXionQMlRgLy3abMJtS+F1M6pV+izoOHdRGahoPpr6ibpiBVpwkrUDEv25/+Wp7dK55Ig
	b2nn/XRbdtA+Rpq5RCy9NaT3pX4wICC1V8zgIhQbaqLcahe8h3/Y7quq3IVUF9ygEQUJ45+zfcXfh
	2D+/2pSfl9gvule+ZpO7gzbFoYoK7R3RxWgKRfGoIMGEsADfmOmNfHpCOWfOThXMGoI79oXlcpaSd
	CBmsCk064ZSkPh7PYQxGiwoEjjQgkGWFtmGzb9B+s3v25qmbevelDS5ur4i6IPEWInZZwS2FVAYm1
	6oqAqYUUoxkXIl3Yw1VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVW7g-00000000mrh-2I6z;
	Fri, 05 Jun 2026 15:06:12 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVW7e-00000000mcE-0C8e
	for linux-i3c@lists.infradead.org;
	Fri, 05 Jun 2026 15:06:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780671970; x=1812207970;
  h=message-id:date:subject:from:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=HSn/QCiGcTQ5ic+UBXnBA4hP8ycqSnFC8Pbk8NI4VEA=;
  b=kwjwuMRGmw0Q3zSS1zxyoMg3/AzJJOQxs13+MWgxYPvJ6wHHIVxBXPOC
   41pcC/iLFZdzoSiK4AgzDY8DgiEpvUTp9dj1f9Lt0Xh6J25KvrEUe7eSz
   TKhqUWH92L1eOM3K32kb2+/r3dRzKL7pkfigIXZIqVr1hWtPzQsmm02lu
   h78DRQ6iY4X8QocBdcFjjoRZoZLJsoBn8B3Nh8y7LsBWw66s02aGFcq2D
   Vz9tqn7f/hj9fQd2S23MxEQySGGevgDQ3v4sKcSJpQCupx+x7667vb51C
   r/krhMHctziudX7RB5GWIlxmBjepgIhg88J+htNeuxbeL1iOSdilnvL/8
   A==;
X-CSE-ConnectionGUID: YTPw8QrDRSuJW22UQ8MRDA==
X-CSE-MsgGUID: 3ySK+eQUTCOgyTknSvkYzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="85358626"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="85358626"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 08:04:08 -0700
X-CSE-ConnectionGUID: UrgGd4N9QNWRH0nSmus+zg==
X-CSE-MsgGUID: 1c5Ru4FkQvKEQRcrtsuR+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="241884775"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 08:04:08 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 5 Jun 2026 08:04:07 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 5 Jun 2026 08:04:07 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.60) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 5 Jun 2026 08:04:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=miT1iuzvTx0EGEISpdVrliS42fXaIZ28FSi4n4ydZLZ7oofFQMOl07nDE9FpKbfB+TFZ1IppLDrcDxMS46R2+8stKCs+qZLEonYLP7g3b/Erqqf5unL0IVLQLSY63YHhflGqQ1Xagivv3mgnuuR3ZDOVW6AxOMabS5QPu7fuNhqYOsw6w7yN3Xqs7hw8HZ3MjfoQHr+s3h5tDTUuSHCbu/p6ert1KLGraIyRZg5s3XlOS708Sl/Q1dOn2WIKqlfhkobX6PEwpW6nfZXNZTw3+8DHa2MQsAnHm8V8aN6UXLZsznVivGwIxTCMxPBoxjfOugS/W0jwaNCVZUyTsKAtvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VNlZNuGW6FLbUaWYylYEq9i9Mh9A25NxoNI/wiJOT3M=;
 b=Dyc1gfzjCbzTLZ09wL9d0xSk7szMRHjrSGmIWM40LdNyB1OuPQNAzI7sIY4pq44M3VwLR68bp+b06YeCWzWOnXlHWnVsJmm9t/aEBdRWa2aodNAVAnZBkB7hEggTsqmzgWCrcjYJEFTD/uYfk9Ms1IjiJBrmhryxFX0yEUMl6XP5K8JEbcfguCTcq8JJ9rdIYf/zprFwa3NGXugFOvhz03U4xIzo6EhpDF9cItIfL1LPvGkBTxwxGSzU8Wu1WiWDyEJpQ8I+8kqy2hRga8Vuz4XcQp7zBuXemIT+0pUwd11rSL3XKoQpPoJOkQcXjfG6J2Q/mTW7EKQjrcfxqCXf+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by SJ5PPF7CF5FEA5F.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::838) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 15:04:05 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 15:04:05 +0000
Message-ID: <31683eb0-7514-4bf6-9c57-803ed58be4da@intel.com>
Date: Fri, 5 Jun 2026 18:04:00 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/8] i3c: master: Serialize i3c_set_hotjoin() with the
 maintenance lock
From: Adrian Hunter <adrian.hunter@intel.com>
To: <alexandre.belloni@bootlin.com>, <Frank.Li@nxp.com>
CC: <david.nystrom@est.tech>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20260518115520.98335-1-adrian.hunter@intel.com>
 <20260518115520.98335-3-adrian.hunter@intel.com>
Content-Language: en-US
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20260518115520.98335-3-adrian.hunter@intel.com>
X-ClientProxiedBy: DB8P191CA0030.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:130::40) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|SJ5PPF7CF5FEA5F:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cda1d2a-051b-4375-f2ad-08dec313af63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|56012099006|22082099003|18002099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: E8EL2Rm3zlj+kXBu2+x/9f4TA2kDs7cvXlWzA6WlC0xGILMWuXFcMXW70qBfFQAX3YFffJckYuNDX+bkziURDy5h/VB9W8Jldz3oxOy9VPNIspmDQBxdNRptk5RZFUu0QJUDlX2S5bq7CbW4MmGzH6bsCQORs7GTJhP7gOtkbrQaI2XLREB+HZ3DvOF2S4Go+IXFTBE1GUq4q/LUop28AWDuq7Uop3kjAHB5iY8Z7Nez/6soLd3Qzi8/HHMSImMR7V7bwqmmSVeOYy9edrxcAg5jWxkYcUXnRGDefPaTQudUCsQfttbjsoLEJW2rTkZKo4QfQP4l1J6tbGETrogmCohChq4ahAPBQg05byhL7VVt9Du5gpqGGVAFy/FOKiPyb2xLm6vS5vBtD2EG2YmguwynHaCYylrrUXBfoIXlJRjXEZzHLu/zIHiwIPjreUNq2yQzQBAAWImguT2ciyEc03fNfJ15VpPP9brKRHfiIBoUSfEeo+da650oHNOXHaE0ldKZlHw7HdE4oSdM27VInHbh7oCEgSicG2w1aLwvhdGX2Z+kENJXqBq2Le1+EeySCO0iQoTEYG31WyALu0tfWhSvRfdpZVY61zuiImyI9ILv41Ui3DO0yEA149zcyYGaVPSOT73gT6iP2351KC+6BXRtbyMi5OlsIW5JZpHdHqXu2Lj0M9k4bhXqde5vArsP
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099006)(22082099003)(18002099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXFPUkNlcE9jdWRsa3VpNkUyWmVPSUJQYTREbTNUS05meWZBSXdSWVNickE3?=
 =?utf-8?B?S1J3S2hIRVlLeHFYdjh6UThEY3RseXpiNy8waTFRVlVsVHZRaTlaQjdMeDdN?=
 =?utf-8?B?WWFEdEFVN3BHWTZLbVh4bEZjTVdvNzUwRkdWbjhVMDZVcnRHRlZTSkRyMnlR?=
 =?utf-8?B?MGZIQnY3N2xLWkh6Q2dQekVoTWo0eVc3YkJMN3RuMkU1U0ZTaCsvei8yN0xP?=
 =?utf-8?B?dVp2bVlYakh4aitQcUNCYjVKN3ZydmZ3UTVaVm5QODMyT3lyYlV0VG1RM0ZE?=
 =?utf-8?B?dmZkbVNaZmprdFl5anNoYjBhUzNlUUwzYXB1ZkFmWEpoelh5RndyN2g4L3N5?=
 =?utf-8?B?bWlYU0xiUXFCUWJIMVE1dUF2bjRBdE8ySHVPQ0czQm1ncWt2Nm5NYWhkQ2hB?=
 =?utf-8?B?aEU0Vk13OC8vZ2dFakt3ZTNLMUlIdGlQMmhkYTNxWnBYM3NyZTFTdTlUanUz?=
 =?utf-8?B?ZVVpakxHbUNGdXlmeWlQV2VadkNQSTY4VlQyLytrbXFlKzE0YW9KVXExVWR2?=
 =?utf-8?B?aDQ1VkVFaUpWMUtqenhQZTkvREozMmh6VmVxdEttYVJ4Q1gzMEU0WCtnajAv?=
 =?utf-8?B?bFFWbFJDdHJVV0ZKMmZQRUM4QVZEWGwxeXA1eEdVNk5pSEM2Y3M2ZCt6blBT?=
 =?utf-8?B?NjNiT045emk0dllqUDJTSFBKV1hFWllYTHlDbTFsdHovVmVBdkVKbEFJL2J3?=
 =?utf-8?B?dzBUbWN3b0tnZnRnajdxQkwrVzlFc2lLaXIvcy9Vb3p1S0wxcW9KMmhrc3Y5?=
 =?utf-8?B?VklQMHRoaFpTQ2dsQ2VyS0o4aHJJUXc0cUpFQ0xCRE1seUl3bzV4VDcrVUlk?=
 =?utf-8?B?TEFycXNKWkVJTDhuRFR1NDN2TmkrUWt3MHFPemJ6THk5eVJ3NEVoSGhlM3A2?=
 =?utf-8?B?aDZTZmtORWVLSTUrVkZmWU1aakpyOFJ0cHJDN2d6d0NSQzcxWEI2eVNnZEJS?=
 =?utf-8?B?QzBRQklVZHJFR3ptS2hiODVpeTVEbkZQK3R1bytnKzE5WFV4ZnEvYmRKOWVr?=
 =?utf-8?B?cys4Z1F6S1E5OHlGVi9YbjFiUllzQ0UxWnBrN3ZrWEJIcEo2WkNVVU1hWi9Q?=
 =?utf-8?B?TXhrN2hQbmFOZ0lma0grK2MwdjV1YWw2WXhXd2h0U2JpVkRqUFpUTjJMOGJ6?=
 =?utf-8?B?Szg1R056WXdGamNHNUR2VEZwdzNvNGNYdHJZS3hSY3J1bFZOZUp2OUt5eGdF?=
 =?utf-8?B?SE0rbHF0L25pTmhnRWorOEQ4ZXNNSnA0TXlnTkl2VzdsVUVBSndSL21OVkxO?=
 =?utf-8?B?Y2Z6ck1QL0lLQlJWSE5idHU0UjRaUkZFa2tLRXBwMUd6bHZCMUZZMlJNcVJT?=
 =?utf-8?B?TWVCTWdVcHpCUis4REdjTzNBUWVoaWlyaEpBRUhuRzU5b0xhSWloTmtaVUNt?=
 =?utf-8?B?blM1NjZ6cXkyaCtwdDc5ellyeEpSUTJJcnRCTzJVK2lSQU5xaEtlSEdycHh5?=
 =?utf-8?B?M2tqUjlMcXBBYTYyNE1ZejNpd0JSZjE5RGN3ejNtZXJwL1F5dWl1RHh3d1hO?=
 =?utf-8?B?S1FkRXN5a0ptRWhGRWhFZTF4NHVwTkNmbmlSMWpiUzJDSE1aa0tUN3UrVFVs?=
 =?utf-8?B?V0NtbGIwTUt0MXdVcHZmbS9EQ0RCM2k1V1pNcGtYNWc1dDZ0ZFBpY0FQU3JE?=
 =?utf-8?B?ZVFRZWJSZXBrVkFTVTZyYkUyRzhZcGRWdTUvVWNteTFRcUpHcTRMQlNLMEJ4?=
 =?utf-8?B?cmZzK29RK0d4bkVpcWRyckpnMmFWTGF0eXN3Z3J3YVVmcTg1WUg0M3I3N3VD?=
 =?utf-8?B?b0R2T1IxdjRmbGJBUi9vKzR4QU8yL2dHNjQvdlYxYTVUOXhxZE4raHJwQTdZ?=
 =?utf-8?B?RlVCcmJWakhqWjRGeVVack02bS9Fcnc2R1p2VHg2eFFMdk00U1dZM3ByR3Zr?=
 =?utf-8?B?OU1UME01OTIwOTRVbGp3bzIvNkxoRjgrTFM4dldPTDF6VWtlYmJBeVUyb0V3?=
 =?utf-8?B?L1dpT3RCbnlqdjVBY1F4dElzbjBGSldqdi92czNqbVpHWU5ieU9SbVJVbnRF?=
 =?utf-8?B?UG44QUJpMWppcml3c0lCem1DenBSOWQyVE15YWRDVnIvdUJYLzVCbjI0YVVM?=
 =?utf-8?B?alkxZW41WVhHb0RxeFBiMFg1OHdGS0hEKzY1UXZsVWtXaFR0Ly9tcHJmYmdB?=
 =?utf-8?B?K1NFd3c3S2l3d093Um00c1NzTW83L3llby95bUhJUGN3UFFnSmNvc1UwZlh2?=
 =?utf-8?B?V3ZwUTRsNmkwK0R3NmZ2VlhqWlZXK05LY2xnSFdUdE1hRG92bFlpY21GdWlO?=
 =?utf-8?B?UVZUVnFBRHMvT3NkVC9OOC9BbWRNd0lCVDJ2MWtVWTZGUmFZOTdVTVBiYVpC?=
 =?utf-8?B?OGh6M250K21lb1pYVU5BT1FVWVhmU1dJU2FSaFlyRlNaamFJT0tDN3Q0Z05x?=
 =?utf-8?Q?v0/EiAFSXaIllyiI=3D?=
X-Exchange-RoutingPolicyChecked: eqbCmqvPSSsFJLzhzaMvPIUtrZiFkyT3oK+0cvY792M3g1KHmZ7NXnwQOys458BPZa8cnOnd2fJGr1gvRu5JtKOW4fshRLBuonYC4y9Spemrgmay/DkioM/XKUe6o0oMhIiGeJtwNFvESZrsrToXMa2WZP7IiXg0a0AuQD0aeTV4PoVUg01cwURG+aS16UEo3FoyDAi3r3YcILKEMffjaTkvW6ckC5sydjFQOJEZG+56b1AMukcW3o2J52vyq4JbQnb7m/7a76+cmB8aWY3tRyOTyApwz2sntGlzutqyzgNqh/W0y120JXzF5txiHaMsOSIqMXMHBI4xaJb3bmlJlQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cda1d2a-051b-4375-f2ad-08dec313af63
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 15:04:04.9990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RHdG4xkaTZup+Th62aCOqoqmkm+Brbp3IK7TOEdVE3ZqazK+quCobDVwgUoFp6lw0BPfe5XvKuJrfgZB84+QZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF7CF5FEA5F
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_080610_106417_4978B319 
X-CRM114-Status: GOOD (  17.90  )
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

On 18/05/2026 14:55, Adrian Hunter wrote:
> i3c_set_hotjoin() dispatches the controller's enable_hotjoin() or
> disable_hotjoin() op and updates master->hotjoin under
> i3c_bus_normaluse_lock(). That lock is a read-side acquisition of
> bus->lock (down_read()), so it does not exclude concurrent callers.
> 
> The hotjoin sysfs attribute can be opened multiple times, and writes
> through different opens are not serialized.  Two concurrent writers
> to "hotjoin" can therefore race in i3c_set_hotjoin(), with the
> controller op and the master->hotjoin store from one call interleaving
> with the other.  The hardware enable/disable state and the value reported
> by hotjoin_show() can end up out of sync.
> 
> Take i3c_bus_maintenance_lock() instead. Toggling Hot Join enable
> changes bus state and is conceptually a maintenance operation, so the
> write-side acquisition of bus->lock is the appropriate lock and
> serializes concurrent callers against each other and against other
> maintenance operations.
> 
> Fixes: 317bacf960a48 ("i3c: master: add enable(disable) hot join in sys entry")
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>

Any comments on this patch?

> ---
> 
> 
> Changes in V2:
> 
> 	Add Fixes tag
> 
> 
>  drivers/i3c/master.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index ab11e2d79aab..38ffc8713167 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -649,7 +649,7 @@ static int i3c_set_hotjoin(struct i3c_master_controller *master, bool enable)
>  			return ret;
>  	}
>  
> -	i3c_bus_normaluse_lock(&master->bus);
> +	i3c_bus_maintenance_lock(&master->bus);
>  
>  	if (enable)
>  		ret = master->ops->enable_hotjoin(master);
> @@ -659,7 +659,7 @@ static int i3c_set_hotjoin(struct i3c_master_controller *master, bool enable)
>  	if (!ret)
>  		master->hotjoin = enable;
>  
> -	i3c_bus_normaluse_unlock(&master->bus);
> +	i3c_bus_maintenance_unlock(&master->bus);
>  
>  	if ((enable && ret) || (!enable && !ret) || master->rpm_ibi_allowed)
>  		i3c_master_rpm_put(master);


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
