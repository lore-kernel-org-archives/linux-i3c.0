Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB318C982D7
	for <linux-i3c@archiver.kernel.org>; Fri, 18 Sep 2026 18:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7qI7306bRpDDfyXYksxWCgDF3W/GREpW7vYFBvUQyd0=; b=EdY9MEa1Ndf5Ld
	F86XFMrVtt9UgqVSrQ+9l/lq3WueUuW+ihDh3fcSLVDJb1z+y46rh7o80b1/+fXTeQxeDIXLmJvk2
	YgV9z6USDT5DfHvIQJ8bUQfwkYV37kqiyOXZXmhMs9qVOX1z/ORXfP8FKoMbe6F7rckLVYW3mJc0x
	w0wWba6q/gdQXTkvky2dChJOM3oZ85KIgnMpARsH7y61mm95L692m1hsLyswfRa+ukFCTMvMwg/Bf
	vNpDreuh+Okmka1lpEqAyopdaeV01iOy/mM+rKvhpFhlUek45pQo513fkPUiZQtAh+4zX6KKRjRhQ
	rjmjlr4AydU96mBCnz/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7doO-0000000FMhM-1cLo;
	Fri, 18 Sep 2026 18:59:52 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7doL-0000000FMgg-3TQK
	for linux-i3c@lists.infradead.org;
	Fri, 18 Sep 2026 18:59:50 +0000
Received: by linux.microsoft.com (Postfix, from userid 1223)
	id 4975D20B7167; Fri, 18 Sep 2026 11:59:02 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 4975D20B7167
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1789757942;
	bh=NWP5nJlGeNfNnvCdGPJg7ce4Gk1dR1/uBDCKD594tXM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qy236HlDVJt3f+FE0DVLrsA1zs2ius5LJIzoFXA3wHC+Hsxe/RrG+D8pNuMVZ3Vd1
	 Zkrkwclh5oQs4pNSaHsQQnwkePcdo9PbDJJte5uR8ArOfDC2vPScsJEGpWS8hhEhUu
	 8E67vB0NRHTrhorOkMBORXigfBHsmaU3x8O5tN+0=
Date: Fri, 18 Sep 2026 11:59:02 -0700
From: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
To: Sam Agazaryan <samagazaryan@google.com>
Cc: Meagan Lloyd <meaganlloyd@linux.microsoft.com>,
	linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Vitor Soares <vitor.soares@toradex.com>,
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>,
	linux-kernel@vger.kernel.org, tgopinath@linux.microsoft.com,
	boris.brezillon@collabora.com
Subject: Re: [PATCH v4 3/3] i3c: add i3cdev module to expose i3c dev in /dev
Message-ID: <20260918-bc8077794cfb7321acf66420@linux.microsoft.com>
References: <20260906202747.4041389-1-samagazaryan@google.com>
 <20260906202747.4041389-4-samagazaryan@google.com>
 <20260911-d0e2d97df458cbf24fa42089@linux.microsoft.com>
 <CAHreonH0b=spgb2LuUbVvWHarJWf3MOyL8qS5k_1X6gb_mjVkg@mail.gmail.com>
 <20260917-b3831e748e890287325aae49@linux.microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260917-b3831e748e890287325aae49@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_115949_896184_F8159510 
X-CRM114-Status: GOOD (  37.11  )
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

On Thu, Sep 17, 2026 at 03:27:38PM -0700, Meagan Lloyd wrote:
> On Fri, Sep 11, 2026 at 05:12:40PM -0700, Sam Agazaryan wrote:
> > Hey Meagan,
> > 
> > Thanks for sharing your patch series.
> > 
> >  The reason we have the bus notifier system here is
> >  1. Dynamic module loading is handled automatically: if i3cdev is built-in and
> >     a specialized driver module loads later, the bus notifier receives
> >     BUS_NOTIFY_BIND_DRIVER and immediately calls i3cdev_detach().
> 
> I think the bus notifier approach has the potential to hit some race
> conditions with other drivers.
> 
> For example, drivers/base/dd.c, really_probe is the only spot in the
> source code that BUS_NOTIFY_BIND_DRIVER event occurs:
>     really_probe
>         driver_sysfs_add <- where BUS_NOTIFY_BIND_DRIVER occurs
>         call_driver_probe
> 
> If a specialized driver's probe sets dev->driver_data, and i3cdev_detach
> gets to run afterwards, wouldn't it overwrite driver_data with
> NULL and clobber the driver_data?
> 
> Similarly, a driver setting dev->driver_data could cause you to lose
> your i3cdev_data pointer - which you need for teardown in i3cdev_detach.
> 
> The use of the dev->driver_data field when i3cdev isn't a registered 
> device driver was one of the feedback points flagged in v3 (2020).

I made an assumption in my previous analysis. I assumed that the
notification would be dispatched in its own thread. Digging more,
bus_notify just invokes all the registered .notifier_call callbacks, so
i3cdev_detach would be guaranteed to run before call_driver_probe.

Please disregard my previous comment and apologies for the confusion.

> 
> >  2. No cross-subsystem changes needed. The bus notifier avoids touching other
> >     subsystems entirely.
> 
> That's true and certainly a plus!
> 
> >  3. Boot-time recovery flows: For OCP Secure Firmware Recovery
> >     devices come up unbound and need /dev/bus/i3c/<device> available
> >     immediately without requiring udev rules or sysfs writes first.
> > 
> 
> Why can't you use udev rules?
> 
> You can use them to automatically set driver_override & bind to i3cdev.
> Once the rules are in-place, the setup of character device files in
> /dev/bus/i3c/<device> will be immediate and automatic on-boot and for any
> devices that join later.
> 
> You can also do it for all I3C devices if that's what you want.
>

FWIW, your solution will also work for me. I'm looking to query SKU
information over I3C and then configure I3C Hubs according to the
hardware path.

Thank you,
Meagan
 
> > It looks like we're both going in the same direction for UAPI
> > integration too.
> > 
> > If you're open to collaborating, I think we can combine and converge
> > on a single i3cdev driver - adopting all necessary fixes and
> > ensuring the UAPI and features cover both of our use cases so we
> > have one unified series (and any other use cases or desires we may
> > want out of an i3cdev driver).
> 
> Yeah, I am up for that! :)
> 
> > I'd like to know what everyone thinks about taking that approach
> > also if there are any other use cases we may be missing here,
> > regardless of which patch set we choose.
> > 
> > I guess just to get things moving, if we go one way and choose to go
> > forward with the bus notifier approach, Meagan would you be okay
> > with me incorporating your Patch 2/3 for actual_len for the i3c
> > controller drivers? Of course with your authorship.
> 
> Sure. I should have mentioned is that I only have a Designware I3C
> controller, so hopefully we can source help to test actual_len for
> other controller drivers.
> 
> Thanks, Meagan

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
