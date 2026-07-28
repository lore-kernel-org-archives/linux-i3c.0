Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F11FC53219
	for <linux-i3c@archiver.kernel.org>; Tue, 28 Jul 2026 07:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=20bPPAYmiSYMO/pFVLHNOCagdWOlCNTzIBRp/wr1oGI=; b=Rbl4rCHfYuG80x
	RNT0p4GyelXuEVxSNptWy7JnafPT3ozcZdeFzE4X8uBvkWLqyI+J2zfZK/RgPFT9KlE/krtaKfXvH
	/yRyIl0IKVrqDOJA9P1aVCdltt0LBlgWJCu5DgOX47zY/xbv7+xSA6oJXSBfewD7bcthWBiRNr8xj
	+rQFWOxy0JoJPz+K1SlrUqy+oPQRKer9TajO1dLiN7qb6gPfiZQWIUu28NaumF92/hUiEbzm0WRSK
	5MfOhPwj9QXHPZj3GWWsf/DqwjQlwshvHGoZC43ph9IdyiJUcZMCGhmrXQSjS9X9zabkNwvzPc+yL
	Hh20DWG6NxAdV5pJ126w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woc7o-00000004dBJ-052A;
	Tue, 28 Jul 2026 07:21:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woc7n-00000004dB6-0uwi
	for linux-i3c@lists.infradead.org;
	Tue, 28 Jul 2026 07:21:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F2BFD43A33;
	Tue, 28 Jul 2026 07:21:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 681291F00A3E;
	Tue, 28 Jul 2026 07:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785223274;
	bh=UD5FqAxnnxRG4tcCSNqXjm9MFcKqT5tXqiu7CaHZXKc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HJoFPbXVQx3rFb0DJ0kYgdtQ6k1Nw3od+8t802qXwqBmn37nGEn/usUuoJKVgnmRc
	 KJshjPwSSINMBuHxOp5sVCTpdbZGSuqHefsXSp/3o8tvOKBY8aRE6Qn7n/OtuZ5OoE
	 J+Yh4DQfAR5+4xudyX/oobpBGxEYBquoyRh/daKx0sdmLj6GG3Nkgj382bFtN4NufL
	 Sk4KyFSxNgI9khZC1stz0NuNogxleADXhY09/SBt0r77MddD8Cc+eadDbhEP5rS1To
	 dVuY9+v4oNehTMY5hsq33XRvCmW6Fpt10FugCmwXseiy3/33QU4C8FGzFLGetNP30O
	 Vxj7DjgmpZr2w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 02/12] i3c: master: Use unified device property
 interface
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: Frank.Li@kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, conor+dt@kernel.org, linux-i3c@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20260728065955.809445-3-akhilrajeev@nvidia.com>
References: <20260728065955.809445-1-akhilrajeev@nvidia.com>
 <20260728065955.809445-3-akhilrajeev@nvidia.com>
Date: Tue, 28 Jul 2026 07:21:14 +0000
Message-Id: <20260728072114.681291F00A3E@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpOZXcgaXNzdWVzOgotIFtIaWdoXSBQ
cm9iaW5nIG9mIEkzQyBtYXN0ZXIgY29udHJvbGxlcnMgZmFpbHMgb24gQUNQSSBwbGF0Zm9ybXMg
aWYgdGhleSBoYXZlIGNoaWxkIG5vZGVzLgoKUHJlLWV4aXN0aW5nIGlzc3VlczoKLSBbSGlnaF0g
RGFuZ2xpbmcgcG9pbnRlciBsZWZ0IGluIGRlc2MtPmRldiB1cG9uIGRldmljZV9yZWdpc3Rlcigp
IGZhaWx1cmUgbGVhZHMgdG8gVXNlLUFmdGVyLUZyZWUgYW5kIERvdWJsZSBGcmVlIG9uIHRlYXJk
b3duLgotLQoKLS0tIFBhdGNoIFsyXTogW1BBVENIIHY3IDAyLzEyXSBpM2M6IG1hc3RlcjogVXNl
IHVuaWZpZWQgZGV2aWNlIHByb3BlcnR5IGludGVyZmFjZSAtLS0KY29tbWl0IDY3YTNiMzBkZGQ0
MGNhODkxMGIyOGFjNWNkODNhYWQ1NzE3NGY3ZTgKQXV0aG9yOiBBa2hpbCBSIDxha2hpbHJhamVl
dkBudmlkaWEuY29tPgoKaTNjOiBtYXN0ZXI6IFVzZSB1bmlmaWVkIGRldmljZSBwcm9wZXJ0eSBp
bnRlcmZhY2UKClJlcGxhY2UgYWxsIE9GLXNwZWNpZmljIGZ1bmN0aW9ucyB3aXRoIHVuaWZpZWQg
ZGV2aWNlIHByb3BlcnR5IGZ1bmN0aW9ucwphcyBhIHByZXJlcXVpc2l0ZSB0byBzdXBwb3J0IGJv
dGggQUNQSSBhbmQgZGV2aWNlIHRyZWUuCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0
ZXIuYyBiL2RyaXZlcnMvaTNjL21hc3Rlci5jCj4gaW5kZXggZjFiZTM4YTY0MGNhMS4uNGIzZDk2
MjhiYzM5YiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIuYwo+ICsrKyBiL2RyaXZl
cnMvaTNjL21hc3Rlci5jCgpbIC4uLiBdCgo+IEBAIC0xOTI4LDcgKzE5MzAsNyBAQCBpM2NfbWFz
dGVyX3JlZ2lzdGVyX25ld19pM2NfZGV2cyhzdHJ1Y3QgaTNjX21hc3Rlcl9jb250cm9sbGVyICpt
YXN0ZXIpCj4gIAkJCSAgICAgZGVzYy0+aW5mby5waWQpOwo+ICAKPiAgCQlpZiAoZGVzYy0+Ym9h
cmRpbmZvKQo+IC0JCQlkZXNjLT5kZXYtPmRldi5vZl9ub2RlID0gZGVzYy0+Ym9hcmRpbmZvLT5v
Zl9ub2RlOwo+ICsJCQlkZXZpY2Vfc2V0X25vZGUoJmRlc2MtPmRldi0+ZGV2LCBkZXNjLT5ib2Fy
ZGluZm8tPmZ3bm9kZSk7Cj4gIAo+ICAJCXJldCA9IGRldmljZV9yZWdpc3RlcigmZGVzYy0+ZGV2
LT5kZXYpOwo+ICAJCWlmIChyZXQpIHsKCltTZXZlcml0eTogSGlnaF0KVGhpcyBpcyBhIHByZS1l
eGlzdGluZyBpc3N1ZSwgYnV0IGl0IGFwcGVhcnMgZGVzYy0+ZGV2IGlzIGxlZnQgcG9pbnRpbmcg
dG8KYSBmcmVlZCBkZXZpY2UgaWYgZGV2aWNlX3JlZ2lzdGVyKCkgZmFpbHMuIFdoZW4gcHV0X2Rl
dmljZSgpIGZyZWVzIHRoZQp1bmRlcmx5aW5nIHN0cnVjdCBpM2NfZGV2aWNlICh2aWEgaTNjX2Rl
dmljZV9yZWxlYXNlKCkpLCBkZXNjLT5kZXYgaXNuJ3QKc2V0IHRvIE5VTEwuCgpMYXRlciwgaWYg
aTNjX21hc3Rlcl91bnJlZ2lzdGVyX2kzY19kZXZzKCkgcnVucyBkdXJpbmcgdGVhcmRvd24sIGNv
dWxkIHRoaXMKbGVhZCB0byBhIHVzZS1hZnRlci1mcmVlIGFuZCBkb3VibGUtZnJlZT8KCmkzY19t
YXN0ZXJfdW5yZWdpc3Rlcl9pM2NfZGV2cygpIHsKICAgIC4uLgogICAgaTNjX2J1c19mb3JfZWFj
aF9pM2NkZXYoJm1hc3Rlci0+YnVzLCBpM2NkZXYpIHsKICAgICAgICBpZiAoIWkzY2Rldi0+ZGV2
KQogICAgICAgICAgICBjb250aW51ZTsKCiAgICAgICAgaTNjZGV2LT5kZXYtPmRlc2MgPSBOVUxM
OwogICAgICAgIGlmIChkZXZpY2VfaXNfcmVnaXN0ZXJlZCgmaTNjZGV2LT5kZXYtPmRldikpCiAg
ICAgICAgICAgIC4uLgogICAgICAgIGVsc2UKICAgICAgICAgICAgcHV0X2RldmljZSgmaTNjZGV2
LT5kZXYtPmRldik7CiAgICB9Cn0KClsgLi4uIF0KCj4gLXN0YXRpYyBpbnQgb2ZfaTNjX21hc3Rl
cl9hZGRfZGV2KHN0cnVjdCBpM2NfbWFzdGVyX2NvbnRyb2xsZXIgKm1hc3RlciwKPiAtCQkJCSBz
dHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUpCj4gK3N0YXRpYyBpbnQgaTNjX21hc3Rlcl9hZGRfZGV2
KHN0cnVjdCBpM2NfbWFzdGVyX2NvbnRyb2xsZXIgKm1hc3RlciwKPiArCQkJICAgICAgc3RydWN0
IGZ3bm9kZV9oYW5kbGUgKmZ3bm9kZSkKPiAgewo+ICAJdTMyIHJlZ1szXTsKPiAgCWludCByZXQ7
Cj4gIAo+ICAJaWYgKCFtYXN0ZXIpCj4gIAkJcmV0dXJuIC1FSU5WQUw7Cj4gIAo+IC0JcmV0ID0g
b2ZfcHJvcGVydHlfcmVhZF91MzJfYXJyYXkobm9kZSwgInJlZyIsIHJlZywgQVJSQVlfU0laRShy
ZWcpKTsKPiArCXJldCA9IGZ3bm9kZV9wcm9wZXJ0eV9yZWFkX3UzMl9hcnJheShmd25vZGUsICJy
ZWciLCByZWcsIEFSUkFZX1NJWkUocmVnKSk7Cj4gIAlpZiAocmV0KQo+ICAJCXJldHVybiByZXQ7
CgpbU2V2ZXJpdHk6IEhpZ2hdClNpbmNlIHRoaXMgZnVuY3Rpb24gaXMgbm93IGNhbGxlZCBmb3Ig
QUNQSSBjaGlsZCBub2RlcyB2aWEKZndub2RlX3BvcHVsYXRlX2kzY19idXMoKSwgd2lsbCB0aGlz
IGNhdXNlIEkzQyBtYXN0ZXIgcHJvYmUgdG8gZmFpbCBvbiBBQ1BJCnN5c3RlbXM/CgpBQ1BJIG5v
ZGVzIHR5cGljYWxseSB1c2UgX0FEUiBvciBfQ1JTIGluc3RlYWQgb2YgYSAicmVnIiBwcm9wZXJ0
eS4gSWYgInJlZyIKaXMgbWlzc2luZywgZndub2RlX3Byb3BlcnR5X3JlYWRfdTMyX2FycmF5KCkg
cmV0dXJucyBhbiBlcnJvciwgd2hpY2gKcHJvcGFnYXRlcyB1cCBhbmQgY2F1c2VzIHRoZSBlbnRp
cmUgbWFzdGVyIHJlZ2lzdHJhdGlvbiB0byBhYm9ydC4KCkJlZm9yZSB0aGlzIHBhdGNoLCB0aGUg
bG9vcCBpbiBvZl9wb3B1bGF0ZV9pM2NfYnVzKCkgd2FzIHNraXBwZWQgY29tcGxldGVseQpvbiBB
Q1BJIHN5c3RlbXMgYmVjYXVzZSBkZXYtPm9mX25vZGUgd2FzIE5VTEwuCgo+ICAKPiAgCS8qCj4g
IAkgKiBUaGUgbWFudWZhY3R1cmVyIElEIGNhbid0IGJlIDAuIElmIHRoYXQncyB0aGUgY2FzZSwg
d2UncmUKPiAgCSAqIGRlYWxpbmcgd2l0aCBhbiBJMkMgZGV2aWNlLgo+ICAJICovCj4gIAlpZiAo
IXJlZ1sxXSkKCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMv
cGF0Y2hzZXQvMjAyNjA3MjgwNjU5NTUuODA5NDQ1LTEtYWtoaWxyYWplZXZAbnZpZGlhLmNvbT9w
YXJ0PTIKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
aTNjCg==
