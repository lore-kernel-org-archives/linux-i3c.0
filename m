Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92312606A31C
	for <linux-i3c@archiver.kernel.org>; Thu, 12 Nov 2026 23:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Be+1E4YS;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R9B0kq0n
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=DAlPomUyvD/DE9smkwSs3vQPLtRsjI48sTfO4//VcuQ=; b=Be+1E4YSf54Upc28UnzDoyrlL+
	6jGlszSE5hjnRWvdSq9QN6mJyGfb9lX3EmaQd8NPWupEGTKIkkjy6Bl3dkaPbuF26FGhwf3m1/cKj
	hwTqjD9mtlaw3UG/nBA/H9dj5cxu7HsAc8y5z3UJHisrI3MwzdWKCmnX6MdzOloqE6xmNlN4MbbYI
	4GzzdnxS34ElQj6JAJPBvd7jveSt5gSHTkuExzBZYhy8lWL3kXX9KpebGzA40r2GNCHqCJlATO3A4
	v9XM5r95vBdshX+VUEhVEyPj0n/WC0wWRpNioKvZk8INe/haALN5Y/FM9ZxqG3i9Hi5m/oZunN9lc
	soAFaOkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRe80-0000000BF2g-1EtZ;
	Thu, 12 Nov 2026 23:22:48 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRe7x-0000000BF2L-3epn
	for linux-i3c@lists.infradead.org;
	Thu, 12 Nov 2026 23:22:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794525766; x=1826061766;
  h=message-id:date:mime-version:to:cc:from:subject:
   content-transfer-encoding;
  bh=b/4X6Q6kTElgF00Z1iBm4EknWIo7QbRogOqzN9uUFnQ=;
  b=R9B0kq0noUIEn7ENRWTK32TKnmauUiqev+8Lw4kzIJj/M7K5ebA96IOE
   Ah0Qu/Wqgtwm2ldK1Rr4uwq2geODkh2izAnVq33CQEYAkXVoUhxuWZCcr
   wSMwAGjUCFAbIOP/0zjWZXoo0gu8e4UXYW1r5Nan5JKy2NEgC/1IwQQta
   7b19iz6XQJk6zT0V+PIX1yZgODiNCpjuMKnAhIMykTDa/rX+HqbI6lKMv
   UkCU1fu680YFMwDw6+/4EV1FTyZgOninAs2VaXbGnfdL/loN3eFnkbiux
   mQkS2Wythkd673uiYQ020pqZAfNuYCSDXin+0d7gnc2bikUy3Bm03jzFd
   A==;
X-CSE-ConnectionGUID: D3B1eKMOQS2nEEqmy4Bxiw==
X-CSE-MsgGUID: XVEvwThcR1KCG5KQWawizA==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3407621"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3407621"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 15:22:45 -0800
X-CSE-ConnectionGUID: +GcMbUlNSw2uy9tFIepXXw==
X-CSE-MsgGUID: 1MVnRT57Slmon9yBatlIVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="8944435"
Received: from rmodi-mobl.amr.corp.intel.com (HELO [10.124.161.66]) ([10.124.161.66])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 15:22:45 -0800
Message-ID: <087d879a-e8fd-402f-b8d2-2531244ff69f@linux.intel.com>
Date: Thu, 12 Nov 2026 15:22:44 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com, Frank.li@oss.nxp.com, linux-i3c@lists.infradead.org,
 linux-usb@vger.kernel.org
From: "Pathak, Asutosh" <asutosh.pathak@linux.intel.com>
Subject: [RFC] i3c: USB-I3C (class 0x3C) master + userspace access - which way
 do you want it?
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_152245_955218_539DE9F7 
X-CRM114-Status: GOOD (  10.09  )
X-Spam-Score: -4.2 (----)
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
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Alexandre,

Before I send a real series I want to settle one design question, because the
answer decides whether half of this is even worth submitting.

We have an out-of-tree driver for the USB-I3C device class (USB class 0x3C) - a
USB device that bridges the host to an I3C bus. It's two modules:

 - a controller driver: USB class driver that also calls i3c_master_register()
   and implements the usual master ops (do_daa, send_ccc_cmd, priv xfers, IBI).
   It's a normal I3C master that just happens to talk over USB. I think this
   belongs in drivers/i3c/master/ and goes upstream the usual way.

 - a target driver: binds the I3C devices behind it and hands a char dev +
   ioctls to userspace (OpenIPC and similar tools) so they can drive the bus.

The whole reason this hardware exists is userspace-driven I3C from a host PC.
But as far as I can tell the I3C subsystem has no userspace interface at all -
no i3c-dev, no uapi header - so anything we add there is new ABI you'd have to
live with. Hence the RFC instead of a patch bomb.

So, which of these do you want?

 a) nothing in userspace upstream - we only send the master, keep the ioctls
    out of tree.
 b) a generic i3c-dev (like i2c-dev), proper include/uapi/linux/i3c-dev.h,
    usable by any master. Happy to do it, but I'm not going to design that ABI
    without you on board.
 c) what we already have: the controller stays a pure master with no userspace
    ABI, and the target side is a normal I3C device driver (drivers/i3c/device.c)
    where each bound target exposes its own char dev + ioctl and reaches the bus
    through the standard priv-xfer path. It's the least churn for us and matches
    our architecture doc - so if you're fine with a per-target ioctl node living
    inside the USB-I3C driver (not a generic subsystem ABI), we'll run with it.

I'll build whichever one you pick.

Rough plan either way: master in drivers/i3c/master/ first (useful on its own,
no userspace ABI), then the userspace piece separately, then docs + MAINTAINERS.

Mainly I'd like your call on (a)/(b)/(c), and confirmation that a USB-transport
master is OK in drivers/i3c/master/. For what it's worth (c) is our preference,
since it's already working and keeps the ABI contained. Would rather get this
right now than argue about it at v3.

Thanks,
Asutosh

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
