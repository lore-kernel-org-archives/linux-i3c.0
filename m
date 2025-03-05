Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB1A2C282D9
	for <linux-i3c@archiver.kernel.org>; Wed,  5 Mar 2025 06:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8fZ8neCQDUobx+hnVkpfNsi5+e2LJdksCstiPpPz82w=; b=sKhVlGgs4/73gc
	ljIWruWUTjlNDfdFcKPZkIAsCkQltnilo/8S1XApI697cnfh27uLrfmsA0E3WHNKsC1ySwiAVwfhT
	4XwE1yTRHLihvhqrRfcRhdx3wv2XwH2QX8ITb7UlVZAnCmB9R9gkqF8i5+U8mlzYnVlqyZKBP30WN
	kvPjs2otMnuLDbmmfujM1kWKOZbnECsUclHouncfU4cNiVxx9XXfqcu0glcsazhxNG1XjgmM6ZJLj
	fpITncNDhUqZndGgWEHmpkMXA+FIAr/rGp8OUHb9lm6pjGInPiNu4JhsbTDIchR/u70Xu+ctXMGYk
	lmsz909mZfdpIC9la85w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpi1s-000000076Ae-1tvL;
	Wed, 05 Mar 2025 06:14:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpfgm-00000006u1e-3emx
	for linux-i3c@bombadil.infradead.org;
	Wed, 05 Mar 2025 03:44:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=rWiOwn7nT5PFN7bTmIow5wbcXHHUl8L4grOIfv03884=; b=H/+rHrts2JUp0kf9wBtAzwkdWV
	ylUWiLPSnfkNqo3YCa2iscDXy8RTayKdvWpeK0dOjPMI6Ws0qBGyZ48YgKLlyiUez0Tif/dOnhWDa
	qL3Z/8h4f/slzzuuswT+fip72oTr8TYTkIoQQzTkteW5OGzpBhcFiRUF3ddtvhcCyH61kCYHAJuhD
	QmS2Qs3uv8eKJjvaU4zsUg1ZNbEJhw+l9+qkGVpe6ZMcaz0mCmbqN+GV5gZg7s9V8YnN0crTgbrQj
	o9kwK6yoGkc23lfZ8jhj96y3Vvc2U1mWxrrKg7U1M4bsLV1tE3YbbIbHndeiTOhH7jI+rtKY6Ijw0
	ZCmkNO+Q==;
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpfgh-00000000LW4-42KB
	for linux-i3c@lists.infradead.org;
	Wed, 05 Mar 2025 03:44:55 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-22349bb8605so122797095ad.0
        for <linux-i3c@lists.infradead.org>; Tue, 04 Mar 2025 19:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741146288; x=1741751088; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rWiOwn7nT5PFN7bTmIow5wbcXHHUl8L4grOIfv03884=;
        b=NWKll3H59Rojem/w5jp8IB5ms4eBe1LxcSX45WbtsZm2gFVybw+kqRGu98Wc9pzAfn
         RcXnWemOlTtvVFQiWQeFiepeskZqI25Bj7uwZ9MaiJ01BLz3786WakiDKmrwkjpc4dOe
         fRvN8DDhS7W7MmeSth4tcXC27V9VjxcR1NmrHNBx2EFYR4ft0qL6Y0Z5yMV2SI16uLyt
         EASK1eM9IxXdrolb718Ba5LicINR4AXjV0fzlN4TKCXeCGkGOJr1Wmuke6VFypMJWAMq
         unU7bDKbxT2mwsPIre/EJOPCtJbYPLOXuO3hL4qS/88f0fkqTpg4qTwmNrTHcj98SfyL
         ihqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741146288; x=1741751088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rWiOwn7nT5PFN7bTmIow5wbcXHHUl8L4grOIfv03884=;
        b=Eqil5C8tWSr9X/sTYXEYXVo1eYQgC/Z0GeM7Evo5OS5QYw7F3e7O6wC0aSzF8jWOPI
         zX+dKcWof4oWueo4NRBRkvs4sPhvawHZmK5H5nEpbaIxXhh6b/BdTc0mjWMcMqcTc+gg
         rTkT0jRo9J3GD3Z7fEqn5CfgiUx7Dq9belylBIw2k9x5c+gtLbKR5P1nlYCvIr4eKDUc
         rWZqov+6husb55NInv/RXHmASqSgwlSdWMdX53KWveUYGJRwhpbmV5xANcQVtGgMpO8Z
         6AbJxUeIxlLZeb8xt8WBt3LJTcz+Ia9S4EG+uQ5FOlCI+by+ch/hDY8Y+klb/aTaX/jz
         BU+w==
X-Forwarded-Encrypted: i=1; AJvYcCXx7wmqakjSRjkqi6GR8aPYZSin2uxf9ajQk89WZvtNA3pwhEDCXGd5YuBBmVjDA20ITU/oelAk6pM=@lists.infradead.org
X-Gm-Message-State: AOJu0YziS1Y2+aWwo/yn2/N3rFCFika4Yd9B4w1j7KFsn6+h+0DrTvRW
	/2K5KKUMN82G0Cc71l4gpOV2qP7Fp0LOsTK46if2EffZ7CkB1ySG
X-Gm-Gg: ASbGncsQ/5UKYdr1HnvPiaVpzqnwLhW3QO+9b6azbTuvAV1QwbFn8N8HsXA30jShFLm
	nvTOCzp1Aev6SLPL4G9th0qNgLXSD/RUmtIIOd7X+lRv44zfFYA84K6bZgwLr18aH+YoGRCzwCZ
	Qj0NvhB1D0W7XCfwoyqbmuvxu9KxbBSl36w+kAycuuSB55+vWYAvqIekhdmUtC1hnWFqoob7fOu
	TuLnwy+q0NWpC4UXxl9oXGrxYOnjp7hVgOuxLefBNHzFI8tR1xYkUhczyrwH9s9KWY5R0GXvW6I
	E4Ayqf3jFq9o0n4iS2S2ekibeIs5ryz/bTVE1GLD5AdL3oJn2mPg1CM=
X-Google-Smtp-Source: AGHT+IF6e7ShP+dFYnCi3KFWoYYWdUXK08szUlSs8mu7o0gUCi5hQ15jqTxbMjAROfk9XAz/T2tSVg==
X-Received: by 2002:a17:903:2312:b0:21f:9c48:254b with SMTP id d9443c01a7336-223f1c9945amr28241945ad.24.1741146288312;
        Tue, 04 Mar 2025 19:44:48 -0800 (PST)
Received: from cs20-buildserver.lan ([2403:c300:d305:9d26:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504c5c37sm102734335ad.133.2025.03.04.19.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 19:44:48 -0800 (PST)
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
	yschu@nuvoton.com
Subject: [PATCH v6 4/5] i3c: master: svc: Fix npcm845 invalid slvstart event
Date: Wed,  5 Mar 2025 11:44:13 +0800
Message-Id: <20250305034414.2246870-5-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250305034414.2246870-1-yschu@nuvoton.com>
References: <20250305034414.2246870-1-yschu@nuvoton.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_034452_718908_0BA3C797 
X-CRM114-Status: GOOD (  13.43  )
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
 drivers/i3c/master/svc-i3c-master.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 46b032b61f3c..5c29912e0a69 100644
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
@@ -143,6 +144,12 @@
  * Fill the FIFO in advance to prevent FIFO from becoming empty.
  */
 #define SVC_I3C_QUIRK_FIFO_EMPTY	BIT(0)
+/*
+ * SVC_I3C_QUIRK_FLASE_SLVSTART:
+ * I3C HW may generate an invalid SlvStart event when emitting a STOP.
+ * If it is a true SlvStart, the MSTATUS state is SLVREQ.
+ */
+#define SVC_I3C_QUIRK_FALSE_SLVSTART	BIT(1)
 
 struct svc_i3c_cmd {
 	u8 addr;
@@ -586,6 +593,11 @@ static irqreturn_t svc_i3c_master_irq_handler(int irq, void *dev_id)
 	/* Clear the interrupt status */
 	writel(SVC_I3C_MINT_SLVSTART, master->regs + SVC_I3C_MSTATUS);
 
+	/* Ignore the false event */
+	if (svc_has_quirk(master, SVC_I3C_QUIRK_FALSE_SLVSTART) &&
+	    !SVC_I3C_MSTATUS_STATE_SLVREQ(active))
+		return IRQ_HANDLED;
+
 	svc_i3c_master_disable_interrupts(master);
 
 	/* Handle the interrupt in a non atomic context */
@@ -2018,7 +2030,8 @@ static const struct dev_pm_ops svc_i3c_pm_ops = {
 };
 
 const struct svc_i3c_drvdata npcm845_drvdata = {
-	.quirks = SVC_I3C_QUIRK_FIFO_EMPTY,
+	.quirks = SVC_I3C_QUIRK_FIFO_EMPTY |
+		SVC_I3C_QUIRK_FALSE_SLVSTART,
 };
 
 const struct svc_i3c_drvdata svc_default_drvdata = {};
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
