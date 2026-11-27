Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDD4606A31C
	for <linux-i3c@archiver.kernel.org>; Fri, 27 Nov 2026 07:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OLJ6IZQF;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QxedmrrH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AJ8xECEPWZ/AVaO/NKexDI8xNJuShB7ARmE02HsirDQ=; b=OLJ6IZQFy9F51RVJGGVmf/zX3q
	Icb5yZf9813j95uPKJHkIFwHo0Y4Dl9/JvLxitf+V/JfIxH0t/4SOqqYtVkQKoDflAC6/EbgiAghG
	EzhK0A6mBUjyM9w3pPq7lIMAaoalQXijjX/I5CGCsq0PXTJNHAYVVYiQ/p5AywPu79nK9hTuaUEWL
	2i4WdlpMcNji20IrtweGvm1ccBTVpqggD3xDXU1ZgoSSD5+68exJ7za81Z+GFDQhtiLXwoPJFT0g1
	l4qrnzAVrSTy1duFmbCpeIxyFWEtH5+JxHA1lXRhReuQSXCeIfh9Rv2u1no+xnXW4zs5PjLiNySQ4
	m7t0Z8GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWq80-0000000F6Fd-0NgZ;
	Fri, 27 Nov 2026 07:12:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWq7y-0000000F6FR-2bEJ
	for linux-i3c@lists.infradead.org;
	Fri, 27 Nov 2026 07:12:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B06CB609E1;
	Fri, 27 Nov 2026 07:12:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DF4D1F00897;
	Fri, 27 Nov 2026 07:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795763533;
	bh=+AXwsIsYi0QWuiHAFI4wU5j5Xp5AX6GkWqr0RkY+j9I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QxedmrrHJtyR7uRPjKj2r/yIPsGRu1GPNX4natu1oIylg5Mdb6v7/fwsXGX+QVuZj
	 BUsMp4jOytEcLPsGHR6fS+W4Oaj22QfICnv/sI3Xw5Fa1DafoCuP0E2uqOm81iX7s8
	 R4shziMpqHTjHav/pUPaUTJacv8gsLEZCDtUofQw/bGpbPi6VoH9DDJbsTWt+9vUaz
	 WpDOGbaq+6ScDEz1i1FGir+8hJrg/KBzXnYYY3Czg9uoovtY9VVVlzbUfUfmMsKkGt
	 hOJedkhfJigaw7DR4Idod9q/AdkaGYGsaZuS9/eYgZ+QQAlUUy/WAxletBEZFYcisH
	 z0bKTpNr1IZ4w==
Message-ID: <sashiko-outbox-236789@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] i3c: master: mark OF bus child nodes OF_POPULATED to
 avoid legacy I2C rescan
To: "Billy Tsai" <billy_tsai@aspeedtech.com>
Cc: linux-i3c@lists.infradead.org, Frank.Li@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20261127-i3c-master-of-populated-v2-1-c52095d00218@aspeedtech.com>
References: <20261127-i3c-master-of-populated-v2-1-c52095d00218@aspeedtech.com>
Date: Fri, 27 Nov 2026 07:12:12 +0000
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
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gaTNjOiBtYXN0ZXI6IE9G
X1BPUFVMQVRFRCBsZWFrZWQgb24gcHJlLWRldmljZV9hZGQoKQogIHJlZ2lzdHJhdGlvbiBlcnJv
cnMKLS0KCmNvbW1pdCBjOTBmZTk3OTU0ZjEwNjI2ZDZjMzU3YmQwMzc5ODQwODhiZjAwOTY2CkF1
dGhvcjogQmlsbHkgVHNhaSA8YmlsbHlfdHNhaUBhc3BlZWR0ZWNoLmNvbT4KCmkzYzogbWFzdGVy
OiBtYXJrIE9GIGJ1cyBjaGlsZCBub2RlcyBPRl9QT1BVTEFURUQgdG8gYXZvaWQgbGVnYWN5IEky
QyByZXNjYW4KClRoaXMgY29tbWl0IG1hcmtzIE9GIGNoaWxkIG5vZGVzIG9mIHRoZSBJM0MgYnVz
IHdpdGggT0ZfUE9QVUxBVEVEIGluCmZ3bm9kZV9wb3B1bGF0ZV9pM2NfYnVzKCkgc28gdGhhdCBp
MmNfcmVnaXN0ZXJfYWRhcHRlcigpIHNraXBzIHRoZW0sIGFuZApjbGVhcnMgdGhlIGZsYWcgaW4g
Zndub2RlX2RlcG9wdWxhdGVfaTNjX2J1cygpIG9uIGVycm9yIGFuZCBidXMgY2xlYW51cC4KCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci5jIGIvZHJpdmVycy9pM2MvbWFzdGVyLmMK
PiBpbmRleCAwMWUwNWJhZDg2NjFlLi5lODUzMDc2NzhmZGNmIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvaTNjL21hc3Rlci5jCj4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyLmMKPiBAQCAtMjY2Nyw2
ICsyNjY3LDggQEAgc3RhdGljIGludCBpM2NfbWFzdGVyX2J1c19pbml0KHN0cnVjdCBpM2NfbWFz
dGVyX2NvbnRyb2xsZXIgKm1hc3RlcikKPiAgCXJldHVybiByZXQ7Cj4gIH0KPiAgCj4gK3N0YXRp
YyB2b2lkIGZ3bm9kZV9kZXBvcHVsYXRlX2kzY19idXMoc3RydWN0IGkzY19tYXN0ZXJfY29udHJv
bGxlciAqbWFzdGVyKTsKPiArCj4gIHN0YXRpYyB2b2lkIGkzY19tYXN0ZXJfYnVzX2NsZWFudXAo
c3RydWN0IGkzY19tYXN0ZXJfY29udHJvbGxlciAqbWFzdGVyKQo+ICB7Cj4gIAlpZiAobWFzdGVy
LT5vcHMtPmJ1c19jbGVhbnVwKSB7Cj4gQEAgLTI2ODEsNiArMjY4Myw3IEBAIHN0YXRpYyB2b2lk
IGkzY19tYXN0ZXJfYnVzX2NsZWFudXAoc3RydWN0IGkzY19tYXN0ZXJfY29udHJvbGxlciAqbWFz
dGVyKQo+ICAJCX0KPiAgCX0KPiAgCj4gKwlmd25vZGVfZGVwb3B1bGF0ZV9pM2NfYnVzKG1hc3Rl
cik7Cj4gIAlpM2NfbWFzdGVyX2RldGFjaF9mcmVlX2RldnMobWFzdGVyKTsKPiAgfQoKW1NldmVy
aXR5OiBNZWRpdW1dCkRvZXMgcGxhY2luZyBmd25vZGVfZGVwb3B1bGF0ZV9pM2NfYnVzKCkgaW4g
aTNjX21hc3Rlcl9idXNfY2xlYW51cCgpIHN0aWxsCmxlYXZlIE9GX1BPUFVMQVRFRCBzZXQgd2hl
biBpM2NfbWFzdGVyX3JlZ2lzdGVyX2Z3bm9kZSgpIGZhaWxzIGFmdGVyCmZ3bm9kZV9wb3B1bGF0
ZV9pM2NfYnVzKCkgc3VjY2VlZHMgYnV0IGJlZm9yZSBkZXZpY2VfYWRkKCk/CgpFdmVyeSBlcnJv
ciBwYXRoIGluIGkzY19tYXN0ZXJfcmVnaXN0ZXJfZndub2RlKCkgYmV0d2Vlbgpmd25vZGVfcG9w
dWxhdGVfaTNjX2J1cygpIGFuZCBkZXZpY2VfYWRkKCksIGluY2x1ZGluZwppM2NfbWFzdGVyX2J1
c19pbml0KCkgZmFpbHVyZSwganVtcHMgZGlyZWN0bHkgdG8gZXJyX3B1dF9kZXYgYW5kIHNraXBz
CmkzY19tYXN0ZXJfYnVzX2NsZWFudXAoKToKCmRyaXZlcnMvaTNjL21hc3Rlci5jOmkzY19tYXN0
ZXJfcmVnaXN0ZXJfZndub2RlKCkgewoJLi4uCglyZXQgPSBmd25vZGVfcG9wdWxhdGVfaTNjX2J1
cyhtYXN0ZXIpOwoJaWYgKHJldCkKCQlnb3RvIGVycl9wdXRfZGV2OwoJLi4uCglyZXQgPSBpM2Nf
bWFzdGVyX2J1c19pbml0KG1hc3Rlcik7CglpZiAocmV0KQoJCWdvdG8gZXJyX3B1dF9kZXY7CgoJ
cmV0ID0gZGV2aWNlX2FkZCgmbWFzdGVyLT5kZXYpOwoJaWYgKHJldCkKCQlnb3RvIGVycl9jbGVh
bnVwX2J1czsKCS4uLgplcnJfY2xlYW51cF9idXM6CglpM2NfbWFzdGVyX2J1c19jbGVhbnVwKG1h
c3Rlcik7CgplcnJfcHV0X2RldjoKCWkzY19tYXN0ZXJfcnBtX3B1dChtYXN0ZXIpOwoJcHV0X2Rl
dmljZSgmbWFzdGVyLT5kZXYpOwp9CgpJZiBpM2NfbWFzdGVyX2J1c19pbml0KCkgZmFpbHMsIHRo
ZSBPRiBjaGlsZCBub2RlcyByZW1haW4gbWFya2VkCk9GX1BPUFVMQVRFRCBhZnRlciByZWdpc3Ry
YXRpb24gYWJvcnRzLCBwcmV2ZW50aW5nIGRldmljZSBjcmVhdGlvbiBvbiBhCmxhdGVyIHJlLXBy
b2JlIG9yIHJlYmluZC4gIENhbGxpbmcgZndub2RlX2RlcG9wdWxhdGVfaTNjX2J1cygpIGZyb20K
aTNjX21hc3RlcmRldl9yZWxlYXNlKCkgKG9yIG9uIHRoZSBlcnJfcHV0X2RldiB0ZWFyZG93biBw
YXRoKSB3b3VsZCBjb3Zlcgp0aGVzZSBmYWlsdXJlcyBhcyB3ZWxsLgoKLS0gClNhc2hpa28gQUkg
cmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MTEyNy1pM2MtbWFz
dGVyLW9mLXBvcHVsYXRlZC12Mi0xLWM1MjA5NWQwMDIxOEBhc3BlZWR0ZWNoLmNvbT9wYXJ0PTEK
Ci0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
