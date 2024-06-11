Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48496C27C65
	for <linux-i3c@archiver.kernel.org>; Tue, 11 Jun 2024 17:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=WCRwMdg/y2KZtRPD+tfywIYUZnJPSrw9gBu44IUKIO0=; b=S3xgx4EnHEyqn0rOpSJMqZTol9
	qgWVGaGzhuzPKrwLEG0svCCsw2/twCbtOOAXojT2PmD4rfyeI34wj2Ng8CbN28OTy/ieWUPUEf6e+
	Pr68csxNd0RG5rWgePw/nvAlUtfjUPwN2yESd/zIVojsEF5awQeqxfI4i3GJFFe/Luow2/teXnAX2
	LSLHNQn7ve7CZOT08nn9Qh+YhhjZsLiiIwU3YUXmeAnixq5NkXt9unTwZlq9JuQ5m3kJ05Fzu6td2
	vG9tw/umzpvi4go9ZM7XQ03Tkpjuhl0e7Nus/o8c0+oDCHdvPAQny3s55UySRFfumznM1ttbqYS0H
	0YPwFI2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH56u-00000009dX0-3jUh;
	Tue, 11 Jun 2024 17:16:40 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH56s-00000009dUW-1a7M
	for linux-i3c@lists.infradead.org;
	Tue, 11 Jun 2024 17:16:40 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-dfa74b3e6cbso2089061276.2
        for <linux-i3c@lists.infradead.org>; Tue, 11 Jun 2024 10:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718126195; x=1718730995; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=F/DGU+PznyeuU3c5ytQHTeE+L+VrUtxcZcMVxa+OmY4=;
        b=ga0lAEpBiLt5PM7bUABP7TcY6VmsLsQv36UaN1TZKuPzYKTWEnodMGSVm4pMQgaLmT
         ZGTTRmNoUyrI3fN46GeYKT3pUru7K+mlpOgL3bbEPvgBfgDYRcqZp88llheZaZPeUoQv
         NjOdR+tY4lPvNvDCYs2x3LhDCbflg1PEaCvFmF2Dn9rJWgBw0+Hr6s/6u3ODXsF006wT
         JKgTwejfTb4IBOrIcqCFcj/vhShEjLd7BASkyVrv/D8TDJRU4YzfXtj0o4ZL8HlelKvd
         CNLaiCo5CMOJDYyvwBFKZt458U2p/ahRvllOxJvErhsBtSDpHf70tAjlO4/+1hCkdmhN
         g4YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718126195; x=1718730995;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F/DGU+PznyeuU3c5ytQHTeE+L+VrUtxcZcMVxa+OmY4=;
        b=SavlcVg2z8FzFrFO5pjn+11OWixiehb42qxVzH3mHH53raNHzbdHKZJGt4ukEIeoG1
         1AoCsB0TW8vGi8iPGBPujxxjnQ0RSRfZ7nWGFWcI55ZHMP25RVsH2xRiaZamxgqhtg7m
         QaVEZigubQKXqW7sMVXhZM1QK5DwSg50fjSW9d06jI5uhBsmJ/LzS7dE+xSDDQ4/WHfz
         W7aN/uucS+e0l+4M1Kcw8++RH3WY9UhEAqe+bblfcnoHBYtIga7WxDYOreZVzk8Jqrn0
         nWdlOE4T6gTiFn8FE2f3iBHqtIFu5H+5qi6sADH9pH7ejLegOPn+JpHmP2NBEPS8EByy
         xdDQ==
X-Gm-Message-State: AOJu0YxVWn06rFgsmV+CWUxomdnUuTuysyTXhowqbNmkjCMSRLgRsHpZ
	FIy25huC0kd5fBsgTSIT8R0e/RCzL+LvXtkxq87HrHqf+0/ucl63MYLn34r0+ByWwcDfdRgyqMz
	/T8OC1Rmm0F5B4HfN+45HQqshow==
X-Google-Smtp-Source: AGHT+IHBusrZw8MLw8qciIrjtjK+WEfeMpPS8uwfN1BpXvw/8erhWM1AECRWM2Fcvj0GiFs+YyHVKKN4D1UD+9niggI=
X-Received: from aniketm.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:3387])
 (user=aniketmaurya job=sendgmr) by 2002:a05:6902:10c1:b0:de5:2694:45ba with
 SMTP id 3f1490d57ef6-dfaf636bf55mr3809274276.0.1718126194618; Tue, 11 Jun
 2024 10:16:34 -0700 (PDT)
Date: Tue, 11 Jun 2024 17:15:59 +0000
In-Reply-To: <20240611171600.1105124-1-aniketmaurya@google.com>
Mime-Version: 1.0
References: <20240611171600.1105124-1-aniketmaurya@google.com>
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
Message-ID: <20240611171600.1105124-2-aniketmaurya@google.com>
Subject: [PATCH 1/2] dt-bindings: i3c: dw: Add clock binding
From: Aniket <aniketmaurya@google.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jeremy Kerr <jk@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Aniket <aniketmaurya@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_101638_438799_6D6AAE82 
X-CRM114-Status: UNSURE (   8.27  )
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

Add dt binding for optional apb clock.
Core clock is mandatory. Also add
an example.

Signed-off-by: Aniket <aniketmaurya@google.com>
---
 .../bindings/i3c/snps,dw-i3c-master.yaml      | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
index c0e805e531be..7e3d4f308477 100644
--- a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
+++ b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
@@ -20,7 +20,16 @@ properties:
     maxItems: 1
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: Core interface clock
+      - description: APB interface clock
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: core_clk
+      - const: pclk
 
   interrupts:
     maxItems: 1
@@ -49,4 +58,12 @@ examples:
             pagesize = <0x8>;
         };
     };
+  - |
+    i3c@10400 {
+      compatible = "snps,dw-i3c-master-1.00a";
+      reg = <0x10400 0x1000>;
+      interrupts = <8>;
+      clocks = <&i3c0_cclk>,<&i3c0_pclk>;
+      clock-names = "core_clk", "pclk";
+    };
 ...
-- 
2.45.2.505.gda0bf45e8d-goog


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
