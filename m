Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83031C4345F
	for <linux-i3c@archiver.kernel.org>; Mon,  6 May 2024 08:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wvueD9U+a0GAwvun0/fpNeOZuG5jVfQi9s7RrqqbuUE=; b=2DqNGac8baYpp5
	iruTlEkI304PVRVD9rw6bo4QFmMu8fyRUkSiNrNDvxcCSCjpoawK2vaCuLEbV/lwp1+B2bB2+1M7m
	32kAIAwadOa5UnX9Pdl7HVbPY4ckDMWfd3xkmNuMLgvSpI3LWyfZiIcNRqGR40YXHPRuSqDNDeKFF
	l0PhYYC72in8z2xYG03pLwBV8TE5UkRsXPds+jBo4gHqnHve/AgTMKiHwAmwpyQ7vPCPig9euGV3E
	C5ux7FzmkaINHZqyyBrSuFkHbhWJH9yAqz44qjn5gUcczjFZ7gG4n0qE9+LtZGtDkUkvVBS+4X4xL
	DHNVtAQ6na2dbSjLaKWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3uCJ-00000006j1v-10mw;
	Mon, 06 May 2024 08:59:47 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3uCG-00000006izS-2kTw
	for linux-i3c@lists.infradead.org;
	Mon, 06 May 2024 08:59:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 119A61BF204;
	Mon,  6 May 2024 08:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1714985981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xLoumWwq12QqlpvmyZ6oFlX+y9BSSofQN7u2jFCOtaU=;
	b=PDKE8EgbLksMFP97qVMtx6poecdit3R82OTJQweQ2bJqnbujyZk+/pcORyzyP1UUWMRlbq
	05Y1ZDNkYGMsz5OUnU+ODdIo4ZCDxwIvOZZ778OwJHHC3vfiVftnyUm7wEcZ81yRR8eIxe
	mPlvhQPNe7r+xTt0d2y/uO0G/Thdl77yA4J1GouPLtIFG5qxszkA9/GPXxlXEFWEofqGiT
	Uaa3D/EXUhelQLkNKZP/rDPmbyGtb+WL07+yLSVKMxlVC7U9silYUf+4CGTESXUnueIT6u
	W0CXbThvRLGP48xY4/qXuGTZ7Ro7vbqSKPF+oZBiqpHGMageYRumhGNp960MPQ==
Date: Mon, 6 May 2024 10:59:40 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Conor Culhane <conor.culhane@silvaco.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, linux-i3c@lists.infradead.org (moderated
 list:SILVACO I3C DUAL-ROLE MASTER), linux-kernel@vger.kernel.org (open
 list), imx@lists.linux.dev
Subject: Re: [PATCH 2/2] i3c: master: svc: fix invalidate IBI type and miss
 call client IBI handler
Message-ID: <20240506105940.5d8d2308@xps-13>
In-Reply-To: <20240424190030.857632-2-Frank.Li@nxp.com>
References: <20240424190030.857632-1-Frank.Li@nxp.com>
	<20240424190030.857632-2-Frank.Li@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_015944_987556_9F839BDC 
X-CRM114-Status: GOOD (  17.68  )
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

SGkgRnJhbmssCgpGcmFuay5MaUBueHAuY29tIHdyb3RlIG9uIFdlZCwgMjQgQXByIDIwMjQgMTU6
MDA6MzAgLTA0MDA6Cgo+IEluIGFuIEluLUJhbmQgSW50ZXJydXB0IChJQkkpIGhhbmRsZSwgdGhl
IGNvZGUgbG9naWMgaXMgYXMgZm9sbG93czoKPiAKPiAxOiB3cml0ZWwoU1ZDX0kzQ19NQ1RSTF9S
RVFVRVNUX0FVVE9fSUJJIHwgU1ZDX0kzQ19NQ1RSTF9JQklSRVNQX0FVVE8sCj4gCSAgbWFzdGVy
LT5yZWdzICsgU1ZDX0kzQ19NQ1RSTCk7Cj4gCj4gMjogcmV0ID0gcmVhZGxfcmVsYXhlZF9wb2xs
X3RpbWVvdXQobWFzdGVyLT5yZWdzICsgU1ZDX0kzQ19NU1RBVFVTLCB2YWwsCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgU1ZDX0kzQ19NU1RBVFVTX0lCSVdPTih2YWwpLCAw
LCAxMDAwKTsKPiAJLi4uCj4gMzogaWJpdHlwZSA9IFNWQ19JM0NfTVNUQVRVU19JQklUWVBFKHN0
YXR1cyk7Cj4gICAgaWJpYWRkciA9IFNWQ19JM0NfTVNUQVRVU19JQklBRERSKHN0YXR1cyk7Cj4g
Cj4gU1ZDX0kzQ19NU1RBVFVTX0lCSVdPTiBtYXkgYmUgc2V0IGJlZm9yZSBzdGVwIDEuIFRodXMs
IHN0ZXAgMiB3aWxsIHJldHVybgo+IGltbWVkaWF0ZWx5LCBhbmQgdGhlIEkzQyBjb250cm9sbGVy
IGhhcyBub3Qgc2VudCBvdXQgdGhlIDl0aCBTQ0wgeWV0Lgo+IENvbnNlcXVlbnRseSwgaWJpdHlw
ZSBhbmQgaWJpYWRkciBhcmUgMCwgcmVzdWx0aW5nIGluIGFuIHVua25vd24gSUJJIHR5cGUKPiBv
Y2N1cnJlbmNlIGFuZCBtaXNzaW5nIGNhbGwgSTNDIGNsaWVudCBkcml2ZXIncyBJQkkgaGFuZGxl
ci4KPiAKPiBBIHR5cGljYWwgY2FzZSBpcyB0aGF0IFNWQ19JM0NfTVNUQVRVU19JQklXT04gaXMg
c2V0IHdoZW4gYW4gSUJJIG9jY3Vycwo+IGR1cmluZyB0aGUgY29udHJvbGxlciBzZW5kIHN0YXJ0
IGZyYW1lIGluIHN2Y19pM2NfbWFzdGVyX3hmZXIoKS4KPiAKPiBDbGVhciBTVkNfSTNDX01TVEFU
VVNfSUJJV09OIGJlZm9yZSBpc3N1ZSBTVkNfSTNDX01DVFJMX1JFUVVFU1RfQVVUT19JQkkKPiB0
byBmaXggdGhpcyBpc3N1ZS4KPiAKPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IEZpeGVz
OiA1ZTVlM2M5MmU3NDggKCJpM2M6IG1hc3Rlcjogc3ZjOiBmaXggd3JvbmcgZGF0YSByZXR1cm4g
d2hlbiBJQkkgaGFwcGVuIGR1cmluZyBzdGFydCBmcmFtZSIpCj4gU2lnbmVkLW9mZi1ieTogRnJh
bmsgTGkgPEZyYW5rLkxpQG54cC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvaTNjL21hc3Rlci9zdmMt
aTNjLW1hc3Rlci5jIHwgNiArKystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyL3N2
Yy1pM2MtbWFzdGVyLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYwo+IGlu
ZGV4IGEyMjk4YWI0NjBhMzcuLjNiZmU4ZTY5NGY4NDAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9p
M2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMKPiArKysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvc3Zj
LWkzYy1tYXN0ZXIuYwo+IEBAIC00MTUsNiArNDE1LDkgQEAgc3RhdGljIHZvaWQgc3ZjX2kzY19t
YXN0ZXJfaWJpX3dvcmsoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQo+ICAJaW50IHJldDsKPiAg
Cj4gIAltdXRleF9sb2NrKCZtYXN0ZXItPmxvY2spOwo+ICsJLyogQ2xlYXIgdGhlIGludGVycnVw
dCBzdGF0dXMgKi8KCkNvdWxkIHlvdSBpbXByb3ZlIHRoZSBjb21tZW50IHRvIGV4cGxhaW4gd2h5
IHRoaXMgaXMgbmVlZGVkIGhlcmU/CgpPdGhlcndpc2Ugc2VlbXMgb2theSwgYnV0IEkgZG9uJ3Qg
aGF2ZSBhbnkgc3Ryb25nIGZlZWxpbmdzIGhlcmUuCgo+ICsJd3JpdGVsKFNWQ19JM0NfTUlOVF9J
QklXT04sIG1hc3Rlci0+cmVncyArIFNWQ19JM0NfTVNUQVRVUyk7Cj4gKwo+ICAJLyogQWNrbm93
bGVkZ2UgdGhlIGluY29taW5nIGludGVycnVwdCB3aXRoIHRoZSBBVVRPSUJJIG1lY2hhbmlzbSAq
Lwo+ICAJd3JpdGVsKFNWQ19JM0NfTUNUUkxfUkVRVUVTVF9BVVRPX0lCSSB8Cj4gIAkgICAgICAg
U1ZDX0kzQ19NQ1RSTF9JQklSRVNQX0FVVE8sCj4gQEAgLTQyOSw5ICs0MzIsNiBAQCBzdGF0aWMg
dm9pZCBzdmNfaTNjX21hc3Rlcl9pYmlfd29yayhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspCj4g
IAkJZ290byByZWVuYWJsZV9pYmlzOwo+ICAJfQo+ICAKPiAtCS8qIENsZWFyIHRoZSBpbnRlcnJ1
cHQgc3RhdHVzICovCj4gLQl3cml0ZWwoU1ZDX0kzQ19NSU5UX0lCSVdPTiwgbWFzdGVyLT5yZWdz
ICsgU1ZDX0kzQ19NU1RBVFVTKTsKPiAtCj4gIAlzdGF0dXMgPSByZWFkbChtYXN0ZXItPnJlZ3Mg
KyBTVkNfSTNDX01TVEFUVVMpOwo+ICAJaWJpdHlwZSA9IFNWQ19JM0NfTVNUQVRVU19JQklUWVBF
KHN0YXR1cyk7Cj4gIAlpYmlhZGRyID0gU1ZDX0kzQ19NU1RBVFVTX0lCSUFERFIoc3RhdHVzKTsK
ClRoYW5rcywKTWlxdcOobAoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1pM2MK
