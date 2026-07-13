Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C393C43458
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Jul 2026 13:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7AhduMtcleQbvOlvo4Y9Qo/4rtBfgmxCMFNHKLyBB5w=; b=KlNu6AipNNsGjz
	WlTJtP2vQ7gGYrkXR2EwYMquD2cLfqY9LzXIQ0N2RFSkkeyvm1Vxyh0nxd0ciG6DK4cPYg1WVsPiK
	nZQehG1mFlMnfwI6uuQLqZ1kvktKs5BHDAf+NukxS8aSNku36TQm/XOo58eNjihFjaseYjRpdEi9n
	iyGhpPBr9kOzT8YHEKUA42o9g15xhio5+HROFoJz0D/al0gxvA1u5O7jEQR3Pp4VNM1YzUmJbY9hY
	4dCohU6708yHexRNvX8SH5xAo0jSLXhJwSBuQIJ9MyoowTvva8HrPhS72ctQtUOSmNLvj4VtuUjVR
	hbw5Hj3Zmvgln53PskpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGp6-00000009QRD-1Q42;
	Mon, 13 Jul 2026 13:35:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGp5-00000009QQw-3ln9
	for linux-i3c@lists.infradead.org;
	Mon, 13 Jul 2026 13:35:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1B30D600AA;
	Mon, 13 Jul 2026 13:35:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FDB21F000E9;
	Mon, 13 Jul 2026 13:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783949750;
	bh=MzSY4qCx06Darq7OMD/QoF6fGEoHRJ+2cZz3g4v6Zpc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=koQK0hfe1DbZKKoqD/rjjDyjnmLWU51Rg6lMMCcgpHlONIVx8q6LbnWl97m5aNvsd
	 2V30eePFVCF2pz5Bno+0C+vxGPxtiUBnnAg0sNOpUDWJzgiYvu5Cn1EWMzxVadLclh
	 111UO6+PMxKy9Pxpw+KGAhrlwfKKT5yMqmI5uKzE60uNi6c4Svjc/ne8Pbi7D4gOMo
	 gCAPISMFnQeCoXdGAPcpyhdoKcLPFbEwvZAwTymR5UW7Q1s+5pAEn47XpeTYF6JucD
	 fW6OcJhl0lDgSng1x22uQQ07xKOmMxlTNaRMPxNuSBCYRIk/27BnwknEKuz1H9claS
	 HgEJ0ZUyzSprQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 05/17] i3c: renesas: Reset the controller on resume
To: "Claudiu Beznea" <claudiu.beznea@tuxon.dev>
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, Frank.Li@kernel.org, linux-i3c@lists.infradead.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260713130545.568657-6-claudiu.beznea+renesas@tuxon.dev>
References: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
 <20260713130545.568657-6-claudiu.beznea+renesas@tuxon.dev>
Date: Mon, 13 Jul 2026 13:35:50 +0000
Message-Id: <20260713133550.8FDB21F000E9@smtp.kernel.org>
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
IFtIaWdoXSBIYXJkd2FyZSByZXNldCBsaW5lcyBhcmUgZGVhc3NlcnRlZCBiZWZvcmUgY29udHJv
bGxlciBjbG9ja3MgYXJlIGVuYWJsZWQgZHVyaW5nIHN5c3RlbSByZXN1bWUuCi0tCgotLS0gUGF0
Y2ggWzVdOiBbUEFUQ0ggdjUgMDUvMTddIGkzYzogcmVuZXNhczogUmVzZXQgdGhlIGNvbnRyb2xs
ZXIgb24gcmVzdW1lIC0tLQpjb21taXQgOTIzMDUzNWYzYmVlYzE0YTk0MjlmYWQ4NGQ1NGIyNmRi
YWZmNTE4MgpBdXRob3I6IENsYXVkaXUgQmV6bmVhIDxjbGF1ZGl1LmJlem5lYS51akBicC5yZW5l
c2FzLmNvbT4KCmkzYzogcmVuZXNhczogUmVzZXQgdGhlIGNvbnRyb2xsZXIgb24gcmVzdW1lCgpU
aGlzIGNvbW1pdCB1cGRhdGVzIHRoZSByZXN1bWUgaGFuZGxlciB0byByZXNldCB0aGUgY29udHJv
bGxlciBhZnRlciBlbmFibGluZwp0aGUgY2xvY2tzIHRvIG1hdGNoIHRoZSBwcm9iZSBzZXF1ZW5j
ZS4gSXQgYWxzbyBzd2l0Y2hlcyByZW5lc2FzX2kzY19yZXNldCgpCnRvIHVzZSByZWFkX3BvbGxf
dGltZW91dF9hdG9taWMoKSBzaW5jZSB0aGUgcmVzdW1lIGNhbGxiYWNrIHJ1bnMgaW4gdGhlIG5v
aXJxCnBoYXNlLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyL3JlbmVzYXMtaTNj
LmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvcmVuZXNhcy1pM2MuYwo+IGluZGV4IDUxN2FjMmRmOWJk
NDAuLjY1OTBkYTk2MjU5MmEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9pM2MvbWFzdGVyL3JlbmVz
YXMtaTNjLmMKPiArKysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvcmVuZXNhcy1pM2MuYwpbIC4uLiBd
Cj4gQEAgLTE0ODMsNiArMTQ4MywxMCBAQCBzdGF0aWMgaW50IHJlbmVzYXNfaTNjX3Jlc3VtZV9u
b2lycShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gIAlpZiAocmV0KQo+ICAJCWdvdG8gZXJyX3ByZXNl
dG47Cj4gIAo+ICsJcmV0ID0gcmVuZXNhc19pM2NfcmVzZXQoaTNjKTsKPiArCWlmIChyZXQpCj4g
KwkJZ290byBlcnJfY2xrc19kaXNhYmxlOwo+ICsKCltTZXZlcml0eTogSGlnaF0KVGhpcyBpc24n
dCBhIGJ1ZyBpbnRyb2R1Y2VkIGJ5IHRoaXMgcGF0Y2gsIGJ1dCBkb2VzIHRoZSBzZXF1ZW5jZSBp
bgpyZW5lc2FzX2kzY19yZXN1bWVfbm9pcnEoKSBjb3JyZWN0bHkgaGFuZGxlIGhhcmR3YXJlIGNv
bnN0cmFpbnRzPwoKTG9va2luZyBhdCB0aGUgY29kZSBqdXN0IGFib3ZlIHRoaXMgaHVuaywgdGhl
IHJlc2V0cyBhcmUgZGVhc3NlcnRlZApiZWZvcmUgdGhlIGNsb2NrcyBhcmUgZW5hYmxlZDoKCgly
ZXQgPSByZXNldF9jb250cm9sX2RlYXNzZXJ0KGkzYy0+dHJlc2V0bik7CglpZiAocmV0KQoJCXJl
dHVybiByZXQ7CgoJcmV0ID0gcmVzZXRfY29udHJvbF9kZWFzc2VydChpM2MtPnByZXNldG4pOwoJ
aWYgKHJldCkKCQlnb3RvIGVycl90cmVzZXRuOwoKCXJldCA9IGNsa19idWxrX2VuYWJsZShpM2Mt
Pm51bV9jbGtzLCBpM2MtPmNsa3MpOwoKRGVhc3NlcnRpbmcgcGVyaXBoZXJhbCByZXNldHMgd2hp
bGUgaXRzIGNsb2NrcyBhcmUgZGlzYWJsZWQgY2FuIGNhdXNlIHRoZQpoYXJkd2FyZSB0byByZW1h
aW4gc3R1Y2sgaW4gcmVzZXQgb3IgZW50ZXIgYW4gdW5kZWZpbmVkLCBub24tZnVuY3Rpb25hbApz
dGF0ZSB3aGVuIHRoZSBjbG9ja3MgYXJlIHN1YnNlcXVlbnRseSBlbmFibGVkLiBDb3VsZCB0aGlz
IGxlYXZlIHRoZSBJM0MKbWFzdGVyIHVucmVzcG9uc2l2ZSBhZnRlciByZXN1bWU/Cgo+ICAJLyog
UmUtc3RvcmUgSTNDIHJlZ2lzdGVycyB2YWx1ZS4gKi8KPiAgCXJlbmVzYXNfd3JpdGVsKGkzYy0+
cmVncywgU1REQlIsIGkzYy0+aTNjX1NUREJSKTsKPiAgCXJlbmVzYXNfd3JpdGVsKGkzYy0+cmVn
cywgRVhUQlIsIGkzYy0+ZXh0YnIpOwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8v
c2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDcxMzEzMDU0NS41Njg2NTctMS1jbGF1ZGl1LmJl
em5lYStyZW5lc2FzQHR1eG9uLmRldj9wYXJ0PTUKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0
CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
