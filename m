Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CD7CC3DA4A
	for <linux-i3c@archiver.kernel.org>; Thu,  1 Aug 2024 07:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xKm6g+kSp5go0yxdUIQXBD7RQlVOAY6iAFIUYNTfyf0=; b=EtlInNj1rH33f3
	L2cGHsgizMbcVdpyI/8a+6iJEVHqECd/oHEPfT2l7Q0JzCGVg2NSpT1N3pChzhwt3Y9OYWQquD6Zx
	DAxG+woLNECgEV6a71yPKLCSCjaUIYWtGs+GCu3PU0+gWaMdMGNIClzjsFCiucW7pUhmyUZA8yhN+
	+F+2L4yalhEKdMv8GIYHAv4Xm9+wxGLDYTkXTuaT0I3kujEtp7cS6bB33jBs6edDSHvdew5XRpOKW
	1EpLYOWUUtW5Iqm7MGfwmuirXhC9iohtCoagZqhn3/8WEeS/24ZnAABALFbM+LwG/c0uCB7Q/JMr7
	FpoE5muPvuBSxpx59RLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZQ8a-000000049Gi-0anl;
	Thu, 01 Aug 2024 07:22:12 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZQ8X-000000049G3-3uEY
	for linux-i3c@lists.infradead.org;
	Thu, 01 Aug 2024 07:22:11 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2cd46049d2bso1133663a91.3
        for <linux-i3c@lists.infradead.org>; Thu, 01 Aug 2024 00:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722496928; x=1723101728; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=evITfR508dWkC6GH2X8C7bD8ExWPXbUNlGzWar4VMrY=;
        b=MeQnE2t1oi8k80+CgFGY+JIin7gYQ4QX6kaPzBz8OvwQzwAd1a2JgjO3r9nh3T3GJj
         SJ1ou5GGxn3en3QRd17RWyo5FWr2sEFGPkUzT0Z1gQBYYe001ffqbiVQcktXAcskqxm+
         BsQK3oTWo0dz+qyuoHTpbXxb4vhlV12ar6qB3rxRvYSKTDCAZSmqyTRcRap++41e2tCU
         if3hChdUuoXB323n48ikTmB+iCxankUwMN+UxWusGh/qF+hr35qPmu/higjKKu2QkZba
         bwDTxOq2+8uMjQRhWZRKkcqEgHd4LyDECX6h5Z00fh4Gyh9ICMFOJ5HNnsnotI3Bwx2N
         EhZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722496928; x=1723101728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=evITfR508dWkC6GH2X8C7bD8ExWPXbUNlGzWar4VMrY=;
        b=M9Ro2I1dPDcsY00dOfPMr8HL6OvnnId8mao5nPKxmJT0aZAu4OtuIOy1dQuzSc428w
         sFGPHSw08Dg3VJw9P+2s+JKe6J4m6zQ1/vN87MMX5cQsaCylwTDjrLrhsMFl0cdxkOzA
         vhnisd4OTjvUvk4yw2GBZ5dsm7w1hk1ivLtALRarNnCNlVtVkLYgn8hzGsQEBSvtrD5/
         YY5DtCzQo/5LRT2/QFBlN+nkCzxQiCymxhWcKhaE7WJ2XiyJsb5y/ISMVyl/aiZcDarw
         0nax+E3B0xQezTwz9wQZWmoFC6jFprdfXRk1Ch/wF2uAyLOPuM6U1HvNjWUVyy73A8+x
         vmCg==
X-Forwarded-Encrypted: i=1; AJvYcCU8cTJYo0i9syCnCFOiIc8sK7yXt6x8pPfunY/1SYT69mVlDBJMEbNEEafBgoiCGKeHnNdGFk31I/0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwaqS0lFu7bUnUxUCEgoCDYhTVjhKt4OzT+TnnDp2m4/roAD5mM
	Fa26JvwvPlrmvqOi+n7yx+5wsTlLb+AWSzXXbjBhqJz/W7CsbZ/P
X-Google-Smtp-Source: AGHT+IFJpGO3IL36H7tUcsLnZ2gQA+/8iTcyIiSWhG0CYi1+kos5rW5QPv4Kv6rMtavF6ypKU2LbRg==
X-Received: by 2002:a17:902:e741:b0:1fb:43b5:8793 with SMTP id d9443c01a7336-1ff4d271611mr11171945ad.6.1722496928382;
        Thu, 01 Aug 2024 00:22:08 -0700 (PDT)
Received: from cs20-buildserver.. ([180.217.140.46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff4619793bsm22117425ad.120.2024.08.01.00.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 00:22:08 -0700 (PDT)
From: Stanley Chu <stanley.chuys@gmail.com>
X-Google-Original-From: Stanley Chu <yschu@nuvoton.com>
To: alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	linux-i3c@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	tomer.maimon@nuvoton.com,
	kwliu@nuvoton.com,
	yschu@nuvoton.com,
	cpchiang1@nuvoton.com
Subject: [PATCH v1 1/2] dt-bindings: i3c: Add NPCM845 i3c controller
Date: Thu,  1 Aug 2024 15:19:45 +0800
Message-Id: <20240801071946.43266-2-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240801071946.43266-1-yschu@nuvoton.com>
References: <20240801071946.43266-1-yschu@nuvoton.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_002209_993650_F5FC0060 
X-CRM114-Status: GOOD (  14.39  )
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

The npcm845 i3c devicetree binding follows the basic i3c bindings
and add the properties for allowing to adjust the SDA/SCL timing
to meet different requirements.

Signed-off-by: Stanley Chu <yschu@nuvoton.com>
Signed-off-by: James Chiang <cpchiang1@nuvoton.com>
---
 .../bindings/i3c/nuvoton,i3c-master.yaml      | 123 ++++++++++++++++++
 1 file changed, 123 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i3c/nuvoton,i3c-master.yaml

diff --git a/Documentation/devicetree/bindings/i3c/nuvoton,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/nuvoton,i3c-master.yaml
new file mode 100644
index 000000000000..a40b37b16872
--- /dev/null
+++ b/Documentation/devicetree/bindings/i3c/nuvoton,i3c-master.yaml
@@ -0,0 +1,123 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i3c/nuvoton,i3c-master.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton NPCM845 I3C master
+
+maintainers:
+  - Stanley Chu <yschu@nuvoton.com>
+  - James Chiang <cpchiang1@nuvoton.com>
+
+allOf:
+  - $ref: i3c.yaml#
+
+properties:
+  compatible:
+    const: nuvoton,npcm845-i3c
+
+  reg:
+    items:
+      - description: I3C registers
+      - description: GDMA registers
+      - description: GDMA request control register
+
+  reg-names:
+    items:
+      - const: i3c
+      - const: dma
+      - const: dma_ctl
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: system clock
+      - description: bus clock
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: fast_clk
+
+  resets:
+    maxItems: 1
+
+  i3c-pp-scl-hi-period-ns:
+    description: |
+      If need to configure SCL with required duty cycle, specify the clock high/low period directly.
+      i3c-pp-scl-hi-perios-ns specifies the high period ns of the SCL clock cycle in push pull mode
+      When i3c-pp-scl-hi-period-ns and i3c-pp-scl-lo-period-ns are specified, the i3c pp frequency is
+      decided by these two properties.
+
+  i3c-pp-scl-lo-period-ns:
+    description: |
+      The low period ns of the SCL clock cycle in push pull mode. i3c-pp-scl-lo-period-ns should not
+      be less than i3c-pp-scl-hi-period-ns and the maximal value is i3c-pp-scl-hi-period-ns + 150.
+
+  i3c-pp-sda-rd-skew:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      The number of MCLK clock periods to delay the SDA transition from the SCL clock edge at push
+      pull operation when transfers i3c private read.
+    maximum: 7
+    default: 0
+
+  i3c-pp-sda-wr-skew:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      The number of MCLK clock periods to delay the SDA transition from the SCL clock edge at push
+      pull operation when transfers i3c private write.
+    maximum: 7
+    default: 0
+
+  i3c-od-scl-hi-period-ns:
+    description: |
+      The i3c open drain frequency is 1MHz by default.
+      If need to use different frequency, specify the clock high/low period directly.
+      i3c-od-scl-hi-perios-ns specifies the high period ns of the SCL clock cycle in open drain mode.
+      When i3c-od-scl-hi-period-ns and i3c-od-scl-lo-period-ns are specified, the i3c od frequency is
+      decided by these two properties.
+      i3c-od-scl-hi-period-ns should be equal to i3c-pp-scl-hi-period-ns or i3c-od-scl-lo-period-ns.
+
+  i3c-od-scl-lo-period-ns:
+    description: |
+      The low period ns of the SCL clock cycle in open drain mode. i3c-od-scl-lo-period-ns should be
+      multiple of i3c-pp-scl-hi-period-ns.
+
+  enable-hj:
+    type: boolean
+    description: |
+      Enable SLVSTART interrupt for receiving hot-join request.
+
+  use-dma:
+    type: boolean
+    description: |
+      Enable the i3c private transfers using DMA.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clock-names
+  - clocks
+
+additionalProperties: true
+
+examples:
+  - |
+    i3c@fff10000 {
+        compatible = "nuvoton,npcm845-i3c";
+        clocks = <&clk 4>, <&clk 26>;
+        clock-names = "pclk", "fast_clk";
+        interrupts = <0 224 4>;
+        reg = <0xfff10000 0x1000>,
+              <0xf0850000 0x1000>,
+              <0xf0800300 0x4>;
+        reg-names = "i3c", "dma", "dma_ctl";
+        resets = <&rstc 0x74 8>;
+        #address-cells = <3>;
+        #size-cells = <0>;
+    };
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
