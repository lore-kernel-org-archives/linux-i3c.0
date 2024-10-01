Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58FEBCE7D08
	for <linux-i3c@archiver.kernel.org>; Tue,  1 Oct 2024 10:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JiZyn8Pmkky1wZOT5MASgzbwZTA0hYtnOay5qogXlKk=; b=lSyM2JxPP7Z2Gx
	C5y3jiTpBx4ytGYsLTAEW1qYWwyBux3SHmgpSRd+6r5KYhWLCQqr6GygaqgensvkD9i4d7tp3vFTN
	cEmq1at7xLCS4bm3F//QrTVJmEa4pQnKDVbSRysE3qBZYIgJnuqNogCZ/80j1OOoDvU5Jouo4EfPQ
	RsSMtsuQ5OXX3ktW2qG5SDTvvKfqmx2wRVZZdMhkxC0M/x920OwD/EpVq8ALf63Cnalk1vmPxyQzb
	7uQvQFE8vzWpAWxEESSksfWrWYoRn+6YfWfTXsC9N50da+0uap/cnFkSkhhf3FMvtc2hhpb83Tg1A
	rQoI6dE0e0+sE5i4v40g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svZpz-00000002JE7-2M9i;
	Tue, 01 Oct 2024 10:10:35 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svZpw-00000002JDH-3GJw
	for linux-i3c@lists.infradead.org;
	Tue, 01 Oct 2024 10:10:34 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C8812FF805;
	Tue,  1 Oct 2024 10:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727777429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xubVqJbp/ImgvJZq5XqMA75Rfpb0feHIScO6KnEx6JQ=;
	b=UoFQEdcKcTswzD0h9lY0I0HxtNjl9YMJvGNaX4ivfPn+wBnDXOUeHzVXyzJ5rylv+jcOZO
	x4I0M7MuwuYHvrOltESyIQL1UnsN9nKhTZ+2KtEAqosTDBph9x2cY6+Mo6b4Hr5cdh2ydp
	RmsCqYcMVsmPU7/QENEbXX090Zw43mPb1f7LYePsWioFoWshrZcwQzjV7gzgm6logHF5yo
	aU4/FQT3m6EmqIGjwUtdkb5ZfBoHZ/diltHgxTCinrqH10NQjUQTm6W3drYzo7+P2WJdUF
	kl0Ff9+eg3Q3AVMWbPf9j8xHdxOhmwfRTauS+5//JJWFMO3En9/JYrCWpXU+Ww==
Date: Tue, 1 Oct 2024 12:10:27 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.li@nxp.com>
Cc: alexandre.belloni@bootlin.com, arnd@arndb.de, bbrezillon@kernel.org,
 boris.brezillon@collabora.com, conor.culhane@silvaco.com,
 gregkh@linuxfoundation.org, imx@lists.linux.dev,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 pthombar@cadence.com
Subject: Re: [PATCH v2 1/1] MAINTAINERS: I3C: Add Frank Li as nxp I3C
 controller driver maintainer
Message-ID: <20241001121027.29a51284@xps-13>
In-Reply-To: <Zvra9mFa9vD30PGO@lizhi-Precision-Tower-5810>
References: <20240815141609.4089406-1-Frank.Li@nxp.com>
	<Zt9VDJ546znNR7AT@lizhi-Precision-Tower-5810>
	<20240930182235.52c4530e@xps-13>
	<Zvra9mFa9vD30PGO@lizhi-Precision-Tower-5810>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_031032_976693_1E72F3AB 
X-CRM114-Status: GOOD (  26.77  )
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

SGkgRnJhbmssCgpGcmFuay5saUBueHAuY29tIHdyb3RlIG9uIE1vbiwgMzAgU2VwIDIwMjQgMTM6
MDg6MDYgLTA0MDA6Cgo+IE9uIE1vbiwgU2VwIDMwLCAyMDI0IGF0IDA2OjIyOjM1UE0gKzAyMDAs
IE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBIaSBGcmFuaywKPiA+Cj4gPiBGcmFuay5saUBueHAu
Y29tIHdyb3RlIG9uIE1vbiwgOSBTZXAgMjAyNCAxNjowNTozMiAtMDQwMDoKPiA+ICAKPiA+ID4g
T24gVGh1LCBBdWcgMTUsIDIwMjQgYXQgMTA6MTY6MDlBTSAtMDQwMCwgRnJhbmsgTGkgd3JvdGU6
ICAKPiA+ID4gPiBBZGQgRnJhbmsgTGkgYXMgTlhQIGkzYyBjb250cm9sbGVyIGRyaXZlciBhcyBt
YWludGFpbmVyIGFuZCBhZGQgbWFpbCBsaXN0Cj4gPiA+ID4gaW14QGxpc3RzLmxpbnV4LmRldiBm
b3IgaXQuCj4gPiA+ID4KPiA+ID4gPiBBZGQgRnJhbmsgTGkgYXMgSTNDIHN1YnN5c3RlbSByZXZp
ZXdlci4KPiA+ID4gPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEZyYW5rIExpIDxGcmFuay5MaUBu
eHAuY29tPgo+ID4gPiA+IC0tLSAgCj4gPiA+Cj4gPiA+IE1pcXVlbDoKPiA+ID4gCUFueSBjb21t
ZW50cz8gIAo+ID4KPiA+IEkgZ3Vlc3Mgd2UnbGwgaGFwcGlseSB0YWtlIHlvdXIgZmVlZGJhY2sg
b24gcGF0Y2hlcyB0YXJnZXRpbmcgdGhlIFNWQwo+ID4gZHJpdmVyLCB5b3UndmUgYmVlbiB3b3Jr
aW5nIGEgbG90IG9uIGl0LiBIb3dldmVyLCBpbiBnZW5lcmFsIHRoZXJlIGhhcwo+ID4gYmVlbiBh
IGxvdCBvZiBkaXNjdXNzaW9ucyBoYXBwZW5pbmcgb24geW91ciBzdWJzdGFudGlhbCBwYXRjaHNl
dHMgYW5kCj4gPiBsaXR0bGUgdG8gbm8gY29udmVyZ2VuY2UgaW4gdGhlIGVuZC4gIAo+IAo+IEkg
dGhpbmsgdGhpcyBjYW4ndCBwcmV2ZW50IG5vIGFueSBmZWVkYmFjayBhdCB0aGlzIHRocmVhZCBm
b3IgbW9yZSB0aGFuCj4gMSBtb250aC4KCldlbGwsIHRoZXJlJ3MgYmVlbiBhIGxvdCBvZiBkaXNj
dXNzaW9uLCB0aGVuIG5vIGNvbnZlcmdlbmNlLCB0aGF0J3MKd2hhdCBJIGFtIHBvaW50aW5nIG91
dCBhcyB3ZWxsLiBZb3UgY2Fubm90IHNheSB0aGVyZSBoYXMgYmVlbiBubwpkaXNjdXNzaW9uLgoK
PiBCYXNpYywgdGhpcyBwYXRjaCBkaWQgdHdvIHRoaW5ncywKCkFjdHVhbGx5IDMsIGFuZCB0aGlz
IGlzIHVzdWFsbHkgdG9vIG11Y2guCgo+IG9uZSBhZGQgbWFpbCBsaXN0IGlteEBsaXN0cy5saW51
eC5kZXYgdG8KPiBrZWVwIHVzIHRyYWNrIGFsbCBpbXggcmVsYXRlZCBwYXRjaCBpbiBvbmUgbWFp
bCBsaXN0LiBnZW5lcmFsbHksIHdlIGRvbid0Cj4gY2hlY2sgbGludXgtaTNjIG1haWwgbGlzdCBm
cmVxdWVudGx5Lgo+IAo+IFRoZSBvdGhlciB0aGluZ3MgaXMgYWRkIG1lIHRvIG1haW50YWluZXIs
IElmIHlvdSBoYXZlIGNvbmNlcm4gYWJvdXQgaXQuCj4gWW91J2QgYmV0dGVyIHNhaWQgYXMKPiAt
IHBvaW50IHRvIHRoZSBwYXRoIHRvIGJlIG1haW50YWluZXIsIHN1Y2ggYXMgZG8gcmV2aWV3ZXIg
Zmlyc3QgZm9yIHNvbWUKPiB0aW1lcy4KPiAtIG9yIHNpbXBsZSByZWplY3QgdGhpcywgSSBjYW4g
cG9zdCB0aGUgcGF0Y2gsIHdoaWNoIG9ubHkgYWRkCj4gaW14QGxpc3RzLmxpbnV4LmRldi4KPiAK
PiBLZWVwIHNpbXBsZSwgdHdvIHF1ZXN0aW9uczoKPiAxOiBhcmUgeW91IGFncmVlIG9uIGFkZCBp
bXhAbGlzdHMubGludXguZGV2Pwo+IDI6IGFyZSB5b3UgYWdyZWUgb24gSSBhcyByZXZpZXdlcj8K
CkkndmUgYWxyZWFkeSBhbnN3ZXJlZCB0aGVzZSBxdWVzdGlvbnMgYW5kIG1hZGUgYSBkaWZmZXJl
bmNlIGJldHdlZW4KcmV2aWV3aW5nIGRyaXZlciBjaGFuZ2VzIGFuZCBjb3JlIGNoYW5nZXMuCgo+
ID4gSSB1bmRlcnN0YW5kIHlvdSB3YW50IHRvIHB1c2ggeW91cgo+ID4gcGF0Y2hlcyB1cHN0cmVh
bSBhbmQgSSBhbHNvIHdhbnQgdG8gbWFrZSB0aGluZ3MgbW92ZSBmb3J3YXJkLCBidXQgbWF5YmUK
PiA+IG9uZSBvZiB0aGUgcmVhc29ucyBmb3IgdGhlIHN0YWxscyBpcyB0aGUgbGFjayBvZiBmbHVl
bnQgZXhjaGFuZ2VzCj4gPiBiZXR3ZWVuIHVzIGFuZCB0aGUgZGlmZmljdWx0eSB0byBleHBsYWlu
IGJpZ2dlciBwaWN0dXJlcyBpbiBhIGNsZWFyCj4gPiB3YXkuICAKClRoYW5rcywKTWlxdcOobAoK
LS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
