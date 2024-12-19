Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3CCEE77184
	for <linux-i3c@archiver.kernel.org>; Thu, 19 Dec 2024 22:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=H0SBSamJQPrK1PfMbL33TMyiRjLrVLWfoZolsUrQNMM=; b=aLZVPScG6RcdLg
	BwOgwPCwJTerd9b7sFJ/Wh9GN9IfYCqQSTXn+iJSAT3nM4E74G3uwJ8bPGlToUUzrBNXHTov7gLLl
	6/gNBq2pEUa8GAtDpl8/1M7jZGDmntRkL36qTosVnhEcKbG1fzvknq0utHpUUzsGDZJ8HfvZLqnBg
	+2lM2S+OWQp7Ms/eqqRERrzfOx8nuqBdsFFcQa5dOjXfiXDwSNJStw7zsknDe4IbCVph2qQk4bkqC
	N1xWsK+MRf2Bd0NR5Tu3mxvRw12fpBOgRBx6B1qkT+B+XGZvOYl3x/vdZMJDz3WqjKknnHk/eE8pa
	WAM2p53hJXccacm6ifbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOOch-00000003Del-2Plt;
	Thu, 19 Dec 2024 22:03:59 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOOcd-00000003De8-10fS
	for linux-i3c@lists.infradead.org;
	Thu, 19 Dec 2024 22:03:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=uGlTtA8dfC0JBT
	3H+WliQ5pXLzrJZXTAJT9PHkh9Nqk=; b=WVbnNipwPfikfuDVlTNUUNpzkhhDK8
	PWIwVm5z3Irso3gkLN6fobFbuI8lqyCRcK0EzwNa4VA/DykrrYIaDVP7h9nTJbMk
	ZMnLjye/1RIkXnCv5mkip2hWlPGMbgGIEm+hPBzEpkxtF2d7YM9Di6qEqslBPelU
	p0WGy57TnOCK9TxkxRxldBS5Aj6ip4HjsqdbILV+seBc3Vmn6UvtCUuyzM6AUasG
	hiNrefy3hOJVljbqUUFFsRAi/9kCXpo8cUytoyfC6C5aWnsTJ/nK+ZnBt+Uhe9kr
	hI/1rzoNR97aRr9wOZ4B5Ioq90reFCB7G5jt1oXdB4iJz7WSat0ojfkQ==
Received: (qmail 817637 invoked from network); 19 Dec 2024 23:03:48 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Dec 2024 23:03:48 +0100
X-UD-Smtp-Session: l3s3148p1@oRNktKYpUOYujnsY
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH] i3c: fix kdoc parameter description for module_i3c_i2c_driver()
Date: Thu, 19 Dec 2024 23:03:37 +0100
Message-Id: <20241219220338.10315-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_140356_951329_391CB71A 
X-CRM114-Status: UNSURE (   8.87  )
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

A typo mentioned I3C when it should have been I2C.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 include/linux/i3c/device.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/i3c/device.h b/include/linux/i3c/device.h
index 0a8a44ac2f02..b674f64d0822 100644
--- a/include/linux/i3c/device.h
+++ b/include/linux/i3c/device.h
@@ -283,7 +283,7 @@ static inline void i3c_i2c_driver_unregister(struct i3c_driver *i3cdrv,
  * module_i3c_i2c_driver() - Register a module providing an I3C and an I2C
  *			     driver
  * @__i3cdrv: the I3C driver to register
- * @__i2cdrv: the I3C driver to register
+ * @__i2cdrv: the I2C driver to register
  *
  * Provide generic init/exit functions that simply register/unregister an I3C
  * and an I2C driver.
-- 
2.39.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
