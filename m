Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4708EC5B552
	for <linux-i3c@archiver.kernel.org>; Wed,  4 Jun 2025 10:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PaIqfEGZ+8EWhgEncoEBP7eRhxhKxNYG8uxaufsmUQg=; b=PdqV01dzVL5O0R
	11Y6mGw2Ub5evO+wXQiGpsxBMAp0E7SvjUgIMKUCrayWpD5pGUua+JT4C/0r9z7z/yzP+vuqKopXj
	n8t4sQjT6hKTDgSAevKyz0ArNd9K6omCKJKIqqWbq0OIb5aPa2L1wxeyqZEG41ZOTpCpG15Vu4O+O
	9uKvrhVOeE0u2qzQ5XpO1Jx30v6zxm4iALPn8kkG7kVZZ0w1M6ym6BKMiCcyUGJacLR0GQSVWIg7N
	eYcsjcmrxTMMo/nM46sIGH5suQYnEYerHgPKtlGZIFXHdzDUuUihm+mN3ujU7VBe77uoalo4fstMm
	69iqo94Yx7GsKRt4onfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMlCt-0000000D79S-0ANH;
	Wed, 04 Jun 2025 10:18:51 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMlCo-0000000D73Q-3ih0
	for linux-i3c@lists.infradead.org;
	Wed, 04 Jun 2025 10:18:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=dZU30ZKKWv97tAIsfUSqzktZbtND/XNt+zjbwjV2FCQ=; b=QKg+i6
	SY8IEkiIbzZyvDaD8sY5p5STUHjamdyrPWmRtQ0Xtu2rEtMxr6TMwYu2Aa3SW5AF
	HIuFNJcrDAPF2dLv4IibePm0Tv6aM7L8jp60NFnFfbjfNjbRg6wYnot2el5N7aHD
	u/SnlF3x1T+2ORqGRltArrzZhs575cX/XPRRzXWlT4eOpPb1RtPFrngCe50AEJmP
	A12jJ967fV8Go0onJHEeOcG2gUIK19SIrYh6tMM/+MXXaIrN3vqr4BVwKfKTEC2X
	L3FPZHth1iPOSeA4+NiAUi9vsMZzgJpCKTA3SKFcMtZ4SLZdijq9xOAN7TYfyVbK
	V8R6Gv+Axq94kUVQ==
Received: (qmail 629248 invoked from network); 4 Jun 2025 12:18:38 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Jun 2025 12:18:38 +0200
X-UD-Smtp-Session: l3s3148p1@l8MHUrw2mqogAwDPXx36AJSQ3b6GkO36
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i3c@lists.infradead.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 3/4] i3c: mipi-i3c-hci: use adapter timeout value for I2C transfers
Date: Wed,  4 Jun 2025 12:18:29 +0200
Message-ID: <20250604101831.56585-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250604101831.56585-1-wsa+renesas@sang-engineering.com>
References: <20250604101831.56585-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_031847_212191_FC92EC75 
X-CRM114-Status: GOOD (  10.43  )
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

I2C adapters have their own timeout value which can be changed by
userspace if desired. Use it for I2C transfers. The default is 1Hz, so
the default behaviour is unchanged.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i3c/master/mipi-i3c-hci/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index bc4538694540..60f1175f1f37 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -395,7 +395,7 @@ static int i3c_hci_i2c_xfers(struct i2c_dev_desc *dev,
 	ret = hci->io->queue_xfer(hci, xfer, nxfers);
 	if (ret)
 		goto out;
-	if (!wait_for_completion_timeout(&done, HZ) &&
+	if (!wait_for_completion_timeout(&done, m->i2c.timeout) &&
 	    hci->io->dequeue_xfer(hci, xfer, nxfers)) {
 		ret = -ETIME;
 		goto out;
-- 
2.47.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
