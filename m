Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6195DC5AD5A
	for <linux-i3c@archiver.kernel.org>; Mon, 10 Aug 2026 01:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P3dJQquToc5pMQYsUlDRdp3vnfC+nFMAzeFC9ARh4qk=; b=L+7/RXPhoCa7uO
	zzFDSmmJdhf6WGR+sACBukKXvRVXFScz4Y+X9PLpyYnPKvq1sl1Y+0MJwl4f//0SK7l9tLD6hHEid
	39QPlbLoPuPFEdfSeN3it7t2dLL8v7810jo7rkksXR9Pg/k9PBz3gRTCk3yTS/z9kZAzfKtLuYldt
	se9gUPa9+61+CL13TfdZ8HtsVcZQ1lD+b2NLLa64zXqRRIAtmJQKw6mMjm1yMGBcreCvfrfkn3RDm
	OuEgCYgEjCZkE0hvgMvh4dHH1wPM5MhaLEuG8dujeJIHSdT1RRWdkCsKtyv511iNLCAFdujVXDEEp
	Of+rT9/miseoxDfz2WOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtF3G-0000000AtMJ-2xzd;
	Mon, 10 Aug 2026 01:43:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtF3F-0000000AtLp-3g8e
	for linux-i3c@lists.infradead.org;
	Mon, 10 Aug 2026 01:43:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 782E74199A;
	Mon, 10 Aug 2026 01:43:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E2C51F000E9;
	Mon, 10 Aug 2026 01:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786326220;
	bh=NeqQO1w9QNJZhtBGGVMz/pa/JJSDmESDvrpTeF4dJ7Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ngwIZztN1jxU+R2ptJEwD7ki7zOnidsZn7eRW2e66SbtLKt4aA3mL8RYDZzIKVMu9
	 7fPjnEIAlg4nuzK9AVdnBogPIte54efcmoJj6hKkFqypltFCxc2kUa+aM0mxPC0bGe
	 iZ259tuwV3hDpBtc2Jv3fzpx9NARaKSFDQ4IMW+H58qS4UqFglFq0Gwdlui/BTRRi9
	 8k3zyfKJ425eBO9Aib3TEQINluG1jtpvSn32a4N2K1HZbUWtPu3bPwAkb0kZ4L2Hu1
	 I3eOgRJt3j2UFniR6OYPuq1a0tTAPWPpVG3I9Ut/I7x6ScH7P5CgISif/3ziUlYh6R
	 oQCTyEh7xMAGw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1] i3c: master: allocate IBI workqueue with WQ_HIGHPRI
To: "Stanley Chu" <stanley.chuys@gmail.com>
Cc: Frank.Li@kernel.org, linux-i3c@lists.infradead.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260810013059.3055787-1-yschu@nuvoton.com>
References: <20260810013059.3055787-1-yschu@nuvoton.com>
Date: Mon, 10 Aug 2026 01:43:39 +0000
Message-Id: <20260810014340.0E2C51F000E9@smtp.kernel.org>
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
IFtIaWdoXSBSYWNlIGNvbmRpdGlvbiBpbiBgaTNjX2Rldl9mcmVlX2liaV9sb2NrZWQoKWAgYWxs
b3dzIGEgdG9wLWhhbGYgSVJRIGhhbmRsZXIgdG8gY2F1c2UgYSB1c2UtYWZ0ZXItZnJlZSBhbmQg
TlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlLgotLQoKLS0tIFBhdGNoIFsxXTogW1BBVENIIHYxXSBp
M2M6IG1hc3RlcjogYWxsb2NhdGUgSUJJIHdvcmtxdWV1ZSB3aXRoIFdRX0hJR0hQUkkgLS0tCmNv
bW1pdCA5YjVlYzM0Y2E0YTA3MDU4N2U0MDE0NTI4OGJlM2IzNGNlMDYxZDU4CkF1dGhvcjogU3Rh
bmxleSBDaHUgPHlzY2h1QG51dm90b24uY29tPgoKaTNjOiBtYXN0ZXI6IGFsbG9jYXRlIElCSSB3
b3JrcXVldWUgd2l0aCBXUV9ISUdIUFJJCgpUaGlzIGNvbW1pdCBhZGRzIHRoZSBXUV9ISUdIUFJJ
IGZsYWcgdG8gdGhlIElCSSAoSW4tQmFuZCBJbnRlcnJ1cHQpIHdvcmtxdWV1ZQphbGxvY2F0aW9u
IGluIHRoZSBJM0MgbWFzdGVyIGRyaXZlci4gVGhpcyBlbnN1cmVzIHRoYXQgSUJJIGJvdHRvbS1o
YWxmIHdvcmsKaXMgc2NoZWR1bGVkIHByb21wdGx5LCBhdm9pZGluZyBsYXRlbmN5IGlzc3VlcyBm
b3Igc2Vuc2l0aXZlIGNsaWVudHMgdGhhdApjb3VsZCBvY2N1ciBpZiBwcm9jZXNzZWQgYXQgbm9y
bWFsIHdvcmtlciBwcmlvcml0eS4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci5j
IGIvZHJpdmVycy9pM2MvbWFzdGVyLmMKPiBpbmRleCBhZmNkN2EyMWEzZTY2Li40ZmE5MDAxMzI5
MGYxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci5jCj4gKysrIGIvZHJpdmVycy9p
M2MvbWFzdGVyLmMKPiBAQCAtMzk0NSw3ICszOTQ1LDggQEAgaW50IGkzY19kZXZfcmVxdWVzdF9p
YmlfbG9ja2VkKHN0cnVjdCBpM2NfZGV2X2Rlc2MgKmRldiwKPiAgCWlmICghaWJpKQo+ICAJCXJl
dHVybiAtRU5PTUVNOwo+ICAKPiAtCWliaS0+d3EgPSBhbGxvY19vcmRlcmVkX3dvcmtxdWV1ZShk
ZXZfbmFtZShpM2NkZXZfdG9fZGV2KGRldi0+ZGV2KSksIFdRX01FTV9SRUNMQUlNKTsKPiArCWli
aS0+d3EgPSBhbGxvY19vcmRlcmVkX3dvcmtxdWV1ZShkZXZfbmFtZShpM2NkZXZfdG9fZGV2KGRl
di0+ZGV2KSksCj4gKwkJCQkJICBXUV9NRU1fUkVDTEFJTSB8IFdRX0hJR0hQUkkpOwpbU2V2ZXJp
dHk6IEhpZ2hdClRoaXMgaXNuJ3QgYSBidWcgaW50cm9kdWNlZCBieSB0aGlzIHBhdGNoLCBidXQg
aXMgdGhlcmUgYSByYWNlIGNvbmRpdGlvbiBpbgppM2NfZGV2X2ZyZWVfaWJpX2xvY2tlZCgpIHdo
ZW4gdGVhcmluZyBkb3duIHRoaXMgd29ya3F1ZXVlPwoKV2hlbiBhbiBJM0MgZGV2aWNlIGRyaXZl
ciBmcmVlcyBpdHMgSUJJIChlLmcuIGR1cmluZyB1bmJpbmQpLAppM2NfZGV2X2ZyZWVfaWJpX2xv
Y2tlZCgpIGRlc3Ryb3lzIHRoZSB3b3JrcXVldWUgYW5kIGZyZWVzIGRldi0+aWJpLiBIb3dldmVy
LAp0aGVyZSBpcyBubyBzeW5jaHJvbml6ZV9pcnEoKSB0byB3YWl0IGZvciBleGVjdXRpbmcgbWFz
dGVyIGNvbnRyb2xsZXIgSVJRCmhhbmRsZXJzIHRvIGZpbmlzaC4KCkEgY29uY3VycmVudGx5IGV4
ZWN1dGluZyBJUlEgaGFuZGxlciBjYW4gcmVhZCB0aGUgZGV2aWNlIGRlc2NyaXB0b3IsIGJlIGJy
aWVmbHkKZGVsYXllZCwgYW5kIHRoZW4gaW52b2tlIGkzY19tYXN0ZXJfcXVldWVfaWJpKCk6Cgpk
cml2ZXJzL2kzYy9tYXN0ZXIuYzppM2NfbWFzdGVyX3F1ZXVlX2liaSgpIHsKICAgIC4uLgoJYXRv
bWljX2luYygmZGV2LT5pYmktPnBlbmRpbmdfaWJpcyk7CglxdWV1ZV93b3JrKGRldi0+aWJpLT53
cSwgJnNsb3QtPndvcmspOwogICAgLi4uCn0KCklmIHRoaXMgaGFwcGVucyBhZnRlciBpM2NfZGV2
X2ZyZWVfaWJpX2xvY2tlZCgpIGhhcyBhbHJlYWR5IGRlc3Ryb3llZCB0aGUKd29ya3F1ZXVlIGFu
ZCBmcmVlZCBkZXYtPmliaToKCmRyaXZlcnMvaTNjL21hc3Rlci5jOmkzY19kZXZfZnJlZV9pYmlf
bG9ja2VkKCkgewogICAgLi4uCglpZiAoZGV2LT5pYmktPndxKSB7CgkJZGVzdHJveV93b3JrcXVl
dWUoZGV2LT5pYmktPndxKTsKCQlkZXYtPmliaS0+d3EgPSBOVUxMOwoJfQoKCWtmcmVlKGRldi0+
aWJpKTsKCWRldi0+aWJpID0gTlVMTDsKICAgIC4uLgp9CgpDb3VsZCB0aGlzIGxlYWQgdG8gYSB1
c2UtYWZ0ZXItZnJlZSBhbmQgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIHdoZW4gYWNjZXNzaW5n
CmRldi0+aWJpLT53cSBpbnNpZGUgcXVldWVfd29yaygpPwoKPiAgCWlmICghaWJpLT53cSkgewo+
ICAJCWtmcmVlKGliaSk7Cj4gIAkJcmV0dXJuIC1FTk9NRU07CgotLSAKU2FzaGlrbyBBSSByZXZp
ZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwODEwMDEzMDU5LjMwNTU3
ODctMS15c2NodUBudXZvdG9uLmNvbT9wYXJ0PTEKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0
CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
