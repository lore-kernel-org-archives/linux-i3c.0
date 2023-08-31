Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D465C83F29
	for <linux-i3c@archiver.kernel.org>; Thu, 31 Aug 2023 06:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=II9rlISB5crfRjCkwezK5zhsMR8XZsg14Kr4oFUsKCU=; b=Jo5+d+kqEpJmJv
	AkVdEsSgMohpZXOfyocS9aWqNW4P3ZPesABIY7hJORbAivHSH3SgQku8Zjfmiy8Wv+rLZ98NXb1sy
	9U5QE0CqhNKXr+swiWqrsX8JH6TJIxDFuWg6qA8S1YpqH/a9pd/PaLi5qvU0N99/MQdvRrsy7q+TB
	FRoDmq3dYQwUVzn0w8flVjhquUwL+lvFuoUXonPv6uPwpaTV00kbKeu9x1HEtSqT2bUVZw8b+zTYp
	OdZnJinAD0N/KdtGEz7LkOTZ2aFJaV8gqJE1M4DFPjZ2fSX6EAfPMTFz5/S8utTThOzpwJIsfx8ge
	f6fjtJ6Zi/19UNG9Jsmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbbcZ-00Emuz-1l;
	Thu, 31 Aug 2023 06:57:39 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbbcX-00EmuD-0A
	for linux-i3c@lists.infradead.org;
	Thu, 31 Aug 2023 06:57:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 737EB1BF209;
	Thu, 31 Aug 2023 06:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1693465052;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zzbhzTtPf3ec6YQsIX0eVjI9QDgXGYAHWymqPTgWjpE=;
	b=ZOHtdvSFKUMR5+t4LWACes1D2gKjWTL32s4Dpd4ORL8RrY0dLbriIIO+hQPQqfRB4pvXfO
	zCeHT4Zz0oIUIqtnE6yXXxShZ/Uubd/KefGP5KupDKpaTcMu0ZUKpU0OyO4zqo5WHJqocG
	FMW4LuJNOHX41Ikl8Q+RvalLuJ/NJRVCd4gZTK426Rt7JWVyprCeYyxva7pfAo/JxPIc/i
	ARLAISIOl460kyq+CEitIk97PfT99d+Fcqe0PfTr0fo9torhSv7EF7DDXWjjFY/PH9lwo7
	bxL9y2WANKMp6EcB4Tg6WMEzYIbnBUbRP7sgdnbd1QEaDOvOvFriu/Xofoz+kw==
Date: Thu, 31 Aug 2023 08:57:28 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.li@nxp.com>
Cc: alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
 imx@lists.linux.dev, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] i3c: master: fixes i3c bus driver probe failure
 if no i3c device attached
Message-ID: <20230831085728.0becee29@xps-13>
In-Reply-To: <ZO9vHAZT7M8hNueW@lizhi-Precision-Tower-5810>
References: <20230830141727.3794152-1-Frank.Li@nxp.com>
	<20230830175355.4bc2b8d2@xps-13>
	<ZO9vHAZT7M8hNueW@lizhi-Precision-Tower-5810>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_235737_230353_1C405B8F 
X-CRM114-Status: GOOD (  23.61  )
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

SGkgRnJhbmssCgpGcmFuay5saUBueHAuY29tIHdyb3RlIG9uIFdlZCwgMzAgQXVnIDIwMjMgMTI6
MzI6MjggLTA0MDA6Cgo+IE9uIFdlZCwgQXVnIDMwLCAyMDIzIGF0IDA1OjUzOjU1UE0gKzAyMDAs
IE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBIaSBGcmFuaywKPiA+IAo+ID4gRnJhbmsuTGlAbnhw
LmNvbSB3cm90ZSBvbiBXZWQsIDMwIEF1ZyAyMDIzIDEwOjE3OjI2IC0wNDAwOgo+ID4gICAKPiA+
ID4gSW4gaTNjX21hc3Rlcl9idXNfaW5pdCgpCj4gPiA+IHsJLi4uCj4gPiA+IAlyZXQgPSBpM2Nf
bWFzdGVyX3JzdGRhYV9sb2NrZWQobWFzdGVyLCBJM0NfQlJPQURDQVNUX0FERFIpOwo+ID4gPiAJ
aWYgKHJldCAmJiByZXQgIT0gSTNDX0VSUk9SX00yKQo+ID4gPiAJCQkgIF5eXiAvLyBpdCBpcyBl
bnVtIGkzY19lcnJvcl9jb2RlCj4gPiA+IAkuLi4KPiA+ID4gfQo+ID4gPiAKPiA+ID4gSW4gZHct
aTNjLW1hc3Rlci5jIGltcGxlbWVudGF0aW9uOgo+ID4gPiBkd19pM2NfY2NjX3NldCgpCj4gPiA+
IHsJLi4uCj4gPiA+IAlyZXQgPSB4ZmVyLT5yZXQ7Cj4gPiA+IAlpZiAoeGZlci0+Y21kc1swXS5l
cnJvciA9PSBSRVNQT05TRV9FUlJPUl9JQkFfTkFDSykKPiA+ID4gCQljY2MtPmVyciA9IEkzQ19F
UlJPUl9NMjsKPiA+ID4gCj4gPiA+IAlkd19pM2NfbWFzdGVyX2ZyZWVfeGZlcih4ZmVyKTsKPiA+
ID4gCj4gPiA+IAlyZXR1cm4gcmV0Owo+ID4gPiB9Cj4gPiA+IAo+ID4gPiBSZXR1cm4gZW51bSBp
M2NfZXJyb3JfY29kZSB3aGVuIGVycm9yIGhhcHBlbiBpbiBpM2NfbWFzdGVyX3JzdGRhYV9sb2Nr
ZWQoKS4gIAo+ID4gCj4gPiBJIGFtIHNvcnJ5IGJ1dCB0aGUgY29tbWl0IGxvZyBuZWVkcyB0byBi
ZSB3b3JrZWQgb24uCj4gPiAgIAo+ID4gPiAKPiA+ID4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5v
cmcKPiA+ID4gRml4ZXM6IDNhMzc5YmJjZWEwYSAoImkzYzogQWRkIGNvcmUgSTNDIGluZnJhc3Ry
dWN0dXJlIikKPiA+ID4gU2lnbmVkLW9mZi1ieTogRnJhbmsgTGkgPEZyYW5rLkxpQG54cC5jb20+
Cj4gPiA+IC0tLQo+ID4gPiAKPiA+ID4gTm90ZXM6Cj4gPiA+ICAgICBDaGFuZ2UgZnJvbSB2MSB0
byB2MjoKPiA+ID4gICAgIC0gY2Mgc3RhYmxlCj4gPiA+IAo+ID4gPiAgZHJpdmVycy9pM2MvbWFz
dGVyLmMgfCAzICsrKwo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+ID4g
PiAKPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci5jIGIvZHJpdmVycy9pM2Mv
bWFzdGVyLmMKPiA+ID4gaW5kZXggMDhhZWI2OWE3ODAwMy4uMDBhODJmM2FiOWFjMCAxMDA2NDQK
PiA+ID4gLS0tIGEvZHJpdmVycy9pM2MvbWFzdGVyLmMKPiA+ID4gKysrIGIvZHJpdmVycy9pM2Mv
bWFzdGVyLmMKPiA+ID4gQEAgLTc4Myw2ICs3ODMsOSBAQCBzdGF0aWMgaW50IGkzY19tYXN0ZXJf
cnN0ZGFhX2xvY2tlZChzdHJ1Y3QgaTNjX21hc3Rlcl9jb250cm9sbGVyICptYXN0ZXIsCj4gPiA+
ICAJcmV0ID0gaTNjX21hc3Rlcl9zZW5kX2NjY19jbWRfbG9ja2VkKG1hc3RlciwgJmNtZCk7Cj4g
PiA+ICAJaTNjX2NjY19jbWRfZGVzdF9jbGVhbnVwKCZkZXN0KTsKPiA+ID4gIAo+ID4gPiArCWlm
IChyZXQpCj4gPiA+ICsJCXJldCA9IGNtZC5lcnI7ICAKPiA+IAo+ID4gU2hvdWxkbid0IHRoaXMg
aGFwcGVuIGluIGkzY19tYXN0ZXJfc2VuZF9jY2NfY21kX2xvY2tlZCgpPyAgCj4gCj4gU29ycnks
IFRoaXMgcGF0Y2ggaXMgbm90IG5lY2VzYXJ5IGF0IGFsbC4KPiBpM2NfbWFzdGVyX3NlbmRfY2Nj
X2NtZF9sb2NrZWQoKSBhbHJlYWR5IGhhbmRsZWQgaXQuCj4gT25seSBuZWVkIHNlY29uZCBwYXRj
aC4gWW91IGNhbiBkaXNjYXJkIHRoaXMgcGF0Y2guCj4gCj4gRG8geW91IG5lZWQgbWUgc2VuZCAy
bmQgcGF0Y2ggb25seT8gT3IgeW91IGNhbiBqdXN0IHBpY2sgMm5kIG9uZT8KCkl0IGlzIHF1aXRl
IHVuY2xlYXIgd2hhdCB5b3UgYXJlIGZpbmFsbHkgdHJ5aW5nIHRvIGRvLiBQbGVhc2Ugc2VuZCBh
CnByb3BlciB2Mywgd2l0aCBhIGNoYW5nZWxvZy4KCj4gCj4gPiAgIAo+ID4gPiArCj4gPiA+ICAJ
cmV0dXJuIHJldDsKPiA+ID4gIH0KPiA+ID4gICAgCj4gPiAKPiA+IAo+ID4gVGhhbmtzLAo+ID4g
TWlxdcOobCAgCgoKVGhhbmtzLApNaXF1w6hsCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdAps
aW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
