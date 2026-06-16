Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA8ECD98DA
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Jun 2026 09:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c1I9IoAzehh6Lr+XD9jdA+CH41UDh3GuSMiTT8wMaWo=; b=NoavNJt2GJeKgX
	VnM3bk8ilialgg94YxMFhso3W34qVRlnU3yWJNCIvuvMyLjLL7DWoX9cGlYIJDbQatv35U8xfkKQq
	LWRcb8VmjIS8F6x2HPl294dD67W2hfiXpGcKOxdHLLV+h8Jmtl7RbAghF3/cbG0d/hc57oHgUyMSq
	8uE20O1AxayIJkx8k3bpdwOyhS7vfWcgwtxKWkuScyY/mv3Jrb28Jbmuf0Og/PraBgfs1N8rIESC5
	xsdAgcY9KG7R6c/Ygsh72V3erlkX/fMCkTNOg7q1e4RKXe0f6efSpwAx+V5MN2RgXRTKYJdBQAKo/
	tx11Zln7BUm8ox+SEwBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZQW4-0000000FY2O-2lJJ;
	Tue, 16 Jun 2026 09:55:32 +0000
Received: from mail-westus2azon11010061.outbound.protection.outlook.com ([52.101.46.61] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZQW1-0000000FY1b-22Rj
	for linux-i3c@lists.infradead.org;
	Tue, 16 Jun 2026 09:55:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I/boRAOjh1wvlzQK1HjllOOElqN/TtFCaMNoxyXuHho9pW+UZPmJHx0WMgp+f0ZfeMNNeGIrfMJxE68ze+6EJd/Dk/yuJiOYmL5tp48L61GJoSOPF8WeVglfK2Q+DNaxcYg5qPMqH9KZRpuBs6B1VfiwIucBqPCOYkUww8k+eIGWU88DYlF1ZfS+I7HanBzBeszWfVwzFv2kF1FwFUlKxdftSIsgpkyEqS4q5fPaX5PmFUzvkC3OZGkdLvcdCnkUhG1EFPItx5VMJG5Sy5ylIxtlorxYtKLXNT0+gMJtUruSFiaOZb7/Lc1jq/U86xNWS4nZE91Rl3jVeMF8aYa/Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+1D5A7tMlkEvNWaMHCIBXcY8X1uQ/9JrzFBEbeeZDcw=;
 b=LLUjZSmEy+55CaxoxDUoE6fViTl6bp40JtNNPJkW1LotOkl0zMzhSCg+V8LzRhUOs2j2Fdlu7eVuBwhYr/wk/SZE6RopVbcmZkgY8WNlB8PsV/Gl+4bJTgTMPepDAbE5ujkD9UB0F/hwo4rani/waRRBqsBJSFU6xb9iAKoM74ggwazEPi2g8rzQCqMav0FiJgxEc8cjxtKq8V36Uj1rvR0WVJjtQNA0QcXRjg47LYUuYBU1G9ycH/rnUbhEaV17tHjzuuPbWbWFX3BWbp5i43qiOIIiZf69GvLVUCFB9QpcQ+qybFNDfgXvUwZnD9iWR9H+2AICMaeVWJqFffh4Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+1D5A7tMlkEvNWaMHCIBXcY8X1uQ/9JrzFBEbeeZDcw=;
 b=DWy72oQoGne0+9kCOM7uMotqaVGpfMLBv4S5QrKICgABOzPtgON32AHhDiaBl5sDt+xwSYF1UHYHM5/GGK0lqtKyznzXNj6w3CF37xolVgKdHtvsVXZhzWEfEuTuxSHwos+d8SIEncjhLb4uZANJG72iiriLuJxO55dlIoqILU93Q4yBDRoLSo0CCPhmS475N3mTENcMhc8/EhDgH73HlR2T4zWx6QvB2ARHJlvyNbO3klqUtOrGwa5l9yuKOZyN3T/Cp6nSKwl1vzhC3hyYAxn6Buarufq36yK5AGuhufjWwnI+qSMBP5SlihwqxyMIjvRn+HEU4IRDV/smsVqEWQ==
Received: from SA1P222CA0129.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c2::9)
 by DS0PR12MB7560.namprd12.prod.outlook.com (2603:10b6:8:133::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 09:55:21 +0000
Received: from SN1PEPF0002636A.namprd02.prod.outlook.com
 (2603:10b6:806:3c2:cafe::a6) by SA1P222CA0129.outlook.office365.com
 (2603:10b6:806:3c2::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Tue,
 16 Jun 2026 09:55:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SN1PEPF0002636A.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Tue, 16 Jun 2026 09:55:21 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 16 Jun
 2026 02:55:14 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 16 Jun 2026 02:55:14 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Tue, 16 Jun 2026 02:55:10 -0700
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
Subject: [PATCH v4 01/12] dt-bindings: i3c: Add mipi-i3c-static-method to support SETAASA
Date: Tue, 16 Jun 2026 09:54:15 +0000
Message-ID: <20260616095429.3947205-2-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616095429.3947205-1-akhilrajeev@nvidia.com>
References: <20260616095429.3947205-1-akhilrajeev@nvidia.com>
MIME-Version: 1.0
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636A:EE_|DS0PR12MB7560:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e29c2a0-ec4f-4752-9821-08decb8d6158
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|23010399003|7416014|376014|82310400026|18002099003|56012099006|11063799006|3023799007|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: bL2etLgqzvbIjG9aXtXuhADIO0wQLlgC5a/ypXj+dTKgUaAFcP6t0mGF+sWEiIbaQkJYowI8CzOyqE9QSGZ7d4OJzz1dUFKrYI0Q9/LVymXWqF8mWctFfIaAdpjUBhyQMQU92i+iW1Aise8eP3QMkw2iWiIBO5z3u/DNT6PzQkvGIt2Z90zeT7S4nkpdLSmhccIHG+wK8uz1Bkwxas2rvvobX1mCHG9dz6fmrmpIvbACrhlS9DCc/9t7ENdRVw6jwIpD2xGB0izoULD6c3R4ks+QhlVzPfd9sMJ0jpVRMyzgQgdayLCvHRNi7+nEqonWbaXhkYfc3z96nL8cR77Xf5d648huD4a4M179p1ul8seBusjNzPpXtM86cIASUMMtX7uvlQfIS3bvgxDUGPfA7vRZyfueuFnt2VXyb2gPscilW/1ICF4UeVBXG9hkkcc6wGJjNFHs/6+V+p4Nf/O76LlmJY0M1YNFE7Kyltza9dN7z3gWsXk8hcJZLuYlv15LpS0CeFEX/dvYuRbG0hC8zPdANeit8T3jrUJfat/TeJ9GEaYvzElJlUNgNk6ks6NRTnjRFxS3YlB9ojmfUfXK7UjV2n6Y9cSfYmIK3DbyWblv21m5I+9YLMfdPbrGAeB3xrav3IZHiNxDhMveiRL5C++a9nYWrR9By+B1tbyphpI53ZnWSTJmBE7LJI+FjhQUG09yiEqcsH0UX712xr54V5j0SHaGQNRT4AJrBFAiMfI=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(23010399003)(7416014)(376014)(82310400026)(18002099003)(56012099006)(11063799006)(3023799007)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: L7PmTW6hfkcGdHYyRrzMQWqRnVsAZjIG0incbfNJpiE5Anj0t/3hfdcZcaFFWzHJ26uglvBrrvGLzJKr4gWj/GhDIvK9yXuW6oi0utNM/qsX3HkwdZBa4ztjgZNL4FeVAKFh2C+JMyxk9AskqIT4oPjMc1Mmhr+n90yDGTdoYdONhOQI6LvqT3usc/Dvf5181T0jtWbB9spU62M1XliVlOkOR73zwxFq9F1yZ5Dd6srxF871mKcteCEqtp7A38jpTUmLmL8OPDYFqm6RGDTWYhbB6wE/PEqiZ+Z6RDArTsQhIOfeTl7OvUW5F1KGOlwSW3/6anBAahcnZJdredZFznCzAhp30Nqpx6QCEy0xBecz+v3hsycFLqakcgrT/RA3br8mAX8dCCn11M4AcbDx3zj6xIO8JUmNG0N00jc/0nfELGRFZB5ijamtECdPWDBB
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 09:55:21.5839
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e29c2a0-ec4f-4752-9821-08decb8d6158
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7560
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_025529_551968_B3EA15E0 
X-CRM114-Status: GOOD (  19.28  )
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

Add the 'mipi-i3c-static-method' property mentioned in the MIPI I3C
Discovery and Configuration Specification [1] to specify which discovery
method an I3C device supports during bus initialization. The property is
a bitmap, where a bit value of 1 indicates support for that method, and 0
indicates lack of support.

Bit 0: SETDASA CCC (Direct)
Bit 1: SETAASA CCC (Broadcast)
Bit 2: Other CCC (vendor / standards extension)
All other bits are reserved.

It is specifically needed when an I3C device requires SETAASA for the
address assignment. SETDASA will be supported by default if this property
is absent, which means for now the property just serves as a flag to
enable SETAASA, but keep the property as a bitmap to align with the
specifications.

[1] https://www.mipi.org/mipi-disco-for-i3c-download

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 .../devicetree/bindings/i3c/i3c.yaml          | 36 ++++++++++++++++---
 include/dt-bindings/i3c/i3c.h                 |  4 +++
 2 files changed, 35 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/i3c/i3c.yaml b/Documentation/devicetree/bindings/i3c/i3c.yaml
index e25fa72fd785..5603f2e7807d 100644
--- a/Documentation/devicetree/bindings/i3c/i3c.yaml
+++ b/Documentation/devicetree/bindings/i3c/i3c.yaml
@@ -31,10 +31,12 @@ properties:
       described in the device tree, which in turn means we have to describe
       I3C devices.
 
-      Another use case for describing an I3C device in the device tree is when
-      this I3C device has a static I2C address and we want to assign it a
-      specific I3C dynamic address before the DAA takes place (so that other
-      devices on the bus can't take this dynamic address).
+      Other use-cases for describing an I3C device in the device tree are:
+      - When the I3C device has a static I2C address and we want to assign
+        it a specific I3C dynamic address before the DAA takes place (so
+        that other devices on the bus can't take this dynamic address).
+      - When the I3C device requires SETAASA for its discovery and uses a
+        pre-defined static address.
 
   "#size-cells":
     const: 0
@@ -145,7 +147,31 @@ patternProperties:
           Dynamic address to be assigned to this device. In case static address is
           present (first cell of the reg property != 0), this address is assigned
           through SETDASA. If static address is not present, this address is assigned
-          through SETNEWDA after assigning a temporary address via ENTDAA.
+          through SETNEWDA after assigning a temporary address via ENTDAA. If
+          SETAASA is used, this property is not used, and the static address itself
+          becomes the dynamic address.
+
+      mipi-i3c-static-method:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0x1
+        maximum: 0x7
+        default: 1
+        description: |
+          Bitmap describing which methods of Dynamic Address Assignment from a
+          static address are supported by this I3C Target. For each defined bit
+          position, a set bit indicates support for that method and a cleared
+          bit indicates lack of support.
+
+            Bit 0: SETDASA CCC (Direct)
+            Bit 1: SETAASA CCC (Broadcast)
+            Bit 2: Other CCC (vendor / standards extension)
+            All other bits are reserved.
+
+          This property follows the MIPI I3C specification. The primary use
+          of this property is to indicate support for SETAASA, i.e Bit 1, but
+          will allow other values mentioned in the specification so that it
+          mirrors the specification. SETDASA will remain as the default method
+          even if this property is not present.
 
     required:
       - reg
diff --git a/include/dt-bindings/i3c/i3c.h b/include/dt-bindings/i3c/i3c.h
index 373439218bba..78b8c634aad8 100644
--- a/include/dt-bindings/i3c/i3c.h
+++ b/include/dt-bindings/i3c/i3c.h
@@ -13,4 +13,8 @@
 #define I2C_NO_FILTER_HIGH_FREQUENCY    (1 << 5)
 #define I2C_NO_FILTER_LOW_FREQUENCY     (2 << 5)
 
+#define I3C_ADDR_METHOD_SETDASA     (1 << 0)
+#define I3C_ADDR_METHOD_SETAASA     (1 << 1)
+#define I3C_ADDR_METHOD_VENDOR      (1 << 2)
+
 #endif
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
