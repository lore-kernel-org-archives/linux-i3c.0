Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1BBFF436BF
	for <linux-i3c@archiver.kernel.org>; Fri, 17 Apr 2026 17:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=gle9737JudwbcQmi6teD/p2B7z9TcqrBWkuprI+O9y8=; b=nifummxHJ+7huIPLySzQKA6S7X
	00ebKmPxkZWqKARVlXktS6DDpmUE6VMf0I8hsCxL5s/AApaIyKs2rFN2EX9a737jA5uDfhq6NmIwc
	Oy+WsOxoCnGA0MCnhveV2d0h8h1orLvZF4LWegDWqRh28Of6c+35DaDJgjz1UhSpgrEE/vS9EFiXf
	zRDuU7DiSiKEJI152WnyHlECnbM6Fo009RmZBGcb1sAa53RdWBmo9i3Y+vs+2zTprrWqPdK3cE0oq
	3pUhNJ+fkZOt2mfk8g7UhYTapkJOtOJ1AIUWHscu5+zlSqUGUQj2VKYWQVx/P0ttZIaH2kJZicFBO
	4fWWyWCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDmf7-00000004J5T-1LXD;
	Fri, 17 Apr 2026 17:07:25 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDmf4-00000004J58-3wWg
	for linux-i3c@lists.infradead.org;
	Fri, 17 Apr 2026 17:07:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776445643; x=1807981643;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=TBSwXKT8L8K5Ko6sG1sz21MuTKC9sBcrVHm8V2yq+t4=;
  b=NtWnAxki/mdGD8R5/3lnSKaAEMDL9VBJjZgEWsOUnSUhd6waRI3DRxzO
   8outXI7Ul6tqdmpH2ckLz8GLiU0JS9zHk0DzKVoqmH/AdQ7kziEEOXh+S
   uycp5DccwOmeR/y7ENaTXyFDTT5UPp2r9qoPlTcvrorhMVAEITUwHP4ie
   acFDSjZcQ7vCYZOR5lPH1gZXeegNoOueN0775R9PQgBVC5gH8dv7r/670
   9+gVQPZoDTThiWYHbfiRpajFennlyLkJhQbIwvuurqDnv4w5PYjBpgeA1
   ftz0kGn3m3aXUbDzn5UbXxKpAzE1kOnVwZ7ga8LqIeVgg7QBaCEOg0ZK5
   A==;
X-CSE-ConnectionGUID: eDU/oGaYRNSnSXFlYstuEg==
X-CSE-MsgGUID: Ja76dP2yTnuFieHtL79ybQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="102925774"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="102925774"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 10:07:20 -0700
X-CSE-ConnectionGUID: ekg2LC1bSG+XS3Q5Vrd4dQ==
X-CSE-MsgGUID: oXVnWCF8Qn24UKjPQmU8ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="230959123"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 10:07:20 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 17 Apr 2026 10:07:19 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 17 Apr 2026 10:07:19 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.35) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 17 Apr 2026 10:07:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nhzkI7FhBu/cU/sZgPMg3dKWvbOleSuMQPjtZSutcW5h3jDDvrvVkRWqhQzNzyGtMO77zxwCgoyKo5XcV6fbip6VwvP0b0LsGERaQys87COVbz5n/Ypvm3OZpSCLpdzv53O3lrDRZwyG0n7D2O7BSPsp/birUv+wghGQoHqNNYZaB7IklHKI+UITuKvqHy1uugu8tWyEMjPNZstGryy5RWjMlT7evTRTYkSSGXgpDr5Rui7lc7j1mja/UajFaG0PzvKNnLrkuymYLy4RL9zMlJhDJZ1LrlfAu1G5OL795kMSrW4yO2gQJ9FO942nC4B7QYGM8w4zyS8zBHhK1GLcFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i7idgERJbfxXdX1rC2rwGX79s2o902gGLdXVgHqSfQ8=;
 b=hmatpijd75veoC5s+Ji1fP4WREEbLqsYNCwTNCZJjrElpz+KbjBVVeCRHQ1iTZONB87FFfupEwyp6PG33d5+Mg2IUPc+HpIPj0CUJAmIPom3TcIugpWLCkorwQBgShrUmPUxS5Iv5k063NAlimnnbk/4u1LjCl9zzAj7srxAtDZZ0nwbKBHllIOMCmxRQevDsm1K+s1XPNnLgMF7hgpspDErqEuBdi5EEwMes+7cnIdNEFViVbrNR2sQHaobJaGMcI/6Pm9tPVr7mrjSruVPFAgXHLluosq5FJ2dVja8C1AlwiprSHtLKcGh9zVuX+n0/pyj3wYWYQpuNTVIzcNhxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by PH7PR11MB6008.namprd11.prod.outlook.com (2603:10b6:510:1d0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Fri, 17 Apr
 2026 17:07:16 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 17:07:16 +0000
Message-ID: <3db31a9c-443c-4d2e-a6fa-8cf16cb80bcf@intel.com>
Date: Fri, 17 Apr 2026 20:07:11 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/16] i3c: mipi-i3c-hci: Prevent DMA enqueue while ring
 is aborting or in error
To: Frank Li <Frank.li@nxp.com>
CC: <alexandre.belloni@bootlin.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20260416175704.41217-1-adrian.hunter@intel.com>
 <20260416175704.41217-4-adrian.hunter@intel.com>
 <aeHZnUV0QlGHYlVA@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <aeHZnUV0QlGHYlVA@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: DU2PR04CA0228.eurprd04.prod.outlook.com
 (2603:10a6:10:2b1::23) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|PH7PR11MB6008:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fd58063-c5cb-4a57-cf4f-08de9ca3c67d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: y2oYHaAtbebzg+bJGgUWolo7sk3I3+h7ZsS/hd655DnacPmH8uZq7nfTUe+VKUo3YCXdUIFZFOtn1MbflenKi32tvGd1sP1QlfQip+CenQZ4kH0uTWeoI/IXfiMZ3UMmGFLtIuqBlPvVhlWzKNtaYFiIIy0sIw72KlOxPdCYFOTN/A7dnzydPzc6WsU6hlJ8JaUrxoYwnb+NZemKojwxA4N4EVwl2sRMAdZt4EdB/If/jfYlfEtMPHQZwydsdL+c3i/ynL6SekXqf9gL1yWfP7o05u0GpBGmyX8rkJ96mCDLJsUp4SpgAyr4NBJPYXbj7Wvf32CEnqdiXvgMdJIE2ehgRBffUnsHeSGjwPU0gY4s7B69HT+5GjQ47DCWZiHY2HvAFRNbQOd3GK9jpxgI3QAb8JoK5+XIk7rwF9htFj1k/qGTKdocW2DVknB0mfZzbmlnvIudMNm62FvqsF249WIQPe6WX7xm0u+AaQsIYU93RTYEhtgXX6gP0FlYIc7x67hG039qkKCklJkjMW/f5tCPceVwX9L132jj3jJcmiiZuo0pmDu5TnCGgc8iVS0hFPBlVMI9jeCCz32PbOXYztNTrKvXmPv7UQnluTpCdaf53lkp1GVBlp6OxKW9kAeJrW/JK9ZBV//Go+G1BS4ZI+jhNG3XVCtUtDziQCzHe87gIpHwmDjKFdC4pVd66pB3L2FZozcpUrzUePyoJE3Xe6JCW0rbbM7KBymdQu9ores=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGdKdzljMnRPUXdYVHZhb0ZHVnplY1lxZ1RmQjhDalF2UEtDVGhiVW11blJj?=
 =?utf-8?B?SXB4MmcwMHQ1ZExKTnVTaDFWTlRwYnZJQ1kveFMxRytDMGxpSVlDOUNIdnFJ?=
 =?utf-8?B?SFV4MXZVbzZiTVY2MXpVNHV4Ym5TcGhjNUJzQ1c1NnZYdnkwSHFjRzh1dFk3?=
 =?utf-8?B?N3NuMk5vVi9VNEd6NUZuSWFqWEJrUmNLeVExcGNKa0hWZ0RlYUZ2WnZpZVk0?=
 =?utf-8?B?emdLelBWYlRMU2NFcGlBQ0lMWGJEN0VtZGM5OENVeWJ3ZElFRjl3MW9XSWRx?=
 =?utf-8?B?a21ra1VyczNna1Z3SEZ3Y2ZvUWZVNnN0WTgremFDNVIyTVZ6YmVaNi9UbVJE?=
 =?utf-8?B?OFg2b2JoNGE0UmNUODNmTDh1Sk5vakpqVHU5YmFwWExiR3RQUEFYNVVNd0tD?=
 =?utf-8?B?QkZpWC9FNjB5Zkx2UENZQnpKcC9FeXV0ZEs3cVBlQnptQW5rZHR1ZWFoSkNt?=
 =?utf-8?B?b3MzOFVRS1VXZ1NHeTJVTWtVWGFyczlUWW5ESXRkMkpFVEtkTDVrdkYyblVN?=
 =?utf-8?B?VXJRY0tMazFjdE5rMjh4U0hVSFdqQm9NU1ptaHpSQ0s0eXlqVUlDYnh5ZVk5?=
 =?utf-8?B?cmxLcXdPT0lNQTVnL2E0L1VrelRMc0tvdmhnblB2MU0vL3FxbzFYaDRJcnIz?=
 =?utf-8?B?aEdJQXBvU0M4bDhRL29UVlpyUXlTdEYzdHp3dUNld1pFVXRGWFg1dGZrZTZn?=
 =?utf-8?B?SUd3d2ZrZTI2dFdEOCtWTlRhR09ndVlEclFBZmxUdTdESHRSNU9kMkhGSWIw?=
 =?utf-8?B?YVJTY1oxV3FzR2t4YStUYUFNdmJTd3YzRHNINk9OZzZPSXQyWFJFZnBVVm5t?=
 =?utf-8?B?ck9mSHM5TlhTWS9oUXQxQTRhc1FGV2NXRk1PSFlxaSttUktyS0VLZHpTMFVx?=
 =?utf-8?B?THNyRTloalNnODRvZTdkVk4xbHVXNytLSTdXRERjSmlhVXIrdGpPVXgzZnN4?=
 =?utf-8?B?Yms1VXloY2hXSmE0QlVnWjdxWVdrZ1EveHFTeVlBUXZsM3BKbHJHL2ErWnNh?=
 =?utf-8?B?VnVxRVpYZE5zTUV0SHZjY29GRW9BeWtrbCtHYXIrRFdGbzBac3RQYkRmNGZG?=
 =?utf-8?B?dDZCOFE0V21GYVNsQzRRczJ3RW5aeW9UMXNaK2R6VUc4dEs0dlNxY1I4bkt6?=
 =?utf-8?B?b2ZxVUdVR3FRakdaMGYweS8yNjM4RFlJNmFYeUJxM2ljRFhjVG9WN2JWeG80?=
 =?utf-8?B?dHdKMzg2YytNd204eGttVlM2c3pDOEFjRTYzdERUdWRjT042UnBhenB4Y2c2?=
 =?utf-8?B?UWtNbVEwajVybTh4NzZsbkZKY2hVUkI3N1ZFM2ZCR29oVEw4V0c4cVUxZzlH?=
 =?utf-8?B?RVFHck9NUVpGcHNwSmZlRUlkOUJsSEtTNHFDTko0aUZ0WGtBaXhNeU9XYjBr?=
 =?utf-8?B?eU11UmpDM0VEKzdQZUFpMEpnSFZvNkVLTDNYbnNXMjhKMmxwSm9UUDl3Uk9I?=
 =?utf-8?B?aTRFODY0Nnoyd2E5N3VzenZwN1pCY3A4TkQ1WWZiTmE0b0gxK3hBVkxhaEQ4?=
 =?utf-8?B?NGNqZ2FjK29VblBRZ3NYdGl4VlRQU0JOVEJYRDRpWVBRU0Fmck5oME42ZzhY?=
 =?utf-8?B?THlvNjllMjFIVElBdnVUTDIxSUtwUjRXRVRkMkpadXBaN1F2eVFDMG0yeTRJ?=
 =?utf-8?B?dmxwMjRLWVR2OGR1V1VGUVFLVmZlWXdrcEJUakp3QnlrRUhvbEVDeFBnZFUv?=
 =?utf-8?B?MjJMejN5bXh6bDFSRjJEdGZETEZEYWErVkxoMHRMSUluZlhXakpPVUo5TEtV?=
 =?utf-8?B?U2p6Ri9wMTNsZnc5ejRqTTdhUnBOQjZGM1J2TXpETkIwdkFTMDRCYUFHeXRV?=
 =?utf-8?B?SkV4MzF0d01xaUhhUjlWL2N5T04vWXNnbWdPeGNtSGZqWWIycG5IMmZVVzND?=
 =?utf-8?B?ZWtaRkQxUVhKL3V3OHdmWG5EbnpaUU0rYUxQemJiaWJLTlNZK1ZQdWFpb3hD?=
 =?utf-8?B?dUExdm1DVmtMVGkxaVQ0bllDZFBOakNsRmRlTlJxLzBldDVwUEs1cUFmRmdv?=
 =?utf-8?B?RUxtWkU0ZTRCTjMvWDdXcUNGa0t2RE4yOXc4RnQ1UjVWamVlNFc2YXY2ZHV5?=
 =?utf-8?B?OEEyRzM1NUlEVnhMVjBxdnpjaXMrazc0c29RcTJ6cXJhSGxHdXBKRG1hbXc5?=
 =?utf-8?B?UDRmdXorM0dRaCtMQWZjUmdtQ21IazFZaDBHWTdhdWp5MVlsRk5YSWd6Z3Vn?=
 =?utf-8?B?NUlhay9MenJwd09WT0tpeGRrWnhHYWtaWU5aekt2cUd3U0t3ajh6cW9zdWI5?=
 =?utf-8?B?d29ZVVR4bW5EZG9sOTZWZXhtYlFJSHA3dGZVNWxBZVp0SEJPdjYwUFdjdGxZ?=
 =?utf-8?B?TmxocStCZDhSbXU4MWh4TUNzeU5HN2g5UlZlY0cyZVBmRTdGNmZTRnM0Z1o0?=
 =?utf-8?Q?cXWWLdDKsGc3YDTg=3D?=
X-Exchange-RoutingPolicyChecked: LhnF5/BLSI4Cfm421XtHyAHKWZ04AwX0XWLJj2OstN8zBRMzi0TncClVBfcreEfq9Qd4zYdQWNPFEh/aAMofR/etGh3dryuw0b/6Aa4SMugXdDG//lxa0P+bW5bvuYnn3yjk4XJe1bYsLpayZuYzic+a8UITQ09byGp85aOGlhnRvSa6F58mxQue2wjbh4v1BtKJb7GBi1HPfNbN+KcgURdAGnhB+tJWYGpgkg5V/Ufaj7e0plI2yT+98vdKdDKqkeEAtPCYqWCR2sE338uCMT3+VQU9sLzwspGHYMxTID4vRpRdhgp9St4gxfGVAWQj/hAFrd2p0e8WofXfinUhQA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fd58063-c5cb-4a57-cf4f-08de9ca3c67d
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 17:07:15.9384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1OIhmLAL3B9koKrubTFLU8OuD4Kfnsmme+96zUAO8ZjHvgl7KxRRSyUK19laOo5Pw+v4WcFRMNw5UsXypFmEhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6008
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_100723_052926_8EC0F271 
X-CRM114-Status: GOOD (  21.88  )
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

On 17/04/2026 09:56, Frank Li wrote:
> On Thu, Apr 16, 2026 at 08:56:51PM +0300, Adrian Hunter wrote:
>> Block the DMA enqueue path while a Ring abort is in progress or after an
>> error condition has been detected.
>>
>> Previously, new transfers could be enqueued while the DMA Ring was being
>> aborted or while error handling was underway. This allowed enqueue and
>> error-recovery paths to run concurrently, potentially interfering with
>> each other and corrupting Ring state.
> 
> why not hold lock at abort and error handler? does it take quite long time
> to do that?

hci_dma_dequeue_xfer() handles errors.  It is called from
i3c_hci_process_xfer():
	on timeout:
		calls ->dequeue_xfer() == hci_dma_dequeue_xfer()
	on error:
		calls ->handle_error() == hci_dma_handle_error()
			calls hci_dma_dequeue_xfer()

It takes the spin lock, but has to release it to wait for the
abort.  There is no set time for how long the abort can take,
but the timeout is 1 second, so it is not suitable to wait
for.

> 
> Frank
>>
>> Introduce explicit enqueue blocking and a wait queue to serialize access:
>> enqueue operations now wait until abort or error handling has completed
>> before proceeding. Enqueue is unblocked once the Ring is safely restarted.
>>
>> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
>> ---
>>  drivers/i3c/master/mipi-i3c-hci/core.c |  1 +
>>  drivers/i3c/master/mipi-i3c-hci/dma.c  | 25 +++++++++++++++++++++++--
>>  drivers/i3c/master/mipi-i3c-hci/hci.h  |  2 ++
>>  3 files changed, 26 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
>> index bb8f2d830b0d..5e1bc6d819cf 100644
>> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
>> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
>> @@ -976,6 +976,7 @@ static int i3c_hci_probe(struct platform_device *pdev)
>>
>>  	spin_lock_init(&hci->lock);
>>  	mutex_init(&hci->control_mutex);
>> +	init_waitqueue_head(&hci->enqueue_wait_queue);
>>
>>  	/*
>>  	 * Multi-bus instances share the same MMIO address range, but not
>> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
>> index 4cd32e3afa7b..314635e6e190 100644
>> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
>> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
>> @@ -484,6 +484,12 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
>>
>>  	spin_lock_irq(&hci->lock);
>>
>> +	while (unlikely(hci->enqueue_blocked)) {
>> +		spin_unlock_irq(&hci->lock);
>> +		wait_event(hci->enqueue_wait_queue, !READ_ONCE(hci->enqueue_blocked));
>> +		spin_lock_irq(&hci->lock);
>> +	}
>> +
>>  	if (n > rh->xfer_space) {
>>  		spin_unlock_irq(&hci->lock);
>>  		hci_dma_unmap_xfer(hci, xfer_list, n);
>> @@ -539,6 +545,14 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
>>  	return 0;
>>  }
>>
>> +static void hci_dma_unblock_enqueue(struct i3c_hci *hci)
>> +{
>> +	if (hci->enqueue_blocked) {
>> +		hci->enqueue_blocked = false;
>> +		wake_up_all(&hci->enqueue_wait_queue);
>> +	}
>> +}
>> +
>>  static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
>>  				 struct hci_xfer *xfer_list, int n)
>>  {
>> @@ -550,12 +564,17 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
>>
>>  	guard(mutex)(&hci->control_mutex);
>>
>> +	spin_lock_irq(&hci->lock);
>> +
>>  	ring_status = rh_reg_read(RING_STATUS);
>>  	if (ring_status & RING_STATUS_RUNNING) {
>> +		hci->enqueue_blocked = true;
>> +		spin_unlock_irq(&hci->lock);
>>  		/* stop the ring */
>>  		reinit_completion(&rh->op_done);
>>  		rh_reg_write(RING_CONTROL, rh_reg_read(RING_CONTROL) | RING_CTRL_ABORT);
>>  		wait_for_completion_timeout(&rh->op_done, HZ);
>> +		spin_lock_irq(&hci->lock);
>>  		ring_status = rh_reg_read(RING_STATUS);
>>  		if (ring_status & RING_STATUS_RUNNING) {
>>  			/*
>> @@ -567,8 +586,6 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
>>  		}
>>  	}
>>
>> -	spin_lock_irq(&hci->lock);
>> -
>>  	for (i = 0; i < n; i++) {
>>  		struct hci_xfer *xfer = xfer_list + i;
>>  		int idx = xfer->ring_entry;
>> @@ -604,6 +621,8 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
>>  	rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE);
>>  	rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE | RING_CTRL_RUN_STOP);
>>
>> +	hci_dma_unblock_enqueue(hci);
>> +
>>  	spin_unlock_irq(&hci->lock);
>>
>>  	return did_unqueue;
>> @@ -647,6 +666,8 @@ static void hci_dma_xfer_done(struct i3c_hci *hci, struct hci_rh_data *rh)
>>  			}
>>  			if (xfer->completion)
>>  				complete(xfer->completion);
>> +			if (RESP_STATUS(resp))
>> +				hci->enqueue_blocked = true;
>>  		}
>>
>>  		done_ptr = (done_ptr + 1) % rh->xfer_entries;
>> diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
>> index f17f43494c1b..d630400ec945 100644
>> --- a/drivers/i3c/master/mipi-i3c-hci/hci.h
>> +++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
>> @@ -54,6 +54,8 @@ struct i3c_hci {
>>  	struct mutex control_mutex;
>>  	atomic_t next_cmd_tid;
>>  	bool irq_inactive;
>> +	bool enqueue_blocked;
>> +	wait_queue_head_t enqueue_wait_queue;
>>  	u32 caps;
>>  	unsigned int quirks;
>>  	unsigned int DAT_entries;
>> --
>> 2.51.0
>>


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
