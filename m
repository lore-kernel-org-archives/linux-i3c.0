Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A71C43602
	for <linux-i3c@archiver.kernel.org>; Tue, 30 Jun 2026 13:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CQHgpAK6Jjr0hmstagFM3q9vvev2oD3HEX/JpigPdb8=; b=HDWG1pN8tghVl3
	K0cs9xiyOM8aFKlMeLNlUpVJVFfXdP+UfrlvYG95kxjO1YqN3+VCvIgU78rl2vrQ3vxL2dtlzTnjg
	C/bzR+6PaaafZ3G9rmJQVNDDZuz+INA5f5V+uiXmgYwRkgcxgxiItw6n8pJTbc9XaEYSew74AKsYr
	MGVaIz8I+EAy64OG+ns5GIXCwtUC3pvjzP+IvRKlyZe/9v95bsh9u4eRz0BUuJqwNHWsKAS9CRnyc
	fGaU9cLfs3vgQC9rlc3aICquWNDyXWECPe3a/RZ/er6ihugOovzyDrUkSA0RcsEQiwq0qSa7As0s/
	YCQzoUYPAWKsCpHWIBaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weYYs-0000000HAiD-363C;
	Tue, 30 Jun 2026 13:31:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weYYm-0000000HAfz-4BiA
	for linux-i3c@lists.infradead.org;
	Tue, 30 Jun 2026 13:31:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4230A601D6;
	Tue, 30 Jun 2026 13:31:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABB971F000E9;
	Tue, 30 Jun 2026 13:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782826292;
	bh=jgBPP24kPhoa7GRdRFVBPkmEASPRfh8ZqL0pr2pC9ug=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CP1KrbUNDjg6y/mVXD/+pCD2ngVRs5MWbGB3RuBu7vd5zcEmWlYWfFpFTyZKWkwoc
	 f7Z4FqqDtZjBNmobXBk4VrXLTZn10Xw3lFitD4Ig2LPbPZtv1QojSyjQHoKYbIUJ/W
	 RVN6JGuK7W2xCCgNFV0bXyErRqa8rHc71rwvRu1hU7qusjAAhHknZp82zG9ANtTgiN
	 QhCNdfBOHDUhaFSmCKOsg4+qkBJA6WlYxJBVKCZb+w361hE+hvJJagJNuq6gVIRQKU
	 vfQ1L3PcicbjWg9jlcd79RT9XpW5tMQM24tb8Em+cWCc4pcvmSO83XjFz83GIFY6GD
	 vIlF6uaQFWjlQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/3] i3c: master: dw: Report actual GET CCC payload
 length on success
To: tze.yee.ng@altera.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, linux-i3c@lists.infradead.org
In-Reply-To: <b99393b7761ff249dfd147b5ac028ea2e48915ce.1782824628.git.tze.yee.ng@altera.com>
References: <cover.1782824628.git.tze.yee.ng@altera.com>
 <b99393b7761ff249dfd147b5ac028ea2e48915ce.1782824628.git.tze.yee.ng@altera.com>
Date: Tue, 30 Jun 2026 13:31:31 +0000
Message-Id: <20260630133131.ABB971F000E9@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpQcmUtZXhpc3RpbmcgaXNzdWVzOgot
IFtIaWdoXSBBIHByZS1leGlzdGluZyBidWcgYWxsb3dzIGEgTlVMTCBwb2ludGVyIGRlcmVmZXJl
bmNlIGluIGR3X2kzY19tYXN0ZXJfZW5kX3hmZXJfbG9ja2VkKCkgaWYgYSBTRVQgQ0NDIGNvbW1h
bmQgb3Igd3JpdGUgdHJhbnNmZXIgcmV0dXJucyB1bnJlYWQgZGF0YSB3aXRob3V0IGFuIGVycm9y
IGZsYWcuCi0tCgpjb21taXQgNmVkY2MxMzk0MmFiOWRjMzU3NmM2NTJmMTBhNGNlYThjYTA3N2Yy
NgpBdXRob3I6IEFkcmlhbiBOZyBIbyBZaW4gPGFkcmlhbi5oby55aW4ubmdAYWx0ZXJhLmNvbT4K
CmkzYzogbWFzdGVyOiBkdzogUmVwb3J0IGFjdHVhbCBHRVQgQ0NDIHBheWxvYWQgbGVuZ3RoIG9u
IHN1Y2Nlc3MKClRoaXMgY29tbWl0IHVwZGF0ZXMgc3VjY2Vzc2Z1bCBHRVQgQ0NDIHRyYW5zZmVy
cyB0byByZXBvcnQgdGhlIGFjdHVhbApudW1iZXIgb2YgYnl0ZXMgcmVhZCBieSBzZXR0aW5nIGRl
c3RzWzBdLnBheWxvYWQuYWN0dWFsX2xlbiBmcm9tClJFU1BPTlNFX1BPUlRfREFUQV9MRU4uIEl0
IGFsc28gdXBkYXRlcyBzdHJ1Y3QgaTNjX2NjY19jbWRfcGF5bG9hZCB0bwpzdG9yZSB0aGlzIGFj
dHVhbCBsZW5ndGggYWxvbmdzaWRlIHRoZSByZXF1ZXN0ZWQgYnVmZmVyIHNpemUuCgo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIvZHctaTNjLW1hc3Rlci5jIGIvZHJpdmVycy9pM2Mv
bWFzdGVyL2R3LWkzYy1tYXN0ZXIuYwo+IGluZGV4IDJmOGMwYzQ2ODNlMDYuLmU2NTllZGU3OWZj
MDMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9pM2MvbWFzdGVyL2R3LWkzYy1tYXN0ZXIuYwo+ICsr
KyBiL2RyaXZlcnMvaTNjL21hc3Rlci9kdy1pM2MtbWFzdGVyLmMKPiBAQCAtNzQyLDcgKzc0Miwx
MCBAQCBzdGF0aWMgaW50IGR3X2kzY19jY2Nfc2V0KHN0cnVjdCBkd19pM2NfbWFzdGVyICptYXN0
ZXIsCj4gIAkJZHdfaTNjX21hc3Rlcl9kZXF1ZXVlX3hmZXIobWFzdGVyLCB4ZmVyKTsKPiAgCj4g
IAlyZXQgPSB4ZmVyLT5yZXQ7Cj4gLQlpZiAoeGZlci0+Y21kc1swXS5lcnJvciA9PSBSRVNQT05T
RV9FUlJPUl9JQkFfTkFDSykKPiArCWNtZCA9ICZ4ZmVyLT5jbWRzWzBdOwo+ICsJaWYgKCFyZXQp
Cj4gKwkJY2NjLT5kZXN0c1swXS5wYXlsb2FkLmFjdHVhbF9sZW4gPSBjbWQtPnJ4X2xlbjsKPiAr
CWlmIChjbWQtPmVycm9yID09IFJFU1BPTlNFX0VSUk9SX0lCQV9OQUNLKQo+ICAJCWNjYy0+ZXJy
ID0gSTNDX0VSUk9SX00yOwoKW1NldmVyaXR5OiBIaWdoXQpUaGlzIGlzIGEgcHJlLWV4aXN0aW5n
IGlzc3VlLCBidXQgY2FuIHRoaXMgbGVhZCB0byBhIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZQpk
dXJpbmcgYSBTRVQgQ0NDIGNvbW1hbmQgaWYgdGhlIHRhcmdldCB0ZXJtaW5hdGVzIHRoZSB0cmFu
c2ZlciBlYXJseT8KCklmIGEgU0VUIENDQyAod3JpdGUpIGNvbW1hbmQgdGVybWluYXRlcyBlYXJs
eSwgdGhlIGhhcmR3YXJlIGNhbiBwb3B1bGF0ZSB0aGUKcmVzcG9uc2UgcXVldWUgd2l0aCBEQVRB
X0xFTiA+IDAgKGluZGljYXRpbmcgcmVtYWluaW5nIHVuLXNlbnQgYnl0ZXMpIGFuZApFUlJfU1RB
VFVTID09IDAuCgpMb29raW5nIGF0IGR3X2kzY19tYXN0ZXJfZW5kX3hmZXJfbG9ja2VkKCk6Cgog
ICAgaWYgKGNtZC0+cnhfbGVuICYmICFjbWQtPmVycm9yKQogICAgICAgIGR3X2kzY19tYXN0ZXJf
cmVhZF9yeF9maWZvKG1hc3RlciwgY21kLT5yeF9idWYsIGNtZC0+cnhfbGVuKTsKClNpbmNlIGNt
ZC0+cnhfYnVmIGlzIHVuaW5pdGlhbGl6ZWQgKE5VTEwpIGZvciB3cml0ZSB0cmFuc2ZlcnMsIHdv
bid0IHRoaXMKdW5jb25kaXRpb25hbGx5IHBhc3MgYSBOVUxMIHBvaW50ZXIgdG8gdGhlIEZJRk8g
c3RyaW5nLXJlYWQgSS9PIGZ1bmN0aW9uCndoZW4gaGFuZGxpbmcgdGhlIHJlbWFpbmluZyBieXRl
cz8KCj4gIAo+ICAJcmV0dXJuIHJldDsKCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczov
L3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvY292ZXIuMTc4MjgyNDYyOC5naXQudHplLnllZS5uZ0Bh
bHRlcmEuY29tP3BhcnQ9MQoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1pM2MK
