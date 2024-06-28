Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB4E8C2BD09
	for <linux-i3c@archiver.kernel.org>; Fri, 28 Jun 2024 15:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=04E2GcSFcP8lA+c7iqrOUNt6sb8no6UALTx4/Xa0xlk=; b=nOEkS4D8dAJcgJ92Jo76p5XvxY
	8ioH13E3XTP2mYV9osnYIuQlHp9kWkC0q1MXdtA/UUo6YGRIROlkW+asCavrlYnf8RHJkF0kBF3PZ
	uveYhPN5MgFe7WSU3sHMz6G3/ynvCqd6eZB/3MWnh6u8wPb9u0XXtxap/QKIp8x2raWQu6vSHhLWg
	t5oR9C+4cL++V5Z4QGKYQ/GxMRPaknCGDMyAq1Jo2Ma6UlXxHKVP0t7E70QYRqM1w6QKFVsuC/TyZ
	q8ODtcJihJskR4r4z5IPMwiw43sUfMYLdbP7EU3UrBwVM6u6A58CEn9V98+zHcqMoZzadq3cFKJq/
	L7kDwrlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNDnj-0000000EFot-2Nvd;
	Fri, 28 Jun 2024 15:46:15 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNDng-0000000EFoG-35ge
	for linux-i3c@lists.infradead.org;
	Fri, 28 Jun 2024 15:46:14 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-7065df788f7so759985b3a.0
        for <linux-i3c@lists.infradead.org>; Fri, 28 Jun 2024 08:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719589571; x=1720194371; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BWwY890+5NLFwmpl4Ncpp5MeSVkTzmaxwxuDQSu9PBk=;
        b=VV6Vu4jpFVQCEE4GPNLK4eScbh65ohHgka7bF5qIi8TJCZFE2X0Mq3TVvyAMp+9X8T
         DOtE5bttzOmCHgkG5ldFi36Bj1ei5I3d8XoNjWX4hhaVK8dl27fgDMkuO7M1qsOcQ8OB
         qki2Oatm8anaxJd/wSIBMkdIInJKpmAtgdiKxqk7PFCrb4BQf/4oBLrH6xvMbWklldf6
         6BsT+5Sz4mko60Dt/9dubunfJekguP2uQht7BMf0czpK7RYYU+Fjq/42nn6abPFozV2T
         /oa3HINV5fo+Wus9KLvYub77oGyMdteaplCM83KE41tEZS4x0aELwWHgYBGym6R6PS7R
         Xy4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719589571; x=1720194371;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BWwY890+5NLFwmpl4Ncpp5MeSVkTzmaxwxuDQSu9PBk=;
        b=kSBSxqi1xmjsgsYi93Qq7CdOxKp47gyDrM/5uORFw+vwD8ZPpoMfKapFnKh01123q1
         IFiuDUd6UU2EYgWuGAMp50Lm8ZY3zZCwaD8A2uj0yZbSRxEjPrEUZjtmJthlhkaRgFjk
         AKExdeGUjDwNyMkT2Xbc4hmiLrF9ByULQGpBPgUd2djj4lpxDv4m7Pmwywcyqk6vFJ5K
         Hl6XW6+wwaTa8zheEeqTvqi4hsXai5RIjTgKWby1Muj/IMSnX4ramXQi86t98RqyYI22
         dH+JdxT9nSL5rGdap0SfJteOcH+0eg9Kfxm5bwmz15BOcgTmuzEI5MjaJLjlCpsO4NYN
         hkZw==
X-Gm-Message-State: AOJu0Ywb4+nRFscSfYn9jv0wadNChgNFgD3Pj/pfCikzKzFCd6QJjHgf
	EB2LQzEbazO9/Fa4Xq7i5SqrhU6sE1pQY3OyN9JP/zEcaFI5GL/zJUbngRMwV7LGuMncCnbr9Tv
	Dw/+XZaBfRNeWL0I4UVuQhVj3+A==
X-Google-Smtp-Source: AGHT+IG32gMnXvaf3njbjouiPVyRu1hT0usmDZOv2jZJ7sVHWHnnRif/Y+Bn+1rnVmXX5zr8ZtJ4EL4tM4RTBaskLis=
X-Received: from aniketm.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:3387])
 (user=aniketmaurya job=sendgmr) by 2002:a05:6a00:23c7:b0:6ec:f400:95a7 with
 SMTP id d2e1a72fcca58-708536c380bmr89585b3a.3.1719589570648; Fri, 28 Jun 2024
 08:46:10 -0700 (PDT)
Date: Fri, 28 Jun 2024 15:46:03 +0000
In-Reply-To: <20240624052851.1030799-1-aniketmaurya@google.com>
Mime-Version: 1.0
References: <20240624052851.1030799-1-aniketmaurya@google.com>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
Message-ID: <20240628154603.326075-1-aniketmaurya@google.com>
Subject: [PATCH v3 2/3] i3c: dw: Use new *_enabled clk API
From: Aniket <aniketmaurya@google.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jeremy Kerr <jk@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Aniket <aniketmaurya@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_084612_796183_87FD62B9 
X-CRM114-Status: UNSURE (   8.55  )
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

Move to "enabled" variant of clk_get API. It takes care
of enable and disable calls during the probe and remove.

Signed-off-by: Aniket <aniketmaurya@google.com>
---
 drivers/i3c/master/dw-i3c-master.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 9aae5c8dba8d..4e3335641dcd 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1450,7 +1450,7 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 	if (IS_ERR(master->regs))
 		return PTR_ERR(master->regs);
 
-	master->core_clk = devm_clk_get(&pdev->dev, NULL);
+	master->core_clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(master->core_clk))
 		return PTR_ERR(master->core_clk);
 
@@ -1459,10 +1459,6 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 	if (IS_ERR(master->core_rst))
 		return PTR_ERR(master->core_rst);
 
-	ret = clk_prepare_enable(master->core_clk);
-	if (ret)
-		goto err_disable_core_clk;
-
 	reset_control_deassert(master->core_rst);
 
 	spin_lock_init(&master->xferqueue.lock);
@@ -1501,9 +1497,6 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 err_assert_rst:
 	reset_control_assert(master->core_rst);
 
-err_disable_core_clk:
-	clk_disable_unprepare(master->core_clk);
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(dw_i3c_common_probe);
@@ -1513,8 +1506,6 @@ void dw_i3c_common_remove(struct dw_i3c_master *master)
 	i3c_master_unregister(&master->base);
 
 	reset_control_assert(master->core_rst);
-
-	clk_disable_unprepare(master->core_clk);
 }
 EXPORT_SYMBOL_GPL(dw_i3c_common_remove);
 
-- 
2.45.2.803.g4e1b14247a-goog


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
