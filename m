Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B61E9D410
	for <linux-i3c@archiver.kernel.org>; Wed,  4 Feb 2026 16:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=URicy9sD6Yye4r+UO4RzmLBi7LQ3GLuAEA96WqAskak=; b=kEQbBk9voWtfNY
	xdzUsagt/K1pzNudb0RKUWWzzpyOX2M94KjUF0719MhVYc+s3NfQk2T3wyQudkWI6soLCySJBUrJq
	2MVZsw1/DTrh1dv7p8aeH944wi+39UaecSYsRmWfRAiItNUdbuPzz4ZtRQr2YTG6n74pWc/eno/S8
	d5E7suIDiS92YkW95klMfNejxfcjzczgs8BZqgfkG5wvbjSocCvAmJCDWaFbbldjDkDIuszv0Uuhp
	eG65Oi4hoWPwLqk+eFZB7oG00euy893Bdnhkxj7TBSy66X9Y21o+ouXkqxVlLeJ5QYvGd9goYMvPv
	ZlhfsqtbzvFdjeZmK4uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnfoq-00000008lPQ-009R;
	Wed, 04 Feb 2026 16:33:32 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnfom-00000008lOJ-2AZC
	for linux-i3c@lists.infradead.org;
	Wed, 04 Feb 2026 16:33:30 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 965D74E423F6;
	Wed,  4 Feb 2026 16:33:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6BAD560705;
	Wed,  4 Feb 2026 16:33:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9E592119A8891;
	Wed,  4 Feb 2026 17:33:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770222805; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=cqVQWuixltOR2U9WIWJOoLc/BjyLu9NBbrMspa4rCGU=;
	b=fNN5vJT6GYXuE+usfUrGPuq6WlhNansxsKVlr/3EUK3lGEeq6o4FFZTc8zD8RXbjz/XmpC
	NuvuUD/XcHlVXZlpdRVt7zgvOMS3dmqzHt6QThcvXyjuMSyCb1eLBpBEuY2x9oNBwVxEK5
	Tv6dY6eeymai5ZOEOFZKE8mnun5VYgbMsuIJyWsRe2ysxNGc8bJEuErqeqJfz8Dvz54HCP
	UmZdOj5teN7kC2cN/29BzS6l89IX+y3flBFyjyS99hNgp3FmjkAbR7t390yitYs/2voflL
	YMORvq5obidGxB4CC4Q2/MFXG1rWUnpaLSEoJysxk9Yt3dwxmYCzPvc7UDmi4Q==
Date: Wed, 4 Feb 2026 17:33:21 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Jonathan Cameron <jic23@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Frank Li <Frank.Li@nxp.com>,
	Adrian Fluturel <fluturel.adrian@gmail.com>,
	Carlos Song <carlos.song@nxp.com>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Jean Delvare <jdelvare@suse.de>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i3c@lists.infradead.org, linux-iio@vger.kernel.org
Subject: Re: [PATCH] [v2] i3c, iio: fix i3c driver dependencies
Message-ID: <20260204163321cfaa320e@mail.local>
References: <20260202160543.3654499-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260202160543.3654499-1-arnd@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_083328_690187_757C585D 
X-CRM114-Status: GOOD (  23.44  )
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

On 02/02/2026 17:04:46+0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> All combined i2c/i3c drivers appear to suffer from the same link
> time problem when CONFIG_I3C is set to 'm':
> 
> arm-linux-gnueabi-ld: drivers/iio/magnetometer/mmc5633.o: in function `mmc5633_i3c_driver_init':
> mmc5633.c:(.init.text+0x30): undefined reference to `i3c_driver_register_with_owner'
> 
> This was previously fixed several times by marking individual
> drivers as 'depends on I2C; depends on I3C || !I3C', but this gets
> tedious and is somewhat confusing.
> 
> Add a Kconfig symbol 'I3C_OR_I2C' to help replace those dependencies,
> and use this in all the existing drivers that had already fixed it
> as well as the new mmc5633 driver.
> 
> Fixes: 6e5f6bf2e3f0 ("iio: magnetometer: Add mmc5633 sensor")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v2: restore accidentally deleted lines
> ---
>  drivers/hwmon/Kconfig            |  6 ++----
>  drivers/i3c/Kconfig              | 12 ++++++++++++
>  drivers/iio/magnetometer/Kconfig |  2 +-
>  drivers/misc/amd-sbi/Kconfig     |  3 +--
>  4 files changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 41c381764c2b..ecfba861f66d 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1493,8 +1493,7 @@ config SENSORS_LM73
>  
>  config SENSORS_LM75
>  	tristate "National Semiconductor LM75 and compatibles"
> -	depends on I2C
> -	depends on I3C || !I3C
> +	depends on I3C_OR_I2C
>  	select REGMAP_I2C
>  	select REGMAP_I3C if I3C
>  	help
> @@ -2392,8 +2391,7 @@ config SENSORS_TMP103
>  
>  config SENSORS_TMP108
>  	tristate "Texas Instruments TMP108"
> -	depends on I2C
> -	depends on I3C || !I3C
> +	depends on I3C_OR_I2C
>  	select REGMAP_I2C
>  	select REGMAP_I3C if I3C
>  	help
> diff --git a/drivers/i3c/Kconfig b/drivers/i3c/Kconfig
> index 30a441506f61..626c54b386d5 100644
> --- a/drivers/i3c/Kconfig
> +++ b/drivers/i3c/Kconfig
> @@ -22,3 +22,15 @@ menuconfig I3C
>  if I3C
>  source "drivers/i3c/master/Kconfig"
>  endif # I3C
> +
> +config I3C_OR_I2C

I'm fine with this but I wanted to mention that we have RTC_I2C_AND_SPI
the "and" being because it is from the point of view of the device (the
device supports both bus) while we have I3C_OR_I2C, "or" being about the
bus (the device can be on any bus).

So I guess at some point we are going to need a combination of
I3C_OR_I2C and SPI and this may be weird to have both OR and AND.



-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
