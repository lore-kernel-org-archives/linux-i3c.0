Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 355C0CD8CA4
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Jun 2026 20:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5obRao8EMBN9icS871cyMfgnlS0Tbn4pITRNQy0Vx0A=; b=w0LIRTqFiPFmpX
	kQmL4PuWjVTN7HjeMcwO2gJNcil8sw8Nx1QPliTYIUwlVr7o0IcsEqPHCMYLX5m//P+F6lJa4LsHN
	fSGf2HwxGOk8nDnMMGtEvVOesy3TRis7ASyY0XfUaunRQCIUVW74nkHYI2W0G9kfO/aQu2kcc5SY7
	ioaqq0KVn46JixiZ6lryc7MVXJIauPDCYBsK6ApSCznIjoSkGuqnniNPddYbj8M7fTHgNevZJovWr
	iNcIcKxqTazCIsSnjz3BIWcrGT6ZgMvcm7f3mSKpDaNnaBGQxuq2JH87jCBdHgNnpLH7UKEp3FpAy
	wpmEvNxQaUAh77ILMxHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWgjw-00000004MpO-3FRX;
	Mon, 08 Jun 2026 20:38:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWgjv-00000004MpA-1kHv
	for linux-i3c@lists.infradead.org;
	Mon, 08 Jun 2026 20:38:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D046543BB0;
	Mon,  8 Jun 2026 20:38:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 796161F00893;
	Mon,  8 Jun 2026 20:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780951110;
	bh=ibU7SCaYUmsDzAZmbXO5n4aydy1KQyyAG7RNFmpA83g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IWtmqRnouGK5+9QdGI1MhmVW1tRe2GY6oo15Io6/xZY6Tu54QJpLTFENOZjuT3bpQ
	 ViBWPRYujGsHoeKL64KGbtsE8d3xs1oeUfUhiNPy5KgqM8WXw1sPOV7+HdOu/+SaTX
	 JT4t+GyxReqLW7YLWqfwDPIKZzPU+6l4A1pTJTRo/nfXCesI38HTsdzyWy92SNuZnf
	 lOU/7A/on7Q3lDUMNFyveE1OKF3v0Gb/oHLfUrOVXQDB1v4oeuuyJK7iE4tJRWynWQ
	 FjbINfVEiXSP6pvV4TPqlSSau7k2/q1bqmzaEhcZGzNSSfPLWOoxOQKsronKM0CFve
	 Cspmm8aPf6KqQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 13/17] i3c: renesas: Update HW registers after SW
 computations are done
To: "Claudiu Beznea" <claudiu.beznea@kernel.org>
Cc: linux-i3c@lists.infradead.org, Frank.Li@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260608201543.804902-14-claudiu.beznea@kernel.org>
References: <20260608201543.804902-14-claudiu.beznea@kernel.org>
Date: Mon, 08 Jun 2026 20:38:30 +0000
Message-Id: <20260608203830.796161F00893@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpQcmUtZXhpc3RpbmcgaXNzdWVzOgot
IFtIaWdoXSBEaXZpc2lvbiBieSB6ZXJvIHdoZW4gY2FsY3VsYXRpbmcgaTJjX3RvdGFsX3RpY2tz
IGluIEkzQ19CVVNfTU9ERV9QVVJFIGlmIHRoZSBJMkMgU0NMIHJhdGUgaXMgbm90IHByb3ZpZGVk
LgotIFtIaWdoXSBTaWxlbnQgdHJ1bmNhdGlvbiBvZiBFWFRCUiByZWdpc3RlciBmaWVsZHMgY2F1
c2VzIGludmFsaWQgdGltaW5nIGNvbmZpZ3VyYXRpb25zIHdoZW4gdGljayBjb3VudHMgZXhjZWVk
IDI1NS4KLS0KCmNvbW1pdCAzNzllZWI4MzgwYWFjNWI3NTgxMDU5Njk4OWVkZmYyY2IyMDg0ZDNi
CkF1dGhvcjogQ2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVhLnVqQGJwLnJlbmVzYXMuY29t
PgoKaTNjOiByZW5lc2FzOiBVcGRhdGUgSFcgcmVnaXN0ZXJzIGFmdGVyIFNXIGNvbXB1dGF0aW9u
cyBhcmUgZG9uZQoKcmVuZXNhc19pM2NfYnVzX2luaXQoKSBwZXJmb3JtcyBhIG51bWJlciBvZiBj
b21wdXRhdGlvbnMgYW5kIHNvZnR3YXJlCmNhY2hlIHVwZGF0ZXMsIGludGVybGVhdmluZyB0aGVt
IHdpdGggaGFyZHdhcmUgcmVnaXN0ZXIgd3JpdGVzLiBXaGlsZQp0aGlzIHdvcmtzIHRvZGF5LCBp
dCBtYWtlcyBpdCBoYXJkZXIgdG8gbWluaW1pemUgdGhlIHRpbWUgdGhlIGNvbnRyb2xsZXIKbXVz
dCByZW1haW4gcG93ZXJlZCB3aGVuIHJ1bnRpbWUgUE0gaXMgaW50cm9kdWNlZC4KClBlcmZvcm0g
YWxsIHNvZnR3YXJlIGNvbXB1dGF0aW9ucyBhbmQgY2FjaGUgdXBkYXRlcyBmaXJzdCwgdGhlbiB1
cGRhdGUKdGhlIGhhcmR3YXJlIHJlZ2lzdGVycy4gVGhpcyBwcmVwYXJlcyBmb3IgZnV0dXJlIHJ1
bnRpbWUgUE0gc3VwcG9ydC4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci9yZW5l
c2FzLWkzYy5jIGIvZHJpdmVycy9pM2MvbWFzdGVyL3JlbmVzYXMtaTNjLmMKPiBpbmRleCBkYWI2
NDNjZDg4NTk4Li4zOGNlNzIyODgxZGE0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rl
ci9yZW5lc2FzLWkzYy5jCj4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyL3JlbmVzYXMtaTNjLmMK
PiBAQCAtNTYwLDEwICs1NjAsNiBAQCBzdGF0aWMgaW50IHJlbmVzYXNfaTNjX2J1c19pbml0KHN0
cnVjdCBpM2NfbWFzdGVyX2NvbnRyb2xsZXIgKm0pCj4gIAlpZiAoIWkzYy0+cmF0ZSkKPiAgCQly
ZXR1cm4gLUVJTlZBTDsKPiAgCj4gLQlyZXQgPSByZW5lc2FzX2kzY19yZXNldChpM2MpOwo+IC0J
aWYgKHJldCkKPiAtCQlyZXR1cm4gcmV0Owo+IC0KPiAgCWkyY190b3RhbF90aWNrcyA9IERJVl9S
T1VORF9VUChpM2MtPnJhdGUsIGJ1cy0+c2NsX3JhdGUuaTJjKTsKCltTZXZlcml0eTogSGlnaF0K
VGhpcyBpcyBhIHByZS1leGlzdGluZyBpc3N1ZSwgYnV0IGNvdWxkIHRoaXMgY2F1c2UgYSBkaXZp
c2lvbiBieSB6ZXJvIHBhbmljCmluIHJlbmVzYXNfaTNjX2J1c19pbml0KCk/CgpJZiB0aGUgSTND
IGJ1cyBvcGVyYXRlcyBpbiBJM0NfQlVTX01PREVfUFVSRSBhbmQgdGhlIGkyYy1zY2wtaHogcHJv
cGVydHkKaXMgbWlzc2luZyBmcm9tIHRoZSBkZXZpY2UgdHJlZSwgYnVzLT5zY2xfcmF0ZS5pMmMg
cmVtYWlucyAwIGJlY2F1c2UgdGhlIGNvcmUKZnVuY3Rpb24gaTNjX2J1c19zZXRfbW9kZSgpIGRv
ZXMgbm90IGFwcGx5IGEgZmFsbGJhY2sgdmFsdWUgaW4gcHVyZSBtb2RlLgpXaWxsIHRoaXMgbGVh
ZCB0byBhIGRpdmlzaW9uIGJ5IHplcm8gZHVyaW5nIHRoZSBwcm9iZSBwaGFzZT8KCj4gIAlpM2Nf
dG90YWxfdGlja3MgPSBESVZfUk9VTkRfVVAoaTNjLT5yYXRlLCBidXMtPnNjbF9yYXRlLmkzYyk7
CgpbIC4uLiBdCgo+IEBAIC02MTQsMjcgKzYxMCwzMSBAQCBzdGF0aWMgaW50IHJlbmVzYXNfaTNj
X2J1c19pbml0KHN0cnVjdCBpM2NfbWFzdGVyX2NvbnRyb2xsZXIgKm0pCj4gIAkJCVNUREJSX1NC
UkhPKGRvdWJsZV9TQlIsIG9kX2hpZ2hfdGlja3MpIHwKPiAgCQkJU1REQlJfU0JSTFAocHBfbG93
X3RpY2tzKSB8Cj4gIAkJCVNUREJSX1NCUkhQKHBwX2hpZ2hfdGlja3MpOwo+IC0JcmVuZXNhc193
cml0ZWwoaTNjLT5yZWdzLCBTVERCUiwgaTNjLT5pM2NfU1REQlIpOwo+ICAKPiAgCS8qIEV4dGVu
ZGVkIEJpdCBSYXRlIHNldHRpbmcgKi8KPiAgCWkzYy0+ZXh0YnIgPSBFWFRCUl9FQlJMTyhvZF9s
b3dfdGlja3MpIHwgRVhUQlJfRUJSSE8ob2RfaGlnaF90aWNrcykgfAoKW1NldmVyaXR5OiBIaWdo
XQpUaGlzIGlzbid0IGEgYnVnIGludHJvZHVjZWQgYnkgdGhpcyBwYXRjaCwgYnV0IGNvdWxkIHRo
aXMgc2lsZW50bHkgdHJ1bmNhdGUKdGhlIEVYVEJSIHJlZ2lzdGVyIGZpZWxkcz8KClRoZSBkcml2
ZXIgc3VwcG9ydHMgb2RfbG93X3RpY2tzIGFuZCBvZF9oaWdoX3RpY2tzIHVwIHRvIDUxMCBieSBj
aGVja2luZwoob2RfbG93X3RpY2tzIC8gMikgPiAweEZGLiBGb3IgdGhlIFNUREJSIHJlZ2lzdGVy
cywgZG91YmxlX1NCUiBpcyBzZXQgYW5kCnVzZWQgdG8gcmlnaHQtc2hpZnQgdGhlIHZhbHVlcy4g
SG93ZXZlciwgRVhUQlJfRUJSTE8gYW5kIEVYVEJSX0VCUkhPIGRpcmVjdGx5CmFwcGx5IGFuIDgt
Yml0IG1hc2sgKGUuZy4gRklFTERfUFJFUChHRU5NQVNLKDcsIDApLCB4KSkgd2l0aG91dCBzaGlm
dGluZy4KCklmIHRoZSBhZGp1c3RlZCB0aWNrcyBmYWxsIGJldHdlZW4gMjU2IGFuZCA1MTAsIGRv
ZXMgdGhpcyBtaXNjb25maWd1cmUgdGhlCmhhcmR3YXJlIHdpdGggZHJhc3RpY2FsbHkgc2hvcnRl
bmVkIG9yIHplcm8tbGVuZ3RoIEV4dGVuZGVkIEJpdCBSYXRlIHBlcmlvZHM/Cgo+ICAJCSAgICAg
RVhUQlJfRUJSTFAocHBfbG93X3RpY2tzKSB8IEVYVEJSX0VCUkhQKHBwX2hpZ2hfdGlja3MpOwo+
IC0JcmVuZXNhc193cml0ZWwoaTNjLT5yZWdzLCBFWFRCUiwgaTNjLT5leHRicik7CgotLSAKU2Fz
aGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNjA4
MjAxNTQzLjgwNDkwMi0xLWNsYXVkaXUuYmV6bmVhQGtlcm5lbC5vcmc/cGFydD0xMwoKLS0gCmxp
bnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
