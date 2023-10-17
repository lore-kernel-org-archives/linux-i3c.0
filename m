Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF802CDB482
	for <linux-i3c@archiver.kernel.org>; Tue, 17 Oct 2023 14:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zu0gGfgtN7LEbLuA9+ASBP1GVUCLHNI+r+6UIoioQOM=; b=CgYPSldNJccQv8
	ruWM80A/atAlmR8nJCnvI/VByk5liSMajDwvJoK6oKlEX4JETQG7p21O8+PpbQiIxgK+xjEhH0syN
	ImdU0m23bYjTQdp5M6dEizpDlhfNzpD9ZQn5xUdMnj5HI2Cfjp1FYlM75570v+hxcQBv2SSMkzOkR
	FukVjuNsvxQDUl5bLQSFN3khoIwpnpkIDox6R5KQgBqDyeXyqkkmjRYt9GIcAA2OfAEB1f6dIGu1D
	cg3L9PUB6vKLeQ+xMVs02PngqvKA0jsuzbGXMdyGEwyW2e+OCwz7QV+d9tErDx4nAROHUQpR/J5v+
	Fhidni+pqn9tanwUNG1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qskm2-00CV0t-1V;
	Tue, 17 Oct 2023 14:10:18 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsklz-00CUzh-0F
	for linux-i3c@lists.infradead.org;
	Tue, 17 Oct 2023 14:10:16 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 609A92000D;
	Tue, 17 Oct 2023 14:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697551811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QBPY2hSGglGk838ElQLUx0rBOrbcTUvJ3BnBggnTEkw=;
	b=fDQFLQNA85IdB5g2Zco+Yf30Tl6DcXhIHK0Ln7bAayNZrtSLBJV064yJNrapFIEhSGmQLe
	3+hnGYb+V/E2rcuJZsX/WgKZKdhWYTgOLaNz9b85T//g3L01Cz2AH4oX7RAo/A29Zp7PSR
	U14IJetJv2/nF5ZPH9VMtyQ3qqtdv/1HW9U5Hg7AtIUStRS7w9GlTzJCEQhGCnDPIrJGKZ
	4l4qFnE8LC8S8kUSFGJrjo8D56is9p8p1wHqzGIWj/zH2DHFZri1cJuXZnhiiPljjVfO3U
	N02TCxK8KtPh/YAW37WvS3L2oUtodGJNh1jN+QqxjVJ8EcjXmlX1WopwYfg+lQ==
Date: Tue, 17 Oct 2023 16:10:07 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
 joe@perches.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 4/5] i3c: master: svc return actual transfer data len
Message-ID: <20231017161007.146a5199@xps-13>
In-Reply-To: <20231016154632.2851957-5-Frank.Li@nxp.com>
References: <20231016154632.2851957-1-Frank.Li@nxp.com>
	<20231016154632.2851957-5-Frank.Li@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_071015_270576_275CAB11 
X-CRM114-Status: GOOD (  15.89  )
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

SGkgRnJhbmssCgpGcmFuay5MaUBueHAuY29tIHdyb3RlIG9uIE1vbiwgMTYgT2N0IDIwMjMgMTE6
NDY6MzEgLTA0MDA6Cgo+IEkzQyBhbGxvdyBkZXZpY2VzIGVhcmx5IHRlcm1pbmF0ZSBkYXRhIHRy
YW5zZmVyLiBTbyBzZXQgImFjdHVhbCIgdG8KPiBpbmRpY2F0ZSBob3cgbXVjaCBkYXRhIGdldCBi
eSBpM2NfcHJpdl94ZmVyLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEZyYW5rIExpIDxGcmFuay5MaUBu
eHAuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYyB8IDcg
KysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jIGIvZHJpdmVycy9pM2MvbWFz
dGVyL3N2Yy1pM2MtbWFzdGVyLmMKPiBpbmRleCAzNTcwYjcwOWNmNjAuLjQ0NDgyNWFhZmE2ZiAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYwo+ICsrKyBi
L2RyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jCj4gQEAgLTEzOCw2ICsxMzgsNyBA
QCBzdHJ1Y3Qgc3ZjX2kzY19jbWQgewo+ICAJY29uc3Qgdm9pZCAqb3V0Owo+ICAJdW5zaWduZWQg
aW50IGxlbjsKPiAgCXVuc2lnbmVkIGludCBhY3R1YWxfbGVuOwo+ICsJc3RydWN0IGkzY19wcml2
X3hmZXIgKnhmZXI7Cj4gIAlib29sIGNvbnRpbnVlZDsKPiAgfTsKPiAgCj4gQEAgLTEwNDUsNiAr
MTA0Niw3IEBAIHN0YXRpYyBpbnQgc3ZjX2kzY19tYXN0ZXJfeGZlcihzdHJ1Y3Qgc3ZjX2kzY19t
YXN0ZXIgKm1hc3RlciwKPiAgCj4gIAlpZiAocmVhZGwobWFzdGVyLT5yZWdzICsgU1ZDX0kzQ19N
RVJSV0FSTikgJiBTVkNfSTNDX01FUlJXQVJOX05BQ0spIHsKPiAgCQlyZXQgPSAtRU5YSU87Cj4g
KwkJKmFjdHVhbF9sZW4gPSAwOwo+ICAJCWdvdG8gZW1pdF9zdG9wOwo+ICAJfQo+ICAKPiBAQCAt
MTA2Miw2ICsxMDY0LDcgQEAgc3RhdGljIGludCBzdmNfaTNjX21hc3Rlcl94ZmVyKHN0cnVjdCBz
dmNfaTNjX21hc3RlciAqbWFzdGVyLAo+ICAJICovCj4gIAlpZiAoU1ZDX0kzQ19NU1RBVFVTX0lC
SVdPTihyZWcpKSB7Cj4gIAkJcmV0ID0gLUVOWElPOwo+ICsJCSphY3R1YWxfbGVuID0gMDsKPiAg
CQlnb3RvIGVtaXRfc3RvcDsKPiAgCX0KPiAgCj4gQEAgLTExNTcsNiArMTE2MCw5IEBAIHN0YXRp
YyB2b2lkIHN2Y19pM2NfbWFzdGVyX3N0YXJ0X3hmZXJfbG9ja2VkKHN0cnVjdCBzdmNfaTNjX21h
c3RlciAqbWFzdGVyKQo+ICAJCQkJCSAgY21kLT5hZGRyLCBjbWQtPmluLCBjbWQtPm91dCwKPiAg
CQkJCQkgIGNtZC0+bGVuLCAmY21kLT5hY3R1YWxfbGVuLAo+ICAJCQkJCSAgY21kLT5jb250aW51
ZWQpOwo+ICsJCWlmIChjbWQtPnhmZXIpCj4gKwkJCWNtZC0+eGZlci0+YWN0dWFsID0gY21kLT5h
Y3R1YWxfbGVuOwoKSnVzdCB0byBiZSBzdXJlLCB3b3VsZG4ndCBpdCBiZSBtb3JlIG5hdHVyYWwg
dG8gYWx3YXlzIGZpbGwgY21kLT54ZmVyCnJhdGhlciB0aGFuIGNoZWNraW5nIGl0IGhlcmU/Cgo+
ICsKPiAgCQlpZiAocmV0KQo+ICAJCQlicmVhazsKPiAgCX0KPiBAQCAtMTM0NCw2ICsxMzUwLDcg
QEAgc3RhdGljIGludCBzdmNfaTNjX21hc3Rlcl9wcml2X3hmZXJzKHN0cnVjdCBpM2NfZGV2X2Rl
c2MgKmRldiwKPiAgCWZvciAoaSA9IDA7IGkgPCBueGZlcnM7IGkrKykgewo+ICAJCXN0cnVjdCBz
dmNfaTNjX2NtZCAqY21kID0gJnhmZXItPmNtZHNbaV07Cj4gIAo+ICsJCWNtZC0+eGZlciA9IHhm
ZXJzICsgaTsKClBsZWFzZSBmb2xsb3cgdGhlIHNhbWUgcGF0dGVybiBhcyBiZWxvdzogPSAmeGZl
cnNbaV0KCj4gIAkJY21kLT5hZGRyID0gbWFzdGVyLT5hZGRyc1tkYXRhLT5pbmRleF07Cj4gIAkJ
Y21kLT5ybncgPSB4ZmVyc1tpXS5ybnc7Cj4gIAkJY21kLT5pbiA9IHhmZXJzW2ldLnJudyA/IHhm
ZXJzW2ldLmRhdGEuaW4gOiBOVUxMOwoKClRoYW5rcywKTWlxdcOobAoKLS0gCmxpbnV4LWkzYyBt
YWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
