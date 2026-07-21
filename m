Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69D06C44529
	for <linux-i3c@archiver.kernel.org>; Tue, 21 Jul 2026 04:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T9Vsdgz+D+hyB3KEPULJRu97oVoicV7CUEAOhiKOWcg=; b=yioOFbESxq19oB
	epDm0eY+t9dLKMY8LpsKa1lZJKdwObPdR602+E8SjCmTIZEu2YgMjyyYdDzQcHA9vN/bvLPhNNbbG
	KmQVZOE21zse7f6wxug+BvV9naPbjAt1458Az2e4ZKi8iyvDJlIIcXfhvvngypRnVENSVZ7Ip6Vm0
	tKN/72YKfhH8dCMccER9shKJ8OXMUlzLz9zIpN+3QuBYI/M4IeuxbLMzjrAP/FHTivwy8kh/7xZcj
	C9d+Y7Q3PTmoINyy3a4Ufg3eNghIhkeMxZnSEogUkn21T0QL7NyQ5uwO7N1AtTUvhFkWxXeK8Uv0V
	fEa6V9mgnfis9Vgsn6vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm1of-00000008MYy-0LaB;
	Tue, 21 Jul 2026 04:10:49 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm1oc-00000008MXE-2ewJ
	for linux-i3c@lists.infradead.org;
	Tue, 21 Jul 2026 04:10:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EpzprrIcrSplbpd/rONGGY/kJIQsDlEcNbpCN1/5CcSi1OK0QLRFBzxIpgfx4qrP2zc+O4ATYvxgf01W7UI62+5BsyAF7mfuDJIUmk1dFwZItE0K7wIQNdQeg1v2+rzPFyab1pbSH7daLpuL5QyAEUd+ykOF1kQ0UK4sJF/hKbg8TD7ZTE/aoTCixp+GZBW253REIGyzlvVpSMp6pp1R+GOnS1lVHD1mNXakIv3m2Gt8kSFi74F3SDXBxpkGxA6EyjTq5k6t2MHjSoK8loKQauxNeGNKb+xrdB5w6pvBWLqeGCoAG/JNLZsnTRfspPvWtG2X+tYz/yt+3TdRaT5mSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hI+9mD6ce5H56r8WezXH6f5ENrHyw6qsoIIswBxLKAk=;
 b=Be7XZv5UE+mX9VUVkaP0kPGqXsvcncYuuoBysuek//YcLyeB0+YLRyzAqdx/cQOlE52LrHqYrQkJvb8wfuq+YmGgBisjpRORlHM+gXNqLe9JLcsX1A6IKDyI78MqYYqgOv+9Gq2iKjZgOT/BLYH7pwiArV0rJIxDGrGVIxpm3oxXBReWE+F+Xh1zRzDz9sRptOOfaD3M4f856WEtGVTtoZsQRd0FBGsWxd8n5FQ8RW5VOF9W5/a2OmOlKQO5MlwUex2jf07xZrD2P21EsDxLc/Y0V48iEE2a+bBEWeOnCdTf3IFgUbU14qSuSezrtaDIKw27WDYnn6CUx0bL0uuqNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hI+9mD6ce5H56r8WezXH6f5ENrHyw6qsoIIswBxLKAk=;
 b=RKtaVWfjsVB6kvkG1cyE9ZA87LMglN4H+ccYBHCJzGxdT8js4Y0PYcEqW0e3vpm9odg9/PdA6rpmwVRBX9ZdZmz8+NvOnT6YRHlPAVc/TgOOO9LmOe9JPc8rYH9scw9J3pPM6hwycsMWqpv9GpVg0pFjKU6l7p+D2O295x7D4eQPeYct/rJtpnHYQl2AjgwiaUZbiPLWd9SbGstHs1n2BoY6O005cOixdKKztmTRk/ANCE9NTBo7wGvLTdujDQRW7cEtCS7mHdKTe7q0Esw2ru0ab2CHqdx3uax6dPUsTuoMeXeiVMn73jnMwAeoMMWaJAF0ilxpu4S8Y2M6aruEhQ==
Received: from CH0PR03CA0117.namprd03.prod.outlook.com (2603:10b6:610:cd::32)
 by IA5PR12MB999277.namprd12.prod.outlook.com (2603:10b6:208:608::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 04:10:41 +0000
Received: from CH3PEPF00000009.namprd04.prod.outlook.com
 (2603:10b6:610:cd:cafe::ab) by CH0PR03CA0117.outlook.office365.com
 (2603:10b6:610:cd::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Tue,
 21 Jul 2026 04:10:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH3PEPF00000009.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Tue, 21 Jul 2026 04:10:40 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 20 Jul
 2026 21:10:25 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 20 Jul
 2026 21:10:24 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Mon, 20 Jul 2026 21:10:20 -0700
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
Subject: [PATCH v6 11/12] hwmon: spd5118: Add I3C support
Date: Tue, 21 Jul 2026 04:07:59 +0000
Message-ID: <20260721040805.1696503-12-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721040805.1696503-1-akhilrajeev@nvidia.com>
References: <20260721040805.1696503-1-akhilrajeev@nvidia.com>
MIME-Version: 1.0
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000009:EE_|IA5PR12MB999277:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e8667e0-b08a-491f-89ea-08dee6de06ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|36860700016|82310400026|1800799024|10067099003|56012099006|11063799006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: K2lWWSGSsXsFQ+yGsFx7fQes7oXg67u9GXDGKgNs6vyPksDAjJ1Jgei+ou9CkjinhJDmgHOA+KHS7NWcWvgN1ERXx/JAIvHBwt3AmF4bLyLE7STrDl3p7VMS/9FY8x6l44+EieVlyc35c/fhtuHrx4WXul0QXqYGwzVCU0tMDMtHE0C64rsQad2E2+nBgggtcGYOjfF2YQSKAMtjhY7dTjURdeOZuw1zNuonmRRKwwRWKukhz3xT76lty//ddjEffMs6XUb+D6VlbRZBiMiDFPw3RY/BawpttVIV3s5WNTSxYiBsbAUU34WPGObw6WoDB0dgdwCul+h6R+/ImRCRBmJmpgKD2AUSyJriFq8w/dWceJYnRG5xSWw4W12qT20O5iHXvxyZ5ZUOtQTFmEw38QdKp9+5U1Sx1PJzmcBHYNtHOT3JJ+2AOFm93UPC18cI6Wk9dRyRo0pdbepWr56J8QsSR8aj+8x2Q2PfW0Eev8bEwki92gwy/uHln6Ci7ssVpxHic+eyKFeE//8559d8ONCDnegzAlfKOkrBu8xGb4sPf/UIxSwIodp/DZLMU1TnGBgh++XC6ziOxfWwjV+dhoWhqY0Cq7YBz6M9aTbbVomf/l9852sex2Wb+24Bk3R9f3X1pHzXpjyMDESPSx1l3JscBQt+WnmA0mKSfGS9uip17bgOYpwFtW4u7P0SxR+7yHimZQN3TcjOJBpypc5lCQ==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(36860700016)(82310400026)(1800799024)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: WI8DwkUkid8OFMeD9wlECyqqezAHX37Z/UHuEebPElgpHcul7aQqgJui9ojw3RbJYt+qOmClo46FJ1ypfoqKdC6PwHnMzKiU87zAmmvNbGMD2C7FSjPHOnRv9508rot6CTcze9W65D5hyJEkTMxvVNlh2eV2WxZn0/3WBQVojcfheRpzGrcpgS5T25U+FZpnBtZsfXxiBF6nZNgtXcz1Yo3DZeWurizFLNRby1ND+TNACzIh85aZqZSm6ofXwVKhS4FOndL+Bx8uuk90YrxJ1EW6d4VPhXebbQ+DHshGNpyC2BSBhc5UxXNl9JO69TeWaS58Bf7MiSVEk9jW5L5GPRlMNt4KhBGFaE6FFRSxg7ulF4ummSR3+FfxZoKyY5S7kPBgGxk+xI4fCk7YooJnneGcQUKbMPpIZWsQAO6llgLBpwzx8BmV+jVAGk3lRWk3
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 04:10:40.2736
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e8667e0-b08a-491f-89ea-08dee6de06ca
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000009.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA5PR12MB999277
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_211046_680032_B963C5C2 
X-CRM114-Status: GOOD (  20.77  )
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
