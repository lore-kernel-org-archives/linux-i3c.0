Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F39AE9380A
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Apr 2026 00:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8f08+qqsq9j19xeeL/CvU/1Ap7qasZ9/tc5RKq3vbPA=; b=dVTuVwjTocwmHA
	3OkhZbQXjTvY9v4fDtTXr+DUlo8tCi3YXMVP4ig/62yXU0S65/i9iWgKsOKWt0Je3dXnbaZtEVI2T
	v2ncv55+BbkVyIy9lmQOQSLgAEVQEVCjVIDfFplVFbZ+65gl5FBGQT6V1Wc0mNyDwRn03RZK0KHNi
	Fd8+i7BAkQjVO4clD70Faxr7eGwlPGZ5GHGbrwVZF8NXy4DP6CaAsdrH5SkycMHgYot86jlNfplUg
	LJn3TEgEK1xz5KBReBGSy+c3U3RJy6WofmipWFsELHQweKv3jdcxL4qaKwLvmLHy8v5VqnFBURQT1
	kHYfKirjWdG+ATqMatfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC5WH-0000000Eouz-0ijw;
	Mon, 13 Apr 2026 00:51:17 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC5WE-0000000EouB-2INp
	for linux-i3c@lists.infradead.org;
	Mon, 13 Apr 2026 00:51:15 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-c742d4df00cso1357944a12.1
        for <linux-i3c@lists.infradead.org>; Sun, 12 Apr 2026 17:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776041473; x=1776646273; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fCdLQUwKUq/TaTvCHPiaOA9I4AIEnq8NxSjBkqK9qpc=;
        b=EoBikddF9BMUGkSxpgDeSd+710v0antPlIpBZSV+CNh59W7Dmr1LHGk/NrvugTAxz1
         a/KtpWYa0Lm45myeLmu9jw66aiGRrRBtq0BAuwNQYaDHmqJZyt+F7b+8rqYzzmqXWFLi
         HSNuRuVdtJvzILNHwBqRTWQ44WCdtITRPu5yVC6KRQc/p/nqJDB3CtVC0HJ78GLu8u6E
         YLkZfJO9Tr1iB+OMl2xVkcQ6FWfQqVlsn8+tk0pG+hCpuNLO7ENHFYk74qI1K7Xqn4Rq
         0Tv/0PCYcFQ4fkzaJ7Hbbzqe5URNbKoWnrRjl+Tukcancwumh+C/fx10nmqnp74uTos2
         fXOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776041473; x=1776646273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fCdLQUwKUq/TaTvCHPiaOA9I4AIEnq8NxSjBkqK9qpc=;
        b=cpvwaH26EtSfliCC7iT0VumKiyg6aT9t+IZH+1y+NxZnwxJwEMgBQHhk02iwQNI+qS
         +dp6eCcNBcTJt9VwHeVOIPEtiLxacYmakK32HAM/ZgboEfapQKcz/omBluTp95H4dNhD
         88TMiIgRmJGgMwtLIbyoXJQjcL7UKJipQX4YNKhu7pj/1+gj0gTpx9lTVkBrWJqxHs7p
         +xUEt6s0m6MsVDcodDZZ2i6RKRx586x9LStBfzx6JNiw2tNjMqVzWKIWE0kpXZrasmWq
         hOCTJQMEZFVaKqD51QnregoYHHuk+mW9ocnjylpDtx6+yjk0zcrzRN/w2LZ6DnQwxDsm
         klDA==
X-Forwarded-Encrypted: i=1; AFNElJ/gX4PcuWtGcluP9+XAZ+vMH7MJ8jFLCL02F8PNKpuprmzgdP/EwfhFEl06kZoAfw3ZF+YEqg8h/NQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0l4oAq11PiSWEAgXXWI/WsEHRmoploOLf1baMGsEAmg0O+Edb
	F7QK6gYkYHku2aqZF+Elj3BTbR8S0AGWeZowrGHRkIQegu+iTFx4Flp2
X-Gm-Gg: AeBDiev9Uo9AnLFdbE4QbZZ+DrUODlE5eIwMy8sfzcYrHkKH5ya0qt9Ikc+tFhiwA0D
	X4mIgYiH/w76xK7Im0KKH4hgfuY7ai2DDDXGpg0X/DTlgTL2EEzmzjsAFWRdM6hqdCT+wPGppTf
	vfDz39J46FxfF9BXUFuWLLXYVWt/xXZhtKxL+ER9wwFOxMmR1FUpN1LhCtxem25FljH9tZNqAC3
	nfgIr6FJ2m3iwRNRfDlqlIgf/UnFLI+o2LzT6dnuLeHwz0PJDgiqfzP4F2iL6aB1FImkiBcF+Rk
	rCMxU8SmErxig8rGeRsoOvVQrQKrb90bgTGVlWeP4vJ8Iffkqq/regBdVi0vhxFnAOon/jaQP2s
	qPXh6AblyZc7BUVLaajxmSwJvtMe65NJi3TmDJ19HzPRd2SqjeXxuwR71JabulYq06H5z37PxJu
	4HasOkNe47iRKqqGo24rbcC0AyRibTFVR2
X-Received: by 2002:a17:903:2ed0:b0:2ae:5346:d4e6 with SMTP id d9443c01a7336-2b2c73a4423mr142859085ad.28.1776041473608;
        Sun, 12 Apr 2026 17:51:13 -0700 (PDT)
Received: from cs20-buildserver.lan ([2402:7500:400:8d94:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b45f6c0219sm10828465ad.10.2026.04.12.17.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 17:51:13 -0700 (PDT)
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
Subject: [PATCH v1 2/2] i3c: master: svc: Prevent IRQ storm from false SLVSTART on NPCM845
Date: Mon, 13 Apr 2026 08:50:40 +0800
Message-Id: <20260413005040.1211107-3-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260413005040.1211107-1-yschu@nuvoton.com>
References: <20260413005040.1211107-1-yschu@nuvoton.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_175114_593766_CD889531 
X-CRM114-Status: GOOD (  10.83  )
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

On NPCM845, when a target on the I3C bus gets stuck holding SDA low,
the controller reports a false Master Request (MR) in-band interrupt
event. The driver handles this by emitting a STOP condition to restore
the bus.

However, the hardware quirk SVC_I3C_QUIRK_FALSE_SLVSTART indicates that
emitting a STOP condition may spuriously set the SLVSTART interrupt
status bit. In the Master Request case, this creates a feedback loop:
the STOP triggers a new SLVSTART event, the IRQ handler fires again,
the controller still reports an MR type, another STOP is emitted, and
the cycle repeats indefinitely, resulting in an IRQ storm that can lock
up the CPU.

Clear the SLVSTART status bit explicitly after emitting the STOP in the
Master Request IBI handler when the SVC_I3C_QUIRK_FALSE_SLVSTART quirk
is set. This breaks the feedback loop without affecting normal SLVSTART
processing, which is already guarded in the top-level IRQ handler by
checking that MSTATUS is in SLVREQ state.

Signed-off-by: Stanley Chu <yschu@nuvoton.com>
---
 drivers/i3c/master/svc-i3c-master.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 7d88e8fe3742..c16397013334 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -655,6 +655,15 @@ static void svc_i3c_master_ibi_isr(struct svc_i3c_master *master)
 		break;
 	case SVC_I3C_MSTATUS_IBITYPE_MASTER_REQUEST:
 		svc_i3c_master_emit_stop(master);
+
+		/*
+		 * If a target gets stuck holding SDA low, the controller reports a MR.
+		 * On NPCM845, emitting STOP may spuriously set SLVSTART, retriggering
+		 * the interrupt and re-entering MR handling, leading to an IRQ storm.
+		 * Clear SLVSTART after STOP to break the loop.
+		 */
+		if (svc_has_quirk(master, SVC_I3C_QUIRK_FALSE_SLVSTART))
+			writel(SVC_I3C_MINT_SLVSTART, master->regs + SVC_I3C_MSTATUS);
 		break;
 	default:
 		break;
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
