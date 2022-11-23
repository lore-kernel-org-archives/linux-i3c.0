Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13ADC4708E
	for <linux-i3c@archiver.kernel.org>; Fri, 25 Nov 2022 21:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ifFuTY89qr4jEhedArwdsIO/xC1Drox8k187E0SkurA=; b=MJdaEmDmLQ2Plx
	MMoYMMlvGCgXBXN/KQim6DNU32VfAklLYyOtQSIpGMAAhfUnzBZThImWyqZO2pAZt/76jS7uNGeRD
	YEYxL95Oa/ogo/x1MiinCcK6qpM7MOU/UfgAKCKh18Q0GnVS3y+QdL20ybdFfLMAHgshnRVZT9I6j
	HRlgGBAoSFquY+QZb78YviGu35ZJLAEK+2zzYZt/XUVMXishm6ffwgyy0HRbu7y51eRotzYP/xbrW
	ye3hcTbvwRVWRh2lXVM7OgvAJjpCgaOI+Ne3mwWTBfglyX+J2i/3YANt//tRPKHgjN9s0p+hnq2CR
	V8mCECEouHrzUMr3X2Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyg8I-002E4M-2E; Fri, 25 Nov 2022 21:21:14 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxrzV-000bWA-Q5
	for linux-i3c@lists.infradead.org; Wed, 23 Nov 2022 15:48:54 +0000
Received: by mail-ej1-x62f.google.com with SMTP id f18so43732742ejz.5
        for <linux-i3c@lists.infradead.org>; Wed, 23 Nov 2022 07:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rWol0vfLar2wlbq1lnLcJmfHTOdUxjebNWwkBKe5szA=;
        b=a/Mi1ENzdoE9EIvB5Ye2ZQm0JoL4Qwgm366qbxZz3HxkBSOnQFKmyQLhpQAjVgu++T
         iNr990l84OmsE564r2IQu1CRgoA88Wb/mt2CHH78qJtf4q3nQA3U1QKhyeQuy+Q+SYXE
         oZhRapBFxOxxnkL23W+rryu0Y+MJLd0y4Fe7TRY0xIfc4q+GYKMDxyonVvL6xJoMSchF
         jLZRHWdmt7Td106aDj/tE2AbjWoHM4ou1ytNrlgQpiTkFQzZfmYOirqXurIcW94gBPGQ
         28MGrk0sS5gGlQz9rnrWrp2bEB/SyKW465+JKI8nLKKWqbRcuF/csCfXF+MM71V/+RQ0
         Lg2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rWol0vfLar2wlbq1lnLcJmfHTOdUxjebNWwkBKe5szA=;
        b=4CsOtIdG7PG1Zonc3HHA5dUoPw1xEl/vG2AQvv/mM3Z5kdCQm1EEYXJ8yrqDEJg5Mf
         FwOTGYAAFZHSoUAgoshMtz/0xIpNwrhjoeKXE4LSzEMRtrL29wck+fPay6C3HgtR630T
         I5G2GcTnRVdiCpdcsAq/g3W3cWPrAiRMl485YmkE6TXQHWPzxqXXSXfVRkmMRA73Ft0+
         +VbuSNMowIff20SXVefRIFja08mUSq4tKU16WD/eWHHTYyyf/by+zLwA9JcO6QAdu/oe
         sMo0n4K4WDykQrltE02ecnU1EiZTL/kB4eqVuyghjNc0m/CR4gWXMlBMAwHZLYArV3cD
         Er+A==
X-Gm-Message-State: ANoB5pleaf1chibk/cfTqmTvFtCqNaaKLbQmLhX2kka+TRQlOxjseKBT
	4ZnBT4P4ftMFlLGOPfXhLU0=
X-Google-Smtp-Source: AA0mqf4DGaq6LxoFCutoUkFiDXs1R0I6U1M0ITumJqqtc2ke50QNhjcw+Z4GMeoZk1Cs/xwOs0ED4Q==
X-Received: by 2002:a17:907:c016:b0:7a4:98cc:7c8e with SMTP id ss22-20020a170907c01600b007a498cc7c8emr14564304ejc.48.1669218525781;
        Wed, 23 Nov 2022 07:48:45 -0800 (PST)
Received: from [10.20.0.7] ([37.120.217.162])
        by smtp.gmail.com with ESMTPSA id u2-20020a1709061da200b0073ae9ba9ba8sm7295109ejh.3.2022.11.23.07.48.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 07:48:44 -0800 (PST)
Message-ID: <b93a9fcd-0d7b-14fd-1018-bba35f961a27@gmail.com>
Date: Wed, 23 Nov 2022 16:48:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 3/5] driver core: make struct device_type.uevent() take a
 const *
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthew Wilcox <willy@infradead.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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
 <Y34zyzdbRUdyOSkA@casper.infradead.org> <Y34+V2bCDdqujBDk@kroah.com>
From: Maximilian Luz <luzmaximilian@gmail.com>
In-Reply-To: <Y34+V2bCDdqujBDk@kroah.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_074849_882540_36037F8F 
X-CRM114-Status: GOOD (  32.47  )
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

On 11/23/22 16:37, Greg Kroah-Hartman wrote:
> On Wed, Nov 23, 2022 at 02:52:59PM +0000, Matthew Wilcox wrote:
>> On Wed, Nov 23, 2022 at 02:59:00PM +0100, Maximilian Luz wrote:
>>> On 11/23/22 14:34, Andy Shevchenko wrote:
>>>> On Wed, Nov 23, 2022 at 02:14:31PM +0100, Maximilian Luz wrote:
>>>>> On 11/23/22 13:25, Greg Kroah-Hartman wrote:
>>>>>> The uevent() callback in struct device_type should not be modifying the
>>>>>> device that is passed into it, so mark it as a const * and propagate the
>>>>>> function signature changes out into all relevant subsystems that use
>>>>>> this callback.
>>>>
>>>> [...]
>>>>
>>>>>> -static inline struct ssam_device *to_ssam_device(struct device *d)
>>>>>> +static inline struct ssam_device *to_ssam_device(const struct device *d)
>>>>>>     {
>>>>>>     	return container_of(d, struct ssam_device, dev);
>>>>>>     }
>>>>>
>>>>> I am slightly conflicted about this change as that now more or less
>>>>> implicitly drops the const. So I'm wondering if it wouldn't be better to
>>>>> either create a function specifically for const pointers or to just
>>>>> open-code it in the instance above.
>>>>>
>>>>> I guess we could also convert this to a macro. Then at least there
>>>>> wouldn't be an explicit and potentially misleading const-conversion
>>>>> indicated in the function signature.
>>>>
>>>> This is an intermediate step as far as I know since moving container_of to
>>>> recognize const is a bit noisy right now. I guess you can find a discussion
>>>> on the topic between Greg and Sakari.
>>>
>>> Thanks! I assume you are referring to the following?
>>>
>>> 	https://lore.kernel.org/lkml/4218173bd72b4f1899d4c41a8e251f0d@AcuMS.aculab.com/T/
>>>
>>> As far as I can tell this is only a warning in documentation, not
>>> compile time (which would probably be impossible?).
>>>
>>> As I've said I'd be fine with converting the function to a macro (and
>>> preferably adding a similar warning like the one proposed in that
>>> thread). The point that irks me up is just that, as proposed, the
>>> function signature would now advertise a conversion that should never be
>>> happening.
>>>
>>> Having two separate functions would create a compile-time guarantee, so
>>> I'd prefer that, but I can understand if that might be considered too
>>> noisy in code. Or if there is a push to make container_of() emit a
>>> compile-time warning I'd also be perfectly happy with converting it to a
>>> macro now as that'd alleviate the need for functions in the future.
>>
>> Can't we do:
>>
>> static inline const struct ssam_device *to_ssam_device(const struct device *d)
>> {
>> 	return container_of(d, const struct ssam_device, dev);
>> }
>>
> 
> You could, if you can always handle a const pointer coming out of this
> function, but I don't think you can.
> 
> What you might want to do instead, and I'll be glad to do it for all of
> the functions like this I change, is to do what we have for struct
> device now:
> 
> static inline struct device *__kobj_to_dev(struct kobject *kobj)
> {
>          return container_of(kobj, struct device, kobj);
> }
> 
> static inline const struct device *__kobj_to_dev_const(const struct kobject *kobj)
> {
>          return container_of(kobj, const struct device, kobj);
> }
> 
> /*
>   * container_of() will happily take a const * and spit back a non-const * as it
>   * is just doing pointer math.  But we want to be a bit more careful in the
>   * driver code, so manually force any const * of a kobject to also be a const *
>   * to a device.
>   */
> #define kobj_to_dev(kobj)                                       \
>          _Generic((kobj),                                        \
>                   const struct kobject *: __kobj_to_dev_const,   \
>                   struct kobject *: __kobj_to_dev)(kobj)
> 
> 
> Want me to do the same thing here as well?

That looks great! Thanks!

I would very much prefer that.

Regards,
Max

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
