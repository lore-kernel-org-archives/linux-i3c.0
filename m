Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 408F0D2CE17
	for <linux-i3c@archiver.kernel.org>; Wed, 10 Dec 2025 08:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=gEp3yaf+h+UF52xhR7CgDnQomC5Mfct16OX/yigydjA=; b=PPhf6cE49lzGu/njsrPMPenk32
	hw7t2rpPQORb6YavWM4TKzfvFPUIVEyeIDNcQT6nj4tFXmMiX3RUC/DA94GxRWGWdrvyQh2CyOFFr
	27ADYTs+ihguYHhWzQvryo/w8aoDCvEe3sBzQ5h5IpmFyfzilbMcSxttdVWOyAj1+3N/aaxzPzBW+
	S0J4pSmVbFTrJcIrv+44ZmkK5oIhhRPMLJ15OCHpmsHcHkdDYYUI/bYnwDa8IeyQEvWcftmF0DGZt
	tqdOxJ8aD+JFCFvygpNDhh3RA/M9Y38nZMmO7TS6s+bgJDGCXILXtsn2kfGj+lvLINXT4geZpdUTX
	/VfVXM8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTFXY-0000000FFBS-01os;
	Wed, 10 Dec 2025 08:27:16 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTFXV-0000000FFB2-2gjD
	for linux-i3c@lists.infradead.org;
	Wed, 10 Dec 2025 08:27:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765355234; x=1796891234;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=PlaV7ic4VqBNRzHKVnnPdOYCElVuRDs2xuDDYiqP5Po=;
  b=JZJ6lZP30F/RXXHwDl7/62Z1TCVKCmCg1Odz1CXD1I/8kVj1uZoYCB3q
   U6EfzVne5g+4HI61Ze7Slf3k+WmPb9+CyrU7z8xfiTgcCqlxPJ4MtppL8
   j1jgIgkbnlKCotHW72huL7/YtYxP90MtCdIVMye6vcySOwPMqdtRg98fq
   UwMX3NIwk4G+kmItMlouWcRWEV+Y2M5A9EXNDvUPmAiYriVv2lQ1h2FPy
   Ct3kmch0lBUjWf4aWGkY6RhFdDcfoJ3/worlV/pK6RO/JVSRD9jMGrC2Z
   KLLdre1NkFbutByviSJRq6DuztlLy/Kb0EHhUr2dlVZ9eYWlwqvg/e+hr
   w==;
X-CSE-ConnectionGUID: koqm3ta6SwWip5yqaczVMg==
X-CSE-MsgGUID: XcD3tyTTRJeVZmAklT8T9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67359893"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
   d="scan'208";a="67359893"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 00:27:12 -0800
X-CSE-ConnectionGUID: F5aLvprHQd2PSwQfEf4PNA==
X-CSE-MsgGUID: Ot7c5XMcQ2qMzaV70/H1bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
   d="scan'208";a="227515076"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 00:27:12 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 10 Dec 2025 00:27:11 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 10 Dec 2025 00:27:11 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.19) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 10 Dec 2025 00:27:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XRqkFRhYTT+8MwsRSpRhPSTdrFvFy/WdaLUbFFNd1myZVof0noSI61AcLEOGrf60uR9Ud90Y4MIXS7W24toi7prcBDdbgM93AOydLACyGvfwe3EIaXN01CwMaVPEAfEJjiEWH0cqsH1I88vR2IDOgYZ+EyTjRYOYwh9TYpZv/wuzK49/jQVP4ZF88LCHt0/bJd+Ou2i/BLGUct6+9c6/HAw4BblBg9eusVWkN5pXglfI2IpBxZpbrXweJcHySbIZMWqcAgsWK/vNFPGs7w9tlbZNMVZCY5Zm60Z5yXy5NDtUaG4hjorI98Elmhuy42oy36S83CiTVpQw6ThHgqh3IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ckNCJMzeFyYJe2mUaN9hRh8DzGUD1D1ml5YdCRGFDsc=;
 b=wS7qbSgV9oiIh8OmKu9DCUG28eEEFmd5801LkaKBVU1j20xogTrnGvakKtrCAtcG3IqdUOb5AirowSGiKz6yqLFjynulSNSVk1YOB1jxEDsEVeOluAKCmcMfxFmYO45Mjp4/snewSX9ZeorUxocPwwuYDP0wFBvN+DGGmhGfbgKiUuQSb6dAibY8GAq/ynomUgJaUcmy/gUDTu35IoRUbJK9HrLpcNdHnTeCW7WBP7sOCJZIIFpksc5K4Fp9uNWel1P3UapYtIQy4hS7DZg0URuAb55eqAXV/3JWqzKbi++XOGsYD5bUjSyFIJsifmRsJkpCuZHpF8W4f3+BbKerIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by IA0PR11MB7956.namprd11.prod.outlook.com (2603:10b6:208:40b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Wed, 10 Dec
 2025 08:27:10 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 08:27:09 +0000
Message-ID: <d727d3ba-be23-4ac4-b693-68f7a0cfea88@intel.com>
Date: Wed, 10 Dec 2025 10:27:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] i3c: mipi-i3c-hci-pci: Define default driver data
To: Frank Li <Frank.li@nxp.com>
CC: <alexandre.belloni@bootlin.com>, <linux-i3c@lists.infradead.org>
References: <20251209115104.124156-1-adrian.hunter@intel.com>
 <20251209115104.124156-6-adrian.hunter@intel.com>
 <aThQHLHCxp/SU92N@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <aThQHLHCxp/SU92N@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: DUZP191CA0072.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4fa::12) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|IA0PR11MB7956:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b3205c3-67dd-460f-be74-08de37c5e90b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aVlpa3ZLQkt5dUcvaGRFOEllaERZeVVya0FrYkJaVUVFSENXOUlzelhOcTFI?=
 =?utf-8?B?K2JUR3lWWEJPZmkwd3ptdi9qNFoyV3dTM04vakw4N0lURTVZQ2tkWEtkQ1Mv?=
 =?utf-8?B?MnJuRml2OENJamZ5OVNvc2JlWmxkR1VhV0VINVJTVU1CQWlHeVlRS3hwcFFK?=
 =?utf-8?B?RGp1VTNGcEVidHh1YWFIYVgvcU5vV0tscm9CRTRXNUJyVWdTUDZnN1BqQ3Nq?=
 =?utf-8?B?QTk5QUErNUQ2MjJJelFjR0lqS0FOVXEvK1lwTldxcWp2RHBqbnJ2ZWtrNDRi?=
 =?utf-8?B?TDhGNmZ5TXM0TlVRQklwNGpEOHVzYTQrdlF1T3dRQ1dmZGVVYlNFRSsvS2Vk?=
 =?utf-8?B?cE01Q3RKQkJWMktVSlJObllOeEdlbmFVMG5sdDFhRDJKb2NNNjBadzJ4eldu?=
 =?utf-8?B?ZUdSZjZMOEIxMmYwdFBQSzVYd1QvM1gwRERMV1NmcVhFN1M0cmFvQ1RxT1pt?=
 =?utf-8?B?MXY0ZTFMYks2M0pkejlyV0RlTXJtQm9WUll1a0lOaFdYRnhGSXMvVXArZllP?=
 =?utf-8?B?N3gydUVsYnZqS2hRQ2Y3Y1ExM3FUWWZTTDNLd0ljU2UrTXkyVWRJMGxMakt4?=
 =?utf-8?B?TFlBRTNXNHNyRXorVWhmMTdzQzBPOXlEVHU5MlV4YXUzN3VLK3Boc2R4YWNI?=
 =?utf-8?B?emNwRVp6ME9qeHpqSWNkSnVMdksvTjBCWUtjZ2hkRENnQVczbXFIMHhxcU8r?=
 =?utf-8?B?bU1YTkJia0huUFRjVEs2N0duNnJNM2RHZWJHVWwyZzVzVXlESGoyNDZldStD?=
 =?utf-8?B?TzZkeUwvZzlubnFYb2RycStVZjZKKzdLZ3RPcjFGdVRwU1FlNHVpNzhXcHY4?=
 =?utf-8?B?SnZrMHNxVWpUMnQzbC9xRDB6Tk5nVlAvNUZXUk1zbHJRelAvZmliWWk1YXhE?=
 =?utf-8?B?ZUFRZUxuTUg1anhzekQzWGlKa2UvKy96d2g2b2Z4OEc2Y1o2TVlmaTllMjBk?=
 =?utf-8?B?dEd5QnhiR2piQ0M5N1I0Vm41WW81MzU0ZFRWUWJCU2VhSkEwRjRwV28vTmkv?=
 =?utf-8?B?VmJ4bjNEbSt3ZHlya0x2T25mSUE0aGd5R1ViNFFKeTYxaGppaThuRjZqWEll?=
 =?utf-8?B?OW5ZOWp0ajJ3SVU2MzBNRVNrd25RSlFEZWFaWXJIdllvaFZES3RMUmFrQmtq?=
 =?utf-8?B?RXJTY2wzMGhLZVp6dEFwV0piMVYxWGVwNGhCSmxYTUxYZlVseUdxbXF4VkRB?=
 =?utf-8?B?Ny80ejRMeVduM3Jtck1yU2dlalhBWjdMWUpKZElodVBMSVlRckNodm44emVF?=
 =?utf-8?B?Smlod2U3TmpCUE9WOTFKVHBqOE1xL1BMSHdmNURxVTMxMHpQNEpuOHZiUFFp?=
 =?utf-8?B?NmdkVnIyUVlQNHpJRmhmOHFuTDV5VjFLSDBsd2t5VVorMVFQcGpuZU05MTJO?=
 =?utf-8?B?RXg4eWxGYlNRcW56dWdyZzBrTXlEeXh6d3FRdDVITEkwQzlxcUh1WndBaTZ0?=
 =?utf-8?B?Y2U4SlhvcldBUnIzNTFyckxUT1lJZzRzVllzZkVrNElpcmtaL2lYSU11OUt5?=
 =?utf-8?B?WUtHSXhBbGN2T2dub2JiZ1M5YUZXU2hJYWtDZlRrdjFMbFhRMlAvY1drVFFN?=
 =?utf-8?B?NTN0MUJCTEhGU0xweUtMRzQ2STBnelNYK2xRS1RhVVpUdXFQWndtbDJJZjVl?=
 =?utf-8?B?bG1lQU9iVGVydkY0cGo0WGdvMWs0ZUd1SC9LOW1JcURzUlBHamVVb1RDSVVC?=
 =?utf-8?B?QUxkZUVhRSsxREpTVkxYN0hzaXFGZWx6dzgycWs1ZDVBQllQQlh2a01Denlj?=
 =?utf-8?B?UVZGVEJ4RWhqME00YWZrQklHaUpHOEZjRkVVOVQvTkxxZUl2UG1tYjJrYXY2?=
 =?utf-8?B?azJqZ2l0Nm9MZzVzL1Mwd0hyb01yRGc1OU1BbU1CTEV5WklFTitwMG9zSUdP?=
 =?utf-8?B?NmNsd2dtSDl2VCsrTE1EQ0tHaVBEbWYrOU5PYTV5ZHdOMER0UUFyKzRwa29K?=
 =?utf-8?Q?9t1aiDsdXwNXfesp/6EAWd3GB98zdKun?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVp4WkErRytpYkZQd0xIUnJaU0VqZ25uK1IwMFhPbWthai8wZ2xIMmozTGpB?=
 =?utf-8?B?VFZXVEdLTUF2b2lLd2RBYmQ3MEkrN1dhdzh5YkZWSFFKa05Qaitkd29lRVJR?=
 =?utf-8?B?M0hlM3JEVmJOWm1KQTJqMmQ5NkdOL2JuOXpmZVQrRnBqUE1jdFlZVVVBTUVP?=
 =?utf-8?B?cHFEcUlxR1J5eWR5ZDhpL1QrdEpHSE9kblNWZzY2MGhYblF3WlVLZFA0WXJD?=
 =?utf-8?B?V0d4Y0dTdzVLeTdoU1FjZ0xFNVk4ZFFtMHJqbEFDWG5CYTZSWkhUaW5QL3RZ?=
 =?utf-8?B?dkExR0VTai9vZi9CNmplVGs4WTRBYjVnRml0dkg4bXg3SnhUWnFWQkdOenIr?=
 =?utf-8?B?d1l4S0tjNTZ6UjBOTzJSZUhaS0d3S2g2dE0wbDZhdmprbGxoQkZlRzIxSWl6?=
 =?utf-8?B?eDF1bzhpVXJJeTg2SSt1S1FSU3RuM0NqS2NwM0pTSURZL2dUR3N2aVVubnJs?=
 =?utf-8?B?T3htL29YREZTWlZFbk92SkNwMjRMRURldkw3MmdSM3RvWXJKSlFXOGVYNnpr?=
 =?utf-8?B?S0FjUW55UWVxd1l6c3RhOUpnM2lROFMyYk5iZ3lQcjcyTDd0aXBPeHFHMXYv?=
 =?utf-8?B?TFNTUmpoWW96aThYNTJjcDJ6Z3ZBZEFvck03WmZMR25lcURYYldWQUx1eVVu?=
 =?utf-8?B?WmxIcWE3UzVHajk0NmRxODNQZnR3bDB5eHI0dVlBcUdVaE5RQVdJUWJBN0o3?=
 =?utf-8?B?THZuaE9XTW02Sm5tRmVwdmdjZjZOdmJ1VVFZeXdDdG5aNUVnOE9hT3RYdkp0?=
 =?utf-8?B?NXJza0RFejNkM1VIUHBHcUpocW5LYndNMWtZQzhPUUkycDUydlpOenZOb01H?=
 =?utf-8?B?TFVvMkFQU2IvRjB3SFBKSFl4TXZMeC83YkZVWWk5MzJXcEdvQnkzaExXMUR5?=
 =?utf-8?B?Ym5OSmJqRW5zREJBa1Y3U0REM09yRmNQdWp0cGRkWHB6M3djdUdndTlqZ2VE?=
 =?utf-8?B?Rk5XYTZrOUdMd0JtVzduY3luaTdpenVTdjNlNUt2UXhHZHFueERhL3hYV096?=
 =?utf-8?B?Y0hSRDZ5aitib1JobFRhdERRUUZVcW9Uemd6TVdUZ1Q2emk1N1grS2Fsbkww?=
 =?utf-8?B?cXQ3bFp1b0lCRVhLVGZiTjA4cGhLMGJpOTBWNkRFT0NDbnZRR21mWXlDWWYv?=
 =?utf-8?B?SE5xZzBhc2lkV2hsM0pXTFprOHpiYlJRWDBLdzljTzFpQWMwR3JZUThzczI5?=
 =?utf-8?B?anIySmU5bXRPdEZ3T1dObEFKNDdtdm1qM1NkLzNDU1lnaWcrN3E0aXM1VktT?=
 =?utf-8?B?MWpoNHN1SFhsUjd2cWdiTGY3TENtVFNXdmJNU3B4Qjk5S3dHMm8rdTA5c3E5?=
 =?utf-8?B?NzNmNW12OEpyb3BvbloxSVVhYkw1aENwY0FtTXNhSHdZTmsyUlBIVEkrRHlx?=
 =?utf-8?B?TGs3eit6T3Z2MnJTRkJEWjBtV1F5d2xZZExpRWc2OUhIaVRjbXovNng4OEM0?=
 =?utf-8?B?ZmVEVjdWT25MRTQ1UDhWdjF4ZDFpeHRRQVFBbWZoQVNZNzM4emtiRWR2Q0dN?=
 =?utf-8?B?TlpNNDZHbXRBaEZSNHFGOERGU1QySHpmQTNLeFp4MXBmKytOcU56ek5DOEtj?=
 =?utf-8?B?dm9iUGQxTlQwQzJ4b2JsdXpIcGtzeVFER0JiQWJaUHlvVldLZFRIVlBteGls?=
 =?utf-8?B?Q09aa3hQR1d2OXJ1L3MzYUpTUEhvNFFNWUVxekJSMmp0THkvR0lqUlNFcmtK?=
 =?utf-8?B?TTIwaTlMb3hkNFB0QVNyTHhPcjhLbVJBQm12M2h4ZUE4bDM1V25iVERGTS8r?=
 =?utf-8?B?WjFjT080MkdHRlF0azA4bzl6R2xtLzlNNlFMV2hoRnRvc2prQWxkQWFRM2wz?=
 =?utf-8?B?R1lyemQ4ck1iK3I5eUZOdnRsN2o1UWhvYzNrODEwQ0dFRVg1V3VsNCs4Nk1Y?=
 =?utf-8?B?RkpXaklZZi9Xd3AvTHZrdCtVSzVZYkh0M1dEbmRJRWpUczFqOGFRR2k5ejh0?=
 =?utf-8?B?UGJVYnExOWxXLzlkZ1R1ZVY1K01EaFVTWFlVWmdZd3dsWkFlSzFWbHB0OHBX?=
 =?utf-8?B?VnYxdWVLblg2VHc1MHZBbFRPV2FiL2tuUGV6UVhsQXVrSEJRVlNsZ1owRng2?=
 =?utf-8?B?WWpkc0lPY3g0R3V6KzJabEVXdGNwUHZoQmlIRlBwdlU0ZTVlWW9ORElDTFRz?=
 =?utf-8?B?OGN3ZUR4WGVYWEkyR2pBdldseTFSRTJCM2w0dDFubFlSTURvNEhjYTlaaDBI?=
 =?utf-8?B?dlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b3205c3-67dd-460f-be74-08de37c5e90b
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 08:27:09.8052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KfA9yCr2ZFBLnxdu/Z0HpnwWJD1/VHdzOD6txXJystVy8xoCfnEcdPEB3AdWIPvmGU9v+8mwjqMGbxWmF0R0Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7956
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_002713_739542_C885E300 
X-CRM114-Status: GOOD (  15.99  )
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

On 09/12/2025 18:36, Frank Li wrote:
> On Tue, Dec 09, 2025 at 01:51:02PM +0200, Adrian Hunter wrote:
>> Define default driver data, to save having to repeatedly check for NULL.
>>
>> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
>> ---
>>  drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 11 +++++++----
>>  1 file changed, 7 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
>> index dc8ede0f8ad8..ccaec5d3d248 100644
>> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
>> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
>> @@ -184,6 +184,9 @@ static const struct mipi_i3c_hci_pci_info intel_info = {
>>  	.exit = intel_i3c_exit,
>>  };
>>
>> +static const struct mipi_i3c_hci_pci_info dflt_info = {
>> +};
>> +
>>  static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>>  				  const struct pci_device_id *id)
>>  {
>> @@ -228,8 +231,8 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>>  	if (ret)
>>  		goto err;
>>
>> -	hci->info = (const struct mipi_i3c_hci_pci_info *)id->driver_data;
> 
> I see all devices have driver_data in mipi_i3c_hci_pci_devices()

Seems safer not to assume that.  Alternative is to return an error.

> 
> "
> static const struct pci_device_id mipi_i3c_hci_pci_devices[] = {
>         /* Wildcat Lake-U */
>         { PCI_VDEVICE(INTEL, 0x4d7c), (kernel_ulong_t)&intel_info},
>         { PCI_VDEVICE(INTEL, 0x4d6f), (kernel_ulong_t)&intel_info},
>         /* Panther Lake-H */
>         { PCI_VDEVICE(INTEL, 0xe37c), (kernel_ulong_t)&intel_info},
>         { PCI_VDEVICE(INTEL, 0xe36f), (kernel_ulong_t)&intel_info},
>         /* Panther Lake-P */
>         { PCI_VDEVICE(INTEL, 0xe47c), (kernel_ulong_t)&intel_info},
>         { PCI_VDEVICE(INTEL, 0xe46f), (kernel_ulong_t)&intel_info},
>         /* Nova Lake-S */
>         { PCI_VDEVICE(INTEL, 0x6e2c), (kernel_ulong_t)&intel_info},
>         { PCI_VDEVICE(INTEL, 0x6e2d), (kernel_ulong_t)&intel_info},
>         { },
> };
> "
> 
> Frank
> 
> 
>> -	if (hci->info && hci->info->init) {
>> +	hci->info = (const struct mipi_i3c_hci_pci_info *)id->driver_data ?: &dflt_info;
>> +	if (hci->info->init) {
>>  		ret = hci->info->init(hci);
>>  		if (ret)
>>  			goto err;
>> @@ -244,7 +247,7 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>>  	return 0;
>>
>>  err_exit:
>> -	if (hci->info && hci->info->exit)
>> +	if (hci->info->exit)
>>  		hci->info->exit(hci);
>>  err:
>>  	platform_device_put(hci->pdev);
>> @@ -258,7 +261,7 @@ static void mipi_i3c_hci_pci_remove(struct pci_dev *pci)
>>  	struct platform_device *pdev = hci->pdev;
>>  	int dev_id = pdev->id;
>>
>> -	if (hci->info && hci->info->exit)
>> +	if (hci->info->exit)
>>  		hci->info->exit(hci);
>>
>>  	platform_device_unregister(pdev);
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
