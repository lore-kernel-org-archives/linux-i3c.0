Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3197CD343F
	for <linux-i3c@archiver.kernel.org>; Fri, 15 May 2026 16:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/p50MT8fOxouWc6Xjn6jJKOLv3R5ZVpMeL0qZAiTUy4=; b=AfqAP426bapH4Y/sSkfaQEMYR3
	mracZLx6udrVXPBWYNaN0rAfPGILdRYqG72oxvMAyWSuyztNx/CL1zgI356/57m72Q2yE3TnmEop0
	7tcEYvZxWiVGyij+pJPY3SrRNSThW5r4bxXScFEyKk/TFSnQk6OGpZKkuSqZ1nzGOLNVM3jQSbbX6
	ig2buDW2N5fQfsLVPWRk7AxuzyKOefYUlpK3sULRi5N2Ezr+NTTLj7bSrhMrPvq12Ey8Qk028nJ8v
	CsRP1giJPjD1XrldXWznBqwv6nncgQHg6rKcfkelHLDt6TqHznwGQmrdYyzl4dwmjxG23VmdVPaMe
	D1Rebp8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNvcU-00000008tmi-3xqH;
	Fri, 15 May 2026 16:42:39 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNvcT-00000008tmH-01Ah
	for linux-i3c@lists.infradead.org;
	Fri, 15 May 2026 16:42:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778863357; x=1810399357;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=FyYvqlzwErlyU/BFat0/yQujY+W8akrohnZEwmicbWk=;
  b=Onm7BLnlCr5xdj3zt7m8YuILYuXBpZefvPpsGcaujEAJR+6atFVc7rMU
   izwScAdyQp354Lcsg6SDcVPq0e1cKLc1WsxhcQtaS9da2aGOWQp+bqFrt
   0u7KjCjldSqaLcZkcllVbILvQaFXDO9WESF8+8xIywdxf3w5GnE9xiJMh
   bOkWiY8dNhvdg0ctWxxM4EjNyQxkGPc6HiHRL5MefqUYLf/q9IsvY7c0E
   NUc35AUjkxm4Fr+zmcu4t2GzLkZMsUCj94nlSz/Y1puErLodh5Hnzh+zB
   K7RkcXZ56tB5xbhpZNniwyPeHYyXudVdax5hPbVta7xP7ok1w01SG+hHU
   Q==;
X-CSE-ConnectionGUID: vq/XKdZ9TviVdW+BENKHMA==
X-CSE-MsgGUID: wLM1WC7QQvGUAloirQoVvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="91207611"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="91207611"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 09:42:37 -0700
X-CSE-ConnectionGUID: ePC5yGz6Ttur94pb/LmGkg==
X-CSE-MsgGUID: lUAIJxo3QwKf7E/kGH+tPg==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 09:42:36 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 15 May 2026 09:42:35 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 15 May 2026 09:42:35 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.49) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 15 May 2026 09:42:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J40TkJ2k9K8H4VYrgBjUSLpLD7EkvwUS4lxiApGTzgdUhGYvdDrC+qKvgl++CDzITs8r1XU+sVzqPbOp2BJSetvArFdwYvOFmTnVdZw8zCVKqqzbCn92/BZxJrhqiKPku1NelKawFYKn3d2vRsKLkfTxn9jKZqu6kuiH0kbBCydmmfz6C3h7ZsLw/rtbfG6bDYldm2Kk7pLySu02x7swcntFZ2RQrZ/QPgobupqPDjD0l8ma5jATatxcI0Tbnou8sXR34h1n7yrAEaLb7sb7ItWLBEaQD8GteaeNYV/n8m9vuC+qJbN5vgFcpBTR66Y1ZgcbA66q1PZazZeBMFNBig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k7gz6756kt851WcbUuRJjbgchrT52LqxjZZ/5wc2tUg=;
 b=clOPmSW7MwHu86oMbVQdvk33TaJpItx9AH6ipEN1eIHSfJi+C+QayJYAXouOACQ67tCkrlRo/B4i9d7SY5LyLwYdsFLusWFRtSrffL+TsMW60i/pHBA5aWSw3oiJpwy5jQGqSFf+K1uVy3Sir91BDk4t6DGSNL3GCbDIrE+di4I/5LWQtsXnxLpb1GzjV/JKMZijkb40LZ4Y35CnYshMsSINN3L+rf/c+Z1geduVEXQ7u+UEUeYm/M2jISESjOSkUPGPUmDWEmspW2t6IHcVVcAE+sUDPZJQjlZOIH1YfmyYjSxCyVRS3nIPhAlHlSb8SjTgvy/cScZzUSB40yZc+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by SA1PR11MB8255.namprd11.prod.outlook.com (2603:10b6:806:252::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Fri, 15 May
 2026 16:42:26 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 16:42:25 +0000
Message-ID: <417993a7-4a4f-4ba5-a815-aab63ed03a3c@intel.com>
Date: Fri, 15 May 2026 19:42:20 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] i3c: master: Defer new-device registration out of DAA
 caller context
To: Frank Li <Frank.li@nxp.com>
CC: <alexandre.belloni@bootlin.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20260512121732.406009-1-adrian.hunter@intel.com>
 <20260512121732.406009-7-adrian.hunter@intel.com>
 <agNXuQDsj_bHSA7s@lizhi-Precision-Tower-5810>
 <01df8e0e-9041-401b-ab73-634701c4acdc@intel.com>
 <agTK5tMCHdLEezCR@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <agTK5tMCHdLEezCR@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: DUZPR01CA0013.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::6) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|SA1PR11MB8255:EE_
X-MS-Office365-Filtering-Correlation-Id: 3da1b883-ddb2-49e2-1835-08deb2a0f1c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099003|11063799003|4143699003;
X-Microsoft-Antispam-Message-Info: ZotQ4iOJO/e0V4QXNhz8KcCOZf+bHrmSyg/Vj4vIY1VUuoHeBnJyf0EBwqVVYewdjn2pgw1+tgJ26/6KmYD4wOep+/GFO/TM6CdMcjCdzRiU2k/ccC4ilPZpo1inVZoCh9Ddd0V6Yq9GAi+WOBmpcHnJ/aMsDdu6zd5+PA0H+v4M0nz4zcJ0w19UMrWkxRMJCBhb93ZtjQJfk9Z1jvg6OaujSoMjW3VlGAElYFDUX0K3TTjrXSeZfTpexNevTaTwdGEkPAsqP0Ndzm8SLopjFkoIErVJYLzeKSagRUihgxWMkyCYtH8KxnKyDTEGa/SD7xNk+N9MH0nBN1I2xIlcGim1G4YlyDy61TZ6fQbKcVDt3PXQC2rYxJrMe4qhHpOeiY06ekDixqQfy73LfK6ziipLmTTxLuKYIB4Kgz3sAwNWSWFv454QKYY/d+6esDcvBSnP5W/W9LSbsGN6JzuSIBYyQc2u/3WYDl88/PDIu1oM3imrbRJEhPfiiu4MHi0jwNfNoiTYdMai1TDeI580Koa7nJ+Bf8ZENfx2ZS3npxrTMU4FrK31jzMa8W5yaCrDSBTxNzn2VANQJdMacVM+Ae9E2t/ajf9MO5kh/oHD/cyqPufVzq2a1ijS/GaNrWyAAz+4m/pOPxEzJrrvlbKSo0d+tmF2mAw+pR9lHJ0zOGt218KgqO3kY/3abLgNBj4O
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003)(11063799003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUVad0JTTDV5dHEzaE04emU0RnhYT2RxRVN0UjhTa2YyTDBjU0JQblFCeTNJ?=
 =?utf-8?B?a1V3dHZnOTI3MG85L1A3S05zNVFSaVJxUExJbnl3dW9OU3E3ZWFDeWIvYmUr?=
 =?utf-8?B?bmVCUUNtNFlGS3pwYlRvSmFETmwvdnJaSGQ2TmlWSzc1cDN6R1M4cEtUclVm?=
 =?utf-8?B?aUFzNFF2dUR3T1NSTXNNQUFuUzdXbm9VNzFoMDlUQWNVNTFHTFV6SmhVM3Fn?=
 =?utf-8?B?YzVKQjZOeklZUGloeFBKV3NrenlJcTlNR2hneVV5dDdhSGJwSkd5WVhCM3l6?=
 =?utf-8?B?Z3B2TWQxOFBpbXFPdGxkOERqMkJWNjJNUVcrOTBReTAveU1DTnhIUXg3aGg2?=
 =?utf-8?B?TGFiRHNCS3NaOExJaTNpRXZoaklBWDU1dDRIRDdmRDZXNmhGaUYvMzExcnZQ?=
 =?utf-8?B?VkxQQllQRzRhY3VKRW9aa2FMZXo1Wjh5bFVVSzh0dWFMZUtYRlozd3h6WGNE?=
 =?utf-8?B?MXpCRjJ4U21mS0R1SE9HS2w2eTNTem1ieVlTMStjVEQwbG1OVjRtS3NjOXor?=
 =?utf-8?B?M0lqNG90M2wzYnJMUE9CeDduTUhZL1kyVzA3dVBVMDd2YmNiY1RGRGgvOVAx?=
 =?utf-8?B?UzRod3dVRTk3aHJjOEhyU0xIMDZLVkxaR2dEc2Yva3JjaUxvSDNXc0dOT1d2?=
 =?utf-8?B?bUxDK1FkSENadnVvMk04dTF2WlE2Z1hCUjc5UitNZ3JhcHNHcTM4RWFlVE1p?=
 =?utf-8?B?WGxTT29lYVc1ZDlyWmJXSHVia1puMnZ3aTJyY3owek91TXlZNzNBcW1RdS9y?=
 =?utf-8?B?cWYvOUpzUzdsZmpIR1hlUVVGcDV4a0tlditFV2FHa2dJU1JHeXJDN3NwT0hC?=
 =?utf-8?B?aTZON3MreWJNNUVLVGdJWDBoOE4weU03MW1ybTNCbXl5enpnaHZqUXZGNE5B?=
 =?utf-8?B?Z1lIKzdQWDBXajJ6NDc1OXpLNy9kbTFib0k0YXpkUDM3U0RZdHJGRFl6NGxV?=
 =?utf-8?B?bEdnNEVFbGo5L2tzUlZJRFpZODRGcEZHT0dCZ2N1QTQ1c3hpWGtNTlhWY2Rz?=
 =?utf-8?B?YzZEQ2FwWWxVZjhnb1pvVnJOZUlDMW13UTI3clh6YW04QndzdU1DSm5aWkQx?=
 =?utf-8?B?WkppcFdUVktOeWFpYkZYWDNkdER5VUhFWlorOS9vSEFHVDMrRE5oR1lxZ0JM?=
 =?utf-8?B?Y3dDQkZ2R3lZN0g5K29aYWROdm9ZT0YxQ044SmNzTzNMeVVxVmtnOUNmWXpK?=
 =?utf-8?B?bGZBcTJDbjlJK1VZN1BQQUwzTkNoNnhCNjVjSWVXbndudEMvRHdMZm1HbUdi?=
 =?utf-8?B?U21ramZ1L0NwdWJyMUs0WFg3Q0xoeVljeFJjVGQ2MVRYcWhpTG50dVJMT0JJ?=
 =?utf-8?B?UnVMNm92N2p3M0M5Q2FoTE1CY0JWdmV1b3BOQ1d6RVhZV2pITnh6RzVySG1D?=
 =?utf-8?B?alo4aGFDUEFTTXJVSTRrUzhJMmdFdkJveS9EVzROWjBYYXRsS0szZEREcHNZ?=
 =?utf-8?B?SVFoRHJsVTFkK0lwYkdNVHpNaGFHSklJL1ZwNjJ3ZS8zemtlR0JLdmRJclhS?=
 =?utf-8?B?Sk1HYVpZVm9yR1VYcXhhMDhrMmFUWHFjU3RoRVk5WHh2ZzI1ZlFLMlJmZUkv?=
 =?utf-8?B?NEVXd0wrcnBwTUNmaTFScDdNRTF1ZEZHTkhQZWgyOEoza1A2eGozVUtTc1dU?=
 =?utf-8?B?TVYrL2lYWkM4ODdYSEVhZWFWMWRuSTFQS00vS01RUXI1K3lWMitiWmEvTFlY?=
 =?utf-8?B?dnc0T1JmRVhBUzNwaEFTWkR4TkZNUHJ1eXlJbWNTL2xZbWxVVGNYbFkyUkIy?=
 =?utf-8?B?dEsxV2syQ092eUtwMm45ZEhCTGlrYVoyWDg0ZmhMYnJLMnl5NGl3YXl3QW9O?=
 =?utf-8?B?MUtTcTNGNm94L1VxYk55U1RYcXZGazhzNW80aTJ2VjhWSkp0QmoxV3lML01p?=
 =?utf-8?B?SytEbmxUTHAyZzVnUlJoc0JobitVMkV0SWZackZDUlU4dE9iZjlwQnNXV21I?=
 =?utf-8?B?Z1g4OVliVFFOVFBWZmhjczV3cDJjSUZEZkdidW1RcUovM2dPYkVRNkpyeUFU?=
 =?utf-8?B?RGQ2d2hLb05EN3lpbTFpZkpoTFpyZEFRQ1gyZmx1UHoxZk9uaWZmcXVrOWRB?=
 =?utf-8?B?Mm4vdWFRbUc4Q1d4cHBwS3Y4RXNBejdxbWhJZ2ZHOC9HaE9DT29STHc5SGdT?=
 =?utf-8?B?ZWlXd0FFUmlDdDRHdER0YXhsTkhRVElzRlVxbW8wdGxNOWF5dzYwZVhoeERN?=
 =?utf-8?B?MFBQMEpncjNUTWsyTTFnM1dzM3VEd2F6UG9uS3FSampmSDJKYjNpaTFCbTlO?=
 =?utf-8?B?ZUhYV01XbWlBbnBPWWNwcFlDZUR5Smw3ZVFwaUg4Y3pwalpYWTVISVB1VFBj?=
 =?utf-8?B?Q2lCaUZCbnl2VHBjWmpmd1Bab1hDZVJvajRoNS8vS1NTcVVydmJaN09ldFFK?=
 =?utf-8?Q?z9pr97Zrw9s1/OCQ=3D?=
X-Exchange-RoutingPolicyChecked: guvsTz1hpm9f4M3kbhGoTSTf784AvH+wa+oMyLI4xMqv0IxRtx4/6XEuV2XkRVt8ijZXLtW0W6XJdmBbaK41qkVoUDyONmkC9xe2DW+LXiYhPTEhPwTZ5YTr8RNIZ2JxYV1IgmaycUTcX3OMKdAHTjqixNH75X5FtVP4hLMfyeo67yL9rU57yxpT8i8sGgbERt9fYohqYv+7noB/92y+EFfPambEDTAMQmzK/OkCTmXhQxIWFVYojZvNUaI27Pg3VmmHDRo9bWy/JqV7Mkz5zrJQnhYMsS7ufw5EyAJ+Twy2h5zeRbrXF5EhqHgG/jzmF0SnX5iLSV+tT8la+bGDuA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3da1b883-ddb2-49e2-1835-08deb2a0f1c6
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 16:42:25.8021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a8ymAbuu77AlXyaFWpYaVd+PUyCe0ea96+1InLYqyTV9AXGyfcTwa+/SkooQMaQNqdJYnrrPifuy+noQ33i0Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8255
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_094237_088875_F5EDC507 
X-CRM114-Status: GOOD (  14.41  )
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

On 13/05/2026 22:03, Frank Li wrote:
> On Wed, May 13, 2026 at 08:45:55AM +0300, Adrian Hunter wrote:
>> On 12/05/2026 19:39, Frank Li wrote:
>>> On Tue, May 12, 2026 at 03:17:30PM +0300, Adrian Hunter wrote:
>>>> Master drivers may invoke i3c_master_do_daa_ext() during resume to
>>>> re-run Dynamic Address Assignment.  As well as assigning addresses to
>>>> any newly arrived devices, this restores the dynamic address of devices
>>>> that lost it across system suspend, so it has to run as part of the
>>>> controller's resume path.
>>>>
>>>> A side effect of i3c_master_do_daa_ext() today is that it also
>>>> registers any newly discovered I3C devices with the driver model
>>>> inline, via i3c_master_register_new_i3c_devs().  Doing that from the
>>>> resume path is problematic: a hot-join-capable device may join the bus
>>>> during this same DAA, and registering it immediately would push driver
>>>> model work (probing, sysfs, etc.) into the controller's resume context,
>>>> where the rest of the system is not yet fully resumed and the
>>>> controller driver is still partway through its own resume sequence.
>>>>
>>>> Decouple discovery from registration: add a reg_work work item to
>>>> struct i3c_master_controller and have i3c_master_do_daa_ext() queue it
>>>> on master->wq (the freezable workqueue) instead of calling
>>>> i3c_master_register_new_i3c_devs() directly.  The worker performs the
>>>> registration only when the controller is not shutting_down, and is
>>>> cancelled alongside hj_work in i3c_master_shutdown().  Because wq is
>>>> freezable, any newly observed devices end up being registered after
>>>> the system has finished resuming.
>>>>
>>>> i3c_master_register() also routes its initial post-bus-init registration
>>>> through reg_work, using flush_work() to keep probe-time behavior
>>>> synchronous.  This keeps a single registration code path and ensures the
>>>> worker is the only writer of desc->dev.
>>>
>>> why not direct use hj_work?
>>
>> i3c_master_register_new_i3c_devs() use of desc->dev is racy, so
>> i3c_master_register_new_i3c_devs() must not be allowed to race
>> with itself.  Having it only ever run via reg_work achieves that.
> 
> Sorry, I have not understand these, Can provide some detail?

From i3c_master_register_new_i3c_devs():

	i3c_bus_for_each_i3cdev(&master->bus, desc) {
		if (desc->dev || !desc->info.dyn_addr || desc == master->this)
			continue;

		desc->dev = kzalloc_obj(*desc->dev);
		...
		ret = device_register(&desc->dev->dev);

This is done under the shared i3c_bus_normaluse_lock(), so there can
be 2 or more instances of i3c_master_register_new_i3c_devs() running
at the same time.  They might all see desc->dev is NULL and then all
of them try to initialize and register a dev for the same I3C device.


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
