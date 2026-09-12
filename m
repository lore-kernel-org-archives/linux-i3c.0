Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA8CC79FB6
	for <linux-i3c@archiver.kernel.org>; Sat, 12 Sep 2026 10:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MZGUVyoSuFXi2t/UoGyJqYzOCc9ia7GgUMtEMqGaVyk=; b=gd1nMo12MVOb1v
	7UwFObnNg/NmKEXNuWXWD3xqz8QQ0iO7S8jU26glyE0BszikynDyPD/RVaaD/ZlTpMwXssW3HNaFt
	0k7dEYBvH6qk22e+gznxNVFAJb7TuSqLTJ0bSx0rBrDNqDvUmwF6UBFvjYglGoo+NcHB8c84cvJlf
	g+87MvbMx942E3E5AIKCwB73ef+BXbtQPBXGsuJrClJa8AqYo+j+ul0IjTk4GSlwhfiStKPpINsWr
	F25HpdPCAmNaHYotiYoCWf29+NNDMJdeTFRgUTaJG36M7K/L4ua6SZ8QLkQt4J1IGtqthe0NXSDw6
	Hk0iSPjW5Lne49mTc8BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Kl6-00000000ldr-3CTI;
	Sat, 12 Sep 2026 10:14:56 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Kl3-00000000ldJ-2oK9
	for linux-i3c@lists.infradead.org;
	Sat, 12 Sep 2026 10:14:54 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-485933b2522so501335f8f.0
        for <linux-i3c@lists.infradead.org>; Sat, 12 Sep 2026 03:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789208092; x=1789812892; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H5x40OxYDvxFMzPZcVcWtoNFOUFKVGLR5yHPdEAqjHg=;
        b=WfW0HdtdX21GNUmCZBkAZFww7AfRoMe98hOpAKKCW7+A3MYIlwyjMWn9XF+ZLv4XMi
         reYCdBHKbrk3W8WRZvm+66PVruxCn9xEYtKgbS2RQzo8h9UicZ5xrRPu4FMwEnBU9Ldh
         iL3GxF2q4y9XD8v5ty2QIsGtFTZ5reFyPz8FETnAj/0EDACE49FT7ltIyl3NjyG04/Mv
         7KEwg01jc6q9e9+tx7dQoJy+gf7XxHViFadyUd7q+XYkz+5DFwa9Jb88xUxjmHFbzNC5
         dUAry7Rw0SZTnIzfGVnJKqQ8FW3OFGKDpDw+wTNZEDI0NgTJrfDvrMWPFYWcHbBBwJkm
         J/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789208092; x=1789812892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H5x40OxYDvxFMzPZcVcWtoNFOUFKVGLR5yHPdEAqjHg=;
        b=D1lSZD1fes5O50AK/yIcsXtzAuKEyF8L3gxyZwmyLYibi9Uy6IBsmE/1eh3H98aBYU
         wJrSVkIP2e/XaVZhuR95WdSXBGvThqMb6WI/qRgC71wIPsPzfrD3/4GYX0iNjcfT04di
         3APFFto5Ww4Cai/PfpqetEbnHTi8VZrkSUKkqd3j7k/otduo53YPHauJpqgRSA21B6rX
         NvqjCENq0BbKD4GogrlRL5fi8pZEbs/GqetmsHfgxPW1zPylg+HIL/s9igxqiNrHmGjE
         Mko1SD40oDbt8NbFHoJ9tRF0jGLZqYF9TDMRbiBhy30i2O/huryF6XTgIZ8CBaUFvkx7
         NOnw==
X-Forwarded-Encrypted: i=1; AKwUvBxqmS5jBZHgSc4m6XWBm6NCoa9JXWvZnLXpT9MAiTpxuU3dEPjaoZ3oGfrYf+gsRZCcgT27Caxwrp8=@lists.infradead.org
X-Gm-Message-State: AFuF++m/8ucRucl6FLmbXhASrRwXOncjHNL88njCB1rKrLp/vHTR4+hZ
	qgr5VFC2frgEIVe9PjcwHQsXOWFinjIjoApqEbizJ7OCkUIUJBOEXA2s
X-Gm-Gg: AYBFou1oG9KRUC+6Y+jn7PgbJuBjudM0CWiiloHxp4l5qPcvZ7/zZ4PkQNMaEgtLMdb
	w02ntODeYA5cjqPks0YP9r9OEoU/GVfN9d1AS5hs/fTvIEANulZTSj1Yzb7Zs6bXS8fs+33z4wi
	CWWNcWBay+KH4eU1a5PDwvr2sNtsotRuXU4ENB5FR+4OfZrfwU19Aeo2x98DeF+r599oxjv/Shy
	HRjK1TjezKOggH5UISE5+GI8Ca888K/nq+375fsA3R9mhNFCqZkb1h/TlzvcbqFYfWrJOSK+9ci
	TQ3epRBcL/V59UPcx2tBNrr+hyc1hSPL2iH1BXgFTbMjwT8tcC9/vnp5YVw8ArGXvqLkLwuPvXp
	oAB88ZNM52ncWbdoKe9ALQ1zS4TyK1iwPqRIy1okqmEU6Qq17R44aocrFjohZwuWLQIjkTQgnjD
	EMXerMApf/rgrW3QGxeGat4c0Hq4ZOGQDZIpfQ92elWNYBiSiG5wjEjuXDbf6gol3edbACvak11
	+QAP55XL+xBwxRhqZGhzjssn+84M+9HuiT7KgT24zKU62ixmUCXteu3UewzQXrT/3u6AmoqQ2Sz
	O/UUTE7Zha6+bLL9WZznZQBMheBiTH3H7Hfa8UnBKUp8JezxG8sh9wbmWzIhdxX4nbgSGItZ0AR
	uKA==
X-Received: by 2002:adf:e310:0:b0:484:3310:c4fe with SMTP id ffacd0b85a97d-486eb3522afmr14079509f8f.25.1789208091656;
        Sat, 12 Sep 2026 03:14:51 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b260-f201-9983-e8c4-aff5-7a36.310.pool.telefonica.de. [2a02:3100:b260:f201:9983:e8c4:aff5:7a36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ee5csm12085997f8f.20.2026.09.12.03.14.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 12 Sep 2026 03:14:50 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i3c: master: Fix i2c_dev_get_master_data() reference in kernel-doc
Date: Sat, 12 Sep 2026 12:14:46 +0200
Message-Id: <20260912101446.86506-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_031453_717867_B74506BB 
X-CRM114-Status: GOOD (  10.08  )
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

The i2c_dev_set_master_data() comment names the corresponding getter as
i2c_device_get_master_data(). The getter is i2c_dev_get_master_data().
Correct the reference.

Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 include/linux/i3c/master.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index f7ceec2b447738a6612b974de1696d45b261d1ad..b8222bddd46e36cb23787685a3eaa9832d00645a 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -709,7 +709,7 @@ static inline void *i2c_dev_get_master_data(const struct i2c_dev_desc *dev)
  * @data: private data
  *
  * This functions allows a master controller to attach per-device private data
- * which can then be retrieved with i2c_device_get_master_data().
+ * which can then be retrieved with i2c_dev_get_master_data().
  */
 static inline void i2c_dev_set_master_data(struct i2c_dev_desc *dev,
 					   void *data)
-- 
2.39.5 (Apple Git-154)


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
