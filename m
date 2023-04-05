Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8704C7619A
	for <linux-i3c@archiver.kernel.org>; Wed,  5 Apr 2023 12:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RZZZ0v0A3yUXCVHokIkd79IEikl4n1X2RsiwgpdX9ds=; b=YEBVKEikIITmJ0
	5LCrHCkmcThA05gwaAIePekDuu4FpIhuDt2L46/+LSoW4z1qZgtxrNpI7cmdytzk72Gy6P+vwJmqn
	h2As3ccLBDJ76/kX3xlaMCo5a+u6VIiZ3IIIQ8c4/b7D/3A4qBg/Eukiit2wqWhntrPXY7lxLAR+B
	bKf6NThfvl6nYz4K7kcWiu5Xv7y7S+48Lajm8Dv3ZAO/lydkuDEszhwR1t20Ow4hnXm3T3JLTek4j
	W3TbTZnYh3hECpOAJ+dQP4Ga/V7ZmNyYacOYeuql83fxONsXqW820jK1bT3g6JsRCzGmxCOzA4HI1
	h3qYTd4hKYUGhg6+TwiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pk2RE-004Qgv-3B;
	Wed, 05 Apr 2023 12:40:32 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk2RC-004Qfs-03
	for linux-i3c@lists.infradead.org;
	Wed, 05 Apr 2023 12:40:31 +0000
Received: from sparky.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 5C9F220034;
	Wed,  5 Apr 2023 20:40:21 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1680698421;
	bh=JfwKxa7K0kEukq+XR5vbtECxbSLPPs5A2QKco6EFHRo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Vh4gXCt8SsoaQ6d9ahm4azWBn7zTz4U7zc7VTjwXJJ+s3wleVP/CcWbPDJS1ULQph
	 pwveOKlzOZ43FgebTqCoJ6o5dVY64NwCuprnWFeSyu7NJTcXVTZtRpFk4zB4yD3NqV
	 QkAFFC/anwTq7CGgfMN/GYgsoL4YVuLduTVTvaLMBidEhjsD3osPyfXv1bbePZDV9b
	 PNWtGzy82xaIg1XzAua915y++jokgnRp0jJ0w3jwaXt0v8ImvHhkVXY9GhyFheCGJs
	 D+xHWhqS+ufaAM96YiA3x0ZaMyViUfyfexf6B94yVnTzefCgfJ3Hpcl6yqtQsoy/qj
	 /XLnkgRp2NFXg==
Message-ID: <5e48f373e7df77acd95964ea5c18f8d92b8a4582.camel@codeconstruct.com.au>
Subject: Re: [PATCH] i3c: Allow OF-alias-based persistent bus numbering
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Ben Dooks <ben.dooks@sifive.com>, linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Matt Johnston
	 <matt@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
Date: Wed, 05 Apr 2023 20:40:20 +0800
In-Reply-To: <d3391a58-a272-9432-8d61-887bb23727b1@sifive.com>
References: <20230405094149.1513209-1-jk@codeconstruct.com.au>
	 <d3391a58-a272-9432-8d61-887bb23727b1@sifive.com>
User-Agent: Evolution 3.46.4-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_054030_249942_BBE448E0 
X-CRM114-Status: UNSURE (   9.74  )
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

SGkgQmVuLAoKPiA+IEBAIC00MTksOSArNDIwLDkgQEAgc3RhdGljIHZvaWQgaTNjX2J1c19jbGVh
bnVwKHN0cnVjdCBpM2NfYnVzICppM2NidXMpCj4gPiDCoMKgwqDCoMKgwqDCoMKgbXV0ZXhfdW5s
b2NrKCZpM2NfY29yZV9sb2NrKTsKPiA+IMKgIH0KPiA+IMKgIAo+ID4gLXN0YXRpYyBpbnQgaTNj
X2J1c19pbml0KHN0cnVjdCBpM2NfYnVzICppM2NidXMpCj4gPiArc3RhdGljIGludCBpM2NfYnVz
X2luaXQoc3RydWN0IGkzY19idXMgKmkzY2J1cywgc3RydWN0IGRldmljZV9ub2RlICpucCkKPiAK
PiB3b3VsZCBpdCBiZSB3b3J0aCBwYXNzaW5nIHRoZSBzdHJ1Y3QgaTNjX21hc3Rlcl9jb250cm9s
bGVyIHRocm91Z2gKPiB0aGlzIGluIGNhc2Ugb3RoZXIgaW5mbyBpcyBuZWVkZWQgYXQgYSBsYXRl
ciBkYXRlPyBEb2VzIEFDUEkgaGF2ZQo+IGFueXRoaW5nIHNpbWlsYXI/CgpXZSBjb3VsZCBjZXJ0
YWlubHkgYWRkIG90aGVyIHBsYXRmb3JtIGVudW1lcmF0aW9uIGRhdGEgaW4gZnV0dXJlLCBidXQg
SQpkb24ndCBrbm93IGVub3VnaCBhYm91dCBBQ1BJIGRldmljZSBkaXNjb3ZlcnkgdG8gY2F0ZXIg
Zm9yIGV2ZXJ5dGhpbmcgYXQKdGhpcyBzdGFnZS4KCkknbSBqdXN0IHBhc3NpbmcgdGhlIE9GIG5v
ZGUgYmVjYXVzZSB0aGF0J3MgYWxsIHdlIG5lZWQgbm93OyB3ZSBjYW4KY2VydGFpbmx5IGV4dGVu
ZCBvbmNlIHdlIGhhdmUgYSBjb25jcmV0ZSBwYXR0ZXJuIGZvciBvdGhlciBwbGF0Zm9ybXMgLQp0
aGlzIGlzIGp1c3QgYSBzdGF0aWMgZnVuY3Rpb24sIHNvIGl0J2xsIGJlIGVhc3kgdG8gdXBkYXRl
LgoKSWYgd2Ugd2FudCB0byBmb2xsb3cgaTJjOiBmb3Igbm9uLU9GLWJhc2VkIHN0YXRpYyBidXMg
bnVtYmVyaW5nLCBpdCdzIHVwCnRvIHdoYXRldmVyIGlzIGluc3RhbnRpYXRpbmcgdGhlIGkyYyBi
dXMgZGV2aWNlIHRvIHByb3ZpZGUgYW4gaWQgZm9yCmkyY19hZGRfbnVtYmVyZWRfYWRhcHRlcigp
LiBXZSBkb24ndCBoYXZlIGFueSB1c2VycyBmb3IgdGhhdCBpbiBpM2MgYXQKcHJlc2VudCB0aG91
Z2gsIHNvIGl0J3MgcHJvYmFibHkgYSBiaXQgcHJlbWF0dXJlIHRvIGFkZCBhbiBlcXVpdmFsZW50
CkFQSS4KCkNoZWVycywKCgpKZXJlbXkKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4
LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtaTNjCg==
