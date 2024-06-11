Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD9EBC27C65
	for <linux-i3c@archiver.kernel.org>; Tue, 11 Jun 2024 17:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=kryHff1vj3b8CpQVZgr0l2bNqzF7kXqmEt3Oxp6JRH4=; b=w2nMffCvhatYPG2Mg5eKgTDDAR
	K1rE7Olt3rMVjMw0vchczk90IWRH8KEvMd1sBhBF/maISFtVKrObcqgcLLhtSidG9a9VfUhaaYNoc
	8M7ZmH6dJwEf2tC2H9vT0xEANBQlvviC4b3Vc38v3gDbqqse5ez50AuLtwb8Yv0H8mqA6888drruf
	4ahX9mOUHszMMmOjzDD1xCZPE06Hg0BkaQMolWIPqtgf9ijXszjXm4yJ7UVezlsqh9mTIOp8pOaG1
	U44xhXICRCjOLOgVnjhJBBUn1VeSUCQr2l/zCfgFvTpO5rNzoL3bcGCI3gvVPfUjzLbxW0rmk2Ncp
	GinDvZVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH573-00000009da9-2GNU;
	Tue, 11 Jun 2024 17:16:49 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH570-00000009dXK-0GMz
	for linux-i3c@lists.infradead.org;
	Tue, 11 Jun 2024 17:16:47 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-627ec18b115so22969817b3.1
        for <linux-i3c@lists.infradead.org>; Tue, 11 Jun 2024 10:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718126201; x=1718731001; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=x32GJJg0AlSw6J5DmY/hNwb8LZyaDbs+mRkSRyx7dxM=;
        b=iTg9r2K68IphvyumbR6CPFfPmg9VWjmZCFSl8+1AnEVdxXncA0VL4z0OW4n4GlXWuU
         F71hsEUSY5sEQbDdHdHuDY7GNxFICo1+E24J7Qg/q93j9RmRqQxme4je1sEohhTF/BHP
         0wnlkRwRxjLblhf4bQXB1WqenyrkcbhbLkqn0qe/MZaQlVyVoFAJRykV3W/ZZUZCbRo7
         z0qbsZa44c38gjrQc6ec3nEXgUJsa1v7MNErQGcTMQEKu28thUwLHvr/PmCONpsqosOD
         NuVP8T4Gp+2dQK7DVeju/8ovBtDVyoPc1cH+yQ1jGk2Xw3OwJYb7q+NxehFC9vn95aJ2
         YzDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718126201; x=1718731001;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x32GJJg0AlSw6J5DmY/hNwb8LZyaDbs+mRkSRyx7dxM=;
        b=i/KCevSHLL9Md7srALxC04eiJyaNv6cc9n26uvleamZMGlNlQBCqegH8wzP6zJO16J
         fjaggaseVREINOvizJGua15MfrBLeXnlbAihuZt66UXhIhAfombW2lCnMZlbHMnjrnsL
         oUEzNtttrocrPhqzE9eo01/kRSTZLwuqwlROarJNJLS8YYd3fW/GWvs01FVbAcWozcik
         kDtEk1LS6Mr+K+VgymLNtOTnhHJQS+wD1+43mfQ44f7ptnJ9pxUznhHJ5M/pR1A8eiQR
         8nalj1ZB3nLtHqqLNHPsXQVADjiCVEwM/feKZPv4p0OyW2ReRYS4vfHVAldMb49qB54e
         yW7g==
X-Gm-Message-State: AOJu0YxaHZW6IPa6xG8jG9CQR0D/HhwJ7dQtpFA/sgByKU7c2MeSBzu8
	296QBq5ykJDmdxkXmVAuKQVI79WfmfJqXc2yYpdu+xzKW0cYgP3bmRerNjeOF9xEQkvPIUIJsJY
	yA4L2+oSnJyVQ9vX4CovB3749aQ==
X-Google-Smtp-Source: AGHT+IFZGNAg9puiuuskmC+xjdohP7kvB0J4VVKVnjwy0UefCG8+X6DP4ehy6KYfVSkTF9cqPe0yp7vlXGzijUCB35k=
X-Received: from aniketm.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:3387])
 (user=aniketmaurya job=sendgmr) by 2002:a05:690c:dcf:b0:61b:791a:9850 with
 SMTP id 00721157ae682-62cd568d31cmr39052507b3.9.1718126200989; Tue, 11 Jun
 2024 10:16:40 -0700 (PDT)
Date: Tue, 11 Jun 2024 17:16:00 +0000
In-Reply-To: <20240611171600.1105124-1-aniketmaurya@google.com>
Mime-Version: 1.0
References: <20240611171600.1105124-1-aniketmaurya@google.com>
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
Message-ID: <20240611171600.1105124-3-aniketmaurya@google.com>
Subject: [PATCH 2/2] i3c: dw: Add optional apb clock
From: Aniket <aniketmaurya@google.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jeremy Kerr <jk@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Aniket <aniketmaurya@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_101646_251210_3B79F487 
X-CRM114-Status: GOOD (  10.31  )
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

Besides the core clock, IP also has an apb
interface clock. Add an optional hook for
the same and appropriately enable and disable.

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
2.45.2.505.gda0bf45e8d-goog


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
