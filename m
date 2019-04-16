Return-Path: <SRS0=s+0C=SS=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19DEBC282E4
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Apr 2019 11:12:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E094420857
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Apr 2019 11:12:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YUSTYYTc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MlUPYrp6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E094420857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k+s1iZQJFhUt0nWmyNc9GVdPIbMNJ6S8Or7B9wU02i8=; b=YUSTYYTcqeuR6L
	GffQWkBtqZ5X/h/Snapi97L+ZLtzNOx7kQMXBlG94YV1fnExTq5AveTBFD9gw47Lz/LHbNqbNMBM1
	yE1OQKSXw9dQDWfzI0R2MauKFWDmP52FhKn9FdbbYEuGA2Vrw4Hlj1cU1WstUL2/lFJTSTZ/m7siu
	OhKWTDM4Xs+L9WrRL0AQMYadILqEb8s7/DNr+ASyxep0vcsC6IuQYeu7+1NI20o/vwsmoic6+ViiX
	+D1S4mB0iqzUkORylic1G3Vf98za3HKVGVLJFMamzoHcY415tW23R1bCCBFQ3dqs+nLIhyAQIkUUo
	myeUfdo5hO9WStuD+ztA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGM0q-0001G4-CX; Tue, 16 Apr 2019 11:12:28 +0000
Received: from mail-yw1-xc41.google.com ([2607:f8b0:4864:20::c41])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGIzN-0005wz-EM
 for linux-i3c@lists.infradead.org; Tue, 16 Apr 2019 07:58:48 +0000
Received: by mail-yw1-xc41.google.com with SMTP id v127so6971278ywe.13
 for <linux-i3c@lists.infradead.org>; Tue, 16 Apr 2019 00:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8K0KG6lkZjgZisSI5RrvC1dS+AwQyGjdL6WsbdaK2Dw=;
 b=MlUPYrp67TabPXwc/Us9fg8/J+8+51X5r7LceYjoUL+jYJUF4DW7J4Kg3ZMy5QcmKz
 19kSKJqXLtNZhUYh1UpdC9mna7Rck8QQM8Cnz4TlrKo/1Uhu47MvzYnpfgljKtj9WQiR
 bq78q5LqsJJsy86XqJY4YHwmZmwP+vX+V2AvACGHpeCS8k3vQaD5CcKi22P5StwinwtP
 WGZh4nrmMR5J4qocqu8vWR5FKy3p6ETHh5un2TVZpaVHH56DTl8deWzvBWDv+cVWrmBg
 ykSgNN5Q0aQsj8dHePwtSGOWpxr7AWtQ7SNQOH2hfJtN0Ab5jREtnZYpf6MqZPF3neeL
 eypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8K0KG6lkZjgZisSI5RrvC1dS+AwQyGjdL6WsbdaK2Dw=;
 b=JaQ7wRbgwdXIOmK7K5qkqSgaJIu9SD/U316Pa3zT8Ge+B/rLpOn9Kj4AaFy+xgCDmr
 Bzkii8Tc3eZ+wm+VQXQkuqfhftPSLeF2mbSLr2hh9y+5+C3B9k6arOtpGO3SmPzjQOtR
 HgE8kktjfx+NqIRhzsClp+7miDI0Q0jqTcmEjeX429vo9kz0jFMrGp83slGFvMfp7Sdp
 W/g0j7/HSGL+YHWo65qlbdOuL7TGWuxsBwbvf23YwB0e1JHgi3HHJHT7Yt+UuSUO2Jce
 LrzJZcVDVgg2L76gDRqEiKHyZMZtCycryH2Vu1AdmxSLw9vhdwf1GrOn6jxcqVF07zwp
 hPEg==
X-Gm-Message-State: APjAAAX/OT7j9VX9qOwnycR5sAmWaAVHaAbZDdLtE27wNiKppHLBwg5R
 lOORdCySWq4QHi+nzvS3EZC7c+bEEN1riSzDot0=
X-Google-Smtp-Source: APXvYqw49YIhtjmT5PSR5pRYRZ0HFAfqbnL9NKh3dW0jk+wfMQLApGHMM+HrQsfEKwSc5jGNJjjw5PWcsw/dAhw5Jrw=
X-Received: by 2002:a81:5f88:: with SMTP id
 t130mr65268704ywb.453.1555401524353; 
 Tue, 16 Apr 2019 00:58:44 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1555354268.git.vitor.soares@synopsys.com>
 <302f8296299d6cd25b3689f5eca1c510a3290db3.1555354268.git.vitor.soares@synopsys.com>
 <20190416082539.2f12b38f@collabora.com>
In-Reply-To: <20190416082539.2f12b38f@collabora.com>
From: Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>
Date: Tue, 16 Apr 2019 09:58:33 +0200
Message-ID: <CAA2SeNJ1cTxAp6+5Q4Z5L4VFBfA3U4e11_Obpk8muD1Vh3v52A@mail.gmail.com>
Subject: Re: [PATCH 3/3] iio: imu: st_lsm6dsx: Add i3c basic support
To: Boris Brezillon <boris.brezillon@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190416_005845_594287_5E46B83D 
X-CRM114-Status: GOOD (  23.05  )
X-Mailman-Approved-At: Tue, 16 Apr 2019 04:12:26 -0700
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: Lars-Peter Clausen <lars@metafoo.de>, bbrezillon@kernel.org,
 linux-iio@vger.kernel.org, gregkh@linuxfoundation.org, joao.pinto@synopsys.com,
 rafael@kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vitor Soares <vitor.soares@synopsys.com>, broonie@kernel.org,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Hartmut Knaack <knaack.h@gmx.de>,
 linux-i3c@lists.infradead.org, Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

>
> On Mon, 15 Apr 2019 21:19:41 +0200
> Vitor Soares <vitor.soares@synopsys.com> wrote:
>
> > For today the st_lsm6dsx driver support lsm6dso sensor only in
> > spi and i2c mode.
> >
> > The lsm6dso is also i3c capable so lets give i3c support to it.
> >
> > Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
> > ---
> >  drivers/iio/imu/st_lsm6dsx/Kconfig          |  8 +++-
> >  drivers/iio/imu/st_lsm6dsx/Makefile         |  1 +
> >  drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c | 67 +++++++++++++++++++++++++++++
> >  3 files changed, 75 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c
> >
> > diff --git a/drivers/iio/imu/st_lsm6dsx/Kconfig b/drivers/iio/imu/st_lsm6dsx/Kconfig
> > index 094fd00..1ab9bbf 100644
> > --- a/drivers/iio/imu/st_lsm6dsx/Kconfig
> > +++ b/drivers/iio/imu/st_lsm6dsx/Kconfig
> > @@ -1,11 +1,12 @@
> >
> >  config IIO_ST_LSM6DSX
> >       tristate "ST_LSM6DSx driver for STM 6-axis IMU MEMS sensors"
> > -     depends on (I2C || SPI)
> > +     depends on (I2C || SPI || I3C)
> >       select IIO_BUFFER
> >       select IIO_KFIFO_BUF
> >       select IIO_ST_LSM6DSX_I2C if (I2C)
> >       select IIO_ST_LSM6DSX_SPI if (SPI_MASTER)
> > +     select IIO_ST_LSM6DSX_I3C if (I3C)
> >       help
> >         Say yes here to build support for STMicroelectronics LSM6DSx imu
> >         sensor. Supported devices: lsm6ds3, lsm6ds3h, lsm6dsl, lsm6dsm,
> > @@ -23,3 +24,8 @@ config IIO_ST_LSM6DSX_SPI
> >       tristate
> >       depends on IIO_ST_LSM6DSX
> >       select REGMAP_SPI
> > +
> > +config IIO_ST_LSM6DSX_I3C
> > +     tristate
> > +     depends on IIO_ST_LSM6DSX
> > +     select REGMAP_I3C
> > diff --git a/drivers/iio/imu/st_lsm6dsx/Makefile b/drivers/iio/imu/st_lsm6dsx/Makefile
> > index e5f733c..c676965 100644
> > --- a/drivers/iio/imu/st_lsm6dsx/Makefile
> > +++ b/drivers/iio/imu/st_lsm6dsx/Makefile
> > @@ -4,3 +4,4 @@ st_lsm6dsx-y := st_lsm6dsx_core.o st_lsm6dsx_buffer.o \
> >  obj-$(CONFIG_IIO_ST_LSM6DSX) += st_lsm6dsx.o
> >  obj-$(CONFIG_IIO_ST_LSM6DSX_I2C) += st_lsm6dsx_i2c.o
> >  obj-$(CONFIG_IIO_ST_LSM6DSX_SPI) += st_lsm6dsx_spi.o
> > +obj-$(CONFIG_IIO_ST_LSM6DSX_I3C) += st_lsm6dsx_i3c.o
> > diff --git a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c
> > new file mode 100644
> > index 0000000..2df5e70
> > --- /dev/null
> > +++ b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c
> > @@ -0,0 +1,67 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2018 Synopsys, Inc. and/or its affiliates.
> > + *
> > + * Author: Vitor Soares <vitor.soares@synopsys.com>
> > + */
> > +
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/i3c/device.h>
> > +#include <linux/i3c/master.h>
> > +#include <linux/slab.h>
> > +#include <linux/of.h>
> > +#include <linux/regmap.h>
> > +
> > +#include "st_lsm6dsx.h"
> > +
> > +#define NAME_SIZE    32
> > +
> > +struct st_lsm6dsx_i3c_data {
> > +     char name[NAME_SIZE];
>
>         const char *name;
>
> > +     enum st_lsm6dsx_hw_id id;
> > +};
> > +
> > +static const struct st_lsm6dsx_i3c_data hw_data[] = {
>
> No need to make it an array, and it should probably be named
> st_lsm6dso_data not hw_data.

I guess it will be used even for future devices so I would prefer to
make it an array with a 'general' name

Regards,
Lorenzo

>
> > +     { ST_LSM6DSO_DEV_NAME, ST_LSM6DSO_ID },
> > +};
> > +
> > +static const struct regmap_config st_lsm6dsx_i3c_regmap_config = {
> > +     .reg_bits = 8,
> > +     .val_bits = 8,
> > +};
> > +
> > +static int st_lsm6dsx_i3c_probe(struct i3c_device *i3cdev)
> > +{
> > +     const struct i3c_device_id *id = i3c_get_device_id(i3cdev);
>
>                                          i3c_device_match_id(i3cdev,
>                                                              st_lsm6dsx_i3c_ids);
>
> > +     const struct st_lsm6dsx_i3c_data *hw_data = id->data;
> > +     struct regmap *regmap;
> > +
> > +     regmap = devm_regmap_init_i3c(i3cdev, &st_lsm6dsx_i3c_regmap_config);
> > +     if (IS_ERR(regmap)) {
> > +             dev_err(&i3cdev->dev, "Failed to register i3c regmap %d\n",
> > +                     (int)PTR_ERR(regmap));
> > +             return PTR_ERR(regmap);
> > +     }
> > +
> > +     return st_lsm6dsx_probe(&i3cdev->dev, 0, hw_data->id,
> > +                             hw_data->name, regmap);
> > +}
> > +
> > +
> > +static const struct i3c_device_id st_lsm6dsx_i3c_ids[] = {
> > +     I3C_DEVICE(0x0104, 0x006C, &hw_data[0]),
> > +     { /* sentinel */ },
> > +};
> > +MODULE_DEVICE_TABLE(i3c, st_lsm6dsx_i3c_ids);
> > +
> > +static struct i3c_driver st_lsm6dsx_driver = {
> > +     .driver.name = "st_lsm6dsx_i3c",
> > +     .probe = st_lsm6dsx_i3c_probe,
> > +     .id_table = st_lsm6dsx_i3c_ids,
>
> You should probably set the pm_ops here (st_lsm6dsx_pm_ops).
>
> > +};
> > +module_i3c_driver(st_lsm6dsx_driver);
> > +
> > +MODULE_AUTHOR("Vitor Soares <vitor.soares@synopsys.com>");
> > +MODULE_DESCRIPTION("STMicroelectronics st_lsm6dsx i3c driver");
> > +MODULE_LICENSE("GPL v2");
> > +
>
> You can remove this blank line.
>


-- 
UNIX is Sexy: who | grep -i blonde | talk; cd ~; wine; talk; touch;
unzip; touch; strip; gasp; finger; gasp; mount; fsck; more; yes; gasp;
umount; make clean; sleep

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
