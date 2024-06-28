Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A73CC2BD09
	for <linux-i3c@archiver.kernel.org>; Fri, 28 Jun 2024 15:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=a6Al2mxSK9xfM7pg9xA8Ur8H0W5ryZrpOl5DADyZgIw=; b=RvNJ3TZv5w77C8E6swuabvIC8S
	lZSdECSA+pxRPgQk/XTjDRUD4T7vDFA6YNSNJj+ZhFpTPKzXhEfiMtExCAIPxhQmSjv57ATAChf+r
	oWKnkQrdOvM+s6SnuSO8xKp5IidY2LoET2SGpdCd9l+mvHJOUEcaLSK/QF4dMu2WNQ0GMkKKWTaNU
	WAnGnrPWVfRy8yLx1n3YpBiOQqSYGxdm6sJ8MCOZHip0fHLAoRM0QRVGO9NpAx0Y/3D8U2LTOh3YU
	W7pkrXMZCleMLPpwj7RhL+tZxOZ1H17WF0qn9ywR2adoSUg3i+lnC+md76gxoepIwFBnM4D+TWKRR
	URp/sodg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNDn8-0000000EFdX-0dLv;
	Fri, 28 Jun 2024 15:45:38 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNDn5-0000000EFbt-18EH
	for linux-i3c@lists.infradead.org;
	Fri, 28 Jun 2024 15:45:36 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e035949cc4eso1356011276.1
        for <linux-i3c@lists.infradead.org>; Fri, 28 Jun 2024 08:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719589534; x=1720194334; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yTiNPLIdhtP6pyhi64HYkOcFsA7q03RXOkGSgCbbU/c=;
        b=BuCtMEcuak46zAIor9gLKMIElwYwhqhw+GwbAt2bXQnrHYgYPUaCGp3nKH2X7FxTGQ
         CKOP74zK5l3un644PinUHBBiJ3KE0O3TfaHGrUeeTMENQ7UeF7NMP3PVRPGIdqw17d5b
         +pViMgo5ADe5RpopWi6vpxxhtmVDUYatFIXzNcexYiF1KXPlYhsMDvHryhWZOqLTVsey
         HpxdHQDm+liPWkcSZukQQG7JSr3c6j3zaM58URkzj+1t5Hr+GVxvAI+kXhNEQT5j0qxD
         B7dMZwBUWaLSB+WOIwUVywMU7jPC07gkS2KU8iZbSJnmjHrI6Dc9/VtGw7BANpWYJWBI
         +fqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719589534; x=1720194334;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yTiNPLIdhtP6pyhi64HYkOcFsA7q03RXOkGSgCbbU/c=;
        b=nU8Uz/YYPMGH/qGV5KcnEd2V7vTCfS8leX4Aggsd1r/57v73ZYMblJ6OgqrDbYtOGO
         BJdhMsX32CHtKvL1iYGZrQY1yuE8TIHzFVuTcbxYl7psrb19mDCq6cgh8YcgviXl6MOu
         klmzlHXg+xP/Pe2ASSn+O/Jn4XfY6p1OBEv1tjNLF+Qeio/fE6m7nYdoZXoys0hheTIk
         b5udzv+1ng2y25hmeW10KtJYhdDOWRD+USjde5hfc9UZ5L58uzGarJwUpc+gMdxjIBOD
         E47z+wuUTsgPJGB7U0ECzqhUCt3f2W+L0UhQ5j/e7k2ehm6rkNxMD77gzru1GzLhkRqs
         LU7A==
X-Gm-Message-State: AOJu0YxIQnC4umOUAOl0dRCS8Wdhgn/AWerkSggqI/pgXppiF+4xvOzf
	cxpQo6Dh4E01hb55bs1B3459jnV/j2+Ebqn5y/RyDIrNphmKPqVwxbnPl9UlCsm2/JO5iLVFD04
	Ei45pb8jEUz5gF9bmxT7VYYHm0w==
X-Google-Smtp-Source: AGHT+IHW+w0N4Pm/D4C73M71WR7MUwhZIC3G5b/P9aMWl8aREiz5+MCB11v8g9AB/i/7uh4YYcl8gXlJzUZwxH8Dwyk=
X-Received: from aniketm.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:3387])
 (user=aniketmaurya job=sendgmr) by 2002:a05:6902:1109:b0:df7:8f43:f8a3 with
 SMTP id 3f1490d57ef6-e0303e603bfmr1005307276.0.1719589533819; Fri, 28 Jun
 2024 08:45:33 -0700 (PDT)
Date: Fri, 28 Jun 2024 15:45:26 +0000
In-Reply-To: <20240624052851.1030799-1-aniketmaurya@google.com>
Mime-Version: 1.0
References: <20240624052851.1030799-1-aniketmaurya@google.com>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
Message-ID: <20240628154526.324068-1-aniketmaurya@google.com>
Subject: [PATCH v3 1/3] dt-bindings: i3c: dw: Add apb clock binding
From: Aniket <aniketmaurya@google.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jeremy Kerr <jk@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Aniket <aniketmaurya@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_084535_326594_CDA9B75F 
X-CRM114-Status: UNSURE (   8.32  )
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

Add dt binding for optional apb clock. Core clock is mandatory.

Signed-off-by: Aniket <aniketmaurya@google.com>
---
 .../devicetree/bindings/i3c/snps,dw-i3c-master.yaml   | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
index c0e805e531be..4fc13e3c0f75 100644
--- a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
+++ b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
@@ -20,7 +20,16 @@ properties:
     maxItems: 1
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: Core clock
+      - description: APB clock
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: core
+      - const: apb
 
   interrupts:
     maxItems: 1
-- 
2.45.2.803.g4e1b14247a-goog


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
