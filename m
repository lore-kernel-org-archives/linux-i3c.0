Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D3CC54798
	for <linux-i3c@archiver.kernel.org>; Tue, 27 Feb 2024 13:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1tiXmVRuiH5c8wKqBd3fuPItL2IA2gEoGQ0Wk0VzxQ0=; b=JBFE7OBJpXg5Mn
	J/59CXiio5K0pplkdl844DK752GZNlKWSDkuY+RuqkfgGMpA+QNusNBktUim548Qptpp4oXn97Vcy
	sSkanoHDPUhhl/c/mCCSZHAYMXhDU9mqbFhRQTc9+wHMGCQrJ+1ucgGXl0au47uFHVWIQMitan9Nq
	zZtP+w7RrERlg1dDSTLdYo7QrzQWICDdx7ibY17mgv2McSYd1l0Kr0r0NnMNbAAvsB9dlazUArri7
	9KMmHm7rTyyYLtVccKIq4pYbyd2BMfsigS16H8aU51SVqRGUzzePn+0mq3p+/Sa/NK2jgR5g++NlA
	afFzgAxZGULUn8+OBT6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rexUI-00000005NZZ-2ODR;
	Tue, 27 Feb 2024 13:27:14 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rexUF-00000005NXk-2DBx
	for linux-i3c@lists.infradead.org;
	Tue, 27 Feb 2024 13:27:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5EDABCE1B38
	for <linux-i3c@lists.infradead.org>; Tue, 27 Feb 2024 13:27:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1312C43394
	for <linux-i3c@lists.infradead.org>; Tue, 27 Feb 2024 13:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709040427;
	bh=mQuoPMjiuf8ynXjuDbiiuc6MSut0kX4NXC2fBVQm6FQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YiYsfqrNmxelw6OLCadO4d24dF73YVqv4GXCnzuNjZu47FB3rTy1hLVSKKAefEn1s
	 ZMDN8gvO4BI8MI5h5oSI9qx85Gz8zdwEdyk5aGSjNSqYu1swE/C6/dcwxG2Ssf/V6p
	 XH2rJg1Gc/o2ziShAi0h6jOS0LMybeZg5kh1ao5XhYDLQh3aICvvUNI7NjFpGLeW7u
	 X5l5k1SHu5oQ2RzsIRiRv47fR/9KGDtu3DeKi7G+RXf8Dg2gnwpuJv/NZCdkH1BCD0
	 85J66xJ7KqCX83NhABKxeyFSWFJHqZObxs8XA1oRVABAdLOzaeGmnowo8GwAvfctE+
	 IU+Mjg83pNh8A==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-512e1991237so3577754e87.1
        for <linux-i3c@lists.infradead.org>; Tue, 27 Feb 2024 05:27:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWNUB083fKb6Tn5vUiuyHRuO1nk+1+297WP/X0WjrkhXmGnJJGwul410hX0+d6SBANyCLOYvbEp4AtIK7bJFrSKqdA/XeX/SVYzgbu96g==
X-Gm-Message-State: AOJu0YxSqxfFZOZJ8NYwx0SbIRhnrC3Ry9d3OEzbTNXtDoPKpTFEoH/C
	KuCwpipfyLsdTm/deAjgUTtzNWrT2MSfLZFW34XXNCRZtaZP0FrRQZuoU4VIL9+pLcNMldgGcWe
	MZGotNv/d0ZbNTzKQyNnfVXca7Q==
X-Google-Smtp-Source: AGHT+IGSECgtfha3Slu/bp01d2++70z6Ndl3JBsL88LZ7J9E4A1ZYVnx89bJzdpkH8hy8sv4XeL5Ccsb8VUnBLV0130=
X-Received: by 2002:ac2:5611:0:b0:513:7b1:848c with SMTP id
 v17-20020ac25611000000b0051307b1848cmr545044lfd.18.1709040425849; Tue, 27 Feb
 2024 05:27:05 -0800 (PST)
MIME-Version: 1.0
References: <20240222174343.3482354-2-robh@kernel.org> <ZdemsdGQE0RtilCd@shikoro>
 <CAL_JsqKpn6jqktRLQUx7HMrJG0PZeiOZ=hQnHpZK6AHcM22CLQ@mail.gmail.com> <Zdkda5jf072mENvK@shikoro>
In-Reply-To: <Zdkda5jf072mENvK@shikoro>
From: Rob Herring <robh@kernel.org>
Date: Tue, 27 Feb 2024 07:26:52 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+Wus0CFpD3+b1Ewfv0e7iCE35gzsAwahBxErex6tY5Ww@mail.gmail.com>
Message-ID: <CAL_Jsq+Wus0CFpD3+b1Ewfv0e7iCE35gzsAwahBxErex6tY5Ww@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: i2c: Remove obsolete i2c.txt
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-i3c@lists.infradead.org, linux-sound@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_052712_018862_B6909745 
X-CRM114-Status: GOOD (  22.40  )
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

T24gRnJpLCBGZWIgMjMsIDIwMjQgYXQgNDozNOKAr1BNIFdvbGZyYW0gU2FuZwo8d3NhK3JlbmVz
YXNAc2FuZy1lbmdpbmVlcmluZy5jb20+IHdyb3RlOgo+Cj4gSGkgUm9iLAo+Cj4gPiA+ICogSW4g
dGhlIHNjaGVtYSwgImNsb2NrLWZyZXF1ZW5jeSIgaGFzIGEgbWluaW11bSBvZiAxa0h6IGFuZCBh
IG1heGltdW0KPiA+ID4gICBvZiAzTUh6LiBXaHk/IFRoZSBzcGVjcyBkbyBub3Qgc2F5IGFueXRo
aW5nIGFib3V0IGEgbWluaW11bSBmcmVxIGFuZAo+ID4gPiAgIGZhc3Rlc3Qgc3BlZWQgbWVudGlv
bmVkIGluIHRoZSBkb2NzIGlzIDVNaHogKFVsdHJhIGZhc3QgbW9kZSkuCj4gPgo+ID4gSUlSQywg
dGhlIGhpZ2ggc3BlZWQgbW9kZSBvcmlnaW5hbGx5IHRvcHBlZCBvdXQgYXQgM01Iei4gSSBndWVz
cwo+ID4gdGhhdCdzIGJlZW4gcmV2aXNlZC4KPgo+IEhzLW1vZGUgaGFzIGEgbWF4IG9mIDMuNE1I
ei4uLgo+Cj4gPgo+ID4gV2UgY2FuIGRyb3AgdGhlIG1pbmltdW0uCj4KPiAuLi4gYnV0IEkgc2Vl
IHlvdSBjaGFuZ2VkIG1pbi9tYXggbm93IHRvIDEvNTAwMDAwMC4gVGhhdCdzIHdoYXQgSSB3b3Vs
ZAo+IGhhdmUgc3VnZ2VzdGVkIGFzIHdlbGwuCj4KPgo+ID4gPiAqIG5ldyBiaW5kaW5nICJpMmMt
c2NsLWNsay1sb3ctdGltZW91dC11cyIgaGFzIGEgZGVzY3JpcHRpb24gd2hpY2ggSSBkbwo+ID4g
PiAgIG5vdCB1bmRlcnN0YW5kLiBXaGF0IGlzIGEgd2FpdGluZyBzdGF0ZT8KPiA+Cj4gPiBTaHJ1
Zy4gTWF5IGhhdmUgdG8gbG9vayBhdCB0aGUgTVBDIGgvdyB0aGF0IHVzZXMgdGhlIHByb3BlcnR5
Lgo+Cj4gSSB3aWxsIGFsc28gaGF2ZSBhbm90aGVyIGxvb2suIE15IGd1dCBmZWVsaW5nIGlzIHRo
YXQgdGhlIGJpbmRpbmcgaXMKPiBva2F5LCBvbmx5IHRoZSBkZXNjcmlwdGlvbiBtaWdodCBuZWVk
IGFuIHVwZGF0ZS4KPgo+ID4gPgo+ID4gPiAqIG5ldyBiaW5kaW5nICJuby1kZXRlY3QiIGlzIGJy
b2tlbi4gQXQgdGhlIGxlYXN0LCBpdCBzaG91bGQgYmUgbmFtZWQKPiA+ID4gICBzb21ldGhpbmcg
bGlrZSAiYnVzLWZ1bGx5LWRlc2NyaWJlZCIgYW5kIHRoZW4gdGhlIE9TIGNhbiBkZWNpZGUgdG8K
PiA+ID4gICBsZWF2ZSBvdXQgYXV0by1kZXRlY3Rpb24gbWVjaGFuaXNtcy4gSWYgeW91IGFyZSBp
bnRlcmVzdGVkIGluIHRoZQo+ID4gPiAgIGxhdHRlciwgeW91IGNhbiBzaW1wbHkgZGlzYWJsZSBj
bGFzcyBiYXNlZCBpbnN0YW50aWF0aW9uIG9uIHRoZSBob3N0Cj4gPiA+ICAgY29udHJvbGxlci4g
Tm8gbmVlZCB0byBkZXNjcmliZSB0aGlzIGluIERULgo+ID4KPiA+IEkndmUgcmV2ZXJ0ZWQgdGhl
IHByb3BlcnR5IG5vdy4KPgo+IENvb2wsIHRoYW5rcyEKCkkgZG9uJ3QgdGhpbmsgdGhlcmUncyBh
bnl0aGluZyBlbHNlIHRvIGRpc2N1c3Mgb24gdGhpcyBwYXRjaCwgY2FuIEkKZ2V0IHlvdXIgYWNr
PwoKUm9iCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWkzYwo=
