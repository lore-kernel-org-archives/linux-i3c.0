Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E09FFC2BD09
	for <linux-i3c@archiver.kernel.org>; Mon, 24 Jun 2024 05:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=923FUVIXjVuVjxWDIj2Dlg39rOja6Nu90KkCB4bLJ/g=; b=Blu/Vw3zpi9sn3bv+FOtUbHzUv
	2J6H4whxUfS8zwQ6031o9NvfFJJeTgg8/wW4mblFM3QlsdzSikuTmQXlO5IvF83VFa68GwDV5+uGF
	ixKxQIB8Dr2+7XWF/sLvJNUbvvADMoP507wNR5cpvnU5wIXPrT1YT2qhsF9bjuPhSPn9WvDC2boYC
	xEkxd+vwBeXKs7/k2X5Wy0Ptk1gR/V3xUVaz08+W8dln5TicR6E91x4z7bQ59hqVmAam1bfVWe39U
	SQuNR/qzmCQkzqv4onqBMUL0fcJ4xMpYeStHgqZJLHyIajU50Rio/YoXABuHawLR2LxkcSH3P4Fww
	RDK55b7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLcGH-0000000Fbet-1Cuc;
	Mon, 24 Jun 2024 05:29:05 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLcGE-0000000FbeP-3Hat
	for linux-i3c@lists.infradead.org;
	Mon, 24 Jun 2024 05:29:04 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-dff1eb1c1fcso6771114276.0
        for <linux-i3c@lists.infradead.org>; Sun, 23 Jun 2024 22:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719206941; x=1719811741; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=f4tc+MA3MrEgfJuTL6XyEK1sgKVL7uhnnRi/knhicvs=;
        b=25HP/ZJ9zuhv+SwnHY7C46+hnZL6QISPFKN13tAaLFCT//BClbISQo+E5veVdHv/wo
         Gaz/8r+MR1GtgDKXWq8hUQnxVEz9PKfqzm+j9ZDU8+acXVnFwLrLeJSmOMemJvUSV2tN
         Lnc/hcbG3Tkd0A0bAD/shoWMKv0dSbNYYBk2uXc2HqDG315rEx+ob1Xs5RcG3W1CnBoD
         06vDDWhgxioi7x5Z54ZpWINS7WwHRV/x+CqduEflc3gODqmhd+1CkgNhAi7sW4cT+pGP
         x5jt0d7zJEUUTcrIgh4DbFTB6eSOImFZhNeHPWCVXc3a8waMIDmtzIJFMUwAuqlEc0U0
         CcMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719206941; x=1719811741;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f4tc+MA3MrEgfJuTL6XyEK1sgKVL7uhnnRi/knhicvs=;
        b=MaTxGLhgzPr2DL6DKMrPyxPQQiq+GY+CM/Z2xBZjWLuwzTe1Igg83mEFs6Qg0Pl3pl
         QcCxRuGNvLPZOmM2UW7WRxceDKrP8CPKaUERJK4vm3ApvmsaFr7zlyc3P39lQyXmB5Xw
         50e1gJI4e3FfiX/fZEbh00pdWLinhWLriT1va2BLsNDdZIo9C2hW9TBl1kLAmlqKUbjr
         Zh1uD5bZb2T5jghsqXWjwthadJ1ARFVpswxKdSmNM4zbnMXDQt2FJGsR+L9KwMOFLnuj
         Ph5FpfmoC/Xsn45CAj7JyDPhYwomMsHMrDcViMJ+u1iqfzL6ZHBWI05YsoA+MuOh6vsh
         sukA==
X-Gm-Message-State: AOJu0YxG3FzeKaO8nhtqO7lgkjLlaKzIUJ1qinoczc5yPezzNcQ2lj7d
	74tR0efv5IdA6VSmASQ+xtTHeZFJrHqlmUD2YtR0W9oOkCwVaih5cEGlLQqdNhvGUJvAH9UrT3d
	hwXztDz1aSFbMkP8h/cIaUwhE6A==
X-Google-Smtp-Source: AGHT+IGUgV5rE7AVWD7sfm4jkV4ITjzyYp8qAWL+Hn5XiyhVcilJx1WZCNrB1TylF/AIQIHyiuXzZGueB4wXgIgApaY=
X-Received: from aniketm.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:3387])
 (user=aniketmaurya job=sendgmr) by 2002:a05:6902:2d03:b0:dfd:da3f:ad1c with
 SMTP id 3f1490d57ef6-e02fa3aa814mr386252276.4.1719206941209; Sun, 23 Jun 2024
 22:29:01 -0700 (PDT)
Date: Mon, 24 Jun 2024 05:28:48 +0000
In-Reply-To: <20240611171600.1105124-1-aniketmaurya@google.com>
Mime-Version: 1.0
References: <20240611171600.1105124-1-aniketmaurya@google.com>
X-Mailer: git-send-email 2.45.2.741.gdbec12cfda-goog
Message-ID: <20240624052851.1030799-1-aniketmaurya@google.com>
Subject: [PATCH v2 0/3] i3c: dw: Add apb clk
From: Aniket <aniketmaurya@google.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jeremy Kerr <jk@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Aniket <aniketmaurya@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240623_222902_865148_E22DE4A1 
X-CRM114-Status: UNSURE (   6.81  )
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

These patches add APB clk aka pclk to the dw i3c driver
and the binding doc. Also move to _enabled clk_get APIs.

Aniket (3):
  dt-bindings: i3c: dw: Add apb clock binding
  i3c: dw: Add optional apb clock
  i3c: dw: Use new *_enabled clk APIs

 .../bindings/i3c/snps,dw-i3c-master.yaml          | 11 ++++++++++-
 drivers/i3c/master/dw-i3c-master.c                | 15 +++++----------
 drivers/i3c/master/dw-i3c-master.h                |  1 +
 3 files changed, 16 insertions(+), 11 deletions(-)

-- 
2.45.2.741.gdbec12cfda-goog


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
