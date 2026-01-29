Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8422DD73E80
	for <linux-i3c@archiver.kernel.org>; Thu, 29 Jan 2026 20:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lyZtZXvJE8jYMS49iQDYhQgycfSIMABZ53lt0m/QdTk=; b=3Ecn8KfgzM3z4b
	XJuOGU6cbPIZgMtow0i1IqzsXnPC9ikCYPMg+A6cvlii6IhdfaZD6u+t4XsXzJp0OvfqCwF7nsoaK
	JjLmynbnfVGC/2fxFPDETFpzL4+ND2Y4H5oXIlfZ8kHRZwQMZCvAaVL0SPJ8GHlnsZ8SDdRI+0LfJ
	p+4Gyk2MRAljpnylj7Q5tINV/u3SZ9lOS59Rtm5uRD8lrQ9jGHojX5EqoruB0/kjjI8gJxO3k5515
	YV92Ey6Kql2PUHjnwDtXlSFBx4kidDQhGgFVyzWET1ojHJyicf2liZ4MJbyNYkxiJld1ENqDPmnjC
	m3QtpXtdlDcjcpaS+cfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlYBp-00000000aSS-0jks;
	Thu, 29 Jan 2026 20:00:29 +0000
Received: from mail-norwayeastazon11013030.outbound.protection.outlook.com ([40.107.159.30] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlYBl-00000000aQq-2NfM
	for linux-i3c@lists.infradead.org;
	Thu, 29 Jan 2026 20:00:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CcIlBCBhftv7J3bcA8QdVCRHel22s0Bh+nKD1O9vL0dGcGf/M9TUUlR6K5WdQAPBz5LSX5Wa1QpCQAOb8Fb3alf1M4PgcPiIy0gtFyOTx89/jl47KYohighv4t03fQQPL+p0uX1L6TJF3FqT1YNsmY0YUOcDiczzG8iTMs5VbFxK6NwvCY1SIdG//C3NMNexcwBRzm9diYYnxnBhjIul828kwlw1AZMIdOTPQywje9OzMnyQldP2REEWYc90Yk+WhcW+A7xIBzc1LDtmtn0V1Pg71ehYOIfA6clxIK9CyCoseIvo7+cDMSjkSJCY86KeI9a6oyBXvyh39NdrvNR/Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5EPlQY3wkWQ4yoVkr3KNZc+1lpTDqoZD9FiJRINhVMw=;
 b=nOoRqJnLFx85aNAXt6GT7bOj2PwAfDQ+v2U1TJz1zqXdhqobH+FxjAr2VS5GVTm4PZmXim49NjCC/DfjRfofF7KEdvv7EOKIRBdHfGXepemVJG6C/Hlh4YqFqOmQey3yB5RJYYl9vYcavLn2CW66xCIj579NW8TsonywNeXrqbMCeSBzGMeFA1i1iiMBBAeZ7WxlWtu8v5LjWvVqD3QTAny0oyWmLZ9gsbFgfDpGIzRX2ljBhqPzvbuC+argGr3IUxMSCjPpuZWkm1673dltgl4X+hF1uEC7Grelk2EGO/sYhEXH8nEpNjbFLMYUZsP6BQiLimZ8wkwkYbQh9Po+pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5EPlQY3wkWQ4yoVkr3KNZc+1lpTDqoZD9FiJRINhVMw=;
 b=NO86FIhAhmDOSE7PtN6XfgzWvrdrpfw+le3m74hqNsdfJE2LHzJy+WMLG1kR9Q/DVQ8u6x2BVGpV2cCk9hj/g86jTHfYmdEphNwMsOb1FrmcJQKdJjlmB0/jSw+9bzE4vo4jT+rnYbsIICNmy9f9EMjvL9oE/YzTqNo+91ze7AVjEpeZ56vON7fs5aAb8L8Gcd27rtrWLKKIeNEL8G4MKaoB3b+sbqbhBJuAvvH9dUBzxUvaAKMcZ+50db/fB5wYBJyidPP+R6zA+0S4JyaMNpwaQFbeGHXTMIIH9gE80bEAXdGVYiTnEukY2PgjWd+aFX3fvkbJxA1xwRxGGo4KLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM9PR04MB8859.eurprd04.prod.outlook.com (2603:10a6:20b:40a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 20:00:21 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9520.005; Thu, 29 Jan 2026
 20:00:20 +0000
Date: Thu, 29 Jan 2026 15:00:14 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 5/7] i3c: mipi-i3c-hci: Allow parent to manage runtime PM
Message-ID: <aXu8TiFpMiIVk5Iq@lizhi-Precision-Tower-5810>
References: <20260129181841.130864-1-adrian.hunter@intel.com>
 <20260129181841.130864-6-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260129181841.130864-6-adrian.hunter@intel.com>
X-ClientProxiedBy: SJ0PR05CA0124.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::9) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM9PR04MB8859:EE_
X-MS-Office365-Filtering-Correlation-Id: a98bbf36-3f68-46e9-e700-08de5f71080d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|366016|1800799024|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NkswUWdVdWpvays0N1Q2NXh0dmtYbnBQZFVlRlZCM0NsZDB5c2k3TytIVGZ1?=
 =?utf-8?B?ZWZLdENxallmQmRyMHI4MkluUFZZL3hVdFJveTFOUG94MWxpWjFhbHprQzll?=
 =?utf-8?B?SFFkaU1LZHFrTVF1Z2dFWjQxUFZEbmRaWGxTQzlGNzdGbjBJdGxkdjZzeHU2?=
 =?utf-8?B?UC9nRUZqOHFxcmtrU2dwc00rQlZQcGpRUWpxenIzT0hqeEMxUEExLzdrNGpB?=
 =?utf-8?B?aHpFaEdWOFpEZ3pCRE1VcnBKSGdkQjQxVjFxZ2FlamREcExqREJqanNTMjZl?=
 =?utf-8?B?UGs5Y0hFMU1Gdll1QXVkNnA0ZTY2V0FQQTVlSmhZS0RTN3RZRTdpS3pzUml6?=
 =?utf-8?B?RVFzOHpTbk1ua29sQ2JVSGdha2RIYXQ1cVNTbGRUZFZJdFc4VUVOazVlQ24w?=
 =?utf-8?B?Sno0RG8rZEpVVXZmU2JwSUtGbUYrNFBwdFpoWXNIb05aTG8raEFwcUNvdXBI?=
 =?utf-8?B?MzQ4d0xHZEFERVBINVZvcnVReFlhMng4Z2tXTXgzUEE0NlpJaVhtZnhRK2dj?=
 =?utf-8?B?cTRqU2N4YnhZcTV3eVhVMUFKT2dta2c3SkR2TDdleURpS2hhQ3lQUG9KUHBj?=
 =?utf-8?B?cXM3MkR0QWtnMjFiUGdkdmlzeHhkTDI2ak54NEJTdmtYbEJUREdWeEJDWUJr?=
 =?utf-8?B?QUFKQVZhQjZ2S2VkeEw4WlpFZDBZWGVha3ZpZzhTWXBJdkhzOTV1QVJzWWxh?=
 =?utf-8?B?dTN3cm8veHdGVEdSbmVxd1pSYm5yWHJVUjJFY1NaUDFWd1MyaEdCdGRCYndw?=
 =?utf-8?B?cHRjY25WY2dTS3B0VkpyTGwvd2V2aTRadVhZN3NxOGFjY2xDS0w5QnZheGxm?=
 =?utf-8?B?SHRkSFdvSHB0MVlqU0VqazhRWlczai9VbTJrdHpGMForZ2ZuY3lPWm1uTjBU?=
 =?utf-8?B?TnZDbXVjWHJIYUFOdlEwTlNKU3NacUtsMzVGcDFqdEpOMzVjTmppNU5NakNo?=
 =?utf-8?B?U0RDM2wzLzNDNndzYy9OZVc3VTNtTHdheVREc09LdG50LzV5N0k4ZFN3MHM5?=
 =?utf-8?B?c0ZnTzM5MHQ5TUU1a2UvSFJzMnJEeU9QMCtZb01wSnBEc21CTnczQVZTczRv?=
 =?utf-8?B?L1VSQUxPdlFBTkw3MURDSmI2Q1VPTVRTN0d5THd6cHNnZFNvUS9pbHFWd3M1?=
 =?utf-8?B?V3loUU9sdFRPc3c5R2JNTU5PK2lQWVV3ZGJTak1yL09BYTlyN3kvS2EyU1lX?=
 =?utf-8?B?ZndsN2xZRU4rcWtXcGpFRlF5YW9kWUFlM2JmbVRnc1hiY0xia3U4VnhMTmFn?=
 =?utf-8?B?eUxQRzQ2MVM5SEc1STJzSjZhMXJBdk4wZ2g4ekhRNnptNzFKMzcrUmZ5WUxp?=
 =?utf-8?B?NXVjWVFVekVHL0tQV2haenhHY29Bd1RoWWNYTzFTbmpmTlRCZjdCMURsa29j?=
 =?utf-8?B?eUdJOEJPM05HaTdRRU5YckpDdzB2YllVQStyandWRnZVUG44ZlFVOVFWcHEx?=
 =?utf-8?B?VkJiMUR0bHJKRkQ0dW8wbGZaZ0g1clFnNzNYc29uRElCRjRTS0NPcTFReDdO?=
 =?utf-8?B?aXlpZjgwWFBxUnozcnRscWNRUjBkN0ZFeHMvKy9kZEx0MytlTzBGNzVpR2ly?=
 =?utf-8?B?MWdTM0tqV0VuWmRmbU03Q0NmeHZRdDNwNVlxZms3TE9MRnhUZ3V3c2x6ZFN2?=
 =?utf-8?B?Tzg5VGFOMGhqb0NlYjJkNjMwKzNZby83Wm9nanh5R2NXNjZmRytXTFltVzVp?=
 =?utf-8?B?STZCM0wvKzN5TzhBTkRnSTNpbDFuOW8wZ0NqcStsdGdoVmtjQ2ZnQmNtbWNR?=
 =?utf-8?B?KzdtelVCSFpxSFNHVm1uRUpqdjBod212MGZCRFdac3dGL0lFMWpjY2s0ZmlQ?=
 =?utf-8?B?K1IzcHgyOTlVc1VuTmVpbGJzNUUzakpteDlSTkdDUEpMblkwQXdxdFNPTnZi?=
 =?utf-8?B?UDVtbDBNZ2hTWW1oOTQ3SWRvdlg3LzlGYVJxNWtDcmpoZHhRR1laSEJ6Y1BF?=
 =?utf-8?B?NllOVGczaGVlYkJidkxMalRmdDJSVmRUZkt6bVJablNCQW42U3haY3l0S0Yv?=
 =?utf-8?B?VGhLWG9kYjg2eHl3Q2o5akZXWXg0Tm8yQVpHMTFqNVBxaWdVc1k0Wi9VazJv?=
 =?utf-8?B?N2d0UmRJSU90aVovaW9jZkRsZEFnVmJvQWhkQVVUNjc1ZmJpaEwwUGROR0o0?=
 =?utf-8?B?dXZ4Q3BOcy9PNTNwdUNrRE9QdGhsaTd5Y2RxVmhjVVpuQ0s5MHpXaldXbjRT?=
 =?utf-8?Q?G2G9xKDpsFS/HGLopGwo194=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVVQZ2ZBaGZFM3J4UGJXTWVKSGMyaHpXRVgvdVBBMlloRHZvYVJxVVh0YzZh?=
 =?utf-8?B?VVNGMTl5RmxmY21MYnFocjRzWDd1VXF3L0RzTTB3VGY4eWVyRmRnNDUwdmpu?=
 =?utf-8?B?bWJlYWV5ZEM3Vkc3MUxhMmtVaTV0RzBLSmoramcxaVgwVzZSczBOLzh5b1hX?=
 =?utf-8?B?VW03S3ZLdnJuZ0lnUll5SmJXWmE2d1Noak42VS9yT0ovOUNZeDR2M29WMFVs?=
 =?utf-8?B?WER2NnlJcWZsUldjSTdRSGhGVGdPL2xGUVE0bnZ3YlpNZnBvWTF6N3JaelRM?=
 =?utf-8?B?ZjhqU01JMTJJamwvVWZVaE9wSUw2bGxxSk80MlA2V0VxWlROZmY3d0ZNS1hP?=
 =?utf-8?B?ODFCbWNxWkFtcW1BZ2gxcndPeGxPR0czbnVmRHRla01RMEl3VDFJUHdoR2Rw?=
 =?utf-8?B?VE04elJ2bDFrdkZrbStwVUoraUQ3WlFwWEx4QkJwVmdzTkZJOUdlTnlKeUp6?=
 =?utf-8?B?dnpJNkRDenZEbnB1L0V4bHJQUlUvckI4WW5FcjdMcGtDNDhSb21Ib1FucUtI?=
 =?utf-8?B?TUFoT1c5Z1ZYV01SbnEwQUgrVHV5SnFuSzF6TWExRFV2NjJJQUswUVBUQ3BH?=
 =?utf-8?B?ZjJqc2ZqZVRJSTJncWVlT3NzOTQ0dDd0ekNGZndSWTVKZ0dIbi9MVVI5WUVM?=
 =?utf-8?B?NDNhR0poOGpkUVFCQ0N5R3V5NWdHVnozcW5Wcm9qczhzRTJSK2Y2ZXBycjJP?=
 =?utf-8?B?bEJ4ejJRQklBUEhQaTM2OTNwSU81RjBnS25qZnVmUVVWT1BzNkRVWmdQUHFu?=
 =?utf-8?B?MmZmWWpCSnJXKzVxOWZuaHpuV3pFTENDenBvekRkR0huT1VUSHhlTk5DazUv?=
 =?utf-8?B?dEM1SUVXb2U4Z1VvRXZPYy9pWEFtcmdsQUdtb2FobGhZNm1zWkdSTXJEWU8w?=
 =?utf-8?B?dk4wNC9SOUE3UllFdlV6VzlTUG5SQ2pUOFRYRlVldFdxTUtqcExiVit0SGhD?=
 =?utf-8?B?OXhselB0L1MrbTJUSDBYek5DZjJUWTQzQXVPbExScXE0RDhLWDF5Nm5yMnBj?=
 =?utf-8?B?aVlZckFvRzNpcEw4S2RlZ2hxdGhMM3cyOGpSYlZxMVlkZ3hkU0czdmxBMEFt?=
 =?utf-8?B?amFNdm1LdGVVeEJGR3EyT3M1RHFUMVMwQU5YSnpPZ0kxMm5DWllpK2hvR0dU?=
 =?utf-8?B?NjhEZ1lDQS9WVW5FSUg4WWJ1OGJTYno0aVlMYVpYNXhmbm5mOXJTbU1CRjQv?=
 =?utf-8?B?MlRjTzVFRUVKeThyNjJIV2R4NmZhVndReGtscW5jQUtaeWx3ZkFFWU0xRHE3?=
 =?utf-8?B?enVBd0NaVW1wTFk2Yzl0RjZ2VHl1L1E5RUplb0UwbTJIc3ZSak5xRGpVZ2Yr?=
 =?utf-8?B?L0xCVjVCUkNuZjgwVkdaZ25Fbm1ORWpjTDJyWGR5UDVtcVRRbE00SE1kbzVK?=
 =?utf-8?B?Wmo1OHhpcmxKZnN2dk1FakVCREdpeXV1MWFuaGE0WGxTM1kzTTV2Yld3ZDd6?=
 =?utf-8?B?dFRTdndiKzgzNHRXUGZ5ZDdkdzFubmhEZUxSMnp2N1pqSktjVCtqNEF0bXdn?=
 =?utf-8?B?WlhocTVwU1RObitEL2JNVVZaMHpnU3g0R1k0SmJ3RU9nOFZzK2hmQnljS21O?=
 =?utf-8?B?V2JtcWh0Rmt0VjE5TmtVR05nMzhkeEtkaE1xWmFodlFFZEhaRERnc0lJR3NN?=
 =?utf-8?B?VDdoZndmQ0F0ajhCOHBBeXpzZ3g2RHpqaENDT2sxMFZMTGVWVTNUelM5RVBj?=
 =?utf-8?B?d05QMThBbVZoOHlSYVZJQmlMckdldlJEeFBkRm5yZzlBa0lSRm56L252T0px?=
 =?utf-8?B?SzcxQVB4OC9jT2IrV0VWSkpnNWovT0NYN2w5WDN2THBCTDd0MW1LTFJhc3NM?=
 =?utf-8?B?RmV1cEw2RjJ2bitibWlUeDRnWlZSanZ6ang4NkluN3FNN0trWHMzNS9CYUZO?=
 =?utf-8?B?bi9CTGhYUHlCNlZBdzdHNHphZ3JDdERoZnNYeTkyaXRESmoyZkVMTlBOZEtk?=
 =?utf-8?B?WFByQkFyYytpcVNVRTlVY0FyTlEyS2JPc1VxK29PUUhXRVdGdWh0eUR3Znlx?=
 =?utf-8?B?Y1l2QlVWckJJa3BKRkV4Nk40elFFbUxTdHdOL1RFTFdwMFU0SmZrMnVXdzdx?=
 =?utf-8?B?WmZyQlpDbnp1MU04dFBZaXZPeUZ1blFzR0EwNHQzOW9SUktCc1RSSzM1cUlL?=
 =?utf-8?B?WVVNcVlkWU9GVmltVTU5bDVZRkhrM211OVBYTEVrZUNyS09LS3F6RTVyTVF3?=
 =?utf-8?B?WFdEdHR4c0d0bWtBdDFZUVRYUUpUSHgrczNjN1RNT1JDOXZXMm9OYzd6T214?=
 =?utf-8?B?OTlka2dVSkcxK0plUE5TNURjc3B5SWxPSmhKOFhTRGo0eVU3ZmNpVVVXRURT?=
 =?utf-8?Q?ORddk090d7sf8rpOs0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a98bbf36-3f68-46e9-e700-08de5f71080d
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 20:00:20.6998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vOJHmuhUkj4l6aJ5ZM65T473fZHr1kSRRX1cLNKL3PxilwJwJu0CKswdaFYqUcAvJAsolPC4Vi58Fs95SP7afw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8859
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_120026_818471_B5203544 
X-CRM114-Status: GOOD (  30.52  )
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

T24gVGh1LCBKYW4gMjksIDIwMjYgYXQgMDg6MTg6MzlQTSArMDIwMCwgQWRyaWFuIEh1bnRlciB3
cm90ZToKPiBTb21lIHBsYXRmb3JtcyBpbXBsZW1lbnQgdGhlIE1JUEkgSTNDIEhDSSBNdWx0aS1C
dXMgSW5zdGFuY2UgY2FwYWJpbGl0eSwKPiB3aGVyZSBhIHNpbmdsZSBwYXJlbnQgZGV2aWNlIGhv
c3RzIG11bHRpcGxlIEkzQyBjb250cm9sbGVyIGluc3RhbmNlcy4gIEluCj4gc3VjaCBkZXNpZ25z
LCB0aGUgcGFyZW50IC0gbm90IHRoZSBpbmRpdmlkdWFsIGNoaWxkIGluc3RhbmNlcyAtIG1heSBu
ZWVkIHRvCj4gY29vcmRpbmF0ZSBydW50aW1lIFBNIHNvIHRoYXQgYWxsIGNvbnRyb2xsZXJzIGVu
dGVyIGxvdy1wb3dlciBzdGF0ZXMKPiB0b2dldGhlciwgYW5kIGFsbCBydW50aW1lIHN1c3BlbmQg
Y2FsbGJhY2tzIGFyZSBpbnZva2VkIGluIGEgY29udHJvbGxlZAo+IGFuZCBzeW5jaHJvbml6ZWQg
bWFubmVyLgo+Cj4gRm9yIGV4YW1wbGUsIGlmIHRoZSBwYXJlbnQgZW5hYmxlcyBJQkktd2FrZXVw
IHdoZW4gdHJhbnNpdGlvbmluZyBpbnRvIGEKPiBsb3ctcG93ZXIgc3RhdGUsCgpEb2VzIHlvdXIg
aGFyZHdhcmUgc3VwcG9ydCByZWNpZXZlIElCSSB3aGVuIHJ1bnRpbWUgc3VzcGVuZD8KCkZyYW5r
Cgo+IGV2ZXJ5IGJ1cyBpbnN0YW5jZSBtdXN0IHJlbWFpbiBhYmxlIHRvIHJlY2VpdmUgSUJJcyB1
cAo+IHVudGlsIHRoYXQgcG9pbnQuICBUaGlzIHJlcXVpcmVzIGRlZmVycmluZyB0aGUgaW5kaXZp
ZHVhbCBjb250cm9sbGVyc+KAmQo+IHJ1bnRpbWUgc3VzcGVuZCBjYWxsYmFja3MgKHdoaWNoIGRp
c2FibGUgYnVzIGFjdGl2aXR5KSB1bnRpbCB0aGUgcGFyZW50Cj4gZGVjaWRlcyBpdCBpcyBzYWZl
IGZvciBhbGwgaW5zdGFuY2VzIHRvIHN1c3BlbmQgdG9nZXRoZXIuCj4KPiBUbyBzdXBwb3J0IHRo
aXMgdXNhZ2UgbW9kZWw6Cj4KPiAgICogRXhwb3J0IHRoZSBjb250cm9sbGVyJ3MgcnVudGltZSBQ
TSBzdXNwZW5kL3Jlc3VtZSBjYWxsYmFja3Mgc28gdGhhdAo+ICAgICB0aGUgcGFyZW50IGNhbiBp
bnZva2UgdGhlbSBkaXJlY3RseS4KPgo+ICAgKiBBZGQgYSBuZXcgcXVpcmssIEhDSV9RVUlSS19S
UE1fUEFSRU5UX01BTkFHRUQsIHdoaWNoIGRlc2lnbmF0ZXMgdGhlCj4gICAgIHBhcmVudCBkZXZp
Y2UgYXMgdGhlIGNvbnRyb2xsZXLigJlzIHJ1bnRpbWUgUE0gZGV2aWNlIChycG1fZGV2KS4gIFdo
ZW4KPiAgICAgdXNlZCB3aXRob3V0IEhDSV9RVUlSS19SUE1fQUxMT1dFRCwgdGhpcyBhbHNvIHBy
ZXZlbnRzIHRoZSBjaGlsZAo+ICAgICBpbnN0YW5jZeKAmXMgc3lzdGVtLXN1c3BlbmQgY2FsbGJh
Y2tzIGZyb20gdXNpbmcKPiAgICAgcG1fcnVudGltZV9mb3JjZV9zdXNwZW5kKCkvcG1fcnVudGlt
ZV9mb3JjZV9yZXN1bWUoKSwgc2luY2UgcnVudGltZQo+ICAgICBQTSBpcyBtYW5hZ2VkIGVudGly
ZWx5IGJ5IHRoZSBwYXJlbnQuCj4KPiAgICogTW92ZSBERUZBVUxUX0FVVE9TVVNQRU5EX0RFTEFZ
X01TIGludG8gdGhlIGhlYWRlciBzbyBpdCBjYW4gYmUgc2hhcmVkCj4gICAgIGJ5IHBhcmVudC1t
YW5hZ2VkIFBNIGltcGxlbWVudGF0aW9ucy4KPgo+IFRoZSBuZXcgcXVpcmsgYWxsb3dzIHBsYXRm
b3JtcyB3aXRoIG11bHRpLWJ1cyBwYXJlbnQtbWFuYWdlZCBQTQo+IGluZnJhc3RydWN0dXJlIHRv
IGNvcnJlY3RseSBjb29yZGluYXRlIHJ1bnRpbWUgUE0gYWNyb3NzIGFsbCBJM0MgSENJCj4gaW5z
dGFuY2VzLgo+Cj4gU2lnbmVkLW9mZi1ieTogQWRyaWFuIEh1bnRlciA8YWRyaWFuLmh1bnRlckBp
bnRlbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvaTNjL21hc3Rlci9taXBpLWkzYy1oY2kvY29yZS5j
IHwgMjUgKysrKysrKysrKysrKysrKy0tLS0tLS0tLQo+ICBkcml2ZXJzL2kzYy9tYXN0ZXIvbWlw
aS1pM2MtaGNpL2hjaS5oICB8ICA2ICsrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDIyIGluc2Vy
dGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFz
dGVyL21pcGktaTNjLWhjaS9jb3JlLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNp
L2NvcmUuYwo+IGluZGV4IGVjNGRiZTY0YzM1ZS4uY2I5NzRiMGY5ZTE3IDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvaTNjL21hc3Rlci9taXBpLWkzYy1oY2kvY29yZS5jCj4gKysrIGIvZHJpdmVycy9p
M2MvbWFzdGVyL21pcGktaTNjLWhjaS9jb3JlLmMKPiBAQCAtNzMzLDcgKzczMyw3IEBAIHN0YXRp
YyBpbnQgaTNjX2hjaV9yZXNldF9hbmRfaW5pdChzdHJ1Y3QgaTNjX2hjaSAqaGNpKQo+ICAJcmV0
dXJuIDA7Cj4gIH0KPgo+IC1zdGF0aWMgaW50IGkzY19oY2lfcnVudGltZV9zdXNwZW5kKHN0cnVj
dCBkZXZpY2UgKmRldikKPiAraW50IGkzY19oY2lfcnVudGltZV9zdXNwZW5kKHN0cnVjdCBkZXZp
Y2UgKmRldikKPiAgewo+ICAJc3RydWN0IGkzY19oY2kgKmhjaSA9IGRldl9nZXRfZHJ2ZGF0YShk
ZXYpOwo+ICAJaW50IHJldDsKPiBAQCAtNzQ2LDggKzc0Niw5IEBAIHN0YXRpYyBpbnQgaTNjX2hj
aV9ydW50aW1lX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQo+Cj4gIAlyZXR1cm4gMDsKPiAg
fQo+ICtFWFBPUlRfU1lNQk9MX0dQTChpM2NfaGNpX3J1bnRpbWVfc3VzcGVuZCk7Cj4KPiAtc3Rh
dGljIGludCBpM2NfaGNpX3J1bnRpbWVfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikKPiAraW50
IGkzY19oY2lfcnVudGltZV9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQo+ICB7Cj4gIAlzdHJ1
Y3QgaTNjX2hjaSAqaGNpID0gZGV2X2dldF9kcnZkYXRhKGRldik7Cj4gIAlpbnQgcmV0Owo+IEBA
IC03NjgsNiArNzY5LDcgQEAgc3RhdGljIGludCBpM2NfaGNpX3J1bnRpbWVfcmVzdW1lKHN0cnVj
dCBkZXZpY2UgKmRldikKPgo+ICAJcmV0dXJuIDA7Cj4gIH0KPiArRVhQT1JUX1NZTUJPTF9HUEwo
aTNjX2hjaV9ydW50aW1lX3Jlc3VtZSk7Cj4KPiAgc3RhdGljIGludCBpM2NfaGNpX3N1c3BlbmQo
c3RydWN0IGRldmljZSAqZGV2KQo+ICB7Cj4gQEAgLTc4NCwxMiArNzg2LDE0IEBAIHN0YXRpYyBp
bnQgaTNjX2hjaV9yZXN1bWVfY29tbW9uKHN0cnVjdCBkZXZpY2UgKmRldiwgYm9vbCByc3RkYWEp
Cj4gIAlzdHJ1Y3QgaTNjX2hjaSAqaGNpID0gZGV2X2dldF9kcnZkYXRhKGRldik7Cj4gIAlpbnQg
cmV0Owo+Cj4gLQlpZiAoIShoY2ktPnF1aXJrcyAmIEhDSV9RVUlSS19SUE1fQUxMT1dFRCkpCj4g
LQkJcmV0dXJuIDA7Cj4gKwlpZiAoIShoY2ktPnF1aXJrcyAmIEhDSV9RVUlSS19SUE1fUEFSRU5U
X01BTkFHRUQpKSB7Cj4gKwkJaWYgKCEoaGNpLT5xdWlya3MgJiBIQ0lfUVVJUktfUlBNX0FMTE9X
RUQpKQo+ICsJCQlyZXR1cm4gMDsKPgo+IC0JcmV0ID0gcG1fcnVudGltZV9mb3JjZV9yZXN1bWUo
ZGV2KTsKPiAtCWlmIChyZXQpCj4gLQkJcmV0dXJuIHJldDsKPiArCQlyZXQgPSBwbV9ydW50aW1l
X2ZvcmNlX3Jlc3VtZShkZXYpOwo+ICsJCWlmIChyZXQpCj4gKwkJCXJldHVybiByZXQ7Cj4gKwl9
Cj4KPiAgCXJldCA9IGkzY19tYXN0ZXJfZG9fZGFhX2V4dCgmaGNpLT5tYXN0ZXIsIHJzdGRhYSk7
Cj4gIAlpZiAocmV0KQo+IEBAIC04MTIsOCArODE2LDYgQEAgc3RhdGljIGludCBpM2NfaGNpX3Jl
c3RvcmUoc3RydWN0IGRldmljZSAqZGV2KQo+ICAJcmV0dXJuIGkzY19oY2lfcmVzdW1lX2NvbW1v
bihkZXYsIHRydWUpOwo+ICB9Cj4KPiAtI2RlZmluZSBERUZBVUxUX0FVVE9TVVNQRU5EX0RFTEFZ
X01TIDEwMDAKPiAtCj4gIHN0YXRpYyB2b2lkIGkzY19oY2lfcnBtX2VuYWJsZShzdHJ1Y3QgZGV2
aWNlICpkZXYpCj4gIHsKPiAgCXN0cnVjdCBpM2NfaGNpICpoY2kgPSBkZXZfZ2V0X2RydmRhdGEo
ZGV2KTsKPiBAQCAtOTYyLDYgKzk2NCwxMSBAQCBzdGF0aWMgaW50IGkzY19oY2lfcHJvYmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgCWlmIChoY2ktPnF1aXJrcyAmIEhDSV9RVUlS
S19SUE1fSUJJX0FMTE9XRUQpCj4gIAkJaGNpLT5tYXN0ZXIucnBtX2liaV9hbGxvd2VkID0gdHJ1
ZTsKPgo+ICsJaWYgKGhjaS0+cXVpcmtzICYgSENJX1FVSVJLX1JQTV9QQVJFTlRfTUFOQUdFRCkg
ewo+ICsJCWhjaS0+bWFzdGVyLnJwbV9kZXYgPSBwZGV2LT5kZXYucGFyZW50Owo+ICsJCWhjaS0+
bWFzdGVyLnJwbV9hbGxvd2VkID0gdHJ1ZTsKPiArCX0KPiArCj4gIAlyZXR1cm4gaTNjX21hc3Rl
cl9yZWdpc3RlcigmaGNpLT5tYXN0ZXIsICZwZGV2LT5kZXYsICZpM2NfaGNpX29wcywgZmFsc2Up
Owo+ICB9Cj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9o
Y2kuaCBiL2RyaXZlcnMvaTNjL21hc3Rlci9taXBpLWkzYy1oY2kvaGNpLmgKPiBpbmRleCA4MTkz
MjhhODViODQuLmQwZTdhZDU4YWMxNSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIv
bWlwaS1pM2MtaGNpL2hjaS5oCj4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyL21pcGktaTNjLWhj
aS9oY2kuaAo+IEBAIC0xNDcsNiArMTQ3LDcgQEAgc3RydWN0IGkzY19oY2lfZGV2X2RhdGEgewo+
ICAjZGVmaW5lIEhDSV9RVUlSS19SRVNQX0JVRl9USExECQlCSVQoNCkgIC8qIFNldCByZXNwIGJ1
ZiB0aGxkIHRvIDAgZm9yIEFNRCBwbGF0Zm9ybXMgKi8KPiAgI2RlZmluZSBIQ0lfUVVJUktfUlBN
X0FMTE9XRUQJCUJJVCg1KSAgLyogUnVudGltZSBQTSBhbGxvd2VkICovCj4gICNkZWZpbmUgSENJ
X1FVSVJLX1JQTV9JQklfQUxMT1dFRAlCSVQoNikgIC8qIElCSSBhbmQgSG90LUpvaW4gYWxsb3dl
ZCB3aGlsZSBydW50aW1lIHN1c3BlbmRlZCAqLwo+ICsjZGVmaW5lIEhDSV9RVUlSS19SUE1fUEFS
RU5UX01BTkFHRUQJQklUKDcpICAvKiBSdW50aW1lIFBNIG1hbmFnZWQgYnkgcGFyZW50IGRldmlj
ZSAqLwo+Cj4gIC8qIGdsb2JhbCBmdW5jdGlvbnMgKi8KPiAgdm9pZCBtaXBpX2kzY19oY2lfcmVz
dW1lKHN0cnVjdCBpM2NfaGNpICpoY2kpOwo+IEBAIC0xNTYsNCArMTU3LDkgQEAgdm9pZCBhbWRf
c2V0X29kX3BwX3RpbWluZyhzdHJ1Y3QgaTNjX2hjaSAqaGNpKTsKPiAgdm9pZCBhbWRfc2V0X3Jl
c3BfYnVmX3RobGQoc3RydWN0IGkzY19oY2kgKmhjaSk7Cj4gIHZvaWQgaTNjX2hjaV9zeW5jX2ly
cV9pbmFjdGl2ZShzdHJ1Y3QgaTNjX2hjaSAqaGNpKTsKPgo+ICsjZGVmaW5lIERFRkFVTFRfQVVU
T1NVU1BFTkRfREVMQVlfTVMgMTAwMAo+ICsKPiAraW50IGkzY19oY2lfcnVudGltZV9zdXNwZW5k
KHN0cnVjdCBkZXZpY2UgKmRldik7Cj4gK2ludCBpM2NfaGNpX3J1bnRpbWVfcmVzdW1lKHN0cnVj
dCBkZXZpY2UgKmRldik7Cj4gKwo+ICAjZW5kaWYKPiAtLQo+IDIuNTEuMAo+CgotLSAKbGludXgt
aTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
