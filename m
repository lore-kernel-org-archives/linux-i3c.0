Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90EE6CDB479
	for <linux-i3c@archiver.kernel.org>; Wed, 24 Jun 2026 10:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qgSenjuf5WN8eOuwJ7BXO9W2avGAKlTP0p9tL0b9jeY=; b=Ov2H7rS/pf61w6
	y5cY+5goB/yNpts8vz/70z5FpzYfl0JQ7mvVxMvsKEr4LSbn2B2QwpisrSfhpa8smjhjnQ35aU+SD
	1hwZZC8TU5rYppn/yZ7PiJL9FlGXRpxOtbpxKizsQhbfH1HiuMTYvqeSbQeZO81PCwwJ6fgeD18ux
	O3UJLwnR4W4MaH/vZhkadG0XsmG0oQ33/gfYGtWZ0X14a4K43RtleSDGNcn5f3CtbaNU8Irjz/jaX
	NcdS0u7ysFQwM3pIT17tC36EB00I08f2x9P6fDjOwNFBuUYoFmfgJfZmxtFXliwlpv6DUfrz31kU/
	fO/HvL70nHcihaRSsKjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcKl7-00000007b93-0ytO;
	Wed, 24 Jun 2026 10:23:05 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcKl4-00000007b8J-3E2g
	for linux-i3c@lists.infradead.org;
	Wed, 24 Jun 2026 10:23:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hx+7xwSOuXloqd1URXxP16OrCMfTQfoGpP5mkQtAV6NH1lcQ7JEpfUTdAnWoTx4bZ0oHlbZ852ynqbF7RS6etD9/lqMgqgv/70VZGy74z6T+wOXi8RnTpiNjfAD0kqug4k3SzhYCP2hTYyCfVZu+UGEPxql45zgAhO2DLdmjQgaeD3Zj6CQbzoFk3v0HLJVNXFay5/GTXJghjys9wlrrNoFsrLvyhuuk5veFu+xVVvGZZcPih4qECcIpDnBr92O4oqyuOO//jlXHqTBtzxxCOIhSnbxdElFK1VETstHjq2e6/TU66LcG5gllZNj0MZT/pitG3x0z2P0rFLhcC0XaMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v/KyaKmMemaOiRoXgkdocZnQ3bcJMGVDo/jcxzenh5Q=;
 b=YUSIiKjPgb1oh5BeuwRliGO4Q/sszEqvxsPT9krfdbgHwty1DgzvgioHM+Ui5t9Cg2CNJpHiSSmF6KbUfsFJbsI1M+Cy3vOc0aHhUpFOlBCAkGnlX0Xvwt3MiHPzIV/nnOCU410VRj1QSn6RHNADZTUL8JPcTch81QcDM6QEHOAENusmgIFvcD5kfF6w8DgBQuStZah89hvh43TIUnkFNGewoTRM4WBRKwdoekBwOfUkU5TBYhhT2Buhdd5yZFWFVBL0mZZWKA0F1mD2wOqyxZiEONFcdKKn8oB7x2r5aP4QKbnUWlFxTMXycF+G+t1ABgEawIe0fF5i2e4K8o0eVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v/KyaKmMemaOiRoXgkdocZnQ3bcJMGVDo/jcxzenh5Q=;
 b=Y2RJzOfxNByRiW1Uq4jEPSDce4OmOLbKHNdExaraooDF0+6sc2byzZF/4+kE4JCe0GiO3sTsXjKBGFz4BHLHZGoP+bqP7R0Py77ZOS3wp497zH8kvcBVet+06ltdFf45og1zD2A5aPUvpoLC033gOrYWIkpg3n4p0agNaBNXeDuAZ+L3ngwB1ue5tBJOrNqATSnJ53XZoJRTdTnH0FpHsjY7Awwu03Yla3Oas3AKZlI3xeRYgLjNZATZwgJOVE58QJkmyr0SfPJ24QchgQJPFcD/LJSbjsl277lCwMD6mObSgqFjrQdRWSQlwP3hjXT2WRvgLj9AGjQklYXrhkZBvw==
Received: from BL1PR13CA0404.namprd13.prod.outlook.com (2603:10b6:208:2c2::19)
 by PH0PR12MB5646.namprd12.prod.outlook.com (2603:10b6:510:143::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Wed, 24 Jun
 2026 10:22:53 +0000
Received: from BL6PEPF0001AB75.namprd02.prod.outlook.com
 (2603:10b6:208:2c2:cafe::97) by BL1PR13CA0404.outlook.office365.com
 (2603:10b6:208:2c2::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.12 via Frontend Transport; Wed,
 24 Jun 2026 10:22:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL6PEPF0001AB75.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Wed, 24 Jun 2026 10:22:52 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 24 Jun
 2026 03:22:36 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 24 Jun
 2026 03:22:35 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Wed, 24 Jun 2026 03:22:30 -0700
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
Subject: [PATCH v5 01/12] dt-bindings: i3c: Add mipi-i3c-static-method to support SETAASA
Date: Wed, 24 Jun 2026 10:20:55 +0000
Message-ID: <20260624102153.1770072-2-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260624102153.1770072-1-akhilrajeev@nvidia.com>
References: <20260624102153.1770072-1-akhilrajeev@nvidia.com>
MIME-Version: 1.0
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB75:EE_|PH0PR12MB5646:EE_
X-MS-Office365-Filtering-Correlation-Id: b0582fb9-b853-4e0e-0862-08ded1da8c82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|82310400026|1800799024|36860700016|7416014|18002099003|6133799003|22082099003|3023799007|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: DHy0FPH+3s/D4oE6Ep106PjUnh2beAUx0cExZLOcV+q057NpubH5k2eWQw+k6k8+Wj26QBS+B5ASxs9x+PiWennZOLEKQdeqD4yo3GWoFlNoXpUT4yBBIdvop8yd7qqOWTI2MmQIg7nv96PAmgj9SUwzmpbmT6cgh/DEfukBriuIyjAmSbgSxzQ4RoXVNcxpa4N0WeBmZsuQA31OrRG7mClX5WwJdPin7u1Qoj4bYCYmDNMd51UlMp6FbSPDzw2kPgFfyw40vOpLAdrF0v0VqG1m7xI7H97B0kGN3ykaer4MWAmbjhk/cdb19ezPScvWwgmFQXA89PHtCZjHWavKDr1sH9gL0lJcupM1GVk2icmQAeIQm2xhi/vELOSkvcz1aDow4slpTf8F4miRZ62bVM62HGn7jbnAg9iHBE12/p/RxwiRsYnfQzVvtCuSDh/6hyHE06pWpBSxMgf9SD2n+3Qacnch9EgClzHpB7sqKFHUKommJTER9KNhrz3m1yieV8LLjwskhKVYQcDSWQBMtNk+b/eTm93c0uLcG5Ar+k5b5dlwkCahXQsksS0z3aK9x4df6wivRQ61E4WUv7N5kuAGTZNVbaWp2eGCjHfy5I4rD227jRXjBiLGoNJpmvD2a47Js6mhyZxJit7rmcrIGpW0begNzhT46xLP5B1SqZp2nijTzRqKbIwYHBQViH/QHDFnD5qglzmnwdgCylxtvA==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(1800799024)(36860700016)(7416014)(18002099003)(6133799003)(22082099003)(3023799007)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: OSHCdeCRJop0CCtpyCtgpCTn+N1UcLO/lYHj0kHzEbOjlL6itGa4KVWprkrvJ3gRhbX4tnO93fDMWi7/2I6KkAZilvJiIR6MZx4T9bnGHBJUn+TC86eBzAeE7JOSky7k0gdCrpk2fePSk+j+zlP+S3UWQFUBlf6GiK69GXp4f4H78NySCBTRxuhu/FuIRBYIQOQoo/VVKiwIYsRXzXUK6aghk8gQV/WuF0lMmkibD+uyBOqzgKpAHfNG/4g7dvnUPgIIWRDxtdx8Z8gaNEf3DamMfI4g8BPuGgsH+/+sz84865EYzVfWdH3uissbP9rquTYh2qjnVezJPdFsL2ik/fFU1yHewZOXdsJR/qTy/K+0mOlNiIHHOOElL4ymrvBC+QuqJWZd3QErvl3CU9i2dsLhgCu84DAy4KY1mcFJ8ULls2FzFf45nvBhAreGfrB5
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 10:22:52.1661
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0582fb9-b853-4e0e-0862-08ded1da8c82
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB75.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5646
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_032302_810551_86C2FE21 
X-CRM114-Status: GOOD (  19.84  )
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

Reviewed-by: Frank Li <Frank.Li@nxp.com>
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
