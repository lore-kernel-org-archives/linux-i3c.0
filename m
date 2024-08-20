Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 148FEC531DC
	for <linux-i3c@archiver.kernel.org>; Tue, 20 Aug 2024 16:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TOdD2k1bTNl5odB8u39sXKE7efU9D9rHS+ya8tIRKOY=; b=KAeOc3E5ODtfVr
	El747b2cc6B6pt+5k/KLtzOEXHk2Cu3lzNjTfrxmqSQt2vz0mscXn1d6o47IxIf3QaOhqwWmANfbr
	BlIBa3OBZ+8gT3YVeoirzpnRgjZ2auom/bV4Ok9Cj5tvVXZ23w0HTSe3Uep6HKrSvSbPCIXZcU8Lw
	5Lcpzh2oScVCHdzWH1Uxdh8mAR0BwenT4l5p/Y6q1DYaA5ppiY9CKtUf9E8T5H/I2Lq969YuNs/q1
	i1sBBzT+Ckzxiac2MXxz4ZcQ55cMIQQDK7AB9fQh5fj4qnGRSFCJvrC6fvv5iGNTCWvXRl0wlLqPK
	sEvxZmQmaKozYKTYnBcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgRHh-00000005usv-218Q;
	Tue, 20 Aug 2024 16:00:37 +0000
Received: from mail-westeuropeazlp170100000.outbound.protection.outlook.com ([2a01:111:f403:c201::] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgQ73-00000005cmw-20KJ
	for linux-i3c@lists.infradead.org;
	Tue, 20 Aug 2024 14:45:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EKBo52IyajZPlDQsihZMxkYnW33z2tWQMJEuae8OWc7fMiMLwQNP3VLrPn+NZOWoErhqsa0xvj+i1WuFOIFWhY3cBhr25VUutnDgdLAvFJBTcRh98jnH0YQd3gXLTqPhHMRwgzc4SrrTQXCrvBlzAusbEPNpDPbGDuXaoFM6OFbdflxfUGDQ7FPsWa3/LvA7w/O0z/XsZFu3zHrqWXqqvNbioc4H4mIrCR3OBd05JxLcft9ShonYDlys0IZEdWMEpVwkHXPWZdDnLB7SGiDPSQKoO8/TwnfLfqBf3H2KD+EDCND+hdySg3RzCUhTM6AoSN/7yiVQ01NXFd/E5hLF8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OnHzpp4NZPSUYSiQttUzH+ovjxYq3H9S4wJNgxhHmJI=;
 b=h2ZQ1tEriiqoCgw18G7Q429e+LuD15izhd1Sj8Nnlpqsk0d4q5UrLiRoaKHvPDGrzlnW9nFbNKrm9hWURQpEbudNsIPhcxs8Ow3B9a9l2bm8OlSPLG27OxJg2270IIyEWUXx35QG2SMhy9D90NPDw9WLczdMP71nFiIH5g7YyXwJuPdJ2rakHdAawsJjDdkmTIAOrN+1zuwQFyiKfxSgGmybYr+NL27KVJbR3hjVGKIDJh85I7y3H46pSx4uvHdzZ7L2ZQ5Up2V7GGFoMy0dThgedrVHywjSVHJsOwNADkUUkm4XgoIkaLbbyIXqAIosxJVhEBwWxqZpcWRT2WWHuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OnHzpp4NZPSUYSiQttUzH+ovjxYq3H9S4wJNgxhHmJI=;
 b=CYj9lVJW1KBp1QFKtwsSLrF2bPpCfhQoR1lsc7uNvjrWJBFR4q6vMI84t/1NQoejaeXZTr6TYzM/EfBEN24KY2QTsm0eeWa0/b3QqYEqjIo2rZjeDVFmcMiBsgYH5dkS7rVIMTNHvwcKKa6NrEf2v97DUZ4lRGcDZUEWsfsMktkPKPLVrPUqTlaOBKc0jY6Mo4hHiOr0CmibnFu1vlKM+vhQoNPO9jWiIhbKYy6KH2lvdXfGRCHJwshOeiprqR1JowFxY8J5k9rXDsXVBU5wLF4B4DSNT3dfxFBuEtKQIGmN0GRLl/875QqbQZn8/k3s3mUTi1mniAceZ2zY0z++Lg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM0PR04MB6916.eurprd04.prod.outlook.com (2603:10a6:208:185::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.16; Tue, 20 Aug
 2024 14:45:22 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 14:45:22 +0000
Date: Tue, 20 Aug 2024 10:45:14 -0400
From: Frank Li <Frank.li@nxp.com>
To: Stanley Chu <stanley.chuys@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Parshuram Thombare <pthombar@cadence.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Conor Culhane <conor.culhane@silvaco.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v3 01/11] i3c: master: Remove
 i3c_dev_disable_ibi_locked(olddev) on device hotjoin
Message-ID: <ZsSr+vmyzcmQIN3e@lizhi-Precision-Tower-5810>
References: <20240819-i3c_fix-v3-0-7d69f7b0a05e@nxp.com>
 <20240819-i3c_fix-v3-1-7d69f7b0a05e@nxp.com>
 <CAPwEoQOXme+GofEhpXaBBmsyGJP-QQtLMJG45PTdNsSqFn391w@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CAPwEoQOXme+GofEhpXaBBmsyGJP-QQtLMJG45PTdNsSqFn391w@mail.gmail.com>
X-ClientProxiedBy: BY5PR17CA0044.namprd17.prod.outlook.com
 (2603:10b6:a03:167::21) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM0PR04MB6916:EE_
X-MS-Office365-Filtering-Correlation-Id: fc76302a-9459-4f04-dbb1-08dcc126b834
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z3RvZUU1aUlBMHlUUk1PTHhCNmtDWTczU3ZPSkxsMmJDcW5qbmZHL3MvN2tJ?=
 =?utf-8?B?Zkw4ZlFnaDFjRWxUazRpMHhCNlVwVXpwUno3OTZDR0N0bDYyTkpJenFta2F1?=
 =?utf-8?B?Q0piVXFFbW1La1BkR1QrclZlZnJpS210L1gyV1NFWXZMRGgwNWxidWNiTVJi?=
 =?utf-8?B?eGdMTTBuVytOSzVMYW40ZEs1aHZHSmRJeFdISlJBdlpiZmtDL2JzNE0xbEpX?=
 =?utf-8?B?M21WWTVXc1dMdVBLUVRuWXJUV2o1QnJ5TkRGRmF4Z2F5K0JFTnM2T1U2WDJB?=
 =?utf-8?B?L3N5bTVYUWJYZDRFMklXdXhXVzA2VlpZMVVhUkpDMFJ4SlJQN2pHUklVVDYx?=
 =?utf-8?B?d21IRTREekNTQWJwbmdPeEVTRUJpK3F3anQxNWF5dkdjazZOeGtoQWs1Y2p5?=
 =?utf-8?B?RklEYjFmcTVMQXEyU2t5Z041ZGZvQUJodWErMDdwVG01bFhGa1NqbktkaDBT?=
 =?utf-8?B?S2hEd2JkVHdVUnFjQTR0RkYvVkJMcTYrdE0zazlldFl0aXc1WHJ6UUFodGpZ?=
 =?utf-8?B?MEhRUUQwdmlhdnRNcktZME0rRlp6ZERVc0gydE5OaE5WWEJ1dVlOTy9PWit1?=
 =?utf-8?B?WDVzWTQxVnk1WDl1MU5BWU50dmNHQ1YwS0syQ2Y3Yk9nQTV1QXZoMFBCNUZa?=
 =?utf-8?B?bmx2STZKZkpUKzNsN3NLa1lrTFM0T1ZheHZkQkRyM0JmeUV4QjZxd2M2V3l3?=
 =?utf-8?B?eG5nZzhLT0dHbTBGdlBOSFIycHlneUZvQUFVVEltMXp6VHZWWUQ0LzVMTDZW?=
 =?utf-8?B?eGlrTXJ2dEdQZDh1UGMxcVNONzg0OE9yTTZxY0NSRldmNVJrZkoraHM3OUU4?=
 =?utf-8?B?bFJQNWlaMjliRkh6MytRK3RUSlNQSlZGSTNKTzkyWTFGeU9RRE5Hek1OWkxy?=
 =?utf-8?B?S2JpclBqY1BQdk9UdUJicFVzaFFZYkluNkwzc0pMZnRoTjhrbXNRTC9wTFZx?=
 =?utf-8?B?VjNBS1RCUnFQVmU3bkNUcnMvZUFlRElTcmFvZUNuWGlkbVB2Si9iUjZ2UzIv?=
 =?utf-8?B?VE9weVpERUczbzRlajFEZmtzREdaeE1XYmpDSzd6amVicUZ0ZGwybVVGY1FC?=
 =?utf-8?B?SXFjRWNFTngrRndPTXh6bkJrZ1l1RVJGQzVLZklMZ284aGtQNjZHbkNmV1Nn?=
 =?utf-8?B?TkpYYytNdDAwRnFudVhZa2REZnNYZ1owRjJ1SDNRMEtCZGl2ZGdPYkNlY0ZB?=
 =?utf-8?B?SFgvOVl6b0x2aVhJYVpRTDdhQUVUWDZCV1ZhTGVXay9TWnRlK2doTkJQNmJr?=
 =?utf-8?B?VzJzOFBFZHBUTE9xM0QrSEtCbFJCdjV4UGZocGVUZ0hSd29MT1dQZFQxMmlL?=
 =?utf-8?B?MjBiOUtRTStseXhQNkFBTVh6V1A0R3BVaTRXQzM5SkdVRExDdTAzL2FIY1pw?=
 =?utf-8?B?WEtSUHRuZEdqMHhNOVNyWEYzTDdIekVzaCt0enA1czh5cVNnVTRRYTdsQ2Vh?=
 =?utf-8?B?KzNyMVkyYUxQVGUzQlY4cTlMOXRtaEwwanNVcGVzcmRVWUczc25PUTNkaUVI?=
 =?utf-8?B?RHc4VUcwMGsyQ2oweGtEZzVWTDRGTVN5NVZ0cnQ1dlZHMGIzSlVhblhLUlRD?=
 =?utf-8?B?dCtyM1l0ZUR3Q2VTY01aV1FGejd6bGNJekF2QzNhMWE5UGpSL1VIWWpVT3dG?=
 =?utf-8?B?M0RJL0lGMmhYQ2dxcTJxaXhEUlh4NXBNeVNxNW1lV3pCU0xjNnZZZzhJQ3Rh?=
 =?utf-8?B?RmVqQXNhNVJmODlXdld0cFFvRVdkMDNlb0trS2sxcXd0d25Sd0NLV1MrbVJQ?=
 =?utf-8?B?eEtkdWhVcG5sbUhYUk96bDdodDBhVW8zVnNlalF0b1hiQ0RubURsQzNFTlAy?=
 =?utf-8?Q?MkBT9okRB2Z/HZ3KRQaP/22gt7ktzSKofNoIM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUFtL0JpYmwvTENkUWNOMDRnaklLUUdJQUYyTXpQYzdOTTM0akdZM1B4ZWZ3?=
 =?utf-8?B?eGdQQUdjeGhFMHRlWmQwMW1OYkJzMm1qeTVHOHR5OHJKZ21TSUVLdW9icWJn?=
 =?utf-8?B?VWRxaHFvS1lwMHhnU09aZUNVUDVRbzY4R0Uzak11VVplWUJseXo1NEhwdHgr?=
 =?utf-8?B?Qi8zTjVyZDU4Z3JmaEhCOGl6bGJpeWUxblJPUUFIREZhWjdhZm9FTktUSU1F?=
 =?utf-8?B?cWRxLy94OGZvdkIzOHRkQlkvVkhRTm9wS2tFNEdwUUVBNmN1S3pHTjFKRG9J?=
 =?utf-8?B?d1llSWFSdys2YTF5ZlIwN1llM1RiMG42VWNxaGV4M0ZSdkJLRGt0ZVhyZTZv?=
 =?utf-8?B?NThjRTArVVZaNGVUQWtwOTFmZDVZY0lQUnhaR3VCajJjUE1qZFlsSnN4NWtF?=
 =?utf-8?B?d2g4dEQ0cTkwWjlTWjhDSjN2WEZ2RExxYWFTUWdMUWttdFhKTkwxcEVCU2JJ?=
 =?utf-8?B?bHNTTkF4QVVOT2Z2WnE1OXhOUUxlRStpaW5xV1loWmxwR3ZQWUxIWkhwVzdO?=
 =?utf-8?B?TUdrczJqT3JTVks3N2pzcm05QUJZUGRZNzM4b2tGdjQ1cGMrUUhTUW00Q1N4?=
 =?utf-8?B?dndpT1FlcWNEcWU1MzlsOThBUXlINE1FVzZteldQWFNUdVVzVldNT3BFS0Jq?=
 =?utf-8?B?c3Zna05MQVdJdDBzeFViMmlTdFQ1ZG95NHFqd3lOWjYxS1VhbEsvUW5HeW5N?=
 =?utf-8?B?RnZrV2gvbWZkSXhpV3JwMUo4K2VTTlBDVzlSa2VRTWgyR3VkSUdPRHJVQ1dE?=
 =?utf-8?B?MGI5SWlkdzJkQ2dRRzZVUXV5NkF2SDIxekExS3VCS01zMDdaS2syV0FlMER4?=
 =?utf-8?B?eUdxZmNMK0ZtWFZGR1Q3ZEM5REpTMk1hUFFRR3EvcnI3S1V5UkZ6czZFN3g3?=
 =?utf-8?B?cjhCMmpXUGNKV3grRlorVGFQem9Zc0xSbyt6eFpsY25OR0tLSDN5VmRVeE0v?=
 =?utf-8?B?bk9NdUg0WmlGcjJKU1dQb0lRSFVNODh1T0xmbmJPbVRSZm83UVAxZVhYS0d3?=
 =?utf-8?B?cnk3RjBwTjdWMzJYaWh2ZS9CSmZWRDZNWDdlQjQvQ3V2K3RtU3VNRmlJZVB0?=
 =?utf-8?B?ZnZYdXRoK0V0UHUrdlJkb1htR3YzaExwNXVBRlNaSmxSczhvMUV0R1lnR09l?=
 =?utf-8?B?d0h2MVNwTUxCUmFGZGtGU3lrRFZVb20wV2NBVkl6WU9ueVUwajVicDdweDc5?=
 =?utf-8?B?L0x3SXdBTngyVzV5UHVzUDhEUHFKQStPM1ZReE5ENjZBeHd4S3B0WjFwOVRK?=
 =?utf-8?B?cmJBV2pZZDZiMWdCM1VhZUZNRGpjR200MUt1MkFOODNwemo4QXZpeXBKeEhM?=
 =?utf-8?B?ZzlLS3k5UHIydDV6ZnpjL05FbTVPM245VnRsNmVEQnVLeXdHVVI2WWQvNjIz?=
 =?utf-8?B?S2owcTV1ZXZ2YkRaUjAvVjBDWEtBaVNKR2NKcXFOQ0M0cmdGSnhqcG5naDB5?=
 =?utf-8?B?OTRXOFJ3UXE3VEpUUUdhZG41KzNkTndMOTNmcVRkL0MrcWxJTXhNVTRpcEg5?=
 =?utf-8?B?MXZndTJ2UFIycmVMdEEyWitGR0dPbWxhWFRRSmI3Z1F2MVR0azk1NENEak1I?=
 =?utf-8?B?RiswV095dmJndG5OaUtLblpGZzZPcVdCOTZQUG9wVXVMWWtXT1BzOGExNENu?=
 =?utf-8?B?M0FRT2Y0bjJBaFlmM1lCd2wxRHAzdEI0MUFSSlhJbHd5eGUrL2diUnFYSGk0?=
 =?utf-8?B?MC9XYzRONDgzOUY2cXpJZFlCL1FscDl3L0VJZE1uU0hVRnh6ZG1QTzNyVDFm?=
 =?utf-8?B?T2JxemRzdm5nWmI1c1dla2M3Q3Z2Y3FmVlhtcVRUUlZtbnAvMGRqbmFGOTQv?=
 =?utf-8?B?ZDU1VFo1cldURHBCMExhUmE5WFc5cTBadjFySTlNUVpnUms0TGsyM3hkVXBW?=
 =?utf-8?B?c1U0ZHQraVhQNkNvdDBoK1N2cEJId0l3Q0FuZkxFdHM4czVJQVRKLzd5STVk?=
 =?utf-8?B?VUVmbzAwT213OFN6bGpJQTJzd2x5N05JU0I1bk5GTnVYRFJDbGZXeWxRbVVF?=
 =?utf-8?B?NXJSU1BoQ3V5SjJObHIyRHorVUR5bjNERlZrNldtRktWZEFkVHJ2VnFUcDI0?=
 =?utf-8?B?QkIyQlFqS1JRRGtCM1N4SmRLTkVXamoyR1VMS0xKN21WaTg2NFJOVmk2UkEz?=
 =?utf-8?Q?OW5ToYchpg2F04xXek2bu+zDZ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc76302a-9459-4f04-dbb1-08dcc126b834
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 14:45:22.4410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: npPSB/ECdng3zrP7n0RwyWr5HcGcQ+RrRw/iah3RgH3d/4Vd93q+slIx/4X9/QDf/muQMYBAhIu/tc6CGfenPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6916
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_074533_557169_A45AB9FF 
X-CRM114-Status: GOOD (  25.44  )
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

T24gVHVlLCBBdWcgMjAsIDIwMjQgYXQgMDk6MzQ6MTFBTSArMDgwMCwgU3RhbmxleSBDaHUgd3Jv
dGU6Cj4gT24gVHVlLCBBdWcgMjAsIDIwMjQgYXQgMTI6MDLigK9BTSBGcmFuayBMaSA8RnJhbmsu
TGlAbnhwLmNvbT4gd3JvdGU6Cj4gPgo+ID4gV2hlbiBhIG5ldyBkZXZpY2UgaG90am9pbnMsIGEg
bmV3IGR5bmFtaWMgYWRkcmVzcyBpcyBhc3NpZ25lZC4KPiA+IGkzY19tYXN0ZXJfYWRkX2kzY19k
ZXZfbG9ja2VkKCkgaWRlbnRpZmllcyB0aGF0IHRoZSBkZXZpY2Ugd2FzIHByZXZpb3VzbHkKPiA+
IGF0dGFjaGVkIHRvIHRoZSBidXMgYW5kIGxvY2F0ZXMgdGhlIG9sZGRldi4KPiA+Cj4gPiBpM2Nf
bWFzdGVyX2FkZF9pM2NfZGV2X2xvY2tlZCgpCj4gPiB7Cj4gPiAgICAgLi4uCj4gPiAgICAgb2xk
ZGV2ID0gaTNjX21hc3Rlcl9zZWFyY2hfaTNjX2Rldl9kdXBsaWNhdGUobmV3ZGV2KTsKPiA+ICAg
ICAuLi4KPiA+ICAgICBpZiAob2xkZGV2KSB7Cj4gPiAgICAgICAgIC4uLgo+ID4gICAgICAgICBp
M2NfZGV2X2Rpc2FibGVfaWJpX2xvY2tlZChvbGRkZXYpOwo+ID4gICAgICAgICBeXl5eXl4KPiA+
ICAgICAgICAgVGhlIG9sZGRldiBzaG91bGQgbm90IHJlY2VpdmUgYW55IGNvbW1hbmRzIG9uIHRo
ZSBpM2MgYnVzIGFzIGl0Cj4gPiAgICAgICAgIGRvZXMgbm90IGV4aXN0IGFuZCBoYXMgYmVlbiBh
c3NpZ25lZCBhIG5ldyBhZGRyZXNzLiBUaGlzIHdpbGwKPiA+ICAgICAgICAgcmVzdWx0IGluIE5B
Q0sgb3IgdGltZW91dC4gU28gcmVtb3ZlIGl0Lgo+ID4gICAgIH0KPiA+IH0KPiA+Cj4gPiBGaXhl
czogMzE3YmFjZjk2MGE0ICgiaTNjOiBtYXN0ZXI6IGFkZCBlbmFibGUoZGlzYWJsZSkgaG90IGpv
aW4gaW4gc3lzIGVudHJ5IikKPiA+IFNpZ25lZC1vZmYtYnk6IEZyYW5rIExpIDxGcmFuay5MaUBu
eHAuY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9pM2MvbWFzdGVyLmMgfCA0ICstLS0KPiA+ICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDMgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci5jIGIvZHJpdmVycy9pM2MvbWFzdGVyLmMKPiA+
IGluZGV4IDcwMjhmMDNjMmM0MmUuLjg1MmIzMjE3OGI3MjIgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2
ZXJzL2kzYy9tYXN0ZXIuYwo+ID4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyLmMKPiA+IEBAIC0y
MDM5LDEwICsyMDM5LDggQEAgaW50IGkzY19tYXN0ZXJfYWRkX2kzY19kZXZfbG9ja2VkKHN0cnVj
dCBpM2NfbWFzdGVyX2NvbnRyb2xsZXIgKm1hc3RlciwKPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgIGliaXJlcS5tYXhfcGF5bG9hZF9sZW4gPSBvbGRkZXYtPmliaS0+bWF4X3BheWxvYWRfbGVu
Owo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgaWJpcmVxLm51bV9zbG90cyA9IG9sZGRldi0+
aWJpLT5udW1fc2xvdHM7Cj4gPgo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgaWYgKG9sZGRl
di0+aWJpLT5lbmFibGVkKSB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICBpZiAob2xkZGV2
LT5pYmktPmVuYWJsZWQpCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVuYWJs
ZV9pYmkgPSB0cnVlOwo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpM2NfZGV2
X2Rpc2FibGVfaWJpX2xvY2tlZChvbGRkZXYpOwo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAg
fQo+ID4KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGkzY19kZXZfZnJlZV9pYmlfbG9ja2Vk
KG9sZGRldik7Cj4KPiBpM2NfZGV2X2ZyZWVfaWJpX2xvY2tlZCB3aWxsIHN0aWxsIGVuY291bnRl
ciBXQVJOX09OKGRldi0+aWJpLT5lbmFibGVkKS4KClRoYW5rIHlvdSB0ZXN0IGl0LiBUaGUgYmVs
b3cgcGF0Y2ggc2hvdWxkIGZpeCB0aGlzIHByb2JsZW0uCgpodHRwczovL2xvcmUua2VybmVsLm9y
Zy9pbXgvMjAyNDA4MjAwNDM4MTguMzM1MjYxNC0xLXJhdmluZHJhLnlhc2h2YW50LnNoaW5kZUBu
eHAuY29tL1QvI3UKCj4KPiBUaGFua3MsCj4gU3RhbmxleQo+Cj4gPiAgICAgICAgICAgICAgICAg
fQo+ID4KPiA+IC0tCj4gPiAyLjM0LjEKPiA+Cj4gPgo+ID4gLS0KPiA+IGxpbnV4LWkzYyBtYWls
aW5nIGxpc3QKPiA+IGxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gPiBodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwoKLS0gCmxpbnV4LWkz
YyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
