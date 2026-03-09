Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B2CEFCD9B
	for <linux-i3c@archiver.kernel.org>; Mon,  9 Mar 2026 11:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=56EmpVS5PZoD0kEds0aOSWQpTMqXC31/ltZ0zU0pLrw=; b=JTlzjrNCE0HhzTzzYS9sdp5i0y
	C7ellCWpXaE4OVM6kUtiZkuFzQBy5jzrOaXfNSVtw4FLrVDhonbwFkeO75xL9pwdTLm5swDTxcmkN
	iJQ6VYizeLfnf+CTXnTJWiXPI8RzaU9yOGyz59DFF329YSw450wFdn888+32yF8uttiI8UKyULPGD
	e6cbX/LgoM0Hz/ZS+2yKpfLkfOBlN1M4LL7CKOlPs2MKnIt0otoBEaV1a7suGvVHuQcxSKOaEzbeZ
	IYmkeYFMfnBq1ae9uuc4krhyg7FbM9nTGgPI7ySAW9Xn+BPLUKVaVDGYIiJbXp2U/miIFtyWwkqno
	Rn0wdPEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYxg-00000007Cnn-3i49;
	Mon, 09 Mar 2026 11:39:49 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYxd-00000007CnQ-3qbk
	for linux-i3c@lists.infradead.org;
	Mon, 09 Mar 2026 11:39:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773056386; x=1804592386;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+bIQBtxTPPL/OZCKYP56qYB3hmttUFBkfTzjtx3f8Zo=;
  b=VvfFjBHicVYy2LhKNgPpArubzMeKVVsFZfF7K1Sn+eMd9vv/IR4mDpr2
   NV29XNQ9Fu9hmFdJ2Qysz9/YmYBf3T1J6Ospr6X+zBZOm6LTP7D90fORH
   3GlIj94bhIMhsBaD/bFVUHr5Qf43zxXDpqiGgWJOPgkzoHXK99mbmz63r
   DUZZiZi39R9gmREjoksSyvRMmoLiegQeHHVCXmVp7XAQgohwo3fd0mgKv
   x8+wCuDXpEwc4lJcyNGaGBh7wFKis4mOSG2hPtgMHb9qZ04kyx9yZv1D8
   Q94VQe2YQl1HyR7s9u0J1kfdrqtZBODGjGj2j+VuOdj5m902etvNbHx0B
   A==;
X-CSE-ConnectionGUID: 6R5hbGQuRnuYKVy5ODhyYQ==
X-CSE-MsgGUID: x1lt0Pf1S0mtcPOHwFhSEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="85426808"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="85426808"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 04:39:45 -0700
X-CSE-ConnectionGUID: G2g4bYj/QuS1ui9S6DulsQ==
X-CSE-MsgGUID: Thu1bAtFSZW/wGC+jFbwmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="219672536"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 04:39:44 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 04:39:43 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 9 Mar 2026 04:39:43 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.48) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 04:39:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aOLI5gnNyu6nMXy3bJAq1ES60hApdurnTF9qvsnTI2jsfYuLWL86yJ/Lgat1R4ljGdD6YwTX6RrRBu7YyN2fu8DZguBT47BPC1pZSpY3VggXV8lWNcMOwoCQ2NeYXMmpPR2IlP5JlljPaV76D3XPxA8Gz3pgXwcnZz54X9P9O1G7BNptBXMMdMB2QXsGShjlcBfM7noO1RNaDy+eH2BdvjP53TP7KC02klSrNhNJ7Az7l2WBrpDSV+4XfsCsQgBtagkVHVk5RUPqCeEKYzpII5+LKh5AauR+w1anRVLXAX936nmGVnxCc4CeSODejvnCpM13IT/XC4BhUDuo5Uurew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lzaxscYOyhgy0xuGx451f9pWExDhJi1aPKwMlhfZwKY=;
 b=DMn8IOLT8P0galNSNOx9frbk55XFqv96x4JXY0nSgtx6KE1c6CZEU3Zv8JS6Abg6ff4CNtT35c8prIZABtNt0Ih1wJzbk8JzTh72PYVdYyUUxsQAj4X1iX9qzgtulmJwetnpZj81wR7oJRBDjT9mPVbW+yRaRirGNtyEEUkhXJ+izY+owusjJRUdZG1+A/rv456DOQXI2Q6+qHxO7/hjz9yb4mroO2q38+V+GHkD8H3s/PiH+aEeWAYf+fAOpnysN/lypu9bC2efJldZTqQpiTkCYymAtWkr2+0xjsWIVGZlIbK9wUDUx45nHKosgSvpD4DgxNcl9MXZ+ik0Zw7+qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by CH3PR11MB7940.namprd11.prod.outlook.com (2603:10b6:610:130::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 11:39:41 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 11:39:41 +0000
Message-ID: <458bbbb3-babd-45d2-b290-435811058ba3@intel.com>
Date: Mon, 9 Mar 2026 13:39:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] i3c: master: Move rstdaa error suppression
To: Jorge Marques <jorge.marques@analog.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>,
	=?UTF-8?Q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>
CC: <linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Dan
 Carpenter" <dan.carpenter@linaro.org>, Jonathan Cameron <jic23@kernel.org>
References: <20260308-ad4062-positive-error-fix-v1-0-72d3c5290b4a@analog.com>
 <20260308-ad4062-positive-error-fix-v1-1-72d3c5290b4a@analog.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20260308-ad4062-positive-error-fix-v1-1-72d3c5290b4a@analog.com>
X-ClientProxiedBy: DU6P191CA0038.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53f::22) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|CH3PR11MB7940:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dc20922-7aa5-4b47-65dc-08de7dd08d2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: FL8DhXnNXj1HM1JEDI6zc0QuFpYrdORp+qATF5HBBjFVL3pTHkmmJuuW6IYnSfmeCG+o3V7zYjsSyfp/embZ4UAhsh3pIUUl+Fhvj61JXXHD4sKoAQlHzLWz3XJvs2pYOYZE7/Hi1K4lfE/ufwBWEkC4VnBrE7Q5QspVzSWJNFLTU/fCt/1a0NFMJiZF8B5TTtGmqEI3nnZvhqWL3ztMWcGNdqoSF926uWrCHHVu/XT9I7y1NZs/nSUnPpVoopejTBmyQdQFJnYSr6DBddvlxmnhn/eo9S51jw69J98VY7KAzu5sA9aVxkIs2yRJfPiqgB/iGF3OS+PciRAVo7DVawRuZewROUTPMDEcc18iFJjGWC5vRVq/NT4Kg3ApmfoPWN+9OHHX2/t5EiAKIZEY6WCrfzk2ss7yvE6xjXiRf+g3eIlItv1QevzqEJzNBpLU3a+ARNaAjfnP4PiKaBGXlUs5DobnlX8Fx1rJxlWjQMHGYMVaDTpALKT5XkQlRn32yjgTaD1eU+SD1/hSPnt3VndwnrzcW0+Gh2g87zvOEb1Rywf+h13gjPnT17B4dAPlNzvw+SPn1Ae0ANYore7F7Zyqj1ukjU5e34UH4p0lE5c42/lnPHz7RW+G7yep5EyPvF8SGGQAewLZEFt3wpY1BmiEwOYR7/oViBg+5VZfCcM/MLQ1Iamapp06PbVG5nTQ1hh78sXQhnV3F+wjAvTa1obk7gVbBdJQCYoR4HLX2JU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rkp6RXRodW9HYW1IUHZiS0ovSVRRQXl6cHdHV0FVR2g4Qmo2WDVLMU5hVWFW?=
 =?utf-8?B?MHpnVkZuSkVpQ2pHTlk1QlhneXVnWXdSTml2NlFGT1A1R3pJSmVzeHJoRW82?=
 =?utf-8?B?WEMvZGcyd1ptTVdpTUpjVVhWODRQTVVxUlRsN0FmSGFtckk1SE9RVVpRWHRK?=
 =?utf-8?B?K3BrK05jY3NyMHhoUGw4ZXNVZGFKZWI3a1RZMXdhQVZUKzBDYW43cGpjeXp3?=
 =?utf-8?B?RkowVC90bEVIcC8rVmVOR3I2MzFXbHZTbDlsbUxpbm1qTW9HRTRFcDFRVHhR?=
 =?utf-8?B?OGhPbWdqMndNSERxc1VCRTVoeU1kZmhMWXF3dm04bHJaZ0JhZHNTTjNIVHNH?=
 =?utf-8?B?OEZzcnhNemVEeEplQmQ5L21DbEVJMDFHN3VrbkEzY21wUm9hSktWS2pXcXUr?=
 =?utf-8?B?dElISHV6ejVrR2Y4Qi84aHp1Wi93MkRvMVBZOXp2VWhsdHJzWEVBb0R3bmpp?=
 =?utf-8?B?b3Q0T2FZSmFuelk3aEk5Mkg1ajJFNDZzYXlSWm8valkvTmJpS1oyUFJHZmNW?=
 =?utf-8?B?QzZvUjduZ1M5eEVnMmpZZk56YktHZzlONlJDOTBMMXhFdHdwQ2hqcXpoN2Y5?=
 =?utf-8?B?eStoS09BeWJvUlFzenhNQXp6bE5HcDlBVTVsVk1TWkJLeVAvZGJoa3J5S2dO?=
 =?utf-8?B?eHdPUGF0aVNnTWYrSzM1UnZNVWN5bVAvd3BEMy9tY0hQUThBWWk3NUJvZmQ5?=
 =?utf-8?B?RnRFV3grZVlic1NWTVhWUE1iNVpKeVByYll0YTNUN1IzMWdGaXdXZFJKb2N6?=
 =?utf-8?B?bkkrKzN2UWN6ODdZQzM3OEJNZy9FS0U3cHc4Qk96Zy9mRzBCZzJmSjRpQUgx?=
 =?utf-8?B?TEpLemZabTB1UEJDVWVIak4rWEU1YU9Tam00TlNSOWhFNS9vSlFKbXFGVDQw?=
 =?utf-8?B?c2xld1d4R3Jnc0VZcFpZV1VlZStFZkd1cHc1RW91a1B1NXFnZjFjWHNGaVps?=
 =?utf-8?B?Z2t1T01SdEpWRWNlQUE4YThIT0l0QTV2WDM4ZXZvYlJwNmNrbHBIeU05V2hx?=
 =?utf-8?B?SEIwdlBRVzBiYkRLSWZBVjZsVXplS2FsRndRaFA4YWdDNHdoaHNNdjRndE9y?=
 =?utf-8?B?QUtDcUhhY1hqZUJ6ZlBtTUlMU25GY0N5V0VKaC84YlNPMHVHaHdEd3MrNUVU?=
 =?utf-8?B?VHRuZ0g2WVJHRXlSSTFXLzFPS0FHanZJMDcra0V5elpMRG4zQXI5dmtPOXAz?=
 =?utf-8?B?YkpaQnRvemVITURlMVFpdi85TndidE8xM3FHejJBaHhERTRtcWpmNmpydDI4?=
 =?utf-8?B?VTNWcFdtczVXaWEvZVlkM1hmWlNadDZESmxlQkMrSUtDMHFsUHdzRGpZT3d0?=
 =?utf-8?B?NmtySkFZMlJ6SkFHdVRqYTBPSDZKWTZRYzRGYzl2OVRZRzJlWm9LcEpQcVpL?=
 =?utf-8?B?WWRpZXdwZHEzVGNzNko5U2M0WG5kZTkvekFxMWZrNy9NR3krcXcvTmRWcUJF?=
 =?utf-8?B?cWdSaXM3UDUrcTNSYWdsWlkxb3d1anhrQjdjL0JqTkMwNmE5SlNRdkZadFZ4?=
 =?utf-8?B?ek5tTERWQzFQQ3VKaDVjRldadkpSRzQ3V0JEV29rbTlQUjFJZmZUeEFMUjQ4?=
 =?utf-8?B?bHFSaTZuZzlaQ3JrODl6RldlL01Cc1FNamZZWlZkOWFtaTdQejdNVlRKWXdz?=
 =?utf-8?B?MEZxUTVqS29keEJSdHJBS3VnU3k3cHA3ZFNQbk9ZM1ErQi8yb3ZMaVp0SW5Z?=
 =?utf-8?B?MU5ISzJZUWptTjB5K1B5cER1REJ6TTg0RUxKWVJKSGV3ZWN5dDVuQmpwS21Z?=
 =?utf-8?B?UnRBbHpJWm04dzQxNW9sem9lTDc1cG0zT2ZrOTlxcW1TSzczVWF0QUdoVDhP?=
 =?utf-8?B?OHM1TDNkVnVCTERFQWlwQVEwUXRHbWg2L3liZkNNM2NYcXRMeGVwQVQvWlQr?=
 =?utf-8?B?T05tY2pMR2l2L0kzZzhoUVJEUTBHT3ByVWpza29EZjVOT1lxc29rbWJYSDNm?=
 =?utf-8?B?cVpkU0loejAyaDJIWVV3amlSS2MvMjJpaGlWVzZQYnVLcmdrdW1Fdmk3cWM2?=
 =?utf-8?B?VW9NYmkrZWpNcko3SG83T1Z2TW1GVXNOQkhJVjR6ZTNLTTFBQkhXeHVaVlR1?=
 =?utf-8?B?ZmJMd01uenhyTEZFd1ZidlNhS1RoV291N2lTUlZlL0ZXSzFDRzNlRDNLTWFK?=
 =?utf-8?B?WU14WlRCMFROOEg1ck9pQWZqdjVDa0VCZ0tDZ2hOTkNZSk14NFpBN2MvSE02?=
 =?utf-8?B?Y0RnaVA5MXN2aE1EdUJsbEFtTHhLVUloZUV6a3pLc1Jna2JMalNlY2E5ZEpy?=
 =?utf-8?B?Y2FsRlF1TVVZODJtUGdWMDhFRVlVaEEvSThSaDRDUjNtTU9IcThEejE2VHh6?=
 =?utf-8?B?dE1Wa3ZlVHBXWCt5VmQvMDhSdTJMV2dIa04xQzQ0aEVBemc0NmZieXVjTkNB?=
 =?utf-8?Q?k0Csh0MDdt+dN/JI=3D?=
X-Exchange-RoutingPolicyChecked: M+hXvlmgglUgTmhxH7HBk+2XU88g/i1/puwJTwX7gjOG2A7W8sAtFMhTGL0vXpV9fkO2XnJgNMK27OypK0a0uI9Lb5qNMyyT15DBlBnsTQtRYmFlhrN82X6s5P13DBtxT2lSBrnAyJsRyxGmf6Lg1tzSuUwrg9Z7eQQxzNRPBC8IteyCv68CsobLyNsM54n2CZUQ8K+k3e7+IXI5mBmm8AqSJDKzWj6nGZZjBiWZLNTEbDv1y6pKmsOcvK6WwH/QW63vYxIIP3mKkNf3uopiFpd50FOxIVu7rhUNX/UNQclx4WCIjCvvAVUquNwfckj/BmBH2OqsVKkYtDaBmaB4pw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dc20922-7aa5-4b47-65dc-08de7dd08d2f
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 11:39:41.1586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j2DPFr165/MdHh2dzfDBPU4ajJTF9PQ4a3MNmw8RRIUuOoAOVMxReiA7fZj7o7Vhye7GqNLapdx78kHrar9sSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7940
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_043946_021479_63735332 
X-CRM114-Status: GOOD (  18.55  )
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

On 08/03/2026 18:47, Jorge Marques wrote:
> The CCC RSTDAA is invoked with i3c_master_rstdaa_locked
> even if there are no devices active on the bus, resulting
> in error I3C_ERROR_M2. Handle inside i3c_master_rstdaa_locked,
> checking cmd->err directly.
> 
> Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> ---
>  drivers/i3c/master.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 9e6be49bebb2..31822fd5ffde 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -1016,6 +1016,10 @@ static int i3c_master_rstdaa_locked(struct i3c_master_controller *master,
>  	ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
>  	i3c_ccc_cmd_dest_cleanup(&dest);
>  
> +	/* No active devices on the bus. */
> +	if (ret && cmd.err == I3C_ERROR_M2)
> +		ret = 0;
> +
>  	return ret;
>  }
>  
> @@ -1785,7 +1789,6 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
>   */
>  int i3c_master_do_daa_ext(struct i3c_master_controller *master, bool rstdaa)
>  {
> -	int rstret = 0;
>  	int ret;
>  
>  	ret = i3c_master_rpm_get(master);
> @@ -1795,9 +1798,9 @@ int i3c_master_do_daa_ext(struct i3c_master_controller *master, bool rstdaa)
>  	i3c_bus_maintenance_lock(&master->bus);
>  
>  	if (rstdaa) {
> -		rstret = i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
> -		if (rstret == I3C_ERROR_M2)
> -			rstret = 0;
> +		ret = i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
> +		if (ret)
> +			goto out;

This is an unrelated change.  The original intention was to perform
DAA even if RSTDAA fails.  If you really want this, it needs to be
a separate patch with separate justification.

>  	}
>  
>  	ret = master->ops->do_daa(master);
> @@ -1813,7 +1816,7 @@ int i3c_master_do_daa_ext(struct i3c_master_controller *master, bool rstdaa)
>  out:
>  	i3c_master_rpm_put(master);
>  
> -	return rstret ?: ret;
> +	return ret;

Ditto

>  }
>  EXPORT_SYMBOL_GPL(i3c_master_do_daa_ext);
>  
> @@ -2093,7 +2096,7 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
>  	 * (assigned by the bootloader for example).
>  	 */
>  	ret = i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
> -	if (ret && ret != I3C_ERROR_M2)
> +	if (ret)
>  		goto err_bus_cleanup;
>  
>  	if (master->ops->set_speed) {
> 


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
