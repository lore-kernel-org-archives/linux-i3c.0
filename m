Return-Path: <SRS0=peef=MW=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D2E7C19F37
	for <linux-i3c@archiver.kernel.org>; Fri, 30 Jul 2021 19:40:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA93660F01
	for <linux-i3c@archiver.kernel.org>; Fri, 30 Jul 2021 19:40:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EA93660F01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZLnkdJm3t5hh/Y2sb4hU8WFvLmG2U4CF52wjfVd+S2I=; b=2n+kfKlcYxuJdF
	rty2zE/PjDYp4FjzpRNjSNPAXH1rmb/sKpnqLkwFUkNsq0fMX6xpTtnKcE9cg6iCHpZ+tR4xf9WSK
	xS/Xi47nKUfhryySsrxNXiZIfhyZWjQExY8KdHy1Iq+WFYTnA4Je65ju4Pq6BMHvC2EM7IU8gfzW8
	+6mB6MlxKJltIlmA4AOrQG+4APlCasGata9df4UitjuonkouQBWuBa1iprYj02VcFsElGPKKyE7Rb
	qNzVZzNf6NDDMbEGP3idRfKMOs9UxQkkLWpT3yErERnABmPt9KLkbm4RBNj3V98UrSfxGvBEvp3IQ
	8UQyY76joLDr2vn+J6Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9YMr-00A8OL-ED; Fri, 30 Jul 2021 19:40:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0ie9-00B5hG-6J; Tue, 06 Jul 2021 10:49:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6A11E6113A;
 Tue,  6 Jul 2021 10:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625568584;
 bh=QakVDMCwjBt5tusk+4GnLyspONeoeI28ccgP32Kkl6Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XLBiGX+c23s7Hd4vl9BpJNl+HHlvfzXaPVrxwmNjZbEn3M/O+E2BBk+XwQO60Fx+h
 AGg3I9ZxntsVRKX9hKl3+llY2WPdIEmlFNvB047fUI1IK4JVxOEF4dF9gqmuEuGb+m
 YdZOAhq21BupqowkOvwPwtMAMl0LvNKX33WcPSHpRbL6TIhRCmu9lOkum3OF5ngTKK
 9dqdoQWVX++wNeQLXO8JH9t41sX/NUE8HwM2MQno+iFQNi2V60qlJhNUGu7azofLM8
 OVyn3cBQUkqlxFBpjSV6EjXVn4VMkYYJLp789FfNvMpAjh38hTrSLglIFeyVVqTb4s
 nT0/m/zLxXrsA==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1m0idy-0003U8-8E; Tue, 06 Jul 2021 12:49:34 +0200
Date: Tue, 6 Jul 2021 12:49:34 +0200
From: Johan Hovold <johan@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel@pengutronix.de,
 linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Geoff Levand <geoff@infradead.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Len Brown <lenb@kernel.org>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Ben Widawsky <ben.widawsky@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Dave Jiang <dave.jiang@intel.com>, Vinod Koul <vkoul@kernel.org>,
 Stefan Richter <stefanr@s5r6.in-berlin.de>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Wu Hao <hao.wu@intel.com>, Tom Rix <trix@redhat.com>,
 Moritz Fischer <mdf@kernel.org>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Wolfram Sang <wsa@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Samuel Iglesias Gonsalvez <siglesias@igalia.com>,
 Jens Taprogge <jens.taprogge@taprogge.org>,
 Johannes Thumshirn <morbidrsa@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxim Levitsky <maximlevitsky@gmail.com>,
 Alex Dubov <oakad@yahoo.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Lee Jones <lee.jones@linaro.org>, Tomas Winkler <tomas.winkler@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Jon Mason <jdmason@kudzu.us>, Allen Hubbe <allenbh@gmail.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Maximilian Luz <luzmaximilian@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Gross <mgross@linux.intel.com>,
 Matt Porter <mporter@kernel.crashing.org>,
 Alexandre Bounine <alex.bou9@gmail.com>, Ohad Ben-Cohen <ohad@wizery.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Thorsten Scherer <t.scherer@eckelmann.de>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Andy Gross <agross@kernel.org>, Mark Brown <broonie@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Michael Buesch <m@bues.ch>,
 Sven Van Asbroeck <TheSven73@gmail.com>, Alex Elder <elder@kernel.org>,
 Andreas Noever <andreas.noever@gmail.com>,
 Michael Jamet <michael.jamet@intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Yehezkel Bernat <YehezkelShB@gmail.com>,
 Rob Herring <robh@kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Martyn Welch <martyn@welchs.me.uk>,
 Manohar Vanga <manohar.vanga@gmail.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Johannes Berg <johannes@sipsolutions.net>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Marc Zyngier <maz@kernel.org>, Tyrel Datwyler <tyreld@linux.ibm.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Samuel Holland <samuel@sholland.org>,
 Qinglang Miao <miaoqinglang@huawei.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Joey Pabalan <jpabalanb@gmail.com>,
 Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>, Frank Li <lznuaa@gmail.com>,
 Mike Christie <michael.christie@oracle.com>,
 Bodo Stroesser <bostroesser@gmail.com>,
 Hannes Reinecke <hare@suse.de>, David Woodhouse <dwmw@amazon.co.uk>,
 SeongJae Park <sjpark@amazon.de>, Julien Grall <jgrall@amazon.com>,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-acpi@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-cxl@vger.kernel.org,
 nvdimm@lists.linux.dev, dmaengine@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net, linux-fpga@vger.kernel.org,
 linux-input@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-i3c@lists.infradead.org,
 industrypack-devel@lists.sourceforge.net,
 linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
 netdev@vger.kernel.org, linux-ntb@googlegroups.com,
 linux-pci@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-scsi@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-staging@lists.linux.dev,
 greybus-dev@lists.linaro.org, target-devel@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-serial@vger.kernel.org,
 virtualization@lists.linux-foundation.org, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH] bus: Make remove callback return void
Message-ID: <YOQ1PnNT26VsRfLf@hovoldconsulting.com>
References: <20210706095037.1425211-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210706095037.1425211-1-u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_034945_311543_475BC1C6 
X-CRM114-Status: GOOD (  19.13  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKdWwgMDYsIDIwMjEgYXQgMTE6NTA6MzdBTSArMDIwMCwgVXdlIEtsZWluZS1Lw7Zu
aWcgd3JvdGU6Cj4gVGhlIGRyaXZlciBjb3JlIGlnbm9yZXMgdGhlIHJldHVybiB2YWx1ZSBvZiB0
aGlzIGNhbGxiYWNrIGJlY2F1c2UgdGhlcmUKPiBpcyBvbmx5IGxpdHRsZSBpdCBjYW4gZG8gd2hl
biBhIGRldmljZSBkaXNhcHBlYXJzLgo+IAo+IFRoaXMgaXMgdGhlIGZpbmFsIGJpdCBvZiBhIGxv
bmcgbGFzdGluZyBjbGVhbnVwIHF1ZXN0IHdoZXJlIHNldmVyYWwKPiBidXNlcyB3ZXJlIGNvbnZl
cnRlZCB0byBhbHNvIHJldHVybiB2b2lkIGZyb20gdGhlaXIgcmVtb3ZlIGNhbGxiYWNrLgo+IEFk
ZGl0aW9uYWxseSBzb21lIHJlc291cmNlIGxlYWtzIHdlcmUgZml4ZWQgdGhhdCB3ZXJlIGNhdXNl
ZCBieSBkcml2ZXJzCj4gcmV0dXJuaW5nIGFuIGVycm9yIGNvZGUgaW4gdGhlIGV4cGVjdGF0aW9u
IHRoYXQgdGhlIGRyaXZlciB3b24ndCBnbwo+IGF3YXkuCj4gCj4gV2l0aCBzdHJ1Y3QgYnVzX3R5
cGU6OnJlbW92ZSByZXR1cm5pbmcgdm9pZCBpdCdzIHByZXZlbnRlZCB0aGF0IG5ld2x5Cj4gaW1w
bGVtZW50ZWQgYnVzZXMgcmV0dXJuIGFuIGlnbm9yZWQgZXJyb3IgY29kZSBhbmQgc28gZG9uJ3Qg
YW50aWNpcGF0ZQo+IHdyb25nIGV4cGVjdGF0aW9ucyBmb3IgZHJpdmVyIGF1dGhvcnMuCj4gCj4g
U2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRy
b25peC5kZT4KCj4gIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2dicGh5LmMgICAgICAgICAgIHwg
NCArLS0tCgo+ICBkcml2ZXJzL3VzYi9zZXJpYWwvYnVzLmMgICAgICAgICAgICAgICAgICB8IDQg
Ky0tLQoKPiAgaW5jbHVkZS9saW51eC9kZXZpY2UvYnVzLmggICAgICAgICAgICAgICAgfCAyICst
CgpBY2tlZC1ieTogSm9oYW4gSG92b2xkIDxqb2hhbkBrZXJuZWwub3JnPgoKLS0gCmxpbnV4LWkz
YyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
