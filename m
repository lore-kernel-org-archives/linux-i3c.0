Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 282C5C5DF7A
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Aug 2026 10:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8deE09gdMNfjCoKocxW7oqGYwd2JvwElv8125vUP3u0=; b=el3nB0yzIpQw0P
	VfqWEzqqVKl5UHyBplQ8c37U1Hiol82i5XiKpXbhjVjdmIU6KwiS/R/riZFJp5OT+WZDWzQOYZd/X
	jdNfqIJtyuQcibp6KZJfv5d6uS8Tyu/fhavW6x9cBT7KaibHIkHYSXbN/KNcL9qsffcfvJH67B1w4
	lYGz3fC4PdF0+afn9dmVG+NVHVoE8kjtid5KtSXDNF1ZTfV+bmXJ4aEZe7iAVfUMav4k3HOg0MyRm
	8CDBl4e/GJgqKMEFwKuEcqjfuF++2WzZ1/bMmNJG0cX/DPCncOo3lvHDLIfjGsz3KW0DwsjMQ8xfS
	MDqaWWkrB90uVoUh+46w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvuvk-00000005xw9-3p7W;
	Mon, 17 Aug 2026 10:51:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvuvj-00000005xvw-23hE
	for linux-i3c@lists.infradead.org;
	Mon, 17 Aug 2026 10:50:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F02DC43F3C;
	Mon, 17 Aug 2026 10:50:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71ADB1F000E9;
	Mon, 17 Aug 2026 10:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786963858;
	bh=vnDLG0mfJEppZrZicV1DslhaRLjy4ccwi4GYTtqGfHM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NM+4iRT1T73LyBOXguxHVV4wbDHIrE/6TPon3aHVZI0zTRtejyWitWIZ+wyzNFptI
	 nSDwll7UtHKBsTrXSniepTWsT8vFt1mfnTut+bE//3K92nQg6uJZvgxdmozpfoe2l1
	 Ozx1LW4oeAPO2bo09J1JLIeT40okaGH4XYiz1FHsHk2PfQc6e4BqtbN7DEcNXcTOck
	 h1OMdtYUMEtpbbe6FC318GMaRnGvd8y9RwQBNO5KMP/SqPPSOzI0iPWsRF2UxBfaPC
	 ULNCNKHBWKJBcSlqKscXiAx5u0UG+pcg3pOlmSyx+U7e28ircInqbdQo9VYRdRNsLW
	 0aL+BnF4DRR0g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 1/8] i3c: master: Add APIs for I3C hub support
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: devicetree@vger.kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, robh@kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org, linux-i3c@lists.infradead.org
In-Reply-To: <20260817103844.2142802-2-lakshay.piplani@nxp.com>
References: <20260817103844.2142802-1-lakshay.piplani@nxp.com>
 <20260817103844.2142802-2-lakshay.piplani@nxp.com>
Date: Mon, 17 Aug 2026 10:50:58 +0000
Message-Id: <20260817105058.71ADB1F000E9@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpOZXcgaXNzdWVzOgotIFtNZWRpdW1d
IFRoZSBjb21taXQgbWVzc2FnZSBjbGFpbXMgdG8gYWRkIGhlbHBlcnMgZm9yIGF0dGFjaGluZyBh
bmQgZGV0YWNoaW5nIEkzQyBkZXZpY2VzLCBidXQgdGhlIGltcGxlbWVudGF0aW9uIGlzIGNvbXBs
ZXRlbHkgbWlzc2luZy4KClByZS1leGlzdGluZyBpc3N1ZXM6Ci0gW0hpZ2hdIEFjY2lkZW50YWwg
cmVtb3ZhbCBvZiBJRCAwIGZyb20gYGkzY19idXNfaWRyYCB3aGVuIGBpM2NfYnVzX2luaXQoKWAg
ZmFpbHMuCi0tCgotLS0gUGF0Y2ggWzFdOiBbUEFUQ0ggdjE1IDEvOF0gaTNjOiBtYXN0ZXI6IEFk
ZCBBUElzIGZvciBJM0MgaHViIHN1cHBvcnQgLS0tCmNvbW1pdCAxNGYzNDkxNDRlOThjMWMzZWVk
Y2FhNDEyM2E1M2JmMjQ3MDQ1NjlmCkF1dGhvcjogQW1hbiBLdW1hciBQYW5kZXkgPGFtYW4ua3Vt
YXJwYW5kZXlAbnhwLmNvbT4KCmkzYzogbWFzdGVyOiBBZGQgQVBJcyBmb3IgSTNDIGh1YiBzdXBw
b3J0CgpUaGlzIGNvbW1pdCBhZGRzIGhlbHBlcnMgdG8gcHJlcGFyZSBmb3IgSTNDIGh1YiBzdXBw
b3J0LiBJdCBleHBvc2VzCmFkZHJlc3Mgc2xvdCBtYW5hZ2VtZW50IGFuZCBDQ0MgY29tbWFuZCBp
bnRlcmZhY2VzLCBhbmQgYWxsb3dzIHJlZ2lzdGVyaW5nCnZpcnR1YWwgbWFzdGVycyB3aXRoIGFu
IGV4cGxpY2l0IGZpcm13YXJlIG5vZGUuCgo+IEFkZCBoZWxwZXJzIGZvciBhdHRhY2hpbmcgYW5k
IGRldGFjaGluZyBJM0MgZGV2aWNlcyBhbmQgQ0NDIGhlbHBlcnMKPiB0byBjaGVjayBDQ0Mgc3Vw
cG9ydCBhbmQgc2VuZCBDQ0MgY29tbWFuZHMsIGFkZHJlc3Mgc2xvdCBoZWxwZXJzIHRvCj4gcXVl
cnkgYW5kIHVwZGF0ZSBJM0MgYnVzIGFkZHJlc3Mgc2xvdCBzdGF0ZSwgcmVnaXN0ZXJpbmcgdmly
dHVhbAoKW1NldmVyaXR5OiBNZWRpdW1dClRoZSBjb21taXQgbWVzc2FnZSBjbGFpbXMgdG8gYWRk
IGhlbHBlcnMgZm9yIGF0dGFjaGluZyBhbmQgZGV0YWNoaW5nIEkzQwpkZXZpY2VzLCBidXQgdGhl
IGltcGxlbWVudGF0aW9uIGlzIGNvbXBsZXRlbHkgbWlzc2luZyBmcm9tIHRoZSBwYXRjaC4KClRo
ZSBjaGFuZ2Vsb2cgaW5kaWNhdGVzIHRoYXQgdGhlIGF0dGFjaCBhbmQgZGV0YWNoIGhlbHBlcnMg
d2VyZSBkcm9wcGVkIGluCnYxNS4gU2hvdWxkIHRoZSBjb21taXQgbWVzc2FnZSBiZSB1cGRhdGVk
IHRvIHJlZmxlY3QgdGhpcyBjaGFuZ2U/Cgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0
ZXIuYyBiL2RyaXZlcnMvaTNjL21hc3Rlci5jCj4gaW5kZXggZjFiZTM4YTY0MGNhMS4uMDNmYjQx
ZjA3ODZjNSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIuYwo+ICsrKyBiL2RyaXZl
cnMvaTNjL21hc3Rlci5jCgpbIC4uLiBdCgo+IEBAIC0zMzUyLDYgKzM0MjcsMzkgQEAgaW50IGkz
Y19tYXN0ZXJfcmVnaXN0ZXIoc3RydWN0IGkzY19tYXN0ZXJfY29udHJvbGxlciAqbWFzdGVyLAo+
ICAKPiAgCXJldHVybiByZXQ7Cj4gIH0KPiArRVhQT1JUX1NZTUJPTF9HUEwoaTNjX21hc3Rlcl9y
ZWdpc3Rlcl9md25vZGUpOwoKW1NldmVyaXR5OiBIaWdoXQpUaGlzIGlzbid0IGEgYnVnIGludHJv
ZHVjZWQgYnkgdGhpcyBwYXRjaCwgYnV0IGRvZXMgdGhlIGVycm9yIGhhbmRsaW5nIGluCmkzY19t
YXN0ZXJfcmVnaXN0ZXJfZndub2RlKCkgY29ycnVwdCB0aGUgZ2xvYmFsIElEUiBzdGF0ZT8KCklm
IGkzY19idXNfaW5pdCgpIGZhaWxzIGF0IGlkcl9hbGxvYygpIChlLmcuLCBkdWUgdG8gZHVwbGlj
YXRlIGFsaWFzIGluIERUKSwKaXQgcmV0dXJucyBhbiBlcnJvciB3aGlsZSBsZWF2aW5nIGkzY2J1
cy0+aWQgYXMgMDoKCmRyaXZlcnMvaTNjL21hc3Rlci5jOmkzY19idXNfaW5pdCgpIHsKICAgIC4u
LgogICAgcmV0ID0gaWRyX2FsbG9jKCZpM2NfYnVzX2lkciwgaTNjYnVzLCBzdGFydCwgZW5kLCBH
RlBfS0VSTkVMKTsKICAgIGlmIChyZXQgPCAwKQogICAgICAgIHJldHVybiByZXQ7CiAgICAuLi4K
fQoKVGFraW5nIHRoZSBnb3RvIGVycl9wdXRfZGV2IHBhdGggdGhlbiBjYWxscyBwdXRfZGV2aWNl
KCZtYXN0ZXItPmRldiksIHdoaWNoCmV2ZW50dWFsbHkgdHJpZ2dlcnMgaTNjX21hc3RlcmRldl9y
ZWxlYXNlKCk6Cgpkcml2ZXJzL2kzYy9tYXN0ZXIuYzppM2NfbWFzdGVyZGV2X3JlbGVhc2UoKSB7
CiAgICAuLi4KICAgIGkzY19idXNfY2xlYW51cChidXMpOwogICAgLi4uCn0KClRoaXMgY2FsbHMg
aWRyX3JlbW92ZSgmaTNjX2J1c19pZHIsIGkzY2J1cy0+aWQpLiBCZWNhdXNlIGkzY2J1cy0+aWQg
aXMgc3RpbGwgMCwKZG9lc24ndCB0aGlzIGFjY2lkZW50YWxseSByZW1vdmUgdGhlIHZhbGlkIGJ1
cyAwIGZyb20gdGhlIElEUiB0cmVlPwoKVGhpcyBjb3VsZCBsZWFkIHRvIGR1cGxpY2F0ZSBzeXNm
cyBuYW1lcyAoJ2kzYy0wJykgYW5kIGNyYXNoZXMgZHVyaW5nCmRldmljZV9hZGQoKSBmb3IgYSBu
ZXcgYnVzLgoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9w
YXRjaHNldC8yMDI2MDgxNzEwMzg0NC4yMTQyODAyLTEtbGFrc2hheS5waXBsYW5pQG54cC5jb20/
cGFydD0xCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWkzYwo=
