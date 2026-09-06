Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C43ACC79F9E
	for <linux-i3c@archiver.kernel.org>; Sun,  6 Sep 2026 20:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=CcUqoWUPtxiu1N3ycjR5zhqEmutH6ra5KtDNRqy0KzQ=; b=JEMO6FSuO70DtPtZdPKRRS9hJo
	pack1IC0w9AMvyOi3/tFmz2epjqrxonRHUm2+klif66XY2aslZY4he0Xz3RQeTUxH1QXsOPNXg1KG
	NqiKnis89EFwJBnAcnZbM5bJkbI7W6dy/RrsdC6aXFR7tTsWX6BFQFhbqhgDE2Wp/SfVm9406LsSh
	+/YY5Z/xuRK8uE35D3Kd+Eq/ZlgNrc6IhbMAIZ7vCfmYGy66h97HWvlbdgWc1yJjE+4eAsrlS0Q9w
	maSeTQ0ytKyXoh6ubqjqZuUW2S/XXO5H4X9dK9f51TAXcabb3YaNQRDADH+2NehGuMlsJEQvDZytF
	OWEZFPKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3JUK-00000005YNw-1nN3;
	Sun, 06 Sep 2026 20:29:16 +0000
Received: from mail-pg1-x546.google.com ([2607:f8b0:4864:20::546])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3JUI-00000005YMT-0MMK
	for linux-i3c@lists.infradead.org;
	Sun, 06 Sep 2026 20:29:15 +0000
Received: by mail-pg1-x546.google.com with SMTP id 41be03b00d2f7-c85798977dcso4300601a12.0
        for <linux-i3c@lists.infradead.org>; Sun, 06 Sep 2026 13:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788726552; x=1789331352; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7prt9MlqcUNMzUdkt0ytNZsIrDLRTQGTGe/hvHFR8Fs=;
        b=FE2eCruJJnkgQFdyRY0eS55JxqWfMxYZzfKhu8/XeurqH7ZCLnQDWZ/x8HnuLAgLda
         nXvzxTd89bx3dfbASkjWPX+U440yAs3+sdyeAb8TxEqKL4d00hxyrgf2OrBN05clJglp
         1M5QHQOmZEkSJOHW0XRwUzZTkQq1NpDHYdbeAAkoieSJnRBLbscaNLwJWX4OMaG2v50w
         umWgl9nHQYsTvLCv0jUcu6gHdM2y6Mc1T4r0Q4PGueXn0HrB/qZfNLmHpQq9lrzHYPpO
         LEMhMnHpRiHwRSWABggxpWvzjjGsHhftbLP0Mxj8+4NGJbO/pwV9g61P8rVR/DC2z+8E
         P1EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788726552; x=1789331352;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7prt9MlqcUNMzUdkt0ytNZsIrDLRTQGTGe/hvHFR8Fs=;
        b=qz5SBw35XLUhYSs/+Xfyyq2zHLPu2PZcBqMBw97byQoIu1AHUYkX5HluSsXKVDxyR2
         ePc4lVpiOok1BlvGMnA5RSFnk7SpyUr+dKEfrt7NQRaUzhJBpCGopgWS9rP/+eeWrxVt
         rk0q04S7WVr51cB/fVT/BsbcXcAcSv187+Wdzu7mUGia/ISHbPvdGAHn1CBm1K5cG3en
         kqP/LvtZwD5EVryOJ9MQ++EkFzcmU8A0TwPcgt2NluBiSiIJQIlmibocN+1KQUxM2WFE
         cgb3lnB2+GCRWcRCyT28SzIihFL7gLYG+yAWYnjktT3PmRJ8X5tRGtDuRRpeoI4ZarR6
         H6Jw==
X-Gm-Message-State: AFuF++l3UwVzNxkmmK2StSAFjqXXekxtry4qf86240dKY/AgLvcCb799
	oIjo3DBeIGCLR1pbWbywWyAvR2fm00Qvy/G073sY9tVwQSoII23ysIwtYfDRrWtUImnv5HXu/Ei
	+A3IxOUKA2RwCRa6L1Y+i8RGb7CkQ8MzCs8/eoL8RTlMzmUB4CatHRJIwezYq+qZsc1H4kvWAZY
	7/22gBRku/JuoGyMpBPLB1VrMz7eWM9oEEyDXU4ErREKrUpI9AXr3nTRBpJeRLOuEswdzG4chlI
	NhYtA==
X-Received: from dynm18.prod.google.com ([2002:a05:7300:2a92:b0:336:3540:43fb])
 (user=samagazaryan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:6e04:b0:3c6:61b9:917c with SMTP id adf61e73a8af0-3da39cfee0dmr30467270637.11.1788726551480;
 Sun, 06 Sep 2026 13:29:11 -0700 (PDT)
Date: Sun,  6 Sep 2026 20:27:46 +0000
In-Reply-To: <20260906202747.4041389-1-samagazaryan@google.com>
Mime-Version: 1.0
References: <20260906202747.4041389-1-samagazaryan@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260906202747.4041389-3-samagazaryan@google.com>
Subject: [PATCH v4 2/3] i3c: master: add i3c_for_each_dev helper
From: Sam Agazaryan <samagazaryan@google.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Vitor Soares <vitor.soares@toradex.com>, 
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>, linux-kernel@vger.kernel.org, 
	Sam Agazaryan <samagazaryan@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_132914_231374_1E4C57DA 
X-CRM114-Status: UNSURE (   9.36  )
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

From: Vitor Soares <vitor.soares@toradex.com>

Introduce i3c_for_each_dev(), an i3c device iterator for use by i3cdev.

Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
Signed-off-by: Sam Agazaryan <samagazaryan@google.com>
---
 drivers/i3c/internals.h |  2 ++
 drivers/i3c/master.c    | 12 ++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
index cbc00c862104..3c53a5108b81 100644
--- a/drivers/i3c/internals.h
+++ b/drivers/i3c/internals.h
@@ -79,4 +79,6 @@ static inline struct i3c_master_controller *i3c_bus_to_i3c_master(struct i3c_bus
 	return container_of(i3cbus, struct i3c_master_controller, bus);
 }
 
+int i3c_for_each_dev(void *data, int (*fn)(struct device *, void *));
+
 #endif /* I3C_INTERNAL_H */
diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index e8a9f8c3041e..dd5071ca9195 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -4011,6 +4011,18 @@ void i3c_dev_free_ibi_locked(struct i3c_dev_desc *dev)
 }
 EXPORT_SYMBOL_GPL(i3c_dev_free_ibi_locked);
 
+int i3c_for_each_dev(void *data, int (*fn)(struct device *, void *))
+{
+	int res;
+
+	mutex_lock(&i3c_core_lock);
+	res = bus_for_each_dev(&i3c_bus_type, NULL, data, fn);
+	mutex_unlock(&i3c_core_lock);
+
+	return res;
+}
+EXPORT_SYMBOL_GPL(i3c_for_each_dev);
+
 static int __init i3c_init(void)
 {
 	int res;
-- 
2.55.0.979.g7e5102b832-goog


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
