Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5793BCD98CE
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Jun 2026 16:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KnmlvaZUTi8C5Jf10ShbvbCji9S5n9GrMaAqPrMnwHE=; b=HwXZ5RyhRsxbHT
	NLcphcK+Hu2EgQ83Ym8pUC2mpNBM/G9tSRUJXSF0DdF1r0UEFqTh/BZOTXBu4Ptlgl9wGna0LSgNO
	49NRoHuiXDVt0caG36Zm+GE9OyjKxuuYYKK9eLTFBZ4A3RsJi2RwmnRUDuAHlrQ8VrpS9uyyfWWY8
	MhHLgT0Yv1MNFCk20YteJ0lkTo/FW5Aq1Ay5sUNCWmpOd2cUh/wFdHpIScgyWWpNLPwkBBffDdyNf
	N3/1Eq2FlI2z8FTx/Wo61AsGbl2k5vfGuW7q48XyQKBw8uKsHDcssU0ncGLPr8Ws5MeycV29tgP8W
	MONX1dV8k0jDzG7ForAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4ZO-0000000BDde-3mDr;
	Fri, 12 Jun 2026 16:17:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4ZN-0000000BDdW-3HII
	for linux-i3c@lists.infradead.org;
	Fri, 12 Jun 2026 16:17:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B09A40445
	for <linux-i3c@lists.infradead.org>; Fri, 12 Jun 2026 16:17:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2053C1F000E9;
	Fri, 12 Jun 2026 16:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781281041;
	bh=+Ih9G3T5dXfazHmVyKS39XcggReVnbe5A7VRRvL/94Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CrDoCjcG207Z+t4HpWT9cL6t8XNr3Db8z/P3ILzhvdxVa0h9qNv7eRMW0EUh/f58X
	 LE4XbmlrVT8erGb+oQb5kFCHdLlMxHSZWjgQTKFqCA6tYJ8bAsPLKOo+Qvx4WOEIUA
	 I9k/Vx+t+tel1EilixNqDr245rCJHm6ai15sYTmkXmYE6P4x+zu2HfZEH87/tk18ta
	 lx2u4r4myGRCXIYG1v7yTbU7z5X3H/REFugf1+rLxep/FFeyPiyF/p5S0eVFGmcTSB
	 JEvIyehJAPuBIMBKTbXGOQtF7Wcc8SD9GURWnpIgHhwv8XfRylZ+j8YjrZxDMgWKHe
	 5NHkwSx2FBOOg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 02/16] i3c: renesas: Restore STDBR and EXTBR
 registers on resume
To: "Claudiu Beznea" <claudiu.beznea@kernel.org>
Cc: linux-i3c@lists.infradead.org, Frank.Li@kernel.org
In-Reply-To: <20260612160458.3102106-3-claudiu.beznea@kernel.org>
References: <20260612160458.3102106-3-claudiu.beznea@kernel.org>
Date: Fri, 12 Jun 2026 16:17:20 +0000
Message-Id: <20260612161721.2053C1F000E9@smtp.kernel.org>
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
IFtIaWdoXSBTaWxlbnQgZGF0YSB0cnVuY2F0aW9uIGluIEVYVEJSIHJlZ2lzdGVyIGNvbmZpZ3Vy
YXRpb24gZm9yIHNsb3cgY2xvY2sgc3BlZWRzLgotLQoKY29tbWl0IGRlY2RjOTM5MjA5MDQ2ZDc0
ZjVhZTY2MzYxYzExNWUxYzIyNWEzNzkKQXV0aG9yOiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5i
ZXpuZWEudWpAYnAucmVuZXNhcy5jb20+CgppM2M6IHJlbmVzYXM6IFJlc3RvcmUgU1REQlIgYW5k
IEVYVEJSIHJlZ2lzdGVycyBvbiByZXN1bWUKClRoaXMgY29tbWl0IHJlc3RvcmVzIHRoZSBTVERC
UiBhbmQgRVhUQlIgcmVnaXN0ZXJzIGR1cmluZyB0aGUgcmVzdW1lIHByb2Nlc3MgCmZvciB0aGUg
UmVuZXNhcyBSWi9HM1MuIFRoaXMgZW5zdXJlcyB0aGUgY29udHJvbGxlciBtYWludGFpbnMgdGhl
IHNhbWUgc3RhdGUgCmFmdGVyIGEgc3VzcGVuZCB3aXRoIHBvd2VyIGxvc3MuCgo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIvcmVuZXNhcy1pM2MuYyBiL2RyaXZlcnMvaTNjL21hc3Rl
ci9yZW5lc2FzLWkzYy5jCj4gLS0tIGEvZHJpdmVycy9pM2MvbWFzdGVyL3JlbmVzYXMtaTNjLmMK
PiArKysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvcmVuZXNhcy1pM2MuYwoKWyAuLi4gXQoKPiBAQCAt
NjA3LDEwICs2MDgsOSBAQCBzdGF0aWMgaW50IHJlbmVzYXNfaTNjX2J1c19pbml0KHN0cnVjdCBp
M2NfbWFzdGVyX2NvbnRyb2xsZXIgKm0pCj4gIAlyZW5lc2FzX3dyaXRlbChpM2MtPnJlZ3MsIFNU
REJSLCBpM2MtPmkzY19TVERCUik7Cj4gIAo+ICAJLyogRXh0ZW5kZWQgQml0IFJhdGUgc2V0dGlu
ZyAqLwo+IC0JcmVuZXNhc193cml0ZWwoaTNjLT5yZWdzLCBFWFRCUiwgRVhUQlJfRUJSTE8ob2Rf
bG93X3RpY2tzKSB8Cj4gLQkJCQkJICAgRVhUQlJfRUJSSE8ob2RfaGlnaF90aWNrcykgfAo+IC0J
CQkJCSAgIEVYVEJSX0VCUkxQKHBwX2xvd190aWNrcykgfAo+IC0JCQkJCSAgIEVYVEJSX0VCUkhQ
KHBwX2hpZ2hfdGlja3MpKTsKPiArCWkzYy0+ZXh0YnIgPSBFWFRCUl9FQlJMTyhvZF9sb3dfdGlj
a3MpIHwgRVhUQlJfRUJSSE8ob2RfaGlnaF90aWNrcykgfAo+ICsJCSAgICAgRVhUQlJfRUJSTFAo
cHBfbG93X3RpY2tzKSB8IEVYVEJSX0VCUkhQKHBwX2hpZ2hfdGlja3MpOwoKW1NldmVyaXR5OiBI
aWdoXQpUaGlzIGlzIGEgcHJlLWV4aXN0aW5nIGlzc3VlLCBidXQgZG9lcyB0aGlzIGNvZGUgc2ls
ZW50bHkgdHJ1bmNhdGUgCm9kX2xvd190aWNrcyBhbmQgb2RfaGlnaF90aWNrcyB3aGVuIHRoZSBj
bG9jayBpcyBzbG93PwoKRm9yIHNsb3cgSTJDIHNwZWVkcywgb2RfbG93X3RpY2tzIGFuZCBvZF9o
aWdoX3RpY2tzIGNhbiByZWFjaCB1cCB0byA1MTAgCmJlY2F1c2UgdGhlIGNsb2NrIGRpdmlkZXIg
bG9vcCBvbmx5IGVuc3VyZXMgKG9kX2xvd190aWNrcyAvIDIpIDw9IDB4RkYuCgpUaGUgU1REQlIg
cmVnaXN0ZXIgY29uZmlndXJhdGlvbiBhcHBsaWVzIGEgcmlnaHQgc2hpZnQgd2hlbiBkb3VibGVf
U0JSIGlzIApzZXQgdG8gYXZvaWQgb3ZlcmZsb3cuCgpTaW5jZSB0aGUgRVhUQlJfRUJSTE8gYW5k
IEVYVEJSX0VCUkhPIG1hY3JvcyB1c2UgOC1iaXQgbWFza3MsIGFuZCB0aGlzIGxpbmUgCmRvZXNu
J3QgYXBwbHkgdGhlIGRvdWJsZV9TQlIgcmlnaHQgc2hpZnQsIHdvbid0IGFueSB0aWNrIHZhbHVl
IGdyZWF0ZXIgdGhhbiAKMjU1IGdldCB0cnVuY2F0ZWQgYnkgdGhlIGJpdHdpc2UgQU5EIGFuZCBy
ZXN1bHQgaW4gaW5jb3JyZWN0IGV4dGVuZGVkIGJpdCAKcmF0ZSB0aW1pbmdzPwoKPiArCXJlbmVz
YXNfd3JpdGVsKGkzYy0+cmVncywgRVhUQlIsIGkzYy0+ZXh0YnIpOwo+ICAKPiAgCXJlbmVzYXNf
d3JpdGVsKGkzYy0+cmVncywgUkVGQ0tDVEwsIFJFRkNLQ1RMX0lSRUZDS1MoY2tzKSk7Cj4gIAlp
M2MtPnJlZmNsa19kaXYgPSBja3M7CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9z
YXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNjEyMTYwNDU4LjMxMDIxMDYtMS1jbGF1ZGl1LmJl
em5lYUBrZXJuZWwub3JnP3BhcnQ9MgoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgt
aTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1pM2MK
