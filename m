Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6444410775F9
	for <linux-i3c@archiver.kernel.org>; Wed, 18 Mar 2026 17:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EeUt42MEFIJdqIyXAu4j0jnYU0PArWqeekpiY/diZsE=; b=xCwXQMxMLPnw13
	5r4xesZYUVxOSKfwwEkgY89MtO9dsPDZ5iVTUaWms7ee3U9dKI2f44N56Tn+Mb8zADFbWgUokpaYO
	AdaiGwlCJFkjJSsf3PWrAVVx+2vicsjxNYz404aQVH1hPrCvwcCb0BdYXJfC9RC22Hwl3gzeJcj8V
	BJ68fyx9zNKBJmu59KClTi2aTmi7/HBoKKT+Z4sMMMPvM8Rdtmhp/3NW2Wr9QY5wiFggqyBEowOjI
	fBH3IWnrd0jjLg5OZeNzLUSkiXoMYcnmk0jtaS4k+q8Z7RQQj7wJ5rstFK9cOwPZBuUEiwRZ5s9M5
	Av8fOY1U3pY1zK0FyBBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2uk1-000000095EX-0TZR;
	Wed, 18 Mar 2026 17:31:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ujv-000000095CN-1mYE
	for linux-i3c@bombadil.infradead.org;
	Wed, 18 Mar 2026 17:31:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=EhG0ng9PwlZjjCFVh2kf5nfzoaEc0/LbhQh/eXp+Wvk=; b=d2jMOA9Bg/MoOFP1K5/D+W5Qms
	HF1EJQiOftoPsz7XFRYCOjGLrf5d07p+LsuAKzwwDnaEfwkBZO5BzlAMytChx2pdyEXd8K6iNelWG
	YK8GunIrd3obclMhfBQTzIY55agHHAUIBmFYPULtdl4ohczdAuSfdE8IbACbDzRmYOECxsqZMnahS
	tJsAuRstLySUuy+mXl2qLdGmE+QOWwovQWvLmO63EXX2WpBOGwcjZyPVFQJwiJSEV7YQwvqAUlDzk
	wBfDmk1QHo19mEXxeu8cV53VMOO3ZBZeyQkZ841245WPKHQpbPoEhIkfpBfFftlPiZQioUyBNR5QW
	A2ZCPR4Q==;
Received: from mail-eastus2azlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c110::1] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ujr-0000000BtD9-1Q0Z
	for linux-i3c@lists.infradead.org;
	Wed, 18 Mar 2026 17:31:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SA3UZlQSGr6E6J/sW/yBCpwL4pZrUkT6S1coms353WTneuLrf5xL7XERjY/Tupw6GyJbqTEUsJD9ZDmjWTxyk3VU9XLX1ailwCoyEcVBCd1VzvddKsH79Hyz7l6dIBVDMUk7N88IwQ/ROx9VuU1ORBOFNoja2NkvbyF29B4PZbUUtEjCLZyx4y0Mnpp07Jvxqz0IYku81cIgy9FLiUhzA/wSSymXLMDuiQR1GNuyaQpne7R+81P3aYVIotw+MGNLtiaguZ15g8IZNsz0YDKMI/POBWAmtWWaYxXiDnoImNG0TMu/coi0TEOiz+iZBNiJXw9ShoI8AKwAOp5OTCVZ1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EhG0ng9PwlZjjCFVh2kf5nfzoaEc0/LbhQh/eXp+Wvk=;
 b=trwk6PMbBKZ3qi6w+4DfWaT089FOW0zD/vhwroISNMZoWVcP5TFagpQuO4PoG4y5PvbJHfXXq6oUz4/F5UrsyzOn3W+wgD50AdANUzkTxTIlAxJo6F0gNEd4Q3e1t7dsGW2hYT2luybJwtGznwV2Ug4PFqNSGal74GF8GL+hWICQNfFDpTbpyo0W3/Tj03awWNBRQROmx3rEZjzvQv5eIkrBF4VresJ6gmAqdmjrAiX6hp6OL3gOo+83NxEOXn7l1Wnp358b3TVBxQdcXH75qp7GP1J9TOu1qXnLi0FMeuKc2LIcDfFJSlUNtO0Lnqhw0Z5CJsHSupmoJa5CGNXagg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EhG0ng9PwlZjjCFVh2kf5nfzoaEc0/LbhQh/eXp+Wvk=;
 b=fKDp+Q3ENxQz+GkPbKtoSeNFfUN59deT1qt27biyxqxG0ZXIMDtdQdIRIM3Pxx3l4w+XpggcNmNkbFeR8E3elOqMzL9AJdT9umQAGE4h+krKZqjJoi4dvEDQ+xMjyCJSWtUJpkD6DXh/MFAS8tXT8Y2nldMzGQxvuCT2pdcNC086oWQAJAmm4epIFfhhaBxUd+xmdVnKa/dpnkdiL/bkJ/3P9ssFEIpDU61rq3BnKpRWBKFbpnz4RGtwHyI7peZDo9w0ZRWm9Ir8SLy0T2neMLs8HxZJs+iYr+EkiVzLzc8p1tV1oQVlEYYrQipkHbuckSUXOtM0aqpT9LibAAakbQ==
Received: from DM6PR03CA0015.namprd03.prod.outlook.com (2603:10b6:5:40::28) by
 SJ0PR12MB7065.namprd12.prod.outlook.com (2603:10b6:a03:4ae::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Wed, 18 Mar
 2026 17:31:15 +0000
Received: from DM2PEPF00003FC2.namprd04.prod.outlook.com
 (2603:10b6:5:40:cafe::cf) by DM6PR03CA0015.outlook.office365.com
 (2603:10b6:5:40::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Wed,
 18 Mar 2026 17:31:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DM2PEPF00003FC2.mail.protection.outlook.com (10.167.23.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Wed, 18 Mar 2026 17:31:14 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 10:30:48 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 10:30:47 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Mar 2026 10:30:41 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Rafael J .
 Wysocki" <rafael@kernel.org>, Robert Moore <robert.moore@intel.com>, "Len
 Brown" <lenb@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Philipp Zabel
	<p.zabel@pengutronix.de>, Eric Biggers <ebiggers@kernel.org>, "Fredrik
 Markstrom" <fredrik.markstrom@est.tech>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Thierry Reding <thierry.reding@kernel.org>, "Jon
 Hunter" <jonathanh@nvidia.com>, Suresh Mangipudi <smangipudi@nvidia.com>,
	<linux-tegra@vger.kernel.org>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-acpi@vger.kernel.org>, <acpica-devel@lists.linux.dev>,
	<linux-hwmon@vger.kernel.org>
CC: Akhil R <akhilrajeev@nvidia.com>
Subject: [PATCH 11/12] hwmon: spd5118: Add I3C support
Date: Wed, 18 Mar 2026 22:57:24 +0530
Message-ID: <20260318172820.13771-12-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260318172820.13771-1-akhilrajeev@nvidia.com>
References: <20260318172820.13771-1-akhilrajeev@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC2:EE_|SJ0PR12MB7065:EE_
X-MS-Office365-Filtering-Correlation-Id: e42a1def-1e8b-4349-3e75-08de8514278d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|7416014|376014|36860700016|1800799024|56012099003|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info: NunfodOLx3bFHF5dBR9JbioaSlvqxddrnb91llFFwfi+ZhD3+CmbKoRrZqzXKtlYKD8wwg+hiqZMulAg3uXN+d45Tgmmf3+nECfy5jDtl6KzW9KhtTlX8VjRGLGP+BORxQS0cmM1LoL6NZFm85ey9Cik+L1ccWlLV2QVYxRZfHQvoz2Trb3AQ9LxXj2RU9NhIUT7UdATSSPfuMNIxrgV9MQJKM3rK9bhBhQSKRhploCrpxIkc9gw4RPyoKodx7PkISU1tXnqX8UrhrDJaVESrIKxyD5BH7lRppUy+tuGNnkAtZDiJ8sLvzbr7tBIBzEErWG9DemQ71lCsI1bBdt0RVTbMoOL3slBSaZNVd2aPY0mcsbHtlKsV9HwJJ/xePap6nzxBEGQw6EVxufG4zE856leUulsRgAHiQA71SPjXLy1PYT7Jcyhqeely6wP3S+JvXYzdqXYWCK0vDdcQLmxXa/UEiYkEPO77DYG0dUMJraCaMPTPbMXAZcbUNSFmge2xSPHl5SVwswy1JVFM0rvyWcYrr74CUl3G/eWsy0gxgCZwN5L0LsAkHDRbafphz/YSUIsnrA8D9AG2TCiKquOWJBgn349prKr5arHDiVg4AVzggiR7K+YhvNFFeUXlcYNZ3UES/v0ZpfNqvYXZrVD9DFDK8yf/VbSYJ7BBuxsoLror7pKtUGrfiQ2rbYhefr+5fpMNT0BC9nYUztr9XDAC3yiuc+R6O6yjBLB8juru8ZlABL0AyhhzDcVODeyPMvev8ucWu74UTi3D0mFU1f6nAGzDK8MCXz6ejskJyKvUn+8UAJ+EJX97DwZeD1Mw3uW
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700016)(1800799024)(56012099003)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: n6jvyDjR2rCdiPNcZrjxzPiViE4q6+DN+6niIfjcQnuom66IaFG65SeIYAd37ADpf26uZhLkE9IbCoK9W+nyG4e3p4IFCKjqmrQ+Pmc9xu1IMZC/yGdJpWhywLmLyygkSsWg9+cs9xxyojaVG7LJbaFsFRQbCSrZSSQ4p+Wv4rHQv2sTrxlkTVw6UUFDuoFMjuhBb3p7opXbKl49lj8ibYmX2rKY6HZ81+NVs2HwbgAo3AEYKHPC/a8RlPcC/+PTlaQoZQIe5nBXX/QOoXQL+POPl7FJr6HjyGrA1jDE9Ag8k87d3BukYuVt9WqtHvZ6GLnVmEZuE4bE5gMao3u90XGCvlT3p2c6OgUx1pPU/QIzfGGe4IdOyp88tj7uIH/GTAyMdMI3cCnrBicJUoRH16UjCglB4v+zsxmu8uiH+jZdKOyWEU6RQmBPz/0VXMOI
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 17:31:14.1167
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e42a1def-1e8b-4349-3e75-08de8514278d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM2PEPF00003FC2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_173123_767830_0311F56F 
X-CRM114-Status: GOOD (  19.64  )
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

QWRkIGEgcmVnbWFwIGNvbmZpZyBhbmQgYSBwcm9iZSBmdW5jdGlvbiB0byBzdXBwb3J0IGZvciBJ
M0MgYmFzZWQKY29tbXVuaWNhdGlvbiB0byBTUEQ1MTE4IGRldmljZXMuCgpPbiBhbiBJM0MgYnVz
LCBTUEQ1MTE4IGFyZSBlbnVtZXJhdGVkIHZpYSBTRVRBQVNBIGFuZCBhbHdheXMgcmVxdWlyZSBh
bgpBQ1BJIG9yIGRldmljZSB0cmVlIGVudHJ5LiBUaGUgZGV2aWNlIG1hdGNoaW5nIGlzIGhlbmNl
IHRocm91Z2ggdGhlIE9GCm1hdGNoIHRhYmxlcyBvbmx5IGFuZCBkbyBub3QgbmVlZCBhbiBJM0Mg
Y2xhc3MgbWF0Y2ggdGFibGUuIFRoZSBkZXZpY2UKaWRlbnRpdHkgaXMgdmVyaWZpZWQgaW4gdGhl
IHR5cGUgcmVnaXN0ZXJzIGJlZm9yZSBwcm9jZWVkaW5nIHRvIHRoZQpjb21tb24gcHJvYmUgZnVu
Y3Rpb24uCgpTaWduZWQtb2ZmLWJ5OiBBa2hpbCBSIDxha2hpbHJhamVldkBudmlkaWEuY29tPgot
LS0KIGRyaXZlcnMvaHdtb24vS2NvbmZpZyAgIHwgIDcgKysrLS0KIGRyaXZlcnMvaHdtb24vc3Bk
NTExOC5jIHwgNjYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KIDIg
ZmlsZXMgY2hhbmdlZCwgNzAgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2h3bW9uL0tjb25maWcgYi9kcml2ZXJzL2h3bW9uL0tjb25maWcKaW5kZXgg
OGFmODBlMTdkMjVlLi4yMzYwNGMwNWFkMjIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaHdtb24vS2Nv
bmZpZworKysgYi9kcml2ZXJzL2h3bW9uL0tjb25maWcKQEAgLTIzMDAsMTAgKzIzMDAsMTMgQEAg
Y29uZmlnIFNFTlNPUlNfU1BENTExOAogCXRyaXN0YXRlICJTUEQ1MTE4IENvbXBsaWFudCBUZW1w
ZXJhdHVyZSBTZW5zb3JzIgogCWRlcGVuZHMgb24gSTJDCiAJc2VsZWN0IFJFR01BUF9JMkMKKwlz
ZWxlY3QgUkVHTUFQX0kzQyBpZiBJM0MKIAloZWxwCiAJICBJZiB5b3Ugc2F5IHllcyBoZXJlIHlv
dSBnZXQgc3VwcG9ydCBmb3IgU1BENTExOCAoSkVERUMgSkVTRDMwMCkKLQkgIGNvbXBsaWFudCB0
ZW1wZXJhdHVyZSBzZW5zb3JzLiBTdWNoIHNlbnNvcnMgYXJlIGZvdW5kIG9uIEREUjUgbWVtb3J5
Ci0JICBtb2R1bGVzLgorCSAgY29tcGxpYW50IHRlbXBlcmF0dXJlIHNlbnNvcnMgdXNpbmcgSTJD
IG9yIEkzQyBidXMgaW50ZXJmYWNlLgorCSAgU3VjaCBzZW5zb3JzIGFyZSBmb3VuZCBvbiBERFI1
IG1lbW9yeSBtb2R1bGVzLgorCisJICBUaGlzIGRyaXZlciBzdXBwb3J0cyBib3RoIEkyQyBhbmQg
STNDIGludGVyZmFjZXMuCiAKIAkgIFRoaXMgZHJpdmVyIGNhbiBhbHNvIGJlIGJ1aWx0IGFzIGEg
bW9kdWxlLiBJZiBzbywgdGhlIG1vZHVsZQogCSAgd2lsbCBiZSBjYWxsZWQgc3BkNTExOC4KZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvaHdtb24vc3BkNTExOC5jIGIvZHJpdmVycy9od21vbi9zcGQ1MTE4
LmMKaW5kZXggNWRhNDQ1NzFiNmEwLi5kNzAxMjNlMTA2MTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
aHdtb24vc3BkNTExOC5jCisrKyBiL2RyaXZlcnMvaHdtb24vc3BkNTExOC5jCkBAIC0xOCw2ICsx
OCw3IEBACiAjaW5jbHVkZSA8bGludXgvYml0cy5oPgogI2luY2x1ZGUgPGxpbnV4L2Vyci5oPgog
I2luY2x1ZGUgPGxpbnV4L2kyYy5oPgorI2luY2x1ZGUgPGxpbnV4L2kzYy9kZXZpY2UuaD4KICNp
bmNsdWRlIDxsaW51eC9od21vbi5oPgogI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgogI2luY2x1
ZGUgPGxpbnV4L211dGV4Lmg+CkBAIC00ODIsNiArNDgzLDI1IEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgcmVnbWFwX2NvbmZpZyBzcGQ1MTE4X3JlZ21hcDE2X2NvbmZpZyA9IHsKIAkuY2FjaGVfdHlw
ZSA9IFJFR0NBQ0hFX01BUExFLAogfTsKIAorLyoKKyAqIEkzQyB1c2VzIDItYnl0ZSByZWdpc3Rl
ciBhZGRyZXNzaW5nIC0KKyAqICAgQnl0ZSAxOiBNZW1SZWcgfCBCbGtBZGRyWzBdIHwgQWRkcmVz
c1s1OjBdCisgKiAgIEJ5dGUgMjogMDAwMCAgIHwgQmxrQWRkcls0OjFdCisgKgorICogVGhlIGxv
dyBieXRlIGNhcnJpZXMgdGhlIHJlZ2lzdGVyL05WTSBhZGRyZXNzIGFuZCB0aGUgaGlnaCBieXRl
IGNhcnJpZXMgdGhlCisgKiB1cHBlciBibG9jayBhZGRyZXNzIGJpdHMsIHNvIGxpdHRsZS1lbmRp
YW4gZm9ybWF0IGlzIHJlcXVpcmVkLiBObyByYW5nZQorICogY29uZmlnIGlzIG5lZWRlZCBzaW5j
ZSBJM0MgZG9lcyBub3QgdXNlIE1SMTEgcGFnZSBzd2l0Y2hpbmcuCisgKi8KK3N0YXRpYyBjb25z
dCBzdHJ1Y3QgcmVnbWFwX2NvbmZpZyBzcGQ1MTE4X3JlZ21hcF9pM2NfY29uZmlnID0geworCS5y
ZWdfYml0cyA9IDE2LAorCS52YWxfYml0cyA9IDgsCisJLm1heF9yZWdpc3RlciA9IDB4N2ZmLAor
CS5yZWdfZm9ybWF0X2VuZGlhbiA9IFJFR01BUF9FTkRJQU5fTElUVExFLAorCS53cml0ZWFibGVf
cmVnID0gc3BkNTExOF93cml0ZWFibGVfcmVnLAorCS52b2xhdGlsZV9yZWcgPSBzcGQ1MTE4X3Zv
bGF0aWxlX3JlZywKKwkuY2FjaGVfdHlwZSA9IFJFR0NBQ0hFX01BUExFLAorfTsKKwogc3RhdGlj
IGludCBzcGQ1MTE4X3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQogewogCXN0cnVjdCBzcGQ1
MTE4X2RhdGEgKmRhdGEgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKQEAgLTc3MCw3ICs3OTAsNTEg
QEAgc3RhdGljIHN0cnVjdCBpMmNfZHJpdmVyIHNwZDUxMThfaTJjX2RyaXZlciA9IHsKIAkuYWRk
cmVzc19saXN0CT0gSVNfRU5BQkxFRChDT05GSUdfU0VOU09SU19TUEQ1MTE4X0RFVEVDVCkgPyBu
b3JtYWxfaTJjIDogTlVMTCwKIH07CiAKLW1vZHVsZV9pMmNfZHJpdmVyKHNwZDUxMThfaTJjX2Ry
aXZlcik7CisvKiBJM0MgKi8KKworc3RhdGljIGludCBzcGQ1MTE4X2kzY19wcm9iZShzdHJ1Y3Qg
aTNjX2RldmljZSAqaTNjZGV2KQoreworCXN0cnVjdCBkZXZpY2UgKmRldiA9IGkzY2Rldl90b19k
ZXYoaTNjZGV2KTsKKwlzdHJ1Y3QgcmVnbWFwICpyZWdtYXA7CisJdW5zaWduZWQgaW50IHJlZ3Zh
bDsKKwlpbnQgZXJyOworCisJcmVnbWFwID0gZGV2bV9yZWdtYXBfaW5pdF9pM2MoaTNjZGV2LCAm
c3BkNTExOF9yZWdtYXBfaTNjX2NvbmZpZyk7CisJaWYgKElTX0VSUihyZWdtYXApKQorCQlyZXR1
cm4gZGV2X2Vycl9wcm9iZShkZXYsIFBUUl9FUlIocmVnbWFwKSwgInJlZ21hcCBpbml0IGZhaWxl
ZFxuIik7CisKKwkvKiBWZXJpZnkgdGhpcyBpcyBhIFNQRDUxMTggZGV2aWNlICovCisJZXJyID0g
cmVnbWFwX3JlYWQocmVnbWFwLCBTUEQ1MTE4X1JFR19UWVBFLCAmcmVndmFsKTsKKwlpZiAoZXJy
KQorCQlyZXR1cm4gZXJyOworCisJaWYgKHJlZ3ZhbCAhPSAweDUxKSB7CisJCWRldl9lcnIoZGV2
LCAidW5leHBlY3RlZCBkZXZpY2UgdHlwZSAweCUwMngsIGV4cGVjdGVkIDB4NTFcbiIsIHJlZ3Zh
bCk7CisJCXJldHVybiAtRU5PREVWOworCX0KKworCWVyciA9IHJlZ21hcF9yZWFkKHJlZ21hcCwg
U1BENTExOF9SRUdfVFlQRSArIDEsICZyZWd2YWwpOworCWlmIChlcnIpCisJCXJldHVybiBlcnI7
CisKKwlpZiAocmVndmFsICE9IDB4MTgpIHsKKwkJZGV2X2VycihkZXYsICJ1bmV4cGVjdGVkIGRl
dmljZSB0eXBlIDB4JTAyeCwgZXhwZWN0ZWQgMHgxOFxuIiwgcmVndmFsKTsKKwkJcmV0dXJuIC1F
Tk9ERVY7CisJfQorCisJcmV0dXJuIHNwZDUxMThfY29tbW9uX3Byb2JlKGRldiwgcmVnbWFwLCBm
YWxzZSk7Cit9CisKK3N0YXRpYyBzdHJ1Y3QgaTNjX2RyaXZlciBzcGQ1MTE4X2kzY19kcml2ZXIg
PSB7CisJLmRyaXZlciA9IHsKKwkJLm5hbWUJPSAic3BkNTExOF9pM2MiLAorCQkub2ZfbWF0Y2hf
dGFibGUgPSBzcGQ1MTE4X29mX2lkcywKKwkJLnBtID0gcG1fc2xlZXBfcHRyKCZzcGQ1MTE4X3Bt
X29wcyksCisJfSwKKwkucHJvYmUJCT0gc3BkNTExOF9pM2NfcHJvYmUsCit9OworCittb2R1bGVf
aTNjX2kyY19kcml2ZXIoc3BkNTExOF9pM2NfZHJpdmVyLCAmc3BkNTExOF9pMmNfZHJpdmVyKTsK
IAogTU9EVUxFX0FVVEhPUigiUmVuw6kgUmViZSA8cmVuZUBleGFjdGNvZGUuZGU+Iik7CiBNT0RV
TEVfQVVUSE9SKCJHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+Iik7Ci0tIAoyLjUw
LjEKCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkz
Ywo=
