Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A74C43458
	for <linux-i3c@archiver.kernel.org>; Wed,  1 Jul 2026 07:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=40qzItXpBnfERsc/3v+AfC38FpstcbTJaeSjCd69YE8=; b=Yc8unOFpLJ4iGk
	KUBynGPL3JoHQ9uZwDdyHXb0Jep2E4eHsB/+dybeLCxLLXUkIu+8bO783U2reGH7e31rFYyxDn1e2
	nlU2or1cvpb7TQjHvAfmZL+udLvi1NpVk/Ic4hrGR4IhyUus+FoCbGSSTcO35SYE1r3weSZLggtE1
	+7fi2iMCADJC6UA9grbxqmAXbeRseJEkFZxR6bJoYtU9fJ5oOw5kwSnscUyO11mD1CaPwHOt4mAK3
	a5BhXv4Afqzg9YJ9z2p762qHkSZSjKPfQGWTUfTKmRZ1LSG15WY0zW5QmB3rmyp4+7S7Xo/wIytv7
	oSbXfPCMEdZUBppB68Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wep8k-00000000sUD-2CRh;
	Wed, 01 Jul 2026 07:13:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wep8i-00000000sU3-3x9i
	for linux-i3c@lists.infradead.org;
	Wed, 01 Jul 2026 07:13:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7A65743F64;
	Wed,  1 Jul 2026 07:13:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDEA81F000E9;
	Wed,  1 Jul 2026 07:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782890024;
	bh=s0Skc6YuH+2TjFlIomEDVkGXN7RJsPN5uFy7MDljchI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kvSDr+Lw51nJhRrE6ioPBSYZLRpBOXPV293AYx/ogyrooAaFWWU8CV//wtDolObef
	 6tX0ypEpX/fK0IGgqFXwrxjj4dyWWUsoLrkHX/iecsBijKTQD9dtSB/Zy8CAt2GUVE
	 AYOCzZh4B+jSj9qB8JmMGQLYyepxio59ZUhjcFjAvFZ+sfyBuBC+Ltz1xOOEdiq9lW
	 cSHk17KhaaFKCTVymTVzQT03pz7881rbIrZcfLjJwEM6LglcrwxAFk5cJix4uplh4m
	 kHAUFHhrGq/WMAiPF5Hcdh0W8qWwivhWJ6vHsru57WtFTlF1pNuB/Cr0BDeHg34W4o
	 XdS71jAaJ1OwA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 2/7] dt-bindings: i3c: Add NXP P3H2x4x i3c-hub
 support
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: conor+dt@kernel.org, linux-i3c@lists.infradead.org, robh@kernel.org, Frank.Li@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org
In-Reply-To: <20260701065755.2067793-3-lakshay.piplani@nxp.com>
References: <20260701065755.2067793-1-lakshay.piplani@nxp.com>
 <20260701065755.2067793-3-lakshay.piplani@nxp.com>
Date: Wed, 01 Jul 2026 07:13:43 +0000
Message-Id: <20260701071343.EDEA81F000E9@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gVGhlIGRldmljZSB0
cmVlIGJpbmRpbmcgYWR2ZXJ0aXNlcyBHUElPIGNhcGFiaWxpdGllcyBpbiB0aGUgaGFyZHdhcmUg
ZGVzY3JpcHRpb24gYnV0IG9taXRzIHRoZSByZXF1aXJlZCBHUElPIGNvbnRyb2xsZXIgcHJvcGVy
dGllcyBmcm9tIHRoZSBzY2hlbWEuCi0gW01lZGl1bV0gVGhlIGJpbmRpbmcgc2NoZW1hIGZhaWxz
IHRvIGluY2x1ZGUgY29tcGF0aWJsZSBzdHJpbmdzIGZvciBhbGwgaGFyZHdhcmUgdmFyaWFudHMg
Y2xhaW1lZCBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuCi0tCgpjb21taXQgMDJlYWEwYjdmZjZmNjUx
OTJjZDMxOGQ2NzA0YmU5OGIzMjE3NjJkYQpBdXRob3I6IEFtYW4gS3VtYXIgUGFuZGV5IDxhbWFu
Lmt1bWFycGFuZGV5QG54cC5jb20+CgpkdC1iaW5kaW5nczogaTNjOiBBZGQgTlhQIFAzSDJ4NHgg
aTNjLWh1YiBzdXBwb3J0CgpBZGQgYmluZGluZ3MgZm9yIHRoZSBOWFAgUDNIMng0eCAoUDNIMjQ0
MC9QM0gyNDQxL1AzSDI4NDAvUDNIMjg0MSkKbXVsdGlwb3J0IEkzQyBodWIgZmFtaWx5LgoKPiBk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kzYy9ueHAscDNo
Mjg0MC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kzYy9ueHAscDNo
Mjg0MC55YW1sCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kzYy9ueHAscDNoMjg0MC55YW1sClsg
Li4uIF0KPiArZGVzY3JpcHRpb246IHwKPiArICBQM0gyeDR4IChQM0gyNDQwL1AzSDI0NDEvUDNI
Mjg0MC9QM0gyODQxKSBpcyBhIGZhbWlseSBvZiBtdWx0aXBvcnQgSTNDCj4gKyAgaHViIGRldmlj
ZXMgdGhhdCBjb25uZWN0IHRvOi0KPiArICAxLiBBIGhvc3QgQ1BVIHZpYSBJM0MvSTJDL1NNQnVz
IGJ1cyBvbiB1cHN0cmVhbSBzaWRlIGFuZCBjb25uZWN0IHRvIG11bHRpcGxlCj4gKyAgICAgcGVy
aXBoZXJhbCBkZXZpY2VzIG9uIHRoZSBkb3duc3RyZWFtICBzaWRlLgo+ICsgIDIuIEhhdmUgdHdv
IENvbnRyb2xsZXIgUG9ydHMgd2hpY2ggY2FuIHN1cHBvcnQgZWl0aGVyCj4gKyAgICAgSTJDL1NN
QnVzIG9yIEkzQyBidXNlcyBhbmQgY29ubmVjdCB0byBhIENQVSwgQk1DIG9yIFNPQy4KPiArICAz
LiBQM0gyODQwLyBQM0gyODQxIGFyZSA4IHBvcnQgSTNDIGh1YiB3aXRoIGVpZ2h0IEkzQy9JMkMg
VGFyZ2V0IFBvcnQuCj4gKyAgNC4gUDNIMjQ0MC8gUDNIMjQ0MSBhcmUgNCBwb3J0IEkzQyBodWIg
d2l0aCBmb3VyIEkzQy9JMkMgVGFyZ2V0IFBvcnQuCj4gKyAgICAgVGFyZ2V0IHBvcnRzIGNhbiBi
ZSBjb25maWd1cmVkIGFzIEkyQy9TTUJ1cywgSTNDIG9yIEdQSU8gYW5kIGNvbm5lY3QgdG8KPiAr
ICAgICBwZXJpcGhlcmFscy4KCltTZXZlcml0eTogTWVkaXVtXQpUaGUgZGVzY3JpcHRpb24gc3Rh
dGVzIHRoYXQgdGFyZ2V0IHBvcnRzIGNhbiBiZSBjb25maWd1cmVkIGFzIEdQSU8uClNpbmNlIHVu
ZXZhbHVhdGVkUHJvcGVydGllcyBpcyBzZXQgdG8gZmFsc2UsIHNob3VsZG4ndCB0aGlzIHNjaGVt
YSBpbmNsdWRlIHRoZQpzdGFuZGFyZCBHUElPIHByb3ZpZGVyIHByb3BlcnRpZXMgKGxpa2UgZ3Bp
by1jb250cm9sbGVyIGFuZCAjZ3Bpby1jZWxscykKc28gZGV2aWNlIHRyZWVzIGNhbiBhY3R1YWxs
eSBjb25maWd1cmUgYW5kIHV0aWxpemUgdGhlIGFkdmVydGlzZWQgR1BJTwpjYXBhYmlsaXRpZXMg
d2l0aG91dCB0cmlnZ2VyaW5nIHZhbGlkYXRpb24gZXJyb3JzPwoKPiArCj4gK3Byb3BlcnRpZXM6
Cj4gKyAgY29tcGF0aWJsZToKPiArICAgIGNvbnN0OiBueHAscDNoMjg0MAoKW1NldmVyaXR5OiBN
ZWRpdW1dClRoZSBjb21taXQgbWVzc2FnZSBhbmQgc2NoZW1hIGRlc2NyaXB0aW9uIGluZGljYXRl
IHN1cHBvcnQgZm9yIHRoZSBQM0gyeDR4CmZhbWlseSwgaW5jbHVkaW5nIHRoZSBQM0gyNDQwLCBQ
M0gyNDQxLCBhbmQgUDNIMjg0MS4gRG9lcyB0aGlzIGNvbXBhdGlibGUgYmxvY2sKbmVlZCB0byBi
ZSBleHBhbmRlZCBmcm9tIGEgY29uc3QgY29uc3RyYWludCB0byBhbiBlbnVtIHRvIGFsbG93IHN0
cmluZ3MgZm9yCnRob3NlIG90aGVyIHZhcmlhbnRzPwoKQWxzbywgaWYgdGhlIDQtcG9ydCB2YXJp
YW50cyBhcmUgYWRkZWQsIHdvdWxkIHRoZXkgcmVxdWlyZSBkaWZmZXJlbnQgc2NoZW1hCmNvbnN0
cmFpbnRzLCBzdWNoIGFzIGEgbWF4aW11bSBwb3J0IHJlZyBvZiAzIHJhdGhlciB0aGFuIDcgZm9y
IHRoZQpwYXR0ZXJuUHJvcGVydGllcz8KClsgLi4uIF0KCi0tIApTYXNoaWtvIEFJIHJldmlldyDC
tyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA3MDEwNjU3NTUuMjA2Nzc5My0x
LWxha3NoYXkucGlwbGFuaUBueHAuY29tP3BhcnQ9MgoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxp
c3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
