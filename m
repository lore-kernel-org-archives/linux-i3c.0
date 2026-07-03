Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D370DC43458
	for <linux-i3c@archiver.kernel.org>; Fri,  3 Jul 2026 10:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ovdVSr6fxMje/46rAWqW7bir08TIrKPUyjEw/kClSzE=; b=v2NRGyOlvX3YvH
	9WDbN4yFlAdWPkpj1Q3z4nnYrMliCQOPKI7zy/JK69F9aMGKvPtuiD7lqLenr8XgsgzCbuk7+l7xO
	vtaiqJpIeIPRnS+2IFvl4wLln17qe1prg0AtfOA+YIm3JGkXiGb1GEdk6lPFYZenmm/9GxSW5B2Iz
	4R9qhVz00EVDku1f6b6PKNmdQZjJv8ZSHjxPfX2QFHZZz8h6ry4qBhIsEo4UtlKENm5JoyyzMJyog
	XgNX+ekgyZPgu17xWygHj1w/9WWd/BqM6kLlc96E1h7yMb8UzexfkrX0wXXMyrnU0mzspXFoub7Hy
	U1wgHd0Twn+d3v9l4cNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbcL-00000006k3v-2aon;
	Fri, 03 Jul 2026 10:59:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbcJ-00000006k3o-2uEn
	for linux-i3c@lists.infradead.org;
	Fri, 03 Jul 2026 10:59:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 73C5743844;
	Fri,  3 Jul 2026 10:59:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 103B51F00A3F;
	Fri,  3 Jul 2026 10:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783076371;
	bh=qQwMPLheEAO10XFR6ln98RVZIFkpCCMDRgmGHQ2Eknc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q/IAvFUESjAWABmnJFGV6GJeQn7lsl6cS2WYwqyX0RcTGuJ9dx9clI2n6DPqtwIKE
	 jpW3geQ8cmd3bwtRD5Vv4EagZIz2d86clkUkCAf9ophV4hDegQ594w0JCv60/64wxH
	 d+4i8nr26gYjrqJlfrFzBnpxBPFRS3q1/xUT8HydSf2Z9pjonUIov/cYukujYm7C0C
	 xD4wnpFehu/4NeCWWkxti5Vx1eeXQFMN+kPr2Fc/Uw61QkWgk/wLwau5kUoDWEZ2Ba
	 1Gwd1ckQVa2e2d61bKmvEyrK469SYux4Q4gBQX7XsxtkxHIHf/sYpvmTXFSrwm288X
	 5U/4V4NeB60fQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/5] i3c: master: dw: Map CCC hardware errors to I3C
 M0/M2
To: tze.yee.ng@altera.com
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, imx@lists.linux.dev, linux-i3c@lists.infradead.org, Frank.Li@kernel.org
In-Reply-To: <7b85402977d59f7f3d28f15fa7005bbfafffbe20.1783074850.git.tze.yee.ng@altera.com>
References: <cover.1783074850.git.tze.yee.ng@altera.com>
 <7b85402977d59f7f3d28f15fa7005bbfafffbe20.1783074850.git.tze.yee.ng@altera.com>
Date: Fri, 03 Jul 2026 10:59:30 +0000
Message-Id: <20260703105931.103B51F00A3F@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gZHdfaTNjX2NjY19z
ZXQoKSBmYWlscyB0byB1c2UgZHdfaTNjX2NjY19tYXBfZXJyKCksIHJlc3VsdGluZyBpbiBpbmNv
bnNpc3RlbnQgTTAgZXJyb3IgbWFwcGluZyBmb3IgQ0NDIFNFVCBjb21tYW5kcwotLQoKY29tbWl0
IDBjZTIyOWIxZTg2ZjQ4ZjhiYzc5NDMzYmVlMDhjN2RhMDkwOWJhZDgKQXV0aG9yOiBBZHJpYW4g
TmcgSG8gWWluIDxhZHJpYW4uaG8ueWluLm5nQGFsdGVyYS5jb20+CgppM2M6IG1hc3RlcjogZHc6
IE1hcCBDQ0MgaGFyZHdhcmUgZXJyb3JzIHRvIEkzQyBNMC9NMgogICAgClRoaXMgY29tbWl0IG1h
cHMgRGVzaWduV2FyZSBJM0MgbWFzdGVyIENDQyBoYXJkd2FyZSBlcnJvcnMgdG8gSTNDIE0wL00y
IGVycm9yCmNvZGVzLiBJdCBpbnRyb2R1Y2VzIGEgbmV3IG1hcHBpbmcgZnVuY3Rpb24gdG8gaGFu
ZGxlIHRoaXMgdHJhbnNsYXRpb24gYW5kCnVwZGF0ZXMgQ0NDIGNvbW1hbmRzIHRvIHVzZSBpdC4K
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci9kdy1pM2MtbWFzdGVyLmMgYi9kcml2
ZXJzL2kzYy9tYXN0ZXIvZHctaTNjLW1hc3Rlci5jCj4gLS0tIGEvZHJpdmVycy9pM2MvbWFzdGVy
L2R3LWkzYy1tYXN0ZXIuYwo+ICsrKyBiL2RyaXZlcnMvaTNjL21hc3Rlci9kdy1pM2MtbWFzdGVy
LmMKWyAuLi4gXQo+IEBAIC03ODEsMTAgKzgwMCw5IEBAIHN0YXRpYyBpbnQgZHdfaTNjX2NjY19n
ZXQoc3RydWN0IGR3X2kzY19tYXN0ZXIgKm1hc3Rlciwgc3RydWN0IGkzY19jY2NfY21kICpjY2Mp
Cj4gIAo+ICAJcmV0ID0geGZlci0+cmV0Owo+ICAJY21kID0gJnhmZXItPmNtZHNbMF07Cj4gKwlj
Y2MtPmVyciA9IGR3X2kzY19jY2NfbWFwX2VycihjbWQtPmVycm9yKTsKPiAgCWlmICghcmV0KQo+
ICAJCWNjYy0+ZGVzdHNbMF0ucGF5bG9hZC5hY3R1YWxfbGVuID0gY21kLT5yeF9sZW47Cj4gLQlp
ZiAoY21kLT5lcnJvciA9PSBSRVNQT05TRV9FUlJPUl9JQkFfTkFDSykKPiAtCQljY2MtPmVyciA9
IEkzQ19FUlJPUl9NMjsKCltTZXZlcml0eTogTWVkaXVtXQpTaG91bGQgZHdfaTNjX2NjY19zZXQo
KSBhbHNvIGJlIHVwZGF0ZWQgdG8gdXNlIHRoZSBuZXcgZHdfaTNjX2NjY19tYXBfZXJyKCkKZnVu
Y3Rpb24/CgpJdCBsb29rcyBsaWtlIGR3X2kzY19jY2NfZ2V0KCkgd2FzIHVwZGF0ZWQgdG8gbWFw
IE0wL00yIGVycm9ycywgYnV0CmR3X2kzY19jY2Nfc2V0KCkgcmV0YWlucyB0aGUgbGVnYWN5IGhh
cmRjb2RlZCBjaGVjazoKCmRyaXZlcnMvaTNjL21hc3Rlci9kdy1pM2MtbWFzdGVyLmM6ZHdfaTNj
X2NjY19zZXQoKSB7Ci4uLgoJcmV0ID0geGZlci0+cmV0OwoJaWYgKHhmZXItPmNtZHNbMF0uZXJy
b3IgPT0gUkVTUE9OU0VfRVJST1JfSUJBX05BQ0spCgkJY2NjLT5lcnIgPSBJM0NfRVJST1JfTTI7
Ci4uLgp9CgpXaXRob3V0IHVzaW5nIHRoZSBuZXcgbWFwcGluZyBmdW5jdGlvbiBoZXJlLCBoYXJk
d2FyZSBlcnJvcnMgKGxpa2UgQ1JDLApQYXJpdHksIG9yIEZyYW1lIGVycm9ycykgZHVyaW5nIEND
QyBTRVQgY29tbWFuZHMgd2lsbCBub3QgYmUgbWFwcGVkIHRvCkkzQ19FUlJPUl9NMCwgcmVzdWx0
aW5nIGluIGluY29uc2lzdGVudCBlcnJvciBoYW5kbGluZyBjb21wYXJlZCB0byBHRVQKY29tbWFu
ZHMuCgo+ICAKPiAgCXJldHVybiByZXQ7Cj4gIH0KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBo
dHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvY292ZXIuMTc4MzA3NDg1MC5naXQudHplLnll
ZS5uZ0BhbHRlcmEuY29tP3BhcnQ9MwoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgt
aTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1pM2MK
