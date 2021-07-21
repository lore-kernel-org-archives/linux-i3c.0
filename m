Return-Path: <SRS0=peef=MW=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC84BC25B12
	for <linux-i3c@archiver.kernel.org>; Fri, 30 Jul 2021 19:40:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7363660F26
	for <linux-i3c@archiver.kernel.org>; Fri, 30 Jul 2021 19:40:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7363660F26
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dLu5jUG9Xndf/JRXUjxVS+HDMWcAUfGsCOJ1EjgoNsA=; b=H7/x9MXq3swm26
	0xKK79WcP7WWl8hxTqZ863r9InsfBkHJZ8chQI7LM/2QgnuBaKyojwYfuhKmSzAHONXZgctUNjV1j
	p73vWme9Q1JQv1yEacSTNCTGqKrdiwHWWmNBWiDsvc7Waq7V0dIS2e/S44IlBQUtR1o6jZ1m29v5/
	/7DIgyKaQSxcOq/LzVSkteUp/7b3AsIfYd6dInML6mqmNmvnG2nPOiZ1HoMoyubSb1KaJ+HR96UL/
	qJOzRjqt36vCp8ZzlA389DCL7lau9dFu1jEGDQMxExp1pCbQrGk1QUbXeww+FE9sX0X/qYNnnmvfy
	y9V+2wOJUmAfALfPR0qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9YN4-00A8iG-TN; Fri, 30 Jul 2021 19:40:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m69Af-00FBPy-Iu; Wed, 21 Jul 2021 10:09:47 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0BAC960FE7;
 Wed, 21 Jul 2021 10:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1626862185;
 bh=AkCAzoeKK4dm3J0IYr3eqKdLUog3VqnY+aXSEhth1R0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c1tD+1+8N7ya+U+R4FoCk5r1AY0+njsEQDtKrpnu5fKg2Nsyw8ad0RAbDRa8LMlYN
 kIGK/SB0S4EC/Bt9LoElGD8+QX12QgKfoR1683w3NYrmezl45haNH7nWDa/e7NVumf
 ZIzS+wQ0FwO2WzFS4jJEXOjj+Re557OYzd+zf9Xc=
Date: Wed, 21 Jul 2021 12:09:41 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: kernel@pengutronix.de,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre Bounine <alex.bou9@gmail.com>,
 Alex Dubov <oakad@yahoo.com>, Alex Elder <elder@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Allen Hubbe <allenbh@gmail.com>, Andreas Noever <andreas.noever@gmail.com>,
 Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Ben Widawsky <ben.widawsky@intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Bodo Stroesser <bostroesser@gmail.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Chen-Yu Tsai <wens@csie.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Dan Williams <dan.j.williams@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 "David S. Miller" <davem@davemloft.net>,
 David Woodhouse <dwmw@amazon.co.uk>, Dexuan Cui <decui@microsoft.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Eric Farman <farman@linux.ibm.com>, Finn Thain <fthain@linux-m68k.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Frank Li <lznuaa@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Geoff Levand <geoff@infradead.org>, Haiyang Zhang <haiyangz@microsoft.com>,
 Halil Pasic <pasic@linux.ibm.com>, Hannes Reinecke <hare@suse.de>,
 Hans de Goede <hdegoede@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
 Ira Weiny <ira.weiny@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Jaroslav Kysela <perex@perex.cz>, Jason Wang <jasowang@redhat.com>,
 Jens Taprogge <jens.taprogge@taprogge.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jiri Kosina <jikos@kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
 Joey Pabalan <jpabalanb@gmail.com>, Johan Hovold <johan@kernel.org>,
 Johannes Berg <johannes@sipsolutions.net>,
 Johannes Thumshirn <morbidrsa@gmail.com>,
 Jon Mason <jdmason@kudzu.us>, Juergen Gross <jgross@suse.com>,
 Julien Grall <jgrall@amazon.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Lee Jones <lee.jones@linaro.org>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Manohar Vanga <manohar.vanga@gmail.com>,
 Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
 Mark Gross <mgross@linux.intel.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Martyn Welch <martyn@welchs.me.uk>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Matt Porter <mporter@kernel.crashing.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Maximilian Luz <luzmaximilian@gmail.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>,
 Michael Buesch <m@bues.ch>, Michael Ellerman <mpe@ellerman.id.au>,
 Michael Jamet <michael.jamet@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Mike Christie <michael.christie@oracle.com>,
 Moritz Fischer <mdf@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Rich Felker <dalias@libc.org>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Samuel Holland <samuel@sholland.org>,
 Samuel Iglesias Gonsalvez <siglesias@igalia.com>,
 SeongJae Park <sjpark@amazon.de>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stefan Richter <stefanr@s5r6.in-berlin.de>,
 Stephen Boyd <sboyd@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Sven Van Asbroeck <TheSven73@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thorsten Scherer <t.scherer@eckelmann.de>,
 Tomas Winkler <tomas.winkler@intel.com>, Tom Rix <trix@redhat.com>,
 Tyrel Datwyler <tyreld@linux.ibm.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>, Vinod Koul <vkoul@kernel.org>,
 Vishal Verma <vishal.l.verma@intel.com>, Wei Liu <wei.liu@kernel.org>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Wolfram Sang <wsa@kernel.org>, Wu Hao <hao.wu@intel.com>,
 Yehezkel Bernat <YehezkelShB@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 YueHaibing <yuehaibing@huawei.com>, Yufen Yu <yuyufen@huawei.com>,
 alsa-devel@alsa-project.org, dmaengine@vger.kernel.org,
 greybus-dev@lists.linaro.org,
 industrypack-devel@lists.sourceforge.net, kvm@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-cxl@vger.kernel.org, linux-fpga@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-i3c@lists.infradead.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-media@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-ntb@googlegroups.com,
 linux-parisc@vger.kernel.org, linux-pci@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-remoteproc@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-sunxi@lists.linux.dev, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 nvdimm@lists.linux.dev, platform-driver-x86@vger.kernel.org,
 sparclinux@vger.kernel.org, target-devel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 0/5] bus: Make remove callback return void
Message-ID: <YPfyZen4Y0uDKqDT@kroah.com>
References: <20210713193522.1770306-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210713193522.1770306-1-u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_030945_717723_D432C307 
X-CRM114-Status: GOOD (  21.09  )
X-Mailman-Approved-At: Fri, 30 Jul 2021 12:40:21 -0700
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

On Tue, Jul 13, 2021 at 09:35:17PM +0200, Uwe Kleine-K=F6nig wrote:
> Hello,
> =

> this is v4 of the final patch set for my effort to make struct
> bus_type::remove return void.
> =

> The first four patches contain cleanups that make some of these
> callbacks (more obviously) always return 0. They are acked by the
> respective maintainers. Bjorn Helgaas explicitly asked to include the
> pci patch (#1) into this series, so Greg taking this is fine. I assume
> the s390 people are fine with Greg taking patches #2 to #4, too, they
> didn't explicitly said so though.
> =

> The last patch actually changes the prototype and so touches quite some
> drivers and has the potential to conflict with future developments, so I
> consider it beneficial to put these patches into next soon. I expect
> that it will be Greg who takes the complete series, he already confirmed
> via irc (for v2) to look into this series.
> =

> The only change compared to v3 is in the fourth patch where I modified a
> few more drivers to fix build failures. Some of them were found by build
> bots (thanks!), some of them I found myself using a regular expression
> search. The newly modified files are:
> =

>  arch/sparc/kernel/vio.c
>  drivers/nubus/bus.c
>  drivers/sh/superhyway/superhyway.c
>  drivers/vlynq/vlynq.c
>  drivers/zorro/zorro-driver.c
>  sound/ac97/bus.c
> =

> Best regards
> Uwe

Now queued up.  I can go make a git tag that people can pull from after
0-day is finished testing this to verify all is good, if others need it.

thanks,

greg k-h

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
