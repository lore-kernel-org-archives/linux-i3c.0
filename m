Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 761ABE668B1
	for <linux-i3c@archiver.kernel.org>; Sat, 20 Dec 2025 15:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=mwxCWw27k8CxxZP2MXEAsk55ZcRKtF0aaMzw19o7taY=; b=VQfTiD6fO2jnZdiVD2wuC/Pd+1
	QNP63z5KV7Qa/zq+EtuhWpDyPAYyqXvmOJgkTHpVOb3m3loYQIVfYOAf2KNWC3murnVOqQqGEBUVZ
	bY7iZoI3RrTc0BIHw39159yVppL0rl+Vd2iq2487taZggD3Iku96YbskwlASwR1Vos6B2EImO28mD
	qh4w6CTkyd2f0gizDB4fjyQHl2E5qy0XzJUbyEEwOIEVEgch3/smGQcxsPk1aGmxbiaD8RQifE0oA
	qKc2T5DFoqicDFGL8PCJYf7z/bJVQHDCWO1XPzbXXfrvseHVl/dzhTh10lLWBbE011T7TWxbsee4H
	lFjtMyFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWybg-0000000BgGk-0Onb;
	Sat, 20 Dec 2025 15:10:56 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWybe-0000000BgGP-1ieu
	for linux-i3c@lists.infradead.org;
	Sat, 20 Dec 2025 15:10:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766243455; x=1797779455;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=dvkveiroON4LBMgJ2lPZ6STm6yVgCuKWhqqyvpvaoko=;
  b=OoPLwUL62YU3WcXiklO8jxsd9kp0AX0X25GN3G3trs0SOPinjVjLEwqG
   cJddTCjzMKB0lYavV3o6o8Q08nBFA+9THC988uhSDaYmpxf7cM/Tf79Td
   K8sExhFYCg4mweUqahgJa6bkhAcTT75+znQeN3yEopuh/ysnfURHJZxiQ
   MeYoGcauKHIO+x4VYIjgQmeIimTT7orv7EvKWQgoXoT1ilQZUJahMeMCo
   8/eTsw1WP7ZWnVe02NhyEuPv3s8K+oWHiaZ53UfBdhDqTCpNKNOrSLfrc
   2WmP+Ik2hQz1ZZ/SulBwZDdcw8FCirYzvigEPKrbF8wdnw309SHW8+Xc6
   A==;
X-CSE-ConnectionGUID: bjAqshr8QqCDzgC8hVbxEA==
X-CSE-MsgGUID: 8o0xBGjgRSiSadqACAN5yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="79630266"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="79630266"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 07:10:54 -0800
X-CSE-ConnectionGUID: PNRzf6C8TfGLDgTNkxqOQw==
X-CSE-MsgGUID: ITjQo9a4ReiOmgAnlA0cIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199030216"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 07:10:53 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 20 Dec 2025 07:10:52 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sat, 20 Dec 2025 07:10:52 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.58) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 20 Dec 2025 07:10:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lDtQ1Ovp/KBiGrsbFVP1dLof7Zms10/WmZJeDJSYmyMs7K9qUHUQOHFiYLRmz8tZVpsfXB19qYqCIC22QyM8jtMkw7V4UY+q13sEum2VlOlU29/jZZ50dUr4NIbfKl15OWc7wJzSVUSJ3aaI5zFRg7kRRweCxc16a6yzY+Hw8gjp05XyG6OnBTeZ+E/0lvoK7/dyqP/P/KynR8hEbXJ00kug9O6GKXmLSFkPXvzYGusgkT0m93CsS8FFa9FdmQHgxgXBbEDvbhYfb4lK8On5XrFfzVb/tAKUA3umGehYt4yZt4I9zJwECppangbJU+59qEOiJm/+7yWRbxCAc6bE1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=unXFeGgPOhh1yBxQYD2SewKZ5hhkek0hHn6Qbohhw/E=;
 b=wDMhrOKFFCdZsb3tQwV0QflD4KVhycJ/o2/qiI0DT9VfV9hXKXw7Oa813z6zLoY9Vp4OSxfR73rKr6cA+YQfS/c+xTxCGXzSz+YoKHXUx76vu+cRKFvR7bUtND+pFzcgtMNxiE0utQ4Eo8UvLEaxPDrSvNXsdMMx3S09XcvvRG7IO1y81xSd/oAcZJAt9aebBg0EfFU4Vt6PAA+sCHrUtNofwWEPBxh52WYDl5C5fNXxgMkgqaihTs372e8oblPL6f9BbPsm6cH2utKWci3UhG0SIBBpX1nAbMqgSI/LsBLf6aB35BbDa+c+pJrg/gGliWNkMTbv/JrcXhFmWkJW0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by SJ2PR11MB8471.namprd11.prod.outlook.com (2603:10b6:a03:578::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Sat, 20 Dec
 2025 15:10:36 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9434.009; Sat, 20 Dec 2025
 15:10:36 +0000
Message-ID: <8af5bd98-15e6-47a2-b225-564bbbb79e6a@intel.com>
Date: Sat, 20 Dec 2025 17:10:31 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/17] i3c: mipi-i3c-hci-pci: Add Runtime PM support
To: Frank Li <Frank.li@nxp.com>
CC: <alexandre.belloni@bootlin.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Aniket <aniketmaurya@google.com>,
	<linux-i3c@lists.infradead.org>
References: <20251219144534.84391-1-adrian.hunter@intel.com>
 <20251219144534.84391-18-adrian.hunter@intel.com>
 <aUWJoYXYLmkuDyd8@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <aUWJoYXYLmkuDyd8@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: DUZPR01CA0232.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::6) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|SJ2PR11MB8471:EE_
X-MS-Office365-Filtering-Correlation-Id: 4eb2028e-417b-4044-0282-08de3fd9ed79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cXdYdHQ1cEx3WkVETG5oYTV5T0FmQkJYTnd5MmQrSWxvVFBOLy9VR2hQWGxt?=
 =?utf-8?B?L0RGb0ZPN0N6cXQybWdzL0lXTFhZdThCOS9TNlRrMTNLVG1jeEx5bmdBZC9h?=
 =?utf-8?B?bG5XbVVuSHVUU2k5dHJyb1NqMjBaQS84cWpTN2ZtRTRjYlc2YlpQSTMxTllr?=
 =?utf-8?B?TWtkR1NoaktzWHpQaVZ6TmJvSWowM2xPR2hNMjd5S3pveHp2RkNYdmNQTkFU?=
 =?utf-8?B?UkxicnZ0VXo4WW0rWFRjQ093SFdCVzBmeHBtWTlBN0w4cVNxS1dxaHpiM0lm?=
 =?utf-8?B?eUJxVm9ER2JQU1MrMU5ISVBlNVBnYU5kTXh0alpGMFdBSkJsaHB0R29OTjVD?=
 =?utf-8?B?VXZTeTJaUmltYytTSjd6UWUvVFp0Wk9JSi9WT0pnOFB3SjlLay9Hb3g4VVFj?=
 =?utf-8?B?TklEVkJqN0hJakwzWmtvVlJrbXkxeUNuQ0dUNElJMFJ1eURhMCtvenZrcTY2?=
 =?utf-8?B?TmNueW03elpoZ0dsMjVqQTdySXRjTk1CYmVXSHhEL0ZyZFB4RG92VWtIVlNZ?=
 =?utf-8?B?L3VrMkhkQlpJSEhkRzRsVnRZR2YyUU81V241VUdjZ1EzdXh2djFkQkwybStm?=
 =?utf-8?B?UjRLaWRML3RySVZNUzZVaXZCUnlndHgvQ0V1YitwZVgzeUJadlREc0xUS09V?=
 =?utf-8?B?UENFdmFWME1kdExYZWhtRVVhM3IyaVA5NFZqbHJZNlNEUC9uNjRDTnMzUXhn?=
 =?utf-8?B?SyttQVZOQzVUYlhaeGFpTk44eFg0ZTFHT1Y1V0lUSUhxZmlKMUFjQy8waElU?=
 =?utf-8?B?enBkRlZtUHBVOG5xc3R4L013eUhYeUdGWUVucFA4RmFibHV0OVlkS0k0a3Q5?=
 =?utf-8?B?V2dDMklNSU9LVC9rWXpnL3IzYXhtUkJRaEh3aHdhY1EwNE15L2dMU3c5ZHNG?=
 =?utf-8?B?RzhQdmJSRVgwNlVEYjRtaDhDeWNXS1A5cEZaK3phbGgrbEVWSmZUTnRnM1dy?=
 =?utf-8?B?Q2ltOW5JS2I3ZU9yN1dCTFFYYTRtck5pTXdMdUJkQWhDNXpIeHRZM0pST0FG?=
 =?utf-8?B?dWZUNTQ4bjlReTRHdXJBd0d3b1dvYm5JQnMxTWJjcGpVeVhvNDBmdlh5MHlV?=
 =?utf-8?B?V0RKZ3FNbUIzU0p3LzhrZGhUdGdWTTM4Q01GbDJGSWtueHJ2WGJscERGRmFx?=
 =?utf-8?B?VTY4S0RaQ04xSURmQnYxM3l5RmwvYytuMkt6Kys1K1JrNTNqTTBPTDQrOFNX?=
 =?utf-8?B?S251dmtEWE9udWhOQTVYS2p5bHhaNDEwTStoWStuNDJVT2EvUDV6WlFPUUk3?=
 =?utf-8?B?R0FiNGd0U1F2MU9hdHNRa2U3Zm5jUG05TFZmbFhOeDE1Zm4yV3RNVFpnTjhR?=
 =?utf-8?B?cVEyc1NwdG92anJmUjMrcEQ3YkFQbnVjakppdHZMb3RXT25XWVVxa0JWR0Fl?=
 =?utf-8?B?bnZBNUJKZ05waXRnMXRTSzZDODhTOWxsQTB5dGttb0l0YTRkWmdiYlg5QmlF?=
 =?utf-8?B?MWs5aldPZE9aNlAraGc0dlV2ZmtrbEJPTmJjSDhHeVVVTHcvR3AwZmRoNEtY?=
 =?utf-8?B?UGIzN3Y2TUs5R08zVVZabXlqQkhmS1BmK3U5RFhFNlZmdmxRUFkwOTY0U2h0?=
 =?utf-8?B?ZDFpekpQSjh6VmY2RVRxY0VMZUNDcGxiV2tPOFkwY0cxcEtZQWhWTCsrZEsy?=
 =?utf-8?B?UUNYay82VjZRZi9oRElEdTNHRnplcHNsckt5Q05PZXJueXRLcmhTRmszemQ1?=
 =?utf-8?B?ejR6dUhSSG40K3dBWDlHV2E0blAvMVhpZktTZ2Q3QzJyMVRmWVp2eXZ1cGVo?=
 =?utf-8?B?WFFRaVoveVo2ZXZhamtTRG0wTXpyUzFkZjhhU0pOYXFmdmxTbVlxc0Rid1Ni?=
 =?utf-8?B?YU9NNEc5SFcxWXdDQlhscG5BN1o5S1RaeFlUdUtwMCtJd1ExL1dYcllWbXhz?=
 =?utf-8?B?aDQwOGNXUHFDeXdqQTB0SWZVYlVmRnlNWHAydlpsL1ozWWY2cFJBUW02RTBu?=
 =?utf-8?Q?GPLxchQCFAyMK0Z3Y9G2AXHo9SVaA6QD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVo3RWtxUlRaUzBaSEg5NXZCeE9JMHdFdGlibWlMbU8rOWdmSy8ydGhsZ0or?=
 =?utf-8?B?OGtDYlJBZHkwbUxkbURYMnJpQkRiZTE3dFFiYjhXZlRwTkxwWTBJOEdXZjJr?=
 =?utf-8?B?eWsxcHZCM2hGTktBdG44RkZWb0hWTC8xQkdtMmsyRmlURmhvWFJIdmVSUlRn?=
 =?utf-8?B?QWhXbThpNGNqY2xmQm8zMlNlOG85RHZjRTZ2Y0t6akorRyt2SXdDdnpHMnRD?=
 =?utf-8?B?S3NMbGNOR3ZhcnhpYmNXM1VrZ0lLakdmY0EzNENuOHphMUw3VGI0NE1HZWFy?=
 =?utf-8?B?dDA4YmY5a2lnaXZXM0srMDRBTW1LVkRsNjZhZlVXRDIxMGQvdTZpd2R2Z3BR?=
 =?utf-8?B?OUNObUNNUVpoQlplcDZHSEQwU2x2YkpDTUZjNzIxUjNQV3hZeUNLcDZGVnJ0?=
 =?utf-8?B?RWxSeTBQNklzd1E5Mm83SmpwY1VMeUdWamc1VldGeVlBT0JZZ0ZYVnZWMi9W?=
 =?utf-8?B?YXpkL096K2psNkJDTjh0OVZydGk2c0VjWmdDUzF5SzhNdVBMaUc0cERTLzdJ?=
 =?utf-8?B?UnQyeFZDU0JDU1NnUjZxNncxRnFwckF6elRFazBoZlN2bjh6MG1KcnJMdHFM?=
 =?utf-8?B?blBCSi92QVgrdzZaWDVHRGw4Wkgxa011WVNlTjBtWE9iSkdCdjUwRkJsU2d0?=
 =?utf-8?B?Um10UlhRTTR4VVhvUUhyT3hrcXNQMFpRTXFsN0MyWG1tRUw5eXFVRysrQm16?=
 =?utf-8?B?OUFrUU1Vdmd6ODVnZVpXYXRBbXRpYlRYOG5obStncnNsY3duKzJCaEN6ZUoy?=
 =?utf-8?B?YTFwMjZOQlJYYmpraXcreXhFMjQ4T01vYXpHdmZhb3Z2VDBkU01LOFMrS1Qz?=
 =?utf-8?B?Y1hURDAvR2lBZUl1cXd1TFMwaVBlZzZLY2dsSHFDdWNSRnhjNVJCR0IxUWJE?=
 =?utf-8?B?dzh0bDFkemxkamRVRmd0ZCtqOWZXQUM2Z1VSczNMdksycUN1a20zUFo0UTlJ?=
 =?utf-8?B?Ym81L0Jla2pvYVUweCtuM3VxUnJQY0xwU1dGMjZXVTB5SFArMVN2TXQvNWxv?=
 =?utf-8?B?V3NCcnZmTjFoMlY0TE85aTc2dksrS1A0T3V0UCtPL2pQblJuUVpua1d5L3l5?=
 =?utf-8?B?V2FZVmhOb3NnbWZDT2FKblVDNHh4VnIvZjBIaTgxelQvNEtLVmZYMUpNd1NY?=
 =?utf-8?B?WVpUeFlqUWliS1h5Z2poMXE1TDhnSERxNnQwekg2cFZkNVdzVTZLY3daT2w5?=
 =?utf-8?B?QS9nVmJtV2NDRmk1c0hDOVpmQnNHcUpqOEhQUHZwT0xQckdnMU4zN2Ezd3Ro?=
 =?utf-8?B?NEJFV0d6Tk1BckJnVjRZRndxUFArTUYxVVZ2T0JVYnV1MTF1b0R2Wko4R3Y5?=
 =?utf-8?B?VU82akRYbHpQYnZPZk1leThTYkIweWVYM1VMZXprbjNZUjRwRTJ4Ykk4MUNk?=
 =?utf-8?B?a0VJNDV0MkhMeWNBK3JKdFljTEMxQk5rSThBVFhkUDQwNmlDV2VRY25SeXY1?=
 =?utf-8?B?OUsyMmx1SEpoL0xBbDB4N2MxclkzMEJTVWVJclcxVTRmVTlKeFNyQWZ3NlBN?=
 =?utf-8?B?VVFNdFdkbXFWejdvTUlqT0E0OUxJaTlyb2c3VkNEMnUzb2NFZDhPWThZRlhK?=
 =?utf-8?B?V1hCRWRvS0VNMUlhZ1dQYitqaUVMeUFDU0lKclMzTC9iTTArZUxJZmxWcjUy?=
 =?utf-8?B?aHlZWFowNEdpYlVvUzhHQ1JTekNYUXdVcGdGTHZRbDhObTk1UG1vejQvL1h6?=
 =?utf-8?B?ZDdRcHJ3QThkaCtJdFFGWFdnTG1hNUFJeFFOTC84N21PbksrWmR6eEZSMVVN?=
 =?utf-8?B?KzN4c0p2VVZEVXoraFFXYU1wZnhEQ2M1QWRtWWVobzN0Zi94Y3JZODhKUWZK?=
 =?utf-8?B?bVYvYWFjeHc1a2ZvcTB5ZUltaVBZSlpCL3JSSHZvQ0szc1FoRklhU29Jblp6?=
 =?utf-8?B?d0huUHJHWjNrS3ZwZCtTNFdqSGNabCtyK1pPWG1OekNyRXp5NmNUS1hMM0NU?=
 =?utf-8?B?VTY3cGFST1dwQ0dLUkhRTXByNFA0VFBKRVhqQXcrVmxSNmp2NS95amtSTldD?=
 =?utf-8?B?Y3dXZjlqTHRuQnYwV3pUdTRwLzhSdHlOM08reW0zcXZBQS91THhkSjhhZUd2?=
 =?utf-8?B?dmdxVk5tdU9ic0VUOUl2SVVQYmVzaEV6aTFTOEhQMVFpQ0YrNis3dFluQ1pp?=
 =?utf-8?B?SURoVmFqeUthbGtoVjFDV3RDMndlZ2p6dDN2c1BxTDNhcGZUZ3BTNkZuejVO?=
 =?utf-8?B?TXlZaWF4VXdaWFM2Zlhnd3d0bWlvaUNac2YyUHhVV1RxdGZPcGYvOEJscklH?=
 =?utf-8?B?OHlsR1pnZEFnWnBWOFp2blRTMXdadjR5YUpnYnE1aEsrWDl6dHpwaDRFUzhI?=
 =?utf-8?B?QmxBeWhEYi9kaWcwbGNkNm12Q2ZoVDJXK2NMV3djNHlocUx5bnFQUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eb2028e-417b-4044-0282-08de3fd9ed79
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2025 15:10:35.9377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kZI2znFzmB4g6Wt8rLmgpNfZbAvMkEz8Ll2QsyKtf6ka3KOBVrQ2S5av+Be4qtblFpPxbClmujtPctDUweoE1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8471
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251220_071054_543367_CE1C2308 
X-CRM114-Status: GOOD (  11.21  )
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

On 19/12/2025 19:21, Frank Li wrote:
> On Fri, Dec 19, 2025 at 04:45:34PM +0200, Adrian Hunter wrote:
>> Enable Runtime PM for the mipi_i3c_hci_pci driver. Introduce helpers to
>> allow and forbid Runtime PM during probe and remove, using pm_runtime APIs.
>>
>> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
>> ---
>>  .../i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c  | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>>
>> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
>> index 458f871a2e61..1b38771667e5 100644
>> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
>> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
>> @@ -18,6 +18,7 @@
>>  #include <linux/platform_data/mipi-i3c-hci.h>
>>  #include <linux/platform_device.h>
>>  #include <linux/pm_qos.h>
>> +#include <linux/pm_runtime.h>
>>
>>  /*
>>   * There can up to 15 instances, but implementations have at most 2 at this
>> @@ -208,6 +209,18 @@ static const struct mipi_i3c_hci_pci_info intel_si_2_info = {
>>  	.instance_count = 1,
>>  };
>>
>> +static void mipi_i3c_hci_pci_rpm_allow(struct device *dev)
>> +{
>> +	pm_runtime_put(dev);
>> +	pm_runtime_allow(dev);
> 
> why not pm_runtime_enable() but you use pm_runtime_allow()?

That is how the PCI bus does things.

There is pm_runtime_forbid() and pm_runtime_enable() in pci_pm_init(),
and then pm_runtime_get_sync() in local_pci_probe().

Refer to:

	commit 967577b062417b4e4b8e27b711220f4124f5153a
	Author: Ying Huang <huang.ying.caritas@gmail.com>
	Date:   Tue Nov 20 16:08:22 2012 +0800

	    PCI/PM: Keep runtime PM enabled for unbound PCI devices

	commit bb910a7040e90a0ca3d3e8245d6d5c128a5d1287
	Author: Rafael J. Wysocki <rjw@rjwysocki.net>
	Date:   Sat Feb 27 21:37:37 2010 +0100

	    PCI/PM Runtime: Make runtime PM of PCI devices inactive by default


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
