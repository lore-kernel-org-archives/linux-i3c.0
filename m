Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061E0606A323
	for <linux-i3c@archiver.kernel.org>; Tue, 17 Nov 2026 05:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IVCqN+lf;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=sRYK3sgX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Dkyjc5Wl/OfumKt8B9F9sUha13QDElgXdIaTqkfHyis=; b=IVCqN+lfxIAF2aM5hl2pYkoTjA
	9yW9efEdYw8DGRq9bNKKndT5qYeByq2BWBOkLjbxOVUf2LWXtJ1TnTDi3zCO7stLzS85VpXNmznrd
	+ND8Y3Ux6yz2p4pUoOlonFRcs1/O5t0eCiS3IFyKYX/1yOZSWB0b30ywrTwGjz0q17B3LXwvhwbul
	iQW/qYMSv9DqQoI2VVWWvyWdgpVV9x3JmHMyeWN6u6X5yzsjDiXmfMW941b8eSdKQlJNgOxtqUTnM
	1G7Y91aZXPFebODP8qf6uyZTbU/RR3jsKJwazWWh8KV33wz8OdpypDg9wV/E5GKQICxUMZrKSUnWb
	AyNZTVPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTC0x-00000004ctk-33gD;
	Tue, 17 Nov 2026 05:45:55 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTC0u-00000004csc-3Es0;
	Tue, 17 Nov 2026 05:45:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PL8fv5Gl/o0nt0gX6ZckOyZ7pxd0m2nvCHRJPWThUuMZ5TBx9e11O3i3tlZWqtt5tD1GVvjM+PaKkBnB+HPAgK3cXh1aAHooRjbZoAeUkrHuKorqia84tzfTi6eAABDKd1tVDF/juOjKR4s80GAgtOT9Po2vNGSQyF20WlkIoycXiXQjRAJunAts/a/WCKPWJEzRP9xgpVu9K/+/UuOODrfXhzNOpyCg2OTXS/V9YXkxmo2Cle5Xudzd/7lAIkdd0tR/Lrlldh/VxJWz5kV7WS8QT1ZNjSpMt2IdWTQWgNlMB5l/nXQLgMO9WMzAneWuxCBFHt0CDEzjD1nkhOYIiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mv6ZUEs1XHHU5bamJ73QmjUjV3RPAFaTgmlXC8inr/w=;
 b=fQd25WgzpkoimjvJm39AdnDubOxkzQN6ECRwQ3Z8cDXJ6G3MvYyCKpMmhVE31PiMPBoR9W7tFM/fVSsbxPCRXYqTwYmAKH5ijBlXbHeekNNRUuIm+niAa7TO0mm5dvggP/K9kAjF8AiOrvOqNa8B3p/Gs/vU3zWpvmWIJVhqxFv4TGAoAO2OKV3xDmSEjpW0eCaou+IXzcLYbRr3kyAiUF1qN3UzgC3W21yfxcPmlF4NN7nZiJSH9uWmiCBA6pmLXv5I/AKVYVimIcPiXhaySrt+2EUL75sBS8rRqyRBE0OsoJPA9gmTPeryJfmiw83Va2BThMMsVh39nwfif755bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mv6ZUEs1XHHU5bamJ73QmjUjV3RPAFaTgmlXC8inr/w=;
 b=sRYK3sgXt2+2jwYkBwYjmPQFZvVUc/BHUQQfQUxaVIc00SgXzB7OU7DQEvQ8HIVQ/7CLv5UzkAEJNe9Ck/eqSO8bip986NE3lC1yoid3WKF/Ofo4afk9nVEFWmWLCu9dSvTyIeKdKgG3jVtsehR6fRv99MpRxtb8XE4N3BHm2oZnQR4B80FeUVQz7R6hlqwWHXfc01899cKzlISpXZ4SRWwATTVxxENVxqdmaQ7PniBNEh0aZogGcEnV/+6FWLXplSYmFQ0NY43/2ZX1lFHHM3AxnOfuGovScmLJOS/qqO8bcvzCtCS+k2acA+wYl8k1edVKdlcConRI9zEmmr8gPA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB5743.apcprd03.prod.outlook.com (2603:1096:400:74::7)
 by TYSPR03MB7859.apcprd03.prod.outlook.com (2603:1096:400:480::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 05:45:45 +0000
Received: from TYZPR03MB5743.apcprd03.prod.outlook.com
 ([fe80::7f51:5771:90c4:8c40]) by TYZPR03MB5743.apcprd03.prod.outlook.com
 ([fe80::7f51:5771:90c4:8c40%3]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 05:45:45 +0000
Message-ID: <f17ef3d6-fa99-4fc8-92bc-1f588f3bf179@amlogic.com>
Date: Tue, 17 Nov 2026 13:45:41 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] i3c: master: svc: Add amlogic a9 support
To: Frank Li <Frank.li@oss.nxp.com>, sashiko-reviews@lists.linux.dev
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, imx@lists.linux.dev, robh@kernel.org,
 conor+dt@kernel.org, Frank.Li@kernel.org, neil.armstrong@linaro.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20261116-a9_i3c-v4-0-3d3222b7128d@amlogic.com>
 <20261116-a9_i3c-v4-2-3d3222b7128d@amlogic.com>
 <sashiko-outbox-216859@kernel.org> <avsvRS6ADfbzQkpn@SMW015318>
Content-Language: en-GB
From: Junyi Zhao <junyi.zhao@amlogic.com>
In-Reply-To: <avsvRS6ADfbzQkpn@SMW015318>
X-ClientProxiedBy: SI2PR04CA0012.apcprd04.prod.outlook.com
 (2603:1096:4:197::14) To TYZPR03MB5743.apcprd03.prod.outlook.com
 (2603:1096:400:74::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB5743:EE_|TYSPR03MB7859:EE_
X-MS-Office365-Filtering-Correlation-Id: 87116cd7-1719-45de-36b9-08df446e05eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|7416014|1800799024|261022115727099003|10067099003|4143699003|11063799006|56012099006|261026130827099003|261026121527099003|261026135527099003|261021133027099003|261026140227099003|261028144727099003|261021135927099003|261021123027099003|261022113327099003|261022105027099003|261022075727099003|261021121427099003|261021130227099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: uZAlu6u6Xu1o3B+2nAOUrysCW44e29f5BMxy8gyT1EUS0hc4Aan8vtPMZwxPMhAO4nHyHXx1r00FioKiuRtlrbwvvBGJVRo1FjkfWA4tu3DEAzT6Tn2dgoSR326hAoul4pfZIKoVfvHoJdPSnC5dd+eOYO66Ej1QpxIshtouZT1KFK3i81To0DVaaymKhD7EehV79FSPhayIXnTsnzq1nlB86fW1Tf9qbdx1YWtEefPVsDyIGKmIGywTDDEjfOcNFkBQ2dr65okDwl6X0Aq9MqmP4yu04XUyGbkPlhK0TNi2st/fpJdzmExwYJcz/oi6bLre9ckWbnA1e3XSEGoVCLMMQ+fJXbv6FXWqrTy1r9B3Ftg7fYCQbd4RQAbQESlAhexbboOIz188+cajaixKu6+8rLP3kyj23V2httSdlRAOqRrpyGjMIbZFgkkXdaHe1HI0C/sBNzNOVUWK1IeVSlPBmk4GbwwKYZP5C57mQP9/PjDGDur+VZV8I68fjVbmotV4uLQ+vdpAEN7SsKGXJb7/AkGcc7bTKiaC0xRk1jr5ExzZA+Pp5fSHrG55lfavMWwM2bgaR29js9G7RNdXDG33r6mS6/zpern8ec0OALM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB5743.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(7416014)(1800799024)(261022115727099003)(10067099003)(4143699003)(11063799006)(56012099006)(261026130827099003)(261026121527099003)(261026135527099003)(261021133027099003)(261026140227099003)(261028144727099003)(261021135927099003)(261021123027099003)(261022113327099003)(261022105027099003)(261022075727099003)(261021121427099003)(261021130227099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cU54VmpsY0hpakVhSUZFRm9Gc1hvOUE2NVhwOVFOUnBxT1V3d3k2T0lMYVVV?=
 =?utf-8?B?WWFyelVEZnhJekhQbThxdnBmR2U3SjdHbUNPc3Q0ejN0NG5XNW1Qcis5NnlK?=
 =?utf-8?B?RXN6TStrQStOTk85djdES1ZtSDIvS1lTaWZEV2pUMk9MbytJK1NpNXJIZi9Q?=
 =?utf-8?B?citZQkhwY1RGanpEejJuR3I3R1cxdUxlNUI2WCt5OFZmbTNWY04wQThHRUlu?=
 =?utf-8?B?ajdHZmVtYkU0b2dKd3h4ZDRreis2YkczOWVUVCtxMkZOUWp0L3lsc2U2S2sy?=
 =?utf-8?B?OU1Jc1lXNHJUcld4VDhWeCtQSDdheWMzME5RV0RDaEIrcUZKRjBQdm5pVE8z?=
 =?utf-8?B?OEtjWlRrSnIzZmVKQitoWTR6QWlBN2RIZkcxQm56eERJalQzeCtibEMvRkZN?=
 =?utf-8?B?aEJhYldkUDF5YmJxQTRPVERkQUpyUEtZVGtHaXdVOFdFOFJ1RjZkdDJteGli?=
 =?utf-8?B?Qm5OK0xLRG5odmpkQ3V3MVhkUTFOSHhOQ3VDMmxYS01QaDNsV0hVTUJoZTJU?=
 =?utf-8?B?QVNwY0NmZXJ1OXJwODVEMVBPTzJadTErbHMwL09jcFh3NlV3N3JBSENzdWEr?=
 =?utf-8?B?azdVTDdRZmFiM0Mya0l2Ny90ZHAvc3BQdXB3VmIrMFlkYmF4aWtBaEkzQXMr?=
 =?utf-8?B?dWdTaVZucC82NEo2RDUvc1dWdWFCclhoUlhQOUo5NlJRSkdGd2RNaGJmOG5v?=
 =?utf-8?B?V3ByY0V2Z3c1ZkJMQkpGWGU4c2FzNWlDTVhRY0VYYzFCYkt0R3lyWkl1SXBT?=
 =?utf-8?B?dUtsVTNjSElrU3E3NFBEaUxneTA0c3VyMnZWKzJmY21nNTYwem5YZjRaNFM0?=
 =?utf-8?B?SnM4b0k0elZOeWx5cGM4ZjFnRGlEa1h1dWgwU1hMUFNUVnJOdUVwU1lqYjFw?=
 =?utf-8?B?YnFmalY2OHhNRHg0MVptRDllUXhEb0FYdmRTbEc1YlVmMGM5Q21FSk5tYnpJ?=
 =?utf-8?B?YTdDNWZVSktzTG5hcFVib3dBeFFkcmFIMlBQM05SOWt1OWRIOWJGN1RCSm5V?=
 =?utf-8?B?VXFoL2RlbmZ0UVJKUGtjUVhZbWxodHJjelNQY1RQSW5VN0dpem8rM09KNm1J?=
 =?utf-8?B?Z2tuTXM1L2laOVhyTlJJRm5JMi9lNjh3a1N1OWd1Z1ZvUU9iNWNWYTRkZHFj?=
 =?utf-8?B?L1pkN3hnUWVoV0EwbnNFdy90eE1uYVIzOGo2K0ZHUktqcWpwWDRISXRaTllJ?=
 =?utf-8?B?dzhmTXRKSmV6QWlyMkxZL3h2Q0VBbTUrMzJSQVVhVFpSY21FL0pQWFBhNS8y?=
 =?utf-8?B?RlM4NU93RGNDTHdaVUc2N3JmTVcraHBGQXMrN1VUTS8wejA3VEwzVUJDTzdz?=
 =?utf-8?B?SGs3TEE3clZ3NGdpMG9zTTJxbHJSd2ZLSHBhbTM3cy9NNFdWcjRyajlvNHFC?=
 =?utf-8?B?OVd6cUh4N1BwZ3JzVVcvZ0VwYlRCTDdkb09QRWFCNjQyMlBrenh6SXBEOWhZ?=
 =?utf-8?B?OWUzeHc4Ykh6OFJKcThNNHpHNkdUazNQZUpZY0pqV3g3UzFvQmhZeDcxTzhS?=
 =?utf-8?B?RFZQdDQ2amsxSzFnc2VnaHNlNkVHUldwNGxNSUFsNnpjK0haZFlkUjFGWE9S?=
 =?utf-8?B?V2dHalJWY3Z2aEdNMkp4QU05Y3oyTDBiYjZLSWRhaHRXdTJWdk5tV0RDS2R0?=
 =?utf-8?B?Y1FncnR3L3BXeE5OVzFuWlU1RllFdC83V1JPTllXM1Y4K3FuNU8zY1M4Z1Zn?=
 =?utf-8?B?NCsxcTZjWXNQVGp1b0NsbjFhcGVEMkM3NGRDSDJuendhcjkzYmdOR05LK0ZV?=
 =?utf-8?B?L3dwQkszN2ZNLzJsZVRndnYrQk1IUjNSQ0RtdXYyQ2RpQ25GZkQ4Rjc4SHJk?=
 =?utf-8?B?RUxlcCs3QXZqWWl2SmpVMUFYZkNUclcwWlRJeTJSb05RamN6OTNaaWpDakw2?=
 =?utf-8?B?WFBzczhDSitpdlc3bEJCUUtteGNpdHBIdEpwckIxWE10OTY3Ukk0WG9nNVJW?=
 =?utf-8?B?YjhaTjR6dEV3aTMyUUZBMlpUZ083RWJQcno1Rk5tdnVRbzU3VkcrbzRCeEtZ?=
 =?utf-8?B?NXVvbUpjTTlQck1rVjNMTEhNTjJqRXNqWGxtQW01b1hTUkFwcnFEN1hiZlRG?=
 =?utf-8?B?R1pXZFB4TS9WSkg3bzRHclhZYm4yU1R3ZUxiY2JvaE81dC9TNVRGaWxTVkVP?=
 =?utf-8?B?RjN5M0lSb1pKelNKL3A3VmxvcEZ1US83cm4zVXh0TU0wd1BGSUxlUmNTVTNv?=
 =?utf-8?B?cHdEalZFY0lUSXV4NWtTTTVHZjhtcXJHeFZIYm03blFrNDlpb2xiVGZZd2pJ?=
 =?utf-8?B?OGM4MGVpQ3BweUR6V1hqczUrdWhNUEIyeTVlQkk4YnpTYUVhWUFRVDk1OEFa?=
 =?utf-8?B?ZTdlRS9UbThjcjdPOHllWW5Tek92QmFXMTMvWHNJYlBkQWdmZStHUT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87116cd7-1719-45de-36b9-08df446e05eb
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB5743.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 05:45:45.0642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ut7MNzlUMx9+/nwL3AQQuIHp2kBuk8szTJcDbsC8j/XMieZkhEsCLmd4ZK3FmjJnjgWg4ALH2UzP/rbaFToevg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7859
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_214552_933308_53D6D984 
X-CRM114-Status: GOOD (  25.63  )
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgZnJhbmvvvIwKICAgIHRoa3MgZm9yIHRoZSByZXZpZXcuCgpPbiAxNy8xMS8yMDI2IDAwOjI4
LCBGcmFuayBMaSB3cm90ZToKPiBbIEVYVEVSTkFMIEVNQUlMIF0KPiAKPiBPbiBNb24sIE5vdiAx
NiwgMjAyNiBhdCAxMToxMjozN0FNICswMDAwLCBzYXNoaWtvLWJvdEBrZXJuZWwub3JnIHdyb3Rl
Ogo+PiBUaGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJldmlldyBm
b3VuZCAzIHBvdGVudGlhbAo+PiBpc3N1ZXMgdG8gY29uc2lkZXI6Cj4+IC0gW01lZGl1bV0gaTNj
OiBtYXN0ZXI6IHN2YzogTlVMTCBkZXJlZmVyZW5jZSBvZiBjbGtzWzBdLmlkIGluCj4+ICAgIGFt
bF9pM2NfaW5pdCgpCj4+IC0gW01lZGl1bV0gaTNjOiBtYXN0ZXI6IHN2YzogY2xvY2tzIGxlZnQg
ZW5hYmxlZCBpbgo+PiAgICBzdmNfaTNjX21hc3Rlcl9yZW1vdmUoKQo+PiAtIFtMb3ddIGkzYzog
bWFzdGVyOiBzdmM6IGR1cGxpY2F0ZSBmYXN0X2NsayBsb29rdXAgaW4gYW1sX2kzY19pbml0KCkK
Pj4gLS0KPj4KPj4gY29tbWl0IDI2MGFlYjVhNGQ1YzU4ZDNiZWEzMjY3NDA2Mjk2MDIzMWU0ZDRk
MmMKPj4gQXV0aG9yOiBKdW55aSBaaGFvIDxqdW55aS56aGFvQGFtbG9naWMuY29tPgo+Pgo+PiBp
M2M6IG1hc3Rlcjogc3ZjOiBBZGQgYW1sb2dpYyBhOSBzdXBwb3J0Cj4+Cj4+IFRoaXMgY29tbWl0
IGFkZHMgc3VwcG9ydCBmb3IgdGhlIEFtbG9naWMgQTkgRUUtZG9tYWluIGFuZCBBTy1kb21haW4g
U2lsdmFjbwo+PiBJM0MgY29udHJvbGxlcnMsIGludHJvZHVjaW5nIGEgdmVuZG9yX2luaXQgY2Fs
bGJhY2sgdG8gcmVnaXN0ZXIgdGhlIEFPCj4+IHZhcmlhbnQncyBpbnRlcm5hbCBjbG9jayBkaXZp
ZGVyIGNoYWluIGFuZCBjb25maWd1cmUgdGhlIGZhc3RfY2xrIHJhdGUuCj4+Cj4+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMgYi9kcml2ZXJzL2kzYy9t
YXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYwo+Pj4gaW5kZXggZTcwMDM5MmYwODAxZi4uMDI2OGZjNzEz
YWZkZiAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5j
Cj4+PiArKysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYwo+Pgo+PiBbIC4u
LiBdCj4+Cj4+PiBAQCAtMjE2Myw5ICsyMjA5LDIxNSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHN2
Y19pM2NfZHJ2ZGF0YSBucGNtODQ1X2RydmRhdGEgPSB7Cj4+Cj4+IFsgLi4uIF0KPj4KPj4+ICsg
ICAvKgo+Pj4gKyAgICAqIEtlZXAgdGhlIGNsayBidWxrIHN0YXRlIGJhbGFuY2VkIGZvciB0aGUg
Zm9sbG93aW5nCj4+PiArICAgICogY2xrX2J1bGtfZGlzYWJsZV91bnByZXBhcmUoKSBjYWxscyAo
ZXJyb3IgcGF0aHMgYW5kIHJ1bnRpbWUgUE0pLgo+Pj4gKyAgICAqLwo+Pj4gKyAgIHJldCA9IGNs
a19wcmVwYXJlX2VuYWJsZShmY2xrKTsKPj4+ICsgICBpZiAocmV0KQo+Pj4gKyAgICAgICAgICAg
cmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCByZXQsICJjYW4ndCBlbmFibGUgZmFzdF9jbGtcbiIp
Owo+Pj4gKwo+Pj4gKyAgIG5ld19jbGtzID0gZGV2bV9rY2FsbG9jKGRldiwgbWFzdGVyLT5udW1f
Y2xrcyArIDEsIHNpemVvZigqbmV3X2Nsa3MpLAo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgIEdGUF9LRVJORUwpOwo+Pj4gKyAgIGlmICghbmV3X2Nsa3MpIHsKPj4+ICsgICAgICAgICAg
IGNsa19kaXNhYmxlX3VucHJlcGFyZShmY2xrKTsKPj4+ICsgICAgICAgICAgIHJldHVybiAtRU5P
TUVNOwo+Pj4gKyAgIH0KPj4+ICsKPj4+ICsgICBtZW1jcHkobmV3X2Nsa3MsIG1hc3Rlci0+Y2xr
cywKPj4+ICsgICAgICAgICAgbWFzdGVyLT5udW1fY2xrcyAqIHNpemVvZigqbWFzdGVyLT5jbGtz
KSk7Cj4+PiArICAgbmV3X2Nsa3NbbWFzdGVyLT5udW1fY2xrc10uaWQgPSAiZmFzdF9jbGsiOwo+
Pj4gKyAgIG5ld19jbGtzW21hc3Rlci0+bnVtX2Nsa3NdLmNsayA9IGZjbGs7Cj4+PiArICAgbWFz
dGVyLT5jbGtzID0gbmV3X2Nsa3M7Cj4+PiArICAgbWFzdGVyLT5udW1fY2xrcysrOwo+Pj4gKwo+
Pj4gKyAgIHJldHVybiAwOwo+Pj4gK30KPj4KPj4gW1NldmVyaXR5OiBNZWRpdW1dCj4+IENhbiB1
bmJpbmRpbmcgdGhlIGRyaXZlciBsZWF2ZSBmY2xrIGFuZCB0aGUgaW5wdXQgY2xvY2tzIGVuYWJs
ZWQgd2hlbiB0aGUKPj4gZGV2aWNlIGlzIG5vdCBydW50aW1lLXN1c3BlbmRlZD8KPj4KPj4gc3Zj
X2kzY19tYXN0ZXJfcmVtb3ZlKCkgY2FsbHMgcG1fcnVudGltZV9kb250X3VzZV9hdXRvc3VzcGVu
ZCgpIGFuZAo+PiBwbV9ydW50aW1lX2Rpc2FibGUoKSwgcmVseWluZyBvbiBzdmNfaTNjX3J1bnRp
bWVfc3VzcGVuZCgpIHRvIGNhbGwKPj4gY2xrX2J1bGtfZGlzYWJsZV91bnByZXBhcmUoKS4gIElm
IENPTkZJR19QTSBpcyBkaXNhYmxlZCwgcnVudGltZSBQTSBpcwo+PiBmb3JiaWRkZW4gdmlhIHN5
c2ZzLCBvciBob3Rqb2luIGlzIGVuYWJsZWQgKHdoaWNoIGhvbGRzIGEgcnVudGltZSBQTQo+PiBy
ZWZlcmVuY2Ugbm90IHJlbGVhc2VkIGJ5IGkzY19tYXN0ZXJfdW5yZWdpc3RlcigpKSwgcnVudGlt
ZSBzdXNwZW5kIGRvZXMKPj4gbm90IHJ1biBkdXJpbmcgcmVtb3ZlLiAgV2hlbiBkZXZyZXMgdGhl
biB1bnJlZ2lzdGVycyBhby0+Z2F0ZS5odywKPj4gYW8tPmRpdi5odywgYW5kIGFvLT5kaXZfZW4u
aHcgd2hpbGUgdGhleSBhcmUgc3RpbGwgcHJlcGFyZWQgYW5kIGVuYWJsZWQsCj4+IGNsa191bnJl
Z2lzdGVyKCkgdHJpZ2dlcnMgYSBrZXJuZWwgd2FybmluZyBhbmQgbGVha3MgdGhlIHByZXBhcmUg
YW5kCj4+IGVuYWJsZSBjb3VudHMgb24gdGhlIHBhcmVudCBwY2xrLgo+IAo+IFN1cHBvc2UgaXQg
aXMgZXhpc3RpbmcgcHJvYmxlbS4KPiAKT2vvvIwgbm90IGludHJvZHVjZWQgYnkgdGhpcyBwYXRj
aC4KCkFkZHJlc3MgaXQgaW4gYSBzZXBhcmF0ZSBwYXRjaCBmb2xsb3cgdGhpcyBzZXJpZXMgb3Ig
Y3JlYXRlIG5ldyBjaGFuZ2UgCnNlcmllcz8KCj4+Cj4+PiArCj4+PiArLyoqCj4+PiArICogYW1s
X2kzY19pbml0IC0gQW1sb2dpYyBBOSBzcGVjaWZpYyBpbml0LCBjYWxsZWQgd2l0aCB0aGUgY2xv
Y2tzIGVuYWJsZWQKPj4+ICsgKiBAbWFzdGVyOiBJM0MgbWFzdGVyIGNvbnRyb2xsZXIKPj4+ICsg
Kgo+Pj4gKyAqIFJlZ2lzdGVyIHRoZSBBTyB2YXJpYW50J3MgaW50ZXJuYWwgZGl2aWRlciBjaGFp
biBhbmQgcm91bmQvc2V0IHRoZSBmYXN0Cj4+PiArICogY2xvY2sgcmF0ZSBmb3IgYm90aCB2YXJp
YW50cy4KPj4+ICsgKgo+Pj4gKyAqIFJldHVybjogMCBvbiBzdWNjZXNzLCBvciBhIG5lZ2F0aXZl
IGVycm9yIGNvZGUuCj4+PiArICovCj4+PiArc3RhdGljIGludCBhbWxfaTNjX2luaXQoc3RydWN0
IHN2Y19pM2NfbWFzdGVyICptYXN0ZXIpCj4+PiArewo+Pj4gKyAgIHN0cnVjdCBkZXZpY2UgKmRl
diA9IG1hc3Rlci0+ZGV2Owo+Pj4gKyAgIHN0cnVjdCBjbGsgKmZjbGs7Cj4+PiArICAgbG9uZyBm
aW5fZnJlcTsKPj4+ICsgICBpbnQgcmV0LCBpOwo+Pj4gKwo+Pj4gKyAgIGlmIChzdmNfaGFzX3F1
aXJrKG1hc3RlciwgQU1MX0kzQ19RVUlSS19BTykpIHsKPj4+ICsgICAgICAgICAgIC8qCj4+PiAr
ICAgICAgICAgICAgKiBjbGtfYnVsa19nZXRfYWxsKCkgcHJlc2VydmVzIHRoZSBEVCBvcmRlciwg
YW5kIHRoZQo+Pj4gKyAgICAgICAgICAgICogYmluZGluZyByZXN0cmljdHMgdGhlIEFPIHZhcmlh
bnQgdG8gZXhhY3RseSBvbmUgY2xvY2ssCj4+PiArICAgICAgICAgICAgKiB3aGljaCBpcyBhbHdh
eXMgInBjbGsiLiAgU28gY2xrc1swXSBpcyB0aGUgaW5wdXQgb2YgdGhlCj4+PiArICAgICAgICAg
ICAgKiBpbnRlcm5hbCBkaXZpZGVyIGNoYWluLgo+Pj4gKyAgICAgICAgICAgICovCj4+PiArICAg
ICAgICAgICBpZiAoc3RyY21wKG1hc3Rlci0+Y2xrc1swXS5pZCwgInBjbGsiKSkKPj4+ICsgICAg
ICAgICAgICAgICAgICAgcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCAtRUlOVkFMLAo+Pj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiaW52YWxpZCBBTyBpbnB1dCBj
bG9ja1xuIik7Cj4+Cj4+IFtTZXZlcml0eTogTWVkaXVtXQo+PiBDYW4gdGhpcyB0cmlnZ2VyIGEg
TlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIG9uIG1hc3Rlci0+Y2xrcyBvcgo+PiBtYXN0ZXItPmNs
a3NbMF0uaWQ/Cj4+Cj4+IFdoZW4gYSBkZXZpY2UgdHJlZSBub2RlIGhhcyBubyBjbG9ja3MsIGRl
dm1fY2xrX2J1bGtfZ2V0X2FsbCgpIHJldHVybnMgMAo+PiBhbmQgbGVhdmVzIG1hc3Rlci0+Y2xr
cyBhcyBOVUxMLCB3aGljaCBwYXNzZXMgdGhlIG1hc3Rlci0+bnVtX2Nsa3MgPCAwCj4+IGNoZWNr
IGluIHN2Y19pM2NfbWFzdGVyX3Byb2JlKCkuICBQcmV2aW91c2x5LCB0aGUgZmFzdF9jbGsgbG9v
cCBpbiBwcm9iZQo+PiByYW4gemVybyBpdGVyYXRpb25zIGFuZCByZXR1cm5lZCAtRUlOVkFMLCBi
dXQgYW1sX2kzY19pbml0KCkgbm93IHJ1bnMKPj4gZmlyc3QgYW5kIGluZGV4ZXMgbWFzdGVyLT5j
bGtzWzBdIHdpdGhvdXQgY2hlY2tpbmcgdGhhdCBtYXN0ZXItPm51bV9jbGtzCj4+IGlzIGF0IGxl
YXN0IDEgKG9yIGVxdWFsIHRvIDEgYXMgcmVxdWlyZWQgYnkgdGhlIEFPIGJpbmRpbmcpLiAgSW4g
YWRkaXRpb24sCj4+IG9mX2Nsa19idWxrX2dldCgpIGxlYXZlcyBjbGtzW2ldLmlkIGFzIE5VTEwg
aWYgY2xvY2stbmFtZXMgaXMgbWlzc2luZyBvcgo+PiBzaG9ydGVyIHRoYW4gY2xvY2tzLCB3aGlj
aCB3b3VsZCBjYXVzZSBzdHJjbXAoKSBoZXJlIGFuZCBpbiB0aGUgZmFzdF9jbGsKPj4gbG9vcCBi
ZWxvdyB0byBkZXJlZmVyZW5jZSBOVUxMLgo+IAo+IFRoaXMgb25lIG5lZWQgY2hlY2suCj4gCgp3
aWxsIGFkZCBjaGVjay4KCj4gRnJhbmsKPiAKPj4KPj4+ICsKPj4+ICsgICAgICAgICAgIHJldCA9
IGFtbF9hb19pM2NfdGFpbF9jbG9ja3MobWFzdGVyLCBtYXN0ZXItPmNsa3NbMF0uY2xrKTsKPj4+
ICsgICAgICAgICAgIGlmIChyZXQpCj4+PiArICAgICAgICAgICAgICAgICAgIHJldHVybiByZXQ7
Cj4+PiArICAgfQo+Pj4gKwo+Pj4gKyAgIGZvciAoaSA9IDA7IGkgPCBtYXN0ZXItPm51bV9jbGtz
OyBpKyspIHsKPj4+ICsgICAgICAgICAgIGlmICghc3RyY21wKG1hc3Rlci0+Y2xrc1tpXS5pZCwg
ImZhc3RfY2xrIikpCj4+PiArICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+Pj4gKyAgIH0KPj4+
ICsKPj4+ICsgICBpZiAoaSA9PSBtYXN0ZXItPm51bV9jbGtzKQo+Pj4gKyAgICAgICAgICAgcmV0
dXJuIGRldl9lcnJfcHJvYmUoZGV2LCAtRUlOVkFMLAo+Pj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgImNhbid0IGdldCBJM0MgZmFzdCBjbG9ja1xuIik7Cj4+PiArCj4+PiArICAg
ZmNsayA9IG1hc3Rlci0+Y2xrc1tpXS5jbGs7Cj4+PiArICAgaWYgKElTX0VSUihmY2xrKSkKPj4+
ICsgICAgICAgICAgIHJldHVybiBQVFJfRVJSKGZjbGspOwo+Pgo+PiBbU2V2ZXJpdHk6IExvd10K
Pj4gVGhpcyBpc24ndCBhIGJ1ZywgYnV0IHRoaXMgZmFzdF9jbGsgbG9va3VwIGFuZCB2YWxpZGF0
aW9uIGR1cGxpY2F0ZXMgdGhlCj4+IGlkZW50aWNhbCBsb29wIGluIHN2Y19pM2NfbWFzdGVyX3By
b2JlKCkgdGhhdCBydW5zIHJpZ2h0IGFmdGVyCj4+IHZlbmRvcl9pbml0KCkgcmV0dXJucy4gIENv
dWxkIGEgc2hhcmVkIGhlbHBlciBvciByZXNvbHZpbmcgbWFzdGVyLT5mY2xrCj4+IG9uY2UgYXZv
aWQgcmVwZWF0aW5nIHRoZSBsb29rdXA/Cj4+CldpbGwgdHJ5LgpBbmQgZ3VhcmRzIGFnYWluc3Qg
YSBOVUxMIGNsa3NbaV0uaWQsIGFuZCByZXVzZWQgYnkgYm90aCBwcm9iZSgpIGFuZCAKYW1sX2kz
Y19pbml0KCkuCgo+PiAtLQo+PiBTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28u
ZGV2LyMvcGF0Y2hzZXQvMjAyNjExMTYtYTlfaTNjLXY0LTAtM2QzMjIyYjcxMjhkQGFtbG9naWMu
Y29tP3BhcnQ9MgoKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtaTNjCg==
