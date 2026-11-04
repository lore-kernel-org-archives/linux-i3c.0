Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB52606A326
	for <linux-i3c@archiver.kernel.org>; Wed,  4 Nov 2026 05:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I3xbs5yZ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=gkL3UzfT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cqDt8ZKpLsePNRl28UkSCQUvZFV2MEf+k9KwsgwAz4s=; b=I3xbs5yZSwqUH5aW7hwvGjUofx
	UXVFx0DP4dfkVXZypoRnXqTSdj0ILQ/b6YLMA/Pyb9/SDrXD8hEDEoLEziywuBi0uNytB82n5Ur6z
	BJluN5SaYByw2O43LBGmbJYi3uUC7KuV1d4sThNTYYSoLPuzjlGRzN1f6YG3ZnUAeDutpEx3o9/fb
	tTgwXRriZbCk9EiYej47GdPJcXGtRuKV9uVjOMfyvoi9EFB1BoAVQMQOmDXwK5g/Y2R7FjZDmfVrk
	S57TCQYYh9iU3x8sns3Ajro2Ap2mfT6iaZxa50BZ1DL7Ccfl6Q2lVcv3Dqi4ZXVWavAC5rQhSay2m
	Ajmj5Znw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOTOs-00000004Kpg-1i8U;
	Wed, 04 Nov 2026 05:19:06 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOTOl-00000004Kmf-3tb5;
	Wed, 04 Nov 2026 05:19:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PT51n5CHMhXcAbCiKeP3A2vDhbGYUHV+BxgQcIa1VQ5LTOYzCXHPEcI1oom71YEAivSlLYw8nZDsoxQ1C0Oe4I/hOKNtolLv7qm5rwDoyufQAINmL7oQrpv5hHdjCeAEO8qtsZ/Q4sPA+vNzXXKP1gZPCH9oNoF0TRwc/VxAu3OcsUbJpNanv09AxdShB2ws+BehKGSAJARK8GT3DkBXG+Zpjtgu2gKxSrasCXloc8F1y3bgL+3tMI3MU9eZyQLcXkJdjS2DBiOGuMB9Vq6FvS+Bsf0/683oAifEc1JlwTzkpR6HXs3FMiCBg5GKyQjAH3pIeXyklSXmcFC3+3scKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3zw7mODbL60TzsxJg3cHiPzGSN6gF0uMBrvSx8x/wa8=;
 b=eL5cqWRpzJ6ZOba+QWptvNqqKvVlD8msigggQMGyY/OSi1Fx77peon5vQFyluHnqfXkG7h6UFXELaSqLebCJxjmpEQebQXMrzPnhlFpBj7vuBBZSmb2D3EeDci0jBo1k4KXv0hNb9xYF8gBcNKQ/uDf/lq1tHfFGTyHTGIe1cHQmVCIIu+fd1nU165GXoQYQy8yQd1oLwYnDTbGxUhNVkY7k+s+bGrURQkgSLQjq2VBp7ppmfThdTme0xAlO/npuQUbJ14znCR9FcnLCvsA8ktzPxNYuipMOjoFnmuMw3ttBvk5EAOPzhSZyhstCMu14eDPTBr/WRYyJW8nwbMJprg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3zw7mODbL60TzsxJg3cHiPzGSN6gF0uMBrvSx8x/wa8=;
 b=gkL3UzfTCgXkufcy6nEvPCQuB1eIUZI+FMg7F1WmOO6U7arJw+69uvwNinPj5+3sJbtXyXz6xwhmzw2VTwCjt9ua0nv+sO15WAnRXWHAuu/Ad/Kjmqz4H6ZE++cpbmf25WEq1t0FuctPeWEiib+4EdZJiOZ8M6oTo2StH0ShXuUqmsXyHKRKYkaT2CIeCPogaVGipbv7/Yghki7r7PoIcjT1q/uC6s9v2y1s23gw/5UitPgmFe+mY3d3q4F7ZONLWqPDeFm9eatlDXdUxCzUZaab4LbkhV+18tKZw+s4E3vIdi0BSqGXOvcwggyGbBGgOGn6V5E6pZHqTQkMxLZRQA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB5743.apcprd03.prod.outlook.com (2603:1096:400:74::7)
 by SEZPR03MB6569.apcprd03.prod.outlook.com (2603:1096:101:74::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 05:18:50 +0000
Received: from TYZPR03MB5743.apcprd03.prod.outlook.com
 ([fe80::7f51:5771:90c4:8c40]) by TYZPR03MB5743.apcprd03.prod.outlook.com
 ([fe80::7f51:5771:90c4:8c40%3]) with mapi id 15.21.0569.011; Wed, 4 Nov 2026
 05:18:49 +0000
Message-ID: <e2b65a8f-a1c3-47f6-896d-22884907d7b1@amlogic.com>
Date: Wed, 4 Nov 2026 13:18:45 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] i3c: master: svc: Add amlogic a9 support
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, imx@lists.linux.dev,
 linux-hardening@vger.kernel.org, xianwei.zhao@amlogic.com,
 Kelvin.Zhang@amlogic.com
References: <20261102-a9_i3c-v2-0-0c474bfccffa@amlogic.com>
 <20261102-a9_i3c-v2-1-0c474bfccffa@amlogic.com>
 <aukKRUYfEABgIruC@lizhi-Precision-Tower-5810>
 <2210c679-0577-49b9-b8c9-fffe1d88baed@amlogic.com>
 <auqkKAKRZZ0pA-R3@SMW015318>
Content-Language: en-GB
From: Junyi Zhao <junyi.zhao@amlogic.com>
In-Reply-To: <auqkKAKRZZ0pA-R3@SMW015318>
X-ClientProxiedBy: SI1PR02CA0020.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::9) To TYZPR03MB5743.apcprd03.prod.outlook.com
 (2603:1096:400:74::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB5743:EE_|SEZPR03MB6569:EE_
X-MS-Office365-Filtering-Correlation-Id: df342855-50f4-4565-6d2c-08df3a331bd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|261102123227099003|11063799006|4143699003|56012099006|261026121527099003|261022105027099003|261028144727099003|261021121427099003|261026140227099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: NhcrMH284r1KyuDLas8MM18ijMVBzeYQ/LKCykFlw7FRLvuE0nCeME5Dqai5LxdUtClc9aaIq05cmV9TYF8+SG/68Txb7BGHNZWtD//h4SKSy0x8wmkO1dOX+5PHevbkFpZYdHvewl9zaSs2jAbaap2LtXnbYuXDrirbm+IlVy3tKRitPK5S86758+QFk4AbfITTCp+zVS3qhC88q9XCSJ4eLJBrwUwScQSTWv8ocWDDYFJFIJx6/tKxw6nBxSwLKNgwo4Q+FDI4Einby+F67r2BjvphTEFg48hP8gByjdYIdfAGgnffKTjEm4BDgaV0gPPjLywfpsUqfE4SRcCqyaFO/NtmSq5M/L8Yomn7MiRDab43/Np1to6zcWFQx0Kh/8ZHqK7Th1EpwB3hAd7jH/XOMeKmqgHRg0BJFDwMfW25aq3E5JWX/NAeTS3oXqhrO/CuagykSWlo+lKSnLbjS23NIlGHNU1OnHf+O/Bip24A9aGi8w3O96hSYn/9QbeHjq9vRDUmsIhV9TXMXjAMLYy9aP2Lw+WLLOVsAaTf49wbJ2V9VJFNDDGHIjBg4taRC7IfLe44D+aNbx9iRH+RXyOqUoSwXeQYOnbJvaAyUckOX5mbVVWkvzifeNvikQ0UgPdU3D7OdOss2lJotzHPX/kEzJxAqFHq0m/QMx8eULA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB5743.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(261102123227099003)(11063799006)(4143699003)(56012099006)(261026121527099003)(261022105027099003)(261028144727099003)(261021121427099003)(261026140227099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmlNNmk0b015bzZhendlejN0a2ZvRjdpbk90Tk9YclA0VmdWRnAwT3orQVlw?=
 =?utf-8?B?Yy9nTW1ibkxkVVIrZFFxbGpuSHhKMkNvQlpZSWN2am4wM0JuR0hUc0l2MTVq?=
 =?utf-8?B?NVkvVW1SMDF4emVVZmZXZGZWeTczY1B1c0NMdVI4RXlqb0dqTTFYZkFERlRu?=
 =?utf-8?B?clhLenh2L2k4TXhickh2YVBZY2t1bS93dGNrZVVhYWs3dVBSb3NOTUdmVUR5?=
 =?utf-8?B?NUNzQmJEWFYyVDBxUitRRjNuSXEzVDVCb0gwN2J6VGh0akVDQnFna2hwWWZk?=
 =?utf-8?B?dHlubndhR1hOM290L28weFVCWklKR2RIT2liUjdYY3RMUEcxaC9OQzRwdDhP?=
 =?utf-8?B?Q1p0UWVDMmM2ZTZNeGFqMXBHMFRVU0pqdE1zc2tCSjlKblRWendSNWRTMjZ3?=
 =?utf-8?B?aTVUdzBTWmQ3UDBhV2E1L1FuUmxUcDhyUUtVOTVNRC9lWUxJbTBCQXlac3J4?=
 =?utf-8?B?bHdWdk96akNZTXNOL0lRWERFcFhkWThnbFJuVVhvMno0ZENIeVFjSms3ZHBL?=
 =?utf-8?B?cldLYW10eER6V3ZKS2JlNElkWTJic3pGcnJEeWxFM3NnZmQvckgxbEprc0Z6?=
 =?utf-8?B?Z1FsOWlMVTlXb2lwcUxCdFhrbDJQV1dCam5vd211MnFndS84cHNHQnh4V2R4?=
 =?utf-8?B?UEhCc0NuVzhoQWZDLzVLaGlacDRGVWFvQ3NXNVl3cTNGVkJsTnhaZFN5bThJ?=
 =?utf-8?B?c0hlakY0Mjlsd3NOejNvSEdiWUFFZ3pnNDA3QmhHN2lwWFBXbmR4aEx4NFNo?=
 =?utf-8?B?M1BVcFdhN3NEOUtYaGVhQlNZdm9oeFJHdUd0T2JSb3lMTzFRV2tYekFKWlUx?=
 =?utf-8?B?VDR3dlRONmpWMk54ekpIQW0zRTJQbHorYTJRQThKdEY1SHkycUt1QUx2RTZV?=
 =?utf-8?B?TlcwMGx2L1pVRktRSGFmaGJ4VUh6aWk3cG9wS0NlQU5jOWdSUndOU2pzeGRq?=
 =?utf-8?B?eXRrRVNNMHlITFNjZHpRcTFienhHM3hsaDlqUlJmYjZyUk5hc2VwYUxOUDUy?=
 =?utf-8?B?TzJ2OGMrcEdmeFRTcVNFd2NaMDJPZmQ4czJWaXoyVHErUkRCdGtxZUFSOHBP?=
 =?utf-8?B?ZldxMjkzMXJFMXR4YUhXdmNPRUI4RnM2bjNEMitWNXhFakVDcWxkVzZibTNt?=
 =?utf-8?B?c25PTlJzNWYvUnlNVVBpMGN3dUhNRHViSUFTQnlIeWJxOXRrTWN4YTJhN2Rt?=
 =?utf-8?B?Q3VkWmtlWEp2RWd2RmYwVG5oS21NNWI0bUUxZ0dEZVhjUTdhNVo0OVQzSFlF?=
 =?utf-8?B?eHliWFBkWHdHZ0VMYnowbkNJQWRrc2NtSzA3ZC9SWUxNUm1sZUxvMlBoSFpD?=
 =?utf-8?B?VnVTRldjMVl3Z0JDc1JXMmxsNWFFM2JISVdnY2NnYzdlNk5NOVVjRitPSGpJ?=
 =?utf-8?B?RUJiTjBZSzhGNVd1OTdlSXpCNmc4SlBMOERkSG4rakRRV3cxV0s0eDBzdXh0?=
 =?utf-8?B?K3c0TmJGV2xvWjRmS3RpelF2dVVGYWY3MExpd08yYmJla1BtSUpVSFRqM2RO?=
 =?utf-8?B?YXg4NEJPSDc4LzBmdDRNVjdlNStIVjFJd0RxSVMxZHdTYVR3S2ZQZlkxWGND?=
 =?utf-8?B?QzJsajlTTHhBb1NIeFV2RWVFQXkyOUlWZkZqcm1XL2NCQ29MNnVESmVFdkh0?=
 =?utf-8?B?dmxkd09vVEtUYUJ3dmE2VUJPR050RkNzM2d4bWJsNkp0ZDhBZFNKMnBYQi9z?=
 =?utf-8?B?ZDY1d2I4VFNOenhSbWhhVUQwQy91VFpUeFh0amJ2OFZNN3lGMHNmSkRHYWp6?=
 =?utf-8?B?d2xIamdaaEVoWmltUDlSZDBBaXBKUi9qZGR6WlR0TzYwYXN5RWtWOGtTdG1S?=
 =?utf-8?B?Q1pwQ3FDUDhxZUJGK2JqTU9ZQzVuS21EZ04yekYxRVdNeEg3ZmxoSGs1VlVk?=
 =?utf-8?B?RWsycTN1N2x2WHVVWGVNcDBqTEw1MTl0U3h4LzVTN0ZwZ3k0NzYwa1BYTFhX?=
 =?utf-8?B?NU93SVBuTFBuQzhrYk5sQ1Rua0ZQc1BoaDJMMVRVVUdIVjlDd0Jkbk52ajho?=
 =?utf-8?B?b3lHOHhyNDJwRFpFRzdrcm5GdThrVEFwRFlnWHVXaXMzazZtRmgxUlg2Vnpm?=
 =?utf-8?B?RWd2R2NWbzZYT2YzOGNRcDVzWmRKTzYwb3JnVmt4eWx2MU5HNE9aOUFTV2ds?=
 =?utf-8?B?ZEtxTVJ1aTMxaUFNT04zbVdFMENvNGhaSVg0Z2dxOHJkSm8wL3oxbzJDRE5N?=
 =?utf-8?B?UmVFU082MU1QZk9ZY01ycjZFT3Z2ZGEvSXE3bEhmVlBFYkY2WnZtazFkNmVj?=
 =?utf-8?B?MXJqUTA0WFZ0UTFsYzQ0U3RzQWhhTnZYazVQZzVjNUNTNSt5bUVsOUNwSlhr?=
 =?utf-8?B?aXlzbUpmMHRldkRGOFlkTFQwTHFvQmhuSE52azY5ZnBZRWRHSEREQT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df342855-50f4-4565-6d2c-08df3a331bd7
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB5743.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 05:18:49.8478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kv6POOZ1Skfw5P17xWvu+gaGVCogkZ9TmhDhiZdFJQ+AxYYX/p4phazTg5TuwMxnUwla1OL9ifzACZm7NRkXFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6569
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_211859_981017_810176E8 
X-CRM114-Status: GOOD (  14.48  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgRnJhbmssCgl0aGFua3MgZm9yIHlvdXIgZGV0YWlsLgoKT24gMDQvMTEvMjAyNiAxMToxOSwg
RnJhbmsgTGkgd3JvdGU6Cj4gWyBFWFRFUk5BTCBFTUFJTCBdCj4gCj4gT24gV2VkLCBOb3YgMDQs
IDIwMjYgYXQgMTA6NDQ6NTlBTSArMDgwMCwgSnVueWkgWmhhbyB3cm90ZToKPj4gSGkgRnJhbmss
Cj4+Cj4+IFRoYW5rcyBmb3IgdGhlIHJldmlldy4KPj4KPj4gT24gMDMvMTEvMjAyNiAwNjoxMCwg
RnJhbmsgTGkgd3JvdGU6Cj4+PiBbIEVYVEVSTkFMIEVNQUlMIF0KPj4+Cj4+PiBPbiBNb24sIE5v
diAwMiwgMjAyNiBhdCAwNzowNTozOVBNICswODAwLCBKdW55aSBaaGFvIHdyb3RlOgo+Pj4+IEFt
bG9naWMgYTkgU29DcyBpbnRlZ3JhdGUgdGhlIFNpbHZhY28gSTNDIElQLCBhbmQgdGhlaXIgcGVy
aXBoZXJhbAo+Pj4+IGNsb2NrcyB2YXJ5IGZyb20gdGhlIHZhbmlsbGEgaW1wbGVtZW50YXRpb246
Cj4+Pj4KPj4+PiAgICAgLSBUaGUgRUUtZG9tYWluIGNvbnRyb2xsZXIgKGFtbG9naWMsYTktaTNj
KSB0YWtlcyB0d28gY2xvY2tzLAo+Pj4+ICAgICAgICJwY2xrIiBhbmQgImZhc3RfY2xrIiwgYW5k
IHRoZSBmYXN0IGNsb2NrIHJhdGUgbXVzdCBiZQo+Pj4+ICAgICAgIHByb2dyYW1tZWQgYmVmb3Jl
IHRoZSBjb250cm9sbGVyIGNhbiBiZSB1c2VkLgo+Pj4+Cj4+Pj4gICAgIC0gVGhlIEFPLWRvbWFp
biBjb250cm9sbGVyIChhbWxvZ2ljLGE5LWFvLWkzYykgZXhwb3NlcyBvbmx5ICJwY2xrIjoKPj4+
PiAgICAgICBpdHMgYnVzIGNsb2NrIGlzIGdlbmVyYXRlZCBieSBhbiBpbnRlcm5hbCBkaXZpZGVy
IGxvY2F0ZWQgaW4gdGhlCj4+Pj4gICAgICAgY29udHJvbGxlcidzIG93biByZWdpc3RlciBzcGFj
ZS4KPj4+Pgo+Pj4+IEFkZCBhIHZlbmRvcl9pbml0IGNhbGxiYWNrIHRvIGhhbmRsZSB0aGlzIGNs
b2NrIHNldHVwLgo+Pj4+IEFkZCBhIHZlbmRvcl9xdWlya3MgZmllbGQgdG8gZGVzY3JpYmUgQU8t
c3BlY2lmaWMgYmVoYXZpb3IuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBKdW55aSBaaGFvIDxq
dW55aS56aGFvQGFtbG9naWMuY29tPgo+Pj4+IC0tLQo+IC4uLgo+Pj4+ICsgICAgIGludCAoKnZl
bmRvcl9pbml0KShzdHJ1Y3Qgc3ZjX2kzY19tYXN0ZXIgKm1hc3Rlcik7Cj4+Pj4gK307Cj4+Pj4g
Kwo+Pj4KPj4+IHdoeSBuZWVkIG1vdmUgdGhpcyBzdHJ1Y3QKPj4KPj4gYmVjYXVzZSBjYWxsYmFj
ayBuZWVkIHBhcmFtIHN0cnVjdCBzdmNfaTNjX21hc3RlciAqbWFzdGVy77yMIGFuZCBpZiBub3Tv
vIwKPj4gY29tcGlsZSBlcnJvci4gdW5kZWZpbmVkLgo+IAo+IE1vc3QgbGlrZWx5IHN2Y19pM2Nf
bWFzdGVyIG5lZWQgc2F2ZSBhIHBvaW50IGZvciBkcnZkYXRhIGluIGZ1dHVyZS4KPiAKPiBZb3Ug
YWRkIGZvcndhcmQgZGVjbGVhciBiZWZvcmUgZHJ2ZGF0YQo+IAo+IHN0cnVjdCBzdmNfaTNjX2Ry
dmRhdGE7Cj4gCgp3aWxsIGRvLgoKPj4KPiAuLi4KPj4+PiArc3RhdGljIGludCBhbWxfYW9faTNj
X3RhaWxfY2xvY2tzKHN0cnVjdCBzdmNfaTNjX21hc3RlciAqbWFzdGVyLCBzdHJ1Y3QgY2xrICpw
YXJlbnQpCj4+Pj4gK3sKPj4+PiArICAgICBzdHJ1Y3QgZGV2aWNlICpkZXYgPSBtYXN0ZXItPmRl
djsKPj4+PiArICAgICBzdHJ1Y3QgYW1sX2kzY19hb19jbGsgKmFvOwo+Pj4+ICsgICAgIHN0cnVj
dCBjbGtfaW5pdF9kYXRhIGluaXQgPSB7fTsKPj4+PiArICAgICBjaGFyIG5hbWVbNjRdOwo+Pj4+
ICsgICAgIGludCByZXQ7Cj4+Pj4gKyAgICAgc3RydWN0IGNsa19idWxrX2RhdGEgKm5ld19jbGtz
Owo+Pj4+ICsgICAgIHN0cnVjdCBjbGsgKmZjbGs7Cj4+Pgo+Pj4ga2VlcCByZXZpc2UgQ2hlbWlz
dHJ5IG9yZGVyCj4+Pgo+PiB3aWxsIGNoYW5nZSBvcmRlcu+8mgo+PiAgICAgICAgc3RydWN0IGFt
bF9pM2NfYW9fY2xrICphbzsKPj4gICAgICAgIHN0cnVjdCBjbGsgKmZjbGs7Cj4+ICAgICAgICBz
dHJ1Y3QgY2xrX2J1bGtfZGF0YSAqbmV3X2Nsa3M7Cj4+ICAgICAgICBzdHJ1Y3QgZGV2aWNlICpk
ZXYgPSBtYXN0ZXItPmRldjsKPj4gICAgICAgIHN0cnVjdCBjbGtfaW5pdF9kYXRhIGluaXQgPSB7
fTsKPj4gICAgICAgIGNoYXIgbmFtZVs2NF07Cj4+ICAgICAgICBpbnQgcmV0Owo+IAo+IAo+IGxv
bmdlc3QgaXMgZmlyc3QKPiAKPiBzdHJ1Y3QgZGV2aWNlICpkZXYgPSBtYXN0ZXItPmRldjsKPiBz
dHJ1Y3QgY2xrX2J1bGtfZGF0YSAqbmV3X2Nsa3M7Cj4gc3RydWN0IGNsa19pbml0X2RhdGEgaW5p
dCA9IHt9Owo+IHN0cnVjdCBhbWxfaTNjX2FvX2NsayAqYW87Cj4gc3RydWN0IGNsayAqZmNsazsK
PiBjaGFyIG5hbWVbNjRdOwo+IGludCByZXQ7Cj4gCgp3aWxsIGRvLiB0aGFua3MgdGhlIGRldGFp
bC4KCj4gCj4gRnJhbmsKCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWkzYwo=
