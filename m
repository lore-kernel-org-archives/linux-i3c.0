Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B3BCD6E79
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Jun 2026 20:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V8SHtv99yghp2UzsRg4fQ5fjCZzitiXQClfdPzgthaU=; b=oAqVNp5wjXbw9E
	wLPYg4ilMsQMH6raxjP5EiJponqQhJb6jIM4FfMk7foFy7wa9Ez65f38UwMcqR62q2mC7yJWbYZC+
	d5683fAOsMbrQ8t4mRzp5D+Bj8V55enquzPAjpLmY5KRQwD5+6kr1sokjmeURE5CUl+GizH59VKZ9
	hgH7oUu9GKceEQCnX9tCmpsJ7zqzNvGBwR5Vjc2854v+S0hIL4QzYmtSrlgM8I0ued1SkX+15enrl
	1OHB7u0hhUY9Y7w5wPYKcveoLYvP+Ksj0ouxmmt7PpNxkk8r7p0eLt1yZ1w/uS2c6AVL/9p+oN7fX
	GbInVVN+JoHoKOSFG/ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWgZb-00000004MNs-0TNR;
	Mon, 08 Jun 2026 20:27:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWgZa-00000004MNk-1Ouv
	for linux-i3c@lists.infradead.org;
	Mon, 08 Jun 2026 20:27:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7A9D660098;
	Mon,  8 Jun 2026 20:27:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA1141F00898;
	Mon,  8 Jun 2026 20:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780950469;
	bh=wQkm7ma8LlSsYpOjIIJAx2xt6+ZnvJgRUBtplQMgW9c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AcmJNmbJxW/z6F9N4k0F8AVgRur6dLF9/VjirueYIa20w4Ecmlc+bHv2jNUI1OAe1
	 vVpJ9xogs9HOqqcoBwt5QROV9updzjKaMUX7OILrBLIKTlNKuwLhjln5w5WN8211n0
	 c+kniQDv63BUhThcRuJkdWt3fvZPCQhqdkWtspwuTY0Nth+GCwpGnjs+m9fzYG3HkI
	 l0OvX9xBKc5BKOj/iGCw7twN4Q/33Kp2GIOGoTwRABakZ65S+7moGibt8D57xE9D1e
	 1cYvcL5n33fFje1baWeTrgSyANBBBLAk43M+paqL4Hub1y+m/XQ2KH4Jwudj7nYnQr
	 3c5ZlWN6xGMeA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 10/17] i3c: renesas: Return immediately if there is
 no transfer
To: "Claudiu Beznea" <claudiu.beznea@kernel.org>
Cc: Frank.Li@kernel.org, linux-i3c@lists.infradead.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260608201543.804902-11-claudiu.beznea@kernel.org>
References: <20260608201543.804902-11-claudiu.beznea@kernel.org>
Date: Mon, 08 Jun 2026 20:27:48 +0000
Message-Id: <20260608202748.EA1141F00898@smtp.kernel.org>
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
IFtIaWdoXSBUaGlzIHByb2JsZW0gd2Fzbid0IGludHJvZHVjZWQgYnkgdGhpcyBwYXRjaCwgYnV0
IHRoZSByZXR1cm4gdmFsdWUgb2YgYHdhaXRfZm9yX2NvbXBsZXRpb25fdGltZW91dCgpYCBpcyBp
Z25vcmVkIGluIGByZW5lc2FzX2kzY19pMmNfeGZlcnMoKWAsIGxlYWRpbmcgdG8gZmFsc2VseSBy
ZXBvcnRpbmcgc3VjY2VzcyBvbiB0aW1lb3V0cyBhbmQgY29udGludWluZyB0byBpc3N1ZSBzdWJz
ZXF1ZW50IG1lc3NhZ2VzIHRvIGEgaHVuZyBidXMuCi0gW0hpZ2hdIFRoaXMgcHJvYmxlbSB3YXNu
J3QgaW50cm9kdWNlZCBieSB0aGlzIHBhdGNoLCBidXQgdHJhbnNmZXIgY29tcGxldGlvbiBzdGF0
dXMgKGB4ZmVyLT5yZXRgKSBpcyBjb21wbGV0ZWx5IGlnbm9yZWQgaW4gYHJlbmVzYXNfaTNjX2kz
Y194ZmVycygpYCwgY2F1c2luZyBhbGwgSTNDIHByaXZhdGUgdHJhbnNmZXJzIHRvIHVuY29uZGl0
aW9uYWxseSByZXBvcnQgc3VjY2VzcyBldmVuIGlmIHRoZXkgZmFpbCBvciB0aW1lIG91dC4KLS0K
CmNvbW1pdCBjOWE1MDU5ZDk3MDUyZTM5YmNiYTk0ZmRiODJkNDYyYTMwOWE5OGQyCkF1dGhvcjog
Q2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVhLnVqQGJwLnJlbmVzYXMuY29tPgoKICAgIGkz
YzogcmVuZXNhczogUmV0dXJuIGltbWVkaWF0ZWx5IGlmIHRoZXJlIGlzIG5vIHRyYW5zZmVyCiAg
ICAKICAgIFRoZXJlIGlzIG5vIG5lZWQgdG8gYWxsb2NhdGUgYSB0cmFuc2ZlciBzdHJ1Y3R1cmUg
d2hlbiBpMmNfbnhmZXJzIGlzIHplcm8uCiAgICBSZXR1cm4gaW1tZWRpYXRlbHkgaW5zdGVhZCBv
ZiB1bm5lY2Vzc2FyaWx5IGFsbG9jYXRpbmcgbWVtb3J5LgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9pM2MvbWFzdGVyL3JlbmVzYXMtaTNjLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvcmVuZXNhcy1p
M2MuYwo+IGluZGV4IDRhMDU1YzlmNGZmZWEuLjFmZDM5ZGQ1Nzg0NzQgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9pM2MvbWFzdGVyL3JlbmVzYXMtaTNjLmMKPiArKysgYi9kcml2ZXJzL2kzYy9tYXN0
ZXIvcmVuZXNhcy1pM2MuYwo+IEBAIC0xMDY2LDEzICsxMDY2LDEzIEBAIHN0YXRpYyBpbnQgcmVu
ZXNhc19pM2NfaTJjX3hmZXJzKHN0cnVjdCBpMmNfZGV2X2Rlc2MgKmRldiwKPiAgCXU4IHN0YXJ0
X2JpdCA9IENORENUTF9TVENORDsKPiAgCWludCBpOwo+ICAKPiArCWlmICghaTJjX254ZmVycykK
PiArCQlyZXR1cm4gMDsKPiArCgpbU2V2ZXJpdHk6IEhpZ2hdClRoaXMgaXNuJ3QgYSBidWcgaW50
cm9kdWNlZCBieSB0aGlzIHBhdGNoLCBidXQgdGhlIHJldHVybiB2YWx1ZSBvZgp3YWl0X2Zvcl9j
b21wbGV0aW9uX3RpbWVvdXQoKSBpcyBpZ25vcmVkIGxhdGVyIGluIHJlbmVzYXNfaTNjX2kyY194
ZmVycygpOgoKCQl3YWl0X2Zvcl9jb21wbGV0aW9uX3RpbWVvdXQoJnhmZXItPmNvbXAsIG0tPmky
Yy50aW1lb3V0KTsKCgkJaWYgKGNtZC0+ZXJyKQoJCQlicmVhazsKCldoZW4gd2FpdF9mb3JfY29t
cGxldGlvbl90aW1lb3V0KCkgcmV0dXJucyAwIChpbmRpY2F0aW5nIGEgdGltZW91dCksIHRoZXJl
CmlzIG5vIGNoZWNrIHRvIHNldCBjbWQtPmVyci4gU2luY2UgY21kLT5lcnIgcmVtYWlucyAwLCB0
aGUgbG9vcCBpbmNvcnJlY3RseQpjb250aW51ZXMgdG8gaXNzdWUgc3RhcnQgY29uZGl0aW9ucyBm
b3IgcmVtYWluaW5nIG1lc3NhZ2VzIG9uIHRoZSB0aW1lZC1vdXQKYnVzLgoKRmluYWxseSwgdGhl
IGZ1bmN0aW9uIHJldHVybnMgY21kLT5lcnIgKDApLCBmYWxzZWx5IHJlcG9ydGluZyBzdWNjZXNz
IHRvCnRoZSBJMkMgc3Vic3lzdGVtLiBEb2VzIHRoaXMgc2lsZW50bHkgaGlkZSBJMkMgdGltZW91
dHMgZnJvbSBjYWxsZXIgZHJpdmVycz8KCltTZXZlcml0eTogSGlnaF0KVGhpcyBpc24ndCBhIGJ1
ZyBpbnRyb2R1Y2VkIGJ5IHRoaXMgcGF0Y2gsIGJ1dCB0cmFuc2ZlciBjb21wbGV0aW9uIHN0YXR1
cwppcyBjb21wbGV0ZWx5IGlnbm9yZWQgaW4gcmVuZXNhc19pM2NfaTNjX3hmZXJzKCkgaW4gdGhl
IHNhbWUgZmlsZToKCgkJcmVuZXNhc19pM2Nfd2FpdF94ZmVyKGkzYywgeGZlcik7Cgl9CgoJcmV0
dXJuIDA7CgpUaGUgZnVuY3Rpb24gcmVuZXNhc19pM2Nfd2FpdF94ZmVyKCkgcmVjb3JkcyBjb21w
bGV0aW9uIHN0YXR1cyAoZS5nLiwgLUVJTywKLUVOT1NQQywgLUVUSU1FRE9VVCkgaW4geGZlci0+
cmV0LiBIb3dldmVyLCB0aGUgbG9vcCBuZXZlciBpbnNwZWN0cwp4ZmVyLT5yZXQgYW5kIHVuY29u
ZGl0aW9uYWxseSByZXR1cm5zIDAgYXQgdGhlIGVuZC4KCkNvdWxkIHRoaXMgc2lsZW50bHkgaGlk
ZSBOQUNLcywgcGFyaXR5IGVycm9ycywgYW5kIHRpbWVvdXRzIGZyb20gSTNDIHRhcmdldApkcml2
ZXJzLCBicmVha2luZyB0aGUgc3Vic3lzdGVtJ3MgZXJyb3IgaGFuZGxpbmcgYW5kIGxlYWRpbmcg
dG8gZmFsc2UKYXNzdW1wdGlvbnMgYWJvdXQgZGF0YSB2YWxpZGl0eT8KCj4gIAlzdHJ1Y3QgcmVu
ZXNhc19pM2NfeGZlciAqeGZlciBfX2ZyZWUoa2ZyZWUpID0gcmVuZXNhc19pM2NfYWxsb2NfeGZl
cihpM2MsIDEpOwo+ICAJaWYgKCF4ZmVyKQo+ICAJCXJldHVybiAtRU5PTUVNOwo+ICAKPiAtCWlm
ICghaTJjX254ZmVycykKPiAtCQlyZXR1cm4gMDsKPiAtCj4gIAlyZW5lc2FzX2kzY19idXNfZW5h
YmxlKG0sIGZhbHNlKTsKPiAgCj4gIAlpbml0X2NvbXBsZXRpb24oJnhmZXItPmNvbXApOwoKLS0g
ClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2
MDYwODIwMTU0My44MDQ5MDItMS1jbGF1ZGl1LmJlem5lYUBrZXJuZWwub3JnP3BhcnQ9MTAKCi0t
IApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
