Return-Path: <SRS0=8b81=4H=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBD7BC34022
	for <linux-i3c@archiver.kernel.org>; Wed, 19 Feb 2020 08:17:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91EB72176D
	for <linux-i3c@archiver.kernel.org>; Wed, 19 Feb 2020 08:17:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bGt7DDSl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91EB72176D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QE87fUkZOFPTn9XyGhaWBFsCJ4zgCbipQ91imvr+5mo=; b=bGt7DDSlJop857
	LD7s8PgA9oTrzQE8mT53Lg4M0DcDW9eVPZG54LZbdpqtAyoXJLxODMKPM+xv9I8usxJ+Z38n4Wojh
	tbX2nhzSS9SYIRGCp8Fk+GrVjZzpEeTWe1dlGQbqc2ELUBePpp2SZr1Tc9b3dc3iSAOgP9Jn5hYls
	vnu0mI8zvYDbivLHBm6ZbYD7UUpdj+brFBsYNqk6q/kMuwoiKxl6FVnDE2y8rJjcKYTk22i6DT78Q
	ay69vpKYXhmtrXHwpFKa26QTgE0g4ZOa0xnFA0LKtz1ErSN1Zn+1IJrpBEuDwtCjiBCrceuVKmeJ0
	K8luTf26DKqsVcw6Sgpg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4KXe-0007rk-7A; Wed, 19 Feb 2020 08:17:10 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4KXb-0007r6-Ej
 for linux-i3c@lists.infradead.org; Wed, 19 Feb 2020 08:17:09 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 1EB82292F60;
 Wed, 19 Feb 2020 08:17:02 +0000 (GMT)
Date: Wed, 19 Feb 2020 09:16:58 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: [PATCH v3 0/5] Introduce i3c device userspace interface
Message-ID: <20200219091658.7506e7bd@collabora.com>
In-Reply-To: <CH2PR12MB421604E9272413A6C456AB16AE100@CH2PR12MB4216.namprd12.prod.outlook.com>
References: <cover.1582069402.git.vitor.soares@synopsys.com>
 <CH2PR12MB421604E9272413A6C456AB16AE100@CH2PR12MB4216.namprd12.prod.outlook.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200219_001707_624614_4A5620B6 
X-CRM114-Status: GOOD (  27.45  )
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
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, "corbet@lwn.net" <corbet@lwn.net>,
 Joao Pinto <Joao.Pinto@synopsys.com>, "arnd@arndb.de" <arnd@arndb.de>,
 "wsa@the-dreams.de" <wsa@the-dreams.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Wed, 19 Feb 2020 00:39:31 +0000
Vitor Soares <Vitor.Soares@synopsys.com> wrote:

> Hi Boris,
> 
> From: Vitor Soares <vitor.soares@synopsys.com>
> Date: Wed, Feb 19, 2020 at 00:20:38
> 
> > For today there is no way to use i3c devices from user space and
> > the introduction of such API will help developers during the i3c device
> > or i3c host controllers development.
> > 
> > The i3cdev module is highly based on i2c-dev and yet I tried to address
> > the concerns raised in [1].
> > 
> > NOTES:
> > - The i3cdev dynamically request an unused major number.
> > 
> > - The i3c devices are dynamically exposed/removed from dev/ folder based
> >   on if they have a device driver bound to it.
> > 
> > - For now, the module exposes i3c devices without device driver on
> >   dev/bus/i3c/<bus>-<pid>
> > 
> > - As in the i2c subsystem, here it is exposed the i3c_priv_xfer to
> >   userspace. I tried to use a dedicated structure as in spidev but I don't
> >   see any obvious advantage.
> > 
> > - Since the i3c API only exposes i3c_priv_xfer to devices, for now, the
> >   module just makes use of one ioctl(). This can change in the future with
> >   the introduction hdr commands or by the need of exposing some CCC
> >   commands to the device API (private contract between master-slave).
> >   Regarding the i3c device info, some information is already available
> >   through sysfs. We can add more device attributes to expose more
> >   information or add a dedicated ioctl() request for that purpose or both.
> > 
> > - Similar to i2c, I have also created a tool that you can find in [2]
> >   for testing purposes. If you have some time available I would appreciate
> >   your feedback about it as well.
> > 
> > [1] https://lkml.org/lkml/2018/11/15/853
> > [2] https://github.com/vitor-soares-snps/i3c-tools.git
> > 
> > Changes in v3:
> >   Use the xfer_lock to prevent device detach during ioctl call
> >   Expose i3cdev under /dev/bus/i3c/ folder like usb does
> >   Change NOTIFY_BOUND to NOTIFY_BIND, this allows the device detach occur
> >   before driver->probe call
> >   Avoid use of IS_ERR_OR_NULL
> >   Use u64_to_user_ptr instead of (void __user *)(uintptr_t) cast
> >   Allocate k_xfer and data_ptrs at once and eliminate double allocation
> >   check
> >   Pass i3cdev to dev->driver_data
> >   Make all minors available
> >   Add API documentation
> > 
> > Changes in v2:
> >   Use IDR api for minor numbering
> >   Modify ioctl struct
> >   Fix SPDX license
> > 
> > Vitor Soares (5):
> >   i3c: master: export i3c_masterdev_type
> >   i3c: master: export i3c_bus_type symbol
> >   i3c: master: add i3c_for_each_dev helper
> >   i3c: add i3cdev module to expose i3c dev in /dev
> >   userspace-api: add i3cdev documentation
> > 
> >  Documentation/userspace-api/i3c/i3cdev.rst | 116 ++++++++
> >  drivers/i3c/Kconfig                        |  15 +
> >  drivers/i3c/Makefile                       |   1 +
> >  drivers/i3c/i3cdev.c                       | 429 +++++++++++++++++++++++++++++
> >  drivers/i3c/internals.h                    |   2 +
> >  drivers/i3c/master.c                       |  16 +-
> >  include/uapi/linux/i3c/i3cdev.h            |  38 +++
> >  7 files changed, 616 insertions(+), 1 deletion(-)
> >  create mode 100644 Documentation/userspace-api/i3c/i3cdev.rst
> >  create mode 100644 drivers/i3c/i3cdev.c
> >  create mode 100644 include/uapi/linux/i3c/i3cdev.h
> > 
> > -- 
> > 2.7.4  
> 
> I want to make you know that none of your previous comments was ignored 
> and  I would like to start the discussion from this point.

Sure, np. I'll probably wait for a v4 exploring the option I proposed
then.

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
