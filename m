Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A951ECD3427
	for <linux-i3c@archiver.kernel.org>; Mon, 11 May 2026 03:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jz4Y5R8vL5MGi918smQNpbWmx2YXJIh6jRsEu3SwysY=; b=0FjoVFrknEAwY3
	McZMSZ7cJOrzo+XshsloMl8IEnu0PNK6jt8lq/oDLAyK7BBk5V0B+v+dGH8MnofSXYHCfkbORki/W
	2Lr6th5oAMytRQ4PWteU2Rbwfn3tPyiAA1exxC8jEfrSZbcj0ydMYWCuejoBOpBKNpLZ9VQ2kKTiQ
	OVq/ZUtqv2Oah5axwQb5b+Vk/qQtJzcj8ZUNPGSQASsqtJY080qD3x0oHPTa9g8HcvWxseA3N3fzX
	Y1P1WeFcyBkagFXEC3AJmB9GnatzMw8BRdfGKXCkQi2UM/Q4Y+fB5VQM6IXgjDCulM1pJr0IwKskK
	G1E1UH7IBc98sqMgQ67w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMHTp-0000000CBrS-1XmR;
	Mon, 11 May 2026 03:38:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMHTm-0000000CBqK-3pQJ
	for linux-i3c@lists.infradead.org;
	Mon, 11 May 2026 03:38:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 320F2444F8;
	Mon, 11 May 2026 03:38:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA885C2BCFA;
	Mon, 11 May 2026 03:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778470730;
	bh=3UYbbKOfOuDzGk8Gygj16ojfINq8KrHhMxShhNP4nmc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eQaxK7QGPdBptyGRe5L4qEy9X0f7M8P1oDDmjhDrc/FIguo+mzjr5bLCGzn59oLwQ
	 wfsVii3zs2NebuDKQ5t+36x8QbvaH2hN2J65GiZbKFNWAi2GsESeNnwc0nC0m0L5eM
	 SHKSbsWAkU/HVfN7A4OKrAMm+hFajrcKhnhmCd2j/Ft6C8qhGswwEssGycTfPB/3lL
	 7BjIoKHrqfvbw4eWo0RF3X7FzB7ibyvU47QM7Wt6KOGQlK9PGTm4KVei25tzy0vWDG
	 VgnD+6Ha2+FiAA/i5LhMfw62XSY4kSArX6FVvFOcpkc4UgjkCZyxSqN6kL/5PSQF1i
	 CsTyw6n023cnw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: i3c: dw: Describe core reset
Date: Mon, 11 May 2026 11:19:43 +0800
Message-ID: <20260511031945.3228-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260511031945.3228-1-jszhang@kernel.org>
References: <20260511031945.3228-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_203850_969651_0DE948C0 
X-CRM114-Status: UNSURE (   7.16  )
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

The core reset support has been in the code from day1, but the
dt-binding doesn't exist. Add dt-binding to describe reset property.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 .../devicetree/bindings/i3c/snps,dw-i3c-master.yaml       | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
index e803457d3f55..613dce7757bc 100644
--- a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
+++ b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
@@ -35,6 +35,14 @@ properties:
       - const: core
       - const: apb
 
+  resets:
+    items:
+      - description: Reset signal
+
+  reset-names:
+    items:
+      - const: core_rst
+
   interrupts:
     maxItems: 1
 
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
