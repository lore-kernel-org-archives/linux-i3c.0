Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF76FC5AC7A
	for <linux-i3c@archiver.kernel.org>; Fri,  7 Aug 2026 15:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dk61Zb0hpOIPdG19+lvy7zuslTWpr6EQzd4Lha8+SWU=; b=Nc4XslKLQTcMD3
	T2wrxgcTskQzBvAU77dgI1+/v370HKss6qeVExPU/jnHFcFaLFMyM2TyCqGL3RhEUKfI5q3azNKW5
	1cwdpADagmNLpKE3p5AXDFsC+LFhNCx2YWOAwJ259mXDUNAIslK14NJvln+O4AaNsVuHwC3MEJdsU
	vJ6JWlMmJsfy6/wdlr+UcfhHXrJc6HiNmpqZuMW6oETRVdwnlrtN1Paf0GqrUryh+boyJmeqZTdle
	0KgblAxD8lcJkGuTncsos/T7fP5NnaVKVJv1wNNUkcj4G3AHHbOumFrOh/EIx17rnJ4JJsTG0++N5
	pQ8yHZNDdDLA9JncGYww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMhF-00000008Mhu-2MIi;
	Fri, 07 Aug 2026 15:41:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMhE-00000008Mhj-2pgX
	for linux-i3c@lists.infradead.org;
	Fri, 07 Aug 2026 15:41:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6109C43C32;
	Fri,  7 Aug 2026 15:41:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC0251F00A3A;
	Fri,  7 Aug 2026 15:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786117280;
	bh=PE4PrpyaYrRz84BjM/E6+zc5CFMMSSZKMYgKV/KiIp0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N4p0P6VNpoL1O6186NyNIGacDfl5JCABW4KgVWn40IjIPUBAHkOUnR/P7bNXB4fFw
	 1YKaUgdeAkr1/TVV0ublns6UChaGubL+YWw5U7igsPUbx9vNSI3Vwv3r94ooAUDPzH
	 BrustQ8qwvbc63YvSeVwNVCHpwmhgNr2pP71/WyEMCwfWtAe3QQFsLag30Um+znbxV
	 r4fVBd3YhCoBHaKa8U26qZGPa7Goc2HyyWOyH4IJLUc+P3xnzGzza/qfvhNhl5g919
	 ++rs4lIKl7NtlpJqzDkESMZJznkah98gJ8UfwEMnjRBYahqiHasemWdapiZXLUFh1j
	 FRfeXzEpIh8fA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V5 09/14] i3c: master: Report wakeup events for IBIs
To: "Adrian Hunter" <adrian.hunter@intel.com>
Cc: linux-pci@vger.kernel.org, linux-i3c@lists.infradead.org, Frank.Li@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260807145638.168865-10-adrian.hunter@intel.com>
References: <20260807145638.168865-1-adrian.hunter@intel.com>
 <20260807145638.168865-10-adrian.hunter@intel.com>
Date: Fri, 07 Aug 2026 15:41:19 +0000
Message-Id: <20260807154119.EC0251F00A3A@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpOZXcgaXNzdWVzOgotIFtIaWdoXSBV
bnByb3RlY3RlZCBhY2Nlc3MgdG8gYGRldi0+ZGV2YCBpbiBgaTNjX21hc3Rlcl9xdWV1ZV9pYmko
KWAgaW50cm9kdWNlcyBhIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSBvciBVc2UtQWZ0ZXItRnJl
ZSBkdXJpbmcgY29uY3VycmVudCBkZXZpY2UgdGVhcmRvd24uCgpQcmUtZXhpc3RpbmcgaXNzdWVz
OgotIFtIaWdoXSBQcmVleGlzdGluZyBsb2NrbGVzcyBhY2Nlc3MgdG8gYGRldi0+aWJpYCBpbiBg
aTNjX21hc3Rlcl9xdWV1ZV9pYmkoKWAgbGVhZHMgdG8gYSBVc2UtQWZ0ZXItRnJlZSAoVUFGKSBp
ZiBhbiBJQkkgaXMgaGFuZGxlZCBjb25jdXJyZW50bHkgd2l0aCBJQkkgZnJlZWluZy4KLS0KCi0t
LSBQYXRjaCBbOV06IFtQQVRDSCBWNSAwOS8xNF0gaTNjOiBtYXN0ZXI6IFJlcG9ydCB3YWtldXAg
ZXZlbnRzIGZvciBJQklzIC0tLQpjb21taXQgYjBjMDc0MTcxMzRlYjBjODIwOTQ2MGE5YzI1MmZh
Zjc0NWQzZmVlZQpBdXRob3I6IEFkcmlhbiBIdW50ZXIgPGFkcmlhbi5odW50ZXJAaW50ZWwuY29t
PgpTdWJqZWN0OiBpM2M6IG1hc3RlcjogUmVwb3J0IHdha2V1cCBldmVudHMgZm9yIElCSXMKClRo
aXMgY29tbWl0IG1vZGlmaWVzIHRoZSBJM0MgbWFzdGVyIHN1YnN5c3RlbSB0byByZXBvcnQgd2Fr
ZXVwIGV2ZW50cyBmb3IKZGV2aWNlcyBjb25maWd1cmVkIGFzIHdha2V1cCBzb3VyY2VzLiBJdCBx
dWV1ZXMgYSB3YWtldXAgZXZlbnQgd2hlbiBhbgpJbi1CYW5kIEludGVycnVwdCAoSUJJKSBpcyBw
cm9jZXNzZWQgYnkgaTNjX21hc3Rlcl9xdWV1ZV9pYmkoKS4KCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvaTNjL21hc3Rlci5jIGIvZHJpdmVycy9pM2MvbWFzdGVyLmMKPiBpbmRleCAyNjE2MzU0ZGJl
NTQ1Li42YzUzNDE0OTE5NDQ1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci5jCj4g
KysrIGIvZHJpdmVycy9pM2MvbWFzdGVyLmMKWyAuLi4gXQo+IEBAIC0zMzk3LDYgKzM0MDAsOSBA
QCB2b2lkIGkzY19tYXN0ZXJfcXVldWVfaWJpKHN0cnVjdCBpM2NfZGV2X2Rlc2MgKmRldiwgc3Ry
dWN0IGkzY19pYmlfc2xvdCAqc2xvdCkKPiAgCWlmICghZGV2LT5pYmkgfHwgIXNsb3QpCj4gIAkJ
cmV0dXJuOwo+ICAKPiArCWlmIChkZXZpY2VfbWF5X3dha2V1cCgmZGV2LT5kZXYtPmRldikpCj4g
KwkJcG1fd2FrZXVwX2V2ZW50KCZkZXYtPmRldi0+ZGV2LCBJM0NfV0FLRVVQX1BST0NFU1NJTkdf
VElNRV9NUyk7Cj4gKwpbU2V2ZXJpdHk6IEhpZ2hdCkRvZXMgdGhpcyBjb2RlIGludHJvZHVjZSBh
IHBvdGVudGlhbCBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2Ugb3IKdXNlLWFmdGVyLWZyZWUgaWYg
YSBjb25jdXJyZW50IHRlYXJkb3duIHVucmVnaXN0ZXJzIHRoZSBkZXZpY2U/CgpTaW5jZSBpM2Nf
bWFzdGVyX3F1ZXVlX2liaSgpIHJ1bnMgbG9ja2xlc3NseSBmcm9tIHRoZSBtYXN0ZXIncyBJUlEg
aGFuZGxlciwKY291bGQgYSBjb25jdXJyZW50IHRlYXJkb3duIHRocmVhZCByZWFjaCBpM2NfbWFz
dGVyX3VucmVnaXN0ZXJfaTNjX2RldnMoKToKCglwdXRfZGV2aWNlKCZpM2NkZXYtPmRldi0+ZGV2
KTsKCWkzY2Rldi0+ZGV2ID0gTlVMTDsKCndoaWxlIHRoZSBJUlEgaGFuZGxlciBpcyBiZXR3ZWVu
IHRoZSAhZGV2LT5pYmkgY2hlY2sgYW5kIHRoaXMgbmV3IHdha2V1cApjaGVjaz8KCklmIHRoZSBj
b250cm9sbGVyJ3MgZGlzYWJsZV9pYmkgY2FsbGJhY2sgZG9lcyBub3Qgc3luY2hyb25pemUgd2l0
aCB0aGUgSVJRCmhhbmRsZXIgdXNpbmcgc3luY2hyb25pemVfaXJxKCksIHRoZSB0ZWFyZG93biB0
aHJlYWQgY291bGQgc2VlCnBlbmRpbmdfaWJpcyA9PSAwIGFuZCBwcm9jZWVkIHRvIHVuYmluZCB0
aGUgZGV2aWNlLCB3aGljaCB3b3VsZCBjYXVzZQpkZXJlZmVyZW5jaW5nIGRldi0+ZGV2LT5kZXYg
aGVyZSB0byBwYW5pYy4KCj4gIAlhdG9taWNfaW5jKCZkZXYtPmliaS0+cGVuZGluZ19pYmlzKTsK
PiAgCXF1ZXVlX3dvcmsoZGV2LT5pYmktPndxLCAmc2xvdC0+d29yayk7CltTZXZlcml0eTogSGln
aF0KVGhpcyBpcyBhIHByZS1leGlzdGluZyBpc3N1ZSwgYnV0IGNhbiB0aGlzIGxvY2tsZXNzIGFj
Y2VzcyB0byBkZXYtPmliaSBjYXVzZQphIHVzZS1hZnRlci1mcmVlIGR1cmluZyBjb25jdXJyZW50
IGRldmljZSB1bmJpbmRpbmc/CgpJZiB0aGUgSVJRIGhhbmRsZXIgaGFzIHBhc3NlZCB0aGUgIWRl
di0+aWJpIGNoZWNrIGJ1dCBoYXNuJ3QgeWV0IHJlYWNoZWQKdGhpcyBhdG9taWNfaW5jKCksIGEg
Y29uY3VycmVudCB0aHJlYWQgZXhlY3V0aW5nIGkzY19kZXZfZnJlZV9pYmlfbG9ja2VkKCkKY291
bGQgZGlzYWJsZSBJQklzLgoKQmVjYXVzZSBwZW5kaW5nX2liaXMgaGFzIG5vdCBiZWVuIGluY3Jl
bWVudGVkIHlldCwgaXQgd291bGQgc2VlCnBlbmRpbmdfaWJpcyA9PSAwIGFuZCBwcm9jZWVkIHRv
IGZyZWUgdGhlIElCSSByZXNvdXJjZXMgd2l0aG91dCB3YWl0aW5nOgoKCWtmcmVlKGRldi0+aWJp
KTsKCWRldi0+aWJpID0gTlVMTDsKCldoZW4gdGhlIElSUSBoYW5kbGVyIHJlc3VtZXMsIGl0IHdv
dWxkIGV4ZWN1dGUgYXRvbWljX2luYygpIGFuZCBxdWV1ZV93b3JrKCksCndyaXRpbmcgdG8gdGhl
IGZyZWVkIGRldi0+aWJpIHN0cnVjdHVyZS4KCj4gIH0KCi0tIApTYXNoaWtvIEFJIHJldmlldyDC
tyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA4MDcxNDU2MzguMTY4ODY1LTEt
YWRyaWFuLmh1bnRlckBpbnRlbC5jb20/cGFydD05CgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlz
dApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
