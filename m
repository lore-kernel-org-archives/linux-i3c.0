Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CDECC7EE2E
	for <linux-i3c@archiver.kernel.org>; Sat, 10 Jun 2023 08:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+Z6dIn/YSI4PMLPxgFRexU3w5Z+6N0srK9+kWPF7DP0=; b=SAo3EqBVi5AOZj
	N8jyPgkJdzM1lLqJqQn3fpYfMrYALKugYn8NydlDYclyd5po1ToAslzNSDN8zhA/GAi1baVWu3sgg
	e9446wLypcaoNKZrxzDax6Mnc1Ap9eBjtoFN1R3AiP7wt73sByde4jLNFnplvqVhWjN+y43rZx8YC
	Ofnbt1AO7AChTegrhQic8vMQiVNcjxxtCNvCuUauE4F5J90WSBkM+2BShTK1QSJjtUYctMV1nGGMX
	RkZNWtQhUKcErk4CSSEzdkaiEJ1HEvBZquIj4WPg78DVVOtPMiLFiAirkot+8no061GK42RE9CDKv
	waf1+P/9bkxrwnvESGwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7taG-00FW24-2U;
	Sat, 10 Jun 2023 08:04:28 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7cmD-00DCpA-25
	for linux-i3c@lists.infradead.org;
	Fri, 09 Jun 2023 14:07:42 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-51480d3e161so2757038a12.3
        for <linux-i3c@lists.infradead.org>; Fri, 09 Jun 2023 07:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686319658; x=1688911658;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZHO7vpOhYQx0clo/eQSsMDoAoRh8NI3AXk3LkWYJrvA=;
        b=UomGHu9e9xSud+fvhCguBVbINIy+Nt32q4XAikJT97lMKTKm3HPgMhhLX6IuwsxG6C
         IlFTtrHbH8A6Gqo5b8j1SOGNZm+CiQKQoje5e/5lrGhO51A7Z/EIVsCFQ8e2aScvc9mS
         ruZcnB2jUMqBwOWGFEwR/6Wrvj/l6N0vZhMRhAA8VrVy1EW+b+EWXVouAGB5bFsps0Da
         ZhH/uJvziOSJjcxvUXXjW5Z2L2CMAaOL4DLxAYFe7zUBHWBBc985NtsZikxTeAJW0aJT
         rb5525L/p6vTpbe0hvIQPxQ7CeZsRyPsdNZCyjzNinVutoS0Bh9kLtNpe/99FDtHjP4L
         Aczg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686319658; x=1688911658;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZHO7vpOhYQx0clo/eQSsMDoAoRh8NI3AXk3LkWYJrvA=;
        b=amd0GJtc12zZMd/7d/UZcek8FscN9nDAhncxhJkXRisRRhcgrlRC9gR8iz09HpUdIx
         ISjwyY7D/n8BEzyQn/wuuBgtDWbWycsYGix/bA4MqXh4KOGfkNObknQd4FkpfRzf6/GC
         hcBucxs2eL4bjnvrmXvUL7biRyidqFf+85y5iouUjZIN1hOYa8JEMkfbkcixhuzHA7P9
         z3CPzNZkaWC0MSzuiplx+qaHxOX7bw5wgs5nh18jzk+vUOlxsErFWFuwY7Pc4K9eGUCj
         7wIZN0WR/9bTuNksZjY0SC+2Nm72sYJToFvC4+W4/bUE9Z6Of0erlPlQ2CLViYUm6yzo
         SZsg==
X-Gm-Message-State: AC+VfDwOMhyP/9GhZlxueuXz8STPGZdtLoR3Je9VsXaXT+QFyZZnMkKP
	Wip7dzweHSpQEzD82EiYjBX2Qg==
X-Google-Smtp-Source: ACHHUZ4Ppp4dcuJtxj7Mzp5FZ/ew+7eEGU8lcR9YSExvb8u+Zk2l/gqQKALPR58wRCRl08O97AFDNw==
X-Received: by 2002:aa7:d986:0:b0:50d:9e7c:264d with SMTP id u6-20020aa7d986000000b0050d9e7c264dmr1345447eds.8.1686319657821;
        Fri, 09 Jun 2023 07:07:37 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id g16-20020aa7d1d0000000b0050bc4600d38sm1819861edp.79.2023.06.09.07.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 07:07:37 -0700 (PDT)
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
Subject: [PATCH] dt-bindings: i3c: silvaco,i3c-master: drop unneeded quotes
Date: Fri,  9 Jun 2023 16:07:35 +0200
Message-Id: <20230609140735.64855-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_070741_690222_4986CD58 
X-CRM114-Status: UNSURE (   9.30  )
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

Cleanup bindings dropping unneeded quotes. Once all these are fixed,
checking for this can be enabled in yamllint.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
index 62f3ca66274f..543b177f8610 100644
--- a/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
+++ b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Conor Culhane <conor.culhane@silvaco.com>
 
 allOf:
-  - $ref: "i3c.yaml#"
+  - $ref: i3c.yaml#
 
 properties:
   compatible:
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
