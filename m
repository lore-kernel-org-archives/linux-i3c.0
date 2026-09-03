Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36263C61DD3
	for <linux-i3c@archiver.kernel.org>; Thu,  3 Sep 2026 06:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p2nkqcbLxJRVnWZw2dPkeh2nq2ucIYVaGEFI3FYxa4E=; b=p/mXYSTgB826gs
	AC77kQJCdQSBW4ZlNnNVB0EpWD5rjP392+McRIMd59d14jsDUejHPCBBnlJbhy35UsgJ7PVFnEM+X
	iUEIuK4oGEecadp1OR4oQtr7E/2Fj6yIiF55VpdetxK6QkF3Yb/KScmiJ0M79KSur9Hsv9nJ7E3+h
	gysjTSQH8mffW8XqJPnyycrx/dOqGf9d2En8fIdzv2xyeZbkf55V6LiwufbytJou690Cit8R6FP/q
	qDove8xXWDRo3rC4a0iQtjgnLwt+g7fgXXLJ5KtfF7C2l2gKO7sq9Lqa1646DGRDI4gkjFC3Cm0C/
	jBk0xkajtsNiPkZ//I0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x20zK-0000000GUne-3iQV;
	Thu, 03 Sep 2026 06:31:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x20zK-0000000GUnY-075U
	for linux-i3c@lists.infradead.org;
	Thu, 03 Sep 2026 06:31:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 42ED160235;
	Thu,  3 Sep 2026 06:31:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 861631F000E9;
	Thu,  3 Sep 2026 06:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788417113;
	bh=eXRYvuoWhjpAFAs56As7/B0zK4Nhewhv/Z99ghulzgA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O0Slg1B8lcydoOczFHYJF6kEDE0yyhOpXQXwNLxRARhN8o0RguXLYJVFKAgQ/F4mh
	 ZZjyczu/iFG0gY4HVilD6He62Tuof/X8xZqhVgHWA01F5KsMir3BrnIBvYIm3119Wm
	 CnRfJQebNSPrbekWx8etV1+FkpdQNmmidthRsXbeVGI5ASc0Sb7YVoqsDGqXSjnL5D
	 kId7a7kQ1jetiEHu+rlIj+VPdnDMHBOf4vb+qcdcpqv+wiCDtUkaCJnKg8HGuJCzCV
	 mscU7AWGYomr+T1s08tbUHOu/t6lP8ZTz9DH87AT2NME/ptjmafsHM4JhDLzvqUsNt
	 k/MiFxqURZm7Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 5/8] regulator: p3h2x4x: Add driver for on-die
 regulators in NXP P3H2x4x i3c hub
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, linux-i3c@lists.infradead.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260903062108.2712296-6-lakshay.piplani@nxp.com>
References: <20260903062108.2712296-1-lakshay.piplani@nxp.com>
 <20260903062108.2712296-6-lakshay.piplani@nxp.com>
Date: Thu, 03 Sep 2026 06:31:52 +0000
Message-Id: <20260903063152.861631F000E9@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gRHJpdmVyLXNwZWNpZmlj
IGhlYWRlciBwbGFjZWQgaW4gdGhlIGdsb2JhbCBpbmNsdWRlL2xpbnV4L21mZC8gZGlyZWN0b3J5
LgotLQoKY29tbWl0IGNiYWEwNzUwNmUxZTMzYWQ5MzJkMmIwZDJkMzhlZGZiNDQzN2FkYzEKQXV0
aG9yOiBBbWFuIEt1bWFyIFBhbmRleSA8YW1hbi5rdW1hcnBhbmRleUBueHAuY29tPgoKcmVndWxh
dG9yOiBwM2gyeDR4OiBBZGQgZHJpdmVyIGZvciBvbi1kaWUgcmVndWxhdG9ycyBpbiBOWFAgUDNI
Mng0eCBpM2MgaHViCgpUaGlzIGNvbW1pdCBhZGRzIGEgcmVndWxhdG9yIGRyaXZlciBmb3IgdGhl
IG9uLWRpZSByZWd1bGF0b3JzIGluIHRoZSBOWFAgClAzSDJ4NHggaTNjIGh1Yi4gVGhlIGRyaXZl
ciByZWdpc3RlcnMgdGhlIHJlZ3VsYXRvcnMgdXNpbmcgdGhlIE1GRCBmcmFtZXdvcmsgCmFuZCBl
eHBvc2VzIHRoZW0gdmlhIHRoZSByZWd1bGF0b3Igc3Vic3lzdGVtLgoKPiBkaWZmIC0tZ2l0IGEv
TUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwo+IGluZGV4IGQ0ODJhMjNjMGJmNzguLmJkZjU0MzEz
YmM1ZjYgMTAwNjQ0Cj4gLS0tIGEvTUFJTlRBSU5FUlMKPiArKysgYi9NQUlOVEFJTkVSUwo+IEBA
IC0xOTc3Miw2ICsxOTc3Miw3IEBAIEw6CWxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCj4g
IFM6CU1haW50YWluZWQKPiAgRjoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kz
Yy9ueHAscDNoMjg0MC55YW1sCj4gIEY6CWRyaXZlcnMvbWZkL3AzaDI4NDAuYwo+ICtGOglkcml2
ZXJzL3JlZ3VsYXRvci9wM2gyODQwX2kzY19odWJfcmVndWxhdG9yLmMKPiAgRjoJaW5jbHVkZS9s
aW51eC9tZmQvcDNoMjg0MC5oCgpbIC4uLiBdCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3JlZ3Vs
YXRvci9wM2gyODQwX2kzY19odWJfcmVndWxhdG9yLmMgYi9kcml2ZXJzL3JlZ3VsYXRvci9wM2gy
ODQwX2kzY19odWJfcmVndWxhdG9yLmMKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAw
MDAwMDAwMDAwMDAuLjI0NGYyYTRmNzBmMzgKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvZHJpdmVy
cy9yZWd1bGF0b3IvcDNoMjg0MF9pM2NfaHViX3JlZ3VsYXRvci5jCj4gQEAgLTAsMCArMSwyODkg
QEAKPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPiArLyoKPiArICogQ29w
eXJpZ2h0IDIwMjUtMjAyNiBOWFAKPiArICogTlhQIFAzSDJYNFggcmVndWxhdG9yIGRyaXZlciBm
aWxlIGNvbnRhaW4gZnVuY3Rpb25zIGZvciBlbmFibGUvZGlzYWJsZSByZWd1bGF0b3IKPiArICog
YW5kIHZvbHRhZ2Ugc2V0L2dldC4KPiArICovCj4gKyNpbmNsdWRlIDxsaW51eC9iaXRmaWVsZC5o
Pgo+ICsjaW5jbHVkZSA8bGludXgvY2xlYW51cC5oPgo+ICsjaW5jbHVkZSA8bGludXgvbWZkL3Az
aDI4NDAuaD4KCltTZXZlcml0eTogTG93XQpEb2VzIHRoaXMgZHJpdmVyIGluY2x1ZGUgYSBzaGFy
ZWQgaGVhZGVyIGZyb20gdGhlIGdsb2JhbGx5IGV4cG9ydGVkIGluY2x1ZGUKcGF0aCByYXRoZXIg
dGhhbiBrZWVwaW5nIGl0IGxvY2FsPwoKVGhlIE1GRCBzdWJzeXN0ZW0gZ3VpZGVsaW5lcyBzdGF0
ZSB0aGF0IGRyaXZlci1zcGVjaWZpYyBoZWFkZXIgZmlsZXMgc2hvdWxkCmJlIGtlcHQgbG9jYWwg
dG8gZHJpdmVycy9tZmQvIGlmIHRoZXkgYXJlIG9ubHkgdXNlZCBieSB0aGUgcGFyZW50IGFuZCBp
dHMKaW1tZWRpYXRlIGNoaWxkcmVuLiBTaG91bGQgcDNoMjg0MC5oIGJlIG1vdmVkIG91dCBvZiB0
aGUgZ2xvYmFsIG5hbWVzcGFjZQppZiBpdCBpcyBvbmx5IHVzZWQgYnkgdGhpcyBkZXZpY2UgZmFt
aWx5PwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRj
aHNldC8yMDI2MDkwMzA2MjEwOC4yNzEyMjk2LTEtbGFrc2hheS5waXBsYW5pQG54cC5jb20/cGFy
dD01CgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkz
Ywo=
