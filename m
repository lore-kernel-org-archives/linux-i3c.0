Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD3BC54F4D
	for <linux-i3c@archiver.kernel.org>; Tue, 28 Jul 2026 16:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CPxEOd+YMqYMOrAljKYfX/BpYTKwSjuGY4ElieexIJ8=; b=QNdolkhJxEfQIP
	xLvf1uV3cPSMoi7gK97bqUzvdIrGektlV24SzWcK1je/jMY0qbeSelA73Fa4K3aLaxmK2+MO5jxcE
	3IzxC+NivNU83JsZVzSj+49f5JZwqvCcc48fEjcdJ8IU3GwC8QR7A9nHOtRRXLP7Re61LxKuu8chI
	BBS6qLtuqDF9oyexSoywpf1NUTsYaU+FJE+G7ohx6CM3D+oxUuSjQd8NEP5CRl4IiWOPBDpAXFXXN
	MGYQ09onYtFd7X4WndlPhL700oVHS3mZYBuJXInrUp7A/JV1l136elY4PT3msPd/vvxjJzWC0w5tY
	GFvj4KIi7BCev4sjdDbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokjJ-00000005pYZ-176n;
	Tue, 28 Jul 2026 16:32:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokjI-00000005pYQ-0KQp
	for linux-i3c@lists.infradead.org;
	Tue, 28 Jul 2026 16:32:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1A8A560A5E;
	Tue, 28 Jul 2026 16:32:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 785941F000E9;
	Tue, 28 Jul 2026 16:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785256350;
	bh=hX60/Ysft4fivaYbeANfFbGIjBCQwm1xVAybpIS77Ek=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DyS3MNDvb6ORsCbGVcaDuBWivqpv9S74GeRCD5un0BGrBW8CqZzrqwHmnaGkGeNyX
	 TLKYLok5UCf+TAvV2nQY6mEEI1HYImyVSYhgEo0pYopIAAWnlHSvIpX7SqEOQISjE1
	 6cR1R5Bei7Ok34RIJlT9+9ruKiD7+L5ZDHYp3HIsZCBkjcHHq06OG0JZDZ9KW0ECJ2
	 LEuF+n3Cv/nZEcshrDJVZ75lrkuQO1nfwF6N+1T5WSuWBzJh6k9lLmoaImxNV6cM5K
	 h13P1iWoIHAkel/n3rebffWy5w63md74lVtYsC/6zRLh9pFJ3yuVQG7UpK+0JYUK8R
	 9GEMIQKZ1lbaQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V2 2/8] i3c: master: Support IBI-based wakeup capability
To: "Adrian Hunter" <adrian.hunter@intel.com>
Cc: linux-i3c@lists.infradead.org, Frank.Li@kernel.org, linux-pci@vger.kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260728155308.142713-3-adrian.hunter@intel.com>
References: <20260728155308.142713-1-adrian.hunter@intel.com>
 <20260728155308.142713-3-adrian.hunter@intel.com>
Date: Tue, 28 Jul 2026 16:32:30 +0000
Message-Id: <20260728163230.785941F000E9@smtp.kernel.org>
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
IFtIaWdoXSBNaXNzaW5nIGBvZl9ub2RlX2dldCgpYCB3aGVuIGFzc2lnbmluZyBgYm9hcmRpbmZv
LT5vZl9ub2RlYCB0byB0aGUgZGV2aWNlLCBjYXVzaW5nIHJlZmVyZW5jZSBjb3VudCBjb3JydXB0
aW9uIHdoZW4gdGhlIGRldmljZSBpcyByZWxlYXNlZC4KLS0KCi0tLSBQYXRjaCBbMl06IFtQQVRD
SCBWMiAyLzhdIGkzYzogbWFzdGVyOiBTdXBwb3J0IElCSS1iYXNlZCB3YWtldXAgY2FwYWJpbGl0
eSAtLS0KY29tbWl0IGE0YTk3NGRjYWRiYjcwYWZjNTc4MzZhMzYxNjM1ZGI2MGI2NWViZGUKQXV0
aG9yOiBBZHJpYW4gSHVudGVyIDxhZHJpYW4uaHVudGVyQGludGVsLmNvbT4KCmkzYzogbWFzdGVy
OiBTdXBwb3J0IElCSS1iYXNlZCB3YWtldXAgY2FwYWJpbGl0eQoKVGhpcyBjb21taXQgYWRkcyBh
biBpYmlfd2FrZXVwIGZsYWcgdG8gc3RydWN0IGkzY19tYXN0ZXJfY29udHJvbGxlciB0bwphbGxv
dyBjb250cm9sbGVyIGRyaXZlcnMgdG8gYWR2ZXJ0aXNlIHN1cHBvcnQgZm9yIElCSS1iYXNlZCB3
YWtldXAuIEl0IGFsc28KbWFya3MgSUJJLWNhcGFibGUgSTNDIGRldmljZXMgYXMgd2FrZXVwIGNh
cGFibGUgZHVyaW5nIHJlZ2lzdHJhdGlvbi4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21h
c3Rlci5jIGIvZHJpdmVycy9pM2MvbWFzdGVyLmMKPiBpbmRleCA4NzRmNmUxMWIyOTZkLi5jZjMz
NDUyNjVhYzBiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci5jCj4gKysrIGIvZHJp
dmVycy9pM2MvbWFzdGVyLmMKPiBAQCAtMjAwOCw2ICsyMDA4LDEzIEBAIGkzY19tYXN0ZXJfcmVn
aXN0ZXJfbmV3X2kzY19kZXZzKHN0cnVjdCBpM2NfbWFzdGVyX2NvbnRyb2xsZXIgKm1hc3RlcikK
PiAgCQlpZiAoZGVzYy0+Ym9hcmRpbmZvKQo+ICAJCQlkZXNjLT5kZXYtPmRldi5vZl9ub2RlID0g
ZGVzYy0+Ym9hcmRpbmZvLT5vZl9ub2RlOwoKW1NldmVyaXR5OiBIaWdoXQpUaGlzIGlzIGEgcHJl
LWV4aXN0aW5nIGlzc3VlLCBidXQgZG9lcyB0aGlzIGFzc2lnbm1lbnQgbWlzcyBhbgpvZl9ub2Rl
X2dldCgpPwoKSXQgbG9va3MgbGlrZSBib2FyZGluZm8tPm9mX25vZGUgaG9sZHMgYSByZWZlcmVu
Y2UgY291bnQgYWNxdWlyZWQgaW4Kb2ZfaTNjX21hc3Rlcl9hZGRfaTNjX2JvYXJkaW5mbygpOgoK
ICAgIGJvYXJkaW5mby0+b2Zfbm9kZSA9IG9mX25vZGVfZ2V0KG5vZGUpOwoKSG93ZXZlciwgd2hl
biB0aGlzIHBvaW50ZXIgaXMgY29waWVkIHRvIGRlc2MtPmRldi0+ZGV2Lm9mX25vZGUgaGVyZSwg
dGhlCnJlZmVyZW5jZSBjb3VudCBpcyBub3QgaW5jcmVtZW50ZWQuIExhdGVyLCB3aGVuIHRoZSBk
ZXZpY2UgaXMgcmVsZWFzZWQsCmkzY19kZXZpY2VfcmVsZWFzZSgpIHVuY29uZGl0aW9uYWxseSBk
cm9wcyBhIHJlZmVyZW5jZToKCiAgICBvZl9ub2RlX3B1dChpM2NkZXYtPmRldi5vZl9ub2RlKTsK
CklmIHRoZSBkZXZpY2UgcmVnaXN0cmF0aW9uIGZhaWxzIG9yIGlmIGl0IGlzIGxhdGVyIHVucmVn
aXN0ZXJlZCAoZS5nLiwgZHVlCnRvIGEgaG90LXJlbW92ZSBldmVudCksIHRoaXMgd291bGQgZHJh
aW4gdGhlIHJlZmVyZW5jZSBjb25jZXB0dWFsbHkgb3duZWQKYnkgYm9hcmRpbmZvLiAKCklmIHRo
ZSBkZXZpY2UgaXMgdGhlbiByZWNyZWF0ZWQgZHVyaW5nIGEgc3Vic2VxdWVudCBob3Qtam9pbiwg
Y291bGQKYm9hcmRpbmZvIHJlYXNzaWduIHRoZSBub3ctZnJlZWQgb2Zfbm9kZSBwb2ludGVyIGFu
ZCBjYXVzZSBhIHVzZS1hZnRlci1mcmVlCmFuZCBkb3VibGUtZnJlZSBvbiB0aGUgbmV4dCByZWxl
YXNlPwoKPiAgCj4gKwkJLyoKPiArCQkgKiBJbiB0aGUgY2FzZSBvZiBJQkkgd2FrZXVwLCBhbnkg
SUJJLWNhcGFibGUgZGV2aWNlIGNhbgo+ICsJCSAqIHdha2V1cC4KPiArCQkgKi8KPiArCQlpZiAo
bWFzdGVyLT5pYmlfd2FrZXVwICYmIChkZXNjLT5pbmZvLmJjciAmIEkzQ19CQ1JfSUJJX1JFUV9D
QVApKQo+ICsJCQlkZXZpY2Vfc2V0X3dha2V1cF9jYXBhYmxlKCZkZXNjLT5kZXYtPmRldiwgdHJ1
ZSk7Cj4gKwo+ICAJCWxpc3RfYWRkX3RhaWwoJmRlc2MtPmRldi0+bm9kZSwgJmkzY191bnJlZ19k
ZXZzKTsKPiAgCX0KPgoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5k
ZXYvIy9wYXRjaHNldC8yMDI2MDcyODE1NTMwOC4xNDI3MTMtMS1hZHJpYW4uaHVudGVyQGludGVs
LmNvbT9wYXJ0PTIKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtaTNjCg==
