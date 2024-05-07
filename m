Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A24C10F1A
	for <linux-i3c@archiver.kernel.org>; Tue,  7 May 2024 20:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xsZ3c6OR53/LSoIe7ZztpEtH3D8Z1DD9o9b07y3d3dE=; b=gqoUZ1+58Eu+ja
	ZVj34TuSf3oPoNOBYTcOwR+lnnWj/u40ghCkXr9XhKApA6uOsVTsj7LfvE0oC650hgC1uF9KWqpp3
	L0w+fpCPQ3AMlpmK8wDPqaGpCGjeYbpXcdli2BQVRVRSrjB4QIyiucn2bGlI7LfZdfkFMVurH4h1G
	baFY/li1lqAGzooO5noLEwQojYraValafZHQTyiPyzXIvA9QaDn+mCXLHU7wDFaQWqKb9JI1/rI6Q
	Am5Cxd2VcSITKG9D3yvxC592DiF+CBxoge5dTdBz4l0xKLTR0VnVHRXDgHkYWH4DuMBG6/rv5nnv/
	XTaKEqrR/9q25j314CDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Rf8-0000000CmnO-3SJy;
	Tue, 07 May 2024 20:43:46 +0000
Received: from mail-am0eur02on20600.outbound.protection.outlook.com ([2a01:111:f403:2606::600] helo=EUR02-AM0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Rf5-0000000CmlW-2GYT
	for linux-i3c@lists.infradead.org;
	Tue, 07 May 2024 20:43:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RniAJHX9QAXk12uEk70UXS3AquGgMbjS2OjpfAuUCeLfGknyb3psHUx3hu6ZAQf8Zeh/iIgiwS4EMjzjQkHeOdSRQxHNfCQkaig+/vsSbgdr2n2wJ/dUcSojLpHLzJHVp5Q7dwQf0UMZ4WI5F18hUHEVv7DK6Qbk+T0EWovneenpS2ZDwD97d4/WG7z3qgZjZClKqgDq/fzqin16kyagyk+kUb4UHFGBDZIYMbyttCgpFkfWdclLrjUh5q6WiKOP873tWXlMXPTR+pzqjRIcT63ekgFCBOAaqf4XU4oWxcZh2RG4/h8qsOoNI/vQn8nmwvplzfRfZzcQ4sfXfwx47A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qV44oIZVXxGjMUN038mXUA0fEvu2yZSoG67eTDt2HkM=;
 b=H5oyecKKb04h6ohmk/vTXpGgiYSfdu7laDUQ6nXNdSCkdv3vWx8cxAR8J48jE07it2K8zEnSGfgnzotGQ5fG2ylwJKMnLBCceRBSoqu36nsfSRhTaGCj/Vk8ll+N0NKApULZCtBxbNqrcZPtUqpmpt1MeCCCEvuWHc548oJ8P86lrxbpmLfwV9qSG47S/zFX0v/JXi5wwzUA8r03Sx2IM/NRcX0ZRDDSeMQwbKDcABbd0iRceErQZGQTJyXOcOBkUF0FwyhVxsMtCQgH+sIhf4cGXf1VnSNFRiZG68xKIo3KmKgwnIwmHkbcJZFY5V7G5LVmNnRP3tTab1wDOvvYQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qV44oIZVXxGjMUN038mXUA0fEvu2yZSoG67eTDt2HkM=;
 b=nkYxF85O2rB0OraZTKk1jzDTZJtMNkxG2MJ6kTsNbBOf+kjZcSKPYX4iyeQWM3J/zpOygsiVyZrg28yDYkF/Xr9bW7eJk2SxCvbxhbZKn/+Leizf2W+3ka/RBuPU0FiMgob0R+qFrOTQ3WUfg1TzrE6/JwO6Q44JXC43LqsiOt8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8576.eurprd04.prod.outlook.com (2603:10a6:102:217::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Tue, 7 May
 2024 20:43:35 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::1e67:dfc9:d0c1:fe58]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::1e67:dfc9:d0c1:fe58%7]) with mapi id 15.20.7544.041; Tue, 7 May 2024
 20:43:35 +0000
From: Frank Li <Frank.Li@nxp.com>
To: alexandre.belloni@bootlin.com
Cc: conor.culhane@silvaco.com,
	devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org,
	ilpo.jarvinen@linux.intel.com,
	imx@lists.linux.dev,
	jirislaby@kernel.org,
	joe@perches.com,
	krzysztof.kozlowski+dt@linaro.org,
	krzysztof.kozlowski@linaro.org,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	miquel.raynal@bootlin.com,
	robh@kernel.org,
	zbigniew.lukwinski@linux.intel.com
Subject: [PATCH resend v9 0/8] I3C target mode support
Date: Tue,  7 May 2024 16:43:03 -0400
Message-Id: <20240507204311.2898714-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SA1PR02CA0018.namprd02.prod.outlook.com
 (2603:10b6:806:2cf::26) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8576:EE_
X-MS-Office365-Filtering-Correlation-Id: 44a393d1-542d-4311-1d9a-08dc6ed65d71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|7416005|1800799015|376005|52116005|366007|38350700005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b3g5dWluUm9hN1pCYTZWT3VCd0RxZmZueXc5UXdNNHZYOUVyOVZPbWt3ZkJP?=
 =?utf-8?B?VWJwcGR5RWlOR2dYaUFYVWtJVTRpMEFYNkxyYnhtRjlqNWRSWkxOTElQNzRB?=
 =?utf-8?B?MHk2THJoVGdjd3VVV0NTdFd2TW5ESDJ0RTVIcmF2NzJtem5ua0s4Z0hEaHcv?=
 =?utf-8?B?RjVxRkZ6d1ZROW5VRFJuUVlGZ3lVSmF1WFQxMXMvcG1tM1FEUkpEYmRwaWFa?=
 =?utf-8?B?YkNvQ0xFUHdJQnEwUi9zUHJjMDlxdW5TQXZFd3lvZWlMZXNZalJlZU9FVEpY?=
 =?utf-8?B?MjRWVFB6a2F1T1h4UjVMWVNvdTl4MFdnZm5SaWZLZFJzcXg5WGlQWEJCYWdU?=
 =?utf-8?B?cEg1Uld0RzE3NldtYmV6c1F4RW11b1lqTjExTENGYmVlUVJwWHlRUjdjZmI5?=
 =?utf-8?B?Qm5LN2g5TGZQaUdHQlJ2S210T01tcTR3KzRxanF1TGFsSk56dlR4dEpZWDIw?=
 =?utf-8?B?ZXVVcHFwZ0FzTXBuVisrMjg3bWNCWWlZbTVaRnhvUUJxMmpWd2JmeS90UHhB?=
 =?utf-8?B?VXk4UGoxM2hONnQrcTRRWkxqMTZ0MmlaVkNuR3NNaDlHbXpOb1RtVlBvUzdX?=
 =?utf-8?B?eTRwejhwQnZFNDJ6WlM3eGtIRGMxcnhUMWk0VkZUY3FIVTJFeHNhMU1UR0ZO?=
 =?utf-8?B?ajRXVHd5SWVxWGRJRDdOWmcySlJLTzlNL0kxWXR6N1RadWNYalU2SmM1dU1M?=
 =?utf-8?B?Q3dEdG9pWk0rREF6T1lSZ2ZyN1Mzb2w1Zjg4OWx1NGQrTUI2anVZKzk5RFkx?=
 =?utf-8?B?aUkwQ3RRYVZoT2VMZVppVnNPN0VoblByNWtiSlVkME5KTjI1dm1OdDZOS1U0?=
 =?utf-8?B?cDNPL3l4dXpSS1AyT2wrd2JtbGhSa1hWOXNKVE9wenh5N2NWbVdXZC9ncldU?=
 =?utf-8?B?NlVTdGFBU3NFY21WZUFlb09vR2FVWEJEbm1BUTFGcjIrV3NVcEU5WXRvMFBD?=
 =?utf-8?B?UDMrS2c5UzRQU1B0UzVvcjFuQ3JXUHpSRmNpL3h2UDJNMDdIc0VrRGZkRnY1?=
 =?utf-8?B?TjVuQWZ2d2pWbERlN3B3bTZmbjR6WndVN01LRVJGWXB4VVVwNkcxTVhiTDd6?=
 =?utf-8?B?bDhpbWk4V3g3cm12eGw0QSsxQVUra0ZEVWVMR29uZDZDS0F2ZjhOVlFoSW0w?=
 =?utf-8?B?dFQ2SVhBaDJJTldrMnZINFBsKzJTck1lWDVObThsQ0tSRjFiL3VuZnZLK0l1?=
 =?utf-8?B?M3J1UW83Ny90MHBTbDJqZkJYQzdmUXdSNnpoWTYrS0pMM1BERlN3akgvbzVr?=
 =?utf-8?B?ZXdTNUQyWGFBNGp5WlJ1b2RGeGM1anFQZGFMT3ZJcG85Z01FWERHd1EyN0t6?=
 =?utf-8?B?UWxDMFdRR3hQVHg4RVVGdFFMMVZDcUg1TGNFdC9OSm1Ld2pZUGRVNExzb3BQ?=
 =?utf-8?B?bmNBVTRrdEo3Q2NuT2N1NURZeVJudzBjYTVqSjFNWVYvWUpsc2Vpd2o3Z3I1?=
 =?utf-8?B?TlExT00vYTlLaWNlQ1Q3OEptTC84SlZCbUJzSER1VVNidUcycEZJT3NCZGFB?=
 =?utf-8?B?M2dmcjJvR0x2dlg3Rjl3dEFQMjFrRHpmTUFqZGdIdUg1YnB0Z09SVDFvcFZh?=
 =?utf-8?B?c0pWS0psMHdzN0NqZnF2eUxsV3d4N0k2bGd3dXJNWXhqSS9CM2lMNUhHYkdH?=
 =?utf-8?B?cWxFSHJpVktEczBlanY4WDFrQzUrTDV5eHl3NWZMMEFtakhyWHovZGRxUXV5?=
 =?utf-8?B?ZzltTDZ4S1RjbFZFTkhabzR6U1V6cVhLRXN0NHMvRDRIK1NGVVAyVnJGaFd5?=
 =?utf-8?Q?t0g1FZg2atvxJr6qm2QPtcB1lxnbP7J4HuPXxnq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(376005)(52116005)(366007)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0NJaFpWTFlkL282aXZ0MXpHa2RuWjNsVlpZUzRQRkJPbXhtWFd2UHlxclVZ?=
 =?utf-8?B?M2V3TE9pMFA0NnphK2ZSUTBobTJwTmJaZkxVRWk1YUx3eXZZYTNQSUhTZ1RQ?=
 =?utf-8?B?Tm9zNVZzc1didG5MVmJaOFRobHRReURNN2tKKzlmekQxRE5NeGV2eWhIVEN2?=
 =?utf-8?B?NXJkQmJXaEVyOE16TTV2UGVKdlVXNG42ZVpFaFdzbGpINjZEOXprUFpWRkRZ?=
 =?utf-8?B?UzcvZG4zVzZZRENObHRjMVMwakRmazZGbk16Mkp3WmJrWnVnRDZyYXJNQ1pv?=
 =?utf-8?B?MU9xZ2p1MUNIWDdheWFsVjllTGJTTHUrRWpNRjhTem01RjBLUStHYjVsNlE4?=
 =?utf-8?B?NjdLbHVqWlJnOUNIb0grbi85dkV5cjNsamRBTzZia1p0cVBLcnFhU3Z0V25p?=
 =?utf-8?B?KzVsTEhRSTlFMFV0bFpTcTBVNjlHYWQrVXlIc0FkZlk5YnUrWmk0TCt6N0tr?=
 =?utf-8?B?QU11bWlYMlI1ZzVQaTFsU3F4UFMwdXA0aUlYNFF5S2NnUmVSangrMzhYWDhI?=
 =?utf-8?B?K2d2UXNiaG82b016UmFOaFlqWkZlOEwxbkRKdGdyQkVkZzN6VVh1NFBuR09Z?=
 =?utf-8?B?ZnZvTXJVSkJCYjdSWWsxR0FXYUZkWDBIWXoxSnJ4RTlPL3ZOWFhLT08rOWx5?=
 =?utf-8?B?Q2RBN2M5TzMwMExRbS9uRGlJWExtL2R3OHVQL08xNlhSU1NJWmZyOHBaMzRP?=
 =?utf-8?B?ZVNiSXF0M0JZUnFqNzdKU05kdXI4UFUrbFVyMW05QS9kdlNNUk9RdG5kcmV0?=
 =?utf-8?B?d0MvSENVOEFNRVhsam5QOFlzbEhJUVQ4Z1BLUE9YL1FHbjBhSUZRL2tXMWZh?=
 =?utf-8?B?MlNxRmRFMTI0bFFNM1VLc0RGVGdqR2o4S2ZwQUFJU0IwYm1mQ1JDV1NIcDJa?=
 =?utf-8?B?NXdsWG5xaGlyVmNuM1hybE0xbHNKR2VhTXE2eXlsMzNZcEJka1RMcE1yS1lD?=
 =?utf-8?B?QmcrTk9wK0V6eUxKWUZDbzJVMjgvbmV1YzlvbmtKMEg4ZUNFWmdpb2hSclpY?=
 =?utf-8?B?Y2FOdXJIMkQ5UEc1T2pLUXVOdEY4dE9iSTRjeTRCc1ZZbzVxWXVoTDZzcHEr?=
 =?utf-8?B?ai9aVDZ1QWgzd0lLYTN1QncvOS9yTmlpSEUzQTZobkNzdWxBMVpOWnEvZzBm?=
 =?utf-8?B?WDRSY2pRU0FqNlJtYzlvMVkycDJTY0pLN0wzRmVTdHBOYktMMGMvQWg1YlRj?=
 =?utf-8?B?RHR3UnQ5anU0WUtDVkp1MldadFdSQUtnM0JXNkhTaEpNNCtEdVVQSHpaNnRN?=
 =?utf-8?B?WnB1ZnlXTmpzQXN4V3FiYkVDYlhzMThiR3hrUElGTEtyakJ1N1M5S1NTOG5u?=
 =?utf-8?B?dDRlb2k5aURCYWlxbmlYUi9QbURqWGF6V3ZObGYzTE1YemVueHVUNzFacVRR?=
 =?utf-8?B?M09MYVhrVWtzT1VOeVp3K3RCWEZ3S2gyMnVTaHcwUVFaUkRNQXlTTXlqTmZX?=
 =?utf-8?B?a1EyZXVtS0VjOWtXRDZvNEJCbFVmSWUwd3UwWERGUzNWTUFDMEtZRG4rT0t4?=
 =?utf-8?B?VVFDRG5nQ1BGMWxoSXh5TVFkTFY0UGNGMzdkckVWanU4NEJ3MVpCS0Z4eExT?=
 =?utf-8?B?T3d5NWRZZzNkWXJIVTA5aVd0YTZPdkhhSTFscDJGdzg2SnZ5dFNzSk5HOTZj?=
 =?utf-8?B?MnNhZWRCWTI1UWc5cnFKK25EV0V3THVuU0k0MjlQVE9kNUdrbWo0czNzbHFI?=
 =?utf-8?B?M2dBWkJmUit2TDJMOXU2Q2ZyWHhlUlhKcGY4M083RmRXZUN0NnlUZjhuZnJm?=
 =?utf-8?B?SUZhNXdTRm5LbUs3Z3NVTENvZFZNbDlYTkd3UXpYS0xCNFNWYndCS2pOaWxy?=
 =?utf-8?B?WTliZlN4ODhnQjUwQWJnRmx0aitSd0JCZjhTNHZncUY2bGlBNkFIcDFFd1FB?=
 =?utf-8?B?RUsreVNTUy9EOXZ1TnNDSjg2Y1NzSlpRVjlyNnhMcXRZbXZ0NTNxUjVjWHlt?=
 =?utf-8?B?TG1WUDUrMWRmbUorUzN6aGFyMXk0RnlKcE1iMEU0VXhSMVZ4ODVEbDA2Q3h1?=
 =?utf-8?B?amJmMFFUVkx5T3V5aTZBKzQwR0QwV3BxVGtYSUx5dTljWVBXYk1pekU3YktV?=
 =?utf-8?B?ekVoaFdwZnNPekVmdzZicExqdlBSRjg3dUFnSHZDMU5lWXp5cW9ETlVhVktQ?=
 =?utf-8?Q?l/6y2I1VaOh09wzPPqXg7bDn5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44a393d1-542d-4311-1d9a-08dc6ed65d71
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 20:43:35.0769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iuHXPWexR8UqZravOKmLLAo/sY0KL0qCrWer6rA6n6hbPhc4lFGXqZ/mob08QlbV55HYUNu8YHi4P+XzoiZrpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8576
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_134343_637563_53BE73B6 
X-CRM114-Status: GOOD (  16.85  )
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

VGhpcyAgcGF0Y2ggaW50cm9kdWNlcyBzdXBwb3J0IGZvciBJM0MgdGFyZ2V0IG1vZGUsIHdoaWNo
IGlzIHJlZmVyZW5jZWQKd2l0aCBhIFBDSWUgRW5kcG9pbnQgc3lzdGVtLiBJdCBhbHNvIGVzdGFi
bGlzaGVzIGEgY29uZmlndXJhdGlvbiBmcmFtZXdvcmsKKGNvbmZpZ2ZzKSBmb3IgdGhlIEkzQyB0
YXJnZXQgY29udHJvbGxlciBkcml2ZXIgYW5kIHRoZSBJM0MgdGFyZ2V0IGZ1bmN0aW9uCmRyaXZl
cgoKVHlwaWMgdXNhZ2UgYXMKClRoZSB1c2VyIGNhbiBjb25maWd1cmUgdGhlIGkzYy10YXJnZXQt
dHR5IGRldmljZSB1c2luZyBjb25maWdmcyBlbnRyeS4gSW4Kb3JkZXIgdG8gY2hhbmdlIHRoZSB2
ZW5kb3JpZCwgdGhlIGZvbGxvd2luZyBjb21tYW5kcyBjYW4gYmUgdXNlZAoKICAgICAgICAjIGVj
aG8gMHgwMTFiID4gZnVuY3Rpb25zL3R0eS9mdW5jMS92ZW5kb3JfaWQKICAgICAgICAjIGVjaG8g
MHgxMDAwID4gZnVuY3Rpb25zL3R0eS9mdW5jMS9wYXJ0X2lkCiAgICAgICAgIyBlY2hvIDB4NiA+
IGZ1bmN0aW9ucy90dHkvdC9iY3IKCkJpbmRpbmcgaTNjLXRhcmdldC10dHkgRGV2aWNlIHRvIHRh
cmdldCBDb250cm9sbGVyCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQoKSW4gb3JkZXIgZm9yIHRoZSB0YXJnZXQgZnVuY3Rpb24gZGV2aWNlIHRvIGJlIHVz
ZWZ1bCwgaXQgaGFzIHRvIGJlIGJvdW5kIHRvCmEgSTNDIHRhcmdldCBjb250cm9sbGVyIGRyaXZl
ci4gVXNlIHRoZSBjb25maWdmcyB0byBiaW5kIHRoZSBmdW5jdGlvbgpkZXZpY2UgdG8gb25lIG9m
IHRoZSBjb250cm9sbGVyIGRyaXZlciBwcmVzZW50IGluIHRoZSBzeXN0ZW06OgoKICAgICAgICAj
IGxuIC1zIGZ1bmN0aW9ucy9wY2lfZXBmX3Rlc3QvZnVuYzEgY29udHJvbGxlcnMvNDQzMzAwMDAu
aTNjLXRhcmdldC8KCkhvc3Qgc2lkZToKICAgICAgICBjYXQgL2Rldi90dHlJM0MwClRhcmV0IHNp
ZGU6CiAgICAgICAgZWNobyBhYmMgPi9kZXYvdHR5STNDMAoKTm90ZXMgYWJvdXQgaGVhZGVyIGZp
bGVzLgoKQWJvdXQgSWxwbyBKw6RydmluZW4ncyBoZWFkZXIgZmlsZSBjb21tZW50cywgaXQgY2Fu
IHBhc3MgYnVpbGQsIHNvbWUgaGVhZGVyCnNob3VsZCBiZSBpbmNsdWRlZCBieSBvdGhlciBoZWFk
ZXIgZmlsZXMuCgpJIGFkZGVkIHNvbWUsIGJ1dCBJIGFtIG5vdCBzdXJlIHRoYXQgaXMgYWxsIG5l
ZWRzLiBUaGVyZSBtYXkgaGF2ZSB0b29scywKd2hpY2ggY2FuIGhlbHAgY2hlY2ssIGJ1dCBJIGRv
bid0IGtub3cuCgpDaGFnbmUgZnJvbSB2MiB0byB2MwotIHVzaW5nICdtb2RlJyBkaXN0aW5naXVz
aCBtYXN0ZXIgYW5kIHRhcmdldC4KLSBtb3ZlIHN2Yy1pM2MtdGFyZ2V0LmMgdG8gdW5kZXIgbWFz
dGVyLAotIGJ1aWx0IHRvZ2V0aGVyIHdpdGggc3ZjLWkzYy1tYXN0ZXIuYwoKQ2hhbmdlIGZyb20g
djEgdG8gdjIKLSBjaGFuZ2UgInNsYXZlIiB0byAidGFyZ2V0IgotIGluY2x1ZGUgbWFzdGVyIHNp
ZGUgdHR5IHBhdGNoCi0gZml4ZWQgZHRiY2hlY2sgcHJvYmxlbQotIGZpeGVkIGtlcm5lLWRvYyBj
aGVjayB3YXJuaW5nCgpTb21lIHJldmlldyBjb21tZW50IG1heSBiZSBsb3N0IHNpbmNlIGl0IGlz
IHF1aXRlIGxvbmcgdGltZSBzaW5jZSB2MS4gTm93Cm1hc3RlciBzaWRlIGRlcGVuZGVudCBwYXRj
aGVzIGFscmVhZHkgaW4gbGludXgtbmV4dC4gU28gc2VudCB0YXJnZXQgc2lkZQpwYXRjaGVzIHdp
dGggdHR5IHN1cHBvcnQgYWdhaW4uCgpObyBzdXJlIHdoeSBhbiBhZGRpdGlvbmFsICJcclxuIiBh
cHBlbmRlZC4KCkZyYW5rIExpICg4KToKICBpM2M6IGFkZCB0YXJnZXQgbW9kZSBzdXBwb3J0CiAg
ZHQtYmluZGluZ3M6IGkzYzogc3ZjOiBhZGQgcHJvcHRlcnkgbW9kZQogIERvY3VtZW50YXRpb246
IGkzYzogQWRkIEkzQyB0YXJnZXQgbW9kZSBjb250cm9sbGVyIGFuZCBmdW5jdGlvbgogIGkzYzog
c3ZjOiBBZGQgc3ZjLWkzYy1tYWluLmMgYW5kIHN2Yy1pM2MuaAogIGkzYzogdGFyZ2V0OiBhZGQg
c3ZjIHRhcmdldCBjb250cm9sbGVyIHN1cHBvcnQKICBpM2M6IHRhcmdldDogZnVuYzogYWRkIHR0
eSBkcml2ZXIKICBpM2M6IGFkZCBBUEkgaTNjX2Rldl9nZXR0c3RhdHVzX2Zvcm1hdDEoKSB0byBn
ZXQgdGFyZ2V0IGRldmljZSBzdGF0dXMKICB0dHk6IGkzYzogYWRkIFRUWSBvdmVyIEkzQyBtYXN0
ZXIgc3VwcG9ydAoKIC4uLi9iaW5kaW5ncy9pM2Mvc2lsdmFjbyxpM2MtbWFzdGVyLnlhbWwgICAg
ICB8ICAxMSArLQogRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL2kzYy9pbmRleC5yc3QgICAgICAg
IHwgICAxICsKIC4uLi9kcml2ZXItYXBpL2kzYy90YXJnZXQvaTNjLXRhcmdldC1jZnMucnN0ICB8
IDEwOSArKysKIC4uLi9kcml2ZXItYXBpL2kzYy90YXJnZXQvaTNjLXRhcmdldC5yc3QgICAgICB8
IDE4OSArKysrKwogLi4uL2RyaXZlci1hcGkvaTNjL3RhcmdldC9pM2MtdHR5LWhvd3RvLnJzdCAg
IHwgMTA5ICsrKwogRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL2kzYy90YXJnZXQvaW5kZXgucnN0
IHwgIDEzICsKIGRyaXZlcnMvaTNjL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICB8
ICAzMSArLQogZHJpdmVycy9pM2MvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
ICAzICsKIGRyaXZlcnMvaTNjL2RldmljZS5jICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAy
NCArCiBkcml2ZXJzL2kzYy9mdW5jL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgfCAgIDkg
KwogZHJpdmVycy9pM2MvZnVuYy9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgIHwgICAzICsK
IGRyaXZlcnMvaTNjL2Z1bmMvdHR5LmMgICAgICAgICAgICAgICAgICAgICAgICB8IDQ4MSArKysr
KysrKysrKwogZHJpdmVycy9pM2MvaTNjLWNmcy5jICAgICAgICAgICAgICAgICAgICAgICAgIHwg
Mzg5ICsrKysrKysrKwogZHJpdmVycy9pM2MvaW50ZXJuYWxzLmggICAgICAgICAgICAgICAgICAg
ICAgIHwgICAxICsKIGRyaXZlcnMvaTNjL21hc3Rlci5jICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAyNiArCiBkcml2ZXJzL2kzYy9tYXN0ZXIvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAg
fCAgIDMgKy0KIGRyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1haW4uYyAgICAgICAgICAgICB8
ICA4MCArKwogZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMgICAgICAgICAgIHwg
IDM0ICstCiBkcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy10YXJnZXQuYyAgICAgICAgICAgfCA3
NzYgKysrKysrKysrKysrKysrKysrCiBkcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy5oICAgICAg
ICAgICAgICAgICAgfCAgMTUgKwogZHJpdmVycy9pM2MvdGFyZ2V0LmMgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgNDUzICsrKysrKysrKysKIGRyaXZlcnMvdHR5L0tjb25maWcgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAxMyArCiBkcml2ZXJzL3R0eS9NYWtlZmlsZSAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgIDEgKwogZHJpdmVycy90dHkvaTNjX3R0eS5jICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgNDMyICsrKysrKysrKysKIGluY2x1ZGUvbGludXgvaTNjL2RldmljZS5o
ICAgICAgICAgICAgICAgICAgICB8ICAgMSArCiBpbmNsdWRlL2xpbnV4L2kzYy90YXJnZXQuaCAg
ICAgICAgICAgICAgICAgICAgfCA1NDggKysrKysrKysrKysrKwogMjYgZmlsZXMgY2hhbmdlZCwg
MzcyNCBpbnNlcnRpb25zKCspLCAzMSBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBE
b2N1bWVudGF0aW9uL2RyaXZlci1hcGkvaTNjL3RhcmdldC9pM2MtdGFyZ2V0LWNmcy5yc3QKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvaTNjL3RhcmdldC9pM2Mt
dGFyZ2V0LnJzdAogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZHJpdmVyLWFwaS9p
M2MvdGFyZ2V0L2kzYy10dHktaG93dG8ucnN0CiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRh
dGlvbi9kcml2ZXItYXBpL2kzYy90YXJnZXQvaW5kZXgucnN0CiBjcmVhdGUgbW9kZSAxMDA2NDQg
ZHJpdmVycy9pM2MvZnVuYy9LY29uZmlnCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9pM2Mv
ZnVuYy9NYWtlZmlsZQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvaTNjL2Z1bmMvdHR5LmMK
IGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2kzYy9pM2MtY2ZzLmMKIGNyZWF0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYWluLmMKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBkcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy10YXJnZXQuYwogY3JlYXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJz
L2kzYy90YXJnZXQuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvdHR5L2kzY190dHkuYwog
Y3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgvaTNjL3RhcmdldC5oCgotLSAKMi4zNC4x
CgoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
