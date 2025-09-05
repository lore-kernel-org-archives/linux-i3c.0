Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B75CA0EE8
	for <linux-i3c@archiver.kernel.org>; Sun, 14 Sep 2025 20:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HlvC/NfPoiCa0UruBSToCWfJ6DYW7AYq2qEPDzJmSjE=; b=BY6lZjDzz61klp
	W1N/F0uJdCeOy0H+tjz9O0YxRgt4H/kBnp0aa34sv/ZljEXSIpVUyoQL/+QCBfujkDS+m8EkriF4T
	Yelq0ODEiTA1NM7L0zOYRQEl/7/MDHz7+vN0VuwIIjx+n2f6Jyj5EEv/dnLXlMiq+w2HhO4iKr/dT
	DahQ5WcfkIShglDAWowVByG/0t2+TTINVvraQnExAwaep4N+LGMQlbaKq5ARXtw/bBSYqw47ofHCx
	4JPHB1BVzAuKdCcHhDu3GYfWqmSydIAzthRgocZ50atoWdvARjjffhPvBRoQ3NkVxGfjjMiyhiB0d
	nrkLdX4Itl7x6l8sL+oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxtPi-000000029vh-48lP;
	Sun, 14 Sep 2025 20:33:34 +0000
Received: from mail-bn7nam10on20611.outbound.protection.outlook.com ([2a01:111:f403:2009::611] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuUlj-00000001QgH-0XL1
	for linux-i3c@lists.infradead.org;
	Fri, 05 Sep 2025 11:38:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BMto6vX1lai+gNcpA95+HTnwEdA2ItJtcYRp5jtS7iFy6n7BKpixcP6Gk6fuB2Jzor4gPxCI9oGFs7zZ1pDdRxGvc1zffwGAOF+L9phIXqyCc1RVRIMMjZkoBb7F2Z+G4ZvWfamyPPLcpUh+w8kHvO+LzYKs9CQl5J38ZjeoIF6Pi1iEfzA07DYjmJBfeyJ4tcVId2Hl/rSeaZnB7MI4F5+dddUcnNJOuFCqiK6aa28R81cY+BhPRKyKeUlTnMZ2RfZJcX1zH7fUnZ2Atx+V3Dd1VUtQ5HfpeHs+keTM6sVRxa/uYObVZJKhvkNpNgRQPCgcp+SlkKJcX0+V+37ZKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wqVvu4uuZEY4dxreFsMChgZgYXwn5LJkyVysPwcwQOc=;
 b=oYrAeFkENH6XWr2q5DPHtPXpCheIxrk7hJdWqOzuDMRJnCXQmvzmtechzC37hYfVfCtXo4FuSQ2JkvqsT67t33Sasuz5BN4fDKRMu7p4abSRVE5O/WCK6jpwCvPoh2KZp+qQ+N+A48vh5U3Jo6CFd+7rJCv1yU4d+R00f4o6C++DzrNGGhCKecPI0a44lWiM3h60A8HMNpwLI/+p1NyZBd0BPS3UCUlOK7va98GbT0a/6fxxmEyl9JawcSVOnbU3Auz0AaJHHkXymCqhmqkQtNtYQaM1F/G/7SkIMxoKLI32ANal8c1BadRG2Y9/LMYnuyRgTucGF5Zt7VGsA0zdXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wqVvu4uuZEY4dxreFsMChgZgYXwn5LJkyVysPwcwQOc=;
 b=LdOZAaeEKeQ1exkpG1He1J4MJCYEzoTP7BozCAJ4GoSCljKajagMzZUFHcNBjmDBt2QxSX8TkVlsx+OtbH7GbzpBbeFOTUv6d7kp/UurQES8NJdZmJQz9o2z76V+LEjZDWOP9pggbWuMlbKEELNBb73FG9uA23ZqJewYE9xhByQ=
Received: from BYAPR07CA0089.namprd07.prod.outlook.com (2603:10b6:a03:12b::30)
 by IA1PR12MB8408.namprd12.prod.outlook.com (2603:10b6:208:3db::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Fri, 5 Sep
 2025 11:38:06 +0000
Received: from MWH0EPF000989E5.namprd02.prod.outlook.com
 (2603:10b6:a03:12b:cafe::bc) by BYAPR07CA0089.outlook.office365.com
 (2603:10b6:a03:12b::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.20 via Frontend Transport; Fri,
 5 Sep 2025 11:38:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000989E5.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Fri, 5 Sep 2025 11:38:05 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 5 Sep
 2025 06:37:56 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 5 Sep
 2025 06:37:54 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 5 Sep 2025 06:37:49 -0500
From: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
To: <git@amd.com>, <michal.simek@amd.com>, <alexandre.belloni@bootlin.com>,
	<Frank.Li@nxp.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <kees@kernel.org>, <gustavoars@kernel.org>,
	<jarkko.nikula@linux.intel.com>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-hardening@vger.kernel.org>
CC: <radhey.shyam.pandey@amd.com>, <srinivas.goud@amd.com>,
	<shubhrajyoti.datta@amd.com>, <manion05gk@gmail.com>, Manikanta Guntupalli
	<manikanta.guntupalli@amd.com>
Subject: [PATCH V4 1/2] dt-bindings: i3c: Add AMD I3C master controller support
Date: Fri, 5 Sep 2025 17:07:39 +0530
Message-ID: <20250905113740.3841181-2-manikanta.guntupalli@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250905113740.3841181-1-manikanta.guntupalli@amd.com>
References: <20250905113740.3841181-1-manikanta.guntupalli@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: manikanta.guntupalli@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E5:EE_|IA1PR12MB8408:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a2af7a7-1ef1-4470-359c-08ddec70ae40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|1800799024|7416014|376014|921020|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/xhTnF7MjoqDXzwwntNAyLie+vNvQq8cwoKnwU1Ks53Q0lDLWXTKSlvBueLR?=
 =?us-ascii?Q?RnfgmP7mAFTOQ5uB/t3Klh04AbRWevG26KtUM+ictXuGNFaNkSKGqksBhUHU?=
 =?us-ascii?Q?Ev+2s2AyrVuIB1hFVXWvNdG9qbiGsP91oNMyXHOfm5i7S6sLhH/TNQtYAK6J?=
 =?us-ascii?Q?svxuorOgNp3z9O/0iU4uKszfhUaRKvtdvHguLnhIMHRAQk+EwQRFGctHZLK2?=
 =?us-ascii?Q?Dydz5xzaJS+/lroabAjIjAIl4EoOGH9zbkGlYAUb721fii3aZSeJdZdYZnts?=
 =?us-ascii?Q?oaY2WTN7aFvJn9Uwc3FPq2Jmy+bLPyASgfu2BBXFkj2nylnie1tGfgr4xuA+?=
 =?us-ascii?Q?kg6e6RkHT8QX99syZX2BRMRudGekCBh1K7a1EMs2F470eWXd6NTb8fKVKwi0?=
 =?us-ascii?Q?7hQviUwGrJVqvuFWSG1yPQukYAbCmAkSuhORiM2KhPw0JV+QZj+98IEguRUO?=
 =?us-ascii?Q?9pNaswDbW/EpzYcmH8aqgUbgQcJRit2jWJ2VnrCo30UCFBRU3446ohgHeNjp?=
 =?us-ascii?Q?9Sb4vJtnKAr/Tz8sKwYGB402b7Oro2raqPYFbxYJrRqaWdl6ZpA/cyioVfVS?=
 =?us-ascii?Q?mhejkHQ3bXgAdwRUALGsluorqKP2vYzhgZzXNFIozeu+ANRyzE+9A0KIguAH?=
 =?us-ascii?Q?9o83y/qJipFAaswRKnVEjv0Y2KSkFOsbWWh/w3lgeVNi/aPjjca3PqoUZzM0?=
 =?us-ascii?Q?gbLGwC309Q/p7dMvnj+n7JL8NmVzcuevF1rWKq/JWL+oYkAu63+mCNRwwzCc?=
 =?us-ascii?Q?Von/AYL9lGJqkTuRmAogy5qiUK6QKLSXnGugr1gvS2ZxzakaKy60EwAnEXp5?=
 =?us-ascii?Q?Uzg3Oi7vvSuU7xAFhWvg1lLRL/VBL2h6nQDILNTAnHuwZAcIPaind6/RsS+h?=
 =?us-ascii?Q?opdS2urYMXh+mvDspGz4ftH5uZ3gqfJxCr9Oq7W9OgeWstY+o60B86JMw/d5?=
 =?us-ascii?Q?JxXf4Y/RyxcdNN6WL/DBBC6EmDpBMNudoYg0rp4TbvO15EjoO/ZUDbs1jGzC?=
 =?us-ascii?Q?iuZRic3I6YMcX4s4MBjvZrlITT2lc8Ex/fOp17TGrK0EVjW6u/26Rdt9/Wk1?=
 =?us-ascii?Q?njb+BvD1RJVUqbxW+M9aZS3+nPESEFtEdJ1714H09uwvPjIqRU0x0k2KhIlX?=
 =?us-ascii?Q?5wUoTBEIsW/OKo/dmxnKXEh2q5QprPSI/YAOev12phTP43NB9S/27qqi/7R2?=
 =?us-ascii?Q?rl/Q9Y/XON8HYkOzl3c9mPGsrraZn9zuYINctiFZYmaUluSUSIzAgOi5daZY?=
 =?us-ascii?Q?b9Gvgc8DIh9rCAsM+3WkwvIILSaL/jBgvDnfbIy54WCOkzNiS9P7gQn+XcZD?=
 =?us-ascii?Q?A7DYPzwcZ3YAnxoskMJdlWoJj3IO9AW0qnV6c2Bg2eL7pDB/mZvD2H7N/3X2?=
 =?us-ascii?Q?lmHNmHtYSE63yewk9G8MDKub0gFTkfB1CivDRUAr0CeFbHBSCwQvv4/1ZZgc?=
 =?us-ascii?Q?iit1DwYenUx+36KxaWBM7JkjHavgxiwh5geCjJ78VPDbIViTTpxebcSDEcJu?=
 =?us-ascii?Q?8h1sqCKlKRNTM4E=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(7416014)(376014)(921020)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 11:38:05.9069
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a2af7a7-1ef1-4470-359c-08ddec70ae40
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989E5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8408
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_043815_173896_453BB258 
X-CRM114-Status: GOOD (  13.33  )
X-Mailman-Approved-At: Sun, 14 Sep 2025 13:33:23 -0700
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

Add device tree binding documentation for the AMD I3C master controller.

Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
---
Changes for V2:
Updated commit subject and description.
Moved allOf to after required.
Removed xlnx,num-targets property.

Changes for V3:
Updated commit description.
Corrected the order of properties and removed resets property.
Added compatible to required list.
Added interrupts to example.

Changes for V4:
Added h/w documentation details.
---
 .../devicetree/bindings/i3c/xlnx,axi-i3c.yaml | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i3c/xlnx,axi-i3c.yaml

diff --git a/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c.yaml b/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c.yaml
new file mode 100644
index 000000000000..1daeb20205ac
--- /dev/null
+++ b/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i3c/xlnx,axi-i3c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AMD I3C master
+
+maintainers:
+  - Manikanta Guntupalli <manikanta.guntupalli@amd.com>
+
+description:
+  The AXI-I3C IP is an I3C Controller with an AXI4-Lite interface, compatible
+  with the MIPI I3C Specification v1.1.1. The design includes bidirectional I/O
+  buffers that implement open collector drivers for the SDA and SCL signals.
+  External pull-up resistors are required to properly hold the bus at a Logic-1
+  level when the drivers are released.
+
+  For more details, please see https://docs.amd.com/r/en-US/pg439-axi-i3c
+
+properties:
+  compatible:
+    const: xlnx,axi-i3c-1.0
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+allOf:
+  - $ref: i3c.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i3c@80000000 {
+        compatible = "xlnx,axi-i3c-1.0";
+        reg = <0x80000000 0x10000>;
+        clocks = <&zynqmp_clk 71>;
+        interrupt-parent = <&imux>;
+        interrupts = <0 89 4>;
+        #address-cells = <3>;
+        #size-cells = <0>;
+    };
+...
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
