Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E37606A319
	for <linux-i3c@archiver.kernel.org>; Tue, 20 Oct 2026 21:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=scpl4vSV;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=uJOFp9qB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Shw+wn8USxiW/j4ETKADR06Tx/FEwUt7rJu+pPfAhR8=; b=scpl4vSVvdkTki
	OSgUzi/rGSDerd9BZJTt7yglGRhVPQXzfCOpZ9N2NQfWRGDEZkwYuSUpMeCziSM9G9pS7JYS+El6/
	QUY7JPXFMAb48GwEfPpiucyw01YzOASv4dOXSibulemj1ymPm1Bc/iEMEwGuny+2JHjiFwCv4r8sd
	7Aqjzf5tcuggJOkmWMqic6xClsLL3kCV00bLhFBR6Hon7XSV6efNhbdyc3pCuTpZZjMxHWOOthufZ
	dhGqOSyUqDGCr2l1fuVW3d9ED1KOSr7HcMMj4OOH791aey90mOGy/tvbie+ZNggOTNZ9jRtbNvGoB
	0StXB4VCKlR1krEzgcUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJHGB-0000000Affo-0PeG;
	Tue, 20 Oct 2026 21:20:39 +0000
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJHG4-0000000Aff1-2PKj
	for linux-i3c@lists.infradead.org;
	Tue, 20 Oct 2026 21:20:38 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-67999045530so42918d50.1
        for <linux-i3c@lists.infradead.org>; Tue, 20 Oct 2026 14:20:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792531230; cv=none;
        d=google.com; s=arc-20260327;
        b=YNYXUHHpsaLo47SuGEK/kYE6EFOSdW61JJdGTcawvAdvbVUzV88HEriRGbIfbyR9Ml
         /Lb5IHVBGNEjmBJLHqhWuB0LyjnSrguV78tcD+7UkskrreWubpmLVDedH94e4BNCl8Fe
         qLziaBrxmSRk8gno/EZDpWN5ZqrA1mZiuDojEaI1oxD+atevdWsQOLZrhbRzAxucl05+
         oE1XzT6wE2nmTOAfafnq8OVlNYrO1FOsLItXPS64Ia7R6s37IQTP836bKK/hxAVHUT8R
         YQ6ialGyCO757GxyYu7O83pCXHVRiE+xdQEXnAnXCgZyWrIsNqmQTDgdloqEUVSVa9fx
         ZRrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ke4Bp1uq0aLEbcX2egfOr2CbakS7xm41rD4rPHzU2KE=;
        fh=lzE2Jva7hWYET+9o4630CkZQU5a6fthC7o3u5AUIhjE=;
        b=senjuGqrMSdvdAW/Ooy2c5LYIv1X9rc5vUXfyfIQX7XsRnOKivIPL3h/CIxijHeeHn
         vQapeJh15qT99KlH6ytU29K0cLSFMwvn3c7k985E4J/7xBGmK89JlIC6dDplExs/wFJ+
         baNLTNfowE6F6iOBgK3A7PSdwycKVmsJZr5ps55rEeBl09nusz36Atb2kRAh5qtoxRjg
         cZ5ESLwwb8qjdZ/27MBMPpgsGj6zOEL5pHHqKuMI1SixLDwfh87y3HGWX27ze2U5ho4c
         Dq0cJfUvStUmCTaXXWRPo/fNbzoFmlEN+wi5anyD5sXJyQCXFNtzwYOU/aCV3Dwk+Yc+
         ILKg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792531230; x=1793136030; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ke4Bp1uq0aLEbcX2egfOr2CbakS7xm41rD4rPHzU2KE=;
        b=uJOFp9qBZZ/ogcQZVhlzckDDchdpSqLMWe+bgBPK0YfE7+cYhs/QvgI2tPY0JVL0/N
         wlm3azwGTbn/kDbdafhMdTf0L3sQx04VFMW7wWI5VPXow7lD4sceyoATvFSyI6N+650P
         XKuDaQYyKrEHAXBgNcr+YdDhekywrbP+7bFkzuVZmWPR/0+8Llk1gQVXN5xnkVasGMWN
         LgX0nCMpLEUGWhkp2K35Yo9op7AFP3mzaHLzbPKZO4UprNx3HGDNGU9s8ZsbPTwSVQ/F
         SGngqxoPcc9PLXGutkNqKHdu4yk+ZBMomBc0LxfaZsbwHHzTbfwPYtknYfwmz0zmkjdW
         Wxyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792531230; x=1793136030;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ke4Bp1uq0aLEbcX2egfOr2CbakS7xm41rD4rPHzU2KE=;
        b=sUd18n5xyxclJoqyY/xJYVRt8r+BXOBy+3miNxmbOxyQWqCwcnw53X1W+nejzRH246
         pEol3ZBZn6HfDZLY7bmPR/gFr8P3cWtoM2F58XjLBhlFwmEwvyeVjs0LZxndHE16yDK8
         KqFr664p0r6pQELnpiErDg3sHhtQD91zdM5w4I3U4uGL/YpYm+b+06KsIcGn88RlxcUL
         u6AuiSQVa71i/8Cb+HQqkESc+ruLxgkEa1QDMyIvRGlrWeezbKyGrJNRf0UoiC39NYUO
         SKjP0v/soJtna0oTiI6XYH8J/EOHkPi73qedrc0fLty4RC4jbuDWpGrIkOAsiFheK2sW
         EWQQ==
X-Forwarded-Encrypted: i=1; AKwUvBz68Ehm2cqBXieM1dY2InM9GcR1n7uL6aRyEJGgVGNz6e4o0ZNRrA6ZhRF+/zOuLNq8bcc6A6JtpMk=@lists.infradead.org
X-Gm-Message-State: AFq9FYLzb5wX3qJgJeHtA8C3e9P8bVNzaqKMpJaRFHg21HWfq5K4zQ9R
	0couGIipg1ptbDsqWe8cZjyMdZNfYkamj72XdCM8nrNQfvH6trorwYKthajPYWjAzFQegUEiT8h
	WAK+f83C8H8ukUq4yGn3B5Fa2nqgUyop49JTdT5ci
X-Gm-Gg: AYBFou3qx54gEtvs2VqTaeE0nfF2nybVg7WrMIzmqMO9H8BdzNTv/m/58vaaHPiTPYP
	UZ165WhBMB0erB5RU54xK3wB11O2fAz0m9hiCWyhuGgptQHoRq512OWgV67IB66BmQt/0ubXJ3s
	JgkVpbpHUb1sjf2/FJVoOMwxLCE2HQ/rftFb+pZVVgRB0AQ7kd2EaseCYTifDAokcQdsAJHmMSK
	zLBxt3hxq/VYvLJTKIUHTbnwbeK8qeyQwC0lfZg+8KZfTAixQRoVdkGKoByPxZuCreN5DFbFVU2
	Wq8sFfGzhEa8cz3peLNX9VhxAWVU5IpZvn6XQLahdxq6OusuVhUy6f+DkRcwc5icaPpcYRnEdXh
	oyQYOlaF+7g==
X-Received: by 2002:a05:690e:2061:b0:677:d67d:39b9 with SMTP id
 956f58d0204a3-67a0e57e12dmr152508d50.85.1792531229423; Tue, 20 Oct 2026
 14:20:29 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260921230603.2518652-1-samagazaryan@google.com>
 <arY6DfVf_9tZ_TCu@black.igk.intel.com> <arZTphXbVF5wagy2@shikoro>
 <CAHreonFzhYk6fDswn7OVZfL3ybUHU15G3_q9+1sDhe8h670r3A@mail.gmail.com>
 <as487H8-0Gc77mXI@ashevche-desk.local> <CAHreonHiesGbR4VB+3sRxoLDmNHXFFEB=6_o6TNedm-N6VksEQ@mail.gmail.com>
 <atXmovzepBLP8Mqo@ashevche-desk.local> <atXnS1ZKGVfHDNEK@ashevche-desk.local>
In-Reply-To: <atXnS1ZKGVfHDNEK@ashevche-desk.local>
From: Sam Agazaryan <samagazaryan@google.com>
Date: Tue, 20 Oct 2026 14:20:16 -0700
X-Gm-Features: AclHuK9mNBazNNzNkA6MDDLvZ748rY_1SqbdAqI4AW1arCcvEA7ytz5DfLIBttg
Message-ID: <CAHreonFnUSKJMUpR0rmsnSMHEhcJ_W332_NTcGfTKiRkkPse_w@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] i3c: add i3cdev module to expose i3c dev in /dev
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i3c@lists.infradead.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Adrian Hunter <adrian.hunter@intel.com>, Meagan Lloyd <meaganlloyd@linux.microsoft.com>, 
	Vitor Soares <vitor.soares@toradex.com>, 
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_142036_814169_18D17C1E 
X-CRM114-Status: GOOD (  21.90  )
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
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Did I miss this in the initial explanation? If not, please add it next time.

That is just how the existing I3C core enumerates targets during DAA,
not something added by this series. I will add a sentence to the
cover letter and Patch 4 commit message in v6 contrasting it with
i2c-dev to make that context clear.

> Do we have such use cases IRL? Do we have tooling support (at least pending)
> somewhere? Why does it require user space interaction in _this_ way (meaning
> IOCTL and /dev node)?

Yes, this is used in real systems today:

1. Tooling & production users:

- i3ctransfer (Patch 5/5 of this series, and carried out-of-tree in
AspeedTech-BMC/i3c-tools and vendor OpenBMC BSPs for several
years).

- OCP Secure Firmware Recovery (DCR 0xBD) [1] and Caliptra Root-of-Trust
recovery agents on OpenBMC/gBMC platforms (e.g., AST2700 / Caliptra
MCU recovery tooling and BMC recovery daemons). Because Vitor's
original i3cdev series was not merged in 2019, multiple silicon
vendors and OpenBMC trees have been carrying out-of-tree forks of i3cdev;
upstreaming consolidates those diverging implementations.

2. Why an ioctl is required over a read and write:

- In the OCP Secure Firmware Recovery v1.1 specification (Section
8.4, "Recovery I3C Interface Block Read via Private Write and
Private Read"), every recovery command read is a combined transaction
consisting of a Private Write with no STOP, followed by a Repeated START,
followed by a Private Read, and finally a STOP.

- Because write() and read() only submit a single transfer at a time
(nxfers = 1), the controller emits a STOP condition on the wire
at the end of write() and drops the bus lock. Submitting multiple
i3c_ioc_xfer descriptors in a single I3C_IOC_XFER(N) ioctl is
required so i3c_device_do_xfers() queues them together under one
bus lock acquisition and the controller emits a Repeated START
between messages (as well as passing HDR mode/cmd parameters).

[1] https://www.opencompute.org/documents/ocp-recovery-document-1p1-final-pdf

> So, imagine that someone submits a kernel driver for a simple device, while
> another person already uses the driver for multi-functional device where the
> former one is driving only part of it. Strictly speaking the kernel driver
> submission becomes a user space regression. Which effectively means that whenever
> you open i3cdev, no other kernel drivers may appear. Yes, I understand that
> a poor victim of such an unlikely course of events may recompile the kernel,
> disable driver, et cetera, but this still raises the same question, why do
> we do that to the mere users?

Note that a user does not need to recompile the kernel if a kernel
driver binds to a device they wish to access via i3cdev. Because i3cdev
handles BUS_NOTIFY_UNBOUND_DRIVER, unbinding the kernel driver at
runtime via sysfs:

echo <dev> > /sys/bus/i3c/devices/<dev>/driver/unbind

automatically triggers i3cdev_attach() and exposes /dev/bus/i3c/<dev>
without rebuilding the kernel. Also, I3C drivers match against a
target's MIPI-assigned DCR or 48-bit PID (Manufacturer ID + Part ID),
so a driver for a simple device will not accidentally match a different
chip's PID or a dedicated DCR like 0xBD.

> P.S> Still not convinced, that this has to be an ABI. For debugfs and something
> like this, no objections, but ABI.

Production BMC recovery daemons cannot rely on debugfs, which is
optional and restricted or unmounted on production builds. A character
device in /dev/bus/i3c/* provides the stable ioctl those tools need and
integrates with udev so non-root daemons can be granted access to
specific target nodes (e.g. matching on DCR 0xBD), similar to spidev
and hidraw.


> Forgot to ask, but do they interfere?

Is this in reference to i2c devices on the i3c bus? No, I3C transfers
and legacy
I2C transfers on a mixed-mode bus do not interfere:

1. Both i3c_device_do_xfers() and i3c_master_i2c_adapter_xfer() acquire
i3c_bus_normaluse_lock(&master->bus), so I3C and I2C transactions on
the same bus are serialized by the I3C core.

2. Attached I2C client addresses are marked as I3C_ADDR_SLOT_I2C_DEV in
the bus address slot table, preventing DAA from assigning an I2C
device's address to an I3C target.

Thanks,
Sam

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
