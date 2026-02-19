Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C78C531CD
	for <linux-i3c@archiver.kernel.org>; Thu, 19 Feb 2026 20:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:Message-Id:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4lTMgfMTCXefr9Snbmlt9cqo2lq0myoBqe8vCYXnwl0=; b=F/wAf1/NKp/JPJ
	bMtUS9T4P5Jy1dzSjfowqmHZSocuCi0gJ1uNh/wEIvto/IhuZKv3gfrcgQwI5oLVtArDUiFN3Y9K6
	ZI1el5TUZO/3I0lGAsyQlLRPAIFJiPs1pKyDrGrMHKfBCtPS87RKZuFFogZOzAMVlsz5HLYnjlgbm
	h6uJuPueEFHf5odTLl8+F6fmWnau5UU8t3CGKKvn9o5Nqs8uxhc2qHI48vkgWde9rGcsKtYHCbHal
	+SS+Mx5YDhy+t6cLoDPQYRo6YvkaR8U9IeXOhYE1SZ3QzTkQXCFB1KZfvabk8kpaRqeIea618D3n6
	R8N/uBX9pKugcaP4WiMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtB6N-0000000C4VG-0XHc;
	Thu, 19 Feb 2026 20:58:23 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtB6J-0000000C4UV-03vM
	for linux-i3c@lists.infradead.org;
	Thu, 19 Feb 2026 20:58:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GY9uDEsp3uYvNTEwUQXRYirxmLpZgAMV9MnZWsCPR6kN85P6lTIMfnA62EdJAKKHjAMZk4PE7EW0ry6K+qTsuu7wFMtwwJGZ0FL1OHbiMPs4NLGeSe/JbroqWOP0t4HmwepZhx3UbPcx6nR74E5jZxoq/dh+MZpuuxoB2FW1z7bvmqUfPCs7vhqgEgy9/1JKCmQNbtlXof2him4q/UhhlsQFOJSidw76ivyubo9UpJQBgIVfmLMRSbakPB3aUUjEIRxC6U+I15nLCbYOH9yovGl4Uuq1ts4wJXu+oAu9vPsrgXwjR9T4Y9094V5AHzICRgQBn5MU64coYtnPLHZNwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bi9ceintS4HTZ8iJMchBM86H/2a03Mhnivg95s4fm9w=;
 b=c9cwLobyF4xZxpomGSmlJj5Lcnfl1CzBy0xTeK79msDdiHUI6lP36A01C6Ge3Yy+0vetkZ1ll9Ktsvv6DB5phbpe6rfkKmDK2hLqc1H+3Mg9X3T4+iWAF09/7DdQYveZPWLgFeqRcOkuiGcDoJO9lfb57V64yurocG+sc9FYK0yvS4D0yMUCbNyX015RSXx2JitGskvkW3zSjySZevNQPq/ErOFfPliLnehj3oIEkITSOpYYBJwZ9A1JxwnGaD7N31CBC+PLicr29IuM0bfFmcGB7ddnaeGklxZY/ebC9ocm8n3HGrn4L0ecthqit9Sm7+q5KAc4NPRrCXlsul0rdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bi9ceintS4HTZ8iJMchBM86H/2a03Mhnivg95s4fm9w=;
 b=lgt6DmiiaC1/eI1Uwx5+x6nCwy0vGcegQnMzeA+rwJ2U+AQqQYgv1zvrtbKQ5PkkimBBBdWd/dV576z3KSwoGPyi95IlUlko+2TvEeoLE8FPGrBhvrmYYN0a7ozHGpE9SJCzwy04+Zn7T4GqTtQJXj49bA7V6mFJWj6p/GfN8ZJ/uusmfJEWGzAum/8VXGcS25fEJXMKXMhWBc/c49TqO1U3ULdnJpibzVaRggpuF89UH8zaGInvQKXkQbLFBMQcx8RddJdQcahZfkbE04xn6lFufi9CFxex3zSXSeFwIYKbcXJ/HTZv1UAnU0YA6qrTY7gK1hIMXYNDLmjuMhPnTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from BESP189MB3241.EURP189.PROD.OUTLOOK.COM (2603:10a6:b10:f3::19)
 by VI6PPF19229A49E.EURP189.PROD.OUTLOOK.COM (2603:10a6:808:1::18b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 20:58:13 +0000
Received: from BESP189MB3241.EURP189.PROD.OUTLOOK.COM
 ([fe80::49f:4bc1:672f:45c8]) by BESP189MB3241.EURP189.PROD.OUTLOOK.COM
 ([fe80::49f:4bc1:672f:45c8%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 20:58:13 +0000
From: =?utf-8?q?David_Nystr=C3=B6m?= <david.nystrom@est.tech>
Date: Thu, 19 Feb 2026 21:58:03 +0100
Subject: [PATCH v6] i3c: master: Add sysfs option to rescan bus via entdaa
Message-Id: <20260219-i3c_rescan-v6-1-b81d6cc3cb30@est.tech>
X-B4-Tracking: v=1; b=H4sIAFp5l2kC/3XQ0UrEMBAF0F9Z8mxkZjJNW5/8j0UkSac2PnQlq
 WVl6b+broJtwccLc+6FuaksKUpWT6ebSjLHHC9jCfbhpMLgxjfRsStZEZAFRKujCa9JcnCj5pa
 wA8/oAFQBH0n6eL2XnV9+cv707xKmtWG9GGKeLunrvjbjevdbTLQtnlGjhoA11ChkyD9Lnh4nC
 YNae2f6X1KRDYeaHTemB3OQZivNTpp1kyxT2zsItjpI3srdG2Yu0npTVW3XkPPhIKs/SdjuZFU
 kEwN3nqDDZiOXZfkGpiurz50BAAA=
X-Change-ID: 20260116-i3c_rescan-4921d0b41a00
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Joshua Yeong <joshua.yeong@starfivetech.com>, 
 Meagan Lloyd <meaganlloyd@linux.microsoft.com>, 
 =?utf-8?q?David_Nystr=C3=B6m?= <david.nystrom@est.tech>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771534690; l=4091;
 i=david.nystrom@est.tech; s=20251215; h=from:subject:message-id;
 bh=/wH92RdZ/UeXwL6meJUagwjWB5h30MiBEwKi/PLWN44=;
 b=BMDqFO1uvw5GdJeC0etzNCx7dLFB43hbnNzR5NF4SeFC1+mtr30yPDw2HybSKP2IWkveJ8xu8
 PeqzAHZzV8RAd+W2BTIjra8wbieJ7Cpu2drTLI564w3lvvOJbeTIa1/
X-Developer-Key: i=david.nystrom@est.tech; a=ed25519;
 pk=4E3iRjA+3w+a4ykfCHDoL5z4ONs9OcY4IN3pTwIG7Bs=
X-ClientProxiedBy: LO0P265CA0004.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::14) To BESP189MB3241.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:b10:f3::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BESP189MB3241:EE_|VI6PPF19229A49E:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e496c6e-d1e8-434d-3ac0-08de6ff998e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dFlIeUxGRjlCd0JieXE5ZWpONUtvTDNtdUF1b0o0bGV1b25RUzBhUjF6b0xy?=
 =?utf-8?B?WEZSRWUxa0VEREFjcGNIbmY5RkVxdHA1eXJaTGkvSk5oT1FzeVl0WlFOMEEx?=
 =?utf-8?B?NW9QOXM5U3BhODcreFVCeW5mbDgxSkszdWo1dFF1NzdrY3BaYUloQUFGc1Ru?=
 =?utf-8?B?dmxjbnpjcGNjMjM1OVBXQ0Q1VlAwY3dsZkRJLzUxU3FuNlNXTUdUZ2xVRXV2?=
 =?utf-8?B?WkFQemNDbEpvZHpkSVc2cm8vTXhtRHlIMU5CdzlVcElIY1c4T3dSeDNTRVVD?=
 =?utf-8?B?NVlONTc5b01ESXViK2YycEJNWGxFYXovd20vZ1o2T25UMkFvd1lMUk0zTGxY?=
 =?utf-8?B?RnJHRFdkWXVYOVowckQxM0tIR0FNY3N0bW9HVTBISDc2MVN3S2FSWUVnbnpE?=
 =?utf-8?B?V29VQUYyeXhUdEhWQkcxNjc0a29vbGhxdEZKT1Bvc0c1bTI4VlFSR1RKa1BK?=
 =?utf-8?B?WGplbWIxd210OFNBOStiVTdqbWFCT21wUStJVWZ6Nlg1eXJCbVFmd2V0RU0y?=
 =?utf-8?B?RTg3bS80b1Jjc2s3Z2o5U3crMktsZWd5eWVhdXpzNy9zOHlndGVNbTVjaEtz?=
 =?utf-8?B?U3RybTFodzA5bWpBZjRhaHpSejd2WGE2VmxxQ3NZSjl3OXI5dHNTYWtibm5i?=
 =?utf-8?B?Z05XbEUwYk43Z2NyZWNjdXkwbFpJaDVUTDJtNHRjM0Jxb0svSUo0ak8zeGJQ?=
 =?utf-8?B?TXVqRE00L3d4ZEdScW5zWVBnZFdpeG1kbXhyWWxqUW9sZ2hRMlhmTjRhTEwz?=
 =?utf-8?B?MlRGNVV6bWNWdW40Tzg0TEFwMmJWMmlkNVRUS1FyOVQyWENxMHJ1cFVLQlQ3?=
 =?utf-8?B?dk4zdlJiaHY3bm41UjdLNGlnSW9LUmdCQ0xUcVpPMmZCSUp3dFhwR0tvV3ph?=
 =?utf-8?B?YVpoTFhHN2lLZnRJbVZOdEI0YXRIZUFEdzZpY3ZEYkkrM3RlbEpHUmhpQlV1?=
 =?utf-8?B?R01rMFl4NjRBSWdNTS94dWg4KzE2QUw2QW9CU0Fpc2MrYmh4S1dUMU9EOFlz?=
 =?utf-8?B?NG5NMlMwNkhIWHFTYjYyWG50b1BOQVc1SVRuRjZFQXBTdzN3MVJSMmFLeUxJ?=
 =?utf-8?B?WDhqMGpqZWpmYWZPQi90YnQ3a1dCN2JleDVXUG5qYzBaVkNRTTBiYzd6cXdU?=
 =?utf-8?B?eVh6cmpKak1Zcnl1bXlxeSt2NFhQN1RTRnFNRVhNRWRHeWtQM1pMRW1VMTla?=
 =?utf-8?B?enJ2VitjRW95QURrK01jeXZrUGNnSHJZQkc2aGpFSTBSUkc5MzhxMVhrNmwr?=
 =?utf-8?B?ekFpdnlsdUNvTndpcTZDaWpSNzVsM3JieGI3UXZNZ1dpMkdLQlc3ZlRoNDBB?=
 =?utf-8?B?WFg0My9jaFN4YnZsRnRhbHZucWloUzJjbkpkNmZCN2tENU14aE9LelVkSUtu?=
 =?utf-8?B?bmxNVGNwdTkwWmJidVFTSm1FcUVURFdYK1NhMnptR296d3YwTWZiZkVtalFZ?=
 =?utf-8?B?RmRHaWxyR1JlMkpEeXdUUW1WL1p3bUtXdGUzd2VSL0JqUGp5UW9XeTFLaXhL?=
 =?utf-8?B?UmVqRU9uUjU3OG1teTY0Y2wrdGJjQ1hhM0NjQ1RQMlJUK3l0MWkyT3FYNmd6?=
 =?utf-8?B?QXBzWEFqRnY5aUhac1o3RjRTWUt5UG8xSHlmN0hYRHdwZVlhMVpneW9Ya0Mv?=
 =?utf-8?B?a3BwSDhsc3RHSU1oWEh1bXJRaVFuc2lzckM0KzEya2xWSEdleEtNVEJBSUhS?=
 =?utf-8?B?R2ZqblBSLzE2QWs1V3dMMzVCWFdkYUNRSjRlSXlTT3htdk9Vbm9XN2ViYjJ1?=
 =?utf-8?B?djNZbEY5QTVLRTNUaVFyclZXcURsZE1TUVlobmpJUmt6K3ZBRG5VMlUzbXR6?=
 =?utf-8?B?Y0VvTmlRZXdaVW80R0MrSThqbTU3SWo0azgrb3RmbEdKNzNyMlhWQ2grcTJL?=
 =?utf-8?B?V0Y1UE9CdUpQKytiZ2pBQ05rLzNyNGNkNU9ielczU0llZWJ5THJ6VURCTGlR?=
 =?utf-8?B?TVdNQ1I4SnFxUEYvbk01RnIxQjg2aWU5SEx2NXZ3ZnVncEZZZzg3cHBNSy9p?=
 =?utf-8?B?N1JwaFlDRWhLZ3NraGtWU1VXMnR2dnhqVnN2ZnJPNFpSdENSN0x2ZUNYbHdl?=
 =?utf-8?Q?3o7QiF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BESP189MB3241.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkpRVmNjU1k0ZEdBMHVoanZIWENESHd1T3hjQWdzdVBnenhkVW9KRjRNTHd2?=
 =?utf-8?B?ejc5U1JPYzZwZ3VqcjJpeUZtMkE3aHY3aU9ud2xPZU03N1FGcGRwUm1vRDQy?=
 =?utf-8?B?aDR1am83S3A2YlhBandNcVM2YnlsRkRzMEk2MEp5NEZ4cUt2RXBFVStNSmlK?=
 =?utf-8?B?c3JIenJzV1pWYnYrVy84Qmg2VmFkMEJGVnFPY2pIS3EvbnJHc3p0YzFPbCtG?=
 =?utf-8?B?ZEN6OE1NNXc1bmVSNVhiU25rWXJEeXNOMDl5NzRkSTBZYldyRmJYVE9JWXN0?=
 =?utf-8?B?ZC9Rb2toYWNVZHdQc0VaR2tIL2djdnFnOXc1MnlqMlA5emlFQ0dYbDdsanBX?=
 =?utf-8?B?WVBtNGpPZnJ4dVBrRW8rbGNheXVOU2RDTHphejhaVjhIMkw0dkVkRlc5Mjhq?=
 =?utf-8?B?YmxGcnJIMHJ0L0ZnODJaTTQzZWR0clNKOEVBMlp6U1hHYnFVRjRlejg2ZTVE?=
 =?utf-8?B?MTVDZ0xhSDBCS2I3Vi9MbnR2MUI1L0N6K1VhU09JT2VYbllYRURIVFNoeHZU?=
 =?utf-8?B?TXByMi9JcUxnZm82TFRrbGZ0ZUk5YTVPQ25IdVpzem9zbHNxbnErNTFvbU1N?=
 =?utf-8?B?Y2RJbFl3Wkg1cXE5Zzh6b2dRR2xrd3hjOG95M05vWCt2MDJvSE55b2loN3Yr?=
 =?utf-8?B?NmlGR0dPZlVhZWc4STVVbTV4VXNZZUZyK0JIdnNpbk50Yk5YdzI2TEU4ZGtt?=
 =?utf-8?B?V2tBd0lITmphSXJTSnhMZERwYzE5czd3Q0Yvem04dVNQcVk1cEtwcitpcUo0?=
 =?utf-8?B?ZGgrK09IQnB4YWh1RG9JT1VKUEZlc3cwcU9BSUNXREhSTExueXVuaTVRbmxV?=
 =?utf-8?B?WFVmL1ZDK055VVZ4VC9GRi9Memd1YnROVVNEOEF0d2MxVUNWUnoxVDN6cWh1?=
 =?utf-8?B?R0N0ZUVOQkY4NTRCaFZKUHNTSTZmTVB2bWN2UEVYNjhjV2NwemxtRFBCWFZ2?=
 =?utf-8?B?RjNqUzhVQ1FEcEpuKzd5L2ozZDhjZXhTVmhJcm9SZm1MUng5SGRtL3ZCcmd1?=
 =?utf-8?B?S3MvbTQ2Qlh2QTEyNVdjLzduVnBVOFNuMW1YTCt4dGpyMlcyRXFzU29NTkdG?=
 =?utf-8?B?RENicm5DVWlKVFZuQVhHeFF0VHVTVnNveExmZkFMMlZRR0YzS2dyZEJHQ3BW?=
 =?utf-8?B?aDdDbDFkZUVKWEJ0NkJ3RmNpUEFVc3lmanFxdHBqaDUzeXZJZnV0NDJjT0ZR?=
 =?utf-8?B?ZmZOU2hsYXl0Y3poNGpwUkZ6V3lXeFd5V1hZNXArS3JYY2lVTDRhQ1ROT1R3?=
 =?utf-8?B?WG9iSlJxczZpbHNzS29TTitNeDJpcWlYN0hqWUY5cmNUOGJIUkJZQlltQ016?=
 =?utf-8?B?bnlBMEJQVFRobFdVMjdneUx6Z0J1OHpXTFVpUzdFMXJlclBYNi8yK29qTDZL?=
 =?utf-8?B?aDkwR0ZOd1hWdHhydzhvNUFZSWlZeVljTU1lZHVXZXFtM0kvWFhCd29ZekVK?=
 =?utf-8?B?dzYvRmhlTXpBSE43WWZsOW5LaE4xTmxUWlowM2lXUllxSnphOEpSUTdaVEhT?=
 =?utf-8?B?ckdZa3ZoR1dRNWozQW1ZNzlQallxVVZ6dGs2RjdZcWg2K0VhWkpzWCtsRzVB?=
 =?utf-8?B?MDZueGQyeDYwNHlBVk5iY1hvdU50Ni93VnBKcTNhS0RuMjNjdGFUVlAvcWV2?=
 =?utf-8?B?bWlPVUdEWStXSkhkczJYQlpKeXdkSzBnMlp2bGFqdW4zK3AwZ1pRUUFwZmtV?=
 =?utf-8?B?K3J3dXZFY0hydzNIb3hwbWxreHhpclRVR3NkcUI0dzR3NWxRZUxZb1liQVlS?=
 =?utf-8?B?NjRoQ1d4dis3dk10WERWOEpsQXViajN6b0hsMnJRWWZMQ2Rwd2MzcG1LQUlS?=
 =?utf-8?B?UVRtM3QzQm9LNk1MN0FTbURJNWQ0cWxsajkxVUgwOTVUd3VhY2txMVRqL1g5?=
 =?utf-8?B?elFSN0hMeG9DVzhkUlhud2gvMUxIenk5Q0RiZzFZTURUOG04Wmt4M0VLckwr?=
 =?utf-8?B?cE1WOVc5QmZuZXcyQ21uWXNEbGRGYnFsVnZ2Qk40WEhxbkRkQXg1aFNzZHdm?=
 =?utf-8?B?enFwZFF1eUNYQVdlK0huS1NVZG5kWVkvMzRVYXVackxnN1BCVGdBWURLM2t3?=
 =?utf-8?B?VnFlaFJUVXNSblBNVzNERFk2Q1NYV3ZodGRqSmlWblgyR25DVmVES2xoRGJY?=
 =?utf-8?B?OHh4WWVHQkltdXB0NytOWTVTbVFjcXoxM0RObDlSRndPSS92eUlmK244SzA3?=
 =?utf-8?B?MmRtMTAxNkkzNGxhT1g0ZmNBOVdZYlU4VUpidThUSmZoOHl5UXB1RVNUNjBv?=
 =?utf-8?B?OHI0K1orQXhoVnd3SytUVTdmMlk3YTBWYVl1TGYySDlRUHZ2OURkaTVpSUhi?=
 =?utf-8?B?ZHBsRW8zelV5THJTNHBGTVhzV0VBWjRmeTZDdDhncFhIN09nRVFqQT09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e496c6e-d1e8-434d-3ac0-08de6ff998e8
X-MS-Exchange-CrossTenant-AuthSource: BESP189MB3241.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 20:58:13.7386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q3l8bxfWJnNDLOhglfLGkKJ9uIChXKroshXXcs09MH+LHVGo4i5fqChXD/2t0CQy94xUvhg8UUDHKRiVZbzIKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI6PPF19229A49E
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_125819_271568_B2488F11 
X-CRM114-Status: GOOD (  13.02  )
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

QWxsb3cgdXNlcnNwYWNlIHRvIHJlcXVlc3QgZHluYW1pYyBhZGRyZXNzIGFzc2lnbm1lbnQsIHdo
aWNoIGlzCnVzZWZ1bCBmb3IgaTNjZGV2IGRldmljZXMgd2l0aCBicm9rZW4gaG90LWpvaW4gc3Vw
cG9ydC4KVGhpcyB3aWxsIGFzc2lnbiBkeW5hbWljIGFkZHJlc3NlcyB0byBhbGwgZGV2aWNlcyBv
biB0aGUgSTNDIGJ1cwp3aGljaCBhcmUgY3VycmVudGx5IHVuYXNzaWduZWQuCgpTaWduZWQtb2Zm
LWJ5OiBEYXZpZCBOeXN0csO2bSA8ZGF2aWQubnlzdHJvbUBlc3QudGVjaD4KLS0tCkNoYW5nZXMg
aW4gdjY6Ci0gQWRkIGNoZWNrIGZvciBpbml0X2RvbmUgdG8gY2xvc2UgcmFjZSB3aXRoIGluaXQu
Ci0gTGluayB0byB2NTogaHR0cHM6Ly9wYXRjaC5tc2dpZC5saW5rLzIwMjYwMjE5LWkzY19yZXNj
YW4tdjUtMS00MjQwNGRiMjBkMThAZXN0LnRlY2gKCkNoYW5nZXMgaW4gdjU6Ci0gQ2hhbmdlIHN5
c2ZzIGludGVyZmFjZSB0byBib29sZWFuLiBDb21tZW50OiBNZWFnYW4gTGxveWQKLSBDaGFuZ2Ug
c3lzZnMgZW50cnkgbmFtZSB0byBkb19kYWE6IENvbW1lbnQgTWVnYW4gTGxveWQsIEZyYW5rIExp
Ci0gTGluayB0byB2NDogaHR0cHM6Ly9wYXRjaC5tc2dpZC5saW5rLzIwMjYwMTI2LWkzY19yZXNj
YW4tdjQtMS02YjM1NTlkODJhYmNAZXN0LnRlY2gKCkNoYW5nZXMgaW4gdjQ6Ci0gSW1wcm92ZWQg
Y29tbWl0IG1lc3NhZ2UsIG9uY2UgbW9yZS4gQ29tbWVudDogRnJhbmsgTGkKLSBBZGRlZCByZXF1
aXJlZCBkb2N1bWVudGF0aW9uIGZvciBzeXNmcyBhZGRpdGlvbi4gQ29tbWVudDogRnJhbmsgTGkK
LSBMaW5rIHRvIHYzOiBodHRwczovL3BhdGNoLm1zZ2lkLmxpbmsvMjAyNjAxMjMtaTNjX3Jlc2Nh
bi12My0xLTAyNjQyOWZhMGM2NUBlc3QudGVjaAoKQ2hhbmdlcyBpbiB2MzoKLSBSZW5hbWUgc3lz
ZnMgZW50cnkgZnJvbSByZXNjYW4gdG8gZW50ZGRhLCBDb21tZW50OiBKb3NodWEgWWVvbmcKLSBM
aW5rIHRvIHYyOiBodHRwczovL3BhdGNoLm1zZ2lkLmxpbmsvMjAyNjAxMjItaTNjX3Jlc2Nhbi12
Mi0xLTg0Yzc0YTQ4M2YwM0Blc3QudGVjaAoKQ2hhbmdlcyBpbiB2MjoKLSBJbXByb3ZlZCB0aGUg
Y29tbWl0IG1lc3NhZ2Ugd2l0aCB3aHkuCi0gTGluayB0byB2MTogaHR0cHM6Ly9wYXRjaC5tc2dp
ZC5saW5rLzIwMjYwMTIyLWkzY19yZXNjYW4tdjEtMS0wYzE3MDcxZTIzMmJAZXN0LnRlY2gKLS0t
CiBEb2N1bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLWJ1cy1pM2MgfCAyMCArKysrKysrKysr
KysrKysrKysrKwogZHJpdmVycy9pM2MvbWFzdGVyLmMgICAgICAgICAgICAgICAgICAgIHwgMjcg
KysrKysrKysrKysrKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDQ3IGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLWJ1cy1p
M2MgYi9Eb2N1bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLWJ1cy1pM2MKaW5kZXggYzFlMDQ4
OTU3YTAxLi4xOWY1Y2Y4YjFiMTEgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vQUJJL3Rlc3Rp
bmcvc3lzZnMtYnVzLWkzYworKysgYi9Eb2N1bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLWJ1
cy1pM2MKQEAgLTE3MiwzICsxNzIsMjMgQEAgRGVzY3JpcHRpb246CiAJCXRoZSBhdXRvbWF0aWMg
cmV0cmllcy4gRXhpc3Qgb25seSB3aGVuIEkzQyBjb25zdHJvbGxlciBzdXBwb3J0cwogCQl0aGlz
IHJldHJ5IG9uIG5hY2sgZmVhdHVyZS4KIAorV2hhdDoJCS9zeXMvYnVzL2kzYy9kZXZpY2VzL2kz
Yy08YnVzLWlkPi9kb19kYWEKK0tlcm5lbFZlcnNpb246ICA3LjAKK0NvbnRhY3Q6CWxpbnV4LWkz
Y0B2Z2VyLmtlcm5lbC5vcmcKK0Rlc2NyaXB0aW9uOgorCQlXcml0ZS1vbmx5IGF0dHJpYnV0ZSB0
aGF0IHRyaWdnZXJzIGEgRHluYW1pYyBBZGRyZXNzIEFzc2lnbm1lbnQKKwkJKERBQSkgcHJvY2Vk
dXJlIHdoaWNoIGRpc2NvdmVycyBuZXcgSTNDIGRldmljZXMgb24gdGhlIGJ1cy4KKwkJV3JpdGlu
ZyBhIGJvb2xlYW4gdHJ1ZSB2YWx1ZSAoMSwgeSwgeWVzLCB0cnVlLCBvbikgdG8gdGhpcworCQlh
dHRyaWJ1dGUgY2F1c2VzIHRoZSBtYXN0ZXIgY29udHJvbGxlciB0byBwZXJmb3JtIERBQSwgd2hp
Y2gKKwkJaW5jbHVkZXMgYnJvYWRjYXN0aW5nIGFuIEVOVERBQSAoRW50ZXIgRHluYW1pYyBBZGRy
ZXNzIEFzc2lnbm1lbnQpCisJCUNvbW1vbiBDb21tYW5kIENvZGUgKENDQykgb24gdGhlIGJ1cy4g
V3JpdGluZyBhIGZhbHNlIHZhbHVlCisJCXJldHVybnMgLUVJTlZBTC4KKworCQlUaGlzIGlzIHVz
ZWZ1bCBmb3IgZGlzY292ZXJpbmcgSTNDIGRldmljZXMgdGhhdCB3ZXJlIG5vdCBwcmVzZW50CisJ
CWR1cmluZyBpbml0aWFsIGJ1cyBpbml0aWFsaXphdGlvbiBhbmQgYXJlIHVuYWJsZSB0byBpc3N1
ZQorCQlIb3QtSm9pbi4gT25seSBkZXZpY2VzIHdpdGhvdXQgYSBjdXJyZW50bHkgYXNzaWduZWQg
ZHluYW1pYyBhZGRyZXNzCisJCXdpbGwgcmVzcG9uZCB0byB0aGUgRU5UREFBIGJyb2FkY2FzdCBh
bmQgYmUgYXNzaWduZWQgYWRkcmVzc2VzLgorCisJCU5vdGUgdGhhdCB0aGlzIG1lY2hhbmlzbSBp
cyBkaXN0aW5jdCBmcm9tIEhvdC1Kb2luLCBzaW5jZSB0aGlzIGlzCisJCWNvbnRyb2xsZXItaW5p
dGlhdGVkIGRpc2NvdmVyeSwgd2hpbGUgSG90LUpvaW4gaXMgZGV2aWNlLWluaXRpYXRlZAorCQlt
ZXRob2QgdG8gcHJvdm9rZSBjb250cm9sbGVyIGRpc2NvdmVyeSBwcm9jZWR1cmUuCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIuYyBiL2RyaXZlcnMvaTNjL21hc3Rlci5jCmluZGV4IDBl
YWUxOWIzODIzZC4uOGY0OWQ0YWQ0NzNkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIu
YworKysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIuYwpAQCAtNzU4LDYgKzc1OCwzMiBAQCBzdGF0aWMg
c3NpemVfdCBkZXZfbmFja19yZXRyeV9jb3VudF9zdG9yZShzdHJ1Y3QgZGV2aWNlICpkZXYsCiAK
IHN0YXRpYyBERVZJQ0VfQVRUUl9SVyhkZXZfbmFja19yZXRyeV9jb3VudCk7CiAKK3N0YXRpYyBz
c2l6ZV90IGRvX2RhYV9zdG9yZShzdHJ1Y3QgZGV2aWNlICpkZXYsCisJCQkgICAgc3RydWN0IGRl
dmljZV9hdHRyaWJ1dGUgKmF0dHIsCisJCQkgICAgY29uc3QgY2hhciAqYnVmLCBzaXplX3QgY291
bnQpCit7CisJc3RydWN0IGkzY19tYXN0ZXJfY29udHJvbGxlciAqbWFzdGVyID0gZGV2X3RvX2kz
Y21hc3RlcihkZXYpOworCWJvb2wgdmFsOworCWludCByZXQ7CisKKwlpZiAoa3N0cnRvYm9vbChi
dWYsICZ2YWwpKQorCQlyZXR1cm4gLUVJTlZBTDsKKworCWlmICghdmFsKQorCQlyZXR1cm4gLUVJ
TlZBTDsKKworCWlmICghbWFzdGVyLT5pbml0X2RvbmUpCisJCXJldHVybiAtRUFHQUlOOworCisJ
cmV0ID0gaTNjX21hc3Rlcl9kb19kYWEobWFzdGVyKTsKKwlpZiAocmV0KQorCQlyZXR1cm4gcmV0
OworCisJcmV0dXJuIGNvdW50OworfQorCitzdGF0aWMgREVWSUNFX0FUVFJfV08oZG9fZGFhKTsK
Kwogc3RhdGljIHN0cnVjdCBhdHRyaWJ1dGUgKmkzY19tYXN0ZXJkZXZfYXR0cnNbXSA9IHsKIAkm
ZGV2X2F0dHJfbW9kZS5hdHRyLAogCSZkZXZfYXR0cl9jdXJyZW50X21hc3Rlci5hdHRyLApAQCAt
NzY5LDYgKzc5NSw3IEBAIHN0YXRpYyBzdHJ1Y3QgYXR0cmlidXRlICppM2NfbWFzdGVyZGV2X2F0
dHJzW10gPSB7CiAJJmRldl9hdHRyX2R5bmFtaWNfYWRkcmVzcy5hdHRyLAogCSZkZXZfYXR0cl9o
ZHJjYXAuYXR0ciwKIAkmZGV2X2F0dHJfaG90am9pbi5hdHRyLAorCSZkZXZfYXR0cl9kb19kYWEu
YXR0ciwKIAlOVUxMLAogfTsKIEFUVFJJQlVURV9HUk9VUFMoaTNjX21hc3RlcmRldik7CgotLS0K
YmFzZS1jb21taXQ6IDQ0OTgyZDM1MmMzMzc2N2NkOGQxOWY4MDQ0ZTdlMTE2MWE1ODdmZjcKY2hh
bmdlLWlkOiAyMDI2MDExNi1pM2NfcmVzY2FuLTQ5MjFkMGI0MWEwMAoKQmVzdCByZWdhcmRzLAot
LSAgCkRhdmlkIE55c3Ryw7ZtIDxkYXZpZC5ueXN0cm9tQGVzdC50ZWNoPgoKCi0tIApsaW51eC1p
M2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
