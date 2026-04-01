Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00AB3D35157
	for <linux-i3c@archiver.kernel.org>; Wed,  1 Apr 2026 07:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=PN3XPXS7o5ovRYnsWGVppWT87somamSTUy38zps50iY=; b=dncXv9U0ZiAvGLAlEBY8k5XGkz
	GUA78+cCl4hIk/10704zUP+lIKkdrlHzMHkjX47gw4t58Onw1EHIA7OZYSDFWZXMSDEf1SVSB+Nrj
	A4Bv+ay4vMdaSd4JzD9/v69X6k3jSrNYn3ll5qB+dAliPT9+BBubHQQGKDywz+OPMvwwHoS0zYqQT
	pYy5jUdOizMqmz/jUvBGhFXqhP3fc1JbOHp89I8P/gBrZJZ5D9xbBkfwzJwHrEiP1j+rjn/g/4ric
	K0/VUfyWVoGTL7AniNN1qwZjnSth9FFgtSQP0GPRQkYECAQyAW5XcPjMisqr4SJUKZccBkpBGIUO1
	0qhrwMAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7qLj-0000000EFwx-32wm;
	Wed, 01 Apr 2026 07:50:51 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7qLg-0000000EFwU-3gdq
	for linux-i3c@lists.infradead.org;
	Wed, 01 Apr 2026 07:50:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775029849; x=1806565849;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=c6CJBYbOkNtv/5kl1mIo77+aS6+JiF0gM0i93uWyIII=;
  b=fZEggssWU7X+FbzANnYl802MnHq58ibNzFa2w6wBwsLss6uwmUx81YU1
   UQgveWgBSd4EwtlnKRzx3+yslqyBkh/3CrleV/pjCjqDYM+KRAvLrmI58
   SnwXmPIb5ix62WRrtcvif3t8SMtuBqp8iNSBkwt254fJ8WekzFBg/k63E
   coHx24dPZ1M5wEVPCjdwd/i+1IBrm4l4Piej1NEg+VwbKomygbvNCeB/q
   HHdURk6TwY8zD12AyB3AMknWG7HniD8lGrLkHGKsSEntbmDNBeejfnr3p
   osUlDPzPgBS9Q6YjRKjkQVIdhnL6iPPIGxAZ1chsHMqEok+aC1ov+a6sQ
   g==;
X-CSE-ConnectionGUID: nBEmXOyEQ7a7xscVNCyXbA==
X-CSE-MsgGUID: yX8IuA0aTjGoapqp9Vlj8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75952362"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="75952362"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 00:50:48 -0700
X-CSE-ConnectionGUID: Tqkc7dr5T6eHfKdIV9E0QQ==
X-CSE-MsgGUID: ElgzNk9NRY+R2DZbohtlRQ==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 00:50:47 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 00:50:46 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 1 Apr 2026 00:50:46 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.61)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 00:50:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gqPKUv+S+Bwa0ccLFuKj5i5Spr4yI0HYfBjZE0cL8OWopSIRXa5GYQwuX88a7BZ8XijysnJQJyu2mwYtIlTawsiruRHYM4seFPVm6vfvyUz6C9aoMBLHXC0D2ePSTsy3mxRk/iJpPB5JWSPkL/Hj6wHlsIZPPlSMO+9com8aj/jSojyvJkGV8NMIfU44laWgmfgw4IH0SBnwnUkyC/hRImEX1iDYHikLyEIQ+Ws6OzmzKDPhYrFiwHHmWTYxjpgf9+LkT/VhNLMBVkzfJKCHoVTUkrwoEPQroFEh/pHOeMPFIDi+ri1mgvB3d1/EYPCCmBPbQk2deMRcOjlwW0jIqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=15KH3ECyde8d+fn33FN0itlwMzwhqRjZ8qwUtrBnklY=;
 b=ETia7LX2X0+xXF/JYBk9czKgIr4Rg3u/+RqM1EhDOwr7o8I4vZy6SOs6jKIh2/chnxuJ0FAoXTeuTZLCfajQPft5xX/zv/vTVLWmnYzdB4pKIEFwVCYnBg8p73VHVoB6eu1vu/3v+AmefJCXTPX3em/xOdrP8KZJ+tK/6L/mDSFEyw+mLmOCYPlNjjAznnt9BHI0us8Q7Mdwl9yPu/45ngF3ZYmXviVMnzeFSSnIzIESPegCPOGjLC1HOFFqIhuW0460lX3gt8qj/WxW6uxD1EI9RkfaIAJInkoPkmbTHEeLhogFelsVGcP+ju0bGa2PZIMPpvRlWAECf5wKGuYQAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by SA0PR11MB4718.namprd11.prod.outlook.com (2603:10b6:806:98::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 07:50:38 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9769.015; Wed, 1 Apr 2026
 07:50:38 +0000
Message-ID: <17efbe5d-6f9f-41b6-95ef-7a84e2ed5029@intel.com>
Date: Wed, 1 Apr 2026 10:50:33 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i3c: mipi-i3c-hci: fix atomic updates to RING_OPERATION1
 register
To: Billy Tsai <billy_tsai@aspeedtech.com>, Frank Li <Frank.li@nxp.com>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>, Nicolas Pitre
	<npitre@baylibre.com>, Boris Brezillon <boris.brezillon@collabora.com>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260331-i3c-hci-dma-lock-v1-1-708bc5848381@aspeedtech.com>
 <acvg36HWslcwTFht@lizhi-Precision-Tower-5810>
 <OSQPR06MB725226DC6D102631B4D3E3A28B50A@OSQPR06MB7252.apcprd06.prod.outlook.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <OSQPR06MB725226DC6D102631B4D3E3A28B50A@OSQPR06MB7252.apcprd06.prod.outlook.com>
X-ClientProxiedBy: DUZP191CA0072.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4fa::12) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|SA0PR11MB4718:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c5d423d-007f-45ed-c48f-08de8fc35d8a
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 4Ibru+pcWsmnlcgEN/JJ6yxBcze4lnna80veDKt47OCmofXj2Kw0Z9hQOflmQGd8kkVE6LHfqHysXrUV4JbXJmFnXiY3oJPk1etRpN8Gayo9kZZIBMjldJK8Z+txMI6ndEgBfNe8aOAVlDLXqRRrdbW1BWKp4gU1/z/UHlQSTqLyiTo+dLQUr4rFeDvQf/NAkBmt2QlYn/XNxeqGCHI6wsY/nsw4wXPulxaGx/uDxq0Mltfsv/uuMsF8Dvb2G5w0c5dgm3uBTbYepnlPu+N4wqMTjKX3vPeBh54t1TKx8pY+TTaj9VsAKuGnjFMeFXfGtwx3xEi0ZS6Ow4lnx6BF8uoiD9DTKieguMVXhGUo16nu+4o8YnvIVd5apsUBv0aLS5hcrzKrMN0JuEU641OWcZTOpvYjy+Lt0T/JayBFi5BX2g2NSFC/R3OaaOON5li3TNBadN6FEASidYDvfS3wAng5yahFOJ57Hr+ki4fnSitggdcGYy1XCVTSKdD+uTtahc4Kh0D4NkYo1TcYtoo+CKcueInKoyCCQEmkfQbdfPdhA8tFZvAEKvU8/lp3rXJfmBWsvlt4SNU9kBKUaVlqb+D4wVhB1xJgn10iWaHd22dh/Ehd9bl1JcLCx87YdP2R7fsmGxypq7vX2Yd7iRdKOvvJ+8+G37eiPw5gjgrafV8rm5oNdV/OIqEKNPYaoTZ6
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dm1sRm5KQUwzSGdpMkh2bWNycDFuNEs0Qzl1dkVCZ0h4TW5aRE1ZU1k1MTZC?=
 =?utf-8?B?VTdhd2N0YUlXVERiWThsR1k5Qi9LVFFST1hUMnRDTGhhYVloMFVBTGJNNVZ5?=
 =?utf-8?B?YXFRWmpTbFVhZXRYVjdQQ2JUVWZ6SktuY3BTaWtrWWQrRjlTc2hFeXNNR1E5?=
 =?utf-8?B?czZUbVVSUTkvajhqZUtBSVhaTW1wSk9XYi9qNEZxRHFDOXNTWUJ3RUJyb0dG?=
 =?utf-8?B?TVRHMllpK1A2WFdseFY2THlNZjBWWjJJa1k3TVBjVU4wZ2l4YjlOR3RValBH?=
 =?utf-8?B?L0x5eUM3bVdUU08ydU0vY2hQQTdmME9RQTZ3b1ZwVDNoOHdSdUVETUR1N2pB?=
 =?utf-8?B?bkVnWUJRby9wTXF5S2tlVEJRREs0ZjNmbUgxS1ZvRzdkYmxDNkVSb3hqdVY4?=
 =?utf-8?B?bGhrc1M0YUpnMElnb3d3dlZrd0tGRTRNbUM4MStCQ2M0NUUxM095dWlFVnZx?=
 =?utf-8?B?QUpsVzgyNG5pREZpdUQ5OWwxd3dwcEJESTE0UkJrOFcxTCtQN1krNTYvTmlY?=
 =?utf-8?B?RjQzMkZ2Ukx1WVoxc2FEZ01vTU1kVytvaVZYeFI0Y3hlaC9VVVprZ3RabDFM?=
 =?utf-8?B?NHBkemo4bDJhYm5FQnJGbFpXTnozOHRic2cxMUEyWStVTGxiN1htQ2d3Q0p5?=
 =?utf-8?B?NW9LWEZKdlhLZGdXQll3TjVSdHl1dkYyVEhXWnk5cVZITklackJtbXlYVTYw?=
 =?utf-8?B?T2xLWER1L1hVRWVNMlJWQ0g1ZjQ4MlRGVU9ERDlJaDFvTGNsSmxVZ3pnV1ZH?=
 =?utf-8?B?MldRUUREWjNGOUxBTFMwcVd4MVd0S0NmMndxTFhnRTJNYzAxRlB2UGNTeDZQ?=
 =?utf-8?B?NktZVDUrbU9Uc3d3MjUzN2NUWEtkT3lrTUNLVVJxKzllYkVCK3V4cXFiV0sy?=
 =?utf-8?B?ZDloaVVYY1Y0YlpGT2hqc1NKY0tnYjczMGVBQy9FZXNIWVArTTdQbitUVnlW?=
 =?utf-8?B?OTcvNVd0bklqdkJCL3RoeWxhRFZzUURaNzJBTzREbENxeWZvRUwvN2czeW5p?=
 =?utf-8?B?Z0t3ZlUyQyt4YStvUnBsaFVtY3BoSVk3bFAxYllNLzlmZnlUb29EcFJxVmhz?=
 =?utf-8?B?d1I1TUpIUDNYRWV0Tm0yYjJobTZRWUNEZ1lFSCtQRFlVTFFMaENpWlg3cHVi?=
 =?utf-8?B?Y0RXMkkrak9CdnJxTnQyKzJXTFIxR0Z4elQ5OWlvV1RjWHRZUmNHdGZGeExl?=
 =?utf-8?B?ZzJOYVJBSHZnVktCYXFJWWxNeWFVb0xDUVZLMEthSGRDbE9UOWZySFVsSk45?=
 =?utf-8?B?YXViaCthTEs3UUoyb2JhUkpwR2lXMEd6LzFrZzRLNWx0SHB5MkhoUmgvejhC?=
 =?utf-8?B?S21XdUdHcnAzNFlURFJMMi9md0pwelFKZFRrdjJDREVhZ0RyZGRUeGR1Zi9B?=
 =?utf-8?B?QnU4bnA3d0NtTy81R3pjdzRKdGpNSEt5MFBmY2srK01tVW1MM3JsRStPRXVz?=
 =?utf-8?B?TElFTmFEQXMzNWNGTmduWGFuU1U1bVhYM0NsSjhTOWNraUV0OWlzVlAvckpS?=
 =?utf-8?B?TENvV2FCQW9HZXYyeUlYc3lXTkJTVERnZEZNL2FZREVWZXJTZVZ3Q2FBQms5?=
 =?utf-8?B?OUNHTTNGR0o3a0E2dEh4NG1zekQ2TVpyQTkxRHdhRGdzRjJxWDFtTEFaRVBv?=
 =?utf-8?B?ZkJJWmdCbzBhNHRvQWhHUVV5aVhvZytRbmp3UXJGdktqbXRSbkx3dHdyTjNC?=
 =?utf-8?B?SU1RODVwUjBxSm9oNUFTWDUrUG1SUm00Uy9IQVpoUDFzY2pxY050eUluNkFi?=
 =?utf-8?B?QlV0aDh3cUVKVkRiM2g0SG53SjV1UU02ZVJIREswc2daMkxwd2Izb1RCNWp1?=
 =?utf-8?B?V1pWR01HSmNpc3pJVGVVdysvMitJK3FVRWZzaTdVcHdhbUpUYWxUSG9kYVVu?=
 =?utf-8?B?SVRtMmlMaFNaQnpFMTViKzNHWkVGeTllZkd5SlpzSkNIM01zMFhEdURNb1N6?=
 =?utf-8?B?cGFHUXcxUGc3SkVvcnlUS3Mwb2lWME9FRTB3TWRiT1BMNDhYSzhJYUN1TkF1?=
 =?utf-8?B?T2xNL3RWRUM2OXlWWXpZa2g3UHJQYlZLZVpZTDZsQ3BBWHQ3TG5wUjQ4dVQ0?=
 =?utf-8?B?V2Qxa2U3bGxFdHlacUFlZ29NaWlmdWRKeXZDR0QyQndSUmgyblk4Y0tsOFBG?=
 =?utf-8?B?SkpLR2FueFNUV25xeXM0cUg0V0hCejZsbm9POGxQdzIyRldTU0svcGEzZ2FW?=
 =?utf-8?B?U0Qyc1JVdWsrR1pqbXpCWmdQNUUzeVNmOXNMVHdOUWV2OEtmU0JlUzBHU0FO?=
 =?utf-8?B?anNMNmxTcVZ2bWhTUjNzZGozd2hsdFNBSmR5NWI0R1dqVFBtbFdjT3JkRnAw?=
 =?utf-8?B?TURCS2ZCMzdMVTg4WGhsdzdBcm1WNitvWXRVS1prcEJsZldhR1JrR1BYT0x6?=
 =?utf-8?Q?AwEIj/AM2ymSABJo=3D?=
X-Exchange-RoutingPolicyChecked: YvFWUX4GoinwDwjtSxXFcdbO4haPs9PdrAL4gH8J7piXjZ0/YxkzDQk4qHX9esEIIC/m9ixlzdVDP1bwAjhecsuEqKqdvKe+aH9QMPPc2ABaFLHGtjHmUezH4Oc5tnbUjlRoiKsgotJCBifkKXzkrN5fOFJZnWPRWl6S2bE7AZODUGonqMAl+xx8izXUwY+M3UbvQwbjrF1Hy61Fk+bnW8qhYPW1mLXqFiYb3928Xyysdvzl9sBJw/Hof2ZVIWaHLdJOIhXVRzJ0isPAoMGvGxJ6I4CnbSjzPlP4gfTN0DMlzAKXuDYuaWcfY9l0+QO/21UsB+vBpAOrjbal0liQlg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c5d423d-007f-45ed-c48f-08de8fc35d8a
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 07:50:38.7157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NLzm2e0GVz1Kpws1XZ2z5aNOmFbxlid2YvDbZpzFwlaw3g23zJ7DfQQdS+qLL4uiqrmiLZgXNT9w5jaffxBbEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4718
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_005048_942135_D8F71E37 
X-CRM114-Status: GOOD (  22.27  )
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

On 01/04/2026 08:53, Billy Tsai wrote:
>>> The RING_OPERATION1 register contains multiple bitfields (enqueue,
>>> software dequeue, and IBI dequeue pointers) that are updated from
>>> different contexts. Because these updates are performed via
>>> read-modify-write sequences, concurrent access from process and IRQ
>>> contexts can lead to lost updates.
>>>
>>> Example:
>>> CPU 0 (hci_dma_queue_xfer): reads RING_OPERATION1 (enq=5, deq=2)
>>> CPU 1 (hci_dma_xfer_done): reads RING_OPERATION1 (enq=5, deq=2)
> 
>> Add Adrian Hunter <adrian.hunter@intel.com>, who add lock at equeue.
> 
>> https://lore.kernel.org/linux-i3c/20260306072451.11131-6-adrian.hunter@intel.com/
> 
>> Dose above patch fix your problem ?
> 
> Thank you for pointing out the patch 
> 4decbbc8a8cf ("i3c: mipi-i3c-hci: Fix race in DMA ring enqueue for parallel xfers") from Adrian Hunter.
> 
> While that patch addresses the parallel enqueue issue in hci_dma_queue_xfer(), it does not fully
> resolve the race conditions affecting the RING_OPERATION1 register and the overall ring state
> consistency. Specifically, I have identified several remaining vulnerabilities:
> 
>   1. Atomic RMW Race on RING_OPERATION1
>   The RING_OPERATION1 register bundles three distinct pointers: Command Enqueue, Software Dequeue,
>   and IBI Dequeue. Adrian's patch protects the RMW sequence in hci_dma_queue_xfer(), but it misses
>   the IBI completion path:
>    * Missing IBI Path: hci_dma_process_ibi() updates the IBI_DEQ_PTR field in RING_OPERATION1 without
>      taking the hci->lock.
>    * Race Scenario: If hci_dma_queue_xfer() (Process context) and hci_dma_process_ibi() (IRQ context)
>      execute simultaneously on different CPUs, they will both perform unsynchronized RMW operations on
>      the same register. The last writer will overwrite the pointer update of the first, leading to ring
>      corruption.

i3c_hci_irq_handler() holds hci->lock so hci_dma_process_ibi()
is called with the lock already held:

	https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f0b5159637ca0b8feaaa95de0f5ea38f1ba26729

> 
>   1. Unsynchronized Completion Path
>   In hci_dma_xfer_done(), the patch 4decbbc8a8cf reads rh->done_ptr and enters the processing loop outside
>   of the spinlock. Furthermore, the RMW update of RING_OPERATION1 at the end of the function is only
>   partially protected. For full atomicity, the entire sequence from reading the current pointers to writing
>   back the updated pointers must be inside the critical section to prevent inconsistent state views between
>   the IRQ and Process contexts.

As above, hci->lock is already held

> 
>   1. Lack of Protection for Dequeue/Abort
>   The hci_dma_dequeue_xfer() path, which modifies rh->src_xfers and resets ring entries during a transfer
>   abort, remains unprotected by the spinlock in the existing upstream code. This leads to potential race
>   conditions where a completion interrupt might attempt to process a descriptor that is simultaneously being
>   cleared by the dequeue path.

The same patch adds hci->lock to hci_dma_dequeue_xfer()

> 
>   Conclusion:
>   My proposed patch provides a more comprehensive fix by expanding the lock coverage to ensure that all paths
>   accessing RING_OPERATION1 and shared ring state (Enqueue, SW Dequeue, and IBI Dequeue) are fully synchronized.
>   This ensures the structural integrity of the DMA rings under heavy, concurrent I/O and IBI loads.
> 
>   I believe both Adrian's improvements (like xfer_space management) and the expanded locking from my patch are
>   necessary for a robust fix.
> 
> Note: My based branch of this patch is i3c/fixes.

The relevant patches are there:

	https://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git/log/?h=i3c/fixes

And in mainline:

	https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/i3c/master/mipi-i3c-hci/core.c#n621

4167b8914463132654e01e16259847d097f8a7f7 i3c: mipi-i3c-hci: Use ETIMEDOUT instead of ETIME for timeout errors
fa9586bd77ada1e3861c7bef65f6bb9dcf8d9481 i3c: mipi-i3c-hci: Fix Hot-Join NACK
f3bcbfe1b8b0b836b772927f75f8cb6e759eb00a i3c: mipi-i3c-hci: Factor out DMA mapping from queuing path
fa12bb903bc3ed1826e355d267fe134bde95e23c i3c: mipi-i3c-hci: Consolidate spinlocks
4decbbc8a8cf0a69ab011d7c2c88ed3cd0a00ddd i3c: mipi-i3c-hci: Fix race in DMA ring enqueue for parallel xfers
1dca8aee80eea76d2aae21265de5dd64f6ba0f09 i3c: mipi-i3c-hci: Fix race in DMA ring dequeue
f0b5159637ca0b8feaaa95de0f5ea38f1ba26729 i3c: mipi-i3c-hci: Fix race between DMA ring dequeue and interrupt handler
b795e68bf3073d67bebbb5a44d93f49efc5b8cc7 i3c: mipi-i3c-hci: Correct RING_CTRL_ABORT handling in DMA dequeue
ec3cfd835f7c4bbd23bc9ad909d2fdc772a578bb i3c: mipi-i3c-hci: Add missing TID field to no-op command descriptor
b6d586431ae20d5157ee468d0ef62ad26798ef13 i3c: mipi-i3c-hci: Restart DMA ring correctly after dequeue abort
7ac45bc68f089887ab3a70358057edb7e6b6084e i3c: mipi-i3c-hci: Consolidate common xfer processing logic
e44d2719225e618dde74c7056f8e6949f884095e i3c: mipi-i3c-hci: Fix race in DMA error handling in interrupt context
c6396b835a5e599c4df656112140f065bb544a24 i3c: mipi-i3c-hci: Fix handling of shared IRQs during early initialization
9a258d1336f7ff3add8b92d566d3a421f03bf4d2 i3c: mipi-i3c-hci: Fallback to software reset when bus disable fails


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
