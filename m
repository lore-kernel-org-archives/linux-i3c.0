Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B06C0C624D4
	for <linux-i3c@archiver.kernel.org>; Thu,  3 Sep 2026 06:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rRlsTri+BV03OxtRn3+LeZ8JDR2Ea+7lIJxcSRpFlGE=; b=oGYlXUEXrBhfvM
	QTiQQ50aF++GWBiMDg2zxGasqDy+5E9ZSKaIeiUv1dWhKH7srmavS0bulL3PC1xTzRGwJByYRm+9Q
	mabhxPQRekwwJ3b/hMSA3zMxlL9Q2ofPqS1ssOL2QLp5FVLxH22f+h2TQiQUWadQdWs9NU5pIH5RI
	OkSPUZzMxiRPGxXw1xJXXNaiz6jgpkio+HvhvMIXUUflxfVq59CxisQHkh2NWOGb0QaUqRBqSZFyA
	HpwcSYWO8wjmsOjN3wVctT16aruXduiQoz9wTi6hgfoYnEi4wAl8zvdovfkmQUC69KsSOJnSd0diD
	AzgivazSDaOlHrjpvOQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x212Y-0000000GUvg-1dz2;
	Thu, 03 Sep 2026 06:35:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x212X-0000000GUvB-0Gwp
	for linux-i3c@lists.infradead.org;
	Thu, 03 Sep 2026 06:35:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 82B12600D4;
	Thu,  3 Sep 2026 06:35:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED71B1F00A3A;
	Thu,  3 Sep 2026 06:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788417312;
	bh=FoHungPs4u/yiJsnFI9jpj2jYuTxqlLCvKHhmusZdkI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oshGw5io3PE8Ptwu36xJyQYFHR6Aw8pDE7EPk50uhtsCDag9G2ABwCRCVgKcXtF55
	 mWlKeAl/HemvS6gn8ZmJa73OvFkZerglR1EIg9+eVmKGsILzvF9nkvT2ixwCdNSUUn
	 81tQhVO5R9LV7tAc6OMN9/fyMqCr7kPKjqxp56DrftrbNru33RDXFVtbdtOxIJ6vUA
	 GZL3zfD20RLoo4a3wf3+C9kuTyk/2eHVoXcEiO/mur1JjM4mhdGSGv0Xw+idDjzq6c
	 nFw71W+8kAiSWQ2HcQdfJkuqVHEf5ONPU1EjmbklnkvSetWAvKHnnXlagJ2S+a7sT7
	 Jcs+E2dqur+gQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 4/8] mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c
 hub and on-die regulator
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: devicetree@vger.kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, Frank.Li@kernel.org, robh@kernel.org, linux-i3c@lists.infradead.org, conor+dt@kernel.org
In-Reply-To: <20260903062108.2712296-5-lakshay.piplani@nxp.com>
References: <20260903062108.2712296-1-lakshay.piplani@nxp.com>
 <20260903062108.2712296-5-lakshay.piplani@nxp.com>
Date: Thu, 03 Sep 2026 06:35:11 +0000
Message-Id: <20260903063511.ED71B1F00A3A@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gRHJpdmVyLXNwZWNpZmlj
IGhlYWRlciBmaWxlIGlzIHBsYWNlZCBpbiB0aGUgZ2xvYmFsIGluY2x1ZGUvbGludXgvbWZkLyBk
aXJlY3RvcnkgaW5zdGVhZCBvZiBkcml2ZXJzL21mZC8uCi0tCgpjb21taXQgNDQ0NzAzZWQwMDQ2
MjhkYzhjNzFkNjc1OTE3NTM1ZjFhNzI0YmI1MwpBdXRob3I6IEFtYW4gS3VtYXIgUGFuZGV5IDxh
bWFuLmt1bWFycGFuZGV5QG54cC5jb20+CgptZmQ6IHAzaDJ4NHg6IEFkZCBkcml2ZXIgZm9yIE5Y
UCBQM0gyeDR4IGkzYyBodWIgYW5kIG9uLWRpZSByZWd1bGF0b3IKClRoaXMgY29tbWl0IGFkZHMg
Y29yZSBNRkQgc3VwcG9ydCBmb3IgdGhlIE5YUCBQM0gyeDR4IGZhbWlseSBvZiBtdWx0aXBvcnQK
STNDIGh1YiBkZXZpY2VzLiBJdCBwcm92aWRlcyBzdXBwb3J0IGZvciB0aGUgSTNDIGh1YiBhbmQg
cmVndWxhdG9yIHN1YmRldmljZXMKdXNpbmcgYSBzaGFyZWQgcmVnaXN0ZXIgaW50ZXJmYWNlIG92
ZXIgSTNDIG9yIEkyQy4KCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbWZkL3AzaDI4NDAu
aCBiL2luY2x1ZGUvbGludXgvbWZkL3AzaDI4NDAuaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4g
aW5kZXggMDAwMDAwMDAwMDAwMC4uZWI0NzkyZGU1NDQwZQo+IC0tLSAvZGV2L251bGwKPiArKysg
Yi9pbmNsdWRlL2xpbnV4L21mZC9wM2gyODQwLmgKWyAuLi4gXQo+ICtzdHJ1Y3QgcDNoMng0eCB7
Cj4gKwlzdHJ1Y3QgaTNjX2RldmljZSAqaTNjZGV2Owo+ICsJc3RydWN0IHJlZ21hcCAqcmVnbWFw
Owo+ICsJLyogTnVtYmVyIG9mIGRvd25zdHJlYW0gdGFyZ2V0IHBvcnRzICg0IG9yIDgpLiAqLwo+
ICsJdTggbnVtX3RhcmdldF9wb3J0czsKPiArCS8qIFNlcmlhbGl6ZXMgcHJvdGVjdGVkIHJlZ2lz
dGVyIHVubG9jay9sb2NrIHNlcXVlbmNlcyBhY3Jvc3MgTUZEIGNoaWxkcmVuLiAqLwo+ICsJc3Ry
dWN0IG11dGV4IHByb3RlY3RlZF9yZWdfbG9jazsKPiArCS8qIEh1YiBjb250ZXh0IGZvciB0aGUg
SUJJIGhhbmRsZXIgdG8gcmVhY2ggaHViIHN0YXRlIHZpYSB0aGUgcGFyZW50IGkzY2Rldi4gKi8K
PiArCXN0cnVjdCBwM2gyeDR4X2kzY19odWJfZGV2ICppM2NfaHViX3ByaXY7Cj4gK307CgpbU2V2
ZXJpdHk6IExvd10KU2luY2Ugc3RydWN0IHAzaDJ4NHggaXMgb25seSBzaGFyZWQgYnkgdGhlIE1G
RCBwYXJlbnQgYW5kIGl0cyBpbW1lZGlhdGUKcmVndWxhdG9yIGFuZCBpM2MtaHViIGNoaWxkcmVu
LCBzaG91bGRuJ3QgdGhpcyBoZWFkZXIgZmlsZSBiZSBrZXB0IGxvY2FsCnRvIGRyaXZlcnMvbWZk
LyByYXRoZXIgdGhhbiBiZWluZyBwbGFjZWQgaW4gdGhlIGdsb2JhbCBpbmNsdWRlL2xpbnV4L21m
ZC8KZGlyZWN0b3J5PwoKVGhlIE1GRCBzdWJzeXN0ZW0gZ3VpZGVsaW5lcyByZWNvbW1lbmQgYXZv
aWRpbmcgZ2xvYmFsIGluY2x1ZGUgZGlyZWN0b3J5CnBvbGx1dGlvbiBmb3IgZHJpdmVyLXNwZWNp
ZmljIGhlYWRlcnMgdW5sZXNzIHRoZXkgYXJlIGNvbnN1bWVkIG91dHNpZGUgdGhlCmltbWVkaWF0
ZSBwYXJlbnQtY2hpbGQgaGllcmFyY2h5LgoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBz
Oi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDkwMzA2MjEwOC4yNzEyMjk2LTEtbGFrc2hh
eS5waXBsYW5pQG54cC5jb20/cGFydD00CgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51
eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
