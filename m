Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 964BFC9831E
	for <linux-i3c@archiver.kernel.org>; Thu, 24 Sep 2026 23:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mmO2dZvkD4E4saAZLpfg9q5PqMMZxt6Bo57xdSdPCpU=; b=b5mn1lzDXn47Rq
	FnbYC6nSxYinHycERFk3lrkgIGVzFwWOa7y89djFrGGndFVcb7yrGGlQRUL0gFwOLW0WVloe37X7c
	XUs3WmeI6BFRL6hFQQLkDVxXfNeUjs2ZvULNh6SrduYjeinDtYKXt7ydQojK0Zs9eIhnADS7/DgrG
	y4prNtihrLTJ1HIZ1eyEJsp4qj8bsa7aBtqPQBwIC9GAESvyhTEUehyVOwVttoDNKfIgVkvIZxj7w
	oLmT85HJd7mmnrqgxNnH1cOvEMGVufQzwOHXRfaAko7o+lOKClhxpcFPm/qSN3rMwNGdy3/QDRzSF
	QzlHXUtEx23GQPkJ3rBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9sqr-0000000CNZJ-3LQu;
	Thu, 24 Sep 2026 23:27:41 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9sqp-0000000CNYh-0IIb
	for linux-i3c@lists.infradead.org;
	Thu, 24 Sep 2026 23:27:40 +0000
Received: by linux.microsoft.com (Postfix, from userid 1223)
	id 379CC20B7167; Thu, 24 Sep 2026 16:26:47 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 379CC20B7167
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1790292407;
	bh=Ol4Gw21epj/8o0vv4nhFU7uulVUuXLQX34MJO4d++BM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sKbbtKfJp0xwhazY6dZN1s6FSAhmDbLW451ldNLBpYkgVf4iN1FJt+VM8Y6mMelVu
	 fvsVMsJolobwtOFvPAGnLafipE1deJZKFkIlT8Pnl6GDUUFSll4oiWvq3lRm/4wTMv
	 NoJXAb4LeOHKFCTcZYfWKfAVmO54Y26EjTOYvHgs=
Date: Thu, 24 Sep 2026 16:26:47 -0700
From: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Meagan Lloyd <meaganlloyd@linux.microsoft.com>,
	linux-i3c@lists.infradead.org, alexandre.belloni@bootlin.com,
	vitor.soares@toradex.com, samagazaryan@google.com,
	gregkh@linuxfoundation.org, arnd@arndb.de,
	boris.brezillon@collabora.com,
	oleksandr.shulzhenko.viktorovych@intel.com,
	tgopinath@linux.microsoft.com, corbet@lwn.net,
	skhan@linuxfoundation.org, linux@roeck-us.net, Frank.Li@nxp.com,
	jorge.marques@analog.com, pgaj@cadence.com,
	wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
	nuno.sa@analog.com, Michael.Hennerich@analog.com, jic23@kernel.org,
	dlechner@baylibre.com, andy@kernel.org, lorenzo@kernel.org,
	enelsonmoore@gmail.com, rppt@kernel.org, pratyush@kernel.org,
	giovanni.cabiddu@intel.com, gabewhigham@gmail.com,
	haren@linux.ibm.com, pasha.tatashin@soleen.com,
	jirislaby@kernel.org, adrian.ho.yin.ng@altera.com,
	ustc.gu@gmail.com, jszhang@kernel.org, adrian.hunter@intel.com,
	akhilrajeev@nvidia.com, tze.yee.ng@altera.com,
	manikanta.guntupalli@amd.com, shubhrajyoti.datta@amd.com,
	jarkko.nikula@linux.intel.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux@analog.com, linux-iio@vger.kernel.org, andi.shyti@kernel.org
Subject: Re: [PATCH 3/3] i3c: add i3cdev character device module for
 user-space access
Message-ID: <20260924-86692413bdae0e78a12c1425@linux.microsoft.com>
References: <20260911210935.1353126-1-meaganlloyd@linux.microsoft.com>
 <20260911210935.1353126-4-meaganlloyd@linux.microsoft.com>
 <aqVUyYkpKT8iX4Jz@ashevche-desk.local>
 <20260916-454d66ca84cc91479b195aa5@linux.microsoft.com>
 <aqt_dCazxTDR4cpk@ashevche-desk.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aqt_dCazxTDR4cpk@ashevche-desk.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_162739_157342_B677CCAD 
X-CRM114-Status: GOOD (  53.71  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Thu, Sep 17, 2026 at 08:49:40AM +0300, Andy Shevchenko wrote:
> On Wed, Sep 16, 2026 at 03:57:10PM -0700, Meagan Lloyd wrote:
> > On Sat, Sep 12, 2026 at 04:34:01PM +0300, Andy Shevchenko wrote:
> > > On Fri, Sep 11, 2026 at 02:09:35PM -0700, Meagan Lloyd wrote:
> > > > The i3cdev driver is a character device driver that allows user-spa=
ce
> > > > to control and interact with I3C devices.
> > > =

> > > > Currently, it has the ability to perform Single Data Rate (SDR)
> > > > transfers - basic reads/writes.
> > > > =

> > > > With the addition of sysfs driver_override, there is now a
> > > > straightforward and direct way to match the i3cdev driver to any i3c
> > > > device without stepping on the toes of more specialized drivers tha=
t are
> > > > loaded automatically.
> > > =

> > > Is it safe? Why on the earth do we need this? The commit message has =
not enough
> > > information.
> > =

> > I can't see a reason that it'd be unsafe. To give additional confidence,
> > it's already in-use in many bus_types:
> =

> This argument has nothing to do with i=B3c. Each bus is different on a ph=
ysical
> layer, electrical protocols and programming flow. Each of them has own
> constraints.
> =


(resending as my previous reply hit a snag and is probably marked as
spam for most people)

My take is that if you're using the i3cdev module, it's up to the
programmer to review schematics/datasheets to know how to program
the hardware devices and bus (in the case of hubs) correctly.

Note, this thread's driver_override approach was not favored by the i3c
subsystem reviewers, so please continue any further discussion in the
prevailing approach's thread:
https://lore.kernel.org/linux-i3c/20260921230603.2518652-1-samagazaryan@goo=
gle.com/T/#mb42d9b2785f8508d39eaf782b3d29189226b8029

> > To answer why we need it:
> > If we want to write i3cdev as a standard device driver, it can't
> > actually match anything by default. This is because, some devices on the
> > system may need specific drivers and i3cdev is generic and should
> > technically match every device.
> =

> Yes, but I have seen no reason why we should expose i=B3c bus to the user
> space. With i=B2c we already know very well that it was (and still is)
> a bad idea. Why i=B3c is better (especially taking into account i=B2c
> compatible mode and more complex programming flow)?
> =


cc'ing Andi Shyti from I2C subsystem for context.

Andi, we're considering an I3C character device driver interface.
If you have any feedback from your experience with I2C, can you
please share it in:
https://lore.kernel.org/linux-i3c/20260921230603.2518652-1-samagazaryan@goo=
gle.com/T/#mb42d9b2785f8508d39eaf782b3d29189226b8029

> > Since the driver_override is default NULL and is set via sysfs, this
> > allows any specific drivers on boot to be loaded up and would allow
> > explicit control on what device i3cdev gets bound to.
> > =

> > This was my rational. I will refine the commit message with more detail=
s.
> =

> Put a real life example why the exposing i=B3c devices into user space is
> absolutely necessary.
> =


I'm supporting a kernel running on accelerator cards that plug into
various server SKUs where hubs/devices along the bus are not physically
on the card & may differ across SKUs. So, I'm looking to program hubs
flexibly and dynamically from userspace to setup bus hardware paths.

The hub drivers being posted to i3c subsystem require hard-coding in the
devicetree to setup the ports physically according to intended
bus/hardware design. As mentioned, these cards will not know what SKU it
will be plugged into, so the devicetree hard-coding cannot reasonably be
determined ahead of time. Theoretically, you may be able to add some
bootloader support to go query SKU information from other server
components and then populate the devicetree for the kernel, but that
will require heavy lifting and plumbing between other server firmware
components and the bootloader.

Further replies and discussion can be routed here:
https://lore.kernel.org/linux-i3c/20260921230603.2518652-1-samagazaryan@goo=
gle.com/T/#mb42d9b2785f8508d39eaf782b3d29189226b8029

Thank you,
Meagan

> > > > This is accomplished by the i3cdev driver not having any entries in
> > > > the i3c_device_id table. After boot, simply set the driver_override
> > > > to "i3cdev" and bind the device manually via the sysfs bind knob.
> > > > This can also be automated with udev rules as well.
> > > > =

> > > > The character device interface will be exposed at: /dev/bus/i3c/<bus
> > > > id>-<Provisional ID>
> =

> ...
> =

> > > > +	for (int i =3D 0; i < metadata->nxfers; i++) {
> > > =

> > > Why is 'i' signed?
> =

> > Mostly for readability and to make sure the line length on loop headers
> > is kept below 80 chars. As a precaution, to make sure that 'i' can
> > represent any metadata->nxfers value without overflow during loops, I
> > check that metadata->nxfers is less than/equal to INT_MAX in
> > get_metadata().
> =

> No need to add useless checks.
> =

> ...
> =

> > > > +/** + * print_i3c_err() - Prints the I3C error encountered during
> > > > the prior + * call to the core's transfer function.  + * @i3cdev:
> > > > i3cdev_data object + * @metadata: Kernel's copy of i3cdev_xfers
> > > > (ioctl I3CDEV_XFER input) + * @i3c_xfers: i3c_xfer array that was
> > > > sent to the I3C core
> > > =

> > > > + * Returns: void
> > > =

> > > Huh?! Where is this coming from?
> > =

> > In i3cdev_ioctl_do_xfers, if i3c_device_do_xfers failed, I wanted to
> > print out the first I3C controller error encountered. The controller
> > drivers can set this in the i3c_xfer.err field. Hence this function.
> > =

> > It's to aid debugging and provide useful error information.
> > I can certainly refine the wording on the print_i3c_err documentation
> > header to make this more clear.
> =

> My point is about kernel-doc. Why do we need the return section for void?
> Where it comes from?
> =

> > > > + */
> =

> ...
> =

> > > Please, rely less on AI and more on the common sense and
> > > proof-reading.
> =

> > I think I gave you the wrong impression. The new contributions in this
> > series were written and developed by me. I used AI for quality assurance
> > and cross-referencing. Since I incorporated some AI-flagged suggestions,
> > I tried to acknowledge that with the Assisted-by tag.
> =

> I see, then there is a room to improve the code. But the main question is
> why do we even need this whole interface to begin with?
> =

> -- =

> With Best Regards,
> Andy Shevchenko
> =

> =

> =

> -- =

> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
