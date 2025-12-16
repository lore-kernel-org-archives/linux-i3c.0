Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1638D609CE
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Dec 2025 17:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=CFClMgxcaYU5BbrpnCnN5avHxt8stm0NFxD3JieXcx8=; b=yV5oe0BK8P4FnRQfCCNjmeHyaQ
	5LlG05UTD7GpqLQCDC0IqAi38XU8XEVbv7uGNZlstf7UyZhcUu+rdIypCyA1hR07teJOxLEZYDGXn
	x+GzVkSI1MAy3z0Zg8gnJ5q3FUZ+/0XjSUimsfydZOxeWMCK6vMBl3zwXgNClU3awzcoq3cqFK/zt
	yaIp1PiZymEk5Zx3S/u54OpI00jljLZ7P5CygAkzU+s2N38Ll3boI+Cfj3o95IH9bzswFfQXSlhOz
	gA63hD1l+5YVd4z79gCfw7h3QaNot6BKw45/rQv4JB87Djw7xTrFChBXAyUBf2O0ekzK0LdI71Zcb
	j27cbkCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYdM-00000005b17-41CT;
	Tue, 16 Dec 2025 17:14:49 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYdK-00000005b0e-10U7
	for linux-i3c@lists.infradead.org;
	Tue, 16 Dec 2025 17:14:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765905286; x=1797441286;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=v3a6CEM2sLqpWUOx/bCFQeLq29vOomjbobIAyUiXGjI=;
  b=g47mNCLhEpJDGpZH2E+w9U7WvmCEBH43h5Qch7lwTgrqEBQKJy+g8vVZ
   384kEO6Br3pdKLif6Rwq4fbzxdGqC2q2ezDOtN2wnN80t6KS8TwvskP8Q
   o+aAthIJmWQE4yYWROWoo5aP5GUG0Hur4Xu1jMV4LljDRKyvF2HdJQGug
   TI8HRSH7/3wXqO2lI51BJsUS2O5Vuvvj4TPulZRG8wIzLFjUYrk/ihIpC
   FQhTU2X/RdHqmxxv2nOxGbR3iUdRSkCpK0L6Qea067DSuCMzHLlofWF6b
   puX+QHbZkLvxSf50MIFhx/lUX8TGQ/Wlz6WFmeQMf4aamgcXwb+nqnZ7N
   w==;
X-CSE-ConnectionGUID: hXAvNYYsR2qDzeKv5na3Sw==
X-CSE-MsgGUID: JOxBbe5+QwW2gb6J7+8MFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="67712317"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="67712317"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 09:14:45 -0800
X-CSE-ConnectionGUID: fm/Jx0U8RwePp1GJqEyq/w==
X-CSE-MsgGUID: wiMd8EoGSkSgELSTZduDMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="228758917"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 09:14:45 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Dec 2025 09:14:44 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 16 Dec 2025 09:14:44 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.7) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Dec 2025 09:14:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TlW77jFUovipm9YeQ/CG7L68GhUhMZVmKgobdJ0YJQBtmTkO+3AqfDMgY2F5NIMbcyK+QVcqcsDM0PqnQT4y1D+giTA7wS+OguKQx2RuLUvM3JpKpEE7T7HoRfXVLpbmfaGQLUWkmtfKYUuEWg/kY/yG+G1iBD/GuEflUFV3PzQVWLLVXSt44810H1fPV3MOxcyU9HRyyAhYb/VK1BbJn2iw4fVzMvAzN4V/8LQC/z6bIeTK1rf/fSmnPSwc1qK0y0i7FDypi9KbLOEBmLnUQmKK+mhWmQcJCukwoO35c7Y8kXnlCj2GMA9qXDVl4y7A8AnSzthDmN7wYttKP+nCSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SnIf64y47nDe/OhBUUOyw3j42npDjPhfShy07tmOezQ=;
 b=n8Im90uunCOEZzLPn/DiZeyuPlHBumkOf9lonl14OhpLuoOCnLC6IL7yVBaX/IMHRdl1lIi4W7/aFk8ytpCtlFbB/ACvlDtGLS732vU3td352afJBM+xPyfFweCE9Ms6obg1scytNo6G0r3ZaQBLrgPeDav372A5oakLcCCrccIVAFNY8oxc1O7GIo1sGV0LdkFuaOV1Ca01F2A6Nsk4MPblNG5OToxNM9fXCNmB8ysee3f0ZBYNoECvvwnscJ3G0E9NckS+p3ewBLw+yIYhh36WdakIZj5KNUVx6XR+AK0rxaA0qCee/sCceLIwxznzRin7ne+Um76b5yEBb5Jh/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by CO1PR11MB4914.namprd11.prod.outlook.com (2603:10b6:303:90::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 17:14:41 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 17:14:41 +0000
Message-ID: <bc482da2-5ef4-4162-861e-3f2f0cc9f938@intel.com>
Date: Tue, 16 Dec 2025 19:14:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 06/11] i3c: mipi-i3c-hci-pci: Assign unique device
 names and IDs for Intel LPSS I3C
To: Frank Li <Frank.li@nxp.com>
CC: <alexandre.belloni@bootlin.com>, <linux-i3c@lists.infradead.org>
References: <20251216165642.164583-1-adrian.hunter@intel.com>
 <20251216165642.164583-7-adrian.hunter@intel.com>
 <aUGSHCqJ5+4Jwdh7@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <aUGSHCqJ5+4Jwdh7@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: DB9PR06CA0021.eurprd06.prod.outlook.com
 (2603:10a6:10:1db::26) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|CO1PR11MB4914:EE_
X-MS-Office365-Filtering-Correlation-Id: d3c77564-3d76-461a-badb-08de3cc699d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cDdkTHNQb2Jac3cya3Bqd0NDMzcyRGJCUDc5RXBKalg5a3NjQUZudExlcUIy?=
 =?utf-8?B?Q0h3dW9SZDdNcXd3MjRwdUttcTRodjQxUGFyUjE1dkhYUVVKcE9yYjlMNlox?=
 =?utf-8?B?K3pJWkx0dEVERTdNNHdOdkV2M0FoVGNLMk9xSmVzNTdxSGEwVXVSdVRHamRC?=
 =?utf-8?B?Y0ZHd0NzWHZSSnlqMnBCNFZQUXlCS280eVM5VHRsVUFLdmtPRWtVQ2tNMDdX?=
 =?utf-8?B?TmVaKzAvNGQ2eGhtMVphVWRmSldiS0dyRVAzempzZnh1cVJjUUF1ZUlkT3BE?=
 =?utf-8?B?STd3Z09vSXY3eGEzS0dNRDJFVWNtQXZPTFg1RWVwSmRuOFk2Ylh6Q1VoYkhO?=
 =?utf-8?B?dzZTcVBXSnRmbWxyaXBHM3Jmb21uQVFvbkhiQjFqa3M2V2ZSVk1OOHB3RWgy?=
 =?utf-8?B?Mk1lc05KWHVqTi9iWks2QW91ZmxqZjg2UFY1STRnM0dwa2swTjJ4eWgwM1RQ?=
 =?utf-8?B?dnZGd0Q3UUpwczJ4elhFRnY0OCt3OFFIVmpYT24yTGhxTitlcVpLMnF6N2lv?=
 =?utf-8?B?MHl3WkdqeldCK29mTFhsdFcrNWpkZ0RYeFlkTnF1RWQ1akIxNnYvNlVHQ1E4?=
 =?utf-8?B?Y0pINTBwZ2ppOVE3QXVPWVMxMnVkNEhCODlSem1NT3poYnlNajA0dVhhWFpZ?=
 =?utf-8?B?OVdJalFtdnEzRmtGOXhDcnV2VFl5ZU5MWWcyRElLK2phVFUxSXN2WEFqenlp?=
 =?utf-8?B?QTBXMkVzbDdCbml1WUd1VWI2a1RTSUhpRmVXb3BZUnc2cldmYWd5Ni9kN0dO?=
 =?utf-8?B?SjdiVVlwOWRlcWk3Tlp1cHRlbDl2L3QzNWNsZXlUZkh1SDhudkM0Tkg1eFdY?=
 =?utf-8?B?U3dKYjVTZWQvd3QxU1dtQVB3SytkUC8ycVpUbE52MW5UWmk2U3UrUzZXcWJ3?=
 =?utf-8?B?YzVSU2hhTkhJU0l1MnJ2V3JsNTQydlJqYmhOSmZRUDM0UjREMzVwanFONFp3?=
 =?utf-8?B?aTNFcXlXRXUrbGtnK3RrR01ONk50RnBnUVlWdkN3eHlrRUZ1M3Y2Sm1LcVdq?=
 =?utf-8?B?OXJHY3NRdmRWUUIxbWNJRU55dHlvZ1oyRXMvY2NUSmo4cHhadU1ycTVFNnRl?=
 =?utf-8?B?Nm5MVEJ0QndMRWtxU2Y5b1dyY1JiSUlraUNpS2FqdG5idkNaMkViN3A1Vm40?=
 =?utf-8?B?VmRPR0xOaGJBdmkrRWVSem40dkExR2lKQlU0cCtzTEQzbzEzVkFrVmFHK0pL?=
 =?utf-8?B?SlA2NktrcVZ1RFRWd0RaOGJuM0lNbVFUOXRCUlBBMnM2a3pwQ2dBdGtwdTln?=
 =?utf-8?B?UFAxVUtvUkN4QkpOQTdOWG5yUU9sbjEyYmpsUFQ1blFVSmRaSTV1T2hCa0wz?=
 =?utf-8?B?L1NqaCtSWHErTHVCMTdLc1dxanRQWHRybllrSVBhYUt3dVRZTFBYbjkyY0M4?=
 =?utf-8?B?M2J1NHpHYnA1S0JnaUJqQit4Q2l3Vm5IcGorWVU2eE9ZOEN5QmNXYUpEdTJ4?=
 =?utf-8?B?OStBNURZbjBxSFZ6RkJWaEQwd2Jhc2ZHbVBxVTRBazF1UmQ2T05BMTgxaE1i?=
 =?utf-8?B?NHcwRVR4alFkWHVmQUNTY1pScVFWVzJycjg1L1F4dUc3T1JIK3RYRmdqREdC?=
 =?utf-8?B?L0xFOXVOKzJmM2xsbDZHZ2ZwVURSWWlCbnUzYlh6MFliclBmR2NBNURrSTlJ?=
 =?utf-8?B?cWNpL2tzb204TGpjTXVxc0I5b3dlM3F5NVRpWVQzVktZaVEyMm53U1dNNmVz?=
 =?utf-8?B?aWdjYUQ3WURleDdLZFdycVVkdnA2Z254QmQ5MExyVCt1b3lOc2thRHRhTnVW?=
 =?utf-8?B?M0ordERsS3EzU1JTUEoxb0w3eWNPRmxKcnFhdzk1NjM0V1E0SmFNb05NdVBZ?=
 =?utf-8?B?VWtsVFY0cWt6eHBOZUYycW1PdExNcFNQdmdhRTFEVnpmMlhVS2prNDdhUHdm?=
 =?utf-8?B?SFhnWDlFdkZkZFkrQ0J5UFg2WDQwQ3NyU1duMGxBS2VQYSszcTFTSzUzWTUy?=
 =?utf-8?Q?Znq7JGq/Zgo8tyc1Tqffkib/weC8vh8m?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vnd0cjJyWW42cmlraVlVOGljVHBxRFU4bWRiTDZxVDlsQThlMXV4c2FxQ0dH?=
 =?utf-8?B?L0VvUERvMTJxQjFwY01jS25SNXI3V0R0MXpTQ1Q0UVExZ2lFclJhU0NLaFVD?=
 =?utf-8?B?cTVFZ1lWMTFUVVMyMjJtTktoU1dnczdJZ1NUWGtpdnBCd1BoYytKL29yeHdP?=
 =?utf-8?B?cW9mcko1bXRRcGVyL0g2QW1qVnozbVorSXZSMk42b3ZlMnBYTzNCV3JYNENX?=
 =?utf-8?B?WEttR0VMVmhJMlJwRDBsM2I2bnR5NXZ1NnpqOU0zcVdORWNGUHZoWnRwR3FK?=
 =?utf-8?B?bm5VRkRTVlNSci9XTDVBNUU1M1M4YVkxL2tqVWZRM01IYUk1SWwweS9nNE9B?=
 =?utf-8?B?anQyY1o3SlVDazFYS2Y4M1N1WUFCZ2l3UGZYNFhjZ2NmRXFNSDYvQ2dhdlhh?=
 =?utf-8?B?TFNQbFdLSnZCZFI3VjlmWHIyamVUaXBMdXJJVmJSL09pZk5manp1VWt4WmFH?=
 =?utf-8?B?ZXBWRkttOUI3Yzd1YlZhREpPL1lRd3VtaWkyQ1BqUlIxMFl1WDd0SGVmUWFH?=
 =?utf-8?B?K0U4RjR1VHppdlVqZ1ozUFhKaGxUdy9RSzR1ck9WUjFNSjFUUC9pQk1ETytq?=
 =?utf-8?B?TmNJbERodXVjQ1ZRZFpZVEFuM3FFMEVZdU12MjAyLytmOXQ3Y2NQakhKSmNs?=
 =?utf-8?B?NmJzZGp1OWJVbGp1akJuZ1hLeTkrN2plOUczZEVPalBkOUlrL2hlb21hUGd5?=
 =?utf-8?B?UWxqelY4Vk5MSkxjbEsxNDlaOW9wNmdSdEo1RXd0YjcyUU8rampmL01hRUZp?=
 =?utf-8?B?bVV0L2xwdjhjbWs2SldUWmVIU3ZhRVU0Q3laSmVFSHVITktEZ2NGNkQxTUJo?=
 =?utf-8?B?N0lmVG9uMmhWeWNFZVlrNng2aTJENlkvU0wvdHc4c0ZRUmRTZURiVG9vZzlT?=
 =?utf-8?B?VksyNTJ5eVNtTFEwMERLTEhrNTA2MVVEcGg3eHFkUEkzSE1KaEIwVjg3aEJt?=
 =?utf-8?B?SlZCSytNeWE4enBXM0kyQVJUM2hST3pNZUVkV2g0UitEcFhNeXlCNWZwSGhm?=
 =?utf-8?B?dml1VHN4T3VuU1ZuQVgvaGltclVxWHRodUlCRzFTa0duTUVOMGRqT0ROUm5T?=
 =?utf-8?B?TEJaYkNGaS9yaU9BSlVJemp5eXBqU2lkSml6eExSQWZONkxIcFhCaGFYME1T?=
 =?utf-8?B?cTBaMnVpck5WdnZxT0o2SDJ0S1MyWVdEMXM2SHhzLzFsM2t6TVJtMlNmL1RB?=
 =?utf-8?B?Q2NzMEN5ZzNwRHpSckdZUGV1OFZReE03Q3RkRTFxOW1VYnNDbHFFNTVhNE9N?=
 =?utf-8?B?RzBqckVrdVVweGRES3BiY3pURnFnSlcwTHFEeVRrREFlVFhDcW5yVDJmZHpn?=
 =?utf-8?B?NFA3R3NxQklNSkhlSkM5eFh5TWo5cWF6Nk40amlRL05zUFdzYUNaM0hwZERR?=
 =?utf-8?B?N2h0RW4xOHpCU0JXOUpuUU9ZblVTU1VxYmJyVDEyYTFhVjdLZ3lJYnI1VHlN?=
 =?utf-8?B?VXl0VVVrUzZhcDBkd2NPci9seUhzYk5yaEdRNnQzRlFSTkhMeHQwRXQ5ZGw0?=
 =?utf-8?B?Rk9LdXFjYlZ0bnE4RCtsT205VGxsMU82Y0U1cUxNLzM2bmNGUnFOWXhjSzZl?=
 =?utf-8?B?dXNKbU03cTVWaWlqQjM4bytrbGVIOUxmcnBXRThLNUExRmlRb2VXODRGSElu?=
 =?utf-8?B?VGlyWGQ2S1g0cmJXLzZGaExodjNhRzBJMDNxUE1hWisySkpzY0RGK0U1TTla?=
 =?utf-8?B?SE1HOGg4SEhBN2hZd3dwZFN6ZGhvdFRJZXFxOHF3aWg2UW1OWnpYQkVtck5h?=
 =?utf-8?B?TE9Mc1p1UXd5QU9oSmhkVnAvazk0c1hMVUU2c1JEdExQSFNLTVY1RjRidWZN?=
 =?utf-8?B?cDNhZDZvczViM0VRTW9Bc3RFK0JFeEFpUGp1SzRHcTBYTWdRSmFDQktOQ0Y1?=
 =?utf-8?B?WWtuaytTQzQ5SEQ3eUV4K0I0Q2ZYRk1RaXVUU3pOSVhmZlp3UFVITVNyeVZC?=
 =?utf-8?B?M3ZyQW1RYUwrVndMang3djlkWTVOOTY5Qzc1ejJJZGxaT2NhK2pabDhiaVFo?=
 =?utf-8?B?dFFsMitWNkp3aVRzUzRtTFpGR3NaMFVCNjNVVzB2VDZpWllZNHB5dG5PRGp1?=
 =?utf-8?B?d2paV29neWV2ZDJhVUtabXhCeCtVTFFVVlpZa2xSbUJDNEwyUjZqRjlQaDJF?=
 =?utf-8?B?LzhKOWxBMGJIZXZmNFk3RkMyTnVvcXZIb25OektrYlh5ZjBRcGRYNVlCVEJs?=
 =?utf-8?B?U1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d3c77564-3d76-461a-badb-08de3cc699d3
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 17:14:41.6983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XAGgZdaaCU5u5k+PmdAGDC0KnzX9mDVP1vHHelodpg0o4Sdh9HdmT7mc0yxZ7HQAPi34ieuagU0gcqWdOBJ9JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4914
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_091446_340521_446A3E8E 
X-CRM114-Status: GOOD (  17.85  )
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

On 16/12/2025 19:08, Frank Li wrote:
> On Tue, Dec 16, 2025 at 06:56:37PM +0200, Adrian Hunter wrote:
>> Simplify the code and ensure names and IDs align with device documentation.
>> Use explicit device names and IDs for Intel LPSS I3C controllers instead of
>> dynamically allocated values.
>>
>> Add "intel-lpss-i3c" to the platform_device_id table in the mipi-i3c-hci
>> driver and use the same name for Intel I3C controllers in the
>> mipi_i3c_hci_pci driver.  Assign hard-coded IDs to reflect the hardware
>> layout.
>>
>> Intel SoCs include two I3C PCI devices in the Low Power Subsystem (LPSS),
>> each supporting up to two I3C buses. The second PCI device is assigned ID 2
>> (not 1) to match this topology.  Additional IDs will be introduced when
>> Multi-Bus Instance support is implemented.
>>
>> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
>> ---
>>
>>
>> Change in V3:
>>
>> 	New patch
>>
>>
>>  drivers/i3c/master/mipi-i3c-hci/core.c        |  7 +++
>>  .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    | 43 ++++++++++---------
>>  2 files changed, 30 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
>> index 07fb91a12593..3d6544a64188 100644
>> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
>> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
>> @@ -790,9 +790,16 @@ static const struct acpi_device_id i3c_hci_acpi_match[] = {
>>  };
>>  MODULE_DEVICE_TABLE(acpi, i3c_hci_acpi_match);
>>
>> +static const struct platform_device_id i3c_hci_driver_ids[] = {
>> +	{ .name = "intel-lpss-i3c" },
>> +	{ /* sentinel */ }
>> +};
>> +MODULE_DEVICE_TABLE(platform, i3c_hci_driver_ids);
>> +
>>  static struct platform_driver i3c_hci_driver = {
>>  	.probe = i3c_hci_probe,
>>  	.remove = i3c_hci_remove,
>> +	.id_table = i3c_hci_driver_ids,
>>  	.driver = {
>>  		.name = "mipi-i3c-hci",
>>  		.of_match_table = of_match_ptr(i3c_hci_of_match),
>> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
>> index 0fd3587671e1..3b319fbf18ce 100644
>> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
>> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
>> @@ -27,10 +27,10 @@ struct mipi_i3c_hci_pci {
>>  struct mipi_i3c_hci_pci_info {
>>  	int (*init)(struct mipi_i3c_hci_pci *hci);
>>  	void (*exit)(struct mipi_i3c_hci_pci *hci);
>> +	const char *name;
>> +	int id;
>>  };
>>
>> -static DEFINE_IDA(mipi_i3c_hci_pci_ida);
>> -
>>  #define INTEL_PRIV_OFFSET		0x2b0
>>  #define INTEL_PRIV_SIZE			0x28
>>  #define INTEL_RESETS			0x04
>> @@ -179,9 +179,18 @@ static void intel_i3c_exit(struct mipi_i3c_hci_pci *hci)
>>  	intel_ltr_hide(&hci->pci->dev);
>>  }
>>
>> -static const struct mipi_i3c_hci_pci_info intel_info = {
>> +static const struct mipi_i3c_hci_pci_info intel_1_info = {
>>  	.init = intel_i3c_init,
>>  	.exit = intel_i3c_exit,
>> +	.name = "intel-lpss-i3c",
>> +	.id = 0,
>> +};
>> +
>> +static const struct mipi_i3c_hci_pci_info intel_2_info = {
>> +	.init = intel_i3c_init,
>> +	.exit = intel_i3c_exit,
>> +	.name = "intel-lpss-i3c",
>> +	.id = 2,
>>  };
>>
>>  static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>> @@ -189,7 +198,7 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>>  {
>>  	struct mipi_i3c_hci_pci *hci;
>>  	struct resource res[2];
>> -	int dev_id, ret;
>> +	int ret;
>>
>>  	hci = devm_kzalloc(&pci->dev, sizeof(*hci), GFP_KERNEL);
>>  	if (!hci)
>> @@ -217,11 +226,9 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>>  	res[1].start = pci_irq_vector(hci->pci, 0);
>>  	res[1].end = res[1].start;
>>
>> -	dev_id = ida_alloc(&mipi_i3c_hci_pci_ida, GFP_KERNEL);
>> -	if (dev_id < 0)
>> -		return dev_id;
>> +	hci->info = (const struct mipi_i3c_hci_pci_info *)id->driver_data;
>>
>> -	hci->pdev = platform_device_alloc("mipi-i3c-hci", dev_id);
>> +	hci->pdev = platform_device_alloc(hci->info->name, hci->info->id);
>>  	if (!hci->pdev)
>>  		return -ENOMEM;
>>
>> @@ -232,7 +239,6 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>>  	if (ret)
>>  		goto err;
>>
>> -	hci->info = (const struct mipi_i3c_hci_pci_info *)id->driver_data;
>>  	if (hci->info->init) {
>>  		ret = hci->info->init(hci);
>>  		if (ret)
>> @@ -252,7 +258,6 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>>  		hci->info->exit(hci);
>>  err:
>>  	platform_device_put(hci->pdev);
>> -	ida_free(&mipi_i3c_hci_pci_ida, dev_id);
>>  	return ret;
>>  }
>>
>> @@ -260,28 +265,26 @@ static void mipi_i3c_hci_pci_remove(struct pci_dev *pci)
>>  {
>>  	struct mipi_i3c_hci_pci *hci = pci_get_drvdata(pci);
>>  	struct platform_device *pdev = hci->pdev;
>> -	int dev_id = pdev->id;
>>
>>  	if (hci->info->exit)
>>  		hci->info->exit(hci);
>>
>>  	platform_device_unregister(pdev);
>> -	ida_free(&mipi_i3c_hci_pci_ida, dev_id);
>>  }
>>
>>  static const struct pci_device_id mipi_i3c_hci_pci_devices[] = {
>>  	/* Wildcat Lake-U */
>> -	{ PCI_VDEVICE(INTEL, 0x4d7c), (kernel_ulong_t)&intel_info},
>> -	{ PCI_VDEVICE(INTEL, 0x4d6f), (kernel_ulong_t)&intel_info},
>> +	{ PCI_VDEVICE(INTEL, 0x4d7c), (kernel_ulong_t)&intel_1_info},
> 
> If there there are two 0x4d7c pcie cards in system, id will be the same.
> Is it okay?

These are not cards.  These PCI device IDs are unique to each device
in the SoC, so duplicate IDs would never happen.

> 
> Frank
> 
>> +	{ PCI_VDEVICE(INTEL, 0x4d6f), (kernel_ulong_t)&intel_2_info},
>>  	/* Panther Lake-H */
>> -	{ PCI_VDEVICE(INTEL, 0xe37c), (kernel_ulong_t)&intel_info},
>> -	{ PCI_VDEVICE(INTEL, 0xe36f), (kernel_ulong_t)&intel_info},
>> +	{ PCI_VDEVICE(INTEL, 0xe37c), (kernel_ulong_t)&intel_1_info},
>> +	{ PCI_VDEVICE(INTEL, 0xe36f), (kernel_ulong_t)&intel_2_info},
>>  	/* Panther Lake-P */
>> -	{ PCI_VDEVICE(INTEL, 0xe47c), (kernel_ulong_t)&intel_info},
>> -	{ PCI_VDEVICE(INTEL, 0xe46f), (kernel_ulong_t)&intel_info},
>> +	{ PCI_VDEVICE(INTEL, 0xe47c), (kernel_ulong_t)&intel_1_info},
>> +	{ PCI_VDEVICE(INTEL, 0xe46f), (kernel_ulong_t)&intel_2_info},
>>  	/* Nova Lake-S */
>> -	{ PCI_VDEVICE(INTEL, 0x6e2c), (kernel_ulong_t)&intel_info},
>> -	{ PCI_VDEVICE(INTEL, 0x6e2d), (kernel_ulong_t)&intel_info},
>> +	{ PCI_VDEVICE(INTEL, 0x6e2c), (kernel_ulong_t)&intel_1_info},
>> +	{ PCI_VDEVICE(INTEL, 0x6e2d), (kernel_ulong_t)&intel_2_info},
>>  	{ },
>>  };
>>  MODULE_DEVICE_TABLE(pci, mipi_i3c_hci_pci_devices);
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
