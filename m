Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A04E5C7EE43
	for <linux-i3c@archiver.kernel.org>; Sat, 10 Jun 2023 08:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KrkMeSVLwShe43iaZno0J0pUU4ew3g6IMJc18WWsD2o=; b=ZaELEtpfzMSKMD
	yfiTwTMDlvncFfQVQK0hyq/HSItm2/quF+GsxD0AcGMcfpq+CJKy46klecj31PN/UO9ey0HMg8uJd
	UFGUyXPQQ1ja7Q2Z8mDGLW4Yzhdt/w/iUMTgNig2oY5wAGRL+SND7d/4G8uih/7QWmrCRGhyiCCVg
	kaiig5QZAhfhJk4lma/puKAYGmTM6SZ77LGtFAQDqLNd7sMVttgMZhosnbrB9r7vdR6eteTE9U2Rb
	H8Y4ipMl64W59l5NCgzoDBgYYVDDV3HHpjP0YM7lEgCYvz9TwQT2/kLrEQDXRR2CLBPdDMC7nqIxz
	l2oMI5NqmtacjTgoXWGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7taH-00FW2B-0D;
	Sat, 10 Jun 2023 08:04:29 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7cpg-00DDYv-0F
	for linux-i3c@lists.infradead.org;
	Fri, 09 Jun 2023 14:11:17 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-97881a996a0so331953566b.0
        for <linux-i3c@lists.infradead.org>; Fri, 09 Jun 2023 07:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686319871; x=1688911871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/K6Rw2BBP9t+cXD/TQNNgIcmDtvMs3lPtOP/UrH7G7A=;
        b=h8iBAptxQttk0bbiDQovJX+21DX7qKwXrBnmFU8s/hafPH5IMfV9JPDAnfrO9dj6LG
         xbVO/VZyIdyOy+iWQY2QwUrj+zWEwUCd1q9HZyskeaWGgKuHNO/hBaOhA/9XhXYiwaLA
         ReYu7KIrqSfnbXk77keMmhg2OTqBdxE1V08BwbchEr1OTpsNuUGhsCXgijheYy3u48TX
         QYcbO4W+WWycTcDRWTNPX7x6+spFetTqAcIq7U2UY361cix5dzfM9r+jDvPGSGczvFGS
         Llh1ycz9FWXTU6b5OxEbOZ4ImHtOv+ooW6Qu+JQ7BN8bqyECz0v37mlfsPCtm8TrFpiT
         T61Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686319871; x=1688911871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/K6Rw2BBP9t+cXD/TQNNgIcmDtvMs3lPtOP/UrH7G7A=;
        b=E9kx8/+ctekZaY+4SPhtjYg6XCRk50kuzY+4aza93/zinsMviJrdcpGEqBZK0c4jsC
         JUZQPU19wIFjt+LSTNeDlDAO4IAKhgvLQe8653RyL0DKJXDqPG7XdhAYwK9Iukf46Ccc
         JHFtxGRP8tJukSBrZNG396/Y5cMviNw7tWdWKo3TVafTN7Boy0tWYwqVaxXvob1eSOjH
         PPVUzFFm3hOMeAri3IlLfwgqtLxPKKjB7ZdwlG41u0TtpetKyIDmbJyxgE9wp3oVmCrz
         fcyyavYGg01ZM0A8dtHY8d6rdNGIbSoUg1G83W7XP5uUulAj6hmQhzEAOIXHCLpR479R
         b2Tw==
X-Gm-Message-State: AC+VfDxBtJZ8Edjr1VFr4PWuQUe246eOBR1p5LybN3lLu9ncgEVx1MKs
	Hm9V5SFOwfcMjVrbwkdg1Bt3ow==
X-Google-Smtp-Source: ACHHUZ72lwQsFlXEqj6bo/VjtGXzWFH6QAIcDwwdCZXs2QTBJ0U74KDahv1uUbSVB3/zT/7EcJIc0g==
X-Received: by 2002:a17:907:9686:b0:978:acec:36ab with SMTP id hd6-20020a170907968600b00978acec36abmr2278703ejc.35.1686319871665;
        Fri, 09 Jun 2023 07:11:11 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id r8-20020a170906350800b00965fdb90801sm1327704eja.153.2023.06.09.07.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 07:11:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Conor Culhane <conor.culhane@silvaco.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: i3c: silvaco,i3c-master: fix missing schema restriction
Date: Fri,  9 Jun 2023 16:11:07 +0200
Message-Id: <20230609141107.66128-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_071116_117281_3A29A372 
X-CRM114-Status: UNSURE (   9.56  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Sat, 10 Jun 2023 01:04:27 -0700
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

Each device schema must end with unevaluatedProperties: false, if it
references other common schema.  Otherwise it would allow any properties
to be listed.

Fixes: b8b0446f1f1a ("dt-bindings: i3c: Describe Silvaco master binding")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
index 543b177f8610..133855f11b4f 100644
--- a/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
+++ b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
@@ -44,7 +44,7 @@ required:
   - clock-names
   - clocks
 
-additionalProperties: true
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
