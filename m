Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3263CD6E51
	for <linux-i3c@archiver.kernel.org>; Thu, 13 Nov 2025 12:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Nz7BOo+0XqGSzjvZ0rEQsIpkAM7KuOqQaP0EHO6OOtU=; b=uHPkh8GYJHpNc6pHd+gNWjZ5KX
	p8EXKYX3nsFk1QTqUwy9vuqJ4tlqLN54/NijP3f4Vl0D2X3tKUdYWfkTzltRMMSvrBuEGKPEGy1Xn
	a/+ycyS1Mq7nWJt2fH+sDLDqKmoxR2KcpuGi2TZsgnjIgkF/3dGz5SzRY+lgNXNd1GXzsxTmci8kO
	YrKRQu29K1HI8NiLl8RVmm6CAt1ePGrw57g39VCIHx2zOgZCsrehC9EDhq3UDRmH5PT/osECeugBI
	vRRJoV1uwppk9C6QTjX2SZ/zxF3afFSRGM686wM7o1BX/Tm4kkX4FmKG5tKvwiB+4fDf5Nm0cE4r4
	TkUxCeFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJWu4-0000000AVJS-1ZzV;
	Thu, 13 Nov 2025 12:58:20 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJWu1-0000000AVJ1-34Oh
	for linux-i3c@lists.infradead.org;
	Thu, 13 Nov 2025 12:58:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763038698; x=1794574698;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=LYkEUvawZ9/vSBWmqPfr8et/S7j/hczlJ5n5wAwC7ZA=;
  b=A82QYTqxx2/f3wnrDy104ql4DiR5/LoOJwLUMPoCOXNT5EOcZw9yRWuU
   uqQJ3DF8RNRlf4+u3ak6mA30gGBVf+zMfZOVZiJEa6GLrPLh7m+u9st+d
   zhlfc5Sb8DXkmkwOHdmzuGL36+QiHoJFFClgALwXaGTZOPTlXpSPg8r0t
   FF/O49WSm7CBrcSOrWCXwEXiQ3dXB621BwPBB2FjUa+Oq4BrqkQAXGYkR
   4M2LbpQ3nofAIvgH1nQDCO7livowOEfa4O5B2pJQENpEDclCyA70RJkcQ
   Lyv6sgHHAboWKnbvLY0rsHkSmNhPQH8fHTqF+Z+8T12CRDNpvDD6mXKs+
   Q==;
X-CSE-ConnectionGUID: gxsMwG0xT7Ou84Iwg0HhRg==
X-CSE-MsgGUID: GipRz9ZLRn6IhDZyLB0xQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="76576793"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="76576793"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 04:58:16 -0800
X-CSE-ConnectionGUID: fxzayExmQpGMmJwSorO6Qg==
X-CSE-MsgGUID: lp4raiJ4SOqHXB84POrU9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="193742229"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 04:58:15 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 04:58:14 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 13 Nov 2025 04:58:14 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.44) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 04:58:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n5JynvxPXFEMyD3LuybB3M24Hth0ixOap5ajzeb/OtYNUlOs0/EOv1FcO6mLUp8BOrOSjVbLbSPcgyo9nwhjHB77jDsK4MzZN+9ZKmtKnn1wUNXM3CLv3JCQBZWLLnxSBEv1/3KVXMqyBma+DmOws/+AKb/WifGwnPKE7oZ/Z9dsvTQq1di3kaBeFNNc+qkaPQABq4TvxOfEJBzYwN9IuDYjMXPU/xKwW2S9dxKyn4eVmyHg6o7v0nJJyTp2QXMA35wEkXbDuY8PLGkKCwU6vfC/OxFFxqAHpmJQcHDxxN5OQsfdp0vjOZACdDtrdY6dTaMIyENFQTVxtdozgRETmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6mDkb94Nzqqf3FEwiNN5biAQAAkk25tAtRNkmyNk9R0=;
 b=VRk/HWmzMd8uSPus0IFRexjqnj1rhxZGoKivk9NykZKfk0dwJAoHntn6oDb2SInvpnQEJJP16Qk+XmMC7NjOC3O3uL/cEXWs9VQ/54mdKbBvFq9xDfTO692rwxJdWDEq7KURloSiS6pnn8D1PafHT6CBmVl9rTLSMg8X472YSzFmL0JJGJaf5hfN9QgW/xMxm8tAg6QI19cUOv4cqhf/+FW138czc14E6ULR3TIi3R3VqfgwFubPAEyJhn6CexJm8PS4Dr5a/DNK/zes51YnBB0uQq4ekKM1AoJcLP1UUJUO6bBXyv8EzdNEwG74edxiGB+KOpVb2rsTXrm2m/gCnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by DM4PR11MB6407.namprd11.prod.outlook.com (2603:10b6:8:b4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Thu, 13 Nov
 2025 12:58:12 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::eeac:69b0:1990:4905]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::eeac:69b0:1990:4905%7]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 12:58:12 +0000
Message-ID: <8291aa38-c4a0-41ee-8487-73e657c901c9@intel.com>
Date: Thu, 13 Nov 2025 14:58:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/13] i3c: mipi-i3c-hci-pci: Move all Intel-related
 definitions together
To: Frank Li <Frank.li@nxp.com>
CC: <alexandre.belloni@bootlin.com>, <linux-i3c@lists.infradead.org>
References: <20251112100339.51726-1-adrian.hunter@intel.com>
 <20251112100339.51726-3-adrian.hunter@intel.com>
 <aRStbZ082OGTc9mz@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <aRStbZ082OGTc9mz@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: DUZPR01CA0165.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::6) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|DM4PR11MB6407:EE_
X-MS-Office365-Filtering-Correlation-Id: 27e9cf59-4776-4e25-f9ae-08de22b44d44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M1FMUkYvdjNRdEl3QzNRbGtleFNEcjhlUGVXNFVhMW5Sdkt5UnZmTlc5d01k?=
 =?utf-8?B?ZzF0ckxWNllldzA0ZGhRVGVJRWJVREkvdzVWUGxUQXVxbUE5Z1NGclpZa1ow?=
 =?utf-8?B?VmROTm54QnFNZ3NKSkNIQWZrRUl6U1JwelJtYmJtZ2lhM2h2UzVsMEViQkVz?=
 =?utf-8?B?SHJveXQzOE9oT1h2ajNJMHZEV1lxRE1nbEovVExYNi9pTElGbjNTeEhDRERq?=
 =?utf-8?B?VjFTVWNxa2U2dWttRVZSQXVhWGYxNVd4NnJKbVU5MXFOVTdiRlhJeVl4ai9O?=
 =?utf-8?B?VVhlYzdlM1JXOUFWeXNWazl5L0N6bEpqTkttV0pNTnpneEJob3lNei82UW5N?=
 =?utf-8?B?YmxObWJGa3NJc3I2RmVQYzB3cGhidjNhU0gyd1BTVzlWeE9uZU5USnZjVUFO?=
 =?utf-8?B?UDVnZmpsVEE2dDl6RWJUcldydFJCSVE5UXNSbUtweExySWVVQURiUnJ3Yk50?=
 =?utf-8?B?bzJ6NjVmcHV4d0JuVUNBUDM3TUc2VmpHRG83c014VTg1bHVrU0ZZUkhSZnJv?=
 =?utf-8?B?YkVUakQvWWpYRm9zM0p1NXhYU1F0eE9Jby9MejBnbVNzenVGU1VMcnI5S3gy?=
 =?utf-8?B?a3hlU3ZZMHVyc1BBbVhxY1liNUc3V2I4cGxoR2JKUmhtZ2tlNHlFVHlXZUVa?=
 =?utf-8?B?aDZTVW5zV3gxMm1iUEs5ZlkwUzhVTDRkTnRvNnRKQkdDWUFnZzR3UWpTMlM4?=
 =?utf-8?B?bExXSGtVVVk0R29aK0ZYbTBUcFhoejNidGJKM3NlOHl0WmhmZGg2cWtHSmtu?=
 =?utf-8?B?eE1HeWFySVVXeVpMYXpvUmJrRnRwTWdObjYxTzRoS2I5WG5TTWlZT1dickFP?=
 =?utf-8?B?bCtPbTFLcEY2UzdPaEIvL1hIWDlUK0o5R1RuTVRQZUZ1aUtaUHcvV2NuZFVL?=
 =?utf-8?B?YU1CaCt0SE1VUHNMMmgrOWZScmxaRnI0TkVzbEwxNEdDRElrb1FMT3lsaUg4?=
 =?utf-8?B?c3pJOGxMOVkydDNxSHl1cU90OGRzdFVhVStvUlQwYTVFdEtXM2tJZjZkT1Jq?=
 =?utf-8?B?cHNnTDJoaVAyb2l3dVkyWVp5Qm8ySHBqZ1pudnJkUTBpWmt3ak1uSUo3cWJv?=
 =?utf-8?B?dDE2MzN0YjY5WGw2cEczUEl6WVBjUURRKzhBckh5Q1ErVUloZGJVdkxLSUNK?=
 =?utf-8?B?QUcyRVVMRGFSMHB4cDlQSHZlOUF1aWVWVkxsVG05WWlvSC85WmthQVBSeXly?=
 =?utf-8?B?TW5aVkJEMDkxSHp4enNoNWU3dy9YSXI4RUIzcFJkZnAvVy9JeXNuQVFKQ3Q5?=
 =?utf-8?B?TDdBSE9hZnZSQTcxMWFlZHhuMWFTemFqSEhpTW9IQ1JYT0FLWGRjY3krOUpB?=
 =?utf-8?B?aUdFa2Q3UDdQS3F5VWc5RnJkaEw1TDZBb2trcXpMV1lKN1lsUi9tZ1p0aXli?=
 =?utf-8?B?blY4QStENmdGN0hFV1E2ZGdaZ3BrK1E0dkErZURFczV0WFQ0bzNSbGVsNHhW?=
 =?utf-8?B?bDNTcmNxWVBHLy9XNWJMRHlKa0YvNElBR1VibGtIamhlQmVDRWMycThjNHQ3?=
 =?utf-8?B?TXk2b2czQkVXNlpncldMMWFuamhGWWgzOEtZUUM5ay9vWVZyOXE4YmNMVWg1?=
 =?utf-8?B?d0xCUUZGclhRbk55Z2M5bFdUbkVnQnRVWXl5eEhaMWREV3ZNZWFCR1pENlpa?=
 =?utf-8?B?N1pyN0YwNlVTTHlXTE40VDBublo1U2pDaWo4ZEtpYnBYMVVoOW8yZlVML3da?=
 =?utf-8?B?YVUrN3ZnNUswN2Z2REllNW1LUEJwTVo2amU0UHYyc2VvL1VJamV3RUNFMFJL?=
 =?utf-8?B?a1pvRTQ5R3VtT3BqdkJHTGNzU0FRNDRKUkFuemxDU0ZWK3Y1emhGeStMRlZm?=
 =?utf-8?B?cnZ2a3ZpWmtibjdKaDFaNjY3djlndnFGZkhKTzkzdndpaWlhRDVJY2FHOTg4?=
 =?utf-8?B?ejk5dWhnditsQVhPMU4zaEFUWi9NbU9LRW8vU3dNS0dlMFdyU2dtY1g3aG5l?=
 =?utf-8?Q?UxmpxGP0jDzEJgttkBY/RtT6pb8Wl55y?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NThUNzFRQUxSVGdRcy9zN3lYdE4yYmZlWjFFVEc2ZDJmWkJMdnhKRS9mdXEr?=
 =?utf-8?B?eGJFamRjN0lZSGZ4R01xRG9kam16MW83emFRQ3VCZ1l1QnYzdEZyd2NBWmNw?=
 =?utf-8?B?dVJ4YjJXVWpzbklvYlA0N2Z0UHBBaDdoVU9sUFlEU3ZiYU9lMWhlUGg5aVJ3?=
 =?utf-8?B?b0JQVWxBSmNOb09Ib0hRRWJrSklYMGpSWnp5K3ZDMHpKcmtJQ09HQkQxSGRt?=
 =?utf-8?B?RFFMM2tLdTR2YjlLUjhPK3hxb1pCVzkzU1RBd05yeFFHbUwxcFVsK3dGMVk1?=
 =?utf-8?B?VGwzT3A3cFRPNEUydVNHWkh1a2I4bXJVQXlvY21aUnQ4WkJUR0o2YkhHMWM1?=
 =?utf-8?B?NEpEaUttK1VieHVQVTRZSVEvL0VFL001ODVYY0JNWlQxREk1TjBIUTQ2THlU?=
 =?utf-8?B?QWgvVG5od2ZGcDczNTAzMEM0ZCt4TEZKR0ZpeTl2VzZ2SHI4SWN1bTRPTFBU?=
 =?utf-8?B?RU1GWGhXQUczV09Ta09PMldwb3VJSjljQWVORlppcmx2OENvYnFBL05mYVl2?=
 =?utf-8?B?NlpaNDRSMm5MTzIzdmlscnBHaHNhdzhyamhST2V1aWFTREhrcGNLbVBhMTZ1?=
 =?utf-8?B?aWs1L3JXV2JkSXY5ZGY2UFFjSEROQlRKUkxKUUtjWGJqbWdjWUd3L2JuZVFT?=
 =?utf-8?B?bEhCd2JRWE9yNTRBUW0yYndXbHUrYzFSQTZIT1dhM0dmcUpFMzJyWFRvOGJC?=
 =?utf-8?B?cURPR2FQZUxDSnl3UE5NdkFraHRUZ2NGYTA2Z0V3UmUyWnBSQjJLbm9CMUNT?=
 =?utf-8?B?cVpJN2Y3Ukp2bW1aOVNrTUEyNS9rWENHeFBuNVVzbjEzbXVxckFxRlpKWDh2?=
 =?utf-8?B?Y09nY004VCt4SFF6eWtmZXhNTEFDQ2xTY0RjcHJtbUhWZmQ0OWFpZ1B0c2pQ?=
 =?utf-8?B?ZGRpZEV4cUs3S2JoQTlWL2lWR05TSkNuVGhkQWxBeEl6K2ZvbjczeldHOUtK?=
 =?utf-8?B?UnQ3VVZEaENiamdPMXI5cGpzU0ZPQ3pYd0lvQmJLcTZKN0RKbmhiN2tqWUFV?=
 =?utf-8?B?cUdNOWhVNHVjcFAyOTBVZU10b2VuWDFuOVpweEQxVC9VZmphT09ZTmJPR2NS?=
 =?utf-8?B?SWduRmNvSjVOaTErWVhsMnczWmdSMVdTK3BZOFlIRTJwaWpYUitwWmNXS2oy?=
 =?utf-8?B?Z2VMVGZ3QkhENS9ZSUxSRTBRV0VNRGdQelE0TGx3RGFGM1RrSXROSHJxR3Jj?=
 =?utf-8?B?QU5UZFRPSDBkeUc3dXRRbWs4T0U3WXpPN0paZ2liMytqNHA3dFpsWVpxZGc2?=
 =?utf-8?B?Z0NEM3VGRzBKNm9vaTdsQmdsR3k5V2R6U0hKTmN2NG8wSnlKNDhBSmF5bnF0?=
 =?utf-8?B?K1FVWXdDbmFKTG8rd3VvUGhsKzZkZ0tvSENpRFZjUG5MTHhLK3pnS1l5d0pi?=
 =?utf-8?B?VXlnLzRpWDNlMStJZzVjZmNkaTFLUDYrZC95UnFpUjczSlpOcUZNVkZBRnNv?=
 =?utf-8?B?M2thQmVNTXNKRyt1Q2ZjT1hrbHBiekVJSjNzRHpLZkJnaU91SFlYR3IrV3Ar?=
 =?utf-8?B?cFEvV3pNR0JYTys5TysvNDEvWnd2VWtBWHJyMnVDVklxWWhSb2JaMm12akI4?=
 =?utf-8?B?U3JnM2JPUUlXYUlsRFVCcktMUGVpOXlUZkYvYWwrTGx6UU9yenVjRmdGMnZp?=
 =?utf-8?B?N0VmNjlndFZLMnZQVXJSbVk5c1luZE0ySjNhODBqSTFLMHlRZmQvSDhYWGQv?=
 =?utf-8?B?NW1DUUkwY205YUNuWkdWaG1NQ2VzL0h3VlNrbDE2OVZ3TkhqZlRvSDhRaCta?=
 =?utf-8?B?S3dhbFFVNTFpNVZMdXlXQmxvTVhwbXVVK2x0ZzBiYlV2bTNxUlBLZHUxc29K?=
 =?utf-8?B?b2JYbnd2UDlNc0RUMTNkK3lQVDZrM3pEZ2Y0UE9qUUhZcVEya3JoQmpGNERo?=
 =?utf-8?B?Q2tNYk81QlNYeWpMalpZUXBxc2dSd2dXMGZnVjA0RjE5eEkyLzNBbkNlNGZH?=
 =?utf-8?B?TjV5blFzNjhGT3RoWU11aTMyVUtMTUF2MExwdVZicUdFdEFDMzdSRm9mMXY1?=
 =?utf-8?B?aHBHZ2dxZzd0R09lYTliejR0azlNMVR1bDNlRkEzc1RpUXBnWlpvWVRQdFdh?=
 =?utf-8?B?UGNxRDYyVmE2TUtMZ2JOaVAxelVRTU5NenFxaUFLNkZnZktPeDBSUFpwam4z?=
 =?utf-8?B?Yit0TzgydzcwL3ZjMlhFZkZLeE8zc1Q3WWtWdjR6OHpXT2ZEaXk0WXhjcWtZ?=
 =?utf-8?B?NkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 27e9cf59-4776-4e25-f9ae-08de22b44d44
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 12:58:12.0995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wnF2v+LbSy/Z1p+cCBe/HwSgwNUtywYTDrAVCQB1ZNKUB08ggFbmCOKa3w/jutp6HxMYOpzaKxA9RxuyLHMtNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6407
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_045817_874524_09ED9E99 
X-CRM114-Status: GOOD (  12.05  )
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

On 12/11/2025 17:53, Frank Li wrote:
> On Wed, Nov 12, 2025 at 12:03:28PM +0200, Adrian Hunter wrote:
>> Move all Intel-related definitions together, to tidy the code slightly.
>>
>> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
>> ---
> 
> looks like not neccessary.

Sure, it is just a tidy-up.

It is confusing to have something non-Intel related in the middle
of all the Intel definitions.

> 
> Frank
> 
>>  drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
>> index 850fcec4cacf..617826628dc4 100644
>> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
>> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
>> @@ -17,14 +17,14 @@ struct mipi_i3c_hci_pci_info {
>>  	int (*init)(struct pci_dev *pci);
>>  };
>>
>> +static DEFINE_IDA(mipi_i3c_hci_pci_ida);
>> +
>>  #define INTEL_PRIV_OFFSET		0x2b0
>>  #define INTEL_PRIV_SIZE			0x28
>>  #define INTEL_PRIV_RESETS		0x04
>>  #define INTEL_PRIV_RESETS_RESET		BIT(0)
>>  #define INTEL_PRIV_RESETS_RESET_DONE	BIT(1)
>>
>> -static DEFINE_IDA(mipi_i3c_hci_pci_ida);
>> -
>>  static int mipi_i3c_hci_pci_intel_init(struct pci_dev *pci)
>>  {
>>  	unsigned long timeout;
>> --
>> 2.51.0
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
