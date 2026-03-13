Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1220A107BCD0
	for <linux-i3c@archiver.kernel.org>; Fri, 13 Mar 2026 18:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=2+HYQGEav/j8tlZDlPhfWXnXbehfAGnuhGcYv8WRnf8=; b=scgsvpitx1mm+dEZB8gl4nNzG3
	CoNpfaJ43cbM6UferS36DT7knnBz+j1OQ02rb5cL+3bLO5KfyJID+MVn7QVIgRyzxF3iOOK6TwApE
	Y1J99nrr3xE6qLzjZ3xy1BHm06C1ORYEFQOlMx6AMNGy9aNhdXf3LF/DAwjj1r3ykPIKMi5IrR3cj
	K7uIs/wlhWn1NmZZoo+KyVKc4XUqmwW2GcsOSor+TxFkniUU8bCW0KkKJzJB3KEt+TSoTmC8YQTfQ
	d+CfGrH4324QZk38iH9BP1opjNr18+9ecgQJayfEePVZU0ixQJbwFqw+cMPYSwSFx/kN3cDuhFLbn
	DpeR06og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w17WC-00000000xHK-3Res;
	Fri, 13 Mar 2026 18:45:52 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w17W8-00000000xGY-3wux
	for linux-i3c@lists.infradead.org;
	Fri, 13 Mar 2026 18:45:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773427549; x=1804963549;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Ub5eNto4OmGXWBHN6aSIeX+va+CgBpIdOqcWBiFu9Nk=;
  b=Ltqqxs1F0YBI2mxDvJuCaXLBXDZUpmE7Wk5kEI57ieZcfCT2znCr4zfr
   Z97oelQeEpAf2Zzo4NM5BtE3wHsCH1IoLCU09k7XEney5CTf9QimkyJz7
   9d+6/ZzRz957mp6XZGKn73wNGF4hLxm9GdbZFJsGTv2pmE+fKlqWaNxgY
   E9DHHWRXZ3MnRB6aOl/CUhtf3sr7XXUD22Qu8YhGyxq2THpSg+TIxXIKA
   GDvZtxOwWY1itRPLLCLoUYuTaNztLCNsTt/LpsQQhfs3aa5n+wtGP0zIA
   YMx6+u6jJop0ktZ5ZUZfs8bNVicYW69pzKs30WIbfPaVEUXZ7nxjsnqb8
   Q==;
X-CSE-ConnectionGUID: 4fLYnXl/SoK5Xvc/24oN2A==
X-CSE-MsgGUID: YrUuIJJLSE2vkvPTCIOPxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11728"; a="78141499"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="78141499"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 11:45:49 -0700
X-CSE-ConnectionGUID: QV7SbGgrQMuz+9Rc3nV1ag==
X-CSE-MsgGUID: 0wyrZ9MyQLCSHxWvdpn/Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="220506104"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 11:45:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 13 Mar 2026 11:45:47 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 13 Mar 2026 11:45:47 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.8) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 13 Mar 2026 11:45:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fTky92rfcPc6m4vfpoL3ob/54V/t213zhGTFSKns6T/T0fxOB3vcwEHi7jZDXS8OK1Ztamp+7EGUgjaw2LWNH3chHlu/tEyqSL3QbTnNkfjDmdCPTVxGXkMYguVmDYZKUe+V2X/gBraDtQ2ASiHzuth6OM9G3pxpmADUUmkO+AlHKQHPZvIrm7yDDjaNAwaJcy7j65k5EvVlYld43U9Ga/EPKUPdC/nWf7fXptx2g96UP00Zb/4vxz425GZN2yIkSjkwmYUHfdPYhjVHjv9qlXxQThlN0+jhVglhN+avXx2NTNCiCZa1Gou7VX75baWhhpicC9wGKONM1JQXoGaAWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bLUk8Io/hTPVlVx6Kh5oMb5sxKKswJ5TR+9neCV7+Vs=;
 b=HB3Ul9+4BBkIMGwXWLS9K/ekAazF5ri+SPp+s7pZasAqNTsGspJQ55Eone4wvgQLrT5hfxObTz8jHPW/Z2TVyr6zvp7SOVYBwR5tg+khKzmFW5J0iFPm646iAGfvCiCp2r3yJ+2uwm7hFpGv700UAjAkwX4jzvsCSvYAnJuAeM1sqeCl7MsfOnaV2o1QkRN91o8kcoVjnH/GNfIWRORW5yVUT7CIhbkQUj8EzOXF2Q9hh0Ofz2eOtkOuR/oWadNhfAKJ+Jq7PSb28kzD2rf/XOzfEE1HC8HdLG3N1hbyre7sQkfT9RZbEztGhyevOF3cL8OsRi/aWTRJD+yXfsFFpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by CH3PR11MB8315.namprd11.prod.outlook.com (2603:10b6:610:17e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.8; Fri, 13 Mar
 2026 18:45:42 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9723.006; Fri, 13 Mar 2026
 18:45:42 +0000
Message-ID: <dd1c23f9-e74a-4370-8c7b-f20a64b5f3e1@intel.com>
Date: Fri, 13 Mar 2026 20:45:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] i3c: master: Fix error codes at send_ccc_cmd
To: Jorge Marques <jorge.marques@analog.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>,
	=?UTF-8?Q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>
CC: <linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Dan
 Carpenter" <dan.carpenter@linaro.org>, Jonathan Cameron <jic23@kernel.org>
References: <20260312-ad4062-positive-error-fix-v2-0-1c933b5c7ed8@analog.com>
 <20260312-ad4062-positive-error-fix-v2-4-1c933b5c7ed8@analog.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20260312-ad4062-positive-error-fix-v2-4-1c933b5c7ed8@analog.com>
X-ClientProxiedBy: DUZPR01CA0226.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::13) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|CH3PR11MB8315:EE_
X-MS-Office365-Filtering-Correlation-Id: c3168678-1ca3-467a-869e-08de8130ba62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: dDs3MmE60eMSjUbAZ+Z0eabykVUSkSrfdrpQIWbXn+Ih1pAstL1Y3VLBR8buT0gEM1+IbLKrXqit8wQRMrnN/W8vzDV8ai5qud79g2iwzyqJL9fURiWG9jSI+86faPx8L81U1NcZEwlTi32gaBce0lNnj4a9YD9rm59Umc4HXoEI0KgztbYlXOvYeKVBpChLCZie3Yi76pZ5WxNDgTLVyO6U49ruzvDaCmEN/ZUSpb9k1qcFv7jMgKH4BwfybSu+5j7M1SEx0HYMEWKmRDczhstDjhAScUKZNc5r1cn3pgLyIS2cFUKydZszAf7NP4+jtQ8p0J9FN0IUeOR7dICyXrFNe33vBG6Y6cbFZ0A13hdLhRtLdUeGSz3ZrgKKjccEz/Vw+zVZ9Zg5EVrcu/YtwjAUQ6VafV4JwtHoUvzh6R2NprluXrH8Q1SuKnR8mwjPCScIKwc36CS7n2rvWaqXZ8lZW4YeATCAAoPk3SIoFm/Api/FNGgimW+aW9aLPuY2ExdC6CTwOYOBn88K8M/yfO/LNsqoElHuM23Zkjn3YRbSlMxZcyYeZ/K2Fz2UWiyi2STNCweaR0r2c2KjnoTwA6x8GdsHkoZp4lI7vc6mzPO32uYygTJEjHN2T7m0XVO1JGT8Ke4pHY+laXQbjTTwRAU2V0zcGHtIT7Ol5M5BqXFvED0EOHq2UBOPoBJMiG82/r9Lhx4b77xCd5aJroUC+pPFUtbjUymAb1Gzv819hWbOjp0kl0A2qqNOy0BgR844
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkpUek14VnJOVkV2UXpoSCsrK0tUK1JWUllsUnExZFcvVFQwMDA3OGhOUFk4?=
 =?utf-8?B?TUwxME1nbTRleXB4UzFyVkQwYVBiRFFHZHpjSlRCM2kreEhGUkZ5WlptNjRl?=
 =?utf-8?B?azFvVDV3THNVdzJwTm1KZ1dFbXN5UVVDRkd5Z0doTm9BaEViSDNrSHhOVWE5?=
 =?utf-8?B?ZERHZUZZajBja1BwT3hUbS9XU3J1eXFYbkF6c3NTa2tYUnNSbzhqR2g1R3dw?=
 =?utf-8?B?QkhlZC84ZmpycUdHcDY0Nk5LMzdzYm5idEdmZTJ6SGFTVWhYMWxxb2RRQkdP?=
 =?utf-8?B?akZIVURXVStFYVVMQldIWktVb0RLbFNBb0ZqTVZ1bWJ0aUxXSk41bmtWWlNB?=
 =?utf-8?B?bWJwZlRHeUhBMjJMNFRDT3lEOHA0VFZqWWRPM0NRR1h4d2p5ZDZ3WWU1RWhr?=
 =?utf-8?B?eGt3OEhGVU1PcEljMEdFcjR1RHRRa0VmQUUvVnA0aEZjdzRQREc2TXowQUpu?=
 =?utf-8?B?Z2k2RWQvMFk2Sk5SRVhydDI5VlVuYlpRanFoQWl3UlByVzlCK2hRQkRSN0lL?=
 =?utf-8?B?OFVDUTF1YnlmUHNuMkFpQ2VHdXlUS2RMWUEvWHdmbTdvVGg4RnYxODc3OVhz?=
 =?utf-8?B?OEhVczFZeXo3bURJN1NZMTloVTBMTUdUKzRDZSt6c1dHRDNvY2pxWW51ZTNx?=
 =?utf-8?B?L3krYm5hU3VRVlBBaXFwUks5c0hzVXJLUDFzU0xUYWN0dkZKMDRndEV3bzBP?=
 =?utf-8?B?VGRpZkFQMEJjNFRBeFBJMW1leVFDalVlSlUxUEF2S1NCSnpzL0s1YXE2Zkti?=
 =?utf-8?B?ZjhuUTRJWVVrV0wrSFZBVENXR1FoUkI4dWc0QTlPVExqQnJUMGZsRUpMb1Bn?=
 =?utf-8?B?TXFocTV1ZGFieGp2OTZBTFlRSk1Ib0gxTmlvdk50YjAyb1FQYlh1TDNlUmti?=
 =?utf-8?B?RnljZ1dEaXM3ZGFYWExseWFhYlI0VzN3ZEd6b3c3MXAvY3JaTG9sNXNKMzlS?=
 =?utf-8?B?dWN4M1lSaS9QNEdXVnRydVg2dXdud0k4TjZpenJHUzZjNnhTNFdha1pDekg4?=
 =?utf-8?B?UVRIaXQvbFBnbTNlWjVUcWYzZkVuL05weUVUWDV5RWxEV0lIclBrOG1qaDNF?=
 =?utf-8?B?YzRhUk9DcjAvNXVLeHhYeGE2N01yT0E3MjZtbGF4RkJqTy9IWVVsYktXT01Q?=
 =?utf-8?B?SlVES1VlZEtsbGpnY28vQUJGdkZsMG05RVNCN3JTUk1hVnNHZVIxY3AyVjlG?=
 =?utf-8?B?WWlLNnhQUm81SGpobHpCeURMMzFuVFh1NkZ4aDRQdUY4YVBISjlIUE81czc0?=
 =?utf-8?B?dzdRcktEamh2Z3k4b2NzTTUvNnpLSW5ib0JqUHI4ZXVRVDVFdUw0Uzg2b2hB?=
 =?utf-8?B?Sy96OEFwcSt4Nk1lZUtSTWxmaFRUZDRqQk1YVmswbVFMOVR2d2t2QUZTSzhW?=
 =?utf-8?B?cW1FZkc0TGM5S0ZoSWJqbmV6RVZ1WTlnM2o1endqZ1BOb1k4ZWZ0NUE4ZVRj?=
 =?utf-8?B?ZkRSNnV4aFVQNjdibU9yME8rMmJFVkY3WE5MakNwQnVwZ0NLSGNIQzJYNnhW?=
 =?utf-8?B?Zjk1bHMwSDlMbDhTVEcwSGw0OElGTHZvSWFBejgxNWpFbUI4aG1RUWpuelZI?=
 =?utf-8?B?MjUxVUhsU2VIekNUajdvTjhLYlNKdzdOdlMvbHVEUlQyYWw1Sk1oOWt1YWc5?=
 =?utf-8?B?MzBUNFI2T2xpV3BpbXJXb2I3d0p1Z0lmZ0FSY0dZMWtncG9ZK09PNlVpWjFz?=
 =?utf-8?B?T2wvSm56ZGpwNXFRRW96QSs2N212ZzlVOFJ3SXFzZk9PcU16OVh5MHZERk5a?=
 =?utf-8?B?NXlVTTlTR1czTVRoY1hsTzZjVlgwQkoyUzdhRmU5anh4Mll6R0tuYlFJclhZ?=
 =?utf-8?B?QlA3UkxpemtleFc2bStZS1lCdkpYbjYzZm5YdGxHUEEyc2hKWURZSDRmYnhD?=
 =?utf-8?B?aWVXdmZBRjlIK1J5T0dueVRxNkZwczdKMTlHZVQrQUt5VGJHYVk2K3pjcC9r?=
 =?utf-8?B?T0hRVWlrR3k2ME16cjNNaHlwYmQ4NThDa0lBWkIvaU42Wmg1ZWlZVWkxNTN2?=
 =?utf-8?B?Z29xWm5JRkJZUTcrc2hFM0YwTzR0bFhoak8xd0luZFhybGVpOEJ6UUQySkp3?=
 =?utf-8?B?RnRDRXFtemhkZ01wN2RLL080RG5jWUpaU0d3THZZQXF4dTZUVUVUR1RwUWdj?=
 =?utf-8?B?cGZVbVRLUHpOSVJHQ2Y2Wm5HWDF0UGF6bW1YemdLSUxJaEQwVWFUZHNNMTlF?=
 =?utf-8?B?ajI4Zll1S09QNTNkci96bnhLczJsem1ac1IyUzhKMFdJUC9RRU9MaHdnMmVP?=
 =?utf-8?B?RWdYUDE4VFNwMTdXMWpnUkoyMEphbE10QTRrVG55T1Q5bWdjTElxc0x5ZkRZ?=
 =?utf-8?B?NWRxcjhaVkl6Rm4vOXJPMHJFd0V1RXJTVEdLV1NoeFpXNlM3a2pwM2pxb3I4?=
 =?utf-8?Q?dNvgNQDd19pzwvHU=3D?=
X-Exchange-RoutingPolicyChecked: hhSqumrE2xyLZhc76kMJDQyfjWybLBpG7+Ks4D0ppUor4M/3I5lR2Mo0F/ZJzNSEc11zZYrzqR3qbX7GSAQma/CvwkRDkTzcpRK4Pmblu+ZMjJ16GaHoNYlpsRCwBLXjknjqLkdqUUesrEjXlIGGoxsFAJKP+Bat0c/IOeqLSOwlEtHliCoUS6Y9vlmMaEN/0FUBIzjDSpiiSWYflED69RWwea5EL9AfvygYm+q/oiGJyMk3fERgFER1vDGbZ46UTqgnzIanrHoeSaqNFas7Om/hBA/lSXqm94q8u/qOYo9ukauoj7PjLgvIastD1jq9DPiAj14rjVynxzNiQxlqtA==
X-MS-Exchange-CrossTenant-Network-Message-Id: c3168678-1ca3-467a-869e-08de8130ba62
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 18:45:42.1095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CbQol1Qk8oFJ7h2EkBzq/+LR6g69g0arBBbG7Ts6XLJuEpA09Sk2EgMs9rx4qaq3f2O36YnVNBQ801rvSu+FAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8315
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_114549_055957_3857C147 
X-CRM114-Status: GOOD (  21.30  )
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
> i3c_master_send_ccc_cmd_locked would propagate cmd->err (positive,
> Mx codes) to the ret variable, cascading down multiple methods until
> reaching methods that explicitly stated they would return 0 on success
> or negative error code. For example, the call chain:
> 
>   i3c_device_enable_ibi <- i3c_dev_enable_ibi_locked <-
>   master->ops.enable_ibi <- i3c_master_enec_locked <-
>   i3c_master_enec_disec_locked <- i3c_master_send_ccc_cmd_locked
> 
> Fix this by returning the ret value, callers can
> still read the cmd->err value if ret is negative.
> 
> All corner cases where the Mx codes do need to be handled individually,
> are resolved in previous commits. Those corner cases are all scenarios
> when I3C_ERROR_M2 is expected and acceptable.

There needs to be a simple way to ensure the essential
prerequisite patches would be back ported also, if this
patch is back ported.  Could at least list their titles
here e.g.

The essential prerequisite patches for the fix are:
	i3c: master: Move rstdaa error suppression
	i3c: master: Move entdaa error suppression
	i3c: master: Move bus_init error suppression

> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/linux-iio/aYXvT5FW0hXQwhm_@stanley.mountain/
> Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
> Signed-off-by: Jorge Marques <jorge.marques@analog.com>

Otherwise:

Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  drivers/i3c/master.c | 32 +++++++++++++-------------------
>  1 file changed, 13 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index bc1189afaed81..0752af5eb79b0 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -898,11 +898,17 @@ static void i3c_ccc_cmd_init(struct i3c_ccc_cmd *cmd, bool rnw, u8 id,
>  	cmd->err = I3C_ERROR_UNKNOWN;
>  }
>  
> +/**
> + * i3c_master_send_ccc_cmd_locked() - send a CCC (Common Command Codes)
> + * @master: master used to send frames on the bus
> + * @cmd: command to send
> + *
> + * Return: 0 in case of success, or a negative error code otherwise.
> + *         I3C Mx error codes are stored in cmd->err.
> + */
>  static int i3c_master_send_ccc_cmd_locked(struct i3c_master_controller *master,
>  					  struct i3c_ccc_cmd *cmd)
>  {
> -	int ret;
> -
>  	if (!cmd || !master)
>  		return -EINVAL;
>  
> @@ -920,15 +926,7 @@ static int i3c_master_send_ccc_cmd_locked(struct i3c_master_controller *master,
>  	    !master->ops->supports_ccc_cmd(master, cmd))
>  		return -EOPNOTSUPP;
>  
> -	ret = master->ops->send_ccc_cmd(master, cmd);
> -	if (ret) {
> -		if (cmd->err != I3C_ERROR_UNKNOWN)
> -			return cmd->err;
> -
> -		return ret;
> -	}
> -
> -	return 0;
> +	return master->ops->send_ccc_cmd(master, cmd);
>  }
>  
>  static struct i2c_dev_desc *
> @@ -1036,8 +1034,7 @@ static int i3c_master_rstdaa_locked(struct i3c_master_controller *master,
>   *
>   * This function must be called with the bus lock held in write mode.
>   *
> - * Return: 0 in case of success, a positive I3C error code if the error is
> - * one of the official Mx error codes, and a negative error code otherwise.
> + * Return: 0 in case of success, or a negative error code otherwise.
>   */
>  int i3c_master_entdaa_locked(struct i3c_master_controller *master)
>  {
> @@ -1097,8 +1094,7 @@ static int i3c_master_enec_disec_locked(struct i3c_master_controller *master,
>   *
>   * This function must be called with the bus lock held in write mode.
>   *
> - * Return: 0 in case of success, a positive I3C error code if the error is
> - * one of the official Mx error codes, and a negative error code otherwise.
> + * Return: 0 in case of success, or a negative error code otherwise.
>   */
>  int i3c_master_disec_locked(struct i3c_master_controller *master, u8 addr,
>  			    u8 evts)
> @@ -1118,8 +1114,7 @@ EXPORT_SYMBOL_GPL(i3c_master_disec_locked);
>   *
>   * This function must be called with the bus lock held in write mode.
>   *
> - * Return: 0 in case of success, a positive I3C error code if the error is
> - * one of the official Mx error codes, and a negative error code otherwise.
> + * Return: 0 in case of success, or a negative error code otherwise.
>   */
>  int i3c_master_enec_locked(struct i3c_master_controller *master, u8 addr,
>  			   u8 evts)
> @@ -1144,8 +1139,7 @@ EXPORT_SYMBOL_GPL(i3c_master_enec_locked);
>   *
>   * This function must be called with the bus lock held in write mode.
>   *
> - * Return: 0 in case of success, a positive I3C error code if the error is
> - * one of the official Mx error codes, and a negative error code otherwise.
> + * Return: 0 in case of success, or a negative error code otherwise.
>   */
>  int i3c_master_defslvs_locked(struct i3c_master_controller *master)
>  {
> 


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
