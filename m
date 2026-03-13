Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7068107BCD6
	for <linux-i3c@archiver.kernel.org>; Fri, 13 Mar 2026 18:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=GPpQtOQ3po8/pR8sj2v9TZzzyccDKs5fLCYg9AQUVjA=; b=mpKvZaKpNfaSVhRnT973C1CudZ
	kNwbbSwkPDZ9lPY5usEt2Eb5RPyhde8y6JAx3nykxdEviNQOSZuUx0zUdhbkaaDgOFg0YiidNm3hw
	7sgPQy99YNikxSWr8buhVjAqJvKpdpDe7leF6dDoUfku0O5lgaKnJKTB150I+iSZ5m9EH5wYgPEJZ
	asfWwf/4WlYctsQ8R6YYPpbKCewe5P6Vted6FGgCT0536kdwpHuL+8/dxrzjdEV9FCOjuhsYC/IB7
	sW7dEK8AmItQLOoW5AIsEeKbn2ieMrf1CrIlyhJQc1YP8jcS0XbtjAsgrQmEVgaa81hKlMe2qaGpL
	MvaPLYSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w17Vy-00000000xDq-2LRg;
	Fri, 13 Mar 2026 18:45:38 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w17Vt-00000000xCx-3xSx
	for linux-i3c@lists.infradead.org;
	Fri, 13 Mar 2026 18:45:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773427534; x=1804963534;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wcSmNXh6IPacpziyV6VQDXDs/tvoupMfAUtvtHJPElE=;
  b=adtq6BEceBUq6IpgzVDGl+KUJlaxRCByKhOl7GzgV/mTj2cvuuOfArAA
   kgghTYmySWcaOEVp/dgMqgzgR3Z7Uf1VDTweEwGmYWvp+mcNAsCqe2rDM
   nNB0AZrRwZhMZcewRffDVNThhuYjPl73Aahk6Lvj75ybZHE25KcZ9UhzJ
   qjDDUCWQ1501R0BaZtr1LzA4qpVrHhDWWPFa2HT8L/aT8bsJt6FkOIRJ4
   oQQK2b19ETONKQW6GbpSiI9slfL9tTwnWBFJT6q4mYS1SxDo1BwdrSERp
   knJDcMZze40KAs/ddtN9X/ckxYka+mbOTqFFohHbnLT+fy5bzHCn4hitl
   w==;
X-CSE-ConnectionGUID: jGD7ujFVRaOTEDlV1PRohg==
X-CSE-MsgGUID: OziLKf/KRX+niuhblIvo3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11728"; a="86021000"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="86021000"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 11:45:19 -0700
X-CSE-ConnectionGUID: KpvWnfOLQsypPzo6A5R79g==
X-CSE-MsgGUID: kX41M5RaTCyNQJ7I9SDJqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="217642954"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 11:45:19 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 13 Mar 2026 11:45:18 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 13 Mar 2026 11:45:18 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.64) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 13 Mar 2026 11:45:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IWIr+KHOqznLLVJ9ngqOL1ZTuwY1CkdBbmO/3cVIdb7AEVgI+D4xsv8pHs9nnpB9bGsUEmc1in0hpV4JDLgde8At8/be02/ht+38OIQ8dfl/kOiKO/0y/jgYLwuwZgD8AR9BDWUvWrpQCCi7lvDNZO7rSF+PVtiNsl77n1EjLhAMtal3Brlv2hHMmieaUBMfjfABEyQ+qvhGp7ef/XNYU9jRA+F7rvJInNiVKXtWmlWL4O+vAB8Sd5R4EjoXMdqUlEKfMPSDU1WXfZwI35S7QBVjq6G8OX1QqJUmM+Q+t71GP87XOz8ddpJC57ANEzXJVOexdgPjF+J3sm0JzU4T0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QuVKu4eiT188+mExhk9KwNqcDQhIBx9Majo6xwdE7sw=;
 b=dwnBo0MCwUMAkV1u/WI02671tI2HMZv4TeavsqZa+x/HdQM823xCO5HEeuIfR9x0hIXSpBd2QMP0SctHMIc9sODy1DHwWZHMTbnhIdKMi/Taek131hw+CfKAm0UmJb+rJ+9uXhsKNVGZXF5+FkdWGL1IUcs7GYPLuZD+kJbBqMA4KBFoDlcAJvqwRtlmkUrSrpdHlsz4AdUwPe4YwqCoUMOQE6orLw4XnjsHx3FYKRknUHmWXfQzA/xUTIiBKM1q2bK82UA7GxbtH0rGx8kSRue/mmEKRRQqJG9xlNdW8U87EKqTdOnjb8PPeIG8N6kvxBSupjWJjnEY1Y/tpqNP4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by CH3PR11MB8315.namprd11.prod.outlook.com (2603:10b6:610:17e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.8; Fri, 13 Mar
 2026 18:45:15 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9723.006; Fri, 13 Mar 2026
 18:45:15 +0000
Message-ID: <60121846-a19e-40f4-b626-fecbfce833dc@intel.com>
Date: Fri, 13 Mar 2026 20:45:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] i3c: master: Move bus_init error suppression
To: Jorge Marques <jorge.marques@analog.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>,
	=?UTF-8?Q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>
CC: <linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Dan
 Carpenter" <dan.carpenter@linaro.org>, Jonathan Cameron <jic23@kernel.org>
References: <20260312-ad4062-positive-error-fix-v2-0-1c933b5c7ed8@analog.com>
 <20260312-ad4062-positive-error-fix-v2-3-1c933b5c7ed8@analog.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20260312-ad4062-positive-error-fix-v2-3-1c933b5c7ed8@analog.com>
X-ClientProxiedBy: DU2PR04CA0296.eurprd04.prod.outlook.com
 (2603:10a6:10:28c::31) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|CH3PR11MB8315:EE_
X-MS-Office365-Filtering-Correlation-Id: 831be992-6563-4330-8b48-08de8130aa63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: L2K+mRHFKoAo+sUi60jy+L/6e/AluaQW1xZ7kDqZamn7LDct9fZhFfuGELBOWh6txknjdXreO6ep9D6seRLz67H80tI0f7SQKDnuUeu8f2jsJ28lITrLXbTcozJfr8yoaCyrh20EH3jMQ2G6ijo8DVkVjDgxXJSOcCSItRtYatDejFAoIX/Pho9+FYIN+FyGe8emUytibpJH5I2smBkIbFLpae3Z4wgGAh3Z0ST94Hs9VUHax3V+FQnud8Av7anPQOxpd3WtUmk27KvpKQn3C8vnOy0gqVp4aajre58ErNy9cFIfBQA7l+tvoQxYstMQxXw5OLIuaGtq/riiaj1cRXbtGCIjknUO1FFtBmwgyTGihfdZ/gFNuvjVC7h8sRAviYiB9xRZpvO3UGXlGu4/e7cNYyGJxXYuIyEBPHfCMiOwKLyCiTjeOCPbltY6DuTFAXH0Gw3MVzIEXLIi5Hh3qRv2bDeGgwrOjxFoTLvRLnTChEvad2BIl+C8XHKh0M7HzYDjNx4QCuCf6jWeBgmqccKh1rzufvidqCg6lYZB9wd0WwMZMmO7iiycuds9FJ1Kwefdb+uQcqZsN6b2UDXKzBF5dqa8Fb4w+JdM58TcV2+tJz9lZvZSSNRoK/FUpJvubTbeqCG6bpq8WYiYghoSSb+Ile+AlI7X28mHM0e9vTuU+suFXT9XpZKPHubbLx5qEmGnPbt80NjQk8AGp0dQnIAMx/sQrT40e8e+gCp8MrU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekNad0k5MGs1RXhsM2RrdU03b1Z2UjdxazJSRkhlNmd0Ym5BM01vYkVsRi9s?=
 =?utf-8?B?QXFDZEs5ZXNMWTZvU0tmeFg2RkJuLy9rYkM3S0RMeVRoU083Zm40cFBXY3p6?=
 =?utf-8?B?azdhZURlRUNCUW5VdXdkRHY1OGxmZmExK0t6ZmdwNVpyS3FqOVo4NmdzNzM4?=
 =?utf-8?B?emVla3VQM1lmcGdqRWNaWWpPRFlMTFo1ZHZsaERDdUNHeTl6UEdHYXRzT2Jz?=
 =?utf-8?B?eHYxbURWUlRaTG1rejQrZk52djUyRDFRVTVVQU1HNmJoSC81aysySi9uazA4?=
 =?utf-8?B?Z2VuYkZoS0c2RktBbDAxdDNRSThCaEVUZ0duS1hYanAxMStFUml5RmFZUkwy?=
 =?utf-8?B?UGdtYjZzWS9IVDcvQ3lpeCt0cCtnZkNlVkFaSWJpUWQ1VXN4RlVmdnJjc0ZW?=
 =?utf-8?B?cldYbWRCQXdBMnNaeDlQQ3ZURmZPVkdrcGRBU2lTRVlpc3d1VHI0V0ZrUFlt?=
 =?utf-8?B?SXYxSWsyRUdKczZWUkhta2JyZkdHVzArcUg5eHQ4UFhlblJSb2FCSzhuQUs2?=
 =?utf-8?B?d1JOQTVxMFNzVklCV3pwWUU0VC9PTE1kMVdBSFhWNzZPeU8vbVgyUlQvTmZW?=
 =?utf-8?B?Q1hIR1lEY09WT1dMT3dFK3hsVlNvVVJmYXdla2ZNWUxKaTBRd0FBNjBlMmhy?=
 =?utf-8?B?KzdFL3V6RE9OOElsTlJTUExKT1ExU0dQTmYxSkF1dnl2WUY5cG82MlFZKzJz?=
 =?utf-8?B?SjNpM0E5WExGd011UkRZN0QwU2xuQ05JeDhIQlh0ODVsTVpVMkcyR2pqVG1t?=
 =?utf-8?B?QmN6SnRleGRqcVdNc1dHNk5aYlZKOTNURGE0ZEV1dTVaRlJnbXZHSjByS3M2?=
 =?utf-8?B?RHRhdFgwQk10OUhwK3djWUhXVWpTaEhGbm9hekNmY1J1cnQxaWpyY0ZxQkJo?=
 =?utf-8?B?K3pIWEpoQVdqK0pnUlRCd2xMVnlZVnhRVkNENWt5d1V2ZFNTSWpOYzJZaENs?=
 =?utf-8?B?T1h4b090NytsT0x4TDJuTUlDM0h6WXlZQUgzYU0zYUhOUUtTUVpZd0hRc09C?=
 =?utf-8?B?a3cydE1McmIxQkZUbnAvUDV5aUcvdC81SkJ1Y1RBYXgvaHloZktkV0h5aFQv?=
 =?utf-8?B?K2twQjk5bHNJSzhmNTZYd1RFampEaEt5NHFzMmNma1F1Y2RPRnpKd0hjNnls?=
 =?utf-8?B?cTN0MC9HaC9Pb0U4VzMwM09UTXdwbFN4UEdvSkxHalN2T1JVb3RTOHlxdUVq?=
 =?utf-8?B?YlQyTFJQMFFNbm9LN0JDR2pDL3dsbEczaitPRENDVnZQOFVoSkNEeU1YNDdz?=
 =?utf-8?B?U25odDNUNmUydVRMdnpKRGNGOGNOYzE3NW40R3Y2WER6b0Rabm1JZUE4VGJW?=
 =?utf-8?B?QU5WZmpOUXVnRG80MW1ZQi9GY3dEV29GWGhrNW1DK09CaUJpbXhIZ1pETjNF?=
 =?utf-8?B?d2w4L3VxNWQ3VUxJcllLdmxvWnRQV0VPaUF4b3ZwemYySW1PNC9hZkl3SlhX?=
 =?utf-8?B?TjREazFUTXhFZ01NM3NMZWs5K0ExR3RWb1M2WTZsSmdHalN6MnNaajJLRkZP?=
 =?utf-8?B?Wjg2S3lzd0xweW5peW9zZ0RMWU1JWmNHZ0p4M3hCeXpRT05aZGNSU0UzL3Mz?=
 =?utf-8?B?djNYVXVEbVpBR2RsSGJoTUYzc1B6WnpHaUJ1Z2xJV1dUSlFWTHNDVGNOWEIw?=
 =?utf-8?B?aVExYW0xcDVSY1IvYkNzMklIVmRXdzl5VnMvenFhNk1kZjRwNnc1OTJPRXVt?=
 =?utf-8?B?Y3RPcEJBbnJGeHhkMEt1c0dhNzRJVFBBbC9lb2JVZUgya1BHOW5aT0lOYnRo?=
 =?utf-8?B?aG10RUtVVXhlNjBHOHVuem54TjBBeTJVMjM1dkZiRzQxMUYzaFR3UzBNdlg4?=
 =?utf-8?B?TFJBaVVheVNSMUNYSHRNZ1YwNmlWM2pZb2lMemk2S2ZHaGhzMmgvcmlqanl6?=
 =?utf-8?B?UDVsL3dScG8rbnZJdUZEZXl4SGsyaGdvZVI0cUVUWEpwbkhvOVNZSXRCSzJI?=
 =?utf-8?B?Wk9PY1p1RWxwaVlFR0FzTHRHMmZrd0QzekxRQzFtV2hKWXYycGJUMWQ0OGVl?=
 =?utf-8?B?ZkRkdnhBQ1A5SEVXamdxdmx4ZUxkWkZJWG1ZRTN4RmpCRmhaRGZSUFJjYnNw?=
 =?utf-8?B?VVlzNVgxUFd1VEdEZ2Fkdk84dkdndWRUamx6ZWlXYUducU1IUTVDYjFuRmE1?=
 =?utf-8?B?Ulo2RVNjclNOdHVsUmg3a0ZuWHhWSGhQSmdMU0NON3NkaTI2a3IyV0NjbW9H?=
 =?utf-8?B?WVp3cVZMZk9vdmJPeUNKVjNENmZQaDdvOVd6NTZpcEFjUWhpOWZJUG83TWkz?=
 =?utf-8?B?NDAyY3JTdCtCR3ZjOEIveldSWVFqYXJOZks5Ujg5MnpzZjJoNm0wU2R1dWZZ?=
 =?utf-8?B?SEpoUVhFNGlNOVBQRUlNSFhxejlNWWJ2NEMyditDaitNUWFBeUNGdTIvWUJV?=
 =?utf-8?Q?2c+3ok7stEJamCmQ=3D?=
X-Exchange-RoutingPolicyChecked: KExElP/sGxsM+wU6+an15P89n8prHxzo7Rd+rSPVTqzcudlKwmRKcV2gPOzudwucgi4S1MQcI9qMfB+wCPQPeMhYc/47wk/wvpJaOMtZ7CLdLfuXoofEC1UapsO5EsIMsaUFpCliSC628o3DCcUHvQGlcttzLy1rHqvDPOcqIQcQrSFVxGJQD0xLv+8/Ssrhau0XdYiQcPgL0LIyWfHaPx3Tden3tx9zpxPSCT5d7EX9EKaUOsVVhUusDgmHNSNS14TAIrNwjUSt5EgDjH2YwkS+NAVBznRB/wgeCPit9ZaaevsD2xvf/RVGtmBgfDiuCl3ACf8iFJCtHqEznAjyFQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 831be992-6563-4330-8b48-08de8130aa63
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 18:45:15.3721
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NB9TYW+1cGQ/LivdtawNFqk+asFYSwG6Rtas+AUTtMI4Te+lOaIXnkdrg/lHnViW4HU6t7Cr4NXAaaa56zC0Cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8315
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_114534_081638_974E8BD5 
X-CRM114-Status: GOOD (  22.26  )
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

On 12/03/2026 18:38, Jorge Marques wrote:
> Prepares to fix improper Mx positive error propagation in later commits

Prepares -> Prepare

> by handling Mx error codes where the i3c_ccc_cmd command is allocated.
> The CCC DISEC to broadcast address is invoked with
> i3c_master_enec_disec_locked() and yields error I3C_ERROR_M2 if there
> are no devices active on the bus. This is expected at the bus
> initialization stage, where it is not known yet that there are no active
> devices on the bus. Add bool suppress_m2 argument to
> i3c_master_enec_disec_locked() and update the call site at
> i3c_master_bus_init() with the exact corner case to not require
> propagating positive Mx error codes. Other call site should not suppress
> the error code, for example, if a driver requests to peripheral to
> disable events and the transfer is not acknowledged, this is an error
> and should not proceed.
> 
> Signed-off-by: Jorge Marques <jorge.marques@analog.com>

Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  drivers/i3c/master.c | 23 +++++++++++++++--------
>  1 file changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index d4f9e7df4adc5..bc1189afaed81 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -1059,7 +1059,8 @@ int i3c_master_entdaa_locked(struct i3c_master_controller *master)
>  EXPORT_SYMBOL_GPL(i3c_master_entdaa_locked);
>  
>  static int i3c_master_enec_disec_locked(struct i3c_master_controller *master,
> -					u8 addr, bool enable, u8 evts)
> +					u8 addr, bool enable, u8 evts,
> +					bool suppress_m2)
>  {
>  	struct i3c_ccc_events *events;
>  	struct i3c_ccc_cmd_dest dest;
> @@ -1079,6 +1080,9 @@ static int i3c_master_enec_disec_locked(struct i3c_master_controller *master,
>  	ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
>  	i3c_ccc_cmd_dest_cleanup(&dest);
>  
> +	if (suppress_m2 && ret && cmd.err == I3C_ERROR_M2)
> +		ret = 0;
> +
>  	return ret;
>  }
>  
> @@ -1099,7 +1103,7 @@ static int i3c_master_enec_disec_locked(struct i3c_master_controller *master,
>  int i3c_master_disec_locked(struct i3c_master_controller *master, u8 addr,
>  			    u8 evts)
>  {
> -	return i3c_master_enec_disec_locked(master, addr, false, evts);
> +	return i3c_master_enec_disec_locked(master, addr, false, evts, false);
>  }
>  EXPORT_SYMBOL_GPL(i3c_master_disec_locked);
>  
> @@ -1120,7 +1124,7 @@ EXPORT_SYMBOL_GPL(i3c_master_disec_locked);
>  int i3c_master_enec_locked(struct i3c_master_controller *master, u8 addr,
>  			   u8 evts)
>  {
> -	return i3c_master_enec_disec_locked(master, addr, true, evts);
> +	return i3c_master_enec_disec_locked(master, addr, true, evts, false);
>  }
>  EXPORT_SYMBOL_GPL(i3c_master_enec_locked);
>  
> @@ -2108,11 +2112,14 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
>  			goto err_bus_cleanup;
>  	}
>  
> -	/* Disable all slave events before starting DAA. */
> -	ret = i3c_master_disec_locked(master, I3C_BROADCAST_ADDR,
> -				      I3C_CCC_EVENT_SIR | I3C_CCC_EVENT_MR |
> -				      I3C_CCC_EVENT_HJ);
> -	if (ret && ret != I3C_ERROR_M2)
> +	/*
> +	 * Disable all slave events before starting DAA. When no active device
> +	 * is on the bus, returns Mx error code M2, this error is ignored.
> +	 */
> +	ret = i3c_master_enec_disec_locked(master, I3C_BROADCAST_ADDR, false,
> +					   I3C_CCC_EVENT_SIR | I3C_CCC_EVENT_MR |
> +					   I3C_CCC_EVENT_HJ, true);
> +	if (ret)
>  		goto err_bus_cleanup;
>  
>  	/*
> 


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
