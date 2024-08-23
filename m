Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37761C531DC
	for <linux-i3c@archiver.kernel.org>; Fri, 23 Aug 2024 16:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tOoCTIm0ZbieWKEQaig54dMTdQDRGvjckoEoCwtxUzw=; b=X2qgrwotzRI/d/
	mmjAx0Th9I7wI2VRlBg5tEIwOkOJ3/ugQ5z0efr9a2x7xbJReebA62l2OEZWOzXdtdgcjgInUy3SE
	1ICHghk6hEkGcrKE8HNjH87Wr7zM6Z9cY0rWiHkvzuhWS5iCKlLpq0fX8iM9ZdHD5Hy5ZNsa3XUkN
	MzHwubHsrSIoa66SHn/rb3EqAqSfWVhQrAafwTNutmzn3JdRjH+N3mY2rwwfpBJaJl7lMi9NIpkb3
	t0fH8YUHEMYNsMCTX1xHv35jjg3mfBNg6YCsQFefj2L7lCyf+pDtSVtgXc+8KkA8zBCMOWeLMSOMB
	dyJYiJNq4sgrpQ05uv8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shX5L-0000000HXxZ-2djq;
	Fri, 23 Aug 2024 16:24:23 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shX5I-0000000HXwW-29qy
	for linux-i3c@lists.infradead.org;
	Fri, 23 Aug 2024 16:24:22 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 677DB1BF209;
	Fri, 23 Aug 2024 16:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724430258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h1vZPt/dBcDYDQ0mp2GaU66eD+tAIsEG5O9GhWlpdXI=;
	b=jdyx02Pv1cUl9X6jJRVEPrHP+O4CHcA+e2qnqfSUDKpTiM1pcOtu+gRdMjDT7Lc5KeNTy5
	QdJckxIcKreRCrjJ5uWLDyqD1iPWX6fvCUNcxiJkRRDPmxnQRdlrPmL8pkK1FnVabNmYWb
	K2mg3j2Cc+1S7jebKgxgnCY+ddyDW5ymhEr8YnOcGsbEwDNNBpDqzuAbLnHs3P28qh/8fh
	O4ovRNC1Z7Whx2saeY2D1/l+VCzMHswrKRcnMFQ1NBX3TiKs5hZAGBQPSkNM6o71Di5h0A
	30cydmV27n76AYxneoVqS9yPWyS5NQQeJdb6SRSOTTdHrqxyeCOJPTCXOSvkeg==
Date: Fri, 23 Aug 2024 18:24:16 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Parshuram Thombare <pthombar@cadence.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Boris Brezillon
 <bbrezillon@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Conor Culhane
 <conor.culhane@silvaco.com>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, stable@kernel.org
Subject: Re: [PATCH v3 11/11] i3c: master: svc: fix possible assignment of
 the same address to two devices
Message-ID: <20240823182416.33744666@xps-13>
In-Reply-To: <20240819-i3c_fix-v3-11-7d69f7b0a05e@nxp.com>
References: <20240819-i3c_fix-v3-0-7d69f7b0a05e@nxp.com>
	<20240819-i3c_fix-v3-11-7d69f7b0a05e@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_092420_872037_E31B5D5D 
X-CRM114-Status: GOOD (  21.26  )
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

SGkgRnJhbmssCgpGcmFuay5MaUBueHAuY29tIHdyb3RlIG9uIE1vbiwgMTkgQXVnIDIwMjQgMTI6
MDI6MDUgLTA0MDA6Cgo+IHN2Y19pM2NfbWFzdGVyX2RvX2RhYSgpIHsKPiAgICAgLi4uCj4gICAg
IGZvciAoaSA9IDA7IGkgPCBkZXZfbmI7IGkrKykgewo+ICAgICAgICAgcmV0ID0gaTNjX21hc3Rl
cl9hZGRfaTNjX2Rldl9sb2NrZWQobSwgYWRkcnNbaV0pOwo+ICAgICAgICAgaWYgKHJldCkKPiAg
ICAgICAgICAgICBnb3RvIHJwbV9vdXQ7Cj4gICAgIH0KPiB9Cj4gCj4gSWYgdHdvIGRldmljZXMg
KEEgYW5kIEIpIGFyZSBkZXRlY3RlZCBpbiBEQUEgYW5kIGFkZHJlc3MgMHhhIGlzIGFzc2lnbmVk
IHRvCj4gZGV2aWNlIEEgYW5kIDB4YiB0byBkZXZpY2UgQiwgYSBmYWlsdXJlIGluIGkzY19tYXN0
ZXJfYWRkX2kzY19kZXZfbG9ja2VkKCkKPiBmb3IgZGV2aWNlIEEgKGFkZHI6IDB4YSkgY291bGQg
cHJldmVudCBkZXZpY2UgQiAoYWRkcjogMHhiKSBmcm9tIGJlaW5nCj4gcmVnaXN0ZXJlZCBvbiB0
aGUgYnVzLiBUaGUgSTNDIHN0YWNrIG1pZ2h0IHN0aWxsIGNvbnNpZGVyIDB4YiBhIGZyZWUKPiBh
ZGRyZXNzLiBJZiBhIHN1YnNlcXVlbnQgSG90am9pbiBvY2N1cnMsIDB4YiBtaWdodCBiZSBhc3Np
Z25lZCB0byBEZXZpY2UgQSwKPiBjYXVzaW5nIGJvdGggZGV2aWNlcyBBIGFuZCBCIHRvIHVzZSB0
aGUgc2FtZSBhZGRyZXNzIDB4YiwgdmlvbGF0aW5nIHRoZSBJM0MKPiBzcGVjaWZpY2F0aW9uLgo+
IAo+IFRoZSByZXR1cm4gdmFsdWUgZm9yIGkzY19tYXN0ZXJfYWRkX2kzY19kZXZfbG9ja2VkKCkg
c2hvdWxkIG5vdCBiZSBjaGVja2VkCj4gYmVjYXVzZSBzdWJzZXF1ZW50IHN0ZXBzIHdpbGwgc2Nh
biB0aGUgZW50aXJlIEkzQyBidXMsIGluZGVwZW5kZW50IG9mCj4gd2hldGhlciBpM2NfbWFzdGVy
X2FkZF9pM2NfZGV2X2xvY2tlZCgpIHJldHVybnMgc3VjY2Vzcy4KPiAKPiBJZiBkZXZpY2UgQSBy
ZWdpc3RyYXRpb24gZmFpbHMsIHRoZXJlIGlzIHN0aWxsIGEgY2hhbmNlIHRvIHJlZ2lzdGVyIGRl
dmljZQo+IEIuIGkzY19tYXN0ZXJfYWRkX2kzY19kZXZfbG9ja2VkKCkgY2FuIHJlc2V0IERBQSBp
ZiBhIGZhaWx1cmUgb2NjdXJzIHdoaWxlCj4gcmV0cmlldmluZyBkZXZpY2UgaW5mb3JtYXRpb24u
Cj4gCj4gQ2M6IHN0YWJsZUBrZXJuZWwub3JnCj4gRml4ZXM6IDMxN2JhY2Y5NjBhNCAoImkzYzog
bWFzdGVyOiBhZGQgZW5hYmxlKGRpc2FibGUpIGhvdCBqb2luIGluIHN5cyBlbnRyeSIpCj4gU2ln
bmVkLW9mZi1ieTogRnJhbmsgTGkgPEZyYW5rLkxpQG54cC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMv
aTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jIHwgNyArKy0tLS0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jIGIvZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1p
M2MtbWFzdGVyLmMKPiBpbmRleCAyMDEwNDk1OTA2ZWIzLi4wMDM1NjVmZGRjMjYxIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jCj4gKysrIGIvZHJpdmVy
cy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMKPiBAQCAtMTA0MiwxMSArMTA0Miw4IEBAIHN0
YXRpYyBpbnQgc3ZjX2kzY19tYXN0ZXJfZG9fZGFhKHN0cnVjdCBpM2NfbWFzdGVyX2NvbnRyb2xs
ZXIgKm0pCj4gIAkJZ290byBycG1fb3V0Owo+ICAKPiAgCS8qIFJlZ2lzdGVyIGFsbCBkZXZpY2Vz
IHdobyBwYXJ0aWNpcGF0ZWQgdG8gdGhlIGNvcmUgKi8KPiAtCWZvciAoaSA9IDA7IGkgPCBkZXZf
bmI7IGkrKykgewo+IC0JCXJldCA9IGkzY19tYXN0ZXJfYWRkX2kzY19kZXZfbG9ja2VkKG0sIGFk
ZHJzW2ldKTsKPiAtCQlpZiAocmV0KQo+IC0JCQlnb3RvIHJwbV9vdXQ7Cj4gLQl9Cj4gKwlmb3Ig
KGkgPSAwOyBpIDwgZGV2X25iOyBpKyspCj4gKwkJaTNjX21hc3Rlcl9hZGRfaTNjX2Rldl9sb2Nr
ZWQobSwgYWRkcnNbaV0pOwoKTWFrZXMgc2Vuc2UsIGJ1dCBwbGVhc2UgZXhwbGFpbiB3aHkgZG9u
J3QgY2hlY2sgdGhlIHJldHVybiB2YWx1ZSBpbiBhCmNvbW1lbnQgKHlvdXIgY29tbWl0IGxvZyBp
cyBnb29kKS4KCj4gIAo+ICAJLyogQ29uZmlndXJlIElCSSBhdXRvLXJ1bGVzICovCj4gIAlyZXQg
PSBzdmNfaTNjX3VwZGF0ZV9pYmlydWxlcyhtYXN0ZXIpOwo+IAoKV2l0aCB0aGUgY29tbWVudCBh
ZGRlZCwKClJldmlld2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4u
Y29tPgoKVGhhbmtzLApNaXF1w6hsCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1p
M2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWkzYwo=
