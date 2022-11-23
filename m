Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86FFDC636F9
	for <linux-i3c@archiver.kernel.org>; Fri, 25 Nov 2022 21:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=id/2ACAIvvu8blPnxd/1aGTz/FnJ3HDZE3cjKxplhWc=; b=tUP21H94clhCsF
	lP13mClDt8acC1vNF2iPxcdvWHaopAeeWBqwotapcWXaMgQh5gGm0Hn6uCq4ieUl1bE+p0u7jAJB9
	Ev/oyd//xBV/fRURzfJhMD25/AZNv6XJrwAcvM7aL0LFtvkKqY2bkFs0sMpqFMtuO7uvWEwgCm3vf
	QzCYafkWJ1sWgGvqViC2VBybkJKlchV7AV5sxGbWUaix5jr6fMdLAe0Qstq1RKxpl0SgkCX/TAd82
	fkTrkGh+Y5dyPB/GkSg/vPFmG7W03dyGxwvwFo97FVKPwOTtLBoqOciiTGFQc6vNEz1YRE6CaSj7+
	FIZ6meo2vtGd54FMM9vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyg8I-002E52-SV; Fri, 25 Nov 2022 21:21:14 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxtZS-001BRJ-AF
	for linux-i3c@lists.infradead.org; Wed, 23 Nov 2022 17:30:04 +0000
Received: by mail-qt1-x82c.google.com with SMTP id fz10so11681504qtb.3
        for <linux-i3c@lists.infradead.org>; Wed, 23 Nov 2022 09:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6abR5j0hlMc008eliuHFOuiB/x1h/HoL7zgQ4kEGBMg=;
        b=QdimsGNfTzv5cy4RlQtfTKKDVSVgL8yuEuK366wzZaMiRqxQeXrAmjllaGNMyScpdc
         MsNj5mbl3pLDNd2BV325hkTwPL9BYOzi+kSwJtllQ0DULWANmidzNeIUXiQk3VoNfo/E
         4ptv6rfZ5hd4J7x9tjAwSNGafLibrKF4EVw5LGSe1ZZy6+s8bRLN4jhguOSkiDMu6QPi
         wPTI6VMOMjq510vQvLMtGptkpvLXdJgY7O2FNJzlSZh8JHnJa/Z4WKXEodaMMk2QwC7K
         RiiKOKWHUqu9/c7mJwob6VF0WfIK7heBoUcwO8au92H5yk7bWPYSDK9PEgWhaqz377vC
         k3ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6abR5j0hlMc008eliuHFOuiB/x1h/HoL7zgQ4kEGBMg=;
        b=J/Toywzu0Ei8TrtqGXbH4OqIxWcqXsj4agIe0iPlb1eDq7MleVYrSXKZU7nlPEhToj
         CU1YCYsHnKIQDzjmJ1bqd9QvfpuN6OHozK5lDQETVCkPOor0ZKXLjilkrBiim5X45Aeo
         JZ6kRGrT0GBE83eHSIeQwHRuuyNBx8eWTNdjmNBbMYW8kOGF6uKAaDJ6o+wroJHQRqmv
         WLqSpaQHU+NUAQOIclI0dwCn56kPmhhB4tgdCcim+Z3899x9icipuwGosY4OWCsSPySx
         h1/HDbtUirY55wCYqaBWiVyv89JSoXKlQLDNzF/4q3IbJXiEMU1T7H1u2XHLx7voEuXA
         Qm6A==
X-Gm-Message-State: ANoB5pkE6aatSVcQsmQ2fj3lHXj1bbVFMIsV3TQen2ZQ3zsPfvVahngN
	rozCo565iaX5pONpw+reTpLXpQ==
X-Google-Smtp-Source: AA0mqf6VK9T3mvV/iEAQivkf3Os9vtgvXBxWtvIIq8G+B7LGY/huw6PyHSkg/FXOahM3VUH5qsITeg==
X-Received: by 2002:a05:622a:5819:b0:3a5:5d34:66a9 with SMTP id fg25-20020a05622a581900b003a55d3466a9mr11256824qtb.623.1669224598066;
        Wed, 23 Nov 2022 09:29:58 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-47-55-122-23.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.122.23])
        by smtp.gmail.com with ESMTPSA id bq30-20020a05620a469e00b006ef1a8f1b81sm12581219qkb.5.2022.11.23.09.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 09:29:56 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1oxtZM-00ATfh-9i;
	Wed, 23 Nov 2022 13:29:56 -0400
Date: Wed, 23 Nov 2022 13:29:56 -0400
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
Message-ID: <Y35YlI93UBuTfgYy@ziepe.ca>
References: <20221123122523.1332370-1-gregkh@linuxfoundation.org>
 <20221123122523.1332370-3-gregkh@linuxfoundation.org>
 <711d5275-7e80-c00d-0cdc-0f3d52175361@gmail.com>
 <Y34hgIW8p1RlQTBB@smile.fi.intel.com>
 <97be39ed-3cea-d55a-caa6-c2652baef399@gmail.com>
 <Y34zyzdbRUdyOSkA@casper.infradead.org>
 <Y34+V2bCDdqujBDk@kroah.com>
 <Y35JfNJDppRp5bLX@ziepe.ca>
 <Y35R+/eQJYI7VaDS@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y35R+/eQJYI7VaDS@kroah.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_093002_522166_4CB605F9 
X-CRM114-Status: GOOD (  23.75  )
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

On Wed, Nov 23, 2022 at 06:01:47PM +0100, Greg Kroah-Hartman wrote:
> On Wed, Nov 23, 2022 at 12:25:32PM -0400, Jason Gunthorpe wrote:
> > On Wed, Nov 23, 2022 at 04:37:59PM +0100, Greg Kroah-Hartman wrote:
> > > static inline struct device *__kobj_to_dev(struct kobject *kobj)
> > > {
> > >         return container_of(kobj, struct device, kobj);
> > > }
> > > 
> > > static inline const struct device *__kobj_to_dev_const(const struct kobject *kobj)
> > > {
> > >         return container_of(kobj, const struct device, kobj);
> > > }
> > > 
> > > /*
> > >  * container_of() will happily take a const * and spit back a non-const * as it
> > >  * is just doing pointer math.  But we want to be a bit more careful in the
> > >  * driver code, so manually force any const * of a kobject to also be a const *
> > >  * to a device.
> > >  */
> > > #define kobj_to_dev(kobj)                                       \
> > >         _Generic((kobj),                                        \
> > >                  const struct kobject *: __kobj_to_dev_const,   \
> > >                  struct kobject *: __kobj_to_dev)(kobj)
> > > 
> > > 
> > > Want me to do the same thing here as well?
> > 
> > It would be nice to have a shared macro code gen all of the above
> > instead of copy and pasting it. Then maybe other cases beyond struct
> > device could adopt const too..
> 
> I think I tried to create such a beast, but failed, so ended up
> open-coding it in a few places in the USB headers already.  I can try it
> again, but the redirection gets tricky (defines creating defines...)

This seems OK:

#define generic_container_of(in_type, in, out_type, out_member) \
	_Generic(in,                                        \
                  const in_type *: ((const out_type *)container_of(in, out_type, out_member)),   \
                  in_type *: ((out_type *)container_of(in, out_type, out_member)) \
		  )

#define kobj_to_dev(__kobj) \
	generic_container_of(struct kobject, __kobj, struct device, kobj)

Jason

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
