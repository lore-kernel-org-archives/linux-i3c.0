Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD11606A323
	for <linux-i3c@archiver.kernel.org>; Thu, 12 Nov 2026 08:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mOOOAX2x;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ko4eOrSr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9PzgIMg3zpcOHeyPoq+sg5tvGg9e1gE6josfR9kAwQ8=; b=mOOOAX2xh2MynL7/3glLjAQaBd
	6WtyrmkT5+mZu6QFleaedz/yvKPfzvZRseQ2v2dg70IxYeEbqFSLIG7t6Z3yJzGqTyfw/UBIS805z
	yUB+88oIpAkpdWoFapSaqtvZdi8EhRpOeo/ig9FIg6nui+ImnRZif78iuOvoeTIXqfkXQnz3PrT2D
	trpjX2r5RZuXKD40j3p3v8bP5Dx4+w+w8q2hthQ5V5qX5N/IyzQjbMKtfFzOZQC0VG24RzJ8bgEiY
	f5LKFEPRu8iNCX+Ixo3Zol1vGCcNZVqVKACVH8O2dzXjehdL0Qqf2B/fu2d6F+A6UtOPjvzuPilmY
	BlZX9QIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQTf-00000009EIz-2N7d;
	Thu, 12 Nov 2026 08:48:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQTd-00000009EIU-3bvQ
	for linux-i3c@lists.infradead.org;
	Thu, 12 Nov 2026 08:48:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 70FE942DB4;
	Thu, 12 Nov 2026 08:48:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 140E81F00A05;
	Thu, 12 Nov 2026 08:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794473293;
	bh=lIHtoQaDUY6TW9JjK12ysQCfRFXaVT+XP6NPeYTS4p8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ko4eOrSr5o5j4r/DmXo2o3teokwZF+d6wPU8lfwzrm4g9hl1ZKMXM+5S0ttb+kMsJ
	 aDV3jWIsFIBZztR6q97mdB5FjC3f/E29AAkKSHwv1CatcT/X75sLajUEOcCn1EP+7k
	 YlTDOWVswP4R3B4yL2Y48ktXsXehgUcikso7Pptqz1x5k8Ecz0vrHh1V04/MpQVvM0
	 VVi3mtglRAoSVFYs850RZG2BsxnBK7NEtLpZPYh7zVO3khjCAZLY1l5rAj0/rv0fP7
	 XSm9YzZVYBTWgLcKUyrvl7x0+fuL+dksChuL5S6/c91DISon8oPWC9tY72Z11qVFbL
	 nk/8u11lETBzw==
Message-ID: <sashiko-outbox-210785@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] i3c: dw: Prevent premature transfer completion on IBI
To: rui05.wang <wr574332525@163.com>
Cc: linux-i3c@lists.infradead.org, Frank.Li@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20261112084056.1147-1-wr574332525@163.com>
References: <20261112084056.1147-1-wr574332525@163.com>
Date: Thu, 12 Nov 2026 08:48:12 +0000
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIGkzYzogZHc6IGludmFsaWQg
U2lnbmVkLW9mZi1ieSB0cmFpbGVyIHVzaW5nIGhhbmRsZSBydWkwNS53YW5nCkl0IGFsc28gbm90
aWNlZCAxIHJlbGF0ZWQgcHJlLWV4aXN0aW5nIGlzc3VlIHRoaXMgcGF0Y2ggZG9lcyBub3QKaW50
cm9kdWNlOgotIFtIaWdoXSBpM2M6IGR3LWkzYy1tYXN0ZXI6IHF1ZXVlIHN0YWxsIGluCiAgZHdf
aTNjX21hc3Rlcl9kZXF1ZXVlX3hmZXJfbG9ja2VkKCkgWzFdCi0tCgpjb21taXQgYTkxMDE5YjQ2
OGVkNjZlZWM3NTE2MDI0OGJlZTkzZTZkMDNiZmU4MwpBdXRob3I6IHJ1aTA1LndhbmcgPHdyNTc0
MzMyNTI1QDE2My5jb20+Cgo+IGkzYzogZHc6IFByZXZlbnQgcHJlbWF0dXJlIHRyYW5zZmVyIGNv
bXBsZXRpb24gb24gSUJJCj4KPiBBbiBJQkkgdGhyZXNob2xkIGludGVycnVwdCBjYW4gYXJyaXZl
IHdoaWxlIGEgdHJhbnNmZXIgaXMgcGVuZGluZyBhbmQKPiBiZWZvcmUgaXRzIGNvbW1hbmQgcmVz
cG9uc2VzIGFyZSByZWFkeS4gVGhlIElSUSBoYW5kbGVyIGNhbGxzCj4gZHdfaTNjX21hc3Rlcl9l
bmRfeGZlcl9sb2NrZWQoKSBldmVuIGZvciBhbiBJQkktb25seSBpbnRlcnJ1cHQuIElmIHRoZQo+
IHJlc3BvbnNlIHF1ZXVlIGlzIGVtcHR5LCB0aGUgZnVuY3Rpb24gY29tcGxldGVzIHRoZSB0cmFu
c2ZlciB3aXRoIGEKPiByZXR1cm4gdmFsdWUgb2YgemVyby4gTGF0ZXIgcmVzcG9uc2VzIGNhbiBy
ZW1haW4gdW5jb25zdW1lZCBhbmQga2VlcCB0aGUKPiByZXNwb25zZS1yZWFkeSBpbnRlcnJ1cHQg
YXNzZXJ0ZWQuCj4KPiBPbmx5IGNhbGwgdGhlIHRyYW5zZmVyIGNvbXBsZXRpb24gaGFuZGxlciB3
aGVuIElOVFJfTUFTVEVSX01BU0sKPiBpbmRpY2F0ZXMgdGhhdCByZXNwb25zZXMgYXJlIHJlYWR5
IG9yIGEgdHJhbnNmZXIgZXJyb3IgaGFzIG9jY3VycmVkLgo+IEFuIElCSS1vbmx5IGludGVycnVw
dCBsZWF2ZXMgdGhlIHRyYW5zZmVyIHBlbmRpbmcuCj4KPiBUaGUgZml4IHdhcyB0ZXN0ZWQgc3Vj
Y2Vzc2Z1bGx5IG9uIEZQR0EgaGFyZHdhcmUuCj4KPiBGaXhlczogZTM4OWIxZDcyYTYyNCAoImkz
YzogZHc6IEFkZCBzdXBwb3J0IGZvciBpbi1iYW5kIGludGVycnVwdHMiKQo+IFNpZ25lZC1vZmYt
Ynk6IHJ1aTA1LndhbmcgPHdyNTc0MzMyNTI1QDE2My5jb20+CgpbU2V2ZXJpdHk6IEhpZ2hdClRo
ZSBBdXRob3IgaGVhZGVyIGFuZCBTaWduZWQtb2ZmLWJ5IHRyYWlsZXIgdXNlIGFuIGFjY291bnQg
aGFuZGxlCihydWkwNS53YW5nKSByYXRoZXIgdGhhbiBhIHJlYWwgaHVtYW4gbmFtZSwgd2hpY2gg
ZG9lcyBub3QgbWVldCB0aGUKRGV2ZWxvcGVyJ3MgQ2VydGlmaWNhdGUgb2YgT3JpZ2luIHJlcXVp
cmVtZW50cyBpbgpEb2N1bWVudGF0aW9uL3Byb2Nlc3Mvc3VibWl0dGluZy1wYXRjaGVzLnJzdC4K
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci9kdy1pM2MtbWFzdGVyLmMgYi9kcml2
ZXJzL2kzYy9tYXN0ZXIvZHctaTNjLW1hc3Rlci5jCj4gaW5kZXggMzRhYThmOGUxYTBhMi4uMTk3
MzVlYzNkYjA0MiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIvZHctaTNjLW1hc3Rl
ci5jCj4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyL2R3LWkzYy1tYXN0ZXIuYwo+IEBAIC0xNTI3
LDcgKzE1MjcsOCBAQCBzdGF0aWMgaXJxcmV0dXJuX3QgZHdfaTNjX21hc3Rlcl9pcnFfaGFuZGxl
cihpbnQgaXJxLCB2b2lkICpkZXZfaWQpCj4gIAl9Cj4gIAo+ICAJc3Bpbl9sb2NrKCZtYXN0ZXIt
PnhmZXJxdWV1ZS5sb2NrKTsKPiAtCWR3X2kzY19tYXN0ZXJfZW5kX3hmZXJfbG9ja2VkKG1hc3Rl
ciwgc3RhdHVzKTsKPiArCWlmIChzdGF0dXMgJiBJTlRSX01BU1RFUl9NQVNLKQo+ICsJCWR3X2kz
Y19tYXN0ZXJfZW5kX3hmZXJfbG9ja2VkKG1hc3Rlciwgc3RhdHVzKTsKPiAgCWlmIChzdGF0dXMg
JiBJTlRSX1RSQU5TRkVSX0VSUl9TVEFUKQo+ICAJCXdyaXRlbChJTlRSX1RSQU5TRkVSX0VSUl9T
VEFULCBtYXN0ZXItPnJlZ3MgKyBJTlRSX1NUQVRVUyk7Cj4gIAlzcGluX3VubG9jaygmbWFzdGVy
LT54ZmVycXVldWUubG9jayk7CgpbU2V2ZXJpdHk6IEhpZ2hdClRoaXMgcHJvYmxlbSB3YXNuJ3Qg
aW50cm9kdWNlZCBieSB0aGlzIHBhdGNoLCBidXQgY2FuCmR3X2kzY19tYXN0ZXJfZGVxdWV1ZV94
ZmVyX2xvY2tlZCgpIHN0YWxsIG1hc3Rlci0+eGZlcnF1ZXVlLmxpc3Qgd2hlbiBhCnRyYW5zZmVy
IHRpbWVzIG91dCBbMV0/Cgpkcml2ZXJzL2kzYy9tYXN0ZXIvZHctaTNjLW1hc3Rlci5jOmR3X2kz
Y19tYXN0ZXJfZGVxdWV1ZV94ZmVyX2xvY2tlZCgpIHsKCWlmIChtYXN0ZXItPnhmZXJxdWV1ZS5j
dXIgPT0geGZlcikgewoJCXUzMiBzdGF0dXM7CgoJCW1hc3Rlci0+eGZlcnF1ZXVlLmN1ciA9IE5V
TEw7CgoJCXdyaXRlbChSRVNFVF9DVFJMX1JYX0ZJRk8gfCBSRVNFVF9DVFJMX1RYX0ZJRk8gfAoJ
CSAgICAgICBSRVNFVF9DVFJMX1JFU1BfUVVFVUUgfCBSRVNFVF9DVFJMX0NNRF9RVUVVRSwKCQkg
ICAgICAgbWFzdGVyLT5yZWdzICsgUkVTRVRfQ1RSTCk7CgoJCXJlYWRsX3BvbGxfdGltZW91dF9h
dG9taWMobWFzdGVyLT5yZWdzICsgUkVTRVRfQ1RSTCwgc3RhdHVzLAoJCQkJCSAgIXN0YXR1cywg
MTAsIDEwMDAwMDApOwoJfSBlbHNlIHsKCQlsaXN0X2RlbF9pbml0KCZ4ZmVyLT5ub2RlKTsKCX0K
fQoKV2hlbiB0aGUgYWN0aXZlIHRyYW5zZmVyIHRpbWVzIG91dCwgZHdfaTNjX21hc3Rlcl9kZXF1
ZXVlX3hmZXJfbG9ja2VkKCkKcmVzZXRzIHRoZSBoYXJkd2FyZSBGSUZPcyBhbmQgc2V0cyBtYXN0
ZXItPnhmZXJxdWV1ZS5jdXIgdG8gTlVMTCB3aXRob3V0CnBvcHBpbmcgYW5kIHN0YXJ0aW5nIHRo
ZSBuZXh0IHRyYW5zZmVyIGZyb20gbWFzdGVyLT54ZmVycXVldWUubGlzdC4gIEFueQp0cmFuc2Zl
cnMgYWxyZWFkeSBxdWV1ZWQgaW4gbWFzdGVyLT54ZmVycXVldWUubGlzdCByZW1haW4gc3RyYW5k
ZWQsIGFuZCBhCmxhdGVyIGR3X2kzY19tYXN0ZXJfZW5xdWV1ZV94ZmVyKCkgY2FsbCBzZWVzIG1h
c3Rlci0+eGZlcnF1ZXVlLmN1ciA9PSBOVUxMCmFuZCBzdGFydHMgdGhlIG5ldyB0cmFuc2ZlciBp
bW1lZGlhdGVseSBhaGVhZCBvZiB0aGVtLgoKWzFdIGh0dHBzOi8vc2FzaGlrby5kZXYvIy9idWcv
bGludXgtMTQyODlmZWUtYzU5My00YjZmLWE2MTItZDNkZjcyOGU1ZGM3CgotLSAKU2FzaGlrbyBB
SSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYxMTEyMDg0MDU2
LjExNDctMS13cjU3NDMzMjUyNUAxNjMuY29tP3BhcnQ9MQoKLS0gCmxpbnV4LWkzYyBtYWlsaW5n
IGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
