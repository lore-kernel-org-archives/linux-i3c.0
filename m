Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55A2606A321
	for <linux-i3c@archiver.kernel.org>; Wed, 25 Nov 2026 04:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ycmv39EI;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=TAACrca5;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=gK8Dd1Hs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=G7+wvWRYht2d4ak64ZbwfFzp2SzXHFJTQ+6gHNDIV8Q=; b=ycmv39EI2NqEZmqpTeGyjREiZv
	yV3OvCkqDGUFbhUVBjo8Vz3kqrbyUosfs0SZZBl1GQZUWozgOZPkM3rM135b7Q5fGM3ELFMbOdb0C
	jZnQt8fwLdcvOuhHcOk9feMA9NvH4n3dQwL9I8Gn2OrfxYoS56J77yqP19/CdM7IRAwqd2/QX/pcl
	BSjE1c4qLDnsbRyJPl9Yu7bcxKOwL7/5xOSOuVH9EXXF+BjSdHxwheYIuPwBHCHdaXQYIrxA0zhCx
	LGTN9ZUccn0c5i7QwYR2l4a/PKkvnlPV1xx3um9ws518fGKSJxegiR6rsfGJ43yneDixrTMYWq/9m
	PStD6gYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW4Rj-00000008NnB-3iqV;
	Wed, 25 Nov 2026 04:17:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW4Ri-00000008Nn0-0yr7
	for linux-i3c@bombadil.infradead.org;
	Wed, 25 Nov 2026 04:17:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=xQJvNsmoeyJEEGHuUnA0U97X7fCCS8ogZORvR0u+Tww=; b=TAACrca567TFf6q498TYp4h2Qn
	Eh/6OWwfdFevY82yBa7m1GkgSEaKk974Mk+NOud2w6nLThecGsi0NbFNaEGy/X0SVGIrjq98X8rp3
	B+H4xv+tmZFIMYkBxDavE8+UPRFMT0/2wjJ74NpiRy1QNiUP8vg6sWXnVo2HFygsCSpL1+SBA8WYQ
	jseyg8vFdOl6dbabCVOfRzzvYl/SRoy15r5pHFNJd4mK+z0WeQB7YwV9sAv1UeSo+13r+EFvc/IoQ
	c3DFFUPdthZkkoWyiNBp338zjO/JMg4SrHIhmD7PSLvrbMmOT/4r9i94eGYoru+pf/jLaeFJ5+0nv
	mlPBuerQ==;
Received: from mail-eastus2azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c110::3] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW4Re-00000004pC4-0x5r
	for linux-i3c@lists.infradead.org;
	Wed, 25 Nov 2026 04:17:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VU8oNL8bDEEu4ydAkisZtGHSEjGFLJZfYbsZvmIgRmHcQoWIp4pmDH06hywqI3M06Yvxl/sHUIPMVcBvdrgsRTBs05EcrhrGihbD2TyVjsQpC/+pdTPScb3EmCZ+vJp4lGp1AsBzVUVqf8Di/qlu8jLI0PcAQcIuooXGHA+SIbVq85uVsTSRNXlm0rZRmoNg6qSYGXloFnkk6GhoyxX8wea2H2EvHbbxGmLnraU9uLluvpFmPWZigr7lPxJdV2jUtA5eEJMrpPmEguvJ5jYivpr7984e2Eaxb9UHSB+QTQwvFSHuG5N/1UO/aIlmc4JKk7homk0ZGTYdW7k9WerMEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xQJvNsmoeyJEEGHuUnA0U97X7fCCS8ogZORvR0u+Tww=;
 b=MR3t23c7sNPxbc8z4iYW4TZDeC/eRUL9SAdolQUjBES47ZVETTkgPH/eTgD+2Vh1JAhWvn8MX+vadVi0XiMxGJH2DtUKPfj9vrTyRJI8DPIqdIWylGIDwKm4wdj6vsJ+JnEoYJiI+WdSQ3msXNfLOsDKsLGfcsabHgJ1Q/WignoyXckO2dQ7zYkX9lhq5+c6qcfyqjvl3smxdqP3wYjix3j6OqpJT4z9+m2H9Gg5arjWMDt+5DCzjrBQyjIBKWzYMmy4LN08xBtYBJM+eBVXhVD8DXeDuWPaZ9ZiTEU+aPuyyW9ciF+xQqE2ELj2VdBrFlaUqrRRPiYE/h0/1tnM6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQJvNsmoeyJEEGHuUnA0U97X7fCCS8ogZORvR0u+Tww=;
 b=gK8Dd1HsSYwlB5SU6MTCl4bycJkjVs83yTC7SJnXchHw9IDn7fDbRheCXoXFL9RL3nZezwsiRxlS7NkPZ4z1UiOzt27Yd3aoOoICSXCaIj37HX69QrkNva9CbDH+oqpXPBrEDjgHQ8C+bcwhSKO1CkIA7c4UG92hwcdkgpev8L8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB6942.namprd12.prod.outlook.com (2603:10b6:a03:449::13)
 by LV2PR12MB5822.namprd12.prod.outlook.com (2603:10b6:408:179::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Wed, 25 Nov
 2026 04:17:11 +0000
Received: from SJ0PR12MB6942.namprd12.prod.outlook.com
 ([fe80::20d8:2aab:1836:8d69]) by SJ0PR12MB6942.namprd12.prod.outlook.com
 ([fe80::20d8:2aab:1836:8d69%4]) with mapi id 15.21.0639.012; Wed, 25 Nov 2026
 04:17:11 +0000
Message-ID: <6cf871c7-d269-42d3-af40-4dc69f4a99ee@amd.com>
Date: Wed, 25 Nov 2026 09:47:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] net: mctp i3c: clamp transfer lengths to the
 controller limits
To: Jeremy Kerr <jk@codeconstruct.com.au>
Cc: Matt Johnston <matt@codeconstruct.com.au>, linux-i3c@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 meaganlloyd@linux.microsoft.com, git@amd.com, Frank Li <Frank.Li@nxp.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Shubham Patil <shubhamsanjay.patil@amd.com>
References: <20261124060651.1987454-1-shubhamsanjay.patil@amd.com>
 <20261124060651.1987454-4-shubhamsanjay.patil@amd.com>
 <554f3a558a73c9984ec7d3395aa53aefc91d8a36.camel@codeconstruct.com.au>
Content-Language: en-US
From: "Patil, Shubham Sanjay" <shubpati@amd.com>
In-Reply-To: <554f3a558a73c9984ec7d3395aa53aefc91d8a36.camel@codeconstruct.com.au>
X-ClientProxiedBy: MA1PR01CA0170.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::20) To SJ0PR12MB6942.namprd12.prod.outlook.com
 (2603:10b6:a03:449::13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB6942:EE_|LV2PR12MB5822:EE_
X-MS-Office365-Filtering-Correlation-Id: aced4034-87e7-4894-3389-08df4aaaf9bf
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|18002099003|4143699003|22082099003|261009223027099003|11063799006|10067099003|56012099006|5023799004|261102123227099003|261028144727099003|261022105027099003|261026121527099003|261026140227099003|261021121427099003|261021123027099003;
X-Microsoft-Antispam-Message-Info: cgt9MNmF8ou1J+EdBvzoAsiBF4bptlMbvZ+yEFDKCdNIgvT7inqVr/mm2GGqzH8rDyoXuOTiIHSy0fmrninIz3eAbCCfWztgWbBbLtmYSLIXBafo+ERfCGtTAr5toeRc2xli7GrkSdwu+044P8n6RukslssSKo2ZWUZLBMtUx1k+iqifE95pziDbVHcfPbzkcnNEWMyh0Oqf5iahFtdMMn354FX4qbtWYiTDW9B3pj64Zrc+ERDvBdCF+/KGXs8mQMO12ytq1C5khu3tejQ+Py2D3msta8EhOP7E6ib7s0yxjZf+3Mg3UtXVYEP1BjvNeKKt4qjaJPPt/udYjms05y558Qmq+v7e9hx4fII+v62tMJ9L/Jy5CwK/a1+URW9bkVJFa7trnFBYHXm4ppmaOdwRCAXY9znCgNtS/LXVFyVldkbHyBGavejepfUaH925lXmvGc7IE/+ikCzyaIvWxaIqEkKUKAa32MdOGwiel9bm6kZHBte7FrdFYE+0Q9NK1RgpK3sirZmUB8gAF2qdUGkCLtSoBOgF7gdCW+zsbXE+zkDDYzXPttnH2xi4J3BA3cZ+0NxzoLoXMMw2s/G9lLQZ9rAqZOjdamAnZPgsqxW849i1NoLXMInlAsZOkJ+1kCH0Q+Hkxy6ohzgS3UTSW4iDyPbgQHjs5Nd9VIKxO2w=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB6942.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(4143699003)(22082099003)(261009223027099003)(11063799006)(10067099003)(56012099006)(5023799004)(261102123227099003)(261028144727099003)(261022105027099003)(261026121527099003)(261026140227099003)(261021121427099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkdnblNjTGZsZzNZVnpacEVqalcrMUFYMGhOc2JXcXVBZUprbmJwR2x4UE9E?=
 =?utf-8?B?azBLVDRYR05pRUVJNXJOTGVyaWo1NXJGeCtYdnRDRFJxN1ZRcThldHcyUkhL?=
 =?utf-8?B?VzE0V1hlTk4zUVg5SGJTQU5CZHpIaDIrSGMxNGxzSHQxdERraUxSNVU0aE8x?=
 =?utf-8?B?YzFmc0drOGRoSmFLVFErVGx2eWxsQTBqWXFXZE1Qelo5YUladmtsMG1MYTlq?=
 =?utf-8?B?ZFY1c2ZtRXozb1ZtKyswa0pPWjdPT010bFJkZC9zNTdZT0lNdXc2RVF3SUhT?=
 =?utf-8?B?bXNEdm10MWlwN0V5dWhyakYwSS9wejdzYmhsTlpjWG1LczduSzUxZStDbEx2?=
 =?utf-8?B?bDdhWHBUSVJKSzZyeHIyZUt4RFR0ZTZDd2NGZGROWEl6c2JmTTQwTVk0bURw?=
 =?utf-8?B?b0V2MWZWN3grUTh4eGJKeEdpMXF1cEJOa1NWVzJqRXBub0lMZjIvZnNPcFFu?=
 =?utf-8?B?K20wOERYWFZrbnVZZlVDR3o3eUlFSDl4SEFTdzNoZ29jaVNZQ0YvdTZNQXkr?=
 =?utf-8?B?RTdKTi9KQ2xlazk1VGpYM0xiYXFmOE5qeTZaWEw5RjFvUjRmTHRlWXFSRXBK?=
 =?utf-8?B?YXUxWW5pSWtjeG1WOGx3cUVoejFDU09NeUt2WmxheFJJS2dkbXBlVWE4R21L?=
 =?utf-8?B?QXdHa0Foajh6ZkFuaHkvdk5oK3JDeE9DTXBJSmlMVyt2V29wNFA1eEx2MTdt?=
 =?utf-8?B?Mkdic3J0MmxQY3BSc1JmZk1TMmVMRldSRk1iVmhoS0J0YUtqQW1Wb01hOEZ6?=
 =?utf-8?B?RGZTdGRucFBEQVNZZS9pNm5yTmtMMElwU0l5TUcxTWp2dUxZWlhFVFAvd2Fr?=
 =?utf-8?B?aTgzQXByWmZ5MytqQ1BHMFBIY0s5b1A3VmlMeDhBTktTYy9MazIzNEVQOWRE?=
 =?utf-8?B?ODRYdGlwdk1QVnVyMEdqSEY2MHRNOVRaV0xFK1FSS3VabmZabjl2VjJ6alRs?=
 =?utf-8?B?WkUwVVJPelN5bkhhaWdPaHJGSXk2YzlKMVlIUDlzdVpLS21MVjdVVEd5UVFE?=
 =?utf-8?B?LzVJS1VGdVNyVU9wZzRXc2RySkxoSXltNS96ZHRRZi9ML2xTTnQwZ096QmlK?=
 =?utf-8?B?NDI1ZGFoN1Evc2xIWXRmZ2lWUGt1R2xVWGNnM2w1eEU3REFmS1kxVkxpelNx?=
 =?utf-8?B?dzU4ZHZRVGVzR3h4Zi9aOThiRTdycU1lYXB2RGF2QVFrMFJGUzROV1FLaXQz?=
 =?utf-8?B?a3JmR2ZKLzhPczhlazJETVBpR05rQllwMko5VzF4VmNwckZvWGJXU2NsSEJI?=
 =?utf-8?B?TnFZZ2JKSzRXeTdNVzE1b0tsQS9FN1c4UjgvWEVjbDdOUkFRUFVmSEZSTk5F?=
 =?utf-8?B?WS9nNkVpSHFTb3dhc3hnWUNJbkVOV2VJdS9qSjBma0ZvbFY1QzBVV2MvdWxo?=
 =?utf-8?B?ZTRwR2szOFlXekE0Q2FOenFFZVdXUVZPME9vUXNxTHRQS0F1MnlUNkJvMmJQ?=
 =?utf-8?B?VUhvZkxvYWNZblg3cm1OR2ltOEJBaXprV3htUGZ6bDRCL0N4ZU5DQ3JpOWJq?=
 =?utf-8?B?clV1VnQvZm5PYWF3OGFabTNNYks5STlrTlhVV0xkSFlwbzZ5WFZGMXU0aW1h?=
 =?utf-8?B?RTQwOWhISEpnM2tON3JIaHcvMVptRGVpeDZvMExKaFFKUjh0ZGpwRnliREl0?=
 =?utf-8?B?NlRrSDJYd1FXdWZSQWN3cFhRVnpQTUVZUXZNTWFCT0o1aDduZFV5RHBGYjU5?=
 =?utf-8?B?T0x1VmhXRWxuVTJhRlFMakxseFo4Ni9LanMvREx3VkhOR2RMSytBZFEzV0Zt?=
 =?utf-8?B?L2xEKzZjaitIdHJ6RGRUcTZrSEtDQVpRZTdOMHpyVG02ZGFhV2NLNXVnazla?=
 =?utf-8?B?WlhMWnZPRUpibjEzVStibUhYY09PZTdKRUFqUUhPTWxobzNCMERkcnVFUzFk?=
 =?utf-8?B?dVE1cG0zejRza00xb0RzUHpJalE4NDErZm5WK25yUENqelozdCtuTUoxTkxm?=
 =?utf-8?B?TmMwZWhYbURKZmZUOW40aFZYcFQ5TkNKVEZZQThVbFE3MTBZR3V6SlJFL3ZT?=
 =?utf-8?B?MSs2QWxNV0NKaFVIWnFHT0l0RERNM0xvRHNIY2ZyUXpwTHdqcWdQWUNIdlVT?=
 =?utf-8?B?SXJqeXhMV0h1VktRRENnZkZjOFVhYVc3d2JsZzI1enRWcE1EN1hXNFZjdE92?=
 =?utf-8?B?SWwvcGp0VlpQRVR0K2hFNDdKdVptellnQ3l2THhWb3BkeGYvT0wvc2o0Wml3?=
 =?utf-8?B?RmVqZ1VNSXl6clpoMG93K1ltMnp6bTdaNGRFN2RzMDZxSXJvZ3hjNVJ6Ry9D?=
 =?utf-8?B?UnduL0hZVDdNWnlBbllSMW0vVUgvQUVRK01Yb1ZPKzRhaW9hMGYrSStoNWhN?=
 =?utf-8?B?YmlhSEltd3VGT1RnZ0tiSlJyNDMyUjNhS1hBM2w5QTJQd2craVdoUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aced4034-87e7-4894-3389-08df4aaaf9bf
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB6942.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 04:17:11.2768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YZqfK/e8BtN2LoeDcVD1AxAYuxD6lDwm6MQQ4esrMu9pprBuKFdGqlI3nYFb8LrWUZy1QlQcY1lT1QFlLtB3cQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5822
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_041722_415865_409EE8D8 
X-CRM114-Status: GOOD (  14.46  )
X-Spam-Score: -0.2 (/)
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jeremy,

On 11/25/2026 6:09 AM, Jeremy Kerr wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> Hi Shubham,
> 
>> mctp_i3c_setup() takes the maximum read and write lengths straight from
>> GETMRL and GETMWL. Those describe the endpoint alone, so on a controller
>> with a smaller limit every read can be built too large and rejected.
>> Transmit packets can similarly reach the controller even when they are
>> larger than its transmit buffer. The receive path also allocates an skb
>> for data the hardware can never deliver.
>>
>> Use i3c_device_get_max_read_xfer_bytes() and
>> i3c_device_get_max_write_xfer_bytes() instead, which return the smaller
>> of the endpoint and controller limits.
>>
>> Behaviour is unchanged when neither reports a limit, as the helpers
>> return 0 exactly as the GETMRL and GETMWL fields do today.
>>
>> Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
> 
> Looks good, thanks!
> 
> For the MCTP side of things:
> 
> Reviewed-by: Jeremy Kerr <jk@codeconstruct.com.au>
> 
> Since this depends on the new i3c helpers, which (I assume) would be
> going through the i3c tree, I assume the whole series should stay
> together?

Yes, MCTP changes will go along with new I3C API's, whole series will 
stay together.


Thanks,
Shubham

> 
> Cheers,
> 
> 
> Jeremy


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
