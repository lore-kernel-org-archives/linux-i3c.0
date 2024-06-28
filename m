Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A4EC3064D
	for <linux-i3c@archiver.kernel.org>; Fri, 28 Jun 2024 15:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+GweTPkl9tjdk3QOdcASY3UB+vJQWMoBM8gNMdKZftE=; b=yw9CjBD7eOEkazq7zXzdGFuo+h
	CDHiArgRBp3fIejJ9zy7sIpjIDzauHp7zPN65+2O8aWr0T+1iBq17OrH6J6WB7gewCRdteTSqPxCF
	jjHg7qylSeJl14+wazWosnaKwAstBy/LPIm9oit+MHybrCOOLdropvis2b9tQ/zpD/X/FJQZZNeMx
	y+HmY0c/Sxt3DEeE4SRMspJyLuf3MFq4fjHfy6HaVcVPlvmgfxV0bZRuMwfHhwp5IP+B5AQHVebAL
	EJg/PS7AS2CuJTbk1YT3nNwyWtxhmdyJDb8LtTsRUTFDOc1X/Pw6NBcMF+G+SfJMKJ0TWPtAyT+fc
	wxNUE5QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNDnx-0000000EFtm-28xH;
	Fri, 28 Jun 2024 15:46:29 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNDnv-0000000EFs2-0EJ6
	for linux-i3c@lists.infradead.org;
	Fri, 28 Jun 2024 15:46:28 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e036440617fso672574276.1
        for <linux-i3c@lists.infradead.org>; Fri, 28 Jun 2024 08:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719589585; x=1720194385; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uik8gGS0BJXXt/zzhXfY9dwtNNpwmc4SjckR9/xyOjE=;
        b=r7fIPf0uHyEN65APT72yEciXG3aRbOzjUw2SVOLmGNe1W7/+zfsFvVDArV8Wf4k7XF
         dMBosqay7e3Yvzb2xxVdyXKbwXaMTjdpR0MLGI4zU8oH5bjiOuxW9bCMZ8Vt9ViCC0PZ
         Cp/NOzEmVviEE2HEM3AP3Of3XUYKIKgxZxYsD2YBFUGfUf3ZiXFc/lpu92C7996q+/fg
         45acgo/17OSsPbpFTaLgjaSkQKGG7QPNNuGStTZr5weogUiyDRyD3dRXcKC0KLBtxzXZ
         4ux3QWRU9jQUL1Jh/5bLLX8j0Qe2EhNrqAZo7XK+YnInpbdITd/9a/bHFbjuS6cd+yg7
         lLgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719589585; x=1720194385;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uik8gGS0BJXXt/zzhXfY9dwtNNpwmc4SjckR9/xyOjE=;
        b=aeT+sUXLgDkovlygnDk4mguNjxaSry4DIcm7sD1yW3yyzgy3+qHR/rju1wLybMBHVc
         QJbqnLAE2b2NJX4TUrbsvIchos7AN0nAc0njFbMPyXEk6ejlmT2P6xtYg5JuH+1J0lWU
         KzmeG8ClF0zFMG/AQosCbWPh6c4+mpxmdZ2PaHCHKBGkOOhm5+AIUDreBSstDgcTDUvX
         PgYAJWcooa3SV1sH1X9pkiW5GjHsulYBVPVfqG58X04RKTSGpvm4pBzP+Lgy2CNSd/47
         EFZuuXZQ+eee8s1hMqsTZE84lfN78dZZ5I9bbBcIj+PjldnHt/aupOw0Fg0Ir8pl6yuF
         kEHg==
X-Gm-Message-State: AOJu0YwB4FRTsL7bcQGeY1DKpHjK5SIKM2mnlUXCqsDQbyQKwQRJ5x53
	BmhEztaMFd6jjQdyX845hEG6TcW6mBzhqboXJP/+FzpTMHzi+eP8jwMU8b0KnLsZZkjZVrOorD4
	+slKLddWlSVOMUTrzHjhKswWuyg==
X-Google-Smtp-Source: AGHT+IGfB7ik9VdtwsAzQwB6NZPw5Sc6rxP7YfqsyxrxwdZNm7diILFTFbMiLS0YpTc/XkKLrMFZg6xM7Cn3odq5SM0=
X-Received: from aniketm.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:3387])
 (user=aniketmaurya job=sendgmr) by 2002:a05:6902:1006:b0:e03:4bf0:b21e with
 SMTP id 3f1490d57ef6-e034bf0b50dmr375748276.1.1719589584856; Fri, 28 Jun 2024
 08:46:24 -0700 (PDT)
Date: Fri, 28 Jun 2024 15:46:18 +0000
In-Reply-To: <20240624052851.1030799-1-aniketmaurya@google.com>
Mime-Version: 1.0
References: <20240624052851.1030799-1-aniketmaurya@google.com>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
Message-ID: <20240628154618.327151-1-aniketmaurya@google.com>
Subject: [PATCH v3 3/3] i3c: dw: Add optional apb clock
From: Aniket <aniketmaurya@google.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jeremy Kerr <jk@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Aniket <aniketmaurya@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_084627_117534_10FD0242 
X-CRM114-Status: GOOD (  11.07  )
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
Add an optional hook for the same.

Signed-off-by: Aniket <aniketmaurya@google.com>
---
 drivers/i3c/master/dw-i3c-master.c | 4 ++++
 drivers/i3c/master/dw-i3c-master.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 4e3335641dcd..0ca41782f3a6 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1454,6 +1454,10 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 	if (IS_ERR(master->core_clk))
 		return PTR_ERR(master->core_clk);
 
+	master->pclk = devm_clk_get_optional_enabled(&pdev->dev, "pclk");
+	if (IS_ERR(master->pclk))
+		return PTR_ERR(master->pclk);
+
 	master->core_rst = devm_reset_control_get_optional_exclusive(&pdev->dev,
 								    "core_rst");
 	if (IS_ERR(master->core_rst))
diff --git a/drivers/i3c/master/dw-i3c-master.h b/drivers/i3c/master/dw-i3c-master.h
index 7e76ca381d9f..fb7121c6c687 100644
--- a/drivers/i3c/master/dw-i3c-master.h
+++ b/drivers/i3c/master/dw-i3c-master.h
@@ -36,6 +36,7 @@ struct dw_i3c_master {
 	void __iomem *regs;
 	struct reset_control *core_rst;
 	struct clk *core_clk;
+	struct clk *pclk;
 	char version[5];
 	char type[5];
 	u32 sir_rej_mask;
-- 
2.45.2.803.g4e1b14247a-goog


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
