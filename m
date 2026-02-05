Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51EA8ECD999
	for <linux-i3c@archiver.kernel.org>; Thu,  5 Feb 2026 20:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u10FJftHqm+OZyJ7RebeV84ZnkLn098lhiQFh2Ea1/I=; b=dx3kn48MDCNWfe
	9RZ5oZueSYowsqxFP2WA54Wcj/ssbIrz+LLtXHQsjxTSgSJMoSYa0gCSpXxCjQ2c/UZbb2hUIkPwb
	WZTRRSYubdgz3SOYUBHZON2l34iQ3DpnAOKILl2dSQ5BZNtIi+L5gx84fd02C3QRlfDBpNGrasTqP
	hjuskuPHPSRy3bWvKPkjDukanOU7qFAeaat0UyDnI05B1NtBhifbd6JCovzDc3Pn3gEksWqF6XX/N
	GIRiE+RO343N1KbUXjUCITs3Bfu39n6JnT7VJpCZ7AhN7vI2aigtbBgOajpPka81VL9tBF0stINws
	jRkOHRzL0PTDYCW+hk9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo5hT-0000000AScH-1acu;
	Thu, 05 Feb 2026 20:11:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo5hS-0000000AScA-37MT
	for linux-i3c@lists.infradead.org;
	Thu, 05 Feb 2026 20:11:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A299E600AD;
	Thu,  5 Feb 2026 20:11:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A064C4CEF7;
	Thu,  5 Feb 2026 20:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770322297;
	bh=gekqAShyRuvBQ70OScUhtcb+pcqa6F/iTOcndq1RCqQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CRW4MRm5nF4wuvXyDII9FT73yPbbSWMIWjih9eQdHpW6nKwwDUpOCDJfl8ko6MAzJ
	 IFYZWFoATiMpJ3pdXXCyPTaP1qCKUUOfWbFGRC5pBN+LCge6jreE48SZWpv/aXTjuz
	 N+KsNgutufpAE8FB6duSHJ1/+bEHexidn90Imgksg8hv6uNrGi06hvjD6ZcG8kOg/V
	 zjbO1NGwGWAIvLFB2d0a8nWzMuF2aYBUaJ9jBEE+5WgVVQYrfNgI0KmGmblD85bNcx
	 6dn7xPV31jBPBt4h1MRhZn1UAdWHYtB3amJ5LzzgSH6EALgGIN+rNTBOLJoKSOBj5g
	 lfvv//diTw/Kg==
Date: Thu, 5 Feb 2026 20:11:26 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Arnd Bergmann <arnd@kernel.org>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, Jonathan
 Cameron <jonathan.cameron@huawei.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
 linux-iio@vger.kernel.org
Subject: Re: [PATCH] [v3, apply after -rc1] i3c: simplify combined i3c/i2c
 dependencies
Message-ID: <20260205201126.66995e9e@jic23-huawei>
In-Reply-To: <b2fdaf5f-62b3-4695-aa89-b674aabefffb@roeck-us.net>
References: <20260204164216.544409-1-arnd@kernel.org>
	<b2fdaf5f-62b3-4695-aa89-b674aabefffb@roeck-us.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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

On Wed, 4 Feb 2026 10:15:56 -0800
Guenter Roeck <linux@roeck-us.net> wrote:

> On 2/4/26 08:41, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> > 
> > All combined i2c/i3c drivers appear to suffer from the same link
> > time problem when CONFIG_I3C is set to 'm':
> > 
> > arm-linux-gnueabi-ld: drivers/iio/magnetometer/mmc5633.o: in function `mmc5633_i3c_driver_init':
> > mmc5633.c:(.init.text+0x30): undefined reference to `i3c_driver_register_with_owner'
> > 
> > This was previously fixed every time by marking individual
> > drivers as 'depends on I2C; depends on I3C || !I3C', but this gets
> > tedious and is somewhat confusing.
> > 
> > Add a Kconfig symbol 'I3C_OR_I2C' to help replace those dependencies,
> > and use this in all the existing drivers that had already fixed it
> > as well as the new mmc5633 driver.
> > 
> > Fixes: 6e5f6bf2e3f0 ("iio: magnetometer: Add mmc5633 sensor")

I think can drop the Fixes tag now given there is a fix in between for
the original issue.

> > Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>  
> 
> For hwmon:
> 
> Acked-by: Guenter Roeck <linux@roeck-us.net>

For IIO
Acked-by: Jonathan Cameron <jonathan.cameron@huawei.com>

Thanks!

Jonathan

> 
> > ---
> > v2: restore accidentally deleted lines
> > v3: rebase on top of Jonathan's IIO patch in linux-next
> > ---
> >   drivers/hwmon/Kconfig            |  6 ++----
> >   drivers/i3c/Kconfig              | 12 ++++++++++++
> >   drivers/iio/magnetometer/Kconfig |  3 +--
> >   drivers/misc/amd-sbi/Kconfig     |  3 +--
> >   4 files changed, 16 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> > index 41c381764c2b..ecfba861f66d 100644
> > --- a/drivers/hwmon/Kconfig
> > +++ b/drivers/hwmon/Kconfig
> > @@ -1493,8 +1493,7 @@ config SENSORS_LM73
> >   
> >   config SENSORS_LM75
> >   	tristate "National Semiconductor LM75 and compatibles"
> > -	depends on I2C
> > -	depends on I3C || !I3C
> > +	depends on I3C_OR_I2C
> >   	select REGMAP_I2C
> >   	select REGMAP_I3C if I3C
> >   	help
> > @@ -2392,8 +2391,7 @@ config SENSORS_TMP103
> >   
> >   config SENSORS_TMP108
> >   	tristate "Texas Instruments TMP108"
> > -	depends on I2C
> > -	depends on I3C || !I3C
> > +	depends on I3C_OR_I2C
> >   	select REGMAP_I2C
> >   	select REGMAP_I3C if I3C
> >   	help
> > diff --git a/drivers/i3c/Kconfig b/drivers/i3c/Kconfig
> > index 30a441506f61..626c54b386d5 100644
> > --- a/drivers/i3c/Kconfig
> > +++ b/drivers/i3c/Kconfig
> > @@ -22,3 +22,15 @@ menuconfig I3C
> >   if I3C
> >   source "drivers/i3c/master/Kconfig"
> >   endif # I3C
> > +
> > +config I3C_OR_I2C
> > +	tristate
> > +	default m if I3C=m
> > +	default I2C
> > +	help
> > +	  Device drivers using module_i3c_i2c_driver() can use either
> > +	  i2c or i3c hosts, but cannot be built-in for the kernel when
> > +	  CONFIG_I3C=m.
> > +
> > +	  Add 'depends on I2C_OR_I3C' in Kconfig for those drivers to
> > +	  get the correct dependencies.
> > diff --git a/drivers/iio/magnetometer/Kconfig b/drivers/iio/magnetometer/Kconfig
> > index 9345fb6d5317..fb313e591e85 100644
> > --- a/drivers/iio/magnetometer/Kconfig
> > +++ b/drivers/iio/magnetometer/Kconfig
> > @@ -143,8 +143,7 @@ config MMC5633
> >   	tristate "MEMSIC MMC5633 3-axis magnetic sensor"
> >   	select REGMAP_I2C
> >   	select REGMAP_I3C if I3C
> > -	depends on I2C
> > -	depends on I3C || !I3C
> > +	depends on I3C_OR_I2C
> >   	help
> >   	  Say yes here to build support for the MEMSIC MMC5633 3-axis
> >   	  magnetic sensor.
> > diff --git a/drivers/misc/amd-sbi/Kconfig b/drivers/misc/amd-sbi/Kconfig
> > index be022c71a90c..30e7fad7356c 100644
> > --- a/drivers/misc/amd-sbi/Kconfig
> > +++ b/drivers/misc/amd-sbi/Kconfig
> > @@ -1,10 +1,9 @@
> >   # SPDX-License-Identifier: GPL-2.0-only
> >   config AMD_SBRMI_I2C
> >   	tristate "AMD side band RMI support"
> > -	depends on I2C
> > +	depends on I3C_OR_I2C
> >   	depends on ARM || ARM64 || COMPILE_TEST
> >   	select REGMAP_I2C
> > -	depends on I3C || !I3C
> >   	select REGMAP_I3C if I3C
> >   	help
> >   	  Side band RMI over I2C/I3C support for AMD out of band management.  
> 
> 


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
