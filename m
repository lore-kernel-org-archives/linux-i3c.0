Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF2CAC55822
	for <linux-i3c@archiver.kernel.org>; Tue,  4 Aug 2026 16:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:To:Subject:Date:Message-ID:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=cKVvOzIcwXjZMyK/g/mV56ro9Hyif/NuwNCp6iCzp14=; b=C136/WdVCQc0Wf4HZf6GQr628x
	l2NISAyOWelPDDxItp1qw99bHtcWoRa6JmMIZ+imSJ/FL5BpsTeMYcnGlTzFW4PdoyNFpJPzHc7yn
	bZABHlJ5glau+TXpLEVHgqVdlHl6QplovwrG83GVAxf5Nn8f0Dg1hw8V8UD+2PHcFdOrUi75Glk2Z
	pSQAjo8UaDOxssaem9BW9vSxTyXrRoGep6vYs28neWb78TmYQkaMugmxM3kdzFGfHUFdR854abAaW
	Hk1MBeKDXILSdJ7FAbWP5qcp9NPm9pZqxz4U+SCfo14Vh0XyIuuBmFVuhMdoJJh5Ve537b5S7hOZ0
	nP80Qdgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrIOE-00000002OoK-2ZOB;
	Tue, 04 Aug 2026 16:53:18 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrIOC-00000002OnX-073v
	for linux-i3c@lists.infradead.org;
	Tue, 04 Aug 2026 16:53:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785862396; x=1817398396;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=w+iowspVZeyhal72PYFZ33mAiW9Ltx6NxhTDUtfIVAI=;
  b=C2HBdfXfkBGaKTIsBOPQeEt/CZMwRODAxwfuDQdMBjSCGEEZMxo7vqzg
   0M6w3FpScaxVHRL6dnWwS8doCuIhmCdCPcVZLrilqEnvjYSR18SQ51LKi
   VzvUI2jqOHPJViw3pP4VTNbkPthcQc40pA+EJaNrT+zchHiK0ZqCtXbYY
   KQ77M1sadlH2/pwsLLAS/a7DqMTZwMCfCkay0SfBzBv1tYtksmWFn8qaO
   ZdMjlP4bTFcJTvhlqKX7kLqxacKMFdbU0yx4z2TYXRXgymewYsV3ny/lY
   kSh4ntRMwaDozntTf/NDfnKo2kBI2sx2SX9zBCYx+k7l3cZZktUqJ+Xlc
   A==;
X-CSE-ConnectionGUID: hcgN6CIcT2CIUsjutREk2g==
X-CSE-MsgGUID: W6SBpblZTPSz6ZwQf9YK8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="97925640"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="97925640"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 09:53:15 -0700
X-CSE-ConnectionGUID: Qha5R5PCRN+2Bpo+iEc/QA==
X-CSE-MsgGUID: xKPiKHkaSkKuCj+YPPYKYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="265064255"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 09:53:14 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 09:53:14 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 4 Aug 2026 09:53:14 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.53) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 09:53:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R16e8VY+dWUCnkTCP+STqjF+p7mBrDpWSJZW9q5EBFeANN8ixzStdkpsYlYxQCkYyeESoDXwSfsbpwrnMFoXnIGctY4jXsCA763WKXpMdlDlfKHEgBKMMpXnclwDU4lnGojqqpzMVDtWyh2RQ/6+67jdM6M957l6YPfKr7P+Cu3Es0TZQYkXZaamwYmzv16i8dJGk4o6me/DRQ6cOlXLBmvzW4XET79HClYcFoGoUNLtBp08sUUYlMs1xMiG80M7VB1QBBffa/13+dXQOgNSIMEhTbFmvK4ra2oaTW9KwMe6XeUpp4vqf9Rtbgke/WHQAb0OLln6WefmLPOLLdYF1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YgwoDAv64F4mgFdzi8xhfa7ZbqhrwtKAKwYQFUG80r8=;
 b=vjrPRdLzkiiJb3J6ZO8sYuDjm7RjJXdE9pFw19t3NDNn080EZo8Pv9BW03cGSNNr+5xYgvxXBPEGybdBqmPTiZJ//VREUlw41mAzBVYG9SvLR3i+1PQGESFQuu+9av2QO5UBgD0l95N+HJgmTEJ9YoSU0yBHgfaf3qFCCOuZ/WwOS4kzkFbQdXFnUGmUD9+Bg8ZdXSADoLkihvj5Giv933cUfPnYOuv+LQpnxwWIrcfQFhRQaed9RQ7filbRiqAqLe3lls2koEAtLN2MBxjKgpOiB273dJnv0eXpglDWp0idicrBsfNUSi9b1Gm+Ax90bYmJWMeX30Xnmx5k2hnctA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by DSWPR11MB9558.namprd11.prod.outlook.com (2603:10b6:8:36c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.16; Tue, 4 Aug
 2026 16:53:08 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 16:53:07 +0000
Message-ID: <23a9e3da-1b71-4c24-b04b-6694ca9f6de2@intel.com>
Date: Tue, 4 Aug 2026 19:53:03 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] i3c: master: Release the fwnode of i2c boardinfo
To: Akhil R <akhilrajeev@nvidia.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>,
	<linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260804101301.2975911-1-akhilrajeev@nvidia.com>
 <20260804101301.2975911-2-akhilrajeev@nvidia.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20260804101301.2975911-2-akhilrajeev@nvidia.com>
X-ClientProxiedBy: DU2PR04CA0245.eurprd04.prod.outlook.com
 (2603:10a6:10:28e::10) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|DSWPR11MB9558:EE_
X-MS-Office365-Filtering-Correlation-Id: c3f630ae-c579-455e-6ec8-08def248dbe1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|22082099003|18002099003|4143699003|5023799004|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 0R2WtAjcizA6yDlU/NXw1WJAZCwPZH0mHU6DECKtXtUG45l5WOSLAOjHd32Sl5ttJAScuETUITY2QJrt4Lnk7Cbd5flkbfxWdp2CH7d8SpXFqlcRd1oZU94QEGo82yHzSCMt6SgiRsj5jYzWZc3sdFn+tFu5NIEkRX7VBk7A06iD84GeTeMhTq3Tk80OEWaSskLJ5RL4fgEB5zX/m2nsyqa8q9CVq/hcLzMXGLeojBg/16E1DDAGyeqYYbWqWtVnVw+mpNj/yAQYSskR3xX+VDFmeJfYsyqAIv6Wa+TYdkSdkb07vYZ9dM+pbMtmL/9kW3Y8sCl29kX4xXxlEKjFp5Kx6Ir3tUtM0/iXBgWJ5ViTyYIV9y6Gv59LqOcaB8gLH70y2Pdw4nyGLGa4Kc/7iHXSgACb+ppAXBqa50CDd5OayC/DR3LWlfti2NCg1IRrqR4T/m77FF41z/1KRXtBsS8Nv3cCqqr3OLAElIIOBffWzgJxeyjChR5Tcbw7HFzVBrFMyntLZDk5xCDEquni3PeNeFBNmwo+HN+8nXJyPBU0nTh7CCQxxTTY9GnLx+kj1gT6hwzYq9GkdykM4puW8vjGctSH85G/29Y3CdgP7QoONLLgcty53Eojl4sBxD2HyAx975KLxgNorIxZq0ktPXg2RGzm7f6Z8ptEzSl3Mpk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(22082099003)(18002099003)(4143699003)(5023799004)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlFjTEJPWG1PSzYyMHp4NUdKMlljeXlpVmxER0t2WnJZK0hZQVNHZUtVYXI0?=
 =?utf-8?B?anBjUUIrQjAwVXNvOVVBMTQrRlZma0lEWVU4SkNJZmw3ZTVzTjJjOXlYdzNi?=
 =?utf-8?B?R2oyUWhHZ0QyRGdHY0FDZ2dTUjNYODAvbC9BV3A5QStQMDZxS3FNem1JaE1s?=
 =?utf-8?B?MldQYWhIM2ppanZFM3owTmlNUGNtRnNhMFBGblBjVjZSYkFPeUZUZmxwZFMw?=
 =?utf-8?B?WitScG1PQmxYQUlJY0hJTEFmR2pMSmZDYVJwUDduVE1HZHFNOVl2UDZYWERU?=
 =?utf-8?B?djRZaUR3UkxHa1BTVmVJT2YwUlBVd3lKTUdkcDZNYzk3MTYzNkZnNG5EQ0hq?=
 =?utf-8?B?bnFxOW1uUzZQakhhR2JyOUloaEQ5YjNVR3BsTEd4bFhUa2YyemdKY1V6eUpp?=
 =?utf-8?B?dWJkclJySXFOSnNHaHpYYWJabXIzc2tpd2xMTUpZdWNJMnVuNkMwazNKMlpo?=
 =?utf-8?B?eUw2YVF1YVhTZnludVNHTFdNUlQ3K01UejNCZjl2STdSbWFkZ2xNemRTS2NY?=
 =?utf-8?B?alJJM0NhR3BacVdGR2FXb241OXNWSkJ2YUhxMHRnVEdQaEV5QXVWL2dVdjZj?=
 =?utf-8?B?WlA0U0ppdVV1eTB4VnYyVkZNanJ2bkFtcFFXekxWeWphZ2pyTVkrUzN2SStS?=
 =?utf-8?B?V2pvUnRTWllSNkhMVkM1N1gyeGJEOGxVWUVrNkxOVHMrMHFIN3JwNW52NjJX?=
 =?utf-8?B?dGY0b0lMa1dIWUV1cndJckQ5S044SG5pMXROUGRaeTV3MUs2UU9aZkFmWHBH?=
 =?utf-8?B?cEJkTVJMd0R3dnNqaU9abzJhS1lCQW9GOWZrV0YyZHFReDBpVnFpMVhJWXF4?=
 =?utf-8?B?Ulh0WUQzRGZzWHRUK2VWUDdPMjRTS2orVHkwZ05DbTEzTW1rckNDcTdqMUZj?=
 =?utf-8?B?ZGo5K1Y3R0dmMnpjWDFrMmdtdUhRSnZTY2x0Unlrd1hUTFo2QU9UcUNwVUQz?=
 =?utf-8?B?aDZrVVkzZThaWUZDZVpHalJGWE5ObnFOQUZMcEo3bUlmbDZHb0NiRVRwdHh0?=
 =?utf-8?B?MWdFNGNGeUVTZGpieDJnSjN4RHQrWVNmWkNlS0ErTkQ3Uk5BSUNUWkt6SWFp?=
 =?utf-8?B?WUlxN05NSmhRaTBST3B0MkphRjhDSVhGN1g3L1lzaE1tL0JUanNLc0tTeXZO?=
 =?utf-8?B?WW5kckU2bC9PUFhtbUJyckpDTkhUR2hOdS9MV3RYSllHUkNLWERMekRXVEpD?=
 =?utf-8?B?VEpqck9NY3JJMG1YVGptMU1VcWRhTkYyaGIrQXR3WkZjak1icEZSQ1Y5RmFV?=
 =?utf-8?B?NXRsT2crcnQ3cWxLS0YydGRIcVkxRi9aeXdHSkcreVNnU0lJNkMzcU1ud25i?=
 =?utf-8?B?QW5ZS2Urc1ZKV1FGTjJTbWpJUDdCTjNudHR1cjdtUld0TFl2Tm9udTJPMm55?=
 =?utf-8?B?S0RpdkxmQVNHSlpOai9PUEU0SHRVNTBLWFZOTVdLUWgyY1lDTkZydDV0c1Zx?=
 =?utf-8?B?bktXb3JzTVNiWjFBbGZxUWRIUks4SnFLNkovTVBXTldWUm1JNUFGYXZxd0xq?=
 =?utf-8?B?RDUxUWxzT3plVmVLVUZ3WGxYcHRyY0JTNUs5Ry85K3NpZmcwd010Umd2Nnha?=
 =?utf-8?B?akV6M2NsOTh2eXJTTlBpSWtvUGRzVDIyUzZ2bEFmS0pHcDVWYzZyakRIbERa?=
 =?utf-8?B?YjVRV205QWQ2QlVnN09pbGlET3pzRkhFS1V5ck1IMzhNUFlhWmVnVlF3S3M2?=
 =?utf-8?B?bGJ6TEFwTXNRVFZsMFBJbW1kN1E1TGV4SllhSzNjb2orQ2N5TjdMcU1YZExH?=
 =?utf-8?B?Vmt3Y2UyMFI1MWlQeERtYmVieHlwQXNJd0p3eFRMVjloSit0L3JGVzVjYUxD?=
 =?utf-8?B?VkZwVnowbXpJVHFEQkZxemJ4MVVUSDJNTTVPb2lpN2V6TnE5aSsva1RBQ3ZE?=
 =?utf-8?B?UXQvYVZTVURTMTV4UFpNczd1emMzd29mWHlpa3RteHd0QlpEYnNKdGtyOU9B?=
 =?utf-8?B?NnlGODllTFkranc5bU9FRVdDMmlJMDRhdWFFYkVVaUZIT1pBWDZjU2V0Q1l3?=
 =?utf-8?B?c2JvRDQvSmtZczZJdnhlUXNjTnQ0K2RJMG1ka1hNejF6ZGRNUUhsdm9iVDZH?=
 =?utf-8?B?TE9sMXgwQXhEM21meFpyeWppMDdENi9ybTY2TnFSemtIQ1BXaEw0bWJXVHAw?=
 =?utf-8?B?T2Q5OHh0bVNuamY2VGV4OEY3c2NCQTV5bW55aG1PK090ZFV4ZlJFdXlNK0gv?=
 =?utf-8?B?Mm9sVTNacDJKQzIyakJCSzlkSDRQVExXSjlxZ0ladUpsMDJQQjduQW9aYVIr?=
 =?utf-8?B?ZnNmenUyYlJnd2MzZnltcDcxNTVTaDJ3cVZ4bng5cE9EbnA1R2E1WWJHL2wx?=
 =?utf-8?B?aWRHLzZ3eDkyR1VJV0hUcEFCMXA2M1hOZ1VqWGhmbGVCZ2ZqTjdwTExJT2Js?=
 =?utf-8?Q?3G/rqijAcAzELM8A=3D?=
X-Exchange-RoutingPolicyChecked: G4e98+zE1uC7VS0D7xTeQDjIKcUnDvwuYPXqgdCQyykV+7Ys4MeLAyCSAhC9pLncvEEO9TCw1gTd/UcPjCAq5i6ZglBWwaHZNpEkKN3c4nJlEFyu708Vg/r5oxCEOYWa4BQfSiBPAs/U3ucFubck7s3R0wXuFklIlcKI5MM/ATZB7khyVS3bJRfa5ZLPcVo/ZXlE9ulq92Q5jSY9X4UpgAtzQ2lGQLCm2A8JwCfjL8nfmDVsBtUxc6RuMZFUElb5pE7silYWonT/wAH9mt/qQksB9sOu9gF/p0yvpVxnh8plni7R2FJFrY83DXuc0n+YgMD7wBNiOWPIhSwpPn8UZg==
X-MS-Exchange-CrossTenant-Network-Message-Id: c3f630ae-c579-455e-6ec8-08def248dbe1
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 16:53:07.6580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CK8KCcXyP10/Dyk1Ecm6GjXX0WEqtLipW5Ye54wqYbGjmv9Ij4AgmquzXf2x/83YiVAuuN1Hk/5OCG5OfTOztw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9558
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_095316_182289_23E3A0AB 
X-CRM114-Status: GOOD (  19.15  )
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
> i3c_master_add_i2c_boardinfo() takes a reference on the firmware node of
> every i2c child described for the bus, but nothing ever drops it. The i2c
> core takes a reference of its own for the client that it creates, so this
> one is never consumed. The nodes stay pinned for as long as the system
> runs, and more references are leaked on every rebind of the controller
> driver and on every failed probe.
> 
> Drop the reference with a device managed action on the controller device,
> next to where it is taken.
> 
> Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
> Reported-by: Adrian Hunter <adrian.hunter@intel.com>
> Closes: https://lore.kernel.org/all/97465893-3650-4f37-98b7-1db76fc6fd03@intel.com/
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>

Cosmetic suggestion below, nevertheless:

Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  drivers/i3c/master.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index f485b98805cf..08dc10f172aa 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -2871,6 +2871,11 @@ static inline int i3c_acpi_add_i2c_boardinfo(struct i2c_dev_boardinfo *boardinfo
>  }
>  #endif
>  
> +static void i3c_master_put_boardinfo_fwnode(void *fwnode)
> +{
> +	fwnode_handle_put(fwnode);
> +}
> +
>  static int
>  i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
>  			     struct fwnode_handle *fwnode, u32 *reg)
> @@ -2913,7 +2918,8 @@ i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
>  	list_add_tail(&boardinfo->node, &master->boardinfo.i2c);
>  	fwnode_handle_get(fwnode);
>  
> -	return 0;
> +	return devm_add_action_or_reset(dev, i3c_master_put_boardinfo_fwnode,
> +					fwnode);

I'd suggest wrapping at 100 cols rather than 80.

>  }
>  
>  static int


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
