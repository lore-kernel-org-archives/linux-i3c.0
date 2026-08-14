Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF8CC5CFCF
	for <linux-i3c@archiver.kernel.org>; Fri, 14 Aug 2026 04:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZIjs7FdZ7M82Q4Y1MLO8ZgdHKH9GYUrn3CRKXv1Bc7A=; b=I/CBemijErVVKD
	ThSITTdULsUrB6PgCmQnr+jjHDPpPW0K7H7uy9P5nL3t5STUrKs9DZxiZ2tUq0mC9/vhPnyweagJr
	vX1p25VV8KFe92lfeZyEUnPcriBkk8W2zJHH2HStpY3twVyIF4eBM0xaPzGOutHPgyRH9anYI/vOS
	frj2WWZuNGabND7HQ1fJOCDes9DF9Adbhj90KE0lSQbvDQwhQxqvmlkIINYczp6tTFfOQa3ROa1Sp
	9Tut9cBfBBExZKUEVgVS0qk4dT5xJY1txPTYD8fC0XKlNMIMWYpxeaZJwz4vjnpOtjZcEfVdiEoYb
	7rYu4CJWavsEOjG3aVsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wujeR-00000001wQb-12Rb;
	Fri, 14 Aug 2026 04:36:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wujeO-00000001wQV-0D1L
	for linux-i3c@lists.infradead.org;
	Fri, 14 Aug 2026 04:36:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 793F141980;
	Fri, 14 Aug 2026 04:36:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 243011F000E9;
	Fri, 14 Aug 2026 04:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786682171;
	bh=InY+9y+qdwfTM80zhSPKcvSU6yz5fdCqeKIKm6jlcrs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oSTk3iZ6tPajSz/e/8uvtjViItu32iDxngLG1Ry1HYQOsoWOif15q8xjylRXSnPyM
	 GGsKKt/E1deoTDWjprZi2rdQMfG6TXLJf4Bb2bcGNieHuH6gcA/KMSaRwthYdm91o6
	 XD0eiEf4FoO66o9tGJFc8AUAgcf09/OHqPas4VlkbsUFKcY/KbdCn3PKcuiN3WSh1f
	 DtfKhX0Z++8H3tTE7boX9Mg7gMOkGjFcdgUW6tB82whcbsQRmT3fNFQzkFSp6+5nWR
	 OJBFGNnbZlsb+4eXvByZcTPVxEzQpuxqheOgRpWL/wZ7V0wl8JE0qYEeCU10CAxHt6
	 /ysuSaEnCTeXw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] i3c: dw: rename "pclk" to "apb" to match dt-binding
To: "Jisheng Zhang" <jszhang@kernel.org>
Cc: Frank.Li@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, linux-i3c@lists.infradead.org
In-Reply-To: <20260814040345.23033-1-jszhang@kernel.org>
References: <20260814040345.23033-1-jszhang@kernel.org>
Date: Fri, 14 Aug 2026 04:36:10 +0000
Message-Id: <20260814043611.243011F000E9@smtp.kernel.org>
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
IFtIaWdoXSBNaXNzaW5nIGVycm9yIGNoZWNrIGZvciBwbGF0Zm9ybV9nZXRfaXJxKCkgYnJlYWtz
IHByb2JlIGRlZmVycmFsLgotLQoKLS0tIFBhdGNoIFsxXTogW1BBVENIIHYyXSBpM2M6IGR3OiBy
ZW5hbWUgInBjbGsiIHRvICJhcGIiIHRvIG1hdGNoIGR0LWJpbmRpbmcgLS0tCmNvbW1pdCAzNDJh
MzUwNGQ1ZWMwZmIwNWMwOGI5ZGU1MDc2ZmM1NjliY2RjNDNiCkF1dGhvcjogSmlzaGVuZyBaaGFu
ZyA8anN6aGFuZ0BrZXJuZWwub3JnPgoKaTNjOiBkdzogcmVuYW1lICJwY2xrIiB0byAiYXBiIiB0
byBtYXRjaCBkdC1iaW5kaW5nCgpDaGFuZ2UgY2xvY2sgbmFtZSAicGNsayIgdG8gImFwYiIgdG8g
bWF0Y2ggZHQtYmluZGluZyBkb2MuIE5vIHVwc3RyZWFtCmRldmljZSB0cmVlIHNvdXJjZXMgY3Vy
cmVudGx5IHVzZSB0aGUgInBjbGsiIGNsb2NrIG5hbWUsIHNvIG5vIGFueQpiYWNrd2FyZCBjb21w
YXRpYmlsaXR5IGlzc3Vlcy4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci9kdy1p
M2MtbWFzdGVyLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvZHctaTNjLW1hc3Rlci5jCj4gaW5kZXgg
MmY4YzBjNDY4M2UwNi4uMDYyNTU4N2YxNTI3NCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2kzYy9t
YXN0ZXIvZHctaTNjLW1hc3Rlci5jCj4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyL2R3LWkzYy1t
YXN0ZXIuYwo+IEBAIC0xNTc5LDcgKzE1NzksNyBAQCBpbnQgZHdfaTNjX2NvbW1vbl9wcm9iZShz
dHJ1Y3QgZHdfaTNjX21hc3RlciAqbWFzdGVyLAo+ICAJaWYgKElTX0VSUihtYXN0ZXItPmNvcmVf
Y2xrKSkKPiAgCQlyZXR1cm4gUFRSX0VSUihtYXN0ZXItPmNvcmVfY2xrKTsKPiAgCj4gLQltYXN0
ZXItPnBjbGsgPSBkZXZtX2Nsa19nZXRfb3B0aW9uYWxfZW5hYmxlZCgmcGRldi0+ZGV2LCAicGNs
ayIpOwo+ICsJbWFzdGVyLT5wY2xrID0gZGV2bV9jbGtfZ2V0X29wdGlvbmFsX2VuYWJsZWQoJnBk
ZXYtPmRldiwgImFwYiIpOwo+ICAJaWYgKElTX0VSUihtYXN0ZXItPnBjbGspKQo+ICAJCXJldHVy
biBQVFJfRVJSKG1hc3Rlci0+cGNsayk7CgpbIC4uLiBdCgo+ICAJd3JpdGVsKElOVFJfQUxMLCBt
YXN0ZXItPnJlZ3MgKyBJTlRSX1NUQVRVUyk7Cj4gIAlpcnEgPSBwbGF0Zm9ybV9nZXRfaXJxKHBk
ZXYsIDApOwo+ICAJcmV0ID0gZGV2bV9yZXF1ZXN0X2lycSgmcGRldi0+ZGV2LCBpcnEsCj4gIAkJ
CSAgICAgICBkd19pM2NfbWFzdGVyX2lycV9oYW5kbGVyLCAwLAo+ICAJCQkgICAgICAgZGV2X25h
bWUoJnBkZXYtPmRldiksIG1hc3Rlcik7CgpbU2V2ZXJpdHk6IEhpZ2hdClRoaXMgaXNuJ3QgYSBi
dWcgaW50cm9kdWNlZCBieSB0aGlzIHBhdGNoLCBidXQgaXMgaXQgcG9zc2libGUgZm9yCnBsYXRm
b3JtX2dldF9pcnEoKSB0byByZXR1cm4gYSBuZWdhdGl2ZSBlcnJvciBjb2RlIGxpa2UgLUVQUk9C
RV9ERUZFUiBoZXJlPwoKSWYgaXJxIGlzIG5lZ2F0aXZlLCBwYXNzaW5nIGl0IHRvIGRldm1fcmVx
dWVzdF9pcnEoKSB3aXRob3V0IHZhbGlkYXRpb24KY2F1c2VzIGl0IHRvIGZhaWwgd2l0aCAtRUlO
VkFMLCBvdmVycmlkaW5nIHRoZSBvcmlnaW5hbCAtRVBST0JFX0RFRkVSIGVycm9yCmNvZGUuIENv
dWxkIHRoaXMgYnJlYWsgdGhlIHByb2JlIGRlZmVycmFsIG1lY2hhbmlzbSBmb3IgZHdfaTNjX2Nv
bW1vbl9wcm9iZSgpCmluIGRyaXZlcnMvaTNjL21hc3Rlci9kdy1pM2MtbWFzdGVyLmMgYnkgcHJl
dmVudGluZyBpdCBmcm9tIHJldHJ5aW5nIHdoZW4gdGhlCklSUSBjb250cm9sbGVyIGlzIHJlYWR5
PwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNl
dC8yMDI2MDgxNDA0MDM0NS4yMzAzMy0xLWpzemhhbmdAa2VybmVsLm9yZz9wYXJ0PTEKCi0tIAps
aW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
