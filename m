Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD514EDF022
	for <linux-i3c@archiver.kernel.org>; Thu, 12 Feb 2026 02:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j87Epi3bLsmv2ePCqPTWGAfq6gKq9AkOG3xa1aBtY+k=; b=tc7LUYpimOrJUNU/fxb+0CRj6C
	5jihuM+jAJnrbbCIrF8TFLPXBCLiu6v6xjFOlr0wVS3gjs9k/csDJ9Qr8VoUSO9Hy2kxeGjFMcgX4
	0DGBedQ0alFKzCFfmQ7T1HPpjob+/YqQwNtQoxap4MmarMjqhkvhxcajHPCRLW1G5Lpb43xJxkuOY
	3tyWV9vFslc+ypdFVe1kKcrN2f8RwBZoM5T0U5RZTA1mbzN75H1AYh0bFTdMkoRSYeIvmpSDhp8Sl
	RDPqCBOz06ttj8PLMCO8ppDmVCI1SYjyLKIpDz+5rHG3J5gka2tQJOEJzvmwXnnpmWqsCEmM1UEHl
	XedccDbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMaA-00000001K1b-2dOl;
	Thu, 12 Feb 2026 02:37:30 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMa8-00000001K11-3Qu8
	for linux-i3c@lists.infradead.org;
	Thu, 12 Feb 2026 02:37:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dudc4TwsQevl31pQWQU6p6gxdI6heKDKzbSf/ePqyIeStaKRFWuHXNM9Cd2hQXZe0R5ajZUsR6kkIOOqj/1e0D8iEiYDONZm25T8jJRYjywFCny8kTwdnemxugilAZI7edeSb0OemAqNB8HuWiVFZh2VnxQBlLtjs8A0wxfghPyc+JjXueWzV32gSpelcgCGmedmA/C2TNyhe0uOP16PH/AGvKt2UI+CvGTKM6iuw5JmpnWiGBapzlkrydWje2FjLPlls1ZSTmKTQsJwiBkQGxrHnrtleFjaWAK7K3YnjP/RKXAr4sVgc/IHTkQAgkw04s/VypQZgQaElnjWeWEzKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WDBLU7a4oTIzwWhwJdTPBq3akYmnX+XNGOCVckzLOYg=;
 b=a1eZG9cA40Va6R0xqJsVoIGT9JLjR6ey40Kg75YikyTIV4iro042EG5yzGxc1Jxd0JqeyJYjaCB/RH0/PLuWo0MpKrRvMf+6GIcQwQ7IwWmhEox4XLCCiN+3Inv/ShrhZxMb2DgtlK4a0BzfGa+IFtwKWtoxoH/VdywFVkAjiy/zJSRm1Cbl1q86gitAtVFZkFS9foQ89M0SMaeJ7ihIklyahSzrgG/K+j1WdJrqi2dB/lvupvCaYheiKsFkxh5cjyMKznV5FRxqWxLa6LhjPpNvaU4BbX8Boh48V1FIcQTlimOVNPPFYI+P/VLuTuJbg/vM7VD8LBoWCdBPsFFlCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WDBLU7a4oTIzwWhwJdTPBq3akYmnX+XNGOCVckzLOYg=;
 b=DdQtlkAxFWcq+OTdNLVwIqGiIOTY/zx3470Eiy0AU4vqpDWUc8HUsyFYH+ld1TMgli9dDKRguhoSIEolgoW1stnKgKvo4W1Ke7f47hmF2iI4X/nV4gXs9ZFYMtSw5kCDmnIzZCGGpiVCQNlPw1yJYQlDdtNMQWGHrwLhd9nOfWlK03Ts2dNK6V/ksNyH6CFO0UgvnijjDqUA28/qdM4oHy3xMCNsw2/jOCbCXicZqrPpNdE2mYUqSwPUlRq5VoglHmf+eJybdn10oyDgDeDwDUW5IXeucW7fFzStky3c7Vtrk+U7FeshEYAIgJhLyAvsF3jd7NgCIzlu+IkUQFWPgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 CH4PR03MB7650.namprd03.prod.outlook.com (2603:10b6:610:235::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.10; Thu, 12 Feb 2026 02:35:54 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%4]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 02:35:54 +0000
Message-ID: <4be78b57-e2b7-43f8-be7a-e3db8f34b624@altera.com>
Date: Thu, 12 Feb 2026 10:35:48 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i3c: dw-i3c-master: Set SIR_REJECT in DAT on device
 attach and reattach
To: Frank Li <Frank.li@nxp.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <8bff67c9df8d56a3d5e0191bc935362ff6d3c573.1770796093.git.adrianhoyin.ng@altera.com>
 <aYyitDINHJNPaial@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: "Ng, Adrian Ho Yin" <adrianhoyin.ng@altera.com>
In-Reply-To: <aYyitDINHJNPaial@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: SI2PR02CA0003.apcprd02.prod.outlook.com
 (2603:1096:4:194::13) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|CH4PR03MB7650:EE_
X-MS-Office365-Filtering-Correlation-Id: 62313741-2587-4613-99ae-08de69df718f
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q3BzeU05OFVpSzZKdkhRZ1lJWnlPZXZ4RTR6bEw2Rnc4OUg5SFhTOGRYclpt?=
 =?utf-8?B?a3RrVzVYSnFaUEJna3laOEVOYU4xWE5YQzZPVlJDTjhrZWVKUVpST1k2NXdk?=
 =?utf-8?B?NzNBeVZQVUxhZ2xkK0ZVdXJzc0luRE5IT3RuVHo3ZmYvN1d5c3NBaUFVczRn?=
 =?utf-8?B?bllJWkZuUjRnRThZS05nbHdtR01QR2RYdnpUMnNwaGpqalpodjVJVDNDbTll?=
 =?utf-8?B?dENBQlkzbXRIUjVHNjVDWW5PN2JTUzNVV2h2T2RwdEZldGVFQURieHo2YU1O?=
 =?utf-8?B?YUNoaDdkOVB3OG5HY2k1OVdPU0RCRGRRVDRnQllsQ25pNGF0cjJYRStzeksv?=
 =?utf-8?B?cjdRaFE2emkrcS9veGt0SWp5M0dTZTB5WG1vaUJhMGNZckZLanVsTUwxTHA3?=
 =?utf-8?B?d01MNE5TWHo0byt5NUdJeWVTdkR0M01OZDlhOTRLV1pWN3djelJsUmo1V29o?=
 =?utf-8?B?Mk5ZZGkvWmMwWnhraVlxamMrWXFKQUVyL1pXUGp1T291UGNYNTBGT0VoUEd5?=
 =?utf-8?B?b1hkcThWMkY5RlhUUVV5dkRDMzd1dVhzclJrcm5IUmJXRzZXMlNucTA4c3Zh?=
 =?utf-8?B?elhDS2E5dUVVbmdIeE5LajM3Vm02YVB5cllNODlybmNtd25wMnIzT0M3dUpk?=
 =?utf-8?B?Z3c4ZEZoUTM4UERvOTlSN2pwcTVCcTJmS25Sck14WmFuVS9zQkFZb25rZUIz?=
 =?utf-8?B?U1lVQ0w4QVJqU3ZGTDhzWW45TDdza3ZUa3ZhMDRPRTc2SHQ3WlFUR2NhTGRU?=
 =?utf-8?B?aTUxY0d5RFBDblZZR1YvaFdORTR4WU9mVEd3SXBiUGtVelZYMWNKSDFQZnlL?=
 =?utf-8?B?TjdXRU13Y09PSXliSVUxcldtQkpKZUNoYzZRNXBBV2dWc2FCMUNMOFB5TzBC?=
 =?utf-8?B?WUVMRGtQdjNyZStNdk5aczdadWZEL1UweWVsN0hjUlBDUVVtSTF4cm96R0Vi?=
 =?utf-8?B?dldqWEYwYll0VnJ6Ti8vMXphUkJvb2RmbkdSMWJWRkZDNXFIMjFlV0w4VkdO?=
 =?utf-8?B?emhsWlZtc2N5MzZJLzh6ZGJTbUt4a3dGY2REVi9XU29UTU5lbWJuOTd6MU9x?=
 =?utf-8?B?dkRsbG5mTUVPTHNsSFdKZzRISGkzNjVSNHk5WW5VTTVMK1d0WGZsZWdhSVo2?=
 =?utf-8?B?QWhuc2JWTmNESXdaTE5FM2NHQzBRdEMrNTJ0d29NVEozVjRkRjRUY3BNdlhV?=
 =?utf-8?B?b2hFdG50dzUwR1FQeVR1ME5EbHZsOG5DUkFzVkpJVTh1Mlh0aExVZVYra3BJ?=
 =?utf-8?B?ZUVWT24xQis3U1o5TnpoTHVYcDgreVJMOW5PWnV5ZXlEVEtuZG0wYWRoa0JG?=
 =?utf-8?B?SzFIWmh1U1FKZ1FKVGU1K1Z6cngwRlJvSlZHSGExeGVqTWRHQzZoeEFVMlFG?=
 =?utf-8?B?cnFYdGk5dDhVNTVBREdkZWpHVExzaXFySFdwRWlnMGI1MEhuSXd0SVk5YmpF?=
 =?utf-8?B?ck42bDgrS3ZkeEhGbUw3WUlzbWN4V1JIcVBMUDV5S0YrT3BDcmtPK2ljSG10?=
 =?utf-8?B?K1BDZzVvdDhqSTdJQXJXWkQrWGFiSUJqR3U4dEdWb2xOaXc3b29GQTJBa0hC?=
 =?utf-8?B?K3VEc1N0ck5kRjBHRFBVdVdhMjZrbGJMMGRFVTBmSGFRWkdIK1pRRGtyRVUx?=
 =?utf-8?B?aktpUUZ1bTN4WElEZGhOM3hRUWlrVU81UHRZejdqZlJLNnNVMm9OTlFoQkp1?=
 =?utf-8?B?ZGNKNnk1aUNsOUcrS2J5UnJnOVVmbGdYd2UxR0Y5a3BpbWN1cVVRdTRnRlV3?=
 =?utf-8?B?SmtybkRZRjJQNmNkVXlSOWNpQVRHWDVySkJ1ZkN4ZStkYjFWYVRiUnFUZ21R?=
 =?utf-8?B?czkyWGE1NjN5cThFaFlNc2xhcXplRHR4ak9ZUmhGRlZ5Z3E3ZTlqQ1pQblRJ?=
 =?utf-8?B?cGZXV0RCZVp0S2dSVHhwT2NtVitIWE1vREFqWFlFU3BZNDg4bUZCY1Ixc2px?=
 =?utf-8?B?djc4M1ozQldCNHM1WmhYN2t5WDdYa0JreS95TGNQanRHdkVROUdIK0VDUWE4?=
 =?utf-8?B?Q2t0dXlFazdWWVpwOG5KQUovaEVLSnRpeGFHQWdyVWMxVEhMUU1rZXB5Z0d0?=
 =?utf-8?B?QmhORmhJMU1XbitsVVpBMU5kWlVZWmprdVRMODBsam5BMnJKSUF0YktsUzY5?=
 =?utf-8?Q?GVO4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWV4VjlPdUdoeCtCKzNIOFV1Tm1JQkxUOFRjbjNnVWZQbnNTNS9EVW1xWlpy?=
 =?utf-8?B?dUdteFlPQ1NidXVLaytOeHNCd2pWdXpXcDVNMU1PMEt5czE1cnVld1ZpWjdx?=
 =?utf-8?B?dVZ1QzJJaUFsNWtXTnNQTE03bnQrOWpsNzZpMUV5WERxbWdCK0tQUk96NCtk?=
 =?utf-8?B?bU11Nit6elBpWG5Nck9QeUc5elhIRy93S2hVVUxsNFBtMFR0SVhwb3NFSlBk?=
 =?utf-8?B?Mnc0bEh6Y0ZKVEF0WmdsbTVpU1k4aWZMWWgwd2xYMDJVbERSZmtkZE5ZNmRG?=
 =?utf-8?B?YmYwM3c3LzVSR3lucnlNTE85MTVFRHRCTnBEazFLeFNiV1kwU0JKbi9YRGRF?=
 =?utf-8?B?bUF4eW5IR1RiNlp1VkpXTUpYeDgwcC9vbWN5Ti9oUzg0dXJ1M3U5RGZJS1lS?=
 =?utf-8?B?ck8yZ3diTmMyeUU1dFZKWFRBdWhSOEhCTTJxaW16YnMrcHJMbTZkNTZwN1lj?=
 =?utf-8?B?UXVYUDVjNzRnSkpGNVg0aUtUUWNFSUsrQlBaOGR6U256ankrSVZwT3l2alR5?=
 =?utf-8?B?Nm9lYURSNG5pb2JrR3FZWmZPdmpFTWxiWGRoRWk5aHJEOVBNaWdQcnk0Z1NC?=
 =?utf-8?B?SDRYam0xRlZXdjV3L0N3VE5TbkwvcHBKcTFVKzEwaHRkYnlUMnlVYnhJTHVP?=
 =?utf-8?B?SkV6eCtPWDNvWFc2NENnOHFaMk1rYnlpSXdmZXBkTmRGM3ZzRDdFbEkwZjZk?=
 =?utf-8?B?bDZVNGZSZ3FQWXVIYWwzYmZIQ0ZJQm1sVG1xYXlPVjNkRmpKYjhmM0FFNmRq?=
 =?utf-8?B?TzBIYitlb3FqSHVuZUdPMjQ4WGU1cjZqVFlMVll5Wi84TjQyZ0wwRjJ2TDVw?=
 =?utf-8?B?emdxMFJ5S0RiK29SZlBZMXNkMUdnQlM0NmgrMDNnZmZRMERyQXR4b1M1bHRk?=
 =?utf-8?B?Ri9YNGFtVjI0NlNMaFI4eHZsMUpqTHNGZkxSV2Q4OUJadWcreTk0Y1M2MU5G?=
 =?utf-8?B?Q05rRk5mVXVYcUh6SWF5U2RNa1NpQVcvdWMraTdrcW1hZ21OeWkvajJaZkhU?=
 =?utf-8?B?Y083eUtJS1d4dFcrSGpxSGlBc3BxY0F6YkNZMHVocWZiaUJ4TklBUVY1bjB2?=
 =?utf-8?B?SUcrWHQ4QzhZTXRxSUp4NzVYL3g3ZDI1Sm1BM05IWUgzalpWWFBHbkNuZFF2?=
 =?utf-8?B?eG04NFZpK3hNYlZNcjcxcisvNEd1bklUbVFPajRzQndvQzkrbTJ0NVUzQkpV?=
 =?utf-8?B?ZHU4NE1UZks4SmJqZUVsMktyd0toMjY0S3NxT0dBUVk1YXBLanlSU1hBTklC?=
 =?utf-8?B?SkMrQklOYTlCTVJoZCtYYjJqU1dncExEa2RoRUVYNkFpM3RqajJJbndDZ0hW?=
 =?utf-8?B?cFdJUDRPN09leTJuQ2dZUStadXNEZlRvUVZ2NXQ3UWNPTFFjNS94NkxvYWF2?=
 =?utf-8?B?MkluWHlWbElweWYzalJCemtCN2Q0dDFCR0lzR29wVGpta3daUHkrbmthYVo3?=
 =?utf-8?B?VkR5TnJ5NENUNXhQUWtxK3kxREpQc005ZEljR0tIS0FXcy9WRW5kaGtvc2dT?=
 =?utf-8?B?bTRqcVJYODBzTU9YQWNUZGR4bWI1QUwwTWRtZk4rbms0eDgraWV0bEwyZE50?=
 =?utf-8?B?QzFnbU1PbXdiR0hzQldnd0t1aFk0SVhySVN6a1dlNUpOU1NtSTgwdHgvNFdQ?=
 =?utf-8?B?Q2lJVUt4b0FDWHplOGtTV2hWb2RFNTZNVkRwektxL3BZN0dTeGFkVHViTURq?=
 =?utf-8?B?UUp3VCtvS3BhUlZkbnRzSHBvVHZBcndLZ0lwa0plZ3d0WWI2cllIK0JEN1pY?=
 =?utf-8?B?bFdDVHBZcjUvQmVEMnlqWkl2V3NpdnUxdHdSOThadkY1bTEwMEYxNWlpeVhO?=
 =?utf-8?B?eVBJQ3lZY1UyNjZBa0FVckYvZTY2RkVTcml0T2N0SXhuYTUxanB6Q2JEYlJp?=
 =?utf-8?B?UVA5bmFNdGc3UnVyeHk1MStCUGc1T1NQQ3RkcU8yVEc4NlUvbnpNdnRvVCsr?=
 =?utf-8?B?clM4RVRiU3ZSenltMGZFSStGN3N4RVhHV1ZwWVozRlQ0SloxeCtndHhrZTQ1?=
 =?utf-8?B?VWJrMjBPU1RTU1piTkJwUTBCYjlGU2VKQkdjUHYwYy9hWDVIQTcwTEg4Rm9L?=
 =?utf-8?B?YnEzNFJFVjY3akNPMGlIL1d0OXY2eWlTTTlWaklPd3kra0o5Z1loalVFM3BX?=
 =?utf-8?B?bUVZaTgyVC9zS3NJMUYrcUFCWVRHWUFQazBRbzVKZzltajhldTBPcXF6TmFB?=
 =?utf-8?B?TzJqNVF5Szl5YU1LRmhzQzY2VWhmRW50ZTR2RW9FZi9pWG93TStlRDl6RnhQ?=
 =?utf-8?B?NDJzUTE4YnpvQ05wQmlFejJVVmtoRzRsQ0pYUmQ3RkkxS1hVUlMxV0VxeDlh?=
 =?utf-8?B?WjVxSC9JekNKc0l0ektaSzVRa1hkdDJ3cFJWeVRjZjZEMjg0RFk4SkdxVlFt?=
 =?utf-8?Q?im4GsQlfjtyJbFiE=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62313741-2587-4613-99ae-08de69df718f
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 02:35:54.2836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BFG5i+oQNFKDcnsEE0yDmRTolaC2IYwFBTcSLMqyzqeA7hs7PtpB/Yx0WXMO4ttbMmxALkFP8PnGjGSCD/zHoKbGmsPy9wp5qys1qPPwURA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR03MB7650
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_183728_873232_27A61432 
X-CRM114-Status: GOOD (  15.96  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On 2/11/2026 11:39 PM, Frank Li wrote:
> On Wed, Feb 11, 2026 at 03:49:21PM +0800, adrianhoyin.ng@altera.com wrote:
>> From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
>>
>> The DesignWare I3C master controller ACKs IBIs as soon as a valid
>> Device Address Table (DAT) entry is present. This can create a race
>> between device attachment (after DAA) and the point where the client
>> driver enables IBIs via i3c_device_enable_ibi().
>>
>> Set DEV_ADDR_TABLE_SIR_REJECT in the DAT entry during
>> attach_i3c_dev() and reattach_i3c_dev() so that IBIs are rejected
>> by default. The bit is cleared in enable_ibi() after ENEC is issued,
> 
> In patch, there are not clean this bit code?
>
The clear/restore handling is already implemented in
dw_i3c_master_set_sir_enabled(), which is called from
enable_ibi() and disable_ibi().

This patch only ensures SIR_REJECT is set when the DAT entry
is initially programmed during attach/reattach.

I will update the commit message in V2 for better clarity.
>> and restored in disable_ibi() after DISEC, keeping the controller
>> state aligned with the device event configuration.
>>
> 
> Fixes tags
> 
Will add Fixes tag in V2.
> Frank
>> Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
>> ---
>>   drivers/i3c/master/dw-i3c-master.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
>> index 7eb09ad10171..d014f2cd6071 100644
>> --- a/drivers/i3c/master/dw-i3c-master.c
>> +++ b/drivers/i3c/master/dw-i3c-master.c
>> @@ -1024,7 +1024,7 @@ static int dw_i3c_master_reattach_i3c_dev(struct i3c_dev_desc *dev,
>>   		master->free_pos &= ~BIT(pos);
>>   	}
>>
>> -	writel(DEV_ADDR_TABLE_DYNAMIC_ADDR(dev->info.dyn_addr),
>> +	writel(DEV_ADDR_TABLE_DYNAMIC_ADDR(dev->info.dyn_addr) | DEV_ADDR_TABLE_SIR_REJECT,
>>   	       master->regs +
>>   	       DEV_ADDR_TABLE_LOC(master->datstartaddr, data->index));
>>
>> @@ -1053,7 +1053,7 @@ static int dw_i3c_master_attach_i3c_dev(struct i3c_dev_desc *dev)
>>   	master->free_pos &= ~BIT(pos);
>>   	i3c_dev_set_master_data(dev, data);
>>
>> -	writel(DEV_ADDR_TABLE_DYNAMIC_ADDR(master->devs[pos].addr),
>> +	writel(DEV_ADDR_TABLE_DYNAMIC_ADDR(master->devs[pos].addr) | DEV_ADDR_TABLE_SIR_REJECT,
>>   	       master->regs +
>>   	       DEV_ADDR_TABLE_LOC(master->datstartaddr, data->index));
>>
>> --
>> 2.49.GIT
>>


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
