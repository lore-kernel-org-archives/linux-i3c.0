Return-Path: <SRS0=EbLq=4F=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6A57C34025
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Feb 2020 16:45:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7859824654
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Feb 2020 16:45:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ACBuva/n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7859824654
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9C4gxefTgSm57TM93aAamQySqSzSc0oNx9+zudniuiM=; b=ACBuva/nm0CL+x
	qWmhjiGm3DHsftiC8GHW0kHJ8dh/scpgql7Lko//P+5/L4mjaegYcosU+ad8vMiilAmNMS28YIjdT
	FN79GbwpYEiTE76/YFRZq/5NIuUJLpBy2bc/x3RcsReME1+wxCdqswhKCrTez/7ScPxD4dTHlQmIl
	MhUwIOu2DOjiKMo13WgpCFuVWaWHAgogV/7mEMPugVMkTnwgMk2lwAgFgmbU9Yty8hrJLBVsSrUss
	VgtWKyI5/peQEogfZdH/x/mYaG5ML5PhJgkrGkk2R83e9ij9MT3ALHRmzGzLwRnbobpdaJ5VWN+hA
	VlXX2i+IgXbsuZ1tqWow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3jWi-0005GX-Tq; Mon, 17 Feb 2020 16:45:44 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3igr-0006db-VP
 for linux-i3c@lists.infradead.org; Mon, 17 Feb 2020 15:52:11 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 1FA3F293C88;
 Mon, 17 Feb 2020 15:52:08 +0000 (GMT)
Date: Mon, 17 Feb 2020 16:52:04 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: [RFC v2 0/4] Introduce i3c device userspace interface
Message-ID: <20200217165204.7f2d2774@collabora.com>
In-Reply-To: <CH2PR12MB4216459E37F9AB1AAF0B2EFDAE160@CH2PR12MB4216.namprd12.prod.outlook.com>
References: <cover.1580299067.git.vitor.soares@synopsys.com>
 <20200217155141.08e87b3f@collabora.com>
 <CH2PR12MB4216459E37F9AB1AAF0B2EFDAE160@CH2PR12MB4216.namprd12.prod.outlook.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200217_075210_156388_7BEBC918 
X-CRM114-Status: GOOD (  25.53  )
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
 "arnd@arndb.de" <arnd@arndb.de>, "wsa@the-dreams.de" <wsa@the-dreams.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Mon, 17 Feb 2020 15:32:55 +0000
Vitor Soares <Vitor.Soares@synopsys.com> wrote:

> Hi Boris,
> 
> From: Boris Brezillon <boris.brezillon@collabora.com>
> Date: Mon, Feb 17, 2020 at 14:51:41
> 
> > Hello Vitor,
> > 
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
> My idea was to expose every device to user-space by default so we can 
> test them without a driver (more or less the i2c use case) but as we 
> agreed during the i3c subsystem only expose devices that doesn't have 
> device driver.

Those that do not have a driver *yet*. What if i3cdev is compiled-in
and other I3C drivers are enabled as modules? When the device is
discovered at boot time is will be automatically bound to the i3cdev
driver since no matching drivers are available at that point. But
the end user probably expects this device to be attached to the in
kernel driver.

> I considered to have a uevent but to expose the devices by default it 
> would required something generic, what I didn't figure out and tend to 
> follow the i2c-dev module.

Well, I3C and I2C/SPI are quite different in this regard. I2C dev
exposes the whole bus, and SPI devs don't have a standard way to
uniquely identify the device connected on the bus (unless it has a
dedicated compatible for DT-based boards). In that case it might make
sense to auto-bind all orphan devs to the default spidev driver, though
I'm not entirely sure it's really necessary since that's probably a
per-board decision, and having a udev rule matching the bus/CS would
make sense too.

> 
> With this current approach even if a device has a driver we can unbind it 
> through the Sysfs and have access from user space which I found useful 
> for debug.

That's my point. We're making the default 'on-demand driver loading'
use case more complicated to ease the less common 'userspace driver'
use case.

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
