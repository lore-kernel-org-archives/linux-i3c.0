Return-Path: <SRS0=QKN+=VT=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF8D9C76197
	for <linux-i3c@archiver.kernel.org>; Mon, 22 Jul 2019 09:43:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAC1921993
	for <linux-i3c@archiver.kernel.org>; Mon, 22 Jul 2019 09:43:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BfvjTY4T";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="jvu6bkoJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAC1921993
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ocRAdOq/fxXyqxcFsH8Bt5qhnVbNec6/lYEHx7TWd9A=; b=BfvjTY4TgRaBqF
	yPYAVZFPf84sY/LeR4a+PUi/3uZrrpnwtEAggHUJEVLE57oHSzZoPidjFkBIXBk6FHjfKtDrkr4OT
	nR2F5AsLiN0Tse/9pEHb5/fO12aLFzzHdnC5YaLKyJQXBerFbLXBJoSblN8wZADhIvFeKCIrBVlae
	2xc4ecMz4L+01URjLNs2NjWiqSDuCze1r6Irjl5Z1A7wO3obvQBnQ5CSmZde11qlYOeyCxWVnykXJ
	WV1Qw/lYhO3D+V5pvUKeu8xeIwJzAZVLMYQ5uAPM8enI4sN/bTYTCW9WiJj+PM7T/hJpGzG7MibiK
	QCxWyHBsPhu2tnZmEajQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hpUr8-0001nd-Hb; Mon, 22 Jul 2019 09:43:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hpFSI-0005Fk-H5
 for linux-i3c@lists.infradead.org; Sun, 21 Jul 2019 17:17:04 +0000
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EBCB120823;
 Sun, 21 Jul 2019 17:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1563729421;
 bh=oNRjiYNFNSWuU2Hl7R3Blq8C4KrNwXnyrvj2jWzMeig=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jvu6bkoJiSs2XGQsWbSgrFkqfxl7NdN2b/Rdwc6LE/ZRld2mjJ2Y6igginFFU7zOL
 zjbRALsUsGZhwBOZz7a3sGl2q3K33lMoR2AmepOAQKnwAOY8PxJpkssM52RGSu4k5A
 wis7aA1d4mjgamD6S2srVpmnA32aaRGN6PK2OzKQ=
Date: Sun, 21 Jul 2019 18:16:56 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: [PATCH v6 2/2] iio: imu: st_lsm6dsx: add i3c basic support for
 LSM6DSO and LSM6DSR
Message-ID: <20190721181656.236faa63@archlinux>
In-Reply-To: <77c709aca8607f31f141ee7c4dc28bf89266bd23.1563542515.git.vitor.soares@synopsys.com>
References: <cover.1563542515.git.vitor.soares@synopsys.com>
 <77c709aca8607f31f141ee7c4dc28bf89266bd23.1563542515.git.vitor.soares@synopsys.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190721_101702_600045_70704553 
X-CRM114-Status: GOOD (  21.63  )
X-Mailman-Approved-At: Mon, 22 Jul 2019 02:43:40 -0700
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

On Fri, 19 Jul 2019 15:30:55 +0200
Vitor Soares <Vitor.Soares@synopsys.com> wrote:

> For today the st_lsm6dsx driver support LSM6DSO and LSM6DSR sensor only in
> spi and i2c mode.
> 
> The LSM6DSO and LSM6DSR are also i3c capable so let's give i3c support to
> them.
> 
> Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
> Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Great. I'll pick this up once Boris has that immutable branch
available. Give me a poke if I seem to have lost it!

Thanks,

Jonathan

> ---
> Changes in v6:
>   none
> 
> Changes in v5:
>   Move regmap_config declaration inside st_lsm6dsx_i3c_probe()
>   Fix warning [-Wint-to-void-pointer-cast] when compiling in 64-bit arch
> 
> Changes in v4:
>   Remove hw_id variable
> 
> Changes in v3:
>   Remove unnecessary st_lsm6dsx_i3c_data table used to hold device name
>   Use st_lsm6dsx_probe new form
> 
> Changes in v2:
>   Add support for LSM6DSR
>   Set pm_ops to st_lsm6dsx_pm_ops
> 
>  drivers/iio/imu/st_lsm6dsx/Kconfig          |  8 +++-
>  drivers/iio/imu/st_lsm6dsx/Makefile         |  1 +
>  drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c | 57 +++++++++++++++++++++++++++++
>  3 files changed, 65 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c
> 
> diff --git a/drivers/iio/imu/st_lsm6dsx/Kconfig b/drivers/iio/imu/st_lsm6dsx/Kconfig
> index 9e59297..6b5a73c 100644
> --- a/drivers/iio/imu/st_lsm6dsx/Kconfig
> +++ b/drivers/iio/imu/st_lsm6dsx/Kconfig
> @@ -1,11 +1,12 @@
>  
>  config IIO_ST_LSM6DSX
>  	tristate "ST_LSM6DSx driver for STM 6-axis IMU MEMS sensors"
> -	depends on (I2C || SPI)
> +	depends on (I2C || SPI || I3C)
>  	select IIO_BUFFER
>  	select IIO_KFIFO_BUF
>  	select IIO_ST_LSM6DSX_I2C if (I2C)
>  	select IIO_ST_LSM6DSX_SPI if (SPI_MASTER)
> +	select IIO_ST_LSM6DSX_I3C if (I3C)
>  	help
>  	  Say yes here to build support for STMicroelectronics LSM6DSx imu
>  	  sensor. Supported devices: lsm6ds3, lsm6ds3h, lsm6dsl, lsm6dsm,
> @@ -23,3 +24,8 @@ config IIO_ST_LSM6DSX_SPI
>  	tristate
>  	depends on IIO_ST_LSM6DSX
>  	select REGMAP_SPI
> +
> +config IIO_ST_LSM6DSX_I3C
> +	tristate
> +	depends on IIO_ST_LSM6DSX
> +	select REGMAP_I3C
> diff --git a/drivers/iio/imu/st_lsm6dsx/Makefile b/drivers/iio/imu/st_lsm6dsx/Makefile
> index e5f733c..c676965 100644
> --- a/drivers/iio/imu/st_lsm6dsx/Makefile
> +++ b/drivers/iio/imu/st_lsm6dsx/Makefile
> @@ -4,3 +4,4 @@ st_lsm6dsx-y := st_lsm6dsx_core.o st_lsm6dsx_buffer.o \
>  obj-$(CONFIG_IIO_ST_LSM6DSX) += st_lsm6dsx.o
>  obj-$(CONFIG_IIO_ST_LSM6DSX_I2C) += st_lsm6dsx_i2c.o
>  obj-$(CONFIG_IIO_ST_LSM6DSX_SPI) += st_lsm6dsx_spi.o
> +obj-$(CONFIG_IIO_ST_LSM6DSX_I3C) += st_lsm6dsx_i3c.o
> diff --git a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c
> new file mode 100644
> index 0000000..57e6331
> --- /dev/null
> +++ b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c
> @@ -0,0 +1,57 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2018 Synopsys, Inc. and/or its affiliates.
> + *
> + * Author: Vitor Soares <vitor.soares@synopsys.com>
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/i3c/device.h>
> +#include <linux/i3c/master.h>
> +#include <linux/slab.h>
> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +
> +#include "st_lsm6dsx.h"
> +
> +static const struct i3c_device_id st_lsm6dsx_i3c_ids[] = {
> +	I3C_DEVICE(0x0104, 0x006C, (void *)ST_LSM6DSO_ID),
> +	I3C_DEVICE(0x0104, 0x006B, (void *)ST_LSM6DSR_ID),
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(i3c, st_lsm6dsx_i3c_ids);
> +
> +static int st_lsm6dsx_i3c_probe(struct i3c_device *i3cdev)
> +{
> +	struct regmap_config st_lsm6dsx_i3c_regmap_config = {
> +		.reg_bits = 8,
> +		.val_bits = 8,
> +	};
> +	const struct i3c_device_id *id = i3c_device_match_id(i3cdev,
> +							    st_lsm6dsx_i3c_ids);
> +	struct regmap *regmap;
> +
> +	regmap = devm_regmap_init_i3c(i3cdev, &st_lsm6dsx_i3c_regmap_config);
> +	if (IS_ERR(regmap)) {
> +		dev_err(&i3cdev->dev, "Failed to register i3c regmap %d\n",
> +			(int)PTR_ERR(regmap));
> +		return PTR_ERR(regmap);
> +	}
> +
> +	return st_lsm6dsx_probe(&i3cdev->dev, 0, (uintptr_t)id->data, regmap);
> +}
> +
> +static struct i3c_driver st_lsm6dsx_driver = {
> +	.driver = {
> +		.name = "st_lsm6dsx_i3c",
> +		.pm = &st_lsm6dsx_pm_ops,
> +	},
> +	.probe = st_lsm6dsx_i3c_probe,
> +	.id_table = st_lsm6dsx_i3c_ids,
> +};
> +module_i3c_driver(st_lsm6dsx_driver);
> +
> +MODULE_AUTHOR("Vitor Soares <vitor.soares@synopsys.com>");
> +MODULE_DESCRIPTION("STMicroelectronics st_lsm6dsx i3c driver");
> +MODULE_LICENSE("GPL v2");


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
