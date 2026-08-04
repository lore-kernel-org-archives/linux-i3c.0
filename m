Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F051DC55822
	for <linux-i3c@archiver.kernel.org>; Tue,  4 Aug 2026 16:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:To:Subject:Date:Message-ID:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ewDdxnvpkxrBaBSRO9d10Ltx8JohwP+1PY5eRoyYDF8=; b=SVcQzttt9r9xmcIowQsG4hyP5f
	XVMFkW9aSCGw5oKBTMWouz4mpeIWS6zbTSTDQdATJ2/c0OWbNnxXxJd4/XxFDB1CVvXW9RTaxfZkF
	yU0OdYaVDl8EiYu16AY2uD3zsrtBcsiB3me61ZARqUDqync8VeqzST0WqTMak9TU0qPNDvSpJiFmB
	AEKkTM2FQJsJFr6sQimz3pyoGNOcd3J6SBtmQ9xMUltuyxwMaTF1YmVOxSMifvKW0LIKmiZlRYEe7
	atlRme273Vya5PrZzyAIJaZWrGrtRwbZeLjL3MjqoXjVs1jtfH3j/Vs7YboaMAfKZXXbhXZvcs/UO
	YP7LppEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrIOt-00000002OuW-2ueD;
	Tue, 04 Aug 2026 16:53:59 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrIOi-00000002Osa-1Qqa
	for linux-i3c@lists.infradead.org;
	Tue, 04 Aug 2026 16:53:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785862429; x=1817398429;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=fJoBY2QjSMx6IOEUFr+K3fwQ1xo7eVT2wVNmRyFEPkg=;
  b=AavFrQmPSqIc/seNRwcG7yE4AJdMw3rCrtJ9VSCxUuHhHvr4IVhS41Qx
   /GnLK0hOlMcwfN2xVPzMYkwcaf8DLtiZ0G4ImFFiA2baCcOty+2H2pvQK
   9q2ryT3E+jwCukpT4vKQW9O1lThsWi8hk5WaBQWD1ewRo7hYDk29F1BQs
   BXvGYwB667aT/17IyfFI66eMe+Ox3c/cDxq8hdFCp2rIFhrTA92QmWQPQ
   Qv7/pwlTBTeVEBv+hAqK/FI9nrzl9t2MBJHbsEtW8W1cCpKckRZvuKw/T
   fyMUbjClKcowEnZMbabJlso2X3GmFvES8EnDjkOnv/3bif/UYO/p1KUZr
   w==;
X-CSE-ConnectionGUID: mYFW6Pn3S0WpL451yT+66g==
X-CSE-MsgGUID: ZdzNlGoRREOICeADe5mEbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="103825477"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="103825477"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 09:53:48 -0700
X-CSE-ConnectionGUID: GOa231dtTuWAyr9sbQliYg==
X-CSE-MsgGUID: cbfM0p4gRJmwVXXMrt+PSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="286202242"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 09:53:47 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 09:53:46 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 4 Aug 2026 09:53:46 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.12) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 09:53:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I4QrXe/g+XYIAIFuBwfCzTfjrwKiyqPOOCDu3AgLCG3eYLdgx1frsLAS4k4g1TmOHUavExOq1AFgb0YpUyzNsb3e2VrPgm35GGI7amtD/BdGw7gizarex+RimFv7wiaPTaoGs0NxP9v96xOScbpiH2q7AGI+9CTdaxyxSTDw0ntBycLZ111ycca2wNrUQQANJFqEnSehePnWzoYNs8ldkKhyHaeqZ6akvd8ieKHP7r9sCtjsxRVNZc5+3QCTtU2cXpunp881jU9CKLr8T5HzCJalqJcITmqphsRVj+4RUkJ8ceQaoX47umgRgxVdOoMQzdlXFl6uo/vtDCz5Nowdow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nYB6F1QseClQB0gQstdIxqNohmdberDRc4wfKDfc7NA=;
 b=qBepOKxhD5IVOZqGLf4OLJjoIpdwx0Q6wGlauouPScZ2OVjJAJJ+vW4nwjkoV4kXcDAeeJwfRN9kZ4TEwMzg5mdgMwTCUfFi0xbaPKRA6zsN7LG7xvXazhdqDhXKO3BB22I1kNVOyQWBsmwj1WGnbBPq2Eg47Tg3MuoDaPHYHammYw+xSQitTLBC2qPYorPetnJoC8Hnawy5SAagiRTIxve/1Tgku936vR3lv+vC75ZenkIMXIefv2mpgnD8sAJafhb7+BiQXfUfbIVz+zSreQDD1fX5PLDMFHWG1LPNbUZePuioP1YFKVybR/kdE8f8IKShnETLSJdlpElzxwvp0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by DSWPR11MB9558.namprd11.prod.outlook.com (2603:10b6:8:36c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.16; Tue, 4 Aug
 2026 16:53:44 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 16:53:44 +0000
Message-ID: <097979c7-cb32-42d4-b1e1-00db4ce39160@intel.com>
Date: Tue, 4 Aug 2026 19:53:40 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] i3c: master: Fix refcount of i3c fwnode
To: Akhil R <akhilrajeev@nvidia.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>,
	<linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260804101301.2975911-1-akhilrajeev@nvidia.com>
 <20260804101301.2975911-3-akhilrajeev@nvidia.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20260804101301.2975911-3-akhilrajeev@nvidia.com>
X-ClientProxiedBy: DU2PR04CA0261.eurprd04.prod.outlook.com
 (2603:10a6:10:28e::26) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|DSWPR11MB9558:EE_
X-MS-Office365-Filtering-Correlation-Id: 598f5d07-6fa6-48d9-40da-08def248f202
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|22082099003|18002099003|4143699003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 1MFP5A1Lb7ZaTnmaGJ5w64jG1U0Syt6lsJ+b3kHF/AssMVIZcN9yoYtqocgT944+n29N9GzEmxsB3FExVIGaqbLV/jX6geqdtEbAGRweByO+NkyZQfDNiWIyZX3TT2LYvhyNnMTs7/CyUxkGjZS67DkdmE7obgm7WZPTLidtufI3oMvWE4E2qlOQsm6AdWQj4JO9Djx8M43/lc/bRRRAn48xeCnLnVfUGZmrtFq/GB724V/Qh+1v2fHiuR6SdaP5mRsZpZXRK4N32BLunWHc37RKFHyj6864btb8Nf+Kc7/E3S/9dBfWSSrKkMd+XzLKxLsN5kyu1+eMu+BpjJaDaUYbid6sLdEmI3GfmYS0xoKRdPXrvy59s0l5uy77DUaZe+w/kUFkDQLupWEeaPXwOHOxUrAdljnuLfLXAh+R+vK9Qd8xG9lmtzGBceSgM/oDxe2Lx6cLF3/holqEz8z/UmJKLyCAQZJQOA2RkGD9j90izsCF7ceUAErN8Fxao4/VqKMZPaoBqMi5GNaplXu7sWB2B4ETsVWHx3C8DR4UNqKMHTagIIGYp4LoQMu5bHapoqVPeNJFPkvHoF1GTEjQ4chQKiHYPAw0bY9ZQNTHB4Tu5zVFX9JVXpFrIUg5LMr6xDXg/r42/Z002LTvFeoX4p6qMel9JG36EzTSWwsP9Y8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVljQy9IblAxTWl2WGVXVTNtM0xBM1hmanRnV1c4SFFrTWdJY3d4OVFWV3Aw?=
 =?utf-8?B?cFk3WlBvMHpzbHBqR0h4c3Rrb3VTemYxeXdQSGhyY2Yxd0htNFFRK211by9X?=
 =?utf-8?B?N2F2TWRVbjZnWTdLdnliaVcvZ1c4REhIMkN4ejlOb0lEMkR5bExSa1FrQkw0?=
 =?utf-8?B?d0t5QVF5RnQ4L1AwemMwbUtFU1hCVjloRjYyRGxKNW9SQ20rbjlweTZUR1ly?=
 =?utf-8?B?RHdONEZLYTRra1pXZ2cxaHpJWnQ3c0xQSFM4NXE1ZXBIRzZiT21vY2RnemNs?=
 =?utf-8?B?dUZLbFJNdzBLR3Q2WFhDVXBLWmtRRjV1TDJteGpXM3hKTVlHbHgvZ0lnWTBu?=
 =?utf-8?B?dWdtaGV3elh0TzlmeWh2T0ZUNlE4d1ZjdlAzNTUvV3hKRzNDSHRMODBKSWx5?=
 =?utf-8?B?Z3VrUExBWEdST1poeDZ1aXp4THRhSFBYQUVNNVR4UXdmK08wT0pLSzhzVkJa?=
 =?utf-8?B?ekNLRVc1ajVIeFJvMnBCRTVMMktKaDMyMUM5UDJPQ0JiVHBTVVBReDhRcDNm?=
 =?utf-8?B?QjJDbENxQWc1QXBXOTV1RzRyeDBCTXVGSCtjc0N4RFBYWlV2SFZjR2hpYlZL?=
 =?utf-8?B?MmowOFloQjZselk3eHo3Y3FMNFEzMHBxeWxSQ0xUTHI4WG1xWEZRbU10OGZm?=
 =?utf-8?B?NjVNSkJ4dm9nWFdqY1RPQlVpNUI5ZExPL1drdXVUanZvNVRyd3REcXp4aC9S?=
 =?utf-8?B?NXh2bVpoYWdKQ1RHVjVqYU5BMFBGTi9kcTA5OU9jVUYzNXB4SlhkVThGTmUz?=
 =?utf-8?B?eFp6Z1I0SWxjZEczRUtPSU41RTJ0V0ErN1RkN01pQzJRV0VaZWNMdm1qMStL?=
 =?utf-8?B?Z2dQbVVzV1QwM2o2cWhKOWRHTzlNS3krUjZ5WXZJNEdMQnZuUjdLUFpDTWpy?=
 =?utf-8?B?QUJ2cyt3TkplN3A1NU9YekNXQ0E5aXJTT1IySGpwVjB2R0tzb09wU3ovWXgz?=
 =?utf-8?B?RCtpQUpkQzFwcVpKT0g4Q3hWZFFVcjc0cjNsNHNORG5MN3dobkwvd09hUUNp?=
 =?utf-8?B?N2tiYzJYc2lscGt2dnFxdGpUM3NmOWF2cHFNUWZBL01Gc1BhSGFTRmFxV0Vy?=
 =?utf-8?B?ZkdUU1BwSTNyc1pkYzNxajBwY1BOSzlOOEZiUThieVNHRDR3RTZuZHgzTDlz?=
 =?utf-8?B?cndtdWJlUzNwcVFUN0dpRkRMR2ltOVlFbEJXd1VOOTYzV210L2xwMDBWcmRh?=
 =?utf-8?B?WXFrYi85M01pYzlNbzVIZGFkREg0RWFrOVQwMTloYXVsc1Z3bklBRGNIZlRu?=
 =?utf-8?B?UWY1VEhTbEdYZkRZUkZoWHFOdEU1T1dsa3RqUG8yUDVac2diUDBCMXpLK0FH?=
 =?utf-8?B?dExQRUQvNVFGSzl3K0lYUXFxQWRHenZNYmt1MlN1SnpmTUlJT3pMMExqaklo?=
 =?utf-8?B?MzkrZWg0ckhXYlpwSFhhQlpISHFza0diSEFJZ0tGV1RnYkZDeEVCY0lsM2ZE?=
 =?utf-8?B?YnpQOEFNaitQNGJIQnIxbXJTaVdNQ0JNZ0VKYW9YdDlrc0NOOTkrVjlOd05G?=
 =?utf-8?B?U0VhL00rTWMwaENCRHVJcWlQNWxJOVBUYlg5NGxDVHdhaTdmZmYvR1hmRjAv?=
 =?utf-8?B?N2hLOTRwcEVqQTQzT0g0Rm1FWXR2dWt4S1VwTHV0NG1laldUaGpGT0dYeXNn?=
 =?utf-8?B?MlBSdlp6dlMwOFdYdzVTSFM1WjFiYXhwQkpiVUw5a0QwaElzM056NXpyUXFY?=
 =?utf-8?B?b2NUY0xLQ21IaUkwR0hPSmVranN6NzQwSFpHRkhLR2l6b0ZvYXNUNWRKTHFL?=
 =?utf-8?B?UFpDejVNVmJnRlFVY1BKTjdMbWxpTlBYbm9UcDBzWXhxTDY5eWFqSUZhUlY1?=
 =?utf-8?B?d3F3TnBRNjZqanhjL2NrTDM2Sm1FcFVBSU5SZ01ZWER2SzdHSUo5RlA1VDZa?=
 =?utf-8?B?R3JXS1ZsbHNRQm1HZmFLeEQxcnBBZWw0WkxNZFVMNnhKRUdlbStPNW1TbzRv?=
 =?utf-8?B?d240UDQ2SWU2eDkvNlFnc0YxYzQ1RkREVTNRK2tBcFZXWUxXNC9BRU9qcmZQ?=
 =?utf-8?B?YTNvMzg5TUhvdEQ5VWFveHRBZVZ0bHVPd1U3VThrTU1EMXREdGpmWmhLN2tU?=
 =?utf-8?B?dk1zVFFBYUxGZFVPcGhGdHduSkZwQjdXOXorSmNJNVZMYVc0TUx3bVkwY2hK?=
 =?utf-8?B?aFpxS2JoRnBEOGdLc0xQSG5ZRjlEQWMvZ3lVcVordUp0WGdyOWpCenNxK2Zm?=
 =?utf-8?B?dUZNME5EK0g5Z0E0MnEwbURJVEk3NmttbVRXcmxNd3hBQ2o1UzBZQzZwR3ls?=
 =?utf-8?B?cTQxWXI3SVlnUkpWVGZGMTdEYUcrZWl0eThRNisxR211K3MrTjJnSDBMMkFO?=
 =?utf-8?B?M0hoWGRaV2ZQb3kvV2pUTzhYbHFqdVQzbWV4L1ZRWnhVdlBTY2RBOEV0aHdw?=
 =?utf-8?Q?z4yH4smT9qGX69PY=3D?=
X-Exchange-RoutingPolicyChecked: eUZ4wkejlbarpuviRr66ceGFrnSzHzPdCID6AByJAJfIspIa2djDvBicAivkWRxZRijVWZfuoGz3jPFPfzodFJMbaj9f3SaCfAdQa6fmBX4+bvt0sPQPMEuhEY6UkE/YhNlBvkMsuMjeJ2njDQKKbcKn3SdfyuECjR2xxMi8ASxxbFCY1FpxPfoJbgMGT5B49OmQAC1M29Kbexxe9rpQrBmaBqEGiYWpy3dDsli2MoVuLqSE8zxBPUaj3L+Me3iXNdnSs5ajmj/ogcdh33KVAPpLxUEBgTMFe5d76m17xB2vpDAVDfrM+i10p5f6PjEt4aInPULVNX/p6sA2hddmVg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 598f5d07-6fa6-48d9-40da-08def248f202
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 16:53:44.6729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ekdQ2ZG+oP+SBr4gtAjBZpEaKXN5SvH15XereRZIhuHGdA4SsBb/kesdXcnpa4/6Wjrzmn+WEseWmuVJGd9WNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9558
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_095348_451373_7BC8F66D 
X-CRM114-Status: GOOD (  20.70  )
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

On 04/08/2026 13:12, Akhil R wrote:
> i3c_master_add_i3c_boardinfo() takes a reference on the firmware node of
> every i3c child described for the bus and never drops it, while
> i3c_device_release() drops one that the device never took, as
> i3c_master_register_new_i3c_devs() assigns the node of the boardinfo as
> is.
> 
> The two mistakes cancel out for a device that is registered exactly once,
> which is why the imbalance goes unnoticed. Register it again, as happens

I think it is (potentially repeated) registration failure path

> when the bus is re-initialised, and the count underflows, so the node may
> be freed while the boardinfo still refers to it. A child that never joins
> the bus leaks its reference instead.
> 
> Take a reference where the node is handed to the device, so that the one
> the release callback drops is balanced, and drop the reference of the
> boardinfo with a device managed action, as it is done for the i2c
> boardinfo.
> 
> Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
> Reported-by: Adrian Hunter <adrian.hunter@intel.com>
> Closes: https://lore.kernel.org/all/97465893-3650-4f37-98b7-1db76fc6fd03@intel.com/
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>

Cosmetic suggestion below, nevertheless:

Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  drivers/i3c/master.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 08dc10f172aa..568788e4cdb5 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -2102,7 +2102,8 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
>  				     desc->info.static_addr);
>  
>  		if (desc->boardinfo)
> -			device_set_node(&desc->dev->dev, desc->boardinfo->fwnode);
> +			device_set_node(&desc->dev->dev,
> +					fwnode_handle_get(desc->boardinfo->fwnode));
>  
>  		ret = device_register(&desc->dev->dev);
>  		if (ret) {
> @@ -2994,7 +2995,8 @@ i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
>  	boardinfo->fwnode = fwnode_handle_get(fwnode);
>  	list_add_tail(&boardinfo->node, &master->boardinfo.i3c);
>  
> -	return 0;
> +	return devm_add_action_or_reset(dev, i3c_master_put_boardinfo_fwnode,
> +					fwnode);

I'd suggest wrapping at 100 cols rather than 80.

>  }
>  
>  static int i3c_master_add_of_dev(struct i3c_master_controller *master,


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
