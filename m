Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A0AC7619A
	for <linux-i3c@archiver.kernel.org>; Wed,  5 Apr 2023 10:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AXHOMGG8s247XPkcIddeJPtIPXBZEXBRZvJnXer9/7o=; b=OYNs9G5ZxaAU55
	ZZLowtkAHsSCJtOM+GJAZuIxRf/kEK7fiQjazfhPg0viZEn8V/Z6g9whUteqMfyZLFr7w1m1UGwXq
	6scpsMtIIBjcp+kadV4ZTzYkoFnRwvDvvTb87q/bKmHYL1kyKdk61wjcDC3t8V+m7cDW4rmhvI5vw
	l4JMgNfs98FH9sxvNIp8lz7Ck8UaCiOtC7nDYjMWFK3jUKSiilcoUFEMslIcdvbEJv/PZNs97c13h
	HYYY/hlbPOo2rnWlYul785QJOPwY3YuzWjruvTqiX2ntmO5wluexFvEY0V6vQfhvAWqTu+16Hc0Ek
	O6BOPE3nhIhzbroRA6Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pk0TH-0046gb-2K;
	Wed, 05 Apr 2023 10:34:31 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk0TE-0046fM-1n
	for linux-i3c@lists.infradead.org;
	Wed, 05 Apr 2023 10:34:30 +0000
Received: by mail-wr1-x435.google.com with SMTP id l12so35665928wrm.10
        for <linux-i3c@lists.infradead.org>; Wed, 05 Apr 2023 03:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1680690863;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RH81SYheOEy0dMh+ixTaISF4P5yVtBhXnLOzx4cUUOo=;
        b=WZaiN0RgT3AZMo+kTDlRivfVS+6aTbiDI/GzVeKq9FPFs2VM+kG4PNL+yX7ZZb+2NW
         GHdxpXaH6lDKt59h8O1+m2x1xSYAiD0JYrMV8MxDtY50gl3Vbw3exRQ1ePynLDKe1zDm
         Trp1l2KDfDj9TQdOaACPFSxH1hmGeTGhlpYkKD2FPhGC7sdc4SyTGhFbTYFjThKpTW2K
         8dDsLUoKssejS7q6Uf7KA0VuXgkYbffK4+T4M4UEjInX+vRPS1ggbn+/62GiyxeBRgym
         4brLji3R+3ldvoaXBf6hz3535rxahHgDLFCKnukpLrUWFWIIqaAC294ssj8zgGdZQyHS
         HcOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680690863;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RH81SYheOEy0dMh+ixTaISF4P5yVtBhXnLOzx4cUUOo=;
        b=Xr+i8q7KA/x+z0V+tNE7uBqdFR6v4gmuy4zc9QCGNTqQK8TRdFVvc9hemR6aE3Zuda
         Y30EclNal0QG+X74fkFfNTJJeHeW4t4/oy0I8fDH71v9KOdD9ii5GNdPPDRZ/hbCEn3J
         wKci3FixkT63hNsCXlIkz5YYURo3S/NDpLxEiByGYwqZnPDyv1CHc5al+IBmjotr8mov
         A+hxsUF9FZCs/Os8jem332b17kc93SbzDYNtx4Ai4k6o8oZWuDQSy1v7oSE1n/UQahmC
         rjiCg5HE77ZGg11UHKxcEBM2FCWoTtxmxY7pSPATm8z6ZZ87XhBBh73LiRQ7rrMAQJRt
         7e6w==
X-Gm-Message-State: AAQBX9f7+Ix195faEjpBz++nMeUEGaVHsFTX4NqE5+8NPQEwYK3p78Tb
	68Fk4dg1pmupbFMghVSttpdM5g==
X-Google-Smtp-Source: AKy350Y/W1YUF8CUrZ4/5l/YZ8Gni63fD88tAqi+L43rQrhJsBGDqZ8ypOX48EFbG6f3uW9w4gwiGQ==
X-Received: by 2002:a5d:42c6:0:b0:2ce:a703:1937 with SMTP id t6-20020a5d42c6000000b002cea7031937mr3789978wrr.50.1680690863001;
        Wed, 05 Apr 2023 03:34:23 -0700 (PDT)
Received: from [10.35.4.205] ([167.98.27.226])
        by smtp.gmail.com with ESMTPSA id x9-20020a5d4449000000b002e40d124460sm14712095wrr.97.2023.04.05.03.34.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Apr 2023 03:34:22 -0700 (PDT)
Message-ID: <d3391a58-a272-9432-8d61-887bb23727b1@sifive.com>
Date: Wed, 5 Apr 2023 11:34:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] i3c: Allow OF-alias-based persistent bus numbering
Content-Language: en-GB
To: Jeremy Kerr <jk@codeconstruct.com.au>, linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Matt Johnston <matt@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
References: <20230405094149.1513209-1-jk@codeconstruct.com.au>
From: Ben Dooks <ben.dooks@sifive.com>
In-Reply-To: <20230405094149.1513209-1-jk@codeconstruct.com.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_033428_630701_26DA3D4A 
X-CRM114-Status: GOOD (  24.47  )
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

On 05/04/2023 10:41, Jeremy Kerr wrote:
> Parse the /aliases node to assign any fixed bus numbers, as is done with
> the i2c subsystem. Numbering for non-aliased busses will start after the
> highest fixed bus number.
> 
> This allows an alias node such as:
> 
>      aliases {
>          i3c0 = &bus_a,
> 	i3c4 = &bus_b,
>      };
> 
> to set the numbering for a set of i3c controllers:
> 
>      /* fixed-numbered bus, assigned "i3c-0" */
>      bus_a: i3c-master {
>      };
> 
>      /* another fixed-numbered bus, assigned "i3c-4" */
>      bus_b: i3c-master {
>      };
> 
>      /* dynamic-numbered bus, likely assigned "i3c-5" */
>      bus_c: i3c-master {
>      };
> 
> If no i3c device aliases are present, the numbering will stay as-is,
> starting from 0.
> 
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
> ---
>   drivers/i3c/master.c | 30 +++++++++++++++++++++++++-----
>   1 file changed, 25 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index af8b9ebaec34..6a3169e4606e 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -21,6 +21,7 @@
>   
>   static DEFINE_IDR(i3c_bus_idr);
>   static DEFINE_MUTEX(i3c_core_lock);
> +static int __i3c_first_dynamic_bus_num;
>   
>   /**
>    * i3c_bus_maintenance_lock - Lock the bus for a maintenance operation
> @@ -419,9 +420,9 @@ static void i3c_bus_cleanup(struct i3c_bus *i3cbus)
>   	mutex_unlock(&i3c_core_lock);
>   }
>   
> -static int i3c_bus_init(struct i3c_bus *i3cbus)
> +static int i3c_bus_init(struct i3c_bus *i3cbus, struct device_node *np)

would it be worth passing the struct i3c_master_controller through
this in case other info is needed at a later date? Does ACPI have
anything similar?

>   {
> -	int ret;
> +	int ret, start, end, id = -1;
>   
>   	init_rwsem(&i3cbus->lock);
>   	INIT_LIST_HEAD(&i3cbus->devs.i2c);
> @@ -429,8 +430,19 @@ static int i3c_bus_init(struct i3c_bus *i3cbus)
>   	i3c_bus_init_addrslots(i3cbus);
>   	i3cbus->mode = I3C_BUS_MODE_PURE;
>   
> +	if (np)
> +		id = of_alias_get_id(np, "i3c");
> +
>   	mutex_lock(&i3c_core_lock);
> -	ret = idr_alloc(&i3c_bus_idr, i3cbus, 0, 0, GFP_KERNEL);
> +	if (id >= 0) {
> +		start = id;
> +		end = start + 1;
> +	} else {
> +		start = __i3c_first_dynamic_bus_num;
> +		end = 0;
> +	}
> +
> +	ret = idr_alloc(&i3c_bus_idr, i3cbus, start, end, GFP_KERNEL);
>   	mutex_unlock(&i3c_core_lock);
>   
>   	if (ret < 0)
> @@ -2618,7 +2630,7 @@ int i3c_master_register(struct i3c_master_controller *master,
>   	INIT_LIST_HEAD(&master->boardinfo.i2c);
>   	INIT_LIST_HEAD(&master->boardinfo.i3c);
>   
> -	ret = i3c_bus_init(i3cbus);
> +	ret = i3c_bus_init(i3cbus, master->dev.of_node);
>   	if (ret)
>   		return ret;
>   
> @@ -2846,8 +2858,16 @@ void i3c_dev_free_ibi_locked(struct i3c_dev_desc *dev)
>   
>   static int __init i3c_init(void)
>   {
> -	int res = bus_register_notifier(&i2c_bus_type, &i2cdev_notifier);
> +	int res;
> +
> +	res = of_alias_get_highest_id("i3c");
> +	if (res >= 0) {
> +		mutex_lock(&i3c_core_lock);
> +		__i3c_first_dynamic_bus_num = res + 1;
> +		mutex_unlock(&i3c_core_lock);
> +	}
>   
> +	res = bus_register_notifier(&i2c_bus_type, &i2cdev_notifier);
>   	if (res)
>   		return res;
>   


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
