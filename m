Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73CC3C001B1
	for <linux-i3c@archiver.kernel.org>; Thu, 29 Jun 2023 10:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5p5q34O+r8gQKksvHqQH66K1RdJYbTo8+AheZTCue+Q=; b=YmELI7aXUNoK8a
	cXuQZsGKv5QlcyeuAHtX3mG3IacbCRiu51Lg2nNHgpycr7VtvKyzRkAfjkEUCj1l9vrZx66gJZpKv
	7m6VcF4VuCBVsMneA3S29xyjUEcCn1P3x3aDOShgktcEiGe57sVA4QBYqpvV/5g3wVj+bRqJxXxUQ
	0wPZLnZzCCINGmSQ/OdlFjTTZC5gbt19kZ44yL9YkSeqR3h1+OEz7iGWd0NdFf9MJAdW5nuf/jg2O
	OkqtPlFmaywpRHcMvN/bEhCXfJXRAApYtTkJBO/KTPFpdqGsDkyFzbA3n5BwMt0tXUY9xK5aufgrD
	wAed8dKVfRW+pcZccivQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEohr-000fpe-06;
	Thu, 29 Jun 2023 10:16:55 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qC0Z3-00F45x-2i
	for linux-i3c@lists.infradead.org;
	Wed, 21 Jun 2023 16:20:15 +0000
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1qC0Yw-00CSaq-JA; Wed, 21 Jun 2023 17:20:07 +0100
Received: from ben by rainbowdash with local (Exim 4.96)
	(envelope-from <ben@rainbowdash>)
	id 1qC0Yx-001z4c-0U;
	Wed, 21 Jun 2023 17:20:07 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	alexandre.belloni@bootlin.com
Cc: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [RFC 3/5] i3c: show node when printing unsupported 10-bit i2c dev
Date: Wed, 21 Jun 2023 17:20:03 +0100
Message-Id: <20230621162005.473049-4-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230621162005.473049-1-ben.dooks@codethink.co.uk>
References: <20230621162005.473049-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_092013_875785_91D2A296 
X-CRM114-Status: GOOD (  10.30  )
X-Mailman-Approved-At: Thu, 29 Jun 2023 03:16:50 -0700
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

When an i2c device is errored due to not being supported, the OF node
is not show (unlike errors from of_i2c_get_board_info). Make the failed
node explict in the of_i3c_master_add_i2c_boardinfo() to aid in tracking
down incorrect entries in the device tree.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 drivers/i3c/master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 6316f3fc914a..bc42669f5c6d 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2023,7 +2023,7 @@ of_i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
 	 * DEFSLVS command.
 	 */
 	if (boardinfo->base.flags & I2C_CLIENT_TEN) {
-		dev_err(dev, "I2C device with 10 bit address not supported.");
+		dev_err(dev, "%pOF: I2C device with 10 bit address not supported.", node);
 		return -ENOTSUPP;
 	}
 
-- 
2.40.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
