Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D49C54EFC
	for <linux-i3c@archiver.kernel.org>; Tue, 28 Jul 2026 09:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D08TKU0mG9KNME+awfMTZfvdaqu9TcPzdC6o8i/V/Hs=; b=SrzJLIIo0TGpn0
	FEGdIzFFZSui+axicUyOEw0eY6ak5NpBuTqoGLpgmaVgYEilEJwvByZfD6b4a9ax5O8HQTkHepx2e
	Vz65Zo08TUXvbsfKrsQkjzB9cWmqEQmr4r/O45/1gqdGfDG3jL/sNpHx1nXyfFdxP7Q9+S+MxLMal
	WH2oARs9a93I2nGQ+Xw8O66MGQ4RMUamA3Ft9KiZ1qyGdl0Kfas1a72rb3EvrR1mi3hdwc9Vf9kjj
	/XUHgVfbJ/uAo4NEjwqc4r+/VZwwBvCZHw3ugRRDQJX/x3VubeEAuALDGmXLTKi5KOM7SvtEXQw1a
	lpuzA02lkddlFoJ6u46w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woeBS-00000004q1M-2WWm;
	Tue, 28 Jul 2026 09:33:10 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woeBQ-00000004q0L-0WS5
	for linux-i3c@lists.infradead.org;
	Tue, 28 Jul 2026 09:33:09 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso3275520a91.3
        for <linux-i3c@lists.infradead.org>; Tue, 28 Jul 2026 02:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785231187; x=1785835987; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e+gf0HxTlfgfVtm1ykTz2CLCI/lbVPJKiUBsHFvmX9I=;
        b=F5FH3yd4OvPW2kKsWvtq0jM+GNnPxWBxfjJPWUVWEpEJsTkf6+rcke8UAXe64ClvIY
         Ce1WEcGbOhDznkBtP9rssp0geN7F1vPmbvEQXVnx3ZHz0qdpyV1gJnn5ZFB/DIfm9inC
         7afN595734I17ljGryEivQVZLiaDk4sxjUZhxTvTpxmMMr7ciaqdKmid8P4exs1DeFGr
         y0eOeSxW8Q/hSiCoSyldtufRP0G7NY2NL49MWXaxR+4MmE8RQXul4Xs0NCKiaHmxg2ey
         GlCvRpZly1WDN1ia7rfOd4G+pZ45hiPffd+TkhhxJYMy6qaNrpqQF9IOvYfa4Y6FwZFd
         WhMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785231187; x=1785835987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e+gf0HxTlfgfVtm1ykTz2CLCI/lbVPJKiUBsHFvmX9I=;
        b=HuMPj/fGDtRSSXlUgh/bQGVRsz1Ug7CZIbX1NLXZgnU+mEO76IxmK0i17Wx8PlFD+Z
         /SRbrrLVyZ1sA89EOXvcd6klgPKl7BFKV8/nLrfwbIAzKEf//hX/iqZoUJ9ENkHFKkH1
         cjMm01YCC0mIu5DAgfs1qJ275GYIV2SZXrkj2WN9a3B+aHNE6HtQBhb2mORzYQe2IaOw
         IdIh5gQmlIi+QwT4t3BK9XcaM/2GuTsx83HLP/C9zanoxXvSDjdFmWddMO5YBC+R1Jwa
         QRLpdic6DNi5/0zMVNJkxBWCz5cErmz7Icq2nhp/T8mIcaQ7spxu00JuhaqgGza1WWGW
         U5OA==
X-Forwarded-Encrypted: i=1; AHgh+RoV++4m9CvbHnA2yjrg/ArZZYjfIlWN1UdQca1FPqrE8AWJHJQXF+3IBV2r5v/ai9wXWFcQXHcUnxM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzB/qONferc232VObU7GvTFYUPSDm7DyrJOHCfBVLKF+Gib4M3s
	7yHeG6fskSSQ3Nl9CogwTf3j8yBpZV/KCLO0RGjT5VDyCfUzr6iMOAxv
X-Gm-Gg: AR+sD13p3Dd0UGtgbsaxTPKtQLmsAhDgsWX+20Ly+FXJazdKB7aU587bkIjit42y1uu
	5rgu+hPQR55fEHfxeRg2ynEG90jVmAOPaUnMWhqS5FLrf9Xp55NpFaWF8WPR9vlCUk7Uel3Mjsi
	PyvUtLgNB8d+jHBV7ZclgeNDdkpZfiNIlXYi0/I0VeJvhqla6kZ/CWa05ZLvAr+kWQvr2l7NMSs
	X6+z75mA7IaowDr3FiAMiIHqjVduu8bVk7DfDaA/5w6laR1V88yTmcCbXn1xhvREstxmfSZ/ATG
	RTWpOTdexHjpIkGTZREv1YyuuhruAOtGxYXRmogsuZb/+Wy6qaij2T+97FFqToLf3Y3b/jlOdl4
	rRuVE5NxRJBYnKKyTHBgjHLMTLp5+zYfg+5/yKKNL/MqGljsM+F0p3CcJ+VGuQs4nV9uD9cR2uQ
	ooffxMFkoK534UgLcaKxIUApdTxoZjPMWuOjEN1VyythgN0Yg3iOjRveuL4Jggd4MSfidb0Jwth
	yhsB2iAeoX2hYf0WQcSCEvat9ZCI5FuHtk=
X-Received: by 2002:a17:90b:2d4f:b0:38e:7f1b:f01 with SMTP id 98e67ed59e1d1-38f6a4c31f7mr1692701a91.36.1785231187051;
        Tue, 28 Jul 2026 02:33:07 -0700 (PDT)
Received: from jm-Lunar-Lake-Client-Platform.. (2001-b400-e14e-87ac-83f9-7a00-1613-f224.emome-ip6.hinet.net. [2001:b400:e14e:87ac:83f9:7a00:1613:f224])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f089e3472sm4592446a91.3.2026.07.28.02.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:33:06 -0700 (PDT)
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
Subject: [PATCH v2 1/3] i3c: mipi-i3c-hci: Enable IBI threshold interrupt by default in PIO mode
Date: Tue, 28 Jul 2026 17:32:36 +0800
Message-ID: <20260728093239.487156-2-Jm_Liao@asmedia.com.tw>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728093239.487156-1-Jm_Liao@asmedia.com.tw>
References: <20260709071744.333403-1-Jm_Liao@asmedia.com.tw>
 <20260728093239.487156-1-Jm_Liao@asmedia.com.tw>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_023308_286768_498383E1 
X-CRM114-Status: GOOD (  10.11  )
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
during PIO initialization. This ensures that early IBIs from devices
that have not yet formally requested IBI routing are properly captured,
improving system responsiveness and stability.

Co-developed-by: Patrick Yen <Patrick_Yen@asmedia.com.tw>
Signed-off-by: Patrick Yen <Patrick_Yen@asmedia.com.tw>
Signed-off-by: Jian-Ming Liao <Jm_Liao@asmedia.com.tw>
---
v2:
  - Removed "Hot-Join" references from the commit message and comments,
    as the change focuses strictly on enabling STAT_IBI_STATUS_THLD 
    for general IBI reception per HCI spec.

 drivers/i3c/master/mipi-i3c-hci/pio.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/pio.c b/drivers/i3c/master/mipi-i3c-hci/pio.c
index ff2657ee220b..9df114ef0278 100644
--- a/drivers/i3c/master/mipi-i3c-hci/pio.c
+++ b/drivers/i3c/master/mipi-i3c-hci/pio.c
@@ -185,8 +185,13 @@ static void __hci_pio_init(struct i3c_hci *hci, u32 *size_val_ptr)
 	pio_reg_write(INTR_SIGNAL_ENABLE, 0x0);
 	pio_reg_write(INTR_STATUS_ENABLE, 0xffffffff);
 
-	/* Always accept error interrupts (will be activated on first xfer) */
-	pio->enabled_irqs = STAT_ALL_ERRORS;
+	/*
+	 * Always accept error interrupts (will be activated on first xfer).
+	 * Also enable IBI threshold interrupt by default to ensure that IBIs
+	 * are captured, even for devices that haven't formally requested
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
