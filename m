Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 493D5C2BD09
	for <linux-i3c@archiver.kernel.org>; Mon, 24 Jun 2024 05:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=VbDTvCO1Kpr9wjT43SOQS3lrLHTGS5TjQxU7tXSrpRk=; b=gizNr4llrmP9Ebf0JcB+czUEWM
	bGxTTh/jtt8U8I3r+OjuwZYLW6c+PzfOjlM3BUdLrQJYeQpcHVHqGY2pDsFK3U/7DugoKs/xcZjM/
	hcWv3WGImncL1dG+Ddtvu5hrowOmYQRI1jowfUU1xToJMZSFTzwH1Fr5pmP4pMWa4KCm+epl3mUWW
	KXfBkrlhU9dbbq/1YzA/tGb/P7KSU1PwZEZA8s97Tq7OcOdgr/zqw+yeZB8pJTsLlnMxgYDh8ei/A
	CPf/FeLnjVInWX0Zx4FWK8M4Dza1j9MndVSUpjuDinbl2GUX1J6Eshd1W4Mz7AcltrewDTdVHmuxq
	qQ/qTFXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLcGR-0000000Fbh3-43Yi;
	Mon, 24 Jun 2024 05:29:15 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLcGP-0000000Fbfn-2KbN
	for linux-i3c@lists.infradead.org;
	Mon, 24 Jun 2024 05:29:14 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-dfeff072f65so7498253276.3
        for <linux-i3c@lists.infradead.org>; Sun, 23 Jun 2024 22:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719206952; x=1719811752; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xRFts49NKsibYysZG1mN4zOHSnI8JrcU21XVbqexR8c=;
        b=vt9UOH8KEpXd5dZDrMzbJmiRlEJk1SDLHBXrPX+Ns81+GdG3uAk33381QXNGVU3c0v
         HVBYkcJ231pvjW2jjsRLAZvMlo4NYr3sdP3meHnJYunni5u6vE2ZQosolcQaKDOT+Xrm
         wkAsMSlEyEkjzMjLLAb+D2o7OrQzJl8skQnpgfRHosrM5+31Tc9eWyiyAZkw6U/xMMZt
         UFZgqEaourlTs2SpObeu68Kcqf/s9m6cm6gFKR/1sq/cLlRYA/fTEB7Ftaqo49Kqp6pl
         8ONndFBQYOBKqEr5jOgcBxlxuFEa4e03Je9CJZYNw6cBMTe2mOd41hqSa2VFq7+dn3B7
         hXBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719206952; x=1719811752;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xRFts49NKsibYysZG1mN4zOHSnI8JrcU21XVbqexR8c=;
        b=YGHY2F8thXOL9XPibtNwuCDh/hfJI5xwsDiGkXh0I5nFFNKvKf2trFQc+6+LvB3ICO
         ZCDP3mpXgi+LpIHWBVjxXLr4HdUaNWq6LqZaEvEY4M4UmkGDi8Hg+RR1gj0CsgLbTaKw
         DqhHPqFaedi5wuF8H+ONSwKrBSLWcQnxmNPlGKJ/tgfNueXM+8P/a6yj6/FDuq0MZw/6
         tsEirc9M3ARSVO7KS1dSxABB7GDql9kMkoH/8nT90EkCdeUYubqwTfxZ7ms8FWp59OE9
         IBZfof/my7oJGCGi23H77FIifUUV3kPaGzVRQQ1lvjzdbcwNuP2dzLJW9fnrZNZ7vqgU
         23wQ==
X-Gm-Message-State: AOJu0YyPviNTOZBg5ISsal8B6OFRO5BpgeNwmh509yyCh3LlvlO7WzEb
	GSz1IB2pCPHoU9CfhO51BJDYEIW+g72Bz55OmQEaDKA8m3kQp9qYvMkZ9X1IXkHZcVkVfdeTMXj
	c9qxjX8pJn6SJ284/vD+IuMekAA==
X-Google-Smtp-Source: AGHT+IEPFtuLDU7qM5B+Hh1VvGYKz7iFDuXzYucZ4EYIl/bThe8hJCvlk8EEUhg4hesztK7Po0cAT9oQQFYv0eq6Ez0=
X-Received: from aniketm.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:3387])
 (user=aniketmaurya job=sendgmr) by 2002:a05:6902:1006:b0:dfa:59bc:8858 with
 SMTP id 3f1490d57ef6-e0300f01d20mr12307276.1.1719206952193; Sun, 23 Jun 2024
 22:29:12 -0700 (PDT)
Date: Mon, 24 Jun 2024 05:28:49 +0000
In-Reply-To: <20240624052851.1030799-1-aniketmaurya@google.com>
Mime-Version: 1.0
References: <20240611171600.1105124-1-aniketmaurya@google.com> <20240624052851.1030799-1-aniketmaurya@google.com>
X-Mailer: git-send-email 2.45.2.741.gdbec12cfda-goog
Message-ID: <20240624052851.1030799-2-aniketmaurya@google.com>
Subject: [PATCH v2 1/3] dt-bindings: i3c: dw: Add apb clock binding
From: Aniket <aniketmaurya@google.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jeremy Kerr <jk@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Aniket <aniketmaurya@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240623_222913_614397_E27E4DC0 
X-CRM114-Status: UNSURE (   8.03  )
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
2.45.2.741.gdbec12cfda-goog


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
