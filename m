Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87121E937E0
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Apr 2026 00:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VDeUMWF4BXFocETOJ82gwtTrQStV33aiL6uXr/DZ7wc=; b=hujw1VybOn63zm
	RvBBSujzlGqqhTx1Vwd3sL1G3/zFRFKeoCctQp2WaD/EzTJYintiFFFSyJBJsvr679kxUrWI+yD5p
	x2a7IZDcyfmJrLegaznq9yaUzOij/zI2G5bhwoBRduzGWy+mwtVwYCmJgU4l6yklIqOvzPwQLdgtW
	vk39phuTkEKJ85CUxNBx3rNgjGYL79jp/a+MfslHE7Fbi+iToSMPnfAMIZMLQKo4Z/Z/Xf1EVLLlL
	ygqoxS2ZfTesZeSzfWu0bqsxEczpiiVZLkS0Cj5Y6SUnzgY6yB4mP59h+G9YFFVZ5RX+J1Y3IbAJf
	7P+KuJHalOQT5mc5uxwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC5WC-0000000Eoty-3tTy;
	Mon, 13 Apr 2026 00:51:12 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC5WA-0000000Eota-3BmE
	for linux-i3c@lists.infradead.org;
	Mon, 13 Apr 2026 00:51:11 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2b2503753efso32360715ad.0
        for <linux-i3c@lists.infradead.org>; Sun, 12 Apr 2026 17:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776041470; x=1776646270; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OQri9tcgj2545WBZEOXNrZ6QcioiAT3tQ5zzH70Y67Q=;
        b=pH5Z5fqhp7fjgeSrZ6XbRb94LvOE++RU8NhX9xx4M5BCyoqBe8/A4pvpgJKS7nbvIW
         7+gqkG/b6JPEqUp1cEtwWc/VEiw+wQB2y7qauAVZjiJGTjo21lzumsQ2mo2IFe4ccrgu
         ml6CDDEm/wY0rwSdUNHqsR+YqSOKz5IbXNDekZh0D5nmgP6UGCeSOGx7vOtdlM7cMfM+
         KeH9o9WJ0E5Kn4xjXoxs13CoIfOCqMa5QnijNKIicc20oBqSEIPUu0lmvXWlDu/r3bDv
         +FSq1Vk1QFk7TuyQAz/mRJ0tHPog+KoYKkqDs5VJlEJJt8RLaNUIonlv2Zx+JlPKX5Ci
         iGvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776041470; x=1776646270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OQri9tcgj2545WBZEOXNrZ6QcioiAT3tQ5zzH70Y67Q=;
        b=F5YwJtQaS/YihKzpxqWKdo42y9avcNb5bIOP6ilY9lKnbuP43HzKjYsAtbR83tyYL1
         ghNjZ71JkQ4f1qSPYuJntuypdcxFL/JBEYKUkNvBlZTIwbVIcHEyDfIJ7CdVdD8YeSBa
         wqqKK4wQfpwhWnLgmstB9gkmadeFeYDj2Nn4E3jUXLZ6llcSShTLMQWO2/y+JTmnhbuf
         msFpooPNe/oMBfySYuaQwn9eIrzHv8nXESdh7XE/zeibBelUn+25iiNwfrxewFSrFKZ5
         00mgwPYpoKvaabtuIKEHouGdTkJfNEMCdU70KPul4xyQ1ibrG2uy4Ga2mGHY4NCH0bnF
         0qNQ==
X-Forwarded-Encrypted: i=1; AFNElJ+TGVNdbNkUk8fXXSgroSLF3aUrmKyOX3x0m2Rdi7vRxU3tQU0e0dsqBWnvg3ka3vWLW4stYXxnRqY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3O6mFBAUkkSujdSMXTUZToMIr1riGdzp54k18e5ql1b/Bvjtn
	mfBvLk5LbHXVv2k9Bc7H/FAWL76TxyFUPxy2CSNeHIrj+XMOAw0BCfOe
X-Gm-Gg: AeBDieuVNV25jS7hLRvkLdUJIuxNCLabDH09q8RZqFh5NwnsBAYQF4hy7JHfGIinBFA
	JNdGJ5zKMjzhRx7Y+ES+I22ZNwi459ifG0BEA8Xq8oAJbW8G71uE5a+Longd8z+HlIBd0oOX1qJ
	IjBhEe0oWyAt5Pgnw7j6ChUqZy9y4CrjstxL9CjJuqQsYLID08jfR6pzqnoWZA8xfSpstbWC0yn
	LLnlp0GvlYhKqF7OsWxEyEmL1vqyebiCdAS1tn5+bYbH++1CqXGgwrYw11NExI8uIOmY1GpxbKN
	1c9V+aJOR9i82jcrcLSMuubs4r/mntPqDSwkE4ZLNOowTM2FClKVk4hwebq/bjJn2es47yqO32G
	GzF9JcMEkakVD3pAWyChs2T9j8oMuZi003Dcg5K2EVWRPfhzwCAJGRaVdwpgXMXTFxnXn9HQMVu
	rJeyaW8N1LTmceAOR2HBln0SGXOatSjbxK
X-Received: by 2002:a17:902:ab85:b0:2b2:58a2:c8a with SMTP id d9443c01a7336-2b2d57e6223mr86789665ad.0.1776041469814;
        Sun, 12 Apr 2026 17:51:09 -0700 (PDT)
Received: from cs20-buildserver.lan ([2402:7500:400:8d94:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b45f6c0219sm10828465ad.10.2026.04.12.17.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 17:51:09 -0700 (PDT)
From: Stanley Chu <stanley.chuys@gmail.com>
X-Google-Original-From: Stanley Chu <yschu@nuvoton.com>
To: frank.li@nxp.com,
	miquel.raynal@bootlin.com,
	alexandre.belloni@bootlin.com,
	linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	tomer.maimon@nuvoton.com,
	kwliu@nuvoton.com,
	yschu@nuvoton.com
Subject: [PATCH v1 1/2] i3c: master: svc: Fix missed IBI after false SLVSTART on NPCM845
Date: Mon, 13 Apr 2026 08:50:39 +0800
Message-Id: <20260413005040.1211107-2-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260413005040.1211107-1-yschu@nuvoton.com>
References: <20260413005040.1211107-1-yschu@nuvoton.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_175110_806037_B93DABA7 
X-CRM114-Status: GOOD (  13.71  )
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

From: Stanley Chu <yschu@nuvoton.com>

The NPCM845 I3C controller may raise a false SLVSTART interrupt. The
handler first latches MSTATUS and then clears SLVSTART. If a real IBI
request arrives after the handler latches MSTATUS but before it clears
the SLVSTART interrupt status, HW sets the SLVREQ state. However, the
handler still relies on the stale MSTATUS snapshot, returns early, and
misses the real IBI. No further interrupt is generated for this pending
IBI.

Re-read MSTATUS to obtain the latest state and avoid missing a real IBI
due to this race condition.

Fixes: 4dd12e944f07 ("i3c: master: svc: Fix npcm845 invalid slvstart event")
Signed-off-by: Stanley Chu <yschu@nuvoton.com>
---
 drivers/i3c/master/svc-i3c-master.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index b84b324e4111..7d88e8fe3742 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -672,10 +672,18 @@ static irqreturn_t svc_i3c_master_irq_handler(int irq, void *dev_id)
 	/* Clear the interrupt status */
 	writel(SVC_I3C_MINT_SLVSTART, master->regs + SVC_I3C_MSTATUS);
 
-	/* Ignore the false event */
-	if (svc_has_quirk(master, SVC_I3C_QUIRK_FALSE_SLVSTART) &&
-	    !SVC_I3C_MSTATUS_STATE_SLVREQ(active))
-		return IRQ_HANDLED;
+	if (svc_has_quirk(master, SVC_I3C_QUIRK_FALSE_SLVSTART)) {
+		/*
+		 * Re-read MSTATUS to obtain the latest state and avoid
+		 * missing an IBI that arrives after MSTATUS is latched
+		 * but before SLVSTART is cleared.
+		 */
+		active = readl(master->regs + SVC_I3C_MSTATUS);
+
+		/* Ignore the false event */
+		if (!SVC_I3C_MSTATUS_STATE_SLVREQ(active))
+			return IRQ_HANDLED;
+	}
 
 	/*
 	 * The SDA line remains low until the request is processed.
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
