Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 128D1CDB482
	for <linux-i3c@archiver.kernel.org>; Tue, 17 Oct 2023 14:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oSizs1RLqvmbrWQl1Ude0+R3KPRTDqNOpPQlOgIPsb4=; b=kxbkO5aZkNSgjf
	6n/jqwbAWdZuajapLSvbhIZwabxjCtR2sJjLBFPPa6xApl/mHmCXBNQAUd43kLAkWXZIJXcl/faQ0
	/HFhcbvbeRLFIEElg1v/wtJuIZmT2vu4qf8jSOAWWccBcqKz3I4yMu6vfUWeEgxzBfT0OKdbfZmWR
	xQcrUXPYQHSZOSpMwP+fSLYI10dNNsYmFAvwpB20GwOiUgi+nM3ZTy+KVI/G0ruv+2Q2CptsBSuao
	dOvKN83wFRrJpCIwSydqf99H7/3Q7J3JIaEXgf2IwSHL4N/ijEAXFwX16Uem403xR0ev7sQnAdl3z
	/ykMRMnpnsmYBiBPutQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsl41-00CWoO-2b;
	Tue, 17 Oct 2023 14:28:53 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsl3y-00CWna-2z
	for linux-i3c@lists.infradead.org;
	Tue, 17 Oct 2023 14:28:52 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 766781C000F;
	Tue, 17 Oct 2023 14:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697552928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H06xgNvMXJ6SsKeqQHp4zd1+AMWk0M/uohUueGKhjos=;
	b=FVx2NcnSpS/Z73Uly6cHt9btSMQoc4RAgx41qBu8AKj2oPSyP6tJ5g1ieSTjwXnshVThzk
	1LRWrrwh0VrKQvUe8rR6wbz6H1JVlFfokY9kn2kGU6r+NTh9ek9B1ovnPJimHa97l9Ett8
	i9MOCy8m6zKndFEBMpizrD2+/IWZ4J8+1vkazQn9TXiJAWp/M68DhiePEjRYS5geN0YafT
	FU7T4rjIwG4qpFCvrmu5SU4xD67syeulWtAJ6mpXsUQH2aNFThcHNzPSXzGj3GhkS/5HwN
	XNguK95pRaH0l9I2fhyJMItol2v4SpQWNHOXGqJZu16pgGFj+oX4rmLH5YWHXw==
Date: Tue, 17 Oct 2023 16:28:46 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: conor.culhane@silvaco.com, alexandre.belloni@bootlin.com,
 joe@perches.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 4/6] i3c: master: svc: fix check wrong status register
 in irq handler
Message-ID: <20231017162846.188d7a78@xps-13>
In-Reply-To: <20231016153232.2851095-5-Frank.Li@nxp.com>
References: <20231016153232.2851095-1-Frank.Li@nxp.com>
	<20231016153232.2851095-5-Frank.Li@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_072851_115008_01F94F7F 
X-CRM114-Status: GOOD (  12.96  )
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
MzI6MzAgLTA0MDA6Cgo+IHN2Y19pM2NfbWFzdGVyX2lycV9oYW5kbGVyKCkgd3JvbmcgY2hlY2sg
cmVnaXN0ZXIgU1ZDX0kzQ19NSU5UTUFTS0VELiBJdAoKCQkJCXdyb25nbHkgY2hlY2tzCj4gc2hv
dWxkIGJlIFNWQ19JM0NfTVNUQVRVUy4KCkFoIHJpZ2h0LCBnb29kIGNhdGNoLgoKUmV2aWV3ZWQt
Ynk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cgo+IAo+IEZpeGVz
OiBkZDNjNTI4NDZkNTkgKCJpM2M6IG1hc3Rlcjogc3ZjOiBBZGQgU2lsdmFjbyBJM0MgbWFzdGVy
IGRyaXZlciIpCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBG
cmFuayBMaSA8RnJhbmsuTGlAbnhwLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9pM2MvbWFzdGVyL3N2
Yy1pM2MtbWFzdGVyLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkz
Yy1tYXN0ZXIuYyBiL2RyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jCj4gaW5kZXgg
YzI1MjQ0NmIyYmM1Li41YWI2OGQ2ZTQzOWQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9pM2MvbWFz
dGVyL3N2Yy1pM2MtbWFzdGVyLmMKPiArKysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1t
YXN0ZXIuYwo+IEBAIC00NzUsNyArNDc1LDcgQEAgc3RhdGljIHZvaWQgc3ZjX2kzY19tYXN0ZXJf
aWJpX3dvcmsoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQo+ICBzdGF0aWMgaXJxcmV0dXJuX3Qg
c3ZjX2kzY19tYXN0ZXJfaXJxX2hhbmRsZXIoaW50IGlycSwgdm9pZCAqZGV2X2lkKQo+ICB7Cj4g
IAlzdHJ1Y3Qgc3ZjX2kzY19tYXN0ZXIgKm1hc3RlciA9IChzdHJ1Y3Qgc3ZjX2kzY19tYXN0ZXIg
KilkZXZfaWQ7Cj4gLQl1MzIgYWN0aXZlID0gcmVhZGwobWFzdGVyLT5yZWdzICsgU1ZDX0kzQ19N
SU5UTUFTS0VEKTsKPiArCXUzMiBhY3RpdmUgPSByZWFkbChtYXN0ZXItPnJlZ3MgKyBTVkNfSTND
X01TVEFUVVMpOwo+ICAKPiAgCWlmICghU1ZDX0kzQ19NU1RBVFVTX1NMVlNUQVJUKGFjdGl2ZSkp
Cj4gIAkJcmV0dXJuIElSUV9OT05FOwoKClRoYW5rcywKTWlxdcOobAoKLS0gCmxpbnV4LWkzYyBt
YWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
