Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E74103E2E8
	for <linux-i3c@archiver.kernel.org>; Wed, 11 Mar 2026 22:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lxx51hne00Ff6Rc9S7dCmbJCy/0L31EawpAAPWsRkvI=; b=ucJz+cOG1P3ACm2jszjyQ/L3Sm
	y8HcGZqoIk7puB6cDr+7JUu1B5+NAg5+ggLk2GbGlosd9gBTW5s6F86SNxj0IDm17+4MlRs8y+mgD
	0GFKfzPnUdR2EX1uH1jhuQXn2aSP8G9pDd2JOI+6yU/3wqI2oki+ZktPA56se7S3URHkV5t6optng
	JbriFUxwp8KuK4phPHb7Ce8qb8JdlEnGuYpz2/NawRdu0mWSKNuY/KWJ2taOwqZ9KXO7/yRwIJ4GJ
	PXALdVHDwCtE2MoeyxnSJOKuv31Jp45DtRPoy5UPgufyE3v0BX5QC84CTXGSHsPuL45TxcjQ7a+7l
	ypv3hc6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Rct-0000000Cbby-2cSZ;
	Wed, 11 Mar 2026 22:01:59 +0000
Received: from mail-westeuropeazon11011022.outbound.protection.outlook.com ([52.101.70.22] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjBDl-00000008L8K-42Zp
	for linux-i3c@lists.infradead.org;
	Fri, 23 Jan 2026 07:04:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oVMTPn87DSZDisKXiDFG5HGMM8qOoeGF8/miKbOtVEJbkPiocu0pCgKWvjKVYsHRDhlpLQOzWWFj3G93bkoT4m1X1ccyAsVBPd3McFiyzRUUqw5ijI1SXtN8XWiCDNNqPB84aoajRgGqcYOsrL+aah9m76z19+jJw/P7cdrU54KWeQHyj2bH7oHh7hfmcv2cgOpSkFbvNCgQvkos5jreoFQIXdeDm2qHGmLmo0+LM6nrDlVBsGKszu7/YHakMCuPfi+LhqYSJ/N3/Tfhd+vd11aoqzIy+hG2hNHfqz1OcFkAOcWGwnVztECfmv4t4xJBwuuuG7vC9S6DqFqKxogpnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pIhSLVdwPaXMlnXMN2XOs0X5ppqQ3IlWANP3NH2RXcw=;
 b=RC4sSchR4gAvdbFsAp8sVH37iRpoeL12GO/tOuo02wujIZAXsvo6hv8CvjfqKbDt+djMCG3pnr6BScv9mwTl18CR1yHEPQ+z787uLORkIyJaf54NVm2DLi2VLIQ1GQzXQbGz39PaocitwHYFxZiopvGegfxbCA54ZhGpOh5qpmHqVDgu2+/D5Kg3SnOt/YQdZLEeKAIzLAjExeDb4SA7STrUdHQxWD+QuuT5cQoPWo8s2Ym2rBX+aWOQpuXXpZO/cJK69v/B+F3FvR9b0Kbf43Q2Z1kkQPqaaRtpXAneGlpjTnXPQiL4eXBHn3fbozAUQtPcxepcy0L00BmhZXKAyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pIhSLVdwPaXMlnXMN2XOs0X5ppqQ3IlWANP3NH2RXcw=;
 b=bRSe9GEPXsXE7KxQ9kSTt8MPBJi4JrtgHtiXZXV7T2H28etIcSWSmgq5vH68Jhxxhr0/Lx+yMOVWBgH7x0gPj3F0G7wkiVUz8thY5IiY/BWMdMw3opmjo7L2XFuMvHce/bXAn70QMNiID/oBkhcAjzwyu2HuaP/QN5JL4oMlOZtpW79eodSuzj6EPrvAUcOldiDo2rRrxRfgxmFJ3qa/Aok+Xpi189IE68TItQPXTgGmFDsLOdypyyBYiBGP2Ot0DrV30uj8iPT1UXd7kG4ICLzGv45B1gtAhmHY07hJujqRV69uiIiqsyrkl6N8bEJzxC3Rv3pUIXoHs76fSS81Zg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from BESP189MB3241.EURP189.PROD.OUTLOOK.COM (2603:10a6:b10:f3::19)
 by VI0P189MB3494.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2d2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 07:04:36 +0000
Received: from BESP189MB3241.EURP189.PROD.OUTLOOK.COM
 ([fe80::49f:4bc1:672f:45c8]) by BESP189MB3241.EURP189.PROD.OUTLOOK.COM
 ([fe80::49f:4bc1:672f:45c8%4]) with mapi id 15.20.9542.008; Fri, 23 Jan 2026
 07:04:36 +0000
Date: Fri, 23 Jan 2026 08:04:31 +0100 (CET)
From: =?ISO-8859-15?Q?David_Nystr=F6m?= <david.nystrom@est.tech>
To: Joshua Yeong <joshua.yeong@starfivetech.com>
cc: =?ISO-8859-15?Q?David_Nystr=F6m?= <david.nystrom@est.tech>, 
    Alexandre Belloni <alexandre.belloni@bootlin.com>, 
    Frank Li <Frank.Li@nxp.com>, 
    "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>, 
    "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] i3c: master: Add sysfs option to rescan bus.
In-Reply-To: <SH0PR01MB0841E47B510DB5EFB48B3460F9972@SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn>
Message-ID: <cae9ba4e-acb1-099d-0d03-329ddad8057f@est.tech>
References: <20260122-i3c_rescan-v2-1-84c74a483f03@est.tech> <SH0PR01MB0841E47B510DB5EFB48B3460F9972@SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn>
Content-Type: multipart/mixed; boundary=832332918645963717691518711255250
X-ClientProxiedBy: GV3P280CA0083.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:a::11) To BESP189MB3241.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:b10:f3::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BESP189MB3241:EE_|VI0P189MB3494:EE_
X-MS-Office365-Filtering-Correlation-Id: a3c57914-b79c-4b15-76c3-08de5a4dab03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ME9iL3pLT3J5RHdjRmFRUFd1YUpvZXFrZTdTdElZTGtoMDRFQnNhdHdrZVJN?=
 =?utf-8?B?YTVuc2t6cGl0QkpIVDR4Tlc4Y1JjZ3RaNjlreStVVXpXdHZoUkdLNlF0QkFL?=
 =?utf-8?B?bGdzVGVUQXBsSzZTMWlVckU4NlNiM2kydEFmeUs0ZWNtKzVMWHlrb05PbFJz?=
 =?utf-8?B?bXpCK0NtRmdrRTZHSDkvYUFoZDNlRUdWem1DclNIZ3E3U2tvUGxlcmRHUGkw?=
 =?utf-8?B?bXZYTzB3ekZvenY0WFNDU0VWZTlrMkZCdjBsN2RZUXBHOUp6WVJzV0lnWFhR?=
 =?utf-8?B?ZjZmV0VFQXhOZUtXTHU0ek1sbGVBdTNhYVl2TVYxUzRPK3doazN0M3g3QXlv?=
 =?utf-8?B?RGNnZGV0dWR0YWlJd3ZReExoTnNBL2RnazdJdEROZFViUytuVjJVMUxxd0NE?=
 =?utf-8?B?czJUbFV1TVBuOTlEOXJzRHU0dzA2NVUzNlRnVzBHWm1zRmZQQklNWDkzTERJ?=
 =?utf-8?B?NktwT3YxN0dCa083b29TeHZyV2k5QkZBMmRabHRXOXU1b2dDTm0rNzNVSWRs?=
 =?utf-8?B?RklDRzR0NEhaOG4wRVRwWHJPY3MyQ1N5OHI1aTQvcjc3S1IrWnNUN1hoNFY1?=
 =?utf-8?B?TURyUDlTMzE0OWwrRlkxd29jcE9pQ0xhR3RoZWNaaWtUeVRuRDh5eWkrTDNk?=
 =?utf-8?B?cnN4ZGJibVR1dkxaRWIvY09IbTV1R3BvajFWTmhFSFVDNVJiUENadXRKYTNF?=
 =?utf-8?B?Q3MrdFRnZ1h3R3RwRkxSS1h4ZFNRSHR2Tjl1eVBpS1hPTm5uK0RPdExkUDRP?=
 =?utf-8?B?bElET0NWWGxkb2RWdlJJcTFEcXNrRmFaMjFVNVhqb3VKM3FWekROWTBua2VR?=
 =?utf-8?B?MG5vNEgyYWJUN2FxQ0txaGFFd2J2L2lPaHVqZUVlNTdEQWxwS3FLRktDNWFN?=
 =?utf-8?B?b3p3Qk55bWk2S08rUklzakpXcmI1WjdmOFl0NGZzamVVTVRPcU5DMytNeFNs?=
 =?utf-8?B?aTJNSnhrKytkNGxuOFhjM2VDSXFnZ3NOZnczMkJYdDRKRHNhODVsNDZqZml3?=
 =?utf-8?B?cERxM1dMeUtNNkdvRE5yWFZQdlRFR1VUWVNDNkxJdThYRlZTWUc5cVhmZHhT?=
 =?utf-8?B?R2ZUSWFLNTE0Vm9aemt1UVZkbm84ODB5Q096NUQ0UDZVNGVOTjFiWTRHUHky?=
 =?utf-8?B?ajA4VVprNkZWeUtXVTZFSHRUNUQ3VWJsWmt3Ukk3cWdRSkJ4eFhBdXhqWTU2?=
 =?utf-8?B?NEpHK090b01yWjlEVU5BQUNNeGNTVncvVUd1ckVpOHE0TUVocjl2N3VNNVFB?=
 =?utf-8?B?SUtpaklORmZGamZSUlFiS1RkUTlYU09JQUtRNlFXV08wYVVTUGRQRkNZV1Np?=
 =?utf-8?B?dzgwRW5TN3JiZHNQTGZJWkxVcG5MMzF1QStWYmNCUDN2MFlJc2lPK3EzajBN?=
 =?utf-8?B?ZG1xK2FiRFMvVFpEdXR2NjFEeVJXWUZSTFRmVFhQSGlpaENIb25Ub3hzSkZX?=
 =?utf-8?B?SUR1UUhFb0pHWWNsbUg1WkNmNG1tbTZPTGl5SFRYWlV4YnphSmFPM1lHZmF6?=
 =?utf-8?B?eGUwdnNENGtOeTh2SGV3NmQvV0xuM1pKbFZMbjFiazBKMlEveDlvVlFBYjRH?=
 =?utf-8?B?Q1Z5KzViaDZSaWxlSjRSSUtlcldybTd3N21tc3ozOGtLYlN4amExK1VIWlZE?=
 =?utf-8?B?Ty9YOHpPa0ZVbG14U3MzRHhQNzZWMC9US3g0TUVSNVBYWEkvRmQ5OW1yUERQ?=
 =?utf-8?B?YkVtbUxVZDBuQWlNcXQyODVDQndxZk1EVWRJaWVJdVNhcjZCZ0tOSW11bjY5?=
 =?utf-8?B?QUxMakI5TmxyQXdweUphc285Q2dhUGQ4a3BCcWdiRXZMdFRaRk52MElYWUIw?=
 =?utf-8?B?dTQ2SDh2akErWFRlay9YNHo2blkvRnh6UHJBTkVsekxKTEppUTM1MVgzbW12?=
 =?utf-8?B?Q3EwRTcwZ3oxSXpIV2prMlAzbWxlOTl5WUtZclhzbkdqOFB3WjdjaFZ2RGVV?=
 =?utf-8?B?OVFMNEtqQmNWRjIvTlJCN3FreW1nbll2RGlWbjAzS1lEZWFMUC9JQUVSZzZT?=
 =?utf-8?B?blg0Z3NLdzczcC9hRXQxR2xEVXIybUJKVUVvY1ZUTy9TSHNaWFhpdmd3Y1Qx?=
 =?utf-8?Q?ln15fr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BESP189MB3241.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3U3MmEzdm1tSG02WTR3Y2RLU2RjR1RyazAxdFNteHM5cUxLaC82bi9SS2s5?=
 =?utf-8?B?TDdWSEZHTGtza3JNM0hlbW9sNzJ1TVhxVnhrMy9EV2N2VHZVTDJYUVcrMXIx?=
 =?utf-8?B?bWtndjAySmFvQUhGcWlnK3B3WUs5ZmZVRUJ4RnBrVDNWTlpWaExLOW4yMlhQ?=
 =?utf-8?B?NDQyUGswZ3F0ZWx3NWo3VC9PSyttOVlJazd2aWd1dnpBSzF5SE9JdTNzRzJY?=
 =?utf-8?B?Y0VWRnVOelVMUVV2ZGx6VEJKN1A3OW90a1M3ak0waUUyK0I0NzFQeDlyaWdr?=
 =?utf-8?B?cm9DNElPNStrSS93cEhGYVVsc3c4R2JIMjh3TmUwMXdRcGgwU21wMnJodlQ4?=
 =?utf-8?B?aXNqRDdGSWpFWm5XWWhVWm5KUWN0ejRrMWJGalFTSDNLc1ZDdVd0cVcweHQr?=
 =?utf-8?B?a1lTK2JIU2JXaVRuRWI0K0RPRVhWNE55YytEOUpGS0VBNUpjdU5KWnNpSjZL?=
 =?utf-8?B?UUhTSDJMbFJtbDRQYTMzOUZyeWloeWZWYWZSWXZiYnRWMTVKRlg0UE93Mmdr?=
 =?utf-8?B?VDc0d29HZWdTN2g1bkw0QmFoV2g0UWRTTk95TlphNWZjK2tQajVneFY1U2Fy?=
 =?utf-8?B?ZXdVb0pYcTFGeFJPWkx3MHg2d3B2ZTJ6NVNYUjhpSC9PcHRobGJuS054ODZy?=
 =?utf-8?B?Q01MNUhDcnRaVFo2MCs1bk9HdGkzcnlEcElDVC95Ym5CRjIwMDRsWlJ0aFFi?=
 =?utf-8?B?Q25KcWNYakhkK1A1OWJaTUhQWnJodUZGSXNTb3BQa3JXeGVmVVNwbE9YN1Va?=
 =?utf-8?B?ZXNVUXpTTHA4VytvRGtjWmhCTG50blhRaEROT0JGc1BWdG42QzVPWTNBMnY1?=
 =?utf-8?B?blBLMCtJeHl1ZER4VzJCcVEyR3NZQkFJYzNYUTRZalVVblJYRU85TEdqTHVk?=
 =?utf-8?B?R3poWWlnUThpbkg2dzhuQjc1ZUN3SGgvdlBhUzdQY1duVlB3OGJqcWdqYTJ0?=
 =?utf-8?B?bzUvMmxJUTY2bktscm1xS1oxRldmWVNnNVpqUWJmcm1JNzE3SUIwa2ZyTExz?=
 =?utf-8?B?NUJORVdRbFNkRERsZHJDTUZRRVRENGFNbW02b2tPMWloZ0VYaU5lSGM1b0JJ?=
 =?utf-8?B?N0dTQ1BHZTE3Q2JWdkJJRTh2QUJqOEpTZ0E4OHhUV0xHUndqMGZxZXdQbkFm?=
 =?utf-8?B?OVNPYzdwcGwzSzZQOWg3L2NSSkVsZktmTlhtYjhXaWNQa1d3bWdqeDl4eXBY?=
 =?utf-8?B?Qkt1VHNURGN0RHc3SFVYcFZOTng4VkNnQmtZd1lkbGtFZlVZR25PamZJZXpG?=
 =?utf-8?B?RzluWFd3L2NtOEl1TGtwQUpYTVBtZ0VKMjRiQ3pwai94SDFPRVBOSCtpc05O?=
 =?utf-8?B?RGllMTBaOWtOWGhxZGplbTEwRVNjaFdGdkZUTUVuY3NsWFlrTG9hQ1JFTkhL?=
 =?utf-8?B?Njc1ZTZXaSt1Tm1HNkhRVnZEVXUzR01EcVNjNnNnb1h2RnZSaXd5TnZwYVRK?=
 =?utf-8?B?NnhUN2xYajFybytiQk5EODllYVVqM0ZOWW0vc0RSZjhBVXg3RlppZGpDeWM1?=
 =?utf-8?B?eFNUMUtTOXFyQmlCbm1UVWNHYTExZEg0SzJTcVFDd1lLWTVNTGFGVUd6UUps?=
 =?utf-8?B?NkdBbTlNejR2WHdRd2d2bWFZVUUvTEh0alFxNzhaZ2NUVVhCNVYyZWZTa0hm?=
 =?utf-8?B?TlE5eFVTMm1GYkhmUjBRQlJETEhVZXlybmNMODI5dldwMXpDNXRUV21WQnVE?=
 =?utf-8?B?NFQzTHdkcHFzSlVzcjJJb0N5Q09xRlZNc1JQUnlWR0NWem9pSmxVYWZnRGt5?=
 =?utf-8?B?ZndRMVoxUUZVVXRvb0lpTG9LRGVabTJuMVc1dlpIS1Z2N2VwNGZPMXI2YnJ2?=
 =?utf-8?B?NWJMLzB6RnFweGJCaDBuTXJsdGF6aTlvN1hqMlJlZ0xhV0poaVN5cEVQb0VB?=
 =?utf-8?B?OVhwWml3a0pqMzdIL240Vnd6dzFJV2RjWjVHam1nZXJEcEhONS9hOWhFcFhx?=
 =?utf-8?B?TkhXTzgvVFF6cWg3MkFYcm4zSXFwSkwvcXFVenN2dTBnVWdiaXFuNDJHcDlQ?=
 =?utf-8?B?cURka2k3UWRBU1o1eUFIMzduemw0cWt3RStaRzZhWU1aQnVhNmFpZWU3MjFS?=
 =?utf-8?B?NHE2WGdmVkZWQk5IdEtoMFczL3lMQ1pmNFZKVlViQlU0R2dJSXp2SDBHUUpN?=
 =?utf-8?B?bi9ZTGxlSjAxR0owSmpqdVZ1eG1mOHRjYkZtOGFjeDJmaHlDTlFBYVZsMnUw?=
 =?utf-8?B?MzFFMVFHemVTSVRBYlJSdWZxeEVCNVpPQmV4Qmg3M3k1YkIxNzEyV2doc1M0?=
 =?utf-8?B?RnMzcW1NTzRMTDBvdWRhQnVCWWM5K3l1UnJDY1pFMGxrNW9yTUI3RlJxUll0?=
 =?utf-8?B?Vzk0Q2w2T3lySjJwRnlrMEhTYVE4bEFaSWJQOUVKdHY3OTFWTDQ4dz09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: a3c57914-b79c-4b15-76c3-08de5a4dab03
X-MS-Exchange-CrossTenant-AuthSource: BESP189MB3241.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 07:04:36.2111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +jFsKKO3QF4jOfqeZLuicRTmVzsWY9VS2pyliQ0zfuts6+puqHibWaSkawtEUwF8es7KdEYjhengVZyXQwhzag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3494
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_230442_037445_A0B2AE11 
X-CRM114-Status: GOOD (  16.31  )
X-Mailman-Approved-At: Wed, 11 Mar 2026 15:01:57 -0700
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
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

--832332918645963717691518711255250
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE



On Thu, 22 Jan 2026, Joshua Yeong wrote:

> On Friday, January 23, 2026 1:58 AM, David Nystr=C3=B6m wrote:
>
>> Add the ability to rescan the i3c bus from userspace, i.e. provoke a DDA=
.
>> The usecase could be f.ex. an i3cdev userspace driver for a device with =
broken hotjoin support. If the i3c device boots slowly, it might be miss th=
e DDA during boot.
>>
>> Signed-off-by: David Nystr=C3=B6m <david.nystrom@est.tech>
>> ---
>
> Can we rename rescan to something where indicate we are only doing ENTDAA=
? I think rescan keyword should be reserved for complete rescan of i3c bus.
> DISEC -> RSTDAA -> ENTDAA -> ...

Are you referring to clarifying wording in the commit message, or the=20
sysfs interface naming ?
What would be your suggestion, restore -> entdaa ?

>> Changes in v2:
>> - Improved the commit message with "why".
>> - Link to v1: https://patch.msgid.link/20260122-i3c_rescan-v1-1-0c17071e=
232b@est.tech
>> ---
>>  drivers/i3c/master.c | 24 ++++++++++++++++++++++++
>>  1 file changed, 24 insertions(+)
>>
>> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c index 80dda0e85=
558..edeae7493b3b 100644
>> --- a/drivers/i3c/master.c
>> +++ b/drivers/i3c/master.c
>> @@ -758,6 +758,29 @@ static ssize_t dev_nack_retry_count_store(struct de=
vice *dev,
>>
>>  static DEVICE_ATTR_RW(dev_nack_retry_count);
>>
>> +static ssize_t rescan_store(struct device *dev,
>> +			    struct device_attribute *attr,
>> +			    const char *buf, size_t count)
>> +{
>> +	struct i3c_master_controller *master =3D dev_to_i3cmaster(dev);
>> +	unsigned long val;
>> +	int ret;
>> +
>> +	ret =3D kstrtoul(buf, 0, &val);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (val) {
>> +		ret =3D i3c_master_do_daa(master);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	return count;
>> +}
>> +
>> +static DEVICE_ATTR_WO(rescan);
>> +
>>  static struct attribute *i3c_masterdev_attrs[] =3D {
>>  	&dev_attr_mode.attr,
>>  	&dev_attr_current_master.attr,
>> @@ -769,6 +792,7 @@ static struct attribute *i3c_masterdev_attrs[] =3D {
>>  	&dev_attr_dynamic_address.attr,
>>  	&dev_attr_hdrcap.attr,
>>  	&dev_attr_hotjoin.attr,
>> +	&dev_attr_rescan.attr,
>>  	NULL,
>>  };
>>  ATTRIBUTE_GROUPS(i3c_masterdev);
>>
>> ---
>> base-commit: e3b32dcb9f23e3c3927ef3eec6a5842a988fb574
>> change-id: 20260116-i3c_rescan-4921d0b41a00
>>
>> Best regards,
>> --
>> David Nystr=C3=B6m <david.nystrom@est.tech>
>>
>>
>> --
>> linux-i3c mailing list
>> linux-i3c@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-i3c
>=

--832332918645963717691518711255250
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--832332918645963717691518711255250--

