Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C18ECEC1112
	for <linux-i3c@archiver.kernel.org>; Mon, 23 Feb 2026 17:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IUVAcmVbVPeC+OvEJlUGkVbJUq8Ul27TMKuG53lyYGA=; b=ZuDikFPHGN50U1
	wQCzmQju19iJAfG9kkPXb/pinDXqC73V7aDPUsUCSNJoCKljfWtBNW/p0RVLAU/rWrpx6Hf1RaGKj
	QEZbhDxKj7yEPS0EmP5rVnAc39g58HgM/5go9zrmXfhL+R60eTRWg8juPygv7G9etHNRqYKjN3VQd
	bSZIbDD7MUmEpeQTccgKU99ffRGu2xK4yMFUziOcrZiPoI+JrM1PcB9KILARDYgkrqOKwrUN7Zqtk
	AQ7YRjVZ02uD1g6eT7tPWDqlExT47pEEb4r3MT9XaDmcM/mvonFJvieYLTmHrx5G7fs2IQ0ttqJsi
	otdFL8Xlv8qei3QzZJvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZSS-00000000jRD-29qs;
	Mon, 23 Feb 2026 17:10:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZSR-00000000jR1-0IBH
	for linux-i3c@lists.infradead.org;
	Mon, 23 Feb 2026 17:10:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2265560180;
	Mon, 23 Feb 2026 17:10:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96164C19423;
	Mon, 23 Feb 2026 17:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771866653;
	bh=REKxls4ubH0GdMKP0VTLopoSuV+YwqOYr5wjaQu+Oh8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pxNOXe/DFDst4HV6/B693hXdNfBHnjApHkdtRC6yTQ3XEkM+fDz/M7P9LpAUPD9H8
	 eA6u6qVD0zafTdwsmv8A0DH+mkgRscB2F3hP8cJP0OlDS+4BAL+QPYq/FPmzXD6NH4
	 zN9htr3a3Q/OBm8X+lephCOQPnv9ixVvfQQ0h7mg+5jlD6TVog3YRouhQUniAXK5Y7
	 R++//4rDqI6IABPmsynkWTQ6IMyztqRom3ar8s+12f/8RmPruj0DJhNF0i++AvIeFZ
	 hEJflLsh42dY7k4DmzythpacJPid6MheoKn1UAoMZeFfXgz4lO4GD3dca9EfRkYwZ1
	 TuOXZ5nqetdAg==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id B4DA6F40072;
	Mon, 23 Feb 2026 12:10:52 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Mon, 23 Feb 2026 12:10:52 -0500
X-ME-Sender: <xms:HIqcaaOq-1JDhyHWQBWPMs7dKEeORgwGi6zXsr2RZnlpgDfmwLJpYA>
    <xme:HIqcacpaKxDYwH3gLG9bjas_pPOzpyjlqI820cr34W4-z8rl1e-qKCH1nj8jEyK8r
    7EGeDvSlJJA2XX9Tw6VySb2na3iQJExxmFbUZQhFr4fzJog9hFZ1g>
X-ME-Received: <xmr:HIqcabF-Av0DbxiRJzNZ8dYbimcgt2GCT2T9kqwYLiVLAqN04RwwdIRtX2aXl6z9W7RiT_5HkYH5ZYqLqrPhVooK7Rrvl1fl>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvfeejjeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpeeuohhquhhn
    ucfhvghnghcuoegsohhquhhnsehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnh
    epfeekfeefleehveffhedtfeefleegheehheehkeeikeeltdfftddtteekhefgtedtnecu
    ffhomhgrihhnpehgihhthhhusghushgvrhgtohhnthgvnhhtrdgtohhmpdhinhhfrhgrug
    gvrggurdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudeije
    dtleekgeejuddqudejjeekheehhedvqdgsohhquhhnpeepkhgvrhhnvghlrdhorhhgsehf
    ihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpd
    hrtghpthhtohepfhhrrghnkhdrlhhisehngihprdgtohhmpdhrtghpthhtoheplhhouhhi
    shdrshgruhhtihgvrhesohhvhhgtlhhouhgurdgtohhmpdhrtghpthhtoheprghlvgigrg
    hnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhn
    uhigqdhifegtsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepsh
    hhhigrmhdqshhunhgurghrrdhsqdhksegrmhgurdgtohhmpdhrtghpthhtohepsghoqhhu
    nhesfhhigihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:HIqcaRpn_CTBIsp3cZv42ndztIu0w-GbhQF7yvcWe9hDhChO_KM_pQ>
    <xmx:HIqcaUYRh4Kly6U09SIBS9zWjDFPmLXyygemBbGGd2bqigA7hKn7Ww>
    <xmx:HIqcaaVdvxyV05_752x2EugYFWOgInnjWkGt2iGKdiGuxd1EZSKTng>
    <xmx:HIqcad-TwaMlJ_y86x78_JCH3TY1h00fQSZfFqI26bTHUG3PncWm6Q>
    <xmx:HIqcaT9UqFanRF9xyN4JLNnKjEpjBU_xJt0pgN78dcm4XQQO8j7KDOpT>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Feb 2026 12:10:52 -0500 (EST)
Date: Mon, 23 Feb 2026 09:10:51 -0800
From: Boqun Feng <boqun@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Louis Sautier <louis.sautier@ovhcloud.com>,
	alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	Shyam-sundar.S-k@amd.com
Subject: Re: Error while loading dw-i3c-master: UBSAN: shift-out-of-bounds in
 drivers/i3c/master/dw-i3c-master.c:885:12
Message-ID: <aZyKG4Opz27Dyv9E@tardis.local>
References: <b9b568e8-8e21-49ac-b3dd-ab750fc329aa@ovhcloud.com>
 <202512091248543fcf4c83@mail.local>
 <c7e29aeb-c258-45e6-af78-9a81ee8de327@ovhcloud.com>
 <aThbaFalAXblN56U@lizhi-Precision-Tower-5810>
 <55935d9e-a647-4cd0-86a0-915c4aebc302@ovhcloud.com>
 <aTmPs3yviUjr2lXR@lizhi-Precision-Tower-5810>
 <d087f1c8-12be-4456-ac7c-978a82771ab8@ovhcloud.com>
 <aTr21PvJUH3+Cwqp@lizhi-Precision-Tower-5810>
 <365eca18-446c-4cb2-a3e7-1f07136137f3@ovhcloud.com>
 <aUA2cr9M2iGxN+rQ@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aUA2cr9M2iGxN+rQ@lizhi-Precision-Tower-5810>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Mon, Dec 15, 2025 at 11:25:22AM -0500, Frank Li wrote:
> On Fri, Dec 12, 2025 at 08:44:41PM +0100, Louis Sautier wrote:
> > On 12/11/25 17:52, Frank Li wrote:
> > > On Wed, Dec 10, 2025 at 08:50:24PM +0100, Louis Sautier wrote:
> > > > On 12/10/25 16:20, Frank Li wrote:
> > > > > On Tue, Dec 09, 2025 at 08:52:46PM +0100, Louis Sautier wrote:
> > > > > > On 12/9/25 18:24, Frank Li wrote:
> > > > > > > On Tue, Dec 09, 2025 at 04:36:30PM +0100, Louis Sautier wrote:
> > > > > > > > On 12/9/25 13:48, Alexandre Belloni wrote:
> > > > > > > > > On 09/12/2025 12:37:12+0100, Louis Sautier wrote:
> > > > > > > > > > On 12/8/25 21:58, Alexandre Belloni wrote:
> > > > > > > > > > > Hello Louis,
> > > > > > > > > > >
> > > > > > > > > > > On 02/12/2025 21:17:31+0100, Louis Sautier wrote:
> > > > > > > > > > > > Hello,
> > > > > > > > > > > >
> > > > > > > > > > > > I'm running into a bug when loading the dw-i3c-mast=
er module on kernel 6.18
> > > > > > > > > > > > on one specific server. I suspect it has to do with=
 the large number of
> > > > > > > > > > > > CPUs=A0on the machine=A0(768 threads, from 2 AMD EP=
YC 9965 processors) but I am
> > > > > > > > > > > > not sure.
> > > > > > > > > > > >
> > > > > > > > > > > > The system is on Ubuntu 25.10 and a 6.18 kernel wit=
h https://gist.githubusercontent.com/sbraz/a6f37fafbcf9354bbe4eace9e9eb48cb=
/raw/115da594dc9d7ea99b06754847571e6fd76d9da5/config
> > > > > > > > > > > > (basically Ubuntu's).
> > > > > > > > > > > Just to be sure, does this also happen with v6.17?
> > > > > > > > > > >
> > > > > > > > > > > The only change is the shutdown handling so I would g=
uess yes.
> > > > > > > > > > >
> > > > > > > > > > Hello,
> > > > > > > > > >
> > > > > > > > > > It does happen with 6.17. I initially discovered this w=
hile running Ubuntu
> > > > > > > > > > 25.10's stock kernel (6.17.0).
> > > > > > > > > >
> > > > > > > > > > > What is the behavior when you build the dw-i3c-master=
 as a static driver?
> > > > > > > > > > I'll try CONFIG_DW_I3C_MASTER=3Dy and report back.
> > > > > > > > > >
> > > > > > > > > > Someone also suggested (they didn't reply to the list t=
hough) that I add a
> > > > > > > > > > printk to see what the value of maxdevs is. I'll provid=
e the log as soon as
> > > > > > > > > > I have rebuilt with:
> > > > > > > > > >
> > > > > > > > > > --- linux-6.18.orig/drivers/i3c/master/dw-i3c-master.c	=
2025-11-30 22:42:10.000000000 +0000
> > > > > > > > > > +++ linux-6.18/drivers/i3c/master/dw-i3c-master.c	2025-=
12-08 18:17:33.151567225 +0000
> > > > > > > > > > @@ -1588,6 +1588,7 @@
> > > > > > > > > >      	ret =3D readl(master->regs + DEVICE_ADDR_TABLE_PO=
INTER);
> > > > > > > > > >      	master->datstartaddr =3D ret;
> > > > > > > > > >      	master->maxdevs =3D ret >> 16;
> > > > > > > > > > +	printk("maxdevs: %d\n",  master->maxdevs);
> > > > > > > > > >      	master->free_pos =3D GENMASK(master->maxdevs - 1,=
 0);
> > > > > > > > > >      	master->quirks =3D (unsigned long)device_get_matc=
h_data(&pdev->dev);
> > > > > > > > > >
> > > > > > > > > Yes, that was going to be my suggestion.
> > > > > > > > >
> > > > > > > > I haven't tried with the driver built-in yet. This is what =
the printk shows:
> > > > > > > > dw-i3c-master AMDI0015:00: probe with driver dw-i3c-master =
failed with error
> > > > > > > > -110
> > > > > > > > maxdevs: 65535
> > > > > > > Maybe ret is bigger 0x8000_0000, and ret is sign int. so >>16=
 because -1.
> > > > > > >
> > > > > > > unsigned int val =3D readl(master->regs + DEVICE_ADDR_TABLE_P=
OINTER);
> > > > > > >
> > > > > > > master->maxdevs =3D val >> 16;
> > > > > > >
> > > > > > > Frank
> > > > > > I tried this and CONFIG_DW_I3C_MASTER=3Dy:
> > > > > >
> > > > > > --- linux-6.18.orig/drivers/i3c/master/dw-i3c-master.c 2025-11-=
30
> > > > > > 22:42:10.000000000 +0000
> > > > > > +++ linux-6.18/drivers/i3c/master/dw-i3c-master.c=A0 =A0 =A0 =
=A02025-12-09
> > > > > > 19:21:52.735366616 +0000
> > > > > > @@ -1585,9 +1585,10 @@
> > > > > >   =A0 =A0 =A0 =A0 ret =3D readl(master->regs + DATA_BUFFER_STAT=
US_LEVEL);
> > > > > >   =A0 =A0 =A0 =A0 master->caps.datafifodepth =3D DATA_BUFFER_ST=
ATUS_LEVEL_TX(ret);
> > > > > >
> > > > > > -=A0 =A0 =A0 =A0ret =3D readl(master->regs + DEVICE_ADDR_TABLE_=
POINTER);
> > > > > > -=A0 =A0 =A0 =A0master->datstartaddr =3D ret;
> > > > > > -=A0 =A0 =A0 =A0master->maxdevs =3D ret >> 16;
> > > > > > +=A0 =A0 =A0 =A0unsigned int val =3D readl(master->regs + DEVIC=
E_ADDR_TABLE_POINTER);
> > > > > > +=A0 =A0 =A0 =A0master->datstartaddr =3D val;
> > > > > > +=A0 =A0 =A0 =A0master->maxdevs =3D val >> 16;
> > > > > > +=A0 =A0 =A0 =A0printk("maxdevs (unsigned): %d\n",=A0 master->m=
axdevs);
> > > > > >   =A0 =A0 =A0 =A0 master->free_pos =3D GENMASK(master->maxdevs =
- 1, 0);
> > > > > >
> > > > > >   =A0 =A0 =A0 =A0 master->quirks =3D (unsigned long)device_get_=
match_data(&pdev->dev);
> > > > > >
> > > > > > And I get this log, so no change, really. I assume there's only=
 one
> > > > > > "maxdevs" log because there is only one attempt to load the bui=
lt-in driver?
> > > > > It may have dependence missed at drivers. such as clock. when bui=
lt-in,
> > > > > this driver probe first before clock ready.
> > > > >
> > > > > If build as module, other driver help enable this clock. So it ca=
n get
> > > > > correct value.
> > > > >
> > > > > Frank
> > > > My bad, I checked yesterday's entire log again and actually, there =
are still
> > > > 4 maxdevs printk logs:
> > > >
> > > > Built-in driver:
> > > >
> > > > # journalctl -b -2 --grep "maxdevs|UBSAN" -o short-monotonic
> > > > [=A0 =A023.162996] ns31482903 kernel: maxdevs (unsigned): 65535
> > > Look this instance miss config some resource, like clks. So clock have
> > > not enable, all register return 0xFFFFFFFF.
> > >
> > > Frank
> >
> > Can you help me understand why this happens and how to fix this? Could =
this
> > be a hardware problem?
> >
> > Should I open a downstream Ubuntu bug report, would that be helpful?
> =

> It may help, or report bug to hardware vendor. Or look for recently
> contributor who may provide help.
> =

> git log drivers/i3c/master/dw-i3c-master.c
> =


[Cc Shyam Sundar S K who added the AMD support]

Shyam, I hit the similar issue as Louis reported here. Would you help us
on what may cause the DEVICE_ADDR_TABLE_POINTER register returns
0xFFFFFFFF? Thanks!

> =

> Frank
> =

> >
> > >
> > > > [=A0 =A023.163008] ns31482903 kernel: UBSAN: shift-out-of-bounds in
> > > > drivers/i3c/master/dw-i3c-master.c:1592:21
> > > > [=A0 =A023.166508] ns31482903 kernel: maxdevs (unsigned): 65535
> > > > [=A0 =A023.166568] ns31482903 kernel: maxdevs (unsigned): 11
> > > > [=A0 =A023.166576] ns31482903 kernel: UBSAN: shift-out-of-bounds in
> > > > drivers/i3c/master/dw-i3c-master.c:885:12
> > > > [=A0 =A023.166748] ns31482903 kernel: maxdevs (unsigned): 11
> > > >
> > > >
> > > > I rebuilt with CONFIG_DW_I3C_MASTER=3Dm and I get the same logs alt=
hough the
> > > > timing differs a little:
> > > >
> > > > # journalctl -b -1 --grep "maxdevs|UBSAN" -o short-monotonic
> > > > [=A0 =A014.507929] ns31482903 kernel: maxdevs (unsigned): 65535
> > > > [=A0 =A014.507957] ns31482903 kernel: UBSAN: shift-out-of-bounds in
> > > > drivers/i3c/master/dw-i3c-master.c:1592:21
> > > > [=A0 =A016.683035] ns31482903 kernel: maxdevs (unsigned): 65535
> > > > [=A0 =A018.872323] ns31482903 kernel: maxdevs (unsigned): 11
> > > > [=A0 =A018.872362] ns31482903 kernel: UBSAN: shift-out-of-bounds in
> > > > drivers/i3c/master/dw-i3c-master.c:885:12
> > > > [=A0 =A018.882020] ns31482903 kernel: maxdevs (unsigned): 11
> > > >
> > > > Did I miss something with the unsigned patch?
> > > > > > maxdevs (unsigned): 65535
> > > > > > ------------[ cut here ]------------
> > > > > > UBSAN: shift-out-of-bounds in drivers/i3c/master/dw-i3c-master.=
c:1592:21
> > > > > > usb 1-1: new high-speed USB device number 2 using xhci_hcd
> > > > > > shift exponent 18446744073709486145 is too large for 64-bit typ=
e 'long
> > > > > > unsigned int'
> > > > > > CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.18.0 #4
> > > > > > PREEMPT(voluntary)
> > > > > > Hardware name: Giga Computing MZ73-LM2-000/MZ73-LM2-000, BIOS R=
23_F43
> > > > > > 11/28/2025
> > > > > > Call Trace:
> > > > > >   =A0<TASK>
> > > > > >   =A0dump_stack_lvl+0x5f/0x90
> > > > > >   =A0dump_stack+0x10/0x18
> > > > > >   =A0ubsan_epilogue+0x9/0x39
> > > > > >   =A0__ubsan_handle_shift_out_of_bounds.cold+0xdd/0x1c9
> > > > > >   =A0dw_i3c_common_probe.cold+0x16/0x1b
> > > > > >   =A0dw_i3c_probe+0x30/0x50
> > > > > >   =A0platform_probe+0x42/0xc0
> > > > > >   =A0? driver_sysfs_add+0x63/0xd0
> > > > > >   =A0really_probe+0xf9/0x370
> > > > > >   =A0? pm_runtime_barrier+0x56/0xa0
> > > > > >   =A0__driver_probe_device+0x8b/0x160
> > > > > >   =A0driver_probe_device+0x24/0xd0
> > > > > >   =A0? __pfx___driver_attach+0x10/0x10
> > > > > >   =A0__driver_attach+0xef/0x220
> > > > > >   =A0? __pfx_dw_i3c_driver_init+0x10/0x10
> > > > > >   =A0bus_for_each_dev+0x8a/0xe0
> > > > > >   =A0driver_attach+0x1e/0x30
> > > > > >   =A0bus_add_driver+0x13e/0x230
> > > > > >   =A0? __pfx_dw_i3c_driver_init+0x10/0x10
> > > > > >   =A0driver_register+0x75/0xf0
> > > > > >   =A0__platform_driver_register+0x1e/0x30
> > > > > >   =A0dw_i3c_driver_init+0x17/0x30
> > > > > >   =A0do_one_initcall+0x59/0x330
> > > > > >   =A0kernel_init_freeable+0x2bd/0x340
> > > > > >   =A0? __pfx_kernel_init+0x10/0x10
> > > > > >   =A0kernel_init+0x1b/0x160
> > > > > >   =A0? __pfx_kernel_init+0x10/0x10
> > > > > >   =A0ret_from_fork+0x202/0x230
> > > > > >   =A0? __pfx_kernel_init+0x10/0x10
> > > > > >   =A0ret_from_fork_asm+0x1a/0x30
> > > > > >   =A0</TASK>
> > > > > > ---[ end trace ]---
> > > > > >
> > > > > >
> > > > > > --
> > > > > > linux-i3c mailing list
> > > > > > linux-i3c@lists.infradead.org
> > > > > > http://lists.infradead.org/mailman/listinfo/linux-i3c
> > > >
> > > >
> > > > --
> > > > linux-i3c mailing list
> > > > linux-i3c@lists.infradead.org
> > > > http://lists.infradead.org/mailman/listinfo/linux-i3c
> >
> >
> >
> > --
> > linux-i3c mailing list
> > linux-i3c@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-i3c
> =

> -- =

> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
