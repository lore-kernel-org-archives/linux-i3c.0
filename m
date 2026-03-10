Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A5D6FD4F16
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Mar 2026 19:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=vFmDSOMQqkoVnDAIl4im+z2zxzeh7bWCwzHNIsquDZ4=; b=XG9THpDv66PU4uXfobDoQbWa1d
	i1I2yk+llKaCxld2QqvPuNKlCDmOPkAS+mSggPUDTbU6iG/9sVNd+UgAtF4diEjB758W2l6SD686z
	GBFWXkl2ao/IeHtrP3Mtf5pd1U1U1jlVzMcE3CI/5ffJJuWmuZCk+IZHWlZ627tMd0ryNSutGo91Z
	bkqoDF79zE6TRG3vY3Ifba9jPi/aY+jRFQwN1CNZPCxl16TTl01EzSxUWmyx8Y2+kLZAp9T6WvVnL
	zucgz3yIAnuzbXI641UZOamQi9V0eN41ZWbPY2tr3Pe9FJIv7SYvgR2AISypmijoN8BejyMQKS/qq
	LtQMuDlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w02YK-0000000AA96-42xq;
	Tue, 10 Mar 2026 19:15:36 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w02YH-0000000AA6s-3YTW
	for linux-i3c@lists.infradead.org;
	Tue, 10 Mar 2026 19:15:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773170133; x=1804706133;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=RXNKxtLF+umG7P7QLgC/id1qTuMdZEBo0dUWVL2m7sM=;
  b=FI+ahf75u/bDrSpHcLGKMHd3VREd8zvQ7nfNZLjiV9VmpT7FPfOMaJZW
   Og4NKZ0GrsT8Kd1cRX1lksRApOKizhU9+2YKq/pzkDAnVW9cO53SsblaY
   7VtHhBfHMz/gm+W5J/kvdmbcwvZ+Sfb3dUPM5CcNw1Q48L/lJQ+fsUiKc
   qXbgHPJnLrTfKSH4QyGNw8LMkcJ0kyKPC40oQ4KfG/yDyVuO4vKtoFQ6n
   qGnh/BXr5WwLMTnwje3odEN1c4ICb7Nvu+h7sY715ya4MiLCGB5PCQsiF
   OATmLGkWMH0dlNoYnNYGXgg7JxGDu5G37/F/JqfhbMX9Mqkv6DhlAncB1
   Q==;
X-CSE-ConnectionGUID: 9DSrk17WTBKsuCH8/BCtLg==
X-CSE-MsgGUID: rAB9WRjDQYOUeQifzGEgTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="77832987"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="77832987"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 12:15:33 -0700
X-CSE-ConnectionGUID: tN9cHbzOSLmgFZS4zNsHSw==
X-CSE-MsgGUID: w22J71zKRVerJ1gkFvNLsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="225173389"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 12:15:33 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 12:15:32 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 10 Mar 2026 12:15:32 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.46) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 12:15:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vx3pGaIj2+Ul5UH3AqbC5Hu+F0YNBhpU3WoF8kMpgEyUzzbi89juTfPsNcYTXy/QSqVBNk7UFhODZuuaLf4YO3qyXIrczIm5lZU4x1MSymAlCBWsdvU7hNpOQEdBfeUnMW/JZGfGqPBNHjhFvyApKPRwFuAyIsYVRxmBRXHfh2RNtb9QIEUCiRWFvjMuLf14xGJ38ZQsupxAWRWNIM7MEFixZcaD4dZ7RFwtTng1Mys96ZsbQi9hudULIBbzh+S58Ql8Va8G3mFXDpp0qFcYSbDSXYHqdqC0OnfLOaXL4cfjO3Obl2xwG3dvZofyMvjt/dktVv7oi2sArqkW94lg4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BqiyT7PhmNbkBk/iMjWlp4CctomG3Q7fJe5UE+uc88E=;
 b=qVgfDBb39YzAzN6tXdY4MYncJ1r1fmGVJfhf+SfVybuMf/CUmx8uj0iEdrveHKoOdUBUevQgVGFr5zb6INbwCTiNy+o70Ggk7IR7hKsLFLaoL1Q1yryoseEUo5LYxh5dsSDgoLQaHoGGUaxxeJFi5kue13bAN8lhI17yKCNS8UENWKDuILPXvlRLL9FqLOXBzQ9ZQVGCGQgJuI+JAw9UO5AWAjhxwVRAF7F5/FRsWcZ+zYlSsWj9udcyMblEbgERJRzE5j4YLlg7soJQcLW72yvw65BYZOP6dHyUEc7nV+qZsxgkuaGdgnHUOZ/AMWvNbXU3RMyQGbH+j8LzwxFo9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by SN7PR11MB6679.namprd11.prod.outlook.com (2603:10b6:806:269::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 19:15:29 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 19:15:29 +0000
Message-ID: <4c9037bc-52ee-466a-83e4-113496cad016@intel.com>
Date: Tue, 10 Mar 2026 21:15:25 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] i3c: master: adi: Return xfer->ret at send CCC
To: Jorge Marques <jorge.marques@analog.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>,
	=?UTF-8?Q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>
CC: <linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Dan
 Carpenter" <dan.carpenter@linaro.org>, Jonathan Cameron <jic23@kernel.org>
References: <20260308-ad4062-positive-error-fix-v1-0-72d3c5290b4a@analog.com>
 <20260308-ad4062-positive-error-fix-v1-5-72d3c5290b4a@analog.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20260308-ad4062-positive-error-fix-v1-5-72d3c5290b4a@analog.com>
X-ClientProxiedBy: DUZPR01CA0320.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::16) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|SN7PR11MB6679:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ea771b6-35a9-43be-db13-08de7ed9647c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: txryOXOekVbGc32qkD9M6IrruDtAEmHbAIO0MKNVXKy5ESqlA9UUuQ1zUi3fx87W3nJLINLNowgMOkjfrWGL7eSA9M3fWDFLhqeJhL47tWUtt1ssma30u7d7yDZ7Q4+fjdxEO6LrEioyw7UmC2iWnokwDpHxubmPAwR//rOolbW8KYGNCTLuhQs+Id9QqzIJLPzkcg7k/5qyzgwE81YhnhvzAZ20tNQe+dAi7vjKDyAxfx0DHhGaUUlP+JkpZihibnWYWsL4WtGQiMo1FCH1eoT+SB6YopSmHZNmS6mIWnW3KZKvWoTUVvZBpt7EumDoBi1Amkf5b7UA950mSJqT+YNaUuJ2pIzLAcGMr67iWZ4bN3h6d5G5eWfYKaAr4JYXp1s+mcuiiRLDzqjCLAQli2nWzL3EBPplcql1ORpPh+LGXFrbGN6LhaCRFfLd6GE5MSDrrTfvxF35xFjzHEGa/AtWokgnFpd5OgKg82q0BAmo/V0pXT8fPyhJK5IIsHrQllfM2il9wf2hszXO+vPUVtOfjB3MWuMEYULoCDTDpJvSUekBrKdxsiGb3uTNCLsFbaZpbf2KkufzY7X0SjGtXENOXmwSXW13YzqUEFb0L832omHjVpAQMNePZXcJP7ssO5JOn7lPjASX4BTC2ekZvoGRlXTz/Th/XCkDIQrP35MXSpJuJo4o3XK+rbRv3XkIZ0lyedIFQXg1bAk2qDgcznUK5OfN0egkcqGyDpSv2bY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2tGZkVjK3JDcFVrMEFqYmtxV3RDZEhvaXlpYTBJbUgremR5WDRjTG9uVndy?=
 =?utf-8?B?d0hpazFTZ1BsdVRpUmVucVNFakxwejRLWUsvZWFQUGZ1TmFuRkllcTVlT3pR?=
 =?utf-8?B?VEJQbDdzSTgrZGZDNnNwRWhnS0VVejFLYW16dDJlK3lpWlVCSnIxY21TNkg1?=
 =?utf-8?B?NWV2TFZwbjF4MDZQWVcvWWs5SUI1a3pTTzR1aTJUOE1pU01LWHBEZ0VzL245?=
 =?utf-8?B?VUZqNW5EMWd5QXZLNVpvczd1UEpuUzNMU1pqTXlsb1haeUJPU0Y4YnNyTFNi?=
 =?utf-8?B?WmhWOVY3dmtDTGR6ZEdKaU5nVGRIekFtK0RtdDRPRkZnWUdGQkxsRlpVNUQw?=
 =?utf-8?B?ZXZFVDBlMGwyYnEvajdabWwrSVZnUGk0ZnVYTDAwMHg5MzQrYzk3ZVFKUHZo?=
 =?utf-8?B?OW9CZCs4dzZscVoraXRPblExM0NyRG5jRkRYV0FsanBMRHJKQ3c1ZzRjV2Qy?=
 =?utf-8?B?RWhBR29BUjc5NFVCYTB4MUdMTTQrYUdTRUVQbjNNbHp6WVBXT0N1MUFNNVFG?=
 =?utf-8?B?SGorTHQ5cFZqZ1NsQWZUVHhtd3Z4bnh1VmpBU01nRnJpT09hMTZZQmg1VmVW?=
 =?utf-8?B?amhGd0xlWjdsUE1hZWg0eVRYemEzYzduTjEzSmhYRVRjR2dFRlpsS05YMWpF?=
 =?utf-8?B?eGxOM3F1bnp4OTlITHdVSUVwTFpXZHZ6VEFrbnpnMkJLWjNvMVo5NlVuTjRK?=
 =?utf-8?B?TlJSS3RobGlYem1mbUJqQXVodUpNS0dTVUhHbjJMSW1LZHNUVlI0MmxsZElo?=
 =?utf-8?B?TnphbDN0a01od3NNdUZjTzhIeU8zMmthWmpuakJERjUyb3REQ2pTVHdYQUNl?=
 =?utf-8?B?eGUzQWhnQ2lOWjgwR2lnaFJWQ01yVDZYYjJaTXlTNHl0eXcxVDF6SktqbGZS?=
 =?utf-8?B?T3RZaDlWbkREQ0dlU2VzV2U2QWRaL1VCaUY3VThBZzg5MFNUWDRMYnFnR2Y5?=
 =?utf-8?B?MHpralFJTUVNb0ozNWduZjhKbnlwMENGalRWMnUrb2dZQXdjVENqaCtqR09w?=
 =?utf-8?B?a01VUllIRkZQSWZqdEwzOU1HTHdoOHhoZ1kxb1g0enNNMSsxWlNLRjJHOHJX?=
 =?utf-8?B?eHJxSXZERk05cjhyTkw5VVcxZTdSSTFxUEdGalpFS1l4SEVvbEIyRWU4NWlt?=
 =?utf-8?B?YlF3YWh2ajV3S1Q5TVp5c2QxVE1OSWdDekxnemtGQU4xTTBWMWswY2FjUTRL?=
 =?utf-8?B?dDM4UnIwUTF4TE56UlRRbFBQc1NiYUlpaUE5eG1TSno0VURmRTNNeXBXODls?=
 =?utf-8?B?Y29tb01OREllMHpqSjE5NUh4MHdYZENNZG1xbGpTQVptMXRRSXFXcldUbXgv?=
 =?utf-8?B?VEsrK01FZ042MndIczdQK0pTREZDcXFMMXJvOEN5ZUgzdVFadUJzczdXbHVo?=
 =?utf-8?B?aVBQdFd2ZFFCNEd2R29iRkZWS29RREh6dGhjUUNTSm5jbWdyZHRoV0lTKzVo?=
 =?utf-8?B?L09LU0dWL3dVVGI4UnM5dDA0aFdqYU1jWWJQSkdSZlFiYXNJZ0JzMDA2OC83?=
 =?utf-8?B?SVVWZ2JsUjRFZC9nWExyb0c1Zm01dWpWaUxpdVdaVmVqQnFGdXdRYWFvdlFm?=
 =?utf-8?B?VjRQQmMwZTdSRVdFTWYrRFFOTmhjSnVQNTZLODBvaVBrWlZIVlV0dU5QOUFF?=
 =?utf-8?B?b0hMeVNDc0owSGdWcWhJWDdzWkUwZ1M4Z1YxOWttMmlIaW83YlJQbVlUZ2xk?=
 =?utf-8?B?TVBxYWU5ZmRMZit6a0FKTGV6c1A4M0I1T09MTlFTQjRnSHVpK3N6SWFyMDRs?=
 =?utf-8?B?MStkWERKa1JWS1ZmNnlJMjBvUWtobjBYK0JpRnJET2pTL2FxbGh1bytIbVB0?=
 =?utf-8?B?ZHJZaWZvbTJiNWdnWVdvQU00S25QOG4zbERRYVJjaHpyZkM1MHFIYVMzTUxZ?=
 =?utf-8?B?TWJ3WWRRb1RpMmVEemVWT1czYkZjRGVrNjFtV1c3Nk1qNUdRTE1sRjdWZjBO?=
 =?utf-8?B?ZTc3b094QW16WFBLUHlHdmY5aldpZHRweW1Wa29CaG9QRGJrdit3RWxUYm9Q?=
 =?utf-8?B?SExlNjBrU1YvRHhDWEZhZTl5MS9pZEtnZ21TYWpIMkpGby80aGZSR1pDSUVB?=
 =?utf-8?B?SGE0N2h4Vk15YVc0d1plQWFvTXZ0eGwzRTBVOFNiQXhQVkZiVTBpaTAxQ3Y1?=
 =?utf-8?B?b0w3ak84WlNFWE5DMHExbHN5emFaMmJzdVpRS2VtTHJIYWtKVlU1emswM213?=
 =?utf-8?B?QlNYeVpLOXJhaW9nMmNZNHNiWW82V1lYVUxQU2pZQ3IrYThiSUt1RElHVGVN?=
 =?utf-8?B?eGFmd0RwTUJqTUxOMDhCeDNTZFZTSHlVLzV1bWZNRXdrclFQd3o2SitrSGZZ?=
 =?utf-8?B?QWNKeGMwVDZUbmI0NWlLcmVSRGJBZURjWWl4R1lMeGxnUjBXU1dkZWtOTm5X?=
 =?utf-8?Q?q8pcd4q9CINYbuaw=3D?=
X-Exchange-RoutingPolicyChecked: hXPXV6SxOOQjj8eRyjwOmYr/3mOqW12i12GfvN5NHwDsDcUgIyIUMDif4t28NLj6JyfTzoRdHKwr/s1MurwST7ASSeEjHrjuFHGA2Gsa5rxOesWfckMaFP6/3A5zgARLvPQaBpSBObNxAKpF8WMOD3s1RyE9js98V9ZhbRxY/HEkiUpc1DrSpnTy8mavvr1wkrUrvNvL545BAjG2SXQ+OVnZo8nHIj6iqlbU+T3vYSi0mMX4/OZSgyudICgv9Oac/G40MzGllM1ojsJhfAaX/HKdngT7IUHIz2NATzzrWCTtRV66aGjLeDBizChxiZAfe1nfKLN04yGf7NN6BmpMLQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ea771b6-35a9-43be-db13-08de7ed9647c
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 19:15:29.4878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aCwZcb/EKgcIsU8R3UvBgNDtVxYoTJnGk+5ilxQQWPeiY5tcwoVVOnGZXBJCvDFA22xRE3r4Z+UG6uXusm94gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6679
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_121533_951350_30688B1F 
X-CRM114-Status: GOOD (  14.77  )
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
> Return the xfer-> ret error code at adi_i3c_master_send_ccc_cmd to
> propagate the adi_i3c_master_end_xfer_locked value. In particular, if
> any of the Mx values are present in the sent commands, returns -EIO.

Isn't this also a bug fix.   I suggest a fixes tag and
better commit message e.g.

  i3c: master: adi: Fix missing error propagation for CCC commands

  adi_i3c_master_send_ccc_cmd() always returned 0, ignoring the transfer
  result populated in the completion path. As a consequence, CCC command
  errors - such as those reported by adi_i3c_master_end_xfer_locked() - were
  silently dropped.

  Fix this by returning xfer->ret so that callers correctly receive any
  transfer error codes.

By the way, I don't see an error code being set in the timeout case?

> 
> Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> ---
>  drivers/i3c/master/adi-i3c-master.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i3c/master/adi-i3c-master.c b/drivers/i3c/master/adi-i3c-master.c
> index fb9a48830446..047081c9f064 100644
> --- a/drivers/i3c/master/adi-i3c-master.c
> +++ b/drivers/i3c/master/adi-i3c-master.c
> @@ -361,7 +361,7 @@ static int adi_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
>  
>  	cmd->err = adi_i3c_cmd_get_err(&xfer->cmds[0]);
>  
> -	return 0;
> +	return xfer->ret;
>  }
>  
>  static int adi_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
> 


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
