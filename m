Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97FA7C021B1
	for <linux-i3c@archiver.kernel.org>; Thu, 20 Feb 2025 05:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=srT1EI4stHcVt/Wu5HMVL+TczgZyc5b1/yrYh/uNZMQ=; b=l6cL5echWxI2pr
	pqbuh0u2+wsgIh2PkVsO1uZ+rjCc2R7PUYiXbTqtT9QdYUMb+xmKhHWtg1aZHXGp0vzpTMGpYVYTe
	aMyXu72RbAQ6o7BHOFrei7K3klMqvt4zOy2A+1JTN1UEyKe6UMHDnzS/moCUSZy2Qm3cNQx2yYryl
	H9DPHwnBjA1aiON+r5wrXuJ1Ct5VVUex0QhtROromOoPSTFv4J4N+/E1uikYCGIQi7RZLeeTZA3Bp
	VyGjiqtpGj5ihITcKaSJ1Q6zW9iV6wV5/KoJALgCOmH74dXZWHK8xleFNM6J9nnDorFafbKoPgw4q
	78biel9g62zOd+QWNNHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkzLn-0000000GpwT-1Tng;
	Thu, 20 Feb 2025 05:43:55 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkzLl-0000000GpvN-0OF3
	for linux-i3c@lists.infradead.org;
	Thu, 20 Feb 2025 05:43:54 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-219f8263ae0so10249655ad.0
        for <linux-i3c@lists.infradead.org>; Wed, 19 Feb 2025 21:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740030232; x=1740635032; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SEAs/2W8i6unwL/IOH0/meAWRqs6OoDg3QxDG87nlzI=;
        b=lRSYmwkjC0S6bWkiyrKE1lqJoE3CQJGzgz84YElyfXOtQbwAv2p4G8jytIPvrDFyDt
         GwxNgfiKm3J8RnG98ju1DIKUPVXqL3WsW9mAoeqO3NHKNQKhhdWmmS0UvD1tXu7pHWBg
         GYbbFFD7KaPCkD1VwQc2mvZazrATcJRiLADY+gLEKen6bf9M7MeHm9C3y8whomQxmigR
         EUlb0zFLHVGaO3sJKwf+6cNQDZ8Ab4lG78Ae6nxUxNikaTidy/RgJVyW9fXHk761xgNh
         WFsSbEX8ILbxyeiTP2JhjwLBt15xR0ETSZIgxkxjUF9xnmn6Sma29LaVxqflreFlw45e
         peGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740030232; x=1740635032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SEAs/2W8i6unwL/IOH0/meAWRqs6OoDg3QxDG87nlzI=;
        b=wDCkNUn5CSP61u6Z8/cmR2O7ZA+ys4vVFmJetmUZm1+iqX6OukMEOgW4yttHdVTu4B
         9R1ZXtxOwZvpITZ85Pip33+uWd1Yp4v7cg2SS6rAv/AMN2U+cLlFJ8F7Jyjqt+gjoC5t
         3kFUQ5xnurQlHFK0MC7otnV+bsbTtOud9SkgPuf6JdP49Qa1p02IPDGjme6unKGVBWSq
         zJbHwHkmMKdXE4mvcFEaew7w/ALY/8XTh0NQia6ZD7yfCY+zNusgCBllkvQeP/pEujEk
         RsWxS8YbQXjPNoVMifiNnwUjbF/1R25652o9K5pYugOU9A0/pjsxm1QQfEQXz3hwKPgR
         21LA==
X-Forwarded-Encrypted: i=1; AJvYcCVBzo5SyK2QJLS1m5RQxJfDhX2Wd1mFhKj6448EphYq4VJ4bwSeOmtXVZd2RcKBB4RzurahowuJid4=@lists.infradead.org
X-Gm-Message-State: AOJu0YyktkSWjJEyMK1428MUKc5FVLGoZZVGNl87717zdfbm9QEUKKOZ
	vUpdhwSIwhJV2mTbClo+j1PN4k7ZLuOBkgYsajHYbAH4HCSwgh6s
X-Gm-Gg: ASbGncti5bHeGlnGnBWxTNuuH+8okOhSGcK/a5serNxQ14ooGQFukdsh1NsAWOBC072
	EljfB9UMjJkYOyLilRl0CwBUh0VksSkI5BlgYTM4pGYQjHPIxjKGEOPfQMjAvHV/f1CXyerN04O
	rxNJudeDl/H6IDzK0kKZV2APe6MWlkZ09h3AE6ue0h+USMTg9xiOZGBJLvDq2nKEc6Y7LRBUYvq
	F5c7aiORmji1um4LKhQThHJfaN7NI3HJZLCDanIwQyY8kUQrno7SvzylQ71fCAfq2fDvKa2uN61
	bjb28O9qDThxivv+NWvTfLH65Q==
X-Google-Smtp-Source: AGHT+IGUkXoXo59VQXM/7j5YyIdcs9w/cg9RxyXROlX7CbTDYkiET2l2tQDyhfUyca1cDQgdkp4yXg==
X-Received: by 2002:a17:902:e887:b0:21f:4c8b:c4de with SMTP id d9443c01a7336-221040bdb96mr284464145ad.42.1740030232395;
        Wed, 19 Feb 2025 21:43:52 -0800 (PST)
Received: from cs20-buildserver.lan ([2403:c300:dc0a:4fe5:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d534951fsm114415335ad.25.2025.02.19.21.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 21:43:52 -0800 (PST)
From: Stanley Chu <stanley.chuys@gmail.com>
X-Google-Original-From: Stanley Chu <yschu@nuvoton.com>
To: frank.li@nxp.com,
	miquel.raynal@bootlin.com,
	alexandre.belloni@bootlin.com,
	linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	tomer.maimon@nuvoton.com,
	kwliu@nuvoton.com,
	yschu@nuvoton.com
Subject: [PATCH v2 4/4] i3c: master: svc: Fix npcm845 invalid slvstart event
Date: Thu, 20 Feb 2025 13:43:30 +0800
Message-Id: <20250220054330.1711979-5-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250220054330.1711979-1-yschu@nuvoton.com>
References: <20250220054330.1711979-1-yschu@nuvoton.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_214353_130279_A3FEE41B 
X-CRM114-Status: GOOD (  11.11  )
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

I3C HW may generate an invalid SlvStart event when emitting a STOP.
If it is a true SlvStart, the MSTATUS state should be SLVREQ. Check
the MSTATUS state to ignore the false event.

Signed-off-by: Stanley Chu <yschu@nuvoton.com>
---
 drivers/i3c/master/svc-i3c-master.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 2140da3f5187..5861358eb9e5 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -58,6 +58,7 @@
 #define SVC_I3C_MSTATUS      0x088
 #define   SVC_I3C_MSTATUS_STATE(x) FIELD_GET(GENMASK(2, 0), (x))
 #define   SVC_I3C_MSTATUS_STATE_DAA(x) (SVC_I3C_MSTATUS_STATE(x) == 5)
+#define   SVC_I3C_MSTATUS_STATE_SLVREQ(x) (SVC_I3C_MSTATUS_STATE(x) == 1)
 #define   SVC_I3C_MSTATUS_STATE_IDLE(x) (SVC_I3C_MSTATUS_STATE(x) == 0)
 #define   SVC_I3C_MSTATUS_BETWEEN(x) FIELD_GET(BIT(4), (x))
 #define   SVC_I3C_MSTATUS_NACKED(x) FIELD_GET(BIT(5), (x))
@@ -589,6 +590,11 @@ static irqreturn_t svc_i3c_master_irq_handler(int irq, void *dev_id)
 	/* Clear the interrupt status */
 	writel(SVC_I3C_MINT_SLVSTART, master->regs + SVC_I3C_MSTATUS);
 
+	/* Ignore the false event */
+	if ((master->quirks & SVC_I3C_QUIRK_FALSE_SLVSTART) &&
+	    !SVC_I3C_MSTATUS_STATE_SLVREQ(active))
+		return IRQ_HANDLED;
+
 	svc_i3c_master_disable_interrupts(master);
 
 	/* Handle the interrupt in a non atomic context */
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
