Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B59CD6E4D
	for <linux-i3c@archiver.kernel.org>; Thu, 13 Nov 2025 13:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=D+6adbWseMEGhse2f1TVJw/CBJJep24NvLPgy/b+75E=; b=SMUj3O+0EGfjqRIszASOAH76KL
	zaJXoBK1W+sxgXqQwd72SaR+OLlQqeeTOk0nJslSEleVNm1wxi0IH3LXLa7thNuBURSeaAv5+aX+Q
	JQtltZHSncDdn/yirB1HbdrV00ljRLr2yoqmXftigWog12Nmnw/jObvI4n3xOTtUByuNXynaqNWoY
	A07LFdcYNgXt9s0SvnouiruVQMPQRwpKuOpT2qdrC4stmTlJSGvE/cobV3FMSf9tPrC3QbqUNm37Z
	qmfdpxQWhnd1x7F5RQ3+K4ZKt8329M+fYI188HDzqwLMwD3kmXz1w5DVrQ5xtWMsgynp/OgLlV6H2
	WedKCdJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJWyS-0000000AVo0-1lsi;
	Thu, 13 Nov 2025 13:02:52 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJWyP-0000000AVmz-0sHW
	for linux-i3c@lists.infradead.org;
	Thu, 13 Nov 2025 13:02:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763038968; x=1794574968;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=eGfhANOJHFBwAw23Pgw5C4BJmVCe1gD7r6l6mqmD0HE=;
  b=LQ5kYlpwjUaT6HJwlZYbPPxUDO17wrjTh2YuvELC43KEYx4DZ8AySXj1
   ibtt3H6VdOo7pgCh0j3S44ucX4SSdnt6n1xMJzLJm2ase16Ib8ibWjb0E
   Qsjdc3YntDBbwy1ZAOhFKPYknAcAjjp42paNz+r3aHYIeaPkydY+Wmhnd
   daaXNTW8mkh/PuH1otYcF6LZu4179m0ueA8K+KIooym17jOOKtiQ+NccT
   JPZwKKMYtDZAsc6vL5H6EGrh5WayY5RKzMAEpF4AmHcvTGWHXkr1/CKrg
   5GZcPWA1zX/RZr5cCFa4/Q/EmY0iOzziVLVuVw6fv6VdNQ/Z5Z7bfBdo4
   A==;
X-CSE-ConnectionGUID: w+yzHTMMRpm2nGyJ3HBikQ==
X-CSE-MsgGUID: Gr/r0Y2SQv+fdGSq+AAYmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65022962"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="65022962"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 05:02:48 -0800
X-CSE-ConnectionGUID: /PZ2hVy+Qxq7iTz3a50fBw==
X-CSE-MsgGUID: fBcqDNP8QSWFN2Myru38pA==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 05:02:48 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 05:02:48 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 13 Nov 2025 05:02:48 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.51) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 05:02:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XVuT88j6i1DxVrkiFWP3GdXpPcc7CP1raJ+x25aKNkMZ99D0BbvCmu6qOBfQKkSEZgqs2Ez5iIbRGxToQvCt2G/z6Erjcp1d5WHGeYXmggdmDgT5FjEj2ZWdyHicZTFWDSfZgZkPAXp2bhN5vsvRSQiSgqK2iKnDOhqRQUNVoOQGAeQYtttrAdXgRdy/7nrkJa4VsgsOxp0hZ8y+FzCnKbf6m5LCvhDfzJiWtVCCyZZd0y6kEiz/dfIm+kiYBC5ADdgTFJmF68V5E9IrndOfomVOhwpwfjhz+I9x2gvrRrB33DK8oxUhmCiKNfO3+UlHq3jNKbKETAghj4kmMgXGSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pXdmEskCk8Ns7pEjbnjoIt0Q8kfMSM2vK4Bd7H7rFHs=;
 b=bb1wMkOmmOjAPkZXwUm4IrMZjLAxGue75hKZk2Jscra5YuahOSBB90TsK+ohFmCXqm9LqNcT1wBqNP0ZxlnfujvbsIjzsLW/FBcqjPn2ZG1Nl5zbrmvHVhSLtIO5ajmbRa9apGk3ZKeWhlPwQvimAhAYzx0R9VfODH7KGZpHJzSuIbsIG4Flo4RT5cosVXAfWg8aOiBQ8Bu8Or6tk7PZy4WdDpm+S6cZ2Fv84pC8xfMJNrSP4CWP5mNXZ9BLeEuQHycKRGRqqqBCygE0hshHjn8b2EaCjbZv8OytTp2TQPXJnqzz6K7x62mj+kuL5QTziKLO3z8fZX0+qSEUMGYgHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by DM4PR11MB6407.namprd11.prod.outlook.com (2603:10b6:8:b4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Thu, 13 Nov
 2025 13:02:44 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::eeac:69b0:1990:4905]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::eeac:69b0:1990:4905%7]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 13:02:44 +0000
Message-ID: <96a05dfc-6d4b-4638-a741-8fffc9fa9c74@intel.com>
Date: Thu, 13 Nov 2025 15:02:41 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/13] i3c: mipi-i3c-hci-pci: Factor out private registers
 ioremapping
To: Frank Li <Frank.li@nxp.com>
CC: <alexandre.belloni@bootlin.com>, <linux-i3c@lists.infradead.org>
References: <20251112100339.51726-1-adrian.hunter@intel.com>
 <20251112100339.51726-7-adrian.hunter@intel.com>
 <aRSxSHoFPKSpmc34@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <aRSxSHoFPKSpmc34@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: DU7P194CA0002.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:10:553::33) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|DM4PR11MB6407:EE_
X-MS-Office365-Filtering-Correlation-Id: dd2b8670-adf6-40ba-3c2c-08de22b4efa3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V0F3WnIxb1hzZEROV2doR3hwZzZYUmdLVnpOaitxam54d2NTemJHbGVxaUV0?=
 =?utf-8?B?bTZVWXNHY0lMTWFidy9zZGJrR2xWK2ovSnJraW5nMlhCODRmVVJyRkMrN1ZL?=
 =?utf-8?B?V0dqK1FjMGo0aUNhbE56SEhER0hnY1RIT09SWEdPNWVwMnVNeHk0NWNsTXIr?=
 =?utf-8?B?UW81RWhCWFRGY1BBUFd2SWFIZTkxK3g1SWJpMktLU1BrWDBwWXcrc1VmVGR2?=
 =?utf-8?B?R1o4WU90Y0g3NGNmQmhSSU02cUhiWlhQOHJRaDIvOERnMitXY09FWHc5OUpo?=
 =?utf-8?B?UXJvZlFsWFM1TmM3MGNhNGlNUUVPWUFWWDVKNTlGRDNPUDBKN1ppODhOR0F1?=
 =?utf-8?B?OXcvYUQ1R01TdnB0aFJPcWVxMnZjQ1cxYlREOWNLVkRROUNIdy93bVlIZmcz?=
 =?utf-8?B?elFwWW12d3VDeHBCaC95c01jaHk4T1FxRzZQeFVlbGEwZkViSU5mNlBYd3BJ?=
 =?utf-8?B?djE1WEM0T3lpNDIrZFRiUkZwVnF3SVRqRWtpLzNRNjQvUkt6S1BGWk9xUUZS?=
 =?utf-8?B?eG0wK0hSKzR2ZVhJdmlFTzZHbVJsdnM0R2hKbkZESVJ1dkJkQnUybkFhYXdJ?=
 =?utf-8?B?cVBYZGVuY3JvaTJRV0dvdHZ4TXFsalFuNjRaZUNpTVRWUURiaG9kdUdKSkVx?=
 =?utf-8?B?cC83cmZmR3p3dUxnQ3c3N2dkVWtCb1dxTEMyR2RrSG0yY2FMd1A2cFJjV2Zo?=
 =?utf-8?B?TDJIQTNCNzI3YnY0TWtlY01UZHJJdHdxTUw5S1RrSWFJbndwVmhzcTBsdVgr?=
 =?utf-8?B?OEE5N09odzh5SUR3dVo4aXVUNXlpZXFmV1ZWdUc0aFBPY3F0UXNjS3N5MjRO?=
 =?utf-8?B?Ujl6V2huV29seTJnYnp1V0pGbnR1dWcxQXF0L3k1bENJNEFXRDhGMGIvYWQ1?=
 =?utf-8?B?RGFqTzFtcmE0OXFySHFKRWxoRlNGZy9mRDZidGs5L21Ed1dYM1VqUnJwcXpv?=
 =?utf-8?B?blliZDRuNjJFUXVsZEVlV2UrTCtYV1lZa3hLV0J6QUZjNnFCTkVzQ1ltN3l4?=
 =?utf-8?B?MjZWVGQ0dDl1K0R0eVUvWVNULzNvZ0MzRGU2YTlWRlRFVUZxSUtHa2poMnF0?=
 =?utf-8?B?WG1jUVIwaGIrblhPUG1hSkcramR3SXhpLy9hK0QwenNBSS8zSDBvQld2aTlx?=
 =?utf-8?B?WjI0cmZHSUFSM3ptb0UrM1ZLRmlCU3Q5Tk8yWFdsYm1DQmVEOTlDS0NSbnpj?=
 =?utf-8?B?UGRLYktIQk5wYVJsdGE4ZzdkZkQxNWFSRXZXNlNTUzdrUmV1RFlkdUJxY3po?=
 =?utf-8?B?aEtzTUJRSDNLb21ZQkRFNUsrdDNrWnZybjhWeERkUFNkQ0loRlhXbTVhOGhq?=
 =?utf-8?B?WmJTZXl1SkM0R00rbDhXdWZxd0VQQ1Z1Q0o1Z09rS3F6TXBHNkVhUFE0TEZY?=
 =?utf-8?B?c0hVVXoyc1pVL0RDYWlHZUtHZVJPOG1kVlBIRkw3VFY4Z0Fid3IxcVBDcE1R?=
 =?utf-8?B?Mk1XemRFd0t1bVZrTVpORStsYmQxVmw0M3lYVlI1d2dMbXF4Z0tTa1ZLRVp0?=
 =?utf-8?B?RU9IdDFUOFVNaVh5LzZHaFNBenlGUWhzczJUcHdqWE1TcEhhZXcyVjl3RFV3?=
 =?utf-8?B?VWtyUGVleWs5M09mSWJUbG5XQm9zaHF0Q2cwQ3ZwRmo2SG05T3FMVGd3eWQz?=
 =?utf-8?B?aU12NFdta3M5elZrSk1kOHJ2SkxndTdxTjJ1OEx1SFhiY1NoV09jamdsUW5H?=
 =?utf-8?B?eFNJUm5LUU1IaVlMUzNMNmthK09QWGhzdUZ4N2I0NzRyclRkY2gxanVzdUJU?=
 =?utf-8?B?aitHVkVER1VjcThoTFMzV0Q2bFJqVkplWGt6ZVp1SW9QWlByT2svV052RW9T?=
 =?utf-8?B?YzNkc0Nrc09MTWhYT1NxampZM0tUOTFpQk4ybEcraXloOUg4RHlUeC9xc1hq?=
 =?utf-8?B?clRzcDJncy9iQU9pM0JrRlZpLzJpWlFNZnpoWmlsZXdITERqdVpjSS9meUxD?=
 =?utf-8?B?RUxFbWkxWkZhVldLa0hTeE1WQnRjclNHSUlnZ0dvMy95THNrVDA4S3l1bTlx?=
 =?utf-8?B?RW1aRkNoa3lRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEN0ZDhsUUNzenlDTVEwajUxUjlBL2dNYjhlajk3YnFJcm93SGJDTkh6WEFG?=
 =?utf-8?B?Sk02SFg3T3FSZHIzbjNmZXNtYXVEdWhsQ0lMUUNhaUdZenM4NUdtbDBPV3Jo?=
 =?utf-8?B?dXhsdE4yVytjWElUdWh0T2lQTGl4TlI5WHNCb2wzTWRyRUhBZ3F0dndGSlVJ?=
 =?utf-8?B?bkNNaTJ0MG5qd2puR1VvUlhqZ1dVWloraC9mOUVlS1RjUVIvaDc3dnFxV3JE?=
 =?utf-8?B?R3dTbVdSMU80U09rMDBiT3NoUHdEL3h1aGd0TStrVFRRdUlXbHF0eklSbFVp?=
 =?utf-8?B?S1h0aW1EMTAxa1dxU0k2RHdvV0lGNW5YWFBUWStZS0V2SkpscW9TZzhsM0Vj?=
 =?utf-8?B?cUNzVjJNYlJTZnhpNVhhNTdpcUhFZWp1Y2ppbXFOWE0weUx3MkR1STkyeUlS?=
 =?utf-8?B?YmxwNCtVc0R3dTZrU0RaRUNvYUJ6V2xrMGZvUnFFMDEwUDJXeGo4a1BXanNE?=
 =?utf-8?B?QzVKWTBjQmltRUY0OWVYSHViWTJPckdRaWlRVlJyaEx4NXU5ZG9iK1QyajZh?=
 =?utf-8?B?NVVLSmREc2tRRUFnNGJGTGI4KzlNTHAwdm0yK3VJL0dUYW1UWEY1b2Y2V1pG?=
 =?utf-8?B?aWpFUThhM3dWcHNhd1RrTmYwc1c2QnQyME9YTWZralJOTUh2dzc3QUVpOTI1?=
 =?utf-8?B?RC8rdUhNN2dBS3lRcFYyZjF2UCtTWnhnZlJ2dWFRd3N3UTNkZXdwMWg3L0k3?=
 =?utf-8?B?bk92bXVZTU9EeHVDSkNaQ2FIdUFlS01IN3VUY1hmT3BxMWw3UzhKUGdyWjhz?=
 =?utf-8?B?d2pxcjJjeVIreXBNTFhwTDhQcmIxbjRMWUhVNFpKMElJYk9MbS96M1I1Z2dL?=
 =?utf-8?B?b2UvQzdkUkl0dlUrekVHU0Z2WjdwbWg3ZmhGYjFxQTdvaTJ0VGM5ZDhFemtI?=
 =?utf-8?B?RlNHeDFBQW9qNEZKd2ZBZWtkc0V5VmthQ0V5SklQTTRPVFVIR2s2YUxuclF4?=
 =?utf-8?B?WGdtVzBxSTgvcytwMUNURm5RZE5tZFJIKytnYUd2QU43eWlhdy9VWmNrWUVU?=
 =?utf-8?B?UFAyVnBDRGRrUjVnL29VSTB4Sy9jNjYzdklKSkJ0R0FHTjVmcCtQTkdQOU5o?=
 =?utf-8?B?SC9VcmFNV1BUaHFUeHRmRWdjVjA0OHRRcEw5QnZtRjFBM1hQZHloVnhHd2x2?=
 =?utf-8?B?NTZLcXdySHFkZXV2eWtyM1o2UzgzeWZYN2FIL04vSXRDNXpRV0V5V3BzRDhj?=
 =?utf-8?B?aUNPYUtEeFlra2ExdHNBL0w3bVozMGVtWVpqK0lWMUh5eFU1RjROdnFjcjNs?=
 =?utf-8?B?RDRMUEJ2N3NnUlZUMlFySm02NGp0Q2hTYWZVTWEwVVdvSXJabHllVHBiUjVp?=
 =?utf-8?B?UlJzK0p3RFZHbVQrblhUd3pmWWI1ajVRMjUxZlprZXgyUGhsZTNxNUw3L0Fz?=
 =?utf-8?B?M016NnR2NHhIYTZUelZLcFRIRGhvRmJQeHdZSWc0ak85OXBqWkYxSkQrK2ta?=
 =?utf-8?B?Y0xXSjRyRjY0UHlacVlaWldlcWlCRGV0Q3ViU1B1UzhIUDZGNVk5ajcvWnZ5?=
 =?utf-8?B?UXljZTVEK1FsbDErZFlxOCtyWWFBTUUrRUtvY1cvcEZnaHFJZ2NBSHd6OEI0?=
 =?utf-8?B?K0lGdGJCaG5icmRWeVJKTGVJWjcybGF2MGRISVZqbkFKSzZyME5ESkEvWU1i?=
 =?utf-8?B?MDFKbnlSWUs2R0U3OHRSZDVRUjlJZGttdVdBZURPQkMzWjRFaEhlM0VmMjk2?=
 =?utf-8?B?YkF4S3ptT01nMGxoWFlYRFFWMXNuejNTWkF5cVBOR1l5UGNPanpWWWRFTCtL?=
 =?utf-8?B?T1NOZ1pRQzZ4Tko3NXFtc1VYTlpQVXpxY0o1Sm4weGovMTAvNWUzTzczUTM1?=
 =?utf-8?B?UW1TUEtyZUpCTkxqUXlibVBuV1NRT0s2U1RBNUtZVmliMXB2YTlTYXVtS2lh?=
 =?utf-8?B?UWJpY2JsVWlEY2ZuekZPTlVGVHlnbHdMa3RwUXRja2E3Z1JlY0NyZGc5NXhU?=
 =?utf-8?B?SUV5NG83T0J2U1Q4RE55K0dwbHRPemxld1R4S1ZRNW5oRUpoSHFTdUhVR3Jt?=
 =?utf-8?B?akxJTlhBTGZwZ1QvOHJLNlhqVjE2SnBoUndMMDBrUytCZEpnVTh5aHh2c0Jr?=
 =?utf-8?B?N1RBTWpyWk8zV3MwTzJGLzR3WVVNaHkwWU9FUzh4U3FtTyt4amN4ckhzeTlF?=
 =?utf-8?B?cnl0UG16Q1JvdU12ZGxrSVJ6OVdyazhicmYwYWcraXJXVjB4ZjBDSnJLK0ZH?=
 =?utf-8?B?ZlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd2b8670-adf6-40ba-3c2c-08de22b4efa3
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 13:02:44.5467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U1fDmbcciWgt7kBRtaEQEOOD9Z9rg8KHnsJHuNwhUfgJ2tY1LjtQAey0+a8ZZgf4X3JU27qyXLJ8FKsXy8iZng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6407
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_050249_264059_16CFD27E 
X-CRM114-Status: GOOD (  11.68  )
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

On 12/11/2025 18:09, Frank Li wrote:
> On Wed, Nov 12, 2025 at 12:03:32PM +0200, Adrian Hunter wrote:
>> For neatness, factor out private registers ioremapping.
>>
>> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
>> ---
> 
> feel like not beanfit.

The benefit is that it is neater and more readable.

> 
> Frank
> 
>>  drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 12 ++++++++----
>>  1 file changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
>> index 59c592446b5c..003ae61e9f6c 100644
>> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
>> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
>> @@ -27,15 +27,19 @@ static DEFINE_IDA(mipi_i3c_hci_pci_ida);
>>  #define INTEL_RESETS_RESET_DONE		BIT(1)
>>  #define INTEL_RESETS_TIMEOUT_US		10000
>>
>> +static void __iomem *intel_priv(struct pci_dev *pci)
>> +{
>> +	resource_size_t base = pci_resource_start(pci, 0);
>> +
>> +	return devm_ioremap(&pci->dev, base + INTEL_PRIV_OFFSET, INTEL_PRIV_SIZE);
>> +}
>> +
>>  static int intel_init(struct pci_dev *pci)
>>  {
>> -	void __iomem *priv;
>> +	void __iomem *priv = intel_priv(pci);
>>  	u32 reg;
>>  	int ret;
>>
>> -	priv = devm_ioremap(&pci->dev,
>> -			    pci_resource_start(pci, 0) + INTEL_PRIV_OFFSET,
>> -			    INTEL_PRIV_SIZE);
>>  	if (!priv)
>>  		return -ENOMEM;
>>
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
