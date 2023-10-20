Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E40CDB474
	for <linux-i3c@archiver.kernel.org>; Fri, 20 Oct 2023 14:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nmKEIg6BvkvcA9v1RPskLuCiE4kia+ocRkyVocsAeT4=; b=iR9/ddjqWhjxau
	7Xb3LIFUjH3Xxv7L97NohExm7nuehwB9Dem5PFVjno9bOuaowivoyCHID7OrF2Mf6lp2n3iXZy1sK
	Cg7zeNrOX5QrjVvX2L3VEdMuvZLCTRfc6mnJzlJcFrelEOubO10RsHKYrw5Ryft0jPRqVftqkm3pm
	22/7VtQ0OQ4kvXxk4eV9WUwsJ7RFrnRLUL6Q6qJ9lowl9UgcxhFb7F7JnRahWbvOBSDMm8b2pfFAW
	Djf8A4rJwQypLlN7V4/1ypLnwKhz2/GxhOCrpFAgGIm2WabTjgaVOBfxEfIRdSL1U3S7i8ZMe5EL4
	4jEDa+r+UPc1HamIJ/lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtqZZ-002Ven-0i;
	Fri, 20 Oct 2023 14:33:57 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtqZW-002Vcd-1f
	for linux-i3c@lists.infradead.org;
	Fri, 20 Oct 2023 14:33:56 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C94A7C0007;
	Fri, 20 Oct 2023 14:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697812429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zZPwG1QrAqBLq23wnEyxrPXk3d8fu1E8yL0jWfm6ZX4=;
	b=IVVDGU/4ju4RloomC3TVhl6poOqo447GqE9kialVEV+1EUAbwOf3wpNP97tzIe+DfRl9JC
	MW6imyQzM2HcFGIOG+t3RVSwKcs5jkH74R8jNHHxznmOuP/9gFhkE4ypfvRoAW6zpkghyP
	YqJPQPpgB1515Fov8LwSy5amH/TXkv9+tjNjR6wsg2BHAj4EqVDzAIojmONee1EpXZNecQ
	m5bgzefIWvqBkM23swIYEitTpZcLkuJxVvnH/41MtStoI4HUneRuX1HwkfJ5JRykT/VyWL
	GTkWB3gU0P5syaaxmGbuk6/Ufk/30zeKB3yhtpUkgiWpjXHQXge7LlHuqpG23Q==
Date: Fri, 20 Oct 2023 16:33:48 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.li@nxp.com>
Cc: "Zbigniew, Lukwinski" <zbigniew.lukwinski@linux.intel.com>,
 alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
 imx@lists.linux.dev, joe@perches.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] i3c: master: add enable(disable) hot join in sys
 entry
Message-ID: <20231020163348.1752167d@xps-13>
In-Reply-To: <ZTKMyW939rB6sSKq@lizhi-Precision-Tower-5810>
References: <20231018205929.3435110-1-Frank.Li@nxp.com>
	<20231018205929.3435110-2-Frank.Li@nxp.com>
	<57efe6de-cf65-32ed-fd1e-a388e1676c70@linux.intel.com>
	<20231020154528.2f5f68f5@xps-13>
	<ZTKMyW939rB6sSKq@lizhi-Precision-Tower-5810>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_073354_702865_1839402C 
X-CRM114-Status: GOOD (  18.92  )
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

SGkgRnJhbmssCgpGcmFuay5saUBueHAuY29tIHdyb3RlIG9uIEZyaSwgMjAgT2N0IDIwMjMgMTA6
MjA6NTcgLTA0MDA6Cgo+IE9uIEZyaSwgT2N0IDIwLCAyMDIzIGF0IDAzOjQ1OjI4UE0gKzAyMDAs
IE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBIaSBMdWt3aW5za2ksCj4gPiAKPiA+IHpiaWduaWV3
Lmx1a3dpbnNraUBsaW51eC5pbnRlbC5jb20gd3JvdGUgb24gRnJpLCAyMCBPY3QgMjAyMyAxMDo1
NToyNwo+ID4gKzAyMDA6Cj4gPiAgIAo+ID4gPiBPbiAxMC8xOC8yMDIzIDEwOjU5IFBNLCBGcmFu
ayBMaSB3cm90ZTogIAo+ID4gPiA+IEFkZCBob3Rqb2luIGVudHJ5IGluIHN5cyBmaWxlIHN5c3Rl
bSBhbGxvdyB1c2VyIGVuYWJsZS9kaXNhYmxlIGhvdGpvaW4KPiA+ID4gPiBmZWF0dXJlLgo+ID4g
PiA+Cj4gPiA+ID4gQWRkICgqZW5hYmxlKGRpc2FibGUpX2hvdGpvaW4pKCkgdG8gaTNjX21hc3Rl
cl9jb250cm9sbGVyX29wcy4KPiA+ID4gPiBBZGQgYXBpIGkzY19tYXN0ZXJfZW5hYmxlKGRpc2Fi
bGUpX2hvdGpvaW4oKTsgICAgCj4gPiA+IAo+ID4gPiBXaGF0IGlzIHRoZSB1c2UgY2FzZSBmb3Ig
aGF2aW5nIEhKIGVuYWJsZSBrbm9iIGluIHN5c2ZzIGF2YWlsYWJsZSBmb3IgdXNlciBzcGFjZSBv
dGhlciB0aGFuIGZvciBkZWJ1ZyBzdHVmZj8gSW4gb3RoZXIgd29yZHMsIGRvZXMgdXNlciBzcGFj
ZSByZWFsbHkgbmVlZCB0byBlbmFibGUvZGlzYWJsZSBISiBpbiBydW50aW1lIGZvciBvdGhlciBy
ZWFzb24gYnV0IGRlYnVnPyBJZiBpdCBpcyBvbmx5IGZvciBkZWJ1ZyBtYXliZSBpdMKgIGNvdWxk
IGJlIG1vdmUgdG8gZGVidWdGUz8gIAo+ID4gCj4gPiBJIGRvbid0IHRoaW5rIGhvdGpvaW4gc2hv
dWxkIGJlIGNvbnNpZGVyZWQgYXMgYSBkZWJ1ZyBmZWF0dXJlLiBUaGUKPiA+IHByb2JsZW0gaGVy
ZSBpcyB0aGUgcG93ZXIgY29uc3VtcHRpb24gd2hpY2ggaXMgaGlnaGVyIGlmIHlvdSBlbmFibGUK
PiA+IHRoaXMgZmVhdHVyZSAoeW91IG5lZWQgdG8ga2VlcCBldmVyeXRoaW5nIGNsb2NrZWQgYW5k
IHJlYWR5IHRvIGhhbmRsZQo+ID4gYW4gSUJJKSB3aGVyZWFzIGlmIHlvdXIgZGVzaWduIGlzICJm
aXhlZCIgKG1vcmUgbGlrZSBhbiBJMkMgYnVzKSB5b3UKPiA+IG1heSBzYXZlIHBvd2VyIGJ5IGRp
c2FibGluZyB0aGlzIGZlYXR1cmUuCj4gPiAKPiA+IEEgbW9kdWxlIHBhcmFtZXRlciBkb2VzIG5v
dCBmaXQgaGVyZSBiZWNhdXNlIGl0J3MgYSBwZXItYnVzCj4gPiBjb25maWd1cmF0aW9uLiAgCj4g
Cj4gSSBhZ3JlZS4gc3lzIGVudHJ5IGlzIG1vcmUgZmxleGlhYmxlLiBhbmQgbGV0IGNvbnRyb2xs
ZXIgY2hvb3NlIGJldHRlcgo+IHBvd2VyIHNhdmluZyBwb2xpY3kgZm9yIGRpZmZlcmVuY2UgdXNl
ciBjYXNlLgoKTWF5YmUgaXQncyBub3QgdGhlIGZpcnN0IHRpbWUgdGhpcyBjYXNlIGlzIGZhY2Vk
LCB3b3VsZCB5b3UgbWluZAppbmNsdWRpbmcgcG93ZXIgbWFuYWdlbWVudCBtYWludGFpbmVycyBp
biB0aGlzIGRpc2N1c3Npb24/IFBlcmhhcHMgdGhleQptaWdodCBoYXZlIHBvaW50ZXJzIG9yIGV2
ZW4gaGF2ZSB0aGUgc29sdXRpb24gYWxyZWFkeS4KClRoYW5rcywKTWlxdcOobAoKLS0gCmxpbnV4
LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
