Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED6FC27C5E
	for <linux-i3c@archiver.kernel.org>; Tue, 11 Jun 2024 11:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=wmLl+EyH1Krdd17CG8hEysYVUsYrELhIO0mf0mmlbEs=; b=zkr
	9ZJP6uPbkIZX8HZ4W/vL9rv8io/dwvFUGgVudekDlN8Oko4k7+qW42JGPzHKh7zgzcrfAHZkK8698
	CwsqW3UzBU8T0gGhEASNLEPScjwgIcOLI0Dm4f+MxEmqueTMEf1Rvae73sFQ91HbSzFJiglySdDWM
	qM0ZA7jTKeaYuxu3UJnD/PiKt0EvUSZqVS8bb3d60tohWsVP0G5lv9g2YFPbY+/J/KGG1nzqutwc5
	bnqxkvyts9Uv/HZFI1sGsR9XZLqCjXRN0vMnROrVcjVgFdZsgwlG4cL3jvMt6uXgGz6URyTjftXGK
	0eZQNr9njcKUIg8lfRsq1ovFwQynvsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGzeZ-00000008dHJ-1MUK;
	Tue, 11 Jun 2024 11:27:03 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGzeW-00000008dG1-3P7a
	for linux-i3c@lists.infradead.org;
	Tue, 11 Jun 2024 11:27:02 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-62ca03fc1ceso17586717b3.1
        for <linux-i3c@lists.infradead.org>; Tue, 11 Jun 2024 04:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718105216; x=1718710016; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MaYjj3o2ALLcKToV9N4PUJjf27yiK1Wwgvm7Ar9oqEc=;
        b=gXdAd5Ab3n2VaFRFZsKv1ks5GKd6OmghWPcreDyJJwjf7EEtmkMle89TDsYXEYmea0
         Ldr3jy+yhXRiUOmabTJp4ZAtIZTrwsLwtBao9tMxUSFF2CImQnNEwp09NIxSavEeAFcK
         u34WFhfEOjQVcdNkL9gMzRAF6vRrTxAapzZbtd/dj+7kI93pKmpKwTWz2wHQaXfVb9aA
         +f4/S476elQTuBUhqjzdDzE7FM1Fl31ks4kVgeY6pZM59sOYv2/dkiTN8c05frU6ecga
         87vCebwnF7S+3vxZgPF2h52eRTptZDhz6/N8d5P48AqO4YKl1BLnzrQ3wC4Yh2vj7P/t
         a4cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718105216; x=1718710016;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MaYjj3o2ALLcKToV9N4PUJjf27yiK1Wwgvm7Ar9oqEc=;
        b=qmUclspmyQyMd4HyF+xKKLPUNZRvMNvp7veCrVL+DepM07vHlR3vDt7DQeYZRsYcNI
         WBvXtyIjNEuWM9nwCIqMP/6Zrc59ni3gsYWbq1WCXnx3c232XGpyPvo6AbnlnM41zHcL
         fTGdP2KaIneWVfWx4utoa3dH99ZCGOexYqGpg+rz3XZjpcVoAtXyiEQisfrvT6IspM8J
         QhVR9yd9Lv6492dOD22Qj58u+FjzhhfL315T7xWw8lwEsJJDV3vO5GirJ49eEgndxUcT
         O3FMjDoXyuMdHIGSVE1qj/CxI7xOLZL9txplnCcJ18KcKP8ZjO3MDpbVzqrdYoD84Tqf
         o8Gg==
X-Gm-Message-State: AOJu0YzPiGBiQtOea82ivPmmvlbeyx+zRfCWxPrp+b0FOs228zur/c+6
	Tamiz3vqcB/ZVnqDnU39a5szJ5IYN2hRVs167faGLF7Uo2qK3RnOGiUIUMaR4ttl3n/mb04VdUa
	DsTK97fRbfXE7ccdnUZssAc2BPg==
X-Google-Smtp-Source: AGHT+IElcMdi3wlvSVhWoNYrNzkONnlxS4SEerVIJykNzoKLbDz1/mE4KxfpG2CZvaHhQRvKrrqTLgiDAqi33MqtNN8=
X-Received: from aniketm.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:3387])
 (user=aniketmaurya job=sendgmr) by 2002:a05:6902:2b8b:b0:dfa:849d:3a59 with
 SMTP id 3f1490d57ef6-dfaf667471bmr4157407276.13.1718105216433; Tue, 11 Jun
 2024 04:26:56 -0700 (PDT)
Date: Tue, 11 Jun 2024 11:26:50 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
Message-ID: <20240611112650.411214-1-aniketmaurya@google.com>
Subject: [PATCH] i3c: dw: Fix clearing queue thld
From: Aniket <aniketmaurya@google.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jeremy Kerr <jk@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Billy Tsai <billy_tsai@aspeedtech.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Aniket <aniketmaurya@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_042700_870142_2B2339EC 
X-CRM114-Status: UNSURE (   8.30  )
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

QUEUE_THLD_CTRL_IBI_STAT_MASK is repeated twice.
Replace with QUEUE_THLD_CTRL_IBI_DATA_MASK.

Signed-off-by: Aniket <aniketmaurya@google.com>
---
 drivers/i3c/master/dw-i3c-master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 03911a5c0264..77a2a1c3fd1d 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -631,7 +631,7 @@ static int dw_i3c_master_bus_init(struct i3c_master_controller *m)
 	thld_ctrl = readl(master->regs + QUEUE_THLD_CTRL);
 	thld_ctrl &= ~(QUEUE_THLD_CTRL_RESP_BUF_MASK |
 		       QUEUE_THLD_CTRL_IBI_STAT_MASK |
-		       QUEUE_THLD_CTRL_IBI_STAT_MASK);
+		       QUEUE_THLD_CTRL_IBI_DATA_MASK);
 	thld_ctrl |= QUEUE_THLD_CTRL_IBI_STAT(1) |
 		QUEUE_THLD_CTRL_IBI_DATA(31);
 	writel(thld_ctrl, master->regs + QUEUE_THLD_CTRL);
-- 
2.45.2.505.gda0bf45e8d-goog


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
