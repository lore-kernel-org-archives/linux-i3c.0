Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CEF6D5B84D
	for <linux-i3c@archiver.kernel.org>; Mon, 15 Dec 2025 17:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ytFmcw3U8iY0Eeb/3Htk3ayYFA6AfJLyHVWpuesNE+Y=; b=UqWxUYcFaJ8IF9NkHUmZv3x/+x
	UDFG4/ojWRslljWvFdfCPTEwcbEw83S20Bikw8af1l84TqPtPcJJ58W7HrZtND4G37EzD90LS/x8M
	wuZXyzJSS2rGBrwND2SfTSKKCPfI0BSyVsTcrwR/50U3QMvOvQNsSXpXRr3M/rUtPPQ3jlOf+dcvu
	hPKH/ZjTKFh4fvRKJAPYyZn7wRs1vQxafP4R7KqbJ8rQO+72qPjgSfJlbw2ZJdScmzsahLeBx0X3Q
	rX8Ws2tjrxPc0IlZhRcybYTvob4Ae7oxJZ8YDVvp4eJccshJO8dKMnqi8b65Gg5mHA1w7x+5MLgPP
	WP5OTkxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVCLk-000000044HQ-43Eu;
	Mon, 15 Dec 2025 17:27:08 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVCLh-000000044Gb-0zQX
	for linux-i3c@lists.infradead.org;
	Mon, 15 Dec 2025 17:27:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765819625; x=1797355625;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ALElTQRsQ+yx5615gnpgpHTCfgqO9WusYHDQvu1qGP4=;
  b=cWJlB3OVY/PpDWaTyYNISCKaXbtVM93DiQahCGFAQUFAXTW2CpWFUAfx
   UNMC3xDI4kLlkMtgDoWvE25yZpETuC/t3hHl4zNVJwK4YU60e/TzTE2aq
   SI25zq/xB0i6px4Nyqh3rVNeAzNghQcoZ1h5fjshTk/CU0xe4MCC4sSpN
   QdQJ55frlBgpKdNhEYzUcYiugWSBkbejOtNV1UmhPQgsKG5b31Y7NMZSJ
   yMfVJl/AerU3C6HiPFTQ4urRIjfJiRADiyEPGawb72Pkd6ruiJyCufisv
   Ex1r4LmPvsfUamvFI03IRBbo7QlukZj1NEGgDqeb4iK5n8K1/6MIqfh8T
   A==;
X-CSE-ConnectionGUID: FIjww/slRnq8q1kPZqhdpA==
X-CSE-MsgGUID: W/XITC3DREyUp4Ol3PRj6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67604555"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="67604555"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 09:27:02 -0800
X-CSE-ConnectionGUID: GkFTKu2kRda80QjIcSVyAQ==
X-CSE-MsgGUID: 9nm3n5Z0QaKMEMFTePAtjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="197403758"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 09:27:02 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 09:27:01 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 15 Dec 2025 09:27:01 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.46) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 09:27:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VBGQlYpYGxjVn8snbbUahDh5Z8Yv8SMree8dy5WpZepPzWolIYL/RvTDsVW094ay0PfM0XVsYrpZVitVABRzYpSgSdJeHgkRuTuB3tGyvX1dpp2X7RJnyBdNairX/VYp4KyWLmAQ38m/GT0mT6gOiIJaMnm3t21wu6PokGhdUIiZpYIuifqyn+3v58PdUMujfBY/XZdCGD+/Uwrpvo8IwFr4dh2JGTEpbkw1ttVhJFRjDaxHR/+khTqzKNNZFHaLDo4/jWa6t0re/nZAtcHEflCR8v3UYp5kR3cTNOa8nxDyll+dLSWof7dGkNC9cpsOPWi10gZkoEwPk2XGYdfBaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KZG5QJr5enPv34tJAPmzyDOBy8N5uPzo8JvjggWrg0c=;
 b=rwj8a4Ldnx1xxUsj7hO/DwjWpLYLYH/oPlshPG5EGbLTa405y+fyg5TwW2v1NewCviEKWb0jdJyP53Ql4T6V0UYIg3qXUwXtbRq8p6j2iR/SxUk4Rdo2duZJ2LnvDyg7k6DP7C/k2z3I7kfjsN3HBGoggwKf7tlRCx4AJPSm7r1XxT+tpcJ2KqSAR8nFIBWD9DSaJ25KkYQR6PyF6sm2wmj5cKYH6mYyv2mRykHDLiWS7U2LQPAyA4x0qHwqaiAK0xAK8FbJWRjk+RcU2voKwUbk1Mx735LvIXAf1FqKmF4O3nxXMTtFNAwX5oucXJi1G/P/m+X22PiOYDj9067/yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by SA2PR11MB4777.namprd11.prod.outlook.com (2603:10b6:806:115::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 17:26:59 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 17:26:59 +0000
Message-ID: <96366268-572e-4a11-bc94-058d37db2418@intel.com>
Date: Mon, 15 Dec 2025 19:26:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 06/10] i3c: mipi-i3c-hci-pci: Enable MSI support
To: Frank Li <Frank.li@nxp.com>
CC: <alexandre.belloni@bootlin.com>, <linux-i3c@lists.infradead.org>
References: <20251211134809.75872-1-adrian.hunter@intel.com>
 <20251211134809.75872-7-adrian.hunter@intel.com>
 <aTrl9BMsbwMBCN+L@lizhi-Precision-Tower-5810>
 <3d540915-508d-4548-b63a-cbdd9812d454@intel.com>
 <aTxTBmeSBPv25b2I@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <aTxTBmeSBPv25b2I@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: DU2P250CA0010.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:231::15) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|SA2PR11MB4777:EE_
X-MS-Office365-Filtering-Correlation-Id: 08852b8c-28dd-4965-8d2f-08de3bff26f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NndXNWxxRndvRFNFM3FkdVFHQWVJNkp0c1kySDdlelFpejFBUFlzamNYNE9o?=
 =?utf-8?B?Vkc1VXpIUllEOVV6VzMwSmh1bW0zenVZNVZUWEhRQ01sWmVMY0VZMUFDMmhO?=
 =?utf-8?B?dTZxM09WR1FRWTR6UFgyQ1VuUnI2UVdYRnQrMngrOFIxbEFQSklOSnhYZ0Uz?=
 =?utf-8?B?T0Y2UE1XQVJBUlIyLy9VZUkvUVZycmhSZDFNNVFJL3MvRkEwUDQ5S0RCdEdw?=
 =?utf-8?B?dmZ4UGlpRG92NE1GN05wZStGbWdBUGhUbXlmcE1zNWlSOTk1YnBTQmpUNUZV?=
 =?utf-8?B?ak9jMFlQS2w0WWx6b3AwcVN2MlNTNHlzVE1EbU1MM2Urd3ZhWk92WUFqVjQx?=
 =?utf-8?B?K3pEbkZuSW1URVQvallaVkxIYythT0VVbVJWNC9WVWFOWkVFR2RaOS9ZQS8r?=
 =?utf-8?B?enZld1VLOXZ4Z0dsdWc3NGM2VXFOWnJ2WXM2TGIvUnVFd1lrc2NhSGZWRmEz?=
 =?utf-8?B?ZW9rWWJJQUhvTzJIbzFWdHo4dkRrWFJGU0IycllWejdha0Nvb3dIc3BaVjZQ?=
 =?utf-8?B?YzZzb3BidFJKbGtTd3JHQ0NYckZST0dzSDlCZzN3SUlqRU5hNmtRREJJUExU?=
 =?utf-8?B?bXEvVHdROWlSRy9JQkQwRkhSVzFtRnBOQUhNU21OSmhHTFFzVUVRT2VIU2xo?=
 =?utf-8?B?WnBJNU1RTTJXSXFQVFJ0QjIrK0V1Tk93eU5OQlpyZS9yY1lMVDVlZytHcGdV?=
 =?utf-8?B?K1BXbGJXSmxpNTNRTTZpemhCdkdVSUFsVU5NcU9lOVdWa3lSVW0vSGNRZ3da?=
 =?utf-8?B?Nm5ONTBiTUVQclprRmg0dG4rSzM4TC9tWTZWTHlKbnJjeTQrdDhmNmNyQUZw?=
 =?utf-8?B?QU8yQ3A1a0ZWMHhwcFFZK3gyK1ZhbzVvajBvVzlrTGoyZGhHNWpBdkx4QlNm?=
 =?utf-8?B?blZVQlBUT0pHMjdVdG1ZdUFDZEtDS01iVytxRXhqTlNKNHZzdmg2ZktFS2pt?=
 =?utf-8?B?NE5STFAyMHpZWVl0Tkgvd1R2QUJGaG5qOGZPOFJTOUpHWDZhanNKSzVqYUlx?=
 =?utf-8?B?OHU5Q2JFWFVDUjRhTkhuc0IvTVNUejZncGV0VDJlZzVUdUlnTmdBNGNrdVpy?=
 =?utf-8?B?dmY1WFdaRCt2OUV0RFJ5S0F0cnVHWFVKRE54c1YvNVNDM29OVGcvS0FkWnQv?=
 =?utf-8?B?djJiWXpNUGE3SDREL3pnUkMwM2xIcFdWQTZDNHJuQ2VLUFF2L0dtaGhjSjRr?=
 =?utf-8?B?U0ZrVEZLS3JTL3cwZ1hGNndyTUMwSU9IZFAyRC9BZXIrNXB0UXdoczQ5S0dS?=
 =?utf-8?B?c21xeXVXV2NUOXAvWUhSNWhyWmtGY0c1Y0g4ZUFnNnlJVHB1SUJ6OUhldkxq?=
 =?utf-8?B?ekRGQWdQWWY1Umt6WGk3amFZZHV2QzNRcGJHL1BzY1hNMDJYdlE3VitCaHNY?=
 =?utf-8?B?aHFHTnRjenkzMW5uanZtbW9uMmRrc2o4Q1BWMUlkOEJld0hwV1o5c21rU2Yr?=
 =?utf-8?B?SDM0WDRPcXk0L1FaYXNaTXM4QnM5Q3NIUkZHU0lsV3dzaDRiWFUyYlQ4WG9S?=
 =?utf-8?B?Wkphbkk3bmVkRUxlV2hDazE5SWVLYkFZTHIyUTZOTVkybDB5SVRJeW9oaDNY?=
 =?utf-8?B?TUpKa1gxQkE0Q2s2ay9VamYrNDJ3akRaeVFrU2FiT2JaeWF3eVlLYm9KcFU1?=
 =?utf-8?B?cDJ3ZGtlRXhGOFJacS9RbytrdGV1Ym1mQ2hoblZ2K005bld3QXBpVGc3akEr?=
 =?utf-8?B?WTFaNXd0WmJvaWVZYXc3b0hWL3Zrdy96ajJTdzZHZWMyWnRZRnpuTnRmODB2?=
 =?utf-8?B?Vzc1TDlkS1hYaTJUSVNjYzRpbHZGaDhIT1RWZ1hmM2JCa3NqUk5WZXRtTG1V?=
 =?utf-8?B?ZWt4THFhMnZCZno3YkJ2YW5oZEZRbE1saVhwalMxR003ZE1oNmNGaFU2Rnk2?=
 =?utf-8?B?MGhSck9iOUhjdXJwWitWVnRVQ1o2b0loVG90MCtNTTQ1OUs0a0hRN2VBUmJT?=
 =?utf-8?Q?fDmUMb4dnUGWsrnVI2B3NXtGbP9lWkc3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDMwT2ZhZlFVYXhWd3c5enlwQk5XMEFzaWQxTmM0RFF3dzY1R1BwTEFpanU0?=
 =?utf-8?B?NE03cGlWWWZ5S09WV2FXbUNVV0JsRzdzVUtweUkxbytJcXdQeWprYnZNT0l2?=
 =?utf-8?B?T29Rb21Pc2NlcWhmaHYybU9QbWdJdi9yRXNLRkpTeWZLTDFFMHBaSnJIV2Na?=
 =?utf-8?B?MGVQY21XM3JUaDVwNVVybC9HTU1tNlkwZFBPZERNc2IyVyt1QjFDMy9GMGMr?=
 =?utf-8?B?VDQ0VmV5OEdyMTB0ZjBNSnV2TUpwYnpJdWwrMm5tS3E5VnlWSWFlN3hqMEZq?=
 =?utf-8?B?OHQrTTlGbEVNWmM4d3A3TG5YVzBmZmVaODZ1cWR2T25yVU9XaHpQWG51aHJ0?=
 =?utf-8?B?c0dybGliSGt6Tk84RndobDVVOWJyWnRBeWttUUpwY0JkN1NiSzlUem52bnNG?=
 =?utf-8?B?MnVLQXlaNW1TVDRMS1NnQkdGN20zOGZLYTZuVTJsNkl2bG42OXJBSzNOaWQ5?=
 =?utf-8?B?SXg1N3dxdENoaFJXemg0TnlDZHd3Rks2bTBHUTlkSlNRWFVYRGZDZ2JkT2RY?=
 =?utf-8?B?aG1HV1FuWW5nWURYOC9YZU51MWFxQ0x0RnNyaWswZktZTjMrdTVuQ3piZXYw?=
 =?utf-8?B?aW5PZ2owakYvcGZMcFpUS01aMGl2L1FzUG85NU1HNWZFbkw2VXVMV25IcG1k?=
 =?utf-8?B?WDhLalVobE92VVVwTVRoL3hNZmlXenA5Skl6NXc2cmNxL28yMENKQkpwNVpG?=
 =?utf-8?B?MkE5dmJNbGxmMzg0MUJuRXNQRUtUSHBHQzdIdWs1V1lpaWhDMXJpWGJjeVF4?=
 =?utf-8?B?ZTIyekJ1dy96Zy92MEZPOVBKb0FlWnZDNVBOMUVjVDJCaUFBSXd6dldlYkkw?=
 =?utf-8?B?cVR5YjdrK2NmRkZOcGxmVWd4SzEzRis3bUhDOTRSaEREUnM2UnpFeHBLc3ll?=
 =?utf-8?B?YnFlY1pWQnJnL29HeHRwdmRXak5OQ2ZtaURDbFdJUlhqUFVUMGlsOThRemJ2?=
 =?utf-8?B?dEZhVTJqTlZmUDJsVjdSTks1MyszaTVORTB3RmZwUlhweGxpc09QdXNKOExT?=
 =?utf-8?B?dE43dVQxRjRoTGVGNEdXQUFLeWJEYWpqY1QwS01odDRENHJBY3FLVDg2TTVY?=
 =?utf-8?B?aFEyYkkzVHZnWEkwUEZUVnM4eDVlay9jbE9nK0RpaHZtN3FPVi8yZ1dzWEhD?=
 =?utf-8?B?dzBQWXdMS1hLYkNWT014VkZPcXhXU0h0ck5Kb2t2ajF1TUNLTldOWjVUWm5r?=
 =?utf-8?B?L2phRzN2UFV1dE04R20xVCtneXlEQ0lTZTk0U1BPQzh6NjlFOUtSN3kxZmpt?=
 =?utf-8?B?bThWR2dySmdQTlA0eEc5L21kVEcxU3RXTDIwazNaVW0ybEdvTVNidHUyVm5i?=
 =?utf-8?B?bEdDSlBuRm9TK1BBSWRRS2hORlBTTC9CN1JXQk5MYUUrYm5ucTV0VkNiMlR6?=
 =?utf-8?B?RGZNc2taNnBJc3M1MTFYTXNOUHJkcDR2TnV6d0RML3Q4YkVQZm5HUkJpWHox?=
 =?utf-8?B?TmNHWk5FWG5PTUFDQXRQWEhOM0dSN0dnakcwT0F6R2wxN3Q3MG00OEx4a3RC?=
 =?utf-8?B?RnhTZmcwSWhpQXUwNlZnT3JPMnk3R0xWNERqQjlOSDIxV1cva2Iwd0R1NFlr?=
 =?utf-8?B?Y1MzSU82bHJPQ2d6SFZlQ2Vja1BhR3BWbFF6WVdhS1I1SXVvMHpBWHdjM3lx?=
 =?utf-8?B?SndlQkU5MmMrSWZRMW5hMFZkQis1bkhrU1pjcGtpOTRqcDBWQ3B2QjV0L053?=
 =?utf-8?B?cDJSalRVNWJJRThJaFJCR3ZHTFJsOHltbkFydGFSd21zVEYrNXdyeE53YjAw?=
 =?utf-8?B?VkM3UGJ2elMzT0JoaktCS0R2QUYramNQQlY4eStyV0p1dmpxenRIOVZXMWVT?=
 =?utf-8?B?WWh1SGcraW9TZHVPTU9oa25STSsvMEplMVRvczk3YlVtTE0yYkhHRHRtUTNu?=
 =?utf-8?B?VXJYNUQ3VTd2VEorMEJuWGtWclp0SGVGK3dtdEUrcmZGaGNtaFcvT2d0eENq?=
 =?utf-8?B?YklHQlRjb1gzaDlYbENxNXVkVys3V3NFbXBadlZYSXpsZVZXNkRKc1RLRHRF?=
 =?utf-8?B?Qk0zU09yK2k4ekU2V3l5VjVrWEI1bCsyRnJIR2R6K1EydDdkTVVabUxmNzI4?=
 =?utf-8?B?UjFmWDZyeHo4T0dpcVEzU3dDSS9STmh1QUYxUnVhR0cvS1F4aFlSYTAyemZu?=
 =?utf-8?B?Qi9mQklSSzBCYW1EZEJMYUhuc2ZBQWFJOHZwcC9IRjd4a3M2aUs4TkhNeEIx?=
 =?utf-8?B?dkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 08852b8c-28dd-4965-8d2f-08de3bff26f3
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 17:26:59.2651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k/63FrDRlRNm/FVObGpKv/p/a1EOWZr20elbqHovVsBZmv7QGWETijQ+UKXwyyS1sFrppxDQbz5TLxUyi/VN2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4777
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_092705_404214_19CB76DC 
X-CRM114-Status: GOOD (  15.73  )
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

On 12/12/2025 19:38, Frank Li wrote:
> On Thu, Dec 11, 2025 at 06:19:56PM +0200, Adrian Hunter wrote:
>> On 11/12/2025 17:40, Frank Li wrote:
>>> On Thu, Dec 11, 2025 at 03:48:05PM +0200, Adrian Hunter wrote:
>>>> Use pci_alloc_irq_vectors() to support all IRQ types.  Do not call
>>>> pci_free_irq_vectors() because it is unnecessary when the device is
>>>> managed due to the use of pcim_enable_device().
>>>
>>> pcim_enable_device() add action pcim_disable_device(), I have not see
>>> pci_free_irq_vectors() in pcim_disable_device().
>>>
>>> Can you tell me where call pci_free_irq_vectors?
>>
>> pci_alloc_irq_vectors()
>> 	pci_alloc_irq_vectors_affinity()
>> 		__pci_enable_msix_range()
>> 			pci_setup_msi_context()
>> 				pcim_setup_msi_release()
>> 					devm_add_action(pcim_msi_release)
>> 							:
>> 							pci_free_irq_vectors()
>> 		__pci_enable_msi_range()
>> 			pci_setup_msi_context()
> 
> Okay, it should be that pci_alloc_irq_vectors() provide auto free. not
> because pcim_enable_device()?

No, it is conditional on pci_is_managed(dev) which is true if
pcim_enable_device() has been used.

> 
> The below statement should be wrong.
> 
> "Do not call pci_free_irq_vectors() because it is unnecessary when the device is
> managed due to the use of pcim_enable_device()."
> 
> Frank
>>
>>>
>>> And move these small patch ahead in serise.
>>>
>>> Frank
>>>>
>>>> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
>>>> ---
>>>>
>>>>
>>>> Changes in V2:
>>>> 	New patch split from "i3c: mipi-i3c-hci-pci: Add support for
>>>> 	Multi-Bus Instances"
>>>>
>>>>
>>>>  drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 8 ++++++--
>>>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
>>>> index 8ade911e3835..0fd3587671e1 100644
>>>> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
>>>> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
>>>> @@ -203,6 +203,10 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>>>>
>>>>  	pci_set_master(pci);
>>>>
>>>> +	ret = pci_alloc_irq_vectors(pci, 1, 1, PCI_IRQ_ALL_TYPES);
>>>> +	if (ret < 0)
>>>> +		return ret;
>>>> +
>>>>  	memset(&res, 0, sizeof(res));
>>>>
>>>>  	res[0].flags = IORESOURCE_MEM;
>>>> @@ -210,8 +214,8 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>>>>  	res[0].end = pci_resource_end(pci, 0);
>>>>
>>>>  	res[1].flags = IORESOURCE_IRQ;
>>>> -	res[1].start = pci->irq;
>>>> -	res[1].end = pci->irq;
>>>> +	res[1].start = pci_irq_vector(hci->pci, 0);
>>>> +	res[1].end = res[1].start;
>>>>
>>>>  	dev_id = ida_alloc(&mipi_i3c_hci_pci_ida, GFP_KERNEL);
>>>>  	if (dev_id < 0)
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
