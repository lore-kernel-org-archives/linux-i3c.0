Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E3A9D31A0F
	for <linux-i3c@archiver.kernel.org>; Wed, 14 Jan 2026 05:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:CC:
	To:From:Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GbRBxmciJ8Kbv7aWjNCbmRZwPJGcN4V4pBIyo5YWtRQ=; b=paX/3ywR/gOjhK
	VHotcgjVy1dpAonhQ0z6SHDjRk7v7d0iuY5ipfwNCMznxFykJOWgVsX0/eQp7paJt+QNQYMr+lB54
	jZsvrSirbOvIYc+3LyL+o/6C1Pz4UeAtWZFDmM+w/6dhNxbfq9YuE2SQ1sZ232Ll+wfI6bZC3nTIF
	nJvPRGJ79jH2VxqUYANjH0v2WZfb6I9XtpUKpBpFHpOm7A/rr8zpdxXVnYeUeAGBlLVUZrJjU0QVM
	XALYnK2LCALwbtx7bXLkAT2RFZkx8lThZTz86eJZcmQE3y/ze1pJeh8aZUeDIwFpabAbDR8AsuwSe
	fbrj01wgt64dQqbOatZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vftow-000000086E4-0hhw;
	Wed, 14 Jan 2026 05:53:30 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vftot-000000086Da-2PgV
	for linux-i3c@lists.infradead.org;
	Wed, 14 Jan 2026 05:53:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768370008; x=1799906008;
  h=message-id:date:subject:from:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=V//35ufsbzgCnFCUU/rIC4ABrt+dABRgr2TRdx56ES8=;
  b=CAZ7D2jT74o2IEue9y76yDEZglghEtWlpXky4PFhLInQHjP9aQYr6Ysg
   2PwBrpiN3MK4xlJaNLUhgf/f1bzlpa/hNPT4AGviip00f4hsxuVX177va
   FhEF5NoUfLTIR86xBiByIYRDfE+TByb6FQZEolBKTpSfrXtDqo6RvBo39
   KF0P9tgAvwOk/ZnE68YnMuxQWyxcY9AXIG9ePicsUaF/1xUhjqDh4ulpM
   1GXoS+aI09Qo/n4BAQtydJiz9NCYhWce/RufIrtnmEp9+dKS2KQpNydPg
   yyp1+jfv0+UhqIdVmh7WZ0kdVIKKDFlZKKsCtgkZCrwgFB6gtFe7rdT6b
   A==;
X-CSE-ConnectionGUID: j7vnL3wVRKKTv4pUtKtOUQ==
X-CSE-MsgGUID: jt8LWBjTToqjZlo4Q6bRIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="80384281"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="80384281"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 21:53:26 -0800
X-CSE-ConnectionGUID: YSfy+AhsT7m2Hs6U3NdTow==
X-CSE-MsgGUID: sL/0IcYhQUOMzStUVsWg8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="204479356"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 21:53:26 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 21:53:25 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 13 Jan 2026 21:53:25 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.43) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 21:53:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u8k+2QP6TfrMWM/KZsToePLR4pVKg9m1gmrFBhqSze09DjlkGWDa+WjZKvGG+k8jCM5o2pmRhwIESOOcrdU5FbrqhA0WG+T56GtAeMhqyHXhfUcgTholLHO/flGnLgeX1lP7IdPuWegvIndvjd5kUcC1we8G2lVMTUWhVQ0D7OKaBF2oUsgcH0LQ+2vwTct4Dh5UiVUNz+rEtIDGS4g8vwK+ZiMj7aKaVR7NB0VCw1xLrLRvv0fBshvFWEj6pegPeHdMCrj6FPi3W2M5cfva5wdxYdutyf4Rv522zBvJk6Wk4Qx00LYU1e2xyxt2ZRovVakrv0d+HiafXigV3g6waQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rxZin0Kl0flEu8gP0JEEMFBpctS8Gr60XpQUz4Sz3lE=;
 b=sghL9w4LBeDstS9Rj5qwcsqe7OV+2KUQl6hjNN1mQWpzavRTmcAE0CQ2W8qj0tOOC2gKaVcWY0pykrjPkH4s1+k8DW8d5DaLN/59DpsjFwvZthH4yPDAnijKgaCLUDcOXLyplXy4zeB7uRQ180Cglhai2UPDXB5dwtKnOyViGPNZ8lL/IW1NfeYKCOwfhE7Tfmrb5mLA+HK1kOX2liOBOKUMAsrDlJHoLWMjq7R+2vxR6jeRH0toCmgsz6wce3/x4Q66AEOe/P3TBxpdbnQTvzFnQ0EEjy7AYhecYkEcRI14lzWCH26uhWtav4XPkKQIqKZ65CZlNXFL6I4GwSGwcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by PH7PR11MB6451.namprd11.prod.outlook.com (2603:10b6:510:1f4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 05:53:21 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9499.005; Wed, 14 Jan 2026
 05:53:21 +0000
Message-ID: <baa7eb1c-ebe3-4036-9f3f-a1fda77b4090@intel.com>
Date: Wed, 14 Jan 2026 07:53:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 00/11] i3c: mipi-i3c-hci-pci: Define Multi-Bus
 Instances for Intel controllers
From: Adrian Hunter <adrian.hunter@intel.com>
To: <alexandre.belloni@bootlin.com>
CC: <Frank.Li@nxp.com>, <linux-i3c@lists.infradead.org>
References: <20260106164416.67074-1-adrian.hunter@intel.com>
Content-Language: en-US
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20260106164416.67074-1-adrian.hunter@intel.com>
X-ClientProxiedBy: DUZPR01CA0156.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::19) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|PH7PR11MB6451:EE_
X-MS-Office365-Filtering-Correlation-Id: 13a237c1-3ccf-40b2-49ee-08de5331392a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZnlTdW9QbzFpLy9mZkRFREJnaXBRcjRDaVFFK0luVncxMlg1UDUzSUMrZzB1?=
 =?utf-8?B?amVaL3dQZ1VpcEIrRE5CYkl1aVFuWnExQnJmYXEwVnBRNW91MkdseHZRZ1d6?=
 =?utf-8?B?bkFGRUx1S3ZRbDRaejU4OG1oa2R5S2VhVjRxa2tCelM1dC9YNDJFOXVuYSt5?=
 =?utf-8?B?cTg1L1JybXREeTBxMWV1ZHBDSiswU1pHMkd0TFNsT1ZyOWVJcC9mYitSRk0v?=
 =?utf-8?B?aFo5bDlkM0E0R1pnZlFsSmplQVN5ZlF1ZnQ4bmRoY21LemdqMk02dzA5V2pu?=
 =?utf-8?B?NExCMU45T080ZVVwQ0NCV0JLbVJZOCs4RVNrcDVXZTJnemlla3czUm9HcWxV?=
 =?utf-8?B?SGY0eEY3SlNVV3RtbnhUSCtKM2I3Q3I2R3JxSDJpbXVZNDRZcXRiNDVTSkZ5?=
 =?utf-8?B?ak1IcHF1eEtJeU1qbmtDY21acDgvSm5XaU9PS3Q0U1RqNzk2M2JtaVhXcnlu?=
 =?utf-8?B?a05tM1h1akJvZ3FFRm1PeTZGWWkwRUYyUisrd3V2MHRNWWx3MG5yS29UWVdY?=
 =?utf-8?B?WWdJSGx4eEdkdktEZ3I1YWIzQ2pvZzVISnJMTFREMFlkZXgzSlpMaXZpSmZx?=
 =?utf-8?B?LzMxWFlIWFRLcU4yU3BWOUtSbkhDMUNPenNIQ292dXhrNzFIZzVNODJBQW5r?=
 =?utf-8?B?RnhwcXBNcW9yTUdONjUxVFR2Rm1zb1hlUzl6WkFGZGFtVWNmblFQTEoyZDlW?=
 =?utf-8?B?TnFvRFhueWZVUGwzeUs4c2FjN2JFOGVUdnRrU3R3TVgwenU2cXYvUWxxN01F?=
 =?utf-8?B?WENYcmJsUjBrb241NHNmcmJpZGZ1R213eGFkK09FOHlCbmdhQ2lMa0RLOWp4?=
 =?utf-8?B?TDV0MlVOV1JtbkVmdTZLNFpzMkNISHkvd0JkSzdPVWUyaC9namVoUFVNdHNR?=
 =?utf-8?B?cDNQVU8vUElQZXJwcUF1WmE3b09wME9KQXdHeDZjWW80RUFocm8xUE81cmtN?=
 =?utf-8?B?REhPcHZwdzBOT08ydnJPWDVKUWE2S05LeUlRQXNPREdRaHZleGE4Y0xaSlBh?=
 =?utf-8?B?VU9zaC9Ga2t2MFMyQzlJdnJyRWJCbzdDNkpYcS9IVXRuWXlzNEJlbnVPeXRk?=
 =?utf-8?B?RmoxNlh1dWR0Wk1FbUozVHRWRHltTVlSSTdxMXFmNi9EMmk4RHhsVGplY0xF?=
 =?utf-8?B?clZoaWQ0a1FVdmlmSW9DaHhwL1kwNVRTbkVwamk3TkM0R0xLMVQ0WG9nSnJ5?=
 =?utf-8?B?ZWFNenUrVVBEc2VqWFJ6SGN5THkwWi84dnIzd3pWT2RiZzg5ZUtDYzhYd05q?=
 =?utf-8?B?RDQzTHdTc25yTU03blVLdEhqTWo1N1o3aSs2blNQbCtIbkJ3d1NrOGI5SE5q?=
 =?utf-8?B?akZJMFVVbFE1eTJVQ2Z0aXNGMmIxM2dHQTNMR3JlOGkxaFQzSWlMem50M2dv?=
 =?utf-8?B?MWhtSDc3VTFYQnN3WDQvZG5oaFhTSXBjVVI5Q1MyM3VTK1B2MUN5eWc2UHNr?=
 =?utf-8?B?cnJmM1JXcmFQY2Y1R2ZjRUlMVHNucjQ4WHZEMHUrVU1GNzRxMVhESzEvcVBp?=
 =?utf-8?B?V2ROeEpPcEhLRVFUekZzRVBseVJIcURZeUg4d21CUEZER3dGM0RubGszTm4r?=
 =?utf-8?B?M2kxZE1hYitBdFdadW1CYlFFU1NNL1daVzRoTStqdDRCeURRZHVxaXpDVW5i?=
 =?utf-8?B?WkVxTm9IR1laWHNLMHVhSldKYVErQzROT0JVNHkxbmQ2QmNoenhDaE94ZXlF?=
 =?utf-8?B?WURjT253Qy9LblRLRlc5S2dtWVI5eGdpRk9KY2E3LzlNMHdoV2g3alVRU2Zq?=
 =?utf-8?B?czlZdWpiWk1kNnpnbGE4WVNtWm9rdkZBWkV6a2QxUlFPSVVITzhxVldTY0w1?=
 =?utf-8?B?dXpaVmNyUGRaVk4raWZ1VllKc3c4ZDNONHMxdk0xYzg1U0dZNUNWb25PZWdx?=
 =?utf-8?B?VFk4V29zZGZVaDNQcWEvemVOUW9Vd3RLR3lRcWtQSWVsZEhVdUtnZjIwZnds?=
 =?utf-8?Q?ZiQA/miUNsmjCPf6WMn3HaxzBBTTwszu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFJ1K2t2Tm5neEgzN0x4anJOZmRYbXdZSkFQNDJZTCsvNXpmQ2pOWFNuLzZS?=
 =?utf-8?B?QVRnYjZuVmx6dzBMcDRkRnAxajF4ZmJuLzY4bStnYVBQQ1BoR1paeTYrMSta?=
 =?utf-8?B?L0RxQy9oa2FLbmZBQkpHNzVtV1FLWUJzWHJ6R3FJYlJWRnZHdTdrU1VRNHZN?=
 =?utf-8?B?THhvREUvejg1eUo4RmFReXNzU0Vrb1RrWHVCZ3h4bWQ5b0ZJMlpWVXF6RVBP?=
 =?utf-8?B?elVuQjVSVFR1YXlacEtjUnY0WTEzYmlQRS84Y2dIS3VZR2h5OE5KZFlnMnY5?=
 =?utf-8?B?Yk9XTERkLzJ5QzA2TWRUM0d5NnhOeWVOZldYdHFzRlpYR0paeXA3dHc4ZWd6?=
 =?utf-8?B?a2RQVnNJMlNhT2poQmVjMG02Y2dXZkRWeGhKUHpVVmphaTM3SG1GMEtBOGlK?=
 =?utf-8?B?NTRFVXk5TXMzVGNvUDN0eDQvblFTTEJ5Y2dTTmlIYWYyM1IyT296a0tOSzg1?=
 =?utf-8?B?RWRzTEVzU2tRNUdkcFhhUFo3bWFIalBDdU0rYm96RWxBNmlvdGFFSWJ5T0Jv?=
 =?utf-8?B?UXNrcW1ZTVJGRzl5anZEditEa1hWcVRIMW8rU3UzWFg5ZEdHK0NKMDNianZC?=
 =?utf-8?B?QmxsNTNDWVE1cXFubEhPZUtUdk5BKzVpenZUN3NNMnRocDhYTUJjWFhrbUpV?=
 =?utf-8?B?ZGptWGJkL0NpdkR5L01iMDFjR2FkcVNZODI2WHA2b3BFY3paK0dXUkZGOTNi?=
 =?utf-8?B?VW1LQnhZTmVsZ0FIbmJQOHlaVitFMnJoYUpmNUhQeGFBdnk5VFhvR1o2VU1j?=
 =?utf-8?B?U3VJWWs1eWZabUE4Nm1FaU1OakIxYXFleWdQbTNZc2VDd3pVTWdISmtzT1hP?=
 =?utf-8?B?VmJ4dVh1Mm1IOWVtdDlyRGQ5cGtHdGdjSWk5OXc5Y0kza1dJYVpiQzdQUWZq?=
 =?utf-8?B?bTFaYzhxQTlhUWVYMW9DY0RLbnBDejBVNWxBbFBaenRXc1daTnhYYVBaa1B4?=
 =?utf-8?B?WkVVS0RvemhuOVU4T0dzOVZHRW80eXZjbHdZeW0yL2RPQXFCNGR5dkt1d2Ns?=
 =?utf-8?B?WXpIMUZkbXJiZ09hY3FOSFRIRFJhVG1LMjh4bTgwN29jQ3VPbXdneXhkZzBH?=
 =?utf-8?B?OVNDV01yb2FJR0d0bGxIZ0lPb3N6MXZ1U3Bzdm9TUStkUlZ5WEwxQmhTQW9z?=
 =?utf-8?B?Z2xJKzU3OGN0Vms0OWZPeFpBdVJZeGFxZHM0SWJCL0ZmUTNWWWM4NmZySHhI?=
 =?utf-8?B?NzMzWDlIcC9jeWdpVUJwSlVhVHB3SXJSMXBTM1RSL1BncmhWdGEyMGpId3gr?=
 =?utf-8?B?Rmc4TDVaQm5FdkZucUpPSTdJSlhscHBpeXVTbDY4T1NBNnR5bkFvWUt2aHl0?=
 =?utf-8?B?a3g2TFU0TGtBcG1aWEhlRVVtQnhHQW11cjMxVGgxcnhNUkxFd1dWNW5KRkQv?=
 =?utf-8?B?aVNEL2psSlhGVnZXUWpoNHNPejB5U2ZwVUtydUlxYU55aHhiZEx2RHM3SGdo?=
 =?utf-8?B?OWdESHZmYnNub3BQVC95VkRINDd2WXZGV0JyM2xPNER0QVN0SUNyQVpQSkZL?=
 =?utf-8?B?dERZTXMzZGxUaE5RSmo3VUx4dVBJdzFNRUJnZ05zcFVlaDM0U1djclZ6M1hI?=
 =?utf-8?B?OTlFVEkvNnhVVjh2UGY0cEtIME9LZG52QUJrOFRTVGRSN3piclpYdmh1dDE3?=
 =?utf-8?B?ZnRubm5MWVAzdjB6eGZmZFh6ZVRnUnh3bUQybTVURG13VzY4bnFVaEY2UGRI?=
 =?utf-8?B?bEtNVHg0UWpmNDRtWThqNDNCdk1IL2h1L0JSUmtVazBRZGZkMDBvay9Cdklj?=
 =?utf-8?B?bkZadlMxb1FTcWJldEZ4UGc5TVdySExMM3pRS3hyQWxFTnpKc3dWTWk1aXFp?=
 =?utf-8?B?c3NRUWM4cktCYUpEd1E2RThHSURDbmFsZnRyQmd2V0YwYzY5VUJISU9CQXVl?=
 =?utf-8?B?MmVGSmhNOGM1MjFxTWxhMkkvRUF5b0NoOElUUHpkSWZZUjZORklDN0FDcGZJ?=
 =?utf-8?B?alNmUGhhTzFBalJhRGN3elZ6VGZaNnhjTnlWb3NpZjNtRnRKODVob0txaTNE?=
 =?utf-8?B?eXJaR3NaOFJ1dzRCdTJ3S3NpWUZtUGdQYjV3SWJyTjVFNWJoUVNSaUpVSjk4?=
 =?utf-8?B?cnh3YzB4K202MnBvbytqVnJUbTJrS3c1V0RkOVFRZmpVZDAvQ09XeWJLclpq?=
 =?utf-8?B?Znhqb3dqVy9hMjArMTQ5aWo0bWV5cjJ5YUtIRWtrVWJEamFXWUVyYmtQR0tK?=
 =?utf-8?B?aUdMbzBvZGVJTE1ZZGs2SmtmNktUOXlrRmxWd2FxUHFzcHFaTHdpTjFoekRu?=
 =?utf-8?B?NXQvcDBuNVpNLzVvREhwdWxnWnpFU1YvbXNqbFhkTTFNRk5uaXZjSFZCL3Qy?=
 =?utf-8?B?OTZ3MmNsVHgwSklHcHBZblpYQlhaQ2N1L01qNUNGYWl4TXVkWnY5Zz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 13a237c1-3ccf-40b2-49ee-08de5331392a
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 05:53:21.3029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mTbPf+FHvv6s4sueBF6FmfUwxBIfzS6/biX10FIZcZXfGaO/na3i1T2puqSc5uKHy6kaScjBynPyqcDgaL8tTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6451
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_215327_648024_6B1F435E 
X-CRM114-Status: GOOD (  18.59  )
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

On 06/01/2026 18:44, Adrian Hunter wrote:
> Hi
> 
> All patches now have Frank's Rev'd-by

Can these be applied?

> 
> 
> Changes in V4:
> 	Add Frank's Rev'd-by for patches 5 - 8, 10 - 11
> 
> 
> Changes in V3:
> 
>   A notable change in V3 is the introduction of patch 6 "Assign unique
>   device names and IDs for Intel LPSS I3C" which does away with dynamic
>   devid allocaion.
> 
>     i3c: mipi-i3c-hci: Quieten initialization messages
> 	Minor white space tweaks to fix alignment
> 
>     i3c: mipi-i3c-hci-pci: Enable MSI support
> 	Enhance commit message
> 
>     i3c: mipi-i3c-hci-pci: Assign unique device names and IDs for Intel LPSS I3C
> 	New patch
> 
>     i3c: mipi-i3c-hci: Allow for Multi-Bus Instances
> 	Enhance commit message
> 
>     i3c: mipi-i3c-hci-pci: Pass base regs as platform data to i3c core device
> 	Enhance commit message
> 
>     i3c: mipi-i3c-hci-pci: Convert to MFD driver
> 	Add Frank's Rev'd-by
> 	Adjust for doing away with dynamic devid allocation
> 
>     i3c: mipi-i3c-hci-pci: Add support for Multi-Bus Instances
> 	Make hci a parameter of mipi_i3c_hci_pci_alloc()
> 	Adjust for doing away with dynamic devid allocation
> 	Enhance commit message
> 
>     i3c: mipi-i3c-hci-pci: Define Multi-Bus instances for supported controllers
> 	Adjust for doing away with dynamic devid allocation
> 
> 
> Changes in V2:
> 	Add Frank's Rev'd-by for patches 1 - 3
> 	Drop default driver data
> 	New patches split from "i3c: mipi-i3c-hci-pci: Add support for
> 	Multi-Bus Instances"
> 	Conversion to MFD split into separate patch
> 	Simplify ID allocation / free
> 	Correct use of __free()
> 	Also define instance 0 in driver_data
> 
> 
> Add support for MIPI I3C Host Controllers with the Multi-Bus Instance
> capability.  These controllers can host multiple I3C buses (up to 15)
> within a single hardware function (e.g., PCIe B/D/F), providing one
> indepedent HCI register set and corresponding I3C bus controller logic
> per bus.
> 
> Add support for that to mipi-i3c-hci-pci and mipi-i3c-hci and define
> Multi-Bus Instances for Intel controllers.
> 
> There are also some tidy-up patches to start with.
> 
> 
> Adrian Hunter (11):
>       i3c: mipi-i3c-hci: Remove duplicate blank lines
>       i3c: mipi-i3c-hci: Stop reading Extended Capabilities if capability ID is 0
>       i3c: mipi-i3c-hci: Quieten initialization messages
>       i3c: mipi-i3c-hci-pci: Do not repeatedly check for NULL driver_data
>       i3c: mipi-i3c-hci-pci: Enable MSI support
>       i3c: mipi-i3c-hci-pci: Assign unique device names and IDs for Intel LPSS I3C
>       i3c: mipi-i3c-hci: Allow for Multi-Bus Instances
>       i3c: mipi-i3c-hci-pci: Pass base regs as platform data to i3c core device
>       i3c: mipi-i3c-hci-pci: Convert to MFD driver
>       i3c: mipi-i3c-hci-pci: Add support for Multi-Bus Instances
>       i3c: mipi-i3c-hci-pci: Define Multi-Bus instances for supported controllers
> 
>  drivers/i3c/master/Kconfig                         |   1 +
>  drivers/i3c/master/mipi-i3c-hci/cmd_v1.c           |   2 -
>  drivers/i3c/master/mipi-i3c-hci/cmd_v2.c           |   2 -
>  drivers/i3c/master/mipi-i3c-hci/core.c             |  48 +++++--
>  drivers/i3c/master/mipi-i3c-hci/dat_v1.c           |   1 -
>  drivers/i3c/master/mipi-i3c-hci/dma.c              |   6 +-
>  drivers/i3c/master/mipi-i3c-hci/ext_caps.c         |  58 ++++----
>  drivers/i3c/master/mipi-i3c-hci/ext_caps.h         |   1 -
>  drivers/i3c/master/mipi-i3c-hci/hci.h              |   5 -
>  drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 160 +++++++++++++--------
>  drivers/i3c/master/mipi-i3c-hci/pio.c              |  17 ++-
>  include/linux/platform_data/mipi-i3c-hci.h         |  15 ++
>  12 files changed, 185 insertions(+), 131 deletions(-)
>  create mode 100644 include/linux/platform_data/mipi-i3c-hci.h
> 
> 
> Regards
> Adrian


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
