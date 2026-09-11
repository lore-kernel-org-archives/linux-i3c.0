Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31037C88E41
	for <linux-i3c@archiver.kernel.org>; Fri, 11 Sep 2026 03:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/Q4QKl9Il9i2MP9cS1OhFy8JQDqSVfBGCPz+fZ4qvM0=; b=rMve5CwlAElqw+c0/GF4GcUZCU
	j3gzbXvJi8YqkcgkPMcBV+zy/Li0Dpevfi00vpeHl5iMPrgWfyUUn0DzVppkb5rjcGgMGpCx6BL/V
	Tmwck5mtfONPrkPZTvcbHJdt5RRMc+zD0xQZX8M8NMAR6PGRxIYXQavClexi8R1+8XzBT1arDn4LE
	bk6eyBL9uKkKSB9+EsXiY47yw7IwmwcBuloxGtp0dXR0gTbeY1fXqON5aOa1vAkSYZ9Q+h7K7Zjly
	U0vXQp78HXtQJncoxVnD4cLWGWSwCq1VKp3rVGBBl2bU4hplEe+AutfwonGbfue9PDOWIQ4/dlzuY
	dgNTEQbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4sBx-0000000FnJI-3AT3;
	Fri, 11 Sep 2026 03:44:45 +0000
Received: from mail-pj1-x1047.google.com ([2607:f8b0:4864:20::1047])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4sBu-0000000FnIp-3s15
	for linux-i3c@lists.infradead.org;
	Fri, 11 Sep 2026 03:44:44 +0000
Received: by mail-pj1-x1047.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so901440a91.1
        for <linux-i3c@lists.infradead.org>; Thu, 10 Sep 2026 20:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789098281; x=1789703081; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZZQJJOdxTgn2EMmC/iTnd7198iii4HFKKy4Hu1QI1UA=;
        b=QFEBhucasddJlroDRoas4Ei9zNNQtEjugDGTrwpUmhqurKCYB//e+bZn0Kj/kcEm5j
         CARm3u5LLYv+qsilfi5cnsUAoauR9aAMDvi+LHPOnQuPGVv6ZQVM58eD6lHpRjtitVaP
         aQ28UBGVXrX3aYUV8AYh3mtYWiyAEyb0d9z7I4AJtCyDVal+4tPNZOjWaVNq4RVvJv4h
         aAwMQj6uSBBjFkqkT3cj0hLDMnanWzcgIhxLexi9a4KLBMNNYVwpoz6tpa/fESmHANYd
         NKqd5OW14MiFK7nhSum1CfD9KGYEbtNVPX0GCk2gs4AYYSUlUKdJBr90JT6PTKTD94Ce
         7gow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789098281; x=1789703081;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZZQJJOdxTgn2EMmC/iTnd7198iii4HFKKy4Hu1QI1UA=;
        b=Yv5MF4PnDY5PiuS/12bcBSQ3UKE40CYw7gm8ri/Ly0cU1LHttq5NUwRYhzjGrgw/jR
         WHzFRiAW9YPaCiz2k0o2eVtVCxT26dZd9Ix1pNAQy010YaLfOTIKA+pXgkXqECWg9Zfa
         VUCi0B5LCwsd1YA4ADAKOnzwSKJgTkH0yNN1c/2QpdlhXeYPIQqLYncorWM7syJdW7XD
         pQhepGGd0gelZyAzXZGi6BMflfa0ShiyHHKQuzuku2CwcOXSm5unVmWvugAS8UB9ncxb
         hJ+nzOVL3q0t4yHkt5uT4j98nLDbU126HS0k+aikKV62YKZYag3dzfmVGU+DtlglRf3l
         KTiA==
X-Gm-Message-State: AFuF++ltEcUpRFFgoXPfX66A7AHZ881XuhhUxr7XRiw+JBR8TuqrWKmq
	RUoC/OTty3YQj0mPBPG+QhdqwEpHusf7SEYoKWnN/DiiW6wDuTgzFtY/vKZQBC+IAf0c17m9Yhm
	sfj0srtPtas+2ZKVoGn/LhflOOG8maQ==
X-Received: from dlbbq6.prod.google.com ([2002:a05:7022:6706:b0:143:6c23:2cab])
 (user=samagazaryan job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3ccc:b0:38f:5801:dc0e with SMTP id 98e67ed59e1d1-39d9c1dc2a1mr3823577a91.15.1789098281252;
 Thu, 10 Sep 2026 20:44:41 -0700 (PDT)
Date: Fri, 11 Sep 2026 03:44:40 +0000
In-Reply-To: <aqHU-6RV_AapSu3M@lizhi-Precision-Tower-5810>
Mime-Version: 1.0
References: <20260906202747.4041389-1-samagazaryan@google.com>
 <20260906202747.4041389-4-samagazaryan@google.com> <aqHU-6RV_AapSu3M@lizhi-Precision-Tower-5810>
X-Mailer: aerc 0.21.0
Message-ID: <DLC6ERLST1B6.6K3HLH38DQLK@google.com>
Subject: Re: [PATCH v4 3/3] i3c: add i3cdev module to expose i3c dev in /dev
From: Sam Agazaryan <samagazaryan@google.com>
To: Frank Li <Frank.li@oss.nxp.com>, Sam Agazaryan <samagazaryan@google.com>
Cc: <linux-i3c@lists.infradead.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Vitor Soares <vitor.soares@toradex.com>, 
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>, <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_204442_998900_128280F8 
X-CRM114-Status: GOOD (  20.95  )
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

On Wed Sep 9, 2026 at 9:51 PM UTC, Frank Li wrote:
> On Sun, Sep 06, 2026 at 08:27:47PM +0000, Sam Agazaryan wrote:
>> From: Vitor Soares <vitor.soares@toradex.com>
>>
>> This patch adds userspace character device support for I3C SDR private
>> transfers via /dev.
>
> Add userspace character device ...

Updated in v5.


>>
>>   - Dynamically exposes /dev/bus/i3c/<device> character devices for I3C
>>     devices when unbound from kernel drivers.
>>   - Dynamically allocates character device minor numbers using the IDA
>>     allocator.
>>   - Implements private SDR read/write transfers via I3C_IOC_PRIV_XFER ioctl
>>     with 64-bit aligned UAPI data structures.
>
> Consider PRIV for SDR, need unified HDR also,
>
> I3C_IOC_XFER
>

At this very moment the production use case we have (OCP Recovery) supports SDR mode. That being said
supporting HDR mode also makes sense.

>> + * Copyright (c) 2020 Synopsys, Inc. and/or its affiliates.
>
> new post, should be 2026

Updated in v5.

>> +
>> +	i3cdev = kzalloc(sizeof(*i3cdev), GFP_KERNEL);
>
> kzalloc_obj()
>

Updated in v5.

>> +	dev_dbg(&i3c->dev, "Reading %zu bytes.\n", count);
>> +
>> +	ret = i3c_device_do_xfers(i3c, &xfers, 1, I3C_SDR);
>
> why force to SDR here.
>

For reads and writes we don't really have an option of passing down a struct denoting cmd mode.
Is there a different default behavior you had in mind for read/write besides SDR mode?

>> +err_out:
>> +	mutex_unlock(&i3cdev->xfer_lock);
>
> use cleanup guard()
>

Updated in v5.

>> +	for (i = 0; i < nxfers; i++) {
>> +		if (xfers[i].rnw) {
>> +			if (copy_to_user(u64_to_user_ptr(xfers[i].data),
>> +					 data_ptrs[i], xfers[i].len))
>
> Use actual_len,
>

Updated in v5.

>> +				ret = -EFAULT;
>> +		}
>> +	}
>> +
>> +err_free_mem:
>> +	for (j = 0; j < i; j++)
>> +		kfree(data_ptrs[j]);
>> +	kfree(k_xfers);
>
>
> use clean up __free(kfree) when alloc.
>

Updated in v5.

>> +	case BUS_NOTIFY_ADD_DEVICE:
>> +	case BUS_NOTIFY_UNBOUND_DRIVER:
>> +		return i3cdev_attach(dev, NULL);
>
> Does all i3c devices attach this driver?
>

Just i3c target devices without a bound driver, the controller should not attach.
The controller itself is explicitly skipped:
        if (dev->type == &i3c_masterdev_type || dev->driver)
            return 0;

>> +struct i3c_ioc_priv_xfer {
>> +	__u64 data;
>> +	__u16 len;
>> +	__u8 rnw;
>
> In HDR mode,  rnw is command.
>

Addressing this in the final comment in this message alongside the rest of
the HDR suggestions.

>> +	__u8 pad[5];
>> +};
>> +
>> +#define I3C_PRIV_XFER_SIZE(N)	\
>> +	((((sizeof(struct i3c_ioc_priv_xfer)) * (N)) < (1 << _IOC_SIZEBITS)) \
>> +	? ((sizeof(struct i3c_ioc_priv_xfer)) * (N)) : 0)
>> +
>> +#define I3C_IOC_PRIV_XFER(N)	\
>> +	_IOC(_IOC_READ|_IOC_WRITE, I3C_DEV_IOC_MAGIC, 30, I3C_PRIV_XFER_SIZE(N))
>
> I3C_IOC_SDR_XFER, support DDR, TSP, TSL future.
>
> Frank


On HDR modes - I think it makes sense to ensure the UAPI supports HDR modes now that
they're integrated into the i3c core. Would you prefer a scheme where we pass
in a more unified struct to specify either: SDR mode r/w or an HDR mode r/w
with ioctl?

Drawing inspiration from i3c_xfer:

    struct i3c_ioc_xfer {
        __u64 data;
        __u16 len;
        __u16 actual_len;
        union {
            __u8 rnw;
            __u8 cmd;
        };
        __u8 mode;
        __u8 pad[2];
    };



Thanks,
Sam

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
