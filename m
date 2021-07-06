Return-Path: <SRS0=peef=MW=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10D82C00143
	for <linux-i3c@archiver.kernel.org>; Fri, 30 Jul 2021 19:40:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84EE160F26
	for <linux-i3c@archiver.kernel.org>; Fri, 30 Jul 2021 19:40:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 84EE160F26
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aqnRF+qcMOixUalS5BQW9/+ccb/Z1+YItfTolDsMiZQ=; b=c2yfXCQWvXzgYb
	wE3m7ilTPUWNplXTwZJ1hbakOY1sPUfZvmjo2MZ5giRCNOkxcGbxzp21KGbXEev3VjmJovVLEjOZv
	xKVL+CIRrynm0QyMeGpz144UqYlmQDRHBMPYBhony2AVbeubllA2ivoLcK1ZBxnotdiE62L9RrwxI
	KF42wzCDAosU3RJnVNWpVeksus/tvEqHFtNIgwk7xQftUWxpdS+QO1sN4TVbQpb13H/a8BAK9F20e
	EnT1+zN1rjua6S1gJNMztTW79VlxYnHCFPASp7lKJ+QH5VUaUqWZH0G3BcRppcafOoYhjxhcpxSIG
	oSLq0Zsp1UWU7vBCMQNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9YMq-00A8N6-0r; Fri, 30 Jul 2021 19:40:24 +0000
Received: from mail-lj1-f182.google.com ([209.85.208.182])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0iNq-00B2gT-I8; Tue, 06 Jul 2021 10:32:56 +0000
Received: by mail-lj1-f182.google.com with SMTP id r20so13870287ljd.10;
 Tue, 06 Jul 2021 03:32:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc:content-transfer-encoding;
 bh=QFd4cSgjRlNs6aAHRKVeotkaIh4ASKGZEfmqK4rh/rE=;
 b=o/c+BAppV1K2lPTv/T9bGz6j9shH4NALPP8VXotvGm4EtK8NXL8lo6pqRd81MBF21q
 gJk3HmwmvbHqhncP+nk+2kjXutVEqlJxEpXg6r00FVr1jiOIaSFE3N56EyukvZrAt3X+
 sWGwalDfIwiOxjJEB7McJk3AoXRyRY650WxFeKGp1iuYxGlCvXFXDs7SIf1tyONIkVvI
 Tejv5nd+QRRjF8JLUfCs8Na9/YEej2mnPZfb7+fws/GjjRd66xlX8BtpBgA5ztosj0LB
 uK7Rw9UWFI1862bF2UV6vOg0fm2QWMJGZAgVsmjCmIP2KmPxzjVibeFWtGFnz5twa/d5
 6L1Q==
X-Gm-Message-State: AOAM533JJtjaB7/VpVOxByVsc6Xm9X4hjS+j75tGZmphiGFeWqkLA1aP
 7fWRD0xaaWUIdPee+za4pp4BCGhfD0kahynIwhI=
X-Google-Smtp-Source: ABdhPJwF0ilEKJl+Eo9r58MfUGXdJggwP2j70Y/jqgZrbKF3odL8/EoMcbKqvYlmzecsvBszeeglmQ==
X-Received: by 2002:a2e:9210:: with SMTP id k16mr13671462ljg.508.1625567572805; 
 Tue, 06 Jul 2021 03:32:52 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com.
 [209.85.167.47])
 by smtp.gmail.com with ESMTPSA id x74sm1363869lff.254.2021.07.06.03.32.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 03:32:52 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id c28so14050542lfp.11;
 Tue, 06 Jul 2021 03:32:52 -0700 (PDT)
X-Received: by 2002:a2e:1409:: with SMTP id u9mr9759960ljd.94.1625567102788;
 Tue, 06 Jul 2021 03:25:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210706095037.1425211-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20210706095037.1425211-1-u.kleine-koenig@pengutronix.de>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 6 Jul 2021 18:24:51 +0800
X-Gmail-Original-Message-ID: <CAGb2v65WCwDkCzf26urwM91nEWGPAzMHSMFX73WQsFQoWhr8JA@mail.gmail.com>
Message-ID: <CAGb2v65WCwDkCzf26urwM91nEWGPAzMHSMFX73WQsFQoWhr8JA@mail.gmail.com>
Subject: Re: [PATCH] bus: Make remove callback return void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sascha Hauer <kernel@pengutronix.de>, 
 linux-kernel <linux-kernel@vger.kernel.org>,
 Russell King <linux@armlinux.org.uk>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, 
 Geoff Levand <geoff@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, 
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, 
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, 
 Ira Weiny <ira.weiny@intel.com>, Ben Widawsky <ben.widawsky@intel.com>, 
 Dan Williams <dan.j.williams@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Stefan Richter <stefanr@s5r6.in-berlin.de>, 
 Sudeep Holla <sudeep.holla@arm.com>,
 Cristian Marussi <cristian.marussi@arm.com>, 
 Wu Hao <hao.wu@intel.com>, Tom Rix <trix@redhat.com>,
 Moritz Fischer <mdf@kernel.org>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
 "K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
 Dexuan Cui <decui@microsoft.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Wolfram Sang <wsa@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Samuel Iglesias Gonsalvez <siglesias@igalia.com>,
 Jens Taprogge <jens.taprogge@taprogge.org>, 
 Johannes Thumshirn <morbidrsa@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Maxim Levitsky <maximlevitsky@gmail.com>, Alex Dubov <oakad@yahoo.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Lee Jones <lee.jones@linaro.org>, 
 Tomas Winkler <tomas.winkler@intel.com>, Arnd Bergmann <arnd@arndb.de>, 
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Jon Mason <jdmason@kudzu.us>, 
 Allen Hubbe <allenbh@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>, 
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Bjorn Helgaas <bhelgaas@google.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>, 
 Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hdegoede@redhat.com>, 
 Mark Gross <mgross@linux.intel.com>, Matt Porter <mporter@kernel.crashing.org>,
 Alexandre Bounine <alex.bou9@gmail.com>, Ohad Ben-Cohen <ohad@wizery.com>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Thorsten Scherer <t.scherer@eckelmann.de>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Andy Gross <agross@kernel.org>, 
 Mark Brown <broonie@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Buesch <m@bues.ch>, 
 Sven Van Asbroeck <TheSven73@gmail.com>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>, Andreas Noever <andreas.noever@gmail.com>,
 Michael Jamet <michael.jamet@intel.com>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Yehezkel Bernat <YehezkelShB@gmail.com>, 
 Rob Herring <robh@kernel.org>, Jiri Slaby <jirislaby@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Jason Wang <jasowang@redhat.com>, Kirti Wankhede <kwankhede@nvidia.com>, 
 Alex Williamson <alex.williamson@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Martyn Welch <martyn@welchs.me.uk>, Manohar Vanga <manohar.vanga@gmail.com>, 
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>,
 Johannes Berg <johannes@sipsolutions.net>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Marc Zyngier <maz@kernel.org>, 
 Tyrel Datwyler <tyreld@linux.ibm.com>, Vladimir Zapolskiy <vz@mleia.com>, 
 Samuel Holland <samuel@sholland.org>, Qinglang Miao <miaoqinglang@huawei.com>, 
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>, 
 Joey Pabalan <jpabalanb@gmail.com>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Frank Li <lznuaa@gmail.com>, 
 Mike Christie <michael.christie@oracle.com>,
 Bodo Stroesser <bostroesser@gmail.com>, 
 Hannes Reinecke <hare@suse.de>, David Woodhouse <dwmw@amazon.co.uk>,
 SeongJae Park <sjpark@amazon.de>, Julien Grall <jgrall@amazon.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-acpi@vger.kernel.org, 
 linux-wireless <linux-wireless@vger.kernel.org>, linux-sunxi@lists.linux.dev, 
 linux-cxl@vger.kernel.org, nvdimm@lists.linux.dev, 
 "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>,
 linux1394-devel@lists.sourceforge.net, 
 linux-fpga@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-hyperv@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-i3c@lists.infradead.org, industrypack-devel@lists.sourceforge.net, 
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>, 
 netdev <netdev@vger.kernel.org>, linux-ntb@googlegroups.com, 
 PCI <linux-pci@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, linux-scsi@vger.kernel.org, 
 Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
 linux-spi@vger.kernel.org, linux-staging@lists.linux.dev, 
 greybus-dev@lists.linaro.org, target-devel@vger.kernel.org, 
 linux-usb <linux-usb@vger.kernel.org>, linux-serial@vger.kernel.org, 
 virtualization@lists.linux-foundation.org, kvm@vger.kernel.org, 
 xen-devel@lists.xenproject.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_033254_631665_AF313316 
X-CRM114-Status: GOOD (  28.95  )
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
Reply-To: wens@csie.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKdWwgNiwgMjAyMSBhdCA1OjU0IFBNIFV3ZSBLbGVpbmUtS8O2bmlnCjx1LmtsZWlu
ZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOgo+Cj4gVGhlIGRyaXZlciBjb3JlIGlnbm9y
ZXMgdGhlIHJldHVybiB2YWx1ZSBvZiB0aGlzIGNhbGxiYWNrIGJlY2F1c2UgdGhlcmUKPiBpcyBv
bmx5IGxpdHRsZSBpdCBjYW4gZG8gd2hlbiBhIGRldmljZSBkaXNhcHBlYXJzLgo+Cj4gVGhpcyBp
cyB0aGUgZmluYWwgYml0IG9mIGEgbG9uZyBsYXN0aW5nIGNsZWFudXAgcXVlc3Qgd2hlcmUgc2V2
ZXJhbAo+IGJ1c2VzIHdlcmUgY29udmVydGVkIHRvIGFsc28gcmV0dXJuIHZvaWQgZnJvbSB0aGVp
ciByZW1vdmUgY2FsbGJhY2suCj4gQWRkaXRpb25hbGx5IHNvbWUgcmVzb3VyY2UgbGVha3Mgd2Vy
ZSBmaXhlZCB0aGF0IHdlcmUgY2F1c2VkIGJ5IGRyaXZlcnMKPiByZXR1cm5pbmcgYW4gZXJyb3Ig
Y29kZSBpbiB0aGUgZXhwZWN0YXRpb24gdGhhdCB0aGUgZHJpdmVyIHdvbid0IGdvCj4gYXdheS4K
Pgo+IFdpdGggc3RydWN0IGJ1c190eXBlOjpyZW1vdmUgcmV0dXJuaW5nIHZvaWQgaXQncyBwcmV2
ZW50ZWQgdGhhdCBuZXdseQo+IGltcGxlbWVudGVkIGJ1c2VzIHJldHVybiBhbiBpZ25vcmVkIGVy
cm9yIGNvZGUgYW5kIHNvIGRvbid0IGFudGljaXBhdGUKPiB3cm9uZyBleHBlY3RhdGlvbnMgZm9y
IGRyaXZlciBhdXRob3JzLgo+Cj4gU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUu
a2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KPiAtLS0KPiBIZWxsbywKPgo+IHRoaXMgcGF0
Y2ggZGVwZW5kcyBvbiAiUENJOiBlbmRwb2ludDogTWFrZSBzdHJ1Y3QgcGNpX2VwZl9kcml2ZXI6
OnJlbW92ZQo+IHJldHVybiB2b2lkIiB0aGF0IGlzIG5vdCB5ZXQgYXBwbGllZCwgc2VlCj4gaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDIxMDIyMzA5MDc1Ny41NzYwNC0xLXUua2xlaW5lLWtv
ZW5pZ0BwZW5ndXRyb25peC5kZS4KPgo+IEkgdGVzdGVkIGl0IHVzaW5nIGFsbG1vZGNvbmZpZyBv
biBhbWQ2NCBhbmQgYXJtLCBidXQgSSB3b3VsZG4ndCBiZQo+IHN1cnByaXNlZCBpZiBJIHN0aWxs
IG1pc3NlZCB0byBjb252ZXJ0IGEgZHJpdmVyLiBTbyBpdCB3b3VsZCBiZSBncmVhdCB0bwo+IGdl
dCB0aGlzIGludG8gbmV4dCBlYXJseSBhZnRlciB0aGUgbWVyZ2Ugd2luZG93IGNsb3Nlcy4KPgo+
IEkgc2VuZCB0aGlzIG1haWwgdG8gYWxsIHBlb3BsZSB0aGF0IGdldF9tYWludGFpbmVyLnBsIGVt
aXRzIGZvciB0aGlzCj4gcGF0Y2guIEkgd29uZGVyIGhvdyBtYW55IHJlY2lwZW50cyB3aWxsIHJl
ZnVzZSB0aGlzIG1haWwgYmVjYXVzZSBvZiB0aGUKPiBsb25nIENjOiBsaXN0IDotKQo+Cj4gQmVz
dCByZWdhcmRzCj4gVXdlCj4KCj4gIGRyaXZlcnMvYnVzL3N1bnhpLXJzYi5jICAgICAgICAgICAg
ICAgICAgIHwgNCArLS0tCgpBY2tlZC1ieTogQ2hlbi1ZdSBUc2FpIDx3ZW5zQGNzaWUub3JnPgoK
LS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
