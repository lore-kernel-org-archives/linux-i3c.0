Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C079606A31C
	for <linux-i3c@archiver.kernel.org>; Wed, 21 Oct 2026 06:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fLiZ9SjK;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=D23TaD0i
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lz79TwodBj8wQJ7O00LV1aAJ6oHNOfp/Ynm7qm3Il1c=; b=fLiZ9SjKPWfsdI33BYtNqbTyu8
	/N6baDFXeq2JtjMQz7e9Zo0+93c+QDdKYN+2lJn/Jv2E2KnNKB6utE0R9OrhTZhucydLHMu+MSCiX
	LHc9iCQZvLE0sA+8NbYgqJNESH6ieCk2CufIrrR/oDeLeFODIdCrY6HotzTa7jzxKtm6jZTQafzsL
	gcmJHP0Xzaz/53eBpTNlNCgn6zfVZA61vtCbbOZv0BnZ/oBSBBGl1/97J8NE9N/R0hRJhJHA1kOEh
	TFpqBHMyisU8CWlY/RJ9RvJpDvDrcXh8Y8atuL3uw1a5LcV0JW1fXRtrQnuHgE1EYOtkorulTQxS0
	o9k+aSow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJPwc-0000000BBFu-3jXN;
	Wed, 21 Oct 2026 06:37:02 +0000
Received: from mail-japaneastazon11023121.outbound.protection.outlook.com ([52.101.127.121] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJPwa-0000000BBF5-1zF8;
	Wed, 21 Oct 2026 06:37:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W0mkYWwAB/aua9FL+bBVq3XgV5Zd9KbRJ9L4SJTd7GMbmnN4UgvRPN3GbfB8FHgwcwi9Uk0YgCQJMXn/6VPPaZJmH1WDtLDu+u4wdNWUV6ampqBn5luRYf3yXD98a//XaaooqOhSArVSfRtrakhNcs4MLxBAnyO5lPmSsZbmif3jmuiU2rG0BXsk5StSbl5/qMKofou/w3UqSZSiCC+IBPz65VB6YIRL5ES33j6Jx0B7S7O+GUhKXCKrHH287da8J52YmaU1RmZQxkR6ofm2DAWSYVAqZ2M2JqLjNGLpQdlyKWicxJ1/fdUvWkDzAPjtNtZ8Txi9m2r9dgYwPlYXpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VeqmUrl88PHKRxEv5moP3JbRsvpt3x4F/ZFqWaz7ZeE=;
 b=RQCjvWJLREWa8Z5bnyD8UZDTTWwPeOe5IligQz+jCSnfHgw9ymzwlBX6e0OLrfpOl99riY+UEAbi4wWNQL40tyLBxlIdFFsqoyfIvf63abDWLvas2j7EQJDb0QAt+yHBtN6C4sE8H9wYotZdIt++q4ZWW4b+mhdJ/BwFKIhBGO4G7dWFE8ES2s/4AW8+Ae0LgPdH0EcCQFmM5z7zKun6oQfBE5rA4IiFBjl8FK04FrdVp7bL66v1slOgrwZx8EpK0lOY9SJ0p/NmqkLWPNucqxO/bsukaxh71rL0ztqMa9s6PGwRTohRop8DTWVzWpm4wIi39hvDMfWdZStYkJl+qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VeqmUrl88PHKRxEv5moP3JbRsvpt3x4F/ZFqWaz7ZeE=;
 b=D23TaD0iN8ITiT9wMEDlOkcaEy9XR8mzbG2ctABXXoeHVj9gL65/WqqWx5ISeeDbty5Ve/E+KNqw6LLbaRrRIypm/m5QT5Re5joAqwQOvudLxpBUwrngbWE9umFAm/vfBMjOrPutUM8EU0GcrlHQOd47xlSytUbmetHS62C07qFGdtS5VI31iKUfRvAYkWK62KAas14cdH2UW9lkOmREAMrqlw38FjLrsl34i9U6yebhqt9Wr947qzBctO7HTKXSJrb1y94qpFzOeVifMgSGK4EW8E9jRXA1hVuQK19I9VjCfVJyWPTJUVPi1Qb3sX5YlaMUcBmTzzB13pSzkagAYQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB5743.apcprd03.prod.outlook.com (2603:1096:400:74::7)
 by OSQPR03MB9372.apcprd03.prod.outlook.com (2603:1096:604:427::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Wed, 21 Oct
 2026 06:36:42 +0000
Received: from TYZPR03MB5743.apcprd03.prod.outlook.com
 ([fe80::7f51:5771:90c4:8c40]) by TYZPR03MB5743.apcprd03.prod.outlook.com
 ([fe80::7f51:5771:90c4:8c40%3]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 06:36:42 +0000
Message-ID: <7af146aa-2fb7-4663-9fe3-5cd866649b3a@amlogic.com>
Date: Wed, 21 Oct 2026 14:36:39 +0800
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/3] dt-bindings: i3c: Add Amlogic A9 I3C controller
Content-Language: en-GB
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, imx@lists.linux.dev,
 linux-hardening@vger.kernel.org, xianwei.zhao@amlogic.com,
 Kelvin.Zhang@amlogic.com
References: <20261019-a9_i3c-v1-0-329d819d621f@amlogic.com>
 <20261019-a9_i3c-v1-2-329d819d621f@amlogic.com>
 <c84d861a-2e28-45b0-80c8-e533864d5e6c@kernel.org>
 <d17dcb30-93bc-4b68-8969-11530946d33d@amlogic.com>
 <6673c9f4-fff6-4057-934e-d94d01519e68@kernel.org>
From: Junyi Zhao <junyi.zhao@amlogic.com>
In-Reply-To: <6673c9f4-fff6-4057-934e-d94d01519e68@kernel.org>
X-ClientProxiedBy: SE2P216CA0026.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:114::10) To TYZPR03MB5743.apcprd03.prod.outlook.com
 (2603:1096:400:74::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB5743:EE_|OSQPR03MB9372:EE_
X-MS-Office365-Filtering-Correlation-Id: ed977b2e-4a78-4ecd-b9c0-08df2f3dab6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|11063799006|4143699003|921020|56012099006|22082099003|6133799003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: 2kfkMq4EZ86FFXPVtowqRnR0NSJm6UJSfJgFH1Qzt/hYMjfnhIxUtcnnU0j8jVMEin1rypQpMQUBN6oSJN5OXt1qxsEpnGPszB7np8vZxhIME0qiE5pvSzGEEyGe06qRmY6HSGYs/QE+6HcEdSd53WUM32trlcRlYlbIa+yQoWsf6c61kBDpoqhi7QwRQikcsdkkUlJeUPtniWaRv8flwpllW5KfQm93EjVvQ29HBN+XLcXhX5j2qOuy+RAaOhjYuB7/ukNOLn2PQ5IE1pQTB1V+7ClsE4wXJbSZbWQZWhjzGqjXsJhnvwjw1GevCAOXbHbrq4L8gqPvC2bXi/ZqStgSuGq5d8LHy9IiqmbJBWsBbvejCysjl0eIl4Ow7BLYK3oIwM7sQrDSbK3rqpoKR1yrE1x4XOcWIER3mUt87fpRNh4iivZUbVrDTxa5GuZtV1k5h9MNIZ2AEfa2WzZcnkJSKi67ko78hp4EKmEffeX/uAPnVwRVcvCDYioeG+r+AE1x7YmNioxR3c+UZlHrmZMmZE8GZxerS8m9re1ZoH+S8htPQlhNvRrUQxXZXoHs+lICNzW+UtwZz+Hr2O/y2hqzdMQjkoUuaH5GqLqzsrrDUZjzTaBTLY+BnYLbsw3xI4nV3niR0NnapFGW/hoeMEzbkjvVMGWDoYIIn8J4mtJYJXFLo8OjYpCCV7/oir/eUGgJOo9V02StYRuG9eFVUw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB5743.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(11063799006)(4143699003)(921020)(56012099006)(22082099003)(6133799003)(18002099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0IrWkRDUTlxNXhvTzZ3bFVWRHlNZkVjcWljVmlvYjE0L0V4UmtpZXFYYmpT?=
 =?utf-8?B?RXlWYU93NWZzaTI1S3BJaThEZXFSa2k1M0tEWDZYQVFFSWpLK21sdUgvOCtm?=
 =?utf-8?B?cmo5NW9Zc2J1b2xsc2NUN0ZwT0h1cU81QWtaU2gzUWZJZVFaQUJ1aW1ISml1?=
 =?utf-8?B?emZEK1VNNnJEc2VEeEFXdkRDRzVlVUxzUFVKakE5NmVYNFR2eTVpMlFwUkxT?=
 =?utf-8?B?dWM2bUZOWEl4ME4yZU0yZnhObmN3aTVwdUk2dDErSEZqZW44eGpXZzM4SUlD?=
 =?utf-8?B?MjNCSjROcGg4cUtwZ0lOYlM5Nk9vS0VnNE1HNFh2M24vSXAzSXpYTHlZekdY?=
 =?utf-8?B?VjFWenRwejBGbUowSXl6TVJOY2RXaGtVM2VGeWIzTW9HMk1KV25VUzZadVhK?=
 =?utf-8?B?V0ovMUYwcCtZV3pvMXU1NXQ5MExxTk1jQm9rNDZLN29ObU9hc2k5aDhnN2J2?=
 =?utf-8?B?WnNvVzFKTjBaTUF3UXlWTmtETTlNRUtJajhhdUR3UWFNZmcybHVuZEtOUDBz?=
 =?utf-8?B?bTEvY1BEazUyeXI3ZVh6Yys2VTJ2OWdCM1pBaEM3VzN0dXhXRzJKNnhFUTk4?=
 =?utf-8?B?cEREZ2hJQjNMSm54b08rSWp6L2NJN3dRdG1pNjJPTlYrNEFldEVjRTA1R1VM?=
 =?utf-8?B?ODBlbHlkNU42Y25WRnpSa2o0SENXSytwZ1dpSVl5M043N0MzUExzaGtoVkhP?=
 =?utf-8?B?aTJyWGs0UHplQ2JLMGdwRkZBMnhnVFZXY2Q0OFY2enBZaEhWQURjTW9INldx?=
 =?utf-8?B?WTRMUFNzSHlFWG43cGRWbGRhYS9KN09TVm03Sy9pMWF4bkIrUkVMUmhkb3Av?=
 =?utf-8?B?RXJ4QkI4aFgxQTNWSzdDa0NNTnJWdGdvOGN0RkpzakJtZlBEM2p0MFI2dEh4?=
 =?utf-8?B?a0k5Zkt4WHVMcllUMG9QSmh5VXJoWmJGckVkNVVQcWNHOGUxK3pxdXlLT0JX?=
 =?utf-8?B?Y3l0QzNvVUQrVzNNSHg3SGNCQXB4V3VqNmF6NTUwQ090NWNpOW93aG9SWFRS?=
 =?utf-8?B?Z0JUbVB5dWdrZkhUN3c2WmRkR3FkWFNiRlJVK1NzSXNBejBiZ2VPSzk4S0Q3?=
 =?utf-8?B?OXcwR1BmYzl2Um1XTlBzSzJtek0vNjIwWjg4ZmZOeTUvSk5rSTFMTzJ5UkZa?=
 =?utf-8?B?MnJtMnhuUG1RL2tmMlFPRkN4bTJwU3MrTzAxOVZRU3g3L1Q1dFpJRXQ5b2d0?=
 =?utf-8?B?K2x3enlPYUd3ZHRrR051VUR0K1owZ05XSDR3MlcwUkRhTTV6NytCTlprdzEy?=
 =?utf-8?B?blVuQXJWZVpGb1d1TW9ONzJsZ2NlYjJZZmw5OW10OE9xY3JoUTBIZjlZQ3ZZ?=
 =?utf-8?B?bmVRdmE4OGNpaE1WbDROMStxNTRrblVKNXVlb2c4Ti8yV3p5a2U0V01WRVVO?=
 =?utf-8?B?dTAxRzZXaHZNM2NTb3pRL200a0Z1Myt0emkrOW5VTlk5cWNzbFEvTTVONEh2?=
 =?utf-8?B?VVo1ZHZsZHhRaGtGY0w5WHhySm9DUGk1R3I0RytBcXo0emNneElKaSs2VlBk?=
 =?utf-8?B?aGhyNVZ4Q0JCRXlmQk95SnBWdVpGVmtHSnAzWDg0b0lEUUhSN0NtSnUwb21V?=
 =?utf-8?B?SjBOSlJLQ21Ia3Y5K1dmUThKM25nRmY4N3d1Z2VlajdyaTlNZXV1R2hONHE3?=
 =?utf-8?B?dlpaNnFpYnBqditrMWRydUNyT0djUk05RkE3bGg0TXlHbWdVVGtvb09iYVZT?=
 =?utf-8?B?RFdVMHArMno4ejFwQ2RzbFpWTDNOdVh3WlJCVWtiMFEvVVRycHdWeUdXQ00v?=
 =?utf-8?B?K2FpTUkvbUY3NEZLRTd2VkpxU3M2cEhvNkx2SlYzWmNKSGREbFFlK01PNVBQ?=
 =?utf-8?B?ajZCd1prdVNYUXMwTzJSRURlRU1jcGQyNm12VEE0Qi9TSVBpcllzREhmRWRO?=
 =?utf-8?B?YldSQXRKd0lzcjJYRm5zZXhERWVNSGMrdUhNQW1XMmNUZytVaFBIVGM5di9P?=
 =?utf-8?B?VXQ2KzB4RCs3bStuVmh2U05FR2pjQmIrelI1NGNLc2xEdStNRjBxbjFzTzdN?=
 =?utf-8?B?VWd1VjVTcU16cG5sbGFzZ2s0TjZJSFpwNlRNNFlMT1hPaW1laWg3UlRaZ3JZ?=
 =?utf-8?B?ZHBHV3ZzcTRraXJaeGppd2FTUHdpdXorZkJPcmtjUG9vUTdYd0ZnT2Q3MU45?=
 =?utf-8?B?MVBzV1puV3N2TGYxUlIwQlBXSVE5NmRvVEpxMlYzelJlRDk2NFFlTFlRMVI3?=
 =?utf-8?B?M01Bb2Q2UGNxVVpaOHhNQkp0MjFaU1kzZmZFeHZ6N3llUk1pUk5acXNkMEt2?=
 =?utf-8?B?ZTVGc0U1RzR2OVdVRnRzS2pzN2g2bTlOMkUzR01leXNteW03TnN4aUQ0ZTZh?=
 =?utf-8?B?eUt4Z2w1MnlwVUlnOEg4SkxPd3Jmc21SS1EzamNqbVpxR1hPY1ludz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed977b2e-4a78-4ecd-b9c0-08df2f3dab6e
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB5743.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 06:36:42.7107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iO6BVrZLjXmXqSblBA70Q8Uwlu/BRmG3Eken9d5PrDhrwABRu6PxWmweyz3tbBrds2TqLihG780U9EmyHWZ76Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR03MB9372
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_233700_541234_515E28B2 
X-CRM114-Status: GOOD (  13.19  )
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
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgS3J6eXN6dG9m77yMCgl0aGFua3MgZm9yIHlvdXIgcmV2aWV3LgoKT24gMjAyNi8xMC8yMSAx
NDoxOSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBbIEVYVEVSTkFMIEVNQUlMIF0KPiAK
PiBPbiAyMS8xMC8yMDI2IDA3OjM4LCBKdW55aSBaaGFvIHdyb3RlOgo+PiBIaSBLcnp5c3p0b2bv
vIwKPj4gICAgICAgIHRoYW5rcyBmb3IgeW91ciByZXZpZXcuCj4+Cj4+IE9uIDIwMjYvMTAvMTkg
MTQ6MDAsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4+PiBbIEVYVEVSTkFMIEVNQUlMIF0K
Pj4+Cj4+PiBPbiAxOS8xMC8yMDI2IDA3OjM0LCBKdW55aSBaaGFvIHZpYSBCNCBSZWxheSB3cm90
ZToKPj4+PiArcHJvcGVydGllczoKPj4+PiArICBjb21wYXRpYmxlOgo+Pj4+ICsgICAgZW51bToK
Pj4+PiArICAgICAgLSBhbWxvZ2ljLGkzYy1hOQo+Pj4+ICsgICAgICAtIGFtbG9naWMsaTNjLWFv
LWE5Cj4+Pgo+Pj4gV2hhdCBpcyBhbz8KPj4KPj4gQU8gaXMgdGhlIEFsd2F5cy1PbiBkb21haW4g
b24gQW1sb2dpYyBTb0NzIChyZW1haW5zIHBvd2VyZWQgaW4gc3VzcGVuZCkuCj4+IEkndmUgZG9j
dW1lbnRlZCBpdCBpbiB0aGUgYmluZGluZyBkZXNjcmlwdGlvbi4KPiAKPiBEb2VzIHRoYXQgbWVh
biB5b3VyIGE5IFNvQyBoYXMgVFdPIEkzQyBjb250cm9sbGVyIHZhcmlhbnRzPwo+IAo+IEFuZCB3
aGF0IGlzIGJ0dyB0aGUgbmFtZSBvZiB0aGUgU29DPyBBOT8gVGhlbiB3aHkgaXMgaXQgYXQgdGhl
IGVuZD8gRG8KPiB5b3Ugc2VlIHN1Y2ggcGF0dGVybiBhbnl3aGVyZT8KPiAKCkE5LCB3aXRoIGlu
dGVncmF0ZWQgdHdvIEkzQyBjb250cm9sbGVyLCBpcyB0aGUgU29DIG5hbWUgcmF0aGVyIHRoYW4g
dGhlIApjb250cm9sbGVyIG5hbWUuIEkgYWdyZWUgaXQgbWF5IGJlIGNvbmZ1c2luZyBpbiBEVCBi
aW5kaW5ncy4gSSdsbCByZW5hbWUgCml0IHRvOgoKYW1sb2dpYyxhOS1pM2MKYW1sb2dpYyxhOS1h
by1pM2MKCj4gQmVzdCByZWdhcmRzLAo+IEtyenlzenRvZgoKCi0tIApsaW51eC1pM2MgbWFpbGlu
ZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
