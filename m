Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09426C5478C
	for <linux-i3c@archiver.kernel.org>; Fri, 23 Feb 2024 16:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=BEE13P6eqDeJ6JuCgEABQfnH4DKmknBp3yB7MXlU13I=; b=cPwlpV0fDywW2nhEG1eJzbnguD
	QkKEZLnK/cv32ENQq7thOk641E1WsjEU+SQ0iDbxRPbB8R0Wr6Uxvsc4SaScizAFLhOkvt4thl0rN
	x2/SQZWpYYLwMcR1WK8eRFQkuQT5qn6Re9Uo8Vvu30bp5XZGn0aTBmmTCuyLUxEYRmUgXgzf7CVFp
	7UDDKpUfooRmKzpbAQ2igVAwxNp/V4J/P0ZItDGNGlmUtngBGdSjpkgdbxCK2IPRWjAS+PRU0fBwU
	ice7j/PyMGCYxfpjp1fJyAvy7Y56lEll9mJ77nVRkr3F4gjHPp2ZQKjaQb5eXHpHdOvaaNlnSveqk
	exhBdAKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdYqJ-0000000AKsZ-394O;
	Fri, 23 Feb 2024 16:56:25 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdYqC-0000000AKnw-0F9j
	for linux-i3c@lists.infradead.org;
	Fri, 23 Feb 2024 16:56:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BBBF3CE2D9C
	for <linux-i3c@lists.infradead.org>; Fri, 23 Feb 2024 16:55:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0E46C43390
	for <linux-i3c@lists.infradead.org>; Fri, 23 Feb 2024 16:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708707355;
	bh=o9q4NasFNGWz8zlB0rOMsX/O1t9hGjI/2ZeyGOezbiM=;
	h=References:In-Reply-To:From:Date:Subject:To:From;
	b=Cdn5DnOBlicJ0wUckGy4GLjk0678uwLkjSvz0YRREgyci3Ctsqte0wLRfij9CHFRT
	 S2L4JRLQ0QaiGizgjUOtlLun1f+2DGOcTRiUynJglubdSGcVZAat9Kx/2c5kqsS5m2
	 plj7Y3yoBocKYXmzHqlx8PiSMrwtD3YJKlAxA0Tu2l5mh+JKT71h0x4r7Ewlxq3RIK
	 yuR4NrFpy3wPgsq8zxxbSNpSIlFHmBN59ZlSxQYmCxNnqu8ro9xwu9/jvxcROocIWH
	 8jCN6i5Qt2629wNnfXHUZCOgchwzysgPuROgAPldAOSa5cvX46P0jffMUJ5fTKHoad
	 bu6YVtUsVo5rw==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-512db550e3fso1367248e87.2
        for <linux-i3c@lists.infradead.org>; Fri, 23 Feb 2024 08:55:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUDYVspJXbMgfCMOrcI5dtcEqyZFdfXomfenazsSurX2hexUeSKOPqwIDnwXxlwIyc0wrgjXrhzIIwMpp3eHPRo8PXaPKBBgd6W1bukzw==
X-Gm-Message-State: AOJu0YxC6tiuTE/UHCZMM65KmUSGd7OwJHEVqOSm7we1mPPbV0k+ADcu
	ikgvOHKQBB19VD+58qnlcBMbongZfjTIKAlZI5H9WTa+4dL3MdyNAPgmLW2mcFFjgjIaCiB3+By
	WybE1vyqQRI+n0S3lBOCGVZziXw==
X-Google-Smtp-Source: AGHT+IH3eU4uHcOcgNkS4EpFf9+utY4dSGP0CnG9Q3vlqtkLCgKqay36eKFj4lBrOQtl0GgcUPQ/S/qHFYrfi4oR314=
X-Received: by 2002:a05:6512:e93:b0:512:d830:358c with SMTP id
 bi19-20020a0565120e9300b00512d830358cmr267753lfb.49.1708707353147; Fri, 23
 Feb 2024 08:55:53 -0800 (PST)
MIME-Version: 1.0
References: <20240222174343.3482354-2-robh@kernel.org> <ZdemsdGQE0RtilCd@shikoro>
In-Reply-To: <ZdemsdGQE0RtilCd@shikoro>
From: Rob Herring <robh@kernel.org>
Date: Fri, 23 Feb 2024 09:55:40 -0700
X-Gmail-Original-Message-ID: <CAL_JsqKpn6jqktRLQUx7HMrJG0PZeiOZ=hQnHpZK6AHcM22CLQ@mail.gmail.com>
Message-ID: <CAL_JsqKpn6jqktRLQUx7HMrJG0PZeiOZ=hQnHpZK6AHcM22CLQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: i2c: Remove obsolete i2c.txt
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Rob Herring <robh@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-i3c@lists.infradead.org, linux-sound@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_085604_889419_E729BF9D 
X-CRM114-Status: GOOD (  15.15  )
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

T24gVGh1LCBGZWIgMjIsIDIwMjQgYXQgMTI6NTXigK9QTSBXb2xmcmFtIFNhbmcKPHdzYStyZW5l
c2FzQHNhbmctZW5naW5lZXJpbmcuY29tPiB3cm90ZToKPgo+IE9uIFRodSwgRmViIDIyLCAyMDI0
IGF0IDEwOjQzOjQyQU0gLTA3MDAsIFJvYiBIZXJyaW5nIHdyb3RlOgo+ID4gRXZlcnl0aGluZyBp
biBpMmMudHh0IGlzIGNvdmVyZWQgYnkgc2NoZW1hcy9pMmMvaTJjLWNvbnRyb2xsZXIueWFtbCBp
bgo+ID4gZHRzY2hlbWEgcHJvamVjdCwgc28gcmVtb3ZlIGkyYy50eHQgYW5kIHVwZGF0ZSBsaW5r
cyB0byBpdCBpbiB0aGUgdHJlZS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8
cm9iaEBrZXJuZWwub3JnPgo+Cj4gRGlmZmVyZW5jZXMgdG8gaTJjLnR4dDoKClRoYW5rcwoKPiAq
IEluIHRoZSBzY2hlbWEsICJjbG9jay1mcmVxdWVuY3kiIGhhcyBhIG1pbmltdW0gb2YgMWtIeiBh
bmQgYSBtYXhpbXVtCj4gICBvZiAzTUh6LiBXaHk/IFRoZSBzcGVjcyBkbyBub3Qgc2F5IGFueXRo
aW5nIGFib3V0IGEgbWluaW11bSBmcmVxIGFuZAo+ICAgZmFzdGVzdCBzcGVlZCBtZW50aW9uZWQg
aW4gdGhlIGRvY3MgaXMgNU1oeiAoVWx0cmEgZmFzdCBtb2RlKS4KCklJUkMsIHRoZSBoaWdoIHNw
ZWVkIG1vZGUgb3JpZ2luYWxseSB0b3BwZWQgb3V0IGF0IDNNSHouIEkgZ3Vlc3MKdGhhdCdzIGJl
ZW4gcmV2aXNlZC4KCldlIGNhbiBkcm9wIHRoZSBtaW5pbXVtLgoKPiAqIG5ldyBiaW5kaW5nICJp
MmMtc2NsLWNsay1sb3ctdGltZW91dC11cyIgaGFzIGEgZGVzY3JpcHRpb24gd2hpY2ggSSBkbwo+
ICAgbm90IHVuZGVyc3RhbmQuIFdoYXQgaXMgYSB3YWl0aW5nIHN0YXRlPwoKU2hydWcuIE1heSBo
YXZlIHRvIGxvb2sgYXQgdGhlIE1QQyBoL3cgdGhhdCB1c2VzIHRoZSBwcm9wZXJ0eS4KCj4KPiAq
IG5ldyBiaW5kaW5nICJuby1kZXRlY3QiIGlzIGJyb2tlbi4gQXQgdGhlIGxlYXN0LCBpdCBzaG91
bGQgYmUgbmFtZWQKPiAgIHNvbWV0aGluZyBsaWtlICJidXMtZnVsbHktZGVzY3JpYmVkIiBhbmQg
dGhlbiB0aGUgT1MgY2FuIGRlY2lkZSB0bwo+ICAgbGVhdmUgb3V0IGF1dG8tZGV0ZWN0aW9uIG1l
Y2hhbmlzbXMuIElmIHlvdSBhcmUgaW50ZXJlc3RlZCBpbiB0aGUKPiAgIGxhdHRlciwgeW91IGNh
biBzaW1wbHkgZGlzYWJsZSBjbGFzcyBiYXNlZCBpbnN0YW50aWF0aW9uIG9uIHRoZSBob3N0Cj4g
ICBjb250cm9sbGVyLiBObyBuZWVkIHRvIGRlc2NyaWJlIHRoaXMgaW4gRFQuCgpJJ3ZlIHJldmVy
dGVkIHRoZSBwcm9wZXJ0eSBub3cuCgpSb2IKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0Cmxp
bnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
