Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B7CDCD3430
	for <linux-i3c@archiver.kernel.org>; Tue,  5 May 2026 09:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=W7UDyrpRq/yaCuGm2XKSNzI6WaK+WuMVn8xTXlM0bBA=; b=j4cD8EA03/VlmBxY7X87o09Kt0
	47pz8hTAYnEkiFPIFNn2Pe9oF1sfdkHHOCXJwsR88ATDc2IB9NEAJqO8k8MfLi2O3oXrJZnVxjH9i
	0yEwNsjoXJF+IoWjfNBVjijOZYdR1u5Dn7UPTEGNr5STyIIM/f8s4/HHbkzDayFk0IBTM5Xjfr3Ni
	/VQ8Ud2P5P6cbXjt2Ebo0ScKI/jtCPXZ4BnZuhTXolwFj8D5r+G7eZtCL8WvUqGEuGdaBgB5dvgdK
	ewlDfcrkYbRQt9PRC5Rs5NoaxVu09/7zezuLynNQOnJEhG8EqJfRWVWwaZ0Og+tMr7ovaH/oHymSa
	oi5RWHlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKBxc-0000000FdlN-25GP;
	Tue, 05 May 2026 09:21:00 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKBxZ-0000000FdkT-1JDQ
	for linux-i3c@lists.infradead.org;
	Tue, 05 May 2026 09:20:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777972857; x=1809508857;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=bP57J60XysJB+R6DywtFYZk/WrtyzHbzdZMz0+tujvU=;
  b=esBKhXxClMIM4l78EYkiv0qVVgm7uq2lpsWFDFnX57DrG2wqGzrQCjE0
   gYwAvL/+7vjcwQiKAsrDK2dZCIaAjMncStJ4gg6IeZjd1ywiYf274nWcm
   JW38DAqlo3WQ3tt609m89qHLI78TerUGMrk7yFHKpPUvqEI5Hy+ObTulc
   j/TM8m5JcIK/HSTQIRn79YBwea8iDkbWk3ePK6urcEeIeMlcKu6srwnBF
   PMS142p9e/AASNbi5YZ5VwrLMQr26MYT8IkOp8/ZqEYLLD4nUpVCsMV2t
   SC6Qbir36ma7s0wUVkqi5rVgToiZzi8XxGp2o3Zz0fPrLAIIG+E3MpnsI
   Q==;
X-CSE-ConnectionGUID: KdEfC4ZBSKy7UJRy7sziCg==
X-CSE-MsgGUID: R/mX+HKNTNeanHSiElT3WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="79027717"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="79027717"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 02:20:55 -0700
X-CSE-ConnectionGUID: rAPaVjixSkenDhL0YqRTKw==
X-CSE-MsgGUID: gejPNKbWQeOCKB8EMoi3Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="239758887"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 02:20:56 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 02:20:55 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 5 May 2026 02:20:55 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.5) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 02:20:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eClOp9n3p8cKjRTJ9oS/+ixHU23UtBnHo9OgJ9Oig4O7PIYu0/TULjbnZZ3boBlkO4qvJiGNZSWli0Df5xcj1DN+i/Fvta+deG9MkZKWNEqeaK7dpd4Dpqc45U8HhmfE9NM5bsqrjfuSPN5GBEC8SPZUI0BTPxOyOXf2d4g55kG2GVdufWUT6yUrYg0+LOGk4cgbU+ZP9ohGLmmRbo2AkUwyhUl6ZnnpCctzZHZqrJZDe2HaUi0y7VzkH6nVQ/lDx2ez+IAbKRdUJH/19S2DgClJz1jpLRpQgSHJGgq3L62XD1RN9GpGRB649HuV6bk6mxVI2PO/gvG7M7C0hf63EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=86HySoyOvi22dopBe1m+z6goizwRo0WLX+h1k+ChcN4=;
 b=btPznFZnRsG8rXWl2fIyTdVg3J0E6CiY0TVF3Z7KWR2IpXFeEor4lCfMkXVCrfdXiuyDAGaQkFelIcBY9sV4Bz8MFYCCsx2x3gtF6gI9DXENb2fjkSmR7KsJgu3tYIxvnp6yetU6f4U3xtf5qdNnilpgKX94xOCrlEed8WFii2LVX1vmp3cOErQHjmL8rSszwqGLPGt1SRuqlBA0p8DMV3dFJ0NHhDdyQBp+53qcpKV1wYpJFr/6LjoFn2F/9iikuZ+QIj5WTsahFOizxuvlm7pwWR9nrQgf9vT7HVlWdSXUQaceB9/yCLo7zfYmK7cGOSt+OIB2eSdyELt7VY3iEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by MW4PR11MB7053.namprd11.prod.outlook.com (2603:10b6:303:221::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 09:20:51 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 09:20:51 +0000
Message-ID: <79e04591-4263-4f95-ac5e-59e45170d79d@intel.com>
Date: Tue, 5 May 2026 12:20:46 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i3c: Consistently define pci_device_ids using named
 initializers
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
	<u.kleine-koenig@baylibre.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>
CC: Markus Schneider-Pargmann <msp@baylibre.com>, Frank Li <Frank.Li@nxp.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	<linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260504143324.2122737-2-u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20260504143324.2122737-2-u.kleine-koenig@baylibre.com>
X-ClientProxiedBy: DU6P191CA0043.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53f::29) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|MW4PR11MB7053:EE_
X-MS-Office365-Filtering-Correlation-Id: b3ec1401-0ace-4b2c-3681-08deaa8799d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: s0bNAsjtSImZcSbUUoggaa4xX+Qi596cIhQFvkeEH94nIhKTUE8DJY54lU5rbrLeQzBkQhk14r6DNxI81xgXll72aWbnUG69Kc+1JaC0ki5II8h3X1KPfIIn60GNAGQh8gmpRHvoMdZbqiYe1nxmGykJSC7wQOx9B/rlK43Vywliv8CsrQatN3y1ttyInJXPUmZzjVcN7qIAGMWFETuiPjVztO0lP2DYmd17PxaD2llVgHOD6202rLcgEy5/4yRaWf3XO6XIN0al5I2AZszsD0nMJASl9oi3dIdZrn4Qmnj8pMN5sAHetr7iQYb/GNeH9biLzqqQwDs9VD2x3rONVnG8J264sjn5/kQ2US2Mwewg+054j0JGbrEPTWHi07QWx7D9SZI1IdL8Y4yqP2a5Dfk7RzN9UW0boN8qC6a6VHcverSC0KKojj1I2DhhL6mnG41lS3VfTvYY3zti6URcVMyNEXcHOCWidBGh0qhQAlZ7w2H25dhtDW9xx+KPkKHLm2hGzxqzheV+0OvBC3JPkzqCWO1/ExnEUJcn+HdLeHOMVDQ5Iu6sWJGF+GtSDkws04C4B+cxu1bH5hfZob8lLiceXFxKePWNdVTo3sjR0qPlVrTAYcKzBx1m1X55KBSTv2yW7TZWh54CL6iYljVpNH9vFZXAAh3UxKZwcxlk0lO7s5cxOASjW49MBoZc3A0Gj9reqPsL6BAlBNheUsGV0Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekE4U0t0QjB0N0RRVElDZWpBSGpCWlFMOXJNMXVERWthdkw0OUE2OG9GQitp?=
 =?utf-8?B?WGJpTXV4UzQzNXdESTIxK1d0Qit6Z1NyM3dvMU5tZVBUTTdBYTRQeUJmSElT?=
 =?utf-8?B?TGVIdEJ5LzVCNFl1VjlMN0JibXBIdkV6Z1JObEt1OXFjdFFPbzA1N0tpTkls?=
 =?utf-8?B?YWt5aFdDalJlaEFWQzZwRkVvQU5SNWVuM0dVY3R5T0FjZVFacGcvWXd0UUps?=
 =?utf-8?B?VGtUdkhaU3JVbVloNTd2K1pZSU1DcFg2a0tFY3p5QUszRTlGOFRzUCtWSGVn?=
 =?utf-8?B?R1psR0hkU21DY0Q0aU1PYUUwWlRoeVY3Y0JMMzU2eW9MT2MwNXRseFhOMTRU?=
 =?utf-8?B?dG5tQnR3NUV6WndkNmthamU2U1pReGV3KzBTTjhSWjJscnRxQ2RVekVhaEE3?=
 =?utf-8?B?YWErbytyU2diTmhzeHJEemlhbjFNSEQ1SW5EcS96b3EzRENmVTZSbkUzeXNX?=
 =?utf-8?B?cFN2WmdtUm9LVyt5a2JrS3NGanVTbmdwbmlWWFVRY1RQZGJpTTVDRi9oSzRG?=
 =?utf-8?B?ZXMyYzhLa3A2YjBPRFViMUxBUjNWREtaYTlJTUpXTWgxbEhheFpDbEtscU1I?=
 =?utf-8?B?RXIreGlFaTRBTC9xY2d2ejc1Sm9aSHlucExxd2pBNW0xa2FtY3BucHIvM1F1?=
 =?utf-8?B?OHh0bGlld2puYzdCM3ViYXNEdmorVzRlNTA0RkR6ZkxNL1QxU21aZXlRYTZ2?=
 =?utf-8?B?VEZub0FSWmdMK0NUQ3VmL1MrM2ZaQi93dE8xakZWT0d3NUxidW1CSGx2Qkxw?=
 =?utf-8?B?L0NzQnlqMmppNnNUQXY0VkZVNU9jbGQ5T2YzblVRQTRSTEVpQm5qclJYY3hv?=
 =?utf-8?B?Q0hxWmkrYTdrMVBmcjBac1gwSTNzL1dBN2hTSGFkUzlSZjhFa0pvOEhDc0VC?=
 =?utf-8?B?cEl5cmpYWlpmRlhiVnZhSzRadS9yckhudkpGdkFISk43RmhHL2FCL0lRd1lM?=
 =?utf-8?B?NXIyd1RTTDNkQ01Yd2xwUlQwUlNmam0wRSt5aVRpKzJvVW5jOVhoWEVleWVS?=
 =?utf-8?B?N28zM20vOTJRR016c0tDRW1uamlNYzdubGNxM3ViY2J2SXJxS3dQVGE1dCt3?=
 =?utf-8?B?ZGlCc29TV2VFSllENEFBUmJZMnBDWkZlZzc0T2lmWWxOQVBHNVlHUjdMZmI3?=
 =?utf-8?B?UWN3VDFQNW16NFIzNWY4SkpCTHQ4bDJqTzBQNFBlaEJSYXQvZldLSUF3bHNT?=
 =?utf-8?B?RzZTdXpUMVd0aXVQZThtNzBIcjRSSXFTWHlWYm1qaW90aFlnTS9rSkpieFkz?=
 =?utf-8?B?dU1nSHFuOVhFMXBDWWJKbCtWS011ZWIrcTZmQ3dQVjZCRThQVmdqNC9Od3hz?=
 =?utf-8?B?L1dHQjdJWnFuelNMSXFLclU3Y2JTY3VYRkNmajFkWlNydHJqeGk1UnBJSjlI?=
 =?utf-8?B?cnJpRERuc08xdmJGcUdLaVY2TVhPK0RhUDdYeUxOOHVaSkRKVURxNHRQT2h5?=
 =?utf-8?B?RmRJN1BrTkwvbUYvdmNDQU9LU1FBRmJ6bHJ4ck56TVFsNVlNMjRhZjhqUFRB?=
 =?utf-8?B?N1M5bEZKbGNGSHJPOXFvN20ycWwrbWsxalRhRFVzOS9TcWZudEZjb2ZzM3JX?=
 =?utf-8?B?Skw5WEhOcmtkMDQ4TCs4UEw4Zkc3aDBrQzYzcDJwMHYvWTcyaVlkUk1KS0Ji?=
 =?utf-8?B?WDduV2xKMEVsaDlOVStNV1p0bUZwenA1UEkvQkN1TW16Z2dxaEYwcEI3RW9N?=
 =?utf-8?B?RXQzY2pJcDJnK1AwUzd1L0RBMm1sQWtla0Q5c0FGRkNYNTgrNVZuZm80R0VJ?=
 =?utf-8?B?RUhteXJSR1g2L2hYSkZCb2FmUXZPdU93UTV3ZU1YVzhVUkNsVlpTUUsyd0ll?=
 =?utf-8?B?S0MyZkZwYkdTL1I1ZVhmSXRwc0Q4dnNkVkpKeUFTZ1ZmWnUwVk9HaUtFYkhO?=
 =?utf-8?B?OW1PT1JkWWJlQ2tMckJIMVlNeXpvZ1FLRk81dmNVeVRFd295VTBDUXpWM0lz?=
 =?utf-8?B?S2J2bVN3amtwVzEwTjB2Q09NTzJUQTdBcWNlTUMzZW11cHNFdE5uTzRYOTNp?=
 =?utf-8?B?QkZCTU1XN29uTG5IOUZhUCt0YmJpSUFUMlNJZTVLUVJVRnp2ZmdSRS9WcFcx?=
 =?utf-8?B?R29MMUF6aW1HTzljKzhDdmpib1ZHUlBhdllZblRCcVpDcDRjWW9USU5qSjhv?=
 =?utf-8?B?am5yYUk1RUU4bFhUOXI5OVJsT2F1aGQ2eVhhbG9NeDZhMkMwbzk4NVpDeXJK?=
 =?utf-8?B?enlwWHFkaFNBWnFIV0pnQ1QxcDlKd3c3RjR1cjYrT0kyd3dnUmt6R29MVm83?=
 =?utf-8?B?eCtsbWI5bEtsTzAvai9qcFNoNXFiR1M5TmNmRDk4RSt4aU9mOUNxVmJ4dWtY?=
 =?utf-8?B?akF1dHI3VVZWd09zSWxuTWVha25vUytObnYrSjNzOVVjcVpaVjYreFhjSFVS?=
 =?utf-8?Q?hmTdy73ejWEyMyVM=3D?=
X-Exchange-RoutingPolicyChecked: sCGBOS7Z4b+oIzBYKX2drjC1Ghp6Fg9llGC0uvSOAVfDJw7hrLJu09g+4W24xpvTFALbyDkqR6FQBXIcmy/QWWw4+gDQY4keQf5kL30pLmEpdPhU2/GsG22b9A8cMja6a0iXANbE/Plg12kzWhD/s12NPL+DmqTrpzx3XxDaanGmho9MCGzlyx2JZTEKNDhD3ewqHpcjc9bN2V/2IQbQ/yrDZnQjiCMrUMxgboiHtIn5xr0M1DyckjUNlw8QOVhi1uC2GgEZgEfzNJuNTl4iOyEugAaY0HhQYEKGVEFoVJaCcjCZ0cZ8RuzCsbRlwrizEPoKxJvH8k3BCRuOzHnvJQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b3ec1401-0ace-4b2c-3681-08deaa8799d1
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 09:20:51.6329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2/amE2d4F2tCujdGTclS63I4b2PipLZZOAzs617MKBHvJd1+776Css1ftOneJZ7JRyrqCYoYz4aYweNuiBhz6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7053
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_022057_444819_4AFCB36E 
X-CRM114-Status: GOOD (  19.25  )
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

T24gMDQvMDUvMjAyNiAxNzozMywgVXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yikg
d3JvdGU6Cj4gVGhlIC5kcml2ZXJfZGF0YSBtZW1iZXIgb2YgdGhlIHZhcmlvdXMgc3RydWN0IHBj
aV9kZXZpY2VfaWQgYXJyYXlzIHdlcmUKPiBpbml0aWFsaXplZCBieSBsaXN0IGV4cHJlc3Npb25z
LiBUaGlzIGlzbid0IGVhc2lseSByZWFkYWJsZSBpZiB5b3UncmUKPiBub3QgaW50byBQQ0kuIFVz
aW5nIG5hbWVkIGluaXRpYWxpemVycyBpcyBtb3JlIGV4cGxpY2l0IGFuZCB0aHVzIGVhc2llcgo+
IHRvIHBhcnNlLgo+IAo+IFRoaXMgY2hhbmdlIGRvZXNuJ3QgaW50cm9kdWNlIGNoYW5nZXMgdG8g
dGhlIGNvbXBpbGVkIHBjaV9kZXZpY2VfaWQKPiBhcnJheXMuIFRlc3RlZCBvbiB4ODYgYW5kIGFy
bTY0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIChUaGUgQ2FwYWJsZSBI
dWIpIDx1LmtsZWluZS1rb2VuaWdAYmF5bGlicmUuY29tPgoKUmV2aWV3ZWQtYnk6IEFkcmlhbiBI
dW50ZXIgPGFkcmlhbi5odW50ZXJAaW50ZWwuY29tPgoKPiAtLS0KPiBIZWxsbywKPiAKPiBUaGUg
c2VjcmV0IHBsYW4gaXMgdG8gbWFrZSBzdHJ1Y3QgcGNpX2RldmljZV9pZDo6ZHJpdmVyX2RhdGEg
YW4KPiBhbm9ueW1vdXMgdW5pb24gKHNpbWlsYXIgdG8KPiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9hbGwvY292ZXIuMTc3NjU3OTMwNC5naXQudS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNvbS8p
Cj4gYW5kIHRoYXQgcmVxdWlyZXMgbmFtZWQgaW5pdGlhbGl6ZXJzLiBCdXQgSU1ITyBpdCdzIGFs
c28gYSBuaWNlIGNsZWFudXAKPiBvbiBpdHMgb3duLgo+IAo+IFRoZSBhbm9ueW1vdXMgdW5pb24g
d2lsbCBhbGxvdyBjaGFuZ2VzIGxpa2UgdGhlIGZvbGxvd2luZzoKPiAKPiAtCXsgUENJX1ZERVZJ
Q0UoSU5URUwsIDB4NGQ3YyksIC5kcml2ZXJfZGF0YSA9IChrZXJuZWxfdWxvbmdfdCkmaW50ZWxf
bWlfMV9pbmZvIH0sCj4gKwl7IFBDSV9WREVWSUNFKElOVEVMLCAweDRkN2MpLCAuZHJpdmVyX2Rh
dGFfcHRyID0gJmludGVsX21pXzFfaW5mbyB9LAo+IAo+ICh0b2dldGhlciB3aXRoIHRoZSByZXNw
ZWN0aXZlIGNoYW5nZSBpbiB0aGUgY29kZSB3aGVuIHRoZSB2YWx1ZSBpcwo+IHVzZWQpLiBUaGlz
IGdldHMgcmlkIG9mIGEgYnVuY2ggb2YgY2FzdHMgYW5kIHRodXMgc2xpZ2h0bHkgaW1wcm92ZXMg
dHlwZQo+IHNhZmV0eS4KPiAKPiBCZXN0IHJlZ2FyZHMKPiBVd2UKPiAKPiAgLi4uL21hc3Rlci9t
aXBpLWkzYy1oY2kvbWlwaS1pM2MtaGNpLXBjaS5jICAgIHwgMjIgKysrKysrKysrLS0tLS0tLS0t
LQo+ICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci9taXBpLWkzYy1oY2kvbWlwaS1pM2Mt
aGNpLXBjaS5jIGIvZHJpdmVycy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9taXBpLWkzYy1oY2kt
cGNpLmMKPiBpbmRleCA5NDY4Nzg2ZmI4NTMuLjVhOWUyYTQzZWZmOCAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNpL21pcGktaTNjLWhjaS1wY2kuYwo+ICsrKyBi
L2RyaXZlcnMvaTNjL21hc3Rlci9taXBpLWkzYy1oY2kvbWlwaS1pM2MtaGNpLXBjaS5jCj4gQEAg
LTQ2MSwyMSArNDYxLDIxIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZGV2X3BtX29wcyBtaXBpX2kz
Y19oY2lfcGNpX3BtX29wcyA9IHsKPiAgCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGNpX2Rldmlj
ZV9pZCBtaXBpX2kzY19oY2lfcGNpX2RldmljZXNbXSA9IHsKPiAgCS8qIFdpbGRjYXQgTGFrZS1V
ICovCj4gLQl7IFBDSV9WREVWSUNFKElOVEVMLCAweDRkN2MpLCAoa2VybmVsX3Vsb25nX3QpJmlu
dGVsX21pXzFfaW5mb30sCj4gLQl7IFBDSV9WREVWSUNFKElOVEVMLCAweDRkNmYpLCAoa2VybmVs
X3Vsb25nX3QpJmludGVsX3NpXzJfaW5mb30sCj4gKwl7IFBDSV9WREVWSUNFKElOVEVMLCAweDRk
N2MpLCAuZHJpdmVyX2RhdGEgPSAoa2VybmVsX3Vsb25nX3QpJmludGVsX21pXzFfaW5mbyB9LAo+
ICsJeyBQQ0lfVkRFVklDRShJTlRFTCwgMHg0ZDZmKSwgLmRyaXZlcl9kYXRhID0gKGtlcm5lbF91
bG9uZ190KSZpbnRlbF9zaV8yX2luZm8gfSwKPiAgCS8qIFBhbnRoZXIgTGFrZS1IICovCj4gLQl7
IFBDSV9WREVWSUNFKElOVEVMLCAweGUzN2MpLCAoa2VybmVsX3Vsb25nX3QpJmludGVsX21pXzFf
aW5mb30sCj4gLQl7IFBDSV9WREVWSUNFKElOVEVMLCAweGUzNmYpLCAoa2VybmVsX3Vsb25nX3Qp
JmludGVsX3NpXzJfaW5mb30sCj4gKwl7IFBDSV9WREVWSUNFKElOVEVMLCAweGUzN2MpLCAuZHJp
dmVyX2RhdGEgPSAoa2VybmVsX3Vsb25nX3QpJmludGVsX21pXzFfaW5mbyB9LAo+ICsJeyBQQ0lf
VkRFVklDRShJTlRFTCwgMHhlMzZmKSwgLmRyaXZlcl9kYXRhID0gKGtlcm5lbF91bG9uZ190KSZp
bnRlbF9zaV8yX2luZm8gfSwKPiAgCS8qIFBhbnRoZXIgTGFrZS1QICovCj4gLQl7IFBDSV9WREVW
SUNFKElOVEVMLCAweGU0N2MpLCAoa2VybmVsX3Vsb25nX3QpJmludGVsX21pXzFfaW5mb30sCj4g
LQl7IFBDSV9WREVWSUNFKElOVEVMLCAweGU0NmYpLCAoa2VybmVsX3Vsb25nX3QpJmludGVsX3Np
XzJfaW5mb30sCj4gKwl7IFBDSV9WREVWSUNFKElOVEVMLCAweGU0N2MpLCAuZHJpdmVyX2RhdGEg
PSAoa2VybmVsX3Vsb25nX3QpJmludGVsX21pXzFfaW5mbyB9LAo+ICsJeyBQQ0lfVkRFVklDRShJ
TlRFTCwgMHhlNDZmKSwgLmRyaXZlcl9kYXRhID0gKGtlcm5lbF91bG9uZ190KSZpbnRlbF9zaV8y
X2luZm8gfSwKPiAgCS8qIE5vdmEgTGFrZS1TICovCj4gLQl7IFBDSV9WREVWSUNFKElOVEVMLCAw
eDZlMmMpLCAoa2VybmVsX3Vsb25nX3QpJmludGVsX21pXzFfaW5mb30sCj4gLQl7IFBDSV9WREVW
SUNFKElOVEVMLCAweDZlMmQpLCAoa2VybmVsX3Vsb25nX3QpJmludGVsX21pXzJfaW5mb30sCj4g
Kwl7IFBDSV9WREVWSUNFKElOVEVMLCAweDZlMmMpLCAuZHJpdmVyX2RhdGEgPSAoa2VybmVsX3Vs
b25nX3QpJmludGVsX21pXzFfaW5mbyB9LAo+ICsJeyBQQ0lfVkRFVklDRShJTlRFTCwgMHg2ZTJk
KSwgLmRyaXZlcl9kYXRhID0gKGtlcm5lbF91bG9uZ190KSZpbnRlbF9taV8yX2luZm8gfSwKPiAg
CS8qIE5vdmEgTGFrZS1IICovCj4gLQl7IFBDSV9WREVWSUNFKElOVEVMLCAweGQzN2MpLCAoa2Vy
bmVsX3Vsb25nX3QpJmludGVsX21pXzFfaW5mb30sCj4gLQl7IFBDSV9WREVWSUNFKElOVEVMLCAw
eGQzNmYpLCAoa2VybmVsX3Vsb25nX3QpJmludGVsX21pXzJfaW5mb30sCj4gLQl7IH0sCj4gKwl7
IFBDSV9WREVWSUNFKElOVEVMLCAweGQzN2MpLCAuZHJpdmVyX2RhdGEgPSAoa2VybmVsX3Vsb25n
X3QpJmludGVsX21pXzFfaW5mbyB9LAo+ICsJeyBQQ0lfVkRFVklDRShJTlRFTCwgMHhkMzZmKSwg
LmRyaXZlcl9kYXRhID0gKGtlcm5lbF91bG9uZ190KSZpbnRlbF9taV8yX2luZm8gfSwKPiArCXsg
fQo+ICB9Owo+ICBNT0RVTEVfREVWSUNFX1RBQkxFKHBjaSwgbWlwaV9pM2NfaGNpX3BjaV9kZXZp
Y2VzKTsKPiAgCj4gCj4gYmFzZS1jb21taXQ6IDI1NGY0OTYzNGVlMTZhNzMxMTc0ZDJhZTM0YmM1
MGJkNWY0NWU3MzEKCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWkzYwo=
