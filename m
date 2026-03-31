Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC31109B462
	for <linux-i3c@archiver.kernel.org>; Tue, 31 Mar 2026 12:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8XSdPZGbhfQfSC+Pv4GR7LW2YzLH5+aYvwJlhvsPH78=; b=Vq8xKdI7TROfzI
	tbugMx7xqPPl8TSOPPCDNA8TzXKKnUBPDPd+U/3SfTc4zwgSitE/Nu8cbAIQFvlGYIhL/Dq8gDVjR
	llHTlfym3z8Wjl23+DbiQ9OdoK4dHGIiL1kW8iSz4l93ExcvQALp2Qa0ECER6RXJIvAnfRnR5+qVJ
	h6dSP3G/c25LZs8OLpL+BgRTMhi6bNkHpH06zm4f6+l/lgCvtd1siByKFhZq8/kVKZy1gzsmznQfz
	5Q+NV4+ApmqDQ4iZcRpwv5McyybAnkdbS63DxAc1skN8tGr9XkjzFgx2e/ck5XijEWpUaDmhXuprf
	g+Aw3HVv+sJiu1WtKIMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7YaA-0000000Cy11-3Zo3;
	Tue, 31 Mar 2026 12:52:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Ya9-0000000Cy0v-1rWD
	for linux-i3c@lists.infradead.org;
	Tue, 31 Mar 2026 12:52:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AD97D6091C;
	Tue, 31 Mar 2026 12:52:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57850C2BC9E;
	Tue, 31 Mar 2026 12:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774961552;
	bh=GBjwwlhVRcZ8E+Q1FxdQHIvN3dai7IBRu3SVYHZ0k7Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BVNw43TJieGw6X1WBgDs2qcxUcKy8Zj6xYCp0Yn7sEMzx3JO09tBm7cJGVP/O1MVN
	 I/93E9jsBd+PEohshpaI5/lUPnhm1JvHqI7sfbkEW4WO6C59NhwH2A/cqzwi1mGM++
	 82TUAQyPmbOAQMho7/CsdmqITR25XSNKY1mft8rvSvBKKzY2TJL4pRuSO5dLRabfe7
	 Ht5t8/Hg4p708cJ1At1p1tdusz7AmjpjnDyJaplttMsYJcvNDzVqdLwQHuWEyrvC1K
	 r6Q48uXNILx5pEMqMnYu9m2RmnfJEYMybLYk8jHR1qDG67L2j5xnH+jOTt8okmFMof
	 juvPZRV5dAV3g==
Date: Tue, 31 Mar 2026 13:52:26 +0100
From: Lee Jones <lee@kernel.org>
To: Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, broonie@kernel.org,
	Frank.Li@nxp.com, lgirdwood@gmail.com, vikash.bansal@nxp.com,
	priyanka.jain@nxp.com, aman.kumarpandey@nxp.com
Subject: Re: [PATCH v8 4/7] mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c hub
 and on-die regulator
Message-ID: <20260331125226.GF3795166@google.com>
References: <20260323062737.886728-1-lakshay.piplani@nxp.com>
 <20260323062737.886728-5-lakshay.piplani@nxp.com>
 <20260331112918.GD3795166@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260331112918.GD3795166@google.com>
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

T24gVHVlLCAzMSBNYXIgMjAyNiwgTGVlIEpvbmVzIHdyb3RlOgoKPiBPbiBNb24sIDIzIE1hciAy
MDI2LCBMYWtzaGF5IFBpcGxhbmkgd3JvdGU6Cj4gCj4gPiBGcm9tOiBBbWFuIEt1bWFyIFBhbmRl
eSA8YW1hbi5rdW1hcnBhbmRleUBueHAuY29tPgo+ID4gCj4gPiBBZGQgY29yZSBNRkQgc3VwcG9y
dCBmb3IgdGhlIE5YUCBQM0gyeDR4IChQM0gyNDQwL1AzSDI0NDEvUDNIMjg0MC9QM0gyODQxKQo+
ID4gZmFtaWx5IG9mIG11bHRpcG9ydCBJM0MgaHViIGRldmljZXMuIFRoZXNlIGRldmljZXMgY29u
bmVjdCB0byBhIGhvc3QgdmlhCj4gPiBJM0MvSTJDL1NNQnVzIGFuZCBleHBvc2UgbXVsdGlwbGUg
ZG93bnN0cmVhbSB0YXJnZXQgcG9ydHMuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEFtYW4gS3Vt
YXIgUGFuZGV5IDxhbWFuLmt1bWFycGFuZGV5QG54cC5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBW
aWthc2ggQmFuc2FsIDx2aWthc2guYmFuc2FsQG54cC5jb20+Cj4gPiAKPiA+IC0tLQo+ID4gQ2hh
bmdlcyBpbiB2ODoKPiA+ICAtIE5vIGNoYW5nZQo+ID4gCj4gPiBDaGFuZ2VzIGluIHY3Ogo+ID4g
IC0gVXNlIG5ldyBjb25maWcgSTNDX09SX0kyQwo+ID4gCj4gPiBDaGFuZ2VzIGluIHY2Ogo+ID4g
IC0gTm8gY2hhbmdlCj4gPiAKPiA+IENoYW5nZXMgaW4gdjU6Cj4gPiAgLSBDb3JyZWN0ZWQgdGhl
IG9yZGVyaW5nIGluIHRoZSBNYWtlZmlsZSBhbmQgS2NvbmZpZyBmb3IgTUZEX1AzSDJYNFgKPiA+
ICAtIFVwZGF0ZWQgZGV2X2Vycl9wcm9iZSgpIGZvciByZWdtYXBfaW5pdCBmYWlsdXJlLgo+ID4g
IC0gVXBkYXRlZCBtb2R1bGUgZGVzY3JpcHRpb24KPiA+IAo+ID4gQ2hhbmdlcyBpbiB2NDoKPiA+
ICAtIFNwbGl0IHRoZSBkcml2ZXIgaW50byB0aHJlZSBzZXBhcmF0ZSBwYXRjaGVzKG1mZCwgcmVn
dWxhdG9yIGFuZCBJM0MgaHViKQo+ID4gIC0gQWRkZWQgc3VwcG9ydCBmb3IgTlhQIFAzSDJ4NHgg
TUZEIGZ1bmN0aW9uYWxpdHkKPiA+IC0tLQo+ID4gLS0tCj4gPiAgTUFJTlRBSU5FUlMgICAgICAg
ICAgICAgICAgIHwgICAyICsKPiA+ICBkcml2ZXJzL21mZC9LY29uZmlnICAgICAgICAgfCAgMTMg
KysrKwo+ID4gIGRyaXZlcnMvbWZkL01ha2VmaWxlICAgICAgICB8ICAgMSArCj4gPiAgZHJpdmVy
cy9tZmQvcDNoMjg0MC5jICAgICAgIHwgMTI1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKwo+ID4gIGluY2x1ZGUvbGludXgvbWZkL3AzaDI4NDAuaCB8ICAyNyArKysrKysrKwo+
ID4gIDUgZmlsZXMgY2hhbmdlZCwgMTY4IGluc2VydGlvbnMoKykKPiA+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgZHJpdmVycy9tZmQvcDNoMjg0MC5jCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1
ZGUvbGludXgvbWZkL3AzaDI4NDAuaAoKWy4uLl0KCj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9s
aW51eC9tZmQvcDNoMjg0MC5oIGIvaW5jbHVkZS9saW51eC9tZmQvcDNoMjg0MC5oCj4gPiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi5jYmE2ZmE1MTZkMWUKPiA+
IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL2luY2x1ZGUvbGludXgvbWZkL3AzaDI4NDAuaAo+ID4g
QEAgLTAsMCArMSwyNyBAQAo+ID4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4w
ICovCj4gCj4gVGhlc2Ugc2hvdWxkIHVzZSAvLyBpbiBoZWFkZXIgZmlsZXMuCgpJZ25vcmUgdGhp
cy4gIEkndmUgbGVhZCB5b3UgYXN0cmF5IHRoZXJlLgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pav
XQoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
