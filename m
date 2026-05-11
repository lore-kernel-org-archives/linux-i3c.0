Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C78B9CD37B7
	for <linux-i3c@archiver.kernel.org>; Mon, 11 May 2026 03:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sz+T2V4eyT8mY672tKvWdNAH2sW+r45XtzxVzUVpW/o=; b=dd6UMtDh30C5hQ
	fEcgJWKAO6UvLNOfegVw5AEyVBMyOwhuk7NGoFpd3PheDirVmGZ7416RWHSpdHrlhjD2OiZbNOy6+
	SnWA5lpxssuHzEuFuKPzw9JNRpdk7iJDRJqg9Lf2XoEW3vb7Xwf4GGJug/W4IWPT7xqpNREDnCS7V
	qnOnpySuZCH0HKFJOV5bWtTUhBlvGgcXSwtSg0Kx1PGon7torXHU4Eq4Z6E+76G3TG5LaSPCrnEQJ
	997fjfwuYD5naIOt9Wjy5wk8t7fEDUUXeMDBc8iBKQ424NwaDk1Ogq4TuKzn3DDF1S/dBgORO4TtY
	XCg2fh8BtcIEuACESOOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMHTr-0000000CBsR-2CGB;
	Mon, 11 May 2026 03:38:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMHTp-0000000CBr9-0TMS
	for linux-i3c@lists.infradead.org;
	Mon, 11 May 2026 03:38:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C5FB6444EC;
	Mon, 11 May 2026 03:38:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C383C2BCC7;
	Mon, 11 May 2026 03:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778470732;
	bh=ZzSIS0T2I6SH70gPb1462rezvQzGyTgouPvultM6eyQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DNWbZv/xXoW2egK8tcF45oUuDZlfHylT9asN4+nVwUkUMwBd0pAI0SFdDAD6QPnOm
	 tNBEqyjeCVsbdS1AvrGqRPSH5hx/cjvXm50+0nj/tvqExgSAVEAMnqIwmKPoRsg4Nj
	 M1bS6qde+cPDg5D7seX1ybO9NXIpqQz17dCBerh+gCyycfaXgCRILBkok5z9Ro7Rdh
	 HI4zxwAYXKk5RzI9z65ETvyiElOpIeFbyjS2Cgg8aH8B23dLxa+gsjr5Kh+fP2VbBn
	 7/DuUopyohAnP5N93T/0VXlVp78MYzPxywEbbjvlkItsVnN2khwjM2GT3fldDmKLL4
	 69hNU96DcOiiw==
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
Subject: [PATCH v2 2/3] dt-bindings: i3c: dw: Add apb reset
Date: Mon, 11 May 2026 11:19:44 +0800
Message-ID: <20260511031945.3228-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260511031945.3228-1-jszhang@kernel.org>
References: <20260511031945.3228-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_203853_175207_F637BB29 
X-CRM114-Status: UNSURE (   7.43  )
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

Add dt-binding for support of apb reset which is to reset the APB
interface.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
index 613dce7757bc..2575442b28ff 100644
--- a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
+++ b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
@@ -38,10 +38,12 @@ properties:
   resets:
     items:
       - description: Reset signal
+      - description: APB interface reset signal
 
   reset-names:
     items:
       - const: core_rst
+      - const: apb_rst
 
   interrupts:
     maxItems: 1
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
