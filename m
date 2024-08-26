Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC5EC5321E
	for <linux-i3c@archiver.kernel.org>; Mon, 26 Aug 2024 08:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JFtTvEPTsxQo8jG/X6f77eJBoGH0AjNjsH4Hnl3gETg=; b=JYbqj4Xvaw/6Ce
	vlolwbOgdZRHp0Vudp/+XuyGshsrGTUzbgDO1PcfUl5+jYtKLvxuedtq911PH/U3TPRQSNWmSYyYn
	IZMHmzIXv8hQZNEoUWQXRyUX8QVg7qjYUQhCDCMFAf94J8v6rh3XQHR7aptuFywsOz4PRA60PlrrZ
	ka+D3BWSAkBQbacQq69m8UrhgaRQnyhZiS6cYmbm92FZbyNYbv92EGjmgN+m86sF/6Z+d1eIw/qAp
	wnKtwApI0zMvajPdhypzE/64B5IKbVVp6aLVmXWiceIrGNq+gREXyYuTI4yFZ3mf/D39EVtt1Itke
	UZmtEu8EcQp7visMca1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siUiP-00000006OWs-3NZr;
	Mon, 26 Aug 2024 08:04:41 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siUiM-00000006OUX-1Y2F
	for linux-i3c@lists.infradead.org;
	Mon, 26 Aug 2024 08:04:40 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DDB761BF208;
	Mon, 26 Aug 2024 08:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724659473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AurFTrtp1smemYu9ihwDCUynli024FroYMUeOrMc90U=;
	b=SM85GEVRE3CtJNqzA1PYrBvQFq3wwh6N2Djf+FTXTBT/C299Z5LEfKgxidDsfaRoi3ZbxM
	QF4FfEDxijHbpHpD5UT342S3ARjQUenytbBBxN5NA1M2qpDSMz+Un+o58P77LJtdhC9fVq
	kGGXfrZWj1kiyWLt+xHfdJaPr3nczJ15gpgKQKet17E18D3h1zVBwzLZUQP8eQro/T6PKV
	kwNdp8Qn3+PQqi9/I4FccDRy2y6r8FWs+HnFqOrpvgr77ts0mjGrUYgjnDodJvGQy+Bvc1
	pC8nXq77cgdxg+18XS8H9yxN3GKabdTMwOxgNkSl8GEB75lYZU15TTP4FHno8w==
Date: Mon, 26 Aug 2024 10:04:30 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Parshuram Thombare <pthombar@cadence.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Boris Brezillon
 <bbrezillon@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Conor Culhane
 <conor.culhane@silvaco.com>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v3 03/11] i3c: master: Extend address status bit to 4
 and add I3C_ADDR_SLOT_EXT_INIT
Message-ID: <20240826100430.33194702@xps-13>
In-Reply-To: <ZsjNA9JV0UKONV32@lizhi-Precision-Tower-5810>
References: <20240819-i3c_fix-v3-0-7d69f7b0a05e@nxp.com>
	<20240819-i3c_fix-v3-3-7d69f7b0a05e@nxp.com>
	<20240823180426.056ac093@xps-13>
	<ZsjNA9JV0UKONV32@lizhi-Precision-Tower-5810>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_010439_231913_D6495BA3 
X-CRM114-Status: GOOD (  24.42  )
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

SGkgRnJhbmssCgpGcmFuay5saUBueHAuY29tIHdyb3RlIG9uIEZyaSwgMjMgQXVnIDIwMjQgMTM6
NTU6MTUgLTA0MDA6Cgo+IE9uIEZyaSwgQXVnIDIzLCAyMDI0IGF0IDA2OjA0OjI2UE0gKzAyMDAs
IE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBIaSBGcmFuaywKPiA+Cj4gPiAgCj4gPiA+ICBzdGF0
aWMgYm9vbCBpM2NfYnVzX2Rldl9hZGRyX2lzX2F2YWlsKHN0cnVjdCBpM2NfYnVzICpidXMsIHU4
IGFkZHIpCj4gPiA+ICB7Cj4gPiA+ICAJZW51bSBpM2NfYWRkcl9zbG90X3N0YXR1cyBzdGF0dXM7
Cj4gPiA+IEBAIC0zODgsNiArNDA1LDE0IEBAIHN0YXRpYyBpbnQgaTNjX2J1c19nZXRfZnJlZV9h
ZGRyKHN0cnVjdCBpM2NfYnVzICpidXMsIHU4IHN0YXJ0X2FkZHIpCj4gPiA+ICAJZW51bSBpM2Nf
YWRkcl9zbG90X3N0YXR1cyBzdGF0dXM7Cj4gPiA+ICAJdTggYWRkcjsKPiA+ID4KPiA+ID4gKwkv
KiB0cnkgZmluZCBhbiBhZGRyZXNzLCB3aGljaCBoYXZlIG5vdCBwcmUtYWxsb2NhdGVkIGJ5IGFz
c2lnbmVkLWFkZHJlc3MgKi8gIAo+ID4KPiA+IAlUcnkJdG8gZmluZAkJCWhhcyAgIGJlZW4KPiA+
Cj4gPiBwcmUtYWxsb2NhdGVkPwo+ID4gIAo+ID4gPiArCWZvciAoYWRkciA9IHN0YXJ0X2FkZHI7
IGFkZHIgPCBJM0NfTUFYX0FERFI7IGFkZHIrKykgewo+ID4gPiArCQlzdGF0dXMgPSBpM2NfYnVz
X2dldF9hZGRyX3Nsb3Rfc3RhdHVzX2V4dChidXMsIGFkZHIpOwo+ID4gPiArCQlpZiAoc3RhdHVz
ID09IEkzQ19BRERSX1NMT1RfRlJFRSkKPiA+ID4gKwkJCXJldHVybiBhZGRyOwo+ID4gPiArCX0K
PiA+ID4gKwo+ID4gPiArCS8qIHVzZSBwcmUtYWxsb2NvYXRlZCBieSBhc3NpZ25lZC1hZGRyZXNz
IGJlY2F1c2Ugc3VjaCBkZXZpY2Ugd2FzIHJlbW92ZWQgYXQgYnVzKi8gIAo+ID4KPiA+IAkgIFVz
ZSAgICAgIGFsbG9jYXRlZAo+ID4KPiA+IHByZS1hbGxvY2F0ZWQgb3IgYXNzaWduZWQ/Cj4gPgo+
ID4gSSBndWVzcyB0aGUgbG9naWMgc2hvdWxkIGJlOgo+ID4gLSB0cnkgdGhlIGFzc2lnbmVkLWFk
ZHJlc3MKPiA+IC0gbG9vayBmb3IgYSBmcmVlIHNsb3QKPiA+IC0gbG9vayBmb3IgYW4gYWxyZWFk
eSBpbiB1c2Ugc2xvdCB0aGF0IG11c3QgY29uY2VybiBhIGRpc2Nvbm5lY3RlZAo+ID4gICBkZXZp
Y2UKPiA+Cj4gPiBCdXQgdGhlIGNvbW1lbnRzIGFyZSBub3QgcHJlY2lzZSBlbm91Z2ggSU1ITy4g
Q2FuIHlvdSByZXBocmFzZSB0aGVtPyAgCj4gCj4gSG93IGFib3V0Ogo+IAo+IEZvbGxvdyB0aGUg
c3RlcHMgYmVsb3cgdG8gb2J0YWluIHRoZSBJM0MgZHluYW1pYyBhZGRyZXNzOgo+IAo+IDEuIFJl
dHJpZXZlIHRoZSBhc3NpZ25lZC1hZGRyZXNzIGZyb20gdGhlIGRldmljZSB0cmVlIChEVCkuCgpJ
IGd1ZXNzIGhlcmUgeW91IG1lYW4gdGhhdCB5b3UgdHJ5IHRvIHBpY2sgdGhhdCBhZGRyZXNzLCB1
bmxlc3MgaWYKYWxyZWFkeSBpbiB1c2Ugb24gdGhlIGJ1cywgcmlnaHQ/Cgo+IDIuIExvb2sgZm9y
IGFuIGF2YWlsYWJsZSBzbG90IGFkZHJlc3MuCgoiYXZhaWxhYmxlIGFkZHJlc3Mgc2xvdCI/Cgo+
IDMuIExvb2sgZm9yIGFuIGFkZHJlc3MgdGhhdCBpcyBwcmUtcmVzZXJ2ZWQgYnkgYW5vdGhlciBk
ZXZpY2Ugd2l0aAo+IGFzc2lnbmVkLWFkZHJlc3MgaW4gRFQsIGJ1dCB3aGVyZSB0aGUgZGV2aWNl
IGlzIGN1cnJlbnRseSBvZmZsaW5lLgoKSSBkb24ndCB0aGluayB0aGlzIHBhcnQgaXMgcHJlY2lz
ZSBlbm91Z2guIFlvdSBkb24ndCBsb29rIGZvciBhZGRyZXNzZXMKInByZS1yZXNlcnZlZCIgYnV0
IHJhdGhlciBtb3JlIGZvciBidXN5IGFkZHJlc3Mgc2xvdHMsIHdoaWNoIG1pZ2h0IG5vCmxvbmdl
ciBiZSBpbi11c2UgYmVjYXVzZSB0aGUgZGV2aWNlIGlzIGN1cnJlbnRseSBvZmZsaW5lLiBUaGUg
ZmFjdCB0aGF0CnRoZSBzbG90IG1pZ2h0IGhhdmUgYmVlbiBwcmUtcmVzZXJ2ZWQgaW4gdGhlIERU
IGlzIGEgZGV0YWlsIHRoYXQgbWF5LAppbiBzb21lIGNhc2VzLCBub3QgYmUgdHJ1ZS4gQW5kIGFz
IGZhciBhcyBJIHVuZGVyc3RhbmQgeW91ciBjaGFuZ2VzLAp5b3UncmUgbm90IGNoZWNraW5nIHRo
ZSBEVCBhZGRyZXNzZXMgYnV0IHJhdGhlciBtb3JlIHRoZSBhZGRyZXNzZXMgdGhhdApoYXZlIGJl
ZW4gYWxsb2NhdGVkIGxpdmUgKHdoaWNoIGlzIGFueXdheSBiZXR0ZXIsIGJlY2F1c2UgaTNjIG1p
Z2h0CnZlcnkgd2VsbCBiZSB1c2VkIG9uIGEgIU9GIHBsYXRmb3JtKS4KCk9uY2Ugd2Ugc2V0dGxl
IG9uIGEgZGVzY3JpcHRpb24sIG1heWJlIHRoaXMgY2FuIGJlIHBhcnQgb2YgdGhlIGtkb2MgZm9y
CnRoZSBtYWluIGZ1bmN0aW9uIHNlYXJjaGluZyBmb3IgdGhlIGJlc3QgZHluYW1pYyBhZGRyZXNz
PwoKVGhhbmtzLApNaXF1w6hsCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWkzYwo=
