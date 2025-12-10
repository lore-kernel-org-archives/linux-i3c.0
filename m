Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 120AED3B9A9
	for <linux-i3c@archiver.kernel.org>; Wed, 10 Dec 2025 09:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=mFORsQCd8uuGOiiMDQlJmkgVnwEFUXV08wdbLS86Svg=; b=HvQwG3KQJYMh1mafMivNkt8SY0
	lZQMaGrD88jqlfsSc/Iiv5BLzyv810hyp3xrlbPQSfrfdadXkSzW7gWrL6SW/hTM9IjkjukXZKkih
	XW2JiWjiMMeV3G+oVx3/+55VlPnCCGLHBuMuQnWyVCYp53SDe1Zj+6CpvVe47x0bdHgd3yQmGYbE1
	mlMQyWklRzihq4XAJvh+Lx/1By93RIsv8l16uUgwwgLuR/usdPW+/HSqv8hMkI7/b4B1JUXK5/qL0
	fnL3X7s6u0/DiGvsPTS0sYIVqKnYDMSHiUrVHTRnj9sKrPHd0B/QZC5BHUEgAoxhuFqORL1iqgFDx
	tXDzwU4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTGKY-0000000FHCm-24R2;
	Wed, 10 Dec 2025 09:17:54 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTGKV-0000000FHCL-3pEs
	for linux-i3c@lists.infradead.org;
	Wed, 10 Dec 2025 09:17:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765358272; x=1796894272;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ujheloM4ohuwhykKIDhCtGVqmV/PtvGJsf3Srgg5tnI=;
  b=EPZqqYVfJbhm0YI2QtL4s5McRQXBuEr8UA/TR6l+em+soePqPvmJv2UU
   l2DN7OoBGTZZwjtwhwgaW7DZveHS4kdZPh+BMfHTOnCUDcFTcNzo5gBU0
   O+N9/oYmqPcIDkEDsTj9xoCEl3/tU7QF3NVGvcBC7kZtSAzu3g/2k+6Qn
   cp0d9e42O9u3MtDxsiw0pyqn5hjaedBIfeSpr2Wa28L+UiMi25XcPYPNO
   4GHXCMy/jHcFyBYtkTCVnd3FQffvuDlL2EuYCIqZj/VWCpAiPMgtKimNa
   ikHganvCckPTiV/IlS6FD85mHZ10t9zw59bytlZ7SRPCg9aYhoCIgUMz6
   g==;
X-CSE-ConnectionGUID: x8ZMzSIZQGChQqMDag44mQ==
X-CSE-MsgGUID: hTRJqbkcQAGs9NKRClJYvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="71173678"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
   d="scan'208";a="71173678"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 01:17:50 -0800
X-CSE-ConnectionGUID: l+8rI6vdSRutoZPYqnkz+w==
X-CSE-MsgGUID: 2ozIqFqdTI66YaKIZukPFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
   d="scan'208";a="195533511"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 01:17:50 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 10 Dec 2025 01:17:49 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 10 Dec 2025 01:17:49 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.19) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 10 Dec 2025 01:17:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qS4tRzfnA8gXrAYZ/8qVR2wQq2Ta+zjwkIQe5daHycps7s0iAvxyeJz6HiPm5jv0YCz/CpgKvQVWZMratO84EHMihRwzAtsEKZFTT8kVklV/yL43xRWO4JX0GQzdXvMUUNke5T0L2iNITQSqb1PVK8HieQxc7ZFbL/Ct4aFpWyLzHBZZ2P7NWPPbues/kG8GTIaiR3ChwsU2X5MB7L+YcE/t35Dudav+mF71Z5mnnTFb7zhWIJwEW0SKJeXSzvAhkgD+hL2fmYF5ro9FUUVRPCIVrobDYku/MT3hOotaIf87w8ajhfAvdzp5fEnWN0hzcoaWXdekGPO1xRjewG6u4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y39Q2v9i08axMc/JdRFtMJ9SMU2JRqWY8Phz3DFlG1E=;
 b=KtzQ474uPhkKqgtkJhYsWW90u8sYY8RQJwo9l/0geBBY+FoXlXcMEJE0MFU6a3eL5FBR6dXGTJtMEGHwf31epFm2vtg+UEl0AObEf0NEVx/tNeTpWGpEf58yEb8kMoSVgu/co46AEsg5p3EmAFiUY2A4lLDCI5OEFjejhYZG/64o2qPMzhXB6ISp/zOPFGoaHOJHkwuJf+4bKsh5tFMWbdXjxTbeKVt7SbCVltkqzSTCpWKwvIZlvPs2/beQe8K4IPDhSuGMzQ2doQR5eh7VkVfnXq2fAIoMb2PbhSLJHuKUF48iF24GSMXKwF95dH5D7VLNdFsyIIIKtq6jdsjPzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by CO1PR11MB4964.namprd11.prod.outlook.com (2603:10b6:303:9e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Wed, 10 Dec
 2025 09:17:47 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 09:17:48 +0000
Message-ID: <b95d09ab-2101-4a79-b186-3f58cf32506a@intel.com>
Date: Wed, 10 Dec 2025 11:17:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] i3c: mipi-i3c-hci-pci: Add support for Multi-Bus
 Instances
To: Frank Li <Frank.li@nxp.com>
CC: <alexandre.belloni@bootlin.com>, <linux-i3c@lists.infradead.org>
References: <20251209115104.124156-1-adrian.hunter@intel.com>
 <20251209115104.124156-7-adrian.hunter@intel.com>
 <aThYEy/L2Ou8tDeF@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <aThYEy/L2Ou8tDeF@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: DU7P250CA0010.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:54f::28) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|CO1PR11MB4964:EE_
X-MS-Office365-Filtering-Correlation-Id: 24402012-5ca8-402a-e5a4-08de37ccfc23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aUxMUVhEcjFVOUp5YUdLbjE3QjlYTkJTWEc4NmVuZ2hOYVdTeFVqazk4SmM3?=
 =?utf-8?B?azZacHRVNUYrQ2hXbU9TL052RUJ3WTJRdFM0MTJmUythS0V4eEZUSmVBT3Ur?=
 =?utf-8?B?ajJUVGI5T3BVeisxMmlvR2wvM1lpTllQSGlBandjK0RHRVB5S1BPdVdOeFF5?=
 =?utf-8?B?MXltV1I0dE9INHFJOGV3YmhYRUpaYlJSZUpQQ0RSZUFMU2pFWk5aUlE0SzhC?=
 =?utf-8?B?UklaRXVYalZwYWo4Tzgva0VNUHkwZVhabUJOTW41MGxIVzlaWnp2VWxEdW5l?=
 =?utf-8?B?a1dHYzltQUU4QUZJaU1Sb1FRR2V4VnJWWHlOMXVKalJ1bnpZbkhQYjErL1J3?=
 =?utf-8?B?dkxRdmhyOXp1VHRYTWdQblN2T1I4SFF5QS9pTm9SR0JsYkl0RC9NWjJianVW?=
 =?utf-8?B?ZTBLaWRhSFhmMDRqMDZjL1czUVlLQUlmRC9hVy9laFl6ZGk4NEplVHVBb3lz?=
 =?utf-8?B?dXFLRExnMHJzT2RsRlRuRlRZRThWMTF1RmFmd0VJbUJGVDY1S1NSOENxcEpv?=
 =?utf-8?B?MFA3aVVIbFBYWmpFZU1pRFhCbTIvVCtydEszd2tDQmR1NmZDMXlocVBGNGxy?=
 =?utf-8?B?VUFQbDZ0bWpwQWZGK21nR3NJWkNrN09TdENVUE93cVB0cWg5NjhFa2YwT29I?=
 =?utf-8?B?OGlEeWlXOHQ0QjlWSFJqSlZ6clQ5OVE0SUptRzN1d0dSbmhKN0tuVTBLem5X?=
 =?utf-8?B?U3BuNDhXZnVqZWlZVCtaVnFRZkNFaTRQWS9TYkgyZlhVbFl3enIvM1ZmdVBX?=
 =?utf-8?B?NWppN0FFV1l6UDk1K1FaMURGWVordXVhbGRYaDl4em5zbUhNRndhVFVwQTBy?=
 =?utf-8?B?dm1GNTd0TnFjV3lZQUJCcFJzR3dyODNGMGliOFFBc0hHcWo1S0ZyTE94YVBF?=
 =?utf-8?B?T2lZcC9EQTd6U1ZzUlNmWHJkNTJPSTlYZjZTVW4zYVdHYW56ZFFZRitwdWt6?=
 =?utf-8?B?N3VXSEhKYnp6T0QzY0ZzNnk5c21UV1AzUXRTbjhpOEhXbDNGTUdhNS9OVFYz?=
 =?utf-8?B?VFlaTXE1VFNNK1NDckRnN1dEc1R2SFpsKzN4SEJCUmoraWVKYWtGSTB5QWQy?=
 =?utf-8?B?VUFEVGltQmdLMGg4ejlkclNNeHBVSjJoSWVPY2ZmUDQ5VmhvTlFSVXd1dnM0?=
 =?utf-8?B?OEhIT0ZITy9UMjhhNGkwc2JsZ285eE40MFdlNjd6OE9WZVhveGpSZHJXWitY?=
 =?utf-8?B?ZU9tMmVwRitvUkp5cEFNaHE2RElQSHBGaExEM0F2Ung1eTVReVFtYkY2UkM5?=
 =?utf-8?B?TE1saFlUQm9HWkZ6R29QUEJyL0ZUM0tKUk9HSnJnK2ppWjFsUHlTK0xVRHRV?=
 =?utf-8?B?WXFlWDdqODc3VkU3YW1YWEtwbUtyZ2EwdXc1VUYzSXlnR3BBL0dHcFFxNjBt?=
 =?utf-8?B?UHFWNXN3aEpoaGc5bDQ4Slk0Z0NXR09MaDhDZUxLbDc5VU5YL0Q5RjhwTHJ4?=
 =?utf-8?B?L1IxV1ZhTTBjT2M2Ni8rY2hTaUpESEFiR2J3K3k5cXNqZTRHMi9aNTNuNWsw?=
 =?utf-8?B?eE5maHJsTzRibkF3bVZvOXc4TXFEdHdpRTdjQ1ZHQVcwZDlDbGwzczVoTWQ0?=
 =?utf-8?B?WUQybzZTZXdyTjdIQ1Y0ZVVGZVViSU90aVlacktyTUluRlVXbWN6SzM1UW8y?=
 =?utf-8?B?TVdaenBZUW9xUVJ0THlIUlc3Q1hPd0JWQVVXYm9td3VCcTZrZkdJbUFoM2d0?=
 =?utf-8?B?Z3g4SEgyRG1STGpta0ZmTHh4b2t5SHJHYUx4MVNPc0lzeGpXUlAzQXQ5VTI5?=
 =?utf-8?B?TlZUSUlobEVDb0M0R0JvNTNpb1JDV0owV3ZzRGdJOUFDeG5oVHZtd2RoQmlU?=
 =?utf-8?B?eVN0ZE5XU20vTnFnL3pGOFRkeUZtMmQ0bHpENlRoSzYxS1pFNDlMUU43REVV?=
 =?utf-8?B?dWRnQ2UzSUFzRG5IakZ6Z0FIdEU0WHZQcThpbXRmMWpONzY2cFlzckI4L0k5?=
 =?utf-8?Q?HyKmHAZ3xotwgsGJw0sKJ6gs2DxVmfeI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVZZaUlESVdIM3Z5QmU4eUJYZ29hcVlSUnQwU2RlTGhnd3FSdnd5SVhCSDNu?=
 =?utf-8?B?R1dtdStIbXRDdU9WL1BnVHNtZGhXTWdmYzB1L0ZNc0RCUG5qK0doWldzbUI3?=
 =?utf-8?B?clFVQU1ERHBURm9DVVdXbW9JVk5CQlNtRDBZMFpMNjZmMnN2Wmdvb0ZaeDFj?=
 =?utf-8?B?SHZNQUhYZjlVMkJla3JVandoeTl1cEJ3dFhvazZTNndXRnRUTXpDRmV0aFdS?=
 =?utf-8?B?aTRtanNBcnZMOEQ2MmdxQnV2VEJJM0FOZkFzNFFsNGZkdUtFTWVUeDQyREFB?=
 =?utf-8?B?eExmbmJrSVFvNVpSOGVkLzFjemwraG1acDRsU29NVy9pT1ZXY040ZUh6QkN5?=
 =?utf-8?B?WHJobW8xWER4dyt1K3k2YkR1WVhrS3QxcFBUUTdJUjIzRWU2eXFNSUJqdzA0?=
 =?utf-8?B?Ymt4YjN2OEVWaGNYOWZoZFJFa0hBRy96WW5YWG9pcTdrUXBFRCtEYUlFdUVN?=
 =?utf-8?B?ZWV4Z0d0ME10WU5EY014bEdLRmMwSXQwaEQwWTk4N2w0cmFLTDdYMnRLNFZp?=
 =?utf-8?B?TWtUd2hMTU5ZR0lDY2g3eHdDVmttWVdySGV1QnFlbitYbkY5cVlneFd4VitV?=
 =?utf-8?B?RXlSVVd6V01DZ2htbFFWbXB1UTNyQ0UvL2JqbWQyZkVzNDBMSDNZVnc3b2pY?=
 =?utf-8?B?LzVXaUM0SkY5Mmg2eUVQOGJlQWRjQXZxSVFxTHFnblQ4OFpYYkR0ZnlKSFkv?=
 =?utf-8?B?dTlCWGdDc1RDOEZURG1LQnhUQi9rN25TZVZJMWlzMnpWbjhuUTRXNmQ3YlVJ?=
 =?utf-8?B?UXhyWHBjRUR0V2J0MkdpQytKZDA2c1FCTy9YMXV1dm1zQndzUkkrL2hJYjd1?=
 =?utf-8?B?d0xTNFFtc2JuMUtaaXhoaTlvM0szS1AvZThGUXU5ZzRPdHE5bTJBZUtGNG05?=
 =?utf-8?B?YTFxL2wzN0ZJUEpia2pVcFNmTXNxUFRwVmVTcDhsQWQzT2JUUnR4dnBwN3dM?=
 =?utf-8?B?eWRjUUo4QXd1eXk2S3c0ZGgvdmM5dXdIOWVuaHVZa1VPQmFnaTdrMlFhUkM3?=
 =?utf-8?B?RHBHZWFORWhyTmNud1llWUVCWlpTejRaVjAxSmVIZElEZm5NbE5IWnBpVVY1?=
 =?utf-8?B?cXZ3aklaYkRIbWlpR1h3VmM2RjJSOXRwTVRxSWg0VnhkdkorUEJzVW9YdEpH?=
 =?utf-8?B?S0JpcGRzYnU1cWJvL2djRWI3bVY4YTB0ZHAzNkpHSEhsQzdyQUNiQU5sMnND?=
 =?utf-8?B?bnZRTTg0aFp0UG5NQnZyL2xWZVpCenFDNjlDSkIyNjU1ZVNGMDZtY3BFY1Jo?=
 =?utf-8?B?cjNjWENzSDdQQ1hMSW94V1E3SEtIem5uTXQyS2lIRVlQRTVLaVF5UFJ1UXBM?=
 =?utf-8?B?OU9uWHREUWJtdGorQnFGYzJMWStMUTZsMXZJTFNOSEphOHFzNHlSRWh5NUNR?=
 =?utf-8?B?NFZiUUtUV2kzVS9oNjVOc0ZJMmFmUm5hYm44ZkhKSDRwVlhZSXJKaDk2QThD?=
 =?utf-8?B?RGExc3h5ZmFkZ29ZdWlyeWVsZFBHSFc3Zi8vZnJOYkFld3B3VXJlbm1EUWlR?=
 =?utf-8?B?eERrUGxNNExzZG9YOXpKNnVpQm0zeE9zWjIrYWZHTmx6b0t0MDVoekorWEkz?=
 =?utf-8?B?R2NVanVsRVkvZTFBdmNIMnJ1VDFxRko4RHVCUkxCZmdSWDJJMUhqb1gvZndv?=
 =?utf-8?B?cGR0VUw0Wjl5V3VseUVkYjN3MjJVb0g4UzlacHlmTVlXLzQzdGVCNllSSEkw?=
 =?utf-8?B?N1lLQVpzWlJkNjU5NEtuSFdxV2dZZ1o5UlR6TS9wbHRQODFENk01T3ZBUFpn?=
 =?utf-8?B?V3VLS0N5SEI5R1RwWmtPNHdKc1cxcVhQOE55OG9LSTdEYmQrSEVBZEVVRXN5?=
 =?utf-8?B?MUtQUlVSaWZFMUc1NDc5MEd3VlB3cVFUOGIvVmoxQXJ4alpwRzlIemVrVTE2?=
 =?utf-8?B?MFJROTlhdk5vQVE0ejRldFVhd1M2cHdhRFQyM3RTVmxZL2dDWEZSRUF6R3dI?=
 =?utf-8?B?VEhyUnBnNVJFUisxOUJUVW1DK0FRYm5wa1M2cnRaSkFvUGJWQy9BQWZiUnJu?=
 =?utf-8?B?dkg3ZXNyS3dpemV0eTQwbHQ0ZXdqa3djcTdiQU5FS01jVmNIU01Ddm1CVXlL?=
 =?utf-8?B?ZVpabUNhaTdvcWxBbFdBN2hPdFZzUUt3VWhGQlpHM1V6VHJSSUFTMXZPQTFi?=
 =?utf-8?B?WFk2NHR3OHdNUUl1cUpkbE1TQjBHWEN6WEROYlRZNXFkVTFNS3EwVnNuQldC?=
 =?utf-8?B?eVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 24402012-5ca8-402a-e5a4-08de37ccfc23
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 09:17:47.9172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PsQJ+WYTtDvrPva0j0OeCvMqK06T93pBE+suKYvoQo21OL8BbCVR5WP3Z06cAXidrU9PIcTNFejv2+Ebk9bzwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4964
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_011752_034728_A5540B1A 
X-CRM114-Status: GOOD (  20.67  )
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

On 09/12/2025 19:10, Frank Li wrote:
> On Tue, Dec 09, 2025 at 01:51:03PM +0200, Adrian Hunter wrote:
>> A MIPI I3C Host Controller with the Multi-Bus Instance capability supports
>> multiple I3C Buses (up to 15), with one instance of the HCI Register Set
>> and one instance of I3C Bus Controller Logic for each I3C Bus, in a single
>> hardware function (e.g. PCIe B/D/F).
>>
>> Convert to a Multifunction driver and create an MFD cell for each instance.
>> Create a separate platform device for each instance.  Use platform_data to
>> pass the instance's register set start address.
>>
>> MIPI I3C specification defines an Extended Capability to hold the offset
>> of each instance register set.  However parsing to find that information is
>> relatively complicated compared with just including it in the driver data.
>> Do that for now.
>>
>> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
>> ---
>>  drivers/i3c/master/Kconfig                    |   1 +
>>  .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    | 180 +++++++++++++-----
>>  2 files changed, 131 insertions(+), 50 deletions(-)
>>
>> diff --git a/drivers/i3c/master/Kconfig b/drivers/i3c/master/Kconfig
>> index 82cf330778d5..2609f2b18e0a 100644
>> --- a/drivers/i3c/master/Kconfig
>> +++ b/drivers/i3c/master/Kconfig
>> @@ -69,6 +69,7 @@ config MIPI_I3C_HCI_PCI
>>  	tristate "MIPI I3C Host Controller Interface PCI support"
>>  	depends on MIPI_I3C_HCI
>>  	depends on PCI
>> +	select MFD_CORE
>>  	help
>>  	  Support for MIPI I3C Host Controller Interface compatible hardware
>>  	  on the PCI bus.
>> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
>> index ccaec5d3d248..145f9adadf75 100644
>> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
>> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
>> @@ -12,27 +12,43 @@
>>  #include <linux/idr.h>
>>  #include <linux/iopoll.h>
>>  #include <linux/kernel.h>
>> +#include <linux/mfd/core.h>
>>  #include <linux/module.h>
>>  #include <linux/pci.h>
>> +#include <linux/platform_data/mipi-i3c-hci.h>
>>  #include <linux/platform_device.h>
>>  #include <linux/pm_qos.h>
>>
>> +/*
>> + * There can up to 15 instances, but implementations have at most 2 at this
>> + * time.
>> + */
>> +#define INST_MAX 2
>> +
>> +struct mipi_i3c_hci_pci_instance {
>> +	int dev_id;
>> +	u32 offset;
>> +};
>> +
>>  struct mipi_i3c_hci_pci {
>>  	struct pci_dev *pci;
>> -	struct platform_device *pdev;
>> +	void __iomem *base;
>>  	const struct mipi_i3c_hci_pci_info *info;
>> +	struct mipi_i3c_hci_pci_instance instances[INST_MAX];
>>  	void *private;
>>  };
>>
>>  struct mipi_i3c_hci_pci_info {
>> +	struct mipi_i3c_hci_platform_data pdata;
>>  	int (*init)(struct mipi_i3c_hci_pci *hci);
>>  	void (*exit)(struct mipi_i3c_hci_pci *hci);
>> +	u32 instance_offset[INST_MAX - 1]; /* Excludes instance at offset 0 */
> 
> what difference with mipi_i3c_hci_pci_instance: offset?

The instance at offset 0 is mandatory and so is not listed in
driver data.

> 
>> +	int instance_count;
>>  };
>>
>>  static DEFINE_IDA(mipi_i3c_hci_pci_ida);
>>
>>  #define INTEL_PRIV_OFFSET		0x2b0
>> -#define INTEL_PRIV_SIZE			0x28
>>  #define INTEL_RESETS			0x04
>>  #define INTEL_RESETS_RESET		BIT(0)
>>  #define INTEL_RESETS_RESET_DONE		BIT(1)
>> @@ -143,19 +159,12 @@ static void intel_reset(void __iomem *priv)
>>  	writel(INTEL_RESETS_RESET, priv + INTEL_RESETS);
>>  }
>>
>> -static void __iomem *intel_priv(struct pci_dev *pci)
>> -{
>> -	resource_size_t base = pci_resource_start(pci, 0);
>> -
>> -	return devm_ioremap(&pci->dev, base + INTEL_PRIV_OFFSET, INTEL_PRIV_SIZE);
>> -}
>> -
>>  static int intel_i3c_init(struct mipi_i3c_hci_pci *hci)
>>  {
>>  	struct intel_host *host = devm_kzalloc(&hci->pci->dev, sizeof(*host), GFP_KERNEL);
>> -	void __iomem *priv = intel_priv(hci->pci);
>> +	void __iomem *priv = hci->base + INTEL_PRIV_OFFSET;
> 
> Does need lock if mult instance to access this MMIO space? Especial enable
> disable irq, which generally use read modify write pattern.

No, the MIPI I3C register sets are separate.

> 
>>
>> -	if (!host || !priv)
>> +	if (!host)
>>  		return -ENOMEM;
>>
>>  	dma_set_mask_and_coherent(&hci->pci->dev, DMA_BIT_MASK(64));
>> @@ -187,12 +196,106 @@ static const struct mipi_i3c_hci_pci_info intel_info = {
>>  static const struct mipi_i3c_hci_pci_info dflt_info = {
>>  };
>>
>> +static void mipi_i3c_hci_pci_init_ids(struct mipi_i3c_hci_pci *hci)
>> +{
>> +	/* 0 is a valid id, so set unallocated ids to -1 */
>> +	for (int i = 0; i < INST_MAX; i++)
>> +		hci->instances[i].dev_id = -1;
>> +}
>> +
>> +static void mipi_i3c_hci_pci_free_ids(struct mipi_i3c_hci_pci *hci)
>> +{
>> +	/* ida_free() ignores negative ids */
>> +	for (int i = 0; i < INST_MAX; i++)
>> +		ida_free(&mipi_i3c_hci_pci_ida, hci->instances[i].dev_id);
>> +
>> +	mipi_i3c_hci_pci_init_ids(hci);
>> +}
>> +
>> +static int mipi_i3c_hci_pci_alloc_ids(struct mipi_i3c_hci_pci *hci, int nr)
>> +{
>> +	int dev_id;
>> +
>> +	mipi_i3c_hci_pci_init_ids(hci);
>> +
>> +	for (int i = 0; i < nr; i++) {
>> +		dev_id = ida_alloc(&mipi_i3c_hci_pci_ida, GFP_KERNEL);
>> +		if (dev_id < 0)
>> +			goto err_free_ids;
>> +		hci->instances[i].dev_id = dev_id;
>> +	}
>> +
>> +	return 0;
>> +
>> +err_free_ids:
>> +	mipi_i3c_hci_pci_free_ids(hci);
>> +	return -ENOMEM;
>> +}
> 
> Feel like above logic have some complex, add nr in mipi_i3c_hci_pci.
> INST_MAX can be 15.
> 
> mipi_i3c_hci_pci_free_ids(hci)
> {
> 	for (int i = 0; i < hci->nr; i++)
> 		ida_free(&mipi_i3c_hci_pci_ida, hci->instances[i].dev_id);
> }
> 
> mipi_i3c_hci_pci_alloc_ids(hci, nr)
> {
> 	for (int i = 0; i < nr; i++) {
> 		dev_id = ida_alloc(&mipi_i3c_hci_pci_ida, GFP_KERNEL);
> 		if (dev_id) < 0)
> 			goto err_free_ids;
> 
> 		hci->nr = i;
> 	}
> 
> 	return 0;
> 
> err_free_ids:
> 	mipi_i3c_hci_pci_free_ids(hci)
> 	return --ENOMEM;
> }
> 
>> +
>> +struct mipi_i3c_hci_pci_cell_data {
>> +	struct mipi_i3c_hci_platform_data pdata;
>> +	struct resource res;
>> +};
>> +
>> +static void mipi_i3c_hci_pci_setup_cell(struct mipi_i3c_hci_pci *hci, int idx,
>> +					struct mipi_i3c_hci_pci_cell_data *data,
>> +					struct mfd_cell *cell)
>> +{
>> +	u32 offset = idx ? hci->info->instance_offset[idx - 1] : 0;
> 
> When idx is 1, copy from instance_offset[0] ?
> 
> when idx is 0, offset is 0, so hci->instances[0].offset = offset;
> so hci->instances[0].offset is 0.
> 
> then hci->instances[1].offset will be 0?

There is 1 mandatory instance at offset 0.  Other instances, if
there are any, can be listed in driver data instance_offset[].

> 
>> +
>> +	hci->instances[idx].offset = offset;
>> +
>> +	data->pdata = hci->info->pdata;
>> +	data->pdata.base_regs = hci->base + offset;
>> +
>> +	data->res = DEFINE_RES_IRQ(0);
>> +
>> +	cell->name = "mipi-i3c-hci";
>> +	cell->id = hci->instances[idx].dev_id;
>> +	cell->platform_data = &data->pdata;
>> +	cell->pdata_size = sizeof(data->pdata);
>> +	cell->num_resources = 1;
>> +	cell->resources = &data->res;
>> +}
>> +
>> +static int mipi_i3c_hci_pci_add_instances(struct mipi_i3c_hci_pci *hci)
>> +{
>> +	int instance_count = hci->info->instance_count + 1; /* Include instance at offset 0 */
>> +	struct mipi_i3c_hci_pci_cell_data *data __free(kfree);
> 
> now prefer assign value when declear, see cleanup.h
> 
> 	struct mipi_i3c_hci_pci_cell_data *data __free(kfree) =
> 		kcalloc(instance_count, sizeof(*data), GFP_KERNEL);
> 
>> +	struct mfd_cell *cells __free(kfree);
>> +	int irq;
>> +	int ret;
>> +
>> +	cells = kcalloc(instance_count, sizeof(*cells), GFP_KERNEL);
>> +	data = kcalloc(instance_count, sizeof(*data), GFP_KERNEL);
>> +	if (!cells || !data)
>> +		return -ENOMEM;
>> +
>> +	ret = mipi_i3c_hci_pci_alloc_ids(hci, instance_count);
>> +	if (ret)
>> +		return ret;
>> +
>> +	for (int i = 0; i < instance_count; i++)
>> +		mipi_i3c_hci_pci_setup_cell(hci, i, data + i, cells + i);
>> +
>> +	irq = pci_irq_vector(hci->pci, 0);
>> +
>> +	ret = mfd_add_devices(&hci->pci->dev, 0, cells, instance_count, NULL, irq, NULL);
>> +	if (ret)
>> +		goto err_free_ids;
>> +
>> +	return 0;
>> +
>> +err_free_ids:
>> +	mipi_i3c_hci_pci_free_ids(hci);
>> +	return ret;
>> +}
>> +
>>  static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>>  				  const struct pci_device_id *id)
>>  {
>>  	struct mipi_i3c_hci_pci *hci;
>> -	struct resource res[2];
>> -	int dev_id, ret;
>> +	int ret;
>>
>>  	hci = devm_kzalloc(&pci->dev, sizeof(*hci), GFP_KERNEL);
>>  	if (!hci)
>> @@ -204,68 +307,45 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>>  	if (ret)
>>  		return ret;
>>
>> -	pci_set_master(pci);
>> -
>> -	memset(&res, 0, sizeof(res));
>> -
>> -	res[0].flags = IORESOURCE_MEM;
>> -	res[0].start = pci_resource_start(pci, 0);
>> -	res[0].end = pci_resource_end(pci, 0);
>> -
>> -	res[1].flags = IORESOURCE_IRQ;
>> -	res[1].start = pci->irq;
>> -	res[1].end = pci->irq;
>> +	ret = pci_alloc_irq_vectors(pci, 1, 1, PCI_IRQ_ALL_TYPES);
>> +	if (ret < 0)
>> +		return ret;
>>
>> -	dev_id = ida_alloc(&mipi_i3c_hci_pci_ida, GFP_KERNEL);
>> -	if (dev_id < 0)
>> -		return dev_id;
>> +	pci_set_master(pci);
>>
>> -	hci->pdev = platform_device_alloc("mipi-i3c-hci", dev_id);
>> -	if (!hci->pdev)
>> -		return -ENOMEM;
>> +	hci->base = pcim_iomap_region(pci, 0, pci_name(pci));
>> +	if (IS_ERR(hci->base))
>> +		return PTR_ERR(hci->base);
>>
>> -	hci->pdev->dev.parent = &pci->dev;
>> -	device_set_node(&hci->pdev->dev, dev_fwnode(&pci->dev));
>> +	hci->info = (const struct mipi_i3c_hci_pci_info *)id->driver_data ?: &dflt_info;
>>
>> -	ret = platform_device_add_resources(hci->pdev, res, ARRAY_SIZE(res));
>> +	ret = hci->info->init ? hci->info->init(hci) : 0;
>>  	if (ret)
>> -		goto err;
>> +		return ret;
>>
>> -	hci->info = (const struct mipi_i3c_hci_pci_info *)id->driver_data ?: &dflt_info;
>> -	if (hci->info->init) {
>> -		ret = hci->info->init(hci);
>> -		if (ret)
>> -			goto err;
>> -	}
>> +	pci_set_drvdata(pci, hci);
>>
>> -	ret = platform_device_add(hci->pdev);
>> +	ret = mipi_i3c_hci_pci_add_instances(hci);
>>  	if (ret)
>>  		goto err_exit;
>>
>> -	pci_set_drvdata(pci, hci);
>> -
> 
> Is it simple if
> 
> 	for (int i = 0; i < nr; i++)
> 		platform_device_register_data(hci->pdev, data, ..., i);

mfd is simpler because the cell contains all needed information and
mfd handles removing devices if one device creation fails.

> 
> Generally, mfd is used for difference kind devices. Do you know any exiting
> code use for create multi instance?

There are examples of mfds with multiple instances of the same
kind of device:
	drivers/mfd/88pm860x-core.c	bk_devs[]
	drivers/mfd/da9052-core.c	da9052_subdev_info[]

Don't see any reason why there have to be different kinds of
devices.

> 
> Frank
> 
> 
>>  	return 0;
>>
>>  err_exit:
>>  	if (hci->info->exit)
>>  		hci->info->exit(hci);
>> -err:
>> -	platform_device_put(hci->pdev);
>> -	ida_free(&mipi_i3c_hci_pci_ida, dev_id);
>>  	return ret;
>>  }
>>
>>  static void mipi_i3c_hci_pci_remove(struct pci_dev *pci)
>>  {
>>  	struct mipi_i3c_hci_pci *hci = pci_get_drvdata(pci);
>> -	struct platform_device *pdev = hci->pdev;
>> -	int dev_id = pdev->id;
>>
>>  	if (hci->info->exit)
>>  		hci->info->exit(hci);
>>
>> -	platform_device_unregister(pdev);
>> -	ida_free(&mipi_i3c_hci_pci_ida, dev_id);
>> +	mfd_remove_devices(&pci->dev);
>> +	mipi_i3c_hci_pci_free_ids(hci);
>>  }
>>
>>  static const struct pci_device_id mipi_i3c_hci_pci_devices[] = {
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
