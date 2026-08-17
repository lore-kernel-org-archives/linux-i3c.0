Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97908C5DF66
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Aug 2026 10:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7MjhJMybBO0hG100h8X0/pjwKXN5P0h0Bm24PsyK1po=; b=oZJHHTXoivgnmo
	UC/QZrs1ol4rwCIFZCK3li6tyXBMB0rkykgAaa94m/leb+4u109om7qGJkxhEu9cN5lvuJAGGkzU6
	e+UAGNwPTEpmkDNee+TnhH9JBt1uDfi/omfkpwJqSziBJNQiO5kYcDiF71SKuplZcYtaa3Uh0Opps
	vpzuOqsQqS3+vq9ritkWFRIDPzZFU/lH6Rh63t2sOVZe8/C94iZpPNZAW04Sb+G5nhJFlZzq/sIw4
	zsBoUZAAFu10V49vBfxvNIposgK7VjFfc0Z9gv+0z2K1VP+d4vv2mI5MIzmkAEeMDpjBhLL0TINjM
	T8L9WECa3cZ7qH1R1+7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvuxC-00000005y2C-1JPa;
	Mon, 17 Aug 2026 10:52:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvuxB-00000005y26-0Ekt
	for linux-i3c@lists.infradead.org;
	Mon, 17 Aug 2026 10:52:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CE0DA438D2;
	Mon, 17 Aug 2026 10:52:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D7C51F000E9;
	Mon, 17 Aug 2026 10:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786963948;
	bh=bCSvz4f0qOkxbV7xpUB9QaAYzxqgTnFcQeCKESvCp+E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T/QcQsyGB09d9EFM+E7kOtP7/fIfsFnKcr4CEI0S0feV0NX5ekPN8WNmEu9AqtI4Q
	 mnhwG7hj4ivJniACfQ3+C2KISuDEOVOkQ4qGEQoALX5wLM28SKmL/cSsCA67o9SM0q
	 OMyI2VIiq414vF9rrUreeEDvF93Y+uA4piRrZNM9BzhUHAkFpWX5yS1q2VVlTprYUN
	 XR87+g3x5bt3Yb1ZAc2aMzzADWIgKnUNArKrpqFujiLhjdm1PUJkdpy51b+z/qqIpz
	 ZT4AURBMBr+XV9xIfIwAbBIzeo6PnqJiAvZgwzxwhbg0FtDAbiOZ8S2oR4WNrEdLtk
	 07+10cS5MXyxA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 4/8] mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c
 hub and on-die regulator
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org, linux-i3c@lists.infradead.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260817103844.2142802-5-lakshay.piplani@nxp.com>
References: <20260817103844.2142802-1-lakshay.piplani@nxp.com>
 <20260817103844.2142802-5-lakshay.piplani@nxp.com>
Date: Mon, 17 Aug 2026 10:52:27 +0000
Message-Id: <20260817105228.4D7C51F000E9@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gRHJpdmVyLXNwZWNpZmlj
IHNoYXJlZCBoZWFkZXIgYHAzaDI4NDAuaGAgaXMgaW1wcm9wZXJseSBwbGFjZWQgaW4gdGhlIGds
b2JhbCBgaW5jbHVkZS9saW51eC9tZmQvYCBkaXJlY3RvcnkgaW5zdGVhZCBvZiBiZWluZyBsb2Nh
bCB0byBgZHJpdmVycy9tZmQvYC4KLSBbTG93XSBgc3RydWN0IGkyY19kZXZpY2VfaWRgIGFycmF5
IHVzZXMgYSBwb3NpdGlvbmFsIGluaXRpYWxpemVyIGluc3RlYWQgb2YgYSBuYW1lZCBpbml0aWFs
aXplci4KLS0KCi0tLSBQYXRjaCBbNF06IFtQQVRDSCB2MTUgNC84XSBtZmQ6IHAzaDJ4NHg6IEFk
ZCBkcml2ZXIgZm9yIE5YUCBQM0gyeDR4IGkzYyBodWIgYW5kIG9uLWRpZSByZWd1bGF0b3IgLS0t
CmNvbW1pdCBiMTI2NDlkOGJkMTUxNmI3ZDljZmE2OWY4YTJhN2JjOGY0YTEwMTY0CkF1dGhvcjog
QW1hbiBLdW1hciBQYW5kZXkgPGFtYW4ua3VtYXJwYW5kZXlAbnhwLmNvbT4KCm1mZDogcDNoMng0
eDogQWRkIGRyaXZlciBmb3IgTlhQIFAzSDJ4NHggaTNjIGh1YiBhbmQgb24tZGllIHJlZ3VsYXRv
cgoKVGhpcyBjb21taXQgYWRkcyBjb3JlIE1GRCBzdXBwb3J0IGZvciB0aGUgTlhQIFAzSDJ4NHgg
ZmFtaWx5IG9mIG11bHRpcG9ydApJM0MgaHViIGRldmljZXMuIEl0IHByb3ZpZGVzIGRyaXZlciBz
dXBwb3J0IHVzaW5nIGJvdGggSTNDIGFuZCBJMkMKY29tbXVuaWNhdGlvbiBpbnRlcmZhY2VzLCBh
bGxvd2luZyBzdWItZHJpdmVycyB0byBiZSBlbmFibGVkIGluZGVwZW5kZW50bHkuCgo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL21mZC9wM2gyODQwLmMgYi9kcml2ZXJzL21mZC9wM2gyODQwLmMKPiBu
ZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMDAuLjZjNDk3ZDg0ZTJiZGEK
PiAtLS0gL2Rldi9udWxsCj4gKysrIGIvZHJpdmVycy9tZmQvcDNoMjg0MC5jClsgLi4uIF0KPiAr
c3RhdGljIGNvbnN0IHN0cnVjdCBpM2NfZGV2aWNlX2lkIHAzaDJ4NHhfaTNjX2lkc1tdID0gewo+
ICsJSTNDX0NMQVNTKEkzQ19EQ1JfSFVCLCBOVUxMKSwKPiArCXsgLyogc2VudGluZWwgKi8gfSwK
PiArfTsKPiArTU9EVUxFX0RFVklDRV9UQUJMRShpM2MsIHAzaDJ4NHhfaTNjX2lkcyk7Cj4gKwo+
ICtzdGF0aWMgY29uc3Qgc3RydWN0IGkyY19kZXZpY2VfaWQgcDNoMng0eF9pMmNfaWRfdGFibGVb
XSA9IHsKPiArCXsgIm54cC1pM2MtaHViIiB9LAoKW1NldmVyaXR5OiBMb3ddCkRvZXMgdGhpcyBj
b2RlIHVzZSBhIHBvc2l0aW9uYWwgaW5pdGlhbGl6ZXIgaW5zdGVhZCBvZiBhIG5hbWVkIGluaXRp
YWxpemVyPwoKQWNjb3JkaW5nIHRvIEkyQyBzdWJzeXN0ZW0gZ3VpZGVsaW5lcywgaW5pdGlhbGl6
ZWQgYXJyYXlzIG9mIHR5cGUKc3RydWN0IGkyY19kZXZpY2VfaWQgbXVzdCB1c2UgbmFtZWQgaW5p
dGlhbGl6ZXJzIChlLmcuLCAubmFtZSA9ICJueHAtaTNjLWh1YiIpLgoKPiArCXsgLyogc2VudGlu
ZWwgKi8gfQo+ICt9Owo+ICtNT0RVTEVfREVWSUNFX1RBQkxFKGkyYywgcDNoMng0eF9pMmNfaWRf
dGFibGUpOwpbIC4uLiBdCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbWZkL3AzaDI4NDAu
aCBiL2luY2x1ZGUvbGludXgvbWZkL3AzaDI4NDAuaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4g
aW5kZXggMDAwMDAwMDAwMDAwMC4uZWI0NzkyZGU1NDQwZQo+IC0tLSAvZGV2L251bGwKPiArKysg
Yi9pbmNsdWRlL2xpbnV4L21mZC9wM2gyODQwLmgKWyAuLi4gXQo+ICtzdHJ1Y3QgcDNoMng0eF9p
M2NfaHViX2RldjsKPiArCj4gK3N0cnVjdCBwM2gyeDR4IHsKPiArCXN0cnVjdCBpM2NfZGV2aWNl
ICppM2NkZXY7Cj4gKwlzdHJ1Y3QgcmVnbWFwICpyZWdtYXA7CgpbU2V2ZXJpdHk6IExvd10KSXMg
aXQgbmVjZXNzYXJ5IHRvIHBsYWNlIHRoaXMgZHJpdmVyLXNwZWNpZmljIHNoYXJlZCBoZWFkZXIg
aW4gdGhlIGdsb2JhbAppbmNsdWRlL2xpbnV4L21mZC8gZGlyZWN0b3J5PwoKVGhlIE1GRCBzdWJz
eXN0ZW0gZ3VpZGVsaW5lcyByZWNvbW1lbmQga2VlcGluZyBkcml2ZXItc3BlY2lmaWMgaGVhZGVy
IGZpbGVzCmxvY2FsIHRvIGRyaXZlcnMvbWZkLyBpZiB0aGV5IGFyZSBvbmx5IHVzZWQgYnkgdGhl
IHBhcmVudCBhbmQgaXRzIGltbWVkaWF0ZQpjaGlsZHJlbi4KCj4gKwkvKiBOdW1iZXIgb2YgZG93
bnN0cmVhbSB0YXJnZXQgcG9ydHMgKDQgb3IgOCkuICovCj4gKwl1OCBudW1fdGFyZ2V0X3BvcnRz
Owo+ICsJLyogU2VyaWFsaXplcyBwcm90ZWN0ZWQgcmVnaXN0ZXIgdW5sb2NrL2xvY2sgc2VxdWVu
Y2VzIGFjcm9zcyBNRkQgY2hpbGRyZW4uICovCj4gKwlzdHJ1Y3QgbXV0ZXggcHJvdGVjdGVkX3Jl
Z19sb2NrOwo+ICsJLyogSHViIGNvbnRleHQgZm9yIHRoZSBJQkkgaGFuZGxlciB0byByZWFjaCBo
dWIgc3RhdGUgdmlhIHRoZSBwYXJlbnQgaTNjZGV2LiAqLwo+ICsJc3RydWN0IHAzaDJ4NHhfaTNj
X2h1Yl9kZXYgKmkzY19odWJfcHJpdjsKPiArfTsKPiArI2VuZGlmIC8qIF9MSU5VWF9NRkRfUDNI
Mjg0MF9IICovCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8j
L3BhdGNoc2V0LzIwMjYwODE3MTAzODQ0LjIxNDI4MDItMS1sYWtzaGF5LnBpcGxhbmlAbnhwLmNv
bT9wYXJ0PTQKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtaTNjCg==
