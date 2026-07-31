Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1EA7C54F54
	for <linux-i3c@archiver.kernel.org>; Fri, 31 Jul 2026 04:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x6fSIlBe14+Il9ox3NFeBhm/2Sp2gs2NHYEXxQ2xuiw=; b=vo2TAFiEpdWg4T
	GAdNYF/G90qm4jXGWCohTEHhWNsj2vLduW3F4xv+dKQUZeixDAPux8SaG72BR5VfincrT2hHk5Hxs
	yPmeBhtu01YmO2AsDS1bGXoUrXTeK5mtAUk/aY5JwhPL61L7OT68Np1qa+euefvXmsXF+SFhPmPcZ
	cpsCWx8MBHoylXvP9mHMj6nIuRURe9XxEXikAqyCCRMYV2qduSUYyE20XqEWsqOR0ulUYcqirK1qv
	pvgSbruRdUEj+Y2w5LhxFvCuKcUVk/9fpK25gEynRdwKxiXsFsgg+GCEJStxjECnjS+sdIzpGa/RV
	qDzn5I+ZuhM5NPbpseuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpexs-0000000BkDz-3FgN;
	Fri, 31 Jul 2026 04:35:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpexr-0000000BkDk-2QPO
	for linux-i3c@lists.infradead.org;
	Fri, 31 Jul 2026 04:35:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 38737600C8;
	Fri, 31 Jul 2026 04:35:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CD251F000E9;
	Fri, 31 Jul 2026 04:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785472516;
	bh=xn+xIrtHLy3VWNww40JS/rp5lYs2UClCb6IITSxK2TQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Jhu/xDEBm7G/Y6DTjT9cS23ttMLKDv5Wz1L1XnOSWAylxZKwttRFwsB5Qayfy80ij
	 2G0lrCnCGkSobSTNL88njBnjCy6ZW6PWTeLL3NO8Y9qrW4KnkcQ7MzOZeywEM35I+9
	 CclRSLdXnaCgyT30K/MTp5G1c3WJg9lgA9eRn6QWZArvAQ8X8XcpEKW/Y97L2JYn4i
	 nS9YTLiDwQX/kzE4MUEnBsNXFM0iVxCukGZaH8LGL4YgKebfM6hFONlrP/I5wTkvAA
	 6uwG8zXGsubyU+FYuNqeTEpBvgzFvQtoDoZiV0cXHnmaKx60/3jyxGbMiRKmQ+5xew
	 voCVC2XyetZkA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] i3c: master: dw-i3c-master: fix OD timing for first
 broadcast
To: tze.yee.ng@altera.com
Cc: Frank.Li@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, linux-i3c@lists.infradead.org
In-Reply-To: <c2d80c4fabd36aa00dc1fc507ff20211bba10c3f.1785471627.git.tze.yee.ng@altera.com>
References: <c2d80c4fabd36aa00dc1fc507ff20211bba10c3f.1785471627.git.tze.yee.ng@altera.com>
Date: Fri, 31 Jul 2026 04:35:15 +0000
Message-Id: <20260731043516.5CD251F000E9@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIEluaXRpYWxpemF0aW9u
IGZhaWx1cmUgb24gQUNQSS9EVCBwbGF0Zm9ybXMgZHVlIHRvIG1pc3NpbmcgY29yZSBjbG9jayBm
YWxsYmFjayBpbiBkd19pM2NfbWFzdGVyX3NldF9zcGVlZCgpLgotLQoKLS0tIFBhdGNoIFsxXTog
W1BBVENIIHY0XSBpM2M6IG1hc3RlcjogZHctaTNjLW1hc3RlcjogZml4IE9EIHRpbWluZyBmb3Ig
Zmlyc3QgYnJvYWRjYXN0IC0tLQpjb21taXQgYzQ1OTY1MTgyMjJlZDAwY2I2YzE1ZTI5NjNhODQ2
Njk0YjdmNWQ1NQpBdXRob3I6IFR6ZSBZZWUgTmcgPHR6ZS55ZWUubmdAYWx0ZXJhLmNvbT4KCmkz
YzogbWFzdGVyOiBkdy1pM2MtbWFzdGVyOiBmaXggT0QgdGltaW5nIGZvciBmaXJzdCBicm9hZGNh
c3QKClRoaXMgY29tbWl0IGltcGxlbWVudHMgdGhlIC0+c2V0X3NwZWVkKCkgY2FsbGJhY2sgdG8g
YWxsb3cgdGhlIEkzQyBjb3JlIHRvCnN3aXRjaCBvcGVuLWRyYWluIHRpbWluZ3MgZm9yIHRoZSBm
aXJzdCBicm9hZGNhc3QgYWRkcmVzcy4gSXQgY2FjaGVzIHRoZQpub3JtYWwgT0QgcmVnaXN0ZXIg
dmFsdWUgZHVyaW5nIGJ1cyBpbml0aWFsaXphdGlvbiBhbmQgY29tcHV0ZXMgYSBzZXBhcmF0ZQpv
ZF9oY250IGZvciB0aGUgc2xvdyBwYXRoLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFz
dGVyL2R3LWkzYy1tYXN0ZXIuYyBiL2RyaXZlcnMvaTNjL21hc3Rlci9kdy1pM2MtbWFzdGVyLmMK
PiBpbmRleCAzODE2YTUwYTUyY2M1Li4xMWFlNTE3Y2YyZTYwIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvaTNjL21hc3Rlci9kdy1pM2MtbWFzdGVyLmMKPiArKysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIv
ZHctaTNjLW1hc3Rlci5jCgpbIC4uLiBdCgo+IEBAIC0xNTMxLDYgKzE1MzcsNTAgQEAgc3RhdGlj
IGlycXJldHVybl90IGR3X2kzY19tYXN0ZXJfaXJxX2hhbmRsZXIoaW50IGlycSwgdm9pZCAqZGV2
X2lkKQo+ICAJcmV0dXJuIElSUV9IQU5ETEVEOwo+ICB9Cj4gIAo+ICtzdGF0aWMgaW50IGR3X2kz
Y19tYXN0ZXJfc2V0X3NwZWVkKHN0cnVjdCBpM2NfbWFzdGVyX2NvbnRyb2xsZXIgKm0sCj4gKwkJ
CQkgICBlbnVtIGkzY19vcGVuX2RyYWluX3NwZWVkIHNwZWVkKQo+ICt7Cj4gKwlzdHJ1Y3QgZHdf
aTNjX21hc3RlciAqbWFzdGVyID0gdG9fZHdfaTNjX21hc3RlcihtKTsKPiArCXVuc2lnbmVkIGxv
bmcgY29yZV9yYXRlOwo+ICsJdTMyIHNjbF90aW1pbmcsIG9kX2hjbnQ7Cj4gKwl1OCBsY250Owo+
ICsKPiArCVBNX1JVTlRJTUVfQUNRVUlSRV9BVVRPU1VTUEVORChtYXN0ZXItPmRldiwgcG0pOwo+
ICsJaWYgKFBNX1JVTlRJTUVfQUNRVUlSRV9FUlIoJnBtKSkKPiArCQlyZXR1cm4gLUVOWElPOwo+
ICsKPiArCXN3aXRjaCAoc3BlZWQpIHsKPiArCWNhc2UgSTNDX09QRU5fRFJBSU5fU0xPV19TUEVF
RDoKPiArCQljb3JlX3JhdGUgPSBjbGtfZ2V0X3JhdGUobWFzdGVyLT5jb3JlX2Nsayk7Cj4gKwkJ
aWYgKCFjb3JlX3JhdGUpCj4gKwkJCXJldHVybiAtRUlOVkFMOwoKW1NldmVyaXR5OiBIaWdoXQpX
aWxsIHRoaXMgY2F1c2UgcGxhdGZvcm1zIHdpdGhvdXQgYSBjb3JlIGNsb2NrIHByb3ZpZGVyIHRv
IGZhaWwgaGVyZT8KClRoZSByZXN0IG9mIHRoZSBkcml2ZXIgdXNlcyBkd19pM2NfbWFzdGVyX2dl
dF9jb3JlX3JhdGUoKSB0byBmYWxsIGJhY2sgdG8KdGhlICJjbG9jay1mcmVxdWVuY3kiIGRldmlj
ZSBwcm9wZXJ0eSBpZiBtYXN0ZXItPmNvcmVfY2xrIGlzIE5VTEwgKHN1Y2ggYXMKb24gQUNQSS9E
VCBwbGF0Zm9ybXMpLiBJZiBjbGtfZ2V0X3JhdGUoKSBpcyBjYWxsZWQgZGlyZWN0bHkgaGVyZSBv
biB0aG9zZQpwbGF0Zm9ybXMsIGl0IGFwcGVhcnMgY29yZV9yYXRlIHdpbGwgYmUgMCBhbmQgdGhl
IGNhbGxiYWNrIHdpbGwgYWJvcnQgd2l0aAotRUlOVkFMLgoKPiArCj4gKwkJbGNudCA9IFNDTF9J
M0NfVElNSU5HX0xDTlQobWFzdGVyLT5pM2Nfb2RfdGltaW5nX25vcm1hbCk7Cj4gKwkJb2RfaGNu
dCA9IERJVl9ST1VORF9VUF9VTEwoKHU2NClJM0NfQlVTX1RISUdIX0lOSVRfT0RfTUlOX05TICoK
PiArCQkJCQkgIGNvcmVfcmF0ZSwgTlNFQ19QRVJfU0VDKSAtIDE7CgpbIC4uLiBdCgotLSAKU2Fz
aGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0L2MyZDgwYzRm
YWJkMzZhYTAwZGMxZmM1MDdmZjIwMjExYmJhMTBjM2YuMTc4NTQ3MTYyNy5naXQudHplLnllZS5u
Z0BhbHRlcmEuY29tP3BhcnQ9MQoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1pM2MK
