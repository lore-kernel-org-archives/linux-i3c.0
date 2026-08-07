Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC5E3C5AC7A
	for <linux-i3c@archiver.kernel.org>; Fri,  7 Aug 2026 15:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QeneOxLe67UpCPF4sdyg4FIwPuFz/m/b72334iqFkB8=; b=jtBETSbroeZWen
	BlBYdgRw7ui/45Wu0z/9xldpUYxEwCmwcib8GvhweAeXXwaKNi62A3Grma8WhNPiOMdWbWyJk+ZYU
	PoRjpeWXT8n/102fPB4o3IqUXh0hgFe8ExETVTLLD9tIP8HSHtXPJL9wXrzjHxMcUDOxLaYWDeYqY
	m9nb7Xxv87TnYc1dTpUhGRHSm9XNunZe0PIFGJIl2MLVEbUSQdHh/GyDaVf239YXOUKD+fHgd/UJj
	BIW04GNKU1GC6+usvYgeTjluVua8uePqO/zbjcgfHqFEEcYjU9+OTas4HBDNCUFWonbqHPYaAMKMX
	yhv/0EjQLbXGHSU6ECMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMNV-00000008KR1-1eZs;
	Fri, 07 Aug 2026 15:20:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMNU-00000008KQt-0Ciq
	for linux-i3c@lists.infradead.org;
	Fri, 07 Aug 2026 15:20:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 41E2160051;
	Fri,  7 Aug 2026 15:20:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A05921F00A3A;
	Fri,  7 Aug 2026 15:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786116055;
	bh=Vcnpw3Ndben+HKH7Or8CpUZ/+7w7p/mmJG/vNPw/V9M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EW9UUFsPD5RRAXPY91RoCuKR6tcLQEA/8eDvPieFdkySw7c5454sMEF2qDmIrdSDA
	 +0hE8nb6jYUKnzsUnMCiL7FkWeK05YKmL1VZ/BqHeYJCrg3GK5J/TJ2nJvSyUBdujx
	 +VkRs6mVsXFtVtFDvUf5NCN6pVxya+W7W4PHJg2GY6R5gogqe8y5+eLDLZ1CswzSuO
	 XwkEK11kmfm6ukmVlhttZp+LUkejG0OCQUYOZqIbKGuz+CB9LhINUAvB2O7XK4HzI4
	 K1lG3o+3g3ai1dWa4QGuVCHQW3SoyTbb7BF+zu1njEI85Sv2rGnfi0g73OHoiT9KP3
	 nqvCDmM+bRwKA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V5 05/14] i3c: Make dev->desc locking assumptions
 explicit
To: "Adrian Hunter" <adrian.hunter@intel.com>
Cc: linux-pci@vger.kernel.org, Frank.Li@kernel.org, linux-i3c@lists.infradead.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260807145638.168865-6-adrian.hunter@intel.com>
References: <20260807145638.168865-1-adrian.hunter@intel.com>
 <20260807145638.168865-6-adrian.hunter@intel.com>
Date: Fri, 07 Aug 2026 15:20:53 +0000
Message-Id: <20260807152054.A05921F00A3A@smtp.kernel.org>
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
IFtIaWdoXSBVc2UtQWZ0ZXItRnJlZSBhbmQgcG90ZW50aWFsIGluZm9ybWF0aW9uIGxlYWsgaW4g
YGkzY19kZXZpY2VfdWV2ZW50KClgIGR1ZSB0byBtaXNzaW5nIGxvY2tzIGR1cmluZyBjb25jdXJy
ZW50IGRldmljZSBkZXNjcmlwdG9yIHJlcGxhY2VtZW50LgotLQoKLS0tIFBhdGNoIFs1XTogW1BB
VENIIFY1IDA1LzE0XSBpM2M6IE1ha2UgZGV2LT5kZXNjIGxvY2tpbmcgYXNzdW1wdGlvbnMgZXhw
bGljaXQgLS0tCmNvbW1pdCAyNzgyODJhOWVhZGQ2YzM1NWI2MGExMmJhOWFmNGM2YjU5ODJlMTQ0
CkF1dGhvcjogQWRyaWFuIEh1bnRlciA8YWRyaWFuLmh1bnRlckBpbnRlbC5jb20+CgppM2M6IE1h
a2UgZGV2LT5kZXNjIGxvY2tpbmcgYXNzdW1wdGlvbnMgZXhwbGljaXQKClRoaXMgY29tbWl0IHJl
bW92ZXMgYW4gdW5uZWNlc3NhcnkgTlVMTCBwb2ludGVyIGNoZWNrIGluCmkzY19kZXZpY2VfZ2V0
X2luZm8oKSBzaW5jZSB0aGUgZGVzY3JpcHRvciBwb2ludGVyIGlzIGd1YXJhbnRlZWQKdmFsaWQg
dW5kZXIgdGhlIGJ1cyBub3JtYWwtdXNlIGxvY2suCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kz
Yy9kZXZpY2UuYyBiL2RyaXZlcnMvaTNjL2RldmljZS5jCj4gaW5kZXggYTM3NzgyODJlODRjMi4u
NWU2ZGY2ZGUwMjgzNCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2kzYy9kZXZpY2UuYwo+ICsrKyBi
L2RyaXZlcnMvaTNjL2RldmljZS5jCj4gQEAgLTEwMSw4ICsxMDEsNyBAQCB2b2lkIGkzY19kZXZp
Y2VfZ2V0X2luZm8oY29uc3Qgc3RydWN0IGkzY19kZXZpY2UgKmRldiwKPiAgCQlyZXR1cm47Cj4g
IAo+ICAJaTNjX2J1c19ub3JtYWx1c2VfbG9jayhkZXYtPmJ1cyk7Cj4gLQlpZiAoZGV2LT5kZXNj
KQo+IC0JCSppbmZvID0gZGV2LT5kZXNjLT5pbmZvOwo+ICsJKmluZm8gPSBkZXYtPmRlc2MtPmlu
Zm87Cj4gIAlpM2NfYnVzX25vcm1hbHVzZV91bmxvY2soZGV2LT5idXMpOwoKW1NldmVyaXR5OiBI
aWdoXQpUaGlzIGlzIGEgcHJlLWV4aXN0aW5nIGlzc3VlLCBidXQgZG9lcyB0aGUgc2FtZSBsb2Nr
aW5nIHJ1bGUgbmVlZCB0byBiZQphcHBsaWVkIHRvIGkzY19kZXZpY2VfdWV2ZW50KCkgaW4gZHJp
dmVycy9pM2MvbWFzdGVyLmM/CgpJdCBhcHBlYXJzIHRoYXQgaTNjX2RldmljZV91ZXZlbnQoKSBj
dXJyZW50bHkgcmVhZHMgaTNjZGV2LT5kZXNjIHdpdGhvdXQKaG9sZGluZyB0aGUgbm9ybWFsLXVz
ZSBidXMgbG9jazoKCmRyaXZlcnMvaTNjL21hc3Rlci5jOmkzY19kZXZpY2VfdWV2ZW50KCkgewog
ICAgICAgIHN0cnVjdCBpM2NfZGV2aWNlX2luZm8gZGV2aW5mbzsKICAgICAgICAuLi4KICAgICAg
ICBpZiAoaTNjZGV2LT5kZXNjKQogICAgICAgICAgICAgICAgZGV2aW5mbyA9IGkzY2Rldi0+ZGVz
Yy0+aW5mbzsKICAgICAgICAuLi4KfQoKQ291bGQgdGhpcyBzZXF1ZW5jZSBjYXVzZSBhIHVzZS1h
ZnRlci1mcmVlIGlmIGEgY29uY3VycmVudCBkZXZpY2UgZGlzY292ZXJ5Cm9yIGhvdC1qb2luIG9j
Y3Vycz8gRm9yIGV4YW1wbGUsIGlmIF9faTNjX21hc3Rlcl9hZGRfaTNjX2Rldl9sb2NrZWQoKSAK
cmVwbGFjZXMgYW5kIGZyZWVzIHRoZSBkZXNjcmlwdG9yIHdoaWxlIHRoZSBkZXZpY2UgaXMgc3Rp
bGwgYWNjZXNzaWJsZSAKdmlhIHN5c2ZzIHVldmVudHM6Cgpkcml2ZXJzL2kzYy9tYXN0ZXIuYzpf
X2kzY19tYXN0ZXJfYWRkX2kzY19kZXZfbG9ja2VkKCkgewogICAgICAgIC4uLgogICAgICAgIGkz
Y19tYXN0ZXJfZGV0YWNoX2kzY19kZXYob2xkZGV2KTsKICAgICAgICBpM2NfbWFzdGVyX2ZyZWVf
aTNjX2RldihvbGRkZXYpOwogICAgICAgIC4uLgp9CgpBbHNvLCBpZiBpM2NkZXYtPmRlc2MgZXZh
bHVhdGVzIHRvIE5VTEwgZHVyaW5nIHRoZSB1ZXZlbnQsIGNvdWxkIHRoaXMKbGVhdmUgdGhlIGRl
dmluZm8gc3RhY2sgdmFyaWFibGUgdW5pbml0aWFsaXplZCBhbmQgZXhwb3NlIGtlcm5lbCBzdGFj
awptZW1vcnkgdG8gdXNlciBzcGFjZSB2aWEgdGhlIG1vZGFsaWFzIHN0cmluZz8KCi0tIApTYXNo
aWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA4MDcx
NDU2MzguMTY4ODY1LTEtYWRyaWFuLmh1bnRlckBpbnRlbC5jb20/cGFydD01CgotLSAKbGludXgt
aTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
