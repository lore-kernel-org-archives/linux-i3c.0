Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 734F4CF9C5B
	for <linux-i3c@archiver.kernel.org>; Mon, 23 Sep 2024 07:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:Cc:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=v1BHutdGSITd/hob+DzZB6zajRh3AG18eMDDEmEKoVo=; b=jlH6vJFoSwwtnhfMFNKL8UNysJ
	VS/xTYzzm7161r9Yb/hPaidLk23OPAj3jx3XD7GQP2c7dFGJnNRkWfshOYxOnG0OVMG3p03qXGxQ1
	gZLGTxrNGMJ3hjD+Chw/Gs7qJvJGsAtHkJojvcg2K2hhyQUa5UyYyx6WI/K09tU6zE+85sDcM2OYY
	QFi4UnUHQsQyZaBxMEiWAFCqYqXd2woKHNDIRuKJwfsNGaxZg9Sv3KPYHinnolJEXfIbst6lQK1cY
	q2ch9/IXdFnipPVDO7zBNIgMHJyZ8fuKCaqn15bEpt0CfmzmOIOwWC3Ps+aaHj0yx1pZK3abPCVud
	ZEFFr3Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssdgD-0000000GYQi-2U2C;
	Mon, 23 Sep 2024 07:40:21 +0000
Received: from mail-mw2nam04on20612.outbound.protection.outlook.com ([2a01:111:f403:240a::612] helo=NAM04-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssdgA-0000000GYQC-49g9
	for linux-i3c@lists.infradead.org;
	Mon, 23 Sep 2024 07:40:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rWHdpvujyI0ni+ZEklkHFHHnlDDoOl0/AY+LW5tS+uoGID3rMqJfVMjYr8rjjTjkT0fXpivkZ0Areoxqtw3FHgAX3mpX4lMdzlvnoWr6520QV00hMpF0s442fe2Okfu+aUXRvUunA+3WGJbgR311pxsTHuoPwo6pmMAJUMbUIsF2RQjBKWSYbo23KJjYbBjmUAc0xYYnKFDhzWUIW4SI3eXrSeiV+a2mjWgO5wvyWAuahTA6LFljY/eDgRtCk8y/l4F3xLuDLbIIyacrWEKrAP6TyRjf+zPrFkhcxrC95NSagDX1Z9rhaJejj+jh98v0yRh+TWVPqk5oasNd87sTVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/4l4TxXb8L2bAJiFPkT9KiSKBhNbypyx8cubGb5eukQ=;
 b=BilbtZuRY4JjVYh5gcnu4l9VxnR3foi+JCPHlBlKdyNLiIr/5HHJfmryx5vWwyEuv5J9rz/YKrg+T9zvxQ0zodYnvIyuJ29lowcZpDRRj7H8EmTJNPj9z28y2dnZ7EBx8ci8gxRM3bqE93yMcqwpNoYzKAU0rkOxoT+i8ua5/nMDb5DBYY0MTyBMHqOqhQ8sToKn247k1cNwzkKI0gO2Tm7u7FiJEFWkMKgpr2YngqFkZDg/6Mv/I/7RNRHqPSEG8L4dNLdk2wZ0NLYBqaW1uI2FQ4BhBbqenaqAoNPWp9hS87C09oVzLZcq4TcyJ0OnEdYFayuiBCFV2dJA0+cWxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/4l4TxXb8L2bAJiFPkT9KiSKBhNbypyx8cubGb5eukQ=;
 b=uHnnBzNLSPHHK/dXfDy66ErisQve633GqQoNSedsHx1A+u1nK+Bs1C7e8UDKTKKnOIjGEWt4XJzdJixtIC/gSnCjcDKXK0P0E+pyt02huoBgl9StxHzgdnlKAa4Lkh72O7eQZKG0WgZENdyG9jc8sv2labb4lyPph+rzv58V6T0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by PH7PR12MB8827.namprd12.prod.outlook.com (2603:10b6:510:26b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.24; Mon, 23 Sep
 2024 07:40:05 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%3]) with mapi id 15.20.7982.022; Mon, 23 Sep 2024
 07:40:05 +0000
Message-ID: <66ff9903-78d6-4079-8445-6e01d9aa39f0@amd.com>
Date: Mon, 23 Sep 2024 13:09:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] i3c: mipi-i3c-hci: DMA interrupt fixes
Content-Language: en-US
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>,
 Krishnamoorthi M <krishnamoorthi.m@amd.com>
References: <20240920144432.62370-1-jarkko.nikula@linux.intel.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <20240920144432.62370-1-jarkko.nikula@linux.intel.com>
X-ClientProxiedBy: MA0PR01CA0121.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::11) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|PH7PR12MB8827:EE_
X-MS-Office365-Filtering-Correlation-Id: e7fb7010-5d0d-4dd1-8208-08dcdba2f0fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vi96MUVIUUFSc2dpaTg2SG5QdnhVS0lGYUZFWmkwVWp2V09HOWtOVVdMNVpt?=
 =?utf-8?B?MC9ibXBYWTAzQ05uVFU2UWxKaU1UWkFxMTRsUk90ZzJIRngxNHNiMDlTQm5V?=
 =?utf-8?B?NG1XZTZQZGJpNU0zb1YwZWhaTVBkRXR4VEo2RmdqUVIvQ2FuakY3bjdVNFRi?=
 =?utf-8?B?SnJ2Nlg1ODFMMWVkRVRoNDNqWUFwRngxN2dyMituTUdVa2NBTmFBaVMyUDB5?=
 =?utf-8?B?ZUgwMFBRVjQ2Uy9kajhNZ1BiYnFYL1RKblQ4MFJ2ZEVXS2JDVHpJOWpHL0pm?=
 =?utf-8?B?ZmxuNGxOa3VKRUk4bWhuNDVtS29OcE1sRXhkRFdkK24rWEhDbFh0ZC9pYzJ0?=
 =?utf-8?B?TTBWYm0rWlNYZEI5RCt3aVREVjIySnRob3lNeU5qWnRwR2MzTXRtWDNsZE9Y?=
 =?utf-8?B?YitFTlhuZG1DanByQ0FFVC93VEk0dnliS1JsWGE0S1lLWndvblZnb0pNWStr?=
 =?utf-8?B?Qm9VbHdEL3JvM1BmdEZVem5xcE5idHZBOUhtYnltK1MydHlFWU9LTng3NUNz?=
 =?utf-8?B?R2VsZzNJUDZyQlFUUHFkMFhiR2E2dXFoSytub2ZpVEhlVWhVMjkvZnF2OU1h?=
 =?utf-8?B?aTVEL3JKcHlzOXV5d2JXcXFsck9KRnNVS1JBdjZYWm9KWHdCYzNTbXBoRitE?=
 =?utf-8?B?NldqU2lsUnVDa05zandiUm9XVGtFOUx0UytZaHprM3BaOEVkUGx0K1k1dFVO?=
 =?utf-8?B?Nm9DdDJCYmFuS2R2aDZkQ3pWcFZHMG1BN21nS0NtdUowN2Y3R2NUOFRKTG9y?=
 =?utf-8?B?cXM3ckRqNE9FVTdYaHA4c0VTTkN4eXR2NXBCVDBNY1ZLSmVRQlJwNGxhcXkx?=
 =?utf-8?B?UlNKVVpSUEt4OEZrZVgvZFMrbVRaRmFJUkExYWdKYi91OVRnWFJraXFZRllN?=
 =?utf-8?B?OFZrU1dTa0NxVG1HS05TQTd0WUcrVGF4c3cvM0xYaCsydm5PSU1ObW9LdWRV?=
 =?utf-8?B?QzVTS3Juall4L3ZPcDVUaFFLWGJaMmJUY1hhcmlOQU0wSHNaSjU0UE9TMjZu?=
 =?utf-8?B?YndiRGhOdEwvWk9CeC9GK2VuOFpaZ0tOWDNVM2diOTdKZjB4N2t2TGFXWVhw?=
 =?utf-8?B?aUZvSkpNODJVaXZWNEx0ZWlhNzFSY0phekpSNXdYWHI4TkhtWDNjajQxVUsv?=
 =?utf-8?B?VERhZS80Sld0MW9KZDgwUVAxdGk1NGt0dWpaalhQakliRTJyNGl1Rmp3anM2?=
 =?utf-8?B?Z050bHorYVl6VjIzVUdiZ0hnU1RkbDA2bVJubDZoaXVNZ2xwZlp1Z1JOSEcw?=
 =?utf-8?B?SkVndk9lSEgyTTJxeG5ya3BUN21XcGloUlYvU3FLY2s0eWp6dDg1Q2xvYXdE?=
 =?utf-8?B?dWtmN1VCSEdSVVdjbEJBMFF4Z0xORElwVnJXYlFFM015ZG5BRGxTekVDRnVs?=
 =?utf-8?B?NXhFL3F1VDhOclQyK3R0Q3Fzc25pTDFkQjM4VkRwZFFNUnlDbUZDZ0RydHcx?=
 =?utf-8?B?RDFOQjlsQ0ttcFJFVzVlREhnb0Q5NVhjSkxlUGFqalFLRDdEekFoZFY0WGVu?=
 =?utf-8?B?YjlreGwvdDZDZzVhakFEaTRobmc3cDE1T3FoWTJwaWtKV1hhc2xUQUR5R3JY?=
 =?utf-8?B?VjhhbzJvQ3NVcEJZcE9ySmNXb3NOTlZwTENFdTNTS2plYThXTkhLWW1WS2NI?=
 =?utf-8?B?aDhzUGFrZ0hzakhlRGtMcjhheE5JZ1ZIMS9DNExQVXRTcVNaMlpmR1p5Wkg5?=
 =?utf-8?B?d1pNeWJjU0kycUtsVUF1R3Q2aHhMd2YxU1J5TXdoMzZURzVtSmczQ3FRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXNaVkxNSi9xTzk3NWNnZnlzRHpGeDl1emQxRFBReG5SbDVUQTlOTlIyeHhE?=
 =?utf-8?B?VVRrb1FhWEZ4bHdYdWo3M2ZPd095cHVCVjQ1WGZHVmEraXR5QkZKS3hYZ256?=
 =?utf-8?B?ZUhQcklnMWkxV1lFQWVxeUcwL3I0VjVneUZJUmh2WkxpRTZuSFgzczlRbk8y?=
 =?utf-8?B?WU1tWUcwdDhGOTQwcUFZWW8zZVdQSk1uby95c0lLbm83YmZmTHNLeTBzb0ND?=
 =?utf-8?B?L1VGWDBpdVF3eGdxSU9LRERhN3NYZW80N3JLdU51Wmp6ME9ia3dHamUyR0xu?=
 =?utf-8?B?d0htV3JKSjFPWXA5b0JOZFZpTTdaMVFXc0tOKzduQzlBa3I2Tzd1cWNQRHJu?=
 =?utf-8?B?SjhqRlVIUVdqeTRzUTNsSit2czBqSWVRL1IxOEd2R3oxdXJiZDB5ZTcrejFw?=
 =?utf-8?B?L0Z4V2JreUJBZGFhYWxOam9XVmtxVWNDbEJjSFNUYi81Q0RDTUFLT0Rlb1I0?=
 =?utf-8?B?RU5vWGJydy9sdVFoa29IcU85LzdiQXdkSmRiNC9FN3BlMUttODY3WFY1d0gv?=
 =?utf-8?B?THhhYkwrZy9LdDVoSHhQSGhkSFdjVVlvQWkzZ2w3WHUrNzRYSkJrdjhrM3l0?=
 =?utf-8?B?c0hsZ2NJM2VKQnJ1bHAxV1J2YUR1clVaMURIbFNkcGx2eElKNnVFS0hQWXEz?=
 =?utf-8?B?c0FvY2tXOUJKU0EzTjFYMEtYVHhuaGJodG4xbGpLSHYwT0F0eVYrZGg0MVhQ?=
 =?utf-8?B?d0NoanhMektJWmtlS2VGZWFweVoyK3k1VGh5U2ZhMStxc1ZOeWgwU2tzRm1O?=
 =?utf-8?B?OCs1ZFJuU0UwZnBVV3M0V2xqRHhJRFFnVUlvWmd4SnA2dmF1VkNEc2YzR0Nk?=
 =?utf-8?B?a0tpdXdRWEJTSnpSdVRGWTd3U3VHWDNEb0pZVlJBR2pJazhYSDRubkZsL1Rx?=
 =?utf-8?B?eXBtdVNNQVZ0Z1prU2VqVzBCM1ZQVUp6U0lFTFBuMUE2eUs1UUhQMytlVUEr?=
 =?utf-8?B?S0Jubyt5WHpXa1huWjI5aHJleGwyanNqTGxrRmcvc1hia09BSFYrdUpib2FS?=
 =?utf-8?B?UWtqeFFBOE0xQkg1RHJRM1dEUWw3VW9jc2tzc3Z2MERsN2VZR3dxbUtHMnpO?=
 =?utf-8?B?bi9uYlI3bFplSmcxUFUzK0dIa3hMVExvaDduczIweVZ4Q0U1bnJQT2NHd3BX?=
 =?utf-8?B?U0V6ZE9YNjJqVEFScTFsWjJ6YlJyWGg1QVN3aXk2MFk3dFg4SlJJODUwc081?=
 =?utf-8?B?bGdCdzArUFRJbi82M3dSSUwrS3o2NUZGTmllM2E5L1EvUXROTmlvaFBnWXZk?=
 =?utf-8?B?YVZ6RzY2ZlExVjlpYVFmZVpJcll2QjN5Y0w0N0dqeFBmNHVObktneEFtVWRV?=
 =?utf-8?B?UGRGZjdoOHZxZ2dNZ0tHKzhGQ2dLeUxablZJT3dnVzVXby9EWTY4TW1MWVRY?=
 =?utf-8?B?SWxhNm9YdWJkeDBKek95YjZqUDlLaElaZUV2a1loNDVLOTlhOWoza1Y3anAx?=
 =?utf-8?B?aGEweTBVOXRzUm96YWJMdlQ1ZjM2K3FQZGNCK2V1bkQ3bWJRVklKRTFXZkhq?=
 =?utf-8?B?Mk1oWW5oMUc5alo0dllEQlgrdjAxRytkZ2V5YStveDhxMjdrSzk4R3lvcUNw?=
 =?utf-8?B?Yk1yR1JheU9Qd2taTGJjVkZGQnR4RFY2cnpBY2NqYmNRWWZxUW9SZXJseEM5?=
 =?utf-8?B?RW5od1pjZVVPK2gzNXVMQnkzRnIyYnRpMTdHTHFjNElza3FPYVI3cmU2Z3E1?=
 =?utf-8?B?aVhKWjNpcjJwSWdsU01ma0diVndXYW5HQjhnRERPTHBXQzRIOWZIelQwZnRM?=
 =?utf-8?B?Q1F0WDhkeDdxVTZiUDNpSXoxZDhQMm92NVJ1Q3U3U1dmS1lDdFRMVHZSOTVt?=
 =?utf-8?B?TWhvLy9KS3Q2cWpabHI3dXlhVDZkWm1RVGMzTmk2L2N3VG5pekNOTGtNVlMr?=
 =?utf-8?B?dVI3VTBqQy9PN1J4UWVuNjJMbzg5dHpxSEFsMjI4ODdWT29ObkV1VXZZV2tu?=
 =?utf-8?B?TFN1NEx4Rkc0ODYwVlNCZ1kyRGVJNGg2YytvS3REVE9yUlNFVFZkRnhNaWtD?=
 =?utf-8?B?MU1Md0hqK1M4R3Y4RHBTRmRBWitqKzVHZVV4aDBJUVZNcUtLMno2WndZYWtm?=
 =?utf-8?B?bWFnaktzSzgrb1JkQVJPNDFEblFVYVVod0ZYSHBXRzh1V2RLMDNIM09vbjlI?=
 =?utf-8?Q?gpZCHQT3lHAqdJGLmCnKWVPqj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7fb7010-5d0d-4dd1-8208-08dcdba2f0fa
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 07:40:05.7205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LtQGm8qEiL6MReQK5+5c7chENDW+0rEhltq32HrQ+I5Gva2PfRQ33HKeZ3pP+l4NXB5Yul4k7WebotHSp/tp2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8827
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_004019_341292_82209CF7 
X-CRM114-Status: GOOD (  13.32  )
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

Hi Jarkko,

On 9/20/2024 20:14, Jarkko Nikula wrote:
> Hi
> 
> These are targeted for the v6.13 cycle, i.e for the i3c/next branch
> after v6.12-rc1 is tagged.
> 
> Patch 1/2 is stable looking material but I think it gets visible only
> after patch 2/2 on a MIPI I3C HCI v1.0+ compatible HW so in my opinnion
> should go through normal development cycle.
> 
> AMD folks: You said you have non-functional DMA mode on your HW. Can the
> patch 2/2 make it functional or are there some other than interrupt
> issues?
> 

These are RTL issues within the hardware. I don't believe the patch
will help since the DMA mode never activates (at least with the
current ASIC).

Thanks,
Shyam

> Jarkko Nikula (2):
>   i3c: mipi-i3c-hci: Mask ring interrupts before ring stop request
>   i3c: mipi-i3c-hci: Handle interrupts according to current
>     specifications
> 
>  drivers/i3c/master/mipi-i3c-hci/core.c | 16 +++-------------
>  drivers/i3c/master/mipi-i3c-hci/dma.c  | 10 +++-------
>  drivers/i3c/master/mipi-i3c-hci/hci.h  |  2 +-
>  drivers/i3c/master/mipi-i3c-hci/pio.c  |  2 +-
>  4 files changed, 8 insertions(+), 22 deletions(-)
> 

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
