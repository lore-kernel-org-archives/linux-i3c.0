Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB5AC3065A
	for <linux-i3c@archiver.kernel.org>; Wed, 26 Jun 2024 08:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=54udXa3mzMeoptR62oPZism/lApIUlP++T/WROwFDDo=; b=wJc19GaODeA5ey
	n+JkXfN+9AC8jPbXrrQ2hBogSvuMyWmMnY3BrWjsbYt/82uRKGDFgvM3oUSgdlO1xj3fffZE5q5CY
	0pwSHM57b4sCAumhK66LZ+xBUyEDtH4OjTIo4NeedhW3n9+Rn7/dwHVnnDyOMbWecKpV7hqPi9SoJ
	hsk4UwGTxKR3wKh+Fme2jPQxfeJJ0VZf9JBwLsuKYpzByCpGZCfKM8fohA5loAZrZaelvpdHqGXn9
	ctwqHfz/zvpBgJrM8DaBObE71HPNaaSi5hidNbnl0tuZ6nmhjqbZxRkyMW4OBksHkt45D5ZKRUOPT
	EoO7H+l67BjTytGlQyqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMNrT-00000005t3F-2XsF;
	Wed, 26 Jun 2024 08:18:39 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMNrP-00000005t0p-3IlG
	for linux-i3c@lists.infradead.org;
	Wed, 26 Jun 2024 08:18:37 +0000
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 423DC200EE;
	Wed, 26 Jun 2024 16:18:31 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1719389913;
	bh=tLqxjdvKncjvyf03Lhs0i9bSG7lfZSHlzhwH58h2wN0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=N3WVX5PmAnQAqeowtVcZ488EtThGN08BtJWVXcoy22JwMyw501suKxzDx8T7zKjM2
	 tdVm4H7Pn1oMa3vej7VwUHZPgHzwfS9Lk9oWPVMo8IlmlR2FTpTHH6D5zEM2Sv00dj
	 CPGGtYnzPHAHQpkBQ15TjkVeopHfXc6ozGXDY4xqdmxDhQPRH08C9tDsosQ9ASuBei
	 wsWQlDxHPsZo9T23leb7BrD3BSUb4HQ8K3wdJwJbfIpEg0wLCDBDY4koSuJFhIDI7y
	 TqzW0Ekk7zslyVwI7j3EhZ2n8ItW+kkEz0lyxR9peXgGTZDEagg9R+05/nm13gjsKq
	 4/9zy4Y+pwlfQ==
Message-ID: <b4ba5fa7834fdfb1a1e26ff0e01b9bb235de63b5.camel@codeconstruct.com.au>
Subject: Re: [PATCH 1/2] dt-bindings: i3c: dw: Add property to select IBI ops
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Aniket
 <aniketmaurya@google.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>,  Joel Stanley <joel@jms.id.au>, Billy Tsai
 <billy_tsai@aspeedtech.com>, Rob Herring <robh@kernel.org>,  Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Date: Wed, 26 Jun 2024 16:18:31 +0800
In-Reply-To: <c15045b4-2e5f-4fcc-b25c-76a5e4973e93@linaro.org>
References: <20240626052238.1577580-1-aniketmaurya@google.com>
	 <20240626052238.1577580-2-aniketmaurya@google.com>
	 <e28ba03d1df1c0c5aec987411c40e44fc351ce0d.camel@codeconstruct.com.au>
	 <c15045b4-2e5f-4fcc-b25c-76a5e4973e93@linaro.org>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_011836_091890_AE436A3A 
X-CRM114-Status: GOOD (  13.13  )
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

SGkgS3J5c3p0b2YsCgo+ID4gPiArwqAgaWJpLWNhcGFibGU6Cj4gPiA+ICvCoMKgwqAgZGVzY3Jp
cHRpb246IFNldCB0byBzZWxlY3QgSUJJIG9wcy4KPiAKPiBXaGF0IGFyZSBJQkkgb3BzPyBTdGFu
ZGFyZCBmb3JtIGxldHRlcjoKPiAKPiBZb3UgZGVzY3JpYmVkIHRoZSBkZXNpcmVkIExpbnV4IGZl
YXR1cmUgb3IgYmVoYXZpb3IsIG5vdCB0aGUgYWN0dWFsCj4gaGFyZHdhcmUuCgpJbiB0aGlzIGNh
c2UgaXQgaXMgdGhlIGFjdHVhbCBoYXJkd2FyZTsgbXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IHRo
ZQpnYXRld2FyZSBJUCBjYW4gYmUgY29uZmlndXJlZCB0byBzdXBwb3J0IGluLWJhbmQtaW50ZXJy
dXB0cyBvciBub3QsCmJlZm9yZSBiZWluZyBiYWtlZC1pbiB0byBoYXJkd2FyZS4KCj4gPiBXb3Vs
ZG4ndCB0aGUgY29tcGF0aWJsZSBzdHJpbmcgc2VsZWN0IHdoZXRoZXIgdGhlIGhhcmR3YXJlIGlu
c3RhbmNlCj4gPiBzdXBwb3J0cyBJQkkgb3Igbm90Pwo+ID4gCj4gPiBJJ2QgaW1hZ2luZSB0aGF0
IGVhY2ggc3BlY2lmaWMgc3ludGhlc2lzIG9mIHRoZSBEVyBJUCB3b3VsZCBpbXBseQo+ID4gY29y
cmVzcG9uZGluZyBoYXJkd2FyZSBzZXR0aW5ncywgYW5kIHNvIHdvdWxkIHdhcnJhbnQgaXRzIG93
bgo+ID4gY29tcGF0aWJsZQo+ID4gdmFsdWUuCj4gPiAKPiA+IE1heWJlIG9uZSBmb3IgdGhlIERU
IGZvbGtzOiB3b3VsZCB0aGlzIHdvcmsgYmV0dGVyIGFzIGluZGl2aWR1YWwKPiA+IHByb3BlcnRp
ZXM/IElzIHRoZXJlIGEgcG9saWN5IGhlcmU/Cj4gCj4gVXN1YWxseSBpZiBmZWF0dXJlIGlzIHNw
ZWNpZmljIHRvIGdpdmVuIGhhcmR3YXJlLCBlLmcuIGFsd2F5cyBjYXBhYmxlCj4gb2YgZm9vYmFy
LCB0aGVuIGl0IGNhbiBiZSBkZWR1Y2VkIGZyb20gY29tcGF0aWJsZSwgc28gbm8gbmVlZCBmb3Ig
bmV3Cj4gcHJvcGVydHkuCgpTb3VuZHMgZ29vZC4KCkFuaWtldDogdGhlIGhhcmR3YXJlIHlvdSdy
ZSBkZWFsaW5nIHdpdGggdGhlcmUgbWF5IG5lZWQgYSBuZXcsIHNwZWNpZmljCmNvbXBhdGlibGUg
cHJvcGVydHksIHdoaWNoIHdpbGwgZGljdGF0ZSB3aGV0aGVyIHdlIGVuYWJsZSBJQklzIGluIHRo
ZQpkcml2ZXIuCgpGb3IgY2FzZXMgd2hlcmUgbm8gb3RoZXIgc3BlY2lhbCBiZWhhdmlvdXIgaXMg
cmVxdWlyZWQsIHdlIGNhbgpyZXByZXNlbnQgdGhpcyBqdXN0IGFzIGFuIGVudHJ5IGluIHRoZSBP
RiBtYXRjaCB0YWJsZS4KCkNoZWVycywKCgpKZXJlbXkKCi0tIApsaW51eC1pM2MgbWFpbGluZyBs
aXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
