Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC422606A31C
	for <linux-i3c@archiver.kernel.org>; Thu, 12 Nov 2026 23:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RSzP0kuy;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=WAqvoOxH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IvfQTcTI5xz6b/TKPivkJlDJERvsWQKmBpKAUHhRkFw=; b=RSzP0kuynRKf6FsQ4p9IPxOXDO
	gm9VQk83Kgff8k1M09C2gCQ3H19LKv+IA9fcSnZ8QIGtcNIDjm55GXHjbCOEZ2+QEJn+unBHU6Qx4
	YnadvDqXT+l0zGwa/QCtfNTjhiBo0chRg44fgQczqvhpMKnTeXeCOCgHb6hbK2PWC9jXjv09mzhfo
	KXwPlqVQN3rsrHUJUxxKQrBiAhKzBEOH5IVovlFtbz1f3erSxDdj1kv3NqMriho75XR2sRv1IlTkB
	VcvmXttR4QAdWw92BZe/WbgPTVq1yXqU3G2qQbQkkdZy3/hqxh3AMLdVUa8LZlD2aEdqGPPUid53r
	TVV0j9PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xReKG-0000000BFp1-2QBR;
	Thu, 12 Nov 2026 23:35:28 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xReKC-0000000BFnS-3z34
	for linux-i3c@lists.infradead.org;
	Thu, 12 Nov 2026 23:35:27 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CDCBA4E41599
	for <linux-i3c@lists.infradead.org>; Thu, 12 Nov 2026 23:35:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 910F2601AD;
	Thu, 12 Nov 2026 23:35:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CC67011BC138E;
	Fri, 13 Nov 2026 00:35:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794526517; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=VXZSMq9bS+pv1r23/W5YZTxBrtghVTtZRlA85g7hY0A=;
	b=WAqvoOxH6uPg5TMia1mxs+Fnv6flJYlFSJ0zdTdafZ3tkxLdMgAWulcXPLKEaXQ5eh4OWe
	iT64iWd6CjqhHKKWTX18tQKVKws+JtCig4gwZ5mV/HvqG64ER7x5EGMjbmCdppY8TVzhzt
	H6PDjLrfek3i4AnFfOeBkjQH6s21ZqcDrSuxX/Y7bPCY/eeO1Rkj37nvDBCcTkjk3CJH87
	gEix9EfZvefjo2XEmKxYaOOF7Vd5PVMmgoduchUv651ItfwITitDoCed7NOtU9lrP0xhaK
	Pah42EaFaanWo6bsEi2YnHlk7IlVbtzB+ZWPjZgCwtyj6W+LxKNs1UB3Dgcnlw==
Date: Fri, 13 Nov 2026 00:35:13 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: "Pathak, Asutosh" <asutosh.pathak@linux.intel.com>
Cc: Frank.Li@nxp.com, Frank.li@oss.nxp.com, linux-i3c@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: Re: [RFC] i3c: USB-I3C (class 0x3C) master + userspace access -
 which way do you want it?
Message-ID: <202611122335131c454ddf@mail.local>
References: <087d879a-e8fd-402f-b8d2-2531244ff69f@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <087d879a-e8fd-402f-b8d2-2531244ff69f@linux.intel.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_153525_160038_9079687E 
X-CRM114-Status: GOOD (  25.98  )
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

On 12/11/2026 15:22:44-0800, Pathak, Asutosh wrote:
> Hi Alexandre,
> 
> Before I send a real series I want to settle one design question, because the
> answer decides whether half of this is even worth submitting.
> 
> We have an out-of-tree driver for the USB-I3C device class (USB class 0x3C) - a
> USB device that bridges the host to an I3C bus. It's two modules:
> 
>  - a controller driver: USB class driver that also calls i3c_master_register()
>    and implements the usual master ops (do_daa, send_ccc_cmd, priv xfers, IBI).
>    It's a normal I3C master that just happens to talk over USB. I think this
>    belongs in drivers/i3c/master/ and goes upstream the usual way.
> 
>  - a target driver: binds the I3C devices behind it and hands a char dev +
>    ioctls to userspace (OpenIPC and similar tools) so they can drive the bus.
> 
> The whole reason this hardware exists is userspace-driven I3C from a host PC.
> But as far as I can tell the I3C subsystem has no userspace interface at all -
> no i3c-dev, no uapi header - so anything we add there is new ABI you'd have to
> live with. Hence the RFC instead of a patch bomb.
> 
> So, which of these do you want?
> 
>  a) nothing in userspace upstream - we only send the master, keep the ioctls
>     out of tree.
>  b) a generic i3c-dev (like i2c-dev), proper include/uapi/linux/i3c-dev.h,
>     usable by any master. Happy to do it, but I'm not going to design that ABI
>     without you on board.
>  c) what we already have: the controller stays a pure master with no userspace
>     ABI, and the target side is a normal I3C device driver (drivers/i3c/device.c)
>     where each bound target exposes its own char dev + ioctl and reaches the bus
>     through the standard priv-xfer path. It's the least churn for us and matches
>     our architecture doc - so if you're fine with a per-target ioctl node living
>     inside the USB-I3C driver (not a generic subsystem ABI), we'll run with it.
> 
> I'll build whichever one you pick.
> 
> Rough plan either way: master in drivers/i3c/master/ first (useful on its own,
> no userspace ABI), then the userspace piece separately, then docs + MAINTAINERS.
> 
> Mainly I'd like your call on (a)/(b)/(c), and confirmation that a USB-transport
> master is OK in drivers/i3c/master/. For what it's worth (c) is our preference,
> since it's already working and keeps the ABI contained. Would rather get this
> right now than argue about it at v3.
> 

USB-transport master is not an issue and you can submit it. For the
i3c-dev related question, you should probably have a look at the current
threads so you can add your use case:

https://lore.kernel.org/linux-i3c/ati3c2JBNLGRnPen@ashevche-desk.local/T/#mb42d9b2785f8508d39eaf782b3d29189226b8029

https://lore.kernel.org/linux-i3c/20260911210935.1353126-1-meaganlloyd@linux.microsoft.com/

Regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
