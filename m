Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5256C5DF94
	for <linux-i3c@archiver.kernel.org>; Mon, 24 Aug 2026 04:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uq/0Axi7evQrVpxEk+y/EokMeww2LMKRxdwZxYwaVZQ=; b=ydZ4pu+fqBoVXM
	RXPZz9ZbgmW7O81iDzEbGTv9NNVulJew9b6AdjvNX/gUTd7G4UP8luPN9Li6UjgLLKvAo5ys5+SGM
	ZytRQv77ITbzEFndcKDtNmZzQRIUFwIv0bae08Mx7CWQNk2faoxzkH+68I8QsT6EsnHEN/PmDqc0l
	4MSJ9J6fclh/+q95uWmiRFMuGIKjzz2kUe5WQZQDGEhFqgU8H7nFSr9sx6VnoyhImcqw/uU/Y84Es
	pVDz5SZ7dvlel6bGwtK/4nBZRI+f2CHZ++XepIplB/H2Zp5gBlBxAuA3LXHpDHnTW3g+nwNEl2LSr
	+KRCQaQ5o1gvd+AFH1QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyMcH-0000000Fv2E-472N;
	Mon, 24 Aug 2026 04:49:02 +0000
Received: from mail-westcentralusazon11013037.outbound.protection.outlook.com ([40.93.201.37] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyMcF-0000000Fv1S-35il
	for linux-i3c@lists.infradead.org;
	Mon, 24 Aug 2026 04:49:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oCXAIh5eWm35yM7XLTqwKP4awQXssDaf0vIfZyKgmoZfq1eYFyqDkTAaAaZOJ2HiACbFFo93Ui7e/WnOqQEK/Enb/jqGCEEaB3z1BbywZIvqUZBJsmsAWcl4zciN6C3trspEXzrj6b+frMHwujjpjfKaE1dTl81IWkJi6IWBHbRYzUPnZ5wUEIFnbZePqYpNGcPFJBWrAwKi1LuNUPGRu+QTloYKLOYCyOqr0hx19WECY/iv9zO5m3VRlxt/SUZS0wtwpKeM/F2P7eNHenktmhl3cKk0Ko112LHfGisQwbTJL2DMU5Vzo3yXL315EEbldbHyRc6jK2n9w/heexAHzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zt4bPIqagZta8EO/IONTIbq/A/mJePsms7ZAlogelN0=;
 b=JbwRrn9liYdt3qRFx3xTuhfqv0jHUajJcehqTRQzfGvu/SZmoJol7ppkW6eSbe/Qul16srIbJ+buE5/PABk/1auaVHX9avQ0gJOVcPlY+p3y0o5a5kvlVjtyJ0OD4d/X6BSLZQiMugy0qSc6wcRMJzHRfzN2LNmzhqNg5uzfrXoX5mrXq7SdIwPXWJi+XoCWH31tu/jWmveCCLuJwhwkNsZ//2NaVJ6rTRkc8/ofxkeFQ90gVUvoEGmWZkYTQPQ3Qo+7VUF8rwZXxWkWgQ+V3am8E/YSgN2StqXPgknqiRyG6p/RCKBWCrcOT1vflMOjkEaqcMem2KusX8FMYSrQNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zt4bPIqagZta8EO/IONTIbq/A/mJePsms7ZAlogelN0=;
 b=JBKR5dXVjVxPHuvoHELlOiC8jypYK+wqmXL7BgvCRc0fzYzwfxOLxk33J9P6fTyc/kSzD8LlrBVlo2xPguK2ICHUysODUPN8YHRXLYaoVo+Ye8IN4UAM8TRDCnESOpDvUM3AQAyZGO0qXkvVX9X/nsfMMmli8nhGgl55ZML/ULc=
Received: from BN0PR02CA0023.namprd02.prod.outlook.com (2603:10b6:408:e4::28)
 by PH7PR12MB5926.namprd12.prod.outlook.com (2603:10b6:510:1d9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 04:48:50 +0000
Received: from BN1PEPF00004689.namprd05.prod.outlook.com
 (2603:10b6:408:e4:cafe::65) by BN0PR02CA0023.outlook.office365.com
 (2603:10b6:408:e4::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.12 via Frontend Transport; Mon,
 24 Aug 2026 04:48:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00004689.mail.protection.outlook.com (10.167.243.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Mon, 24 Aug 2026 04:48:49 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 23 Aug
 2026 23:48:47 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Sun, 23 Aug 2026 23:48:44 -0500
From: Shubham Patil <shubhamsanjay.patil@amd.com>
To: <alexandre.belloni@bootlin.com>, <Frank.Li@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, Shubham Patil
	<shubhamsanjay.patil@amd.com>
Subject: [PATCH v2 1/3] dt-bindings: i3c: xlnx: Add IBI and hot-join capability properties
Date: Mon, 24 Aug 2026 10:18:33 +0530
Message-ID: <20260824044835.2924141-2-shubhamsanjay.patil@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260824044835.2924141-1-shubhamsanjay.patil@amd.com>
References: <20260824044835.2924141-1-shubhamsanjay.patil@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004689:EE_|PH7PR12MB5926:EE_
X-MS-Office365-Filtering-Correlation-Id: e2a462ff-4579-42c3-d735-08df019afd0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|10067099003|22082099003|18002099003|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: KvMtl+jD5IBNHXcGADyz8SpqjFcOG9hg7Tvfw1IP4Vg4JY/e8DUH80rrxk733jmC+UT8x1rrZI3Na01nFHutUu6kwT42jbNHcOLXNl5OPOHfi4Vlsr/JYDqXwwY0h/bTl6+/xypITs/YPXOR9V462G6uj1H0p7cyKvPBiRASnsFAw3P7vg6w9dhuvuKcYP0JcKuMuLY5KHSiGduCVCFFr2Acap8KH4Ed+G4LEW6qkV68K+MZ7imB38NuBJdpKNZHplXkr8l4fgzmS6XLVwAQHxYRIAk7x+X6FQQXf3NKbhXenoj+0Oy6LuIEsaeuD/BmIj1E30DWJYnEwUxPD0rJIuJq8iwh1MOIwZcElXfHUEXeZAGfSI2gYKqpgCc8Mn8+POPMQZEYXC7i6hLFFypxVRgS77fKTvFp92vmZx9CQGuY68WZA2pndp3b0SvLFNGZXOTyMzkh+O2iC7t35FqHfYzT60rWGxFoKoKcEKQI053YjqkDhI5l4aKxKGq8jpYHltHdJmHPl6Y5kzecd5xTflKB+QpQc/XfkEeujUcSME2JDfUFiGSj10EWaK40df58LKvQi7Hc4uGPG0HLOMpL+e7fV4/rF+eU18MLgCBAwRmWdVu2hJYNdN/KLwd/gKVH7LnKMNKiptbWQMMiGvyfmvcuUGZuuygkQlf6onjAbR6E1pnhsQwuvinSwET1TSxOiFMX8e7l2ojwd/RPv6x5ew==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(10067099003)(22082099003)(18002099003)(5023799004)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 10LvArisaHwwadV2vI7t7I5R6lSawxQpw79xyDf/VTsKUmbH/hu4UJYfkmhHbt0rEsI1jUHaLxi0otmjH60vmPVQmlyi7AfuY6KJhdk6cQwKye+Kc4g9D2ZLPldzjbpKEg+a3bCKr3pcD0l+nEr17A2cyw/A2unrmlLVCIxyicOZCQtXtiHpmNk2rNvYq4ahZT6LfpECc7hLbuG9T0N4iYOVpJ+e2ETAb9xO5rkKhe80IoPEkRpuD7jWzpY7TAm3aLkB7ws4nyHFI3y1Xj4Tf7XtwHUMzXm+1VyVQQwU6PNbjTNyo44+FFVQ9T0sm+wUiijB+54OzP9/nXsDTpjFYlDk+FGO0PZV8V+GyB3IG5zcNd/M8ApCossHmnveXyrN8vvncYTbx2jximT+ibwk/rTNZhalvSdvQOkrOeNRbWQR8Ds53JXtA3MRQUiVatXz
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 04:48:49.1473
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2a462ff-4579-42c3-d735-08df019afd0b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004689.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5926
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_214859_803100_C23D8B55 
X-CRM114-Status: GOOD (  11.51  )
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

In-Band Interrupt and Hot-Join are synthesis-time options of the AXI I3C
IP. Describe them with two boolean properties.

A Hot-Join request is acknowledged by the IBI machinery, so a hot-join
capable design is always IBI capable as well. Both events are reported
through the controller interrupt, which is therefore required whenever
the capability is present.

Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
---
Changes in V2:
- Rename the properties to "xlnx,in-band-interrupt-capable" and
  "xlnx,hot-join-capable", and expand their descriptions.
- Express the interrupt requirement with dependencies: instead of an
  allOf/if-then clause.
---
 .../bindings/i3c/xlnx,axi-i3c-1.0.yaml        | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml b/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
index 2caa245a8656..a04becc07374 100644
--- a/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
+++ b/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
@@ -32,11 +32,33 @@ properties:
   interrupts:
     maxItems: 1
 
+  xlnx,in-band-interrupt-capable:
+    type: boolean
+    description:
+      The IP is synthesized with In-Band Interrupt support. An In-Band
+      Interrupt lets a target signal the controller over the SDA and SCL
+      pair instead of a dedicated side-band interrupt line, by driving its
+      own dynamic address during bus arbitration. Such requests are
+      reported through the controller interrupt.
+
+  xlnx,hot-join-capable:
+    type: boolean
+    description:
+      The IP is synthesized with Hot-Join support. Hot-Join lets a target
+      attached or powered up after the bus is already running announce
+      itself using the reserved Hot-Join address, so that the controller
+      can assign it a dynamic address. The request is acknowledged by the
+      same machinery as an In-Band Interrupt.
+
 required:
   - compatible
   - reg
   - clocks
 
+dependencies:
+  xlnx,hot-join-capable: ["xlnx,in-band-interrupt-capable"]
+  xlnx,in-band-interrupt-capable: [interrupts]
+
 allOf:
   - $ref: i3c.yaml#
 
@@ -54,5 +76,7 @@ examples:
         interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
         #address-cells = <3>;
         #size-cells = <0>;
+        xlnx,in-band-interrupt-capable;
+        xlnx,hot-join-capable;
     };
 ...
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
