Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 339A3CD6E55
	for <linux-i3c@archiver.kernel.org>; Mon,  1 Jun 2026 10:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:CC:
	To:From:Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/lvXoFXwQ1sYiAk81+qO5xwM/G2BY6isSXI7Xvoo5D8=; b=rq4dix0iYWV2e9
	2CEcgc8JFKKgam3tKUYW9RkpbQi2PuniE0HeTVIIJtPX+sWTJj0pxyoTG3cAjoF2kC4ODAbG3kft0
	fNS6ORLnP44e59k2VlUwv28kJa8TN/Mixki8Uv5tR0T5dH438fE5kOA4KiTIUavIszi2VVKPiQn00
	xWZSCC45B2YxukDTW+DSRfujlZD7OV5rnIW1jfc+BCWQj4lqFEBcCiAul0ToNDAH5hT30Z4ipJ66y
	BfgevNy0bOJWy7MKrGRDQba/FnOOlMBGa+oO7JKtqtYrJPQ+ZV3A89IzVVE/Rj5vzdMM79KI02jxp
	n2lFNB+uWiM/ggsO+Q/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzx5-0000000Acxa-3s1E;
	Mon, 01 Jun 2026 10:32:59 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzx3-0000000Acwv-0yGC
	for linux-i3c@lists.infradead.org;
	Mon, 01 Jun 2026 10:32:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780309977; x=1811845977;
  h=message-id:date:subject:from:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=4Z1N5R3EEb3YmvaCABkjixDeVuFi19ekYONBqcYWlG0=;
  b=eQ0AQtKdB4xwEUQzQU3K8b+jQESVcVASntSjLNTlsYaw2Lt6iFcbPR2O
   DfULgijcBJ8Vg8Z/Y4cJLC0irIKgvQplLtpGBv/Q2tsaqp+ramKRV526F
   pYO2FS32kTJ9ndaZgtgANoXkjEg/c8XCGrU7Q6LPeX5+Y8cjISrzUjsNj
   4nYBV7CP3xxYVu5K/BC/EAS6a7fgiCQPTT08akTc5LA2c9DBW22ACCjDg
   eShZVoD77mGftztL18UjPnQvhKrBbak4nW0EgUDHRAgQ9asKDqZls4VH7
   qNvLjLyrRNnwmbwiESWlqNQkbAz8AZ27s6JVtTYWGcZMuyG8QRyespwiv
   g==;
X-CSE-ConnectionGUID: 2ueLGFKASp2RhjnbwXR1Vg==
X-CSE-MsgGUID: wHGGDTGdS4GKHE0QB6OdKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="103734531"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="103734531"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 03:32:56 -0700
X-CSE-ConnectionGUID: YIAtp4xSRKyS70neWhkBMQ==
X-CSE-MsgGUID: atetaxHfTeyc1nZvYMtopw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="245366682"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 03:32:56 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 03:32:55 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 1 Jun 2026 03:32:55 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.46) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 03:32:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FGLwzXjCOR95i1vJfRZuoaevrZUoKv9SDBipCkG88VdYMOvGivT61OL1Fs1YpM2K1g6h9FK82zXEjqkWi+UMauI+uQ88dfvAGj18a45zdlcdSDK39IDyJv4+kca6H4ItY5xZi8hkTltrzTfGHkI3PZPSauSVHEZAp21bX8dYOVYb3koi7p9Ezd3IhZPc1MFAsoalvnxrTl/zf581yceXw0uVc16JeYrjII1lcG2Zr2/I+zW0IzLdQ9ub8TemxvUSjoc6hvp09d4newWnQYNQ5i2SwkwFZ/VwHAwZKRY3Xq2uBvDNlHcCyGWPy4tkAt6jhANUcIsJOzZ1bUFbfbnaDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JTF6V8mjNx25GgtQyhFAAWLRVN95kqpeqdScR0qmSO8=;
 b=CJT7stPA6VnrmuyR4xqY9borbqSW9t0J+WCDJ3b5Q/gEnWsKhpJBtHC6JMRBUuYUbzY/NuVvK2STLkGprQ0rcX+RJu0G2LcibHeIGACvShjLzdEPqUdc779RFYj4aVplx+tb/GQrRtODGU0gzQWerJSFLKJ56/gKCtIIiq+do4+inavxcaPkgm+qWmhGWRW4NRCBd23wTCQjbwLN3RnFUCR7mp12wD6SyX+OAX1s1eG2QA0u4aKSZmdhctKblzrj9DozhuchDWfC7jSxapXA9ZTrxrMkXzEOMwiScaZ5Pe2+7gh27T8TjZiLClpj/6HTDTZudoP+DgNWbuH8yL1kKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by CYXPR11MB8729.namprd11.prod.outlook.com (2603:10b6:930:dc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 10:32:53 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 10:32:53 +0000
Message-ID: <964eb5db-9a65-420c-94ff-7e4a70054d52@intel.com>
Date: Mon, 1 Jun 2026 13:32:49 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 00/17] i3c: mipi-i3c-hci: DMA abort, recovery and
 related improvements
From: Adrian Hunter <adrian.hunter@intel.com>
To: <alexandre.belloni@bootlin.com>
CC: <Frank.Li@nxp.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20260515162621.57719-1-adrian.hunter@intel.com>
Content-Language: en-US
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20260515162621.57719-1-adrian.hunter@intel.com>
X-ClientProxiedBy: DU2PR04CA0154.eurprd04.prod.outlook.com
 (2603:10a6:10:2b0::9) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|CYXPR11MB8729:EE_
X-MS-Office365-Filtering-Correlation-Id: 74b1d102-482a-4962-1ebc-08debfc922f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|56012099006|18002099003|22082099003|6133799003|11063799006|5023799004|3023799007;
X-Microsoft-Antispam-Message-Info: a5AOGzZ78//xujrgXPKCKc3Q3nsRT3WtheZGIzl20YbH6vzMvflcO7PW3eRQ+VP+FUvjPNjPnXPP+oEkdFHCfXTM3N6OPaRYWwqNuGkuNHGE6cflRgavnqKJVUPpheCoOpz409sXrhfWnfd0LiKKyrXzTY/M0u2qllMKpoynUDMvF9b/Ufx6x2LFKswyMw7jV5KlEM3pWKDBYKvRSjwEFTMwelKMXAnZ9+Um8ski4vh3u02bDu+Nsc5wQapbdI6XvBZxFhAuxRcYLrHJL4kEim0Jys/eSy90M7o4U15sV1Edr6GYY0i1ZKBGPy+h0COAQh00Nzc+pHBbcvkY+dLRwIOGbQY+yzqX2ANoXQTIrwOpkO6MjVKHhSqepS26A2bMv8Z16ARrOUOme2JochUY5G6qyGm8FvBOGzVrkSD7v6j9dFzHsaG+MEfeFIE2OojOGwqPBNxfme8niAUw2Uno1p9rMv4Muxstdxgb01H2xHTENMX03ozCOQ5ZLuns6IP+dr1jhP42ZkznSKaQx8WzdZiO+bsJk06T+H6Ez51pCN1OuYc4jOJl37X+slRp52HYCL1J8Rj0QWOY/qMzkvU5AmExONJaCht47WibOBAkpdqwhQJCkdZKkWUbKyqviroBoOI7QobQaxXfxVb1G1k9lTSX4ccJL5t2sX2wVk5iEIosEjS2+pm4HeK9asNCdB3Q
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099006)(18002099003)(22082099003)(6133799003)(11063799006)(5023799004)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bENNOVZlaW92eDZURFZibGMzd0g3RkErM0hsbUZDZU9KQkp1dWNydnd2Y21U?=
 =?utf-8?B?SHdXaU5PUWF5aDRjTnR4c1dsbThEdXIzWEZ4UVN6dG5qeDYxcHl3SUhmN1lB?=
 =?utf-8?B?cTRQaDdxbERmQ0pOeDdmRGg3QTROM0Y1ZWc5YkRkbjV5ZVFkdWpqK0MzcHBF?=
 =?utf-8?B?TmdQS200UkNXVzBIYlJUQThIdmpYMzEwaC81SllJRmQwc3RDSFc5SWFxWEhs?=
 =?utf-8?B?eGRDNkZOTXBpTmoyOHFYMUNWWFhERFkwazhjcnFFdTg1UUhiQStsWEFWZXhJ?=
 =?utf-8?B?c09HQm5Dem5LVVcrb0xoc1ZFYTNXVnBGM05TaERGYndsRDNZZHRQV2tnNWVP?=
 =?utf-8?B?eWg4UC9aMjlmaExLVWxTc1ZoRWZlUHlKY0didkE2SXpFRDVDMEg1azh0QXA2?=
 =?utf-8?B?MTJyRjkwbXprMVl3a2tSZXU1QkdtS1BlSmZPSC8vLzd2Rk0rdzZmN1JkelJ4?=
 =?utf-8?B?c1ZJUEw4NG1sQ0dzYzFOSUJtcmhYd3Q4NVpJb2NDam9ZbkxwalVxVEVqSXlQ?=
 =?utf-8?B?OEVuQmV4am9VVUc2L1FGL3Z1MDJ1blNRWjloc2VrYUhKTk5VSkQxRms3eE96?=
 =?utf-8?B?NmhBSTQwbENYMlZEQkFnd2RWMHc3VWVvQmFjVGFIMjl3a3VZTFFMWWtXTVZL?=
 =?utf-8?B?OXVUTk9HblFTVno3TkxQS2hPL3dOaDZxREFJbDdZeFhFSVU5Vm5GeEtZRHNZ?=
 =?utf-8?B?S2U3QUQ1b3dXMDZIbDZzWUVGU1dqdTFxemlVM1JnMWdxQmZFcWFIa2Q3YlV5?=
 =?utf-8?B?SXlSNHpJUTh5cHA5eE9pZ2FXNVg3WFg4MUpsN3I2SnU5NTliaVVUeXNqTjY4?=
 =?utf-8?B?UVQyVkJhQ3NXSGgrT05TQXpiYW9mQXNhMW1hd01qazhwVnRFeWFIWFhYS28r?=
 =?utf-8?B?UHViRGkwb2tVTkFodjFqVmZFellBdExVb2RJWnpnWEpDL3FkSk9GSGhlc0Ir?=
 =?utf-8?B?Z0lTQlk2SnkwWlhoZENSRVN3TkRrb2N0V3dTbjNKRzhIWVNpT1hmVnJqMTN0?=
 =?utf-8?B?OE5FMks5S3haRnVoWDNXdGJEQVh1MTNDNTUzSzkrUEdlS1dlZnZYRm1SY3lz?=
 =?utf-8?B?S3NhTEdEajZIalA0YUhmTSs4WWhLTHpLSXo0cjRCS0J3anFpNDJQM0RFSlNn?=
 =?utf-8?B?ZGpUOUExL3ZsbS9tZkozdzk1UUZIOGN3VTNTbld6SG9qM3VZcmtnK1A5Q09Z?=
 =?utf-8?B?cmIwYmpSVUtub1lFbW91ZExRczQ3SmcvSmpkOHVqUXNoK2Y3QXdrUHFBdU5Q?=
 =?utf-8?B?NUVwOWJrRjhaZUlzaTBMQXBxRXNjRS9zRmJIM2s2R1JsZ25GMzFrNkorQ1JS?=
 =?utf-8?B?SUV4K3dMbmZJK0lLOEN1emlFZ0ljY2NtWFh3aEFBSjE1akZDMFBtUzdGcWVE?=
 =?utf-8?B?UjM4R2NOcHNWbVBkU3VEdEkybnh2V2wxZU1xWUQwWjlDSVB4SW8wZW1zN3d6?=
 =?utf-8?B?ZE1hNkdYTmdhVE9EU1BQSmNjOFh4V0ExS2tDZjgyZEtYVVNLdEVNSklCa0dG?=
 =?utf-8?B?LzB4MXBRVGZwTzZFM1lKRW14TDBpV0VQUGl3dlJ2c1dXaVVaNERMZTE1L2lx?=
 =?utf-8?B?bGU3VFdrMERTNXdheHIvYlJ6Qkh5RXpNaVNZeVhycmRQdEM2SmpUclliRFNH?=
 =?utf-8?B?WStyOGx1WVVXLzMzazdEenVRYS9nemVpdTdwb05Vbkt3OWZtSlpmbHVjdkZU?=
 =?utf-8?B?S1NIMTg1V3cvZ3pSR3hKVkFzdGkyMW5TNzROK2RTTFdjL01aYmJqRTAwOFpk?=
 =?utf-8?B?VUQ1VVNhSkpVL2N6cHU2aEZ0VExJTEhsTXdNU0R3MG01NFhFazlBMlZWVmtw?=
 =?utf-8?B?NTh1eVdaUkFKb0tKbUVWSWRqMWVwR3RZNGVjTlFMRGh6L21adkExeUVpc1Jl?=
 =?utf-8?B?UUx1d0NzM0l2RGJ3a2tOUmJWeVV0dzN0R3VBNDVyQXplWUsrMVlEbTBXSUcx?=
 =?utf-8?B?R2FoVUJlTTFRSXQ5Q0RtV21EYmpRTjhKdHlObmY1Qk1uL2djTExHcHM2VHdj?=
 =?utf-8?B?RVUvelVhLzNkR1pNOHp1WmliK2JKYWllVjJVSUN0UFZRSXd0U25xMVBnT0Q2?=
 =?utf-8?B?MjlzaUk5SmFyWkFBakdtTFNvWmJBT21SbEdENDkycGduUjE3Ymp2OVlNRk9v?=
 =?utf-8?B?Nno2bHJmNVhSTSttbXRsMm9MSnhqMStIOWZ6REVIK0FtNExWN0tDczJHNE1Z?=
 =?utf-8?B?NWhJTGNMeGFPUkY1ZEFadFJMZXZjdDRtaFJGWFdFTnFIZWxzMDhyREFIUFZ4?=
 =?utf-8?B?UTJkVFJoWkVVRkwyQkpHTDdTN1dVQlNXLzVDRGlUWTA5WHVXQlFFSFFzOFpY?=
 =?utf-8?B?bk0xcnA2NW5pR0lSMVM5d2IwNlNqM1lRQ0lGVXBhdFh0WDUxYWZCelNZbE5k?=
 =?utf-8?Q?qKX5NSBzFmcnMd7w=3D?=
X-Exchange-RoutingPolicyChecked: LRG8bragfrS4RJUk8QpRU1vKcQgn2Wf1OtlRxHBcK0Ml31Xld0gXNgIPROgIVjjGx1gIuPtEznKIUJRDzRGYJOoX9fgQzxumrcK6MVg86+bZ2PNR8zXYJfOVaWg2wSb9uJy0qI5O/dwiHwmffeAbtOWbq6ZItJxZuWHxqkY6kZY5qAkr6pkyZu6IgAbgPdWR8chYGmf/euQQXJKAzZbVh9Ffz1dViu/irlYE8CFIfCNQ3uqxtB6m8IY7d/MZCgSU+ZyJzvhE2ozVjjVg7rc5scRpHf0SsZ33ubVncCk7zalcqz8+KxAMFOC5e+XEGe5D5jmTFnbc83bFm14/C7A62A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 74b1d102-482a-4962-1ebc-08debfc922f2
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 10:32:53.1994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G5+yij44luUQCx4HJzrz7jM26HjjrrkAmm2/qgpJbr/zi5Q0UB4im6OyUfdG3+4wjs06/biYxh6xaGA1d4ZWgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8729
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_033257_346311_B1706C1D 
X-CRM114-Status: GOOD (  24.03  )
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

On 15/05/2026 19:26, Adrian Hunter wrote:
> Hi
> 
> This series improves the robustness of the MIPI I3C HCI DMA mode driver,
> addressing issues observed during error handling and recovery.

Any comments on V4?

> 
> Patch 1 ensures suspend always invokes io->suspend.
> 
> Patches 2-4 fix issues in the existing DMA abort path: preserving the RUN
> bit during abort per the MIPI specification, blocking enqueue during
> abort/error, and waiting for ring restart completion.
> 
> Patches 5-8 improve how partially completed transfer lists are handled
> during dequeue: moving hci_dma_xfer_done() earlier so completed
> responses are processed before NoOp replacement, completing transfer
> lists immediately on error rather than deferring, and detecting when an
> abort races with transfer completion to avoid restarting the wrong
> transfer list.
> 
> Patches 9-11 add Intel-specific quirks for DMA ring abort: a PIO queue
> reset after abort, and an HC_CONTROL ABORT before the ring-level abort.
> 
> Patch 12 factors out a reset-and-restore helper from the suspend path
> for reuse.
> 
> Patch 13 adds a full DMA recovery path for internal controller errors.
> When the hardware reports a TID mismatch or the ring becomes stuck, the
> driver now resets and restores the controller, terminating all in-flight
> transfers with an error status.
> 
> Patch 14 makes NoOp command handling observable: instead of discarding
> NoOp responses, the driver now waits for them to complete and triggers
> recovery if they fail.
> 
> Patch 15 adjusts transfer timeout accounting to start from when a
> transfer actually begins execution rather than when it was queued,
> preventing premature timeouts behind slow predecessors.
> 
> Patches 16-17 are minor optimizations: consolidating the DMA command and
> response ring into a single coherent allocation, and increasing the ring
> size to the maximum 255 entries to avoid ring-space exhaustion.
> 
> 
> Changes in V4:
> 
>   i3c: mipi-i3c-hci: Add DMA ring abort/reset quirk for Intel controllers
>         Inline HCI_QUIRK_DMA_ABORT_REQUIRES_PIO_RESET check at call site
>         instead of using a helper function
> 
>   i3c: mipi-i3c-hci: Factor out hci_dma_abort()
>         New patch
> 
>   i3c: mipi-i3c-hci: Add DMA ring abort quirk for Intel controllers
>         Factor out hci_dma_abort() into a preceding patch
>         Make hci_dma_requires_hc_abort_quirk() void; move quirk check to caller
> 
>   i3c: mipi-i3c-hci: Base timeouts on actual transfer start time
>         Rename start_time to start_jiffies
> 
>   i3c: mipi-i3c-hci: Consolidate DMA ring allocation
>         Cache allocation size in xfer_alloc_sz to avoid recomputing in
>         hci_dma_free()
> 
> 
> Changes in V3:
> 
>   i3c: mipi-i3c-hci: Fix suspend behavior when bus disable falls back to software reset
>   i3c: mipi-i3c-hci: Preserve RUN bit when aborting DMA ring
> 	Add Frank's rev'd-by
> 
>   i3c: mipi-i3c-hci: Add DMA-mode recovery for internal controller errors
> 	When erroring out transfers, ensure the final transfer of a
> 	transfer list is processed last
> 
> 
> Changes in V2:
> 
>   i3c: mipi-i3c-hci: Fix suspend behavior when bus disable falls back to software reset
> 	Always return 0 from suspend callback
> 	Amend commit message
> 
>   i3c: mipi-i3c-hci: Preserve RUN bit when aborting DMA ring
> 	Improve commit message
> 
>   i3c: mipi-i3c-hci: Prevent DMA enqueue while ring is aborting or in error
> 	Improve commit message
> 
>   i3c: mipi-i3c-hci: Wait for DMA ring restart to complete
> 	None
> 
>   i3c: mipi-i3c-hci: Move hci_dma_xfer_done() definition
> 	Add Frank's Rev'd-by
> 
>   i3c: mipi-i3c-hci: Call hci_dma_xfer_done() from dequeue path
> 	Add Frank's Rev'd-by
> 
>   i3c: mipi-i3c-hci: Complete transfer lists immediately on error
> 	Rename completing_xfer to final_xfer
> 
>   i3c: mipi-i3c-hci: Avoid restarting DMA ring after aborting wrong transfer
> 	Rename completing_xfer to final_xfer
> 
>   i3c: mipi-i3c-hci: Add DMA ring abort/reset quirk for Intel controllers
> 	None
> 
>   i3c: mipi-i3c-hci: Add DMA ring abort quirk for Intel controllers
> 	None
> 
>   i3c: mipi-i3c-hci: Factor out reset-and-restore helper
> 	Drop redundant i3c_hci_sync_irq_inactive(hci)
> 	from i3c_hci_reset_and_restore() because it is called by
> 	hci->io->suspend() anyway
> 
>   i3c: mipi-i3c-hci: Add DMA-mode recovery for internal controller errors
> 	Rename completing_xfer to final_xfer
> 	Add hci_dma_xfer_done() before checking for an already complete
> 	transfer
> 	Improve commit message
> 
>   i3c: mipi-i3c-hci: Wait for NoOp commands to complete
> 	Rename completing_xfer to final_xfer
> 	Add missing reinit_completion()
> 
>   i3c: mipi-i3c-hci: Base timeouts on actual transfer start time
> 	Do not flag the next transfer as started when there is an error
> 	which halts the controller
> 	Instead flag it started at the end of hci_dma_dequeue_xfer()
> 	Use hci_start_xfer() in pio.c
> 
>   i3c: mipi-i3c-hci: Consolidate DMA ring allocation
> 	Check for failed allocation before assignments to avoid doing
> 	arithmetic with NULL pointers
> 
>   i3c: mipi-i3c-hci: Increase DMA transfer ring size to maximum
> 	None
> 
> 
> Adrian Hunter (17):
>       i3c: mipi-i3c-hci: Fix suspend behavior when bus disable falls back to software reset
>       i3c: mipi-i3c-hci: Preserve RUN bit when aborting DMA ring
>       i3c: mipi-i3c-hci: Prevent DMA enqueue while ring is aborting or in error
>       i3c: mipi-i3c-hci: Wait for DMA ring restart to complete
>       i3c: mipi-i3c-hci: Move hci_dma_xfer_done() definition
>       i3c: mipi-i3c-hci: Call hci_dma_xfer_done() from dequeue path
>       i3c: mipi-i3c-hci: Complete transfer lists immediately on error
>       i3c: mipi-i3c-hci: Avoid restarting DMA ring after aborting wrong transfer
>       i3c: mipi-i3c-hci: Add DMA ring abort/reset quirk for Intel controllers
>       i3c: mipi-i3c-hci: Factor out hci_dma_abort()
>       i3c: mipi-i3c-hci: Add DMA ring abort quirk for Intel controllers
>       i3c: mipi-i3c-hci: Factor out reset-and-restore helper
>       i3c: mipi-i3c-hci: Add DMA-mode recovery for internal controller errors
>       i3c: mipi-i3c-hci: Wait for NoOp commands to complete
>       i3c: mipi-i3c-hci: Base timeouts on actual transfer start time
>       i3c: mipi-i3c-hci: Consolidate DMA ring allocation
>       i3c: mipi-i3c-hci: Increase DMA transfer ring size to maximum
> 
>  drivers/i3c/master/mipi-i3c-hci/cmd.h  |   6 +
>  drivers/i3c/master/mipi-i3c-hci/core.c |  82 ++++++--
>  drivers/i3c/master/mipi-i3c-hci/dma.c  | 333 +++++++++++++++++++++++++--------
>  drivers/i3c/master/mipi-i3c-hci/hci.h  |  22 +++
>  drivers/i3c/master/mipi-i3c-hci/pio.c  |   1 +
>  5 files changed, 354 insertions(+), 90 deletions(-)
> 
> 
> Regards
> Adrian


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
