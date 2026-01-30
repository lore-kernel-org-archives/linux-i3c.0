Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 856EBD49C66
	for <linux-i3c@archiver.kernel.org>; Fri, 30 Jan 2026 07:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=qgB/HDbXTpLWBm1RJGgXbMwOG+6UEAcwKFc/sEcyYUY=; b=ASfND1ARTtRnikV5lDsUCgNPyh
	c7MgWxh3PtDdevsRLUEsXZjqzgYkA11dA4MHy/9Or37GS5T1TtLQ1BzthNLO0grAkVbWrp6MCltfL
	vX1Ui+5ER7EGc9u/AO16K5f6jJHEusdhUj9aJSmEIl+vPvqPpGR4na3lTRhMuSKTZ+8D1udn49LFl
	cRLFKByub5arn+5ADMGLGvnKcLWj5Y3xHclZRaB053PFDgyecxKSbKcdMTjW6USj/GVad4cUPamAF
	ldOcB9OPSyVsG6yZPGm2SWJiVXOm/zWQVYq5/BM/7QRVSJO3pVvUlZrUoEka5q+vSjJgUJxudUjy0
	vqzLu8gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vljEt-00000001ADT-1336;
	Fri, 30 Jan 2026 07:48:23 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vljEq-00000001AD5-3uV1
	for linux-i3c@lists.infradead.org;
	Fri, 30 Jan 2026 07:48:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769759301; x=1801295301;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=KPmx5XeDzxKFdtUhhsClhYvTBf7JwrPeFMMbNMJriKE=;
  b=Bf73D8OtU1LVd98e4LGNdKhTHCQsbbP4gkUnyZfTxBJsY1DsREZF+aWP
   +J5CtoqO5Y0Gk7dcQ2lc/Qxg8LAl2qJfK79HqwwcuC3cHnKhlAkMsjd/m
   MPL2Ol5DQcz16GB9xHG1QdqIhsfrLJQZE/AQTl2D7KJ+vhGgteHKkEqy5
   OAJhd0pQtfz29nFQU3BbqPOH3Bf+/xSRKYQgihCavHygiWCtJz1gZ31ih
   q3ph/Whb/j3BvcKiLQAJzQ+owq7nGIGjqOm/JaTrBe0hCdpVrqBIHPWQn
   7sUtamulP0a7NCjfzRjGKCZAkDllqlVLF8AMnJpiwPU7makaIcuhQ4RUi
   g==;
X-CSE-ConnectionGUID: zbwDr34/RBuHhSLgROYYWQ==
X-CSE-MsgGUID: jGXtJWO6RuWKcFVAIp0UVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="74859699"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="74859699"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 23:48:20 -0800
X-CSE-ConnectionGUID: hhXylaMoTBatpgHs2Hwk2g==
X-CSE-MsgGUID: 8JILrHvHRD2IbIVZfEExzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="231713759"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 23:48:19 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 23:48:18 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 29 Jan 2026 23:48:18 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.48) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 23:48:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sfhk2lD0uCgjhIhkG1zmOoXux53PEkZQTfcxunD4FRtCfkKIa+VPiDtcQl3O+WwJx4STDkvcoSJyph21pKvaCD7YlrdlNtCrGvru+Nom1b2nBJxvurnq1aQxC1mulVcoSwVG0INmTKdRngO3jYt49zu+0H+s7tU+nabhLXWFQuqqd57oz5XxmoioKbwPUfRmflQcZb1XB24c5rdVvbQ3WtM4fiQmq10HUmMhkmpO30wb2v2vJI6gBrGIBFeCNdnsNEii3RoUJppV0aZpqFuQkIIEXjsAVOOSkO/7b7Pv60q42tGzXvrcWJdjvoQ7WLvgOq22bJzwTSoMTVjSr+cgug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FLHamYBtoShK+4Ave3oSMeflJSsCxVy+C5nO8JOHGLQ=;
 b=H1v7M5AdxOe0lLW1AraiQ7+S4v05e944AjhXstpm9n7xZ1/IfnNwaPqVbQ5wypCdZ9dL19HQj4Od67W5BIE3VSfs7uu+AUNglDNmWdWCFKdxIBgbK9CaMPrUrEvcx9apFicrP8aGcPCg8y1rQI5myGw3hflzsXlefGkCbd2uhS107are4eSrieHiuRqvQq8xEuFpQ7VnHdQTNH3RTu9BI3eXwz3lp8T4f4T9lem14Xj55Y5ojgDL291PR268yA+UKAcvaRKG2g/xACJ5kqjNCdauVSJ5ah43n/8T5uI0xkKLMdfyZ+RhQThF/bsSI1/3lU9t45Ti1/gA8fNw9Zauxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by CO1PR11MB4961.namprd11.prod.outlook.com (2603:10b6:303:93::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Fri, 30 Jan
 2026 07:48:12 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 07:48:11 +0000
Message-ID: <66d63d13-8e49-4101-acab-a6a5203826ca@intel.com>
Date: Fri, 30 Jan 2026 09:48:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] i3c: master: Mark last_busy on IBI when runtime PM is
 allowed
To: Frank Li <Frank.li@nxp.com>
CC: <alexandre.belloni@bootlin.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>
References: <20260129181841.130864-1-adrian.hunter@intel.com>
 <20260129181841.130864-4-adrian.hunter@intel.com>
 <aXu7UduYCweVLxdK@lizhi-Precision-Tower-5810>
 <1db7b04b-ee65-4791-8db5-0dffc7befca2@intel.com>
 <aXvJTPWhQwFfv57G@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <aXvJTPWhQwFfv57G@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: DUZP191CA0041.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f8::20) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|CO1PR11MB4961:EE_
X-MS-Office365-Filtering-Correlation-Id: 296f49dc-3543-4793-93f4-08de5fd3ea62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aitIbHRBKzM2ZCtmaFM0c0NLdTBOSjlBVkZZZEpIZUdpQ2txMm9xYi9iWGsy?=
 =?utf-8?B?SlRhRDVIZGJvdmgzNWNDbk9RajVLVnZiR3RCMCt0RTAyN0VtMFhJbWI5SXE3?=
 =?utf-8?B?V05iSE9vYy9jWFJ6UmtHQnpVSUI1b0RZeFpNU2J2WGNOTWcxREUxUFFZdFZ4?=
 =?utf-8?B?NVhMa1RUWWd5NnZXeE90aTJaMHRVd0l5OVlENGVNWVJGb2VCMXhVWkNNZnVD?=
 =?utf-8?B?a2t0TEZRV2lnbkVaeUdIdk0yZjVNQ3FVV2VUVjZxL0xQYU1mNlF5WUZ5U2F3?=
 =?utf-8?B?TkdIRFFONWIxbTRMWlpUVGlsRVZ0MHRjQmJqcUU4UnE3K2xuVTR4cUYydG9Z?=
 =?utf-8?B?U0FRREdZWnp6bU0xVnNhNHVKdkd1M1JIREt1dVJINzhUODZrMEN2OHRYdVVN?=
 =?utf-8?B?aTZOTXEza0hpWU5aOE1pVFpHL09RaHVMdjBoYjEzYzQ1QjJ6SWFTcCtSekVL?=
 =?utf-8?B?bEpLVFdUK2tCVGNMWVVJMFIrTS82SzNGRUlvK3podE11S29vaTZtZElkL0tZ?=
 =?utf-8?B?THFoSWsyTUI4dWhVNmhqZTc5bkJxc0Y3bkRSMWpLUjZmS3Z1MGZtVjZ0eWVW?=
 =?utf-8?B?dmVvM0laWjROWGhKeTRDTkk1WGZwWDErbGdMbU9pTERqb3NMTXUreEtvaGhQ?=
 =?utf-8?B?TlRUWEpRSC9wajZBdW9qRkljQlRldEpzVlZUL0RsbUxuejJ2Q0ZSclN5MnAy?=
 =?utf-8?B?V0wwVWo1L25NakxyWkVZVUMwUThYaUY1SGhmVjlLdlZRWHlabWthdTQwMy9X?=
 =?utf-8?B?REhNTVNnQnpsc2xOMDVwbDFuVzZHMnQyTVN1RFliUS9tQTIxUHRkNjJnVkwv?=
 =?utf-8?B?MTF3OGM1RThQd0QwU3I2TktvZkFJd0lBbHVtdGl2RnN5aTRUU2YxQVF2b2hX?=
 =?utf-8?B?OU8xVmJoK0FlRitTNWUydm9hVHQzVFl4MjNhTkFIWHpVYk4vbjdJRmYvd1Av?=
 =?utf-8?B?YTByc1hWVU5idlprR1BBSnhNWm9rUEwzZE5LYVlURDZTejVWZzZod1JRcGdi?=
 =?utf-8?B?ZCtJM0N2d09rc2tCMURtTFJiaCtWbk94aDY4RGh5d0tROFRTUFJzWTYrd2w3?=
 =?utf-8?B?d2h4ajJLY0dxVkp4RDlHdER5emEyR040REFOY0FuOWpoNDUwRjRNckRCb3Vr?=
 =?utf-8?B?dTk0TUFQSHRma3BSbWUzRHdyZS9IdnI1TnJQZ3orV2lYeHkzSWxBQlI5VXIv?=
 =?utf-8?B?dHBGTW5US0JZakZiNXBEZEN4MkcwcUdtc2RnWFc4QzgybVdGRTZSM3Nub1BT?=
 =?utf-8?B?RDZkM3VhREhRT3FuOCszZmxad3VqdzcvaE5LU2dWMCtTQ252d3M4Y2hPRWVZ?=
 =?utf-8?B?aUpuaWtjVWl0bXk4UHV5NDJDcGw3QzJBaThlT2R3VDNremhzZlhTd3RZSDFN?=
 =?utf-8?B?RVMrNE5PbXB4Q3BGWXg3WEZlK1laeHFHZDVJSHNtNlQ3SmYyWGVIbDFaVVZG?=
 =?utf-8?B?cXFBODE2L1J2Wk5aN2JCT1FzQVJmOFdzUUJURWNnb0Flb1czeVM4b1d1NFhs?=
 =?utf-8?B?QjlLTWNpRFZnZHZsQTVZMG91K2lqT0RTN2lGL1JoeUhDK1NYeGxOaDk4aWhP?=
 =?utf-8?B?OXc5ZzNSZWFoOW5UNUlIOXVVeDZTL09WL0hyZXpTaGNvVytRQ1Vmbi9kQ0gw?=
 =?utf-8?B?d1hFUnAvQUJVanNYcTM3OGFQWWFHN1NXaEs5ZUhLY2lvVWxFNjU5ZE9hSWFQ?=
 =?utf-8?B?TGp0ZFFaWGtGUGt2ZnMxQUdFNnlWcUU0R1dNcEk4bjUyei9SYVBmYTVZSHlR?=
 =?utf-8?B?c1c2ZCtVV2lsVERlUW1OVFlZSTIxcTFXT2hzS1k4Z1c3RVZQeWFobWtTai92?=
 =?utf-8?B?OFVhOTFyMVBwRk5laGNiRmpsOVpHMnQzbCtrY1hlWkJ4YXcwU1ZCY01UUlBt?=
 =?utf-8?B?TFo2WGRjVFhiaGNCVXdkaEh4dHZVeTlsMkJHOW9KcmhtQllaME0xRUVtRXlY?=
 =?utf-8?B?M3F5UDNSK1JydzFwU2hPUWFsa0pFM2s1OFlkMTFHM3pRcmpMdWx3RmRRU09y?=
 =?utf-8?B?Y2xvVHdLQ0c1RTJEZmhiaFNBalZPSmVxYmFjQ01ITkRRUENpVXJhVlBvTG9n?=
 =?utf-8?B?bnppdk9WSnRiZSt3clZVb3lyL05GbkhHc0hReEppT1I2TTN6MW5Ra2tianNj?=
 =?utf-8?Q?SCfs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWVzODhNTExjZlpIcnR3OEx1L09Edno3RFQrSGVaM1dzTHM5S0RHRnNqaDFP?=
 =?utf-8?B?aVZBSWxZRDNVOE4rL1JKQlJFWnlVcW1oQ0k4SFB6NTBQVk1JOFl4UUJQdG5G?=
 =?utf-8?B?YmRVZVhaK0FDT1loRjNJWmpNYnVpb1BaWnVPaFp6TzJMeFVvbG43ZURrWDI1?=
 =?utf-8?B?cXlEZG9mMUx4NGNpT3BCNUdJYU1udnozeFVUMklxc1RxWnFwWktVenppU0xw?=
 =?utf-8?B?bjJCVEpxMHU3S1ozZ0RpWUIxN2RhN3d5TlZuY2lDYkIyV0tqTjhMSkU4TDdn?=
 =?utf-8?B?RkZKUThTQUg2QlZIVG5ncm90eUJDTlpBNnFnL0JVOGlVUHA5aXFlRFdpN0tx?=
 =?utf-8?B?WDAxTFBZSWorazlwT3FmK1dhaTgySGloWjMvZ3hPSExTNVJVdlIwRHNSMzRt?=
 =?utf-8?B?c0lYLzFRNjZTTUVhejRHcGVwbVZWRDgyRmw3WnI2aUI0bmpabDAyU3h6ZGcx?=
 =?utf-8?B?ZjJDalJzbHdZWTJibVRiajg0enpRVGxabEl1OUFhL0lLSnJHeUh0MG5WN29y?=
 =?utf-8?B?QjVYdThtaXBwWGtIMXJJMzI1T3lRa3FGMCtKNFpOamFGTmxlelcrYzlLZGpt?=
 =?utf-8?B?UGxLQVJsbzZFNWdRbGtOL1pONnpRYkZHMGVlTHhsSGRzdU1ONjFCRHhFVTRz?=
 =?utf-8?B?Rktlc0NRNmRGSVR4YUFkWkhWUE5CdmpVeVd5bExNQnJQNnkxa25ia1U5bE9m?=
 =?utf-8?B?WDF5VEdYWFUycEVPTyt2OE41cmkyak9aR052bWR3cGZuM3ZEdU5sbzZKOUVp?=
 =?utf-8?B?WFFUczIvUnNsdmdWS2ljTkMwNFl5Mm5hdkY2L1ZwWnVHNnhhOGFtbmZDbm1l?=
 =?utf-8?B?MEkrREhSdFp5UGxTL3c4Z0JXbFNEWFAzUGYxRWxDdE8rRGJLdVg0cXR2cWlD?=
 =?utf-8?B?WnVLYlFvY3RWbDlqbkRESkFmZUpDdkIycXo4endMd2VHdE5kVHFoNS9HMDdE?=
 =?utf-8?B?MVRxd1VZdGg2MWZndFRhTHR1SlhyZkdJOFFISWFEUXM3YTR0VHc0RUZPb3NC?=
 =?utf-8?B?RGpWdVFIVFdiclRQNnY2djJnMzMzdW15b3JRV0gxL1NNYTdaRVVqYUJQZHZv?=
 =?utf-8?B?UzRVcW9Kd0k5UCtFV05ZZ0hndkFPbmVPd1FjUXFxTEhNU2tlc3NVdVB1VURY?=
 =?utf-8?B?T3ZkK3M0NjZxdG8rNHN1TlVRNmcvSTBBNzczbiszVEkrOEkxUmVpMmVESSt2?=
 =?utf-8?B?YS8rMjVhb0JnbVdya0NDVjR0SnpKb1M2NVJCL1RBb1BYcWpIUDF6QVVtV012?=
 =?utf-8?B?S2xnbWVzVEtBUXZReUNDNVpJT1JEY25jUzQ1Yll4c0REMHF0MDF6OUlqLy9Z?=
 =?utf-8?B?UHRtdGxsMlFjVzJJUGhWckozT01uWjRYNnU4Sy9XNG5PQmVDbVloWWwwekhv?=
 =?utf-8?B?Q3RtWDlscm9FQitvcE9pVTB1dVEvSkRMOENUaVdjUWc3c3RWc2xKTk5XZmM5?=
 =?utf-8?B?cmJ6K2RFR1JiV3Rhc2xDbnI5Slo4TnRVcEw5MnRNK1IvWjl5S0d2TjBvZ056?=
 =?utf-8?B?M0xNT2w3SmZvN1E2L3Z1Q29IdC9McUN4RWc4REg0dzBQV1FmNFRTQXlCTjlW?=
 =?utf-8?B?c1lWUVNwK0sxd096MFBydzJwb094cytpVFJ5cG95VUJKNGdPeVlkTS9KeUNi?=
 =?utf-8?B?UkRiZW52S3lRTVFaTTJ3T1N3K1NTZFlsYU5EenBZWHo4ek5GL3pnSlpFRCts?=
 =?utf-8?B?Y1Fib0x0UnVaT1A4ZGVuNVNmM3ZlWUdNKytPOExBNG9EUFV4Uk5yZVBXZ3px?=
 =?utf-8?B?ZUc1aGRNM3gyOW05c245VGl1aHZTN1ZSRWlSNEdCeldzQkg5QUZHb1JqRVQ4?=
 =?utf-8?B?WXZhb2lJdldKbUlPUE41VHlSZThWWnFmVXBjU1VpZmFiaFJwajdYMGlqalVq?=
 =?utf-8?B?WVZQK2hPRmNIcUlobTZIT2phdDJtOThqVnQvL1I1LzIzaDB3VTdwMlhLN203?=
 =?utf-8?B?K2x3QUN4Ulc0N1dSQU0rWnhkMkFWYmYveG1jUzZyQ0F3MElZZzdFSU1SdVlz?=
 =?utf-8?B?MTZZakIwZWJlMXdaMXhDeTYybnJ5UmhnUnJiSm9XcitsbTJaZVJJVlk4WFcr?=
 =?utf-8?B?RkxNMElGcXRaUDU4WkQrRzFoZnRoQ09DMlA1eExEOHRuaDFMc2ZDSEZtMHUw?=
 =?utf-8?B?WHNhOWdjYlRLcXdDTStadDZUSy9nVzQ0UHZWR3NwSE85WEx2WXVYZGlNUWVo?=
 =?utf-8?B?YXZrVnJJSzFXdy9ncE83OEw0azVpbFV1ZkMwRlNlZTVPL0J5ai9GZDNQUkpH?=
 =?utf-8?B?WHAvMWhUTldpUjNXVlVSazRkdkoyNWZrdmRvbkFXY1dLYjlNZno0WDg5TzNY?=
 =?utf-8?B?cHF3bW1rSk5SOHc3TTBWQytaNnB2Yms1Tk9PS0kzSTdveXFYNjZQdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 296f49dc-3543-4793-93f4-08de5fd3ea62
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 07:48:11.0496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ffgOo43yLnM9HzabTpWJQanatGKgAfR0fr8kw1PxcUYY22EUi/0N8qWliXBxL5NRU1EzAkamlOcyLEoZ3XLUQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4961
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_234821_038861_7B276A86 
X-CRM114-Status: GOOD (  17.35  )
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

T24gMjkvMDEvMjAyNiAyMjo1NSwgRnJhbmsgTGkgd3JvdGU6Cj4gT24gVGh1LCBKYW4gMjksIDIw
MjYgYXQgMTA6NDI6MzJQTSArMDIwMCwgQWRyaWFuIEh1bnRlciB3cm90ZToKPj4gT24gMjkvMDEv
MjAyNiAyMTo1NiwgRnJhbmsgTGkgd3JvdGU6Cj4+PiBPbiBUaHUsIEphbiAyOSwgMjAyNiBhdCAw
ODoxODozN1BNICswMjAwLCBBZHJpYW4gSHVudGVyIHdyb3RlOgo+Pj4+IFdoZW4gYW4gSUJJIGNh
biBiZSByZWNlaXZlZCBhZnRlciB0aGUgY29udHJvbGxlciBpcwo+Pj4+IHBtX3J1bnRpbWVfcHV0
X2F1dG9zdXNwZW5kKCknZWQsIHRoZSBpbnRlcnJ1cHQgbWF5IG9jY3VyIGp1c3QgYmVmb3JlIHRo
ZQo+Pj4+IGRldmljZSBpcyBhdXRv4oCRc3VzcGVuZGVkLiAgSW4gc3VjaCBjYXNlcywgdGhlIHJ1
bnRpbWUgUE0gY29yZSBtYXkgbm90IHNlZQo+Pj4+IGFueSByZWNlbnQgYWN0aXZpdHkgYW5kIG1h
eSBzdXNwZW5kIHRoZSBkZXZpY2UgZWFybGllciB0aGFuIGludGVuZGVkLgo+Pj4+Cj4+Pj4gTWFy
ayB0aGUgY29udHJvbGxlciBhcyBsYXN0IGJ1c3kgd2hlbmV2ZXIgYW4gSUJJIGlzIHF1ZXVlZCAo
d2hlbgo+Pj4+IHJwbV9pYmlfYWxsb3dlZCBpcyBzZXQpIHNvIHRoYXQgdGhlIGF1dG8tc3VzcGVu
ZCBkZWxheSBjb3JyZWN0bHkgcmVmbGVjdHMKPj4+PiByZWNlbnQgYnVzIGFjdGl2aXR5IGFuZCBh
dm9pZHMgcHJlbWF0dXJlIHN1c3BlbnNpb24uCj4+Pgo+Pj4gbG9vayBsaWtlIHRoaXMgY2FuJ3Qg
cmVzb2x2ZSBwcm9ibGVtLiBwbV9ydW50aW1lX21hcmtfbGFzdF9idXN5KCkganVzdAo+Pj4gY2hh
bmdlIGRldi0+cG93ZXIubGFzdF9idXN5LiBJZiBzdXNwZW5kIGJlZm9yZSBpdCwgbm90aGluZyBo
YXBwZW4uCj4+Cj4+IEl0IHNob3VsZCBiZSBlZmZlY3RpdmUuCj4+Cj4+IHJwbV9zdXNwZW5kKCkg
cmVjYWxjdWxhdGVzIHRoZSBhdXRvc3VzcGVuZCBleHBpcnkgdGltZSBiYXNlZCBvbgo+PiBsYXN0
X2J1c3kgKHNlZSBwbV9ydW50aW1lX2F1dG9zdXNwZW5kX2V4cGlyYXRpb24oKSkgYW5kIHJlc3Rh
cnRzCj4+IHRoZSB0aW1lciBpcyBpdCBpcyBpbiB0aGUgZnV0dXJlLgo+Pgo+Pj4KPj4+IGlycSB1
c2UgdGhyZWFkIGlycSwgaW4gaXJxIHRocmVhZCBjYWxsIHBtX3J1bnRpbWVfcmVzdW1lKCkgaWYg
bmVlZHMuCj4+Pgo+Pj4gQW5kIHRoaXMgZnVuY3Rpb24gY2FsbCBieSBpcnEgaGFuZGxlLCBqdXN0
IHB1dCB0byB3b3JrIHF1ZXVlLCB3aGF0J3MgaW1wYWN0Cj4+PiBpZiBkbyBub3RoaW5nIGhlcmU/
Cj4+Cj4+IEp1c3QgcHJlbWF0dXJlIHJ1bnRpbWUgc3VzcGVuc2lvbiBpbmNvbnNpc3RlbnQgd2l0
aCBhdXRvc3VzcGVuZF9kZWxheS4KPiAKPiAKPiAgICBDUFUgMCAgICAgICAgICAgIENQVSAxCj4g
MS4gcnBtX3N1c3BlbmQoKSAgICAyLiBwbV9ydW50aW1lX21hcmtfbGFzdF9idXN5KG1hc3Rlci0+
cnBtX2RldikKPiAKPiBpZiAyIGhhcHBlbiBiZWZvcmUgMSwgaXQgY2FuIGV4dGVuZCBzdXNwZW5k
LiAyIGhhcHBlbiBhZnRlciAxLCBpdCBzaG91bGQKPiBkbyBub3RoaW5nLgoKMiBoYXBwZW5pbmcg
YWZ0ZXIgMSBpcyBhIHNlcGFyYXRlIGlzc3VlLiAgSXQgd2lsbCBuZXZlciBoYXBwZW4KaW4gdGhl
IHdha2V1cCBjYXNlIGJlY2F1c2UgdGhlIHdha2V1cCBkb2VzIGEgcnVudGltZSByZXN1bWU6CgoJ
cG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQoKQoJSUJJIC0+IHBtX3J1bnRpbWVfbWFya19sYXN0
X2J1c3koKQoJYW5vdGhlciBJQkkgLT4gcG1fcnVudGltZV9tYXJrX2xhc3RfYnVzeSgpIGFuZCBz
byBvbgoJPGF1dG9zdXNwZW5kX2RlbGF5IGZpbmFsbHkgZWxhcHNlcz4KCXJwbV9zdXNwZW5kKCkg
LT4gZGV2aWNlIHN1c3BlbmRlZCwgUE1FIGFjdGl2YXRlZAoJSUJJIFNUQVJUIC0+IFBNRSAtPiBw
bV9yZXF1ZXN0X3Jlc3VtZSgpCglJQkkgaXMgZGVsaXZlcmVkIGFmdGVyIGNvbnRyb2xsZXIgcnVu
dGltZSByZXN1bWVzCgo+IAo+IEZyYW5rCj4+Cj4+Pgo+Pj4gRnJhbmsKPj4+Cj4+Pj4KPj4+PiBT
aWduZWQtb2ZmLWJ5OiBBZHJpYW4gSHVudGVyIDxhZHJpYW4uaHVudGVyQGludGVsLmNvbT4KPj4+
PiAtLS0KPj4+PiAgZHJpdmVycy9pM2MvbWFzdGVyLmMgfCA1ICsrKysrCj4+Pj4gIDEgZmlsZSBj
aGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kz
Yy9tYXN0ZXIuYyBiL2RyaXZlcnMvaTNjL21hc3Rlci5jCj4+Pj4gaW5kZXggYmNjNDkzZGM5ZDA0
Li5kY2MwN2ViYzUwYTIgMTAwNjQ0Cj4+Pj4gLS0tIGEvZHJpdmVycy9pM2MvbWFzdGVyLmMKPj4+
PiArKysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIuYwo+Pj4+IEBAIC0yNzIxLDkgKzI3MjEsMTQgQEAg
c3RhdGljIHZvaWQgaTNjX21hc3Rlcl91bnJlZ2lzdGVyX2kzY19kZXZzKHN0cnVjdCBpM2NfbWFz
dGVyX2NvbnRyb2xsZXIgKm1hc3RlcikKPj4+PiAgICovCj4+Pj4gIHZvaWQgaTNjX21hc3Rlcl9x
dWV1ZV9pYmkoc3RydWN0IGkzY19kZXZfZGVzYyAqZGV2LCBzdHJ1Y3QgaTNjX2liaV9zbG90ICpz
bG90KQo+Pj4+ICB7Cj4+Pj4gKwlzdHJ1Y3QgaTNjX21hc3Rlcl9jb250cm9sbGVyICptYXN0ZXIg
PSBpM2NfZGV2X2dldF9tYXN0ZXIoZGV2KTsKPj4+PiArCj4+Pj4gIAlpZiAoIWRldi0+aWJpIHx8
ICFzbG90KQo+Pj4+ICAJCXJldHVybjsKPj4+Pgo+Pj4+ICsJaWYgKG1hc3Rlci0+cnBtX2liaV9h
bGxvd2VkKQo+Pj4+ICsJCXBtX3J1bnRpbWVfbWFya19sYXN0X2J1c3kobWFzdGVyLT5ycG1fZGV2
KTsKPj4+PiArCj4+Pj4gIAlhdG9taWNfaW5jKCZkZXYtPmliaS0+cGVuZGluZ19pYmlzKTsKPj4+
PiAgCXF1ZXVlX3dvcmsoZGV2LT5pYmktPndxLCAmc2xvdC0+d29yayk7Cj4+Pj4gIH0KPj4+PiAt
LQo+Pj4+IDIuNTEuMAo+Pj4+Cj4+CgoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgt
aTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1pM2MK
