Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EAD6CEACEF
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Nov 2025 11:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=GskKxAyFYjjqucyjHBRFPV398O7wSn6Nr0TGh76mCbA=; b=pMKoyxGlAWSiba1JFHrEqpVdOW
	80xAe6T1thxj1iGI5pCjssU5xv32mAJMP/30QlP00qAtGNEysXtu3TzGKb5cWb3eE2+2J43fuye5D
	X/QXAV8aWPalq4AqTStrt4+qD3w8sqh6p/+aPLOjLOi8VshPR+/5Orj7dKpYc0+O1rM4lYhlm9bwT
	/ym7zhGx2waBu3OobQjmZr6kcWKIW7Qu7w283KEJdjpNIA2FuvCM6f5DWFYM5fzO5QoRuO+jNkNLq
	tHWfJeo12nWTPYwR7o3e7pIAhOX9IcijvGQIfGfeBMd3DuAFHslz6xy8n1spPrLYzATp4WBV3m44H
	5r2Rc5cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKxXL-0000000FzMG-1YXq;
	Mon, 17 Nov 2025 11:36:47 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKxXI-0000000FzLb-34q1
	for linux-i3c@lists.infradead.org;
	Mon, 17 Nov 2025 11:36:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763379404; x=1794915404;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7cN8rg7kiicKX9pkkokPugfEzptstui9LFNv2RgTQTQ=;
  b=HvuVU7mPFfE5bD2dgvmrRTEBiciCaTP/TuI1wk5xqYH0YbPwFZCG6iY3
   DLXdzbRjF7d6vsI8g43lu2im5P51lq8m+u74Qk0z7wCvWUMtY+jozYaOl
   LybCXoev5uMJXiVN2mBdJUTDoB5vtwxWNaoTT04+8cWecv1k36oLeBBHI
   c5XZwy0R03zlAm/Zo2aoeGDge1lDUU6wMPANXVUCQvJEh8izOvP/cmwBG
   tlgdzTHRpUZr2ojGUvQyy51qok8analOS0Vl3QFUHmi+2z4ogG7EK161I
   2dh2xNu3ddInkSIz4oLB+TsroXZlk05c21M71DZfB1uMfwmpBMvt8OROz
   Q==;
X-CSE-ConnectionGUID: 4fa5xXBOQUSuxhxdu6MCnQ==
X-CSE-MsgGUID: BCGVvzuqTLa/0gPyk9DpSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="83001599"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="83001599"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 03:36:44 -0800
X-CSE-ConnectionGUID: UNP2XmeHTVaJZQvx4+ceQg==
X-CSE-MsgGUID: mtAjByhhTkK4v2wP1P0IeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="190226531"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 03:36:44 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 03:36:43 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 03:36:43 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.71) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 03:36:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uDJXzDdVNq7s2dSCQkabEDwv0Y+PX8s7lBIQwBk+rDO87rGibT6m2v1d78zIQje0XsUgtmMrZDiwVFycndChxEhjz6aZWY9Ad1QUpR7p7zik8VKBR1QStQMya44U+SJRaWsUurxcFUT8cgijvScY5tlrcohNUq7KV9/JAS+OHip4QRVGqo66VV5o4xsRzDKsjT1HT2mGq4rpUBDVSdg+Dzsat2YurzXr6nJPjsJMifypzUfsNmacG1mUrVMESJeKrUl0fxY3sT3ORNe38wer6PwuvJ+fk4SCk5VAuLE9OoJrbPgUVrdvIgW9SA55nGCR/7I0AU7P1QE3qG5/D2K1UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zQjs17S8NFn/bWUzY4EaflBVcw0OVfqZTcyCCRZTFLs=;
 b=VvBHfCxXbAv3yTU/nGKXKXpqqbMpst1eMO3vVY33cMj75XfULwyXN5jDW4KCL+98qjExbNAt765bWKL+gZjAHqG1CgWA6zYzNgkou3BeD5ukEpXphf/4++GUiBhadmaesqTVs4ZLFimoGlpy/6QCroeIqkmf9U9v+qpFNUPW018tZLcDDQrJP0CNlawme8tGCy8bAHYeruONSut1nO0wRYWnCENlusOVltf4k9lPTPSyhdX/6pB/reRHJte1YQC7QMEZuJ1I2oISY57uUY1kSnZGRl0vGv3y5sE3kf+/UWnHxmlNIvwAaDLdVIOagYEY0D9AEeI3AJUqZw16OELgKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7215.namprd11.prod.outlook.com (2603:10b6:8:13a::13)
 by PH8PR11MB7048.namprd11.prod.outlook.com (2603:10b6:510:214::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.19; Mon, 17 Nov
 2025 11:36:41 +0000
Received: from DS0PR11MB7215.namprd11.prod.outlook.com
 ([fe80::9201:63e9:3175:5392]) by DS0PR11MB7215.namprd11.prod.outlook.com
 ([fe80::9201:63e9:3175:5392%5]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 11:36:41 +0000
Message-ID: <e8d64938-9e9f-4899-bc37-dd78f02adc78@intel.com>
Date: Mon, 17 Nov 2025 13:36:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 12/13] i3c: mipi-i3c-hci-pci: Add LTR support for Intel
 controllers
To: Frank Li <Frank.li@nxp.com>
CC: <alexandre.belloni@bootlin.com>, <linux-i3c@lists.infradead.org>
References: <20251114181356.66515-1-adrian.hunter@intel.com>
 <20251114181356.66515-13-adrian.hunter@intel.com>
 <aReMbhYuSCT5RNnX@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <aReMbhYuSCT5RNnX@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: LO2P265CA0119.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::35) To DS0PR11MB7215.namprd11.prod.outlook.com
 (2603:10b6:8:13a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7215:EE_|PH8PR11MB7048:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ba241f3-2103-4958-656e-08de25cd9385
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?elJuQjBDUXBUWGtYNkZiWG4ybFNrSWdTRG5PWUFYZTdRRG9hNlpQT2Z3MDZs?=
 =?utf-8?B?cmFHZnFpUEdsTExFOWJLLzRUUW5UYXZqQVZ4bFdHeVRFY0VMdThId1luM0VV?=
 =?utf-8?B?VlNLMnZ3S1dtM3F1MU92bTJuYU8yeDRZYlpjR3UrSmdNZTdJV1FBYmc4N3Ir?=
 =?utf-8?B?TlBnZUh0dm8yUVE3ZHdUSGwxUlFqUXliMFMrTE5nM0c3cVVib3VvWjN5Qmlo?=
 =?utf-8?B?NE96RDRmTjgvc3RLd29vQ1AwVFdEKzFTL2FNNXl2SFJ6amZURWJNR2dPK3Fm?=
 =?utf-8?B?TVpHN2FMdE9PMEZYYk4zdjBtWHVpTmRaY05DLzFCVjhtYVNNOXEwcEZ6UG5Y?=
 =?utf-8?B?RVpMY2RqakZCZjRJeWJ2S3piMTRqU1Zaa3owa1hubXFuRDFzNjB0M2NTV1R4?=
 =?utf-8?B?a3lxR2QrbzRmbjh3RGlLWkZkd2hOdVFLM0ZBZkJDUmhOcHpwYldHWTVoQWZP?=
 =?utf-8?B?WHFWVVJVcW0yOC8wcWZscFV5TDNTZlovaHZVQmoxTFA3VE14MVRuUW1pYWlC?=
 =?utf-8?B?enNLT2c0SlN2Qk9mYjJ1SDNnNXRiVW9TYzlvU245V0kxdVR2ZWFTblIzN0Vu?=
 =?utf-8?B?Y0Mxc21oRzk4SUJkbkd3ZGE5UEhranV3dDhOaWFBaTBpT0U3b3p2c3h3WGRi?=
 =?utf-8?B?TFlRZU9rV2YrNndqQ1VUUXArdkxKT0NUSmczbFlnbC9ES2NwcER2WDU2eWR3?=
 =?utf-8?B?SU1VSnY3aGZJRWxLSi9mUmtIbEtqUVlaS2p1TWxHQktOWThuZm8yN2xVWjFN?=
 =?utf-8?B?VDJIM3l1YnUwTDBsdEVKek1LS293N2ZFdXIzRTNEZWhDZmJRbXJaUkJkRStG?=
 =?utf-8?B?ZmRpL0FZbDZxR1krTlRRbkhQWXROVHhuaGNFc3hmWkl2TGZidWVlUFl0anJF?=
 =?utf-8?B?UnpackxCQ1poT2pjUklpbXNVcmpyRldyblcxeGU2T1VJQUJDNjVRNXhJZW5r?=
 =?utf-8?B?WUQ5U2ZIZmtleGRjY2tieWloUEdvWXk1VkZuUUU4RE9ETTBIcGQ1bkZqSHBv?=
 =?utf-8?B?eGFBWU9qckhWS3V4L1VxQjJTMFgxejlpMG16ZXcwTzJ3a09Ham5FNXJXYkNU?=
 =?utf-8?B?OWFaSmRsN3JKSFBzME84a1JMWkx1YlAxZkdHNU9tNWdaeEtwMjVzTlB5RnJ1?=
 =?utf-8?B?bTUyamROKzNVL2hDbzdUWXZwYVVJR3ZIM2xPQytpdGZ0eWdoMmFIdU1aMFhw?=
 =?utf-8?B?cmlkUVVnbEtiK2dadkRFbmQ2d3Y5RW5PSmhRTzc3QXgxWFYxVzFwWm95V3N2?=
 =?utf-8?B?aVpZQTNwVFBsdEpkQ1c5YTNSZWtPQXBpTVlvZ2NmUWgrU2J2VDd0a1VoYitk?=
 =?utf-8?B?emtJTGVleW80NlhOdlByV0NCNFExVThBTVA5eUtudDh3U05jTGszTmNJeE5O?=
 =?utf-8?B?MnY2V1ZqT1ZpS0dPRXgrRURMM2tCaTZkd25ZRnRiWjVaRS9FM3dhdG1DeS83?=
 =?utf-8?B?YVVrZmFybkt4NkFIbE9RdDY0NFV1eDNyS1ZmbVdEM2JXemFjcy9ucTJ2bjkx?=
 =?utf-8?B?by81MHNWTWsvR2c4aW5qdWZhMVhZSTUyZnY4ODM4R0hnYkI1aCt5WjVTZmJu?=
 =?utf-8?B?YmV4NzFpemxPaGhYeVRFMVFNcTI5WE40UjVZYTJQalpjS2Q4b3JGTE40S3Yv?=
 =?utf-8?B?clQ0eS9NelhkNjdTOUVzOHZDVHc4RGJkNFFOdXJwVk5aekYxSURRNHBRa3V6?=
 =?utf-8?B?QXNBZFRPK1pSRmVEbStBK3FLdjZMQnY0c2x0RGVpazExdDljbU02WTRNT2lM?=
 =?utf-8?B?TnY2d0k5Sm5CcWVSTUlqNU5YcjhlLzNWL3hGUFNkZGhpZDc4UUZITWRXNE51?=
 =?utf-8?B?UXl0bnM1N2tDMHlKZVNnUysxVWlBNEdhdXpWSVFUOWp4NTg5azlBUWZ5UjF3?=
 =?utf-8?B?Ylp0SnpMUkNrYnJhS0tyTE5QQ1NWdm5VS2ZGSWdZSmdtZjd4cE96eGdjZ2VC?=
 =?utf-8?B?dFZxR0VJZzM0bk5sWjVnOEdxU2U4WUdyUFo4VWp0aVdDY2R3SU5ScUE4T0d5?=
 =?utf-8?B?SkdtYnhQQ29BPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7215.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGxYNHpOQy9QKzNESTRpWVBienZiRHhpekY5cG0xU3hhY05qd1lWbkxtMHVn?=
 =?utf-8?B?Q2RQNW5CTnVQcTFWeDVTZHVrRXdvV1FiUlhNdThmUkplWnVmZC9SV2ZuYlNj?=
 =?utf-8?B?RFR2WElaV2R0Y2pVbVpnaDlXemgrbThRRWhSSTU5UDYrSUFtYXMvbkZWd29x?=
 =?utf-8?B?cVl4TW16cHI0UENBc1BpL3ZlUzdTZjdiUFBLTzdTSnBhVHFwUysrRmdOamRp?=
 =?utf-8?B?OTVDVnlIbUhYZTNrbkdZdzh6OXZxMUtsSkdtYTYrZmpHTml4T3hJZW01cG1C?=
 =?utf-8?B?dFNBRC9saVVMWXp0eFdmb1dRblBwNHpxNWtVb0tFeWZPbElLUGhvV1FSTS8z?=
 =?utf-8?B?V2JIMCtXM1JaeHF5cnRlUnJ3a2ZHNi9CUWQweEFhWmNaUUg4SHo1MnhISkRh?=
 =?utf-8?B?c29OWFdwb0JxUU5kTEpyU2NKYUVheTgwU01CVXhDOW1wWFRtR2VzYTQ3UjZi?=
 =?utf-8?B?aGgxMytxQzM2ZGI5a2FxZTVKWm1SakJ3TmZ6U3Mra2JHYnMraUFkZTlHYlpn?=
 =?utf-8?B?djJPZjJReVdkdFRzZzFySjFKQUFwa05MNFVDRnBlMDd2WWFCMDd1cEx1MFdL?=
 =?utf-8?B?dW5YTW52aHdxaUpyb3F0U0VBeDJjTU5hcU1rYkVaVVMrQUtHWG9mbU5CdDZy?=
 =?utf-8?B?THdOZ01oY1E0RWNJZy9EcUUvM3RxMlNjS2ZhUzJ6eExVWHovQzB3U1AwUWdi?=
 =?utf-8?B?UW9qbGxsMG5udlRkZnQyV1d6QjFYM2g0a2VhTWVqVVZ0NStDRHFTUDVKSE01?=
 =?utf-8?B?UXpmR0lQdXQxMUJLT0xVeDlWY0I4UEVvaVZ5ZENqQk5OMWNJcFRTcER1bTRT?=
 =?utf-8?B?OXR0OTY0MFYwWFlaMGVHUnVxQjhmc0VaQUxvYWVHUDB5WVcyTmsxQnAyVWpF?=
 =?utf-8?B?THdhN0kwOVlRbUhDM3ZYMjN1d2tnRnBBQnRBS3dBUUNzMi8vbzB0V0c2RGFM?=
 =?utf-8?B?N1djRnZEQ3lkaFFmRXhEaVYySkNsamRGYUNwRk5vZ1AwZXltUHljZ3lDbGtX?=
 =?utf-8?B?ME5HcDE5YVJmQU00ckJGakRhNVBXRjZKVWJPamt2T01reUY4bW9oclpFZVZG?=
 =?utf-8?B?ZlkwdWt6c2htS2JycG9UazRSSUdxakNkbk8wK3dVcUdGbFJKbCtTYng2Vmlq?=
 =?utf-8?B?YWovTmgwUVVhcUhmWTcwQk55MUswa0R0aWVyWW9jUDFUbVdqSk9ZQUVycE8y?=
 =?utf-8?B?MStSLzdUcVdzMWVKYlMrejh5Ykt2TjJ4bjJaeVhLRTFibm5QcXV1QjAxZzN2?=
 =?utf-8?B?azV4eUpRNVovWnI0SCtvd2tHMld0Smh4VkJhSWUvcVd4WStJMzlLNXFGZEZi?=
 =?utf-8?B?UzFsc2cvVE1vbzVzdmZIQkZZZklGell0VEswc2FiMHVBcmJsY2hBcTJLKzBZ?=
 =?utf-8?B?R2JzaFlJakt6dEk4dWFIWXNyUkkzS0Fhb25peVh0M2FFS0diMEtXd2RlK1Z5?=
 =?utf-8?B?M21Dc2JoamxlS3lEUmowb3JvbnNlUzJoYlJmbHZGSCs0U2hPZDViaGpzQ0RW?=
 =?utf-8?B?bXJUemFnMTBWaC9paGJ0QldYR3lZQk5pZFo2UnJnc0MyQWdBVVlRZ013aEND?=
 =?utf-8?B?WGlwUGpMaVAxa2lOYlJQZXJrM1ozNlNEK0ZjKzkwZm0vbXN0YzR1QmFyVFMx?=
 =?utf-8?B?ZFNuYlVGQnA4RFRPemQxY2dUai9ZcHdlL0ZibFdkYzZFaW0yMWJYUGFMeE1P?=
 =?utf-8?B?WFVVblRsWXEwQkxZOEdlR1NHUXhXV3drdm1ldC9zR1JkT21iV2syLzQ4U052?=
 =?utf-8?B?RjdVY1hVcU5OSUc5MzZ2c1JVZmFyZlc1Ti9ucDFvNkVtZ1UyQzZuL3ZLUWtN?=
 =?utf-8?B?NTZnNFdMOStpUnlCMkI2V1Zia0dmcG4zUzVwSWhhTFl5dFE4ZjBaY1ZzQTVv?=
 =?utf-8?B?R01YVWVYanVQR3d5cVV4NVVTcFZCTG4rZmw3RmlBYy9qWjI5b2RsYVV4bVVB?=
 =?utf-8?B?MjBuZGxSSXdzOWxNemVQc2E0bXl6MWtqT3NwdkNwSXpBcmdBaVJZTEJUZWVv?=
 =?utf-8?B?bU1yL08yWmVpZE55bnVzLytuNTk3WDYyQkZvTTgzL29TSStiL0VHTms2dkJ6?=
 =?utf-8?B?QkpmWTgwMGdEa3YxUFQ5bjlnYnVnZ2E3R2hHNnRwUGpuOUtiQzRISjhjNXJN?=
 =?utf-8?B?V0RJc0NjQzdlRUplNWNaUEduN1gzWUFoRHZSWXUvUENUeHhMS2tYR0V5NHc3?=
 =?utf-8?B?Q2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ba241f3-2103-4958-656e-08de25cd9385
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7215.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 11:36:41.2718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q/qaigA09DjXPD9D5jWrWhzVvT307gpzPn7LwWc0axzGE7pvogqKdFW9h42JUHA1jeiup3U0hw39H6AJJTNXOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7048
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_033644_834134_3FA21DBF 
X-CRM114-Status: GOOD (  16.61  )
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

On 14/11/2025 22:09, Frank Li wrote:
> On Fri, Nov 14, 2025 at 08:13:55PM +0200, Adrian Hunter wrote:
>> Add support for Latency Tolerance Reporting (LTR) for Intel controllers.
>>
>> Implement PM ->set_latency_tolerance() callback to set LTR register values.
>> Also expose LTR register values via debugfs.
>>
>> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
>> ---
>>
>>
>> Changes in V2:
>>
>> 	Make use of FIELD_PREP()
>> 	Improve handling of values that exceed the maximum
>>
>>
>>  .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    | 125 ++++++++++++++++++
>>  1 file changed, 125 insertions(+)
>>
> ...
>> +static void intel_ltr_expose(struct device *dev)
>> +{
>> +	dev->power.set_latency_tolerance = intel_ltr_set;
>> +	dev_pm_qos_expose_latency_tolerance(dev);
>> +}
>> +
>> +static void intel_ltr_hide(struct device *dev)
>> +{
>> +	dev_pm_qos_hide_latency_tolerance(dev);
>> +	dev->power.set_latency_tolerance = NULL;
>> +}
>> +
>> +static struct dentry *intel_actualize_debugfs_root(bool add)
>> +{
>> +	static struct dentry *debugfs_root;
>> +	static DEFINE_MUTEX(lock);
>> +	static int ref_cnt;
>> +
>> +	guard(mutex)(&lock);
>> +
>> +	ref_cnt += add ? 1 : -1;
>> +
>> +	if (ref_cnt) {
>> +		if (IS_ERR_OR_NULL(debugfs_root))
>> +			debugfs_root = debugfs_create_dir("intel_i3c", NULL);
> 
> I think it'd better to create common "i3c" debugfs root. So your device
> use debugfs_create_dir(dev_name(&hci->pci->dev), ...) under this common
> root.

The debugfs files are being created for the PCI device to contain PCI
LTR information.  The i3c module has nothing to do with that.

Also, currently, there is no module dependency between this PCI driver
and i3c, but a dependency would be necessary to coordinate the creation
and deletion of an 'i3c' debugfs directory.

The extra complexity can't be justified.

> 
> ...
> 
>> +
>>  static const struct mipi_i3c_hci_pci_info intel_info = {
>>  	.init = intel_i3c_init,
>> +	.exit = intel_exit,
>>  };
>>
>>  static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
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
