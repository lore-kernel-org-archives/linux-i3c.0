Return-Path: <SRS0=peef=MW=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3DD9C19F3A
	for <linux-i3c@archiver.kernel.org>; Fri, 30 Jul 2021 19:40:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A848560F26
	for <linux-i3c@archiver.kernel.org>; Fri, 30 Jul 2021 19:40:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A848560F26
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/pD7fNtbiJ/TbZ8QZaH77ersNKbUSMpGkZ+73ptU0t4=; b=I5smeTsjQlz2nR
	/yrnAWrIRwqeo5UNqlEGTd5tMdCgAtQK7OGKMiRVoPNV4fJOskKM/XH9Xwk2DC6pOMhZZ2S3tsZKr
	QHEC3qgt2aXgqDk8DHheKsQ320VUKEcv1zpZ3oWlbEw9ImahBZdBLreHjQ9xA7eQI1vVVFmaHnCdL
	wVh7RV6UXAySYZvtTxeAT0OO3eovIWR1hmqlPlfnSV46XvPLDwCcaChCP85Kb7e2NyOUcKtBiJvmO
	UeFV+tT9kqjQwiWfIfrypAm+QJWMwxUKneCRVApUb7IYhideoLhs+x/z/WRSo3ppR3JOoOZAVvnzU
	LCbopHQm+WHt6nCy3NYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9YMu-00A8R4-7C; Fri, 30 Jul 2021 19:40:28 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0j5S-00BEwp-7N
 for linux-i3c@lists.infradead.org; Tue, 06 Jul 2021 11:18:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625570277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X+JgLl9QuEVsbPi9CHfgp/50dUcjaNVT1a3Q1xwSglg=;
 b=NvkXANPVY3BU9Z47a7WIgfyX99b/fX2R3+gkXRx5UbLe8xvk+4bD/GEsafqgWAgCsYHYU8
 8nqBRHRtdxTI/pAS0l9vErZyBvTg8xpzogppN68KAaDJjHkwpk3omwvyH4EL4uXOjv8Gqy
 vLNHZHbOCB1P+W+L0k2ttO2FFWZdnW4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-yIaEybclO9Gf3dSvLShqRA-1; Tue, 06 Jul 2021 07:17:55 -0400
X-MC-Unique: yIaEybclO9Gf3dSvLShqRA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 966CD802C87;
 Tue,  6 Jul 2021 11:17:49 +0000 (UTC)
Received: from localhost (ovpn-113-13.ams2.redhat.com [10.36.113.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2FC1919C79;
 Tue,  6 Jul 2021 11:17:39 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel@pengutronix.de, linux-kernel@vger.kernel.org, Russell King
 <linux@armlinux.org.uk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge
 Deller <deller@gmx.de>, Geoff Levand <geoff@infradead.org>, Michael
 Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, "Rafael J.
 Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, William
 Breathitt Gray <vilhelm.gray@gmail.com>, =?utf-8?Q?Rafa=C5=82_Mi=C5=82eck?=
 =?utf-8?Q?i?= <zajec5@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Alison Schofield
 <alison.schofield@intel.com>, Vishal Verma <vishal.l.verma@intel.com>, Ira
 Weiny <ira.weiny@intel.com>, Ben Widawsky <ben.widawsky@intel.com>, Dan
 Williams <dan.j.williams@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Vinod Koul <vkoul@kernel.org>, Stefan Richter <stefanr@s5r6.in-berlin.de>,
 Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi
 <cristian.marussi@arm.com>, Wu Hao <hao.wu@intel.com>, Tom Rix
 <trix@redhat.com>, Moritz Fischer <mdf@kernel.org>, Jiri Kosina
 <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, "K. Y.
 Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Wolfram Sang <wsa@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Samuel Iglesias Gonsalvez
 <siglesias@igalia.com>, Jens Taprogge <jens.taprogge@taprogge.org>,
 Johannes Thumshirn <morbidrsa@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Maxim Levitsky <maximlevitsky@gmail.com>, Alex Dubov
 <oakad@yahoo.com>, Ulf Hansson <ulf.hansson@linaro.org>, Lee Jones
 <lee.jones@linaro.org>, Tomas Winkler <tomas.winkler@intel.com>, Arnd
 Bergmann <arnd@arndb.de>, Jakub Kicinski <kuba@kernel.org>, "David S.
 Miller" <davem@davemloft.net>, Jon Mason <jdmason@kudzu.us>, Allen Hubbe
 <allenbh@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>, Lorenzo
 Pieralisi <lorenzo.pieralisi@arm.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84sk?=
 =?utf-8?Q?i?=
 <kw@linux.com>, Bjorn Helgaas <bhelgaas@google.com>, Dominik Brodowski
 <linux@dominikbrodowski.net>, Maximilian Luz <luzmaximilian@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Gross <mgross@linux.intel.com>,
 Matt Porter <mporter@kernel.crashing.org>, Alexandre Bounine
 <alex.bou9@gmail.com>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Thorsten Scherer <t.scherer@eckelmann.de>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Andy Gross
 <agross@kernel.org>, Mark Brown <broonie@kernel.org>, Stephen Boyd
 <sboyd@kernel.org>, Michael Buesch <m@bues.ch>, Sven Van Asbroeck
 <TheSven73@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder
 <elder@kernel.org>, Andreas Noever <andreas.noever@gmail.com>, Michael
 Jamet <michael.jamet@intel.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, Yehezkel Bernat
 <YehezkelShB@gmail.com>, Rob Herring <robh@kernel.org>, Jiri Slaby
 <jirislaby@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Alex Williamson
 <alex.williamson@redhat.com>, Martyn Welch <martyn@welchs.me.uk>, Manohar
 Vanga <manohar.vanga@gmail.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Johannes Berg
 <johannes@sipsolutions.net>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>, Marc Zyngier <maz@kernel.org>, Tyrel Datwyler
 <tyreld@linux.ibm.com>, Vladimir Zapolskiy <vz@mleia.com>, Samuel Holland
 <samuel@sholland.org>, Qinglang Miao <miaoqinglang@huawei.com>, Alexey
 Kardashevskiy <aik@ozlabs.ru>, Kai-Heng Feng
 <kai.heng.feng@canonical.com>, Joey Pabalan <jpabalanb@gmail.com>, Pali
 =?utf-8?Q?Roh=C3=A1r?= <pali@kernel.org>, Adrian Hunter
 <adrian.hunter@intel.com>, Frank Li
 <lznuaa@gmail.com>, Mike Christie <michael.christie@oracle.com>, Bodo
 Stroesser <bostroesser@gmail.com>, Hannes Reinecke <hare@suse.de>, David
 Woodhouse <dwmw@amazon.co.uk>, SeongJae Park <sjpark@amazon.de>, Julien
 Grall <jgrall@amazon.com>, linux-arm-kernel@lists.infradead.org,
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
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH] bus: Make remove callback return void
In-Reply-To: <87pmvvhfqq.fsf@redhat.com>
Organization: Red Hat GmbH
References: <20210706095037.1425211-1-u.kleine-koenig@pengutronix.de>
 <87pmvvhfqq.fsf@redhat.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Tue, 06 Jul 2021 13:17:37 +0200
Message-ID: <87mtqzhesu.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_041758_391000_2E2B91D5 
X-CRM114-Status: GOOD (  26.98  )
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

T24gVHVlLCBKdWwgMDYgMjAyMSwgQ29ybmVsaWEgSHVjayA8Y29odWNrQHJlZGhhdC5jb20+IHdy
b3RlOgoKPiBPbiBUdWUsIEp1bCAwNiAyMDIxLCBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUt
a29lbmlnQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPgo+PiBUaGUgZHJpdmVyIGNvcmUgaWdub3Jl
cyB0aGUgcmV0dXJuIHZhbHVlIG9mIHRoaXMgY2FsbGJhY2sgYmVjYXVzZSB0aGVyZQo+PiBpcyBv
bmx5IGxpdHRsZSBpdCBjYW4gZG8gd2hlbiBhIGRldmljZSBkaXNhcHBlYXJzLgo+Pgo+PiBUaGlz
IGlzIHRoZSBmaW5hbCBiaXQgb2YgYSBsb25nIGxhc3RpbmcgY2xlYW51cCBxdWVzdCB3aGVyZSBz
ZXZlcmFsCj4+IGJ1c2VzIHdlcmUgY29udmVydGVkIHRvIGFsc28gcmV0dXJuIHZvaWQgZnJvbSB0
aGVpciByZW1vdmUgY2FsbGJhY2suCj4+IEFkZGl0aW9uYWxseSBzb21lIHJlc291cmNlIGxlYWtz
IHdlcmUgZml4ZWQgdGhhdCB3ZXJlIGNhdXNlZCBieSBkcml2ZXJzCj4+IHJldHVybmluZyBhbiBl
cnJvciBjb2RlIGluIHRoZSBleHBlY3RhdGlvbiB0aGF0IHRoZSBkcml2ZXIgd29uJ3QgZ28KPj4g
YXdheS4KPj4KPj4gV2l0aCBzdHJ1Y3QgYnVzX3R5cGU6OnJlbW92ZSByZXR1cm5pbmcgdm9pZCBp
dCdzIHByZXZlbnRlZCB0aGF0IG5ld2x5Cj4+IGltcGxlbWVudGVkIGJ1c2VzIHJldHVybiBhbiBp
Z25vcmVkIGVycm9yIGNvZGUgYW5kIHNvIGRvbid0IGFudGljaXBhdGUKPj4gd3JvbmcgZXhwZWN0
YXRpb25zIGZvciBkcml2ZXIgYXV0aG9ycy4KPgo+IFlheSEKPgo+Pgo+PiBTaWduZWQtb2ZmLWJ5
OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgo+PiAt
LS0KPj4gSGVsbG8sCj4+Cj4+IHRoaXMgcGF0Y2ggZGVwZW5kcyBvbiAiUENJOiBlbmRwb2ludDog
TWFrZSBzdHJ1Y3QgcGNpX2VwZl9kcml2ZXI6OnJlbW92ZQo+PiByZXR1cm4gdm9pZCIgdGhhdCBp
cyBub3QgeWV0IGFwcGxpZWQsIHNlZQo+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjEw
MjIzMDkwNzU3LjU3NjA0LTEtdS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlLgo+Pgo+PiBJ
IHRlc3RlZCBpdCB1c2luZyBhbGxtb2Rjb25maWcgb24gYW1kNjQgYW5kIGFybSwgYnV0IEkgd291
bGRuJ3QgYmUKPj4gc3VycHJpc2VkIGlmIEkgc3RpbGwgbWlzc2VkIHRvIGNvbnZlcnQgYSBkcml2
ZXIuIFNvIGl0IHdvdWxkIGJlIGdyZWF0IHRvCj4+IGdldCB0aGlzIGludG8gbmV4dCBlYXJseSBh
ZnRlciB0aGUgbWVyZ2Ugd2luZG93IGNsb3Nlcy4KPgo+IEknbSBhZnJhaWQgeW91IG1pc3NlZCB0
aGUgczM5MC1zcGVjaWZpYyBidXNzZXMgaW4gZHJpdmVycy9zMzkwL2Npby8KPiAoY3NzL2Njdy9j
Y3dncm91cCkuCgpUaGUgY2hhbmdlIGZvciB2ZmlvL21kZXYgbG9va3MgZ29vZC4KClRoZSBmb2xs
b3dpbmcgc2hvdWxkIGRvIHRoZSB0cmljayBmb3IgczM5MDsgbm90IHN1cmUgaWYgb3RoZXIKYXJj
aGl0ZWN0dXJlcyBoYXZlIGVhc3ktdG8tbWlzcyBidXNzZXMgYXMgd2VsbC4KCmRpZmYgLS1naXQg
YS9kcml2ZXJzL3MzOTAvY2lvL2Njd2dyb3VwLmMgYi9kcml2ZXJzL3MzOTAvY2lvL2Njd2dyb3Vw
LmMKaW5kZXggOTc0ODE2NWUwOGU5Li5hNjZmNDE2MTM4YWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
czM5MC9jaW8vY2N3Z3JvdXAuYworKysgYi9kcml2ZXJzL3MzOTAvY2lvL2Njd2dyb3VwLmMKQEAg
LTQzOSwxNyArNDM5LDE1IEBAIG1vZHVsZV9leGl0KGNsZWFudXBfY2N3Z3JvdXApOwogCiAvKioq
KioqKioqKioqKioqKioqKioqKioqKiogZHJpdmVyIHN0dWZmICoqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKi8KIAotc3RhdGljIGludCBjY3dncm91cF9yZW1vdmUoc3RydWN0IGRldmljZSAq
ZGV2KQorc3RhdGljIHZvaWQgY2N3Z3JvdXBfcmVtb3ZlKHN0cnVjdCBkZXZpY2UgKmRldikKIHsK
IAlzdHJ1Y3QgY2N3Z3JvdXBfZGV2aWNlICpnZGV2ID0gdG9fY2N3Z3JvdXBkZXYoZGV2KTsKIAlz
dHJ1Y3QgY2N3Z3JvdXBfZHJpdmVyICpnZHJ2ID0gdG9fY2N3Z3JvdXBkcnYoZGV2LT5kcml2ZXIp
OwogCiAJaWYgKCFkZXYtPmRyaXZlcikKLQkJcmV0dXJuIDA7CisJCXJldHVybjsKIAlpZiAoZ2Ry
di0+cmVtb3ZlKQogCQlnZHJ2LT5yZW1vdmUoZ2Rldik7Ci0KLQlyZXR1cm4gMDsKIH0KIAogc3Rh
dGljIHZvaWQgY2N3Z3JvdXBfc2h1dGRvd24oc3RydWN0IGRldmljZSAqZGV2KQpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9zMzkwL2Npby9jc3MuYyBiL2RyaXZlcnMvczM5MC9jaW8vY3NzLmMKaW5kZXgg
YTk3NDk0M2MyN2RhLi5lYmMzMjFlZGJhNTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvczM5MC9jaW8v
Y3NzLmMKKysrIGIvZHJpdmVycy9zMzkwL2Npby9jc3MuYwpAQCAtMTM3MSwxNSArMTM3MSwxNCBA
QCBzdGF0aWMgaW50IGNzc19wcm9iZShzdHJ1Y3QgZGV2aWNlICpkZXYpCiAJcmV0dXJuIHJldDsK
IH0KIAotc3RhdGljIGludCBjc3NfcmVtb3ZlKHN0cnVjdCBkZXZpY2UgKmRldikKK3N0YXRpYyB2
b2lkIGNzc19yZW1vdmUoc3RydWN0IGRldmljZSAqZGV2KQogewogCXN0cnVjdCBzdWJjaGFubmVs
ICpzY2g7Ci0JaW50IHJldDsKIAogCXNjaCA9IHRvX3N1YmNoYW5uZWwoZGV2KTsKLQlyZXQgPSBz
Y2gtPmRyaXZlci0+cmVtb3ZlID8gc2NoLT5kcml2ZXItPnJlbW92ZShzY2gpIDogMDsKKwlpZiAo
c2NoLT5kcml2ZXItPnJlbW92ZSkKKwkJc2NoLT5kcml2ZXItPnJlbW92ZShzY2gpOwogCXNjaC0+
ZHJpdmVyID0gTlVMTDsKLQlyZXR1cm4gcmV0OwogfQogCiBzdGF0aWMgdm9pZCBjc3Nfc2h1dGRv
d24oc3RydWN0IGRldmljZSAqZGV2KQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zMzkwL2Npby9kZXZp
Y2UuYyBiL2RyaXZlcnMvczM5MC9jaW8vZGV2aWNlLmMKaW5kZXggODRmNjU5Y2FmZTc2Li42MWQ1
ZDU1YmQ5YzggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvczM5MC9jaW8vZGV2aWNlLmMKKysrIGIvZHJp
dmVycy9zMzkwL2Npby9kZXZpY2UuYwpAQCAtMTc0Miw3ICsxNzQyLDcgQEAgY2N3X2RldmljZV9w
cm9iZSAoc3RydWN0IGRldmljZSAqZGV2KQogCXJldHVybiAwOwogfQogCi1zdGF0aWMgaW50IGNj
d19kZXZpY2VfcmVtb3ZlKHN0cnVjdCBkZXZpY2UgKmRldikKK3N0YXRpYyB2b2lkIGNjd19kZXZp
Y2VfcmVtb3ZlKHN0cnVjdCBkZXZpY2UgKmRldikKIHsKIAlzdHJ1Y3QgY2N3X2RldmljZSAqY2Rl
diA9IHRvX2Njd2RldihkZXYpOwogCXN0cnVjdCBjY3dfZHJpdmVyICpjZHJ2ID0gY2Rldi0+ZHJ2
OwpAQCAtMTc3Niw4ICsxNzc2LDYgQEAgc3RhdGljIGludCBjY3dfZGV2aWNlX3JlbW92ZShzdHJ1
Y3QgZGV2aWNlICpkZXYpCiAJc3Bpbl91bmxvY2tfaXJxKGNkZXYtPmNjd2xvY2spOwogCWlvX3N1
YmNoYW5uZWxfcXVpZXNjZShzY2gpOwogCV9fZGlzYWJsZV9jbWYoY2Rldik7Ci0KLQlyZXR1cm4g
MDsKIH0KIAogc3RhdGljIHZvaWQgY2N3X2RldmljZV9zaHV0ZG93bihzdHJ1Y3QgZGV2aWNlICpk
ZXYpCmRpZmYgLS1naXQgYS9kcml2ZXJzL3MzOTAvY2lvL3NjbS5jIGIvZHJpdmVycy9zMzkwL2Np
by9zY20uYwppbmRleCA5ZjI2ZDQzMTBiYjMuLmI2YjQ1ODljNzBiZCAxMDA2NDQKLS0tIGEvZHJp
dmVycy9zMzkwL2Npby9zY20uYworKysgYi9kcml2ZXJzL3MzOTAvY2lvL3NjbS5jCkBAIC0yOCwx
MiArMjgsMTMgQEAgc3RhdGljIGludCBzY21kZXZfcHJvYmUoc3RydWN0IGRldmljZSAqZGV2KQog
CXJldHVybiBzY21kcnYtPnByb2JlID8gc2NtZHJ2LT5wcm9iZShzY21kZXYpIDogLUVOT0RFVjsK
IH0KIAotc3RhdGljIGludCBzY21kZXZfcmVtb3ZlKHN0cnVjdCBkZXZpY2UgKmRldikKK3N0YXRp
YyB2b2lkIHNjbWRldl9yZW1vdmUoc3RydWN0IGRldmljZSAqZGV2KQogewogCXN0cnVjdCBzY21f
ZGV2aWNlICpzY21kZXYgPSB0b19zY21fZGV2KGRldik7CiAJc3RydWN0IHNjbV9kcml2ZXIgKnNj
bWRydiA9IHRvX3NjbV9kcnYoZGV2LT5kcml2ZXIpOwogCi0JcmV0dXJuIHNjbWRydi0+cmVtb3Zl
ID8gc2NtZHJ2LT5yZW1vdmUoc2NtZGV2KSA6IC1FTk9ERVY7CisJaWYgKHNjbWRydi0+cmVtb3Zl
KQorCQlzY21kcnYtPnJlbW92ZShzY21kZXYpOwogfQogCiBzdGF0aWMgaW50IHNjbWRldl91ZXZl
bnQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3Qga29ial91ZXZlbnRfZW52ICplbnYpCmRpZmYg
LS1naXQgYS9kcml2ZXJzL3MzOTAvY3J5cHRvL2FwX2J1cy5jIGIvZHJpdmVycy9zMzkwL2NyeXB0
by9hcF9idXMuYwppbmRleCBkMjU2MDE4NmQ3NzEuLjhhMGQzN2MwZTJhNSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9zMzkwL2NyeXB0by9hcF9idXMuYworKysgYi9kcml2ZXJzL3MzOTAvY3J5cHRvL2Fw
X2J1cy5jCkBAIC04ODQsNyArODg0LDcgQEAgc3RhdGljIGludCBhcF9kZXZpY2VfcHJvYmUoc3Ry
dWN0IGRldmljZSAqZGV2KQogCXJldHVybiByYzsKIH0KIAotc3RhdGljIGludCBhcF9kZXZpY2Vf
cmVtb3ZlKHN0cnVjdCBkZXZpY2UgKmRldikKK3N0YXRpYyB2b2lkIGFwX2RldmljZV9yZW1vdmUo
c3RydWN0IGRldmljZSAqZGV2KQogewogCXN0cnVjdCBhcF9kZXZpY2UgKmFwX2RldiA9IHRvX2Fw
X2RldihkZXYpOwogCXN0cnVjdCBhcF9kcml2ZXIgKmFwX2RydiA9IGFwX2Rldi0+ZHJ2OwpAQCAt
OTA5LDggKzkwOSw2IEBAIHN0YXRpYyBpbnQgYXBfZGV2aWNlX3JlbW92ZShzdHJ1Y3QgZGV2aWNl
ICpkZXYpCiAJYXBfZGV2LT5kcnYgPSBOVUxMOwogCiAJcHV0X2RldmljZShkZXYpOwotCi0JcmV0
dXJuIDA7CiB9CiAKIHN0cnVjdCBhcF9xdWV1ZSAqYXBfZ2V0X3FkZXYoYXBfcWlkX3QgcWlkKQoK
Ci0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
