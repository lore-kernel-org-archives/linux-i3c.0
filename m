Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15AACC43458
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Jul 2026 13:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bxiyqr/gsFzLHjTx272w+W2f1Gp7pPNmKtB+dhLITJc=; b=F3wyiMpLu1zpfF
	3fze5HUSq3MaH90WZEPUCMV1n5eSeXVQ3tFHmyF85Pm/MyFsJHEq+bvIbsViV/8zL0/2fldWVeiry
	Vx1eyRKyLZXQfTgB71mxAA5JQDDQZioTACHfsDw59Ltvl6ctNXWu+k7Ul36zD+yzOiNmq86vxBRJs
	uOjuB/+9Bf86z7ghYrQl5oYt7lwyw0bij/r90W83exNypH19cAcKUCl8hDXytxEgLleoEt452ABaT
	m1/T0pY+C0hbHV0rQmaUvlyyl7xxsip1xlOUull3WCM1qnhTeKsdpvhKLA5Nn9yQd7oOdmaLsDEaC
	30tkPn3AczNfodDSf7Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGUA-00000009LHI-3R0o;
	Mon, 13 Jul 2026 13:14:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGU9-00000009LH5-1vzr
	for linux-i3c@lists.infradead.org;
	Mon, 13 Jul 2026 13:14:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 951D46004E;
	Mon, 13 Jul 2026 13:14:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE9F21F000E9;
	Mon, 13 Jul 2026 13:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783948452;
	bh=6e7Kkn5gF1VSd5dds8wTQS6gyoWZPJWnc1nFvgg6VLc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dPMioyZe6zO7u9ZUyA+GJYL1+vwg1cTErPEgTNkhj23L7pFrTnPbp6smEZDyf0JLY
	 KdRNIMNlBU3i4tDnJi4+hUFYkMRL9akqo24K0Ly3j8F0CEgbI9vIO1YkYgQ2XhKNTn
	 3WUOZ+L8r8fbqARyyze+bmMBUKuvmZALR+l8hFU3qsOMyxZpoHXmWSTtYPMj9LW5A3
	 mdlQcJTta7t1GnH9IEkZ+ppjZ4WylzMhIzlEczPqVgUvInAK9ympWGoSOp0I0kPFMV
	 C3Adh+I94FjaCHMbLdWL4vfePP91FpoX27YKsWnoH8bd3z+ECmTV/9r4qRW7gpg9Ij
	 fKSOQK3k3D6gw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 03/17] i3c: renesas: Follow the reset deassert order
 used in probe
To: "Claudiu Beznea" <claudiu.beznea@tuxon.dev>
Cc: linux-i3c@lists.infradead.org, wsa+renesas@sang-engineering.com, Frank.Li@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260713130545.568657-4-claudiu.beznea+renesas@tuxon.dev>
References: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
 <20260713130545.568657-4-claudiu.beznea+renesas@tuxon.dev>
Date: Mon, 13 Jul 2026 13:14:11 +0000
Message-Id: <20260713131411.EE9F21F000E9@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpQcmUtZXhpc3RpbmcgaXNzdWVzOgot
IFtIaWdoXSBUaGUgcmVzdW1lIHNlcXVlbmNlIGRlYXNzZXJ0cyByZXNldHMgYmVmb3JlIGVuYWJs
aW5nIGNsb2Nrcywgd2hpY2ggY29udHJhZGljdHMgdGhlIHByb2JlIHNlcXVlbmNlIGFuZCB2aW9s
YXRlcyBzdGFuZGFyZCBoYXJkd2FyZSBpbml0aWFsaXphdGlvbiBvcmRlcmluZy4KLS0KCi0tLSBQ
YXRjaCBbM106IFtQQVRDSCB2NSAwMy8xN10gaTNjOiByZW5lc2FzOiBGb2xsb3cgdGhlIHJlc2V0
IGRlYXNzZXJ0IG9yZGVyIHVzZWQgaW4gcHJvYmUgLS0tCmNvbW1pdCAxZjZhMDM1MDkwZDYyMDdj
M2JjMTRjNTViMTUxM2Q4ZDNjZjBhZmNkCkF1dGhvcjogQ2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUu
YmV6bmVhLnVqQGJwLnJlbmVzYXMuY29tPgoKaTNjOiByZW5lc2FzOiBGb2xsb3cgdGhlIHJlc2V0
IGRlYXNzZXJ0IG9yZGVyIHVzZWQgaW4gcHJvYmUKClRoaXMgY29tbWl0IHJlb3JkZXJzIHRoZSBk
ZWFzc2VydGlvbiBvZiB0aGUgcHJlc2V0biBhbmQgdHJlc2V0biByZXNldHMKZHVyaW5nIHJlc3Vt
ZSB0byBtYXRjaCB0aGUgb3JkZXIgdXNlZCBpbiB0aGUgcHJvYmUgcGF0aC4gVGhpcyBwcmV2ZW50
cwpwb3RlbnRpYWwgZmFpbHVyZXMgY2F1c2VkIGJ5IG9yZGVyaW5nIGRpZmZlcmVuY2VzLgoKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyL3JlbmVzYXMtaTNjLmMgYi9kcml2ZXJzL2kz
Yy9tYXN0ZXIvcmVuZXNhcy1pM2MuYwo+IGluZGV4IGNkOTkyODY0OWM3ZjcuLmNjZjU1YWZjZGVk
YzcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9pM2MvbWFzdGVyL3JlbmVzYXMtaTNjLmMKPiArKysg
Yi9kcml2ZXJzL2kzYy9tYXN0ZXIvcmVuZXNhcy1pM2MuYwoKWyAuLi4gXQoKPiBAQCAtMTQ1NSwx
NyArMTQ1NSwxNyBAQCBzdGF0aWMgaW50IHJlbmVzYXNfaTNjX3Jlc3VtZV9ub2lycShzdHJ1Y3Qg
ZGV2aWNlICpkZXYpCj4gIAlzdHJ1Y3QgcmVuZXNhc19pM2MgKmkzYyA9IGRldl9nZXRfZHJ2ZGF0
YShkZXYpOwo+ICAJaW50IGksIHJldDsKPiAgCj4gLQlyZXQgPSByZXNldF9jb250cm9sX2RlYXNz
ZXJ0KGkzYy0+cHJlc2V0bik7Cj4gKwlyZXQgPSByZXNldF9jb250cm9sX2RlYXNzZXJ0KGkzYy0+
dHJlc2V0bik7Cj4gIAlpZiAocmV0KQo+ICAJCXJldHVybiByZXQ7Cj4gIAo+IC0JcmV0ID0gcmVz
ZXRfY29udHJvbF9kZWFzc2VydChpM2MtPnRyZXNldG4pOwo+ICsJcmV0ID0gcmVzZXRfY29udHJv
bF9kZWFzc2VydChpM2MtPnByZXNldG4pOwo+ICAJaWYgKHJldCkKPiAtCQlnb3RvIGVycl9wcmVz
ZXRuOwo+ICsJCWdvdG8gZXJyX3RyZXNldG47Cj4gIAo+ICAJcmV0ID0gY2xrX2J1bGtfZW5hYmxl
KGkzYy0+bnVtX2Nsa3MsIGkzYy0+Y2xrcyk7Cj4gIAlpZiAocmV0KQo+IC0JCWdvdG8gZXJyX3Ry
ZXNldG47Cj4gKwkJZ290byBlcnJfcHJlc2V0bjsKCltTZXZlcml0eTogSGlnaF0KVGhpcyBpcyBh
IHByZS1leGlzdGluZyBpc3N1ZSwgYnV0IGlzIGl0IHNhZmUgdG8gZGVhc3NlcnQgdGhlIHN5bmNo
cm9ub3VzIApyZXNldHMgYmVmb3JlIHRoZSBjbG9ja3MgYXJlIGVuYWJsZWQgaW4gcmVuZXNhc19p
M2NfcmVzdW1lX25vaXJxKCk/CgpEZWFzc2VydGluZyBzeW5jaHJvbm91cyByZXNldHMgd2hpbGUg
dGhlIHBlcmlwaGVyYWwncyBjbG9jayBpcyBkaXNhYmxlZCBjYW4KcHJldmVudCB0aGUgaW50ZXJu
YWwgc3RhdGUgbWFjaGluZSBmcm9tIGNvcnJlY3RseSBleGl0aW5nIHRoZSByZXNldCBzdGF0ZS4K
ClN1YnNlcXVlbnQgcmVnaXN0ZXIgYWNjZXNzZXMgdG8gYSBwZXJpcGhlcmFsIHRoYXQgaGFzIGZh
aWxlZCB0byBpbml0aWFsaXplIApvciBpcyB1bmNsb2NrZWQgY2FuIGNhdXNlIGFuIGFzeW5jaHJv
bm91cyBleHRlcm5hbCBhYm9ydCAoc3lzdGVtIGhhbmcpIG9yIApsZWF2ZSB0aGUgSTNDIGJ1cyBu
b24tZnVuY3Rpb25hbC4KCkNvdWxkIHRoZSBjbG9jayBlbmFibGVtZW50IHN0ZXAgYmUgbW92ZWQg
YmVmb3JlIHRoZSByZXNldCBkZWFzc2VydGlvbiB0bwpmdWxseSBtaXJyb3IgdGhlIGNvcnJlY3Qg
aW5pdGlhbGl6YXRpb24gb3JkZXI/CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9z
YXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNzEzMTMwNTQ1LjU2ODY1Ny0xLWNsYXVkaXUuYmV6
bmVhK3JlbmVzYXNAdHV4b24uZGV2P3BhcnQ9MwoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QK
bGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
