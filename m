Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D1FD73E83
	for <linux-i3c@archiver.kernel.org>; Thu, 29 Jan 2026 20:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=uYJjA+gEb050D9uo0u4UEBeSeQkeM3/kFI/pyr6LY6s=; b=ZUTEIuDqxL0svBAGePj2O7UeIG
	f5mkp4w627KPwTbzvNt7PYctchfOjjiX3SiaZSozyO3qP/HL7EMKWoBsQTg6gNfJDRhKhIrudG9x9
	XNT8R9caG09pGQ/d3+APMiijWrLiW1A+6VAJyZadxD3DpmwWth0KWFp8Zwgzs2YxAo4KOauZI14x2
	3/4yMSDUMq+3GlDs2ujZyKCvSnCXa5cjU/xwHC71nAhyVm9zYwwHCO57C7zzBm1IclF+52jHBy8q7
	yZwxsrdWmiMGzZ/ONDA2cqHhB5mMFXuD9rRQf4Nf4B5DplHP36/oSko7ClNiCcsmM7AIQazZlwY9V
	WLoJkeCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlYd1-00000000c78-3t3H;
	Thu, 29 Jan 2026 20:28:35 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlYcz-00000000c6k-1HQl
	for linux-i3c@lists.infradead.org;
	Thu, 29 Jan 2026 20:28:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769718513; x=1801254513;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=PVD6YbVGAtn+YSbiix/j/io1xtuVNUC0DzAnE+mkUOA=;
  b=oAR7DsRAlQmtctDztpe9CWwjRM2dEUeFDNzJe6g1XET8LcNY0xak/Tg+
   5t4aat4uoGd6KobnTzgsSLw37TFJtc9qVO8jKx9meoIAN+co2LInOF47Z
   Fcgc+X1/9WHtSxLk/X2olU+ssoEq0Gv2ED69sg6CE+GkXbRSCzlTDmfKg
   Em9MwpDOcVet30xypQH5bHiAzdJpoc4gi1KrsHQI0QI2SEtc0dekORsJi
   PQ04E4eoXnEdZ67lSIoqkW4jEiJzisirFslJVt+BEdfyX95/2bU0jI/Jo
   cdSSHH9xrBlDpghS/PNflAnvtQcLT5IZo2Zv+xjdUp4mVc8jLpP3I944j
   g==;
X-CSE-ConnectionGUID: gBTjXgCwTSivI96SX3wSFw==
X-CSE-MsgGUID: zzVzsbwuSyyuY/hRvpm83Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="88543298"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="88543298"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 12:28:32 -0800
X-CSE-ConnectionGUID: 3BRp5zdBQpuaRIzAAWqrpA==
X-CSE-MsgGUID: dbi3fmm4Rj6PzdFpE7ijMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="208587382"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 12:28:31 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 12:28:30 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 29 Jan 2026 12:28:30 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.47) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 12:28:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SHBHPhDIotQ4ejZky95OmKBNrT6Z3Zef+xsgyKRPyt+ZJ5oV2mexPiyv901/vDTYoPlFTA66UZQSEH4X6hCriRABg2+veh2eIW7LLkHA7pMvFlYaSonKyddukX7A15P3wvKmWUeV3WwoqdnLeAflznzMeHPzKO6l8nH71C1OimBjD2rxNP55zddnsXNnzeYCqgFH1KWzgNU1XWdq9rX892dfm/AvIJ8ZwnutDyuiTyQBlopGJt6reMMr2O2PesNrqEnZXtieyzttBbTnGLyIVAgss8/osDnbS+SQRpKrC3n3pRZnDkaS6g5iIyREknWjSL3INclCTu7YrvPqUgYE2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d7jcPr1ZgexATUkrDN5V+08atRsRU4rC3A6uT2K12to=;
 b=mHuKtjbfvxADC/++IAhAHTffD1xTlRJGxLTqURYmwurQaHPIfgoGlqy0n9SjJvS19PVsp2P12DbF0uqEAq2xasl3+1/OyYQnF04cLl4YuK05zx+4A6F9OI4+LR/QURy03ed/+bcy4I7yWR1mZiza1/ep9t7Z4hnCD01fGHfeonZUR8Y9irWUty9PHabPH01IQapv0xxHKbw6Gx+uU8o3pJwF4xKLaFFJuEJQ37pL6kVE1fJZlXdeKTDytZlWzor08uAJS9u+wi1TYH417yDlA/YJeU5Vs/CtdotyZWdYd4QA4Q3Fe7PxKvAYawkRl7gE7kVcHiOjyO/FMxxRpfSbAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7215.namprd11.prod.outlook.com (2603:10b6:8:13a::13)
 by DM3PPF63A6024A9.namprd11.prod.outlook.com (2603:10b6:f:fc00::f27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 20:28:22 +0000
Received: from DS0PR11MB7215.namprd11.prod.outlook.com
 ([fe80::9201:63e9:3175:5392]) by DS0PR11MB7215.namprd11.prod.outlook.com
 ([fe80::9201:63e9:3175:5392%6]) with mapi id 15.20.9564.010; Thu, 29 Jan 2026
 20:28:22 +0000
Message-ID: <dd681a97-de37-436b-b09e-5173c1de2f24@intel.com>
Date: Thu, 29 Jan 2026 22:28:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] i3c: mipi-i3c-hci: Allow parent to manage runtime PM
To: Frank Li <Frank.li@nxp.com>
CC: <alexandre.belloni@bootlin.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>
References: <20260129181841.130864-1-adrian.hunter@intel.com>
 <20260129181841.130864-6-adrian.hunter@intel.com>
 <aXu8TiFpMiIVk5Iq@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <aXu8TiFpMiIVk5Iq@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: DU2P250CA0029.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:231::34) To DS0PR11MB7215.namprd11.prod.outlook.com
 (2603:10b6:8:13a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7215:EE_|DM3PPF63A6024A9:EE_
X-MS-Office365-Filtering-Correlation-Id: f59840a1-f7d8-4603-a841-08de5f74f23e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eXMycXEwZXgwQVpuRW1IWmxWZVI0K3MzczRIeTdDT2wvbGd2RkZjVTVSMFYv?=
 =?utf-8?B?ODRYWFl2Mjc4dFFKME9aR0JVQ3FRU012Qi80TzYzdWg4cTBoVDVHVTFQYVBP?=
 =?utf-8?B?R253anNtQlhib3Z4YVRHaDZhY0tIRFhGK3FjazEzZHZ2RnN1MkxSWHdZc2xF?=
 =?utf-8?B?R3d2dm53MzBLMGpvNkZvTTFuR3FhN1FEMkJOaEhERGdXYUY5WXc1Nm9VSUpj?=
 =?utf-8?B?VUZXZ09UV1lHcjI3bmtrWDQwZ0N6OVA0NWRyemNGbTlGb1FnRjgxSTROa0FE?=
 =?utf-8?B?eDlrQ2dQWDRid3JuUjN1cjJpMFdielZZVElFK2JkZnV6MVBLQUpYMVVDR0hH?=
 =?utf-8?B?ZnkyeFArT2N3b1Z4WW91V2Q5eVRCSlg2ZVVJU0hNMDFBWjZ4bWRiZXBkOXBt?=
 =?utf-8?B?ZVNORFBzaW9Md1Q5b1ovaHlTQlhuaE0rQ2dkQUk4WUtNMU1XR01rOUhVbHJa?=
 =?utf-8?B?SWxuSFZxV0RWcGVSRXBzdWMycXBDM2RLREdldTFsdVNxWU8wSjl2WVBZRmY2?=
 =?utf-8?B?SlZleSt1aGxaQXA4V1Rja0dGYjVRMlByWTlKZkh2TTB4dlRoY3puVUdRcis3?=
 =?utf-8?B?dDExZjdGdWNVYlNKb3ZTTjlZNzA3Q3hhYXRtNDEwZUdOby9YWXRxQm50NXEr?=
 =?utf-8?B?TktnclJaRVRrKzk5M1R1UCtNY21JSDBnRWlvL2JSc05Vc0JYR0I0WUJqeTRt?=
 =?utf-8?B?ejZ2cmt1ZnhCY0VZVGlXZ1RyYStHYnU1VThFWlg3N3Y2Mm5wNkQ4SklNYi9w?=
 =?utf-8?B?cUFRUVhPZHFIbEVROCtURzFuT1ZZNjZvQm03a3VhaDFBa25uRTJDSFdOczlC?=
 =?utf-8?B?YU9OdzJSS1c5NndmWGQxaVJtd0RLUGV1TUJpVVJiczQzUGkvazZmeG9remZ2?=
 =?utf-8?B?Tzg1WS9YbFVJTW40VHp4eE8yZHZ5d3NIaDQ2ekxNNENoVVZuV3poNU0wenh1?=
 =?utf-8?B?TExEZ1VwSWxGelJTRTU1YWloWVZrVG5sc1FpYnJEbEVvemxMYWE1VGVqa3dN?=
 =?utf-8?B?KzZ1TDlBeVdhU3laNktITzZEREMzSEFNRU1XVXRqYWdlSWliU0ZpaG5PVjBB?=
 =?utf-8?B?WEk1THJtRGx3bWFERHlBcUYxR3JWVkVHc0dFL1BuRkhrVy93OFhUdnRsc3Jz?=
 =?utf-8?B?Q1MrdkRYd1VSeXM5d3ZCNDRSM3hla0dRTE5NYWRTcWZVck5IN3Y5RHBYOVdn?=
 =?utf-8?B?c1pSVHZacHpMZnVQTERoeld1ZytmNkd5ZjZkQnVlWEZaKzA3L1pTWk81Q3U0?=
 =?utf-8?B?WnJqSXVrekZUTVlWSS80ZU9nVDlMYWhIaGw0QU5aZGF2bVNHNUlrZEp6aFNz?=
 =?utf-8?B?dHZRYWF5aUN6anowN0U0eEx1TzhJZ3RCeDJDSktEa01rdVdzL0w4T3hrVnh0?=
 =?utf-8?B?N2dMYndoUXd3T25nOVBLK1RYUGlDRFg0N3JVOEh6QXdVckxnYjl5S1hYNWpF?=
 =?utf-8?B?Y1FLNlhNOGNJMzZEb1lva1VGdEdxOTZhclh2Wmc4SHc4UFNhT0NhT0NjZnFp?=
 =?utf-8?B?bHJLZWl5MnNkUTRUeUtPZGlabHZSU2NGWXBWeFprNllqaERodlVJTW1uNmwr?=
 =?utf-8?B?cEJoNG1LSkV4a0xKd2lGTytES3hxT2lZam9zR1ZnRDRyQmd0TlNuUXBweW9U?=
 =?utf-8?B?SUlQc0tLQUFYUjliUENvVW9yMVpOYUpTam1GRUpyK1RYR3BTd2tveUt3cXc3?=
 =?utf-8?B?ZFlqRXAvaUdWaWhEZFQvd0k1Y0l5ZUI5NE9MMEpvdlhuQUFWVzUxK2dJRFBX?=
 =?utf-8?B?ZVNRZUtxc2cvaUtJamM3YWc5UktZQ2hnN3JybTFhOWNsckhVQ1YrVTJ4K2ZG?=
 =?utf-8?B?c2w1dWx1SW1SS1MzNVpYbjg5SUR1YktLcTRjN1VDd1l4ZHQ1aW1DR1ZaWHpS?=
 =?utf-8?B?Z0NaTHRybHo0UFBMZVJZOTVaRisvOU44WFRTUUE4V0hZNnF3bzVkOGVzeDRH?=
 =?utf-8?B?OS8rWmg0RFkvUXkvcjY0UHNTLzY4dGViakdBaTN6MUROdVEzUnRacVBTcWtV?=
 =?utf-8?B?N3B4THl6K0I4eHRFcVMweEhGS2pqRlkrQ0MzR3pSTGxnTkJtL1B4MUkzL3Fo?=
 =?utf-8?B?N0h0K09LOHNtS2ZjRnVSQnRNTlNXaU9XazJUQXhQTXNqMTlheXlnVHRQeldz?=
 =?utf-8?Q?4p/Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7215.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkZpSFFDZU1ZREt6NkRPOXVJMkpaNmpvQzYwODd6QXFxYldYeFBuYnJGTGVr?=
 =?utf-8?B?MDN4VElBSHN5R3JYT0NMc3RRdGVmR3FVbUdLN0RiUUFsdVJlTXRaY2o3Tmda?=
 =?utf-8?B?ZUJyRWp6RWRiVUJOWFJackwwUTUwNW1TcTVONndOaGhET0hLOTZrWXpwYm40?=
 =?utf-8?B?cDg0Yk55WnN3TFZsVldXMHJNaUVsOXhoVklkRm5SalF0d29ZOE5FcVpKTnBN?=
 =?utf-8?B?Skt1NmkrdW82SGh3S0RmamwzeFBVeEVCUTZBckJBN1l4MWU5dEdCUnlUcWxE?=
 =?utf-8?B?VDRRM1QrSmNEYWs0dnMwKzlzeGVNWXNPa2JYUEdsRlhldG5DOGFXL2dEV0lC?=
 =?utf-8?B?QUV6VlUyQjIzV3oreGVLV1FJSVJIT2h4WnRyOHRaUUhQUE1jMVFFcEhBUkxG?=
 =?utf-8?B?aEJrbWxXemQ0M01NdVVBaWtSTEdjalVSMGU1d29HYXBSMGRhcE45YWJoZ1BV?=
 =?utf-8?B?YWg3REx6UEppTFZqWUNXRWZrK3VLSGVId0JjMlQ2Rm9hM1h1UHM4UzBqcnRI?=
 =?utf-8?B?K2FDcjIrRGRsaTh1U29SWnBwR2pkam5CWU4yN3ZQdUZheXJjZDNpaEp5WTdT?=
 =?utf-8?B?NEpFbGlmdHhKaFpvblpZNEwvS3I1UGtzTUxYVG1TTkg2bVZkY29FUlNHVzQz?=
 =?utf-8?B?V1VBVWYzYXhDdTAwaUJhN1JZalhYRmdPdlVIdUNPL2czT1ZuZVllRUh3ek9F?=
 =?utf-8?B?d3FmUDErT3YwMmNoaEZxTVpvdU9CbEViN2M5clYrMldGL0tCY3ZqOFNCZm8r?=
 =?utf-8?B?a012U1psZk5oZ1ZsR2xldzlLZUp1Z3B4N21KNWczOFZxNGlRanVES2JYS1Q2?=
 =?utf-8?B?N29JRHh0Mk1HNEs2TFVlZ2hNYVZtcnlhVFBnSmlteGJQQ0E3anYxZlFHeldi?=
 =?utf-8?B?TUdwRnRReVVvSDBFTkFIUTJrWXVXMkQvaDZTdURON1BWUjRENjVINDNSRUk5?=
 =?utf-8?B?VWZPZndWd1ZwKytJMGZJY0dLditrNGtoOGVUQmZSWmh4VzZLYU9sZG1qZFdC?=
 =?utf-8?B?TDhuN05qOHdtRUhyQUR4WnA5M2JWY0oyaWJNRlErU2pYTFplZkZpbUxrREpT?=
 =?utf-8?B?U25xN01CYVBaQnh5WnExSlVmZ29wMVV4QTZ2N3FaQ1V3NTFuaFFiNDFNM25z?=
 =?utf-8?B?cXIwcURwYmFRd0NtcEtKeHFyeFNxdkxoby95ZmRtMHZoN1ZhYnJHbm9XWVVW?=
 =?utf-8?B?Ukp1dGhvSUdnTmxpRTI0SWpPNkRLRXF6SlEyWVZjbU9GM04vYTVjeC95WkRW?=
 =?utf-8?B?cWFya3dsdXZhMjNRV0JrcjYyZzFvbWxRTktlZEtpMXYyeUpHUHg0Uk1LZGFW?=
 =?utf-8?B?cS9EQjJHcFM3aitDenB1Tytqb2ozSUF3Z1hYY0g4dHNTUGhVTFZGcmQwT3lx?=
 =?utf-8?B?Z1A2eG9URmRIYlFlOU16MHdmaDdXNERyOEhzUUpLRkhpSUJYbUlNNHdzS2hJ?=
 =?utf-8?B?S3ZQTzBGaktoT1I4Tmp2amJ1M0ZleFBQS0EwNkc0aFUyR3B1SDVmTWoyaFND?=
 =?utf-8?B?d2l1Q01iZHFZdG5neXZVWkZzY0tXWnBOTk15WTJJeUJUR0hQYUdmQ2pjTEc1?=
 =?utf-8?B?UmpqcXlQWHkvdlF5Z2NuUkxBQklNRHU5TTVhb3BaYzZ4TGxxTXFlSGlxajhL?=
 =?utf-8?B?MWxQeWNXeGRaOGJpQnpIcGpKTzRQRUdLTXRHRGdITzNyUVNnVWhEcXZ3NnJX?=
 =?utf-8?B?Vk9wOFVGcDRDSEI5Q0hOWVZ2NGRWN1lZbHh1b0pROXpuMjduM0NpMDBuVTR3?=
 =?utf-8?B?YVdHbTFjR0I1YWxDWDQycWV4NlA3VjJnY01VUkp3ZE9acUxsV0ZwSHNCNmEr?=
 =?utf-8?B?cUJVd3RDMnJwSlpYcEluZm0rQlYxRUpNL21WU2s0eDBpM29IWGp4bjdQOHVJ?=
 =?utf-8?B?TkR0Q01kUlA4cWhwNE85UWFhZEtTMEhFTWRnb1NzWW1TVHZMWU5WVEhxMXoz?=
 =?utf-8?B?SHlTZzFXWi96Z0ZnbzE0b2tVaGd6cXN4RDhCd0ZwalhWMWgxRCtZZDJSRll6?=
 =?utf-8?B?QzdKNDl1dkdpaG1EOWxjcVBTbnQ4WWtvZ05rcUd6bzJ0N29pTE9mRkQ0VUYx?=
 =?utf-8?B?MXpMbElSNklCVjY0dDFMc3lwRW5iempUOGdtTm9Wb1phOXRTSmpnRmd3azRG?=
 =?utf-8?B?a0gzd04wMXJ1aEZQKzg3VmVHeHFMQTJURjdIUms2TWFibGVMcHovU2J5cGt2?=
 =?utf-8?B?M3BRbUdveGJ3K1c1UzBXcnFJSUlFYVAwcE40bnBzdTFSdVpRQ0d5YlVXS3lB?=
 =?utf-8?B?Tmo4N2pQY0s5Zlg1UWcvNEFIWTk3dEdaSkIzdFppY05rYTVmcWtDWWU0ZTFL?=
 =?utf-8?B?Tmp2VEZxb1lkTjl5YWFUeDZVSDVyb285VVNwU3VqbW4wME43UXhrZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f59840a1-f7d8-4603-a841-08de5f74f23e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7215.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 20:28:22.0440
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VUqdzADtJy5DFdAxjChe1rktAbXbvXKGAwrWR2vqayyZMgUQ7b/3mIpWbGErTChZT+Il96/H3bG9a56WIKdlBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF63A6024A9
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_122833_409711_9C124D13 
X-CRM114-Status: GOOD (  18.68  )
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

T24gMjkvMDEvMjAyNiAyMjowMCwgRnJhbmsgTGkgd3JvdGU6Cj4gT24gVGh1LCBKYW4gMjksIDIw
MjYgYXQgMDg6MTg6MzlQTSArMDIwMCwgQWRyaWFuIEh1bnRlciB3cm90ZToKPj4gU29tZSBwbGF0
Zm9ybXMgaW1wbGVtZW50IHRoZSBNSVBJIEkzQyBIQ0kgTXVsdGktQnVzIEluc3RhbmNlIGNhcGFi
aWxpdHksCj4+IHdoZXJlIGEgc2luZ2xlIHBhcmVudCBkZXZpY2UgaG9zdHMgbXVsdGlwbGUgSTND
IGNvbnRyb2xsZXIgaW5zdGFuY2VzLiAgSW4KPj4gc3VjaCBkZXNpZ25zLCB0aGUgcGFyZW50IC0g
bm90IHRoZSBpbmRpdmlkdWFsIGNoaWxkIGluc3RhbmNlcyAtIG1heSBuZWVkIHRvCj4+IGNvb3Jk
aW5hdGUgcnVudGltZSBQTSBzbyB0aGF0IGFsbCBjb250cm9sbGVycyBlbnRlciBsb3ctcG93ZXIg
c3RhdGVzCj4+IHRvZ2V0aGVyLCBhbmQgYWxsIHJ1bnRpbWUgc3VzcGVuZCBjYWxsYmFja3MgYXJl
IGludm9rZWQgaW4gYSBjb250cm9sbGVkCj4+IGFuZCBzeW5jaHJvbml6ZWQgbWFubmVyLgo+Pgo+
PiBGb3IgZXhhbXBsZSwgaWYgdGhlIHBhcmVudCBlbmFibGVzIElCSS13YWtldXAgd2hlbiB0cmFu
c2l0aW9uaW5nIGludG8gYQo+PiBsb3ctcG93ZXIgc3RhdGUsCj4gCj4gRG9lcyB5b3VyIGhhcmR3
YXJlIHN1cHBvcnQgcmVjaWV2ZSBJQkkgd2hlbiBydW50aW1lIHN1c3BlbmQ/CgpXaGVuIHJ1bnRp
bWUgc3VzcGVuZGVkIChpbiBEMyksIHRoZSBoYXJkd2FyZSBmaXJzdCB0cmlnZ2VycyBhIFBvd2Vy
IE1hbmFnZW1lbnQKRXZlbnQgKFBNRSkgd2hlbiB0aGUgU0RBIGxpbmUgaXMgcHVsbGVkIGxvdyB0
byBzaWduYWwgdGhlIFNUQVJUIGNvbmRpdGlvbiBvZiBhbiBJQkkuClRoZSBQQ0kgc3Vic3lzdGVt
IHdpbGwgdGhlbiBydW50aW1lLXJlc3VtZSB0aGUgZGV2aWNlLiAgV2hlbiB0aGUgYnVzIGlzIGVu
YWJsZWQsCnRoZSBjbG9jayBpcyBzdGFydGVkIGFuZCB0aGUgSUJJIGlzIHJlY2VpdmVkLgoKPiAK
PiBGcmFuawo+IAo+PiBldmVyeSBidXMgaW5zdGFuY2UgbXVzdCByZW1haW4gYWJsZSB0byByZWNl
aXZlIElCSXMgdXAKPj4gdW50aWwgdGhhdCBwb2ludC4gIFRoaXMgcmVxdWlyZXMgZGVmZXJyaW5n
IHRoZSBpbmRpdmlkdWFsIGNvbnRyb2xsZXJz4oCZCj4+IHJ1bnRpbWUgc3VzcGVuZCBjYWxsYmFj
a3MgKHdoaWNoIGRpc2FibGUgYnVzIGFjdGl2aXR5KSB1bnRpbCB0aGUgcGFyZW50Cj4+IGRlY2lk
ZXMgaXQgaXMgc2FmZSBmb3IgYWxsIGluc3RhbmNlcyB0byBzdXNwZW5kIHRvZ2V0aGVyLgo+Pgo+
PiBUbyBzdXBwb3J0IHRoaXMgdXNhZ2UgbW9kZWw6Cj4+Cj4+ICAgKiBFeHBvcnQgdGhlIGNvbnRy
b2xsZXIncyBydW50aW1lIFBNIHN1c3BlbmQvcmVzdW1lIGNhbGxiYWNrcyBzbyB0aGF0Cj4+ICAg
ICB0aGUgcGFyZW50IGNhbiBpbnZva2UgdGhlbSBkaXJlY3RseS4KPj4KPj4gICAqIEFkZCBhIG5l
dyBxdWlyaywgSENJX1FVSVJLX1JQTV9QQVJFTlRfTUFOQUdFRCwgd2hpY2ggZGVzaWduYXRlcyB0
aGUKPj4gICAgIHBhcmVudCBkZXZpY2UgYXMgdGhlIGNvbnRyb2xsZXLigJlzIHJ1bnRpbWUgUE0g
ZGV2aWNlIChycG1fZGV2KS4gIFdoZW4KPj4gICAgIHVzZWQgd2l0aG91dCBIQ0lfUVVJUktfUlBN
X0FMTE9XRUQsIHRoaXMgYWxzbyBwcmV2ZW50cyB0aGUgY2hpbGQKPj4gICAgIGluc3RhbmNl4oCZ
cyBzeXN0ZW0tc3VzcGVuZCBjYWxsYmFja3MgZnJvbSB1c2luZwo+PiAgICAgcG1fcnVudGltZV9m
b3JjZV9zdXNwZW5kKCkvcG1fcnVudGltZV9mb3JjZV9yZXN1bWUoKSwgc2luY2UgcnVudGltZQo+
PiAgICAgUE0gaXMgbWFuYWdlZCBlbnRpcmVseSBieSB0aGUgcGFyZW50Lgo+Pgo+PiAgICogTW92
ZSBERUZBVUxUX0FVVE9TVVNQRU5EX0RFTEFZX01TIGludG8gdGhlIGhlYWRlciBzbyBpdCBjYW4g
YmUgc2hhcmVkCj4+ICAgICBieSBwYXJlbnQtbWFuYWdlZCBQTSBpbXBsZW1lbnRhdGlvbnMuCj4+
Cj4+IFRoZSBuZXcgcXVpcmsgYWxsb3dzIHBsYXRmb3JtcyB3aXRoIG11bHRpLWJ1cyBwYXJlbnQt
bWFuYWdlZCBQTQo+PiBpbmZyYXN0cnVjdHVyZSB0byBjb3JyZWN0bHkgY29vcmRpbmF0ZSBydW50
aW1lIFBNIGFjcm9zcyBhbGwgSTNDIEhDSQo+PiBpbnN0YW5jZXMuCj4+Cj4+IFNpZ25lZC1vZmYt
Ynk6IEFkcmlhbiBIdW50ZXIgPGFkcmlhbi5odW50ZXJAaW50ZWwuY29tPgo+PiAtLS0KPj4gIGRy
aXZlcnMvaTNjL21hc3Rlci9taXBpLWkzYy1oY2kvY29yZS5jIHwgMjUgKysrKysrKysrKysrKysr
Ky0tLS0tLS0tLQo+PiAgZHJpdmVycy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9oY2kuaCAgfCAg
NiArKysrKysKPj4gIDIgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlv
bnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci9taXBpLWkzYy1oY2kv
Y29yZS5jIGIvZHJpdmVycy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9jb3JlLmMKPj4gaW5kZXgg
ZWM0ZGJlNjRjMzVlLi5jYjk3NGIwZjllMTcgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvaTNjL21h
c3Rlci9taXBpLWkzYy1oY2kvY29yZS5jCj4+ICsrKyBiL2RyaXZlcnMvaTNjL21hc3Rlci9taXBp
LWkzYy1oY2kvY29yZS5jCj4+IEBAIC03MzMsNyArNzMzLDcgQEAgc3RhdGljIGludCBpM2NfaGNp
X3Jlc2V0X2FuZF9pbml0KHN0cnVjdCBpM2NfaGNpICpoY2kpCj4+ICAJcmV0dXJuIDA7Cj4+ICB9
Cj4+Cj4+IC1zdGF0aWMgaW50IGkzY19oY2lfcnVudGltZV9zdXNwZW5kKHN0cnVjdCBkZXZpY2Ug
KmRldikKPj4gK2ludCBpM2NfaGNpX3J1bnRpbWVfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYp
Cj4+ICB7Cj4+ICAJc3RydWN0IGkzY19oY2kgKmhjaSA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwo+
PiAgCWludCByZXQ7Cj4+IEBAIC03NDYsOCArNzQ2LDkgQEAgc3RhdGljIGludCBpM2NfaGNpX3J1
bnRpbWVfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpCj4+Cj4+ICAJcmV0dXJuIDA7Cj4+ICB9
Cj4+ICtFWFBPUlRfU1lNQk9MX0dQTChpM2NfaGNpX3J1bnRpbWVfc3VzcGVuZCk7Cj4+Cj4+IC1z
dGF0aWMgaW50IGkzY19oY2lfcnVudGltZV9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQo+PiAr
aW50IGkzY19oY2lfcnVudGltZV9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQo+PiAgewo+PiAg
CXN0cnVjdCBpM2NfaGNpICpoY2kgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKPj4gIAlpbnQgcmV0
Owo+PiBAQCAtNzY4LDYgKzc2OSw3IEBAIHN0YXRpYyBpbnQgaTNjX2hjaV9ydW50aW1lX3Jlc3Vt
ZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4+Cj4+ICAJcmV0dXJuIDA7Cj4+ICB9Cj4+ICtFWFBPUlRf
U1lNQk9MX0dQTChpM2NfaGNpX3J1bnRpbWVfcmVzdW1lKTsKPj4KPj4gIHN0YXRpYyBpbnQgaTNj
X2hjaV9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikKPj4gIHsKPj4gQEAgLTc4NCwxMiArNzg2
LDE0IEBAIHN0YXRpYyBpbnQgaTNjX2hjaV9yZXN1bWVfY29tbW9uKHN0cnVjdCBkZXZpY2UgKmRl
diwgYm9vbCByc3RkYWEpCj4+ICAJc3RydWN0IGkzY19oY2kgKmhjaSA9IGRldl9nZXRfZHJ2ZGF0
YShkZXYpOwo+PiAgCWludCByZXQ7Cj4+Cj4+IC0JaWYgKCEoaGNpLT5xdWlya3MgJiBIQ0lfUVVJ
UktfUlBNX0FMTE9XRUQpKQo+PiAtCQlyZXR1cm4gMDsKPj4gKwlpZiAoIShoY2ktPnF1aXJrcyAm
IEhDSV9RVUlSS19SUE1fUEFSRU5UX01BTkFHRUQpKSB7Cj4+ICsJCWlmICghKGhjaS0+cXVpcmtz
ICYgSENJX1FVSVJLX1JQTV9BTExPV0VEKSkKPj4gKwkJCXJldHVybiAwOwo+Pgo+PiAtCXJldCA9
IHBtX3J1bnRpbWVfZm9yY2VfcmVzdW1lKGRldik7Cj4+IC0JaWYgKHJldCkKPj4gLQkJcmV0dXJu
IHJldDsKPj4gKwkJcmV0ID0gcG1fcnVudGltZV9mb3JjZV9yZXN1bWUoZGV2KTsKPj4gKwkJaWYg
KHJldCkKPj4gKwkJCXJldHVybiByZXQ7Cj4+ICsJfQo+Pgo+PiAgCXJldCA9IGkzY19tYXN0ZXJf
ZG9fZGFhX2V4dCgmaGNpLT5tYXN0ZXIsIHJzdGRhYSk7Cj4+ICAJaWYgKHJldCkKPj4gQEAgLTgx
Miw4ICs4MTYsNiBAQCBzdGF0aWMgaW50IGkzY19oY2lfcmVzdG9yZShzdHJ1Y3QgZGV2aWNlICpk
ZXYpCj4+ICAJcmV0dXJuIGkzY19oY2lfcmVzdW1lX2NvbW1vbihkZXYsIHRydWUpOwo+PiAgfQo+
Pgo+PiAtI2RlZmluZSBERUZBVUxUX0FVVE9TVVNQRU5EX0RFTEFZX01TIDEwMDAKPj4gLQo+PiAg
c3RhdGljIHZvaWQgaTNjX2hjaV9ycG1fZW5hYmxlKHN0cnVjdCBkZXZpY2UgKmRldikKPj4gIHsK
Pj4gIAlzdHJ1Y3QgaTNjX2hjaSAqaGNpID0gZGV2X2dldF9kcnZkYXRhKGRldik7Cj4+IEBAIC05
NjIsNiArOTY0LDExIEBAIHN0YXRpYyBpbnQgaTNjX2hjaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQo+PiAgCWlmIChoY2ktPnF1aXJrcyAmIEhDSV9RVUlSS19SUE1fSUJJX0FM
TE9XRUQpCj4+ICAJCWhjaS0+bWFzdGVyLnJwbV9pYmlfYWxsb3dlZCA9IHRydWU7Cj4+Cj4+ICsJ
aWYgKGhjaS0+cXVpcmtzICYgSENJX1FVSVJLX1JQTV9QQVJFTlRfTUFOQUdFRCkgewo+PiArCQlo
Y2ktPm1hc3Rlci5ycG1fZGV2ID0gcGRldi0+ZGV2LnBhcmVudDsKPj4gKwkJaGNpLT5tYXN0ZXIu
cnBtX2FsbG93ZWQgPSB0cnVlOwo+PiArCX0KPj4gKwo+PiAgCXJldHVybiBpM2NfbWFzdGVyX3Jl
Z2lzdGVyKCZoY2ktPm1hc3RlciwgJnBkZXYtPmRldiwgJmkzY19oY2lfb3BzLCBmYWxzZSk7Cj4+
ICB9Cj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNpL2hj
aS5oIGIvZHJpdmVycy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9oY2kuaAo+PiBpbmRleCA4MTkz
MjhhODViODQuLmQwZTdhZDU4YWMxNSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9pM2MvbWFzdGVy
L21pcGktaTNjLWhjaS9oY2kuaAo+PiArKysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2Mt
aGNpL2hjaS5oCj4+IEBAIC0xNDcsNiArMTQ3LDcgQEAgc3RydWN0IGkzY19oY2lfZGV2X2RhdGEg
ewo+PiAgI2RlZmluZSBIQ0lfUVVJUktfUkVTUF9CVUZfVEhMRAkJQklUKDQpICAvKiBTZXQgcmVz
cCBidWYgdGhsZCB0byAwIGZvciBBTUQgcGxhdGZvcm1zICovCj4+ICAjZGVmaW5lIEhDSV9RVUlS
S19SUE1fQUxMT1dFRAkJQklUKDUpICAvKiBSdW50aW1lIFBNIGFsbG93ZWQgKi8KPj4gICNkZWZp
bmUgSENJX1FVSVJLX1JQTV9JQklfQUxMT1dFRAlCSVQoNikgIC8qIElCSSBhbmQgSG90LUpvaW4g
YWxsb3dlZCB3aGlsZSBydW50aW1lIHN1c3BlbmRlZCAqLwo+PiArI2RlZmluZSBIQ0lfUVVJUktf
UlBNX1BBUkVOVF9NQU5BR0VECUJJVCg3KSAgLyogUnVudGltZSBQTSBtYW5hZ2VkIGJ5IHBhcmVu
dCBkZXZpY2UgKi8KPj4KPj4gIC8qIGdsb2JhbCBmdW5jdGlvbnMgKi8KPj4gIHZvaWQgbWlwaV9p
M2NfaGNpX3Jlc3VtZShzdHJ1Y3QgaTNjX2hjaSAqaGNpKTsKPj4gQEAgLTE1Niw0ICsxNTcsOSBA
QCB2b2lkIGFtZF9zZXRfb2RfcHBfdGltaW5nKHN0cnVjdCBpM2NfaGNpICpoY2kpOwo+PiAgdm9p
ZCBhbWRfc2V0X3Jlc3BfYnVmX3RobGQoc3RydWN0IGkzY19oY2kgKmhjaSk7Cj4+ICB2b2lkIGkz
Y19oY2lfc3luY19pcnFfaW5hY3RpdmUoc3RydWN0IGkzY19oY2kgKmhjaSk7Cj4+Cj4+ICsjZGVm
aW5lIERFRkFVTFRfQVVUT1NVU1BFTkRfREVMQVlfTVMgMTAwMAo+PiArCj4+ICtpbnQgaTNjX2hj
aV9ydW50aW1lX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KTsKPj4gK2ludCBpM2NfaGNpX3J1
bnRpbWVfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldik7Cj4+ICsKPj4gICNlbmRpZgo+PiAtLQo+
PiAyLjUxLjAKPj4KCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWkzYwo=
