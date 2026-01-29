Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED825D73E83
	for <linux-i3c@archiver.kernel.org>; Thu, 29 Jan 2026 21:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r3CLWMf7ek2G7XRByFc3WLPZfnQI37fqNY4awto1XoA=; b=iKx05VkQO2V3eI
	RB0ZKGiBLaQpNbawFPOJGmkVRHSrdm60YPS2toMasDdVN/yinKNU8VvRjIkogNzVWQDqEeiH7WVdo
	Ne501Hvw/UyuL7ab+M0671W7tqRXjt48twT1JSFUhBuUbcDDWK9tZOQ921GEsxXb0VPxibsz6py3N
	CBNb1iHU51zmrMngxAG8JZPmZHNjdkR6fG2yjMBr0I0LkKdFidXkdRe7AjL1OWMrgGihL+DRXF+M0
	hUcu44cm1I0hP97rLGyDJDtw2S0Dg6IwYlB/RODhvX0NTFyGzUn1otqTmRG6SCh1Soj6pGuHr+7/E
	zIgrrkWhxC5nHtpiQQaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlZ81-00000000doI-2UvV;
	Thu, 29 Jan 2026 21:00:37 +0000
Received: from mail-northeuropeazon11012044.outbound.protection.outlook.com ([52.101.66.44] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlZ7z-00000000dnn-0WlU
	for linux-i3c@lists.infradead.org;
	Thu, 29 Jan 2026 21:00:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x2fWgE4EWp8p6G8r77U2M7dJP9oe/+VFCfWgYNV2YM2jPBDqlkGRp8otOLhQ8zU3UZD0kFwD1fWrEfpenr4XPPOamGqChJQfVJtJfDdhemyL/OiCITrV+n8rImnKjsAAko/UeYzgKYS1vRCokQr5wC7iQ7ljzOmh6wOPN2v0PRk+oPzN/5AZdRQ7KXPada2jpFONsoFMWCMpl/5JalcF9bOg+HQEh4+eWm1sZDjk1nvC7ylgEnK4kDaaUKn24vpBLmYBayH4kS7Blbv6t/LySJoDEXQWN+CjpPwRwSBlA7fw9I58ZBVoVEHbSS0b3ByVg+IEfnrJsSnVVE39wKm5tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+Asj2vcwp3CsBfFn2k0hXk3PxIqQP0ePZHgBoavl5Q=;
 b=dnrIrNMolQPpqCWru6YVKBC7zF2wuUXgkiP4sz9rtokeLcxgZMGWteT7htQz4LV1IpCUAt21s8fSWXIXuEUHFXDpvUvLouhgl6cxJAId6nI/PvjTTBGFrIUAj2tBKwPCx12ORvWUFGjHr/e6w1P9ZDkJunoqN0pxSxS/1L0NEHfylDBTDbHKSua58yGfYsxGVW4Xrj2G6CJ4puCsDAMb/wA5QTLfmdaYmOnqneqI5pYQBm0LjPy+RW8IQISPoRd1Fw4oqmmn7hajGFABQqpB6EP52Q9d9hqhuTSLT9TU3yTdaPtTm/a3uImaPfKjb3pQNAznnRvHHM3c/k3DpNzVSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+Asj2vcwp3CsBfFn2k0hXk3PxIqQP0ePZHgBoavl5Q=;
 b=LweqHFLC6uOKrG5PDha7t9X7YSReAi8NaWVgpmiY219/aqlnJfusuDyZUbrPrQ5qWkx87LVlaupzIy8iWtvBfNUiGaPvuKKNHwX+S6FFxItIv6g+hL5vB8fNTvezDtmY0Cq3FbWcQxLouuOePKgxOgRx38wf0p1cfkuksVT2t/Pfe5IDOihEJRXQd+Rl96o60EI7xwksSQsnjNOP/aNiPpkRJReJIJZkRr9PiQFZtmsH8zxJRv3+7EnHRvu0ejLBRTzG//Mcv3E5ZkErk4SlzQNw/0SuEsnfpehHC0GNPVm52hZrDPCcGhKXI+h/1q5rOs9M8C+5ianXAqrH0efURg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DUZPR04MB9984.eurprd04.prod.outlook.com (2603:10a6:10:4dd::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Thu, 29 Jan
 2026 21:00:30 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9520.005; Thu, 29 Jan 2026
 21:00:28 +0000
Date: Thu, 29 Jan 2026 16:00:20 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 5/7] i3c: mipi-i3c-hci: Allow parent to manage runtime PM
Message-ID: <aXvKZK8tTnCDGzth@lizhi-Precision-Tower-5810>
References: <20260129181841.130864-1-adrian.hunter@intel.com>
 <20260129181841.130864-6-adrian.hunter@intel.com>
 <aXu8TiFpMiIVk5Iq@lizhi-Precision-Tower-5810>
 <dd681a97-de37-436b-b09e-5173c1de2f24@intel.com>
Content-Disposition: inline
In-Reply-To: <dd681a97-de37-436b-b09e-5173c1de2f24@intel.com>
X-ClientProxiedBy: BY1P220CA0002.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::6) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DUZPR04MB9984:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c593dcc-6cba-4fba-a27e-08de5f796de0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aGtDc3FHQkRROEhHV21HanNUMEtwbGVDNHMwa1N6UTVvd1hGb2JkWDhFRUpr?=
 =?utf-8?B?ajlRU2JsVmV4YU1SV2ZIMXFVTXd3L1N1UjN0Wmx6Wi9RQTBpNnk5MG0vVnYy?=
 =?utf-8?B?a2N6eGlDWFZQWHpjd1dWRUIrY3ZNSXJuQ0JYeTNnV3lnY1h6Z0U2Uk1Sb2xZ?=
 =?utf-8?B?WWtHWTVQLzhvdW9MWnV5ZkJyS1F1aklhem5UTk5ucWovNTdkd0Vzd1lhMjlN?=
 =?utf-8?B?OVFKa09sMVR0NmZlbCtJWDJXTWdiY3dnajV4Rk9zTkNUdXBLSE84WU4wYjFq?=
 =?utf-8?B?cDhWQXdFT09zbDlQcE91K0QwYkRlTGFuUzBrTkxBRS9wRTRXWmI1MWtUajV6?=
 =?utf-8?B?VE9kRlVOWURqRmhmMGtucFVkdm1mZFVEUWpGT0ovTk5NSnZsYmF5SHI5MGMv?=
 =?utf-8?B?S3NOZWorbk5GbGZaWHlyMUp0T1FhZVluclZEb1lpMjRiMDNEU0lrZkozY2hm?=
 =?utf-8?B?QzE0eW1yQmJuSTdySExYUnFYWktVTHhheWR1QVQ2ZkxQNjNvL3ZSZGpOUE5C?=
 =?utf-8?B?Rm13Z2doTnptbHIxUWc2eEVCNkhQeGU5Q0ZlclR3UktiRFZzRHZqU1NFT0h0?=
 =?utf-8?B?aUZkcWFmZVJiTndHb25qS0xiZ0RvQ3VLWnQrejdpbnFINUw5cTZpUjZBb1Q5?=
 =?utf-8?B?QTFRSnIxUjlDdUtEYkdPam5DcXBpbWE2Qml0ZDRRdWxnd2gvdUhUQ0ExR0NO?=
 =?utf-8?B?VzR2azVIQUN6QXpYbjBNYnRwZkw5R2RqMk5SaXFRSFljUytPb09GYXNXazI0?=
 =?utf-8?B?aFY4cWtieXAwV2RIajBXcEtRZWJWeDBXTlBZbGVPRzEySmxkdTJYc0dKQmwv?=
 =?utf-8?B?cHFlb3JlU3AySWJleWxEWDNHcEY1WUpFUkQyeUUrOFhoU3RHTzA5K1lncHBH?=
 =?utf-8?B?dlI4bVBLU3hsdVRONmdwVFNyTE0yNDROTWxHWHR2cUQzQTFzSmJqUStGbmhz?=
 =?utf-8?B?czVNSkc0ZkU0eFNsTXNpa1NvVkJ5YnUyb2ppTHJSUUorSVdxRnJmcFN2cS9E?=
 =?utf-8?B?STBOZW94dWtlOUZTaHZCVFg3cytZOXZCSTlGTExzZTZwYXMvUm9zZVdDbU1s?=
 =?utf-8?B?ZUFJUjRVa0hzL1FwNnNWYzRQN0VIS1FFdys5MWl6R2Y4NDl5eEE1QnhsVi9z?=
 =?utf-8?B?UmFBMXg2Q0VUSHZhaUFqZkRvZlR5MjdaSzU1Y29DVEtiWE0vVHdmSzlQdnFj?=
 =?utf-8?B?aE5pWUR2b3ZoN3NrTmxJTyt0VE9jZ2lsaS9uVFl3dHRUem9oSlI0WUdyM3Y0?=
 =?utf-8?B?YXBJNzZEb3E4cHdONUJoS2FpeG5rNDdzbytLeEtsMXRsQzMzSHBsN2kwT1Np?=
 =?utf-8?B?NVc5V1BrYUgzZUZkVVBHQlhzV1loakNXeE0yWnh6OFNyelQ3a2tnWGFrdHNs?=
 =?utf-8?B?dFJpalFXL3M4cTY5SVB6L3Rmbm9na0RTNEVoMTBXSUxFUlB5UnBXcnVLdlE2?=
 =?utf-8?B?K3BVZ2dFMU1CL3hPQzBQL0FZY0Q5ZlZMME1rZmVjVUFXcGhmR0xXRG5UWTFi?=
 =?utf-8?B?Rmo0VmJrclRaL2RpMlQ0Ky9pRDcxTUZybUdIZHpmZU5rZEFCUGt5YWRjSEZv?=
 =?utf-8?B?cEllbTFldnloRkZVWmg2R3kweHBFcXRMd2I4cXU1ZFVRRjJ6VzcwS0dZZ1p2?=
 =?utf-8?B?R21OZENCbmpQTXFlSDJpM1U3OXB4ekt4Ri9LVXNId21ZZHc4Zm8zUkVWUzYr?=
 =?utf-8?B?T3pnVzJSM1VWNDlleVJDY08zbDM4bHVETUpqbnNTRW1FOXBmUjRwMW42Q25Z?=
 =?utf-8?B?a0hYODNSdlVvczBsbTl4R3A0TGJSY08waTI1VVd2WkRYbzFTcHVWNGFwYS9I?=
 =?utf-8?B?K3ZMcGFZUUN1Z3FkL3VGTzNJdjg3TWw1aUFLL3lkRmVkZzQ3T3VsRnY3cm5v?=
 =?utf-8?B?aCs5VjI4NkxpekxIcW1GTFlCWnVZNVFjMEJmSHVPRU1Ma3RsaS8rR3N0M2xM?=
 =?utf-8?B?MnFmN3lLb2J4Q29GZkpFQXBZZU9RY2tpcGdIdVpmRmJyVlRzYk90V3cyL1NL?=
 =?utf-8?B?KzRkbFdWa1VmL2IyajZWRittdmVqMkxXSjRCKzR3c3VyVnliMXBiNzNQcUUr?=
 =?utf-8?B?Z2RyQ0J5Zld3dHBJMDl4Nk5NQ2NYd016Vk5xeG96d3JwOVd3WVU4eUt2NmVx?=
 =?utf-8?B?NWhIbDJMelVXQ2lvWXhkeHI0M2IwK0pBY3d5cFlPYUVPa0piSWsxbWpFN1dx?=
 =?utf-8?Q?BXuRnSZrMYl+yn1TLW/3Bds=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzBVV21lNW9ITTMyL095MlNlNUFmL2ZFV1V3ZmhNMlJoaEQvWkNDVFhLRTNl?=
 =?utf-8?B?M09lT0tvMDRkRHMwMW1qNDF5MXE4TXJsQU1UNmQ3WUw5SHlFYTlJRjJmakF4?=
 =?utf-8?B?OEFUcGQzekpqN0I4d1BSdkRrS0pXYW1hRHM5SjJyS1JzS3A5b1pCYU0zclR5?=
 =?utf-8?B?alZndUx1TENEcGRHN1N3UDdpaWZGY3BoSDNDL1dJVC9RTU9ycXd1TVNyeXpQ?=
 =?utf-8?B?OXRldWprSjlpV1B0amc5TnptNFE0T250amlSNDcxTzhLc1FnRjAzaGdkeWpJ?=
 =?utf-8?B?RWdocWVOekllYkh0MkY4NmZVN2RJWjJsbXFlM3ZzSzVhYXh2QnhCL25PTGZ4?=
 =?utf-8?B?YU9SU2REMVFTK09WWE8vTkdlZUdoOFc5STBmTlU0ZStncHNLaWxtM3V0TzRj?=
 =?utf-8?B?K2YzUlpYRTBya21vTkF1cFhnVXZoR1ZrK2l0WWtjZHRJWWN2a3EyMUFNQlpD?=
 =?utf-8?B?QUkwcStzanBXYVlvTW92OXlGSjRnaFN2RXVZdVcxNktTL25adjQyWG12MUhs?=
 =?utf-8?B?cStnTCtsSjJtOVVQTzN3TlJzTW9vMlUyZDJTSWVIQ1cxYS9mYUpLTWE2Q2lh?=
 =?utf-8?B?SlhqL25WUnVicVpVWGFhVWhiUUx4YWdxVXBSVDRHM291YVkreHdVY1BoZG5B?=
 =?utf-8?B?STBscklBQ0Vmbk05Y1V3NnVDVDdyL3BNRjJGWGlUai9zQzVUV2V5SWZISVZY?=
 =?utf-8?B?NXMycHIrRUVyc3dHTnZkakQ0bFFvTXl1L3hlUWdqMHVkN2tEOW9SdWFvaVNF?=
 =?utf-8?B?MjJJQXNRby8zOVBWZjJYL3BqWGZxN3lLS2d5cHRjako0dXhjSlAvcFhWTVBU?=
 =?utf-8?B?MXlpVm4yRVdkNkViVDNPTHpLYTlUbnVaMkszT1hoVlZMeFY0amlkVlR5bEwx?=
 =?utf-8?B?eUJWVTJJTlRVTjRwRWtScFR6T2dCeGszQUVhRGVSVVIvQnE1TlNrYnpLNnZq?=
 =?utf-8?B?MEdjMjlWdm52YW1sWWNFeFY4MkxiRXpkVFhvUXBMMlAza0NlMHJsVHpmOFlM?=
 =?utf-8?B?TXdDZmZlVkhDOXVsb3BGR2NmN3BTMFpxcEdEMzA4ZzRKRWJ5SnNQSkFNTElm?=
 =?utf-8?B?eUZiUVA2eW1OdXFKRjU5UCtnN2tCbVlwM1A4bWhnMmtZOW1oamEweTdPYUpO?=
 =?utf-8?B?K29KNUxySVQxNDFSZHJTb2hyMnFlWlJUSXdUck1sSEwxMUJmTnd2STZrdDND?=
 =?utf-8?B?UDJlcFlhdEtwSzFRUGw5UGdJR015RjBUV0JoRURhV2h4TVF4bnlyU0FqazlO?=
 =?utf-8?B?a3l5TE52WlFRem1iV0drLzFLWndLR2djcUtneGN1UElPVDRtQkJZeTI0VGht?=
 =?utf-8?B?TWQ5RzV3RHE4RUs1UHIxQmJnNWRZZWlGMmdBSVBJOEFIT0p1dGdtMUxjK1M3?=
 =?utf-8?B?L096bFAycmU1VFB1RERDRitLS3RiUWIwQ2ZPT0RQc3J0TWNENzBzeStGMEY4?=
 =?utf-8?B?V3J6NDNrbllHVnllT0N0TGZnQzZsbGlwYlFjZVZjVEgvVmt3L2xnYXFsajZF?=
 =?utf-8?B?Z1NiZzBOeWgySmYxUWZEd1FDRVpFME13b3VUZHovNHp1aS9UVitTNU1UR0Ir?=
 =?utf-8?B?ZGNvV0ovTi90L1BIOXZPdXFmcW5TeXFmSkxlaU1DOUtZbzQ0dVBEOWFESnZo?=
 =?utf-8?B?Z0VyMUNQN00yVUpyVTVFZGFQUFlUSk1IN01LU0ErMkNNZTlFRm9vdVNjTlRN?=
 =?utf-8?B?Ty9vT0E4RFdCZUxYMmI2TS9vcEkraVRoaDZxZmo2UVFuKzhiVUxUS1MvRGVN?=
 =?utf-8?B?U2huNStmZ3FhOEpGcjh0QmV3L1pUbmFlclhvYkRSbGYxWFVqSUtGUUg4NGpy?=
 =?utf-8?B?dVFTSnlkR0QxNzJEUjk5dzg2YjZSYjV3MUE0b2ltQVNNdzNSNU5DMUNRZEwv?=
 =?utf-8?B?SEg0V2dlazA5amZLc1Z4TnJaNHFyUXF0T1E5V1RTNCtMS2tMZ1pzQVF0d3RG?=
 =?utf-8?B?cnJ1bHpiNCs0OGNpQi9ycFdDRjR5Nk9ML0RSMDRkL0xVN0JaS3REWERpR3VX?=
 =?utf-8?B?d3EvZzJ1WGVJNW9nYzY4TGF4RERMOWRoUzZvVjRTREJMSEV1TExCK1M5SVhT?=
 =?utf-8?B?bG42YS9ZcmtrSmJ2Sjc5OGR2YkRVeUl3YWNYeDBUbytXTzBwZ2VLSWRTbEdG?=
 =?utf-8?B?dzJYNm8zTDA3d21tL2RwaVlrdzF3NmlwZGQvREpZblBuaThoZysxZFQ1a0Vw?=
 =?utf-8?B?TGRadjN2THdESEt5ZUNsTVMxb29FN2pqeDdiMlFxOER6cndtQkZoSDJWREF2?=
 =?utf-8?B?cXZJVzhHWlR2NUduYWIyM3p0T0w4UmpTMG9wdFFDR0t6WXUyU0hWNld0OXly?=
 =?utf-8?Q?FHRJFhkeL5Erbl616Q?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c593dcc-6cba-4fba-a27e-08de5f796de0
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 21:00:27.4630
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: akbtzn/zf6PA63PTdrTzftEF6ZO2sWYQ+lctayQfG+YT5AgiCC+/J8PyAo7xl1/jfuOUnNacRm1qlMjWvgGlhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9984
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_130035_313475_6E77C9F6 
X-CRM114-Status: GOOD (  32.31  )
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

T24gVGh1LCBKYW4gMjksIDIwMjYgYXQgMTA6Mjg6MTRQTSArMDIwMCwgQWRyaWFuIEh1bnRlciB3
cm90ZToKPiBPbiAyOS8wMS8yMDI2IDIyOjAwLCBGcmFuayBMaSB3cm90ZToKPiA+IE9uIFRodSwg
SmFuIDI5LCAyMDI2IGF0IDA4OjE4OjM5UE0gKzAyMDAsIEFkcmlhbiBIdW50ZXIgd3JvdGU6Cj4g
Pj4gU29tZSBwbGF0Zm9ybXMgaW1wbGVtZW50IHRoZSBNSVBJIEkzQyBIQ0kgTXVsdGktQnVzIElu
c3RhbmNlIGNhcGFiaWxpdHksCj4gPj4gd2hlcmUgYSBzaW5nbGUgcGFyZW50IGRldmljZSBob3N0
cyBtdWx0aXBsZSBJM0MgY29udHJvbGxlciBpbnN0YW5jZXMuICBJbgo+ID4+IHN1Y2ggZGVzaWdu
cywgdGhlIHBhcmVudCAtIG5vdCB0aGUgaW5kaXZpZHVhbCBjaGlsZCBpbnN0YW5jZXMgLSBtYXkg
bmVlZCB0bwo+ID4+IGNvb3JkaW5hdGUgcnVudGltZSBQTSBzbyB0aGF0IGFsbCBjb250cm9sbGVy
cyBlbnRlciBsb3ctcG93ZXIgc3RhdGVzCj4gPj4gdG9nZXRoZXIsIGFuZCBhbGwgcnVudGltZSBz
dXNwZW5kIGNhbGxiYWNrcyBhcmUgaW52b2tlZCBpbiBhIGNvbnRyb2xsZWQKPiA+PiBhbmQgc3lu
Y2hyb25pemVkIG1hbm5lci4KPiA+Pgo+ID4+IEZvciBleGFtcGxlLCBpZiB0aGUgcGFyZW50IGVu
YWJsZXMgSUJJLXdha2V1cCB3aGVuIHRyYW5zaXRpb25pbmcgaW50byBhCj4gPj4gbG93LXBvd2Vy
IHN0YXRlLAo+ID4KPiA+IERvZXMgeW91ciBoYXJkd2FyZSBzdXBwb3J0IHJlY2lldmUgSUJJIHdo
ZW4gcnVudGltZSBzdXNwZW5kPwo+Cj4gV2hlbiBydW50aW1lIHN1c3BlbmRlZCAoaW4gRDMpLCB0
aGUgaGFyZHdhcmUgZmlyc3QgdHJpZ2dlcnMgYSBQb3dlciBNYW5hZ2VtZW50Cj4gRXZlbnQgKFBN
RSkgd2hlbiB0aGUgU0RBIGxpbmUgaXMgcHVsbGVkIGxvdyB0byBzaWduYWwgdGhlIFNUQVJUIGNv
bmRpdGlvbiBvZiBhbiBJQkkuCj4gVGhlIFBDSSBzdWJzeXN0ZW0gd2lsbCB0aGVuIHJ1bnRpbWUt
cmVzdW1lIHRoZSBkZXZpY2UuICBXaGVuIHRoZSBidXMgaXMgZW5hYmxlZCwKPiB0aGUgY2xvY2sg
aXMgc3RhcnRlZCBhbmQgdGhlIElCSSBpcyByZWNlaXZlZC4KCkl0IGFsaWduIG15IGFzc3VtcHRp
b24sIHdoeSBuZWVkIGNvbXBsZXggc29sdXRpb24uCgpTREEtPlBNRS0+SVJRIHNob3VsZCBoYW5k
bGUgYnkgaGFyZHdhcmUsIHNvIGlycSBoYW5kbGUgcXVldWUgSUJJIHRvIHdvcmtpbmcKcXVldWUu
CgpJQkkgd29yayB3aWxsIHRyeSBkbyB0cmFuc2Zlciwgd2hpY2ggd2lsbCBjYWxsIHJ1bnRpbWUg
cmVzdW1lKCksIHRoZW4KdHJhbnNmZXIgZGF0YS4KCldoYXQncyBpc3N1ZT8KCkZyYW5rCgo+Cj4g
Pgo+ID4gRnJhbmsKPiA+Cj4gPj4gZXZlcnkgYnVzIGluc3RhbmNlIG11c3QgcmVtYWluIGFibGUg
dG8gcmVjZWl2ZSBJQklzIHVwCj4gPj4gdW50aWwgdGhhdCBwb2ludC4gIFRoaXMgcmVxdWlyZXMg
ZGVmZXJyaW5nIHRoZSBpbmRpdmlkdWFsIGNvbnRyb2xsZXJz4oCZCj4gPj4gcnVudGltZSBzdXNw
ZW5kIGNhbGxiYWNrcyAod2hpY2ggZGlzYWJsZSBidXMgYWN0aXZpdHkpIHVudGlsIHRoZSBwYXJl
bnQKPiA+PiBkZWNpZGVzIGl0IGlzIHNhZmUgZm9yIGFsbCBpbnN0YW5jZXMgdG8gc3VzcGVuZCB0
b2dldGhlci4KPiA+Pgo+ID4+IFRvIHN1cHBvcnQgdGhpcyB1c2FnZSBtb2RlbDoKPiA+Pgo+ID4+
ICAgKiBFeHBvcnQgdGhlIGNvbnRyb2xsZXIncyBydW50aW1lIFBNIHN1c3BlbmQvcmVzdW1lIGNh
bGxiYWNrcyBzbyB0aGF0Cj4gPj4gICAgIHRoZSBwYXJlbnQgY2FuIGludm9rZSB0aGVtIGRpcmVj
dGx5Lgo+ID4+Cj4gPj4gICAqIEFkZCBhIG5ldyBxdWlyaywgSENJX1FVSVJLX1JQTV9QQVJFTlRf
TUFOQUdFRCwgd2hpY2ggZGVzaWduYXRlcyB0aGUKPiA+PiAgICAgcGFyZW50IGRldmljZSBhcyB0
aGUgY29udHJvbGxlcuKAmXMgcnVudGltZSBQTSBkZXZpY2UgKHJwbV9kZXYpLiAgV2hlbgo+ID4+
ICAgICB1c2VkIHdpdGhvdXQgSENJX1FVSVJLX1JQTV9BTExPV0VELCB0aGlzIGFsc28gcHJldmVu
dHMgdGhlIGNoaWxkCj4gPj4gICAgIGluc3RhbmNl4oCZcyBzeXN0ZW0tc3VzcGVuZCBjYWxsYmFj
a3MgZnJvbSB1c2luZwo+ID4+ICAgICBwbV9ydW50aW1lX2ZvcmNlX3N1c3BlbmQoKS9wbV9ydW50
aW1lX2ZvcmNlX3Jlc3VtZSgpLCBzaW5jZSBydW50aW1lCj4gPj4gICAgIFBNIGlzIG1hbmFnZWQg
ZW50aXJlbHkgYnkgdGhlIHBhcmVudC4KPiA+Pgo+ID4+ICAgKiBNb3ZlIERFRkFVTFRfQVVUT1NV
U1BFTkRfREVMQVlfTVMgaW50byB0aGUgaGVhZGVyIHNvIGl0IGNhbiBiZSBzaGFyZWQKPiA+PiAg
ICAgYnkgcGFyZW50LW1hbmFnZWQgUE0gaW1wbGVtZW50YXRpb25zLgo+ID4+Cj4gPj4gVGhlIG5l
dyBxdWlyayBhbGxvd3MgcGxhdGZvcm1zIHdpdGggbXVsdGktYnVzIHBhcmVudC1tYW5hZ2VkIFBN
Cj4gPj4gaW5mcmFzdHJ1Y3R1cmUgdG8gY29ycmVjdGx5IGNvb3JkaW5hdGUgcnVudGltZSBQTSBh
Y3Jvc3MgYWxsIEkzQyBIQ0kKPiA+PiBpbnN0YW5jZXMuCj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5
OiBBZHJpYW4gSHVudGVyIDxhZHJpYW4uaHVudGVyQGludGVsLmNvbT4KPiA+PiAtLS0KPiA+PiAg
ZHJpdmVycy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9jb3JlLmMgfCAyNSArKysrKysrKysrKysr
KysrLS0tLS0tLS0tCj4gPj4gIGRyaXZlcnMvaTNjL21hc3Rlci9taXBpLWkzYy1oY2kvaGNpLmgg
IHwgIDYgKysrKysrCj4gPj4gIDIgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgOSBk
ZWxldGlvbnMoLSkKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIvbWlw
aS1pM2MtaGNpL2NvcmUuYyBiL2RyaXZlcnMvaTNjL21hc3Rlci9taXBpLWkzYy1oY2kvY29yZS5j
Cj4gPj4gaW5kZXggZWM0ZGJlNjRjMzVlLi5jYjk3NGIwZjllMTcgMTAwNjQ0Cj4gPj4gLS0tIGEv
ZHJpdmVycy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9jb3JlLmMKPiA+PiArKysgYi9kcml2ZXJz
L2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNpL2NvcmUuYwo+ID4+IEBAIC03MzMsNyArNzMzLDcgQEAg
c3RhdGljIGludCBpM2NfaGNpX3Jlc2V0X2FuZF9pbml0KHN0cnVjdCBpM2NfaGNpICpoY2kpCj4g
Pj4gIAlyZXR1cm4gMDsKPiA+PiAgfQo+ID4+Cj4gPj4gLXN0YXRpYyBpbnQgaTNjX2hjaV9ydW50
aW1lX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQo+ID4+ICtpbnQgaTNjX2hjaV9ydW50aW1l
X3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQo+ID4+ICB7Cj4gPj4gIAlzdHJ1Y3QgaTNjX2hj
aSAqaGNpID0gZGV2X2dldF9kcnZkYXRhKGRldik7Cj4gPj4gIAlpbnQgcmV0Owo+ID4+IEBAIC03
NDYsOCArNzQ2LDkgQEAgc3RhdGljIGludCBpM2NfaGNpX3J1bnRpbWVfc3VzcGVuZChzdHJ1Y3Qg
ZGV2aWNlICpkZXYpCj4gPj4KPiA+PiAgCXJldHVybiAwOwo+ID4+ICB9Cj4gPj4gK0VYUE9SVF9T
WU1CT0xfR1BMKGkzY19oY2lfcnVudGltZV9zdXNwZW5kKTsKPiA+Pgo+ID4+IC1zdGF0aWMgaW50
IGkzY19oY2lfcnVudGltZV9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQo+ID4+ICtpbnQgaTNj
X2hjaV9ydW50aW1lX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gPj4gIHsKPiA+PiAgCXN0
cnVjdCBpM2NfaGNpICpoY2kgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKPiA+PiAgCWludCByZXQ7
Cj4gPj4gQEAgLTc2OCw2ICs3NjksNyBAQCBzdGF0aWMgaW50IGkzY19oY2lfcnVudGltZV9yZXN1
bWUoc3RydWN0IGRldmljZSAqZGV2KQo+ID4+Cj4gPj4gIAlyZXR1cm4gMDsKPiA+PiAgfQo+ID4+
ICtFWFBPUlRfU1lNQk9MX0dQTChpM2NfaGNpX3J1bnRpbWVfcmVzdW1lKTsKPiA+Pgo+ID4+ICBz
dGF0aWMgaW50IGkzY19oY2lfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gPj4gIHsKPiA+
PiBAQCAtNzg0LDEyICs3ODYsMTQgQEAgc3RhdGljIGludCBpM2NfaGNpX3Jlc3VtZV9jb21tb24o
c3RydWN0IGRldmljZSAqZGV2LCBib29sIHJzdGRhYSkKPiA+PiAgCXN0cnVjdCBpM2NfaGNpICpo
Y2kgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKPiA+PiAgCWludCByZXQ7Cj4gPj4KPiA+PiAtCWlm
ICghKGhjaS0+cXVpcmtzICYgSENJX1FVSVJLX1JQTV9BTExPV0VEKSkKPiA+PiAtCQlyZXR1cm4g
MDsKPiA+PiArCWlmICghKGhjaS0+cXVpcmtzICYgSENJX1FVSVJLX1JQTV9QQVJFTlRfTUFOQUdF
RCkpIHsKPiA+PiArCQlpZiAoIShoY2ktPnF1aXJrcyAmIEhDSV9RVUlSS19SUE1fQUxMT1dFRCkp
Cj4gPj4gKwkJCXJldHVybiAwOwo+ID4+Cj4gPj4gLQlyZXQgPSBwbV9ydW50aW1lX2ZvcmNlX3Jl
c3VtZShkZXYpOwo+ID4+IC0JaWYgKHJldCkKPiA+PiAtCQlyZXR1cm4gcmV0Owo+ID4+ICsJCXJl
dCA9IHBtX3J1bnRpbWVfZm9yY2VfcmVzdW1lKGRldik7Cj4gPj4gKwkJaWYgKHJldCkKPiA+PiAr
CQkJcmV0dXJuIHJldDsKPiA+PiArCX0KPiA+Pgo+ID4+ICAJcmV0ID0gaTNjX21hc3Rlcl9kb19k
YWFfZXh0KCZoY2ktPm1hc3RlciwgcnN0ZGFhKTsKPiA+PiAgCWlmIChyZXQpCj4gPj4gQEAgLTgx
Miw4ICs4MTYsNiBAQCBzdGF0aWMgaW50IGkzY19oY2lfcmVzdG9yZShzdHJ1Y3QgZGV2aWNlICpk
ZXYpCj4gPj4gIAlyZXR1cm4gaTNjX2hjaV9yZXN1bWVfY29tbW9uKGRldiwgdHJ1ZSk7Cj4gPj4g
IH0KPiA+Pgo+ID4+IC0jZGVmaW5lIERFRkFVTFRfQVVUT1NVU1BFTkRfREVMQVlfTVMgMTAwMAo+
ID4+IC0KPiA+PiAgc3RhdGljIHZvaWQgaTNjX2hjaV9ycG1fZW5hYmxlKHN0cnVjdCBkZXZpY2Ug
KmRldikKPiA+PiAgewo+ID4+ICAJc3RydWN0IGkzY19oY2kgKmhjaSA9IGRldl9nZXRfZHJ2ZGF0
YShkZXYpOwo+ID4+IEBAIC05NjIsNiArOTY0LDExIEBAIHN0YXRpYyBpbnQgaTNjX2hjaV9wcm9i
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ID4+ICAJaWYgKGhjaS0+cXVpcmtzICYg
SENJX1FVSVJLX1JQTV9JQklfQUxMT1dFRCkKPiA+PiAgCQloY2ktPm1hc3Rlci5ycG1faWJpX2Fs
bG93ZWQgPSB0cnVlOwo+ID4+Cj4gPj4gKwlpZiAoaGNpLT5xdWlya3MgJiBIQ0lfUVVJUktfUlBN
X1BBUkVOVF9NQU5BR0VEKSB7Cj4gPj4gKwkJaGNpLT5tYXN0ZXIucnBtX2RldiA9IHBkZXYtPmRl
di5wYXJlbnQ7Cj4gPj4gKwkJaGNpLT5tYXN0ZXIucnBtX2FsbG93ZWQgPSB0cnVlOwo+ID4+ICsJ
fQo+ID4+ICsKPiA+PiAgCXJldHVybiBpM2NfbWFzdGVyX3JlZ2lzdGVyKCZoY2ktPm1hc3Rlciwg
JnBkZXYtPmRldiwgJmkzY19oY2lfb3BzLCBmYWxzZSk7Cj4gPj4gIH0KPiA+Pgo+ID4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNpL2hjaS5oIGIvZHJpdmVycy9p
M2MvbWFzdGVyL21pcGktaTNjLWhjaS9oY2kuaAo+ID4+IGluZGV4IDgxOTMyOGE4NWI4NC4uZDBl
N2FkNThhYzE1IDEwMDY0NAo+ID4+IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci9taXBpLWkzYy1o
Y2kvaGNpLmgKPiA+PiArKysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNpL2hjaS5o
Cj4gPj4gQEAgLTE0Nyw2ICsxNDcsNyBAQCBzdHJ1Y3QgaTNjX2hjaV9kZXZfZGF0YSB7Cj4gPj4g
ICNkZWZpbmUgSENJX1FVSVJLX1JFU1BfQlVGX1RITEQJCUJJVCg0KSAgLyogU2V0IHJlc3AgYnVm
IHRobGQgdG8gMCBmb3IgQU1EIHBsYXRmb3JtcyAqLwo+ID4+ICAjZGVmaW5lIEhDSV9RVUlSS19S
UE1fQUxMT1dFRAkJQklUKDUpICAvKiBSdW50aW1lIFBNIGFsbG93ZWQgKi8KPiA+PiAgI2RlZmlu
ZSBIQ0lfUVVJUktfUlBNX0lCSV9BTExPV0VECUJJVCg2KSAgLyogSUJJIGFuZCBIb3QtSm9pbiBh
bGxvd2VkIHdoaWxlIHJ1bnRpbWUgc3VzcGVuZGVkICovCj4gPj4gKyNkZWZpbmUgSENJX1FVSVJL
X1JQTV9QQVJFTlRfTUFOQUdFRAlCSVQoNykgIC8qIFJ1bnRpbWUgUE0gbWFuYWdlZCBieSBwYXJl
bnQgZGV2aWNlICovCj4gPj4KPiA+PiAgLyogZ2xvYmFsIGZ1bmN0aW9ucyAqLwo+ID4+ICB2b2lk
IG1pcGlfaTNjX2hjaV9yZXN1bWUoc3RydWN0IGkzY19oY2kgKmhjaSk7Cj4gPj4gQEAgLTE1Niw0
ICsxNTcsOSBAQCB2b2lkIGFtZF9zZXRfb2RfcHBfdGltaW5nKHN0cnVjdCBpM2NfaGNpICpoY2kp
Owo+ID4+ICB2b2lkIGFtZF9zZXRfcmVzcF9idWZfdGhsZChzdHJ1Y3QgaTNjX2hjaSAqaGNpKTsK
PiA+PiAgdm9pZCBpM2NfaGNpX3N5bmNfaXJxX2luYWN0aXZlKHN0cnVjdCBpM2NfaGNpICpoY2kp
Owo+ID4+Cj4gPj4gKyNkZWZpbmUgREVGQVVMVF9BVVRPU1VTUEVORF9ERUxBWV9NUyAxMDAwCj4g
Pj4gKwo+ID4+ICtpbnQgaTNjX2hjaV9ydW50aW1lX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2
KTsKPiA+PiAraW50IGkzY19oY2lfcnVudGltZV9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KTsK
PiA+PiArCj4gPj4gICNlbmRpZgo+ID4+IC0tCj4gPj4gMi41MS4wCj4gPj4KPgoKLS0gCmxpbnV4
LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
