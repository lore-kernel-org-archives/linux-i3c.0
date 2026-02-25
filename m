Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C67F357C5
	for <linux-i3c@archiver.kernel.org>; Wed, 25 Feb 2026 06:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sS/yAFI6iueb+l375Fe8l14tTQ2OMZIKw2/pcbuu4ro=; b=kXlqopAJ8c+OiG
	WC71lJGn03iVgQj/LKVuDAU8tgENfnxu1+ohEHYXg1zgO0JvhTDORG14oGu7KMuCB6y8CJaKOxxzG
	+Dqkn7dyNpxEL9OaENEeY8+RyX1FEFR5IFcIWxrHExtQNG2eduUEvAn6bPU4G23VyI0KwvWNV3i7k
	2WgwmfUnDgyZ7pIRHJkXPs/vAp/bcXSnRYdpPJ5XdFmZ9eXbaUl9Lzf3eOVGbGzKlwvVPS4QGiQKy
	8V6huZNKMvN5sauA793nGXqpdS3CtKn6BEGM8w7bGfqHPJ7+l70vNglAMMJJbk8Cs9SWM8HMODQgM
	FQbP+fPK/dvylZNOy6nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv8cc-00000003MGa-2zDs;
	Wed, 25 Feb 2026 06:43:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv8cb-00000003MGQ-1U6N
	for linux-i3c@bombadil.infradead.org;
	Wed, 25 Feb 2026 06:43:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=kD6AmYfHaV7ToltQOuWaaK+gQqZuth//RER0iQeyBnI=; b=W9n3PqTay89PHmyKPKzYMj6C6w
	WvxABWR/aUvGVHKDz9Vc/ua4P7fOqrxnyg3sVQeLee9znpa9hBEDIBAehqz8g8yotOsppazJftkDD
	OhXRncXGDuCuK29TB2IuRSYfCDgkLHavOUXpDjW6/QgsL8zWW4DLq/weqsIKwVrA5B22CGQslUFI5
	e9+RBWZerSx1QpS6X0FgekLsHdRji+eYSrMbiym/b2rHlG35EBvxPiyyLX/vGEqHegyPqJiULUPg2
	EutO9fp0ZLMX3KG8AGhXaflLypBKXmbGCqbwnYEOyudIpoZdhdxBQC8wnoLQP2VrhSKXwSZsmdQBe
	tjrN665g==;
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv8cM-00000008PyD-0iih
	for linux-i3c@lists.infradead.org;
	Wed, 25 Feb 2026 06:43:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1772001798;
	bh=kD6AmYfHaV7ToltQOuWaaK+gQqZuth//RER0iQeyBnI=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=fYRv4LSl4LDULvDMUP84fFFloabm2UA3YXZSPbwZFDtV9hvwTf07JkHidz47kJZoA
	 wf0EhBhKOJ220jz8Qnr48XdOEBKocAbdXxIyRxQgaMZR2isULhsgQwdu7Y9dGYoRh6
	 4sWuAxJxF6LKk85fry0xSxruhfQsAVkSVXZ7r8RyncydW9CCqmGepW+ZHnhmQ3QZQv
	 XEiHG+1cAJ2bHULliuj4rV9PlDU6H2dSGbQ7tdpRDoBg0nBIOCgKP4+RdUxEs9xQoQ
	 K9tIKzYaKbFg1QFm2ukQnQbuU52wSm/VidtX/zsOK5VOk7SdrYXyVXihY4Yo5Xo/Lb
	 mcioucb01PMDg==
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id D88DF6023B;
	Wed, 25 Feb 2026 14:43:17 +0800 (AWST)
Message-ID: <0307499b99c3ea9280ea2d6b9c3e325aeec46a0d.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1] i3c: master: ast2600: Fix missing of_node for
 virtual I2C adapter
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Peter Yin <peteryin.openbmc@gmail.com>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 25 Feb 2026 14:43:17 +0800
In-Reply-To: <20260225063529.3230676-1-peteryin.openbmc@gmail.com>
References: <20260225063529.3230676-1-peteryin.openbmc@gmail.com>
User-Agent: Evolution 3.46.4-2+deb12u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_064333_138429_81B179B1 
X-CRM114-Status: UNSURE (   9.78  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

SGkgUGV0ZXIsCgo+IFRoZSBBU1BFRUQgQVNUMjYwMCBJM0MgbWFzdGVyIGRyaXZlciBjcmVhdGVz
IGEgdmlydHVhbCBJMkMgYWRhcHRlciB0bwo+IHByb3ZpZGUgYmFja3dhcmQgY29tcGF0aWJpbGl0
eSB3aXRoIEkyQyBkZXZpY2VzLiBIb3dldmVyLCB0aGUgY3VycmVudAo+IGltcGxlbWVudGF0aW9u
IGRvZXMgbm90IGFzc29jaWF0ZSB0aGlzIHZpcnR1YWwgYWRhcHRlciB3aXRoIGFueQo+IERldmlj
ZSBUcmVlIG5vZGUuCj4gCj4gVGhpcyBwYXRjaCBwcm9wYWdhdGVzIHRoZSBvZl9ub2RlIGZyb20g
dGhlIEkzQyBtYXN0ZXIgcGxhdGZvcm0gZGV2aWNlCj4gdG8gdGhlIHZpcnR1YWwgSTJDIGFkYXB0
ZXIncyBkZXZpY2Ugc3RydWN0dXJlLiBUaGlzIGVuc3VyZXMgdGhhdAo+IHN0YW5kYXJkIEkyQyBh
bGlhc2VzIGFyZSBjb3JyZWN0bHkgcmVzb2x2ZWQgYW5kIGJ1cyBudW1iZXJpbmcgcmVtYWlucwo+
IGNvbnNpc3RlbnQgYWNyb3NzIHJlYm9vdHMuCgpTb3VuZHMgc2Vuc2libGUgLSBidXQ6Cgo+IC0t
LSBhL2RyaXZlcnMvaTNjL21hc3Rlci9hc3QyNjAwLWkzYy1tYXN0ZXIuYwo+ICsrKyBiL2RyaXZl
cnMvaTNjL21hc3Rlci9hc3QyNjAwLWkzYy1tYXN0ZXIuYwo+IEBAIC0xNTYsNiArMTU2LDcgQEAg
c3RhdGljIGludCBhc3QyNjAwX2kzY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGkzYy0+
c2RhX3B1bGx1cCk7Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgaTNjLT5kdy5wbGF0Zm9ybV9vcHMg
PSAmYXN0MjYwMF9pM2Nfb3BzOwo+ICvCoMKgwqDCoMKgwqDCoGkzYy0+ZHcuYmFzZS5pMmMuZGV2
Lm9mX25vZGUgPSBucDsKPiDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIGR3X2kzY19jb21tb25fcHJv
YmUoJmkzYy0+ZHcsIHBkZXYpOwo+IMKgfQoKV2h5IG5vdCBkbyB0aGlzIGluIHRoZSBjb21tb24g
KGR3KSBkcml2ZXI/IE5vdGhpbmcgYWJvdXQgdGhlIG9mX25vZGUKYXNzb2NpYXRpb24gaXMgYXNw
ZWVkLXNwZWNpZmljLgoKQ2hlZXJzLAoKCkplcmVteQoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxp
c3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
