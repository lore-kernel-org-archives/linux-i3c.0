Return-Path: <SRS0=CE6j=UF=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3F69C28EB8
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Jun 2019 18:54:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F913208C0
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Jun 2019 18:54:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EcEhc7zO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="y6eqiUOc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F913208C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XEeFmMPV7/kirVprzOOxrbnG5AzpkCkskyKjcodFnjc=; b=EcEhc7zO1/nt19YYwkrYenS0o
	eYcbDvyPZSSqM9lUuwrXFPO9UQzD+ah8zeZHflMhZ+aOfzkg63+uhwx49NnORtNx0qPcL64t/+IYs
	tUBtgWQ496MOsFsM/rEH6DQG5/g7FsZseZJhESKnPa1GocbpG7w4gN3WR222DRsAjKcQdCgQzc3tj
	t4gcJpoIjT28TEXo0kgMaojEjhbn1WzL2WyrsJAS/r1/6P/BbtPR4cwmp4gT+fdTw1Wy4BIqNtsMn
	e9JYIBQasQyIZ6SiBibwL9BWE4xpMqet7zDedsPK2ouHslT3O4ekwVVOBokNWR1yQT7sy8K2NdBIz
	ONHyi99Zg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hYxWz-0000BM-Lp; Thu, 06 Jun 2019 18:54:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYwWe-0003G7-AB
 for linux-i3c@lists.infradead.org; Thu, 06 Jun 2019 17:50:09 +0000
Received: from localhost.localdomain (nat-pool-mxp-t.redhat.com
 [149.6.153.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5EA2120868;
 Thu,  6 Jun 2019 17:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559843407;
 bh=WMiN8khMVfY2k+C2UTgA1ksdMhPzmtWk/dznX9kkpTU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=y6eqiUOcEDhTt5/flE4170FW36V1tzhuJkU03TwK+erRmflXWwMRdbMdWzO94guU2
 uOabnHeA0WJ6I2ab/91agveZ1X0ld5CVM+TXC6EjPUM9Ok9ZYawbb6W1AUwhhhoVi2
 5gQsd7ME8TsRcDYwVnINBHWJLIBM3qD9jNCzjz4k=
Date: Thu, 6 Jun 2019 19:50:01 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2 3/3] iio: imu: st_lsm6dsx: add i3c basic support for
 LSM6DSO and LSM6DSR
Message-ID: <20190606175000.GA12547@localhost.localdomain>
References: <cover.1559831663.git.vitor.soares@synopsys.com>
 <6195f3cd21636a5f85c0107b5c3b217be868a4b9.1559831663.git.vitor.soares@synopsys.com>
 <20190606192131.355c9556@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20190606192131.355c9556@collabora.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190606_105008_387925_359D4B74 
X-CRM114-Status: GOOD (  26.93  )
X-Mailman-Approved-At: Thu, 06 Jun 2019 11:54:30 -0700
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
Cc: Joao.Pinto@synopsys.com, rafael@kernel.org, linux-iio@vger.kernel.org,
 gregkh@linuxfoundation.org, bbrezillon@kernel.org,
 linux-kernel@vger.kernel.org, Vitor Soares <Vitor.Soares@synopsys.com>,
 broonie@kernel.org, linux-i2c@vger.kernel.org, lorenzo.bianconi83@gmail.com,
 linux-i3c@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============8663713655302429428=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============8663713655302429428==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Q68bSM7Ycu6FN28Q"
Content-Disposition: inline


--Q68bSM7Ycu6FN28Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Thu,  6 Jun 2019 17:12:04 +0200
> Vitor Soares <Vitor.Soares@synopsys.com> wrote:
>=20
> > For today the st_lsm6dsx driver support LSM6DSO and LSM6DSR sensor only=
 in
> > spi and i2c mode.
> >=20
> > The LSM6DSO and LSM6DSR are also i3c capable so lets give i3c support to
> > them.
> >=20
> > Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
> > ---
> > Changes in v2:
> >   Add support for LSM6DSR
> >   Set pm_ops to st_lsm6dsx_pm_ops
> >=20
> >  drivers/iio/imu/st_lsm6dsx/Kconfig          |  8 ++-
> >  drivers/iio/imu/st_lsm6dsx/Makefile         |  1 +
> >  drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c | 76 +++++++++++++++++++++=
++++++++
> >  3 files changed, 84 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c
> >=20
> > diff --git a/drivers/iio/imu/st_lsm6dsx/Kconfig b/drivers/iio/imu/st_ls=
m6dsx/Kconfig
> > index 002a423..8115936 100644
> > --- a/drivers/iio/imu/st_lsm6dsx/Kconfig
> > +++ b/drivers/iio/imu/st_lsm6dsx/Kconfig
> > @@ -2,11 +2,12 @@
> > =20
> >  config IIO_ST_LSM6DSX
> >  	tristate "ST_LSM6DSx driver for STM 6-axis IMU MEMS sensors"
> > -	depends on (I2C || SPI)
> > +	depends on (I2C || SPI || I3C)
> >  	select IIO_BUFFER
> >  	select IIO_KFIFO_BUF
> >  	select IIO_ST_LSM6DSX_I2C if (I2C)
> >  	select IIO_ST_LSM6DSX_SPI if (SPI_MASTER)
> > +	select IIO_ST_LSM6DSX_I3C if (I3C)
> >  	help
> >  	  Say yes here to build support for STMicroelectronics LSM6DSx imu
> >  	  sensor. Supported devices: lsm6ds3, lsm6ds3h, lsm6dsl, lsm6dsm,
> > @@ -24,3 +25,8 @@ config IIO_ST_LSM6DSX_SPI
> >  	tristate
> >  	depends on IIO_ST_LSM6DSX
> >  	select REGMAP_SPI
> > +
> > +config IIO_ST_LSM6DSX_I3C
> > +	tristate
> > +	depends on IIO_ST_LSM6DSX
> > +	select REGMAP_I3C
> > diff --git a/drivers/iio/imu/st_lsm6dsx/Makefile b/drivers/iio/imu/st_l=
sm6dsx/Makefile
> > index 28cc673..57cbcd6 100644
> > --- a/drivers/iio/imu/st_lsm6dsx/Makefile
> > +++ b/drivers/iio/imu/st_lsm6dsx/Makefile
> > @@ -5,3 +5,4 @@ st_lsm6dsx-y :=3D st_lsm6dsx_core.o st_lsm6dsx_buffer.o=
 \
> >  obj-$(CONFIG_IIO_ST_LSM6DSX) +=3D st_lsm6dsx.o
> >  obj-$(CONFIG_IIO_ST_LSM6DSX_I2C) +=3D st_lsm6dsx_i2c.o
> >  obj-$(CONFIG_IIO_ST_LSM6DSX_SPI) +=3D st_lsm6dsx_spi.o
> > +obj-$(CONFIG_IIO_ST_LSM6DSX_I3C) +=3D st_lsm6dsx_i3c.o
> > diff --git a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c b/drivers/iio/=
imu/st_lsm6dsx/st_lsm6dsx_i3c.c
> > new file mode 100644
> > index 0000000..70b70d1
> > --- /dev/null
> > +++ b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c
> > @@ -0,0 +1,76 @@
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
> > +#define NAME_SIZE	32
> > +
> > +struct st_lsm6dsx_i3c_data {
> > +	const char name[NAME_SIZE];
>=20
> I think I mentioned already that you can simply have
>=20
> 	const char *name;
>=20
> > +	enum st_lsm6dsx_hw_id id;
> > +};
> > +
> > +enum st_lsm6dsx_i3c_data_id {
> > +	ST_LSM6DSO_I3C_DATA_ID,
> > +	ST_LSM6DSR_I3C_DATA_ID,
> > +};
> > +
> > +static const struct st_lsm6dsx_i3c_data hw_data[] =3D {
> > +	{ ST_LSM6DSO_DEV_NAME, ST_LSM6DSO_ID },
> > +	{ ST_LSM6DSR_DEV_NAME, ST_LSM6DSR_ID },
> > +};
> > +
> > +static const struct regmap_config st_lsm6dsx_i3c_regmap_config =3D {
> > +	.reg_bits =3D 8,
> > +	.val_bits =3D 8,
> > +};
> > +
> > +static int st_lsm6dsx_i3c_probe(struct i3c_device *i3cdev)
> > +{
> > +	const struct i3c_device_id *id =3D i3c_get_device_id(i3cdev);
> > +	const struct st_lsm6dsx_i3c_data *hw_data =3D id->data;
> > +	struct regmap *regmap;
> > +
> > +	regmap =3D devm_regmap_init_i3c(i3cdev, &st_lsm6dsx_i3c_regmap_config=
);
> > +	if (IS_ERR(regmap)) {
> > +		dev_err(&i3cdev->dev, "Failed to register i3c regmap %d\n",
> > +			(int)PTR_ERR(regmap));
> > +		return PTR_ERR(regmap);
> > +	}
> > +
> > +	return st_lsm6dsx_probe(&i3cdev->dev, 0, hw_data->id,
> > +				hw_data->name, regmap);
> > +}
> > +
> > +static const struct i3c_device_id st_lsm6dsx_i3c_ids[] =3D {
> > +	I3C_DEVICE(0x0104, 0x006C, &hw_data[ST_LSM6DSO_I3C_DATA_ID]),
> > +	I3C_DEVICE(0x0104, 0x006B, &hw_data[ST_LSM6DSR_I3C_DATA_ID]),
>=20
> Still find that form counter-intuitive since you'd have to first go
> look at what's the value of ST_LSM6DSO_I3C_DATA_ID, then go check the
> entry in hw_data to find what's in there. Too many ways to get things
> wrong IMHO.
>=20
> The following form would make it much more obvious/easy to follow:
>=20
> static const st_lsm6dsx_i3c_data st_lsm6dso_i3c_data =3D {
> 	ST_LSM6DSO_DEV_NAME, ST_LSM6DSO_ID,
> };
>=20
> static const st_lsm6dsx_i3c_data st_lsm6dsr_i3c_data =3D {
> 	ST_LSM6DSR_DEV_NAME, ST_LSM6DSR_ID,
> };
>=20
> static const struct i3c_device_id st_lsm6dsx_i3c_ids[] =3D {
> 	I3C_DEVICE(0x0104, 0x006C, &st_lsm6dso_i3c_data),
> 	I3C_DEVICE(0x0104, 0x006B, &st_lsm6dsr_i3c_data),
> };
>=20
> Note that I don't see why we need to pass both the name and the ID to
> st_lsm6dsx_probe(). I'd expect the name to be easily deducible from the
> ID (using a name table whose index would match the ST_XXX_ID).

for spi/i2c we got it for free since spi_device_id/i2c_device_id has a name
field we can use but we can probably align it to i3c case

Regards,
Lorenzo

>=20
> If you do this change you would actually get rid of the
> st_lsm6dsx_i3c_data struct and instead have:
>=20
> static const struct i3c_device_id st_lsm6dsx_i3c_ids[] =3D {
> 	I3C_DEVICE(0x0104, 0x006C, (void *)ST_LSM6DSO_ID),
> 	I3C_DEVICE(0x0104, 0x006B, (void *)ST_LSM6DSR_ID),
> };
>=20
> > +	{ /* sentinel */ },
> > +};
> > +MODULE_DEVICE_TABLE(i3c, st_lsm6dsx_i3c_ids);
> > +
> > +static struct i3c_driver st_lsm6dsx_driver =3D {
> > +	.driver =3D {
> > +		.name =3D "st_lsm6dsx_i3c",
> > +		.pm =3D &st_lsm6dsx_pm_ops,
> > +	},
> > +	.probe =3D st_lsm6dsx_i3c_probe,
> > +	.id_table =3D st_lsm6dsx_i3c_ids,
> > +};
> > +module_i3c_driver(st_lsm6dsx_driver);
> > +
> > +MODULE_AUTHOR("Vitor Soares <vitor.soares@synopsys.com>");
> > +MODULE_DESCRIPTION("STMicroelectronics st_lsm6dsx i3c driver");
> > +MODULE_LICENSE("GPL v2");
>=20

--Q68bSM7Ycu6FN28Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCXPlSRQAKCRA6cBh0uS2t
rLEbAQDShUoAEBwugEIBvecd1NAaSnzEbNtUq9v4lIoGu7b2cQEAtDgn0/tqxTST
gXTU+GM/RiETHy0mQguQlbkgs5atkQc=
=eqnU
-----END PGP SIGNATURE-----

--Q68bSM7Ycu6FN28Q--


--===============8663713655302429428==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============8663713655302429428==--

