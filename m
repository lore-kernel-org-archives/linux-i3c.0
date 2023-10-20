Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 225BACDB474
	for <linux-i3c@archiver.kernel.org>; Fri, 20 Oct 2023 15:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mOYbatyM2b5gYpvgag67aiZTa5gMl8MLoec2eO/t+zw=; b=PMdP+Ao2Fg3g40
	rvDMv/oLEQG0MdkbcMbvBdnCqcJB9VFrSymZjcBlgx00pStb2tkzlHbjNWJJuSJW6vfA8nKPVIk6B
	w9VqF/yNVLb5w0QiXSxy4VVRakbLd13e3OKwuaRC46G0JdIzfBTL5l5obEC+Vd9k0vHSRWjh6bIP8
	1AAbudwPltbmLc/4WdIbFy6o/Wksar3F27u3W2i+QkqQ2K60XhD433Bq+pFl8b6LiswIXF4smdrcr
	TaPR8M7qXFro20xVmvAkQB88gce7Q/FZaFsXh2t/TqUbVeg3y4obMClu/mi9mA1eiGOShxRZj6hBp
	CxJRU35E18HZsKUxrBDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtrNI-002bQc-2g;
	Fri, 20 Oct 2023 15:25:20 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtrNG-002bQ6-1P
	for linux-i3c@lists.infradead.org;
	Fri, 20 Oct 2023 15:25:20 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7408CFF80F;
	Fri, 20 Oct 2023 15:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697815514;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vwbCNNZfs9RqfccAPlfkHKG0MKObWZhmJcj/5vJiL7Q=;
	b=TTHfJ/qwdJ0lc3+wOs0FQq0fHTPf0Gd2F+wMsOfyOY1nN1M+Uax9U1j5PgHftEzIY/0jn4
	tQXKWHoWNMHBSgfTmG+qkWWO9TVCpul5N7GliVRWDPl/bOEeqDaD0+H9yUQHQkTdgcytEk
	HHHF6XyPs4s47mRNvDIL1BL74XHh+peqRmD6zdb9UXQWrPNtsycISvsrx1zUE4RkBQi2zK
	F7iITjJ5O18dzpn+q4Cjazfd8W9Cg4+RgXR+9e+xlRB69dzI3CReMpm1f8w2J7ZGwqouAF
	HWlOhzkZvKocViyLGsPLRwf298Xcut7AN+4ctCjk1cDBT/nmkLkhowPryWJyZA==
Date: Fri, 20 Oct 2023 17:25:13 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.li@nxp.com>
Cc: alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
 imx@lists.linux.dev, joe@perches.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 Resent 6/6] i3c: master: svc: fix random hot join
 failure since timeout error
Message-ID: <20231020172513.43a99144@xps-13>
In-Reply-To: <ZTKZ/a5T6DLJz/ZQ@lizhi-Precision-Tower-5810>
References: <20231018155926.3305476-1-Frank.Li@nxp.com>
	<20231018155926.3305476-7-Frank.Li@nxp.com>
	<20231019084452.11fd0645@xps-13>
	<ZTFNvrsSoHOS3P2g@lizhi-Precision-Tower-5810>
	<20231020160645.67e678ee@xps-13>
	<ZTKMTwU6cVAfGCKG@lizhi-Precision-Tower-5810>
	<20231020163525.66485920@xps-13>
	<ZTKTGG7J55Sj19Nd@lizhi-Precision-Tower-5810>
	<ZTKZ/a5T6DLJz/ZQ@lizhi-Precision-Tower-5810>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_082518_787886_E5024D60 
X-CRM114-Status: GOOD (  34.15  )
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

SGkgRnJhbmssCgpGcmFuay5saUBueHAuY29tIHdyb3RlIG9uIEZyaSwgMjAgT2N0IDIwMjMgMTE6
MTc6MTcgLTA0MDA6Cgo+IE9uIEZyaSwgT2N0IDIwLCAyMDIzIGF0IDEwOjQ3OjUyQU0gLTA0MDAs
IEZyYW5rIExpIHdyb3RlOgo+ID4gT24gRnJpLCBPY3QgMjAsIDIwMjMgYXQgMDQ6MzU6MjVQTSAr
MDIwMCwgTWlxdWVsIFJheW5hbCB3cm90ZTogIAo+ID4gPiBIaSBGcmFuaywKPiA+ID4gCj4gPiA+
IEZyYW5rLmxpQG54cC5jb20gd3JvdGUgb24gRnJpLCAyMCBPY3QgMjAyMyAxMDoxODo1NSAtMDQw
MDoKPiA+ID4gICAKPiA+ID4gPiBPbiBGcmksIE9jdCAyMCwgMjAyMyBhdCAwNDowNjo0NVBNICsw
MjAwLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOiAgCj4gPiA+ID4gPiBIaSBGcmFuaywKPiA+ID4gPiA+
IAo+ID4gPiA+ID4gRnJhbmsubGlAbnhwLmNvbSB3cm90ZSBvbiBUaHUsIDE5IE9jdCAyMDIzIDEx
OjM5OjQyIC0wNDAwOgo+ID4gPiA+ID4gICAgIAo+ID4gPiA+ID4gPiBPbiBUaHUsIE9jdCAxOSwg
MjAyMyBhdCAwODo0NDo1MkFNICswMjAwLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOiAgICAKPiA+ID4g
PiA+ID4gPiBIaSBGcmFuaywKPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiBGcmFuay5MaUBu
eHAuY29tIHdyb3RlIG9uIFdlZCwgMTggT2N0IDIwMjMgMTE6NTk6MjYgLTA0MDA6Cj4gPiA+ID4g
PiA+ID4gICAgICAgCj4gPiA+ID4gPiA+ID4gPiBtYXN0ZXIgc2lkZSByZXBvcnQ6Cj4gPiA+ID4g
PiA+ID4gPiAgIHNpbHZhY28taTNjLW1hc3RlciA0NDMzMDAwMC5pM2MtbWFzdGVyOiBFcnJvciBj
b25kaXRpb246IE1TVEFUVVMgMHgwMjAwOTBjNywgTUVSUldBUk4gMHgwMDEwMDAwMAo+ID4gPiA+
ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiBCSVQgMjA6IFRJTUVPVVQgZXJyb3IKPiA+ID4gPiA+
ID4gPiA+ICAgVGhlIG1vZHVsZSBoYXMgc3RhbGxlZCB0b28gbG9uZyBpbiBhIGZyYW1lLiBUaGlz
IGhhcHBlbnMgd2hlbjoKPiA+ID4gPiA+ID4gPiA+ICAgLSBUaGUgVFggRklGTyBvciBSWCBGSUZP
IGlzIG5vdCBoYW5kbGVkIGFuZCB0aGUgYnVzIGlzIHN0dWNrIGluIHRoZQo+ID4gPiA+ID4gPiA+
ID4gbWlkZGxlIG9mIGEgbWVzc2FnZSwKPiA+ID4gPiA+ID4gPiA+ICAgLSBObyBTVE9QIHdhcyBp
c3N1ZWQgYW5kIGJldHdlZW4gbWVzc2FnZXMsCj4gPiA+ID4gPiA+ID4gPiAgIC0gSUJJIG1hbnVh
bCBpcyB1c2VkIGFuZCBubyBkZWNpc2lvbiB3YXMgbWFkZS4gICAgICAKPiA+ID4gPiA+ID4gPiAK
PiA+ID4gPiA+ID4gPiBJIGFtIHN0aWxsIG5vdCBjb252aW5jZWQgdGhpcyBzaG91bGQgYmUgaWdu
b3JlZCBpbiBhbGwgY2FzZXMuCj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gQ2FzZSAxIGlz
IGEgcHJvYmxlbSBiZWNhdXNlIHRoZSBoYXJkd2FyZSBmYWlsZWQgc29tZWhvdy4gICAgICAKPiA+
ID4gPiA+ID4gCj4gPiA+ID4gPiA+IEJ1dCBzbyBmYXIsIG5vIGFjdGlvbiB0byBoYW5kbGUgdGhp
cyBjYXNlIGluIGN1cnJlbnQgY29kZS4gICAgCj4gPiA+ID4gPiAKPiA+ID4gPiA+IFllcywgYnV0
IGlmIHlvdSBkZXRlY3QgYW4gaXNzdWUgYW5kIGlnbm9yZSBpdCwgaXQncyBub3QgYmV0dGVyIHRo
YW4KPiA+ID4gPiA+IHJlcG9ydGluZyBpdCB3aXRob3V0IGhhbmRsaW5nIGl0LiBJbnN0ZWFkIG9m
IHRvdGFsbHkgaWdub3JpbmcgdGhpcyBJCj4gPiA+ID4gPiB3b3VsZCBhdCBsZWFzdCB3cml0ZSBh
IGRlYnVnIG1lc3NhZ2UgKGlkZW50aWNhbCB0byB3aGF0J3MgYmVsb3cpIGJlZm9yZQo+ID4gPiA+
ID4gcmV0dXJuaW5nIGZhbHNlLCBldmVuIHRob3VnaCBJIGFtIG5vdCBjb252aW5jZWQgdW5jb25k
aXRpb25hbGx5Cj4gPiA+ID4gPiByZXR1cm5pbmcgZmFsc2UgaGVyZSBpcyB3aXNlLiBJZiB5b3Ug
ZmFpbCBhIGhhcmR3YXJlIHNlcXVlbmNlIGJlY2F1c2UKPiA+ID4gPiA+IHlvdSBhZGRlZCBhIHBy
aW50aywgaXQncyBhIHByb2JsZW0uIE1heWJlIHlvdSBjb25zaWRlciB0aGlzIGxpbmUgYXMKPiA+
ID4gPiA+IG5vaXNlLCBidXQgSSBiZWxpZXZlIGl0J3Mgc3RpbGwgYW4gZXJyb3IgY29uZGl0aW9u
LiBNYXliZSwgaG93ZXZlciwKPiA+ID4gPiA+IHRoaXMgYml0IGdldHMgc2V0IGFmdGVyIHRoZSB3
aG9sZSBzZXF1ZW5jZSwgYW5kIHRoaXMgaXMganVzdCBhICJidXMKPiA+ID4gPiA+IGlzIGlkbGUi
IGNvbmRpdGlvbi4gSWYgdGhhdCdzIHRoZSBjYXNlLCB0aGVuIHlvdSBuZWVkIHNvbWUKPiA+ID4g
PiA+IGFkZGl0aW9uYWwgaGV1cmlzdGljcyB0byBwcm9wZXJseSBpZ25vcmUgdGhlIGJpdD8KPiA+
ID4gPiA+ICAgICAKPiA+ID4gPiAKPiA+ID4gPiAgICAgICAgICAgICAgICAgZGV2X2VycihtYXN0
ZXItPmRldiwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKPiA+ID4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICAiRXJyb3IgY29uZGl0aW9uOiBNU1RBVFVTIDB4JTA4eCwg
TUVSUldBUk4gMHglMDh4XG4iLAo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIG1zdGF0
dXMsIG1lcnJ3YXJuKTsKPiA+ID4gPiArCj4gPiA+ID4gKwkJLyogaWdub3JlIHRpbWVvdXQgZXJy
b3IgKi8KPiA+ID4gPiArCQlpZiAobWVycndhcm4gJiBTVkNfSTNDX01FUlJXQVJOX1RJTUVPVVQp
Cj4gPiA+ID4gKwkJCXJldHVybiBmYWxzZTsKPiA+ID4gPiArCj4gPiA+ID4gCj4gPiA+ID4gSXMg
aXQgb2theSBtb3ZlIFNWQ19JM0NfTUVSUldBUk5fVElNRU9VVCBhZnRlciBkZXZfZXJyPyAgCj4g
PiA+IAo+ID4gPiBJIHRoaW5rIHlvdSBtZW50aW9uZWQgZWFybGllciB0aGF0IHRoZSBwcm9ibGVt
IHdhcyBub3QgdGhlIHByaW50ayBidXQKPiA+ID4gdGhlIHJldHVybiB2YWx1ZS4gU28gcGVyaGFw
cyB0aGVyZSBpcyBhIHdheSB0byBrbm93IGlmIHRoZSB0aW1lb3V0Cj4gPiA+IGhhcHBlbmVkIGFm
dGVyIGEgdHJhbnNhY3Rpb24gYW5kIHdhcyBsZWdpdGltYXRlIG9yIG5vdD8gIAo+ID4gCj4gPiBF
cnJvciBtZXNzYWdlIGp1c3QgYW5ub2lzZSB1c2VyLCBkb24ndCBpbXBhY3QgZnVuY3Rpb24uIEJ1
dCByZXR1cm4gZmFsc2UKPiA+IGxldCBJQkkgdGhyZWFkIHJ1bm5pbmcgdG8gYXZvaWQgZGVhZCBs
b2NrLiAgIAo+IAo+IEkgZm9yZ2V0IG1lbnRpb24gb25lIHRoaW5nLiBBbnkgZXJyb3IgbWVzc2Fn
ZSBoZXJlIHdpbGwgbWFrZSBTREEgbG93IGZvcgo+IGxvbmdlci4gIEJlZm9yZSBlbWl0IHN0b3As
IFNEQSBpcyBsb3cuCj4gCj4gSSBoYXZlIG5vdCBjaGVja2VkIEkzQyBzcGVjIHlldCBhYm91dCBo
b3cgbG9uZyBTREEgd2lsbCBiZSBhbGxvd2VkLiBpdCB3aWxsCj4gd29yc2VyIGlmIG1lc3NhZ2Ug
Z28gdGhyb3VnaCB1YXJ0IHBvcnQuIFRoZSBidXMgd2lsbCBiZSBsb2NrZWQgbG9uZ2VyLgo+IAo+
IEl0J3MgYmV0dGVyIHRvIHByaW50IGVycm9yIG1lc3NhZ2UgYWZ0ZXIgZW1pdF9zdG9wIHRvIHJl
ZHVjZSBTREEgbG93IHRpbWUuCgpUaGF0J3MgZmluZSBJIGd1ZXNzLgoKVGhhbmtzLApNaXF1w6hs
CgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
