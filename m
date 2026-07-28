Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED790C53219
	for <linux-i3c@archiver.kernel.org>; Tue, 28 Jul 2026 07:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7sccQusHp0j2lF9VIkSEn5lAplZEMV7wMWtpmV8qMxs=; b=T7f6OFRjUMjaZk
	K7Ij9WMnh86bwsNyj57BXOFAYdMdbTaEFCCPWNBzCvbA6zXokdILVWxBA0m2Mq6501tl70XkgQuzq
	edE7axHGzI2QG+g7m/NwCv01at8bw32VSDnhDMUA4Ij3vRHtfJEYZz+i0UgIRJ4FvQpoH9EihAGKa
	YQqN50aWnZyn2QFFZsw4eFZvwirbn0R76vDqCKvEq0bOdpycsy/z7AHLFvNzYKlGuI9HOO418G3Rm
	WDxuIqeugkjgb2ji4AWbR+UFw9VMgbvo8YLrr3A/U86Yr/qgzzZDwaU7ftvjQCRb41f5cG9oQspOG
	tZGDghSAWRAcxNNKwFlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woc60-00000004csp-2XwP;
	Tue, 28 Jul 2026 07:19:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woc60-00000004csV-0ZJ0
	for linux-i3c@lists.infradead.org;
	Tue, 28 Jul 2026 07:19:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E04CA40612;
	Tue, 28 Jul 2026 07:19:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EC361F00A3D;
	Tue, 28 Jul 2026 07:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785223163;
	bh=BupQScWeuFpJY913ZAydOTcxRX0VNfdyZHsAKeY3uRI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OOguL1AD27oSOI2Gc3iHcNNQkekXsmfSBgEDX/XqXvEuUwX17Oj9b9Nf6c/ZKVRSr
	 mbDfESM5eVLlpQOxk6+tpsa6ksMwDrQeOUmL3jo8sevkr1pGOJCCpl8X9fixYTnTMh
	 37DRDX38AMcediA74HKpc5g+m0slxDjWHy1E/HFBUPULZTpkOATjCgfmu4qfGgo/mL
	 skrv2Ostr4+7QESYJtLaWhu+a1XBLg18gujZMxh6x4yy4TOCRbMU4u43ACuQLlfJTW
	 /IAgBlwLzF/N95XoDMnkm2tpYJI+zjWPDAI5AjADYCmNyxPKhbtLi+EVAOAcbXbdF1
	 CdqCfgn8IEM7Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 09/12] i3c: dw-i3c-master: Add ACPI ID for Tegra410
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: linux-i3c@lists.infradead.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, conor+dt@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260728065955.809445-10-akhilrajeev@nvidia.com>
References: <20260728065955.809445-1-akhilrajeev@nvidia.com>
 <20260728065955.809445-10-akhilrajeev@nvidia.com>
Date: Tue, 28 Jul 2026 07:19:22 +0000
Message-Id: <20260728071923.2EC361F00A3D@smtp.kernel.org>
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
IFtIaWdoXSBQb2ludGVyIGFkZHJlc3MgYXNzaWduZWQgdG8gYW4gaW50ZWdlciBiaXRtYXNrIHZh
cmlhYmxlIGZvciBxdWlya3MgdW5kZXIgQUNQSSBQUlAwMDAxIG1hdGNoaW5nLgotLQoKLS0tIFBh
dGNoIFs5XTogW1BBVENIIHY3IDA5LzEyXSBpM2M6IGR3LWkzYy1tYXN0ZXI6IEFkZCBBQ1BJIElE
IGZvciBUZWdyYTQxMCAtLS0KY29tbWl0IDRiMjY1OWNhMjA0Nzk0NmUyMzgxNzliNWRhOTQ0MDdj
YmQ0OWZmYTIKQXV0aG9yOiBBa2hpbCBSIDxha2hpbHJhamVldkBudmlkaWEuY29tPgoKaTNjOiBk
dy1pM2MtbWFzdGVyOiBBZGQgQUNQSSBJRCBmb3IgVGVncmE0MTAKICAgIApVcGRhdGUgdmFyaWFi
bGUgbmFtZXMgdG8gZ2VuZXJpYyBuYW1lcyBhbmQgYWRkIFRlZ3JhNDEwIEFDUEkgSUQgdG8Kc3Vw
cG9ydCB0aGUgSTNDIGNvbnRyb2xsZXIgaW4gVGVncmE0MTAsIHdoaWNoIGlzIGEgRGVzaWduV2Fy
ZSBJM0MgaG9zdApjb250cm9sbGVyLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFzdGVy
L2R3LWkzYy1tYXN0ZXIuYyBiL2RyaXZlcnMvaTNjL21hc3Rlci9kdy1pM2MtbWFzdGVyLmMKPiBp
bmRleCAyNzNkN2EwMDIwOTkzLi4xMjA2OWFhNTZmYWQ4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
aTNjL21hc3Rlci9kdy1pM2MtbWFzdGVyLmMKPiArKysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvZHct
aTNjLW1hc3Rlci5jCj4gQEAgLTE4NTUsMTEgKzE4NTUsMTIgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBvZl9kZXZpY2VfaWQgZHdfaTNjX21hc3Rlcl9vZl9tYXRjaFtdID0gewo+ICB9Owo+ICBNT0RV
TEVfREVWSUNFX1RBQkxFKG9mLCBkd19pM2NfbWFzdGVyX29mX21hdGNoKTsKPiAgCj4gLXN0YXRp
YyBjb25zdCBzdHJ1Y3QgYWNwaV9kZXZpY2VfaWQgYW1kX2kzY19kZXZpY2VfbWF0Y2hbXSA9IHsK
PiArc3RhdGljIGNvbnN0IHN0cnVjdCBhY3BpX2RldmljZV9pZCBkd19pM2NfbWFzdGVyX2FjcGlf
bWF0Y2hbXSA9IHsKPiAgCXsgIkFNREkwMDE1IiwgQU1EX0kzQ19PRF9QUF9USU1JTkcgfSwKPiAr
CXsgIk5WREEyMDE4IiwgRFdfSTNDX0FDUElfU0tJUF9DTEtfUlNUIH0sCj4gIAl7IH0KPiAgfTsK
CltTZXZlcml0eTogSGlnaF0KVGhpcyBpcyBhIHByZS1leGlzdGluZyBpc3N1ZSwgYnV0IGRvZXMg
ZHdfaTNjX2NvbW1vbl9wcm9iZSgpIGltcHJvcGVybHkgY2FzdApwb2ludGVycyB0byBpbnRlZ2Vy
IGJpdG1hc2tzIHVuZGVyIEFDUEkgUFJQMDAwMSBtYXRjaGluZz8KCklmIGEgc3lzdGVtIHVzZXMg
dGhlIEFDUEkgUFJQMDAwMSBISUQgYWxvbmdzaWRlIHRoZSAiYWx0cixhZ2lsZXg1LWR3LWkzYy1t
YXN0ZXIiCmNvbXBhdGlibGUgc3RyaW5nLCBkZXZpY2VfZ2V0X21hdGNoX2RhdGEoKSB3aWxsIHJl
dHVybiBhIHBvaW50ZXIgdG8KYWx0cl9hZ2lsZXg1X2RydmRhdGEuCgpCZWNhdXNlIHRoZSBkZXZp
Y2UgaGFzIGFuIEFDUEkgY29tcGFuaW9uLCB0aGUgcHJvYmUgZnVuY3Rpb24gcHJvY2Vzc2VzIGl0
IGxpa2UKdGhpczoKCmRyaXZlcnMvaTNjL21hc3Rlci9kdy1pM2MtbWFzdGVyLmM6ZHdfaTNjX2Nv
bW1vbl9wcm9iZSgpIHsKICAgIC4uLgoJaWYgKGhhc19hY3BpX2NvbXBhbmlvbigmcGRldi0+ZGV2
KSkgewoJCXF1aXJrcyA9ICh1bnNpZ25lZCBsb25nKWRldmljZV9nZXRfbWF0Y2hfZGF0YSgmcGRl
di0+ZGV2KTsKCX0gZWxzZSBpZiAocGRldi0+ZGV2Lm9mX25vZGUpIHsKICAgIC4uLgp9CgpXaWxs
IHRoaXMgY2F1c2UgdGhlIG1lbW9yeSBhZGRyZXNzIG9mIGFsdHJfYWdpbGV4NV9kcnZkYXRhIHRv
IGJlIGNhc3QgZGlyZWN0bHkKdG8gYW4gaW50ZWdlciBiaXRtYXNrLCByZXN1bHRpbmcgaW4gcmFu
ZG9tIHF1aXJrcyBiZWluZyBhY3RpdmF0ZWQgYmFzZWQgb24KbWVtb3J5IGFsaWdubWVudCAoZS5n
LiwgZmFsc2VseSBhcHBseWluZyBEV19JM0NfQUNQSV9TS0lQX0NMS19SU1Qgb3IKRFdfSTNDX0RJ
U0FCTEVfUlVOVElNRV9QTV9RVUlSSyk/CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6
Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNzI4MDY1OTU1LjgwOTQ0NS0xLWFraGlscmFq
ZWV2QG52aWRpYS5jb20/cGFydD05CgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1p
M2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWkzYwo=
