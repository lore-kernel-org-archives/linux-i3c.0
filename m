Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE33C43458
	for <linux-i3c@archiver.kernel.org>; Wed,  1 Jul 2026 20:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:CC:
	To:From:Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FhEWa467twfJfkVKHD5rQgA6YzlseunxQu+1BdhV0l4=; b=qyPQhRfu8ZCUio
	tmcpN5iGUtyigNfDjJghNPtQWad9c39nk5sjjWy8Brdt3/HgDmfxxhk7/R1GTP1+LEF0k9FiGIt1A
	x/Yn3PUUcV0GZ3w5kCnEGXd6dQiy3DvJFbyA68DioDltnD7V37e9jTzRn0pi9EdpI4p88Vfyuw2Pw
	RDpR4eJJDQomJw24Ru+wI6ULbsz3/yKwVjIbUL2NOoFgHNW82awYB9UJkSwH9tZa8MMAahDtLHU8R
	1/cms3+F+D8PIt8+MuvAeZ3UVGx2A2c810yVDnKVxJHVXUBHGXhNI+Z5XOOT6F+9dEs72TLF2oWc5
	fDlEzHDzMU/XaoE6u26A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1LD-00000002x3F-192T;
	Wed, 01 Jul 2026 20:15:27 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1LB-00000002x2q-2tuh
	for linux-i3c@lists.infradead.org;
	Wed, 01 Jul 2026 20:15:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782936926; x=1814472926;
  h=message-id:date:subject:from:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=9/xrxcW9VzGtbcXyjd/EGcdSmS8nIe9yKF9LSdvso6o=;
  b=JAWRw0tADNVDLf7Pzumd+bDwRnh5NkCl1830TAQxz9ViJatz9+5yuBkQ
   rN+6XWEus68qbxxADn6ongjx7dE8kreqJY8t3y7acYkfxswmRKinSVTlw
   tG8PY7Gc67TvpKiGKkSdG/8rs+u5+6yApeB8snKMSMeujeCm7qp9onJ2W
   gPerhBTTPxzPOCc0d4il+zgU7yZOoFpbVlp1nVb0m+I2dQDYhgBl9OdAA
   ZpckhfY0jfQ+X0+7Cv+ci39PY+5L6r7QQcCxJjp+a3jPiu3YKB8GqluBi
   hJ38MhXTKCTbNQ8Tm32cuypV/E56vzmVITL7scyFm+8sKJYYneg8u3kCE
   Q==;
X-CSE-ConnectionGUID: +3NtPZqUQ5mqyMbxaEZ6ow==
X-CSE-MsgGUID: +CJmGeXgQkGOiBUqalDRLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="82671763"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="82671763"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 13:15:25 -0700
X-CSE-ConnectionGUID: qR90ybXgRl+SWrqDLuq/TQ==
X-CSE-MsgGUID: SR0uOx6qQ1KF+1XP+pksjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="282737026"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 13:15:25 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 1 Jul 2026 13:15:24 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 1 Jul 2026 13:15:24 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.57)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 1 Jul 2026 13:15:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XINUJAbRD1uai4IkLM5jGEAGrU9EWLB/n7LFLb/lUBOz32Edk2YTfz9Nr+HGDEW6xcyROWk+iMDVxiFjuhqCNZCZDgvofQ41LqnZigCtRrnUwUJUKSg4SzQny+CP8W31/fGXT6/k58gNFDlZQhvcoG10/dOscPVAufD/OD0GvbS0VOQD6W7TCvJ4S5sx+38DdAlqVF8T2SjaxCOIOHJ+lRUZLQo0fjYWZGj+oQXwqayYku7e3Fm/xrpqnOIIHcFpGawqrm7uLwlQd1WYeai5oYeCcdyNoXoPEEIlrq8Bhm/LwuLXsFSYZJS5LWkegLZxOEfubSztaf6RM2zPGn8cYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MwABP9AO0zYOS/0w2keaJqqbkCRVPTOb4CERJw3yUNM=;
 b=BmTS+1ShpI9o03GVroRXc2by2Exgdis7mzJIrzHgcRfWa/fZrzp6w75apg3oNt1yd1V8Xx9SQSTI9VG7Ymyh7vOhTvU6IrSIxGiBplWeac7WpHm6w14PbyMUbFwt/1EncYme+0skf++s/41PvKumHxydGZMvKnZrg2OuXpJhz1TjCF8aWF8AjC4J7W0r8Pccz76IkiVz3/Hubet0osG2FOrn7u5ImCcgT2NrO9c5523Tv71YbODwDQ2vWU+GbSj2QZxpf46Zi89OUroOrYY5SyImfHlGtz3/nLIMhyvlSi50yqz3UXeLS/bYHIi0DaX5NwqtTNbgF3NNYnSPU78JJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by IA0PR11MB8301.namprd11.prod.outlook.com (2603:10b6:208:48d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 20:15:20 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 20:15:20 +0000
Message-ID: <b9392a56-c90e-43eb-a49c-c12bf13c5d8e@intel.com>
Date: Wed, 1 Jul 2026 23:15:16 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/7] i3c: Support IBI-based system wakeup
From: Adrian Hunter <adrian.hunter@intel.com>
To: <alexandre.belloni@bootlin.com>
CC: <Frank.Li@nxp.com>, <rafael@kernel.org>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20260701200552.220042-1-adrian.hunter@intel.com>
Content-Language: en-US
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20260701200552.220042-1-adrian.hunter@intel.com>
X-ClientProxiedBy: DU6P191CA0023.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:540::17) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|IA0PR11MB8301:EE_
X-MS-Office365-Filtering-Correlation-Id: 676d4100-4cae-438e-8450-08ded7ad79bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: neaBTU3nrSX5UZuuWprqJNvlbCE+x8lFuG0gU10/ALNVWZTsU7PuUv8Kq3+nkazGHomkIwdDtPhN0J0uH60ibK9txxv1RWti5MKdFOY5QozDbHzFvNiPZmC2KdF48zJWjcqO8F5C0q31IVZQ1Rj0Oesm1cILNCYJ1OJeXHW6kjeouQzCdOrxl53AnSFVs6xJlzREy+XUeTPyfsSQhijIU9rMYtbliO8yLi5dYpfmWmC1kOzM0GYvjX1aFJgyRQthFUPhdmq6OZc0nLHjZWgoLaMPfiIgcWzsNVm6sNbX0Sy0R3HY/LRGV7lV+p4xGFZwfm+r6xS8yn/zct6sF88X0qpW7VQRFFMKyr/7JygcZWZQ6ZxRUVAvlmDRYo4hkv9ICK7RaK/0TA5NNIlfxpy6F9oIA34GrVC1xSUeIT46c3Bol+4U3r0S77f+RuoaLb0svUctrOJELomMbN7C+FOgYErOPa8NBc03cIG6fPjOjFfnib3h2m+DIkP5Jr5ZS1lud4rVll/e3/pJHULhRRWOh3TSC7SvvhrC+NZJg+eC8vz5E0IV1hKFqPaBA7bzCd6OvrVvjvWyKQtGl9ay6fBmPx+sihOljW2wY6hCtV5yG9bkn0tTpV1LFl7BoLGkHvOTpjt9f7H6GUWPvlY6bDeGcHN/m52txgRHOZ8mGNP/De0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDJKeG5jYUhIbGs1MWFDTHkvU256QU5aV2hnYXBOWEJJaHUwY3R5Wlo0c3pt?=
 =?utf-8?B?U0R2VG9CakNHN2pBZGw3aDFJYnFYSXZGMGxOZHR5NkFyREpYZXlCME5KSm1r?=
 =?utf-8?B?R1JSSEV0Rk8vcHpFbGRrYjRqblFEeFFsOTBWcVcyTzlNTGo0ZEtGdHp3Z0JI?=
 =?utf-8?B?QmkyUERZWUx4TWREc1BBdGlLSVcyUW94ZG9UODN6cVpjVTFiV2VQOTBYblFm?=
 =?utf-8?B?SlVUbWFyWHdLRHlTMUhDNjFvWWNERXhmZVRsS00yaVlrMldJNU1RU1hQbC9D?=
 =?utf-8?B?T1p4Q001VVEyUjM1UGQvYmdQcE9SRG5YR2pHSCtaN085L09PbCs3TVFMalBz?=
 =?utf-8?B?djI4a3lKN3hjM0JaamRoT1pKRWppcmZGRldySmg5TG9OQnBxMms5Mkp4Vi8w?=
 =?utf-8?B?MmhlTzlFSGdLNHNoT0xtK2dRTEJiVGc5NmVLeVpyLzAvQmdPNUxyT3B6THVF?=
 =?utf-8?B?bElFcDhOKzF5ZHRvNVpNVlJ3cVRzUk1LbWkrRTI2ZmtsRWMyL2dxLzEycUcz?=
 =?utf-8?B?cFIwUGlUSzgrQy96Z1pvM2V5LytIOC9GQXU2RjlncTQvL3J4NUhpZS9QMG02?=
 =?utf-8?B?QmRJSUNQOFE3c28vVmJBTW81UkI5cVU2eUpJK0ZOekZuS3oxb3hhQkJJdUtU?=
 =?utf-8?B?OWVxa0NpUDFEdnRGTVV2enM1dFFrRDZ2NUZ0bmllc09GYmNjeE9IanRmQlFR?=
 =?utf-8?B?dU9WSkVsd1hFSndWMm1TcDRsYjhtdHBTbnBqR2M0Sko5cjVrbzc2b0dWQjZk?=
 =?utf-8?B?N1VybEJ4V1k4Y2RMRzNEL21vcVB5YnJJdTNQVndnMkczT2hoaTVkcGY2TXJR?=
 =?utf-8?B?SUg1R3VXQnBLVTNuRXZvL3ErYjF4Wks4YWJOWVp1Y2ZWUjd2VWFoNXRucjBI?=
 =?utf-8?B?Vm1GVHVNZkt6aGpzVWVTNEtNSmtTWitjK3p4ME16VkxISDFUeGRLalhuR2ZM?=
 =?utf-8?B?QlBHelp6bjJ1K0RCb0hTdmxWRW1icWlpZ28vbzNNU2tTbnpLeFZEYmpyZVFF?=
 =?utf-8?B?S2czcW0xcVFSakZyNmU4NjRId3I4Wjd4Y2JYM0Q1K3J4OHNSanZqS2pMMWE1?=
 =?utf-8?B?OGplbWQ2RlZTMkh2U0JmMUhlQXpncHRSMGdlY2V1TzhBNWNZSG9mb3lOK0dP?=
 =?utf-8?B?ZmR5TWpZWkFiOVVnVTdlVm5WbEZQVkJWbkpUM3dBVm9aSWdOaGw5Y2FRaFlz?=
 =?utf-8?B?QjQ4MVJ5dG93QmtVOHBSNEc4V1doWXd6dHpRMmtzcE1HaTc2M3hSMVg4d2M0?=
 =?utf-8?B?amxzbFVMZ1BwcnQrY2lOTEdrS1VPOTJ1RU0wT1A2SVVpaHlKNG9jSDMzWm5r?=
 =?utf-8?B?Rm1mVVdDdUJieDZYSTlyaHJYRURsOU5nWEtnZ1JSMm5ONTBIaXRvcXVLai9W?=
 =?utf-8?B?VEo4b1A5REtyNFlDZHVhTS9oRS9jVmJwc21MdEJIZEhISE13ZTExNTFXTUw1?=
 =?utf-8?B?NVZKUkZvVWR3OHZORVFqTVhyS1FMUFFvbDBHL2ZXclRuZWkxanpDdEF4aDFm?=
 =?utf-8?B?QnRlTjFFcGh3LzBHRXF6STZueUVOdldqSmw1bzdQMW1UclZQMTg3NnkxSXJn?=
 =?utf-8?B?S3FFTnlvWHJVNnhaMlBtYkFXK0xscm53TWNmdGU4b25PUW43YXZyTWZNWVpH?=
 =?utf-8?B?aWlacFh5L2UrMy9QWmRqSzRwMnBXVk9mK0hkVGJhdHVudkxFdUc1U0VJRTZI?=
 =?utf-8?B?a0N4THZNMHRsUkRlZVB5TU1Kdmd3MU52U2NYV1pmVStzYk1aL3YzcjhKWjhG?=
 =?utf-8?B?R3piWloyQWtWSzdScDdjQ1NZY0N5Q0RjNnBJMzFWNzFPYXpETnRLTmhlc0Q2?=
 =?utf-8?B?Z1lMK0o3NlZla2pkS3c2YVhsYWRJN3o1TGw0TzVyNzdGQ28yNlpxMGo0VUp0?=
 =?utf-8?B?c3R0M2RLV3lJbi82Y0Fxc1ExelI4aDQ0dzN1enpaVTl0bjNQRUY1QjQ0NlVs?=
 =?utf-8?B?VVNBaGFuTWJLUnVXcURwdk5ZbktOODVXZEF3SU9yU2FZdkZxSkVkNkJON29s?=
 =?utf-8?B?V2NaYW9udThEa2hVSzZuTFdVY1o3K08ybFNnaHk1cHQ1RlErZ1laS3hybEIw?=
 =?utf-8?B?QW5mV25seXB5TVdlN0VBSk9XS2UrV2Q5QmY1eDBnTG1xYVc4VnV6VFlaY1g1?=
 =?utf-8?B?TzhvT3NjbDRIM1JER3RsRmF5SXN4Z1lOU1V4VFVWZ1Y5SEdBS3F3Q2h0d3FS?=
 =?utf-8?B?WklNb1FRK25ka1B6ZllzUGpjLzlPQ3BCMmtMakNIQzhULzRJMTM3Um8vOEVV?=
 =?utf-8?B?cTdXY2tJb2lTOUFpdEtwVkpoSmEvTWhlWS9nQ01QK1JCeC9aQVdncjQxU3F4?=
 =?utf-8?B?Wk9mSzcwMThwanR2enFwRVFBSTgzdGlKTUF5QkdncVlzdHBWanJpVGpGbmFF?=
 =?utf-8?Q?ZdwgVMh95G/J3Qd8=3D?=
X-Exchange-RoutingPolicyChecked: YxGcFaGQxRJdBQjSmvHGKel7uFHtgP2M+CrjjLEkFqNGiQwP5qvzLOYCuZCezhmbpZhQlEet5FRgNL/ThLZ3QYtKdwpYXQurTRkNCKlXe8W6NAuuIytNq5UtBiv2dkk3JPvQnmKSeoE2hoGBhWe62Mxh7erGELcKbYkOky2dC3bgftIJZs59j2SHgiUO9e1nBuMdjmiZ1e/jEnubwQmiOgvWjaD9BgHeREMuoNk/a8iJHJ0DBf16bbYrSaVjJtWjpu6tBtUzSPDK/y/6YV+vhi+4q8smVCe/pe8Ab2fTj21g2k+GZ/ebGa69U6FnbweI9gokdSe7Pzl7V7s7MBUjNw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 676d4100-4cae-438e-8450-08ded7ad79bb
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 20:15:20.7622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2vGVrVBr5g+FHq12OlCIi/B3m/647GZx+fU/DUKrVKNRfurAH9caFkLlHkCudp867+LXc9o7DhxD3ewc52pqUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8301
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_131525_760386_C64DBAEA 
X-CRM114-Status: UNSURE (   5.97  )
X-CRM114-Notice: Please train this message.
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

Please ignore this thread, since I managed to put the wrong
email addresses for linux-pm and linux-pci.
I have resent the patch set.  Please reply to that instead.


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
