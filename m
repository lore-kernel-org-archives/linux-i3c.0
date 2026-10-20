Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3B5606A31D
	for <linux-i3c@archiver.kernel.org>; Tue, 20 Oct 2026 09:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Tsn0Oi/g;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=mp8iwxzq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=79Aj5NUu5l1EuFQRp90hi0jLWk2uK6WqzLzX0+NaQdQ=; b=Tsn0Oi/gUHIO0a
	moN2XHvmWCBBhLcgHuaKa267a/yPXl1YPAAxmXsqyG3SinYLP2TcqWhsOqzRhwKwTli1yXmumy5V9
	O4TDJD2U6/JXPzCqKAjCFR0uZrX3jQqxJI6PjcRZoZyaY2Q/sG9C+ovwtSV1V+7XJxm3SNIMVawT8
	ukOdNjOLo6rxVw0See/zwVJuy9z2LTI7ZHsf6dSWq3gKVdo1BK5g1dL90BjqzpTfDGP8OOrANWPnO
	l1k37j2ogFjlPkJ0exv8MF1oALVkkozLD03uNBXv3DOaDz4KJFJGotJpdOEZ9cbm22AEaPGxbuTz+
	EIhY1gmC4mTzUa/hCX0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ5wq-00000009H2m-43Br;
	Tue, 20 Oct 2026 09:15:56 +0000
Received: from mail-japanwestazlp170110001.outbound.protection.outlook.com ([2a01:111:f403:c407::1] helo=OS0P286CU010.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ5wn-00000009H14-42qH
	for linux-i3c@lists.infradead.org;
	Tue, 20 Oct 2026 09:15:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ytJ3UgwoYmkU2Xk9ZWPoxzWmQBFNaVSf/zCde6UAHvAVvEwLwRDXsiigzyuEDsht09uD87LUXKwHXFJ0Quy92eJ+uP1Uv2PmmcKj0JWTElGrz1cSMKR/U7hZO1YJEIw6cQZKsjHVtgXN+ApzdxZ4PHRr9/8tB4JzNGg/SDSBmvuXjMnP+kyB8PsCD8xCQSkrWSVqBVKFNDTJrh95IFHPuDKb2DAPLtxLiBZQtQRPzOe+SdvoyI7rwwEYto11sBDrC2lDOzs8/5vPBo0U8B+RO/zfVNEE4cDsjknABOOFYIw5k+ZtpTWUlwls95nsElcyDQPKl2thR0Q3zhYNV9h60g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8QqjxqOg7uB1Zaj9gHioVV/ldf+DW29yqq4pcNueCr4=;
 b=bIAwgnNmMO604sX+ocTf3kXaqBu/dDRQad2dT5SmWgCzbW4/tlDt9ekdAuM7VqVXIQo0fqMk0sAPyl5W3b75SpQ7H+zYSE3sPl/bhx2QiKAEGeSoxPC8YPgUsaj7QUBmQR5empsAiIykyjkIPNT0bl/yBeI/mTSoC11Qcvx4qZQ4+kb9tuz5A9klGRXHmbU6DmTH6IrgVNJENksiEbx5UnyRBdcRYqzzLPAMX3DNBqbuX5Pax6e7Y8vsGU77oBIR/z7NCEQVEhq4RmiTbbYTA840Ed6NDE5622PIf02wtFApOwmMImj/CuZDUShJNY4vZRAt0iJO13jEpOcFTJvLYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=baylibre.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8QqjxqOg7uB1Zaj9gHioVV/ldf+DW29yqq4pcNueCr4=;
 b=mp8iwxzqBXkkX5tSqGKkXlc+15ajK3V8oWJJNENHtfIuAfOmUdttOXEcg8V4QzaLCUH/wKti37sEjNFNLLBB1b9GkJROGTbN8aW9jedkHmauj3+aauHVjD3O5cJZ/vm/csEYUzW4u6npEdneEuOcVaLZ3DKVsnc1WI+P74VOm1g=
Received: from SY6PR01CA0111.ausprd01.prod.outlook.com (2603:10c6:10:1b8::22)
 by TY4PR01MB14867.jpnprd01.prod.outlook.com (2603:1096:405:25d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 09:15:34 +0000
Received: from OS3PEPF0000003D.JPNP286.PROD.OUTLOOK.COM
 (2603:10c6:10:1b8:cafe::6a) by SY6PR01CA0111.outlook.office365.com
 (2603:10c6:10:1b8::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Tue,
 20 Oct 2026 09:15:33 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 8.62.32.50) smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 OS3PEPF0000003D.mail.protection.outlook.com (10.167.240.6) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.15
 via Frontend Transport; Tue, 20 Oct 2026 09:15:33 +0000
Received: from [192.168.1.82] (unknown [10.226.92.108])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id A627A3000278;
	Tue, 20 Oct 2026 18:15:25 +0900 (JST)
From: Diogo Ivo <diogo.ivo.sx@renesas.com>
Date: Tue, 20 Oct 2026 10:14:57 +0100
Subject: [PATCH 3/8] dt-bindings: i3c: renesas,i3c: Add RZ/G3L support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261020-divo-ssgrlpcsrc-2966-i3c-v1-3-30a47f25e515@renesas.com>
References: <20261020-divo-ssgrlpcsrc-2966-i3c-v1-0-30a47f25e515@renesas.com>
In-Reply-To: <20261020-divo-ssgrlpcsrc-2966-i3c-v1-0-30a47f25e515@renesas.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792487702; l=1458;
 i=diogo.ivo.sx@renesas.com; s=20240529; h=from:subject:message-id;
 bh=moSSIFc5R9RXrfvyZOYQPkyA8EVW1TtWXUUW0JyawdY=;
 b=A+dGjHzcgCphIHr7G3mZbpbBztXyZ1rhFwLpv3/L8g3vAkGHnYjAyEruodpd4qBFtaeR+TkSx
 ruPcldBMzkZAIWxteLjNBNADRuHc0lf7UX+yMAY8B/3XImjXkhyHMD7
X-Developer-Key: i=diogo.ivo.sx@renesas.com; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PEPF0000003D:EE_|TY4PR01MB14867:EE_
X-MS-Office365-Filtering-Correlation-Id: 0acae176-a64b-441a-f5a0-08df2e8ab1bb
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|82310400026|376014|1800799024|7416014|18002099003|22082099003|921020|11063799006|10067099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: MmtsTtPHxQB8ztzg0oTAPMyDTG+3M5W0H6cvV5P6Cn2/ZfQpAQgaiWNW7oQBQ0/X/tNu3PO4mEsHV88IPlDwmhf+52PxrhHyA5Wz3u4qCMrpQxCyK3fFk3gjtK8NFuvSbEZ3OvC9SqkqKn/GODHmWz9bI3cEPkS3BxJ7BAvxbJcOTD4cybTA0uIkTQx4y/SENd97EG5wHpzNf+LaY86Enmj9B22NRuj4RWUbhgkwaJyNgi9JRe+Hj9nKPkw2lmj0qEtihXX/OHbmF5h1NVpPijlFkwwMKq3HG/ACnB9rjVNGlQ1AJrsyeVtmljCR2Qxf+6yu8XmOrSJZl7NgB5iREbDLZZjFGW9hhQA6LrBOobF4SHKrNwdaMkstvCWLLc/Tt+V20ew9pbDX8b+YUBfJAnOWV3N4AHaJBDH/vCLNmLBrZVUF1yhetRbJE3N9EgyBEKvPzxHonR1o1x2ffET8f8SaF+DSFzdHbuPfDKxvL069dX2HIZjm8om+gsso5c/T2UsByz+f3Qs7P8UFPsCm3ZICUtBWlPwKCY8h0e+ysRNx45gJ81RzPtUgsOMKXQSNfc/DJHisZ5nqXj5yQIG6rzm/BUeKYSfb1FaamoN+uObXe344UJIj8gO+DHEl2T9rKHpxgNVMT6czLYLN9SjK1DhalmVN8AktzDLokeMqBKuNCdTwbMc8D6ZhkDpdumT/4X6vbclxmtSJTmTlVwcncL/7LTap/D7NcaEbY/fkgWD0DAMxqAq8YRi3FmeVKrgu
X-Forefront-Antispam-Report: CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(376014)(1800799024)(7416014)(18002099003)(22082099003)(921020)(11063799006)(10067099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: VUlD3Z7DLpsccrHc58Xig+9HHYswn/64Ws1HgryOtYvpJBSEAyxn2frITUlGMrpDeMJNyg3HkyL6X7osNk0TOR9wQWR/6fRuGOsVhb521IwToLuABJUHFhES1ItYA/9HVl2tUCVAEV96orMEK4QsWsOd+ky9316thfNnAOYjIOrNDXXPcoY94nYv9WX74YgpLIJGrBKuYRbzyoxOJ8JFfUSoKpBV4um7ak968VBCOXSG0X2ImBC0b43SPyOF0B0Mscn83i7EY4MM59LH1h0qyfudI1UTUZAJT6y2Qg7Srxdclh7ABVdknneAEFvqutu8PmJyFewT3qT8rkcxhIpyEXf1YvSIZy2wujQsEXUdMFL2fkBXB4K5Z95lWc+BIcfr2Ji7o8KLItIEaSkTI75gvpHK45WhLRpXffP4f3rU01UXg6cpc9VvU2xziq55vLFL
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 09:15:33.1514
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0acae176-a64b-441a-f5a0-08df2e8ab1bb
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: OS3PEPF0000003D.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14867
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_021554_387008_DD8A72D2 
X-CRM114-Status: UNSURE (   8.85  )
X-CRM114-Notice: Please train this message.
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

Add support for the I3C Bus Interface on the Renesas RZ/G3L (R9A08G046)
SoC. In this SoC, the controller has no HDR Exit Pattern detection
interrupt and no SFRs clock, so constrain its number of interrupts to 16
and the number of clocks to 2.

Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>
---
 Documentation/devicetree/bindings/i3c/renesas,i3c.yaml | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml b/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
index a20d875086d4..08fcea89a015 100644
--- a/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
+++ b/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
@@ -16,6 +16,7 @@ properties:
       - items:
           - enum:
               - renesas,r9a08g045-i3c # RZ/G3S
+              - renesas,r9a08g046-i3c # RZ/G3L
               - renesas,r9a09g047-i3c # RZ/G3E
       - items:
           - enum:
@@ -125,6 +126,22 @@ allOf:
         interrupt-names:
           minItems: 17
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a08g046-i3c
+    then:
+      properties:
+        clocks:
+          maxItems: 2
+        clock-names:
+          maxItems: 2
+        interrupts:
+          maxItems: 16
+        interrupt-names:
+          maxItems: 16
+
   - if:
       properties:
         compatible:

-- 
2.56.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
