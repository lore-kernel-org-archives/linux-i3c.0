Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D924606A320
	for <linux-i3c@archiver.kernel.org>; Fri, 23 Oct 2026 00:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gLEBdwyv;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=p8MANlyo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=twSNMtV0+Sp5OByM4pf/Rp/d3iUbRI64aW9SOMm1Jes=; b=gLEBdwyvDoPUZmOwC7tv+5/6wo
	FIxZHiSaJ9VLb74B3IZuT2ngFv45vA+ivXVU9H7ki72GP5SYkKWUQt10Y7NEhqne4Hf3/gOdhB/ss
	cbRxviwRF1dbx+wOG6K9qyS2vmhO9gKRm+fT8m3Yfk3qPe19filtrODcTZoC1tRhzf648sXN2Wnjk
	v292hVG/cGAH+bftFycTu+MwYYkzK929bIsPwz0G7nlOK4WDJQcV+KiWMbBc3bH0p6loXOIkcocQ2
	sJKxv2MuUK1y/0ONTLaifCT6l9CmGXa/Zw2f+x6X7U032FWDNa2tqBdhzbxZ1b1W3NFi2cy8FpSGn
	SlHCktFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK2yV-0000000FDDu-4BAT;
	Fri, 23 Oct 2026 00:17:35 +0000
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK2yT-0000000FDDM-0pRV
	for linux-i3c@lists.infradead.org;
	Fri, 23 Oct 2026 00:17:34 +0000
Received: by mail-yx1-xb131.google.com with SMTP id 956f58d0204a3-679a420b5afso427761d50.3
        for <linux-i3c@lists.infradead.org>; Thu, 22 Oct 2026 17:17:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792714652; cv=none;
        d=google.com; s=arc-20260327;
        b=P1VWiSfXIxPc9pnkD21Df7+iYg+XtIqv1esz2imKp75boxUDtels0aTJzvuZbxZXJY
         LgmLfuruv3/ECBp7/HeuBuQv9Qot6WCoXga60s+V6KL2XzDJXnkkmm78V8kKXS0SWQTJ
         LK0uPjSufqxmKRQDnBifYba5nsbYlLGa2fE3AhCZzBkSCm8FtVPqMeXYJ7Q+Ba9UBVKp
         myPD/s+yfgHPBv1raSsys1VXhnZFFZFYWL6aYkCpEVVu7OhHZhEk+mEMcZ2VCSLkBJ1F
         rt0gH4151Ce/3MTMZW3w374v+S7Sq6CMHi09/MPveQwSvd+eGPZyILXoMbt4WCjoa8RU
         ASEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AFG2ImmQoecNeeKEpKd4y7BNHF8UmT+QZFjiG1jtjwI=;
        fh=gGrGtkk6+GCiTNknqy2JjzLa/MZpxUtNgASa3uaHk6A=;
        b=HnXQ4dQfR5HiTFYXtgeWBKF+czn80lmkk6UvsUhw5mln9+sG3wrCnCoF6fbuQDcT7S
         IV77T9SPgA0b7oK8MT0kuYa4cWYiFEYEwCo1UD57iOeXdB7I9mdQGp1crsTv1roFho3C
         JHZcV35iedUfhLEVmWwQWiEMO5QSUGkHWuNxVTaJC0MXCH0Gg88i0G1rd91CNraizNL3
         3TXGbQIqhiz47SCyVNdVX5wAulvtHsDass1/YTgSyLWgdLEUh3rDNB7NxZF3uXnumEIG
         f7cxDgK17ZcVCVuMAkYpjVb//2xDvdm5ByF9UqcXlxRgFTB86zXaR4a3EJ+1Ztn4JKjO
         GCrw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792714652; x=1793319452; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AFG2ImmQoecNeeKEpKd4y7BNHF8UmT+QZFjiG1jtjwI=;
        b=p8MANlyoDIeOt5jUHGEjD26DcAf8CQPlNn/rfC5MTjDRMGJlp7LayLmx4tgsNFjGD1
         sf+HJxboXm1lj1tAf3w/f3UeJ//1NzA5gVD25wJJl1ZUY+wQZeJ+ogsS0MRfPMna/Nu+
         nxqT4gALuVn++rWCcJI25QibVT7BFU8fiPEBpmPKNZb3WbkiFMalY3UMKB8hZbE/G9Ee
         rgyCJhFwXKc3K/+uqAPIZ3LU42Mk+S3PqWX+sGYWNAn9BrJKC4WgSNlwkRzjKlYKp3KF
         ufZP0cPE0JBWJHbKZsGNGBkBLFIvjxmmLakkSJ8CiuDHPxRLZ8ebZY66lF5Xz4/C5nOp
         SdkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792714652; x=1793319452;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AFG2ImmQoecNeeKEpKd4y7BNHF8UmT+QZFjiG1jtjwI=;
        b=0UR8kfNL6H8YfbHT9yiVh9csa8RyRQo0ySqe1V8g5+d9P8kLCjBJhOIO+dbDAkHXkd
         XZ/yP0KxnvrHzTCxXvgpuOZ1qTTAXdb9ajahEjtyZHu34UxHRBd8ynlyHIlqWaz1ilfw
         JmCIMXWVja4W8RsAC5d8bBAG7fs/vwroWFfo2L7ync8ZKFTJHp2YL4+wCgCsLO1wAeYS
         7BHkvCMeRGsV/zHKxhk7DRoJN5bdca5MXU7fzEIMxn1q/ji0mxujxVdJ9y1GE1EIc8rm
         S6mJMr06FRB4A1J7NaK5Mi+eWp4OLVmayx2DFhsHEDXPYcaoa9FHElNNKzznWnkVS5ox
         q2Rw==
X-Forwarded-Encrypted: i=1; AKwUvBwiOVbL0r0xkx4XnnKuHIjwaskGpUW8n1LNlABOqaFSkx4HMHZcohIAjwvQPVJ10w/biheRhVQie+g=@lists.infradead.org
X-Gm-Message-State: AFq9FYIV4ziGrXaqmDmhHo33TGICsq/KeAENKIhxpkRcLe1A0e+qpIzr
	ve6L0LbyDkE4AN2fgeeMyC8RjLISvcterrMn0Qldowqdngx8OPhkw7g3YmVU/gHNesriXAtKGV+
	2+XHL67t9IdrRPdoeCFF0eLCKJm+duYsaYEkiU1B6
X-Gm-Gg: AYBFou2pHEAruj8nyEmF4NabSRQTM47Q6OEI2T5zhl4IGTbeE1zoQV5GwsRYgO04D+F
	DKYMqJNx9sgQ5ECOIC1UEmoD+QTe9/HkceuG+X/+lVJ23fCQ451Q+eTaapN1JE1LnyhF4POHWAx
	HmsooUO67IpGtchRUWMG4kyqIn6buz52VsmAZ0FRnZYR638pNHYJHT6F4NMtnA7u4Y88vM8Lfoq
	v0h8PsNgE+RJN6Ht1QUran5kgZaM8fl2LBSvauztip94m0uv1R/fEwpG4LTZdgIdD9bnYOzX14T
	XChcJ1kkMQ/ngbEmvKQZntmhT29suQds5p429S80J4B85yyq2hpMl46p4SFBrbU7qH410VxynEM
	oYmt4zztjS5ALn5A9roIv7U5CHNLG/yepXvd64+6rfkN6LdJyrZE6iFZR2i8grX8dRSC2lEXB9f
	DlE4XmYG75UP32
X-Received: by 2002:a05:690e:2588:b0:675:5ce8:f03d with SMTP id
 956f58d0204a3-67a35caef75mr332314d50.155.1792714651266; Thu, 22 Oct 2026
 17:17:31 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260921230603.2518652-1-samagazaryan@google.com>
 <arY6DfVf_9tZ_TCu@black.igk.intel.com> <arZTphXbVF5wagy2@shikoro>
 <CAHreonFzhYk6fDswn7OVZfL3ybUHU15G3_q9+1sDhe8h670r3A@mail.gmail.com>
 <as487H8-0Gc77mXI@ashevche-desk.local> <CAHreonHiesGbR4VB+3sRxoLDmNHXFFEB=6_o6TNedm-N6VksEQ@mail.gmail.com>
 <atXmovzepBLP8Mqo@ashevche-desk.local> <atXnS1ZKGVfHDNEK@ashevche-desk.local>
 <CAHreonFnUSKJMUpR0rmsnSMHEhcJ_W332_NTcGfTKiRkkPse_w@mail.gmail.com> <202610210957562f3f6511@mail.local>
In-Reply-To: <202610210957562f3f6511@mail.local>
From: Sam Agazaryan <samagazaryan@google.com>
Date: Thu, 22 Oct 2026 17:17:20 -0700
X-Gm-Features: AclHuK8M9bVXcyJs5C40xCTHAqMHnBB9g8sqiw9KkWEJQm5LLl14MgBaxmgFDSE
Message-ID: <CAHreonH0maC6iU1fkwv9VvWzZfh=W_ybB8R6CLbXQmKQL+x-=g@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] i3c: add i3cdev module to expose i3c dev in /dev
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i3c@lists.infradead.org, 
	Frank Li <Frank.Li@nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Adrian Hunter <adrian.hunter@intel.com>, 
	Meagan Lloyd <meaganlloyd@linux.microsoft.com>, Vitor Soares <vitor.soares@toradex.com>, 
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_171733_270681_C916F3EC 
X-CRM114-Status: GOOD (  18.40  )
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

> On my side, I believe i3cdev can be added to the kernel and that it is
> way safer than i2cdev but I agree that the ABI has to be properly
> designed, maybe we need to version it or have a way to probe for
> supported features so we can update safely later on. It is failry simple
> right now but I feel like we are going to see people with more needs
> than initiating transfers.

For feature probing and ABI extension, what do you think of:

1. Adding an extensible I3C_IOC_GET_CAPS ioctl:

   struct i3c_ioc_caps {
       __u32 size; /* sizeof(struct i3c_ioc_caps) */
       __u32 pad;  /* must be 0 */
       __u64 caps; /* Bitmask of supported I3C_CAP_* features */
   };

   Today caps can report the transfer modes supported by the controller
   and target (I3C_CAP_SDR, I3C_CAP_HDR_DDR, I3C_CAP_HDR_TSP,
   I3C_CAP_HDR_TSL), and new bits in caps (or new fields appended to
   the end of the struct) can advertise future capabilities beyond basic
   transfers.

2. In struct i3c_ioc_xfer, we already have __u8 pad[2] at the end which
   is strictly checked to be 0 (-EINVAL if non-zero), reserving 16 bits
   for future per-transfer flags without changing the struct size.

> Also, I think this should not bind to any devices by default and make
> binding explicit.

This seems to be the consensus so far. I can convert i3cdev from a bus
notifier into a standard struct i3c_driver so it does not auto-attach
to all unbound targets on boot or on unbind while dropping patches 1
and 2.

Since Greg KH noted earlier [1] that driver_override / manual sysfs
bind is only for debugging and will taint the kernel in the near
future, what do you think of:

Matching explicit opt-in entries in i3cdev's i3c_device_id table (starting
with 0xBD for OCP Secure Firmware Recovery), and optionally
exposing a new_id sysfs attribute on the i3cdev driver for dynamically
adding target IDs at runtime? That also keeps everything self-contained
in i3cdev without needing cross-subsystem changes to hwmon/iio drivers.


[1] https://lore.kernel.org/linux-i3c/2026091834-bats-palpitate-5614@gregkh/


Thanks,
Sam

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
