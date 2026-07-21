Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB88EC4452F
	for <linux-i3c@archiver.kernel.org>; Tue, 21 Jul 2026 03:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3KbmLfVta0+/d/Xpyc2CcVsqAhH2SKXljKnh90BcwBA=; b=hvnnBIEVS7V0d8
	sxYepe/6xh8cZsV24MKo644m+EmnSRmY5tGmHWdhXe4dXkimxZini3dSaHwDfA5Kozz8bjWnAS7JQ
	PA/8VpDa51vfH9AAtUyOE82B9u1WVYTZ2985PG90lBpy5WzBAD27/0PMCRiic2piI2b4C+vHeLBZy
	xN88FxHjtVsoiqQaSZA/eRd9T5Zw+qT7thbgc9hHJex/bkvWUCGj8x8ii7REDWk0CKYfNvL++z+Zb
	U0PQyV8cKnDOgij7pF1vYgHsrvJHfIgbfJDPBl37LBEna0BJ1Bk86u9kHl87BK90y2TdfhBsQNn7p
	fIXKwG/2iJbn8T0ykLRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm1ST-00000008LQG-1Os3;
	Tue, 21 Jul 2026 03:47:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm1SS-00000008LQ4-0hJU
	for linux-i3c@lists.infradead.org;
	Tue, 21 Jul 2026 03:47:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9462241519;
	Tue, 21 Jul 2026 03:47:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35EE41F000E9;
	Tue, 21 Jul 2026 03:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784605671;
	bh=wCqwoxjo7VqO1l2s85ATE7pvS++m/MJZCw3FNZikLFw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FU1trdXBSEgKR+wIhLLj1Vi1SilpviA3TWNKzkYEMBjAyW0gvsWnewz6JIR2Wphp0
	 jK1CZ3YSeRCRUqOrlwtddlQpJioZLXOuUDpjg4xUWUPjEv1hXP62AB/dT55R6shcog
	 IGp+IvNPYgwncneu3YwugdRkAil5HHXG1eTfM27V43cB1J77hYf7510suqr1LjJw/Q
	 J3s1ZVKNnA0wKo+naDSFGX6oY7tzRT9xI6CRwX3nLkiI7KC/253uiduTRcYADtQOYB
	 8g8841Z+mWodP+6hpwAFnOXi8OTcUVymvK0+5+gvstyVOe93aCZavumoKouho7qC5V
	 1iSp+/9o5jJUA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] i3c: master: dw-i3c-master: fix OD timing for first
 broadcast
To: tze.yee.ng@altera.com
Cc: linux-i3c@lists.infradead.org, Frank.Li@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260721033159.11789-1-tze.yee.ng@altera.com>
References: <20260721033159.11789-1-tze.yee.ng@altera.com>
Date: Tue, 21 Jul 2026 03:47:50 +0000
Message-Id: <20260721034751.35EE41F000E9@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gVGhlIGNhbGN1bGF0
aW9uIGZvciBgb2RfaGNudGAgY2FuIHNpbGVudGx5IG92ZXJmbG93IGl0cyA4LWJpdCBjYXBhY2l0
eSBpZiB0aGUgY29yZSBjbG9jayByYXRlIGV4Y2VlZHMgfjEuMjggR0h6LCByZXN1bHRpbmcgaW4g
YW4gaW5hcHByb3ByaWF0ZWx5IGZhc3Qgb3Blbi1kcmFpbiBzcGVlZC4KLSBbTG93XSBVc2luZyBE
SVZfUk9VTkRfVVAoKSB3aXRoIGEgNjQtYml0IG51bWVyYXRvciBvciBkaXZpc29yIGNhdXNlcyBh
IGxpbmtlciBlcnJvciAoX191ZGl2ZGkzIHVuZGVmaW5lZCkgb24gMzItYml0IHBsYXRmb3Jtcy4K
LS0KCi0tLSBQYXRjaCBbMV06IFtQQVRDSCB2Ml0gaTNjOiBtYXN0ZXI6IGR3LWkzYy1tYXN0ZXI6
IGZpeCBPRCB0aW1pbmcgZm9yIGZpcnN0IGJyb2FkY2FzdCAtLS0KY29tbWl0IGI4MmYyOWE1OWFl
OThiZDE4Y2JiNTQ0ZGVkOWEzYmY4ZjhkNjBmYzYKQXV0aG9yOiBUemUgWWVlIE5nIDx0emUueWVl
Lm5nQGFsdGVyYS5jb20+CgppM2M6IG1hc3RlcjogZHctaTNjLW1hc3RlcjogZml4IE9EIHRpbWlu
ZyBmb3IgZmlyc3QgYnJvYWRjYXN0CgpUaGlzIGNvbW1pdCBpbXBsZW1lbnRzIC0+c2V0X3NwZWVk
KCkgdG8gc3dpdGNoIG9wZW4tZHJhaW4gdGltaW5nIGZvciB0aGUKZmlyc3QgYnJvYWRjYXN0IGFk
ZHJlc3MgYWNjb3JkaW5nIHRvIHRoZSBJM0Mgc3BlY2lmaWNhdGlvbi4gSXQgY2FjaGVzIHRoZQpu
b3JtYWwgT0QgcmVnaXN0ZXIgdmFsdWUgZHVyaW5nIGluaXQgYW5kIHVzZXMgYSBzZXBhcmF0ZSBv
ZF9oY250IGZvciB0aGUKc2xvdyBwYXRoIHNvIFNEUiBleHRlbmRlZCB0aW1pbmcgcmVtYWlucyBk
ZXJpdmVkIGZyb20gdGhlIG5vcm1hbCBQUCBoY250LgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9p
M2MvbWFzdGVyL2R3LWkzYy1tYXN0ZXIuYyBiL2RyaXZlcnMvaTNjL21hc3Rlci9kdy1pM2MtbWFz
dGVyLmMKPiBpbmRleCA4NGZmY2IxODkzMzg5Li4wNzdmMmJmNGIwYjNmIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvaTNjL21hc3Rlci9kdy1pM2MtbWFzdGVyLmMKPiArKysgYi9kcml2ZXJzL2kzYy9t
YXN0ZXIvZHctaTNjLW1hc3Rlci5jCgpbIC4uLiBdCgo+IEBAIC0xNTEzLDYgKzE1MTksNDggQEAg
c3RhdGljIGlycXJldHVybl90IGR3X2kzY19tYXN0ZXJfaXJxX2hhbmRsZXIoaW50IGlycSwgdm9p
ZCAqZGV2X2lkKQo+ICAJcmV0dXJuIElSUV9IQU5ETEVEOwo+ICB9Cj4gIAo+ICtzdGF0aWMgaW50
IGR3X2kzY19tYXN0ZXJfc2V0X3NwZWVkKHN0cnVjdCBpM2NfbWFzdGVyX2NvbnRyb2xsZXIgKm0s
Cj4gKwkJCQkgICBlbnVtIGkzY19vcGVuX2RyYWluX3NwZWVkIHNwZWVkKQo+ICt7Cj4gKwlzdHJ1
Y3QgZHdfaTNjX21hc3RlciAqbWFzdGVyID0gdG9fZHdfaTNjX21hc3RlcihtKTsKPiArCXVuc2ln
bmVkIGxvbmcgY29yZV9yYXRlOwo+ICsJdTMyIHNjbF90aW1pbmc7Cj4gKwl1OCBvZF9oY250LCBs
Y250Owo+ICsKPiArCVBNX1JVTlRJTUVfQUNRVUlSRV9BVVRPU1VTUEVORChtYXN0ZXItPmRldiwg
cG0pOwo+ICsJaWYgKFBNX1JVTlRJTUVfQUNRVUlSRV9FUlIoJnBtKSkKPiArCQlyZXR1cm4gLUVO
WElPOwo+ICsKPiArCXN3aXRjaCAoc3BlZWQpIHsKPiArCWNhc2UgSTNDX09QRU5fRFJBSU5fU0xP
V19TUEVFRDoKPiArCQljb3JlX3JhdGUgPSBjbGtfZ2V0X3JhdGUobWFzdGVyLT5jb3JlX2Nsayk7
Cj4gKwkJaWYgKCFjb3JlX3JhdGUpCj4gKwkJCXJldHVybiAtRUlOVkFMOwo+ICsKPiArCQlsY250
ID0gU0NMX0kzQ19USU1JTkdfTENOVChtYXN0ZXItPmkzY19vZF90aW1pbmdfbm9ybWFsKTsKPiAr
CQlvZF9oY250ID0gRElWX1JPVU5EX1VQKCh1NjQpSTNDX0JVU19USElHSF9JTklUX09EX01JTl9O
UyAqIGNvcmVfcmF0ZSwKPiArCQkJCSAgICAgICAxMDAwMDAwMDAwVUxMKSAtIDE7CgpbU2V2ZXJp
dHk6IExvd10KV2lsbCB0aGlzIGNhdXNlIGEgYnVpbGQgZmFpbHVyZSBvbiAzMi1iaXQgcGxhdGZv
cm1zPwoKVXNpbmcgRElWX1JPVU5EX1VQKCkgd2l0aCBhIDY0LWJpdCBkaXZpc29yICgxMDAwMDAw
MDAwVUxMKSB3aWxsIGxpa2VseQpyZXN1bHQgaW4gYSBsaW5rZXIgZXJyb3IgZm9yIF9fdWRpdmRp
MyBvbiAzMi1iaXQgYXJjaGl0ZWN0dXJlcyBsaWtlIEFSTTMyCm9yIGkzODYuIFNob3VsZCB0aGlz
IHVzZSBESVZfUk9VTkRfVVBfVUxMKCkgaW5zdGVhZD8KCltTZXZlcml0eTogTWVkaXVtXQpDYW4g
b2RfaGNudCBzaWxlbnRseSBvdmVyZmxvdyBoZXJlPwoKQmVjYXVzZSBvZF9oY250IGlzIGRlY2xh
cmVkIGFzIGEgdTggYXQgdGhlIHRvcCBvZiB0aGUgZnVuY3Rpb24sIGlmIHRoZQpjb3JlIGNsb2Nr
IHJhdGUgZXhjZWVkcyB+MS4yOCBHSHosIHRoZSBjYWxjdWxhdGlvbiB3aWxsIGV2YWx1YXRlIHRv
IGEKdmFsdWUgZ3JlYXRlciB0aGFuIDI1NS4KClRoaXMgd291bGQgdHJ1bmNhdGUgd2hlbiBhc3Np
Z25lZCB0byBvZF9oY250LCBieXBhc3NpbmcgdGhlIG1pbmltdW0gMjAwbnMKcmVxdWlyZW1lbnQg
YW5kIHBvdGVudGlhbGx5IGNhdXNpbmcgc3Bpa2UgZmlsdGVycyBvbiBkZXZpY2VzIHRvIGRyb3Ag
dGhlCmJyb2FkY2FzdC4KCj4gKwkJaWYgKG9kX2hjbnQgPCBTQ0xfSTNDX1RJTUlOR19DTlRfTUlO
KQo+ICsJCQlvZF9oY250ID0gU0NMX0kzQ19USU1JTkdfQ05UX01JTjsKPiArCQlzY2xfdGltaW5n
ID0gU0NMX0kzQ19USU1JTkdfSENOVChvZF9oY250KSB8Cj4gKwkJCSAgICAgU0NMX0kzQ19USU1J
TkdfTENOVChsY250KTsKPiArCQl3cml0ZWwoc2NsX3RpbWluZywgbWFzdGVyLT5yZWdzICsgU0NM
X0kzQ19PRF9USU1JTkcpOwo+ICsJCW1hc3Rlci0+aTNjX29kX3RpbWluZyA9IHNjbF90aW1pbmc7
Cj4gKwkJYnJlYWs7CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRl
di8jL3BhdGNoc2V0LzIwMjYwNzIxMDMzMTU5LjExNzg5LTEtdHplLnllZS5uZ0BhbHRlcmEuY29t
P3BhcnQ9MQoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1pM2MK
