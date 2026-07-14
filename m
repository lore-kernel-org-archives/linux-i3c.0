Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC02EC43458
	for <linux-i3c@archiver.kernel.org>; Tue, 14 Jul 2026 10:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lg0x7pTtiR91rac83LSfiERUqrfRnCiv1a1N6TQWY5E=; b=r3VvK7PtwZ/u1Q
	eDahaZxgnbijJ05zQCscVdauq45lcZT3L/HqNlxzgFvYfsA4Q4neVMdMWSn/OGzLpjnpYXyu80SWQ
	sJKqyOqYZ6TpUgGwQKWnGa56yDx82sGJ6QSCYsIHc/RvomJ4SFCFqPQVAKtEx4RNj1AbrGRHQUJPR
	CtnFNK6NGbJn4lC2mEyTOpNjVBiVARMS/Q6QYo+gTTAqy89WBu3SBVgexM14XMvTLiJphWI7PDw+g
	DtdBZFzhNkASz1NyXA3govEqeIcp3ue5kwURE5ke9IvgtYMLKBnshkJav4NLlaIqi2SjNvxlWyxiR
	qTl/BjXyFN/QRA6ul+vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjahp-0000000Bbl6-1wU9;
	Tue, 14 Jul 2026 10:49:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjaho-0000000Bbl0-0Gb8
	for linux-i3c@lists.infradead.org;
	Tue, 14 Jul 2026 10:49:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0C56860120;
	Tue, 14 Jul 2026 10:49:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5902E1F000E9;
	Tue, 14 Jul 2026 10:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784026178;
	bh=P75t0rtBVZzTvdRwa9/+74bm860SvIYWvnvjecvf3G4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fetno/zJLMjboufzProXAjnXJm9WySGEFV4uvcVACyWefl3+wSDM8VhrrS4TjgRR6
	 uPdw9OaYKEW+Z3fm4YzFcuIdMMLs5UVzHZr1IZCHw79psNw9yYAMnh+fDC6zuGz680
	 kDyWrU/mPpFuIGzmJnv4sCsG1WdgG8eCmNkKPblXiO+NnnbXiw9fpPAQE2jYNhQZQf
	 NnJmI80inwFflpIcXNRoM9HFofR1F00sErTgx+h1spR+bGKOtZiobwgunHZ4Y9hvgO
	 kaUS2xjO9xO8JsEwDE2yQLMgS09rTX3lUsaLHmIYqJwwAyE/Gfjg4SmDwl4Y7+B9Jp
	 U/qGWm+G4SPHQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 4/8] mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c
 hub and on-die regulator
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, robh@kernel.org, devicetree@vger.kernel.org, linux-i3c@lists.infradead.org, Frank.Li@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260714092053.2461482-5-lakshay.piplani@nxp.com>
References: <20260714092053.2461482-1-lakshay.piplani@nxp.com>
 <20260714092053.2461482-5-lakshay.piplani@nxp.com>
Date: Tue, 14 Jul 2026 10:49:37 +0000
Message-Id: <20260714104938.5902E1F000E9@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gQXJjaGl0ZWN0dXJlIC8g
TGF5ZXJpbmcgVmlvbGF0aW9uOiBEcml2ZXItc3BlY2lmaWMgaGVhZGVyIGZpbGUgaXMgaW5jb3Jy
ZWN0bHkgcGxhY2VkIGluIHRoZSBnbG9iYWwgYGluY2x1ZGUvbGludXgvbWZkL2AgZGlyZWN0b3J5
LgotLQoKLS0tIFBhdGNoIFs0XTogW1BBVENIIHYxNCA0LzhdIG1mZDogcDNoMng0eDogQWRkIGRy
aXZlciBmb3IgTlhQIFAzSDJ4NHggaTNjIGh1YiBhbmQgb24tZGllIHJlZ3VsYXRvciAtLS0KY29t
bWl0IDJhNTkxNjdkMzhiYzBjODYwN2NmMTZjMDUyNDliZTJkN2Q5YzkzNTQKQXV0aG9yOiBBbWFu
IEt1bWFyIFBhbmRleSA8YW1hbi5rdW1hcnBhbmRleUBueHAuY29tPgoKbWZkOiBwM2gyeDR4OiBB
ZGQgZHJpdmVyIGZvciBOWFAgUDNIMng0eCBpM2MgaHViIGFuZCBvbi1kaWUgcmVndWxhdG9yCgpU
aGlzIGNvbW1pdCBhZGRzIGNvcmUgTUZEIHN1cHBvcnQgZm9yIHRoZSBOWFAgUDNIMng0eCBmYW1p
bHkgb2YgbXVsdGlwb3J0CkkzQyBodWIgZGV2aWNlcy4gVGhlc2UgZGV2aWNlcyBjb25uZWN0IHRv
IGEgaG9zdCB2aWEgSTNDL0kyQy9TTUJ1cyBhbmQKZXhwb3NlIG11bHRpcGxlIGRvd25zdHJlYW0g
dGFyZ2V0IHBvcnRzLgoKWyAuLi4gXQoKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tZmQv
cDNoMjg0MC5oIGIvaW5jbHVkZS9saW51eC9tZmQvcDNoMjg0MC5oCj4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAwLi5iYTlhMzg3NTZlY2I4Cj4gLS0tIC9kZXYvbnVs
bAo+ICsrKyBiL2luY2x1ZGUvbGludXgvbWZkL3AzaDI4NDAuaAo+IEBAIC0wLDAgKzEsMjUgQEAK
PiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8KClsgLi4uIF0KCj4gKyNk
ZWZpbmUgSTNDX01BTlVGX0lEX05YUAkJCQkJMHgwMTFiCj4gKwo+ICtzdHJ1Y3QgcDNoMng0eCB7
Cj4gKwlzdHJ1Y3QgaTNjX2RldmljZSAqaTNjZGV2Owo+ICsJc3RydWN0IHJlZ21hcCAqcmVnbWFw
Owo+ICsJc3RydWN0IG11dGV4IHByb3RlY3RlZF9yZWdfbG9jazsgLyogU2VyaWFsaXplcyBwcm90
ZWN0ZWQgcmVnaXN0ZXIgdW5sb2NrL2xvY2sgc2VxdWVuY2VzLiAqLwo+ICt9OwoKW1NldmVyaXR5
OiBMb3ddClRoaXMgaXNuJ3QgYSBidWcsIGJ1dCBzaW5jZSB0aGlzIGhlYWRlciBmaWxlIGRlZmlu
ZXMgZHJpdmVyLXNwZWNpZmljCnN0cnVjdHVyZXMgc29sZWx5IGludGVuZGVkIGZvciB0aGUgcGFy
ZW50IGFuZCBpdHMgaW1tZWRpYXRlIGNoaWxkcmVuLCBzaG91bGQKaXQgYmUga2VwdCBsb2NhbGx5
IGluIGRyaXZlcnMvbWZkLyByYXRoZXIgdGhhbiBiZWluZyBwbGFjZWQgaW4gdGhlIGdsb2JhbApp
bmNsdWRlL2xpbnV4L21mZC8gZGlyZWN0b3J5PwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0
dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDcxNDA5MjA1My4yNDYxNDgyLTEtbGFr
c2hheS5waXBsYW5pQG54cC5jb20/cGFydD00CgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdAps
aW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
