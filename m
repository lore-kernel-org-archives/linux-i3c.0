Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 341DFC44501
	for <linux-i3c@archiver.kernel.org>; Thu,  9 Jul 2026 07:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e/J2oJYIAwpCaS6QfjimOK/XjYRYVbrwxXUFlgE+t04=; b=zkqDeBMIcfShrH
	HGlxXBZiKfr4C8dMoiBjtn3bOt5lNXRoJ3R2YkgQY+UJUzxTJOL8pFo5IRCSj64DhSwLcpG6qeT8+
	4cdlnPe1Eca0/30BIluT3opfe7BIOKLCkGl7MXKLXyBKnS8PAlVrj+CPiPW/cIh+VOuMm6+ff4Sf6
	ELEL0zBpBbvaB0u73AEBh9SIDwhvHDdCthKSrMgTh7GHvvXKLMvCgHm4kgXBEht38qNRy4qFc4DAA
	+Oux1W3B6xeQxaQBhrjYQ26fOjJno6M/Ti7lvZ5oO7FXDrn28KEBrqRjtvCequAe7TkNN+YUV9Ig9
	GKVSXMUXYhA8t/Wkznug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whj2L-00000001G4p-3wdN;
	Thu, 09 Jul 2026 07:19:09 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whj2J-00000001G4O-0UGQ
	for linux-i3c@lists.infradead.org;
	Thu, 09 Jul 2026 07:19:08 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-383cb94f742so1258622a91.3
        for <linux-i3c@lists.infradead.org>; Thu, 09 Jul 2026 00:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783581546; x=1784186346; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+WFNfFbKOHz8rbBtuS6BZdNUXdaQqfa8+sgLreMsrDw=;
        b=dpoM5mq0b4lOmd88KMNRVcFaLHkOeOh2i1jM/nyGtXDvCuXlu+mSAYEtlyov8kMI7K
         jyDwb6VgCTZapQuunWcJP9rdAO+/Vi2UUTiLMf94s5+gaRBjYdbx4l/FuLEzUKGp6jqF
         58lMgBV469Vx+sSp7rH23XDcC54azld8T8flH4QJBQ7laX3k41Q4EzR2RWn2u59p84QW
         KC+T1YX4e4iGlrnHPwwQ8TEzuxPWoF0OF6nDQuHwuZpX9Htb9zg3HXnLAQ5qenNdOwGb
         gI1wxdbWwv2pP8k1VQtbiz4WqvY6C3s3mhh3uE8jy3Sjq1gDXDZBCASYZVIxYg/5Y/50
         rX+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783581546; x=1784186346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+WFNfFbKOHz8rbBtuS6BZdNUXdaQqfa8+sgLreMsrDw=;
        b=qLjFX9MvYriwzQE/+vV6lJDcpdd8XshqKzNyrvHrC692UsIjJ7T3907J3jso8kU+u1
         jOJSf3k7Od/PEXKN0Sa8yOuwQu7N1NOSfk3U7BmCZyx+nereYf6jnS5lWauZAtXuhePm
         d7TtHD1ui2G5Uxh/aUuT40cSsfJiRs1FYA/5bqBa/kz5Vy/sUPrl9VWJiaT7KVrAYecO
         GHWFxoIxXVYTw1I5q31cnGisg7myLnDA7fszAyTbDQCZ2GY3effsQxu6yo9S5sZOlGcV
         gC4oEAwlDEmKwovC29aGjfRlphqrPrBjpr7Rpq0GQlpno+3mg11tEEiv0fIRmd+J9uyz
         SlPA==
X-Forwarded-Encrypted: i=1; AHgh+RoYMS9Pu/rzsiSqHL6jo7UaHwtXhY14Bj5sVcv04nrxgPV3y6++4/lf/mz5YHCgeLql8hTIX+NSfdw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxwhCk8ERrmgNAyvPS4ouzuCVaFBzrCroVoSAA0EB89gt18PYFh
	davXpbGW514Y9NtwTdJIcCrZllKhcvwYhy/pXyypFtPbhcnlVst9sjsY
X-Gm-Gg: AfdE7ckYMqaUMiXjRBxmns2G/95dTX+vMeOLKPu/vSOoD7By0/Fmug5ZdGhbhMGtDwa
	9htym91zPxCT/x1YlOPxn8OynsWGgaodrCpd3QfnEpYH6M6LEuTWDqnxlJeBSxce+iLj5Lar4++
	E6nvXoqVLNfJKIyoRE7cUdb5pilXCnoWsFRMyZyfr+E8TR1Na9LxML6usVqYqu//jvyhUgcmQS7
	p4QTYfDQYr+CrK/Fb76oqr7JvjVLnLMN1EJS0a6qGNX7/VXFWSl4/+vusU/pCqQAndgBSRplAH6
	6LL9nReQX2cHgu+PRQDZt/NTkJ2sesXqvuRoNkJXlXsNQ1AGiwyMbPVWknFfAndJIwK3Aqkc0YA
	dGECbQd3FjsyS9ZfmpDyRQxWVbYbTSW08PQ3/w12GmX3s8U3aueL2jRfS7R7KfWgIjas0Av66Tv
	6mHf41rdmxKX1DdXNkojRD3Ij4Ug2UAvA8ry8CVBA90Std2uEEi5D9lS0U9/UGPJXJAR/GmFh7C
	HJXsP7kyQs5xbTe6hiFW4AkhkJ5JmIhLNE69No+SZ4vXQ==
X-Received: by 2002:a17:90b:2f88:b0:36a:c4b:76cf with SMTP id 98e67ed59e1d1-38941acc562mr6603494a91.23.1783581546240;
        Thu, 09 Jul 2026 00:19:06 -0700 (PDT)
Received: from jm-Lunar-Lake-Client-Platform.. (2001-b400-e11d-51b8-fc5d-5f39-cd11-ce64.emome-ip6.hinet.net. [2001:b400:e11d:51b8:fc5d:5f39:cd11:ce64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a5506b48bsm697456a91.1.2026.07.09.00.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 00:19:05 -0700 (PDT)
From: Jian-Ming Liao <tim678910@gmail.com>
X-Google-Original-From: Jian-Ming Liao <Jm_Liao@asmedia.com.tw>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	adrian.hunter@intel.com,
	jarkko.nikula@linux.intel.com,
	linux-i3c@lists.infradead.org,
	Jm_Liao@asmedia.com.tw,
	Chloe_Chen@asmedia.com.tw,
	Yd_Tseng@asmedia.com.tw,
	Patrick_Yen@asmedia.com.tw
Subject: [PATCH 1/3] i3c: mipi-i3c-hci: Enable IBI threshold interrupt by default in PIO mode
Date: Thu,  9 Jul 2026 15:17:42 +0800
Message-ID: <20260709071744.333403-2-Jm_Liao@asmedia.com.tw>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260709071744.333403-1-Jm_Liao@asmedia.com.tw>
References: <20260709071744.333403-1-Jm_Liao@asmedia.com.tw>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_001907_156271_3B3A40A9 
X-CRM114-Status: UNSURE (   9.87  )
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

Enable the IBI threshold interrupt (STAT_IBI_STATUS_THLD) by default
during PIO initialization. This ensures that Hot-Join requests and
early IBIs from devices that have not yet formally requested routing
are properly captured, improving system responsiveness and stability.

Co-developed-by: Patrick Yen <Patrick_Yen@asmedia.com.tw>
Signed-off-by: Patrick Yen <Patrick_Yen@asmedia.com.tw>
Signed-off-by: Jian-Ming Liao <Jm_Liao@asmedia.com.tw>
---
 drivers/i3c/master/mipi-i3c-hci/pio.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/pio.c b/drivers/i3c/master/mipi-i3c-hci/pio.c
index ff2657ee220b..7870b2c7888f 100644
--- a/drivers/i3c/master/mipi-i3c-hci/pio.c
+++ b/drivers/i3c/master/mipi-i3c-hci/pio.c
@@ -185,8 +185,13 @@ static void __hci_pio_init(struct i3c_hci *hci, u32 *size_val_ptr)
 	pio_reg_write(INTR_SIGNAL_ENABLE, 0x0);
 	pio_reg_write(INTR_STATUS_ENABLE, 0xffffffff);
 
-	/* Always accept error interrupts (will be activated on first xfer) */
-	pio->enabled_irqs = STAT_ALL_ERRORS;
+	/*
+	 * Always accept error interrupts (will be activated on first xfer).
+	 * Also enable IBI threshold interrupt by default to catch Hot-Join
+	 * requests and IBIs from devices that haven't formally requested
+	 * IBI routing yet.
+	 */
+	pio->enabled_irqs = STAT_ALL_ERRORS | STAT_IBI_STATUS_THLD;
 }
 
 static void hci_pio_suspend(struct i3c_hci *hci)
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
