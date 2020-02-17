Return-Path: <SRS0=EbLq=4F=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8AD1C3402F
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Feb 2020 16:45:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0A8A22525
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Feb 2020 16:45:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O2lEmMUp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0A8A22525
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nwx0Y8KW2xuYMiXiBKFbztuKA/eU3cWKOHyD09teAUw=; b=O2lEmMUpHBt6b1
	hvK1yf7UHcXZm/xjJ+4kiYNwFIQDEIgDEvh9rlBNangYkbyvZfQYkbGTx17i1sycqCwJ/VsTHN0z6
	KJwjaGM28gZ0RWy1LQYfAUFK/vTcdPWCjE8GQap9/U06YQUO/v9fyxyq2HIROw04f9ST5vdbqahBz
	8A/iV0Hq2cnF6FBFHJlarKAmWgyvlyeccyM5w2qvk7iABMHr7bPXrP6TPlkg0fVuLOA1NQLDCMqpe
	IAMzLgIOWDrqpJu8Tl+GEOnHj5hCxCDmmNyiPokLcDOJEYBAl8zqak8NNX+rmv3YEThoRfK2wwYoz
	SrnhwRJX9/rfESiPosiQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3jWk-0005Hz-8T; Mon, 17 Feb 2020 16:45:46 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3jMI-00016F-M1
 for linux-i3c@lists.infradead.org; Mon, 17 Feb 2020 16:35:00 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 30BF629251D;
 Mon, 17 Feb 2020 16:34:57 +0000 (GMT)
Date: Mon, 17 Feb 2020 17:34:53 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC v2 0/4] Introduce i3c device userspace interface
Message-ID: <20200217173453.05829f83@collabora.com>
In-Reply-To: <CAK8P3a2EhRyRG20GqMZjYa_-5X2eMiYk20NdsaXe1qVhy5si=A@mail.gmail.com>
References: <cover.1580299067.git.vitor.soares@synopsys.com>
 <20200217155141.08e87b3f@collabora.com>
 <CAK8P3a0jAbevb6mjy7Q=C-TFGn7uHRvshHNEO8XrDPRvRoAiTA@mail.gmail.com>
 <20200217163622.6c78fa3f@collabora.com>
 <CAK8P3a2EhRyRG20GqMZjYa_-5X2eMiYk20NdsaXe1qVhy5si=A@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200217_083458_853124_E3B29963 
X-CRM114-Status: GOOD (  33.03  )
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

On Mon, 17 Feb 2020 17:19:57 +0100
Arnd Bergmann <arnd@arndb.de> wrote:

> On Mon, Feb 17, 2020 at 4:36 PM Boris Brezillon
> <boris.brezillon@collabora.com> wrote:
> > On Mon, 17 Feb 2020 16:06:45 +0100 Arnd Bergmann <arnd@arndb.de> wrote:  
> > > On Mon, Feb 17, 2020 at 3:51 PM Boris Brezillon
> > > <boris.brezillon@collabora.com> wrote:  
> > > > Sorry for taking so long to reply, and thanks for working on that topic.
> > > >
> > > > On Wed, 29 Jan 2020 13:17:31 +0100
> > > > Vitor Soares <Vitor.Soares@synopsys.com> wrote:
> > > >  
> > > > > For today there is no way to use i3c devices from user space and
> > > > > the introduction of such API will help developers during the i3c device
> > > > > or i3c host controllers development.
> > > > >
> > > > > The i3cdev module is highly based on i2c-dev and yet I tried to address
> > > > > the concerns raised in [1].
> > > > >
> > > > > NOTES:
> > > > > - The i3cdev dynamically request an unused major number.
> > > > >
> > > > > - The i3c devices are dynamically exposed/removed from dev/ folder based
> > > > >   on if they have a device driver bound to it.  
> > > >
> > > > May I ask why you need to automatically bind devices to the i3cdev
> > > > driver when they don't have a driver matching the device id
> > > > loaded/compiled-in? If we get the i3c subsystem to generate proper
> > > > uevents we should be able to load the i3cdev module and bind the device
> > > > to this driver using a udev rule.  
> > >
> > > I think that would require manual configuration to ensure that the correct
> > > set of devices get bound to either the userspace driver or an in-kernel
> > > driver.  
> >
> > Hm, isn't that what udev is supposed to do anyway? Remember that
> > I3C devices expose a manufacturer and part-id (which are similar to the
> > USB vendor and product ids), so deciding when an I3C device should be
> > bound to the i3cdev driver should be fairly easy, and that's a
> > per-device decision anyway.
> >  
> > > The method from the current patch series is more complicated,
> > > but it means that any device can be accessed by the user space driver
> > > as long as it's not already owned by a kernel driver.  
> >
> > Well, I'm more worried about the extra churn this auto-binding logic
> > might create for the common 'on-demand driver loading' use case. At
> > first, there's no driver matching a specific device, but userspace
> > might load one based on the uevents it receives. With the current
> > approach, that means we'd first have to unbind the device before
> > loading the driver. AFAICT, no other subsystem does that.  
> 
> As I understand it, this is handled by the patches: when a new device
> shows up, this triggers the creation of the userspace interface and
> also the event that leads to the kernel driver to get loaded. If there
> is a kernel driver for the device, that should still load and bind to the
> device, at which point the user space interface will go away again.

Yep, that's what I figured after having a closer look at the code.

> 
> This may waste CPU cycles for first creating and then destroying
> the user space interface, but I don't see how it requires extra work.
> If it does require manual configuration or unbinding, that would
> indeed be a bad design.

To be honest, I had something less invasive in mind. Something closer
to what spidev provides (a driver that can expose I3C devices to
userspace when explicitly requested). I see now that the USB subsystem
does something similar to what's done here, but I'm wondering if it's
really worth it in the I3C case. As I said in my previous reply, I
expect i3cdev to be used when experimenting or when kernel-space driver
is not an option (licensing/security issues).

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
