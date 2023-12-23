Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB6A2C46CD3
	for <linux-i3c@archiver.kernel.org>; Sun, 24 Dec 2023 21:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZoE/s+ZvNpYKIJOuweJcZSoE/q9fxsc86ZdR7WP417A=; b=Jzkuh3E4K2E1w7
	8YJ6YJCiqOlzgIr/ZH0CRE8tQtuvwIwiCMzIBm1N3qsiR5Qw0tgN2S04b8rAnYKtTU/Gl1f1ISpgO
	pOE1guNS1ZJE7PEnjtpAUk7NJoLWXHlK2W0775Bm+4Gnqa2mlNKWeVKh/rCdKXkqZBXArF3wlI6AK
	hSYQKS0AFvjAsrPoOBI50t0Ku9y0vkP6NHuQ8GsKsMS4QclJqH54vZ2rbgqh8w8pEXTXJvfDhKd7N
	gQks4fhMiph4ohMcfQTksNmMpzCx19qWv3FBCEBXM206zGwqnK/PlVJrCoxL8/r74g7AlcKjpPWLc
	PCZSUR4lvNzKvnesbskw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rHVtl-009t5O-33;
	Sun, 24 Dec 2023 21:20:37 +0000
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rGuCl-007Obr-0I;
	Sat, 23 Dec 2023 05:05:43 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH] i3c: master: fix Excess kernel-doc description warning
Date: Fri, 22 Dec 2023 21:05:42 -0800
Message-ID: <20231223050542.13930-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 24 Dec 2023 13:20:36 -0800
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

Remove the @boardinfo: line to prevent the kernel-doc warning:

include/linux/i3c/master.h:98: warning: Excess struct member 'boardinfo' description in 'i2c_dev_desc'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-i3c@lists.infradead.org
---
 include/linux/i3c/master.h |    1 -
 1 file changed, 1 deletion(-)

diff -- a/include/linux/i3c/master.h b/include/linux/i3c/master.h
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -76,7 +76,6 @@ struct i2c_dev_boardinfo {
 /**
  * struct i2c_dev_desc - I2C device descriptor
  * @common: common part of the I2C device descriptor
- * @boardinfo: pointer to the boardinfo attached to this I2C device
  * @dev: I2C device object registered to the I2C framework
  * @addr: I2C device address
  * @lvr: LVR (Legacy Virtual Register) needed by the I3C core to know about

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
