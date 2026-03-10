Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0663FEA8550
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Mar 2026 09:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1TAoIhLvxsF6UMZYkvbo95VA37JXHNseBbeI0ClD0IQ=; b=1sd9DTVg4GQIyA
	Mmty6DuSogSkiZWImyD/AmqZjHqhhO/YLX4dbmSNWsKFNnv4kaqTLIm6zMjww+mp61rdEeEAxwDyk
	jCr7rQRJZUdSyl3PJ9E7fDndAmALyiez11PNjBgA3MB9jYGx90D26K2zIub3IiIGb6F00o8iGk7zu
	hc1K2C9sFhy5Co1hYSOxIzZB8PAkjoZloc767pq1IyNgIBH2ve3P21AzRMHMeH7mUZBMysWyPAwPV
	xeproLeQ2cbiKDmLEXf9R2mD31klYLVgPU6Jh5IqcHl/14WOG5iOrYDxx2xIbkiiZ5DIPr+9FYzKu
	Y2mBiDzjDYIZ+rldu5NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzt4b-000000092Sw-3FDZ;
	Tue, 10 Mar 2026 09:08:17 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzt4Z-000000092Rx-1R74
	for linux-i3c@lists.infradead.org;
	Tue, 10 Mar 2026 09:08:16 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4853e1ce427so19528045e9.3
        for <linux-i3c@lists.infradead.org>; Tue, 10 Mar 2026 02:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773133693; x=1773738493; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+FnCkCWYP7bCBRmbZ74BO4qxUQPGxQbMvawa68kFQD0=;
        b=CE1TyRVmEh9O4aexQ5KCEllei8+TRgSWi0PPtMprPfbXjOcXt46N58NXoaeFosRYoF
         1tJv85Pf8AnDdBq+5wwRY4iCeK4WB9kN1uyzoor/DFTxI2DadwfqfZtrSW8ju7hdACpY
         UrScB8dkHgJXxRDRafNmNZVyWiSwcerh5uf0X04NHV94nQlWcrahXqOHYo0aAkJSUfD+
         cP0ci/mC16tW9kZ09qc0bLujaoh5Gr7NU2yEuficcghs3Sg5FLtMqGRgBwXCfTnR6XOg
         11lnqpQFpzFOcsr17wvesnQG9Z/SY/OtjksKu4GtfdBAJ5brExxN/YI1lpn2LdW6X5Jg
         rqEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773133693; x=1773738493;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+FnCkCWYP7bCBRmbZ74BO4qxUQPGxQbMvawa68kFQD0=;
        b=YqpdDJVIS+26mk0pmpsntUeCLPRRJqynkKmcMYyX8UP+c11PhtE8xu+jBT3vUUJY47
         yB195JFOFhvQ133I4NL4oVVAYplBMY8xkiIJmffZxrlOha5jaHc3Yim2ckZVjsfdC4aB
         +uEcX0THgwSM4qTlgPfFRAciYlTwP3iTBlwVGJIjqlpMSqaUMkoZufI8Ldtd6kM6QHPJ
         IF7IzaZuGJG+hIJM87AmQ8DTgTdbMT4uB3YkygGPZmlKBMsdHHyvTQfhUEhouCSvqEqB
         Va4WS8F3wHMNqctYQHw/RG8AKQWfLW6J999FlhDX5Y6tnCcbMS37PZv7tSAGt7BMtzH7
         NNew==
X-Forwarded-Encrypted: i=1; AJvYcCWO3Y3c8QLw6JyP1+70Pxd/AzEGc1y+Floty5YHA/5BS8g8E6++pea1sGEztG8/vYDvvjUT/GV38lY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/1K4+A1scBfMroJxLjAvT95uDtrYhEx3g4DFzWqxkqRkMdEct
	u4k0qmWhwnYiDMVo4bsVQ4WQGSVW8ArNG6Soc37FSHUgYx0VVQzPIODs
X-Gm-Gg: ATEYQzz/0bWa8w6z/55/W4xJt/PPjdox3M/EVCRcP3JOLLBzGZS/Cz4pHzRj/RbNEdT
	pAygn2Ka2Eaan7hJKP1+TweuCGvSebPA4WKJK/Q4L5l7XstYB5/V4y5T0dCjYydxTqAtERD/T7d
	ayoErgDPJd+TcMgs8gY+/Phbjyyx8VKQLkm6NSJNsc0DSk6PHVFXcYAKd2f2MnJBvlG9KsblIOj
	hzNEaPu/a2Bm9B38P05wKXKsfsC/gfkpcTpAYLlzeufO78snI2tzHNDhNlV9Flip4ZK7m6yvUQg
	I1g2uEE1mTuJEsYTOmxT8LpB9m7Nad0OD52+52o0ECoENw7LqqiMsap1wE5gEDX6ddknX16oZIk
	yoqBEaV/zdNx3pd7gDLkt0ZHqfpdaPoLktBZpo5nOWRoVaTpwowwIejVNgQK4jpDnPAVGKIqjlb
	haj1tksFQk0EUlcuAWCrg3/9y/cXpXTMiOmx9RnQTIUtibXzL+b+S09pZUkoYYNZgifwj4iS1CU
	gsjn2IKNVFesQRKv9oTBaoK038Ly/LIbajrtOEhYtasxyFs1ol7k9yHglUKbJQMYQ==
X-Received: by 2002:a05:600c:1e86:b0:483:5310:dc67 with SMTP id 5b1f17b1804b1-4852695b81cmr240917065e9.20.1773133692873;
        Tue, 10 Mar 2026 02:08:12 -0700 (PDT)
Received: from HYB-DlYm71t3hSl.ad.analog.com ([137.71.226.102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48543a40efesm13873675e9.24.2026.03.10.02.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 02:08:12 -0700 (PDT)
Date: Tue, 10 Mar 2026 10:08:09 +0100
From: Jorge Marques <gastmaier@gmail.com>
To: Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org, 
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, broonie@kernel.org, lee@kernel.org, Frank.Li@nxp.com, 
	lgirdwood@gmail.com, vikash.bansal@nxp.com, priyanka.jain@nxp.com, 
	aman.kumarpandey@nxp.com
Subject: Re: [PATCH v6 4/7] mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c hub
 and on-die regulator
Message-ID: <jceqgjsppjtxrayvexznjxu7aedm6w3nvc6xdifet4uo4n35xj@lb3jxtfdo7rp>
References: <20260310065727.3759342-1-lakshay.piplani@nxp.com>
 <20260310065727.3759342-4-lakshay.piplani@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260310065727.3759342-4-lakshay.piplani@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_020815_431446_54D65351 
X-CRM114-Status: GOOD (  32.57  )
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

On Tue, Mar 10, 2026 at 12:27:24PM +0530, Lakshay Piplani wrote:
> From: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> 
> Add core MFD support for the NXP P3H2x4x (P3H2440/P3H2441/P3H2840/P3H2841)
> family of multiport I3C hub devices. These devices connect to a host via
> I3C/I2C/SMBus and expose multiple downstream target ports.
> 
> Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
> 
> ---
> Changes in v6:
>  - No change
> 
> Changes in v5:
>  - Corrected the ordering in the Makefile and Kconfig for MFD_P3H2X4X
>  - Updated dev_err_probe() for regmap_init failure.
>  - Updated module description
> 
> Changes in v4:
>  - Split the driver into three separate patches(mfd, regulator and I3C hub)
>  - Added support for NXP P3H2x4x MFD functionality
> ---
> ---
>  MAINTAINERS                 |   2 +
>  drivers/mfd/Kconfig         |  12 ++++
>  drivers/mfd/Makefile        |   1 +
>  drivers/mfd/p3h2840.c       | 126 ++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/p3h2840.h |  28 ++++++++
>  5 files changed, 169 insertions(+)
>  create mode 100644 drivers/mfd/p3h2840.c
>  create mode 100644 include/linux/mfd/p3h2840.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 06b803d6f45d..cc33c6c300e4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19114,6 +19114,8 @@ L:	linux-kernel@vger.kernel.org
>  L:	linux-i3c-owner@lists.infradead.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
> +F:	drivers/mfd/p3h2840.c
> +F:	include/linux/mfd/p3h2840.h
>  
>  NXP PF5300/PF5301/PF5302 PMIC REGULATOR DEVICE DRIVER
>  M:	Woodrow Douglass <wdouglass@carnegierobotics.com>
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 7192c9d1d268..645a8e4e62b6 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -617,6 +617,18 @@ config MFD_MX25_TSADC
>  	  i.MX25 processors. They consist of a conversion queue for general
>  	  purpose ADC and a queue for Touchscreens.
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
Hi Aman, our CI/CD is failing with

  arm-linux-ld: drivers/mfd/p3h2840.o: in function `p3h2x4x_device_probe_i2c':
  P3h2840.c:(.text+0x40): undefined reference to `__devm_regmap_init_i2c'

And indeed

  $ find . -name 'regmap*.o'
    ./drivers/base/regmap/regmap.o
    ./drivers/base/regmap/regmap-i3c.o

It infers the systems based on the KConfig+Makefile
I suggest adding select REGMAP_I2C, since your driver does call i2c
regmap methods (line 67), outside the regmap i3c umbrella.

Also, which drivers must be enabled to use the functionality?

Thanks,
Jorge

>  config MFD_PF1550
>  	tristate "NXP PF1550 PMIC Support"
>  	depends on I2C=y && OF
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index e75e8045c28a..aaadf50fedf4 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -122,6 +122,7 @@ obj-$(CONFIG_MFD_MC13XXX)	+= mc13xxx-core.o
>  obj-$(CONFIG_MFD_MC13XXX_SPI)	+= mc13xxx-spi.o
>  obj-$(CONFIG_MFD_MC13XXX_I2C)	+= mc13xxx-i2c.o
>  
> +obj-$(CONFIG_MFD_P3H2X4X) 	+= p3h2840.o
>  obj-$(CONFIG_MFD_PF1550)	+= pf1550.o
>  
>  obj-$(CONFIG_MFD_NCT6694)	+= nct6694.o
> diff --git a/drivers/mfd/p3h2840.c b/drivers/mfd/p3h2840.c
> new file mode 100644
> index 000000000000..774fbb67b025
> --- /dev/null
> +++ b/drivers/mfd/p3h2840.c
> @@ -0,0 +1,126 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2025 NXP
> + * P3H2x4x i3c hub and regulator device.
> + */
> +
> +#include <linux/i3c/master.h>
> +#include <linux/i2c.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/p3h2840.h>
> +#include <linux/regmap.h>
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
> +	if (IS_ERR(p3h2x4x->regmap))
> +		return dev_err_probe(&i3cdev->dev, PTR_ERR(p3h2x4x->regmap),
> +				     "Failed to register I3C HUB regmap\n");
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
> +	if (IS_ERR(p3h2x4x->regmap))
> +		return dev_err_probe(&client->dev, PTR_ERR(p3h2x4x->regmap),
> +				     "Failed to register I3C HUB regmap\n");
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
> +}
> +
> +/* p3h2x4x ids (i3c) */
> +static const struct i3c_device_id p3h2x4x_i3c_ids[] = {
> +	I3C_CLASS(I3C_DCR_HUB, NULL),
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(i3c, p3h2x4x_i3c_ids);
> +
> +/* p3h2x4x ids (i2c) */
> +static const struct i2c_device_id p3h2x4x_i2c_id_table[] = {
> +	{ "nxp-i3c-hub" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(i2c, p3h2x4x_i2c_id_table);
> +
> +static const struct of_device_id  p3h2x4x_i2c_of_match[] = {
> +	{ .compatible = "nxp,p3h2840", },
> +	{ /* sentinel */ }
> +};
> +
> +MODULE_DEVICE_TABLE(of, p3h2x4x_i2c_of_match);
> +static struct i3c_driver p3h2x4x_i3c = {
> +	.driver = {
> +		.name = "p3h2x4x_i3c_drv",
> +	},
> +	.probe = p3h2x4x_device_probe_i3c,
> +	.id_table = p3h2x4x_i3c_ids,
> +};
> +
> +static struct i2c_driver p3h2x4x_i2c = {
> +	.driver = {
> +		.name = "p3h2x4x_i2c_drv",
> +		.of_match_table = p3h2x4x_i2c_of_match,
> +	},
> +	.probe =  p3h2x4x_device_probe_i2c,
> +	.id_table = p3h2x4x_i2c_id_table,
> +};
> +
> +module_i3c_i2c_driver(p3h2x4x_i3c, &p3h2x4x_i2c);
> +
> +MODULE_AUTHOR("Aman Kumar Pandey <aman.kumarpandey@nxp.com>");
> +MODULE_AUTHOR("Vikash Bansal <vikash.bansal@nxp.com>");
> +MODULE_DESCRIPTION("P3H2x4x I3C HUB multi function driver");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/mfd/p3h2840.h b/include/linux/mfd/p3h2840.h
> new file mode 100644
> index 000000000000..9ed2a0d0564e
> --- /dev/null
> +++ b/include/linux/mfd/p3h2840.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright 2025 NXP
> + * This header file contain private Reg address and its bit mapping etc.
> + */
> +
> +#ifndef _LINUX_MFD_P3H2840_H
> +#define _LINUX_MFD_P3H2840_H
> +
> +#include <linux/types.h>
> +
> +/* Device Configuration Registers */
> +#define P3H2x4x_DEV_REG_PROTECTION_CODE				0x10
> +#define P3H2x4x_REGISTERS_LOCK_CODE				0x00
> +#define P3H2x4x_REGISTERS_UNLOCK_CODE				0x69
> +#define P3H2x4x_CP1_REGISTERS_UNLOCK_CODE			0x6a
> +
> +/* Reg config for Regmap */
> +#define P3H2x4x_REG_BITS					8
> +#define P3H2x4x_VAL_BITS					8
> +
> +struct p3h2x4x_dev {
> +	struct i3c_device *i3cdev;
> +	struct i2c_client *i2c_client;
> +	struct regmap *regmap;
> +	bool is_p3h2x4x_in_i3c;
> +};
> +#endif /* _LINUX_MFD_P3H2840_H */
> -- 
> 2.25.1
> 

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
