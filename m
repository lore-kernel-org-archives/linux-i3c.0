Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B1ADC4708D
	for <linux-i3c@archiver.kernel.org>; Fri, 25 Nov 2022 21:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VCTFYQ410xigTgraZiOAv8acIRIE7u/zj6nRwm3J+to=; b=kYo4Hzecxwhrg8
	aNUrBwsokeG7FOlCUJ+E4VDmA+BzJ4QyHUkCtR5mZqn++Yf0zg/1vnoHgsPxSLMq7uyelssgxhDCo
	2/F1jMewJnpenHeDM6sLIYW0lj/6fEedatiHLahYdJlK45JDarVFOedJJR7HpvgGKwmwnj7zfaWOO
	Qkdb5LX76ydF+7nx/aT8mMF+Yxn+o7jnvp7+lUWQGJfsRIc0EUpW7uqjBinFHihTFLT1x7fY+TQAA
	aH26W1UjzOOg8DmSKIkaOqTLcd/ZHQmRj1l53pDBUXhtXPWtMMde0zqVy3wUHK5owEv43q4t+msDp
	te123ozXVPWg/+dmd6nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyg8I-002E4g-HO; Fri, 25 Nov 2022 21:21:14 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxsZ6-000qBu-5N
	for linux-i3c@lists.infradead.org; Wed, 23 Nov 2022 16:25:37 +0000
Received: by mail-qt1-x833.google.com with SMTP id w4so11581860qts.0
        for <linux-i3c@lists.infradead.org>; Wed, 23 Nov 2022 08:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PhJSJnLVsP1vBula4KCFSx5kBTht7CuZrspFHU0N884=;
        b=ebGDyq+q12UGY7Qk5Tupc9qhDLGyIcTZVkm5UZYo/563kMYJJqyAeOt5CzUtM4J8DZ
         3trFHny8FIDylUgXR9JjN8PS72NcWsvrDfr1Nd1Q7FDnTR43onbW+jw1+Ctw0cwtwrCd
         T18F6CTTWbwHWY6WrhS9prZWxtXaTjwzs7IQnIsjaZTmFdCmKdzeecD0BbnuyMQqVQVg
         z0s4POzfjTxMQ62r8mCHZM0rSmjmaRN4hzlYV7zdZbP1xMXxym5gxZ3SKz4kt6tgYYum
         EfCUt6/g2D4WDco0MNWeSPD0NJ6lencxZ7NqZJCJlD8ikZ4WiUl7N0yJnMd2Q4wIPSG2
         7pnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PhJSJnLVsP1vBula4KCFSx5kBTht7CuZrspFHU0N884=;
        b=akWO4F+jF20t3bTO28fe1LA/gDD+cmqmwgXKRhLFURwNRX3kNN277OGJJyyl8K2G69
         fb9PAlXY3TLDdCKPf8E/1Ki/d6Ajso6BhCGqxl1C+D7LieTDvmEBXINVoVvn+GvFwokk
         8pLYHjuEoBO8aallwd4WHo9J9nxCcXLWJnDlw6z30StcPVyzz4M/Sr9kkyH5fBhl4Qjg
         6Egd26oyAx5lmxghh1arSOfbfizHMkYYWDr4Kku82D6789UQnfN7P1S1jphBz54//lxF
         A8if2+jrGxKX6lq1phgSEJxpYP5S7In3JwXgrdIy+/FVPBLD/64oOctEwUJTwnVkvfm+
         OF0w==
X-Gm-Message-State: ANoB5pnuxXtC9ft+j66ndNyBn8khJU0WcNWS00npg2qjIwBFw/uX2yGe
	9GCvlolpxYVnb8JZR83/GwYgPA==
X-Google-Smtp-Source: AA0mqf7URgWK3LZKBiCOJvrYX2BcRTBThzd2VlaYXoILbXTQHzjAWJMWnGzlcI0wVuCFvjEWzX6GjA==
X-Received: by 2002:ac8:60c:0:b0:3a6:37bd:ace5 with SMTP id d12-20020ac8060c000000b003a637bdace5mr14127789qth.426.1669220734011;
        Wed, 23 Nov 2022 08:25:34 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-47-55-122-23.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.122.23])
        by smtp.gmail.com with ESMTPSA id q7-20020a05620a0d8700b006f8665f483fsm12561497qkl.85.2022.11.23.08.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 08:25:33 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1oxsZ2-00AOLL-MZ;
	Wed, 23 Nov 2022 12:25:32 -0400
Date: Wed, 23 Nov 2022 12:25:32 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthew Wilcox <willy@infradead.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Stefan Richter <stefanr@s5r6.in-berlin.de>,
	Wolfram Sang <wsa@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Mark Gross <markgross@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Chaitanya Kulkarni <kch@nvidia.com>, Ming Lei <ming.lei@redhat.com>,
	Jilin Yuan <yuanjilin@cdjrlc.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Won Chung <wonchung@google.com>, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-block@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-i3c@lists.infradead.org, linux-input@vger.kernel.org,
	linux-media@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org, linux1394-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 3/5] driver core: make struct device_type.uevent() take a
 const *
Message-ID: <Y35JfNJDppRp5bLX@ziepe.ca>
References: <20221123122523.1332370-1-gregkh@linuxfoundation.org>
 <20221123122523.1332370-3-gregkh@linuxfoundation.org>
 <711d5275-7e80-c00d-0cdc-0f3d52175361@gmail.com>
 <Y34hgIW8p1RlQTBB@smile.fi.intel.com>
 <97be39ed-3cea-d55a-caa6-c2652baef399@gmail.com>
 <Y34zyzdbRUdyOSkA@casper.infradead.org>
 <Y34+V2bCDdqujBDk@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y34+V2bCDdqujBDk@kroah.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_082536_327673_FCA6223B 
X-CRM114-Status: GOOD (  15.83  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Wed, Nov 23, 2022 at 04:37:59PM +0100, Greg Kroah-Hartman wrote:
> static inline struct device *__kobj_to_dev(struct kobject *kobj)
> {
>         return container_of(kobj, struct device, kobj);
> }
> 
> static inline const struct device *__kobj_to_dev_const(const struct kobject *kobj)
> {
>         return container_of(kobj, const struct device, kobj);
> }
> 
> /*
>  * container_of() will happily take a const * and spit back a non-const * as it
>  * is just doing pointer math.  But we want to be a bit more careful in the
>  * driver code, so manually force any const * of a kobject to also be a const *
>  * to a device.
>  */
> #define kobj_to_dev(kobj)                                       \
>         _Generic((kobj),                                        \
>                  const struct kobject *: __kobj_to_dev_const,   \
>                  struct kobject *: __kobj_to_dev)(kobj)
> 
> 
> Want me to do the same thing here as well?

It would be nice to have a shared macro code gen all of the above
instead of copy and pasting it. Then maybe other cases beyond struct
device could adopt const too..

Jason

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
