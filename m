Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE25C3DA4A
	for <linux-i3c@archiver.kernel.org>; Mon,  5 Aug 2024 09:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:Cc:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=HMu8x00kktcnnumZCAzI3cMhNCgbEQZDGD5WGvp4Ieo=; b=ulvxveXUEdAdbldeNUxLD0eEFx
	ZExjaqMTWUjN6EAdqxNYwBQnRssz2lZIt1gkAY+V2NzlVMbCcLlZwZDAy6f9v3Pw9Jl7GGC0y2qNk
	YkxzEtPFNJBReZ/HzMWdpbE8Ot8UyEsKzWwz+7wfWOLpyeHqvHUxfrFZtJeqa0IcoTyhbbRm0lC7z
	o6DCXYWny6LLmJnr/y2fozvBSRF/zMj3KUrpoQNbLN0/yw4UgOI1DyTzg6YmepAgnMRJb6jrkFk6k
	R3F4+c9h5xZO/G5PX445vGsxT3ozg1Oe68AgiJ2jsKbLw9caY9wxFghGHyIaReYDr2Y2CxehsWX0F
	IVuoQfEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1satyr-0000000FHRE-0QGn;
	Mon, 05 Aug 2024 09:26:17 +0000
Received: from mail-mw2nam12on20631.outbound.protection.outlook.com ([2a01:111:f403:200a::631] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1satyo-0000000FHQ4-1cJ0
	for linux-i3c@lists.infradead.org;
	Mon, 05 Aug 2024 09:26:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UEVSpKW1LnKuvSICC5xLnQoOvyUxQD5ra0nNNXsd7spUZCvm8rvQbfW4G7gbmF+jZlfiRIvav50+ELzcnU6sxp//p7ljuwD13LJOMYuBthCqgQ8V5dAYbmTeYCkoYRG4GUcLecLNAzawtx29SYZFq2YbVNeUZpqKutAydIn0wpAvmdp7WGPnCJ2QVfEXxuI+Nu+pHPoxLafKntVg73whja6sXBoJ83VDjJBSqOo9dnhEo2r7dDNZvNSUvKngdFNegoFovzmr4PKeYwRlPRs+Xv/ydLvKd4eqlgueljAanmf43Od7sDDJ1sOjwCe4EvYXj/AjoVfIJ/q7gU6BrwcoNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rm8qdHnuc6Y25+FxVLlcErpFsO2l6N+ni82ECPyOhlE=;
 b=TNoEY4azjtS/jFlaWUSRr+yudweNkVbKMaqV9Yq2v0cCTIgIau9HEtwEGXf8rmWTj80aP8rGtKP4S2d0VJcfXm5Q2T2ekr88hPj2L7YIesh2FxLjAixWAVOUVQUZ8v6Daxk2xoa9naiAhyeDla7qT4l5r5zeINrzmTdRHK95N/D255GlCaV0m2Ad2Ig4T1DFCD5wdu6yZxF4FEr7X587u/M2xyjpVXmcPVt82pNyjv6Mt+r/zCwfHAEp4Dlfhy8kRMXPUeg2YtkNnW8s4TuX05FVOO1c5MkYDfcxmxaf3BhLCew9ft7x22bByvpH4nYqFxldimKAqpoBGfkgScMcDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rm8qdHnuc6Y25+FxVLlcErpFsO2l6N+ni82ECPyOhlE=;
 b=cKYAnpdxdrBS5a/28izQFvGscBJMLThfdRU8Sfp0tjif3J4NNiV9Ea/LOzjhT7AReQZsmJlcB370Gyns93jhu4RqHv+ea3YRFWUelD+gmvA/WCfZO9wprpmXgISwtwlsSF+z76nDkvp6KJBj802y2tZttn/nkFBTVpreNlLtX+g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by IA1PR12MB6354.namprd12.prod.outlook.com (2603:10b6:208:3e2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 09:26:08 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%4]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 09:26:08 +0000
Message-ID: <8ec23c64-0b55-4a71-8199-14cb6061ad45@amd.com>
Date: Mon, 5 Aug 2024 14:56:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] i3c: mipi-i3c-hci: Add a quirk to set PIO mode
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>,
 Krishnamoorthi M <krishnamoorthi.m@amd.com>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240724071245.3833404-1-Shyam-sundar.S-k@amd.com>
 <20240724071245.3833404-3-Shyam-sundar.S-k@amd.com>
 <a0f5ea6b-2be4-4fac-8c22-34fc21df84b2@linux.intel.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <a0f5ea6b-2be4-4fac-8c22-34fc21df84b2@linux.intel.com>
X-ClientProxiedBy: PN2PR01CA0162.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::17) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|IA1PR12MB6354:EE_
X-MS-Office365-Filtering-Correlation-Id: 6663291c-c8da-4f26-33dc-08dcb530a342
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TjU2YmpOa1NYRFZXRmp5T1MzMDd0cndiK0VMUUV4MWJnWjFvZWJ2SFY1M0c5?=
 =?utf-8?B?TGFLTm5XaVhKWmlleFhMT3hLdmgwcXV2ZzdheXlraWVLbUgwL1Vpc2F4d0x6?=
 =?utf-8?B?eUdFUlg4YVMzMVVJUlNkWVFyOUg4M1pmR083QWtZRWUwa1dUYXhLc1dxT05o?=
 =?utf-8?B?eVVHUHU5cFdpc2RVampXNzZhVW9teW1YYnFMTzd6QVdjaWorb0w5dGs3eU5y?=
 =?utf-8?B?eXBhcWxDeVBCZ01LM2ozdjNFMHJiL0l6K2lYK0g2OU5VWTVHendJaCtiL3N4?=
 =?utf-8?B?N0tPUXhXM2dMWnFBSUFJdnpPSHgrQXRqcmVSUFkxNEJhQWxZa21KeG1wTkxa?=
 =?utf-8?B?Q3EvUnRsdktNRWVpT1UwNDgzd0ZNTkZYNXdxaWEvbS9nSkdoK1VkMkk3aWFk?=
 =?utf-8?B?R043bXkxbG9ITVFvRGVvdTUzQndYalppcTZkNHEzWkVoS1VVUTZxcE5wQUtY?=
 =?utf-8?B?THY0RmE3U2JsNVNCNnNtc3Jub1U2a29qWi96ckdXVHg1UmU0NmFpUDA1TFZy?=
 =?utf-8?B?bkYyWjNyZHNNYTNrZCt6UXh0SG9zUGRhMDdSNkhsMDc1ZWRSL1FUdlZiNHFP?=
 =?utf-8?B?eVVYRjVnNVhUdkJHRlArb1VTUHY0amZBNExTd2pOVEhTcE9SY0RsaFRLQ2Zt?=
 =?utf-8?B?bEUxemJSeCtURFMxdUVCejVnVS9YM25qSjJJRkc4Vmo4NnFBUUJ2VC9tRTMr?=
 =?utf-8?B?TzJGZHR6Rld6MUtkclAzbXh3UXphbWF3NUIzeXlFKzlyWTBycFI2QVFjdDc5?=
 =?utf-8?B?YzBpSjFKZXVidGs5eDBReXltcnFOS1lnSkFuQ2puYUlLbHp1OUU4WDUxejdI?=
 =?utf-8?B?Y1liblo0OEVBa1RyTk4vSFlFeURZNENMcVcvRFhSeHBEazgyTktkMVdxQ0k2?=
 =?utf-8?B?Y2xwSEhhV2NIOHNNUDhOZ0x3L0tZWEJGdm8xemtxOCtTYzM0WWY0bk03TjNx?=
 =?utf-8?B?UkdmWUdNakhRMmZiWnY1aDNGRzlKZENsV0JwNXNqc3pSai8zTHR1NnBHWktS?=
 =?utf-8?B?RmUzbmFaQVpISGw2c3RMakJCYTBUSkN0ck9VTWM5aVgzU0FDZTVjVW45dzU4?=
 =?utf-8?B?NGVtcWRFZzJYeU1xUEo5TldXNndjdHZpM05zRHdlSjNucmRjbXpmaUpNUTl6?=
 =?utf-8?B?Y09ROWk4UG1PYlV3NHdzT09RZXJJNGxpY1RLS3BRcHRMdzRoczlkT0lmRDBn?=
 =?utf-8?B?S2hWZUpzOGwvSiszdjZZNUhKenR2TWdSR3VHVCtUNVVlSzJNellNTElyMy8r?=
 =?utf-8?B?Skd5VWdXSXRVeDVERkZYTmlCNG5PMXpJSWhmRENpMzl5NldoQ2VmWlh5M2Fk?=
 =?utf-8?B?ZDNvWSt2ZThpaEpiU1FWMlFpNEMyZ3ZHdmFJMCs1ZHBMNW0vRmFLUStEdlJj?=
 =?utf-8?B?QXZUNHZPTmUwd1BuNThhaEZES0loeTV2WlV6TExSZ3VwSlRpNU1kTmlwM2wv?=
 =?utf-8?B?UGYrOVJmK3FJdGNWM2FFdmMvTmNvSUtDYTNrcGp2UG1mWXFKaTVhSGVuK0w1?=
 =?utf-8?B?ODh1Z0ZlRisrZzRnRWNZWlRaTFI1KzFJMnU0V0MybnMxd29XUGhqdkpHelVW?=
 =?utf-8?B?ZXFMRkRTTEhuNFpsWktOT3dwelBSOVRyNk43R09Fa29tRTQrUDhtQ3MrOEhT?=
 =?utf-8?B?U3V2dHJIUnIrLy9BTnFxQVdSWXRDU0RycE9GRUZsbG1VVTIvSzFuUFVDTmNj?=
 =?utf-8?B?UXF0T2MrSVhTSmtiNW9uUWJXR2tpYk4yQklzeHN4SFVvRnFiUk1mN2tEZ2lR?=
 =?utf-8?B?Yi9xTGlnSFpHNkQ2dGg1YXhjaWx1S3pIUE1weG1lY1JlTE5vdGRUTmlRM3B3?=
 =?utf-8?B?UDMwNWdRb0NFSWU3QTZXdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkFGcDdNWDhLaW1kNFVJR2M5Vnp2RWJEMzdvakZ3WWh5ekVtVkxpbWlVNkty?=
 =?utf-8?B?c3dzUmZyZlZ0ZEtmMVJFZE5XeXY4ZlZtYzAxOHZFZjZZdXhBVExLeFZiZHNS?=
 =?utf-8?B?S2RwZzlZT2k3b0JrbEI0YVV0OEJxMm5MZXZrRkVVZHViZzlmUEM1MW91R2tt?=
 =?utf-8?B?ZmtWRHhnS0FwbHg5S3o2b3ZWbXdNd0phZ0ZrM2w0dGRGU1NLRXB2ZEQ2eXk2?=
 =?utf-8?B?L1RTM0g1U3VCTFp1aGZyMktJZHE0VmFoRmF4ZlBkL0J4QlVyMTJlVmowUVEx?=
 =?utf-8?B?RDV6eDA2REprVlNldHpFL0h3enpSQXdRMm5zaE1qaHFxQXE0TXNWTmNPZGZk?=
 =?utf-8?B?NFhxNXg0ZytSOWZQd0xzS1JFckFHdlozb21xUXBZc0dvZHFaTThWODBqbjZE?=
 =?utf-8?B?TmltbGk5d05lbnR6Lzg0WG45SUI0d29QclBjbVFSc1A5TE5oRmRjeWhqYnA3?=
 =?utf-8?B?R1ZpekpEWGY5WW1saExuRTJWTlk2RUdGZThuYWs4TjZJYXhHK0cwVEVaNmJi?=
 =?utf-8?B?VXk2YmlCVlpvUG92L3JVaCtKVEpwV3c2aEwrR0hjWjJtTU5KWTlzakdUcWRB?=
 =?utf-8?B?NjhvVTRjTGd6RkhrVXFwbnpCSndTR1F5ZTh5U0VFaFI1RkNjMGNpMGRIQkNx?=
 =?utf-8?B?NFVqNWxCNE93YXc1Nzl6cmYwdHdzeEh5NllNTkpidjNzY0FZNW1HRDVJOUxP?=
 =?utf-8?B?a1E4WDh0b3NrQXVuQVo4c3hDZUF2a0VJdFp4dTAvTDJSWlVmbFQwODdtOFE1?=
 =?utf-8?B?dHRhODA0UjNSMEhpWHFjT2xoemR3M0RWWmVOa1VHc0pPSTQzalJUN3RTeXdF?=
 =?utf-8?B?SEVkWU9RSXlVTGxLOGRBdXRheFZPUkgrZUI1Y0tSeEt4bnI5WEwrUFZjbjg1?=
 =?utf-8?B?V1QvdDc4V2E0UEVndWI5cXBodGV0UXRtL2xWajlKdlp3WjQzUTJ6MUhLUWw1?=
 =?utf-8?B?dlh3Y0tPQ2JrbmFidC9vRDMzdHRjNnFKZG84dnc5TjRuUWxTczh5TzM2dGRE?=
 =?utf-8?B?NjV6VzhpSlUzaDlrL0YxaGZsQXU4YlZhbXZWWWYza2hBUzhOODRPZXpCM0xS?=
 =?utf-8?B?eVBteEcxblpreGhMVlV3OCszTzd5TU1VenN2NWxybWxnbEx6QmhhLzJ2cHkz?=
 =?utf-8?B?VmdNR2loQzVZR2dqQW0xOWNJZWo5UWE4QTM4SVUwR1dsbzJFb0ZwcGxOcW1H?=
 =?utf-8?B?RDhFZ0dUSit3dXVOUmZYcVJwYTJ1cGVxVi9oR0hsVElxTXZ0Y3BNRkYrdlJp?=
 =?utf-8?B?Vmx3SUJMZ0dTTXQ1aTcvRUFMdFBrTGRJZUtCbjVTK1Rhc1k1ZlBLVytDVTF2?=
 =?utf-8?B?UXVoTldSUGlUOEZsWS9FZkhFbXBzdU5UaEZIZmVwbmdrMlNJTGdic0N2eW14?=
 =?utf-8?B?VElGZGI1cjdqZEVPczRIZlFFcURhRFFNaGJEMXVtSUo1aC94a2VnVFNXN0wz?=
 =?utf-8?B?RVdwZHBNUVU2TVJQRy8wRlBFWGhXYnN5VkRFekg0RUQ2VzlQcWxPSGtwZkdp?=
 =?utf-8?B?LzRoUUtVeExYNGFrRm5VUWNZdzUwU1hjWW5qYzVjT0U1YUcwSk02ZjVtTS9B?=
 =?utf-8?B?WnNVaUVHeHFlUlBobHpDRDBCZDRyREd2Z2IwanRxRXVwaWNEK1pnZ3pFb21u?=
 =?utf-8?B?c2FvSDFFU1JjVFlISWRxdkFINnc0TFZ4b2FVMmMyMUIxMW00eU1vTUY0QUVC?=
 =?utf-8?B?WFEwSFZsV2l0ZmxXdGY2a0EybmV5UjhUYWtMaDJIWmlqcHZRNjB0M2RnNmxh?=
 =?utf-8?B?dDIycUJTL1dqK001eGJ2bzJmeld3bWxEYnU4ZXBiaXhQcDZ3YS80emFKV0FM?=
 =?utf-8?B?SWZEVGhkblV3MnAyeVcwdTF6amxSR1lzWkxvUTBhcEZXd05mdGppcEE1eU1p?=
 =?utf-8?B?TnhWSXZ3RDNqc0V1NkFyMFdvSzRMUUQ1UFZYUU5ySWtxWE90bkxXUUJ0YURj?=
 =?utf-8?B?cjZldWNuUUdRVDArUkRqaXY5NVBybitwTDdiTkhhdmJJano5K2tuK2psZmpq?=
 =?utf-8?B?UzJrQStFZ3EvY0lGbU1KUVRqUEozdmRYam9qRVk4Q0RrS0ViV3diQkNZdzlK?=
 =?utf-8?B?VWx5a3MvajhXenRLanFnK2xEeTdTU1k1aUNFay9Vd3dpVHRsK01pY3NWOEZs?=
 =?utf-8?Q?0HXrPnGCbfjCuy/4OKYlyQgfz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6663291c-c8da-4f26-33dc-08dcb530a342
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 09:26:08.6053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e9oJYSrstoAQWsvEf2XIXy08E8Fnfxxa6mBHaFaiJaKOE+z2xR7UTBCxIlfJ4GZZSagW+3isC8bj+/sd1LMVXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_022614_453913_FE5FEA9B 
X-CRM114-Status: GOOD (  21.85  )
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

SGksCgpPbiA4LzIvMjAyNCAxOToyOCwgSmFya2tvIE5pa3VsYSB3cm90ZToKPiBIaQo+IAo+IE9u
IDcvMjQvMjQgMTA6MTIgQU0sIFNoeWFtIFN1bmRhciBTIEsgd3JvdGU6Cj4+IFRoZSBBTUQgSENJ
IGNvbnRyb2xsZXIgY3VycmVudGx5IG9ubHkgc3VwcG9ydHMgUElPIG1vZGUgYnV0IGV4cG9zZXMg
RE1BCj4+IHJpbmdzIHRvIHRoZSBPUywgd2hpY2ggbGVhZHMgdG8gdGhlIGNvbnRyb2xsZXIgYmVp
bmcgY29uZmlndXJlZCBpbiBETUEKPj4gbW9kZS4gVG8gYWRkcmVzcyB0aGlzLCBhZGQgYSBxdWly
ayB0byBhdm9pZCBjb25maWd1cmluZyB0aGUKPj4gY29udHJvbGxlciBpbgo+PiBETUEgbW9kZSBh
bmQgZGVmYXVsdCB0byBQSU8gbW9kZS4KPj4KPj4gQWRkaXRpb25hbGx5LCBpbnRyb2R1Y2UgYSBn
ZW5lcmljIHF1aXJrIGluZnJhc3RydWN0dXJlIHRvIHRoZQo+PiBtaXBpLWkzYy1oY2kKPj4gZHJp
dmVyIHRvIGZhY2lsaXRhdGUgc2VhbWxlc3MgZnV0dXJlIHF1aXJrIGFkZGl0aW9ucy4KPj4KPj4g
Q28tZGV2ZWxvcGVkLWJ5OiBLcmlzaG5hbW9vcnRoaSBNIDxrcmlzaG5hbW9vcnRoaS5tQGFtZC5j
b20+Cj4+IFNpZ25lZC1vZmYtYnk6IEtyaXNobmFtb29ydGhpIE0gPGtyaXNobmFtb29ydGhpLm1A
YW1kLmNvbT4KPj4gQ28tZGV2ZWxvcGVkLWJ5OiBHdXJ1dmVuZHJhIFB1bnVndXBhdGkgPEd1cnV2
ZW5kcmEuUHVudWd1cGF0aUBhbWQuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBHdXJ1dmVuZHJhIFB1
bnVndXBhdGkgPEd1cnV2ZW5kcmEuUHVudWd1cGF0aUBhbWQuY29tPgo+PiBTaWduZWQtb2ZmLWJ5
OiBTaHlhbSBTdW5kYXIgUyBLIDxTaHlhbS1zdW5kYXIuUy1rQGFtZC5jb20+Cj4+IC0tLQo+PiDC
oCBkcml2ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNpL01ha2VmaWxlIHzCoCAzICsrLQo+PiDC
oCBkcml2ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNpL2NvcmUuY8KgwqAgfCAxNSArKysrKysr
KysrKysrKy0KPj4gwqAgZHJpdmVycy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9oY2kuaMKgwqDC
oCB8wqAgMyArKysKPj4gwqAgMyBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyL21pcGktaTNj
LWhjaS9NYWtlZmlsZQo+PiBiL2RyaXZlcnMvaTNjL21hc3Rlci9taXBpLWkzYy1oY2kvTWFrZWZp
bGUKPj4gaW5kZXggYTY1OGU3YjgyNjJjLi4xZjhjZDVjNDhmZGUgMTAwNjQ0Cj4+IC0tLSBhL2Ry
aXZlcnMvaTNjL21hc3Rlci9taXBpLWkzYy1oY2kvTWFrZWZpbGUKPj4gKysrIGIvZHJpdmVycy9p
M2MvbWFzdGVyL21pcGktaTNjLWhjaS9NYWtlZmlsZQo+PiBAQCAtMyw0ICszLDUgQEAKPj4gwqAg
b2JqLSQoQ09ORklHX01JUElfSTNDX0hDSSnCoMKgwqDCoMKgwqDCoCArPSBtaXBpLWkzYy1oY2ku
bwo+PiDCoCBtaXBpLWkzYy1oY2ktecKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA6PSBj
b3JlLm8gZXh0X2NhcHMubyBwaW8ubyBkbWEubyBcCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjbWRfdjEubyBjbWRfdjIubyBcCj4+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkYXRfdjEubyBkY3RfdjEubwo+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGF0X3YxLm8g
ZGN0X3YxLm8gXAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgaGNpX3F1aXJrcy5vCj4gCj4gVGhpcyBkb2Vzbid0IGJ1aWxkIHNpbmNlIGhjaV9xdWlya3Mu
YyBpcyBhZGRlZCBieSB0aGUgcGF0Y2ggNC81LiBPbmUKPiBpZGVhIGJlbG93Lgo+IAoKQWghIHdp
bGwgZml4IHRoaXMgaW4gbmV4dCByZXZpc2lvbi4KCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kz
Yy9tYXN0ZXIvbWlwaS1pM2MtaGNpL2NvcmUuYwo+PiBiL2RyaXZlcnMvaTNjL21hc3Rlci9taXBp
LWkzYy1oY2kvY29yZS5jCj4+IGluZGV4IGRiYzhjMzhiZDk2Mi4uOGJiNDIyYWIxZDAxIDEwMDY0
NAo+PiAtLS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNpL2NvcmUuYwo+PiArKysg
Yi9kcml2ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNpL2NvcmUuYwo+PiBAQCAtMzMsNiArMzMs
NyBAQAo+PiDCoCAjZGVmaW5lIHJlZ19jbGVhcihyLCB2KcKgwqDCoMKgwqDCoMKgIHJlZ193cml0
ZShyLCByZWdfcmVhZChyKSAmIH4odikpCj4+IMKgIMKgICNkZWZpbmUgSENJX1ZFUlNJT07CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIDB4MDDCoMKgwqAgLyogSENJIFZlcnNpb24gKGluIEJDRCkgKi8K
Pj4gKyNkZWZpbmUgSENJX1ZFUlNJT05fVjHCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDB4MTAwwqDC
oMKgIC8qIE1JUEkgSENJIFZlcnNpb24KPj4gbnVtYmVyIFYxLjAgKi8KPj4gwqAgwqAgI2RlZmlu
ZSBIQ19DT05UUk9MwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweDA0Cj4+IMKgICNkZWZpbmUgSENf
Q09OVFJPTF9CVVNfRU5BQkxFwqDCoMKgwqDCoMKgwqAgQklUKDMxKQo+PiBAQCAtNzQ1LDYgKzc0
NiwxNCBAQCBzdGF0aWMgaW50IGkzY19oY2lfaW5pdChzdHJ1Y3QgaTNjX2hjaSAqaGNpKQo+PiDC
oMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FSU5WQUw7Cj4+IMKgwqDCoMKgwqAgfQo+PiDCoCAr
wqDCoMKgIC8qIEluaXRpYWxpemUgcXVpcmtzIGZvciBBTUQgcGxhdGZvcm1zICovCj4+ICvCoMKg
wqAgYW1kX2kzY19oY2lfcXVpcmtzX2luaXQoaGNpKTsKPj4gKwo+PiArwqDCoMKgIHJlZ3ZhbCA9
IHJlZ19yZWFkKEhDSV9WRVJTSU9OKTsKPj4gKwo+PiArwqDCoMKgIGlmIChoY2ktPnF1aXJrcyAm
IEhDSV9RVUlSS19BTURfUElPX01PREUpCj4+ICvCoMKgwqDCoMKgwqDCoCBoY2ktPlJIU19yZWdz
ID0gTlVMTDsKPj4gKwo+PiDCoMKgwqDCoMKgIC8qIFRyeSBhY3RpdmF0aW5nIERNQSBvcGVyYXRp
b25zIGZpcnN0ICovCj4+IMKgwqDCoMKgwqAgaWYgKGhjaS0+UkhTX3JlZ3MpIHsKPj4gwqDCoMKg
wqDCoMKgwqDCoMKgIHJlZ19jbGVhcihIQ19DT05UUk9MLCBIQ19DT05UUk9MX1BJT19NT0RFKTsK
Pj4gQEAgLTc2MCw3ICs3NjksMTEgQEAgc3RhdGljIGludCBpM2NfaGNpX2luaXQoc3RydWN0IGkz
Y19oY2kgKmhjaSkKPj4gwqDCoMKgwqDCoCAvKiBJZiBubyBETUEsIHRyeSBQSU8gKi8KPj4gwqDC
oMKgwqDCoCBpZiAoIWhjaS0+aW8gJiYgaGNpLT5QSU9fcmVncykgewo+PiDCoMKgwqDCoMKgwqDC
oMKgwqAgcmVnX3NldChIQ19DT05UUk9MLCBIQ19DT05UUk9MX1BJT19NT0RFKTsKPj4gLcKgwqDC
oMKgwqDCoMKgIGlmICghKHJlZ19yZWFkKEhDX0NPTlRST0wpICYgSENfQ09OVFJPTF9QSU9fTU9E
RSkpIHsKPj4gK8KgwqDCoMKgwqDCoMKgIC8qCj4+ICvCoMKgwqDCoMKgwqDCoMKgICogSENfQ09O
VFJPTF9QSU9fTU9ERSBiaXQgbm90IHByZXNlbnQgaW4gSENfQ09OVFJPTAo+PiByZWdpc3RlciB3
LnIudCBWMS4wCj4+ICvCoMKgwqDCoMKgwqDCoMKgICogc3BlY2lmaWNhdGlvbi4gU28gc2tpcCBj
aGVja2luZyBQSU9fTU9ERSBiaXQgc3RhdHVzCj4+ICvCoMKgwqDCoMKgwqDCoMKgICovCj4+ICvC
oMKgwqDCoMKgwqDCoCBpZiAocmVndmFsICE9IEhDSV9WRVJTSU9OX1YxICYmICEocmVnX3JlYWQo
SENfQ09OVFJPTCkgJgo+PiBIQ19DT05UUk9MX1BJT19NT0RFKSkgewo+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBkZXZfZXJyKCZoY2ktPm1hc3Rlci5kZXYsICJETUEgbW9kZSBpcyBzdHVj
a1xuIik7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9IC1FSU87Cj4+IMKgwqDC
oMKgwqDCoMKgwqDCoCB9IGVsc2Ugewo+IAo+IFRoaXMgaXMgdHJ1ZSwgSSBzZWUgdGhpcyBub3cg
ZnJvbSBwcmUtdjEuMCwgdjEuMC4gdjEuMSBhbmQgdjEuMiBzcGVjcwo+IHRvbywgSENfQ09OVFJP
TF9QSU9fTU9ERSBiaXQgaXMgcHJlc2VudCBvbmx5IGFmdGVyIHYxLjAuIEFuZCB0aGVyZWZvcmUK
PiB2ZXJzaW9uICE9IEhDSV9WRVJTSU9OX1YxIGNoZWNrIGlzIG5vdCBmdWxseSBjb3JyZWN0IHNp
bmNlIGJpdCBpcyBub3QKPiBwcmVzZW50IGluIHByZS12MS4wIEhXIHZlcnNpb25zIGVpdGhlci4K
PiAKCkFncmVlZC4gSENfQ09OVFJPTF9QSU9fTU9ERSBpcyBvbmx5IHByZXNlbnQgaW4gdjEuMSBh
bmQgdjEuMi4KCmFueXRoaW5nIGJlbG93IHYxLjAsIHRoZSB2ZXJzaW9uIGNoZWNrIGhhbmRsaW5n
IGlzIGFscmVhZHkgcHJlc2VudDsKCiAgICAgICAgc3dpdGNoIChyZWd2YWwgJiB+MHhmKSB7CiAg
ICAgICAgY2FzZSAweDEwMDogICAgIC8qIHZlcnNpb24gMS4wICovCiAgICAgICAgY2FzZSAweDEx
MDogICAgIC8qIHZlcnNpb24gMS4xICovCiAgICAgICAgY2FzZSAweDIwMDogICAgIC8qIHZlcnNp
b24gMi4wICovCiAgICAgICAgICAgICAgICBicmVhazsKICAgICAgICBkZWZhdWx0OgogICAgICAg
ICAgICAgICAgZGV2X2VycigmaGNpLT5tYXN0ZXIuZGV2LCAidW5zdXBwb3J0ZWQgSENJIHZlcnNp
b25cbiIpOwogICAgICAgICAgICAgICAgcmV0dXJuIC1FUFJPVE9OT1NVUFBPUlQ7CiAgICAgICAg
fQoKTGV0IG1lIGtub3cgeW91ciB0aG91Z2h0cy4KClRoYW5rcywKU2h5YW0KCj4gSSdkIHNwbGl0
IHRoaXMgcGF0Y2ggYW5kIGRvIHZlcnNpb24gY2hlY2sgYWxvbmUgaGVyZSAocGVyaGFwcyBhcyBh
Cj4gZmlyc3QgcGF0Y2gpIGFuZCBkbyBxdWlyayBzdHVmZiBsYXRlciB3aGVyZSBoY2lfcXVpcmtz
LmMgaXMgYWRkZWQuCgoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1pM2MK
