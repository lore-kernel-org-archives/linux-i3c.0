Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D5DC5AC67
	for <linux-i3c@archiver.kernel.org>; Tue, 11 Aug 2026 12:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=V7Ix+9SqvLKWkRjuKxTRdMDLg4/xeBkXkWnZ9UmX9Zg=; b=DsmPxHS4cIAwBKCoS9Uz18GRvQ
	IYIYn4GyOlUArHyNev+AJL4UdPAPHvFP1TVPef06XyKjX6p9dzx4bILd97O2wAbSzCeFfxaFJreA3
	55TMtLxDp0U6ipPIFGo+EtYN7FK4ZlyS7mZcsD0B8Z2+7ujr96mqESv8T3ZwNRaxGzhkiJHMUHyrH
	rBprDXcVgev5HIr4/1UzZAc8fQ1iaiad6Q5FT3Nhe4H+RB2mZuBBFLaajkJVjfAyAchBzfFkBjaKP
	N9sXSfa1CF+mLiuZoXFVNtKMQ5x0tW0Ck3nUSAOq55tU7DWvgISw78r38lzrfnFaTpdmeV/tggDI3
	4r5rYhSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtluP-0000000E32K-3niY;
	Tue, 11 Aug 2026 12:48:45 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtluN-0000000E320-1BfX
	for linux-i3c@lists.infradead.org;
	Tue, 11 Aug 2026 12:48:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786452523; x=1817988523;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=WrzeEDaE4kvBUaTteGL0miRxEhOgrqxeVCmgykAb2IE=;
  b=XoiSPgS5wfhM25CdNIAfGk/tnTkHPjd9vNBJyyiLYhbK8ygiMUNEZ83E
   pL2i4vc+ehKDtaYStBTzVRPM04C8l7Q5TUP8NnC4TLhCHEmEUiOyGZV5d
   lZMWpt11E82mOVGrOPcz5Eke51amXJDixuojHk5TjnR0uhmnee8FAJdIu
   2LsOAZPr1FaVIAipvFS/EOC5u4c5L51PsYtlQkueuIoiSik05mjBQM2hV
   tL3n1cScjVDxFWxhLtUGcSgysmRtHEUmcWAYQlVghSByfBLlfuBd7bYNk
   YMuBmvCQmRYpAn+dgg94ALkAp3gJqs7hNohCym0xb98uZju1PqjX3jOYM
   g==;
X-CSE-ConnectionGUID: QqpTwE4zRC+i0trX03YwhQ==
X-CSE-MsgGUID: Zv3BPteISPyh52OtOcuDyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="97578987"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="97578987"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 05:48:42 -0700
X-CSE-ConnectionGUID: EZB7q1o4QfaXlTxZ9h5dQg==
X-CSE-MsgGUID: 8Ziwo257RP+gTk+OX6BqFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="267606723"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 05:48:42 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 05:48:41 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 11 Aug 2026 05:48:41 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.33) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 05:48:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SWMOzFyVepph7jxKdyPF4+fT/4blvZKKMOZragSHZhjlQjT2yrBorCm0D2MfJBd0s/Tuxiq+M7vWAMP4ZvgK1awhlXQRauMfe4iLIjKDJFXZPlbePsFX+mdfkmQTXF16R+KFQWYyveP0t4Yrlbv+AvqXW3RRsf76L5tSMyyu8VAto/GOEI+8RqztQbxcCZdOLLC1SHux9koC6k/Q5D5UM96YewKytqX8z4yT79NA9nE/WDsEPWrdytgu8B7i14SHNgrSrpgbiWcrVGQzePU7zrOijEinoCxiSfs0y5uX2qbHCE2V0yULX313GsZeU4/QIGwn+a6kcJYAzbw4rON/mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NCgZSCfppujZomD9dbb8RtW9G2PU/wQ4QWLB7PheqrM=;
 b=vsUYS4n1kDFjJ/RFcDcfKkh0VmCLtY20K21ZwA0qiM+guFz34wy9653hbz43pMw8yBbNTGvxMra9bG7QJpJ3KRvpj+rVhwtR6Ad4A0FMsO9iuHX8R62Q8FpSApJNQZgb2i6HErpo99GKjPOfQDMoeoE8TIA3BxWM4jwagPqvsU5d3juQ18yRnwSDuu+Vrj4tvPEzSDc8dbbHr5oAA0spY3bMVuykhy/NNiBdfREE5qj81K7MM1YsMkPEZG1zNnJuBvj5HuxF5cf73JdkDPbNo0+hFN/Nl3hhkf0F1AqLgGtGYU2DI6O6OEHVL5945RdMf+SPjGvyMDpcv4ccX/P0yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by DM6PR11MB4625.namprd11.prod.outlook.com (2603:10b6:5:2a8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 12:48:38 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 12:48:38 +0000
Message-ID: <2be609c3-1c7f-41bd-b576-4a6b5f044d5e@intel.com>
Date: Tue, 11 Aug 2026 15:48:33 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] i3c: mipi-i3c-hci: Add support for AMD_PT I3C
 controller
To: Jian-Ming Liao <tim678910@gmail.com>, <alexandre.belloni@bootlin.com>
CC: <Frank.Li@nxp.com>, <jarkko.nikula@linux.intel.com>,
	<linux-i3c@lists.infradead.org>, <Jm_Liao@asmedia.com.tw>,
	<Chloe_Chen@asmedia.com.tw>, <Yd_Tseng@asmedia.com.tw>,
	<Patrick_Yen@asmedia.com.tw>
References: <20260709071744.333403-1-Jm_Liao@asmedia.com.tw>
 <20260728093239.487156-1-Jm_Liao@asmedia.com.tw>
 <20260728093239.487156-4-Jm_Liao@asmedia.com.tw>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20260728093239.487156-4-Jm_Liao@asmedia.com.tw>
X-ClientProxiedBy: DUZPR01CA0154.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::24) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|DM6PR11MB4625:EE_
X-MS-Office365-Filtering-Correlation-Id: 927691f1-8b6a-40a7-9323-08def7a6dd3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: DJ1JrwfP3eB4bo2GUKtqATveyjTPwWb0ai1UtfDItrXZn60/hSvel29A/sy5JjsEdilOnm5Lay8zNyxb3XV81VAIuKlluZLkp+PMXUUcxRiGNiL4P/ACvKbkyWi/ueQqZ92k9WRLuZ1K/Wq8XbsEu1bypNGwVIYS7LLBwB75VF3NK3X9v3eXJVC6iI9Z07ryPemjlnJyVk3tQ7A96SF6ErWJXjyvxK4GHtFSNXb4puDLjvy+eVOPWFn5zLcuXx7SjSkJVqgvg0bJyrHgZUsF1XzC1JqGtBOFrgrL8BLHR+GKwq6Th5KJhS+yxnh6ayuempJ7SPuwNEPZ7r9MkhR5q4Z9ci+82BrUeq0RMneO3jdDqTe4qXBxzfaRvT0S8fZVd5TigF0OuCkP0UvNCJBmKwXJN2+vZ9WEsEKe9+JnE9AuUyqhbH5PWcAq5tts3ljLn+i/ocDrvvqgG7P+0jX/452hIbmaLjNpgGwCWJDWRSKPnDGJnPXOVVMmlX5EGCSwi9fl7JKUsfJH36QmFzM15/myNzWlG4swguEU8TNWxiDrkS/+HpUT8k01LII0eDFUTfJNXvAwX5Sq+CP5qk+xpy/HOxlFR7dukCLSXJPYHUMq7x3SBvkd92monSkcWZZyBoKLfoP1LDOMkLSYOAgmB2ModOTNPdM2lsonK/9bhKY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UW85UHJhbmRFRVhqTyt5QkxPK05yYWo1NWViekQ0VEs3Mmtmc0dSRmFFZ0du?=
 =?utf-8?B?MjQvSzlraWpkcVhNZlV5Zm8zMElldTV2dXcwQncvQVpPeUZERDZwZk1rVlVt?=
 =?utf-8?B?dUhIWDZTSG8ra0s4M1VmdXBqeitPMjE0ZjZWcDhiNUhESStVY1A2ZjRERUtV?=
 =?utf-8?B?RHFpa3ZPUmZ0cTZ5ZnJRNUYyTGdEMmRHUmZ1YjYvRGphcGZacElkaFU0VkFD?=
 =?utf-8?B?L3ZjdzYwZHBJWkVlWDFOdmMvTXdsSDUxekszd2Vud0ZvUk1SQlNXQnMySDNy?=
 =?utf-8?B?ejNyYklOYXJWZTZ6TjRMMXNhZWxkcEYrVm5XeDEyTlF0REQ1aFNrNmRBL25p?=
 =?utf-8?B?VlRuT1dSQkozN3p3Z0ppM1dLNFpKUGVBdU9ZSVpHK0JCY2o2dzFQWkxpK0Z1?=
 =?utf-8?B?UmVXRU5sQUFvQTdzSVN4NUw4aG9JWlRQNkthSkFZVTcza3BCOEpFVGc3akZV?=
 =?utf-8?B?VmhpbWpIdUVVa3RSZjhXZXFUSFZsVGxWazFFUmlzNUFpNlFFQXpjMUZyRFB1?=
 =?utf-8?B?YXVyV1JxR2JNcWtsZXRoSkx1MU11akRpc052OTk3UzAzaUNLclBsazNXTk9K?=
 =?utf-8?B?U1BiSEwxZWtGakpibTlKSkthOVVxTUkrb0dzRHNOcEVkVE1MZDJGdlVMV0o3?=
 =?utf-8?B?NFVULzM4ZGExQ3dYS1FXOGpqNWQwOW4zclhKbnNyeTNkVHpDUkJZb2wyb3dp?=
 =?utf-8?B?MUhSM3ZWWnlFSHJvUTh3QytEY1p4Y0Y4WlpZaUM1RUZOTXg5VFpOMTZ5ZHZW?=
 =?utf-8?B?Q0s1eWgzSzdEZzBsdUVpYTRoTTI3cVFEYWFSa2FwVytVR0lxV2c2UE9Bek03?=
 =?utf-8?B?STIwRzA2THgvNlZGZUVkamczVU1QSEJDTXhmQjlaZ1JYbitBWXhld0pUV2VX?=
 =?utf-8?B?czJNdEZGdTF2OVI3MXdNdU8xR0RhVGk2Y25vSjBudVlycjdFOENWOWF4K0JO?=
 =?utf-8?B?YUEyODY4Q0owUm9neHBUMzU1WFpCR3kyTHgvUU9mU09rRUdHMld0cTh5Z3NQ?=
 =?utf-8?B?Uml2WG5wWExRanJOTVZGTktuK0k3WDQrckRCK3dPakNGY3hIMFlIMzhzRTV6?=
 =?utf-8?B?cFpVNDdhdWtpUXE4WlJVTFIwUlBIZzAxSkpOUFo5REtPTTlBN0IwVzJpaU1Y?=
 =?utf-8?B?cXd1Q1J0eWk4RTRHbUhFUVBVZE51UzhEWTFBRkpDTW9TQStwcFFMcThueGl3?=
 =?utf-8?B?NXZKSzIvQ0RHMEp3VDJGV3NZSG9zUG9qQWUvU3NVKzBIelpDaEVzSFJCVjJP?=
 =?utf-8?B?cDcrRWNXdGIzYmRIYkVtZi9OMk0yMjhjQzIzOU9JMmpHNitBcG1LL09pOHl4?=
 =?utf-8?B?WWhsWTdwLzRGSUQ1TWI2VXlSdnJsY1hFMjdHelZSY09ja1NaaWRGcm5PYlha?=
 =?utf-8?B?Mno3d3ZTT2p3cVJ5TGtLbll0bWhqdkNQL1dhOE9rSVlhcUp6SlVDZzJDSUo4?=
 =?utf-8?B?b2ZyeEVFSm4zblBjbVNReW8vOWJNNGE4L29tbDVjSjJiamJXMjdTb1d6ZmVI?=
 =?utf-8?B?Rjd5Q29LbHJYdTJaWDBPQ0hFSXlieHdaNlZ2bzV4WDNMbjFCL3V6SVhnT0VI?=
 =?utf-8?B?enFnQk5uR3o3MWJvWkp6M0xmcnMxK2NrLzhDMlFhbFlzUmt6dk9wMlQ1R09Z?=
 =?utf-8?B?bWd6cjdEb1JieXcyNWxNYlU1TnVINTZWWjJOOHVyWjBwdEdzMVZyUVU0UStF?=
 =?utf-8?B?VVg3QlUxWmxGeEdZVEtQZnF1Y1ZKeCtSN2k1ek1YL2dlajZuRnlYT21MSU9t?=
 =?utf-8?B?akJNc1NuOUovMU1NZEd1cmNwYkpTa1JqQkIyUGlta2J5NG9aQ203UFMwQi8v?=
 =?utf-8?B?NG9lRmVScE9yUUVzQXFsOUtOSTVURDJNd2x2RFVCQzR1ajJ3cFZjNlRmdE9w?=
 =?utf-8?B?OUdLeW5ZVHJEVjhHTG9nM3dFbkpDRE5zcldMWllUV0NmalVuL2JlNjRPTHV2?=
 =?utf-8?B?M00ySldnU3Jqam9DbkFJQnJWYXpoOTcyYVNsWWpNT0k4SVhPSytZTVlodUlx?=
 =?utf-8?B?VjFtY0F3TEVoTFdFd0xFaE5aRm5oaExuMC9KZUV6MTRJYVU0SlZhci8veWRW?=
 =?utf-8?B?V3dGMzBSU3JtUmx4YmswWG9vSzdsaTAxV2VDZlFWV1UvdWxibUpQUE9GKytX?=
 =?utf-8?B?bU1mZUdwV3o3a2RxcTZTajZiWXhZUXpJUEFxcnEvVHQ4bEwvNGQ2dW1HTml6?=
 =?utf-8?B?VWVKa2N4YXNSVUNlZGhEaVd1cTQvTGZBWkt0MFlQUmdKSDQ0dzl5VUxrNlU5?=
 =?utf-8?B?UWN4Yi9MU1BjVlJ6ckplMmRmMkR2eFlaT2duTVpuOTJISWZHeHF4RU9hT1Y5?=
 =?utf-8?B?UjZCbDN0NFEzcW1Ea2dkbG96eEtBdHpGOVFNNkQvTFc0SlJORDJUTDRhYUdN?=
 =?utf-8?Q?cCX4RncOHzrnVub0=3D?=
X-Exchange-RoutingPolicyChecked: lLWocvgmCm2lvxyCygP64hfupuXTq5aohaApII6G+pqcC0nmP+Wm0zt7GziKRGbm3WjfYBC0qkLDX76RwphUi8ZdWT+2uptOljSG4Xy5jux9MuQDdUqqox+3kaFyhR/oZ4ITdua/j6yepXkFoYP1CWojpvvDhPjnxv2keo0/j4EEbB4Fv/arGMmJw1LAa7LGhA/SL9IhFS840FuIDccq2lU2JvrwjCc42SRAChK78EuK5uK/quxP16nEEaIQdNpmX0nWIzKXPsMcQz6EhyrMXBRJQyzuVy+5Ggxjv8POP6TtP8a4sv6X29eWqBnQe5EgAApo6zZw06I0F0fAlPt02Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 927691f1-8b6a-40a7-9323-08def7a6dd3b
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 12:48:38.3831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e0IoFrWBkBLXtZXwnOSHA0WJ9NQLCV94+4e5HM9L6YtV/LeZRQ4MCa1dgTG4reiQNhjUggU1pw2wexuXIvxgmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4625
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_054843_391824_815B740A 
X-CRM114-Status: GOOD (  18.22  )
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
> Add support for the AMD_PT I3C controller by introducing the following
> changes:
> - Add AMD_PT I3C controller platform device ID in core.c.
> - Register AMD_PT I3C controller PCI ID in mipi-i3c-hci-pci.c.
> 
> Co-developed-by: Patrick Yen <Patrick_Yen@asmedia.com.tw>
> Signed-off-by: Patrick Yen <Patrick_Yen@asmedia.com.tw>
> Signed-off-by: Jian-Ming Liao <Jm_Liao@asmedia.com.tw>

WARNING: From:/Signed-off-by: email address mismatch: 'From: Jian-Ming Liao <tim678910@gmail.com>' != 'Signed-off-by: Jian-Ming Liao <Jm_Liao@asmedia.com.tw>'

Also missing Frank's Rev'd-by from V1

> ---
> v2:
>   - No changes (rebased on top of v2 patch series).
> 
>  drivers/i3c/master/mipi-i3c-hci/core.c             | 3 +++
>  drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 9 +++++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index dccc974ef15a..15f9faed07c8 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -1198,6 +1198,9 @@ static const struct platform_device_id i3c_hci_driver_ids[] = {
>  			HCI_QUIRK_DMA_ABORT_REQUIRES_PIO_RESET |
>  			HCI_QUIRK_DMA_REQUIRES_HC_ABORT,
>  	},
> +	{	.name = "amd-pt-i3c-hci",

Perhaps put '{' on a separate line to match the entry above

> +		.driver_data = HCI_QUIRK_RPM_ALLOWED,
> +	},
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(platform, i3c_hci_driver_ids);
> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> index 5a9e2a43eff8..d7549edd5839 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> @@ -193,6 +193,13 @@ static void intel_i3c_exit(struct mipi_i3c_hci_pci *hci)
>  	intel_ltr_hide(&hci->pci->dev);
>  }
>  
> +static const struct mipi_i3c_hci_pci_info amd_pt_info = {
> +	.name = "amd-pt-i3c-hci",
> +	.id = {0},
> +	.instance_offset = {0},
> +	.instance_count = 1,
> +};

Perhaps move this after the other struct mipi_i3c_hci_pci_info
i.e. to approx. match the order in mipi_i3c_hci_pci_devices[]

> +
>  static const struct mipi_i3c_hci_pci_info intel_mi_1_info = {
>  	.init = intel_i3c_init,
>  	.exit = intel_i3c_exit,
> @@ -475,6 +482,8 @@ static const struct pci_device_id mipi_i3c_hci_pci_devices[] = {
>  	/* Nova Lake-H */
>  	{ PCI_VDEVICE(INTEL, 0xd37c), .driver_data = (kernel_ulong_t)&intel_mi_1_info },
>  	{ PCI_VDEVICE(INTEL, 0xd36f), .driver_data = (kernel_ulong_t)&intel_mi_2_info },
> +	/* AMD_PT */
> +	{ PCI_VDEVICE(AMD, 0x444c), .driver_data = (kernel_ulong_t)&amd_pt_info},

Perhaps add a space before '}', just to match the ones above

>  	{ }
>  };
>  MODULE_DEVICE_TABLE(pci, mipi_i3c_hci_pci_devices);


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
