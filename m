Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C3ACD98F0
	for <linux-i3c@archiver.kernel.org>; Wed, 17 Jun 2026 11:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f3DEAgrwcuG1I2cw+SiokvdOERDgQi8Wn0kQbR7wwv4=; b=PHCuU3b3j6dGNu
	ZrUsEcw0aljXkfLqO6kMz31zTGbC24ekW2sl1qRiIAK8NyWbQdXGv3rUCSmNALdYno/D/B5qVBVnz
	aONL47CrABVNCWSFwbNccU0wNZPByBSC9gdJY1wDVRunC2A1uPOFOTchxiuT4WFkgzpf0/4JsV7on
	WIm1TjZJ9yne1muPFYbcYcQ616Kj1RiQ0b3vF8P3QMCpwHEI58hspUL3T/HUSwgYl4Ashe1CMKUM9
	Il4NW/J/5zPFP0uikg4ts60024UxFx4M7NN14yeCLH+0w7ahFkfECVp62/0UXg0iPVl2I2W+txvgg
	q5hOzYQ0sa8b7o/6eJ2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZoOB-0000000HE6M-26tJ;
	Wed, 17 Jun 2026 11:24:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZoOA-0000000HE6B-0iTp
	for linux-i3c@lists.infradead.org;
	Wed, 17 Jun 2026 11:24:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BE218439A4;
	Wed, 17 Jun 2026 11:24:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5773E1F000E9;
	Wed, 17 Jun 2026 11:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781695497;
	bh=DrgRXswN9gowQ21ag0rmVRzpXIIR022S13w6JYDKPBU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G0VfgQcGtZMdAVQnYO5ByroW3Gmxu1X3++LCyAuxWklVUIoxmhhkMWKDMqyzaN5/U
	 AByVT93oSy7o84brkYznTum6Ktb+iAcCzzwtqJxlgs5j0qcQJb7qWFLKKujAEs9KCh
	 dGyYZxQwjQEE1ThxoMWc/y7t9pV7oE7pJ0KEOz8L7/s1ovHutHLWmNpXYB250C/xCH
	 X7I0dQr53AdETOnfekoOZcbUF+a0k7rSDVvmRikj+/KBlHTDMpsJBCUXWfMs48QhZL
	 CvSOhs2Yq/R4TteIqrKbDv7sdqGb0yeoNq+whpbBKmq+EVJmYimzQx99gemkQkNrp9
	 Hpnzkn4hYyyBw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 3/7] mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c
 hub and on-die regulator
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: Frank.Li@kernel.org, linux-i3c@lists.infradead.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260617110355.1591844-4-lakshay.piplani@nxp.com>
References: <20260617110355.1591844-1-lakshay.piplani@nxp.com>
 <20260617110355.1591844-4-lakshay.piplani@nxp.com>
Date: Wed, 17 Jun 2026 11:24:56 +0000
Message-Id: <20260617112457.5773E1F000E9@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIFRoZSBJM0MgZHJpdmVy
IGluY29ycmVjdGx5IGJpbmRzIHRvIGFueSBnZW5lcmljIEkzQyBIdWIgaW5zdGVhZCBvZiBzcGVj
aWZpY2FsbHkgdG8gTlhQIFAzSDJ4NHggZGV2aWNlcy4KLS0KCmNvbW1pdCBlM2Y4NjEzYWJhODk3
ZjY0ZGYzNmFkMTU5YmFkZTBjZjBlMGM1Y2YxCkF1dGhvcjogQW1hbiBLdW1hciBQYW5kZXkgPGFt
YW4ua3VtYXJwYW5kZXlAbnhwLmNvbT4KCm1mZDogcDNoMng0eDogQWRkIGRyaXZlciBmb3IgTlhQ
IFAzSDJ4NHggaTNjIGh1YiBhbmQgb24tZGllIHJlZ3VsYXRvcgoKVGhpcyBjb21taXQgYWRkcyBj
b3JlIE1GRCBzdXBwb3J0IGZvciB0aGUgTlhQIFAzSDJ4NHggZmFtaWx5IG9mIG11bHRpcG9ydApJ
M0MgaHViIGRldmljZXMuIEl0IHJlZ2lzdGVycyB0aGUgZGV2aWNlcyB2aWEgSTNDL0kyQy9TTUJ1
cyBhbmQgZXhwb3NlcwptdWx0aXBsZSBkb3duc3RyZWFtIHRhcmdldCBwb3J0cyBhbmQgYW4gb24t
ZGllIHJlZ3VsYXRvci4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWZkL3AzaDI4NDAuYyBiL2Ry
aXZlcnMvbWZkL3AzaDI4NDAuYwo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAw
MDAwMDAwMC4uMGE4MDk5MmQ2MjUwYQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9kcml2ZXJzL21m
ZC9wM2gyODQwLmMKWyAuLi4gXQo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGkzY19kZXZpY2VfaWQg
cDNoMng0eF9pM2NfaWRzW10gPSB7Cj4gKwlJM0NfQ0xBU1MoSTNDX0RDUl9IVUIsIE5VTEwpLAoK
W1NldmVyaXR5OiBIaWdoXQpEb2VzIHRoaXMgbWF0Y2ggdGFibGUgaW5hcHByb3ByaWF0ZWx5IGJp
bmQgdGhlIGRyaXZlciB0byBhbnkgZ2VuZXJpYyBJM0MgSHViCmluc3RlYWQgb2Ygc3BlY2lmaWNh
bGx5IE5YUCBQM0gyeDR4IGRldmljZXM/CgpTaW5jZSBwM2gyeDR4X2RldmljZV9wcm9iZV9pM2Mo
KSBkb2VzIG5vdCBwZXJmb3JtIG1hbnVmYWN0dXJlciBvciBwYXJ0IElECnZhbGlkYXRpb24sIGNv
dWxkIHRoaXMgY2xhaW0gbm9uLU5YUCBodWJzIGFuZCBjYXVzZSBjaGlsZCBkcml2ZXJzIHRvIHNl
bmQKcHJvcHJpZXRhcnkgTlhQIHJlZ2lzdGVyIHNlcXVlbmNlcyB0byB0aGVtPwoKU2hvdWxkIHRo
aXMgdXNlIHRoZSBJM0NfREVWSUNFKCkgbWFjcm8gd2l0aCBNSVBJX1ZFTkRPUl9JRF9OWFAgaW5z
dGVhZD8KCj4gKwl7IC8qIHNlbnRpbmVsICovIH0sCj4gK307Cj4gK01PRFVMRV9ERVZJQ0VfVEFC
TEUoaTNjLCBwM2gyeDR4X2kzY19pZHMpOwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBz
Oi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDYxNzExMDM1NS4xNTkxODQ0LTEtbGFrc2hh
eS5waXBsYW5pQG54cC5jb20/cGFydD0zCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51
eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
