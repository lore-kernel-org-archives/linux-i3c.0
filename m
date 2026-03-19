Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDAE51091909
	for <linux-i3c@archiver.kernel.org>; Thu, 19 Mar 2026 18:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bB/yKSC9PFHJS8fHxaZV3Rcd6kEMD+h/g6LUzccTvis=; b=2HRzkTURf6pzN3
	nfbNYpU/G61RUVMXnOIb8NhP4CqVT48evbD+WSZD49coQdwh3lVbwfVF3Q6dxf1xeyOe0roe8ORO2
	9VECvWuFkwoJ5GjvnKgNEGtjdwQ8k44veu2d9cW9BVa2fshPjCekVqZ7yv6f/ybIgNEILwd6hSvZx
	VXGQ7SnLo0WKq/bVXr3S+BV1vW+81lerjjN9zYDyjocSZINKCfvumTaTWLdO5NCmhmv+TqPBxxWeP
	FRHcITiTZxkR53TdQgZp/2Frz5PioBtRruBFLg+WQ0nqEpXnz9pAJ/nX8qZlWDNXPD7njvq9TTn27
	Q5IV4M3jIrGlsChKvrQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Hwx-0000000BIFD-2n77;
	Thu, 19 Mar 2026 18:18:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Hww-0000000BIEh-3GcM
	for linux-i3c@bombadil.infradead.org;
	Thu, 19 Mar 2026 18:18:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=1vPUKgYITPtV5efaod4XQSqJVTqQ2Kq4WAF8AXorjoc=; b=YF71v6G330qQVvIzXLHT8DH8r8
	ABilX9hZ5CKPTK3LHkw5kT78zPukhtgeDK28c/z619UEUjz0gOu21VMLKtFpUBQeougfNE0iqlT7g
	Lb5sCkvnJjG+5C8Q+vuETQzq9uAvObGOQsSkbfS+DC4Vqt46dxaIpuHEwL4ScJooiipCaii9ZRPVe
	KcnrF0mEjkKiOaqjNHqy6bJqF7JK4oTzQM0jHC0q7oYvyQGjCFCmxY1Z0sp6fkHjvXf3bGYL7V88I
	W0Oqlk5Geyyzx4k9rtgEU0Yerrnkwk5DjElhOVWSQWf3/SdniSI+NdtZiWBT3Vjc2hTbeRFWpdG3m
	nd4sXs9Q==;
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Hws-0000000EDJr-0bJN
	for linux-i3c@lists.infradead.org;
	Thu, 19 Mar 2026 18:18:24 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2ad617d5b80so8103545ad.1
        for <linux-i3c@lists.infradead.org>; Thu, 19 Mar 2026 11:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773944299; x=1774549099; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=1vPUKgYITPtV5efaod4XQSqJVTqQ2Kq4WAF8AXorjoc=;
        b=OLKop+/AgYCIO3fGlb65oTPJ05pK0Uaj4k0o0qB4sJyXdHDc+FHT0YROlsZNft2708
         ovg2s4kqT60gxMlJ3sA55C+5qwwe8LO9bF4dKspebRRnny1MC5imx+jJtNvSzqM5JY6O
         9bEJRIOV0/CfASZGABMOLZ4u84fo3voLywZnzvUWkJQbakPSQEICT70cbHDwBIO3Xm61
         vsy1w9TlZk/aiq92/Vk/Xu22z2Y3l3wi+lUuoqHSSCC4mdHdyXyocU9ywdWVEJRQPKAa
         Yv68iH7MRzue1Y4tiQgIup59hde2HKKvAd3jMC+VijFC96A2Ynp2+hZvnLhmnPeymj7N
         bpvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773944299; x=1774549099;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1vPUKgYITPtV5efaod4XQSqJVTqQ2Kq4WAF8AXorjoc=;
        b=X3c0EYKcDKVTdKny0rGX7Atpb6VQnxAt26+v9eHQtmSDcKelMRoja2opm3OKT4GZXE
         GhqmQu+OwTL6Dc7zeZH7l0fte/qO6FChYyadcOMBtOezExfmQPI+jsfmLU7XglGuPBlT
         6zt7/xtJ0NMiVo+KzsjXHY882qEQ3EZAXN/8mx2fsU2N77DqwkoFlIzFEYb3pRNKPdwK
         ZJL9Wt7WjqUu/zTnfaDD3JPh69RpNLTRl5YOVbtjVYZcOs6wVYF/vYL53NQx024rESYS
         If7960eI/kuYIft2nIhoxVAdmeam49q375jJfe4FFu+c2nothjCGMUoILWrVVHVH3VAN
         q8FA==
X-Forwarded-Encrypted: i=1; AJvYcCUV8fjLt3UG5GZ6fi8awLS7ChNDbLKM+jaHuahb03W4SRRaud+yx9JbnVgdskB6tmuXO0ZlZoQFiJg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1codaXHgmfoepjnUIeukA15dKR6i//ExmyFDJEaPwxrgPy8EM
	QNk0J/cBw+07a1s01S41Bs6BtHAYGX9jfOHMfLaszpPgCZR2e/RCa3wn
X-Gm-Gg: ATEYQzwfCBi+1vasZkuoU7aTFtc+ppHYLfsVHniGA+Ok0WVMxX3/rlTq7RzYqVvOcLe
	LjXdgz/JWtgakp+Kq6geeJ2LJPuPLo3zpUAEoBiW1jZJ37hv3ZukJVZNJmtq2ifBE6l+K8fxeS8
	zS5Thpa02O9G0ixiYDuDXRjmec9FLw4dDIqLcmHOQI4e+XsBNEfaPt42c8wEO15atXFJ0UvjPvI
	l42fES6k+7kzrCqsyTxYuOjbcZW+qD7FLzK9y8OrfY7WMiABzPSM6yYbYRaelnlGL/9ocCLucHe
	JbeOmLfg0bFt65jeQZ0ZJ8mw2Dz5Usal4tptr2TRF5MUPG7e0rwoGOCfeAAYO8V9ttk0hJ3fej7
	eKam8KdKpOZ5eG7JFfuUJ6eJZFBe0nWoDsauTNQNKqKoFz61ImwQEY4vl0yJMz8UxBddJpWXj90
	jEfS7fHgmVKLFxBwMUHqXxEom/VXdmbLJaJhb6BlZ5pJt/H235x2zXjjo0QiOFMlyYd68W6ELAf
	U35f61wD28=
X-Received: by 2002:a17:902:da8b:b0:2b0:7a50:887c with SMTP id d9443c01a7336-2b082819356mr2189405ad.50.1773944299366;
        Thu, 19 Mar 2026 11:18:19 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e61119bsm62450855ad.64.2026.03.19.11.18.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 11:18:18 -0700 (PDT)
Message-ID: <ae1bba2a-5015-480f-9610-d1be5a6d7211@roeck-us.net>
Date: Thu, 19 Mar 2026 11:18:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/12] hwmon: spd5118: Add I3C support
To: Akhil R <akhilrajeev@nvidia.com>
Cc: Frank.Li@nxp.com, acpica-devel@lists.linux.dev,
 alexandre.belloni@bootlin.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, ebiggers@kernel.org, fredrik.markstrom@est.tech,
 jonathanh@nvidia.com, krzk+dt@kernel.org, lenb@kernel.org,
 linux-acpi@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, miquel.raynal@bootlin.com,
 p.zabel@pengutronix.de, rafael@kernel.org, robert.moore@intel.com,
 robh@kernel.org, smangipudi@nvidia.com, thierry.reding@kernel.org
References: <7cc8ab1f-6c9a-4e3f-a1bc-266e020d8179@roeck-us.net>
 <20260319175533.19480-1-akhilrajeev@nvidia.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260319175533.19480-1-akhilrajeev@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_181822_362532_A4022782 
X-CRM114-Status: GOOD (  30.65  )
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

On 3/19/26 10:55, Akhil R wrote:
> On Thu, 19 Mar 2026 07:34:18 -0700, Guenter Roeck wrote:
>> On 3/18/26 21:35, Akhil R wrote:
>>> On Wed, 18 Mar 2026 11:53:49 -0700, Guenter Roeck wrote:
>>>> On 3/18/26 10:27, Akhil R wrote:
>>>>> Add a regmap config and a probe function to support for I3C based
>>>>> communication to SPD5118 devices.
>>>>>
>>>>> On an I3C bus, SPD5118 are enumerated via SETAASA and always require an
>>>>> ACPI or device tree entry. The device matching is hence through the OF
>>>>> match tables only and do not need an I3C class match table. The device
>>>>> identity is verified in the type registers before proceeding to the
>>>>> common probe function.
>>>>>
>>>>> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
>>>>> ---
>>>>>     drivers/hwmon/Kconfig   |  7 +++--
>>>>>     drivers/hwmon/spd5118.c | 66 ++++++++++++++++++++++++++++++++++++++++-
>>>>>     2 files changed, 70 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
>>>>> index 8af80e17d25e..23604c05ad22 100644
>>>>> --- a/drivers/hwmon/Kconfig
>>>>> +++ b/drivers/hwmon/Kconfig
>>>>> @@ -2300,10 +2300,13 @@ config SENSORS_SPD5118
>>>>>     	tristate "SPD5118 Compliant Temperature Sensors"
>>>>>     	depends on I2C
>>>>>     	select REGMAP_I2C
>>>>
>>>> I also had
>>>> 	depends on I3C || I3C=n
>>>> in my version at
>>>>
>>>> https://patchwork.kernel.org/project/linux-hwmon/patch/20250419161356.2528986-6-linux@roeck-us.net/
>>>>
>>>> which I guess matches the more recent "depends on I3C_OR_I2C".
>>>
>>> Ack. Will update.
>>>
>>>>
>>>>> +	select REGMAP_I3C if I3C
>>>>>     	help
>>>>>     	  If you say yes here you get support for SPD5118 (JEDEC JESD300)
>>>>> -	  compliant temperature sensors. Such sensors are found on DDR5 memory
>>>>> -	  modules.
>>>>> +	  compliant temperature sensors using I2C or I3C bus interface.
>>>>> +	  Such sensors are found on DDR5 memory modules.
>>>>> +
>>>>> +	  This driver supports both I2C and I3C interfaces.
>>>>>     
>>>>>     	  This driver can also be built as a module. If so, the module
>>>>>     	  will be called spd5118.
>>>>> diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
>>>>> index 5da44571b6a0..d70123e10616 100644
>>>>> --- a/drivers/hwmon/spd5118.c
>>>>> +++ b/drivers/hwmon/spd5118.c
>>>>> @@ -18,6 +18,7 @@
>>>>>     #include <linux/bits.h>
>>>>>     #include <linux/err.h>
>>>>>     #include <linux/i2c.h>
>>>>> +#include <linux/i3c/device.h>
>>>>>     #include <linux/hwmon.h>
>>>>>     #include <linux/module.h>
>>>>>     #include <linux/mutex.h>
>>>>> @@ -482,6 +483,25 @@ static const struct regmap_config spd5118_regmap16_config = {
>>>>>     	.cache_type = REGCACHE_MAPLE,
>>>>>     };
>>>>>     
>>>>> +/*
>>>>> + * I3C uses 2-byte register addressing -
>>>>> + *   Byte 1: MemReg | BlkAddr[0] | Address[5:0]
>>>>> + *   Byte 2: 0000   | BlkAddr[4:1]
>>>>> + *
>>>>> + * The low byte carries the register/NVM address and the high byte carries the
>>>>> + * upper block address bits, so little-endian format is required. No range
>>>>> + * config is needed since I3C does not use MR11 page switching.
>>>>> + */
>>>>> +static const struct regmap_config spd5118_regmap_i3c_config = {
>>>>> +	.reg_bits = 16,
>>>>> +	.val_bits = 8,
>>>>> +	.max_register = 0x7ff,
>>>>> +	.reg_format_endian = REGMAP_ENDIAN_LITTLE,
>>>>
>>>> Should this be added to spd5118_regmap16_config instead, or is there reason
>>>> to assume that I2C 16-bit addressing differs from I3C addressing ?
>>>
>>> I did not see any difference for I2C in the specification, but I assumed the
>>> existing format would have been working and I thought not to change them.
>>> Changing the I2C format would also require a change in the is_16bit nvmem_read
>>> formula.
>>>
>>>>
>>>>> +	.writeable_reg = spd5118_writeable_reg,
>>>>> +	.volatile_reg = spd5118_volatile_reg,
>>>>> +	.cache_type = REGCACHE_MAPLE,
>>>>> +};
>>>>> +
>>>>>     static int spd5118_suspend(struct device *dev)
>>>>>     {
>>>>>     	struct spd5118_data *data = dev_get_drvdata(dev);
>>>>> @@ -770,7 +790,51 @@ static struct i2c_driver spd5118_i2c_driver = {
>>>>>     	.address_list	= IS_ENABLED(CONFIG_SENSORS_SPD5118_DETECT) ? normal_i2c : NULL,
>>>>>     };
>>>>>     
>>>>> -module_i2c_driver(spd5118_i2c_driver);
>>>>> +/* I3C */
>>>>> +
>>>>> +static int spd5118_i3c_probe(struct i3c_device *i3cdev)
>>>>> +{
>>>>> +	struct device *dev = i3cdev_to_dev(i3cdev);
>>>>> +	struct regmap *regmap;
>>>>> +	unsigned int regval;
>>>>> +	int err;
>>>>> +
>>>>> +	regmap = devm_regmap_init_i3c(i3cdev, &spd5118_regmap_i3c_config);
>>>>> +	if (IS_ERR(regmap))
>>>>> +		return dev_err_probe(dev, PTR_ERR(regmap), "regmap init failed\n");
>>>>> +
>>>>> +	/* Verify this is a SPD5118 device */
>>>>> +	err = regmap_read(regmap, SPD5118_REG_TYPE, &regval);
>>>>> +	if (err)
>>>>> +		return err;
>>>>> +
>>>>> +	if (regval != 0x51) {
>>>>> +		dev_err(dev, "unexpected device type 0x%02x, expected 0x51\n", regval);
>>>>> +		return -ENODEV;
>>>>> +	}
>>>>> +
>>>>> +	err = regmap_read(regmap, SPD5118_REG_TYPE + 1, &regval);
>>>>> +	if (err)
>>>>> +		return err;
>>>>> +
>>>>> +	if (regval != 0x18) {
>>>>> +		dev_err(dev, "unexpected device type 0x%02x, expected 0x18\n", regval);
>>>>> +		return -ENODEV;
>>>>> +	}
>>>>> +
>>>>
>>>> I don't think this should dump error messages. Also, it might be desirable
>>>> to use a single regmap operation to read both values.
>>>
>>> Ack. Will use regmap_bulk_read() and will remove the error dump.
>>>
>>>>
>>>>> +	return spd5118_common_probe(dev, regmap, false);
>>>>
>>>> Why is_16bit=false ?
>>>
>>> We don't need the encoding formula for the nvmem address with I3C. Since it
>>> uses little-endian, (page * 0x100 + SPD5118_EEPROM_BASE) translates to the
>>> correct address. Or did I overlook something?
>>>
>>
>> Testing of the 16-bit code was limited: I had to set the SPD on a system
>> manually to 16-bit mode to get it working, and that only worked until the system
>> was reset. Its whole point was to prepare for I3C mode. If that fails, the entire
>> 16-bit code in the driver is potentially wrong and should be pulled out before
>> adding I3C code. It can be added back later if/when a system actually utilizing
>> it is found.
> 
> Thanks for letting me know. I will add a patch to remove the I2C 16-bit sections in
> the next revision as a prerequistie to this patch. Hope that sounds good.
> 

Please do.

Thanks,
Guenter


> Best Regards,
> Akhil


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
