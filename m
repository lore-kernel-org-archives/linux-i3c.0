Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9612E7DF0F
	for <linux-i3c@archiver.kernel.org>; Mon,  2 Feb 2026 17:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4QI+3UWOnlMBixMV64TdgQZT26Q31VVdb5iQAskR0J0=; b=VTeV+KtyEjhzcG
	Pcl4EYK4ymtOoIQnkRdQD4udiPZSGN3le6UeHiGQ3LGMyqMPFwHg7UPMfPiAtulfQQJoTt39VL6ve
	zoj8gfBsSZKcrHWzVTc5GVXOjPTDD3obnyWyosHLMEdEqKwTxZL2PKvexFMKBwrwbr4hQoZ1DmRlL
	OkvS0avANwQ+woK9IuGo9khTtuwYXfA7q2v4CIutchpqUhp9mJH2uLzioX6CAzTI+5TkxFTiHnA8L
	Jg/iV/0oZkXsRuKwrne6Xn2AVEF4wV3dQUrEXnh5IIk2mNdB9U8nIKDqgWFdubAxZJ/h/ReJj3nMp
	k0fjeew9G5cNyc2s6+sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmy4m-00000005O6E-1Cme;
	Mon, 02 Feb 2026 17:51:06 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmy4j-00000005O5R-3Ikj
	for linux-i3c@lists.infradead.org;
	Mon, 02 Feb 2026 17:51:02 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-81f4e36512aso4436117b3a.3
        for <linux-i3c@lists.infradead.org>; Mon, 02 Feb 2026 09:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770054661; x=1770659461; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=IYzMM+PDFT0S0J7fPI3P9GPnIxCBaLx35Q93v5Nih6A=;
        b=ZVzp4W6/h1WisMomGbZYFh9iBT9o1Li9B0VFcGWdvG5zQj6XIIFfNJk6daaYgevdd/
         oR8ab6OjANhkRik7qJT4YIWpfJ9x3j2bDZBVtth3TFkA+JRMUrcQw8MlrFsf6GOdHoaN
         i6p2KQmusFo+ZqFHZTCHZo2cX7at8xYKEr0PUSFxtIemHwXps92SFVn/EIlN7jWVO5P/
         DGoZPQwVqqH7kVc4u7/AUkSaX2pmPIwnVhPMDSdYPq8HEOnXSqZB2F0lygLrxwcypL2d
         XkrjnP52SgyymvnYX1yZqT2PGhOms/3slq1fCetH34OJYnJE82fHTBs4Ovry6yVt3+9T
         xx6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770054661; x=1770659461;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IYzMM+PDFT0S0J7fPI3P9GPnIxCBaLx35Q93v5Nih6A=;
        b=ixsd+Dm5jdkM095pkBZjhyjEJ9u/ZAtyykapwH6wZ3gZfasdxsbVETivP/Ymb2+oIA
         YLlexBw5agEiSxKsBMhB4GLc4Arbst8b9tvdtdF6HAdnKzh1D3FRm3N1OqUhxvGY+ekb
         lsUuzHqgrkVEd22U6Tiq30OdMGKyPl1RjHUgsWzDy4zbSgOSc8b2xeQVmTO/Kuj2o/iU
         UYmO0PtW25vgHz2AbsTx4jqQp7+CJluS1Ro4lvd3XDJhD6f8kX1/EOe2qTZEdZOZMIU8
         gk4RxsZAfUqejgm37ZSXkOHXUoyupSmfr0UJb4C4kESZxQ5K/SKRIKxkWJd3rnlRfuPK
         DG4g==
X-Forwarded-Encrypted: i=1; AJvYcCUUBD2RqSYMfhEROSA0T4PQ6z5GqL6Eq6V49MqGci957plAAaCX89RpuU9blwOAovHWRSKXWFjCxBw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwNTsPQhKVzJvLvS7ajBC12MbOLBAkavlUcFHj+G49CRqJyat4S
	PcuAzz9r8iVwTNshF1+2seGG8WsQBPQjxsI4Ccz8H6G7YuBjTJXY1WY3
X-Gm-Gg: AZuq6aJL8QQ/hzVUyEBfI/rzvFwDRFNRhkNwsR7ZYHxtS+YsRMi8cww4R863XGuS+lP
	bHoA67mdNu4fHA3zHqcX7tRGrHUfCeOfLjNhRZ/HG2KD/LE0Q6TCd6AisdunY2MlJ/JH17Nv3a1
	WGyvb8tVe2qWDemxwMua8SeNYoB4pQsPKPTS0oE4WGGKso9ce3vpcLKtAupOQFg3BpJ4r6joX23
	zC8W+GJ2BMHuv/Ci/dNTTT9RtBwlNx3uZg4jxpWnofIE/W55PJ5vw1YzWo1JN3CiI0VvJm+o3P+
	k8zQS2hcO2CTlIL4II0PbZYh4met3+m/SLyLDIxZN+e2UiOsTWw538XDU41KieTY2/kwX1ko54N
	DcqAjps7Lz4RT/4Q2tWyUO7+6TRdReqUWJXuyVJ1wEQj3mkb9dcYfPGIqxXtUeIe6Iu6dHuY51t
	i4waG5hN3YA8fPd7e2bPzWBW09QrKArixdngh1k2Jd45Kcx26K8EczV7TzDK4mYdTJmxO0kKk=
X-Received: by 2002:a05:6a21:7748:b0:393:39a0:f1e5 with SMTP id adf61e73a8af0-39339a1024dmr2759691637.48.1770054660584;
        Mon, 02 Feb 2026 09:51:00 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c642b0b4c07sm14937334a12.36.2026.02.02.09.50.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 09:51:00 -0800 (PST)
Message-ID: <a8f8ee55-3c87-4e9c-a5a9-12929855b86f@roeck-us.net>
Date: Mon, 2 Feb 2026 09:50:58 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [v2] i3c, iio: fix i3c driver dependencies
To: Arnd Bergmann <arnd@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jonathan Cameron <jic23@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andy Shevchenko <andriy.shevchenko@intel.com>, Frank Li <Frank.Li@nxp.com>,
 Adrian Fluturel <fluturel.adrian@gmail.com>,
 Carlos Song <carlos.song@nxp.com>
Cc: David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Jean Delvare <jdelvare@suse.de>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
 linux-iio@vger.kernel.org
References: <20260202160543.3654499-1-arnd@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260202160543.3654499-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_095101_874163_DE26B17D 
X-CRM114-Status: GOOD (  23.04  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On 2/2/26 08:04, Arnd Bergmann wrote:
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
>   drivers/hwmon/Kconfig            |  6 ++----

For hwmon:

Acked-by: Guenter Roeck <linux@roeck-us.net>

>   drivers/i3c/Kconfig              | 12 ++++++++++++
>   drivers/iio/magnetometer/Kconfig |  2 +-
>   drivers/misc/amd-sbi/Kconfig     |  3 +--
>   4 files changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 41c381764c2b..ecfba861f66d 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1493,8 +1493,7 @@ config SENSORS_LM73
>   
>   config SENSORS_LM75
>   	tristate "National Semiconductor LM75 and compatibles"
> -	depends on I2C
> -	depends on I3C || !I3C
> +	depends on I3C_OR_I2C
>   	select REGMAP_I2C
>   	select REGMAP_I3C if I3C
>   	help
> @@ -2392,8 +2391,7 @@ config SENSORS_TMP103
>   
>   config SENSORS_TMP108
>   	tristate "Texas Instruments TMP108"
> -	depends on I2C
> -	depends on I3C || !I3C
> +	depends on I3C_OR_I2C
>   	select REGMAP_I2C
>   	select REGMAP_I3C if I3C
>   	help
> diff --git a/drivers/i3c/Kconfig b/drivers/i3c/Kconfig
> index 30a441506f61..626c54b386d5 100644
> --- a/drivers/i3c/Kconfig
> +++ b/drivers/i3c/Kconfig
> @@ -22,3 +22,15 @@ menuconfig I3C
>   if I3C
>   source "drivers/i3c/master/Kconfig"
>   endif # I3C
> +
> +config I3C_OR_I2C
> +	tristate
> +	default m if I3C=m
> +	default I2C
> +	help
> +	  Device drivers using module_i3c_i2c_driver() can use either
> +	  i2c or i3c hosts, but cannot be built-in for the kernel when
> +	  CONFIG_I3C=m.
> +
> +	  Add 'depends on I2C_OR_I3C' in Kconfig for those drivers to
> +	  get the correct dependencies.
> diff --git a/drivers/iio/magnetometer/Kconfig b/drivers/iio/magnetometer/Kconfig
> index 2b81b22c9550..448fef4e5716 100644
> --- a/drivers/iio/magnetometer/Kconfig
> +++ b/drivers/iio/magnetometer/Kconfig
> @@ -143,7 +143,7 @@ config MMC5633
>   	tristate "MEMSIC MMC5633 3-axis magnetic sensor"
>   	select REGMAP_I2C if I2C
>   	select REGMAP_I3C if I3C
> -	depends on I2C || I3C
> +	depends on I3C_OR_I2C
>   	help
>   	  Say yes here to build support for the MEMSIC MMC5633 3-axis
>   	  magnetic sensor.
> diff --git a/drivers/misc/amd-sbi/Kconfig b/drivers/misc/amd-sbi/Kconfig
> index be022c71a90c..30e7fad7356c 100644
> --- a/drivers/misc/amd-sbi/Kconfig
> +++ b/drivers/misc/amd-sbi/Kconfig
> @@ -1,10 +1,9 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   config AMD_SBRMI_I2C
>   	tristate "AMD side band RMI support"
> -	depends on I2C
> +	depends on I3C_OR_I2C
>   	depends on ARM || ARM64 || COMPILE_TEST
>   	select REGMAP_I2C
> -	depends on I3C || !I3C
>   	select REGMAP_I3C if I3C
>   	help
>   	  Side band RMI over I2C/I3C support for AMD out of band management.


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
