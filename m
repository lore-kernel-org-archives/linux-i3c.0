Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBEF2C88E53
	for <linux-i3c@archiver.kernel.org>; Fri, 11 Sep 2026 21:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nPKzdc50RMVODHZk8JTFtUKPwedc6byMqbYiyhtizB0=; b=XE9g5f1M598h7Y
	LrK5Npi639eRZyOlKS1DiNAqiq4iPEx+bI7DofdyHdtZNFT+uH4gtDDmYm7HT0ddpeb8ZGilEK+ti
	3OcdVrhlkpj6Sv0uRPy2VaDUHDXxlpPL1qfq/7wfw9RxBhqeNu1CFbNFzcWuvzeH7UWKb8459x3k7
	JAatOkHuLBFDo6BP4qyYMb0oOLXoE82YxMXRzrhkf58y0vC3A0HnHG360rGlRx4QVP3bZZTwlbmuR
	FBdpj1X9h4KN32qbfEzT0duV9+y4JPwml4KvoX5NgpagrDRwQLRJ97PDZ2cL0hWvUy52Lie1zU+KA
	S7z8aYTCPj4dExFk1ZTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x58hB-00000000AOy-1uew;
	Fri, 11 Sep 2026 21:22:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x58hA-00000000AOR-0tbV
	for linux-i3c@lists.infradead.org;
	Fri, 11 Sep 2026 21:22:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 95EE042B15;
	Fri, 11 Sep 2026 21:22:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 376CD1F000FF;
	Fri, 11 Sep 2026 21:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789161723;
	bh=YqnqTljYrhL5Z6oEhFvVkiCnuDP6WJ52GKQjdZ+XD3o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hQrjMDYmIOFBGUpM1NDsSLeUZVrxtVfB0ratJgiN8oeklxsjY++FOVarseDAvwj3k
	 3C9hbI8uljGDtJcdoPAUDTVjDyVblQB2CNgePyMOs0j+6MXH9QtkBf6wRDPT0CzyOP
	 QkB/3pHxkPwSKAhXAiA9wJeHyfWCk4tT5Ja76G2bg4Xz3X39D/laT3vezbL17q/nMK
	 Cn2CgK4J+AW10FadLCuFDFMvhxjR9tvQBRiq692ChLyY9ozXoVE3Czhw4aGJeyZ1av
	 R/QupZNbTv0eOXOZSpIV2xToxKD8a6/yeoLMxPlwfNjHAvnlbucQR7yZMRaevCm4WZ
	 sSdFnPE6YcLbw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] i3c: set i3c_xfer.actual_len in controller drivers
To: "Meagan Lloyd" <meaganlloyd@linux.microsoft.com>
Cc: linux-i3c@lists.infradead.org, linux-hwmon@vger.kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Frank.Li@kernel.org
In-Reply-To: <20260911210935.1353126-3-meaganlloyd@linux.microsoft.com>
References: <20260911210935.1353126-1-meaganlloyd@linux.microsoft.com>
 <20260911210935.1353126-3-meaganlloyd@linux.microsoft.com>
Date: Fri, 11 Sep 2026 21:22:02 +0000
Message-Id: <20260911212203.376CD1F000FF@smtp.kernel.org>
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
IFtIaWdoXSBUaGUgUmVuZXNhcyBJM0MgY29udHJvbGxlciBzaWxlbnRseSBpZ25vcmVzIGFsbCB0
cmFuc2ZlciBlcnJvcnMgYW5kIHRpbWVvdXRzLCBhbHdheXMgcmV0dXJuaW5nIHN1Y2Nlc3MuCi0t
Cgpjb21taXQgZTI4YzFhZTNhNTFkYjZlZWY1ZmNiYTE2Y2E4NTBhY2RhMWEwODdkMgpBdXRob3I6
IE1lYWdhbiBMbG95ZCA8bWVhZ2FubGxveWRAbGludXgubWljcm9zb2Z0LmNvbT4KU3ViamVjdDog
aTNjOiBzZXQgaTNjX3hmZXIuYWN0dWFsX2xlbiBpbiBjb250cm9sbGVyIGRyaXZlcnMKClRoaXMg
Y29tbWl0IHVwZGF0ZXMgdmFyaW91cyBJM0MgY29udHJvbGxlciBkcml2ZXJzIHRvIHNldCBhY3R1
YWxfbGVuIGZvcgpyZWFkIHRyYW5zZmVycy4gSXQgcHJvdmlkZXMgYSBjb25zaXN0ZW50IGxvY2F0
aW9uIGZvciBkZXZpY2UgZHJpdmVycyB0byBrbm93CnRoZSByZWFkIHJlc3BvbnNlIGJ5dGVzIHdp
dGhvdXQgb3ZlcnJpZGluZyB0aGUgbGVuZ3RoIGZpZWxkLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9pM2MvbWFzdGVyL3JlbmVzYXMtaTNjLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvcmVuZXNhcy1p
M2MuYwo+IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci9yZW5lc2FzLWkzYy5jCj4gKysrIGIvZHJp
dmVycy9pM2MvbWFzdGVyL3JlbmVzYXMtaTNjLmMKPiBAQCAtOTE4LDYgKzkxOCw5IEBAIHN0YXRp
YyBpbnQgcmVuZXNhc19pM2NfaTNjX3hmZXJzKHN0cnVjdCBpM2NfZGV2X2Rlc2MgKmRldiwgc3Ry
dWN0IGkzY194ZmVyICppM2NfCj4gIAkJdGltZV9sZWZ0ID0gcmVuZXNhc19pM2Nfd2FpdF94ZmVy
KGkzYywgeGZlcik7Cj4gIAkJaWYgKCF0aW1lX2xlZnQpCj4gIAkJCXhmZXJfZmFpbGVkID0gdHJ1
ZTsKPiArCj4gKwkJaWYgKGkzY194ZmVyc1tpXS5ybncpCj4gKwkJCWkzY194ZmVyc1tpXS5hY3R1
YWxfbGVuID0gY21kLT5yeF9jb3VudDsKPiAgCX0KPiAgCj4gIAlpZiAoeGZlcl9mYWlsZWQpCj4g
IAkJcmVuZXNhc19pM2NfaXJxc19tYXNrX2FuZF9jbGVhcihpM2MpOwo+ICAKPiAgCXJldHVybiAw
Owo+ICB9CgpbU2V2ZXJpdHk6IEhpZ2hdClRoaXMgaXNuJ3QgYSBidWcgaW50cm9kdWNlZCBieSB0
aGlzIHBhdGNoLCBidXQgaXMgYSBjcml0aWNhbCBwcmUtZXhpc3RpbmcKaXNzdWUuIERvZXMgcmVu
ZXNhc19pM2NfaTNjX3hmZXJzKCkgc2lsZW50bHkgaWdub3JlIHRyYW5zZmVyIGVycm9ycz8KCklm
IGFuIEkzQyBoYXJkd2FyZSBlcnJvciBvY2N1cnMgZHVyaW5nIHRoZSB0cmFuc2ZlciwgdGhlIElT
UiBwb3B1bGF0ZXMKeGZlci0+cmV0IHdpdGggYSBuZWdhdGl2ZSBlcnJvciBjb2RlIGxpa2UgLUVJ
TywgYnV0IHRoZSBsb29wIGhlcmUgbmV2ZXIKY2hlY2tzIHhmZXItPnJldC4gRnVydGhlcm1vcmUs
IGlmIGEgdGltZW91dCBvY2N1cnMsIHhmZXJfZmFpbGVkIGlzIHNldCwKYnV0IHRoZSBsb29wIGRv
ZXMgbm90IGJyZWFrIGVhcmx5LCBhbmQgdGhlIGZ1bmN0aW9uIHVuY29uZGl0aW9uYWxseSByZXR1
cm5zCjAgYXQgdGhlIGVuZC4KClNpbmNlIHRoZSBjb250cm9sbGVyIGlnbm9yZXMgdGhlIGVycm9y
IGFuZCByZXR1cm5zIHN1Y2Nlc3MsIGNhbGxlcnMgd2lsbApwcm9jZWVkIGFzIGlmIHRoZSBkYXRh
IHdhcyBzdWNjZXNzZnVsbHkgcmVhZCBvciB3cml0dGVuLiBDb3VsZCB0aGlzIGxlYWQKdG8gSTND
IGRldmljZSBkcml2ZXJzIGNvbnN1bWluZyB1bmluaXRpYWxpemVkIG1lbW9yeSBvciBlbmNvdW50
ZXJpbmcgc2lsZW50CnN0YXRlIG1hY2hpbmUgZmFpbHVyZXMgd2hlbiBhIGhhcmR3YXJlIE5BQ0ss
IENSQyBlcnJvciwgb3IgdGltZW91dCBvY2N1cnM/CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcg
aHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwOTExMjEwOTM1LjEzNTMxMjYtMS1t
ZWFnYW5sbG95ZEBsaW51eC5taWNyb3NvZnQuY29tP3BhcnQ9MgoKLS0gCmxpbnV4LWkzYyBtYWls
aW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
