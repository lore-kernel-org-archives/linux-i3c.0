Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB72CD4851
	for <linux-i3c@archiver.kernel.org>; Wed, 13 May 2026 05:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=VVaEV/w9onblK0zyXiKokfIG1ZFlG154djOA4AahAM4=; b=EWVniDhDAD0YmikVDsbfD1f0ig
	T2zUfu2Qowd1JYpmhIJn1niYrINa/u6NulPxqxnd7WQX0wKrEiDC3Cw8hk8hwqgNCaGqfpkV/kpXD
	Py2YGZ+EJLprTeuiGHcFwbUtEh4wiISm94bZd7MK9aa/PJyeobPuAMuQ2C3GwjMj/3NZgkfPqmP02
	eMPK7m7iQ7UI2Za12lWietdWyUcCCi2FUGgmIa8VPmkko9Frycun9thKoyVORG9qWK9IRDBDtR5L7
	a4SB20FkPwk5biKnAcB4Sxji8Dx33X1lsK6EGVscuaRPZX27/4OoMjWdbAfyJTlIhKOgLtn5ci8aD
	sI387SLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN2CV-00000001KFJ-0cUe;
	Wed, 13 May 2026 05:32:07 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN2CS-00000001KEt-3TGf
	for linux-i3c@lists.infradead.org;
	Wed, 13 May 2026 05:32:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778650325; x=1810186325;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wTWBeXVe7m4dQtvV/HQFY+YNNb07cz/y30xX3YU3ryo=;
  b=fH+a/WaRqu4mEbdsYoHgJYF//7LFGfY/GYAzL02bnHD9VsEBZ3jJKGHO
   sSqkNx62PXvVW8SDLMElgurRZWVsgqaqfuiuPO+72o/HOkhtKuBgcxKc0
   Qh8wo0iYDCJG0OalB7Zp6yq6atMY4CWlp04iadnMpmxVZdcuC1GMVs0+x
   M5yqjdsbI18VMQaYjdrLH+Dny2zOioE30TTMVhe77ND21hA+abMMatdtk
   VXAWhWa1JISDGyxZWztWLPJnz4ENum/uKiBYFlv8WUgz3dGZEdJGvcSLg
   iTKfmVmQ9wNHY+4TGtltzL8oyokgJQDGLLggw5AStzDyGVAHk1d1SCbLU
   Q==;
X-CSE-ConnectionGUID: tl62h5o0Th2EM3kTk7JeKg==
X-CSE-MsgGUID: e1EooJlWSHyjLu03QVNUSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79591893"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="79591893"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 22:32:03 -0700
X-CSE-ConnectionGUID: FUK3ZWVLRqqITbGLvxpwQw==
X-CSE-MsgGUID: 2DbdPbnySYSqYRYtveWneA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="268322708"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 22:32:04 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 12 May 2026 22:32:02 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 12 May 2026 22:32:02 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.51) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 12 May 2026 22:32:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fPQa4U2RLZTUuO9XIDakLfWlK5Mq5wMAZ0sLbPwIsD1bzd3wkln7IwfTn7N5b83z7CCys4icM4RjquXvGMMBzLj/SRA6vsiszyvckFtJzhZ1ee+S5AQ6GedTVQqZjNyNmepkD+9cRUxSFZ668ef+M7Ux96FJeTSmDQRxcGelv1zFNWp8KzgVqmY24UHLtul1WvsyKypvS7d83dQKR+RnrQNX4K+bxMzPSp58rcfzOQMsB2OF8TvAnll6pYHoCl3b1DBIYyAHhNm8aVUMpqmVLn8czezpPXUCXnAYx4xkqS7cVOBLhEWHO/KFsfGsQVo9qxkgq+1Kw6V80QsoWLa4jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kblIKXOiKyK0k1S5GlzOxTWWDH2y2ruPUV6NpKffrOs=;
 b=agJlhYYc1xRU/rfTSuF0rZelwl4FZbtERNSD54pU//0nxepdNvK36z6Hyt344ZuVQ71VabdCHgTJAfpG71Xjk8fgu9n+iwMYqkEPLN/128G/H/0dr0odRaJJyS6FrCF56RUblLNX7ONKFZjWIIDnn3iluxsJOu2v6KhKfqUHeT5I7sMNB07mdVF3J+mb1YDyC+jdsE5VkzfseYisXqgYWyjoLaZCLCszp1Tq9wzI6sS8/BHowEMH6K7ZJklRq4FuUxKge/LUEPhSjJsUo+KOCj7SLBpdIf+LMncQMCNyzLtUQsqXNHGNTqxUUCiJ48dzZxlVr7n+LaLLKS3LG5Sikw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by SA1PR11MB6805.namprd11.prod.outlook.com (2603:10b6:806:24c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 05:32:00 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.20.9891.021; Wed, 13 May 2026
 05:32:00 +0000
Message-ID: <9d2a7c42-7eb1-4de2-ac9c-c1777d7fcb13@intel.com>
Date: Wed, 13 May 2026 08:31:56 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] i3c: master: Ensure Hot-Join operations are stopped
 on shutdown
To: Frank Li <Frank.li@nxp.com>
CC: <alexandre.belloni@bootlin.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20260512121732.406009-1-adrian.hunter@intel.com>
 <20260512121732.406009-5-adrian.hunter@intel.com>
 <agNVCdZ93XwtBHjB@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <agNVCdZ93XwtBHjB@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: DU7P191CA0029.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:54e::24) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|SA1PR11MB6805:EE_
X-MS-Office365-Filtering-Correlation-Id: 38d1a878-c701-4ecf-b6e4-08deb0b0f4f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|22082099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info: tv4LMIK3xqx2F35wfISDMC9Pet4zoHI9VIsnMsfFraOuYZ1pXcrFB5dTL642KqJcnH6rqW6CJUPV9HRRnGJSgazmmzrgrNyYyvgYE+n8f+lE3olJv+5f4J4WTi/m/5WL7+ZCFsENCeKck1sZgB1udApnmsKx4K8P3ZdEFfO5kMpeLqV+hIQVoNs45Mh8bgYBt1GQC0QL35kPmBHC+SkLPHT3oEtz3rx3q+UzI49ON5Wl8n/KjiWL6AZYc+WY+cSwxvDPBhfXOsX6Qt5b715gCzaSPb03fZ9kAym+NrU/0SRgbrLwGgSrjKigrvD2gZQR85DnT5NXVzA7IAGQwAha4O+MMDha1CX4simnoqjzYz6omzqXpO01oIP049yCdEbTDlMKqUDHrO0uaK26Hxxug32o5z9Q3Uv/z6EjLpytscWJTHd/mUmWX7lFxop9CyJQlRdqtPG6lC/8XnZqNSIu+2BXC1dC3RP4NAXu9fV09LaNhLRqKG38/Ni8eJLSTo5XrIW89T3soj/CP4fawf3IfU8/N+mvFtm4Xqk5jp9vSCcljXC26r/mJqPnEl/qG8a8PcjQr7QOf8JMjftDrPnl8R6otOBzUZ1qqwWYdG69SCu3MoKRgw+OFgrHPjbbyd1atQwsZFCb3SLLI+vTkWRoZNN3IdfqZ7x3on5n2J8FBgAjnYoJDUgOqe592l7nXvlA
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(22082099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2ZrcXFES0xlMGtnMjBnQ3JWRmpLbHk3NmU0MGozaEJ1TlhZdTVnZDdJdXVC?=
 =?utf-8?B?TGtKcXNjWEg5cTcwcHZIbFRaNXFFL2RmVllObVRjbkhjUlpXRjhmV1Y5a3h1?=
 =?utf-8?B?ZS9uOW85WHlON2FlcVhjOGFlc1dKemptdEpBZ0tiTHk5b2h5blBSdlFuWE9p?=
 =?utf-8?B?TFZoWnU5TjhsRk0yRSsrWjBmVHZlRjErZDZBdVBETzRnMjVPeHhTM1JVd2hI?=
 =?utf-8?B?WGlwWitqTVB0L1JtVFRIZHhSREtSdHRqOWpkaTYrVkN5QWdRa2ducnFtQnFk?=
 =?utf-8?B?b0JKMDNjd0pFMzNZekFGeEhVZ0J1VnI1SFEyN21OOUdpZkhnbUV2bkFGMEE5?=
 =?utf-8?B?dHc5OUU3WVBOOGpqUzVyQjNCTTl4eUNnUThyU0tHRE81YUNVSWViTU9OWHJQ?=
 =?utf-8?B?M3ZubzFkbEhuRHVJTmVXcDEvU0lUbjA3ZC9ZbkE0bWczSXBSY205QktIcUtL?=
 =?utf-8?B?NkN0ZlJvTWV0K0RtbExaSnNvVCtueVZBRUFNWG44a1dPdXZ0NXozdWVLL1Z2?=
 =?utf-8?B?aFE1dWw2Z1pxNkU2cmN4Z0NheDlDRVdRc3phMHdlOGVFNENQMzREc0dON3lr?=
 =?utf-8?B?Nm5aeUtsMk9XWk5PZkd6WENRRSt1OXhsU0JLMW01NGd3WS9XVVhPMlF6VU5i?=
 =?utf-8?B?bjhTc2J6eHVqT01sTWFPVmpxUTV0RnN2TE5zYUJ5QVl6YUlvY2t1bnBlTm54?=
 =?utf-8?B?dFA0OHo0cUpQK3hnYkZEWHVubDYyTFVON2l6dWRQUGZIaVUwZE9wUy9ZSWti?=
 =?utf-8?B?NFZYdzZ0Y1ZEcGFZZTRMUVM3T0hyenpjajdZcVREcG95QjZOSGdGZktPaDVM?=
 =?utf-8?B?MEFMSHVrcTQ1SDhqOW93TUw2VjNNSUpNRTRwQ2tKQXZESmJxYzRQbW9Ld2kr?=
 =?utf-8?B?OHZObjgvalVYbzhXSy9CSTdkWElMWlB0UllkVFZXYzRvS3YyUWlzdG9qZ0ZI?=
 =?utf-8?B?VWFmZUhpdG93ZkpHTU1HenQ1RUE1cUN1K0ovM2trc2lMeXlCbUNjcmdXWXdP?=
 =?utf-8?B?VUxrUkVrRVJUT0JKMytibXd0Nk9WWXZneU9IdlMxMi9TWWcxU1FNRmpPTW1s?=
 =?utf-8?B?U0xrODVqSFhjRG9ReTRsd1dXdXc4MEFzY0xxYWlEVGsrQXExUjVyQys1MkUv?=
 =?utf-8?B?L0VCVzF4ZDlubEtJOSt5ZUIyaTJ1OUxYWjJEWTRwOHJHMy9aSnpnSFBMMU50?=
 =?utf-8?B?VDhpRXo1RFZLcGRxTWM3Y3J3R01vZkRkaCswY0RTUnl0ZU1HdHJ3Vi9sam9i?=
 =?utf-8?B?d3RvSFdHd29UcUF3K0pqcGtCSWMrbXA2c1YxZFIzUytpQ2ttMy94czhlQjdw?=
 =?utf-8?B?QVpnbm1GZnEvbjlBOFo0a21YV2w1ejdYOTNybHJuMGdwc1Y3dVQ0cUxBa1Zz?=
 =?utf-8?B?cXF6VkxMYWlMSGVmanF0WHpTeHRSZDloZ0FrdUZieFppQkNUbkg1YmhHVlVO?=
 =?utf-8?B?Y2hrMEVhenJ6b3ZXOUVRV0VSZUg0TS9KTm4vSzNCbnBaZnpYVENNSThicFZz?=
 =?utf-8?B?aUlIQTIvaVlOODA3Y1BNWmVWKzQxend3U1ozSXdYYXhVZElvUmpLUDBkbDNX?=
 =?utf-8?B?NElyMTlnKzdDNXA3MWRTWWthOVFiNDczZlBhK3RDVjdOZ01vL1BWMzVsS3k3?=
 =?utf-8?B?dkFETzRtMXowdWsyVGRlSmg1eE9yUjNwT056ZVl2VDNrWlJaOE4yNEM1MTBN?=
 =?utf-8?B?bGoxdHdvaTJCWE9OTVdiRFZXUEw4K1h6MFdqNDdGVnJNYURLL0VvRE04M2dT?=
 =?utf-8?B?WDlyK01UYVlia0ZPN0puTmhqQnBWY1YyZEFxV1ZZSG13V3B3TEN6T3JBNGFw?=
 =?utf-8?B?SWRTS2xDNWZ6bzJWbXVjUFRKQWhpK3VHSlFMWll0M2s0Tkl3dXFQN0gwakkr?=
 =?utf-8?B?T2R6aEIzdHJQWVhNa1oxMVFRSzhFNEtveTl5Z25PYzMycmh5aUdNS3ErcTBH?=
 =?utf-8?B?b1dtaU00eERBWUx4enpsa25GNjFld2xDMzgwQUFnZmQwRklJendKM1BRc2tM?=
 =?utf-8?B?bG96RjJJQ2QvN0srSjY1dFFMd2lhOExyL0c0L01IRGRlZEw4M1hUZmNuVzFJ?=
 =?utf-8?B?aHpsd2FRLzhSNVpRMm5sZ1FPY1dkQ2p3OFIrMGFIcHpYV09BanhOazVaR2VQ?=
 =?utf-8?B?UGttMGRIV2N1ekNmcUxUdllxOXhYSjNKZHRMaDBHQnQyZ1BINCtRS1RuTlhy?=
 =?utf-8?B?SWhSQjFBQkVSZWd3UGtxeitLTENiem9reEFCVzFYZFhCeEhoSlI4L0tBaDlx?=
 =?utf-8?B?b1d3L0JIdmgzekVtQnJCZS81OUZoVkJ6RGFNOTgvOFQ2Tk9maXl3djhDTDFN?=
 =?utf-8?B?bExOazVKenh0UEVWbzZVTVpuU1V4azNXeVNjNFo3QU9kUjBxV1BUakRpVEt0?=
 =?utf-8?Q?xSfmni5P2m8cF/pw=3D?=
X-Exchange-RoutingPolicyChecked: nE7oKxjwuFSgNSfB/IF3ewMjsZBpugxjy3vZYEzqtKmZsmGSveAU3nUN6yrsfvQb29D5J9jHSh2rGifsdnG4+KsEK0XGpCCg5LWMHuhb3MqOIvWy5HcmMKFfAQWEDg0yhiLYbg9rTioZPedB1MAn/vS85tfI5vt3+ji7ROfVyu84Sh5niVSzlK2ubU/ZVGDvDtubfihR4Dpb0xuqQEdm4t9p8doYufAdPmCvXAOPGMHawYZy2nghoTWKpYl6ormIZJ//sKoTRIgQBYFCbnA4OoBM/jTyC7LIfZelRRbEhxSEtNTNVDKv3OoGMY+ePImr+kyALktZ/SkbR62kQs40GA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 38d1a878-c701-4ecf-b6e4-08deb0b0f4f6
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 05:32:00.5924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MQJjyqR1L1E7zQikcQAbkWNirDyrPcfTQN1K1gGaSnJa3y/OG4xvA+LvN8hVmmLYHMGHeoIZE/cgKNfTPDx7gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6805
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_223204_967845_9A3ADCF2 
X-CRM114-Status: GOOD (  22.07  )
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

On 12/05/2026 19:27, Frank Li wrote:
> On Tue, May 12, 2026 at 03:17:28PM +0300, Adrian Hunter wrote:
>> System shutdown invokes each device's bus shutdown callback to quiesce
>> hardware, but the I3C bus type does not currently implement one.  As a
>> result, on shutdown the controller's Hot-Join work and any in-flight
>> i3c_master_do_daa() can keep running (or be newly triggered) while the
>> rest of the system is being torn down.
>>
>> A similar window exists at i3c_master_unregister() time: cancel_work_sync()
>> on hj_work prevents queued work from completing, but does not stop a
>> fresh Hot-Join IBI from re-queueing the worker, nor a concurrent sysfs
>> writer from toggling Hot-Join via i3c_set_hotjoin().
>>
>> Introduce a single "shutting down" gate in the I3C core, set under the
>> bus maintenance lock so it is observed by any in-progress DAA path
>> before pending work is cancelled.  Install an i3c_bus_type shutdown
>> callback that engages this gate for master devices during system
>> shutdown, and use the same gate in i3c_master_unregister() so both
>> paths get identical guarantees.
>>
>> Once the gate is engaged, the Hot-Join worker, i3c_master_do_daa_ext()
>> and i3c_set_hotjoin() all bail out cleanly, so Hot-Join IBIs that race
>> with shutdown become no-ops, direct DAA callers see -ENODEV, and sysfs
>> writers can no longer re-enable Hot-Join through ops->enable_hotjoin()
>> while the controller is going away.
>>
>> No functional change for the steady-state runtime path; the new checks
>> only take effect once the controller has been marked as shutting down.
>>
>> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
>> ---
>>  drivers/i3c/master.c       | 52 +++++++++++++++++++++++++++-----------
>>  include/linux/i3c/master.h |  2 ++
>>  2 files changed, 39 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
>> index cdb5cb2aa65d..a59c4b744b36 100644
>> --- a/drivers/i3c/master.c
>> +++ b/drivers/i3c/master.c
>> @@ -368,14 +368,6 @@ static void i3c_device_remove(struct device *dev)
>>  		driver->remove(i3cdev);
>>  }
>>
>> -const struct bus_type i3c_bus_type = {
>> -	.name = "i3c",
>> -	.match = i3c_device_match,
>> -	.probe = i3c_device_probe,
>> -	.remove = i3c_device_remove,
>> -};
>> -EXPORT_SYMBOL_GPL(i3c_bus_type);
>> -
> 
> why need move this tunk?

To avoid forward declarations.

i3c_device_shutdown() references i3c_masterdev_type so it needs to be
after i3c_masterdev_type definition.  i3c_device_shutdown() is being
added to struct i3c_bus_type, so i3c_bus_type needs to be after
i3c_device_shutdown().

> 
>>  static enum i3c_addr_slot_status
>>  i3c_bus_get_addr_slot_status_mask(struct i3c_bus *bus, u16 addr, u32 mask)
>>  {
>> @@ -637,7 +629,8 @@ static void i3c_master_hj_work_fn(struct work_struct *work)
>>  {
>>  	struct i3c_master_controller *master = container_of(work, typeof(*master), hj_work);
>>
>> -	i3c_master_do_daa(master);
>> +	if (!master->shutting_down)
>> +		i3c_master_do_daa(master);
>>  }
>>
>>  static int i3c_set_hotjoin(struct i3c_master_controller *master, bool enable)
>> @@ -658,7 +651,9 @@ static int i3c_set_hotjoin(struct i3c_master_controller *master, bool enable)
>>
>>  	i3c_bus_maintenance_lock(&master->bus);
> 
> later, consider change to use cleanup, so
> 	if (master->shutting_down)
> 		return -ENODEV
> 
> 	and avoid use else if branch.
> 
> but this change is okay for now.
> 
> Frank


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
