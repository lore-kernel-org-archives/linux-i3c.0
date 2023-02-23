Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8878C61DA3
	for <linux-i3c@archiver.kernel.org>; Fri, 24 Feb 2023 08:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xR/+CZh/8WZ+P2gK10wmoLq9F4MNCimpgEyiiNXmn6Y=; b=4tWOJl56Nn0trb
	YcPCE2D9w7l5it3dKwILsVZaHprQFfYU7MPQxXr5TajUFVeIPyRLuiMjqGo5/Niq1OiS0KyBqSL0e
	YdqWgNrzFk1RzWpwz3RRdeKNTsRMpZVKsGQtVFq/RWRQhjoV5knpyQI/I+4C8O1/++dsiNttm9vhf
	Hau58TjAeJ492Mot/93dXyiMQzVGpE89EM2FEWCWbyRdhhsRMmSpeLFTbpA/reTJ8+3wypqsajd6v
	tNRkzjp5CBFBkAuqt/fhS272Vk5MC+zQMvqoXJhxBXuBgSde8zkYKuVzF4ZQE16oWF5+qdf1Hh3H1
	2y+n8yrSzjutXp+MWftg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVT0H-001T6H-Tj; Fri, 24 Feb 2023 08:00:29 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVK5j-000U8y-Er
	for linux-i3c@lists.infradead.org; Thu, 23 Feb 2023 22:29:33 +0000
Received: by mail-wr1-x431.google.com with SMTP id j2so11963934wrh.9
        for <linux-i3c@lists.infradead.org>; Thu, 23 Feb 2023 14:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1x2qdveok5thAdT6xjWjQMzIRmnIfphiCecrUrysglQ=;
        b=lx6aIrjBuQDX51KNLowyjtdJ+i5khKR2uA98SDd5kJ1ELRccrPO8Cv7Dw6TJdwBazZ
         IuuTGyWzIGo80urYyzWxAU7es7+GwXNuRquH2Yo1AyFVr3suz7LhwbnCJIpSThQ0i7oG
         lxY40n+mALa9cmGvsaSR6nSPRB81iiojRVu4+zgnY8M1/+/w6pj9m5rQPzd2hjHQneTG
         YjK3JZacyEJgn3K29aSa8Q7HrC22pL6s5p2Zb2L2y5E5Xi+UpPlqjc/bETHOb//0BBAJ
         dieeAlLGwggIO63UhcXnBs11bnEiiIFTau59DojZnUQ6BmvPBjnUjDERvDztpdhAW5eu
         pxdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1x2qdveok5thAdT6xjWjQMzIRmnIfphiCecrUrysglQ=;
        b=B7ekngUYOafgCVU7zUBIcvnCt9hZampwPjiRUsUMNoeZQJI4QrYjCrchQs/qaslvAx
         WXOGM2wjKAWgEdyr76WnJqiFMeBgbD5dBNBn75eNpopWIATYCmZPJveMCOzJ45uoLx7f
         tDnxqxQyRpurr6R89lFmq+pEIF9NevHH+coKI+vYJhWJSdBy7qi/tgHI+rXwrEsaj/xt
         GZMf/EgAy/eIGfT16JmoGSqbe3hKduynqaoeUoOcypPvNFWeHXeupnsUUDvUL58nOlvu
         85wAJw0aIDLjL5tQe8Dmdkiw4RuzV0bVKI0E4YoEC01wdOtPITuHpaR0WMTgLi7/CUeV
         MULQ==
X-Gm-Message-State: AO0yUKW/j6yqj7Wj7wwVx+P6ndV1g04adoK4Vu8+xg8jHt45/HmcmAU8
	Qsx61Q4asRU6JA8w7LNvVK3B5V23sQ1wRBBpL3M=
X-Google-Smtp-Source: AK7set+APxjZeWp4LS4Rb6uitGq05P+QrlDky22A7arjKBjIVjUinc3S3MFLI2v8fARSDogxVjFOeg==
X-Received: by 2002:a5d:40cc:0:b0:2c7:d6e:7e6e with SMTP id b12-20020a5d40cc000000b002c70d6e7e6emr5613702wrq.24.1677191365995;
        Thu, 23 Feb 2023 14:29:25 -0800 (PST)
Received: from [192.168.1.138] (bl21-87-220.dsl.telepac.pt. [2.82.87.220])
        by smtp.gmail.com with ESMTPSA id o18-20020a5d4752000000b002c3f9404c45sm10271427wrs.7.2023.02.23.14.29.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Feb 2023 14:29:25 -0800 (PST)
Message-ID: <07f8ecaa-9a1a-dcf9-a7f2-fb67f9ddd51a@gmail.com>
Date: Thu, 23 Feb 2023 22:29:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] i3c: dw: Use configured rate and bus mode for clock
 configuration
Content-Language: en-US
To: Jeremy Kerr <jk@codeconstruct.com.au>, linux-i3c@lists.infradead.org
Cc: linux-aspeed@lists.ozlabs.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20230216062040.497815-1-jk@codeconstruct.com.au>
From: Vitor Soares <ivitro@gmail.com>
In-Reply-To: <20230216062040.497815-1-jk@codeconstruct.com.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_142931_547081_7C4AA6C6 
X-CRM114-Status: GOOD (  23.04  )
X-Mailman-Approved-At: Fri, 24 Feb 2023 00:00:27 -0800
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

SGkgSmVyZW15LAoKUGxlYXNlIGZpbmQgbXkgY29tbWVudHMgYmVsbG93LgoKCk9uIDIvMTYvMjMg
MDY6MjAsIEplcmVteSBLZXJyIHdyb3RlOgo+IFdlIG1heSBoYXZlIGEgbm9uLXR5cGljYWwgaTNj
IHJhdGUgY29uZmlndXJlZDsgdXNlIHRoaXMgKGluc3RlYWQgb2YKPiB0aGUgZml4ZWQgSTNDX0JV
U19UWVBfSTNDX1NDTF9SQVRFKSB3aGVuIGNhbGN1bGF0aW5nIHRpbWluZwo+IGNoYXJhY3Rlcmlz
dGljcy4gV2UgY2FuIGFsc28gZXhwYW5kIHRoZSBTQ0wgaGlnaCB0aW1lIGJhc2VkIG9uIHRoZQo+
IHByZXNlbmNlL2Fic2VuY2Ugb2YgaTJjIGRldmljZXMuCj4KPiBBbHNvLCBzaW5jZSB3ZSBub3cg
aGF2ZSBidXMtPm1vZGUsIHVzZSBpdCB0byBkZXRlcm1pbmUgd2hldGhlciB3ZSBzZSB1cAo+IHRo
ZSBCVVNfRlJFRV9USU1JTkcgcmVnaXN0ZXI7IHJhdGhlciB0aGFuIHJlLXJlYWRpbmcKPiBERVZf
Q1RSTF9JMkNfU0xBVkVfUFJFU0VOVCBmcm9tIGhhcmR3YXJlLgo+Cj4gU2lnbmVkLW9mZi1ieTog
SmVyZW15IEtlcnIgPGprQGNvZGVjb25zdHJ1Y3QuY29tLmF1Pgo+IC0tLQo+ICBkcml2ZXJzL2kz
Yy9tYXN0ZXIvZHctaTNjLW1hc3Rlci5jIHwgNDQgKysrKysrKysrKysrKysrKysrKystLS0tLS0t
LS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkK
Pgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIvZHctaTNjLW1hc3Rlci5jIGIvZHJp
dmVycy9pM2MvbWFzdGVyL2R3LWkzYy1tYXN0ZXIuYwo+IGluZGV4IDUxYTg2MDgyMDNkZS4uZDcz
ZDU3MzYyYjNiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci9kdy1pM2MtbWFzdGVy
LmMKPiArKysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvZHctaTNjLW1hc3Rlci5jCj4gQEAgLTUxNSw3
ICs1MTUsOCBAQCBzdGF0aWMgdm9pZCBkd19pM2NfbWFzdGVyX2VuZF94ZmVyX2xvY2tlZChzdHJ1
Y3QgZHdfaTNjX21hc3RlciAqbWFzdGVyLCB1MzIgaXNyKQo+ICAJZHdfaTNjX21hc3Rlcl9zdGFy
dF94ZmVyX2xvY2tlZChtYXN0ZXIpOwo+ICB9Cj4gIAo+IC1zdGF0aWMgaW50IGR3X2kzY19jbGtf
Y2ZnKHN0cnVjdCBkd19pM2NfbWFzdGVyICptYXN0ZXIpCj4gK3N0YXRpYyBpbnQgZHdfaTNjX2Ns
a19jZmcoc3RydWN0IGR3X2kzY19tYXN0ZXIgKm1hc3RlciwgdW5zaWduZWQgbG9uZyBpM2NfcmF0
ZSwKPiArCQkJICBib29sIHB1cmUpCj4gIHsKPiAgCXVuc2lnbmVkIGxvbmcgY29yZV9yYXRlLCBj
b3JlX3BlcmlvZDsKPiAgCXUzMiBzY2xfdGltaW5nOwo+IEBAIC01MjcsMzEgKzUyOCw0NSBAQCBz
dGF0aWMgaW50IGR3X2kzY19jbGtfY2ZnKHN0cnVjdCBkd19pM2NfbWFzdGVyICptYXN0ZXIpCj4g
IAo+ICAJY29yZV9wZXJpb2QgPSBESVZfUk9VTkRfVVAoMTAwMDAwMDAwMCwgY29yZV9yYXRlKTsK
PiAgCj4gLQloY250ID0gRElWX1JPVU5EX1VQKEkzQ19CVVNfVEhJR0hfTUFYX05TLCBjb3JlX3Bl
cmlvZCkgLSAxOwo+IC0JaWYgKGhjbnQgPCBTQ0xfSTNDX1RJTUlOR19DTlRfTUlOKQo+IC0JCWhj
bnQgPSBTQ0xfSTNDX1RJTUlOR19DTlRfTUlOOwo+ICsJLyogNTAlIGR1dHkgY3ljbGUgKi8KPiAr
CWhjbnQgPSBESVZfUk9VTkRfVVAoY29yZV9yYXRlLCBpM2NfcmF0ZSAqIDIpOwo+ICAKPiAtCWxj
bnQgPSBESVZfUk9VTkRfVVAoY29yZV9yYXRlLCBJM0NfQlVTX1RZUF9JM0NfU0NMX1JBVEUpIC0g
aGNudDsKPiAtCWlmIChsY250IDwgU0NMX0kzQ19USU1JTkdfQ05UX01JTikKPiAtCQlsY250ID0g
U0NMX0kzQ19USU1JTkdfQ05UX01JTjsKPiArCS8qIEluIHNoYXJlZCBtb2RlLCB3ZSBsaW1pdCB0
X2hpZ2gsIHNvIHRoYXQgaTNjIFNDTCBzaWduYWxsaW5nIGlzCj4gKwkgKiByZWplY3RlZCBieSB0
aGUgaTJjIGRldmljZXMnIHNwaWtlIGZpbHRlciAqLwo+ICsJaWYgKCFwdXJlKQo+ICsJCWhjbnQg
PSBtaW5fdCh1OCwgaGNudCwKPiArCQkJICAgICBESVZfUk9VTkRfVVAoSTNDX0JVU19USElHSF9N
QVhfTlMsIGNvcmVfcGVyaW9kKSkgLSAxOwoKWW91IGFyZSBhc3N1bWluZyB0aGF0IHRfaGlnaCBt
YXkgYmUgbG93ZXIgdGhhbiA0MG5zLCByaWdodD8KYnkgdGhlIHNwZWMgdGhlIG1heCBzcGVlZCBp
cyAxMi45TUh6LCBkb24ndCB0aGluayB5b3UgbmVlZCB0aGlzIG1pbl90KCkgaGVyZS4KCj4gKwo+
ICsJaGNudCA9IG1heF90KHU4LCBoY250LCBTQ0xfSTNDX1RJTUlOR19DTlRfTUlOKTsKCkkgd291
bGQgYnJhbmNoIHRoaXMgcGFydCBpbnRvOgoKaWYocHVyZSkKCsKgwqDCoCBoY250PSA7CgplbHNl
CgrCoMKgwqAgaGNudD0gOwoKdGhpbmsgdGhpcyB3YXkgaXMgbW9yZSByZWFkYWJsZS4KCj4gKwo+
ICsJbGNudCA9IERJVl9ST1VORF9VUChjb3JlX3JhdGUsIGkzY19yYXRlKSAtIGhjbnQ7Cj4gKwls
Y250ID0gbWF4X3QodTgsIGxjbnQsIFNDTF9JM0NfVElNSU5HX0NOVF9NSU4pOwo+ICAKPiAgCXNj
bF90aW1pbmcgPSBTQ0xfSTNDX1RJTUlOR19IQ05UKGhjbnQpIHwgU0NMX0kzQ19USU1JTkdfTENO
VChsY250KTsKPiAgCXdyaXRlbChzY2xfdGltaW5nLCBtYXN0ZXItPnJlZ3MgKyBTQ0xfSTNDX1BQ
X1RJTUlORyk7Cj4gIAo+IC0JaWYgKCEocmVhZGwobWFzdGVyLT5yZWdzICsgREVWSUNFX0NUUkwp
ICYgREVWX0NUUkxfSTJDX1NMQVZFX1BSRVNFTlQpKQo+ICsJaWYgKHB1cmUpCj4gIAkJd3JpdGVs
KEJVU19JM0NfTVNUX0ZSRUUobGNudCksIG1hc3Rlci0+cmVncyArIEJVU19GUkVFX1RJTUlORyk7
Cj4gIAo+IC0JbGNudCA9IERJVl9ST1VORF9VUChJM0NfQlVTX1RMT1dfT0RfTUlOX05TLCBjb3Jl
X3BlcmlvZCk7Cj4gKwkvKiBvcGVuIGRyYWluIG1vZGUgcmVxdWlyZXMgYSBtaW5pbXVtIG9mIE9E
X01JTl9OUyAqLwoKTXkgY29tbWVudCBoZXJlIHdvdWxkIHNheSB3aHkgd2UgbmVlZCBhIGhpZ2hl
ciBPRCB0aW1lIHJhdGhlciB0aGUgbWluaW11bS4KCgo+ICsJbGNudCA9IG1heF90KHU4LCBsY250
LCBESVZfUk9VTkRfVVAoSTNDX0JVU19UTE9XX09EX01JTl9OUywgY29yZV9wZXJpb2QpKTsKPiAg
CXNjbF90aW1pbmcgPSBTQ0xfSTNDX1RJTUlOR19IQ05UKGhjbnQpIHwgU0NMX0kzQ19USU1JTkdf
TENOVChsY250KTsKPiAgCXdyaXRlbChzY2xfdGltaW5nLCBtYXN0ZXItPnJlZ3MgKyBTQ0xfSTND
X09EX1RJTUlORyk7Cj4gIAo+IC0JbGNudCA9IERJVl9ST1VORF9VUChjb3JlX3JhdGUsIEkzQ19C
VVNfU0RSMV9TQ0xfUkFURSkgLSBoY250Owo+ICsJLyogVGltaW5ncyBmb3IgbG93ZXIgU0RSeCBy
YXRlcyB3aGVyZSBzcGVjaWZpZWQgYnkgZGV2aWNlIE1YRFMgdmFsdWVzOwo+ICsJICogd2UgbGlt
aXQgdGhlc2UgdG8gdGhlIGdsb2JhbCBtYXggcmF0ZSBwcm92aWRlZCwgd2hpY2ggYWxzbyBwcmV2
ZW50cwo+ICsJICogd2VpcmQgZHV0eSBjeWNsZXMgKi8KCkkgdGhpbmsgY2hlY2twYXRjaCBjb21w
bGFpbnMgd2l0aCB0aGlzIGNvbW1lbnQgZm9ybWF0LiBJIHdvdWxkIHN1Z2dlc3QgdG8gdXNlIGxp
a2UgaW4gdGhlIHJlc3Qgb2Yga2VybmVsLgoKVW5mb3J0dW5hdGVseSwgd2UgbmVlZCB0byBhZGRy
ZXNzIHRoZSBjYXNlcyBpbiB3aGljaCBTRFJ4IGZyZXF1ZW5jeSBpcyBoaWdoZXIgdGhhbiBidXMt
PnNjbF9yYXRlLmkzYy4KCgo+ICsJbGNudCA9IG1heF90KHU4LCBsY250LAo+ICsJCSAgICAgRElW
X1JPVU5EX1VQKGNvcmVfcmF0ZSwgSTNDX0JVU19TRFIxX1NDTF9SQVRFKSAtIGhjbnQpOwoKVGhl
IGxjbnQgd2l0aGluIG1heF90KCkgZnVuY3Rpb24gY29tZXMgZnJvbSBTQ0xfSTNDX09EX1RJTUlO
RywgY29ycmVjdD8gSGF2ZSB5b3UgY2hlY2tlZCB0aGlzIHZhbHVlIGZvcgpidXMtPnNjbF9yYXRl
LmkzYyA9IDEyLjVNSHo/CgoKPiAgCXNjbF90aW1pbmcgPSBTQ0xfRVhUX0xDTlRfMShsY250KTsK
PiAtCWxjbnQgPSBESVZfUk9VTkRfVVAoY29yZV9yYXRlLCBJM0NfQlVTX1NEUjJfU0NMX1JBVEUp
IC0gaGNudDsKPiArCWxjbnQgPSBtYXhfdCh1OCwgbGNudCwKPiArCQkgICAgIERJVl9ST1VORF9V
UChjb3JlX3JhdGUsIEkzQ19CVVNfU0RSMl9TQ0xfUkFURSkgLSBoY250KTsKPiAgCXNjbF90aW1p
bmcgfD0gU0NMX0VYVF9MQ05UXzIobGNudCk7Cj4gLQlsY250ID0gRElWX1JPVU5EX1VQKGNvcmVf
cmF0ZSwgSTNDX0JVU19TRFIzX1NDTF9SQVRFKSAtIGhjbnQ7Cj4gKwlsY250ID0gbWF4X3QodTgs
IGxjbnQsCj4gKwkJICAgICBESVZfUk9VTkRfVVAoY29yZV9yYXRlLCBJM0NfQlVTX1NEUjNfU0NM
X1JBVEUpIC0gaGNudCk7Cj4gIAlzY2xfdGltaW5nIHw9IFNDTF9FWFRfTENOVF8zKGxjbnQpOwo+
IC0JbGNudCA9IERJVl9ST1VORF9VUChjb3JlX3JhdGUsIEkzQ19CVVNfU0RSNF9TQ0xfUkFURSkg
LSBoY250Owo+ICsJbGNudCA9IG1heF90KHU4LCBsY250LAo+ICsJCSAgICAgRElWX1JPVU5EX1VQ
KGNvcmVfcmF0ZSwgSTNDX0JVU19TRFI0X1NDTF9SQVRFKSAtIGhjbnQpOwoKd2hhdCBhYm91dCB0
byB1c2UgYSBmb3IgbG9vcCBhbmQgb25seSBkbyBsY250IGNhbGN1bGF0aW9uIGlmCgpidXMtPnNj
bF9yYXRlLmkzYyA+IEkzQ19CVVNfU0RSeF9TQ0xfUkFURSA/CgoKPiAgCXNjbF90aW1pbmcgfD0g
U0NMX0VYVF9MQ05UXzQobGNudCk7Cj4gIAl3cml0ZWwoc2NsX3RpbWluZywgbWFzdGVyLT5yZWdz
ICsgU0NMX0VYVF9MQ05UX1RJTUlORyk7Cj4gIAo+IEBAIC02MDUsNyArNjIwLDggQEAgc3RhdGlj
IGludCBkd19pM2NfbWFzdGVyX2J1c19pbml0KHN0cnVjdCBpM2NfbWFzdGVyX2NvbnRyb2xsZXIg
Km0pCj4gIAkJCXJldHVybiByZXQ7Cj4gIAkJZmFsbHRocm91Z2g7Cj4gIAljYXNlIEkzQ19CVVNf
TU9ERV9QVVJFOgo+IC0JCXJldCA9IGR3X2kzY19jbGtfY2ZnKG1hc3Rlcik7Cj4gKwkJcmV0ID0g
ZHdfaTNjX2Nsa19jZmcobWFzdGVyLCBidXMtPnNjbF9yYXRlLmkzYywKPiArCQkJCSAgICAgYnVz
LT5tb2RlID09IEkzQ19CVVNfTU9ERV9QVVJFKTsKPiAgCQlpZiAocmV0KQo+ICAJCQlyZXR1cm4g
cmV0Owo+ICAJCWJyZWFrOwoKCkJlc3QgcmVnYXJkcywKClZpdG9yIFNvYXJlcwoKCi0tIApsaW51
eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
