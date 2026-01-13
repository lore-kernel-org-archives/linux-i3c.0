Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E3BD2D0ED
	for <linux-i3c@archiver.kernel.org>; Tue, 13 Jan 2026 13:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version
	:Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bcNw6cUr/RURvsm4QaHMQTruVSX5eFOwimxql9zlA2Q=; b=J/64JkySoamnCg
	tA6kG3rUzXv44sYfqHcejdnLgXs4LiT4zJNN9lbDQ7OWfht909XjRMyQykNw9MKqo1zsDmhGSQ+Gf
	Xif0eWCcbAVkuk+PnvguO0acVBuwdKmPe/zHJSKeZySg05tlBv6KJp2bQqyRvwbp5FHw7AIB7dFkc
	wHN16ZbhdSnj9lPFAdqEKg+Mxd+GplA9Bpx/AH2T/EbanW/KDvTGtgFJLEIMV81DHt1ZruXJ8tZ3c
	k3H9dfag4kaV5bWti9omQoGq74XnWGIr1gfopCy3F3O8pnAQs1iK1ATQXnnHqcZ6Ho4E2tYggknrK
	n97gqpAi9R+gzYY0VU7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfe92-000000078FS-2OhM;
	Tue, 13 Jan 2026 13:09:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfe91-000000078Em-26E0
	for linux-i3c@lists.infradead.org;
	Tue, 13 Jan 2026 13:09:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8A9866000A;
	Tue, 13 Jan 2026 13:09:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3E585C116C6;
	Tue, 13 Jan 2026 13:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768309750;
	bh=zsNJkZzzl3cA4QgLezh89MO+pPFtt5CMMO6jHKfOHLc=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=jmx0opArZL+6wesSVFZ6WMirWGWmSgytTsc9MZTXR8nWkTV4BJZErmBjqzDSXjQHk
	 rWow+dfrdz2k28TUujd22v2xzKvssaM91kNa+wcmAOzssYQiUcGzQcUl4hdRxSeqMg
	 bcIbNyCdlgf36ROtjf+pfY1gcbtg1cTPa8O8Z/Q8uOvK0GzFmH+fxMNvO3IXjT7uMe
	 HyHhmJ92pza4cRiNwgMzr6J97wGYlfosntlzWSN0vLOZU702eR7fX4lu6BlRkUe/R1
	 fiyz3W9NSySybHRnRJvatXoJYtXac/px0SOfgLLjjZphTiWGSCdQ3KlgCeA8rxuG/f
	 bQxB64b3A0LeA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D2BAD2D0ED;
	Tue, 13 Jan 2026 13:09:10 +0000 (UTC)
From: Fredrik Markstrom via B4 Relay <devnull+fredrik.markstrom.est.tech@kernel.org>
Date: Tue, 13 Jan 2026 14:08:53 +0100
Subject: [PATCH] i3c: master: Set the device name only after we initialize
 i3c_bus->id
MIME-Version: 1.0
Message-Id: <20260113-set_i3c_master_name-v1-1-eafc5dcd1eee@est.tech>
X-B4-Tracking: v=1; b=H4sIAORDZmkC/x3M0QpAMBSH8VfRubYyRngVaS3+OBdGO5Ja3t1y+
 bv4vkiCwBDqs0gBNwsfPkHnGU2b8ysUz8lUFmVTaF0pwWW5muzu5EKw3u1QZoGp57rtdGMolWf
 Aws9/Hcb3/QArezuKZQAAAA==
X-Change-ID: 20260113-set_i3c_master_name-4fe45d589164
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Fredrik Markstrom <fredrik.markstrom@est.tech>, 
 Ivar Holmqvist <ivar.holmqvist@est.tech>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768309749; l=1634;
 i=fredrik.markstrom@est.tech; s=20260113; h=from:subject:message-id;
 bh=Cj/PcPQgBRHLVNwxGOBxQSUcqNPrcPktOg7QDmunmp0=;
 b=zQP+HGju9wkWqadBVxYUs2O19SAd49QBc7kFC8efIx6zOKkv65y4yCnB5sn6NZrksufqZxLPm
 ZmFYHawN1iPAVRX1G+zObPMQ3D5mVCvXSuT5ntV+MwCBqpn/Y3azjVn
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

The i3c_bus->id field is used to construct the unique name of the I3C
bus device. This field is initialized and assigned its unique value
within the i3c_bus_init() function.

However, the existing code was referencing i3c_bus->id *before* the
call to i3c_bus_init(), leading to all the masters having the same
device name string.

This commit moves the reference to i3c_bus->id to *after* the call to
i3c_bus_init().

Fixes: 9d4f219807d5 ("i3c: fix refcount inconsistency in i3c_master_register")
Signed-off-by: Fredrik Markstrom <fredrik.markstrom@est.tech>
Reviewed-by: Ivar Holmqvist <ivar.holmqvist@est.tech>
---
 drivers/i3c/master.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 7f606c871648..1bc3c9068402 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2881,7 +2881,6 @@ int i3c_master_register(struct i3c_master_controller *master,
 	INIT_LIST_HEAD(&master->boardinfo.i3c);
 
 	device_initialize(&master->dev);
-	dev_set_name(&master->dev, "i3c-%d", i3cbus->id);
 
 	master->dev.dma_mask = parent->dma_mask;
 	master->dev.coherent_dma_mask = parent->coherent_dma_mask;
@@ -2891,6 +2890,8 @@ int i3c_master_register(struct i3c_master_controller *master,
 	if (ret)
 		goto err_put_dev;
 
+	dev_set_name(&master->dev, "i3c-%d", i3cbus->id);
+
 	ret = of_populate_i3c_bus(master);
 	if (ret)
 		goto err_put_dev;

---
base-commit: 0f61b1860cc3f52aef9036d7235ed1f017632193
change-id: 20260113-set_i3c_master_name-4fe45d589164

Best regards,
-- 
Fredrik Markstrom <fredrik.markstrom@est.tech>



-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
