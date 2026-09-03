Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A9CDC61DD3
	for <linux-i3c@archiver.kernel.org>; Thu,  3 Sep 2026 06:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p9zbuvOVeHnqPp6ZM4eU0r5lqYBQSu5Cg62u8QXQgXY=; b=E28sa+OluCQEHe
	pMdjQVyOabW/Ddid9+MWC851ZNVaP+8/O3zaxpd48ibJG9NQet8TMFBzxUDoM8LjktI6Q+QSTjfkg
	SxCIEuxwmIO2wiLiC3ourKrVs1+iamz98fLOX9OFzKTSqhEYy6HrsDZYtmWn3A9LdJPvEonFkM0pT
	sAkTTnwwd8fmGyiGhquapJM1gBtaFn1Tg7RcXF1lXo9FBTO6OcFqy/QcN4N+18FDYksYtdcYw5rjN
	2OUYWvlIHNLDJOGyPIX5AFttUcn8ehiC/CxsiIo2wtWfyHOx+yMOamck9hc8XPbnqJani5fRfOBfi
	QFv2ZlVU7KUixxy5rd/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x218p-0000000GVMN-1Noj;
	Thu, 03 Sep 2026 06:41:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x218n-0000000GVMH-47aj
	for linux-i3c@lists.infradead.org;
	Thu, 03 Sep 2026 06:41:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 368B543C9D;
	Thu,  3 Sep 2026 06:41:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A89161F000E9;
	Thu,  3 Sep 2026 06:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788417701;
	bh=f0fkFWfgIQKwFTf22poqIfizIFr1Wu4c/nzEgFL4MVw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mCuDJlzko6+0tBgX4Yw/Nw/2fAiaIrqIuesjQ9PW86JnrJzsCfLXrBFczU4aDK9kp
	 mo47FmYFaOlNYxld+UensRVSIoKd8/9/VEYQMy1kBdfNaM+/Y95RvqtAlONIc/y4ol
	 RfRp5XUm2cke6ExMVTgzUWU40rZZEfzQI+G2z5zcYCdeUw1IVyn7YW6FopTICFcuwo
	 h7QctjuLTHen3wsxN0WFXRhgKCyGKbLuByWhSyRb09BsNbCz5pnNHR+xRa1hRRnMub
	 NX9mmqO+0WsdurnOd2hMfVtE4Ro7ZPAXnQ940jijyRZea1CGgQajsnR3SoCR1rj3OC
	 aheDTw6fRrF+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 8/8] i3c: hub: p3h2x4x: Add SMBus slave mode support
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: devicetree@vger.kernel.org, Frank.Li@kernel.org, robh@kernel.org, linux-i3c@lists.infradead.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, conor+dt@kernel.org
In-Reply-To: <20260903062108.2712296-9-lakshay.piplani@nxp.com>
References: <20260903062108.2712296-1-lakshay.piplani@nxp.com>
 <20260903062108.2712296-9-lakshay.piplani@nxp.com>
Date: Thu, 03 Sep 2026 06:41:40 +0000
Message-Id: <20260903064140.A89161F000E9@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIFcxQyByYWNlIGNvbmRp
dGlvbiBkdXJpbmcgU01CdXMgb3ZlcmZsb3cgaGFuZGxpbmcgY2F1c2VzIGRyb3BwZWQgcGFja2V0
cyBkdWUgdG8gdW5pbnRlbmRlZCBjbGVhcmluZyBvZiBidWZmZXIgcmVjZWl2ZSBmbGFncy4KLS0K
CmNvbW1pdCBlNGNjNDM2ODIzYjQ3MzJlMDQ4OTQ1ZGVmY2Q0ZTVjOWU1NTk4ZThkCkF1dGhvcjog
TGFrc2hheSBQaXBsYW5pIDxsYWtzaGF5LnBpcGxhbmlAbnhwLmNvbT4KCmkzYzogaHViOiBwM2gy
eDR4OiBBZGQgU01CdXMgc2xhdmUgbW9kZSBzdXBwb3J0CgpBZGQgU01CdXMgc2xhdmUgbW9kZSBz
dXBwb3J0IGZvciB0aGUgUDNIMng0eCBodWIgU01CdXMgdGFyZ2V0IHBvcnRzLgpUaGUgaHViIFNN
QnVzIHNsYXZlIGFnZW50IGNhbiByZWNlaXZlIGRvd25zdHJlYW0gcGF5bG9hZHMgaW50byB0YXJn
ZXQKYnVmZmVycyBhbmQgcmVwb3J0IHJlY2VpdmUgZXZlbnRzIHRocm91Z2ggSUJJLgoKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9pM2MvaHViL3AzaDI4NDBfaTNjX2h1Yl9zbWJ1cy5jIGIvZHJpdmVy
cy9pM2MvaHViL3AzaDI4NDBfaTNjX2h1Yl9zbWJ1cy5jCj4gaW5kZXggYTMzMjRjYzM2NTk1Ni4u
N2ZkZmE3OWRmZWI2YyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2kzYy9odWIvcDNoMjg0MF9pM2Nf
aHViX3NtYnVzLmMKPiArKysgYi9kcml2ZXJzL2kzYy9odWIvcDNoMjg0MF9pM2NfaHViX3NtYnVz
LmMKWyAuLi4gXQo+IEBAIC0xNSw2ICsxNywxNzggQEAgZW51bSBwM2gyeDR4X3NtYnVzX2Rlc2Nf
aWR4IHsKWyAuLi4gXQo+ICt2b2lkIHAzaDJ4NHhfaWJpX2hhbmRsZXIoc3RydWN0IGkzY19kZXZp
Y2UgKmkzY2RldiwKPiArCQkJIGNvbnN0IHN0cnVjdCBpM2NfaWJpX3BheWxvYWQgKnBheWxvYWQp
Cj4gK3sKWyAuLi4gXQo+ICsJCS8qIHByb2Nlc3MgZGF0YSByZWNlaXZlIGJ1ZmZlciAqLwo+ICsJ
CXN3aXRjaCAoRklFTERfR0VUKEJVRl9SRUNFSVZFRF9GTEFHX01BU0ssIHRhcmdldF9wb3J0X3N0
YXR1cykpIHsKPiArCQljYXNlIFAzSDJYNFhfVEFSR0VUX0JVRl8wX1JFQ0VJVkVfVkFMOgo+ICsJ
CQlwM2gyeDR4X3JlYWRfc21idXNfYWdlbnRfcnhfYnVmKGkzY2RldiwgUkNWX0JVRl8wLCBpKTsK
PiArCQkJYnJlYWs7Cj4gKwkJY2FzZSBQM0gyWDRYX1RBUkdFVF9CVUZfMV9SRUNFSVZFX1ZBTDoK
PiArCQkJcDNoMng0eF9yZWFkX3NtYnVzX2FnZW50X3J4X2J1ZihpM2NkZXYsIFJDVl9CVUZfMSwg
aSk7Cj4gKwkJCWJyZWFrOwo+ICsJCWNhc2UgUDNIMlg0WF9UQVJHRVRfQlVGXzBfMV9SRUNFSVZF
X1ZBTDoKPiArCQkJcDNoMng0eF9yZWFkX3NtYnVzX2FnZW50X3J4X2J1ZihpM2NkZXYsIFJDVl9C
VUZfMCwgaSk7Cj4gKwkJCXAzaDJ4NHhfcmVhZF9zbWJ1c19hZ2VudF9yeF9idWYoaTNjZGV2LCBS
Q1ZfQlVGXzEsIGkpOwo+ICsJCQlicmVhazsKPiArCQljYXNlIFAzSDJYNFhfVEFSR0VUX0JVRl9P
VlJGTF9WQUw6Cj4gKwkJCXAzaDJ4NHhfcmVhZF9zbWJ1c19hZ2VudF9yeF9idWYoaTNjZGV2LCBS
Q1ZfQlVGXzAsIGkpOwo+ICsJCQlwM2gyeDR4X3JlYWRfc21idXNfYWdlbnRfcnhfYnVmKGkzY2Rl
diwgUkNWX0JVRl8xLCBpKTsKPiArCQkJcmVnbWFwX3dyaXRlKHAzaDJ4NHhfaTNjX2h1Yi0+cmVn
bWFwLCBQM0gyWDRYX1RQMF9TTUJVU19BR05UX1NUUyArIGksCj4gKwkJCQkgICAgIFAzSDJYNFhf
VEFSR0VUX0JVRl9PVlJGTCk7CgpbU2V2ZXJpdHk6IEhpZ2hdClNpbmNlIFAzSDJYNFhfVEFSR0VU
X0JVRl9PVlJGTCBpcyBkZWZpbmVkIGluIGRyaXZlcnMvaTNjL2h1Yi9wM2gyODQwX2kzY19odWIu
aAphcyBHRU5NQVNLKDMsIDEpLCBkb2VzIHRoaXMgVzFDICh3cml0ZS1vbmUtdG8tY2xlYXIpIG9w
ZXJhdGlvbiBpbmFkdmVydGVudGx5CmNsZWFyIGJpdHMgMSBhbmQgMiBpbiBhZGRpdGlvbiB0byB0
aGUgb3ZlcmZsb3cgYml0IChiaXQgMyk/CgpJZiBhIG5ldyBTTUJ1cyBwYWNrZXQgYXJyaXZlcyBp
bW1lZGlhdGVseSBhZnRlciByZWFkaW5nIHRoZSBidWZmZXJzICh3aGljaAp3b3VsZCBzZXQgQklU
KDEpIGFnYWluKSwgd3JpdGluZyBHRU5NQVNLKDMsIDEpIHRvIHRoaXMgVzFDIHN0YXR1cyByZWdp
c3Rlcgp3b3VsZCBjbGVhciB0aGUgb3ZlcmZsb3cgYml0IGJ1dCBhbHNvIGNsZWFyIHRoZSBuZXds
eSBzZXQgcmVjZWl2ZSBmbGFncy4KQ2FuIHRoaXMgcmFjZSBjb25kaXRpb24gY2F1c2UgdGhlIGRy
aXZlciB0byBkcm9wIGluY29taW5nIHBhY2tldHMgd2l0aG91dApwcm9jZXNzaW5nIHRoZW0/Cgo+
ICsJCQlkZXZfZXJyKCZpM2NkZXYtPmRldiwgIk92ZXJmbG93LCByZWFkaW5nIGJ1ZmZlciB6ZXJv
IGFuZCBvbmVcbiIpOwo+ICsJCQlicmVhazsKPiArCQlkZWZhdWx0Ogo+ICsJCQlyZWdtYXBfd3Jp
dGUocDNoMng0eF9pM2NfaHViLT5yZWdtYXAsCj4gKwkJCQkgICAgIFAzSDJYNFhfVFAwX1NNQlVT
X0FHTlRfU1RTICsgaSwKPiArCQkJCSAgICAgdGFyZ2V0X3BvcnRfc3RhdHVzICYgQlVGX1JFQ0VJ
VkVEX0ZMQUdfTUFTSyk7Cj4gKwkJCWJyZWFrOwo+ICsJCX0KPiArCX0KPiArfQoKLS0gClNhc2hp
a28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDkwMzA2
MjEwOC4yNzEyMjk2LTEtbGFrc2hheS5waXBsYW5pQG54cC5jb20/cGFydD04CgotLSAKbGludXgt
aTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
