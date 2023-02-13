Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27572C636CC
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Feb 2023 10:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=r6zble624Bc5GKGjnFcEnaNP0e8aEr7MQRRDyMS4828=; b=pMz+tIcmueAXFD
	rzwTlOUspEDhdKnlsBOi/6NxpHK+0uXt+D2cC2R/XUQhY2eN6t6nIhkWl9zzyBpwIb2bQQj/lquom
	RockcwiHlUEWBvah0ef/LlHqO5nKObM96W2mcJJ0vkT8pBNBZ1uPPOe/awe7bF21y6gdMF3F53sEn
	fkKQQG4VTUIk/B1K05vJ13tNn7pJPbTMqghbfb/6FJlQldAEuVr6bEuz+ph7RltwhGkZJ8xJ+BGSw
	cMuR8psu6A9K4vS3H1Y8Sr/aXYuzGpZ11gJPg++57cMr5HIAztZE/6tUqTQyoegTp90C2Kfh/xVuI
	CvbucSjAe1t55fsC9Zhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRWEx-00E8nq-S2; Mon, 13 Feb 2023 10:39:20 +0000
Received: from [2601:1c2:980:9ec0::df2f] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRSs1-00DP1S-6k; Mon, 13 Feb 2023 07:03:25 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Boris Brezillon <boris.brezillon@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH -next] i3c: fix device.h kernel-doc warnings
Date: Sun, 12 Feb 2023 23:03:24 -0800
Message-Id: <20230213070324.1564-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 13 Feb 2023 02:39:18 -0800
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

Fix all kernel-doc warnings in <linux/i3c/device.h>:

include/linux/i3c/device.h:27: warning: contents before sections
include/linux/i3c/device.h:196: warning: Excess function parameter 'dev' description in 'dev_to_i3cdev'

Fixes: fa838c8ce537 ("i3c: move dev_to_i3cdev() to use container_of_const()")
Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-i3c@lists.infradead.org
---
 include/linux/i3c/device.h |   13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff -- a/include/linux/i3c/device.h b/include/linux/i3c/device.h
--- a/include/linux/i3c/device.h
+++ b/include/linux/i3c/device.h
@@ -18,17 +18,18 @@
 /**
  * enum i3c_error_code - I3C error codes
  *
+ * @I3C_ERROR_UNKNOWN: unknown error, usually means the error is not I3C
+ *		       related
+ * @I3C_ERROR_M0: M0 error
+ * @I3C_ERROR_M1: M1 error
+ * @I3C_ERROR_M2: M2 error
+ *
  * These are the standard error codes as defined by the I3C specification.
  * When -EIO is returned by the i3c_device_do_priv_xfers() or
  * i3c_device_send_hdr_cmds() one can check the error code in
  * &struct_i3c_priv_xfer.err or &struct i3c_hdr_cmd.err to get a better idea of
  * what went wrong.
  *
- * @I3C_ERROR_UNKNOWN: unknown error, usually means the error is not I3C
- *		       related
- * @I3C_ERROR_M0: M0 error
- * @I3C_ERROR_M1: M1 error
- * @I3C_ERROR_M2: M2 error
  */
 enum i3c_error_code {
 	I3C_ERROR_UNKNOWN = 0,
@@ -189,7 +190,7 @@ struct device *i3cdev_to_dev(struct i3c_
 
 /**
  * dev_to_i3cdev() - Returns the I3C device containing @dev
- * @dev: device object
+ * @__dev: device object
  *
  * Return: a pointer to an I3C device object.
  */

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
