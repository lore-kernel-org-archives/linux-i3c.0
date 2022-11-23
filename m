Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B202DC4167B
	for <linux-i3c@archiver.kernel.org>; Fri, 25 Nov 2022 21:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vrEn2UvVM3kuAZcH6m1lT9BWF+wijE6sejhnffvDRQA=; b=dLrqLrNRb2xlkG
	tdiApUkw1UYTkks7JEGdP6U0ACfdMI8JcHdaDKhETmG9UG1p/xoLMx+aXI0nzhDj90py8JK9GQFXo
	8NWJZGgehvjs7UTsFC4G2czCNFapxnqIScAqQ0G+59Rd+o22eM9PQuw/rofEehjOTfnqVWD/DkU4P
	a0cnJdUaPgrR4GkCxL9PNNQFEdV0+xtKjgLgewOJmXk55GtYoqFEbgIp4sFiMeRYPL9a8kuFd3coK
	OU2U6DqZoe+/C07T2FKMx6F7IFPbSNGU5kJyJYkk274PmsLu6SdBRRGH+pusj4VvZc7gk2xlfNL6i
	DanHNkvqL+wQLIz7oQUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyg8G-002E2i-Pd; Fri, 25 Nov 2022 21:21:12 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxpaH-00HAIn-K0
	for linux-i3c@lists.infradead.org; Wed, 23 Nov 2022 13:14:38 +0000
Received: by mail-ed1-x52c.google.com with SMTP id z20so23286245edc.13
        for <linux-i3c@lists.infradead.org>; Wed, 23 Nov 2022 05:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sauF/j+i6mkS8I5Asm3wkjg9rAoolnMVFFABQhVn7ts=;
        b=JrgCjNHpmpS+UFD/hJxkEdxsDcmk00K9l1zgw4rjJ6QL5LFgR9cDjNY17XgiVyuKWT
         GVX3FjNvQF532OmACfplDQxa0ET6vUF3+AwWkzCoQgdvk8wm/vwi5bqEPhjgds3tvHVk
         qcn3+9bWbQ09f6O6mbQXTHtJZBCGwc8Lfjz7fIehiorZZ8oPg8dRKYCne/QKG+ZgQ3Z5
         zzGAl10ChcVHD+8+Mhy+mnFO2Ek6zUiOt22qnko9TArrSnnj1eidLr1A138vvA9aLTcz
         ZwMNfHN3QT6GpL5rAIMHY7Io5oO/gphYT8wcDC9vjb4hS9xYXmqoE4cy5//Ks0/sJomc
         X3OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sauF/j+i6mkS8I5Asm3wkjg9rAoolnMVFFABQhVn7ts=;
        b=LnBZitFshnMAysQ/BPhAAxBY0BpE20OD/jjSNjqsHB0yqTjXf/Xx0TD3uHI3d+5+Ug
         2ammLDl8/TFRdPuIpOA3PY4PuxQCeO0jkkHfLn6gY81leuzKhMG6wOe7AOiI+BKIzi1K
         mHhjjLDSYqRfGoYdtUHD8RL8BcosKdw1f0fY8tPUmhgCnmweSoAbtwDbh2VB7tvNKKB/
         8QIWOGdNwaJOInLyDjqzyqlkzG3eejh3/GN+gcsgOHB3jKTdubFe/xh1ApxTUxg43wCr
         jDEnKVaCdGKS9lI9XNdcGEWrongkTvQugVkjG7kHKT+PpgqsNhIOT3YA3duejwFtKqxu
         5C9A==
X-Gm-Message-State: ANoB5pkF65k1SBdns4dKb+5omWqrQc+ePaJRBh/Jti2DwuS5EtTgm4lQ
	f0VnBiZr6sRPJi3XrCBg5L3pCHQUT9iW+uPR
X-Google-Smtp-Source: AA0mqf4EMwcpsdY1UQ9nMh8FYiw8FldQtuxFrB6UO57Z4G73kQazssLgzz4HdFhaHz+MfDNKhbLKUA==
X-Received: by 2002:a05:6402:181:b0:461:ea0c:e151 with SMTP id r1-20020a056402018100b00461ea0ce151mr11327924edv.376.1669209274614;
        Wed, 23 Nov 2022 05:14:34 -0800 (PST)
Received: from [10.20.0.7] ([37.120.217.162])
        by smtp.gmail.com with ESMTPSA id oz36-20020a1709077da400b00734bfab4d59sm958602ejc.170.2022.11.23.05.14.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 05:14:34 -0800 (PST)
Message-ID: <711d5275-7e80-c00d-0cdc-0f3d52175361@gmail.com>
Date: Wed, 23 Nov 2022 14:14:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 3/5] driver core: make struct device_type.uevent() take a
 const *
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org
Cc: Jens Axboe <axboe@kernel.dk>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>, Stefan Richter <stefanr@s5r6.in-berlin.de>,
 Wolfram Sang <wsa@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Sean Young <sean@mess.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Andreas Noever <andreas.noever@gmail.com>,
 Michael Jamet <michael.jamet@intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Yehezkel Bernat <YehezkelShB@gmail.com>, Jiri Slaby <jirislaby@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Chaitanya Kulkarni <kch@nvidia.com>, Ming Lei <ming.lei@redhat.com>,
 Jilin Yuan <yuanjilin@cdjrlc.com>, Alan Stern <stern@rowland.harvard.edu>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Thomas Gleixner <tglx@linutronix.de>, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, Won Chung <wonchung@google.com>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-block@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-i3c@lists.infradead.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
References: <20221123122523.1332370-1-gregkh@linuxfoundation.org>
 <20221123122523.1332370-3-gregkh@linuxfoundation.org>
From: Maximilian Luz <luzmaximilian@gmail.com>
In-Reply-To: <20221123122523.1332370-3-gregkh@linuxfoundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_051437_684837_F2862D56 
X-CRM114-Status: GOOD (  20.88  )
X-Mailman-Approved-At: Fri, 25 Nov 2022 13:21:10 -0800
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

Hi,

On 11/23/22 13:25, Greg Kroah-Hartman wrote:
> The uevent() callback in struct device_type should not be modifying the
> device that is passed into it, so mark it as a const * and propagate the
> function signature changes out into all relevant subsystems that use
> this callback.

[...]

> diff --git a/drivers/platform/surface/aggregator/bus.c b/drivers/platform/surface/aggregator/bus.c
> index de539938896e..407eb55050a6 100644
> --- a/drivers/platform/surface/aggregator/bus.c
> +++ b/drivers/platform/surface/aggregator/bus.c
> @@ -35,9 +35,9 @@ static struct attribute *ssam_device_attrs[] = {
>   };
>   ATTRIBUTE_GROUPS(ssam_device);
>   
> -static int ssam_device_uevent(struct device *dev, struct kobj_uevent_env *env)
> +static int ssam_device_uevent(const struct device *dev, struct kobj_uevent_env *env)
>   {
> -	struct ssam_device *sdev = to_ssam_device(dev);
> +	const struct ssam_device *sdev = to_ssam_device(dev);
>   
>   	return add_uevent_var(env, "MODALIAS=ssam:d%02Xc%02Xt%02Xi%02Xf%02X",
>   			      sdev->uid.domain, sdev->uid.category,

[...]

> --- a/include/linux/surface_aggregator/device.h
> +++ b/include/linux/surface_aggregator/device.h
> @@ -229,7 +229,7 @@ static inline bool is_ssam_device(struct device *d)
>    * Return: Returns a pointer to the &struct ssam_device wrapping the given
>    * device @d.
>    */
> -static inline struct ssam_device *to_ssam_device(struct device *d)
> +static inline struct ssam_device *to_ssam_device(const struct device *d)
>   {
>   	return container_of(d, struct ssam_device, dev);
>   }

I am slightly conflicted about this change as that now more or less
implicitly drops the const. So I'm wondering if it wouldn't be better to
either create a function specifically for const pointers or to just
open-code it in the instance above.

I guess we could also convert this to a macro. Then at least there
wouldn't be an explicit and potentially misleading const-conversion
indicated in the function signature.

Regards,
Max

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
