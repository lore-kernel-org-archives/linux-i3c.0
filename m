Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D21CD5BAF
	for <linux-i3c@archiver.kernel.org>; Fri, 22 May 2026 04:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=tKYUZYtbd+koQkbH2qXGW8e187DkNxoCrFGJyuUidV0=; b=teOzHYuGnSGi1QUiYGYIiM1Lxo
	viKn5Ot2WAvc6rsJzWl4QiztI9jzp3pNpdLTOzojdbv8aBbC9wQqDoZ8zLJqbDB5dYMmYCHdNIX61
	43woTejBFLyKvSt4jSjSYwkT0XH5Oou28rcs0NWSXzvINGR6kRwpRKTfOaQWiBS006tgr5sfIT/Ar
	0UXigwJJWtUHCGF9WciTuvnT0vKgHIgJiezByFZ+5cfVYjSit/m06EUSUNVDCLdVR7m10cE+CJpPN
	ROJ/mU6S6W1HLR79ebzHX5cdNxS7RXdj+uhv/R7KgDjeVJ+Z9fbPI3Iai7XZJMfaAC6n1L5baLg8v
	YP+0ffHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQHu0-00000009nY6-2upo;
	Fri, 22 May 2026 04:54:28 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQHtx-00000009nNm-1qHS
	for linux-i3c@lists.infradead.org;
	Fri, 22 May 2026 04:54:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779425666; x=1810961666;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=UzTnfmNbh8p+EOTmtmydRoTH7EKe+Q/kVVjppnJlmtA=;
  b=QxtDMbBJht4IXAXmBIa8UK9t8STXCqa9wTMHU1MkkzgJi12bfjlEsy1r
   Q63IiCCoYFmHfeaKJ6R7IAyEFCddJ0Nd/QkbsMH9bhORyfA3BH6vh4AX3
   nyl6sdBophuOqcroRK+8gtkOi4uR2dnYRRHAYOYqXWOYVquE65RXLecri
   giqNsMKe6KcI2Z/xeyD5ePmn6yqpx4CBLRQYt4AKG005Wm3nkhD1Z9iDq
   mZ9U0zURUFmulussg4TvSWlPWLSkpJoLjcVnT9OS4ixrcA1PU9SOUgdri
   to7cOnAuxp6mzTJuIl3v7Nq8vLqt61CWfW8Ut5Aa4BB9J8nxTk72gvN37
   w==;
X-CSE-ConnectionGUID: 5s1U5jEUSqarSQ+xY6MH+w==
X-CSE-MsgGUID: d/lFJXUiR0i+YE61qUQD/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="103029624"
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="103029624"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 21:52:25 -0700
X-CSE-ConnectionGUID: Mhp1YFUdRVudzbSu15dU7Q==
X-CSE-MsgGUID: jR7YRXwfSbu77Um5HJUqdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="239771857"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 21:52:25 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 21 May 2026 21:52:24 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 21 May 2026 21:52:24 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.51) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 21 May 2026 21:52:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IugnfwkmjtYrRXEV1Fyn+xvSg65sNynrAAFP/SmlgabJxPjPgBTCh/RuqvHXCXAdOO6gg3v90GaWCYO7oKG+NXzNFyJ+BHx8QSncW5ML9VYM8Eo+IhowTB8GNGjTxGr5K0l5xBvRzSkXtmQdSFJrnT4RnJcIZKgCK0Qw9N3pG39/UTvLR7xWoLXj9U9+KHuHzJCrE3XXrAdjw6niKZKUSyj+7nNGTeZMctEhaw552VmOMpR6Uw6BhYUCNYHy/aFmjQO6Odvo/fMkrMvfIie0yWYrBL/UBW0L2vu+52YGYGgwV2CLNx/P24PMlab8tVFLzjPsqkT+T3V7FueIETDyPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Vc3X/j8fLqMNE+RDEEbzigCb9C1iMlekQfUC5uZd8Q=;
 b=KMLEQPS92zbHjJFyHf73h1Bd51hdNr7rl+YdcDP2B9SWQR6DjF0KsjinPNindbT5hnFvvwYJrGPdsdx6Dn+gFZ1PhzmC8Qo4DVZlX5nhk4DDsgwEQpFLl4k1Wyogcw4IOh1oVomA48MWlyLSmBYTCDVWSrZHsdS4cPRyjs1sxwchGeKeiRtm7frmkDp7kQLc/9QCj4wuHC0L57Qya3kpLkda+m7Sc5iCNLIwbcg5yyBMh7vwnFcmQk8lbcAMkIjd2MRcf/fQaG22k9Jq/IdLgAIM9tCxQOsPDEaabQry/E6AXzapocTJmjKctPNif5ZxLwvUhpdjGpQZ534rLeHWkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by PH7PR11MB8251.namprd11.prod.outlook.com (2603:10b6:510:1a9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 04:52:21 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.21.0048.013; Fri, 22 May 2026
 04:52:21 +0000
Message-ID: <de8f3e0c-200e-4da2-9f8e-7321d2b23717@intel.com>
Date: Fri, 22 May 2026 07:52:17 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] i3c: master: Defer new-device registration out of DAA
 caller context
To: Frank Li <Frank.li@nxp.com>
CC: <alexandre.belloni@bootlin.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20260512121732.406009-1-adrian.hunter@intel.com>
 <20260512121732.406009-7-adrian.hunter@intel.com>
 <agNXuQDsj_bHSA7s@lizhi-Precision-Tower-5810>
 <01df8e0e-9041-401b-ab73-634701c4acdc@intel.com>
 <agTK5tMCHdLEezCR@lizhi-Precision-Tower-5810>
 <417993a7-4a4f-4ba5-a815-aab63ed03a3c@intel.com>
 <ag9PyMLhhwYJ_yRB@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <ag9PyMLhhwYJ_yRB@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: DB3PR08CA0002.eurprd08.prod.outlook.com (2603:10a6:8::15)
 To IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|PH7PR11MB8251:EE_
X-MS-Office365-Filtering-Correlation-Id: d72701ca-e184-4d0e-e856-08deb7bde84c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003|11063799006|5023799004|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info: PpM2H2YuxtxY8Tp7VhlSy++tznvVTlvUt92yqGLNhTJyQvU55GMeol/44CFM2RQKjLQWgZpsfAUuKsgP3WllqsPA5bPP0MpLvJYkBYSbKzcWM9rag3UWjW1gBC7ZzEFiHUAgfyTHNVGuPeSEhG192NVua2zWVJPIKaqqVV2aRTfL+TUUcedRAJkxqySGyOBqcH2oOdynMX0XC9gjAPZ+kM2h27kiForbagGn1bZFW6tG+CvBUxDJwOqSH2QV6NfQJlqXqn/dVvRwb5/Ddhoz7yL8Gi0qnTEEy9th2QCO+VtyEr2J8TlwF2cWioXLZ/v0+mBEiQZZtK09MQpgKWljPXzOTqq9XjmYSPoZ8Yd7TaFNpcT1HAZKohoZsQGuChGgNlewsBrv5GH3AufzoxDnqSF3AqaNwMMY9s9I7hs63Cec/1KP9Vz+nrA3K6Z0F+TJCt3enjokk4uyUX+pmIdVEJxjnqd3WQPtr7KudBzLuGFiZn/QTUYIOu0UYIEuci2rWdZox4XIz932ZnqV5YN0W7wBVJ2vyI00+D3E+vwXGZi//H+guhmgfcFebJxybyQ7laSNmbsc/1X2oQlD4CyLCm2t5OzF84jb19Rtu5GMYF1m1DKrobNZkdf/gmyeBueoSpn4MgR8qpYWANetLS8CHhgBdQ638qI0P77FsheNMw3PK7KkVfWMaGNXlyx6nfYC
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003)(11063799006)(5023799004)(4143699003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHhnKzJ3dCsyNS9xN0dOcUxPNzhRcVQ1RStoNmliTWJJRitEK2EyNDZCNlo4?=
 =?utf-8?B?NzhFd0xoMUJPZFFhMkc3c3pMSi9HKzA0bjhJWXVtU1paOS93ZWNLKzkxSGM3?=
 =?utf-8?B?dnVHbUlYa0VlVlhvclZqQ09lZE9pS0tIWkdtcCtKQk9KSm5VN2hoeEJCWG5x?=
 =?utf-8?B?MEIxajNIZVpIVk04OEcxVzJPRXBqNWJVT0dmRFFIY29MaGhnT05ySW9lU3Fj?=
 =?utf-8?B?Ynd6WTdPV3VYQnBSL3JsT21jdFdqNWIreUdZOFlSRlZZQXRzbVZWYklqNks2?=
 =?utf-8?B?UitXaXZjdDNhZ1FLYUtpQXlBdUlpOWFraUcrdG9HbTZWSFlFYitRTEZ6RmJJ?=
 =?utf-8?B?NU1aRjhJSitTU0RJdVRjSjI0ZHJjRjJ4eXRlSHNjbzBIc3dIeWp0Wk5aQjd1?=
 =?utf-8?B?UXpzZ2ZGcG94cGtTQVJkOFYvQlF3bkJMTzlKMFYxL2lPbFZTd3VxbGc2VXgy?=
 =?utf-8?B?OGcvYi9DbHVJcVljenhnUTBGZm1wN1N3RG1YZXY4a0RSdW81WncxRnlGbEpr?=
 =?utf-8?B?UUdPaW1kRS9qSW1sRFo2NGhLRHZqU01wSjNxT1R3VW5VdnQ5THlqZit5VC94?=
 =?utf-8?B?MStBa3ZrUndTZ2kwV2hlTzF0WjZDcmFjQ2UvWG1LVHIra1o1blN1R3NNZHFP?=
 =?utf-8?B?L3NSL1JIVUJTZkp2RVR3cktLOEpaRENHZGFWQ3dSQWloT21IKzcvcW5xOWJR?=
 =?utf-8?B?Sk9KT2lqdmk3ZXlveVQ5dFc0K0JBRTM0WTh1VU9rV1RMa3dNbVdaUkViY2dV?=
 =?utf-8?B?bmtYZjdtc0liczRBU3VEd29ic0hrbUZwL3BZOWcvNzhCRStVR1oxZC80R0Ni?=
 =?utf-8?B?Q2NTVVd1SDZIR0c5SSt0Z3VkSFNzMUppUlM2eGtybjYvRHozQkxnUk5WakJt?=
 =?utf-8?B?ZWVTOE1CSGtDelRyWmhpUDMvaWVyQmNoTzQ0NTFkV3hOQ0lxZUY3aVg3RU12?=
 =?utf-8?B?cFU5VEpJQVNjMWVNZTl5Q1BJZm5lL1l0ZXBwNCtVZjdDUUpRWUFoL3d5MEtr?=
 =?utf-8?B?c3NQalVVWGtEQ0VGdi9XdHRWVTU5MkVuUE05NTdBeGlQbXBxY05FanU1MzBN?=
 =?utf-8?B?SnNXOCtvSXR4QXBUUXVuTlQycTJBZ09oZ2RYb1RXUW5GNVhFSzFWekdqSnZU?=
 =?utf-8?B?aGZrNmFYQlREQzJoOWZ4SFFxeEZsRHd4U1FwOFhaaWZCWm9WK1VzeVJ6UE5j?=
 =?utf-8?B?ZDJDM3UrUlltbzJrMzZ5RUJYV0lXengrMGE4dFYxWGhKdk12NlRPR0NNNXNq?=
 =?utf-8?B?akxJWlpJeTMxcjRBTmxTc2R6ckZrSUMxSjlTdVUwNkg3QWZFa0hHUUc2c0Fj?=
 =?utf-8?B?K0M5NGVFa00zYUhsV1dJekxzWG5STFY3RGNZd2tvNEtXODVsMFFjdU96SUQx?=
 =?utf-8?B?TjkwSVI2bTFocTNVNEoySTJuZmdvR3o3ZjRwd0NGWFdkamo4ckJ5M3RiNWZQ?=
 =?utf-8?B?bkJwZWNqVW5WeUd1NHpGeExqb094L0hUdE8yRFR1OU9od3NjakY3SEluMlNK?=
 =?utf-8?B?LzB1VytnUmRwREZLdGtlU2crMi85ZTNWdEpsUiswS3djL2RoaXZuM3pmb1Vp?=
 =?utf-8?B?Y21aelozNDhUMnpoMVRtZDN1bGhyNVdaeCtqcTFLWVJlQkF0d3FPOXJvTW5k?=
 =?utf-8?B?TnBRNkEyRlNXa0w2RUk5NDNlc1prUDIxSEMwZkpsME5CUnFvTjh1eVhDd0dX?=
 =?utf-8?B?c0F1SjJ3V2FpZnpGZnJwTklTMTZRVTRweGVvMVprT0llWmRGNlVDeG1HbjZ5?=
 =?utf-8?B?QkJVeHdoV2FYTDNWa0phMVJiZ3BROTBsZkZTOGtNR3diNDhYMU5zd2YyOVMx?=
 =?utf-8?B?d0Q3VEtOd0dXZ3M5V1dWNkptKytkNkszNGViQjZUMnJpNHIxQWhHdmtvbXQ5?=
 =?utf-8?B?U3RnVkc1L1dLa2g2UmZzRDE0NEk3aTQ4bEc4QUVNMXVjSVp5Yk9tb3N3QjU0?=
 =?utf-8?B?ajZIbmJEcE9kWFNmeUluSE9oNGx3OCtjcEFkK0tINXdNYUExRmtFQzB1NjlS?=
 =?utf-8?B?UTBJZlh0OHFaOW5XRVR4UDdJZWczb3U5WlBLaFB4WDVMQmNINHVhRU9YNnpE?=
 =?utf-8?B?OUI5Y1NpM1ZWQURsQnZ1YlBwNTdNWUVrT2xtbjUybms3b1JCOGNkZ2d3YkYw?=
 =?utf-8?B?V29PSnJnK210a2p5VGE2M3F3eklkd0pkNVdIeGdyaDBRaFcwVk9tOUx3U0Nn?=
 =?utf-8?B?R0ZucUNDM2V0VTdyMUVOQWNVR1l6WmJNcUx4QUtteUV3bW5hZmN3NllQN2p0?=
 =?utf-8?B?eWs2aGhHZS9oTzJxckJueW9ub3BYdmRGRlJaUjRzN2VQN0VST2RLU1loZVgv?=
 =?utf-8?B?V2JxTVJMZzVhcjJyNU5BTzkramQ3emcwVTFiYkc2MHZMSUtXOUkvd2crNGFO?=
 =?utf-8?Q?U8EmGQulx8bZYaBs=3D?=
X-Exchange-RoutingPolicyChecked: sFuVx4N5wR/8lu+v7yrtKYP57GkRrE5TtsHWBtuogaybiHThndkYo5fgudNinWXNcThy2qItytTF4fsffMFr6H5pSYhpr7MAc6kGNG31BPnNfwe2cOHQor1YwnXt0tPVyp61Dks+QAXYIBobq0quCQBYIYQbdWoSTW6JHNAJTNMIoaz3ZdYB4SQGNjsC45TegUZdyCMWhtJbNw2h91zqOyJFmsw5u6ABAWPARPa4CPuAE2Y0ffS6+jlRL8qiEbnAXyZ+ZeXvx5zPcECMAn51HOqW/6Va0EscTJdTG2hAGSH263/DXtd52tqaJwR28H7OpprTbiSw+pgYpmUIcqKbsw==
X-MS-Exchange-CrossTenant-Network-Message-Id: d72701ca-e184-4d0e-e856-08deb7bde84c
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 04:52:21.1271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HogMYDG3AebUQPaEFvs4vN5Lt2PVf4qb5CnlOKpDNBBESxPKXAjImKCTRfma/FMH/A6QOoFbwHgtsmbV7RYnag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8251
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_215425_577787_3152D023 
X-CRM114-Status: GOOD (  19.46  )
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

On 21/05/2026 21:32, Frank Li wrote:
> On Fri, May 15, 2026 at 07:42:20PM +0300, Adrian Hunter wrote:
>> On 13/05/2026 22:03, Frank Li wrote:
>>> On Wed, May 13, 2026 at 08:45:55AM +0300, Adrian Hunter wrote:
>>>> On 12/05/2026 19:39, Frank Li wrote:
>>>>> On Tue, May 12, 2026 at 03:17:30PM +0300, Adrian Hunter wrote:
>>>>>> Master drivers may invoke i3c_master_do_daa_ext() during resume to
>>>>>> re-run Dynamic Address Assignment.  As well as assigning addresses to
>>>>>> any newly arrived devices, this restores the dynamic address of devices
>>>>>> that lost it across system suspend, so it has to run as part of the
>>>>>> controller's resume path.
>>>>>>
>>>>>> A side effect of i3c_master_do_daa_ext() today is that it also
>>>>>> registers any newly discovered I3C devices with the driver model
>>>>>> inline, via i3c_master_register_new_i3c_devs().  Doing that from the
>>>>>> resume path is problematic: a hot-join-capable device may join the bus
>>>>>> during this same DAA, and registering it immediately would push driver
>>>>>> model work (probing, sysfs, etc.) into the controller's resume context,
>>>>>> where the rest of the system is not yet fully resumed and the
>>>>>> controller driver is still partway through its own resume sequence.
>>>>>>
>>>>>> Decouple discovery from registration: add a reg_work work item to
>>>>>> struct i3c_master_controller and have i3c_master_do_daa_ext() queue it
>>>>>> on master->wq (the freezable workqueue) instead of calling
>>>>>> i3c_master_register_new_i3c_devs() directly.  The worker performs the
>>>>>> registration only when the controller is not shutting_down, and is
>>>>>> cancelled alongside hj_work in i3c_master_shutdown().  Because wq is
>>>>>> freezable, any newly observed devices end up being registered after
>>>>>> the system has finished resuming.
>>>>>>
>>>>>> i3c_master_register() also routes its initial post-bus-init registration
>>>>>> through reg_work, using flush_work() to keep probe-time behavior
>>>>>> synchronous.  This keeps a single registration code path and ensures the
>>>>>> worker is the only writer of desc->dev.
>>>>>
>>>>> why not direct use hj_work?
>>>>
>>>> i3c_master_register_new_i3c_devs() use of desc->dev is racy, so
>>>> i3c_master_register_new_i3c_devs() must not be allowed to race
>>>> with itself.  Having it only ever run via reg_work achieves that.
>>>
>>> Sorry, I have not understand these, Can provide some detail?
>>
>> >From i3c_master_register_new_i3c_devs():
>>
>> 	i3c_bus_for_each_i3cdev(&master->bus, desc) {
>> 		if (desc->dev || !desc->info.dyn_addr || desc == master->this)
>> 			continue;
>>
>> 		desc->dev = kzalloc_obj(*desc->dev);
>> 		...
>> 		ret = device_register(&desc->dev->dev);
>>
>> This is done under the shared i3c_bus_normaluse_lock(), so there can
> 
> i3c_bus_normaluse_lock() may is wrong, suppose it should be
> i3c_bus_maintenance_lock(), register new devices change i3c bus's
> hierarchical structure.

If device_register() probes the device and the probe tries to
access the device, won't it deadlock if i3c_bus_maintenance_lock()
is held.

> 
> Frank
> 
>> be 2 or more instances of i3c_master_register_new_i3c_devs() running
>> at the same time.  They might all see desc->dev is NULL and then all
>> of them try to initialize and register a dev for the same I3C device.
>>


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
