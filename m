Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50CA1CDB474
	for <linux-i3c@archiver.kernel.org>; Fri, 20 Oct 2023 17:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HVDR+yzyw1DitKJSnCZWcARwihFXnutUeyUIY6XSVB8=; b=pmF87CpVqqWu04
	9e0ATttIER04KL/pUiVIj7rZu3G6N442dfZaBBAGE1B783cSx+HkWfwdrujW2gp7JtfhhAN31hXU9
	Jod/frr93vC0Hly2F+hOpEvwIk4kr3zPzPvSX32cLWJrIVdDVbOMtfB6059EUccp8mX9bSa4PXe4l
	cvf0EeScq15LQshipJOQDkFzDImuXS2w+izJ5EIS1AErlTh9gWrPAHSB12mTwby+hybSj66VVpqpU
	10NKy54SP9GlLF0nHtgmYU4wDT41CUgh0W6lCALy3M1MFXl6dwYaSmP/SwMUq+R3REKDOt+VrVuX/
	082e+fjEHK4zRcZFzblw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtsua-002jof-1s;
	Fri, 20 Oct 2023 17:03:48 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtsuX-002jnQ-0H
	for linux-i3c@lists.infradead.org;
	Fri, 20 Oct 2023 17:03:47 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D944140004;
	Fri, 20 Oct 2023 17:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697821419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u12+nGJMZaiiMrsLReza/Q7S146dX0nFCHWkZWl7fl8=;
	b=mRGEZ679UgWRTeS2PIjJA3JrloelBLoGHV9z9nnlkmDGo3YptdekMKV1Phky5wNcL03S7R
	veNDpBQFol+O0UVac2q/6gOHw0UY2aJNumoLkCCqCTu20U0lX8uwDtyn6Blfpf1XZer2fB
	pIp0t8mlgbeQPPD03qsRxmyBZZKU+VYnb4Yid15Kybt5fKwY1/wufAp0EXpJYln9wwACZW
	PO7AYS9xWP6YfMeuvJweacgPDX3AOSs/a1xL48vYWtB3RQiaCkqc/rWQflEW3NGcCkJJeg
	8tibZYj6Al4nN1O0cFiZq/DNPBCesGLz1MAngbuF9Io2YUjbZ305LFulibhjNQ==
Date: Fri, 20 Oct 2023 19:03:37 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.li@nxp.com>
Cc: alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
 imx@lists.linux.dev, joe@perches.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 Resent 6/6] i3c: master: svc: fix random hot join
 failure since timeout errory
Message-ID: <20231020190337.13ef5638@xps-13>
In-Reply-To: <ZTKhJOAAz4CaupEf@lizhi-Precision-Tower-5810>
References: <20231018155926.3305476-1-Frank.Li@nxp.com>
	<20231018155926.3305476-7-Frank.Li@nxp.com>
	<20231019084452.11fd0645@xps-13>
	<ZTFNvrsSoHOS3P2g@lizhi-Precision-Tower-5810>
	<20231020160645.67e678ee@xps-13>
	<ZTKMTwU6cVAfGCKG@lizhi-Precision-Tower-5810>
	<20231020163525.66485920@xps-13>
	<ZTKTGG7J55Sj19Nd@lizhi-Precision-Tower-5810>
	<20231020172006.5de0998b@xps-13>
	<ZTKhJOAAz4CaupEf@lizhi-Precision-Tower-5810>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_100345_610147_3CC7CA7C 
X-CRM114-Status: GOOD (  36.90  )
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
NDc6NDggLTA0MDA6Cgo+IE9uIEZyaSwgT2N0IDIwLCAyMDIzIGF0IDA1OjIwOjA2UE0gKzAyMDAs
IE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBIaSBGcmFuaywKPiA+IAo+ID4gRnJhbmsubGlAbnhw
LmNvbSB3cm90ZSBvbiBGcmksIDIwIE9jdCAyMDIzIDEwOjQ3OjUyIC0wNDAwOgo+ID4gICAKPiA+
ID4gT24gRnJpLCBPY3QgMjAsIDIwMjMgYXQgMDQ6MzU6MjVQTSArMDIwMCwgTWlxdWVsIFJheW5h
bCB3cm90ZTogIAo+ID4gPiA+IEhpIEZyYW5rLAo+ID4gPiA+IAo+ID4gPiA+IEZyYW5rLmxpQG54
cC5jb20gd3JvdGUgb24gRnJpLCAyMCBPY3QgMjAyMyAxMDoxODo1NSAtMDQwMDoKPiA+ID4gPiAg
ICAgCj4gPiA+ID4gPiBPbiBGcmksIE9jdCAyMCwgMjAyMyBhdCAwNDowNjo0NVBNICswMjAwLCBN
aXF1ZWwgUmF5bmFsIHdyb3RlOiAgICAKPiA+ID4gPiA+ID4gSGkgRnJhbmssCj4gPiA+ID4gPiA+
IAo+ID4gPiA+ID4gPiBGcmFuay5saUBueHAuY29tIHdyb3RlIG9uIFRodSwgMTkgT2N0IDIwMjMg
MTE6Mzk6NDIgLTA0MDA6Cj4gPiA+ID4gPiA+ICAgICAgIAo+ID4gPiA+ID4gPiA+IE9uIFRodSwg
T2N0IDE5LCAyMDIzIGF0IDA4OjQ0OjUyQU0gKzAyMDAsIE1pcXVlbCBSYXluYWwgd3JvdGU6ICAg
ICAgCj4gPiA+ID4gPiA+ID4gPiBIaSBGcmFuaywKPiA+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4g
PiA+ID4gRnJhbmsuTGlAbnhwLmNvbSB3cm90ZSBvbiBXZWQsIDE4IE9jdCAyMDIzIDExOjU5OjI2
IC0wNDAwOgo+ID4gPiA+ID4gPiA+ID4gICAgICAgICAKPiA+ID4gPiA+ID4gPiA+ID4gbWFzdGVy
IHNpZGUgcmVwb3J0Ogo+ID4gPiA+ID4gPiA+ID4gPiAgIHNpbHZhY28taTNjLW1hc3RlciA0NDMz
MDAwMC5pM2MtbWFzdGVyOiBFcnJvciBjb25kaXRpb246IE1TVEFUVVMgMHgwMjAwOTBjNywgTUVS
UldBUk4gMHgwMDEwMDAwMAo+ID4gPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+ID4gQklU
IDIwOiBUSU1FT1VUIGVycm9yCj4gPiA+ID4gPiA+ID4gPiA+ICAgVGhlIG1vZHVsZSBoYXMgc3Rh
bGxlZCB0b28gbG9uZyBpbiBhIGZyYW1lLiBUaGlzIGhhcHBlbnMgd2hlbjoKPiA+ID4gPiA+ID4g
PiA+ID4gICAtIFRoZSBUWCBGSUZPIG9yIFJYIEZJRk8gaXMgbm90IGhhbmRsZWQgYW5kIHRoZSBi
dXMgaXMgc3R1Y2sgaW4gdGhlCj4gPiA+ID4gPiA+ID4gPiA+IG1pZGRsZSBvZiBhIG1lc3NhZ2Us
Cj4gPiA+ID4gPiA+ID4gPiA+ICAgLSBObyBTVE9QIHdhcyBpc3N1ZWQgYW5kIGJldHdlZW4gbWVz
c2FnZXMsCj4gPiA+ID4gPiA+ID4gPiA+ICAgLSBJQkkgbWFudWFsIGlzIHVzZWQgYW5kIG5vIGRl
Y2lzaW9uIHdhcyBtYWRlLiAgICAgICAgCj4gPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+
IEkgYW0gc3RpbGwgbm90IGNvbnZpbmNlZCB0aGlzIHNob3VsZCBiZSBpZ25vcmVkIGluIGFsbCBj
YXNlcy4KPiA+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+ID4gQ2FzZSAxIGlzIGEgcHJvYmxl
bSBiZWNhdXNlIHRoZSBoYXJkd2FyZSBmYWlsZWQgc29tZWhvdy4gICAgICAgIAo+ID4gPiA+ID4g
PiA+IAo+ID4gPiA+ID4gPiA+IEJ1dCBzbyBmYXIsIG5vIGFjdGlvbiB0byBoYW5kbGUgdGhpcyBj
YXNlIGluIGN1cnJlbnQgY29kZS4gICAgICAKPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IFllcywg
YnV0IGlmIHlvdSBkZXRlY3QgYW4gaXNzdWUgYW5kIGlnbm9yZSBpdCwgaXQncyBub3QgYmV0dGVy
IHRoYW4KPiA+ID4gPiA+ID4gcmVwb3J0aW5nIGl0IHdpdGhvdXQgaGFuZGxpbmcgaXQuIEluc3Rl
YWQgb2YgdG90YWxseSBpZ25vcmluZyB0aGlzIEkKPiA+ID4gPiA+ID4gd291bGQgYXQgbGVhc3Qg
d3JpdGUgYSBkZWJ1ZyBtZXNzYWdlIChpZGVudGljYWwgdG8gd2hhdCdzIGJlbG93KSBiZWZvcmUK
PiA+ID4gPiA+ID4gcmV0dXJuaW5nIGZhbHNlLCBldmVuIHRob3VnaCBJIGFtIG5vdCBjb252aW5j
ZWQgdW5jb25kaXRpb25hbGx5Cj4gPiA+ID4gPiA+IHJldHVybmluZyBmYWxzZSBoZXJlIGlzIHdp
c2UuIElmIHlvdSBmYWlsIGEgaGFyZHdhcmUgc2VxdWVuY2UgYmVjYXVzZQo+ID4gPiA+ID4gPiB5
b3UgYWRkZWQgYSBwcmludGssIGl0J3MgYSBwcm9ibGVtLiBNYXliZSB5b3UgY29uc2lkZXIgdGhp
cyBsaW5lIGFzCj4gPiA+ID4gPiA+IG5vaXNlLCBidXQgSSBiZWxpZXZlIGl0J3Mgc3RpbGwgYW4g
ZXJyb3IgY29uZGl0aW9uLiBNYXliZSwgaG93ZXZlciwKPiA+ID4gPiA+ID4gdGhpcyBiaXQgZ2V0
cyBzZXQgYWZ0ZXIgdGhlIHdob2xlIHNlcXVlbmNlLCBhbmQgdGhpcyBpcyBqdXN0IGEgImJ1cwo+
ID4gPiA+ID4gPiBpcyBpZGxlIiBjb25kaXRpb24uIElmIHRoYXQncyB0aGUgY2FzZSwgdGhlbiB5
b3UgbmVlZCBzb21lCj4gPiA+ID4gPiA+IGFkZGl0aW9uYWwgaGV1cmlzdGljcyB0byBwcm9wZXJs
eSBpZ25vcmUgdGhlIGJpdD8KPiA+ID4gPiA+ID4gICAgICAgCj4gPiA+ID4gPiAKPiA+ID4gPiA+
ICAgICAgICAgICAgICAgICBkZXZfZXJyKG1hc3Rlci0+ZGV2LCAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIAo+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgIkVy
cm9yIGNvbmRpdGlvbjogTVNUQVRVUyAweCUwOHgsIE1FUlJXQVJOIDB4JTA4eFxuIiwKPiA+ID4g
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgIG1zdGF0dXMsIG1lcnJ3YXJuKTsKPiA+ID4gPiA+
ICsKPiA+ID4gPiA+ICsJCS8qIGlnbm9yZSB0aW1lb3V0IGVycm9yICovCj4gPiA+ID4gPiArCQlp
ZiAobWVycndhcm4gJiBTVkNfSTNDX01FUlJXQVJOX1RJTUVPVVQpCj4gPiA+ID4gPiArCQkJcmV0
dXJuIGZhbHNlOwo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gCj4gPiA+ID4gPiBJcyBpdCBva2F5IG1v
dmUgU1ZDX0kzQ19NRVJSV0FSTl9USU1FT1VUIGFmdGVyIGRldl9lcnI/ICAgIAo+ID4gPiA+IAo+
ID4gPiA+IEkgdGhpbmsgeW91IG1lbnRpb25lZCBlYXJsaWVyIHRoYXQgdGhlIHByb2JsZW0gd2Fz
IG5vdCB0aGUgcHJpbnRrIGJ1dAo+ID4gPiA+IHRoZSByZXR1cm4gdmFsdWUuIFNvIHBlcmhhcHMg
dGhlcmUgaXMgYSB3YXkgdG8ga25vdyBpZiB0aGUgdGltZW91dAo+ID4gPiA+IGhhcHBlbmVkIGFm
dGVyIGEgdHJhbnNhY3Rpb24gYW5kIHdhcyBsZWdpdGltYXRlIG9yIG5vdD8gICAgCj4gPiA+IAo+
ID4gPiBFcnJvciBtZXNzYWdlIGp1c3QgYW5ub2lzZSB1c2VyLCBkb24ndCBpbXBhY3QgZnVuY3Rp
b24uIEJ1dCByZXR1cm4gZmFsc2UKPiA+ID4gbGV0IElCSSB0aHJlYWQgcnVubmluZyB0byBhdm9p
ZCBkZWFkIGxvY2suIAo+ID4gPiAgIAo+ID4gPiA+IAo+ID4gPiA+IEluIGFueSBjYXNlIHdlIHNo
b3VsZCBwcm9iYWJseSBsb3dlciB0aGUgbG9nIGxldmVsIGZvciB0aGlzIGVycm9yLiAgICAKPiA+
ID4gCj4gPiA+IE9ubHkgU1ZDX0kzQ19NRVJSV0FSTl9USU1FT1VUIGlzIHdhcm5pbmcKPiA+ID4g
Cj4gPiA+IE1heWJlIGJlbG93IGxvZ2ljIGlzIGJldHRlcgo+ID4gPiAKPiA+ID4gCWlmIChtZXJy
d2FybiAmIFNWQ19JM0NfTUVSUldBUk5fVElNRU9VVCkgewo+ID4gPiAJCWRldl9kYmcobWFzdGVy
LT5kZXYsIAo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAiRXJyb3IgY29uZGl0aW9uOiBN
U1RBVFVTIDB4JTA4eCwgTUVSUldBUk4gMHglMDh4XG4iLAo+ID4gPiAJCQltc3RhdHVzLCBtZXJy
d2Fybik7Cj4gPiA+IAkJcmV0dXJuIGZhbHNlOwo+ID4gPiAJfSAKPiA+ID4gCQo+ID4gPiAJZGV2
X2VycihtYXN0ZXItPmRldiwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCj4g
PiA+ICAgICAgICAgICAgICAgICAiRXJyb3IgY29uZGl0aW9uOiBNU1RBVFVTIDB4JTA4eCwgTUVS
UldBUk4gMHglMDh4XG4iLAo+ID4gPiAgICAgICAgICAgICAgICAgIG1zdGF0dXMsIG1lcnJ3YXJu
KTsgCj4gPiA+IAkuLi4uCj4gPiA+ICAgCj4gPiAKPiA+IFllcywgdGhpcyBsb29rcyBiZXR0ZXIg
YnV0IEkgd29uZGVyIGlmIHdlIHNob3VsZCBhZGQgYW4gYWRkaXRpb25hbAo+ID4gY29uZGl0aW9u
IHRvIGp1c3QgcmV0dXJuIGZhbHNlIGluIHRoaXMgY2FzZTsgICAKPiAKPiBXaGF0J3MgYWRkaXRp
b25hbCBjb25kaXRpb24gd2UgY2FuIGNoZWNrPwoKV2VsbCwgeW91J3JlIHRoZSBvbmUgYm90aGVy
ZWQgd2l0aCBhbiBlcnJvciBjYXNlIHdoaWNoIGlzIG5vdCBhIHJlYWwKZXJyb3IuIFlvdSdyZSBz
YXlpbmcgInRoaXMgZXJyb3IgaXMgbmV2ZXIgYSBwcm9ibGVtIiBhbmQgSSBhbSBzYXlpbmcKdGhh
dCBJIGJlbGlldmUgaXQgaXMgbm90IGEgcHJvYmxlbSBpcyB5b3VyIHBhcnRpY3VsYXIgY2FzZSwg
YnV0IGluCmdlbmVyYWwgdGhlcmUgbWlnaHQgYmUgc2l0dWF0aW9ucyB3aGVyZSBpdCAqaXMqIGEg
cHJvYmxlbS4gU28geW91IG5lZWQKdG8gZmluZCBwcm9wZXIgY29uZGl0aW9ucyB0byBjaGVjayBh
Z2FpbnN0IGluIG9yZGVyIHRvIGRldGVybWluZQp3aGV0aGVyIHRoaXMgaXMganVzdCBhbiBpbmZv
IHdpdGggbm8gY29uc2VxdWVuY2Ugb3IgYW4gZXJyb3IuCgo+ID4gc29tZXRoaW5nIHNheWluZyAi
dGhpcwo+ID4gdGltZW91dCBpcyBsZWdpdGltYXRlIGFuZCBoYXMgbm8gaW1wYWN0Ii4gIAo+IAo+
IEFkZCBjb21tZW50cyAidGhpcyB0aW1lb3V0IGlzIGxlZ2l0aW1hdGUgYW5kIGhhcyBubyBpbXBh
Y3QiIG9yIGRldl9kYmcKPiBwcmludCB0aGF0PwoKTm8gSSdtIHRhbGtpbmcgYWJvdXQgdGhlIGFk
ZGl0aW9uYWwgaGV1cmlzdGljcy4KClRoYW5rcywKTWlxdcOobAoKLS0gCmxpbnV4LWkzYyBtYWls
aW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
