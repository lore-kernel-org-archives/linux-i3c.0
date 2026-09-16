Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC1FC88E5C
	for <linux-i3c@archiver.kernel.org>; Wed, 16 Sep 2026 07:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HMwLa2rNAHuz3GTH6Q7hW1bnfqz7HbRJophZjpFjBsY=; b=nzSKL4GNuPsbGA
	Ar2v9/g9aWP/P91N+K7piQtx9HRzWdTZAlW/ta/1T1ETrxYdMlcZXU3BQmYz9eIsTixL1JoxZ5Pc5
	yQpNLaJZT0acmIqpFHNjoL51lGORL0FG3Rgf4uoGP2L3bAxNVMvPzrxTnBaQTYgOmYghpqhJdMbG6
	v5uwjn/Fjp4Sz+byBIFDdydoOGZb0vInQ2n6HaSOsNkb/FZ3Y49HVPElOjdlriWj2v0Bz9LxjL2gT
	FUWQcFSo8l3tO6xhXXsxjj1zsF0yY4o2O/LWG8pO2CISBcGDM0yB1fIDFWSj+0HmMjBsrkf8ABqLt
	32gmurlFR7Bc9612OQmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6jtj-00000008Zau-1dl0;
	Wed, 16 Sep 2026 07:17:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6jtf-00000008ZaO-3npi
	for linux-i3c@lists.infradead.org;
	Wed, 16 Sep 2026 07:17:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7451143E54;
	Wed, 16 Sep 2026 07:17:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DE1E1F00893;
	Wed, 16 Sep 2026 07:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789543055;
	bh=hca6qlN0xG1kIjyBog37y2qFhd0a9XvurL53zkwuwi0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k7/Mm7dVt5zYYTPipOh999z1bV3kgJyZyr7dUj7JJY59Sw/QekkosBvVH2CICd5FW
	 NMBdpl6ws26ombciDhWU02rTrMEEGV8q+dK6SYvBTcVoHZEZXRswQm+MgqfCzJUoQF
	 xmL242H7I+KCzAZvgav6AyczM+NtOMtsvAGNX2ahIDki3RdZMu4ckayiAbIXklYmIV
	 XSlgYXFwOOItL/lJ9PiPQr0cijh3MqLEqhRNluOFnZP8h04NS8S6micmgYDoxRCQCY
	 WL0Uq6kLlJyZGZxvG/xigZjGAj5FkPE+10OWKZxZ7dLD++MS9Lw0XHtRltUXOkNOV8
	 2DOGl1vp9rRPQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v19 5/8] regulator: p3h2x4x: Add driver for on-die
 regulators in NXP P3H2x4x i3c hub
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: linux-i3c@lists.infradead.org, Frank.Li@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260916070728.1088801-6-lakshay.piplani@nxp.com>
References: <20260916070728.1088801-1-lakshay.piplani@nxp.com>
 <20260916070728.1088801-6-lakshay.piplani@nxp.com>
Date: Wed, 16 Sep 2026 07:17:34 +0000
Message-Id: <20260916071734.8DE1E1F00893@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gcmVndWxhdG9yOiBwM2gy
eDR4OiB1bnVzZWQgZmllbGRzIGFuZCBkZWFkIGNvZGUgaW4gZHJpdmVyIGRhdGEKLSBbTG93XSBt
ZmQ6IGRyaXZlci1zcGVjaWZpYyBoZWFkZXIgcGxhY2VkIGluIGdsb2JhbCBpbmNsdWRlL2xpbnV4
L21mZC8gZGlyZWN0b3J5Ci0tCgpjb21taXQgMjRhNzVhM2RjMGZiOWY1YzFhZGNjZjBiY2Q2YTlk
Nzc0Mzk3ZGMxYwpBdXRob3I6IEFtYW4gS3VtYXIgUGFuZGV5IDxhbWFuLmt1bWFycGFuZGV5QG54
cC5jb20+CgogICAgcmVndWxhdG9yOiBwM2gyeDR4OiBBZGQgZHJpdmVyIGZvciBvbi1kaWUgcmVn
dWxhdG9ycyBpbiBOWFAgUDNIMng0eCBpM2MgaHViCgpUaGlzIGNvbW1pdCBhZGRzIGEgcmVndWxh
dG9yIGRyaXZlciBmb3IgdGhlIG9uLWRpZSB2b2x0YWdlIHJlZ3VsYXRvcnMKaW50ZWdyYXRlZCBp
biB0aGUgTlhQIFAzSDJ4NHggaTNjIGh1YiBmYW1pbHkuIEl0IHJlZ2lzdGVycyB0aGUgcmVndWxh
dG9ycwp2aWEgdGhlIE1GRCBmcmFtZXdvcmsgYW5kIHN0YW5kYXJkIHJlZ3VsYXRvciBBUElzLgoK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9yZWd1bGF0b3IvcDNoMjg0MF9pM2NfaHViX3JlZ3VsYXRv
ci5jIGIvZHJpdmVycy9yZWd1bGF0b3IvcDNoMjg0MF9pM2NfaHViX3JlZ3VsYXRvci5jCj4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAwLi4yNDRmMmE0ZjcwZjM4Cj4g
LS0tIC9kZXYvbnVsbAo+ICsrKyBiL2RyaXZlcnMvcmVndWxhdG9yL3AzaDI4NDBfaTNjX2h1Yl9y
ZWd1bGF0b3IuYwo+IEBAIC0wLDAgKzEsMjg5IEBACj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiBHUEwtMi4wCj4gKy8qCj4gKyAqIENvcHlyaWdodCAyMDI1LTIwMjYgTlhQCj4gKyAqIE5Y
UCBQM0gyWDRYIHJlZ3VsYXRvciBkcml2ZXIgZmlsZSBjb250YWluIGZ1bmN0aW9ucyBmb3IgZW5h
YmxlL2Rpc2FibGUgcmVndWxhdG9yCj4gKyAqIGFuZCB2b2x0YWdlIHNldC9nZXQuCj4gKyAqLwo+
ICsjaW5jbHVkZSA8bGludXgvYml0ZmllbGQuaD4KPiArI2luY2x1ZGUgPGxpbnV4L2NsZWFudXAu
aD4KPiArI2luY2x1ZGUgPGxpbnV4L21mZC9wM2gyODQwLmg+CiAgICAgICAgICAgXl5eXl5eXl5e
Xl5eXl5eXl5eXl5eXl5eXgoKW1NldmVyaXR5OiBMb3ddCklzIHRoaXMgZHJpdmVyLXNwZWNpZmlj
IGhlYWRlciB1c2VkIG9ubHkgYnkgdGhlIHBhcmVudCBhbmQgaXRzIGltbWVkaWF0ZQpjaGlsZHJl
bj8KClRoZSBNRkQgc3Vic3lzdGVtIGd1aWRlbGluZXMgc3RhdGUgdGhhdCBkcml2ZXItc3BlY2lm
aWMgaGVhZGVyIGZpbGVzIHNob3VsZCBub3QKYmUgcGxhY2VkIGluIHRoZSBnbG9iYWwgaW5jbHVk
ZS9saW51eC9tZmQvIGRpcmVjdG9yeSBpZiB0aGV5IGFyZSBvbmx5IHVzZWQKYnkgdGhlIHBhcmVu
dCBhbmQgaXRzIGltbWVkaWF0ZSBjaGlsZHJlbi4gQ291bGQgdGhpcyBoZWFkZXIgYmUga2VwdCBs
b2NhbCB0bwpkcml2ZXJzL21mZC8gaW5zdGVhZD8KClsgLi4uIF0KCj4gKyNkZWZpbmUgUDNIMlg0
WF9WQ0NJT19MRE9fQ09ORgkJCQkJMHgxNgo+ICsjZGVmaW5lIFAzSDJYNFhfQ1AwX1ZDQ0lPX0xE
T19WT0xUQUdFX01BU0sJCQlHRU5NQVNLKDEsIDApCj4gKyNkZWZpbmUgUDNIMlg0WF9DUDBfVkND
SU9fTERPX1ZPTFRBR0UoeCkJXAo+ICsJCUZJRUxEX1BSRVAoUDNIMlg0WF9DUDBfVkNDSU9fTERP
X1ZPTFRBR0VfTUFTSywgeCkKPiArI2RlZmluZSBQM0gyWDRYX0NQMV9WQ0NJT19MRE9fVk9MVEFH
RV9NQVNLCQkJR0VOTUFTSygzLCAyKQo+ICsjZGVmaW5lIFAzSDJYNFhfQ1AxX1ZDQ0lPX0xET19W
T0xUQUdFKHgpCVwKPiArCQlGSUVMRF9QUkVQKFAzSDJYNFhfQ1AxX1ZDQ0lPX0xET19WT0xUQUdF
X01BU0ssIHgpCj4gKyNkZWZpbmUgUDNIMlg0WF9UUDAxNDVfVkNDSU9fTERPX1ZPTFRBR0VfTUFT
SwkJCUdFTk1BU0soNSwgNCkKPiArI2RlZmluZSBQM0gyWDRYX1RQMDE0NV9WQ0NJT19MRE9fVk9M
VEFHRSh4KQlcCj4gKwkJRklFTERfUFJFUChQM0gyWDRYX1RQMDE0NV9WQ0NJT19MRE9fVk9MVEFH
RV9NQVNLLCB4KQo+ICsjZGVmaW5lIFAzSDJYNFhfVFAyMzY3X1ZDQ0lPX0xET19WT0xUQUdFX01B
U0sJCQlHRU5NQVNLKDcsIDYpCj4gKyNkZWZpbmUgUDNIMlg0WF9UUDIzNjdfVkNDSU9fTERPX1ZP
TFRBR0UoeCkJXAo+ICsJCUZJRUxEX1BSRVAoUDNIMlg0WF9UUDIzNjdfVkNDSU9fTERPX1ZPTFRB
R0VfTUFTSywgeCkKCltTZXZlcml0eTogTG93XQpBcmUgdGhlIFAzSDJYNFhfKl9WQ0NJT19MRE9f
Vk9MVEFHRSgpIG1hY3JvcyB1c2VkIGFueXdoZXJlPwoKVGhleSBhcHBlYXIgdG8gYmUgZGVmaW5l
ZCB1c2luZyBGSUVMRF9QUkVQIGJ1dCBuZXZlciB1dGlsaXplZCBpbiB0aGUgZHJpdmVyCmNvZGUs
IGFkZGluZyB1bm5lY2Vzc2FyeSBjb21wbGV4aXR5LgoKPiArI2RlZmluZSBQM0gyWDRYX0xET19D
T1VOVAkJCQkJNAo+ICsjZGVmaW5lIFAzSDJYNFhfTERPX0VOQUJMRV9USU1FX1VTCQkJCTUwMDAK
PiArCj4gK3N0cnVjdCBwM2gyeDR4X3JlZ3VsYXRvcl9kZXYgewo+ICsJc3RydWN0IHJlZ3VsYXRv
cl9kZXYgKnJwM2gyeDR4X2RldltQM0gyWDRYX0xET19DT1VOVF07Cj4gKwlzdHJ1Y3QgcDNoMng0
eCAqcDNoMng0eDsKPiArCXN0cnVjdCByZWdtYXAgKnJlZ21hcDsKPiArfTsKCltTZXZlcml0eTog
TG93XQpBcmUgdGhlIHJwM2gyeDR4X2RldiBhbmQgcmVnbWFwIGZpZWxkcyBuZWVkZWQgaW4gdGhp
cyBzdHJ1Y3R1cmU/CgpEdXJpbmcgcDNoMng0eF9yZWd1bGF0b3JfcHJvYmUoKSwgdGhlc2UgZmll
bGRzIGFyZSBwb3B1bGF0ZWQgYnV0IHRoZXkgZG9uJ3Qgc2VlbQp0byBiZSByZWFkIGFueXdoZXJl
IG9uIGFueSBzdWJzZXF1ZW50IGV4ZWN1dGlvbiBwYXRoLiBGb3IgZXhhbXBsZSwgcmVnbWFwIGFj
Y2Vzcwp1c2VzIHJkZXYtPnJlZ21hcCBkaXJlY3RseSBmcm9tIHRoZSByZWd1bGF0b3IgY29yZS4g
Q291bGQgdGhleSBiZSByZW1vdmVkIHRvCnJlZHVjZSBtZW1vcnkgb3ZlcmhlYWQgYW5kIGRyaXZl
ciBkYXRhIHBheWxvYWQgY29tcGxleGl0eT8KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRw
czovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA5MTYwNzA3MjguMTA4ODgwMS0xLWxha3No
YXkucGlwbGFuaUBueHAuY29tP3BhcnQ9NQoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGlu
dXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1pM2MK
