Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F302C3064D
	for <linux-i3c@archiver.kernel.org>; Wed, 26 Jun 2024 05:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xFFAYDtwdcARpDUafXvI8k2n2zRhdNBRsd8Dy/D/YvI=; b=g1OV66XlytaqG5
	/Os4enjqMNxdE/9ucjx8PnYocSEsfaTkpSV9z9aOuJK07lg6Va5BMTIteq1H+EztnmvIESWslyZgC
	P4SxvK98wM5HAfD/LYDbRP+k7zjeaT3B7V2MA7xREJmhipE/OYiGcKEQ9kmqJ8b52JaNRUjUpEXUG
	y5PY7xrK0N0C8Q8kUOmlRB3uyxLnlITKGL/2YfkSZkefzXu0eBMnqLK+o1DILPE3AcbySokfDvhza
	L/0DlrbMiyrt+CUKc1maKEHHhGhX0tyd3Oz/JrPu6vHj1HM2naIlrXVHCYtLNKpT/8Ht3qVUFQ14U
	zGwjtdaD46xznfDqWChw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMLFU-00000005TRK-3IBa;
	Wed, 26 Jun 2024 05:31:16 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMLFP-00000005TQV-34SP
	for linux-i3c@lists.infradead.org;
	Wed, 26 Jun 2024 05:31:14 +0000
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 11F26200EE;
	Wed, 26 Jun 2024 13:31:04 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1719379865;
	bh=NIIeRlWHaxb09V9dg0z4qNkA9Cj1y8ioeds9a+gbdOY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=V6EVfghTHDYqGTpn9rV2DeCzb7jid9YDiNqslxOtmFb334Bf6lz+HvLz2UaW7xErs
	 0w42Zuj8mtkbxxO988asuqmkpQV5K1KeEqjAAvuTVljsNY75yPZ100zG4KCcGls2p/
	 pq7DTjetBT8h8F4BvKX88G6LlSofEFbDYeGVSS+bT124fFkednk7Oe/XgW+JJsLzUr
	 T+AYOHo4fmXl6GFZXHHqqTw85xOE0UmTUN+wo9apNsneiOjA9kFrnS0nstNmMUa1hR
	 x/gGi5BAC6Lxbsefro46+tqQT3xO23L9q7gKjqcJ+BtMIVD+cRwx4CCB0bbzmQeqdf
	 /4ANhcRlmcPuA==
Message-ID: <e28ba03d1df1c0c5aec987411c40e44fc351ce0d.camel@codeconstruct.com.au>
Subject: Re: [PATCH 1/2] dt-bindings: i3c: dw: Add property to select IBI ops
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Aniket <aniketmaurya@google.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Joel Stanley <joel@jms.id.au>, Billy Tsai
 <billy_tsai@aspeedtech.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Date: Wed, 26 Jun 2024 13:31:03 +0800
In-Reply-To: <20240626052238.1577580-2-aniketmaurya@google.com>
References: <20240626052238.1577580-1-aniketmaurya@google.com>
	 <20240626052238.1577580-2-aniketmaurya@google.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_223112_100041_350B7ED8 
X-CRM114-Status: UNSURE (   6.58  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

SGkgQW5pa2V0LAoKPiBVc2UgdGhpcyBwcm9wZXJ0eSB0byBzZWxlY3QgSUJJIHJlbGF0ZWQgb3Bz
IGluIHRoZSBiYXNlIHBsYXRmb3JtCj4gZHJpdmVyLiBPdGhlcndpc2UgdGhlIGRyaXZlciBkZWZh
dWx0cyB0byByZXR1cm4gRUlOVkFMIGZvciBhbnkgSUJJCj4gcmVxdWVzdHMuCgpbLi4uXQoKPiAt
LS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTNjL3NucHMsZHctaTNjLW1h
c3Rlci55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kzYy9z
bnBzLGR3LWkzYy1tYXN0ZXIueWFtbAo+IEBAIC0yNSw2ICsyNSwxMCBAQCBwcm9wZXJ0aWVzOgo+
IMKgwqAgaW50ZXJydXB0czoKPiDCoMKgwqDCoCBtYXhJdGVtczogMQo+IMKgCj4gK8KgIGliaS1j
YXBhYmxlOgo+ICvCoMKgwqAgZGVzY3JpcHRpb246IFNldCB0byBzZWxlY3QgSUJJIG9wcy4KPiAr
wqDCoMKgIHR5cGU6IGJvb2xlYW4KPiArCgpXb3VsZG4ndCB0aGUgY29tcGF0aWJsZSBzdHJpbmcg
c2VsZWN0IHdoZXRoZXIgdGhlIGhhcmR3YXJlIGluc3RhbmNlCnN1cHBvcnRzIElCSSBvciBub3Q/
CgpJJ2QgaW1hZ2luZSB0aGF0IGVhY2ggc3BlY2lmaWMgc3ludGhlc2lzIG9mIHRoZSBEVyBJUCB3
b3VsZCBpbXBseQpjb3JyZXNwb25kaW5nIGhhcmR3YXJlIHNldHRpbmdzLCBhbmQgc28gd291bGQg
d2FycmFudCBpdHMgb3duIGNvbXBhdGlibGUKdmFsdWUuCgpNYXliZSBvbmUgZm9yIHRoZSBEVCBm
b2xrczogd291bGQgdGhpcyB3b3JrIGJldHRlciBhcyBpbmRpdmlkdWFsCnByb3BlcnRpZXM/IElz
IHRoZXJlIGEgcG9saWN5IGhlcmU/CgpDaGVlcnMsCgoKSmVyZW15CgotLSAKbGludXgtaTNjIG1h
aWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
