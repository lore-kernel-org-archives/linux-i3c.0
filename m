Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2790360A3822
	for <linux-i3c@archiver.kernel.org>; Thu, 12 Nov 2026 09:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=REKWsK3J;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=o66uRwTK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hcWDec5ZpF83dg7NmIPw0PlT3vkJ5ATWuyW2bd2voIs=; b=REKWsK3JYzM5ZH9TZT2KSedbLn
	KzcMf8sIxVK3WBmBlwXO5XFBr8rUfq4sZLnvrrg2W7L7Nifr7r7uG+ULxUV9Vffq9bCRKVY/7BEIZ
	G2JbNIAT+4Nca8YjZMWzxvOyUh0TCGk3xzSmR2+yNsEnbwdwXHcBfntrbA/TZqO9+b/CJDKhpx9v4
	ICC2/zjmpdC2Yt7HHvAHViwU5moNpzWww96UIUfFTvKhM/x5NB8dzGdu25vqgIoMRyUAQcI9sv/8s
	b9uLvuYAPsylAfXinSpX7x1qUG2yajsVlssewG5rHyR79LOYwZE9oUOzocnKSsZwsOR2rnhCxvSZm
	BKdzbH5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRRJX-00000009POU-3igd;
	Thu, 12 Nov 2026 09:41:51 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRRJU-00000009PLu-07i4
	for linux-i3c@lists.infradead.org;
	Thu, 12 Nov 2026 09:41:50 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B888E1A1630;
	Thu, 12 Nov 2026 09:41:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8B5EB5FF85;
	Thu, 12 Nov 2026 09:41:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 87C5C11BC02FB;
	Thu, 12 Nov 2026 10:41:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794476502; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=059CCFFzEVHvGsNex5duvrj7Tz6Yz5B+WTMacZsba1M=;
	b=o66uRwTKg5QwneU8X8Z8uChZl6txo+7p+yOjSrmsrV4IpG6sCeYvm7VGbULxQ2eBCeGnon
	dwqGMSP8D0OZcko4gnRkbK5DBTpYkyKdQsP8vkJskU1uRDbdHGlixRBpbJe3++N+1uVSUV
	+yB7wCShn0/GBHqe3C3TBYPsN8cDWXiDbRHenyE6yqK4C7jC7XXYqJqA7FIqfliclyLuQ2
	HMLwJo9RN2ohn8h1PS5yPiAeyy/mz798oIKG8JnCMnfIP71uJ/n8hABltb2K+djhpoLmw5
	MFyB/WnSwEnKFU0yNcRxG8Wt2VzNQTlLgk4s63QjlfX27Wuc/iwCzgKe68nnWA==
Date: Thu, 12 Nov 2026 10:41:37 +0100
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
Message-ID: <202611120941378508d6e0@mail.local>
References: <arY6DfVf_9tZ_TCu@black.igk.intel.com>
 <arZTphXbVF5wagy2@shikoro>
 <CAHreonFzhYk6fDswn7OVZfL3ybUHU15G3_q9+1sDhe8h670r3A@mail.gmail.com>
 <as487H8-0Gc77mXI@ashevche-desk.local>
 <CAHreonHiesGbR4VB+3sRxoLDmNHXFFEB=6_o6TNedm-N6VksEQ@mail.gmail.com>
 <atXmovzepBLP8Mqo@ashevche-desk.local>
 <atXnS1ZKGVfHDNEK@ashevche-desk.local>
 <CAHreonFnUSKJMUpR0rmsnSMHEhcJ_W332_NTcGfTKiRkkPse_w@mail.gmail.com>
 <202610210957562f3f6511@mail.local>
 <CAHreonH0maC6iU1fkwv9VvWzZfh=W_ybB8R6CLbXQmKQL+x-=g@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHreonH0maC6iU1fkwv9VvWzZfh=W_ybB8R6CLbXQmKQL+x-=g@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_014148_300754_302F0DFB 
X-CRM114-Status: GOOD (  27.89  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 22/10/2026 17:17:20-0700, Sam Agazaryan wrote:
> > On my side, I believe i3cdev can be added to the kernel and that it is
> > way safer than i2cdev but I agree that the ABI has to be properly
> > designed, maybe we need to version it or have a way to probe for
> > supported features so we can update safely later on. It is failry simple
> > right now but I feel like we are going to see people with more needs
> > than initiating transfers.
> 
> For feature probing and ABI extension, what do you think of:
> 
> 1. Adding an extensible I3C_IOC_GET_CAPS ioctl:
> 
>    struct i3c_ioc_caps {
>        __u32 size; /* sizeof(struct i3c_ioc_caps) */
>        __u32 pad;  /* must be 0 */
>        __u64 caps; /* Bitmask of supported I3C_CAP_* features */
>    };
> 
>    Today caps can report the transfer modes supported by the controller
>    and target (I3C_CAP_SDR, I3C_CAP_HDR_DDR, I3C_CAP_HDR_TSP,
>    I3C_CAP_HDR_TSL), and new bits in caps (or new fields appended to
>    the end of the struct) can advertise future capabilities beyond basic
>    transfers.

This works but my point was also that we need to expose the i3cdev
capabilities so userspace can discover what is available. I guess we can
assume .read and .write are going to always be available and so this is
fine for now.

> 
> 2. In struct i3c_ioc_xfer, we already have __u8 pad[2] at the end which
>    is strictly checked to be 0 (-EINVAL if non-zero), reserving 16 bits
>    for future per-transfer flags without changing the struct size.
> 
> > Also, I think this should not bind to any devices by default and make
> > binding explicit.
> 
> This seems to be the consensus so far. I can convert i3cdev from a bus
> notifier into a standard struct i3c_driver so it does not auto-attach
> to all unbound targets on boot or on unbind while dropping patches 1
> and 2.
> 
> Since Greg KH noted earlier [1] that driver_override / manual sysfs
> bind is only for debugging and will taint the kernel in the near
> future, what do you think of:
> 
> Matching explicit opt-in entries in i3cdev's i3c_device_id table (starting
> with 0xBD for OCP Secure Firmware Recovery), and optionally
> exposing a new_id sysfs attribute on the i3cdev driver for dynamically
> adding target IDs at runtime? That also keeps everything self-contained
> in i3cdev without needing cross-subsystem changes to hwmon/iio drivers.
> 

We can add new_id later if necessary.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
