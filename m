Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC80C83F14
	for <linux-i3c@archiver.kernel.org>; Wed, 30 Aug 2023 08:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6gbH0CtkNQ1eWFdlRGdPcURbdCRegMcr6xKUx21NZ3s=; b=Yc7L+B+HFSId8D
	wSiEgtC6O/tUj3FRLDvRbCDhI1fsXX7Kzgo5kO9fCASM6Imeuuq4YTpMmUPb+gW7GokcywkVhj48q
	O2MenylnrreKiG/itrZkyeTHumU64FUzcVAKRfzPh7cTV47Aps/iAju6+OGNoHBIoMtqIn+lcNuWc
	fJypjPqWcEMONTH+3VqmyPV/mZ/nSru4MqR7Ojx4pW614/Tuef+Kx0+S9RmzcA9IHKxpeyCcFr9/r
	8fG/RTMdncuyYu/YQdgz9oOkYixpaeqpKtBggVLzsNG/Atw/NgAsspUrdLlZ3NAVlxmvt5jHvtyjd
	PCKZv1n3uY9+7wvaUjcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbGw6-00D6XC-09;
	Wed, 30 Aug 2023 08:52:26 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbGw1-00D6VL-2m
	for linux-i3c@lists.infradead.org;
	Wed, 30 Aug 2023 08:52:24 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4BEE4C0005;
	Wed, 30 Aug 2023 08:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1693385535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K3IPdpdNAX0heK2EMwiRVGcgLnPwKyCy4SVQ40VHFd8=;
	b=cW3eD0wTfmK9yzIdEgMv3RfiJ9U4DJGSduiSl1991omQCdYwjwgeyX4xnZzpgOwexa5CTW
	S8oUWbXT63DheDhiXrntg+/tGlhmq5WJndCFT6fsTY13oNTEyo+Kx+aD/NsiVGxHHyh8Ni
	RvcaMS+2ZRr7zo4Co2w5mWsS5YwwDz4zseNxKWj9YTgz805tR1RgcGUKUC0hbKJdZ6Ox2w
	10ePVbaw5dN9qzwHy2B+aIcJapyzFsc3gROekZlGx2TINsKW0ex3aCirVXE+mVOxX1PIzq
	HF0KX+ufo9OvdRXS7uatq3Ybwc/zg3p7IMQQKis+DwGGMNF5ONCp+cq0uPJuFw==
Date: Wed, 30 Aug 2023 10:52:11 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Conor Culhane <conor.culhane@silvaco.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, "moderated list:SILVACO I3C DUAL-ROLE
 MASTER" <linux-i3c@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 2/2] i3c: master: svc: fix probe failure when no i3c
 device exist
Message-ID: <20230830105211.07a2c790@xps-13>
In-Reply-To: <ZO4OMnPNCYecYImQ@lizhi-Precision-Tower-5810>
References: <20230828192502.3525418-1-Frank.Li@nxp.com>
	<20230828192502.3525418-2-Frank.Li@nxp.com>
	<20230829111611.12f91348@xps-13>
	<ZO4OMnPNCYecYImQ@lizhi-Precision-Tower-5810>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_015222_188078_278EDB94 
X-CRM114-Status: GOOD (  33.01  )
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

SGkgRnJhbmssCgpGcmFuay5saUBueHAuY29tIHdyb3RlIG9uIFR1ZSwgMjkgQXVnIDIwMjMgMTE6
MjY6NDIgLTA0MDA6Cgo+IE9uIFR1ZSwgQXVnIDI5LCAyMDIzIGF0IDExOjE2OjExQU0gKzAyMDAs
IE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBIaSBGcmFuaywKPiA+IAo+ID4gRnJhbmsuTGlAbnhw
LmNvbSB3cm90ZSBvbiBNb24sIDI4IEF1ZyAyMDIzIDE1OjI1OjAyIC0wNDAwOgo+ID4gICAKPiA+
ID4gSWYgdGhlcmUgYXJlIG5vdCBpM2MgZGV2aWNlLCBhbGwgY2NjIGNvbW1hbmQgd2lsbCBnZXQg
TkFDSy4gU2V0ICAKPiA+IAo+ID4gCQlubwkJCQkJTkFDS2VkPwo+ID4gICAKPiA+ID4gaTNjX2Nj
Y19jbWQ6OmVyciBhcyBJM0NfRVJST1JfTTIuICAKPiA+IAo+ID4gVGhpcyBzZW50ZW5jZSBzaG91
bGQgY29tZSBsYXN0IGFuZCBiZSBzbGlnaHRseSBtb3JlIGV4cGxpY2l0Lgo+ID4gICAKPiA+ID4g
UmV0dXJuIHN1Y2Nlc3Mgd2hlbiBubyBpM2MgZGV2aWNlIGZvdW5kIGF0IHN2Y19pM2NfbWFzdGVy
X2RvX2RhYV9sb2NrZWQoKS4gIAo+ID4gCj4gPiBQbGVhc2UgZXhwbGFpbiB3aHkgdGhpcyBpcyBp
bXBvcnRhbnQvdXNlZnVsLiAgCj4gCj4gSWYgcmV0dXJuIGZhaWx1cmUsIGRyaXZlciB3aWxsIHBy
b2JlIGZhaWx1cmUgd2hlbiB0aGVyZSBhcmUgbm8gYW55IGkzYwo+IGRldmljZXMuIEkzQyBtYXN0
ZXIgc3VwcG9zZWQgc3VwcG9ydCBob3Qgam9pbi4gVGhlIHByb2JlIGZhaWx1cmUgZG9uJ3QKPiBt
YWtlIHNlbnNlIGlmIG5vIGkzYyBkZXZpY2VzIGZvdW5kIHdoZW4gbWFzdGVyIGRyaXZlciBwcm9i
ZS4KPiAKPiBIb3cgYWJvdXQgcmV3cml0ZSBjb21taXQgbG9nIGFzCgpNdWNoIGJldHRlciwgbGV0
IG1lIHByb3Bvc2Ugc29tZXRoaW5nIHNsaWdodGx5IGNsZWFyZXIuCgo+ICJJM0MgbWFzdGVyIHN1
cHBvcnRzIGRldmljZSBob3Qgam9pbiwgaXQgZG9lc24ndCBtYWtlIHNlbnNlIG1hc3RlciBkcml2
ZXIKPiBwcm9iZSBmYWlsdXJlIHdoZW4gdGhlcmUgYXJlIG5vIEkzQyBkZXZpY2VzLgo+Cj4gV2hl
biB0aGVyZSBhcmUgbm8gSTNDIGRldmljZXMgYXR0YWNoZWQsIGFsbCBDQ0MgY29tbWFuZHMgYXJl
IE5BQ0tlZC4gU28KPiBTVkMgSTNDIG1hc3RlciBmYWlscyB0byBwcm9iZS4KCldoYXQgYWJvdXQ6
CgpJM0MgbWFzdGVycyBhcmUgZXhwZWN0ZWQgdG8gc3VwcG9ydCBob3Qtam9pbi4gVGhpcyBtZWFu
cyBhdAppbml0aWFsaXphdGlvbiB0aW1lIHdlIG1pZ2h0IG5vdCB5ZXQgZGlzY292ZXIgYW55IGRl
dmljZSBhbmQgdGhpcwpzaG91bGQgbm90IGJlIHRyZWF0ZWQgYXMgYSBmYXRhbCBlcnJvci4KCkR1
cmluZyB0aGUgREFBIHByb2NlZHVyZSB3aGljaCBoYXBwZW5zIGF0IHByb2JlIHRpbWUsIGlmIG5v
IGRldmljZSBoYXMKam9pbmVkLCBhbGwgQ0NDIHdpbGwgYmUgTkFDS2VkIChmcm9tIGEgYnVzIHBl
cnNwZWN0aXZlKS4gVGhpcyBsZWFkcyB0bwphbiBlYXJseSByZXR1cm4gd2l0aCBhbiBlcnJvciBj
b2RlIHdoaWNoIGZhaWxzIHRoZSBwcm9iZSBvZiB0aGUgbWFzdGVyLgoKTGV0J3MgYXZvaWQgdGhp
cyBieSBqdXN0IHRlbGxpbmcgdGhlIGNvcmUgdGhyb3VnaCBhbiBJM0NfRVJST1JfTTIKcmV0dXJu
IGNvbW1hbmQgY29kZSB0aGF0IG5vIGRldmljZSB3YXMgZGlzY292ZXJlZCwgd2hpY2ggaXMgYSB2
YWxpZApzaXR1YXRpb24uIFRoaXMgd2F5IHRoZSBtYXN0ZXIgd2lsbCBubyBsb25nZXIgYmFpbCBv
dXQgYW5kIGZhaWwgdG8KcHJvYmUgZm9yIGEgd3JvbmcgcmVhc29uLgoKPiBTZXQgaTNjX2NjX2Nt
ZDplcnIgYXMgSTNDX0VSUk9SX00yLiBTbyBJM0MgbWFzdGVyIGZyYW1ld29yawo+IGkzY19tYXN0
ZXJfcnN0ZGFhX2xvY2tlZCgpIGNhbiByZXR1cm4gZXhwZWN0ZWQgRVJST1IgY29kZSBhbmQgY29u
dGludWUKPiBkcml2ZXIgcHJvYmUgcHJvY2Vzcy4KPiAKPiBSZXR1cm4gc3VjY2VzcyBhdCBzdmNf
aTNjX21hc3Rlcl9kb19kYWFfbG9ja2VkKCkgaWYgbm8gaTNjIGRldmljZXMgZm91bmQuCj4gU28g
U1ZDIG1hc3RlciBkcml2ZXIgY2FuIHByb2JlIHN1Y2Nlc3NmdWxseSBldmVuIGlmIG5vIEkzQyBk
ZXZpY2VzIGFyZQo+IGF0dGFjaGVkIgo+IAo+ID4gICAKPiA+ID4gRml4ZXM6IGRkM2M1Mjg0NmQ1
OSAoImkzYzogbWFzdGVyOiBzdmM6IEFkZCBTaWx2YWNvIEkzQyBtYXN0ZXIgZHJpdmVyIikgIAo+
ID4gCj4gPiBTaGFsbCB3ZSBjb25zaWRlciBhIGJhY2twb3J0IGludG8gc3RhYmxlIGtlcm5lbHM/
ICAKPiAKPiBZZXMsIEkgY2FuIGFkZCBzdGFibGUgdGFnIGF0IG5leHQgdmVyc2lvbi4KClllcywg
cGxlYXNlLgoKPiA+ICAgCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEZyYW5rIExpIDxGcmFuay5MaUBu
eHAuY29tPgo+ID4gPiAtLS0KPiA+ID4gIGRyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rl
ci5jIHwgMTMgKysrKysrKysrKystLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPiA+IAo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9p
M2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1t
YXN0ZXIuYwo+ID4gPiBpbmRleCA3NzBiNDBlMjgwMTVlLi5hNTYyMDEwM2FjYjczIDEwMDY0NAo+
ID4gPiAtLS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYwo+ID4gPiArKysg
Yi9kcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYwo+ID4gPiBAQCAtNzg5LDYgKzc4
OSw5IEBAIHN0YXRpYyBpbnQgc3ZjX2kzY19tYXN0ZXJfZG9fZGFhX2xvY2tlZChzdHJ1Y3Qgc3Zj
X2kzY19tYXN0ZXIgKm1hc3RlciwKPiA+ID4gIAkJCQkgKi8KPiA+ID4gIAkJCQlicmVhazsKPiA+
ID4gIAkJCX0gZWxzZSBpZiAoU1ZDX0kzQ19NU1RBVFVTX05BQ0tFRChyZWcpKSB7Cj4gPiA+ICsJ
CQkJLyogTm8gSTNDIGRldmljZXMgYXR0YWNoZWQgKi8KPiA+ID4gKwkJCQlpZiAoZGV2X25iID09
IDApCj4gPiA+ICsJCQkJCWJyZWFrOyAgCj4gPiAKPiA+IFxuID8KPiA+ICAgCj4gPiA+ICAJCQkJ
LyoKPiA+ID4gIAkJCQkgKiBBIHNsYXZlIGRldmljZSBuYWNrZWQgdGhlIGFkZHJlc3MsIHRoaXMg
aXMKPiA+ID4gIAkJCQkgKiBhbGxvd2VkIG9ubHkgb25jZSwgREFBIHdpbGwgYmUgc3RvcHBlZCBh
bmQKPiA+ID4gQEAgLTEyNjMsMTEgKzEyNjYsMTcgQEAgc3RhdGljIGludCBzdmNfaTNjX21hc3Rl
cl9zZW5kX2NjY19jbWQoc3RydWN0IGkzY19tYXN0ZXJfY29udHJvbGxlciAqbSwKPiA+ID4gIHsK
PiA+ID4gIAlzdHJ1Y3Qgc3ZjX2kzY19tYXN0ZXIgKm1hc3RlciA9IHRvX3N2Y19pM2NfbWFzdGVy
KG0pOwo+ID4gPiAgCWJvb2wgYnJvYWRjYXN0ID0gY21kLT5pZCA8IDB4ODA7Cj4gPiA+ICsJaW50
IHJldDsKPiA+ID4gIAo+ID4gPiAgCWlmIChicm9hZGNhc3QpCj4gPiA+IC0JCXJldHVybiBzdmNf
aTNjX21hc3Rlcl9zZW5kX2JkY2FzdF9jY2NfY21kKG1hc3RlciwgY21kKTsKPiA+ID4gKwkJcmV0
ID0gc3ZjX2kzY19tYXN0ZXJfc2VuZF9iZGNhc3RfY2NjX2NtZChtYXN0ZXIsIGNtZCk7Cj4gPiA+
ICAJZWxzZQo+ID4gPiAtCQlyZXR1cm4gc3ZjX2kzY19tYXN0ZXJfc2VuZF9kaXJlY3RfY2NjX2Nt
ZChtYXN0ZXIsIGNtZCk7Cj4gPiA+ICsJCXJldCA9IHN2Y19pM2NfbWFzdGVyX3NlbmRfZGlyZWN0
X2NjY19jbWQobWFzdGVyLCBjbWQpOwo+ID4gPiArCj4gPiA+ICsJaWYgKHJldCkKPiA+ID4gKwkJ
Y21kLT5lcnIgPSBJM0NfRVJST1JfTTI7Cj4gPiA+ICsKPiA+ID4gKwlyZXR1cm4gcmV0Owo+ID4g
PiAgfQo+ID4gPiAgCj4gPiA+ICBzdGF0aWMgaW50IHN2Y19pM2NfbWFzdGVyX3ByaXZfeGZlcnMo
c3RydWN0IGkzY19kZXZfZGVzYyAqZGV2LCAgCj4gPiAKPiA+IAo+ID4gVGhhbmtzLAo+ID4gTWlx
dcOobCAgCgoKVGhhbmtzLApNaXF1w6hsCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51
eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
