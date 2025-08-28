Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C2A5C8303F
	for <linux-i3c@archiver.kernel.org>; Thu, 28 Aug 2025 09:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P47ty7uBBxzxgl/y89pJPBy/ntQgNZkBhu/kfcqhan8=; b=sjaq8ZWgiKC4Ck
	EPHTrxSAo6rCK1n51mLoJQKKekbO5g5kipl8c/y/MDqjeM8VHrlo2tvLMMICADQjE7BVj23kJdkvo
	p1FfFg792sxeI8NjWK4rToh/RJztM4Dz5SGBLlzeHNFp6ymvaCb0nS/7Nh+aAhFZKCHQZczdPiv5H
	D9YU57eIg9KrQgdxqkHd5slVPmTus13eLqLSdlyFAEbpud70zUwD8SkeHB7IudZKILnHC0hx8Cauh
	y5PLdXJhc41VJWBgM69VGX4+piR/N0+1xnyq2Ua3Re2knvvzrxxBkk1NcQq2/CrNqVEstSZxtoAgT
	KLE52kBjCYAtSvHSOTHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urZ2N-00000000z5l-0pXG;
	Thu, 28 Aug 2025 09:35:19 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urY3i-00000000oDF-0tG4
	for linux-i3c@lists.infradead.org;
	Thu, 28 Aug 2025 08:32:39 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b4c1aee9ecbso413854a12.1
        for <linux-i3c@lists.infradead.org>; Thu, 28 Aug 2025 01:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756369957; x=1756974757; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lm8GPCPzMzcahypxzHwZb0Rzqx2ICQwQ/5Ip1qxN3kk=;
        b=Idp/nG4L6o19HbgQh/QY0YV/xz29P4LqMvzbL6cK5YjvjwasXtn29UmzzKUQt38VKZ
         ErnN4aYjHB+hjDrPdrCdNJh3wgZ3BuXR5WUfw+FkGCuoFrBPLFG3ueeQt9TCBzIccAvT
         vePR00SF8mkKHN6xWUPY+m/12mBAn0Zscjp+aeSkib6orSsUqBbUzb4fzDpXlBIVcUbl
         OKH1EZlxaMlnYiyKCANHOu8ZqgfepMcsdF5jhG28wBvhkMvY4EbsdZIqQmWB/tltDp8D
         U3P8dW4U1/s5CYe0uJqd1+5qjyIFQAhoI00nBr48UQEtY5xw2CyQfAttu5sBKrzLBDhV
         3VvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756369957; x=1756974757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lm8GPCPzMzcahypxzHwZb0Rzqx2ICQwQ/5Ip1qxN3kk=;
        b=OhZnSybf+Yi60Cb3In9tDluU0l29ujEeZqcNUUMtNvPlQ+PGEiY5bVkmogIx1O+Zdp
         DbtVRyl/V+GCG3TDcs4t34qY02ub47icBlssLpafK/Xlexx+iKNewd9iEoPg2PCtq/aA
         2v2O8ol5Q80JHBZKaW5JHIZdun5QTBKPIZw3L68BM3KJsIBY8eus7m9LtAMzy2453D3U
         ToxSMI687VbghugkLLmeO5R/XhN3739TmkzHtDTEPRhDfSZFzLLTeDPYekniGg1QEEPK
         EL7tlRkbhtrdcNOoef7hGeCACiKymD0/czcZYnm91/4Xdu45ofD3ZCegeGDDJKC5Fo85
         E/uA==
X-Forwarded-Encrypted: i=1; AJvYcCUufhXZjlh4HF/ye1mCZP1UFKfLIRFnCPHEWenyMB0TWz6odR2kdqyL5Qy70CkwsBgVeA9s/lBWsgs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/wHQH+fG259mPLApPx9Nw3qEr7OhmqgTfVSXcw3VBGnqE3qnh
	g6xVvS2vStyMsppsqJuOYyZISK9NdT9pgw/XZty6VvfhP7TB3ArL26CjPHphAg==
X-Gm-Gg: ASbGnct1Sn2/Fsw3CJcud439+SCNQO2jbHFbL7im10N858REu4zmwzJI1BGNSkSS2a9
	YnbdWHObSqyJqKlA6Rwx32f2SCNFybdIBpJg+KvKjI+9GSNBXjNNWfPMJOz94ROxYweHElX7hCt
	Hbw/nbmO8cFl+PAftr0Dyit/fcaRTu57IEV3cEZnkb9M97GVFkBUSgBDsbsbUjEV0Ix0BUYHojG
	UlgbqvERghwyy9Va073eopoi3T+ffGHFVqPXHq2h5ptuuSLkedzJ4Vwu5ftLfBIyEnt+xMSQqsX
	QzZhWvTEEK0oFM6+/fjQnZRQQ305fFBP0V5jBtxovEu1QueZPBXzjqdBGGu7ZfU9zbVG+ZxDwBh
	RGy/a78YhkKV3yXB/GQ0FpBO6mJ93NDldbT4p7Szn4aI/QfxezXkf5A==
X-Google-Smtp-Source: AGHT+IGhM/ccZEyF0simKH/f54xmziqAM/K0pJ/uS89XeLLZK3ZgBAFLP+zAoPECYnU+ZMpLrWUxrQ==
X-Received: by 2002:a17:903:41c9:b0:245:f6aa:1cd0 with SMTP id d9443c01a7336-248753a2592mr126200535ad.17.1756369957036;
        Thu, 28 Aug 2025 01:32:37 -0700 (PDT)
Received: from cs20-buildserver.lan ([2402:7500:500:7a9f:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fde4cecsm4335148a91.29.2025.08.28.01.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 01:32:36 -0700 (PDT)
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
Subject: [PATCH v1 1/2] i3c: master: svc: Use manual response for IBI events
Date: Thu, 28 Aug 2025 16:32:24 +0800
Message-Id: <20250828083225.3558100-2-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250828083225.3558100-1-yschu@nuvoton.com>
References: <20250828083225.3558100-1-yschu@nuvoton.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_013238_251876_AD76FE7B 
X-CRM114-Status: GOOD (  15.27  )
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

Signed-off-by: Stanley Chu <yschu@nuvoton.com>
---
 drivers/i3c/master/svc-i3c-master.c | 28 +++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 701ae165b25b..baf3059fd668 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -517,9 +517,22 @@ static void svc_i3c_master_ibi_isr(struct svc_i3c_master *master)
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
+	       SVC_I3C_MCTRL_IBIRESP_MANUAL |
+	       SVC_I3C_MCTRL_ADDR(I3C_BROADCAST_ADDR),
 	       master->regs + SVC_I3C_MCTRL);
 
 	/* Wait for IBIWON, should take approximately 100us */
@@ -539,10 +552,15 @@ static void svc_i3c_master_ibi_isr(struct svc_i3c_master *master)
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
