Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1137FC678DA
	for <linux-i3c@archiver.kernel.org>; Wed, 11 Jan 2023 11:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GAtmPBv38lSoHUlQnPQZ3voLgdms7S5FOBfvGNTyazA=; b=SZwyCdweQtlC7y
	RVJwM8f66jDioEvrLmnLI7oY9u7+eWz5Hlgqdbf4v8jH91+WjdffdXWahUmtL0fvYTkCVd6tFMN9v
	GH7lwF9gBeGGdiWDp7VMNBvk+gfNb8nROy1kYDW/rELkDfqa/j1yj56YMDjeo14sBXwvzvRmDIl7w
	SeVfXa5MJIa9FVCJsN2fiuPoPeXaS/AQq4ZoAC2ZVJdHXtBO4cWfgCld1KUusN/O5zSb7P+yIr0h0
	DjNa59gO3cU8cG6I/Hy3v2PQprDytsUgI1pQnFumVgVvf0GU25gwoJFPdmsz/Ft1xDNEkowX+xeIz
	qr7xxSFG1vL+6NZkMEPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFZJx-00B3wB-WD; Wed, 11 Jan 2023 11:31:06 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFZJv-00B3tR-EG
	for linux-i3c@lists.infradead.org; Wed, 11 Jan 2023 11:31:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id F3B00B81BAD;
	Wed, 11 Jan 2023 11:31:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28793C433D2;
	Wed, 11 Jan 2023 11:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1673436660;
	bh=PUodvLzyboiiTwDvvOkvPeOcnFY8YPv39Q5FU+hy6Nk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Mvjux6f392wzL/QzluvGE3BmPKwvBLoh40iIF1KrSrua9J+CorAK3WySMiA3jMOMw
	 DzrY7BigHuYZ7GH9GbGigGmJS4a6vGUWXyl0oV6jGsbVuZgUZUykYTwc83OIrhCrZT
	 BIryhBwUAIo53/RsZeGrTKhCduZz4Qb1f2z0GZAw=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH v2 02/16] i3c: move dev_to_i3cdev() to use container_of_const()
Date: Wed, 11 Jan 2023 12:30:04 +0100
Message-Id: <20230111113018.459199-3-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111113018.459199-1-gregkh@linuxfoundation.org>
References: <20230111113018.459199-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1981; i=gregkh@linuxfoundation.org; h=from:subject; bh=PUodvLzyboiiTwDvvOkvPeOcnFY8YPv39Q5FU+hy6Nk=; b=owGbwMvMwCRo6H6F97bub03G02pJDMn75h5f+eHO+RleNy/2PJ7s5lasfKaFTdjwRe9WkQmsPzwe XYv51xHLwiDIxCArpsjyZRvP0f0VhxS9DG1Pw8xhZQIZwsDFKQATeXecYUFT6oco2U8syyPndM7nWh fZkr5bUoFhfu1s3/pMQcPSCV9u6CZveu33ebX+SgA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_033103_652010_B3BF7EF3 
X-CRM114-Status: GOOD (  12.22  )
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

The driver core is changing to pass some pointers as const, so move
dev_to_i3cdev() to use container_of_const() to handle this change.
dev_to_i3cdev() now properly keeps the const-ness of the pointer passed
into it, while as before it could be lost.

Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-i3c@lists.infradead.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/i3c/device.c       | 12 ------------
 include/linux/i3c/device.h |  9 ++++++++-
 2 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
index 9762630b917e..d111499061b2 100644
--- a/drivers/i3c/device.c
+++ b/drivers/i3c/device.c
@@ -208,18 +208,6 @@ struct device *i3cdev_to_dev(struct i3c_device *i3cdev)
 }
 EXPORT_SYMBOL_GPL(i3cdev_to_dev);
 
-/**
- * dev_to_i3cdev() - Returns the I3C device containing @dev
- * @dev: device object
- *
- * Return: a pointer to an I3C device object.
- */
-struct i3c_device *dev_to_i3cdev(struct device *dev)
-{
-	return container_of(dev, struct i3c_device, dev);
-}
-EXPORT_SYMBOL_GPL(dev_to_i3cdev);
-
 /**
  * i3c_device_match_id() - Returns the i3c_device_id entry matching @i3cdev
  * @i3cdev: I3C device
diff --git a/include/linux/i3c/device.h b/include/linux/i3c/device.h
index 1c997abe868c..68b558929aec 100644
--- a/include/linux/i3c/device.h
+++ b/include/linux/i3c/device.h
@@ -186,7 +186,14 @@ static inline struct i3c_driver *drv_to_i3cdrv(struct device_driver *drv)
 }
 
 struct device *i3cdev_to_dev(struct i3c_device *i3cdev);
-struct i3c_device *dev_to_i3cdev(struct device *dev);
+
+/**
+ * dev_to_i3cdev() - Returns the I3C device containing @dev
+ * @dev: device object
+ *
+ * Return: a pointer to an I3C device object.
+ */
+#define dev_to_i3cdev(__dev)	container_of_const(__dev, struct i3c_device, dev)
 
 const struct i3c_device_id *
 i3c_device_match_id(struct i3c_device *i3cdev,
-- 
2.39.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
