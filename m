Return-Path: <SRS0=EbLq=4F=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81FBEC3402D
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Feb 2020 16:45:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47CCF22525
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Feb 2020 16:45:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ufA6zzED"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47CCF22525
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=43zgRnvSAXKE42XLLHlYHr7UVoS/INQfiyoBDswh4fQ=; b=ufA6zzEDBkcvhS
	xOr/NB/nQ2BJFtE3LrIWwFv+oMzmaCKTUB23ZsWQ/DOG0A21v7SM///I9GhoZ1J4mwpm9aTJ1y1RZ
	wHgyf4Rkdg2CL4FVIUAWvpClkz2rri20TZSGXqCTxTQg2IlCp8Ti932qDmpZGTy58Tg+9vf1Hehvj
	OD/uNS+TKRI8kQp9B8W95uFlVdIom1MwB8XHJzmeGf3l6XjQoi4zBWhpkssVRfGrMWaBistobWywq
	okMp1erF4osWIy2uVK04QR1cvzWl1C6ADLo8ijtMl+9FqAS2BGux+oLNiqs6KRIrXsceR8wHr+G9c
	kx0Nnc9nGM4E5FbkjOkg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3jWj-0005HL-R9; Mon, 17 Feb 2020 16:45:45 +0000
Received: from mout.kundenserver.de ([217.72.192.75])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3j87-00040F-0o
 for linux-i3c@lists.infradead.org; Mon, 17 Feb 2020 16:20:20 +0000
Received: from mail-qv1-f52.google.com ([209.85.219.52]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MSbt9-1it1l80upl-00Sy6g for <linux-i3c@lists.infradead.org>; Mon, 17 Feb
 2020 17:20:15 +0100
Received: by mail-qv1-f52.google.com with SMTP id g6so7819774qvy.5
 for <linux-i3c@lists.infradead.org>; Mon, 17 Feb 2020 08:20:14 -0800 (PST)
X-Gm-Message-State: APjAAAVmBg6Nqv/BuGKkXFTa9AFGOlMWEic2/PjhOEo0Xv59RZk2sAcj
 tBoJeS1CwI/G6fYuHF8qx/cRNNukxJ0T/GNSUHg=
X-Google-Smtp-Source: APXvYqzYCO15qEyUkpdnFmwa26IRA+4Z3t8KgCeJYJa2fcHKMjmSuPHCLc9jCWIGCokb9o8Y9wrFM1dftVMO8mDjlBk=
X-Received: by 2002:a05:6214:524:: with SMTP id
 x4mr13442601qvw.4.1581956413750; 
 Mon, 17 Feb 2020 08:20:13 -0800 (PST)
MIME-Version: 1.0
References: <cover.1580299067.git.vitor.soares@synopsys.com>
 <20200217155141.08e87b3f@collabora.com>
 <CAK8P3a0jAbevb6mjy7Q=C-TFGn7uHRvshHNEO8XrDPRvRoAiTA@mail.gmail.com>
 <20200217163622.6c78fa3f@collabora.com>
In-Reply-To: <20200217163622.6c78fa3f@collabora.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 17 Feb 2020 17:19:57 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2EhRyRG20GqMZjYa_-5X2eMiYk20NdsaXe1qVhy5si=A@mail.gmail.com>
Message-ID: <CAK8P3a2EhRyRG20GqMZjYa_-5X2eMiYk20NdsaXe1qVhy5si=A@mail.gmail.com>
Subject: Re: [RFC v2 0/4] Introduce i3c device userspace interface
To: Boris Brezillon <boris.brezillon@collabora.com>
X-Provags-ID: V03:K1:BZ9zwT/6k+debRhn8loLIJtV99SaNmllY3ueWNMkX8CblF41Gl6
 L8IbDrY/XxKUZJQjiT3g++IgOoVFOZ6tGkXnLho0+Y/0BDF90QS9QUYxt2HwKPMYpuj9MYS
 qULoDsKrwNpAo6YESr3/hpygUhyNfIMFZVNhS6OmpsQ6wW2zU6Hv75vw8+7aYXgLOy1UPSD
 J01Zt1MzrfH9YiO1EJm1Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3vbnHNeUHak=:2d0rd+0ND1b6e5kqeBlq1f
 5nva0twM7lc1hNHYOp+++IpP1HfuXTCUYFapmWqYz8m96kyoZqY+xaPFzmLr0WtB+8N/jse1e
 5c85NfNkqUo33A5IaFmRL72PH+mzBgSLDwFQLmoHUWc9p8RH5tRXcx61pLM+P+9uXkjNPhGTg
 37pTMChM/aafi9EJDNkVCEUyELMgjD7XxXZ/hp0mw1n+wB6z4aw5/y4NiaWgYvfav1TIzxljS
 EK2ptQfrc5Ed2rKZSxDFUztS9R71VmCGKqscFGL6PQ+LBetd/2TqWHTkTSFW785zUpCIO7NEY
 3ARRtuQdWjncFZuJ8FPqUW0p6qHZJ+lNiEDLvIx2XfCd7p/Qb95FBnq+/ZQ2I3y4+Pdf7oIew
 dqXCatGBeIW9ZW3ja1SMt0Fk+G1EkDe0scTWPJRBTZaMIA3lznEz6NRyFuGUtKS4/LoBYrCS/
 0dgDcOg+ub3/It+0WFNaFxF2E8rqmDCCoG+qBsAJTUDBS7OjqxeDKRd72mVMtSOTVmixy+7gB
 SUJwUrVF7NKPRVilyIx0ylZ3GGxNz85ZKjiuPS/19eGpmVmozQNPuN4HVcGpvuFTwiPjmsF26
 y2FbyYBaxeMn1mW7c0l2D/sq4CidItSEJZtFJLBOultJ/9BiGzoPkyFay/m3/r7CiWQSnNjua
 fE4JBDmB+mc4tLZ03J9urc2SqHL3W0Ota4EDM9XYboir3pXxAwXUQgSyt+zPQvgs/7qzLBhch
 MBnPy1vTbeUzWoMJ1QDnxkzVrZTRPGo1xImUv/FrqO0MaXIB9CxOx0ZkkOFqFJeue6A2qLBdb
 lX55vMeEu+1S9lCLnZbC4lAcbPuJrPerBLqIA5+ETZhIpC4QU8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200217_082019_362565_D87B1562 
X-CRM114-Status: GOOD (  28.91  )
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

On Mon, Feb 17, 2020 at 4:36 PM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
> On Mon, 17 Feb 2020 16:06:45 +0100 Arnd Bergmann <arnd@arndb.de> wrote:
> > On Mon, Feb 17, 2020 at 3:51 PM Boris Brezillon
> > <boris.brezillon@collabora.com> wrote:
> > > Sorry for taking so long to reply, and thanks for working on that topic.
> > >
> > > On Wed, 29 Jan 2020 13:17:31 +0100
> > > Vitor Soares <Vitor.Soares@synopsys.com> wrote:
> > >
> > > > For today there is no way to use i3c devices from user space and
> > > > the introduction of such API will help developers during the i3c device
> > > > or i3c host controllers development.
> > > >
> > > > The i3cdev module is highly based on i2c-dev and yet I tried to address
> > > > the concerns raised in [1].
> > > >
> > > > NOTES:
> > > > - The i3cdev dynamically request an unused major number.
> > > >
> > > > - The i3c devices are dynamically exposed/removed from dev/ folder based
> > > >   on if they have a device driver bound to it.
> > >
> > > May I ask why you need to automatically bind devices to the i3cdev
> > > driver when they don't have a driver matching the device id
> > > loaded/compiled-in? If we get the i3c subsystem to generate proper
> > > uevents we should be able to load the i3cdev module and bind the device
> > > to this driver using a udev rule.
> >
> > I think that would require manual configuration to ensure that the correct
> > set of devices get bound to either the userspace driver or an in-kernel
> > driver.
>
> Hm, isn't that what udev is supposed to do anyway? Remember that
> I3C devices expose a manufacturer and part-id (which are similar to the
> USB vendor and product ids), so deciding when an I3C device should be
> bound to the i3cdev driver should be fairly easy, and that's a
> per-device decision anyway.
>
> > The method from the current patch series is more complicated,
> > but it means that any device can be accessed by the user space driver
> > as long as it's not already owned by a kernel driver.
>
> Well, I'm more worried about the extra churn this auto-binding logic
> might create for the common 'on-demand driver loading' use case. At
> first, there's no driver matching a specific device, but userspace
> might load one based on the uevents it receives. With the current
> approach, that means we'd first have to unbind the device before
> loading the driver. AFAICT, no other subsystem does that.

As I understand it, this is handled by the patches: when a new device
shows up, this triggers the creation of the userspace interface and
also the event that leads to the kernel driver to get loaded. If there
is a kernel driver for the device, that should still load and bind to the
device, at which point the user space interface will go away again.

This may waste CPU cycles for first creating and then destroying
the user space interface, but I don't see how it requires extra work.
If it does require manual configuration or unbinding, that would
indeed be a bad design.

      Arnd

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
