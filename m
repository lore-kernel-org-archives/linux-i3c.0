Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD37D44C49
	for <linux-i3c@archiver.kernel.org>; Thu, 15 Jan 2026 13:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version
	:Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MAyux0Am9+It2kq06vcVNS5N13NQ1NKzug0t08QDFwk=; b=krz3mA0bu3g1Fp
	C81UpMi3dZ8XFFRIcb2MNFRjSotQf1lBvp6Kmyd5EzvSMTmPFiZ8dh30P8CWUc1jfdPrPYH3uaQ24
	cNssaZPLhtA/NqfI5iWXOEVELSsdcoTY5XgpVqYgKQbElPN5gupIx6vRWXsNFygIzGmdoosdSJeDY
	4msPvK1dXRacqFo1BLF/d07yKvK0TRKDbXWkS22f5xAO3BcIaiO2DwfJqJ3u1pSmHBMg0bW6bu5P/
	LpdiDq9yqy6K7DHzP9ZH2DEJ2AMVlo7S2ZAnXQMSp+JIXfo3N86tD/MLWfgwYnkr4tNXQuqTXRDx1
	DNle3AEphMG1tYkBvtNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgNM3-0000000CPdl-2f1o;
	Thu, 15 Jan 2026 13:25:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgNM0-0000000CPdP-32Kk
	for linux-i3c@lists.infradead.org;
	Thu, 15 Jan 2026 13:25:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8A61C41A14;
	Thu, 15 Jan 2026 13:25:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 683F6C116D0;
	Thu, 15 Jan 2026 13:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768483535;
	bh=6X3Za76Q65a2Dy5vkbusJpoUiw0ce+uGlJEu4xvS8JY=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=AeVbz3yJWmhwZb4fTJa+rb7FWQGlaswQMmydO6/5gWIkOeIOxcBOYX2Uhx17lw6bJ
	 hPbgcPrf4caOxKxgx5wEVEeBtuCoChLLRdMCXaAazuUAirLhZLKFzHchuBh79BOeDr
	 izVsCi05m6q3dqY0T5HVbxYrjZWiUWwmwGXc9A7nS3AXK/xLipEbCFWsSyNcj7JPiB
	 sNhmjPAm0Yqu2SKaNyEHchk52nhyoC4q5eXrEnWkZSn/M/y8lkXRI3n2I9UF1ybs1x
	 aHOGO+ynCEL2Fr+kIJwPX2PUmBsLaIJgIgi9gEnXTWTDUGsiVRAeDPQcnY748QeqJt
	 rQJBQEr+2Fi9g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56C17D44C49;
	Thu, 15 Jan 2026 13:25:35 +0000 (UTC)
From: Fredrik Markstrom via B4 Relay <devnull+fredrik.markstrom.est.tech@kernel.org>
Date: Thu, 15 Jan 2026 14:25:29 +0100
Subject: [PATCH] i3c: dw: Initialize spinlock to avoid upsetting lockdep
MIME-Version: 1.0
Message-Id: <20260115-i3c_dw_initialize_spinlock-v1-1-b9c5bfa8be24@est.tech>
X-B4-Tracking: v=1; b=H4sIAMjqaGkC/x3M0QqDIBQG4FeJc52QtjXpVWKI6an9FBY6Koref
 bLL7+a7KHEEJ2qLiyJvSFhChiwLch8bRhbw2aQq1VRSPgVqZ/xuEPCFnXGySSvCvLhJeP3SSiq
 rH01POVgjDzj+efe+7x/06TN5bAAAAA==
X-Change-ID: 20260115-i3c_dw_initialize_spinlock-d878212a846b
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, Joel Stanley <joel@jms.id.au>, 
 Jeremy Kerr <jk@codeconstruct.com.au>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jani Nurminen <jani.nurminen@windriver.com>, 
 Fredrik Markstrom <fredrik.markstrom@est.tech>, 
 Ivar Holmqvist <ivar.holmqvist@est.tech>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768483534; l=1074;
 i=fredrik.markstrom@est.tech; s=20260113; h=from:subject:message-id;
 bh=0LzRIFsM7K9scwfqEE9HL8ML7hRdUD7Lg/RNQupyH/Y=;
 b=ZyZv4QPTs2qw25vZgEfWWTYHfpd9cBYfv9kIhIaVFOJFf6fDLzf3optAFLaYZx/C/J75wqksl
 QvWl1wV6jOXAkPfTnUvglmyjAOQAOqWXcpzEU4BQ+6DJd+OHI/zv8j1
X-Developer-Key: i=fredrik.markstrom@est.tech; a=ed25519;
 pk=0a8IXHEgAX55JPS8VZfTf1sDp7q/oAOf459tDQd40Eg=
X-Endpoint-Received: by B4 Relay for fredrik.markstrom@est.tech/20260113
 with auth_id=600
X-Original-From: Fredrik Markstrom <fredrik.markstrom@est.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_052536_809840_2C0E3269 
X-CRM114-Status: UNSURE (   6.60  )
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
Reply-To: fredrik.markstrom@est.tech
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

From: Fredrik Markstrom <fredrik.markstrom@est.tech>

Fixes: e389b1d72a624 ("i3c: dw: Add support for in-band interrupts")
Suggested-by: Jani Nurminen <jani.nurminen@windriver.com>
Signed-off-by: Fredrik Markstrom <fredrik.markstrom@est.tech>
Reviewed-by: Ivar Holmqvist <ivar.holmqvist@est.tech>
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
