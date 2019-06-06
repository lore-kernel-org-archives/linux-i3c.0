Return-Path: <SRS0=CE6j=UF=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05EC6C46476
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Jun 2019 18:54:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9A2C2083D
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Jun 2019 18:54:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e7fK8J9V";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="BO9DcAvc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9A2C2083D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bVLRXfeHl4w8RtSvNc29w9dZkxvcGs/2o4Zru3MuziM=; b=e7fK8J9V9DrQUCnsqot5YzSon
	Hcw2Orpdh1V/WE8UI0br06VqoiynJdajyG37DXSL3R5ILR4mTqPjLLOWwRkG64wMiWEst4OqIcP3i
	R1ekh9cacM4NBf+P/62Z0/ana6CDvxJvE9yRkJDmsO18P5tGWfUc1YV/OKmArYILdqbxQ72v5ZKli
	fMlvdJXHARuqy4KRw7rWpS+0P8saLFO1v8hVSZMfswdlLdJBUES3Zhpt+nvIYhaYXibnGl34d6K5B
	7Jpgni5d6o8LBCxwJNtXS+C9v5Rdbeq3P+QDw37DPGAPZ53s46moY6Xy3ZJNbK84C7zTS8khJGuMt
	LNWO0iwfw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hYxWz-0000Av-70; Thu, 06 Jun 2019 18:54:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYviz-0008BP-Ud
 for linux-i3c@lists.infradead.org; Thu, 06 Jun 2019 16:58:52 +0000
Received: from localhost.localdomain (nat-pool-mxp-t.redhat.com
 [149.6.153.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0155E20693;
 Thu,  6 Jun 2019 16:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559840329;
 bh=YfQPguzAqsesPyTNbKdNkGI/9IVehUonN3ApIuvgM/o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BO9DcAvctY5CqhrOEHCKrQaw5dPq052snhzErz+eQQ3sarmxOJrJxPVSPJDGsTjoD
 Lvn4A0JWh9rX+Izwfj18tsW9Yk91iMgrOFiUiXyYqsa9kgqV9OSbDMra0sL7NKkItT
 MOd0UClPaAvU+xEuZqBTsYrA7cbqzyKPv2S5DIrI=
Date: Thu, 6 Jun 2019 18:58:43 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: [PATCH v2 3/3] iio: imu: st_lsm6dsx: add i3c basic support for
 LSM6DSO and LSM6DSR
Message-ID: <20190606165841.GA10356@localhost.localdomain>
References: <cover.1559831663.git.vitor.soares@synopsys.com>
 <6195f3cd21636a5f85c0107b5c3b217be868a4b9.1559831663.git.vitor.soares@synopsys.com>
MIME-Version: 1.0
In-Reply-To: <6195f3cd21636a5f85c0107b5c3b217be868a4b9.1559831663.git.vitor.soares@synopsys.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190606_095850_018222_8D40F88B 
X-CRM114-Status: GOOD (  19.64  )
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
 linux-kernel@vger.kernel.org, broonie@kernel.org, linux-i2c@vger.kernel.org,
 lorenzo.bianconi83@gmail.com, linux-i3c@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============3467876716178012450=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============3467876716178012450==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Content-Disposition: inline


--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> For today the st_lsm6dsx driver support LSM6DSO and LSM6DSR sensor only in
> spi and i2c mode.
>=20
> The LSM6DSO and LSM6DSR are also i3c capable so lets give i3c support to
> them.
>=20
> Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
> ---

Hi Vitor,

just a nit inline, but you can add my acked-by for st_lsm6dsx part in v3

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

Regards,
Lorenzo

> Changes in v2:
>   Add support for LSM6DSR
>   Set pm_ops to st_lsm6dsx_pm_ops
>=20
>  drivers/iio/imu/st_lsm6dsx/Kconfig          |  8 ++-
>  drivers/iio/imu/st_lsm6dsx/Makefile         |  1 +
>  drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c | 76 +++++++++++++++++++++++=
++++++
>  3 files changed, 84 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c
>=20
> diff --git a/drivers/iio/imu/st_lsm6dsx/Kconfig b/drivers/iio/imu/st_lsm6=
dsx/Kconfig
> index 002a423..8115936 100644
> --- a/drivers/iio/imu/st_lsm6dsx/Kconfig
> +++ b/drivers/iio/imu/st_lsm6dsx/Kconfig
> @@ -2,11 +2,12 @@
> =20
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
> @@ -24,3 +25,8 @@ config IIO_ST_LSM6DSX_SPI
>  	tristate
>  	depends on IIO_ST_LSM6DSX
>  	select REGMAP_SPI
> +

[...]

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
> +#define NAME_SIZE	32
> +
> +struct st_lsm6dsx_i3c_data {
> +	const char name[NAME_SIZE];
> +	enum st_lsm6dsx_hw_id id;
> +};
> +
> +enum st_lsm6dsx_i3c_data_id {
> +	ST_LSM6DSO_I3C_DATA_ID,
> +	ST_LSM6DSR_I3C_DATA_ID,
> +};

do we really need them? maybe just use hw_data[n] adding a comment to indic=
ate
the related sensor defining st_lsm6dsx_i3c_ids[]

> +
> +static const struct st_lsm6dsx_i3c_data hw_data[] =3D {
> +	{ ST_LSM6DSO_DEV_NAME, ST_LSM6DSO_ID },
> +	{ ST_LSM6DSR_DEV_NAME, ST_LSM6DSR_ID },
> +};
> +
> +static const struct regmap_config st_lsm6dsx_i3c_regmap_config =3D {
> +	.reg_bits =3D 8,
> +	.val_bits =3D 8,
> +};
> +
> +static int st_lsm6dsx_i3c_probe(struct i3c_device *i3cdev)
> +{
> +	const struct i3c_device_id *id =3D i3c_get_device_id(i3cdev);
> +	const struct st_lsm6dsx_i3c_data *hw_data =3D id->data;
> +	struct regmap *regmap;
> +
> +	regmap =3D devm_regmap_init_i3c(i3cdev, &st_lsm6dsx_i3c_regmap_config);
> +	if (IS_ERR(regmap)) {
> +		dev_err(&i3cdev->dev, "Failed to register i3c regmap %d\n",
> +			(int)PTR_ERR(regmap));
> +		return PTR_ERR(regmap);
> +	}
> +
> +	return st_lsm6dsx_probe(&i3cdev->dev, 0, hw_data->id,
> +				hw_data->name, regmap);
> +}
> +
> +static const struct i3c_device_id st_lsm6dsx_i3c_ids[] =3D {
> +	I3C_DEVICE(0x0104, 0x006C, &hw_data[ST_LSM6DSO_I3C_DATA_ID]),
> +	I3C_DEVICE(0x0104, 0x006B, &hw_data[ST_LSM6DSR_I3C_DATA_ID]),
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(i3c, st_lsm6dsx_i3c_ids);
> +
> +static struct i3c_driver st_lsm6dsx_driver =3D {
> +	.driver =3D {
> +		.name =3D "st_lsm6dsx_i3c",
> +		.pm =3D &st_lsm6dsx_pm_ops,
> +	},
> +	.probe =3D st_lsm6dsx_i3c_probe,
> +	.id_table =3D st_lsm6dsx_i3c_ids,
> +};
> +module_i3c_driver(st_lsm6dsx_driver);
> +
> +MODULE_AUTHOR("Vitor Soares <vitor.soares@synopsys.com>");
> +MODULE_DESCRIPTION("STMicroelectronics st_lsm6dsx i3c driver");
> +MODULE_LICENSE("GPL v2");
> --=20
> 2.7.4
>=20

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCXPlGPwAKCRA6cBh0uS2t
rPqMAP44h3ZeX39OaxRtCeAjFaVA461EPlzIZOpxST1c3RRKvwD/S/enVcgJjWIc
SSwRn2zrrKVUs7mYZsyKAcRBo9+Pvgs=
=G/Yz
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--


--===============3467876716178012450==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============3467876716178012450==--

