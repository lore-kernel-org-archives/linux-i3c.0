Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE76CA0EED
	for <linux-i3c@archiver.kernel.org>; Fri, 29 Aug 2025 01:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DpGBb3BOU9tlpI9iWdRPGG3Y2aVIdgp8AxM4PJ4RlSE=; b=IUf3TnCYdsErKB
	nOL5gof5y3uWVkDSoGTbJOr+0yLlSds/lfZty5w4wJ2bItzrXySsc2RKryhST+rwvczTV42Fl2O8V
	zYCQXpxUJLj84RlnHxU36HBBo38P5yz1ttI9ibS/n5XCpAf9YHbVIw/Qq5XBVCwkw0k6jli9plfkv
	pOtPUxNC2kUUtRyC0Rxoi0euWgCCsZDpcEDrz7FkpRMZoPMTdIp0ysCwsr1HocfS0oxhMkAULuLps
	V7PyrCbOE4JoW3P9F7aiKfZJh/8uWHua5f6zGE6/A7rrwg003NbTniKRGLoEqagAdipPGSRNgbWWI
	NGX3GNI8Ea3ZNS0E7bdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urnzR-000000041c4-0Zbf;
	Fri, 29 Aug 2025 01:33:17 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urnxG-000000041M4-1WYi
	for linux-i3c@lists.infradead.org;
	Fri, 29 Aug 2025 01:31:03 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-327ae052173so841413a91.0
        for <linux-i3c@lists.infradead.org>; Thu, 28 Aug 2025 18:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756431061; x=1757035861; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JCc+9KPYWnXlW7uF+KcOgI9YRTfMpRpG2O6mgKyAsFA=;
        b=W2kCJr9gajnFKHwntLs4W2LwIUiRhzLvoBTo1utAvzl7QjpXFENxsj7YjkJsWaIIlF
         AYkEnJfPinaJF+QxAjeW0pCYoaIxwlHiBLtV1pi+EgRIoIm067uTCesyGjqxdY9V4BFQ
         sJ0E7hWU+rWnqrHskI1YnfeQKCV79TPoqkZvEIGehy1Gq4RRbP4lBsTXIADOKo7JCFN3
         cb/0UzdmbCLntcdqeirRlGJDv9MUCgAVPXOn42eAQunQpabkVyN9ROIGxpYFY5zqzgbY
         Iucq7rVkGmnW33jwV2mQ65ATp0mKIlCaDMm0IfnOWn5KyfoL7meQu2OfVCK/aS63gO+i
         btRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756431061; x=1757035861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JCc+9KPYWnXlW7uF+KcOgI9YRTfMpRpG2O6mgKyAsFA=;
        b=MQo5gOAjfhjTQKe9Ui7Jf9ZP1F+jsOMvXe94HL6HerZQPjTz1fDudyDXtLBqLCUwFJ
         7FMs6fMuoeAcfiztxhe2yrwHVYPP8MZhFv5tqfrRrQMFuDWyS+RTO644rTyhHqUIG791
         dMBGI3MO0rfWiu1Nt8TwLdckkZ43zxfDK5coVau2fHoWrrHDjETF3GLdgK1DjgZFi6BS
         OSoxcZYWDA7btHM9frbvru7fDNFDkefUNFJtCtaZjx/Oq6SekTbnLR7TVwv6uzm17dTm
         Z6nPhoh+7mo1fG6XBCtpMk/G8y1oYTo8/NbrozEygGYrm0Wb/tnSC4YuFFdJ/YeE2uF2
         HIVw==
X-Forwarded-Encrypted: i=1; AJvYcCVVATqVMhS4wOQvcGzUqChWD+CTNAuUsEAjxPbo1FOvkic7nmpNUdUec/VWW0ULb5msKNm6BeCkv34=@lists.infradead.org
X-Gm-Message-State: AOJu0YwSFvyzlABFI7a7Wtjy/0CJ1jTWHS648n4x8DMujqB1uTv5u07j
	GjqUjGdX79Fm4gDr99PmaRaEt3HWnJfA3Itb4Rb+JS/0G8+C+/56ayHb
X-Gm-Gg: ASbGncvifqBfV4f1XjYUMwTTaqRX4vcc22PEK2s3SV5yAMAPMEzDTL8gMVJsqwwsDGD
	VjN9wO/Ncmxwt97BLKTx/ITmogwz5CLwRrgLlfqvHAWE/iTT5bj+P6ijBkzimEsDZ2Bu/iuW3zL
	WOkpxVmxDXKPU5pq2v1/UEzZZUAWP7UNobENxarbfRkHOnBlwy5NwIxsuaii1ossSA3kK+b7J7O
	0X/SZy+wm0bRMwCwBYvsWCoC4ajqRGgkelMMV0n9pdLi3a5JMJ5ze+hjMoaDXA+mRPyCzFCDQZf
	TS4Ju4cpe9D2bMNLSnJ2aAMAOMWWHEmf+/tAEL/OZHIDuDogew3/5y2lKRZ7JCigKsiDZO38u1K
	kBq6wxyz+Xg5e/S3tZxpngaGM+vbK0MxAkYXfXPSHDCE=
X-Google-Smtp-Source: AGHT+IGzfeCPaZZjJB+gqeKg99B8LCs/ZeRT0KWO62kRVGoGTA+idY+/TD5Dbn/d3RbdoRGPeyQ98w==
X-Received: by 2002:a17:90b:5644:b0:327:70b9:9d68 with SMTP id 98e67ed59e1d1-32770b99e1bmr10491075a91.16.1756431061407;
        Thu, 28 Aug 2025 18:31:01 -0700 (PDT)
Received: from cs20-buildserver.lan ([2402:7500:500:7a9f:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327daeec552sm959977a91.27.2025.08.28.18.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 18:31:01 -0700 (PDT)
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
Subject: [RESEND PATCH v2 1/2] i3c: master: svc: Use manual response for IBI events
Date: Fri, 29 Aug 2025 09:30:52 +0800
Message-Id: <20250829013053.3562853-2-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250829013053.3562853-1-yschu@nuvoton.com>
References: <20250829013053.3562853-1-yschu@nuvoton.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_183102_399578_2E9FB3FB 
X-CRM114-Status: GOOD (  15.21  )
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

Driver wants to nack the IBI request when the target is not in the
known address list. In below code, svc_i3c_master_nack_ibi() will
cause undefined behavior when using AUTOIBI with auto response rule,
because hw always auto ack the IBI request.

    switch (ibitype) {
    case SVC_I3C_MSTATUS_IBITYPE_IBI:
            dev = svc_i3c_master_dev_from_addr(master, ibiaddr);
            if (!dev || !is_events_enabled(master, SVC_I3C_EVENT_IBI))
                    svc_i3c_master_nack_ibi(master);
            ...
            break;

AutoIBI has another issue that the controller doesn't quit AutoIBI state
after IBIWON polling timeout when there is a SDA glitch(high->low->high).
1. SDA high->low: raising an interrupt to execute IBI ISR
2. SDA low->high
3. Driver writes an AutoIBI request
4. AutoIBI process does not start because SDA is not low
5. IBIWON polling times out
6. Controller reamins in AutoIBI state and doesn't accept EmitStop request

Emitting broadcast address with IBIRESP_MANUAL avoids both issues.

Fixes: dd3c52846d59 ("i3c: master: svc: Add Silvaco I3C master driver")
Signed-off-by: Stanley Chu <yschu@nuvoton.com>
---
Changes since v1:
 * Specify full fileds in the MCTRL register
 * Add Fixes tag
---
 drivers/i3c/master/svc-i3c-master.c | 30 ++++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 701ae165b25b..8e7b4ab919e3 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -517,9 +517,24 @@ static void svc_i3c_master_ibi_isr(struct svc_i3c_master *master)
 	 */
 	writel(SVC_I3C_MINT_IBIWON, master->regs + SVC_I3C_MSTATUS);
 
-	/* Acknowledge the incoming interrupt with the AUTOIBI mechanism */
-	writel(SVC_I3C_MCTRL_REQUEST_AUTO_IBI |
-	       SVC_I3C_MCTRL_IBIRESP_AUTO,
+	/*
+	 * Write REQUEST_START_ADDR request to emit broadcast address for arbitration,
+	 * instend of using AUTO_IBI.
+	 *
+	 * Using AutoIBI request may cause controller to remain in AutoIBI state when
+	 * there is a glitch on SDA line (high->low->high).
+	 * 1. SDA high->low, raising an interrupt to execute IBI isr.
+	 * 2. SDA low->high.
+	 * 3. IBI isr writes an AutoIBI request.
+	 * 4. The controller will not start AutoIBI process because SDA is not low.
+	 * 5. IBIWON polling times out.
+	 * 6. Controller reamins in AutoIBI state and doesn't accept EmitStop request.
+	 */
+	writel(SVC_I3C_MCTRL_REQUEST_START_ADDR |
+	       SVC_I3C_MCTRL_TYPE_I3C |
+	       SVC_I3C_MCTRL_IBIRESP_MANUAL |
+	       SVC_I3C_MCTRL_DIR(SVC_I3C_MCTRL_DIR_WRITE) |
+	       SVC_I3C_MCTRL_ADDR(I3C_BROADCAST_ADDR),
 	       master->regs + SVC_I3C_MCTRL);
 
 	/* Wait for IBIWON, should take approximately 100us */
@@ -539,10 +554,15 @@ static void svc_i3c_master_ibi_isr(struct svc_i3c_master *master)
 	switch (ibitype) {
 	case SVC_I3C_MSTATUS_IBITYPE_IBI:
 		dev = svc_i3c_master_dev_from_addr(master, ibiaddr);
-		if (!dev || !is_events_enabled(master, SVC_I3C_EVENT_IBI))
+		if (!dev || !is_events_enabled(master, SVC_I3C_EVENT_IBI)) {
 			svc_i3c_master_nack_ibi(master);
-		else
+		} else {
+			if (dev->info.bcr & I3C_BCR_IBI_PAYLOAD)
+				svc_i3c_master_ack_ibi(master, true);
+			else
+				svc_i3c_master_ack_ibi(master, false);
 			svc_i3c_master_handle_ibi(master, dev);
+		}
 		break;
 	case SVC_I3C_MSTATUS_IBITYPE_HOT_JOIN:
 		if (is_events_enabled(master, SVC_I3C_EVENT_HOTJOIN))
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
