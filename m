Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 837D8C4332F
	for <linux-i3c@archiver.kernel.org>; Sat,  3 Dec 2022 22:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ai2lYO98Ssa7GpPoIWh2KiwGnhlr+oP1QJTt/b+Mx9A=; b=Cib691d08kuQ1U
	RHUJBYagUt095HCWRKbcslxZezV8BPtwp/oeTMQHAHTM7MSLGqz7OZQiT0Mwv81lAVDihN5bKmE5N
	7/GoVnyeokO2e4/V+teOItgNnDDmpWqBre6T9Y6KGeJu9DsLBmNgp10UOmXVOTCvxRPTk4VU0sgFR
	XIw1JLWs1Yt+2OeYrctflLopo3pOr+WUX57sFMlIOABanHcyDrS7MU+2wI1aReFYIgKSZ5cfX+DH+
	oFXm6zFI9O8Gw+bey71AHkvcX/uYZZXEbmesdf+XABqDlLpeXGhm4KCk+uYTRb8OWBTykfGBwLacI
	mxSttIkk/ddqnjeT+JWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1agp-005Wm2-D9; Sat, 03 Dec 2022 22:08:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0oWt-009laa-OR
	for linux-i3c@lists.infradead.org; Thu, 01 Dec 2022 18:43:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id ADE6A620C3;
	Thu,  1 Dec 2022 18:43:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 208F8C433D6;
	Thu,  1 Dec 2022 18:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1669920204;
	bh=p4GYPrcLemfL1H4zQdK4YSafqKxYl8uzcCcsuNR5Mug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a2BoPen065qBe8Og5canw6L1zfhJNTp7AhJG9KCJ6kiqz0PbaFOGVhFTqYEHLQC/3
	 txrNOo/kDMMWMmzGqvPwfOzgrz6vwm2Q1DicWoYbq+xwADN5A7BOVkCSHc8BU+fkbm
	 ahiTJmpUWGq4d9z7eAd6F7xiHvrsPEH9AaFENflI=
Date: Thu, 1 Dec 2022 19:43:20 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
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
Message-ID: <Y4j1yPD4Ypze7jx5@kroah.com>
References: <Y34hgIW8p1RlQTBB@smile.fi.intel.com>
 <97be39ed-3cea-d55a-caa6-c2652baef399@gmail.com>
 <Y34zyzdbRUdyOSkA@casper.infradead.org>
 <Y34+V2bCDdqujBDk@kroah.com>
 <Y35JfNJDppRp5bLX@ziepe.ca>
 <Y35R+/eQJYI7VaDS@kroah.com>
 <Y35YlI93UBuTfgYy@ziepe.ca>
 <Y35dMIaNYSE0Cykd@casper.infradead.org>
 <Y35enjI+dhhqiG3B@ziepe.ca>
 <Y35ftyYlE8FX8xQO@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y35ftyYlE8FX8xQO@casper.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_104327_902045_E0A34FE9 
X-CRM114-Status: GOOD (  17.30  )
X-Mailman-Approved-At: Sat, 03 Dec 2022 14:08:54 -0800
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

On Wed, Nov 23, 2022 at 06:00:23PM +0000, Matthew Wilcox wrote:
> On Wed, Nov 23, 2022 at 01:55:42PM -0400, Jason Gunthorpe wrote:
> > On Wed, Nov 23, 2022 at 05:49:36PM +0000, Matthew Wilcox wrote:
> > > On Wed, Nov 23, 2022 at 01:29:56PM -0400, Jason Gunthorpe wrote:
> > > > #define generic_container_of(in_type, in, out_type, out_member) \
> > > > 	_Generic(in,                                        \
> > > >                   const in_type *: ((const out_type *)container_of(in, out_type, out_member)),   \
> > > >                   in_type *: ((out_type *)container_of(in, out_type, out_member)) \
> > > > 		  )
> > > 
> > > There's a neat trick I found in seqlock.h:
> > > 
> > > #define generic_container_of(in_t, in, out_t, m)			\
> > > 	_Generic(*(in),							\
> > > 		const in_t: ((const out_t *)container_of(in, out_t, m)), \
> > > 		in_t: ((out_t *)container_of(in, out_type, m))	\
> > > 	)
> > >
> > > and now it fits in 80 columns ;-)
> > 
> > Aside from less letters, is their another benifit to using *(in) ?
> 
> I don't think so.  It just looks nicer to me than putting the star in
> each case.  If I'd thought of it, I would have done it to page_folio(),
> but I won't change it now.

Ah, but your trick will not work, that blows up and will not build.  The
original one from Jason here does work.  _Generic is tricky...

thanks,

greg k-h

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
