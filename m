Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E184EC83F14
	for <linux-i3c@archiver.kernel.org>; Tue, 29 Aug 2023 09:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ukcpAUmuqEWppJKdmjQbleqY8a6nD0W3YufD1tSp0SY=; b=awrqwKM+Sv5NoN
	GoSkBHi8kz9uTHmYzS+0tZGRtszZzWk27O30RVVNrv4gxoP/ae7nIQ0C7fQ1rf67GiloJwdeZPgBj
	+D71kYmdVp2X7qdvvxriT7vhQrVcB+o5kJ/2nUMMakG0bIamR82vbSgGysUdwmsOe1obSVMzo83Bh
	oFPji+Yb4XmFhSscma1wi9ihqz/znNmfvRvwGu6wdtQKbScvyq9jAIgLXIM11oqV9qyR7e0nofY8X
	tCv4/VZXX0Ywq7iGx3+NeIfqHTuag1O7E9/W+5myiDqlagcfKiLv44YVMFGRJKeBIe2l+RXkaT9S/
	pbC/WSnEanGKADo3S9ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaupo-00B6oo-11;
	Tue, 29 Aug 2023 09:16:28 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaupg-00B6lm-03
	for linux-i3c@lists.infradead.org;
	Tue, 29 Aug 2023 09:16:26 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 508541BF207;
	Tue, 29 Aug 2023 09:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1693300574;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9vq4ofEpHyOMcy5b5TahWFabzG08hTAP6j/W1z24Ls4=;
	b=EO9fZGZj4zW35tOltEoCC0KpG+J/t9xY52fGD7MMn72vc92p0culeB24Sgw72b9zWBgMUD
	5VpQCIv7B2+DUz9b0Usyfy2zTQdDbEqrRqDulP6p3yMfFykZ73BfupGRbpbkyN4T8SZ+s6
	USd0LZqzAkTcK3Po6m7jLwAsvEKZ8bA0ou9F9fxY78WLQI9ffiFmkGAKKlMIgCXfn1Q0Eb
	qJMJNCVk6GO/jZhdtxBDbt6s3liyg5P/xI9TMDyeYvOpD2igO+ibBZ3zc12jd0VPt+l8Pp
	BN2ZRWvewcN0gJ/KjqXTl/2xYSsEzIsrqs06RJnUSFAHfAscyD02TITD62DXbw==
Date: Tue, 29 Aug 2023 11:16:11 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Conor Culhane <conor.culhane@silvaco.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, linux-i3c@lists.infradead.org (moderated
 list:SILVACO I3C DUAL-ROLE MASTER), linux-kernel@vger.kernel.org (open
 list), imx@lists.linux.dev
Subject: Re: [PATCH 2/2] i3c: master: svc: fix probe failure when no i3c
 device exist
Message-ID: <20230829111611.12f91348@xps-13>
In-Reply-To: <20230828192502.3525418-2-Frank.Li@nxp.com>
References: <20230828192502.3525418-1-Frank.Li@nxp.com>
	<20230828192502.3525418-2-Frank.Li@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230829_021620_204782_F4368B0F 
X-CRM114-Status: GOOD (  18.44  )
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

SGkgRnJhbmssCgpGcmFuay5MaUBueHAuY29tIHdyb3RlIG9uIE1vbiwgMjggQXVnIDIwMjMgMTU6
MjU6MDIgLTA0MDA6Cgo+IElmIHRoZXJlIGFyZSBub3QgaTNjIGRldmljZSwgYWxsIGNjYyBjb21t
YW5kIHdpbGwgZ2V0IE5BQ0suIFNldAoKCQlubwkJCQkJTkFDS2VkPwoKPiBpM2NfY2NjX2NtZDo6
ZXJyIGFzIEkzQ19FUlJPUl9NMi4KClRoaXMgc2VudGVuY2Ugc2hvdWxkIGNvbWUgbGFzdCBhbmQg
YmUgc2xpZ2h0bHkgbW9yZSBleHBsaWNpdC4KCj4gUmV0dXJuIHN1Y2Nlc3Mgd2hlbiBubyBpM2Mg
ZGV2aWNlIGZvdW5kIGF0IHN2Y19pM2NfbWFzdGVyX2RvX2RhYV9sb2NrZWQoKS4KClBsZWFzZSBl
eHBsYWluIHdoeSB0aGlzIGlzIGltcG9ydGFudC91c2VmdWwuCgo+IEZpeGVzOiBkZDNjNTI4NDZk
NTkgKCJpM2M6IG1hc3Rlcjogc3ZjOiBBZGQgU2lsdmFjbyBJM0MgbWFzdGVyIGRyaXZlciIpCgpT
aGFsbCB3ZSBjb25zaWRlciBhIGJhY2twb3J0IGludG8gc3RhYmxlIGtlcm5lbHM/Cgo+IFNpZ25l
ZC1vZmYtYnk6IEZyYW5rIExpIDxGcmFuay5MaUBueHAuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2kz
Yy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYyB8IDEzICsrKysrKysrKysrLS0KPiAgMSBmaWxlIGNo
YW5nZWQsIDExIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jIGIvZHJpdmVycy9pM2MvbWFzdGVy
L3N2Yy1pM2MtbWFzdGVyLmMKPiBpbmRleCA3NzBiNDBlMjgwMTVlLi5hNTYyMDEwM2FjYjczIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jCj4gKysrIGIv
ZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMKPiBAQCAtNzg5LDYgKzc4OSw5IEBA
IHN0YXRpYyBpbnQgc3ZjX2kzY19tYXN0ZXJfZG9fZGFhX2xvY2tlZChzdHJ1Y3Qgc3ZjX2kzY19t
YXN0ZXIgKm1hc3RlciwKPiAgCQkJCSAqLwo+ICAJCQkJYnJlYWs7Cj4gIAkJCX0gZWxzZSBpZiAo
U1ZDX0kzQ19NU1RBVFVTX05BQ0tFRChyZWcpKSB7Cj4gKwkJCQkvKiBObyBJM0MgZGV2aWNlcyBh
dHRhY2hlZCAqLwo+ICsJCQkJaWYgKGRldl9uYiA9PSAwKQo+ICsJCQkJCWJyZWFrOwoKXG4gPwoK
PiAgCQkJCS8qCj4gIAkJCQkgKiBBIHNsYXZlIGRldmljZSBuYWNrZWQgdGhlIGFkZHJlc3MsIHRo
aXMgaXMKPiAgCQkJCSAqIGFsbG93ZWQgb25seSBvbmNlLCBEQUEgd2lsbCBiZSBzdG9wcGVkIGFu
ZAo+IEBAIC0xMjYzLDExICsxMjY2LDE3IEBAIHN0YXRpYyBpbnQgc3ZjX2kzY19tYXN0ZXJfc2Vu
ZF9jY2NfY21kKHN0cnVjdCBpM2NfbWFzdGVyX2NvbnRyb2xsZXIgKm0sCj4gIHsKPiAgCXN0cnVj
dCBzdmNfaTNjX21hc3RlciAqbWFzdGVyID0gdG9fc3ZjX2kzY19tYXN0ZXIobSk7Cj4gIAlib29s
IGJyb2FkY2FzdCA9IGNtZC0+aWQgPCAweDgwOwo+ICsJaW50IHJldDsKPiAgCj4gIAlpZiAoYnJv
YWRjYXN0KQo+IC0JCXJldHVybiBzdmNfaTNjX21hc3Rlcl9zZW5kX2JkY2FzdF9jY2NfY21kKG1h
c3RlciwgY21kKTsKPiArCQlyZXQgPSBzdmNfaTNjX21hc3Rlcl9zZW5kX2JkY2FzdF9jY2NfY21k
KG1hc3RlciwgY21kKTsKPiAgCWVsc2UKPiAtCQlyZXR1cm4gc3ZjX2kzY19tYXN0ZXJfc2VuZF9k
aXJlY3RfY2NjX2NtZChtYXN0ZXIsIGNtZCk7Cj4gKwkJcmV0ID0gc3ZjX2kzY19tYXN0ZXJfc2Vu
ZF9kaXJlY3RfY2NjX2NtZChtYXN0ZXIsIGNtZCk7Cj4gKwo+ICsJaWYgKHJldCkKPiArCQljbWQt
PmVyciA9IEkzQ19FUlJPUl9NMjsKPiArCj4gKwlyZXR1cm4gcmV0Owo+ICB9Cj4gIAo+ICBzdGF0
aWMgaW50IHN2Y19pM2NfbWFzdGVyX3ByaXZfeGZlcnMoc3RydWN0IGkzY19kZXZfZGVzYyAqZGV2
LAoKClRoYW5rcywKTWlxdcOobAoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1pM2MK
