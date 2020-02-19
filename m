Return-Path: <SRS0=8b81=4H=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AD3CC34022
	for <linux-i3c@archiver.kernel.org>; Wed, 19 Feb 2020 08:42:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36E4424658
	for <linux-i3c@archiver.kernel.org>; Wed, 19 Feb 2020 08:42:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EfDR1qrf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="FALzDx6u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36E4424658
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SgGnV59qm4zfugUaVEV1lYyu2P0B8kODu2NNHUab1XI=; b=EfDR1qrfVWniJS
	QZ1iQL2t4EK/TF/eQy2MkmRu/TSIq/8Wv/jEDSt14+u916eFfZXcVM4NQx0Z6WA55u+l8MAAr1zYf
	ClIIWBW103WG7E/27iZ3PjAUcgSdDrr4Y91Mcv66wrBf4T24IP0MQc+Tx9L72RnrPrZfI07Qgo1eS
	l6qCwGsNRzcOT1f+2m1uwa9f293Eu3AzJw2ooQ+PDFFsyDRejsEQntRjr6lzqhOvv/mt4XkI8lvpE
	GPqJleC9JBrSkkRkR5jVQ6rGqkWfzLIkIF16u6n+hMbjJzfezlNCBjt6WiCVQ5FaCL4yMwuX7PXYF
	78+2ujJEyBU7IfCYj5CA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4KwU-0000uO-Db; Wed, 19 Feb 2020 08:42:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4KwO-0000se-3A
 for linux-i3c@lists.infradead.org; Wed, 19 Feb 2020 08:42:48 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 962C8208E4;
 Wed, 19 Feb 2020 08:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582101762;
 bh=e6tNZV1/FpHd+hNRbBxi3D3UPac4QwtGNmcrf8soYT0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FALzDx6uGG1r6+p2NMtFTxz7kb3CAI53SlzvdFnBlqmiNwTayUPCtP5v8cXnliLOJ
 zX2jXw0+KSo4+2Rg6ZNHUEFfTshNxQq7XwNMyejyvl3Pz2+HSgJU+yMQ04sz7LckME
 WTtsEZTSmaySZLegaPTmOmP0+dFmnWQC3s9gekdU=
Date: Wed, 19 Feb 2020 09:42:39 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: [PATCH v3 4/5] i3c: add i3cdev module to expose i3c dev in /dev
Message-ID: <20200219084239.GA2737861@kroah.com>
References: <cover.1582069402.git.vitor.soares@synopsys.com>
 <e093ae9da81e7702c188a20d1e8b9d7f8024bfeb.1582069402.git.vitor.soares@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e093ae9da81e7702c188a20d1e8b9d7f8024bfeb.1582069402.git.vitor.soares@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200219_004244_179367_360298BE 
X-CRM114-Status: GOOD (  33.08  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: Jose.Abreu@synopsys.com, corbet@lwn.net, Joao.Pinto@synopsys.com,
 arnd@arndb.de, wsa@the-dreams.de, bbrezillon@kernel.org,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 linux-i3c@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Wed, Feb 19, 2020 at 01:20:42AM +0100, Vitor Soares wrote:
> This patch adds user mode support to I3C SDR transfers.
> 
> The module is based on i2c-dev.c with the follow features:
>   - expose on /dev the i3c devices dynamically based on if they have
>     a device driver bound.
>   - Dynamically allocate the char device Major number.
> 
> Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
> ---
> Changes in v3:
>   Use the xfer_lock to prevent device detach during ioctl call
>   Expose i3cdev under /dev/bus/i3c/ folder like usb does
>   Change NOTIFY_BOUND to NOTIFY_BIND, this allows the device detach occur
>   before driver->probe
>   Avoid use of IS_ERR_OR_NULL
>   Use u64_to_user_ptr instead of (void __user *)(uintptr_t) cast
>   Allocate k_xfer and data_ptrs at once to eliminate duble allocation check
>   Pass i3cdev to dev->driver_data
>   Make all minors available
> 
> Changes in v2:
>   Use IDR api for minor numbering
>   Modify ioctl struct
>   Fix SPDX license
> 
>  drivers/i3c/Kconfig             |  15 ++
>  drivers/i3c/Makefile            |   1 +
>  drivers/i3c/i3cdev.c            | 429 ++++++++++++++++++++++++++++++++++++++++
>  include/uapi/linux/i3c/i3cdev.h |  38 ++++
>  4 files changed, 483 insertions(+)
>  create mode 100644 drivers/i3c/i3cdev.c
>  create mode 100644 include/uapi/linux/i3c/i3cdev.h
> 
> diff --git a/drivers/i3c/Kconfig b/drivers/i3c/Kconfig
> index 30a4415..0164276 100644
> --- a/drivers/i3c/Kconfig
> +++ b/drivers/i3c/Kconfig
> @@ -20,5 +20,20 @@ menuconfig I3C
>  	  will be called i3c.
>  
>  if I3C
> +
> +config I3CDEV
> +	tristate "I3C device interface"
> +	depends on I3C
> +	help
> +	  Say Y here to use i3c-* device files, usually found in the /dev
> +	  directory on your system.  They make it possible to have user-space
> +	  programs use the I3C devices.
> +
> +	  This support is also available as a module.  If so, the module
> +	  will be called i3cdev.
> +
> +	  Note that this application programming interface is EXPERIMENTAL
> +	  and hence SUBJECT TO CHANGE WITHOUT NOTICE while it stabilizes.
> +
>  source "drivers/i3c/master/Kconfig"
>  endif # I3C
> diff --git a/drivers/i3c/Makefile b/drivers/i3c/Makefile
> index 11982ef..606d422 100644
> --- a/drivers/i3c/Makefile
> +++ b/drivers/i3c/Makefile
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
>  i3c-y				:= device.o master.o
>  obj-$(CONFIG_I3C)		+= i3c.o
> +obj-$(CONFIG_I3CDEV)		+= i3cdev.o
>  obj-$(CONFIG_I3C)		+= master/
> diff --git a/drivers/i3c/i3cdev.c b/drivers/i3c/i3cdev.c
> new file mode 100644
> index 0000000..1a6bd35
> --- /dev/null
> +++ b/drivers/i3c/i3cdev.c
> @@ -0,0 +1,429 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2020 Synopsys, Inc. and/or its affiliates.
> + *
> + * Author: Vitor Soares <soares@synopsys.com>
> + */
> +
> +#include <linux/cdev.h>
> +#include <linux/compat.h>
> +#include <linux/device.h>
> +#include <linux/fs.h>
> +#include <linux/init.h>
> +#include <linux/jiffies.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/notifier.h>
> +#include <linux/slab.h>
> +#include <linux/uaccess.h>
> +
> +#include <linux/i3c/i3cdev.h>
> +
> +#include "internals.h"
> +
> +struct i3cdev_data {
> +	struct i3c_device *i3c;
> +	struct device *dev;
> +	struct mutex xfer_lock; /* prevent detach while transferring */
> +	struct cdev cdev;
> +	int id;
> +};
> +
> +static DEFINE_IDA(i3cdev_ida);
> +static dev_t i3cdev_number;
> +#define I3C_MINORS (MINORMASK + 1)
> +
> +static struct i3cdev_data *get_free_i3cdev(struct i3c_device *i3c)
> +{
> +	struct i3cdev_data *i3cdev;
> +	int id;
> +
> +	id = ida_simple_get(&i3cdev_ida, 0, I3C_MINORS, GFP_KERNEL);
> +	if (id < 0) {
> +		pr_err("i3cdev: no minor number available!\n");
> +		return ERR_PTR(id);
> +	}
> +
> +	i3cdev = kzalloc(sizeof(*i3cdev), GFP_KERNEL);
> +	if (!i3cdev) {
> +		ida_simple_remove(&i3cdev_ida, id);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	i3cdev->i3c = i3c;
> +	i3cdev->id = id;
> +	i3cdev_set_drvdata(i3c, i3cdev);
> +
> +	return i3cdev;
> +}
> +
> +static void put_i3cdev(struct i3cdev_data *i3cdev)
> +{
> +	i3cdev_set_drvdata(i3cdev->i3c, NULL);
> +	kfree(i3cdev);
> +}
> +
> +static ssize_t
> +i3cdev_read(struct file *file, char __user *buf, size_t count, loff_t *f_pos)
> +{
> +	struct i3cdev_data *i3cdev = file->private_data;
> +	struct i3c_device *i3c = i3cdev->i3c;
> +	struct i3c_priv_xfer xfers = {
> +		.rnw = true,
> +		.len = count,
> +	};
> +	int ret = -EACCES;
> +	char *tmp;
> +
> +	mutex_lock(&i3cdev->xfer_lock);
> +	if (i3c->dev.driver)
> +		goto err_out;
> +
> +	tmp = kzalloc(count, GFP_KERNEL);
> +	if (!tmp)
> +		return -ENOMEM;
> +
> +	xfers.data.in = tmp;
> +
> +	dev_dbg(&i3c->dev, "Reading %zu bytes.\n", count);
> +
> +	ret = i3c_device_do_priv_xfers(i3c, &xfers, 1);
> +	if (!ret)
> +		ret = copy_to_user(buf, tmp, xfers.len) ? -EFAULT : xfers.len;
> +
> +	kfree(tmp);
> +
> +err_out:
> +	mutex_unlock(&i3cdev->xfer_lock);
> +	return ret;
> +}
> +
> +static ssize_t
> +i3cdev_write(struct file *file, const char __user *buf, size_t count,
> +	     loff_t *f_pos)
> +{
> +	struct i3cdev_data *i3cdev = file->private_data;
> +	struct i3c_device *i3c = i3cdev->i3c;
> +	struct i3c_priv_xfer xfers = {
> +		.rnw = false,
> +		.len = count,

No error checking of count?

> +	};

You can have this structure on the stack?

> +	int ret = -EACCES;
> +	char *tmp;
> +
> +	mutex_lock(&i3cdev->xfer_lock);
> +	if (i3c->dev.driver)
> +		goto err_out;
> +
> +	tmp = memdup_user(buf, count);

So userspace can allocate any amount of memory they want to?

Not good :(

> +	if (IS_ERR(tmp))
> +		return PTR_ERR(tmp);
> +
> +	xfers.data.out = tmp;
> +
> +	dev_dbg(&i3c->dev, "Writing %zu bytes.\n", count);
> +
> +	ret = i3c_device_do_priv_xfers(i3c, &xfers, 1);
> +	kfree(tmp);
> +
> +err_out:
> +	mutex_unlock(&i3cdev->xfer_lock);
> +	return (!ret) ? count : ret;
> +}
> +
> +static int
> +i3cdev_do_priv_xfer(struct i3c_device *dev, struct i3c_ioc_priv_xfer *xfers,
> +		    unsigned int nxfers)
> +{
> +	struct i3c_priv_xfer *k_xfers;
> +	u8 **data_ptrs;
> +	int i, ret = 0;
> +
> +	/* Since we have nxfers we may allocate k_xfer + *data_ptrs together */
> +	k_xfers = kcalloc(nxfers, sizeof(*k_xfers) + sizeof(*data_ptrs),
> +			  GFP_KERNEL);
> +	if (!k_xfers)
> +		return -ENOMEM;
> +
> +	/* set data_ptrs to be after nxfers * i3c_priv_xfer */
> +	data_ptrs = (void *)k_xfers + (nxfers * sizeof(*k_xfers));
> +
> +	for (i = 0; i < nxfers; i++) {
> +		data_ptrs[i] = memdup_user((const u8 __user *)
> +					   (uintptr_t)xfers[i].data,
> +					   xfers[i].len);
> +		if (IS_ERR(data_ptrs[i])) {
> +			ret = PTR_ERR(data_ptrs[i]);
> +			break;
> +		}
> +
> +		k_xfers[i].len = xfers[i].len;
> +		if (xfers[i].rnw) {
> +			k_xfers[i].rnw = true;
> +			k_xfers[i].data.in = data_ptrs[i];
> +		} else {
> +			k_xfers[i].rnw = false;
> +			k_xfers[i].data.out = data_ptrs[i];
> +		}
> +	}
> +
> +	if (ret < 0) {
> +		i--;
> +		goto err_free_mem;
> +	}
> +
> +	ret = i3c_device_do_priv_xfers(dev, k_xfers, nxfers);
> +	if (ret)
> +		goto err_free_mem;
> +
> +	for (i = 0; i < nxfers; i++) {
> +		if (xfers[i].rnw) {
> +			if (copy_to_user(u64_to_user_ptr(xfers[i].data),
> +					 data_ptrs[i], xfers[i].len))
> +				ret = -EFAULT;

You should bail out of the loop here.

> +		}
> +	}
> +
> +err_free_mem:
> +	for (; i >= 0; i--)
> +		kfree(data_ptrs[i]);
> +	kfree(k_xfers);
> +	return ret;
> +}
> +
> +static struct i3c_ioc_priv_xfer *
> +i3cdev_get_ioc_priv_xfer(unsigned int cmd, struct i3c_ioc_priv_xfer *u_xfers,
> +			 unsigned int *nxfers)
> +{
> +	u32 tmp = _IOC_SIZE(cmd);
> +
> +	if ((tmp % sizeof(struct i3c_ioc_priv_xfer)) != 0)
> +		return ERR_PTR(-EINVAL);
> +
> +	*nxfers = tmp / sizeof(struct i3c_ioc_priv_xfer);
> +	if (*nxfers == 0)
> +		return ERR_PTR(-EINVAL);

But no error checking for too many of these?

> +
> +	return memdup_user(u_xfers, tmp);
> +}
> +
> +static int
> +i3cdev_ioc_priv_xfer(struct i3c_device *i3c, unsigned int cmd,
> +		     struct i3c_ioc_priv_xfer *u_xfers)

You lost your __user marking of this pointer :(

Please fix that up, have you run sparse on this?

> +{
> +	struct i3c_ioc_priv_xfer *k_xfers;
> +	unsigned int nxfers;
> +	int ret;
> +
> +	k_xfers = i3cdev_get_ioc_priv_xfer(cmd, u_xfers, &nxfers);
> +	if (IS_ERR(k_xfers))
> +		return PTR_ERR(k_xfers);
> +
> +	ret = i3cdev_do_priv_xfer(i3c, k_xfers, nxfers);
> +
> +	kfree(k_xfers);
> +
> +	return ret;
> +}
> +
> +static long
> +i3cdev_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> +{
> +	struct i3cdev_data *i3cdev = file->private_data;
> +	struct i3c_device *i3c = i3cdev->i3c;
> +	int ret = -EACCES;
> +
> +	dev_dbg(&i3c->dev, "ioctl, cmd=0x%02x, arg=0x%02lx\n", cmd, arg);
> +
> +	if (_IOC_TYPE(cmd) != I3C_DEV_IOC_MAGIC)
> +		return -ENOTTY;
> +
> +	/* Use the xfer_lock to prevent device detach during ioctl call */
> +	mutex_lock(&i3cdev->xfer_lock);
> +	if (i3c->dev.driver)
> +		goto err_no_dev;
> +
> +	/* Check command number and direction */
> +	if (_IOC_NR(cmd) == _IOC_NR(I3C_IOC_PRIV_XFER(0)) &&
> +	    _IOC_DIR(cmd) == (_IOC_READ | _IOC_WRITE))

Shouldn't the ioctl core already handle this for you?

> +		ret = i3cdev_ioc_priv_xfer(i3c, cmd,
> +					(struct i3c_ioc_priv_xfer __user *)arg);
> +
> +err_no_dev:
> +	mutex_unlock(&i3cdev->xfer_lock);
> +	return ret;
> +}
> +
> +static int i3cdev_open(struct inode *inode, struct file *file)
> +{
> +	struct i3cdev_data *i3cdev = container_of(inode->i_cdev,
> +						  struct i3cdev_data,
> +						  cdev);
> +	file->private_data = i3cdev;
> +
> +	return 0;
> +}
> +
> +static int i3cdev_release(struct inode *inode, struct file *file)
> +{
> +	file->private_data = NULL;

Why does this matter?

> +
> +	return 0;
> +}
> +
> +static const struct file_operations i3cdev_fops = {
> +	.owner		= THIS_MODULE,
> +	.read		= i3cdev_read,
> +	.write		= i3cdev_write,
> +	.unlocked_ioctl	= i3cdev_ioctl,
> +	.compat_ioctl	= compat_ptr_ioctl,
> +	.open		= i3cdev_open,
> +	.release	= i3cdev_release,
> +};
> +
> +/* ------------------------------------------------------------------------- */
> +
> +static struct class *i3cdev_class;
> +
> +static int i3cdev_attach(struct device *dev, void *dummy)
> +{
> +	struct i3cdev_data *i3cdev;
> +	struct i3c_device *i3c;
> +	int res;
> +
> +	if (dev->type == &i3c_masterdev_type || dev->driver)
> +		return 0;
> +
> +	i3c = dev_to_i3cdev(dev);
> +
> +	/* Get a device */
> +	i3cdev = get_free_i3cdev(i3c);
> +	if (IS_ERR(i3cdev))
> +		return PTR_ERR(i3cdev);
> +
> +	mutex_init(&i3cdev->xfer_lock);
> +	cdev_init(&i3cdev->cdev, &i3cdev_fops);
> +	i3cdev->cdev.owner = THIS_MODULE;
> +	res = cdev_add(&i3cdev->cdev,
> +		       MKDEV(MAJOR(i3cdev_number), i3cdev->id), 1);
> +	if (res)
> +		goto error_cdev;
> +
> +	/* register this i3c device with the driver core */
> +	i3cdev->dev = device_create(i3cdev_class, &i3c->dev,
> +				    MKDEV(MAJOR(i3cdev_number), i3cdev->id),
> +				    NULL, "bus!i3c!%s", dev_name(&i3c->dev));
> +	if (IS_ERR(i3cdev->dev)) {
> +		res = PTR_ERR(i3cdev->dev);
> +		goto error;
> +	}
> +	pr_debug("i3cdev: I3C device [%s] registered as minor %d\n",
> +		 dev_name(&i3c->dev), i3cdev->id);

dev_dbg()?

> +	return 0;
> +
> +error:
> +	cdev_del(&i3cdev->cdev);
> +error_cdev:
> +	put_i3cdev(i3cdev);
> +	return res;
> +}
> +
> +static int i3cdev_detach(struct device *dev, void *dummy)
> +{
> +	struct i3cdev_data *i3cdev;
> +	struct i3c_device *i3c;
> +
> +	if (dev->type == &i3c_masterdev_type)
> +		return 0;
> +
> +	i3c = dev_to_i3cdev(dev);
> +
> +	i3cdev = i3cdev_get_drvdata(i3c);
> +	if (!i3cdev)
> +		return 0;
> +
> +	/* Prevent transfers while cdev removal */
> +	mutex_lock(&i3cdev->xfer_lock);
> +	cdev_del(&i3cdev->cdev);
> +	device_destroy(i3cdev_class, MKDEV(MAJOR(i3cdev_number), i3cdev->id));
> +	mutex_unlock(&i3cdev->xfer_lock);
> +
> +	ida_simple_remove(&i3cdev_ida, i3cdev->id);
> +	put_i3cdev(i3cdev);
> +
> +	pr_debug("i3cdev: device [%s] unregistered\n", dev_name(&i3c->dev));

dev_dbg()?

> +
> +	return 0;
> +}
> +
> +static int i3cdev_notifier_call(struct notifier_block *nb,
> +				unsigned long action,
> +				void *data)
> +{
> +	struct device *dev = data;
> +
> +	switch (action) {
> +	case BUS_NOTIFY_ADD_DEVICE:
> +	case BUS_NOTIFY_UNBOUND_DRIVER:
> +		return i3cdev_attach(dev, NULL);
> +	case BUS_NOTIFY_DEL_DEVICE:
> +	case BUS_NOTIFY_BIND_DRIVER:
> +		return i3cdev_detach(dev, NULL);
> +	}
> +
> +	return 0;
> +}
> +
> +static struct notifier_block i3cdev_notifier = {
> +	.notifier_call = i3cdev_notifier_call,
> +};
> +
> +static int __init i3cdev_init(void)
> +{
> +	int res;
> +
> +	/* Dynamically request unused major number */
> +	res = alloc_chrdev_region(&i3cdev_number, 0, I3C_MINORS, "i3c");
> +	if (res)
> +		goto out;
> +
> +	/* Create a classe to populate sysfs entries*/
> +	i3cdev_class = class_create(THIS_MODULE, "i3cdev");
> +	if (IS_ERR(i3cdev_class)) {
> +		res = PTR_ERR(i3cdev_class);
> +		goto out_unreg_chrdev;
> +	}
> +
> +	/* Keep track of busses which have devices to add or remove later */
> +	res = bus_register_notifier(&i3c_bus_type, &i3cdev_notifier);
> +	if (res)
> +		goto out_unreg_class;
> +
> +	/* Bind to already existing device without driver right away */
> +	i3c_for_each_dev(NULL, i3cdev_attach);
> +
> +	return 0;
> +
> +out_unreg_class:
> +	class_destroy(i3cdev_class);
> +out_unreg_chrdev:
> +	unregister_chrdev_region(i3cdev_number, I3C_MINORS);
> +out:
> +	pr_err("%s: Driver Initialisation failed\n", __FILE__);

spelling?

> +	return res;
> +}
> +
> +static void __exit i3cdev_exit(void)
> +{
> +	bus_unregister_notifier(&i3c_bus_type, &i3cdev_notifier);
> +	i3c_for_each_dev(NULL, i3cdev_detach);
> +	class_destroy(i3cdev_class);
> +	unregister_chrdev_region(i3cdev_number, I3C_MINORS);
> +}
> +
> +MODULE_AUTHOR("Vitor Soares <soares@synopsys.com>");
> +MODULE_DESCRIPTION("I3C /dev entries driver");
> +MODULE_LICENSE("GPL");
> +
> +module_init(i3cdev_init);
> +module_exit(i3cdev_exit);
> diff --git a/include/uapi/linux/i3c/i3cdev.h b/include/uapi/linux/i3c/i3cdev.h
> new file mode 100644
> index 0000000..656a686
> --- /dev/null
> +++ b/include/uapi/linux/i3c/i3cdev.h
> @@ -0,0 +1,37 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +/*
> + * Copyright (c) 2020 Synopsys, Inc. and/or its affiliates.
> + *
> + * Author: Vitor Soares <vitor.soares@synopsys.com>
> + */
> +
> +#ifndef _UAPI_I3C_DEV_H_
> +#define _UAPI_I3C_DEV_H_
> +
> +#include <linux/types.h>
> +#include <linux/ioctl.h>
> +
> +/* IOCTL commands */
> +#define I3C_DEV_IOC_MAGIC	0x07
> +
> +/**
> + * struct i3c_ioc_priv_xfer - I3C SDR ioctl private transfer
> + * @data: Holds pointer to userspace buffer with transmit data.
> + * @len: Length of data buffer buffers, in bytes.
> + * @rnw: encodes the transfer direction. true for a read, false for a write
> + */
> +struct i3c_ioc_priv_xfer {
> +	__u64 data;
> +	__u16 len;
> +	__u8 rnw;

Shouldn't this be an enum type?  "true" is not a __u8 value :)

> +	__u8 pad[5];
> +};
> +
> +#define I3C_PRIV_XFER_SIZE(N)	\
> +	((((sizeof(struct i3c_ioc_priv_xfer)) * (N)) < (1 << _IOC_SIZEBITS)) \
> +	? ((sizeof(struct i3c_ioc_priv_xfer)) * (N)) : 0)
> +
> +#define I3C_IOC_PRIV_XFER(N)	\
> +	_IOC(_IOC_READ|_IOC_WRITE, I3C_DEV_IOC_MAGIC, 30, I3C_PRIV_XFER_SIZE(N))

_IOCWR()?

thanks,

greg k-h

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
