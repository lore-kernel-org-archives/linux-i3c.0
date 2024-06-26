Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED846C27C4F
	for <linux-i3c@archiver.kernel.org>; Wed, 26 Jun 2024 08:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VlAfaFFlkxGBW96CujB//oEx91GmdfZnsLASf7sd/AA=; b=Ax09a81v54BaqP
	tYBFnkuasTgu5sBPV++OMYdzlR3a63NRaOAbgiLWgZ7JCVytxqC7qN7GQHh+IQ58YGA51OLsWPKtU
	LBlCMxr0wYtiiIqvXDb0N24hJgv4jzaFQZnGvW2A/FlW9LM2KIpTi3aOKGd2t14bM57A8+9J/bIcV
	wKxd6pBxs/yY3y5IXzI82n3UOj20Oyf9z2EQMWeQB1M/HVmoM2C7yNtdNu7K9dmhpzlyL6h+13uo7
	REO6nJoSC763rc7itlhJOcEhkTOoFH4grALbtesGzGr7oHCdtjiKOgfWSV9EJi1NROd5n10/sDvps
	BcRKnXiSNjIZL+Twmwyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMOOQ-0000000605K-1deX;
	Wed, 26 Jun 2024 08:52:42 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMOOM-0000000602x-2uws
	for linux-i3c@lists.infradead.org;
	Wed, 26 Jun 2024 08:52:40 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-4450111d54dso186111cf.0
        for <linux-i3c@lists.infradead.org>; Wed, 26 Jun 2024 01:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719391956; x=1719996756; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VdqyfAQH22fNsPG4ZSuANffNhA17gGQ/2s35bKca05I=;
        b=GFd3YrRDQ+jfks1E9LuS1KZoBBq0RLMfFxfOA85BevgunfcAIxYnwh1Jz73KTNGRjw
         w82diC7xAR6GV5fT8HXK1WLnFLRQppBsNz79rtUjS0NTFsjXrSoSgQ6vKZRqgRIKteiX
         o0wnP41l6cAEyDzxeIMPIo/T/zPJLyZPJVWwdQRBVeaysNmlIjQ2iFZD0BbK6l6TpoC/
         qbYUR5dvnPDhevg6D+g0Zw7t0seM3o1Wl+LGe82PhGTzuRmoOvdkmdrRRuFGWilAt7Wg
         mL6jp6aA9Y1oIor2ZRMHUu/qzRaRTORx5BsxYVTttlqC76cyygRx82/exCdcqcPyBpM8
         NzKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719391956; x=1719996756;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VdqyfAQH22fNsPG4ZSuANffNhA17gGQ/2s35bKca05I=;
        b=goIzcnU5e6y79V70YzU0UFtpMo0lFD67kCtt2lrgZgrDei21PGpK445JEGspeOk73I
         t7gFaVvMdYVLu2u2imUseZKjTW5IdqxvdSqhZqE1Qd+GT7wqdiVxLgOspOZP1+ISlgZp
         IGELxowaAW7K8cRtz28TeoC8dE/YD+t+G0KhmvDMiSQ53miZEThlndfA4nNqm54Tqt8Q
         3YKJAQg1JiCLW9JeJOj1VSTNTZSpxf1YDaULkFzBpuB63THwAiaum1oTypFTer+EzGiE
         j3NDcgE+c/mAtufWMLVl2fQBKhmXkOQGiHqTzulAyxwx54tnVcAWf3dR5z4tSzXVVd6A
         PuDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVn0zQZ3HJBOyRsuXfsWhkAq+PYgj76ZRbxqH8slvImwBI7J4ero2W8RyNGqek86r1gQGHnRTa1wmNU+ZX45tKCiXIdF7m/jTcAdGnosw==
X-Gm-Message-State: AOJu0YztD54qzdhXIU9o7t/apB2h2uJtb78b+ReGwwgYIA8dQ7kmTFPg
	uIKoM9YVDO9dIaAxu8XNJd0aUvcQxy0lXhuk/JNyp4q0IHOsbxac/Tc4FaADyYWIYQJFEyuE+8v
	AxurRCGxepaUpmPqF5JC5pJ0QmzEe1BbWzu1l
X-Google-Smtp-Source: AGHT+IGoW1st5jgyFmCNO3SQEDHLTOES20gkf1BUZidR2x+6HDeMctSqAK7jTHxc/JVAt40OQsfF5JwQda+XPTtf8f0=
X-Received: by 2002:a05:622a:1345:b0:444:d637:305b with SMTP id
 d75a77b69052e-44504a965femr2544521cf.4.1719391955379; Wed, 26 Jun 2024
 01:52:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240626052238.1577580-1-aniketmaurya@google.com>
 <20240626052238.1577580-2-aniketmaurya@google.com> <e28ba03d1df1c0c5aec987411c40e44fc351ce0d.camel@codeconstruct.com.au>
 <c15045b4-2e5f-4fcc-b25c-76a5e4973e93@linaro.org> <b4ba5fa7834fdfb1a1e26ff0e01b9bb235de63b5.camel@codeconstruct.com.au>
In-Reply-To: <b4ba5fa7834fdfb1a1e26ff0e01b9bb235de63b5.camel@codeconstruct.com.au>
From: "Aniket ." <aniketmaurya@google.com>
Date: Wed, 26 Jun 2024 14:22:24 +0530
Message-ID: <CAMmmMt25nkZTXXLCVGv1baf3azQR0kwbM8LP4EzCQKOPLUhbVQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: i3c: dw: Add property to select IBI ops
To: Jeremy Kerr <jk@codeconstruct.com.au>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Joel Stanley <joel@jms.id.au>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-i3c@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_015238_771240_2E08F53A 
X-CRM114-Status: GOOD (  22.18  )
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

SGkgSmVyZW15LAoKPiBBbmlrZXQ6IHRoZSBoYXJkd2FyZSB5b3UncmUgZGVhbGluZyB3aXRoIHRo
ZXJlIG1heSBuZWVkIGEgbmV3LCBzcGVjaWZpYwo+IGNvbXBhdGlibGUgcHJvcGVydHksIHdoaWNo
IHdpbGwgZGljdGF0ZSB3aGV0aGVyIHdlIGVuYWJsZSBJQklzIGluIHRoZQo+IGRyaXZlci4KPgo+
IEZvciBjYXNlcyB3aGVyZSBubyBvdGhlciBzcGVjaWFsIGJlaGF2aW91ciBpcyByZXF1aXJlZCwg
d2UgY2FuCj4gcmVwcmVzZW50IHRoaXMganVzdCBhcyBhbiBlbnRyeSBpbiB0aGUgT0YgbWF0Y2gg
dGFibGUuCgpBY3R1YWxseSBJIHNlZSB0aGF0IElCSSBzdXBwb3J0IGlzIGFsd2F5cyBwcmVzZW50
IGluIHRoZSBIVyhEVyBJM0MKSVApLiBJdCdzIGp1c3QgdGhhdCB3ZSBoYXZlCmFuIG9wdGlvbiBp
biBTVyB0byBkZWNpZGUgd2hldGhlciB0byBwb3B1bGF0ZSBmdW5jdGlvbiBwb2ludGVycyBmb3Ig
SUJJIG9yIG5vdC4KU28gY2FuIHdlIHJlbW92ZSB0aGlzIHNlbGVjdGlvbiBvZiBvcHMgYW5kIGFs
d2F5cyBnbyB3aXRoIGliaSBvcHM/CgpUaGFua3MsCkFuaWtldC4KCk9uIFdlZCwgSnVuIDI2LCAy
MDI0IGF0IDE6NDjigK9QTSBKZXJlbXkgS2VyciA8amtAY29kZWNvbnN0cnVjdC5jb20uYXU+IHdy
b3RlOgo+Cj4gSGkgS3J5c3p0b2YsCj4KPiA+ID4gPiArICBpYmktY2FwYWJsZToKPiA+ID4gPiAr
ICAgIGRlc2NyaXB0aW9uOiBTZXQgdG8gc2VsZWN0IElCSSBvcHMuCj4gPgo+ID4gV2hhdCBhcmUg
SUJJIG9wcz8gU3RhbmRhcmQgZm9ybSBsZXR0ZXI6Cj4gPgo+ID4gWW91IGRlc2NyaWJlZCB0aGUg
ZGVzaXJlZCBMaW51eCBmZWF0dXJlIG9yIGJlaGF2aW9yLCBub3QgdGhlIGFjdHVhbAo+ID4gaGFy
ZHdhcmUuCj4KPiBJbiB0aGlzIGNhc2UgaXQgaXMgdGhlIGFjdHVhbCBoYXJkd2FyZTsgbXkgdW5k
ZXJzdGFuZGluZyBpcyB0aGF0IHRoZQo+IGdhdGV3YXJlIElQIGNhbiBiZSBjb25maWd1cmVkIHRv
IHN1cHBvcnQgaW4tYmFuZC1pbnRlcnJ1cHRzIG9yIG5vdCwKPiBiZWZvcmUgYmVpbmcgYmFrZWQt
aW4gdG8gaGFyZHdhcmUuCj4KPiA+ID4gV291bGRuJ3QgdGhlIGNvbXBhdGlibGUgc3RyaW5nIHNl
bGVjdCB3aGV0aGVyIHRoZSBoYXJkd2FyZSBpbnN0YW5jZQo+ID4gPiBzdXBwb3J0cyBJQkkgb3Ig
bm90Pwo+ID4gPgo+ID4gPiBJJ2QgaW1hZ2luZSB0aGF0IGVhY2ggc3BlY2lmaWMgc3ludGhlc2lz
IG9mIHRoZSBEVyBJUCB3b3VsZCBpbXBseQo+ID4gPiBjb3JyZXNwb25kaW5nIGhhcmR3YXJlIHNl
dHRpbmdzLCBhbmQgc28gd291bGQgd2FycmFudCBpdHMgb3duCj4gPiA+IGNvbXBhdGlibGUKPiA+
ID4gdmFsdWUuCj4gPiA+Cj4gPiA+IE1heWJlIG9uZSBmb3IgdGhlIERUIGZvbGtzOiB3b3VsZCB0
aGlzIHdvcmsgYmV0dGVyIGFzIGluZGl2aWR1YWwKPiA+ID4gcHJvcGVydGllcz8gSXMgdGhlcmUg
YSBwb2xpY3kgaGVyZT8KPiA+Cj4gPiBVc3VhbGx5IGlmIGZlYXR1cmUgaXMgc3BlY2lmaWMgdG8g
Z2l2ZW4gaGFyZHdhcmUsIGUuZy4gYWx3YXlzIGNhcGFibGUKPiA+IG9mIGZvb2JhciwgdGhlbiBp
dCBjYW4gYmUgZGVkdWNlZCBmcm9tIGNvbXBhdGlibGUsIHNvIG5vIG5lZWQgZm9yIG5ldwo+ID4g
cHJvcGVydHkuCj4KPiBTb3VuZHMgZ29vZC4KPgo+IEFuaWtldDogdGhlIGhhcmR3YXJlIHlvdSdy
ZSBkZWFsaW5nIHdpdGggdGhlcmUgbWF5IG5lZWQgYSBuZXcsIHNwZWNpZmljCj4gY29tcGF0aWJs
ZSBwcm9wZXJ0eSwgd2hpY2ggd2lsbCBkaWN0YXRlIHdoZXRoZXIgd2UgZW5hYmxlIElCSXMgaW4g
dGhlCj4gZHJpdmVyLgo+Cj4gRm9yIGNhc2VzIHdoZXJlIG5vIG90aGVyIHNwZWNpYWwgYmVoYXZp
b3VyIGlzIHJlcXVpcmVkLCB3ZSBjYW4KPiByZXByZXNlbnQgdGhpcyBqdXN0IGFzIGFuIGVudHJ5
IGluIHRoZSBPRiBtYXRjaCB0YWJsZS4KPgo+IENoZWVycywKPgo+Cj4gSmVyZW15CgotLSAKbGlu
dXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
