Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CA5606A324
	for <linux-i3c@archiver.kernel.org>; Fri, 27 Nov 2026 14:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MF5C5bG4;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=SJk80CWj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cycrX+LhZVpFcqqIPzYl4EEg0OBhOiwB+1fM9fgUI0M=; b=MF5C5bG4EwMK4OKuAB5kq3QGJp
	la9vAyBg9bPg2ehRgqcOgwPiGgh49beaqbYodOWyG0nwoVu+vmygYj9hEEuPAwEfvk0NjBYmswgHm
	P+ZNN6Ry0xRgT8JDVfQE11yBHZMbhaJeMNwZndcsx6oH8BINncS4VwEu/O7rYuzhsQd77ktJsxQVO
	sGiOxf8QdTRgFWF84n+iFZyuIfWbfNxE2VA7f+xoqlRgwXw9L3MpdYLEyraslJGX7qsqHrj7qvPMS
	q3BDzMTxEeS6wHeHvqws49Q5Yw+9NN4QlOYTgSVvVoTtLv9DiYwpedM/VjORcAswFG9LJxvuYttTN
	hGORiw7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwY8-0000000GKOg-43hB;
	Fri, 27 Nov 2026 14:03:40 +0000
Received: from mail-japaneastazon11011010.outbound.protection.outlook.com ([52.101.125.10] helo=TYVP286CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwY6-0000000GKOG-00hl
	for linux-i3c@lists.infradead.org;
	Fri, 27 Nov 2026 14:03:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZXDzPELxi84KZfyXwXxq34wshgyxdQle7fZlC9QwMeeGBazQyh/alb3rtS56uFTQHjpTxmcP2Voe0KangfoF09XQNpVzjZeZ8w0XuzeMknaMcwJc5PvVaJh49eQU3EUM42JVYqWgDt4NUdaKWR0RHkQDnPT1BDSfGimaB7+gnwHmLYicJw7Ps/aJMuM5mGLf+ijEjXRbBQCktm7IjnA9LtG6eX5qBmPCZ2i6SRNvi48YHQI6sQ1agqEAaLRgyVettN9uyV/Jlu8MVxdS/iTUpXYr7GjjQ1XUXA958Pz/2pNdKSQj8ZkVQc6++r3OkkPfDh6+JGRew11VwxPp6C/YbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zw3BDxoUMUSM4pfTd8rHkBLWzaP8G9KucdYmFlLZ+Ek=;
 b=FMzNBfcKQ7oNj70c+l1Yq4vEoSWrxayf9M5vbqhJvL3Cxxr+wZnEZN28nalIqyN02+oSBuiIq+/dcV/Qv+GIXcHdXJHUrggfqCfdEhQJQ/jpd7DXA1U3hPmE0rMJWGptxNkNe5wsFEQGfVYbYNiK8iDhifvPrOn2dSQzsjQgQHnCZIBJYnSu2Kiuwndn0uGT6IFkc2+Kj+rK1Xwtc8jB5PQkS5kK/Hx8pgLWEFmZrjyU4z9ty/gItLw5LzKVJZMdmKspwtewb5rY6tKQ39s3U0wD/IJSItwRcuiuvhid9pVT1C5xjaEURmK8AkdHVPsS2/rb0ZLVK0rLg0w9iuj2xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zw3BDxoUMUSM4pfTd8rHkBLWzaP8G9KucdYmFlLZ+Ek=;
 b=SJk80CWjzYqNfCzIYXI6n0qL8F9XIDSUZTTDxPNzLoCggysrLHm5kKeqJujZT93k6+2fzDsP64tY+NBaNIVyJ0JzHNnBxIC6EiojWYY7gLFafXCEuAOStosWkIamw3nRz/wMpLW9fWmLiVja/lTyjB3MU2E3jUIHQT9TsPH5oGs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15118.jpnprd01.prod.outlook.com
 (2603:1096:405:1a1::11) by TYYPR01MB16055.jpnprd01.prod.outlook.com
 (2603:1096:405:2e0::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Fri, 27 Nov
 2026 14:03:31 +0000
Received: from TYYPR01MB15118.jpnprd01.prod.outlook.com
 ([fe80::1116:d56:8164:63b4]) by TYYPR01MB15118.jpnprd01.prod.outlook.com
 ([fe80::1116:d56:8164:63b4%6]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 14:03:31 +0000
Message-ID: <5689301f-f7b0-43ce-9555-22faa7af965d@renesas.com>
Date: Fri, 27 Nov 2026 15:03:18 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] pinctrl: renesas: rzg2l: Split SoC-specific masks
 in struct rzg2l_register_masks
To: claudiu beznea <claudiu.beznea@tuxon.dev>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-0-2e76b87209bb@renesas.com>
 <20261026-divo-ssgrlpcsrc-2966-i3c-v2-5-2e76b87209bb@renesas.com>
 <121cc552-86b6-40de-ba9d-0ae40f8a1ed2@tuxon.dev>
Content-Language: en-US
From: Diogo Ivo <diogo.ivo.sx@renesas.com>
In-Reply-To: <121cc552-86b6-40de-ba9d-0ae40f8a1ed2@tuxon.dev>
X-ClientProxiedBy: FR4P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::17) To TYYPR01MB15118.jpnprd01.prod.outlook.com
 (2603:1096:405:1a1::11)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB15118:EE_|TYYPR01MB16055:EE_
X-MS-Office365-Filtering-Correlation-Id: c5ca39c4-92ef-429a-5d42-08df4c8f37b7
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|921020|261022105027099003|10067099003|56012099006|261026140227099003|261021123027099003|261021121427099003|261028144727099003|261102123227099003|261009223027099003|22082099003|18002099003|11063799006|4143699003|3023799007;
X-Microsoft-Antispam-Message-Info: LTITDroOsYtdAb6wcjDELNEinz8oPVGGIG1jmW5V4muWHQUzL8U+UdYKlXeev2QcRwfcISRZAYHqFufuRndMOyKgXVWPUjCYaM5RffNmvi+3dTKLyUtU0mXrfVqI23QZfpLJM3ffMdokDNjO2TDoYaW6bZDKNSXZW2ZqJaRYnfJ4Nt60/DVIUWtXBgxLXp77jo4IPSHRV6VVDI9Cf00nzcwoJ9aC2A2WFXD8jv4TeM+n8oNqbd1nNm+Nur4/ERw5GXbo1Sk20M3d/B8Dkf9+fMTrfgB/7MLkaF1e60c3b/5wmP977dgD+lJVf1rpsXj5Avl5cILtKn/VJebRCzQiNJsUf4rgg5um6HkBDTElAML3iiwntnvuTnA9Tp6JmRYp5cdmY20dylBKmN4V7b6522SA0nTH/HyZ37tXAeArN4azItUA09Eg1PBQDZdM6Ip0Bt19yzZpbsDrXgf8gZSLuM5tR/Cm+sMkfDJtZES/sYL4oEf/9XP1tcWu5X3XSLMebL9aHXYIJaiDQ6MXrFkOi7Vbkp3YEuAgmdTb0WyWK7HHdUlAURvitW5qBt7Y2MBU/M7xPJFMZXakr1+fMtMWZ24Vo63gurckFZDFA1Py2xQBmA8EqMat5RqutOAVxOjU+h5+D3Kx06wKt63rMGHs7RkrreG1NU4sBRhw+n5RcDUhqxqPpmVOIFUCZ5WhK8Gpho3yMlQgvWO8IY4Q2IVM5A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(921020)(261022105027099003)(10067099003)(56012099006)(261026140227099003)(261021123027099003)(261021121427099003)(261028144727099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(11063799006)(4143699003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjFwUlB1MlJGUXFudFJ6UjQ2emxJc0ZaUGtweXBMK1N5bS9oMjdObzdnYkxw?=
 =?utf-8?B?clRpMWV6TWYycnZaSFpBNlo5NnJlVEtISE9ZNFRUckIwK0hpRGtZK1ZmUy9F?=
 =?utf-8?B?TEhzcDNjdS9OemxpY1hFWEsxWk4xMFVtRW9SMk5nV0hrNnpqVG12ZWh4T2t5?=
 =?utf-8?B?Z1Q0VjRWRndzOXJaUjA5U0JPdUU4QTBwanl1OW9PTzVVTjVBOHk0NUt3REo4?=
 =?utf-8?B?RG40UTh6QlZONENyd0V0SUcvNitoYnp2QmtweTZrSFRPcUlrUnNQd0xDaGFN?=
 =?utf-8?B?Z21kb0l1YWJxR0tycVZLVjJZT0lrTVgyQVEyN29Sakx4QkJ0dHNPaU5hdjNj?=
 =?utf-8?B?NjNjS3ZudnFvblhQNFAxSGZmWnZ0ekVQYkJlajdGQnEvR0FNcTZCd0RVVUJk?=
 =?utf-8?B?U3lMNk5kWklaUVAzdXFkT2xpRFR0MlBjZVZpdS9SVXp0Mnk5QW5zL1FUTjJO?=
 =?utf-8?B?cUh3eG1SbVNUcktFWXRkOHhFMXBrNjBvb3BVTWFpKzVtYUNKazdobTd1bXB2?=
 =?utf-8?B?QXNtenJZWlZtWUNVOHJrQlZKN0J1Um5zV2tkNEdxVmlub3hDeFJreFJpUHZQ?=
 =?utf-8?B?a0wxWFFnbXN6RWozWnhVS0pTVUNHQXROTnM2RjJOYkNHcE9XRTkvSzJDRmU1?=
 =?utf-8?B?bE9rTGNPOU5OWm1NR004M0hwQ0pHOFZIREs3aVdNL1R2Qk9QOHgvdytVN0hP?=
 =?utf-8?B?SzJhdDBFbE93dlBLLzAzbzhrRkhqUUViMkhRK1k2clNlckpyZFg2WUh6aDgw?=
 =?utf-8?B?WHl6b2QrR2d3bmhXS3ZoZ2xPd2RQbVE0dWhiZnBmUHJ1WDVPU0JBVHFuNlI2?=
 =?utf-8?B?K0p1clQ5NVlxcUp5S0p6SW5jWEJpbU13L0VodlgrUEhobFQ0ZHpHaDZkb1Ax?=
 =?utf-8?B?NlZqZEZYVXpvcDBKUEdiUGpvSEZSWUxaOU83d01nOFpTbXdmYUNlRGc3OXQv?=
 =?utf-8?B?RXh1aVhjNzlBWmVYNE5pOXNaazRJcWZ1TXdodTJuTnpSVTdjaFUrd0lxd3Y5?=
 =?utf-8?B?Q0VtSzBNZG5GREpEc0tGRG5pa05tUWQ4bXBBeHFDc3MyM1lBSXluazg3YVd5?=
 =?utf-8?B?WXdROEJRYmJjLzlwUFBvbFRLdWx4UEw3bTdFRmtWSVA1bk51eXJKNytqSUZl?=
 =?utf-8?B?N2Jlc2l2MlZFVy8rR0c3MnNFREN2dWJZSzZ2SmlsWDNweStEZDZITTA2MCti?=
 =?utf-8?B?eGN1WmliQ0hoQVRIcnR5ejFVOHQ1Q0NPZCttNktBOCtBTTlVdlhKQ0FTMmFl?=
 =?utf-8?B?VzVsaVYzVzZHNnRWVjhleUtKK3VJYWROVmJmTDBETVpDdU9FREg1bU1Vakh3?=
 =?utf-8?B?UEE0VXJMWnpodEp0YW5rUTJhaCtmK0txc3VDMkFBOUY1Vkt5cDE4Q3ZobVhW?=
 =?utf-8?B?NWhuQTQyNWpGVWVMZStLNFBQbDhMMTZCUDFoUnc3OElzMktFMHliQ21vMnFD?=
 =?utf-8?B?YmdmTTFBd05YZnRQZUFkblNLSjdrT0hqZlh6YW56Z1V5V0lFS2pLbUY3ZTRj?=
 =?utf-8?B?TkFjUCt1YmVaWWFFdjdENkNLN0R0VHkrczA2UjFzTi8zR0tBMmdocEVRUVlT?=
 =?utf-8?B?MVdXM3gxTGwzV1pxV21oNFlIa2hMMHZOaE9XYlR6Mk52cGprVXgxb0QreW84?=
 =?utf-8?B?V2lOWEVGUGxtY1lTNFVmWithR2J6NE4yY1RPMUpXSkUxL0hUNVZJK09YNExw?=
 =?utf-8?B?bXdrLzhzWEtXQ3dKcTFkMWJSOU9IdVEzWm9USXhSbkNIMXJWck80MVFORzg0?=
 =?utf-8?B?bnR2RGtVanBKVnJWTjgzT2F6QU93bHkzSWlkaDNlUFRobnh1Z2VNVzBVR1Rl?=
 =?utf-8?B?dGdxREloQmZBVSs1VUVlZGNOZCtYY3pzK2hLbVl4TURhdXFDczJiNUZXK2Nm?=
 =?utf-8?B?MERBaE5SN2trTS9jUDBoampMd1hZNmt4MkFCOEx3eWNYN1FvTTNHZXZoZ04z?=
 =?utf-8?B?YlRUVlNPcnlVOGczcWZ4SThFOGdtNHlTTTZtak5TSVlLeHJCTFdkZVNRcWNM?=
 =?utf-8?B?ZFJQNXVCU3dISE5MZkVlL1E5ZlhBTElSaGdLNHE4Sm9vMkJnTnE4dUp2bjBE?=
 =?utf-8?B?NjVBR29rckNBMmFJaVFwaUlPYkx5alpVWUxDZWpocHpHak45SEs2R0RhZ2dR?=
 =?utf-8?B?dG0xQmRLMEFrdmJUMzlQV29JL1EzZDUydy94UHNtQmo3Z1QrL3drS0puY2c3?=
 =?utf-8?B?eHQvcnN0SHdaTDhIWHFGS2ZacEdab0FGR0pmeW5LcEdvMkV2VU9STUltMGpZ?=
 =?utf-8?B?TjhiczUxeCtNcUdQNTRGcU5wQng1Znh0UUVnTWpwTFhVcGhUelFjQ2JRWlAy?=
 =?utf-8?B?cGlORW92WTZEMG92RTc4Qk1jd3JjUzZueHFBbzAvZWlIWW1MaHMvZz09?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5ca39c4-92ef-429a-5d42-08df4c8f37b7
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 14:03:31.2062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vn4fSjUB66P2wYqn85XL2U43uqcpAZr+V4fNWIpc9sRlGJ4UdEHaYlDpwOFMd+L3IY5Dmr1c5De2UVLP6MJfZ0Myzbgfsjgak0dvRT2G1uU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB16055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_060338_073727_103826C6 
X-CRM114-Status: GOOD (  23.43  )
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
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgQ2xhdWRpdSwKCk9uIDExLzI3LzIwMjYgMTA6MTYgQU0sIGNsYXVkaXUgYmV6bmVhIHdyb3Rl
Ogo+IEhpLCBEaW9nbywKPiAKPiBPbiAxMC8yNi8yNiAxMzozNSwgRGlvZ28gSXZvIHdyb3RlOgo+
PiBzdHJ1Y3QgcnpnMmxfcmVnaXN0ZXJfbWFza3MgZGVjbGFyZXMgdGhlIG1hc2tzIG9mIHRoZSBP
VEhFUl9QT0MgcmVnaXN0ZXIKPj4gb2YgUlovRzNMIGFuZCBvZiB0aGUgSTNDX1NFVF9QT0MgcmVn
aXN0ZXIgb2YgUlovRzNTIGluIHR3byBicmFuY2hlcyBvZiBhbgo+PiBhbm9ueW1vdXMgdW5pb24u
IEFzIGJvdGggYnJhbmNoZXMgc2hhcmUgdGhlIHNhbWUgc3RvcmFnZSwgaW5pdGlhbGl6aW5nIAo+
PiBib3RoCj4+IG90aGVyX3BvY19wdmRkMTgzM19vdGhfYXdvX3BvYyBhbmQgaTNjX3NldF9wb2Mg
b24gUlovRzNMIHdvdWxkIGhhdmUgdGhlCj4+IGRlc2lnbmF0ZWQgaW5pdGlhbGl6ZXJzIG92ZXJy
aWRlIGVhY2ggb3RoZXIsIGVuZGluZyB1cCB3aXRoIHRoZSAKPj4gSTNDX1NFVF9QT0MKPj4gdmFs
dWUgaW4gdGhlIFBWREQxODMzX09USF9BV09fUE9DIG1hc2suCj4+Cj4+IFNwbGl0IHRoZSB1bmlv
biBpbnRvIGEgY29tbW9uIGFyZWEsIGZvciBtYXNrcyBzaGFyZWQgYnkgbXVsdGlwbGUgU29Dcywg
Cj4+IGFuZAo+PiBwZXItU29DIGFyZWFzOiB0aGUgUlovRzNTIGFuZCBSWi9HM0wgSTNDX1NFVF9Q
T0MgbWFzayBtb3ZlcyB0byB0aGUgY29tbW9uCj4+IGFyZWEsIGFuZCB0aGUgUlovRzNMIE9USEVS
X1BPQyBtYXNrcyBzdGF5IGluIGEgZGVkaWNhdGVkIFJaL0czTCBhcmVhLiAKPj4gVGhpcwo+PiB3
YXkgZXZlcnkgbWFzayBnZXRzIGl0cyBvd24gbWVtYmVyLAo+IAo+ICA+IGFuZCBuZXcgU29DcyBj
YW4gYmUgZGVzY3JpYmVkIGJ5PiBhZGRpbmcgdGhlaXIgb3duIHN0cnVjdAo+PiAocG9zc2libHkg
aW5zaWRlIGEgdW5pb24pLgo+IAo+IFRoYXQgbWF5IGJlIG1pc3NlZCBieSB0aGUgbmV4dCBwZXJz
b24gYWRkaW5nIGl0Li4uCgpBY2ssIHRoYXQgaXMgYSBnb29kIHBvaW50LiBJIHdpbGwgYWRkIGl0
IHRvIHYyIGlmIEdlZXJ0IGlzIG9rIHdpdGggdGhpcyAKYXBwcm9hY2guCgo+Pgo+PiBUaGUgZXhp
c3RpbmcgUlovRzNTIGRhdGEgb25seSBpbml0aWFsaXplcyBpM2Nfc2V0X3BvYywgc28gaXQgaXMg
bm90Cj4+IGFmZmVjdGVkIGJ5IHRoaXMgY2hhbmdlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBEaW9n
byBJdm8gPGRpb2dvLml2by5zeEByZW5lc2FzLmNvbT4KPj4gLS0tCj4+IENoYW5nZXMgaW4gdjI6
Cj4+IMKgIC0gTm8gY2hhbmdlcwo+PiAtLS0KPj4gwqAgZHJpdmVycy9waW5jdHJsL3JlbmVzYXMv
cGluY3RybC1yemcybC5jIHwgMjAgKysrKysrKystLS0tLS0tLS0tLS0KPj4gwqAgMSBmaWxlIGNo
YW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3BpbmN0cmwvcmVuZXNhcy9waW5jdHJsLXJ6ZzJsLmMgYi9kcml2ZXJzLyAKPj4g
cGluY3RybC9yZW5lc2FzL3BpbmN0cmwtcnpnMmwuYwo+PiBpbmRleCA5YmYzNzQzZGMxY2UuLmY3
M2QyNzNkZjM2MiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9waW5jdHJsL3JlbmVzYXMvcGluY3Ry
bC1yemcybC5jCj4+ICsrKyBiL2RyaXZlcnMvcGluY3RybC9yZW5lc2FzL3BpbmN0cmwtcnpnMmwu
Ywo+PiBAQCAtMjc4LDE4ICsyNzgsMTQgQEAgc3RydWN0IHJ6ZzJsX3JlZ2lzdGVyX29mZnNldHMg
ewo+PiDCoMKgICogQGkzY19zZXRfcG9jOiBJM0NfU0VUX1BPQyBtYXNrCj4+IMKgwqAgKi8KPj4g
wqAgc3RydWN0IHJ6ZzJsX3JlZ2lzdGVyX21hc2tzIHsKPj4gLcKgwqDCoCB1bmlvbiB7Cj4+IC3C
oMKgwqDCoMKgwqDCoCAvKiBSWi9HM0wgbWFza3MgKi8KPj4gLcKgwqDCoMKgwqDCoMKgIHN0cnVj
dCB7Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHU4IG90aGVyX3BvY19wdmRkMTgzM19vdGhf
YXdvX3BvYzsKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdTggb3RoZXJfcG9jX3B2ZGQxODMz
X290aF9pc29fcG9jOwo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1OCBvdGhlcl9wb2Nfd2R0
b3ZmX25fcG9jOwo+PiAtwqDCoMKgwqDCoMKgwqAgfTsKPj4gLQo+PiAtwqDCoMKgwqDCoMKgwqAg
LyogUlovRzNTIG1hc2tzICovCj4+IC3CoMKgwqDCoMKgwqDCoCBzdHJ1Y3Qgewo+PiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB1OCBpM2Nfc2V0X3BvYzsKPj4gLcKgwqDCoMKgwqDCoMKgIH07Cj4+
ICvCoMKgwqAgLyogTWFza3MgY29tbW9uIHRvIG11bHRpcGxlIFNvQ3MgKi8KPj4gK8KgwqDCoCB1
OCBpM2Nfc2V0X3BvYzsgLyogUlovRzNTLCBSWi9HM0wgKi8KPiAKPiBJIHdvdWxkIGRyb3AgdGhl
IG5hbWVzIG9mIHRoZSBTb0NzIGNsb3NlIHRvIHRoZSBpM2Nfc2V0X3BvYy4gVGhhdCBoYXZlIAo+
IHRoZSBvcHBvcnR1bml0eSB0byBncm93IG92ZXIgdGltZS4gQXMgR2VlcnQgY29uc2lkZXJzIGJl
dHRlci4KCk9rLCBJIHdpbGwgd2FpdCBmb3IgZmVlZGJhY2sgaGVyZSB0aGVuIGJ1dCBJIGFtIG9r
IHdpdGggZHJvcHBpbmcgdGhlIFNvQyAKbmFtZXMuCgo+PiArCj4+ICvCoMKgwqAgLyogUlovRzNM
IG1hc2tzICovCj4+ICvCoMKgwqAgc3RydWN0IHsKPj4gK8KgwqDCoMKgwqDCoMKgIHU4IG90aGVy
X3BvY19wdmRkMTgzM19vdGhfYXdvX3BvYzsKPj4gK8KgwqDCoMKgwqDCoMKgIHU4IG90aGVyX3Bv
Y19wdmRkMTgzM19vdGhfaXNvX3BvYzsKPj4gK8KgwqDCoMKgwqDCoMKgIHU4IG90aGVyX3BvY193
ZHRvdmZfbl9wb2M7Cj4+IMKgwqDCoMKgwqAgfTsKPiAKPiBPSywgd2UgY2FuIGRyb3AgdGhlIHVu
aW9uIGJ1dCB0aGUgbmV4dCBTb0MgYWRkaXRpb24gbWF5IGJlOgo+IAo+IC8qIE5ldyBTb0MgbWFz
a3MgKi8KPiBzdHJ1Y3Qgewo+ICDCoMKgwqDCoHU4IHg7Cj4gIMKgwqDCoMKgdTggeTsKPiB9Owo+
IAo+IElmIHdlIHdhbnQgdG8ga2VlcCB0aGUgaW5pdGlhbCBmb3JtIHdlIG1heSBuZWVkIHRvIHBh
eSBhdHRlbnRpb24uCj4gCj4gUGF0Y2ggaXMgT0sgZm9yIG1lLCBqdXN0IHdpdGggdGhlIG1lbnRp
b24gdGhhdCB3ZSBuZWVkIHRvIHBheSBhdHRlbnRpb24gCj4gaWYgd2Ugd2FudCB0byBrZWVwLCBm
b3IgdGhlIGZ1dHVyZSwgdGhlIGFwcHJvYWNoIGJlZm9yZSB0aGlzIHBhdGNoLgoKT2ssIHRoZW4g
aWYgR2VlcnQgaXMgb2sgd2l0aCByZW1vdmluZyB0aGUgdW5pb24gZm9yIG5vdyBhbmQgcG9zc2li
bHkgCnJldml2aW5nIGl0IGxhdGVyIEkgd2lsbCBzdGF0ZSB0aGlzIGNsZWFybHkgaW4gdGhlIGNv
bW1pdCBtZXNzYWdlLgoKPiAKPiBUaGFuayB5b3UsCj4gQ2xhdWRpdQoKCi0tIApsaW51eC1pM2Mg
bWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
