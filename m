Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF9D1CEACEF
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Nov 2025 19:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=dz3Vu3X3XUvzwqMkXxKAo5cw5oL6ebwrdpynvwIoKAg=; b=bxTFOU4x5J+xOn3I712awWerRn
	wHLoBzj68NAk4UJzH6Ei2fHxTiPr0CDP9y+mR/bJCUyg9WtIYuJZ2e+szJLmOBXtcSk1e+RIwBF12
	GjCUtm9yYffK+jCSHNNRHvFVEmysPMLjaP4d8mShXj0Bsv3lp39Ey/+0Sle5qlxieiaeCS+tscVuT
	YGY2lPU+gsMsZ9IvWNg1Yz9nYieOsfrq3POwig+vuSL8fRCbtSXxIt+vUJzVhI20UkTfXRQb4Wo+g
	Qlncjqn0bLlyXxzXsBbUgeYnizpgG5t/SYwY4Mthq3VJadpSGoSIiXeKflxCiIkd4MF2vZPSZjlAm
	zUpqkHsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4ZH-0000000GhUu-1qVg;
	Mon, 17 Nov 2025 19:07:15 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4ZE-0000000GhUR-3CDV
	for linux-i3c@lists.infradead.org;
	Mon, 17 Nov 2025 19:07:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763406433; x=1794942433;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7z4sxUJu26ooo11Xe86jYFvFcTR4aK2ogCGp3DG1+JY=;
  b=HKUBP9Mo/5k/K4eL6Z4liCwd6Mrdvtu1CJbFOgNZT1StzFO2H4fQz4F+
   BGZQq7R9ElBe2JMWoLC3RPZWj8MoCEb90uwZrYAhiX1ZwOd/Fu5YSipKO
   c/qD/z6ETQJSt2PdOmxYJ7+vr9UxW6bo5jFO+3Tf4SpLiHviYqwYALw5+
   H/aYM5x2b2sOztGb/Awn/kEe3xWfPx1evHytedpeLpv70EHVPj3IEeVCG
   YVRxgkbRlwgnKQqOf/VN8Rzr8W+AEKFVj3ehsJx077qy9DU5vWsexzyhZ
   7+YE+fAvQtXUborn/G+RixiJEjdQU46SQ80JBKNYnIWQf8fbT/TQZ5u+4
   A==;
X-CSE-ConnectionGUID: ciKD3YoPR6GhuaSIs3d0dA==
X-CSE-MsgGUID: /9tdVNLDRRSI2UQgD3G2EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65350155"
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; 
   d="scan'208";a="65350155"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 11:07:12 -0800
X-CSE-ConnectionGUID: 04fEOrAUQmGkA2dZ3Rau2A==
X-CSE-MsgGUID: /KUhJDOiQg6TMLgKYokswQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; 
   d="scan'208";a="195469333"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 11:07:11 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 11:07:11 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 11:07:11 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.58) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 11:07:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N7C07gkp4sJE+w6iA9fKAtcr2IoW1Abwh5Llp4gX5Vtd8Z5H2CXciNKakKvkwu/nnbdA0/Pihcl9jnZ2Q9vN1wIlGJTFxA6yu1xkSc8GhT1Ssk9fIRgr/Ylvr8rG/LhH4p478cTFstKqs2CVw/O6DDSggudGVZpDqdXYvggSmURMnyVbNtXpphsp9UYHdz2waNobpmKup2lsbnngNVGVbJinl9PVR0SQ71Wlk4VHi/ArSc1iQd4CQKiqqQpSMPreUJkUy7ZNnvL2uLqUnfMaHbVoECgdw+pKxU7kPkwCgVFc4xLgBcc09AvtuIfLJwQ8uEnOhASstMTxPmLjFMxFCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LdksZYlBXgnIEhdva8dKoPrmXVM/ohCUlrxOkPNN0KY=;
 b=wNxXIkxJu0NJrMFi8mcmyCB9WAIzi7LZEsad/A9/473SDcJKpmsNLn7hYTSYvkMvMLQ7jlkMhFEub/stfs6W5mxo0nitjCy+ASCb3/f54pBnyS8FSPxFjsBalhZyXYN3QOWpiIANeJC2RwxHmYxlpYAM585bih5zQxnRi7QLCvpVGb0dmGHRC2wWgYmS68jqN9LmZZw4MThTLoFMgfM57oyBu9qbfwNVt9OaNI92GL48wERDFJY8PVGCCRCvsYuEtTNN40ROogdwS4ocIdI3IwDh4X+vFK4yWWBIyF6VTD0ciAxIWaRbeR9Uvm6GQlS1tV7ComPWCc4xuxrC8riCRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by SJ2PR11MB8588.namprd11.prod.outlook.com (2603:10b6:a03:56c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 19:07:08 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::eeac:69b0:1990:4905]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::eeac:69b0:1990:4905%7]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 19:07:08 +0000
Message-ID: <9b060456-cbb9-40d0-b2d0-a52d1f08addb@intel.com>
Date: Mon, 17 Nov 2025 21:07:05 +0200
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
 <a5528063-176a-4646-ba0e-19d663b6ff7c@intel.com>
 <aRthVIuxnJHBEe/a@lizhi-Precision-Tower-5810>
 <387c55f3-1ea7-43e8-aabd-1ff320a99eae@intel.com>
 <aRtv9G3tD5D7EcjP@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <aRtv9G3tD5D7EcjP@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: DUZPR01CA0331.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::24) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|SJ2PR11MB8588:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ee4568a-f58f-4e7e-59ef-08de260c8123
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eXFpenF6SmxWTG5Sdmw4VTQyZnZMM0pKcWR1QXFSekdVd05SZ0l2Ty9SNzk5?=
 =?utf-8?B?WmVpa2VBOFo4bmZFNGt5YStsK01EaW1raHFpblJZUFdoVjZxSlJIV2E1QWIw?=
 =?utf-8?B?T0JLV0oyd2tQbkF3TjZ2bjVYSmQ3VHBnamI0UEp0OHhFZmlhLy9sQk1Ib1pK?=
 =?utf-8?B?UVRLbzRIaWFTSXpjc1pEamZBNXdyNlRNY09Qd0h5ZzFiVHV6ZGpzWXV0T25R?=
 =?utf-8?B?eTRPc3RpTnRGdy9DRG05amxDcjlyRTE3dDNXYXVSaE9MTTRvUHBoaHhIVExw?=
 =?utf-8?B?KzBEQi90S2xtbGhuOGV5dFM5YTdFYUpIT29aMWpranVWajI1eEgxbUQzOUlM?=
 =?utf-8?B?UzZ6NVBNZ2JIZFRkVU5QMTU1WEk2N3VReUlJZHVVdy9wQktyYVBrbTQrMWFp?=
 =?utf-8?B?ZUwzcVBSMnVHUnh2cTcxZy9OR0ZRSklsSHptU0wxYWZ5d1dJczJ4cythcWxx?=
 =?utf-8?B?OW4wakNyMktJVzRoek5MM095SitsNHdjWXgwbXlnS0pUSGJ6R3Y5NWtSWTlB?=
 =?utf-8?B?dEF4NkpRVG1sSWRlaWZJVHQ4bGFmM2h4VE9HL3phQ3YvTnhNMWJBZHAvTjh6?=
 =?utf-8?B?clBhL3EvUkFYOXRWd2dIUzZXOCt3RnhtVEtzNXFYTnNFZ09xRS9iNDVnOUZr?=
 =?utf-8?B?THd1MzduUnRUckhMRTYrdkdoMnFUbGl5ZDg4R0M0ZUxaa3g4amhTcDh0UGRi?=
 =?utf-8?B?YmNTNDJRV2xqcGRIcTlJR1BZTFFXVXFld1J4L2NDRW1Ob0szcnRLSHpObHZ5?=
 =?utf-8?B?ODhUWFVZOUV5V0Q2cDFCanJXcEluYW1LeThzbUZ4SlIvdThOR0RCc3lySVN2?=
 =?utf-8?B?aXAwWGNjaG1KamVXeTd1ejBsOUY0RnpqTDNCVGd0V0hmK2dxN3RyMmRkb3Jt?=
 =?utf-8?B?UkRPRjRtUU9pT21vWjYraGNZbGd3bXJNUFJ5V1Y0ZUNVRkRzNGtyM1k1YmhB?=
 =?utf-8?B?RVhaRDBlVjBWWW9DRXorRmplWDVPNThyMXFSbUt5OXAyNWNISkFyb0s1WFph?=
 =?utf-8?B?TXhiSFpScFhJQ3VkSERVT2NwUEU3OVN5VTE3WjhvK250M05SSnd1WWF4T0Rs?=
 =?utf-8?B?ZVZ2dC82NVdFR25sdEY2TVVhakxCKzJnVUw0SGIzcjNWcUtXSEZ4elBaVEFV?=
 =?utf-8?B?S2VrZ2ExRllqVU52bHY5cVhFalI5TWE2WDFUNFFrNUJ5L0U2R2c2TmQ0QnFZ?=
 =?utf-8?B?enhJcnhjOUZCa0JxRm1DeDlrZmdlZDJhK0xXS2VHTGJKbVRzdE80T0VLcXpK?=
 =?utf-8?B?QmNXNTNFZzAwQ08ra3Z2c2pUZE1meEZRYmQvT2xqdjdPamFQQ0tCT090K3VR?=
 =?utf-8?B?ZVByVFl3MThOZS8wRHFDalBsdVRTb1UreVlLTkY4TlNoRkViRmhONkpTeUhT?=
 =?utf-8?B?TXFnNElpYXBOS1dGbHZUNDYvSlJsSGJtQ2JTQVVjcCtVQ2dNMUFDaHdtdC8v?=
 =?utf-8?B?NVRKT0dYYVJpQ3NQVnZXWi9MblUrMGRISnhhRk1aVUNxRDk5Q29QcVB2VCt3?=
 =?utf-8?B?YTY2a3BkUXdnMkVZeHBEcHJXK0FiVWhCNDBKUnB3TTE1NG5Eb05odlMzbHdO?=
 =?utf-8?B?a3BPQ0hmK2pkc0IrMnR1c0JvSk44dHlNWDAxNkZSUEd4akkrc1RBdm85ekVx?=
 =?utf-8?B?VnRPYWk5UkpwZDErV2RybHhYbE5QMi91cHBsSFBNWnc0L2VIV2QwZ0x3LzFV?=
 =?utf-8?B?eS9CSzF6TGkvMEcrTDJXUGNVSUM3MXBuWlZPR1NtNXo2TW0wNE83SUZBalFN?=
 =?utf-8?B?eURXMms3UXRuSy9rTzhEbHgzdTRNUUZadlFlVW9CTXNoTEtWbE1MbndnTW5Z?=
 =?utf-8?B?TFVBWkVsRzVUL0g2dFYybEtPeXFtVkpOUFRCUEtKK0Y1WGpNMmlxOWVOcWdG?=
 =?utf-8?B?bTFaekljQ3liVU1hZ0haYTRhSGNkT3FEbGswZUw5YkFyc1gvT3FhZjFmQXRY?=
 =?utf-8?Q?VvGf+kc4NsB1ISQkY2hVxjYkg3pPXNun?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzY2UnUxTzlsclhuZE90U3Y4eTNvTUNVYzlmREpMVGFySTkrcDh3SUxyaml1?=
 =?utf-8?B?akhITjZPZUZVN1FxNUJ3MTgybEJtN2VnKzJqTjc5dlFBbWJ0YkJRWElXRFlT?=
 =?utf-8?B?b1NTUkhhc2YxT2xrVG9RUm0yNnN4eUR1QmxTQkkrOEpXN2FXV1F6clNVTk1T?=
 =?utf-8?B?YndjaEwvTjMwdktnNE9JR0N6Y2cySFJackwyZmlCcXY0Nm9DMkQ3WWdhRkd6?=
 =?utf-8?B?NlZTbG9OUGdNTU5SdlU4dy8wTzQ3Ui9vRDJieThTcHJyZVFCaGpjUktHcXU5?=
 =?utf-8?B?dnk3WjBMKzUwUkhWTE9HOWtXQ1RtWHphaTByNE5oUXJsTEFpUWRSSWFVSXdi?=
 =?utf-8?B?RUFXdll5TStQSlJxbmw5bmpLTFZkcHZOKy90ekdJYVVvd2N1SGlkUFVXSFcz?=
 =?utf-8?B?aDZXUUkvSVUzSWNGdTJ5QTNxVXJRUEJleUZBcGJlWkpxQ1pDMnJQUG1DTlFJ?=
 =?utf-8?B?T1pqNWxZUU1uNEo2UVI4QlhjYkhWN2xHZlYzR1NQdkdBOXBPdjJGWTU3YVV0?=
 =?utf-8?B?QXZpSVJNVHRueGZXT2dlZHNjRWRpblpMRndVSWJGdXZZT2tieEZxcmhlUUxU?=
 =?utf-8?B?cmE3dXVMakhkbVBocmRMa05UeWczSUNvUTJjaU9vUlVTeEhyeXp6UDE1Q2p0?=
 =?utf-8?B?TzNkVkhmUU9wTjRHT0lWTmphcmxtN1dNbVpWbWJuZXZhOHluelM5TzFKcjNR?=
 =?utf-8?B?ZHJIWDBlRm03UkZLSHZGMHF6WldPYy9ITmdocGNzN212QVpERGFYREZxYlJp?=
 =?utf-8?B?R2FXNVU5ajVtZGkrQmliUUkxZHRDVDM4bHVTMWd5QkMzZlBMWWZud0Uzb0Ru?=
 =?utf-8?B?T0FxbU5uU1ZlKzh4WHM1V2ZwdnVGOVQzdlg2S0FLbkp4amN3eThkTUtuOEVm?=
 =?utf-8?B?dUVqSkZ2aHZQZGdiWU5YOTNmYTNhUUI5ck9Kak5DTERTWjd6SUoreUlndklq?=
 =?utf-8?B?aTBzMEVpeHZUS0JiVXdFUXpWYkI3SnpSdk9XVW9raHZlRHRIU2luTmFGb0pz?=
 =?utf-8?B?cXRkOGlYcy92cnY2ekU1OWEzbG9rRzcxWmN6OVBSVTRLL0xaSTBaNjF0NVMr?=
 =?utf-8?B?S2hscy9PT1NySEtjbUhVUTVXcHVzZ0l3U21HRHVOck03bU9RQ2RCbkpYME1a?=
 =?utf-8?B?U0Rjd0xsamtYWlRTYTBRajd6YTJjMGpQcWtHcHFEOUorVXRwYzRjcHA5T3FP?=
 =?utf-8?B?ajBwbXBmd0wvMUkxRWkxb2xyazRxV1JzblRIeFVNWlRzWmttN1RBUm1pangw?=
 =?utf-8?B?d1k2Q3NoMitaLzhEK2Jpb0lUbU8ycVNEZ1JvU3Y4SjkxYXVvSS8yTUFueWlF?=
 =?utf-8?B?K3VYcjlRWmQycnU1QUdCVHp1TWFYKzJhYjBqeE5Yd3BXMkNNR3JSNkZCZlZo?=
 =?utf-8?B?YWZiTURkNFpCQnZSQUlqdmRRU2c3UTQ2c041eEN3aGJpb0tpZk81R2RWeElv?=
 =?utf-8?B?ckZybFpjSGZ5VEcvbmdRU2dUdDZMWXhMR3l0bHJsQlVQeDZkYlZ2Y010eTRh?=
 =?utf-8?B?czYrWENYSnoyZ2p1RGxiT1BPZVl5STVnbHc0ZjBpQkhlSzJLeWRyM1BvUUVm?=
 =?utf-8?B?VnpGUUVsa3FmRkR0UkdxUStOZHNEZDNzam9GRm0yVlk2ZEt0Mk1tWVBRZWxQ?=
 =?utf-8?B?TmZGVi95SWhXSDA4QmRZYWFIREJTTC9jNHR5WDhJNmdPeXk0RzdYTzZPWm55?=
 =?utf-8?B?a2xaVU9RTndFdWVmK1htc3RMS3o0YXZVZ2JXcmdTK2x3ZVBqR0cvWmgvYzdh?=
 =?utf-8?B?SDVXYlNtZUZneFh0Sm5Hd0hHd1dvNXREVUVJTzFadkErbkU2eGd1YlpQUkx6?=
 =?utf-8?B?NXJ4YWJRclFyQmVVdDUyQlF5blFQb29KN200NXBFc2VYT0ttbllOY0NSNjMx?=
 =?utf-8?B?R1BTcFpMNDlGbUExVDk4Um1oT1lFYkVQTW51b25WMnBJVGhtdXp4dHNnZzA4?=
 =?utf-8?B?bDdQT3RFZ0ZEOTQ2UTN6REduSko5M2FvR2dBZnVTNWYyc1pDTmNSaXZnOC92?=
 =?utf-8?B?UERpQncxZFA3elpyTFZIcjBYRmE3YXdsZ3RYZkRQVEhHaXBSZXJlRGROMTZa?=
 =?utf-8?B?RllVS2Z2Q1NscEZKZkF1MlQwcElVSEtwKzJsRy9RNCtSOXd1T0w3VjFyanB1?=
 =?utf-8?B?dHp4V0dsb3p6V0Y2WnJIbkpzZ0pUcWN3aDNJTVhFMzZVZUZMWVFvNVl6OTFk?=
 =?utf-8?B?YXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ee4568a-f58f-4e7e-59ef-08de260c8123
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 19:07:08.3437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qm7mOnzqsfydIGv7EIG9Uh+0IQyus/y+Q5/jWDSX7kvx2Bx+wRrmNRE1YcxVKc6zOEfbghBSdbJ39CgyX8Bnvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8588
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_110712_911149_5D816FF7 
X-CRM114-Status: GOOD (  19.31  )
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

On 17/11/2025 20:56, Frank Li wrote:
> On Mon, Nov 17, 2025 at 08:09:41PM +0200, Adrian Hunter wrote:
>> On 17/11/2025 19:54, Frank Li wrote:
>>> On Mon, Nov 17, 2025 at 07:47:05PM +0200, Adrian Hunter wrote:
>>>> On 17/11/2025 17:59, Frank Li wrote:
>>>>> On Mon, Nov 17, 2025 at 01:36:36PM +0200, Adrian Hunter wrote:
>>>>>> On 14/11/2025 22:09, Frank Li wrote:
>>>>>>> On Fri, Nov 14, 2025 at 08:13:55PM +0200, Adrian Hunter wrote:
>>>>>>>> Add support for Latency Tolerance Reporting (LTR) for Intel controllers.
>>>>>>>>
>>>>>>>> Implement PM ->set_latency_tolerance() callback to set LTR register values.
>>>>>>>> Also expose LTR register values via debugfs.
>>>>>>>>
>>>>>>>> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
>>>>>>>> ---
>>>>>>>>
>>>>>>>>
>>>>>>>> Changes in V2:
>>>>>>>>
>>>>>>>> 	Make use of FIELD_PREP()
>>>>>>>> 	Improve handling of values that exceed the maximum
>>>>>>>>
>>>>>>>>
>>>>>>>>  .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    | 125 ++++++++++++++++++
>>>>>>>>  1 file changed, 125 insertions(+)
>>>>>>>>
>>>>>>> ...
>>>>>>>> +static void intel_ltr_expose(struct device *dev)
>>>>>>>> +{
>>>>>>>> +	dev->power.set_latency_tolerance = intel_ltr_set;
>>>>>>>> +	dev_pm_qos_expose_latency_tolerance(dev);
>>>>>>>> +}
>>>>>>>> +
>>>>>>>> +static void intel_ltr_hide(struct device *dev)
>>>>>>>> +{
>>>>>>>> +	dev_pm_qos_hide_latency_tolerance(dev);
>>>>>>>> +	dev->power.set_latency_tolerance = NULL;
>>>>>>>> +}
>>>>>>>> +
>>>>>>>> +static struct dentry *intel_actualize_debugfs_root(bool add)
>>>>>>>> +{
>>>>>>>> +	static struct dentry *debugfs_root;
>>>>>>>> +	static DEFINE_MUTEX(lock);
>>>>>>>> +	static int ref_cnt;
>>>>>>>> +
>>>>>>>> +	guard(mutex)(&lock);
>>>>>>>> +
>>>>>>>> +	ref_cnt += add ? 1 : -1;
>>>>>>>> +
>>>>>>>> +	if (ref_cnt) {
>>>>>>>> +		if (IS_ERR_OR_NULL(debugfs_root))
>>>>>>>> +			debugfs_root = debugfs_create_dir("intel_i3c", NULL);
>>>>>>>
>>>>>>> I think it'd better to create common "i3c" debugfs root. So your device
>>>>>>> use debugfs_create_dir(dev_name(&hci->pci->dev), ...) under this common
>>>>>>> root.
>>>>>>
>>>>>> The debugfs files are being created for the PCI device to contain PCI
>>>>>> LTR information.  The i3c module has nothing to do with that.
>>>>>>
>>>>>> Also, currently, there is no module dependency between this PCI driver
>>>>>> and i3c, but a dependency would be necessary to coordinate the creation
>>>>>> and deletion of an 'i3c' debugfs directory.
>>>>>>
>>>>>> The extra complexity can't be justified.
>>>>>
>>>>> Don't post new versin before we close open discussion. I see your post
>>>>> patch before this message.
>>>>
>>>> Sorry, but it is late in the release cycle, and it saves time when we
>>>> are in different time zones.
>>>>
>>>>>
>>>>> So, I think not necessary to create to root, which cause complex, (need
>>>>> lock, and refer counter).
>>>>
>>>> So you are OK with V3?
>>>
>>> In v3, still create "intel_i3c" root dir, how about direct create dev
>>> under root
>>>
>>> 	debugfs_create_dir(dev_name(&hci->pci->dev), NULL);
>>>
>>> to reduce unneccesary complex, (like mutex lock and ref counter).
>>
>> Could do.  I added intel_i3c to match intel_lpss which is also
>> PCI devices with LTR e.g.
> 
> You can use similar method to create root at module_init.
> 
> static int __init intel_lpss_init(void)
> {
>         intel_lpss_debugfs = debugfs_create_dir("intel_lpss", NULL);
>         return 0;
> }
> module_init(intel_lpss_init);

mipi-i3c-hci-pci is not an Intel driver.  It can be used for any
PCI device that supports MIPI I3C.

At module init, the driver does not know whether there are any
Intel PCI devices, so it does not know whether to create "intel_i3c".
Nor does it know whether other (non-Intel) devices need debugfs.

It would be preferable to use either the current approach, or as
you already suggested debugfs_create_dir(dev_name(&hci->pci->dev), NULL)


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
