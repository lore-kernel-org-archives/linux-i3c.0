Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD2A9CAC5A0
	for <linux-i3c@archiver.kernel.org>; Sun, 14 Sep 2025 20:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2XsLVVA19gyju52D/u48mO+Q2k8g9fX/yVovcU02qVg=; b=sgaP691O4iF3wH
	0pOFzLYimUYc2wz2lkkAPxfA0BY8GvZ+DK7Pg/QlP+hsemuPotu7GFFYnoN7+9tg2OuUEvYQk35nT
	bWuQCoxpXjaW7JeGyMUeM3GTRLYNAIGdj8RZfo6wKWiu9W0HUM5D7jUw9xeZ3NcUaVk9WM4SdbpZ8
	H3iYd21opHj17EEsOJoFp0//XXQtc4ww1tAaEAQQu9ZHfdbZGiOhuTz8Qy7E9MfEo4fKAAJPoz9mZ
	bagKtDcR5Ak2tdIpJC+svGtcJkOhMsObxnoKBkfkwg06Y91L7Fvts6UOEV9CFfy6I1haVsGfMQZtv
	YKwntHWJeaAoefKesCwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxtPj-000000029ws-2Um4;
	Sun, 14 Sep 2025 20:33:35 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvYLc-0000000G5wr-0OTP
	for linux-i3c@lists.infradead.org;
	Mon, 08 Sep 2025 09:39:41 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-45dcfecdc0fso35328335e9.1
        for <linux-i3c@lists.infradead.org>; Mon, 08 Sep 2025 02:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757324378; x=1757929178; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FoNTng2g8xGN+jJlXKEcyc5Crvqkyg1xAFD2CRuD0z0=;
        b=Xnxo0ano9HcT4zBlueCxxA5cPjaWqqbPsryqLinhKMdMIDQwnmB7Z9hWP6fdTgPIPA
         EpbH70uOpbQAAnkodkha5cWMTOeiA6yw8+Q5mgpccE865WmZYPp29U7LJUli8YTGRSu7
         fnzjx97U9wJGqabfw5QSkCdfDvZezl4G19k9tSvWJ6YzdbWF7HIO3A5HPnv6M9nFzFp4
         R6WQAUMEz/sY5q3iXfHXjo0r10t2CgeyMr4Kp81n7gqwkPpfGmsxAzc8V24G/LCSHETI
         aTITbf3QhOZde+kF1UJ8Sj6e7q0lbl4u3exAqRniFsYrJ3+7xqZ33vSQr8ddYjBOudzU
         PTmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757324378; x=1757929178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FoNTng2g8xGN+jJlXKEcyc5Crvqkyg1xAFD2CRuD0z0=;
        b=TAvGBR80oez+AI338mog44BkJUIsaD2rSNzwJC5OgjNGZzsnaMIKyCYhlPJn9AU8EI
         7b/Ix9/pR7WdhuOndDV1xaTdEJ+OY+5SJZiIW+NtLKswsoHP64RuxGVBJ1Uid5VG2+r+
         b8Wu5nj9ddy8lS78WyLvJAYcJ3xYGgZQ+Dht4IhSnm+oSxMgI3rwzwsrKjHHRI9xvCb6
         WRqUZv5ClDzro55OJumfKzw1ztt4oVllob3hhlb5UatcciZU2KvncHYqyVK3MhF5Q7Ic
         C6Yszd9hd7eixiLU1/4jvHWYhswJi2mln+BZiKbDZndB/vhTtJlvB15H2Un2hGkYiM8D
         a94Q==
X-Gm-Message-State: AOJu0Yy2cMOovDK8QK4cMZWKl0SgNzLaF8eC1geud+DjeGiGOjgua3HJ
	CIrZtjPti2ZEhgdVZbeqJgmMrQCC8a44xfxdSk7gdNoIvTzPIYFQspco
X-Gm-Gg: ASbGncuc1XFZfaltOMD/ZpnsLdJLSABOcwRSSxUiL4i8Wp08GLUud/zvQhuhijc85o4
	uWq0nRA9vWUYhGFxBXAHbvyhXbGPYBGRBcpLqSoFW42k1r1l0kgAYwamUnxNr3kQJd3cfTrJMTf
	+/pzh6kOx/oNU1FUOHTFdd+bf9H/Qgkp0I7zvSXwByVT5ypgyWaO/DZ90c6wkSbktebGPyJ4dcE
	9YXkzpRXvUnV5LaZJQfWoXCfbOO2tD4bmbGjIKXp1qIFJWYVHqQN19Bf+5lmm7pxAdBGA9yq0I7
	+0zhNWKc7axSxyKBJiuFa8kgYx53A3QMUYLSOGKde7jds0IwVe2/lQHLL9cSvH5UJvprd1N6z0Y
	I26U+WV5dU8Eg3Qf2tRKxoqDW2FbC3HgP+ctkwFylRc0vgEJ6IqRhLqSLyA==
X-Google-Smtp-Source: AGHT+IFml8PnnAXpMs8BuPR8osBQwIT2QiyRTX2wpse/oXtLeUZ88FAGrSWz/UMrvgXxN18WVpRXhg==
X-Received: by 2002:a05:600c:1f0e:b0:45d:e326:96ef with SMTP id 5b1f17b1804b1-45de5557e89mr31294655e9.15.1757324377828;
        Mon, 08 Sep 2025 02:39:37 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:393b:4605:1f6c:eea1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e8ab832sm432020995e9.23.2025.09.08.02.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 02:39:37 -0700 (PDT)
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
Subject: [PATCH v2] dt-bindings: i3c: renesas,i3c: Add RZ/V2H(P) and RZ/V2N support
Date: Mon,  8 Sep 2025 10:39:30 +0100
Message-ID: <20250908093930.12591-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_023940_133534_2FAB61AD 
X-CRM114-Status: GOOD (  12.93  )
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

Update the title to be more generic as it now covers multiple SoC
families beyond just RZ/G3S and RZ/G3E.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
- Updated title to be more generic.
- Updated commit message to reflect changes.
- Added Reviewed-by tag.
---
 .../devicetree/bindings/i3c/renesas,i3c.yaml     | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml b/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
index fe2e9633c46f..a20d875086d4 100644
--- a/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
+++ b/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/i3c/renesas,i3c.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Renesas RZ/G3S and RZ/G3E I3C Bus Interface
+title: Renesas I3C Bus Interface
 
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
