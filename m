Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3157EC001DB
	for <linux-i3c@archiver.kernel.org>; Wed,  9 Aug 2023 03:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2cykfw5zoj0kif3ZWNj3PI6XeE0SAO+8PcLMJ1QTsHg=; b=pS3MZxS6TwQbqR
	PCZYz07JsPunVmdNJpIh+ZO4yiwX8NBOATi5tXWB29ATbIQZTJUyNOw5iKmKgxzkWKANpY7ljbYOM
	R2oRJykH0KWe3ojp0GvJBk5HlWIox0tuhu/YRlRqCCfl6SNqqXfT/vp8YS80rRDGNMPbvsbFriQIN
	rH61EYjbS8XiucCoO5QLfyUohGvh6oR2CbepQEu0uxdCfKJZQ5vEvyOGgFXse1vPNeq1RkX39c5yA
	r+HHkaHT7rGrHDin5PIQ+m9OonRxWdT0r8Al1QpX+aUvyLnyV0yEkARI+ez8JtF96t9jMKDGfQbeK
	XI0QppkXinmVyxdjcJ3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTZdA-003vdC-1f;
	Wed, 09 Aug 2023 03:13:04 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTZd7-003vcE-1v;
	Wed, 09 Aug 2023 03:13:02 +0000
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 4317A20187;
	Wed,  9 Aug 2023 11:12:52 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1691550774;
	bh=i9oOIE6u25Hq6JcvLXnIndm0EgUPWueH7dpZORcm6s0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=BfoxO+o34AYXS6056PPsw4uzxqv0EsEoUSObxAmlPjdJwdn4eKucLcrZBjra1e80o
	 cx0MTHGXvzFP2uC9B4okjn8ErRFg0+MbcxbpezxFGglsH/OmChpVGB6kYGic8/U0oe
	 jJk7zTl7pHzYUdgrfKQBJMLMT5hXOyY6V5coM71OPc+XqshcsDrgTpM8B/GZVCDg+n
	 sYJJBN6ZXfNNXbJG0rcadMH3sty2NEVaxH+DakbqPJwQZRW8WsLUDogoF46p7cOcB7
	 YN/fxxaD5e/8x5bA5PBVmaZYKCPrsMNJ7R1h0zCU1o7JDGmvEA7hgKUowgXumnbUfe
	 fk4Kz4fHI2KFg==
Message-ID: <ee48336f94f7e32de81e1f07facf0663c70091b0.camel@codeconstruct.com.au>
Subject: Re: [PATCH 0/3] Add Aspeed AST2600 I3C support
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Dylan Hung <dylan_hung@aspeedtech.com>, "alexandre.belloni@bootlin.com"
 <alexandre.belloni@bootlin.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
  "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,  "joel@jms.id.au"
 <joel@jms.id.au>, "andrew@aj.id.au" <andrew@aj.id.au>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Cc: BMC-SW <BMC-SW@aspeedtech.com>, "kobedylan@gmail.com"
 <kobedylan@gmail.com>
Date: Wed, 09 Aug 2023 11:12:51 +0800
In-Reply-To: <TYZPR06MB65674B8AA26D959254101A749C12A@TYZPR06MB6567.apcprd06.prod.outlook.com>
References: <20230808154241.749641-1-dylan_hung@aspeedtech.com>
	 <d8d577e91779e045d5a2c7d701f65133a15b5d64.camel@codeconstruct.com.au>
	 <TYZPR06MB65674B8AA26D959254101A749C12A@TYZPR06MB6567.apcprd06.prod.outlook.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_201301_828862_3DFEFFC1 
X-CRM114-Status: GOOD (  10.43  )
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

SGkgRHlsYW4sCgo+IFRoYW5rIHlvdSBmb3IgeW91ciByZXZpZXcuIEkzQzEgYW5kIEkzQzIgY2Fu
IG9ubHkgb3BlcmF0ZSBpbiBsb3cKPiB2b2x0YWdlICgxLjBWLzEuMlYpLCB3aGljaCBpcyB3aHkg
dGhlcmUgYXJlIG5vIEhWSTNDMSBhbmQgSFZJM0MyCj4gcGluY3RybCBkZWZpbml0aW9ucy4KClll
cCwgYW5kIHRoYXQgd2FzIGNvbmZpZyB0aGF0IEkgaGFkbid0IHRlc3RlZCAoc28gaGFkbid0IHBy
b3Bvc2VkCnBpbmN0cmwgZGVmaW5pdGlvbnMgZm9yIHRob3NlKS4KCj4gPiBGb3IgMi8zIGFuZCAz
LzMsIHlvdSdyZSBhZGRpbmcgYSByZXNldCBjb250cm9sIGZvciB0aGUgZ2xvYmFsCj4gPiByZWdp
c3RlciBibG9jayB3aXRoaW4gdGhlIHBlci1jb250cm9sbGVyIGRyaXZlciwgYnV0IHdlIGNhbiBh
bHJlYWR5Cj4gPiBkbyB0aGF0IG9uIGEgZ2xvYmFsIGJhc2lzIHdpdGggdGhlIGV4aXN0aW5nIHN5
c2NvbiBkZXZpY2UuIEhlbmNlCj4gPiB0aGlzIGVhcmxpZXIgY2hhbmdlOgo+IMKgCj4gSSBmb2xs
b3dlZCB5b3VyIHJlY29tbWVuZGF0aW9uIGFuZCB2ZXJpZmllZCB0aGF0IGl0IHdvcmtlZCBvbiBt
eSBlbmQuCgpPSywgZXhjZWxsZW50IQoKPiBTaG91bGQgSSByZXNlbmQgdGhlIHBpbmN0cmwgcGF0
Y2ggYXMgYSBzdGFuZC1hbG9uZSBzdWJtaXNzaW9uPwoKWWVzLCBhbmQgZmVlbCBmcmVlIHRvIGFk
ZDoKClJldmlld2VkLWJ5OiBKZXJlbXkgS2VyciA8amtAY29kZWNvbnN0cnVjdC5jb20uYXU+CgpE
aWQgeW91ciB0ZXN0IHVzZSBteSBpM2MgRFRTIGRlZmluaXRpb25zPyBJZiBzbywgdGhhdCdzIGEg
ZGVjZW50CmRhdGFwb2ludCB0aGF0IHRoZSBjb25maWcgd29ya3MgKG9uIHNvbWV0aGluZyBvdGhl
ciB0aGFuIG15IHNldHVwKSwgYW5kCnNvIEknbGwgc3VibWl0IHVwc3RyZWFtLiBBbHRlcm5hdGl2
ZWx5LCBmZWVsIGZyZWUgdG8gaW5jbHVkZSBpdCB3aXRoCnlvdXIgcGluY3RybCBjaGFuZ2UsIGlm
IHlvdSBsaWtlLgoKQ2hlZXJzLAoKCkplcmVteQoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QK
bGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
