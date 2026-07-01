Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ACEEC43458
	for <linux-i3c@archiver.kernel.org>; Wed,  1 Jul 2026 20:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ylhJnZx4hExKmrX+aTs4KHLI1CDvVc/cEsd8nH9GcUE=; b=oyxqJKWGfR8//O
	AMF8qBelBjKLey9XH6LQ9OM1r1YevwH0tPxsOU0Ppeh/2fKKOhhTYl+SGguOzie9zNaA8ia2m7Zha
	DCPvx/96/FDQ6u+yYYqoOtrG9gvkM8sVZaC5K1uUwze0ZjuvHzJlj+pI5loemgmZiPTp1raRV+PXN
	cRvBJqfEWxUNlW/ZEMFSmXwCG2sjote6/MQzz2knNDaygcu5W6F1Eh00Wch0fTA6SaJ3sFCgOe/8A
	EfnDrg9JQ1fhgxBcD+O1qA5Q1J0pjuV+9pbUi2FAacQFx721hs37wdtl/DIrOaWymb1VOaAtl3tyd
	Pakdf/SK/NOfW5CsrS5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1Sa-00000002xls-3uKN;
	Wed, 01 Jul 2026 20:23:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1Sa-00000002xlm-1Hlt
	for linux-i3c@lists.infradead.org;
	Wed, 01 Jul 2026 20:23:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AE41360138;
	Wed,  1 Jul 2026 20:23:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D1E91F000E9;
	Wed,  1 Jul 2026 20:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782937383;
	bh=85K8tCxW6tQxNrBLtLdfJmv3Ij88rqKKjUy/Y7LO220=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T51Uct3wLGCIGVlVtyeUwu6v+MDnz/PYuTBv6lrmGIWpq4XdL0VRkZs0NnQu0T2Ae
	 Khp1VdH3YvYKBrBioYf44K4BgDzsVyFPsV4ab1VZDkf5RW61huz7SEy+bB38C11voj
	 x0IVv6YBGuKB5Xg+hrgapZwBB48/dkTXQ0JwMehXtgPXO8QO8vpZAD42p8r/pURghl
	 vZn1zPe7lGJR2d9eaKt5oKIwXlSbVi9m5HUJF45Gw3pS6JgibRh9fGdJ1MQ2VjS1e8
	 2rH8v74uTWhp9fIX2hQy8Ab1Fm5oLvwVBN+8TM58j3SQii7Zx+ItwBdGttnhkHbWRJ
	 ZFJFJ8VU7jIzg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 3/7] i3c: master: Add helper to query bus wakeup
 requirements
To: "Adrian Hunter" <adrian.hunter@intel.com>
Cc: Frank.Li@kernel.org, linux-i3c@lists.infradead.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260701200552.220042-4-adrian.hunter@intel.com>
References: <20260701200552.220042-1-adrian.hunter@intel.com>
 <20260701200552.220042-4-adrian.hunter@intel.com>
Date: Wed, 01 Jul 2026 20:23:01 +0000
Message-Id: <20260701202302.2D1E91F000E9@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIGBpM2NfbWFzdGVyX2Fu
eV93YWtldXBfZW5hYmxlZCgpYCBkZXJlZmVyZW5jZXMgYSBkYW5nbGluZyBgZGVzYy0+ZGV2YCBw
b2ludGVyIGlmIGEgZGV2aWNlIHByZXZpb3VzbHkgZmFpbGVkIHRvIHJlZ2lzdGVyLgotIFtIaWdo
XSBDb25jdXJyZW50IGV4ZWN1dGlvbiBvZiBgaTNjX21hc3Rlcl9hbnlfd2FrZXVwX2VuYWJsZWRg
IGFuZCBgaTNjX21hc3Rlcl9yZWdfd29ya19mbmAgY3JlYXRlcyBhIGRhdGEgcmFjZSBvbiBgZGVz
Yy0+ZGV2YCBkdWUgdG8gYSBzaGFyZWQgcmVhZCBsb2NrLgotLQoKY29tbWl0IGVkNTQwNWI1NmQ4
OTU3MmE0NjEzNmU3YzkzYjUzZjYwNThmYTQzMzUKQXV0aG9yOiBBZHJpYW4gSHVudGVyIDxhZHJp
YW4uaHVudGVyQGludGVsLmNvbT4KCmkzYzogbWFzdGVyOiBBZGQgaGVscGVyIHRvIHF1ZXJ5IGJ1
cyB3YWtldXAgcmVxdWlyZW1lbnRzCgpBZGQgaTNjX21hc3Rlcl9hbnlfd2FrZXVwX2VuYWJsZWQo
KSwgd2hpY2ggaXRlcmF0ZXMgb3ZlciB0aGUgZGV2aWNlcyBvbgphbiBJM0MgYnVzIGFuZCByZXBv
cnRzIHdoZXRoZXIgYW55IG9mIHRoZW0gYXJlIGVuYWJsZWQgZm9yIHN5c3RlbSB3YWtldXAuCkNv
bnRyb2xsZXIgZHJpdmVycyBjYW4gdXNlIHRoaXMgaGVscGVyIHRvIGRldGVybWluZSB3aGV0aGVy
IHdha2V1cCBzdXBwb3J0Cm11c3QgcmVtYWluIGF2YWlsYWJsZSB3aGlsZSB0aGUgc3lzdGVtIGlz
IHN1c3BlbmRlZC4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci5jIGIvZHJpdmVy
cy9pM2MvbWFzdGVyLmMKPiBpbmRleCBhMzZmOWI2MTdjYmY3Li45Nzk0NTdlNjM1YmQ5IDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci5jCj4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVy
LmMKPiBAQCAtMTk1Nyw2ICsxOTU3LDMzIEBAIHN0YXRpYyB2b2lkIGkzY19tYXN0ZXJfcmVnX3dv
cmtfZm4oc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQpbIC4uLiBdCj4gK2Jvb2wgaTNjX21hc3Rl
cl9hbnlfd2FrZXVwX2VuYWJsZWQoc3RydWN0IGkzY19tYXN0ZXJfY29udHJvbGxlciAqbWFzdGVy
KQo+ICt7Cj4gKwlzdHJ1Y3QgaTNjX2Rldl9kZXNjICpkZXNjOwo+ICsJYm9vbCB3YWtldXAgPSBm
YWxzZTsKPiArCj4gKwlpM2NfYnVzX25vcm1hbHVzZV9sb2NrKCZtYXN0ZXItPmJ1cyk7CgpbU2V2
ZXJpdHk6IEhpZ2hdCkNhbiB0aGlzIHJhY2Ugd2l0aCBpM2NfbWFzdGVyX3JlZ193b3JrX2ZuKCkg
YW5kIGFjY2VzcyB1bmluaXRpYWxpemVkIG1lbW9yeSBvcgphIGZyZWVkIHBvaW50ZXI/CgppM2Nf
bWFzdGVyX3JlZ193b3JrX2ZuKCkgZXhlY3V0ZXMgaW4gYSB3b3JrcXVldWUgYW5kIGNhbGxzCmkz
Y19tYXN0ZXJfcmVnaXN0ZXJfbmV3X2kzY19kZXZzKCkgd2hpbGUgaG9sZGluZyBpM2NfYnVzX25v
cm1hbHVzZV9sb2NrKCksCndoaWNoIG9ubHkgYWNxdWlyZXMgYSByZWFkIGxvY2sgKGRvd25fcmVh
ZCgmYnVzLT5sb2NrKSkuCgpJbnNpZGUgaTNjX21hc3Rlcl9yZWdpc3Rlcl9uZXdfaTNjX2RldnMo
KSwgZGVzYy0+ZGV2IGlzIGFsbG9jYXRlZCBhbmQgbXV0YXRlZC4KClNpbmNlIGkzY19tYXN0ZXJf
YW55X3dha2V1cF9lbmFibGVkKCkgYWxzbyBhY3F1aXJlcyB0aGUgc2FtZSByZWFkIGxvY2ssCmNv
dWxkIGl0IHJ1biBjb25jdXJyZW50bHkgKGUuZy4gZHVyaW5nIHJ1bnRpbWUgUE0gc3VzcGVuZCkg
YW5kIHJlYWQgZGVzYy0+ZGV2CndoaWxlIGl0IGlzIGJlaW5nIGFsbG9jYXRlZCBvciBmcmVlZCBv
biB0aGUgZmFpbHVyZSBwYXRoPwoKPiArCWkzY19idXNfZm9yX2VhY2hfaTNjZGV2KCZtYXN0ZXIt
PmJ1cywgZGVzYykgewo+ICsJCWlmIChkZXNjLT5kZXYgJiYgZGV2aWNlX21heV93YWtldXAoJmRl
c2MtPmRldi0+ZGV2KSkgewoKW1NldmVyaXR5OiBIaWdoXQpEb2VzIHRoaXMgY29kZSByaXNrIGEg
dXNlLWFmdGVyLWZyZWUgaWYgYSBkZXZpY2UgZmFpbGVkIHRvIHJlZ2lzdGVyPwoKTG9va2luZyBh
dCBpM2NfbWFzdGVyX3JlZ2lzdGVyX25ld19pM2NfZGV2cygpLCBpZiBkZXZpY2VfcmVnaXN0ZXIo
KSBmYWlscywKdGhlIGVycm9yIHBhdGggY2FsbHMgcHV0X2RldmljZSgmZGVzYy0+ZGV2LT5kZXYp
IHdoaWNoIGZyZWVzIHRoZSBkZXZpY2UKc3RydWN0dXJlLCBidXQgaXQgbGVhdmVzIGRlc2MtPmRl
diBhcyBhIGRhbmdsaW5nIHBvaW50ZXIuCgpJZiBpM2NfbWFzdGVyX2FueV93YWtldXBfZW5hYmxl
ZCgpIGlzIGNhbGxlZCBsYXRlciwgY291bGQgZGVzYy0+ZGV2IGV2YWx1YXRlCnRvIHRydWUgYW5k
IGNhdXNlIGRldmljZV9tYXlfd2FrZXVwKCkgdG8gZGVyZWZlcmVuY2UgdGhlIGZyZWVkIG1lbW9y
eT8KCj4gKwkJCXdha2V1cCA9IHRydWU7Cj4gKwkJCWJyZWFrOwo+ICsJCX0KPiArCX0KPiArCWkz
Y19idXNfbm9ybWFsdXNlX3VubG9jaygmbWFzdGVyLT5idXMpOwo+ICsKPiArCXJldHVybiB3YWtl
dXA7Cj4gK30KPiArRVhQT1JUX1NZTUJPTF9HUEwoaTNjX21hc3Rlcl9hbnlfd2FrZXVwX2VuYWJs
ZWQpOwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRj
aHNldC8yMDI2MDcwMTIwMDU1Mi4yMjAwNDItMS1hZHJpYW4uaHVudGVyQGludGVsLmNvbT9wYXJ0
PTMKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNj
Cg==
