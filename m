Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E11C55182
	for <linux-i3c@archiver.kernel.org>; Mon,  3 Aug 2026 14:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RIz+6FS70DKzJGO+ZoZcEd2rzwSDpuIN2qWe7qznSvY=; b=N1iMXHjozUcbyS
	BEoZfj+zO8Ngl6ptZOQeNJ4+FkzQOMeMFRY5oJ8B+BipM0i/xpyBGNenQJ5s0ljjkRsmWS0wBQTBF
	sfhbgf3G+z5HiLJRPhGhmFU2rbiBDW1wL1ddcxh8NLamP1L5OdXzPHF5f5PvqtFPlqDJHFgj++SWN
	Sj3z4415X6Mvjx1v00H4MX4JdggAEXv2Eqkggglx6UnL6UX8Brg+5iL8VEQVZVoxraJsRa1NUXPnC
	XtSwcq7Qs1XIUGduDvZd4pf5P6iMoV0D1xBOw3BolZAsh3ZAOG+u/q0VoIMXQW11UlOWAhQpQIRav
	1v9f0rdHTnVrJtYTIh7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtih-0000000HOhP-0Esn;
	Mon, 03 Aug 2026 14:32:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtif-0000000HOhI-3fJy
	for linux-i3c@lists.infradead.org;
	Mon, 03 Aug 2026 14:32:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 218A4402B0;
	Mon,  3 Aug 2026 14:32:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA0651F000E9;
	Mon,  3 Aug 2026 14:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785767565;
	bh=nzpfoDa7dEUHepoHncyEt2nNbNXbcNPdaqnmkstPvaE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iirWkkOk732N+SkARB+hR2HoH1+jnEKedM8vIY5TW/pnT4Qo6qrxZzjESlWz2tZPn
	 /0T/E/2S37dKcPuKSTkfCDzjcPvXaDig9LrsGFqiQEZ/mVHqNuedVfZ/29SRwbqIWg
	 0ISiIpL8UXy2MwCXnMFaba+BgqKGK7SlMT07/dbukLZYmLbfeAV2tdnQ1dBlqaDIeH
	 hLa5ghBiv2ISGlKFQPBHf5WQzAW2o7C8W+Mirecz+94twVIBalbir8nkxdRQ9putIP
	 cEWhI4KhF6wwAT5ocGMHn2JFDaaUvmQQvGVqDBYW4Tmz/KNJvbhz8wTpgwB11HEGnN
	 SC44n2Ap1vu5g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] i3c: dw: fix APB clock name
To: "Jisheng Zhang" <jszhang@kernel.org>
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, conor+dt@kernel.org, linux-i3c@lists.infradead.org, Frank.Li@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260803140224.12648-1-jszhang@kernel.org>
References: <20260803140224.12648-1-jszhang@kernel.org>
Date: Mon, 03 Aug 2026 14:32:41 +0000
Message-Id: <20260803143244.BA0651F000E9@smtp.kernel.org>
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
IFtIaWdoXSBUaGlzIHByb2JsZW0gd2Fzbid0IGludHJvZHVjZWQgYnkgdGhpcyBwYXRjaCwgYnV0
IHRoZSByZXR1cm4gdmFsdWUgb2YgYGR3X2kzY19tYXN0ZXJfZW5hYmxlX2Nsa3MoKWAgaXMgaWdu
b3JlZCBpbiBgZHdfaTNjX21hc3Rlcl9ydW50aW1lX3Jlc3VtZSgpYC4KLS0KCi0tLSBQYXRjaCBb
MV06IFtQQVRDSF0gaTNjOiBkdzogZml4IEFQQiBjbG9jayBuYW1lIC0tLQpjb21taXQgNjg2ODky
YTdmOTI3ODk1ODgyN2I3OWM2ZjNiNGIxMGYxOWE2MjNiMgpBdXRob3I6IEppc2hlbmcgWmhhbmcg
PGpzemhhbmdAa2VybmVsLm9yZz4KCmkzYzogZHc6IGZpeCBBUEIgY2xvY2sgbmFtZQoKVGhpcyBj
b21taXQgZml4ZXMgYSBtaXNtYXRjaCBiZXR3ZWVuIHRoZSBBUEIgY2xvY2sgbmFtZSBpbiB0aGUg
Y29kZSBhbmQgdGhlCmRldmljZSB0cmVlIGJpbmRpbmdzLiBJdCBjaGFuZ2VzIHRoZSBjbG9jayBu
YW1lIHJlcXVlc3RlZCBieSB0aGUgZHJpdmVyIGZyb20KcGNsayB0byBhcGIgdG8gbWF0Y2ggdGhl
IEFCSS4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci9kdy1pM2MtbWFzdGVyLmMg
Yi9kcml2ZXJzL2kzYy9tYXN0ZXIvZHctaTNjLW1hc3Rlci5jCj4gaW5kZXggMmY4YzBjNDY4M2Uw
Ni4uMDYyNTU4N2YxNTI3NCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIvZHctaTNj
LW1hc3Rlci5jCj4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyL2R3LWkzYy1tYXN0ZXIuYwo+IEBA
IC0xNTc5LDcgKzE1NzksNyBAQCBpbnQgZHdfaTNjX2NvbW1vbl9wcm9iZShzdHJ1Y3QgZHdfaTNj
X21hc3RlciAqbWFzdGVyLAo+ICAJaWYgKElTX0VSUihtYXN0ZXItPmNvcmVfY2xrKSkKPiAgCQly
ZXR1cm4gUFRSX0VSUihtYXN0ZXItPmNvcmVfY2xrKTsKPiAgCj4gLQltYXN0ZXItPnBjbGsgPSBk
ZXZtX2Nsa19nZXRfb3B0aW9uYWxfZW5hYmxlZCgmcGRldi0+ZGV2LCAicGNsayIpOwo+ICsJbWFz
dGVyLT5wY2xrID0gZGV2bV9jbGtfZ2V0X29wdGlvbmFsX2VuYWJsZWQoJnBkZXYtPmRldiwgImFw
YiIpOwoKW1NldmVyaXR5OiBIaWdoXQpUaGlzIGlzbid0IGEgYnVnIGludHJvZHVjZWQgYnkgdGhp
cyBwYXRjaCwgYnV0IHNpbmNlIHdlIGFyZSBtb2RpZnlpbmcgY2xvY2sKaGFuZGxpbmcgaGVyZSwg
ZG9lcyBkd19pM2NfbWFzdGVyX3J1bnRpbWVfcmVzdW1lKCkgbmVlZCB0byBjaGVjayB0aGUgcmV0
dXJuCnZhbHVlIG9mIGR3X2kzY19tYXN0ZXJfZW5hYmxlX2Nsa3MoKT8KCkluIGRyaXZlcnMvaTNj
L21hc3Rlci9kdy1pM2MtbWFzdGVyLmM6ZHdfaTNjX21hc3Rlcl9ydW50aW1lX3Jlc3VtZSgpOgoK
CXBpbmN0cmxfcG1fc2VsZWN0X2RlZmF1bHRfc3RhdGUoZGV2KTsKCWR3X2kzY19tYXN0ZXJfZW5h
YmxlX2Nsa3MobWFzdGVyKTsKCXJlc2V0X2NvbnRyb2xfZGVhc3NlcnQobWFzdGVyLT5jb3JlX3Jz
dCk7CgpJZiB0aGUgY2xvY2sgZnJhbWV3b3JrIGZhaWxzIHRvIGVuYWJsZSB0aGUgY2xvY2tzIGR1
cmluZyBydW50aW1lIHJlc3VtZSwKZHdfaTNjX21hc3Rlcl9lbmFibGVfY2xrcygpIHdpbGwgcmV0
dXJuIGEgbmVnYXRpdmUgZXJyb3IgY29kZS4gVGhpcyBpcwpjdXJyZW50bHkgaWdub3JlZCwgYW5k
IHRoZSBkcml2ZXIgcHJvY2VlZHMgdG8gZGVhc3NlcnQgdGhlIHJlc2V0IGFuZCBhY2Nlc3MKaGFy
ZHdhcmUgcmVnaXN0ZXJzLiAKCkNhbiB0aGlzIGxlYWQgdG8gYW4gdW5yZWNvdmVyYWJsZSBidXMg
ZmF1bHQgb3Igc3lzdGVtIGNyYXNoIGlmIHRoZSByZWdpc3RlcnMKYXJlIGFjY2Vzc2VkIHdpdGhv
dXQgYW4gYWN0aXZlIGNsb2NrPwoKPiAgCWlmIChJU19FUlIobWFzdGVyLT5wY2xrKSkKPiAgCQly
ZXR1cm4gUFRSX0VSUihtYXN0ZXItPnBjbGspOwo+CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcg
aHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwODAzMTQwMjI0LjEyNjQ4LTEtanN6
aGFuZ0BrZXJuZWwub3JnP3BhcnQ9MQoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgt
aTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1pM2MK
