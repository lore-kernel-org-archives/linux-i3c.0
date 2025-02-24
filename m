Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 818B6C021B9
	for <linux-i3c@archiver.kernel.org>; Mon, 24 Feb 2025 08:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uuYB+lxR/B9O8urJXKOYXc+jHWfzV8ZA0g2o81QpbCY=; b=qgiIHj0RTsvenC
	rvfcPXjGLk1MaLiucVDyLkx/96LywV1pn7oLzw4N02yu2KiH71qHVlONW/9uKdxEthq/WIVJNHDCw
	JrWCgP/Col2EhuB+BhhoSF7z99lVdUxfSxc1FL5gMZJ5IaBrNT5rnl/s2BcbjgxZh3tnKveOChayy
	+zDci9z1L5UTNtf40BK6bXi5NI3SyrvC5/YyQyLgZD2h7Labr1kA6w1Ivp1vTynaDcXdnC8T6XcU8
	ZBclPdLPF6ZFW3wZEjgGIPurXtk/MYbiiTpTkglzPGtpJdB+OuPfuun057xxXi026mGY5EtgQuSmW
	iQIHynwhn1BqNr1klerw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmUJP-0000000CnLk-17FD;
	Mon, 24 Feb 2025 08:59:39 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmU0K-0000000CjT5-2pe0
	for linux-i3c@lists.infradead.org;
	Mon, 24 Feb 2025 08:39:57 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-220f048c038so76272425ad.2
        for <linux-i3c@lists.infradead.org>; Mon, 24 Feb 2025 00:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740386396; x=1740991196; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KLJZ0UdIyJvoaYBSKuZ/YiS+j0w/Er7zxoHnMzji8nw=;
        b=iRz6TavEzSby5/UKodUjxDleOvDdEJ8WNVRPiY8f0DFYWi7TRea3yImjZBBTiAGBA3
         AwVBNH0AJedTsFiq9a39JE0HQd1OQha9SDfdOuh8wivPui1woFUy220ROkrz0tD6sYcr
         bPqJW+yBjLkNvwi0c+RAxhzVv2SgpdwmBur7AqFZBGwOOTxG49CCYaefUwussNBhANB3
         nZbJLWIL3b2Zbb4dZz8lKgFFY7167vnVP5pR8jYoerYDier7bpacUdiss20u7kNeG3Rr
         riaRP809Pw9kVLU/rLDZIW3oCiaf+0n0JbbDc2oXTIU59Ht1Dz13+lniItRK8hIq1sPd
         RKIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740386396; x=1740991196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KLJZ0UdIyJvoaYBSKuZ/YiS+j0w/Er7zxoHnMzji8nw=;
        b=awxBezOAwhLQS1EiaFYA0KNl9Yr8vMPT7YFBGjgRXdEnwBQ9MwV0dXKMp/t8CcfCg2
         /MwcaRkQGADEuqX0X0b3+GPAAjOmYnhlOVXLiYhBmVlmeej1k/ia+5HUP8uEikpWAkVx
         Uuq6ZBSz2+hY8QaRJGvkaUOlkYFQTQo3jJX3tSfGQJDVtFhbw4te4Lhs/UnYGZ4Bv0Bu
         aM88o4AwPhk7OEUUGWQWgFUUHGpU/O+o+nCXDgGFU8/lkt7gaOfqtW5rLh/OeFP3e3rw
         p9SGJdtBrOUbAvKJzZjA6+SPXc9gG08wKKn2/GtuFXlWFnKWFPNIprKv96igU2fyQrx/
         N/Kg==
X-Forwarded-Encrypted: i=1; AJvYcCU9HIcR/lnTvDcCmUyd8oj9cArxcL4yzDBXEMlU5lgSpyHidP4Gf37G0YBQvt7pKcgI8RO9DOv92nE=@lists.infradead.org
X-Gm-Message-State: AOJu0YyH9dGSbo5ObO8+H4SWYfHI4RoGHyl/g1iHmIZCkJR4Kv6E30Ow
	FixEiTfyM/LtYR8vfEaa6U4w9UgnWBT2LR7jqbmL7oTdc/SOpAKr
X-Gm-Gg: ASbGnct8/ugLIuBLagPAa/aidbsJOryHO7uzARdKdriGzW1xqSkbagdGDURyhJrzrnx
	Xf+JOOI9JD8Lccsx6ZRm+FWbOj46azizTV72bgVIGplIIPu6RRz3Wy1wu1gO6HtgCcLH8/DqWVd
	QQgWz10UOal15G+tnaoTf1ACsiHI9sYNeOVCN/1HjENavyOMRxfQ8078PM6s6io3s4RNvNf7rv7
	N7wflfqiVsKCA/3UnPJTRndiYIEqsznp1HDc+obsE71HoayCB3ewJSGhFzPUIqQhTyzuNNlc0Ug
	TYfV/rS9dHTfPMQtb6MGulIiwDARiSSpryUq
X-Google-Smtp-Source: AGHT+IHmzcYOYpmi88RS8NVpMCYxjPv8F2R9zaGHSVBGMM+f8o94gQg8TxLc4zMuEg1JgPNRviBc3w==
X-Received: by 2002:a05:6a20:a107:b0:1ee:e641:ca8 with SMTP id adf61e73a8af0-1eef3cd44cdmr22835172637.20.1740386395705;
        Mon, 24 Feb 2025 00:39:55 -0800 (PST)
Received: from cs20-buildserver.lan ([2403:c300:cd02:bc36:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7327590ff12sm14634793b3a.115.2025.02.24.00.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 00:39:55 -0800 (PST)
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
Subject: [PATCH v4 4/5] i3c: master: svc: Fix npcm845 invalid slvstart event
Date: Mon, 24 Feb 2025 16:39:07 +0800
Message-Id: <20250224083908.1880383-5-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250224083908.1880383-1-yschu@nuvoton.com>
References: <20250224083908.1880383-1-yschu@nuvoton.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_003956_720373_DA23534F 
X-CRM114-Status: GOOD (  10.12  )
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
index 07506ae0f914..4eb4b8888725 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -59,6 +59,7 @@
 #define SVC_I3C_MSTATUS      0x088
 #define   SVC_I3C_MSTATUS_STATE(x) FIELD_GET(GENMASK(2, 0), (x))
 #define   SVC_I3C_MSTATUS_STATE_DAA(x) (SVC_I3C_MSTATUS_STATE(x) == 5)
+#define   SVC_I3C_MSTATUS_STATE_SLVREQ(x) (SVC_I3C_MSTATUS_STATE(x) == 1)
 #define   SVC_I3C_MSTATUS_STATE_IDLE(x) (SVC_I3C_MSTATUS_STATE(x) == 0)
 #define   SVC_I3C_MSTATUS_BETWEEN(x) FIELD_GET(BIT(4), (x))
 #define   SVC_I3C_MSTATUS_NACKED(x) FIELD_GET(BIT(5), (x))
@@ -618,6 +619,11 @@ static irqreturn_t svc_i3c_master_irq_handler(int irq, void *dev_id)
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
