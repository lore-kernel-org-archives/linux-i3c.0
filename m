Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F22ED73E80
	for <linux-i3c@archiver.kernel.org>; Thu, 29 Jan 2026 19:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ywODe/lienrqm4/IRQxXvIw8CNzuy2ezP51K0ICY+Eo=; b=xDyVaVQ19DMe2U
	TcM8WBcGQBT4xIKh4uaG/5d/4j7uvkSiWWdyxJkfe7KHSl95LK9d7l3h+gVO/mIalPivm3X54dXtz
	RoIsGaiyZpPnuQQGxX1Xhp6K0jXzvhPtEqqzNxfKoeEUBK3iGkpjA2iycC0nELL3HOQ7KXSWSDXM/
	Jl/Ux5kvLCXqhRQo0JO7fPCnaXJHz4zV5krNgiP4JNL8Uthh6Fl54JnixCjKR7eQg5EwttQuh0bNA
	JexUWnU07827JP0diPI7V/AwAQJRa8peD8l5bpOE6z5kobos9t9AonhuUjPQ/LCsTH6mSyCzulSz2
	QIEIxqvLIyIvKTmLcjag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlY7l-00000000a7p-2UHo;
	Thu, 29 Jan 2026 19:56:17 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlY7i-00000000a7U-3zXr
	for linux-i3c@lists.infradead.org;
	Thu, 29 Jan 2026 19:56:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sw8HyViLlrKztFSiQlPa42rv0oOZkGM/2Nr54pNKq2Ph0FqFjQEl1fHhadErgfbnL+CqSH8X1a91Cer+aiP/ekYhn5qjCUeUuSzUS5IpjhzridFeZVbsPucogNVUv39HTdguzaJynVUhRQQLp20VTbSzZLozqatTss4wgBPP3CbvW0BoWLasvIyhKP781lLLf/6O0Mbm8jATqnBaj8KWC3J0XWOl4UY/UBuoyFwL3Li2+BK4x9eMWVTD3LSMio1dF0SOOYmmENS8g+40c8F6Nb6RHnUVrtBYu58Kk58bwcbPWgIOHyjZ5jvxVjVjU6mGwEKoa5p39RPBOE198GZq/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0D37giGDDhx719ctFbfnAomqPsdue5gOqPFsP1XV8kc=;
 b=irw84sQ8WV3xX7PIXcf6jmHwvm4bDS8gge5l7e8En3FPnqV9FWplK284rekDFh1cKiUdTPsbHfzc4oBgd+d7bajmcTfUDoIzqo9WTdcgUUFxPE7O7B/VJV9su4zv/uoZdQS1HF3V70rwvwUQ2kbDu1o5ChfrPJRZE1kGdqqsGOlfRPirnS0rdzOQzuOoZAjPnGB8nICrwfG51jaX/DidvgB5u4Iz/VxjswE6g3eK0j2+t54FdWedNH0qpWx+Hzh/zecfnQxs+sa2zwSGrSDqC314U838ZNdgLcbcmC8T08FquUZtkd26Pvm7w6FUEVQ3UCGCNYu7Y7lnF/3lzHHgDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0D37giGDDhx719ctFbfnAomqPsdue5gOqPFsP1XV8kc=;
 b=DoARsmDH5WCO3WqbYhEAMIq2osNrFEJbEe4uRMe3xPKPjGRm9nvmKIY3h+CS5uszWyLhKTyXw1+b65/l5OmHFpEjvSkQMsF/ZSwQTNfLa6y7plpCj0tjQgLgspQSwIfxy8fLekzz7VR6I2EzFNfyw23d8tzd7VGoHUK3hEUvsz9pmCp4qX0FjW6iXf/7vKkNhiOdgv4in+908QdowqCKk/Tw/vFL6a0FSwHnIdZhB7+B1T0gUUozox+2uBNJJmOluRh3vvwwblYAiugU7c8GTDfQvIN3Q81HEvvgFVcEpnV0Yiq7j1jz+kM+meXkICr0lUUDWPecUVuT7eC8v/ybJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM9PR04MB8859.eurprd04.prod.outlook.com (2603:10a6:20b:40a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 19:56:08 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9520.005; Thu, 29 Jan 2026
 19:56:07 +0000
Date: Thu, 29 Jan 2026 14:56:01 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 3/7] i3c: master: Mark last_busy on IBI when runtime PM
 is allowed
Message-ID: <aXu7UduYCweVLxdK@lizhi-Precision-Tower-5810>
References: <20260129181841.130864-1-adrian.hunter@intel.com>
 <20260129181841.130864-4-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260129181841.130864-4-adrian.hunter@intel.com>
X-ClientProxiedBy: PH7P221CA0006.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::19) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM9PR04MB8859:EE_
X-MS-Office365-Filtering-Correlation-Id: 61c55f42-c7c0-43c0-1bf7-08de5f70716e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|366016|1800799024|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZWYxenlxbmIwRkhqNXA3QkpXK0RLM2E3cU9yVG5wSGgraFU0WWplUTdZbXM1?=
 =?utf-8?B?VnZGcVB2cWZDS2NXaVFjcGRqMUIyL2ZIdGFQbFpIV1diRSs2OHlVeWlmWEE3?=
 =?utf-8?B?MHJnQnpWRFFXRUdnWllkQlN4dG10TDNiUkZKcUM2VlQ4K3AzRnlTOWxnSnZS?=
 =?utf-8?B?d0VRV0dJSWJaR0NXU05tU2JvSXBpdkJXRkpsbFZiNGZQZWErWFhZTXgwZjNn?=
 =?utf-8?B?Q3gxS3EzZjdTSm5Zc2dva0JkbFBxYzZtcitxUVB4b2xJVERrRDY1OGNacG91?=
 =?utf-8?B?Sk9IbDhYZ1dUNHhSTlUxdENTNVRpVHFTVW9YZmluR1h2WHg2aXFQWXBYN3ly?=
 =?utf-8?B?Z0FVamdFemJzbm8zWTZTeVRUcGJZN1NCTm9tczZxQmhBaGRnbmFFdmQrQktC?=
 =?utf-8?B?aGl5NkdxSXRvSW9BL1VFTlRBdkxkSkJaVHBpclJsTjI5VTdpRUxjNDg1N2tj?=
 =?utf-8?B?WTFsbXRHQWZSYkYyN2VyQVdKYjVDWmc4Sy9hcUx0WWVyUDkvRE1RY3lhbkNM?=
 =?utf-8?B?d0hzOUhNQjZCU0ExRVl1aUVrVzF2YlBvNVFuRzR4UW56dXBlVnB1UVFKQUZo?=
 =?utf-8?B?aTRQSUNVLzI1UnllamdvZ0RxeXZOM3BBOE5PM1VtYVd0SE9nWk9EUkR2MXFJ?=
 =?utf-8?B?MHQ1bCtIVGxRWFd6bHFycU1xUVUxc1RNMk5DbDN4MWJvQ1VzK3RqNW8zQlVn?=
 =?utf-8?B?Tzd3aGJlUWc0enlFVHFBNmR4ZWRyWlBQbitjRmpmK3ZvSFA1dC9tamlvblpU?=
 =?utf-8?B?dzBjYmk2L2JnQlJFUGF1c0pjWEVlZFpVSmFFaW8zY1pZZUtKZ1EzUllpekpL?=
 =?utf-8?B?S3NBUVVJVFFwV0dscjMyeVZFL2Jqb0RlT2xlUkNkdXg3UVg1Z2VuRWFhM0hv?=
 =?utf-8?B?cThPcG9FWDVka0QyT25BLytWc3kxOVJveDhLMVM0eldQQmxsUzAwdTc3L1Zt?=
 =?utf-8?B?ZksreWlBV3E2VjEycnNaU3czRzBoWWZlNVFRY1dPL0FmUWx1ZlZ2VmljeThq?=
 =?utf-8?B?NVFCMTlENjI3Q2Z1OTM4bk1YY2VCeEM5TXdMY2NaYkdEMTJLY1pIWUZIbGlJ?=
 =?utf-8?B?bnJaVlVXUTBQZkRQRWYrcDNxeElSOUZxT0hJYzRPcUpkNy9vOVBPT0dFME9B?=
 =?utf-8?B?V0p2NmhlQjhtdWFvNlUwTURtNkViOXJtODNEMVkwL0hSb1gvUzNtM0M2dEpn?=
 =?utf-8?B?bGZyb01BcXFBZkwyN1hMd0tQd2JtOE1ZNkhrV0hhVitzUWxENmR4WVl0WUMz?=
 =?utf-8?B?Wk02ZFpHZmZvVWVqOEtZWmh0NUY0UE9SeFpsbml3N29PU1ROWjFocFpIbndr?=
 =?utf-8?B?emtTVW5YaFVFMDk5b3BSRUVhanNrR21NdVA5RDgyd2RTazJ3R1VVc1I1dkpS?=
 =?utf-8?B?MlVJaGFGSzZTN1dzZU1yVWJnU0VtNnQvalNzN1RXZU05bnQweGNtREVrK2k0?=
 =?utf-8?B?b1hVSWZYMTJ5ZkVXNEoyNVF0YVIxNW82RFAxY2lkeWZ6NVNrNkFrUVRFWnE3?=
 =?utf-8?B?aUFRRjY2Y0hISGhlRHpjNG83bUE5Y2s0Yng2Zk9JdkVTaGlKLzRQR3hubDdC?=
 =?utf-8?B?bnViek1WSmlGQ1FpRkxCVis3UHVHRUpHbWp0bWR3S0hzclhtL0hUK216SytF?=
 =?utf-8?B?WFpyT0NMZGI0MDdnSThwWFlZREppQUhMeS8xT3pKa2IrYWlFOUdrQlRXejlo?=
 =?utf-8?B?bHVjRHNGd1dHcTVBcnBIalNPdjVzSE9DeFU1UlZnc1QrN3dzVWM1LzcvUjZI?=
 =?utf-8?B?cU1YWXZMajZnOEhibmpMTzQ5VFdCSnhtSHlybGFjelFmaUdwdlA5SXNNQlNw?=
 =?utf-8?B?ODBGUVJ5RU13Y3d4WGdTQnpLVXBET2tQYTNNQ2FQckJqZFhtb1pLcEVIYWJv?=
 =?utf-8?B?c3FPS1EyRm5FVDZDTFBlY1BOTTgxWS9rTjErNFR5d1l5aVNlV0NQYllwM1RE?=
 =?utf-8?B?VXBWbDNWUnVKcmtVNHc4MnFJZ0o4a2cxQ29JV09YQ2tXVXp0UDRpM081Q01l?=
 =?utf-8?B?R0x4encwVHhzeXJ5WndvRlZhVS9FTzVQVi8vODlSRUlUaTZaRXJKWkVEYnpt?=
 =?utf-8?B?OXZNWFRhZ0JwLzJxTzJWUGJ5V0N1UXpqRmtOajkvaWI3MmIyQnNJaE0vWEpk?=
 =?utf-8?B?SkRtVUY4VjJDOXFzTmpSNTdNVG0vLzhXZU5QY042UDFrbUVWUEp3aDJ0SGl1?=
 =?utf-8?Q?Xg8KDQy4u4i4AJfehs3RrZA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjNsb1hYWmIwMEMvVkhGeFBUemlwVVVPR1IvUkxTMm1wbzlqWXNUUnFWQ0h3?=
 =?utf-8?B?YkNMRndPbjV0akloTnUvSERTRVE1ZTIyY3I0cU90NUJ3cUZRZk9jV0pMbUlZ?=
 =?utf-8?B?MTd2UWs0M3FVOEpsT3ZKbDBGNDBVeVdFVDBVN3Fsb2VRWjBybXVIQ1Z5Q2tj?=
 =?utf-8?B?M1FEWmxJN3J2SGNCd3NNcXdoK21GNHJscUV6Rk5BRWVLUFh5clA3R2l1TjVG?=
 =?utf-8?B?Nnp0SDNST3d1UEVIV09wTFlNRHhaaUVsZDAxa0hXRVJLYXFhSDh0NUxvRWMw?=
 =?utf-8?B?cnhtUG5ZSTd5V2VmUTZJLzdIMnlEQXBnY0VSS3c4QXVabkhDOGRyVXRtYXYv?=
 =?utf-8?B?WFlPZkIzUjVOMHpUbXF1eUU0dnZKNDl6V2xiaUdKTmdaUWZNMkJRLy9qdHFI?=
 =?utf-8?B?cHYwYi8vWlloZkI1UWFzWGt2QXVwenowMGVIbGpHQnVSOUlHQTRkS0M5dE1E?=
 =?utf-8?B?YWtqSE9PNU1DN25WeEI5eU1BZWRYQUJyZ2Z2RjZOb2xCdyt0RGxuMjBVUnEv?=
 =?utf-8?B?dHNKTXJRVGRKMFhWVzMrVE9DclJXWHNVa0pQNmhhUW5FL0J4WlkvbWhaUjE2?=
 =?utf-8?B?VmtmOFJMVTlodnBkL0phdm94TUE1ekN6VjJFdXJGbjZnd0xYcTcrdDd2Q1By?=
 =?utf-8?B?ZVBHUEo4T3k5SVdMamJ3Y2dBV2NJWFJUbHFNb3JsNVZFeGxWSS9zYW9tb0FN?=
 =?utf-8?B?QlJUVG0xL2FuYTJjWFBRcTFSZStMbzVGQmVZR3BpYUdRWTJYQjJtc1Y5bDhH?=
 =?utf-8?B?MUVTYkxrQ25jeWI5UXBFbWdYTExHV2UxakpLV2VCSzV4Y21WNVZtSHdqZmNG?=
 =?utf-8?B?dXdpWEFxQ25nYmJNbXc1cXJSbVkvRmNWNFl1cS9nK28vNnlYZTBRTmlDZTdy?=
 =?utf-8?B?SzYvaTIyaTdkL3ArVmg4WERZcDY0dkFTRzlLWFFhdVAwY0F2NkVrUVVacVJV?=
 =?utf-8?B?TllRSEtJZFBidnM2K2gxemZhNXBlUjRFT2YyOWdjTEVXclloSFpFTjZwZmh5?=
 =?utf-8?B?cnlaS0VCSE9mZzdlRmdFN1JVVXRpQ2JaYnRucGtWM0dpZ3hJaW9IVnRKVGFD?=
 =?utf-8?B?TDVqTWtxZGtLLzdHVGVQOUttaFpneDlWb05RWGVwbi9vcDl0UU4xT2JTOVNG?=
 =?utf-8?B?RFM2NlpZeUpsVWZXZVZkMHdGY1MzSS94ZnkxQmJ2UllSMFVSUjVkelFEV0FI?=
 =?utf-8?B?czhidzJJUXZvN2VoZW1YNXBzdmdseVJ4K29Pb2cvUHdTcmE5OE9BTGpTSm9T?=
 =?utf-8?B?cTZUR0NYd2NXKzlrV3A4V3Q3bDZ1S3lLa3NTRHJoTndyNU1rWmFxZE1mWGJ2?=
 =?utf-8?B?SjgxT294eTJYVE4yZUp0SWw3eWNmSysrbzJvNDJ4T3gzK0N4Nkd2R250bGtF?=
 =?utf-8?B?L2FtSVZIUzRQV1N6RVhucjFPemN1b2Q4V2taSmxPMnhkUTdOdnNNdTk2L3JH?=
 =?utf-8?B?azA2TFB2RDBITXhDcnZkWUF6ZFB6Y3FiQms4S0d5eEZLbS84b0RDRkxSWlYy?=
 =?utf-8?B?ZDNiNVl6cTg4TkxwZG43aGlReUNJQ2FvTjkvYk8vOVBVRUUxYk5PeDRCRHpE?=
 =?utf-8?B?UEFWdURkNjdxQ0F6SVVmcUhDTk5JY3MrZ0RSODhtcisxeFI3ZU1Rck1jWDJ3?=
 =?utf-8?B?WEZLSXVtbmk0WmYreTA0U3h0cUlCMlRQQXpXckgwQVNRK05yYlM4Y2lwYmZa?=
 =?utf-8?B?TFByMmpwcE5pYm9aZHVGaHBmaHMxbmNvZk9rMDBwMjBwczBFN1VHaHVnT0JX?=
 =?utf-8?B?aHZIWTVUdTJVb010aWRWcUJEMnE2SFVlK3BPcitNYzQ5VldZeXNCUFBOSW1N?=
 =?utf-8?B?azZNSWZRRWIybzFkQnMwV0JtNnFFT2Y3OEFuMzhVZEVMMTVnd3pnWGlWTnFC?=
 =?utf-8?B?eUF6bWcwa1JxSmJUanlxdlcwQWdyTkh6RmtxeGo1YmxDTThkUXFUK3JoTk9L?=
 =?utf-8?B?dGs4TjVEYlVSSUJtODcxdHJLY0pqNlR1R3RZZGRXNWJuRkxWWUxCUm1VT3oz?=
 =?utf-8?B?SkpuN0MzT282dDhna2JhYmpxTTlWNE5LdHB0VjB3bUZzWkJYZTBrL3RXMXo1?=
 =?utf-8?B?TE9FdHlQd0tRTUJFUE1YR280U0ZoeWNrUEdYSE1TM2lXTE9FNjhYN0pyVXhM?=
 =?utf-8?B?NXBzRzdNZ1JyNUJPc1lhWW14T2h2aDNZbFZrV1ptOEdHbnRCUGdjR2dMUFh6?=
 =?utf-8?B?dXFqTk9mbFJYenExU3EyOWdpTmhHTnpDMHU5aC9NMEVaNWJIVlg0QVdreThw?=
 =?utf-8?B?ZXdQczZYME0xeXQ5bkwxem9QMVlnZitkYkJ6Vkgxd2NCVVRzdlpHcld4OGxw?=
 =?utf-8?Q?8g1OHrZgszZjbQuFsv?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61c55f42-c7c0-43c0-1bf7-08de5f70716e
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 19:56:07.8957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ldtimDj9zUZa6I4HNTa/FFsb/6Yv1iSBYjnmcDmxEouO4RStGrqNJaY0Jp9qGe6pg+CRV+tVMarUo7okxXaOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8859
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_115614_994432_88CC8F9C 
X-CRM114-Status: GOOD (  20.02  )
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

T24gVGh1LCBKYW4gMjksIDIwMjYgYXQgMDg6MTg6MzdQTSArMDIwMCwgQWRyaWFuIEh1bnRlciB3
cm90ZToKPiBXaGVuIGFuIElCSSBjYW4gYmUgcmVjZWl2ZWQgYWZ0ZXIgdGhlIGNvbnRyb2xsZXIg
aXMKPiBwbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZCgpJ2VkLCB0aGUgaW50ZXJydXB0IG1heSBv
Y2N1ciBqdXN0IGJlZm9yZSB0aGUKPiBkZXZpY2UgaXMgYXV0b+KAkXN1c3BlbmRlZC4gIEluIHN1
Y2ggY2FzZXMsIHRoZSBydW50aW1lIFBNIGNvcmUgbWF5IG5vdCBzZWUKPiBhbnkgcmVjZW50IGFj
dGl2aXR5IGFuZCBtYXkgc3VzcGVuZCB0aGUgZGV2aWNlIGVhcmxpZXIgdGhhbiBpbnRlbmRlZC4K
Pgo+IE1hcmsgdGhlIGNvbnRyb2xsZXIgYXMgbGFzdCBidXN5IHdoZW5ldmVyIGFuIElCSSBpcyBx
dWV1ZWQgKHdoZW4KPiBycG1faWJpX2FsbG93ZWQgaXMgc2V0KSBzbyB0aGF0IHRoZSBhdXRvLXN1
c3BlbmQgZGVsYXkgY29ycmVjdGx5IHJlZmxlY3RzCj4gcmVjZW50IGJ1cyBhY3Rpdml0eSBhbmQg
YXZvaWRzIHByZW1hdHVyZSBzdXNwZW5zaW9uLgoKbG9vayBsaWtlIHRoaXMgY2FuJ3QgcmVzb2x2
ZSBwcm9ibGVtLiBwbV9ydW50aW1lX21hcmtfbGFzdF9idXN5KCkganVzdApjaGFuZ2UgZGV2LT5w
b3dlci5sYXN0X2J1c3kuIElmIHN1c3BlbmQgYmVmb3JlIGl0LCBub3RoaW5nIGhhcHBlbi4KCmly
cSB1c2UgdGhyZWFkIGlycSwgaW4gaXJxIHRocmVhZCBjYWxsIHBtX3J1bnRpbWVfcmVzdW1lKCkg
aWYgbmVlZHMuCgpBbmQgdGhpcyBmdW5jdGlvbiBjYWxsIGJ5IGlycSBoYW5kbGUsIGp1c3QgcHV0
IHRvIHdvcmsgcXVldWUsIHdoYXQncyBpbXBhY3QKaWYgZG8gbm90aGluZyBoZXJlPwoKRnJhbmsK
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBBZHJpYW4gSHVudGVyIDxhZHJpYW4uaHVudGVyQGludGVsLmNv
bT4KPiAtLS0KPiAgZHJpdmVycy9pM2MvbWFzdGVyLmMgfCA1ICsrKysrCj4gIDEgZmlsZSBjaGFu
Z2VkLCA1IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIu
YyBiL2RyaXZlcnMvaTNjL21hc3Rlci5jCj4gaW5kZXggYmNjNDkzZGM5ZDA0Li5kY2MwN2ViYzUw
YTIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9pM2MvbWFzdGVyLmMKPiArKysgYi9kcml2ZXJzL2kz
Yy9tYXN0ZXIuYwo+IEBAIC0yNzIxLDkgKzI3MjEsMTQgQEAgc3RhdGljIHZvaWQgaTNjX21hc3Rl
cl91bnJlZ2lzdGVyX2kzY19kZXZzKHN0cnVjdCBpM2NfbWFzdGVyX2NvbnRyb2xsZXIgKm1hc3Rl
cikKPiAgICovCj4gIHZvaWQgaTNjX21hc3Rlcl9xdWV1ZV9pYmkoc3RydWN0IGkzY19kZXZfZGVz
YyAqZGV2LCBzdHJ1Y3QgaTNjX2liaV9zbG90ICpzbG90KQo+ICB7Cj4gKwlzdHJ1Y3QgaTNjX21h
c3Rlcl9jb250cm9sbGVyICptYXN0ZXIgPSBpM2NfZGV2X2dldF9tYXN0ZXIoZGV2KTsKPiArCj4g
IAlpZiAoIWRldi0+aWJpIHx8ICFzbG90KQo+ICAJCXJldHVybjsKPgo+ICsJaWYgKG1hc3Rlci0+
cnBtX2liaV9hbGxvd2VkKQo+ICsJCXBtX3J1bnRpbWVfbWFya19sYXN0X2J1c3kobWFzdGVyLT5y
cG1fZGV2KTsKPiArCj4gIAlhdG9taWNfaW5jKCZkZXYtPmliaS0+cGVuZGluZ19pYmlzKTsKPiAg
CXF1ZXVlX3dvcmsoZGV2LT5pYmktPndxLCAmc2xvdC0+d29yayk7Cj4gIH0KPiAtLQo+IDIuNTEu
MAo+CgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkz
Ywo=
