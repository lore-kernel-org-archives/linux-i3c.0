Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B60C2C5CFC1
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Aug 2026 08:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TKnBXRn1hZRHrb5EYVghA0NKp/95nYXv57QX291b+9A=; b=V7JUzJMpmexSr5
	00vFIfxRm26eoeTTNu+fxMJah9YA4xVDA1p87kV8qiOCBXhpQhSML/gE7plXjuKIFvrBueI5h1ONi
	wDPP4RcKSRm5sMIMH7x2JnqICjpDysN1NkIrrLcJ72g9FaFjbBJykHY27gVVwKdGLu/Wicym3g0PJ
	1QIbO/uyQFheDJ89tvk6lm8gARvo7MgQOhOUCJylvs30WCjaNDFPW+O/DZ6Eit9sv940EZ6l3PWz9
	nlYRZiDIFo+/g9PmUIvR1MgWf19WnU1AoqyYMQKwLFzyVYU3s9UQVc68k58eCerGJTf0qx2cTi7Nb
	U8hn+ldk3nnfITNTiWsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvsgi-00000005gom-1Zdf;
	Mon, 17 Aug 2026 08:27:20 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvsgf-00000005go1-46eG
	for linux-i3c@lists.infradead.org;
	Mon, 17 Aug 2026 08:27:19 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-38deea72eebso3054510a91.1
        for <linux-i3c@lists.infradead.org>; Mon, 17 Aug 2026 01:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786955237; x=1787560037; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HmHlZM07AF+DQ9COm6JvGuOoEBLfUqS6LiHo8d5ADR0=;
        b=DUYLu4uI0V501vUg8spZL+ptJd8tNRoxyldHP87cKot6sOAZGSkMMi3h6jEmtRE8qT
         j02ptADdKEhOadVVdunYvteiIMRV5BLGBKC0L6W6tVcCzveMyD/DFYIkY59f1Z+nazM6
         tc2KAgMWXuw1pD58129LrRs/lFM0aEXwJ2FDaSI+R25PGUkQmzvX46EvCXJsyzq8hCJP
         ybqgkZj0sOV+b6TajzfPiYZsZxy5/NcLLF4FyR5vqCSmv/5oOsT17J5evAxmkeTauP3W
         f/C84aVhSY9dENAn4+dr8byvH1oI1ieRPkS0Ghbkly/cAIU4ytesyxgFDLVfe5QaqhXc
         H8Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786955237; x=1787560037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HmHlZM07AF+DQ9COm6JvGuOoEBLfUqS6LiHo8d5ADR0=;
        b=Y/DpI+D132qAi451H/wLUa7O0+CrFT4W95Oj8XjIuhJhqQ1A6yQzNVTlnZUOF+n3pO
         Zh82idrDscoFXBTUJRei9O329rjqecT4ZVXJn50aehgV+yBTAAH3FetG/a5u+9+JrUtw
         JIV9Puv8zG24dKR4i3uVRB4ZAv3MNHmtTzXDMVHRnWqfQA12mFpYTIYe+SQs5mUjXGni
         gxzJUCtP7QOdJlyMwvgA5wDD09f617yiw0cATm5ujTPY2jdP9fX3tXLucZoCUY/8hpgd
         HlXD4wSVGTbJkqjb5BJmjs7LauAaKQfhTKlZsWnwr142HSM4WgY+vgOdrFFAFJSqjBgZ
         yblg==
X-Forwarded-Encrypted: i=1; AHgh+RpoX+gNpZjbnHYGGbv+jsngVpR5Ix5B/dHPFRMS2qqlU/Wgg1iIfx3h52cB2+099qjr5wmOmM4tUhs=@lists.infradead.org
X-Gm-Message-State: AOJu0YzhN4BeV1717QPkTq+Og7//hGcu+B7DZD6iZoxdv1qxB1T+IKxP
	YgzBpRcI9yE2lGIYxyA+XpD9RdPeEWyIgInY0FjouKeGB2HipnCxnE8G
X-Gm-Gg: AR+sD10Im3k8EGRetiv/mdOWUcy6fL9LqPm1VkvYAYrtyIAaK0ocIVX/tHbOkleydos
	vmXTsoay0vf0xAwybcZYUVcP+XkuZGVwWXcACEhqLmm9YNqionJ9gID8ew/8KnZQOImPwYJpW7T
	2pOtRS/3bqijwN5oyX/8t1ga3cZnwAm5W2FGZqWP5GosuoLWG8yqYf+2scl8wVWPjmwB6CAR1mq
	0w8zSWfgAI1Faz2UPU6rwBOt/nRNnisfhQXR5rhE9UPLYZ+Q0EzltYoTC6IbBY/WTPrm0PqhTbi
	J/plyeAHcZ8g3wL2PraPS6HFvxjgHB4bUCcSzCLf2sGLo9Rizd1yS1j4V1RS+vDOXCBv9FjcAsy
	QbThcSzs5ACnmVR/GHkLXTKw8xEU52UFJVjGRO4gi0KcPQqEq/HewtjgKVhx6Go+acI+YJFMArh
	05l6nG6iIhxJE2vQre093NYOCahEdAjowwaeeG/UW53VltUIWLfktJf4oBXRTLPRARFDaOt5+ph
	E3ZtZkG9B3RBBTWq7VwHYRoqu+dP2hh7XEVlmzOMPlNJxdjVRU2heC1ytEbVHcFha7cUKHwPuCl
	PbAul7bJFAsaFXnZMg==
X-Received: by 2002:a17:90b:2587:b0:38e:9045:bac0 with SMTP id 98e67ed59e1d1-3933b741419mr24211777a91.5.1786955236870;
        Mon, 17 Aug 2026 01:27:16 -0700 (PDT)
Received: from jm-Lunar-Lake-Client-Platform.. (2001-b400-e15c-4d9e-e270-183b-5fe6-6f07.emome-ip6.hinet.net. [2001:b400:e15c:4d9e:e270:183b:5fe6:6f07])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3954d2b8080sm1393379a91.4.2026.08.17.01.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 01:27:16 -0700 (PDT)
From: Jian-Ming Liao <tim678910@gmail.com>
X-Google-Original-From: Jian-Ming Liao <Jm_Liao@asmedia.com.tw>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	adrian.hunter@intel.com,
	jarkko.nikula@linux.intel.com,
	boris.brezillon@collabora.com,
	linux-i3c@lists.infradead.org,
	Jm_Liao@asmedia.com.tw,
	Patrick_Yen@asmedia.com.tw,
	Chloe_Chen@asmedia.com.tw,
	Yd_Tseng@asmedia.com.tw
Subject: [PATCH v3 1/3] i3c: mipi-i3c-hci: Fix missing STAT_IBI_STATUS_THLD in PIO mode
Date: Mon, 17 Aug 2026 16:26:45 +0800
Message-ID: <20260817082647.612471-2-Jm_Liao@asmedia.com.tw>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817082647.612471-1-Jm_Liao@asmedia.com.tw>
References: <20260817082647.612471-1-Jm_Liao@asmedia.com.tw>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_012718_021541_8C788EF7 
X-CRM114-Status: GOOD (  10.75  )
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

In PIO mode initialization, STAT_IBI_STATUS_THLD was missing from
pio->enabled_irqs. As a result, the host controller interrupt signal for
IBI threshold was never enabled when transfer starts, preventing IBI
status descriptors from being properly processed in PIO mode.

Include STAT_IBI_STATUS_THLD in pio->enabled_irqs so that the IBI
threshold interrupt is activated alongside error interrupts upon the first
transfer.

Fixes: 9ad9a52cce28 ("i3c/master: introduce the mipi-i3c-hci driver")
Co-developed-by: Patrick Yen <Patrick_Yen@asmedia.com.tw>
Signed-off-by: Patrick Yen <Patrick_Yen@asmedia.com.tw>
Signed-off-by: Jian-Ming Liao <Jm_Liao@asmedia.com.tw>
---
v3:
 - Added Fixes tag (Adrian).
 - Updated commit message and code comment to accurately reflect that
   STAT_IBI_STATUS_THLD is activated on the first transfer (Adrian).
 - Aligned From: and Signed-off-by: email addresses (Adrian).
v2:
 - Removed "Hot-Join" references from the commit message and comments,
   as the change focuses strictly on enabling STAT_IBI_STATUS_THLD
   for general IBI reception per HCI spec.
   
 drivers/i3c/master/mipi-i3c-hci/pio.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/pio.c b/drivers/i3c/master/mipi-i3c-hci/pio.c
index ff2657ee220b..a1341d66bc65 100644
--- a/drivers/i3c/master/mipi-i3c-hci/pio.c
+++ b/drivers/i3c/master/mipi-i3c-hci/pio.c
@@ -185,8 +185,11 @@ static void __hci_pio_init(struct i3c_hci *hci, u32 *size_val_ptr)
 	pio_reg_write(INTR_SIGNAL_ENABLE, 0x0);
 	pio_reg_write(INTR_STATUS_ENABLE, 0xffffffff);
 
-	/* Always accept error interrupts (will be activated on first xfer) */
-	pio->enabled_irqs = STAT_ALL_ERRORS;
+	/*
+	 * Always accept error interrupts and IBI threshold interrupt
+	 * (will be activated on first xfer).
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
