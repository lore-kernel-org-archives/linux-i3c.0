Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81ED9CAC5A7
	for <linux-i3c@archiver.kernel.org>; Sun, 14 Sep 2025 20:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TY2bAotdbje4Z4ehGGl+SfFYxZx/+efkO6jKgP3T8cI=; b=ctpD0Nd7f+abvA
	8fIZpONuP3U7RJ/Mxu+9ekXWyAHtQwaz2xomFuJo0oqkFVWDldPuRWExexbAMIIcCXXuU+CifE7T0
	k5GmflJhIBc0xMIXCyyCNc+ARZ/KT6MbJMp1mpBUOqYQJZy5wuFiD69hHxDAEyU7Sxf7qUdKBZz/r
	ip0gYeqEbv3e8m2Vec45UVQEdi3luTcy7U4w3iqFs514QjDV9UBhj8qhfGmgDDzqbmILhLeSKIhR6
	wMbs3Dr2uMuQbmH+aESti4WCldYzLbkOymBtghlL4vls2Lc43LzGjxk4dT6crFGCOxqnMM/LcE0Sh
	XUJVLjRhKQ4jE+PoH85A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxtPk-000000029xq-0jwS;
	Sun, 14 Sep 2025 20:33:36 +0000
Received: from mail-co1nam11on20617.outbound.protection.outlook.com ([2a01:111:f403:2416::617] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvZwT-0000000Gdge-3EOK
	for linux-i3c@lists.infradead.org;
	Mon, 08 Sep 2025 11:21:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AjrPX5QKkFLn9qio2Z5zEkvlf7o/xovICkXj0pgUpWYm15phk2gRsGInVdcniv5cHezos9Ztb10oaB7cQufqUFmUcy+SxBNEENrt3nUGACztBFj5p/FN3JOxYzTkVnDJyxNqkJyQU98aykf4nGJ+vy3IuTnSf1RCNn2jIGK27wCIHTiykXCDEkaViERfgx5vrrJGXAcg+k/FJNW7hcTJ4Pk/jYzhTPjpKH+8lRywb+ynYp0F0961+MX5exZv9LXzuUDzI31MKrV5cnls28pi7vRGvSTDTGb7OmuqUvrxp8FkmeREY0AwS47okcUMYmB4DAcazVYTxJYA1+VESnO5xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r7sUF7S1fT/R7KQKG6WfD4DkDw6UEwhhKi6LaRhuH74=;
 b=knIyNJGsPcBsSNrdY1kRbbhc4S1GMFhv5GeG0KUcnTFlZcQTOXebubLtZuwXB6fYnMICsH1RxIo537BpLLi2K5OkFu+vfPx9MP/DH5wnZzcfK9Wzv9xsFlVw3R+sJe4aDHlCodJvqPVFMygtynjU5wMxsufqWZDe6JOwyT3jnpQFaH75SPLoUM3P1CXEOPSVdDmC4NyiZrGHm2Mnqfovqk+TsxqlCXaxyhZg07X0VL4RicrDjbpGwL3JhrNozLQeMc7thUjxLs61oXG9B8+100ydxOTNEonWXugWOvscJdHrkCH9J3hcw9aJazH1b3aTC7RWzSgUXdke4+8f2KZ23w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r7sUF7S1fT/R7KQKG6WfD4DkDw6UEwhhKi6LaRhuH74=;
 b=I+6es2s39W1NIrDpoN/kir3YcDm0/m8QG+SxSwvt/oqhjz+6em+yWW6ojb3sBxPw7l8NtNRPso+YPBBNRDakhxCbDLKBoGL26hQPkyqat8fU9qo2HxPE3pHtCYokOiw7Hl0DIj5p9O8t4cqLS2KEe05usHzrQJM2qBy27TBqQ5o=
Received: from DS7PR06CA0004.namprd06.prod.outlook.com (2603:10b6:8:2a::19) by
 PH8PR12MB8429.namprd12.prod.outlook.com (2603:10b6:510:258::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Mon, 8 Sep
 2025 11:21:44 +0000
Received: from CY4PEPF0000FCC1.namprd03.prod.outlook.com
 (2603:10b6:8:2a:cafe::82) by DS7PR06CA0004.outlook.office365.com
 (2603:10b6:8:2a::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.22 via Frontend Transport; Mon,
 8 Sep 2025 11:21:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000FCC1.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Mon, 8 Sep 2025 11:21:44 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 8 Sep
 2025 04:21:38 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 8 Sep
 2025 04:21:37 -0700
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 8 Sep 2025 04:21:30 -0700
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
Subject: [PATCH V5 1/2] dt-bindings: i3c: Add AMD I3C master controller support
Date: Mon, 8 Sep 2025 16:51:16 +0530
Message-ID: <20250908112117.205270-2-manikanta.guntupalli@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250908112117.205270-1-manikanta.guntupalli@amd.com>
References: <20250908112117.205270-1-manikanta.guntupalli@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC1:EE_|PH8PR12MB8429:EE_
X-MS-Office365-Filtering-Correlation-Id: d4f743bb-292a-49d7-84d8-08ddeec9e433
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|82310400026|1800799024|36860700013|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LXd2ZBpw/WkOc9QoxFEpJX6Cb16t16WrrPGKLOk++WuwVZSOwQQXyM2Autpg?=
 =?us-ascii?Q?edtbTXXUozNKfk5d6ZQRy0/gXAIY0CzWaRS+0ifG1BUUrX1JNQYP2RrT79X+?=
 =?us-ascii?Q?iARddglbkyyZWJnI6EwjqCU9WdcLmMoZeFsZGLP0lWWL3FN19HGHfqn1vaXr?=
 =?us-ascii?Q?Wd3xXVt6z8Li3RTl1IgR9XanXQ8g+9oSOOAl234b/qamW1C2g3ejV1gxi08A?=
 =?us-ascii?Q?ODUn3wIs9gHpHgLMzXm2i4Pxz+6TVe8o2iTc2TeCeeOH2w4EZKvPbrP0tEte?=
 =?us-ascii?Q?1gQDJNR9pDQpeo+1XVpvOAO4J8yY2TGA7PLqx2Wj905riGQu1+R4syrQ56+k?=
 =?us-ascii?Q?H/cDQUgmhbmoZ0LM6jfxdEarlmqE0vNmJsiWT362O5L24R4YI9luGdMVvKyD?=
 =?us-ascii?Q?dR2Iku619Re17/3G4r6thEtpizIIm1bPBLV2udw79nN9Xa+bpjh1MEAyrb8I?=
 =?us-ascii?Q?cgrCrBlmS0YwF3xCcuXX0uxVVPNBKSwMACVmBrztRj9DQqpN3V/BqzGb+XSx?=
 =?us-ascii?Q?BABE8xd05u5eg0LdZMxxJvMSQSbLYNk0IAK9EkB9kBamZqlxiJpaf6tVMF5F?=
 =?us-ascii?Q?DP7eZzJTzZK62Di0QV9bOfBz2lWihqTg6DeS6bAU6f/8b5iQOzZ5WNsxe0/5?=
 =?us-ascii?Q?ggdKhqbP8j8UmR4hOXPS9XSXgdz69/XzzIiBLaXS+kC9PvEDZ5PufJ6yE2Hj?=
 =?us-ascii?Q?c0wcvFbToja8tiz8lG5jYVhfQIQXvsXDa+2sXlqkoMDHs424chVFMe35tFtw?=
 =?us-ascii?Q?5ObClZRdIRurDJOH0siWuEOudAjyvC6gdVzk0Ot/lFwp4WQ3OclWTY/OPTTv?=
 =?us-ascii?Q?zBuz3WRGS6WRyQsQuHnCt3HHgnXkPBfXJ3LRsgA80VWfAIc9CzepTLTDu/2c?=
 =?us-ascii?Q?n83lYxyNH19hqSltx/Z8rr0qTymPjXUuO2mxmYRvNtNKlWZYGI4ahN8HjNu4?=
 =?us-ascii?Q?2vxxoGGiQfZU5BUoZUouKhNC/OxqA9qt1gwxu6Ln8UpbEEmjBRhLKWOIdtKV?=
 =?us-ascii?Q?gmjOAv70fr5dOjxiXCwEFQot8embP58L3XrdN/I14mTGmpqGWbSjITb9T4dt?=
 =?us-ascii?Q?ycbLyklXv6CJsTMROYmSHd4s2cj4R85s3ff3tpnFATmPH6S2k9piqT/aA5dQ?=
 =?us-ascii?Q?8BlhII8zL0ZL7zI8ke0d4ndrR1XROmh0poSutyEszTcE3FW1WnA98pBI7huI?=
 =?us-ascii?Q?/u2UfgyAmV6WM4v5lTbYdZQCXYSi/Pcs08Jc0hzmllRD8TYQMa8q8t9cNmlN?=
 =?us-ascii?Q?1LQAcMoAgwzKG1YeazVdJhl8tLstpc6bh+L2ltp78FO7m2tmak7aiy9PBB2W?=
 =?us-ascii?Q?UXHwt4pB3r4On6/omtfHqTrTLutZFQSNKymud+lz13ULpMIBrihcyk7Q8b6a?=
 =?us-ascii?Q?2Az30t42xY7+99nb5dmyHljkCcQSoFbs3JWAlofOuzIxnajFnLVRpmGvO7+E?=
 =?us-ascii?Q?l1ekIZA1dLYl748P46JED2BH0yN1t+xg/gpU8KM99ND2NCtzATjlSBMmd2Zd?=
 =?us-ascii?Q?JZ8mxZKan5GcFlg=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 11:21:44.0021
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4f743bb-292a-49d7-84d8-08ddeec9e433
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8429
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_042149_817205_D074BFBD 
X-CRM114-Status: GOOD (  14.20  )
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

Changes for V5:
Renamed the xlnx,axi-i3c.yaml file into xlnx,axi-i3c-1.0.yaml.
---
 .../bindings/i3c/xlnx,axi-i3c-1.0.yaml        | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml

diff --git a/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml b/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
new file mode 100644
index 000000000000..1daeb20205ac
--- /dev/null
+++ b/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
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
