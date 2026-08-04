Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA285C5518F
	for <linux-i3c@archiver.kernel.org>; Tue,  4 Aug 2026 17:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=YwxEWdHUtv9XpftkIMq699q7bprHKoEDkDilq3JrJMQ=; b=4COX1Xter39FJrtbLwJccBklFg
	tPu5QnfSGRozeXOU1UcaBe3DE4ch370TSmgTLlJ/gI4wW2cs/qnxb5gUBCII3iuWnLHFQVv2cTV+z
	foxjnuLZVF8KhP3qWJqYSTSF+4perSEakLTQw1OuF387BUREUOHB3wap/h5Qlyl9GbyR61NiqFDrm
	maXEWK8BnctDEILfaU3gbDs3Mm+bRlxKHOMB2Q7tBn/o62bwZ864JWeAZXJajInZLbl8Brofakujt
	o/BvfHnCvJ2fH8h+/IG0rV/FFcRJmg3XCtR9ATPlAIirQRFzpYdeJqFFhoxIg+L9WiTpFxaxNmFIS
	G/J9VgkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJNp-00000002Yh8-27pj;
	Tue, 04 Aug 2026 17:56:57 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJNm-00000002YgB-20om
	for linux-i3c@lists.infradead.org;
	Tue, 04 Aug 2026 17:56:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785866215; x=1817402215;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6dKJ7AkpfcZf2QGg4bp//39jhBA+O72jxUHdd2OzC4E=;
  b=GWuUhcxMIEakt2ha5OcRC/flm2Gws25mup0DOlTJy89OCwnLB7PD0A4O
   WbJfqltizOUnopo+9J95bDSSccuHHRuZPov4SeuowwZ3l4KODA2+bHBuZ
   Sz1u80doIMIELuQ6oz8Q50xcGO2cjTMHzlIIW+QpX01dVa53HJGFEhX+A
   HTwKpvr1iTnebki3qpRRXuE2uLe+qcFuY/iut1VkYfyKkZe+dP8xtQ8+1
   kqWyO+8D/x0RROq+YlSRYL00RdgnheR+IMRiAafLHM3JmcoRUE9z8cXAF
   bN69VFHT+QJ8nNWJYYDq7A9+5gvKCmqF0vr7jzqHVZ/JBK0H1ZrCe11/j
   w==;
X-CSE-ConnectionGUID: iJe0Uh7MS9SSjKl3bFeDYw==
X-CSE-MsgGUID: qy36izy4SpqWg+nxV+PTrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="97586410"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="97586410"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 10:56:54 -0700
X-CSE-ConnectionGUID: lcnVMY4BRnSXt+ZrEqFnXw==
X-CSE-MsgGUID: yQT+FPV5T3aSe49Tbg2bbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="258231532"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 10:56:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 10:56:52 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 4 Aug 2026 10:56:52 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.39)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 10:56:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Znh+lf6B2fR1kGhyTJMjSBenRNe0Udz+xXc8H6uaAapFubf1waewTI3Fqt/tO4eWFoamITMbTGMc+4uMz5U5BVAic8WFRTXqvnHkkRZuEfSUIXYUNbOvwuH5QjjiK0hHMp48jJJ05a4HuxWwyz7BIPZJ93KO9wqQqOWs9cU2iABzsTrhO7J9FS2PI/7N6MUBlSL3AYqqDj60lBifIZdzbEKE4p9nyCCzglsrxp4siJG+qZTY6wnTjt1g7O9nkwUnWU1ArVVgPOI/mdv0kKBFQl3f4TS7fc01NZAy+g3deCwWQEcniF/krOmN7WoUBNGUoBN30qLkpUEbHEDaX/yTqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JTYSCtT5fRxGz8V2MpddNWZuXzqR+1anLm5lGNK16VY=;
 b=tlZcgD8yX2JX318/hx6WroNiHD1rMl8kbgc74qyOJUUG8r0iBgrHeIOoe+5QYgUe6n2tCDiux4ndE3IFfX6Wm3GmLRvF3OI9bLRdSd5uqGSx4ightbdqdjs9g72boOEM+VvMxKizKdtMfaV6pXcUQPAjtWHlJBTAEkxtJp/Mt0tvLQjQTgHZeQslIa+cVnG9CQeaLZFWzTMCCv0/Si2EBNTsBKGKDb/4blJk6aNHkFilzsNhHYZpbLl+N2islzqz560LYZpYZ6uzsHEUb57agwzPoaVLLuCAPDT7I3GOD50A0Z1Oedr+azCJd5Q4t4zv3Wvn+tv6rrcD++yt+s0hfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by MW4PR11MB5912.namprd11.prod.outlook.com (2603:10b6:303:18a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.16; Tue, 4 Aug
 2026 17:56:48 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 17:56:48 +0000
Message-ID: <1563b862-9263-49a7-a04c-631a39aa48a6@intel.com>
Date: Tue, 4 Aug 2026 20:56:43 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] i3c: master: Do not release the addresses when
 reattach fails
To: Akhil R <akhilrajeev@nvidia.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>,
	<linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Sashiko AI review <sashiko-bot@kernel.org>
References: <20260804101301.2975911-1-akhilrajeev@nvidia.com>
 <20260804101301.2975911-4-akhilrajeev@nvidia.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20260804101301.2975911-4-akhilrajeev@nvidia.com>
X-ClientProxiedBy: DUZP191CA0072.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4fa::12) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|MW4PR11MB5912:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d8a06cb-3ff5-491c-3337-08def251c13c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|6133799003|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: cqDU1kRGObBLn/uVP5RAxTMNaviw82zoC3LSTraRl6z/FheaFGodm/ncNsNLi+uP/MUJw7VofhKCNvvxAEW3wpVADl5k3yhQI3vS5Y0YUvMZGzBTRl/a7/023nHkch7RFuDVmYmKpgghOV0/Pz/slUriRl73zys7TDDTu2XBeYrVz7IGbxBeaeEP6n/8RlTPrN2vWp3kL182o/9hncQ3A9Tma/ODwu/CNcJlG/2kIndVPzpe7crEIi3cFYJIHcBUoKdmvcQEu/29sOcgwQfyuYaCyVAmsBf29GozkNaq7EvkF1BEFcnZfFQfIly2tRaVCk79FfHLD91yc0hkwgFylU1GgLTrJBBNMmoxaQ2IIn/hfEnBIyYo/A/Z6mB+CkJvozdDxOeyQc/BwhEZM+A4YQKG7Xq3XeLpePK+ILhnhEAvBrKSmeDahHCqJ4TbQY0T5vB63c0Fi8yGSYXpwJzKjD9zhzvBG/2FZ7jTnNy0sgkAtAbIqbAJQY/w3CP1l/TVqbdcCVLPtdQBjL0JZZxCIKjX6hxsc6OoVApKGuug33iDLDju06+6ZeyHxDpI+fy7L2srp1jotpCIuSgBsl1jLrOWR9VVwc4KSftWG79ZbhGLZsh8OPzVSzNI5qHEjoDF
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STdlRkpxVm0zY3dOTFBDcmhzU2xRWWpoc1RUVG9pOFcyQ2p2TklDS2lHSjZz?=
 =?utf-8?B?R2p6UUsrRlZ5SmF3dTg5VUNlMTlzYVYyQ1VwQ0xaTUljK2IzY0ljNFVIQURu?=
 =?utf-8?B?dzdEMGZ2Z2lvZlQ2Y2hOQzVPWnVBOExSVmNFdEJJdmpDb0kwT3pQYktBZEdZ?=
 =?utf-8?B?TGw3ZTBldTFhNXVLYklwVlFTZnBwOThEeVhCbXUvSEJpOEsrUW0wQkh1aHIy?=
 =?utf-8?B?QmNzV1VnNy9OamVnN2pWVG4wSjdsc3cvREQzTDY5ZHNncG8rWlEwNm1pMm5K?=
 =?utf-8?B?T1cyMm5XRlNYYjVSRWl5eFpBYWxBQ1hja29ranl0YTEzYjNKMDAxSFZLOTN2?=
 =?utf-8?B?cjNiT0x3OGh3eHRhVDQ1bG9qa1MycVc0dDVOSitjOHJ2ZWwrbklFUHFvdVJP?=
 =?utf-8?B?UkZ5TUFiZVZxK1JjWnJSVlgvUEdDbGFGK2dPNUJTTy9mMGtpWElrNklJUDJP?=
 =?utf-8?B?QWwyOTU0anZ2cGRUWEZuRzNwK1Fva1hFandLQlQ3bUNocUI0UkcrNzNYVGlz?=
 =?utf-8?B?cFN5QzQ0L2VySnBibXp4NEh0S0ZjWFlhRXV1YzVSRm5oS3FjK21xRk1Gc2lw?=
 =?utf-8?B?KzJYWTVsRnA3QkdvdWJpakxSMW1qU2h4SkwxK2pCVEQweWtwNjhaZmxBMzNW?=
 =?utf-8?B?OVlxdmFqbWtZcksweDF4TnJzSEwzTnRHS0VYMERLWEsvM1NlVUhZSDV2M29G?=
 =?utf-8?B?MzZxOFRZSG5xZ0N3Z1lHbmlaS1FNR0hVNnFHTGxxR0xZWEtSMDBObEtrMWRv?=
 =?utf-8?B?dTU4T1RpNlZLc3RZUUxnanMrWTdJT0VwSVlBN0NyRXN0Z0hDcHdsTzlYQXNK?=
 =?utf-8?B?VzBNbC9kQXBOWVBJaVc2Y1lWKzd4TDhDUnEwZHZlV1IxVUdhb2pHUkFQU1FT?=
 =?utf-8?B?aUV2ODZidkRmc0ZKQWQ0d2ZrQnNzTjZIMVN2QmV6ZDlEQjBuZXU2bzgvQ1Vm?=
 =?utf-8?B?T3NOSGg0WElYdU9ub0ljSmpwUGJLWUFFVjRmeGlHMmYzTk5ZcjFCejNlRmxF?=
 =?utf-8?B?UVl0Z3dHRG9NTkJSa3Z0UWd3RFZ6Q09pdzVyNVlmSlJNcmlxYU1pT1ZFS1FL?=
 =?utf-8?B?LzVEU3Zma1NmYVV4YTM5cTUvc1V6WGkxMnpITGNLOHZYWk54NnU0VUROYWtD?=
 =?utf-8?B?S0dJVmVBSWh4K3IzOXFPWUhTQVNMMHJTVDVOQUplRzA5aXpqajYrTjFlUXA2?=
 =?utf-8?B?anJYendVNnppWGZKSEY5STVVREhLTS84WG1qRXBrRlN2U2svajdFcWd4d2g0?=
 =?utf-8?B?YVZuVG5QT3I1WkdsN2ZkUWRJU3cveWZWQnBzQXlOZXZnVWxuSDlTMWtGOU10?=
 =?utf-8?B?RnJDenVDS3BtOG5veHMvOEQ0Q0VPZ3M2MnBLRWFtSjFUa0Vaa29NeXFrenFx?=
 =?utf-8?B?QUVUVkhZZUdmTnloMzhwWlRRd3lxNEFmdHQ3YUFNZ3A2TVNkSE1DVEtOU3JM?=
 =?utf-8?B?cmoxOGlnVkpxYnk1dUwvcTVxalFJeWVCMENCc1pzMm0zaFN4NmhVSEN6YlRS?=
 =?utf-8?B?ZUx6ZVRZWGlzeStpQ0pWYUxZcFRFbzNWaGRURWlFUHhWK0oxNnl5WlVwNnFT?=
 =?utf-8?B?NVpsNE1FZzFVQ2ZmQlR0bU41amF3dU5Hd3JKMm9kRmIwdjFIY2ROd3RHQjh6?=
 =?utf-8?B?NkFkelNCd093eitXbUVldmppUEtZeDNuOTFlRkRxSUQ4OEFJclpZREhNM1Mr?=
 =?utf-8?B?UlJ2MCs3aCsyeWNkekV5bHIrWGFrSTNKbis2ZGRIVG81RXV3azdFWUxXVEth?=
 =?utf-8?B?dENLNGcvNTREcXVJL25JSkdyK1ROdXZCNytjQ2JCL0F3SEp4RUpvM1VIY3Jq?=
 =?utf-8?B?aVRoY1dHUERJMXFzWWdOb0J2aTFyK2ZadmYyRmYzQXhPQUZ5Yk51S1NOS0cx?=
 =?utf-8?B?aG1rNU9SSWtYVkQ0WUFaWWptQ1oyZlVQREZJTGNsVkR3SjN4a09iYTYvckZ4?=
 =?utf-8?B?dXI5cXRxTDV0Mm0wQ2ZXYzhsSEFZUyt2ZEhxMEVUMWMrV29URGhTdXdEMU9P?=
 =?utf-8?B?YjdoM1V1b3BUUWpVK2RFZmZyYWcyaDdkL08zYXhBb2FwTzZnbFpiRHh0RDls?=
 =?utf-8?B?b1NiNXY5TWx2TU1VT2hsaWxraHBvYXdOakMzMXh6Yi9wWlRLYkRyTTNSMFhV?=
 =?utf-8?B?K0NIcENJMHAwejZLdm4vQzcxMnFLbndJNk1kb09yZTV0Z0V5em55anJMMENP?=
 =?utf-8?B?MjJvWGFqNk9hQy9FVDNTeHRRelorVE5raHJCNm93N3ZrVHNJNlFpVkxMdTd2?=
 =?utf-8?B?VGlpSVZ0cjZPYzZrMGdYSGZBbndwMXhCcDB5bktkcmVxQVg2UG4yWEJGUThs?=
 =?utf-8?B?ZnN1ckQwWTdndlZMYWFJQUd0ZHhURHYxNTl2QUIyV1FUYy9yQjlxRnE0Mm1V?=
 =?utf-8?Q?WwIyN+tratN6Cwok=3D?=
X-Exchange-RoutingPolicyChecked: R+QDQzmtx80GcMrPwiBj3lY5x1RnPrcygYrZy+fFqGJW4H8wPmjWvWpuzYIBZIS1UJgiMDFr6RyIYPE156W1fB7hCLsIJ4IqlY9tfni9igNLPW/crvqtXLwbxVABXA43CbNx6vuxLLCoAJpMGE79u0kqOQcA1Yrt2g4WIleG359+wPGBYV8k136nI2hHqbjGd5xggzPuEYl4I4M0QfIF+2zX/sLymr/0dCCVmcMC60w8RRKPEWPwHBDw6mz6iPY9WmUeK7pSPQZfNrTcmZeYlcVzGZ4bPekjEelpxS64dWab/R8FuQ8VNqQExuNLF/bNaxJEb131PhNRnBh4Uj5l4g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d8a06cb-3ff5-491c-3337-08def251c13c
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 17:56:48.3855
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bWZx7D1pziJti5qnrlscksgHI6zybCkhDPKWGV1JC+V1yDrf10rkrkzMobrkEXzaF+5/OPhsUp/zsoOklzK5TA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5912
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_105654_607506_39D17F55 
X-CRM114-Status: GOOD (  22.41  )
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

On 04/08/2026 13:12, Akhil R wrote:
> i3c_master_reattach_i3c_dev_locked() releases the address slots of the
> device when the controller callback fails, even though the target keeps
> responding to its dynamic address on the bus.
> 
> i3c_master_early_i3c_dev_add() cannot take that address back afterwards.
> It jumps to err_rstdaa to reset the target, but i3c_master_rstdaa_locked()
> only accepts an address that is marked as assigned. It rejects the request
> with -EINVAL and sends no CCC, leaving the target responding to an address
> that the core considers free and hands out during dynamic address
> assignment.
> 
> i3c_master_reconcile_dyn_addrs() ignores the return value, so the device

i3c_master_reconcile_dyn_addrs() doesn't call i3c_master_reattach_i3c_dev_locked()
but __i3c_master_add_i3c_dev_locked() does.

> stays attached and in the bus list at the address that SETNEWDA just
> assigned to it, while the core is free to give the same address to another
> device.
> 
> Leave the address slots to the callers. Those that cannot use the device
> any longer detach it, which releases the slots in
> i3c_master_detach_i3c_dev().
> 
> No in-tree controller fails its ->reattach_i3c_dev callback today, so
> there is no known trigger for this. It is a robustness fix for the error
> path only.
> 
> Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
> Reported-by: Sashiko AI review <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/20260721043058.C02B31F000E9@smtp.kernel.org/
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
>  drivers/i3c/master.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 568788e4cdb5..23557ca2df68 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -1944,10 +1944,8 @@ int i3c_master_reattach_i3c_dev_locked(struct i3c_dev_desc *dev,
>  
>  	if (master->ops->reattach_i3c_dev) {
>  		ret = master->ops->reattach_i3c_dev(dev, old_dyn_addr);
> -		if (ret) {
> -			i3c_master_put_i3c_addrs(dev);
> +		if (ret)
>  			return ret;
> -		}
>  	}

That becomes just:

	if (master->ops->reattach_i3c_dev)
		return master->ops->reattach_i3c_dev(dev, old_dyn_addr);

and 'ret' goes away.

>  
>  	return 0;


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
