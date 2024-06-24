Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B64C2BD09
	for <linux-i3c@archiver.kernel.org>; Mon, 24 Jun 2024 05:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=gJ/uKYTljdecWIxJBEboxgMR3gn7ztDFZewydigQ7Jo=; b=FeSEwY5euJdTGtZ7YR2Hhg21sU
	LomZR4LFKFCVFDTaELAUPrNp3UGMuHMfXtP/QBePDesxMUagQmTa2U359pV4Y3nN/gWml28qBDciV
	v6a8UQmN4MUs2LYIWYGpzMNvzCX2B+tWc/C4dYB/oPDQohMNCZAOUZuoQhjxCVTblzDo8ojvwvJVJ
	0Prouk1fx+IF4p2TxPiBKbvPQNGN9xw9FMSdZByyaMIeQvEEsEHlKjC/jCUaPdI+F86tX9/NFxcE1
	g9OLyXi3xmRYOQCan+1fi8d4+Gnv+6cyO4ij4nkTanZeU2RvH8vdBWDhuOlvI0SHar/qNFRBVAQIK
	TBCiFyng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLcGc-0000000FblU-13v4;
	Mon, 24 Jun 2024 05:29:26 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLcGZ-0000000FbkR-3Jvr
	for linux-i3c@lists.infradead.org;
	Mon, 24 Jun 2024 05:29:25 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-dfeff072f65so7498437276.3
        for <linux-i3c@lists.infradead.org>; Sun, 23 Jun 2024 22:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719206962; x=1719811762; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=P1I8I99l7a+8VVN3a7Xt/piq3f28W3MFZ3VnliaJyPU=;
        b=GdbPbLrFenN8EPbm3QMowuioxy/WjtU5IatYV2of82nPgyHjdaVEJhVEihqKNgpIXS
         cC3fo2yAbegvBv5A3QCVtIj/OcHrOahFQqvxAxvvUpRokDSYyTZ5PmXwbgOcHD41xJDr
         QTPLEYXKAC9MXDmofa1KCKHQi69IDanQzY7QViF7aXKP8OueKBu2SuALOarmj6CAdpEa
         MsHOYvW14d37Sz8MWjp7n/ttUjHimEjXrrrk14DAaa4x+a6E/T5d1nvoNOW+Tk7Gvh/f
         8AXt53ZwPtb632QnLw2XLN+6t4zQJvAGWczMhDpAZG2ZuSyWTA3jIfkJD8V00pU6o12z
         xqKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719206962; x=1719811762;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P1I8I99l7a+8VVN3a7Xt/piq3f28W3MFZ3VnliaJyPU=;
        b=XHtgHp59qduKmZHMh+eqef/xpLw7yrTFb+AItPRo2Lya9tFekgTkUPT9YqFwawW++I
         kpqqSx9yiCUM8rPwCu/hpuUhoyZqWkKGptZErgVgDq/wkFv085BW+SSy3tFKmGRvTHz3
         +DU5Nr83sDGZeen/RKNd/XVpH5KjetE/MXU90UAVY15MlmpAve2/WhZSH/K4KZvfctRT
         YYSEo0/vdc2Kd7awLxppGe6qQRr4eXjmcUgoIHuF4yWDWAgEbiun6w/y3GDBQsoo/0XC
         lyFwDjRUocacU3ymYxNeYo3eG2vjxVHd+284Hs9nVXTUqu8zy8t4iV6/e/M4LpShuBmI
         25jA==
X-Gm-Message-State: AOJu0YzocpPiP6r+a1GmpQrHLTWjjOM9lgdnEgEUfn1XGsiZ4iMCM5yF
	5JT6TV843eoB9IncN8oabIv0l1StTV52yyCKDmBZ4sEGsYK4k1jpCkc/zsjsSm7NCp5yXmh2x5a
	maaAE1KgP+HwhJtxgBFrJ01cZ4w==
X-Google-Smtp-Source: AGHT+IFYTSVOMsLqJVDUxHQ8GFvdZHqCOqKjAi9xCBAxDVenSvN+E7dc9z9/aa2vq33ZomTzPFE3OUf1TIIi5BohR5k=
X-Received: from aniketm.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:3387])
 (user=aniketmaurya job=sendgmr) by 2002:a05:6902:1146:b0:e02:c619:732 with
 SMTP id 3f1490d57ef6-e0301098e9emr11043276.8.1719206962420; Sun, 23 Jun 2024
 22:29:22 -0700 (PDT)
Date: Mon, 24 Jun 2024 05:28:51 +0000
In-Reply-To: <20240624052851.1030799-1-aniketmaurya@google.com>
Mime-Version: 1.0
References: <20240611171600.1105124-1-aniketmaurya@google.com> <20240624052851.1030799-1-aniketmaurya@google.com>
X-Mailer: git-send-email 2.45.2.741.gdbec12cfda-goog
Message-ID: <20240624052851.1030799-4-aniketmaurya@google.com>
Subject: [PATCH v2 3/3] i3c: dw: Use new *_enabled clk APIs
From: Aniket <aniketmaurya@google.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jeremy Kerr <jk@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Aniket <aniketmaurya@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240623_222923_860274_73E74DD5 
X-CRM114-Status: UNSURE (   8.81  )
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

Move to "enabled" variant of clk_get APIs. It takes care
of enable and disable calls during the probe and remove.

Signed-off-by: Aniket <aniketmaurya@google.com>
---
 drivers/i3c/master/dw-i3c-master.c | 21 ++-------------------
 1 file changed, 2 insertions(+), 19 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 41cdfd6741e3..37092b8e964f 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1466,11 +1466,11 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 	if (IS_ERR(master->regs))
 		return PTR_ERR(master->regs);
 
-	master->core_clk = devm_clk_get(&pdev->dev, NULL);
+	master->core_clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(master->core_clk))
 		return PTR_ERR(master->core_clk);
 
-	master->pclk = devm_clk_get_optional(&pdev->dev, "pclk");
+	master->pclk = devm_clk_get_optional_enabled(&pdev->dev, "pclk");
 	if (IS_ERR(master->pclk))
 		return PTR_ERR(master->pclk);
 
@@ -1479,14 +1479,6 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 	if (IS_ERR(master->core_rst))
 		return PTR_ERR(master->core_rst);
 
-	ret = clk_prepare_enable(master->core_clk);
-	if (ret)
-		return ret;
-
-	ret = clk_prepare_enable(master->pclk);
-	if (ret)
-		goto err_disable_core_clk;
-
 	reset_control_deassert(master->core_rst);
 
 	spin_lock_init(&master->xferqueue.lock);
@@ -1528,11 +1520,6 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 err_assert_rst:
 	reset_control_assert(master->core_rst);
 
-	clk_disable_unprepare(master->pclk);
-
-err_disable_core_clk:
-	clk_disable_unprepare(master->core_clk);
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(dw_i3c_common_probe);
@@ -1542,10 +1529,6 @@ void dw_i3c_common_remove(struct dw_i3c_master *master)
 	i3c_master_unregister(&master->base);
 
 	reset_control_assert(master->core_rst);
-
-	clk_disable_unprepare(master->pclk);
-
-	clk_disable_unprepare(master->core_clk);
 }
 EXPORT_SYMBOL_GPL(dw_i3c_common_remove);
 
-- 
2.45.2.741.gdbec12cfda-goog


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
