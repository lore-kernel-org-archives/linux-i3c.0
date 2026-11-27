Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44803606A31C
	for <linux-i3c@archiver.kernel.org>; Fri, 27 Nov 2026 06:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EK/azuhm;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KCdU839c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=v+naHfkiS0FP+9M/G6wVfFtE9qqlTS5YbHqO2RDRSoA=; b=EK/azuhm+ujNb2nAdsCs0dw/4J
	G+aKDd4HE7WRY3P5yawQAS58mIuyjxDE8xuj6pfWrMJfxSoz/EUcyj8RIT0AFQWC+K+4pezgxI8Fe
	M8+/Yl7PKXG6SMj3AqSKCYrgfuGX5ZaMYVlIfxkqFDOGGlwxu+cEZblaS+H6GCeRbcuhJQ9tMZ0Nq
	WYHkc6mT7cb4PuEcbvis9oPt8wiKZWSM4x8UU3B7MqM8mW42/80dkjwptk4MdP5dJFbbG2UG2hOo4
	UAwIEqcz6w9WM74dG+qjGkoeaqDq/zZnSpBmVU6ATMpVMNebYjRUkaDWVxMzL+wPpTCNUiubcpZlN
	5wB8WmDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWpV0-0000000F2mj-3X2c;
	Fri, 27 Nov 2026 06:31:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWpUz-0000000F2mZ-2q9U
	for linux-i3c@lists.infradead.org;
	Fri, 27 Nov 2026 06:31:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2212643EC7;
	Fri, 27 Nov 2026 06:31:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CED871F00893;
	Fri, 27 Nov 2026 06:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795761117;
	bh=bqYg6Zp/JLvmpZJFabvTIag+ijRL/SqJqR0GV9dfwoQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KCdU839cT83ocsmphSj6wWzdQQI2xQBTbZiyiDFubQE8vRPwyKgfoLbcrRHqe3fF7
	 ptoVdT8ArYaB8NgloUSNn4K8VRK/frbmpct5DakIoRXzh2XIvqTzhmmzNoW3QNlFzN
	 iDxixyoReQ3zYVJe55Pzfdi/9aT2pWgjQmjM3cfqJrhgiNdutuP9RyCXIZQjecdauV
	 rTeFlOUqHtEOmdOycqD8OS3kB+Bp8YQlZRxY1zbld/Ul8ftSHE9JMlxjaf5EwJ9Xda
	 DRh5wFUanilCmjg2NrnYq0xLaaIWFvv6Rp9A79HXlN6gO2qwX+d2U35apDXUTIWeBN
	 Ij2nXtmPl6gwA==
Message-ID: <sashiko-outbox-236743@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] i3c: master: mark OF bus child nodes OF_POPULATED to
 avoid legacy I2C rescan
To: "Billy Tsai" <billy_tsai@aspeedtech.com>
Cc: linux-i3c@lists.infradead.org, Frank.Li@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20261127-i3c-master-of-populated-v1-1-29d2a6a5509c@aspeedtech.com>
References: <20261127-i3c-master-of-populated-v1-1-29d2a6a5509c@aspeedtech.com>
Date: Fri, 27 Nov 2026 06:31:56 +0000
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
bm8gbmV3IGlzc3VlcwppbiB0aGlzIHBhdGNoLCBidXQgbm90aWNlZCAxIHJlbGF0ZWQgcHJlLWV4
aXN0aW5nIGlzc3VlIGl0IGRvZXMgbm90CmludHJvZHVjZToKLSBbSGlnaF0gaTNjOiBtYXN0ZXI6
IGR1cGxpY2F0ZSBJMkMgdGFyZ2V0IHJlZ2lzdHJhdGlvbiBpbgogIGkzY19tYXN0ZXJfYWRkX2Fj
cGlfZGV2KCkgWzFdCi0tCgpjb21taXQgOTBhMTI4ZTE3ZWMzMjY1MjE3ZTZkZjEwMzVmNTU1MTli
MTdjMGZjMwpBdXRob3I6IEJpbGx5IFRzYWkgPGJpbGx5X3RzYWlAYXNwZWVkdGVjaC5jb20+Cgpp
M2M6IG1hc3RlcjogbWFyayBPRiBidXMgY2hpbGQgbm9kZXMgT0ZfUE9QVUxBVEVEIHRvIGF2b2lk
IGxlZ2FjeSBJMkMgcmVzY2FuCgpUaGlzIGNvbW1pdCBtYXJrcyBkZXZpY2V0cmVlIGNoaWxkIG5v
ZGVzIG9mIGFuIEkzQyBidXMgYXMgT0ZfUE9QVUxBVEVEIGluCmZ3bm9kZV9wb3B1bGF0ZV9pM2Nf
YnVzKCkgc28gdGhhdCByZWdpc3RlcmluZyBhIHZpcnR1YWwgbGVnYWN5IEkyQyBhZGFwdGVyCnNo
YXJpbmcgdGhlIGJ1cyBvZl9ub2RlIGRvZXMgbm90IHJlLXBhcnNlIG9yIGR1cGxpY2F0ZSB0aGVt
IHZpYQpvZl9pMmNfcmVnaXN0ZXJfZGV2aWNlcygpLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9p
M2MvbWFzdGVyLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIuYwo+IGluZGV4IDAxZTA1YmFkODY2MWUu
LmYwMjVjOWU5YTA0NjYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9pM2MvbWFzdGVyLmMKPiArKysg
Yi9kcml2ZXJzL2kzYy9tYXN0ZXIuYwo+IEBAIC0zMzUzLDE1ICszMzUzLDI1IEBAIHN0YXRpYyBp
bnQgZndub2RlX3BvcHVsYXRlX2kzY19idXMoc3RydWN0IGkzY19tYXN0ZXJfY29udHJvbGxlciAq
bWFzdGVyKQo+ICAJCXJldHVybiAwOwo+ICAKPiAgCWZ3bm9kZV9mb3JfZWFjaF9hdmFpbGFibGVf
Y2hpbGRfbm9kZV9zY29wZWQoZndub2RlLCBjaGlsZCkgewo+IC0JCWlmIChpc19vZl9ub2RlKGNo
aWxkKSkKPiArCQlpZiAoaXNfb2Zfbm9kZShjaGlsZCkpIHsKPiAgCQkJcmV0ID0gaTNjX21hc3Rl
cl9hZGRfb2ZfZGV2KG1hc3RlciwgY2hpbGQpOwo+IC0JCWVsc2UgaWYgKGlzX2FjcGlfZGV2aWNl
X25vZGUoY2hpbGQpKQo+IC0JCQlyZXQgPSBpM2NfbWFzdGVyX2FkZF9hY3BpX2RldihtYXN0ZXIs
IGNoaWxkKTsKPiAtCQllbHNlCj4gLQkJCWNvbnRpbnVlOwo+ICsJCQlpZiAocmV0KQo+ICsJCQkJ
cmV0dXJuIHJldDsKPiAgCj4gLQkJaWYgKHJldCkKPiAtCQkJcmV0dXJuIHJldDsKPiArCQkJLyoK
PiArCQkJICogQ2xhaW0gdGhlIG5vZGUgc28gdGhhdCBpMmNfcmVnaXN0ZXJfYWRhcHRlcigpLAo+
ICsJCQkgKiBjYWxsZWQgbGF0ZXIgZm9yIHRoZSBsZWdhY3kgSTJDIGFkYXB0ZXIgc2hhcmluZwo+
ICsJCQkgKiB0aGlzIHNhbWUgb2Zfbm9kZSwgZG9lcyBub3QgYWxzbyBydW4KPiArCQkJICogb2Zf
aTJjX3JlZ2lzdGVyX2RldmljZXMoKSBvbiBpdDogZXZlcnkgY2hpbGQgaGVyZQo+ICsJCQkgKiBp
cyBhbHJlYWR5IGZ1bGx5IGFjY291bnRlZCBmb3IsIHdoZXRoZXIgaXQgZW5kcyB1cAo+ICsJCQkg
KiBJM0Mgb3IgbGVnYWN5LUkyQyBib2FyZGluZm8uCj4gKwkJCSAqLwo+ICsJCQlvZl9ub2RlX3Nl
dF9mbGFnKHRvX29mX25vZGUoY2hpbGQpLCBPRl9QT1BVTEFURUQpOwo+ICsJCX0gZWxzZSBpZiAo
aXNfYWNwaV9kZXZpY2Vfbm9kZShjaGlsZCkpIHsKPiArCQkJcmV0ID0gaTNjX21hc3Rlcl9hZGRf
YWNwaV9kZXYobWFzdGVyLCBjaGlsZCk7Cj4gKwkJCWlmIChyZXQpCj4gKwkJCQlyZXR1cm4gcmV0
Owo+ICsJCX0KPiAgCX0KCltTZXZlcml0eTogSGlnaF0KVGhpcyBwcm9ibGVtIHdhc24ndCBpbnRy
b2R1Y2VkIGJ5IHRoaXMgcGF0Y2gsIGJ1dCBjYW4KaTNjX21hc3Rlcl9hZGRfYWNwaV9kZXYoKSBy
ZWdpc3RlciBkdXBsaWNhdGUgSTJDIGJvYXJkaW5mbyBhY3Jvc3MgbXVsdGlwbGUKSTNDIGNvbnRy
b2xsZXJzIFsxXT8KCmRyaXZlcnMvaTNjL21hc3Rlci5jOmkzY19tYXN0ZXJfYWRkX2FjcGlfZGV2
KCkgewogICAgLi4uCglpZiAoIWFjcGlfaGFzX21ldGhvZChhZGV2LT5oYW5kbGUsICJfQURSIikp
IHsKCQlyZXQgPSBpM2NfbWFzdGVyX2FkZF9pMmNfYm9hcmRpbmZvKG1hc3RlciwgZndub2RlLCBy
ZWcpOwoJCWlmIChyZXQgPT0gLUVOT0RFVikKCQkJcmV0dXJuIDA7CgoJCXJldHVybiByZXQ7Cgl9
CiAgICAuLi4KfQoKV2hlbiBhbiBJM0MgY29udHJvbGxlciBpcyBwYXJ0IG9mIGFuIE1GRCBzaGFy
aW5nIGEgcGFyZW50IFBDSSBkZXZpY2UncwpBQ1BJIG5vZGUsIGV2ZXJ5IGNvbnRyb2xsZXIgaW5z
dGFuY2UgaXRlcmF0ZXMgb3ZlciB0aGUgc2hhcmVkIEFDUEkgY2hpbGQKbm9kZXMgaW4gZndub2Rl
X3BvcHVsYXRlX2kzY19idXMoKS4gIFVubGlrZSBJM0MgdGFyZ2V0cywgQUNQSSBjaGlsZCBub2Rl
cwpmb3IgSTJDIGRldmljZXMgaGF2ZSBubyBfQURSIG1ldGhvZCwgc28gdGhleSBieXBhc3MgY29u
dHJvbGxlciBmaWx0ZXJpbmcKYW5kIGFyZSBhZGRlZCB0byBtYXN0ZXItPmJvYXJkaW5mby5pMmMg
b24gZXZlcnkgY29udHJvbGxlciBpbnN0YW5jZSwKY2F1c2luZyBtdWx0aXBsZSBsb2dpY2FsIEkz
QyBidXNlcyB0byBpbnN0YW50aWF0ZSBhbmQgcHJvYmUgdGhlIHNhbWUKcGh5c2ljYWwgSTJDIHRh
cmdldC4KClsxXSBodHRwczovL3Nhc2hpa28uZGV2LyMvYnVnL2xpbnV4LWQ2NGIxNjFiLTA5ZWYt
NGY1Zi05YmUyLTJmNDY5MTUyYWJlZQoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8v
c2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MTEyNy1pM2MtbWFzdGVyLW9mLXBvcHVsYXRlZC12
MS0xLTI5ZDJhNmE1NTA5Y0Bhc3BlZWR0ZWNoLmNvbT9wYXJ0PTEKCi0tIApsaW51eC1pM2MgbWFp
bGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
