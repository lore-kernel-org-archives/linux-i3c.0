Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 332B3C79F8C
	for <linux-i3c@archiver.kernel.org>; Wed,  9 Sep 2026 07:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SF+oAkLrTAw0Pfok9R4XN4p5EcO1n+9ONBM0onQlrV0=; b=EAvfUtWcb0VcLP
	Q07tp9LNZf3qns5gxbsyTU2hU3CctjNog1/b8o6Zs9+Nkw9JgF1o03m/DXn4kE3q9Y4XFieY9QO3O
	Lf2n6xRhTSX/zSPjjeNYa3KFhnxLqubEHy/z60U7gxrPFLRoobNAH/iFH6G9dEqKl7RVTu8F07b+j
	u1lik+atZtGWpQH3nbFSnhXWAXHw27ETX3ajZ63qNTiWhd9Kz+ylm2SLafp8lfKlSP8AR8xBNjgJ1
	M80w5vbkKehj/vAwp/5OuVSTK4p12EQVopnKwOmG48srBoXbfVVL3KktvsejF7b3REGG9uS77rR14
	e15z4mVoQ/PV6lfpAhQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Cko-0000000AzCq-3IIA;
	Wed, 09 Sep 2026 07:29:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Ckm-0000000AzCf-3eLN
	for linux-i3c@lists.infradead.org;
	Wed, 09 Sep 2026 07:29:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EF32E601FE;
	Wed,  9 Sep 2026 07:29:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D8AA1F00A3E;
	Wed,  9 Sep 2026 07:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788938995;
	bh=45POvm/xGmY6HmQV7NWUMyX9lspv7lDIZNtcY3R3jzU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b9+5bWTs4ZSnnCINgeTJmWW4qVU+vXyzDr+83nJ5Br7/IV/lSSb4JZe/c9PeuI65Q
	 wO+mMHXsANCy7RpEvPMAZbThvSyXIWjs0EkUOddautU2skbLCUdbYL4Nx0RsM6PGmL
	 HuA0LfqYpCN8YvjCyj5SWXpWGysI8bGRoai+sUqpg0xz54ZuoNi2vmjziMMLZF9YTC
	 ci9DHR3kKk2e+iGehEbkJbbBCf0QYAMtPKlTh5a50siUxsT4+fm3jcK6UmTst24GWM
	 J3bVmOJzd/8OfkkUdtpngvYi56USf/CK30N5v0iv5GNtOf4jaZJF8TcOWMUlu6Y9mM
	 O7sPdef0fTQtg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] i3c: master: amd: Add hot-join support
To: "Shubham Patil" <shubhamsanjay.patil@amd.com>
Cc: linux-i3c@lists.infradead.org, Frank.Li@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260909071340.3649271-4-shubhamsanjay.patil@amd.com>
References: <20260909071340.3649271-1-shubhamsanjay.patil@amd.com>
 <20260909071340.3649271-4-shubhamsanjay.patil@amd.com>
Date: Wed, 09 Sep 2026 07:29:54 +0000
Message-Id: <20260909072955.3D8AA1F00A3E@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIFRoZSBkcml2ZXIgZmFp
bHMgdG8gY2xlYXIgYFhJM0NfQ1JfSEpfTUFTS2AgYW5kIGBYSTNDX0NSX0lCSV9NQVNLYCBmcm9t
IHRoZSBDb3JlIENvbnRyb2wgUmVnaXN0ZXIgKGBYSTNDX0NSX09GRlNFVGApIGR1cmluZyBjb250
cm9sbGVyIGluaXRpYWxpemF0aW9uLiBXaGVuIHRoZSBjb250cm9sbGVyIGlzIHN1YnNlcXVlbnRs
eSBlbmFibGVkLCBhbnkgcHJldmlvdXNseSBzZXQgYml0cyAoZS5nLiwgZnJvbSBhIHdhcm0gYm9v
dCwga2V4ZWMsIG9yIGJvb3Rsb2FkZXIpIHJlbWFpbiBhY3RpdmUuIFRoaXMgY2F1c2VzIHRoZSBj
b250cm9sbGVyIHRvIHNpbGVudGx5IEFDSyBob3Qtam9pbiBvciBJQkkgcmVxdWVzdHMgb24gdGhl
IGJ1cyB3aXRob3V0IGdlbmVyYXRpbmcgaW50ZXJydXB0cyAoc2luY2UgYFhJM0NfSU5UUl9SRV9P
RkZTRVRgIGlzIHplcm9lZCksIGlycmV2b2NhYmx5IHN0YWxsaW5nIGJ1cyBlbnVtZXJhdGlvbi4K
LS0KCmNvbW1pdCAyZmM4Y2VhNDdhOTE0ZTFkOGQ3MzEyODI2NTYxYTA4NGY3ODVkMDM1CkF1dGhv
cjogU2h1YmhhbSBQYXRpbCA8c2h1YmhhbXNhbmpheS5wYXRpbEBhbWQuY29tPgpTdWJqZWN0OiBp
M2M6IG1hc3RlcjogYW1kOiBBZGQgaG90LWpvaW4gc3VwcG9ydAoKVGhpcyBjb21taXQgYWRkcyBo
b3Qtam9pbiBzdXBwb3J0IGZvciB0aGUgQU1EIEFYSSBJM0MgbWFzdGVyIGNvbnRyb2xsZXIuCkl0
IGludHJvZHVjZXMgc3lzZnMtYmFzZWQgY29uZmlndXJhdGlvbiBhbmQgaGFuZGxlcyBldmVudHMg
dmlhIHRoZSBpM2MgY29yZQpob3Qtam9pbiBxdWV1ZSB0byBydW4gREFBIGZvciBlbnVtZXJhdGlu
ZyBuZXcgZGV2aWNlcy4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci9hbWQtaTNj
LW1hc3Rlci5jIGIvZHJpdmVycy9pM2MvbWFzdGVyL2FtZC1pM2MtbWFzdGVyLmMKPiBpbmRleCBh
NTA0NDU1MzBhNDMwLi40MDBiZjE1ZTAyOTkyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaTNjL21h
c3Rlci9hbWQtaTNjLW1hc3Rlci5jCj4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyL2FtZC1pM2Mt
bWFzdGVyLmMKClsgLi4uIF0KCj4gQEAgLTEyNDQsMTMgKzEyNTAsMTQgQEAgc3RhdGljIHZvaWQg
eGkzY19tYXN0ZXJfYnVzX2NsZWFudXAoc3RydWN0IGkzY19tYXN0ZXJfY29udHJvbGxlciAqbSkK
PiAgCXN0cnVjdCB4aTNjX21hc3RlciAqbWFzdGVyID0gdG9feGkzY19tYXN0ZXIobSk7Cj4gIAo+
ICAJLyoKPiAtCSAqIERpc2FybSBhbGwgaW50ZXJydXB0IHNvdXJjZXMgYW5kIHRoZSBJQkkgQUNL
IHNvIHRoZSBjb250cm9sbGVyIGNhbid0Cj4gLQkgKiBhc3NlcnQgb25jZSBkaXNhYmxlZDsgcmVz
ZXQgdGhlIHJlZmNvdW50IHRoYXQgdHJhY2tzIHRoZW0uCj4gKwkgKiBEaXNhcm0gdGhlIGludGVy
cnVwdHMgYW5kIHRoZSBJQkkvSG90LUpvaW4gQUNLcyBzbyBub3RoaW5nIGlzIGxlZnQKPiArCSAq
IGFybWVkIGZvciBhIGxhdGVyIGJ1c19pbml0KCk7IHJlc2V0IHRoZSByZWZjb3VudCB0aGF0IHRy
YWNrcyB0aGVtLgo+ICAJICovCj4gIAlzY29wZWRfZ3VhcmQoc3BpbmxvY2tfaXJxc2F2ZSwgJm1h
c3Rlci0+cmVnX2xvY2spIHsKPiAgCQlpb3dyaXRlMzIoMCwgbWFzdGVyLT5tZW1iYXNlICsgWEkz
Q19JTlRSX1JFX09GRlNFVCk7Cj4gIAkJaW93cml0ZTMyKGlvcmVhZDMyKG1hc3Rlci0+bWVtYmFz
ZSArIFhJM0NfQ1JfT0ZGU0VUKSAmCj4gLQkJCSAgflhJM0NfQ1JfSUJJX01BU0ssIG1hc3Rlci0+
bWVtYmFzZSArIFhJM0NfQ1JfT0ZGU0VUKTsKPiArCQkJICB+KFhJM0NfQ1JfSUJJX01BU0sgfCBY
STNDX0NSX0hKX01BU0spLAo+ICsJCQkgIG1hc3Rlci0+bWVtYmFzZSArIFhJM0NfQ1JfT0ZGU0VU
KTsKPiAgCQltYXN0ZXItPmliaS5lbmFibGVkX2NvdW50ID0gMDsKPiAgCX0KCltTZXZlcml0eTog
SGlnaF0KRG9lcyB4aTNjX21hc3Rlcl9pbml0KCkgYWxzbyBuZWVkIHRvIGNsZWFyIHRoZXNlIG1h
c2tzIGZyb20gWEkzQ19DUl9PRkZTRVQgdG8KZ3VhcmFudGVlIGEgY2xlYW4gc3RhdGUgYmVmb3Jl
IGVuYWJsaW5nIHRoZSBjb250cm9sbGVyPwoKSWYgdGhlIGNvbnRyb2xsZXIgaXMgZW5hYmxlZCBh
ZnRlciBhIHdhcm0gYm9vdCBvciBrZXhlYyB3aGVyZSBhIGJvb3Rsb2FkZXIKbGVmdCB0aGUgSG90
LUpvaW4gYml0IGFjdGl2ZSwgdGhlIGRyaXZlciBjdXJyZW50bHkgZmFpbHMgdG8gY2xlYXIgaXQg
aW4KeGkzY19tYXN0ZXJfaW5pdCgpOgoKZHJpdmVycy9pM2MvbWFzdGVyL2FtZC1pM2MtbWFzdGVy
LmM6eGkzY19tYXN0ZXJfaW5pdCgpIHsKCS8qIE1hc2sgYWxsIGludGVycnVwdCBzb3VyY2VzIGFu
ZCBjbGVhciBhbnkgc3RhbGUgbGF0Y2hlZCBldmVudHMuICovCglpb3dyaXRlMzIoMCwgbWFzdGVy
LT5tZW1iYXNlICsgWEkzQ19JTlRSX1JFX09GRlNFVCk7Cglpb3dyaXRlMzIoaW9yZWFkMzIobWFz
dGVyLT5tZW1iYXNlICsgWEkzQ19JTlRSX1NUQVRVU19PRkZTRVQpLAoJCSAgbWFzdGVyLT5tZW1i
YXNlICsgWEkzQ19JTlRSX1NUQVRVU19PRkZTRVQpOwoKCS8qIFJlc2V0IGZpZm9zICovCgl4aTNj
X21hc3Rlcl9yZXNldF9maWZvcyhtYXN0ZXIpOwoKCS8qIEVuYWJsZSBjb250cm9sbGVyICovCgl4
aTNjX21hc3Rlcl9lbmFibGUobWFzdGVyKTsKfQoKU2luY2UgWEkzQ19JTlRSX1JFX09GRlNFVCBp
cyB6ZXJvZWQgYnV0IHRoZSBIb3QtSm9pbiBBQ0sgYml0IG1pZ2h0IHJlbWFpbgphY3RpdmUgaW4g
WEkzQ19DUl9PRkZTRVQsIGNvdWxkIHRoZSBjb250cm9sbGVyIHNpbGVudGx5IEFDSyBob3Qtam9p
biByZXF1ZXN0cwp3aXRob3V0IGdlbmVyYXRpbmcgQ1BVIGludGVycnVwdHMsIHBlcm1hbmVudGx5
IHN0YWxsaW5nIGJ1cyBlbnVtZXJhdGlvbj8KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRw
czovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA5MDkwNzEzNDAuMzY0OTI3MS0xLXNodWJo
YW1zYW5qYXkucGF0aWxAYW1kLmNvbT9wYXJ0PTMKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0
CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
