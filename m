Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43572CD342D
	for <linux-i3c@archiver.kernel.org>; Tue,  3 Sep 2024 13:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MTP7i33Cw3vqKvVn9PEN24d6a7w5l4Vshu+Xjf2pSIM=; b=Pc/wtZUnChKuIu
	kxVB79LxFa9JOBPkdNw/cnI5vU/rUBy2jjaZOQ5rqauA3fLeVCQuasrcSI6WSrHBv8dszrBF3Ousu
	34hjucypl509c0JY2+0iNnk6dP5EZLL3EaMZJhVbmrisTibtkw4nKyKt1njqact5yIQb9I71KMA+r
	Sz1OHL0TPvfJyxNVc6mhDxG2xPIq6iV6pzFWTmDrm/PISyalCCrlFzijjJ1jC3ewhFgi5llm4rnKm
	RNOSUlTqsFYaUqd0PSaMKNarIidybAyT/yGR0213XzYbPBbDkF6T/fJzHwk+dWPkQeJxLhVNjibU9
	WYa7k3HYCXOiMqxgfjHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slTEg-00000000IPd-2XsF;
	Tue, 03 Sep 2024 13:06:18 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slT9K-00000000HKo-2WfO
	for linux-i3c@lists.infradead.org;
	Tue, 03 Sep 2024 13:00:48 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E70CE240003;
	Tue,  3 Sep 2024 13:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725368442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AkuUmV3lialxWeUM5Ad2YOHupRRB0gDWocBubLJ/teE=;
	b=Omt6/9d8bLVXbWm5GYCR83XbWNyFyUWf1oGygw5GqH93JIVxN11ZJT0BTQ2cHzVbmVkSF/
	9ZBxlgU/wBcZ1zjW+LlxZTnvpJ+GWCmoIgzTzUdt3JJwGyYATr5L5BB6Wr/hjt8FADZ4x+
	HmSL8b+bvqh7UHt8wCf/+g4UHkzSRENG9kOJeLZXLPIrZtjtcJifn2hThAmYNhEYifXycH
	ZQMCvGihIpTCOpug9/CetC70ojtAkljrd45tMQ8ekpQFbDaKf77rNni0PS2XmIEXap4BFU
	hXFfVPBuUS7UEMxNg2m2LRlA0yOMoqU4e+a+pyAqt5+HSTCyhFj4LYrGRwptZg==
Date: Tue, 3 Sep 2024 15:00:38 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Parshuram Thombare <pthombar@cadence.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Boris Brezillon
 <bbrezillon@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Conor Culhane
 <conor.culhane@silvaco.com>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v3 03/11] i3c: master: Extend address status bit to 4
 and add I3C_ADDR_SLOT_EXT_INIT
Message-ID: <20240903150038.3f224ec9@xps-13>
In-Reply-To: <ZtYCA9cYywmUaJSQ@lizhi-Precision-Tower-5810>
References: <20240819-i3c_fix-v3-0-7d69f7b0a05e@nxp.com>
	<20240819-i3c_fix-v3-3-7d69f7b0a05e@nxp.com>
	<20240823180426.056ac093@xps-13>
	<ZsjNA9JV0UKONV32@lizhi-Precision-Tower-5810>
	<20240826100430.33194702@xps-13>
	<Zsylya9TN4mVFL79@lizhi-Precision-Tower-5810>
	<20240826184924.53b48861@xps-13>
	<ZszPrBeoPehGsocC@lizhi-Precision-Tower-5810>
	<20240902161250.26846654@xps-13>
	<ZtYCA9cYywmUaJSQ@lizhi-Precision-Tower-5810>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_060046_932560_3DD392D5 
X-CRM114-Status: GOOD (  40.28  )
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

SGkgRnJhbmssCgpGcmFuay5saUBueHAuY29tIHdyb3RlIG9uIE1vbiwgMiBTZXAgMjAyNCAxNDoy
MDo1MSAtMDQwMDoKCj4gT24gTW9uLCBTZXAgMDIsIDIwMjQgYXQgMDQ6MTI6NTBQTSArMDIwMCwg
TWlxdWVsIFJheW5hbCB3cm90ZToKPiA+IEhpIEZyYW5rLAo+ID4gIAo+ID4gPiA+ID4gc3dpdGNo
IHRvIHRoaXMgYWRkcmVzcyBpZiBpdCBpcyBmcmVlLgo+ID4gPiA+ID4gICoKPiA+ID4gPiA+IElu
IHN0ZXAgMSwgaTNjX2J1c19nZXRfZnJlZV9hZGRyKCkgaXMgY2FsbGVkLiBUbyBvcHRpbWl6ZSBm
b3Igc3RlcCAyYiwgdGhpcwo+ID4gPiA+ID4gZnVuY3Rpb24gc2hvdWxkIHJldHVybiBhbiBhZGRy
ZXNzIHRoYXQgaXMgbm90IHByZS1yZXNlcnZlZCBieSBhbnkgdGFyZ2V0Cj4gPiA+ID4gPiBkZXZp
Y2Ugd2l0aCBhbiBhc3NpZ25lZCBhZGRyZXNzIGluIHRoZSBkZXZpY2UgdHJlZSAoRFQpLiAgCj4g
PiA+ID4KPiA+ID4gPiBUaGlzIGRvZXMgbm90IG1ha2Ugc2Vuc2UsIGlmIHlvdSB3YW50IHRvIG9w
dGltaXplIGZvciAyYiwgd2h5IG5vdAo+ID4gPiA+IHNlbGVjdGluZyB0aGUgYXNzaWduZWQtYWRk
cmVzcyBwcm9wZXJ0eSBpbiB0aGUgZmlyc3QgcGxhY2UgaWYgaXQncwo+ID4gPiA+IGF2YWlsYWJs
ZT8gIAo+ID4gPgo+ID4gPiBUaGlzIGlzIG15IGZpcnN0IGlkZWEuIEJ1dCBJIGdpdmVkIHVwIHRo
aXMgd2F5Lgo+ID4gPgo+ID4gPiBTZWxlY3QgYW4gYXNzaWduZWQtYWRkcmVzcyBoZXJlIHdpbGwg
aW52b2x2ZSBhIGJpZyBjaGFuZ2UgaW4gaTNjIGZyYW1ld29yay4KPiA+ID4gVGhlcmUgYXJlIG5v
IFBJRCBpbmZvcm1hdGlvbiBpbiBpM2NfbWFzdGVyX2dldF9mcmVlX2FkZHIoKS4KPiA+ID4KPiA+
ID4gSW4gREFBIGZsb3c6Cj4gPiA+IC0gU1ZDIGlzIGdldCBQSUQgZmlyc3QsIHRoZSBnZXRfZnJl
ZV9hZGRyKCkuIFRoaXMgY2FzZSwgd2UgY2FuIHVzZSBQSUQgdG8KPiA+ID4gZ2V0IGR0IGFzc2ln
bmVkIGFkZHJlc3MuKGlmIGNoYW5nZS9hZGQgQVBJKQo+ID4gPiAtIEJ1dCBIQ0ksIGl0IGlzIGRp
ZmZlcmVuY2UsIGhjaV9jbWRfdjJfZGFhKCksIGdldF9mcmVlX2FkZHIoKSBmaXJzdGx5IHRoZW4K
PiA+ID4gc2VuZCBvdXQgREFBIGNvbW1hbmQuIFNvIG5vIFBJRCBpbmZvcm1hdGlvbiB3aGVuIGNh
bGwgZ2V0X2ZyZWVfYWRkcigpLgo+ID4gPgo+ID4gPiBUbyBjb3ZlciBib3RoIGNhc2UsIHJldHVy
biBhICpyZWFsKiBmcmVlIGFkZHJlc3MgaGVyZSBpcyBzaW1wbGVzdCBzb2x1dGlvbi4gIAo+ID4K
PiA+IEJ1dCB0aGlzIGlzIGEgbGltaXRhdGlvbiBvZiB0aGUgSENJIGRyaXZlcj8gU28gd2h5IG5v
dCBhZGRyZXNzaW5nIHRoaXMKPiA+IGluIHRoZSBIQ0kgZHJpdmVyIGluc3RlYWQ/IEl0IHdvdWxk
IGdyZWF0bHkgc2ltcGxpZnkgdGhlIGNvcmUgbG9naWMKPiA+IHdoaWNoIGJlY29tZXMgY29tcGxl
eCBmb3Igd3JvbmcgcmVhc29ucy4gIAo+IAo+IEl0IGlzIHJlYXNvbmFibGUgcmVxdWlyZW1lbnQg
dG8gcmVkdWNlIHN0YWxsIFNDTCB0aW1lLiBBZnRlciBnZXQgUElELCBTQ0wKPiBoYXZlIHRvIHN0
YWxsIGxvdyB0byB3YWl0IGZvciBzb2Z0d2FyZSBnZXQgZHluYW10aWMgYWRkcmVzcywgSTNDIHNw
ZWMgYWxsb3cKPiByZWxhdGl2ZSBsb25nIHRpbWUgZm9yIHRoaXMsIGJ1dCBzdGlsbCBiZXR0ZXIg
aWYgaGFyZHdhcmUgY2FuIHNlbmQgb3V0IFBJRAo+IGFuZCBkeW5hbWF0aWMgYWRkcmVzcyB0b2dl
dGhlciB3aXRob3VnIHN0YWxsIFNDTCBsb3cuIFByZS1hbGxvYyBhZGRkcmVzcyBpcwo+IGdvb2Qg
bWV0aG9kIGlmIGNvbnNpZGVyIHRoaXMuCgpJIGRvbid0IHRoaW5rIGl0IGlzIHdvcnRoIHRoZSB0
cm91YmxlLCBnaXZlbiB0aGUgY29tcGxleGl0eSBvZiBhbGwKdGhlIGNoYW5nZXMuIEkgcHJlZmVy
IHRvIHNpbXBsaWZ5IGEgYml0IHRoZSBzb2Z0d2FyZSBhbmQga2VlcCBpdApyZWFkYWJsZSB0aGFu
IGdhaW5pbmcgZmV3IHVzIHdpdGggU0NMIGxvdy4gSW4gdGhpcyBjYXNlIHlvdSBhbHNvIHNwZW5k
Cm1vcmUgdGltZSBvbiB0aGUgY29uZmlndXJhdGlvbiBJIGd1ZXNzLCBzbyBpcyBpdCBiZXR0ZXIg
dGhhbiBrZWVwaW5nClNDTCBsb3cgKGl0IHdpbGwgYmUgbG93IGZvciBzb21lIHRpbWUgYW55d2F5
KS4KCj4gPiA+ID4gIEFsc28sIEkgZG9uJ3QgdW5kZXJzdGFuZCB3aHkgeW91IHdvdWxkIGNhcmUg
dG8gc3BlY2lmaWNhbGx5Cj4gPiA+ID4gKm5vdCogcmV0dXJuIGFuIGFkZHJlc3MgdGhhdCBtaWdo
dCBiZSB0aGUgZGVmYXVsdCBvbmUgZm9yIGFub3RoZXIKPiA+ID4gPiBkZXZpY2UgaW4gdGhlIGZp
cnN0IHBsYWNlLiAgCj4gPiA+Cj4gPiA+IElmIGRldmljZXMgQSAod2FudCBhZGRkcmVzcyAweEEp
LCBkZXZpY2UgQiAod2FudCBhZGRyZXNzIDB4QiksIGlmIGJvdGgKPiA+ID4gZGV2aWNlIHNlbmQg
aG90IGpvaW4gYXQgdGhlIHNhbWUgdGltZS4gZGV2aWNlIEIncyBQSUQgbGVzcyB0aGFuIGRldmlj
ZSBBLAo+ID4gPgo+ID4gPiBEZXZpY2UgQiB3aWxsIGJlIGZvdW5kIGZpcnN0bHksIGNhbGwgZ2V0
X2ZyZWVfYWRkcigpLCAweEEgd2lsbCBiZSByZXR1cm4KPiA+ID4gaWYgbm8gdGhpcyBwYXRjaC4K
PiA+ID4KPiA+ID4gRGV2aWNlIEEsIGNhbGwgdHJ5X2dldF9mcmVlYWRkcigpIHRvIGdldCAweEIu
Cj4gPiA+Cj4gPiA+IFNvIERldmNpZSBCIHdpbGwgYmUgYXNzaWduIHRvIDB4QSwgYW5kIERldmlj
ZSBBIHdpbGwgYmUgYXNzaWduIHRvIGFkZHJlc3MgMHhCLgo+ID4gPgo+ID4gPiBBZnRlciBkb19k
YWEgY29tbWFuZCwgZnJhbWV3b3JrIHdpbGwgYWRkIGRldmljZSBCIGFuZCBkZXZpY2UgQSBpbnRv
IGkzYyBidXMuCj4gPiA+Cj4gPiA+IFdoZW4gZnJhbWV3b3JrIHRyeSB0byBhZGQgZGV2aWNlIEIg
dG8gaTNjIGJ1cywgZnJhbWV3b3JrIHdpbGwgdHJ5IHN3aXRjaAo+ID4gPiBkZXZpY2UgQidzIGFk
ZHJlc3MgdG8gMHhCIGZyb20gMHhBLCBidXQgaXQgd2lsbCBiZSBmYWlsIGJlY2F1c2UgMHhCIGFs
cmVhZHkKPiA+ID4gYXNzaWduZWQgdG8gZGV2aWNlIEEuICAKPiA+Cj4gPiBXZWxsLCBva2F5LCBi
dXQgdGhhdCdzIGV4YWN0bHkgdGhlIHNpdHVhdGlvbiB0aGF0IHdpbGwgaGFwcGVuIGlmIHRoZXNl
Cj4gPiBkZXZpY2VzIGFyZSBub3QgZGVzY3JpYmVkIGluIHlvdXIgRFQuIEkgZ3Vlc3MgaXQncyBl
eHBlY3RlZCB0aGF0IGEKPiA+IGRldmljZSBub3QgZGVzY3JpYmVkIGluIHlvdXIgRFQgY2FuIGJl
IGNvbm5lY3RlZCwgdGhhbmtzIHRvIHRoZQo+ID4gaG90LWpvaW4gZmVhdHVyZS4gSW4gdGhpcyBj
YXNlIHlvdSBjYW5ub3Qga25vdyB3aGF0IGlzIHRoaXMgZGV2aWNlCj4gPiBwcmVmZXJyZWQgYWRk
cmVzcyBhbmQgeW91IG1pZ2h0IGVuZC11cCBpbiB0aGUgZXhhY3Qgc2FtZSBzaXR1YXRpb24uICAK
PiAKPiBJZiBub3QgZGVzY3JpcHQgaW4gRFQsIGl0IG1lYW5zIHRoYXQgYW55IGR5bm1hdGljIGFk
ZHJlc3MgY2FuIGJlIGFzc2lnbmVkLgoKVGhhdCdzIHRoZSBwb2ludCBvZiB2aWV3IG9mIHRoZSBo
b3N0LiBCdXQgYSBkZXZpY2UgbWlnaHQgYmUgImNyaXRpY2FsIgphbmQgZXhwZWN0IGEgbG93IGFk
ZHJlc3MsIGJ1dCB0aGUgaG9zdCBub3QgYmVpbmcgYXdhcmUuIFRoaXMgaXMgdGhlCnNhbWUgc2l0
dWF0aW9uIGFzIHlvdXIgQSBhbmQgQiBjb25mbGljdCBleGFtcGxlLgoKPiA+IE1heSBJIHF1ZXN0
aW9uIHRoZSBuZWVkIGZvciBwcmVmZXJyZWQgYWRkcmVzc2VzIGF0IGFsbD8gSXMgdGhpcyBldmVu
Cj4gPiBwYXJ0IG9mIHRoZSBzcGVjPyBXaGF0IGlzIHRoZSB1c2UtY2FzZT8gIAo+IAo+IEl0IGlz
IGltcGxlbWVudHMgZGV0YWlsLiBJM0Mgc3BlYyBzYWlkIGxvd2VyIGR5bmFtdGljIGFkZHJlc3Mg
aGF2ZSBoaWdoIElCSQo+IHByaW9yaXR5LiBTcGVjIGp1c3Qgc2FpZCBhc3NpZ24gbG93ZXIgZHlu
YW10aWMgYWRkcmVzcyBpZiB3YW50IHRvIGhpZ2hlcgo+IElCSSBwcmlvZXJpdHkuIFVzaW5nIERU
IGFzc2lnbi1hZGRyZXNzIGp1c3QgaXMgb25lIGltcGxlbWVudCBtZXRob2QuCgpUaGFua3MgZm9y
IGFsbCB0aGUgaW5mb3JtYXRpb24sIGZvciBtZSB0aGUgSENJIGRyaXZlciBtdXN0IGJlIG1vZGlm
aWVkCnRvIHJldHJpZXZlIHRoZSBQSUQgYmVmb3JlIGFzc2lnbmluZyB0aGUgZHluYW1pYyBhZGRy
ZXNzLgoKVGhhbmtzLApNaXF1w6hsCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1p
M2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWkzYwo=
