Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 901F7F436BF
	for <linux-i3c@archiver.kernel.org>; Fri, 17 Apr 2026 17:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ZBhvGvUurs3nEWYF0F2crDJsMH+5weex5TLR3cUxq+U=; b=op7jP0bpOnry9H5aEH5Qem9Wue
	mOwPEmQEYzAL3HSvzq1WRmy3BjYsufEix4QSZjS4/UuE5nCzdk8Zxwu8wRYOmwI1dewStTnptuS8t
	4v4hKXRqES5IceytxFtipdQ+maZJr+K0dFgpz3j7+VkseQYkAok2AOh1Ydxbe+QhCIhfb+tp90r0h
	lzk/H3g7PXYbx/Bf9ALxZgIf8Yz7W0qJivzrKDSlepKgFSeXPlWZhV3fzd2sbtFxe+9lTqXhGVa9Q
	TIa6I92cEFYsStFrLhrMnL+I2noNYFRteZMkUFLd7B1XCKkq5AuSNMkdv9O0SyyOu8qfrnot5HHxX
	c4t+Pfuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDmkW-00000004JF9-0O5D;
	Fri, 17 Apr 2026 17:13:00 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDmkT-00000004JEo-1tih
	for linux-i3c@lists.infradead.org;
	Fri, 17 Apr 2026 17:12:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776445976; x=1807981976;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ZEymeR7dZgJmwKaxGZ1Y2qYUDz26dQ1CLb2DgqVUkOc=;
  b=BamUcH8H+HWQfAZcVmqTtRX/C1eLcBRtRfxBvJ2si+0JNeKtyMhSaYve
   HuKThG6Z7b83txhucDDmAWDGiHNXJRouiFHif+bjh8W88OBfo3Te2ZDxY
   dJSLhVuUt9v+F1GjqUc1YDDNPIWfzNTL/jrzjAVwkIxI3wxMTZ9tjOonQ
   oqSphYUxLgbSNQD+oAMOdscdcFJSynCK58BfikgUzJqqq0DbCi/469m2B
   if9GrblbT0blSMo/OvJsDK5uiKI/yjKp9HXzIclLAiyr3GodsgSQZQrlj
   h2WCCBvEq60x5Z+kFulCXuOSLa8xavkMLml9aKrH0LnvKmCiWybJlPhse
   w==;
X-CSE-ConnectionGUID: 2QmJkNOtRwSl/N+ZuekWWg==
X-CSE-MsgGUID: DXpN/4NKSiOLpYtnO2ONFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77539693"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="77539693"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 10:12:56 -0700
X-CSE-ConnectionGUID: TuPxJ9d+SEGLcM1h5jSv1w==
X-CSE-MsgGUID: J6DQ8uZlSbqDU3HHcuo/aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="226409947"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 10:12:56 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 17 Apr 2026 10:12:55 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 17 Apr 2026 10:12:55 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.2) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 17 Apr 2026 10:12:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NGBXhtvxqk6wPqExOZikyscZtNxhgTZhQH3c+Avcwai6L+9HD3e2A9CieFntm3nDZZEb5tg/50VOOxge/r0txD0Env/T3qn15hHkdGZM1wwgihCCUEFoViOH0Njie6jmolyM0Ee1AI765Yw3yrfz5Lpf2IYhY9YZYoz0gtjv2w/RP4l1WNPiibHoEYQTwDCIKSQYtoFNLTZZ9fyBk1Gk3BIXR211dpc3Kc8wARBenCEqf60rCcH9eYy/bAewaO/uK9xkUxwW90aJozdhJZQbRzFvWHD4uUdn/wN9TEWCj9ayWdc0K5SdrQ4CTbntTgDZm5TBG37P1f8MZNbWEKTdNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B0IwrnKnavDTjXKiHYrGpkTX3KOLS4FCsYKPNmGXctk=;
 b=P/wyVm6WRQpFE4QC3Zr02WPy9wtyd79q7aAfsuCsGajxpoM+VHrPvqXLZCMeJFmxQSySq/yHiglG6Tp1CMuT6yB66JkCLeywBFajB2PdrUvwJOfZPkyo4prQbwkHmxIcxmtlf9V5x6LT3TbkIYI4CPoxyfg4db9SIuyDfy8uyPtPPoltPVHcXxZJeneOGFJYUQBXotzMjVT9SJorwYlk0Kk4kfCw+ulvWLdkZJp4t0+Jxg8t6cyU66J67SbeNKTbTz0bA1j/qadzE4XLghtpnTgus1xf3SQedocLX+04JAsMIN8o+qvqSVw3Eyg7gOlYAwNMxQg66pqVEob1uElXRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by DM6PR11MB4691.namprd11.prod.outlook.com (2603:10b6:5:2a6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 17:12:50 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 17:12:50 +0000
Message-ID: <542a004d-e615-4bf4-962a-91736d7a412b@intel.com>
Date: Fri, 17 Apr 2026 20:12:46 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/16] i3c: mipi-i3c-hci: Complete transfer lists
 immediately on error
To: Frank Li <Frank.li@nxp.com>
CC: <alexandre.belloni@bootlin.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20260416175704.41217-1-adrian.hunter@intel.com>
 <20260416175704.41217-8-adrian.hunter@intel.com>
 <aeHrGjZfP6_LcXp4@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <aeHrGjZfP6_LcXp4@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: DUZPR01CA0027.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::14) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|DM6PR11MB4691:EE_
X-MS-Office365-Filtering-Correlation-Id: 38d6b6aa-7ec9-4fa9-bf5b-08de9ca48dc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: Tb1+Of7dS+fBaeE9+LaMswxU2+BSl/Sv6kVFzjrpMZgLhYg2zCCnc2+vYFoITq/yC/GnPbD8BIt4oTORuiXbdK2oT+Cq70QSesczG6gzcuKIPEIY6aRY5w0rmwOAMxX0yxsAPYTl3WEu1t2kDIY+D+YpNTEDssavsI+q1T/6gFOWTWBKaMXUyYuHP0MRwjrngoo7Ipmauaey4G7MDfrnVNFyvMXzFg28NK9oriQwKouSBSIXQL2HMBHu/RmqkcH/RPkW8HVWLf51yZRBuUDDME/uuQXkWikiplih/DtBvtRfItrGNp/+TrX1WuUFhX87Yv519D+bWX9TtZVIJD/eV7nZzotflC4yA62uHLd8YPF9t17niY7wty4ohGDg5E5iMUosd+KVBCYSTHcZxnfZWrPGbW2TFBGNIFVA4obe3elEVEO0iYXgymNVhsgAF7yhhAMX2hUzXAkrWrnQ0sukILfBq3LeWyXqx2F7jMiJPs22xSM5YM+I7Y7qjDrDOq1M/CAc65MIDBoRmT7Z9rZ8RqgCO9F83LzfJxnOPd4S2zBYI0Ku/s3fj0c9hHAUKAUh0Evxzfsdnlllbx2jebvqDvwqrlcGgyGDp+XDfGZdT+a0nQyFs57lpKVMGt8wur8kHVI2+lqZRPvNUxoT4YM/eHWlQZMT9lsiTevNFjohTx6m9RE1BRnrEgtmQf1BJcLTPjiMqCTU2Nakp97ZdKY1DANVZfk2DlxKTXfCBo+qwHE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ri9oZjhtd1V4RlhQSEZVRWt1OXBoU1AvL29iZ1doWHNqMkF5bkl6K3J4Q3RZ?=
 =?utf-8?B?ekZkdkc2dWc3WFUrQVpvdTdaVTdTQ2hCOWhpbW5BOC9uSUNmU2Vrb0Q5cHFh?=
 =?utf-8?B?TTVHajlFeUl6aElKVG9mSmdzSTBqdEsvbkU5YlNYOUdYQnBuVjJsYThTaUpn?=
 =?utf-8?B?ZXZyWWpRNmF1WWsveXNibUR4dnpOYWpscE0xMGJ2K1QzN3RiK2RXMkgvZXlF?=
 =?utf-8?B?d2hyUWxRbUlQUzlDbkFucnpCUnZpNUMrOWdSMmxWRzVmYnJjRitBOUxTY01R?=
 =?utf-8?B?a2dWZnljK1NEdXE2VGswZjhXSzRXam8zR21FMzFBdERBS2x4RlBkZThBZnE4?=
 =?utf-8?B?MkRrUWlXekJQbXZQZGVmbCs2YmFYNzRzR1Z6TWFNSllMSFpvUjRZQ3pDMWps?=
 =?utf-8?B?QjQ2VXFJS3RwM2hINVdJS09CYkdXQWR6bEVFZGs3eU1zUXZXZjRTNXN3WnRF?=
 =?utf-8?B?OUxEeGtqS2pidVJjRmZHYlJDREttTU5nVWhUcjZLaHRIRkxYS3U0ZUlIejZQ?=
 =?utf-8?B?V25sR0Y2RlJQZ3dOK3lOYXIzR3cybmQycDV2WkMyc3BxYjlaS2RBVCs4Nk5F?=
 =?utf-8?B?TkJic1BkZGgyZVQxVGsrZHNZQXRjWjlwd2pnakxSd1JRSTNZYUh2Q1d5amV6?=
 =?utf-8?B?c1FqKzR2aWNhRUJ3UjAwQnZmL1JHR3RRZmJYUVllSHFrV2taUGdwSjRuWkc3?=
 =?utf-8?B?cndBdys3UWgvWk5HUUd5ZWJjR1ZleEN0bU1XVURlcDJINGgxNmRQaCtPdGhJ?=
 =?utf-8?B?ZDAvL0VHQ2JvRUdCbWJHNmFiQU0yVkhRL3JESmc4aWFxT0ZUb3NkUm9VcFBD?=
 =?utf-8?B?WFptbnpnemh5dnJud2RYdFFaK3B0WEpjc1JHZEo2WUxJdC96eDJZT2M3UlA3?=
 =?utf-8?B?ZnJCcEJ6OElJS0dQY1JIR3lkUHk1SWNEaHlCV2lEODhXR0h0QlZBYjczeDhj?=
 =?utf-8?B?OWNHNEZQWFl2WXpuUVRPTEU1U3JqV1VobS9EQnVGdU96UnNZSndKMGVnaVg5?=
 =?utf-8?B?N25TSWtkditZNFk3WFJpQnI5QTFtMWhCNm90aUdubUtpci90UFN6NHZLeDA0?=
 =?utf-8?B?bXJjQkVYRWJranlMbndIWlhqaVpDdEFwUFBZRjRyakNCcmRuM2c2UE8vZ2VD?=
 =?utf-8?B?WDY5NXR2ajRtbXVnemJ1aFNiM0ZoQzRVQjdQamN2WTlkb0UxbDJsNFFtb3p3?=
 =?utf-8?B?MFRjYnFzay9VQWQzcmxVWDBPbGFJbFpOM1VaM1dIMWZESXFmdW95cE9LUWJI?=
 =?utf-8?B?aWpYbWUyT0FkK0dHbVViaDk2djI1a1ZleVJ0WHFMU2lyRlZxMEY5ZEdoQ09v?=
 =?utf-8?B?UVJRQ09KbDdjU0EvNkdmWmY2cUtTRVhEVW9mcnFQZWpPTDJwR2ZOWmFlcFNX?=
 =?utf-8?B?V1FxbzY5REU5d21ocG1VQlJJdlJqYUFrQ2dYVVFzckNhcEh6SmY2WDFOSTYv?=
 =?utf-8?B?OUZVZ0FBYmY4WFhuQnFkT21IT1FibEloVmlmMFFaaDFRRFU0MFJDOHl6d0V2?=
 =?utf-8?B?ajB1T3BiaW0xSVB0aHBqZ09OWE55dzFFazEyQllrUEs2NDdObGlnM3plbGVv?=
 =?utf-8?B?cTlxdHZYN1lZZVNCcjJWaUh0ajNla3BJNkM3YzBjd2pYNnZLYUVhU0YwNUt6?=
 =?utf-8?B?TUl5aTdlLzVwbkhaamtjK1lPUzlSMmpmMWVyQzh6YjBMcUE1eklodWRBcUtx?=
 =?utf-8?B?Q1RIZExaZWRjNHdYSzdSQ1V6bUlpU29LVzNNY0RieHZ3WWo3SUdMVXhTY0x4?=
 =?utf-8?B?UmhLV0ZKdzRiYWdCeHlYUnZUcHpVQ1RwQzhUT09RSXdDczVtUUVkRnF6dEFy?=
 =?utf-8?B?SWtwMW1aY21IeGswZnhVb3ZvZXdzb1JFeFdMaVhlQVV1allOY25PZmZHYmg2?=
 =?utf-8?B?WWp0eWV1UnR4bUpZaEZNNjJPYmFWMjZUNWU3bGxxVDExS0J2YjV1RGhGNHhH?=
 =?utf-8?B?bjJsMHBmbGQ2MldYcjZoM01ZeUZRMHdPTmZoQ1c0eWIwYi9HYytoZlV3SkdH?=
 =?utf-8?B?SEhhdnhNOWFHSHp5M3pMQVpGZ3U1L3JLSDRLMUhCeWN4amR5a3BVSWZZS1J1?=
 =?utf-8?B?b21oZUs3NlRlVlNwNTg5TzlSdS9Dalo2TjRWN3N0ak5BK3JBemd6dFZENFpu?=
 =?utf-8?B?MTRoMk50ekJRR3ppZ1R3SzdJeFFYa0pSSXlYbjR6cEkrK0JtVW9ibWJ2dTlt?=
 =?utf-8?B?OHpqVG9BNnc5akZJcnFyR0pHQnBoalZLT08wSEp3L2lNQmw2REpVKyt6aVhE?=
 =?utf-8?B?VGRXdFBEb1FWRVV6eWZkK3FvMW5Uc1NXNGtVK3R4NDNqMVdreUxRUGhBbEc0?=
 =?utf-8?B?VXdndXBaeDlMbTRaMmtFSGVleGxBMnpFNDErNlJ6NUtIbmRQcVN2YnNDQjF0?=
 =?utf-8?Q?9q5YxUHXS6cKeXUw=3D?=
X-Exchange-RoutingPolicyChecked: VgoDmkvL+c/u4YfiHq/uDZAomi6rSdlLu1FzZyTLQA1rnwxmQnOb5IhBd4PjOU9oKWsTA/4vc95Z+S6IC4bXl0Ey01GHMMGh40jr3PSD7S+ihPYVDsoX0Jh2laIMkDcISIqYV6NPXJbrg2XMOoU3XixPBU4Qe9V+Z1t5sNZ6IFQdx/d9wFNrVVPrFpVwKBEF2UZtDEzN3dZPYr2akc6rMC46McCx3hIU7B+DWypmB4BzpF0AprNYTAr8pTIX5FH3vemP4peatCKEBk3wouqI0HDV+VzIbBFVJ9sbi+bcSrS+D84uEF0aA5N2gugJVRsEYOOju2iIAwNGtq1Eb0Vg8w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 38d6b6aa-7ec9-4fa9-bf5b-08de9ca48dc0
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 17:12:50.1984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GhW0OSVGC9CH+Xw4bJKWugt1mm4wVJO3t2NoiTZtdJcIxCTxTyfpeFXY5Mo/K2IxLNd7JM3iwKMR5BKGdsp7Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4691
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_101257_528829_96F36C7F 
X-CRM114-Status: GOOD (  12.34  )
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

On 17/04/2026 11:11, Frank Li wrote:
> On Thu, Apr 16, 2026 at 08:56:55PM +0300, Adrian Hunter wrote:
>> In DMA mode, transfer lists are currently completed only when the final
>> transfer in the list completes. If an earlier transfer fails, the list is
>> left incomplete and callers wait until timeout.
>>
>> There is no need to wait for a timeout, as the completion path in
>> i3c_hci_process_xfer() already checks for error status. Complete the
>> transfer list as soon as any transfer in the list reports an error.
>>
>> This avoids unnecessary delays and spurious timeouts on error.
>>
>> Complete a transfer list completion immediately there is an error.
>>
>> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
>> ---
> ...
>>  			struct i3c_dma *dma;
>> +			struct hci_xfer *completing_xfer;
> 
> Generally, it should be working queue.
> 
> So working(current)_xfer should be better.

The completing transfer might not be the current transfer.
This patch is concerned with transfer lists with more than
one transfer, and an error happens on a transfer that is not
the last one of the list (the last one is the completing transfer).

> 
> Frank
>>  			int ring_number;
>>  			int ring_entry;
>>  		};
>> --
>> 2.51.0
>>


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
