Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F595EFCE33
	for <linux-i3c@archiver.kernel.org>; Wed,  4 Mar 2026 17:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=PMnjWNvDOfJTiBTcY6v9Se3nLAom97O2Fic5AhnZkDQ=; b=aeQ6+JAnZ5o3btOHF24huMkfga
	2vF6F88eav1CX2u2Q3SxDqRNwlLto40NoE4bJd0lT0e3g4o/yAucE+aMfo4OmjSJkWrvMfJ+YpMOu
	F60usKp2/t49phXcTVvNIx1w49iFxPlSB8lQ2xto1xbstzaVKwpy6IgXkzylKWi9gpie8qTMgfTA/
	WZ/zPmTcK7zdJ46NosQKSgkPcCGsjcei66LmJJBS2iCPQ4NkTXjTyBWQH5wfGc3ZDEpPV+rQtI8Zy
	F5eEpeu3wggvqzDwxw/HH1c0efuHqp9TVjVXiR3iOOITwO8GIa+ETv+mUoFqfXyJZjjLVosbVIeBz
	t+gXVi5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqVA-00000000DSR-4B93;
	Wed, 04 Mar 2026 17:59:17 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqV4-00000000DRj-1fyJ
	for linux-i3c@lists.infradead.org;
	Wed, 04 Mar 2026 17:59:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772647150; x=1804183150;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=LO0G3sM9/+aF9PkqVASdFCVlnpwgrKG5jb0hwC73fHM=;
  b=YGJEM+gM6Dr7aAJLf2GTaxJj2gSrrHjityKlE8JY6XVo93aVmKzh2tBq
   8+q9q0umCv9tNiL+x4hLZt4WANV1IiNUAKbdiQPcpCK/td3iX3z5hTJDp
   W21S2t63+ef0SzFGEboURNTYhIq8qNViQrFrorbPDNYwDi5iK0V6p5oAz
   WOLg/FYrCk54ToCLzQcbgi8IA1yZ6ePzTH1a82fB6rYPh+6NfGIRjx65u
   20MiCYzRKc9DjRTdxT5fqZSK9ROAZRli9865u8bbSGKjKwvKXyA9R0Cej
   Bz8LvuMjquTmZeK2F6FcnaweL5StTAgmRbPqHjpgi2Iyn0jxxEDaj4Gtu
   w==;
X-CSE-ConnectionGUID: TGY7dFURRh2cdiJ5LVbpeQ==
X-CSE-MsgGUID: OARg3X1oQlaHu3gE8xA+bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="91105982"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="91105982"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 09:59:06 -0800
X-CSE-ConnectionGUID: wV0wIFihST6dmqTdFSBvmQ==
X-CSE-MsgGUID: XV0+XSZUSJOe/IH1GQP6jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="222571909"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 09:59:06 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 09:59:05 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 4 Mar 2026 09:59:05 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.21) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 09:59:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s85+BGTMoSa2hSsT69i8GwUNTuTTAIGOwBsocS43/cUGwhNJjn9dCekFEr3wPFO5VVvaefoz5iRJdY6453ekFQCLZHgPgANSa3tLSUb6cuYlqAbHh2IxJ3hj1S7DeSUeoaE3SfIycSMMByAvQh//lmIXQ/YXSScOrAM2Of17/aFjKxm2JgpQKcoyHV+/Q40XHQcccbs+cAjiU/MSwoZqBVLrGTdKuJakcZ0WOSWbIlkxitSfOxoh7WNlZo1uvrs0IMgzhMg1cmAsPTAI5gzspTy4ecemTX2I+1CTjbitYkdSpCPkf14cJEpg4JPj0HnwKgue9CUjyIs5/UCn9/bOoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1laKdyKs9vnAeC1iHEtf/dCHFoEmfQKtcHUBxUNnjUg=;
 b=HmhH1Ar2CBVeGmDZH0VIbDP7ouHUppnBok3n3o7LBi+juVMERNwetkQZJEsD0lmq4tzs/mWx1qkTd5UORKqqwJBHiE4gmD6/PSdJtWFN/NfvWQRyFLQqg1hqZdwgqdZusA2cykVhiptv6QvUxMu6lbsRaNmm+vHUU6H/E9ZF7BGhymwvpbaVHco42S/8NOs6n0+pJ+QzTUesGrhNzWPUgUlHpmLAEWlHX1AcgZtfrvfuiWG8beZQphHlM4CzMazr+C33V8CEoNiEhwLxoBGASntAP2gGVdbJwCDsiBR4o5k8fAuIpfrZp2TvXq5TaD5BJ3hI50hR1zc/3t+XbOyhIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by MW4PR11MB6957.namprd11.prod.outlook.com (2603:10b6:303:22a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 17:59:01 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 17:59:00 +0000
Message-ID: <9353717f-ef23-4e5c-aefe-fcd173952a32@intel.com>
Date: Wed, 4 Mar 2026 19:58:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] i3c: mipi-i3c-hci: Fix race in DMA ring dequeue
To: Frank Li <Frank.li@nxp.com>
CC: <alexandre.belloni@bootlin.com>, <linux-i3c@lists.infradead.org>
References: <20260227141149.184980-1-adrian.hunter@intel.com>
 <20260227141149.184980-5-adrian.hunter@intel.com>
 <aaHD2hEUcfji9WKe@lizhi-Precision-Tower-5810>
 <d7d9a86a-3147-4bf2-bd19-9fc6dc4579ba@intel.com>
 <aaXjliGPkW01JIgj@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <aaXjliGPkW01JIgj@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: DU2PR04CA0042.eurprd04.prod.outlook.com
 (2603:10a6:10:234::17) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|MW4PR11MB6957:EE_
X-MS-Office365-Filtering-Correlation-Id: eb056864-babe-4198-3bf0-08de7a17b6e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info: fYTqhtm8UVkl3QurivlyqzPm/fAtDKcM0BI45s0a2SwGZz4idD0eQ24lsw2IizNdMeQsIQTtwapOJ62ERUn7UnY9w/RCA7gxaXed1PekPiqY6WK5P0aKwRBAdBRVqfJnZzkQ9/W2X6/zOn4elnL1ORxPFtXR2ZOvmE/lODQG/tXfQEZVO9rv6BA1JNQbOU9S593I/P9QRMth5jpGpJ6eJsqPlZKvp03k1LomL975DBut1jSEjz99qsxB3PKn5BzWzCM84yoeEi+N6jlgmjrT3GyzxGs1JsAn3YTYTWTh8hyXPg6AkPc1eHbxQ7bRIawYe4J0CqW6/OR2RYMISm1LegxoJui6zO5ySaIavYTL3Kkk6PlRIrowLp6Pz+3YKAP29dvpXzfcoFSB97SUoYsshm7vLxtnRmmAE4Z60RmC/ECGhi/tzU8lwl0gugKAx/1C+6XNBa3vAEyD6IZmb17KIxQWTdUc0MnhjWz7CFB8X7n3YyuhH4Zg+D6Ut3BCwj0ODKiaWnojNQ4Vo0aFip7Tm1CCBjJyBN3LK6FpiqL9/9JvIgltWoz1Ut5ZA2VOH9Z0wTmDblVUSbMhMfE71j4xT1nIifI3QF+QlVq+5FnmoyzKA4LpM1x1vu6BjvcKKveKW+FUtUqKnKIm3X5iMzecyAoXya3fs0d7wJhQcLTbhyQDFoVCH9kxIy7Xu11ZgpEkZwQk0rPa9FjmrYTlncwnNDE0pwBXtbkUEQw3mXWPiu4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFgrQ0dodWM1SVJ4MGt0K3lvSWVEeGJYK3JVcHAyVkdKTHVCeUtreVRjbW8v?=
 =?utf-8?B?YThjalRxMENDTDF4NFJUa3Jqcm05eG45eFNHUmYrbTZuZm0zZnJ3VjJEdWFh?=
 =?utf-8?B?VmhSd3p4dkh4TU93ZXFwajByRmFNelBuWkw2RDFZcGpZVkNKYjlwbU9vWGFF?=
 =?utf-8?B?cUMyaVR1M3cxdHFRdGNXSGNZeUxub3UxUmxPZFhLaTlLVnJVZWZkdHU1TW0z?=
 =?utf-8?B?WllXR3R1ZDU1TkdlbzZQT3BUK3UrZWRBVXpocTVWN2Q1S3huRVRpdDdvcGhj?=
 =?utf-8?B?WUcxVjVJc0xZYTB2QVNkbkJDM0RERDFOWWhhT0dueG1ESGVlWHNCMThjZ0JB?=
 =?utf-8?B?eHQ1TXFLdUR0REhEWWVWdGdjdmFmTGlTUHJ1eG9DRTNobUh6dGNieXVtQXk5?=
 =?utf-8?B?Mlk4RFd3VGNuMjJUZXpwWUNkTXUyMDA0aU1GTmI5ZlhSNWJJK0xBM29Cd1lp?=
 =?utf-8?B?KyszaWlzUVRzc1hSc0dPWjlXUno4TTBkZGFTcVBpWnkydmhRMll4RHA3ems2?=
 =?utf-8?B?ZHUySDJ6QmRscUdyUUpzdGE0S0UvYW96Tk4vT1lSVG1paVVYem41NW9qTmpK?=
 =?utf-8?B?Z0MrcCtwbFhEQ1BYSDVKMnMxZFN6QnA5RlhtTWJzU1VycXRxRVZIMGg3QlVW?=
 =?utf-8?B?Nm04SFliSWZkdkVZaFA1OUJRaGVWTXVvcWowZ2FkMWFqMXplM2tqRmdRMG9m?=
 =?utf-8?B?SEVzSjdBVC9od0lnVVNocUl4RkNzQ3U1N25uV3ZrbG5keFpGVUtCVWxqZ0RN?=
 =?utf-8?B?QWJ1Sm1GdUNQL1k1Y1dETXRJTjlKRE1ZMldzWUlrdTFRNFNLZ0NoYW9XTTA1?=
 =?utf-8?B?T2MyMm40dmFTSFk2a1p0eCt1eWYvbzZYUmlZQUFWcEgrSFZadFR5Q1F5eXlH?=
 =?utf-8?B?SUZyaG1mU3hCWnQ0bEpZNVg0OHpmT3ZubFc5eG5vT3RpR3pkMFVFZGNTd3M1?=
 =?utf-8?B?dDRjUTQrMytjcG9Ma2JDeGJkbHNRU3psK0R6WGJLWlBlWCtneVdXdmttRWp0?=
 =?utf-8?B?SHUzRE5iSndQd0NBdGV1eE9qNE1QKzdjekoydWtJWEZicjVvZFVtWnJZeEhy?=
 =?utf-8?B?SmMwZE04UGhmS2ZuZVNxa3lVSURMdW1QZktqT2dnWnk4YWsvRUFTL0FUYWx1?=
 =?utf-8?B?TnJQRGdRWnFtNW9ZL2NTaGN2ZStuWTJTVmZ2NU16VnhmUnJtYzAvQzFQWFo4?=
 =?utf-8?B?ejNZL091MnBPYlQycFhTT2Vna0ZRT08zV2lsZ2Z1MEVvK0xyRmFzaDAzQ2ZJ?=
 =?utf-8?B?NGVWUU5jNzFmbkVNR3dZTUtEYTVNNWdZZWcwYmZTUWJIUFdLRjkrM2oralY3?=
 =?utf-8?B?MW1JZWtmK2U2aGxlUWlHdTBlYzUzRG9CK1RLcDFNK0hpVitvS0dGemxnUGNi?=
 =?utf-8?B?WUcwZHI2TkV0UmNMekdRaTRZd0pNN1JhWGhJK0M0R3VJVVNCaG43aXpEbldT?=
 =?utf-8?B?TUVvemx5amRuK29IQmZLOTNNdXBrVk5iV2xDM3VrQ3hwS0RhS2ExQXZuT2dp?=
 =?utf-8?B?aUl1djNXNVBub2w5aHlpUm5VdWFJSDZJWkZEZlNoYUxldWFHaDdkMHFZMHhw?=
 =?utf-8?B?K01CY3Y4U2pneHdwaWk1MzhMZ2VmUnREY2cyOFk4a0tPWUsxWW5ML3lmS2lz?=
 =?utf-8?B?RU9aTUlXL3M3dnBWbmw0N3Mxem5pOFV5eUFrSk44bHVUOWhvakIzNExkaktD?=
 =?utf-8?B?a1B1ZXRWbk5FOUIwc3FrcGYxckltM1A3cWRTdk5WdDBFeENza2ZTYUFJNDRZ?=
 =?utf-8?B?UTBNWUR4S0JqY3dwaS9yaWd5Z3RTV1NGYWd2Rk9YWXFHdzJROWFZZ1NaRmtl?=
 =?utf-8?B?Mm9OcTBhZHpWd0pqSHNhVnFxNEpzYkN1dE1CN3pXMnN6THRDOE14SS8vNHpE?=
 =?utf-8?B?LzNROTVNQU8yWWVwWmlRZW0xdXRrYkFsYm16Rm51R1QvcVY1THFnbS8wKzdQ?=
 =?utf-8?B?RStjdGNXd2hBUmdlSHRtWTFDVGNzcUtnTEYvTVJFbzJzK3o2S1JadW9mYnYx?=
 =?utf-8?B?VGN5bFBTWjd0NUp3Qk0yeldhVFNndnRLTnpyRWhLcWt2RU5RU2NDQ3lKaHBO?=
 =?utf-8?B?NC9BRG5mVEhhcmQ5QmQ1bEZYclc5OWg0d0RmT3RTcjRZMHhZSmFKNG9SbFpD?=
 =?utf-8?B?UkoyckhHWmI2SytraU0vN0p0Snh6bG9na2pYZ0xndkVmVTVuOG1YQys5empz?=
 =?utf-8?B?ZE45KzFNd3p0cmJHVXZ4TVB3VmZKS205d2tsNEFxeHcwdjNiYWIrTHVIcm9F?=
 =?utf-8?B?UmxxbE5yZlJCbUdFeGpOQmFRSlhCUGNSMGgyRUlCaHhBVHhTQWFjRDRlcURv?=
 =?utf-8?B?cDdOamJVZ25XOXA4dVQwWlU3aWc5MldvWGg4YitrcmtpNTNsUzhOTG1oZjJP?=
 =?utf-8?Q?Hm8qTLwPV+A8/VyM=3D?=
X-Exchange-RoutingPolicyChecked: FspKDcbLxwNcLN7EOjsjht9/Si5K3Z4yUbEepCBQKBydXGGRRewG8hlcO9Lx99d6ql7Y3hlKKAGn+vQg5V0Qq+Lj/ASfc74xjpcv6lgpPLk8qyovAIaxj5Cib1VoUpAeKdMBwjtdBaOkzAURAYJlUyxOJg0QbA/PmCbmDEZ8OD0JDI02qzvtAMrzDK28QVvN1RS4ya1bGUygfg4DfeMjeKUl7cnGuGxQZYrd9/xXQ6pn17MWU0RpO6ucI36HXeM4lVg7pAzIk3Jh2zMEL+sYXeRpGepKKrmW7urH8PE23p0zXfGEtJUOaDJstEnWxq+PJOsybe9TFPOYh0AXZVuzZQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: eb056864-babe-4198-3bf0-08de7a17b6e9
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 17:59:00.8017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yCdz+o4oKUKuth2StZKNdBFmAT625RlWR2Vt5agPCtRgDJbYjMLeQntw4VY9KcBnV7dPz0DG+2e5kAPVy8MnrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6957
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_095910_540371_F5E69AAC 
X-CRM114-Status: GOOD (  21.21  )
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

On 02/03/2026 21:23, Frank Li wrote:
> On Mon, Mar 02, 2026 at 10:43:34AM +0200, Adrian Hunter wrote:
>> On 27/02/2026 18:18, Frank Li wrote:
>>> On Fri, Feb 27, 2026 at 04:11:41PM +0200, Adrian Hunter wrote:
>>>> The HCI DMA dequeue path (hci_dma_dequeue_xfer()) may be invoked for
>>>> multiple transfers that timeout around the same time.  However, the
>>>> function is not serialized and can race with itself.
>>>>
>>>> When a timeout occurs, hci_dma_dequeue_xfer() stops the ring, processes
>>>> incomplete transfers, and then restarts the ring.  If another timeout
>>>> triggers a parallel call into the same function, the two instances may
>>>> interfere with each other - stopping or restarting the ring at unexpected
>>>> times.
>>>
>>> how to sync with another hci_dma_queue_xfer()?
>>
>> In theory, so long as the ring remains enabled, it should be possible
>> to enqueue transfers.
>>
>> Nevertheless, the use of the ring spin lock is added in "i3c: mipi-i3c-hci:
>> Fix race between DMA ring dequeue and the interrupt handler".  The same spin
>> lock is used in hci_dma_queue_xfer().
> 
> but not use spin lock in abort. So enqueue and
> "rh_reg_write(RING_CONTROL, RING_CTRL_ABORT);" still happen at the same
> time.

It is not ideal, but it is not covered in this patch set.

> 
> Frank
>>
>>>
>>> Frank
>>>
>>>>
>>>> Add a mutex so that hci_dma_dequeue_xfer() is serialized with respect to
>>>> itself.
>>>>
>>>> Fixes: 9ad9a52cce282 ("i3c/master: introduce the mipi-i3c-hci driver")
>>>> Cc: stable@vger.kernel.org
>>>> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
>>>> ---
>>>>  drivers/i3c/master/mipi-i3c-hci/dma.c | 4 ++++
>>>>  1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
>>>> index f60654fbe58e..5a9af561e4cb 100644
>>>> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
>>>> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
>>>> @@ -133,6 +133,7 @@ struct hci_rh_data {
>>>>  	struct hci_xfer **src_xfers;
>>>>  	spinlock_t lock;
>>>>  	struct completion op_done;
>>>> +	struct mutex control_mutex;
>>>>  };
>>>>
>>>>  struct hci_rings_data {
>>>> @@ -347,6 +348,7 @@ static int hci_dma_init(struct i3c_hci *hci)
>>>>  		rh->regs = hci->base_regs + offset;
>>>>  		spin_lock_init(&rh->lock);
>>>>  		init_completion(&rh->op_done);
>>>> +		mutex_init(&rh->control_mutex);
>>>>
>>>>  		rh->xfer_entries = XFER_RING_ENTRIES;
>>>>
>>>> @@ -549,6 +551,8 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
>>>>  	unsigned int i;
>>>>  	bool did_unqueue = false;
>>>>
>>>> +	guard(mutex)(&rh->control_mutex);
>>>> +
>>>>  	/* stop the ring */
>>>>  	rh_reg_write(RING_CONTROL, RING_CTRL_ABORT);
>>>>  	if (wait_for_completion_timeout(&rh->op_done, HZ) == 0) {
>>>> --
>>>> 2.51.0
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
