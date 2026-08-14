Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F20C5CFC1
	for <linux-i3c@archiver.kernel.org>; Fri, 14 Aug 2026 11:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VVltxEmtHW098oZ8r98l4gdqmbKfMvpa3vFBSHiewCo=; b=18fc3RJqZRfjMH
	Uq2iLNT9e6q3ZExDy07OkqFiEGHN1RHC1XREcY+w8sOJsRVJBuWxlZ5ELsZWY9xc9ggHwrUnNe8P0
	lYXTOgAIwusktBVIzLgOC6yddkC+3/0371gQIefXdtsTs/rSqOpGdLbmHkWFcboT7v7G8I2ABUZXb
	H632mCxqEA5lNkjqlhywktt0Gdz28G3KBZ+8azqCca0MZn54rNqKhWc4pYMmu0sAo2cUVWMc+v6Kk
	66wD3eiChd0l53rs/vEG6etDm5Mrh04sOr2Ygfo/oyfqHJ7vD9zTj/SCQb8drLQZHRbiK7By+nZOQ
	lQ2Oj/nfiaTUmXgRiVoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuqSW-00000002cVy-2B4V;
	Fri, 14 Aug 2026 11:52:24 +0000
Received: from mail-northcentralusazon11012010.outbound.protection.outlook.com ([40.107.200.10] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuqSS-00000002cV1-3zLn
	for linux-i3c@lists.infradead.org;
	Fri, 14 Aug 2026 11:52:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jXl0g6LJ6XGhdlEVeRyXeCan+fsDMwckiNuEks6U34VduC/YiTmFbowxkyVbUpIWD/+mqGKO6nAISYaKf1U9uonZsub+2jLd9BXcmzocQYFRtSt7HpKtaldjhQ21lDcfCVCdTWPMSqE6nWjibWXtT/KD+L3DdersXRKebiDGK/C2Bu+i3vkE8KIghHposYESdERMeIBqyloPRla/AcKs05fkrRaZQpNbQ7QSUYySgnp11q17tq+870rWxml2F2vBYBFcf9nWov8bhkvEuQoOzSk67lSvMdh8OAMZOlKtMDrputBP/ieCadaFs+GkPbEQlqEzKRJBC7Dvs1Tqw0f+Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WK7kLBqKUynSpBLB/LvlUhtM4fU9JNLCoJO7ixvmESo=;
 b=UUskpyw4qmStGf8jjjHowLcCs90QvaMWWkrRWBJgZQZkXkqMqHJtieiNI5FIBcGhccq85OrYu5FKBIBrFI+jpR6KgOy1gunmiOMG7Zan1JwIkR88gend59PzpiEQLFdy0hdI3MSiinQEDDRE9hl9SOa9gwrVQ6f21wM+eQ8eWA0rUjXvszMn5AzSqZ9BvTpb4aj5asmciPgyO6brsUj562W3dcigrvQMZYNLe8temreqtQbTMXpo3ial4V2gJVZBP9fO+UO4Q1VYoBdpuDgPvKWhEibntDGfWodkOmK2n34wAotjHAy3DrSECowlKT7AhETLjSoSSdNpJkxbEwAPCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WK7kLBqKUynSpBLB/LvlUhtM4fU9JNLCoJO7ixvmESo=;
 b=zXMv5GTv2S73CJx1iSlVCKiGoDuXSo1J8l8u7bDLC6fbOjoCCSjXoUPs6t5Nocvb/zosqsMr0jgCGZhNZXntYJvABRMk0tVdfpDHdJbvOkinz0TNFl7nPVY4fQYU9bCUQ14lBZPci8lI8prycUqayCELZjZwfeBBrHWl0x9zTR0=
Received: from CH0PR13CA0036.namprd13.prod.outlook.com (2603:10b6:610:b2::11)
 by CH3PR12MB8284.namprd12.prod.outlook.com (2603:10b6:610:12e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 11:52:06 +0000
Received: from CH2PEPF00000140.namprd02.prod.outlook.com
 (2603:10b6:610:b2:cafe::4c) by CH0PR13CA0036.outlook.office365.com
 (2603:10b6:610:b2::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.5 via Frontend Transport; Fri, 14
 Aug 2026 11:52:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF00000140.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Fri, 14 Aug 2026 11:52:06 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 14 Aug
 2026 06:52:05 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Fri, 14 Aug 2026 06:52:03 -0500
From: Shubham Patil <shubhamsanjay.patil@amd.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Shubham Patil <shubhamsanjay.patil@amd.com>
Subject: [PATCH 1/3] dt-bindings: i3c: xlnx: Add IBI and hot-join capability properties
Date: Fri, 14 Aug 2026 17:21:53 +0530
Message-ID: <20260814115155.3974988-2-shubhamsanjay.patil@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260814115155.3974988-1-shubhamsanjay.patil@amd.com>
References: <20260814115155.3974988-1-shubhamsanjay.patil@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000140:EE_|CH3PR12MB8284:EE_
X-MS-Office365-Filtering-Correlation-Id: 47c5418d-4bed-4d5e-466c-08def9fa76be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|23010399003|36860700016|22082099003|18002099003|56012099006|5023799004|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: itC1TEZ45+CnP7dnCDGrmC9w1cZZP+psCqIjyiDO4pxlISStGu0FRpNem7NZxjDVANRCVQpNWI6LUWHgpu5ibwg0x//5eE8TKeeIVfAlgTKUKQZCe0Ttd3w77y1EMlx+hlVt5pk1Yv+z9wxOHF2pu6K6jcvYemNZsiSUFkdwF3cScotiyCI3UL52pHvHSjbk32DsnoO031QlTRu73vjssloR4Dqs+LyuOlg5q09CdkFs0AvHF4eVwR6Uzw+WRigsC/bMIuNsyKXiMucosCHxJhtHTahZUrrOiNmudHaw+Mwrj9yHnzcllXH91HvFeWbB+aS5AtC9Gyv3SKWZ7+ROZo/4hHW8Cvi+366kyFxGeS43mWAVFpUGs0xfFHnx+4tUdhcf5Y5KIGt7WsRa+M+xhy/2EMg9fvdtXRTgf9gR3no2kCGtmql8CkqH9y1/oMZHcUIGl1WxEZ1J2xMyMwT9fZ3pbCI55Uxc2KetjoIK4jbgCI1pFfhAlQ8OsY9Sw0Pzdaslfr4tn5XdKyIvSpEwFX8f5191Z5xO9DqkUt4FyZoC05fj1iZESnU1o9XIX0sXfwh1GusPeyU4r3Ur9DICVHvBrU1+qVIQz8q0QSROR2uZzUYbwXtiZalg73N8K3idAgPOJjjQOo44fr8fLWtHygJG1Y3HuaZ2zffOeVvplL1g5ZeevFS9JawMtEjVBxjVPh50extIzVq8T6f32Equig==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(23010399003)(36860700016)(22082099003)(18002099003)(56012099006)(5023799004)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: JjMFr+wkt3lnt1QgNAP746NAojvEL5WRG5j+F3WEtslyEYjZIsWNvTUb965o+VzEwKwG7cLot035sGgXEJQNJnqq67xus3pVeTWrMiUKgJfWHDWEACCuve9S1EA70yuYxwuLPBGNua86W05Wj2Ct6ZApJfwMqPlmsseRin1jAG91TMpdY7V3GWrwj5BgOHmtTxwjL1cTltLBOIjO9wROpqOzsDKXzkdWlCPp8gN8m2gcAR0hArfvBiVD+InKV/89cJK6hkJq6FI+5SBellWmUcp607L5eSlW4bJbX3IAxLW2AloksodtENfx2ALiqkt++PX4LR+s2s0ZwOgDunnfgSixn1wfAu8RcvrU+NbSF62fPAkSHSfhcnb7qcMU07q55+NufbdqsFbTfX6RDN2kastWpt0RhkmPj4PjPNaOoi/tHxInwCu/tGuMfjMk7R6P
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 11:52:06.1962
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47c5418d-4bed-4d5e-466c-08def9fa76be
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000140.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8284
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_045220_995020_A76E4644 
X-CRM114-Status: UNSURE (   9.44  )
X-CRM114-Notice: Please train this message.
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
 .../bindings/i3c/xlnx,axi-i3c-1.0.yaml        | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml b/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
index 2caa245a8656..07e3d0b4d767 100644
--- a/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
+++ b/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
@@ -32,13 +32,34 @@ properties:
   interrupts:
     maxItems: 1
 
+  xlnx,ibi-capable:
+    type: boolean
+    description:
+      The IP is synthesized with In-Band Interrupt support. IBIs are reported
+      through the controller interrupt.
+
+  xlnx,hj-capable:
+    type: boolean
+    description:
+      The IP is synthesized with Hot-Join support. A Hot-Join request is
+      acknowledged by the same machinery as an In-Band Interrupt.
+
 required:
   - compatible
   - reg
   - clocks
 
+dependencies:
+  xlnx,hj-capable: ["xlnx,ibi-capable"]
+
 allOf:
   - $ref: i3c.yaml#
+  - if:
+      required:
+        - xlnx,ibi-capable
+    then:
+      required:
+        - interrupts
 
 unevaluatedProperties: false
 
@@ -54,5 +75,7 @@ examples:
         interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
         #address-cells = <3>;
         #size-cells = <0>;
+        xlnx,ibi-capable;
+        xlnx,hj-capable;
     };
 ...
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
