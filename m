Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D246606A33D
	for <linux-i3c@archiver.kernel.org>; Mon,  9 Nov 2026 21:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PPpllNrs;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WhNLbKUt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VY1SFLg78ydzImWWsv02+AOtd+tg/JTAkZqn1gvJBrY=; b=PPpllNrsYo7Hl+4NyAqtMGzUXY
	7FY3x9kA3c8WMaZl+r6r9H943ds6ad3d6YATirWTSbpt6zPdozeuF1P9QtuQO8SgxV6F/NbTC9Lmz
	d1dRsJnSxis+HNLQ/Lqr8WDrbjICuy+5vlwoCgEAYHMm162+3aVX4HFXU1NfoOhe/fmCCWecl24vh
	ofwvsddmYG0fqYTbKZhPMLRQbncyV9/I0TstlZGgXV6FAh4+zMgF6thG50BCdWugPis41y0eLc+/J
	CRVN2Sp452tp2vJrIapxsQvr9cKBXGxOhPQz7q/GEEIqX2dWg7W4dymGHK7Wfhw0BEVClfJxn4k+9
	pj7L/Xcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQXF1-00000001odG-41fu;
	Mon, 09 Nov 2026 21:49:27 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQXEu-00000001ocb-0Tmw
	for linux-i3c@lists.infradead.org;
	Mon, 09 Nov 2026 21:49:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794260960; x=1825796960;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q2UzRyhaM40DLj8CMTHMez0m2szpSS2h1gwd08COTzQ=;
  b=WhNLbKUtjxbarDdncnIRkZbAJaTnxFjZAAIewU+roMBberNYLn5sl6ed
   fmXfBbJq7di1jU3WXW01Scf7SrMFpQzewiihcxgiyh5zGWKekRv3ih88q
   k3HA58ktxnNoGGn3XhuwFphN55jrmiKde3HzzX1OuUrRSIi1+MWvdZ7Ku
   aa4Mroy8XI3crPwCoU3iQuCvJJwjHddwyXwvTLEvpV/bAcKvx1PRa63Ug
   6v0doPYirzXiTynpZXeaVmKFhVEiw1EvvWYBRHw7z9i7z1hcn4lohyEQh
   pXAtMSHHmbig9ma5FofYbNBgHcY+kqkQTipoNaCBMxass1T1LEDotGLSS
   w==;
X-CSE-ConnectionGUID: jlpUilfQR22HIvN75ThSKw==
X-CSE-MsgGUID: gorkuozdSJC4Gusnox5LiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3023909"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="3023909"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 13:49:19 -0800
X-CSE-ConnectionGUID: sLzjHxyhRkGJ3Fqvas8SXg==
X-CSE-MsgGUID: DDsrY47BTsaSpcaHsy4PjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="8116535"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 13:49:16 -0800
Date: Mon, 9 Nov 2026 23:49:13 +0200
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
Message-ID: <avI_2ddihPu_sxCe@ashevche-desk.local>
References: <as487H8-0Gc77mXI@ashevche-desk.local>
 <CAHreonHiesGbR4VB+3sRxoLDmNHXFFEB=6_o6TNedm-N6VksEQ@mail.gmail.com>
 <atXmovzepBLP8Mqo@ashevche-desk.local>
 <atXnS1ZKGVfHDNEK@ashevche-desk.local>
 <CAHreonFnUSKJMUpR0rmsnSMHEhcJ_W332_NTcGfTKiRkkPse_w@mail.gmail.com>
 <202610210957562f3f6511@mail.local>
 <ati4B33tnKsCD4c_@ashevche-desk.local>
 <CAHreonEbHrPCCro+2u5LC2reVk2fzprC4sTLi00nyh8U1=VdXA@mail.gmail.com>
 <at8xuIWvvqLoicTg@ashevche-desk.local>
 <CAHreonEjSXs7ecOrCtqXh3gXdkGeqK=8mgjTUHLk3q0aOuP4pA@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHreonEjSXs7ecOrCtqXh3gXdkGeqK=8mgjTUHLk3q0aOuP4pA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_134923_820990_E422F756 
X-CRM114-Status: GOOD (  37.96  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 08, 2026 at 10:11:52PM -0800, Sam Agazaryan wrote:

[...]

> > > production BMC firmware update and recovery daemons running in OpenBMC
> > > server fleets (managing Caliptra Root-of-Trust and SoC recovery targets
> > > over I3C), as well as production server accelerator management daemons.
> >
> > Okay, but they are not (obviously) use the upstream solutions for that.
> 
> Right, they run on vendor kernels carrying out-of-tree i3cdev patches
> based on an earlier version of this series, so there is no upstream ABI
> to stay compatible with. This series already departs from that ABI
> and v6 will change it further based on the review in this thread.
> 
> > But it's still unclear to me why this can't be moved to the kernel space?
> > There is no user space that communicates with upstream kernel in the way
> > you described, they should have used a custom (out-of-tree) solutions, right?
> 
> It could be, and the closest in kernel fit would be an OCP recovery
> i3c_driver exposing fw_upload. But pushing an image is only one part of
> the spec, and an in kernel driver would have to cover all of it, not
> just the subset one recovery agent happens to use:
> 
> - status and identity: PROT_CAP, DEVICE_ID, DEVICE_STATUS (with
>   recovery reason codes), RECOVERY_STATUS and HW_STATUS
> - reset and boot control: DEVICE_RESET with forced recovery and
>   flashless boot, and multi-stage activation through RECOVERY_CTRL
> - memory spaces: code, critical logging and vendor-defined CMS
>   regions, through either the indirect window or the FIFO interface
> - the VENDOR command and vendor-specific status, which differ per
>   SoC vendor

Good. We can see that being implemented step-by-step.

> Which of these an agent uses, when to trigger recovery, and which image
> goes with each stage all vary by platform, and the BMC's userspace
> already makes those decisions.

Based on the absence of any interface in the kernel before, there is no chance
to regress anything. It might be just a good will to try hard to support
existing out-of-tree solutions.

> An in-kernel driver would need new sysfs ABI for this, and that ABI
> would have to grow as the spec evolves: v1.1 alone added multi-stage
> activation, flashless boot and the indirect FIFO interface. With a
> target-scoped transfer interface, none of that needs kernel changes.
> fw_upload and lib/pldmfw fit well where a kernel driver already owns
> the device; here the only consumer is the BMC's management stack.

Yes, and I see no issues with that. Opening the whole i3cdev just for the same
reason sounds like an overkill. Especially if we do *not* expect any more users.

> The kernel already splits things this way on I3C for MCTP: mctp-i3c
> binds by DCR and provides the transport, while PLDM firmware update
> runs in userspace. i3cdev could be made to bind the same way, by the
> OCP recovery DCR, instead of binding to every unbound target. Outside
> I3C it is the same pattern: nvme-cli does NVMe firmware download/commit
> through the passthrough ioctls, and fwupd updates devices over hidraw,
> usbfs and drm_dp_aux_dev.
> 
> So the kernel side stays a small mechanism consisting of target-scoped
> transfers to explicitly bound devices, and the recovery policy stays
> in userspace, where it can follow new spec revisions without new kernel
> ABI.

If there are success stories, those examples might help to justify your
approach. It makes sense to mention that in the cover letter with the
summary on their designs (and split).

> > > If you mean electrical bus recovery, i3cdev doesn't perform
> > > bus-level electrical recovery. It only submits normal target-addressed
> > > transfers via i3c_device_do_xfers().
> >
> > But how it will do if the i2c device blocks the i3c bus in mixed mode?
> > I mean, how will it affect the i3c transfers on the wire?
> 
> Electrically speaking, SDA and SCL are shared, so an I2C target that
> holds SDA low blocks every transfer on that bus, I3C and I2C alike,
> regardless of which driver issued it. The controller reports the failure
> as a NACK, arbitration loss or timeout, depending on the controller.
> i3c_device_do_xfers() returns the error, and i3cdev passes it back to
> userspace from the ioctl.
> 
> So i3cdev behaves the same as any in kernel I3C driver on that bus
> since it uses the same transfer path. Getting a stuck bus released is
> up to the controller driver rather than i3cdev. For what it's worth,
> section 8.4.1 of the OCP recovery spec recommends a pure I3C bus for
> critical recovery paths, and for mixed buses requires validating that
> I2C targets have spike filters and considering isolating or
> disabling the ones that can't. I2C devices on a mixed bus are also not
> allowed to stretch the clock.

-- 
With Best Regards,
Andy Shevchenko



-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
