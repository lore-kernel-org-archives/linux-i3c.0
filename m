Return-Path: <SRS0=2ljA=X5=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B13C8C47404
	for <linux-i3c@archiver.kernel.org>; Fri,  4 Oct 2019 20:32:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C75A21D81
	for <linux-i3c@archiver.kernel.org>; Fri,  4 Oct 2019 20:32:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I/wMcmqq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C75A21D81
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zQx+YQNpd9atOLo3CVwfkWhe1VJWVe5wKwdprAT+F/8=; b=I/wMcmqqhmhxGi
	4HJNPg7uKZVRyOzsdA2XBZ+B40l4TaOsrtp12+3dlAzyR3S4e+EwDi1BdsaF5i+xUoPk8Ej0IEund
	K5v02C+85esCSwAHDTSuydwtjM3Nu6NGfAb1bga54EHkRBamrLTg0EmiMKNrOfmLhDPDnVGv/503W
	VQCrtZpn3ccPW5diAqt27e+YzZBlVJdut6gCttTwpNc9EJohJ+QPW6Pmt9ZMxis0nWppJ53GUBqpf
	QZFWctGbNeTzDDf5Zb7hmn0vJiYOhUAsbE8BJpv8lEevysEIPpLOWHlDFV6uQO3P/RQ2eTAu42hBA
	QzKUtaaQPtr4Feyc+HFw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iGUFS-0002Z0-2N; Fri, 04 Oct 2019 20:32:22 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iFzbq-0006Wo-8g
 for linux-i3c@lists.infradead.org; Thu, 03 Oct 2019 11:49:29 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 813761762F85CC584C1A;
 Thu,  3 Oct 2019 19:49:16 +0800 (CST)
Received: from localhost (10.202.226.61) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Thu, 3 Oct 2019
 19:49:12 +0800
Date: Thu, 3 Oct 2019 12:49:02 +0100
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: [PATCH v6 2/2] iio: imu: st_lsm6dsx: add i3c basic support for
 LSM6DSO and LSM6DSR
Message-ID: <20191003124902.00003547@huawei.com>
In-Reply-To: <CH2PR12MB421658374F977C89B5A3F1B7AE870@CH2PR12MB4216.namprd12.prod.outlook.com>
References: <cover.1563542515.git.vitor.soares@synopsys.com>
 <77c709aca8607f31f141ee7c4dc28bf89266bd23.1563542515.git.vitor.soares@synopsys.com>
 <20190721181656.236faa63@archlinux>
 <CH2PR12MB421658374F977C89B5A3F1B7AE870@CH2PR12MB4216.namprd12.prod.outlook.com>
Organization: Huawei
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.226.61]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191003_044926_501992_5C88F8CA 
X-CRM114-Status: GOOD (  25.02  )
X-Mailman-Approved-At: Fri, 04 Oct 2019 13:32:20 -0700
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
Cc: "Joao.Pinto@synopsys.com" <Joao.Pinto@synopsys.com>,
 "rafael@kernel.org" <rafael@kernel.org>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 "lorenzo@kernel.org" <lorenzo@kernel.org>, Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Wed, 25 Sep 2019 15:35:10 +0000
Vitor Soares <Vitor.Soares@synopsys.com> wrote:

> Hi Jonathan,
> 
> From: Jonathan Cameron <jic23@kernel.org>
> Date: Sun, Jul 21, 2019 at 18:16:56
> 
> > On Fri, 19 Jul 2019 15:30:55 +0200
> > Vitor Soares <Vitor.Soares@synopsys.com> wrote:
> >   
> > > For today the st_lsm6dsx driver support LSM6DSO and LSM6DSR sensor only in
> > > spi and i2c mode.
> > > 
> > > The LSM6DSO and LSM6DSR are also i3c capable so let's give i3c support to
> > > them.
> > > 
> > > Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
> > > Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > > Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>  
> > Great. I'll pick this up once Boris has that immutable branch
> > available. Give me a poke if I seem to have lost it!
> > 
> > Thanks,
> > 
> > Jonathan  
> 
> I didn't see the i3c support for st_lsm6dsx driver in pull request, could 
> you please check it?
Seems to have made it

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c?h=v5.4-rc1

I checked back. Was in the first pull request back on the 12th of August.

Jonathan

> 
> Best regards,
> Vitor Soares
> 
> > > ---
> > > Changes in v6:
> > >   none
> > > 
> > > Changes in v5:
> > >   Move regmap_config declaration inside st_lsm6dsx_i3c_probe()
> > >   Fix warning [-Wint-to-void-pointer-cast] when compiling in 64-bit arch
> > > 
> > > Changes in v4:
> > >   Remove hw_id variable
> > > 
> > > Changes in v3:
> > >   Remove unnecessary st_lsm6dsx_i3c_data table used to hold device name
> > >   Use st_lsm6dsx_probe new form
> > > 
> > > Changes in v2:
> > >   Add support for LSM6DSR
> > >   Set pm_ops to st_lsm6dsx_pm_ops
> > > 
> > >  drivers/iio/imu/st_lsm6dsx/Kconfig          |  8 +++-
> > >  drivers/iio/imu/st_lsm6dsx/Makefile         |  1 +
> > >  drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c | 57 +++++++++++++++++++++++++++++
> > >  3 files changed, 65 insertions(+), 1 deletion(-)
> > >  create mode 100644 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c
> > > 
> > > diff --git a/drivers/iio/imu/st_lsm6dsx/Kconfig b/drivers/iio/imu/st_lsm6dsx/Kconfig
> > > index 9e59297..6b5a73c 100644
> > > --- a/drivers/iio/imu/st_lsm6dsx/Kconfig
> > > +++ b/drivers/iio/imu/st_lsm6dsx/Kconfig
> > > @@ -1,11 +1,12 @@
> > >  
> > >  config IIO_ST_LSM6DSX
> > >  	tristate "ST_LSM6DSx driver for STM 6-axis IMU MEMS sensors"
> > > -	depends on (I2C || SPI)
> > > +	depends on (I2C || SPI || I3C)
> > >  	select IIO_BUFFER
> > >  	select IIO_KFIFO_BUF
> > >  	select IIO_ST_LSM6DSX_I2C if (I2C)
> > >  	select IIO_ST_LSM6DSX_SPI if (SPI_MASTER)
> > > +	select IIO_ST_LSM6DSX_I3C if (I3C)
> > >  	help
> > >  	  Say yes here to build support for STMicroelectronics LSM6DSx imu
> > >  	  sensor. Supported devices: lsm6ds3, lsm6ds3h, lsm6dsl, lsm6dsm,
> > > @@ -23,3 +24,8 @@ config IIO_ST_LSM6DSX_SPI
> > >  	tristate
> > >  	depends on IIO_ST_LSM6DSX
> > >  	select REGMAP_SPI
> > > +
> > > +config IIO_ST_LSM6DSX_I3C
> > > +	tristate
> > > +	depends on IIO_ST_LSM6DSX
> > > +	select REGMAP_I3C
> > > diff --git a/drivers/iio/imu/st_lsm6dsx/Makefile b/drivers/iio/imu/st_lsm6dsx/Makefile
> > > index e5f733c..c676965 100644
> > > --- a/drivers/iio/imu/st_lsm6dsx/Makefile
> > > +++ b/drivers/iio/imu/st_lsm6dsx/Makefile
> > > @@ -4,3 +4,4 @@ st_lsm6dsx-y := st_lsm6dsx_core.o st_lsm6dsx_buffer.o \
> > >  obj-$(CONFIG_IIO_ST_LSM6DSX) += st_lsm6dsx.o
> > >  obj-$(CONFIG_IIO_ST_LSM6DSX_I2C) += st_lsm6dsx_i2c.o
> > >  obj-$(CONFIG_IIO_ST_LSM6DSX_SPI) += st_lsm6dsx_spi.o
> > > +obj-$(CONFIG_IIO_ST_LSM6DSX_I3C) += st_lsm6dsx_i3c.o
> > > diff --git a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c
> > > new file mode 100644
> > > index 0000000..57e6331
> > > --- /dev/null
> > > +++ b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c
> > > @@ -0,0 +1,57 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Copyright (c) 2018 Synopsys, Inc. and/or its affiliates.
> > > + *
> > > + * Author: Vitor Soares <vitor.soares@synopsys.com>
> > > + */
> > > +
> > > +#include <linux/kernel.h>
> > > +#include <linux/module.h>
> > > +#include <linux/i3c/device.h>
> > > +#include <linux/i3c/master.h>
> > > +#include <linux/slab.h>
> > > +#include <linux/of.h>
> > > +#include <linux/regmap.h>
> > > +
> > > +#include "st_lsm6dsx.h"
> > > +
> > > +static const struct i3c_device_id st_lsm6dsx_i3c_ids[] = {
> > > +	I3C_DEVICE(0x0104, 0x006C, (void *)ST_LSM6DSO_ID),
> > > +	I3C_DEVICE(0x0104, 0x006B, (void *)ST_LSM6DSR_ID),
> > > +	{ /* sentinel */ },
> > > +};
> > > +MODULE_DEVICE_TABLE(i3c, st_lsm6dsx_i3c_ids);
> > > +
> > > +static int st_lsm6dsx_i3c_probe(struct i3c_device *i3cdev)
> > > +{
> > > +	struct regmap_config st_lsm6dsx_i3c_regmap_config = {
> > > +		.reg_bits = 8,
> > > +		.val_bits = 8,
> > > +	};
> > > +	const struct i3c_device_id *id = i3c_device_match_id(i3cdev,
> > > +							    st_lsm6dsx_i3c_ids);
> > > +	struct regmap *regmap;
> > > +
> > > +	regmap = devm_regmap_init_i3c(i3cdev, &st_lsm6dsx_i3c_regmap_config);
> > > +	if (IS_ERR(regmap)) {
> > > +		dev_err(&i3cdev->dev, "Failed to register i3c regmap %d\n",
> > > +			(int)PTR_ERR(regmap));
> > > +		return PTR_ERR(regmap);
> > > +	}
> > > +
> > > +	return st_lsm6dsx_probe(&i3cdev->dev, 0, (uintptr_t)id->data, regmap);
> > > +}
> > > +
> > > +static struct i3c_driver st_lsm6dsx_driver = {
> > > +	.driver = {
> > > +		.name = "st_lsm6dsx_i3c",
> > > +		.pm = &st_lsm6dsx_pm_ops,
> > > +	},
> > > +	.probe = st_lsm6dsx_i3c_probe,
> > > +	.id_table = st_lsm6dsx_i3c_ids,
> > > +};
> > > +module_i3c_driver(st_lsm6dsx_driver);
> > > +
> > > +MODULE_AUTHOR("Vitor Soares <vitor.soares@synopsys.com>");
> > > +MODULE_DESCRIPTION("STMicroelectronics st_lsm6dsx i3c driver");
> > > +MODULE_LICENSE("GPL v2");  
> 
> 



_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
