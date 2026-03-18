Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C56AFCD0B6
	for <linux-i3c@archiver.kernel.org>; Wed, 18 Mar 2026 05:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TQR61uD8B4T9B8cDKMs23kGPgkOJol4mLjXDSUE/Pl4=; b=YO0y9J0t2ywYKt
	hWzbRCYi5TQSiCNBqzt3r8LEMKDhLBy7EAC/ITTleI5LEyxvwqYe7VSESZrj3aq4XozS4sl4cWjS5
	RvQG2U8dO9SMR5JXhSyFJf3aNB7IjtILlqcyogvv3gRCTfB+doTF8pen8WehngNti7AMcDqO7299v
	34Z/FVC11sHVkTS7+WssxUQDNYGspNXQJf3HpPqk029elFuCHp2J15L4o9FkQdYeW8yJ221m74SMF
	4z9/bFPpnCVm/uCKpmk0Dhx22wlX9Xfr0TPRD987gcVFJdzwrIxVyKVYNJCBY+x0hexjUM4gJ/xfM
	j6XckdRwt7RWVQo6INiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2jqR-00000007o2y-3G4b;
	Wed, 18 Mar 2026 05:53:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2jqP-00000007o1N-3myL;
	Wed, 18 Mar 2026 05:53:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1773813207; x=1805349207;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=e6j7L6dyXdnkxCZknQIxwO1McnHAqOqVEuo1K+uWbBA=;
  b=nZJAqHgrbJWvO0W1+9Rsc4ODNwh2JiiD9U3FXPRN8wXA9dZShb/4UkYF
   jyCk/YJMeP2WYlizHdn25NMDAx4jPNWNzzfqUirHZmE6sE4lOU1Ob7D1w
   npo2D3yi7QDX9HUEd20xYq867D5bO5DM7+4V4DTp3NZzyDtxPOiIcGvya
   VNGCvV7zdZXclwG1JTLbPN/zi4ZemATQ9VwKA10g4F/fTuwRdFc4i9kex
   tU7UL44uKMSOtE4amhBUAeGPgt5m2nwe2c2b7KfML5+7NgE/zLP7sMlbs
   SJhfrfpiXBBkT7cNBva1ivJpgdIAgnSIEuDs1nob8dPz57ziJNnKQN0Km
   w==;
X-CSE-ConnectionGUID: TZ/u7H+YTQiHBRAlQQhOfg==
X-CSE-MsgGUID: O+iu4QjKQkOYHT2aTCWNYg==
X-Ironport-Invalid-End-Of-Message: True
X-IronPort-AV: E=Sophos;i="6.23,126,1770620400"; 
   d="scan'208";a="286208453"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 22:53:22 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Tue, 17 Mar 2026 22:52:59 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 17 Mar 2026 22:52:49 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <alexandre.belloni@bootlin.com>, <Frank.Li@nxp.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<claudiu.beznea@tuxon.dev>, <linux@armlinux.org.uk>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <ardb@kernel.org>,
	<martin.petersen@oracle.com>, <ebiggers@google.com>, <tytso@mit.edu>,
	<cristian.birsan@microchip.com>, <adrian.hunter@intel.com>,
	<jarkko.nikula@linux.intel.com>, <kees@kernel.org>, <npitre@baylibre.com>,
	<linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-clk@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH v4 1/5] dt-bindings: i3c: mipi-i3c-hci: add Microchip SAMA7D65 compatible
Date: Wed, 18 Mar 2026 11:22:26 +0530
Message-ID: <20260318055230.307030-2-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260318055230.307030-1-manikandan.m@microchip.com>
References: <20260318055230.307030-1-manikandan.m@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_225325_945929_02C35A77 
X-CRM114-Status: UNSURE (   8.74  )
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

Add the microchip,sama7d65-i3c-hci compatible string to the MIPI I3C
HCI binding. The Microchip SAMA7D65 I3C controller is based on the
MIPI HCI specification but requires two clocks, so add a conditional
constraint when this compatible is present.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
Changes in v4:
- Define and describe the clock in the top-level properties
---
 .../devicetree/bindings/i3c/mipi-i3c-hci.yaml | 26 ++++++++++++++++---
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml b/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml
index 39bb1a1784c9..a946a8920046 100644
--- a/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml
+++ b/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml
@@ -9,9 +9,6 @@ title: MIPI I3C HCI
 maintainers:
   - Nicolas Pitre <npitre@baylibre.com>
 
-allOf:
-  - $ref: /schemas/i3c/i3c.yaml#
-
 description: |
   MIPI I3C Host Controller Interface
 
@@ -28,7 +25,13 @@ description: |
 
 properties:
   compatible:
-    const: mipi-i3c-hci
+    enum:
+      - mipi-i3c-hci
+      - microchip,sama7d65-i3c-hci
+  clocks:
+    items:
+      - description: Peripheral bus clock
+      - description: System Generic clock
   reg:
     maxItems: 1
   interrupts:
@@ -39,6 +42,21 @@ required:
   - reg
   - interrupts
 
+allOf:
+  - $ref: /schemas/i3c/i3c.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: microchip,sama7d65-i3c-hci
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 2
+      required:
+        - clocks
+
 unevaluatedProperties: false
 
 examples:
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
