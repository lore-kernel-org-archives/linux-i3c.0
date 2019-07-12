Return-Path: <SRS0=UjAo=VJ=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46205C742CA
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Jul 2019 15:59:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FE3A206B8
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Jul 2019 15:59:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TwVMXGHP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FE3A206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aAs7pvMNnzG/gkwCeiumNzNTLPWjysxGJ4xBhiQmex4=; b=TwVMXGHPdWUF3q
	c0ONxzHgexLNIkUgjuFQMYc+pYdc3w2YOKI/uQ5tsba2qBhL15GP9pYd//fFQL3Qc7OETwawy3UOW
	NuhMAeqAZFbAcr1+4LXzhrK1MfmiCFv887rGiN3XNNYU2GruBpU9QTNrc8xC407QQnaMPa3FaN+5g
	GS3OJ2ct8WuE1EmnAAsY4FmjC0/j707onrQfejZOa6tu4eUefCpiqjf68lXH+qwWot4fD4GCaZ5ry
	06ZMfj1BWyWJ5qY8HFWPksFoWblNQen2KGInpOJNUFNLpYgKgFyLNIELLk3XAnFTNgzWlNvJ73hzg
	vwt/E/hm1xh8c8nas5Xw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hlxxG-0007st-Pj; Fri, 12 Jul 2019 15:59:26 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hlxxB-0007qm-Bt
 for linux-i3c@lists.infradead.org; Fri, 12 Jul 2019 15:59:25 +0000
Received: from linux.home (2a01cb0c80061e007f541addd69f0d47.ipv6.abo.wanadoo.fr
 [IPv6:2a01:cb0c:8006:1e00:7f54:1add:d69f:d47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 30D5228BBDA;
 Fri, 12 Jul 2019 16:59:19 +0100 (BST)
Date: Fri, 12 Jul 2019 17:59:15 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: [PATCH v4 1/3] regmap: add i3c bus support
Message-ID: <20190712175915.4c4260a9@linux.home>
In-Reply-To: <7deb1300474b68ebb6fc3ecb02577e4f657250a5.1562931742.git.vitor.soares@synopsys.com>
References: <cover.1562931742.git.vitor.soares@synopsys.com>
 <7deb1300474b68ebb6fc3ecb02577e4f657250a5.1562931742.git.vitor.soares@synopsys.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190712_085921_662728_7B0922A0 
X-CRM114-Status: GOOD (  22.75  )
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
Cc: Joao.Pinto@synopsys.com, rafael@kernel.org, linux-iio@vger.kernel.org,
 gregkh@linuxfoundation.org, bbrezillon@kernel.org,
 linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
 lorenzo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Fri, 12 Jul 2019 13:53:28 +0200
Vitor Soares <Vitor.Soares@synopsys.com> wrote:

> Add basic support for i3c bus.
> This is a simple implementation that only give support
> for SDR Read and Write commands.
> 

This patch has been applied by Mark already. Please make sure to drop
already applied patches when submitting a new version.

> Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
> ---
>  drivers/base/regmap/Kconfig      |  6 +++-
>  drivers/base/regmap/Makefile     |  1 +
>  drivers/base/regmap/regmap-i3c.c | 60 ++++++++++++++++++++++++++++++++++++++++
>  include/linux/regmap.h           | 20 ++++++++++++++
>  4 files changed, 86 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/base/regmap/regmap-i3c.c
> 
> diff --git a/drivers/base/regmap/Kconfig b/drivers/base/regmap/Kconfig
> index 6ad5ef4..c8bbf53 100644
> --- a/drivers/base/regmap/Kconfig
> +++ b/drivers/base/regmap/Kconfig
> @@ -4,7 +4,7 @@
>  # subsystems should select the appropriate symbols.
>  
>  config REGMAP
> -	default y if (REGMAP_I2C || REGMAP_SPI || REGMAP_SPMI || REGMAP_W1 || REGMAP_AC97 || REGMAP_MMIO || REGMAP_IRQ)
> +	default y if (REGMAP_I2C || REGMAP_SPI || REGMAP_SPMI || REGMAP_W1 || REGMAP_AC97 || REGMAP_MMIO || REGMAP_IRQ || REGMAP_I3C)
>  	select IRQ_DOMAIN if REGMAP_IRQ
>  	bool
>  
> @@ -49,3 +49,7 @@ config REGMAP_SOUNDWIRE
>  config REGMAP_SCCB
>  	tristate
>  	depends on I2C
> +
> +config REGMAP_I3C
> +	tristate
> +	depends on I3C
> diff --git a/drivers/base/regmap/Makefile b/drivers/base/regmap/Makefile
> index f5b4e88..ff6c7d8 100644
> --- a/drivers/base/regmap/Makefile
> +++ b/drivers/base/regmap/Makefile
> @@ -16,3 +16,4 @@ obj-$(CONFIG_REGMAP_IRQ) += regmap-irq.o
>  obj-$(CONFIG_REGMAP_W1) += regmap-w1.o
>  obj-$(CONFIG_REGMAP_SOUNDWIRE) += regmap-sdw.o
>  obj-$(CONFIG_REGMAP_SCCB) += regmap-sccb.o
> +obj-$(CONFIG_REGMAP_I3C) += regmap-i3c.o
> diff --git a/drivers/base/regmap/regmap-i3c.c b/drivers/base/regmap/regmap-i3c.c
> new file mode 100644
> index 0000000..1578fb5
> --- /dev/null
> +++ b/drivers/base/regmap/regmap-i3c.c
> @@ -0,0 +1,60 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2018 Synopsys, Inc. and/or its affiliates.
> +
> +#include <linux/regmap.h>
> +#include <linux/i3c/device.h>
> +#include <linux/i3c/master.h>
> +#include <linux/module.h>
> +
> +static int regmap_i3c_write(void *context, const void *data, size_t count)
> +{
> +	struct device *dev = context;
> +	struct i3c_device *i3c = dev_to_i3cdev(dev);
> +	struct i3c_priv_xfer xfers[] = {
> +		{
> +			.rnw = false,
> +			.len = count,
> +			.data.out = data,
> +		},
> +	};
> +
> +	return i3c_device_do_priv_xfers(i3c, xfers, 1);
> +}
> +
> +static int regmap_i3c_read(void *context,
> +			   const void *reg, size_t reg_size,
> +			   void *val, size_t val_size)
> +{
> +	struct device *dev = context;
> +	struct i3c_device *i3c = dev_to_i3cdev(dev);
> +	struct i3c_priv_xfer xfers[2];
> +
> +	xfers[0].rnw = false;
> +	xfers[0].len = reg_size;
> +	xfers[0].data.out = reg;
> +
> +	xfers[1].rnw = true;
> +	xfers[1].len = val_size;
> +	xfers[1].data.in = val;
> +
> +	return i3c_device_do_priv_xfers(i3c, xfers, 2);
> +}
> +
> +static struct regmap_bus regmap_i3c = {
> +	.write = regmap_i3c_write,
> +	.read = regmap_i3c_read,
> +};
> +
> +struct regmap *__devm_regmap_init_i3c(struct i3c_device *i3c,
> +				      const struct regmap_config *config,
> +				      struct lock_class_key *lock_key,
> +				      const char *lock_name)
> +{
> +	return __devm_regmap_init(&i3c->dev, &regmap_i3c, &i3c->dev, config,
> +				  lock_key, lock_name);
> +}
> +EXPORT_SYMBOL_GPL(__devm_regmap_init_i3c);
> +
> +MODULE_AUTHOR("Vitor Soares <vitor.soares@synopsys.com>");
> +MODULE_DESCRIPTION("Regmap I3C Module");
> +MODULE_LICENSE("GPL v2");
> diff --git a/include/linux/regmap.h b/include/linux/regmap.h
> index daeec7d..f65984d 100644
> --- a/include/linux/regmap.h
> +++ b/include/linux/regmap.h
> @@ -25,6 +25,7 @@ struct module;
>  struct clk;
>  struct device;
>  struct i2c_client;
> +struct i3c_device;
>  struct irq_domain;
>  struct slim_device;
>  struct spi_device;
> @@ -624,6 +625,10 @@ struct regmap *__devm_regmap_init_slimbus(struct slim_device *slimbus,
>  				 const struct regmap_config *config,
>  				 struct lock_class_key *lock_key,
>  				 const char *lock_name);
> +struct regmap *__devm_regmap_init_i3c(struct i3c_device *i3c,
> +				 const struct regmap_config *config,
> +				 struct lock_class_key *lock_key,
> +				 const char *lock_name);
>  /*
>   * Wrapper for regmap_init macros to include a unique lockdep key and name
>   * for each call. No-op if CONFIG_LOCKDEP is not set.
> @@ -982,6 +987,21 @@ bool regmap_ac97_default_volatile(struct device *dev, unsigned int reg);
>  #define devm_regmap_init_slimbus(slimbus, config)			\
>  	__regmap_lockdep_wrapper(__devm_regmap_init_slimbus, #config,	\
>  				slimbus, config)
> +
> +/**
> + * devm_regmap_init_i3c() - Initialise managed register map
> + *
> + * @i3c: Device that will be interacted with
> + * @config: Configuration for register map
> + *
> + * The return value will be an ERR_PTR() on error or a valid pointer
> + * to a struct regmap.  The regmap will be automatically freed by the
> + * device management code.
> + */
> +#define devm_regmap_init_i3c(i3c, config)				\
> +	__regmap_lockdep_wrapper(__devm_regmap_init_i3c, #config,	\
> +				i3c, config)
> +
>  int regmap_mmio_attach_clk(struct regmap *map, struct clk *clk);
>  void regmap_mmio_detach_clk(struct regmap *map);
>  void regmap_exit(struct regmap *map);


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
