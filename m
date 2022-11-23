Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68BAEC4708A
	for <linux-i3c@archiver.kernel.org>; Fri, 25 Nov 2022 21:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VIyb8yaGHjJxcuC+gU9lw1HEErmOzT91bUFZGSzXvOw=; b=zjaeeacIsNOgaj
	4as2BAnIQ4Qr2Zp1OotLbRQjqRzSr2YLLtOJ8i1Sy/m6fwMXEnGB0HAQy3J6YJvoZWh0jeQhySpO5
	IGX9nk+zwzxU93OvGYfZKU2Qv/bfYeeZBZG8VxbB4dkvUgMYHozYedf1UYBMgv+O9akWMBk0NlxYq
	CLWqB6DU1io6LZK7LGqC3BE/GD7XlEXli3jrscsGx/3c5D8uivg1nLuGfN6w0Pb3RY3HLAwY+h1XP
	BPiRjMVonVKvjTKEAE2JFKElCzpW7A5cI5+RtimWQyZh+kU83tkSjhqCotJI+yDjvoiJHWj6+Nfut
	Kn0lZx4UleOOEc9/HLKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyg8H-002E3s-QX; Fri, 25 Nov 2022 21:21:13 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxrSE-000L7a-VA
	for linux-i3c@lists.infradead.org; Wed, 23 Nov 2022 15:14:28 +0000
Received: by mail-ej1-x62b.google.com with SMTP id kt23so43446320ejc.7
        for <linux-i3c@lists.infradead.org>; Wed, 23 Nov 2022 07:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hgnV7dzGWIIK4HLAnWBaJEBL2mTLW/I0cvrJZ3aQwLQ=;
        b=YMJ/LWVHtvivchBTzQwnK1vjlMO+Yz1qi3F+5UiPUgfXYsHW97FLmplkkb1fg1J6+K
         goYB9EqDRSGMEVxvnaAeVTF9Lc9Gf4uLBWSxTIzEd4dGukliptoZ4n3exYdegKJZSLxS
         jqqRYMpOfvNhGznAoadCbX01da13AhoRzrTcCdNaWrn84IMP2tAXwxgcb2DgicvEWWfp
         i43A/VFojKzoOpulaS8VMliUQvFXuOXde7c6MUNzuEGgGRk68D/p2retyzW7n9p5jNzk
         Eo7b36EnX4jR3LhMZcShGFxfcBKk4/LQlmgUCRROq02DkIDupJ6I37wpVS8vwAn/gosV
         VeGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hgnV7dzGWIIK4HLAnWBaJEBL2mTLW/I0cvrJZ3aQwLQ=;
        b=fXJClynqAMBnQJBtWOkTDxMai7DaYnfbZlUgvtzTcIX54aJ09VB5b7LvZvYaqctT21
         w3HP0V84M+1EYpXULSVAa7Hn4wEcqf2m4C2SG9EyGDnADuqk64/OeocobTXGZH4DUDCR
         G3wfQUaUUz35jrdE1rKLkXBhoo4895Uc4zJwiB2dO0A9pOt5vcWkWtn9NcQK+kEFJ3YA
         UqWtVkzsm0HEgATK33iY8F7d22ZvOv0zRxIMK2jz+JM97//bF7BxenmPfKbFSEeVpoYC
         yuPLhXTiRvbZhyyyt5q/+GC/Hd+ZhtFs8Tiegq9k6JBeMBE9M1q15lf9OEMFvAUtIlj4
         Awqg==
X-Gm-Message-State: ANoB5pn6IAcDOaybFWT/MqCam7nwhJZ015n9SJWqQdRPXzZbQxSa19fq
	C0KZUV+u2PD8pyHvxYoBWjM=
X-Google-Smtp-Source: AA0mqf4dYNQ+ZnGLQviZkjaXr5Ekk3BmqKbpbTm6Z2vYCMarSSYwjqBcLfCq2BgNFKCJrb/e5E7t4w==
X-Received: by 2002:a17:906:402:b0:7a6:fc0f:6fe6 with SMTP id d2-20020a170906040200b007a6fc0f6fe6mr23229240eja.694.1669216464581;
        Wed, 23 Nov 2022 07:14:24 -0800 (PST)
Received: from [10.20.0.7] ([37.120.217.162])
        by smtp.gmail.com with ESMTPSA id ky13-20020a170907778d00b0077a1dd3e7b7sm7251748ejc.102.2022.11.23.07.14.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 07:14:23 -0800 (PST)
Message-ID: <f96587d1-2610-8702-ba6a-bc15297eb2ab@gmail.com>
Date: Wed, 23 Nov 2022 16:14:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 3/5] driver core: make struct device_type.uevent() take a
 const *
Content-Language: en-US
To: Matthew Wilcox <willy@infradead.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Stefan Richter <stefanr@s5r6.in-berlin.de>, Wolfram Sang <wsa@kernel.org>,
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
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Chaitanya Kulkarni <kch@nvidia.com>, Ming Lei <ming.lei@redhat.com>,
 Jilin Yuan <yuanjilin@cdjrlc.com>, Alan Stern <stern@rowland.harvard.edu>,
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
 <711d5275-7e80-c00d-0cdc-0f3d52175361@gmail.com>
 <Y34hgIW8p1RlQTBB@smile.fi.intel.com>
 <97be39ed-3cea-d55a-caa6-c2652baef399@gmail.com>
 <Y34zyzdbRUdyOSkA@casper.infradead.org>
From: Maximilian Luz <luzmaximilian@gmail.com>
In-Reply-To: <Y34zyzdbRUdyOSkA@casper.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_071427_042907_8D1F1124 
X-CRM114-Status: GOOD (  25.86  )
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

On 11/23/22 15:52, Matthew Wilcox wrote:
> On Wed, Nov 23, 2022 at 02:59:00PM +0100, Maximilian Luz wrote:
>> On 11/23/22 14:34, Andy Shevchenko wrote:
>>> On Wed, Nov 23, 2022 at 02:14:31PM +0100, Maximilian Luz wrote:
>>>> On 11/23/22 13:25, Greg Kroah-Hartman wrote:
>>>>> The uevent() callback in struct device_type should not be modifying the
>>>>> device that is passed into it, so mark it as a const * and propagate the
>>>>> function signature changes out into all relevant subsystems that use
>>>>> this callback.
>>>
>>> [...]
>>>
>>>>> -static inline struct ssam_device *to_ssam_device(struct device *d)
>>>>> +static inline struct ssam_device *to_ssam_device(const struct device *d)
>>>>>     {
>>>>>     	return container_of(d, struct ssam_device, dev);
>>>>>     }
>>>>
>>>> I am slightly conflicted about this change as that now more or less
>>>> implicitly drops the const. So I'm wondering if it wouldn't be better to
>>>> either create a function specifically for const pointers or to just
>>>> open-code it in the instance above.
>>>>
>>>> I guess we could also convert this to a macro. Then at least there
>>>> wouldn't be an explicit and potentially misleading const-conversion
>>>> indicated in the function signature.
>>>
>>> This is an intermediate step as far as I know since moving container_of to
>>> recognize const is a bit noisy right now. I guess you can find a discussion
>>> on the topic between Greg and Sakari.
>>
>> Thanks! I assume you are referring to the following?
>>
>> 	https://lore.kernel.org/lkml/4218173bd72b4f1899d4c41a8e251f0d@AcuMS.aculab.com/T/
>>
>> As far as I can tell this is only a warning in documentation, not
>> compile time (which would probably be impossible?).
>>
>> As I've said I'd be fine with converting the function to a macro (and
>> preferably adding a similar warning like the one proposed in that
>> thread). The point that irks me up is just that, as proposed, the
>> function signature would now advertise a conversion that should never be
>> happening.
>>
>> Having two separate functions would create a compile-time guarantee, so
>> I'd prefer that, but I can understand if that might be considered too
>> noisy in code. Or if there is a push to make container_of() emit a
>> compile-time warning I'd also be perfectly happy with converting it to a
>> macro now as that'd alleviate the need for functions in the future.
> 
> Can't we do:
> 
> static inline const struct ssam_device *to_ssam_device(const struct device *d)
> {
> 	return container_of(d, const struct ssam_device, dev);
> }

There are at least a couple of places (device/driver-management and
device-removal related, I think) using this function and requiring
non-const access.

A bunch of other instances could be converted to const-access only, but
that would require a couple more function signature changes (I should
probably set up a patch for that regardless of this here as being a bit
more strict about this makes sense).

Regards,
Max

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
