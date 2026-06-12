Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92260CD98CE
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Jun 2026 16:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=96wSQ+Nbv96bIp/al/gmmWxz1JjY+hYnH8pMI7FdBSw=; b=sozGBOwl1iW4fK
	qCpm56kMZ6kqgwDAFBPIZjujQsZU872aHBXwm/hymeMaoAiwK4XdRP5tocpYxUVGPAvuZaSbCEhK/
	DzGdqa+IT+Z+FwJfpIQDzy6UQZY0dOmLQerHKgG1wFXGK/uHM0K2TJtxdWlZxAqGi8HWPzpmPJYyd
	eP0S/E/pZaBmZ4aZAyh6rBIQDlWwCHpNjRZEqINNaBEwJgE79hJv+GKWaMQhY1rFnzEICCI2r0XwM
	I7d3CYdh3VM5ZeuoOrdjnzfUOdCi4PpVPckjNB1dc+PZWsPMZKCbk5je0Hg8uHbLUmUrXvemOJoj/
	86CkuPmlK7zlgGkAm3aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4bj-0000000BDn2-1810;
	Fri, 12 Jun 2026 16:19:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4bh-0000000BDml-2ak8
	for linux-i3c@lists.infradead.org;
	Fri, 12 Jun 2026 16:19:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 16B5C60008
	for <linux-i3c@lists.infradead.org>; Fri, 12 Jun 2026 16:19:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92E251F000E9;
	Fri, 12 Jun 2026 16:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781281184;
	bh=WufQqEBJ2URjq7P1URTgdfrNVKDEav62+LJX2U+xN7k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oiy9gF3VqTT9aBzQkAnHGtgcoqH+OpOjFKtIpXhtiaJFBIrKTW+HE/H+s8uVRYsZF
	 FLjoy3TddkzOGm4vlPdvhl2/VBxzLV981V9Fuxi1fUjsPzscuopQ6T90hyO9EA9Esu
	 B+l/sH4SJpFU0Qz+cZ5U5VkUB+D//P+t/uRI0USdA4q2XK5wwt/wwNvq7k8j/6fLBK
	 WnqQIErLjp4bL7r82hmYs3ZF2T/Izz2yYOnOfHJ4pV0Lh4lEtLLX1v1XmwZAOh+ANU
	 5xtp7WXQ8DFZ4dfumXUe1AuqbdXo5LqE96PhBvjlPMjkiQ/AXOQ8L/ig4bSra/lXED
	 GJ9ObKLTtj8eQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 12/16] i3c: renesas: Update HW registers after SW
 computations are done
To: "Claudiu Beznea" <claudiu.beznea@kernel.org>
Cc: linux-i3c@lists.infradead.org, Frank.Li@kernel.org
In-Reply-To: <20260612160458.3102106-13-claudiu.beznea@kernel.org>
References: <20260612160458.3102106-13-claudiu.beznea@kernel.org>
Date: Fri, 12 Jun 2026 16:19:43 +0000
Message-Id: <20260612161944.92E251F000E9@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpQcmUtZXhpc3RpbmcgaXNzdWVzOgot
IFtIaWdoXSBEaXZpc2lvbiBieSB6ZXJvIGNyYXNoIGlmIGBpMmMtc2NsLWh6YCBwcm9wZXJ0eSBp
cyBvbWl0dGVkIGluIHB1cmUgbW9kZS4KLSBbTWVkaXVtXSBQb3RlbnRpYWwgZGl2aXNpb24gYnkg
emVybyBjcmFzaCBhbmQgcHJlY2lzaW9uIGxvc3MgaW4gb3Blbi1kcmFpbiB0aW1pbmcgY2FsY3Vs
YXRpb25zLgotLQoKY29tbWl0IGE1YjA5ZGM0NjIzYWE2ZTQ0NjRiOTllYzljNDkzYmYyODEzN2My
NGQKQXV0aG9yOiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWEudWpAYnAucmVuZXNhcy5j
b20+CgppM2M6IHJlbmVzYXM6IFVwZGF0ZSBIVyByZWdpc3RlcnMgYWZ0ZXIgU1cgY29tcHV0YXRp
b25zIGFyZSBkb25lCgpUaGUgcGF0Y2ggZGVmZXJzIGhhcmR3YXJlIHJlZ2lzdGVyIHdyaXRlcyB1
bnRpbCBhZnRlciBzb2Z0d2FyZSBjYWxjdWxhdGlvbnMKYW5kIGNhY2hlIHVwZGF0ZXMgYXJlIGNv
bXBsZXRlIGluIHJlbmVzYXNfaTNjX2J1c19pbml0KCksIGFpbWluZyB0bwpzdXBwb3J0IGZ1dHVy
ZSBydW50aW1lIFBNIGVuaGFuY2VtZW50cy4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21h
c3Rlci9yZW5lc2FzLWkzYy5jIGIvZHJpdmVycy9pM2MvbWFzdGVyL3JlbmVzYXMtaTNjLmMKPiBp
bmRleCBkNTI0N2U4NDFhODM4Li45NmQ0ZmVkMzJiZjk1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
aTNjL21hc3Rlci9yZW5lc2FzLWkzYy5jCj4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyL3JlbmVz
YXMtaTNjLmMKPiBAQCAtNTYwLDEwICs1NjAsNiBAQCBzdGF0aWMgaW50IHJlbmVzYXNfaTNjX2J1
c19pbml0KHN0cnVjdCBpM2NfbWFzdGVyX2NvbnRyb2xsZXIgKm0pCj4gIAlpZiAoIWkzYy0+cmF0
ZSkKPiAgCQlyZXR1cm4gLUVJTlZBTDsKPiAgCj4gLQlyZXQgPSByZW5lc2FzX2kzY19yZXNldChp
M2MpOwo+IC0JaWYgKHJldCkKPiAtCQlyZXR1cm4gcmV0Owo+IC0KPiAgCWkyY190b3RhbF90aWNr
cyA9IERJVl9ST1VORF9VUChpM2MtPnJhdGUsIGJ1cy0+c2NsX3JhdGUuaTJjKTsKCltTZXZlcml0
eTogSGlnaF0KVGhpcyBpcyBhIHByZS1leGlzdGluZyBpc3N1ZSBhbmQgd2FzIG5vdCBpbnRyb2R1
Y2VkIGJ5IHRoaXMgcGF0Y2gsIGJ1dCBjYW4KdGhpcyBjYXVzZSBhIGRpdmlzaW9uIGJ5IHplcm8g
Y3Jhc2g/CgpJZiB0aGUgaTJjLXNjbC1oeiBkZXZpY2UgdHJlZSBwcm9wZXJ0eSBpcyBub3QgcHJl
c2VudCwgb2ZfcG9wdWxhdGVfaTNjX2J1cygpCmxlYXZlcyBtYXN0ZXItPmJ1cy5zY2xfcmF0ZS5p
MmMgYXMgMC4gSW4gcHVyZSBtb2RlIChJM0NfQlVTX01PREVfUFVSRSksCmkzY19idXNfc2V0X21v
ZGUoKSBleHBsaWNpdGx5IGRvZXMgbm90IGluaXRpYWxpemUgc2NsX3JhdGUuaTJjLCB3aGljaAp3
b3VsZCBsZWF2ZSBpdCBhcyAwIGhlcmUuCgpbIC4uLiBdCgo+ICAJcmV0ID0gaTNjX21hc3Rlcl9n
ZXRfZnJlZV9hZGRyKG0sIDApOwo+ICAJaWYgKHJldCA8IDApCj4gIAkJcmV0dXJuIHJldDsKPiAg
Cj4gKwlpbmZvLmR5bl9hZGRyID0gcmV0Owo+ICAJaTNjLT5keW5fYWRkciA9IHJldDsKPiAtCXJl
bmVzYXNfd3JpdGVsKGkzYy0+cmVncywgTVNEVkFELCBNU0RWQURfTURZQUQocmV0KSB8IE1TRFZB
RF9NRFlBRFYpOwo+ICsJaTNjLT5yZWZjbGtfZGl2ID0gY2tzOwo+ICsKPiArCXJldCA9IHJlbmVz
YXNfaTNjX3Jlc2V0KGkzYyk7Cj4gKwlpZiAocmV0KQo+ICsJCXJldHVybiByZXQ7CgpbU2V2ZXJp
dHk6IE1lZGl1bV0KVGhpcyBpcyBhIHByZS1leGlzdGluZyBpc3N1ZSBhbmQgd2FzIG5vdCBpbnRy
b2R1Y2VkIGJ5IHRoaXMgcGF0Y2gsIGJ1dCBkb2VzCnRoZSB0aW1pbmcgY2FsY3VsYXRpb24gaW4g
dGhpcyBmdW5jdGlvbiByaXNrIGEgZGl2aXNpb24gYnkgemVybyBvciBwcmVjaXNpb24KbG9zcz8K
CkluIHJlbmVzYXNfaTNjX2J1c19pbml0KCksIHRoZXJlIGFyZSBjYWxjdWxhdGlvbnMgc2ltaWxh
ciB0bzoKCiAgICBvZF9sb3dfdGlja3MgLT0gdC5zY2xfZmFsbF9ucyAvIChOU0VDX1BFUl9TRUMg
LyBpM2MtPnJhdGUpICsgMTsKCklmIHRoZSBpbnB1dCBjbG9jayByYXRlIGkzYy0+cmF0ZSBleGNl
ZWRzIDEgR0h6IChOU0VDX1BFUl9TRUMpLCB0aGUgaW5uZXIKZGl2aXNpb24gZXZhbHVhdGVzIHRv
IDAsIHdoaWNoIHdvdWxkIGNhdXNlIGEgZGl2aWRlLWJ5LXplcm8ga2VybmVsIHBhbmljLgoKRXZl
biBmb3IgcmF0ZXMgdW5kZXIgMSBHSHosIHRoaXMgcGF0dGVybiBjYXVzZXMgc2V2ZXJlIHByZWNp
c2lvbiBsb3NzIGZvcgpub24taW50ZWdlciBtdWx0aXBsZXMgb2YgMSBHSHouCgpXb3VsZCB1c2lu
ZyBhIHBhdHRlcm4gbGlrZSBESVZfUk9VTkRfVVBfVUxMKCh1NjQpbnMgKiByYXRlLCBOU0VDX1BF
Ul9TRUMpCmJlIHNhZmVyIGhlcmUgdG8gcHJldmVudCBib3RoIHRoZSBjcmFzaCBhbmQgcHJlY2lz
aW9uIGxvc3M/Cgo+ICsJcmVuZXNhc193cml0ZWwoaTNjLT5yZWdzLCBTVERCUiwgaTNjLT5pM2Nf
U1REQlIpOwo+ICsJcmVuZXNhc193cml0ZWwoaTNjLT5yZWdzLCBFWFRCUiwgaTNjLT5leHRicik7
Cj4gKwlyZW5lc2FzX3dyaXRlbChpM2MtPnJlZ3MsIFJFRkNLQ1RMLCBSRUZDS0NUTF9JUkVGQ0tT
KGNrcykpOwo+ICsJcmVuZXNhc193cml0ZWwoaTNjLT5yZWdzLCBNU0RWQUQsIE1TRFZBRF9NRFlB
RChpM2MtPmR5bl9hZGRyKSB8IE1TRFZBRF9NRFlBRFYpOwo+ICsKPiArCS8qIEkzQyBodyBpbml0
Ki8KPiArCXJlbmVzYXNfaTNjX2h3X2luaXQoaTNjKTsKPiAgCj4gLQlpbmZvLmR5bl9hZGRyID0g
cmV0Owo+ICAJcmV0dXJuIGkzY19tYXN0ZXJfc2V0X2luZm8oJmkzYy0+YmFzZSwgJmluZm8pOwo+
ICB9CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNo
c2V0LzIwMjYwNjEyMTYwNDU4LjMxMDIxMDYtMS1jbGF1ZGl1LmJlem5lYUBrZXJuZWwub3JnP3Bh
cnQ9MTIKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
aTNjCg==
