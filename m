Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE9CC001DF
	for <linux-i3c@archiver.kernel.org>; Fri, 20 Oct 2023 14:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j/GZTkmTCIcgfeCZB8r74hbfRaOwQidQMgZQMzughao=; b=R+g9m+kAMNWGHl
	M8XAQuQRLB1QEk6UQg38Z8SulGajBXbwdyOZpKoRORYCK+1hD8qJSoYiw6i425cIuys7joc7tw7Jd
	whjZecfKeAPPyTnml0AlqimMyz/ERgEBbSJ8+Y9ygblI2gHHjnzBPIik/kynhej2Ix8wCpefj+G/N
	dZPQvH5GP5qydPH1Leu52nalwIWu5mRZGsQfGC/UFQ1EKwoP5jPleau14KXffeBJ8gvrUNtcjF+UP
	MBxsS/lMIkNbbDxedFgIHaU6DzvSoJSsXv/vsOcgqY8tYJk9YyLBw/rGcenNIsbUzi0R3w7vvVvap
	aZ/ygNwhMTL6SPkeGBfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtq9M-002SJy-0c;
	Fri, 20 Oct 2023 14:06:52 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtq9I-002SJL-1w
	for linux-i3c@lists.infradead.org;
	Fri, 20 Oct 2023 14:06:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D3A3E240003;
	Fri, 20 Oct 2023 14:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697810806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A91K6zlEKLhuycCQFLR+/+lN0OcNnP4kMPmtOe8X+HA=;
	b=QYKGT/MBOY/andJrqj9xHV6SVZApoxcCKcIyQUWiqpy8JQ/Tgx5ZZm76WzdhEOf1BdDhTB
	+qwzP6cgBLunxsSuvBE7kutHjwVOYFFpmFXQ+0rv9lYDtE3wktvUK6ccKYtxmyXeVIeymx
	/jthVKhNBVbaeHLlGIPacKiLw9rwAWVYYiD/37ZD5eqCwTZyNms+uWxh6faYjG3rorrLoi
	vMOka0r1sdBgHAGiKfZC1xfp2YAusBGiwHbN5wEM+un2YY22Z3FSXkSsjRjXuMQZL6tDG/
	rnhaNFCD6J+6008scB1oq/kbmW/D7WHGehBZpDYzt0bzGfb21yqZP3tONDbYbA==
Date: Fri, 20 Oct 2023 16:06:45 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.li@nxp.com>
Cc: alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
 imx@lists.linux.dev, joe@perches.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 Resent 6/6] i3c: master: svc: fix random hot join
 failure since timeout error
Message-ID: <20231020160645.67e678ee@xps-13>
In-Reply-To: <ZTFNvrsSoHOS3P2g@lizhi-Precision-Tower-5810>
References: <20231018155926.3305476-1-Frank.Li@nxp.com>
	<20231018155926.3305476-7-Frank.Li@nxp.com>
	<20231019084452.11fd0645@xps-13>
	<ZTFNvrsSoHOS3P2g@lizhi-Precision-Tower-5810>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_070649_110756_7A92B3CD 
X-CRM114-Status: GOOD (  28.29  )
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

SGkgRnJhbmssCgpGcmFuay5saUBueHAuY29tIHdyb3RlIG9uIFRodSwgMTkgT2N0IDIwMjMgMTE6
Mzk6NDIgLTA0MDA6Cgo+IE9uIFRodSwgT2N0IDE5LCAyMDIzIGF0IDA4OjQ0OjUyQU0gKzAyMDAs
IE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBIaSBGcmFuaywKPiA+IAo+ID4gRnJhbmsuTGlAbnhw
LmNvbSB3cm90ZSBvbiBXZWQsIDE4IE9jdCAyMDIzIDExOjU5OjI2IC0wNDAwOgo+ID4gICAKPiA+
ID4gbWFzdGVyIHNpZGUgcmVwb3J0Ogo+ID4gPiAgIHNpbHZhY28taTNjLW1hc3RlciA0NDMzMDAw
MC5pM2MtbWFzdGVyOiBFcnJvciBjb25kaXRpb246IE1TVEFUVVMgMHgwMjAwOTBjNywgTUVSUldB
Uk4gMHgwMDEwMDAwMAo+ID4gPiAKPiA+ID4gQklUIDIwOiBUSU1FT1VUIGVycm9yCj4gPiA+ICAg
VGhlIG1vZHVsZSBoYXMgc3RhbGxlZCB0b28gbG9uZyBpbiBhIGZyYW1lLiBUaGlzIGhhcHBlbnMg
d2hlbjoKPiA+ID4gICAtIFRoZSBUWCBGSUZPIG9yIFJYIEZJRk8gaXMgbm90IGhhbmRsZWQgYW5k
IHRoZSBidXMgaXMgc3R1Y2sgaW4gdGhlCj4gPiA+IG1pZGRsZSBvZiBhIG1lc3NhZ2UsCj4gPiA+
ICAgLSBObyBTVE9QIHdhcyBpc3N1ZWQgYW5kIGJldHdlZW4gbWVzc2FnZXMsCj4gPiA+ICAgLSBJ
QkkgbWFudWFsIGlzIHVzZWQgYW5kIG5vIGRlY2lzaW9uIHdhcyBtYWRlLiAgCj4gPiAKPiA+IEkg
YW0gc3RpbGwgbm90IGNvbnZpbmNlZCB0aGlzIHNob3VsZCBiZSBpZ25vcmVkIGluIGFsbCBjYXNl
cy4KPiA+IAo+ID4gQ2FzZSAxIGlzIGEgcHJvYmxlbSBiZWNhdXNlIHRoZSBoYXJkd2FyZSBmYWls
ZWQgc29tZWhvdy4gIAo+IAo+IEJ1dCBzbyBmYXIsIG5vIGFjdGlvbiB0byBoYW5kbGUgdGhpcyBj
YXNlIGluIGN1cnJlbnQgY29kZS4KClllcywgYnV0IGlmIHlvdSBkZXRlY3QgYW4gaXNzdWUgYW5k
IGlnbm9yZSBpdCwgaXQncyBub3QgYmV0dGVyIHRoYW4KcmVwb3J0aW5nIGl0IHdpdGhvdXQgaGFu
ZGxpbmcgaXQuIEluc3RlYWQgb2YgdG90YWxseSBpZ25vcmluZyB0aGlzIEkKd291bGQgYXQgbGVh
c3Qgd3JpdGUgYSBkZWJ1ZyBtZXNzYWdlIChpZGVudGljYWwgdG8gd2hhdCdzIGJlbG93KSBiZWZv
cmUKcmV0dXJuaW5nIGZhbHNlLCBldmVuIHRob3VnaCBJIGFtIG5vdCBjb252aW5jZWQgdW5jb25k
aXRpb25hbGx5CnJldHVybmluZyBmYWxzZSBoZXJlIGlzIHdpc2UuIElmIHlvdSBmYWlsIGEgaGFy
ZHdhcmUgc2VxdWVuY2UgYmVjYXVzZQp5b3UgYWRkZWQgYSBwcmludGssIGl0J3MgYSBwcm9ibGVt
LiBNYXliZSB5b3UgY29uc2lkZXIgdGhpcyBsaW5lIGFzCm5vaXNlLCBidXQgSSBiZWxpZXZlIGl0
J3Mgc3RpbGwgYW4gZXJyb3IgY29uZGl0aW9uLiBNYXliZSwgaG93ZXZlciwKdGhpcyBiaXQgZ2V0
cyBzZXQgYWZ0ZXIgdGhlIHdob2xlIHNlcXVlbmNlLCBhbmQgdGhpcyBpcyBqdXN0IGEgImJ1cwpp
cyBpZGxlIiBjb25kaXRpb24uIElmIHRoYXQncyB0aGUgY2FzZSwgdGhlbiB5b3UgbmVlZCBzb21l
CmFkZGl0aW9uYWwgaGV1cmlzdGljcyB0byBwcm9wZXJseSBpZ25vcmUgdGhlIGJpdD8KCj4gSW4g
c3ZjX2kzY19tYXN0ZXJfeGZlcigpIGhhdmUgbm90IGNoZWNrIHRoaXMgZmxhZ3MuIGFsc28gaGF2
ZSBub3QgZW5hYmxlCj4gRVJSV0FSTiBpcnEuCj4gCj4gSWYgd2UgbWV0IHRoaXMgY2FzZSwgd2Ug
Y2FuIGFkZCBuZXcgZnVuY3Rpb25zL2FyZ3VtZW50IHRvIGhhbmRsZSB0aGlzLgo+IFRoZW4gd2Ug
Y2FuIHJlYWwgZGVidWcgdGhlIGNvZGUgYW5kIHJlY292ZXIgYnVzLgo+IAo+IFdpdGhvdXQgdGhp
cyBwYXRjaCwgc2ltcGxlc3QgYWRkIHNvbWUgZGVidWcgbWVzc2FnZSBiZWZvcmUgaXNzdWUKPiBT
VkNfSTNDX01DVFJMX1JFUVVFU1RfQVVUT19JQkksIFRJTUVPVVQgd2lsbCBiZSBzZXQuCgpZZXMs
IGFuZCBzb21ldGltZXMgaXQgd29uJ3QgYmUgYW4gaXNzdWUsIGJ1dCBzb21ldGltZXMgaXQgbWF5
LiBNYXliZSB3ZQpjYW4gZmluZCBtb3JlIGFkdmFuY2VkIGhldXJpc3RpY3MgdGhlcmUuCgo+IEFu
ZCBzdmNfaTNjX21hc3Rlcl9lcnJvcigpIHdhcyBvbmx5IGNhbGxlZCBieSBzdmNfaTNjX21hc3Rl
cl9pYmlfd29yaygpLgo+Cj4gU28gSSBjYW4gdGhpbmsgb25seSBjYXNlIDMgaGFwcGVuIGluIHN2
Y19pM2NfbWFzdGVyX2liaV93b3JrKCkuCgpDYXNlIDMgY2Fubm90IGJlIGhhbmRsZWQgYnkgTGlu
dXggKGJlY2F1c2Ugb2YgdGhlIG5hdHVyYWwgbGF0ZW5jeSBvZgp0aGUgT1MpLgoKPiAKPiBGcmFu
awo+IAo+ID4gQ2FzZSAyIGlzIGZpbmUgSSBndWVzcy4KPiA+IENhc2UgMyBpcyBub3QgcG9zc2li
bGUgaW4gTGludXgsIHRoaXMgd2lsbCBub3QgYmUgc3VwcG9ydGVkLgo+ID4gICAKPiA+ID4gICBU
aGUgbWF4aW11bSBzdGFsbCBwZXJpb2QgaXMgMTAgS0h6IG9yIDEwMCDOvHMuICAKPiA+IAo+ID4g
cy8xMCBLSHovLwo+ID4gICAKPiA+ID4gCj4gPiA+IFRoaXMgaXMgYSBqdXN0IHdhcm5pbmcuIFN5
c3RlbSBpcnEgdGhyZWFkIHNjaGVkdWxlIGxhdGVuY3kgaXMgcG9zc2libGUKPiA+ID4gYmlnZ2Vy
IHRoYW4gMTAwdXMuIEp1c3Qgb21pdCB0aGlzIHdhcmluZy4gIAo+ID4gCj4gPiBUaGlzIGNhbiBi
ZSBjb25zaWRlcmVkIGFzIGJlaW5nIGp1c3QgYSB3YXJuaW5nIGFzIHRoZSBzeXN0ZW0gSVJRCj4g
PiBsYXRlbmN5IGNhbiBlYXNpbHkgYmUgZ3JlYXRlciB0aGFuIDEwMHVzLgoKVGhpcyB3YXMgc2tp
cHBlZCBpbiB5b3VyIHYzLgoKPiA+ID4gRml4ZXM6IGRkM2M1Mjg0NmQ1OSAoImkzYzogbWFzdGVy
OiBzdmM6IEFkZCBTaWx2YWNvIEkzQyBtYXN0ZXIgZHJpdmVyIikKPiA+ID4gQ2M6IHN0YWJsZUB2
Z2VyLmtlcm5lbC5vcmcKPiA+ID4gU2lnbmVkLW9mZi1ieTogRnJhbmsgTGkgPEZyYW5rLkxpQG54
cC5jb20+Cj4gPiA+IC0tLQoKVGhhbmtzLApNaXF1w6hsCgotLSAKbGludXgtaTNjIG1haWxpbmcg
bGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
