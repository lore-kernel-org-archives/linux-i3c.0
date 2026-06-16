Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3EB8CD98CF
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Jun 2026 10:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LRTW0w7/wVdbpw3LbZXF72vqmKV3n6qVSaS7lVOa+1M=; b=zvkqc8m9IwAmym
	VpGHnuRuuV3NYPH9XRCc+3DzoWbvsf/i3RhMJN/IdqQFLq2kun7HTR6eb6VBaIJAQ+oGGQpDJ3uww
	7oHAXnmMExnYbAeL2WndmXo4/Jfy39pcKjFA0xAm2kYkOczlt3hS1ifDJRVTQcCUIdOv82S8XuxqR
	mzT0CVHYddCthaFAsVWr0vB52pltV066LmZdsGqiDvi9dM1+xql+qbTHS62Ub0l94qGAfmV4J909c
	HQYtsUHJZbdkHX7gbyCaFRF59hC4smL6tenAKxtQ3Igk9CzqQOdS9gxTQGMqE8q3b8kH6ynASaRZ0
	FPcMCQmxJZGBrA1ZDoCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZQni-0000000FaP8-1y8B;
	Tue, 16 Jun 2026 10:13:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZQnh-0000000FaOo-3RVb
	for linux-i3c@lists.infradead.org;
	Tue, 16 Jun 2026 10:13:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 37AD6600AB;
	Tue, 16 Jun 2026 10:13:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61AA81F00A3A;
	Tue, 16 Jun 2026 10:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781604824;
	bh=BkS3F1+/DWISLTHviORQVN8XvF4HhhDUErq5yxdCXG4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nbYAlRwVONhVFU7bvSbB31+CNyMYVbFXJg8chDuHmKJb5o1jFDs/ilvPC9Oh4MLUC
	 uE+9ULHIshuKPK5IBau89un4BM5QQXKXl5c7e4eYNISwPFpQYdohIyEfPCrsiSnTYx
	 dUJ7VqIfAo+6ltw3VlvStW9ordY+YkTAXanjAvfXlSGVXNBl+T/Ap5L441s2up8kMK
	 nu9sJIDhvdgUn+ZuR/59+NzMcUNtd85oSteISC52RIxwm8tPk8iHJqJqto/+5iRLNs
	 EWVgMykh8LnQQuh1jAJxNMSyY/h6t1LvcSLVPKb1pXzu9MhzpWRDTf5WOiwgkIfzzW
	 fpuISlY/jsmLA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 07/12] i3c: dw-i3c-master: Add SETAASA as supported
 CCC
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: Frank.Li@kernel.org, conor+dt@kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20260616095429.3947205-8-akhilrajeev@nvidia.com>
References: <20260616095429.3947205-8-akhilrajeev@nvidia.com>
Date: Tue, 16 Jun 2026 10:13:43 +0000
Message-Id: <20260616101344.61AA81F00A3A@smtp.kernel.org>
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

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpQcmUtZXhpc3RpbmcgaXNzdWVzOgot
IFtIaWdoXSBIYXJkd2FyZSByZWdpc3RlcnMgYXJlIGFjY2Vzc2VkIGJlZm9yZSBydW50aW1lIFBN
IGlzIHJlc3VtZWQsIHBvdGVudGlhbGx5IGNhdXNpbmcgYSBidXMgZmF1bHQuCi0tCgpjb21taXQg
MGRkM2ExNzE2NzI1ODAwYzhmNzQ1OWE3ZTIyMDQ0MTZhNDQ4OGFjZgpBdXRob3I6IEFraGlsIFIg
PGFraGlscmFqZWV2QG52aWRpYS5jb20+CgppM2M6IGR3LWkzYy1tYXN0ZXI6IEFkZCBTRVRBQVNB
IGFzIHN1cHBvcnRlZCBDQ0MKClRoaXMgY29tbWl0IGFkZHMgU0VUQUFTQSBhbmQgU0VUSElEIHRv
IHRoZSBzdXBwb3J0ZWQgbGlzdCBvZiBDQ0MgY29tbWFuZHMgZm9yCnRoZSBEZXNpZ25XYXJlIEkz
QyBob3N0IGNvbnRyb2xsZXIuIFNFVEFBU0EgYXNzaWducyBwcmVkZWZpbmVkIHN0YXRpYwphZGRy
ZXNzZXMgdG8gYWxsIGRldmljZXMgb24gdGhlIGJ1cywgYW5kIFNFVEhJRCBzdG9wcyBISUQgYml0
IGZsaXBwaW5nIGFzIGEKcHJlcmVxdWlzaXRlLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2Mv
bWFzdGVyL2R3LWkzYy1tYXN0ZXIuYyBiL2RyaXZlcnMvaTNjL21hc3Rlci9kdy1pM2MtbWFzdGVy
LmMKPiBpbmRleCA5NzFiNDI5Yjc2YmM4Li4zZTUxMGZkZGYwNmM1IDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvaTNjL21hc3Rlci9kdy1pM2MtbWFzdGVyLmMKPiArKysgYi9kcml2ZXJzL2kzYy9tYXN0
ZXIvZHctaTNjLW1hc3Rlci5jCj4gQEAgLTMwOSw2ICszMDksOCBAQCBzdGF0aWMgYm9vbCBkd19p
M2NfbWFzdGVyX3N1cHBvcnRzX2NjY19jbWQoc3RydWN0IGkzY19tYXN0ZXJfY29udHJvbGxlciAq
bSwKPiAgCWNhc2UgSTNDX0NDQ19HRVRTVEFUVVM6Cj4gIAljYXNlIEkzQ19DQ0NfR0VUTVhEUzoK
PiAgCWNhc2UgSTNDX0NDQ19HRVRIRFJDQVA6Cj4gKwljYXNlIEkzQ19DQ0NfU0VUQUFTQToKPiAr
CWNhc2UgSTNDX0NDQ19WRU5ET1IoMCwgdHJ1ZSk6IC8qIFNFVEhJRCAqLwo+ICAJCXJldHVybiB0
cnVlOwo+ICAJZGVmYXVsdDoKPiAgCQlyZXR1cm4gZmFsc2U7CgpbIC4uLiBdCgo+IHN0YXRpYyBp
bnQgZHdfaTNjX21hc3Rlcl9zZW5kX2NjY19jbWQoc3RydWN0IGkzY19tYXN0ZXJfY29udHJvbGxl
ciAqbSwKPiAJCQkJICAgICAgc3RydWN0IGkzY19jY2NfY21kICpjY2MpCj4gewo+IAlzdHJ1Y3Qg
ZHdfaTNjX21hc3RlciAqbWFzdGVyID0gdG9fZHdfaTNjX21hc3RlcihtKTsKPiAJaW50IHJldCA9
IDA7Cj4gCj4gCWlmIChjY2MtPmlkID09IEkzQ19DQ0NfRU5UREFBKQo+IAkJcmV0dXJuIC1FSU5W
QUw7Cj4gCj4gCS8qIEFNRCBwbGF0Zm9ybSBzcGVjaWZpYyBPRCBhbmQgUFAgdGltaW5ncyAqLwo+
IAlpZiAobWFzdGVyLT5xdWlya3MgJiBBTURfSTNDX09EX1BQX1RJTUlORykgewo+IAkJYW1kX2Nv
bmZpZ3VyZV9vZF9wcF9xdWlyayhtYXN0ZXIpOwo+IAkJd3JpdGVsKG1hc3Rlci0+aTNjX3BwX3Rp
bWluZywgbWFzdGVyLT5yZWdzICsgU0NMX0kzQ19QUF9USU1JTkcpOwo+IAkJd3JpdGVsKG1hc3Rl
ci0+aTNjX29kX3RpbWluZywgbWFzdGVyLT5yZWdzICsgU0NMX0kzQ19PRF9USU1JTkcpOwo+IAl9
Cj4gCj4gCXJldCA9IHBtX3J1bnRpbWVfcmVzdW1lX2FuZF9nZXQobWFzdGVyLT5kZXYpOwoKW1Nl
dmVyaXR5OiBIaWdoXQpUaGlzIGlzIGEgcHJlLWV4aXN0aW5nIGlzc3VlLCBidXQgY291bGQgYWNj
ZXNzaW5nIHRoZXNlIGhhcmR3YXJlIHJlZ2lzdGVycwpiZWZvcmUgcnVudGltZSBQTSBpcyByZXN1
bWVkIGNhdXNlIGEgYnVzIGZhdWx0PwoKSWYgdGhlIGRldmljZSBpcyBydW50aW1lLXN1c3BlbmRl
ZCwgaXRzIGNsb2NrcyBhbmQgcG93ZXIgZG9tYWlucyBhcmUgZGlzYWJsZWQuCkFjY2Vzc2luZyBt
ZW1vcnktbWFwcGVkIHJlZ2lzdGVycyBvZiBhIGNsb2NrLWdhdGVkIGRldmljZSBoZXJlIG1pZ2h0
IGxlYWQgdG8KYW4gYXN5bmNocm9ub3VzIGJ1cyBlcnJvciBvciBhIHN5c3RlbSBoYW5nLgoKU2hv
dWxkIHRoZSByZWdpc3RlciB3cml0ZXMgYmUgbW92ZWQgYWZ0ZXIgcG1fcnVudGltZV9yZXN1bWVf
YW5kX2dldCgpCmNvbXBsZXRlcyBzdWNjZXNzZnVsbHk/CgotLSAKU2FzaGlrbyBBSSByZXZpZXcg
wrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNjE2MDk1NDI5LjM5NDcyMDUt
MS1ha2hpbHJhamVldkBudmlkaWEuY29tP3BhcnQ9NwoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxp
c3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
