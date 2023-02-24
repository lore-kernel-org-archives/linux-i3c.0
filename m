Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90318C64EC7
	for <linux-i3c@archiver.kernel.org>; Sat, 25 Feb 2023 21:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=inPAZaiWuQ36rrLf2v4hvI5R8V0zRPyU9EQrjnA57Rw=; b=KRmGL/DIlj/EIU
	2u+uyLPGybIODmr2zrMBfY/vrySszRaxcakRDm8ew7/uY4s5v2ztntssIXIMt073Hmoh3yLKEXmVa
	vGUbNfPp12Wia48lhc17jCNl6Y3wH8zgxLqVasEDJlMfB9oHug1stgIrSienA0ue/CGr6xFepeyOT
	m2mAIEarV7X05YPW3qhDRS5xFvtOtUEdgxKXSIqbQjJhEoeRffZe9qnPT1RzGeiNUqQND1ZCbwqbp
	6kWml3tR6yVJZKRPZNk93fI2iit30uBguUr0K8QHS9DOkOwYV17b9JGOJHPx1aM7asY54duw/mH14
	EThoCxiMO2CoeivfW4Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pW2Bi-006LS6-7r; Sat, 25 Feb 2023 21:34:38 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVTM6-001W1h-Ev
	for linux-i3c@lists.infradead.org; Fri, 24 Feb 2023 08:23:03 +0000
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 6A45120034;
	Fri, 24 Feb 2023 16:22:55 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1677226976;
	bh=iLGvFiXdgMZcBCSM5IXWL521tc01t8fA0fqKWtmrepw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=YN/GR3vTnz8w7IutGlBtCbr2oGhuIGJml4JtiunfPTB2HRE3+u4kLc6HfjVO/utO8
	 D9mYBPxm02wJS2T7tqKHjcCJuqoPh2YY0+c36mxFa3kqdyYqGOf4wQBuzxK3Xkev2G
	 LLy00gIlTqlg8ZIUkJQ2EsbXnoI6hfaEM7McSUXhb1y9/5hRUptKyLsY2VbEBhBI/X
	 85RhYwWVHKNbUzpMX04RfIuWktknOMgmL16xk2EiT9haHhueh8vYbTps3HG7x9rVJk
	 LgNdEpAoy82o4z8vmxUGla/HujgH7ievQmGP0dgLY2EaxFXWpOv2Imp72u0R+ZRiAK
	 VTGmcKgufNlsg==
Message-ID: <1cb6effca796c914a523d62a4dfff17ef7368ce7.camel@codeconstruct.com.au>
Subject: Re: [PATCH] i3c: dw: Use configured rate and bus mode for clock
 configuration
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Vitor Soares <ivitro@gmail.com>, linux-i3c@lists.infradead.org
Cc: linux-aspeed@lists.ozlabs.org, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>
Date: Fri, 24 Feb 2023 16:22:55 +0800
In-Reply-To: <547646005ac9e5013350c8ed84136088b6be7bad.camel@codeconstruct.com.au>
References: <20230216062040.497815-1-jk@codeconstruct.com.au>
	 <07f8ecaa-9a1a-dcf9-a7f2-fb67f9ddd51a@gmail.com>
	 <547646005ac9e5013350c8ed84136088b6be7bad.camel@codeconstruct.com.au>
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_002302_723595_32B105B3 
X-CRM114-Status: GOOD (  12.98  )
X-Mailman-Approved-At: Sat, 25 Feb 2023 13:34:36 -0800
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

SGkgVml0b3IsCgo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgc2NsX3RpbWluZyA9IFNDTF9FWFRfTENO
VF8xKGxjbnQpOwo+ID4gPiAtwqDCoMKgwqDCoMKgwqBsY250ID0gRElWX1JPVU5EX1VQKGNvcmVf
cmF0ZSwgSTNDX0JVU19TRFIyX1NDTF9SQVRFKSAtIGhjbnQ7Cj4gPiA+ICvCoMKgwqDCoMKgwqDC
oGxjbnQgPSBtYXhfdCh1OCwgbGNudCwKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIERJVl9ST1VORF9VUChjb3JlX3JhdGUsIEkzQ19CVVNfU0RSMl9TQ0xfUkFU
RSkgLSBoY250KTsKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoHNjbF90aW1pbmcgfD0gU0NMX0VYVF9M
Q05UXzIobGNudCk7Cj4gPiA+IC3CoMKgwqDCoMKgwqDCoGxjbnQgPSBESVZfUk9VTkRfVVAoY29y
ZV9yYXRlLCBJM0NfQlVTX1NEUjNfU0NMX1JBVEUpIC0gaGNudDsKPiA+ID4gK8KgwqDCoMKgwqDC
oMKgbGNudCA9IG1heF90KHU4LCBsY250LAo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgRElWX1JPVU5EX1VQKGNvcmVfcmF0ZSwgSTNDX0JVU19TRFIzX1NDTF9S
QVRFKSAtIGhjbnQpOwo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgc2NsX3RpbWluZyB8PSBTQ0xfRVhU
X0xDTlRfMyhsY250KTsKPiA+ID4gLcKgwqDCoMKgwqDCoMKgbGNudCA9IERJVl9ST1VORF9VUChj
b3JlX3JhdGUsIEkzQ19CVVNfU0RSNF9TQ0xfUkFURSkgLSBoY250Owo+ID4gPiArwqDCoMKgwqDC
oMKgwqBsY250ID0gbWF4X3QodTgsIGxjbnQsCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBESVZfUk9VTkRfVVAoY29yZV9yYXRlLCBJM0NfQlVTX1NEUjRfU0NM
X1JBVEUpIC0gaGNudCk7Cj4gPiAKPiA+IHdoYXQgYWJvdXQgdG8gdXNlIGEgZm9yIGxvb3AgYW5k
IG9ubHkgZG8gbGNudCBjYWxjdWxhdGlvbiBpZgo+ID4gCj4gPiBidXMtPnNjbF9yYXRlLmkzYyA+
IEkzQ19CVVNfU0RSeF9TQ0xfUkFURSA/Cj4gCj4gSSBoYXZlIGludGVuZGVkIGZvciB0aGlzIHRv
IGJlIHRoZSBzYW1lIGFzIHRoZSBleGlzdGluZyBjYWxjdWxhdGlvbnMsCj4ganVzdCBhcHBseWlu
ZyB0aGUgbGltaXQgb2YgdGhlIGdsb2JhbCBzY2xfcmF0ZS4KPiAKPiBXZSBjb3VsZCByZXN0cnVj
dHVyZSBhcyBhIGZvci1sb29wICh3aGljaCBJJ2Qgc3VnZ2VzdCBzcGxpdHRpbmcgYXMgYQo+IHNl
cGFyYXRlIGNoYW5nZSwgc28gdGhhdCB0aGUgY2FsY3VsYXRpb24gY2hhbmdlcyBhcmUgbW9yZSBv
YnZpb3VzKSwKPiBidXQgaXQncyBnb2luZyB0byBnZXQgYSBiaXQgd2VpcmQgd2l0aCB0aGUgbWFj
cm8gdXNhZ2UgdGhlcmUuCgpBY3R1YWxseSwgYSBmb3ItbG9vcCBpc24ndCB0b28gYmFkOgoKICBz
dGF0aWMgY29uc3Qgc3RydWN0IHsKICAJdW5zaWduZWQgaW50IGZyZXE7CiAgCXVuc2lnbmVkIGlu
dCBzaGlmdDsKICB9IHNkcnNbXSA9IHsKICAJeyBJM0NfQlVTX1NEUjFfU0NMX1JBVEUsIDAgfSwK
ICAJeyBJM0NfQlVTX1NEUjJfU0NMX1JBVEUsIDggfSwKICAJeyBJM0NfQlVTX1NEUjNfU0NMX1JB
VEUsIDE2IH0sCiAgCXsgSTNDX0JVU19TRFI0X1NDTF9SQVRFLCAyNCB9LAogIH07CiAgCiAgc3Rh
dGljIGludCBkd19pM2NfY2xrX2NmZyhzdHJ1Y3QgZHdfaTNjX21hc3RlciAqbWFzdGVyLCB1bnNp
Z25lZCBsb25nIGkzY19yYXRlLAogIAkJCSAgYm9vbCBwdXJlKQogIHsKICAJLyogLi4uICovCiAg
CiAgCS8qCiAgCSAqIFRpbWluZ3MgZm9yIGxvd2VyIFNEUnggcmF0ZXMgd2hlcmUgc3BlY2lmaWVk
IGJ5IGRldmljZSBNWERTIHZhbHVlczsKICAJICogd2UgbGltaXQgdGhlc2UgdG8gdGhlIGdsb2Jh
bCBtYXggcmF0ZSBwcm92aWRlZCwgd2hpY2ggYWxzbyBwcmV2ZW50cwogIAkgKiB3ZWlyZCBkdXR5
IGN5Y2xlcwogIAkgKi8KICAJc2NsX3RpbWluZyA9IDA7CiAgCWZvciAoaSA9IDA7IGkgPCBBUlJB
WV9TSVpFKHNkcnMpOyBpKyspIHsKICAJCXRtcCA9IERJVl9ST1VORF9VUChjb3JlX3JhdGUsIHNk
cnNbaV0uZnJlcSkgJiAweGZmOwogIAkJaWYgKHRtcCA8IGxjbnQpCiAgCQkJdG1wID0gbGNudDsK
ICAJCXNjbF90aW1pbmcgfD0gdG1wIDw8IHNkcnNbaV0uc2hpZnQ7CiAgCX0KICAJd3JpdGVsKHNj
bF90aW1pbmcsIG1hc3Rlci0+cmVncyArIFNDTF9FWFRfTENOVF9USU1JTkcpOwogIAogIH0KCklz
IHRoaXMgd2hhdCB5b3Ugd2VyZSBpbnRlbmRpbmc/CgpDaGVlcnMsCgoKSmVyZW15CgoKLS0gCmxp
bnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
