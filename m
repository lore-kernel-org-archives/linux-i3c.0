Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11DABC54F4C
	for <linux-i3c@archiver.kernel.org>; Tue, 28 Jul 2026 06:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BZJ68uXoeIjWFL8NXYnZj9w9NST2piKgaiVAk7hpGss=; b=W44cjp/uAD7EaH
	fbavkPMr8MB571jebAZUvxg8Vo30aQY3wPIZd+MmwUAtjOYBtp52tvblV1USlcKsFM0L0JY8oTK27
	6ikq4IxpkzKzB6+/OswS+vG56O6ZG3bXjPJgM2aQYQzh7re97WVIMYjk+6Uy31+EII6s38BoSEyhc
	ubMSu1MkIGAoGp/xiV8JMk048CzFi94uVQNEOhVPIj+Yfl7LeQ5PQZTZ/HIXcBJA/y7vixJNOrB1Z
	iu4koq8eI0pE3jYK9uxlKxNRllyLfnX9aMijrQ8LTtGxcDipnsf8cInSm4JMvxvd+KrrUViaaJFbp
	ILlMyh7n//lv6PDOi/9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wobaJ-00000004ZCb-35kr;
	Tue, 28 Jul 2026 06:46:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wobaH-00000004ZCE-3rJa
	for linux-i3c@lists.infradead.org;
	Tue, 28 Jul 2026 06:46:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id ACEFA41857;
	Tue, 28 Jul 2026 06:46:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C2F91F000E9;
	Tue, 28 Jul 2026 06:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785221197;
	bh=VxLAibTpXM9QqGqc2NRQ6tXHSARNGijEq1XY4JZ6x7o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bKOwZ//IcZeAv/nfbvg/kUAg5I6jYuauQ1jEJ+K5M0ERfNxzN64Xe7pjOh1duSuDU
	 frYS9xAq+tVKkaS04wGs1SVbQjUQh7QTLrGyhsO4i2kL2dmxKE0Z/UdNx+qh4oFaD/
	 JF5LRM4TzIZlPtAXGH7ankODb0JoZEVhFvkP1jEF41WD0kRZpisLdUfvqF1RTrLbdP
	 FH5faWr1wIIfkLGl0zi2zDVZGarAn5dK8xKlTFdgmjJiW7ZGIV2VleqKlLQ/OU4X2w
	 OC8pQr5YfzsYsJvIvgLrA0ElnqOqifbVINeaBAHzXwXK1HPG/emHeXaZ9xfXjrTw3V
	 AAV5Dh+wZo/zw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] i3c: fix potential NULL dereference in
 send_ccc_cmd_locked
To: "Hongling Zeng" <zenghongling@kylinos.cn>
Cc: linux-i3c@lists.infradead.org, Frank.Li@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260728063045.73473-1-zenghongling@kylinos.cn>
References: <20260728063045.73473-1-zenghongling@kylinos.cn>
Date: Tue, 28 Jul 2026 06:46:36 +0000
Message-Id: <20260728064637.4C2F91F000E9@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpQcmUtZXhpc3RpbmcgaXNzdWVzOgot
IFtNZWRpdW1dIFRoaXMgcHJvYmxlbSB3YXNuJ3QgaW50cm9kdWNlZCBieSB0aGlzIHBhdGNoLCBi
dXQgdGhlIHBhdGNoIHByb3ZpZGVzIGFuIGluY29tcGxldGUgZml4IGZvciBhIHRoZW9yZXRpY2Fs
IE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSwgbGVhdmluZyBhbiBpZGVudGljYWwgZGVyZWZlcmVu
Y2UgdW5oYW5kbGVkIG9uIHRoZSBzdWNjZXNzIHBhdGguCi0tCgotLS0gUGF0Y2ggWzFdOiBbUEFU
Q0hdIGkzYzogZml4IHBvdGVudGlhbCBOVUxMIGRlcmVmZXJlbmNlIGluIHNlbmRfY2NjX2NtZF9s
b2NrZWQgLS0tCmNvbW1pdCBlMjk0NTVhNDYxNjYwOGVlNjIzZTMwMWM5NDVhMDg3YjM3MGY2OThm
CkF1dGhvcjogSG9uZ2xpbmcgWmVuZyA8emVuZ2hvbmdsaW5nQGt5bGlub3MuY24+CgppM2M6IGZp
eCBwb3RlbnRpYWwgTlVMTCBkZXJlZmVyZW5jZSBpbiBzZW5kX2NjY19jbWRfbG9ja2VkCgpUaGlz
IHBhdGNoIHJlc3RyaWN0cyByZXNldHRpbmcgdGhlIHBheWxvYWQgYWN0dWFsX2xlbiB0byBESVJF
Q1QgY29tbWFuZHMKdG8gYXZvaWQgYSBwb3RlbnRpYWwgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNl
IGZvciBicm9hZGNhc3QgY29tbWFuZHMgd2l0aApOVUxMIGRlc3RzIGFuZCBuZGVzdHMgPiAwLgoK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIu
Ywo+IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci5jCj4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVy
LmMKClsgLi4uIF0KCj4gQEAgLTEwNTEsNyArMTA1MSw3IEBAIHN0YXRpYyBpbnQgaTNjX21hc3Rl
cl9zZW5kX2NjY19jbWRfbG9ja2VkKHN0cnVjdCBpM2NfbWFzdGVyX2NvbnRyb2xsZXIgKm1hc3Rl
ciwKPiAgCWZvciAoYXR0ZW1wdCA9IDA7IGF0dGVtcHQgPCBtYXhfYXR0ZW1wdHM7IGF0dGVtcHQr
Kykgewo+ICAJCXVuc2lnbmVkIGludCBpOwo+ICAKPiAtCQlpZiAoY21kLT5ybncpCj4gKwkJaWYg
KGNtZC0+cm53ICYmIChjbWQtPmlkICYgSTNDX0NDQ19ESVJFQ1QpKQo+ICAJCQlmb3IgKGkgPSAw
OyBpIDwgY21kLT5uZGVzdHM7IGkrKykKPiAgCQkJCWNtZC0+ZGVzdHNbaV0ucGF5bG9hZC5hY3R1
YWxfbGVuID0gMDsKPiAgCj4gIAkJY21kLT5lcnIgPSBJM0NfRVJST1JfVU5LTk9XTjsKPiAgCQly
ZXQgPSBtYXN0ZXItPm9wcy0+c2VuZF9jY2NfY21kKG1hc3RlciwgY21kKTsKPiAgCQlpZiAoIXJl
dCAmJiBjbWQtPmVyciA9PSBJM0NfRVJST1JfVU5LTk9XTikKPiAgCQkJYnJlYWs7Cj4gIAl9Cj4g
IAo+ICAJaWYgKCFyZXQpCj4gIAkJcmV0ID0gaTNjX2NjY192YWxpZGF0ZV9wYXlsb2FkX2xlbihj
bWQpOwoKW1NldmVyaXR5OiBNZWRpdW1dClRoaXMgaXMgYSBwcmUtZXhpc3RpbmcgaXNzdWUsIGJ1
dCBkb2VzIHRoaXMgcGF0Y2ggbGVhdmUgYW4gaWRlbnRpY2FsIE5VTEwKcG9pbnRlciBkZXJlZmVy
ZW5jZSB1bmhhbmRsZWQgb24gdGhlIHN1Y2Nlc3MgcGF0aD8KCklmIGEgYnJvYWRjYXN0IGNvbW1h
bmQgKHdoZXJlIEkzQ19DQ0NfRElSRUNUIGlzIG5vdCBzZXQpIHdpdGggY21kLT5ybncgdHJ1ZQph
bmQgY21kLT5kZXN0cyA9PSBOVUxMIHN1Y2NlZWRzLCB0aGUgcmV0cnkgbG9vcCBhYm92ZSBpcyBu
b3cgc2FmZS4gSG93ZXZlciwKZXhlY3V0aW9uIHByb2NlZWRzIHRvIGkzY19jY2NfdmFsaWRhdGVf
cGF5bG9hZF9sZW4oKToKCmRyaXZlcnMvaTNjL21hc3Rlci5jOmkzY19jY2NfdmFsaWRhdGVfcGF5
bG9hZF9sZW4oKSB7CiAgICBpZiAoIWNtZC0+cm53KQogICAgICAgIHJldHVybiAwOwoKICAgIGZv
ciAoaSA9IDA7IGkgPCBjbWQtPm5kZXN0czsgaSsrKSB7CiAgICAgICAgc3RydWN0IGkzY19jY2Nf
Y21kX3BheWxvYWQgKnAgPSAmY21kLT5kZXN0c1tpXS5wYXlsb2FkOwogICAgICAgIC4uLgp9CgpX
aWxsIHRoaXMgcmVzdWx0IGluIHRoZSBleGFjdCBzYW1lIGNyYXNoIHdoZW4gZXZhbHVhdGluZwpj
bWQtPmRlc3RzW2ldLnBheWxvYWQ/CgpBbHNvLCBlYXJsaWVyIGluIGkzY19tYXN0ZXJfc2VuZF9j
Y2NfY21kX2xvY2tlZCgpOgoKICAgIGlmICgoY21kLT5pZCAmIEkzQ19DQ0NfRElSRUNUKSAmJiAo
IWNtZC0+ZGVzdHMgfHwgIWNtZC0+bmRlc3RzKSkKICAgICAgICByZXR1cm4gLUVJTlZBTDsKClRo
aXMgZWFybHkgdmFsaWRhdGlvbiBjaGVjayBvbmx5IGVuZm9yY2VzIGNtZC0+ZGVzdHMgIT0gTlVM
TCBmb3IgRElSRUNUCmNvbW1hbmRzLiBDb3VsZCB0aGlzIGJlIHVwZGF0ZWQgdG8gcmVqZWN0IGFu
eSBjb21tYW5kIHdoZXJlIGNtZC0+ZGVzdHMgaXMKTlVMTCBidXQgY21kLT5uZGVzdHMgPiAwLCBy
YXRoZXIgdGhhbiBwYXRjaGluZyBpbmRpdmlkdWFsIGRlcmVmZXJlbmNlcz8KCi0tIApTYXNoaWtv
IEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA3MjgwNjMw
NDUuNzM0NzMtMS16ZW5naG9uZ2xpbmdAa3lsaW5vcy5jbj9wYXJ0PTEKCi0tIApsaW51eC1pM2Mg
bWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
