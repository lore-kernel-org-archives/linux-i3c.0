Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D24EC5CFC1
	for <linux-i3c@archiver.kernel.org>; Tue, 11 Aug 2026 11:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=00FdKjcPBkvNgLF2cAxcFfAtQ4YbOKC5tv5/LUWOVW8=; b=VyQGPftA0jdJNfqjHOyL27IFD3
	vvWvQKPkHmVDGdBIUW8uph3AduT7ChMPrGSb3Mvw8LsSpzyn6D3mqzPrNR7ck+Nsk9KZaNCXWYskk
	qgkGgKgMvm1gvUN/qjFOCCJaTBMXME2DjsOPV2vh/6F2vJtCsOie4sI9X505qY5P8yukUaLRYw7IJ
	gCPeJMtzK3NiBU4A4/ibnMqK6vkJOtT47xoq1P+PJOxd85sVm5yH9uY/LO01+lglrdxmwf9dkMxLW
	eA+oXT0CJudSUPr5tgOa75m5Tn2ATB57lSvoDc2YgvfQQ/1o2tPlRbBVSB59F1HuabjMeXGgRZIvl
	gsq09wIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtkM7-0000000Du6I-3xZX;
	Tue, 11 Aug 2026 11:09:15 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtkM5-0000000Du5x-3bsT
	for linux-i3c@lists.infradead.org;
	Tue, 11 Aug 2026 11:09:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786446554; x=1817982554;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=aS2DdVejwEtSMqPjCfU4vWEQBFj6AEndibIqpYZQlcM=;
  b=T+K1gCdfmhHpy/knClmRh2JBAfice0jn0PJ+i9+XNQkkNqUPAFOUSwZf
   BSaCryKjEe1/FnFs+0jbKeSVLnnjhZiiFELwkEsOYpZTnf9rsu/TIiTW7
   ymMWaLbN7LJVg4Rx1loHE3mtB4SwuwJgZXjUrWwZcEKOZJecWCUSSZx5D
   QA4yomBGMkJQd3USjxcXTN2hlINcUV/l5PdeJWBfEnEUkWpZbrk3EjU7x
   OYJFLPEqLUJk1JvroHVEM+1inw4uhg1B9AfRHkALFtHaPsR46ZU/NGg9R
   YKURYrZMJJfZLIDSO0E0Rs6SnyMVDtzJ4XnPK9CwPnOf70492MAEEDSBo
   A==;
X-CSE-ConnectionGUID: nmMORP/eSGuRATOMUk03rQ==
X-CSE-MsgGUID: hgpwB1CmSNe+irg+Co7zEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="109763792"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="109763792"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 04:09:09 -0700
X-CSE-ConnectionGUID: Eq/N2WQsR5iQR8rifCMndg==
X-CSE-MsgGUID: Y4KnQegQSki93Q3sma3UVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="267161068"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 04:09:09 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 04:09:08 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 11 Aug 2026 04:09:08 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.56) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 04:09:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UxINURshZbYJ0djMUgnMGtwhG9/3vqcaZ2vSxGwmnfgXSxID1QqMST+FmcsAXqTis4MQ8arSGlVRqr1MWj2cKjm2Y+NzZ/RaYrP0lDijGptkGJZvT7mzCYjAJWCp7pFojHcb+MKeV64IClcXRRw8pPA/Sqe5u4IklZgeoXqzwlK0npciSpTorG0MMQy0qSBQgYWhHMGk9fiYh//gUgT04rN25KvrXPlx2mCC/tS9RRKzLJ2gf8iv/3q6ozJtarEHHKG/TGFmK9a70SaaR8WIYNKROkL1b7pVQ/vmwwsvzq/Fp1Xl3hP/PgL3oE8ow1kLueSivwxVdVLF/izIDa66fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VHBtmiUXBVcOKdhP0NpFmSE+PngGFHbBTsNfvjvGqpQ=;
 b=YXCPKiUnl7bfEiWvr1fE+yTYUkhKDC11LhOxJ8GLVkagZfsvt8EADZDwoDRakFtTgmLXXeGCtUoTf/RzOZhIVinOG8tnvvVic7Y7DyWKg1WP8BU9J3CnKuXz6WT8rYEhi83vH5gYKg8NrTDKzglDhwyy2oES2WJVB84qjvYZDLhSqNFIdS4oin2nGK5wrWZh0nxga+beJt0K9VbCuLrUWjC2Za86QZuEYxXhRAGoKlYs6ga2h+4dsFHZ1sfFUkrkoKT6zMIATT/vSVoVTFqHMAxbMBMKalkDmY055VPpthx1eonTZldOxxYUS7+2k7+djcfV1tf0sodPibJzsLQvPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by MN2PR11MB4533.namprd11.prod.outlook.com (2603:10b6:208:264::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 11:09:06 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 11:09:05 +0000
Message-ID: <696fc06c-05bf-4c33-9c8c-55a9931232ac@intel.com>
Date: Tue, 11 Aug 2026 14:09:00 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] i3c: mipi-i3c-hci: Enable IBI threshold interrupt
 by default in PIO mode
To: Jian-Ming Liao <tim678910@gmail.com>, <alexandre.belloni@bootlin.com>
CC: <Frank.Li@nxp.com>, <jarkko.nikula@linux.intel.com>,
	<linux-i3c@lists.infradead.org>, <Jm_Liao@asmedia.com.tw>,
	<Chloe_Chen@asmedia.com.tw>, <Yd_Tseng@asmedia.com.tw>,
	<Patrick_Yen@asmedia.com.tw>
References: <20260709071744.333403-1-Jm_Liao@asmedia.com.tw>
 <20260728093239.487156-1-Jm_Liao@asmedia.com.tw>
 <20260728093239.487156-2-Jm_Liao@asmedia.com.tw>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20260728093239.487156-2-Jm_Liao@asmedia.com.tw>
X-ClientProxiedBy: DU2PR04CA0277.eurprd04.prod.outlook.com
 (2603:10a6:10:28c::12) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|MN2PR11MB4533:EE_
X-MS-Office365-Filtering-Correlation-Id: af954578-4749-4030-45f8-08def798f509
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|6133799003|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: T3QJSmt4+WmFofcRBBksYXecUILzysjP6FhO7DQFJQ9B5kP7OBJODSNM9uFyTLvSsXQbv4B7PgfZfX+BdgYNrFDCZnKZH64y3s+5+SW8iEZsaJmhYSi3RwyTfZRf7sU+6uvcwlDG5OSKko0QC3uEC0qbSrRvlGan0XAZliK7eiLnVyo9B97HTzqPjt5M7e0v0bwuSHrmSwY5y+nQjJw3r7YEFjDR/d/GM/AfgASxxSy/j2rzEOISgxdCBtUEveGSygC6aF+pDGfYpxkcD4Ue1S2hryeWFJs+rNF9TDm7QgQXQ3jd5o9FwIAYxxZbabkrKg3xZ/fYcUU81amk0y9VyL5o7V0DemX7Clwca6BUK2XOQ2Bo7O/03AXjcSGR6fvlBQSmYI356WLnRyaFuekyN552pGDnPBCN9Xbp8yfKQpotO753ApBCuJqCx0BlIe/0fRXiwuuTIXnd4TP/SxIps18up3apbo0JtpBQcz8wGWsub3vzD7i4ERAecBmiC/CYg9n3Y4IHkB38UFjpgNnM8+1FWL6KUP8KUE59NPEfcEbyKfb8s8oGx4qVmkgb4ZY9JuZhvW+ONF4QpjsVT9uh5clkDpYTzWo1klcNL1fMw38T9F7hAh5jl65XmDGlu8U6YXEw12NM1+D+7wutmtwTG+qtukHSJIqKyUBaKJ4F7/w=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(6133799003)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?alJRUkJLNHo3YnlIVkZkVFpzbjNpZEt2c0dvZ25UTHJGWnZhbU80eHk1dkJZ?=
 =?utf-8?B?cmlUOHVrUzVXeWZqaUIxdllET0JLanFUclo5TFZITHg1aWVibm16azRpTmhr?=
 =?utf-8?B?eERwNVhFSWI4K1ZKR1FlV1llSnNuNERoa1NvMHluVTgzRkFJNEdKR1RLTXBq?=
 =?utf-8?B?amhaMXFTRG9vL3JoeFgxN2FRYzBxd0tmaEZXOE14QThiMi9xOGVVWXF1ODlW?=
 =?utf-8?B?QWxPMUpzbS9ETlVZMUIrMGtzTXVHQjlaVG1jM3dsVGViREdEbHJmOVFkYXpl?=
 =?utf-8?B?L2lYdVdac1YxWkFxTGl2blJsK2dGcGhUZCtTUVkvVktPVU1CazFIcFlyTGtR?=
 =?utf-8?B?K3lkaWRXYS9vK2JxRkZuWVJDZnlqUGlkWUFnT0RhQUxJWkE5OU1ER3NQMXk3?=
 =?utf-8?B?U0J3UVRqdENxbFY1ajdjOWxLaUZiTE4vemRJdXNGcEhUQ0ZXMjR0L1NubTNn?=
 =?utf-8?B?dzZNZmNwTkhFQ2RhQzUvdmhEdzZrL1VJYlc1YW05NFA0b2Z6eXE0STZnQytj?=
 =?utf-8?B?cXZRL1NYVmdEWG14SzlCWWNkRDFXWDA4OTQ2bVYxT3Fwa3JobzRpUGxzczcr?=
 =?utf-8?B?eDNYRE5zQkZ0VHNZZWxvNHEzMnZTZFdyVzV3ZG5mNXlzK2ZtMFpzbVl6bGVY?=
 =?utf-8?B?YXE0akg4enJqT2xLd1MzdFFuQmo1YlZrdVpmRDEwNXlzY0k3UktTYyttcVli?=
 =?utf-8?B?ZXl4NG9IRHVUQzdxTGpCWHo5Mk1GQlI4MjBVMk9aL3dUcFpkRGJzUHBEL0ZJ?=
 =?utf-8?B?VjNONFdZZW9jTnIwWHF6ZEluOGRxdW1DQVpZUFRFSUI0bFZ1aDArNGRHUEds?=
 =?utf-8?B?emtoVFlaN3FWdzZUUFBqbGJUbHBmYXhwdlRHMnZheVBpbEplVlozVEgvT2p5?=
 =?utf-8?B?ZlozL2x2eWxkTy93YWcxOEs4UWpnV3JjbnlDaGZQdGNnVUIwR0NuM3BUNlNu?=
 =?utf-8?B?NmZpc0JyK1BsZXFRZDJWZDQrL294U2lMV1pPcmZoT1BJK0hUUjhUcElBbFZM?=
 =?utf-8?B?V2V3b29tRktBVHZiL2dFTFlKMGJLdFYxSDBxbmt4ck5kYWlCenowOFR2M2Vj?=
 =?utf-8?B?RjRVRTJKSzEyTlV5WmpVYW91ZnAzdmlteGszMmc1dlVDTU1RVDV0ZGJVVzht?=
 =?utf-8?B?OHExTmxLWUQwVG5CK1JXd2tKN3huNXB5ZUxSQ3JKYndnTmpENTJocS9LaXFK?=
 =?utf-8?B?ekt2dXo0c1dnYnhmT2hHeUhySFljNW41bUV2QmFnQitVRmd3WWNxdEplclBF?=
 =?utf-8?B?ZU1TMEFkOU1KZWJ0TEs5bTd5anFWMGhCNGQyaU5HM0htMWJCS2kvb25iQ0l6?=
 =?utf-8?B?TDh1RlMxbmF6dUQ0YXlVQXlIYWluamZHOWdNZWc2dnpRaWIzVXVVbzJ4SUFV?=
 =?utf-8?B?TkoyYWt0c3UxK0RzcFJSZnpYQ1lvWjBJZlQ2dnVqdnpzNjhVemJvdmdOSHBQ?=
 =?utf-8?B?MDhJdWxSMVdZQU9yVkRxa2lSaUo1emhjS1g2UlRJam9tTG9ReEdtclNuU1RS?=
 =?utf-8?B?V2FLWG9wWDBKeWhQdFhPbTZRSWlJRE1kSEdEWklVbC94K2VMYXhMaGhpdWc3?=
 =?utf-8?B?Vk5jMmNyaktVM3grK0hNWXN4YjRxVGJSeWNTTlQ3WUNXL080TG40alEvbWRW?=
 =?utf-8?B?WHU5KzZaSDVXQzRndEVmYWIzajNjaUg3OGw0b2JBamFnYlkreGVEcHBxSEtr?=
 =?utf-8?B?cFd4eWRrUkpqeTQ2ZFNOR0lDb2pML291TWNwYXgweHVNVkhDV1lhUnFnUUF3?=
 =?utf-8?B?Unhmdm5XeVFucG5QelJ3Y2lNR3k1WmdGYWsraitObnJRVDJTcGR0OGZlSk5G?=
 =?utf-8?B?UEt0MFd1bnJPZ2dtaWFvTUxRQ0JlTGt5STBpdTNxK1h1Nk9ReGpsVmEwcXc1?=
 =?utf-8?B?Y3BFVW56MHdRRldGcXZHWjhDT0c3cEptRzJOYUsrL2NVL3ZZWUhaZTVySC9Z?=
 =?utf-8?B?VUpVdGJXaG8vRFhzQlJzemo5cXhmWlRlRFhBams2dGpaMTYzem05MEdOTVUy?=
 =?utf-8?B?RG5YVjZmWkE0TGFscUdJaGdFd096d1VyQXhyckUweFhaekhlWW1jVlR3d0Q1?=
 =?utf-8?B?K1ZnUWxtSFpDc2xnMlZLSmR3eHQzcFBwb2xMVHVvNTdBdUc0RVNmd3hVdHJH?=
 =?utf-8?B?UmszMUU3YlJnbjVRZE9UZmR3dk5xdlRRSnEzQ1hSYmkyOFJ3QjhiOW9MTlRq?=
 =?utf-8?B?U1JDZzVzUjBaV3VtUVJHR1NseXR6U2hzZzRWeEJYc1NRazY5NzdMa21GOURm?=
 =?utf-8?B?Sm9WVk5UQk9sRnp6eU8wdzRaZFJtSlRCd1EyOCtKVkpkSHE3NDFwSjhEU2lM?=
 =?utf-8?B?dkR5aTU1N1ZHOTVLUnJESEFnbFY3Zmpld0FOYjI4V0QrUy9mcHVFOTRaS2s4?=
 =?utf-8?Q?12v8MEqIbLUD/wV8=3D?=
X-Exchange-RoutingPolicyChecked: NYmaJCnXP2dOgxP42frf410muEUXJx+mKXGRrJ9ezhCquJhGZWdQD3wjGmXXqKlJyy4d3r9XAVYNDUnbe0OkAtMZnDcVSjXxxjy07/u6NJ4CtEc2frPsUqzk2xspvf/4lb+rnc8klWGhF3PwOUfTh9BSWo8O5lO2fpebRxtbXfzmJa701BTRneWjkC3zGa0FuZRSdkxJ6yQJL/xYZKX3GZS0grkrsPD5jobIYGvKa8RoUOS45UpmmO5w96YuWIMv1nVi8x+aJP097+phlOT7kIo8KgWoU6kTeRv2LB/VcYPiwMB+A6TLg60WMhDqcekTAmWutP69rtOqrlOWaln9Mg==
X-MS-Exchange-CrossTenant-Network-Message-Id: af954578-4749-4030-45f8-08def798f509
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 11:09:05.4693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b45j/u55KRL2g2MmY0FE6pqU8AoQ9FYy48Lml6udGtChSsWXNMx8BXk+6YKW5Va50+/vSUFzkNYlQSYp002j/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4533
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_040914_001035_FAA17A28 
X-CRM114-Status: GOOD (  18.01  )
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

On 28/07/2026 12:32, Jian-Ming Liao wrote:
> Enable the IBI threshold interrupt (STAT_IBI_STATUS_THLD) by default

Seems like it wasn't enabled at all before.  Should this have
a Fixes tag then?

> during PIO initialization. This ensures that early IBIs from devices
> that have not yet formally requested IBI routing are properly captured,

Is that right?  I think DAT has always been initialized with
SIR_REJECT.  Also i3c_hci_addr_to_dev() has recently been
hardened to prevent IBIs when they are not enabled.

> improving system responsiveness and stability.
> 
> Co-developed-by: Patrick Yen <Patrick_Yen@asmedia.com.tw>
> Signed-off-by: Patrick Yen <Patrick_Yen@asmedia.com.tw>
> Signed-off-by: Jian-Ming Liao <Jm_Liao@asmedia.com.tw>

./scripts/checkpatch.pl warning:

WARNING: From:/Signed-off-by: email address mismatch: 'From: Jian-Ming Liao <tim678910@gmail.com>' != 'Signed-off-by: Jian-Ming Liao <Jm_Liao@asmedia.com.tw>

> ---
> v2:
>   - Removed "Hot-Join" references from the commit message and comments,
>     as the change focuses strictly on enabling STAT_IBI_STATUS_THLD 
>     for general IBI reception per HCI spec.
> 
>  drivers/i3c/master/mipi-i3c-hci/pio.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i3c/master/mipi-i3c-hci/pio.c b/drivers/i3c/master/mipi-i3c-hci/pio.c
> index ff2657ee220b..9df114ef0278 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/pio.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/pio.c
> @@ -185,8 +185,13 @@ static void __hci_pio_init(struct i3c_hci *hci, u32 *size_val_ptr)
>  	pio_reg_write(INTR_SIGNAL_ENABLE, 0x0);
>  	pio_reg_write(INTR_STATUS_ENABLE, 0xffffffff);
>  
> -	/* Always accept error interrupts (will be activated on first xfer) */
> -	pio->enabled_irqs = STAT_ALL_ERRORS;
> +	/*
> +	 * Always accept error interrupts (will be activated on first xfer).
> +	 * Also enable IBI threshold interrupt by default to ensure that IBIs

Actually, in the current code, not enabled until the first xfer

> +	 * are captured, even for devices that haven't formally requested
> +	 * IBI routing yet.
> +	 */
> +	pio->enabled_irqs = STAT_ALL_ERRORS | STAT_IBI_STATUS_THLD;
>  }
>  
>  static void hci_pio_suspend(struct i3c_hci *hci)


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
