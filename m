Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB18C55184
	for <linux-i3c@archiver.kernel.org>; Tue,  4 Aug 2026 11:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ApbRB4Bx202f3ZGye7qRXcYggemFSzbJ5O4FmUig2oo=; b=I34+PMtHRxst4j
	6Xcxs0pcwAuy3xyUEaXqJy6JtmWy/Nk3lMJm4SnWdI+iYtu3QOvz+vzL/Oq/NfeWV1/PeoiSzMeHP
	FkvX2YlbhQ/FXxeHzfyi7vmHyASqocaCqZGqPfnm1UuSYP6ZGy/30mJgXUuOC0JlogZd/Kqasu3cW
	4BqZJjG8jA778/6hvO05anqaSrWy5gQgED6plUOvkpxKQ5DqTJmmejCYI8ZKXjDoHKMaNRoEBY9XY
	2r14gvMXPNobL2KpkTJ2gfCp5jh48SmeeIKwo7E5SToyaW2pOZmQs6olCgEMd5bK/CZ55x/xOjU7s
	BOR1n2UsNfQGviTtYUGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrCwR-00000001dau-0rqC;
	Tue, 04 Aug 2026 11:04:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrCwQ-00000001daj-1Jgv
	for linux-i3c@lists.infradead.org;
	Tue, 04 Aug 2026 11:04:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C40D840A48;
	Tue,  4 Aug 2026 11:04:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 657231F000E9;
	Tue,  4 Aug 2026 11:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785841453;
	bh=Yrj1TT7dIRu9SdXVTOME+zyJWBxBrPxi46znv+fBQHc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WZ9FQnupbFp/fshk5+jEsIKP7E2gCoxUrNutXbp9UMBOvJ4EXHlYdbpQfedztGuHj
	 vNtB2asbDKtwpU2iWFJXKeW8zwJVYNJPmEA7NQ54OkKpf7dNbErxPWWgLqqtRU2xUX
	 y4sh9nI8q49lrQgGTRB5w6f+reZufLGnauE24LAE31xatjreC4EvRMPZxizZ60oXO7
	 JMVFU3BY2j0nSMY8xqVjYhq/wGHBL/5CvKfDPaPQAWqN4u9JT5a+cA1gnB+0DZYa0l
	 2yCQiqR8brbGQbBchBJIAPclPekKkPrSGzSq+pR2z/i+uQQJ00zDvPQZlk6DTbk/Vd
	 F8zSXeQJThmwQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/5] i3c: dw: Do not use OF match data as a quirk
 bitmask
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, Frank.Li@kernel.org, linux-i3c@lists.infradead.org
In-Reply-To: <20260804101301.2975911-5-akhilrajeev@nvidia.com>
References: <20260804101301.2975911-1-akhilrajeev@nvidia.com>
 <20260804101301.2975911-5-akhilrajeev@nvidia.com>
Date: Tue, 04 Aug 2026 11:04:12 +0000
Message-Id: <20260804110413.657231F000E9@smtp.kernel.org>
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
IFtIaWdoXSBNaXNzaW5nIGVycm9yIGNoZWNrIGZvciBwbGF0Zm9ybV9nZXRfaXJxKCkgd2hpY2gg
YnJlYWtzIHByb2JlIGRlZmVycmFsLgotLQoKLS0tIFBhdGNoIFs0XTogW1BBVENIIDQvNV0gaTNj
OiBkdzogRG8gbm90IHVzZSBPRiBtYXRjaCBkYXRhIGFzIGEgcXVpcmsgYml0bWFzayAtLS0KY29t
bWl0IGI0NmZhMzk3N2QwMmVjNzg1NDRjMWY5ODdmZmJmOTliMzljNDdmMGQKQXV0aG9yOiBBa2hp
bCBSIDxha2hpbHJhamVldkBudmlkaWEuY29tPgoKaTNjOiBkdzogRG8gbm90IHVzZSBPRiBtYXRj
aCBkYXRhIGFzIGEgcXVpcmsgYml0bWFzawoKVGhpcyBjb21taXQgdXBkYXRlcyBkd19pM2NfY29t
bW9uX3Byb2JlKCkgdG8gZXhwbGljaXRseSBjaGVjayBmb3IgYSBtYXRjaAppbiB0aGUgZHJpdmVy
J3MgQUNQSSB0YWJsZSBpbnN0ZWFkIG9mIG1lcmVseSB0ZXN0aW5nIGZvciBhbiBBQ1BJIGNvbXBh
bmlvbi4KVGhpcyBwcmV2ZW50cyBPRiBtYXRjaCBkYXRhIGZyb20gYmVpbmcgaW5jb3JyZWN0bHkg
Y2FzdCB0byBhIHF1aXJrIGJpdG1hc2suCgpDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2FsbC8yMDI2MDcyODA3MTc1Ny41QjNDRDFGMDAwRTlAc210cC5rZXJuZWwub3JnLwoKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyL2R3LWkzYy1tYXN0ZXIuYyBiL2RyaXZlcnMvaTNj
L21hc3Rlci9kdy1pM2MtbWFzdGVyLmMKPiBpbmRleCAzODE2YTUwYTUyY2M1Li4xN2UxZGQ0ZmI1
ZjNkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci9kdy1pM2MtbWFzdGVyLmMKPiAr
KysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvZHctaTNjLW1hc3Rlci5jCgpbIC4uLiBdCgo+IEBAIC0x
NjE4LDkgKzE2MjAsMTAgQEAgaW50IGR3X2kzY19jb21tb25fcHJvYmUoc3RydWN0IGR3X2kzY19t
YXN0ZXIgKm1hc3RlciwKPiAgCj4gIAltYXN0ZXItPmRldiA9ICZwZGV2LT5kZXY7Cj4gIAo+IC0J
aWYgKGhhc19hY3BpX2NvbXBhbmlvbigmcGRldi0+ZGV2KSkgewo+IC0JCXF1aXJrcyA9ICh1bnNp
Z25lZCBsb25nKWRldmljZV9nZXRfbWF0Y2hfZGF0YSgmcGRldi0+ZGV2KTsKPiAtCX0gZWxzZSBp
ZiAocGRldi0+ZGV2Lm9mX25vZGUpIHsKPiArCWFjcGlfaWQgPSBhY3BpX21hdGNoX2RldmljZShw
ZGV2LT5kZXYuZHJpdmVyLT5hY3BpX21hdGNoX3RhYmxlLCAmcGRldi0+ZGV2KTsKPiArCWlmIChh
Y3BpX2lkKSB7Cj4gKwkJcXVpcmtzID0gYWNwaV9pZC0+ZHJpdmVyX2RhdGE7Cj4gKwl9IGVsc2Ug
ewo+ICAJCWRydmRhdGEgPSBkZXZpY2VfZ2V0X21hdGNoX2RhdGEoJnBkZXYtPmRldik7Cj4gIAkJ
aWYgKGRydmRhdGEpCj4gIAkJCXF1aXJrcyA9IGRydmRhdGEtPmZsYWdzOwoKW1NldmVyaXR5OiBI
aWdoXQpUaGlzIGlzbid0IGEgYnVnIGludHJvZHVjZWQgYnkgdGhpcyBwYXRjaCwgYnV0IHdoaWxl
IHJldmlld2luZwpkd19pM2NfY29tbW9uX3Byb2JlKCksIEkgbm90aWNlZCBhbiBleGlzdGluZyBp
c3N1ZSB3aXRoIGhvdyB0aGUgSVJRIGlzCmZldGNoZWQgbGF0ZXIgaW4gdGhlIHNhbWUgZnVuY3Rp
b246CgoJaXJxID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCAwKTsKCXJldCA9IGRldm1fcmVxdWVz
dF9pcnEoJnBkZXYtPmRldiwgaXJxLAoJCQkgICAgICAgZHdfaTNjX21hc3Rlcl9pcnFfaGFuZGxl
ciwgMCwKCQkJICAgICAgIGRldl9uYW1lKCZwZGV2LT5kZXYpLCBtYXN0ZXIpOwoKRG9lcyB0aGlz
IGNvZGUgZmFpbCB0byBoYW5kbGUgZGVmZXJyZWQgcHJvYmluZyBwcm9wZXJseT8KCklmIHBsYXRm
b3JtX2dldF9pcnEoKSByZXR1cm5zIGEgbmVnYXRpdmUgZXJyb3IgbGlrZSAtRVBST0JFX0RFRkVS
LCBpdCBpcwpwYXNzZWQgZGlyZWN0bHkgYXMgdGhlIGlycSBwYXJhbWV0ZXIgdG8gZGV2bV9yZXF1
ZXN0X2lycSgpLiBCZWNhdXNlIHRoZSBpcnEKcGFyYW1ldGVyIGlzIGFuIHVuc2lnbmVkIGludGVn
ZXIsIHRoZSBuZWdhdGl2ZSB2YWx1ZSBpcyBjYXN0IHRvIGEgbGFyZ2UKbnVtYmVyLiBUaGlzIGNh
dXNlcyByZXF1ZXN0X3RocmVhZGVkX2lycSgpIHRvIHJlamVjdCBpdCBhcyBvdXQgb2YgYm91bmRz
CmFuZCByZXR1cm4gLUVJTlZBTC4KCkNvdWxkIHRoaXMgcGVybWFuZW50bHkgYnJlYWsgaW5pdGlh
bGl6YXRpb24gb24gc3lzdGVtcyB0aGF0IHJlcXVpcmUgcHJvYmUKZGVmZXJyYWwgYnkgbWFza2lu
ZyB0aGUgb3JpZ2luYWwgZGVmZXJyYWwgZXJyb3IgY29kZT8KCi0tIApTYXNoaWtvIEFJIHJldmll
dyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA4MDQxMDEzMDEuMjk3NTkx
MS0xLWFraGlscmFqZWV2QG52aWRpYS5jb20/cGFydD00CgotLSAKbGludXgtaTNjIG1haWxpbmcg
bGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
