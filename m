Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA1ABC79F99
	for <linux-i3c@archiver.kernel.org>; Sun,  6 Sep 2026 20:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=kMxhwPdn+cQZgr2r2uuAqWohid9hD3TLoAbUuVP0kJ0=; b=0ePTfDbJNopGztx7yLpkLgrZcV
	ft3omVkVQ4t2xatt+jH4TCkyw2AjAA3F1N9G3KiN+kb/b4T/tQCowMQQ3v6qGOywYjzLikSlC+04N
	c+aSbcNn7qIZ1k0rp4+PIQt6zxY/oXIdBNkAQwLVrbC+lRN4jBFj0SU5MRgoH3emb2xJCOLj5ojpk
	mJwt29rGKduOESrdIdIqxC6Prc40K7YZtedEt5Vaa1dXc/oGwyMTjdVyVAi9fD2ahcJHyFwSwBqht
	GM8DEIKDHJocLtxI38oxcX57JYrfHxNzC4qcP1baLdNR+wkvVcE2yJltMoBG7YW4fSamF2dxgvOWb
	6evPSLrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3JUM-00000005YOq-1yvY;
	Sun, 06 Sep 2026 20:29:20 +0000
Received: from mail-pg1-x546.google.com ([2607:f8b0:4864:20::546])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3JUJ-00000005YMo-21nH
	for linux-i3c@lists.infradead.org;
	Sun, 06 Sep 2026 20:29:17 +0000
Received: by mail-pg1-x546.google.com with SMTP id 41be03b00d2f7-cc1cade6b71so2610036a12.0
        for <linux-i3c@lists.infradead.org>; Sun, 06 Sep 2026 13:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788726553; x=1789331353; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N6P/Ig3rqwkwvLCIGd5vysxjswqU7tbeL2/LKN3cT/4=;
        b=FV0NJv/iGaqe7hjTr4z16PHefGrR1ohxQDem2XMy75CpqBv68qcoYAxl0qo1/CfajK
         nnouQ7Bd1CveKoXHcNLF774ybxC8sfXKHQYlX5bwkauh8DfQYsCaHhuHColtIvxCwdmj
         ImARQNhRsyVqpW5bsxgiUI2iPI3AbXSZ8XSFleCkZfvv28zu60vPEDRkc20nx366cQU7
         ntsKvAzGNzP3l/+LoHnOm5KPql4mK6docemeGeRy+s5SzIfhqNnDLZA7cm40/1cz8p5K
         OqI9L2UIVeEuxC+0M4Q7iylfMfJO/bfFdAjSxFVYPKT1B9neJMViuX5vUpbUuRGRa3we
         XYiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788726553; x=1789331353;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N6P/Ig3rqwkwvLCIGd5vysxjswqU7tbeL2/LKN3cT/4=;
        b=rulWr9AVhe/c4ALTDEk6YuYJSS1wE82NDFKB+6Hv+IqONLhDdfvepdCj6ttpjIrlPe
         LlNIujEc2PrLCgGaYpE3FSJQ7+ugwvxzUy6lq8Wt8qmeMkK0hDMFmD47fxlBMicrFJqR
         Fqqy7gG9juvzkT1JeCGmyok74Z1capnVw9Xx1L8WFHngUZ+RkvP529XJZY6ri17aSqJa
         +KsFPW727zF9MNzYtylXktBn0n62YFpf5SwHNcpa3lvHEtlTzU0Xw9gZB+DrcamnbOcP
         8aKn5ZnKeiVtYA9cnSfPcyO9OtVo9HerLsHibWEB2Cq8jG4PIWGkbQSrU0BIUbdGnwHg
         kryw==
X-Gm-Message-State: AFuF++mLQ0EH6I3gnHYl/lZHu17dy/qdaxYjCvftwiGYjBv2yUr8PJWy
	9mLlE1BGmCVdUuIlqpzWqcPn7jT1mPxx7tRFVA+Ug4AxUaoWwPsU16BuqtuQL34Hfyfv1KuOELe
	ImpBUMIVrdfj6aalBKWBunjQve5icqQ6fCOyswJjuG/5N+tVIyhYU4OayIbDoJ3hB0hVujH6T2h
	OSnSoGfw4oXSDBuUI4ASlimTtI+wWTE7UKtcBYpd+jMPQEc9d5U4tpymtkQ2KCBfdASB6i1Y70i
	1OPlw==
X-Received: from dymj5.prod.google.com ([2002:a05:7300:6b05:b0:337:3bb8:d6c8])
 (user=samagazaryan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:1602:b0:3d3:aed2:6f23 with SMTP id adf61e73a8af0-3da21638008mr24550107637.23.1788726552696;
 Sun, 06 Sep 2026 13:29:12 -0700 (PDT)
Date: Sun,  6 Sep 2026 20:27:47 +0000
In-Reply-To: <20260906202747.4041389-1-samagazaryan@google.com>
Mime-Version: 1.0
References: <20260906202747.4041389-1-samagazaryan@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260906202747.4041389-4-samagazaryan@google.com>
Subject: [PATCH v4 3/3] i3c: add i3cdev module to expose i3c dev in /dev
From: Sam Agazaryan <samagazaryan@google.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Vitor Soares <vitor.soares@toradex.com>, 
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>, linux-kernel@vger.kernel.org, 
	Sam Agazaryan <samagazaryan@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_132915_559470_9758AEE2 
X-CRM114-Status: GOOD (  30.81  )
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

From: Vitor Soares <vitor.soares@toradex.com>

This patch adds userspace character device support for I3C SDR private
transfers via /dev.

The module allows userspace programs to interact directly with I3C
targets that do not have a kernel driver bound to them, such as devices
in ROM/bootloader recovery mode (e.g. OCP Secure Firmware Recovery v1.1
and Caliptra Silicon Root of Trust recovery flows).

Features:
  - Dynamically exposes /dev/bus/i3c/<device> character devices for I3C
    devices when unbound from kernel drivers.
  - Dynamically allocates character device minor numbers using the IDA
    allocator.
  - Implements private SDR read/write transfers via I3C_IOC_PRIV_XFER ioctl
    with 64-bit aligned UAPI data structures.
  - Supports compat_ptr_ioctl for 32-bit userspace on 64-bit kernels.
  - Uses cdev_device_add/cdev_device_del with device refcounting to ensure
    safe lifecycle management and prevent use-after-free on driver detach.

Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
Co-developed-by: Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>
Signed-off-by: Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>
Co-developed-by: Sam Agazaryan <samagazaryan@google.com>
Signed-off-by: Sam Agazaryan <samagazaryan@google.com>
---
 MAINTAINERS                     |   1 +
 drivers/i3c/Kconfig             |  11 +
 drivers/i3c/Makefile            |   1 +
 drivers/i3c/i3cdev.c            | 445 ++++++++++++++++++++++++++++++++
 include/uapi/linux/i3c/i3cdev.h |  37 +++
 5 files changed, 495 insertions(+)
 create mode 100644 drivers/i3c/i3cdev.c
 create mode 100644 include/uapi/linux/i3c/i3cdev.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 81a9a02c919d..30a5cb12c4f0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12364,6 +12364,7 @@ F:	Documentation/driver-api/i3c
 F:	drivers/i3c/
 F:	include/dt-bindings/i3c/
 F:	include/linux/i3c/
+F:	include/uapi/linux/i3c/
 
 IBM Operation Panel Input Driver
 M:	Eddie James <eajames@linux.ibm.com>
diff --git a/drivers/i3c/Kconfig b/drivers/i3c/Kconfig
index 626c54b386d5..166875837ec6 100644
--- a/drivers/i3c/Kconfig
+++ b/drivers/i3c/Kconfig
@@ -20,6 +20,17 @@ menuconfig I3C
 	  will be called i3c.
 
 if I3C
+
+config I3CDEV
+	tristate "I3C device interface"
+	help
+	  Say Y here to use i3c-* device files, usually found in the /dev
+	  directory on your system.  They make it possible to have user-space
+	  programs use the I3C devices.
+
+	  This support is also available as a module.  If so, the module
+	  will be called i3cdev.
+
 source "drivers/i3c/master/Kconfig"
 endif # I3C
 
diff --git a/drivers/i3c/Makefile b/drivers/i3c/Makefile
index 11982efbc6d9..606d422841b2 100644
--- a/drivers/i3c/Makefile
+++ b/drivers/i3c/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 i3c-y				:= device.o master.o
 obj-$(CONFIG_I3C)		+= i3c.o
+obj-$(CONFIG_I3CDEV)		+= i3cdev.o
 obj-$(CONFIG_I3C)		+= master/
diff --git a/drivers/i3c/i3cdev.c b/drivers/i3c/i3cdev.c
new file mode 100644
index 000000000000..904ebfd48769
--- /dev/null
+++ b/drivers/i3c/i3cdev.c
@@ -0,0 +1,445 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020 Synopsys, Inc. and/or its affiliates.
+ *
+ * Author: Vitor Soares <soares@synopsys.com>
+ */
+
+#include <linux/cdev.h>
+#include <linux/compat.h>
+#include <linux/device.h>
+#include <linux/fs.h>
+#include <linux/init.h>
+#include <linux/jiffies.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/notifier.h>
+#include <linux/slab.h>
+#include <linux/uaccess.h>
+
+#include <linux/i3c/i3cdev.h>
+
+#include "internals.h"
+
+struct i3cdev_data {
+	struct i3c_device *i3c;
+	struct device dev;
+	struct mutex xfer_lock; /* prevent detach while transferring */
+	struct cdev cdev;
+	int id;
+};
+
+static DEFINE_IDA(i3cdev_ida);
+static dev_t i3cdev_number;
+#define I3C_MINORS (MINORMASK + 1)
+
+static void i3cdev_dev_release(struct device *dev)
+{
+	struct i3cdev_data *i3cdev = container_of(dev, struct i3cdev_data, dev);
+
+	ida_free(&i3cdev_ida, i3cdev->id);
+	kfree(i3cdev);
+}
+
+static struct i3cdev_data *get_free_i3cdev(struct i3c_device *i3c)
+{
+	struct i3cdev_data *i3cdev;
+	int id;
+
+	id = ida_alloc(&i3cdev_ida, GFP_KERNEL);
+	if (id < 0) {
+		pr_err("i3cdev: no minor number available!\n");
+		return ERR_PTR(id);
+	}
+
+	i3cdev = kzalloc(sizeof(*i3cdev), GFP_KERNEL);
+	if (!i3cdev) {
+		ida_free(&i3cdev_ida, id);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	i3cdev->i3c = i3c;
+	i3cdev->id = id;
+	i3cdev_set_drvdata(i3c, i3cdev);
+
+	return i3cdev;
+}
+
+static ssize_t
+i3cdev_read(struct file *file, char __user *buf, size_t count, loff_t *f_pos)
+{
+	struct i3cdev_data *i3cdev = file->private_data;
+	struct i3c_device *i3c;
+	struct i3c_xfer xfers = {
+		.rnw = true,
+		.len = count,
+	};
+	int ret = -ENODEV;
+	char *tmp;
+
+	mutex_lock(&i3cdev->xfer_lock);
+	i3c = i3cdev->i3c;
+	if (!i3c || i3c->dev.driver)
+		goto err_out;
+
+	tmp = kzalloc(count, GFP_KERNEL);
+	if (!tmp) {
+		ret = -ENOMEM;
+		goto err_out;
+	}
+
+	xfers.data.in = tmp;
+
+	dev_dbg(&i3c->dev, "Reading %zu bytes.\n", count);
+
+	ret = i3c_device_do_xfers(i3c, &xfers, 1, I3C_SDR);
+	if (!ret)
+		ret = copy_to_user(buf, tmp, xfers.len) ? -EFAULT : xfers.len;
+
+	kfree(tmp);
+
+err_out:
+	mutex_unlock(&i3cdev->xfer_lock);
+	return ret;
+}
+
+static ssize_t
+i3cdev_write(struct file *file, const char __user *buf, size_t count,
+	     loff_t *f_pos)
+{
+	struct i3cdev_data *i3cdev = file->private_data;
+	struct i3c_device *i3c;
+	struct i3c_xfer xfers = {
+		.rnw = false,
+		.len = count,
+	};
+	int ret = -ENODEV;
+	char *tmp;
+
+	mutex_lock(&i3cdev->xfer_lock);
+	i3c = i3cdev->i3c;
+	if (!i3c || i3c->dev.driver)
+		goto err_out;
+
+	tmp = memdup_user(buf, count);
+	if (IS_ERR(tmp)) {
+		ret = PTR_ERR(tmp);
+		goto err_out;
+	}
+
+	xfers.data.out = tmp;
+
+	dev_dbg(&i3c->dev, "Writing %zu bytes.\n", count);
+
+	ret = i3c_device_do_xfers(i3c, &xfers, 1, I3C_SDR);
+	kfree(tmp);
+
+err_out:
+	mutex_unlock(&i3cdev->xfer_lock);
+	return (!ret) ? count : ret;
+}
+
+static int
+i3cdev_do_priv_xfer(struct i3c_device *dev, struct i3c_ioc_priv_xfer *xfers,
+		    unsigned int nxfers)
+{
+	struct i3c_xfer *k_xfers;
+	u8 **data_ptrs;
+	int i, j, ret = 0;
+
+	/* Since we have nxfers we may allocate k_xfer + *data_ptrs together */
+	k_xfers = kcalloc(nxfers, sizeof(*k_xfers) + sizeof(*data_ptrs),
+			  GFP_KERNEL);
+	if (!k_xfers)
+		return -ENOMEM;
+
+	/* set data_ptrs to be after nxfers * i3c_xfer */
+	data_ptrs = (void *)k_xfers + (nxfers * sizeof(*k_xfers));
+
+	for (i = 0; i < nxfers; i++) {
+		if (xfers[i].rnw) {
+			data_ptrs[i] = kzalloc(xfers[i].len, GFP_KERNEL);
+			if (!data_ptrs[i]) {
+				ret = -ENOMEM;
+				break;
+			}
+			k_xfers[i].rnw = true;
+			k_xfers[i].data.in = data_ptrs[i];
+		} else {
+			data_ptrs[i] = memdup_user(u64_to_user_ptr(xfers[i].data),
+						   xfers[i].len);
+			if (IS_ERR(data_ptrs[i])) {
+				ret = PTR_ERR(data_ptrs[i]);
+				break;
+			}
+			k_xfers[i].rnw = false;
+			k_xfers[i].data.out = data_ptrs[i];
+		}
+
+		k_xfers[i].len = xfers[i].len;
+	}
+
+	if (ret < 0)
+		goto err_free_mem;
+
+	ret = i3c_device_do_xfers(dev, k_xfers, nxfers, I3C_SDR);
+	if (ret)
+		goto err_free_mem;
+
+	for (i = 0; i < nxfers; i++) {
+		if (xfers[i].rnw) {
+			if (copy_to_user(u64_to_user_ptr(xfers[i].data),
+					 data_ptrs[i], xfers[i].len))
+				ret = -EFAULT;
+		}
+	}
+
+err_free_mem:
+	for (j = 0; j < i; j++)
+		kfree(data_ptrs[j]);
+	kfree(k_xfers);
+	return ret;
+}
+
+static struct i3c_ioc_priv_xfer *
+i3cdev_get_ioc_priv_xfer(unsigned int cmd, struct i3c_ioc_priv_xfer *u_xfers,
+			 unsigned int *nxfers)
+{
+	u32 tmp = _IOC_SIZE(cmd);
+
+	if ((tmp % sizeof(struct i3c_ioc_priv_xfer)) != 0)
+		return ERR_PTR(-EINVAL);
+
+	*nxfers = tmp / sizeof(struct i3c_ioc_priv_xfer);
+	if (*nxfers == 0)
+		return ERR_PTR(-EINVAL);
+
+	return memdup_user(u_xfers, tmp);
+}
+
+static int
+i3cdev_ioc_priv_xfer(struct i3c_device *i3c, unsigned int cmd,
+		     struct i3c_ioc_priv_xfer *u_xfers)
+{
+	struct i3c_ioc_priv_xfer *k_xfers;
+	unsigned int nxfers;
+	int ret;
+
+	k_xfers = i3cdev_get_ioc_priv_xfer(cmd, u_xfers, &nxfers);
+	if (IS_ERR(k_xfers))
+		return PTR_ERR(k_xfers);
+
+	ret = i3cdev_do_priv_xfer(i3c, k_xfers, nxfers);
+
+	kfree(k_xfers);
+
+	return ret;
+}
+
+static long
+i3cdev_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
+{
+	struct i3cdev_data *i3cdev = file->private_data;
+	struct i3c_device *i3c;
+	int ret = -ENODEV;
+
+	if (_IOC_TYPE(cmd) != I3C_DEV_IOC_MAGIC)
+		return -ENOTTY;
+
+	/* Use the xfer_lock to prevent device detach during ioctl call */
+	mutex_lock(&i3cdev->xfer_lock);
+	i3c = i3cdev->i3c;
+	if (!i3c || i3c->dev.driver)
+		goto err_no_dev;
+
+	dev_dbg(&i3c->dev, "ioctl, cmd=0x%02x, arg=0x%02lx\n", cmd, arg);
+
+	/* Check command number and direction */
+	if (_IOC_NR(cmd) == _IOC_NR(I3C_IOC_PRIV_XFER(0)) &&
+	    _IOC_DIR(cmd) == (_IOC_READ | _IOC_WRITE))
+		ret = i3cdev_ioc_priv_xfer(i3c, cmd,
+					(struct i3c_ioc_priv_xfer __user *)arg);
+	else
+		ret = -ENOTTY;
+
+err_no_dev:
+	mutex_unlock(&i3cdev->xfer_lock);
+	return ret;
+}
+
+static int i3cdev_open(struct inode *inode, struct file *file)
+{
+	struct i3cdev_data *i3cdev = container_of(inode->i_cdev,
+						  struct i3cdev_data,
+						  cdev);
+	file->private_data = i3cdev;
+
+	return 0;
+}
+
+static int i3cdev_release(struct inode *inode, struct file *file)
+{
+	file->private_data = NULL;
+
+	return 0;
+}
+
+static const struct file_operations i3cdev_fops = {
+	.owner		= THIS_MODULE,
+	.read		= i3cdev_read,
+	.write		= i3cdev_write,
+	.unlocked_ioctl	= i3cdev_ioctl,
+	.compat_ioctl	= compat_ptr_ioctl,
+	.open		= i3cdev_open,
+	.release	= i3cdev_release,
+};
+
+/* ------------------------------------------------------------------------- */
+
+static const struct class i3cdev_class = {
+	.name = "i3cdev",
+};
+
+static int i3cdev_attach(struct device *dev, void *dummy)
+{
+	struct i3cdev_data *i3cdev;
+	struct i3c_device *i3c;
+	int res;
+
+	if (dev->type == &i3c_masterdev_type || dev->driver)
+		return 0;
+
+	i3c = dev_to_i3cdev(dev);
+
+	/* Get a device */
+	i3cdev = get_free_i3cdev(i3c);
+	if (IS_ERR(i3cdev))
+		return PTR_ERR(i3cdev);
+
+	mutex_init(&i3cdev->xfer_lock);
+	cdev_init(&i3cdev->cdev, &i3cdev_fops);
+	i3cdev->cdev.owner = THIS_MODULE;
+
+	device_initialize(&i3cdev->dev);
+	i3cdev->dev.devt = MKDEV(MAJOR(i3cdev_number), i3cdev->id);
+	i3cdev->dev.class = &i3cdev_class;
+	i3cdev->dev.parent = &i3c->dev;
+	i3cdev->dev.release = i3cdev_dev_release;
+
+	res = dev_set_name(&i3cdev->dev, "bus!i3c!%s", dev_name(&i3c->dev));
+	if (res)
+		goto error_put_dev;
+
+	res = cdev_device_add(&i3cdev->cdev, &i3cdev->dev);
+	if (res)
+		goto error_put_dev;
+
+	pr_debug("i3cdev: I3C device [%s] registered as minor %d\n",
+		 dev_name(&i3c->dev), i3cdev->id);
+	return 0;
+
+error_put_dev:
+	i3cdev_set_drvdata(i3c, NULL);
+	put_device(&i3cdev->dev);
+	return res;
+}
+
+static int i3cdev_detach(struct device *dev, void *dummy)
+{
+	struct i3cdev_data *i3cdev;
+	struct i3c_device *i3c;
+
+	if (dev->type == &i3c_masterdev_type)
+		return 0;
+
+	i3c = dev_to_i3cdev(dev);
+
+	i3cdev = i3cdev_get_drvdata(i3c);
+	if (!i3cdev)
+		return 0;
+
+	i3cdev_set_drvdata(i3c, NULL);
+
+	/* Prevent transfers while cdev removal */
+	mutex_lock(&i3cdev->xfer_lock);
+	i3cdev->i3c = NULL;
+	mutex_unlock(&i3cdev->xfer_lock);
+
+	cdev_device_del(&i3cdev->cdev, &i3cdev->dev);
+	put_device(&i3cdev->dev);
+
+	pr_debug("i3cdev: device [%s] unregistered\n", dev_name(&i3c->dev));
+
+	return 0;
+}
+
+static int i3cdev_notifier_call(struct notifier_block *nb,
+				unsigned long action,
+				void *data)
+{
+	struct device *dev = data;
+
+	switch (action) {
+	case BUS_NOTIFY_ADD_DEVICE:
+	case BUS_NOTIFY_UNBOUND_DRIVER:
+		return i3cdev_attach(dev, NULL);
+	case BUS_NOTIFY_DEL_DEVICE:
+	case BUS_NOTIFY_REMOVED_DEVICE:
+	case BUS_NOTIFY_BIND_DRIVER:
+		return i3cdev_detach(dev, NULL);
+	}
+
+	return 0;
+}
+
+static struct notifier_block i3cdev_notifier = {
+	.notifier_call = i3cdev_notifier_call,
+};
+
+static int __init i3cdev_init(void)
+{
+	int res;
+
+	/* Dynamically request unused major number */
+	res = alloc_chrdev_region(&i3cdev_number, 0, I3C_MINORS, "i3c");
+	if (res)
+		goto out;
+
+	/* Register device class to populate sysfs entries */
+	res = class_register(&i3cdev_class);
+	if (res)
+		goto out_unreg_chrdev;
+
+	/* Keep track of busses which have devices to add or remove later */
+	res = bus_register_notifier(&i3c_bus_type, &i3cdev_notifier);
+	if (res)
+		goto out_unreg_class;
+
+	/* Bind to already existing device without driver right away */
+	i3c_for_each_dev(NULL, i3cdev_attach);
+
+	return 0;
+
+out_unreg_class:
+	class_unregister(&i3cdev_class);
+out_unreg_chrdev:
+	unregister_chrdev_region(i3cdev_number, I3C_MINORS);
+out:
+	pr_err("%s: Driver Initialisation failed\n", __FILE__);
+	return res;
+}
+
+static void __exit i3cdev_exit(void)
+{
+	bus_unregister_notifier(&i3c_bus_type, &i3cdev_notifier);
+	i3c_for_each_dev(NULL, i3cdev_detach);
+	class_unregister(&i3cdev_class);
+	unregister_chrdev_region(i3cdev_number, I3C_MINORS);
+}
+
+MODULE_AUTHOR("Vitor Soares <soares@synopsys.com>");
+MODULE_DESCRIPTION("I3C /dev entries driver");
+MODULE_LICENSE("GPL");
+
+module_init(i3cdev_init);
+module_exit(i3cdev_exit);
diff --git a/include/uapi/linux/i3c/i3cdev.h b/include/uapi/linux/i3c/i3cdev.h
new file mode 100644
index 000000000000..5adc1e3e7c4f
--- /dev/null
+++ b/include/uapi/linux/i3c/i3cdev.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * Copyright (c) 2020 Synopsys, Inc. and/or its affiliates.
+ *
+ * Author: Vitor Soares <vitor.soares@synopsys.com>
+ */
+
+#ifndef _UAPI_I3C_DEV_H_
+#define _UAPI_I3C_DEV_H_
+
+#include <linux/types.h>
+#include <linux/ioctl.h>
+
+/* IOCTL commands */
+#define I3C_DEV_IOC_MAGIC	0x07
+
+/**
+ * struct i3c_ioc_priv_xfer - I3C SDR ioctl private transfer
+ * @data: Holds pointer to userspace buffer with transmit data.
+ * @len: Length of data buffer buffers, in bytes.
+ * @rnw: encodes the transfer direction. true for a read, false for a write
+ */
+struct i3c_ioc_priv_xfer {
+	__u64 data;
+	__u16 len;
+	__u8 rnw;
+	__u8 pad[5];
+};
+
+#define I3C_PRIV_XFER_SIZE(N)	\
+	((((sizeof(struct i3c_ioc_priv_xfer)) * (N)) < (1 << _IOC_SIZEBITS)) \
+	? ((sizeof(struct i3c_ioc_priv_xfer)) * (N)) : 0)
+
+#define I3C_IOC_PRIV_XFER(N)	\
+	_IOC(_IOC_READ|_IOC_WRITE, I3C_DEV_IOC_MAGIC, 30, I3C_PRIV_XFER_SIZE(N))
+
+#endif
-- 
2.55.0.979.g7e5102b832-goog


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
