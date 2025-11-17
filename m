Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B49CEACEF
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Nov 2025 17:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=OEZyjcLhPyh0Z8DwiU6M9vCURZ75MU/+4vXIXDLMzIs=; b=OV0azwo8BnHvE0iP5fjpMgLGNY
	hCzTCfRM3ykz1bf22tmnRHAmipa5albiqL/aqco+N+yoHx2jei1GVCxM9nOyfFqQ/C2drtniYC+QF
	oIHtxDeS/1bCb9ByboWUBQspDoM8j0rGUVwy8ymkuMV1B9/xIowRe2vdmY2MFD4Amgj+C/6I2I3o+
	GR+hKGIBgi2pWrTh6y/DxYCv7ohDvxZvQaPaW9ozILOIFBBpIGg39TbvQNwNs5LSEFgnuh80m/uw8
	Gnbyi3Aklwo4qjk/Ed6u3vOiOldOEXJ+dYmLDQE2x2ovhx2wFkCazKMlpAOcCnmDq7SOE0icUaJtI
	2ZeEtTKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL3Jt-0000000GZ1a-3iv3;
	Mon, 17 Nov 2025 17:47:17 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL3Jq-0000000GZ0u-15fY
	for linux-i3c@lists.infradead.org;
	Mon, 17 Nov 2025 17:47:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763401634; x=1794937634;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wINKYvw/BVAoO5AgPDAt+h6Gzw9PHij72yPBzyObqTg=;
  b=fFw89yv4mxM5pJwEslfzRkEgbGOAvMHns6nLlSZ4BWCgzv2y5eTXTiPh
   2CuhL8lN57b/MZas/0rM5AMKxTFH3bMofFcX2UCtfjkw39c9N5v5V0/d8
   FG02RRw6iP1Fu2f3DjysLnnGtUGLCaUCeTSGeMRiGG2Nx84n9nlUjdVuk
   DOpz03yUuJCZcmFTjB5yiWW4MIGEWlIbSfW13JkwfRyk173vwqJefkRyH
   wJj6Xu3+dT7ql5O31c59dKjeZkN2AOwjW42BsTgTNHbN1QK+dbjW9nU29
   oseLknFInedMSpaGaaAqPJ+7RXod43ufnFWYJYZFcUM5z0tWWpn6Z0Bg0
   w==;
X-CSE-ConnectionGUID: JGQkgSeeTV6/5CfNxjv/0g==
X-CSE-MsgGUID: i9QMe3JDTLuOl0qv0muHEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65311173"
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; 
   d="scan'208";a="65311173"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 09:47:12 -0800
X-CSE-ConnectionGUID: 3DpXF0GCQYeUgIzOq+y/Xw==
X-CSE-MsgGUID: 9XIHdPEgR7CyUiNKtGAy4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; 
   d="scan'208";a="194981995"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 09:47:12 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 09:47:11 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 09:47:11 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.31) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 09:47:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QveKgT6PrVyaVid5CcSvNLPX0buxuz9z7oxGKi2dyNnX3tiHsmJcSQEATLzyVn7sLBkQHzQOvem90SosAeYxvuzaYG+3ir7n7ItYUeuWeH2wiLwq3fyITbZgi0BWq+93JGAOHIvPGTDjIj6Sksdhpo+6G+reKQNOALRSxJ5CByFf7c3FQPE/oHRCQAM56/76GfTZVX9z/FYkNRNZCuHrYSBnqnx78u+hgDRCTmVOHmm5d0eu3zEJ4YiLElIoguy7TU/EH2zpBAxH/o0GrHoZ3Lb+3dIYwMBT+bHq0esOnKu1wPhTFiTBocVp2xnLop2DCDT9SDMEDpeiIuX3j43dZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BzMvHnbAP/8orhHDdJ3kKJ5SDI0xYWFMDqZAlyawdoo=;
 b=TCeUQdsbOzWa81IoFWdVaLK6zx8X3lC/oYR97Cyl5N6/PFJGW3Hncj9+kNeGwCCpQgcZLq9q2Xlm+AWJHwisajGiwcxA9obHLYb9Rvoilmwd2Mgx5W36scja9ZcQTpM3sWCciMXpfDvO8PA7p0nz7xC7tiL9tf0qxFM1GJTzAK4HiqHCYSb7YfAHxmZfPT1fwBH78Q0KRvrI59t8mTsc95HAhj2zGnQ60zZ4p2h59THD+YVXUPsKoPdD87pjIp8fQdb4Y0sn4TaFUnuwF3SAxhvanW/Q/WEaM/jv8bi6iD7w6LhsACopUs49enPBLhDLCOlPgPuyG20A5sJLqqQUmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by PH0PR11MB5046.namprd11.prod.outlook.com (2603:10b6:510:3b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Mon, 17 Nov
 2025 17:47:09 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::eeac:69b0:1990:4905]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::eeac:69b0:1990:4905%7]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 17:47:09 +0000
Message-ID: <a5528063-176a-4646-ba0e-19d663b6ff7c@intel.com>
Date: Mon, 17 Nov 2025 19:47:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 12/13] i3c: mipi-i3c-hci-pci: Add LTR support for Intel
 controllers
To: Frank Li <Frank.li@nxp.com>
CC: <alexandre.belloni@bootlin.com>, <linux-i3c@lists.infradead.org>
References: <20251114181356.66515-1-adrian.hunter@intel.com>
 <20251114181356.66515-13-adrian.hunter@intel.com>
 <aReMbhYuSCT5RNnX@lizhi-Precision-Tower-5810>
 <e8d64938-9e9f-4899-bc37-dd78f02adc78@intel.com>
 <aRtGSstGcooM6mCs@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <aRtGSstGcooM6mCs@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: DU2PR04CA0010.eurprd04.prod.outlook.com
 (2603:10a6:10:3b::15) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|PH0PR11MB5046:EE_
X-MS-Office365-Filtering-Correlation-Id: e93eb3c7-7202-4aaf-e061-08de26015479
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QTZyVE1LbHYxd29hMkhjQTN3TWFBY1hsdzRpUDFqUm9VU3NJcnRWYXRpbWtT?=
 =?utf-8?B?ZE9XOGU2a2pDRE9xUjhjRmZhRFZNb0FDZHJkWjFRMXdZdjZCL0dyV3MwWVJI?=
 =?utf-8?B?VnRxQWpkV1g2VThTT1VmbWhuZzdSbDFLYWo3ZHRzUlN4N1k2VE1wR1lXT1pP?=
 =?utf-8?B?a3J1Q1ZZYUZ4ci9LNjJKbG1HOTRLeG9CSVZwQXFmLy9zOHdLMmtMbC82dXcy?=
 =?utf-8?B?NC9LVUR2WHpaTEROK0tFVFg4MTVkbUY1c3F5bU9taDJMMGtQdG5WUGJwWXVZ?=
 =?utf-8?B?b3JIU0FqNkhCZDg1SklxWlBMRlBqZjAzZkxpb0k1Nk9CNDZNTEVQYlB0RXlZ?=
 =?utf-8?B?NkFwcTFzYlh2cjdhb3YyMVZBSnhCWFl5OVI5QmZvc09LR3Y5clFRRmczN29D?=
 =?utf-8?B?NENzdlRqKzFDQTZ3c1BlZXRHaGxWUmwvNnYwWHBNTVNqTTU0TGswZGszYml0?=
 =?utf-8?B?VkMvTE1veHBnSFlNcFJ1MFNwTExKYUhpM3pvZk5YQnppRE5OME0zalVqbEJq?=
 =?utf-8?B?MGZXd2JvZGd1cTFPWFU0b1U0VXdLQUNWdDJjMi9JSWw3Q3lYb2tTTzhEdGxx?=
 =?utf-8?B?bHh2K0lsMG5wVXJsM0dSbEt2bzZoY2d3Wk9NVTgvRkhCdXNnOUdtN1c5WUx1?=
 =?utf-8?B?OWE1R01mdklYVyszd2V2dkxPSzJqRy9CdDBSVHdGUVJGTU42OGhaMlRIWTR1?=
 =?utf-8?B?UFh2eWY5NDRQM3VYZVcwOG8rT0dKcGRwWE8yYW5pOFRTbWV4N252ckV1WDk0?=
 =?utf-8?B?UDNhZCtsbnZjQW1VdGp0NSs5d05yQkhYQklFVzVHUE1mUlJVR3NTczNSRzdX?=
 =?utf-8?B?RUkzdUhmbW9hbGFOQ0V4cUxiNlY1WkowUWpzVWc5QlVSYWJPRjRKSTVuQU12?=
 =?utf-8?B?Z09tRExTQlpiZStUTTZ2d0tSZDZjZHVydVlES0NCRmtmVytkeVJia3M0VHRB?=
 =?utf-8?B?WFpwYWJqbFRYZnJMajh2SG9Gem83M1kvTzVpUzZyL0ZHVHBTTmk0NTRYRFVV?=
 =?utf-8?B?bWRlNGdVK29RcGlXS1hSRTJmVzFPMS9RK2tmVHRvdGxrOUp1Qyszem9zZjhB?=
 =?utf-8?B?ZXFHeEEzakxsQU9ELzNYR29aSUczdEx3dHdhR2JLSThNeFFuVVhJcmdrenFY?=
 =?utf-8?B?UC9GQUNEdjFyS0h2WDJxbGVmVUhlalRBVzQ4TmVKSUNEVVA3bjVIRWlrV3l3?=
 =?utf-8?B?UTVFaWRyTHNwYUU4YUZ4QlBwdzdhai8ycTJtM1FHeGhKTHJHbXQ4Z3YwWW55?=
 =?utf-8?B?T1ZHaXduVmlzQ3NGN25Da0lFSXdIVFdONUc5eHhEazZ1QWU5azJzeFphMnp4?=
 =?utf-8?B?SVJxVFp2Wm9LMmtWYVZPY00rOU1ZUlhLZENZRjluTWdZRWRENncyOHZJYWtY?=
 =?utf-8?B?OXIzZTczWWp0UW5wbGMycjFETmJEd3JoM0x2UE5xa1VmdWVJVHNiM2huU0Q3?=
 =?utf-8?B?NndUMUx4aFcrL0xUOTNoQVc4UERjQ0ZOSGs1RlN6VWtPWUx6a2gzOUthTDBy?=
 =?utf-8?B?UmpNelVYbStaZzNQaDYwa0x2Tm0vWEZWY2xPYTdITHFyYjhoMmFyNHhLM2t2?=
 =?utf-8?B?SlIzWURxYXR3cktxOUNiMzRNNXZhUnlTMDVCYjFQTzZqYWdvT3huWldubUNC?=
 =?utf-8?B?bm1kL1pNcXhSQ0l6bDg2ZFQzQ2ZrT1ZkcndlWmRTR2Q3d1ZhTVRIVUlSekJ6?=
 =?utf-8?B?SlpLVkJUSW94U1c2djZyOWI4N2VFVnM1L015d2hEU0dGajlyQmtnajNWR1hx?=
 =?utf-8?B?M1V5MEhvSzVjQXhoOUNhc1BOTk9Da3REZjU5bjhzZ1FZZCtNTEx3OStkS0Jp?=
 =?utf-8?B?SGNLS3kxbWE0a056dXlIL21RQVo4cGMvYkFzOGlmYWFvQ0lwbnlFMlFBL3pZ?=
 =?utf-8?B?eWtUV2JxY3lkSUMzZklHczBmVGE5R1pLR0xhd2NwQ3N3RmhxZFp6NWNrd3d3?=
 =?utf-8?B?bzUxeDF2VkZyK2JlTGxFUEVxN2NMWnVlYlVJdUxsSzdYczlteG5aa3d4TytF?=
 =?utf-8?B?dlJ3ZS91TFFRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2E3MG15SCtwc3JTNnFTaEM2N3RpalFYb0lTb05kREVkUFJza1dMWkpmN3Iy?=
 =?utf-8?B?SjRUY25ZT2h3a2EyTnIzMGk2VndGOWNPQ2E1K0trYTRzZ0dDeWdzbFJyUFVo?=
 =?utf-8?B?Q3RwOCtuRmg3eDg4dVFpNnBoZlhieHNSZm9LZTI4c3JuZ1VRVDB5ZnFRNVNr?=
 =?utf-8?B?dm5KUDlTN1FnUU51L1c4TVdKU0g2YVZZNWlxVTl2SzE1dnlYczQrazNrNWxD?=
 =?utf-8?B?cXV1V1VneDM3K05uRkUxVjQvb0VBK0JxRlB6RmxveVluOXhwb05LZlFKd3k2?=
 =?utf-8?B?bllqdjhCb01rNTA4RnRuNmsrQTUwOHVtMGQ2V3pzZDl3S3grOWdQeEF5REl1?=
 =?utf-8?B?Y1A5Q2pITDU4VGlocGM2T0ZlRVBNUGdxbUZISG8zc1NVclpFSFROV1BhTmVG?=
 =?utf-8?B?WHoySGxJNHlLb3FGTUhwVWs2VVg2SDg4WHNtQUJhcUtXZkVxcnptUkhMVysw?=
 =?utf-8?B?algybmpVMWdIMVNuY0VaUSsyTFlHWHdXSW1YK09vN29EdDA3Q3pJcDV6cEl1?=
 =?utf-8?B?dkd3R2R0NVVVTlpJQXg4bVNwaWpqVFVlUnhNbzhIQklOU3lkTTY0cXF5YUNa?=
 =?utf-8?B?ckhUUHZ3MitNQ0h6TnBDNElhWW51MkkwZHZrS3JTRlgyY1ZuY21iSkRoYktO?=
 =?utf-8?B?Z05OYWQrWTdFL3BZQWhWZnhtQXV3d29wSHNqRXN2MHhjUmpTZllJbm1WcjEy?=
 =?utf-8?B?WGNuZDcwM3V1NVNMenhSNGF1dXV1OHZ6cFV4YlIzaW5xc1lWNWhXZnVsL1pT?=
 =?utf-8?B?ajZDclZrQnlZTkZOMnNYYm9DNUxIZFFaVDIvNnJ4SUt1OUhONzZNdWRNNlpR?=
 =?utf-8?B?ZVJ2Q0lxZDcxaTBQOEJKbThIcXJsUzFqTUpOTmx6MHZHL3dSd3FtcWdhcjZE?=
 =?utf-8?B?dFRkRFVuTVNwWDlhU0ZpQXFCMnIxVkplc0lGNm9zZ1pFdXpUbDFJKzRzeGdn?=
 =?utf-8?B?R0lOQVRWOXNLMnAyVndKVmw3RUZxeExoOTRiamZpZGl1dVhmd3VPMXRQenRi?=
 =?utf-8?B?cUxHT3RzcnpGN0M4bVJVZnNuZ3Nic0srOFVITm9jSTJuTFBOZC9pQnU4aWVr?=
 =?utf-8?B?eUszWHhmOW5OZWgyOFFpT3FFYnFodlgrV3Q5bVNJNHBTT0srL0VqQlltMGJr?=
 =?utf-8?B?Sk50TGJpTHMyM1E4VGZxRWJMWTFUeWtETVNncWd2WTBwb1RkOCtreThVZTEx?=
 =?utf-8?B?c2Y5UXh6WjZkK3g0Zit3U0V3Zk1KSjF1c290S3pmVnNBK2h1cHRXYTA3cmFW?=
 =?utf-8?B?MTgwNjBOYzVZbkdZSVMyWWgxZGdvZzVndFFjNW40TmRPVHFXVjdubTZpSENR?=
 =?utf-8?B?R2ZyUXpmc3BhbU8xZnpHeUxKdWpuRlpOUTM2eXA4T0hHNHcxVVZvSS9sZDdC?=
 =?utf-8?B?a2I1aEVaTWFWem42dDNTSlVseSthOGYzc2lWaGtLb0hGSFRaWW0vYW0xUVJD?=
 =?utf-8?B?Z0NXc1pZMGVVRXN2UnMyU0c0UExlVjN6Mi9QYXg2d1FDcFhjTEtLK3YzMXM5?=
 =?utf-8?B?OXErSk1TLzJETVhTLys0RkFiU1UzUkdNZThndnZWZlhCbm1pdVc4MitGVkRu?=
 =?utf-8?B?Mi9CcCtySnArZnREaVVHa3ErS0VxNFdyQmI1VWtEWkM5Y29pclZ6YUw4M2Rj?=
 =?utf-8?B?RkJZdHRsbXgyZU1GYUhWRXRVZmFnNTBmQ0wyVHVhdEFwTFJIWlRta0paZDZm?=
 =?utf-8?B?QVVzRXdzNkJONDQvRzRzb2F4K0Zac1M5bmt0Qm9IUWN1VjhxOXM1OERXd0RL?=
 =?utf-8?B?MXZ1L3B5cHdmSDc5ejJzeWdBT3NkeWdrbkNTQlI3bTY1UWpVZERvSThVUnI1?=
 =?utf-8?B?VFZHS2syL2tJQVdQU2dsOStBNUVSUXM0MGlVanZHWDhuQzV3eVZnNHdndkFO?=
 =?utf-8?B?QjdsN0lCaFVzMlRzREp5VWgxVjNxemJWTXRVd05ZRGk4clBPWGkwLzVZdFg0?=
 =?utf-8?B?Rm1RWnNLcjc4WXRHQkJrOWc3eEt0RE9GTXJ5UjJpMFhWbk9VUk5FQnQyOWI1?=
 =?utf-8?B?cERSRHU0OCtWYnE5dURVZExqTlVMNTFONW1sSExwSjZRSzRLay9NYWtLRmJz?=
 =?utf-8?B?QVFyeEZtZUY4S3AxaFAzNGNVRVdmWUs2d0pQdmtkNDFhUXhLY2NZeFVNdmhT?=
 =?utf-8?B?Z3o1ZS9CdGJ6bzJ5RTdZOVRGVVVsMG0vTWZjRlg2azZWUWQ4b0E1eGRyTXhF?=
 =?utf-8?B?Tmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e93eb3c7-7202-4aaf-e061-08de26015479
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 17:47:09.0082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: El+3faRzVeKX/0Ab2lg4j3ZjT2rGhw2bTo79ruWHXxyt2HORxSDky+ALnGk5liKQHoBkorqFe+sqDfpdeCt0tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5046
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_094714_347672_8677332D 
X-CRM114-Status: GOOD (  18.03  )
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

On 17/11/2025 17:59, Frank Li wrote:
> On Mon, Nov 17, 2025 at 01:36:36PM +0200, Adrian Hunter wrote:
>> On 14/11/2025 22:09, Frank Li wrote:
>>> On Fri, Nov 14, 2025 at 08:13:55PM +0200, Adrian Hunter wrote:
>>>> Add support for Latency Tolerance Reporting (LTR) for Intel controllers.
>>>>
>>>> Implement PM ->set_latency_tolerance() callback to set LTR register values.
>>>> Also expose LTR register values via debugfs.
>>>>
>>>> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
>>>> ---
>>>>
>>>>
>>>> Changes in V2:
>>>>
>>>> 	Make use of FIELD_PREP()
>>>> 	Improve handling of values that exceed the maximum
>>>>
>>>>
>>>>  .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    | 125 ++++++++++++++++++
>>>>  1 file changed, 125 insertions(+)
>>>>
>>> ...
>>>> +static void intel_ltr_expose(struct device *dev)
>>>> +{
>>>> +	dev->power.set_latency_tolerance = intel_ltr_set;
>>>> +	dev_pm_qos_expose_latency_tolerance(dev);
>>>> +}
>>>> +
>>>> +static void intel_ltr_hide(struct device *dev)
>>>> +{
>>>> +	dev_pm_qos_hide_latency_tolerance(dev);
>>>> +	dev->power.set_latency_tolerance = NULL;
>>>> +}
>>>> +
>>>> +static struct dentry *intel_actualize_debugfs_root(bool add)
>>>> +{
>>>> +	static struct dentry *debugfs_root;
>>>> +	static DEFINE_MUTEX(lock);
>>>> +	static int ref_cnt;
>>>> +
>>>> +	guard(mutex)(&lock);
>>>> +
>>>> +	ref_cnt += add ? 1 : -1;
>>>> +
>>>> +	if (ref_cnt) {
>>>> +		if (IS_ERR_OR_NULL(debugfs_root))
>>>> +			debugfs_root = debugfs_create_dir("intel_i3c", NULL);
>>>
>>> I think it'd better to create common "i3c" debugfs root. So your device
>>> use debugfs_create_dir(dev_name(&hci->pci->dev), ...) under this common
>>> root.
>>
>> The debugfs files are being created for the PCI device to contain PCI
>> LTR information.  The i3c module has nothing to do with that.
>>
>> Also, currently, there is no module dependency between this PCI driver
>> and i3c, but a dependency would be necessary to coordinate the creation
>> and deletion of an 'i3c' debugfs directory.
>>
>> The extra complexity can't be justified.
> 
> Don't post new versin before we close open discussion. I see your post
> patch before this message.

Sorry, but it is late in the release cycle, and it saves time when we
are in different time zones.

> 
> So, I think not necessary to create to root, which cause complex, (need
> lock, and refer counter).

So you are OK with V3?

> 
> Frank
> 
>>
>>>
>>> ...
>>>
>>>> +
>>>>  static const struct mipi_i3c_hci_pci_info intel_info = {
>>>>  	.init = intel_i3c_init,
>>>> +	.exit = intel_exit,
>>>>  };
>>>>
>>>>  static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>>>> --
>>>> 2.51.0
>>>>
>>>>
>>>> --
>>>> linux-i3c mailing list
>>>> linux-i3c@lists.infradead.org
>>>> http://lists.infradead.org/mailman/listinfo/linux-i3c
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
