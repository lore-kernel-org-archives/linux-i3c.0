Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76298C56208
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Aug 2026 17:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=pLG56QaYKfFqJtYpoghc9AiMO0scr8mh+M/0exfPpLU=; b=Up6xW/o3GxiiHoLoktJUz05g8r
	wg7Xwu9FI5PtDWwAZixPRcyRFrIjjMDtUWPXYgwHW+b+BOEmdch7dP1UhrdT8XvdTaMhOCQW/nsgr
	TUnwPKE/d9zLCRIP4eZEPYwS9/lJThDU2fZD9Oks7fXRJpEDxulV6OOB3L/6oXVU99KKn4bkA+wlG
	OMNKSOtiVAD11rbJ6NPrrfSQ6eYHu1pdR7UfpI3kl7slO7/i8lfCvgnH7SFKkOsBImsQu0txFaeiW
	14y22KA12Ug2BeG7dRYxUPd7NraDXVOjWohIVPwG33bBLLADRMYAua0JO78rgvqHbyY+uWOKwjxuC
	m4/s5/lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1ei-00000006LRC-0ipr;
	Thu, 06 Aug 2026 17:13:20 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1ef-00000006LQW-3h5F
	for linux-i3c@lists.infradead.org;
	Thu, 06 Aug 2026 17:13:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786036398; x=1817572398;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=mDQxIJiXaKGbV//7hTDuXHtvAFIhobaWKQZebSOIhzA=;
  b=WyAW/Ovh5mWaNTm21EGXe5l5ze667D9Sht3xTy9IJj/Q+fUNyUcFp042
   kerQabEo4WnmgpvLxNKMWVFjVBLFgpl+It/WGwnCS909dlC79WXnhzXpT
   uluwKPcGLvFnltlQKvTS2Nf8OqxyEn/Jv77CckiZnNZceVM267O230cCG
   6mUvHzVVu/b5RZ4q+L9gBzspVUyKoInzXVM+400KaCCrB3AkULWgYkADh
   aX2CtE/Cke+0HmDZ7cEyvcxihVm3DFuJfTTeUNGnkJJDflRtcEPYYHJZS
   dn/9Sph944ROFpeekPJNkizxE1OUs/0HDD6IsOyCCFcOP82WCJ48Hq9kS
   A==;
X-CSE-ConnectionGUID: bxfcsij6RQ6Anylo/Bcqrg==
X-CSE-MsgGUID: 67u1KyU4RgmU9G9hF0YHww==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="86489150"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="86489150"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 10:13:17 -0700
X-CSE-ConnectionGUID: 0rQi5ghgSLWSuxgCuBWxUg==
X-CSE-MsgGUID: KlTcia49QsGhNdIZlY4H6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="266384948"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 10:13:17 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 6 Aug 2026 10:13:16 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 6 Aug 2026 10:13:16 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.50) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 6 Aug 2026 10:13:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GLVTDIrXkstxsPP0GnBTsar8zsHnW2Wb9RYFgdqvc/yKLbUWBwbLX+cZuEWhSByvaBmmyw28+AHGGCfrzCepCu6sQx+jnptAT6x/aIF87rZR/9wxAqnGjA/i+DUPwlBWMiuby23i65MguFUSQocELDPg6iCdI3LxGYnvP6bs2fLDwduW16qxDKiZ6SfT6Rm15SEPFdMd6HIQE5UepMSyEw64ciNonI85X/lAvP5AP6cHplWPJxrPGApFMUs89qOqgP9Lukt318Hswyhj5rchJWSXxQDcFKfw18Q0RGvcLarMSJXXdZMQVRORct8gs+iq/wdTsWaRbEq7yXee1sicoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+7kktsBA96C8v8+GOlYV1TLSkXu4uAdiF8Cp81wG4S8=;
 b=Qk+8yFilBphY8r/mj8Dgz3dZ2fTJ7knLSAcmnsQqz8KBdfXSV2dxXFdMnWg1CcvR/aNdw+UvJ7OAvC8AbifAnbwOWVN5Gczh2ORO6keeakMPdD2HPip5YS94F+FYvsQXd2lBidaPJfI/1RUL0NOhNcxDDKfNcf+jea1sFnujZrNwwATLPl5ebvjZiw0P+fNkXziCWx2rEZVY0CGjPRtyZQ1oKcn98OgxeE7MyKdDDxETxQpPb31LzLNsVB+0fy0jAUrzFBLgI5k3eVq73og8k1izo67QIUUw2nTuTCjWQxJ+l9Y2ASFR3lR/wuhMWwptIl6//layeHriDuIeJoIpXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by SA1PR11MB9526.namprd11.prod.outlook.com (2603:10b6:806:4c5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Thu, 6 Aug
 2026 17:13:14 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.21.0292.019; Thu, 6 Aug 2026
 17:13:13 +0000
Message-ID: <afff42fc-4277-400e-8948-ab67ef471bc9@intel.com>
Date: Thu, 6 Aug 2026 20:13:09 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 07/14] i3c: master: Fix potential UAF in
 i3c_device_match()
To: <sashiko-reviews@lists.linux.dev>
CC: <linux-i3c@lists.infradead.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, <linux-pci@vger.kernel.org>,
	<Frank.Li@kernel.org>
References: <20260806131857.119830-1-adrian.hunter@intel.com>
 <20260806131857.119830-8-adrian.hunter@intel.com>
 <20260806134524.6DEEC1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20260806134524.6DEEC1F000E9@smtp.kernel.org>
X-ClientProxiedBy: DU2PR04CA0335.eurprd04.prod.outlook.com
 (2603:10a6:10:2b4::11) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|SA1PR11MB9526:EE_
X-MS-Office365-Filtering-Correlation-Id: b0c19c7c-c207-4ca9-91aa-08def3ddffa0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|10067099003|56012099006|3023799007|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: whITlM+MTf4HYmUrbLg1kA39539+tucdmZkMO1VUDl/sh5LHxoZ7OPU3idTCoFD62t17yps5i+OKMXJDCfwl9D9VNpxROOtA3ByExxa5GOzrsberaqN80PKF+qz0TQ1Okq0BoQ+OpgU094QAf1BG8mKQ4Wc3bHXUrCPzBTKojfG8tF7euKh2BVk2ncqUUM+7QpeqcWuWT3722hTCFpyxPbrb6pnH6Ox4P5qL0Zz6Hia1+PjoEknc1ZCJX7tWV7/xVMD4vIAfW9ky9pJoRI5UxollBA3eoUAp5j3lv4A5fqwZ4+JlUu6IMJuAvUbAf2280+h3M/2riJ8QsLSEvwK/6FCsreOA0M5EPTURySbKr0NyEbMYaY2QSEXpYUO58cSae6gfsLWAk1gyNo6LL5n6Mgmsl08Q3CBGYRyJme6swTjI0rhcLEyVXpI+Y9DgxjtMq5Hal9PPjY6g9t1HuehH1BTmUpYCyGGjA69bhpioDptdpLHcQzQPVKApBOQH2ZQ7seil5obIMxJ8R5wiRCMkgDSGOJYshyF9f7q4UHRh9phJkwYrRufyvqo9O32Cpxp2cPF0alQzQOlz+vZHBSukcgV97MDv/qmxIEMz42DJkcAtRksZ/upeO1ztX8zAFelNzJj2oIyEMk9WgOhsxgUUJ2Dgkr7h9d/ptl9hBUqLO6s=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(10067099003)(56012099006)(3023799007)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXM1a28rZ251MFVIeGRNeFdqanFvQVpyUHU3Z29iVVVyZkIvWEhRZHpEeThS?=
 =?utf-8?B?TzZyczdtT2M4STdLbVRFS2NwVmN0eDllMWUvSzY3QlZoMzZKRmxYVkZGRi8y?=
 =?utf-8?B?Y2dnaUEzSWdhTjZNZlpUR3JwUHNlZWhLdXY3YUhMVFUyQS9yV1Z3ZWZoSllo?=
 =?utf-8?B?cDk0UzUxcmg0a21wWjNoSlB5aFZWNlNHZDFXS0hUUnUwaVd0d2k5QWJLRDht?=
 =?utf-8?B?ZURuNmRvNEFjc2Vtei9hcVdtNmZYc0pxZnZsc0xWRUU3cUxla2dpK040eEh5?=
 =?utf-8?B?SzJGcENXRjd6R2tJUlpCU3ZkZWo5bGZvc2V3NUVKeHJ2KzRaN0NCelp4emlM?=
 =?utf-8?B?Q2RuVU9lSEgzQlcwcWtkOHBpY2xuYU03NlhreVd0V3ZKanNOMk9PUWZhaEVl?=
 =?utf-8?B?VG5KMHVVS1d1Ull0M29hR1RtZlZtSHFZa2FUelJGUHB6Q2pQOERwVWJHL3hX?=
 =?utf-8?B?MXc1b1gzUWtKRUs3RkQrUlYxRUNVOUxtYXozWTZBVU9iZTAvMXpOcEk4UVpo?=
 =?utf-8?B?cS9vTVBnR0R5cWJzajJsWXhUMk1ocXgvR2NjU2Y4YzdCeVk2TlMzZUdCdmRU?=
 =?utf-8?B?czJaM01aODNzT25xN3I3M1puOXRRaHFLdUlmb1hRVGtka0Yva2R1V2tPL1ZK?=
 =?utf-8?B?NlljTDBITEE4K3plR0lrNWRXbkY5STRYbFBBZm1Vb0s4Yk9zSW9tUjJmM1ZT?=
 =?utf-8?B?Tkt0RDF6NzVNWjRXMWtKRnZySHdEQkc4ZkpTWUtEeTlhZmVwanFVVDhOTlls?=
 =?utf-8?B?N3VQdWovV1lyazJhL1BIdWwwWnUvQkVDaEdPVHpER3YvL0tSUDFJSDNXa3Uy?=
 =?utf-8?B?Y2FKdGNpQ092UEVFeCtVT0xxV0VsUnIzVGNtVTgyQlBndEdhdU1VektiZmV5?=
 =?utf-8?B?UU1IY3I2Sm8yenpOanZxeitINU5VY2FSYkVwTVI0dlpUNVVOcTI3K0w0NGI3?=
 =?utf-8?B?TXh5NEcyU2E2bXdMU1pFc2xqd1ZlVm5QbXo5TGYycWVkTUxKMjcyVG5Gc1dS?=
 =?utf-8?B?QzZndDhKZ0Q1dTM3VXlURHFEU1QvMmx3QW1Nc1JMbWQyY0NWQzBoZXZQUXp2?=
 =?utf-8?B?V3M2U2tDNFZ0RFRMd3B6NmQrTjNvTG5iMzJYaHM0a041aWVKUFBFNDhHS0JK?=
 =?utf-8?B?QmRIdkhTLzBUQnZjRHRuSmlDa0NSWFlzVldYd3hGUEVoWDJ2am1JUnBGUVdk?=
 =?utf-8?B?V2h4eEF5czFJZHlZaWpUU0F4OW83VVNiMHAzL2tkOG5OWTdsc2h2dGxiN25Q?=
 =?utf-8?B?cmNYbW1rMEptcm8ySnhHbVFYWTF6Y2k0UzRKT2NreFB2NHQvclc0b3JPTVNn?=
 =?utf-8?B?Z09KTEYxZlh0OFFPOVlvZkp3a1Rzb0RHV3FoL1FqSVRPc2Y3ZW5BTHU0eERv?=
 =?utf-8?B?NDNCamd5TmRNZmJ6THdRKzZ0U1VJc3hjOS9ldlh3M1dsRWliSWNjNzhkUnZW?=
 =?utf-8?B?VHZicmI4bWppOHgzTFF5M3hRR0ZaTkJoSDc2UmN5dnRQS3BuMDd2c3YxaGMz?=
 =?utf-8?B?cFcxYUl2eld6M1UwMjM2eVhJMStnbjdzRHgzMGZzenhpdk5wYXo0Ync3ZnM1?=
 =?utf-8?B?c09DOHVDV214RWx1S2FNWHZKVmlYMy9hWGFiNGhqZGJCbEZaZHpmc0JXT1h5?=
 =?utf-8?B?c0dMcU5OdFZzMUVDamIycUdCWlJmemZQTmNNTENpWm0wOU03NmhNbTlZS01r?=
 =?utf-8?B?c0xGMjlYd0ZhQWhZdmRDRnFJY2FzbThGRTV6NURuN0djM2YvU1FFSVlwY3Bj?=
 =?utf-8?B?UkpEK1NjUlFyWk1QK0wxZERodU0za0EvQUJ1U09EcG9NWWNybWpJYnlpWVRl?=
 =?utf-8?B?TG9vSXhrbGQvRndXcWliSGJPUTNMOStUMVcrVG0xb1pKcmU4ZEdQeGQvNmhG?=
 =?utf-8?B?N2hkOU82c1dVRUQrMVJkMzBnREY0UWNZRUJ2WW9MaUgxUWQ2VEQ4RTd0S2l4?=
 =?utf-8?B?UzEzWjl0eCtNSkJWcitxa0lqRDFUYzJTZ2kxeVVxQnFFSjhsUDFWem5NU3ly?=
 =?utf-8?B?VHlzemwydXNsaWxzSXo1S1IwdmwzQUVFc3E0OXJ1VHZJQ2JZeEpRT3lNZ1N5?=
 =?utf-8?B?ZEt2dEMzZzFFVVpHUy8vYUZIdThWR1pHdHFsdlZIaDF6cm0wSHppd0lib1pj?=
 =?utf-8?B?ZU5TR0tkbncrYmdjajB4dHdNWEVMSEdaMUJhM1lHNUlQRWNUL2xmTVNKcHQx?=
 =?utf-8?B?YS9NNUJ1Mnpua0Q4Y05RU2E0S3h1WXBEWElpUDZlN1E0TFdwQUNueUJ0Wk5x?=
 =?utf-8?B?LzF1RVc5aHZPRi9LM1krMm9lUkpLZmlJUG1zNSthS3pIREZXSHRCMi9nWUZv?=
 =?utf-8?B?N0ZhOHV0K0p1Z1JtcTFPNnl0RjdmdTZFVWhnMVhWYlNtdDBVb3U3VGZ4TUg5?=
 =?utf-8?Q?46+no91WkS82JDHE=3D?=
X-Exchange-RoutingPolicyChecked: IgjCrt954jWe34VjkioqhxbI6/U4yB+xesdSCFrJuESd16xRytIZOADl2lsK1loS4ffzN4mRVcRXUTjJLFaW4rByNogT4eVI4NlkpPN3cb9gA8PNmBeM4wrLACxIWuWioBJeEfjWKh9Yp0iacUIcKHEyUbhd6OCGQV5UZaLT+5SVZ3QIX322lDZP+4PxldEaJqQ8z3RBWixEqKgqZkAiNBjkiio+uyaV0BKk2TuKSAAAUwjqKM2RP+TGiDnGzqGbbClEWdeHUbCKHRM2BBLl6M6esvTHiF7PdTj+a52EJ03vG/qbHRVEmUKNaTnIOKPUWbrBsuJvjpiYd7re+uHUCQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b0c19c7c-c207-4ca9-91aa-08def3ddffa0
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 17:13:13.7954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PR00mplJa6jQ1CH86dkstVqSkTFAw02+M2ZcP0275fZeLKhLXHVOvJYHMPVrCKmaengEmwfe6UmC1X35P1aFUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9526
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_101317_976305_2B36F6E2 
X-CRM114-Status: GOOD (  24.37  )
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

On 06/08/2026 16:45, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Removing the NULL check for `i3cdev->desc` introduces a deterministic NULL pointer dereference during device unregistration and registration error paths.
> - [High] `i3c_device_get_info()` dereferences `dev->desc` without checking for NULL under the lock, causing a NULL pointer dereference.
> --
> 
> --- Patch [7]: [PATCH V4 07/14] i3c: master: Fix potential UAF in i3c_device_match() ---
> commit 4b5a3c82a1c4c5f9bf31e925977c2286520960fc
> Author: Adrian Hunter <adrian.hunter@intel.com>
> 
> i3c: master: Fix potential UAF in i3c_device_match()
> 
> This commit protects access to i3cdev->desc with the normal-use lock to
> prevent a use-after-free when the descriptor pointer is concurrently
> replaced. Since the descriptor is assumed to remain valid while the lock is
> held, the NULL check is removed.
> 
>> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
>> index ee771ac0b203e..83e04a2c202a9 100644
>> --- a/drivers/i3c/master.c
>> +++ b/drivers/i3c/master.c
>> @@ -347,8 +347,10 @@ static int i3c_device_match(struct device *dev, const struct device_driver *drv)
>>  	i3cdev = dev_to_i3cdev(dev);
>>  	i3cdrv = drv_to_i3cdrv(drv);
>>  
>> -	if (i3cdev->desc && i3cdev->desc->boardinfo)
>> +	i3c_bus_normaluse_lock(i3cdev->bus);
>> +	if (i3cdev->desc->boardinfo)
> 
> [Severity: High]
> Is it safe to remove the NULL check for i3cdev->desc here?
> 
> If a userspace process writes to a driver's bind file via sysfs concurrently
> with a device registration failure, bind_store() will call
> driver_match_device() and eventually reach i3c_device_match().
> 
> In the error path of i3c_master_register_new_i3c_devs(), i3cdev->desc is set

i3c_master_register_new_i3c_devs() adds the device, so the error path
means the device was not added, so it cannot concurrently be being bound.

> to NULL under the write lock. When this code subsequently acquires the read
> lock, i3cdev->desc will be NULL, which could cause a NULL pointer
> dereference.
> 
> Similarly, i3c_master_unregister_i3c_devs() locklessly sets i3cdev->desc to
> NULL during teardown, which can also race with this path.
> 
>>  		static_addr_method = i3cdev->desc->boardinfo->static_addr_method;
>> +	i3c_bus_normaluse_unlock(i3cdev->bus);
>>  
>>  	/*
>>  	 * SETAASA-based devices need not always have a matching ID since
>>  	 * it is not mandatory for such devices to implement deviceinfo
>>  	 * CCC commands. Allow them to register through DT or ACPI.
>>  	 */
>>  	if (i3cdrv->id_table && i3c_device_match_id(i3cdev, i3cdrv->id_table))
> 
> [Severity: High]
> Does this call to i3c_device_match_id() have a similar vulnerability?
> 
> i3c_device_match_id() eventually calls i3c_device_get_info(). While
> i3c_device_get_info() does acquire the normal-use lock, it directly reads
> dev->desc->info without checking if dev->desc is valid.
> 
> If a bind operation races with device unregistration or a registration error

As above bind operation races with registration error is nonsense.

Unregistration path was fixed by "i3c: master: Fix info leak and UAF in
device unregister path" currently in i3c-next

> path, dev->desc could be set to NULL before the lock is acquired, leading to
> a crash when reading dev->desc->info.
> 
>>  		return 1;
>>  
>>  	if (static_addr_method & I3C_ADDR_METHOD_SETAASA) {
> 
> [ ... ]
> 


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
