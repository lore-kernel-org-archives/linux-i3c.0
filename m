Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A551606A321
	for <linux-i3c@archiver.kernel.org>; Mon, 26 Oct 2026 10:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jwcXN/4u;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kHAo1Ll1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EH9z8JtfOkJ8M5FBiuZEBIH8DlmAt1iVtyLW3Ampbks=; b=jwcXN/4u4RZH3GqudAOec52QOf
	4vhk3YwXxAFN0XDUeLcJBt9g84GkdXgMf3MaZeo6zAFj047A/BeigoVX6u7gPoMyc8hjGJQecJOqV
	o7cpf0rudVds8P3yCzpxsOuE2wYXtthZVp7JYEYsKHcgUXSZORfAdfCOmX+IiDrqITGrAzseEMK2z
	SLHa7DYn6lGbGmTrHnN47QHfNEJqdy9DVSEOttoeMJcO3oR3HOwgklmaCrclICkiT/WInWkPPTFqb
	0zIMn3EGezkt5ihfhOMLh2CBa8chQLzF/eagmSJH6Ijec16X0CCg/60KQObI5hdvqd+PBsO7nAbFC
	5dg19LzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLIN0-00000002Is5-09D2;
	Mon, 26 Oct 2026 10:56:02 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLIMx-00000002IrC-1wyf
	for linux-i3c@lists.infradead.org;
	Mon, 26 Oct 2026 10:56:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793012159; x=1824548159;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=t+9BSrdqZH7slWhiluRxNvKz7htW0n1OoUMr/Yn1H1E=;
  b=kHAo1Ll1MG6SsWl/cFwz+tRmygO1nPH4VL1cOT1keoDlr/ZJ6ecdM6Le
   5Tg+4FgEouukydyS7PHaIcy7PpWw5K39S5dBshtIuXEsp4mKIxhaDZf75
   9xD6jAT7sbnSQXsceo83YKMlIOaTW0nhdtBqs9CFiiyXT5l10qbdPokhk
   eazMJ7Ux8EDx4tCYhVCUOrkHIAzJWUysXDwQRTGj3bL2iQpHwpyfln9yi
   hyo4Kk8ONXuX6ma0SqLU0OArdW6BjHjDbknFGCXA61s49rC+5UDYqAi1u
   UKqbIolhbNtISUsty2Z4K7/hMImjaa9ro2iyqfVCA4yj5UIERdFwwvkOI
   w==;
X-CSE-ConnectionGUID: n4gESnycT+atSXM0oYLzFQ==
X-CSE-MsgGUID: S8cvZr3KTDi/bCUEXVnINw==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1687707"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1687707"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 03:55:58 -0700
X-CSE-ConnectionGUID: ZCYcyZaDRW2z9u4poHyPcQ==
X-CSE-MsgGUID: eSlMO/hiQvK7IdrlRx5Ing==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="6059573"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.93])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 03:55:55 -0700
Date: Mon, 26 Oct 2026 12:55:52 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Sam Agazaryan <samagazaryan@google.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
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
Message-ID: <at8xuIWvvqLoicTg@ashevche-desk.local>
References: <arZTphXbVF5wagy2@shikoro>
 <CAHreonFzhYk6fDswn7OVZfL3ybUHU15G3_q9+1sDhe8h670r3A@mail.gmail.com>
 <as487H8-0Gc77mXI@ashevche-desk.local>
 <CAHreonHiesGbR4VB+3sRxoLDmNHXFFEB=6_o6TNedm-N6VksEQ@mail.gmail.com>
 <atXmovzepBLP8Mqo@ashevche-desk.local>
 <atXnS1ZKGVfHDNEK@ashevche-desk.local>
 <CAHreonFnUSKJMUpR0rmsnSMHEhcJ_W332_NTcGfTKiRkkPse_w@mail.gmail.com>
 <202610210957562f3f6511@mail.local>
 <ati4B33tnKsCD4c_@ashevche-desk.local>
 <CAHreonEbHrPCCro+2u5LC2reVk2fzprC4sTLi00nyh8U1=VdXA@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHreonEbHrPCCro+2u5LC2reVk2fzprC4sTLi00nyh8U1=VdXA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_035559_546001_F164AE37 
X-CRM114-Status: GOOD (  28.34  )
X-Spam-Score: -4.7 (----)
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

On Thu, Oct 22, 2026 at 01:23:10PM -0700, Sam Agazaryan wrote:
> > > 1. Tooling & production users:
> > >
> > > - i3ctransfer (Patch 5/5 of this series, and carried out-of-tree in
> > > AspeedTech-BMC/i3c-tools and vendor OpenBMC BSPs for several
> > > years).
> >
> > So, nothing in production, meaning we can design that in kernel differently.
> 
> In hindsight I should have ordered that list differently, the second bullet
> right below that is the production use case: production BMC firmware update
> and recovery daemons running in OpenBMC server fleets (managing Caliptra
> Root-of-Trust and SoC recovery targets over I3C), as well as production
> server accelerator management daemons.

Okay, but they are not (obviously) use the upstream solutions for that.

> > But why recovery mechanism can't be kernel-driven? With some sysfs
> > (just as an example) knobs to say "I want to run now a recovery flow
> > on this bus", et cetera.
> 
> To make sure we're talking about the same thing: "OCP Secure Firmware
> Recovery" is not electrical bus recovery (like recovering an i2c or
> i3c bus itself by bit-banging to unstick a hung bus). It is device
> firmware recovery and provisioning (similar in concept to USB DFU) to
> recover and boot a target device that sits on the bus.

A-ha, so this is a device programming protocol on the top of the i3c bus.

> This lives in userspace because it is part of the BMC's Redfish/RoT
> firmware management stack (handling network image streaming, signing/key
> management, and chassis-level recovery policies), rather than a single
> "recover this bus" hardware toggle. And it uses I3C_IOC_XFER because
> each protocol register read/write requires combined Write + Repeated
> START + Read transfers (or HDR transfers) to that specific target node.

But it's still unclear to me why this can't be moved to the kernel space?
There is no user space that communicates with upstream kernel in the way
you described, they should have used a custom (out-of-tree) solutions, right?

> > Oh, that's quite a dangerous "feature"! Can we avoid doing that? Otherwise it
> > means any missed guard against unbind for the system controller related chips
> > may lead to real HW damage. I'm totally against this feature to be in any way
> > of an ABI. If you want that, do it exclusively via debugfs with a big fat
> > warning that this may lead to HW damages.
> 
> Agreed -- as Alexandre also suggested in his reply, it sounds like
> automatic binding isn't favored here due to risk of hardware damage.
> 
> > Can i2c device require an i2c recovery flow on the bus? If so, how would
> > it be combined together with the i3c recovery flow(s)?
> 
> If you mean electrical bus recovery, i3cdev doesn't perform
> bus-level electrical recovery. It only submits normal target-addressed
> transfers via i3c_device_do_xfers().

But how it will do if the i2c device blocks the i3c bus in mixed mode?
I mean, how will it affect the i3c transfers on the wire?

> If you mean OCP device firmware recovery on a mixed bus:
> 
> An I2C recovery target on a mixed bus uses standard SMBus Block
> Read/Write transactions through the controller's i2c_adapter (not
> i3cdev) while an I3C recovery target uses I3C Private Write/Read
> transfers via i3cdev. On a mixed bus, the Linux I3C core already
> configures the bus mode/SCL rate according to the I2C targets' LVR
> spike-filter capabilities and serializes both paths via
> i3c_bus_normaluse_lock(&master->bus).

Good to know, thanks!

-- 
With Best Regards,
Andy Shevchenko



-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
