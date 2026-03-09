Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C21F3C241
	for <linux-i3c@archiver.kernel.org>; Mon,  9 Mar 2026 12:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=534ZH2uoOuaumgX5LfX9Omge9mRNokfQccPiv+R4LQY=; b=vAtVloSCIAFizd7vBZCkZErO2T
	z3BbY/2HeG/4hQuAORWgwVh6d2l/MQNd3tgl95ZJlyJwF4vX9OKrSj/0yD0BiyhK6O3lInkbAOyeg
	2ODPKjH3UDfk7TOMZJ2ybsEkQmpZA/NZDHDzGgbel1ht5JHH3ueT/qWco+tTujGOJD3igmSx/IGig
	HHizcDihKHm7640RSaszEyIRg4xMzNsx5HynIz71vYzywKP4oJuJprLXDGyJnjbshqJaP1mI8k9wg
	FZ3pWQtYSPek6lAZ1uBCYiKHMbYuc/LC4W8/R0UJgF5Ib19ocoSbNgHFqXibaM0PttozXzrWSxrSH
	NKOQn7Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzZpO-00000007K5x-4C4o;
	Mon, 09 Mar 2026 12:35:19 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzZpK-00000007K4M-1Pwj
	for linux-i3c@lists.infradead.org;
	Mon, 09 Mar 2026 12:35:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773059714; x=1804595714;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=bP67bugt9rrOA01V0OD0f2Dt5QaD7ioEnGKLvSaDFvM=;
  b=B0y7PQruUI1boiXd/cWCwGIG9kl0ACg1MnQi0fo3P42U04i5/ylXwdeo
   gUIHyvegqsnUxr2C8Ql92kfPmyMvoLOJlGVhzaLJz61RqdC1xVM/Nk3Kk
   viAE/eTDrqata69ZbPMZNKXLGWphABrROyYF/yALpPxA3p249mMpiJxDb
   X8H2MOuexXcn3sAlCz152SyJR0JFjY6m5JVP44D2TmOnI3nm275KZF2Ub
   uQyxnec4OryUwDIUkBK295TsA/BeHAEZBxWFBeKSJmTkXdMvRM6Dga2i8
   mrHLKVgL5JqyH1X3Pic18LGQ/G7ZLkIDjG3N4DYzVVfPe0rLGHI4/7viH
   w==;
X-CSE-ConnectionGUID: r6UGZ5FpSDetwUiN6Efs8w==
X-CSE-MsgGUID: 774NIJjGRx6kn6cbOBTjOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="84790431"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="84790431"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 05:35:09 -0700
X-CSE-ConnectionGUID: j1VZRDxvSH2rrzRRaj9K3A==
X-CSE-MsgGUID: 4h3r8qxiRDigQYmE6H/Waw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="257662981"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 05:35:09 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 05:35:07 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 9 Mar 2026 05:35:07 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.0) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 05:35:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v2SxMGsi9KhZI2A8utePxCqFRp06IgxpXJ1aD+0gjnp73Z2zNgjIpP96qD3IeZfzQkEaWweLyYx66hpcsaHGeU+6Al2SD5GNVRk9r7z4MFAFZNDTWIh4yOrG131rhsvRw6yyICVIruCWbzD3CVnm5PSuFMzpQ3WgCWfBZPn/HaxuTYaOMYB6YirY/k7FQbE7VpQzCS9YJomjDU6TcYYuatSDF7VIFAB8bHETlGQ+/m0i5rtdx3ts1csCknubtJEQY3RmeSd5MeeXejSfC5QG65R8xpKIlW/AcFwv8QeZJYdszNDqTDADh1sYZwytGEUOOxP1bvR0xGaE85KunpAVoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ucRTE2EtJmPEkJCDx9Je5wlywRSOPxu2eO6xMT+77Pw=;
 b=gqyagO3ENwJnPBsp5B16mkPBmmRPRwzljGyNvGWHYyP6PFMb7rST8C9+9UzMRGIOA7ujI9AP/vJF+CMAAoTEfgWlHgeBW8/hoCClgv3X1avX92tZRRg26Z+o7lO+mlnMCVviYhuHHvMsQJeA/EpboIrPHICSqRB98CazmIoqhYWkaSIbrMVk3bKqRJan7V8126wtmrMEVEhJ8Su2Fg7LibKbmkV1bGITMuCyvPEHHLCyFnC31QGdrcYrvBBGdc4yuibk2w8pcQDpJZDL6wzSS21lPaG2PSD6r393Gpd7fXAtuDMS1G6Nb9yLy0jSLXgVhBQuFcESoWb3db0DN3RJgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by DS0PR11MB8082.namprd11.prod.outlook.com (2603:10b6:8:157::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 12:35:04 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 12:35:04 +0000
Message-ID: <62db3005-500d-4110-ad63-9cd200965724@intel.com>
Date: Mon, 9 Mar 2026 14:34:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] i3c: master: Move rstdaa error suppression
To: Jorge Marques <gastmaier@gmail.com>
CC: Jorge Marques <jorge.marques@analog.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>,
	=?UTF-8?Q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>,
	<linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Dan
 Carpenter" <dan.carpenter@linaro.org>, Jonathan Cameron <jic23@kernel.org>
References: <20260308-ad4062-positive-error-fix-v1-0-72d3c5290b4a@analog.com>
 <20260308-ad4062-positive-error-fix-v1-1-72d3c5290b4a@analog.com>
 <458bbbb3-babd-45d2-b290-435811058ba3@intel.com>
 <k63sp56mbqje2wqo6yjcql27ag7pkwbuwch7llnal7j6sww4wp@3bnal4rcgpzn>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <k63sp56mbqje2wqo6yjcql27ag7pkwbuwch7llnal7j6sww4wp@3bnal4rcgpzn>
X-ClientProxiedBy: DUZPR01CA0231.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::12) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|DS0PR11MB8082:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ebfb980-4b47-421b-179b-08de7dd84a11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: v9m4GeLzYJUyKbyzgW5q7Fjoxwxfbl6WLxEpZW1SRHlkk0ufuXvf6l4bFK/I9Vkqsl/J22r94EmbZhcbp9B8T4Hg/sIJQLpRZS6osptMe8PKQvwFMJkhaVohKc3LtfsIaHl1Tjcw8DPwSYbOXb+KRXeLRNio529CeY9Udd3YJI+X8y8uNZA59G4jqeje8XqEdrwf7ge4LnOLpVaIZwyu8P8ltvQROVT41NNudfQ3J7brGEn5h8R4n43fxHIKF9PtEl6UmAYzht7PV3ZvEIO+6KUlSJpq6Od5dEELuaH+HXB0r6WFHDRk/thK3LFQFAAcqeKe4GEW9p3uTYpzsfiLRTBSd2DlDeNYnaVUV31X/IgxXR/GYzlwkE5dHDelGqDzijNLzPX8ZCF5UTy4Wr3WZRFt6nb93bB3ZwNHq/dE86p7ZADA1pURP3qj7iz7zqloz2fyHqWgoVaTgFXpGxMbAUl9QIFhCxkxGEDKxYO2BLphf2e2Ct9oNoxtXud04YjLi1NAZo/mBN74Oi024vNv3+0mk01/6R267oE981PnUOiaehFSTLNuUFCMbyKKLjH/ANpUA9AQQMWMNrjX9+FsW5BE1tJcUOMWHZwaHVteg4IZbFU/DlF2AFypSQ0zer1eBDZFaJWOelNii8d41UBpVzlVQN7Q/+YV6KRnGoV6w6aKXDJyukTPLYtJlge6XqftMm3D5FHEnmVh2JAbricRq+B5kmEkUFQqaQv0ZynhtNU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUZobjM2QTFGbVN5V2F0Wnd6RHVOWTNxRmFORzRpU1lMTSthKzhkVHBpOEZi?=
 =?utf-8?B?NWgxUGxNcWcyYkxRSUt0MXo2NEdjL1Q0UFExbHhxY0R5YUpzcUZjWXpvNWJL?=
 =?utf-8?B?cjQ1UmdWWHdFS3dMbStEa1BUcUk0QWdpbzFFZVVoZUNxYVJ0MGgyWDgvWDZC?=
 =?utf-8?B?dmxoNEIyRHZvaVg1SUNadGZrY1dZNitRUFJwTWtXZ2EzbkVub2krczh1eXpY?=
 =?utf-8?B?bmZwbDZhYlovMytJTmZGTUNVeUZZUGltV01RcUtUbjFsa1BaMFBjc0ljaTFS?=
 =?utf-8?B?Q1ZobmVpNHRjMWd6cy9majVRREU4eUhqaTVYN1RqSmxWNWMrQTFEQk4yU3B4?=
 =?utf-8?B?bzNzYzJYMWZrRUhvYlNRMUs4SmpNUGxjcDYwWElyRTFlZmozVjk5UnBUcjVG?=
 =?utf-8?B?V3NxNkMwTXVGNkRwUmU3RGhyYUhsMFJHTlpDeWxrY1BCK1NPUU5EbjMzUFor?=
 =?utf-8?B?N0tPbFZqbGIzV3Eydy85WCs2bm9RR0JFd0NQaFVkR3dlSG9QVFY3RDdtVS9H?=
 =?utf-8?B?RUdYMjJ6K2ZDdEwrRDMrekhrTGZUZUtRZ0dFZGZyaDI1RjBUOUxrSURCVmdS?=
 =?utf-8?B?M2lFSTg2dmhBUTZhN2dMd1FnbTk3SUtHeTZoeG1YVnVucGJFVTAwVmpIWnhJ?=
 =?utf-8?B?VzcvMlhqYnVvMkJ2b2xLeFdOSEtuOUNCbTJJSGFpaFJJdG4ycWFWVU01YXNh?=
 =?utf-8?B?MVlJNmRJMnQ2aGF1K1JnTXJDVlBQaG5BTDJkeWZnc1RONjJMY2xTMHkwTDhY?=
 =?utf-8?B?YWZIV2QxaGFtS3NySWJ6L1dSdjBEMm1Ma0NjQmM0ZUV6djRQUll5NnVJeDdL?=
 =?utf-8?B?TVVUNkNMT1BndThZU2lUaDlzRkFyRGxWc2RJdHNFZ1BCY1lLSEtXZVRVY0dD?=
 =?utf-8?B?Vk5mRmxGbTdpOXZ6Y1J6TjdiUWFHanJtbk9mMEZ4WnNVVGI0blZIYWUzSU9q?=
 =?utf-8?B?L2hOMW81ZTl1VVJndkFXUE96d1dDZE5WMm9tSCtqUHI2Szd6bmpDeG5QblpR?=
 =?utf-8?B?WnZSM21FUnZsU1RlMGt6ZzdpdlhCaGtaczRpc3hCNUd2ekZXSy8ramxwcm1t?=
 =?utf-8?B?OGxwZUEwTThldUtyaUxmbE1HQU9RSmhXTFJjR3JWZE9idlFEUkdtMmdBWElZ?=
 =?utf-8?B?YW9kNHZOV3lRemhuYUZmYjZLRU56MUR1ZWlsSDV3MDJ0S1ZhVStEN0pMYVpQ?=
 =?utf-8?B?cnhlZTNDLzU5T1dldGFmMTIxUTVZb2p4Rnh6R1ovazlpMzhtRVZ4Zk1SMlk4?=
 =?utf-8?B?U3l0TFpHQ3VyMjB1OSs3Wm5DS0EydDlualRuajNCaExLUUtiZU9KcFVRWDVv?=
 =?utf-8?B?cUltMDlkQWljanhuaUYvTk5tdi94SXhDb243cUw5akRvcVJGbU9OTVRYRXBZ?=
 =?utf-8?B?VjdpbkpTSmlOV1gxY3pTaWpkYkQyRytxMEIxQk1GUFhsNStyU0t1WkRValBS?=
 =?utf-8?B?R0xhemowMDQ5Q0ZzWWQ4RzcyNGJ6TzhTUHdwWTdhYTNaVGtMQTVYTzA0aUFk?=
 =?utf-8?B?ZGhPY2ErRlhjL1hrczNqS01hdmNBejNzNVRqTmZoV0cvYVc4cmg3MjhTN1lU?=
 =?utf-8?B?Y2JyOUdOOWN5Q2NOMi9Qd29OTUlTejJPK1NVeGhMV0NhQzVvVlkwOXh6QlVk?=
 =?utf-8?B?dUQzS2lBaGQ0Z09rUVo2aXdxSk0yRWc1dkF2WVg3cmx0Yjd1clRqQ2tPWlow?=
 =?utf-8?B?aWQ1Zzlzc2FpSW5VMzNtMHRCbDhtMzEzODk5YmZCR0dmUEo0cGFMTlhoYXhE?=
 =?utf-8?B?L09BM00yYXNIWFNHTDAwdGR4dHdPWFFYcUU2YnJpa1grZmV3alZJTTN5Vks2?=
 =?utf-8?B?Wi9BaVpPS3hCMkVscCtKTU96Z3lCREFsWlZob1JDRzBUbkN0dGlMaTVLL09C?=
 =?utf-8?B?N0NNMG9oanA5KzQ5NUVsRzY0ZUg3UkgzVkVWY0NTdmZzS2M3T205TDM5NUlM?=
 =?utf-8?B?ZTJqbTZXZGZ3cU02QUpIclIxTE4zeTcxUU4vMVhRQTd1UGxlb2pseXFzcWZI?=
 =?utf-8?B?bGl3aCtoU05Hcm1ic3h4UWxBSzZDT2dWRlVSbUV6WE52ZnhQc3NpUmpBR2JB?=
 =?utf-8?B?VktqWEFLRWxUaEtGNTcveFBRWUh4M1B0V2NnTmhJZWRhejViVVkwRjE4aTI3?=
 =?utf-8?B?dVBCMEtRTXVkMjU4WVY1QlY1ZXI0a09wNW45NDFuT2xLSmhOSkF2em1NNFJw?=
 =?utf-8?B?U1M2Wm50Z2ZUZUI4Rlp4amVFTG9DQTNTMnNBMjRyZGlmWEZwRDd5cGtqeDdl?=
 =?utf-8?B?b3lFUXZnQ0lRYzRrWE0zbGV3V3NCa29EUjk2TnJRS1ZnSWZLRGRCVWl6R2tl?=
 =?utf-8?B?OVV0QnJuanpOV0drT25nUWxQajVNOEFHM1VSR1kyWnQvSFo1RUw0QmNHY04x?=
 =?utf-8?Q?Fc425qVGil0ClxBY=3D?=
X-Exchange-RoutingPolicyChecked: lQQLQuahQ0EOGWPSTVLAWe2yHhALfQ9+/fAmKNfK+vXMSNPutC5fFJd7A074mfvNvL8e9tuWsEXQ7XT/usDlz+VNOzhYdM76TV6BgqLonT0Cx8QGVPAXpliVmdpmi+e/AAc7FRzTRPqHqdsBPwhB05iVhTHRuu2BtPJutj9A6D3eiAYSuKD4CAZiSIKZBpVes2ynlJGtQlfNNRp+3Ue4POTEGIO+8oG6pztMdvGikWq+Mn0Ros/CmsjHAwtEGl+2mCtwit1XRyo0i4JnlXd1jM8SX3+7xIBa5IOHBLR3IwqYDqS2MEWEEftSfQpvdvD47qOmM+8XUAdnAFVfnIK9ZA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ebfb980-4b47-421b-179b-08de7dd84a11
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 12:35:04.4084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ATijTaVZjLriYCDfo4qAydXnhJANHFkgfGfgluHK6EDUKgJ5WDPR9zm71A9IGqYbHeO2/DGzwsymsgjw4cbi7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8082
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_053514_395212_2A024CB6 
X-CRM114-Status: GOOD (  14.47  )
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

On 09/03/2026 14:17, Jorge Marques wrote:
> On Mon, Mar 09, 2026 at 01:39:36PM +0200, Adrian Hunter wrote:
>> On 08/03/2026 18:47, Jorge Marques wrote:
>>> --- a/drivers/i3c/master.c
>>> +++ b/drivers/i3c/master.c
>>> @@ -1016,6 +1016,10 @@ static int i3c_master_rstdaa_locked(struct i3c_master_controller *master,
>>>  	ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
>>>  	i3c_ccc_cmd_dest_cleanup(&dest);
>>>  
>>> +	/* No active devices on the bus. */
>>> +	if (ret && cmd.err == I3C_ERROR_M2)
>>> +		ret = 0;
>>> +
>>>  	return ret;
>>>  }
>>>  
>>> @@ -1785,7 +1789,6 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
>>>   */
>>>  int i3c_master_do_daa_ext(struct i3c_master_controller *master, bool rstdaa)
>>>  {
>>> -	int rstret = 0;
>>>  	int ret;
>>>  
>>>  	ret = i3c_master_rpm_get(master);
>>> @@ -1795,9 +1798,9 @@ int i3c_master_do_daa_ext(struct i3c_master_controller *master, bool rstdaa)
>>>  	i3c_bus_maintenance_lock(&master->bus);
>>>  
>>>  	if (rstdaa) {
>>> -		rstret = i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
>>> -		if (rstret == I3C_ERROR_M2)
>>> -			rstret = 0;
>>> +		ret = i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
>>> +		if (ret)
>>> +			goto out;
>>
>> This is an unrelated change.  The original intention was to perform
>> DAA even if RSTDAA fails.  If you really want this, it needs to be
>> a separate patch with separate justification.
>>
>>>  	}
> Hi Adrian, handling I3C_ERROR_M2 is unchanged.
> 
> The intention is to perform the DAA if the RSTDAA fail due to a
> I3C_ERROR_M2, this behaviour is unchanged,
No, the intention was as the code is written.  DAA is done
irrespective of whether RSTDAA fails.  The behaviour has changed:
before it always does DAA, after it does not always.


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
