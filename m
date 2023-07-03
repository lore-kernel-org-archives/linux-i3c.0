Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CBC2EB64DC
	for <linux-i3c@archiver.kernel.org>; Mon,  3 Jul 2023 08:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5KwJPIcFUqxU2Nw5clIy8fjcG6jLJ+uxfc7+5XtS4JY=; b=AjkdzCltlckeaD
	+C1gyzBgqY+mdkXu3Q1gVgc4yeZbNFjnpgSJwDdhQpoF2KTMv2dVkNZ3IMN1DfxwtCodLHeT9sKPo
	oEAHntX5n0uSdW8Oz8ttpLjYcgGiX0KFNTbgPvZ0jSgv4RQX8Wz6etGizcyAVLflb6tgEGyfBMZoE
	996F0Fg0knaJZiKI7AtrAsCpiMv0/S92wBo9Msx4rKMuZ1Fsnbm3CKaksuMCh96kw0PNkzKVrJ76u
	R3C2WUfvnzov5TgpmPDowX7heddYEc8lFjkDiknxlQg7HNuRG4i5nzPzQaje6hDFqIXuGxr3H906G
	EHCQrQoRps6fp1FJm8hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGEWz-009gWU-1Y;
	Mon, 03 Jul 2023 08:03:33 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGEWx-009gVI-1D
	for linux-i3c@lists.infradead.org;
	Mon, 03 Jul 2023 08:03:32 +0000
Received: from [192.168.12.102] (unknown [159.196.94.230])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 05B832012A;
	Mon,  3 Jul 2023 16:03:24 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1688371405;
	bh=cWpF5JJN1GttTOjX6qHk7ogjI3dJHCQtxWXJoea1Yu0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=JUc1nKQjyuDyFKcnWg5Vlp+jKMjyiISlQr90GC/GfWRsc92e5dPyE+fnaXw+pmNJb
	 2Y6FcqFbCEoLcOWb3CZlsdurlIWWQ+aQEFZiBB4a/dp7XcCOSq6TdacsxMJ6nuTA+i
	 G4lq8fT/mwhhpOx7q0OC8RK+QgyZg+Qtk4MaEwJCASuohnse/ZeSxUnpnL0M7DhALS
	 zji4oMfTwVWqfNgua/KWlyd0WFE7xTYoiMuiBISHWWuFBjNynfA/uMZWPqNM9cWHDF
	 xe3eI3HPSuc5kXSjlhUADvGvw/G6tCjTEfAtpzFToPp5qUpGekks/POrwiQx8c5EIo
	 kyHlCpoSiD1ig==
Message-ID: <a64b2619b0ee475ac0d4bad14826137d05372541.camel@codeconstruct.com.au>
Subject: Re: [PATCH 1/3] dt-bindings: i3c: Add mctp-controller property
From: Matt Johnston <matt@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-i3c@lists.infradead.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, Eric Dumazet <edumazet@google.com>, "David S.
 Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>,  Jeremy Kerr <jk@codeconstruct.com.au>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring
 <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Date: Mon, 03 Jul 2023 16:03:23 +0800
In-Reply-To: <CAGE=qrrqE3Vj1Bs+cC51gKPDmsqMTyHEAJhsrGCyS_jYKf42Gw@mail.gmail.com>
References: <20230703053048.275709-1-matt@codeconstruct.com.au>
	 <20230703053048.275709-2-matt@codeconstruct.com.au>
	 <CAGE=qrrqE3Vj1Bs+cC51gKPDmsqMTyHEAJhsrGCyS_jYKf42Gw@mail.gmail.com>
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_010331_603064_F333F252 
X-CRM114-Status: GOOD (  15.92  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAyMDIzLTA3LTAzIGF0IDA5OjE1ICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOgo+IE9uIE1vbiwgMyBKdWwgMjAyMyBhdCAwNzozMSwgTWF0dCBKb2huc3RvbiA8bWF0dEBj
b2RlY29uc3RydWN0LmNvbS5hdT4gd3JvdGU6Cj4gPiAKPiA+IFRoaXMgcHJvcGVydHkgaXMgdXNl
ZCB0byBkZXNjcmliZSBhIEkzQyBidXMgd2l0aCBhdHRhY2hlZCBNQ1RQIEkzQwo+ID4gdGFyZ2V0
IGRldmljZXMuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IE1hdHQgSm9obnN0b24gPG1hdHRAY29k
ZWNvbnN0cnVjdC5jb20uYXU+Cj4gPiAtLS0KPiA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvaTNjL2kzYy55YW1sIHwgNCArKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2kzYy9pM2MueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9pM2MvaTNjLnlhbWwKPiA+IGluZGV4IGZkYjQyMTIxNDllNy4uMDg3MzFlMjQ4NGYyIDEwMDY0
NAo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kzYy9pM2MueWFt
bAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kzYy9pM2MueWFt
bAo+ID4gQEAgLTU1LDYgKzU1LDEwIEBAIHByb3BlcnRpZXM6Cj4gPiAKPiA+ICAgICAgICBNYXkg
bm90IGJlIHN1cHBvcnRlZCBieSBhbGwgY29udHJvbGxlcnMuCj4gPiAKPiA+ICsgIG1jdHAtY29u
dHJvbGxlcjoKPiA+ICsgICAgZGVzY3JpcHRpb246IHwKPiA+ICsgICAgICBJbmRpY2F0ZXMgdGhh
dCB0aGlzIGJ1cyBob3N0cyBNQ1RQLW92ZXItSTNDIHRhcmdldCBkZXZpY2VzLgo+IAo+IEkgaGF2
ZSBkb3VidHMgeW91IGFjdHVhbGx5IHRlc3RlZCBpdCAtIHRoZXJlIGlzIG5vIHR5cGUvcmVmLiBB
bHNvLAo+IHlvdXIgZGVzY3JpcHRpb24gaXMgYSBiaXQgZGlmZmVyZW50IHRoYW4gZXhpc3Rpbmcg
ZnJvbSBkdHNjaGVtYS4gV2h5Pwo+IEFyZW4ndCB0aGVzZSB0aGUgc2FtZSB0aGluZ3M/CgpBaCwg
SSdsbCBhZGQgCiRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL2ZsYWcKCkkg
cmFuIGR0X2JpbmRpbmdfY2hlY2sgYW5kbWFrZSBkdF9iaW5kaW5nX2NoZWNrIFwgICDCoAogIERU
X1NDSEVNQV9GSUxFUz1Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTNjL2kzYy55
YW1sCgo/CgoKCgo+IAo+IEJlc3QgcmVnYXJkcywKPiBLcnp5c3p0b2YKPiAKCgotLSAKbGludXgt
aTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
