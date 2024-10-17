Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBBE4D2F7FC
	for <linux-i3c@archiver.kernel.org>; Thu, 17 Oct 2024 07:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TP7LNvSv9kYmZUN27ZgTP7Z7XyzEzUSgZiL2/8veslo=; b=G3iMFl8EdUQtRq
	2Kq71VlmHGOWiGmHTDzFginYBcmQdWOlIRm6uFxl9Wtd5Hr9httFGfrwX0lxhBtnPz6LP2kbM9Xu/
	mDFqYHZutH8WOuMmvlCeY8Eh+FnhMXhpoqiKzGKGd1mGEUrAPQCkxvfFS4HUP+32sworxFVcdbvFh
	OOYcyaDlSrF8iHpw1Qwgsdf5v37yzbESnDVvWc3x+TlsveIeTsBI2oUS8k3N4qZCmx7GrHKVIxVzg
	RqSaT3y8wUPK0NBMGAz/5x85bqDakjHsoQeWRH6AKP0Aldy0x3uLjNPc1Ta+/h3jQpFtmyDbhuuZn
	THm4wOa4B3aEXu70LXyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1L8E-0000000E0o5-3TmJ;
	Thu, 17 Oct 2024 07:41:14 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1L89-0000000E0mm-0sxF
	for linux-i3c@lists.infradead.org;
	Thu, 17 Oct 2024 07:41:14 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id BCF9C20004;
	Thu, 17 Oct 2024 07:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729150864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f5XJitMQNSPDDFsYL9nvyuekdXE449S3Jl1KSVsNvJU=;
	b=NR7QYgU36NuU0PcIfex/TStyG0H14UWJIdJ8/bARkJ53gVAZ7r7l2nt/M9/7bOBkW+N3Ah
	CSqgBjw3lJ8YmTf+sbbKHsaOH6h8HEClBch/7KieOLmoTl/gAxhqej6BiiJLmurdSE/UFV
	UXcnPzUy3RM7m0wZUOSd7OzoQXgpCgBYdLUOwqYk7/XC4JS6dMf5hL4yA+RVUC4heHVoJy
	URi+mo60N49Uaoo8iAogijQxg7gDDoGVwV2g+CfhjJkc/m8hyAk+ep//IuSe7H2QRZ+xM5
	hJRkz5B7uIeP6e3/PuiUqRR9D6yD0bTEGBBOHlg1D1E/fflupnZTI2HPxTTnFQ==
Date: Thu, 17 Oct 2024 09:40:59 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, arnd@arndb.de,
 bbrezillon@kernel.org, boris.brezillon@collabora.com,
 conor.culhane@silvaco.com, gregkh@linuxfoundation.org, imx@lists.linux.dev,
 pthombar@cadence.com, ravindra.yashvant.shinde@nxp.com
Subject: Re: [PATCH v7 2/3] i3c: master: Extend address status bit to 4 and
 add I3C_ADDR_SLOT_EXT_DESIRED
Message-ID: <20241017094059.4e4ed56d@xps-13>
In-Reply-To: <Zw/lH9pCrkFoXsbH@lizhi-Precision-Tower-5810>
References: <20241008-i3c_dts_assign-v7-0-96ec93d1f34c@nxp.com>
	<20241008-i3c_dts_assign-v7-2-96ec93d1f34c@nxp.com>
	<Zw/lH9pCrkFoXsbH@lizhi-Precision-Tower-5810>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_004109_675492_979F1C7A 
X-CRM114-Status: GOOD (  20.04  )
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

SGkgRnJhbmssCgpGcmFuay5saUBueHAuY29tIHdyb3RlIG9uIFdlZCwgMTYgT2N0IDIwMjQgMTI6
MDk6MDMgLTA0MDA6Cgo+IE9uIFR1ZSwgT2N0IDA4LCAyMDI0IGF0IDExOjE4OjI1QU0gLTA0MDAs
IEZyYW5rIExpIHdyb3RlOgo+ID4gRXh0ZW5kIHRoZSBhZGRyZXNzIHN0YXR1cyBiaXQgdG8gNCBh
bmQgaW50cm9kdWNlIHRoZQo+ID4gSTNDX0FERFJfU0xPVF9FWFRfREVTSVJFRCBtYWNybyB0byBp
bmRpY2F0ZSB0aGF0IGEgZGV2aWNlIHByZWZlcnMgYQo+ID4gc3BlY2lmaWMgYWRkcmVzcy4gVGhp
cyBpcyBnZW5lcmFsbHkgc2V0IGJ5IHRoZSAnYXNzaWduZWQtYWRkcmVzcycgaW4gdGhlCj4gPiBk
ZXZpY2UgdHJlZSBzb3VyY2UgKGR0cykgZmlsZS4KPiA+Cj4gPiAg4pSM4pSA4pSA4pSA4pSA4pSs
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSs4pSA4pSA4pSA4pSs4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSs4pSA4pSA4pSA4pSQCj4gPiAg4pSCUy9TcuKUgiA3
J2g3RSBSblc9MCDilIJBQ0vilIIgRU5UREFBICDilIIgVCDilJzilIDilIDilIDilIDilJAKPiA+
ICDilJTilIDilIDilIDilIDilLTilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilLTilIDilIDilIDilLTilIDilIDilIDilIDilIDilIDilIDilIDilIDilLTilIDilIDilIDi
lJggICAg4pSCCj4gPiAg4pSM4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSYCj4gPiAg4pSCICDilIzilIDilIDilKzilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilKzilIDilIDilIDilKzilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilKzilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilKzilIDilIDilIDilKzilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilJAKPiA+ICDilJTilIDilrrilIJTcuKUgjcnaDdFIFJu
Vz0xICDilIJBQ0vilII0OGJpdCBVSUQgQkNSIERDUuKUgkFzc2lnbiA3Yml0IEFkZHLilIJQQVLi
lIIgQUNLL05BQ0vilIIKPiA+ICAgICDilJTilIDilIDilLTilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilLTilIDilIDilIDilLTilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilLTilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilLTilIDilIDilIDilLTilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilJgKPiA+Cj4gPiBTb21lIG1hc3RlciBjb250cm9sbGVycyAoc3VjaCBhcyBIQ0kpIG5l
ZWQgdG8gcHJlcGFyZSB0aGUgZW50aXJlIGFib3ZlCj4gPiB0cmFuc2FjdGlvbiBiZWZvcmUgc2Vu
ZGluZyBpdCBvdXQgdG8gdGhlIEkzQyBidXMuIFRoaXMgbWVhbnMgdGhhdCBhIDctYml0Cj4gPiBk
eW5hbWljIGFkZHJlc3MgbmVlZHMgdG8gYmUgYWxsb2NhdGVkIGJlZm9yZSBrbm93aW5nIHRoZSB0
YXJnZXQgZGV2aWNlJ3MKPiA+IFVJRCBpbmZvcm1hdGlvbi4KPiA+Cj4gPiBIb3dldmVyLCBzb21l
IEkzQyB0YXJnZXRzIG1heSByZXF1ZXN0IHNwZWNpZmljIGFkZHJlc3NlcyAoY2FsbGVkIGFzCj4g
PiAiaW5pdF9keW5fYWRkciIpLCB3aGljaCBpcyB0eXBpY2FsbHkgc3BlY2lmaWVkIGJ5IHRoZSBE
VC0ncwo+ID4gYXNzaWduZWQtYWRkcmVzcyBwcm9wZXJ0eS4gTG93ZXIgYWRkcmVzc2VzIGhhdmlu
ZyBoaWdoZXIgSUJJIHByaW9yaXR5LiBJZgo+ID4gaXQgaXMgYXZhaWxhYmxlLCBpM2NfYnVzX2dl
dF9mcmVlX2FkZHIoKSBwcmVmZXJhYmx5IHJldHVybiBhIGZyZWUgYWRkcmVzcwo+ID4gdGhhdCBp
cyBub3QgaW4gdGhlIGxpc3Qgb2YgZGVzaXJlZCBhZGRyZXNzZXMgKGNhbGxlZCBhcyAiaW5pdF9k
eW5fYWRkciIpLgo+ID4gVGhpcyBhbGxvd3MgdGhlIGRldmljZSB3aXRoIHRoZSAiaW5pdF9keW5f
YWRkciIgdG8gc3dpdGNoIHRvIGl0cwo+ID4gImluaXRfZHluX2FkZHIiIHdoZW4gaXQgaG90LWpv
aW5zIHRoZSBJM0MgYnVzLiBPdGhlcndpc2UsIGlmIHRoZQo+ID4gImluaXRfZHluX2FkZHIiIGlz
IGFscmVhZHkgaW4gdXNlIGJ5IGFub3RoZXIgSTNDIGRldmljZSwgdGhlIHRhcmdldCBkZXZpY2UK
PiA+IHdpbGwgbm90IGJlIGFibGUgdG8gc3dpdGNoIHRvIGl0cyBkZXNpcmVkIGFkZHJlc3MuCj4g
Pgo+ID4gSWYgdGhlIHByZXZpb3VzIHN0ZXAgZmFpbHMsIGZhbGxiYWNrIHJldHVybmluZyBvbmUg
b2YgdGhlIHJlbWFpbmluZwo+ID4gdW5hc3NpZ25lZCBhZGRyZXNzLCByZWdhcmRsZXNzIG9mIGl0
cyBzdGF0ZSBpbiB0aGUgZGVzaXJlZCBsaXN0Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEZyYW5r
IExpIDxGcmFuay5MaUBueHAuY29tPgo+ID4gLS0tICAKPiAKPiBNaXF1ZWw6Cj4gCj4gCURvIHlv
dSBoYXZlIGEgY2hhbmNlIHRvIGNoZWNrIHRoaXMgcGF0Y2ggYWdhaW4/CgpObyB3b3JyaWVzLCBp
dCdzIGluIG15IHRvZG8gbGlzdCA7KQoKVGhhbmtzLApNaXF1w6hsCgotLSAKbGludXgtaTNjIG1h
aWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
