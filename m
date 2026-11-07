Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202B0606A326
	for <linux-i3c@archiver.kernel.org>; Sat,  7 Nov 2026 11:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EkOeerwn;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QtOGy3ih
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XzvIxhBfJAYyX69pr2jc0/aoo1hfhWWKvHKOWMpaIjU=; b=EkOeerwnfWsDhIMRhiutNoJVTo
	Otro0D6aYUhoYi5AKJysI/xIo/wjrWD2nQTzWWz8gVk5odyoxM42hZf6vHoqUuHw+jn/ucX5l62x0
	Kx6I0M0kw13igF86hHLQpKMQKw4U7N/qAg2bdDt24NXXhAK/Hk6+JQwY//cgFyJgNqQLBfGingQrt
	OiSlWAxk8FkFP4fC4usmq/NQ/da5maWxvk/PfJoww3qB40gzb3+J4mjksBx65crIWfzpoizX0yepL
	KR9LOrchq52eyH2GAg65ncVbL5LXWtbMXfAWJuRTe2aDZNyBEGti20ns9GgGiosradinvpbCzhNFe
	5Bct45HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPeL6-0000000Eb62-3VnI;
	Sat, 07 Nov 2026 11:12:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPeL5-0000000Eb5w-3sEw
	for linux-i3c@lists.infradead.org;
	Sat, 07 Nov 2026 11:12:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 88751437CC;
	Sat,  7 Nov 2026 11:12:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 333AD1F008A1;
	Sat,  7 Nov 2026 11:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794049923;
	bh=Sw35vxxDtezZG+zYUYhsLfPRtC0frNaa2EUgmwrfMNY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QtOGy3ihgRf4tEsXDqmzZ4Sfb3F7Jy8Ty4CG4UZymRYG90Jl47xSFwoT/UZ1vN4CD
	 259f6mDqkJgdyUSsDqP/rBOJucLT5WS4jsgkPR8v/RLcrxivUZCBbW2CgKGj3knSg2
	 2ZLz4qWcoKB86YiIqZdFFmr2mGnpmFq1PavR6xPTwqqjeVKuBje8pJqpbmC4Z8pMTH
	 FN6uJkz7dssJ1Pzy6NcwBK+vk8sHlMZzRE89mCq2D+SUT2LWcLFYJwwY72PabUIUxV
	 4iSoNuJXTxDk1nJ0M4dN3h8nvSXFgdQPwMhBwtcRrRfedPUM3oG/6xZ6ujSvYZgfnm
	 zr0TilLcN2CgA==
Message-ID: <sashiko-outbox-202846@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] i3c: dw: remove redundant
 pm_runtime_dont_use_autosuspend() calls
To: "Joshua Crofts" <crofts@kernel.org>
Cc: linux-i3c@lists.infradead.org, imx@lists.linux.dev, Frank.Li@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20261107-dont-use-autosuspend-i3c-v1-1-80a1546354ce@kernel.org>
References: <20261107-dont-use-autosuspend-i3c-v1-0-80a1546354ce@kernel.org>
 <20261107-dont-use-autosuspend-i3c-v1-1-80a1546354ce@kernel.org>
Date: Sat, 07 Nov 2026 11:12:02 +0000
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
aXN0aW5nIGlzc3VlIGl0IGRvZXMgbm90CmludHJvZHVjZToKLSBbTWVkaXVtXSBpM2M6IG1hc3Rl
cjogZHc6IGNsb2NrIGVuYWJsZSBjb3VudCB1bmRlcmZsb3cgaW4KICBkd19pM2NfY29tbW9uX3Jl
bW92ZSgpIFsxXQotLQoKY29tbWl0IDRmN2I3YThiMjY4MDA2ODBkMmNkYmU1ZmU2YWNiYmYxZjkz
YzYzZWMKQXV0aG9yOiBKb3NodWEgQ3JvZnRzIDxjcm9mdHNAa2VybmVsLm9yZz4KCmkzYzogZHc6
IHJlbW92ZSByZWR1bmRhbnQgcG1fcnVudGltZV9kb250X3VzZV9hdXRvc3VzcGVuZCgpIGNhbGxz
CgpUaGlzIGNvbW1pdCByZW1vdmVzIHJlZHVuZGFudCBwbV9ydW50aW1lX2RvbnRfdXNlX2F1dG9z
dXNwZW5kKCkgY2FsbHMgZnJvbQpkd19pM2NfY29tbW9uX3Byb2JlKCkgYW5kIGR3X2kzY19jb21t
b25fcmVtb3ZlKCkuCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIvZHctaTNjLW1h
c3Rlci5jIGIvZHJpdmVycy9pM2MvbWFzdGVyL2R3LWkzYy1tYXN0ZXIuYwo+IGluZGV4IGQxMTE5
ZjIwM2QxYjYuLmY4ZmVkNzk3ZTBlNGQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9pM2MvbWFzdGVy
L2R3LWkzYy1tYXN0ZXIuYwo+ICsrKyBiL2RyaXZlcnMvaTNjL21hc3Rlci9kdy1pM2MtbWFzdGVy
LmMKClsgLi4uIF0KCj4gQEAgLTE3OTIsNyArMTc5MSw2IEBAIHZvaWQgZHdfaTNjX2NvbW1vbl9y
ZW1vdmUoc3RydWN0IGR3X2kzY19tYXN0ZXIgKm1hc3RlcikKPiAgCj4gIAlwbV9ydW50aW1lX2Rp
c2FibGUobWFzdGVyLT5kZXYpOwo+ICAJcG1fcnVudGltZV9zZXRfc3VzcGVuZGVkKG1hc3Rlci0+
ZGV2KTsKPiAtCXBtX3J1bnRpbWVfZG9udF91c2VfYXV0b3N1c3BlbmQobWFzdGVyLT5kZXYpOwo+
ICB9Cj4gIEVYUE9SVF9TWU1CT0xfR1BMKGR3X2kzY19jb21tb25fcmVtb3ZlKTsKCltTZXZlcml0
eTogTWVkaXVtXQpUaGlzIHByb2JsZW0gd2Fzbid0IGludHJvZHVjZWQgYnkgdGhpcyBwYXRjaCwg
YnV0IGNhbiB1bmJpbmRpbmcgYQpydW50aW1lLXN1c3BlbmRlZCBjb250cm9sbGVyIHVuZGVyZmxv
dyB0aGUgY2xvY2sgZW5hYmxlIGNvdW50cyBbMV0/Cgpkd19pM2NfY29tbW9uX3Byb2JlKCkgYWNx
dWlyZXMgY29yZV9jbGsgYW5kIHBjbGsgdmlhCmRldm1fY2xrX2dldF9vcHRpb25hbF9lbmFibGVk
KCksIHdoaWNoIHJlZ2lzdGVycyBhIGRldnJlcyBhY3Rpb24gdG8gY2FsbApjbGtfZGlzYWJsZV91
bnByZXBhcmUoKSBvbiByZW1vdmFsLiAgSG93ZXZlciwKZHdfaTNjX21hc3Rlcl9ydW50aW1lX3N1
c3BlbmQoKSBhbHNvIGRpc2FibGVzIHRoZXNlIGNsb2NrcyB2aWEKZHdfaTNjX21hc3Rlcl9kaXNh
YmxlX2Nsa3MoKS4gIElmIHRoZSBkZXZpY2UgaXMgcnVudGltZS1zdXNwZW5kZWQgd2hlbgpkd19p
M2NfY29tbW9uX3JlbW92ZSgpIGRpc2FibGVzIHJ1bnRpbWUgUE0gd2l0aG91dCByZXN1bWluZyB0
aGUgZGV2aWNlLApkZXZyZXMgd2lsbCBkaXNhYmxlIHRoZSBhbHJlYWR5LWRpc2FibGVkIGNsb2Nr
cyBhbmQgdHJpZ2dlciBhIGNsb2NrCmVuYWJsZSBjb3VudCB1bmRlcmZsb3cgd2FybmluZy4KClsx
XSBodHRwczovL3Nhc2hpa28uZGV2LyMvYnVnL2xpbnV4LTJlNzhiMDdmLWRmMzUtNDJiZC1iNGFl
LTcxODczYjc5YjY3ZgoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5k
ZXYvIy9wYXRjaHNldC8yMDI2MTEwNy1kb250LXVzZS1hdXRvc3VzcGVuZC1pM2MtdjEtMC04MGEx
NTQ2MzU0Y2VAa2VybmVsLm9yZz9wYXJ0PTEKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0Cmxp
bnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
