Return-Path: <SRS0=peef=MW=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92A50C19F39
	for <linux-i3c@archiver.kernel.org>; Fri, 30 Jul 2021 19:40:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 547F660F01
	for <linux-i3c@archiver.kernel.org>; Fri, 30 Jul 2021 19:40:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 547F660F01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vMXzKm5IYe3tauhlPNVSuSQVsF6zwlQqqicuuAgCg6w=; b=cxjzMgyl+UdRv8
	FH/JaImLhXoiKKNtt3cUN3KH2PZCtoHoi55Mh5pdKzJJaZEC78CDxFHgggrINfyGviH+paQcAybXz
	H7PJ9U1r+uSF2UcWYD6z6f/FFqEuL9lLaN0DmaewmLSI8mB2Aqw2D17nEP0GtLxiBetnF2g+0ujVS
	azhCC1PZlJ/LQEJ0d5n5awSxw0l0j9rJReUHCsB3W1zhvNJcDRvPtv3FsrAVEnDrDLi9Zo9EYVUKN
	ZrKDld9/HftnUvYbG8UKLtwNUq/Zmovj6EBWeRkJdnivYQImZigx8LGobJfi5krQngPWqVPuAnh2F
	lMtO1uBUiCgiEAT9QzJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9YMr-00A8Ox-RV; Fri, 30 Jul 2021 19:40:25 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1JTP-00FxzL-Oi; Thu, 08 Jul 2021 02:09:09 +0000
Received: by mail-wm1-x329.google.com with SMTP id
 h18-20020a05600c3512b029020e4ceb9588so5624499wmq.5; 
 Wed, 07 Jul 2021 19:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3PsL89oWHD3lPAqXaooZwbzxbg1c8VW9/mevLYmxoEY=;
 b=Io7pdvzLgLAcWTLuF5ChPlqPXk8RD3AjkbMakmdmrW+tJF8WmpTLIy+6Q6+3CkaEMB
 DiGtf8xMIi/Js/Dp28RJSTDsd6fivWwEshHU0ncZmqrlNcSixmrFJIMiY5aH0CNk37lu
 ZxaGIjIRv4gnUqRRsRV9LF3hBCpGMTCjFBPurxMRm/oJnUVBQLyBO98Tze3h39uGWPjq
 L1hynZ4nw5dufGsacwH52FPdsq9ucSHiu2W0uD2PM6zfNlldOQXdtSmYU4w64AhwrfAV
 AGk22auShLhCRWC8I72blncKoOlQeoTMsnm/VTRo3w2RzqnlGs4u/t7Kteji5q2GImlm
 Xejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3PsL89oWHD3lPAqXaooZwbzxbg1c8VW9/mevLYmxoEY=;
 b=LZtbf23Mkn3ewMy2H/Jh+q6ktPrCYTIJ0hoglWPaR3aVxYNb5kr+tTilTC0MxMDSFl
 08KYVZteNa8BJ/jNmsZtSYD/E/wU16Z36PT9/sK27KEsZbC4AGfRD8W3v/Uq2nk417G7
 IsiUP/mJpUBMgSU2uQlSOIfaQRjPFeYgF3Y/apaCdWvEnszXhGt++at9O9JnU+vNCvcj
 flkZ00/5JogPXn8FZ+lJ+ORy6up4sO2Xy6tsV5mqIwtimuSFKWOTvuM3hjnyZuX7mdZJ
 n+bK3lwVM/ZVxfYcc1naLNqEy96IsqW77xNP/8ZZqk3Nia57MpiN9nLkwmF45cp3hVN2
 eclg==
X-Gm-Message-State: AOAM533q114iSVgAW8pzRJ4gVdpBG+0+bd4x8C6TVWLrNjECjGG0I1P7
 T+AKFJIacUcPAmteuSnBvv3UYQndmTBO/sfu+ds=
X-Google-Smtp-Source: ABdhPJx2ABZfFCczzC2+tHa6i67MY0TTbXPJ4h7OQNwopTDiNt9WjzOb7awBWWfFzzKIcRsQNvEeOBa03Rz7d0rVqcg=
X-Received: by 2002:a1c:7512:: with SMTP id o18mr999573wmc.94.1625710144333;
 Wed, 07 Jul 2021 19:09:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210706154803.1631813-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20210706154803.1631813-1-u.kleine-koenig@pengutronix.de>
From: Sven Van Asbroeck <thesven73@gmail.com>
Date: Wed, 7 Jul 2021 22:08:53 -0400
Message-ID: <CAGngYiWm4u27o-yy5L5tokMB5G1RUR5uYmKf2oXah2P3J=hK2A@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] bus: Make remove callback return void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sascha Hauer <kernel@pengutronix.de>, Cornelia Huck <cohuck@redhat.com>, 
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
 Ben Widawsky <ben.widawsky@intel.com>, Dan Williams <dan.j.williams@intel.com>,
 Dave Jiang <dave.jiang@intel.com>, Vinod Koul <vkoul@kernel.org>, 
 Stefan Richter <stefanr@s5r6.in-berlin.de>, Sudeep Holla <sudeep.holla@arm.com>,
 Cristian Marussi <cristian.marussi@arm.com>, Wu Hao <hao.wu@intel.com>,
 Tom Rix <trix@redhat.com>, 
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
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, 
 Andreas Noever <andreas.noever@gmail.com>,
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
 SeongJae Park <sjpark@amazon.de>, Julien Grall <jgrall@amazon.com>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, linux-mips@vger.kernel.org, 
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-acpi@vger.kernel.org, linux-wireless@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, linux-cxl@vger.kernel.org, 
 nvdimm@lists.linux.dev, dmaengine@vger.kernel.org, 
 linux1394-devel@lists.sourceforge.net, linux-fpga@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-hyperv@vger.kernel.org, 
 linux-i2c <linux-i2c@vger.kernel.org>, linux-i3c@lists.infradead.org, 
 industrypack-devel@lists.sourceforge.net, 
 linux-media <linux-media@vger.kernel.org>, linux-mmc@vger.kernel.org, 
 netdev <netdev@vger.kernel.org>, linux-ntb@googlegroups.com, 
 linux-pci@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, linux-scsi@vger.kernel.org, 
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-spi <linux-spi@vger.kernel.org>, linux-staging@lists.linux.dev, 
 greybus-dev@lists.linaro.org, target-devel@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-serial@vger.kernel.org, 
 virtualization@lists.linux-foundation.org, kvm@vger.kernel.org, 
 xen-devel@lists.xenproject.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210707_190907_836178_70B75CAF 
X-CRM114-Status: GOOD (  12.78  )
X-Mailman-Approved-At: Fri, 30 Jul 2021 12:40:20 -0700
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

T24gVHVlLCBKdWwgNiwgMjAyMSBhdCAxMTo1MCBBTSBVd2UgS2xlaW5lLUvDtm5pZwo8dS5rbGVp
bmUta29lbmlnQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPgo+ICBkcml2ZXJzL3N0YWdpbmcvZmll
bGRidXMvYW55YnVzcy9ob3N0LmMgICB8IDQgKy0tLQoKQXdlc29tZSAhCgpBY2tlZC1ieTogU3Zl
biBWYW4gQXNicm9lY2sgPFRoZVN2ZW43M0BnbWFpbC5jb20+CgotLSAKbGludXgtaTNjIG1haWxp
bmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
