Return-Path: <SRS0=peef=MW=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60A2CC43214
	for <linux-i3c@archiver.kernel.org>; Fri, 30 Jul 2021 19:40:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21B4760F46
	for <linux-i3c@archiver.kernel.org>; Fri, 30 Jul 2021 19:40:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 21B4760F46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YfKV2mDvkdT3jEGY7OezUEdTbCZMGIRVy+uXkTLTPhs=; b=An95/Qv9lVGIbl
	+jelJKBiYUniQ65qQo1IU84sCkdcNVA2booy73PMDnngorBiS+Bd4UoQ51ZBkmxuHBdiiAHUCSeUe
	0Ty24Isg0h3iAqYxvoogv4TXkqAqIN+hqhVvbDuhFhFF8VNp1armvTBRB9ELnMArM7ad0pxmRfc2W
	sCOZ/SQcXtAORWDKQ/e+9Ezmw/vpb4raK8ganxryh6/MMrAUJ5Pu9blz42V1ZhfREGVXv7NVmorym
	EH7f9APuXwexYC2hK+Hg9RF53ui4KOYGjLD3peec+/VjLyqQCA1dWIWLG6j5a1ZsoQknZv0+TEhuS
	kMdDX8sS4UCmqSthakUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9YMp-00A8Mk-Jv; Fri, 30 Jul 2021 19:40:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0iGw-00B1ny-SE; Tue, 06 Jul 2021 10:25:48 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1F9FB619A9;
 Tue,  6 Jul 2021 10:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625567145;
 bh=V+uGgWI7ODWDPnX93N2q4QxlyZDaMh1bjqAqdpBNoN4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=maDtNYbjZpDD0PKjc4+nM3Y213Akod8ccrNcZVsiy5KPtneyyahoRaDB5AbMrAwYJ
 m6oMoU+hcgZXNuCsoc9yJ2+bzIoCnRHsti/6uqBP8DKnPnXcD/khw96G8CUsBlPlvR
 uf0MJVwBY0fA5Npz0MHmvhwpdr+Wv2TOZMh4BI+fP5OWpWrOVsQ5Dquu1HsKCQm/Z3
 7bqMd9M3OziVf290y6vu/n9lxKpsWMkO6NowOo/L+CwTy3kWF456W471Gj/HhlY3go
 paE6+JOD9eP6KydGYz0nficgDNBo/ZvaGMWNwDkXP9s9hxxto+00KpCpg6+2NdC4+K
 HB6sMk/Pez8VQ==
Received: by pali.im (Postfix)
 id 93CEB6E9; Tue,  6 Jul 2021 12:25:42 +0200 (CEST)
Date: Tue, 6 Jul 2021 12:25:42 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
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
 Sven Van Asbroeck <TheSven73@gmail.com>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
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
Message-ID: <20210706102542.7lzvb6nm4ztmlarl@pali>
References: <20210706095037.1425211-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210706095037.1425211-1-u.kleine-koenig@pengutronix.de>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_032546_995568_E2185AF2 
X-CRM114-Status: GOOD (  26.86  )
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

T24gVHVlc2RheSAwNiBKdWx5IDIwMjEgMTE6NTA6MzcgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6
Cj4gVGhlIGRyaXZlciBjb3JlIGlnbm9yZXMgdGhlIHJldHVybiB2YWx1ZSBvZiB0aGlzIGNhbGxi
YWNrIGJlY2F1c2UgdGhlcmUKPiBpcyBvbmx5IGxpdHRsZSBpdCBjYW4gZG8gd2hlbiBhIGRldmlj
ZSBkaXNhcHBlYXJzLgo+IAo+IFRoaXMgaXMgdGhlIGZpbmFsIGJpdCBvZiBhIGxvbmcgbGFzdGlu
ZyBjbGVhbnVwIHF1ZXN0IHdoZXJlIHNldmVyYWwKPiBidXNlcyB3ZXJlIGNvbnZlcnRlZCB0byBh
bHNvIHJldHVybiB2b2lkIGZyb20gdGhlaXIgcmVtb3ZlIGNhbGxiYWNrLgo+IEFkZGl0aW9uYWxs
eSBzb21lIHJlc291cmNlIGxlYWtzIHdlcmUgZml4ZWQgdGhhdCB3ZXJlIGNhdXNlZCBieSBkcml2
ZXJzCj4gcmV0dXJuaW5nIGFuIGVycm9yIGNvZGUgaW4gdGhlIGV4cGVjdGF0aW9uIHRoYXQgdGhl
IGRyaXZlciB3b24ndCBnbwo+IGF3YXkuCj4gCj4gV2l0aCBzdHJ1Y3QgYnVzX3R5cGU6OnJlbW92
ZSByZXR1cm5pbmcgdm9pZCBpdCdzIHByZXZlbnRlZCB0aGF0IG5ld2x5Cj4gaW1wbGVtZW50ZWQg
YnVzZXMgcmV0dXJuIGFuIGlnbm9yZWQgZXJyb3IgY29kZSBhbmQgc28gZG9uJ3QgYW50aWNpcGF0
ZQo+IHdyb25nIGV4cGVjdGF0aW9ucyBmb3IgZHJpdmVyIGF1dGhvcnMuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4K
CkFja2VkLWJ5OiBQYWxpIFJvaMOhciA8cGFsaUBrZXJuZWwub3JnPgoKPiAtLS0KPiBIZWxsbywK
PiAKPiB0aGlzIHBhdGNoIGRlcGVuZHMgb24gIlBDSTogZW5kcG9pbnQ6IE1ha2Ugc3RydWN0IHBj
aV9lcGZfZHJpdmVyOjpyZW1vdmUKPiByZXR1cm4gdm9pZCIgdGhhdCBpcyBub3QgeWV0IGFwcGxp
ZWQsIHNlZQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyMTAyMjMwOTA3NTcuNTc2MDQt
MS11LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGUuCj4gCj4gSSB0ZXN0ZWQgaXQgdXNpbmcg
YWxsbW9kY29uZmlnIG9uIGFtZDY0IGFuZCBhcm0sIGJ1dCBJIHdvdWxkbid0IGJlCj4gc3VycHJp
c2VkIGlmIEkgc3RpbGwgbWlzc2VkIHRvIGNvbnZlcnQgYSBkcml2ZXIuIFNvIGl0IHdvdWxkIGJl
IGdyZWF0IHRvCj4gZ2V0IHRoaXMgaW50byBuZXh0IGVhcmx5IGFmdGVyIHRoZSBtZXJnZSB3aW5k
b3cgY2xvc2VzLgo+IAo+IEkgc2VuZCB0aGlzIG1haWwgdG8gYWxsIHBlb3BsZSB0aGF0IGdldF9t
YWludGFpbmVyLnBsIGVtaXRzIGZvciB0aGlzCj4gcGF0Y2guIEkgd29uZGVyIGhvdyBtYW55IHJl
Y2lwZW50cyB3aWxsIHJlZnVzZSB0aGlzIG1haWwgYmVjYXVzZSBvZiB0aGUKPiBsb25nIENjOiBs
aXN0IDotKQo+IAo+IEJlc3QgcmVnYXJkcwo+IFV3ZQoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxp
c3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
