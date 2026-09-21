Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E700C982ED
	for <linux-i3c@archiver.kernel.org>; Mon, 21 Sep 2026 23:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sINy8QwWJmQcuQgMLMtomx5DllBnJuRLe3mAt0W+ucs=; b=DgqtdeXJBJXFS/
	HMn99oIM97URMcq3Qf96jRx8/IWY5UBjqyE8R9DYO3TBav2qtd5321RSCTu54rOlCg8G+fT2THnD4
	tSLCzXrD+Xg15qlatxgm0l5WScFaEoTLE+nG8QmK36olSo/D93au2eiEmyrYVpq68yT5KChxF41uy
	UwVf/E5I8fbMVAr3qIkcgDDQtBjgeQp7+B0tGqKTJEZq5AusQYa4EYdAlfKAvhNz6QN4XVrDvJUIl
	Wth0+E6Q9oLETtguAU4n20yyMkqHMBffYG8rSG0fQFE8i8JQEk26FXGCOG+K40+EWvKPcN233yXcu
	Heeo3ultMGfK1lK8kKCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8nFr-00000003eMG-3xER;
	Mon, 21 Sep 2026 23:16:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8nFr-00000003eM5-0mNW
	for linux-i3c@lists.infradead.org;
	Mon, 21 Sep 2026 23:16:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9ADAF40A92;
	Mon, 21 Sep 2026 23:16:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45F391F000FF;
	Mon, 21 Sep 2026 23:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790032618;
	bh=379g+SqT/CZi3XeEPbMlTi3egBaIIdAKwgXtIKM5GEE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LDPhN7yBDi0wvW1jItW0gFBLVKrfyO4uyfqOvnnk24bS97oPH5te3gC3sifwmrZ/A
	 H20LH5o4DQKo7oElTEyx8VBub2+MaiDcmxdskxmMpip9/ZhW9U5m0dgJw9gZFkZWFK
	 Fwk/T1g9J1xkfHLyL8h8AUK8tD5zzVZjrqJkSHFWfcIvkBFGbjQliG8z1g4I5elYcv
	 dytlGS8JQ3yaO3iZthbmBR+8LYKuHCMuVql0FawimqVrvNKxri+kZRuY5HT/ePeK0o
	 s3cXLVF2KxMxZIPKGsZdltdu6D53UppX6JSyuXxGxy+SGjeg6AgVi+ajGd7+HSnHq+
	 zm5jyRDMLNuDQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/5] i3c: use actual_len for read transfers
To: "Sam Agazaryan" <samagazaryan@google.com>
Cc: linux-i3c@lists.infradead.org, Frank.Li@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260921230603.2518652-4-samagazaryan@google.com>
References: <20260921230603.2518652-1-samagazaryan@google.com>
 <20260921230603.2518652-4-samagazaryan@google.com>
Date: Mon, 21 Sep 2026 23:16:57 +0000
Message-Id: <20260921231658.45F391F000FF@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gbmV0L21jdHA6IG1j
dHBfaTNjX3JlYWQoKSB1c2VzIHhmZXIubGVuIGluc3RlYWQgb2YgeGZlci5hY3R1YWxfbGVuIGZv
ciBzdGF0cwotLQoKY29tbWl0IGZmOGU2ZTU0MmQ1NzU5ZGEzZDE3NzBhMDcwNDBiNTEzYTkyNGMz
MzEKQXV0aG9yOiBTYW0gQWdhemFyeWFuIDxzYW1hZ2F6YXJ5YW5AZ29vZ2xlLmNvbT4KaTNjOiB1
c2UgYWN0dWFsX2xlbiBmb3IgcmVhZCB0cmFuc2ZlcnMKClRoaXMgY29tbWl0IHVuaWZpZXMgcmVh
ZCBsZW5ndGggcmVwb3J0aW5nIGFjcm9zcyB0aGUgSTNDIHN1YnN5c3RlbSBieSB1c2luZwphY3R1
YWxfbGVuIGZvciByZWFkcy4gSXQgdXBkYXRlcyBzZXZlcmFsIGNvbnRyb2xsZXIgZHJpdmVycyBh
bmQgdGhlIG1jdHAtaTNjCmRyaXZlciB0byB1c2UgYWN0dWFsX2xlbiB3aXRob3V0IG11dGF0aW5n
IGxlbi4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L21jdHAvbWN0cC1pM2MuYyBiL2RyaXZl
cnMvbmV0L21jdHAvbWN0cC1pM2MuYwo+IGluZGV4IDRlODU3ZGQ1ZGY2NDIuLjUzMjQzODViZThj
MDEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9uZXQvbWN0cC9tY3RwLWkzYy5jCj4gKysrIGIvZHJp
dmVycy9uZXQvbWN0cC9tY3RwLWkzYy5jClsgLi4uIF0KPiBAQCAtMTQ1LDE1ICsxNDUsMTUgQEAg
c3RhdGljIGludCBtY3RwX2kzY19yZWFkKHN0cnVjdCBtY3RwX2kzY19kZXZpY2UgKm1pKQo+ICAJ
LyogY2hlY2sgUEVDLCBpbmNsdWRpbmcgYWRkcmVzcyBieXRlICovCj4gIAlhZGRyID0gbWktPmFk
ZHIgPDwgMSB8IDE7Cj4gIAlwZWMgPSBpMmNfc21idXNfcGVjKDAsICZhZGRyLCAxKTsKPiAtCXBl
YyA9IGkyY19zbWJ1c19wZWMocGVjLCB4ZmVyLmRhdGEuaW4sIHhmZXIubGVuIC0gMSk7Cj4gLQlp
ZiAocGVjICE9ICgodTggKil4ZmVyLmRhdGEuaW4pW3hmZXIubGVuIC0gMV0pIHsKPiArCXBlYyA9
IGkyY19zbWJ1c19wZWMocGVjLCB4ZmVyLmRhdGEuaW4sIHhmZXIuYWN0dWFsX2xlbiAtIDEpOwo+
ICsJaWYgKHBlYyAhPSAoKHU4ICopeGZlci5kYXRhLmluKVt4ZmVyLmFjdHVhbF9sZW4gLSAxXSkg
ewo+ICAJCXN0YXRzLT5yeF9jcmNfZXJyb3JzKys7Cj4gIAkJcmMgPSAtRUlOVkFMOwo+ICAJCWdv
dG8gZXJyOwo+ICAJfQo+ICAKPiAgCS8qIFJlbW92ZSBQRUMgKi8KPiAtCXNrYl90cmltKHNrYiwg
eGZlci5sZW4gLSAxKTsKPiArCXNrYl90cmltKHNrYiwgeGZlci5hY3R1YWxfbGVuIC0gMSk7Cj4g
IAo+ICAJY2IgPSBfX21jdHBfY2Ioc2tiKTsKPiAgCWNiLT5oYWxlbiA9IFBJRF9TSVpFOwoKW1Nl
dmVyaXR5OiBNZWRpdW1dCkRvZXMgbWN0cF9pM2NfcmVhZCgpIGFsc28gbmVlZCB0byB1c2UgeGZl
ci5hY3R1YWxfbGVuIHdoZW4gdXBkYXRpbmcgdGhlCm5ldHdvcmsgc3RhdGlzdGljcz8KCkEgZmV3
IGxpbmVzIGJlbG93IHRoaXMgaHVuaywgdGhlIGNvZGUgc3RpbGwgdXBkYXRlcyB0aGUgcnhfYnl0
ZXMgY291bnRlcgp1c2luZyB0aGUgdW5tdXRhdGVkIHhmZXIubGVuOgoKCWlmIChuZXRfc3RhdHVz
ID09IE5FVF9SWF9TVUNDRVNTKSB7CgkJc3RhdHMtPnJ4X3BhY2tldHMrKzsKCQlzdGF0cy0+cnhf
Ynl0ZXMgKz0geGZlci5sZW4gLSAxOwoJfSBlbHNlIHsKCQlzdGF0cy0+cnhfZHJvcHBlZCsrOwoJ
fQoKV2lsbCB0aGlzIGluZmxhdGUgdGhlIHJ4X2J5dGVzIGNvdW50ZXIgYnkgdGhlIG1heGltdW0g
cmVxdWVzdGVkIHJlYWQgbGVuZ3RoCihtaS0+bXJsKSByYXRoZXIgdGhhbiB0aGUgYWN0dWFsIHJl
Y2VpdmVkIGJ5dGVzPwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5k
ZXYvIy9wYXRjaHNldC8yMDI2MDkyMTIzMDYwMy4yNTE4NjUyLTEtc2FtYWdhemFyeWFuQGdvb2ds
ZS5jb20/cGFydD0zCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWkzYwo=
