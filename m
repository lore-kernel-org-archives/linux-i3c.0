Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4191BFD4F23
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Mar 2026 19:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=BnETCnSQo8Mq+5wB8Te2iUWMj9M07Kjuihm0BLe2les=; b=TABDioi5yfLtKgJaNfwfwX5LcB
	x/OPCNq7NQY5tznR/gedsz+CoSU/3u6/fIJShOYxtGZ9YN4Kvs/AmcT468tYONse/9odK36wjeDRr
	Dei8MAXybRyvmeYyMZqIkLBbCqWyIqN66VrFTKE4zfLmLzF6n4K0rQpu6BUbr0N6/8jFv3/aAqo+q
	jNUAebttGsb+iJonJkt+ShOwCiBuN+J/zdbohC80h2etTLSwtLe2SnNfl71sM6vPg1XjksQYpzxv7
	K94SikIG3RGPggEwYgsZ/92DjTAfzeumRT/eEymOrIeStXIqcqU+RrUBo0hthrivvCCu+9MoUXxfb
	hMMSi46g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w02WO-0000000A9mg-3hNq;
	Tue, 10 Mar 2026 19:13:36 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w02WK-0000000A9lf-3Iwv
	for linux-i3c@lists.infradead.org;
	Tue, 10 Mar 2026 19:13:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773170012; x=1804706012;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=UXfqcqPKT6sNRXwU19g6fodgg81/FkqJyMpIGMWKQVc=;
  b=Ti2pT5XBvaVG4UuLbmbCITaNbkTqy9Tqv16VRkJDdG9ADfMCqdYJ+h1s
   NF2qDf4VAUQ17DB1CCBWln3TBoPFklktytfN0F4awodg12UU6rsAFl3FZ
   2x8RQf7UVXK4ZuR3NHwWqswumsjBLzVMEOn2UEv2bXxTdo8ss1TOGFE+M
   RKrRNUbMi4I6fdby6EPxOCExRS2PPgNkfCzR1tyc8+lFilN00Nk5KP3r5
   vHhSmYREbC6A1KkmvEZgILziHddTsC8pZ80dj1KE196OOBEVeZQjNVQSC
   4JY5lIUY+eMp/bwBPT2nX4q5tKRvDvY6do/1eF9qssQX72KrmBVCsjrN2
   A==;
X-CSE-ConnectionGUID: o7y4e38dQo+jiP4vK8GRyw==
X-CSE-MsgGUID: nyVfK4QKT86RC77/C5YqeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="77832624"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="77832624"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 12:13:29 -0700
X-CSE-ConnectionGUID: vNVU7TsyTOe6zTZ1EbWU9w==
X-CSE-MsgGUID: JceaAVfTRPWlWTsdRVGQmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="225172273"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 12:13:30 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 12:13:29 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 10 Mar 2026 12:13:29 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.4) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 12:13:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VI7QJ5nhqWEyHhz353NDzb8U5qqUW1FngkY+n8D6ET3ahY58te6+KKdHMqLqGwzT3EWsANZqejmlm8cwYZirrR9MQJjYdwXacLnuFOUVWUsPZ1Qi1idgQx8KIei5s5Tk7MyycSNJyJUQFVXNRRDSjVG8ZxphpnQkX4G+hHbYw2e7lh32f+cvuWc15INKATCdlurOgM9aV3he+hTuP5X+5qMapEGpm1GiVup6Ksw2b3nRa58MbgMzJhpaHscFRPrwK43C94hd1kszfYGEH7b73yhKVWPCZSUX1TNgvKrof0WofUlXrLiK2fkcNrOjJKuV2HWzhwv2I9AcznFmttMcvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0zsDPZB84p6/z3sATTPBY8h6h10l/bcKd8XUZCkPss8=;
 b=CwopC1nZcD5hq0IpVfmWUklIuWgG//TdC6yqt40a9cOGL+P2ToooVD8jmSPbl/9I8I7PWCT4lFidjL1tPXtTgCJNSUVOCe+aSwRSBOxe+DoA4jk57qqpgU0ParFQtHy3di456GAtNpL4YHwc9N84LRye8eWU8orNFyVqJiaHOMKWz1z3TlUqo3cv1zLGdoyRi+5w1ciMBQfPNvLytMDxDmo0ccx0oG3E8YfGZO5kM30EZnGnAXzEpzkCJ1ZE2eOdb0cV7yDoB5rZdzrrYTT1CNJtkb+ahG8gFA8qOYwNaafS+IbcKubVLO1l524n8HdCvvBRGOT2OENxgPVIKd0/LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by CH3PR11MB8240.namprd11.prod.outlook.com (2603:10b6:610:139::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.9; Tue, 10 Mar
 2026 19:13:25 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 19:13:24 +0000
Message-ID: <c1547277-e83a-4eca-86ff-88974e6c5ddd@intel.com>
Date: Tue, 10 Mar 2026 21:13:19 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] i3c: master: Move rstdaa error suppression
To: Jorge Marques <gastmaier@gmail.com>
CC: Jorge Marques <jorge.marques@analog.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>,
	=?UTF-8?Q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>,
	<linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Dan
 Carpenter" <dan.carpenter@linaro.org>, Jonathan Cameron <jic23@kernel.org>
References: <20260308-ad4062-positive-error-fix-v1-0-72d3c5290b4a@analog.com>
 <20260308-ad4062-positive-error-fix-v1-1-72d3c5290b4a@analog.com>
 <458bbbb3-babd-45d2-b290-435811058ba3@intel.com>
 <k63sp56mbqje2wqo6yjcql27ag7pkwbuwch7llnal7j6sww4wp@3bnal4rcgpzn>
 <62db3005-500d-4110-ad63-9cd200965724@intel.com>
 <c3lyva3q6yqbeoa4vzmxx2mhnffahpzljcm2cntppenkmntisg@fniqac3weif6>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <c3lyva3q6yqbeoa4vzmxx2mhnffahpzljcm2cntppenkmntisg@fniqac3weif6>
X-ClientProxiedBy: DB9PR02CA0008.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9::13) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|CH3PR11MB8240:EE_
X-MS-Office365-Filtering-Correlation-Id: cb6c558a-8af0-4868-6b37-08de7ed919f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: gYK09s2PZlGw3en4UsMXsVQb4vh/ZdF6KdKomfHhshUs1hC44NEV7wSoo5qS4MoGBc0kML2Fmeb46MwVriCpvXGVGo0xaUrXympdZFjy8s3JDyQdpnc1/bcWMjTMdqX8/0DIVilcOvM0MlF8sdNBemqiH1TkieBHByUYEbCqcVkp5divmHvdqDWb7LK5eA3sE6zOI7KJwNiT3q3sn5SsyTsn2l/GbQGsgUzJzCPij22EYpCkIL+FXcw/LeCiqRsgaJSPiO+ZElBi+TtHb5p1xGHN+a3I93UGbripqLNB6AucMvFM6beMrnpSJFXW2nlCb3EYxr9cAZS6C09U5ygt0Bg+fLvg9d7G5TKk3A0XY3oYLJd+rnfsGrYe/gSjjfmnanoPujHExQEOU7Mg5L8u3q345qpckfHLZzfKIUTAAXzD6B3w2XDoJTh2SjafDxjgnRwsdPGflS31+vpcYlkNYC3dE2FUqlGCtg0jG4M9WPeIfy3LjLaBuOr5kHQ1cKWczhUHGKmHCv7FKj6xPmhJ3zWusM7yenNFEw7uQ5XPr7+S7WohlwUwLyuDgyvpeB1UVOjdvfCHeIu8TN+a7HkRqbUM5rx8nX2+agu8IyBTKFlMOPLrFqgghZzR0KbiOySVT704qWG+m51shAhjOXSYekzsJ+4GQ3a6HEsX8JK9eh5tzlGjDl0IMonCV1DsJGfi6Iy0+OR9QROolNOR3BOInCYPVGKufqBeOYCE2OBkV9Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVZvV0RTRmdNQy80dzBobGVHMWJQZ0NrNTdQQkxoU2tZSWRXb0xWRjRuZCsx?=
 =?utf-8?B?TGlBbVNPQVVBSm1XNE9iOXBaUHBkZG1oWGJQUmNHcjFHZUpaSkRrNHdyZXNF?=
 =?utf-8?B?bFRyOWJISEtFbzBCejFkNFRtZU1Jd2FKTkxRNkErNWlYWE1kZkErYkM4Sk1s?=
 =?utf-8?B?ZkFFOXNEQnBlcjMzRVM3NTlzejhpMUIyalFRaTA4bm1kOUtoYyt2V0lrTGJm?=
 =?utf-8?B?Y2xWOHFmcTZtSzNCSVdib3JIU09KY0pLTkZBd212SUFnR2ZlSFNlU2NMbU9Q?=
 =?utf-8?B?Q1hOV05HcUd2RzB3aUg5ZUcxTXFnK2NwZUU0eXRFNXViZkUxWnVSOXgvVDNB?=
 =?utf-8?B?WUdCSWVtV0JjdkdhVjloTURidVFRTE1PaVdxYzh6bVo3dWNuNGZma0xKZSt1?=
 =?utf-8?B?bmxuWC9qaC9vTEYwWjZpTWlGOEFQRGJmOE5Dclo3Mi8rUnBSM1RpRWRlLzFR?=
 =?utf-8?B?RVZwTkRGMHgyTDFMOGh1eEM4US9KY0djN0d6dVYxdEIvQmEzRjQzZEdDVnhy?=
 =?utf-8?B?dnpmTXhDcy9ldnRmTURsYWtSVDhNSEJOSkJwQmd1Um9TQkZoQXRmZVlwQUxP?=
 =?utf-8?B?ZHVqYkg4RUhBQmNFV2FWMGI4RFFFWU9KSThTU1gwRTcvbS9MYXBxaTM3Q1Rt?=
 =?utf-8?B?dnRXK1BjTDZ3aHY5eUN5UGxaOE10V25KOXNIQzc4Y3l3UldIVmhpekxKSWg1?=
 =?utf-8?B?d0EzWmVkMkJoNUxhcmpNc28reTM3M1d2SWFXaDZZaVF0SnlneTFYTC81UGFQ?=
 =?utf-8?B?NzRHRFVrempOV2QrcDF5WTlSSFF1OEd0VSsxSGpadmpoL3NKOXUrUktNOS9X?=
 =?utf-8?B?TGFmamdtMU9lMkhkamhWaHFncXE0cnlSdkZRdmRXbFJCSUF4VlBYVi9lTU4x?=
 =?utf-8?B?SDA3aFlWdkZhb2NTLzY0UnpXdytTRmFPYi93YWJUWWx0MjcvQ2FQMm5yVElQ?=
 =?utf-8?B?WnZMQ0M3MUpra0FUc1FGUXdic0Z5dE1qSHhaUmNLcVdldGNlNnBMT284Q0Nk?=
 =?utf-8?B?VjcrV25GMGlOUGNXRnIrTGlYZ2h6Y3g5YXlHdVd3S0RhYXBIYlJMMkJhS0NO?=
 =?utf-8?B?dFg2dnpPc3ZydHh2S2orZXVLMHZ5OWFSTDNNTTJBSUo0SmRqL0tjMWh3aFp6?=
 =?utf-8?B?a0ZCUVp2b0dpMlZMUVc3SUtqa29Ma1NzYlJFTTZjbVZmd0l2NDVrSTVIUlM3?=
 =?utf-8?B?YlJwZnRTWGluN0dQT0swMGt6ZFpKUEJadkJvbGdNcXRCN1JIV0d0eThNdklk?=
 =?utf-8?B?SGR0UnBHa3pIbXphOXF4cjE3RkpYZjVEcjlwRFo4cUJYSktrd3FVUERvTmZ5?=
 =?utf-8?B?SUFFd1VZUnR1VCtQQUdDMmNvbmY0QXB0NlphbEE4NC9qOTJZMHYvc1pUUnVk?=
 =?utf-8?B?Qm1FdHRoRndSSjN0YjV4M3ZNZFFXMCt2eG9nWmR4Q1RlS0xMdVJsVHpiM2dn?=
 =?utf-8?B?OVBjZFZ0R3F3VnVrYlNSdmhiMWNSbU9TSTBUMHhONEcyN2d3OUhmU3U4cGdW?=
 =?utf-8?B?d0JBRDFNQnMxWWxtOUh1MjBLUFJGcHpSQlpkUE1oNThEWHlPczloeDRuZXow?=
 =?utf-8?B?NDVBNFp6RmQzNmFBaTA5SitHZnkyY1I3SnltZnNKbjU1WFlodlVmUFFZd3pS?=
 =?utf-8?B?a2lkZi80MlJTUTZEb2NKZjU3VjNmWmx5bWZZY1RwbFJMQnJPcFVnaWl6eGtJ?=
 =?utf-8?B?M3VmeXRGNHJHeDQxMUdSaXhRUFhqSjgzMm9qR3d1ZUJ4Sm9GRE9rUEF6ZmVK?=
 =?utf-8?B?aWVsUGRsbS9nSHBldUFZbW5OQ1YxUkI5NXRtMFZhVXhURTNkOVRjSzdEQk82?=
 =?utf-8?B?M3QzdmhjU3gvU0R4M3JWdld2NDlvVDczc0x4YXExRXduL2JLM2tURTdJY0xt?=
 =?utf-8?B?RTkyanNSd3lFemVnR04yOGlaZmFYVVVZayttNkl6Mjk5Y1k2aWJBb05WR2dX?=
 =?utf-8?B?a1YxVE1MeC9wUW1rK1VoVHJTWGYxNERCaHp3V1FPaEx0RGNkOWZWVnlERE44?=
 =?utf-8?B?VnFaU0VoMWxlSktoMCtZbE83R1RVQnJqMFpqSjRvRjZPSkFvSU1OWE1iaFla?=
 =?utf-8?B?Zlo2SHVNRjNpR2hoYWxwd04zRGwrbDR0Z204UnRpbFdzWnhGczZuek52ckk3?=
 =?utf-8?B?UjBDZmJVSjBaNlEvNDZpOHh3dTk3b21wd21oRW1uanYzbXVRRDJkdGg0RXZp?=
 =?utf-8?B?U1ZmS3JsVGtLVEhBVjhoNVVyTFRONmVycEN2OVB2R29xKzFhbjk3VzVha1Rw?=
 =?utf-8?B?L1RGb2xGZlBqWnBWRUtNM3NBQ1hqZ1Zvbis2ckRDNWVZczBWUGNMVU9UNERG?=
 =?utf-8?B?MkRxWjNqdENxak1EOGR2M1J2eEUvNHl3QkJQZWJ6MkdqSi9WaXBHcHRlYkds?=
 =?utf-8?Q?+Sp0K2zpwB8+0VYY=3D?=
X-Exchange-RoutingPolicyChecked: tYM81dCYYoP6E+tBay32bLGDJ3BlKuVhlmUpap/drnSHqzYhjT2659YA5lQm/bxFtscxCYPqOu7P8HsNSTBwi56R51s8jDFJvjjNmcKNyC+O/Wa8WkxJWbWQOUugC9wTgI22Odsp3QC68mUAFRznNXjC3TAisS8Nizvvp/49vT8aMBvXZDLTrVwQFDRxTZ+PVcVSRggNgpSZYGhfwiFR6k7WxUSlAWocpel9A5vU47WlTid+fUR+1x/IFCZC0lhT/QJmuJXPDrEWcwCDjsPcxKm1pkGcqGzV+1JE6VEaHEto8N44MQazv1SE4n2zxFwV1Q6tfkqWFZo6Ft8DpVbeoA==
X-MS-Exchange-CrossTenant-Network-Message-Id: cb6c558a-8af0-4868-6b37-08de7ed919f6
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 19:13:24.4541
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZEsSujm52cfMEkXf5Ez/1ai9WPO1B268DB81bKcOKJoyhI3cJAZpwhebEHY9bLKPPgvZw9DY/Wh9OuBGy0bTTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8240
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_121332_938228_773B773E 
X-CRM114-Status: GOOD (  17.34  )
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

On 10/03/2026 10:05, Jorge Marques wrote:
> On Mon, Mar 09, 2026 at 02:34:58PM +0200, Adrian Hunter wrote:
>> On 09/03/2026 14:17, Jorge Marques wrote:
>>> On Mon, Mar 09, 2026 at 01:39:36PM +0200, Adrian Hunter wrote:
>>>> On 08/03/2026 18:47, Jorge Marques wrote:
>>>>> --- a/drivers/i3c/master.c
>>>>> +++ b/drivers/i3c/master.c
>>>>> @@ -1016,6 +1016,10 @@ static int i3c_master_rstdaa_locked(struct i3c_master_controller *master,
>>>>>  	ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
>>>>>  	i3c_ccc_cmd_dest_cleanup(&dest);
>>>>>  
>>>>> +	/* No active devices on the bus. */
>>>>> +	if (ret && cmd.err == I3C_ERROR_M2)
>>>>> +		ret = 0;
>>>>> +
>>>>>  	return ret;
>>>>>  }
>>>>>  
>>>>> @@ -1785,7 +1789,6 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
>>>>>   */
>>>>>  int i3c_master_do_daa_ext(struct i3c_master_controller *master, bool rstdaa)
>>>>>  {
>>>>> -	int rstret = 0;
>>>>>  	int ret;
>>>>>  
>>>>>  	ret = i3c_master_rpm_get(master);
>>>>> @@ -1795,9 +1798,9 @@ int i3c_master_do_daa_ext(struct i3c_master_controller *master, bool rstdaa)
>>>>>  	i3c_bus_maintenance_lock(&master->bus);
>>>>>  
>>>>>  	if (rstdaa) {
>>>>> -		rstret = i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
>>>>> -		if (rstret == I3C_ERROR_M2)
>>>>> -			rstret = 0;
>>>>> +		ret = i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
>>>>> +		if (ret)
>>>>> +			goto out;
>>>>
>>>> This is an unrelated change.  The original intention was to perform
>>>> DAA even if RSTDAA fails.  If you really want this, it needs to be
>>>> a separate patch with separate justification.
>>>>
>>>>>  	}
>>> Hi Adrian, handling I3C_ERROR_M2 is unchanged.
>>>
>>> The intention is to perform the DAA if the RSTDAA fail due to a
>>> I3C_ERROR_M2, this behaviour is unchanged,
>> No, the intention was as the code is written.  DAA is done
>> irrespective of whether RSTDAA fails.  The behaviour has changed:
>> before it always does DAA, after it does not always.
>>
> 
> Hi Adrian, you are right, the og behaviour is to continue on any error.
> v2 will bring the rstret back, thanks for pointing out! For context, did
> you experience peripherals/controllers that failed with
> err != I3C_ERROR_M2 on RSTDAA? Would be nice to map at least one
> non-spec-conforming case.

DAA is being used to ensure devices that lost power in suspend
have a DAA assigned.

RSTDAA is used also in the case of hibernation because the hibernation
boot, suspend, restore, may have left the device with the wrong DAA.

So the two are not directly related.


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
