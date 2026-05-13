Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F141CD37B6
	for <linux-i3c@archiver.kernel.org>; Wed, 13 May 2026 05:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=V/S+EAtgK13gLac/RmBUFvtcvUHissM8Yk/d9PDJeYs=; b=Lf9FsnNG4yE9lLtTJfjgrVGg94
	uSLvPmNlegycU3S5Xb65m/1IvxaQCjqJKOpERPfeeJ4kYsLj2l8pU/WQVUI4iMZI7V0MEGMiSkvjl
	Ue6DB1Mr/m/bZtmHxEuGjPbKg2F16G1EcLqAKG8jAK1n4hGwP7muwZoY0nhsLLLP87lo3Dxhr9lXS
	9Ho61awzUnWqpRUb8mVck2F1Q63qXZLf08K+zfntlHOQuvl5eMUBb3rb/6uYntFWqXscYOdXKlHyc
	A+QMmn6mFMG630fsiLl6Mvu57O76BPAtmZJ0IYYVFr66ZNaGFJa8SDdrKQwLiRmS9jCX6nMmZiPG/
	zYoRouBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN2Q5-00000001MTA-0unR;
	Wed, 13 May 2026 05:46:09 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN2Q0-00000001MSF-1zPm
	for linux-i3c@lists.infradead.org;
	Wed, 13 May 2026 05:46:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778651164; x=1810187164;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=k6P41imvMp0r/gCySrlFZNs5fZfwxwDForKSOuNh3Ys=;
  b=DgJmxaga7fKls0pTzrxgaKuDzPQ+u4WvoU5lWvuCgI6Mcbr1FCFxYs2c
   Mgs7qhoUDBYroQX3SaFTTFLikwXfP3R0W2N0LS1LGl6odnvABMbsFcQFO
   jcClRio+P4s0pE9EcfBJgcb5gNlLMWXbRS6y4nRMEhdfTEH6yDNtbNvBi
   Mu8JHntF1ZqSRFamaTKzrpGD41o8Wmbn8ZQY/iTjXmSzU7Ut0/Aqwef30
   7alWGmqinSjOfjxQXDOY8wUqsjgNsrKPZO18CLUe2I/HG7I2wNSF0Uv7L
   BjlztSAqoEuCyhypP0g1bQ2dgnRz0ZJUvruHHDh5cu2KB5HHIibWyo2mq
   w==;
X-CSE-ConnectionGUID: mGepPCxjSXuIO+Hubq35IA==
X-CSE-MsgGUID: gT9wCevYSh6sXT8c1SAr3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="97137019"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="97137019"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 22:46:03 -0700
X-CSE-ConnectionGUID: saSDrrxYSFqseOvqTv1pBQ==
X-CSE-MsgGUID: dTXqIq/OQdyOrpxSXbpm7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="233708800"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 22:46:03 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 12 May 2026 22:46:03 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 12 May 2026 22:46:03 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.46) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 12 May 2026 22:46:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gIrdLmjH6ucV2UNZ0JnLDfBxNmDRLoUZ7XR24ntFrIaO7H8awD2Ao7YkXOFLVXc812g6uwjDVBM1NWgQbgz+/c9/XNy93ZO2EYNNUMZyo67edab9vxJVdQQr4R8m83/HgYRfybwjV/GRl2XY0bYwY8YWHXt9dGJplPR3nQ1tL8C4Yu7mmP6Wso8R8RPQn1iBrIGGcxquTMi3hTQFCG6M3V+PSSgV3QUWeYKLkDFML1aqX3vSFOG4kUVwAkz+ThYD0MzH/smzleBVRWV1Krk3mPzSvwpWhaMKFraKC8rMER/FZDlUAr3DHdKEcz761olinFMtYiQIGg74lJxWVAM2qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nzac7DHI3+2jAKuqdLt/86Hnu0N0rI0F8odrk3JLGuw=;
 b=jvv16dgd6AMDgSKxPNVxHapEjP1gHjCUlW3/tVaCKWTdQaI9e70eAwzWiN/xpAkCWfGn8OHzo0tj4QHnZSNw3wtFYSWlfv69RIZZ4X7zK+jEprfvSltb+MQ3AFHdeMvCpvufJ8dg6P2y+s4FNBsjcsdDT8sW7Rcadxp+ZaQqEznA42t33guEWtpyU/hdgYiwFLTRQFOtzhKWzU77fqV9/iwzfLUpmiemm+7eGFKLcfIG/SQdyTEDQLbWHK05PZdOsIND6YyOq36t5786TU8Kq0fFD0C0dIXWBEvajyIBGMnoyESP0MUD6+v0eqFq1275OTwCXoKhdb3q+PYaWZ3rNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Wed, 13 May
 2026 05:46:00 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.20.9891.021; Wed, 13 May 2026
 05:46:00 +0000
Message-ID: <01df8e0e-9041-401b-ab73-634701c4acdc@intel.com>
Date: Wed, 13 May 2026 08:45:55 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] i3c: master: Defer new-device registration out of DAA
 caller context
To: Frank Li <Frank.li@nxp.com>
CC: <alexandre.belloni@bootlin.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20260512121732.406009-1-adrian.hunter@intel.com>
 <20260512121732.406009-7-adrian.hunter@intel.com>
 <agNXuQDsj_bHSA7s@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <agNXuQDsj_bHSA7s@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: DB8PR06CA0053.eurprd06.prod.outlook.com
 (2603:10a6:10:120::27) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|SA3PR11MB8046:EE_
X-MS-Office365-Filtering-Correlation-Id: 88934645-dab0-4cd5-0d09-08deb0b2e925
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info: 1e6Eqv16z9VJKoFx2ejh7HTXiCgZzIRyDiCGqt5kYTS1WQK0TghFkOLFTTMcKU5c0t08mTJPD5I9q8YNNbeKmB3+dLq/aZ7Pc2K3wrdVnHCTlV+quI8tDQNBqllGyvr4oLuZQSEzSPAgP090XxqJgXkuBesXuGvDyFUVGoY6f0xt2kIGIdhsWZe38a/LTt5djyVb4IbNMCBTDuXCD7Y9c+CyJKeOXNKua8555FUZbiE1ZD7MZh6Zoim4xtNIeWmLJyBNYXCAZtFEhMee8rfOFccdze6pExSTttFl1ETRXrWSXkuD5iH8ky8yne2N7eFmOJceFZ9EBwV/4rPWOcqvCR0NSYsDnhRzq87DQn8wJROrRxZ3sGjB0f+LASpckWzGx5mszdmMGsgCBYUxhLClOuuPskhbVhdrA2Q778uaDB1JBfYgDsw7t2sNt3oR/1XtVAkdVbAOGJKPPQoe8iGlfAAg8ZCY5BbaGl++DPa5QBfW/6oekQbGo1vf/BmSaFw/iWerLshQ0gZ4E1YX2mGbb4GD1uRDla2jLdaqC4rUoI20I9YNWSjEbVi5gE16gHXAgSBWNi6dXiH+oIz/7A6Vb2bnI6caGS5vsy/0Wi2/3eJcdkSZS0kDFS/FsuguGpXULj6yoUrafTA2DRwXyowBhGh8tLGSGFkW1xb2qEnuqcn93EKqpHcMFln5lm5y+YcW
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFpRREF2T3lPYTFPZnY2Uk9OZzFERDBJMEhjK2JCcjBXeTVMRFFGTzEzTmIz?=
 =?utf-8?B?Tk5VbW1lSkRaSncvWjVHaWZrZldDUEdTZ0xoNEFSWnd3djY1QU9uUEJvQ1Qv?=
 =?utf-8?B?c05ITDQ0cnlrNGw0U0dDQ1pQcXV5RnRCZHB1MTFLSzQzd2tuSStDazFqZ2Vx?=
 =?utf-8?B?aTdHN1pVbko0TlBoYXhMM0MwY1B2RzU0dG5QbnB4RitoTFhGK3A4VnBtUk5y?=
 =?utf-8?B?NFRSbkw3aGQ4SWNGUy9haGN1K0ZiQWxFR2VxaFRyMTZ2ZHlBR1RpWXQwYUZK?=
 =?utf-8?B?NGtQOVluT24vK1I4S1F5K0tnemg4dVZMS2Z6ajQ2WmhKN1djNEp6eEx3Um92?=
 =?utf-8?B?NWxxazJ4M2h5c01pc0lGUnlpenZFd21Deng0d3JUanltcGM3M2NWc2cxY2I1?=
 =?utf-8?B?ZGlOd2t0eTVpcVVRV3c0QTNYUGVCNHNleFRxZ1hPQldZVGNhNm1mZ2hKY1Jt?=
 =?utf-8?B?aFg5bEpUMGNjYW9pV1cvVEFzcnUwYVFGRWVoeVVpREI4RFpBdG9ZdGlXYlJY?=
 =?utf-8?B?TnYzZm50VkladndiRTFJcVRZT3dCcy9ZSTlhNkFqNEFKNWJHSzl0bU9pZ25F?=
 =?utf-8?B?S2xaS0RsVGE4cXBMcWVlWHNVL0JJZ0JwVi9YZSs2T3EwbGY1TWNvcEZ5UHpa?=
 =?utf-8?B?Mkx2aGtjT0dXU2JMcnlyOG84SkZOcHVTWnFlZ3pCWXZ2THdWbUJ4YTY5Rk1T?=
 =?utf-8?B?eHphK3NzSzQxdXRDZCtsMStBMlp6MFdxaFN6WjZ4YW1BbTFwdXJSZU1lRWJW?=
 =?utf-8?B?cTlNbThoZTMrRnY3Z2s3QWhmTXpQU3JYdFpTZk9PQThZQXRwWjF2UFNOeTRH?=
 =?utf-8?B?UFVacnEyQnlJNFVTRHRNeHhHMzZEbVpWbEtKdFdGT3NxRXB3TktoWnhYdDlZ?=
 =?utf-8?B?NHlyb2F3QjB6enU0WUJMUHRDZ3Vld0RWS0lPTHdyeXBzbTMvY1VjelhZL05D?=
 =?utf-8?B?N1hRaXJqWlJDRXJEODNBOFRUVE1BWUxzWUhSOVVQRStSbWFHTVRYTlVmM3Bi?=
 =?utf-8?B?bjRUVXlCVXpvM1c2N2xrdFc1enZiLzlxS0xIdmcyUjdNL1JBYUMvUWlzd01B?=
 =?utf-8?B?RkZDZDkveVYxdHVUYTY4czlRR29LOVhrWTFIRmhncDVMZldjRkQ5MGJ5TDJy?=
 =?utf-8?B?Q1Q1NnROUktLdjk3VERwYjJBeHdhQzZoQjFMVUdjdFlhdkVVUjJzYzRuUTgr?=
 =?utf-8?B?bFlFdmN5bnFIaXpxV1FJOWVHZUZsVERzT08wdkZrbzR4R2h1Ni9XQUI1SEgv?=
 =?utf-8?B?a2pEc2t5dEIzV1pKUDFFTHphQ0JrNkdFR01QZ0hoVjRFNVRkV2JyYVJFMzlE?=
 =?utf-8?B?TVpRV0l3QWJGTUF2NGVLN2FpdXh6RUVHTGwwcGRBSXZiZUhtakoxVjllK0Vv?=
 =?utf-8?B?TEVsR1B4RGJFR0h0U0J0RUlwRVFyVkxXR1hGMUd1Tmd3NzNJOEE0VFRlcTVC?=
 =?utf-8?B?NUUyb2JoTzd3dXMrSy91OGJ3ank1dldVbEhGZ3I4YkNyVFkzbC91SnJlVGFp?=
 =?utf-8?B?TWpwNTNyczYrODRSYlJyQ0Q2bXA0UFBFOFJnTU5WUVpnZkdwZmdodmhCWnha?=
 =?utf-8?B?QmZKTzNWZis4eithVWhFcFQwQ3kzcml1QlpwcmlCZmVySGNZNTBHUisvQng5?=
 =?utf-8?B?OXZiNkNZMUZ2d3phN3hOMU5pT043d2lRWkpXZ1JhaXhnUFdzdTlqU0ZRem13?=
 =?utf-8?B?MjNtem5VRHgwSms0UlJYdW8raU9wTjc4aDgwaGdQM0dndmtBaFpnaloxU0to?=
 =?utf-8?B?VEdGQldadTJGOUJBdUF0bUxzcCtYRGNYY2ZWUW9nTW83VHQ5bFd2SG40SUVU?=
 =?utf-8?B?Q0tsWEFsNnhEWVJCT3ZnbkVPVlJ5a01FRGFiSHFCWFJiR0lLQWdMSWQrdURB?=
 =?utf-8?B?dk03RmJjV211VVZReVVFeXoyMXAzQmhqbkdiL0ZiNWQ4YjA5dzJ6TTYxNll4?=
 =?utf-8?B?UWpEcWhvUyt1cjg5a2kvMnVSb0FuY1MxckUwV0xHMUQwY01Lc3F0SUpzVk1V?=
 =?utf-8?B?blhPbzBWWXhkQm51RGJrdTJveVRFVjk1a01QWXJuQjZleEZocTZlUzRUTnJJ?=
 =?utf-8?B?dDljMVlJUXhQRkZwRHBzMzcrcVRHRlQ1WTFVWnpiRUZWRmxsQzNsekY4ZkdK?=
 =?utf-8?B?MUcvREtVTjJoSVQ3eEIyMGpTemhaeTVLWTV1S0M0T0VpMGVBVkRxT2RLaVFu?=
 =?utf-8?B?Q25ic2gyRitmSXFyWVp0SEJqMURoWmptU0diVnRiMVBrVEpua2tkZWMzbVlU?=
 =?utf-8?B?VE5XNlh2YUFNWWp2K0lsd0lpUlR0amRIK2ZYOUJXcXJ2L2MvdFBqeGcrdFFq?=
 =?utf-8?B?Z3k2NmVTelNEQ1lncEx4SzQ5YXVJTEVxT2lNTU90SGsxeU9LM1hCMFMzZmNT?=
 =?utf-8?Q?bZrWwLf3lSeSvNq8=3D?=
X-Exchange-RoutingPolicyChecked: WO/UZxJTE97IxN8YQvAtJBNIzxwbJaMeeNewT3iN7zCApggEBP8QBRotYix5OMFfbQtj9RHFnHjtPoOYBPUu1qrB/PdT9THbr0mQeGRp2vV/brRKvdoIZZaMoLZifT2+AvGpFHFqM2AkYHheRQFSQ5HKppBl1RUe4fAItRln2/s7AGzyFnfYYYtcs4+oc4RFBrd+Ab0SiEffm2W9Dbp69NoMbgPLNnSPG23aGOuRMH7faXghIsPwxMA9hBw4VXdsT+JWWu83jc1qOtbsbsLrVe/p96a62SAFjpEt9zvKLcnI+8VW6yPIdld8Btivvl0+IE95sA/dP4ho3eOBWDIJLQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 88934645-dab0-4cd5-0d09-08deb0b2e925
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 05:45:59.9325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X/VUD1C6ZBq+65yyerLD0Ux4nwXpRkH318JWl2Ab93qFL8ttOf0Rs+91wgz8OAzgWjLCjTCEfEBoP1VHhD82FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8046
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_224604_532478_6104BB25 
X-CRM114-Status: GOOD (  13.24  )
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

On 12/05/2026 19:39, Frank Li wrote:
> On Tue, May 12, 2026 at 03:17:30PM +0300, Adrian Hunter wrote:
>> Master drivers may invoke i3c_master_do_daa_ext() during resume to
>> re-run Dynamic Address Assignment.  As well as assigning addresses to
>> any newly arrived devices, this restores the dynamic address of devices
>> that lost it across system suspend, so it has to run as part of the
>> controller's resume path.
>>
>> A side effect of i3c_master_do_daa_ext() today is that it also
>> registers any newly discovered I3C devices with the driver model
>> inline, via i3c_master_register_new_i3c_devs().  Doing that from the
>> resume path is problematic: a hot-join-capable device may join the bus
>> during this same DAA, and registering it immediately would push driver
>> model work (probing, sysfs, etc.) into the controller's resume context,
>> where the rest of the system is not yet fully resumed and the
>> controller driver is still partway through its own resume sequence.
>>
>> Decouple discovery from registration: add a reg_work work item to
>> struct i3c_master_controller and have i3c_master_do_daa_ext() queue it
>> on master->wq (the freezable workqueue) instead of calling
>> i3c_master_register_new_i3c_devs() directly.  The worker performs the
>> registration only when the controller is not shutting_down, and is
>> cancelled alongside hj_work in i3c_master_shutdown().  Because wq is
>> freezable, any newly observed devices end up being registered after
>> the system has finished resuming.
>>
>> i3c_master_register() also routes its initial post-bus-init registration
>> through reg_work, using flush_work() to keep probe-time behavior
>> synchronous.  This keeps a single registration code path and ensures the
>> worker is the only writer of desc->dev.
> 
> why not direct use hj_work?

i3c_master_register_new_i3c_devs() use of desc->dev is racy, so
i3c_master_register_new_i3c_devs() must not be allowed to race
with itself.  Having it only ever run via reg_work achieves that.


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
