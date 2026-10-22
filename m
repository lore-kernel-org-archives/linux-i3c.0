Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB13606A319
	for <linux-i3c@archiver.kernel.org>; Thu, 22 Oct 2026 20:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0/y+4C48;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=EkdMMfPQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=r4/bQ/FYBD+wuM63wyzpIiQ4v+5mBr/rM18MkQb2lCo=; b=0/y+4C48gFHi1+bUkr7t3WdxnK
	L9GlV7L+FdwAZi0ljeJYOoe0XqZ2fb9gR+wVnloAEmv4mmezSoInT9r7epQWlbLmCQmJckDlrAwON
	2mOGympkCNx7C7GzRVshP2lmNgM/WDL9Y42IpD4StRdeQi3NsnJbVEWLV6yeovsby+xM0BsNM9nyH
	7VAlGkb440gnWCE2mWicdtsg0V4LstSLa9zFGvfIX3YzXZvnB92H6gVa+B8VWjZt2KQl8/vwq9vWc
	DzQUoGG3nciV+2PKGAqD2nXzAdaSEBIpaua9azZDjoyMw34VmXPIUdoMFgbOlCjdCyD0qe9TEm+pj
	rNYrksxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJzJv-0000000EvVG-0XFQ;
	Thu, 22 Oct 2026 20:23:27 +0000
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJzJs-0000000EvUv-1Yf6
	for linux-i3c@lists.infradead.org;
	Thu, 22 Oct 2026 20:23:25 +0000
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-677dbe051d4so299673d50.0
        for <linux-i3c@lists.infradead.org>; Thu, 22 Oct 2026 13:23:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792700602; cv=none;
        d=google.com; s=arc-20260327;
        b=gIlIRNfcXH8dKULxQoL0RODHhgv63rjtTXuy8B6CqxnZWJGTyntsNx9RrqCJXiBYiw
         PT3212E+ayfTZinMjL/eACeempELtQycVwdJ3wkamCSRLQGBpyVnwlGkGMhhqEOKfw7u
         g2W4eFZsCthGAGxbJ5mGpkI8WmAq2GdFH/Ia9ofi1nLqiX2wTJVcZi2+ejAfVIl16j6U
         eHmFk+r6OoLtuRgloE9u4Wwo1T4hqM5VhZyO85lRbnckgoCzFoSwmRtk5a+ojkBHlLPq
         Jv1M/3VMZuu5cKr6HHrbEc9qTTTZQAMYqkl/WNhBo9t2c4/nrChLwZ3FrVJKn8VLjKqb
         YjfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5uxHMH5lWNkFqrLK/1u2IVRs5r7Pb9pQoHHJh+WWXLs=;
        fh=0SQj4HwGX3p5kj66qkdmOvwLK8u/0eSgtdqx+v1Lr8w=;
        b=jZ5Ei1RNLApFninId/vKFGvKz2c4lx5PnN9Q/oYmIaB1rj9aW91Nn6yQV0wFoahOz8
         HjIc6MBlS4hwgI2KRIT+ruhfNdhTQTcTstrsKo+QDgoHDkZLYtuZMEvRTXyC26RC8pus
         vSmVq9s1k6YZZkpu7wuZJtJ5Nn5hHvbTr+L0weF4AYU2OkofCLKgo2bVUB7+g6drxxtf
         lemzeqr5sv/2AP0f5Af3wGUBc4YNzFbtphkHplF8cfST5J9k0LlBzbX8lXSFxCnGik/T
         RtDqQ9iRFls1iZpZObYvMv+vhKJrM0CwxfX8CR8nZLsBRyu55J95tM0LMgz6ovtHEroV
         tJBw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792700602; x=1793305402; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5uxHMH5lWNkFqrLK/1u2IVRs5r7Pb9pQoHHJh+WWXLs=;
        b=EkdMMfPQwKRp4hKBVGXt0KvBR49jMR8H2SVvr7lxxx/bP3RsGXCBG1zykgdeEmrQ5k
         N6XOzN9xN0+IzqGl9kPmQDaoc6SzYjKtk5wQU+r8rGaD88ueoqPfpeQPuGRmLze898HT
         ksvr6qbHFkqKX7UfP+ee0Ryy81++pfFPPPV0jM+SVdGILg/CBcvmHALpFp9mokUdF3uL
         jdpnMtnowxhyD1/jNyEyqbuxw4t8bttvZwbyq+0rPsjSxf22p9n5ogzeKvQZRKHKqcuB
         FmCPdZMnzie9vCWzWxvQEG7gAjsP2kp67N/zSzktIp+tE2Mp8OMU7PKnHL+h7erL8MPA
         wo4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792700602; x=1793305402;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5uxHMH5lWNkFqrLK/1u2IVRs5r7Pb9pQoHHJh+WWXLs=;
        b=qhb6/FVmTGkwd7KONCBsCN2CCxSqSDy9jWHZ2LlmxQeYLu+wIhIcHClYLsuzDPS7eO
         iqXlLU23UBEWoPobOkYoaTemkdTvQrY5tvJtreWcZCRUo9BPYjNe8ztdIwM+rmj0YgZ/
         +thVvr9cWSNVS3rf15deucN3+p/DIV2W/PekZe867dpX5bWE+xSHH0N8YHZqNGwVX7g7
         yzZN8YuAJ7RQSwMp/ZlmZAk7KuE42aK1QJPb7CRI7hfgYyCyWVm/CP9qj8jlD6z6kxaH
         V/d4NgNWS9dH3Qa4ayZC0m57QMomrDYomrrhURefKt9A4h+1LWVlHbd2+jaNdUcKogCW
         A3HA==
X-Forwarded-Encrypted: i=1; AKwUvByzmvIuhJAYuy7+9y4ipeYPtxZm7HUT7kZresEwfXFb9YSITHUUKspcLSyAvmf7JpyU204Cyx+325M=@lists.infradead.org
X-Gm-Message-State: AFq9FYJ5xaouy7PencFOdT39y5PzldyC/ZMql6NRnnob100d2cNRTBih
	r6QUH/pnd0Zz9WkWF/wgqda9cdgygcuDZDNYbc2Ebt77ppVNjW41hkRBmQjTe1gzz0H6SHPcxAl
	xSy2m+s0sca4ufmZ+OhZWKExYk+fp40zMFDLol8hYP5hgtnR0RrAa0IuS6Ok=
X-Gm-Gg: AYBFou2rrLFr4rj+7a2YfsmtvNaz6gzaCl693x6Ld8g0/DGXhn+6ygw9rUfNbFJK09P
	7GQXF2lgYpgpu+6T4uKOiOHWB4AgJWWcdFeWFAATm6DkJdHHCUw1T8FXNvMktVIiIifTMLBNoBU
	dQE2T5aT88qjveKJxXYvEsa8z3DMnB9Lnxys9lbTvxGFadaRbpzCUmU1qydPSCCrlqOPRIXN9N2
	wGB9b2wxMvUG1OLDeZNY0/MWDgwXchYNUizbsQpPlbB4jGzRkLh9iU8OkDIR2CxkCj+TjB4lsV2
	CgQyCUiIkfEmSZoom/zeEihAAJLCqv+iX49Hj1sFTwrPM6FNAqaZ8RjqptWD7Y8Oae2EUttJQgC
	ODSfKoXrMePeQsgLFESUo3vg+KuOJKLJBqPSgL2PjmyT/+AfJcsfqjSd8/HBFO8sgvjs=
X-Received: by 2002:a05:690e:4886:20b0:679:b810:6e02 with SMTP id
 956f58d0204a3-67a35be55damr41297d50.26.1792700601354; Thu, 22 Oct 2026
 13:23:21 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260921230603.2518652-1-samagazaryan@google.com>
 <arY6DfVf_9tZ_TCu@black.igk.intel.com> <arZTphXbVF5wagy2@shikoro>
 <CAHreonFzhYk6fDswn7OVZfL3ybUHU15G3_q9+1sDhe8h670r3A@mail.gmail.com>
 <as487H8-0Gc77mXI@ashevche-desk.local> <CAHreonHiesGbR4VB+3sRxoLDmNHXFFEB=6_o6TNedm-N6VksEQ@mail.gmail.com>
 <atXmovzepBLP8Mqo@ashevche-desk.local> <atXnS1ZKGVfHDNEK@ashevche-desk.local>
 <CAHreonFnUSKJMUpR0rmsnSMHEhcJ_W332_NTcGfTKiRkkPse_w@mail.gmail.com>
 <202610210957562f3f6511@mail.local> <ati4B33tnKsCD4c_@ashevche-desk.local>
In-Reply-To: <ati4B33tnKsCD4c_@ashevche-desk.local>
From: Sam Agazaryan <samagazaryan@google.com>
Date: Thu, 22 Oct 2026 13:23:10 -0700
X-Gm-Features: AclHuK-UXeYd7f4xuTeUAZF1JwhmIdSpH-ZAZho2bvnDVSV1qLbRZ06-APU7LkY
Message-ID: <CAHreonEbHrPCCro+2u5LC2reVk2fzprC4sTLi00nyh8U1=VdXA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20261022_132324_425437_2173312B 
X-CRM114-Status: GOOD (  16.74  )
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

> > 1. Tooling & production users:
> >
> > - i3ctransfer (Patch 5/5 of this series, and carried out-of-tree in
> > AspeedTech-BMC/i3c-tools and vendor OpenBMC BSPs for several
> > years).
>
> So, nothing in production, meaning we can design that in kernel differently.

In hindsight I should have ordered that list differently, the second bullet
right below that is the production use case: production BMC firmware update
and recovery daemons running in OpenBMC server fleets (managing Caliptra
Root-of-Trust and SoC recovery targets over I3C), as well as production
server accelerator management daemons.

> But why recovery mechanism can't be kernel-driven? With some sysfs
> (just as an example) knobs to say "I want to run now a recovery flow
> on this bus", et cetera.

To make sure we're talking about the same thing: "OCP Secure Firmware
Recovery" is not electrical bus recovery (like recovering an i2c or
i3c bus itself by bit-banging to unstick a hung bus). It is device
firmware recovery and provisioning (similar in concept to USB DFU) to
recover and boot a target device that sits on the bus.

This lives in userspace because it is part of the BMC's Redfish/RoT
firmware management stack (handling network image streaming, signing/key
management, and chassis-level recovery policies), rather than a single
"recover this bus" hardware toggle. And it uses I3C_IOC_XFER because
each protocol register read/write requires combined Write + Repeated
START + Read transfers (or HDR transfers) to that specific target node.

> Oh, that's quite a dangerous "feature"! Can we avoid doing that? Otherwise it
> means any missed guard against unbind for the system controller related chips
> may lead to real HW damage. I'm totally against this feature to be in any way
> of an ABI. If you want that, do it exclusively via debugfs with a big fat
> warning that this may lead to HW damages.

Agreed -- as Alexandre also suggested in his reply, it sounds like
automatic binding isn't favored here due to risk of hardware damage.

> Can i2c device require an i2c recovery flow on the bus? If so, how would
> it be combined together with the i3c recovery flow(s)?

If you mean electrical bus recovery, i3cdev doesn't perform
bus-level electrical recovery. It only submits normal target-addressed
transfers via i3c_device_do_xfers().

If you mean OCP device firmware recovery on a mixed bus:

An I2C recovery target on a mixed bus uses standard SMBus Block
Read/Write transactions through the controller's i2c_adapter (not
i3cdev) while an I3C recovery target uses I3C Private Write/Read
transfers via i3cdev. On a mixed bus, the Linux I3C core already
configures the bus mode/SCL rate according to the I2C targets' LVR
spike-filter capabilities and serializes both paths via
i3c_bus_normaluse_lock(&master->bus).


Thanks,
Sam

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
