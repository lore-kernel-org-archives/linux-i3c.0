Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 781D9C71136
	for <linux-i3c@archiver.kernel.org>; Tue, 17 Jun 2025 15:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VOI380ckDB/12oIIMBmMnlV2XFyzErzWw2qHB6MwuYU=; b=2RGDBqMx7Mch+L
	dtwk0iaJyWfNm1CbmOvhaZIJR0IPfozc4QMSpVHBcqgJvFqp+Vx7EdhCCwTsuInrm045OBdHCvOWo
	uLuMJ+zwPlc/8Z3q+oKlnkEjjjl/O8aLf4oX3WMwyOXYc4qLHIbvcWcjpBsyafnWXmDgMJ+iP/+a2
	NnTLE6N3Stv45N3W7o+fdEl6IGCwe7eaLS90DCZgHz4/298YwKIBBLpsHmecDOYiptblognSYOkLg
	yC108RPwemyqLIL5rvwtw28p4fM5p0uOnTmXZkTTGDVAPcPyRblwq187Qf0iNb1NAQcmGYyd5DJab
	GF/jm0CoTEK1/iTdVqqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRYh7-00000007oQC-11fp;
	Tue, 17 Jun 2025 15:57:53 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRXeC-00000007dr4-2V1h
	for linux-i3c@lists.infradead.org;
	Tue, 17 Jun 2025 14:50:49 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3a361b8a664so5791145f8f.3
        for <linux-i3c@lists.infradead.org>; Tue, 17 Jun 2025 07:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750171846; x=1750776646; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6sIQYIOw+Li4heaQIClyl0MJmZhztR0A6h9Y965AmpE=;
        b=VvspJZWbt9xLfxXnUZ0snJ6tkkMIkpD2tzHJjvIqJGP7myFIrMDUJulR9aJ+lJxRGI
         C6EdLtR9GxC5ea6AvSY5kTF6HXqjSdmUl4WFj8QpnPiyKs8ccRd/y46NWkn9HHFlQsqH
         VjV7uYdxCOi/csYMYi0K9OBjVoRmvJLzosiGja7tAum56wKzsaGUqtJo/IQzH7PLkzdq
         ToSAix5pnq+l7olgv9cgZ5YJPYgSgM3us05bXWp7lKEOvReA2g1hz8+eQ3j4B6BrLnOz
         AtQhIjKWQuxxkBysjHRZawbcdEeXdw+WbI5clu/aD/5E3UVTNLM1/Rh0zEbEr0rT6seW
         yXCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750171846; x=1750776646;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6sIQYIOw+Li4heaQIClyl0MJmZhztR0A6h9Y965AmpE=;
        b=LziAKvbXXkqe0Cx05McSxUlYM6fQK6JvhsC7nH3DWcqxjK+K7G7FlSe7NlzB1bJ4KP
         /QADrtld/LOLt6WNSOnsQ7DbkuY4CuRLGj2aA3Qx7+fpe5Yk5G0qkzpgUqQRyI4wQDqJ
         ZdPXgiQzHWX2QI62Wd/2GSFfRj1Ww/gYAWcFWuPOpHGqAd9tipaffpEmVArt+27z904J
         Aa4qsUvjsJXeYgRN6aJAQzWQuRLoCVhIDONwssyixJXtr1mhsGVcN/bmFMyiK2jd+/Ss
         TcQZWj/xZdm38vEQu3HuDNS2neUR+qU9mbNlyKiE3a+3Q1lbGF7WrzgtnExyjCw8o2eO
         wHog==
X-Forwarded-Encrypted: i=1; AJvYcCVSKDFkCcrvUOo/7A7fDDzWw4zUpUf2byjMpVAbSXIHxxvO9K2Yo0H2lhr5RcFNxtnCXVU9SkD3S18=@lists.infradead.org
X-Gm-Message-State: AOJu0YydE3Zs81fx66TkoYKMZ7VY3F0sHQBQ3M+SKCcqgNE4fcSty/OJ
	PGSu2IcW5W0L7y0UmI4E0ez2P1viT0ZwbnYIpSHtxyRj0AaijC95yX3G
X-Gm-Gg: ASbGncu2Tc2srpbKNThvMZwnAWt+neDo3drF3tuz2E7U49iAqxQevwmVWuA9c54mkQX
	eAS+F52nNOulTNX9Uc6QCASCXNkMLbuMBMB+z2+j5AX+dfA70ddMK1MfS1P5Z/uUAre6M+y+nVI
	OtoZ/7DEkVTVlm4NcLGDnRPCAcKayTBeLqKqiW39ay6Mb6UHSjUzRHcz5WZT2YK/a7wxYqscDkY
	dK2Wc1aMZ0OLehiOH8R9rjGNiROQ4S0w2oA0PI5alc3GnK6UYomd5eWcolaXD96+5BIoP1PKRoC
	/y0Ra1lhwhCzBm/Lo0wLv+afkDZ9zX9E4CO3aDPuW9TplYdNEV2xsnzrXnvAGMe1B/9SClWhbaa
	4Ale31PU=
X-Google-Smtp-Source: AGHT+IGenP4A7u1sQEyb0CDTNFDAGJg0rzMGlGqsI3G9roPlmRR2B1MNfF6O0TOKovnr/fKEBSSKyQ==
X-Received: by 2002:a5d:584d:0:b0:3a5:243c:6042 with SMTP id ffacd0b85a97d-3a572398e5cmr12098068f8f.2.1750171846268;
        Tue, 17 Jun 2025 07:50:46 -0700 (PDT)
Received: from HYB-DlYm71t3hSl.ad.analog.com ([137.71.226.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a589092d1asm2026683f8f.24.2025.06.17.07.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 07:50:45 -0700 (PDT)
Date: Tue, 17 Jun 2025 16:50:43 +0200
From: Jorge Marques <gastmaier@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Jorge Marques <jorge.marques@analog.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: i3c: Add adi-i3c-master
Message-ID: <ildi2pup2zkyv4stuknkrjysex3yzsbrrsrwbgcc4xgvdhwrdd@7qh4y6mutgy2>
References: <20250606-adi-i3c-master-v2-0-e68b9aad2630@analog.com>
 <20250606-adi-i3c-master-v2-1-e68b9aad2630@analog.com>
 <20250606-sliver-freeing-d01268258c25@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250606-sliver-freeing-d01268258c25@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_075048_639580_2C126335 
X-CRM114-Status: GOOD (  24.38  )
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

T24gRnJpLCBKdW4gMDYsIDIwMjUgYXQgMDU6MDg6NDVQTSArMDEwMCwgQ29ub3IgRG9vbGV5IHdy
b3RlOgo+IE9uIEZyaSwgSnVuIDA2LCAyMDI1IGF0IDAzOjIxOjAyUE0gKzAyMDAsIEpvcmdlIE1h
cnF1ZXMgd3JvdGU6Cj4gPiBBZGQgYmluZGluZ3MgZG9jIGZvciBBREkgSTNDIENvbnRyb2xsZXIg
SVAgY29yZSwgYSBGUEdBIHN5bnRoZXNpemFibGUgSVAKPiA+IGNvcmUgdGhhdCBpbXBsZW1lbnRz
IHRoZSBNSVBJIEkzQyBCYXNpYyBjb250cm9sbGVyIHNwZWNpZmljYXRpb24uCj4gPiAKPiA+IFNp
Z25lZC1vZmYtYnk6IEpvcmdlIE1hcnF1ZXMgPGpvcmdlLm1hcnF1ZXNAYW5hbG9nLmNvbT4KPiA+
IC0tLQo+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kzYy9hZGksaTNjLW1hc3Rlci55YW1s
ICAgIHwgNjMgKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIE1BSU5UQUlORVJTICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDUgKysKPiA+ICAyIGZpbGVzIGNoYW5n
ZWQsIDY4IGluc2VydGlvbnMoKykKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9pM2MvYWRpLGkzYy1tYXN0ZXIueWFtbCBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9pM2MvYWRpLGkzYy1tYXN0ZXIueWFtbAo+ID4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAuLmU3ZmFlMzk0YWQ4ZmQ0MTQzZWIxZmZmYjk1OTFhMzBhMmQ2Y2M2YWMKPiA+IC0t
LSAvZGV2L251bGwKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9p
M2MvYWRpLGkzYy1tYXN0ZXIueWFtbAo+ID4gQEAgLTAsMCArMSw2MyBAQAo+ID4gKyMgU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UKPiA+ICslWUFN
TCAxLjIKPiA+ICstLS0KPiA+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2kz
Yy9hZGksaTNjLW1hc3Rlci55YW1sIwo+ID4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9y
Zy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+ID4gKwo+ID4gK3RpdGxlOiBBbmFsb2cgRGV2aWNl
cyBJM0MgQ29udHJvbGxlcgo+ID4gKwo+ID4gK2Rlc2NyaXB0aW9uOiB8Cj4gPiArICBUaGUgQURJ
IEkzQyBjb250cm9sbGVyIGltcGxlbWVudHMgYSBzdWJzZXQgb2YgdGhlIEkzQy1iYXNpYyBzcGVj
aWZpY2F0aW9uIHRvCj4gPiArICBpbnRlcmZhY2UgSTNDIGFuZCBJMkMgcGVyaXBoZXJhbHMgWzFd
Lgo+ID4gKwo+ID4gKyAgWzFdIGh0dHBzOi8vYW5hbG9nZGV2aWNlc2luYy5naXRodWIuaW8vaGRs
L2xpYnJhcnkvaTNjX2NvbnRyb2xsZXIKPiA+ICsKPiA+ICttYWludGFpbmVyczoKPiA+ICsgIC0g
Sm9yZ2UgTWFycXVlcyA8am9yZ2UubWFycXVlc0BhbmFsb2cuY29tPgo+ID4gKwo+ID4gK3Byb3Bl
cnRpZXM6Cj4gPiArICBjb21wYXRpYmxlOgo+ID4gKyAgICBjb25zdDogYWRpLGkzYy1tYXN0ZXIK
PiAKSGkgQ29ub3IsCj4gU2VlaW5nIHRoaXMgd2l0aCBubyB2ZXJzaW9uaW5nIGluZm8gaXMgcHJl
dHR5IHN1c3BlY3QuCj4gVGhlIGFkaSBzcGksIHB3bSwgYXhpLWRtYWMgZXRjIGFsbCBoYXZlIHZl
cnNpb25pbmcgaW5mbywgcGxlYXNlIHRyeSB0bwo+IGVtdWxhdGUgdGhhdC4KPiAKPiBPdGhlcndp
c2UsIEkgdGhpbmsgdGhpcyBpcyBva2F5Lgo+IAo+IENoZWVycywKPiBDb25vci4KPiAKVGhlIGRy
aXZlciBjaGVja3MgdGhlIElQIHZlcnNpb24gdmlhIHJlZ2lzdGVyIGFjY2VzcywgZm9yIHRoZSBv
dGhlciBhZGkKaXBzLCB0aGUgLXguMDAuYSBzdWZmaXggd2FzIG5ldmVyIHVwZGF0ZWQuIEZvciBl
eGFtcGxlLCB0aGUgYXhpLWRtYWMKY3VycmVudCBJUCB2ZXJzaW9uIGlzIHY0LjUuNjQgd2hpbGUg
dGhlIGNvbXBhdGlibGUgc3RpbGwgaXMgMS4wMC5hIGFuZAp0aGVyZSBpcyBhIG1lbnRpb24gb2Yg
djQuMy5hIGluIHRoZSBiaW5kaW5nLiBJdCBpcyB1bmNsZWFyIHdoZXRoZXIKc3VmZml4aW5nIGl0
IHdpdGggIi0xLjAwLmEiIHdvdWxkIGJlIHVzZWZ1bCwgb3IgaWYgdGhlIHRpbWUgY29tZXMgY2Fs
bAp0aGUgbmV3ICJhZGksaTNjLW1hc3Rlci0yIi4KCkRvIHlvdSBzdGlsbCB0aGluayBpdCBpcyBu
ZWNlc3Nhcnk/CgpCZXN0IHJlZ2FyZHMsCkpvcmdlCgo+ID4gKwo+ID4gKyAgcmVnOgo+ID4gKyAg
ICBtYXhJdGVtczogMQo+ID4gKwo+ID4gKyAgY2xvY2tzOgo+ID4gKyAgICBtaW5JdGVtczogMQo+
ID4gKyAgICBpdGVtczoKPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBUaGUgQVhJIGludGVyY29u
bmVjdCBjbG9jay4KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBUaGUgSTNDIGNvbnRyb2xsZXIg
Y2xvY2suCj4gPiArCj4gPiArICBjbG9jay1uYW1lczoKPiA+ICsgICAgaXRlbXM6Cj4gPiArICAg
ICAgLSBjb25zdDogYXhpCj4gPiArICAgICAgLSBjb25zdDogaTNjCj4gPiArCj4gPiArICBpbnRl
cnJ1cHRzOgo+ID4gKyAgICBtYXhJdGVtczogMQo+ID4gKwo+ID4gK3JlcXVpcmVkOgo+ID4gKyAg
LSBjb21wYXRpYmxlCj4gPiArICAtIHJlZwo+ID4gKyAgLSBjbG9ja3MKPiA+ICsgIC0gY2xvY2st
bmFtZXMKPiA+ICsgIC0gaW50ZXJydXB0cwo+ID4gKwo+ID4gK2FsbE9mOgo+ID4gKyAgLSAkcmVm
OiBpM2MueWFtbCMKPiA+ICsKPiA+ICt1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlCj4gPiAr
Cj4gPiArZXhhbXBsZXM6Cj4gPiArICAtIHwKPiA+ICsgICAgaTNjQDQ0YTAwMDAwIHsKPiA+ICsg
ICAgICAgIGNvbXBhdGlibGUgPSAiYWRpLGkzYy1tYXN0ZXIiOwo+ID4gKyAgICAgICAgcmVnID0g
PDB4NDRhMDAwMDAgMHgxMDAwPjsKPiA+ICsgICAgICAgIGludGVycnVwdHMgPSA8MCA1NiA0PjsK
PiA+ICsgICAgICAgIGNsb2NrcyA9IDwmY2xrYyAxNT4sIDwmY2xrYyAxNT47Cj4gPiArICAgICAg
ICBjbG9jay1uYW1lcyA9ICJheGkiLCAiaTNjIjsKPiA+ICsgICAgICAgICNhZGRyZXNzLWNlbGxz
ID0gPDM+Owo+ID4gKyAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47Cj4gPiArCj4gPiArICAgICAg
ICAvKiBJM0MgYW5kIEkyQyBkZXZpY2VzICovCj4gPiArICAgIH07Cj4gPiBkaWZmIC0tZ2l0IGEv
TUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwo+ID4gaW5kZXggOTZiODI3MDQ5NTAxODRiZDcxNjIz
ZmY0MWZjNGRmMzFlNGM3ZmU4Ny4uNmY1NmUxN2RjZWNmOTAyYzY4MTI4MjdjMWVjM2UwNjdjNjVl
OTg5NCAxMDA2NDQKPiA+IC0tLSBhL01BSU5UQUlORVJTCj4gPiArKysgYi9NQUlOVEFJTkVSUwo+
ID4gQEAgLTExMjQzLDYgKzExMjQzLDExIEBAIFM6CU1haW50YWluZWQKPiA+ICBGOglEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTNjL2FzcGVlZCxhc3QyNjAwLWkzYy55YW1sCj4g
PiAgRjoJZHJpdmVycy9pM2MvbWFzdGVyL2FzdDI2MDAtaTNjLW1hc3Rlci5jCj4gPiAgCj4gPiAr
STNDIERSSVZFUiBGT1IgQU5BTE9HIERFVklDRVMgSTNDIENPTlRST0xMRVIgSVAKPiA+ICtNOglK
b3JnZSBNYXJxdWVzIDxqb3JnZS5tYXJxdWVzQGFuYWxvZy5jb20+Cj4gPiArUzoJTWFpbnRhaW5l
ZAo+ID4gK0Y6CURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pM2MvYWRpLGkzYy1t
YXN0ZXIueWFtbAo+ID4gKwo+ID4gIEkzQyBEUklWRVIgRk9SIENBREVOQ0UgSTNDIE1BU1RFUiBJ
UAo+ID4gIE06CVByemVteXPFgmF3IEdhaiA8cGdhakBjYWRlbmNlLmNvbT4KPiA+ICBTOglNYWlu
dGFpbmVkCj4gPiAKPiA+IC0tIAo+ID4gMi40My4wCj4gPiAKCgoKLS0gCmxpbnV4LWkzYyBtYWls
aW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
