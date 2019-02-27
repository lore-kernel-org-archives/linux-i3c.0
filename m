Return-Path: <SRS0=2aCG=RD=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D91EC43381
	for <linux-i3c@archiver.kernel.org>; Thu, 28 Feb 2019 19:35:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73FD1218B0
	for <linux-i3c@archiver.kernel.org>; Thu, 28 Feb 2019 19:35:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VhJ7IVYb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="OGptlor0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73FD1218B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MKXOkV59Lo2OpFVak9xWW/Xn+PiRymLeZtcwyhHDwyw=; b=VhJ7IVYbPJ1t2P
	rlDRtU0sGugHIGljGB4cs/9uyUrXFm99NeTkBQlVwB9qMChw/p248qkJBNsM4olmBLJVGzEvWW7bL
	4oKmwzFJrYBxGux5ottwMgEhu5QGXFD2f+ou7rlmzH6a5PlfgdLjQzYwds1h7oPHyf0AD++7r59VQ
	oXuHTT0aIxYnTiz7NFjkJlGS5SqPvl35KDIuJZTpQNVVTJHg6UeKEYVdcrIb3suJpG68coZU7wQ6k
	vkQhcIOGUP78BDdfMyazeERDGTnfwRjakWRHOJ0RwXQk+oc27/LhmQGW/EbqbWuj9+FuTh5GyIqpV
	l9FcDBkcwlQ5y1LUM1+Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzRSi-0007yl-0T; Thu, 28 Feb 2019 19:35:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gyuLX-0002Rc-91
 for linux-i3c@lists.infradead.org; Wed, 27 Feb 2019 08:13:44 +0000
Received: from localhost (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 53814218CD;
 Wed, 27 Feb 2019 08:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1551255221;
 bh=KzKZUEW649tkM4fhsxinvnskLJSE+xoI3Ct2N6Jk0c4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OGptlor0t2hRqIxVpiPqt/k8QJFMM1J2pKKQDgTToLNj3kZ/ooq3FuNxVHyH0NHA+
 m7V3K3X1CyCZlWLTMVrCpGdFZzDkkv/xaPN8L8dfAfBrZYxTMnGEw05cXxKXD1Z8de
 T79ykR1BCuwaozS/rx2jHCyocvBi6jOzKwAGzitQ=
Date: Wed, 27 Feb 2019 09:13:35 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH] i3c: master: dw-i3c-master: mark expected switch
 fall-through
Message-ID: <20190227091335.2a19e2a7@kernel.org>
In-Reply-To: <87e0a8c9-82f6-3f41-bdb6-162a4c264132@embeddedor.com>
References: <20190211221413.GA21822@embeddedor>
 <87e0a8c9-82f6-3f41-bdb6-162a4c264132@embeddedor.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190227_001343_335878_E414C01E 
X-CRM114-Status: GOOD (  16.57  )
X-Mailman-Approved-At: Thu, 28 Feb 2019 11:35:18 -0800
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Vitor Soares <vitor.soares@synopsys.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAyNiBGZWIgMjAxOSAyMTo1MzoxNiAtMDYwMAoiR3VzdGF2byBBLiBSLiBTaWx2YSIg
PGd1c3Rhdm9AZW1iZWRkZWRvci5jb20+IHdyb3RlOgoKPiBIaSBhbGwsCj4gCj4gRnJpZW5kbHkg
cGluZzoKPiAKPiBXaG8gY2FuIGFjayBvciByZXZpZXcgdGhpcywgcGxlYXNlPwoKV2lsbCBiZSBx
dWV1ZWQgZm9yIHRoZSBuZXh0IHJlbGVhc2UuIFBsZWFzZSBiZSBwYXRpZW50LgoKPiAKPiBUaGFu
a3MKPiAtLQo+IEd1c3Rhdm8KPiAKPiBPbiAyLzExLzE5IDQ6MTQgUE0sIEd1c3Rhdm8gQS4gUi4g
U2lsdmEgd3JvdGU6Cj4gPiBJbiBwcmVwYXJhdGlvbiB0byBlbmFibGluZyAtV2ltcGxpY2l0LWZh
bGx0aHJvdWdoLCBtYXJrIHN3aXRjaAo+ID4gY2FzZXMgd2hlcmUgd2UgYXJlIGV4cGVjdGluZyB0
byBmYWxsIHRocm91Z2guCj4gPiAKPiA+IFRoaXMgcGF0Y2ggZml4ZXMgdGhlIGZvbGxvd2luZyB3
YXJuaW5nOgo+ID4gCj4gPiBkcml2ZXJzL2kzYy9tYXN0ZXIvZHctaTNjLW1hc3Rlci5jOiBJbiBm
dW5jdGlvbiDigJhkd19pM2NfbWFzdGVyX2J1c19pbml04oCZOgo+ID4gZHJpdmVycy9pM2MvbWFz
dGVyL2R3LWkzYy1tYXN0ZXIuYzo2MDM6Njogd2FybmluZzogdGhpcyBzdGF0ZW1lbnQgbWF5IGZh
bGwgdGhyb3VnaCBbLVdpbXBsaWNpdC1mYWxsdGhyb3VnaD1dCj4gPiAgICBpZiAocmV0KQo+ID4g
ICAgICAgXgo+ID4gZHJpdmVycy9pM2MvbWFzdGVyL2R3LWkzYy1tYXN0ZXIuYzo2MDU6Mjogbm90
ZTogaGVyZQo+ID4gICBjYXNlIEkzQ19CVVNfTU9ERV9QVVJFOgo+ID4gICBefn5+Cj4gPiAKPiA+
IFdhcm5pbmcgbGV2ZWwgMyB3YXMgdXNlZDogLVdpbXBsaWNpdC1mYWxsdGhyb3VnaD0zCj4gPiAK
PiA+IFRoaXMgcGF0Y2ggaXMgcGFydCBvZiB0aGUgb25nb2luZyBlZmZvcnRzIHRvIGVuYWJsZQo+
ID4gLVdpbXBsaWNpdC1mYWxsdGhyb3VnaC4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogR3VzdGF2
byBBLiBSLiBTaWx2YSA8Z3VzdGF2b0BlbWJlZGRlZG9yLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZl
cnMvaTNjL21hc3Rlci9kdy1pM2MtbWFzdGVyLmMgfCAxICsKPiA+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci9k
dy1pM2MtbWFzdGVyLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvZHctaTNjLW1hc3Rlci5jCj4gPiBp
bmRleCBiYjAzMDc5ZmJhZGUuLjU5Mjc5MjI0ZTA3ZiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMv
aTNjL21hc3Rlci9kdy1pM2MtbWFzdGVyLmMKPiA+ICsrKyBiL2RyaXZlcnMvaTNjL21hc3Rlci9k
dy1pM2MtbWFzdGVyLmMKPiA+IEBAIC02MDIsNiArNjAyLDcgQEAgc3RhdGljIGludCBkd19pM2Nf
bWFzdGVyX2J1c19pbml0KHN0cnVjdCBpM2NfbWFzdGVyX2NvbnRyb2xsZXIgKm0pCj4gPiAgCQly
ZXQgPSBkd19pMmNfY2xrX2NmZyhtYXN0ZXIpOwo+ID4gIAkJaWYgKHJldCkKPiA+ICAJCQlyZXR1
cm4gcmV0Owo+ID4gKwkJLyogZmFsbCB0aHJvdWdoICovCj4gPiAgCWNhc2UgSTNDX0JVU19NT0RF
X1BVUkU6Cj4gPiAgCQlyZXQgPSBkd19pM2NfY2xrX2NmZyhtYXN0ZXIpOwo+ID4gIAkJaWYgKHJl
dCkKPiA+ICAgCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
