Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D164CEB64DC
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Jul 2023 04:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T5otSg7qejJMWnXs/PBG5ezP22yXeo8lSuiPJ+nOD+A=; b=qhZ3oar4VXtNim
	Quhh4w7yp3oNE/GDtEfAcOFWfvcHepesP7HGlmjPGBaGH15IZwjbJTbk/LINvumBNsRlGMayuiiop
	tsg1BG4W9tH3nZUZsBe2hUAhAN/RREL15u5e6MktXFp8+8hoILeK/Ma+jD/sTqn9mqlNOUlR93CVK
	Jr9ii/DCvRtYP8dot27Lac/St03OFzcCC9IiirPlsK8c3DgyF7ea4chtw/iXg4rp74dYdRqEXvlav
	QrOLbGsP//Sbv9Dx90ODy4ljfHUhPQ6lgPfjInw7iwBLFkmb1f5bD4w5qSQemdPbD25BDtGEVR2O6
	mu5vV8hG8rh1RXuWjNkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLFW6-001maC-1y;
	Mon, 17 Jul 2023 04:07:22 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLFW3-001mS1-0P
	for linux-i3c@lists.infradead.org;
	Mon, 17 Jul 2023 04:07:20 +0000
Received: by codeconstruct.com.au (Postfix, from userid 10001)
	id CE08120184; Mon, 17 Jul 2023 12:07:08 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1689566828;
	bh=6909hS4eCXpLD54uVYNkkdYhSqBOb+2n7qQgs3Y0m+I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PXe0KsEooYHIwcmeipKlZ18RBuObXbqxlm+7YOWpNiZei1uXGDcXUME2+5Iq/LeF9
	 lWmj75Vn2Aiv0rgms4NYhCdxffrSuWld7K8yobAwYUPcVG0Jxrn4++B+cLqXPNqzCx
	 XQhfG5dMJd5F4Z2/KXbCy+0AJClKnO1tUsvOXXfeuqZKX08RMmIocZ9fBEKboNePL+
	 TYOHwc2hzoGdiLW+x3U/iYGjrLRPqyOCySgSOUubT/xvQQTPIUAD4o/CDMk6UVcqD2
	 R26a0PnXmsBMlay6ZMLNhAA5dhlJgrpEE77Ms/JA6zDIYXhvhkFKSkZ9JNBDYyppde
	 ohGcL0hztNA4g==
From: Matt Johnston <matt@codeconstruct.com.au>
To: linux-i3c@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Jeremy Kerr <jk@codeconstruct.com.au>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH net-next v2 1/3] dt-bindings: i3c: Add mctp-controller property
Date: Mon, 17 Jul 2023 12:06:36 +0800
Message-Id: <20230717040638.1292536-2-matt@codeconstruct.com.au>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230717040638.1292536-1-matt@codeconstruct.com.au>
References: <20230717040638.1292536-1-matt@codeconstruct.com.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_210719_484783_7DB8DCF8 
X-CRM114-Status: UNSURE (   7.44  )
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

This property is used to describe a I3C bus with attached MCTP I3C
target devices.

Signed-off-by: Matt Johnston <matt@codeconstruct.com.au>
---

v2:

- Reworded DT property description to match I2C

 Documentation/devicetree/bindings/i3c/i3c.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/i3c/i3c.yaml b/Documentation/devicetree/bindings/i3c/i3c.yaml
index fdb4212149e7..b052a20d591f 100644
--- a/Documentation/devicetree/bindings/i3c/i3c.yaml
+++ b/Documentation/devicetree/bindings/i3c/i3c.yaml
@@ -55,6 +55,12 @@ properties:
 
       May not be supported by all controllers.
 
+  mctp-controller:
+    type: boolean
+    description: |
+      Indicates that the system is accessible via this bus as an endpoint for
+      MCTP over I3C transport.
+
 required:
   - "#address-cells"
   - "#size-cells"
-- 
2.37.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
