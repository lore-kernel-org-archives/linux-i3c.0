Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF76C44521
	for <linux-i3c@archiver.kernel.org>; Mon, 20 Jul 2026 07:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nce4AadG06uaebLMKC6KG2ngaMNUbaB+n+SVtHtd2/o=; b=oAvV+C6i3xS40q
	MHZO4z3IODUp7Daje6wlN6R8ViNcyU/m3FZe69SdwftUHQasVqHlQ+mPtKOMT9p3xtdQwe19opEUi
	FryQ1sSk9PGBxGwAtl1/QNLmw8y+8/CknP35UEZ9BKGDtrDxRZYvvjIO7UsM5TbaSRF5SkFx540Hr
	MJ4/h4BJ4HjckOU+wXdsSUuwbcnFWDOFwNtcpvlUhdrngHwNhVgrEUsLqT6oXeA2hs+bS/8t+zwrt
	sxY+ZomZgIQOC6IR1ieId2/oKc1/E/K/xa+Th+L+JTZrlhzBB+kmMIkh6thZCwlpXEGw8513pyegF
	fgtyaHRSeEs+gUFsfjkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliew-000000067zr-2UK8;
	Mon, 20 Jul 2026 07:43:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliev-000000067zZ-0f4n
	for linux-i3c@lists.infradead.org;
	Mon, 20 Jul 2026 07:43:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 84DDE413FB;
	Mon, 20 Jul 2026 07:43:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F18B1F000E9;
	Mon, 20 Jul 2026 07:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784533408;
	bh=gmm3vhVK/eoXr8/4cb+GWd9+j4TO3tlIDB0ZHWDbv6Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hGepy3gONjYzxxJnTulCmOlHOEqSCnrTKWsBbq/Iit0tdqVekQe7e63zxqvl6tzv+
	 rfH5Os1kBlC9UVnKSd+jW0fXBqoaE/ImQAmL6MaiN6oP/b31pvM8NgzpXaWrBstRX0
	 UuZYPKFnNL0DqP6hgewKICbmInNuSBxZ98jIZ1v7oZfIEwUGjDj2B7kfqq60MyQfXX
	 zQ2W3WgLFMn0PI/+XGwy1H55upTPh4vGoSeBcUbFamJKlvFeh7eg8DmTzyvVis2lMH
	 gt7FOrNnVpmLfLA0XBGKndiJYfx413CviNOjvDbD6qfj2qJuuc3BF5YM6+FbcH52Uo
	 rqiF+gd6BIAhQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: i3c: dw: Document missing optional
 core reset
To: "Shubham Patil" <shubhamsanjay.patil@amd.com>
Cc: linux-i3c@lists.infradead.org, robh@kernel.org, Frank.Li@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260720073510.1869623-2-shubhamsanjay.patil@amd.com>
References: <20260720073510.1869623-1-shubhamsanjay.patil@amd.com>
 <20260720073510.1869623-2-shubhamsanjay.patil@amd.com>
Date: Mon, 20 Jul 2026 07:43:27 +0000
Message-Id: <20260720074328.1F18B1F000E9@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIFRoZSBiaW5kaW5nIHNj
aGVtYSBhZGRzIHRoZSBgcmVzZXRzYCBwcm9wZXJ0eSBidXQgaW50ZW50aW9uYWxseSBvbWl0cyBg
cmVzZXQtbmFtZXNgLiBUaGUgZHJpdmVyIHN0cmljdGx5IHJlcXVpcmVzIGByZXNldC1uYW1lcyA9
ICJjb3JlX3JzdCJgIHRvIGZpbmQgdGhlIHJlc2V0IGNvbnRyb2wsIGNhdXNpbmcgaXQgdG8gc2ls
ZW50bHkgaWdub3JlIHRoZSByZXNldC4KLS0KCi0tLSBQYXRjaCBbMV06IFtQQVRDSCB2MiAxLzJd
IGR0LWJpbmRpbmdzOiBpM2M6IGR3OiBEb2N1bWVudCBtaXNzaW5nIG9wdGlvbmFsIGNvcmUgcmVz
ZXQgLS0tCmNvbW1pdCA2NzNiMDYwODhhOWI1OTg3NWQ3MTdkYjJjOWFmYjU2Mjk1YWM4N2E5CkF1
dGhvcjogU2h1YmhhbSBQYXRpbCA8c2h1YmhhbXNhbmpheS5wYXRpbEBhbWQuY29tPgoKZHQtYmlu
ZGluZ3M6IGkzYzogZHc6IERvY3VtZW50IG1pc3Npbmcgb3B0aW9uYWwgY29yZSByZXNldAoKVGhp
cyBjb21taXQgZG9jdW1lbnRzIGFuIG9wdGlvbmFsIGNvcmUgcmVzZXQgcHJvcGVydHkgZm9yIHRo
ZSBEZXNpZ25XYXJlIEkzQwptYXN0ZXIgSVAuIEl0IGFkZHMgdGhlIHJlc2V0cyBwcm9wZXJ0eSB3
aXRoIGEgbWF4SXRlbXMgb2YgMSB0byB0aGUgc2NoZW1hCmJ1dCBleHBsaWNpdGx5IGRyb3BzIHRo
ZSByZXNldC1uYW1lIHByb3BlcnR5LgoKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2kzYy9zbnBzLGR3LWkzYy1tYXN0ZXIueWFtbCBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9pM2Mvc25wcyxkdy1pM2MtbWFzdGVyLnlhbWwKPiBpbmRl
eCBlODAzNDU3ZDNmNTU0Li5kYzdlZTM4MDAxZDZkIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9pM2Mvc25wcyxkdy1pM2MtbWFzdGVyLnlhbWwKPiArKysg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTNjL3NucHMsZHctaTNjLW1hc3Rl
ci55YW1sCj4gQEAgLTM4LDYgKzM4LDkgQEAgcHJvcGVydGllczoKPiAgICBpbnRlcnJ1cHRzOgo+
ICAgICAgbWF4SXRlbXM6IDEKPiAgCj4gKyAgcmVzZXRzOgo+ICsgICAgbWF4SXRlbXM6IDEKPiAr
CgpbU2V2ZXJpdHk6IEhpZ2hdClNpbmNlIHRoaXMgc2NoZW1hIGludGVudGlvbmFsbHkgb21pdHMg
cmVzZXQtbmFtZXMsIGRldmljZSB0cmVlcyBjYW5ub3QKcHJvdmlkZSBpdCB3aXRob3V0IGJyZWFr
aW5nIHNjaGVtYSB2YWxpZGF0aW9uLgoKSG93ZXZlciwgZG9lc24ndCB0aGUgZHJpdmVyIGV4cGxp
Y2l0bHkgcmVseSBvbiByZXNldC1uYW1lcyB0byBmaW5kIHRoaXMKcmVzZXQgY29udHJvbD8KCkxv
b2tpbmcgYXQgZHdfaTNjX2NvbW1vbl9wcm9iZSgpIGluIGRyaXZlcnMvaTNjL21hc3Rlci9kdy1p
M2MtbWFzdGVyLmM6CgoJbWFzdGVyLT5jb3JlX3JzdCA9IGRldm1fcmVzZXRfY29udHJvbF9nZXRf
b3B0aW9uYWxfZXhjbHVzaXZlX2RlYXNzZXJ0ZWQoCgkJCQkJJnBkZXYtPmRldiwgImNvcmVfcnN0
Iik7CgpCZWNhdXNlIHRoaXMgc2VhcmNoZXMgZm9yIHRoZSAiY29yZV9yc3QiIHN0cmluZyBpbiB0
aGUgcmVzZXQtbmFtZXMKcHJvcGVydHksIHdvbid0IGl0IGZhaWwgdG8gZmluZCB0aGUgcmVzZXQg
YW5kIHNpbGVudGx5IHJldHVybiBOVUxMCndpdGhvdXQgdGhlIHByb3BlcnR5IGJlaW5nIGRlZmlu
ZWQgaW4gdGhlIGRldmljZSB0cmVlPwoKVGhpcyB3b3VsZCB0dXJuIGFsbCBzdWJzZXF1ZW50IHJl
c2V0IG9wZXJhdGlvbnMgaW50byBuby1vcHMuIFNob3VsZApyZXNldC1uYW1lcyBiZSBhZGRlZCBi
YWNrIHRvIHRoZSBiaW5kaW5nIHRvIG1hdGNoIHRoZSBkcml2ZXIncwpleHBlY3RhdGlvbnM/Cgo+
ICAgIHBvd2VyLWRvbWFpbnM6Cj4gICAgICBtYXhJdGVtczogMQo+CgotLSAKU2FzaGlrbyBBSSBy
ZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNzIwMDczNTEwLjE4
Njk2MjMtMS1zaHViaGFtc2FuamF5LnBhdGlsQGFtZC5jb20/cGFydD0xCgotLSAKbGludXgtaTNj
IG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
