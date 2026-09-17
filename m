Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54FE4C982D0
	for <linux-i3c@archiver.kernel.org>; Thu, 17 Sep 2026 19:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JKdb6129xcNsA179ipFf28jzR0hweocnrJR3bQMpIko=; b=RXfVpAKDRIdh+p
	kKttLWaj9evapTYRkN/KHbaSzfxwx+4ws/CfVPQi9ABQ5jMcx1Wo6dxE48pdE7V9nSw0+gtj7Cb/a
	7b/ggeIRiR1eyBxwD6WQN19/JTt5w6opccV/u+TSIKOeb3b8dT3APbyb9+fIi7AWv3oFHd0TD6y+O
	5yERU9yfkKFa4dNSVFlRkueogvs+tVSy/hH5iZnkuGrTwTxt+AEKHjlJyVRWCvRAR+OwpAfcL0EN6
	V9p0bORsF69TYgXCgaCrgI8lWnkLBxt/h4yzrUfJNDlSe+2mha4UMUBl4/cSXeMbunYVbVX5MBiLH
	rN20doTzYIKT1KUfonLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Hkf-0000000CKkC-03CL;
	Thu, 17 Sep 2026 19:26:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Hkd-0000000CKjy-2vb9
	for linux-i3c@lists.infradead.org;
	Thu, 17 Sep 2026 19:26:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C1A15601EF;
	Thu, 17 Sep 2026 19:26:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41F6F1F00893;
	Thu, 17 Sep 2026 19:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789673190;
	bh=rO4Xk7ca8ESb+oYv8OQ9SyITGOoZKo8Z0NSG5YOr7lI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KvZ+mieqThE7O7eGd5ceAJ5xveKl5KNIi3Gnh55/RyCGHyBWkihmIOqJozQR4vb2Y
	 9K290qb0iWbYxlyroMQhyAzbIn+ouIe4hgwqgd3oefgGpgZyGiUyNuQfys0Q42ozXn
	 frx+oqOBhOdS2OpNB32egvtpoiAbKyUhfZxP3z6E6D8MLbsugQNfitu89tr22H4TAk
	 zXy+Qy+S8j5Msgl9Iiad8GOXUUGRlv/YAJ1lzKYJWGP9pawU37/ZAsdpdx19T9lnX8
	 4l0FTVqfMpmcwCXIHvyyjiqCeXqx3WLDveKJQZ1OlTl+cgtvJcnB43UlFpf4XGFAFc
	 DpBWdUck6pBmQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V2 05/17] i3c: master: Remove stale GETSTATUS length
 check
To: "Adrian Hunter" <adrian.hunter@intel.com>
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, linux-i3c@lists.infradead.org, Frank.Li@kernel.org
In-Reply-To: <20260917191356.133242-6-adrian.hunter@intel.com>
References: <20260917191356.133242-1-adrian.hunter@intel.com>
 <20260917191356.133242-6-adrian.hunter@intel.com>
Date: Thu, 17 Sep 2026 19:26:29 +0000
Message-Id: <20260917192630.41F6F1F00893@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gaTNjOiBHRVRTVEFU
VVMgc2lsZW50IHN1Y2Nlc3Mgb24gMC1ieXRlIHJlYWQgd2l0aCBhbWQtaTNjLW1hc3RlcgotLQoK
Y29tbWl0IGY3MTljNmQwOGUzMTA2MGYyNDQwYWQxYjM0Zjk0ODY1N2FmNjg0NTkKQXV0aG9yOiBB
ZHJpYW4gSHVudGVyIDxhZHJpYW4uaHVudGVyQGludGVsLmNvbT4KCiAgICBpM2M6IG1hc3Rlcjog
UmVtb3ZlIHN0YWxlIEdFVFNUQVRVUyBsZW5ndGggY2hlY2sKClRoaXMgY29tbWl0IHJlbW92ZXMg
YW4gZXhwbGljaXQgbGVuZ3RoIGNoZWNrIGluIGkzY19tYXN0ZXJfZ2V0c3RhdHVzX2xvY2tlZCgp
LApyZWx5aW5nIGluc3RlYWQgb24gdGhlIGdlbmVyaWMgQ0NDIHJlc3BvbnNlIGxlbmd0aCB2YWxp
ZGF0aW9uLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyLmMgYi9kcml2ZXJzL2kz
Yy9tYXN0ZXIuYwo+IGluZGV4IDQyNWI5OGU2ZWZhYWEuLmM1MDg4N2IwYjM3ZDAgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9pM2MvbWFzdGVyLmMKPiArKysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIuYwo+
IEBAIC0xNzc3LDExICsxNzc3LDYgQEAgc3RhdGljIGludCBpM2NfbWFzdGVyX2dldHN0YXR1c19s
b2NrZWQoc3RydWN0IGkzY19tYXN0ZXJfY29udHJvbGxlciAqbWFzdGVyLAo+ICAJaWYgKHJldCkK
PiAgCQlnb3RvIG91dDsKPiAgCj4gLQlpZiAoZGVzdC5wYXlsb2FkLmxlbiAhPSBzaXplb2YoKmdl
dHN0YXR1cykpIHsKPiAtCQlyZXQgPSAtRUlPOwo+IC0JCWdvdG8gb3V0Owo+IC0JfQo+IC0KPiAg
CWlmIChzdGF0dXMpCj4gIAkJKnN0YXR1cyA9IGJlMTZfdG9fY3B1KGdldHN0YXR1cy0+c3RhdHVz
KTsKCltTZXZlcml0eTogTWVkaXVtXQpEb2VzIHJlbW92aW5nIHRoaXMgZXhwbGljaXQgbGVuZ3Ro
IGNoZWNrIGludHJvZHVjZSBhIHNpbGVudCBmYWlsdXJlIG9uIHN5c3RlbXMKdXNpbmcgdGhlIGFt
ZC1pM2MtbWFzdGVyIGNvbnRyb2xsZXI/CgpXaGVuIGFuIEkzQyBkZXZpY2UgdGVybWluYXRlcyBh
IEdFVFNUQVRVUyByZWFkIHdpdGggMCBieXRlcyBvbiB0aGUKYW1kLWkzYy1tYXN0ZXIgY29udHJv
bGxlciwgdGhlIGRyaXZlciBpbmNvcnJlY3RseSBtdXRhdGVzIHBheWxvYWQubGVuIHRvIDAKaW5z
dGVhZCBvZiBzZXR0aW5nIGFjdHVhbF9sZW4uCgpUaGUgZ2VuZXJpYyB2YWxpZGF0aW9uIGluIGkz
Y19jY2NfdmFsaWRhdGVfcGF5bG9hZF9sZW4oKSBleHBsaWNpdGx5IHNraXBzCnZhbGlkYXRpb24g
aWYgIXAtPmxlbiwgaW5jb3JyZWN0bHkgcmV0dXJuaW5nIHN1Y2Nlc3MuIEJlZm9yZSB0aGlzIHBh
dGNoLCB0aGUKZXhwbGljaXQgbGVuZ3RoIGNoZWNrIGhlcmUgc2FmZWx5IGNhdWdodCB0aGUgZHJp
dmVyJ3MgbXV0YXRlZCAwLWxlbmd0aCBhbmQKY29ycmVjdGx5IHJldHVybmVkIC1FSU8uCgpXaXRo
b3V0IHRoaXMgY2hlY2ssIHRoZSBmdW5jdGlvbiBzaWxlbnRseSBzdWNjZWVkcyBhbmQgcmVhZHMg
dGhlIHplcm9lZApnZXRzdGF0dXMtPnN0YXR1cyBzdHJ1Y3R1cmUuIENhbiB0aGlzIGxlYWQgdG8g
aW5jb3JyZWN0IGJlaGF2aW9yIG9uIHRoZXNlCnN5c3RlbXM/CgotLSAKU2FzaGlrbyBBSSByZXZp
ZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwOTE3MTkxMzU2LjEzMzI0
Mi0xLWFkcmlhbi5odW50ZXJAaW50ZWwuY29tP3BhcnQ9NQoKLS0gCmxpbnV4LWkzYyBtYWlsaW5n
IGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
