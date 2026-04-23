Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9409DF99351
	for <linux-i3c@archiver.kernel.org>; Thu, 23 Apr 2026 09:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fG8o1dcD7I4zT/NFR64rEwFtATkbIMLXMcW6Bzesp3Y=; b=yiuq1cKf0ixGv3
	B8Wa7rtN2qNT9aqe95hPORmFbj1PwXq8DM+5OsJu74Ex0sgSnqqhdKvj22gV+abZHMgTR76g3G5tB
	MgBZKgh0V8G86zIf/LmYBgYO7WPxCaNWEKEwUA/EHPLIxFdv1wTAPV9zhlBWo94j+sxywWUxE4Hp0
	fXNxgvDwI5X1gzGi+3xd/xT1W8jo/GmhIFrte0B/SXjcKdM/IcrDZDu6WL5hp3E4m+kSFpquy7ioZ
	yXO8Wl3CQYde9amfwsHECiJGSQz2tQUWZmUrQ3Iu42/E5hcwJJQij0pJdKoNcW7LbDi9kJFRpNyeE
	x9QKst+7KzjihJQ2ZpfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFpvw-0000000BIZ2-1Sqv;
	Thu, 23 Apr 2026 09:01:16 +0000
Received: from mail-centralusazon11010065.outbound.protection.outlook.com ([52.101.61.65] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFpvq-0000000BIXb-2UET
	for linux-i3c@lists.infradead.org;
	Thu, 23 Apr 2026 09:01:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PCsvtuqpossJgCvatILOjVXgnA8U7vXt5M2BbRahmWhAZjnPcNGlb/5dHsnf8chogW/fAd4H2lvJcVATfIF1dPOhQm3HNSUuShMCYKl/6x8O4xsZHvJpUZTxpo4TQxYvnytYuH3EYTWOr/ni+E0hq3uCIGmtpoj/8M3bAnHsv+HDyt8jaEycIQ55JvNeXSsgH8DKlWRo19nvASLk6EgS4cDGfOWQks40ukCvyxqQ6+rWEYbQSBYTmpJgnm9Qn9bPh7jiz0Iog/W3yxKV/Mmrwmozf3WeH1XdR/KDQGh8aS4BUWTxAnohhOOCGXgN89q5YeUtmlhmLlQHAmC50lXjFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d0hZdO80FZ9vJCMzl2JOQ+kUQKQSDRmMqGLUDxkR4vE=;
 b=trJDfIibLM7igoW/Srys313bq/yCp13gXXW6Osv6G1bWwvMKQ+kMN8LxJExkVa83jwG4G5UKzl86qVCd+IEurQqi+XHystUehhm/XFCpPEWdTHlkznx8iMiHSla7Wj+/z0JKrgy/VziCEzYixAykw2lMS4xfCjjABA2k7BUywj0SME1uReQXvxbs2Yea3t6/K4pT+iFTqZj1l/e8usnSnzsIBiFCvDj6y11ftv9/fZd8ej68SwuEdnL7bet1Lg+75ebI7exsWRywS+uIn7Ziu3P1avCNH9mb4oOu9WvB3PgPMJtz3h0xne1H0Qc5pC73oUZ+LK20sQDjy2WXz8blTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d0hZdO80FZ9vJCMzl2JOQ+kUQKQSDRmMqGLUDxkR4vE=;
 b=XhQNzyK9QV1VEsra8t+O6lYmGAxQTjnCAai9Gjh6f4ROwJTf+8ihIJwBZWmh6KCcuQK8l1pipppuRDePSkmRgtezEfEv1fRfzIBXyu0By3NsGJkmkI8h4tZL+hLWhfmtyxh5S7l2Zmq5sdjhQW+XSWxWVBh5DfO9SVjR4aJxWGlUL1sQN1RLGs9FCcF9mTGjU+e8He2YCTWT8jV73cCBlGQkSscXnt/kZa8CxYMbBMyTTnPcWkbo4//DwHeLVbYARXkQo/7DCB1DSzp40wLAlgMqhgbkHb3JPc6X8K4wzmgOCoGOjaMxfEbcuVCi8+t//dy+nlcHIG8pAm51/x2qGA==
Received: from DS7PR03CA0030.namprd03.prod.outlook.com (2603:10b6:5:3b8::35)
 by MN0PR12MB6152.namprd12.prod.outlook.com (2603:10b6:208:3c4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.20; Thu, 23 Apr
 2026 09:00:56 +0000
Received: from DM2PEPF00003FC2.namprd04.prod.outlook.com
 (2603:10b6:5:3b8:cafe::26) by DS7PR03CA0030.outlook.office365.com
 (2603:10b6:5:3b8::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Thu,
 23 Apr 2026 09:00:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DM2PEPF00003FC2.mail.protection.outlook.com (10.167.23.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Thu, 23 Apr 2026 09:00:55 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Apr
 2026 02:00:32 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Apr
 2026 02:00:32 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 23 Apr 2026 02:00:23 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Rafael J .
 Wysocki" <rafael@kernel.org>, Saket Dumbre <saket.dumbre@intel.com>, "Len
 Brown" <lenb@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Philipp Zabel
	<p.zabel@pengutronix.de>, Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>, Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, "Eric
 Biggers" <ebiggers@kernel.org>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Jon Hunter <jonathanh@nvidia.com>, "Thierry
 Reding" <treding@nvidia.com>, <linux-tegra@vger.kernel.org>,
	<linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<acpica-devel@lists.linux.dev>, <linux-hwmon@vger.kernel.org>
CC: Akhil R <akhilrajeev@nvidia.com>
Subject: [PATCH v3 12/13] hwmon: spd5118: Add I3C support
Date: Thu, 23 Apr 2026 14:27:11 +0530
Message-ID: <20260423085718.70762-13-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260423085718.70762-1-akhilrajeev@nvidia.com>
References: <20260423085718.70762-1-akhilrajeev@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC2:EE_|MN0PR12MB6152:EE_
X-MS-Office365-Filtering-Correlation-Id: cccbf4d6-3bb3-4b54-11d9-08dea116d40c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|7416014|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 6Xl9A36w0lrwG2FlPTk55H3dDcEIrzKD5BcTJzdIT4Tu5s7LAhnTAUjpoExzIKFVq/ieqUZY/ByZDimzIN/U6i2nb59qYWPxQohwzSEzqKmwytGSfUWNh/4xPD/pi8q+vCF0bL07Xz88uNIyuWxk8KNBiPkMRkUi/Bw/Zr8wgigZerasLQIBU07UaGRGBHUOa0V/UUBziswzwUJzoiqRVQD8yxq20ueSt3CNhR1vnA0gHXQx/pwKJn7zma2FIzChLgr7OPjK3GuAAXIY/kUOH54YSfdBEx+ZZziCQkWl1VcS3LsQ+ewaIUbqXqVBc7TifBSBboBnINhlwjSp0zcOdBwQB1XFwbOio0jvVTHdl/GoXZNGMT9p7KTBxhMsd501hrWtf7XPkiXBaqM6tgeplJwYIrI0h4BdbqkhYrpZm5QtbCrporQkI+Y9ISejE8xnTQQBMz0OfDgch7B3/maFy5s4AijygJqVI62O0aOh84mc+ATYm46fvbw0o5olAmYmpJXwu9bAjxnK/leOHbj9PLbwlE5Fy3ifEL5bKQyL7Qj6X9WIceyosAWeLr3I/9r+OsM84iQuqK2rtDDL1h4rXlSmTG4owP+VhYxKOswvBfur5SDp8ywOhz+W96EjUDkDaND7uQ6Qf66VLOLSi+5uG+/irfteCGkqNr0W4ISBDATLLd9s+Jtg1Jztg3oHbtek59dREb5G0l55Bvdnbhm1I7oI0YHdnON0wRcsgWa3oTtdujlthDbjIXIXPsADK1cyWMNEhtFScZsJ7oT9R6ziBZQb3HAer7x+QXfYUiyKsvbasJl9m0MhZYozyUf70OKp
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(7416014)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: G2z1BSe9lAleT0te6ap2sBoyCYvnpbeFQa6d8/Qd26eeJyEI4i0Q3f0sFnp+rEVcrJ8d/sxN0iZ231xzyvnSjNtlwD8HqMLlVFDPaotEhQfTbKxzcuFxpaO/EOZVoWHevVSqmmXznhqzvVUcosf9bE8LxjKsGJm2x8IguwLXQLemlxFKmnu1bOwLOJgGe6cuBP6FwgrdJcpVp9HzTopugpHZZ29mxnCPk2WsOtkFahEJSYG3VNpmxrYS7PeNbjZ4/dP3+Xt1H3ph3UAnCpHTS9aMB3vMdzAM7o51L/3J4KkBhBggXVxcrsveittPeGjPZGb1WAtkyWutvD45AGglY/OhmF9PVvfkiVw34d1jni742okKnXEid81QGhzzN6QBYw+m2BEQJImd7quR1EbuCj0Euc6QWjQCwzXgzSs1a7YzTSjGMPDAU5lAzgsx147h
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 09:00:55.0689
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cccbf4d6-3bb3-4b54-11d9-08dea116d40c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM2PEPF00003FC2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_020110_633598_8CD80374 
X-CRM114-Status: GOOD (  20.37  )
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
dWlyZSBhbiBBQ1BJIG9yIGRldmljZSB0cmVlIGVudHJ5LiBUaGUgZGV2aWNlIG1hdGNoaW5nIGlz
IGhlbmNlCnRocm91Z2ggdGhlIE9GIG1hdGNoIHRhYmxlcyBvbmx5IGFuZCBkbyBub3QgbmVlZCBh
biBJM0MgY2xhc3MgbWF0Y2gKdGFibGUuIFRoZSBkZXZpY2UgaWRlbnRpdHkgaXMgdmVyaWZpZWQg
aW4gdGhlIHR5cGUgcmVnaXN0ZXJzIGJlZm9yZQpwcm9jZWVkaW5nIHRvIHRoZSBjb21tb24gcHJv
YmUgZnVuY3Rpb24uCgpBY2tlZC1ieTogR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0
PgpTaWduZWQtb2ZmLWJ5OiBBa2hpbCBSIDxha2hpbHJhamVldkBudmlkaWEuY29tPgotLS0KIGRy
aXZlcnMvaHdtb24vS2NvbmZpZyAgIHwgIDkgKysrKy0tLQogZHJpdmVycy9od21vbi9zcGQ1MTE4
LmMgfCA1NiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQogMiBmaWxl
cyBjaGFuZ2VkLCA2MSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvaHdtb24vS2NvbmZpZyBiL2RyaXZlcnMvaHdtb24vS2NvbmZpZwppbmRleCAxNGU0
Y2VhNDhhY2MuLmE3ZjYwZjg4NjhlYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9od21vbi9LY29uZmln
CisrKyBiL2RyaXZlcnMvaHdtb24vS2NvbmZpZwpAQCAtMjMwOSwxMiArMjMwOSwxNSBAQCBjb25m
aWcgU0VOU09SU19JTkEzMjIxCiAKIGNvbmZpZyBTRU5TT1JTX1NQRDUxMTgKIAl0cmlzdGF0ZSAi
U1BENTExOCBDb21wbGlhbnQgVGVtcGVyYXR1cmUgU2Vuc29ycyIKLQlkZXBlbmRzIG9uIEkyQwor
CWRlcGVuZHMgb24gSTNDX09SX0kyQwogCXNlbGVjdCBSRUdNQVBfSTJDCisJc2VsZWN0IFJFR01B
UF9JM0MgaWYgSTNDCiAJaGVscAogCSAgSWYgeW91IHNheSB5ZXMgaGVyZSB5b3UgZ2V0IHN1cHBv
cnQgZm9yIFNQRDUxMTggKEpFREVDIEpFU0QzMDApCi0JICBjb21wbGlhbnQgdGVtcGVyYXR1cmUg
c2Vuc29ycy4gU3VjaCBzZW5zb3JzIGFyZSBmb3VuZCBvbiBERFI1IG1lbW9yeQotCSAgbW9kdWxl
cy4KKwkgIGNvbXBsaWFudCB0ZW1wZXJhdHVyZSBzZW5zb3JzIHVzaW5nIEkyQyBvciBJM0MgYnVz
IGludGVyZmFjZS4KKwkgIFN1Y2ggc2Vuc29ycyBhcmUgZm91bmQgb24gRERSNSBtZW1vcnkgbW9k
dWxlcy4KKworCSAgVGhpcyBkcml2ZXIgc3VwcG9ydHMgYm90aCBJMkMgYW5kIEkzQyBpbnRlcmZh
Y2VzLgogCiAJICBUaGlzIGRyaXZlciBjYW4gYWxzbyBiZSBidWlsdCBhcyBhIG1vZHVsZS4gSWYg
c28sIHRoZSBtb2R1bGUKIAkgIHdpbGwgYmUgY2FsbGVkIHNwZDUxMTguCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2h3bW9uL3NwZDUxMTguYyBiL2RyaXZlcnMvaHdtb24vc3BkNTExOC5jCmluZGV4IDhm
ZGRlMzVlNjhjZC4uZGI2NjAyOGQyZjU5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2h3bW9uL3NwZDUx
MTguYworKysgYi9kcml2ZXJzL2h3bW9uL3NwZDUxMTguYwpAQCAtMTgsNiArMTgsNyBAQAogI2lu
Y2x1ZGUgPGxpbnV4L2JpdHMuaD4KICNpbmNsdWRlIDxsaW51eC9lcnIuaD4KICNpbmNsdWRlIDxs
aW51eC9pMmMuaD4KKyNpbmNsdWRlIDxsaW51eC9pM2MvZGV2aWNlLmg+CiAjaW5jbHVkZSA8bGlu
dXgvaHdtb24uaD4KICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KICNpbmNsdWRlIDxsaW51eC9t
dXRleC5oPgpAQCAtNDY0LDYgKzQ2NSwyNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHJlZ21hcF9j
b25maWcgc3BkNTExOF9yZWdtYXA4X2NvbmZpZyA9IHsKIAkubnVtX3JhbmdlcyA9IEFSUkFZX1NJ
WkUoc3BkNTExOF9pMmNfcmVnbWFwX3JhbmdlX2NmZyksCiB9OwogCisvKgorICogU1BENTExOCAy
LWJ5dGUgcmVnaXN0ZXIgYWRkcmVzcyBmb3JtYXQgKEpFU0QzMDAtNSwgVGFibGVzIDcgJiAyMCk6
CisgKiAgIEJ5dGUgMSAob24gd2lyZSBmaXJzdCk6ICBNZW1SZWcgfCBCbGtBZGRyWzBdIHwgQWRk
cmVzc1s1OjBdCisgKiAgIEJ5dGUgMiAob24gd2lyZSBzZWNvbmQpOiAwMDAwICAgfCBCbGtBZGRy
WzQ6MV0KKyAqCisgKiBUaGUgYWRkcmVzcyBieXRlICh3aXRoIE1lbVJlZyBhbmQgbG93ZXIgYWRk
cmVzcyBiaXRzKSBtdXN0IGJlIHNlbnQgZmlyc3QsCisgKiBmb2xsb3dlZCBieSB0aGUgdXBwZXIg
YmxvY2sgYWRkcmVzcyBieXRlLiBXaXRoIHJlZ21hcCAxNi1iaXQgcmVnaXN0ZXIKKyAqIGZvcm1h
dCwgdGhpcyBtYXBzIHRvIGxpdHRsZS1lbmRpYW46IHRoZSBsb3cgYnl0ZSBvZiB0aGUgMTYtYml0
IHZhbHVlIGlzCisgKiB0cmFuc21pdHRlZCBmaXJzdC4gTm8gcmFuZ2UgY29uZmlnIGlzIG5lZWRl
ZCBzaW5jZSBJM0MgZG9lcyBub3QgdXNlIE1SMTEKKyAqIHBhZ2Ugc3dpdGNoaW5nLgorICovCitz
dGF0aWMgY29uc3Qgc3RydWN0IHJlZ21hcF9jb25maWcgc3BkNTExOF9yZWdtYXBfaTNjX2NvbmZp
ZyA9IHsKKwkucmVnX2JpdHMgPSAxNiwKKwkudmFsX2JpdHMgPSA4LAorCS5tYXhfcmVnaXN0ZXIg
PSAweDdmZiwKKwkucmVnX2Zvcm1hdF9lbmRpYW4gPSBSRUdNQVBfRU5ESUFOX0xJVFRMRSwKKwku
d3JpdGVhYmxlX3JlZyA9IHNwZDUxMThfd3JpdGVhYmxlX3JlZywKKwkudm9sYXRpbGVfcmVnID0g
c3BkNTExOF92b2xhdGlsZV9yZWcsCisJLmNhY2hlX3R5cGUgPSBSRUdDQUNIRV9NQVBMRSwKK307
CisKIHN0YXRpYyBpbnQgc3BkNTExOF9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikKIHsKIAlz
dHJ1Y3Qgc3BkNTExOF9kYXRhICpkYXRhID0gZGV2X2dldF9kcnZkYXRhKGRldik7CkBAIC03MDEs
NyArNzIzLDM5IEBAIHN0YXRpYyBzdHJ1Y3QgaTJjX2RyaXZlciBzcGQ1MTE4X2kyY19kcml2ZXIg
PSB7CiAJLmFkZHJlc3NfbGlzdAk9IElTX0VOQUJMRUQoQ09ORklHX1NFTlNPUlNfU1BENTExOF9E
RVRFQ1QpID8gbm9ybWFsX2kyYyA6IE5VTEwsCiB9OwogCi1tb2R1bGVfaTJjX2RyaXZlcihzcGQ1
MTE4X2kyY19kcml2ZXIpOworLyogSTNDICovCisKK3N0YXRpYyBpbnQgc3BkNTExOF9pM2NfcHJv
YmUoc3RydWN0IGkzY19kZXZpY2UgKmkzY2RldikKK3sKKwlzdHJ1Y3QgZGV2aWNlICpkZXYgPSBp
M2NkZXZfdG9fZGV2KGkzY2Rldik7CisJc3RydWN0IHJlZ21hcCAqcmVnbWFwOworCXU4IHJlZ3Zh
bFsyXTsKKwlpbnQgZXJyOworCisJcmVnbWFwID0gZGV2bV9yZWdtYXBfaW5pdF9pM2MoaTNjZGV2
LCAmc3BkNTExOF9yZWdtYXBfaTNjX2NvbmZpZyk7CisJaWYgKElTX0VSUihyZWdtYXApKQorCQly
ZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIFBUUl9FUlIocmVnbWFwKSwgInJlZ21hcCBpbml0IGZh
aWxlZFxuIik7CisKKwllcnIgPSByZWdtYXBfYnVsa19yZWFkKHJlZ21hcCwgU1BENTExOF9SRUdf
VFlQRSwgcmVndmFsLCAyKTsKKwlpZiAoZXJyKQorCQlyZXR1cm4gZXJyOworCisJaWYgKHJlZ3Zh
bFswXSAhPSAweDUxIHx8IHJlZ3ZhbFsxXSAhPSAweDE4KQorCQlyZXR1cm4gLUVOT0RFVjsKKwor
CXJldHVybiBzcGQ1MTE4X2NvbW1vbl9wcm9iZShkZXYsIHJlZ21hcCk7Cit9CisKK3N0YXRpYyBz
dHJ1Y3QgaTNjX2RyaXZlciBzcGQ1MTE4X2kzY19kcml2ZXIgPSB7CisJLmRyaXZlciA9IHsKKwkJ
Lm5hbWUJPSAic3BkNTExOF9pM2MiLAorCQkub2ZfbWF0Y2hfdGFibGUgPSBzcGQ1MTE4X29mX2lk
cywKKwkJLnBtID0gcG1fc2xlZXBfcHRyKCZzcGQ1MTE4X3BtX29wcyksCisJfSwKKwkucHJvYmUJ
CT0gc3BkNTExOF9pM2NfcHJvYmUsCit9OworCittb2R1bGVfaTNjX2kyY19kcml2ZXIoc3BkNTEx
OF9pM2NfZHJpdmVyLCAmc3BkNTExOF9pMmNfZHJpdmVyKTsKIAogTU9EVUxFX0FVVEhPUigiUmVu
w6kgUmViZSA8cmVuZUBleGFjdGNvZGUuZGU+Iik7CiBNT0RVTEVfQVVUSE9SKCJHdWVudGVyIFJv
ZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+Iik7Ci0tIAoyLjUwLjEKCgotLSAKbGludXgtaTNjIG1h
aWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
