Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABDBFD4A612
	for <linux-i3c@archiver.kernel.org>; Fri, 16 Jan 2026 08:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version
	:Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=l/A8eTDOVqRjSsdvB+/x23LfgdwYFznxjqBDE8DYfJA=; b=d3mz4gODfIroAO
	hNEASzt4H9ycyRENH7YM8G/LlR3gzCxYeIVVdb+mDnrRiHLf8WyS/ERh6zK4+4Ex8u7Pci+jflJpU
	/C/ZIBqqfR2vQVD64bm+Asva1pAbSHQ8krZlqviRzcKUtVpuF/tKgwcCpdiN3yubKRcCSx4LXQ7uK
	V2D4ycgKKoD9vEv23Wv5uPmQq3bwiaCk8QOuFDWPx/F48xwMqMPzi2FIvurIlQ3aZ9sK0WQceNCHt
	uQGLsB3M34tuMu6HyOnHhMQ9pURdI8vT+B0GLFL/bKYSyXhZ7bZa4DNuvGQohcxBqicnG1aRvRe/9
	uW5hvoJl0ALmIBF3tPJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgfOt-0000000DmjS-0FNI;
	Fri, 16 Jan 2026 08:41:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgfOs-0000000DmjK-1S7x
	for linux-i3c@lists.infradead.org;
	Fri, 16 Jan 2026 08:41:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C3A06016F;
	Fri, 16 Jan 2026 08:41:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 418CCC116C6;
	Fri, 16 Jan 2026 08:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768552905;
	bh=GjvS5o2gXGq2CcK52YvX/dOHo/NbQtjTWoin+jWQTwM=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=YYz1dQ6g7Lsl6Lo7NlT2Ig5PI2/13l24joJn32XV46KALlUmsNlD9vKJMK3UhQv2Z
	 7a7JZNNCovn3XlaTSYWHjHP+vpkdLvNZbF2yaoJewuixmlhKGvXc3BlrfGxfYhMoS/
	 zyPShvk2bJi/vRNPMmldwQcpYI4lq142fI0XDiYbavmwUQcjU/saZdg+EjDzLOLuS8
	 qKpqf3fnlG1fzJmL1WSQKCqDHzyg3o/rxQ9KbT0IDMQw/Gtc1op9Lieo/tQ0GIt4dI
	 A0m+xsyTkhbhuTw5k4UZ77Juh+l4J3hY8mC0gLv3W6y5UxdC91FoGld40yVNoixeYC
	 MNxo6UtnAJKKA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 305B8D4A612;
	Fri, 16 Jan 2026 08:41:45 +0000 (UTC)
From: Fredrik Markstrom via B4 Relay <devnull+fredrik.markstrom.est.tech@kernel.org>
Date: Fri, 16 Jan 2026 09:41:36 +0100
Subject: [PATCH v2] i3c: dw: Initialize spinlock to avoid upsetting lockdep
MIME-Version: 1.0
Message-Id: <20260116-i3c_dw_initialize_spinlock-v2-1-e56b431fb187@est.tech>
X-B4-Tracking: v=1; b=H4sIAL/5aWkC/43NSw6DIBSF4a2YOy6NULXUUffRGAN4LTc1aIDYh
 2Hvpa6gw+8M/rNBQE8YoC028LhSoNlliEMBxip3R0ZDNohSNCXnNaOT6YdnT44iqYk+2IeF3DS
 bBxvkWQoulKwaDTmweBzptcdvXbalEGf/3r9W/lv/yq6ccaYvptajkhpFdcUQjxGNhS6l9AVZN
 omgwwAAAA==
X-Change-ID: 20260115-i3c_dw_initialize_spinlock-d878212a846b
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, Joel Stanley <joel@jms.id.au>, 
 Jeremy Kerr <jk@codeconstruct.com.au>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jani Nurminen <jani.nurminen@windriver.com>, 
 Fredrik Markstrom <fredrik.markstrom@est.tech>, 
 Ivar Holmqvist <ivar.holmqvist@est.tech>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768552904; l=1325;
 i=fredrik.markstrom@est.tech; s=20260113; h=from:subject:message-id;
 bh=cn3RST4SNo9jSm6US+uLLzCCBGl+hGYy8MD0NCviD5E=;
 b=7n3KMgnjoyny8fHUpEHSdn477HdTh0vUeLPVakWON8Sd4DuiJURHbcLX2a4CO+wz4cPaYnIFR
 ce7LVed8zdPAE3+tBGSOQYK3Ytj0x4n+DILNioIAeyqY1GehSnxY3t6
X-Developer-Key: i=fredrik.markstrom@est.tech; a=ed25519;
 pk=0a8IXHEgAX55JPS8VZfTf1sDp7q/oAOf459tDQd40Eg=
X-Endpoint-Received: by B4 Relay for fredrik.markstrom@est.tech/20260113
 with auth_id=600
X-Original-From: Fredrik Markstrom <fredrik.markstrom@est.tech>
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
Reply-To: fredrik.markstrom@est.tech
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

From: Fredrik Markstrom <fredrik.markstrom@est.tech>

The devs_lock spinlock introduced when adding support for ibi:s was
never initialized.

Fixes: e389b1d72a624 ("i3c: dw: Add support for in-band interrupts")
Suggested-by: Jani Nurminen <jani.nurminen@windriver.com>
Signed-off-by: Fredrik Markstrom <fredrik.markstrom@est.tech>
Reviewed-by: Ivar Holmqvist <ivar.holmqvist@est.tech>
---
Changes in v2:
- Added context in commit message
- Link to v1: https://lore.kernel.org/r/20260115-i3c_dw_initialize_spinlock-v1-1-b9c5bfa8be24@est.tech
---
 drivers/i3c/master/dw-i3c-master.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 889e2ed5bc83..d5b070404056 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1570,6 +1570,8 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 	spin_lock_init(&master->xferqueue.lock);
 	INIT_LIST_HEAD(&master->xferqueue.list);
 
+	spin_lock_init(&master->devs_lock);
+
 	writel(INTR_ALL, master->regs + INTR_STATUS);
 	irq = platform_get_irq(pdev, 0);
 	ret = devm_request_irq(&pdev->dev, irq,

---
base-commit: 0f61b1860cc3f52aef9036d7235ed1f017632193
change-id: 20260115-i3c_dw_initialize_spinlock-d878212a846b

Best regards,
-- 
Fredrik Markstrom <fredrik.markstrom@est.tech>



-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
