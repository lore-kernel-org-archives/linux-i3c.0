Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52564606A33D
	for <linux-i3c@archiver.kernel.org>; Mon,  9 Nov 2026 06:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a9MbKkxN;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=epLWJWX+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=R70II/s9EhfSoxlTHHRH/S+mxZN2TJPfCwvj04qut9w=; b=a9MbKkxN7qhGeRaDiS7ofdJ7cw
	wr6VX/VBnS9D4ajIhgl947ULOWNe3uhyWUwsH2eJ78SepUN0vAvYcGISiYAmWaSFBWkmlBkhlz5TT
	A8fU6Bw0+BJJkGagTeaV3e95r8UdrW7a+CEA6QjwKvP9qa3yycAKg+zkW0M8YyR3IUwrgRgvqRSR7
	0NLNI+Bdo0Tbjh3olVPYsYfPncIePKZx8vLKnG40ic1TIwnxVkS8gVGKGohj2s7e1kEo4JL2BAYjd
	G8EbuBQTiOW1m+YIJn6Gl7p4yTgg2HBcALHK7+8vGhmGMpn6wxAWtisdyphQAFX5y/BqQ0tnaBWtW
	OS8yn7AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQIbz-0000000HTjR-0GoC;
	Mon, 09 Nov 2026 06:12:11 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQIbv-0000000HTj4-127V
	for linux-i3c@lists.infradead.org;
	Mon, 09 Nov 2026 06:12:10 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-8b10d24345dso3845297b3.3
        for <linux-i3c@lists.infradead.org>; Sun, 08 Nov 2026 22:12:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794204724; cv=none;
        d=google.com; s=arc-20260327;
        b=Yqj77kxlFE+Q/xr0pX8M3DqhbqQZTUWuKs8834EpvOnGVk+ti9DVDqm+lCyndm1vwE
         MDsjUV/V/VytZ+teW/Ht13K9LWhaaaTkWhbnH488EOeRcSAHKjCi9kU5p1QHVGYYnVep
         E8qJTI4PhZ/ymXtL4QfRqkhblOq5qwnJVX1jh3w+Vhw97GD+aexdSIUHlpaoWmpSMlm+
         7N+WtbaVDUsJ3DZu9Jdkeu6KnDcbeyjfxCyZKvAdcSsvpLrD/ElaawJaVmEEV+1fP+YY
         AGTLQ27aL8H3y76NxTqkorV0h0lmOLW4ByJr7VrPC2SPDi94wMEehlUlRWv4FIg76woU
         eiLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qYE/EoLV5yV19vYhcT5OkSnBGP9SIt6dH1phfeE1EpE=;
        fh=02avWYfY5WK02ryXh+bVaOcixAgGAs6zPGSiTVf8HgI=;
        b=VtjxnQD7RYJFIHZPMhs+cFAITrsSN3IO5BSJVhFTHA7ZDBjcI7tF0g5JANjSPvgOJQ
         AYcEb+L6tmgbKahopuFhtmG/X/9BkJ/Y40yQXJCM1daYTuzVZBAmPYrUaoZoq14Y/dqC
         9ehnOe6ENnuX/jzAxPi1wZ4SXFOkJCjxqkdb5XLkto1bgC/8PwqBpvXm+NNQun0/qJ6F
         FGFRk6cdRlDJHEKadfDRZa30mPF/Upv4SPguOChlhT0XwAdodDXa66y4XplD+L1/6yFb
         Lyf4ftqV/i3A6oIA8oPRNhcr+My6Y6NwJuzQ3ow8IRPdZTYyv7uAC4QnfWZk5u/3VCxo
         ytWQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794204724; x=1794809524; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qYE/EoLV5yV19vYhcT5OkSnBGP9SIt6dH1phfeE1EpE=;
        b=epLWJWX+hLZgMn7f1x7CDh1M+7wxJs+/6A3ZDEYCm0GQEJn6igUd0jujaMYiwEW5wD
         fsoZdhJLmkUuXg7YWrG9tUL0Sj0MeG8mm64hx13r/j3MQYbQeKj1U7Yo7kOnQoQVF2er
         vY6yi1qB1mg3OKhLQb8h3ysi8ej/sHBmbAtZp1zA1g14zq8v2JkLqQWmLVImQxXeb75E
         hGo6ei5QRN2xCubmtpNQEoamxTIoMlq39GO6a65ZwUAQ16VRfIJWnFTb2m66a4i5BoU1
         TcNMH0iAT/ugPj9XyW9LIYmi1UJjn1jBTiGVCHXMumQw5Sg+HTEyEs3Z0XOH/w8CeTa8
         i/pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794204724; x=1794809524;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qYE/EoLV5yV19vYhcT5OkSnBGP9SIt6dH1phfeE1EpE=;
        b=JQ9i02aJ0ccNj21RNiBGapMU+Qwyb4Lmr5RDTQqQgWI+ZcXYpmxpvfpE4TavDnQie+
         XEBjqkvItZO2B0t5935M7ltQJE3dfU+GbyWoXPlvb2ioUCNoFtK2Oa8MowsDtVkrYAfd
         WuvpuNthmjqbStDHVk29l6Wqe6Kvnwm3E0S3tmYqO27JfZPV6lzIdgR7N/EwGpx6s9F/
         fsHFMqsN++Zteoo34dsb2p3u9YKWNXUsUGmoPBiqvO+8f02i8VEsWPbWLw66//EKtRUa
         qX7Eg6tcWwR4dUpIGHgz/1ucOGHC/8JbCMDohZNVE+ScjlujgOzIFx8ubf3cdrfBd5WP
         6E2w==
X-Forwarded-Encrypted: i=1; AL+hErGg1ehdyaeBaVAWnzVQ2pWJ0FYCaocsFm03/fcDYJoi9yufkHZj6itOJ9FfY6jTTKFPqDX+ixifvng=@lists.infradead.org
X-Gm-Message-State: APuU4Z+QMg6G8tArKyBKiG7PcC+sHV55asaci/OnAi0ruuWCUR2/uu39
	9mnwSw7E1B1b9Dos0WMmX8onTllZ6b0c4ZfQDRaFlexiV7vYq0KAuWkfMEwBL5qn8f6bfTBjGL+
	vrvM8EhNsZioYoK+S8cAGlNLZ5Dn04qMwXHUETtgW
X-Gm-Gg: AYBFou0pY+DMURIHstD456Y7LfmmroUqlL5jJTO8nVLKyekDNqJQOVTv163ZdI8uoVf
	3qCLRbUh4WMt1M3pefjvI7WgcX0s6P/mjg1TC2QWuoNCWOWjyEcwA4F54pjpvCH6Fa6HIm6qtqI
	jw8cQUO+xRTETOdSmNXB4E5tw58KwAV/LOW1PrHKRvkglkYI7ImZxsz++OVn7W+wPKelvEVq49G
	Xjvpcbah0lN0xHQDbOti0F4tXlKyQk9GSAw6BXjoa3fk/Rlm8nO6AZbESmvcO1z96xilexmMTIn
	XGxqBjt9qxjKwyT4kfT52jrpaCbqEcfWkHi461YL67gVj3ZoGAt7Wfh97mhX/KDxtJuxwAliUVm
	hnK1y5mQyDoKSBzFf5ManjhmD360MFJM8jrj4N7+OQQUMMtzDMeFqG6bUy8Rtec5XNPc=
X-Received: by 2002:a05:690c:800e:10b0:8b3:2eb4:1429 with SMTP id
 00721157ae682-8b36cc69bfcmr13058457b3.65.1794204723670; Sun, 08 Nov 2026
 22:12:03 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <arZTphXbVF5wagy2@shikoro> <CAHreonFzhYk6fDswn7OVZfL3ybUHU15G3_q9+1sDhe8h670r3A@mail.gmail.com>
 <as487H8-0Gc77mXI@ashevche-desk.local> <CAHreonHiesGbR4VB+3sRxoLDmNHXFFEB=6_o6TNedm-N6VksEQ@mail.gmail.com>
 <atXmovzepBLP8Mqo@ashevche-desk.local> <atXnS1ZKGVfHDNEK@ashevche-desk.local>
 <CAHreonFnUSKJMUpR0rmsnSMHEhcJ_W332_NTcGfTKiRkkPse_w@mail.gmail.com>
 <202610210957562f3f6511@mail.local> <ati4B33tnKsCD4c_@ashevche-desk.local>
 <CAHreonEbHrPCCro+2u5LC2reVk2fzprC4sTLi00nyh8U1=VdXA@mail.gmail.com> <at8xuIWvvqLoicTg@ashevche-desk.local>
In-Reply-To: <at8xuIWvvqLoicTg@ashevche-desk.local>
From: Sam Agazaryan <samagazaryan@google.com>
Date: Sun, 8 Nov 2026 22:11:52 -0800
X-Gm-Features: AclHuK8twAQYbIjqqABuLJ8N8Enju4jqOkg-3e7B0XPw1E2pL1zthrnIjVf8EtY
Message-ID: <CAHreonEjSXs7ecOrCtqXh3gXdkGeqK=8mgjTUHLk3q0aOuP4pA@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] i3c: add i3cdev module to expose i3c dev in /dev
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i3c@lists.infradead.org, 
	Frank Li <Frank.Li@nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Adrian Hunter <adrian.hunter@intel.com>, 
	Meagan Lloyd <meaganlloyd@linux.microsoft.com>, Vitor Soares <vitor.soares@toradex.com>, 
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_221207_327180_E0F2A3F9 
X-CRM114-Status: GOOD (  26.14  )
X-Spam-Score: -17.6 (-----------------)
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
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> > [...] production BMC firmware update
> > and recovery daemons running in OpenBMC server fleets (managing Caliptra
> > Root-of-Trust and SoC recovery targets over I3C), as well as production
> > server accelerator management daemons.
>
> Okay, but they are not (obviously) use the upstream solutions for that.

Right, they run on vendor kernels carrying out-of-tree i3cdev patches
based on an earlier version of this series, so there is no upstream ABI
to stay compatible with. This series already departs from that ABI
and v6 will change it further based on the review in this thread.

> But it's still unclear to me why this can't be moved to the kernel space?
> There is no user space that communicates with upstream kernel in the way
> you described, they should have used a custom (out-of-tree) solutions, right?

It could be, and the closest in kernel fit would be an OCP recovery
i3c_driver exposing fw_upload. But pushing an image is only one part of
the spec, and an in kernel driver would have to cover all of it, not
just the subset one recovery agent happens to use:

- status and identity: PROT_CAP, DEVICE_ID, DEVICE_STATUS (with
  recovery reason codes), RECOVERY_STATUS and HW_STATUS
- reset and boot control: DEVICE_RESET with forced recovery and
  flashless boot, and multi-stage activation through RECOVERY_CTRL
- memory spaces: code, critical logging and vendor-defined CMS
  regions, through either the indirect window or the FIFO interface
- the VENDOR command and vendor-specific status, which differ per
  SoC vendor

Which of these an agent uses, when to trigger recovery, and which image
goes with each stage all vary by platform, and the BMC's userspace
already makes those decisions.

An in-kernel driver would need new sysfs ABI for this, and that ABI
would have to grow as the spec evolves: v1.1 alone added multi-stage
activation, flashless boot and the indirect FIFO interface. With a
target-scoped transfer interface, none of that needs kernel changes.
fw_upload and lib/pldmfw fit well where a kernel driver already owns
the device; here the only consumer is the BMC's management stack.

The kernel already splits things this way on I3C for MCTP: mctp-i3c
binds by DCR and provides the transport, while PLDM firmware update
runs in userspace. i3cdev could be made to bind the same way, by the
OCP recovery DCR, instead of binding to every unbound target. Outside
I3C it is the same pattern: nvme-cli does NVMe firmware download/commit
through the passthrough ioctls, and fwupd updates devices over hidraw,
usbfs and drm_dp_aux_dev.

So the kernel side stays a small mechanism consisting of target-scoped
transfers to explicitly bound devices, and the recovery policy stays
in userspace, where it can follow new spec revisions without new kernel
ABI.

> > If you mean electrical bus recovery, i3cdev doesn't perform
> > bus-level electrical recovery. It only submits normal target-addressed
> > transfers via i3c_device_do_xfers().
>
> But how it will do if the i2c device blocks the i3c bus in mixed mode?
> I mean, how will it affect the i3c transfers on the wire?

Electrically speaking, SDA and SCL are shared, so an I2C target that
holds SDA low blocks every transfer on that bus, I3C and I2C alike,
regardless of which driver issued it. The controller reports the failure
as a NACK, arbitration loss or timeout, depending on the controller.
i3c_device_do_xfers() returns the error, and i3cdev passes it back to
userspace from the ioctl.

So i3cdev behaves the same as any in kernel I3C driver on that bus
since it uses the same transfer path. Getting a stuck bus released is
up to the controller driver rather than i3cdev. For what it's worth,
section 8.4.1 of the OCP recovery spec recommends a pure I3C bus for
critical recovery paths, and for mixed buses requires validating that
I2C targets have spike filters and considering isolating or
disabling the ones that can't. I2C devices on a mixed bus are also not
allowed to stretch the clock.

> > On a mixed bus, the Linux I3C core already
> > configures the bus mode/SCL rate according to the I2C targets' LVR
> > spike-filter capabilities and serializes both paths via
> > i3c_bus_normaluse_lock(&master->bus).
>
> Good to know, thanks!

One correction to my previous statements: i3c_bus_normaluse_lock() is
a shared lock that only excludes maintenance operations such as DAA.
The I2C and I3C transfers themselves are serialized by the master
driver's own locking, which is what keeps them from being interleaved
on the wire.


Thanks,
Sam

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
