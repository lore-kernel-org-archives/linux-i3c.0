Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FCADEA3C23
	for <linux-i3c@archiver.kernel.org>; Thu,  9 Apr 2026 11:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wTxXkWHKE/tqj3Lp01DNXD3qAwrg/wJvdrGTDhjfqCc=; b=i/bLGgZX0roKHH
	U/OJQjyFVzl8Hm8XgxUGBlxVelRoBbJufSRuEfprl9Q7Yynquk2z406yDknAsRidQD3Gens/rOy4V
	FkfRPkBY7hsg/QVB9354+UWlhIX2lLcs0UFjitLmpFjSWKx9ps154VFNOzdqechqa1JgUDW5k8vNd
	/WpAlvDifV01qUl3E6XHFia8ZwOdy2ckFEMLZYAVRZdOzfoc2ayNMRCqwz9yRJ0GorsKI5ggr4dYh
	KXpnQB7v1aH3P96xeV4iPK5x3YC8xHubAOEFLBz/fnGducW5dmLS/NlQzbcg+GXokAzCYqooXvJFs
	XMdNPbN/mmj9VwTHLW9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAn9D-0000000ADjq-1Xz3;
	Thu, 09 Apr 2026 11:02:12 +0000
Received: from mail-centralusazon11010043.outbound.protection.outlook.com ([52.101.61.43] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAn8a-0000000ADU3-2naM
	for linux-i3c@lists.infradead.org;
	Thu, 09 Apr 2026 11:01:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S5nY8ZyuhQRkFcQ5389thiZBDdbXjufaye5YoQz7bdszKMHn6TaU+MFMuDFN4OWwdFA0IVmpIsRYepQsnbYM1Ei1zFAD/HaIp84iamqU4GO4DEydgeZ1Yf5Mi7Mzq5C8G4qojchI0FX6ZomlbhDaIl95q0GMXWDg+zDjD779nbpIS2+mdF8twupphfA4o+KREAQghhyX4hz0o7d+TGSXDnebMA0T5+2B4Zulu1CqDu0Y+JtrQxsukCuX63IogoftaEvnEVFmXT8/JMF2kjEPCvm6oICi7CVjcQNfEgtJKSGLJCRjFHuH4m/mI8HxFnh6FH+Es19B+9t3mHWEsZvx6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3P1G9sd5eVKPv7crjYiwbJhXENNX6LRIjAm0yieU/gk=;
 b=X7dzspuPTehzwhqmW/XY4E5xIVIW/v3n1e5vXHd1wrnqJNqMDq0wjov9hUdJKBCDvecFrUTrNSue3D2MO8/AoB+Xe56LqrHx9AHJasUGpuy5VAy11eplLYIJbjXoCvWdILDXn8TK6WhZMr8FzBdAi5d0Oo9VVtQpWYEi/ogSHyJbffeq+GbxzKjSTCp1c0zmkErunnJtdtn8yFgVjApeyzNFhAXC/xjVXn8oelhwaorl18NtImA71ftYIX52WHngy+p5lfiHfW9IS+GQJ1yZ1RxErgl0F5v+NHoOh0+YEX1yXupI2yDzXjkoCzxjramlD2iH5nTsL+9QF4ndf8BRVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3P1G9sd5eVKPv7crjYiwbJhXENNX6LRIjAm0yieU/gk=;
 b=OJK+cuSrBQ1sHdOSi9KtpwGJhNIsK6G/vJjUm/t4LVaKJpidXwhZpUVtJ67VZOrjM0shvHDbbWSKVsWkJGzmo5h1JyXZ4QlxcmCjvmq1UL0cahrbyMG+Jhd/rnJEWd7DvGTTWxG3GRLnkHvX+LF/7b1PjsrFOxqJAv5JT/ebCdCWeq2xGufsnTdFXCf9XC8oDMXHg7OXxy+nkbyNTDg/21DSLVUyT5sdlKLhwceTv5RYeDCKERM05DpqsDRmsjdlBmJ0QpdKznlSljcIriHeQrcg/0EmOv046NO6+I8PzLr+aU+bNcA9biKIyoTioBB6NOJcRFCd1oDbEBBxaI8UtQ==
Received: from SJ0PR03CA0043.namprd03.prod.outlook.com (2603:10b6:a03:33e::18)
 by CY1PR12MB9627.namprd12.prod.outlook.com (2603:10b6:930:104::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 11:01:20 +0000
Received: from CO1PEPF00012E80.namprd03.prod.outlook.com
 (2603:10b6:a03:33e:cafe::36) by SJ0PR03CA0043.outlook.office365.com
 (2603:10b6:a03:33e::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.41 via Frontend Transport; Thu,
 9 Apr 2026 11:01:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF00012E80.mail.protection.outlook.com (10.167.249.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 9 Apr 2026 11:01:18 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 04:00:55 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 04:00:55 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 9 Apr 2026 04:00:49 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Rafael J .
 Wysocki" <rafael@kernel.org>, Robert Moore <robert.moore@intel.com>, "Len
 Brown" <lenb@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Philipp Zabel
	<p.zabel@pengutronix.de>, Eric Biggers <ebiggers@kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-acpi@vger.kernel.org>, <acpica-devel@lists.linux.dev>,
	<linux-hwmon@vger.kernel.org>
CC: Akhil R <akhilrajeev@nvidia.com>
Subject: [PATCH v2 12/13] hwmon: spd5118: Add I3C support
Date: Thu, 9 Apr 2026 16:27:42 +0530
Message-ID: <20260409105747.48158-13-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260409105747.48158-1-akhilrajeev@nvidia.com>
References: <20260409105747.48158-1-akhilrajeev@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E80:EE_|CY1PR12MB9627:EE_
X-MS-Office365-Filtering-Correlation-Id: 96653bd4-503b-4d01-f210-08de962753f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|82310400026|7416014|376014|921020|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: w1OlsDkSAlZ4CnwrU0TQ1yNzM0DblzUWCsvWOyw/4D9k0IhPq8lDECx/01tg1Q3B4vvBNsHZJVF2JB4pUxLEZZmm4XqZ3vAqI+1JQ0Qfd/4B3EQEcdzfe9rJ6zUcZAUPIPAblNhETfajxaf0iKsH57tY56n974apozZgA5jLWnsQMuknDK/64xBE6Hhv5bx+Wk8Rr8V4aY5jDEMk0zY+m5yVBwMwJSfEyLh4PPGTJNKkrF7HLNZE6XNlaPHazfXc6JrvmqQvX+m1ihXz6m0p17YX+NHCnhj9xHKrXpytyaDXZbcbe9w2ajIyG6l5vTfYocys50ySFw8JeEii9C8T3MwmKC9T1h7MbrCi7hdd/KCMGhBisaenJAW5GpaXFQrfGOHZRWyP2ud4wdMWYKntPuucLNTAxRbQIXsaCm2vxeFW7Q1V7VkTc/SN65trPCJWnMMf8qJ45aNa2CbzrQMgATnUdhmPBX2M5ybP7mV/exkhuDOoXAxJoKMA95vnwVgH3S1/ZeL4FgUHPruOIxDIRaSAqDznTcjb68q+TYlk2cEnaqqVw0GH7xQqQJAz9WDR5UMaAiRSPMFeZSW+iW3CH8oBvOI+B9zlrvAXq4t0Mbkj+B8uM2Px3cqX0aDSl4zlrzkH1qjiDqYXlh8t/e6Grs9ZKdCOIkdt1mbdcZkjTQBd3utBbCZrm9CoAVaNRDx/lVVBjvkkqBzQoSe46fUE4hXBqOwo+FeihlNba42aRf9LsD6a7fEoYm36OJ/7P+DMK2oNIEmRt27sLhvzvrERvslGQ1Xqi30dpTlSKy6Ht7jv6/eD3VloU9sGh/vxi75z
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(7416014)(376014)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: qz0etjz8hPBxW8iZ1GVRhWhmmNIDrP14WyI2ndsrRCy+k7a8aBv7bctBsYQ3H/glh3IyLIZDgTguZeO0KS90TLGFAL8mjajFXHGsBOZIj3yjBRKMwUmAAdMwy6bVWYciygeyoMZSCjIgQzcQ8aQnt/SBcgm2oyLrsnB1QxhQSDSO1f8q6+E5iILnpzcoQEVjn1QxDIOEtr2rZ/jv9+eMFD2JNnyi17SWNcmrUwUh848X9drSf1CGdheDRq5UrEbRl05ZMg4NZPlBWA8uhlqguHRiDKx8mOHGO4rO/4V7hfx4D4bDTZGno7UAgTwEfTWlUi2sKe1NO6D8Sdz6n6fagacYfmxjfMw3hQujP0PrsNxpvtp6y0lq6PQGaLDq2cbkZit7hKv21Eqzn9eF0FyW3TGabQZ1B6W+MJgIkp0gPlE+cerL+TG45f6L6BNraJoy
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 11:01:18.8586
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96653bd4-503b-4d01-f210-08de962753f4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E80.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9627
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_040129_283471_4C3CD8A2 
X-CRM114-Status: GOOD (  21.22  )
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
LS0KIGRyaXZlcnMvaHdtb24vS2NvbmZpZyAgIHwgIDkgKysrKy0tLQogZHJpdmVycy9od21vbi9z
cGQ1MTE4LmMgfCA1NiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQog
MiBmaWxlcyBjaGFuZ2VkLCA2MSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvaHdtb24vS2NvbmZpZyBiL2RyaXZlcnMvaHdtb24vS2NvbmZpZwppbmRl
eCA4YWY4MGUxN2QyNWUuLjdlOGY0MTk2MDNkZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9od21vbi9L
Y29uZmlnCisrKyBiL2RyaXZlcnMvaHdtb24vS2NvbmZpZwpAQCAtMjI5OCwxMiArMjI5OCwxNSBA
QCBjb25maWcgU0VOU09SU19JTkEzMjIxCiAKIGNvbmZpZyBTRU5TT1JTX1NQRDUxMTgKIAl0cmlz
dGF0ZSAiU1BENTExOCBDb21wbGlhbnQgVGVtcGVyYXR1cmUgU2Vuc29ycyIKLQlkZXBlbmRzIG9u
IEkyQworCWRlcGVuZHMgb24gSTNDX09SX0kyQwogCXNlbGVjdCBSRUdNQVBfSTJDCisJc2VsZWN0
IFJFR01BUF9JM0MgaWYgSTNDCiAJaGVscAogCSAgSWYgeW91IHNheSB5ZXMgaGVyZSB5b3UgZ2V0
IHN1cHBvcnQgZm9yIFNQRDUxMTggKEpFREVDIEpFU0QzMDApCi0JICBjb21wbGlhbnQgdGVtcGVy
YXR1cmUgc2Vuc29ycy4gU3VjaCBzZW5zb3JzIGFyZSBmb3VuZCBvbiBERFI1IG1lbW9yeQotCSAg
bW9kdWxlcy4KKwkgIGNvbXBsaWFudCB0ZW1wZXJhdHVyZSBzZW5zb3JzIHVzaW5nIEkyQyBvciBJ
M0MgYnVzIGludGVyZmFjZS4KKwkgIFN1Y2ggc2Vuc29ycyBhcmUgZm91bmQgb24gRERSNSBtZW1v
cnkgbW9kdWxlcy4KKworCSAgVGhpcyBkcml2ZXIgc3VwcG9ydHMgYm90aCBJMkMgYW5kIEkzQyBp
bnRlcmZhY2VzLgogCiAJICBUaGlzIGRyaXZlciBjYW4gYWxzbyBiZSBidWlsdCBhcyBhIG1vZHVs
ZS4gSWYgc28sIHRoZSBtb2R1bGUKIAkgIHdpbGwgYmUgY2FsbGVkIHNwZDUxMTguCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2h3bW9uL3NwZDUxMTguYyBiL2RyaXZlcnMvaHdtb24vc3BkNTExOC5jCmlu
ZGV4IDhmZGRlMzVlNjhjZC4uZGI2NjAyOGQyZjU5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2h3bW9u
L3NwZDUxMTguYworKysgYi9kcml2ZXJzL2h3bW9uL3NwZDUxMTguYwpAQCAtMTgsNiArMTgsNyBA
QAogI2luY2x1ZGUgPGxpbnV4L2JpdHMuaD4KICNpbmNsdWRlIDxsaW51eC9lcnIuaD4KICNpbmNs
dWRlIDxsaW51eC9pMmMuaD4KKyNpbmNsdWRlIDxsaW51eC9pM2MvZGV2aWNlLmg+CiAjaW5jbHVk
ZSA8bGludXgvaHdtb24uaD4KICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KICNpbmNsdWRlIDxs
aW51eC9tdXRleC5oPgpAQCAtNDY0LDYgKzQ2NSwyNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHJl
Z21hcF9jb25maWcgc3BkNTExOF9yZWdtYXA4X2NvbmZpZyA9IHsKIAkubnVtX3JhbmdlcyA9IEFS
UkFZX1NJWkUoc3BkNTExOF9pMmNfcmVnbWFwX3JhbmdlX2NmZyksCiB9OwogCisvKgorICogU1BE
NTExOCAyLWJ5dGUgcmVnaXN0ZXIgYWRkcmVzcyBmb3JtYXQgKEpFU0QzMDAtNSwgVGFibGVzIDcg
JiAyMCk6CisgKiAgIEJ5dGUgMSAob24gd2lyZSBmaXJzdCk6ICBNZW1SZWcgfCBCbGtBZGRyWzBd
IHwgQWRkcmVzc1s1OjBdCisgKiAgIEJ5dGUgMiAob24gd2lyZSBzZWNvbmQpOiAwMDAwICAgfCBC
bGtBZGRyWzQ6MV0KKyAqCisgKiBUaGUgYWRkcmVzcyBieXRlICh3aXRoIE1lbVJlZyBhbmQgbG93
ZXIgYWRkcmVzcyBiaXRzKSBtdXN0IGJlIHNlbnQgZmlyc3QsCisgKiBmb2xsb3dlZCBieSB0aGUg
dXBwZXIgYmxvY2sgYWRkcmVzcyBieXRlLiBXaXRoIHJlZ21hcCAxNi1iaXQgcmVnaXN0ZXIKKyAq
IGZvcm1hdCwgdGhpcyBtYXBzIHRvIGxpdHRsZS1lbmRpYW46IHRoZSBsb3cgYnl0ZSBvZiB0aGUg
MTYtYml0IHZhbHVlIGlzCisgKiB0cmFuc21pdHRlZCBmaXJzdC4gTm8gcmFuZ2UgY29uZmlnIGlz
IG5lZWRlZCBzaW5jZSBJM0MgZG9lcyBub3QgdXNlIE1SMTEKKyAqIHBhZ2Ugc3dpdGNoaW5nLgor
ICovCitzdGF0aWMgY29uc3Qgc3RydWN0IHJlZ21hcF9jb25maWcgc3BkNTExOF9yZWdtYXBfaTNj
X2NvbmZpZyA9IHsKKwkucmVnX2JpdHMgPSAxNiwKKwkudmFsX2JpdHMgPSA4LAorCS5tYXhfcmVn
aXN0ZXIgPSAweDdmZiwKKwkucmVnX2Zvcm1hdF9lbmRpYW4gPSBSRUdNQVBfRU5ESUFOX0xJVFRM
RSwKKwkud3JpdGVhYmxlX3JlZyA9IHNwZDUxMThfd3JpdGVhYmxlX3JlZywKKwkudm9sYXRpbGVf
cmVnID0gc3BkNTExOF92b2xhdGlsZV9yZWcsCisJLmNhY2hlX3R5cGUgPSBSRUdDQUNIRV9NQVBM
RSwKK307CisKIHN0YXRpYyBpbnQgc3BkNTExOF9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikK
IHsKIAlzdHJ1Y3Qgc3BkNTExOF9kYXRhICpkYXRhID0gZGV2X2dldF9kcnZkYXRhKGRldik7CkBA
IC03MDEsNyArNzIzLDM5IEBAIHN0YXRpYyBzdHJ1Y3QgaTJjX2RyaXZlciBzcGQ1MTE4X2kyY19k
cml2ZXIgPSB7CiAJLmFkZHJlc3NfbGlzdAk9IElTX0VOQUJMRUQoQ09ORklHX1NFTlNPUlNfU1BE
NTExOF9ERVRFQ1QpID8gbm9ybWFsX2kyYyA6IE5VTEwsCiB9OwogCi1tb2R1bGVfaTJjX2RyaXZl
cihzcGQ1MTE4X2kyY19kcml2ZXIpOworLyogSTNDICovCisKK3N0YXRpYyBpbnQgc3BkNTExOF9p
M2NfcHJvYmUoc3RydWN0IGkzY19kZXZpY2UgKmkzY2RldikKK3sKKwlzdHJ1Y3QgZGV2aWNlICpk
ZXYgPSBpM2NkZXZfdG9fZGV2KGkzY2Rldik7CisJc3RydWN0IHJlZ21hcCAqcmVnbWFwOworCXU4
IHJlZ3ZhbFsyXTsKKwlpbnQgZXJyOworCisJcmVnbWFwID0gZGV2bV9yZWdtYXBfaW5pdF9pM2Mo
aTNjZGV2LCAmc3BkNTExOF9yZWdtYXBfaTNjX2NvbmZpZyk7CisJaWYgKElTX0VSUihyZWdtYXAp
KQorCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIFBUUl9FUlIocmVnbWFwKSwgInJlZ21hcCBp
bml0IGZhaWxlZFxuIik7CisKKwllcnIgPSByZWdtYXBfYnVsa19yZWFkKHJlZ21hcCwgU1BENTEx
OF9SRUdfVFlQRSwgcmVndmFsLCAyKTsKKwlpZiAoZXJyKQorCQlyZXR1cm4gZXJyOworCisJaWYg
KHJlZ3ZhbFswXSAhPSAweDUxIHx8IHJlZ3ZhbFsxXSAhPSAweDE4KQorCQlyZXR1cm4gLUVOT0RF
VjsKKworCXJldHVybiBzcGQ1MTE4X2NvbW1vbl9wcm9iZShkZXYsIHJlZ21hcCk7Cit9CisKK3N0
YXRpYyBzdHJ1Y3QgaTNjX2RyaXZlciBzcGQ1MTE4X2kzY19kcml2ZXIgPSB7CisJLmRyaXZlciA9
IHsKKwkJLm5hbWUJPSAic3BkNTExOF9pM2MiLAorCQkub2ZfbWF0Y2hfdGFibGUgPSBzcGQ1MTE4
X29mX2lkcywKKwkJLnBtID0gcG1fc2xlZXBfcHRyKCZzcGQ1MTE4X3BtX29wcyksCisJfSwKKwku
cHJvYmUJCT0gc3BkNTExOF9pM2NfcHJvYmUsCit9OworCittb2R1bGVfaTNjX2kyY19kcml2ZXIo
c3BkNTExOF9pM2NfZHJpdmVyLCAmc3BkNTExOF9pMmNfZHJpdmVyKTsKIAogTU9EVUxFX0FVVEhP
UigiUmVuw6kgUmViZSA8cmVuZUBleGFjdGNvZGUuZGU+Iik7CiBNT0RVTEVfQVVUSE9SKCJHdWVu
dGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+Iik7Ci0tIAoyLjUwLjEKCgotLSAKbGludXgt
aTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
