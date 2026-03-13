Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD9EA107BCD6
	for <linux-i3c@archiver.kernel.org>; Fri, 13 Mar 2026 18:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=gnBls0Aznzjoe3ltHnnrP162kX/QesvZhQqAu7xewGM=; b=kvgeqQhdUriXLptAk0R0qmMiVL
	noYiiTfQzzJAeDvZ3zvysjsR6m60Znsim9I32Vfv/NaJdxicXCALKX4HOh+vuPRIxwbZDHc8CmFbs
	iFWUQBcWFtC7XV98JkWKHvJWWJ1dyjoJkcNh/EVpAPAhbhDU2d1olWT+EXEkUuWFlxfrmMiqlU9o9
	5eaFIXgOAJrhY4bevEapb74sjg0MTqy4LT3NfAu0iI6Um3kPmSlPUOxkRVXuGGd+cl+is8FOmVUD8
	pGfeQLQp12Gupn6+hxupTHLwmiYp/CNZvd9qV/XpQ4VkSmugQ6GRSSaQ5B/qMxNnTgC0ygFWIbHRS
	HwBjlUdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w17UF-00000000wun-2RHF;
	Fri, 13 Mar 2026 18:43:51 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w17UD-00000000wty-26AH
	for linux-i3c@lists.infradead.org;
	Fri, 13 Mar 2026 18:43:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773427430; x=1804963430;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=VFYnUvu/FNv5MZcYrRSLO7BtpzSyE8npwvm1SMz4vs8=;
  b=YdgYThUBhne+SLc4EGYxwwAgNuHPsMzCw89XnO4a8kZ8mUY97T92uOF7
   H9WzSROkSVd0gwr3w3SCaCVsZ8FgrevKBzPGhMzXuYZ1Jx/eVvCGWPi1M
   eOZEwqLqSSe2nHbwd/QH7UifavOKkX8MfmUwXHDhXvP6yj1T7AcKcvnLT
   wH2CkgJgd7CNxryh59nFi+jYb5oVtqotjRgptclQqSwpu4keKcT4SLrY/
   cg2jsFeorCaQul5oUSssRF0rmQnx/eVzmKIUBGeUF6MaZyGGxiUZ449RS
   niLH2hhpr0YS5WgoeRlWomzyCqHZWgFrcxSw4V/N2PlEVGOQmzP99flMV
   w==;
X-CSE-ConnectionGUID: cSs0LVp6QhGsFz7lfZQHMA==
X-CSE-MsgGUID: AO0vRaYqRkyn/mII+Y2V2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11728"; a="78141214"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="78141214"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 11:43:48 -0700
X-CSE-ConnectionGUID: Gs8b9OaPQa6JV2YO9xApMg==
X-CSE-MsgGUID: i9tEbu/AQFiGtZ0OTyitmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="220505737"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 11:43:48 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 13 Mar 2026 11:43:46 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 13 Mar 2026 11:43:46 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.69) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 13 Mar 2026 11:43:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B1PjxFKHIuF1uKSJt8fhnmpZgoath2kXsiJfpkTPmY6pAN5EB3IQjdqrcLn+q/4nJ+v7z872gkcwZjBXYLge0as3CXuYLfpYSDqu8hODkbQg6v/XHJ6T7IXBcFOrr5tLh+Rza8M1ErBhi5avaS+37nB1og7fKUMeLYa+voB6kfVEO124Oyc2vlY87PAwSbq84Od/lIHvgb9/Gfs45EJ8v64xf/JFohpS+oyQE1BXehhdmIIePolKpjCOwLNtfuM9P6CoRCAQ+eebIZ62nIkpd2c/0ScGQFONqm2cdtOmpZE+cn/tbSzwPojR2LzLlo4yFo8VZ8jEkC/GeUQrE4k21Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dzIpo0bav6koZp37o3vd7eLzOHPm6y/p5IVQ+nAV+VM=;
 b=b3zVxoZIumad7aqkSbHWPrRW8zMR6X+nHuEI5jlIQWCwUiSROnPRYVfJbd/w5PbQ8Wzx+EyJHnVTprXn3+VcfD767UfA/5O+NPAKsMK7bzR81uw/6NrdwcVzyfwgbKWgO5Eci+fR1wheIeO5XvssLVO3kZKp/M26BZqQqbbCKIcyP61ClWaRXdGlXD4Fv583Qh0qp5ZYRiPOvvwaV6nLFuu0XUbIkfDFRnL95Zg/Ay3qFImKLCYlTefGzngKCxlI6poCzHa7/ZKW4dhfqmi0M9v6pyKXaUr1qmF30te7jnYpdWoz5cdXqRqYN2Aknfnjy7F5mW6faACImDTe74CRyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by SJ0PR11MB5023.namprd11.prod.outlook.com (2603:10b6:a03:2de::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.8; Fri, 13 Mar
 2026 18:43:42 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9723.006; Fri, 13 Mar 2026
 18:43:42 +0000
Message-ID: <d444733c-856d-40bb-847a-548ff292ba04@intel.com>
Date: Fri, 13 Mar 2026 20:43:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] i3c: master: Move rstdaa error suppression
To: Jorge Marques <jorge.marques@analog.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>,
	=?UTF-8?Q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>
CC: <linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Dan
 Carpenter" <dan.carpenter@linaro.org>, Jonathan Cameron <jic23@kernel.org>
References: <20260312-ad4062-positive-error-fix-v2-0-1c933b5c7ed8@analog.com>
 <20260312-ad4062-positive-error-fix-v2-1-1c933b5c7ed8@analog.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20260312-ad4062-positive-error-fix-v2-1-1c933b5c7ed8@analog.com>
X-ClientProxiedBy: DU2PR04CA0274.eurprd04.prod.outlook.com
 (2603:10a6:10:28c::9) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|SJ0PR11MB5023:EE_
X-MS-Office365-Filtering-Correlation-Id: d41e1201-3f93-456b-1de0-08de813072f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: wyBkaX+qooNNtdr3kQgFpYZN2B824iI4QA7G1mzbLvfPYWkHYjx21lCQk7SgX45Wib7H6rjZ/fGTiB33PRukHDI8D4qTBEjZJgHN1z4eKyKxi8frSbcvGvTkP7rDjMqp4v5VkyfiRHZC6uX/r9EKQRcQU2HYFw9T/Fzm6aQ8VzVRGpkwU2V4GwGfxYHLad7YaELGg24eNPgmfbxTy9yhfG29XZ+rOpO9U756z7EC6uotr7b8cbOnRhoz9lPwcsuWkufVkc2TkJNsEtADd1Djuf7M3bfJ6aLb0XL6BCkbZ50Y2LPmDGIw2JjTVJWv0jA8MNn6AqzJ8mAIyBzvQOQglvDYvyeOR494SS/fuMMgZzifobQvJIgP3R3muFiP9zNaRcdtfBQUsT+fZ1mU3DXSyrsaYcKMBqm6xfByc+m3sgg6rNIVKF4SigMoq73nN2YscQumFoI5foogWLtMu3Sbnte4l/KH5wWi3ymDUONJzWPp/j/o4rVGlRMGMU3OPQJiR5QnHIe2v2WF6pHlacG/PoQi7b4TWeudy4uxuiRP11c+J2CzYDcglFtRIxXI7tGYvWErCq+6xew+TVItCnUse3k9SGoHY9Zs6cAgsFDE4mAuMF+CGbtgiN8+s7ypS3Y8ZJu/nyTYadSr0Xwgi+z6DXk2Yhy7dTDBYsL1GA72IAnZgqykCdXKq/OmzHSfAgl9z7D0T+FvemTgOYwLuZNKu6G8MpJN9WBScokm5gtcc4I=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czRGRXZiV05TTG9SbWwvempOaUdENXpSRkxXblg1TitXSGFOdWhRcFFSNk9k?=
 =?utf-8?B?REJYNWlmRjc0QWVucTdFdGt1eWcwS2Y4ZUQyQisvWVlFNXpvN000OUpTVG4v?=
 =?utf-8?B?VDNIS0lLR2VNTVE3U2hXRHZ4d0V5VHlPQ2hEV0tUMUNqUVFNTmwwaUVIY3F2?=
 =?utf-8?B?VWdacUJzZUNvRTBNaVVoVTU1L0xwOXVWc2VaT2hZS3lqRmU3bTdEakZCWC8z?=
 =?utf-8?B?bGxyNFp4UlowZFhPS2tTUzUxNnI2bVdCZ090eUZXQ0t5YS9aZ3ZWWE1BSTFs?=
 =?utf-8?B?VGlTbWx0UUFZS2o0ZFFFRXh4ZjIxNnAvb2MvY1Vua0tseXpMVmd3eitLZGZw?=
 =?utf-8?B?U2lQUVhNVWdIZTB6TGJBS0pMU0x4M3VneGEvZDVWbkxPOFBDblpzV3hnbHlG?=
 =?utf-8?B?em1yMlIzdWIwdStjaDdudjBQaGpGZmZEeFAxc000U3cvbkZPYjM2TjRkTVlD?=
 =?utf-8?B?enBYNkc0ckdzQlUvc3BoUDV6MDVzdlVmUjlTVmloL1hpcE5CbTlRZXRqRXhl?=
 =?utf-8?B?LzhpVTJqaVd0TW5QaVR6bXBEcnh4b2xNMllONWRmb3FEZHZMdE1EZTlGZzVs?=
 =?utf-8?B?cnBTYW1wMzBwcHBQaHc5bndGaU54VGM1TzQ3dUR3UW11dlVScElIbHBPWmF5?=
 =?utf-8?B?OTRPbWRNZk11VjZhNU1UVUI1MVE5UnkzZTI3R0gwTmhFb2w4RDBrbUEzZWdV?=
 =?utf-8?B?Um9mT1N3K0VsT2t6ZFcrYXI5bms1M1lRTU9ZUGg4Q0puWVU5c28rQjhhVGNE?=
 =?utf-8?B?SlkrRWRBTTMvMExMeFRFVmVZeVV4eS93WVd4WEk2SWswSXBMNE0xaXR3ZkJk?=
 =?utf-8?B?UTBuVllqSDBxblNhRXRsK3VaMit6eVRRdFllNEZvS1dYTkpwTklSZ2ExdWps?=
 =?utf-8?B?QXRpYUdiUG8xVEc2YktTWDhZekFzSlJCbUd0UytvNjBXendoS29xV0dkQXhW?=
 =?utf-8?B?UWQ3QmExWkw2QnJTbkR0cFF6bFFxb0JZa3Bla2UwQ29RTUJuWDhLV1NYZ2xK?=
 =?utf-8?B?RzlnSWhLN3NJT3JXOWFnU1RnaUNNWVdvU3gyajRYNnlISHhrMEJTUUpydzZr?=
 =?utf-8?B?SkFKNUJaM1h3TndXNzNvblVVTVhBbStDQStnUlNRWWliSzFyb21VMGVZWVEw?=
 =?utf-8?B?cllGRktUSFFiRmx0QllTbkdFTXFXakZVczdtZXlYQWhPYjNDa3F4MWRVS3VB?=
 =?utf-8?B?TDMrOC91eThKUnl1elVWNGQxbDlsWUQ1UnVTcG1OVmpHaXRVZFJvNlhyY0Z2?=
 =?utf-8?B?aW5STDZwWjVEM3NrdTRUWEpuVDBZcDEyNzBCV09vek5GK21VU0lFSmZlVFRa?=
 =?utf-8?B?NklHdGtNaUJvVXovdzNTMDgvV2N6UldxRmQwNFc3MXU3cFh3K3hpMEdLeThU?=
 =?utf-8?B?Q3IvaGpqSU5UZUFKMzJldzRJYnVKdEE4bzBkOWlBOVRmSmxMT3hoSlVoTmtT?=
 =?utf-8?B?RTByYnljMVk0SDdOWE9BdmNRcGZRaDZLSWpWak5rRFlYbnhqNVRNVG1SM1VJ?=
 =?utf-8?B?bTZxV0VYU2o1WnUxcDVhSFNkNkVOMzRzSHZZcnVUa3NkS1Y5aHRpN1pTVEJk?=
 =?utf-8?B?ZUhsR3lLRUVoWTd0RG1RSWR0S2xWZm5WcjI2N2FNSXlnb2poWXphdTVTUE1Z?=
 =?utf-8?B?OEVpdllYVEdQem45bC9mYXFRTlVFcTJwTDBwaXlGbzMweGNxNlJOa3JrNk9B?=
 =?utf-8?B?RDhLQVpIT08wenZ5SU1ZcmFKYVlWSlArdUh6L0hEdjROaDFhRnlObjFoWW5w?=
 =?utf-8?B?Y0h6c2Ryd0I3YnJSVkdmaFVzMlVCdmszSjA0elhiekFGUjIzeFRuVURFSlh3?=
 =?utf-8?B?MXZKNm5JVXMzdU9BaGxaWVluTVE3cUJNbzVLMzVhR0NrTllhS1NMVU1lRXZ1?=
 =?utf-8?B?R0pCREJ4RHJFTnpGRFVuelVTK09OZW14eEd1MVltY1Q2clA0YXpQWGlxZFFK?=
 =?utf-8?B?OWlvL2tOTmluc3prbnhVeVQvVU9wa20xN05wcm4zT2ovKzVVUmoxdytZY2RX?=
 =?utf-8?B?anA2SmlqbzJldkY2S1RzMDlHNVFoSzh0VGgySnJwSVZjenY4UExRUzdKOFVw?=
 =?utf-8?B?b1NrZ0ZJUi9MYjdBU01XbzRvbWJSNUdaN0dlcDlhM1NwYzRlelRnWnhLM1dm?=
 =?utf-8?B?aCtHSDZQTzVZUjlnZEdQWXE4MzRxU29QY1JweVduVXg3a3lsV2lwUGNUWjFE?=
 =?utf-8?B?L1JSUXVwaWtzQWhtb0svT0MvZDMvRTRqaTBxT2NsYnN3c0hTcVQ0T2l0SEd3?=
 =?utf-8?B?a1gzK3dIWGtYZ3BkZFlTVkN2S2ViaVdSYk1SNzFTVWtMNHN5S3RLaFhtWEcw?=
 =?utf-8?B?UHh6OGtsTzN5aUhzWW5sUCtPNWUxRWhsLzJ5NUc0akltTThFcFdmVXd1VFpn?=
 =?utf-8?Q?nxVsccSKD6Xah9tw=3D?=
X-Exchange-RoutingPolicyChecked: uxcQNk377twe9tVmYOUSKyZsM7UYoOm5ot51466uSoZlMImMcOUCvmenIa78Uu9vOQ71lvTQ9/px+7gwZu34EdU9EyiDv1Sl5YYV67npRPe2jh3eZU04BZGyVWUT5TKmliaBx9ig+CMqotKCHSU7GKboeV2f83bdb+xYNwVRHyWCaX5TD7ZElLF5EUXEgZsiDVanbDe2Xj5QyTdRTeCjSpjNmhjcuwYfpd05O54qYMRVnQKJPGHn+aJSEAphdi3bXtCJXZvAVYM4BCBt3Ap/Ly0dCSk+dECZgLACP2lT50yBrMQXeP1ovbFa4nn4c8dww2ozWHyDotmdtAcuKY/0Vg==
X-MS-Exchange-CrossTenant-Network-Message-Id: d41e1201-3f93-456b-1de0-08de813072f3
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 18:43:42.3648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4V7ClATUB1BdOyqsEv3fmnpTmqny2slmlb+MM/u1la783YKcUC583dxv8RKYynAOrSguT/nFFJ3C9Otg8rnl5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5023
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_114349_592704_2284716D 
X-CRM114-Status: GOOD (  16.36  )
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
> Prepares to fix improper Mx positive error propagation in later

Prepares -> Prepare

> commits by handling Mx error codes where the i3c_ccc_cmd command
> is allocated. Two of the four i3c_master_rstdaa_locked() are error
> paths that already suppressed the return value, the remaining two
> are changed to handle the I3C_ERROR_M2 Mx error code inside
> i3c_master_rstdaa_locked(), checking cmd->err directly.
> 
> Signed-off-by: Jorge Marques <jorge.marques@analog.com>

Minor cosmetic issue below.

Otherwise:

Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  drivers/i3c/master.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 9e6be49bebb2c..c66f2655eb404 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -1016,6 +1016,10 @@ static int i3c_master_rstdaa_locked(struct i3c_master_controller *master,
>  	ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
>  	i3c_ccc_cmd_dest_cleanup(&dest);
>  
> +	/* No active devices on the bus. */
> +	if (ret && cmd.err == I3C_ERROR_M2)
> +		ret = 0;
> +
>  	return ret;
>  }
>  
> @@ -1796,8 +1800,6 @@ int i3c_master_do_daa_ext(struct i3c_master_controller *master, bool rstdaa)
>  
>  	if (rstdaa) {
>  		rstret = i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
> -		if (rstret == I3C_ERROR_M2)
> -			rstret = 0;
>  	}

{} no longer needed

>  
>  	ret = master->ops->do_daa(master);
> @@ -2093,7 +2095,7 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
>  	 * (assigned by the bootloader for example).
>  	 */
>  	ret = i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
> -	if (ret && ret != I3C_ERROR_M2)
> +	if (ret)
>  		goto err_bus_cleanup;
>  
>  	if (master->ops->set_speed) {
> 


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
