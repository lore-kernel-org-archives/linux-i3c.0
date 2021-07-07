Return-Path: <SRS0=peef=MW=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 255BEC25AE6
	for <linux-i3c@archiver.kernel.org>; Fri, 30 Jul 2021 19:40:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7E1A600CD
	for <linux-i3c@archiver.kernel.org>; Fri, 30 Jul 2021 19:40:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D7E1A600CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UBRYM4CqM7NSrpbAESf54bUj5vZ/zJZc+8Tik1Vko2A=; b=Q1Mai4Dl+1dKUts8vlDoytDVSE
	Yyp9O4TbCmPKWaOeyFtiAG4U89PLBOkl9GNbp6ENvrEmZNcVNICczorAHSWDQnOfbvujAgsst2bTx
	IolAxlbYt4oYnDvzoX8K7m/e/6trtqU+NAIdCGc0DHF37dfdLwKeimVKI/JCA6pRKEdivxntlT9oe
	mdJATKrJSY+hVXe8ptP/iwtPkpXdk/wKhIQc/qDzlOHbEVuwcbt+vecYWiTaCgWC9718QloDmlorW
	E/2kRKJ1VdUgVf4t7I32SshUxkVNZ4l2DNZYPxydDdj7aQPESkGbJ2/PnCL6m7SnXPvXbrEo2pfgp
	JqHdlHYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9YMz-00A8Y3-AM; Fri, 30 Jul 2021 19:40:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m18W9-00F4jn-Cx
 for linux-i3c@lists.infradead.org; Wed, 07 Jul 2021 14:27:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625668031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R1b1MmqRg+JjTb9SqE3N1oUES1jMyS6VpEEII2IWGuk=;
 b=WYqw8YPX9h+A6o2jl49WcP7i3gvQwxD8jm8sHbxhtFXb0nZuVvtVZexyr98AppkyXudPiI
 KdY3gADvI3x6mAwkTpq8PoKaZR8c9tE2I+Z0ayqI4hXdpbyO48wjPuWtSUrDglKLKYzMvd
 FK7PLvy1QUlCDmS+cbyZvLztsTP6Il8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-CRo11BF7MI-sHiDKM9mjGw-1; Wed, 07 Jul 2021 10:25:26 -0400
X-MC-Unique: CRo11BF7MI-sHiDKM9mjGw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6AB71926DB0;
 Wed,  7 Jul 2021 14:25:20 +0000 (UTC)
Received: from [10.36.112.61] (ovpn-112-61.ams2.redhat.com [10.36.112.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E4E3919C66;
 Wed,  7 Jul 2021 14:24:39 +0000 (UTC)
Subject: Re: [PATCH v2 4/4] bus: Make remove callback return void
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel@pengutronix.de, Cornelia Huck <cohuck@redhat.com>,
 linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Geoff Levand <geoff@infradead.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Len Brown <lenb@kernel.org>, William Breathitt Gray
 <vilhelm.gray@gmail.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Ben Widawsky <ben.widawsky@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Vinod Koul <vkoul@kernel.org>, Stefan Richter <stefanr@s5r6.in-berlin.de>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Cristian Marussi <cristian.marussi@arm.com>, Wu Hao <hao.wu@intel.com>,
 Tom Rix <trix@redhat.com>, Moritz Fischer <mdf@kernel.org>,
 Jiri Kosina <jikos@kernel.org>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
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
 Jon Mason <jdmason@kudzu.us>, Allen Hubbe <allenbh@gmail.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede
 <hdegoede@redhat.com>, Mark Gross <mgross@linux.intel.com>,
 Matt Porter <mporter@kernel.crashing.org>,
 Alexandre Bounine <alex.bou9@gmail.com>, Ohad Ben-Cohen <ohad@wizery.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Thorsten Scherer <t.scherer@eckelmann.de>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Andy Gross <agross@kernel.org>, Mark Brown <broonie@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Michael Buesch <m@bues.ch>,
 Sven Van Asbroeck <TheSven73@gmail.com>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>, Andreas Noever <andreas.noever@gmail.com>,
 Michael Jamet <michael.jamet@intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Yehezkel Bernat <YehezkelShB@gmail.com>, Rob Herring <robh@kernel.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Martyn Welch <martyn@welchs.me.uk>, Manohar Vanga <manohar.vanga@gmail.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
 <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Johannes Berg <johannes@sipsolutions.net>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Marc Zyngier <maz@kernel.org>,
 Tyrel Datwyler <tyreld@linux.ibm.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Samuel Holland <samuel@sholland.org>, Qinglang Miao
 <miaoqinglang@huawei.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Joey Pabalan <jpabalanb@gmail.com>, =?UTF-8?Q?Pali_Roh=c3=a1r?=
 <pali@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Frank Li <lznuaa@gmail.com>, Mike Christie <michael.christie@oracle.com>,
 Bodo Stroesser <bostroesser@gmail.com>, Hannes Reinecke <hare@suse.de>,
 David Woodhouse <dwmw@amazon.co.uk>, SeongJae Park <sjpark@amazon.de>,
 Julien Grall <jgrall@amazon.com>, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-acpi@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-cxl@vger.kernel.org, nvdimm@lists.linux.dev,
 dmaengine@vger.kernel.org, linux1394-devel@lists.sourceforge.net,
 linux-fpga@vger.kernel.org, linux-input@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-i3c@lists.infradead.org, industrypack-devel@lists.sourceforge.net,
 linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
 netdev@vger.kernel.org, linux-ntb@googlegroups.com,
 linux-pci@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-scsi@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-staging@lists.linux.dev,
 greybus-dev@lists.linaro.org, target-devel@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-serial@vger.kernel.org,
 virtualization@lists.linux-foundation.org, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org, Russell King <rmk+kernel@armlinux.org.uk>,
 Johannes Thumshirn <jth@kernel.org>
References: <20210706154803.1631813-1-u.kleine-koenig@pengutronix.de>
 <20210706154803.1631813-5-u.kleine-koenig@pengutronix.de>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Message-ID: <5d3bf56e-285f-ecc1-ec64-384409645353@redhat.com>
Date: Wed, 7 Jul 2021 16:24:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210706154803.1631813-5-u.kleine-koenig@pengutronix.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=benjamin.tissoires@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210707_072713_563201_321322F8 
X-CRM114-Status: GOOD (  28.98  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

T24gNy82LzIxIDU6NDggUE0sIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOgo+IFRoZSBkcml2ZXIg
Y29yZSBpZ25vcmVzIHRoZSByZXR1cm4gdmFsdWUgb2YgdGhpcyBjYWxsYmFjayBiZWNhdXNlIHRo
ZXJlCj4gaXMgb25seSBsaXR0bGUgaXQgY2FuIGRvIHdoZW4gYSBkZXZpY2UgZGlzYXBwZWFycy4K
PiAKPiBUaGlzIGlzIHRoZSBmaW5hbCBiaXQgb2YgYSBsb25nIGxhc3RpbmcgY2xlYW51cCBxdWVz
dCB3aGVyZSBzZXZlcmFsCj4gYnVzZXMgd2VyZSBjb252ZXJ0ZWQgdG8gYWxzbyByZXR1cm4gdm9p
ZCBmcm9tIHRoZWlyIHJlbW92ZSBjYWxsYmFjay4KPiBBZGRpdGlvbmFsbHkgc29tZSByZXNvdXJj
ZSBsZWFrcyB3ZXJlIGZpeGVkIHRoYXQgd2VyZSBjYXVzZWQgYnkgZHJpdmVycwo+IHJldHVybmlu
ZyBhbiBlcnJvciBjb2RlIGluIHRoZSBleHBlY3RhdGlvbiB0aGF0IHRoZSBkcml2ZXIgd29uJ3Qg
Z28KPiBhd2F5Lgo+IAo+IFdpdGggc3RydWN0IGJ1c190eXBlOjpyZW1vdmUgcmV0dXJuaW5nIHZv
aWQgaXQncyBwcmV2ZW50ZWQgdGhhdCBuZXdseQo+IGltcGxlbWVudGVkIGJ1c2VzIHJldHVybiBh
biBpZ25vcmVkIGVycm9yIGNvZGUgYW5kIHNvIGRvbid0IGFudGljaXBhdGUKPiB3cm9uZyBleHBl
Y3RhdGlvbnMgZm9yIGRyaXZlciBhdXRob3JzLgo+IAo+IEFja2VkLWJ5OiBSdXNzZWxsIEtpbmcg
KE9yYWNsZSkgPHJtaytrZXJuZWxAYXJtbGludXgub3JnLnVrPiAoRm9yIEFSTSwgQW1iYSBhbmQg
cmVsYXRlZCBwYXJ0cykKPiBBY2tlZC1ieTogTWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwub3Jn
Pgo+IEFja2VkLWJ5OiBDaGVuLVl1IFRzYWkgPHdlbnNAY3NpZS5vcmc+IChmb3IgZHJpdmVycy9i
dXMvc3VueGktcnNiLmMpCj4gQWNrZWQtYnk6IFBhbGkgUm9ow6FyIDxwYWxpQGtlcm5lbC5vcmc+
Cj4gQWNrZWQtYnk6IE1hdXJvIENhcnZhbGhvIENoZWhhYiA8bWNoZWhhYkBrZXJuZWwub3JnPiAo
Zm9yIGRyaXZlcnMvbWVkaWEpCj4gQWNrZWQtYnk6IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJl
ZGhhdC5jb20+IChGb3IgZHJpdmVycy9wbGF0Zm9ybSkKPiBBY2tlZC1ieTogQWxleGFuZHJlIEJl
bGxvbmkgPGFsZXhhbmRyZS5iZWxsb25pQGJvb3RsaW4uY29tPgo+IEFja2VkLUJ5OiBWaW5vZCBL
b3VsIDx2a291bEBrZXJuZWwub3JnPgo+IEFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NA
c3VzZS5jb20+IChGb3IgWGVuKQo+IEFja2VkLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiAoRm9yIGRyaXZlcnMvbWZkKQo+IEFja2VkLWJ5OiBKb2hhbm5lcyBUaHVtc2hpcm4g
PGp0aEBrZXJuZWwub3JnPiAoRm9yIGRyaXZlcnMvbWNiKQo+IEFja2VkLWJ5OiBKb2hhbiBIb3Zv
bGQgPGpvaGFuQGtlcm5lbC5vcmc+Cj4gQWNrZWQtYnk6IFNyaW5pdmFzIEthbmRhZ2F0bGEgPHNy
aW5pdmFzLmthbmRhZ2F0bGFAbGluYXJvLm9yZz4gKEZvciBkcml2ZXJzL3NsaW1idXMpCj4gQWNr
ZWQtYnk6IEtpcnRpIFdhbmtoZWRlIDxrd2Fua2hlZGVAbnZpZGlhLmNvbT4gKEZvciBkcml2ZXJz
L3ZmaW8pCj4gQWNrZWQtYnk6IE1heGltaWxpYW4gTHV6IDxsdXptYXhpbWlsaWFuQGdtYWlsLmNv
bT4KPiBBY2tlZC1ieTogSGVpa2tpIEtyb2dlcnVzIDxoZWlra2kua3JvZ2VydXNAbGludXguaW50
ZWwuY29tPiAoRm9yIHVscGkgYW5kIHR5cGVjKQo+IEFja2VkLWJ5OiBTYW11ZWwgSWdsZXNpYXMg
R29uc8OhbHZleiA8c2lnbGVzaWFzQGlnYWxpYS5jb20+IChGb3IgaXBhY2spCj4gUmV2aWV3ZWQt
Ynk6IFRvbSBSaXggPHRyaXhAcmVkaGF0LmNvbT4gKEZvciBmcGdhKQo+IEFja2VkLWJ5OiBHZW9m
ZiBMZXZhbmQgPGdlb2ZmQGluZnJhZGVhZC5vcmc+IChGb3IgcHMzKQo+IFNpZ25lZC1vZmYtYnk6
IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Cj4gLS0t
Cj4gCgpbLi4uXQoKPiAgIGRyaXZlcnMvaGlkL2hpZC1jb3JlLmMgICAgICAgICAgICAgICAgICAg
IHwgNCArLS0tCj4gICBkcml2ZXJzL2hpZC9pbnRlbC1pc2gtaGlkL2lzaHRwL2J1cy5jICAgICB8
IDQgKy0tLQoKWy4uLl0KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaGlkL2hpZC1jb3JlLmMgYi9k
cml2ZXJzL2hpZC9oaWQtY29yZS5jCj4gaW5kZXggN2RiMzMyMTM5ZjdkLi5kYmVkMjUyNGZkNDcg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9oaWQvaGlkLWNvcmUuYwo+ICsrKyBiL2RyaXZlcnMvaGlk
L2hpZC1jb3JlLmMKPiBAQCAtMjMwMiw3ICsyMzAyLDcgQEAgc3RhdGljIGludCBoaWRfZGV2aWNl
X3Byb2JlKHN0cnVjdCBkZXZpY2UgKmRldikKPiAgIAlyZXR1cm4gcmV0Owo+ICAgfQo+ICAgCj4g
LXN0YXRpYyBpbnQgaGlkX2RldmljZV9yZW1vdmUoc3RydWN0IGRldmljZSAqZGV2KQo+ICtzdGF0
aWMgdm9pZCBoaWRfZGV2aWNlX3JlbW92ZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gICB7Cj4gICAJ
c3RydWN0IGhpZF9kZXZpY2UgKmhkZXYgPSB0b19oaWRfZGV2aWNlKGRldik7Cj4gICAJc3RydWN0
IGhpZF9kcml2ZXIgKmhkcnY7Cj4gQEAgLTIzMjIsOCArMjMyMiw2IEBAIHN0YXRpYyBpbnQgaGlk
X2RldmljZV9yZW1vdmUoc3RydWN0IGRldmljZSAqZGV2KQo+ICAgCj4gICAJaWYgKCFoZGV2LT5p
b19zdGFydGVkKQo+ICAgCQl1cCgmaGRldi0+ZHJpdmVyX2lucHV0X2xvY2spOwo+IC0KPiAtCXJl
dHVybiAwOwo+ICAgfQo+ICAgCj4gICBzdGF0aWMgc3NpemVfdCBtb2RhbGlhc19zaG93KHN0cnVj
dCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgKmEsCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvaGlkL2ludGVsLWlzaC1oaWQvaXNodHAvYnVzLmMgYi9kcml2ZXJzL2hpZC9pbnRl
bC1pc2gtaGlkL2lzaHRwL2J1cy5jCj4gaW5kZXggZjA4MDJiMDQ3ZWQ4Li44YTUxYmQ5Y2QwOTMg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9oaWQvaW50ZWwtaXNoLWhpZC9pc2h0cC9idXMuYwo+ICsr
KyBiL2RyaXZlcnMvaGlkL2ludGVsLWlzaC1oaWQvaXNodHAvYnVzLmMKPiBAQCAtMjU1LDcgKzI1
NSw3IEBAIHN0YXRpYyBpbnQgaXNodHBfY2xfYnVzX21hdGNoKHN0cnVjdCBkZXZpY2UgKmRldiwg
c3RydWN0IGRldmljZV9kcml2ZXIgKmRydikKPiAgICAqCj4gICAgKiBSZXR1cm46IFJldHVybiB2
YWx1ZSBmcm9tIGRyaXZlciByZW1vdmUoKSBjYWxsLgo+ICAgICovCj4gLXN0YXRpYyBpbnQgaXNo
dHBfY2xfZGV2aWNlX3JlbW92ZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gK3N0YXRpYyB2b2lkIGlz
aHRwX2NsX2RldmljZV9yZW1vdmUoc3RydWN0IGRldmljZSAqZGV2KQo+ICAgewo+ICAgCXN0cnVj
dCBpc2h0cF9jbF9kZXZpY2UgKmRldmljZSA9IHRvX2lzaHRwX2NsX2RldmljZShkZXYpOwo+ICAg
CXN0cnVjdCBpc2h0cF9jbF9kcml2ZXIgKmRyaXZlciA9IHRvX2lzaHRwX2NsX2RyaXZlcihkZXYt
PmRyaXZlcik7Cj4gQEAgLTI2Nyw4ICsyNjcsNiBAQCBzdGF0aWMgaW50IGlzaHRwX2NsX2Rldmlj
ZV9yZW1vdmUoc3RydWN0IGRldmljZSAqZGV2KQo+ICAgCj4gICAJaWYgKGRyaXZlci0+cmVtb3Zl
KQo+ICAgCQlkcml2ZXItPnJlbW92ZShkZXZpY2UpOwo+IC0KPiAtCXJldHVybiAwOwo+ICAgfQo+
ICAgCj4gICAvKioKCkZvciB0aGUgSElEIHBhcnQ6CgpBY2tlZC1ieTogQmVuamFtaW4gVGlzc29p
cmVzIDxiZW5qYW1pbi50aXNzb2lyZXNAcmVkaGF0LmNvbT4KCkNoZWVycywKQmVuamFtaW4KCgot
LSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
