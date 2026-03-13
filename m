Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF90107BCD7
	for <linux-i3c@archiver.kernel.org>; Fri, 13 Mar 2026 18:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=2LZkLwVQuT3ynOf+tiC3eREm+K0RjxPiHZMEelx8LQU=; b=qKYPGFgSNfy2U6eLQ5rP5G9lrI
	HzU9lqy8jLstFJ9mW3+qoeSNGZi8Vi2pGYEphOzM3HfRqKG/k7F6sHYyKNndT5iq728Vc/V1TlSiW
	SEAWq74BvaHrJdkD0W3pODvf210/s/I/oZTZz7e8BXEU03ywaFZminiZflfakUQjf7kDe3rGiSC0F
	HSUQ8jyVDdkrKi7H6YHJ7JbJ+POfeCOvXd+iUiVkElEK8rEignps5LHCetmHVkXMOP6uHbpoJwsXS
	xDftmUZzj9v1EGIdkJUPliFNF6zPkluE7Dy6wc7BC7PcyaJE88dz9XyOcavSGmOs6GVPgxnhsPD9P
	QFsrpCJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w17UO-00000000wxN-3Vt1;
	Fri, 13 Mar 2026 18:44:03 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w17UM-00000000wwk-3Pkv
	for linux-i3c@lists.infradead.org;
	Fri, 13 Mar 2026 18:43:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773427439; x=1804963439;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=8UOVKnWeJPlGZhXJAS/8CORTFfYKp5FwyGrWFEKJqHM=;
  b=J8ckvc+TWrF8maEBfujk74fkJLwvxhz5SthvK5BhwB8aPXPr3OJpBUHc
   F28hNQuMGOLLKu3LQAsmsPmgJjI99jzfQJDxFV02lUXK9ddNYaTFKMIsU
   TOd1K713EU50b4T33cSfMoWc+Y4wdB1tN+ONw3AKuqggiz35jk1aXBXu+
   DDaUiYgP8TA8doocUiCHvEkeEN4caxiBwI2kXPzJYZc4soqi+aNcUCQ2Z
   eFxJPp9CJHYV1zBLA/pkWrlNjZdRAJrIKV5N6gsIvkUyFq84k2WTGSSXc
   dY3C07RfqMIki95VF+Z5VeS10kzHj1e6ywgbbTgZEG8VIAgDXIi3k50w7
   g==;
X-CSE-ConnectionGUID: bx4Ko6vlQPGu7Xb6GTSRAA==
X-CSE-MsgGUID: xu/2WKEtTzuU4Q3znMPyHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11728"; a="78141237"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="78141237"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 11:43:58 -0700
X-CSE-ConnectionGUID: 0z96psNsQtiSILBtbJYXog==
X-CSE-MsgGUID: NMFl3YUhR9ycRPB55ZL8vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="221465241"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 11:43:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 13 Mar 2026 11:43:57 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 13 Mar 2026 11:43:57 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.25) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 13 Mar 2026 11:43:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h1gV3wPHSpWb/s81QNtG2HC3VxEU+9rlFh/wyd1whh7gR6UnCsfdEjjLmmNo/lbTkOMFyZO1mR/RF8/BEQY+Dj+KjgSNuCABCNsKLujvNheZ1/Bx864uRiT5z+IASezrWpHkAV/KD/GtWZpGNjZdOgjlz0LW0FX0OEyifW7PdfPM/NYjcBrMBeif5PFGN9w5esH53AyuhgDvziYukcFLMGITJ5GpK9aiGieu9rSABiHaTtTTz760i2MP2eoGWQ7okIzvMD6MfaowxMVucDgKeY+OORCFYJnJlVuL4wyNlBNnDwYdBpbc/MEzUAKaHoNnVZ3/zLtgGhc3akCYofK9Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p0yCBwoiXjZ3DXz+cmf4hU+I8WB0s/RJd3tetZHlwzQ=;
 b=f456CJmyFdUGwYVDkWRFY4sAcgqXoaHHTLkFfiEfQHXJ3lL2eHC8xq3KRCmRNGpM4TPNAdEUdRT47d6gOabijYhMs2dbKirbqGhBS9YHPMRUsoIKCd5J7iDaxh15jcS01MiLJmSEJJ4VhWelzaBDupvl44nMx+3qe8QZEVAB8AppcRm1a8R8FNJfadeESC1p97YMVWdUWGHJZ8pQsMvVacVLNDV/vEZpPTd0iEn3MmvKnK7x4WxObzrCxrv+FNDsa91K5vVfGPz4qETN1g8iE2oc1rDwF0QJ4RjBSKRHHG5CLS8V+h6gxOhqO7cj26MMwD+Ls14flrjF/2X/UU1FQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by SJ0PR11MB5023.namprd11.prod.outlook.com (2603:10b6:a03:2de::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.8; Fri, 13 Mar
 2026 18:43:54 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9723.006; Fri, 13 Mar 2026
 18:43:54 +0000
Message-ID: <aeefe300-b794-46e3-8393-16a6adb7fa93@intel.com>
Date: Fri, 13 Mar 2026 20:43:49 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] i3c: master: Move entdaa error suppression
To: Jorge Marques <jorge.marques@analog.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>,
	=?UTF-8?Q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>
CC: <linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Dan
 Carpenter" <dan.carpenter@linaro.org>, Jonathan Cameron <jic23@kernel.org>
References: <20260312-ad4062-positive-error-fix-v2-0-1c933b5c7ed8@analog.com>
 <20260312-ad4062-positive-error-fix-v2-2-1c933b5c7ed8@analog.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20260312-ad4062-positive-error-fix-v2-2-1c933b5c7ed8@analog.com>
X-ClientProxiedBy: DU2PR04CA0279.eurprd04.prod.outlook.com
 (2603:10a6:10:28c::14) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|SJ0PR11MB5023:EE_
X-MS-Office365-Filtering-Correlation-Id: 99338ef1-c12e-485b-e732-08de81307a12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: HsbSoezAAH0IBW54TiDRoDHMZ3Kg+pXdjh/OOzoAgnZtjCa6V8J3zEy8xFkTVGtUIz4IkcgBzh34fKHh8HtXI/D5Nn624jIvPEdDfaeaSb+SRQsBBgcg+7wV2lTaEbCqqNDred5p8R1mwsQZUB7SbFzqso+vDO/Y2YMmB2MQ0dMq5peO1S3QxdzU6ZhTVdy6wmnXQeFjyHO3z24C86SKIsNFHl2JJMHTGPQTykpNI6tOBsnqf7HU74Ll1SzafaNsAePyQ0qK03i3FonSeD0hKOEeFDZD39IzWonykK/nmOmCBtJD26PVMrAQOoskwFX+0MfAilrgwIhjKzAzpJUakVTl5nFip6yoYWw2ijmMMuum1X3AN67dnwIjeXpCJ4/ATE8PXv+J+H1AvkVbhmVyJqfc8fryqJK7LqrQ3W1GIwy3D7c9aYRs3hxkNcKFuHL66UpcPhUQlFT3y1uKPK05SmILFunEVJRHU6/i/sXkNz68fQtNuJ0+DjR8tk4Tdir1z9CzyfSU5S7ocPpBh+2H6yj0pmeQ4uCsPrCf/0gLt9WTdNpg1KpTZoChr0evOEWsB5q0K31NMNMWQ+ISEIXOZHFENAwLjO+mzjhAO9gFq4kN71uz20gYWy0ippRCQfquhCtHou7La/MkJOBHElS52JYYaW5ym0neur8DQee5RTbDQnCrd6x85ABi+xi+83mEy8b3nof9nFg3c0oQP/yA6w/89Xxyum27AGBrdQ6Szx0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1liRlliNXRHYVBuWmp3LzdhaTNibER3T3ZNaDJoQlBIZkJQUjZBRzdQUGt6?=
 =?utf-8?B?Q2taM3YwbUdPdjh0ZCtjMktvdWVJZTFybkdoMjNtYi9za09lTVEzL0xjTXNW?=
 =?utf-8?B?WkVPK20xYk9vQVJ2Z082bVp1MURrSmVXZ1VBanRyVm9FbkZ6MzQzdnBmNFpm?=
 =?utf-8?B?Vnh1VGJXWm4wMWlVMlArdWVKNWYyam5BZzRDRk90a0ZyRGlkbHRxZGVndFFJ?=
 =?utf-8?B?cnZmcmczOGl6SW0vOFVnYzFpZTRDaWJjclpTeHJvTWFFVld4d09tVitYcjhy?=
 =?utf-8?B?NlpCWkF2a0gxSjcyQjIyR3h5QVBtMUNVTmNpcW0xbHkwb3lEd1ZLTzRIWGlm?=
 =?utf-8?B?WVFWTStnWkJjZXNoU2YxYy9tZ0RmcjRhSG94NG1VWHp2MUxWUWd6RHVPSTda?=
 =?utf-8?B?RjhUSFYxQktVMGE1ejdCN0VmUnBFQVJEeVFNc2NlOXNKaEMyY0wrOGhHQmtL?=
 =?utf-8?B?YmRqTGtUN1cxT1haYlZJYVBaQ0hWaFZ1aXRxaEU0MStITHVWM2hIOCs4VlM1?=
 =?utf-8?B?YkFET0pRK1ZTZ3RqcFpwVDJLV3Izc2xPaWdyTUY1UGkxeFhlaGFCd3hBK0N4?=
 =?utf-8?B?NlJPb3RqQXcrRk9VUkIwQjg2OW0yL2l5RllwN21Wakg1WFFDa095VktIMnRa?=
 =?utf-8?B?SlZFTXBmOE1mUUJFWXJPUUpjMU5wMG1LUnBmSzJEeHNNQ0lyTXprRWF3bmQ4?=
 =?utf-8?B?TkVRcGQrVUZFWkNRZHNTZDNoZVlQVFhnTHZEbGhnbkhUTXhnUUFVTlFSWE1r?=
 =?utf-8?B?cEhmTXFzU2RnN29kQ0FvbFd6QlNKSDVMa0xqUjJPUGJyUUhWZGs0ZDRtUUlZ?=
 =?utf-8?B?bzc2dHNnVlZUa0pXcGtiZ0hqM1pVV3lXTHlrNUZnc2FKMHV0ZzVTR1lscHRw?=
 =?utf-8?B?Y2J3RUhCNXhENUx3RTIrUCs1Mkx0bEk3cWpHTFp5VlZ5ZVJBc2E5djk1NmIr?=
 =?utf-8?B?SVZoN1YrNVB5NE5veWx0Y0RBS0FMUlF4MDZEbGx6ZWhEZFJQY2VqaWZvQnY4?=
 =?utf-8?B?VVZqWVlyRUtjYTNzY0g1bjQrbHVxZSs2ajJienRBaVRjMXdtak1KNVVDd0Uy?=
 =?utf-8?B?N3ZMMllId1VyZjRnMHkrdTBpSmdpMFVHTGg0K2FJQm9QSEtQaXhCUXBSS21C?=
 =?utf-8?B?TlI3ZzV5MTVxWUhRdzR4R3lqM1hzTCt0NVdqcHkydzVEbmJMZ3prcVNmYjBu?=
 =?utf-8?B?Z2psSG9URVRacUl6c2xxUWhNSTBUNUJUSHF2d0ZJWUhEdHF0alJpRjlBdU4r?=
 =?utf-8?B?ZWR3djFwUGVNZEViZzJRbW1ucTRxdkZaekExK3owdHgxaFcxWnRXbHFVejB4?=
 =?utf-8?B?UDdSNTZFeGJmc3cxUmI3RE4rK1Yrd0dKQzRXUERzUHRrclN2cWNRUWtTL0x5?=
 =?utf-8?B?VzFkU3F1K1N2bDNCQVk5N3B6U1VpYnh5S05hUHBEU2lxMGFxcG5VQmkxeGdp?=
 =?utf-8?B?Nmg3RGlTc2NnZG5XeC9EaFh0UlhMUmJYMy9EZ01yV3UxSkhaTG8zVDlIRjNh?=
 =?utf-8?B?Y1dUMHZ0NmpTZ2xLN0dWMFpqMmNIekdkVS9VZnVPSWlNenF1cmlSMkRkNXFJ?=
 =?utf-8?B?Z0NPelZVcjBibU9lMVg3VTRqNHljdlNQaFlaSmRqbmg1Mm11M2NnWmZseUJN?=
 =?utf-8?B?VUxVa3NBSFhZTVNmVTVQTmdQWG5YdFRmeGZhNzNiem5oRTFDN3F5UnZEUlpw?=
 =?utf-8?B?VlZOUDVhVUZNSVNaTEo2aFJtS2pTS3I3NHZGUm9qb3VOY29IZjNWV3BoTkNt?=
 =?utf-8?B?S2kwZzhRVGlvVVhVN1JGYnh0d09SM0RLdDFMaGpZK0FmT1NreWpDSmRFeHV0?=
 =?utf-8?B?NjNjTCtkSTBKYjlOb3FoNWhZOGozQ1Y3MmxEUFI1M2RkeDdjT3JETThFMUt3?=
 =?utf-8?B?YVVwRUFlNUYxYVJZQktwVXNSWGVQS2xQa1JGMmd1NkdnOUQwVlJmT1oyem9W?=
 =?utf-8?B?TWdrcFE4RWZEWE1oRUFabG56S2psd0t4TFQvd1dSWmJuZ2RlUVRnNDhEUG5N?=
 =?utf-8?B?UmRwNFRZMUhoTzNBTzIwcFhmai9WaWZrZjRUOUhEcGFHTkhOOVlybkYzK2ky?=
 =?utf-8?B?eHkwMGU1YnRHWitRbHdrTVA3dFVDdDczWkcyZFU3MWJJVVFjWHBVT0JwYTBH?=
 =?utf-8?B?dXVoV0pYU1IrZ016c25NbGo1dVZjSU1zK0l4QkRyNzFVTmRVeUI4cE04UXda?=
 =?utf-8?B?WkxHcFF1Y0xpWHB4Yi9pNWFERmdkWi9XVUxXZWtyNythMlFURlUvOGlQTmtT?=
 =?utf-8?B?Rk83L2hRZ0R2bTcwTzVSdzJWOG16NzIwcDdwaHdyUzQ1M2I4ZHRCUERiZkJK?=
 =?utf-8?B?aXVsOW5vMWh2U0hIVmNBejNmN1orQkR6RFBEQTBmaURMN2FSTGh4VHI0YUlB?=
 =?utf-8?Q?ikKqx0/n4Jk2S3Ag=3D?=
X-Exchange-RoutingPolicyChecked: PMooxb5Wy64i9ErSsdB8HaMwbIBy4ok3znKkLuVtFu7QEcy+G6Lo/jLzZrzup/rExTsb9lXVmEVfPrn6Y+vJGRaUppgGw07R3B90yda6VBuj3tO0OGIk0ppqY43Z8B51twhy8zWnRuGrSUzZ1Dg+eFjSn4TXGJ2pBJLPvBrj0Sz6R+3HFPO0edHmhzwJp5hh0q/yeZX2Qe8GdBodc+hj9Nf8wrxN9o/9ys4ZnpNZE8JRn0JsYA7WD9LsGKwso27kl7GZB0B++TduhZV9mBaqLO0hV5QdYAej2SIVxRVauIB6cqz2pYMNOR3rS1J2qha49mw4+ZUPwGDqF3RWNTOFmQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 99338ef1-c12e-485b-e732-08de81307a12
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 18:43:54.2885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MPxCKID8xI42SZY2o2MSGAfHzchyhzouBYftAUx35MvlayyErYpMUaqSMBWYz9GppHivijhBnvNCUu6hgrZJXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5023
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_114358_909055_3A96F947 
X-CRM114-Status: GOOD (  16.35  )
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

On 12/03/2026 18:38, Jorge Marques wrote:
> Prepares to fix improper Mx positive error propagation in later commits

Prepares -> Prepare

> by handling Mx error codes where the i3c_ccc_cmd command is allocated.
> The CCC ENTDAA is invoked with i3c_master_entdaa_locked() and yields
> error I3C_ERROR_M2 if there are no devices active on the bus. Some
> controllers may also yield if there are no more devices need an dynamic
> address, since the sequence do always end in a NACK. Handle inside
> i3c_master_entdaa_locked(), checking cmd->err directly. Both call sites
> are updated, adi_i3c_master_do_daa() and cdns_i3c_master_do_daa().
> 
> Signed-off-by: Jorge Marques <jorge.marques@analog.com>

Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  drivers/i3c/master.c                 | 4 ++++
>  drivers/i3c/master/adi-i3c-master.c  | 3 +--
>  drivers/i3c/master/i3c-master-cdns.c | 2 +-
>  3 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index c66f2655eb404..d4f9e7df4adc5 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -1050,6 +1050,10 @@ int i3c_master_entdaa_locked(struct i3c_master_controller *master)
>  	ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
>  	i3c_ccc_cmd_dest_cleanup(&dest);
>  
> +	/* No active devices need an address. */
> +	if (ret && cmd.err == I3C_ERROR_M2)
> +		ret = 0;
> +
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(i3c_master_entdaa_locked);
> diff --git a/drivers/i3c/master/adi-i3c-master.c b/drivers/i3c/master/adi-i3c-master.c
> index 6616f751075ae..fb9a488304469 100644
> --- a/drivers/i3c/master/adi-i3c-master.c
> +++ b/drivers/i3c/master/adi-i3c-master.c
> @@ -655,8 +655,7 @@ static int adi_i3c_master_do_daa(struct i3c_master_controller *m)
>  
>  	writel(irq_mask, master->regs + REG_IRQ_MASK);
>  
> -	/* DAA always finishes with CE2_ERROR or NACK_RESP */
> -	if (ret && ret != I3C_ERROR_M2)
> +	if (ret)
>  		return ret;
>  
>  	/* Add I3C devices discovered */
> diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
> index b78aebf6b2ca4..5cfec6761494d 100644
> --- a/drivers/i3c/master/i3c-master-cdns.c
> +++ b/drivers/i3c/master/i3c-master-cdns.c
> @@ -1143,7 +1143,7 @@ static int cdns_i3c_master_do_daa(struct i3c_master_controller *m)
>  	}
>  
>  	ret = i3c_master_entdaa_locked(&master->base);
> -	if (ret && ret != I3C_ERROR_M2)
> +	if (ret)
>  		return ret;
>  
>  	newdevs = readl(master->regs + DEVS_CTRL) & DEVS_CTRL_DEVS_ACTIVE_MASK;
> 


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
