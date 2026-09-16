Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB5AC88E7F
	for <linux-i3c@archiver.kernel.org>; Wed, 16 Sep 2026 19:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YZk7ORw5OsLCwJcy7OgFvZqMEPq9hy/RXVRKWcA9ziQ=; b=BN6oI+ag1VoFLK
	EoaLxVRdu9wQcQ1FDOvzClF+v07MisxzlZn0ii43xSxEokYaHWFDAnwWBGgfdEpdkVE0Olu+I+Xj1
	MICaa8mpDEoAOAYZLLiAjpfBP8/i3u7aHwO9v3j2ZlMY6O6BYBf1Sjs8Vd3IwN5fr2rcYyYPt7DJG
	jPkwV7zyKrKI/hD6X1x+fpqHqUc9zuHLsLOAEFsE6rYx2ae805/l7Xd5pf2MUzSdQkA1LGi25oPQw
	aW21EyjWbZgq9/EDAtQZ/aYN10apA0mDO4C0rB/G8/vYjz2jINthjsLuly5CCsBo+WEdgAe4kM0xK
	+ugv9jRAX++Ix4u2XeUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6vKD-0000000A1vi-3ABA;
	Wed, 16 Sep 2026 19:29:45 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6vKB-0000000A1v9-0Izj
	for linux-i3c@lists.infradead.org;
	Wed, 16 Sep 2026 19:29:44 +0000
Received: by linux.microsoft.com (Postfix, from userid 1223)
	id 5F7A020B7169; Wed, 16 Sep 2026 12:28:57 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 5F7A020B7169
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1789586937;
	bh=Ej3acz1ERm1wwWX5seCa4dhXTMU8sALw08ePW6OJy/0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TLYK2BgWaSLITsSxRYxEDLQKeMXy8EEuQbRKfLSvSKuwBsnGvIcxtPfGq7bBtsd7X
	 4GpMvqPFW7/9NjDBllUlRko6lTsxP6etk3wPbZwwpugqLwD1MP1eLWo8r6E2AEWvuI
	 dBZ9WOUwFyEAExm2PokO+oTrOUMK0bvTFFql3HXo=
Date: Wed, 16 Sep 2026 12:28:57 -0700
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
	linux@analog.com, linux-iio@vger.kernel.org
Subject: Re: [PATCH 0/3] I3C character device driver using driver_override
Message-ID: <20260916-8a117e874c96753fd704b163@linux.microsoft.com>
References: <20260911210935.1353126-1-meaganlloyd@linux.microsoft.com>
 <aqVTBIKRP3iRDCvf@ashevche-desk.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aqVTBIKRP3iRDCvf@ashevche-desk.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_122943_141454_32CAB757 
X-CRM114-Status: GOOD (  43.29  )
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

On Sat, Sep 12, 2026 at 04:26:28PM +0300, Andy Shevchenko wrote:
> On Fri, Sep 11, 2026 at 02:09:32PM -0700, Meagan Lloyd wrote:
> > This is a rework and revival option for Vitor Soares' I3C character
> > device driver patch series from 2020 [1] that I've been exploring for a
> > few months.  Recently there was a revival posted to the list [2], so I
> > wanted to share this design option as well.
> > 
> > In [1] and [2], the i3cdev driver automatically attaches and detaches
> > depending whether another driver has attached/not. In [1], Boris was
> > suggesting we explore a more straightforward and traditional binding
> > method aligning with the Linux driver model. At the time, there wasn't
> > a way to auto-bind while keeping manual binding possible as they shared
> > the same match() hook. Now with the new driver_override feature,
> 
> Where is it new? It's quite an old mechanism in the driver core...

My understanding is that this support was added in March 2026 here:
https://lore.kernel.org/all/20260303115720.48783-1-dakr@kernel.org/

Some busses had their own version of this, but the above series made
a general, re-usable solution available.

> 
> > the auto-binding of i3cdev on boot can be avoided if the i3cdev driver has
> > an empty match ID table. After boot, where specialized drivers would have
> > already bound, user-space can explicitly opt-in by setting the
> > driver_override sysfs file with 'i3cdev' and manually binding via sysfs
> > (or by simply loading the driver if it's loadable). This can also be
> > easily automated with udev rules that run whenever the I3C core exposes
> > a new device.
> > 
> > One downside of the automatic attach/de-attach is that if a different
> > driver is loaded later, the first driver could have altered something
> > on the device, breaking any assumptions of the subsequent driver.
> > 
> > My series builds on [1] through:
> > 0. Addressing code review feedback in [1] from Greg, Boris, and Randy.
> > 1. Using actual_len for accurate read response reporting. The kernel
> > will report actual_len received from the core to user-space via the
> > uapi i3cdev_xfer struct.
> > 2. Placing limits on the number of transfers and bytes in requests to
> > prevent unlimited-sized transfers or kernel memory allocation
> > 3. Checking inputs and descriptive return codes as guard-rails
> > for user-space and to ease use of the i3cdev driver
> > 4. Checking on MWL to ensure that we respect device limits
> > 5. Proper lifetime management of i3cdev_data and underlying device
> > 6. Addressing dangling fops in the event we have an open file descriptor
> > when a device gets unbound.
> > 7. Fast-path locking to ensure transfers complete before a device is
> > unbound.
> > 8. Allowing only one file descriptor per I3C device to avoid bugs
> > around multiple processes interacting with the device and altering
> > the device underneath the other. For example, without this, one process
> > could change the device's page or address pointer register underneath
> > the other process.
> > 9. copy_struct_from_user to ensure struct i3cdev_xfer could be extended
> > in a compatible way. This is to be forward-looking towards potential
> > HDR mode expansion and code reuse.
> > 10. Reserving the IOCTL number formally
> > 11. Updating the Documentation to be a syntax correct example program
> > template.
> > 12. Preserving /dev/bus/i3c/<bus id>-<Provisional ID> naming while
> > allowing sysfs path to be neatly named i3cdev-<minor>. This avoids
> > repeated <bus id>-<Provisional ID> in the sysfs paths which can be
> > confusing/circular-looking.
> >     e.g. /sys/bus/i3c/devices/0-deadbeef001/i3cdev/0-deadbeef001 ->
> >          /sys/bus/i3c/devices/0-deadbeef001/i3cdev/i3cdev-0
> > 13. Updating all naming references related to i3c_priv_xfer to align
> > with new i3c_xfer struct
> > 14. Updating the MAINTAINERS file for the new pieces of code
> > 
> > Note that i3c-tools [3] or a fork of it will need small updates:
> > 1. Update include/uapi/linux/i3c/i3cdev.h to match updated uapi structs
> > 2. In i3ctransfer.c, use actual_len for reads
> 
> > I've added MODULE_VERSION("1.0.0") in the i3cdev driver, so i3c-tools
> > could use that to determine whether to use the old out-of-tree uapi or this one.
> 
> Absolutely no. This is legacy macro which has no need since Git era. In Git
> the module version is the Git SHA hash of the tip of the used tree. Nobody will
> understand what 1.0.0 means and how it maps to the applied patches (if any of
> them affects the behaviour of the feature in question).
> 
> On top of that, upstream has no clue what and how many possible custom ABIs /
> UAPIs exists, and we do not care, to be honest.
> 
> > [1] https://lore.kernel.org/linux-i3c/cover.1582069402.git.vitor.soares@synopsys.com/
> > [2] https://lore.kernel.org/linux-i3c/ap_1-gFF7S821xJT@ninjato/T/#m9107c1785a4a16b1b3cb84c3269d17fac35819c8
> > [3] https://github.com/vitor-soares-snps/i3c-tools
> 
> -- 
> With Best Regards,
> Andy Shevchenko
>

My reasoning was that i3c-tools has been around for years now and it may
be in-use assuming the UAPI from [1]. Adding MODULE_VERSION was a low
effort, compatible, and reliable way to keep using the same i3c-tools
repo (and accommodate a changed UAPI).

In any case, in Sam's thread [2], there is talk of moving i3c-tools into
the kernel's tools directory. That's the better solution, so I can drop
the MODULE_VERSION in future revisions.

Thank you,
Meagan
 

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
