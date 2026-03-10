Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE18DFD4F23
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Mar 2026 19:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=VT2yDizv5Z3SaaOjnefgwlOjQ0gWxIAk64ClrxlPrUw=; b=2cBs1dVM1DuJaYgfVYGDqX24Tq
	k1ZyNVT37Q3EkJ7FwaOpEr02Diuf76uURQItTmi438z9z9qrGODPfJK4HgPBcTB/gZaHTGg6J9Qhq
	Tb0SvLiFGKNLtNr3mHYHg8EbVtocUDI0Ssyz6Igv3QW4iKutpYjRkHKemDJn8Z1LwOqjt7TvJyHaj
	stnItCtOhz3YkjdcLnG3EVuBv/msZlrTifXsvZM9psbRYJzEbxcpTTL2MCQtDooK9/s2+MnSUndi2
	Ez86LjnzSPaprSw+UdmLmb+CVy4sztARq7TTn2tJgKNqZuSGsoaqmC+M4w9SBzSL7D5tt2HvAnVU6
	uGJs8u9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w02Wu-0000000A9sJ-31hV;
	Tue, 10 Mar 2026 19:14:08 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w02Wr-0000000A9r8-3Ezq
	for linux-i3c@lists.infradead.org;
	Tue, 10 Mar 2026 19:14:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773170045; x=1804706045;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=AwlYGC+2403iIILChPz2XBKoZ7isy79AJZmZT5S3R8Q=;
  b=Azg2xQ1srls7v/L66ucht+ZW0qP6hWSd+TSPIk96U5Jg+sRLDY8mp0P1
   J9HdlKB131f/WHSVi/zZIyz8ZCoVvhEyWv69Y6xFLBzXlac6T3NwxyH/9
   kQsaOp/Bfjeep7QA7oNk8RqlO3M6NVnSdKjz7GIq/6TGHZagC2SdtYvYm
   JY6niVdLUxLN89ablrKBeLgh48Q04rr6BcUvNs82YaSOmVhQUI/8BytA2
   jRN6GYZK1w/JKPlngq47Ed0vZOUgRB9tTw+NHLUZXGQHp5DVPpVgLSvt3
   wvzj0Rv+ShSeKJa6Yc+G2lL4VCqwxwaFPXtOsCpKdfbKxuSCLTg6JTgRJ
   g==;
X-CSE-ConnectionGUID: qzGZLk+2SmCkrbFCeIGabA==
X-CSE-MsgGUID: nt22e71QSHCeND1PT5Aq3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="77832755"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="77832755"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 12:14:05 -0700
X-CSE-ConnectionGUID: Ol53kn42TS+KXOdgHxsH1A==
X-CSE-MsgGUID: B4aaa0HdTBKgdq3FaNxq+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="225172588"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 12:14:05 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 12:14:03 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 10 Mar 2026 12:14:03 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.51) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 12:14:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rsy9joLtsHSOYdUEMBty08Lacnvit9WHGrgelt5FDus/PaWe9PdDjUtbZSo6Y/AfgR04/2uC7kou15lcfVwGEAStBclOKa4eOP9cmFTK32NrJCDHGS2VNvMLK4WmDS7ZDnGzA7HUuJc0rWQTtUIRJ3l3faY/CZkf9Yy5aivJzuUG8S1WLrydPfmFRtWBGmOXXfw5l6CNHDpvVn2UzopO4gi+soJUnQPM1VlTmO6Hx272o0me6G9NHMm0uaHf75EzPtRHT09W1pK1wZ5bTJZP3xmWq6oougRfsc3WAfBDeXPojMe4m//XwuqPVut4tS7dJESkCI3M7I1FhbSOuaFdWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a9+HLdvrqEk/eys0h6sWtyANF+Uq1hLSMDafCS7pBbE=;
 b=BwchcWmnnjxe4iduuiqdX7a9FdByQsQ7eEx86h8k/R6VLqFasCMv/s617Rnzw1bczsCkH7q7IO8FFSjlHjNE+bpbFjFDMH1H6V0CvEZXbAE1G6ZKQf4zQgnkLCLw3WQljHNtp8NIzuLWGAT7uYuSOq8lGEX/a6wTQo5+US3HAVZ/y7avVRoupVfA6BCxPn4EQq3sqvsPbn8KNCz/5h+cNLgVAwLXn6uyngGAHpvKoL+JUc1cg3RSxE1dONat+XCFOjioC1rig8tK5S3v9QUTBo/ZRAGi3m1MRSFRZ9fa3jChOpi46hfNXA5vVORWOdBMNTA7/sFjOB1TKHuA2IiQcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by DS4PPFE901A304F.namprd11.prod.outlook.com (2603:10b6:f:fc02::5b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 19:14:00 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 19:14:00 +0000
Message-ID: <648bb51c-6c29-4412-adef-c1915b4f9c8f@intel.com>
Date: Tue, 10 Mar 2026 21:13:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] i3c: master: Move entdaa error suppression
To: Jorge Marques <jorge.marques@analog.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>,
	=?UTF-8?Q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>
CC: <linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Dan
 Carpenter" <dan.carpenter@linaro.org>, Jonathan Cameron <jic23@kernel.org>
References: <20260308-ad4062-positive-error-fix-v1-0-72d3c5290b4a@analog.com>
 <20260308-ad4062-positive-error-fix-v1-2-72d3c5290b4a@analog.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20260308-ad4062-positive-error-fix-v1-2-72d3c5290b4a@analog.com>
X-ClientProxiedBy: DB9PR02CA0008.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9::13) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|DS4PPFE901A304F:EE_
X-MS-Office365-Filtering-Correlation-Id: 939e545b-7540-4f46-cc9b-08de7ed92f73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|56012099003|22082099003|7053199007;
X-Microsoft-Antispam-Message-Info: H7xHBFZzuXjfbuZAGUIc49y2g/UqDUSFGZkCtsuKxGugJUe2vYLjLQixJbCloF+k7rcSbm5+LOfM/8B2woG32BflDDOQaZUdkDnQDwTl31c4rrbH5iDAmztIMoJPmaBkf1EmbeqyaW6mGt5g2XD0/e7GuVCKUMFglXhZJKHllyxNl+ozKNJsqz4hmAc/jrNR0d5C4Sc7ESOy0Q2mrXT6ORx4UT7Rw/eWj5Q0itni+GjBEwYAiM0r79jt9bwSiWf/Ue7C59Gp3Rornbkgwr8HL62lJ1Pr4D23GXSVC/ONIAoODQpjs6fp/37t+v5XE4OZYtcV5nJaoS7nhRJx21w8pcwaJRr9iy1nKDEndi4THGeJmITmxLfBUakoK5TfskK9ZeOQ75r4/TzJCjqhvWs6+ny9YoIJB6rJZ9rhYzzH45PdIhXzWr9yeWrlieKtwqhBESnLZw0lA/2lnPwCqfCTGhMJ3I9vyI44Ff7xlqJijfivNQTVtHmiHFjN+iIRMxHL22PDnidWcWrXdgH/73pEd/N3q/lFG74IUEkYmwlDIs8Nm+sZK1j3LKe7uB740PCeG0iiwqcx3YXixdr3Pplc94ZHqBCcXYaXltLZo5RYWSBGwRyUv768uahTfHXSzyXYhA27Utv8Z340XL2PFM+XPMiXw2YqTV2BW3piOJg+W9aOmrOA+Eg4v6E8C7zNOaf8V9BIEieop3AGFI96AxlA1WcpgaZZzedQJ1TycmUic0Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(56012099003)(22082099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3RQa3prdHBIZHdHa0xBSDZtY2VuN3I1cGphRVY2OGlBOEh6SWcvcWpwdU96?=
 =?utf-8?B?KzBDME9nMjlVR2ZvbmxEblcxbW1IRThoSEF5VWNUU2Iyb3lkcHR0VmVRd3BC?=
 =?utf-8?B?cmF2UzMvc0NhU2txOTlrL25wTkVYbEhHdzcxU0xKRVFHd3premI0SW84SzZZ?=
 =?utf-8?B?R3J5KzJWY2JBM3l6VGNnbVJ3cERMWnNHVnc5YXNDUmJRQ0JHVHNFWEFlV1Ex?=
 =?utf-8?B?R2E5T3dlZW1XdGk4NHFlNkZwdXJvRUtDZUk5TFJuSHZ6R2dsVFdzT3ZPbkJp?=
 =?utf-8?B?ZlZvWC9aVjJTNkphQ1Qxc0VFVHV3NmFmVVhjNFBrbkpEN1h1RndRVnRTZzBt?=
 =?utf-8?B?MU9Wa2RSMEFXVXNVWHEzaHlNV2kwOXVseTdqMjZhZCs5UENuMXlCWElma1d6?=
 =?utf-8?B?SDJUaXJicSt6ZGZJYWgwanNUc1ZEQitpM0JUK1pMRWswTHpYenNaRVVGUzZK?=
 =?utf-8?B?L0pIbzhtV0N1MklUd2h4endiZEp0UEw3bXNtMVVhRG83bi94a25ZT3NJSVB6?=
 =?utf-8?B?QTE3NXYweVY2N0szaWNkOWJ4YUZ0bGZ4enFtNytqWEJkOU9oR0hhWE1XaVcv?=
 =?utf-8?B?bUhPd2xCTEwvWHAvaWk4d3M4TzBxdVpoUXNUVExvY0JiTGhRUkVYNWVuSDFE?=
 =?utf-8?B?SENsUXRtTXY5bGt0a25QeWNCOVB3UzVmQ3BmRWZqSFNPMnZSUGNMVkZFZ0or?=
 =?utf-8?B?d01lVkZvTVAwSzVwcFRndzlPUUlpdFNTWE93dnZWOERhcjlGdWc2c2xEaTcr?=
 =?utf-8?B?bFVnRTVnUzgxVjYvam5oNE5mZkkxSkZsTUg2Mk8rUW5tWGpnbGtUSEhHSDMw?=
 =?utf-8?B?YzBrZzZhcFBkQ0xiQmlCWHBsaVV2R0FnK2hTbkJ4eTlCNkRIMCttMWhqRlE3?=
 =?utf-8?B?QlptSk5lVW9wVkVuQ0Rlay8zN0VCYnlDNEpYU056Q3UwTmd6ZUdid1oxM0dw?=
 =?utf-8?B?cHg1TG5TWm5adnQyZGtITlhYaklnL2lveE5uSlpnLzgvdkVINXZvQ3F6L0lH?=
 =?utf-8?B?Z3pNS09lWmJkeGdrNU9JKzlKWi8vcGNyaUMvelIwNXZSV3FKcGZ3M2RONGRB?=
 =?utf-8?B?SjhoS0gwOERWWUg1QTYxaHVrUVBXZDZac0xiVDlDelJweVMyZ2oxWU9CYkJk?=
 =?utf-8?B?d1J2ZzFWNFNtUzdUWCtwc1ZGcVBOck9kU0Vmc0dzcHIydkh6NzFpZ2lqRXAy?=
 =?utf-8?B?a2NhT1hVSC8vN251dUtGSHBNY29WK0VJSFA1RWliaE5VTjZ4djFaVGJpTjU5?=
 =?utf-8?B?cU5LYUgxV0JaMzlWZTZsWGRMQjQ0MTBPalJOV21LL2lqVStqQUpvV2FrMUtI?=
 =?utf-8?B?Z21OWVNmNFZMQjMwK2VvenlJWHp0Z2JML0xScFM0VXZlbkpXMmExbGFmYVF2?=
 =?utf-8?B?SFllTUZLWmswV1FUR1llOTZKSW51ZEU1enhoTE9NY1lkWmUySXdySUpOeWE0?=
 =?utf-8?B?S0xuT3RSR0hGRm1jbU5SK2ZzSUE4czBncytNZ1F2Ry84L1pmbDcwY3hYRnhu?=
 =?utf-8?B?dVY4WTczT0RVblF6Q2dpSU5OK1JVTEJGVzd3ejErSDJLKzNPLzVhYnVZNEJL?=
 =?utf-8?B?Y0hiQklYY0ZYSUpTRnhYcUpaQmc0THZFTGtobnhZcmJFZG1tWkpSc2VJY3Z2?=
 =?utf-8?B?eTBrUWdkbElRM1JOMEY1MWVWSGJKR0tZSVhpL0ZBYzNaZGtOM01Xd2ttTUF5?=
 =?utf-8?B?Y3pCTVRYQkFobWZ0WDNxemZ6a0hpNGEyM1NqRjJlY2Rib3NOWlZSTmZqZEw0?=
 =?utf-8?B?N2tkUExiZnVrSE42dDlBek1DclpxVXlHTmhxVUc3SnFwUGpxOXJ4a05oNmVM?=
 =?utf-8?B?VWdqRGM2WEs3ZmUveWhFWVVQS0xCVlFzQlFSZi91cWtUVVlHb3RGdEx2SVFF?=
 =?utf-8?B?SG5HSS9FcExvT3BzYzd6TUJqQlhQT1VxaVc0QkNKR0RyWG5QVTg2TEtiSExz?=
 =?utf-8?B?ZS8zMjU4WW9ZQmZ2RktRNFNHVXVxOXFZa1ZZK3lhNCtnSWdWM1RaUXMzYzhM?=
 =?utf-8?B?SEo5WmZYVTBpRS90QlRCRmVlSnlNd1hSb1FudVYyWjdKK0V4Y0FiZ0xKb0hV?=
 =?utf-8?B?TnMrejgzOTZCWXJuT3Bhdm14ZFBUTW9Zb056dEVOV2h0ZzRCNXBVR1lyL3Zs?=
 =?utf-8?B?TmRpWG5IeXNnWGJ6L1pCcmhKQXVSZ2tnclZBUmVQR283eXRJYzA1cUpqUFZ2?=
 =?utf-8?B?cnA1Z0ZibjRxRlkyVmVPMUFVN1JkaXJQL1B3eE0ySS9qUStmQUR4R2Nzamsz?=
 =?utf-8?B?YVhtZU5GNlFIcGZaNE84c1ZaMnhkMmR0aUtoRHVmNEUxQ29sd2lIcFZSS29B?=
 =?utf-8?B?K2ZYdi8rTmsweFM1MkhoYTJ5REh1cUVqSXZEM0wramlOS0VYMEMwVkJXaU8v?=
 =?utf-8?Q?ByWMHaMrxDYL6ztY=3D?=
X-Exchange-RoutingPolicyChecked: P7DESj5rmXhsUbG6Byj5qP/CT2HXDQpDG+xqFE7UMTWFht5FVVRLkSJlyHr2mbJ2ok2GX3s6Sxpv54848/bPFA6oQKpCoZFzBuZZQ/oFUxUB2NpSyW8SOnN4AE6hCVeEpniYD9HrQewugtBLHq7e/hURgsq7mQrFRSrbdtE9iz3loPx+6uqKeDcTwP/sWdYLkHNF5buCHTk6DyJkxlq8SPBVbu7tTZ6ru7G25U6s70nzHM5DqvaHK3zgoAeiAQT32DWDQ4MB02W/9MSV1/WnTEvNB2hpUp9G1/USvNKE8QZinPXmSFChT33RzDdpOm5y5btk6Ud52h5XdkGEkJP7Vw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 939e545b-7540-4f46-cc9b-08de7ed92f73
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 19:14:00.4684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y9vhHRE5+jIcEjBWVy/RwM2x3npN6YUG+gqMWdYOxCk27XZFTHlV4qeBdoB64jEK9EF93XLkm/lyMBvjmMRy7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFE901A304F
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_121405_920470_D86AB570 
X-CRM114-Status: GOOD (  19.20  )
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

On 08/03/2026 18:47, Jorge Marques wrote:
> The CCC ENTDAA is invoked with i3c_master_entdaa_locked and yields
> error I3C_ERROR_M2 if there are no devices active on the bus.
> Some controllers may also yield if there are no more devices need an
> dynamic address, since the sequence do always end in a NACK.
> 
> Handle inside i3c_master_entdaa_locked, checking cmd->err directly.

Commit message has the same issues as patch 1

And the pertinent fact that there are only 2 call sites of
i3c_master_entdaa_locked() and both are dealt with.

> 
> Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> ---
>  drivers/i3c/master.c                 | 7 +++++--
>  drivers/i3c/master/adi-i3c-master.c  | 3 +--
>  drivers/i3c/master/i3c-master-cdns.c | 2 +-
>  3 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 31822fd5ffde..ce1898345810 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -1036,8 +1036,7 @@ static int i3c_master_rstdaa_locked(struct i3c_master_controller *master,
>   *
>   * This function must be called with the bus lock held in write mode.
>   *
> - * Return: 0 in case of success, a positive I3C error code if the error is
> - * one of the official Mx error codes, and a negative error code otherwise.
> + * Return: 0 in case of success, or a negative error code otherwise.

That comment change seems premature.  Mx (x!=2) error codes are propagated
until patch 4

>   */
>  int i3c_master_entdaa_locked(struct i3c_master_controller *master)
>  {
> @@ -1050,6 +1049,10 @@ int i3c_master_entdaa_locked(struct i3c_master_controller *master)
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
> index 6616f751075a..fb9a48830446 100644
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
> index b78aebf6b2ca..5cfec6761494 100644
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
