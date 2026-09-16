Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E98F5C88E77
	for <linux-i3c@archiver.kernel.org>; Wed, 16 Sep 2026 07:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=khYJp1KuhQv5xnruKEST5m6wYlhdiLhKyqb4NccsJIY=; b=1tcVzrb9fsYUaQ
	UhGloaKQDhDbmxi7/qYsdwra5mXqJarxHQUqgi5mOl08+8/8MupuoES838+/yQQckLWbkoYNFh0ac
	FSgvwOzjmPNiNT1qy76i2JLLLlV1AHIoTE4YpOdtzbzGcAtF+r2+yEzLKgSE0EeO9i5zmqc45TFCH
	6vD2iNZUwwfm3WWkYb70IXK6E+vX6wvq6nL3TTgG43162OZ390WPee1b2uioFcvDTL3PUTBokwKMh
	AQzbr9wz7+2PzZrPJyvZABIg/2Ume3NPx1SnsVBFVrwQncZQ0N7cIoNRDgpK60WVSedm3kI17QpIf
	WM75lV9WewYGzdUO9uRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6jvF-00000008Zqu-2eXH;
	Wed, 16 Sep 2026 07:19:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6jvE-00000008Zqf-1KlL
	for linux-i3c@lists.infradead.org;
	Wed, 16 Sep 2026 07:19:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A7BE560234;
	Wed, 16 Sep 2026 07:19:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 026271F000FF;
	Wed, 16 Sep 2026 07:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789543151;
	bh=QccWB28oDNQfYwFucGmmMeuyUkJzgIMhsdJ212o+VdY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mqF760PjB1YUxwt7bBlapvCWu1TeUsbKIa5O6TIxa+BFUa3J1fQYPKY/qAg7oBMn+
	 SzRxUnpb9ulFWdxOzUjpAN5FjQQr13j6va2VaZTRIDOgab2ljMQOBjxJlzldOK228b
	 gH3knfpw0pWsSLkmSfsNFJxx1QSiCZJ7tYb50ps7VM9VoTIK8naXU/bSJ/aibIqbvX
	 hSKS7cT7jeHBj6uYVmZEsoRPBYXq/2MHtjOGHvk+iTTOib0+zuT0tMarI5jdiVsL9x
	 Ocjxq9zu+UXGtK8YNutfLkH2FeG3Ka2So8kMciK+2uovWahLXA87mfZ3Xvw9T7AKm1
	 vzFwCqCpr1Y3g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v19 4/8] mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c
 hub and on-die regulator
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: conor+dt@kernel.org, robh@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, Frank.Li@kernel.org, linux-i3c@lists.infradead.org
In-Reply-To: <20260916070728.1088801-5-lakshay.piplani@nxp.com>
References: <20260916070728.1088801-1-lakshay.piplani@nxp.com>
 <20260916070728.1088801-5-lakshay.piplani@nxp.com>
Date: Wed, 16 Sep 2026 07:19:10 +0000
Message-Id: <20260916071911.026271F000FF@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gbWZkOiBkcml2ZXItc3Bl
Y2lmaWMgaGVhZGVyIHBsYWNlZCBpbiBnbG9iYWwgaW5jbHVkZS9saW51eC9tZmQvIGRpcmVjdG9y
eQotLQoKY29tbWl0IGE0MzhmMGI5NWQ0OWY1ZWNlYzQzY2QxNjg2ODM5NjllY2ExNjEzNjIKQXV0
aG9yOiBBbWFuIEt1bWFyIFBhbmRleSA8YW1hbi5rdW1hcnBhbmRleUBueHAuY29tPgoKbWZkOiBw
M2gyeDR4OiBBZGQgZHJpdmVyIGZvciBOWFAgUDNIMng0eCBpM2MgaHViIGFuZCBvbi1kaWUgcmVn
dWxhdG9yCgpBZGQgY29yZSBNRkQgc3VwcG9ydCBmb3IgdGhlIE5YUCBQM0gyeDR4IChQM0gyNDQw
L1AzSDI0NDEvUDNIMjg0MC9QM0gyODQxKQpmYW1pbHkgb2YgbXVsdGlwb3J0IEkzQyBodWIgZGV2
aWNlcy4gVGhlc2UgZGV2aWNlcyBjb25uZWN0IHRvIGEgaG9zdCB2aWEKSTNDL0kyQy9TTUJ1cyBh
bmQgZXhwb3NlIG11bHRpcGxlIGRvd25zdHJlYW0gdGFyZ2V0IHBvcnRzLgoKPiBkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9saW51eC9tZmQvcDNoMjg0MC5oIGIvaW5jbHVkZS9saW51eC9tZmQvcDNoMjg0
MC5oCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAwLi5lYjQ3OTJk
ZTU0NDBlCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2luY2x1ZGUvbGludXgvbWZkL3AzaDI4NDAu
aAo+IEBAIC0wLDAgKzEsNDEgQEAKWyAuLi4gXQo+ICtzdHJ1Y3QgcDNoMng0eCB7Cj4gKwlzdHJ1
Y3QgaTNjX2RldmljZSAqaTNjZGV2Owo+ICsJc3RydWN0IHJlZ21hcCAqcmVnbWFwOwo+ICsJLyog
TnVtYmVyIG9mIGRvd25zdHJlYW0gdGFyZ2V0IHBvcnRzICg0IG9yIDgpLiAqLwo+ICsJdTggbnVt
X3RhcmdldF9wb3J0czsKPiArCS8qIFNlcmlhbGl6ZXMgcHJvdGVjdGVkIHJlZ2lzdGVyIHVubG9j
ay9sb2NrIHNlcXVlbmNlcyBhY3Jvc3MgTUZEIGNoaWxkcmVuLiAqLwo+ICsJc3RydWN0IG11dGV4
IHByb3RlY3RlZF9yZWdfbG9jazsKPiArCS8qIEh1YiBjb250ZXh0IGZvciB0aGUgSUJJIGhhbmRs
ZXIgdG8gcmVhY2ggaHViIHN0YXRlIHZpYSB0aGUgcGFyZW50IGkzY2Rldi4gKi8KPiArCXN0cnVj
dCBwM2gyeDR4X2kzY19odWJfZGV2ICppM2NfaHViX3ByaXY7Cj4gK307Cj4gKyNlbmRpZiAvKiBf
TElOVVhfTUZEX1AzSDI4NDBfSCAqLwoKW1NldmVyaXR5OiBMb3ddClNob3VsZCB0aGlzIGRyaXZl
ci1zcGVjaWZpYyBoZWFkZXIgYmUgbW92ZWQgdG8gZHJpdmVycy9tZmQvIHJhdGhlciB0aGFuIGJl
aW5nCnBsYWNlZCBpbiB0aGUgZ2xvYmFsIGluY2x1ZGUvbGludXgvbWZkLyBkaXJlY3Rvcnk/CgpU
aGUgTUZEIHN1YnN5c3RlbSBndWlkZWxpbmVzIHN0YXRlIHRoYXQgZHJpdmVyLXNwZWNpZmljIGhl
YWRlcnMgc2hvdWxkIG5vdCBiZQpwbGFjZWQgaW4gdGhlIGdsb2JhbCBpbmNsdWRlIGRpcmVjdG9y
eSBpZiB0aGV5IGFyZSBvbmx5IHVzZWQgYnkgdGhlIHBhcmVudCBhbmQKaXRzIGltbWVkaWF0ZSBj
aGlsZHJlbi4gU2luY2Ugc3RydWN0IHAzaDJ4NHggaXMgb25seSBzaGFyZWQgYmV0d2VlbiB0aGUg
cGFyZW50CmFuZCBpdHMgcmVndWxhdG9yL2kzYy1odWIgY2hpbGRyZW4sIGRvZXMgaXQgYmVsb25n
IGluIHRoZSBsb2NhbCBkcml2ZXJzL21mZC8KZGlyZWN0b3J5IGluc3RlYWQ/CgotLSAKU2FzaGlr
byBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwOTE2MDcw
NzI4LjEwODg4MDEtMS1sYWtzaGF5LnBpcGxhbmlAbnhwLmNvbT9wYXJ0PTQKCi0tIApsaW51eC1p
M2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
