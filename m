Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B46510775FE
	for <linux-i3c@archiver.kernel.org>; Wed, 18 Mar 2026 18:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T1fpNslHp/LM+20xXPX9SNQP2zERy0u3XFjauwsCgDQ=; b=4aicd19i20a9fC
	GVGR5ulxHgrUARK46Duhi5FktZvjG2jBQoJAYEVmfBVw2KgK4tyP+yovpXnNbTcbfqk4OdKxYA15P
	Qkbb2hDUcmcgeBJUybxtS08P3O9fHP1nU1spv17D0vJbetx2L1idz5K+fogCwPh2aGB4DizEj/0Xs
	WOYjNskrzAr69I4PsFyWiUQ7RJA23W120uqwy7pvXN2S84j3X1cNcY2FFziH2Zb2AyRbjw4XntcPS
	CfcYEPvCnVQNseal2/dQXUmU5W4MWxTZJ03pNSoQSF3AwEm8K3Ab5tTUjBROsDeCylhwnplhUnMmX
	8GyQhMtdBdEA8jS68MMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2vUt-000000099hf-3KoY;
	Wed, 18 Mar 2026 18:19:59 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2vUp-000000099fZ-37zJ
	for linux-i3c@bombadil.infradead.org;
	Wed, 18 Mar 2026 18:19:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=GFiGghzPl6g8oEQeQrcO9TafT5x7gCN92iALR8Yy2dM=; b=fYCkmOhuyIeejGC9ETGCvAwX8b
	HMJDWNd6JNpqIqXydm+xrovoe2BENpkpoaTZbVEWcSpglGyDCsg9pYJKnvj3m5ynWumnSFGFkG4jq
	ATm/lJcSEyWc3vPtAJacPFPmvsMyDFmcG3cfMYFnhR1L3gMbOaTMx4bVExwUbGUp9O5ITuQe+A6AW
	k2ZkgqnGv7iaoskts0lXuARUlYmsWlXySQDY6VBCYDFgA792/bFX22gLuEElowA2MInSyNlHAsKJO
	yc9NrtyE0iEdHyUBKSSNIcV8BUHfknrzq97RWv2pGpjDg1MXs792eTTYhSoZ8FiquWmIAtS3QiCdX
	BhVYji8w==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2vUl-00000004os6-2Rck
	for linux-i3c@lists.infradead.org;
	Wed, 18 Mar 2026 18:19:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A7D46C5506C;
	Wed, 18 Mar 2026 18:20:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E1C1D6004F;
	Wed, 18 Mar 2026 18:19:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2878510450431;
	Wed, 18 Mar 2026 19:19:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773857982; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GFiGghzPl6g8oEQeQrcO9TafT5x7gCN92iALR8Yy2dM=;
	b=wC05hgGuVfa+8EvwpROQS7dqjARjeKaWIU113kVPpWKO9oJMZR7+p4+5qakt+7dNOXwT4Y
	5DnoW5/51sYHsUt67qtSiLOELpz0LbWYtNq1eu4fVCpGKQ6H/1t0Is4PMy5YWyuE783a7j
	LQ6shnjEo6aAPupfW+6MPI4Xq1QbP1evicCA6W18jltj/xHBBkMs8k1sxpMPX5/LhR0jDu
	YRrNoRzGBVtsGscmtlEpz9wGUVJD0neM+6vaOnJkRaC396auEzOO/ADgY2/2MlyIYZD2B1
	WYQ4YdXSQXv1ymLaqL15eMTElJc49798VPeRb9dxn+z1nWK5ClpPEz56vJ5JFA==
Date: Wed, 18 Mar 2026 19:19:36 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Robert Moore <robert.moore@intel.com>, Len Brown <lenb@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Eric Biggers <ebiggers@kernel.org>,
	Fredrik Markstrom <fredrik.markstrom@est.tech>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	Suresh Mangipudi <smangipudi@nvidia.com>,
	linux-tegra@vger.kernel.org, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 11/12] hwmon: spd5118: Add I3C support
Message-ID: <202603181819360a32c641@mail.local>
References: <20260318172820.13771-1-akhilrajeev@nvidia.com>
 <20260318172820.13771-12-akhilrajeev@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260318172820.13771-12-akhilrajeev@nvidia.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_181951_679955_A15A70CF 
X-CRM114-Status: GOOD (  26.87  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On 18/03/2026 22:57:24+0530, Akhil R wrote:
> Add a regmap config and a probe function to support for I3C based
> communication to SPD5118 devices.
> =

> On an I3C bus, SPD5118 are enumerated via SETAASA and always require an
> ACPI or device tree entry. The device matching is hence through the OF
> match tables only and do not need an I3C class match table. The device
> identity is verified in the type registers before proceeding to the
> common probe function.
> =

> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
>  drivers/hwmon/Kconfig   |  7 +++--
>  drivers/hwmon/spd5118.c | 66 ++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 70 insertions(+), 3 deletions(-)
> =

> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 8af80e17d25e..23604c05ad22 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -2300,10 +2300,13 @@ config SENSORS_SPD5118
>  	tristate "SPD5118 Compliant Temperature Sensors"
>  	depends on I2C

Please use I3C_OR_I2C here

>  	select REGMAP_I2C
> +	select REGMAP_I3C if I3C
>  	help
>  	  If you say yes here you get support for SPD5118 (JEDEC JESD300)
> -	  compliant temperature sensors. Such sensors are found on DDR5 memory
> -	  modules.
> +	  compliant temperature sensors using I2C or I3C bus interface.
> +	  Such sensors are found on DDR5 memory modules.
> +
> +	  This driver supports both I2C and I3C interfaces.
>  =

>  	  This driver can also be built as a module. If so, the module
>  	  will be called spd5118.
> diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
> index 5da44571b6a0..d70123e10616 100644
> --- a/drivers/hwmon/spd5118.c
> +++ b/drivers/hwmon/spd5118.c
> @@ -18,6 +18,7 @@
>  #include <linux/bits.h>
>  #include <linux/err.h>
>  #include <linux/i2c.h>
> +#include <linux/i3c/device.h>
>  #include <linux/hwmon.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> @@ -482,6 +483,25 @@ static const struct regmap_config spd5118_regmap16_c=
onfig =3D {
>  	.cache_type =3D REGCACHE_MAPLE,
>  };
>  =

> +/*
> + * I3C uses 2-byte register addressing -
> + *   Byte 1: MemReg | BlkAddr[0] | Address[5:0]
> + *   Byte 2: 0000   | BlkAddr[4:1]
> + *
> + * The low byte carries the register/NVM address and the high byte carri=
es the
> + * upper block address bits, so little-endian format is required. No ran=
ge
> + * config is needed since I3C does not use MR11 page switching.
> + */
> +static const struct regmap_config spd5118_regmap_i3c_config =3D {
> +	.reg_bits =3D 16,
> +	.val_bits =3D 8,
> +	.max_register =3D 0x7ff,
> +	.reg_format_endian =3D REGMAP_ENDIAN_LITTLE,
> +	.writeable_reg =3D spd5118_writeable_reg,
> +	.volatile_reg =3D spd5118_volatile_reg,
> +	.cache_type =3D REGCACHE_MAPLE,
> +};
> +
>  static int spd5118_suspend(struct device *dev)
>  {
>  	struct spd5118_data *data =3D dev_get_drvdata(dev);
> @@ -770,7 +790,51 @@ static struct i2c_driver spd5118_i2c_driver =3D {
>  	.address_list	=3D IS_ENABLED(CONFIG_SENSORS_SPD5118_DETECT) ? normal_i2=
c : NULL,
>  };
>  =

> -module_i2c_driver(spd5118_i2c_driver);
> +/* I3C */
> +
> +static int spd5118_i3c_probe(struct i3c_device *i3cdev)
> +{
> +	struct device *dev =3D i3cdev_to_dev(i3cdev);
> +	struct regmap *regmap;
> +	unsigned int regval;
> +	int err;
> +
> +	regmap =3D devm_regmap_init_i3c(i3cdev, &spd5118_regmap_i3c_config);
> +	if (IS_ERR(regmap))
> +		return dev_err_probe(dev, PTR_ERR(regmap), "regmap init failed\n");
> +
> +	/* Verify this is a SPD5118 device */
> +	err =3D regmap_read(regmap, SPD5118_REG_TYPE, &regval);
> +	if (err)
> +		return err;
> +
> +	if (regval !=3D 0x51) {
> +		dev_err(dev, "unexpected device type 0x%02x, expected 0x51\n", regval);
> +		return -ENODEV;
> +	}
> +
> +	err =3D regmap_read(regmap, SPD5118_REG_TYPE + 1, &regval);
> +	if (err)
> +		return err;
> +
> +	if (regval !=3D 0x18) {
> +		dev_err(dev, "unexpected device type 0x%02x, expected 0x18\n", regval);
> +		return -ENODEV;
> +	}
> +
> +	return spd5118_common_probe(dev, regmap, false);
> +}
> +
> +static struct i3c_driver spd5118_i3c_driver =3D {
> +	.driver =3D {
> +		.name	=3D "spd5118_i3c",
> +		.of_match_table =3D spd5118_of_ids,
> +		.pm =3D pm_sleep_ptr(&spd5118_pm_ops),
> +	},
> +	.probe		=3D spd5118_i3c_probe,
> +};
> +
> +module_i3c_i2c_driver(spd5118_i3c_driver, &spd5118_i2c_driver);
>  =

>  MODULE_AUTHOR("Ren=E9 Rebe <rene@exactcode.de>");
>  MODULE_AUTHOR("Guenter Roeck <linux@roeck-us.net>");
> -- =

> 2.50.1
> =


-- =

Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
