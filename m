Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABCA6C4708C
	for <linux-i3c@archiver.kernel.org>; Fri, 25 Nov 2022 21:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FCIJxC6ooJz2zpwB1JJdg55ei0XUxQOI5BtvVuLGE2E=; b=Mq580lSdE4quEd
	rqqUxuDAVXF5EcaCSCy0f6nzONRq466OVrjE6k5jqYB3dw0ICClKYm+e8T8PWzmT0J0/eclNePWsk
	ujvGRQQZvRsUoNPT4ET1sLk5h0DdRFpoP4ovDU2aYpD62Y7sPD2aFjxo0WZufhp4GMottBA5Nyk3f
	TBBoeAEZ4WhVHkw8/JRIJyCMqlTCmhewnD4KPTSXIL+z766ib97Jz7gg2xIB76SyXZ/tG4wsLOf7w
	/bwzOZg0IY7oNCT0UyFvJIFMljgMZwFBQeBmheM8oTD+LpxiuA3mNYWPr6b5GmZ/M0Qv0dXmEdhAI
	rTJCSHrv64ainjl/w9IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyg8H-002E4F-Uc; Fri, 25 Nov 2022 21:21:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxrp6-000VZ5-1U
	for linux-i3c@lists.infradead.org; Wed, 23 Nov 2022 15:38:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4DAF561DAC;
	Wed, 23 Nov 2022 15:38:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1979BC433B5;
	Wed, 23 Nov 2022 15:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1669217883;
	bh=fs5VkTgkSMThkRfwYHbvZbd9KBWsoqyzg9ciy8gus2Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h0ZAf34Hn5punisJHBW8LcbCQTw15cHF2JJX4ocDW62QTgSy6qJjtysjjdNvwu0ox
	 57RZmpe0+53Ztv/B01KCVB9FOl0MHv8tq8EoRdlsf0O30ZxuR+2QlY2BhD12bWW0TB
	 l8Nw7ylhiySZzmT0dyMoM2hjY9v4O3HQ5H0j6noM=
Date: Wed, 23 Nov 2022 16:37:59 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: Maximilian Luz <luzmaximilian@gmail.com>,
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
	Jason Gunthorpe <jgg@ziepe.ca>,
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
Message-ID: <Y34+V2bCDdqujBDk@kroah.com>
References: <20221123122523.1332370-1-gregkh@linuxfoundation.org>
 <20221123122523.1332370-3-gregkh@linuxfoundation.org>
 <711d5275-7e80-c00d-0cdc-0f3d52175361@gmail.com>
 <Y34hgIW8p1RlQTBB@smile.fi.intel.com>
 <97be39ed-3cea-d55a-caa6-c2652baef399@gmail.com>
 <Y34zyzdbRUdyOSkA@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y34zyzdbRUdyOSkA@casper.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_073804_172300_D5667882 
X-CRM114-Status: GOOD (  40.09  )
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

On Wed, Nov 23, 2022 at 02:52:59PM +0000, Matthew Wilcox wrote:
> On Wed, Nov 23, 2022 at 02:59:00PM +0100, Maximilian Luz wrote:
> > On 11/23/22 14:34, Andy Shevchenko wrote:
> > > On Wed, Nov 23, 2022 at 02:14:31PM +0100, Maximilian Luz wrote:
> > > > On 11/23/22 13:25, Greg Kroah-Hartman wrote:
> > > > > The uevent() callback in struct device_type should not be modifying the
> > > > > device that is passed into it, so mark it as a const * and propagate the
> > > > > function signature changes out into all relevant subsystems that use
> > > > > this callback.
> > > 
> > > [...]
> > > 
> > > > > -static inline struct ssam_device *to_ssam_device(struct device *d)
> > > > > +static inline struct ssam_device *to_ssam_device(const struct device *d)
> > > > >    {
> > > > >    	return container_of(d, struct ssam_device, dev);
> > > > >    }
> > > > 
> > > > I am slightly conflicted about this change as that now more or less
> > > > implicitly drops the const. So I'm wondering if it wouldn't be better to
> > > > either create a function specifically for const pointers or to just
> > > > open-code it in the instance above.
> > > > 
> > > > I guess we could also convert this to a macro. Then at least there
> > > > wouldn't be an explicit and potentially misleading const-conversion
> > > > indicated in the function signature.
> > > 
> > > This is an intermediate step as far as I know since moving container_of to
> > > recognize const is a bit noisy right now. I guess you can find a discussion
> > > on the topic between Greg and Sakari.
> > 
> > Thanks! I assume you are referring to the following?
> > 
> > 	https://lore.kernel.org/lkml/4218173bd72b4f1899d4c41a8e251f0d@AcuMS.aculab.com/T/
> > 
> > As far as I can tell this is only a warning in documentation, not
> > compile time (which would probably be impossible?).
> > 
> > As I've said I'd be fine with converting the function to a macro (and
> > preferably adding a similar warning like the one proposed in that
> > thread). The point that irks me up is just that, as proposed, the
> > function signature would now advertise a conversion that should never be
> > happening.
> > 
> > Having two separate functions would create a compile-time guarantee, so
> > I'd prefer that, but I can understand if that might be considered too
> > noisy in code. Or if there is a push to make container_of() emit a
> > compile-time warning I'd also be perfectly happy with converting it to a
> > macro now as that'd alleviate the need for functions in the future.
> 
> Can't we do:
> 
> static inline const struct ssam_device *to_ssam_device(const struct device *d)
> {
> 	return container_of(d, const struct ssam_device, dev);
> }
> 

You could, if you can always handle a const pointer coming out of this
function, but I don't think you can.

What you might want to do instead, and I'll be glad to do it for all of
the functions like this I change, is to do what we have for struct
device now:

static inline struct device *__kobj_to_dev(struct kobject *kobj)
{
        return container_of(kobj, struct device, kobj);
}

static inline const struct device *__kobj_to_dev_const(const struct kobject *kobj)
{
        return container_of(kobj, const struct device, kobj);
}

/*
 * container_of() will happily take a const * and spit back a non-const * as it
 * is just doing pointer math.  But we want to be a bit more careful in the
 * driver code, so manually force any const * of a kobject to also be a const *
 * to a device.
 */
#define kobj_to_dev(kobj)                                       \
        _Generic((kobj),                                        \
                 const struct kobject *: __kobj_to_dev_const,   \
                 struct kobject *: __kobj_to_dev)(kobj)


Want me to do the same thing here as well?

thanks,

greg k-h




-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
