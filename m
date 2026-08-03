Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D35C55179
	for <linux-i3c@archiver.kernel.org>; Mon,  3 Aug 2026 14:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=72G7xTZsp8MoTonnQlYwf8COvlecOSitBSTIzADJLjY=; b=1xavo3oF/4persecDzIO5nxN7U
	87Nse4bV6T7q03FmpLiOfV1SgFgtVwBOTaS4aoFO1Y3yVJDEPWnVpaMCBORcCXKoQs00hGYp3pTbr
	Wd42EPq6fG909haukjRqSEfAZwAoivN5CzkulzktSEXDm4Zza93uLrH5fzyolgkhWbFlvpSf60v9w
	KadpdLXvhdl8IqJ2cI6zknLcUajR41MLl62clc7nHjnhJmc4zNB66ZbBYSzfoXBJRptIDFWWyhWIm
	BQcWqdWMZhO7qLqkoe8hgoAMOUa9+Wf/Jcq9NmkDFQ51KEjAquhUflJX5mD8PCt1qW+DwRwEH7e6h
	6eLb6qyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtDX-0000000HHvf-21fQ;
	Mon, 03 Aug 2026 14:00:35 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtDT-0000000HHuB-3ZfN
	for linux-i3c@lists.infradead.org;
	Mon, 03 Aug 2026 14:00:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785765632; x=1817301632;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=qquLAvqjmjOATdNybcjYC4TTYPXJsF10GcHKlFD5TOw=;
  b=bbLcLT7n3+uKTLJ0maWdo78RPBMQS+rKMfqUNNKdp1tWYtw5BxpYb+jw
   h9hPfTCcAmwcrhDy2OTfyr+euXy4j4pC2qPaxLd2ffODjPmJ1cbQehBqH
   VsnoU+2VuCFu/gjV76MCFKExpSFlqeHG/XnUVzQ2Bm3TC1PJ86wmJuT+Q
   SJ9Z9LSArFjVJCgTV9LcJHnm1PL9y2bcyRmBEvjZh2NnlIpcfoPNKww1c
   HOG/nRvP/8jlIpPwDTC3SgkxGhDdhujKFITJmm4E9nvfS9ax3WhcqlCWG
   AUizDamVbzC5eaToTmjLog0YYv2dQd79DkWkSPYsszpOYCdrqM2/czlX5
   w==;
X-CSE-ConnectionGUID: cl6uUVytTMKx/rvDyAXNLg==
X-CSE-MsgGUID: 24Sc5rftRCGi7qRdLan8aQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86421782"
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; 
   d="scan'208";a="86421782"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 07:00:30 -0700
X-CSE-ConnectionGUID: agqmUFLVSG+44S5ewaVVBg==
X-CSE-MsgGUID: e0waNpEdTpWs4NzpfB4kfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; 
   d="scan'208";a="264700312"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 07:00:30 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 07:00:29 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 3 Aug 2026 07:00:29 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.54) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 07:00:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PEZOBbjtNM2x+BjnVEo0SY5E29dZLyJUQyDRsE7E0uREMD2rRzg+FZvC+nDa8cyg/GRqxvi3ixTqHLubpWui1p+n4gUt70fvS/YJ8dZykxllrSvTuOTKlHvQI/Fe1/Qai6F5oI4QqnHRE3Gjlz0r3eO1fIb32QKJiIfbIgZNSLAfdIQtQozhwghCLd2bulm85T7aGpP2SqOryMNYYyvbwzA1Q4NwwqFGA+spv2vnJvdOi5kNDKRkj2qgOL0E7+bpojXRhRlN4dWl0Lvg0ylyTzPfAmB9vz4ke5rcPG2TGx0RHvRxkQj8mUTbe985KEw6I+0XElOv6pPjyNSVJNU5IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zWAGflaRJnH1ULoNysMImLPl5odmDhUtgJENoY9dnBw=;
 b=k71YVcY4oBzI2FLGwa7EBXC+EST3/t7+TIiJBOIKlsv8JJebdchwCCXXLelUiplBd+XgM+w2Smsiq1j91j7JhTdG9Hv67shta2rhM9VIFQX0+a74GDF0iEw/X1hgr9o2xYfsAyS6SsVusgAxsOYWZBbA/Gce3Oj8zzUIKEKKoOgDUcDjYnTvynPfLzmFT/tkU9dB17Az+QcRFyYFmYUhj59hc30VQCya/YHpTvYnVzwyrlDhMqKMvFXClqza2jv5Ro9vLlLaqZ8K5V8PXe2+DMk7ks5nvC/64LDPi+T6IMQkSoMH8jyeeh/+wWOOHxjRbUDaGA3bG1IgctBbGgpe6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by SA1PR11MB5778.namprd11.prod.outlook.com (2603:10b6:806:23f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 14:00:26 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 14:00:26 +0000
Message-ID: <cd96321c-3ca2-4b11-95e1-17d0a411ce8f@intel.com>
Date: Mon, 3 Aug 2026 17:00:21 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/8] i3c: master: Fix recursive locking during device
 registration
To: Frank Li <Frank.li@oss.nxp.com>, <sashiko-reviews@lists.linux.dev>
CC: <Frank.Li@kernel.org>, <linux-pci@vger.kernel.org>,
	<linux-i3c@lists.infradead.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>
References: <20260728155308.142713-1-adrian.hunter@intel.com>
 <20260728155308.142713-2-adrian.hunter@intel.com>
 <20260728161935.C236F1F00A3A@smtp.kernel.org>
 <amkJi8010zem-2O9@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <amkJi8010zem-2O9@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: DUZPR01CA0290.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::28) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|SA1PR11MB5778:EE_
X-MS-Office365-Filtering-Correlation-Id: c584f9d3-a8eb-49a5-c906-08def16791bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|6133799003|56012099006|5023799004|11063799006|10067099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: wybxTUxZWnp/YZA+3KNWBY3pft3Yol3DjHieFQUAUVYgNVqqnH2oNhwIa38ojkPgKUD6SF39aWi6kHVqOlRNzGQv3a8atdZy/abP5As3HAMTC+pGB80YghT2kwea/KFp4v7y/FHx8HDnIs1nAz1f9mtl+kK09tIrFeLG7S4khK1eY6V+U943YuD18+dY6BZx6zHgqpcES4es7jT3XQjmrrUyVUV2LZac/ds3Ew3HKIGQxXnjjwvcIUGhk4OwrUlD4MVHSbBFp3khfNBDOJiejwlqJtZXdshInfb0NoNr5cy82VP7yS/stwcxHqCY/dic1+aQMx6UJnwKJjmdodd6Gfm4diEm1BE30Jueggq/1H+Sc2M1T5lyaveqPj+x06lVfE6yxD0hzaqne8wg6ImXIh/LBZXE2Vxe71/tKXNqJsHhpnYh1oY4bZzwFAorLXLPayxkosKYJ9aKQgLvy2mYqu8etUyeEeXv5JAe9SiaNpNb4XRsBdHzYyRFIrrLoM8fU0xxcdF3LJhknH/kdFIUEBBeSfM7JXXvk2ruFqdA97WjjYBdJgGDgA+K34lU0p4PMDafS/nq83Ey6rV4HOhdDO5iFNMpTsMorgVnlECR9YY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(6133799003)(56012099006)(5023799004)(11063799006)(10067099003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MC81MWpZUDBsdkE2M0pCNi9wenlNQytRNWVyNlc1d0ZaWTlidkV3ODVOVG54?=
 =?utf-8?B?U0FLeGovVGhwNW01K1VzdWprUGs0b3J4alVEOTE0VnhJMG55bnZMWDM4UU5h?=
 =?utf-8?B?TUxrUi8rKytCMm5kQkNwNFo4UWtpVmZLUk12NEJvZ2dOaEtkNE14bWhLTTRJ?=
 =?utf-8?B?U2QxRFMraGV4R2FqU2dHY0tuNmNiZEYzdHhJaG5tMDBQUFpVVnpqcDV3Qnp0?=
 =?utf-8?B?alp3SG4xR3NqRUhaK1FvNWZTL1lDSVIxZndBTDhjSHhqdW9Dc1ZjN2crUFhP?=
 =?utf-8?B?L2NsNUJ0Um1MUC96eVdKaDlUQWNGd3RBN2lxZk9Qc0FJdnFQMnZKeldnNmFL?=
 =?utf-8?B?S0dCd2ViZUU0ODFNa3hpWmsyVTNGeDRCMlpKejIxeWFFOER0REtuN0E3Nndz?=
 =?utf-8?B?UDVRRXhpWlE5MGtuckl6YXM2SDBTeTJWSnZxNmRVVW03UEp1MjdORlh5NzZy?=
 =?utf-8?B?NmNReTJJcEJPc2FRL2s5QmxCUHlRNExTYXk4RDFkQnlyREd5OVZrSXJWN095?=
 =?utf-8?B?LzZjRitIU1U5YW03ZThKS0VUTi80L2ErWW9jc1JhdTRFTk5hSy9vTE1KSENx?=
 =?utf-8?B?OVBmcHVtMzRXL1RmMlRIMlJvNkg1b2U1ZjJVL1Rrc0xtZkJTMEZMMEtuNDVK?=
 =?utf-8?B?NklmSUpFQVZjNmJ4ODJuMXhzUGhDWk5rS2dVbmVpM0JCV3NWOHpONW9lcklD?=
 =?utf-8?B?eTVUYVUybW4va1VCbWVRZUJoSExYQWk2ZDV2amNLa3pnOFMrMGFxYThKWXVM?=
 =?utf-8?B?Y1VUMUlmN204SHN5L1VCa2h4STJ1NXRGVmU3Njh4TDdJMTVDTndmRHB3TnpR?=
 =?utf-8?B?R0htNnRMQk9IeWhhT1k3TkRZUWt1ZGppclM1WGZhMHNhejlGL0VPbUQvQ1B2?=
 =?utf-8?B?VjBweUpYY2VVTGpaTEVGcmdJd3J2MUh0SFFGVXQ3TXloaHhQam9ORkhxSEJp?=
 =?utf-8?B?d3oySElMMUthT1YrWWp3UmpZWWNRZHBKMGdJc3ljaGVEa3lGaVhMSWZNeHZn?=
 =?utf-8?B?WFJCSE1UVkdqak12U2lNRVVLWHJiaVB4d1VwRXVmMjArVnliK0ZRRzl1RG1a?=
 =?utf-8?B?WDRRTXlhNVZCM21WZlJKMUJCV1hkd3pMNSs0WE5hZXhaY3ZpN2laWlFWbW1r?=
 =?utf-8?B?NDVvZkpNanlpOTIvei9DbmlFMUVPUkovVElmUk5qdGhlejQ2R2tha2gwWFll?=
 =?utf-8?B?MitIck9KY0dvTFRLSDdFbnVkU09PemdSQXFZdktDTCtUZWlmZnRzZ0w5SCtV?=
 =?utf-8?B?OUdXTWJDR25Sb2t1QytyWHROdHZYQW5wWEM4M2VPQW9qVExZVVhWdGI1aXVN?=
 =?utf-8?B?SmJnM2U2b1VJR0tPZzhneTViRmdHWThlMUM3R1o5b2phWU5XQ1A0NE81aEJh?=
 =?utf-8?B?Q0FNbFp1SVhHT1gxL3dvVEJLRFpKOHhwRTZJZkVkbmNzWU9LTU5LQ2hsVVNu?=
 =?utf-8?B?Z1RTVkY1M0htangyTGxNdjAxMUJLRFgxa2NpZEtFcTJod2hUZE9tVllJOWhU?=
 =?utf-8?B?V2l4VzNXeTZoWDVKeTNKYnc5UHRSSjkvVzBjRnVOd3FxTldmZEIrWEh0NFBB?=
 =?utf-8?B?T0puemVhRmwxT0RVa1crTVA3UUtYRktPYzA3WDR4VEFRWmMxUlNiZFlmamEy?=
 =?utf-8?B?cHpmQTl6bnpqOXhqNmJsblZLTG5mQmhmQnd6T01hd0E3enVPdUZCOHhBTEh4?=
 =?utf-8?B?QjRRSHh3WGZNV1k0ZDJVZmlrL09xK3gyanNveUpVZ01NQ1BBbXhnbHVDeWEx?=
 =?utf-8?B?R2QrZXVsT1JTQjJ5bkQ4SEpXazQ0ejVwZmxDYmh4NlZMalZlWDhBc3lXc1Jz?=
 =?utf-8?B?SjBGMFp0b3NOeWdweGZJK2JwbnlvV3dTMWhKc2xSNVdoVUc2OUNSdjlzS1oy?=
 =?utf-8?B?dW9EMXpUMkZwUzdOWkR5a0xCQm1uRDJiOUdkSTJ0alFBRkdzbmlVWmJWT216?=
 =?utf-8?B?SWtkM1kweEYzOUJzQTlzRnZxbGVHTWRVYmNQWkROdFFGajJJWllCK2pTMi9C?=
 =?utf-8?B?bmEvbG54a2JqcHlUSzZyd3orVEVhYVZka2VSV3BGcjlTR25HY0crUllOc0lI?=
 =?utf-8?B?V3crR1JoMkRKeVFseVpZNEk4R0ovM2c3VnZwNmRzeE1wWENZdlM2RXB0OVA4?=
 =?utf-8?B?bUJ1V1R3Smh5K0pBemJGajQvaUt6dVhkaGFpVGJmaVlkbCtwRFE1MGFteEhN?=
 =?utf-8?B?TDdTMEhHVit4NHFwMmFFMXArbGlSTXMzRU9lVkNURHNtdGN1QnIvZXFaZ3hO?=
 =?utf-8?B?TExDUUFiU3EvL2pHR1dHMWppUkdxSEhUS05oYmNpOWpRRS8wcUEzOWNMbHRy?=
 =?utf-8?B?UUluRUpDa0dJY3NsVEJqVmc4Z3Z6STl0QmJvNVVEcFBHZjN4MkQwRm1QNFht?=
 =?utf-8?Q?9gTYAtCmYgkvQBO4=3D?=
X-Exchange-RoutingPolicyChecked: VFvGu+2cFZjmPbQGi89uF3ZabURnsp8ugrytcF8zlpesoBBdpexyyf+M6yDeiG9dFSg4kNRoFXY3L3l7WhCFbfjKR6PsKRCsgR6bhSucyaAnk2DX9EA7WmYI/4WU5W5J0sIK/0TXLE2TN6g5ScMysid3mHuEq72RpTtV5XHo9ndZtXN/RjJLBMzFk3PmENODNgCbShIIt2tAqYMOk+Nuw8fEfW4wUaVxkapeqcaVbg4vXf6mMLpt+SLW0svLNNVE/QStnTG55FMTx1uRTwPm3A2PJKrRr5ABh6ADZoLFiwlBA1/oAZVy/dDcESA3/KL+lDfPrIy4Few2TtcMSnKYHw==
X-MS-Exchange-CrossTenant-Network-Message-Id: c584f9d3-a8eb-49a5-c906-08def16791bb
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 14:00:26.5730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TPv3ZxAT3h6bJbhT9JCW2sMM4WZoIywzHbYQ8rnLkiejCjBD7I/kjtQ/N3vZT2Ybz46qanZHsyrMbUymfqEE2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5778
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_070031_941300_F4D3DCE4 
X-CRM114-Status: GOOD (  20.99  )
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

T24gMjgvMDcvMjAyNiAyMjo1NiwgRnJhbmsgTGkgd3JvdGU6Cj4gT24gVHVlLCBKdWwgMjgsIDIw
MjYgYXQgMDQ6MTk6MzVQTSArMDAwMCwgc2FzaGlrby1ib3RAa2VybmVsLm9yZyB3cm90ZToKPj4g
VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Cj4+Cj4+IE5ldyBpc3N1ZXM6Cj4+IC0g
W0hpZ2hdIERyb3BwaW5nIHRoZSBidXMgbWFpbnRlbmFuY2UgbG9jayBhcm91bmQgZGV2aWNlX3Jl
Z2lzdGVyKCkgZXhwb3NlcyBpM2NfZGV2aWNlX3VldmVudCgpIGFuZCBkcml2ZXIgcHJvYmUgZnVu
Y3Rpb25zIHRvIGEgVXNlLUFmdGVyLUZyZWUgaWYgYSBjb25jdXJyZW50IERBQSByZXBsYWNlcyB0
aGUgZGV2aWNlLgo+Pgo+PiBQcmUtZXhpc3RpbmcgaXNzdWVzOgo+PiAtIFtIaWdoXSBpM2NfZGV2
aWNlX3VldmVudCgpIGxlYWtzIHVuaW5pdGlhbGl6ZWQgc3RhY2sgbWVtb3J5IHRvIHVzZXJzcGFj
ZSB3aGVuIGkzY2Rldi0+ZGVzYyBpcyBOVUxMLgo+PiAtLQo+Pgo+PiAtLS0gUGF0Y2ggWzFdOiBb
UEFUQ0ggVjIgMS84XSBpM2M6IG1hc3RlcjogRml4IHJlY3Vyc2l2ZSBsb2NraW5nIGR1cmluZyBk
ZXZpY2UgcmVnaXN0cmF0aW9uIC0tLQo+PiBjb21taXQgMzNhNGRjZDZjNTYyNmZhZWY5NWJjN2Nk
MDJlYzRjNTZjNjcxMGM3OAo+PiBBdXRob3I6IEFkcmlhbiBIdW50ZXIgPGFkcmlhbi5odW50ZXJA
aW50ZWwuY29tPgo+Pgo+PiBpM2M6IG1hc3RlcjogRml4IHJlY3Vyc2l2ZSBsb2NraW5nIGR1cmlu
ZyBkZXZpY2UgcmVnaXN0cmF0aW9uCj4+Cj4+IFRoaXMgY29tbWl0IHNlcGFyYXRlcyBkZXZpY2Ug
Y3JlYXRpb24gZnJvbSByZWdpc3RyYXRpb24gdG8gZml4IGEgcmVjdXJzaXZlCj4+IGxvY2tpbmcg
aXNzdWUuIEl0IGRyb3BzIHRoZSBidXMgbWFpbnRlbmFuY2UgbG9jayBhcm91bmQgZGV2aWNlX3Jl
Z2lzdGVyKCkKPj4gdG8gcHJldmVudCBkZWFkbG9ja3Mgd2hlbiBwcm9iZSBjYWxsYmFja3MgaW52
b2tlIEkzQyBoZWxwZXJzLgo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyLmMg
Yi9kcml2ZXJzL2kzYy9tYXN0ZXIuYwo+PiBpbmRleCBmZDNlNzlkMTBjODQwLi44NzRmNmUxMWIy
OTZkIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIuYwo+PiArKysgYi9kcml2ZXJz
L2kzYy9tYXN0ZXIuYwo+PiBbIC4uLiBdCj4+PiBAQCAtMTk5OSwyNSArMjAwOCwzNyBAQCBpM2Nf
bWFzdGVyX3JlZ2lzdGVyX25ld19pM2NfZGV2cyhzdHJ1Y3QgaTNjX21hc3Rlcl9jb250cm9sbGVy
ICptYXN0ZXIpCj4+PiAgCQlpZiAoZGVzYy0+Ym9hcmRpbmZvKQo+Pj4gIAkJCWRlc2MtPmRldi0+
ZGV2Lm9mX25vZGUgPSBkZXNjLT5ib2FyZGluZm8tPm9mX25vZGU7Cj4+Pgo+Pj4gLQkJcmV0ID0g
ZGV2aWNlX3JlZ2lzdGVyKCZkZXNjLT5kZXYtPmRldik7Cj4+PiAtCQlpZiAocmV0KSB7Cj4+PiAt
CQkJZGV2X2VycigmbWFzdGVyLT5kZXYsCj4+PiAtCQkJCSJGYWlsZWQgdG8gYWRkIEkzQyBkZXZp
Y2UgKGVyciA9ICVkKVxuIiwgcmV0KTsKPj4+IC0JCQlkZXNjLT5kZXYtPmRlc2MgPSBOVUxMOwo+
Pj4gLQkJCXB1dF9kZXZpY2UoJmRlc2MtPmRldi0+ZGV2KTsKPj4+IC0JCQlkZXNjLT5kZXYgPSBO
VUxMOwo+Pj4gLQkJfQo+Pj4gKwkJbGlzdF9hZGRfdGFpbCgmZGVzYy0+ZGV2LT5ub2RlLCAmaTNj
X3VucmVnX2RldnMpOwo+Pj4gKwl9Cj4+PiArCj4+PiArCWkzY19idXNfbWFpbnRlbmFuY2VfdW5s
b2NrKCZtYXN0ZXItPmJ1cyk7Cj4+PiArCj4+PiArCWxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZShp
M2NkZXYsIHRtcCwgJmkzY191bnJlZ19kZXZzLCBub2RlKSB7Cj4+PiArCQlyZXQgPSBkZXZpY2Vf
cmVnaXN0ZXIoJmkzY2Rldi0+ZGV2KTsKPj4KPj4gW1NldmVyaXR5OiBIaWdoXQo+PiBEb2VzIGRy
b3BwaW5nIHRoZSBtYWludGVuYW5jZSBsb2NrIGFyb3VuZCBkZXZpY2VfcmVnaXN0ZXIoKSBleHBv
c2UKPj4gaTNjX2RldmljZV91ZXZlbnQoKSBhbmQgZHJpdmVyIHByb2JlcyB0byBhIHVzZS1hZnRl
ci1mcmVlPwo+IAo+IGxvb2sgbGlrZSBtYWtlIHNlbnNlLgoKWWVzLCBidXQgaXQgaXMgbm90IG5l
dy4gIEEgcGxhaW4gc3lzZnMgcmVhZCBsaWtlOgoKCWNhdCAvc3lzL2J1cy9pM2MvZGV2aWNlcy88
YnVzLmlkPi08cGlkPi91ZXZlbnQKCndpbGwgaW52b2tlIGkzY19kZXZpY2VfdWV2ZW50KCkgd2l0
aG91dCBhbnkgbG9jay4gIEl0IGhhcyBiZWVuIHRoYXQKd2F5IHNpbmNlIGNvbW1pdCA2Y2Y3YjY1
ZjcwMjkgKCJpM2M6IFVzZSBpM2NkZXYtPmRlc2MtPmluZm8gaW5zdGVhZApvZiBjYWxsaW5nIGkz
Y19kZXZpY2VfZ2V0X2luZm8oKSB0byBhdm9pZCBkZWFkbG9jayIpCgpBZnRlciB0aGlzIHBhdGNo
IGl0IHNob3VsZCBub3cgYmUgcG9zc2libGUgdG8gdGFrZSBhIGxvY2sgaW4KaTNjX2RldmljZV91
ZXZlbnQoKSwgb3IgYWx0ZXJuYXRpdmVseSwgcHV0IGEgY29weSBvZiBwaWQgYW5kIGRjciBvbgpz
dHJ1Y3QgaTNjX2RldmljZSBmb3IgdXNlIGJ5IGkzY19kZXZpY2VfdWV2ZW50KCkgc28gbm8gbG9j
ayBpcyBuZWVkZWQuCgpJbiBhbnkgY2FzZSwgaXQgaXMgYSBzZXBhcmF0ZSBmaXguCgo+IAo+IEZy
YW5rCj4gCj4+Cj4+IElmIGEgY29uY3VycmVudCBJM0MgaG90LWpvaW4gZXZlbnQgb3IgYSBzeXNm
cyB3cml0ZSB0byBkb19kYWEgb2NjdXJzIHdoaWxlCj4+IGRldmljZV9yZWdpc3RlcigpIGlzIHJ1
bm5pbmcgd2l0aG91dCB0aGUgbG9jaywKPj4gX19pM2NfbWFzdGVyX2FkZF9pM2NfZGV2X2xvY2tl
ZCgpIGNvdWxkIGZpbmQgYSBkdXBsaWNhdGUgUElEOgo+Pgo+PiBfX2kzY19tYXN0ZXJfYWRkX2kz
Y19kZXZfbG9ja2VkKCkgewo+PiAgICAgICAgIG9sZGRldiA9IGkzY19tYXN0ZXJfc2VhcmNoX2kz
Y19kZXZfZHVwbGljYXRlKG5ld2Rldik7Cj4+ICAgICAgICAgaWYgKG9sZGRldikgewo+PiAgICAg
ICAgICAgICAgICAgbmV3ZGV2LT5kZXYgPSBvbGRkZXYtPmRldjsKPj4gICAgICAgICAgICAgICAg
IGlmIChuZXdkZXYtPmRldikKPj4gICAgICAgICAgICAgICAgICAgICAgICAgbmV3ZGV2LT5kZXYt
PmRlc2MgPSBuZXdkZXY7Cj4+ICAgICAgICAgICAgICAgICAuLi4KPj4gICAgICAgICAgICAgICAg
IGkzY19tYXN0ZXJfZGV0YWNoX2kzY19kZXYob2xkZGV2KTsKPj4gICAgICAgICAgICAgICAgIGkz
Y19tYXN0ZXJfZnJlZV9pM2NfZGV2KG9sZGRldik7Cj4+ICAgICAgICAgfQo+PiB9Cj4+Cj4+IE1l
YW53aGlsZSwgZGV2aWNlX3JlZ2lzdGVyKCkgdHJpZ2dlcnMgYSBLT0JKX0FERCB1ZXZlbnQuIGkz
Y19kZXZpY2VfdWV2ZW50KCkKPj4gcmVhZHMgaTNjZGV2LT5kZXNjIGxvY2tsZXNzbHk6Cj4+Cj4+
IGkzY19kZXZpY2VfdWV2ZW50KCkgewo+PiAgICAgICAgIGlmIChpM2NkZXYtPmRlc2MpCj4+ICAg
ICAgICAgICAgICAgICBkZXZpbmZvID0gaTNjZGV2LT5kZXNjLT5pbmZvOwo+PiB9Cj4+Cj4+IENv
dWxkIHRoaXMgbGVhZCB0byBpM2NfZGV2aWNlX3VldmVudCgpIG9yIGRyaXZlciBwcm9iZSBmdW5j
dGlvbnMgZGVyZWZlcmVuY2luZwo+PiB0aGUgb2xkIGRlc2NyaXB0b3Igd2hpbGUgaXQgaXMgYmVp
bmcgZnJlZWQ/Cj4+Cj4+PiArCQlpZiAocmV0KQo+Pj4gKwkJCWRldl9lcnIoJm1hc3Rlci0+ZGV2
LCAiRmFpbGVkIHRvIGFkZCBJM0MgZGV2aWNlIChlcnIgPSAlZClcbiIsIHJldCk7Cj4+PiArCQll
bHNlCj4+PiArCQkJbGlzdF9kZWxfaW5pdCgmaTNjZGV2LT5ub2RlKTsKPj4+ICsJfQo+Pj4gKwo+
Pj4gKwlpM2NfYnVzX21haW50ZW5hbmNlX2xvY2soJm1hc3Rlci0+YnVzKTsKPj4+ICsKPj4+ICsJ
bGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKGkzY2RldiwgdG1wLCAmaTNjX3VucmVnX2RldnMsIG5v
ZGUpIHsKPj4+ICsJCWxpc3RfZGVsKCZpM2NkZXYtPm5vZGUpOwo+Pj4gKwkJZGVzYyA9IGkzY2Rl
di0+ZGVzYzsKPj4+ICsJCWkzY2Rldi0+ZGVzYyA9IE5VTEw7Cj4+Cj4+IFtTZXZlcml0eTogSGln
aF0KPj4gVGhpcyBpcyBhIHByZS1leGlzdGluZyBpc3N1ZSwgYnV0IGRvZXMgc2V0dGluZyBpM2Nk
ZXYtPmRlc2MgdG8gTlVMTCBiZWZvcmUKPj4gdW5yZWdpc3RyYXRpb24gb3IgY2xlYW51cCBsZWFk
IHRvIGxlYWtpbmcgdW5pbml0aWFsaXplZCBzdGFjayBtZW1vcnkgaW4KPj4gaTNjX2RldmljZV91
ZXZlbnQoKT8KPj4KPj4gV2hlbiBhIGRldmljZSBpcyB1bnJlZ2lzdGVyZWQgKG9yIGlmIHJlZ2lz
dHJhdGlvbiBmYWlscyBhbmQgdHJpZ2dlcnMgYSB1ZXZlbnQpLAo+PiBpM2NkZXYtPmRlc2MgaXMg
c2V0IHRvIE5VTEwuIFRoaXMgYnlwYXNzZXMgdGhlIGluaXRpYWxpemF0aW9uIG9mIGRldmluZm8K
Pj4gaW4gaTNjX2RldmljZV91ZXZlbnQoKToKPj4KPj4gaTNjX2RldmljZV91ZXZlbnQoKSB7Cj4+
ICAgICAgICAgc3RydWN0IGkzY19kZXZpY2VfaW5mbyBkZXZpbmZvOwo+PiAgICAgICAgIHUxNiBt
YW51ZiwgcGFydCwgZXh0Owo+Pgo+PiAgICAgICAgIGlmIChpM2NkZXYtPmRlc2MpCj4+ICAgICAg
ICAgICAgICAgICBkZXZpbmZvID0gaTNjZGV2LT5kZXNjLT5pbmZvOwo+Pgo+PiAgICAgICAgIG1h
bnVmID0gSTNDX1BJRF9NQU5VRl9JRChkZXZpbmZvLnBpZCk7Cj4+ICAgICAgICAgLi4uCj4+ICAg
ICAgICAgcmV0dXJuIGFkZF91ZXZlbnRfdmFyKGVudiwgIk1PREFMSUFTPWkzYzpkY3IlMDJYbWFu
dWYlMDRYIiwKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGV2aW5mby5kY3IsIG1h
bnVmKTsKPj4gfQo+Pgo+PiBTaW5jZSBkZXZpbmZvIGlzIHVuaW5pdGlhbGl6ZWQgb24gdGhlIHN0
YWNrIHdoZW4gZGVzYyBpcyBOVUxMLCBjb3VsZCB0aGlzCj4+IGJyb2FkY2FzdCB1bmluaXRpYWxp
emVkIGtlcm5lbCBzdGFjayBkYXRhIHRvIHVzZXJzcGFjZSBwcm9jZXNzZXMgbGlzdGVuaW5nCj4+
IHRvIG5ldGxpbmsgdWV2ZW50cz8KPj4KPj4+ICsJCXB1dF9kZXZpY2UoJmkzY2Rldi0+ZGV2KTsK
Pj4+ICsJCWRlc2MtPmRldiA9IE5VTEw7Cj4+PiAgCX0KPj4+ICsKPj4+ICsJaTNjX2J1c19tYWlu
dGVuYW5jZV91bmxvY2soJm1hc3Rlci0+YnVzKTsKPj4+ICB9Cj4+Cj4+IC0tCj4+IFNhc2hpa28g
QUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDcyODE1NTMw
OC4xNDI3MTMtMS1hZHJpYW4uaHVudGVyQGludGVsLmNvbT9wYXJ0PTEKCgotLSAKbGludXgtaTNj
IG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
