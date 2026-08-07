Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 874B1C5AC7A
	for <linux-i3c@archiver.kernel.org>; Fri,  7 Aug 2026 15:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0lwyBPXf+iIprmMqv6Lt9PhALXtccZSv7Ki1w6UT47Q=; b=1tIUZvyqKwIFZY
	rPupAeGZ50nnw9BK1/bwO3S3mLGRuGjdkQDEs2deTMt3PNyNewsOSqclb+jEHowLY3gEadq50C9sU
	dLHqtTtD6XBU7unq9x12ljOrJGI70F6r1+v9Z6KTHFFWmtSfUcftfq2B8GBupiRc4d0SQDQXl1Tns
	REweLBc/Wx0ipf1nFUSqDO8VDaEYW2ekeE1de03T0iXbtk45QpZM4PsT2s2U40VJxJTm22eYGXecm
	snbBSmlMneWTO8bjoljWk5EIPfk3eu8mo5Njaw+IT36seF7fN873NZPwZwztzj8+F1Iio/HuWLMUi
	qSLapHaJUg+oAdY1xJZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMGq-00000008Jxi-0qLb;
	Fri, 07 Aug 2026 15:14:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMGo-00000008JxY-15Bj
	for linux-i3c@lists.infradead.org;
	Fri, 07 Aug 2026 15:14:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0AFF441AB8;
	Fri,  7 Aug 2026 15:14:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ACEF1F00A3D;
	Fri,  7 Aug 2026 15:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786115641;
	bh=DhdB/UGVLYJ89IcMlowUAfjwOsMPFcyVrvw9QolcNno=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V47o/WVlHMz+xbJYF8F+RIZRy6049k0qQeRN9/GM3/1FKgzyJDl9HH6Qr+tCnGHxz
	 ab9ajQgP4SlLrmRW5Sifkp0z+og3bJ5Ol+kVcHZFczzRcRR68Kole9josJ6al9NyHF
	 vc1n/LffZZcq/uDBDrjgZzbnLgiGKYtCqkcCJ1xn6t1ERYXkalVossTUF/12veoC0a
	 Qv/0JkRpDjyucwasEJvPHHVGgitCH/snDjwcGyp3CKY9L2JtU5TJIfKkyJtO+Pefef
	 SsVrxRombemPEQLLjx6eMB8NGJ0KTrFURgJx0H3qSB+Y2jLcCuHb4pEiwlBl6cOzOc
	 DalNIx8TMg9ag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V5 04/14] i3c: master: Fix use-after-free of
 master->this
To: "Adrian Hunter" <adrian.hunter@intel.com>
Cc: linux-pci@vger.kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, linux-i3c@lists.infradead.org, Frank.Li@kernel.org
In-Reply-To: <20260807145638.168865-5-adrian.hunter@intel.com>
References: <20260807145638.168865-1-adrian.hunter@intel.com>
 <20260807145638.168865-5-adrian.hunter@intel.com>
Date: Fri, 07 Aug 2026 15:14:00 +0000
Message-Id: <20260807151401.8ACEF1F00A3D@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpQcmUtZXhpc3RpbmcgaXNzdWVzOgot
IFtIaWdoXSBQcmUtZXhpc3RpbmcgZGV2cmVzIGxpZmV0aW1lIG1pc21hdGNoIGNhdXNpbmcgVXNl
LUFmdGVyLUZyZWUgaW4gaTNjX21hc3RlcmRldl9yZWxlYXNlKCksIGV4YWNlcmJhdGVkIGJ5IHRo
ZSBwYXRjaCdzIG5ld2x5IGFkZGVkIGtmcmVlKCkuCi0gW0hpZ2hdIFByZS1leGlzdGluZyBJRFIg
c3RhdGUgY29ycnVwdGlvbiBkdWUgdG8gbWlzc2luZyBlcnJvciBoYW5kbGluZyBhcm91bmQgaTNj
YnVzLT5pZCBpbiBwcm9iZSBmYWlsdXJlIHBhdGguCi0tCgotLS0gUGF0Y2ggWzRdOiBbUEFUQ0gg
VjUgMDQvMTRdIGkzYzogbWFzdGVyOiBGaXggdXNlLWFmdGVyLWZyZWUgb2YgbWFzdGVyLT50aGlz
IC0tLQpjb21taXQgYWFkMTU1MTNkYmYyZDU1OWJmODkzNzg5ZDU1YTMzMWY1MjIzODNkMQpBdXRo
b3I6IEFkcmlhbiBIdW50ZXIgPGFkcmlhbi5odW50ZXJAaW50ZWwuY29tPgpTdWJqZWN0OiBpM2M6
IG1hc3RlcjogRml4IHVzZS1hZnRlci1mcmVlIG9mIG1hc3Rlci0+dGhpcwoKVGhlIHBhdGNoIGZp
eGVzIGEgdXNlLWFmdGVyLWZyZWUgYnkga2VlcGluZyBtYXN0ZXItPnRoaXMgYWxpdmUgdW50aWwK
aTNjX21hc3RlcmRldl9yZWxlYXNlKCkuIEl0IGFsc28gcmVzZXRzIG1hc3Rlci0+dGhpcyBhbmQg
YnVzLmN1cl9tYXN0ZXIgdG8KTlVMTCBvbiB0aGUgZXJyb3IgcGF0aCBpbiBpM2NfbWFzdGVyX3Nl
dF9pbmZvKCkgYmVmb3JlIGZyZWVpbmcgdGhlCmFsbG9jYXRlZCBkZXZpY2UuCgpDYzogc3RhYmxl
QHZnZXIua2VybmVsLm9yZwoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyLmMgYi9k
cml2ZXJzL2kzYy9tYXN0ZXIuYwo+IGluZGV4IGFiYjU4MjY0NWEyZWQuLjIzNTc4NzRiYjlkNmEg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9pM2MvbWFzdGVyLmMKPiArKysgYi9kcml2ZXJzL2kzYy9t
YXN0ZXIuYwo+IEBAIC04NDIsNiArODQyLDExIEBAIHN0YXRpYyBzdHJ1Y3QgYXR0cmlidXRlICpp
M2NfbWFzdGVyZGV2X2F0dHJzW10gPSB7Cj4gIH07Cj4gIEFUVFJJQlVURV9HUk9VUFMoaTNjX21h
c3RlcmRldik7Cj4gIAo+ICtzdGF0aWMgdm9pZCBpM2NfbWFzdGVyX2ZyZWVfaTNjX2RldihzdHJ1
Y3QgaTNjX2Rldl9kZXNjICpkZXYpCj4gK3sKPiArCWtmcmVlKGRldik7Cj4gK30KPiArCj4gIHN0
YXRpYyB2b2lkIGkzY19tYXN0ZXJkZXZfcmVsZWFzZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gIHsK
PiAgCXN0cnVjdCBpM2NfbWFzdGVyX2NvbnRyb2xsZXIgKm1hc3RlciA9IGRldl90b19pM2NtYXN0
ZXIoZGV2KTsKPiBAQCAtODU0LDYgKzg1OSw4IEBAIHN0YXRpYyB2b2lkIGkzY19tYXN0ZXJkZXZf
cmVsZWFzZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gIAlpM2NfYnVzX2NsZWFudXAoYnVzKTsKCltT
ZXZlcml0eTogSGlnaF0KVGhpcyBpc24ndCBhIGJ1ZyBpbnRyb2R1Y2VkIGJ5IHRoaXMgcGF0Y2gs
IGJ1dCBkb2VzIHRoZSBlcnJvciBwYXRoIGluIHByb2JlCmNvcnJ1cHQgdGhlIElEUiBpZiBpZHJf
YWxsb2MoKSBmYWlscz8KCklmIGlkcl9hbGxvYygpIGZhaWxzIGluIGkzY19idXNfaW5pdCgpLCBp
M2NidXMtPmlkIGlzIG5vdCB1cGRhdGVkIGFuZCByZW1haW5zCmF0IGl0cyBremFsbG9jLWluaXRp
YWxpemVkIHZhbHVlIG9mIDAuCgpUaGUgZXJyb3IgcGF0aCBpbiBpM2NfbWFzdGVyX3JlZ2lzdGVy
KCkgY2FsbHMgcHV0X2RldmljZSgmbWFzdGVyLT5kZXYpLCB3aGljaAppbnZva2VzIHRoaXMgaTNj
X21hc3RlcmRldl9yZWxlYXNlKCkgY2FsbGJhY2suCgpUaGF0IHVuY29uZGl0aW9uYWxseSBjYWxs
cyBpM2NfYnVzX2NsZWFudXAoYnVzKSwgd2hpY2ggZXhlY3V0ZXMKaWRyX3JlbW92ZSgmaTNjX2J1
c19pZHIsIGkzY2J1cy0+aWQpLiBUaGlzIGVmZmVjdGl2ZWx5IGRlbGV0ZXMgSUQgMCBmcm9tIHRo
ZQpJRFIsIGV2ZW4gdGhvdWdoIHRoYXQgSUQgbWlnaHQgYmVsb25nIHRvIGFub3RoZXIgc3VjY2Vz
c2Z1bGx5IGluaXRpYWxpemVkIGJ1cy4KCj4gIAo+ICAJZndub2RlX2hhbmRsZV9wdXQoZGV2LT5m
d25vZGUpOwo+ICsKPiArCWkzY19tYXN0ZXJfZnJlZV9pM2NfZGV2KG1hc3Rlci0+dGhpcyk7Cgpb
U2V2ZXJpdHk6IEhpZ2hdClRoaXMgaXMgYSBwcmUtZXhpc3RpbmcgaXNzdWUsIGJ1dCBjYW4gdGhp
cyBkZXZyZXMgbGlmZXRpbWUgbWlzbWF0Y2ggbGVhZAp0byBhIHVzZS1hZnRlci1mcmVlIHdoZW4g
c3lzZnMgZmlsZXMgYXJlIGhlbGQgb3Blbj8KClRoZSBpM2NfbWFzdGVyX2NvbnRyb2xsZXIgc3Ry
dWN0IGlzIHR5cGljYWxseSBhbGxvY2F0ZWQgdmlhIGRldm1fa3phbGxvYygpCmJ5IHRoZSBwYXJl
bnQgZHJpdmVyLiBJZiBhbiB1bnByaXZpbGVnZWQgdXNlciBob2xkcyBhIHN5c2ZzIGZpbGUgb3Bl
biAobGlrZQp0aGUgbW9kZSBvciBjdXJyZW50X21hc3RlciBhdHRyaWJ1dGVzKSwgZGV2aWNlX3Vu
cmVnaXN0ZXIoKSBkcm9wcyBhCnJlZmVyZW5jZSwgYnV0IHRoZSBzeXNmcyBub2RlIHByZXZlbnRz
IHRoZSBrb2JqZWN0IGZyb20gYmVpbmcgcmVsZWFzZWQuCgpXaGVuIHRoZSBkcml2ZXIgaXMgdW5i
b3VuZCBhbmQgcmVtb3ZlKCkgcmV0dXJucywgZGV2cmVzIGZyZWVzIHRoZSBtYXN0ZXIKc3RydWN0
LgoKTGF0ZXIsIHdoZW4gdGhlIHN5c2ZzIGZpbGUgaXMgY2xvc2VkLCB0aGUgcmVmY291bnQgZHJv
cHMgdG8gMCBhbmQKaTNjX21hc3RlcmRldl9yZWxlYXNlKCkgZXhlY3V0ZXMsIGRlcmVmZXJlbmNp
bmcgdGhlIGFscmVhZHktZnJlZWQgbWFzdGVyCnN0cnVjdCB0byBhY2Nlc3MgbWFzdGVyLT53cSwg
YnVzLCBhbmQgdGhlIG5ld2x5IGFkZGVkCmkzY19tYXN0ZXJfZnJlZV9pM2NfZGV2KG1hc3Rlci0+
dGhpcykuCgo+ICB9CgpbIC4uLiBdCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9z
YXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwODA3MTQ1NjM4LjE2ODg2NS0xLWFkcmlhbi5odW50
ZXJAaW50ZWwuY29tP3BhcnQ9NAoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1pM2MK
