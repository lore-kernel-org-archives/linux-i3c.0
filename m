Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F797C021B3
	for <linux-i3c@archiver.kernel.org>; Fri, 21 Feb 2025 06:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XIxtC+Y9CSr3V+3wLDuV273wih+3pYIDT9vfW2jTzcQ=; b=wuOoIhrxi1lMxh
	DSLCwz4uOxbJzNtHzyhum0AoIfbxv9MyhP8lA8ZCWkhrVsAOEszHU8rubuU37Z/gs4pN/HxytQgC8
	5FEUcMesH/1nEBvBPUCCiKY3bWvd1/tQlZiJy0U12Egghq6FYlGzPqb3Rl6vw5K1siOqKd3UB9Ais
	gYkZcKGiamFKEfSszGuyEBLKHSx0QJn4lTHXDoE8p7fWJtl0YQaHnMJJo4dATV2AxrkKzfbFB5xGB
	wFzL6YdNyk2lQZ7Q8xXGnpnYjpcqIin1H2ARcFHdnkm+LU9J+offSwjNDpXmtnce1ALwapEREEs5Q
	a8CiNBJCnN4MZeTXZ5QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlMdZ-00000004OTG-3zUq;
	Fri, 21 Feb 2025 06:35:49 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlMdX-00000004OR6-3Myk
	for linux-i3c@lists.infradead.org;
	Fri, 21 Feb 2025 06:35:48 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-220ec47991aso23328115ad.1
        for <linux-i3c@lists.infradead.org>; Thu, 20 Feb 2025 22:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740119747; x=1740724547; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wJZZgP9u7QVUH6ZPvsc3Z9sNtX4BPyeqrHPYvkDLOq8=;
        b=TVuPCWgp16yZtXrfB0Q3TOGn0Vi0hkxj5E3pMJfC7ebnT//MDcCsiaCNKHLXrGrixD
         /nStaBkyWzmUY171+HM217bsJZqOx6LgJa8bXqxwJV1zl8vwtOFBfKDh0c957lFL68+t
         qoFhdimhoK6OKXlzm/PBffkBKuD3ygVnaN7E8woktAYpGeZxFGFF7HCSGTPmhRzM+E3I
         2Gs8JcqEghoBTU7FTqOxGd/JFjaJbx0m5T5iWv9N8Oh8o56WA0xzRKYk0VNSAeJFwyYU
         I/tesuFh1lCyU3ZF+Hv5Q17eQ1/1ISZmnl9QES7o9/ZdZ2XQOCdqh0UmdiZ+sLEoYy2y
         SebA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740119747; x=1740724547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wJZZgP9u7QVUH6ZPvsc3Z9sNtX4BPyeqrHPYvkDLOq8=;
        b=T91QDNWR0MDvkwBa3Jybu/u6Hs4nkhDZNbAJM6oCDFmVptq4cJy0AgZYO4SaOIydqP
         pG9x1QjhwFPdun3e0wOCZL0wW5VTbRWvWXcG5qebXO/VRmh5oPX2S/Z0eA0AGvAUWoS3
         Q88ArHM+Cc5Q9prI9FFuEWDsQGWz7AKuw1E9K8dM//4yMxL5T4tazyhGEpSP4JiuPc6R
         UQX+ypncDcYWWwrirJhQk/K2/0bV8sv/nMew32xHb59LuAwEMS1iy3bAqOUHagWlHAjz
         cGnR3fprKzJ+7Cs9FUHZXXIm55QZgBcASCreAjRu8iyBn3ZFIQsEN3EHslo+pM7XolmG
         iBIA==
X-Forwarded-Encrypted: i=1; AJvYcCWe8y3tqKnxy4FL7OMZVUpWrKhpZ4AiA6LIugFXrPN5iq4IXblwbDoe7ifRBrtPfGnzZPcur6FNXpw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxv5SE4RfUvd233Cg497pbZds01Hp38Yh+ZLTjMWP9O3H9U5Rk+
	/OMq34hXb3kNwCUswNhBVldt/eqzYawC28J0v9cex2uq9LyXUergcVvkgA==
X-Gm-Gg: ASbGncs9jHAZJY2GT034wV/Ch2vgA0R0tyNg3fnIavl2hYQJEupkwbj7bl18evW5+gi
	V0Gqj0aOhsv/iYt8edY00cqOd/nvoXhx+uuBzE97fUloX4MWcYYcGcLsbKHN+yetl5oiogoRUyM
	0koZFnKj4xs+NoCUVUn7TQ3cwTwlBkFeTImCiCHkWoKMgnLpJfhZ7kT5N51Ua8meJz+z9OD8yeO
	7NoBO1aZGBQt2BA1m9UsDYvJs33KWgAMZxSFzvTtYQfFTcOhSWNeUnUa0Krl3fzYGDilxhXm2x4
	Ejl/k4fCD9bHQsu12C9UpL5zb9a4qfB5hFve
X-Google-Smtp-Source: AGHT+IEMTD799IywAKKBFI7G5hTdovwrBgU4HCYvF55pPKJBN3Js9sdTAyBxkVcKXr1qHK/d9ElnHA==
X-Received: by 2002:a05:6a20:914a:b0:1ee:88f1:e840 with SMTP id adf61e73a8af0-1eef3ca3f4fmr3727034637.19.1740119746868;
        Thu, 20 Feb 2025 22:35:46 -0800 (PST)
Received: from cs20-buildserver.lan ([2403:c300:dc0a:4fe5:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-adb57c5dc68sm13777275a12.9.2025.02.20.22.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 22:35:46 -0800 (PST)
From: Stanley Chu <stanley.chuys@gmail.com>
X-Google-Original-From: Stanley Chu <yschu@nuvoton.com>
To: frank.li@nxp.com,
	miquel.raynal@bootlin.com,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	tomer.maimon@nuvoton.com,
	kwliu@nuvoton.com,
	yschu@nuvoton.com,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v3 4/4] i3c: master: svc: Fix npcm845 invalid slvstart event
Date: Fri, 21 Feb 2025 14:35:28 +0800
Message-Id: <20250221063528.1810007-5-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250221063528.1810007-1-yschu@nuvoton.com>
References: <20250221063528.1810007-1-yschu@nuvoton.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_223547_844769_B04C41A4 
X-CRM114-Status: GOOD (  10.45  )
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

I3C HW may generate an invalid SlvStart event when emitting a STOP.
If it is a true SlvStart, the MSTATUS state is SLVREQ. Check the
MSTATUS state to ignore the false event.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Stanley Chu <yschu@nuvoton.com>
---
 drivers/i3c/master/svc-i3c-master.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 7919a49e97c7..fca4848d02e5 100644
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
@@ -594,6 +595,11 @@ static irqreturn_t svc_i3c_master_irq_handler(int irq, void *dev_id)
 	/* Clear the interrupt status */
 	writel(SVC_I3C_MINT_SLVSTART, master->regs + SVC_I3C_MSTATUS);
 
+	/* Ignore the false event */
+	if (svc_has_quirk(master, SVC_I3C_QUIRK_FALSE_SLVSTART) &&
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
