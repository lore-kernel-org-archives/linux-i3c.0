Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85FFCD5B170
	for <linux-i3c@archiver.kernel.org>; Mon, 15 Dec 2025 17:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=nHDsD4r7olXPa2zphcH5K0ycSZMA+ZoeLnXfnFCN7ic=; b=Qr0DJkesJIRrLoQ0bU77stXOgn
	pecw4iypT4IgAb7vGLk13ThBUpJzxx3POtpb4R/V/j2DOoHozTcf453iS5B9id/2C5JsaOrzDSVoU
	CcJytRu2o6OJIz+p5dOkBGQuK/eqmrxwMtz7ky7m3q29SL7eC7DmoHtbCD+Lu2OPwWSC9zM2BoOlG
	2Hwyg0BGF++XsTq4VzTMBzU88icfJbOLyIiB38qEve8cyzhIlg9yDYrUUYIhVDwvi268A4GJLVlhn
	P7mor3l1eqjq6YNgnAXUxvjsJ9Ej6ZH5x3Lw2C2XHo1g2CPWFtDGbvRiOot8r3oeohGGL4WqY0kq+
	qoZbQ9Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVCW6-000000044pv-32Ow;
	Mon, 15 Dec 2025 17:37:51 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVCW4-000000044pX-0J3Y
	for linux-i3c@lists.infradead.org;
	Mon, 15 Dec 2025 17:37:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765820268; x=1797356268;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=MiBcw1uCPKXD1K5Fa6bdaSPnqmVu/7b2qr1c8LgZE9A=;
  b=GJHRH7c4NbZjhamhgDWN5MLb8GBp7cQKIXOgYsk9j2tlsM09a7AYvsPK
   muBA6ueypA+t8LxxGwrjQ7zwt4nJswZyURegBWiqa7sff3vXUYePbTjAC
   oO5EdRyufTClxq+EtdN/HCvZTzKx1tbP9QREtBe4OmWqWqYXKaHMCy6Bc
   FHDKz+2cCl3XA3ZJjW/lmuONuSh2c6we4gL2SGuO07jgEgHO9PuG75l/d
   lroQZI307IxgeQmOcGzdfz20qrbSsvJQlyv+03dS9qYzExZUyX8jolQPb
   EAJdqWbJwaF0nZo32Mflh7p1ewuUPbDPRED1Fb9bZVjuT3H0sG4xk0C2W
   Q==;
X-CSE-ConnectionGUID: 4SLb0gzEQNqvnYkQ+a/8og==
X-CSE-MsgGUID: 4vLb2gP7RsKO8zHasBxsMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67763790"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="67763790"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 09:37:47 -0800
X-CSE-ConnectionGUID: u9Wa8iNTQcOCFLLkBbGfBg==
X-CSE-MsgGUID: anWypJNYTNGU+C9tCEux5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="196876771"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 09:37:47 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 09:37:45 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 15 Dec 2025 09:37:45 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.29) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 09:37:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=utuJxCwDZ5ww8fE1D9Z6cSi9eC9HHNxviU+Biu77wrEAkSLx7RrY5t0UUvMJ3D6OFy5JWTBvOp+H/+YcHvGz2X/zH84aVPGBKIPT/UFpQAseV11czT1ayMe6JxRmj3CJB+BnvpSN9L/Gq4efHlumQU19b9RGbFhn5FCeFw8RY1C2ixgK3+MvBuRomMy2Q6+2/W/cMu9ed4NSwfm9FY+MAoJeXbxBVjccC8bdbaZl+SuOSGP9oXJLXSgK9vUq4iNhXgDCuChHURFNrQ9tnroOMo/r6ezqZ7cwXKum5dCTJd1SuOgtaXFR2VWd1yqKMXKzXsh9K+vUvuDF8yVIsWvkcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iTidqoexuMTRLz418y1Zyz326hRtSBc29muzwMgSF6c=;
 b=cn3mMuelddKX6odu7aVwkggoBj24Bt7OwZu/FKhOPEQG9uA3ie/jIXHKgGhQn+BOU96NcThtI33vsrPfByj0IsF48Cjnu6T0txiNUQJcsDHuHUqAdc6sKTIsTZnuR6M5IJt6q6FK6EJgkRNDpV0vgGtEUrpZ9Hx/tSGv2qqVrNaOiL0m4QGzIVhE8ezzyTRVIFn0HiEeaL0UAO+zz3R1j64W7/3tRUUjG97+LmJmjwQ8v/3r1kR7Kp37YMpNokx9CLtJ4A3FBFQ7kFZrVY5qDU4/hjclFOMpdYV7ZqHf9caHWarPdm6PGvUN/V9squVdHRNKlNRegMEUqP7Z3DFXng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by CY5PR11MB6138.namprd11.prod.outlook.com (2603:10b6:930:2a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 17:37:43 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 17:37:43 +0000
Message-ID: <7e173df5-bbe8-4fd8-ac32-e8f29deecf0b@intel.com>
Date: Mon, 15 Dec 2025 19:37:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 09/10] i3c: mipi-i3c-hci-pci: Add support for Multi-Bus
 Instances
To: Frank Li <Frank.li@nxp.com>
CC: <alexandre.belloni@bootlin.com>, <linux-i3c@lists.infradead.org>
References: <20251211134809.75872-1-adrian.hunter@intel.com>
 <20251211134809.75872-10-adrian.hunter@intel.com>
 <aTr07CVVD0YSN4Ax@lizhi-Precision-Tower-5810>
 <a2f817dd-99ae-4631-8879-8c2f9bc2d6cb@intel.com>
 <aTxU9AgDyi43zDyq@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <aTxU9AgDyi43zDyq@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: DUZPR01CA0189.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::7) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|CY5PR11MB6138:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ae200e2-6213-4e25-edd5-08de3c00a6cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cmlQekpuWm1tUFVJK0JURkRvTXdSWlNMQmprUVl5dStaMldFVnl1Ymd5dWRU?=
 =?utf-8?B?OEJRTXQrcjdCMFJTTU5xejlMUVdWZnN4OGpNVlpoK3BCMlZKKzI4b2UyT0J2?=
 =?utf-8?B?NkJ4V1dzeUU3ZE9Xamx3aDBHWW1XWWplcUFlN1pQalprcG5xb0ZNMVNiQ2w5?=
 =?utf-8?B?bURtYnVmZTBYaVNxTGUxN3puYi9YRnV5bFVvWkEzaEhmSnkrK2d3T25YekFL?=
 =?utf-8?B?K254Q254KzNXaGZLMTBORE9NblhiblYrVnZsa1FBdnllVGRoM2k2Q3IySDJS?=
 =?utf-8?B?cWxTUjVjeSt0V2t3dWVucUxDd1lGQ3ZuM09PTGlETDhRTHh2Q3NKQ1k3T1Ru?=
 =?utf-8?B?LzJROXI0TzRHTEFnVGZQdm82VHR3UWhtcUlMa0pIQU5aYWpBM3JTZE5IK3hZ?=
 =?utf-8?B?NlFoSmxRcjBHaTZKTkRsenVKUGhoVkNlczZCN1JqWmxlUnNYWUlNUnlQM3kr?=
 =?utf-8?B?RlNTUnJxNklENHV3SHVlOWs0alNoRmh2V3VQT2tpckgrNGF5dTI2QWhWNFRD?=
 =?utf-8?B?Wlh1emJXUGRFZGV4T3BpZUtxbVpZeVlsMmtuZjJIbmpXYkM5bFM2bkM2Y0lo?=
 =?utf-8?B?KzFZQ0VUT0JNaXFqdzBwdTVFN2R4V2Fqam5sRE9oTEZ6VnJ2WWJITVBsMFhG?=
 =?utf-8?B?SEhmeElLR0RoT0hwVFRXb01hUjNLbkpyRkNidHFKL0RNZ0dtcUF1VXRPRkQ2?=
 =?utf-8?B?VTMzNUR3Z1VpVkFDd0FBMnRXeFJ5SlhmK21FNUY2ZUJKaWx4YnVWQXJ4SUt1?=
 =?utf-8?B?RlZNKzllb05QSlVVQ3lzL21ZSy9CbmZlVUd0L01hWlpFdHVoREV3dWNwbEIr?=
 =?utf-8?B?RUFvSlZ0RUUxMHhpZFdyNGZIb0FybzE1VmR3NVVOc3d1RENrUkprYlZseHM4?=
 =?utf-8?B?T1BtN3VpZlluL1VFbk9YeVA5NU02RVVORnp4R2ZkT1VRSFdrUDZFMVg1Uklo?=
 =?utf-8?B?QTR6SEFScDBLTzdwQ3Q1anpVMkpYckxZOW1KU3I3WEhqVjkvMzNlVHpEYzVx?=
 =?utf-8?B?eWY5SDdib1lkTDlXZk94cDFPK251ZXNQc2VOcEhuRnRjL1hqeWZQYUxoczVw?=
 =?utf-8?B?QXdlaFNmOE5zZFpXRVJPaW1UV0NmZHZMZm1ibmd0ckpLUHcvYXJpZkJWdzlW?=
 =?utf-8?B?c1hlT1FUd24xaXkzeWhTK3drNU43MDFHK1JmVmdMM0xBRzBmbzMwM3VXcEdY?=
 =?utf-8?B?OTVBbGpLNmdML0xhQzhNUXFZNWdGRUdDMlRaSVZCTjNZcHBHNEtDK3JXQkRs?=
 =?utf-8?B?VzNnbVhidENIVnp5WHk5U3JLYnBhTlJRRHY5cVdGdGpKQllzTUNmb2RoYVVp?=
 =?utf-8?B?c2MraGJsbGd3RGlVK3M4R25OekJrR2J3NEJmVDZad3BwVC9QVGpyNHJPWDdp?=
 =?utf-8?B?VEJvZ0pZbEZSRkxBVGRnMVdJc1BFempIZ0daNnZSSUpRVndHS1I1KzZoVVkr?=
 =?utf-8?B?V0ptU0txVjRlTlM1R2oreUNueWlQSGFQTTk1TnpUcm9KVmVvUldZclByNlhq?=
 =?utf-8?B?aHpTMStwMHNPZlFvaE5PM0Vld2loMFlqY2lQRWNtSW0wNk1NdFhPRzl3akpE?=
 =?utf-8?B?VzFLT1BjZkE1UnZYRDdaU2lmc2o2SnFmK2ZuV2hJMHFUTmhBd2U2QWtjWmRy?=
 =?utf-8?B?bjVLbUlZUDFNdEROT09oanlGTnplZ1piemNIaGtTSEI4RDJ5aHhlc2tYZm00?=
 =?utf-8?B?djRDZXVDV2dDZVBHMXRubURNaHM2OG9GRHV1ZkE2L2Vqc3k0MUpRVTRBSDNu?=
 =?utf-8?B?bXhTNWxwT0dwK3ZKM0ppRlNGMTVrRjVsbG9vZWV2ZElGeklpcitTR3lSc2t3?=
 =?utf-8?B?UzRQK0FGWGdRNUswTDZkT0tpWnhMdHZNOWRld3RFWFUxZ25ZZUZJWENZRnBX?=
 =?utf-8?B?NUl0NERDVGg2VEVpY0VnYXBPNVB2VFpZbzJQMjNFUVpYdzFIOW80ZHljV1Z6?=
 =?utf-8?B?WjNmQW9wU2VFb25DT2k1eVN0WXlCa0lXSFdpeVBsUVlHQTcyMnQwTml6QlBs?=
 =?utf-8?B?Y0V5TGFnZ013PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1JZVG56WlZFcmovdW45ZjRmcHNLYWsrdlV5Vkhsa0hRRS8yR0dDWm02cGN3?=
 =?utf-8?B?NzMzRHBkYVpocjdQampaZTBraExQR2plQ0E3M25RaER2dGJUZkhRNSsvMCty?=
 =?utf-8?B?QnFnV0F3L0d3bUNEa2RZSEQvejNkWE56SzMzRzV3WGZJUUZVS09aVTRTalFw?=
 =?utf-8?B?RFluOTl2d1ZSRUgvWDBjMXNTb0lXREp6RFc5M3h2VkcyR3VHSlk1U0pIbFFP?=
 =?utf-8?B?d0ZZNmJUVUNsckdOZUZ4OEM1eTZyYW1RcFh1bVEra1UrVnZWekZMQTJNemw0?=
 =?utf-8?B?SWk3K2hmMWNZdGpGMHNnSThja3M1WTVuMlp2ZTJYekdIT2hoVzNQUWc4K24x?=
 =?utf-8?B?U1lmZEtrZkFQc01jSEFWNzR4NkJ6d1VscVp5d3BWZHN1bUIxVzZTYmdVVTVS?=
 =?utf-8?B?eDJRZEhUVkMrUkRYWkNkUEtCU3JNRitMMWlCdmtRRktkT0NqT2RXWUlvenZQ?=
 =?utf-8?B?QVhkZ3VOVHJWUmJ4b2t4a1J5TUJYdXByRzJOYnlyMys2d0dlWitoZklDbXM5?=
 =?utf-8?B?MFVZZEJCVHZ5QW8rbWpva1VkSWd3RzJ6R3BNZmR1NlJ4eVNMYWJMa1l2bGNP?=
 =?utf-8?B?UVlFUGtQUkQ0ZUp6Zk5WcGVqWVFIajdLMUJhVTlXNm4rVWlnaFFybmRjWk9K?=
 =?utf-8?B?d3poQ3JqdzFjbG91eWs0M0JodUpSUXdNMkhaUUFGaUQ4OEgyTnhZMXlvTUw3?=
 =?utf-8?B?Y0RPcHYwS2NpZjJVbVhpcjlmTmlKbEhIck9QYmZoSnIxRmJiUzhVNXJ1bVNX?=
 =?utf-8?B?K2JsN0M4YjBZM0svR3pKb291dWEwcXRuMHNZYmN0aXJZS05ldGZhaGQ5UjFI?=
 =?utf-8?B?TEJmbmE5WEVEcEsvQUNpZGo2MnFTa01xdFRzcUNzb3Myd29UWkhkVDlkcjV0?=
 =?utf-8?B?ZXZJNFpmWlRrQ1dNaFNKL1lva2ZRV2xobTZYVk94OUNFc0RDQUp0V2c5aFc0?=
 =?utf-8?B?RFJVM2hpVFMrWU5WMzZWQ294TDRCMTlkN2VESTVKc1BYUlhGZ2VYTmQxUVdO?=
 =?utf-8?B?bTVKditnT3k2eTZScWFka2JXOUkvQXMzcTBEd2F1emI4azV0WVNmemdmL1dq?=
 =?utf-8?B?eG10L1I2QVlNeUg2L1FJMVJ4RHV1d0toZ1l5M2NubUljQnR2RWxuTmtFaGk3?=
 =?utf-8?B?RGNaR3FheTVDbU96WHRhdjd3aGJMTWd4K25QWmlobC9CM0oxNEpCQzI1VmhO?=
 =?utf-8?B?SUttVXJGTXJmL2dtWmRUWmQ0VUZ3MWhTOVlzN1VOQmxJenNzN25xbE9UZHQx?=
 =?utf-8?B?b0JQRUw4emhIb0pBWkMvM3FTSXVvUUtodXVGZ0hmNmRUYlJQMGRJRHZDcDNq?=
 =?utf-8?B?Rk5KQXdvWlFRajdHcmJIVUVvVTRCZ0JQKzZDTUhMdlI4RzJNMytBejdzcDhm?=
 =?utf-8?B?dUNPS3NaNWhJQ3VRam5uN0dMN3pybTlpQ1AwMkxlTU0yR3hPNXBvaUNOSm5O?=
 =?utf-8?B?OUpNMVdvNGhTd2M0NXlKY05MYXE4UG03bDBEbHRNTVFMQnUxWCtnUEovQmlM?=
 =?utf-8?B?UXREZnVYWXBjaGllUEIvU2pYRVVzUHFxV3UxQW9qcU53U3pObTlMbUg4ZExr?=
 =?utf-8?B?KzFmME5tcFJLb1dGWUxRblY0VDBqczB0MFV1WXkxOVZhS2dQWlhGUlo4OW1j?=
 =?utf-8?B?Mlk3b2tkbDd2eUVSR1NPbndjS1hEWXhmT093R1FVWTYvRkN2R0IrZlV0S0NK?=
 =?utf-8?B?VlZFRDVyQnZiWWRUVEJVTTJKZHdicEdqcFVZZlJDV0piWUs0WnZORHZlQURn?=
 =?utf-8?B?MjBtcGFUYlo3V2g1M2QzNUJwM0hvc1phRnVQZXltNzUzeTZsZjRyaEx6S1gw?=
 =?utf-8?B?T0hOZ1lOR3JZVlkyc1JkaHMwNWdMTVAvUWlUR2dodWZ6WEFoVWRaM2JMSmxr?=
 =?utf-8?B?QjZSSkxITjRKU3NFQ3lhVDJVSURaamlGNXBvMnpPNEZuSGNFNnJOMkplanhq?=
 =?utf-8?B?L1lRQ1NDNGRENGFyU2hwQ2FSakMwa3FRQ1lzd1VCM21uQkhBZTBWdTRuYVFY?=
 =?utf-8?B?TFY0VGFlajJ6dW9PTGVZeVdwWTJtSksrQ1owYU84d0llTG12UTlPZm9pOFoy?=
 =?utf-8?B?N3plaEdWWUlWV1BlaElGUFRzUXZTdDdVRjdvb3NibUdubU8wWEN4cFdsRG9R?=
 =?utf-8?B?MmM2TjljZkg1cGhpZFpjd2NEVjVGUFAyU25VQXZBRTVuclEwdGt0M3NiSnM1?=
 =?utf-8?B?WEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ae200e2-6213-4e25-edd5-08de3c00a6cf
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 17:37:43.1618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tZk7b3ZA8mzo5Cjy90GoH0jvUQ74JOUgzr2NO21SkZ5mHB52wLusLvc+Z2089m5SRa2/lLLwan0sRJ0In6YI1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6138
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_093748_141885_B5DB6D1B 
X-CRM114-Status: GOOD (  18.31  )
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

On 12/12/2025 19:46, Frank Li wrote:
> On Fri, Dec 12, 2025 at 04:08:24PM +0200, Adrian Hunter wrote:
>> On 11/12/2025 18:44, Frank Li wrote:
>>> On Thu, Dec 11, 2025 at 03:48:08PM +0200, Adrian Hunter wrote:
>>>> A MIPI I3C Host Controller with the Multi-Bus Instance capability supports
>>>> multiple I3C Buses (up to 15).
>>> with single hardware function (e.g. PCIe B/D/F).
>>>
>>> ...
>>>> with one instance of the HCI Register Set
>>>> and one instance of I3C Bus Controller Logic for each I3C Bus, in a single
>>>> hardware function (e.g. PCIe B/D/F).
>>>
>>> Each I3C bus have indepedent HCI register space and I3C Bus controller logic.
>>>
>>>>
>>>> Create an MFD cell for each instance.  Use platform_data to pass the
>>>> instance's register set start address.
>>>>
>>>> MIPI I3C specification defines an Extended Capability to hold the offset
>>>> of each instance register set.  However parsing to find that information is
>>>> relatively complicated compared with just including it in the driver data.
>>>> Do that for now.
>>>>
>>>> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
>>>> ---
>>>>
>>>>
>>>> Changes in V2:
>>>> 	Conversion to MFD split into separate patch
>>>> 	Simplify ID allocation / free
>>>> 	Correct use of __free()
>>>> 	Also define instance 0 in driver_data
>>>>
>>>>
>>>>  .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    | 63 +++++++++++++++----
>>>>  1 file changed, 50 insertions(+), 13 deletions(-)
>>>>
>>>> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
>>>> index 68088967942b..de1f71763786 100644
>>>> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
>>>> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
>>>> @@ -19,10 +19,17 @@
>>>>  #include <linux/platform_device.h>
>>>>  #include <linux/pm_qos.h>
>>>>
>>>> +/*
>>>> + * There can up to 15 instances, but implementations have at most 2 at this
>>>> + * time.
>>>> + */
>>>> +#define INST_MAX 2
>>>> +
>>>>  struct mipi_i3c_hci_pci {
>>>>  	struct pci_dev *pci;
>>>>  	void __iomem *base;
>>>> -	int dev_id;
>>>> +	int dev_id[INST_MAX];
>>>> +	int dev_id_cnt;
>>>>  	const struct mipi_i3c_hci_pci_info *info;
>>>>  	void *private;
>>>>  };
>>>> @@ -30,6 +37,8 @@ struct mipi_i3c_hci_pci {
>>>>  struct mipi_i3c_hci_pci_info {
>>>>  	int (*init)(struct mipi_i3c_hci_pci *hci);
>>>>  	void (*exit)(struct mipi_i3c_hci_pci *hci);
>>>> +	u32 instance_offset[INST_MAX];
>>>> +	int instance_count;
>>>>  };
>>>>
>>>>  static DEFINE_IDA(mipi_i3c_hci_pci_ida);
>>>> @@ -177,53 +186,81 @@ static void intel_i3c_exit(struct mipi_i3c_hci_pci *hci)
>>>>  static const struct mipi_i3c_hci_pci_info intel_info = {
>>>>  	.init = intel_i3c_init,
>>>>  	.exit = intel_i3c_exit,
>>>> +	.instance_offset = {0},
>>>> +	.instance_count = 1,
>>>
>>> just one instance? suppose at least 2, otherwise, not need this patch.
>>
>> Adding multiple instances is in a separate patch
> 
> Okay, commit message should mention it.
> 
>>
>>>
>>>>  };
>>>>
>>>> +static void mipi_i3c_hci_pci_free_ids(struct mipi_i3c_hci_pci *hci)
>>>> +{
>>>> +	for (int i = 0; i < hci->dev_id_cnt; i++)
>>>> +		ida_free(&mipi_i3c_hci_pci_ida, hci->dev_id[i]);
>>>> +}
>>>> +
>>>> +static int mipi_i3c_hci_pci_alloc_ids(struct mipi_i3c_hci_pci *hci, int nr)
>>>> +{
>>>> +	for (int i = 0; i < nr; i++) {
>>>> +		hci->dev_id[i] = ida_alloc(&mipi_i3c_hci_pci_ida, GFP_KERNEL);
>>>> +		if (hci->dev_id[i]  < 0)
>>>> +			goto err_free_ids;
>>>> +		hci->dev_id_cnt = i + 1;
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +
>>>> +err_free_ids:
>>>> +	mipi_i3c_hci_pci_free_ids(hci);
>>>> +	return -ENOMEM;
>>>
>>> You have to handle ida error, actually, it makes not big difference with
>>> mfd and add multi platform devices.
>>
>> The ids have to be defined in any case.
>>
>> MFD still handles:
>> 	Setting the firmware node
>> 	Deleting devices if 1 fails to create
>> 	Removing all devices i.e. mfd_remove_devices()
> 
> Actaully, why need remove previous failure device. assume support 15 device.

Keeps things tidy.

> 
> 7 success.  failure at 8 instance.
> 
> I think it'd better keep 7 already success devices.  So 1-7 can work.
> 8-15 can't work.

If adding devices fails, the system is out of memory
or in some catastrophic state, so there is no need to try to
cater for that case.

> 
> It should be better than total 15 instances doesn't.

Not necessarily.  If whole probe fails, the user might try again
and succeed.

> 
> Frank
> 
> 
>>
>>>
>>>> +}
>>>> +
>>>>  struct mipi_i3c_hci_pci_cell_data {
>>>>  	struct mipi_i3c_hci_platform_data pdata;
>>>>  	struct resource res;
>>>>  };
>>>>
>>>> -static void mipi_i3c_hci_pci_setup_cell(struct mipi_i3c_hci_pci *hci,
>>>> +static void mipi_i3c_hci_pci_setup_cell(struct mipi_i3c_hci_pci *hci, int idx,
>>>>  					struct mipi_i3c_hci_pci_cell_data *data,
>>>>  					struct mfd_cell *cell)
>>>>  {
>>>> -	data->pdata.base_regs = hci->base;
>>>> +	data->pdata.base_regs = hci->base + hci->info->instance_offset[idx];
>>>>
>>>>  	data->res = DEFINE_RES_IRQ(0);
>>>>
>>>>  	cell->name = "mipi-i3c-hci";
>>>> -	cell->id = hci->dev_id;
>>>> +	cell->id = hci->dev_id[idx];
>>>>  	cell->platform_data = &data->pdata;
>>>>  	cell->pdata_size = sizeof(data->pdata);
>>>>  	cell->num_resources = 1;
>>>>  	cell->resources = &data->res;
>>>>  }
>>>>
>>>> +#define mipi_i3c_hci_pci_alloc(x) kcalloc(hci->info->instance_count, sizeof(*(x)), GFP_KERNEL)
>>>> +
>>>
>>> It is not good to hide hci in macro.
>>>
>>> mipi_i3c_hci_pci_alloc(hci, x); or
>>> mipi_i3c_hci_pci_alloc(nr, x)
>>>
>>>>  static int mipi_i3c_hci_pci_add_instances(struct mipi_i3c_hci_pci *hci)
>>>>  {
>>>> -	struct mipi_i3c_hci_pci_cell_data *data __free(kfree) = kzalloc(sizeof(*data), GFP_KERNEL);
>>>> -	struct mfd_cell *cells __free(kfree) = kzalloc(sizeof(*cells), GFP_KERNEL);
>>>> +	struct mipi_i3c_hci_pci_cell_data *data __free(kfree) = mipi_i3c_hci_pci_alloc(data);
>>>> +	struct mfd_cell *cells __free(kfree) = mipi_i3c_hci_pci_alloc(cells);
>>>>  	int irq = pci_irq_vector(hci->pci, 0);
>>>> +	int nr = hci->info->instance_count;
>>>>  	int ret;
>>>>
>>>>  	if (!cells || !data)
>>>>  		return -ENOMEM;
>>>>
>>>> -	hci->dev_id = ida_alloc(&mipi_i3c_hci_pci_ida, GFP_KERNEL);
>>>> -	if (hci->dev_id < 0)
>>>> -		return hci->dev_id;
>>>> +	ret = mipi_i3c_hci_pci_alloc_ids(hci, nr);
>>>> +	if (ret)
>>>> +		return ret;
>>>>
>>>> -	mipi_i3c_hci_pci_setup_cell(hci, data, cells);
>>>> +	for (int i = 0; i < nr; i++)
>>>> +		mipi_i3c_hci_pci_setup_cell(hci, i, data + i, cells + i);
>>>>
>>>> -	ret = mfd_add_devices(&hci->pci->dev, 0, cells, 1, NULL, irq, NULL);
>>>> +	ret = mfd_add_devices(&hci->pci->dev, 0, cells, nr, NULL, irq, NULL);
>>>>  	if (ret)
>>>>  		goto err_free_ids;
>>>>
>>>>  	return 0;
>>>>
>>>>  err_free_ids:
>>>> -	ida_free(&mipi_i3c_hci_pci_ida, hci->dev_id);
>>>> +	mipi_i3c_hci_pci_free_ids(hci);
>>>>  	return ret;
>>>>  }
>>>>
>>>> @@ -281,7 +318,7 @@ static void mipi_i3c_hci_pci_remove(struct pci_dev *pci)
>>>>  		hci->info->exit(hci);
>>>>
>>>>  	mfd_remove_devices(&pci->dev);
>>>> -	ida_free(&mipi_i3c_hci_pci_ida, hci->dev_id);
>>>> +	mipi_i3c_hci_pci_free_ids(hci);
>>>>  }
>>>>
>>>>  static const struct pci_device_id mipi_i3c_hci_pci_devices[] = {
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
