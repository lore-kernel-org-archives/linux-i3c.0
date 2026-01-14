Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75428D31A28
	for <linux-i3c@archiver.kernel.org>; Wed, 14 Jan 2026 08:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nXjDS2/W2eLD2ttWe+d+gv/APe6PA4u8Q26//P7asDs=; b=MIhu3wW0JlXKBF
	qmhXT2r8brreqUTKGTP486nFmw3LJeH8Yu2tr7ADWeGGh/pnLy8ZEJWqEEP3nYgbqAPK/YzvacllM
	qV/V0YJkCv602vXb5f2KbQ2hT//8CJYXrCMP5vd2raPzCVgTVSRRQ4d8K8AsvH+duxJ2doJqXMilZ
	fWz3XZZN6+6mhHMMHjCHU0QrErYdqVj1oTW53TLW/XjkdQhua6SlTU20pRUUm4vEsZNGHh1/DDNlg
	+thyPrL4W5dwRyEPMXoHwryLE50f02jG7cDPUHM8/KuOg1FBrrTX8wCyxHZIjWiUckyR528L9P5O8
	1Vk69KhGWzOcLlTIR9yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfwFO-00000008L7b-0izA;
	Wed, 14 Jan 2026 08:28:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfwFM-00000008L7N-3Rqw
	for linux-i3c@lists.infradead.org;
	Wed, 14 Jan 2026 08:28:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E24CC60052;
	Wed, 14 Jan 2026 08:28:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A20DC19424;
	Wed, 14 Jan 2026 08:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768379335;
	bh=uKzxrTTHk1u3dcQ9f9sKmRXwROd8Re/Ng1B0aI+NYfI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Til2DWdI4nbyYtBRKo/Yb5flF3vsO/BuSYrennMXcEQhLJKO5jJofXCcM/dAllLY8
	 jRT0ep2crLryrWIjcl9mrlrAAQEgTIc+o2iO1OAmVCejHQkvf9jNVjwrWpgu+te+Sh
	 /bOorfY2RDBEtqxm0E5Fr+nQ2MsfUW89WqH2fm2Rregz+W/kqfbILbYGKDjUnMJz48
	 XX+xXdqtC7uW4U7HwSl2rHSsmAsoCQOsu4CFfZ5rRmaWcmIaqIH3/BqZbtpslZkwb5
	 sS6cVJCswbQoX0scxhxtX4dqc6wY0ExAUrphbFsmjQWXGZ7gySTBDHMqWctDbQzpOy
	 NSuSmsWs092Vw==
Date: Wed, 14 Jan 2026 09:28:53 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org, 
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, broonie@kernel.org, lee@kernel.org, Frank.Li@nxp.com, 
	lgirdwood@gmail.com, vikash.bansal@nxp.com, priyanka.jain@nxp.com, 
	shashank.rebbapragada@nxp.com
Subject: Re: [PATCH v4 3/5] mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c hub
 and on-die regulator
Message-ID: <20260114-refreshing-groovy-buzzard-af2eeb@quoll>
References: <20260113114529.1692213-1-aman.kumarpandey@nxp.com>
 <20260113114529.1692213-3-aman.kumarpandey@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260113114529.1692213-3-aman.kumarpandey@nxp.com>
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

On Tue, Jan 13, 2026 at 01:45:27PM +0200, Aman Kumar Pandey wrote:
> Add core MFD support for the NXP P3H2x4x (P3H2440/P3H2441/P3H2840/P3H2841)
> family of multiport I3C hub devices. These devices connect to a host via
> I3C/I2C/SMBus and expose multiple downstream target ports.
> 
> This patch introduces the MFD driver that registers sub-devices for the
> I3C hub and on-die regulators.
> 
> Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
> 
> ---
> Changes in v4:
>  - Split the driver into three separate patches(mfd, regulator and I3C hub)
>  - Added support for NXP P3H2x4x MFD functionality
> ---
> ---
>  MAINTAINERS                 |   4 ++
>  drivers/mfd/Kconfig         |  12 ++++
>  drivers/mfd/Makefile        |   2 +
>  drivers/mfd/p3h2840.c       | 128 ++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/p3h2840.h |  22 +++++++
>  5 files changed, 168 insertions(+)
>  create mode 100644 drivers/mfd/p3h2840.c
>  create mode 100644 include/linux/mfd/p3h2840.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 03a66efbcc4c..aa7043499223 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18931,6 +18931,10 @@ L:	linux-kernel@vger.kernel.org
>  L:	linux-i3c-owner@lists.infradead.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/mfd/nxp,p3h2840-i3c-hub.yaml
> +F:	drivers/mfd/Kconfig
> +F:	drivers/mfd/Makefile

What?

> +F:	drivers/mfd/p3h2840.c
> +F:	include/linux/mfd/p3h2840.h
>  
>  NXP SGTL5000 DRIVER
>  M:	Fabio Estevam <festevam@gmail.com>
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index aace5766b38a..6c41beb0db88 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -2540,6 +2540,18 @@ config MFD_RSMU_SPI
>  	  Additional drivers must be enabled in order to use the functionality
>  	  of the device.
>  
> +config MFD_P3H2X4X
> +       tristate "NXP P3H2X4X I3C Hub Device"
> +       depends on I3C
> +       select MFD_CORE
> +       select REGMAP_I3C
> +       help
> +         Enable Support for NXP P3H244x/P3H284x I3C HUB device using I3C/I2c
> +         communication interface.
> +
> +         This driver provides support for I3C Hub and regulator, additional
> +         drivers must be enabled in order to use the functionality of the device.
> +
>  config MFD_UPBOARD_FPGA
>  	tristate "Support for the AAeon UP board FPGA"
>  	depends on (X86 && ACPI)
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index e75e8045c28a..223142cdd803 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -301,6 +301,8 @@ obj-$(CONFIG_MFD_QNAP_MCU)	+= qnap-mcu.o
>  obj-$(CONFIG_MFD_RSMU_I2C)	+= rsmu_i2c.o rsmu_core.o
>  obj-$(CONFIG_MFD_RSMU_SPI)	+= rsmu_spi.o rsmu_core.o
>  
> +obj-$(CONFIG_MFD_P3H2X4X) 	+= p3h2840.o

Do not add at the end of Makefile or Kconfig. P < R if you wanted to
order it around here, but probably should be placed much earlier.

> +
>  obj-$(CONFIG_MFD_UPBOARD_FPGA)	+= upboard-fpga.o
>  
>  obj-$(CONFIG_MFD_LOONGSON_SE)	+= loongson-se.o
> diff --git a/drivers/mfd/p3h2840.c b/drivers/mfd/p3h2840.c
> new file mode 100644
> index 000000000000..f6a99291c305
> --- /dev/null
> +++ b/drivers/mfd/p3h2840.c
> @@ -0,0 +1,128 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2025 NXP
> + * P3H2x4x i3c hub and regulator device.
> + */
> +
> +#include <linux/i3c/master.h>
> +#include <linux/i2c.h>
> +#include <linux/mfd/core.h>
> +#include <linux/regmap.h>
> +#include <linux/mfd/p3h2840.h>
> +
> +static const struct mfd_cell p3h2x4x_devs[] = {
> +	{
> +		.name = "p3h2x4x-regulator",
> +	},
> +	{
> +		.name = "p3h2x4x-i3c-hub",
> +	},
> +};
> +
> +static const struct regmap_config p3h2x4x_regmap_config = {
> +	.reg_bits = P3H2x4x_REG_BITS,
> +	.val_bits = P3H2x4x_VAL_BITS,
> +	.max_register = 0xFF,
> +};
> +
> +static int p3h2x4x_device_probe_i3c(struct i3c_device *i3cdev)
> +{
> +	struct p3h2x4x_dev *p3h2x4x;
> +	int ret;
> +
> +	p3h2x4x = devm_kzalloc(&i3cdev->dev, sizeof(*p3h2x4x), GFP_KERNEL);
> +	if (!p3h2x4x)
> +		return -ENOMEM;
> +
> +	i3cdev_set_drvdata(i3cdev, p3h2x4x);
> +
> +	p3h2x4x->regmap = devm_regmap_init_i3c(i3cdev, &p3h2x4x_regmap_config);
> +	if (IS_ERR(p3h2x4x->regmap)) {
> +		return dev_err_probe(&i3cdev->dev, PTR_ERR(p3h2x4x->regmap),

Look here...

> +				     "Failed to register I3C HUB regmap\n");
> +	}
> +
> +	p3h2x4x->is_p3h2x4x_in_i3c = true;
> +	p3h2x4x->i3cdev = i3cdev;
> +
> +	ret = devm_mfd_add_devices(&i3cdev->dev, PLATFORM_DEVID_NONE,
> +				   p3h2x4x_devs, ARRAY_SIZE(p3h2x4x_devs),
> +				   NULL, 0, NULL);
> +	if (ret)
> +		return dev_err_probe(&i3cdev->dev, ret, "Failed to add sub devices\n");
> +
> +	return 0;
> +}
> +
> +static int p3h2x4x_device_probe_i2c(struct i2c_client *client)
> +{
> +	struct p3h2x4x_dev *p3h2x4x;
> +	int ret;
> +
> +	p3h2x4x = devm_kzalloc(&client->dev, sizeof(*p3h2x4x), GFP_KERNEL);
> +	if (!p3h2x4x)
> +		return -ENOMEM;
> +
> +	i2c_set_clientdata(client, p3h2x4x);
> +
> +	p3h2x4x->regmap = devm_regmap_init_i2c(client, &p3h2x4x_regmap_config);
> +	if (IS_ERR(p3h2x4x->regmap)) {
> +		ret = PTR_ERR(p3h2x4x->regmap);

And here!

Drop. This is completely redundant. How is it that in one place you use
one syntax and in other place completely different syntax?

> +		return dev_err_probe(&client->dev, ret, "Failed to register I3C HUB regmap\n");
> +	}
> +
> +	p3h2x4x->is_p3h2x4x_in_i3c = false;
> +	p3h2x4x->i2c_client = client;
> +
> +	ret = devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_NONE,
> +				   p3h2x4x_devs, ARRAY_SIZE(p3h2x4x_devs),
> +				   NULL, 0, NULL);
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret, "Failed to add sub devices\n");
> +
> +	return 0;

Best regards,
Krzysztof


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
