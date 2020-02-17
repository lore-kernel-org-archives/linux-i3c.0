Return-Path: <SRS0=EbLq=4F=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B395C34029
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Feb 2020 16:45:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47632215A4
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Feb 2020 16:45:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PzPth8td"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47632215A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FpOStBxFgY0MX3MH7Glpupnk26v5OYWXgK5zTjc7nk0=; b=PzPth8tdoBHVZx
	cJo1j4Xr3ADwcUiOjZkMF8rYfrLWVX09WIdHeVbwi4+XjAnGpyHlJ6XKBgYDO0DAJORoS74AgQUGc
	Pf2FyErX7rhcs0PTRbS6Id72UbeB4RGzruMtezIV0QYqk/QWhjXBFIjy0wQJsanIPrNRfAO5+O9Jv
	CCgFZwTjLJI63uo3f/wZo1miGiYfhsnsQGbSuhJK5nR2ObVcSehto+V8G7llt3IQThNMz8OjjsmOJ
	Sa2t9loBFczPfQdLt9bYYB3peUcbZ0x1kCKZDzj3Jw8Okmhw8Id1MqM27mdT/h7Wuo1zAODcUZfCQ
	9bfiwJJubtbtIfi/YLgA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3jWi-0005GM-LY; Mon, 17 Feb 2020 16:45:44 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3iRe-000054-Cg
 for linux-i3c@lists.infradead.org; Mon, 17 Feb 2020 15:36:29 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id DB9A2293D7D;
 Mon, 17 Feb 2020 15:36:24 +0000 (GMT)
Date: Mon, 17 Feb 2020 16:36:22 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC v2 0/4] Introduce i3c device userspace interface
Message-ID: <20200217163622.6c78fa3f@collabora.com>
In-Reply-To: <CAK8P3a0jAbevb6mjy7Q=C-TFGn7uHRvshHNEO8XrDPRvRoAiTA@mail.gmail.com>
References: <cover.1580299067.git.vitor.soares@synopsys.com>
 <20200217155141.08e87b3f@collabora.com>
 <CAK8P3a0jAbevb6mjy7Q=C-TFGn7uHRvshHNEO8XrDPRvRoAiTA@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200217_073627_954477_98F26AC3 
X-CRM114-Status: GOOD (  22.83  )
X-Mailman-Approved-At: Mon, 17 Feb 2020 08:45:42 -0800
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 Wolfram Sang <wsa@the-dreams.de>, gregkh <gregkh@linuxfoundation.org>,
 Boris Brezillon <bbrezillon@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Vitor Soares <Vitor.Soares@synopsys.com>, Mark Brown <broonie@kernel.org>,
 linux-i3c@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Mon, 17 Feb 2020 16:06:45 +0100
Arnd Bergmann <arnd@arndb.de> wrote:

> On Mon, Feb 17, 2020 at 3:51 PM Boris Brezillon
> <boris.brezillon@collabora.com> wrote:
> > Sorry for taking so long to reply, and thanks for working on that topic.
> >
> > On Wed, 29 Jan 2020 13:17:31 +0100
> > Vitor Soares <Vitor.Soares@synopsys.com> wrote:
> >  
> > > For today there is no way to use i3c devices from user space and
> > > the introduction of such API will help developers during the i3c device
> > > or i3c host controllers development.
> > >
> > > The i3cdev module is highly based on i2c-dev and yet I tried to address
> > > the concerns raised in [1].
> > >
> > > NOTES:
> > > - The i3cdev dynamically request an unused major number.
> > >
> > > - The i3c devices are dynamically exposed/removed from dev/ folder based
> > >   on if they have a device driver bound to it.  
> >
> > May I ask why you need to automatically bind devices to the i3cdev
> > driver when they don't have a driver matching the device id
> > loaded/compiled-in? If we get the i3c subsystem to generate proper
> > uevents we should be able to load the i3cdev module and bind the device
> > to this driver using a udev rule.  
> 
> I think that would require manual configuration to ensure that the correct
> set of devices get bound to either the userspace driver or an in-kernel
> driver.

Hm, isn't that what udev is supposed to do anyway? Remember that
I3C devices expose a manufacturer and part-id (which are similar to the
USB vendor and product ids), so deciding when an I3C device should be
bound to the i3cdev driver should be fairly easy, and that's a
per-device decision anyway.

> The method from the current patch series is more complicated,
> but it means that any device can be accessed by the user space driver
> as long as it's not already owned by a kernel driver.

Well, I'm more worried about the extra churn this auto-binding logic
might create for the common 'on-demand driver loading' use case. At
first, there's no driver matching a specific device, but userspace
might load one based on the uevents it receives. With the current
approach, that means we'd first have to unbind the device before
loading the driver. AFAICT, no other subsystem does that.

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
