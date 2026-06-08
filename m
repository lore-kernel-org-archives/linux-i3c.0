Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED98BCD6E79
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Jun 2026 20:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/TBfNAQ62GvBsfJyEpJKVfFQ7ivc2+fCTHiNAwORg00=; b=GWinHOD+4ChhGJ
	dPFbbeTu4M9aEDkJzaUKWRjHPuYQGOFu2wgcDa/ucxPdxwaFrxxRX87ifkxxMDXlb6tfh69DUcjOI
	FcqFel4gJ4bsylcE05HAdTAOsOpj+N6/ne18nzUmO5ZrHWzdqg6XwI0c0YxNfIH58S8e1Vqmw45s/
	Iro0cdyUbU/kgk8yMn1j0zowquYbPA9k3LYJR5Whd0CnZDcNqAy3XfHePkGfPLfn7vq5VkJetwx/I
	jh+/BCehZqFhxsXMZNF6t+yuqapvFHcqwvbOvz4XLQQUbzSaxT+JcEly949vjUpl5FwQ9AdoEO4bp
	uXq8jnbY4tdZA6ieo6Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWgbF-00000004MUC-2YPx;
	Mon, 08 Jun 2026 20:29:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWgbD-00000004MU2-3dJ4
	for linux-i3c@lists.infradead.org;
	Mon, 08 Jun 2026 20:29:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9DDDE43EDF;
	Mon,  8 Jun 2026 20:29:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51BA51F00893;
	Mon,  8 Jun 2026 20:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780950571;
	bh=jAOYehnfp9hufCizkWZAUqvjQDia8qZvejpTR0I5CqM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eLQZ6yRZzSsXn30Xmn31CJE/WU1SeklP9bo+zsDsEedgiR+ckfwkeFjM6GZb83b/l
	 QfNyBX/veGu7OEiXfwk0MyzfdANzAkCFvj6kMMxyfjum0mccH5zgB/Tqu1RvfABRLG
	 9cGdVKYsk9vecp/hFLHhet+M7a/CH6OR6Vr+1eRil1n2Ky3ZwUX/QtqdNfqqWfiJXs
	 iUBZCTQh/EgCWSIGVF5bYdLU+2+5geK5pyJBMaaquaqFEsq8GsZdP2tW6tbHCxjDp6
	 Mes2D8tkyE2w2bCBkZDj220M6CX4pp7LTrX1rU/uXZg3O8mPtmA8g0oQO2FnE05xwR
	 1hnn8kEaGUmXQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 07/17] i3c: renesas: Do not attach devices if xfer
 failed
To: "Claudiu Beznea" <claudiu.beznea@kernel.org>
Cc: linux-i3c@lists.infradead.org, wsa+renesas@sang-engineering.com, Frank.Li@kernel.org
In-Reply-To: <20260608201543.804902-8-claudiu.beznea@kernel.org>
References: <20260608201543.804902-8-claudiu.beznea@kernel.org>
Date: Mon, 08 Jun 2026 20:29:31 +0000
Message-Id: <20260608202931.51BA51F00893@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIFRoZSBwYXRjaCBwcmV2
ZW50cyBkaXNjb3Zlcnkgb2YgSTNDIGRldmljZXMgYnkgdW5jb25kaXRpb25hbGx5IGRpc2NhcmRp
bmcgc3VjY2Vzc2Z1bGx5IGF0dGFjaGVkIGRldmljZXMgd2hlbiBhIERBQSB0cmFuc2ZlciB0ZXJt
aW5hdGVzIHdpdGggYW4gZXhwZWN0ZWQgQWRkcmVzcyBOQUNLLCBsZWFkaW5nIHRvIHBlcm1hbmVu
dGx5IG9ycGhhbmVkIGRldmljZXMgYW5kIGFkZHJlc3MgY29sbGlzaW9ucy4KLS0KCmNvbW1pdCAw
M2VjYzk0NmU3MmYzYWVjYmFjMGNhZDg1Njc2ZjgxOGQyNTNjZDJjCkF1dGhvcjogQ2xhdWRpdSBC
ZXpuZWEgPGNsYXVkaXUuYmV6bmVhLnVqQGJwLnJlbmVzYXMuY29tPgoKaTNjOiByZW5lc2FzOiBE
byBub3QgYXR0YWNoIGRldmljZXMgaWYgeGZlciBmYWlsZWQKClRoaXMgY29tbWl0IGF0dGVtcHRz
IHRvIGZpeCBhIGNyYXNoIGR1cmluZyBkZXZpY2UgYXR0YWNobWVudCB3aGVuIGEgdHJhbnNmZXIK
ZmFpbHMuIEl0IG1vZGlmaWVzIHRoZSBsb2dpYyB0byB6ZXJvIG91dCB0aGUgbmV3IGRldmljZXMg
bWFzayBpZiB0aGUKdHJhbnNmZXIgcmVwb3J0cyBhbiBlcnJvciwgYnlwYXNzaW5nIHRoZSBhdHRh
Y2htZW50IGxvb3AgZm9yIHRob3NlIGRldmljZXMuCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kz
Yy9tYXN0ZXIvcmVuZXNhcy1pM2MuYyBiL2RyaXZlcnMvaTNjL21hc3Rlci9yZW5lc2FzLWkzYy5j
Cj4gaW5kZXggYzQ3NWQzMGE4NGM3Yy4uZjk2ODQ4MDIyYzQ1ZCAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2kzYy9tYXN0ZXIvcmVuZXNhcy1pM2MuYwo+ICsrKyBiL2RyaXZlcnMvaTNjL21hc3Rlci9y
ZW5lc2FzLWkzYy5jClsgLi4uIF0KPiBAQCAtNzgwLDEwICs3ODAsMTUgQEAgc3RhdGljIGludCBy
ZW5lc2FzX2kzY19kYWEoc3RydWN0IGkzY19tYXN0ZXJfY29udHJvbGxlciAqbSkKPiAgCj4gIAly
ZW5lc2FzX2kzY193YWl0X3hmZXIoaTNjLCB4ZmVyKTsKPiAgCj4gLQluZXdkZXZzID0gR0VOTUFT
SyhpM2MtPm1heGRldnMgLSBjbWQtPnJ4X2NvdW50IC0gMSwgZmlyc3RfaTNjX3Bvcyk7Cj4gLQkv
KiBSZS1hdHRhY2ggYWxsIHRoZSBJM0MgZGV2aWNlcyBvbiByZXN1bWUuICovCj4gLQlpZiAoIWkz
Yy0+cmVzdW1pbmcpCj4gLQkJbmV3ZGV2cyAmPSB+b2xkZGV2czsKPiArCS8qIFNraXAgYXR0YWNo
aW5nIGlmIHRoZXJlIGFyZSBmYWlsdXJlcyBvbiB0aGUgeGZlci4gKi8KPiArCWlmICh4ZmVyLT5y
ZXQpIHsKPiArCQluZXdkZXZzID0gMDsKPiArCX0gZWxzZSB7CgpbU2V2ZXJpdHk6IEhpZ2hdCkRv
ZXMgdGhpcyBpbmNvcnJlY3RseSBkaXNjYXJkIHN1Y2Nlc3NmdWxseSBhdHRhY2hlZCBkZXZpY2Vz
IGR1cmluZyBhIHBhcnRpYWwKZGV2aWNlIGRpc2NvdmVyeT8KCkR1cmluZyB0aGUgRU5UREFBIHBy
b2NlZHVyZSwgdGhlIGNvbnRyb2xsZXIgYXNzaWducyBhZGRyZXNzZXMgc2VxdWVudGlhbGx5LgpX
aGVuIHRoZXJlIGFyZSBmZXdlciB1bmFzc2lnbmVkIGRldmljZXMgb24gdGhlIGJ1cyB0aGFuIHRo
ZSByZXF1ZXN0ZWQgc2xvdHMsCnRoZSBjb250cm9sbGVyIGV2ZW50dWFsbHkgcmVjZWl2ZXMgYW4g
YWRkcmVzcyBOQUNLLCB3aGljaCBpcyB0aGUgc3RhbmRhcmQKdGVybWluYXRpb24gY29uZGl0aW9u
IGZvciB0aGUgbG9vcC4KClRoaXMgZXhwZWN0ZWQgTkFDSyB0cmFuc2xhdGVzIHRvIGEgbm9uLXpl
cm8geGZlci0+cmV0LCBidXQgY21kLT5yeF9jb3VudApzdGlsbCBob2xkcyB0aGUgdmFsaWQgY291
bnQgb2YgdW5hc3NpZ25lZCBzbG90cy4gSWYgdGhyZWUgZGV2aWNlcyBhdHRhY2gKc3VjY2Vzc2Z1
bGx5IGFuZCB0aGUgZm91cnRoIGF0dGVtcHQgTkFDS3MsIHhmZXItPnJldCBpcyBzZXQsIGFuZCB0
aGlzCmxvZ2ljIHdpbGwgc2V0IG5ld2RldnMgdG8gMC4gCgpDb3VsZCB0aGlzIHJlc3VsdCBpbiBk
aXNjYXJkaW5nIHRoZSB0aHJlZSBzdWNjZXNzZnVsbHkgYXR0YWNoZWQgZGV2aWNlcyBhbmQKbGVh
dmluZyB0aGVtIG9ycGhhbmVkIG9uIHRoZSBidXMgd2l0aCBhY3RpdmUgZHluYW1pYyBhZGRyZXNz
ZXMsIGJyZWFraW5nCmRpc2NvdmVyeSBmb3IgYW55IGJ1cyB0aGF0IGlzIG5vdCBmdWxseSBwb3B1
bGF0ZWQ/Cgo+ICsJCW5ld2RldnMgPSBHRU5NQVNLKGkzYy0+bWF4ZGV2cyAtIGNtZC0+cnhfY291
bnQgLSAxLCBmaXJzdF9pM2NfcG9zKTsKPiArCQkvKiBSZS1hdHRhY2ggYWxsIHRoZSBJM0MgZGV2
aWNlcyBvbiByZXN1bWUuICovCj4gKwkJaWYgKCFpM2MtPnJlc3VtaW5nKQo+ICsJCQluZXdkZXZz
ICY9IH5vbGRkZXZzOwo+ICsJfQo+ICAKPiAgCWZvciAocG9zID0gMDsgcG9zIDwgaTNjLT5tYXhk
ZXZzOyBwb3MrKykgewo+ICAJCWlmICghKG5ld2RldnMgJiBCSVQocG9zKSkpCgotLSAKU2FzaGlr
byBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNjA4MjAx
NTQzLjgwNDkwMi0xLWNsYXVkaXUuYmV6bmVhQGtlcm5lbC5vcmc/cGFydD03CgotLSAKbGludXgt
aTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
