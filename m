Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6696D3514F
	for <linux-i3c@archiver.kernel.org>; Wed,  1 Apr 2026 08:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yPhYfaRfO33nRXUXo/8wR8rZ4h9MGS7VTXhFbHkkgU0=; b=YQtCRU1UQ3Xyyj
	hUNX9R9OkN+1CwEzd+nPBrmkQih5cdQbpDt3EaBPuCYe3snpI23S6EzMDg/JWBfEAWMD3EpiUCLTC
	GBCpBEROg3skZq/zwonTIFo8I+sy+yZIVt6vho2rX6hvDmdMw+jCqb4QfOjxuWniLH8f9y5TloRXv
	dpykzbZQd2FyF+fQd02RXiJpnBiD6PKwcu9JDpPVJDyolLVRKVvwMFMk8Ju6nv3NPWpKppq7So7HX
	YRPoxKBJpmTg4r5mQOrCVAJzBz7VbFblhuWvmUCg41/VaalGBzZD2Lk1F0PIFNLQroJOHsjXLkyHh
	KO5qDbhWPgFnPklXNtTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7qZW-0000000EGoL-2jnD;
	Wed, 01 Apr 2026 08:05:06 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7qZQ-0000000EGnV-3YYx
	for linux-i3c@lists.infradead.org;
	Wed, 01 Apr 2026 08:05:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xOk3DzV+bY72bOU/L1EHk0OTRRZWeimRG9+xasnvqJFYsMXm984ZZgLDA9PaV2jqi8ir0DlEvj9O2UmEYkY2Fkn5BknGf6dp0ogKg4i+W2ti1QHxn757KyCm9ekcwrw08OG9JJlRSQqjeqIxfOetBbEtea4jMq45BWdeiTO8SIYg2EIJhpKb7+hw+QZJXhTehZMvYNPibe1SjvzuT4Si64vnQGtmTsObGRskYqF43aMTGH8BURw427Nbnl01gZ2FxraGy4behI8iOE1cvIJrNzeIJWCvkyUa54gYMLeJtk7Y2U8L3vcCGS/WiD3qVNpV4gTku6sc9ht60h3iNGFEKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zloZZXrcxxP2MidzCHU6zhWWe7hxoRGhoqX/sUqm33I=;
 b=R6AgqpHYQM8At2Dhto6GvG3YZud0G0hz1zwk2QTTCvtFBWE9t2WxjWTZNzClUNfAlrQyLGmSTnqud4tUFtZ/9wtsLvTVMIceNHaED3dJo1W0QmZZ4a0aiaas2tifJhBfkToijDiG0o273aRl8qRMf39rD0kTf5rCtUB6EYniCx6ngg0PKkWuSlVllUoKsoEf/thm+2srf0idsPDvsH5QnzML3AS+T/XyIPqZ8wPYiZX11dZw1xKTe5oLxBASwN2zo9cJv0TYj93fpe5c1kOtDDn7L7lIoFbdD0kSvz33R7WhnJ9eB0K/oQsTymlrC6BNryiVnKMDU85g7W2ndxUCWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zloZZXrcxxP2MidzCHU6zhWWe7hxoRGhoqX/sUqm33I=;
 b=bxAFpx62b4R5gO22xIi3ZlwnvTHcGrpIFpwdorF3r97jLxIPZnp4xsMhyVDlaiYFOABO9hjEjsemtxU+/R6AkHr5M3oOgWm0+0+cWunfJgVJVPfAiP0AZ9gjZGNObl305gvW4UnMK85umj2APOyE/WC8zi1toqXpux2foEY6h0bM4W1PZUA3spKAic+O99Y370VEzc2rc3QxInAJF1xTqXmQOoPKuCWsHgBjB9M+pI3ggTR9cQMV7zkHLZ8hiGAs79fcSPGXRrK6gSJS+pJkeMgpmnEUSUm8g2TQvx/5AbA8VOp05akRGn49V+rH4UqHSZEHQ2FQS3aczinVO1a3SA==
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com (2603:1096:604:29c::6)
 by OSQPR06MB7131.apcprd06.prod.outlook.com (2603:1096:604:29a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Wed, 1 Apr
 2026 08:04:45 +0000
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::92af:c9d9:8779:d19]) by OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::92af:c9d9:8779:d19%4]) with mapi id 15.20.9769.015; Wed, 1 Apr 2026
 08:04:45 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Adrian Hunter <adrian.hunter@intel.com>, Frank Li <Frank.li@nxp.com>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>, Nicolas Pitre
	<npitre@baylibre.com>, Boris Brezillon <boris.brezillon@collabora.com>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i3c: mipi-i3c-hci: fix atomic updates to RING_OPERATION1
 register
Thread-Topic: [PATCH] i3c: mipi-i3c-hci: fix atomic updates to RING_OPERATION1
 register
Thread-Index: AQHcwQen7pXcASnLYkm67zqKFCJtKbXIu1uAgAD3kESAACN1gIAAAth5
Date: Wed, 1 Apr 2026 08:04:45 +0000
Message-ID: <OSQPR06MB7252404199BA43EC56B684B48B50A@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: <20260331-i3c-hci-dma-lock-v1-1-708bc5848381@aspeedtech.com>
 <acvg36HWslcwTFht@lizhi-Precision-Tower-5810>
 <OSQPR06MB725226DC6D102631B4D3E3A28B50A@OSQPR06MB7252.apcprd06.prod.outlook.com>
 <17efbe5d-6f9f-41b6-95ef-7a84e2ed5029@intel.com>
In-Reply-To: <17efbe5d-6f9f-41b6-95ef-7a84e2ed5029@intel.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR06MB7252:EE_|OSQPR06MB7131:EE_
x-ms-office365-filtering-correlation-id: d529ea88-4865-4d7e-d6d4-08de8fc5566c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: 2Yb3Qcs24tVojb5r2SQ6QeKPOJMBZROrh8xa6WJADVigGWadE3mwD3kAA7/4dHgXguAIuJamfN/Cgs35VjnKUdfKBZUZLccRLzPO4NaLMQWo7t4g30TA6eaNZanSeFMXQSsjNiNn1DAKJSkO5YeuIPId8L+EujfhlgkGjUvke41OrVZih9Ju1YgZITl0nvdp02+Cd3DRW0khLtdjnap6fvYhyH4ZQQfiU5CGhspEGA4pf9D2i+dQPAIhm3xqBZV9Z0NTY0Cdvi8YNU+dZuUzq5x2o6K8NGT1/KTe2qmp3U8OSQvS9xbYv9hUlfQoNfhzymBD0jv0HWrFxc9CJ9eB4mUn9pKM7mHsuzs5FAqvtneJs4RD13MrqsgrMksR0cGWlAkskR5F2teX9ELopaGXBFtnzbwriUQPryulf6DacZzA+/n1eGOQHZeDps3cLWYQ9hPitE8ktA56g68lTDu0hzghovwDMXap61Df3+48hh3jp5jqMQnY52A8bjCong4O9toKiEdI255os1jCBubofUd8UGIycYvKcblb9VMsQ4mcDjSBgtR6iMgVcjnPa9cwAkvh+OYufDXIdW7zVxFk5Tk4Nx7YZ/lJbCazoUqJu2jGm1f3Jdxo+z6rV7+Vgbl1wScfsEoljLlAUGfv6bisyfskLhwztvrE9PKL/8rzswKrT0QHV8Mvp4yi/lLZMQ/3/kLiTIvNVVoT5OnO4RckzRfbpewC+uUAOve0WwhtSvCpafEFj3jc/Gj7tLUft3SyD1CdWo8cWEFRh+e2gBpzf9VH/en3PXuReEOjmB1jiQ4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR06MB7252.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?qyYrgdrgvN31Anjl/9l3BC8GVN38BTQtimwtXGN4W4jMqkO1jy/wB84HDm?=
 =?iso-8859-1?Q?BNrAZcHDb/ylcZXLVpAGVYdwkGQv3RgBx3cWOikm3rEBOP/NZa3r3lYUP7?=
 =?iso-8859-1?Q?qz5ohwKjAiUpkQJetQzK8nwX3T0Z2wA0ENFXx6bmQb8+jQmtAbuUSNOWvG?=
 =?iso-8859-1?Q?f3VeSeG/N9Kijz0vUGsiproe2y2lWvSuA4gtZaJjQl5m0xFOYJX4NIwiJT?=
 =?iso-8859-1?Q?ito85D4zHPRpL8+Jbl1WHxqLq3v2Z58tyBPswpMgwBBNMOqpxNvAOkS7Pl?=
 =?iso-8859-1?Q?B3mlV1JpPtVPuMSZ+eazfVsDoYfsdvFP49Nbui1IddPg598STD4tOS8Ueo?=
 =?iso-8859-1?Q?isqhtaahikfKNi66PyOfxflrj80x+gVjtAK7y2NAnAYZl9n02KZXMJOs0m?=
 =?iso-8859-1?Q?ZzPQ7boh4FYbmnK1xp6W0WGZ5uCW6wba3378p38c63Zo5YM9IaoEjQj0uL?=
 =?iso-8859-1?Q?CMKXzW9i4B8XCiipZvRpzzi5d9MfSrA73bGEtP6ilh6ZicGUhSSbLaG46a?=
 =?iso-8859-1?Q?YUvaysXp0xjX8AELX8OTWIo8INU+B6RRC6ZGhZcqu+Jq8WUVViGUcoVylS?=
 =?iso-8859-1?Q?Ipc0BLRsHMBaWeQA8zdOo4ZKxiJFzjpH+lYtFbhQ+pOzLO2RGRfjQlBN7v?=
 =?iso-8859-1?Q?2uZDxLCDinPAKDbCuJVj1WA8jWI8fxfg2ZSxBBOOrMT58giXyyE9EMr4V3?=
 =?iso-8859-1?Q?LlVUqN1jXkoIAQ4cT3X50nrLKuO9k2DcpZMGZ+MSWH8OBpTeMPeGevUziT?=
 =?iso-8859-1?Q?zppZhVZdK6kF+WUvTxMsKQf89tV5wN3AfsEFMtYYp48DifdixXuobtRUgL?=
 =?iso-8859-1?Q?HNHHNgV97T3GbbaRpTN118zG7M8yd1MXqhf04ZvEmY84hOIVWfZb0flHFN?=
 =?iso-8859-1?Q?DimZDNzHrCpzxgRx1KWtSQb7ew5kXn3wq7Y470BeHcryYkDtFfLcISYpHK?=
 =?iso-8859-1?Q?YrX0HwvejCz4BrmOzV896GxA+Zvu86OEhl1/+QCEZJdBGolMA84igvRXG/?=
 =?iso-8859-1?Q?Yq1Jd5JsypraZBhReLmPJk5ainkn3IexQRQeoGaOOvj2CXEepuzoeyHQBD?=
 =?iso-8859-1?Q?gu1TL9OiUTGDtumMlU1fJgOo0j9QIQQbf5BBz9DdA44NauDGyrpXRC2wM/?=
 =?iso-8859-1?Q?wvGkOs/pKxO1MrjwskNpKfOezcOm4IyHjyWQh2iNdkZslk/YjIqC20oucX?=
 =?iso-8859-1?Q?s2iryUx5otA+FcmQqKuaNuIMlBPzJr+hbJ5Clk46CWsVzRsqNPQTfUUh1h?=
 =?iso-8859-1?Q?ItyaUQszh7RxckXUqPUMWLsRrg+7zD5pnrQX9pKb8hWsGrzJ0AiDNXVbIg?=
 =?iso-8859-1?Q?LkrUe5Sm1fzQxyWQ4uHGkoTIhisoSK2INkpJmyLMFzJgYZ0DJkLWfkaC64?=
 =?iso-8859-1?Q?/jRD3S8eF3SvFNX1KUEaAendGcWGhfQxdjIyuDLAeJc2X+YVkbUXSG8aJZ?=
 =?iso-8859-1?Q?CYf5gm/oUTSef6lVsf86/o0LSPQ6e9uTyWSR4lOwn2AN8MlRb9Hdj2Pifb?=
 =?iso-8859-1?Q?UMPris+NMKpTnqpihw+VSKIZCyBzRa+VmYxvArQOcmBBgRaZjbj1bYldoD?=
 =?iso-8859-1?Q?83zWpweStw3+ejcif3nBpK2w+FWVOUS/eIC353akhsZSGhHpWiGCftdprW?=
 =?iso-8859-1?Q?A+vVi34WbCV/clmX488vwBCVxfnL5x5wS6pivvZ+ihnnTdLkvE83WrKqTD?=
 =?iso-8859-1?Q?kAuuuXKKb7FGv52/nXObBvtq0JLxVfDdZaKnYXYUDvjxgP1Rk+gTZAMs7p?=
 =?iso-8859-1?Q?RX8PooxoV6Bv6dt4yfWgs9YSluOWhjSmCFmRO/2aSxxzbicOUZ/SW+iN+3?=
 =?iso-8859-1?Q?HtScorpYEA=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSQPR06MB7252.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d529ea88-4865-4d7e-d6d4-08de8fc5566c
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2026 08:04:45.3898
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bmqdKFQZequpPOVli/Z4pPXWhKswd0Yb/W+ooZ/sLD3Q01JhoKHBdj6M0JiZqlvqurkgz+uR9M2+FszhfZsEOBKU3RV/jh60+Y9Xd+RlJ3Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR06MB7131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_010500_919180_56615357 
X-CRM114-Status: UNSURE (   4.59  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi Adrian,

Thank you for the clarification. I overlooked the lock in i3c_hci_irq_handler() in core.c.

Best regards,

Billy Tsai
-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
