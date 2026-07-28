Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 248E4C54F4C
	for <linux-i3c@archiver.kernel.org>; Tue, 28 Jul 2026 07:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T9Vsdgz+D+hyB3KEPULJRu97oVoicV7CUEAOhiKOWcg=; b=oCHyH4bSm6HBz/
	/0Bg8aKWgXIg5zUBbioH7Ub3HufZfz6NvkSUUUww5aY/P9QM8R1El0AtIotTo4WSGr+sLh10JWEB7
	PEH+6x83W2llihg1C1tiTA/jyDQTmyzmk8wt/xAA+7dpMtZicprLTjxjsXbqS3VGEuxEDGuTd1XbU
	jPXuPVNkX4fy5qTd/4XfR34n7nG+6N4eDlbnvvtozw6ue52+CNn29H1TU5yiopEYCDgamhfaufPdC
	v7hGSX61vkaeyFjqqEi2TLf94lxNzeKpr847s+XY/PBF/osn/jWyW8RHxkW4RvO5STtOiWvfRjOxP
	n7TSg9PTv/DvokJP47kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wobqH-00000004bU3-3WNn;
	Tue, 28 Jul 2026 07:03:09 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wobqC-00000004bSC-2Mbe
	for linux-i3c@lists.infradead.org;
	Tue, 28 Jul 2026 07:03:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JnNUq4lGjbKqUXZbBpLHT6iTAXSpI8wLlEfJUNgf1YQG3XSDpNT0xkmtcdUnHVT9tHUo3j9ElECMn8S/zmyUAwEPTBhOMV5RnYHu1DpXIn8cV46GzRCJATnff9W8Cd9mVGJialFCWqJjgO8WWv8TNzSUU8llDT6iIcXFsVhPlYGjzqUYUxDgkfyFGA7j8WdOBS10IRX1d8FC55T29yHDFiF+tjYfr5mHFWZFQsD8ZIUvS12OTJbWrlzxGl8CDccPqrjIspHC9Qw+Myed1qa/lW9M8YzHOc4Q+NW+Yee2rZc5f2kLPemvWZS+SOfoNXSclzv7vUoo/A2CuM8ESmAa4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hI+9mD6ce5H56r8WezXH6f5ENrHyw6qsoIIswBxLKAk=;
 b=w3aCYPA/Dk19f9/gTq6G53Jd34PDVnMHEEVLuIYnGXM05kb6H2/dxlieWCpryg50Py2JSYtoTwwGfI5WMce7yNj9u02fsjooEhiPT2L2XoORwxNiHorzna8huMzX1PNwYOjNjy8BLjKg/jN+84/CCuiOgMarGcV6MDonEeWy5HS0reqac7LgkM3DGkyjfliaSe1w2cnhlOdvV8Y7bEUxl4KOx7wqNFT98MTQpFdr3PZZvZXMhTv99oI0tsLwGNOVfv0BURL7QvrDaRegnYiU/R5KSAxVD9lODyccsd5q2xU7h8/HZCrMUdqNAvof7NTQTt41Rb9pfTCfCjAN3zQEmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hI+9mD6ce5H56r8WezXH6f5ENrHyw6qsoIIswBxLKAk=;
 b=QhEKmt8ih+lQrl/Iu8GTx7SbT5dvTZ2QVPhWBnc9hmm9r1+cNcfKQOapx2jb+YoKROO0NgrbykvLhVa3uh2xTzhZN1ROxmmORQ0AIodvNM9u263JYl4Uek23GcChD2lsdpQyFYTMDgMQW/W7Mol3IEYrQF5LRpH7qSfHobjnTEy1x7BP+QEF6imDpoNH60thEuafTLPlDPAFZvF5y9ZSSt/AOnpspI4oXiHjca3beGwnqecvbBFJDNMV1D0ZvZs/fqE3d70uNNbKUhFnUuioJ3vb4PWiGeA/9a/1gXhfKRJlab8NvVAiOtVeRhPvWXNrPhn1QYo3uOkRn+OIJRWtPw==
Received: from BN9PR03CA0956.namprd03.prod.outlook.com (2603:10b6:408:108::31)
 by DS0PR12MB999263.namprd12.prod.outlook.com (2603:10b6:8:424::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 07:02:56 +0000
Received: from BN2PEPF00004FBE.namprd04.prod.outlook.com
 (2603:10b6:408:108:cafe::87) by BN9PR03CA0956.outlook.office365.com
 (2603:10b6:408:108::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Tue,
 28 Jul 2026 07:02:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF00004FBE.mail.protection.outlook.com (10.167.243.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Tue, 28 Jul 2026 07:02:55 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 28 Jul
 2026 00:02:41 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Jul
 2026 00:02:41 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Tue, 28 Jul 2026 00:02:35 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Frank Li <Frank.Li@nxp.com>, Frank Li <frank.li@oss.nxp.com>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, Rob Herring <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, "Guenter Roeck" <linux@roeck-us.net>, Philipp Zabel
	<p.zabel@pengutronix.de>, "Jon Hunter" <jonathanh@nvidia.com>, Thierry Reding
	<thierry.reding@kernel.org>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Akhil R
	<akhilrajeev@nvidia.com>
Subject: [PATCH v7 11/12] hwmon: spd5118: Add I3C support
Date: Tue, 28 Jul 2026 06:59:53 +0000
Message-ID: <20260728065955.809445-12-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728065955.809445-1-akhilrajeev@nvidia.com>
References: <20260728065955.809445-1-akhilrajeev@nvidia.com>
MIME-Version: 1.0
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBE:EE_|DS0PR12MB999263:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cea4bd6-b92f-4658-2d88-08deec76401b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|36860700016|82310400026|23010399003|1800799024|56012099006|11063799006|10067099003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: qhIfeRM8MjWyk8YKROoMcHUXtuK0VFIhjmI7wYzccjLfi8WAdUCJflQRjG8eJtO34WN1NhhmvIWUlLjdVD0Vz4AGKGfPbiVBVvjNxrQBI4uQaGYMb+eEUoZoI+2uvGNdFNi9JxtXPk2JOK90WUWr11454cbkqrY23+x+PayJsn6Pc2OWk7ZfO60K9YigmfYnxNyYPBJTkblbQch+4AX/hg9Jltw5T5UqSJ2UGlInJ1KO3wcz5QmJ/rfj5BmAfkkCxURWik5wdiTkwvBsLNaQrHYVRBY6QK7BFPYx4wMaAPVxNvFEKXgCGy/bv3h7G0DXVp4nsE4Vxi9Uhd9pOJxHFNSZr8FXX2wvhEUSrDv6WdzCVK0IV/2oPNYyPp6qE5311Y1fpRSZ/XAPX78wvvhK452ygFz3QQ1ZsugW33rC44FcmOlsxrh5gyH2jf5BCzPJ3UmPmLHvy0ZFJjajpiw0Oi2DgxJ+yazz78Ze6UkM0qifSun4nlAkvCS4R3fQkD0kuI57YXIYSfh+7ZIg0BmrqGC4XDkUrZ2/rnwHqgVfx4DOT7E/6ii7bi6KyiEICYtxXh1rfeXD3pAy032dFSutI0lahuyxW3uwFYfJD0vG+SP7XjDWGYkGDNS2JRltmHIz2gLFALkqfZtTM8tYemBfpfzcrU2U27+1RRPfY4yg0oyUiPLUhLvtVZe5sESLE7mZ0rLy3/3Lqj2y0qX15XwHhg==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(82310400026)(23010399003)(1800799024)(56012099006)(11063799006)(10067099003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: FC1VDaXRg0PC5GN8v89hZQgivw33mS32EAFarNcxvh6dtEH4gFzrMIUIgeCgXXiVnhps7/D7kkGJmSt17/EwvYuY7soN/PHLME92y9aHcfAa447VVEBak98hrvgSQilEjyl9LOc+mFhei2EbVrxpVDH2sDAlspy/naDG9w0Wgqe7bSl5LsZaNZgb85d4p6rWOMdh0phdLgwKxYgM7Hu3dcjgigqXckG5TcSUygwLwxainGMwaN7UUKIAdM9+130agy7KAmWZ3VA1/xmD26yqJYod8c+GL05wTTBjiFNO9g98hC83dB1RM/JfB1PriGNfo6DRSLcnENSlrLkb0iHi/vMVMdNRxCB5vE8e/7JGcHfu1BBmCrr5rRBZRFL5y7/5yPV4uM9MSTozzRbdbPjHhARXU6txDp8QagH8tAQqE6fJzObheDz0Gc3HwFTHGnZ2
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 07:02:55.7213
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cea4bd6-b92f-4658-2d88-08deec76401b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB999263
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_000304_623728_887093FB 
X-CRM114-Status: GOOD (  20.34  )
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
cml2ZXJzL2h3bW9uL0tjb25maWcgYi9kcml2ZXJzL2h3bW9uL0tjb25maWcKaW5kZXggYjJlNDQ1
YjU1MzZlLi5kOWZlYmEwMzZiYTQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaHdtb24vS2NvbmZpZwor
KysgYi9kcml2ZXJzL2h3bW9uL0tjb25maWcKQEAgLTIzNzAsMTIgKzIzNzAsMTUgQEAgY29uZmln
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
