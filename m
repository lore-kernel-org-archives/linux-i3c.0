Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EAA3CDB474
	for <linux-i3c@archiver.kernel.org>; Tue, 17 Oct 2023 14:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oIe+bQ/zlsPw5+rRo/SdSvrkD0TAnbCGh9lvHDXV9OA=; b=On+R//ZA3cqvZp
	nknsWxeQB0Vn/po4QAfjxsM9G0ZuTv8wogr0ijZRx8pQPMcBvFhKe6RBAbMMSlGGkYCciHYrYGCDi
	AGZcDk9RfXRsJYvTbVf8DNVYyaLRjKRM0cXb/JTRH4RmBhAtYBBJnl48tMfZZ6umSLwNAnGyiaklR
	t+zIMoj6ocYRkJefOf51yudtasFIpDHWHdw9VTYvjt/JArpiNG8D8fC0WxIBdvcxnbsZfupp7hHEd
	AG0UHByNrVQ7YbbDjQ+vUirOSeJl1buGEni9xozOH+g7DLLgiHtVkz4sXZnkU9FReUcPxMckjR450
	otTLxZhA9A8YG34Wgb2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsl2V-00CWaw-1w;
	Tue, 17 Oct 2023 14:27:19 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsl2Q-00CWXQ-31
	for linux-i3c@lists.infradead.org;
	Tue, 17 Oct 2023 14:27:17 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 62D6A1C0009;
	Tue, 17 Oct 2023 14:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697552830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZBf00a1VvFJyyt7kPQ4Hr82k1XZLPzLRAVTVgudZ1EM=;
	b=md/VDBD2broqt7zpeSCaJb2WIYk0Ver/8Pv5eSU+yTO4xt+h3inMX+8AVcu5Oy6c+ut7GL
	HiFT6lf2mizYeZa54+H6AltipxpCThl9/ihcj6e4Ak9a0XIs2aXullPTxSP1HScj95t1zk
	YdD8FanC92DKP3wx5XEfeIvBWMbiOWXzjN07Wbss2aETeSkQw/DbZxsTjbJ0s31MOTmQzT
	x1cOU0oBIcVDBfv6oYURHHNf3RkqHAAUXphYKWS1sDdkM4NAScJScushaq0YtIL9K+YdSg
	Cg5Y14oRFSR/LfXghp1urvVCke9ujniLV7lMYyiwfOLS2RzZkg8l08sltI3T8Q==
Date: Tue, 17 Oct 2023 16:27:07 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: conor.culhane@silvaco.com, alexandre.belloni@bootlin.com,
 joe@perches.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 3/6] i3c: master: svc: fix ibi may not return mandatory
 data byte
Message-ID: <20231017162707.187bebcf@xps-13>
In-Reply-To: <20231016153232.2851095-4-Frank.Li@nxp.com>
References: <20231016153232.2851095-1-Frank.Li@nxp.com>
	<20231016153232.2851095-4-Frank.Li@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_072715_110685_257AAC71 
X-CRM114-Status: GOOD (  16.27  )
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
MzI6MjkgLTA0MDA6Cgo+IE1TVEFUVVNbUlhQRU5EXSBpcyBvbmx5IHVwZGF0ZWQgYWZ0ZXIgdGhl
IGRhdGEgdHJhbnNmZXIgY3ljbGUgc3RhcnRlZC4gVGhpcwo+IGNyZWF0ZXMgYW4gaXNzdWUgd2hl
biB0aGUgSTNDIGNsb2NrIGlzIHNsb3csIGFuZCB0aGUgQ1BVIGlzIHJ1bm5pbmcgZmFzdAo+IGVu
b3VnaCB0aGF0IE1TVEFUVVNbUlhQRU5EXSBtYXkgbm90IGJlIHVwZGF0ZWQgd2hlbiB0aGUgY29k
ZSByZWFjaCBjaGVja2luZwo+IHBvaW50LiBBcyBhIHJlc3VsdCwgbWFuZGF0b3J5IGRhdGEgYXJl
IGJlaW5nIG1pc3NlZC4KCgkJCQkJY2FuIGJlIG1pc3NlZC4KCj4gQWRkIGEgd2FpdCBmb3IgTVNU
QVRVU1tDT01QTEVURV0gdG8gZW5zdXJlIHRoYXQgYWxsIG1hbmRhdG9yeSBkYXRhIGFscmVhZHkK
PiBpbiBGSUZPLgoKaXMgYWxyZWFkeSBpbiB0aGUgRklGTwoKPiAKPiBGaXhlczogZGQzYzUyODQ2
ZDU5ICgiaTNjOiBtYXN0ZXI6IHN2YzogQWRkIFNpbHZhY28gSTNDIG1hc3RlciBkcml2ZXIiKQo+
IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1ieTogRnJhbmsgTGkgPEZy
YW5rLkxpQG54cC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rl
ci5jIHwgOCArKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jIGIvZHJpdmVy
cy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMKPiBpbmRleCAwZjU3YTVmNzVlMzkuLmMyNTI0
NDZiMmJjNSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIu
Ywo+ICsrKyBiL2RyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jCj4gQEAgLTMzMSw2
ICszMzEsNyBAQCBzdGF0aWMgaW50IHN2Y19pM2NfbWFzdGVyX2hhbmRsZV9pYmkoc3RydWN0IHN2
Y19pM2NfbWFzdGVyICptYXN0ZXIsCj4gIAlzdHJ1Y3QgaTNjX2liaV9zbG90ICpzbG90Owo+ICAJ
dW5zaWduZWQgaW50IGNvdW50Owo+ICAJdTMyIG1kYXRhY3RybDsKPiArCWludCByZXQsIHZhbDsK
PiAgCXU4ICpidWY7Cj4gIAo+ICAJc2xvdCA9IGkzY19nZW5lcmljX2liaV9nZXRfZnJlZV9zbG90
KGRhdGEtPmliaV9wb29sKTsKPiBAQCAtMzQwLDYgKzM0MSwxMyBAQCBzdGF0aWMgaW50IHN2Y19p
M2NfbWFzdGVyX2hhbmRsZV9pYmkoc3RydWN0IHN2Y19pM2NfbWFzdGVyICptYXN0ZXIsCj4gIAlz
bG90LT5sZW4gPSAwOwo+ICAJYnVmID0gc2xvdC0+ZGF0YTsKPiAgCj4gKwlyZXQgPSByZWFkbF9y
ZWxheGVkX3BvbGxfdGltZW91dChtYXN0ZXItPnJlZ3MgKyBTVkNfSTNDX01TVEFUVVMsIHZhbCwK
PiArCQkJCQkJU1ZDX0kzQ19NU1RBVFVTX0NPTVBMRVRFKHZhbCksIDAsIDEwMDApOwoKQXJlIHlv
dSBzdXJlICFNU1RBVFVTX0NPTVBMRVRFKHZhbCkgaXMgbmV2ZXIgYSB2YWxpZCBjb25kaXRpb24/
CkVzcGVjaWFsbHkgd2l0aCBub24tbWFuZGF0b3J5IGJ5dGVzPwoKQWxzbywgYXJlIHlvdSBzdXJl
IG9mIHRoZSBpbmRlbnRhdGlvbiBoZXJlPwoKPiArCWlmIChyZXQpIHsKPiArCQlkZXZfZXJyKG1h
c3Rlci0+ZGV2LCAiVGltZW91dCB3aGVuIHBvbGxpbmcgZm9yIENPTVBMRVRFXG4iKTsKPiArCQly
ZXR1cm4gcmV0Owo+ICsJfQo+ICsKPiAgCXdoaWxlIChTVkNfSTNDX01TVEFUVVNfUlhQRU5EKHJl
YWRsKG1hc3Rlci0+cmVncyArIFNWQ19JM0NfTVNUQVRVUykpICAmJgo+ICAJICAgICAgIHNsb3Qt
PmxlbiA8IFNWQ19JM0NfRklGT19TSVpFKSB7Cj4gIAkJbWRhdGFjdHJsID0gcmVhZGwobWFzdGVy
LT5yZWdzICsgU1ZDX0kzQ19NREFUQUNUUkwpOwoKClRoYW5rcywKTWlxdcOobAoKLS0gCmxpbnV4
LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
