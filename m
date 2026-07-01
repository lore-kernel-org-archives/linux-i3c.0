Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7856CC43458
	for <linux-i3c@archiver.kernel.org>; Wed,  1 Jul 2026 20:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eBp9mHYEn6uoyTP5Yn/dmYP5MafTFhvhmZCXufyDTII=; b=wXmb5BXJajFwRZ
	gxRuwnDMWGUlXMeOMBiIixnAqs9TiZ+3ElfM17gzl4cqW0VCsUW2mMLzF4fwTdltexwuG0FM1zTES
	fG7Ax+e7VpQWs8B0Ua7SYq8lvcPsE5Gbk1bRzMN35fBXUMoMXylTFyELdzx3dGc3bJURF01jJwHSU
	PPB+qtyn6fYCN1FvvOctfM/3lQ72kszcnaPpfgjMUF7qxHBzTaPZkHTUb9T+RwamXe131FykrPDmA
	/SusNB4XkvSuwNDooU6YQD3qMWMCb42/dKGroYLg5M6DZX3beuG4IYNoClk0hrrnrd0dnCB3i1ZYy
	n8UxMra/EjFYGVSTXX9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1cU-00000002yED-12x9;
	Wed, 01 Jul 2026 20:33:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1cS-00000002yDP-3UNo
	for linux-i3c@lists.infradead.org;
	Wed, 01 Jul 2026 20:33:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 03F586001D;
	Wed,  1 Jul 2026 20:33:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6114A1F000E9;
	Wed,  1 Jul 2026 20:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782937995;
	bh=S9iJhbgMVUVi++yBye3lwbwqTW4EHy3M8xvme7yGP/g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gmlRcEvMW/ud8fyA72/UY5MvPJwoHDM3fvn+PALZLzDMvm4usR5o3rQZUfEc8ikn3
	 uE6N4NzCbDTjxHGh+BC9tBKS9pyV9pLK3bc13hCphDaHjdOq2HXcaPqgn8cdpMdSs0
	 FB81Lzgtp8RgpeK31B3FMvpnm/8mgbKJdL6bZkP8S8p2yxT30OkKEJNGtnXLUv4rom
	 HcHeDInJBk781fKOKXaysxY80N3E1M5LSPytRdb5lselw83bMGhBZAJ8RXGE3v8nrj
	 9W7v1Ke2+lwnPsaQTvY5TO4U3y+e8twU2CcVNWp91jxTAhrv8a9Gbjn1OHjZMY4iZE
	 8Mw2tjB8SYXTw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC RESEND 3/7] i3c: master: Add helper to query bus
 wakeup requirements
To: "Adrian Hunter" <adrian.hunter@intel.com>
Cc: linux-i3c@lists.infradead.org, linux-pci@vger.kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Frank.Li@kernel.org
In-Reply-To: <20260701201533.220818-4-adrian.hunter@intel.com>
References: <20260701201533.220818-1-adrian.hunter@intel.com>
 <20260701201533.220818-4-adrian.hunter@intel.com>
Date: Wed, 01 Jul 2026 20:33:14 +0000
Message-Id: <20260701203315.6114A1F000E9@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpOZXcgaXNzdWVzOgotIFtIaWdoXSBD
b25jdXJyZW50IGV4ZWN1dGlvbiBiZXR3ZWVuIGBpM2NfbWFzdGVyX2FueV93YWtldXBfZW5hYmxl
ZCgpYCBhbmQgdGhlIGRldmljZSByZWdpc3RyYXRpb24gd29ya2VyIGNhdXNlcyBkYXRhIHJhY2Vz
IG9uIGBkZXNjLT5kZXZgIGJlY2F1c2UgYm90aCBwYXRocyB1c2UgYSByZWFkLXNpZGUgbG9jay4K
ClByZS1leGlzdGluZyBpc3N1ZXM6Ci0gW0hpZ2hdIFRoZSBgaTNjX21hc3Rlcl9hbnlfd2FrZXVw
X2VuYWJsZWQoKWAgaGVscGVyIGNhbiBkZXJlZmVyZW5jZSBhIGRhbmdsaW5nIGBkZXNjLT5kZXZg
IHBvaW50ZXIgaWYgYSBwcmV2aW91cyBJM0MgZGV2aWNlIHJlZ2lzdHJhdGlvbiBmYWlsZWQuCi0t
Cgpjb21taXQgM2VkOTdkMDk3ZWE5ZjIzZmVmY2I3NzI4MTE3MzdhZGFiNzEzZWI2NgpBdXRob3I6
IEFkcmlhbiBIdW50ZXIgPGFkcmlhbi5odW50ZXJAaW50ZWwuY29tPgoKaTNjOiBtYXN0ZXI6IEFk
ZCBoZWxwZXIgdG8gcXVlcnkgYnVzIHdha2V1cCByZXF1aXJlbWVudHMKClRoaXMgY29tbWl0IGFk
ZHMgaTNjX21hc3Rlcl9hbnlfd2FrZXVwX2VuYWJsZWQoKSwgd2hpY2ggaXRlcmF0ZXMgb3ZlciB0
aGUKZGV2aWNlcyBvbiBhbiBJM0MgYnVzIGFuZCByZXBvcnRzIHdoZXRoZXIgYW55IG9mIHRoZW0g
YXJlIGVuYWJsZWQgZm9yIHN5c3RlbQp3YWtldXAuIENvbnRyb2xsZXIgZHJpdmVycyBjYW4gdXNl
IHRoaXMgaGVscGVyIHRvIGRldGVybWluZSB3aGV0aGVyIHdha2V1cApzdXBwb3J0IG11c3QgcmVt
YWluIGF2YWlsYWJsZSB3aGlsZSB0aGUgc3lzdGVtIGlzIHN1c3BlbmRlZC4KCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvaTNjL21hc3Rlci5jIGIvZHJpdmVycy9pM2MvbWFzdGVyLmMKPiBpbmRleCBh
MzZmOWI2MTdjYmY3Li45Nzk0NTdlNjM1YmQ5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaTNjL21h
c3Rlci5jCj4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyLmMKClsgLi4uIF0KCj4gK2Jvb2wgaTNj
X21hc3Rlcl9hbnlfd2FrZXVwX2VuYWJsZWQoc3RydWN0IGkzY19tYXN0ZXJfY29udHJvbGxlciAq
bWFzdGVyKQo+ICt7Cj4gKwlzdHJ1Y3QgaTNjX2Rldl9kZXNjICpkZXNjOwo+ICsJYm9vbCB3YWtl
dXAgPSBmYWxzZTsKPiArCj4gKwlpM2NfYnVzX25vcm1hbHVzZV9sb2NrKCZtYXN0ZXItPmJ1cyk7
CgpbU2V2ZXJpdHk6IEhpZ2hdCkRvZXMgdGhpcyBjb2RlIHJpc2sgYSBkYXRhIHJhY2Ugd2l0aCB0
aGUgZGV2aWNlIHJlZ2lzdHJhdGlvbiB3b3JrZXI/CgpMb29raW5nIGF0IGkzY19tYXN0ZXJfcmVn
X3dvcmtfZm4oKSwgaXQgYWxsb2NhdGVzIGFuZCBpbml0aWFsaXplcyBkZXNjLT5kZXYKd2hpbGUg
aG9sZGluZyB0aGlzIHNhbWUgcmVhZC1zaWRlIGxvY2sgKGkzY19idXNfbm9ybWFsdXNlX2xvY2sp
LiBJZiB0aGUgUENJCmNvbnRyb2xsZXIgcnVudGltZSBzdXNwZW5kcyBhbmQgY2FsbHMgdGhpcyBo
ZWxwZXIgd2hpbGUgdGhlIHJlZ2lzdHJhdGlvbiB3b3JrCmlzIGV4ZWN1dGluZywgdGhleSBjYW4g
cnVuIGNvbmN1cnJlbnRseSBzaW5jZSBib3RoIG9ubHkgaG9sZCBhIHJlYWQtc2lkZQpsb2NrLgoK
Q2FuIHRoaXMgbGVhZCB0byBhIHVzZS1iZWZvcmUtaW5pdGlhbGl6YXRpb24gaWYgZGV2aWNlX21h
eV93YWtldXAoKSBpcwpjYWxsZWQgd2hpbGUgdGhlIG1lbW9yeSBpcyBzdGlsbCBiZWluZyBpbml0
aWFsaXplZD8KCj4gKwlpM2NfYnVzX2Zvcl9lYWNoX2kzY2RldigmbWFzdGVyLT5idXMsIGRlc2Mp
IHsKPiArCQlpZiAoZGVzYy0+ZGV2ICYmIGRldmljZV9tYXlfd2FrZXVwKCZkZXNjLT5kZXYtPmRl
dikpIHsKCltTZXZlcml0eTogSGlnaF0KVGhpcyBpcyBhIHByZS1leGlzdGluZyBpc3N1ZSwgYnV0
IGNvdWxkIHRoaXMgY2hlY2sgdHJpZ2dlciBhIHVzZS1hZnRlci1mcmVlCmlmIGEgcHJldmlvdXMg
ZGV2aWNlIHJlZ2lzdHJhdGlvbiBmYWlsZWQ/CgpJbiBpM2NfbWFzdGVyX3JlZ2lzdGVyX25ld19p
M2NfZGV2cygpLCBpZiBkZXZpY2VfcmVnaXN0ZXIoKSBmYWlscywgdGhlIGVycm9yCnBhdGggZHJv
cHMgdGhlIHJlZmVyZW5jZSB3aXRoIHB1dF9kZXZpY2UoJmRlc2MtPmRldi0+ZGV2KS4gVGhpcyBm
cmVlcyB0aGUKdW5kZXJseWluZyBtZW1vcnksIGJ1dCBkZXNjLT5kZXYgaXMgbmV2ZXIgc2V0IHRv
IE5VTEwuCgpJZiB0aGF0IGhhcHBlbnMsIHdvbid0IHRoaXMgbG9vcCBvYnNlcnZlIGEgZGFuZ2xp
bmcgbm9uLU5VTEwgZGVzYy0+ZGV2CnBvaW50ZXIgYW5kIHVuY29uZGl0aW9uYWxseSBkZXJlZmVy
ZW5jZSBpdCBkdXJpbmcgc3VzcGVuZD8KCj4gKwkJCXdha2V1cCA9IHRydWU7Cj4gKwkJCWJyZWFr
Owo+ICsJCX0KPiArCX0KPiArCWkzY19idXNfbm9ybWFsdXNlX3VubG9jaygmbWFzdGVyLT5idXMp
Owo+ICsKPiArCXJldHVybiB3YWtldXA7Cj4gK30KPiArRVhQT1JUX1NZTUJPTF9HUEwoaTNjX21h
c3Rlcl9hbnlfd2FrZXVwX2VuYWJsZWQpOwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBz
Oi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDcwMTIwMTUzMy4yMjA4MTgtMS1hZHJpYW4u
aHVudGVyQGludGVsLmNvbT9wYXJ0PTMKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4
LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtaTNjCg==
