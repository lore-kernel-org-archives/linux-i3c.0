Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 220B2CDB474
	for <linux-i3c@archiver.kernel.org>; Fri, 20 Oct 2023 14:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q0oSlYt5JzVcIPL8hSaTH4GdDL71CSYfyWlOa/312bg=; b=Vm1IJwozulgNc6
	eXwua5PFJlRHLtu4ihvYtfW0ISsW2HI0y9agUBLEYeGHBdWPHzT0qjp2qEdxkRlqBIe+DSJIFdNOB
	o8lscp804XALWV6pTU5epPQPeQRUFjgPvVUaGe5tNMkDq63fhwKa10lvNHkRHxpsfjhQisBlDiWKZ
	J88JsbStaj+OxvKPy2Bg9FgrYEJYfCKN64HdTXWNran/nTaiRCGT5csm6XcqrCtyrmbcv++/hQsYM
	Y5QB/Mc1sHv0n9bJLRGltL971u5AXbVnp+uSMraPaOaLluEGF2HMN1Tnp9OBJEWNzP0hf15YRGphG
	GijDqShnYi7VYOyHwrFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtqb8-002Vpv-21;
	Fri, 20 Oct 2023 14:35:34 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtqb6-002Voz-0F
	for linux-i3c@lists.infradead.org;
	Fri, 20 Oct 2023 14:35:33 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 75506E0008;
	Fri, 20 Oct 2023 14:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697812527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bKkJpgqFVYr08H00yl52RojNphyV8fLQ0U+IXz9+aeo=;
	b=p2ZL970JgoCOJF7mnsR4N02TXPx9TBQJRoQfRBuotvKqEViYeUtrVMJnj+g7n5wJiAHGK4
	TLvFxQwY5KYdbp8PPwH8zq3yIQCI04SIj6KG24+yxe3Ib8APEE8ccj6uttcgYpIoMY2+JR
	uVRWZSSJcnV572FCtno9otKJML9XZKi39khQgRHdR2UA2hhwVFnmW3bVmc/44hU4QiM2nJ
	tGvCOXvYG6QSqSSzrZLghD1ggK5W+iS8LTGXZ0f4wEiUYmcqZlNwmc0jkr+KPVt/d3VqUi
	mevULvSkePp9b376vNKGlV0Otqo5UlUso5wCsTlnDJkjwnRGdlz/PE43xFyrMw==
Date: Fri, 20 Oct 2023 16:35:25 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.li@nxp.com>
Cc: alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
 imx@lists.linux.dev, joe@perches.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 Resent 6/6] i3c: master: svc: fix random hot join
 failure since timeout error
Message-ID: <20231020163525.66485920@xps-13>
In-Reply-To: <ZTKMTwU6cVAfGCKG@lizhi-Precision-Tower-5810>
References: <20231018155926.3305476-1-Frank.Li@nxp.com>
	<20231018155926.3305476-7-Frank.Li@nxp.com>
	<20231019084452.11fd0645@xps-13>
	<ZTFNvrsSoHOS3P2g@lizhi-Precision-Tower-5810>
	<20231020160645.67e678ee@xps-13>
	<ZTKMTwU6cVAfGCKG@lizhi-Precision-Tower-5810>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_073532_408025_2BC8D564 
X-CRM114-Status: GOOD (  28.54  )
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

SGkgRnJhbmssCgpGcmFuay5saUBueHAuY29tIHdyb3RlIG9uIEZyaSwgMjAgT2N0IDIwMjMgMTA6
MTg6NTUgLTA0MDA6Cgo+IE9uIEZyaSwgT2N0IDIwLCAyMDIzIGF0IDA0OjA2OjQ1UE0gKzAyMDAs
IE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBIaSBGcmFuaywKPiA+IAo+ID4gRnJhbmsubGlAbnhw
LmNvbSB3cm90ZSBvbiBUaHUsIDE5IE9jdCAyMDIzIDExOjM5OjQyIC0wNDAwOgo+ID4gICAKPiA+
ID4gT24gVGh1LCBPY3QgMTksIDIwMjMgYXQgMDg6NDQ6NTJBTSArMDIwMCwgTWlxdWVsIFJheW5h
bCB3cm90ZTogIAo+ID4gPiA+IEhpIEZyYW5rLAo+ID4gPiA+IAo+ID4gPiA+IEZyYW5rLkxpQG54
cC5jb20gd3JvdGUgb24gV2VkLCAxOCBPY3QgMjAyMyAxMTo1OToyNiAtMDQwMDoKPiA+ID4gPiAg
ICAgCj4gPiA+ID4gPiBtYXN0ZXIgc2lkZSByZXBvcnQ6Cj4gPiA+ID4gPiAgIHNpbHZhY28taTNj
LW1hc3RlciA0NDMzMDAwMC5pM2MtbWFzdGVyOiBFcnJvciBjb25kaXRpb246IE1TVEFUVVMgMHgw
MjAwOTBjNywgTUVSUldBUk4gMHgwMDEwMDAwMAo+ID4gPiA+ID4gCj4gPiA+ID4gPiBCSVQgMjA6
IFRJTUVPVVQgZXJyb3IKPiA+ID4gPiA+ICAgVGhlIG1vZHVsZSBoYXMgc3RhbGxlZCB0b28gbG9u
ZyBpbiBhIGZyYW1lLiBUaGlzIGhhcHBlbnMgd2hlbjoKPiA+ID4gPiA+ICAgLSBUaGUgVFggRklG
TyBvciBSWCBGSUZPIGlzIG5vdCBoYW5kbGVkIGFuZCB0aGUgYnVzIGlzIHN0dWNrIGluIHRoZQo+
ID4gPiA+ID4gbWlkZGxlIG9mIGEgbWVzc2FnZSwKPiA+ID4gPiA+ICAgLSBObyBTVE9QIHdhcyBp
c3N1ZWQgYW5kIGJldHdlZW4gbWVzc2FnZXMsCj4gPiA+ID4gPiAgIC0gSUJJIG1hbnVhbCBpcyB1
c2VkIGFuZCBubyBkZWNpc2lvbiB3YXMgbWFkZS4gICAgCj4gPiA+ID4gCj4gPiA+ID4gSSBhbSBz
dGlsbCBub3QgY29udmluY2VkIHRoaXMgc2hvdWxkIGJlIGlnbm9yZWQgaW4gYWxsIGNhc2VzLgo+
ID4gPiA+IAo+ID4gPiA+IENhc2UgMSBpcyBhIHByb2JsZW0gYmVjYXVzZSB0aGUgaGFyZHdhcmUg
ZmFpbGVkIHNvbWVob3cuICAgIAo+ID4gPiAKPiA+ID4gQnV0IHNvIGZhciwgbm8gYWN0aW9uIHRv
IGhhbmRsZSB0aGlzIGNhc2UgaW4gY3VycmVudCBjb2RlLiAgCj4gPiAKPiA+IFllcywgYnV0IGlm
IHlvdSBkZXRlY3QgYW4gaXNzdWUgYW5kIGlnbm9yZSBpdCwgaXQncyBub3QgYmV0dGVyIHRoYW4K
PiA+IHJlcG9ydGluZyBpdCB3aXRob3V0IGhhbmRsaW5nIGl0LiBJbnN0ZWFkIG9mIHRvdGFsbHkg
aWdub3JpbmcgdGhpcyBJCj4gPiB3b3VsZCBhdCBsZWFzdCB3cml0ZSBhIGRlYnVnIG1lc3NhZ2Ug
KGlkZW50aWNhbCB0byB3aGF0J3MgYmVsb3cpIGJlZm9yZQo+ID4gcmV0dXJuaW5nIGZhbHNlLCBl
dmVuIHRob3VnaCBJIGFtIG5vdCBjb252aW5jZWQgdW5jb25kaXRpb25hbGx5Cj4gPiByZXR1cm5p
bmcgZmFsc2UgaGVyZSBpcyB3aXNlLiBJZiB5b3UgZmFpbCBhIGhhcmR3YXJlIHNlcXVlbmNlIGJl
Y2F1c2UKPiA+IHlvdSBhZGRlZCBhIHByaW50aywgaXQncyBhIHByb2JsZW0uIE1heWJlIHlvdSBj
b25zaWRlciB0aGlzIGxpbmUgYXMKPiA+IG5vaXNlLCBidXQgSSBiZWxpZXZlIGl0J3Mgc3RpbGwg
YW4gZXJyb3IgY29uZGl0aW9uLiBNYXliZSwgaG93ZXZlciwKPiA+IHRoaXMgYml0IGdldHMgc2V0
IGFmdGVyIHRoZSB3aG9sZSBzZXF1ZW5jZSwgYW5kIHRoaXMgaXMganVzdCBhICJidXMKPiA+IGlz
IGlkbGUiIGNvbmRpdGlvbi4gSWYgdGhhdCdzIHRoZSBjYXNlLCB0aGVuIHlvdSBuZWVkIHNvbWUK
PiA+IGFkZGl0aW9uYWwgaGV1cmlzdGljcyB0byBwcm9wZXJseSBpZ25vcmUgdGhlIGJpdD8KPiA+
ICAgCj4gCj4gICAgICAgICAgICAgICAgIGRldl9lcnIobWFzdGVyLT5kZXYsICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgCj4gICAgICAgICAgICAgICAgICAgICAgICAgIkVy
cm9yIGNvbmRpdGlvbjogTVNUQVRVUyAweCUwOHgsIE1FUlJXQVJOIDB4JTA4eFxuIiwKPiAgICAg
ICAgICAgICAgICAgICAgICAgICBtc3RhdHVzLCBtZXJyd2Fybik7Cj4gKwo+ICsJCS8qIGlnbm9y
ZSB0aW1lb3V0IGVycm9yICovCj4gKwkJaWYgKG1lcnJ3YXJuICYgU1ZDX0kzQ19NRVJSV0FSTl9U
SU1FT1VUKQo+ICsJCQlyZXR1cm4gZmFsc2U7Cj4gKwo+IAo+IElzIGl0IG9rYXkgbW92ZSBTVkNf
STNDX01FUlJXQVJOX1RJTUVPVVQgYWZ0ZXIgZGV2X2Vycj8KCkkgdGhpbmsgeW91IG1lbnRpb25l
ZCBlYXJsaWVyIHRoYXQgdGhlIHByb2JsZW0gd2FzIG5vdCB0aGUgcHJpbnRrIGJ1dAp0aGUgcmV0
dXJuIHZhbHVlLiBTbyBwZXJoYXBzIHRoZXJlIGlzIGEgd2F5IHRvIGtub3cgaWYgdGhlIHRpbWVv
dXQKaGFwcGVuZWQgYWZ0ZXIgYSB0cmFuc2FjdGlvbiBhbmQgd2FzIGxlZ2l0aW1hdGUgb3Igbm90
PwoKSW4gYW55IGNhc2Ugd2Ugc2hvdWxkIHByb2JhYmx5IGxvd2VyIHRoZSBsb2cgbGV2ZWwgZm9y
IHRoaXMgZXJyb3IuCgpUaGFua3MsCk1pcXXDqGwKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0
CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
