Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 247FBCD13CF
	for <linux-i3c@archiver.kernel.org>; Mon,  2 Sep 2024 14:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0vZBVjDw6gq08Gk4nLBh3axPptVWHeRM746NRYhWbp8=; b=2KhY4DIwsB03LB
	2veq7BPiizKikiFsdkkO8UCpoabwpuzO3HcA7wjtltvHKbfsCNq6T/+ckEo1Z8IRkelp4OZTWIrSH
	jh5Ws+7tYPZ9oU46ZDa1F++wOnHro9kRECL0HMZ+FzOxaBHlkbjIs9+uJ8Chfmc8CSXAO40tet2MS
	ntsaURz5vVTINP+sMHnTOO4a4vefccM1nYnsaCrTXpfZkDYeG+UC+hRIu5PrQ7IuHkTo+qSJIV/3M
	oBH9jmactOG+hg7+bi3WWKc104xvbkW05TxL00loTaOnEmawakPyd5oU+ROG1yMMJdwk5yQsLZ86B
	qF1vXZ24WGGHiaMIk8UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl7ne-0000000Ebsb-2Q9C;
	Mon, 02 Sep 2024 14:12:58 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl7nb-0000000Ebqv-1JRJ
	for linux-i3c@lists.infradead.org;
	Mon, 02 Sep 2024 14:12:57 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 360B81BF207;
	Mon,  2 Sep 2024 14:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725286372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wvLaVZYHS2Z2KXkZwLboI7ehC7Fzmd1852PHzQQaI5o=;
	b=k2/ET4i0A3B6iDQpwx+ds6uQQh84yuzBHXQjFRDKYqOMgPeR8E+RM6xy2LUV/UxhugbY6P
	Qah1Lk3GBQ/v5BitRFMhim/F0qcod+paiqnb7E/eIXLDeUdWaKgcC+ncD/WWnGK7Cjg49X
	KDwO7XuAfwVjYUGjpk+5aHqOdt2LXoS+EcF5D9xjcFEFsFqppGvY0/9ncMHmG7Z1LzSpdT
	XoUnwG5AWDEbJjkL614YuIoedZT+XoksJhrfkc/TpXbAWMYJMok0LdkbiZ1sA/YUys5wHG
	dlMSwEvZ8rqHKLdR2c8M0/Fx//zvlswCzJgfIuiYXvdwabJ1JRW48irwkviG9Q==
Date: Mon, 2 Sep 2024 16:12:50 +0200
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
Message-ID: <20240902161250.26846654@xps-13>
In-Reply-To: <ZszPrBeoPehGsocC@lizhi-Precision-Tower-5810>
References: <20240819-i3c_fix-v3-0-7d69f7b0a05e@nxp.com>
	<20240819-i3c_fix-v3-3-7d69f7b0a05e@nxp.com>
	<20240823180426.056ac093@xps-13>
	<ZsjNA9JV0UKONV32@lizhi-Precision-Tower-5810>
	<20240826100430.33194702@xps-13>
	<Zsylya9TN4mVFL79@lizhi-Precision-Tower-5810>
	<20240826184924.53b48861@xps-13>
	<ZszPrBeoPehGsocC@lizhi-Precision-Tower-5810>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_071255_964620_76E80671 
X-CRM114-Status: GOOD (  26.08  )
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

SGkgRnJhbmssCiAgCj4gPiA+IHN3aXRjaCB0byB0aGlzIGFkZHJlc3MgaWYgaXQgaXMgZnJlZS4K
PiA+ID4gICoKPiA+ID4gSW4gc3RlcCAxLCBpM2NfYnVzX2dldF9mcmVlX2FkZHIoKSBpcyBjYWxs
ZWQuIFRvIG9wdGltaXplIGZvciBzdGVwIDJiLCB0aGlzCj4gPiA+IGZ1bmN0aW9uIHNob3VsZCBy
ZXR1cm4gYW4gYWRkcmVzcyB0aGF0IGlzIG5vdCBwcmUtcmVzZXJ2ZWQgYnkgYW55IHRhcmdldAo+
ID4gPiBkZXZpY2Ugd2l0aCBhbiBhc3NpZ25lZCBhZGRyZXNzIGluIHRoZSBkZXZpY2UgdHJlZSAo
RFQpLiAgCj4gPgo+ID4gVGhpcyBkb2VzIG5vdCBtYWtlIHNlbnNlLCBpZiB5b3Ugd2FudCB0byBv
cHRpbWl6ZSBmb3IgMmIsIHdoeSBub3QKPiA+IHNlbGVjdGluZyB0aGUgYXNzaWduZWQtYWRkcmVz
cyBwcm9wZXJ0eSBpbiB0aGUgZmlyc3QgcGxhY2UgaWYgaXQncwo+ID4gYXZhaWxhYmxlPyAgCj4g
Cj4gVGhpcyBpcyBteSBmaXJzdCBpZGVhLiBCdXQgSSBnaXZlZCB1cCB0aGlzIHdheS4KPiAKPiBT
ZWxlY3QgYW4gYXNzaWduZWQtYWRkcmVzcyBoZXJlIHdpbGwgaW52b2x2ZSBhIGJpZyBjaGFuZ2Ug
aW4gaTNjIGZyYW1ld29yay4KPiBUaGVyZSBhcmUgbm8gUElEIGluZm9ybWF0aW9uIGluIGkzY19t
YXN0ZXJfZ2V0X2ZyZWVfYWRkcigpLgo+IAo+IEluIERBQSBmbG93Ogo+IC0gU1ZDIGlzIGdldCBQ
SUQgZmlyc3QsIHRoZSBnZXRfZnJlZV9hZGRyKCkuIFRoaXMgY2FzZSwgd2UgY2FuIHVzZSBQSUQg
dG8KPiBnZXQgZHQgYXNzaWduZWQgYWRkcmVzcy4oaWYgY2hhbmdlL2FkZCBBUEkpCj4gLSBCdXQg
SENJLCBpdCBpcyBkaWZmZXJlbmNlLCBoY2lfY21kX3YyX2RhYSgpLCBnZXRfZnJlZV9hZGRyKCkg
Zmlyc3RseSB0aGVuCj4gc2VuZCBvdXQgREFBIGNvbW1hbmQuIFNvIG5vIFBJRCBpbmZvcm1hdGlv
biB3aGVuIGNhbGwgZ2V0X2ZyZWVfYWRkcigpLgo+IAo+IFRvIGNvdmVyIGJvdGggY2FzZSwgcmV0
dXJuIGEgKnJlYWwqIGZyZWUgYWRkcmVzcyBoZXJlIGlzIHNpbXBsZXN0IHNvbHV0aW9uLgoKQnV0
IHRoaXMgaXMgYSBsaW1pdGF0aW9uIG9mIHRoZSBIQ0kgZHJpdmVyPyBTbyB3aHkgbm90IGFkZHJl
c3NpbmcgdGhpcwppbiB0aGUgSENJIGRyaXZlciBpbnN0ZWFkPyBJdCB3b3VsZCBncmVhdGx5IHNp
bXBsaWZ5IHRoZSBjb3JlIGxvZ2ljCndoaWNoIGJlY29tZXMgY29tcGxleCBmb3Igd3JvbmcgcmVh
c29ucy4KCj4gPiAgQWxzbywgSSBkb24ndCB1bmRlcnN0YW5kIHdoeSB5b3Ugd291bGQgY2FyZSB0
byBzcGVjaWZpY2FsbHkKPiA+ICpub3QqIHJldHVybiBhbiBhZGRyZXNzIHRoYXQgbWlnaHQgYmUg
dGhlIGRlZmF1bHQgb25lIGZvciBhbm90aGVyCj4gPiBkZXZpY2UgaW4gdGhlIGZpcnN0IHBsYWNl
LiAgCj4gCj4gSWYgZGV2aWNlcyBBICh3YW50IGFkZGRyZXNzIDB4QSksIGRldmljZSBCICh3YW50
IGFkZHJlc3MgMHhCKSwgaWYgYm90aAo+IGRldmljZSBzZW5kIGhvdCBqb2luIGF0IHRoZSBzYW1l
IHRpbWUuIGRldmljZSBCJ3MgUElEIGxlc3MgdGhhbiBkZXZpY2UgQSwKPiAKPiBEZXZpY2UgQiB3
aWxsIGJlIGZvdW5kIGZpcnN0bHksIGNhbGwgZ2V0X2ZyZWVfYWRkcigpLCAweEEgd2lsbCBiZSBy
ZXR1cm4KPiBpZiBubyB0aGlzIHBhdGNoLgo+IAo+IERldmljZSBBLCBjYWxsIHRyeV9nZXRfZnJl
ZWFkZHIoKSB0byBnZXQgMHhCLgo+IAo+IFNvIERldmNpZSBCIHdpbGwgYmUgYXNzaWduIHRvIDB4
QSwgYW5kIERldmljZSBBIHdpbGwgYmUgYXNzaWduIHRvIGFkZHJlc3MgMHhCLgo+IAo+IEFmdGVy
IGRvX2RhYSBjb21tYW5kLCBmcmFtZXdvcmsgd2lsbCBhZGQgZGV2aWNlIEIgYW5kIGRldmljZSBB
IGludG8gaTNjIGJ1cy4KPiAKPiBXaGVuIGZyYW1ld29yayB0cnkgdG8gYWRkIGRldmljZSBCIHRv
IGkzYyBidXMsIGZyYW1ld29yayB3aWxsIHRyeSBzd2l0Y2gKPiBkZXZpY2UgQidzIGFkZHJlc3Mg
dG8gMHhCIGZyb20gMHhBLCBidXQgaXQgd2lsbCBiZSBmYWlsIGJlY2F1c2UgMHhCIGFscmVhZHkK
PiBhc3NpZ25lZCB0byBkZXZpY2UgQS4KCldlbGwsIG9rYXksIGJ1dCB0aGF0J3MgZXhhY3RseSB0
aGUgc2l0dWF0aW9uIHRoYXQgd2lsbCBoYXBwZW4gaWYgdGhlc2UKZGV2aWNlcyBhcmUgbm90IGRl
c2NyaWJlZCBpbiB5b3VyIERULiBJIGd1ZXNzIGl0J3MgZXhwZWN0ZWQgdGhhdCBhCmRldmljZSBu
b3QgZGVzY3JpYmVkIGluIHlvdXIgRFQgY2FuIGJlIGNvbm5lY3RlZCwgdGhhbmtzIHRvIHRoZQpo
b3Qtam9pbiBmZWF0dXJlLiBJbiB0aGlzIGNhc2UgeW91IGNhbm5vdCBrbm93IHdoYXQgaXMgdGhp
cyBkZXZpY2UKcHJlZmVycmVkIGFkZHJlc3MgYW5kIHlvdSBtaWdodCBlbmQtdXAgaW4gdGhlIGV4
YWN0IHNhbWUgc2l0dWF0aW9uLgoKTWF5IEkgcXVlc3Rpb24gdGhlIG5lZWQgZm9yIHByZWZlcnJl
ZCBhZGRyZXNzZXMgYXQgYWxsPyBJcyB0aGlzIGV2ZW4KcGFydCBvZiB0aGUgc3BlYz8gV2hhdCBp
cyB0aGUgdXNlLWNhc2U/CgpUaGFua3MsCk1pcXXDqGwKCi0tIApsaW51eC1pM2MgbWFpbGluZyBs
aXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
