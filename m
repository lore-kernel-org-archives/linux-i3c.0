Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FBC1C4332F
	for <linux-i3c@archiver.kernel.org>; Sat, 10 Dec 2022 21:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=j7upQuB4ndcWJEDPRK525FHZe7W5a06k4AbtM7zjvb8=; b=LP3
	JK6nMZK1qdQJ1yhVnFnwtPSdDj35s+t3ABRRhXp40VFpT7LjZl3koVn7i+fVQ5XyPVOx19Hn59z84
	maMwRYmRt8u83vXvA2roqI+YBDQ1dvcvYOSzsa/YLwRnfWodjquNhStAPpOY2pAHgct0jzwkOr17w
	84c3oH2KlVUOSt+hRq2ubapa5I6KF6dDb3GWNxYrJwglFSkJarFMcudiOf3cUTZvdDAlfUlQPK3Lu
	WGTX2ix8NAAmThEbc+GFyBk2EoUYFrVqeVMenaxONjXj91jfSZlOn93bWt5RZ+Eo8uLsCdP8FGViD
	Ba7MmCH6cG8i4rLAAbV5yGXvNBv2RWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p47NP-005cfT-8A; Sat, 10 Dec 2022 21:27:19 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p31Nw-00CLhJ-SF
	for linux-i3c@lists.infradead.org; Wed, 07 Dec 2022 20:51:22 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-3b102317668so202393057b3.23
        for <linux-i3c@lists.infradead.org>; Wed, 07 Dec 2022 12:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5mynKz5oCR+Be228hwbU8PAPBPy+Q/WCZLZqKob1ZyY=;
        b=K9Bw0uYC5EINGJ0SvI1INZ2sag4QfyGThlbB2Zt3HAHUnI+Oa7hKjMuD8YLFZ7rSre
         8Vfp81jZdch4auKOIS1u61VnYeDU7NnBqrKxpgE+pUgzGyPwVy6OytACzzxNXvbpfbWJ
         t9+5kaM+8VllcO/yeRnmvOBDMglyHW0TOwz3ri938gHynFPisQ6u2r+twv7wQzDtSqJx
         UR/lZaYU1G3QIRVxzg4B2jVXa2QRXpjCS7mGEfd/1VJ/VtQbcBNdfz/IOxJCZF8TGI7G
         oOTDv9EBJnYNEcFFJtCBETYRP6vvcZqsLaGhnXCQvaBevfeHIrM+nrmF/lxC5WW6H4LK
         SBYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5mynKz5oCR+Be228hwbU8PAPBPy+Q/WCZLZqKob1ZyY=;
        b=AdrEx03ZJA7wZX8s8uxf7sKFXcbMBw/isB2W3hzyr7mvSa/K6LdgzsBjujj7ML9rBY
         vb7G1O9+QUCMbjFXCHX5jGZ3ZhqD8e86NUaajIgE8M42Pe76W7jBY3jk+IQaC/SErsZE
         wQh2FllblJDWLPp5SHTQMnCMw09K1AW9FFrVBcVNiqb9xSl5JuG0XkZQG1JLyVuLnLYt
         QWabKB3lygxAtU9xI+FYVtWFVrWUXuW2c+ryPujXh3fwvo1f3C01G5SD/0/T3KFeyeHy
         n7wtaZbjoO9aT2/+afMqa+jdq39EmxlzaGsmJ0Pi/XPAbUkQhB+oBbPaOJccSEZn3wHN
         TUxg==
X-Gm-Message-State: ANoB5plm5/qLgzFJ3j0tKs58DgeLwJs1r/AWYEbo9+ufjp9QGJGqPo+t
	b23fbbL1N0DEEHk3c8d+zrTEL5ldmZSHwngi
X-Google-Smtp-Source: AA0mqf7cPlRUzlr+/Oy6wGESiWoB3+7782KRnmnJvA592PmfJn3Lznx+GeaN1wDU+VAVXlItkUO0yYI9mFFPX61a
X-Received: from zenghuchen.c.googlers.com ([fda3:e722:ac3:cc00:2b:7d90:c0a8:2448])
 (user=zenghuchen job=sendgmr) by 2002:a25:248d:0:b0:6f1:29d9:44ba with SMTP
 id k135-20020a25248d000000b006f129d944bamr61196926ybk.632.1670446276466; Wed,
 07 Dec 2022 12:51:16 -0800 (PST)
Date: Wed,  7 Dec 2022 15:50:59 -0500
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.0.rc0.267.gcb52ba06e7-goog
Message-ID: <20221207205059.3848851-1-zenghuchen@google.com>
Subject: [PATCH] I3C: export SETDASA method
From: Jack Chen <zenghuchen@google.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Jesus Sanchez-Palencia <jesussanp@google.com>, Mark Slevinsky <markslevinsky@google.com>, 
	Jack Chen <zenghuchen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_125120_946145_5EBEB371 
X-CRM114-Status: GOOD (  11.88  )
X-Mailman-Approved-At: Sat, 10 Dec 2022 13:27:18 -0800
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

Because not all I3C drivers have the hot-join feature ready, and
especially not all I3C devices support hot-join feature, exporting
SETDASA method could be useful. With this function, the I3C controller
could perform a DAA to I3C devices when users decide to turn these I3C
devices off and on again during run-time.

Tested: This change has been tested with turnning off an I3C device and
turning on it again during run-time. The device driver calls SETDASA
method to perform DAA to the device. And communication between I3C
controller and device is set up again correctly.

Signed-off-by: Jack Chen <zenghuchen@google.com>
---
 drivers/i3c/device.c       | 20 ++++++++++++++++++++
 drivers/i3c/internals.h    |  1 +
 drivers/i3c/master.c       | 19 +++++++++++++++++++
 include/linux/i3c/device.h |  2 ++
 4 files changed, 42 insertions(+)

diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
index e92d3e9a52bd..9762630b917e 100644
--- a/drivers/i3c/device.c
+++ b/drivers/i3c/device.c
@@ -50,6 +50,26 @@ int i3c_device_do_priv_xfers(struct i3c_device *dev,
 }
 EXPORT_SYMBOL_GPL(i3c_device_do_priv_xfers);
 
+/**
+ * i3c_device_do_setdasa() - do I3C dynamic address assignement with
+ *                           static address
+ *
+ * @dev: device with which the DAA should be done
+ *
+ * Return: 0 in case of success, a negative error core otherwise.
+ */
+int i3c_device_do_setdasa(struct i3c_device *dev)
+{
+	int ret;
+
+	i3c_bus_normaluse_lock(dev->bus);
+	ret = i3c_dev_setdasa_locked(dev->desc);
+	i3c_bus_normaluse_unlock(dev->bus);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(i3c_device_do_setdasa);
+
 /**
  * i3c_device_get_info() - get I3C device information
  *
diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
index 86b7b44cfca2..908a807badaf 100644
--- a/drivers/i3c/internals.h
+++ b/drivers/i3c/internals.h
@@ -15,6 +15,7 @@ extern struct bus_type i3c_bus_type;
 void i3c_bus_normaluse_lock(struct i3c_bus *bus);
 void i3c_bus_normaluse_unlock(struct i3c_bus *bus);
 
+int i3c_dev_setdasa_locked(struct i3c_dev_desc *dev);
 int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
 				 struct i3c_priv_xfer *xfers,
 				 int nxfers);
diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 351c81a929a6..d7e6f6c99aea 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2708,6 +2708,25 @@ int i3c_master_unregister(struct i3c_master_controller *master)
 }
 EXPORT_SYMBOL_GPL(i3c_master_unregister);
 
+int i3c_dev_setdasa_locked(struct i3c_dev_desc *dev)
+{
+	struct i3c_master_controller *master;
+
+	if (!dev)
+		return -ENOENT;
+
+	master = i3c_dev_get_master(dev);
+	if (!master)
+		return -EINVAL;
+
+	if (!dev->boardinfo || !dev->boardinfo->init_dyn_addr ||
+		!dev->boardinfo->static_addr)
+		return -EINVAL;
+
+	return i3c_master_setdasa_locked(master, dev->info.static_addr,
+						dev->boardinfo->init_dyn_addr);
+}
+
 int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
 				 struct i3c_priv_xfer *xfers,
 				 int nxfers)
diff --git a/include/linux/i3c/device.h b/include/linux/i3c/device.h
index 8242e13e7b0b..90b6e0f7d29f 100644
--- a/include/linux/i3c/device.h
+++ b/include/linux/i3c/device.h
@@ -293,6 +293,8 @@ int i3c_device_do_priv_xfers(struct i3c_device *dev,
 			     struct i3c_priv_xfer *xfers,
 			     int nxfers);
 
+int i3c_device_do_setdasa(struct i3c_device *dev);
+
 void i3c_device_get_info(struct i3c_device *dev, struct i3c_device_info *info);
 
 struct i3c_ibi_payload {
-- 
2.39.0.rc0.267.gcb52ba06e7-goog


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
