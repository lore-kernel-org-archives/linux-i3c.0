Return-Path: <SRS0=peef=MW=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE749C4320A
	for <linux-i3c@archiver.kernel.org>; Fri, 30 Jul 2021 19:40:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56B19600CD
	for <linux-i3c@archiver.kernel.org>; Fri, 30 Jul 2021 19:40:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 56B19600CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m3oirPjT+FqCJL8g4+cjxtLbjkGPGxgNwxY73X/u3dM=; b=2N5BBgUF2uL1Eh
	yT1s4h3F3XMV1GBuFgwXBFm7owNpxXssmxmMRym+Sg+9QAdY7Limmakf8plpVCkZLRzheW38SytAK
	etJSXpCekMhwwPNLUHr9rsUsek0yMUPsZdi654f1DcT533ldyCjwx+3++85RH2ECogz5PEj6fWMYL
	p8odPtt5txHr5cWnJDZ3HTP2zvEoMQEnwWVQgGnm64nTN4841XnhoYcjmLnV+2CXMJRgjlwaA7+C4
	ToCw6VbQMymZHU4bI+qz7//WiNfnc+UowghwnumRJZarB/bjPmMCDAD65IRJXyVJ0q5b/yE4tYeln
	hyiuJ0aubWYPR4Dxyw5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9YN1-00A8be-J0; Fri, 30 Jul 2021 19:40:35 +0000
Received: from mail-ua1-f43.google.com ([209.85.222.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3aV9-00Cl7G-L9; Wed, 14 Jul 2021 08:44:22 +0000
Received: by mail-ua1-f43.google.com with SMTP id e22so342773uaa.8;
 Wed, 14 Jul 2021 01:44:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=r5k/nzvm++7I0kjlsxJbLPoLxldn2GkCJzAXrc4Q3tE=;
 b=LX6383Isf88Sek2e1FhYD5KxQXpG3bIT/Dxmi5DGOcrDXPWV/MTafC3yW3VnZiOZGU
 W7CwvFGuEZoJmlUnQELfRHTizrr97g/6cdps4Ha/ZFCYsYvbmdUew9QAUuWZ8watar3u
 CKPIIgPSJtJPPAwPQiZ/S5QBRMFwzjMAMxrZOCkiBdifa5SuR9dYY9f1NsBk7LUe64RQ
 TV7KhwXxOy8Ru4/k0VcEOW/RHmpdmMh8ctYorjiZMhsPuPabEBNGQVaVqu9zmW5mhOrq
 TCHeHLjP4S1XzkBTQ99yS7hW5bup/yEE/BMroGQP7NaZHKW4aBUAcchnLjonVGzVpMu0
 SImA==
X-Gm-Message-State: AOAM531lG1HcdfkkLHZVfmdnExFU/5tDKF1blldJZO6A4tdjFlPNngtR
 SQmpBUeIITyTTr6PjJSTBL/6ODebdtESGw81PhA=
X-Google-Smtp-Source: ABdhPJw+Y3tnjfY/zI+Y1qOhR0PNRzn2MQD3PHuwf/AzIRJfXjUIjP825Ll9FtnbmVsf04QAqWLG0Tq2dErAW2+m0rM=
X-Received: by 2002:a9f:3f0d:: with SMTP id h13mr12412958uaj.100.1626252258156; 
 Wed, 14 Jul 2021 01:44:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210713193522.1770306-1-u.kleine-koenig@pengutronix.de>
 <20210713193522.1770306-6-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20210713193522.1770306-6-u.kleine-koenig@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jul 2021 10:44:06 +0200
Message-ID: <CAMuHMdW8r6u4O5zv2ee-3=jPP6qwnOSHdSzf8pPE_y=jY3Bn5A@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] bus: Make remove callback return void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sascha Hauer <kernel@pengutronix.de>, 
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
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
 Chen-Yu Tsai <wens@csie.org>, Christian Borntraeger <borntraeger@de.ibm.com>, 
 Cornelia Huck <cohuck@redhat.com>, Cristian Marussi <cristian.marussi@arm.com>,
 Dan Williams <dan.j.williams@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
 "David S. Miller" <davem@davemloft.net>, David Woodhouse <dwmw@amazon.co.uk>, 
 Dexuan Cui <decui@microsoft.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Finn Thain <fthain@linux-m68k.org>, 
 Florian Fainelli <f.fainelli@gmail.com>, Frank Li <lznuaa@gmail.com>, 
 Geoff Levand <geoff@infradead.org>, Haiyang Zhang <haiyangz@microsoft.com>, 
 Hannes Reinecke <hare@suse.de>, Hans de Goede <hdegoede@redhat.com>, 
 Harald Freudenberger <freude@linux.ibm.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
 Ira Weiny <ira.weiny@intel.com>, Jakub Kicinski <kuba@kernel.org>, 
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Jaroslav Kysela <perex@perex.cz>, 
 Jason Wang <jasowang@redhat.com>, Jens Taprogge <jens.taprogge@taprogge.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Joey Pabalan <jpabalanb@gmail.com>, 
 Johan Hovold <johan@kernel.org>, Johannes Berg <johannes@sipsolutions.net>, 
 Johannes Thumshirn <morbidrsa@gmail.com>, Jon Mason <jdmason@kudzu.us>,
 Juergen Gross <jgross@suse.com>, 
 Julien Grall <jgrall@amazon.com>, Kai-Heng Feng <kai.heng.feng@canonical.com>, 
 Kirti Wankhede <kwankhede@nvidia.com>, Kishon Vijay Abraham I <kishon@ti.com>, 
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 "K. Y. Srinivasan" <kys@microsoft.com>, Lee Jones <lee.jones@linaro.org>,
 Len Brown <lenb@kernel.org>, 
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Manohar Vanga <manohar.vanga@gmail.com>, 
 Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
 Mark Gross <mgross@linux.intel.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Martyn Welch <martyn@welchs.me.uk>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Matt Porter <mporter@kernel.crashing.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Maximilian Luz <luzmaximilian@gmail.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>, 
 Michael Buesch <m@bues.ch>, Michael Ellerman <mpe@ellerman.id.au>,
 Michael Jamet <michael.jamet@intel.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Mike Christie <michael.christie@oracle.com>, Moritz Fischer <mdf@kernel.org>, 
 Ohad Ben-Cohen <ohad@wizery.com>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Paul Mackerras <paulus@samba.org>, Peter Oberparleiter <oberpar@linux.ibm.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
 Rich Felker <dalias@libc.org>, Rikard Falkeborn <rikard.falkeborn@gmail.com>, 
 Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Samuel Holland <samuel@sholland.org>, 
 Samuel Iglesias Gonsalvez <siglesias@igalia.com>,
 SeongJae Park <sjpark@amazon.de>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
 Stefano Stabellini <sstabellini@kernel.org>,
 Stefan Richter <stefanr@s5r6.in-berlin.de>, 
 Stephen Boyd <sboyd@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>, 
 Sudeep Holla <sudeep.holla@arm.com>, Sven Van Asbroeck <TheSven73@gmail.com>, 
 Takashi Iwai <tiwai@suse.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thorsten Scherer <t.scherer@eckelmann.de>,
 Tomas Winkler <tomas.winkler@intel.com>, 
 Tom Rix <trix@redhat.com>, Tyrel Datwyler <tyreld@linux.ibm.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Vasily Gorbik <gor@linux.ibm.com>, 
 Vineeth Vijayan <vneethv@linux.ibm.com>, Vinod Koul <vkoul@kernel.org>, 
 Vishal Verma <vishal.l.verma@intel.com>, Wei Liu <wei.liu@kernel.org>, 
 William Breathitt Gray <vilhelm.gray@gmail.com>, Wolfram Sang <wsa@kernel.org>,
 Wu Hao <hao.wu@intel.com>, Yehezkel Bernat <YehezkelShB@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, 
 YueHaibing <yuehaibing@huawei.com>, Yufen Yu <yuyufen@huawei.com>,
 alsa-devel@alsa-project.org, 
 dmaengine@vger.kernel.org, greybus-dev@lists.linaro.org, 
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
 virtualization@lists.linux-foundation.org, xen-devel@lists.xenproject.org, 
 Johannes Thumshirn <jth@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_014419_753765_F2490D71 
X-CRM114-Status: GOOD (  24.96  )
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

T24gVHVlLCBKdWwgMTMsIDIwMjEgYXQgOTozNSBQTSBVd2UgS2xlaW5lLUvDtm5pZwo8dS5rbGVp
bmUta29lbmlnQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPiBUaGUgZHJpdmVyIGNvcmUgaWdub3Jl
cyB0aGUgcmV0dXJuIHZhbHVlIG9mIHRoaXMgY2FsbGJhY2sgYmVjYXVzZSB0aGVyZQo+IGlzIG9u
bHkgbGl0dGxlIGl0IGNhbiBkbyB3aGVuIGEgZGV2aWNlIGRpc2FwcGVhcnMuCj4KPiBUaGlzIGlz
IHRoZSBmaW5hbCBiaXQgb2YgYSBsb25nIGxhc3RpbmcgY2xlYW51cCBxdWVzdCB3aGVyZSBzZXZl
cmFsCj4gYnVzZXMgd2VyZSBjb252ZXJ0ZWQgdG8gYWxzbyByZXR1cm4gdm9pZCBmcm9tIHRoZWly
IHJlbW92ZSBjYWxsYmFjay4KPiBBZGRpdGlvbmFsbHkgc29tZSByZXNvdXJjZSBsZWFrcyB3ZXJl
IGZpeGVkIHRoYXQgd2VyZSBjYXVzZWQgYnkgZHJpdmVycwo+IHJldHVybmluZyBhbiBlcnJvciBj
b2RlIGluIHRoZSBleHBlY3RhdGlvbiB0aGF0IHRoZSBkcml2ZXIgd29uJ3QgZ28KPiBhd2F5Lgo+
Cj4gV2l0aCBzdHJ1Y3QgYnVzX3R5cGU6OnJlbW92ZSByZXR1cm5pbmcgdm9pZCBpdCdzIHByZXZl
bnRlZCB0aGF0IG5ld2x5Cj4gaW1wbGVtZW50ZWQgYnVzZXMgcmV0dXJuIGFuIGlnbm9yZWQgZXJy
b3IgY29kZSBhbmQgc28gZG9uJ3QgYW50aWNpcGF0ZQo+IHdyb25nIGV4cGVjdGF0aW9ucyBmb3Ig
ZHJpdmVyIGF1dGhvcnMuCgo+ICBkcml2ZXJzL3pvcnJvL3pvcnJvLWRyaXZlci5jICAgICAgICAg
ICAgICB8IDMgKy0tCgpBY2tlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1t
NjhrLm9yZz4KCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2Vl
cnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9u
ZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25z
IHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4g
SSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29t
ZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51
cyBUb3J2YWxkcwoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1pM2MK
