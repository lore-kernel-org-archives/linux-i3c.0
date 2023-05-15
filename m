Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D37FC77B7D
	for <linux-i3c@archiver.kernel.org>; Mon, 15 May 2023 02:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HuSD59eTbjX+beJ9FwibP1AuUzUZYpFjrYZ47+wfrg0=; b=eQMe1ZhaRwKvnK
	hxdQm1kcVppnrs3Tg2z0GICSEx+x4k1+36i/1XZ+dfvoDqTtvIp0R/kTCwl6H1+vyRGL7Q9QGleDc
	MmIXtYign7c97AGSX/MDvgrooyl+id6u8KwPLDos1J/Qdx4qqynQdyCoeg57b/xV/o92qJG1zrEiQ
	OuDzbhYaWWvhN6HuhM0OS51GS2XEz6ikUjOcv90u5aqFiPVL0AjNclZNXkXCz1Nt40OtTOIM6OxwH
	Cfv7B+zqjrPrOf5vsOz+BhKMTExF/jRlzAaH1EA+KBm/qvk7UHtbqrY+C5+ocaBfU5u+DjEx8yPJx
	b+iK43yVDfIZt8ABXCHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyNy1-000eRJ-1N;
	Mon, 15 May 2023 02:29:41 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyNxy-000eQc-1R
	for linux-i3c@lists.infradead.org;
	Mon, 15 May 2023 02:29:39 +0000
Received: from [192.168.2.107] (210-10-213-150.per.static-ipl.aapt.com.au [210.10.213.150])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 984A320009;
	Mon, 15 May 2023 10:29:23 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1684117765;
	bh=NvHDVUNSdl6xcp8PiMWFvhuBNwhN7bACQxrwrmbZ1oM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=fOWlOkfvVgek86cynHAaLtIxtZ+zW1f6xrKHUk/hF3BsRpEBaQx0AgAh4m6zgCuZe
	 13+MoxMRs4tKW8r8sQ59wXzzQBaL4BAmU///naA1zyjM1uM7HlmOsPElbH6QQnwqyK
	 i9OBRIHBl7RfagN6I/PrKm+DYIEj7TGJu73ND6OhzkIgrGDSUeNcbSj8PubyBr3RFR
	 U78ijDj+Ls1z5dPQYpqzuKsJHPI/r9lrhkxMK0/IvoJNz6XgOXLnq59A9KTfO+Ejts
	 uz331FOL/h6+knKsE81hJHXU78w4owBIPhaiN7/L/8BNOrVcb+3IcyndqYnl3rZA4S
	 JoqaOghbL8s5w==
Message-ID: <ae1cd56a180c7622676f23719cb133eae9697a35.camel@codeconstruct.com.au>
Subject: Re: [RFC PATCH 0/2] I3C MCTP net driver
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: "Winiarska, Iwona" <iwona.winiarska@intel.com>, 
	"matt@codeconstruct.com.au"
	 <matt@codeconstruct.com.au>, "linux-i3c@lists.infradead.org"
	 <linux-i3c@lists.infradead.org>
Cc: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, 
	"joel@jms.id.au"
	 <joel@jms.id.au>
Date: Mon, 15 May 2023 10:29:22 +0800
In-Reply-To: <ec88c12095acb199492674adb2f01e1a9c5a9425.camel@intel.com>
References: <20230413081139.15673-1-matt@codeconstruct.com.au>
	 <f741f271752a6b141667625676487311a877a3db.camel@intel.com>
	 <4127aa2454a33bccf666597c292943ded9ccaa5d.camel@codeconstruct.com.au>
	 <4f58f4be52613b2ca18a68ec2bd511b4014c9143.camel@intel.com>
	 <8a95f7c15e9961cdde6b49662cd7fd4aed5c0ab6.camel@codeconstruct.com.au>
	 <ec88c12095acb199492674adb2f01e1a9c5a9425.camel@intel.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_192938_703294_45567E74 
X-CRM114-Status: GOOD (  16.71  )
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

SGkgSXdvbmEsCgo+ID4gSG93ZXZlcjogSSB3b3VsZCB0aGluayBpdCB3b3VsZCBiZSBtdWNoIHNp
bXBsZXIgdG8ganVzdCBwdXQgdGhlIHR3bwo+ID4gZGV2aWNlcyBvbiB0aGUgc2FtZSBpM2MgYnVz
IG9uIHRoZSBzYW1lIE1DVFAgbmV0d29yaywgYW5kIGFzc2lnbgo+ID4gZGlzdGluY3QgRUlEcy4g
V2hldGhlciB0aG9zZSBkZXZpY2VzIGNvdWxkIGNvbW11bmljYXRlIGNhbiBiZSBkZWZpbmVkIGJ5
Cj4gPiBicmlkZ2luZyBwb2xpY3kuCj4gCj4gVGhlIG9ubHkgcmVhc29uIHdoeSBJIGJlbGlldmUg
aXQgd291bGQgYmUgcG9zc2libGUgZm9yIHNvbWVvbmUgdG8gY29tZSB1cCB3aXRoCj4gc3VjaCBu
ZXR3b3JrIGxheW91dCB3b3VsZCBiZSB0aGUgbGltaXRlZCBhbW91bnQgb2YgRUlEcyBhdmFpbGFi
bGUgaW4gTUNUUCAxLngsCj4gaW4gd2hpY2ggY2FzZSBwdXR0aW5nIGV2ZXJ5dGhpbmcgaW4gdGhl
IHNhbWUgTUNUUCBuZXR3b3JrIHdvbid0IGJlIGFuIG9wdGlvbi4KClllcCwgdGhhdCdzIHRoZSBy
ZWFzb24gd2h5IHdlIGltcGxlbWVudGVkIG5ldHdvcmtzIGluIHRoZSBpbml0aWFsIGNvcmUKY29k
ZSAtIGl0J3MgbGlrZWx5IHRoYXQgd2UnbGwgaGl0IHRoZSBFSUQgbGltaXRzIGF0IHNvbWUgcG9p
bnQuCgo+IEknbSBicmluZ2luZyB0aGlzIHVwLCBzaW5jZSBJIG9yaWdpbmFsbHkgY29uc2lkZXJl
ZCBkZXZpY2UtZHJpdmVyIG1vZGVsIHRoYXQKPiBnb2VzIHdpdGggbmV0d29yayBjb250cm9sbGVy
IHBlciBJM0MgZGV2aWNlLgo+IEkgdGhpbmsgdGhpcyBpcyB0aGUgb25seSBjYXNlIGluIHdoaWNo
IGl0IGNhbiBiZSBtb3JlIGNvbXBsaWNhdGVkIHRvwqBtb2RlbC4KPiBJIGp1c3Qgd2FudCB0byBh
dm9pZCBhIHNpdHVhdGlvbiB3aGVyZSB3ZSBwYWludCBvdXJzZWx2ZXMgaW50byBhIGNvcm5lciwg
YW5kIHRoZQo+IFZMQU4tbGlrZSBhcHByb2FjaCBzb3VuZHMgZ29vZCB0byBtZSAoaWYgd2UgZXZl
ciBlbmQgdXAgbmVlZGluZyBpdCkuCgpPSywgbmVhdCAtIEkgdGhpbmsgd2UgaGF2ZSBhIHBsYW4g
c2hvdWxkIHdlIG5lZWQgdG8gcmVwcmVzZW50IHRoZSBpM2MKImxvZ2ljYWwgYnVzIiBpbiBmdXR1
cmUgdGhlbi4KCj4gPiBUaGUgZm9ybWVyIGlzIGRlZmluaXRlbHkgc2ltcGxlciwgYW5kIHdhcyB3
aGF0IEkgaGFkIG9yaWdpbmFsbHkKPiA+IGludGVuZGVkLCBidXQgbWF5IG5vdCBjb3ZlciBhbGwg
dXNlLWNhc2VzLiBJJ2QgYmUgaW50ZXJlc3RlZCBpbiB5b3VyCj4gPiB0aG91Z2h0cyB0aGVyZS4K
PiAKPiBDdXJyZW50bHksIEkgZG9uJ3Qgc2VlIGFueSB1c2UgY2FzZXMgd2hlcmUgYSAiZm9yd2Fy
ZGluZyIgYm9vbGVhbiBmbGFnIHdvdWxkbid0Cj4gYmUgZW5vdWdoLCBidXQgd2UgY2FuIGdvIGJh
Y2sgdG8gdGhpcyBpbiB0aGUgZnV0dXJlIHdoZW4gd2UgYWRkIGJyaWRnaW5nCj4gc3VwcG9ydC4K
ClNvdW5kcyBnb29kIHRoZW4sIHRoYW5rcyBmb3IgdGhlIGlucHV0IQoKQ2hlZXJzLAoKCkplcmVt
eQoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
