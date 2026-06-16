Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D6EBCD98DA
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Jun 2026 09:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fA51dYwuoOfy8tasSKnZce3ffb2vUK+EhvT0c3ogRV4=; b=oJEwwWzHXLNl1o
	5WQyyIwmXac1HfyzczrALUvAQo31RQvk0HwLaUb2QKqYhZlGgoOjuLEetvX3gCof3kf+EY1Q4mM73
	oNaU4yccZU+3aTpXEUUcLcy0FNno5n7Kzg6b4KNVg2kxsY6vDuennv7YK+pg+ZRLfBfKPnZCXmHFo
	sltLa8Q9oTErMPKST6NEtap4EvhJHdrCYALUzsrLtqTx36Il8KIvzhmjTqpm9o1dgzFOaA95xUrUm
	9LDUsGixl4ynBTGs0xDY/ygtGbDLiDWBba/ltrRdABOf3mRd5/hxbYuQpNFWrGI8kOkNpWj8rfsI2
	tc98duVrdXf98rfL/OhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZQXx-0000000FYU8-1B9E;
	Tue, 16 Jun 2026 09:57:29 +0000
Received: from mail-northcentralusazon11013025.outbound.protection.outlook.com ([40.107.201.25] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZQXu-0000000FYTA-0qmc
	for linux-i3c@lists.infradead.org;
	Tue, 16 Jun 2026 09:57:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y7PZXshqZXCk5OETx6ITDqLDKS9e5zQOmwv2lyqMVEd9kKBoV/hIxDiN/F+NpY+FJlBLUEBKgNc3KH041lPe6eREZ4/xBMTYidWPkRJj6hbOaAkHdrQPPCeoABcZ5AjzQHXNDZpZuLaja5hDt5d9hCbSHEZshH9PnFNcWJbNVFzLQf7zYU+qXn6Io/EL46kUZfanqGcp+yN7ZZxRpGeR7bT95dnr3CYHYe01YUnefqvSSAv/R2+dDLhifkDj6xarZdcDzUYm0Bo2xPGSgwaWYH4bOrb8xoyIpzZNmCEcYnw40BdH3QajYRmsIapdx9fGVHnxoSdD5gqSnlpoZTZKvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ya0juJ0y6/8op5CKi85AdUV8HmWe8onjEhiIMIK41sg=;
 b=nehj8sJm3/jD9ybl/D8Jkkctxp1YkGogXY5dd+uP4emdJiZYc9FMAc6GhWxEouUxfTrv+KmPA1T7Zh3tKm5j3uVwPKhKSBhroIquTehaHMXduDHrbhXFYHQPK5foPfkVIXU47sfyx/O7gl0ZQHlawxmHfgcj5V6Yi7LQ3h2Tkwj4h9t21W/YCxsdGdJhejLe+MpAsowrYV0bYJuLmCcLexrnRnu7uvl7XKY0vHSuGUFd+t7tuxYL3sGN5AZP4RRat8jAaiss/y09h3z/0R1u3PZZFJpzZTGdHzAfyHqGahvMBdNKLaHS4MHb+V14jjBwSeZIL7hvXNfTq2vN5CCqIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ya0juJ0y6/8op5CKi85AdUV8HmWe8onjEhiIMIK41sg=;
 b=kiHh7pRjSjs2QngUzHxvIx7SGPu61o9N992tQNLNjs7B9XrreOZmcyV+QGVVSnSPqwLjPDXlGgsmDezAeC3Fej3nOnsBCPeEBJWwWIZ5LozUcqKwQzcRt9/shTZzDc266Z1MfIl1NrjIkZPlo9d6kprNlDxtrAdrI8cc91gVNMH7ZYZGOZZx5ZBy/3uMNtDgGBLawBpAkk33UJTPn7aySOz0XnqHYXWrLYTPnhH7xaKO6SPGGxmGCLCbPBrRCMaMEcqeeOYxZfZYqIQxbIKxcHI7xF6OcfqcSz6ePlAYVBszHoxmaH0p+dh9pcfiq0Mjo7/OtmmByzz2sRliEuu4wQ==
Received: from SA9PR13CA0161.namprd13.prod.outlook.com (2603:10b6:806:28::16)
 by SA0PR12MB7477.namprd12.prod.outlook.com (2603:10b6:806:24b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 09:57:21 +0000
Received: from SN1PEPF0002636A.namprd02.prod.outlook.com
 (2603:10b6:806:28:cafe::3e) by SA9PR13CA0161.outlook.office365.com
 (2603:10b6:806:28::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.8 via Frontend Transport; Tue, 16
 Jun 2026 09:57:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SN1PEPF0002636A.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Tue, 16 Jun 2026 09:57:21 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 16 Jun
 2026 02:57:11 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 16 Jun 2026 02:57:11 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Tue, 16 Jun 2026 02:57:07 -0700
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
Subject: [PATCH v4 11/12] hwmon: spd5118: Add I3C support
Date: Tue, 16 Jun 2026 09:54:25 +0000
Message-ID: <20260616095429.3947205-12-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616095429.3947205-1-akhilrajeev@nvidia.com>
References: <20260616095429.3947205-1-akhilrajeev@nvidia.com>
MIME-Version: 1.0
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636A:EE_|SA0PR12MB7477:EE_
X-MS-Office365-Filtering-Correlation-Id: c049d5fc-43c8-4856-ee2d-08decb8da895
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|36860700016|82310400026|23010399003|3023799007|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: N28EwAdyGOTJLgw6M8kyPZ43psvTxBpRn7RiWHr1RES9s/lm/Ye+iA71TuBmWzDvyCUJGouMpo57U14id/2s/LTlcVpsCeGjeYwZF8apezdEZRmKyj2AG38c0KAnLLpbY28f1NxsvCZX5V4m8iVyX2DprhtWunc17GjUPGMqWsfZfZx+duKBj1Wz3FnZfMMFIUGqXnCyyYrnaW4uEw3kUUMf4fpQBHfXNGEdAf59fWl8Y0DeoJuA6x8xUH0dhp0QDpDGvCj/bVEHwjjgnkW43obEjqYUZrltl/4HNRV6jovVLosK2YihsdVcn2WHT5n2cXUTs0laVX5np/RCIuWJFBsAC8I7jv0FCSH8P6cn/tqMmHutsS8G6vqPS+nFSHEDh8IFoZL2hhsQkIbh+sgBrM8EIO5RtaNUG/o9PvtGIdnGg1S93Wdlph390TArEk3/qAH5zoOQfr0z/kMAqjLj0vIgjLrTjUt0k5Q9cxCWBZNdLK83ITszprWlDb4KJHF1mamYKS9hvDiiqhvsNgBuwXw6LtSSq8w8WJceXGEC+vgjOMCuDVXswTMzf4iQjNsiAQehrtF6Kq6z3OUo69QmVmdNSMPlT3X2bWv1prvJHi9JudLyP5SGE+D5mHwtOX+5SYSK8QdHZdYRY0EpfjYcpg3EACOFM+P9zPdstsWHDNcn2TJrBpCw1uWcVs+2RPCG9Q5ZC2KtOi+ytuNo/uI87vthmteQQz/AKFOGU3v3aIk=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(36860700016)(82310400026)(23010399003)(3023799007)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: V18xkn0SrdKdI34Jl8MGSaasaON74gskNI7Lwy9Yni2geli/LXGoSbh+yuvZe4sMdNpDwlxaS4giorrJLVdgsN52vucEWFRenDq3NhQcbS9wIEIC/WYK4hnPyUw1JYWZYhJmpF6jweSw5F781D8JyqhCp72lDViNb2NL7c+oWEOr8Lczove//ubnNRhJmzQ4BUGv4Xf9NPEmKd7CP9cybEIx5vinISYRDVeLnoke0ffwD4gui6/Yx6CkYnm37UBBAPN96SA6BG3h2mEf7AT0v1LJneWU124U0UD9oNyY5et3duLwI9LDPUF5O9XYkiUVm6+o2x/dm3OzHLou6BMrMaTezazfamXo+WOs/2VEkWSLBd9pO2wr5u1UvBwJwaRXOTSiJRSZPmA21VcCxrdE5N8e/C0hqqgr8XsavXHCoqebCDGIejxEuUptLOWCBbwt
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 09:57:21.1365
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c049d5fc-43c8-4856-ee2d-08decb8da895
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7477
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_025726_293538_A2632CCF 
X-CRM114-Status: GOOD (  20.17  )
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
