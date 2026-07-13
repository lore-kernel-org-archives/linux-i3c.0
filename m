Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8DA9C44507
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Jul 2026 14:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0rfmwI/vHaOPrfNSnu3ntxEHQgol6GRzxBvNNemz9TA=; b=BEHs2muNkuFc9t
	34hfCiqQz88ie0hCudCW4VOSEtUNqddBnG5V8taO0luyxOdcIzJryteBmPRVrybVsZ8OyhXKgthGW
	1+rstXAKoKpy3qJw1KBWZug/1oj8wlOqThQBcI5wLeEbBf88qg/7TyrJvomZ8Jim2KpCL5x04woB2
	W4CB81cW4LgO/yFx5sLd3YjumrSJ3G0q1bbQUdGbRgtVNV1n1qVcphjF2RzKSW7ZaEjE2t03W5SmI
	dBiLtL4wvpTDZAQ/b4JZO5NhAmR/mCqwG8kxpSrHVyQVXhRfebIV+yKynX36AnKSYxakpnIXRPprK
	rpicjrdV/1FXIgszypoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjHMx-00000009Yj8-2kos;
	Mon, 13 Jul 2026 14:10:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjHMw-00000009Yj2-3X44
	for linux-i3c@lists.infradead.org;
	Mon, 13 Jul 2026 14:10:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4336F403C9;
	Mon, 13 Jul 2026 14:10:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8BAF1F000E9;
	Mon, 13 Jul 2026 14:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783951850;
	bh=I+iYF7Uvb5+zMHVL8TxTPiAXVD3xzolkRuEKE7uQmJ8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZqLTGHjDVFIEgWF88BjLJP2Wl23BdVgBCWNut/RHApNGhXEpmp8SHqyu8PFOZ7gG/
	 hbn/5i8e3Mi+ZutPZTit+Zj59bst2p4K7agZV5AFt8HiACwkYOsV7/bxLZ1/Gf8Mp1
	 v7WLvXGynBSuJg+luzsHwFRQkRpIRstV4GYtS+TwBX5FrRIug9SITM0Cj8eSSvjDH7
	 3nbbAiCynHqKvKzfwYcErMhYIWeLVzzYgI9/IrBB7pNZ8XHHqYSpWwNq14/xxstcCh
	 o0LsiwUBlP/YWWy3uf4vPcefjonL5dz2nKHBiTl+hwxVhF5hJhgtVlqWUhzD5PGYhC
	 yvWKwfdOs0ChA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 13/17] i3c: renesas: Update HW registers after SW
 computations are done
To: "Claudiu Beznea" <claudiu.beznea@tuxon.dev>
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, linux-i3c@lists.infradead.org, wsa+renesas@sang-engineering.com, Frank.Li@kernel.org
In-Reply-To: <20260713130545.568657-14-claudiu.beznea+renesas@tuxon.dev>
References: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
 <20260713130545.568657-14-claudiu.beznea+renesas@tuxon.dev>
Date: Mon, 13 Jul 2026 14:10:49 +0000
Message-Id: <20260713141049.C8BAF1F000E9@smtp.kernel.org>
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
IFtIaWdoXSBQb3RlbnRpYWwgZGl2aXNpb24gYnkgemVybyB3aGVuIGNhbGN1bGF0aW5nIHRpbWlu
ZyBhZGp1c3RtZW50cyBpZiBpM2MtPnJhdGUgPiAxIEdIei4KLSBbSGlnaF0gS2VybmVsIHBhbmlj
IGR1ZSB0byBkaXZpc2lvbiBieSB6ZXJvIGlmIHRoZSBJM0MgYnVzIG9wZXJhdGVzIGluIHB1cmUg
bW9kZSBhbmQgdGhlIGRldmljZSB0cmVlIGxhY2tzIHRoZSAnaTJjLXNjbC1oeicgcHJvcGVydHku
Ci0tCgotLS0gUGF0Y2ggWzEzXTogW1BBVENIIHY1IDEzLzE3XSBpM2M6IHJlbmVzYXM6IFVwZGF0
ZSBIVyByZWdpc3RlcnMgYWZ0ZXIgU1cgY29tcHV0YXRpb25zIGFyZSBkb25lIC0tLQpjb21taXQg
YzRmOTEzZDk2NTg5MDZmM2NjNDU5Y2FlN2UxZDcwY2Q1MzE4ZGMzYwpBdXRob3I6IENsYXVkaXUg
QmV6bmVhIDxjbGF1ZGl1LmJlem5lYS51akBicC5yZW5lc2FzLmNvbT4KU3ViamVjdDogaTNjOiBy
ZW5lc2FzOiBVcGRhdGUgSFcgcmVnaXN0ZXJzIGFmdGVyIFNXIGNvbXB1dGF0aW9ucyBhcmUgZG9u
ZQoKVGhpcyBwYXRjaCBtb2RpZmllcyByZW5lc2FzX2kzY19idXNfaW5pdCgpIHRvIHBlcmZvcm0g
c29mdHdhcmUgY29tcHV0YXRpb25zCmFuZCBjYWNoZSB1cGRhdGVzIGJlZm9yZSB3cml0aW5nIHRv
IGhhcmR3YXJlIHJlZ2lzdGVycy4gVGhpcyBwcmVwYXJlcyB0aGUKZHJpdmVyIGZvciBmdXR1cmUg
cnVudGltZSBQTSBzdXBwb3J0IGJ5IG1pbmltaXppbmcgdGhlIHRpbWUgdGhlIGNvbnRyb2xsZXIK
bXVzdCByZW1haW4gcG93ZXJlZC4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci9y
ZW5lc2FzLWkzYy5jIGIvZHJpdmVycy9pM2MvbWFzdGVyL3JlbmVzYXMtaTNjLmMKPiBpbmRleCA1
MmYwOWQ5NjY2NTEyLi4yY2ZmN2M2YWUzNjkyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaTNjL21h
c3Rlci9yZW5lc2FzLWkzYy5jCj4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyL3JlbmVzYXMtaTNj
LmMKPiBAQCAtNTY1LDEwICs1NjUsNiBAQCBzdGF0aWMgaW50IHJlbmVzYXNfaTNjX2J1c19pbml0
KHN0cnVjdCBpM2NfbWFzdGVyX2NvbnRyb2xsZXIgKm0pCj4gIAlpZiAoIWkzYy0+cmF0ZSkKPiAg
CQlyZXR1cm4gLUVJTlZBTDsKPiAgCj4gLQlyZXQgPSByZW5lc2FzX2kzY19yZXNldChpM2MpOwo+
IC0JaWYgKHJldCkKPiAtCQlyZXR1cm4gcmV0Owo+IC0KPiAgCWkyY190b3RhbF90aWNrcyA9IERJ
Vl9ST1VORF9VUChpM2MtPnJhdGUsIGJ1cy0+c2NsX3JhdGUuaTJjKTsKCltTZXZlcml0eTogSGln
aF0KVGhpcyBpcyBhIHByZS1leGlzdGluZyBpc3N1ZSwgYnV0IGRvZXMgdGhpcyBjb2RlIGNhdXNl
IGEgZGl2aWRlIGJ5IHplcm8gaWYKdGhlIGJ1cyBvcGVyYXRlcyBpbiBwdXJlIG1vZGUgd2l0aG91
dCBhbiBleHBsaWNpdCBJMkMgcmF0ZSBsaW1pdD8KCklmIHRoZSBJM0MgYnVzIGhhcyBubyBJMkMg
Y2hpbGRyZW4gKGZhbGxpbmcgYmFjayB0byBJM0NfQlVTX01PREVfUFVSRSkgYW5kCnRoZSBkZXZp
Y2UgdHJlZSBsYWNrcyB0aGUgJ2kyYy1zY2wtaHonIHByb3BlcnR5LCBidXMtPnNjbF9yYXRlLmky
YyBpcyBuZXZlcgpwb3B1bGF0ZWQgYW5kIHJlbWFpbnMgMC4gCgpXaGVuIERJVl9ST1VORF9VUCgp
IGV4ZWN1dGVzIGhlcmUgaW4gcmVuZXNhc19pM2NfYnVzX2luaXQoKSwgd2lsbCBpdAp0cmlnZ2Vy
IGEga2VybmVsIHBhbmljPwoKPiAgCWkzY190b3RhbF90aWNrcyA9IERJVl9ST1VORF9VUChpM2Mt
PnJhdGUsIGJ1cy0+c2NsX3JhdGUuaTNjKTsKPiAgCgpbIC4uLiBdCgo+IEBAIC02MTksMjcgKzYx
NSwzMSBAQCBzdGF0aWMgaW50IHJlbmVzYXNfaTNjX2J1c19pbml0KHN0cnVjdCBpM2NfbWFzdGVy
X2NvbnRyb2xsZXIgKm0pCj4gIAkJCVNUREJSX1NCUkhPKGRvdWJsZV9TQlIsIG9kX2hpZ2hfdGlj
a3MpIHwKPiAgCQkJU1REQlJfU0JSTFAocHBfbG93X3RpY2tzKSB8Cj4gIAkJCVNUREJSX1NCUkhQ
KHBwX2hpZ2hfdGlja3MpOwoKW1NldmVyaXR5OiBIaWdoXQpUaGlzIGlzbid0IGEgYnVnIGludHJv
ZHVjZWQgYnkgdGhpcyBwYXRjaCwgYnV0IGNhbiB3ZSBoaXQgYSBkaXZpZGUgYnkgemVybwpleGNl
cHRpb24gZHVyaW5nIHRoZXNlIHRpbWluZyBjYWxjdWxhdGlvbnMgaW4gcmVuZXNhc19pM2NfYnVz
X2luaXQoKSBhbmQKcmVuZXNhc19pM2NfaHdfaW5pdCgpIGlmIHRoZSBJM0MgY29udHJvbGxlciBj
bG9jayAodGNsaykgZXhjZWVkcyAxIEdIej8KCkxvb2tpbmcgYXQgdGhlIGNvZGUganVzdCBiZWZv
cmUgdGhpcyBodW5rIGluIHJlbmVzYXNfaTNjX2J1c19pbml0KCk6CgogICAgb2RfbG93X3RpY2tz
IC09IHQuc2NsX2ZhbGxfbnMgLyAoTlNFQ19QRVJfU0VDIC8gaTNjLT5yYXRlKSArIDE7CiAgICBv
ZF9oaWdoX3RpY2tzIC09IHQuc2NsX3Jpc2VfbnMgLyAoTlNFQ19QRVJfU0VDIC8gaTNjLT5yYXRl
KSArIDE7CgpBbmQgc2ltaWxhcmx5IGluIHJlbmVzYXNfaTNjX2h3X2luaXQoKSBpbiBkcml2ZXJz
L2kzYy9tYXN0ZXIvcmVuZXNhcy1pM2MuYzoKCiAgICB2YWwgPSBESVZfUk9VTkRfVVAoSTNDX0JV
U19UQlVGX01JWEVEX0ZNX01JTl9OUywKICAgICAgICAgICAgICAgICAgICAgICBOU0VDX1BFUl9T
RUMgLyBpM2MtPnJhdGUpOwoKSWYgaTNjLT5yYXRlIGlzIGdyZWF0ZXIgdGhhbiAxLDAwMCwwMDAs
MDAwLCBpbnRlZ2VyIGRpdmlzaW9uCihOU0VDX1BFUl9TRUMgLyBpM2MtPnJhdGUpIGV2YWx1YXRl
cyB0byAwLiAKCldpbGwgdGhpcyB0cnVuY2F0ZWQgemVybyB2YWx1ZSBzdWJzZXF1ZW50bHkgYmUg
dXNlZCBhcyBhIGRpdmlzb3IsIGNhdXNpbmcgYQprZXJuZWwgcGFuaWMgZHVyaW5nIHRoZSBkcml2
ZXIncyBwcm9iZSBzZXF1ZW5jZT8KCj4gLQlyZW5lc2FzX3dyaXRlbChpM2MtPnJlZ3MsIFNUREJS
LCBpM2MtPmkzY19TVERCUik7Cj4gIAo+ICAJLyogRXh0ZW5kZWQgQml0IFJhdGUgc2V0dGluZyAq
Lwo+ICAJaTNjLT5leHRiciA9IEVYVEJSX0VCUkxPKG9kX2xvd190aWNrcykgfCBFWFRCUl9FQlJI
TyhvZF9oaWdoX3RpY2tzKSB8Cj4gIAkJICAgICBFWFRCUl9FQlJMUChwcF9sb3dfdGlja3MpIHwg
RVhUQlJfRUJSSFAocHBfaGlnaF90aWNrcyk7CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0
cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNzEzMTMwNTQ1LjU2ODY1Ny0xLWNsYXVk
aXUuYmV6bmVhK3JlbmVzYXNAdHV4b24uZGV2P3BhcnQ9MTMKCi0tIApsaW51eC1pM2MgbWFpbGlu
ZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
