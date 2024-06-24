Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3119C2D0D0
	for <linux-i3c@archiver.kernel.org>; Mon, 24 Jun 2024 05:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=a1GusA5yXOoVUBA+gbpymg+GcE/Mj2K9AInuIm2i0WM=; b=MUt2uvCw+jb67tm2GqgODnvxW7
	USQ/RI5qb2+GF1JWmBiOartTwr6dExtHvWXRGK0Yjpty9GqOziyMLqIrng1Y0+oRsKFvtL7H1E+MA
	lwaLUA6Ed/Hx7xF65mTbhMPsasLekyu1MyvYXVg6lHmCUjv46nuHLTE4uz/AMGku0dpqsduLiz+hq
	Yfej+hZ+mxXDcUz2h4YvIICMB29t1umoflmxiQJHw+02brwYw/ecRKP6R8UxxS2PNljhIgmiR1DBi
	2HUELaja9muKMdOBsUC9A6xcBxmPIkHUIXD962L7OmeM4/IM1C51NwDJY2dAHeRLjw5EY5uzfiv70
	5PfX1SkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLcGX-0000000Fbjz-2vFa;
	Mon, 24 Jun 2024 05:29:21 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLcGU-0000000FbiG-3xMg
	for linux-i3c@lists.infradead.org;
	Mon, 24 Jun 2024 05:29:20 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e02c30d4ff5so8082338276.3
        for <linux-i3c@lists.infradead.org>; Sun, 23 Jun 2024 22:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719206957; x=1719811757; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=z1lDGMLBKOZjPQERPgHQ2A9MuACw0+8pMDHkdqTSITw=;
        b=KXKCwE4AmXmoHmVBg1eSVV6yPGIKbSABxzFeqzKkjc+LCw0Q/Mj+pCrhdsNeZeygjg
         LiMP07zVp6qfL/3pSZqw1PbUdVmAjc5ilToaAqMJBCgnJNraJ5qek6TFsbpN2YvvCYkP
         lvm6jrQon1vfqljccYKi+ZOG80cdemZFufAfJ3L66+I2VV2T/HlvEEcRFgtzizvOV99h
         hto/hEeDQHBE+Wh1HaR3GxBzSNQp7SnrI/hxkB1HNEKuin8gQvkl08NMA4KqAGjMctPC
         A+yWqlelcwaSYRPMqesenf1rlNsIDHVjfYHdQqDbfnsnirbAIVJic+EQQCDZKfIGxlJx
         7okA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719206957; x=1719811757;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z1lDGMLBKOZjPQERPgHQ2A9MuACw0+8pMDHkdqTSITw=;
        b=fA2JA21M49DVmdYHLFn5cEmYqW6ePzFl26csMGGT9I4ktlsCSH7XyQBL3fyHOVkt4C
         cigmKxbIIG3ii4U8Tt1S4mLOkv4RrnZl7uSEzdOwylLGArOMdUkvgmmPMBfTCUrtIFpq
         7DABHWOKxwSdU8CtcfEJwQMgMXzVV2pZRXWRKk8BHgfcak7j0586ZImnVehNtOcOPKqv
         Eke2aERL11t8T4vQP+H+QLmguzGE481IIvnTTmbKYQPIYypbNrVOdR51AV63dfXFyUgf
         epWJ7lLXMDMqV1ZN6gSIBjcVWpS16orOjrJhrg9LzkYf4dW+5sGp/YA62cPAWe7DBjq+
         Ovvg==
X-Gm-Message-State: AOJu0YyV9rpfyrh08WRWmmem3HAKLmiJZeWv7QUs1yFCOJuMeo8anWRD
	J6GgUFKr3IwK1LxG4jAdPtCcDrE/NdB7hNy0jq5Gg52zF69NB1luAsjGl8eLawLUkBhCxHs/Fw4
	im8GXDR0kjzt6d9QmPZ96VoDC4g==
X-Google-Smtp-Source: AGHT+IFg4S5f43LgnXGlfi54t9Ut10DZcSLiBehSOlBVrIz63/P6FEWtc9+rMh5c0FMT9ZFPAyecpjuZbGRYntXsAoc=
X-Received: from aniketm.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:3387])
 (user=aniketmaurya job=sendgmr) by 2002:a25:c747:0:b0:e02:6dcf:e9b2 with SMTP
 id 3f1490d57ef6-e0303d64058mr25487276.0.1719206957343; Sun, 23 Jun 2024
 22:29:17 -0700 (PDT)
Date: Mon, 24 Jun 2024 05:28:50 +0000
In-Reply-To: <20240624052851.1030799-1-aniketmaurya@google.com>
Mime-Version: 1.0
References: <20240611171600.1105124-1-aniketmaurya@google.com> <20240624052851.1030799-1-aniketmaurya@google.com>
X-Mailer: git-send-email 2.45.2.741.gdbec12cfda-goog
Message-ID: <20240624052851.1030799-3-aniketmaurya@google.com>
Subject: [PATCH v2 2/3] i3c: dw: Add optional apb clock
From: Aniket <aniketmaurya@google.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jeremy Kerr <jk@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Aniket <aniketmaurya@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240623_222919_054941_5E56507C 
X-CRM114-Status: GOOD (  11.16  )
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

Besides the core clock, IP also has an apb interface clock.
Add an optional hook for the same and appropriately enable/disable.

Signed-off-by: Aniket <aniketmaurya@google.com>
---
 drivers/i3c/master/dw-i3c-master.c | 12 ++++++++++++
 drivers/i3c/master/dw-i3c-master.h |  1 +
 2 files changed, 13 insertions(+)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 77a2a1c3fd1d..41cdfd6741e3 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1470,12 +1470,20 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 	if (IS_ERR(master->core_clk))
 		return PTR_ERR(master->core_clk);
 
+	master->pclk = devm_clk_get_optional(&pdev->dev, "pclk");
+	if (IS_ERR(master->pclk))
+		return PTR_ERR(master->pclk);
+
 	master->core_rst = devm_reset_control_get_optional_exclusive(&pdev->dev,
 								    "core_rst");
 	if (IS_ERR(master->core_rst))
 		return PTR_ERR(master->core_rst);
 
 	ret = clk_prepare_enable(master->core_clk);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(master->pclk);
 	if (ret)
 		goto err_disable_core_clk;
 
@@ -1520,6 +1528,8 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 err_assert_rst:
 	reset_control_assert(master->core_rst);
 
+	clk_disable_unprepare(master->pclk);
+
 err_disable_core_clk:
 	clk_disable_unprepare(master->core_clk);
 
@@ -1533,6 +1543,8 @@ void dw_i3c_common_remove(struct dw_i3c_master *master)
 
 	reset_control_assert(master->core_rst);
 
+	clk_disable_unprepare(master->pclk);
+
 	clk_disable_unprepare(master->core_clk);
 }
 EXPORT_SYMBOL_GPL(dw_i3c_common_remove);
diff --git a/drivers/i3c/master/dw-i3c-master.h b/drivers/i3c/master/dw-i3c-master.h
index 8cb617b8147e..50c38e790c0e 100644
--- a/drivers/i3c/master/dw-i3c-master.h
+++ b/drivers/i3c/master/dw-i3c-master.h
@@ -36,6 +36,7 @@ struct dw_i3c_master {
 	void __iomem *regs;
 	struct reset_control *core_rst;
 	struct clk *core_clk;
+	struct clk *pclk;
 	char version[5];
 	char type[5];
 	bool ibi_capable;
-- 
2.45.2.741.gdbec12cfda-goog


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
