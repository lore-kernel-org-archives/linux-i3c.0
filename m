Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E47CC5DF66
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Aug 2026 10:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KMu5C8VhDfl2msxsgs2phcrIipOjJsiY8COUGA3/RoE=; b=XwvXYDkamwQpx+
	D1iFAqvNppX7jL/ZN1m3YfHvFoZRyGY4Q6vzOIlkJ8liRJneBDGQD7XqhrUBo4xRQGXChv0UVW17y
	hoGf7pYS3B6KYHUTNShKB7fvZeuEcN1EtSAI6WixxENe+GeyLRSm3QX1Y/FstF9TFauLIeA50sCCq
	TCa8povh7rhe9HTxGa/djLKYqd9P8JBlg1KoF+YPVUunK1ChT7+Fj+WMAlfgkJYoLsz5zmWdePHV2
	X1LuSzB/Vdn6LLYOS3b0w5Hqodng+Ui8ZJz9q+VqHRKv6yzGFcfQtzTOm8biNAwbgwwHltERCQQG/
	G6CqPgqN5ao0/Y143Qxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvuuT-00000005xYz-0pIg;
	Mon, 17 Aug 2026 10:49:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvuuR-00000005xYs-0W0m
	for linux-i3c@lists.infradead.org;
	Mon, 17 Aug 2026 10:49:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2C02D600AE;
	Mon, 17 Aug 2026 10:49:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C7A01F000E9;
	Mon, 17 Aug 2026 10:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786963777;
	bh=t+/DjiAPlr8Sf7NlP/0OtPQR0efDMe+5BTVvC3RVPi8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EINCcgHMP/pl9LpZyxUVYZgWpTGnLUKLdX88DHOkj6HHDXYw7yV/BaFjSsC9m1uju
	 JVJaf1ql7paG/wFQeT4vxhEg51LCjqvcmY3oP3UZlPTcoqNMuC72eNt0g4gAsu1nzk
	 Wc9+rRPPmJgjgQGGVjRMujbzX1FM8jT5wd16N59l/juR8ZWhmY9Si/PS53TaH/wvoN
	 HBidUM7GabdJ+GYZYxfDNCXQUtXxwpgYk847C+MRsjySujgnypi8g1we/PxohkR5Bg
	 pDJxXUm47tJJShE/FiFoGo7mszhkSTZjnJgeOP3RI8aFr/9KVlQno/PYNV/TwWY23A
	 Nb2+Vkax2Fxbg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 3/8] dt-bindings: i3c: Add NXP P3H2x4x i3c-hub
 support
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: linux-i3c@lists.infradead.org, conor+dt@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260817103844.2142802-4-lakshay.piplani@nxp.com>
References: <20260817103844.2142802-1-lakshay.piplani@nxp.com>
 <20260817103844.2142802-4-lakshay.piplani@nxp.com>
Date: Mon, 17 Aug 2026 10:49:37 +0000
Message-Id: <20260817104937.7C7A01F000E9@smtp.kernel.org>
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
MyBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gVGhlIHNjaGVtYSBm
YWlscyB0byByZXN0cmljdCB0aGUgYWxsb3dlZCBwb3J0cyBhbmQgcHJvcGVydGllcyBmb3IgdGhl
IDQtcG9ydCBoYXJkd2FyZSB2YXJpYW50cyAoUDNIMjQ0MC9QM0gyNDQxKSwgYWxsb3dpbmcgaW52
YWxpZCBjb25maWd1cmF0aW9ucy4KLSBbTWVkaXVtXSBUaGUgYHJlZ2AgcHJvcGVydHkgY29uc3Ry
YWludHMgZm9yIGNoaWxkIG5vZGVzIChgaTNjQFswLTddJGAgYW5kIGBzbWJ1c0BbMC03XSRgKSB1
c2UgYW4gaW52YWxpZCBhcnJheS1sZXZlbCBjb25zdHJhaW50IGBpdGVtczogLSBtYXhpbXVtOiA3
YCB3aGljaCBzaWxlbnRseSBieXBhc3NlcyBwb3J0IGluZGV4IHZhbGlkYXRpb24uCi0gW01lZGl1
bV0gVGhlIGh1YiBhY3RzIGFzIGEgcGFyZW50IHRvIGNoaWxkIGJ1cyBub2RlcyBidXQgZG9lcyBu
b3QgbWFuZGF0ZSBgI2FkZHJlc3MtY2VsbHNgIGFuZCBgI3NpemUtY2VsbHNgIGluIGl0cyByZXF1
aXJlZCBsaXN0LgotLQoKLS0tIFBhdGNoIFszXTogW1BBVENIIHYxNSAzLzhdIGR0LWJpbmRpbmdz
OiBpM2M6IEFkZCBOWFAgUDNIMng0eCBpM2MtaHViIHN1cHBvcnQgLS0tCmNvbW1pdCA5NDUwZjAw
YjE2YWNhMjRiYWE0YjcyNTQ1OWMyN2M0YjJhYjJmNThjCkF1dGhvcjogQW1hbiBLdW1hciBQYW5k
ZXkgPGFtYW4ua3VtYXJwYW5kZXlAbnhwLmNvbT4KCmR0LWJpbmRpbmdzOiBpM2M6IEFkZCBOWFAg
UDNIMng0eCBpM2MtaHViIHN1cHBvcnQKClRoaXMgY29tbWl0IGFkZHMgYmluZGluZ3MgZm9yIHRo
ZSBOWFAgUDNIMng0eCAoUDNIMjQ0MC9QM0gyNDQxL1AzSDI4NDAvUDNIMjg0MSkKbXVsdGlwb3J0
IEkzQyBodWIgZmFtaWx5LiBUaGVzZSBkZXZpY2VzIGNvbm5lY3QgdG8gYSBob3N0IHZpYSBJM0Mv
STJDL1NNQnVzCmFuZCBhbGxvdyBjb21tdW5pY2F0aW9uIHdpdGggbXVsdGlwbGUgZG93bnN0cmVh
bSBwZXJpcGhlcmFscy4KCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9pM2MvbnhwLHAzaDI4NDAueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9pM2MvbnhwLHAzaDI4NDAueWFtbAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5k
ZXggMDAwMDAwMDAwMDAwMC4uNmI4NGNjZDhhY2UwYwo+IC0tLSAvZGV2L251bGwKPiArKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTNjL254cCxwM2gyODQwLnlhbWwKWyAu
Li4gXQo+ICtwcm9wZXJ0aWVzOgo+ICsgIGNvbXBhdGlibGU6Cj4gKyAgICBlbnVtOgo+ICsgICAg
ICAtIG54cCxwM2gyNDQwCj4gKyAgICAgIC0gbnhwLHAzaDI0NDEKCltTZXZlcml0eTogTWVkaXVt
XQpTaG91bGQgdGhlcmUgYmUgYW4gYWxsT2YgY29uZGl0aW9uYWwgYmxvY2sgYWRkZWQgdG8gY29u
c3RyYWluIHRoZSBhbGxvd2VkCnBvcnRzIGFuZCBwcm9wZXJ0aWVzIGZvciB0aGUgNC1wb3J0IHZh
cmlhbnRzPwoKVGhlIDQtcG9ydCBoYXJkd2FyZSB2YXJpYW50cyBhcmUgaW50cm9kdWNlZCBoZXJl
IGJ1dCBsYWNrIGNvbmRpdGlvbmFsIGJsb2NrcwpyZXN0cmljdGluZyB0aGVpciBhbGxvd2VkIHBv
cnRzLCB3aGlsZSB0aGUgcGF0dGVyblByb3BlcnRpZXMgbGF0ZXIgaW4gdGhlCnNjaGVtYSB1bmNv
bmRpdGlvbmFsbHkgYWxsb3dzIHVwIHRvIDggcG9ydHMuCgpXaXRob3V0IGFuIGFsbE9mIGJsb2Nr
LCBkZXZpY2UgdHJlZSBjb25maWd1cmF0aW9ucyB0aGF0IGRlc2NyaWJlIG5vbmV4aXN0ZW50CnBv
cnRzIGZvciB0aGUgNC1wb3J0IHZhcmlhbnRzIGNvdWxkIHNpbGVudGx5IHBhc3Mgc2NoZW1hIHZh
bGlkYXRpb24uCgo+ICsgICAgICAtIG54cCxwM2gyODQwCj4gKyAgICAgIC0gbnhwLHAzaDI4NDEK
WyAuLi4gXQo+ICtyZXF1aXJlZDoKPiArICAtIHJlZwoKW1NldmVyaXR5OiBNZWRpdW1dClNob3Vs
ZCAjYWRkcmVzcy1jZWxscyBhbmQgI3NpemUtY2VsbHMgYmUgaW5jbHVkZWQgaW4gdGhpcyByZXF1
aXJlZCBsaXN0PwoKU2luY2UgdGhlIGh1YiBub2RlIGFjdHMgYXMgYSBwYXJlbnQgYnVzIHRvIGNo
aWxkIHRhcmdldCBwb3J0cywgb21pdHRpbmcgdGhlc2UKcHJvcGVydGllcyBhbGxvd3MgZGV2aWNl
IHRyZWVzIHRvIGRlZmluZSBjaGlsZCBub2RlcyB3aXRob3V0IHByb3BlciBhZGRyZXNzCnNpemlu
Zywgd2hpY2ggbWlnaHQgYnlwYXNzIHNjaGVtYSB2YWxpZGF0aW9uIHdoZW4gdGhleSBzaG91bGRu
J3QuCgo+ICsKPiArcGF0dGVyblByb3BlcnRpZXM6Cj4gKyAgIl5pM2NAWzAtN10kIjoKPiArICAg
IHR5cGU6IG9iamVjdAo+ICsgICAgJHJlZjogL3NjaGVtYXMvaTNjL2kzYy55YW1sIwo+ICsgICAg
dW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQo+ICsKPiArICAgIHByb3BlcnRpZXM6Cj4gKyAg
ICAgIHJlZzoKPiArICAgICAgICBkZXNjcmlwdGlvbjoKPiArICAgICAgICAgIFRoZSBJM0MgSFVC
IFRhcmdldCBQb3J0IG51bWJlci4KPiArICAgICAgICBpdGVtczoKPiArICAgICAgICAgIC0gbWF4
aW11bTogNwoKW1NldmVyaXR5OiBNZWRpdW1dCkRvZXMgdGhpcyBjb25zdHJhaW50IGNvcnJlY3Rs
eSB2YWxpZGF0ZSB0aGUgcG9ydCBpbmRleD8KCkJlY2F1c2UgZHQtc2NoZW1hIHBhcnNlcyByZWcg
YXMgYSBtYXRyaXggKGFuIGFycmF5IG9mIGNlbGwgYXJyYXlzKSwgSlNPTgpTY2hlbWEgb25seSBh
cHBsaWVzIG1heGltdW0gdG8gbnVtZXJpYyB0eXBlcyBhbmQgc2lsZW50bHkgaWdub3JlcyB0aGlz
CmNvbnN0cmFpbnQgb24gdGhlIGFycmF5IGVsZW1lbnQuIFRoaXMgY291bGQgYWxsb3cgYW4gb3V0
LW9mLXJhbmdlIHBvcnQgbnVtYmVyCnRvIGJ5cGFzcyBwb3J0IGluZGV4IHZhbGlkYXRpb24uCgpU
byBjb3JyZWN0bHkgdmFsaWRhdGUgdGhlIHNpbmdsZSBjZWxsLCBpdCBtaWdodCBuZWVkIHRvIHVz
ZSBtYXhJdGVtczogMSBhbmQKbmVzdGVkIGl0ZW1zLgoKWyAuLi4gXQo+ICsgICJec21idXNAWzAt
N10kIjoKPiArICAgIHR5cGU6IG9iamVjdAo+ICsgICAgJHJlZjogL3NjaGVtYXMvaTJjL2kyYy1j
b250cm9sbGVyLnlhbWwjCj4gKyAgICB1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlCj4gKwo+
ICsgICAgcHJvcGVydGllczoKPiArICAgICAgcmVnOgo+ICsgICAgICAgIGRlc2NyaXB0aW9uOgo+
ICsgICAgICAgICAgVGhlIEkzQyBIVUIgVGFyZ2V0IFBvcnQgbnVtYmVyLgo+ICsgICAgICAgIGl0
ZW1zOgo+ICsgICAgICAgICAgLSBtYXhpbXVtOiA3CgpbU2V2ZXJpdHk6IE1lZGl1bV0KRG9lcyB0
aGlzIGhhdmUgdGhlIHNhbWUgdmFsaWRhdGlvbiBpc3N1ZSBhcyB0aGUgaTNjIGNoaWxkIG5vZGUg
YWJvdmU/CgpMaWtlIHRoZSBpM2Mgbm9kZSwgdGhpcyBjb25zdHJhaW50IG1pZ2h0IGZhaWwgdG8g
dmFsaWRhdGUgdGhlIHBvcnQgaW5kZXgKYmVjYXVzZSBKU09OIFNjaGVtYSBpZ25vcmVzIG1heGlt
dW0gb24gYXJyYXkgZWxlbWVudHMuCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9z
YXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwODE3MTAzODQ0LjIxNDI4MDItMS1sYWtzaGF5LnBp
cGxhbmlAbnhwLmNvbT9wYXJ0PTMKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkz
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtaTNjCg==
