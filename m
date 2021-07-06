Return-Path: <SRS0=peef=MW=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93FFAC19F3E
	for <linux-i3c@archiver.kernel.org>; Fri, 30 Jul 2021 19:40:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61663600CD
	for <linux-i3c@archiver.kernel.org>; Fri, 30 Jul 2021 19:40:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 61663600CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h1tk8AJFAJ0tm4O16Da816ksAx1FGnOXfTZ7OgzkWOQ=; b=JB56znmtSeD2ze
	UJ4LJQnWx0fgbiepZ+UsI0+2tQ9OnebeMOg4VcXa9lRlrdP6pixiPR8bqsIG6gmiatECmVSLRG18t
	D6t2gWqwyWkaUYSoD+yCqGgEC/dWW8/51tcoIHIxvMzB9yUzPyCIIQvbLxu6diqBpXVKQZI+dtzQ2
	6HZ36Dhm0h8HcsWlYehZmGmut3wXl05D76ADFktARQ8lhQyO8iRB4eZhQDur+kcx4zFUksNze1ENg
	R+PVMb7nVtYnxVtekQTu9eiQ8A9QWKl7p8C+JuVLHCw55ZXsbbyHs6pDmZvGR6TrmNK4VqlS+IL6G
	B05QLq70LI/qnMQhZjFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9YMy-00A8Ww-H1; Fri, 30 Jul 2021 19:40:32 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0qAH-00CbZd-8y
 for linux-i3c@lists.infradead.org; Tue, 06 Jul 2021 18:51:26 +0000
Received: by mail-pg1-x534.google.com with SMTP id a2so22280371pgi.6
 for <linux-i3c@lists.infradead.org>; Tue, 06 Jul 2021 11:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CUB/wg8JoGmq3NIMuzXfvTu1/LaQA3sJa9mgD0RKZNM=;
 b=NCdUcCEYBEoF+OVX9fy25TDeiKDiyu7MS8rvWeBmnwWDnPpc5+QhpNeuAg5+M01lgv
 DRH8QNEoIXVvsAW/9oBoS2NReA9bsV6Hj2cFB9jLLFtRzn+HzyElennnBW9tDomDrZF/
 XkbSLC4duPiBx+pb77e5uH0fYLMkjK217pwgB1wYqGKrM1h34OqVCa5M9I67oCpiuU+f
 pbgZ3PKaRiScHxRehdZaD+636T/YBbbzOrYq9ouzPlMVA0x6yucHaPT19ze0f0ZjxqqZ
 KMetsaE3O5ReiI2mpGtW6/n68aQ7RKzzGVSyyRz/qTwzg+JiHPzeut5+sQawTaXHwNB/
 HKBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CUB/wg8JoGmq3NIMuzXfvTu1/LaQA3sJa9mgD0RKZNM=;
 b=sEThn6IlkrE6vvN1aH1qmmQVhkdMW2okovnYIBBwwe5vgrXdpOVi56iB0tDbu/vybc
 HID8HkQp2O51R/BX4ZHCDUyJuAIN5OwA3h/8uuJJFaFvTO2GVtgzRZwLEoLQ31lcBluh
 Ly4EQf6kzsknYugO5JYvH/P5Uc4EqvJJylnBGZH0LJmxcKIsjeyQXqCtCknAciWMYhRx
 0W6TbWCwRtxHu27kTgXWua3Dgpq6SfVR7xrG5lSACWiTmem5VQuWB2UsWAx0XXlNNHd6
 Gl5LjgJBekr9Upihu2739gmKWiSTv0D0qA1NS+00mhrCWVFpNj5XZD0lrwoW+Tdz4E1b
 gxxg==
X-Gm-Message-State: AOAM533XV8te5Gkd5bKhAPuKvdTCOnxriJzotQCtBDhaWqYmiXoVzLNV
 t//xlPwpKs38hNHBlar7QftHhFnPN6dKqNncOo3bbA==
X-Google-Smtp-Source: ABdhPJyL0D13WbWlA6qnw/Xmlwa19pDI+XNQ21Npie/wgUkDgmHM1zT9YORdF5DHiOOYSSe1zuHfWr+DfQo+lHkX354=
X-Received: by 2002:a63:4c3:: with SMTP id 186mr12014592pge.240.1625597483385; 
 Tue, 06 Jul 2021 11:51:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210706154803.1631813-1-u.kleine-koenig@pengutronix.de>
 <20210706154803.1631813-5-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20210706154803.1631813-5-u.kleine-koenig@pengutronix.de>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 6 Jul 2021 11:51:12 -0700
Message-ID: <CAPcyv4gxjV7Xj8AN6aCkSLSi=yT6GdcAyigK6Au3mZQ1idBxJg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] bus: Make remove callback return void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel@pengutronix.de, 
 Cornelia Huck <cohuck@redhat.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
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
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Alison Schofield <alison.schofield@intel.com>, 
 Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Ben Widawsky <ben.widawsky@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
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
 Alex Williamson <alex.williamson@redhat.com>,
 Martyn Welch <martyn@welchs.me.uk>, 
 Manohar Vanga <manohar.vanga@gmail.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
 Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
 Johannes Berg <johannes@sipsolutions.net>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Marc Zyngier <maz@kernel.org>,
 Tyrel Datwyler <tyreld@linux.ibm.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Samuel Holland <samuel@sholland.org>, 
 Qinglang Miao <miaoqinglang@huawei.com>, Alexey Kardashevskiy <aik@ozlabs.ru>, 
 Kai-Heng Feng <kai.heng.feng@canonical.com>, Joey Pabalan <jpabalanb@gmail.com>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Frank Li <lznuaa@gmail.com>, 
 Mike Christie <michael.christie@oracle.com>,
 Bodo Stroesser <bostroesser@gmail.com>, 
 Hannes Reinecke <hare@suse.de>, David Woodhouse <dwmw@amazon.co.uk>,
 SeongJae Park <sjpark@amazon.de>, 
 Julien Grall <jgrall@amazon.com>, linux-arm-kernel@lists.infradead.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-acpi@vger.kernel.org, 
 linux-wireless@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-cxl@vger.kernel.org, nvdimm@lists.linux.dev, dmaengine@vger.kernel.org, 
 linux1394-devel@lists.sourceforge.net, linux-fpga@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-hyperv@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-i3c@lists.infradead.org, 
 industrypack-devel@lists.sourceforge.net, linux-media@vger.kernel.org, 
 linux-mmc@vger.kernel.org, netdev@vger.kernel.org, linux-ntb@googlegroups.com, 
 linux-pci@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, linux-scsi@vger.kernel.org, 
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-spi@vger.kernel.org, linux-staging@lists.linux.dev, 
 greybus-dev@lists.linaro.org, target-devel@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-serial@vger.kernel.org, 
 virtualization@lists.linux-foundation.org, kvm@vger.kernel.org, 
 xen-devel@lists.xenproject.org, Russell King <rmk+kernel@armlinux.org.uk>, 
 Johannes Thumshirn <jth@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_115125_365530_50AC2703 
X-CRM114-Status: GOOD (  19.72  )
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

T24gVHVlLCBKdWwgNiwgMjAyMSBhdCA4OjUxIEFNIFV3ZSBLbGVpbmUtS8O2bmlnCjx1LmtsZWlu
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
IGRyaXZlciBhdXRob3JzLgo+Cgo+ICBkcml2ZXJzL2N4bC9jb3JlLmMgICAgICAgICAgICAgICAg
ICAgICAgICB8IDMgKy0tCj4gIGRyaXZlcnMvZGF4L2J1cy5jICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgNCArLS0tCj4gIGRyaXZlcnMvbnZkaW1tL2J1cy5jICAgICAgICAgICAgICAgICAgICAg
IHwgMyArLS0KCkZvciBDWEwsIERBWCwgYW5kIE5WRElNTQoKQWNrZWQtYnk6IERhbiBXaWxsaWFt
cyA8ZGFuLmoud2lsbGlhbXNAaW50ZWwuY29tPgoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QK
bGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
