Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59422C636F8
	for <linux-i3c@archiver.kernel.org>; Fri, 25 Nov 2022 21:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mCBltZZjWD0v3ZiEDRk9JFoTVSD7iWM1u8kSUZLVc/E=; b=OztJUX6uyC2WCO
	f5rMiEubx9IP8NleK6uVOsBXH2uskNw5AP9y4t2IDJy3wjN3gmeOfjI0ioqNTS3fc7DRUvUn87lxA
	9drj41SdssoQ2G+oztRqsuFjSEZNlWE/A+fllD3WcQ8xpiYlY/rCuGiO5sZJJineHKVeuDIw3GUTb
	Lqhi9OpPfgkn1gy8Zduq+z8bDcHwXimoHhk/qjjl7gfIh82F6eLY0WDF/wUukcajccVZ1u6kDy3ld
	clE0T7mgFYHkk9EG0iXkopK2GcXGU2F4j34qw3RrEATJ3V/9Qiy0EkxCKcpjXGozEw4sfXHAptxeQ
	Yx/poyrR2SAy/bzsKh4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyg8I-002E4s-MM; Fri, 25 Nov 2022 21:21:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxt8C-0013DY-Uj
	for linux-i3c@lists.infradead.org; Wed, 23 Nov 2022 17:01:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E04E061DFC;
	Wed, 23 Nov 2022 17:01:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 777BCC433D6;
	Wed, 23 Nov 2022 17:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1669222911;
	bh=o3haMfaeHZfYTyEePRwp9h5E4unKgpaM0OuqyhoXnp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qo8vJIErhb/ipCwuy4gwV/i9YmIAaJMojUiZPS4IOOd8yQY7LyT3VrOZMJTKRDS9x
	 i8L49I9CCW+G4gWPmwXnGTUcpWsWu7OwHPDHLjbFVstIHlX3U3iCwopRHJdZmvOcLy
	 DUuQU3VjRGKHYyj8ctniAuEtEhb8ztF3vFHL+6eY=
Date: Wed, 23 Nov 2022 18:01:47 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
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
Message-ID: <Y35R+/eQJYI7VaDS@kroah.com>
References: <20221123122523.1332370-1-gregkh@linuxfoundation.org>
 <20221123122523.1332370-3-gregkh@linuxfoundation.org>
 <711d5275-7e80-c00d-0cdc-0f3d52175361@gmail.com>
 <Y34hgIW8p1RlQTBB@smile.fi.intel.com>
 <97be39ed-3cea-d55a-caa6-c2652baef399@gmail.com>
 <Y34zyzdbRUdyOSkA@casper.infradead.org>
 <Y34+V2bCDdqujBDk@kroah.com>
 <Y35JfNJDppRp5bLX@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y35JfNJDppRp5bLX@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_090153_106535_80259938 
X-CRM114-Status: GOOD (  21.58  )
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

On Wed, Nov 23, 2022 at 12:25:32PM -0400, Jason Gunthorpe wrote:
> On Wed, Nov 23, 2022 at 04:37:59PM +0100, Greg Kroah-Hartman wrote:
> > static inline struct device *__kobj_to_dev(struct kobject *kobj)
> > {
> >         return container_of(kobj, struct device, kobj);
> > }
> > 
> > static inline const struct device *__kobj_to_dev_const(const struct kobject *kobj)
> > {
> >         return container_of(kobj, const struct device, kobj);
> > }
> > 
> > /*
> >  * container_of() will happily take a const * and spit back a non-const * as it
> >  * is just doing pointer math.  But we want to be a bit more careful in the
> >  * driver code, so manually force any const * of a kobject to also be a const *
> >  * to a device.
> >  */
> > #define kobj_to_dev(kobj)                                       \
> >         _Generic((kobj),                                        \
> >                  const struct kobject *: __kobj_to_dev_const,   \
> >                  struct kobject *: __kobj_to_dev)(kobj)
> > 
> > 
> > Want me to do the same thing here as well?
> 
> It would be nice to have a shared macro code gen all of the above
> instead of copy and pasting it. Then maybe other cases beyond struct
> device could adopt const too..

I think I tried to create such a beast, but failed, so ended up
open-coding it in a few places in the USB headers already.  I can try it
again, but the redirection gets tricky (defines creating defines...)

thanks,

greg k-h

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
