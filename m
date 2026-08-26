Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD33DC5DF97
	for <linux-i3c@archiver.kernel.org>; Wed, 26 Aug 2026 10:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fEYstpugYREmUF2HBt/D9U8pFAZVM2u6Nat35hJ0tbM=; b=kRDyRBGZWLWCOn
	r6DzbvB5VwOzlOkc7hX8ttTtGlszXyB8AyGnw5lMsJCyZq4WU8xG9njMlX4qvIjI27ulAEWHyNLEY
	MsZsRqaRsh+KFtlPfX7pC3NrQWDvBd91GUl1eo1npIxsCkK2Ynf1uWBeDgnrB3ra6C3qXEgJWetPe
	SrGVN9HPwgqWqM099hCpHq6RBGnF5r4nn6aCevEG6hSdlGlbqwbut4ary5jM14uCxHRngsj72JH0Z
	HSyLkZpMF4BI82Qx6xi66qXB7NJk7eFUUp4I264DrhTSSgcEyOd/VcQBhwANtMTC8uYtpw7jaDpdU
	SM1KsRsOzdoWXMY8Bqlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzBJC-00000002KWn-1dWX;
	Wed, 26 Aug 2026 10:56:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzBJA-00000002KWS-1vNH
	for linux-i3c@lists.infradead.org;
	Wed, 26 Aug 2026 10:56:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 92E0C6020E;
	Wed, 26 Aug 2026 10:56:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D99381F000E9;
	Wed, 26 Aug 2026 10:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787741799;
	bh=v0uWvgSlqSWeY0k6fpcMY3AbmnpmWz9lYTAw8yuXkYQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NgRab2mgTOk65X168APvCM6M57YpvVnV/eA7GjNZW28K7E2fwMBCuBCd/XWN6L18P
	 tVi+9g9/PWcSinB/7QNK4gkQi0jhEiS/rjZx+w0KZX92fz7+O4Zx0Sh219zb+8QGOX
	 5pjflpAQXpINfym5Ua5RfcaZl7ggPwMDMHCefmOPvqbaMz4I5m8fbHY2EJhlOIQTJm
	 zpode+AL/N4+dvdo6K+3OEaYSN5my8Pq8wiV0DQV4S6/qxOiYG/ABjRVS78V2KRPCy
	 BPhPgbv+lSB2pzLki+RCwJHE2IVITTay/3qKdlL+3VLAQ4I3W9Q+v2G9NrKNXuiju5
	 WV21cNClo0ESw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v16 4/8] mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c
 hub and on-die regulator
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, robh@kernel.org, linux-i3c@lists.infradead.org, conor+dt@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260826103819.1614843-5-lakshay.piplani@nxp.com>
References: <20260826103819.1614843-1-lakshay.piplani@nxp.com>
 <20260826103819.1614843-5-lakshay.piplani@nxp.com>
Date: Wed, 26 Aug 2026 10:56:38 +0000
Message-Id: <20260826105638.D99381F000E9@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gTUZEIEFyY2hpdGVjdHVy
ZSBWaW9sYXRpb246IEdsb2JhbCBoZWFkZXIgcGxhY2VtZW50IGFuZCBiZXNwb2tlIGludGVybWVk
aWF0ZSBwYXJlbnQgc3RydWN0dXJlLgotLQoKY29tbWl0IGY3NDY4MDQyMWU0YzM3MDMzMGVkMDUx
ZjY4MTE1YzQ4OGNjNDg5MzMKQXV0aG9yOiBBbWFuIEt1bWFyIFBhbmRleSA8YW1hbi5rdW1hcnBh
bmRleUBueHAuY29tPgoKbWZkOiBwM2gyeDR4OiBBZGQgZHJpdmVyIGZvciBOWFAgUDNIMng0eCBp
M2MgaHViIGFuZCBvbi1kaWUgcmVndWxhdG9yCgpBZGQgY29yZSBNRkQgc3VwcG9ydCBmb3IgdGhl
IE5YUCBQM0gyeDR4IChQM0gyNDQwL1AzSDI0NDEvUDNIMjg0MC9QM0gyODQxKQpmYW1pbHkgb2Yg
bXVsdGlwb3J0IEkzQyBodWIgZGV2aWNlcy4gVGhlc2UgZGV2aWNlcyBjb25uZWN0IHRvIGEgaG9z
dCB2aWEKSTNDL0kyQy9TTUJ1cyBhbmQgZXhwb3NlIG11bHRpcGxlIGRvd25zdHJlYW0gdGFyZ2V0
IHBvcnRzLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZmQvcDNoMjg0MC5jIGIvZHJpdmVycy9t
ZmQvcDNoMjg0MC5jCj4gaW5kZXggMDAwMDAwMDAwMDAwMC4uZjhjZWY1NGNlNzA2Mgo+IC0tLSAv
ZGV2L251bGwKPiArKysgYi9kcml2ZXJzL21mZC9wM2gyODQwLmMKPiBAQCAtMCwwICsxLDE2OCBA
QApbIC4uLiBdCj4gKy8qIFJlYWQgcG9ydCBjb3VudCBmcm9tIHRoZSBkZXZpY2UgY2FwYWJpbGl0
eSByZWdpc3RlciAoNC0gb3IgOC1wb3J0IHZhcmlhbnQpLiAqLwo+ICtzdGF0aWMgaW50IHAzaDJ4
NHhfcmVhZF9udW1fdGFyZ2V0X3BvcnRzKHN0cnVjdCBkZXZpY2UgKmRldiwKPiArCQkJCQkgc3Ry
dWN0IHAzaDJ4NHggKmRkYXRhKQo+ICt7Cj4gKwl1bnNpZ25lZCBpbnQgdmFsOwo+ICsJaW50IHJl
dDsKPiArCj4gKwlyZXQgPSByZWdtYXBfcmVhZChkZGF0YS0+cmVnbWFwLCBQM0gyWDRYX0RFVl9D
QVBBQiwgJnZhbCk7Cj4gKwlpZiAocmV0KQo+ICsJCXJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwg
cmV0LAo+ICsJCQkJICAgICAiRmFpbGVkIHRvIHJlYWQgZGV2aWNlIGNhcGFiaWxpdHlcbiIpOwo+
ICsKPiArCWRkYXRhLT5udW1fdGFyZ2V0X3BvcnRzID0gKHZhbCAmIFAzSDJYNFhfVEFSR0VUX1BP
UlRfQ09VTlQpID8KPiArCQlQM0gyWDRYX1RBUkdFVF9QT1JUU184IDogUDNIMlg0WF9UQVJHRVRf
UE9SVFNfNDsKCltTZXZlcml0eTogTG93XQpEb2VzIHAzaDJ4NHhfcmVhZF9udW1fdGFyZ2V0X3Bv
cnRzKCkgdmlvbGF0ZSB0aGUgTUZEIHN1YnN5c3RlbSBndWlkZWxpbmVzIGJ5CmluaXRpYWxpemlu
ZyBjaGlsZC1zcGVjaWZpYyByZXNvdXJjZXMgaW4gdGhlIHBhcmVudCBkcml2ZXI/IFByaXZhdGUg
cmVzb3VyY2VzCnNob3VsZCBiZSBpbml0aWFsaXplZCBkaXJlY3RseSBpbiB0aGUgY2hpbGQgZHJp
dmVyIHRoYXQgY29uc3VtZXMgdGhlbS4KCj4gKwo+ICsJcmV0dXJuIDA7Cj4gK30KWyAuLi4gXQo+
IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L21mZC9wM2gyODQwLmggYi9pbmNsdWRlL2xpbnV4
L21mZC9wM2gyODQwLmgKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAw
MDAuLmViNDc5MmRlNTQ0MGUKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvaW5jbHVkZS9saW51eC9t
ZmQvcDNoMjg0MC5oCj4gQEAgLTAsMCArMSw0MSBAQAo+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogR1BMLTIuMCAqLwo+ICsvKgo+ICsgKiBDb3B5cmlnaHQgMjAyNS0yMDI2IE5YUAo+ICsg
Ki8KPiArCj4gKyNpZm5kZWYgX0xJTlVYX01GRF9QM0gyODQwX0gKPiArI2RlZmluZSBfTElOVVhf
TUZEX1AzSDI4NDBfSAoKW1NldmVyaXR5OiBMb3ddCklzIHRoaXMgZHJpdmVyLXNwZWNpZmljIGhl
YWRlciBmaWxlIGluYXBwcm9wcmlhdGVseSBwbGFjZWQgaW4gdGhlIGdsb2JhbApNRkQgaW5jbHVk
ZSBwYXRoPyBEcml2ZXItc3BlY2lmaWMgaGVhZGVycyBvbmx5IHVzZWQgYnkgdGhlIHBhcmVudCBh
bmQgaXRzCmltbWVkaWF0ZSBjaGlsZHJlbiBzaG91bGQgcmVtYWluIGxvY2FsIHRvIHRoZSBkcml2
ZXJzL21mZC8gZGlyZWN0b3J5LgoKPiArCj4gKyNpbmNsdWRlIDxsaW51eC9iaXRzLmg+Cj4gKyNp
bmNsdWRlIDxsaW51eC9tdXRleC5oPgo+ICsjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KWyAuLi4g
XQo+ICtzdHJ1Y3QgcDNoMng0eF9pM2NfaHViX2RldjsKPiArCj4gK3N0cnVjdCBwM2gyeDR4IHsK
PiArCXN0cnVjdCBpM2NfZGV2aWNlICppM2NkZXY7Cj4gKwlzdHJ1Y3QgcmVnbWFwICpyZWdtYXA7
Cj4gKwkvKiBOdW1iZXIgb2YgZG93bnN0cmVhbSB0YXJnZXQgcG9ydHMgKDQgb3IgOCkuICovCj4g
Kwl1OCBudW1fdGFyZ2V0X3BvcnRzOwo+ICsJLyogU2VyaWFsaXplcyBwcm90ZWN0ZWQgcmVnaXN0
ZXIgdW5sb2NrL2xvY2sgc2VxdWVuY2VzIGFjcm9zcyBNRkQgY2hpbGRyZW4uICovCj4gKwlzdHJ1
Y3QgbXV0ZXggcHJvdGVjdGVkX3JlZ19sb2NrOwo+ICsJLyogSHViIGNvbnRleHQgZm9yIHRoZSBJ
QkkgaGFuZGxlciB0byByZWFjaCBodWIgc3RhdGUgdmlhIHRoZSBwYXJlbnQgaTNjZGV2LiAqLwo+
ICsJc3RydWN0IHAzaDJ4NHhfaTNjX2h1Yl9kZXYgKmkzY19odWJfcHJpdjsKPiArfTsKCltTZXZl
cml0eTogTG93XQpEb2VzIHN0cnVjdCBwM2gyeDR4IGFnZ3JlZ2F0ZSBjaGlsZC1zcGVjaWZpYyBk
YXRhIGFuZCBjcmVhdGUgYSBiZXNwb2tlCmludGVybWVkaWF0ZSBwYXJlbnQgc3RydWN0dXJlPyBU
aGlzIGNyZWF0ZXMgYmlkaXJlY3Rpb25hbCBjb3VwbGluZyBhbmQgYnlwYXNzZXMKTUZEIGlzb2xh
dGlvbiBib3VuZGFyaWVzLiBDaGlsZCBkcml2ZXJzIHNob3VsZCBkaXJlY3RseSBhY2Nlc3MgcGFy
ZW50IGRhdGEgdXNpbmcKc3RhbmRhcmQgQVBJcyByYXRoZXIgdGhhbiByZWx5aW5nIG9uIGN1c3Rv
bSBwYXJlbnQtaW5pdGlhbGl6ZWQgcHJpdmF0ZQpyZXNvdXJjZXMuCgo+ICsjZW5kaWYgLyogX0xJ
TlVYX01GRF9QM0gyODQwX0ggKi8KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nh
c2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA4MjYxMDM4MTkuMTYxNDg0My0xLWxha3NoYXkucGlw
bGFuaUBueHAuY29tP3BhcnQ9NAoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1pM2MK
