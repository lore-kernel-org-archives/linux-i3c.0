Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43077C47089
	for <linux-i3c@archiver.kernel.org>; Fri, 25 Nov 2022 21:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0AIkztPili1Di4wxZfPZ+sI9xMw5WqD4XB91w2eqji4=; b=LUVsKfj2l4/0Kq
	WrVikiZNCIjsIkqjypDA+ml/DwJghFkMk5I+DjN2QalHu5Lkcb2ipVgS9xN+BvGEN29y+XMJqM6JD
	jrdRcLnOapphv5WygEMnwnvLS8dyNsOfQnf3BVmdjfXfny7dgp2hg38yTa+N/ESDwAMQA501grbfb
	u/snuZjpVNKRCgnABBqVXqvij2zRiB2jW4GFqaGtf/o58wjDLkQqE3R8DYZDHhmOIMaPvcoH/YTUd
	1EH01/R9VbGqyUEmVljtkFk8+WpgBq/9j9wBBLGJO4Baut8HlyYgLHgrfWOb39gSefwMKdHt8w9XP
	2ivW1JwGjktwv7MZWjmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyg8H-002E3b-Ee; Fri, 25 Nov 2022 21:21:13 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxqHK-00HRdJ-Sw
	for linux-i3c@lists.infradead.org; Wed, 23 Nov 2022 13:59:09 +0000
Received: by mail-ej1-x62b.google.com with SMTP id fy37so3054247ejc.11
        for <linux-i3c@lists.infradead.org>; Wed, 23 Nov 2022 05:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AJ96Qo939E/LqBCZfcidWQRpLbhFZIXN8NEAiTpAhxk=;
        b=iZRqD+AZI8YXmWPNNo+Fwqqrxkdxxp8sdDhXpzQpS+Z7O6ViZRfqwWBRa1+q6Fn++z
         AayBKunxqdaXyMJwtJZy3prCnDCGQ0bf8s3sNL8v8cU+NRhqFpeFsIofjTg60S/cPv71
         H+sPHuj9u82mvhCqWAi/DQC3hw1wr9h8SadxlGtO1i2opKK+8L4eXSIBcFr67zvlz0zl
         CppQAaJx+cMEavlnguot+la0zcqSDuv3T+S6/PQUa7xI6LA3gJLCSh2MX8CVHkwmdm4o
         1ueE/AeHSGD8djbrX3VA431+kO+OYoaPdqwS1MoX0XoMPIRKU2d/L5Kyjwtu65MvGCmS
         m0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AJ96Qo939E/LqBCZfcidWQRpLbhFZIXN8NEAiTpAhxk=;
        b=W389ChxXeOALWdSPv4iSjEZzfVVDhtirKOnk5qwNEvkL9m85XHcj2Ykh7W9sdMD1ob
         591ppqIZhd9DB0a6yzNBUZrUteWCrZiULjEVerXrZA3ZsT3kCYQ7C0Cmn21iEbcN0Euc
         q5vWTaWqFaz2LbFFDSP1kBoLp0y5lo9ttk14oLu7bpjM5RxCWPfl6+PpCK6av5Cn0uNO
         iafpQQOno8VGUGxfDYjHadHHuoloFVgXGF6YJU2XH1bSOiW4sKZqxc/xwVWIrKJboIvl
         e4C5Hvw7nb3bX8PcaA3UWgnaU///Iv2KT1ovlHdxO3XAbbAI40SaApsVkrNHizoAkemZ
         23dA==
X-Gm-Message-State: ANoB5plP7ChYe27bYsL+gXlvDYAhVy22VUrXlsi4UZfpcrEYy1AeT0vt
	j+3ybFw+/keT2yNogz9K08Y=
X-Google-Smtp-Source: AA0mqf4zngmNYriYQQf6WQDa/SSuXsv/0hsexE8WPkPKL+mwy2wneQC+ycXRX8UErwxgAKGb3ytkyA==
X-Received: by 2002:a17:906:c30c:b0:7ba:1f48:ccec with SMTP id s12-20020a170906c30c00b007ba1f48ccecmr1909635ejz.105.1669211944571;
        Wed, 23 Nov 2022 05:59:04 -0800 (PST)
Received: from [10.20.0.7] ([37.120.217.162])
        by smtp.gmail.com with ESMTPSA id d12-20020a056402078c00b0045b3853c4b7sm7741854edy.51.2022.11.23.05.59.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 05:59:04 -0800 (PST)
Message-ID: <97be39ed-3cea-d55a-caa6-c2652baef399@gmail.com>
Date: Wed, 23 Nov 2022 14:59:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 3/5] driver core: make struct device_type.uevent() take a
 const *
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
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
From: Maximilian Luz <luzmaximilian@gmail.com>
In-Reply-To: <Y34hgIW8p1RlQTBB@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_055907_039346_8840776F 
X-CRM114-Status: GOOD (  23.40  )
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

On 11/23/22 14:34, Andy Shevchenko wrote:
> On Wed, Nov 23, 2022 at 02:14:31PM +0100, Maximilian Luz wrote:
>> On 11/23/22 13:25, Greg Kroah-Hartman wrote:
>>> The uevent() callback in struct device_type should not be modifying the
>>> device that is passed into it, so mark it as a const * and propagate the
>>> function signature changes out into all relevant subsystems that use
>>> this callback.
> 
> [...]
> 
>>> -static inline struct ssam_device *to_ssam_device(struct device *d)
>>> +static inline struct ssam_device *to_ssam_device(const struct device *d)
>>>    {
>>>    	return container_of(d, struct ssam_device, dev);
>>>    }
>>
>> I am slightly conflicted about this change as that now more or less
>> implicitly drops the const. So I'm wondering if it wouldn't be better to
>> either create a function specifically for const pointers or to just
>> open-code it in the instance above.
>>
>> I guess we could also convert this to a macro. Then at least there
>> wouldn't be an explicit and potentially misleading const-conversion
>> indicated in the function signature.
> 
> This is an intermediate step as far as I know since moving container_of to
> recognize const is a bit noisy right now. I guess you can find a discussion
> on the topic between Greg and Sakari.

Thanks! I assume you are referring to the following?

	https://lore.kernel.org/lkml/4218173bd72b4f1899d4c41a8e251f0d@AcuMS.aculab.com/T/

As far as I can tell this is only a warning in documentation, not
compile time (which would probably be impossible?).

As I've said I'd be fine with converting the function to a macro (and
preferably adding a similar warning like the one proposed in that
thread). The point that irks me up is just that, as proposed, the
function signature would now advertise a conversion that should never be
happening.

Having two separate functions would create a compile-time guarantee, so
I'd prefer that, but I can understand if that might be considered too
noisy in code. Or if there is a push to make container_of() emit a
compile-time warning I'd also be perfectly happy with converting it to a
macro now as that'd alleviate the need for functions in the future.

Regards,
Max


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
