Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1485CD58E7E
	for <linux-i3c@archiver.kernel.org>; Mon,  2 Mar 2026 08:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=6wUpMwgX5C51XhEyS2pKZgTTK/Isr0C3kwReeIgaT/w=; b=2/r9z+1B/2d+1iqNX4tmNJE3a6
	KXTDhImEdDJKLngpj16K/t9OjxTnDsQ3hLXRsYqjBZPMB6aDlYlyT1cjYaiImCT0YbZAoJ5IcznTJ
	K0qTdmwUHIz1S0DXd37QD6DKHxFW5bF3I04SYkUrYcJyY7tNA7hw6NHvUvbnYoJWOfr25MPNlgTeQ
	hphdZR22I3NPTPiMe9k9JTPVuNsh6oCymrU9sopSrIPWlIODAXiTI3TeSwEVTlYpTW734weJhqnPN
	BEJuayzoR6UryCS+iO+QcA2aOf22QZhqbiYJaTfwPtJxrMNTn+nT8kDjT2qOYRP90zTwZpcuJtacc
	UYoxqRzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwysU-0000000CXVK-26V3;
	Mon, 02 Mar 2026 08:43:46 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwysP-0000000CXUj-3oqd
	for linux-i3c@lists.infradead.org;
	Mon, 02 Mar 2026 08:43:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772441021; x=1803977021;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Zrk/eFM432wRkLXmnWj35jLkLjMHDFPCY2qWUdM3FPQ=;
  b=Niq9vbSDY9JQmm89WiaV98DfOAbhK53dvwUzLMcHIenz6DPvbBSZLQUe
   R3z35AFSUcB6ZO/RhgKHu6wjhlvFwqrxhxR+ZmhHCOtvYjCppgt06n1QO
   Ml3tFQpbWWnQRHhxKKAYne0Wy/NnOEdcTOJn+/YA+O3b28XvHJ73Jc9V7
   uW4uG/vY15Xkejinj5Vnk+KUcj1HZa+L0ljc9s9798krLjj4uDL8gFgCl
   fpxu6iRwegBfx+5uPMyfNNnJ6qXaDPG2yZI0iDaM+eXPv+T9fG8GWTgQ4
   24y/BqYYpoTI5r7hKFQCA2qZBG2rmTOz5j50CPb4Dm+SRKma/ci6sKt58
   g==;
X-CSE-ConnectionGUID: Ab92bBnkQ7WfzWsXKNGWfQ==
X-CSE-MsgGUID: ZH+jg8SfTWOjQWMDJyJWGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="73310855"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="73310855"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 00:43:41 -0800
X-CSE-ConnectionGUID: vVCT7A2tQMK3WmRQ43nt2A==
X-CSE-MsgGUID: 6KGdFxKbS+OdBccPjuSKeA==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 00:43:40 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 00:43:40 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 2 Mar 2026 00:43:40 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.49) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 00:43:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HMMUeR8jPKk40/i/k/OzY0d4KxOkEnaLtt1IdtzJWN5saZ6vG3lpXhjSFp74aXoFwgvPu+V79/cJldqQVumHkyF0sPbxqXovz2C6xl97UuhCbyMjKXAhmwvP1jQbMCqiNOVHrWQ3zrMEfAHp1EOsiVoB+ROKzSD64oJtmjFKRrCjhoV1zgGzaB4y+CHBMXfMRdxR8BR2JVKqJs7LUqv0V0ug+nFlVIRxQ8/nxIcllGtARzV06789fucFasy7TS9LIJr9lGY2S1/cbzaL70sJCk8qeLCDlpzQ4fwxKtP+fM7i2WbEFgdNWodLQQplcb34hfqamYuf3PajVywFpJSyhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hfFVxVM6Pgc8I/+wLYsbjYQGUyPH9f1k/ubjdIfa2yA=;
 b=wK41ma8yb0+60WLNPl5Zj66hy/g0/iZoZaaNoTH82EMypKnLdg+MuNWAx+tsNHvhDapYbm02XrHVFvWZ/BHa7OmQqLrY5W5fwKZA+xRARsIi7HEpLUi/uSieibFqjghk735YztWFJYzk76NbCGGmD4G8QPu5483n0+RHYoBnWoO8fCKtiAkatzQUbc6fmnz7jwwDVIJXlCOdGSqbM/rm+uH7KOgD0LbFzVO+1BnogZefZGmE2vKWMJ1s4f3FxfMZtGu7gyOk0fota2xpNY9dCAIKwNpTuRbiw7IftIQaWExW9BlmoKNmn2SGG3baz9VGl9TTcFvJt/9LH3cmsbxMxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by DS4PPFC60125F65.namprd11.prod.outlook.com (2603:10b6:f:fc02::4b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.19; Mon, 2 Mar
 2026 08:43:38 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 08:43:38 +0000
Message-ID: <d7d9a86a-3147-4bf2-bd19-9fc6dc4579ba@intel.com>
Date: Mon, 2 Mar 2026 10:43:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] i3c: mipi-i3c-hci: Fix race in DMA ring dequeue
To: Frank Li <Frank.li@nxp.com>
CC: <alexandre.belloni@bootlin.com>, <linux-i3c@lists.infradead.org>
References: <20260227141149.184980-1-adrian.hunter@intel.com>
 <20260227141149.184980-5-adrian.hunter@intel.com>
 <aaHD2hEUcfji9WKe@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <aaHD2hEUcfji9WKe@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: DU7P191CA0016.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:54e::26) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|DS4PPFC60125F65:EE_
X-MS-Office365-Filtering-Correlation-Id: 13eb5649-951b-43eb-7c7d-08de7837cc60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 03JQEBvd5JsC6madDLDRuSXEx2i0Ttjn2UKpV/E2xsEMtLHyi0bsZCC9NtAxO9tGuva3pjTFsDEEYqs7hiwPQNxmTrvKokBdlAFOua5WqORuEhD0BsYCO1b+CxA393FpdXOywv3xttqQuWLv/mj+OEhstxhwV12ktwnVr7gq8331VP0kn1RIScW72pW2/HD2TBcvBy/XZWHTdwxIt28AD/s3ZPdvxPMcuYxx8uq9GJ2G4u0aG0olfFhrzlN89jV76ibkKBo59ZLbFRf3utF7kA88jqWBgKrd1SxekRm+GnVfYAv9jAU8zz0zxZKXm3jYNZ8fJgnP17+qDtCn9g1RnwZMXoqVVHuE4pBZnlgekIDl3JKc9TPpsgDoHdww+hlXvfdGAFZoW6eXiIgilcNrar4mwcAfvYmYuR8YhRjvSm/YGMLahlJjtYOddGQbYWtGeZXuerFW/Zm5VibOcj3G79r+SulgwO1tRtsv2+nLwNKkDaT4GIy4OB0tRrAN6fbOE0K/NcvNr/yT0k3RdOCXQ3hXaY7H9rsXTXJX/scmRwQZMNO8AET7wty+rYn4Dr0H+oj5xkp74EMVjuBwisvKOHk8m9hriV2t69/ENS2GrD18npUUxaT7oy/aWs0QYZXriPkgWFpZ1agoYleGxgFAI32eHogbV0HBxNXNwAgmyqMkYgrKMn/JgM2Bm1nPMJnuLRZ3nVOeDiCk2ukUZfbG95GrRq7AWsD22jjYBpJotyk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWpIR2VjMVpvYWlqYjZWcXV1TWVkcDg3WlRwMk8zQkRzSTI5aHowUGhpVm1V?=
 =?utf-8?B?VWdMSzdzd1VkSUEzNGNYU3N5WWU5QXU2aTEzdjgrNXVNaHVUdUcxRmUvWkE0?=
 =?utf-8?B?SE4wTW9XRzUxSGdHL01DRHUyZjlIM3dMbE1xWDd3cGYzcmNQWHRMSDBhelRn?=
 =?utf-8?B?eHNxWkg2VVZidWlMOVZXc2hRQ0FDWlRaVklPK2R5N1E4aEVBMEwyT2JwL2ph?=
 =?utf-8?B?WHhYRUVqcHRMRURtMzJzSUtwQWxVZzhrOXp0cG04L1hEa050QW4zRmxWS3c4?=
 =?utf-8?B?MDFlNnV2bDc2L2kxOWEvdUJRTVRIL3k1ZnYwNjlKTXdGeHlwQlZhbG5heWll?=
 =?utf-8?B?V3ZEU055aXBCQmNPU2R3OGFnTVN3bExGNExkeTB2bi9QMnVsbXo5V3Npditv?=
 =?utf-8?B?ekREaFRXZ2dYMmlGelFUZE5KNElCWloza1hZdGx5WFBQdjZ6ZGdVMG1mbU1k?=
 =?utf-8?B?SHhvZFNOcmhwNkZRWmZVMzh2K0lZaktsWDM1SEgzWmQ0V3Fwbzg4OE9GZU9L?=
 =?utf-8?B?MHVEMFFPaTVSRGZlNUM4SUdpc2piUWsyZWZPZXcyVFY5MzVoMDdkWTZvUGRM?=
 =?utf-8?B?dksrbS9KRjRtRFhFcXN5Skt6MTdKNjdPY2U2MnJGbzdnY1lPeUlNc3lqK1lH?=
 =?utf-8?B?WEZ6RzhOYi9uNUxjc3pmRU1wTGVmS3BRa1hyU1BDNStGOXlYaExsbkxmWk1O?=
 =?utf-8?B?ZWk2RVczYnFhcHBOMjhmYWk1Z013WjZaaEhlakt1RENRNE5QMUdaMFArN2hj?=
 =?utf-8?B?aXE5UlhFN3BPaHM2eTVQQSt2SlFzMzhQdFYxT0MwTjVUU2IvQkN1eWZkYTNW?=
 =?utf-8?B?MkF5YXo1QVJ6QXVXY1RMSXhEMmFlZHpUSitXWTVaa09xaTRZT1FxYWkxRXN4?=
 =?utf-8?B?WEhrenp6eHRETmhyQktMM3FmdUlrb21HV1hLQndCbWJjRUNNRlFFRkVwakFR?=
 =?utf-8?B?SDVYYmVZdEhUOUlndXNlU3p3Qkd2V2djcXFuWU51SG1DOXI3RFk1M0ZPUENP?=
 =?utf-8?B?QksvVnQybGNrK0xFRURkczI0cVMxY3JLMnUvQWV2MFRjS1hVaTh1ZVhQZ0NM?=
 =?utf-8?B?M0pWRVk1VVdSaGlzSWJvT0hhdkkzTFUyK2hIVmxTcHhuZGpnNEZBamZNWDEx?=
 =?utf-8?B?cVdpcGlGRG9BOWdVNTFqWEduM3ZaQUhIUnI0Qy9xQTRUd0o5ZytCenQxVE5n?=
 =?utf-8?B?T1FNOUk0MFQvZlVoTTFqSm0xUGpCSHo1T09yM1lxUjc2VDVVV29iM1c2VCtU?=
 =?utf-8?B?aGxMMkNQbHYxUXBURlFGbk5rT2lGdEx6KzhBOGpDOGZPSzNMRENjUDlsU1hJ?=
 =?utf-8?B?ZFFOU2dQanV0RFo1dWlwQ0F5bWdWc0hXQW40ckY5WVZ1Kzl1RTMxQmRKOHZ4?=
 =?utf-8?B?UGR3ODNIRWtnbWFvY0JEVlNGUjFQaU5wc1N6K0tIdTdWYUdOR2Fwb0ZuNXRs?=
 =?utf-8?B?S3N0STRhbE9DMUVWMHh1TWZnajJNQlQxRjdvMDI4ejRTUGpjM2loQWkyRkJa?=
 =?utf-8?B?QlNWK0RqdktrK0dwRXYySFcyazFpK2s5Vzk5NE5lbFRDTWtWSHlPUDgvdEM5?=
 =?utf-8?B?elNpVUsreU1XWGFDS2RzU2FXQjBZS0lyVWZMRzNaNGo4SzZoQUhKMzhzZS90?=
 =?utf-8?B?QjhtNWJWZE5mUmtkb3BGeTRNak5TdWpEZUlJcG55QkJidVFKcDEvemN5a3J5?=
 =?utf-8?B?dTJCMjdUdmo1WkhmZWlJRzl5eE84TytTbTNYcnVnMjJPdEgyaE53QlJSS2ZV?=
 =?utf-8?B?aXVhRy9KdFk2TjViYlBRaG9VT2NsTDNnS3FBcnRwT1FqVHh4RUtHV2gxWWFP?=
 =?utf-8?B?ZEs2VVRlYTJyN29mL1Y3Z3NIRE1xUWhrZExkaHpmZE1lVFpUeTdVT1YzTGJw?=
 =?utf-8?B?V29meldjOWJvazhyMzRGcllKYnB6Nyt2WHhPV2crbU4yanRvT21GQitpc0h6?=
 =?utf-8?B?Vkc4SnFjdTRVajRia1J3bmtSdnBIVnlyTmYvay9NOWNmUUpVcUVQUWw0VGtQ?=
 =?utf-8?B?dUdialRLWGVPWE9TTkxFTEdBYmxKczlYNThkc2Q4clhtZTlyWVR4MzA2T1BP?=
 =?utf-8?B?Q2J0dVFqU3R6U01IU3NFTCtBZnRoanRpdjcraDJZYjNUWjBESlYyWk01amN4?=
 =?utf-8?B?RytnVUpCVHM1Tk0zc05JV3p5M013TEdkVDVLM2NLN1ZZVUpUb1d0bzQyWmhH?=
 =?utf-8?B?VTB3VGs1bnllV2lpeGcwM3dsenpnWTVlWnAzdGIxU0FDYWJyeWJnNElZM253?=
 =?utf-8?B?bXI2N2dya2tEMzZ4NGhWUEtRRnJOaGdXcGlOanVORnB3dmVxZXprQU4vYzhq?=
 =?utf-8?B?MXJMcWNEN2JidmdSZndGWFFKakxjRGhrS0NhWU5CbHlxTDNTRkFlOTc0Z0xH?=
 =?utf-8?Q?tONlJO16Gl2TKKRo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 13eb5649-951b-43eb-7c7d-08de7837cc60
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 08:43:38.4168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gkS63iRZo55bjhGy8kkA+JgFQeoU22ivF6weVBErcgMQ3NGrXk1fBykRaVj9tFqM7+5K+D6Wr6WSD35oowNp9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFC60125F65
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_004342_335405_D15A9943 
X-CRM114-Status: GOOD (  18.41  )
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

On 27/02/2026 18:18, Frank Li wrote:
> On Fri, Feb 27, 2026 at 04:11:41PM +0200, Adrian Hunter wrote:
>> The HCI DMA dequeue path (hci_dma_dequeue_xfer()) may be invoked for
>> multiple transfers that timeout around the same time.  However, the
>> function is not serialized and can race with itself.
>>
>> When a timeout occurs, hci_dma_dequeue_xfer() stops the ring, processes
>> incomplete transfers, and then restarts the ring.  If another timeout
>> triggers a parallel call into the same function, the two instances may
>> interfere with each other - stopping or restarting the ring at unexpected
>> times.
> 
> how to sync with another hci_dma_queue_xfer()?

In theory, so long as the ring remains enabled, it should be possible
to enqueue transfers.

Nevertheless, the use of the ring spin lock is added in "i3c: mipi-i3c-hci:
Fix race between DMA ring dequeue and the interrupt handler".  The same spin
lock is used in hci_dma_queue_xfer().

> 
> Frank
> 
>>
>> Add a mutex so that hci_dma_dequeue_xfer() is serialized with respect to
>> itself.
>>
>> Fixes: 9ad9a52cce282 ("i3c/master: introduce the mipi-i3c-hci driver")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
>> ---
>>  drivers/i3c/master/mipi-i3c-hci/dma.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
>> index f60654fbe58e..5a9af561e4cb 100644
>> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
>> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
>> @@ -133,6 +133,7 @@ struct hci_rh_data {
>>  	struct hci_xfer **src_xfers;
>>  	spinlock_t lock;
>>  	struct completion op_done;
>> +	struct mutex control_mutex;
>>  };
>>
>>  struct hci_rings_data {
>> @@ -347,6 +348,7 @@ static int hci_dma_init(struct i3c_hci *hci)
>>  		rh->regs = hci->base_regs + offset;
>>  		spin_lock_init(&rh->lock);
>>  		init_completion(&rh->op_done);
>> +		mutex_init(&rh->control_mutex);
>>
>>  		rh->xfer_entries = XFER_RING_ENTRIES;
>>
>> @@ -549,6 +551,8 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
>>  	unsigned int i;
>>  	bool did_unqueue = false;
>>
>> +	guard(mutex)(&rh->control_mutex);
>> +
>>  	/* stop the ring */
>>  	rh_reg_write(RING_CONTROL, RING_CTRL_ABORT);
>>  	if (wait_for_completion_timeout(&rh->op_done, HZ) == 0) {
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
