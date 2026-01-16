Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AEE3C79FBD
	for <linux-i3c@archiver.kernel.org>; Fri, 16 Jan 2026 14:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version
	:Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9yQZu+cyoFt5BTvRefXs7qnPrtv0xm3oDS3AP+45FJA=; b=IfWxJ2H9MKGaiM
	9w69QeECne4NEGhEW1eJGC/xgRMiig7lSSkUuo9YepI+ZtdfbJIlJnp2kh6eQSyO/VkpAxL2hmOlc
	8ZsUpCzIGLo7xxbAlG6ckDE9NTANRndJryJocKo5KnhUZaYwizA2iwN7Gfjzblo1sZwaLwJZgD5cU
	zrsV2B+XyR5j4aVCpPaCE1Tu4CkO9/x01rGLS0vhhlT8of7O5W6qApSp5kY6Qnauz/Ue7BroMaH+i
	Vg4A8dG/TDCfmOg7x4UeDyoGM7iUO+tVWK4fQy48sv/K/ndhB2Krcgo99et6QVpyLgvKhlIQHd3bI
	G3JBmbOZh6xXWdX04rlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgkpe-0000000EG1O-46AV;
	Fri, 16 Jan 2026 14:29:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgkpd-0000000EG0e-0z17
	for linux-i3c@lists.infradead.org;
	Fri, 16 Jan 2026 14:29:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6503660150;
	Fri, 16 Jan 2026 14:29:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1BB71C116C6;
	Fri, 16 Jan 2026 14:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768573784;
	bh=SHH7iUEl2nTecazCzCEtgtA9ilieHML5FncGlcIq09c=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=sc295c3HKztrf+EEoxCDTQanQjezjrUaqa547nO8utT+7A86Ltm7YVQK9fKgcloNI
	 ryfmnmmmUif+3w/xeVyiIYSmo7lMezyBnWsC1SUq4uL0/r79E3/oABm63mQPxh6Sw9
	 +cDRcfXfuAtMmh0r5cSSqPEAPNh+ap4D/Jz7hoiizQHhtfnSl10P+P01OqQz7tXgOm
	 cAYebT0NSrCkGJN2AlgJkcfXOrVuEJiGq4f6/GD5Y1fzMoqvo4IxBHHVRlt5cxKd0B
	 RoEGvhlVrnka5aucnhutyVOYmE1tJb7mxgURcogy07OcyQSNBWkNOPSmUvEj76L/y3
	 JD62LmZowHkgA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BF70C79FBD;
	Fri, 16 Jan 2026 14:29:44 +0000 (UTC)
From: Fredrik Markstrom via B4 Relay <devnull+fredrik.markstrom.est.tech@kernel.org>
Date: Fri, 16 Jan 2026 15:29:42 +0100
Subject: [PATCH v3] i3c: dw: Initialize spinlock to avoid upsetting lockdep
MIME-Version: 1.0
Message-Id: <20260116-i3c_dw_initialize_spinlock-v3-1-cf707b6ed75f@est.tech>
X-B4-Tracking: v=1; b=H4sIAFVLamkC/43NSw6DIBSF4a0YxqURVKQddR9NYwCv9aYGDRD6M
 O696MhR0+F/Bt+ZiQeH4Mk5m4mDiB5Hm6I4ZMT0yt6BYpua8JyLnLGKYmGa9tmgxYBqwA80fkI
 7jOZBW1lLzriSpdAkAZODDl8bfr2l7tGH0b23r8jW9S82MsqoPplKd0pq4OUFfDgGMD1Z1cj3k
 vgp8SRBJXRZsE4zWe+kZVm+ZFfuCw0BAAA=
X-Change-ID: 20260115-i3c_dw_initialize_spinlock-d878212a846b
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, Joel Stanley <joel@jms.id.au>, 
 Jeremy Kerr <jk@codeconstruct.com.au>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jani Nurminen <jani.nurminen@windriver.com>, 
 Fredrik Markstrom <fredrik.markstrom@est.tech>, 
 Ivar Holmqvist <ivar.holmqvist@est.tech>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768573783; l=1556;
 i=fredrik.markstrom@est.tech; s=20260113; h=from:subject:message-id;
 bh=/KOdTUSpOybjYrl+4vtlouA6tN65XqPMh7VsKfQMXIM=;
 b=8Hmq4QhdT8feOv8Uo8CnwWHiMPO2HDk8Yz3pp+jxafGGiodUoLEkQhHqpJJh5qRhiEqDzp7Qf
 7g1S3zE+n80CNvqys33fMPbEi7l4re8bL33/UKN6PrgBhn+QTloUQY4
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
Changes in v3:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v2: https://lore.kernel.org/r/20260116-i3c_dw_initialize_spinlock-v2-1-e56b431fb187@est.tech

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
