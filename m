Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71760CDB474
	for <linux-i3c@archiver.kernel.org>; Fri, 20 Oct 2023 15:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TGczUz8bmasVLrZSAHFiumNIS7t0W6yepbjbiz17Kr0=; b=wfWO3wwczTS2Hb
	zyGFfIZYPFl86r1jwJDcDCn1iyyaBTRSb1nmRpC5BkgQ7ZM8r/rgMMYP7drl4Yq+dHxfquXQjDw/T
	OwFloMrB+8XqdJ4WhFijjRaM7vh/hkxK88kFnwiuY2jwBwmivBeAVcKyBrAe+yJkwOvg/LwC3Fw8l
	TZDhMqLDOr8M100x3jTVadToWTkLIcZ1wxl27oVRpvt61Y3hJ3A+6874KeevCN55dIAxfBiAJdyPQ
	3dqg5Z9clnOl3/oGfJXMPQSPpR7sN+S7t96E/ndZnIYX9UoatubnHDCQq+XEZBljsAFDzHOvaTGhZ
	c8prBhUxL8T84VYmeh2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtrIN-002ati-0c;
	Fri, 20 Oct 2023 15:20:15 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtrIK-002atF-02
	for linux-i3c@lists.infradead.org;
	Fri, 20 Oct 2023 15:20:14 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8A0F0E0009;
	Fri, 20 Oct 2023 15:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697815207;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oaHjuPcslWN24KOkrEWK0l5r712keu9E2N1sB5NoPOs=;
	b=Fe+FfZGaDRfcO7OxSpnI7HBHq7pQthX5q1wmELp/2TZ6CBB/BSEsazaWzWmcdM+MsLXzbb
	tpnZ6nvC76Bz/OIBqfIaIfRJd8qI1EE+dx2Kk5mY9KZ9qpBoWbNQzSoTuXIFPfjp3DiUJp
	r1VMfnXib18izsQDF4BpRubDCSQYlDe9WiUdZ2r0/gbpHt8g8SbGtdy8o4RuNvtsMgpTq5
	373/zLtnSo+Caz8d3a+Yx058Mf59Lj7KVWms57EglSS1+nBkvqL5nE7cnEL4kWFhMOHOav
	wVsfU1yaDInUxUJYJ2vR3lZVX5ZlAGBHzCPihp906pKce+SidNAM/DLo3ysA1g==
Date: Fri, 20 Oct 2023 17:20:06 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.li@nxp.com>
Cc: alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
 imx@lists.linux.dev, joe@perches.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 Resent 6/6] i3c: master: svc: fix random hot join
 failure since timeout error
Message-ID: <20231020172006.5de0998b@xps-13>
In-Reply-To: <ZTKTGG7J55Sj19Nd@lizhi-Precision-Tower-5810>
References: <20231018155926.3305476-1-Frank.Li@nxp.com>
	<20231018155926.3305476-7-Frank.Li@nxp.com>
	<20231019084452.11fd0645@xps-13>
	<ZTFNvrsSoHOS3P2g@lizhi-Precision-Tower-5810>
	<20231020160645.67e678ee@xps-13>
	<ZTKMTwU6cVAfGCKG@lizhi-Precision-Tower-5810>
	<20231020163525.66485920@xps-13>
	<ZTKTGG7J55Sj19Nd@lizhi-Precision-Tower-5810>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_082012_333545_E5EFB696 
X-CRM114-Status: GOOD (  33.41  )
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
NDc6NTIgLTA0MDA6Cgo+IE9uIEZyaSwgT2N0IDIwLCAyMDIzIGF0IDA0OjM1OjI1UE0gKzAyMDAs
IE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBIaSBGcmFuaywKPiA+IAo+ID4gRnJhbmsubGlAbnhw
LmNvbSB3cm90ZSBvbiBGcmksIDIwIE9jdCAyMDIzIDEwOjE4OjU1IC0wNDAwOgo+ID4gICAKPiA+
ID4gT24gRnJpLCBPY3QgMjAsIDIwMjMgYXQgMDQ6MDY6NDVQTSArMDIwMCwgTWlxdWVsIFJheW5h
bCB3cm90ZTogIAo+ID4gPiA+IEhpIEZyYW5rLAo+ID4gPiA+IAo+ID4gPiA+IEZyYW5rLmxpQG54
cC5jb20gd3JvdGUgb24gVGh1LCAxOSBPY3QgMjAyMyAxMTozOTo0MiAtMDQwMDoKPiA+ID4gPiAg
ICAgCj4gPiA+ID4gPiBPbiBUaHUsIE9jdCAxOSwgMjAyMyBhdCAwODo0NDo1MkFNICswMjAwLCBN
aXF1ZWwgUmF5bmFsIHdyb3RlOiAgICAKPiA+ID4gPiA+ID4gSGkgRnJhbmssCj4gPiA+ID4gPiA+
IAo+ID4gPiA+ID4gPiBGcmFuay5MaUBueHAuY29tIHdyb3RlIG9uIFdlZCwgMTggT2N0IDIwMjMg
MTE6NTk6MjYgLTA0MDA6Cj4gPiA+ID4gPiA+ICAgICAgIAo+ID4gPiA+ID4gPiA+IG1hc3RlciBz
aWRlIHJlcG9ydDoKPiA+ID4gPiA+ID4gPiAgIHNpbHZhY28taTNjLW1hc3RlciA0NDMzMDAwMC5p
M2MtbWFzdGVyOiBFcnJvciBjb25kaXRpb246IE1TVEFUVVMgMHgwMjAwOTBjNywgTUVSUldBUk4g
MHgwMDEwMDAwMAo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IEJJVCAyMDogVElNRU9VVCBl
cnJvcgo+ID4gPiA+ID4gPiA+ICAgVGhlIG1vZHVsZSBoYXMgc3RhbGxlZCB0b28gbG9uZyBpbiBh
IGZyYW1lLiBUaGlzIGhhcHBlbnMgd2hlbjoKPiA+ID4gPiA+ID4gPiAgIC0gVGhlIFRYIEZJRk8g
b3IgUlggRklGTyBpcyBub3QgaGFuZGxlZCBhbmQgdGhlIGJ1cyBpcyBzdHVjayBpbiB0aGUKPiA+
ID4gPiA+ID4gPiBtaWRkbGUgb2YgYSBtZXNzYWdlLAo+ID4gPiA+ID4gPiA+ICAgLSBObyBTVE9Q
IHdhcyBpc3N1ZWQgYW5kIGJldHdlZW4gbWVzc2FnZXMsCj4gPiA+ID4gPiA+ID4gICAtIElCSSBt
YW51YWwgaXMgdXNlZCBhbmQgbm8gZGVjaXNpb24gd2FzIG1hZGUuICAgICAgCj4gPiA+ID4gPiA+
IAo+ID4gPiA+ID4gPiBJIGFtIHN0aWxsIG5vdCBjb252aW5jZWQgdGhpcyBzaG91bGQgYmUgaWdu
b3JlZCBpbiBhbGwgY2FzZXMuCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBDYXNlIDEgaXMgYSBw
cm9ibGVtIGJlY2F1c2UgdGhlIGhhcmR3YXJlIGZhaWxlZCBzb21laG93LiAgICAgIAo+ID4gPiA+
ID4gCj4gPiA+ID4gPiBCdXQgc28gZmFyLCBubyBhY3Rpb24gdG8gaGFuZGxlIHRoaXMgY2FzZSBp
biBjdXJyZW50IGNvZGUuICAgIAo+ID4gPiA+IAo+ID4gPiA+IFllcywgYnV0IGlmIHlvdSBkZXRl
Y3QgYW4gaXNzdWUgYW5kIGlnbm9yZSBpdCwgaXQncyBub3QgYmV0dGVyIHRoYW4KPiA+ID4gPiBy
ZXBvcnRpbmcgaXQgd2l0aG91dCBoYW5kbGluZyBpdC4gSW5zdGVhZCBvZiB0b3RhbGx5IGlnbm9y
aW5nIHRoaXMgSQo+ID4gPiA+IHdvdWxkIGF0IGxlYXN0IHdyaXRlIGEgZGVidWcgbWVzc2FnZSAo
aWRlbnRpY2FsIHRvIHdoYXQncyBiZWxvdykgYmVmb3JlCj4gPiA+ID4gcmV0dXJuaW5nIGZhbHNl
LCBldmVuIHRob3VnaCBJIGFtIG5vdCBjb252aW5jZWQgdW5jb25kaXRpb25hbGx5Cj4gPiA+ID4g
cmV0dXJuaW5nIGZhbHNlIGhlcmUgaXMgd2lzZS4gSWYgeW91IGZhaWwgYSBoYXJkd2FyZSBzZXF1
ZW5jZSBiZWNhdXNlCj4gPiA+ID4geW91IGFkZGVkIGEgcHJpbnRrLCBpdCdzIGEgcHJvYmxlbS4g
TWF5YmUgeW91IGNvbnNpZGVyIHRoaXMgbGluZSBhcwo+ID4gPiA+IG5vaXNlLCBidXQgSSBiZWxp
ZXZlIGl0J3Mgc3RpbGwgYW4gZXJyb3IgY29uZGl0aW9uLiBNYXliZSwgaG93ZXZlciwKPiA+ID4g
PiB0aGlzIGJpdCBnZXRzIHNldCBhZnRlciB0aGUgd2hvbGUgc2VxdWVuY2UsIGFuZCB0aGlzIGlz
IGp1c3QgYSAiYnVzCj4gPiA+ID4gaXMgaWRsZSIgY29uZGl0aW9uLiBJZiB0aGF0J3MgdGhlIGNh
c2UsIHRoZW4geW91IG5lZWQgc29tZQo+ID4gPiA+IGFkZGl0aW9uYWwgaGV1cmlzdGljcyB0byBw
cm9wZXJseSBpZ25vcmUgdGhlIGJpdD8KPiA+ID4gPiAgICAgCj4gPiA+IAo+ID4gPiAgICAgICAg
ICAgICAgICAgZGV2X2VycihtYXN0ZXItPmRldiwgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgIkVycm9yIGNvbmRpdGlv
bjogTVNUQVRVUyAweCUwOHgsIE1FUlJXQVJOIDB4JTA4eFxuIiwKPiA+ID4gICAgICAgICAgICAg
ICAgICAgICAgICAgbXN0YXR1cywgbWVycndhcm4pOwo+ID4gPiArCj4gPiA+ICsJCS8qIGlnbm9y
ZSB0aW1lb3V0IGVycm9yICovCj4gPiA+ICsJCWlmIChtZXJyd2FybiAmIFNWQ19JM0NfTUVSUldB
Uk5fVElNRU9VVCkKPiA+ID4gKwkJCXJldHVybiBmYWxzZTsKPiA+ID4gKwo+ID4gPiAKPiA+ID4g
SXMgaXQgb2theSBtb3ZlIFNWQ19JM0NfTUVSUldBUk5fVElNRU9VVCBhZnRlciBkZXZfZXJyPyAg
Cj4gPiAKPiA+IEkgdGhpbmsgeW91IG1lbnRpb25lZCBlYXJsaWVyIHRoYXQgdGhlIHByb2JsZW0g
d2FzIG5vdCB0aGUgcHJpbnRrIGJ1dAo+ID4gdGhlIHJldHVybiB2YWx1ZS4gU28gcGVyaGFwcyB0
aGVyZSBpcyBhIHdheSB0byBrbm93IGlmIHRoZSB0aW1lb3V0Cj4gPiBoYXBwZW5lZCBhZnRlciBh
IHRyYW5zYWN0aW9uIGFuZCB3YXMgbGVnaXRpbWF0ZSBvciBub3Q/ICAKPiAKPiBFcnJvciBtZXNz
YWdlIGp1c3QgYW5ub2lzZSB1c2VyLCBkb24ndCBpbXBhY3QgZnVuY3Rpb24uIEJ1dCByZXR1cm4g
ZmFsc2UKPiBsZXQgSUJJIHRocmVhZCBydW5uaW5nIHRvIGF2b2lkIGRlYWQgbG9jay4gCj4gCj4g
PiAKPiA+IEluIGFueSBjYXNlIHdlIHNob3VsZCBwcm9iYWJseSBsb3dlciB0aGUgbG9nIGxldmVs
IGZvciB0aGlzIGVycm9yLiAgCj4gCj4gT25seSBTVkNfSTNDX01FUlJXQVJOX1RJTUVPVVQgaXMg
d2FybmluZwo+IAo+IE1heWJlIGJlbG93IGxvZ2ljIGlzIGJldHRlcgo+IAo+IAlpZiAobWVycndh
cm4gJiBTVkNfSTNDX01FUlJXQVJOX1RJTUVPVVQpIHsKPiAJCWRldl9kYmcobWFzdGVyLT5kZXYs
IAo+ICAgICAgICAgICAgICAgICAgICAgICAgICJFcnJvciBjb25kaXRpb246IE1TVEFUVVMgMHgl
MDh4LCBNRVJSV0FSTiAweCUwOHhcbiIsCj4gCQkJbXN0YXR1cywgbWVycndhcm4pOwo+IAkJcmV0
dXJuIGZhbHNlOwo+IAl9IAo+IAkKPiAJZGV2X2VycihtYXN0ZXItPmRldiwgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgCj4gICAgICAgICAgICAgICAgICJFcnJvciBjb25kaXRp
b246IE1TVEFUVVMgMHglMDh4LCBNRVJSV0FSTiAweCUwOHhcbiIsCj4gICAgICAgICAgICAgICAg
ICBtc3RhdHVzLCBtZXJyd2Fybik7IAo+IAkuLi4uCj4gCgpZZXMsIHRoaXMgbG9va3MgYmV0dGVy
IGJ1dCBJIHdvbmRlciBpZiB3ZSBzaG91bGQgYWRkIGFuIGFkZGl0aW9uYWwKY29uZGl0aW9uIHRv
IGp1c3QgcmV0dXJuIGZhbHNlIGluIHRoaXMgY2FzZTsgc29tZXRoaW5nIHNheWluZyAidGhpcwp0
aW1lb3V0IGlzIGxlZ2l0aW1hdGUgYW5kIGhhcyBubyBpbXBhY3QiLgoKVGhhbmtzLApNaXF1w6hs
CgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
