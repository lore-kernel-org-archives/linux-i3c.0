Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 923CECD5BD2
	for <linux-i3c@archiver.kernel.org>; Mon, 25 May 2026 14:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GMSMXxX6qy8WLu85GUkD47DustYpgq/oNUB9RPyG09g=; b=N8Sn02oZ2yim19
	AwKzrIS6utsNHfbddXGS5cKy6M8YRIgLYm1fE7+t/y8337CrToGBCgImHOlrEs4UwxntiGQtBJXME
	nEY0mWdLoegKJsGnVjVFfeB2Er369OgzPlBrDOZ7JHYUDezgC8u/l8vc9UsgDcicUEylg9ZV3io7R
	VRgDJZDehueMlK+E6KuCt1vS5DiSwaN2iQWF4J8bpxoGpB9T+OSuYfmnM+6/81PGf24yCCaB98+9l
	8YXOd0enLy954c9lddUvPfFIR116eMkt9etmL9OKtwpOS4FsG6AGjy6QGRWBVRmf42wfYusaB7HJO
	SCfYfa7vYN9v5rZBTm7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRW9V-0000000HP4O-1Cg6;
	Mon, 25 May 2026 14:19:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRW9T-0000000HP3x-2w3x
	for linux-i3c@lists.infradead.org;
	Mon, 25 May 2026 14:19:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D1FE3600CB;
	Mon, 25 May 2026 14:19:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02D431F00A3A;
	Mon, 25 May 2026 14:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779718770;
	bh=Qv9L4v59nSxJZ6rq82VRvWuscv9RAnRXi+EFaew9W6Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lmc7u84xKkRmn8qNJsvgsxIQ3lQn2ePaLhLD7O+BCHQOObM1BV4D8ySiLYdyL67J9
	 dJsjKLx4xard8BLFZ9jv2KBygpGZ9fafWv6DhhX43R2kh4WIIbRz231ni7pZGBdsQ0
	 4I81Pl95OQ8EHji8wu9NHc4ELp61ZzPfcCjS849u3OgQ01zSDPTm/uw790VX07T3zM
	 hvV1Acmt80DHPXCM5yeKN0hYDbKRV2jt0+gu9oKaPMDaxNh7vGQkuFaGawgHh1x88I
	 H3ptRMma+XyaFBdklPgKmYCgF7hLdfVNAF5Hu1D31X4H0UjdAAOrZi3Vo49bCk0ezv
	 5KCdO0tpLHCSQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 1/3] dt-bindings: i3c: dw: Describe core reset
Date: Mon, 25 May 2026 22:00:16 +0800
Message-ID: <20260525140018.19598-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260525140018.19598-1-jszhang@kernel.org>
References: <20260525140018.19598-1-jszhang@kernel.org>
MIME-Version: 1.0
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

The "core_rst" reset support has been in the code from day1, but the
dt-binding doesn't exist. Add dt-binding to describe reset property.

Then why not remove the "_rst" suffix? Krzysztof pointed out "Cleanup
of name is not really worth affecting users. core_rst is not the best
name but it is not incorrect, either."

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
