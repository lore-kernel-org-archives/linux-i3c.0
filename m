Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E6EB10775F8
	for <linux-i3c@archiver.kernel.org>; Wed, 18 Mar 2026 17:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ejwm1XwcJxt9PQPM3xBMzbc+pCxlu4N9RkPFK/G7Uuw=; b=A4/XA1lxguQts4
	5mn1gfN9Tgs1uNnD12RrxE7AN4cdgrQCpltlauRjpKZT2f84dKDyq9Xgk614Bq+DLPqDBuz/0ebm9
	wJViBOyIFzSwn9xZYQ9qkIYHbkOZlH+MVBMmUg4SOw0/Vys5dvNADa3sotoRnEMrG/QA8GlVILGfv
	+5N3VPU/WHwVaPPAvDfQ38TYAlHqXcwXSTJyE1xKKqL1RvWujTZ8ANt3gBVfMesNlUkr2edVWebyQ
	2NShgieb6mf1IoqBnMThLYg08qgnt64NC/Jt+PgtgBsrjm8Jn0BYPSKiVtIJ8AxSIt0JfP6WGaY7f
	AR9cWDD4SVi3NY4v8rDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2uhy-000000094YW-3x46;
	Wed, 18 Mar 2026 17:29:26 +0000
Received: from mail-westus3azon11012018.outbound.protection.outlook.com ([40.107.209.18] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2uhx-000000094XJ-0Hlf
	for linux-i3c@lists.infradead.org;
	Wed, 18 Mar 2026 17:29:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gqo7q32uFo1I1vfqjOHOyI40DDv8qrYfc2xlg0By8oKCS5uD0gIlfj0JHkZ4xtBlq/2XtvgBRt77LrWeoTlUjOXKDFYYVAbciZgIyDZq4r0EKIVOjlonmcYmsCXdctW/q4IWG8CaeeD1y000zhWgbt+Jx2z+5DjCQNtqcRt6Y3n3oROStAtRY/LezfbGhwOfnKpORTvIya/MdhI/Wuu5W05p1hH9qBExLefWxKwRC4NvYVAqdlFXa4HeT4fOWoQjGBYjnEWZSXn0nIXuThrAoTBEwS4iJnVAOWUnrCHXuQ13rREER8he0bVpXmDaqgfIkyBpoh4u3+5YemlMlcOziw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aj3rE6lTPfYqVEzCxc02Sq+DuX9wrU9o3UIGBqSEbow=;
 b=YIq+IjLhe99phjD/AvO6xu6RQwRI7kuMbAqUJVnLSHNeJlQHt/C8vvd/v87IQT4fC1A2BuIPvL8V6G3hfvWQaYccdcyI4HX1wzqmwfGcOCF4sUczOQ2P4n50Pv4L6r63Gs3W0CQ7Os04kQtnj6PpP58MelvY8hEF/LCgoPDFtCBjC5t3s5iOnthqGphm+3xBFc6KJu0w2UJfeE630Bofmo0I9KZZ836EXHbU2M28USqiQqKp8irazBWo0R7kquxDWX+DZ7/34doKyEG3ahmr13JK1D+YjoDKRDTg+Ld/H0YmR8dnsscUjjVPyXKI+h64NK7XtiYS25aFfw7ujoOswA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aj3rE6lTPfYqVEzCxc02Sq+DuX9wrU9o3UIGBqSEbow=;
 b=hOk999eHqtsjVU7rCGpXcITGCxNQMRfiBB53F5mFc3UoCGFFzqnQFW3KHN2QuJQTbx9pKAt6YyCUGzFIlqBKzbL3a7djuiy3tl0jj/bBiQB2Tb8KUAE0leqRHmt6l6SarJuQzFVE4rj486Gsd6+jFPfAQNYuyjaMshe2lfEvFA/sRPO9e/4kxfHcMoErCucoIApoAztzAbAd2wL7eTFkh0phfixc99OzMgd7Oe1ks2SnSkRIAVinG5LvExufPnzI16iOB9w5GIEVx6mcTYIjmMSpZpTV6qNNmvA0QGds/kixAZr5rpgjpNNA4EvKNtlo6hPvUJ7BQnN8f2jGt/FUEw==
Received: from MW4P221CA0015.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::20)
 by IA1PR12MB6481.namprd12.prod.outlook.com (2603:10b6:208:3aa::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 17:29:14 +0000
Received: from CO1PEPF00012E81.namprd03.prod.outlook.com
 (2603:10b6:303:8b:cafe::5e) by MW4P221CA0015.outlook.office365.com
 (2603:10b6:303:8b::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Wed,
 18 Mar 2026 17:28:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF00012E81.mail.protection.outlook.com (10.167.249.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Wed, 18 Mar 2026 17:29:13 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 10:28:54 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 10:28:53 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Mar 2026 10:28:47 -0700
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
Subject: [PATCH 01/12] dt-bindings: i3c: Add mipi-i3c-static-method to support SETAASA
Date: Wed, 18 Mar 2026 22:57:14 +0530
Message-ID: <20260318172820.13771-2-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260318172820.13771-1-akhilrajeev@nvidia.com>
References: <20260318172820.13771-1-akhilrajeev@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E81:EE_|IA1PR12MB6481:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b492d84-282a-4464-f116-08de8513df9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|36860700016|921020|13003099007|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: oStjSGASoXxCvUdbpxobU3Zc4pKjmeJf/IYTNbHUoFlxhaTQ9R7Oye5Kuwje/Lpu0htaiFiPsi4QKcoIK6MXvw7Hw89yWdff9M1kaxVkk7J+NDRdPkLRUWZVQwkZFkcsJ9zizK+U/37wfMW23IkRMwjSOCNk9fLVfZBIteGvGktX9jqwYvmhEjOMfoDwnY+9rokKyCoLV4FRFYmP0iKv0O0zek+0eyTLpUyZEsL7XQBqiUy0hMvb2aNU6POrFXCuXY8OtOyDg6LHQgoZttQxyAJWNGxGlK2QtTr1mdNMfbBBMOpud90TWz4hR36CHlPtDZTNH5ttUUE068bmp+B2hkp+BEYOkyPeD2L7pT7fAtZSJnFx3i50plAmvZqggETdNx46LencvT0Sae8H+5OKp8h7434i9K0PtRQQfySnPc887O1o2zb9V3uhsPZm1WVAyz+LZUyE03wmKDvyh5j1UoMKN0nLJMX+nzCvV5xE62KZZMPuKYOGPTWi7AiJiNZOOMDxc4YJi6wLEvXO5PD9kFttzdGejcWZuE/wBZCWjQFnjsfZMXmCLC1kWgb37AsVgA21y9nHZ5XIhHrZTFf0OTOCe7IzUUBTlGWjcPG1wnntRu4Ku9sGainGy9cyg09+pnJmgPaakbraUtWb3wmvYWo7hn4/jC7BBRFPX7xk/qeZugMQNI0hBCaDBV4lO5tYqjap+UNKBR4KVdaVcLMBjlLNOo3ROlAvD4tZ8sXuTvm7wvgKh/+Vga2M91IBLKG+pVmyDLOkFLfHTiU0/OSgTBvwGX+umzAZ6EX/kGlCBUnBbyHYn0oeCh9u3phQ93us
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700016)(921020)(13003099007)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 37onCCe07+QTOEemp82bm4Ux1kYbyjU2RMf4fpIFs4I5Q0S0P7vW6m8CLO4T95eHJrYWsxU1N0A5mTwFAvVt+TDmlL8cESOyg4hDjJqPDspMnZPuC4hdJKPSuwj4JhYS1OZ7PzD1lm2tvKz2ADqJVETuwioiUQjTNE/Ci56RQz9Cd+he2aPLPfK8dZpdz0DlqUVhmMeRni83Yi+6kng7noDaT7jFpFeX8B/e6SSnhvG8AB3bR1kFE7PBgrAS/SuTl5J6HhzPMnmBHKom3wu3mX8LuQg1FKXKsLbqp13EdBKF3UmdDEHxAWVV8lYc1tkGIG746BnzbSB9RH6V1PKX5K+HQiFKAVn/+l8hOPEuBjF6zzsFlRB/CqhnODSCk6tIfnBFkDZHGKPUnjNkrbnWKoULVY6ItoZbNqxDZ51jSXcApJ3tJCyDMJuVGY9upeeB
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 17:29:13.4901
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b492d84-282a-4464-f116-08de8513df9f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E81.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6481
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_102925_109584_A51C5409 
X-CRM114-Status: GOOD (  17.39  )
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
is absent - which means for now the property just serves as a flag to
enable SETAASA, but keep the property as a bitmap to align with the
specifications.

[1] https://www.mipi.org/specifications/disco

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 .../devicetree/bindings/i3c/i3c.yaml          | 30 ++++++++++++++++---
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/i3c/i3c.yaml b/Documentation/devicetree/bindings/i3c/i3c.yaml
index e25fa72fd785..1705d90d4d79 100644
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
@@ -147,6 +149,26 @@ patternProperties:
           through SETDASA. If static address is not present, this address is assigned
           through SETNEWDA after assigning a temporary address via ENTDAA.
 
+      mipi-i3c-static-method:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0x1
+        maximum: 0xff
+        default: 1
+        description: |
+          Bitmap describing which methods of Dynamic Address Assignment from a
+          static address are supported by this I3C Target. A bit value of 1
+          indicates support for that method, and 0 indicates lack of support.
+          Bit 0: SETDASA CCC (Direct)
+          Bit 1: SETAASA CCC (Broadcast)
+          Bit 2: Other CCC (vendor / standards extension)
+          All other bits are reserved.
+
+          This property follows the MIPI I3C specification. The primary use
+          of this property is to indicate support for SETAASA, i.e Bit 1, but
+          will allow all values so that it is aligned with the specifications.
+          SETDASA will remain as the default method even if this property is
+          not present.
+
     required:
       - reg
 
-- 
2.50.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
