Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2AC9E77188
	for <linux-i3c@archiver.kernel.org>; Fri, 10 Jan 2025 11:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6AlG+aaC6y6dTqI7tHEzfEBA8Fygr2QPoSPJx25khMc=; b=MQOByKifAW9T+H
	WrE/yJZm9fWtcArD8ulkvVFaL8vjaA34b8l+z58+0CPIkOGvn1lbBoW/ogJzbrKdHOq7XPLUumTLY
	SbxAkczpc++bxPvjEBecUlw2y3UQgL9SZ/ZmTPY7qSjLXMbzqBiKCQTvr0Adkh+f4IgRvpi6rgxc2
	w0a0hCiDgOsZBGCJoP+3PScr1H/xRzjDSFSAo24UQBbKSbFm35y0WM5gtndKxImJPT3U3fOssxpGs
	RBuSBhhoSW/ieBPbJq5O3uoDkZE02WFoXYsn29jsVG13f80EJfl4SlMcJWFFyODGRDyO5g7Zu5XRW
	+tAWha2N48YqVAk9cf3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWD2w-0000000F5RC-2bML;
	Fri, 10 Jan 2025 11:19:22 +0000
Received: from mx.treblig.org ([2a00:1098:5b::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tP0Yp-0000000748L-1m0V
	for linux-i3c@lists.infradead.org;
	Sat, 21 Dec 2024 14:34:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=KsAUtwESBoAEGukCvUJ4WAnh5Hf9oMdH9Xar5HAAyu4=; b=BjA4+mEd5w764+xW
	FbqPHkYZH8rSvA6BIwzzN1amiwnvn2Qsw2Wf5XKXrgL6zPloQfxunGjkftCr7JMXdYOcKi9Dob2YI
	iSThJfjGJKWOTtgJtuDP8SHqmGLp6LN5CjfaFYLVRiy7fAdoNaJ6cFkIgeOo4oPALusxMJ+jMWhr6
	TjZ2MRKgWDS6+a+MHCPMeFQ+pGO3VbCySFzaXlaDZf+GuIm0QgivCw5jx22eRu20v0uUOeGfAiIDo
	edkW9kuLd4rXr4VjmGU8cofR/gXjLh0P3ps9rMrlHCs7qz/8b20xyjYTGBLxMRwwpYbp+EOY44BOr
	I9nq0ZFjl+xjysQpEQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1tP0Yd-006gOA-0z;
	Sat, 21 Dec 2024 14:34:19 +0000
From: linux@treblig.org
To: alexandre.belloni@bootlin.com,
	linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] i3c: Remove unused i3c_device_do_setdasa
Date: Sat, 21 Dec 2024 14:34:18 +0000
Message-ID: <20241221143418.86012-1-linux@treblig.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_063431_507335_FD12654F 
X-CRM114-Status: UNSURE (   7.23  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Fri, 10 Jan 2025 03:19:21 -0800
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

i3c_device_do_setdasa() was added in 2022 as part of
commit 672825cd2823 ("i3c: export SETDASA method")

but has been unused.

It calls i3c_dev_setdasa_locked() which is now also unused.

Remove them both.
(This is effectively a revert of 672825cd2823).

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/i3c/device.c       | 20 --------------------
 drivers/i3c/internals.h    |  1 -
 drivers/i3c/master.c       | 19 -------------------
 include/linux/i3c/device.h |  2 --
 4 files changed, 42 deletions(-)

diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
index e80e48756914..984976f28314 100644
--- a/drivers/i3c/device.c
+++ b/drivers/i3c/device.c
@@ -54,26 +54,6 @@ int i3c_device_do_priv_xfers(struct i3c_device *dev,
 }
 EXPORT_SYMBOL_GPL(i3c_device_do_priv_xfers);
 
-/**
- * i3c_device_do_setdasa() - do I3C dynamic address assignement with
- *                           static address
- *
- * @dev: device with which the DAA should be done
- *
- * Return: 0 in case of success, a negative error core otherwise.
- */
-int i3c_device_do_setdasa(struct i3c_device *dev)
-{
-	int ret;
-
-	i3c_bus_normaluse_lock(dev->bus);
-	ret = i3c_dev_setdasa_locked(dev->desc);
-	i3c_bus_normaluse_unlock(dev->bus);
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(i3c_device_do_setdasa);
-
 /**
  * i3c_device_get_info() - get I3C device information
  *
diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
index 433f6088b7ce..842e1a865877 100644
--- a/drivers/i3c/internals.h
+++ b/drivers/i3c/internals.h
@@ -13,7 +13,6 @@
 void i3c_bus_normaluse_lock(struct i3c_bus *bus);
 void i3c_bus_normaluse_unlock(struct i3c_bus *bus);
 
-int i3c_dev_setdasa_locked(struct i3c_dev_desc *dev);
 int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
 				 struct i3c_priv_xfer *xfers,
 				 int nxfers);
diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 42310c9a00c2..000187339400 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2916,25 +2916,6 @@ void i3c_master_unregister(struct i3c_master_controller *master)
 }
 EXPORT_SYMBOL_GPL(i3c_master_unregister);
 
-int i3c_dev_setdasa_locked(struct i3c_dev_desc *dev)
-{
-	struct i3c_master_controller *master;
-
-	if (!dev)
-		return -ENOENT;
-
-	master = i3c_dev_get_master(dev);
-	if (!master)
-		return -EINVAL;
-
-	if (!dev->boardinfo || !dev->boardinfo->init_dyn_addr ||
-		!dev->boardinfo->static_addr)
-		return -EINVAL;
-
-	return i3c_master_setdasa_locked(master, dev->info.static_addr,
-						dev->boardinfo->init_dyn_addr);
-}
-
 int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
 				 struct i3c_priv_xfer *xfers,
 				 int nxfers)
diff --git a/include/linux/i3c/device.h b/include/linux/i3c/device.h
index 0a8a44ac2f02..f4e924c179d7 100644
--- a/include/linux/i3c/device.h
+++ b/include/linux/i3c/device.h
@@ -301,8 +301,6 @@ int i3c_device_do_priv_xfers(struct i3c_device *dev,
 			     struct i3c_priv_xfer *xfers,
 			     int nxfers);
 
-int i3c_device_do_setdasa(struct i3c_device *dev);
-
 void i3c_device_get_info(const struct i3c_device *dev, struct i3c_device_info *info);
 
 struct i3c_ibi_payload {
-- 
2.47.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
