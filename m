Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A388606A323
	for <linux-i3c@archiver.kernel.org>; Mon, 26 Oct 2026 11:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xrFIJwIA;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=WMrTBPFj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/lMQc9mKZ12GPPYRH4s6gH1tIpJRMYfOncs2NyWG+CQ=; b=xrFIJwIArkedIyClAff95hCVuu
	VD0jpBD5PjY0OBJP7UrzCKRmCNirMwFhv5vGrbhZKprZWE17cwDd7ZcDr4VG3GgpH3GZ6IcWuFxuZ
	UmOOYH9Pd0CK1sWCjG3JUBs/O3imEOk/qkGHkh78ekS+ywW50845BOzjH0ijzATOqSOMRhMViUMKY
	vMmnO4shE6cnrorDrt9RIqPA1yuJrycaj/O9UvnHRhAFkoeZII55mCOsPuKtvfrU3Fx/CwcbqA18a
	YZZZWVjcqIs2XQRUC2VRqizI58eiNcZ2PYNGCYZ0h6leFbERC75b/t5wxjWI65HjGFvME9g+pEEfi
	JbIGOSCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJ0G-00000002OJC-3Vyr;
	Mon, 26 Oct 2026 11:36:36 +0000
Received: from mail-japanwestazon11010059.outbound.protection.outlook.com ([52.101.228.59] helo=OS0P286CU011.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJ0D-00000002OHq-455f
	for linux-i3c@lists.infradead.org;
	Mon, 26 Oct 2026 11:36:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zD6ZGVIsS5tTPck+uhtLUqaPita1p7r2E/FZL4P4KnGPzJ5ce/2MeXyJZ72MlOEAsPc384sy8YcBSimmhrKgy0PY0/+Zy0I8S9Hpj3ni1rYdjggfKa0eEJ4CKtg0jFrozvaojL5JJO39DPQYUkdAEUeqKXok4pIshkEm7OhEnOOrvQ5uviksyEYXgUCaf0mNXUxRD1SjwX649HhcEmuk5Pp/GQ+MavnKRS0QnGMlUzRAgCcBRfKWKMfM9y/dSm4CLEmlOkJEGVYcSb+T5EnOrUybDd1FfFHjql9xsrH8+vxhoIyUwHpe704baaGwbsONPyxHlT7Mg+ouctQ+bnJvEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q+sxK1Cup7qGRMyH8jCSFYQTwlL56vZPmBLXAXWfmkk=;
 b=o4CTu0ggl4haLUjlK+GGxV+MICtc7OLXgAWwRTHyXnp+i/vByPZAU68bpilkS/2p68qpyiccJ5wXthmlvq8Gpz9xPrwXqNt3qqbC/dQPEu0aQcj7duC2kYIq4T0tdj3tSkdZws37AwIkrQnnWBUnAOA1cdTXCsPMkdTivsCbWvijavDUPRPWl2qUzYj9AXjyV71yTEwa/PRJ3GIXJsvpGsvqp7ob9MMyLlB/eDfGt6U2pvxQCYK3LDJTFTg01ZJiKfFt3mayRtE++MBaCwqJEWoOXqcyQkyl+2z5WWwlYs9rW04mzxUGr45S+tsL5Kk36zfx7h46coyuvZxOwAvEDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=baylibre.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q+sxK1Cup7qGRMyH8jCSFYQTwlL56vZPmBLXAXWfmkk=;
 b=WMrTBPFjcjrNl775JnEYf0WNXSVNJH7Qq1QklRqb90sTIaFjYs90J611K1TTBiSL0hLzsdwG4nQCv5RgkIn7sMaHssRxxeucZCo6u8xGCefGEf+n0NKXdXuLrsnRuLE820T032bvSB7kcqn41zufXNSHxrtVUvDW5VjdClPW9oI=
Received: from OSTP286CA0096.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:219::13)
 by OSCPR01MB13482.jpnprd01.prod.outlook.com (2603:1096:604:334::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 11:36:25 +0000
Received: from OS3PEPF0000003D.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:219:cafe::87) by OSTP286CA0096.outlook.office365.com
 (2603:1096:604:219::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Mon,
 26 Oct 2026 11:36:25 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 8.62.32.50) smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 OS3PEPF0000003D.mail.protection.outlook.com (10.167.240.6) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.4
 via Frontend Transport; Mon, 26 Oct 2026 11:36:25 +0000
Received: from [192.168.1.82] (unknown [10.226.92.223])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id 56C653000253;
	Mon, 26 Oct 2026 20:36:16 +0900 (JST)
From: Diogo Ivo <diogo.ivo.sx@renesas.com>
Date: Mon, 26 Oct 2026 11:35:46 +0000
Subject: [PATCH v2 3/7] dt-bindings: i3c: renesas,i3c: Add RZ/G3L support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-3-2e76b87209bb@renesas.com>
References: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-0-2e76b87209bb@renesas.com>
In-Reply-To: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-0-2e76b87209bb@renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Diogo Ivo <diogo.ivo.sx@renesas.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793014549; l=3121;
 i=diogo.ivo.sx@renesas.com; s=20240529; h=from:subject:message-id;
 bh=6fpp0uSXuRDX7moYrth10n4R/iYNS4/t4SGOK5fIWUU=;
 b=xHaHr8u/5wpSvVY0S+uKqc2pdBXnu8sBZULpsvxqgg5JBOK3cGRCsewrRc57hwZVOnZS1mstF
 JhiscR7YVniBlypUS5o8ACUeChTrYdHzUUMo18CStNJWEPw33dKGvhH
X-Developer-Key: i=diogo.ivo.sx@renesas.com; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PEPF0000003D:EE_|OSCPR01MB13482:EE_
X-MS-Office365-Filtering-Correlation-Id: b8e25a22-0daf-4987-9cea-08df33555e06
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|82310400026|36860700016|23010399003|1800799024|921020|11063799006|56012099006|261021123027099003|261021121427099003|261022105027099003|261009223027099003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: 7FB/waNU4p8DyBMrwpr9DXbB7OlJHgOTPPOKQyWkFlG71lUd6/k9cTcUHKM9z6k80tzHRlAnOB39W36erej+qq1hGqbo4iDjy85Z9cBLh4ZyVpJlzHaA/b/7JdQdjvtMJgdfeD1LhiEagmzpt5M+LtIWQe6HHT5rtuczUjFSBT3v7XLJPXgrxg5ILHF8dt7oHEC7jqlMcXex7ibFCYdlkat3/z5T/1VCdh9wRwQWATpZ2AG1DwrOsRTCZvDfxgCDoTalSUuMrCIYpUdNOsjMwcmO+z+XgwM4Fnr/qEnES9MT0RBmbT5666NI2z3NRMCuBQ5+GNkz1EuRLgFaeRS85omvNQqPzw88ge+zq4hMd6r6KxYEFWc7ZgX55KHXuuavWiJiSX1j1mpIxl1ngNdKTsWpiA96JVt86CTaEewpNDIez4Hpb67YNy98VFfTCSwJc5iIM7WjE9qZOZJU7h9hcbSvCn5mF7ZnguvsPP4/lEaITh+fiSuF5sfmMF3dnMM/tCC1LIpKFrMIpLsPsMYKgjl0+xeVv6EXaT4qUBwgE3YOesH1P8aoA4WdS/8ffEd3y1gnj1GLYnwxTvEXuk2uAnK3ZfqUdNzzbCQukeVaPAC0KNcbU2zAiCNqGdueC6n2iJsSS6bu1aZD9/IsCQytLaNS6rqvwaP24D0UiGq7lVrYL5zxWXUE2zpF1WDdkhz0RjX23e+Bi0Np4ChAxqzAYWeTeYauN9nFbIA1M/+CMHiJiwP5YuaxPSkf7N8ArAQx
X-Forefront-Antispam-Report: CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700016)(23010399003)(1800799024)(921020)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261022105027099003)(261009223027099003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 70Obanxvw54cInGvxGe6aGzf/O8UY2ITRgveMV/HZ4a/xdnaGxe8ULLdDEc5edHIFRkyLeLLZaIeqcj4p5tMR/SchzeFyLl2ts85TZzUJD2jAAxN12onkOBzBs84YuY0Ind4kI9UQ3NQy6oyVnyGKXUwrVazd3Hwv/KgEes4uSVdqU/ma4DVKTk1nrUGJ3UEIl7frHLQRJI3vmQSH7tFVfRP/vV0MVVWSc3i01Oz/lm25wB8waaN8Gzx8tfAibNfMQc6hWQ1pfwTHMzDXUPooPOIGvipiD/2nDKxg4x+1w41d4WZI+5Uc6FOwC9wzz2WzIWbdkUBgEjWKa8G00W0xm0Rt9FgzQnvGgGElr57DmlLSfxfJX9mC5FiPcEC1LINy3HFXMoecyxQVl7ZQmSeyHAibpQw1sjmGgCj0PnHOQxpzBVpm5tIYQOq380WkuX6
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 11:36:25.1992
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8e25a22-0daf-4987-9cea-08df33555e06
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: OS3PEPF0000003D.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13482
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_043634_022142_6BF9B344 
X-CRM114-Status: GOOD (  13.25  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add device tree binding support for I3C on the Renesas RZ/G3L
(R9A08G046) SoC.

The I3C IP on the RZ/G3L is a subset of the one on the RZ/G3S, as the
RZ/G3L has no HDR Exit Pattern detection interrupt. The resources are
consumed by name (the tclk clock, the presetn and tresetn resets and
seven of the named interrupts), all of which the RZ/G3L provides, so
software can match and bind a RZ/G3L node through the RZ/G3S
compatible. Add the RZ/G3L-specific "renesas,r9a08g046-i3c" compatible
with a fallback to the RZ/G3S "renesas,r9a08g045-i3c" compatible.

The RZ/G3L is not compatible with the RZ/G3E, which has no input analog
filters and supports high-speed mode (up to 3.4 Mbps).

Split the clock and interrupt constraints into separate if/else blocks
so that RZ/G3L nodes inherit the 2-clock limit from the RZ/G3S fallback
while being constrained to 16 interrupts alongside the RZ/G3E.

Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>
---
Changes in v2:
- Describe the RZ/G3L by a SoC-specific compatible with a fallback to
  the renesas,r9a08g045-i3c compatible of the RZ/G3S, instead of a
  plain compatible, and drop the corresponding driver patch.
- Split the clock and interrupt constraints into separate if/else
  blocks to handle the RZ/G3S fallback on RZ/G3L nodes.
- Explain in the commit message why the RZ/G3L is not made compatible
  with the RZ/G3E.
---
 .../devicetree/bindings/i3c/renesas,i3c.yaml       | 27 ++++++++++++++--------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml b/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
index a20d875086d4..9f69766df07c 100644
--- a/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
+++ b/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
@@ -17,6 +17,9 @@ properties:
           - enum:
               - renesas,r9a08g045-i3c # RZ/G3S
               - renesas,r9a09g047-i3c # RZ/G3E
+      - items:
+          - const: renesas,r9a08g046-i3c # RZ/G3L
+          - const: renesas,r9a08g045-i3c
       - items:
           - enum:
               - renesas,r9a09g056-i3c # RZ/V2N
@@ -120,26 +123,32 @@ allOf:
           maxItems: 2
         clock-names:
           maxItems: 2
-        interrupts:
-          minItems: 17
-        interrupt-names:
-          minItems: 17
+    else:
+      properties:
+        clocks:
+          minItems: 3
+        clock-names:
+          minItems: 3
 
   - if:
       properties:
         compatible:
           contains:
-            const: renesas,r9a09g047-i3c
+            enum:
+              - renesas,r9a08g046-i3c
+              - renesas,r9a09g047-i3c
     then:
       properties:
-        clocks:
-          minItems: 3
-        clock-names:
-          minItems: 3
         interrupts:
           maxItems: 16
         interrupt-names:
           maxItems: 16
+    else:
+      properties:
+        interrupts:
+          minItems: 17
+        interrupt-names:
+          minItems: 17
 
 unevaluatedProperties: false
 

-- 
2.56.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
