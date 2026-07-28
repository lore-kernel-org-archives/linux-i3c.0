Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1747C53219
	for <linux-i3c@archiver.kernel.org>; Tue, 28 Jul 2026 07:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cjkHXTwYqN96LZn+yM2HBQgKM6eC6jQIZEz1ctbsn3g=; b=mMGEPPTG4ipFje
	gWwvNJYgy0GbHVnaubxF34Nw6r+tqchreyWNriGLQFei/gS/FL2jGaFIXAgcKIjubvYkJxDDvfApk
	GM+5iCmSditamQH17m9FDfT4XLm57Zv8bs0Q4zflHUGDsXH0sclG2We/ScR9fbY4vb+Kb4Qoa0EfK
	wZj07GcCBYa/46JGtLS9Fu115rO+q3Dm2ZKVdkf1/Yv32Ntj+VbUBUrtYAZsU3f1AjxtIj1j8Kw4S
	7lrqMCPU/yQw8J06/XUlCiYc++eNWuimrKuJiikC7u34ELlSewj/VEqSwiM4hwcZJ9ig2d0GgCs6A
	WkuT7qMTXe3zJ/X+ZLBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wobvn-00000004c4X-29Mn;
	Tue, 28 Jul 2026 07:08:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wobvl-00000004c4H-3aVr
	for linux-i3c@lists.infradead.org;
	Tue, 28 Jul 2026 07:08:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5C4A242DE8;
	Tue, 28 Jul 2026 07:08:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBE801F000E9;
	Tue, 28 Jul 2026 07:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785222529;
	bh=55A3f7h+OAAIgPZfAQMgR2SUEVtD5lmHb79C6kwLmpY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hR5Mvv++54XnWDhOv9KvdV1CsJruUv3ifVQYt7ggf+Tb6L4dpEow4qAuRdor5giGL
	 OiBEZ1t8OEdGzGzCndMYQBQWMVfGGsA+Ei9qHymnE3AIE6VfK9PphsjMVARWfagE7X
	 UZtfWcbQlYrGVI57JPjvCSAe9HRKthA1psjYWoaNVQkSUfkr817HmjloEwughnhZOD
	 qe0105C8QuXCPeAo3SvwQVje/vMmUnYwJn1LId+fP4HBpXwkmU96Jlihq6QYFiUjdX
	 Q7KUPE3mrU+hs5wG9Wkz/PSjT59xKCl9pEEj7Dz6tA64LACjZ9BGffbmZ6Wlyb7FLQ
	 RndgvlNYySt3w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 01/12] dt-bindings: i3c: Add mipi-i3c-static-method
 to support SETAASA
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: linux-i3c@lists.infradead.org, Frank.Li@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260728065955.809445-2-akhilrajeev@nvidia.com>
References: <20260728065955.809445-1-akhilrajeev@nvidia.com>
 <20260728065955.809445-2-akhilrajeev@nvidia.com>
Date: Tue, 28 Jul 2026 07:08:48 +0000
Message-Id: <20260728070848.CBE801F000E9@smtp.kernel.org>
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

PiBBZGQgdGhlICdtaXBpLWkzYy1zdGF0aWMtbWV0aG9kJyBwcm9wZXJ0eSBtZW50aW9uZWQgaW4g
dGhlIE1JUEkgSTNDCj4gRGlzY292ZXJ5IGFuZCBDb25maWd1cmF0aW9uIFNwZWNpZmljYXRpb24g
WzFdIHRvIHNwZWNpZnkgd2hpY2ggZGlzY292ZXJ5Cj4gbWV0aG9kIGFuIEkzQyBkZXZpY2Ugc3Vw
cG9ydHMgZHVyaW5nIGJ1cyBpbml0aWFsaXphdGlvbi4gVGhlIHByb3BlcnR5IGlzCj4gYSBiaXRt
YXAsIHdoZXJlIGEgYml0IHZhbHVlIG9mIDEgaW5kaWNhdGVzIHN1cHBvcnQgZm9yIHRoYXQgbWV0
aG9kLCBhbmQgMAo+IGluZGljYXRlcyBsYWNrIG9mIHN1cHBvcnQuCj4gCj4gQml0IDA6IFNFVERB
U0EgQ0NDIChEaXJlY3QpCj4gQml0IDE6IFNFVEFBU0EgQ0NDIChCcm9hZGNhc3QpCj4gQml0IDI6
IE90aGVyIENDQyAodmVuZG9yIC8gc3RhbmRhcmRzIGV4dGVuc2lvbikKPiBBbGwgb3RoZXIgYml0
cyBhcmUgcmVzZXJ2ZWQuCj4gCj4gSXQgaXMgc3BlY2lmaWNhbGx5IG5lZWRlZCB3aGVuIGFuIEkz
QyBkZXZpY2UgcmVxdWlyZXMgU0VUQUFTQSBmb3IgdGhlCj4gYWRkcmVzcyBhc3NpZ25tZW50LiBT
RVREQVNBIHdpbGwgYmUgc3VwcG9ydGVkIGJ5IGRlZmF1bHQgaWYgdGhpcyBwcm9wZXJ0eQo+IGlz
IGFic2VudCwgd2hpY2ggbWVhbnMgZm9yIG5vdyB0aGUgcHJvcGVydHkganVzdCBzZXJ2ZXMgYXMg
YSBmbGFnIHRvCj4gZW5hYmxlIFNFVEFBU0EsIGJ1dCBrZWVwIHRoZSBwcm9wZXJ0eSBhcyBhIGJp
dG1hcCB0byBhbGlnbiB3aXRoIHRoZQo+IHNwZWNpZmljYXRpb25zLgo+IAo+IFsxXSBodHRwczov
L3d3dy5taXBpLm9yZy9taXBpLWRpc2NvLWZvci1pM2MtZG93bmxvYWQKPiAKPiBSZXZpZXdlZC1i
eTogRnJhbmsgTGkgPEZyYW5rLkxpQG54cC5jb20+Cj4gUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5n
IChBcm0pIDxyb2JoQGtlcm5lbC5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogQWtoaWwgUiA8YWtoaWxy
YWplZXZAbnZpZGlhLmNvbT4KClNhc2hpa28gaGFzIHJldmlld2VkIHRoaXMgcGF0Y2ggYW5kIGZv
dW5kIG5vIGlzc3Vlcy4gSXQgbG9va3MgZ3JlYXQhCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcg
aHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNzI4MDY1OTU1LjgwOTQ0NS0xLWFr
aGlscmFqZWV2QG52aWRpYS5jb20/cGFydD0xCgoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QK
bGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
