Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA543CAC59B
	for <linux-i3c@archiver.kernel.org>; Sun, 14 Sep 2025 20:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XHBuz6T/+zdl6kXcPfPK82xZ4Dp1SZLiSugLcnSoENI=; b=XRgC+d9XdMlPaa
	Cu/HeTX+bCL1iqk2Hh/8cjzxNdflN9maGo4BhHuK3dw60tqo5AOQrrz8LO+zPivC1zT6ZuBApHit/
	2Dhxmj5TukXNctTfooHqWuXv4qLiS0/t00GGxV7jtHjELhHwlkixZLqu9KLzC8qFzS6daLw3K1vKh
	JykybJXHHBPevArEG6X9LAPXEGok68nMAZSnDkPGB9Nxb6w3w+vG5TIDdp+IBS6crh1c7fvdQWNx2
	cby89rMR60vTyyOJQkQJ7Ux1oARvwcHyTU3SX0p0Vjkagi1DaMYs03GN0xDQs6nXF4jfPv5+SBhd4
	09sWL1B6VG8VILb5mIkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxtPg-000000029rg-2gMg;
	Sun, 14 Sep 2025 20:33:32 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuCQa-0000000CjPJ-3a1z
	for linux-i3c@lists.infradead.org;
	Thu, 04 Sep 2025 16:03:14 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-45b7da4101fso4560165e9.3
        for <linux-i3c@lists.infradead.org>; Thu, 04 Sep 2025 09:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757001791; x=1757606591; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=inlzeL92Q1+R3JzgzpZ5gZz+OI69SWz4CtAKRdZzkcw=;
        b=NYrttEwMBBhJZfefWmlgfp9bTcNj7cSmZYSW16R8fijPDbQvZBV/dRTWFZjZCm8EY+
         NppLtXk39oII2I8bcEGZmUT+JbEISm0Nh5f8a191hapHlWNFKAUChr8fcglH5xBWLVPs
         XS8Cj4ViADCIr0y/m/Y/kuFOFjqZtshfLsFmpjGYVc9Z++TVcOg6GUYj1LEO4CRHfjXH
         WP3mm8mPGoPOQ38TE/noHyBsP5M/v3iJSOHLH5C5V8lAT4ipYK2iik6cvxwGRg1ThbbD
         iJGvlcKe83BTpei0T2UEhncFaX/W4bQVfEdynRskwdxMM8Tbl1aWVYkkaohfClvaFsJf
         Gemw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757001791; x=1757606591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=inlzeL92Q1+R3JzgzpZ5gZz+OI69SWz4CtAKRdZzkcw=;
        b=tKLUemMtbuot/FGah1KWjUqeb8+YCuNBUbOO+YVzFXyKjKuHoH/TKVyFZ2in2gztNA
         i5UBPi05h8G6srd17reoA4w7zpKr5YzDpSVVbuBuNqhNK/5Ly4VzJGoBWPsIpxBWP66p
         X/JnF4Dxf15bUwWosIF1j6dW4/nAEDqLSCs1FjO7IbpRBSlqlHPmVOtnc+wh3tEyqDiS
         ggCisIbiyeQhNUm6ZUhqAL4vjFyrVkL50MS3urIRtr/qAU9G9Jt1MHINmv7PXblzBV1N
         wxXsY4xSdsOR1gbA4p/OTQrgmILSeufiM7C9WMASpR0v/DlwHS67MeirUiVo8DYMWxjt
         E0ig==
X-Gm-Message-State: AOJu0YxxI4V/zLsZhDiOD2n5X56zDUSJp/yLihlKQ73bHukiPc/9+n+p
	c9cYL+BfdofKkoRvNrmTuVeNeAgyl0klysDSnZGvw9T9mH7OoZB8xvhK
X-Gm-Gg: ASbGncvZg7hRkgujZLUs9YQMRMnolM96LSxFvWaYYiNHZuOJ5Qo4zbNDmOES12LXMFZ
	mO6yTL67xet1PVHhSTHPHt+tFraIxzmAR0DkBXclyKSjrUGjhyx5yYyFSivke35hm/0bphJvL21
	es1vW8uVfQqjAPxJlY0ZqUjs4FYuJAGNBwIlG800iBBOXqwP2KkmVqJECVAJn8D/XxwzBRoWoeL
	hRmeZAuB0f4LJUnq9Hlda0g4Yvn3MQAEshFgEznsCelKK1rakw9vGOvTy5TH37apwdQ3tVrIdbB
	Mi/MIlZdUvorAiILahMNQov3J/3FzjN/eqCwb5GqCWSoJYL0se3LkK1yPlxFI9fYE9GeZnDv5SA
	YMLyO/RNvNOut8b2KJzlqtBcblgpHUQ9SVo997yHLHhCjH8dG58skcdXdVw==
X-Google-Smtp-Source: AGHT+IFgIVReQPVQhz9k/P9YI/MxpwIZDmDNHMJlsOtsRqB1HD/exOoyXUahixSAJHYLjPaR1ELVcw==
X-Received: by 2002:a05:600c:4452:b0:455:f187:6203 with SMTP id 5b1f17b1804b1-45b855983cfmr146238965e9.27.1757001790426;
        Thu, 04 Sep 2025 09:03:10 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:904e:70c8:edf3:59a4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b98e77231sm117935885e9.12.2025.09.04.09.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 09:03:09 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] dt-bindings: i3c: renesas,i3c: Add RZ/V2H(P) and RZ/V2N support
Date: Thu,  4 Sep 2025 17:03:05 +0100
Message-ID: <20250904160305.247618-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_090312_892785_09E5AE39 
X-CRM114-Status: GOOD (  11.55  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add device tree binding support for the I3C Bus Interface on Renesas
RZ/V2H(P) and RZ/V2N SoCs. The I3C IP on these SoCs is identical to
that found on the RZ/G3E SoC.

Add new compatible strings "renesas,r9a09g056-i3c" for RZ/V2N and
"renesas,r9a09g057-i3c" for RZ/V2H(P). Both variants use
"renesas,r9a09g047-i3c" as a fallback compatible to indicate hardware
compatibility with the RZ/G3E implementation.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../devicetree/bindings/i3c/renesas,i3c.yaml     | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml b/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
index fe2e9633c46f..e41ba3ba4b58 100644
--- a/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
+++ b/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/i3c/renesas,i3c.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Renesas RZ/G3S and RZ/G3E I3C Bus Interface
+title: Renesas RZ/G3S, RZ/G3E, RZ/V2H(P) and RZ/V2N I3C Bus Interface
 
 maintainers:
   - Wolfram Sang <wsa+renesas@sang-engineering.com>
@@ -12,10 +12,16 @@ maintainers:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - renesas,r9a08g045-i3c # RZ/G3S
-          - renesas,r9a09g047-i3c # RZ/G3E
+    oneOf:
+      - items:
+          - enum:
+              - renesas,r9a08g045-i3c # RZ/G3S
+              - renesas,r9a09g047-i3c # RZ/G3E
+      - items:
+          - enum:
+              - renesas,r9a09g056-i3c # RZ/V2N
+              - renesas,r9a09g057-i3c # RZ/V2H(P)
+          - const: renesas,r9a09g047-i3c
 
   reg:
     maxItems: 1
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
