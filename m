Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3CC0C63703
	for <linux-i3c@archiver.kernel.org>; Fri, 25 Nov 2022 21:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bTOU9ddco5u73TNU9yhSoOlDNbvoBlu2UfNlpaDaSgQ=; b=ZSInfAiMhlRo4F
	J0q7C+ghH7tZ17zhjDrzZNE3njCBv7up8DV7OuXR0qyHeIYAbMs6UPEP6UWeva1+BfoDXU6X0xGWU
	6dCVkkwatTqLidX3Mq69fV7i6YwRkl8W7j/ceZF8gIF+nQvCEV6rG3f24cQlClyzhugYqDuVal6jY
	IOGswySmiyS8qneshU9GRkjn89iEn/+EP5WNaAKohChSvOfQEfg0LOSP/yH4M901YjZYCbyznJg3d
	+Tg+Iu185YFaZw8lt78NR+hCOWbbcWatc5ZpSlNXeqIhrPXc/FTr4TfbxXGwznCEZD0fuSljPSjet
	89nDL6eQealjBM/Ic5Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyg8J-002E5B-2k; Fri, 25 Nov 2022 21:21:15 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxtsY-001Jeu-Cw
	for linux-i3c@bombadil.infradead.org; Wed, 23 Nov 2022 17:49:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3fTJtAhCYVf4T6+HaU0lUlvFevgLRUqxFHqxF0+M6mQ=; b=PsGxbrOAWhmOQwY2+t8gUj0lt8
	YgJWe0wCbRmKhkaNMxQrEv6bl/KfCT3fTToiLGDu7OHzaxHKam06wEd44l0yMXWihhru3JN5dbOz+
	z7yp7UE/E/I/YneKKLNgOcj5+nccs/cC3guuN8LzGUby6Doiinv0fCWvvxMlXivAGj6u6PF+riLi2
	LeA79P9G/yt6pxvybg6aQ4YZkhos9sIpY/uuOe1/sV+1gr3feJnCNyFNIxwprdY1Hq9cLd3Ygp5jJ
	f9FYMdZAoZHQ1ovdLLTBLm/NC7Jcs4zIddL8Sm83AguCkSkYweKgbyn70U1T/J5pD3EC9oSGcxcc2
	L9pWqQRQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxtsO-007sVm-GW; Wed, 23 Nov 2022 17:49:36 +0000
Date: Wed, 23 Nov 2022 17:49:36 +0000
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
Message-ID: <Y35dMIaNYSE0Cykd@casper.infradead.org>
References: <20221123122523.1332370-1-gregkh@linuxfoundation.org>
 <20221123122523.1332370-3-gregkh@linuxfoundation.org>
 <711d5275-7e80-c00d-0cdc-0f3d52175361@gmail.com>
 <Y34hgIW8p1RlQTBB@smile.fi.intel.com>
 <97be39ed-3cea-d55a-caa6-c2652baef399@gmail.com>
 <Y34zyzdbRUdyOSkA@casper.infradead.org>
 <Y34+V2bCDdqujBDk@kroah.com>
 <Y35JfNJDppRp5bLX@ziepe.ca>
 <Y35R+/eQJYI7VaDS@kroah.com>
 <Y35YlI93UBuTfgYy@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y35YlI93UBuTfgYy@ziepe.ca>
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

On Wed, Nov 23, 2022 at 01:29:56PM -0400, Jason Gunthorpe wrote:
> #define generic_container_of(in_type, in, out_type, out_member) \
> 	_Generic(in,                                        \
>                   const in_type *: ((const out_type *)container_of(in, out_type, out_member)),   \
>                   in_type *: ((out_type *)container_of(in, out_type, out_member)) \
> 		  )

There's a neat trick I found in seqlock.h:

#define generic_container_of(in_t, in, out_t, m)			\
	_Generic(*(in),							\
		const in_t: ((const out_t *)container_of(in, out_t, m)), \
		in_t: ((out_t *)container_of(in, out_type, m))	\
	)

and now it fits in 80 columns ;-)

> #define kobj_to_dev(__kobj) \
> 	generic_container_of(struct kobject, __kobj, struct device, kobj)
> 
> Jason

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
