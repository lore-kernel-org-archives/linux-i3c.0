Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A71FCCEACEF
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Nov 2025 18:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=rC0Ey9IgCyG9nQoQsd/v3dtzPiIfzujE3iMRkPpqDH4=; b=dF/yMjcK+dKvMEZHmg7Z/vJ3ET
	W/rLpTYddMhYyD1FLcB9NAL+AM//dPNKLalGIRIEioh/tYPDDB7zZ6/PQCTza4Nzi+NUr1GHPHT/K
	peYzGHI2fJKiwrJ9JAE+iKa3WGYLEqOIxAJBfaeBLvptSSImvEzWaQNYEL8lnE6UavTGWOF3z1ceO
	aKP5ZbCehAhNWVjbXptUj/EUNbkNMv7ZXbRLtmKLmwmflbxwn87mmPDW84H8BICyOnYNxm+kbajLl
	LicWki5+w7+oOH8n9LGfEOG84xD9P5ln1dh18diXraAcpIaWQrFe7E/wuxBm7hc/doFKrkwnKLYvR
	8uKFkr2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL3fq-0000000Gaez-1ev4;
	Mon, 17 Nov 2025 18:09:58 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL3fn-0000000GaeH-1Qy3
	for linux-i3c@lists.infradead.org;
	Mon, 17 Nov 2025 18:09:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763402995; x=1794938995;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=lkQiTx5wuLLrT8A5PLVnpiZMuc6JKGuP1FkYlr8RwoM=;
  b=d50l73zJwUvxUYRom8y1ooT0LcXigQ2dtZFyRxnEZiqs8HniWsiVThgK
   jsTl7ELNKgsXgM3dDnUw5rMZDFLmMdvPZloDQmfOMAnsjwF7jFaXV+KDf
   jnkmU3SuyNKwCZ7RxZuZV7mcW6aufdbNmPVuUhjGkyBrsUK5BY4+rHo7A
   uidUDF893yUrrV3S51u+QrPivSsXjEQon2sf2hS+/mhIHfgLQ7uXjkkEs
   wBSqK4EKroYgxS6BPh8WDpvNJCt/0IFW0w9UC+Da+wTjGtSAVhqzbIRS1
   M/7mavfICGSG9dKT+eYptlwsIFzzRx0uDn0i66a5aYtU9FNHl3KdshGrU
   w==;
X-CSE-ConnectionGUID: wZqQGJZTTmSEVSHXl9rV3A==
X-CSE-MsgGUID: ztZvYeYKTeCocihN02EU2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="76514945"
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; 
   d="scan'208";a="76514945"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 10:09:53 -0800
X-CSE-ConnectionGUID: DMnB9FqoSzGNccKYLDVz1g==
X-CSE-MsgGUID: yd+AwZLzSLCkhvJ0nFsizw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; 
   d="scan'208";a="195459921"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 10:09:52 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 10:09:52 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 10:09:52 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.22) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 10:09:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a5SfJ54lvGNtAaDlEu+J79OlSuPe4VcndnlUj3ZCY4SdFifWFpOOYC8d/3vh/G/1a4SAqNBxFz9ZHbA0umyLcMMyUSQaeqC143ThEpAlwiIgRB5n4jR/46LS5NvAXZ4Ov/PWgbqKgaom52NDgxaT1BNpMlxDjFFze6lOkf6P9/H94nD9nP3nDWxQzVfASSC77NTeubRxMz3ah1UEhYK0IkfwZ0BRVsyqBI7Um4BDlCJrXHKWTzxqL7dTlEu/mpQOaO3AoZOkmI7y+zuHZpwc/cDoU8PFqgZyJFm+nmw7VzYSwdwXnbKTnGGBHvasFoJnWLtoeG0VcMUHeJcKgGRrIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vpXolirKMjhgO6OH365DXHQh9e0A3JPhAj6cYSeLdLc=;
 b=YX5EF1VrYJVW/JZy9RIHqzOEuo06LQ9Uu4tuevlGrs6dEIf2bt+nI0LBE9o+iGPjNiJgQNl35Ru0mQoXS1bjAAG0ht+cOwQisOrbI4CIA1ViiiJZ+6xgwqNf2NBNedVo377FAM4ILRm4l5k7uzD/M6vg2F5I1q/cS6KfxUTrZ1dsHkdva1ilpm85eGFaqMDBi1xoSfETTvoBVIhAE58KYnXUNI51EtiaSZ3N8NizQcfd+DPdnxPsIZPZDzbDV3Wd4rWFdBMD6xR8wSaO2w02/jpDLIA0ck4CHOtvqUo9mmOYFDDSqJ4RPrmg1NjNDKhZg1cuIpdtRKZ1ZrLJ0ZR8+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by PH8PR11MB6706.namprd11.prod.outlook.com (2603:10b6:510:1c5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 18:09:44 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::eeac:69b0:1990:4905]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::eeac:69b0:1990:4905%7]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 18:09:44 +0000
Message-ID: <387c55f3-1ea7-43e8-aabd-1ff320a99eae@intel.com>
Date: Mon, 17 Nov 2025 20:09:41 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 12/13] i3c: mipi-i3c-hci-pci: Add LTR support for Intel
 controllers
To: Frank Li <Frank.li@nxp.com>
CC: <alexandre.belloni@bootlin.com>, <linux-i3c@lists.infradead.org>
References: <20251114181356.66515-1-adrian.hunter@intel.com>
 <20251114181356.66515-13-adrian.hunter@intel.com>
 <aReMbhYuSCT5RNnX@lizhi-Precision-Tower-5810>
 <e8d64938-9e9f-4899-bc37-dd78f02adc78@intel.com>
 <aRtGSstGcooM6mCs@lizhi-Precision-Tower-5810>
 <a5528063-176a-4646-ba0e-19d663b6ff7c@intel.com>
 <aRthVIuxnJHBEe/a@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <aRthVIuxnJHBEe/a@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: DB9PR01CA0015.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::20) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|PH8PR11MB6706:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d790ebd-1526-4d9d-5be6-08de26047c61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eEdma3NMaDNvU1M1RzQ1empaTDhIOFN0bXVEVkNsem9nVlkvL3djRlJ5aEl5?=
 =?utf-8?B?QXRZOVJ6ck1ScDd1QnFIbit1Q1BneDgwdXo2THpwTy8rZ3R2d0oyY3kycFU0?=
 =?utf-8?B?cDc2b0E5RWtjcWtoV05wMTJ2d1JraC9TczRiZU5zbS9nQUlTT1BSWDNnM05a?=
 =?utf-8?B?MW5UT2FrRTFmbDY2OHpBL1A5OXI1M1BJWlY0Um4wQUp5WVBIaExIUjBDT1hx?=
 =?utf-8?B?eWJUeGg4LzhxamYrdHlRSWhwQXUyWTFkM3dLYWJRQmZtV3hUbEFoTmhYaHha?=
 =?utf-8?B?WDIvUVF2V2huMUNrTkpmaTQ3Y09hcWRRbDdWTWVUSW94NUtYUmt2TTZTazdl?=
 =?utf-8?B?VnhNYnZnc3NBTTN3VjFJYVlxTXBEWWZnM3lVTC9SNVEvS1l6ODVZTFBPMFNa?=
 =?utf-8?B?ampBcjlldkVVRmJsYXBjaDNTQkJsMDV3VDI5dnlManlWL2d0Szh5YXMxRmRI?=
 =?utf-8?B?a0lSM3piKzUwMjBGYmh1blQ1Q2M1RnFWc3FwQ05HRmwrT0tSd0c4T2NydUNa?=
 =?utf-8?B?OWJrUndCZmxydGQ1MVRkNGMrOVcvVkVBUnZKamk0b0JuWlkzc3EzNjd2bnhE?=
 =?utf-8?B?eEwwVUZKVTgvUUV0dDAzOXFHRytUTWQ0bEhYSU1UNzZ0dzdzSmxZVThqU2pk?=
 =?utf-8?B?NjR2YnJVWGFVZHZVaFhMbjluUWpsUkU5TFp4WlVBVHFhVnFJVlBOUEtQdXc3?=
 =?utf-8?B?eERUaE9iaGd1dU85cndLWWtDaGFqQzdXOFc4dkxKVFprVVdEM1FVMWZSV1Mv?=
 =?utf-8?B?TjI5NlBmYjZlZ0RMSjRBQXhYT1NkUThKcWtsY20zSnp3YUNZWDY2TVFHTHVZ?=
 =?utf-8?B?Wk5QNGxWU1I2eEVWeFVvUkFsbDNaeWFuVFJ3UkExUXl3ZEVPZ3JWMk84V1U4?=
 =?utf-8?B?MnZTV29oK1BZalJIenU5d2JIVWE5OThNT0tCYzhoVzFLWm8wcFpFVVdOd1pn?=
 =?utf-8?B?MUdndG9KOFFZUnZMWTdzTTYwSkJOR3VvVUhCR0xVYTBHdG9RK3NMM2pNRnlw?=
 =?utf-8?B?dTN2THl4SEltQU1yNWNzQys3VEdxMW5lblZOaDBoRDgvSEplMnFraS80MkdO?=
 =?utf-8?B?OVBDb2RRTlI0ZWFTOXRhVTd5VEk0WUJVQi9yUkJNdWUyK0QvVFlQQnFTNURT?=
 =?utf-8?B?ZWxYbmhTZHN4Wm1qNGpITmJmYXlIL0Zxalc1NkcwUERndTN0Ryt2RkdMVWtn?=
 =?utf-8?B?UFpmRC8xcFROKysvSms0TkZJT2hBZ2NBaWtrMDg5UXBKVkpWM0N1bWtSRXBY?=
 =?utf-8?B?ZXJZYUVCb2sxSi8vT0hXTmM1eC92bVJPeGphNTlMWk5qNHpUMnpMUHVYLzl1?=
 =?utf-8?B?WVpZK3QzQzNZWU9Jdk9zQXlIZXBpSkF4THlBbmNkQ0I1Z3l5eWF4WUhhQ0gz?=
 =?utf-8?B?ZVNocDBXUWpocHdxNTJLM1M1NysranUwaFlDMjZIamNpbWN3MnlHaGxtNHkv?=
 =?utf-8?B?cEU1cDVZZkhQd0I3bitWSERTc1UwSk8yc1FZOVoyNlNLcEVjWldQeUpMTkZi?=
 =?utf-8?B?RWhoRno1VGVuR3o4N2RjNVdxY21MbFQyTlBnYkUxcDg1UE5kQnZqTXBON1ZN?=
 =?utf-8?B?d2FrdVJkbEF0U0F2bmFJUW5DTVRieUpyajBNY01ZdllVZnVzazlKSWprbC8w?=
 =?utf-8?B?L1NKeWlkM0FuajVaUmpPdEVNc2JLZjc2SkdHb1RVVlhFUFVudEpmSzNZWXZP?=
 =?utf-8?B?Zk1KSHcvWWNIY1RMMVN6QlY1QlE5dVM5Mlh2OTE3eW5EM283cG90bkhJbkdm?=
 =?utf-8?B?VFRWYngrRFpSSG5XOStjU1I3NEVYQ3R4eWYyQ0hkOHlhelJGSGdvcHZtOHI1?=
 =?utf-8?B?U2l2YmJnbWU5R2VFRXhMWnhpMjMzNmJyQytmbU5TS1dhc01rRnhJT01lS0ph?=
 =?utf-8?B?MEt1c01BRU03TGh4bENNYzNPUTZCa0xST2RGR1dBMXJQM2NJalpTTGhRY0NZ?=
 =?utf-8?B?TzhteDJsZXc5SnpJNElXeWthSnlGS0tGYkwvTXg2M0VUV0hNL0NKeWxlSU9t?=
 =?utf-8?B?YlNuS2d0WVRRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUdNR2lkQ2Y5ejhvM091TGc3cGI1SGpMd2JSajQvSjlVK09UYlZkVnhHanVZ?=
 =?utf-8?B?bHBsRmo4aElDbEZSSnpoRTZRMXl5UW03Q2VmZTJzdTB1cDZXSU5ZSzlvb0JV?=
 =?utf-8?B?UUdqZkx3ZXUydnFUNWsrSjhveGZkZnE4bzZYQldjQk9ZaHBOWDhKaFpDa0RN?=
 =?utf-8?B?UENBODVUU1Q1U1ljemFLNFZJUFVnaVMxWWRqMC83SmFOckxsRDFuRUhTWUtR?=
 =?utf-8?B?MmpEOVBld2lxRUFpd0NBbTRQZW0ycXZhUGl6Q3ZGSUNHcTdyQ0FtUkc3R20z?=
 =?utf-8?B?U3FwUmtQU1J0U1RhZiszSFFsN2xTUlFReVdWeHkwWllEL05Ud20vVzM0cm1D?=
 =?utf-8?B?SzZ2bk9tdjFEU0FXTDlFanExQTFGYzYxNDFPeDRnVnhJZHdVMFZ6UEpkRTRw?=
 =?utf-8?B?djJnakNXdDRRcXlOZ3V4KzhYdVM4U1ltMmN4c0p1TUhHbUJLclg5K1FRc2kv?=
 =?utf-8?B?K0hJbUFaSk4rZmV4dTBtTnJkaE50aUFLNUVveU0vTUZmbDhnUmIzL2Y3ejRq?=
 =?utf-8?B?dnZQR0dMTWxJVXlWV1NPUWNLNmV6bHhqRDdqcDBGZVArYVA5RkdxMDQ0T1NE?=
 =?utf-8?B?YW1VbDNINW01Qk5QSmRsMW5ta3hsdnk1bXltNXZKTHdwR1lGNEkrNUdVVkoz?=
 =?utf-8?B?RzZYVmU2ZCtUdWxmcENkNWRiOGdlT1h3NEpmY0lQVFFYTkxKRlFNdkhzZ0p5?=
 =?utf-8?B?MlQ0aEE4dzVvOGZkNzdSZHpCam1TRXhtNSs0S241UG5kV1RxUHVIbWs2RWY5?=
 =?utf-8?B?MElTZHcydDBzaXZxV3RONjFoNnFNQlo5eVEwTmdQYnQ2TUNTVzBBNno2RDk4?=
 =?utf-8?B?SWJuYU1scTZXN1Z6Y21ub3k0M3NtQTlaUlh5UGFldkRLak5Ra3RlUmJhbDZu?=
 =?utf-8?B?Nkl2VjFNWlQzV25kcEp6Z2xaYTRwYitaN1Y3cVZXcUVUUWVJMEVqTDkyempT?=
 =?utf-8?B?UlhlV0pLWnhzMElaVnZlRW8yd1ovWkl6Umg5OUVacmZNYjYvb3VKd2QvOGht?=
 =?utf-8?B?Znd2NEJlOGNWQ094Qmk0eVozb21vTjh5VEV6elQreVhlZENYZW03MTl4d1po?=
 =?utf-8?B?czZKYUJLMDVLd1gzWDAyQzREcE9nckdEUDg0UDIrbVRzOVNyRkJURUhmOHB4?=
 =?utf-8?B?NVFzdHF1YytzVWlCbEJVVktIbEhOb2FlOUNZT2tVbW1kbndRMm9kZFl2WkVq?=
 =?utf-8?B?ckZWOFVxOTZIS09nVG0vSThsbU83bGtvVmNhbzdrcVZ2dVZlMVN3dDVNTFh0?=
 =?utf-8?B?aEV5ZW1FR0tXdmw1eHVlaURpV2JzRzNkZGJXWGN3ZXZFME83ZzJLRUNHcUdh?=
 =?utf-8?B?MEVFcWcyUlloR0NRN0JxMTBTZEVmQkZKZGMwNkNxRlBpcG1pYzVBdm9hVnFj?=
 =?utf-8?B?TkpWdTlEcjl3T216Z2I4U2I4MzZjcVJzYmVhVUtTVFZtOTl0aDZSc01yT1cz?=
 =?utf-8?B?Nzl3Q1B5UXFMRjZkZjJFN3hod256aTNlSDZxV05LNzNvQ2dmYVBjVTltWnZB?=
 =?utf-8?B?bDFWQU93WjdLc0V5bDRLY29CeExDYjZNNmEzWlltZFRleXNOQ0ZoK2tWUFVW?=
 =?utf-8?B?RlZMbnNnVEhxNE1MN3RvTXpkTXhPRmFCVVNmTk11bnExYk1ienQyUjJNRGxK?=
 =?utf-8?B?dkNEdWJZcmZHWGQ1aEJtTXVvazVEVStPR29ZeStrV1BZSXBkS0RTdjJ1VDZi?=
 =?utf-8?B?MVp5eWtoUk5OUTByR3FGVEQzUjRrMFlodCtBRzlKV3o0VzhXTXVEeUJtSHY0?=
 =?utf-8?B?aXJXL3B3YjNaMnF6NXZNM1lWZHlLNEprZ2VOOFRQZUM1UWlEejg2ODlSOWJw?=
 =?utf-8?B?WWpBZmxnTFFpSmdNTkJnSlN0Sm9QTnZMR3kwd0Q3VlFnQzQrTFJCeG1VSjZz?=
 =?utf-8?B?R2xQamxMSWtvUktMV0tvWFgrLzltOGZ4ZmlkeEVwRFRYZlVCMlZwQ0RnZ1o2?=
 =?utf-8?B?SHVWK2h4MGdFUDdvaGRiOEFya3ZZUS80Q1crbGNUem0yZ2hPSlVzMTBQNVlR?=
 =?utf-8?B?ZEtXM0ZlNTBrdFR6REU3amNkTEkrVE1EbW9kYnlKUFdRUFZSUHAveEVRY1hm?=
 =?utf-8?B?TnBVRFVVK1BTczh2T0JwSTZyQ0N2b2NmZStkVUgxdkRnOEV2aDBaNlQza2F4?=
 =?utf-8?B?Q3lGUXhWekZIK3RldjlyN1ZPVEZwZ1Z3OVR4bTk3bU9SZjZvQy9Xc3BSOEFC?=
 =?utf-8?B?MUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d790ebd-1526-4d9d-5be6-08de26047c61
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 18:09:44.4248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VVuw/50fOhruw7ieM1VIaReP8fdWyivMk+sn0+jOW/4KXwgsjqzFWBG8v91JuvepMVcieCfXwbXEdSJpxGToJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6706
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_100955_492666_28750E0D 
X-CRM114-Status: GOOD (  17.07  )
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

On 17/11/2025 19:54, Frank Li wrote:
> On Mon, Nov 17, 2025 at 07:47:05PM +0200, Adrian Hunter wrote:
>> On 17/11/2025 17:59, Frank Li wrote:
>>> On Mon, Nov 17, 2025 at 01:36:36PM +0200, Adrian Hunter wrote:
>>>> On 14/11/2025 22:09, Frank Li wrote:
>>>>> On Fri, Nov 14, 2025 at 08:13:55PM +0200, Adrian Hunter wrote:
>>>>>> Add support for Latency Tolerance Reporting (LTR) for Intel controllers.
>>>>>>
>>>>>> Implement PM ->set_latency_tolerance() callback to set LTR register values.
>>>>>> Also expose LTR register values via debugfs.
>>>>>>
>>>>>> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
>>>>>> ---
>>>>>>
>>>>>>
>>>>>> Changes in V2:
>>>>>>
>>>>>> 	Make use of FIELD_PREP()
>>>>>> 	Improve handling of values that exceed the maximum
>>>>>>
>>>>>>
>>>>>>  .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    | 125 ++++++++++++++++++
>>>>>>  1 file changed, 125 insertions(+)
>>>>>>
>>>>> ...
>>>>>> +static void intel_ltr_expose(struct device *dev)
>>>>>> +{
>>>>>> +	dev->power.set_latency_tolerance = intel_ltr_set;
>>>>>> +	dev_pm_qos_expose_latency_tolerance(dev);
>>>>>> +}
>>>>>> +
>>>>>> +static void intel_ltr_hide(struct device *dev)
>>>>>> +{
>>>>>> +	dev_pm_qos_hide_latency_tolerance(dev);
>>>>>> +	dev->power.set_latency_tolerance = NULL;
>>>>>> +}
>>>>>> +
>>>>>> +static struct dentry *intel_actualize_debugfs_root(bool add)
>>>>>> +{
>>>>>> +	static struct dentry *debugfs_root;
>>>>>> +	static DEFINE_MUTEX(lock);
>>>>>> +	static int ref_cnt;
>>>>>> +
>>>>>> +	guard(mutex)(&lock);
>>>>>> +
>>>>>> +	ref_cnt += add ? 1 : -1;
>>>>>> +
>>>>>> +	if (ref_cnt) {
>>>>>> +		if (IS_ERR_OR_NULL(debugfs_root))
>>>>>> +			debugfs_root = debugfs_create_dir("intel_i3c", NULL);
>>>>>
>>>>> I think it'd better to create common "i3c" debugfs root. So your device
>>>>> use debugfs_create_dir(dev_name(&hci->pci->dev), ...) under this common
>>>>> root.
>>>>
>>>> The debugfs files are being created for the PCI device to contain PCI
>>>> LTR information.  The i3c module has nothing to do with that.
>>>>
>>>> Also, currently, there is no module dependency between this PCI driver
>>>> and i3c, but a dependency would be necessary to coordinate the creation
>>>> and deletion of an 'i3c' debugfs directory.
>>>>
>>>> The extra complexity can't be justified.
>>>
>>> Don't post new versin before we close open discussion. I see your post
>>> patch before this message.
>>
>> Sorry, but it is late in the release cycle, and it saves time when we
>> are in different time zones.
>>
>>>
>>> So, I think not necessary to create to root, which cause complex, (need
>>> lock, and refer counter).
>>
>> So you are OK with V3?
> 
> In v3, still create "intel_i3c" root dir, how about direct create dev
> under root
> 
> 	debugfs_create_dir(dev_name(&hci->pci->dev), NULL);
> 
> to reduce unneccesary complex, (like mutex lock and ref counter).

Could do.  I added intel_i3c to match intel_lpss which is also
PCI devices with LTR e.g.

# tree /sys/kernel/debug/intel_lpss
/sys/kernel/debug/intel_lpss
|-- 0000:00:19.0
|   |-- active_ltr
|   |-- capabilities
|   `-- idle_ltr
`-- 0000:00:19.1
    |-- active_ltr
    |-- capabilities
    `-- idle_ltr

3 directories, 6 files
# tree /sys/kernel/debug/intel_i3c
/sys/kernel/debug/intel_i3c
|-- 0000:00:11.0
|   |-- active_ltr
|   `-- idle_ltr
`-- 0000:00:11.1
    |-- active_ltr
    `-- idle_ltr

3 directories, 4 files
# 


> 
> Frank
> 
>>
>>>
>>> Frank
>>>
>>>>
>>>>>
>>>>> ...
>>>>>
>>>>>> +
>>>>>>  static const struct mipi_i3c_hci_pci_info intel_info = {
>>>>>>  	.init = intel_i3c_init,
>>>>>> +	.exit = intel_exit,
>>>>>>  };
>>>>>>
>>>>>>  static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>>>>>> --
>>>>>> 2.51.0
>>>>>>
>>>>>>
>>>>>> --
>>>>>> linux-i3c mailing list
>>>>>> linux-i3c@lists.infradead.org
>>>>>> http://lists.infradead.org/mailman/listinfo/linux-i3c
>>>>
>>>>
>>>> --
>>>> linux-i3c mailing list
>>>> linux-i3c@lists.infradead.org
>>>> http://lists.infradead.org/mailman/listinfo/linux-i3c
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
