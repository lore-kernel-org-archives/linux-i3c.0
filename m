Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 776A9E937E0
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Apr 2026 01:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5EE9bP3rdK+L35LVD9EsXQjKku1id4lqwZB+U508IyQ=; b=qrNwudaI1YYjcK
	o8vebMVtMEqXuU+ItMUSnHtIvzVe6HWaoB/J9yscU1HhQNSWET52RDOIK2RuOQH1E0aHYKjGNaycw
	GPY2PVvWfIvDwyWKQ0LRfo7wXK1RZf7r9WpS8HdMqhIfwSaAWsG9dhb6TCm/SzwiCCLec0WSuXKos
	XceceWkot2GQjSQTlTa6KH00+KQPHWXwjSiPPCAijGZPYCG43pxWxImzWgiNZ86UctzgcXt+7Q0Di
	mR+lHdvpbpziTRCUPvkaT4owmLof39qNNH4w9n35uCNkWpfiWpFyhEHvEVuIq2/mh54TJsMj3ZkmZ
	UTmuKccQgb4P/aK+CEew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC6Hj-0000000EqUE-4AEd;
	Mon, 13 Apr 2026 01:40:20 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC6Hh-0000000EqTs-0lXE
	for linux-i3c@lists.infradead.org;
	Mon, 13 Apr 2026 01:40:18 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-41c4d660b19so953413fac.1
        for <linux-i3c@lists.infradead.org>; Sun, 12 Apr 2026 18:40:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776044415; cv=none;
        d=google.com; s=arc-20240605;
        b=f4Le55NTN/o5i70c9BFHwPs3ICa0oW+XhxBbBzmZ3uj4kDF/rhvkGU+OcEntHrqUvd
         TxFTTatnrcKxNOT/5sps3fA3nPMBNUqPDJjWCVMcoVmYfWI9IvdT3sGevoUGVXxEgRPJ
         cmmccyl2d6UH0lH2OgM+MR722/IZPWfl9ExmwpyRwqFWt8DgVMMUn1D2MyUi79yYp20b
         h1d4LqPiAZSLM2pDVHbr4hoQQLLUGPL0yoMhN6VPMprnJQqguAts856u5n8CgW8l7aXq
         AVb7ffavbE+xuUL3W6LbV7o7jte3eI7s008qIUHx1csGo0aMonpnytYvUo/SLhBelAbc
         c7sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aBjiNkI9stkp1MHFMpR56Hup9/ejSX9EYTmhTEGF+54=;
        fh=4sPeYGMSuJPhGaV/cRRVm/IJMeDEkas/eOtFPhzxJv0=;
        b=GGzvhoyFPtTCKKzdNV6qHYYfbTamUPuZKMsaTdK/eIagFCZqrFpi2HPmERtCQlkxnl
         xZ5y+xV67bYTg/S2RCoWjd7u58nTbSYEjhVtAve1iKSudA0O6uEZoVtP5HtEwfmo8Erk
         dKofw/RMrFZLXg6XCUJMPvQ6VJFLCc/QQ+TtGyecSxvtnCAxwJvfIoKChMPtDU8f7bew
         0WTWbgZvl+lYaamzztCTSo7lxrl4ESkaX2R0RqbPFC2yCx9Qhp0syh4zpyynG67YsEtc
         zJg4wPNNB0yhFrCcfKq9ZqOSJGw+nBlUoTRMwjVQOB8uNEE+RQT0Nx1ALm0E4S9LGpww
         VZOQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776044415; x=1776649215; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aBjiNkI9stkp1MHFMpR56Hup9/ejSX9EYTmhTEGF+54=;
        b=lqaTy1Y5V7EcsYUJRoBt2rJVXr3dcA//XOpqK1eDhusPJZqp1j+R/zpF1reU3UdSI1
         G346S5XSiPPwmchnr7hH4xfkFXtpRsmhB5P0/rf3EfW1n6MFOaSr0FbgHUh5KXQ11Cgr
         iCDxsHlLQH4c7Gs7eDmPgeNJ8ARZ019GgspiyMDDTSZzAoHvHak3qmVj26wr/6KHVIkE
         Px2j4Zvc+iAxGzc5vZLdv8ZH1mk997DC8Dzt0oRwD7P9stlLeROp4C8hPWjCQhCYXAkK
         JFyVPB3rLR9lR+W2ClfwuL4jHWFpVRHTRCMAwnZOsnvdELyDUR2errEe9yHHqZNM7TpW
         fAeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776044415; x=1776649215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aBjiNkI9stkp1MHFMpR56Hup9/ejSX9EYTmhTEGF+54=;
        b=ivj9K/ljzwSanYaEACNMCOjIWZRXHhKec/GrLogJuYtsnKsYPD6zC81sqfQwtwoIMV
         SWfrd9rudK0s87n7pMTZEAzPvCMXus0oK3W9nyCEFfcnUf6TpINntqealZaqWMU/EUnF
         ZIhs3TUrTy33AXfrBDojUpXPd5Cs7aB26rDrK4TvNSgQVrs878D+brByU1q8GLQVmAW5
         8eOek6Ow15SdRc4L8yxpM05hqBrJS1mvu/pOdxLEgHmZG0ECyId7DeIQy4wfvqfUE7XQ
         ScngyAMempD2n8gwfXuuMEo32084DbI4BPwnOAuDhBWn7tgYW1Dml1Lt5+Ra5D/N9Gq4
         33qQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3A5PlLWIZwOtGGZSW4m38H/F7lmBTF7BlHBV24YHTsD/wMZcD9SQviw83mSYxNZXXnke+dMFPAak=@lists.infradead.org
X-Gm-Message-State: AOJu0YzbBv1J5UKZQczzpFMHoFlldlQRXNQXVhM59rT8/txBnEXDQa6J
	vCL42ljvU6ovm5DnrpI9CYvFHFMAuwuHGnUOwWEfozaqVmACz8nCA/JA7/XD4yiyr/Am7pFRHs8
	HuW+lTPCob0HLHSwUy8unbO5VzRG8790=
X-Gm-Gg: AeBDiesp1wqNUv2HshkLDYL3phK8Yzm7WpMXxDmhqk+BXN+r6tzw6uNEeBxrxaOeUbG
	r0gHw1A9EKv2VVt6T2zf4oaxSKjIu3/lhuLg863Xe+NR9CPcpzsVqtgRwq94TUb7HkzCwqvcb9e
	R/KHIiLPv3rVPfwNGUiVI7qM9z8fJn93UbW82qalHBDBpeUVxoVKMbuVrV5Q0vPQQjI/uct5FfX
	qEEnFI5ZgY6E6VQHAfDf3J0BLBN+MNas+b9oXEesuCfJcq3PBi9Qut9Jc+pw5YcwujjXolJ5OCO
	8njGZWo=
X-Received: by 2002:a05:6820:f009:b0:68a:19ca:1d8a with SMTP id
 006d021491bc7-68be5c5cd16mr5867211eaf.12.1776044414716; Sun, 12 Apr 2026
 18:40:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260413005040.1211107-1-yschu@nuvoton.com> <20260413005040.1211107-2-yschu@nuvoton.com>
 <adxD10wsP7hJdR9y@lizhi-Precision-Tower-5810>
In-Reply-To: <adxD10wsP7hJdR9y@lizhi-Precision-Tower-5810>
From: Stanley Chu <stanley.chuys@gmail.com>
Date: Mon, 13 Apr 2026 09:40:02 +0800
X-Gm-Features: AQROBzCfF3qIvFos5ateo3z8KCMpvvkjFuLO38fuXZKhLHUiV6yJr3PVHmo0-zQ
Message-ID: <CAPwEoQPsp6mEqHaztnjKvh9qd49H7jKbq0EGBBR_fa70e-iR=g@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] i3c: master: svc: Fix missed IBI after false
 SLVSTART on NPCM845
To: Frank Li <Frank.li@nxp.com>
Cc: miquel.raynal@bootlin.com, alexandre.belloni@bootlin.com, 
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	tomer.maimon@nuvoton.com, kwliu@nuvoton.com, yschu@nuvoton.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_184017_643079_3B7A8E87 
X-CRM114-Status: GOOD (  24.96  )
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

T24gTW9uLCBBcHIgMTMsIDIwMjYgYXQgOToxNuKAr0FNIEZyYW5rIExpIDxGcmFuay5saUBueHAu
Y29tPiB3cm90ZToKPgo+IE9uIE1vbiwgQXByIDEzLCAyMDI2IGF0IDA4OjUwOjM5QU0gKzA4MDAs
IFN0YW5sZXkgQ2h1IHdyb3RlOgo+ID4gRnJvbTogU3RhbmxleSBDaHUgPHlzY2h1QG51dm90b24u
Y29tPgo+ID4KPiA+IFRoZSBOUENNODQ1IEkzQyBjb250cm9sbGVyIG1heSByYWlzZSBhIGZhbHNl
IFNMVlNUQVJUIGludGVycnVwdC4gVGhlCj4gPiBoYW5kbGVyIGZpcnN0IGxhdGNoZXMgTVNUQVRV
UyBhbmQgdGhlbiBjbGVhcnMgU0xWU1RBUlQuIElmIGEgcmVhbCBJQkkKPiA+IHJlcXVlc3QgYXJy
aXZlcyBhZnRlciB0aGUgaGFuZGxlciBsYXRjaGVzIE1TVEFUVVMgYnV0IGJlZm9yZSBpdCBjbGVh
cnMKPiA+IHRoZSBTTFZTVEFSVCBpbnRlcnJ1cHQgc3RhdHVzLAo+Cj4gSG93IHRoaXMgaGFwcGVu
PyBJZiBpcnEgaGFuZGxlciBydW5uaW5nLCBoYXJkd2FyZSAocmVhbCBJQkkpIHdpbGwgdHJpZ2dl
cgo+IGlycSBsaW5lIGJlZm9yZSBpdC4KPgo+IERvIHlvdSBlbmFibGUgb3RoZXIgdHlwZSBpcnE/
Cj4KPiBGcmFuawoKSGkgRnJhbmssCgpPbmx5IFNMVlNUQVJUIGludGVycnVwdC4gQmVsb3cgaXMg
dGhlIHNlcXVlbmNlOgotIEhXIHJhaXNlcyBhIGZhbHNlIFNMVlNUQVJUIGludGVycnVwdC4KLSBU
aGUgSVJRIGhhbmRsZXIgbGF0Y2hlcyB0aGUgTVNUQVRVUyByZWdpc3Rlci4KLSBCZWZvcmUgdGhl
IGhhbmRsZXIgY2xlYXJzIHRoZSBTTFZTVEFSVCBzdGF0dXMsIGEgcmVhbCBJQkkgcmVxdWVzdCBh
cnJpdmVzLgotIEhXIHVwZGF0ZXMgdGhlIFNMVlJFUSBzdGF0ZSB0byBpbmRpY2F0ZSBhIHBlbmRp
bmcgSUJJLgotIFRoZSBoYW5kbGVyIGNvbnRpbnVlcyB1c2luZyB0aGUgc3RhbGUgTVNUQVRVUyBz
bmFwc2hvdCwgZG9lcyBub3Qgc2VlCiAgdGhlIG5ldyBTTFZSRVEgc3RhdGUsIGFuZCByZXR1cm5z
IGVhcmx5LgotIFRoZSByZWFsIElCSSBpcyBtaXNzZWQgYW5kIG5vIGZ1cnRoZXIgaW50ZXJydXB0
IGlzIGdlbmVyYXRlZC4KClRoYW5rcy4KCj4KPiA+IEhXIHNldHMgdGhlIFNMVlJFUSBzdGF0ZS4g
SG93ZXZlciwgdGhlCj4gPiBoYW5kbGVyIHN0aWxsIHJlbGllcyBvbiB0aGUgc3RhbGUgTVNUQVRV
UyBzbmFwc2hvdCwgcmV0dXJucyBlYXJseSwgYW5kCj4gPiBtaXNzZXMgdGhlIHJlYWwgSUJJLiBO
byBmdXJ0aGVyIGludGVycnVwdCBpcyBnZW5lcmF0ZWQgZm9yIHRoaXMgcGVuZGluZwo+ID4gSUJJ
Lgo+ID4KPiA+IFJlLXJlYWQgTVNUQVRVUyB0byBvYnRhaW4gdGhlIGxhdGVzdCBzdGF0ZSBhbmQg
YXZvaWQgbWlzc2luZyBhIHJlYWwgSUJJCj4gPiBkdWUgdG8gdGhpcyByYWNlIGNvbmRpdGlvbi4K
PiA+Cj4gPiBGaXhlczogNGRkMTJlOTQ0ZjA3ICgiaTNjOiBtYXN0ZXI6IHN2YzogRml4IG5wY204
NDUgaW52YWxpZCBzbHZzdGFydCBldmVudCIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBTdGFubGV5IENo
dSA8eXNjaHVAbnV2b3Rvbi5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2kzYy9tYXN0ZXIvc3Zj
LWkzYy1tYXN0ZXIuYyB8IDE2ICsrKysrKysrKysrKy0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwg
MTIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvc3Zj
LWkzYy1tYXN0ZXIuYwo+ID4gaW5kZXggYjg0YjMyNGU0MTExLi43ZDg4ZThmZTM3NDIgMTAwNjQ0
Cj4gPiAtLS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYwo+ID4gKysrIGIv
ZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMKPiA+IEBAIC02NzIsMTAgKzY3Miwx
OCBAQCBzdGF0aWMgaXJxcmV0dXJuX3Qgc3ZjX2kzY19tYXN0ZXJfaXJxX2hhbmRsZXIoaW50IGly
cSwgdm9pZCAqZGV2X2lkKQo+ID4gICAgICAgLyogQ2xlYXIgdGhlIGludGVycnVwdCBzdGF0dXMg
Ki8KPiA+ICAgICAgIHdyaXRlbChTVkNfSTNDX01JTlRfU0xWU1RBUlQsIG1hc3Rlci0+cmVncyAr
IFNWQ19JM0NfTVNUQVRVUyk7Cj4gPgo+ID4gLSAgICAgLyogSWdub3JlIHRoZSBmYWxzZSBldmVu
dCAqLwo+ID4gLSAgICAgaWYgKHN2Y19oYXNfcXVpcmsobWFzdGVyLCBTVkNfSTNDX1FVSVJLX0ZB
TFNFX1NMVlNUQVJUKSAmJgo+ID4gLSAgICAgICAgICFTVkNfSTNDX01TVEFUVVNfU1RBVEVfU0xW
UkVRKGFjdGl2ZSkpCj4gPiAtICAgICAgICAgICAgIHJldHVybiBJUlFfSEFORExFRDsKPiA+ICsg
ICAgIGlmIChzdmNfaGFzX3F1aXJrKG1hc3RlciwgU1ZDX0kzQ19RVUlSS19GQUxTRV9TTFZTVEFS
VCkpIHsKPiA+ICsgICAgICAgICAgICAgLyoKPiA+ICsgICAgICAgICAgICAgICogUmUtcmVhZCBN
U1RBVFVTIHRvIG9idGFpbiB0aGUgbGF0ZXN0IHN0YXRlIGFuZCBhdm9pZAo+ID4gKyAgICAgICAg
ICAgICAgKiBtaXNzaW5nIGFuIElCSSB0aGF0IGFycml2ZXMgYWZ0ZXIgTVNUQVRVUyBpcyBsYXRj
aGVkCj4gPiArICAgICAgICAgICAgICAqIGJ1dCBiZWZvcmUgU0xWU1RBUlQgaXMgY2xlYXJlZC4K
PiA+ICsgICAgICAgICAgICAgICovCj4gPiArICAgICAgICAgICAgIGFjdGl2ZSA9IHJlYWRsKG1h
c3Rlci0+cmVncyArIFNWQ19JM0NfTVNUQVRVUyk7Cj4gPiArCj4gPiArICAgICAgICAgICAgIC8q
IElnbm9yZSB0aGUgZmFsc2UgZXZlbnQgKi8KPiA+ICsgICAgICAgICAgICAgaWYgKCFTVkNfSTND
X01TVEFUVVNfU1RBVEVfU0xWUkVRKGFjdGl2ZSkpCj4gPiArICAgICAgICAgICAgICAgICAgICAg
cmV0dXJuIElSUV9IQU5ETEVEOwo+ID4gKyAgICAgfQo+ID4KPiA+ICAgICAgIC8qCj4gPiAgICAg
ICAgKiBUaGUgU0RBIGxpbmUgcmVtYWlucyBsb3cgdW50aWwgdGhlIHJlcXVlc3QgaXMgcHJvY2Vz
c2VkLgo+ID4gLS0KPiA+IDIuMzQuMQo+ID4KCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0Cmxp
bnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
