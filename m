Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED89CA0FE7
	for <linux-i3c@archiver.kernel.org>; Tue, 26 Aug 2025 15:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=avrDvcL5d9MKCedUUHlBER1piq3vm58/7Osch661IVY=; b=RJSYhVgJKJ5P+l
	67kaTuKPTbAettNbo9aqb9YtQIHGT1W4uMjwqfBjiNkG8np/SYlYPYZBouTHCwFDBV94AlPKKz6Rx
	nzWZv0HWPhMaje/pELD3g7TAaaor7hEWfsnM6wDnrXjbC84FJfe3VyTe/hf64nXlMDScTshfVH6j1
	Oq35IPVN73Puaz82mw3IR0Q85pRZwv+i5viCR0KqDMOQ6SZlReKzHoh4Hnny2OISz15BHuymlZAJ5
	tJs22rGlkvT9XUuGbF5fjpFa+UOz/SsJxN5sCxeGar/EsaGyLRB+IPpyRlSWck+40q/WTwlcns2hR
	oprs7Q8avRvPScBQ4eLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqvuC-0000000CVUh-432S;
	Tue, 26 Aug 2025 15:48:16 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqvuA-0000000CVTR-1SAz
	for linux-i3c@lists.infradead.org;
	Tue, 26 Aug 2025 15:48:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lb1XHeMrh+cxbkwvjbCajGjH7+20svDiDjjEt5UGJnYHV6WuQhtajKR/ic/dMftaS6t8ZrYG2Aa/Fg5AWyBiVNhU41SZ01UNbK2Xz+trDdSXqYpQ9UbnqZbXqonEJCr9vEhsGln8d3mwDH56r4E6njApSsZ+azyJBRz6dZUirltG4bXzyLYa/Peitysrm3jfGYuo03R8ejUPLt+1Cx28njfyDnW14bPLMqPGDYWQWGQ0Qipj4edJizYMcDOGlI6aQ/aROKjSkX2rrUR008P0Z4e/3aJRQe6vO2ZM8v+w4jOo18qIQHzujyxkXOF32ieOBg7DzNAcXPB13gdCN9xhZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cFdizu9I15YcmgIX/1ZsTILL4noquikNKfhNbPaRdVU=;
 b=TVWxt+3RzWex0/YJabMUuIpp29m3QlSHE72Xmk9yU5kf6d+na6TWbltZdebbKI/j/bi9FyMfGIRzwzpJ2D9JP2WXPXBTiUgn478aY3HBnbEZkLOLuP/dSaFXVrFmBx1CTfAl2VxGxQITZ6Ei8/gUh02/L6RJvO9gHbn2+bXQnl3DIzQrAugEqdNf7g+Rm+fPMkys2ha2g2Xv7rKAydPH1g0BejHk3O0aVaWk30EU8vsXgyZOSoAIdmknVAXBe948kGZucKVDMpqmIxJg5rDg4T2bNNAEvQ+PclQlKFJeJJWHz4BCHq+XEPGerzwRTGLwh5rXN73aWmHavJ+uxEqQeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cFdizu9I15YcmgIX/1ZsTILL4noquikNKfhNbPaRdVU=;
 b=LDfPLwy/9/guV1dhPr01gE9CtUbRBt3B+fC909nvjTJN1cqBDN2j8W9nK6K8TKT36znJ9E2oMcYqppnAI9ZqLVuIS1l8MAceYyVGvp6HOI3ikfZtqqS0Dp2/V1W2/S5mygp3uSZq9MZTGNMw/p0CcThQjStePA0D1ZITdFAI0Rkynir7K4YhcA317ce1oEvuXYftNGEzw3AdjsQSCT9hfmlbt1jTYgA3F0uav24qktE9oAbbX6h06I4HW7XPR56EbnhwG7uYFbWttmAhZ2s91YE14e0N9LUZB1nMMN7p6PjX16H7ayGl1dW763sj3U9Epcr0ynWVMWVCOE/MI7vACA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by GVXPR04MB11524.eurprd04.prod.outlook.com (2603:10a6:150:288::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.11; Tue, 26 Aug
 2025 15:47:50 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9073.009; Tue, 26 Aug 2025
 15:47:50 +0000
Date: Tue, 26 Aug 2025 11:47:45 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jorge Marques <jorge.marques@analog.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, gastmaier@gmail.com,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v7 1/2] dt-bindings: i3c: Add adi-i3c-master
Message-ID: <aK3XIUpVZYmHGiUz@lizhi-Precision-Tower-5810>
References: <20250818-adi-i3c-master-v7-0-f7207902669d@analog.com>
 <20250818-adi-i3c-master-v7-1-f7207902669d@analog.com>
Content-Disposition: inline
In-Reply-To: <20250818-adi-i3c-master-v7-1-f7207902669d@analog.com>
X-ClientProxiedBy: AM0PR10CA0112.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::29) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|GVXPR04MB11524:EE_
X-MS-Office365-Filtering-Correlation-Id: 19d2af3f-9c3f-4389-af51-08dde4b7e9a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|19092799006|7416014|52116014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N0s5MTIwWkZ2WDlkR29nRVFPL3hhL0h5anVVRmNvWUlHZUkrZXcxTzFJMERJ?=
 =?utf-8?B?SzRnZnNpRXloWlozb1BCcjRHT04yWVRRakgvSmdSRXk1Q3Z1WS8ySW5uc0pp?=
 =?utf-8?B?bkViL05mT2wrQ2pSMGkvU3AvZXlmTlpRWndlVW1NbkR4bUYwUGtvYVZGeHpq?=
 =?utf-8?B?dWQwNlF4VmxYY3MxOWhPNmliekovYVpqTTl3eUpWU1Y2NFdvcGlxSWNpdG9Z?=
 =?utf-8?B?dzRIajJDV01MRWtEdmo2QXB0YXFhYy9aTGdIMnE0ZVBERzVaUEdGazY1Rzdl?=
 =?utf-8?B?V2cwU1VsQU1xSHNDN2VnbDFvZWN4SEZzT1NxZXIrbCt2cFpQeXBWUVRTVHVp?=
 =?utf-8?B?M0MyaTJ5c0xLZGdYelRpZ0hNckJiSEFLYlBkZmtiQmRtNTFUdnZzNi9JelVM?=
 =?utf-8?B?U3NkUHVSTWxFRTd0amlJUkMwaTBTcUNQTG5WUzFPU0FtV3U5Z0ZWUnZNd0lq?=
 =?utf-8?B?SzNKcy9xb25MMWxycVk5V2Uzc211dVBpKzRpOUJDdHhOVDdzeEI0eE9kRTNG?=
 =?utf-8?B?TlRMNWR5NHJOM1FhMk1Yak1IV24vMWwwYXNUUmo1V1o2WVlYU3JTaHplMDQz?=
 =?utf-8?B?cWUrR05qUklzUlYvQnlSN2dFSndJZmlMN1NDS2U3SFFPc2pKQlpOZVZpeFpH?=
 =?utf-8?B?b1NPb1QwMFZvSVpHRC9tUVE3YWtCelhtWnh2bmlEWHQ1S2RybDA2Zm1CZmlI?=
 =?utf-8?B?OGd6dlArUUhDQTdRdUwyNE5wamc5Z1FCVzEyU21MUWpQRFZGWVUrb3NCOXNS?=
 =?utf-8?B?cEk5TSszOGZxNFEzbDN0UWNjNFphMGZvd3ZwNzFFVGE3OFdMRUFmenJwOWo0?=
 =?utf-8?B?U293NDU1ZXFvTS9WMSt0MkRHOWNrZkZaOERGN3NsZ2tibi84Q01FSXdJOTFU?=
 =?utf-8?B?dktlSFdvZ2xXSzVwcFJ3S3lTRFFRZEFQVnl3S2UvOE1TTDNyVzFoeE5mdGhX?=
 =?utf-8?B?VmdYbUFqMk1YYU54UUFxRVFWWjdHUi9FWGtiSk9sdkFGcHdFN2RXYkpLS3Qz?=
 =?utf-8?B?anRvQXR6OXAyRzZHbjcrMElMUG5wYWpYeGhBOFhOOUlyV0FObXJZY1NXeWRz?=
 =?utf-8?B?RmxMaUh0TFBRc21GYW0vOWs4N2NVWG1zT2t3ZlNmNDVuc21XN2dIZHl3S3ZE?=
 =?utf-8?B?SHl0dmF1Q2dhb1BvTWxISnhhMTlENlE3aGdBL2k0Vm9DQzVuRFUwOTg1Zm5t?=
 =?utf-8?B?VFJrZGNNaG5mTmlJZ1B2MWprVjVETlhuVmtVRk53b25yUWREQWVEZzNxOVBI?=
 =?utf-8?B?cG1qSk5ab1RVbGlIV1FEZmNibVlvVUZWWWoxQlRTdlJBc3gxcEVaZVVubFVR?=
 =?utf-8?B?T3cwRWN5VmQ5UHllTVk1UjR5NlhDYkJSQUFGMGl3bXRkTTRGSWdiaERaaW1O?=
 =?utf-8?B?RlhJOVQxWXN4cENuamFWSk5neVVwVlF3bVFCVWdCRG51VWRHaHVES2ZCQUp3?=
 =?utf-8?B?THM3Ti96ZGtTY2xVcE1Hb1BBQmxlb2lHUDk5bUszcm5YUTI3R2tOaGFneVZH?=
 =?utf-8?B?NGxvZlQyMDVBOTdyRmNmK1VrUFlKa1lJdS9aK0JKMnBZSmVPVTRUdWM1citl?=
 =?utf-8?B?cGdJWE83WUkzOTUzQWJMOFlUMTJvblp0cW1kL2R2Znpja0VrNkJBYW1DV0xr?=
 =?utf-8?B?VDR3YlRFdnFtNTVKaWxEOU5iKzB5SEM5UTFzNzRMbVZrdDVaN04wUGxTS3JW?=
 =?utf-8?B?OXVyNVl5Z1YzWVZ3WnQrUkpNVk9ZU1VZVlg0Y0RqOEJZMmRTenpRT3lnLzN0?=
 =?utf-8?B?ZXpZTmNHMzBkVEYrZmtBYWxMY3RVUHVnN0xzLzMwVVJYRGxNU0IvSWlLdUNK?=
 =?utf-8?B?MEpLUTJQa3BBNEIyMkkrWm9INk9RbVExTmJkNjVmQ0d1MUVzYmJ4S2VrMFQ0?=
 =?utf-8?B?OTM3WEdsazBrbjBwQlliWW1nemhQcUhXbzN0RjhMKzMrN08ySmgwNVZvbEpk?=
 =?utf-8?B?UlBydko5bUpNMDVJam90RXZHQ2JJOUYveU5kQXJ4S1YxSzlMMG1SQTVLWlM5?=
 =?utf-8?B?MFlkSTFMdmNRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(7416014)(52116014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXBQRFJwMWlHMStDMU9QRHhFOFdFVy90U3ZlWkViMldKNjVzU1MwR0JHQmlm?=
 =?utf-8?B?dDZRZ2pGSG1FY1M3WSt2bEpobWNmK0toa3hKSkVIY0ZldjBmSnNSWWRTSUp1?=
 =?utf-8?B?MmFmWEVyVDRmV1pDNmQ1NnpmaE51Q1ZYZFFaam14dlBLclRJeThPU0dPTU5l?=
 =?utf-8?B?NW50d3I5dGJyUkUrdW5ld0RiUm9sS2VFY0JsV3B4UG1tempjR25HbllyRk1G?=
 =?utf-8?B?S29xTitrYlc5UmVDT0VMYTAvdGxRZjBUdUJYSG5Nbk5xRmtienZ1L3ltbHox?=
 =?utf-8?B?bnBaSDhuTXNuOEdxR3JvRXdkb3ZRbDhxUlBON3ZDWE96cWhPRUNPMXZ3aEk0?=
 =?utf-8?B?d1RwK3RBdG1wTHZaQU9CUm9xMU1yUldJSm9tN3ltbGlwdUhoeWVWUW1VYXZh?=
 =?utf-8?B?czM0U0pXUVRTLzdEVjNwSWNMTEpUWUJRNE0rQS9yeFlLRzA2dGkvZVp5ME5s?=
 =?utf-8?B?QUUweDNhSEd3WldTZU9JQ0YrbHBPeVVSTEJnRUx3SjR0dWFrakdpUThSVzlu?=
 =?utf-8?B?R0QvRStNeFRjeERHNGVYMWp6RENjVldoVm0ybHE4UHhKRy9yTHRsVGhDOVpQ?=
 =?utf-8?B?ZFZoTzVGL3ZXN1JJdVgwR3VESHkrYWdWSjRqMnNlL3VWQTc0NTBPN2VXcGpm?=
 =?utf-8?B?QUg5MG5EMWkvQWxycnkxNFRudHJnbjNFZHZjUlFJTytDQ1gzVTNCU0VyQ0VL?=
 =?utf-8?B?aVpJaHNUMXFOb3ByN2dqbFRTdGFpaktjZ29UY0QyQmx2WVBaaVorLzdOZzRi?=
 =?utf-8?B?NCtqR1p1Y3g5WGtGaXlVOGwyMnZmQ3hkQ0sxcXhGWS9SeENDUU1saWxSak9H?=
 =?utf-8?B?c3pLQXlBSXk3Uk5MYzVscFU4cHh3cjBHQ1pFRkdZMDRmbkN5TG8yMEhJQVN3?=
 =?utf-8?B?d0IrQjNRREVSTy9TeHRGYzhvVWpLNElQVC8wWnZlRklDNVJyYkE0OXhjRGg1?=
 =?utf-8?B?UHpMSDdvSy91VjEvbnFpNml4Uk5vVHhBMUh6c2NYbVNwT01vZnA1NVlCMy9i?=
 =?utf-8?B?YXgxQ2lHeVBnQmpXa3BiMitEaFQ2YmtSd0t6NHBEYS9kUDYybnFLaDJjamFl?=
 =?utf-8?B?ZFdkLzZXUVVCaWxPNCtrZ2w3eDh0c2JXaEJqcDE1cnFBUHZqMkM1c2dNRjNS?=
 =?utf-8?B?NWlRc1FRT1luQzZWUnJzRjErNnBXU0d4ZTNoeFZSdS9CQWxWVTV5UEI3dXk1?=
 =?utf-8?B?Mmt6cmJDdEJyUE5Td05GWGZWejM4ZEh2Ly9zMFIyQ05WQWtYb2JpNVRLeFA0?=
 =?utf-8?B?L0hjamg4Z2FnYWNkNkZHY1BPWW8yaWsrYXpMZ0J1WnhwOUY5WnRuZVJ0MTV3?=
 =?utf-8?B?NEpBdXpJQ1BhTHlmY1dtMmUvZFJqUGJJRzFwSzA4NDVZZGo2SEhQQnVCais5?=
 =?utf-8?B?amRTZmxrMHRNUVJyZEVKTVZrU0FTeXlvOHFVZ09vS256MDA1ZXZhTEEzbXdq?=
 =?utf-8?B?WEhxRlEvVWRVRjYybEJWdENPcUpQa1B6ZCs2Y3ZjNHg1ZjdzTXNSMk94eDFq?=
 =?utf-8?B?RnZ3SVlmK2FHclJQWlQ2OWxXSTE0ZFgxYjE5blFFcFpyY2J0eFQyNkQ5MDB1?=
 =?utf-8?B?MkVlOERlNW54enFtdjlUeEJHZnI2L2tEQ1l4ZXV1QVpQUXVyaFU3amRqNVJT?=
 =?utf-8?B?V3VvTGtCR1RmL0lMSzVVc0w4UTJXaHU3OWZ5Q0JiZlVrTXo1Yms1VXRrYzVN?=
 =?utf-8?B?QzRiMlczR05KTUFEbmRERTBpTTc0THNNRlhITUNJZE9ZblZCQjJWMUUvS0V2?=
 =?utf-8?B?SHVqc0M4L1pOVkN4VVBpcGlaNHlrUG5qcktkVXdZMHhIRmRQRUpKT2szaE1Q?=
 =?utf-8?B?blhlK2Z0cVBURXNBRGpIUVdNaFJjUEpja1FPeVpyRFIxS3BEY1FxWGFjR1k1?=
 =?utf-8?B?K1dmWGxuOGtmVXJqdlhWRjdiZWZjWk9oS1Q3QlRZb0tNbXRLNDlFQmdUVWRG?=
 =?utf-8?B?cm56NEhtc1lvR2tqeTEyZmFxTU5hZVB3OGw5YklkUFJFMzRNbU1uV2VveTdk?=
 =?utf-8?B?cVVaOVkvdG9PdG9SMWZXZnM5dkVpY280MEhwNjZKSlpmdzJqcEFCTXhhQVZi?=
 =?utf-8?B?ODBMWWE1RUF3SUd1b0ZPTk9NNGxNeTBiZmZhTnNWd3lDN2JDM2tjbkgrczc5?=
 =?utf-8?Q?JgyU8NY1Lnsyzybme3xTmSmPM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19d2af3f-9c3f-4389-af51-08dde4b7e9a3
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 15:47:50.8237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k5lvDLsqetSdmSQUm7U6Jx52KE4S594Y20YNoJ3FVbkY2uiMtIuEDvztjfvrihYlvnDU8cNQ0BvA+q+1t5nGgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11524
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_084814_389238_2E519E18 
X-CRM114-Status: GOOD (  20.58  )
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

T24gTW9uLCBBdWcgMTgsIDIwMjUgYXQgMDE6NTE6MTNQTSArMDIwMCwgSm9yZ2UgTWFycXVlcyB3
cm90ZToKPiBBZGQgYmluZGluZ3MgZG9jIGZvciBBREkgSTNDIENvbnRyb2xsZXIgSVAgY29yZSwg
YSBGUEdBIHN5bnRoZXNpemFibGUgSVAKPiBjb3JlIHRoYXQgaW1wbGVtZW50cyB0aGUgTUlQSSBJ
M0MgQmFzaWMgY29udHJvbGxlciBzcGVjaWZpY2F0aW9uLgo+IFRoZSBJUCBDb3JlIGlzIHZlcnNp
b25lZCBmb2xsb3dpbmcgU2VtYW50aWMgVmVyc2lvbmluZyAyLjAuMCBhbmQKPiBBREkncyBvcGVu
LXNvdXJjZSBIREwgZ3VpZGVsaW5lcyBmb3IgZGV2aWNldHJlZSBiaW5kaW5ncyBhbmQgZHJpdmVy
cy4KPgo+IFNpZ25lZC1vZmYtYnk6IEpvcmdlIE1hcnF1ZXMgPGpvcmdlLm1hcnF1ZXNAYW5hbG9n
LmNvbT4KPiAtLS0KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvaTNjL2FkaSxpM2MtbWFzdGVy
LnlhbWwgICAgfCA3MiArKysrKysrKysrKysrKysrKysrKysrCj4gIE1BSU5UQUlORVJTICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDUgKysKPiAgMiBmaWxlcyBjaGFu
Z2VkLCA3NyBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2kzYy9hZGksaTNjLW1hc3Rlci55YW1sIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2kzYy9hZGksaTNjLW1hc3Rlci55YW1sCj4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
Li5mZGEyNDBmOWVlMGM3M2JjYmVhOTdmNzc1ZDZlMDgxZmUwYzA4OWQ5Cj4gLS0tIC9kZXYvbnVs
bAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pM2MvYWRpLGkzYy1t
YXN0ZXIueWFtbAo+IEBAIC0wLDAgKzEsNzIgQEAKPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZQo+ICslWUFNTCAxLjIKPiArLS0tCi4uLgo+
ICsKPiArICBjbG9ja3M6Cj4gKyAgICBtaW5JdGVtczogMQo+ICsgICAgaXRlbXM6Cj4gKyAgICAg
IC0gZGVzY3JpcHRpb246IFRoZSBBWEkgaW50ZXJjb25uZWN0IGNsb2NrLCBkcml2ZXMgdGhlIHJl
Z2lzdGVyIG1hcC4KPiArICAgICAgLSBkZXNjcmlwdGlvbjogfAoKTmVlZG4ndCB8IGhlcmUuCgpG
cmFuawo+ICsgICAgICAgICAgVGhlIHNlY29uZGFyeSBjbG9jaywgZHJpdmVzIHRoZSBpbnRlcm5h
bCBsb2dpYyBhc3luY2hyb25vdXNseSB0byB0aGUKPiArICAgICAgICAgIHJlZ2lzdGVyIG1hcC4g
VGhlIHByZXNlbmNlIG9mIHRoaXMgZW50cnkgc3RhdGVzIHRoYXQgdGhlIElQIENvcmUgd2FzCj4g
KyAgICAgICAgICBzeW50aGVzaXplZCB3aXRoIGEgc2Vjb25kIGNsb2NrIGlucHV0LCBhbmQgdGhl
IGFic2VuY2Ugb2YgdGhpcyBlbnRyeQo+ICsgICAgICAgICAgaW5kaWNhdGVzIGEgdG9wb2xvZ3kg
d2hlcmUgYSBzaW5nbGUgY2xvY2sgaW5wdXQgZHJpdmVzIGFsbCB0aGUKPiArICAgICAgICAgIGlu
dGVybmFsIGxvZ2ljLgo+ICsKPiArICBjbG9jay1uYW1lczoKPiArICAgIG1pbkl0ZW1zOiAxCj4g
KyAgICBpdGVtczoKPiArICAgICAgLSBjb25zdDogYXhpCj4gKyAgICAgIC0gY29uc3Q6IGkzYwo+
ICsKPiArICBpbnRlcnJ1cHRzOgo+ICsgICAgbWF4SXRlbXM6IDEKPiArCj4gK3JlcXVpcmVkOgo+
ICsgIC0gY29tcGF0aWJsZQo+ICsgIC0gcmVnCj4gKyAgLSBjbG9ja3MKPiArICAtIGNsb2NrLW5h
bWVzCj4gKyAgLSBpbnRlcnJ1cHRzCj4gKwo+ICthbGxPZjoKPiArICAtICRyZWY6IGkzYy55YW1s
Iwo+ICsKPiArdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQo+ICsKPiArZXhhbXBsZXM6Cj4g
KyAgLSB8Cj4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIv
aXJxLmg+Cj4gKwo+ICsgICAgaTNjQDQ0YTAwMDAwIHsKPiArICAgICAgICBjb21wYXRpYmxlID0g
ImFkaSxpM2MtbWFzdGVyLXYxIjsKPiArICAgICAgICByZWcgPSA8MHg0NGEwMDAwMCAweDEwMDA+
Owo+ICsgICAgICAgIGludGVycnVwdHMgPSA8MyBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKPiArICAg
ICAgICBjbG9ja3MgPSA8JmNsa2MgMTU+LCA8JmNsa2MgMTU+Owo+ICsgICAgICAgIGNsb2NrLW5h
bWVzID0gImF4aSIsICJpM2MiOwo+ICsgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDM+Owo+ICsg
ICAgICAgICNzaXplLWNlbGxzID0gPDA+Owo+ICsKPiArICAgICAgICAvKiBJM0MgYW5kIEkyQyBk
ZXZpY2VzICovCj4gKyAgICB9Owo+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlO
RVJTCj4gaW5kZXggMzVlZDg0OThhYjFlOWI5MmI0YmNlNWRiOWJiNjQwMDRkODBlNGIxYS4uZmFh
NTA1MzViNTE0MDM3ZGRmOTczMDk4NzRlYzY0YWFjMjAxM2NiNiAxMDA2NDQKPiAtLS0gYS9NQUlO
VEFJTkVSUwo+ICsrKyBiL01BSU5UQUlORVJTCj4gQEAgLTExNDUyLDYgKzExNDUyLDExIEBAIFM6
CU1haW50YWluZWQKPiAgRjoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kzYy9h
c3BlZWQsYXN0MjYwMC1pM2MueWFtbAo+ICBGOglkcml2ZXJzL2kzYy9tYXN0ZXIvYXN0MjYwMC1p
M2MtbWFzdGVyLmMKPgo+ICtJM0MgRFJJVkVSIEZPUiBBTkFMT0cgREVWSUNFUyBJM0MgQ09OVFJP
TExFUiBJUAo+ICtNOglKb3JnZSBNYXJxdWVzIDxqb3JnZS5tYXJxdWVzQGFuYWxvZy5jb20+Cj4g
K1M6CU1haW50YWluZWQKPiArRjoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kz
Yy9hZGksaTNjLW1hc3Rlci55YW1sCj4gKwo+ICBJM0MgRFJJVkVSIEZPUiBDQURFTkNFIEkzQyBN
QVNURVIgSVAKPiAgTToJUHJ6ZW15c8WCYXcgR2FqIDxwZ2FqQGNhZGVuY2UuY29tPgo+ICBTOglN
YWludGFpbmVkCj4KPiAtLQo+IDIuNDkuMAo+CgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdAps
aW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
