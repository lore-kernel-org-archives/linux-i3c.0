Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28462C9832A
	for <linux-i3c@archiver.kernel.org>; Tue, 29 Sep 2026 06:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GH+KfNv6OvylKmi3ERphTVIa9BAe1sbGvNegWlNZlac=; b=1KViKESiZIk9+z
	m9yKDea6Vzm5gjYwLU5RNhVAvXRnc9sEouC/kcv+J1zxRYpHSPc8n9UYPSAIQxPeATHNbNZ3z1xII
	r8ZTOfxgyFuFjab1HgIh1EjFpZeNJvbsn+vb+/QubkJZTa8Ha0jmkkVuGXSdM4erOR43uKjcLDG/i
	XwdpO3rswW1ZpLFMeCCFJuh+c3AZujiFkN/406dnecotVtLBT44grWprvDz+bVTUXre8qdVbi/q2L
	euVatQBf4bGsCzK6dESeU8f8s0Mn+avRIWkvrM2gzV966AfSrKo1vqZRlSRqrpfGuHBdRJygN4X/2
	immUR4eL/gbVZgeg2Thw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRcq-00000002Wcp-1qRS;
	Tue, 29 Sep 2026 06:47:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRcp-00000002Wcc-0Icm
	for linux-i3c@lists.infradead.org;
	Tue, 29 Sep 2026 06:47:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6E10B60210;
	Tue, 29 Sep 2026 06:47:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 931681F000FF;
	Tue, 29 Sep 2026 06:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790664458;
	bh=K8KuaxQckNe2MccofgXiA03iijp30ZSc0gaaENsMpaE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lkcA4PIpbWfmRv6WRLJqPZQfSeA06swsOct6a/cK+18FQk1GQTtULwg7ub/0rPAc8
	 b0P8As/BRCxOlwreaCiFlSLfD7TkMTjEAWZraquQ3xkTh+Z2qep9OeOSyQZ9i7cgkR
	 lV9VKDQOMawJdY9essOxXsX8bMb6vUnkgMCpWx43MFon0Z0YCI2oFuHl6xXjXdVOW1
	 Lykzlr9j2g1G+hbiU6M5oeF3B1rYxNCDbVX0juQVBQO5rC5PCTkDAeRcUZMP9Itf3i
	 r5nG2KC9/TUSE09CWDvhC5Z8TWuVs9nOdSn2PGQqfU+cUNH3q+C0f6nTRWGPxnUOYn
	 qfG96xpSC5d1g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 14/20] pinctrl: berlin: support Synaptics SL261X SoCs
To: "Jisheng Zhang" <jszhang@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-i3c@lists.infradead.org, conor+dt@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, robh@kernel.org, lee@kernel.org, Frank.Li@kernel.org, linux-serial@vger.kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260929061417.20733-15-jszhang@kernel.org>
References: <20260929061417.20733-1-jszhang@kernel.org>
 <20260929061417.20733-15-jszhang@kernel.org>
Date: Tue, 29 Sep 2026 06:47:37 +0000
Message-Id: <20260929064737.931681F000FF@smtp.kernel.org>
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
MyBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIHBpbmN0cmw6IHNsMjYx
eDogaW5jb3JyZWN0IG11bHRpcGxleGVyIHJlZ2lzdGVyIGJhc2Ugb2Zmc2V0IGZvciBTTV9HUElP
MjAKLSBbSGlnaF0gcGluY3RybDogc2wyNjF4OiBpbmNvcnJlY3QgY29uZmlndXJhdGlvbiByZWdp
c3RlciBvZmZzZXQgZm9yIEdQSU81NAotIFtMb3ddIHBpbmN0cmw6IHNsMjYxeDogbWlzbWF0Y2hl
ZCBjb21tZW50cyBmb3IgdWFydDEgcGluIGZ1bmN0aW9ucwotLQoKY29tbWl0IGZkNjk1NzJmMWJl
YzNkZjkxM2JlZmIxMjFkMmQ4ZDU2M2EwNGYxMGMKQXV0aG9yOiBKaXNoZW5nIFpoYW5nIDxqc3po
YW5nQGtlcm5lbC5vcmc+CgpwaW5jdHJsOiBiZXJsaW46IHN1cHBvcnQgU3luYXB0aWNzIFNMMjYx
WCBTb0NzCgpUaGlzIGNvbW1pdCBhZGRzIGEgbmV3IHBpbmN0cmwgZHJpdmVyIGZvciB0aGUgU3lu
YXB0aWNzIFNMMjYxWCBTb0NzLiBJdApkZWZpbmVzIHRoZSBwaW4gY29uZmlndXJhdGlvbiBncm91
cHMsIHJlZ2lzdGVyIG9mZnNldHMsIGFuZCBtdWx0aXBsZXhlcgpmdW5jdGlvbnMgZm9yIGJvdGgg
dGhlIG1haW4gU29DIGFuZCB0aGUgc3lzdGVtIG1hbmFnZXIgcGluIGNvbnRyb2xsZXIgYmxvY2tz
LgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9waW5jdHJsL2Jlcmxpbi9waW5jdHJsLXNsMjYxeC5j
IGIvZHJpdmVycy9waW5jdHJsL2Jlcmxpbi9waW5jdHJsLXNsMjYxeC5jCj4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvZHJpdmVycy9waW5jdHJsL2Jlcmxpbi9w
aW5jdHJsLXNsMjYxeC5jCgpbIC4uLiBdCgo+ICsJQkVSTElOX1BJTkNUUkxDT05GX0dST1VQKCJH
UElPNTMiLCAweDgwMGMsIDB4MywgMHgwMCwKPiArCQkJMHg4ODc4LCAxMCwKPiArCQkJQkVSTElO
X1BJTkNUUkxfRlVOQ1RJT04oMHgwLCAiZ3BpbyIpLCAvKiBHUElPNTMgKi8KPiArCQkJQkVSTElO
X1BJTkNUUkxfRlVOQ1RJT04oMHgxLCAicmdtaWkyIiksIC8qIFJEMSAqLwo+ICsJCQlCRVJMSU5f
UElOQ1RSTF9GVU5DVElPTigweDYsICJzcGk0IiksIC8qIFNTM24gKi8KPiArCQkJQkVSTElOX1BJ
TkNUUkxfRlVOQ1RJT04oMHg3LCAic3BpMyIpKSwgLyogU0NMSyAqLwo+ICsJQkVSTElOX1BJTkNU
UkxDT05GX0dST1VQKCJHUElPNTQiLCAweDgwMGMsIDB4MywgMHgwMywKPiArCQkJMHg4N2MsIDEw
LAoKW1NldmVyaXR5OiBIaWdoXQpJcyB0aGUgY29uZmlndXJhdGlvbiByZWdpc3RlciBvZmZzZXQg
Zm9yIEdQSU81NCBjb3JyZWN0IGhlcmU/IAoKVGhlIHN1cnJvdW5kaW5nIEdQSU8gY29uZmlndXJh
dGlvbnMgaW4gc2wyNjF4X3NvY19waW5jdHJsX2dyb3VwcyB1c2UgYSAweDg4MDAKYmFzZSAoZm9y
IGV4YW1wbGUsIEdQSU81MyB1c2VzIDB4ODg3OCBhbmQgR1BJTzU1IHVzZXMgMHg4ODgwKS4gRG9l
cyB0aGlzIGNvZGUKaW5jb3JyZWN0bHkgaGFyZGNvZGUgMHg4N2MgaW5zdGVhZCBvZiAweDg4N2Ms
IHBvdGVudGlhbGx5IGNhdXNpbmcgd3JpdGVzIHRvCnRoZSB3cm9uZyBoYXJkd2FyZSBhZGRyZXNz
IHdoZW4gY29uZmlndXJpbmcgcGlucz8KClsgLi4uIF0KCj4gKwlCRVJMSU5fUElOQ1RSTENPTkZf
R1JPVVAoIlNNX0dQSU8yMSIsIDB4YjA4LCAweDMsIDB4MGMsCj4gKwkJCTB4YzY4LCAxMCwKPiAr
CQkJQkVSTElOX1BJTkNUUkxfRlVOQ1RJT04oMHgwLCAiZ3BpbyIpLCAvKiBTTSBHUElPMjEgKi8K
PiArCQkJQkVSTElOX1BJTkNUUkxfRlVOQ1RJT04oMHgxLCAieHNwaSIpKSwgLyogU00gWFNQSSBE
QVRBMiAqLwo+ICsJQkVSTElOX1BJTkNUUkxDT05GX0dST1VQKCJTTV9HUElPMjAiLCAweDgsIDB4
MywgMHgwZiwKPiArCQkJMHhjNmMsIDEwLAoKW1NldmVyaXR5OiBIaWdoXQpEb2VzIHRoaXMgY29k
ZSB1c2UgdGhlIHdyb25nIG11bHRpcGxleGVyIHJlZ2lzdGVyIGJhc2Ugb2Zmc2V0IGZvciBTTV9H
UElPMjA/CgpTdXJyb3VuZGluZyBTTV9HUElPIGdyb3VwcyBpbiBzbDI2MXhfc3lzbWdyX3BpbmN0
cmxfZ3JvdXBzIChsaWtlIFNNX0dQSU8yMSBhbmQKU01fR1BJTzE5KSBjb3JyZWN0bHkgdXNlIDB4
YjA4LiBVc2luZyAweDggaGVyZSBjb3VsZCBjYXVzZSB0aGUgZHJpdmVyIHRvCndyaXRlIHRvIHRo
ZSB3cm9uZyBoYXJkd2FyZSBhZGRyZXNzIHdoZW4gYXBwbHlpbmcgcGlubXV4IHN0YXRlcy4KClsg
Li4uIF0KCj4gKwlCRVJMSU5fUElOQ1RSTENPTkZfR1JPVVAoIlNNX0dQSU84IiwgMHhiMGMsIDB4
MywgMHgwYywKPiArCQkJMHhjOTAsIDEwLAo+ICsJCQlCRVJMSU5fUElOQ1RSTF9GVU5DVElPTigw
eDAsICJncGlvIiksIC8qIFNNIEdQSU84ICovCj4gKwkJCUJFUkxJTl9QSU5DVFJMX0ZVTkNUSU9O
KDB4MSwgInVhcnQwIiksIC8qIFNNIFVBUlQwIFRYRCAqLwo+ICsJCQlCRVJMSU5fUElOQ1RSTF9G
VU5DVElPTigweDIsICJjYW4wIiksIC8qIFNNIENBTjAgVFggKi8KPiArCQkJQkVSTElOX1BJTkNU
UkxfRlVOQ1RJT04oMHgzLCAic21fY2xrb3V0IiksCj4gKwkJCUJFUkxJTl9QSU5DVFJMX0ZVTkNU
SU9OKDB4NiwgInVhcnQxIikpLCAvKiBTTSBVQVJUMCBUWEQgKi8KCltTZXZlcml0eTogTG93XQpU
aGlzIGlzbid0IGEgYnVnLCBidXQgdGhlIHRyYWlsaW5nIGNvbW1lbnQgZm9yIHVhcnQxIGluY29y
cmVjdGx5IGRvY3VtZW50cwp0aGUgcGluIGZ1bmN0aW9uYWxpdHkgYXMgU00gVUFSVDAgVFhELiBT
aG91bGQgdGhpcyBiZSBTTSBVQVJUMSBUWEQ/Cgo+ICsJQkVSTElOX1BJTkNUUkxDT05GX0dST1VQ
KCJTTV9HUElPNyIsIDB4YjBjLCAweDMsIDB4MGYsCj4gKwkJCTB4Yzk0LCAxMCwKPiArCQkJQkVS
TElOX1BJTkNUUkxfRlVOQ1RJT04oMHgwLCAiZ3BpbyIpLCAvKiBTTSBHUElPNyAqLwo+ICsJCQlC
RVJMSU5fUElOQ1RSTF9GVU5DVElPTigweDEsICJ1YXJ0MCIpLCAvKiBTTSBVQVJUMCBSWEQgKi8K
PiArCQkJQkVSTElOX1BJTkNUUkxfRlVOQ1RJT04oMHgyLCAiY2FuMCIpLCAvKiBTTSBDQU4wIFJY
ICovCj4gKwkJCUJFUkxJTl9QSU5DVFJMX0ZVTkNUSU9OKDB4MywgImtleV9yb3c2IiksCj4gKwkJ
CUJFUkxJTl9QSU5DVFJMX0ZVTkNUSU9OKDB4NCwgImdwaW9fdHJpZyIpLCAvKiBUUklHMiAqLwo+
ICsJCQlCRVJMSU5fUElOQ1RSTF9GVU5DVElPTigweDUsICJwd20iKSwgLyogU00gUFdNOSAqLwo+
ICsJCQlCRVJMSU5fUElOQ1RSTF9GVU5DVElPTigweDYsICJ1YXJ0MSIpKSwgLyogU00gVUFSVDAg
UlhEICovCgpbU2V2ZXJpdHk6IExvd10KVGhpcyBpc24ndCBhIGJ1ZywgYnV0IHRoZXJlIGFwcGVh
cnMgdG8gYmUgYSBzaW1pbGFyIGNvcHktcGFzdGUgZXJyb3IgaGVyZS4KU2hvdWxkIHRoaXMgdHJh
aWxpbmcgY29tbWVudCBiZSBsYWJlbGVkIGFzIFNNIFVBUlQxIFJYRD8KCi0tIApTYXNoaWtvIEFJ
IHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA5MjkwNjE0MTcu
MjA3MzMtMS1qc3poYW5nQGtlcm5lbC5vcmc/cGFydD0xNAoKLS0gCmxpbnV4LWkzYyBtYWlsaW5n
IGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
