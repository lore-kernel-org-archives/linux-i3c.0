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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C758C19F3C
	for <linux-i3c@archiver.kernel.org>; Fri, 30 Jul 2021 19:40:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67889600CD
	for <linux-i3c@archiver.kernel.org>; Fri, 30 Jul 2021 19:40:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 67889600CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wrgq3uXm+iQAaPXuyCL5fzlgF/BMv8/DVu6xVOMnQjs=; b=DxzsMBZz3YcFRA
	LBp22tn5J1CYuC98A3a3aOU9pI1vMWFUeNmdWvtM6mcaYFsEHk+8AJucz+5vWPSWqRhvwtyC5pXUZ
	HN1ahPTctBP55EzIhuFvuXhPPLKDazwmqWxTRBBmCZqkQ32BhLOoaZm/65sUIqTXPy1oQekAfVP3N
	KSoKmsjGzHhfv6K4Obv3bORvy2vo6BC2C00h0clNEzJNJd3BsY9zBdurFIrfukKWPp3PTwf1TWuW0
	Gu8OTdDDAgHG+K0UtbZy+ZC76EiwEhsH8VWPImyCKtf6Nx9BcST56JqEhDvIe4K+1tlVpiLDlOeAa
	tPJY82IB1LjkUeX1ZnEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9YMu-00A8SD-Uw; Fri, 30 Jul 2021 19:40:28 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0mfI-00C72m-KG; Tue, 06 Jul 2021 15:07:14 +0000
Received: by mail-ej1-x634.google.com with SMTP id o5so34696722ejy.7;
 Tue, 06 Jul 2021 08:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+9dsgPbS//aUCZUFixPgGcG7qxsG2EJ3dbyOzFDh8TA=;
 b=SBHfWn821HxdveyktStHQrYDe4MbFpbgRsAdNfnT39UeMrTpAkqi5Mw9J7eZv7cX8o
 4IiMGVVUkNi11aAd4XiuIPLnSf4etnUsfgOrP0HPkyuBpadE2fbx2e+Mv3rlJzIHAso+
 o7XaFo1UlSb/NBSAjQV11bNqf2gionJphJcRl4YCGJk45hXp5V+Gpo6AbrJv2xqP31dM
 +oUmVZwHbjtRk+sinfDNsF+kPOGLbKlYnyzpn0vB+NsB4Whl5CCwUy8NwaOykBdFTFHG
 XhUidv7/qS7jG1fnPfvqgohVjfRj0vLF0MFd7Vbksyj/BKvpyZ1bN9xNMq5MG35cMCap
 n6sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+9dsgPbS//aUCZUFixPgGcG7qxsG2EJ3dbyOzFDh8TA=;
 b=ixqBKicuI+iWnflPLZlk9JDuXLV/ITsatBIG/cNFM5woMiqqk1k5nio4piNQHLMWxG
 dxaghq9OZUKZMpQ4sMsLQj+CSkoEd/yQeKFIWebwbc8sb8eBZfs44Rsc37tX/L9cbPhk
 xoCkKaCU7/YEKHG7vbYFfnqgWt178jLJJf5ikfhW1v8uM/ZSd5KAe+gW4Qcg/DZhkOqK
 A9dk0mbqPNb/Gw9eOvBr34NKK/0qoM6kv7D8P6dcv39+1SuMAuUqQN3pFPxZtcAL68RL
 iu6FpCKw2/ep4UuTLuHOMagvWuxMFg303xld4FD8uTz6hWEJEUqEH0OLniOqhENJISnA
 4x9w==
X-Gm-Message-State: AOAM5335bUl+pgyu2pyLFX0/K9zi9NhN1cpX3pWsTWdfMTnfRCeFBI0s
 EwHfUkIoSc5mEsawathqKlbX04hJX+Uk+JiEbME=
X-Google-Smtp-Source: ABdhPJyx2s89fjP7kWr4sVrlETefy/K9QI98mSZLW/XMLqqA4vHIWAGZQnqqZ+CiP6xjmA9K+asUF6gnTpo1w9tsizc=
X-Received: by 2002:a17:907:6289:: with SMTP id
 nd9mr19151547ejc.384.1625584024338; 
 Tue, 06 Jul 2021 08:07:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210706095037.1425211-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20210706095037.1425211-1-u.kleine-koenig@pengutronix.de>
From: Yehezkel Bernat <yehezkelshb@gmail.com>
Date: Tue, 6 Jul 2021 18:06:47 +0300
Message-ID: <CA+CmpXu5-NCvfuOc8fso2a9bmi0Dacmd=+u=XB-Wd7X=WgOTBA@mail.gmail.com>
Subject: Re: [PATCH] bus: Make remove callback return void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel@pengutronix.de, 
 LKML <linux-kernel@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, 
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
 Sven Van Asbroeck <TheSven73@gmail.com>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>, Andreas Noever <andreas.noever@gmail.com>,
 Michael Jamet <michael.jamet@intel.com>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Rob Herring <robh@kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Kirti Wankhede <kwankhede@nvidia.com>,
 Alex Williamson <alex.williamson@redhat.com>, 
 Cornelia Huck <cohuck@redhat.com>, Martyn Welch <martyn@welchs.me.uk>, 
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
 Linux PCI <linux-pci@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, linux-scsi@vger.kernel.org, 
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-spi@vger.kernel.org, linux-staging@lists.linux.dev, 
 greybus-dev@lists.linaro.org, target-devel@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-serial@vger.kernel.org, 
 virtualization@lists.linux-foundation.org, kvm@vger.kernel.org, 
 xen-devel@lists.xenproject.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_080712_697926_215C145B 
X-CRM114-Status: GOOD (  19.30  )
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

T24gVHVlLCBKdWwgNiwgMjAyMSBhdCAxMjo1MCBQTSBVd2UgS2xlaW5lLUvDtm5pZwo8dS5rbGVp
bmUta29lbmlnQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPgo+IFRoZSBkcml2ZXIgY29yZSBpZ25v
cmVzIHRoZSByZXR1cm4gdmFsdWUgb2YgdGhpcyBjYWxsYmFjayBiZWNhdXNlIHRoZXJlCj4gaXMg
b25seSBsaXR0bGUgaXQgY2FuIGRvIHdoZW4gYSBkZXZpY2UgZGlzYXBwZWFycy4KPgo+IFRoaXMg
aXMgdGhlIGZpbmFsIGJpdCBvZiBhIGxvbmcgbGFzdGluZyBjbGVhbnVwIHF1ZXN0IHdoZXJlIHNl
dmVyYWwKPiBidXNlcyB3ZXJlIGNvbnZlcnRlZCB0byBhbHNvIHJldHVybiB2b2lkIGZyb20gdGhl
aXIgcmVtb3ZlIGNhbGxiYWNrLgo+IEFkZGl0aW9uYWxseSBzb21lIHJlc291cmNlIGxlYWtzIHdl
cmUgZml4ZWQgdGhhdCB3ZXJlIGNhdXNlZCBieSBkcml2ZXJzCj4gcmV0dXJuaW5nIGFuIGVycm9y
IGNvZGUgaW4gdGhlIGV4cGVjdGF0aW9uIHRoYXQgdGhlIGRyaXZlciB3b24ndCBnbwo+IGF3YXku
Cj4KPiBXaXRoIHN0cnVjdCBidXNfdHlwZTo6cmVtb3ZlIHJldHVybmluZyB2b2lkIGl0J3MgcHJl
dmVudGVkIHRoYXQgbmV3bHkKPiBpbXBsZW1lbnRlZCBidXNlcyByZXR1cm4gYW4gaWdub3JlZCBl
cnJvciBjb2RlIGFuZCBzbyBkb24ndCBhbnRpY2lwYXRlCj4gd3JvbmcgZXhwZWN0YXRpb25zIGZv
ciBkcml2ZXIgYXV0aG9ycy4KPgo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1
LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Cj4gLS0tCgo+Cj4gIGRyaXZlcnMvdGh1bmRl
cmJvbHQvZG9tYWluLmMgICAgICAgICAgICAgIHwgNCArLS0tCgpGb3IgVGh1bmRlcmJvbHQ6CgpB
Y2tlZC1ieTogWWVoZXprZWwgQmVybmF0IDxZZWhlemtlbFNoQkBnbWFpbC5jb20+CgotLSAKbGlu
dXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
