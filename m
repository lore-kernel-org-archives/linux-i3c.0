Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F79EE75428
	for <linux-i3c@archiver.kernel.org>; Tue,  3 Oct 2023 06:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S7crkwfsKqjuWj6SytgyfoAJ/FQ/yMhGyvRPsbHliyQ=; b=wyl6HdWwHWs6DE
	Buxb5sC1uLl72wH62R1SxlYabLPAihHHRXGvXoYhAn12iNtCffUvzvjW3oqjL3rTgmUiLMA6dkk9u
	1dF4H4eyloM+W146wpKee1hFSK0xHEmFtSUDp87PH2kJRunrI5mLgtpLTH4gowzOB2wMW2k2202v/
	03kkaC5whPEmSOm1DCznc7E8MoAaegqCzHj3RHPo26jVtslwE7lErgeZqeoIwL/VzNIUhEB8I5veW
	XiI3xCHQEIvMsrQIq3ZKQqSy2KsqVfSWKTIYtfZiqhW87/hQCadJM7Q7hq40NGThmzC7gYBGI8HQF
	XC3pFAPjfUA8Ivr63mgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnZ3y-00Dvac-1u;
	Tue, 03 Oct 2023 06:39:22 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnZ3v-00DvYz-26
	for linux-i3c@lists.infradead.org;
	Tue, 03 Oct 2023 06:39:21 +0000
Received: by codeconstruct.com.au (Postfix, from userid 10001)
	id 4AA472023B; Tue,  3 Oct 2023 14:39:10 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1696315150;
	bh=tovb2S87x1y3o+Y2Y18g/y5Y4b9kXOk48cxQwfY5Fgw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iOX64YiKAmOZeXsgc106ALnx6fVQZHxPwveRPiylyIgRgtCSHzlFgwlpmBVb8l18I
	 pz+qeV0mUsANiciDFWqjp8boFX8MVeQQjudqVRN+diCQjdr4aDO8hHSbZREbmcQIys
	 IrJ7ePJhj290yNsrez0bXFEMxZOlPp5rkeZGrlwaQfeDQQt9KzfC7pIfNAOOiqDAau
	 JiOCu605icDaDduWZv0YUnckbEYz6EaIuXrSW5GpZiVShCELxHALBs04foVMUdvW1N
	 fn30iHvVyrWEAV7KMT4G6E8/kp0a/KW9hzEGMmBR0FYbwD6/qkdLijjmOMtkOeDt9W
	 AIvem0mRX3Iig==
From: Matt Johnston <matt@codeconstruct.com.au>
To: linux-i3c@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@google.com>,
	Jeremy Kerr <jk@codeconstruct.com.au>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH net-next v3 1/3] dt-bindings: i3c: Add mctp-controller property
Date: Tue,  3 Oct 2023 14:36:22 +0800
Message-Id: <20231003063624.126723-2-matt@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231003063624.126723-1-matt@codeconstruct.com.au>
References: <20231003063624.126723-1-matt@codeconstruct.com.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_233919_884242_55511DFD 
X-CRM114-Status: UNSURE (   8.47  )
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---

v2:

- Reworded DT property description to match I2C

 Documentation/devicetree/bindings/i3c/i3c.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/i3c/i3c.yaml b/Documentation/devicetree/bindings/i3c/i3c.yaml
index ab69f4115de4..d9483fbd2454 100644
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
2.39.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
