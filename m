Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C41C9830D
	for <linux-i3c@archiver.kernel.org>; Fri, 25 Sep 2026 09:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pyFn96J7rz7dNWxc/rZuHzuapRCRV8Z2O4xFr1F92bA=; b=h0atd+wszbcFf+
	L1Pdj+NHYxj+xADCP7mVjj7kcjYML3RcpAUdu6JkbYMoMw6bLKRycj8HluRjMpVzER5bzCDZIiQ2K
	XMQdlmFX8xWsSh4zUh9Oib3jaJXAtUUpWqGPeeBqm9krmYxvS5XzSnMTd/UHuatGdILTj7+n4BLAK
	jCUmg9cgihJeLr52Ogq0eEA3mQux3QFTWl1PoNzzUPw/tbVe+hIc/Bkx41p5qcnjPVF9U4FpJ+K/B
	/KsTm9S0qM9bhyGfiak6N6C28MFZDIB30HwtO0XC3t2vJAJk/AU7bPtIx467vdgZNtH9oMTekTxII
	kj4qSkv1HRmZeWb19syw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA1xM-0000000CyqT-0JTI;
	Fri, 25 Sep 2026 09:11:00 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA1xJ-0000000Cypz-3WFO
	for linux-i3c@lists.infradead.org;
	Fri, 25 Sep 2026 09:10:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790327458; x=1821863458;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=g+73qLoYaz6+pvyfvA5np/DdngHoGLgjI1wJ9+pR5P4=;
  b=UNsMafiwm0lfFTaZwqLtf31zos91Ghfq9z4e4ZWHXwvWT+MlOxldN4WK
   vBlYhLZ3UJ/9177XkI/n0BVQY5oeNaHShba5vCxFyFmD4MgCWouR3n4yv
   VV7Mm4fhp/XBYd9T+eh/3eAEQ9Zcv/44W0KB2hTc+Ib4nnXf3OHZ+t7Vl
   o92OuAcKPdh2iLKic5KRFx9b4M7dWU/dlSIoqwQ7gNukPU4UgrxD59W2H
   PW0ax7NdfZ5T6tdDKHZidKulJrWB+fuuzr4tnBQ+E8176vnsxXcB/ZFAb
   G5Wl+u9jlWpLp0YqxWZTLaIy53VX2xGPC6etfwnJ9/k40uVRTqR7IJgHe
   g==;
X-CSE-ConnectionGUID: mxeS3VoOTEqeOvMFeGc0xw==
X-CSE-MsgGUID: 5hJaABbHTHOban2/6PzDww==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="116639354"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="116639354"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 02:10:57 -0700
X-CSE-ConnectionGUID: QFpkLrKQSBSUj4oVroqcRQ==
X-CSE-MsgGUID: kGT9NfHbQ7qsBksGc/ByfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="274373884"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.27])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 02:10:47 -0700
Date: Fri, 25 Sep 2026 12:10:45 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Armin Wolf <W_Armin@gmx.de>
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
	linux@analog.com, linux-iio@vger.kernel.org
Subject: Re: [PATCH 3/3] i3c: add i3cdev character device module for
 user-space access
Message-ID: <arY6lReqi-UDuorI@ashevche-desk.local>
References: <20260911210935.1353126-1-meaganlloyd@linux.microsoft.com>
 <20260911210935.1353126-4-meaganlloyd@linux.microsoft.com>
 <aqVUyYkpKT8iX4Jz@ashevche-desk.local>
 <20260916-454d66ca84cc91479b195aa5@linux.microsoft.com>
 <aqt_dCazxTDR4cpk@ashevche-desk.local>
 <f6eb60e0-e318-4846-a906-31cb965ccb15@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f6eb60e0-e318-4846-a906-31cb965ccb15@gmx.de>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_021057_900489_5CDB4C2B 
X-CRM114-Status: GOOD (  50.13  )
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

On Tue, Sep 22, 2026 at 10:53:09PM +0200, Armin Wolf wrote:
> Am 17.09.26 um 07:49 schrieb Andy Shevchenko:
> > > On Sat, Sep 12, 2026 at 04:34:01PM +0300, Andy Shevchenko wrote:
> > > > On Fri, Sep 11, 2026 at 02:09:35PM -0700, Meagan Lloyd wrote:
> > > > > The i3cdev driver is a character device driver that allows user-s=
pace
> > > > > to control and interact with I3C devices.
> > > > > Currently, it has the ability to perform Single Data Rate (SDR)
> > > > > transfers - basic reads/writes.
> > > > > =

> > > > > With the addition of sysfs driver_override, there is now a
> > > > > straightforward and direct way to match the i3cdev driver to any =
i3c
> > > > > device without stepping on the toes of more specialized drivers t=
hat are
> > > > > loaded automatically.
> > > > Is it safe? Why on the earth do we need this? The commit message ha=
s not enough
> > > > information.
> > > I can't see a reason that it'd be unsafe. To give additional confiden=
ce,
> > > it's already in-use in many bus_types:
> > This argument has nothing to do with i=B3c. Each bus is different on a =
physical
> > layer, electrical protocols and programming flow. Each of them has own
> > constraints.
> > =

> > > To answer why we need it:
> > > If we want to write i3cdev as a standard device driver, it can't
> > > actually match anything by default. This is because, some devices on =
the
> > > system may need specific drivers and i3cdev is generic and should
> > > technically match every device.
> > Yes, but I have seen no reason why we should expose i=B3c bus to the us=
er
> > space. With i=B2c we already know very well that it was (and still is)
> > a bad idea. Why i=B3c is better (especially taking into account i=B2c
> > compatible mode and more complex programming flow)?
> =

> in my experience sometimes during driver development you want to access t=
he device
> directly to test things, but of course this is incredibly unsafe.

Exactly, and not only unsafe, it's also quite dangerous to the HW. The user=
s must
*not* see or have this feature.

> I think we should taint the kernel as soon as userspace applications perf=
orm raw
> i3c accesses, but the idea itself is fine from my point of view.

Not only this, but guard it in the first place.
However my personal opinion is an bsolute NAK to this idea. If you want do
something, do the proper driver in the kernel.

> > > Since the driver_override is default NULL and is set via sysfs, this
> > > allows any specific drivers on boot to be loaded up and would allow
> > > explicit control on what device i3cdev gets bound to.
> > > =

> > > This was my rational. I will refine the commit message with more deta=
ils.
> > Put a real life example why the exposing i=B3c devices into user space =
is
> > absolutely necessary.
> > =

> > > > > This is accomplished by the i3cdev driver not having any entries =
in
> > > > > the i3c_device_id table. After boot, simply set the driver_overri=
de
> > > > > to "i3cdev" and bind the device manually via the sysfs bind knob.
> > > > > This can also be automated with udev rules as well.
> > > > > =

> > > > > The character device interface will be exposed at: /dev/bus/i3c/<=
bus
> > > > > id>-<Provisional ID>
> > ...
> > =

> > > > > +	for (int i =3D 0; i < metadata->nxfers; i++) {
> > > > Why is 'i' signed?
> > > Mostly for readability and to make sure the line length on loop heade=
rs
> > > is kept below 80 chars. As a precaution, to make sure that 'i' can
> > > represent any metadata->nxfers value without overflow during loops, I
> > > check that metadata->nxfers is less than/equal to INT_MAX in
> > > get_metadata().
> > No need to add useless checks.
> > =

> > ...
> > =

> > > > > +/** + * print_i3c_err() - Prints the I3C error encountered during
> > > > > the prior + * call to the core's transfer function.  + * @i3cdev:
> > > > > i3cdev_data object + * @metadata: Kernel's copy of i3cdev_xfers
> > > > > (ioctl I3CDEV_XFER input) + * @i3c_xfers: i3c_xfer array that was
> > > > > sent to the I3C core
> > > > > + * Returns: void
> > > > Huh?! Where is this coming from?
> > > In i3cdev_ioctl_do_xfers, if i3c_device_do_xfers failed, I wanted to
> > > print out the first I3C controller error encountered. The controller
> > > drivers can set this in the i3c_xfer.err field. Hence this function.
> > > =

> > > It's to aid debugging and provide useful error information.
> > > I can certainly refine the wording on the print_i3c_err documentation
> > > header to make this more clear.
> > My point is about kernel-doc. Why do we need the return section for voi=
d?
> > Where it comes from?
> > =

> > > > > + */
> > ...
> > =

> > > > Please, rely less on AI and more on the common sense and
> > > > proof-reading.
> > > I think I gave you the wrong impression. The new contributions in this
> > > series were written and developed by me. I used AI for quality assura=
nce
> > > and cross-referencing. Since I incorporated some AI-flagged suggestio=
ns,
> > > I tried to acknowledge that with the Assisted-by tag.
> > I see, then there is a room to improve the code. But the main question =
is
> > why do we even need this whole interface to begin with?
> > =


-- =

With Best Regards,
Andy Shevchenko



-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
