Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEEA6CA5FA1
	for <linux-i3c@archiver.kernel.org>; Tue, 29 Sep 2026 06:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CjKuDcwd9I1B/IGhMa1ZgYHtGd+a1j6lRMrEJKYH+As=; b=ubKnXitrmG9rLy
	TnOvcx8FSFG23nDPxYtXgib2Y560EvAQuyPVfcBRlhL57DJEnIMC2rFv7i4jCWZ2TW0BId3f6Jm0w
	+LNxEOvXnN0T01YImDph0QRdZOUsrteiPUMI2G96lkunNTR86l/O35zVvNZv4pure8aT7q32vSt2H
	FKYAvDk4y5HnkJTHq5LncGvApsOZWPToRHrxxENqT+Ezhfj9bdHLxlBCailq2+fFgnPvHVNteeAQh
	PK3ufiE8vmsQal12ZSVuRFBlqC1vGpGiMkPldfibYFjLwEx+DleDcDbS0Sc9rXQrvkQ6UxShKdjaS
	fbHr1Cc89tmOX9VkjT0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRfU-00000002Wu1-1LJF;
	Tue, 29 Sep 2026 06:50:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRfS-00000002Wts-2Dpa
	for linux-i3c@lists.infradead.org;
	Tue, 29 Sep 2026 06:50:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1D749434E2;
	Tue, 29 Sep 2026 06:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E2B11F000FF;
	Tue, 29 Sep 2026 06:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790664622;
	bh=3QNnYrmPWFJ3dHPbxUuYCkeu7U1ZSe+QYcoj8h3lGiA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HVVqwSIWMtVOJ0LtFWfhF6p7M6Y+WOAKiT4/cpSAqbIEkBXNP7tck/ohnsseOtgJC
	 Raul5dacReRH1qcsup5lXIAaVcOgbwdXtqJCTLm0Gze3sFjrBpyfV84TDxnu0/cKtS
	 o4ZyRp3k7E+MlHRLVZOf2yuV7t4PITN6GhOnzjUYyDfjTiIy0WCmQV9u0dJ3AndNW/
	 Y5n8SZqCNBQkwFtZmxmKVetOcjWPPBRfoV0SvhwkmZhEuZr7TiE/uC6OUvmUL6QcZn
	 tBkrUDDutmuDhvod43p02CemQ7X8rSgxmyn0WIxmhh1CgV2Ob5+No2+xvcak1M5AYA
	 Wf/a/NIzvRZbA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 16/20] clk: berlin: add Synaptics SL261X SoC clocks and
 plls
To: "Jisheng Zhang" <jszhang@kernel.org>
Cc: conor+dt@kernel.org, linux-serial@vger.kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, Frank.Li@kernel.org, linux-i3c@lists.infradead.org, mfd@lists.linux.dev, robh@kernel.org, linux-clk@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260929061417.20733-17-jszhang@kernel.org>
References: <20260929061417.20733-1-jszhang@kernel.org>
 <20260929061417.20733-17-jszhang@kernel.org>
Date: Tue, 29 Sep 2026 06:50:20 +0000
Message-Id: <20260929065021.5E2B11F000FF@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gY2xrOiBiZXJsaW46
IG1pc3NpbmcgLmRpc2FibGUgY2FsbGJhY2tzIGluIHN5c21nciBjbG9jayBvcGVyYXRpb25zCi0g
W0xvd10ga2J1aWxkOiBMaW5rZXIgZXJyb3IgZHVlIHRvIG1pc3NpbmcgS2NvbmZpZyBkZXBlbmRl
bmN5IGZvciBTTDI2MVhfUExMCi0tCgpjb21taXQgNTZkOTc2MDZjMmY2YmJiODhkNGEzNmE1Zjhi
MDZiODA3YzA1NTIzZApBdXRob3I6IEppc2hlbmcgWmhhbmcgPGpzemhhbmdAa2VybmVsLm9yZz4K
CmNsazogYmVybGluOiBhZGQgU3luYXB0aWNzIFNMMjYxWCBTb0MgY2xvY2tzIGFuZCBwbGxzCgpB
ZGQgc3VwcG9ydCBmb3IgY2xvY2tzLCBwbGxzIGluIFN5bmFwdGljcyBTTDI2MVggU29Dcy4KCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL2Jlcmxpbi9LY29uZmlnIGIvZHJpdmVycy9jbGsvYmVy
bGluL0tjb25maWcKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IC0tLSAvZGV2L251bGwKPiArKysg
Yi9kcml2ZXJzL2Nsay9iZXJsaW4vS2NvbmZpZwpbIC4uLiBdCj4gK2NvbmZpZyBTTDI2MVhfQ0xL
Cj4gKwl0cmlzdGF0ZSAiU3luYXB0aWNzIFNMMjYxWCBDbG9jayBEcml2ZXIiCj4gKwlkZXBlbmRz
IG9uIEFSQ0hfQkVSTElOIHx8IENPTVBJTEVfVEVTVAo+ICsJc2VsZWN0IFNMX0NPTU1PTl9DTEsK
PiArCXNlbGVjdCBTTF9TWVNNR1JfQ0xLCj4gKwlkZWZhdWx0IG4KCltTZXZlcml0eTogTG93XQpE
b2VzIHRoaXMgbWlzc2luZyBkZXBlbmRlbmN5IGxlYWQgdG8gYSBsaW5rZXIgZXJyb3I/IFRoZSBT
TDI2MVhfQ0xLIGNvbmZpZwpmYWlscyB0byBkZWNsYXJlIGEgZGVwZW5kZW5jeSBvciBzZWxlY3Qg
b24gU0wyNjFYX1BMTCwgYnV0IHRoZSBjbG9jayBkcml2ZXIKdW5jb25kaXRpb25hbGx5IGNhbGxz
IHNsMjYxeF9wbGxfcmVnaXN0ZXIoKSBkZWZpbmVkIGluIHRoZSBQTEwgZHJpdmVyLiBJZgpDT05G
SUdfU0wyNjFYX0NMSz15IGJ1dCBDT05GSUdfU0wyNjFYX1BMTD1uIG9yIG0sIHRoZSBidWlsZCB3
aWxsIGZhaWwgd2l0aCBhbgp1bmRlZmluZWQgcmVmZXJlbmNlLgoKWyAuLi4gXQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2Nsay9iZXJsaW4vc2wtc3lzbWdyLWNsay5jIGIvZHJpdmVycy9jbGsvYmVy
bGluL3NsLXN5c21nci1jbGsuYwo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gLS0tIC9kZXYvbnVs
bAo+ICsrKyBiL2RyaXZlcnMvY2xrL2Jlcmxpbi9zbC1zeXNtZ3ItY2xrLmMKWyAuLi4gXQo+ICtz
dGF0aWMgY29uc3Qgc3RydWN0IGNsa19vcHMgc2xfc3lzbWdyX2dhdGVjbGtfb3BzID0gewo+ICsJ
LmVuYWJsZQkJPSBzbF9zeXNtZ3JfZ2F0ZWNsa19lbmFibGUsCj4gKwkuaXNfZW5hYmxlZAk9IHNs
X3N5c21ncl9nYXRlY2xrX2lzX2VuYWJsZWQsCj4gK307CgpbU2V2ZXJpdHk6IE1lZGl1bV0KV2ls
bCB0aGlzIGxlYXZlIHRoZSBnYXRlIGNsb2NrcyBwZXJtYW5lbnRseSBlbmFibGVkPyBUaGUgb3Bz
IHN0cnVjdCBmb3IgZ2F0ZQpjbG9ja3MgaW1wbGVtZW50cyAuZW5hYmxlIHRvIHVuZ2F0ZSB0aGUg
Y2xvY2sgYnV0IG9taXRzIHRoZSAuZGlzYWJsZSBjYWxsYmFjay4KV2hlbiBhIGNvbnN1bWVyIGRy
aXZlciBjYWxscyBjbGtfZGlzYWJsZV91bnByZXBhcmUoKSwgdGhlIGNvbW1vbiBjbG9jawpmcmFt
ZXdvcmsgd2lsbCBzaWxlbnRseSBza2lwIHRoZSBoYXJkd2FyZSBvcGVyYXRpb24sIGxlYWtpbmcg
cG93ZXIuCgpbIC4uLiBdCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgY2xrX29wcyBzbF9zeXNtZ3Jf
Y2xrX29wcyA9IHsKPiArCS5yZWNhbGNfcmF0ZQk9IHNsX3N5c21ncl9jbGtfcmVjYWxjX3JhdGUs
Cj4gKwkuZW5hYmxlCQk9IHNsX3N5c21ncl9jbGtfZW5hYmxlLAo+ICsJLmlzX2VuYWJsZWQJPSBz
bF9zeXNtZ3JfY2xrX2lzX2VuYWJsZWQsCj4gK307CgpbU2V2ZXJpdHk6IE1lZGl1bV0KRG9lcyB0
aGlzIGhhdmUgdGhlIHNhbWUgaXNzdWUgd2l0aCBtaXNzaW5nIGRpc2FibGUgb3BlcmF0aW9ucz8g
VGhlIG9wcyBzdHJ1Y3QKZm9yIGRpdmlkZXIgY2xvY2tzIGltcGxlbWVudHMgLmVuYWJsZSBidXQg
YWxzbyBvbWl0cyB0aGUgLmRpc2FibGUgY2FsbGJhY2suCgpbIC4uLiBdCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvY2xrL2Jlcmxpbi9zbDI2MXgtY2xrcy5jIGIvZHJpdmVycy9jbGsvYmVybGluL3Ns
MjYxeC1jbGtzLmMKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IC0tLSAvZGV2L251bGwKPiArKysg
Yi9kcml2ZXJzL2Nsay9iZXJsaW4vc2wyNjF4LWNsa3MuYwpbIC4uLiBdCj4gK3N0YXRpYyBpbnQg
c2wyNjF4X3NvY19jbGtfc2V0dXAoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiArewpb
IC4uLiBdCj4gKwkvKiBzeXNwbGxzICovCj4gKwlyZXQgPSBzbDI2MXhfcGxsX3JlZ2lzdGVyKGRl
diwgYmFzZSArIFNZU1BMTDBfT0ZGU0VULAo+ICsJCQkJICBjbGtfbmFtZXNbU1lTUExMMF9PVVRd
LCBjbGtfbmFtZXNbU1lTUExMMF9PVVRGXSk7CgpbU2V2ZXJpdHk6IExvd10KVGhpcyBpcyB0aGUg
Y2FsbCB0byBzbDI2MXhfcGxsX3JlZ2lzdGVyKCkgbWVudGlvbmVkIGFib3ZlIHRoYXQgcmVxdWly
ZXMKU0wyNjFYX1BMTCB0byBiZSBzZWxlY3RlZCBvciBkZXBlbmRlZCBvbiBpbiBLY29uZmlnIHRv
IGF2b2lkIGxpbmtlciBlcnJvcnMuCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9z
YXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwOTI5MDYxNDE3LjIwNzMzLTEtanN6aGFuZ0BrZXJu
ZWwub3JnP3BhcnQ9MTYKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtaTNjCg==
