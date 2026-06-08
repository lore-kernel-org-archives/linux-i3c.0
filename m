Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C41CECD8CA4
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Jun 2026 20:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5N/A8zKjgkhzdZpG1MAJUPSYdd7s2HUM9oq7Ao5HFVk=; b=daP6Q2uCAJieCZ
	qogTT+qM13JTOglXquB3atdN441gq+knCMFAFgQOWZ981+5RnyiHEhTPo39xBSOzEkEtO4jni2l6+
	DRu3kBORI2uMO99kNcXKyeiJYdmy3OEQ6ycv/Gt1oMSF02TFqfy2+4fMtBODyjuHv8fVG0G2F+enG
	/vnHrYwGnIDH189IriXFxqT7ZJj1ONmpSuHP2WOUghxGKdp/20FA4kWbAC13BaG/Co3IHnzISp00L
	bD73SWJHmTka1lmbFLtjSMv0xyyvHcrUAAEqDV7w8i372oWD9FPnR1iDclTLoPGv0ZfY2UsBTBP+8
	PxFvUEtj4xZncelK9clA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWgdz-00000004Me9-07kE;
	Mon, 08 Jun 2026 20:32:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWgdx-00000004Mdx-2DrM
	for linux-i3c@lists.infradead.org;
	Mon, 08 Jun 2026 20:32:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4E0EC4447F;
	Mon,  8 Jun 2026 20:32:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C2051F00893;
	Mon,  8 Jun 2026 20:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780950741;
	bh=YBeRhBr/BpWpPrWiHS3w6jDmxf5bku4F0OcOVFR5GjA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dBa/aAuzbUyDnk4aMuiLVxW8n4sULwYugRD530AdXgPYBRINYE3krpk8W1dCpZBdk
	 VVWnXLAYptrTevUB0YqtJ9DmrSvO8Nxuv1jV/NB125qqeSD7rGzCf8OgNZx8K2BpKl
	 fXL+tSEyGfjy+orjRCBjUORlS10DeRB666VsfQgKMVNIYkxA5yaxMqacC7ZzRtlkzv
	 W4tjgA6MYWdOG+Dh/gp3XQXeG8in+lgwdwBPifP6tVhDaA8gQhdiZ6weslbzNLgejT
	 15h6WrSHW3xU8TaLD8fsGmYqt/vEGQEecvpiErF/dTctAQ47PbyJiSNyo9nOIX/Rb7
	 9ALbBeif9HXdQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 02/17] i3c: renesas: Restore STDBR and EXTBR
 registers on resume
To: "Claudiu Beznea" <claudiu.beznea@kernel.org>
Cc: Frank.Li@kernel.org, wsa+renesas@sang-engineering.com, linux-i3c@lists.infradead.org
In-Reply-To: <20260608201543.804902-3-claudiu.beznea@kernel.org>
References: <20260608201543.804902-3-claudiu.beznea@kernel.org>
Date: Mon, 08 Jun 2026 20:32:20 +0000
Message-Id: <20260608203220.5C2051F00893@smtp.kernel.org>
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
IFtIaWdoXSBUaGUgRVhUQlIgY29uZmlndXJhdGlvbiB0cnVuY2F0ZXMgYG9kX2xvd190aWNrc2Ag
YW5kIGBvZF9oaWdoX3RpY2tzYCBpZiB0aGV5IGV4Y2VlZCAyNTUsIHJlc3VsdGluZyBpbiBpbmNv
cnJlY3Qgb3Blbi1kcmFpbiB0aW1pbmcgc2V0dGluZ3MgYmVpbmcgY2FjaGVkIGFuZCBhcHBsaWVk
LgotLQoKY29tbWl0IDJlYjU1YWI3YTYxODMyYzExZTQ1ZDdjZDNlMGJkNDU5ZThkYjVkZmMKQXV0
aG9yOiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWEudWpAYnAucmVuZXNhcy5jb20+Cgpp
M2M6IHJlbmVzYXM6IFJlc3RvcmUgU1REQlIgYW5kIEVYVEJSIHJlZ2lzdGVycyBvbiByZXN1bWUK
ClRoaXMgcGF0Y2ggc3RvcmVzIHRoZSBFeHRlbmRlZCBCaXQgUmF0ZSAoRVhUQlIpIHNldHRpbmdz
IGR1cmluZyBidXMKaW5pdGlhbGl6YXRpb24gYW5kIGV4cGxpY2l0bHkgcmVzdG9yZXMgYm90aCBT
VERCUiBhbmQgRVhUQlIgb24gcmVzdW1lCnRvIHByZXNlcnZlIGNvbnRyb2xsZXIgc3RhdGUgYWNy
b3NzIGEgcG93ZXItbG9zcyBzdXNwZW5kLgoKRml4ZXM6IGU3MjE4OTg2MzE5YiAoImkzYzogcmVu
ZXNhczogQWRkIHN1c3BlbmQvcmVzdW1lIHN1cHBvcnQiKQpDYzogc3RhYmxlQHZnZXIua2VybmVs
Lm9yZwoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyL3JlbmVzYXMtaTNjLmMgYi9k
cml2ZXJzL2kzYy9tYXN0ZXIvcmVuZXNhcy1pM2MuYwo+IGluZGV4IDZlN2VjZTJlMGI0ZWUuLjg4
YTE2ZWZlMDk2ZGUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9pM2MvbWFzdGVyL3JlbmVzYXMtaTNj
LmMKPiArKysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvcmVuZXNhcy1pM2MuYwoKWyAuLi4gXQoKPiBA
QCAtNjA3LDEwICs2MDgsOSBAQCBzdGF0aWMgaW50IHJlbmVzYXNfaTNjX2J1c19pbml0KHN0cnVj
dCBpM2NfbWFzdGVyX2NvbnRyb2xsZXIgKm0pCj4gIAlyZW5lc2FzX3dyaXRlbChpM2MtPnJlZ3Ms
IFNUREJSLCBpM2MtPmkzY19TVERCUik7Cj4gIAo+ICAJLyogRXh0ZW5kZWQgQml0IFJhdGUgc2V0
dGluZyAqLwo+IC0JcmVuZXNhc193cml0ZWwoaTNjLT5yZWdzLCBFWFRCUiwgRVhUQlJfRUJSTE8o
b2RfbG93X3RpY2tzKSB8Cj4gLQkJCQkJICAgRVhUQlJfRUJSSE8ob2RfaGlnaF90aWNrcykgfAo+
IC0JCQkJCSAgIEVYVEJSX0VCUkxQKHBwX2xvd190aWNrcykgfAo+IC0JCQkJCSAgIEVYVEJSX0VC
UkhQKHBwX2hpZ2hfdGlja3MpKTsKPiArCWkzYy0+ZXh0YnIgPSBFWFRCUl9FQlJMTyhvZF9sb3df
dGlja3MpIHwgRVhUQlJfRUJSSE8ob2RfaGlnaF90aWNrcykgfAo+ICsJCSAgICAgRVhUQlJfRUJS
TFAocHBfbG93X3RpY2tzKSB8IEVYVEJSX0VCUkhQKHBwX2hpZ2hfdGlja3MpOwoKW1NldmVyaXR5
OiBIaWdoXQpUaGlzIGlzIGEgcHJlLWV4aXN0aW5nIGlzc3VlLCBidXQgZG9lcyB0aGlzIGNhbGN1
bGF0aW9uIHNpbGVudGx5IHRydW5jYXRlCnRoZSBvcGVuLWRyYWluIHRpY2tzPwoKTG9va2luZyBl
YXJsaWVyIGluIHJlbmVzYXNfaTNjX2J1c19pbml0KCksIHRoZSB3aGlsZS1sb29wIHRlcm1pbmF0
aW9uCmNvbmRpdGlvbiBhbGxvd3Mgb2RfbG93X3RpY2tzIGFuZCBvZF9oaWdoX3RpY2tzIHRvIGV4
Y2VlZCAyNTU6CgogICAgICAgIGlmICgob2RfbG93X3RpY2tzIC8gMikgPD0gMHhGRiAmJiBwcF9s
b3dfdGlja3MgPCAweDNGKQogICAgICAgICAgICBicmVhazsKClRoZSBTdGFuZGFyZCBCaXQgUmF0
ZSAoU1REQlIpIGNvbmZpZ3VyYXRpb24gc2FmZWx5IGhhbmRsZXMgdGhlc2UgbGFyZ2VyCnZhbHVl
cyBieSByaWdodC1zaGlmdGluZyB0aGVtIHdoZW4gZG91YmxlX1NCUiBpcyBzZXQuIEhvd2V2ZXIs
IHRoZSBFWFRCUgptYWNyb3MgdXNlIEZJRUxEX1BSRVAoR0VOTUFTSyg3LCAwKSwgeCksIHdoaWNo
IHNpbGVudGx5IHRydW5jYXRlcyBhbnkKdmFsdWVzIG92ZXIgMjU1LgoKU2luY2UgdGhpcyBwYXRj
aCBub3cgZXhwbGljaXRseSBjYWNoZXMgdGhlIHRydW5jYXRlZCBFWFRCUiBjYWxjdWxhdGlvbiB0
bwpwZXJzaXN0IGl0IGFjcm9zcyBzeXN0ZW0gcmVzdW1lcywgd291bGQgaXQgYmUgYmV0dGVyIHRv
IGFkZHJlc3MgdGhpcwp0cnVuY2F0aW9uIHNvIHdlIGRvbid0IHJlc3RvcmUgYnJva2VuIHRpbWlu
ZyBjb25maWd1cmF0aW9ucz8KCj4gKwlyZW5lc2FzX3dyaXRlbChpM2MtPnJlZ3MsIEVYVEJSLCBp
M2MtPmV4dGJyKTsKPiAgCj4gIAlyZW5lc2FzX3dyaXRlbChpM2MtPnJlZ3MsIFJFRkNLQ1RMLCBS
RUZDS0NUTF9JUkVGQ0tTKGNrcykpOwo+ICAJaTNjLT5yZWZjbGtfZGl2ID0gY2tzOwoKLS0gClNh
c2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDYw
ODIwMTU0My44MDQ5MDItMS1jbGF1ZGl1LmJlem5lYUBrZXJuZWwub3JnP3BhcnQ9MgoKLS0gCmxp
bnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
