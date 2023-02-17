Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99D1C05027
	for <linux-i3c@archiver.kernel.org>; Fri, 17 Feb 2023 14:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MVMYXP3+0M16Xma/U7Dmf00nBb9MdB0VO1rjGNkGs4o=; b=l/Vwfmfej+4NnB
	zgYDLvUajR0OIev7iXJuifwMD7RxKnia83MPZ7kkMDNPirN10M1XH1lbPoHrwNEhj/lpJXfMvphp0
	9CDhAy+vRlh+ZSUk/3SYUPT/sR6aI5bpVL3/4MP4Z+U8+fUugApm3W8UH+hxStQxMN+IhAvgjd7Dp
	0aqmNwQuz6g1rs0iNZusvrmP8Bh91UOo3F9AmKj4rASmd5mxECtDRUG3IWmo30ufh7CNvb07wvIab
	Z/uQcEgNWSbnMi2a/Hg48nzb69mP9dGWHNvEVSP9asrAg0VnJgZe7aUMgPl5Qf8XfHvpPR581+Oap
	w0SYp1O4ChNnpmY7Tf8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT1h1-00EXxZ-FY; Fri, 17 Feb 2023 14:26:31 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSxGy-00DX9A-RO
	for linux-i3c@lists.infradead.org; Fri, 17 Feb 2023 09:43:22 +0000
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 9066220037;
	Fri, 17 Feb 2023 17:43:04 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1676626988;
	bh=3WtRqJGFMITvrlCUQgLrV4f+rApo5IuH2N6gPvlbS1M=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=OI3ZJ9JFE0R6pSl1bT+uP1aHPsV9Uzv8X3QnjKMXYzvKmQLqWnAms35FBztp6VVz7
	 fhBmHT5/+Wd+G6rFD3BXnW7lw8XKj8Yu75hb32/Gxs7Ky6Cyr5/BSMxPBCU1W3Tz5l
	 emMIeUPcX7MkYZJYTEIaUW3YaS3yRhDIEJXQ9VMX/w0OoOQD7P6cJg0zH+oRTC0rN7
	 fLGffTXr//EnMOHIEACD0wKubRnan/Nq7FXpfyu36QPRKPFmsg+/BfZF6IS2n5gwX1
	 hbSWvuNKzRQiQxUC55xCcKjUZ7E98mWyUk38isv0cworgkN/buAUkFOGNDROchcybB
	 DODh60tV85p8w==
Message-ID: <578ac18169e21c13445d29d3c99de04e9fc6888e.camel@codeconstruct.com.au>
Subject: Re: [PATCH 2/4] i3c: dw: Add platform operations
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Ben Dooks <ben.dooks@sifive.com>, linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Vitor Soares
 <ivitro@gmail.com>, linux-aspeed@lists.ozlabs.org,
 devicetree@vger.kernel.org,  Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Dylan Hung
 <dylan_hung@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@aj.id.au>
Date: Fri, 17 Feb 2023 17:43:04 +0800
In-Reply-To: <9b374250-3afc-6277-d1c6-0dac1c682bca@sifive.com>
References: <cover.1676532146.git.jk@codeconstruct.com.au>
	 <eb90bc9ee9f72efc2012abce3e4e50186552e194.1676532146.git.jk@codeconstruct.com.au>
	 <9b374250-3afc-6277-d1c6-0dac1c682bca@sifive.com>
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_014321_414874_411A33B7 
X-CRM114-Status: GOOD (  21.01  )
X-Mailman-Approved-At: Fri, 17 Feb 2023 06:26:15 -0800
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

SGkgQmVuLAoKVGhhbmtzIGZvciB0YWtpbmcgYSBsb29rIGF0IHRoZSBwYXRjaC4gTXkgcmVzcG9u
c2VzIGlubGluZSAoanVzdApyZS1vcmRlcmVkLCBzaW1wbGUgc3R1ZmYgZmlyc3QpCgo+ID4gwqAg
c3RydWN0IGR3X2kzY19pMmNfZGV2X2RhdGEgewo+ID4gQEAgLTYxMiw2ICs2MjMsMTIgQEAgc3Rh
dGljIGludCBkd19pM2NfbWFzdGVyX2J1c19pbml0KHN0cnVjdCBpM2NfbWFzdGVyX2NvbnRyb2xs
ZXIgKm0pCj4gPiDCoMKgwqDCoMKgwqDCoMKgdTMyIHRobGRfY3RybDsKPiA+IMKgwqDCoMKgwqDC
oMKgwqBpbnQgcmV0Owo+ID4gwqAgCj4gPiArwqDCoMKgwqDCoMKgwqBpZiAobWFzdGVyLT5wbGF0
Zm9ybV9vcHMgJiYgbWFzdGVyLT5wbGF0Zm9ybV9vcHMtPmluaXQpIHsKPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqByZXQgPSBtYXN0ZXItPnBsYXRmb3JtX29wcy0+aW5pdChtYXN0
ZXIpOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChyZXQpCj4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiByZXQ7Cj4g
PiArwqDCoMKgwqDCoMKgwqB9Cj4gCj4gSSdkIHJhdGhlciBoYXZlIGEgImRlZmF1bHQiIHNldCBv
ZiBvcHMgdGhhbiBoYXZlIGFsbCB0aGlzIGNoZWNraW5nIGZvcgo+IE5VTEwgcG9pbnRlcnMgYWxs
IG92ZXIgdGhlIHBsYWNlLgoKWWVwLCB0aGF0J3MgYSBiZXR0ZXIgc3RydWN0dXJlLCBjaGFuZ2Vk
IGZvciB2Mi4KCj4gPiBAQCAtMTE4MSw2ICsxMjA1LDE4IEBAIHN0YXRpYyBpbnQgZHdfaTNjX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiDCoMKgwqDCoMKgwqDCoMKgbWFz
dGVyLT5tYXhkZXZzID0gcmV0ID4+IDE2Owo+ID4gwqDCoMKgwqDCoMKgwqDCoG1hc3Rlci0+ZnJl
ZV9wb3MgPSBHRU5NQVNLKG1hc3Rlci0+bWF4ZGV2cyAtIDEsIDApOwo+ID4gwqAgCj4gPiArwqDC
oMKgwqDCoMKgwqAvKiBtYXRjaCBhbnkgcGxhdGZvcm0tc3BlY2lmaWMgb3BzICovCj4gPiArwqDC
oMKgwqDCoMKgwqBtYXRjaCA9IG9mX21hdGNoX25vZGUoZHdfaTNjX21hc3Rlcl9vZl9tYXRjaCwg
cGRldi0+ZGV2Lm9mX25vZGUpOwo+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKG1hdGNoICYmIG1hdGNo
LT5kYXRhKQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoG1hc3Rlci0+cGxhdGZv
cm1fb3BzID0gbWF0Y2gtPmRhdGE7Cj4gCj4gSSdtIHN1cmUgdGhlcmUncyBhIG9mX2RldmljZV9n
ZXRfbWF0Y2hfZGF0YSgpIHdoaWNoIHdvdWxkIGhhdmUKPiBib3RoIHJlbW92ZWQgaHRlIG5lZWQg
dG8gbW92ZSB0aGUgbWF0Y2ggdGFibGUgYXJvdW5kIGFuZCB0aGUKPiBjYWxsIHRvIG9mX21hdGNo
X25vZGUoKS4KClRoYXQncyB0aGUgb25lIEkgd2FzIGxvb2tpbmcgZm9yISBUaGFua3MgZm9yIHRo
ZSBwb2ludGVyLCBJIGhhdmUgdXBkYXRlZAppbiB2Mi4KCj4gPiBAQCAtMjQxLDYgKzI0MSwxNyBA
QCBzdHJ1Y3QgZHdfaTNjX21hc3RlciB7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgY2hhciB2ZXJzaW9u
WzVdOwo+ID4gwqDCoMKgwqDCoMKgwqDCoGNoYXIgdHlwZVs1XTsKPiA+IMKgwqDCoMKgwqDCoMKg
wqB1OCBhZGRyc1tNQVhfREVWU107Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqAvKiBwbGF0Zm9y
bS1zcGVjaWZpYyBkYXRhICovCj4gPiArwqDCoMKgwqDCoMKgwqBjb25zdCBzdHJ1Y3QgZHdfaTNj
X3BsYXRmb3JtX29wcyAqcGxhdGZvcm1fb3BzOwo+ID4gK8KgwqDCoMKgwqDCoMKgdW5pb24gewo+
ID4gK8KgwqDCoMKgwqDCoMKgfSBwZGF0YTsKPiA+ICsKPiA+ICt9Owo+ID4gKwo+ID4gK3N0cnVj
dCBkd19pM2NfcGxhdGZvcm1fb3BzIHsKPiA+ICvCoMKgwqDCoMKgwqDCoGludCAoKnByb2JlKShz
dHJ1Y3QgZHdfaTNjX21hc3RlciAqaTNjLCBzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KTsK
PiA+ICvCoMKgwqDCoMKgwqDCoGludCAoKmluaXQpKHN0cnVjdCBkd19pM2NfbWFzdGVyICppM2Mp
Owo+ID4gwqAgfTsKPiAKPiBHaXZlbiB0aGUgY29tbWVudCBiZWxvdyBoYXZpbmcgdGhpcyBhbmQg
dGhlIG1haW4gcHJvYmUgZGVmaW5lZCBpbiBhIAo+IGhlYWRlciBzbyB1c2VycyBjYW4ganVzdCBj
YWxsIGluIGFuZCB3ZSBkb24ndCBoYXZlIHRvIGNoYW5nZSB0aGUKPiBtYWluIGNvZGUgaGVyZSBl
dmVyeSB0aW1lIHNvbWVvbmUgY29tZXMgdXAgd2l0aCB0aGVpciBvd24KPiBzcGVjaWFsIHdheSBv
ZiBoYW5kaW5nIHRoaXM/CgpJJ20gbm90IHN1cmUgSSAxMDAlIHVuZGVyc3RhbmQgdGhlIGludGVu
dGlvbiBoZXJlIC0gaXMgaXQgdGhhdCB3ZSdkCnNwbGl0IHRoZSBwbGF0Zm9ybS1zcGVjaWZpYyBj
b2RlIGludG8gZW50aXJlbHkgbmV3IGRyaXZlcnMsIGFuZCBoYXZlCnRob3NlIGNhbGwgaW50byBk
d19pM2NfcHJvYmUoKSAocHJlc3VtYWJseSBkb2luZyBhIGJpdCBvZiBjdXN0b20gaW5pdAplaXRo
ZXIgYmVmb3JlIG9yIGFmdGVyIHRoYXQgY2FsbCk/CgpJZiBzbzogSSB0aGluayB0aGUgcGxhdGZv
cm0gc3VwcG9ydCBzaG91bGQgc3RheSBmYWlybHkgbWluaW1hbCwgc28gSSdtCm5vdCBzdXJlIHRo
YXQgd2FycmFudHMgYSBuZXcgZHJpdmVyIGZvciBlYWNoIGluc3RhbmNlLiBJbiB0aGUgYXN0MjYw
MApjYXNlIGl0J3MganVzdCBhIGNvdXBsZSBvZiBleHRyYSByZWcgd3JpdGVzIGluIHRoZSBpM2Mg
aW5pdCBwYXRoLiBJJ2QgYmUKcmVsdWN0YW50IHRvIHNwbGl0IHRoYXQgb3V0IGNvbXBsZXRlbHkg
YXQgdGhpcyBzdGFnZSAtIGJ1dCBpZiB0aGlzIGRvZXMKZ3Jvdywgd2UgY2FuIGNlcnRhaW5seSBy
ZWNvbnNpZGVyLgoKQWxzbywgSSdkIGxpa2UgdG8gYWxsb3cgZm9yIHRoZSBjYXNlIHdoZXJlIHRo
ZSBwbGF0Zm9ybS1zcGVjaWZpYyBwYXJ0cwptYXkgYWNjZXNzIHRoZSBmaWVsZHMgb2Ygc3RydWN0
IGR3X2kzY19tYXN0ZXI7IHdpdGggdGhpcyBhcHByb2FjaCB3ZQpkb24ndCBuZWVkIHRvIGV4cG9z
ZSB0aGF0IHN0cnVjdCBvdXRzaWRlIG9mIHRoZSBzaW5nbGUgZHJpdmVyLgoKQ2hlZXJzLAoKCkpl
cmVteQoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1p
M2MK
