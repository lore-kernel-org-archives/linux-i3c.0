Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72DC1CEACFB
	for <linux-i3c@archiver.kernel.org>; Tue,  1 Oct 2024 20:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yzjfNpoAUwfWhAD4sntSQ9NMuJ00r2S+V6KfFA6mHoc=; b=WJgophO6hMA/WW
	Pbgk3tXZtsWXCQjs/sp87JW9t51nfqSrHqEPGZv6sVIFmeg7yG0mJCYk963FBbnrnewODzeXMXqND
	KxYQr00JVjDGMrqudZIpWQ0bGxHq1zYneWr6zdLWA+QtKQbu+yUjdPBtLyfghMPU3UNPqNjfcMn8A
	odNtAoTDyQSfg6AmPXJP+S9Gd8UNWeDVGLPGAd8KTD0MFvnNoPikDFGDcnKcByEFn7kYuvJK2XBix
	8imax7dahOMM0R7FXIwgkSE+gT6ddfOxqvQRaic4E7kGGS+d1uqxkZRah4S97SQhwx1Dw+xDLx4M0
	YLica9AExfNhaHGNzoLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svjHD-00000003y2h-3ZuV;
	Tue, 01 Oct 2024 20:15:20 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svjH9-00000003y1z-3pqX
	for linux-i3c@lists.infradead.org;
	Tue, 01 Oct 2024 20:15:17 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E617A60003;
	Tue,  1 Oct 2024 20:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727813713;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BQJpm4VO4nXgcGNm9i9gLOY8aV30KkAXa+C6ebyrRxY=;
	b=TkkmKc3AAoYxmKBplahY0/NL007XhBTzr+zYuf4cpbr6A/nAQmGwSSqwJJ95BgIt6jyNtX
	bHcxU1tulTsjkWiJc2Uzq2Nmv8OIHP7V+xbGy1kE6gN2pb1/hni2no+Qe0LZgqqrspf1BJ
	tErhj7aJkqwbX0XTlfXEsU5ZZ9gucj4h3Jp2sMG2iyx5cNxcSRjhEifeqXF4Q2kfm4Rqyu
	lirN4gVLciU2lowjVhQu9mMIQUE4GdGSZjV09U/rdwLnioihZq2lSD0MDNXOEBcdXe7mD+
	AJ56Q297sIldkvwyk5xPgusCh9Gm52trA2afq+PYU+XgYddLczGGvzni2jXeiA==
Date: Tue, 1 Oct 2024 22:15:09 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Conor Culhane <conor.culhane@silvaco.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v5 4/6] i3c: master: svc: use spin_lock_irqsave at
 svc_i3c_master_ibi_work()
Message-ID: <20241001221509.7d418d15@xps-13>
In-Reply-To: <20241001-svc-i3c-hj-v5-4-480ab8aed849@nxp.com>
References: <20241001-svc-i3c-hj-v5-0-480ab8aed849@nxp.com>
	<20241001-svc-i3c-hj-v5-4-480ab8aed849@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_131516_266903_45552DF0 
X-CRM114-Status: GOOD (  18.38  )
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

SGkgRnJhbmssCgpGcmFuay5MaUBueHAuY29tIHdyb3RlIG9uIFR1ZSwgMDEgT2N0IDIwMjQgMTI6
MDI6NTMgLTA0MDA6Cgo+IEFjY29yZGluZyB0byBJM0Mgc3BlYyB2ZXIgMS4xLCAwOS1KdW4tMjAy
MSwgc2VjdGlvbiA1LjEuMi41Ogo+IAo+IFRoZSBJM0MgQ29udHJvbGxlciBzaGFsbCBob2xkIFND
TCBsb3cgd2hpbGUgdGhlIEJ1cyBpcyBpbiBBQ0svTkFDSyBQaGFzZSBvZgo+IEkzQy9JMkMgdHJh
bnNmZXIuIEJ1dCBtYXhpbXVtIHN0YWxsIHRpbWUgaXMgMTAwdXMuIFRoZSBJUlFzIGhhdmUgdG8g
YmUKPiBkaXNhYmxlZCB0byBwcmV2ZW50IHNjaGVkdWxlIGR1cmluZyB0aGUgd2hvbGUgSTNDIHRy
YW5zYWN0aW9uLCBvdGhlcndpc2UsCj4gdGhlIEkzQyBidXMgdGltZW91dCBtYXkgaGFwcGVuIGlm
IGFueSBpcnEgb3Igc2NoZWR1bGUgaGFwcGVuIGR1cmluZwo+IHRyYW5zYWN0aW9uLgo+IAo+IFJl
cGxhY2UgbXV0ZXggd2l0aCBzcGluX2xvY2tfaXJxc2F2ZSgpIHRvIGF2b2lkIHN0YWxsaW5nIFND
TCBtb3JlIHRoYW4KPiAxMDB1cy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBGcmFuayBMaSA8RnJhbmsu
TGlAbnhwLmNvbT4KPiAtLS0KPiBDaGFuZ2UgZnJvbSB2My12NAo+IC0gaW1wcm92ZSBjb21taXQg
bWVzc2FnZQo+IC0gbmVlZG4ndCBtdXRleCBoZXJlLCBvdGhlciBwbGFjZSBhbHJlYWR5IHVzZSBz
cGluX2xvY2tfc2F2ZWlycSB0byBwcm90ZW50Cj4gaTNjIHRyYW5zZmVyLgo+IC0tLQo+ICBkcml2
ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYyB8IDE0ICsrKysrKysrKysrLS0tCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYyBiL2RyaXZlcnMvaTNj
L21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jCj4gaW5kZXggNWRmMGVjMDJkNzNjZS4uMWVlNmNlMTg2
MTk1YyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYwo+
ICsrKyBiL2RyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jCj4gQEAgLTQzNiw3ICs0
MzYsMTYgQEAgc3RhdGljIHZvaWQgc3ZjX2kzY19tYXN0ZXJfaWJpX3dvcmsoc3RydWN0IHdvcmtf
c3RydWN0ICp3b3JrKQo+ICAJdTMyIHN0YXR1cywgdmFsOwo+ICAJaW50IHJldDsKPiAgCj4gLQlt
dXRleF9sb2NrKCZtYXN0ZXItPmxvY2spOwo+ICsJLyoKPiArCSAqIEFjY29yZGluZyB0byBJM0Mg
c3BlYyB2ZXIgMS4xLCAwOS1KdW4tMjAyMSwgc2VjdGlvbiA1LjEuMi41Ogo+ICsJICoKPiArCSAq
IFRoZSBJM0MgQ29udHJvbGxlciBzaGFsbCBob2xkIFNDTCBsb3cgd2hpbGUgdGhlIEJ1cyBpcyBp
biBBQ0svTkFDSyBQaGFzZSBvZiBJM0MvSTJDCj4gKwkgKiB0cmFuc2Zlci4gQnV0IG1heGltdW0g
c3RhbGwgdGltZSBpcyAxMDB1cy4gVGhlIElSUXMgaGF2ZSB0byBiZSBkaXNhYmxlZCB0byBwcmV2
ZW50Cj4gKwkgKiBzY2hlZHVsZSBkdXJpbmcgdGhlIHdob2xlIEkzQyB0cmFuc2FjdGlvbiwgb3Ro
ZXJ3aXNlLCB0aGUgSTNDIGJ1cyB0aW1lb3V0IG1heSBoYXBwZW4gaWYKPiArCSAqIGFueSBpcnEg
b3Igc2NoZWR1bGUgaGFwcGVuIGR1cmluZyB0cmFuc2FjdGlvbi4KPiArCSAqLwo+ICsJZ3VhcmQo
c3BpbmxvY2tfaXJxc2F2ZSkoJm1hc3Rlci0+eGZlcnF1ZXVlLmxvY2spOwo+ICsKPiAgCS8qCj4g
IAkgKiBJQklXT04gbWF5IGJlIHNldCBiZWZvcmUgU1ZDX0kzQ19NQ1RSTF9SRVFVRVNUX0FVVE9f
SUJJLCBjYXVzaW5nCj4gIAkgKiByZWFkbF9yZWxheGVkX3BvbGxfdGltZW91dCgpIHRvIHJldHVy
biBpbW1lZGlhdGVseS4gQ29uc2VxdWVudGx5LAo+IEBAIC00NTYsNyArNDY1LDcgQEAgc3RhdGlj
IHZvaWQgc3ZjX2kzY19tYXN0ZXJfaWJpX3dvcmsoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQo+
ICAJICAgICAgIG1hc3Rlci0+cmVncyArIFNWQ19JM0NfTUNUUkwpOwo+ICAKPiAgCS8qIFdhaXQg
Zm9yIElCSVdPTiwgc2hvdWxkIHRha2UgYXBwcm94aW1hdGVseSAxMDB1cyAqLwo+IC0JcmV0ID0g
cmVhZGxfcmVsYXhlZF9wb2xsX3RpbWVvdXQobWFzdGVyLT5yZWdzICsgU1ZDX0kzQ19NU1RBVFVT
LCB2YWwsCj4gKwlyZXQgPSByZWFkbF9yZWxheGVkX3BvbGxfdGltZW91dF9hdG9taWMobWFzdGVy
LT5yZWdzICsgU1ZDX0kzQ19NU1RBVFVTLCB2YWwsCj4gIAkJCQkJIFNWQ19JM0NfTVNUQVRVU19J
QklXT04odmFsKSwgMCwgMTAwMCk7CgpJZiB3ZSBub3cgYXJlIGhvbGRpbmcgYSBzcGlubG9jayBh
bmQgZXhwZWN0IHRoaXMgdG8gaGFwcGVuIHdpdGhpbgoxMDB1cywgdGhlbiBJIGd1ZXNzIHRoZSB0
aW1lb3V0IHNob3VsZCBiZSByZWR1Y2VkPwoKPiAgCWlmIChyZXQpIHsKPiAgCQlkZXZfZXJyKG1h
c3Rlci0+ZGV2LCAiVGltZW91dCB3aGVuIHBvbGxpbmcgZm9yIElCSVdPTlxuIik7Cj4gQEAgLTUy
OSw3ICs1MzgsNiBAQCBzdGF0aWMgdm9pZCBzdmNfaTNjX21hc3Rlcl9pYmlfd29yayhzdHJ1Y3Qg
d29ya19zdHJ1Y3QgKndvcmspCj4gIAo+ICByZWVuYWJsZV9pYmlzOgo+ICAJc3ZjX2kzY19tYXN0
ZXJfZW5hYmxlX2ludGVycnVwdHMobWFzdGVyLCBTVkNfSTNDX01JTlRfU0xWU1RBUlQpOwo+IC0J
bXV0ZXhfdW5sb2NrKCZtYXN0ZXItPmxvY2spOwo+ICB9Cj4gIAo+ICBzdGF0aWMgaXJxcmV0dXJu
X3Qgc3ZjX2kzY19tYXN0ZXJfaXJxX2hhbmRsZXIoaW50IGlycSwgdm9pZCAqZGV2X2lkKQo+IAoK
T3RoZXJ3aXNlLAoKUmV2aWV3ZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9v
dGxpbi5jb20+CgoKVGhhbmtzLApNaXF1w6hsCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdAps
aW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
