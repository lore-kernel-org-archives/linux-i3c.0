Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE520606A31E
	for <linux-i3c@archiver.kernel.org>; Wed, 21 Oct 2026 09:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0Y1LtWrt;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=yWtBfvaL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kWvOvqkhbjpoz32UKIaB3CPR0i6XhUVtOz0heTC/zlA=; b=0Y1LtWrt16uADh
	T6hhGAhHjTyWEQGC6b45aQYzSIZJmpQmJRsCqzattI8iMD37oDejkRN4SrP4uXdxiaM7joKSqRusG
	VQc/vp5Ya5oSpb+vrjN8bQojEKSZfSOff/2p43/Kjp6vnIZxBG3nvZMwxeC6LfGi8lrLdNPMZXHP6
	NBtjkcdmkfAYEMeVBgyGvVz0VebY++i+b9BC2/TtBkzqJyq9vJs/opvwpns39fgPFEK3hieLviBQI
	MX0Lqw+X/5DuwjY5lscVTTTVj+JqzJxJIeDVPSoAAyHlSWH0EP/gjAUmoSnVo8+3teIJ4Rty/DV4c
	BYego8UYsv8N9xFeJEwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJT5R-0000000BYDK-1yjp;
	Wed, 21 Oct 2026 09:58:21 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJT5N-0000000BYC4-3JmG
	for linux-i3c@lists.infradead.org;
	Wed, 21 Oct 2026 09:58:20 +0000
Received: from smtpout-01.galae.net (unknown [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id EB377C5CD72;
	Wed, 21 Oct 2026 09:59:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0E876606E3;
	Wed, 21 Oct 2026 09:58:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D296C10328934;
	Wed, 21 Oct 2026 11:57:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792576681; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=Zoi2YkoIf+uTpOt10EF9wNlEwLR3Zk9CW+IQ44/jYk0=;
	b=yWtBfvaLHer9waGUO8l3Djdfg0MRxi8AYaWr8qxlZK5oKPnCOxAMxulmPyXHqu9StyMw0S
	YNyi8O0SVY1C2yqFPafpenIRJBxGd6bB92byO/mXJZ77aOGEcgqlKRDlF5PGet2ejtN6tK
	qZPYFVthNuv5zzMhcfld9B6tpWJNYx6GmB/0xl8mDdELLGefQ6ESoN2cTVWeXv7dGavPBf
	WevUeGfsvbkUsYxDYq861rRrc/lb7zoBQmfqE/xq9PJEQK3SZPf1f40wdcK9qbCs1GU79J
	FqDkJCZJ35nY3hm/dFr3dAKXDf+W6IbW6079J2oHHgHPTzx4vdTUxfI+eou3aA==
Date: Wed, 21 Oct 2026 11:57:56 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Sam Agazaryan <samagazaryan@google.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i3c@lists.infradead.org, Frank Li <Frank.Li@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Meagan Lloyd <meaganlloyd@linux.microsoft.com>,
	Vitor Soares <vitor.soares@toradex.com>,
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/5] i3c: add i3cdev module to expose i3c dev in /dev
Message-ID: <202610210957562f3f6511@mail.local>
References: <20260921230603.2518652-1-samagazaryan@google.com>
 <arY6DfVf_9tZ_TCu@black.igk.intel.com>
 <arZTphXbVF5wagy2@shikoro>
 <CAHreonFzhYk6fDswn7OVZfL3ybUHU15G3_q9+1sDhe8h670r3A@mail.gmail.com>
 <as487H8-0Gc77mXI@ashevche-desk.local>
 <CAHreonHiesGbR4VB+3sRxoLDmNHXFFEB=6_o6TNedm-N6VksEQ@mail.gmail.com>
 <atXmovzepBLP8Mqo@ashevche-desk.local>
 <atXnS1ZKGVfHDNEK@ashevche-desk.local>
 <CAHreonFnUSKJMUpR0rmsnSMHEhcJ_W332_NTcGfTKiRkkPse_w@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHreonFnUSKJMUpR0rmsnSMHEhcJ_W332_NTcGfTKiRkkPse_w@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_025818_180455_B3CF399D 
X-CRM114-Status: GOOD (  36.74  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 20/10/2026 14:20:16-0700, Sam Agazaryan wrote:
> > Did I miss this in the initial explanation? If not, please add it next time.
> 
> That is just how the existing I3C core enumerates targets during DAA,
> not something added by this series. I will add a sentence to the
> cover letter and Patch 4 commit message in v6 contrasting it with
> i2c-dev to make that context clear.
> 
> > Do we have such use cases IRL? Do we have tooling support (at least pending)
> > somewhere? Why does it require user space interaction in _this_ way (meaning
> > IOCTL and /dev node)?
> 
> Yes, this is used in real systems today:
> 
> 1. Tooling & production users:
> 
> - i3ctransfer (Patch 5/5 of this series, and carried out-of-tree in
> AspeedTech-BMC/i3c-tools and vendor OpenBMC BSPs for several
> years).
> 
> - OCP Secure Firmware Recovery (DCR 0xBD) [1] and Caliptra Root-of-Trust
> recovery agents on OpenBMC/gBMC platforms (e.g., AST2700 / Caliptra
> MCU recovery tooling and BMC recovery daemons). Because Vitor's
> original i3cdev series was not merged in 2019, multiple silicon
> vendors and OpenBMC trees have been carrying out-of-tree forks of i3cdev;
> upstreaming consolidates those diverging implementations.
> 
> 2. Why an ioctl is required over a read and write:
> 
> - In the OCP Secure Firmware Recovery v1.1 specification (Section
> 8.4, "Recovery I3C Interface Block Read via Private Write and
> Private Read"), every recovery command read is a combined transaction
> consisting of a Private Write with no STOP, followed by a Repeated START,
> followed by a Private Read, and finally a STOP.
> 
> - Because write() and read() only submit a single transfer at a time
> (nxfers = 1), the controller emits a STOP condition on the wire
> at the end of write() and drops the bus lock. Submitting multiple
> i3c_ioc_xfer descriptors in a single I3C_IOC_XFER(N) ioctl is
> required so i3c_device_do_xfers() queues them together under one
> bus lock acquisition and the controller emits a Repeated START
> between messages (as well as passing HDR mode/cmd parameters).
> 
> [1] https://www.opencompute.org/documents/ocp-recovery-document-1p1-final-pdf
> 
> > So, imagine that someone submits a kernel driver for a simple device, while
> > another person already uses the driver for multi-functional device where the
> > former one is driving only part of it. Strictly speaking the kernel driver
> > submission becomes a user space regression. Which effectively means that whenever
> > you open i3cdev, no other kernel drivers may appear. Yes, I understand that
> > a poor victim of such an unlikely course of events may recompile the kernel,
> > disable driver, et cetera, but this still raises the same question, why do
> > we do that to the mere users?
> 
> Note that a user does not need to recompile the kernel if a kernel
> driver binds to a device they wish to access via i3cdev. Because i3cdev
> handles BUS_NOTIFY_UNBOUND_DRIVER, unbinding the kernel driver at
> runtime via sysfs:
> 
> echo <dev> > /sys/bus/i3c/devices/<dev>/driver/unbind
> 
> automatically triggers i3cdev_attach() and exposes /dev/bus/i3c/<dev>
> without rebuilding the kernel. Also, I3C drivers match against a
> target's MIPI-assigned DCR or 48-bit PID (Manufacturer ID + Part ID),
> so a driver for a simple device will not accidentally match a different
> chip's PID or a dedicated DCR like 0xBD.
> 
> > P.S> Still not convinced, that this has to be an ABI. For debugfs and something
> > like this, no objections, but ABI.
> 
> Production BMC recovery daemons cannot rely on debugfs, which is
> optional and restricted or unmounted on production builds. A character
> device in /dev/bus/i3c/* provides the stable ioctl those tools need and
> integrates with udev so non-root daemons can be granted access to
> specific target nodes (e.g. matching on DCR 0xBD), similar to spidev
> and hidraw.
> 
> 
> > Forgot to ask, but do they interfere?
> 
> Is this in reference to i2c devices on the i3c bus? No, I3C transfers
> and legacy
> I2C transfers on a mixed-mode bus do not interfere:
> 
> 1. Both i3c_device_do_xfers() and i3c_master_i2c_adapter_xfer() acquire
> i3c_bus_normaluse_lock(&master->bus), so I3C and I2C transactions on
> the same bus are serialized by the I3C core.
> 
> 2. Attached I2C client addresses are marked as I3C_ADDR_SLOT_I2C_DEV in
> the bus address slot table, preventing DAA from assigning an I2C
> device's address to an I3C target.

On my side, I believe i3cdev can be added to the kernel and that it is
way safer than i2cdev but I agree that the ABI has to be properly
designed, maybe we need to version it or have a way to probe for
supported features so we can update safely later on. It is failry simple
right now but I feel like we are going to see people with more needs
than initiating transfers.

Also, I think this should not bind to any devices by default and make
binding explicit.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
