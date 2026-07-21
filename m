Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12491C4451C
	for <linux-i3c@archiver.kernel.org>; Tue, 21 Jul 2026 04:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yNkEfoj78uwJtzBu+qGCwsxANPn4z8cyEWn0ZVrrAKk=; b=A9EhGrnTczBEL5
	00CDih/E/cUq5D9NqS+gi6cKG60/+y32osONn+MyNXfZu7auUEh7ZK2HCYZCpuww7RoO6KeNIo+nI
	7+pTSe6qDVsFHtG33YfnoM/dk0pJ3hWYTP2Cg6v9FoISCcnFONJ4s4dOCO8QNT38qQZdbk3xeg0FC
	HBldkpbK8EMmRefQj9n90SrMFJrk99LQRlTzgrgZ5WxJq2C+eeUPVwKsTBdHa7luzoxtQZz+BCgOD
	Wt94UmeeZUqCMwXB6qraYSnpj0uGtQZ5xdo/+UY7rnfP2dZT+gBe6ouKAf/Rkjc9PQCMWva4kC6EB
	YN32qtnl58G3bLDJzgdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm20U-00000008NWL-1EDT;
	Tue, 21 Jul 2026 04:23:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm20S-00000008NWB-2sJL
	for linux-i3c@lists.infradead.org;
	Tue, 21 Jul 2026 04:23:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 19328400FF;
	Tue, 21 Jul 2026 04:23:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80FA81F000E9;
	Tue, 21 Jul 2026 04:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784607780;
	bh=PWvM2MmnmbgbH+IBz0d4aWyaYJD3egvzO6jQPMvTRaI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GIjUc+Z7Vk8uiOjaQooqzvrgI5gTV0Xcg02T9emi2xnUfcP7W8sqdBp7Ip6zRxP8x
	 oHBfvCxdq3zxPz3fd0Yso0mbs3DbMLVQTZ1eiDxzj0KZXXmvhLhQ1+90hOL9a4XepP
	 j2TYxiEbw2SCZoBuW0uoaE2NdgKYs5ziomXQMDJwYcwuhwStwOgzvtJFI4PEIk4and
	 RZCXPIzwrNDGUsxrIf/oTDEZQkjLMV/u1Xh7b0j/1LLzRa31eaQlAYeyH6pU7mVsht
	 eBIImQ6ddkrap6shRg16Uc0qEczj0/I4F7/nY/sDcthr6S4BOIlV8nZ3LP7K48XIU2
	 bx0onIDq4ifbQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 09/12] i3c: dw-i3c-master: Add ACPI ID for Tegra410
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-i3c@lists.infradead.org, Frank.Li@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, robh@kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260721040805.1696503-10-akhilrajeev@nvidia.com>
References: <20260721040805.1696503-1-akhilrajeev@nvidia.com>
 <20260721040805.1696503-10-akhilrajeev@nvidia.com>
Date: Tue, 21 Jul 2026 04:22:59 +0000
Message-Id: <20260721042259.80FA81F000E9@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpQcmUtZXhpc3RpbmcgaXNzdWVzOgot
IFtIaWdoXSBVbnNhZmUgcG9pbnRlciBjYXN0IG9mIGRldmljZV9nZXRfbWF0Y2hfZGF0YSgpIHJl
dHVybiB2YWx1ZSB3aGVuIGJpbmRpbmcgdmlhIEFDUEkgUFJQMDAwMS4KLSBbSGlnaF0gRG91Ymxl
LWRpc2FibGUgb2YgY29yZSBjbG9ja3MgZHVyaW5nIGRyaXZlciByZW1vdmFsIGlmIHRoZSBkZXZp
Y2UgaXMgaW4gcnVudGltZSBzdXNwZW5kLgotLQoKLS0tIFBhdGNoIFs5XTogW1BBVENIIHY2IDA5
LzEyXSBpM2M6IGR3LWkzYy1tYXN0ZXI6IEFkZCBBQ1BJIElEIGZvciBUZWdyYTQxMCAtLS0KY29t
bWl0IGJmODJlOWMxNTZjNjY3NjNjODU1ZTU1NDliZDFhOTFiYWZjNWZkZjMKQXV0aG9yOiBBa2hp
bCBSIDxha2hpbHJhamVldkBudmlkaWEuY29tPgoKaTNjOiBkdy1pM2MtbWFzdGVyOiBBZGQgQUNQ
SSBJRCBmb3IgVGVncmE0MTAKICAgIApVcGRhdGUgdmFyaWFibGUgbmFtZXMgdG8gZ2VuZXJpYyBu
YW1lcyBhbmQgYWRkIFRlZ3JhNDEwIEFDUEkgSUQgdG8Kc3VwcG9ydCB0aGUgSTNDIGNvbnRyb2xs
ZXIgaW4gVGVncmE0MTAsIHdoaWNoIGlzIGEgRGVzaWduV2FyZSBJM0MgaG9zdApjb250cm9sbGVy
LgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyL2R3LWkzYy1tYXN0ZXIuYyBiL2Ry
aXZlcnMvaTNjL21hc3Rlci9kdy1pM2MtbWFzdGVyLmMKPiBpbmRleCAzZWMzYWIxYzEzYjRjLi5l
ZmUzN2Y1MjI0YzcxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci9kdy1pM2MtbWFz
dGVyLmMKPiArKysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvZHctaTNjLW1hc3Rlci5jCj4gQEAgLTE4
NjAsMTEgKzE4NjAsMTIgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgZHdfaTNj
X21hc3Rlcl9vZl9tYXRjaFtdID0gewo+ICB9Owo+ICBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBk
d19pM2NfbWFzdGVyX29mX21hdGNoKTsKPiAgCj4gLXN0YXRpYyBjb25zdCBzdHJ1Y3QgYWNwaV9k
ZXZpY2VfaWQgYW1kX2kzY19kZXZpY2VfbWF0Y2hbXSA9IHsKPiArc3RhdGljIGNvbnN0IHN0cnVj
dCBhY3BpX2RldmljZV9pZCBkd19pM2NfbWFzdGVyX2FjcGlfbWF0Y2hbXSA9IHsKPiAgCXsgIkFN
REkwMDE1IiwgQU1EX0kzQ19PRF9QUF9USU1JTkcgfSwKPiArCXsgIk5WREEyMDE4IiwgRFdfSTND
X0FDUElfU0tJUF9DTEtfUlNUIH0sCgpbU2V2ZXJpdHk6IEhpZ2hdClRoaXMgaXNuJ3QgYSBidWcg
aW50cm9kdWNlZCBieSB0aGlzIHBhdGNoLCBidXQgYWRkaW5nIGEgbmV3IEFDUEkgSUQgYnJpbmdz
CmF0dGVudGlvbiB0byBhIHByZS1leGlzdGluZyBpc3N1ZSB3aGVuIGhhbmRsaW5nIEFDUEkgYmlu
ZGluZ3MuCgpEb2VzIHRoaXMgZHJpdmVyIHNhZmVseSBoYW5kbGUgQUNQSSBQUlAwMDAxIGJpbmRp
bmdzPwoKSW4gZHdfaTNjX2NvbW1vbl9wcm9iZSgpLCBpZiBhbiBBQ1BJIGNvbXBhbmlvbiBpcyBw
cmVzZW50LCB0aGUgbWF0Y2ggZGF0YSBpcwpjYXN0IHRvIGFuIGludGVnZXIgYml0bWFzazoKCglp
ZiAoaGFzX2FjcGlfY29tcGFuaW9uKCZwZGV2LT5kZXYpKSB7CgkJcXVpcmtzID0gKHVuc2lnbmVk
IGxvbmcpZGV2aWNlX2dldF9tYXRjaF9kYXRhKCZwZGV2LT5kZXYpOwoJfSBlbHNlIGlmIChwZGV2
LT5kZXYub2Zfbm9kZSkgewouLi4KCldoZW4gYW4gQUNQSSBkZXZpY2UgYmluZHMgdXNpbmcgdGhl
IFBSUDAwMDEgbWVjaGFuaXNtLCBpdCB1dGlsaXplcyB0aGUgT0YKY29tcGF0aWJsZSBzdHJpbmdz
IGFuZCB0aGUgT0YgbWF0Y2ggdGFibGUuIEluIHRoaXMgc2NlbmFyaW8sCmRldmljZV9nZXRfbWF0
Y2hfZGF0YSgpIHJldHVybnMgdGhlIC5kYXRhIHBvaW50ZXIgZnJvbSB0aGUgb2ZfZGV2aWNlX2lk
CnRhYmxlIChlLmcuICZhbHRyX2FnaWxleDVfZHJ2ZGF0YSksIHJhdGhlciB0aGFuIGFuIGludGVn
ZXIgcXVpcmsgYml0bWFzawpmcm9tIHRoZSBhY3BpX2RldmljZV9pZCB0YWJsZS4KCkJlY2F1c2Ug
b2YgdGhlIHVuY29uZGl0aW9uYWwgY2FzdCwgd29uJ3QgdGhpcyBzdG9yZSBhIGtlcm5lbCBtZW1v
cnkgYWRkcmVzcwppbnRvIG1hc3Rlci0+cXVpcmtzIGluc3RlYWQgb2YgYSB2YWxpZCBiaXRtYXNr
LCB0aGVyZWJ5IGFjdGl2YXRpbmcgcmFuZG9tCmRyaXZlciBxdWlya3M/CgpbU2V2ZXJpdHk6IEhp
Z2hdClRoaXMgaXMgYWxzbyBhIHByZS1leGlzdGluZyBpc3N1ZSwgYnV0IGRvZXMgZHdfaTNjX2Nv
bW1vbl9yZW1vdmUoKSBjb3JyZWN0bHkKaGFuZGxlIGRldnJlcyBjbG9jayBjbGVhbnVwIHdoZW4g
dGhlIGRldmljZSBpcyBpbiBydW50aW1lIHN1c3BlbmQ/CgpUaGUgcHJvYmUgZnVuY3Rpb24gYWNx
dWlyZXMgYW5kIGVuYWJsZXMgdGhlIGNvcmUgYW5kIHBjbGsgY2xvY2tzIHVzaW5nCmRldm1fY2xr
X2dldF9vcHRpb25hbF9lbmFibGVkKCk6CgoJbWFzdGVyLT5jb3JlX2NsayA9IGRldm1fY2xrX2dl
dF9vcHRpb25hbF9lbmFibGVkKCZwZGV2LT5kZXYsIE5VTEwpOwouLi4KCW1hc3Rlci0+cGNsayA9
IGRldm1fY2xrX2dldF9vcHRpb25hbF9lbmFibGVkKCZwZGV2LT5kZXYsICJwY2xrIik7CgpUaGVz
ZSBjbG9ja3MgYXJlIGV4cGxpY2l0bHkgZGlzYWJsZWQgaW4gZHdfaTNjX21hc3Rlcl9ydW50aW1l
X3N1c3BlbmQoKS4gCgpJZiBkd19pM2NfY29tbW9uX3JlbW92ZSgpIGlzIGludm9rZWQgd2hpbGUg
dGhlIGRldmljZSBpcyBpbiBydW50aW1lIHN1c3BlbmQsCnRoZSBjbG9ja3MgYXJlIGFscmVhZHkg
ZGlzYWJsZWQuIFNpbmNlIGR3X2kzY19jb21tb25fcmVtb3ZlKCkgZG9lcyBub3Qgd2FrZQp0aGUg
ZGV2aWNlIChlLmcuLCB2aWEgcG1fcnVudGltZV9nZXRfc3luYygpKSwgd29uJ3QgdGhlIGRldnJl
cyBjbGVhbnVwCnJvdXRpbmUgcnVuIGNsa19kaXNhYmxlX3VucHJlcGFyZSgpIGFnYWluIG9uIGFs
cmVhZHkgZGlzYWJsZWQgY2xvY2tzLApsZWFkaW5nIHRvIGEgbmVnYXRpdmUgY2xvY2sgZW5hYmxl
IGNvdW50PwoKPiAgCXsgfQo+ICB9Owo+IC1NT0RVTEVfREVWSUNFX1RBQkxFKGFjcGksIGFtZF9p
M2NfZGV2aWNlX21hdGNoKTsKPiArTU9EVUxFX0RFVklDRV9UQUJMRShhY3BpLCBkd19pM2NfbWFz
dGVyX2FjcGlfbWF0Y2gpOwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlr
by5kZXYvIy9wYXRjaHNldC8yMDI2MDcyMTA0MDgwNS4xNjk2NTAzLTEtYWtoaWxyYWplZXZAbnZp
ZGlhLmNvbT9wYXJ0PTkKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtaTNjCg==
