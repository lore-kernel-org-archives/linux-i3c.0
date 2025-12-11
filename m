Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72066D41D65
	for <linux-i3c@archiver.kernel.org>; Thu, 11 Dec 2025 16:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=10nHjWpw36JzP76WuD4GjBp3XqGpoLZp2KEpaFxpfGI=; b=eVikf2n33Yorln/zJPmbPwV0XU
	IBNKdr9D5wmo2GmVEV/4Sel+KNZgUf3Rl6IwtA3Z4B6reqePqqYwZxy8x9St0Pv6VcvpjNiR8nS+n
	jnwOA8kIQk/sBl3/KBngEjwjAicRUFL0lacbEU4qGuQa0oQSZm3Y05ao2ZXacWWdS9sJ8pv4zjDad
	CJjnZ0r+Nm2D9ip2a0L7SrnGH6XAI9h54cJj7Azhr/1kIGHQ038gYrBBOstxMTjniJUNvVinqCXv3
	emhQX9hOIq+OdtmNnfNp2lWR5GZhZpyJxG6pqaz1Uxuo92r5JwS8A5yqyUM6EcmLg3ZnK7sPr6RTk
	d+iuvJIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTjP9-0000000GpLB-0u7n;
	Thu, 11 Dec 2025 16:20:35 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTjP2-0000000GpKW-46e0
	for linux-i3c@lists.infradead.org;
	Thu, 11 Dec 2025 16:20:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765470029; x=1797006029;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=c1KsMCZu9a5iZRhl5086UERFa6B1PgzmtUbGvN4T91g=;
  b=nh5fDzefna9BU9Mh7nv8BI3lXDLXbpllilpoUTuaZsE7ysmmBgjhT4hK
   AnELXFtJ/iMQ53qVm8+XvIIjpZQzOB+75UYOX6UdqOVI1tYQL7GFRj2Me
   CQsPoXGbIdlBLMVI0rNxEQ1mPT4S1qJ2VVYIQgf/CzGKD1VWTWOcbuREj
   yky9HpZgMhoP5je/cfS0H42e3EPWpng94Km7FhhRsnEJOUdAbh2GaN2/V
   hio5R9iZNxcv5QfjWP4fy2uAo1o48EXFuppZmYjB5of4mH2sIQKJJDtdC
   Ytg4LgJxks1lp5KZv7TpNMe3n08NNsWpcg/eYSFqgETiPEGYvpU5OtbF+
   Q==;
X-CSE-ConnectionGUID: SSgyqIQzQvedSoCEX8cKNg==
X-CSE-MsgGUID: edRMGic9SoekRCtlg0LzSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67341170"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="67341170"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 08:20:29 -0800
X-CSE-ConnectionGUID: BV4P6yuXTf6+vqdexoLkMw==
X-CSE-MsgGUID: u0XonhlsTkyHMLm7/BpXfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="196741148"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 08:20:28 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 08:20:27 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 11 Dec 2025 08:20:27 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.34) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 08:20:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QE+QfgfwBtllk5WIOlqEZzPaL82dNnb9L7uOQ/GidjDWgEKdCpS2pzkahtfAeX8voWEimqrhBhuWX2n0boPSofliQmoCIkD4bO7G1TbvMUgcdxKO9cRHPUtcfhq1sz0xUx6gHI9opOXY97J3zpOaS3Ks3K5s9d1qCARw+tx3kP887/O9fEy+WUqWWRe+hT9TVaXn9s+UrN0xFjIhK1nqRHR0VMHXrUQte/nx6mOjp3Qa996LrOPbSABxeKhJU7TpWv+1s2cFsKgyeRYjhSsE1j2Y5E+FgHiCTs2TgrpAGxY1/wmpkJo/DddzlM2XyVKXq/1iS+5LilSoWA80XwybNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RHThR6ya1T+J/Ckhw5m5+fa3MevE1Q8/+CcWGVaYZKY=;
 b=WsH8ZIzjU8oZyR7zURWJWyfrMn2oicplSu9XIZ540iXblARAzVCohX/hsxd3Nb3ZZymzrJBEIh4zMTRxvPcJV7lvdWeRCzFTI5Q9XU05lmfE6RGGXcRnTW/dvoI1IGv+HR3C3Pf7A1HJpFZh0M6pDQGlQoU228sAxa/YDwGS/wQMNCuqVIkO6dQYt6NXHTWf2GilGJzV46Y8ZhcEQzuDfCAFlz3mtIawGnCV2fWp1alZUoHNUHyVAew/up+SJ3JGas3j53HX8i3uy2lhSP+/jAoShI8NBFExDsE/O0F+rXOStA2TWHKLEKxh3jdsP4QjroFPCZ4OX/dvFPursloI0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7215.namprd11.prod.outlook.com (2603:10b6:8:13a::13)
 by DS7PR11MB5966.namprd11.prod.outlook.com (2603:10b6:8:71::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.8; Thu, 11 Dec 2025 16:20:24 +0000
Received: from DS0PR11MB7215.namprd11.prod.outlook.com
 ([fe80::9201:63e9:3175:5392]) by DS0PR11MB7215.namprd11.prod.outlook.com
 ([fe80::9201:63e9:3175:5392%5]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 16:20:24 +0000
Message-ID: <3d540915-508d-4548-b63a-cbdd9812d454@intel.com>
Date: Thu, 11 Dec 2025 18:19:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 06/10] i3c: mipi-i3c-hci-pci: Enable MSI support
To: Frank Li <Frank.li@nxp.com>
CC: <alexandre.belloni@bootlin.com>, <linux-i3c@lists.infradead.org>
References: <20251211134809.75872-1-adrian.hunter@intel.com>
 <20251211134809.75872-7-adrian.hunter@intel.com>
 <aTrl9BMsbwMBCN+L@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <aTrl9BMsbwMBCN+L@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: DU7P251CA0001.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:10:551::14) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7215:EE_|DS7PR11MB5966:EE_
X-MS-Office365-Filtering-Correlation-Id: 41c70378-5aa8-4abd-6999-08de38d12452
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eXVuR1JVc0IyUUJudVArR25TSFUrMWRzZFlBak1RazJ0RVl0TjFFcCticDFD?=
 =?utf-8?B?OGluMzQxRDN2cFZheXgrQ3ZkOXpLNFFSdlpwWDZPeWRnSmtxNllSWXVzdGlE?=
 =?utf-8?B?aVY1S09CeHA3V3phRlFOejc4cVBXcUhHZjk5OW1HZjYwcXo4cjkvZWRJY2w5?=
 =?utf-8?B?RGdvTnJpaWtBb0NSOFlZa1RJSEIxbmJpNFFIV3RpMmcwYjgzTWhCaG0xUnJ5?=
 =?utf-8?B?NkZXbHVLeHUxVWxKN0dpaWRIeE5WSzgxbzBsbDF0Z1dueXMyb1gzTWJUa01m?=
 =?utf-8?B?SWpWZ0tLdC9SNis5UnZVWStkM0NoeWFyYWhHVjVqR1MrOTJHSzQ0TnZFVHVy?=
 =?utf-8?B?ZFFUQWpqU3U4d1RkWVpNdFdHU1gyNHZlOWd6bEl2UEF4RjZGK3lMTWxXNHpX?=
 =?utf-8?B?c1pNWk5XMVVyMXovVFBCcVV6SEl1R2NVR2l6TFAyYkdqMVREWVg1SHRhd1E5?=
 =?utf-8?B?ZlFqQWJLZDFvaHVSRmcxWmlSNS9EeG5XbzZoWCtna21rYW9OYXJ4SnFldkVp?=
 =?utf-8?B?QnlqaXk4L2tpamRQUkNmZTFPeW4wQkx0L3hrOXNRa2tJWkFrUEdlNGw2aFlQ?=
 =?utf-8?B?Q3J6Q1ZIQXlhM2JFcXZjcEY5U09GaEdGUUQwWmlCWEptQXlBeFk5aHVUS2s5?=
 =?utf-8?B?anFCTHAwb09QMyt4cW9QUjZZaFJhTTEwczRwRDREZ2ZXR3ZDSDRaOE1RTjRx?=
 =?utf-8?B?VjJtSnpXTkNHbGw0bkZwdEx4anNQaHQxbWVPT2IreUNPOU5UL0EvaXArNUJz?=
 =?utf-8?B?UUNVMzk5OHVXN2FDYm8zMmRseWJLUWRlSjdQYzljSUtkbVpGeVRyUkFkQlhY?=
 =?utf-8?B?eDhYS1B5RmRuNzFyVWJrK0NrUEF4VlNIYkhLaFY4U1hXWUI3UmJtSmpnaVpw?=
 =?utf-8?B?K3UwWlBCd2RZR3BGQTRZR1hyNDVOY3ZOaGI2QjMxak10OWlKa0puaEhRU3VZ?=
 =?utf-8?B?eFdZOWdXM0h2WVdDakxBamIyNmtqdGtOa0V2bEJYVFdqVVFrZlJoQ2tzc0c5?=
 =?utf-8?B?VjY3WEtuSk9RRFExbDExRWIycGpHZ09nNk5tUlg2S2Y2RmdFOVhGMEdtMHJm?=
 =?utf-8?B?M2R0Ty81Q2I3T0tIcjg0NVA4dmNhdkJhQzluU3dVc1NRUHZtRXl2Y3R4aTc1?=
 =?utf-8?B?V0x1RWNPSHU3YTNzNnhKTHFuZVlRMkdrQW5TWXlRb0JVUU45dW5ocE1aSXor?=
 =?utf-8?B?YlRmeHA0eHYrWE42WnRoWGNRSDVSbHJMQmhxY3U4OEUrS3NlQU14NGpWU2wr?=
 =?utf-8?B?WmY5UU9wZEU5M2NScDNLSEdhR1UybFN4b1NxMDRZNFB0b0tIS1VDaTNBTkVm?=
 =?utf-8?B?QXZVUkdlYWVRanJFOHMwSXJUdXp1TjBSNzNRN3JFK09wT2pyUHZVdE1CVUYr?=
 =?utf-8?B?VU5ZTG5qQmZmY2d1a21pZityY05TbmE1Z1NFVDZrNzJjTkxQVWdzK0xEZkFo?=
 =?utf-8?B?akZYM2J2cHRTb0c5WnFaOHl0UDBWbFdwSzVkZ1RTZStVRWpyNTIzcFVRUTIx?=
 =?utf-8?B?VVlCMmNISHRza1pUZ0xpbW4yQXhEOFdqK2Y4Wi8zcmdoNkZiMGs1Q0NVYWRY?=
 =?utf-8?B?bmZPQVhQeWVnZEJ2M0M4SXlwbWdYT2ROMkRyS0s5R3RURXhkVE83bzJCWEY4?=
 =?utf-8?B?Zml2cW9YYVlDWFY5MGd0cVRGUC9uRTd3bStGclVGOHBCQVd0elJVamliNGov?=
 =?utf-8?B?MzExNUFFWitaRnFpLzlkYXUrWWpvRWZ0SHZXaXp0ZjlHT2Q4b1BwcWsyZWQ3?=
 =?utf-8?B?b0gxNzFzKzc0dTg2dFcycDdIa0pJQlFsWHJHbGVDOFRhOEtaVkNKVmpYcnFq?=
 =?utf-8?B?cWhTNGUwK1VOdGZmZWpvYWhncVZGNDJGM3J5VmhLMGVLV0FHd09PVDhqZFlF?=
 =?utf-8?B?WER4MTJuQUZWdjExZkRHSlRKa3Zka2d6d1M1K1FDeld0YnMvZjV1eXZ1bUI2?=
 =?utf-8?Q?/OcOg5dYsb5zLg/FS/WPt0vgg2GRg1pH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7215.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEhyRDN4cWhWay9seHZiaVRZOVhXRGxBSy9CdjZPTko2dmV2R3YweGJEZzRV?=
 =?utf-8?B?RGNqTDRZM2pVVW9OR25iL0wxbXdMaStMd05FRnRzSXVweEcwbVBpYllibmVP?=
 =?utf-8?B?TFQrcXB5RkIzai9LVHhZSjY1bGJKSHNvM252SUFEMVB0N1dnQVcyUEdHVDdY?=
 =?utf-8?B?VUtVSGdGNytuVStNTjUzNTF2aEpySHpKUUNPY0dMNWU3WUs3K1Axbm9jTDJS?=
 =?utf-8?B?Q3kvVFFhWTk5a29CcTR0M3pkWjZzUExRTzYyZnl4OUR1RGJCbmtXTGVtUUtN?=
 =?utf-8?B?QS9kVUs4bW92a1Y1bWdNZnhNM1lKZDdrcG9iSXhKYjlxSzlTVERqUlprNXRM?=
 =?utf-8?B?WHM1cHpjNUdXbWpFNVVTa1lJMTRaYUwrVm1xNURGOFQyeWcrSSs4aTV1bmVk?=
 =?utf-8?B?c3ppZnRhejdVeTd3OWxJYXc4ZGVBU2NpWU12RW9yaCtlYSthdlJ6dEUxUWo0?=
 =?utf-8?B?ZlF1b1o1YkQ0UzlhcXppcU9rY0c1cm8rdXlLZnNzMm5hbVc2S1lTcWhrUDVD?=
 =?utf-8?B?aEVLYndkdGVGY0hBcW1ZaEkveDNSazB4KzVsWVdTNytXWUNDRDI1U3Q2cVBi?=
 =?utf-8?B?bVpLT0ZvaEl5dGdudGZrK1REM2tUNTVOb0RFOU5ZMjdPNDB6RWgzcmgvUDA2?=
 =?utf-8?B?V1RsS0lUNk80bktYcUFFQ3ZPOEFzQURUNWlDU01HUFQva01Id2pYTFlSclZG?=
 =?utf-8?B?N1I4dkZIVStsT1FJRVpuT2JwZmlwZDRGekZOZnRzbUxjSk04MHJFMlpXR05D?=
 =?utf-8?B?V1d3TURyRnlieXVuQnRZYktybVhnYWNLTTR0U1hnUThobTdIYVQvYlo3UkEr?=
 =?utf-8?B?UTlVd2lSc3NEZXpLMkEwWVVsaEliYjgyTWxFR2tNakZiOVlHSktUV2NSUTl2?=
 =?utf-8?B?WXFFbDZvcGc5ZGsyUGJOOW9XN21wL3Evb2c2M05VUHkxOFJBT3NVQUlEY1Bn?=
 =?utf-8?B?cW1WZ3pKN2JuQ3VCQ0prVFBqZEdqendSUk5KcmZtbzY5L2g4TS9iL3ZISHdr?=
 =?utf-8?B?SjY0aGFKWUk2cXpMcFpHZWZpZ3ZwRWpiNXp6N2NjZ2JrUW1JdFJ6bnZwaGpP?=
 =?utf-8?B?SzJWQXlmS0JhSHB6RnJxVFBvVGYzK3VQNlJyNkNoUDdrcnl5RXg3QUp4MEpr?=
 =?utf-8?B?VzR1THVVZ09oamQrKytvNTlNYmtSZzNOTFRadnVFQzlLdmJQMUNXMEpSeUxj?=
 =?utf-8?B?TlJyNG5Cd0Y1eC9qRldyMkJnQU9yYVNxd25YQlNxOGxpQXZBWHJuOWd4T0I4?=
 =?utf-8?B?ZnFTYWpmekJncmNhWGRMWTZMK292aURTajlHTWdpN3JraWNUVXcwa2hRRyto?=
 =?utf-8?B?SndmSFZRNldMM0xJQWFUdVQ1WFl6Ryt2eVowbzVxWnVobXRlaFZhQkdGQnM0?=
 =?utf-8?B?cThMVTM4SjNodi9BNFRYYlhqZldWb3IxdjRzZXJ4d04yOHgzeGdXWnBqL3Js?=
 =?utf-8?B?NDRlRjgyU1dzSDRQcHV6dC95Q2g3eFc5enlJZ0VXdjVhOW45eHgxcURoVGVj?=
 =?utf-8?B?b0JSODJoL213Z3ZkWlBjV2RpYW1SczVVQ1VEbHdVaUZDK1dHYmQwY0k1dDJO?=
 =?utf-8?B?N29DVjFBOFN1S2p6Rmc1dVVHY2UyV09VWk5PMmYzdmJKeG9qbmR5WDFHY3FU?=
 =?utf-8?B?WXE3dWlvSzVpWGdqWGtZNCtoK3hFMUpHOGZZRGNJNndBOXNVNlJieFcwendu?=
 =?utf-8?B?dU0zZUlUZE9ReFc1REZmMXMrVWltQXVUY1ZrUE9BV0VkZHJLMHVrMWNEczNX?=
 =?utf-8?B?OURueVN0dWpmaHhxTmRIUFZDNi9ad2tXSXY0cUFCaitkMHk3MW5TUzZsdERO?=
 =?utf-8?B?ME1zZzlvbHJ6KzJReFY0YzZBaldvM1hOTmZmMWo0Q3Rwc2hoVzJpYTRIVVhs?=
 =?utf-8?B?TWJwNWs3Vms0UW1UMmFNeUdaRUxsbWRkMDE0djc4TElteW1NUXNIZXV4ZTdt?=
 =?utf-8?B?T3c4NXdGb1IvSi9IMFY3aCs5TW03aDc4Y2dCSTZETDNrRmhjQ1VaRkplZ0Vz?=
 =?utf-8?B?ZzZ6QlJHczVqVU4ybWNlMjVXbVRpUEJQL0tla0xrUHJrL1NqaHdTOURacVF6?=
 =?utf-8?B?d3lYS0lQOXVUVVdQVkZFckZxeVJWblN6K014cndrSjAxU1R3ZXlUeThoaVBt?=
 =?utf-8?B?Skt0c2tYUUdLNkpXaDFqSDJ5YktGZGNhUUE1Z1JKOTkzZnlHK3o5bVJIVlpt?=
 =?utf-8?B?cXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 41c70378-5aa8-4abd-6999-08de38d12452
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 16:20:24.1327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RbFZ8LXbX3tH+pf/B3G0GfZ64hSRwUduvJ2dbie9WRUpy3e6JaLBFXyXlvik1PKNbfuXtwmLLv0sIG6dgXOUoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5966
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_082029_043748_5E63E05B 
X-CRM114-Status: GOOD (  16.10  )
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

On 11/12/2025 17:40, Frank Li wrote:
> On Thu, Dec 11, 2025 at 03:48:05PM +0200, Adrian Hunter wrote:
>> Use pci_alloc_irq_vectors() to support all IRQ types.  Do not call
>> pci_free_irq_vectors() because it is unnecessary when the device is
>> managed due to the use of pcim_enable_device().
> 
> pcim_enable_device() add action pcim_disable_device(), I have not see
> pci_free_irq_vectors() in pcim_disable_device().
> 
> Can you tell me where call pci_free_irq_vectors?

pci_alloc_irq_vectors()
	pci_alloc_irq_vectors_affinity()
		__pci_enable_msix_range()
			pci_setup_msi_context()
				pcim_setup_msi_release()
					devm_add_action(pcim_msi_release)
							:
							pci_free_irq_vectors()
		__pci_enable_msi_range()
			pci_setup_msi_context()

> 
> And move these small patch ahead in serise.
> 
> Frank
>>
>> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
>> ---
>>
>>
>> Changes in V2:
>> 	New patch split from "i3c: mipi-i3c-hci-pci: Add support for
>> 	Multi-Bus Instances"
>>
>>
>>  drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 8 ++++++--
>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
>> index 8ade911e3835..0fd3587671e1 100644
>> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
>> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
>> @@ -203,6 +203,10 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>>
>>  	pci_set_master(pci);
>>
>> +	ret = pci_alloc_irq_vectors(pci, 1, 1, PCI_IRQ_ALL_TYPES);
>> +	if (ret < 0)
>> +		return ret;
>> +
>>  	memset(&res, 0, sizeof(res));
>>
>>  	res[0].flags = IORESOURCE_MEM;
>> @@ -210,8 +214,8 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>>  	res[0].end = pci_resource_end(pci, 0);
>>
>>  	res[1].flags = IORESOURCE_IRQ;
>> -	res[1].start = pci->irq;
>> -	res[1].end = pci->irq;
>> +	res[1].start = pci_irq_vector(hci->pci, 0);
>> +	res[1].end = res[1].start;
>>
>>  	dev_id = ida_alloc(&mipi_i3c_hci_pci_ida, GFP_KERNEL);
>>  	if (dev_id < 0)
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
