Return-Path: <SRS0=peef=MW=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81C8EC43214
	for <linux-i3c@archiver.kernel.org>; Fri, 30 Jul 2021 19:40:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5245860F01
	for <linux-i3c@archiver.kernel.org>; Fri, 30 Jul 2021 19:40:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5245860F01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v9TUpJRdQywUZvNb2TJvzfI17/oHsjj7PDDEE3qzCPc=; b=i/QKG8Jp/zAanbpF4BCsUOoOfx
	awnurINfQFFyIcdRCOQt/CE09sEkbkfqXsnRULzoV2WCUjzaO42655GV8T7sQ1BA6wAoMY5qxGf/C
	XYEdWek9Jfz67HtOFqGFZsp+61GYi2SNheWlgbYn11SUEw7MDG1lG1qpk5pAdldRHLEOpBRtz3L89
	Fm8Pu/ie+84FW3AfFXqIt7n67gnYM0Lqrl6mFhCCX2aG/qOiusGzGaSi7ZiQsJz+waznFMH1/fURs
	0oyDu9rcdxT+N4wYp/x/wV/Dndh2o6NVwi3rv8CTP58dkDbR/N/VB3MsI+xwkpY8NhMpVj3O9MtvG
	y+QFOojQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9YN4-00A8hS-K5; Fri, 30 Jul 2021 19:40:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5wJO-00DrS5-IS; Tue, 20 Jul 2021 20:25:56 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 56E9760BBB;
 Tue, 20 Jul 2021 20:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626812753;
 bh=l5xDkWzCR3urdpTjqmcMUpN6o09NewdpR8Jc68Liw0U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VBe4HBaGXZMGD0ZdODVsdKbrJ8SORqt3SuXaX37yK3AHshxYDbXGRQXluA6mx7jW3
 pTBW48mt4sopqYvfTU+bZO/p3bIz4jENtO9uPBTi0SuDufiC+I7vrG7Ce/qo8tgdbL
 Vv6L36N+yjTOuiDCZaFxIklqrdMuw+BZDERVBNSuKxTccmMm+0DpHaq2hVxlihY0dP
 QgyoMfzVLFJnhH8igTsTFxC4OBQeb5IzLYxfferXAP0fHcTPB3F6Yr+8KbAgAJLPf2
 a0unVf6CWv1kUs6z+N9Cr2G8gL44dgqsGt8dlJjFYXR6m7PEcLW13zfgVQ2ipy0CDg
 OpoYDDMZUiahA==
Date: Tue, 20 Jul 2021 22:25:42 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel@pengutronix.de,
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
 Finn Thain <fthain@linux-m68k.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Frank Li <lznuaa@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Geoff Levand <geoff@infradead.org>, Haiyang Zhang <haiyangz@microsoft.com>,
 Hannes Reinecke <hare@suse.de>, Hans de Goede <hdegoede@redhat.com>,
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
 Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
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
 Wu Hao <hao.wu@intel.com>, Yehezkel Bernat <YehezkelShB@gmail.com>,
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
 virtualization@lists.linux-foundation.org,
 xen-devel@lists.xenproject.org, Johannes Thumshirn <jth@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v4 5/5] bus: Make remove callback return void
Message-ID: <YPcxRgfZymtjJ4ih@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 kernel@pengutronix.de,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre Bounine <alex.bou9@gmail.com>,
 Alex Dubov <oakad@yahoo.com>, Alex Elder <elder@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Allen Hubbe <allenbh@gmail.com>,
 Andreas Noever <andreas.noever@gmail.com>,
 Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Ben Widawsky <ben.widawsky@intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Bodo Stroesser <bostroesser@gmail.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Chen-Yu Tsai <wens@csie.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Dave Jiang <dave.jiang@intel.com>,
 "David S. Miller" <davem@davemloft.net>,
 David Woodhouse <dwmw@amazon.co.uk>,
 Dexuan Cui <decui@microsoft.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Finn Thain <fthain@linux-m68k.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Frank Li <lznuaa@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Geoff Levand <geoff@infradead.org>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Hannes Reinecke <hare@suse.de>, Hans de Goede <hdegoede@redhat.com>,
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
 Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
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
 Sven Van Asbroeck <TheSven73@gmail.com>,
 Takashi Iwai <tiwai@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thorsten Scherer <t.scherer@eckelmann.de>,
 Tomas Winkler <tomas.winkler@intel.com>, Tom Rix <trix@redhat.com>,
 Tyrel Datwyler <tyreld@linux.ibm.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Vinod Koul <vkoul@kernel.org>,
 Vishal Verma <vishal.l.verma@intel.com>,
 Wei Liu <wei.liu@kernel.org>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Wu Hao <hao.wu@intel.com>, Yehezkel Bernat <YehezkelShB@gmail.com>,
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
 virtualization@lists.linux-foundation.org,
 xen-devel@lists.xenproject.org, Johannes Thumshirn <jth@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>
References: <20210713193522.1770306-1-u.kleine-koenig@pengutronix.de>
 <20210713193522.1770306-6-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20210713193522.1770306-6-u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210720_132554_696610_B97D32A3 
X-CRM114-Status: GOOD (  18.25  )
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
Content-Type: multipart/mixed; boundary="===============4534360653120005248=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============4534360653120005248==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o9Bjd73EPYzHYRI8"
Content-Disposition: inline


--o9Bjd73EPYzHYRI8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 13, 2021 at 09:35:22PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> The driver core ignores the return value of this callback because there
> is only little it can do when a device disappears.
>=20
> This is the final bit of a long lasting cleanup quest where several
> buses were converted to also return void from their remove callback.
> Additionally some resource leaks were fixed that were caused by drivers
> returning an error code in the expectation that the driver won't go
> away.
>=20
> With struct bus_type::remove returning void it's prevented that newly
> implemented buses return an ignored error code and so don't anticipate
> wrong expectations for driver authors.
>=20
> Acked-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk> (For ARM, Am=
ba and related parts)
> Acked-by: Mark Brown <broonie@kernel.org>
> Acked-by: Chen-Yu Tsai <wens@csie.org> (for sunxi-rsb)
> Acked-by: Pali Roh=C3=A1r <pali@kernel.org>
> Acked-by: Mauro Carvalho Chehab <mchehab@kernel.org> (for media)
> Acked-by: Hans de Goede <hdegoede@redhat.com> (For drivers/platform)
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Acked-By: Vinod Koul <vkoul@kernel.org>
> Acked-by: Juergen Gross <jgross@suse.com> (For xen)
> Acked-by: Lee Jones <lee.jones@linaro.org> (For mfd)
> Acked-by: Johannes Thumshirn <jth@kernel.org> (For mcb)
> Acked-by: Johan Hovold <johan@kernel.org>
> Acked-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org> (For slimb=
us)
> Acked-by: Kirti Wankhede <kwankhede@nvidia.com> (For vfio)
> Acked-by: Maximilian Luz <luzmaximilian@gmail.com>
> Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com> (For ulpi and=
 typec)
> Acked-by: Samuel Iglesias Gons=C3=A1lvez <siglesias@igalia.com> (For ipac=
k)
> Reviewed-by: Tom Rix <trix@redhat.com> (For fpga)
> Acked-by: Geoff Levand <geoff@infradead.org> (For ps3)
> Acked-by: Yehezkel Bernat <YehezkelShB@gmail.com> (For thunderbolt)
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Acked-by: Alexander Shishkin <alexander.shishkin@linux.intel.com> (For in=
tel_th)
> Acked-by: Dominik Brodowski <linux@dominikbrodowski.net> (For pcmcia)
> Reviewed-by: Cornelia Huck <cohuck@redhat.com> (For drivers/s390 and driv=
ers/vfio)
> Acked-by: Rafael J. Wysocki <rafael@kernel.org> (For ACPI)
> Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org> (rpmsg and apr)
> Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com> (For =
intel-ish-hid)
> Acked-by: Dan Williams <dan.j.williams@intel.com> (For CXL, DAX, and NVDI=
MM)
> Acked-by: William Breathitt Gray <vilhelm.gray@gmail.com> (For isa)
> Acked-by: Stefan Richter <stefanr@s5r6.in-berlin.de> (For firewire)
> Acked-by: Benjamin Tissoires <benjamin.tissoires@redhat.com> (For hid)
> Acked-by: Thorsten Scherer <t.scherer@eckelmann.de> (For siox)
> Acked-by: Sven Van Asbroeck <TheSven73@gmail.com> (For anybuss)
> Acked-by: Ulf Hansson <ulf.hansson@linaro.org> (For MMC)
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Acked-by: Wolfram Sang <wsa@kernel.org> # for I2C

Thanks, Uwe!


--o9Bjd73EPYzHYRI8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmD3MUIACgkQFA3kzBSg
KbYzoQ//fHsReQ7gV79Uj6MfHENOZAAxSFMd8yIWNeX0Ug8crVQ2fzQgvlotUS1y
62KPO9MFbi37+nfCWwl5uNEiDPwYjpB+jM/jfqJ849ngfiIQyUqCK7qr5b1FIWkp
TuEV1Rx/wlpmxMEjKFAuo+/5OkXVwvpxQGiqBemOeTmOKjqITCpXEBkYqDqqI/MY
lnzwpE8R30sf8IH/aThtb9dZBz+8y2mry6nVtSbMMmZ0VAYgwEPmuPLfa9CIhaCJ
Oqe6Uf+sJs/emp0nfyZ5IDXvO8vE5kgPoy0l/smHEtejHLUkHBKf4MusKOzDdbax
Uk48fnhKgbhxbVN0guT7IzWvRG+80hU4Ns9YPjmHYNXr4Wg03//hoAv4otMAAqXU
Tjk9sEMBGHasqHZ0e1j3xTRhxQOwTJjzwVNhkrTX4HIZ/k0gXQK0ojBXxGvWeds2
yQ7FUakyf1LQBmrLwssWSXbyp+W6tVodIUmnebSK1IpVd7YK4NZPf796yD44Ckzd
XM4O5xTksxr5X+cEsNNLxhXFMohR/BOpLCj4R1+vpRNyMTHLIqfsI7GL+TJh+Mri
+kuq0TQgbTRlrIw/jfTcenYmXhQte4oeFQa3uVwGY2b+5kB/zRMTKThU0e2Vpd+8
Kifz6u9a8LEGAMrLNXVd1B/uHQSOMYeeIzsuZ+BHqVxDsyNvJds=
=zPVh
-----END PGP SIGNATURE-----

--o9Bjd73EPYzHYRI8--


--===============4534360653120005248==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============4534360653120005248==--

