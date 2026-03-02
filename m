Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1ADBD58E7A
	for <linux-i3c@archiver.kernel.org>; Mon,  2 Mar 2026 08:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=xv9UN8csZ4jW3VEB0Tt+ERmliYjuoejBQPCeGT3lh1U=; b=IoQ4u9qWC8cwUT/6xvZZdBAIG2
	voWL/YEXJIKp818kxqcFCIVP3watDGjStEbmPTFLyGfIB/1SDycRFbdZ2zH0A3ZubvicNcSbxLn5O
	LOPhEB8zB8O+5mQzFQPmGNzV5uisdNOIrPwYLrxEzrLFg6Dv3kHrlKM0ip0sgPBB44x1+q9p4SR3C
	uJDoI8tCQbGAu2+I6l/6rT4bH4Q0txO2+FY8VSdT3AxYqp+m8pXdOhtri7m/hf00SeqwNInxkMIrB
	99YBZBshxY62Lih7pzB+b4viYCjnelbFzK18GEOsrDyhwDmRpy24duCeaTMFUSHMUEyMx7fn+zDx7
	ylLQ2SQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwyu0-0000000CXde-2Sr8;
	Mon, 02 Mar 2026 08:45:20 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwytx-0000000CXck-3g8M
	for linux-i3c@lists.infradead.org;
	Mon, 02 Mar 2026 08:45:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772441117; x=1803977117;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=JLElx7boTIoklK0t9U5gY16mua8mYkJnKaijMlNCLMk=;
  b=bHyrVS+c4Yi79U8QE/OWoOyAFBUj13/Q0vCUGNGM0JHMa9bNhsoKBHv7
   JOivKWijORfr0s+xkXhGMc1eiZJ6zMAds0xzg6f8qDusuetwVqjsZbpzo
   tRL1iwKB9pTQ4824kqOGnx9uZUFy6411/un+S0hFLxpVX9GlvE3+nDnyI
   OGBwDKMQPiFEQdhtZ6DFsXnEfuPguRdCdWWc/Iw+zC/XD8/oLS3dQKAMj
   HDQq81sAnThDqbSDa7ChSFMzRbP/FQIcBL6CikbI8hJ1ONe56lKCyXk4X
   IJhACd+0luGpKXX02ebUKg03245/Fui9v9T3lQV28HejudrbFUmg8AQAn
   g==;
X-CSE-ConnectionGUID: p/CPwKJgQnWYq5l+2ebBJA==
X-CSE-MsgGUID: Bq8IP8UQS6qSRQy0DhEfkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="73311137"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="73311137"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 00:45:17 -0800
X-CSE-ConnectionGUID: JhGbhe+rRReFsWvmbegy5Q==
X-CSE-MsgGUID: XBzSIhEXQjq3gkDJet5RIQ==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 00:45:17 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 00:45:16 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 2 Mar 2026 00:45:16 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.46) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 00:45:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hnC1oR7dtOaoEDJtWm6WZdVwc9b8xxJ0GQSoCHnBTp2cXn5YtD2x+agOtHt6zJQWIo2AQarBHcu0Qi7YDY4Gz6JIhKqh5OVug7hZlZ8+OKjNkZuKHxtz3r9/sRMWAppdtKLvl73rPSeNhzZKHYVlhGZJHOXq8i1G4zAor4205bactJEB5k2o2ZphEIr2Hh3y94HUZ5VaEWiDHSry9PxJmuchMj6CQouRjl5RJKrqd+2ufPKBedRX90TLboEOKHgz5fs06LQCCEPdGrGYt8nnIR7+2cS+6dIqjuV3qdSTmNfRKj1uL3eHSRGwVBkH95o2D+uShZAqBodzdJ8KaE/erg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U5L/f4G4lwrHtCTkmA+TI4bq2MEAx12T7KYSCmAAomE=;
 b=RLBOZKI1GawJfK5B5Rx1VIS44zTq+/NHpyUUAyKazk5inP4zLSwEuGB/aoQ/KzMTAjnPt2JNY8HLaoGrAqb6UFOPYfFJtsQAWLTbvTw0SHrGfiZ6f/dQtrStQD6+aeeeSkbzlKJEYAmW+xMaWsw2iP46ScMX+gcXRqeJ8xhFR88Rx+ZTdMNv1w1B0bmFy3LStA/J2uBvO35bYX7dLbG0PjTdKjQFVpNh8uJmKiTAqGOWpwrqTu7HAFcSwRGaKaDuwCC32g7dLnnVoEADOrbN12pb5YnwUR/pWrTD7xMvJpLI1MfFdm6Tr4dj8FJveDbLPXks+pnojXV8GPFcaNMThw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by DS4PPFC60125F65.namprd11.prod.outlook.com (2603:10b6:f:fc02::4b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.19; Mon, 2 Mar
 2026 08:45:14 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 08:45:14 +0000
Message-ID: <e20c5876-01ba-4153-8317-25e70337144b@intel.com>
Date: Mon, 2 Mar 2026 10:45:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/12] i3c: mipi-i3c-hci: Correct RING_CTRL_ABORT handling
 in DMA dequeue
To: Frank Li <Frank.li@nxp.com>
CC: <alexandre.belloni@bootlin.com>, <linux-i3c@lists.infradead.org>
References: <20260227141149.184980-1-adrian.hunter@intel.com>
 <20260227141149.184980-7-adrian.hunter@intel.com>
 <aaHFjYAWOlvNkYDQ@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <aaHFjYAWOlvNkYDQ@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: DUZPR01CA0176.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::12) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|DS4PPFC60125F65:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a5ce882-d58b-4ccf-59fd-08de783805fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: ViRrvxMenft9WEKfBJ/vlVf2F4iwNHDIkO065P24NpRhFjc7p70q5pgwchdTm/HGWH4zPdMQjmEq7jCDWbiF8p5lloGToqGN72pcydRxU40MirhF6KhCZi5JbyX0IAfX2t8L0EdALq5RMT+maa2zpUQmebBK/A3GF4qYcpzLqm6JG5DAfhMTwCj32LdtKanDq8lrHeCGT7jKEYWMOQm7Y0s9WreXdddGqeIynvqI9C5MTmnG1Y027sxNHJiNixUCeUiKQjfG1KcFL46n7ZD+LXU/Op8a4WSxiq4aQQlWPRtF5M+KaEV+0cpQllOET8FrT8NKL1qFUkwlrhhgsqnFsL6fpQk0uTN0NQu93eq9ZtHv/jnK7MmK3xI8dUPiSIgGLnbYQwOCNHvmcC5RqzbPtZW0nnAary9P3qZ7Fn/gmxA2vjLG2VvgmJ/SBRFD9p2y3u9wi5BPDVzVGMHRq0mom9zPwfekL66gIqa2CyL/qv1nGy8cmETQvFStpjaUVLuO2CLnvoz+l7iSOCPSBfWwgiqma843GeDcQtX1CE6wQosW3ZQovJ4XQtgru/EXQp1UnSIO+d3Mki6cRuGQc4mJncEqik+GC4IY0MugsMlfcj2cPHAH8YkWnYYfYEADoRPCEN24zw0Asnqtr5Q1TVcgGdap8GeyaVilrVE/XYiKKRtnH8c+97QLTpDQjUGMKkAO7I7CxZo5sE4rS521yPZDgmg4xd5N53hDNS/J5QghuAY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWIwOFRuc2p2YmQ5N0I2Yjd6d3pBVDgyQktrMjJHdmxZT29jM0x0OHdZaEVS?=
 =?utf-8?B?OVR4Z2s2cDVNWk1YcWFFc2V1M3c5ZUp2eDdGSWdhTmVhS21SM1JSUG5sMGsw?=
 =?utf-8?B?Tk9nMVJOdDBuNlpGNWRzZjdPYS9kb3lVS20vV1IwWTIrOW4xZlNQTDBicDdQ?=
 =?utf-8?B?MnNwUHpkdFpwTkRtcEdyZU9yQkptbzJucE9YVVZIUUJPSEJkcjFWU0tOa0hS?=
 =?utf-8?B?OGw3YnVTcFFzaTlZdDNlNzAzcmZEYit1aHhKMVdKZWh6empPQW5WUTVXcmtE?=
 =?utf-8?B?NHJyOXZoTm90ekRMaFVhekNMczZzdzM1RS9HMUgxdU1uZStMMU1TVnF1VlZP?=
 =?utf-8?B?QTJRVGIxdXIxc1pXbVNNZW5MVkdQclUwdVM1TVZEWkxYSGF1L2laU2NRa0wv?=
 =?utf-8?B?WXJIQ28zS0RIcEcyU25GK0xPOHhwSEI2VTZReGVld0FCMEFtZ2VvL09vREpy?=
 =?utf-8?B?TlM0eStxS2E3ZTNkdzl4TS9TRHlnQTZLUU5ONk1lNnBWbVJQeVFhTmlaSGNl?=
 =?utf-8?B?eDhBenpUeFBxYlZqTmlJOWQrR3hLMDVZMWFVZE1UUVZhbWJnNWNRQnRSZDhu?=
 =?utf-8?B?TExSMWNNMWVwVEMxcW1ZWVkvZTEwaEt4VXBubG9RMGx2U3Y4YUhrSTNhNmlZ?=
 =?utf-8?B?WG8ySmJLRkswVHRRcDNpbU03VFEzVUxiQkMzY1JFdE9qSEpKTWwySk5qS0I0?=
 =?utf-8?B?YkhLY3pKeU10djdwaHdtdjVaNGptYVllZlFjSDhXb3BQQ0hRbWVLdTFGWFVm?=
 =?utf-8?B?TFBLWmxiQW9rS2NHZU0wd2o1TWJScmFNMTFkNnRJNVpvODBHUm5EQTlidWpG?=
 =?utf-8?B?QjRkWTE5d0dwdlpnaXNZS2lTL0gxK3hzNUFGTGt5bWdtaXBML2czQ1FMSkw4?=
 =?utf-8?B?dVc0SUw3UXpZbkRWSVE4Wk93MjBMZkIzTU44b2NTeHg3Z3dJeXM3K0ZKcnhU?=
 =?utf-8?B?bEZyZ1pkRExCK3pDUERWY0p2QUtteS9yY2craEVReVRxNkd1MlArTElaeVlU?=
 =?utf-8?B?OHBqUUZOZldmWi9DN0RXT014WVAwTmc2VEt6aC95all6d2tkOWNITUVoRXpM?=
 =?utf-8?B?Y2doUmw0NDNXTzFDS3lkUkNrUjNTQ0xJeTREZ3BDUGRTVlNBT280eXdyaWZz?=
 =?utf-8?B?ZDFPWGRDa01VV2NPSDdzcUpQMlBXbWxrTktCalZXeGQ2TTlIU1JmSzllNjhz?=
 =?utf-8?B?SWNBVU1BMW96bmRRdS90WGd2alhLejRxamUrbUhOOVNqUFFwNTNjRzYyaWps?=
 =?utf-8?B?a1BjK003TXduaWk1azN0SXNndHdyVEEwZkUza0d0Y1FqK3JmUEtUK2VJZ2c3?=
 =?utf-8?B?NFFQWkx2aDhTMDFaWHY5dTVQYjBUZHNZZnYwSFJ4SXlXbnlMOGt6M0prVTZy?=
 =?utf-8?B?UlNwUUhTMzVjYks4Z3hFNG5NM0RxYldhOGVyUFRTR0xyVEIrUEcxY0M0amFO?=
 =?utf-8?B?d3B3VHhVVjlYZFNZSlhIZUl3V0lpbXE0MndRVWlwdWdVUUhENlB5bWt3aUww?=
 =?utf-8?B?TVc0UjltMUU3Q2ErcElpWEVXZGNPanhFL1ZFbEhPU0RBRGh1TjE3NXZiL0xW?=
 =?utf-8?B?cG9lTkdaU1FSbmVzWDhVNXJLeWoxU3AvR3RvaGFudnR6ZzN4Y1psL20wVEdC?=
 =?utf-8?B?czhTM21iSUtLdG10dy9lOTM5Ri8vUEJDdEFEdkRmdlIyM255dytYWHNDc3Av?=
 =?utf-8?B?V0VSbHZEMDRxOHN4S08ycDJoaWtkUnF1WFlZek4ydzhOMUg0ZzNrY2FrcWZD?=
 =?utf-8?B?Zmd1enAvR2RqZ0FuZUk4U3dVbDQvWk5NYldkQkUycjcwTUxiU0xrUGR4Mmxn?=
 =?utf-8?B?MVhNQmRRa1haYk5XejB4L05IdWVrTitvQlJxVW9CUk9kQ1p4WjBlZGEvZjNN?=
 =?utf-8?B?bE00eTI3M3hCR1JwOGoyRElNKzAzd3BmeGFOTTRtUHNkSjFweWRvd084a2ti?=
 =?utf-8?B?OCs3bVA5M1ZFS1RDcFVEODV3K0xHa2JCOU1jZy9sc0VJblcrZU1KZWoyeTd4?=
 =?utf-8?B?a1Zya3Y0OUdLNHlBazcxVVRLeFh6Wnk3aEhLbUZYdEt6cmY5em9Fd2d1aWRO?=
 =?utf-8?B?ekVoR0J5RHFqNGJnN0hLcFlvMzVtU3Q1a2tLUkQxYVdyYmI3NVVXSnl3cFlJ?=
 =?utf-8?B?Y1FYTVpBN1FubWFPckVBcDJyMit2dng0aDY0a2VZR2ZWT0thSUVqWC9QV1Zm?=
 =?utf-8?B?RVZZeVlHalB4czk1N050N2pFN3R4VzJoamV3RTM0TUF2M2lNRllhckZWcXh0?=
 =?utf-8?B?S1RsczNZZjNadEJDTXMvb21walZwN3I4VCtxVk0rMUt1VkwrQ0ZjbGFPT1F6?=
 =?utf-8?B?enpnRXY3ajJUNTlRT2d6MWNkZ3lQdk54SWlmVVBKc3JoNU5zVURWaUY0N1h4?=
 =?utf-8?Q?Z54hcpPnWzWtSMrc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a5ce882-d58b-4ccf-59fd-08de783805fd
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 08:45:14.8854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O8Xh9JejGI1Of/tF9RHR/S3O/0+Ar3lHxo/xlqrz5VzXhfaTk22S0+z+sbL3dzYg294kj84EzUocMpQieJ4XQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFC60125F65
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_004518_020653_188C537D 
X-CRM114-Status: GOOD (  18.52  )
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

On 27/02/2026 18:25, Frank Li wrote:
> On Fri, Feb 27, 2026 at 04:11:43PM +0200, Adrian Hunter wrote:
>> The logic used to abort the DMA ring contains several flaws:
>>
>>  1. The driver unconditionally issues a ring abort even when the ring has
>>     already stopped.
>>  2. The completion used to wait for abort completion is never
>>     re-initialized, resulting in incorrect wait behavior.
>>  3. The abort sequence unintentionally clears RING_CTRL_ENABLE, which
>>     resets hardware ring pointers and disrupts the controller state.
>>  4. If the ring is already stopped, the abort operation should be
>>     considered successful without attempting further action.
>>
>> Fix the abort handling by checking whether the ring is running before
>> issuing an abort, reinitializing the completion when needed, ensuring that
>> RING_CTRL_ENABLE remains asserted during abort, and treating an already
>> stopped ring as a successful condition.
>>
>> Fixes: 9ad9a52cce282 ("i3c/master: introduce the mipi-i3c-hci driver")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
>> ---
>>  drivers/i3c/master/mipi-i3c-hci/dma.c | 25 ++++++++++++++++---------
>>  1 file changed, 16 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
>> index 8d5f808e03ea..dff96b84479e 100644
>> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
>> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
>> @@ -550,18 +550,25 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
>>  	struct hci_rh_data *rh = &rings->headers[xfer_list[0].ring_number];
>>  	unsigned int i;
>>  	bool did_unqueue = false;
>> +	u32 ring_status;
>>
>>  	guard(mutex)(&rh->control_mutex);
>>
>> -	/* stop the ring */
>> -	rh_reg_write(RING_CONTROL, RING_CTRL_ABORT);
>> -	if (wait_for_completion_timeout(&rh->op_done, HZ) == 0) {
>> -		/*
>> -		 * We're deep in it if ever this condition is ever met.
>> -		 * Hardware might still be writing to memory, etc.
>> -		 */
>> -		dev_crit(&hci->master.dev, "unable to abort the ring\n");
>> -		WARN_ON(1);
>> +	ring_status = rh_reg_read(RING_STATUS);
>> +	if (ring_status & RING_STATUS_RUNNING) {
>> +		/* stop the ring */
>> +		reinit_completion(&rh->op_done);
>> +		rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE | RING_CTRL_ABORT);
>> +		wait_for_completion_timeout(&rh->op_done, HZ);
>> +		ring_status = rh_reg_read(RING_STATUS);
>> +		if (ring_status & RING_STATUS_RUNNING) {
> 
> Do you need readl_poll_timeout() here to make sure hardware actual stopped?

No the completion already waits for op_done

> 
> Frank
> 
>> +			/*
>> +			 * We're deep in it if ever this condition is ever met.
>> +			 * Hardware might still be writing to memory, etc.
>> +			 */
>> +			dev_crit(&hci->master.dev, "unable to abort the ring\n");
>> +			WARN_ON(1);
>> +		}
>>  	}
>>
>>  	spin_lock_irq(&rh->lock);
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
