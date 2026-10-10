Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E50CA6017
	for <linux-i3c@archiver.kernel.org>; Sat, 10 Oct 2026 04:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+KG0fX+/HZrTpQilDEzdV022wF/NaREpNouzBEd0+6c=; b=jA+4J/PZvt+E2P
	6+6eHyZnQhJrhip5gM/pHmgMysdXkt7pYpHlzT80I1SsvqFwzhSp4ECJRhznS4hOIwr0aPwj1gNC/
	TK5lvx2bXCT75VOEutV6lx/Kl4WSdHyM/bHJwm0lh3PHcst97DqMR5lv0XzJSqNZAnlnWHIxCp7+T
	gBRbCe1mhi/xkU57lnYjhVvbObzxqs3k7geG3CL49coCcufxm+Yew7qcY85oXXMeK5cxxMpEGJmtd
	hcXcWNA2IByRCToDtKxiT/gQr1B9lOjmxJ7+aA+qOhzMrkNR2T3/A9PhurVFZJR7M4Lqr7ZyAS8tK
	mNyb0CkHm/xE+YlyGvbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFOLC-00000007VCe-2UB4;
	Sat, 10 Oct 2026 04:05:46 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFOL9-00000007VC7-130V
	for linux-i3c@lists.infradead.org;
	Sat, 10 Oct 2026 04:05:44 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-8ac9d666d4eso1961317b3.3
        for <linux-i3c@lists.infradead.org>; Fri, 09 Oct 2026 21:05:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791605140; cv=none;
        d=google.com; s=arc-20260327;
        b=XzqzKb5t/yNv3bdAUUVoRXIOT4JM6t6zgb3Ul2Rc2UV0NrKcL2HieCrrQRIlYkvEOI
         bpDAuyF1kS5v8t9eLwgePmmQDX+6LiAecm7sy7VkCUKXtdC2e07DBVu/YXLjZrJ9HgGI
         c6PD9+bRb9RS1u5rzEpx9n9V4qkoej1t0Q6b+MALz5c+Woxdnm5+O/hCeb3KAhdqO9H5
         GtrkOm0Be4PDv8ZqDde5weE9tIGRTicjMNrCUo8hIKWdLVee+L+uIIKwSiLYpraqD4u1
         EAXQvr4yjHnzP6jwRMhPzRc/lkxh5U2Ztnym0k1c0YOW6Eezh04wFwXjiud78O5RbZVh
         FTcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sBH02CVGyI6CCaunRAT+Flqibvk5s+ylcvtbaKGhuIs=;
        fh=kfBPbKLhxLDaBBVzWlUuzh1bgnwIm7ZLOXUS4dqXosE=;
        b=MDMaZUvQjLBsFXQ34Hgb/0ZghjaXN1oe8SfRrt8kGL0K7oXBB0wv/vZIXuMSEt1ucC
         4337Shkh2fRLp/ih385mlpMF1t5IiMzuIQ4k0gsMNUdCz3IdWUklRgdvO92n5B7G6MBZ
         +fAo0X7h3LfXedDGhGZK/cqt8hFj+0/ZQ5WHkjYh2MbnRbSltIeiOu77UWCJlHTxYJmO
         lBlI8CdJIG/tG0UK300gmei+umcwfUdc28wpOILvUqGCq4IVBxR1pl9ecDbMrxFqTKrw
         TARrhcWkHnqA/6F2V+Q5sx9k7HROa+8NsMPJfzX8tUTTQQb1ZCJc7KhrIcJ0Qx5ruFrD
         K5jQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791605140; x=1792209940; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sBH02CVGyI6CCaunRAT+Flqibvk5s+ylcvtbaKGhuIs=;
        b=ffpSBl/G/wmuTyxQltQ7533GbbZkJK/5FUrBh+nTSFrBOHSMdXq32u4YwFBFpJj8CA
         H6FoUU9zuTKe+GwwChTT6IPE4GNTi37AJIvfyqFricps3MWSLSTbf5l550AIlTkw8Zn0
         zun34L3t5N9/Xjqyc3+96EprjzaCN/q4refvpxwCT9i8e4fqbQGtZp3bH4li2d97SNhR
         2mCE/wS5iiXSJ3sawbGSorkc9W1RougQkBtbKwko34G20XZHTO6TLmYEd3dgbegHBkxF
         ZjfxzgXAwdw5iDKBpkYqbtK6xgps5CSWkScGg3GcfNvfPb4ltpkQ7QgBw+K71/mkmYka
         ThXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791605140; x=1792209940;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sBH02CVGyI6CCaunRAT+Flqibvk5s+ylcvtbaKGhuIs=;
        b=MSsbA4uVILvbtrMgmnaf9x5G7mOrvcHJ80aBoW5LgnVsJp4QZhGUmqzWmDxp6cdfU0
         RBJPwBv0BHWEZIgTKWuyq11aSY5jHSbsaSvR59rsPPhqZPgyQxQ0MoWYcxyHLJqv7zly
         UAS2rBhKmjfxGWBn/bc9qeyTlfvPpZuvCUV2akmVEgqKTDNJC0pF2xjK8wC3Egj8UQBp
         BK8Et8TraR/t5UKG7AjcSfjA4j2xKP/15+A9P2wWbMI/r9W14TUlgS03OmOtHv+Iykcb
         gW8iMLrTqKwS7airJgufrlTvydzEfCmKPw8q65uQsH5kotdcPC2xrGLl/NSFVcQQVMwV
         ilgQ==
X-Forwarded-Encrypted: i=1; AKwUvBzTdN4hiYY2TRVaXGSNlf347cyULkhFQUeuKRfRovhPXTA0tTqMV4hQm1W1yfZVsnhY2jwIgOOYOXY=@lists.infradead.org
X-Gm-Message-State: AFq9FYIYNzeqFgm7e0k6binPuFb5P9mQQ3qAZ+VIF3lLmU+/Yo5Mm450
	v+xaNk1B/q5i0DzzVimfvm2iLnVOG1pvMnP81W6la6oijdCRFsZc7ITIuQBv8KQIDGd//5hd/Di
	dj1aPsfSbPVN16sRXgqdwyvcZoA5WMlgeaL9BjKuN
X-Gm-Gg: AYBFou0wQsLn9efuaTnYaIq09HHVo2z4OaURcon+a4FiqVXFmRsioXRLpoclDT+ZJ7I
	yDEkL/LEByYurU/Lm5pMapct7j3IoqoNJhECtKUNCuwosMZm2kLbMS20t6uPYZhhyaEk8rsgrpg
	3om96ZoaKr95cSv0RvrjKKcIBm4PpFiN90oU4Noq0GLwHltFCjENx1RbrmhDmlDyUDxHDy9dyU2
	mwSjBSMabOt996nPs2VdStQgQhy6PJT7zUQCcow6s1h5GrCuREhBgcpOC3z6b/ucdBqOyHtOyv7
	v8pn6jyJKuM4xSpCOzuJiyvi3ehysB8D8/YJu+WbZn83QaDSObxfbUTKYe5XJOibYG1Cu+vZwj6
	BZ268aVrGGw==
X-Received: by 2002:a05:690c:6603:b0:8a5:1570:a298 with SMTP id
 00721157ae682-8b07edfeff1mr10928557b3.50.1791605139794; Fri, 09 Oct 2026
 21:05:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260921230603.2518652-1-samagazaryan@google.com>
 <arY6DfVf_9tZ_TCu@black.igk.intel.com> <arZTphXbVF5wagy2@shikoro>
In-Reply-To: <arZTphXbVF5wagy2@shikoro>
From: Sam Agazaryan <samagazaryan@google.com>
Date: Fri, 9 Oct 2026 21:05:28 -0700
X-Gm-Features: AclHuK8ncYY7T7lxEax8iYkxYdBrzXYR56tEd1dK284WrT5YFKeFiVdRZAbEgzk
Message-ID: <CAHreonFzhYk6fDswn7OVZfL3ybUHU15G3_q9+1sDhe8h670r3A@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] i3c: add i3cdev module to expose i3c dev in /dev
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, linux-i3c@lists.infradead.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Adrian Hunter <adrian.hunter@intel.com>, Meagan Lloyd <meaganlloyd@linux.microsoft.com>, 
	Vitor Soares <vitor.soares@toradex.com>, 
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_210543_313158_61E1B49A 
X-CRM114-Status: GOOD (  25.15  )
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

Hey Wolfram and Andy,


Andy:

> I do not know how we end up here. The not-settled yet discussion is in
> thread with aqt_dCazxTDR4cpk@ashevche-desk.local.

There has been some back and forth but I originally uploaded this
patch set using
notifiers for binding looking for comments on the revival of a
potential upstream
i3cdev driver - Meagan had been working on a similar effort with i3cdev
using a different approach for binding and as of right now the bus notifier
approach seems to be more favored, but not approved nor decided on yet.

> But I have a big concern about exposing i3c to user space in the way we have it
> in i2c. Taking into account that i2c is an odd bus and might lead even to HW
> *physical* breakage, I would thing 100 times before making the same mistake
> in i3c. If you ever want to do this, this must not be user visible feature
> (hidden under expert and debug and maybe even more guards for the starter).
>

Just to make sure we're on the same page here about this - is your concern that
we can arbitrarily address any device on the i3c bus at-will as is the case
with i2c-dev?

FWIW, i3cdev as it exists in this patchset does not have as much free reign
over the i3c bus as i2c-dev does over an i2c bus:

1. i3cdev attaches to discrete target devices rather than exposing the
bus as a whole.
This means if I have 5 devices on my electrical bus that are up and operational
and 4 of them have a proper i3c driver to bind to (E.G. mctp-i3c) then
i3cdev will
not touch those devices, only the 5th device without a bound driver and
that would be via the i3cdev instance created specifically for that
device. A matching
kernel driver being found for a device later means i3cdev
automatically detaches itself
and makes way for a compatible client driver to bind.

2. Master controllers are also not a binding option for the driver, so
no free access to
send out arbitrary CCCs, perform bus scans, do DAA work, etc.

CONFIG_I3CDEV defaults to n and only creates root-owned character
devices for unbound targets, though if i3c maintainers prefer adding
"depends on EXPERT" or expanding the Kconfig help text, I am happy to do
that in v6.

Wolfram:

> >> Userspace access to I3C targets is needed for devices that do not have a
> >> kernel driver bound to them, such as targets in ROM/bootloader recovery
> >> mode (e.g., OCP Secure Firmware Recovery v1.1 and Caliptra Silicon Root of
> >> Trust recovery flows), as well as hardware bring-up and diagnostics.
>
> I don't know anything about these recovery mechanisms and their needs. I
> might have time to look into I3C things after all the conferences in
> Prague, but no promises...

Targets such as Caliptra (Silicon Root of
Trust), SoCs, and accelerators implement the OCP Secure Firmware
Recovery specification over I3C. When a target's runtime firmware is
corrupted, unprovisioned, or fails secure boot, its ROM/bootloader
exposes an I3C target endpoint implementing the OCP Recovery register
interface (PROT_CAP, DEVICE_ID, DEVICE_STATUS, RECOVERY_CTRL,
INDIRECT_FIFO_DATA) over standard I3C private transfers.

Per Section 8.4 of the OCP Secure Firmware Recovery v1.1 spec [1],
because I3C does not have native SMBus-style block transfers, the
recovery protocol emulates them over I3C using framed Private Write
transfers and combined Private Write + Repeated START Private Read
transfers (with PEC) to poll status/reason registers, pull crash logs
from Component Memory Spaces (CMS), stream signed recovery images into
the FIFO, and trigger activation.

The spec defines this same command set across SMBus, USB EP0, and I3C so
that a userspace Recovery Agent on a BMC can drive the recovery,
diagnostic log extraction, and attestation workflow across transports
(using i2c-dev for SMBus, usbfs/libusb for USB EP0, and i3cdev for I3C),
alongside general hardware bring-up and vendor-specific provisioning.

[1] https://www.opencompute.org/documents/ocp-recovery-document-1p1-final-pdf/

Thanks,
Sam

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
