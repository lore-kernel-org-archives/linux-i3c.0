Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 820CBC63707
	for <linux-i3c@archiver.kernel.org>; Fri, 25 Nov 2022 21:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iF0HrRws4N9RjXMO5q5o9kJHjzyxO7EIiADI3gkdiCo=; b=o7VR8o4sGpOtBS
	NlZXVkzM5TEhM13KUBaoHvAcVaaZ6O9ruvoZc6nxqsHce4VLh/yxS3y5+nqse+LO7Zp15rQ+vYwNI
	Sm70NBwgUcPmS6SNZWIwIVWXrCc5oev1mAfTpbK6lkHLn346Mhl9NzgGjwbKL9eBS+WomCflJPhVy
	7wqyOpdgJcXq7ymkD/xOgdvMFSaS9uM8ps2o5vUMAX+3krNj/GxFhwwF8Eorzbp+9vXyaIJpRAtu+
	xsBC2A4vBNCFKaIo4ImglrxC1RMhR+L4cKxHHtMBvXxJZUg8mQ7ru3rY4Wu0wVaejz2/BchKVz0GU
	sPcv5SZPHIUuRv2mC7rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyg8J-002E6J-Vf; Fri, 25 Nov 2022 21:21:15 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxuRf-001apB-OK
	for linux-i3c@lists.infradead.org; Wed, 23 Nov 2022 18:26:08 +0000
Received: by mail-qt1-x82e.google.com with SMTP id e15so11788801qts.1
        for <linux-i3c@lists.infradead.org>; Wed, 23 Nov 2022 10:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wor3YG1VA6P7o8c/O7L7eJMI/pZ9HPWWwXQft3hmCP0=;
        b=cedo7ZWSmsuH0XJ4ubpV07F12j6QbWjVQ5/8pLuMpcToghtBSuk56S6MXMX6Qm7WjS
         1NChO+moKmrDNMneamIggSvWWzwr/T//kN/Kwcj6tkr42ZlPhD/UrODWK93fqzNGGGwJ
         iaes3XW9eYna/Bw5lL+n4z8tFP5LtgS2cmv98rZ7AlPx3XDSdaiaMvzcA8+djvnqI1Jm
         kByuaQkEy2IUN0jEoJWE9aJxjegXkz/nFnBqeS7bAW8o6PzzHwTSega1vNzAX6eGe++Z
         VrL1e2yxkd6Af/0OPW4nuezYyEJvxr1zGiOqJwebNXGUK6ij0o7CaXNXzEmp7wpIRmex
         6uNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wor3YG1VA6P7o8c/O7L7eJMI/pZ9HPWWwXQft3hmCP0=;
        b=lutlw9J0YqZTYIfT8dRoI8cr5tyns+17SkoaImJoT26w4sepLJziV9/BqicRm4Htxg
         8fTHKsqo0UpYsy4MeK2JzDZ+07JXzE37kR7vE3g6rLXJZt+eXgUHrHERhratRZicMZzT
         1SoMnlBC4vR3pm9d5DPJolTMp4qM47FA7S/Zt9zeeH0U8b50ZyQ9OqkmXQzSVZ3DFEQE
         IpXQaU2XVeHf6e3aKMKCNtgDWKCbnL0Y0uIvqsLpJBjrt77h1Fn4fcKGqAL5kl2sQsmi
         khKh4nb/WPWjMX5WSK8YbT9X+dRSRUMHxibaQtSayyAH5DajgBizT+6hTFolKXMdDOGR
         jQlA==
X-Gm-Message-State: ANoB5pkfqaRC/gpnHDyGs/8/O/kulViExudouHK3/d37ELPozATKqQPs
	9haWMSeSO1IxcAhxK+CGSZYIqQ==
X-Google-Smtp-Source: AA0mqf7b8dECsNl10eMwxdSE/ntYRY0ZHq3jcx6smQ+WjEjXUXHAE2sWPKfXnqS1wuH6GWMgna/H+Q==
X-Received: by 2002:a05:622a:1f97:b0:3a6:39c4:dc6 with SMTP id cb23-20020a05622a1f9700b003a639c40dc6mr19492448qtb.515.1669227960618;
        Wed, 23 Nov 2022 10:26:00 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-47-55-122-23.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.122.23])
        by smtp.gmail.com with ESMTPSA id e9-20020ac81309000000b003a56796a764sm10034417qtj.25.2022.11.23.10.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 10:25:59 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1oxuRb-00AgEQ-7R;
	Wed, 23 Nov 2022 14:25:59 -0400
Date: Wed, 23 Nov 2022 14:25:59 -0400
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
Message-ID: <Y35lt+0jXrOKynL5@ziepe.ca>
References: <711d5275-7e80-c00d-0cdc-0f3d52175361@gmail.com>
 <Y34hgIW8p1RlQTBB@smile.fi.intel.com>
 <97be39ed-3cea-d55a-caa6-c2652baef399@gmail.com>
 <Y34zyzdbRUdyOSkA@casper.infradead.org>
 <Y34+V2bCDdqujBDk@kroah.com>
 <Y35JfNJDppRp5bLX@ziepe.ca>
 <Y35R+/eQJYI7VaDS@kroah.com>
 <Y35YlI93UBuTfgYy@ziepe.ca>
 <Y35dMIaNYSE0Cykd@casper.infradead.org>
 <Y35iKfYf3ThdVvaR@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y35iKfYf3ThdVvaR@kroah.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_102603_811591_B28168E6 
X-CRM114-Status: GOOD (  17.24  )
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

On Wed, Nov 23, 2022 at 07:10:49PM +0100, Greg Kroah-Hartman wrote:
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
> Nice trick!  Dropping the inline functions is a bit different, let me
> see if that still gives a sane error if we pass an incorrect type or
> mess with the const * the wrong way.  I'll run some tests tomorrow
> afternoon...

The errors in some cases are very verbose, but it is somewhat
understandable - the worst is when _Generic fails to match anything,
but also at least clang partially expanded container_of and it throws
other assertions too.

I also wonder if this could just be rolled into the normal
container_of.

in_type would have to be derived like:

  in_type = typeof((out_type *)NULL)->out_member)

But I don't know if you can use typeof in a generic type matching expression..

Jason

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
