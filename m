Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2958CC53219
	for <linux-i3c@archiver.kernel.org>; Tue, 28 Jul 2026 16:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f0tJrC1qVCDIW/dQEVNl5lafocRjvRRgaRfWt1qTBGE=; b=I/KDzSdVrlKI5Q
	uBLSn+uE7M7/5Fnr0m4tTuxdN4qS8SgRD2UCWKju7b9UIvBAVwwj5DREX2xsmb4GqSMpoDjU+Rh3U
	RFQIBlKz+3cOcFLQf7gmDgP9vYe+DUL9EzUyWPBG0qjdLOI4P1k/rAOvA4D/oFoovw+g/vuLGzw2I
	P3tHDiCsooxiI6RQY79CviRQ95CyjY1ZM5lf1daB/2Ng2qNeW2nSn6WjaiVA+9iTRcxJMRoLK9yt9
	L5u+7z4wRD8mjrikpNJ4gSOd3ZIQ7sqKQ4fW91vrulYBqUsNBZbrU2Akh4P30mLbKM5XmxJZaiFgQ
	MlxypyFuAGPh/CSlVA4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wol7K-00000005tLI-3cQe;
	Tue, 28 Jul 2026 16:57:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wol7J-00000005tLB-3jKE
	for linux-i3c@lists.infradead.org;
	Tue, 28 Jul 2026 16:57:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4DA9C406BD;
	Tue, 28 Jul 2026 16:57:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D756D1F000E9;
	Tue, 28 Jul 2026 16:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785257841;
	bh=Qkp7J6Er95BTurBahBm2sbESGUaIO1hI6OuP9BoFuIQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G94KgoB/Z7px88F/BB4J4CIKAN33wHzZ1FgKgsIzmPX+nwfpJBkz2wR79U8cDRvP7
	 h4lEv5msHBIiWTgehkuHTqXgNWCu5agrd/qd8qlrsIazQmYUEdthRM215phmCoh+2C
	 7HyDIE47rp5GYjh1rCC0tR7wiYGA2d42LciTw7dr5hxeVnQNCiZk20fHyQzFAgieSb
	 FhLNjAE15Qk/+RzyVjQld2TLRTuccrsDqN00PmlFTxvg48XNUXhLJWEZ+M1gj10rrR
	 5Buk1o+8ch4aqkxu1kOwF+Qz7mDMxo8kRS71JQVS3El2mC+h+faBWGqrmf3gsnBlmM
	 43r8Sph1PS8Zg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V2 4/8] i3c: master: Add helper to query bus wakeup
 requirements
To: "Adrian Hunter" <adrian.hunter@intel.com>
Cc: linux-pci@vger.kernel.org, linux-i3c@lists.infradead.org, Frank.Li@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260728155308.142713-5-adrian.hunter@intel.com>
References: <20260728155308.142713-1-adrian.hunter@intel.com>
 <20260728155308.142713-5-adrian.hunter@intel.com>
Date: Tue, 28 Jul 2026 16:57:20 +0000
Message-Id: <20260728165720.D756D1F000E9@smtp.kernel.org>
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
IFtIaWdoXSBMb2NrbGVzcyBhY2Nlc3MgdG8gb3RoZXIgZGV2aWNlcycgYGliaWAgc3RydWN0dXJl
cyBpbiBgYWRpX2kzY19tYXN0ZXJfZGlzYWJsZV9pYmkoKWAgbGVhZHMgdG8gVXNlLUFmdGVyLUZy
ZWUuCi0tCgotLS0gUGF0Y2ggWzRdOiBbUEFUQ0ggVjIgNC84XSBpM2M6IG1hc3RlcjogQWRkIGhl
bHBlciB0byBxdWVyeSBidXMgd2FrZXVwIHJlcXVpcmVtZW50cyAtLS0KY29tbWl0IDI2ZDY4NTY4
ZGI5NDAxYTYzMjRhMDU2NzJhMDQ2ZTg0NjUwMzVkZGUKQXV0aG9yOiBBZHJpYW4gSHVudGVyIDxh
ZHJpYW4uaHVudGVyQGludGVsLmNvbT4KCmkzYzogbWFzdGVyOiBBZGQgaGVscGVyIHRvIHF1ZXJ5
IGJ1cyB3YWtldXAgcmVxdWlyZW1lbnRzCgpBZGRzIGkzY19tYXN0ZXJfYW55X3dha2V1cF9lbmFi
bGVkKCkgdG8gaXRlcmF0ZSBvdmVyIGRldmljZXMgb24gYW4gSTNDCmJ1cyBhbmQgcmVwb3J0IHdo
ZXRoZXIgYW55IGFyZSBlbmFibGVkIGZvciBzeXN0ZW0gd2FrZXVwIGFuZCBoYXZlIGliaQplbmFi
bGVkLiBDb250cm9sbGVyIGRyaXZlcnMgY2FuIHVzZSB0aGlzIGhlbHBlciB0byBkZXRlcm1pbmUg
d2hldGhlcgp3YWtldXAgc3VwcG9ydCBtdXN0IHJlbWFpbiBhdmFpbGFibGUgd2hpbGUgdGhlIHN5
c3RlbSBpcyBzdXNwZW5kZWQuCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIuYyBi
L2RyaXZlcnMvaTNjL21hc3Rlci5jCj4gaW5kZXggOWQ1NmNhMDg1NjlhMS4uZGQ0OTY1MjQyNWI0
OCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIuYwo+ICsrKyBiL2RyaXZlcnMvaTNj
L21hc3Rlci5jCgpbIC4uLiBdCgo+IEBAIC0yMDQ4LDYgKzIwNDgsMzYgQEAgc3RhdGljIHZvaWQg
aTNjX21hc3Rlcl9yZWdfd29ya19mbihzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspCj4gIAlpM2Nf
bWFzdGVyX3JlZ2lzdGVyX25ld19pM2NfZGV2cyhtYXN0ZXIpOwo+ICB9Cj4gIAo+ICsvKioKPiAr
ICogaTNjX21hc3Rlcl9hbnlfd2FrZXVwX2VuYWJsZWQoKSAtIGNoZWNrIGlmIGFueSBkZXZpY2Ug
Y2FuIHdha2UgdGhlIHN5c3RlbQo+ICsgKiBAbWFzdGVyOiBJM0MgbWFzdGVyIGNvbnRyb2xsZXIK
PiArICoKPiArICogSXRlcmF0ZSBvdmVyIGRldmljZXMgb24gdGhlIGJ1cyBhbmQgcmV0dXJuIHRy
dWUgaWYgYW55IGRldmljZSBoYXMKPiArICogc3lzdGVtIHdha2V1cCBlbmFibGVkIGFuZCBJQkkg
ZW5hYmxlZC4KPiArICoKPiArICogUmV0dXJuOiB0cnVlIGlmIGFueSBkZXZpY2UgbWF5IHdha2Ug
dGhlIHN5c3RlbSB2aWEgSUJJLCBmYWxzZSBvdGhlcndpc2UuCj4gKyAqLwo+ICtib29sIGkzY19t
YXN0ZXJfYW55X3dha2V1cF9lbmFibGVkKHN0cnVjdCBpM2NfbWFzdGVyX2NvbnRyb2xsZXIgKm1h
c3RlcikKPiArewo+ICsJc3RydWN0IGkzY19kZXZfZGVzYyAqZGVzYzsKPiArCWJvb2wgd2FrZXVw
ID0gZmFsc2U7Cj4gKwo+ICsJaTNjX2J1c19ub3JtYWx1c2VfbG9jaygmbWFzdGVyLT5idXMpOwo+
ICsJaTNjX2J1c19mb3JfZWFjaF9pM2NkZXYoJm1hc3Rlci0+YnVzLCBkZXNjKSB7Cj4gKwkJaWYg
KCFkZXNjLT5kZXYgfHwgIWRldmljZV9tYXlfd2FrZXVwKCZkZXNjLT5kZXYtPmRldikpCj4gKwkJ
CWNvbnRpbnVlOwo+ICsJCWd1YXJkKG11dGV4KSgmZGVzYy0+aWJpX2xvY2spOwoKW1NldmVyaXR5
OiBIaWdoXQpUaGlzIGlzIGEgcHJlLWV4aXN0aW5nIGlzc3VlLCBidXQgc2VlaW5nIHRoZSBjb3Jy
ZWN0IGxvY2tpbmcgaGVyZSBpbgppM2NfbWFzdGVyX2FueV93YWtldXBfZW5hYmxlZCgpIGJyaW5n
cyB0byBtaW5kIGEgc2ltaWxhciBsb29wIGluCmFkaV9pM2NfbWFzdGVyX2Rpc2FibGVfaWJpKCkg
aW4gZHJpdmVycy9pM2MvbWFzdGVyL2FkaS1pM2MtbWFzdGVyLmMuCgpEb2VzIHRoYXQgbG9vcCBh
bHNvIG5lZWQgdG8gaG9sZCB0aGUgaWJpX2xvY2s/IEl0IGN1cnJlbnRseSBhY2Nlc3NlcwppM2Nk
ZXYtPmliaSBvZiBvdGhlciBkZXZpY2VzIG9uIHRoZSBidXMgd2l0aG91dCBob2xkaW5nIHRoZWly
IHJlc3BlY3RpdmUKaWJpX2xvY2s6Cgpkcml2ZXJzL2kzYy9tYXN0ZXIvYWRpLWkzYy1tYXN0ZXIu
YzphZGlfaTNjX21hc3Rlcl9kaXNhYmxlX2liaSgpIHsKICAgIC4uLgogICAgaTNjX2J1c19mb3Jf
ZWFjaF9pM2NkZXYoJm0tPmJ1cywgaTNjZGV2KSB7CiAgICAgICAgaWYgKGRldiAhPSBpM2NkZXYg
JiYgaTNjZGV2LT5pYmkpCiAgICAgICAgICAgIGVuYWJsZWQgfD0gaTNjZGV2LT5pYmktPmVuYWJs
ZWQ7CiAgICB9CiAgICAuLi4KfQoKQ291bGQgdGhpcyBsZWFkIHRvIGEgdXNlLWFmdGVyLWZyZWUg
aWYgYW5vdGhlciBkZXZpY2UncyBpYmkgcmVzb3VyY2VzIGFyZQpjb25jdXJyZW50bHkgZnJlZWQ/
IEZvciBleGFtcGxlLCBpZiBpM2NfZGV2aWNlX2ZyZWVfaWJpKCkgaXMgY2FsbGVkIGZvcgphbm90
aGVyIGRldmljZSBkdXJpbmcgY29uY3VycmVudCB1bmJpbmRzLCBpdCB0YWtlcyB0aGUgc2FtZSBi
dXMgcmVhZCBsb2NrCmJ1dCBjb3VsZCBmcmVlIHRoZSBpYmkgcG9pbnRlciB3aGlsZSB0aGlzIGxv
b3AgaXMgZXZhbHVhdGluZwppM2NkZXYtPmliaS0+ZW5hYmxlZC4KCj4gKwkJaWYgKGRlc2MtPmli
aSAmJiBkZXNjLT5pYmktPmVuYWJsZWQpIHsKPiArCQkJd2FrZXVwID0gdHJ1ZTsKPiArCQkJYnJl
YWs7Cj4gKwkJfQo+ICsJfQo+ICsJaTNjX2J1c19ub3JtYWx1c2VfdW5sb2NrKCZtYXN0ZXItPmJ1
cyk7Cj4gKwo+ICsJcmV0dXJuIHdha2V1cDsKPiArfQoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3
IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDcyODE1NTMwOC4xNDI3MTMtMS1h
ZHJpYW4uaHVudGVyQGludGVsLmNvbT9wYXJ0PTQKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0
CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
