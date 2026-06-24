Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F5ACDB47C
	for <linux-i3c@archiver.kernel.org>; Wed, 24 Jun 2026 10:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fA51dYwuoOfy8tasSKnZce3ffb2vUK+EhvT0c3ogRV4=; b=4CSyJlUgFQbsCm
	6oasKKjlffW/omovHQ5nWTB9IdixmDzYpa2NRQuYevO2Nsl2ekkcfc8v/qoM8qYOOnqkEm1WIECCT
	XNYzVnUgYbsj8ladkk1FYLSFDD0N4Ok2jr9RYGxrwuT6w9AxMfEJxWeJFGJCtrhGF4v7gbPEyA1pB
	HIVb5HE9NNokwSugXOY+KgTlmrgFZFdtJDOGOp4ZujEjv2wazsAM9iaICqw3rNfzfObQ/SaWS5Mhc
	H8gclXqOAbXwpBN5J1/afYDvRaKbWyRWZ+qb7v1HLSFO+5FygaAkVTFrf+4i3CnwYY7vD5HSR96L7
	gvUUFNKlbOlnngBYQ7Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcKmy-00000007baZ-0dW4;
	Wed, 24 Jun 2026 10:25:00 +0000
Received: from mail-centralusazon11010068.outbound.protection.outlook.com ([52.101.61.68] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcKmv-00000007bZ8-262L
	for linux-i3c@lists.infradead.org;
	Wed, 24 Jun 2026 10:24:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=abIdeF/omW8HBevMLLMf3gmSXh8U+VK1sL3qhlEDiXB+wwSzw59Y1sgqaNvNPemgwMVUh09dHef5h7rkHpd9SdxdxBDbG4TR9WyFbu/rde9AYu/Le+ngivpIRKAT2trh6OReO2M8ZBOoW9Js7mslz0g5asz112WQGv+wmJUYbje2pevbirzwNNTF8PZodfmcbAwq/S6TYMTYMl0QJfl0igrZa4rmdPoYSyKN0C1lqFS+fjTLRywJK/Fj0QhDdOASTb/yJx+vwJOccq7hNDHxxSVP6jnYXVUNtnKqlq733KNm0O4u/qK+MmYcx37+1GV0atkoistB+TIT7FCcvgJSQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ya0juJ0y6/8op5CKi85AdUV8HmWe8onjEhiIMIK41sg=;
 b=W4AO00U3cEWkjaSF1r9JTv5B4PZQ+wOrL/YxQygaBJn7ICcTtHftULqgAKzdqND88pinT5fIN54CEYsX9T+KM9KxxW+mmCe395fuBLcDxnFw7rdWMMHI2ujKr9bC0QRXCAlQITKqfcCwCyR+WG7CJqvWFTcVcKoFxBUd2J2fKl0tSktHlblkPnohvx/hs9n0g4Tl4Sv9NGcn2B1d69G4aMcXSOLLxaqiPKh9IfBHOMFPe4PajydsAkwfb4HxIwqZnHb7MoyNiFkKeT2HhibK/KfQ8p6Zuj4IbLLqnOoV1+cZcfCTW3FOmDp1P/pDD5RXweYsminqM7htyHEJX8BKbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ya0juJ0y6/8op5CKi85AdUV8HmWe8onjEhiIMIK41sg=;
 b=gv31o2xLxs8T88xks9bn6dUY37VzsB0BrbS75qWSz7+S/RU0a41MmSZJDOXTF3sm82oVCU1Mg+R1LARduXaNpeHFNbtKUOzBZnPeAEpjsxKfj218HGCSsUmG1V8oBuGEcqo9Mtn71JCW1jneVZWRChQAv3vKkU69WCheAz9kEFuB8wbxAXQ15qUcnu6YdTSDAJjAxf4I44Hz7gfGwqtVrOEW50MPDqP8DbaVEgxdk/2C9W2CCxibrs3UtBGxgIFxtwBWaLWVDDCx8sMK8DKdnLar864bhymt+YPQs0p/wNGnHr+0y3Je0MC4WQ54IPddLuol7d6wGz5rzTr5pF06cw==
Received: from BL1PR13CA0348.namprd13.prod.outlook.com (2603:10b6:208:2c6::23)
 by IA1PR12MB7759.namprd12.prod.outlook.com (2603:10b6:208:420::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 10:24:50 +0000
Received: from BN1PEPF0000468E.namprd05.prod.outlook.com
 (2603:10b6:208:2c6:cafe::31) by BL1PR13CA0348.outlook.office365.com
 (2603:10b6:208:2c6::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.13 via Frontend Transport; Wed,
 24 Jun 2026 10:24:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN1PEPF0000468E.mail.protection.outlook.com (10.167.243.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Wed, 24 Jun 2026 10:24:49 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 24 Jun
 2026 03:24:35 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 24 Jun
 2026 03:24:33 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Wed, 24 Jun 2026 03:24:28 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Frank Li <Frank.Li@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
	Philipp Zabel <p.zabel@pengutronix.de>, Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Akhil R
	<akhilrajeev@nvidia.com>
Subject: [PATCH v5 11/12] hwmon: spd5118: Add I3C support
Date: Wed, 24 Jun 2026 10:21:05 +0000
Message-ID: <20260624102153.1770072-12-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260624102153.1770072-1-akhilrajeev@nvidia.com>
References: <20260624102153.1770072-1-akhilrajeev@nvidia.com>
MIME-Version: 1.0
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468E:EE_|IA1PR12MB7759:EE_
X-MS-Office365-Filtering-Correlation-Id: c1929e99-f483-491c-67ef-08ded1dad279
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|82310400026|23010399003|36860700016|1800799024|3023799007|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 3MwPGSesFHPHWTsy+O3UjsldKD9rDB/RxwSmGtex3KOOBB5tCZY8BkyAm8pzaaa+sn+1Ob9KbQBLjstdbVdjKMGwWRRtAzb6fTaA2mXU6J6h7WT1R/P13qhuzVuUzZynbQRvvA2w1lDigeBjGTIRu4x6L8KySJQhpPjtuH/01Oasl+EB3v27a+FlCWCLg1k0/iptjdrdXFGDSlqr4LcgqG+hYP4nebYHCp4GVUGOvZoyehLzbElC0VhdshEbspKKRX+BYVbTBU/t7gUW7R90s1tjwnUbHvwHA9wacWQFunPQGc5rfvu0YER1mGHiyzJRx2UueqfrqoDE2a7FU47URa+XDtxahQeEv1rCYg4J5Oywrt0wL6fphwWTSZQZ1eCWMr69e8KvVo9VVWwLwANuPS19T9vnN1TSON3oFKLyAkwdiZcGZlZbTRN54OBrXdx7N8MR8gAWESwPua+F7nrdmapwjvArq2Sw5yDywYHYQoMhW5ZNNDY49JdoY8SvrIA4xZxuqz/uEhtWD7jVLOHJ+Ee3G/PrfMI3Yg4jO2jTJj9LvxYl1z2LQMQoeGdR54l0QYJqylf1YZhLrmzozCEAuGe4MbhF5cbZRvbUbTSKpUhLxPcUgqtiWhP1u4K1m1ltUZ3RaSSKNkXDncISStI6h0FmZy+XdQDjR/80DTMDWViz9gqAfL3sWEkg8omIdpQL489XwKlDsJ0RMUKztzxG8w==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(23010399003)(36860700016)(1800799024)(3023799007)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: yKSKVSp/3XmbBJsqvF4jE7DfpXTiTL8M1eWwJSJJMgCSapDmjoGk70T0XjQiJ71O3X7B3ot+m7JSiKaQfpPIU9K4fuV5OdpjRFPXaLTtMPYLfwBAvHc7xeNyB/8FSuq5o1drgi3+Jnv5eyWRr0HP8URuRz0IyI5VQ0M6OFfkOBA3zf7PcgnqgA+4iaGkjOVZYdro8vGQSDax6ojhNbWOkEP2vp/xjbbfxRXbdeUhmLY5b7xtlzde+Q7t5mPOFvfrUc5+4r6bzb+MzZdJaftdVHNbZlCGFmpURAX9aXfAhhemmAlWuBgKFfvCt+GO0/m/fB4yfKdvw33mTd3CESG8LL9qoUtgJgOI3uXCmQrjdV0aiTil/dj+WQuID+qsZPsDWUeJNTELXABDw3ubmwlFOFTc1j1y6JP1IZ4djMwl8l2KYRSZ3zmCDg61hQ/ua9cS
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 10:24:49.5632
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1929e99-f483-491c-67ef-08ded1dad279
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF0000468E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7759
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_032457_548944_BA887AEB 
X-CRM114-Status: GOOD (  20.65  )
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

QWRkIGEgcmVnbWFwIGNvbmZpZyBhbmQgYSBwcm9iZSBmdW5jdGlvbiB0byBzdXBwb3J0IEkzQy1i
YXNlZApjb21tdW5pY2F0aW9uIHdpdGggU1BENTExOCBkZXZpY2VzLgoKT24gYW4gSTNDIGJ1cywg
U1BENTExOCBkZXZpY2VzIGFyZSBlbnVtZXJhdGVkIHZpYSBTRVRBQVNBIGFuZCBhbHdheXMKcmVx
dWlyZSBhbiBBQ1BJIG9yIGRldmljZSB0cmVlIGVudHJ5LiBEZXZpY2UgbWF0Y2hpbmcgaXMgaGVu
Y2UgdGhyb3VnaAp0aGUgT0YgbWF0Y2ggdGFibGVzIG9ubHkgYW5kIGRvZXMgbm90IG5lZWQgYW4g
STNDIGNsYXNzIG1hdGNoIHRhYmxlLiBUaGUKZGV2aWNlIGlkZW50aXR5IGlzIHZlcmlmaWVkIGlu
IHRoZSB0eXBlIHJlZ2lzdGVycyBiZWZvcmUgcHJvY2VlZGluZyB0bwp0aGUgY29tbW9uIHByb2Jl
IGZ1bmN0aW9uLgoKQWNrZWQtYnk6IEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJvZWNrLXVzLm5ldD4K
U2lnbmVkLW9mZi1ieTogQWtoaWwgUiA8YWtoaWxyYWplZXZAbnZpZGlhLmNvbT4KLS0tCiBkcml2
ZXJzL2h3bW9uL0tjb25maWcgICB8ICA5ICsrKystLS0KIGRyaXZlcnMvaHdtb24vc3BkNTExOC5j
IHwgNTYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KIDIgZmlsZXMg
Y2hhbmdlZCwgNjEgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2h3bW9uL0tjb25maWcgYi9kcml2ZXJzL2h3bW9uL0tjb25maWcKaW5kZXggNWMyZDNm
ZjVmY2U4Li5jNGJmNTQ3NWZjYjMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaHdtb24vS2NvbmZpZwor
KysgYi9kcml2ZXJzL2h3bW9uL0tjb25maWcKQEAgLTIzNTQsMTIgKzIzNTQsMTUgQEAgY29uZmln
IFNFTlNPUlNfSU5BMzIyMQogCiBjb25maWcgU0VOU09SU19TUEQ1MTE4CiAJdHJpc3RhdGUgIlNQ
RDUxMTggQ29tcGxpYW50IFRlbXBlcmF0dXJlIFNlbnNvcnMiCi0JZGVwZW5kcyBvbiBJMkMKKwlk
ZXBlbmRzIG9uIEkzQ19PUl9JMkMKIAlzZWxlY3QgUkVHTUFQX0kyQworCXNlbGVjdCBSRUdNQVBf
STNDIGlmIEkzQwogCWhlbHAKIAkgIElmIHlvdSBzYXkgeWVzIGhlcmUgeW91IGdldCBzdXBwb3J0
IGZvciBTUEQ1MTE4IChKRURFQyBKRVNEMzAwKQotCSAgY29tcGxpYW50IHRlbXBlcmF0dXJlIHNl
bnNvcnMuIFN1Y2ggc2Vuc29ycyBhcmUgZm91bmQgb24gRERSNSBtZW1vcnkKLQkgIG1vZHVsZXMu
CisJICBjb21wbGlhbnQgdGVtcGVyYXR1cmUgc2Vuc29ycyB1c2luZyBJMkMgb3IgSTNDIGJ1cyBp
bnRlcmZhY2UuCisJICBTdWNoIHNlbnNvcnMgYXJlIGZvdW5kIG9uIEREUjUgbWVtb3J5IG1vZHVs
ZXMuCisKKwkgIFRoaXMgZHJpdmVyIHN1cHBvcnRzIGJvdGggSTJDIGFuZCBJM0MgaW50ZXJmYWNl
cy4KIAogCSAgVGhpcyBkcml2ZXIgY2FuIGFsc28gYmUgYnVpbHQgYXMgYSBtb2R1bGUuIElmIHNv
LCB0aGUgbW9kdWxlCiAJICB3aWxsIGJlIGNhbGxlZCBzcGQ1MTE4LgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9od21vbi9zcGQ1MTE4LmMgYi9kcml2ZXJzL2h3bW9uL3NwZDUxMTguYwppbmRleCA2YmEz
N2E3MTkzMDAuLjk3MjRjZjcwYjYxZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9od21vbi9zcGQ1MTE4
LmMKKysrIGIvZHJpdmVycy9od21vbi9zcGQ1MTE4LmMKQEAgLTE4LDYgKzE4LDcgQEAKICNpbmNs
dWRlIDxsaW51eC9iaXRzLmg+CiAjaW5jbHVkZSA8bGludXgvZXJyLmg+CiAjaW5jbHVkZSA8bGlu
dXgvaTJjLmg+CisjaW5jbHVkZSA8bGludXgvaTNjL2RldmljZS5oPgogI2luY2x1ZGUgPGxpbnV4
L2h3bW9uLmg+CiAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+CiAjaW5jbHVkZSA8bGludXgvbXV0
ZXguaD4KQEAgLTQ2NCw2ICs0NjUsMjcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCByZWdtYXBfY29u
ZmlnIHNwZDUxMThfcmVnbWFwOF9jb25maWcgPSB7CiAJLm51bV9yYW5nZXMgPSBBUlJBWV9TSVpF
KHNwZDUxMThfaTJjX3JlZ21hcF9yYW5nZV9jZmcpLAogfTsKIAorLyoKKyAqIFNQRDUxMTggMi1i
eXRlIHJlZ2lzdGVyIGFkZHJlc3MgZm9ybWF0IChKRVNEMzAwLTUsIFRhYmxlcyA3ICYgMjApOgor
ICogICBCeXRlIDEgKG9uIHdpcmUgZmlyc3QpOiAgTWVtUmVnIHwgQmxrQWRkclswXSB8IEFkZHJl
c3NbNTowXQorICogICBCeXRlIDIgKG9uIHdpcmUgc2Vjb25kKTogMDAwMCAgIHwgQmxrQWRkcls0
OjFdCisgKgorICogVGhlIGFkZHJlc3MgYnl0ZSAod2l0aCBNZW1SZWcgYW5kIGxvd2VyIGFkZHJl
c3MgYml0cykgbXVzdCBiZSBzZW50IGZpcnN0LAorICogZm9sbG93ZWQgYnkgdGhlIHVwcGVyIGJs
b2NrIGFkZHJlc3MgYnl0ZS4gV2l0aCByZWdtYXAgMTYtYml0IHJlZ2lzdGVyCisgKiBmb3JtYXQs
IHRoaXMgbWFwcyB0byBsaXR0bGUtZW5kaWFuOiB0aGUgbG93IGJ5dGUgb2YgdGhlIDE2LWJpdCB2
YWx1ZSBpcworICogdHJhbnNtaXR0ZWQgZmlyc3QuIE5vIHJhbmdlIGNvbmZpZyBpcyBuZWVkZWQg
c2luY2UgSTNDIGRvZXMgbm90IHVzZSBNUjExCisgKiBwYWdlIHN3aXRjaGluZy4KKyAqLworc3Rh
dGljIGNvbnN0IHN0cnVjdCByZWdtYXBfY29uZmlnIHNwZDUxMThfcmVnbWFwX2kzY19jb25maWcg
PSB7CisJLnJlZ19iaXRzID0gMTYsCisJLnZhbF9iaXRzID0gOCwKKwkubWF4X3JlZ2lzdGVyID0g
MHg3ZmYsCisJLnJlZ19mb3JtYXRfZW5kaWFuID0gUkVHTUFQX0VORElBTl9MSVRUTEUsCisJLndy
aXRlYWJsZV9yZWcgPSBzcGQ1MTE4X3dyaXRlYWJsZV9yZWcsCisJLnZvbGF0aWxlX3JlZyA9IHNw
ZDUxMThfdm9sYXRpbGVfcmVnLAorCS5jYWNoZV90eXBlID0gUkVHQ0FDSEVfTUFQTEUsCit9Owor
CiBzdGF0aWMgaW50IHNwZDUxMThfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpCiB7CiAJc3Ry
dWN0IHNwZDUxMThfZGF0YSAqZGF0YSA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwpAQCAtNzAxLDcg
KzcyMywzOSBAQCBzdGF0aWMgc3RydWN0IGkyY19kcml2ZXIgc3BkNTExOF9pMmNfZHJpdmVyID0g
ewogCS5hZGRyZXNzX2xpc3QJPSBJU19FTkFCTEVEKENPTkZJR19TRU5TT1JTX1NQRDUxMThfREVU
RUNUKSA/IG5vcm1hbF9pMmMgOiBOVUxMLAogfTsKIAotbW9kdWxlX2kyY19kcml2ZXIoc3BkNTEx
OF9pMmNfZHJpdmVyKTsKKy8qIEkzQyAqLworCitzdGF0aWMgaW50IHNwZDUxMThfaTNjX3Byb2Jl
KHN0cnVjdCBpM2NfZGV2aWNlICppM2NkZXYpCit7CisJc3RydWN0IGRldmljZSAqZGV2ID0gaTNj
ZGV2X3RvX2RldihpM2NkZXYpOworCXN0cnVjdCByZWdtYXAgKnJlZ21hcDsKKwl1OCByZWd2YWxb
Ml07CisJaW50IGVycjsKKworCXJlZ21hcCA9IGRldm1fcmVnbWFwX2luaXRfaTNjKGkzY2Rldiwg
JnNwZDUxMThfcmVnbWFwX2kzY19jb25maWcpOworCWlmIChJU19FUlIocmVnbWFwKSkKKwkJcmV0
dXJuIGRldl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJSKHJlZ21hcCksICJyZWdtYXAgaW5pdCBmYWls
ZWRcbiIpOworCisJZXJyID0gcmVnbWFwX2J1bGtfcmVhZChyZWdtYXAsIFNQRDUxMThfUkVHX1RZ
UEUsIHJlZ3ZhbCwgMik7CisJaWYgKGVycikKKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCBl
cnIsICJmYWlsZWQgdG8gcmVhZCBkZXZpY2UgdHlwZVxuIik7CisKKwlpZiAocmVndmFsWzBdICE9
IDB4NTEgfHwgcmVndmFsWzFdICE9IDB4MTgpCisJCXJldHVybiAtRU5PREVWOworCisJcmV0dXJu
IHNwZDUxMThfY29tbW9uX3Byb2JlKGRldiwgcmVnbWFwKTsKK30KKworc3RhdGljIHN0cnVjdCBp
M2NfZHJpdmVyIHNwZDUxMThfaTNjX2RyaXZlciA9IHsKKwkuZHJpdmVyID0geworCQkubmFtZQk9
ICJzcGQ1MTE4X2kzYyIsCisJCS5vZl9tYXRjaF90YWJsZSA9IHNwZDUxMThfb2ZfaWRzLAorCQku
cG0gPSBwbV9zbGVlcF9wdHIoJnNwZDUxMThfcG1fb3BzKSwKKwl9LAorCS5wcm9iZQkJPSBzcGQ1
MTE4X2kzY19wcm9iZSwKK307CisKK21vZHVsZV9pM2NfaTJjX2RyaXZlcihzcGQ1MTE4X2kzY19k
cml2ZXIsICZzcGQ1MTE4X2kyY19kcml2ZXIpOwogCiBNT0RVTEVfQVVUSE9SKCJSZW7DqSBSZWJl
IDxyZW5lQGV4YWN0Y29kZS5kZT4iKTsKIE1PRFVMRV9BVVRIT1IoIkd1ZW50ZXIgUm9lY2sgPGxp
bnV4QHJvZWNrLXVzLm5ldD4iKTsKLS0gCjIuNDMuMAoKCi0tIApsaW51eC1pM2MgbWFpbGluZyBs
aXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
