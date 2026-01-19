Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C49CCF2C1
	for <linux-i3c@archiver.kernel.org>; Mon, 19 Jan 2026 09:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=fCR4mRLaiCrzX+aptTStGVkBsRDNK7c5AslvAr3k34Q=; b=Rsb7rFgPqFDVxxUuuPF2QjZTOQ
	LlZ+ulroWnc15MoYueZCq+AnlGvsREdQEPXMGUz3Qn+RF3UKaO8hlriGdKF/IAeEb5Rtf3NxJgoBh
	YxTTRBWC95MdoxwaYCTkLjG2kLv9aUwl3t7SujLBuWRHKP8UwAEW8KHCuRLuGW8TAH2Tl4mReMhio
	YOwV6+dedjD8LfzaECGiipM2ldSDINN+y5U/Oq7TJpG00bIOYI0zSFVbF9bkMrBGhZv5ZKbgrwfay
	4gXViFG9mivoVV8OB4Rs0TjN5mo601zatEupkAd8DVd2SmCfk8u1txCS+0HQ/IxVWLksetEt0dY8t
	PcQjuUOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhlM3-00000001byh-0WSI;
	Mon, 19 Jan 2026 09:15:23 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhlLy-00000001byI-1H0E
	for linux-i3c@lists.infradead.org;
	Mon, 19 Jan 2026 09:15:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768814118; x=1800350118;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=AG3EMnaRJbbUNSpmPndsdFwRdZiEoTUbJRSZGbuMoa4=;
  b=cbv+l6EIFIkpzkkI3TsGjl0iCL86KZJwLaSPE6NNZ422+5oiorpuum7S
   Uxp7fiCOkt20EhJJeF9unM6qJCAHw53OCp94/9RDi40Jp2ZfFR9rrcYLo
   B6ZfdInkBkHAHFuiNfyBIaBj9EZCftwzOZWArdwwO1kmknS8QnwUSj20b
   lUT24DaO/BSi73DfN+6FVb198rask/Tvr7iJWySNYO59A4ELLPxQT5nS9
   mjzOR1wsMFd9IGBRIT4phbnMJZifiF0V+BsWQyjWOeL57VDSbmPoCIEoW
   o4NPiBoVeEEdcUALxEshIOvz261YmNJL+9dN3mQPxSmVt//ZnPRKMQfvT
   w==;
X-CSE-ConnectionGUID: YZmYVEvIQIqaaApoKwgQEA==
X-CSE-MsgGUID: 9vIuQ9UIQ2Su8UGxAMjCPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="69034719"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="69034719"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 01:15:17 -0800
X-CSE-ConnectionGUID: o6AfEUs5TiexJZNKatSTMw==
X-CSE-MsgGUID: GQ7ASfDkQ9qmlV2naJTsBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="228754870"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 01:15:17 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 01:15:15 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 19 Jan 2026 01:15:15 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.39) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 01:15:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CixQK9uG5tvqa3uEPsyd/eG0Ku4G0tG/L5UT1gGC+74y5y7pyqazDofb1cfO4ImClKf0uKxsOvo1jA2C4IDJoobEXXjZw9qE+YWRaovgqN8ldsbmzcoavOZ74oZ8e0HxJEn7lYnbmQuKyN4o6sSqCRC4tHicMpPIo2SAPcjCzGofJ/07DPL2hz6V3ShriYreSQOAdAmOauTR+eKKpoYA0RsQHsda0tuYcttHRvo2Q3zhctkV/V7YbCl8x/Te9beh2c3df5BRd2E86MQ6/64uriLVKHL4mY5hiU86o1CWKCYYQjGr5VSTQvhSqry4TuIQjoeW8pVHnRPcPEhhoRKGwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7zriEsaYdyXREHOXWcGmdifuIntqOvE1PgJ+M6X0sAY=;
 b=TnbCoMoebnH8t3zyDj1zQO0BXE0fER5g3eKA4lc9b+4SdHX2YjRtklnbqFw/Q/cDMP1ZDjELCQ6fFfWWZXceM5atS099q7fjKNKV9LZtUiLzmt04X3uBVJ8i1rp++K30rZubKwzKln+XfBgKwc9K6XfeVclDZxJMRWp0UcRbg3GaQZrDeYpjgKgDMUvaHhxA8xhCI1RQb6qg8jCzfhZw3DBAXtofqbTT8QVuBDi5Zy39fhLAY/QT51MoV52folF1Hmpk1hQyURk1Ty9P1tvnA+Q9GQj1p6ATH9TIg3AMX2PAdzZQdOlWFYQKFPcUc3UAYkYEky/C3uqwgtQUmP4L0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by CH3PR11MB8751.namprd11.prod.outlook.com (2603:10b6:610:1c1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 09:15:13 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 09:15:12 +0000
Message-ID: <b544d516-23c4-4e75-b69d-2be80fd5cd12@intel.com>
Date: Mon, 19 Jan 2026 11:15:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] i3c: mipi-i3c-hci: Add optional System Suspend
 support
To: =?UTF-8?Q?David_Nystr=C3=B6m?= <david.nystrom@est.tech>
CC: <alexandre.belloni@bootlin.com>, <Frank.Li@nxp.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, <linux-i3c@lists.infradead.org>
References: <20260116151237.96721-1-adrian.hunter@intel.com>
 <20260116151237.96721-3-adrian.hunter@intel.com>
 <fd311803-94bf-2f24-8941-3285a7358e1c@est.tech>
 <3fa52ab5-a1d1-4ca0-ace0-efdb0ed9e32c@intel.com>
 <0a77c157-0825-bd8c-2248-a27a964534ed@est.tech>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <0a77c157-0825-bd8c-2248-a27a964534ed@est.tech>
X-ClientProxiedBy: DU2P251CA0019.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:10:230::26) To DS0PR11MB7215.namprd11.prod.outlook.com
 (2603:10b6:8:13a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|CH3PR11MB8751:EE_
X-MS-Office365-Filtering-Correlation-Id: 87b6a472-2a3c-431e-6481-08de573b3fe6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UndNNGNCSWxlWHZZKzlMS1F1WmFVcS8rMWdxdS9YRUlpTUxxbklwUDVhSkVp?=
 =?utf-8?B?WWhiSU9nNVZuSkM5UjV4cS9RaERyT0VYQ3RBUjYxWVFxbE04SzMrbE95N0lr?=
 =?utf-8?B?ajVVRXpMZEp2THNMYVQ3THdyQmtrMm9Bbm96My92WlNPYzU3NmU1bCtjNmF2?=
 =?utf-8?B?TlFzL1NUbWNmVzkybDFQWlRDUjhTVWE0V3JlWjlwcGVLaVVVSUNKSktZWkVs?=
 =?utf-8?B?L1RqMHFpRTdkT2lPMFZIZzVicVU0R0VDa24zeVVBb1YxVkxIRFJxTFQvVU9X?=
 =?utf-8?B?bzQwcU01WlhuU2pjQ09YdlFZdVpuOGE1VWRiTVNBVEdka2tDempTRlg2NHRK?=
 =?utf-8?B?TERPSHN3M2llY21xMXNzVHJiS2RtU1c2TTRGM2RaN1lmTWlLaWN1a1dTTzlO?=
 =?utf-8?B?aFBUVTBmZDkwc01FNk0weHdyd0xuTlVCdUxBNUhEa0dMNjlQa3dKQmZXSHNi?=
 =?utf-8?B?Yzk2VGwxQ2lXS3lxaHFOYUxYOFpBRmY2VVpHcFVnNG9YVjNBdzJQZmZnbDNO?=
 =?utf-8?B?UjAvZFZ2M2ZOa1E2ZEZ4ZXg4enB3TUhWN2Q1MUxsVXVUVTQ2ODRraGlvSGFw?=
 =?utf-8?B?dndaeE1MUkRlOTdmL2JkcXFUUG1qS2lZRkNkblVNNlpkRi83UUU4L2Fjd3NN?=
 =?utf-8?B?Qlp2Z3BBR0ozZVl2VW9pUHA1Q09MN3ZXZk5ZV0ZjK0IyQ2NjTERacVV3UGdY?=
 =?utf-8?B?N2ZVVUN4K25YYkRXYlFTc2JZODdJS0N2NTkrMG50eE1wVC9zM0wwTXBCbTNj?=
 =?utf-8?B?dnFSUzJUcXFackZXak54Qmc5YllGNFIyVkNydER3UjBJWUtKZXVEaUx3RzlX?=
 =?utf-8?B?dUtZL2hoWCtEVG42cU1aTUpBdmJ0QVUwWjN2U2hpNmdPSjFmbGNlaW9MUzdY?=
 =?utf-8?B?b1I4TUVKYjYvaEE0NlFvcW82UlR5ZEpKVFlOaXNNZFBvY1E5MXM3OEZUL2Mx?=
 =?utf-8?B?SUZBeUcwT1g2cjBCNFpkQll3VHU0VnAyVmZrUHI2ZmlyVkxkcU9YRnlKelBl?=
 =?utf-8?B?VTVlcWdEZjhWb1E3RG91VUZmdUdjOGxITEhaVnFINTFOSUR3aHNVZEJYT1NZ?=
 =?utf-8?B?UTZqcG1KcHJRVGh4UTUyUEdjWmkxb3BvMVlYdTVRdmwzcUx4eW5wa1BvNWlu?=
 =?utf-8?B?TFFZSWJZcm9lOEJoZVQzK1phMEEvYXlLemQwS3JyTkpjaXhEVWRMa0RsRllp?=
 =?utf-8?B?Q3htTHc4Rm9TeTExSThBekx5QndxUlNCZU9kZU93bmQwLytWaGcrSlBmc1FV?=
 =?utf-8?B?T213Nk0wOWNuVXlMUkV2WERYbXltb2pjQWV1dVdmTG9FQkZqWDBSRjkwM1d1?=
 =?utf-8?B?dXNDMkNNNGh2RUFFOFdtUTBRZnUvdkhLdkdxOURiK3U1VHl4NVVJTTU5N2lM?=
 =?utf-8?B?b3k5Y3BxRlNDd0F3cXRoMDdoT1EzaktPWTBuWlpweFpXSjRSMmVOckxBSWp2?=
 =?utf-8?B?WlQ3MVZzbXYrWS8rK2NSdjRDa0FLQmQ2V2x5V0VNaHFuZnhMUXFYOGNScWxq?=
 =?utf-8?B?MEl6dFRPNUhQby85ME5XRjlHRUlpZ1h3dHhadmZya2xQVjNCOWtlYTdXSEoy?=
 =?utf-8?B?R0pNU20wZkV6RXBxSkJDWTE4OVZFd0laZGlybGpwQmFaa0paZmkxaGFuSmpi?=
 =?utf-8?B?UXZmZUp5bHBxWStMc09pZVU1cklqNlNBTmZLUG5oS3crWi9MUEtLMmF5SXZn?=
 =?utf-8?B?OHNISUNmcHJBcFBwS0F3a3dOYk1yQ3RlK2lScjl3RUhReGswYVlSblpDTVg4?=
 =?utf-8?B?dHA3U3dpcSs2dFJndnNFdVRJZHpVczJ1dWZjaTdmRzZmc2FnYzJIWExiNUx5?=
 =?utf-8?B?TGJHcG1nSlByb21YVHhzOTFyd2YvYjZPeis1cGVRM2E5bGZJclJQcTl3WDht?=
 =?utf-8?B?OTFLendFcjZLUDY4TzhoYnNCdG1Ld1NiRm9RWERWSG5CZUkrQjFEbDJLMVFl?=
 =?utf-8?B?NjFjakt4L1gxVndaaWY3RHpDa1AraVlFNTlkZ0RlRHBWUVVQUHFEMGFPbTIr?=
 =?utf-8?B?TmprNXpId3l6UTZlOUJtOUJJTGkwajZ4VkhzMXYrSkQ1UlFHeE1NNUJEM0NI?=
 =?utf-8?B?c2JMdGN6WnhPU3c3OFNQUm9Vcyt6NlFYWTc2aFhXaGo4OFlFTkk4USt5SzBa?=
 =?utf-8?Q?DKsc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3VScGRuMmtLT2duaU5nVTlXUnArQlN2UTk0WkNSY2RJVXRRSmV5VmI1RnNN?=
 =?utf-8?B?T0VpVGo5Vml5eWtJVW1TTVVKOFdDY0VDTDJ3ZENoajJQSWJ0TVdqQmJYUFNx?=
 =?utf-8?B?WjEwcDB6clVDdGpJZTFpdmdOWUM0cXJmRytweUVLbzE3dThKNTd6QWd6ZGdY?=
 =?utf-8?B?ZksvVUg1TDBGTHB0NTl0RW9MdTBsa3VhaHh5dFhzYjNpYldVQ1JwMWYxUGFw?=
 =?utf-8?B?Ukd6RmloU3pRU0I3QXVON0hDdytIeXNlQk5rS0JPRURiWUZjQ1JMNmJFT0hJ?=
 =?utf-8?B?bWx1Z0dlS0N3RVVpNEw3MlRaVUhlQnE3U0FYb0dRRldBMEdlTzRIVjZqSzVh?=
 =?utf-8?B?K1lveGVSQi9GZG9uWHJ6a0xsa0l0NFg2cENaZlYyeGVXTitHVVVuQlFURDE2?=
 =?utf-8?B?U3lVcUkwRndCYU5DQjZ5WTVGNGhJS05XNUVEd3ZMZFVvVGZCSzExb05UanZO?=
 =?utf-8?B?OUx5MHJaZnlwUHl2akRZKzF2RjQ0Z3UydE0ra1d6elc4N0JteU5yTThkR2lD?=
 =?utf-8?B?RkhmTTVQNG1KQTJ3ZU9DMzJZdkpFSFBqSjBGZlFNOVN0RnNRcDh0S1NROGZ6?=
 =?utf-8?B?c1Z5ZnJqdU5SM1FBS1lKV0hsOXNkcVcxekhydktZZ3BXV1J6ODFiOHlYUXRa?=
 =?utf-8?B?Z0hjL3RVMWY0R1plMUFDcjZFUFdnM0xLRUFoQTZGMHZRZUpTd21WcXI2Q2hC?=
 =?utf-8?B?Ynk3VlNwNXhUdUs0U2RHUmhheFl1NGFSLzZaaVBJRklQTFQxbGU4WXJHaHBT?=
 =?utf-8?B?MXZDNDhHckVVRUtFOWk3NDZOaS9zbzliQmFxVFlMa0wxZ0FLQVFZZmRHaTZE?=
 =?utf-8?B?aTFId0VCYVF3LzRJWFBRUkpGRHFzUTNsR3dzeTluaSsyeE5XQzM4VS9oYjZT?=
 =?utf-8?B?a0xyT3ZpbEg4SERhbldDb1N2Tzdxc1g4YUV4YlhoZVllcHIzRlUzV0ZsYkww?=
 =?utf-8?B?L2p2UG5GQ2haMlhHM0p4YnYwaHpZQi9EZW1FWHhvVHYrYkpUSlZ2V0svVGdq?=
 =?utf-8?B?c0IxeVg3UmtsdG5jWEJ3SUMxRnFPK0Rub1A0bm5vbEZDalFBYjBkVWJBcGp1?=
 =?utf-8?B?V2lkcG5PZGxVQVpmSjZ2V1JROFRqRmVZUmhreXoxWnhrWjArWGJRL090ZXhj?=
 =?utf-8?B?V1BZWlJpMlhUKzBoTGRlYUJKTVVPL3JPaGU2MCtDMVNHOWtKbGYvZG1ScHVs?=
 =?utf-8?B?Wk03UHJEWEx0UlVpUUhvVm1UbU1EY3NJWFkvYXlSYzRQTnVYNlBkOUN5ZGVS?=
 =?utf-8?B?em94bENkRjcyc0d2OEJWRHllYXV2aU1NV0x4T3ZNSElna3lCNk8rdHp6OEhl?=
 =?utf-8?B?UGRLeTdUYkc3WFpibktleVp6RncxeDJid2RoM2NRYlN4QVVHemZ5U1c3M3hh?=
 =?utf-8?B?RWswVVZ1ZlJ4UCtZbzgrK0N6Tmd3aDFqaThGSnJ4aVM0Y01BS0x1a1FTRS9z?=
 =?utf-8?B?THZFeGlyRUR6ZmxLS2ZNWnJHZTJ0MWxJL2xzWTNxSGdtSTYwVGtVV3Ywb3A3?=
 =?utf-8?B?akMxYmsxdHpMUndMK1AvUm52b1pwcHhoVWNWbjFBSDVEaEg4TEthT1pRZDZQ?=
 =?utf-8?B?NkRHVktJam55dnV5RjMvanA1VzhmVjRDenloQ280Q092cTk4NUR0K3ZXenhv?=
 =?utf-8?B?QXBuRHJCNUlTbEZNeS9Ea1JHUFE3dFMxQXZkOE15VFVIOEY2c1ZCVFUxSGF0?=
 =?utf-8?B?eUtNTis1dEV1WXF4M3VSbTRiRGpHdzhCdWdobXU0VVZmeVY5SWp3OVZRbjVn?=
 =?utf-8?B?dTVoejg5SStJYy9Va2t0ekZZMkM5bTdoeWdIQUFUcHpwWVpVU0NnU04zeWNi?=
 =?utf-8?B?UmlyTkNKQ3VzVU9vcHNQb083WU5RL04wSyt4eWNOa0c0KzZ4eFpJTmZzVUNo?=
 =?utf-8?B?ZzZYYWFSaVdSbHlId2VKVUk4VE1TaXB5ZEN3SUJrTXhYRzRLR0pXaTdWLzEw?=
 =?utf-8?B?SjFVdGt3ci9OemNnS0NOY1F6MjdtSE04c3dVUXFEKzJjeHkvbkNnZS9CVTFi?=
 =?utf-8?B?RVJwNEVhZ2NiZmMyZjRnMWNUeGFSdGhlRlRyZjMzOXByTEhXT0lOZUpxTW1l?=
 =?utf-8?B?Yjl3R01tNXphK1dodTdtaDVQN2hwN3JlcXJ3VVBiKzUwMk1HMDMybDZVZ0lV?=
 =?utf-8?B?Y0xJT1ZhYVF0a1JjL09tV3FlUUV4UklZeU5Wd1BVQTQrVXh1V2ZhNmRnZU5m?=
 =?utf-8?B?L3FqbTRRNDg1UVc1aFF6MDNCeUZwYUg1ZG8xV1FVbmJHa3ZOY204Y3liTSt2?=
 =?utf-8?B?NUMyMnFFdWdhNnFHd3RDeG0zSTVqcTVIc3BKSDJDaDJBeTA2WjJST1B6eGg2?=
 =?utf-8?B?bnIwTm1rN1haVEpzL0ZGbXFPYUlJT3dobWNSd2p3eDdveEhxOThwdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 87b6a472-2a3c-431e-6481-08de573b3fe6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7215.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 09:15:12.7975
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VN8w510nkG1PL4l1AfGKf1R0QZ16UGHNj3Yk6eE7HMh0QMRHRWm70Ac949y0xxIPYPVlzBArdiWCcnSKgjY9ZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8751
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_011519_101620_9A6F9BAA 
X-CRM114-Status: GOOD (  17.60  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

T24gMTkvMDEvMjAyNiAwOTozOSwgRGF2aWQgTnlzdHLDtm0gd3JvdGU6Cj4gCj4gCj4gT24gTW9u
LCAxOSBKYW4gMjAyNiwgQWRyaWFuIEh1bnRlciB3cm90ZToKPiAKPj4gT24gMTkvMDEvMjAyNiAw
ODozMSwgRGF2aWQgTnlzdHLDtm0gd3JvdGU6Cj4+Pgo+Pj4KPj4+IE9uIEZyaSwgMTYgSmFuIDIw
MjYsIEFkcmlhbiBIdW50ZXIgd3JvdGU6Cj4+Pgo+Pj4+IEFkZCBzeXN0ZW0gc3VzcGVuZCBjYWxs
YmFja3MuwqAgSW1wbGVtZW50IHRoZW0gYnkgZm9yY2luZyBydW50aW1lIFBNLgo+Pj4+IENvbnNl
cXVlbnRseSBiYWlsIG91dCBpZiBSdW50aW1lIFBNIGlzIG5vdCBhbGxvd2VkLgo+Pj4+Cj4+Pj4g
T24gcmVzdW1lIGZyb20gU3lzdGVtIFN1c3BlbmQgKHN1c3BlbmQgdG8gUkFNKSwgcmVydW4gRHlu
YW1pYyBBZGRyZXNzCj4+Pj4gQXNzaWdubWVudCB0byByZXN0b3JlIGFkZHJlc3NlcyBmb3IgZGV2
aWNlcyB0aGF0IG1heSBoYXZlIGxvc3QgcG93ZXIuCj4+Pj4KPj4+PiBPbiByZXN1bWUgZnJvbSBT
eXN0ZW0gSGliZXJuYXRpb24gKHN1c3BlbmQgdG8gZGlzayksIHVzZSB0aGUgbmV3Cj4+Pj4gaTNj
X21hc3Rlcl9yZXN0b3JlX2RhYSgpIGhlbHBlciB3aGljaCBhZGRpdGlvbmFsbHkgaGFuZGxlcyB0
aGUgY2FzZSB3aGVyZQo+Pj4+IGRldmljZXMgYXJlIGFzc2lnbmVkIGRpZmZlcmVudCBkeW5hbWlj
IGFkZHJlc3NlcyBhZnRlciBhIGhpYmVybmF0aW9uIGJvb3QuCj4+Pgo+Pj4gV2h5IGRvIHlvdSBt
YWtlIHRoaXMgZGlzdGluY3Rpb24gPwo+Pj4gUlNUREFBK0RBQSBkdXJpbmcgYm9vdCBpcyBtb3Rp
dmF0ZWQgYnkgdGhhdCB1Ym9vdCBtaWdodCBoYXZlIGFzc2lnbmVkIGFkZHJlc3Nlcy4KPj4+IFdo
eSB3b3VsZCB3ZSBuZWVkIHRvIGJlaGF2ZSBkaWZmZXJlbnRseSBpbiBzdXNwZW5kIGFuZCBzdXNw
ZW5kLXRvLWRpc2s/Cj4+Cj4+IEJlY2F1c2UsIGluIHRoZSBjYXNlIG9mIHN1c3BlbmQtdG8tZGlz
aywgdGhlcmUgaXMgYSBjb21wbGV0ZQo+PiBib290IHByb2Nlc3MgaW4gYmV0d2Vlbi4KPj4KPj4+
IEl0cyBmYWlyIHRvIGFzc3VtZSB0aGF0IEkzQyBkZXZpY2VzIG1pZ2h0IGhhdmUgYmVlbiBwb3dl
cmVkIG9mZiBpbiBzdXNwZW5kIHRvbywgcmlnaHQgPwo+Pgo+PiBIaWJlcm5hdGlvbiBpcyBxdWl0
ZSBkaWZmZXJlbnQuwqAgQnJpZWZseToKPj4KPj4gRW50cnkKPj4gwqDCoMKgwqBvcHMtPmZyZWV6
ZQo+PiDCoMKgwqDCoGNyZWF0ZSBpbWFnZQo+PiDCoMKgwqDCoG9wcy0+dGhhdwo+PiDCoMKgwqDC
oHdyaXRlIGltYWdlCj4+IMKgwqDCoMKgb3BzLT5wb3dlcm9mZgo+Pgo+PiBFeGl0Cj4+IMKgwqDC
oMKgYm9vdMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPC0gYWRkcmVzcyBhc3NpZ25tZW50IG5vdCBn
dWFyYW50ZWVkIHRvIGJlIHRoZSBzYW1lIGFzIHByZXZpb3VzIGJvb3QKPj4gwqDCoMKgwqBvcHMt
PmZyZWV6ZQo+PiDCoMKgwqDCoHJlc3RvcmUgaW1hZ2UKPj4gwqDCoMKgwqBvcHMtPnJlc3RvcmXC
oMKgwqDCoMKgwqDCoCA8LSBkZWFsIHdpdGggSTNDIGRldmljZXMgdGhhdCBtYXkgaGF2ZSBkaWZm
ZXJlbnQgYWRkcmVzc2VzCj4gCj4gT0ssIHNvIGJvb3Rsb2FkZXIgbWlnaHQgaGF2ZSBtZXNzZWQg
dGhpbmdzIHVwIGZvciB1cyBhZ2Fpbi4KCk5vLCBpdCBpcyB0aGUga2VybmVsIHRoYXQgY2Fubm90
IGd1YXJhbnRlZSB0aGF0IGFuIEkzQyBkZXZpY2UKd2lsbCBoYXZlIHRoZSBzYW1lIGR5bmFtaWMg
YWRkcmVzcyBmcm9tIG9uZSBib290IHRvIHRoZSBuZXh0LgpHZW5lcmFsbHksIHRoZSBzYW1lIGFk
ZHJlc3Mgd2lsbCBiZSBhc3NpZ25lZC4gIEhvd2V2ZXIgdGhlCmNhc2UgSSBoYXZlIGV4cGVyaWVu
Y2VkIGlzIHRoZSBmaXJzdCBJM0MgZGV2aWNlIGRvZXMgbm90IGNvbWUKYmFjayBhZnRlciBoaWJl
cm5hdGlvbiwgYW5kIGFsbCB0aGUgc3Vic2VxdWVudCBkZXZpY2VzIGFyZSBnaXZlbgpkaWZmZXJl
bnQgYWRkcmVzc2VzLCBhbmQgdGhlbiBub25lIG9mIHRoZW0gd29yay4KCj4gVGhhbmtzIGZvciBl
bGFib3JhdGluZy4KPiAKPj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogQWRyaWFuIEh1bnRlciA8YWRy
aWFuLmh1bnRlckBpbnRlbC5jb20+Cj4+Pj4gLS0tCj4+Pj4gZHJpdmVycy9pM2MvbWFzdGVyL21p
cGktaTNjLWhjaS9jb3JlLmMgfCA1MyArKysrKysrKysrKysrKysrKysrKysrKysrKwo+Pj4+IDEg
ZmlsZSBjaGFuZ2VkLCA1MyBpbnNlcnRpb25zKCspCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9jb3JlLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIv
bWlwaS1pM2MtaGNpL2NvcmUuYwo+Pj4+IGluZGV4IDAyYzVhMTMzZTMyOS4uYjk3MmQ4YmM4MWU2
IDEwMDY0NAo+Pj4+IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci9taXBpLWkzYy1oY2kvY29yZS5j
Cj4+Pj4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9jb3JlLmMKPj4+PiBA
QCAtNzY5LDYgKzc2OSw1MyBAQCBzdGF0aWMgaW50IGkzY19oY2lfcnVudGltZV9yZXN1bWUoc3Ry
dWN0IGRldmljZSAqZGV2KQo+Pj4+IMKgwqDCoMKgcmV0dXJuIDA7Cj4+Pj4gfQo+Pj4+Cj4+Pj4g
K3N0YXRpYyBpbnQgaTNjX2hjaV9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikKPj4+PiArewo+
Pj4+ICvCoMKgwqAgc3RydWN0IGkzY19oY2kgKmhjaSA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwo+
Pj4+ICsKPj4+PiArwqDCoMKgIGlmICghKGhjaS0+cXVpcmtzICYgSENJX1FVSVJLX1JQTV9BTExP
V0VEKSkKPj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDA7Cj4+Pj4gKwo+Pj4+ICvCoMKgwqAg
cmV0dXJuIHBtX3J1bnRpbWVfZm9yY2Vfc3VzcGVuZChkZXYpOwo+Pj4+ICt9Cj4+Pj4gKwo+Pj4+
ICtzdGF0aWMgaW50IGkzY19oY2lfcmVzdW1lX2NvbW1vbihzdHJ1Y3QgZGV2aWNlICpkZXYsIGJv
b2wgcmVzdG9yZSkKPj4+PiArewo+Pj4+ICvCoMKgwqAgc3RydWN0IGkzY19oY2kgKmhjaSA9IGRl
dl9nZXRfZHJ2ZGF0YShkZXYpOwo+Pj4+ICvCoMKgwqAgaW50IHJldDsKPj4+PiArCj4+Pj4gK8Kg
wqDCoCBpZiAoIShoY2ktPnF1aXJrcyAmIEhDSV9RVUlSS19SUE1fQUxMT1dFRCkpCj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgIHJldHVybiAwOwo+Pj4+ICsKPj4+PiArwqDCoMKgIHJldCA9IHBtX3J1bnRp
bWVfZm9yY2VfcmVzdW1lKGRldik7Cj4+Pj4gK8KgwqDCoCBpZiAocmV0KQo+Pj4+ICvCoMKgwqDC
oMKgwqDCoCByZXR1cm4gcmV0Owo+Pj4+ICsKPj4+PiArwqDCoMKgIGlmIChyZXN0b3JlKQo+Pj4+
ICvCoMKgwqDCoMKgwqDCoCByZXQgPSBpM2NfbWFzdGVyX3Jlc3RvcmVfZGFhKCZoY2ktPm1hc3Rl
cik7Cj4+Pj4gK8KgwqDCoCBlbHNlCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldCA9IGkzY19tYXN0
ZXJfZG9fZGFhKCZoY2ktPm1hc3Rlcik7Cj4+Pj4gKwo+Pj4+ICvCoMKgwqAgaWYgKHJldCkKPj4+
PiArwqDCoMKgwqDCoMKgwqAgZGV2X2VycihkZXYsICJEeW5hbWljIEFkZHJlc3MgQXNzaWdubWVu
dCBmYWlsZWQgb24gcmVzdW1lLCBlcnJvciAlZFxuIiwgcmV0KTsKPj4+PiArCj4+Pj4gK8KgwqDC
oCAvKgo+Pj4+ICvCoMKgwqDCoCAqIEkzQyBkZXZpY2VzIG1heSBoYXZlIHJldGFpbmVkIHRoZWly
IGR5bmFtaWMgYWRkcmVzcyBhbnl3YXkuIERvIG5vdAo+Pj4+ICvCoMKgwqDCoCAqIGZhaWwgdGhl
IHJlc3VtZSBiZWNhdXNlIG9mIERBQSBlcnJvci4KPj4+PiArwqDCoMKgwqAgKi8KPj4+PiArwqDC
oMKgIHJldHVybiAwOwo+Pj4+ICt9Cj4+Pj4gKwo+Pj4+ICtzdGF0aWMgaW50IGkzY19oY2lfcmVz
dW1lKHN0cnVjdCBkZXZpY2UgKmRldikKPj4+PiArewo+Pj4+ICvCoMKgwqAgcmV0dXJuIGkzY19o
Y2lfcmVzdW1lX2NvbW1vbihkZXYsIGZhbHNlKTsKPj4+PiArfQo+Pj4+ICsKPj4+PiArc3RhdGlj
IGludCBpM2NfaGNpX3Jlc3RvcmUoc3RydWN0IGRldmljZSAqZGV2KQo+Pj4+ICt7Cj4+Pj4gK8Kg
wqDCoCByZXR1cm4gaTNjX2hjaV9yZXN1bWVfY29tbW9uKGRldiwgdHJ1ZSk7Cj4+Pj4gK30KPj4+
PiArCj4+Pj4gI2RlZmluZSBERUZBVUxUX0FVVE9TVVNQRU5EX0RFTEFZX01TIDEwMDAKPj4+Pgo+
Pj4+IHN0YXRpYyB2b2lkIGkzY19oY2lfcnBtX2VuYWJsZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4+
Pj4gQEAgLTk0NSw2ICs5OTIsMTIgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2VfaWQgaTNjX2hjaV9kcml2ZXJfaWRzW10gPSB7Cj4+Pj4gTU9EVUxFX0RFVklDRV9UQUJMRShw
bGF0Zm9ybSwgaTNjX2hjaV9kcml2ZXJfaWRzKTsKPj4+Pgo+Pj4+IHN0YXRpYyBjb25zdCBzdHJ1
Y3QgZGV2X3BtX29wcyBpM2NfaGNpX3BtX29wcyA9IHsKPj4+PiArwqDCoMKgIC5zdXNwZW5kwqAg
PSBwbV9zbGVlcF9wdHIoaTNjX2hjaV9zdXNwZW5kKSwKPj4+PiArwqDCoMKgIC5yZXN1bWXCoMKg
ID0gcG1fc2xlZXBfcHRyKGkzY19oY2lfcmVzdW1lKSwKPj4+PiArwqDCoMKgIC5mcmVlemXCoMKg
ID0gcG1fc2xlZXBfcHRyKGkzY19oY2lfc3VzcGVuZCksCj4+Pj4gK8KgwqDCoCAudGhhd8KgwqDC
oMKgID0gcG1fc2xlZXBfcHRyKGkzY19oY2lfcmVzdW1lKSwKPj4+PiArwqDCoMKgIC5wb3dlcm9m
ZiA9IHBtX3NsZWVwX3B0cihpM2NfaGNpX3N1c3BlbmQpLAo+Pj4+ICvCoMKgwqAgLnJlc3RvcmXC
oCA9IHBtX3NsZWVwX3B0cihpM2NfaGNpX3Jlc3RvcmUpLAo+Pj4+IMKgwqDCoMKgUlVOVElNRV9Q
TV9PUFMoaTNjX2hjaV9ydW50aW1lX3N1c3BlbmQsIGkzY19oY2lfcnVudGltZV9yZXN1bWUsIE5V
TEwpCj4+Pj4gfTsKPj4+Pgo+Pj4+IC0twqAKPj4+PiAyLjUxLjAKPj4+Pgo+Pj4+Cj4+Pj4gLS3C
oAo+Pj4+IGxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKPj4+PiBsaW51eC1pM2NAbGlzdHMuaW5mcmFk
ZWFkLm9yZwo+Pj4+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtaTNjCj4+Pj4KPj4KPj4KPj4gLS3CoAo+PiBsaW51eC1pM2MgbWFpbGluZyBsaXN0Cj4+
IGxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCj4+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCj4+CgoKLS0gCmxpbnV4LWkzYyBtYWlsaW5n
IGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
