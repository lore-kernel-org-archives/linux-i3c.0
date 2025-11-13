Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC43CCD8C9D
	for <linux-i3c@archiver.kernel.org>; Thu, 13 Nov 2025 16:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=flrpS8LhbmSPdGdtmBiMWlv/3Ajn0uJxf4CRVCTL+NU=; b=KhXiY7M06Fw/ZJfwSSWES0uzpe
	U51AaiJiGc4RWyWIi+NrPZkBQqf/Qpn+KDSCjeL2xcJHCI5oY7QqtMUX+6kqeTDW5z8RSFdtDa+br
	wyv7JkTnrs6/e1NYaUE7PKhmK028b0Qy0wFkeXMUFflXp19OHH+0x7aoKB27IbPiFGWRO7WK+5Phr
	fTMhngAR8DCUpiEX5MJyezYIM8wdyrbPhk5STpr9ta9f5P8WDoIqjuZBA7KfTXg9CNFNuQVYeZjol
	RXSc0XjGKEvCB3OWWNl7QlVgy7A5HhrK+S1gEBfbrv1CLmKPrSsQkCz0daz6pgtDVS9TMAyHBzWCc
	K0nQIKOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJadr-0000000ApcO-2lOy;
	Thu, 13 Nov 2025 16:57:51 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJado-0000000Apc5-48X7
	for linux-i3c@lists.infradead.org;
	Thu, 13 Nov 2025 16:57:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763053069; x=1794589069;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Z+UdOn1EUNNu9Mber9ol2AvrbsRk3DzXIR34rbOKeC0=;
  b=GSPRGueDHaTdGej+sUTE4FppTxxxWC03I4JBXd+jUgcMZnHO3VTv/VRC
   q4+O+di03VtggRhqshQxRV5EKdCQRtu/ZvyKgbgd989Vue+le35fwMdTV
   atHqkijP43p4PbpiSKnQIN+Z4bUVcUUZZmDTcBWWd46EmG0cnCevLcLPe
   euiQ7s4D/wt8Ppsgcs5a2qq3nB4fwaZuyptrURLqvr9GgyJ/fXMYa6lTS
   WOoF8YLdwasTFoJl4Hu+w93V143L72Y5zRy1qXh27umH6yxnPpN7QyIsS
   n1ao3EfLRhpboQr4SoI8AVtY8mkFQD3mcPLXMg3hzzuA+68y+Q2RAJhTR
   w==;
X-CSE-ConnectionGUID: soN+Dst9RPeB8mBmbOrnKg==
X-CSE-MsgGUID: 02fjkrnvTtWr5ZjBalNhWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65179491"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="65179491"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 08:57:48 -0800
X-CSE-ConnectionGUID: P9+Nvy9MQ8mfHiRvHqB4MQ==
X-CSE-MsgGUID: hKq0pGELSbSq5PNK2uRnxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="194539115"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 08:57:48 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 08:57:47 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 13 Nov 2025 08:57:47 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.6) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 08:57:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GvQI0UZ1hAp+bZoNNNVZgjAR4DOwDtMHkh2GLyWfOqO6p4Cum+kiblPw2gY3qIwZDqYxUc3S85VOyAr/6tI2H2xAV1a5+OP9W3EiNv5VNDpbw5jR2GO+Tn4q7cAqiM2uwR8co3leP+hzzOsGmcw/PBZC21cGjnHdE4eXNbnLKZajxoIjNFgHThT9ALtJ4K3T7iEXUqGMDZEILE7JG38YyrD23vKSBmhh9df9zh6pwYh1+jnqQx5Tqz/XIxer1tSuTr+m7Cc66zb3pyfrwwXRRvdElWDxixCHn6tW8By9bZCqqHBndb5obt9GvrZWtUbmvlKC3KXKcbzx3g7OLqqcMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IDWvY+MhAxE2X5GDakbnms2TSPWhqcIyC7wG8tpbAG8=;
 b=hTnT1N7Yq59c8D96hGSIA3uenusJjGAB9+4Oa333BImLHun8AQSAhQGnzXTR7z4PUpN5FpgZAn/bfkHhrgts2MgfG/osHlRnjeHIN1xgKmuHKc5aUv/qd7Aee1QVp+jGsgnSEw3hs7owV3hr0wxdUTLekpoCSsTSz4at5x3/mCt1eHni7rTLVQBEa7ot/ZpbKMPcEK6t617NcGjzIam+GrVFjsZtr8lDHg9dk8oEKVIhYfMSV4HdgCiZJcf9Zv15XhebVyU6DLTNFhHSK3kfxHDyNHlmhQ9XcJ7vrLFOIPoTOtYUbCoMvjjz8yUgeG7o0mGt9l8fV4CUkxBdkxlEUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by CH0PR11MB8216.namprd11.prod.outlook.com (2603:10b6:610:192::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 16:57:45 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::eeac:69b0:1990:4905]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::eeac:69b0:1990:4905%7]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 16:57:45 +0000
Message-ID: <f4180f52-31bc-41ae-9ac9-24553099f82c@intel.com>
Date: Thu, 13 Nov 2025 18:57:41 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/13] i3c: mipi-i3c-hci-pci: Rename some Intel-related
 identifiers
To: Frank Li <Frank.li@nxp.com>
CC: <alexandre.belloni@bootlin.com>, <linux-i3c@lists.infradead.org>
References: <20251112100339.51726-1-adrian.hunter@intel.com>
 <20251112100339.51726-4-adrian.hunter@intel.com>
 <aRSuXx00hYqbMzIQ@lizhi-Precision-Tower-5810>
 <ce8fb9c4-53f0-40ec-a296-d8cabef5dfe7@intel.com>
 <aRYE9Lkn5PDLXTXr@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <aRYE9Lkn5PDLXTXr@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: DB9PR06CA0004.eurprd06.prod.outlook.com
 (2603:10a6:10:1db::9) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|CH0PR11MB8216:EE_
X-MS-Office365-Filtering-Correlation-Id: d8826827-68d2-4f82-3452-08de22d5c484
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YnpsWW9ybTRzaGt6SG9MdWp6WTQyUUVpZFJyMTVVekhpK3Y0K3dzQ0RTRi9l?=
 =?utf-8?B?QkxkVkJ1ZUl4MEJtTjlwRlpMVzNyNEJlSk1OaG5HajRwZ05BdXY5VERTVXhF?=
 =?utf-8?B?L3g4dHFBR3JxMjdXQVUrUTlMK25IRDhyNnhqbUpSOERScy9zYzY2eGMrSnor?=
 =?utf-8?B?QllWYjROMFlxWnRKRWdBd01RdG5oTmNvK3ExZ0lzZW1YclFWQk8wZ3AvSW4r?=
 =?utf-8?B?eGFSaUp6M2ZCZ29IVndYd08rUjIrU2hHYmpxNGhVRmpMSTNQSXl2WXh2NFBn?=
 =?utf-8?B?QmYyWE92T3A5NEFhSlRPblBkZDZROVZJQ2dzZWhodEswa1NxdjA1alZpaHNS?=
 =?utf-8?B?M2h1ZlNQdnJiTGNISjlRcnAyM1R3R3pmSXRmVFVrR3lQWnAyVDQ1MFZBczJS?=
 =?utf-8?B?bnBib2FNOTcxc01YQkhWbHFxeUNrRXArVTluSllRTkpyN21HR0tpNVZSL0dq?=
 =?utf-8?B?M01ZZGNwZUtBSkg5Q2JBaExGQ3FpZ3AweXdXMGQvTkdmTkNwWmRlRm1Gakc1?=
 =?utf-8?B?ZHVma2RtdHdubGFORGVzQ0lGQnJFTCtMNDVsQmxoTFd0NjZlRWRxSmZjeFhH?=
 =?utf-8?B?QlQwTkg3WndpK1o2SGQzZ21HcjNJVjBzTGU1MlF1WFhqRFRMODdDVURXNTRT?=
 =?utf-8?B?NDNJQzYyNmIySkhGNU14WlN6OTZ5WkZwa2d3UHNwWUJGQ3RRcXYvT1BBenFQ?=
 =?utf-8?B?b2xhRkZYcGUrTzZwOThFcEY3TmZ5WEpVTDZ2djFRMHVYaFMrVXB1N0lRVHJ2?=
 =?utf-8?B?c3NIRkExQlBXOGRmYTVSTUYrRG5wSmxTYlRKSHlyV1dMaEkxMGFiL0Z1R1c2?=
 =?utf-8?B?aUduZkJPM2UycldPV3M3L1phbUtaYWVvUks1bXBIK2gzT3MvZ0ZQcXRXMTRL?=
 =?utf-8?B?NUFtY0VyV1JmNkpDU29IY01vMkUwQXVZZTNQYjhhc0o5cmZ5TzB5b0QxdFdu?=
 =?utf-8?B?WVV1MDhLVkRuVG9DWmVSN1FiOXZ2RXpBRFNQRkpRY1J2d2R3OUQ0ZzJWUndS?=
 =?utf-8?B?L2h5eFdJNUxKOWFnQkI1N0N4N3pWaXREUU1OU00yRTJHdUJWQXFxUldXaGNI?=
 =?utf-8?B?bUhlc3gwTVNlUlV4UlJyQWkycUk4bE1SN01FRlZxbnhZS1NqYmQ2K1BRMmxG?=
 =?utf-8?B?bHdaaUc1NkZKeFVyeTF3V1ZnZjRSeHYvSjc3MjhTZTRuc2NpMFJiSmxiSHBW?=
 =?utf-8?B?NXJQVVIrMEZvNERJeGZGbkx2UXdmSjJEK3VlRVFmRFByUnhkRHlTTHVIUUVT?=
 =?utf-8?B?UldTUnR5Z2RyMGRhblNzSmppUit4d3dLZml3aTY3Rk5Ea0lQcW1FbzY3YURr?=
 =?utf-8?B?YytGNW9CRG1wT2VvTE8vaEZnUWpqdFdpQzY3c2pMQ2lEWGVCN0tpbll6THU3?=
 =?utf-8?B?UFlUOHg1eHpEMWZNTURvbVlobE9PRkRUTDhyeC83VjEycTM0Wm93M1N1VTEw?=
 =?utf-8?B?TTJ1bTVjL21CdVZYbXVHWkg4OHdZZlVSTzJYSW5jYXB3SWxaN0tSV3p4dnpZ?=
 =?utf-8?B?a0JqWWN2NnZic3BCUDNjRG9MMVc0MWM1SmtwNTMwcnY4UTRJOGlTcE5HRk1m?=
 =?utf-8?B?elRXUGd4MGhkVXp5YnZhck5wNktqWEVzM0xBeDZtN3hsMitLaFBiQzh4WDMx?=
 =?utf-8?B?T2grMkJIUjZTakV6WmIwNXpXTDQ0bWRodVdXNndVK3hrdUZzRXBWb2J3WWsz?=
 =?utf-8?B?dkx5RVBJMGVWSm96c2xVQ2svajlGeSs2NzdzVEtLckswNmsyTXNmZ1hyR1Nh?=
 =?utf-8?B?YTdPVm9XUkhrOEZRVUc4dEk0a2xrTDJId2xMQ01FSm92YUljWi9oVkRma1lW?=
 =?utf-8?B?MFFuKzVEcWtYSHJwWVA1aVJmd0RtOUZUWFMyU2g4OU1taWdPVE91RERGTU80?=
 =?utf-8?B?bkNrTmdmQnlEUktBelY4MWEvQUQ1RUp6eGt4NG03ZHVZUFV2RUlpQnBsRUU1?=
 =?utf-8?Q?WmOCoNAcArKZhU74sJ1qIBqmJliult+d?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVV1OFh1ejFyU0pHelQrRi92ak0vaGhmVDlnd3dkTEFMOXhWRFdkOWZZcXFQ?=
 =?utf-8?B?TGVWaWszT3h0bytNTnRXbjUzQlN6c0RKNU1oMEdkenpCQnNOdjFBVjMxTjNw?=
 =?utf-8?B?VHlZZUNjTTBzeDBhd1lqbGM4azFob3VBRTJEQk9Vb3c1NXNuQ2kvQXdEM2Er?=
 =?utf-8?B?TnkrczBKMkxxcWpBZm5BOVhwSkJ6NTNWaDh6bFJ4SHp6N2d5V0JVTE1lYlBv?=
 =?utf-8?B?RkF5RnhTa2pITmVBSkNwaDhveHRyanRrMFhCMXJKYjBxNkp6amZsWUJsNXc5?=
 =?utf-8?B?R3VZcWVjb21ub256MEZXclNrZ0FCOTIybnJVS0Z2Y2VXUzRBaG9GcGxna2hz?=
 =?utf-8?B?SU0xSVRwbCtVSVM0UU1mSmdhd1lhSjJLZXExY1JjbCtKRmlYcFBQN3dVb283?=
 =?utf-8?B?b1g1TVFLYUxyeUxEak1kL0pRSE1PSE5kbERDejdoRW5jNXV3L3ZiUWFhT1B1?=
 =?utf-8?B?NHVpeGMxbnVaNmNSKzdOaWxERkh1S0Jrd3BnTkFLNVBaVGtrdFBJaTJObGg4?=
 =?utf-8?B?M1ZRc2RCSmpHV0VuMEV1L1puR3RZdVRqRlVtVFdKTDlnTzRYWnFNanlxalM4?=
 =?utf-8?B?U0ZhL01sSzd5VHNXZXd3bjZXa1NnaVVJVTBZeTVTalJXTkNxWk5zWTA4OU9Y?=
 =?utf-8?B?NDVQSm54UFljTklZcjFpSUVyS0RybGRNWnZ3MlNWTlRQWGZ5Zi84aVBSZjdu?=
 =?utf-8?B?OXhzZjdBaFFETTIyK0pMK3EzbDBjSHpSMWwrK0VaeEtIbC9KQ1JLQmhiaGZP?=
 =?utf-8?B?OGRCanZ2NHNxRUZVaFhGNDFtQ0MrWE9uaS9UdHVveGZMMWk3TVJ0UmVkMEI5?=
 =?utf-8?B?RUhXR0cxNFBPTVZFY1VOTXp4TkRxR1JCTm1LZXZsaDFXcktuY2UzTmw3dE9V?=
 =?utf-8?B?NlZvdGNNR1F0UW5WRzRGVjkrWjJ1VnNpTnRsdFJLT2orTHA2emtsVmh2bVMz?=
 =?utf-8?B?bXhkWHNtU3JoQ0c4c1VzNGhPSmt2djVvQlNQOGJvTnVWQ0h0THVFV2NocWds?=
 =?utf-8?B?OVczeENkK214cUZjWENsUzVtUkxsclNLMi9YeXF4SXhJcmlQOUZFOFdxNURQ?=
 =?utf-8?B?T1l5RmVSVXBXeGRUUHI2VEhRbXN5RHl3V0F3SzNQTWpVeEsyVkNIci90TEgz?=
 =?utf-8?B?WCs4TnFvRjNzYjNVQjRuT1VwekRvaWFGWSs0NmlQS1ZLc0tPeHhTNGJoNC9T?=
 =?utf-8?B?eVlNUjAyYzV1Z0FkQjFDNzhuNWUraEFhZ1J3UGNGQ0p6ZXlCb2FVWGh1ZjFU?=
 =?utf-8?B?UGRScHN5aHlaRk84ZzZSY3dhSWNFM1pqNDZXdmY3VkFFOW9MNWJmUjNJTmVX?=
 =?utf-8?B?czdKQUpoUmdWMEw4WjQ0Rktab0lEM0h5ajQxOE9kTE1WK3NEdWxITGM0WW1Z?=
 =?utf-8?B?c01QaHR3Z2RBd2kzUENac2NSZG45SHpYMnZISVB2YXNRR1FoQThPTnVJWFR1?=
 =?utf-8?B?RFUyczFBY3d0eEZtUWUzdEFRcmdyUnc3QTJ4RTFPdmZjMHJXWG5YandUWVhk?=
 =?utf-8?B?cHJ2SHNHZmYrbUhrdkRINjdaUTJyYVJ5YUpySWhOaEIvazI2TFJxVldEN1VP?=
 =?utf-8?B?MFNRTzVJSHJlYjRrdnpWYWZiYlgrS0xZMzN4L1FvV2VkSDJKbDdyc3lBTDNw?=
 =?utf-8?B?V09uQXVVVUkrcVdOY2kvMGpSNEVwajR2QnpLbllQL3JGVS9rWlF3TTVFZDhv?=
 =?utf-8?B?NGNBcUJSN1UxeCt1N1RabVBnNVlRMjVMWG5hbnRLdHJlTU1zSE0xZm5DaGZr?=
 =?utf-8?B?MmhSZWpsRHROWCtyUWFxYUdaQnJyZVhlQUdaQlZhQlgvVDJ2YlU0VEt6NEFB?=
 =?utf-8?B?NXp0Z3ZDNThkZ2xHdVpCbHVyWWVrM08zZHJWdG13dGtYYVQ2emJJRHNQdEVa?=
 =?utf-8?B?YVBiM3kyTUYxNGtyWlk0ZWRWRXh5RUl3aDhWRFJ5NWI5ZDVBdHBraEhGYjFu?=
 =?utf-8?B?QUVxZ1lDNlJzS2NjMG43QnhoM0s5RnVVRWtHREdtcVB6My9NMFk4ZWpwTGxI?=
 =?utf-8?B?dDZJcW4rTWFhaXorR0N0cE41S3RiVDV3NnNRTDAraDVoRkt4Um1hcXJYTndB?=
 =?utf-8?B?ZVI3SFZqaXk0Q1haeTZrTDNTMVV0UnBxRDBOSVpUY2kwdDdxN1pZb05uUHI0?=
 =?utf-8?B?NWtrWGMzUHU0ZEN2M0RCL3gvclp6WU9icFZ2YnVoZUJZdUUxTmJzM3FiRHVi?=
 =?utf-8?B?TEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d8826827-68d2-4f82-3452-08de22d5c484
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 16:57:45.6486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qoBYrxoZNbyzcj/o8OR2J1nDbP/W+EnYpGpmw9mQAbf3hR0bc7pPpwx7t9hwIPE0a80wGGJhhyvWaRamKKq2gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8216
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_085749_355138_EDEFAB90 
X-CRM114-Status: UNSURE (   8.90  )
X-CRM114-Notice: Please train this message.
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

On 13/11/2025 18:19, Frank Li wrote:
> On Thu, Nov 13, 2025 at 03:01:02PM +0200, Adrian Hunter wrote:
>> On 12/11/2025 17:57, Frank Li wrote:
>>> On Wed, Nov 12, 2025 at 12:03:29PM +0200, Adrian Hunter wrote:
>>>> Rename some Intel-related identifiers to ensure Intel-related identifiers
>>>> begin "intel_" or INTEL_, and for brevity.
>>>>
>>>> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
>>>> ---
>>>>  .../i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 18 +++++++++---------
>>>>  1 file changed, 9 insertions(+), 9 deletions(-)
>>>>
>>>> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
>>>> index 617826628dc4..c74cc511a344 100644
>>>> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
>>>> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
>>>> @@ -21,11 +21,11 @@ static DEFINE_IDA(mipi_i3c_hci_pci_ida);
>>>>
>>>>  #define INTEL_PRIV_OFFSET		0x2b0
>>>>  #define INTEL_PRIV_SIZE			0x28
>>>> -#define INTEL_PRIV_RESETS		0x04
>>>> -#define INTEL_PRIV_RESETS_RESET		BIT(0)
>>>> -#define INTEL_PRIV_RESETS_RESET_DONE	BIT(1)
>>>> +#define INTEL_RESETS			0x04
>>>> +#define INTEL_RESETS_RESET		BIT(0)
>>>> +#define INTEL_RESETS_RESET_DONE		BIT(1)
>>>
>>> These are already begin with INTEL.
>>
>> For brevity.  They are long and "PRIV" adds nothing.
> 
> Generally, needn't this type rename unless you need add more registers
> defination later and want to keep consistent.

Patch 12 adds:

#define INTEL_ACTIVELTR			0x0c
#define INTEL_IDLELTR			0x10

#define INTEL_LTR_REQ			BIT(15)
#define INTEL_LTR_SCALE_MASK		GENMASK(11, 10)
#define INTEL_LTR_SCALE_1US		(2 << 10)
#define INTEL_LTR_SCALE_32US		(3 << 10)
#define INTEL_LTR_VALUE_MASK		GENMASK(9, 0)

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
