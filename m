Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 123F9CA5FF3
	for <linux-i3c@archiver.kernel.org>; Mon, 19 Jan 2026 06:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=0LsOmtNjyOOHyKO7NMlk2xyZXamsIerQUefgjs/6nhM=; b=Dmp4Zt4YAMquWnkO7eTeY28yMK
	U+WSwKT4jQq75nINkDAh7dNe6b9ImJvudBW41VS8PJsV5WsdX+tJW5uqgSVHCokouyukE5awImW/J
	ptSzjY9woYXvouO6c03VclO4OPiohnHlrPsbjBsYstDbDl3yeaDMJ5raNvrG7zOOFWUOT9mp73uy8
	aPkRQslRwmLufi+BpYeAjQVJq2EQsR59nz4vNGJqeACROJxbCcjcldkx3IjwRHHNrJ8nFpv9+P1il
	yxGw/a16PKThnODtkFNWkB8VGyLr0QfaVIlIGtA3ty0o8LiZ3IpzOiixRfICSSN5mh2gcMFdCdlS4
	XO2MQp1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhj58-00000001QqY-3MEs;
	Mon, 19 Jan 2026 06:49:46 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhj55-00000001Qq4-23Ne
	for linux-i3c@lists.infradead.org;
	Mon, 19 Jan 2026 06:49:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768805384; x=1800341384;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=My21wgPxZulc9IbjAQqfIUsugfFytvoZhh4bFv74vpg=;
  b=jdAQKwqS4vkjf/yXbH8yNuxPqflWCadca429g5U+Oj1TXPAzotaZTbeL
   1ujq5dRnlKxAQdm+vTwqVMAbp8whAOfToQhNYzuzuQj7FbPmTrz4kaqEB
   1Vury6ZRD6J81YEUVHFco5IYeA3c2cX1NlO05LOPHeYHKvl/VkZzYgmaB
   KoGkqFvV3WUd+nsSnVqITWvqqYz6a+ue9iSEhmf0BofInYy55Q9NH3+10
   djaquywvDgU0oEUmHaMpYAQIRidAyxFaif54+kmjoHDuRpQdes5eXdgcD
   t8WvO+4/YbYrLGkFpfHpvBnMqyfESNBfef3mM73cVNp3lAjHc/GmXSdo2
   w==;
X-CSE-ConnectionGUID: v3Uychv6RS+BlZ7uZNGAZQ==
X-CSE-MsgGUID: XCAuWvwYT0aBT6mXBO7cgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="73865628"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="73865628"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 22:49:41 -0800
X-CSE-ConnectionGUID: 9fu7HicUT2Ce0f99Z5qceQ==
X-CSE-MsgGUID: 6lwf78YnSwOdW81y1XjCuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="205691781"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 22:49:40 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 18 Jan 2026 22:49:39 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sun, 18 Jan 2026 22:49:39 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.56) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 18 Jan 2026 22:49:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cJOLQ2bMTcn+s2FQLg/vm66lB34xBwXXICiXZTVGOsRxZitTsGCaiOowT+eL1vlKNbXvTH55ij4iEJ663eaBymE6gL9rLf9UOsMJY5aTswdrYXYrJRxYSIavbGtjSUjZ0VlvJQEUSO+0rElIHaDxiZtn2SXoivIH8JgfFzZ+oGfq0SZM/aDcRdexNvSDOTr4p4ng8xwo8STKSPj+glyNrKMf1albUSxYagq9BDyO7bX0v/i0e6TZJ3LVzgJnB8orjWxOXHxk5KQ0E2Xx0TGlwGDMt6PYDRo2rlp0a1hrgYUICmvYfXK7wi89WBv9uQnOM/l/NsoQRWKs8S5WanbtGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QvRxF2moXZSYOVwuzBtJ3iDGO0Ww5SYLs68jIOKtekY=;
 b=vTY7EtIojqq/UhsjbHAojIx/hnetLDEeEDC4fsSBkivt+4sYGpl3bCwAC8KIwof3VuD9VjDRSeLsuvqPtVPA6vnHpnXM0gOcGbbGWygsvEz3+QKZC9kosoRdvqYS4a9jP9PYxsmicc2nKe/+o7rApOcf/X5zZA1//wNvE0BciTOakb41SZcQEPgCRtn9frn7FOH1D/tMxk6ldVsgLhYChhk+mFRDtwtZlqaAaNFpXC3qY2JR48RwWeHm17nzO0sXRpBrn0Ki0rqcsnh5bjPeB9FEqxQ/xzDJKROz3lOc1iivtchnJU+Lv6i3FjLWSDqN/wYG5PuhwTTryLKtU8KfGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by PH3PPF5AF05F6D9.namprd11.prod.outlook.com (2603:10b6:518:1::d24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 06:49:37 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9520.010; Mon, 19 Jan 2026
 06:49:37 +0000
Message-ID: <3fa52ab5-a1d1-4ca0-ace0-efdb0ed9e32c@intel.com>
Date: Mon, 19 Jan 2026 08:49:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] i3c: mipi-i3c-hci: Add optional System Suspend
 support
To: =?UTF-8?Q?David_Nystr=C3=B6m?= <david.nystrom@est.tech>
CC: <alexandre.belloni@bootlin.com>, <Frank.Li@nxp.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, <linux-i3c@lists.infradead.org>
References: <20260116151237.96721-1-adrian.hunter@intel.com>
 <20260116151237.96721-3-adrian.hunter@intel.com>
 <fd311803-94bf-2f24-8941-3285a7358e1c@est.tech>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <fd311803-94bf-2f24-8941-3285a7358e1c@est.tech>
X-ClientProxiedBy: DU7P191CA0012.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:54e::23) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|PH3PPF5AF05F6D9:EE_
X-MS-Office365-Filtering-Correlation-Id: 22837232-36f0-4bdf-d42c-08de5726e973
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RTNydDdUZFlEUzY2azFRQXhpNHVFVDlPM1lDaUdlL0hLMUhOSHNQNDJWb2Fr?=
 =?utf-8?B?UFdWRys4WWlsQ3dZSTNwdngyTmNhbCtQYmNtMFVxamxVWHRHa3lkY3doTm1T?=
 =?utf-8?B?dWtobTFPd3NlUE9MSDg3TVpOSG5UUUZwYVc0bW82cnd3NVp3STZycHFaYzh2?=
 =?utf-8?B?K1hhcnB1QkdxL3hwcHFtTkg2VkRwTWV2MDQ4Ti9ieFhrOG1PWWxZYnZEQW1E?=
 =?utf-8?B?aGJMMituQW9sSEFPZFB6akl4N0ZHMzNpY0NkSFJtQjhiakVjZGxiaTM1eXF3?=
 =?utf-8?B?Zy9FOFlLNW9XeUdYMVJxVmp4c0g3amtrd3lvdllaTCtXRUZmZFgreW41b1Iz?=
 =?utf-8?B?NW5rTFZiaUFmdUxBcWd6Q0lJNDdzS2RuZ3ozbzBJckRlRndDSGtKNEtXUThw?=
 =?utf-8?B?YktFOE5VVzFZYzYvN2t5S1ExbUtYUmVNSUVZQUFzZXFGSkNzK1p1L1NPUnEw?=
 =?utf-8?B?bms4bWlVRlNoVFE4WmxzMVJtZDA3N3ZYR1NUQk9qYkFrYUU5T2RiaTVGbWdi?=
 =?utf-8?B?Rk81QVpJNjFnUENCMnNnZmY3eHhPTVp6dU50dW1QaFVTS29qbXlRTzlBVlF6?=
 =?utf-8?B?V0U3RmZJN2tRQ0xMallpang0UmNvQU1KeWdJZUtWbmxuS2VPZldobDR5U2lt?=
 =?utf-8?B?OWZIeWFCUitkcnR3WWU5dTdTME52TXRIblBqVFM2Yzk0V21wQnI3VzRlUFV3?=
 =?utf-8?B?bXBrWWRuYXIrOHJkcTJSeklrMHAyWjIydlVITStJazFZRHduQmUvSkRjZk5J?=
 =?utf-8?B?ZGlrdkZobStWd1hKYUdqbG81WVpXVGRGZSt3YzdSREREMW9CMFBhMnI5V0JE?=
 =?utf-8?B?S21UcmRUTXEzcXRocVpZdm0wU25EQ2EzTlJYcEVVa3pYUFZDbWRiNUtCWDVn?=
 =?utf-8?B?cVBqMHQzbjdkRGpDRjAweFFsMEp1Y0RIZGkxa29JeVdFeHJ4a1NxRWtzai9J?=
 =?utf-8?B?eWlzQ2gxV2FyTmVSRFQrUDB2YlFobWFXNVVVNDFUODJ4ZTNFN1YrZDdkNEhq?=
 =?utf-8?B?SDNGdWw0eVdFSjRNSGpZSnVKZkpPZHFTbGF2ZWc1OS81VXdUV3FwajlpWHU3?=
 =?utf-8?B?T3NXZlI5MnBCajZXZFkvS3Z1eVlkYzFJV3EwQURrbk41Zk56eEFjLy9QMm9N?=
 =?utf-8?B?aXhYVEN3bnExYXEvWk9ZNjV1enZQY3FuR3BMUi9qRExPWEJpa05CWkY3M1Jt?=
 =?utf-8?B?QmNaQ3VIaVVNU05VRmw5TU5uV1NNU0NTLzhYd2IxY2ZpdTQva1N5aHRsQ0dx?=
 =?utf-8?B?bVRUTlFMVGg2RTg2YzN1RlUxUUpqa1k0aTNaZXU4WnJJcnJDQnAzaEFGL1Zq?=
 =?utf-8?B?cWVEdU53S3Q5NFdCYUxUVlZJaFNvaHBtbDVxVnJlUlZNQUtnM3dWaEIzS3k3?=
 =?utf-8?B?SXgvazNUQjJRTFk1RmNMUjQwMWhuL1BzdEtGNmM5Rk5mMjl4bE84eDU3QWhz?=
 =?utf-8?B?U21wN1V6UGVSdW1hWm00UWtFM1RzMTFyQ1RGcmduSEpJWFFJTnp2R2dyL3Bo?=
 =?utf-8?B?OGdYd29BbmNxWSsrbWV1QmhJUy9zaHZySldPRC9VZ0JqeWtaejl3Tm5hWEsx?=
 =?utf-8?B?Y0F2TXhqV21GYzl2TS9DeUsyUU42T3VHYk9JSURwbmt4OE5zeDJvdUN5ZDUx?=
 =?utf-8?B?OWxhcDYyQzVOanErU1Y4RG53cEFkWVNPN1FxdHlnRjZDbHRqNVJlT3NtOW5q?=
 =?utf-8?B?cnZVSCt0cXVTT3dJbDBwRFZhcmh4eElPQ21GTHpFU2k1MzlXQXJGMmI3cDVR?=
 =?utf-8?B?N0ppaUtWeE9yNnlRMmNLQXMvZFRzVWVXUG9kekI0bUtLbmY3T1RsV2ZtVlpS?=
 =?utf-8?B?SkNoZnQ4eEtxeEd2cWpQNGk5d3U0dmdGcHF6SmREc0RpblhlZGJHZUdWYjN1?=
 =?utf-8?B?bEkxSjNiTUpLcmRkTjlWVVJ5SVU4TFlidTRkSktMTmJMQWR2TC8xRTJ2cnI3?=
 =?utf-8?B?RTY4UFFhTHNiWnRzTkE4VFNIKzI3MVJUelo2L202VGwzR1RCL0YwamJMUk9N?=
 =?utf-8?B?ZVk2OFlaZlNvVExTRHFnT3lSdHFodWFXdVA3d2xUcEFmQVRlRlJuR3pMM2xl?=
 =?utf-8?B?d2dKYWhEczBmVzJCSm4vN2RiWUhvcm5vZjlHZlB5dDU0SWFYMXNLbjlRMlFn?=
 =?utf-8?Q?MtVI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qm1zN01FOEh3b1hrcC9Tb2lqZVJoR1BDa1hWSTNvU0ZEVktzWlRBSytYOVlR?=
 =?utf-8?B?MThjNVAvR3dVVHpwQXVMRW13VXZRMXJPcjJ3ZTVyeEU2U2RFMUV4Z0dpWXlN?=
 =?utf-8?B?OEtsQTUzU2RlNytWdWs2VEhkQ0RRb3lVaWFBZFdnYTI1L2FFV201R2p4dGFm?=
 =?utf-8?B?N3N2SXZKM0FJenpMY1BMaGtFTmRrRjV5QVR6Ui9OTUlzNVpkVlhBUytKczVw?=
 =?utf-8?B?d3hpNU5Gbm10QTZDRWNzU0QrRnBTT3ROblRpZzArN2YvWUEzdVFHMndWQy9a?=
 =?utf-8?B?eTAwa2puM0pTVHkrNVNaVm8xWG0rUE5WRzJGT0FtS3dPWHRkOCsrVGFLK1M1?=
 =?utf-8?B?VDMyWElmbkdVY2RGT2VkOXVwL1JmQnJEeXRQYURvYldXQjNmZEVtTUNtMDdW?=
 =?utf-8?B?L2JMM3Q2OVp0aE1jK29GVUZGc1pXREV6OTNEd1NQTTF5QzVDUHJudGhnSVFG?=
 =?utf-8?B?ZmRldkswampZakF5OVhYZzBZVU5INkhQL0hIVFhxbnlvSnFzbTVSeFBnQU4z?=
 =?utf-8?B?Sys1cGVWdjVMTTlOREFiT3liZFR2S3hGM2FqYkFJY1BTUUZVcXY5N3h5T1FE?=
 =?utf-8?B?eTBiN201eURheDdPU1RJZ1ZIenhVYmRBQm4wSkVsOW1mNjl4c3E0YVJTOXdB?=
 =?utf-8?B?ZDNiUVpYV3dMUGxPVVp3RHF5clJJNmpHbnFiNGVSdVBiT1hoQXpzVEc2V0Rm?=
 =?utf-8?B?eldvZDUrK3ZGQlVtMkl5MUoyOXowdnpRV2xaNFZNMDdBbkVKUmtTUjZDZnl3?=
 =?utf-8?B?WUo1aWh0YUlBVEpUNWwvYkFSSERsaFhiQ1YyNHJWZG9rRktuaHA0SnRKcWE0?=
 =?utf-8?B?L240YnhycWdzbFBMeGJFcVhIMHl6ZWRlY041Nk9jTjhKeDBWeFgrUUJBTTNy?=
 =?utf-8?B?R1dpSlViVDJsVVgrOHVPd0c5dDRyUU5SR3Ava3ZNZTlLR1gwVng4cmtKQzRF?=
 =?utf-8?B?RURDSXNONlF1WXFMSGNHNytKMTRMYkw3YThQcmJ2bjgwM3R0eCsxamV1QmYv?=
 =?utf-8?B?YklRM3dLam5UUVV0dm1NdE5GQUJXZGY4OHllWjhvSG54bjZaUUVITlNWSDl5?=
 =?utf-8?B?NEwvZXdOZjcrd0lmRDNnbUlUSkxZVmhxaDEyOEtrbmJzK2hvdDQ0UnhMdGNH?=
 =?utf-8?B?aEh6dysrR1BPdVRrOGZ6WVVoYlFEUWxLZWtFVzlkaHA3SENRV1dNemJjamt4?=
 =?utf-8?B?LzI2NTF3cjBGbTl5Z2IxRmZRNm05UWdDNmFZTEJlaVRFSVUwdnl2NXg0Vyty?=
 =?utf-8?B?M0FldW5seHdZNzN6Ymh0RGZER0llcE0wanp2cXdkbU83dWtRenVpM1cwcEZS?=
 =?utf-8?B?MWh0WG5yK0Y3aTNBOTIrS1JleG5GQWdEUld6aE1sZEFqYXh2dlRaTkM1SUoy?=
 =?utf-8?B?eFJ1RWoxNGZ0TjdEWEVYYjlTM2M4cHdwd1FRekNSdDc5cGRzbTRyVE1RV0lC?=
 =?utf-8?B?NWVnOXFCOGRwUDJoZDBVeHpNU0xYQXAvWDVqd1lZNTY2dWJpMkNObXcxaGg5?=
 =?utf-8?B?ZDZNditvQkg5VVBIeUZndStaOWVqcE1tcWQzbTBEOVovSndaeXMvU1AvZ01m?=
 =?utf-8?B?dmZiQ004YTZaLzJtM2tDb204N2p2bWRxUXJkbytRcWpwNkNjRTljdmtESzh3?=
 =?utf-8?B?OTgxRFZja3dhbzVuRUtrK2EzekVZekQzL2Z3RG5BK1d2d2xtbUtEbG1ISXVZ?=
 =?utf-8?B?bFpnSWFZVW95N2RERXM0NjFiaC9uUUtiZnBmSURGbGtVbTNCZTdiV0RKc3J0?=
 =?utf-8?B?Q2ltbkczNFJUckxrdXFKNHFkd1RIOENyQlhFR1RVV3A0a0tEWEkySzBlQno4?=
 =?utf-8?B?MWdQWS9FM3RGQW14VEVrbm1Lcmh4am1XN3Awd0h1OHFoWURBQlB2ZExoUFJp?=
 =?utf-8?B?QnA2cVkyR2JmeFIxSXZrc2ZIZ0hwWlY0YnZTQ1FqTGVvaW9RdkZlSFlGSmN2?=
 =?utf-8?B?eitsSWVKOVJTOFdzcnJ2QlBEc3BEUXFsVEhodjdiRGtYWlh3VC9udnR3NCtw?=
 =?utf-8?B?cnJUeW1ybU1sYkZKcGZ6MkwvWElTSllTK0lRS2Z2L0w5MVE3ZUZDRGtTems3?=
 =?utf-8?B?K3hhaitjRG9EaVRFdi9SMlpXUU56bXVWSWpURUxSazlrZWJ1dlV5WndaMnBU?=
 =?utf-8?B?QWVKeFVCTFJEaXJLRVZoWXRHcy9QdW5EQWJxS3kxRGZrdGhtdkpQRUxxQ0ow?=
 =?utf-8?B?bjgybTVnMlhST2ZabnhuaFhoOVRmNHlsdUVBOUVhUUNXVFpQMXN5c2VZRmR3?=
 =?utf-8?B?ZDV0UUFoQTRCUTZXSTdPdFExTkpOTmFnMHVsb3N1RGR0dUthVy9UOE0vbXha?=
 =?utf-8?B?M3FBdEFjOHBlcXh2L3pKaDhHMDBQRzloakRhbUNHbjIrSmk2VUo4UT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 22837232-36f0-4bdf-d42c-08de5726e973
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 06:49:37.2562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pxAi8c5uLfKpRBpfLAoUNffCcBdxXBqUxpCV4e3gNtq61/zX7924JNVw9FrYgPf1LL9tqErMXhOpM5dFRZj5ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF5AF05F6D9
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_224943_606440_D68E72C3 
X-CRM114-Status: GOOD (  17.05  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

T24gMTkvMDEvMjAyNiAwODozMSwgRGF2aWQgTnlzdHLDtm0gd3JvdGU6Cj4gCj4gCj4gT24gRnJp
LCAxNiBKYW4gMjAyNiwgQWRyaWFuIEh1bnRlciB3cm90ZToKPiAKPj4gQWRkIHN5c3RlbSBzdXNw
ZW5kIGNhbGxiYWNrcy7CoCBJbXBsZW1lbnQgdGhlbSBieSBmb3JjaW5nIHJ1bnRpbWUgUE0uCj4+
IENvbnNlcXVlbnRseSBiYWlsIG91dCBpZiBSdW50aW1lIFBNIGlzIG5vdCBhbGxvd2VkLgo+Pgo+
PiBPbiByZXN1bWUgZnJvbSBTeXN0ZW0gU3VzcGVuZCAoc3VzcGVuZCB0byBSQU0pLCByZXJ1biBE
eW5hbWljIEFkZHJlc3MKPj4gQXNzaWdubWVudCB0byByZXN0b3JlIGFkZHJlc3NlcyBmb3IgZGV2
aWNlcyB0aGF0IG1heSBoYXZlIGxvc3QgcG93ZXIuCj4+Cj4+IE9uIHJlc3VtZSBmcm9tIFN5c3Rl
bSBIaWJlcm5hdGlvbiAoc3VzcGVuZCB0byBkaXNrKSwgdXNlIHRoZSBuZXcKPj4gaTNjX21hc3Rl
cl9yZXN0b3JlX2RhYSgpIGhlbHBlciB3aGljaCBhZGRpdGlvbmFsbHkgaGFuZGxlcyB0aGUgY2Fz
ZSB3aGVyZQo+PiBkZXZpY2VzIGFyZSBhc3NpZ25lZCBkaWZmZXJlbnQgZHluYW1pYyBhZGRyZXNz
ZXMgYWZ0ZXIgYSBoaWJlcm5hdGlvbiBib290Lgo+IAo+IFdoeSBkbyB5b3UgbWFrZSB0aGlzIGRp
c3RpbmN0aW9uID8KPiBSU1REQUErREFBIGR1cmluZyBib290IGlzIG1vdGl2YXRlZCBieSB0aGF0
IHVib290IG1pZ2h0IGhhdmUgYXNzaWduZWQgYWRkcmVzc2VzLgo+IFdoeSB3b3VsZCB3ZSBuZWVk
IHRvIGJlaGF2ZSBkaWZmZXJlbnRseSBpbiBzdXNwZW5kIGFuZCBzdXNwZW5kLXRvLWRpc2s/CgpC
ZWNhdXNlLCBpbiB0aGUgY2FzZSBvZiBzdXNwZW5kLXRvLWRpc2ssIHRoZXJlIGlzIGEgY29tcGxl
dGUKYm9vdCBwcm9jZXNzIGluIGJldHdlZW4uCgo+IEl0cyBmYWlyIHRvIGFzc3VtZSB0aGF0IEkz
QyBkZXZpY2VzIG1pZ2h0IGhhdmUgYmVlbiBwb3dlcmVkIG9mZiBpbiBzdXNwZW5kIHRvbywgcmln
aHQgPwoKSGliZXJuYXRpb24gaXMgcXVpdGUgZGlmZmVyZW50LiAgQnJpZWZseToKCkVudHJ5Cglv
cHMtPmZyZWV6ZQoJY3JlYXRlIGltYWdlCglvcHMtPnRoYXcKCXdyaXRlIGltYWdlCglvcHMtPnBv
d2Vyb2ZmCgpFeGl0Cglib290CQkJPC0gYWRkcmVzcyBhc3NpZ25tZW50IG5vdCBndWFyYW50ZWVk
IHRvIGJlIHRoZSBzYW1lIGFzIHByZXZpb3VzIGJvb3QKCW9wcy0+ZnJlZXplCglyZXN0b3JlIGlt
YWdlCglvcHMtPnJlc3RvcmUJCTwtIGRlYWwgd2l0aCBJM0MgZGV2aWNlcyB0aGF0IG1heSBoYXZl
IGRpZmZlcmVudCBhZGRyZXNzZXMKCj4gCj4+IFNpZ25lZC1vZmYtYnk6IEFkcmlhbiBIdW50ZXIg
PGFkcmlhbi5odW50ZXJAaW50ZWwuY29tPgo+PiAtLS0KPj4gZHJpdmVycy9pM2MvbWFzdGVyL21p
cGktaTNjLWhjaS9jb3JlLmMgfCA1MyArKysrKysrKysrKysrKysrKysrKysrKysrKwo+PiAxIGZp
bGUgY2hhbmdlZCwgNTMgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9p
M2MvbWFzdGVyL21pcGktaTNjLWhjaS9jb3JlLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvbWlwaS1p
M2MtaGNpL2NvcmUuYwo+PiBpbmRleCAwMmM1YTEzM2UzMjkuLmI5NzJkOGJjODFlNiAxMDA2NDQK
Pj4gLS0tIGEvZHJpdmVycy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9jb3JlLmMKPj4gKysrIGIv
ZHJpdmVycy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9jb3JlLmMKPj4gQEAgLTc2OSw2ICs3Njks
NTMgQEAgc3RhdGljIGludCBpM2NfaGNpX3J1bnRpbWVfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRl
dikKPj4gwqDCoMKgwqByZXR1cm4gMDsKPj4gfQo+Pgo+PiArc3RhdGljIGludCBpM2NfaGNpX3N1
c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQo+PiArewo+PiArwqDCoMKgIHN0cnVjdCBpM2NfaGNp
ICpoY2kgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKPj4gKwo+PiArwqDCoMKgIGlmICghKGhjaS0+
cXVpcmtzICYgSENJX1FVSVJLX1JQTV9BTExPV0VEKSkKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVy
biAwOwo+PiArCj4+ICvCoMKgwqAgcmV0dXJuIHBtX3J1bnRpbWVfZm9yY2Vfc3VzcGVuZChkZXYp
Owo+PiArfQo+PiArCj4+ICtzdGF0aWMgaW50IGkzY19oY2lfcmVzdW1lX2NvbW1vbihzdHJ1Y3Qg
ZGV2aWNlICpkZXYsIGJvb2wgcmVzdG9yZSkKPj4gK3sKPj4gK8KgwqDCoCBzdHJ1Y3QgaTNjX2hj
aSAqaGNpID0gZGV2X2dldF9kcnZkYXRhKGRldik7Cj4+ICvCoMKgwqAgaW50IHJldDsKPj4gKwo+
PiArwqDCoMKgIGlmICghKGhjaS0+cXVpcmtzICYgSENJX1FVSVJLX1JQTV9BTExPV0VEKSkKPj4g
K8KgwqDCoMKgwqDCoMKgIHJldHVybiAwOwo+PiArCj4+ICvCoMKgwqAgcmV0ID0gcG1fcnVudGlt
ZV9mb3JjZV9yZXN1bWUoZGV2KTsKPj4gK8KgwqDCoCBpZiAocmV0KQo+PiArwqDCoMKgwqDCoMKg
wqAgcmV0dXJuIHJldDsKPj4gKwo+PiArwqDCoMKgIGlmIChyZXN0b3JlKQo+PiArwqDCoMKgwqDC
oMKgwqAgcmV0ID0gaTNjX21hc3Rlcl9yZXN0b3JlX2RhYSgmaGNpLT5tYXN0ZXIpOwo+PiArwqDC
oMKgIGVsc2UKPj4gK8KgwqDCoMKgwqDCoMKgIHJldCA9IGkzY19tYXN0ZXJfZG9fZGFhKCZoY2kt
Pm1hc3Rlcik7Cj4+ICsKPj4gK8KgwqDCoCBpZiAocmV0KQo+PiArwqDCoMKgwqDCoMKgwqAgZGV2
X2VycihkZXYsICJEeW5hbWljIEFkZHJlc3MgQXNzaWdubWVudCBmYWlsZWQgb24gcmVzdW1lLCBl
cnJvciAlZFxuIiwgcmV0KTsKPj4gKwo+PiArwqDCoMKgIC8qCj4+ICvCoMKgwqDCoCAqIEkzQyBk
ZXZpY2VzIG1heSBoYXZlIHJldGFpbmVkIHRoZWlyIGR5bmFtaWMgYWRkcmVzcyBhbnl3YXkuIERv
IG5vdAo+PiArwqDCoMKgwqAgKiBmYWlsIHRoZSByZXN1bWUgYmVjYXVzZSBvZiBEQUEgZXJyb3Iu
Cj4+ICvCoMKgwqDCoCAqLwo+PiArwqDCoMKgIHJldHVybiAwOwo+PiArfQo+PiArCj4+ICtzdGF0
aWMgaW50IGkzY19oY2lfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikKPj4gK3sKPj4gK8KgwqDC
oCByZXR1cm4gaTNjX2hjaV9yZXN1bWVfY29tbW9uKGRldiwgZmFsc2UpOwo+PiArfQo+PiArCj4+
ICtzdGF0aWMgaW50IGkzY19oY2lfcmVzdG9yZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4+ICt7Cj4+
ICvCoMKgwqAgcmV0dXJuIGkzY19oY2lfcmVzdW1lX2NvbW1vbihkZXYsIHRydWUpOwo+PiArfQo+
PiArCj4+ICNkZWZpbmUgREVGQVVMVF9BVVRPU1VTUEVORF9ERUxBWV9NUyAxMDAwCj4+Cj4+IHN0
YXRpYyB2b2lkIGkzY19oY2lfcnBtX2VuYWJsZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4+IEBAIC05
NDUsNiArOTkyLDEyIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlX2lkIGkz
Y19oY2lfZHJpdmVyX2lkc1tdID0gewo+PiBNT0RVTEVfREVWSUNFX1RBQkxFKHBsYXRmb3JtLCBp
M2NfaGNpX2RyaXZlcl9pZHMpOwo+Pgo+PiBzdGF0aWMgY29uc3Qgc3RydWN0IGRldl9wbV9vcHMg
aTNjX2hjaV9wbV9vcHMgPSB7Cj4+ICvCoMKgwqAgLnN1c3BlbmTCoCA9IHBtX3NsZWVwX3B0cihp
M2NfaGNpX3N1c3BlbmQpLAo+PiArwqDCoMKgIC5yZXN1bWXCoMKgID0gcG1fc2xlZXBfcHRyKGkz
Y19oY2lfcmVzdW1lKSwKPj4gK8KgwqDCoCAuZnJlZXplwqDCoCA9IHBtX3NsZWVwX3B0cihpM2Nf
aGNpX3N1c3BlbmQpLAo+PiArwqDCoMKgIC50aGF3wqDCoMKgwqAgPSBwbV9zbGVlcF9wdHIoaTNj
X2hjaV9yZXN1bWUpLAo+PiArwqDCoMKgIC5wb3dlcm9mZiA9IHBtX3NsZWVwX3B0cihpM2NfaGNp
X3N1c3BlbmQpLAo+PiArwqDCoMKgIC5yZXN0b3JlwqAgPSBwbV9zbGVlcF9wdHIoaTNjX2hjaV9y
ZXN0b3JlKSwKPj4gwqDCoMKgwqBSVU5USU1FX1BNX09QUyhpM2NfaGNpX3J1bnRpbWVfc3VzcGVu
ZCwgaTNjX2hjaV9ydW50aW1lX3Jlc3VtZSwgTlVMTCkKPj4gfTsKPj4KPj4gLS3CoAo+PiAyLjUx
LjAKPj4KPj4KPj4gLS3CoAo+PiBsaW51eC1pM2MgbWFpbGluZyBsaXN0Cj4+IGxpbnV4LWkzY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCj4+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtaTNjCj4+CgoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgt
aTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1pM2MK
