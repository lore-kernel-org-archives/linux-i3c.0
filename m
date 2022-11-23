Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C0EBC63704
	for <linux-i3c@archiver.kernel.org>; Fri, 25 Nov 2022 21:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oFxy0SS8Jzm/peAe5C2NGIlomvJQ5vq5A9O1P5/TKJY=; b=WRd82clGFw0SS8
	A/FrFfPPTpHi8c9K1mkklZEdKSnduOSULOUkXu178xnq3pLm6Oq3U1wF9tcoOlOfnphEeEN5TJ+De
	KeK7XprF5OZek/Gg+EX9eVe9uTVvREdMRAdlZjwlH82P/xeRxAQifg+10Jb5Ha9LquxLkCF87LT2y
	ltgpadS+e/lGOD1xSiO3LStV9IV95N8nq5/0IT0rBjoDsg2c2Q96ybPBk5OucWYFXkUh3i2L8OM4I
	pn8PxyerU8Y2teB+/sZ60dV51l9uZ5/paSRJUt/whylji0D6Z3ivQyUck1J8jHW3tZAzfXM4hFl3u
	4Q0Sj9tc+JwfcyQNcIkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyg8J-002E5s-Fc; Fri, 25 Nov 2022 21:21:15 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxu2n-001Naf-UV
	for linux-i3c@bombadil.infradead.org; Wed, 23 Nov 2022 18:00:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=EYzonTBkqTC9UWGLyjpc9x9J1BcQF0kByl1sDiQq+FM=; b=RZfJNgokp9yAuCF0f4VaqGLucW
	jadEdnjqdDcWiMevKYrbHCLGV91kOSbZOy+jqSyoYv9E1+mOnaun2MEVyYCnR+Rn5MSiME3RW9iy0
	Bg57st+nr6Bau6DxXwclhYnN499E3wW1etLZIS2mzdI43oDTyCxs5p4X0ehT80+8Iavk5Zca6yumq
	YdXIfKJgwyxbKfoKRtq/OI/ZrZKLqeNrPwBXzRi2ZcZqmM9X7PyZvmySE8cTVDIAuteWIHciyXQMT
	cljX/6emsm+HvGcH7ZS2ZKGaksXgjZrBVPjLjECTL0E/SnS5GQvEqAjSU1r78ItrP0pbE9w5a9fXZ
	GTzAK9qg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxu2p-007t5i-Iz; Wed, 23 Nov 2022 18:00:23 +0000
Date: Wed, 23 Nov 2022 18:00:23 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Message-ID: <Y35ftyYlE8FX8xQO@casper.infradead.org>
References: <711d5275-7e80-c00d-0cdc-0f3d52175361@gmail.com>
 <Y34hgIW8p1RlQTBB@smile.fi.intel.com>
 <97be39ed-3cea-d55a-caa6-c2652baef399@gmail.com>
 <Y34zyzdbRUdyOSkA@casper.infradead.org>
 <Y34+V2bCDdqujBDk@kroah.com>
 <Y35JfNJDppRp5bLX@ziepe.ca>
 <Y35R+/eQJYI7VaDS@kroah.com>
 <Y35YlI93UBuTfgYy@ziepe.ca>
 <Y35dMIaNYSE0Cykd@casper.infradead.org>
 <Y35enjI+dhhqiG3B@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y35enjI+dhhqiG3B@ziepe.ca>
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

On Wed, Nov 23, 2022 at 01:55:42PM -0400, Jason Gunthorpe wrote:
> On Wed, Nov 23, 2022 at 05:49:36PM +0000, Matthew Wilcox wrote:
> > On Wed, Nov 23, 2022 at 01:29:56PM -0400, Jason Gunthorpe wrote:
> > > #define generic_container_of(in_type, in, out_type, out_member) \
> > > 	_Generic(in,                                        \
> > >                   const in_type *: ((const out_type *)container_of(in, out_type, out_member)),   \
> > >                   in_type *: ((out_type *)container_of(in, out_type, out_member)) \
> > > 		  )
> > 
> > There's a neat trick I found in seqlock.h:
> > 
> > #define generic_container_of(in_t, in, out_t, m)			\
> > 	_Generic(*(in),							\
> > 		const in_t: ((const out_t *)container_of(in, out_t, m)), \
> > 		in_t: ((out_t *)container_of(in, out_type, m))	\
> > 	)
> >
> > and now it fits in 80 columns ;-)
> 
> Aside from less letters, is their another benifit to using *(in) ?

I don't think so.  It just looks nicer to me than putting the star in
each case.  If I'd thought of it, I would have done it to page_folio(),
but I won't change it now.

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
