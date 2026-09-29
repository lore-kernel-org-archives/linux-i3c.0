Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31650CA5FA1
	for <linux-i3c@archiver.kernel.org>; Tue, 29 Sep 2026 06:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h34yozrYLkcfmWUUo/otOKVV1djrzxyvPRRQCdiSJjk=; b=sVl0OAdwTfnPvH
	cWgguTHSI+oD9t0aj5tAXpa10+yGdoFC5bc9Pk4s90kF9QRYCEeMNjvR2erhYnDxO7SCmyxTcnQjO
	1k1lFGFaMn7VgPYpD74uZcv8szJzgDHXQw9Td3uyftvliqYLRf9i9IhNRDip+gMvYitqZ2uQxyqft
	cGcTUUbptwqm/hitHmjHhUnUZgwfqSTnfbE+chGqUS69t9phVGWwxz/e5IqY8jyvjdRKH/fAOq+zY
	UIYVa1Ng6gGmCIYYqov7IdSaSADtNl3629PFvexNr9mmemh8pj2Z+3NApmJ0CWjKRscy6ByZ/uXhu
	kPeiueKVfmDdVLq+TUfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRbH-00000002WQW-3kFA;
	Tue, 29 Sep 2026 06:46:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRbF-00000002WPr-46Bv
	for linux-i3c@lists.infradead.org;
	Tue, 29 Sep 2026 06:46:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2CBC760A59;
	Tue, 29 Sep 2026 06:46:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CAF01F00893;
	Tue, 29 Sep 2026 06:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790664360;
	bh=6JffcfM7MQZ0bdz1H389pc9jbp37MxjjQGCjxfkCeZY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZLq/61g/qCFNpN3EjDAFMPgq8R7j0tdSPUCRW3xaoEmzrjJ4DWAsYQWnh8E+/xlxk
	 Drl/q+WZShnORj0r8IO5VcsBIRxP4IGZ0Hkxe+BuYp+xhgVMZkOq02GnYGKWk7Tqwj
	 XC6xeqJO/dpMzvU72Iz5RdS1XKcdP4OYW5L0DTgjeeqRO7FlKLKZT1gKugIeX4iVLV
	 I8Wq2IYfV2Dcr2UOXSEg2QLeERxQSP7TitlbYeFlZKnf1JzOYeUYwDGaiQ+mRRmEL7
	 UfxITU0F7IYBmn7TMP8pG95lUy7uSvLH5KYC/uXZzQPzSSn8LZlqFNV1GXfxpffh51
	 u5hxkqenfLAKg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 12/20] pinctrl: berlin: add optional pinconf support
To: "Jisheng Zhang" <jszhang@kernel.org>
Cc: lee@kernel.org, linux-serial@vger.kernel.org, conor+dt@kernel.org, linux-i3c@lists.infradead.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, mfd@lists.linux.dev, robh@kernel.org, linux-clk@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260929061417.20733-13-jszhang@kernel.org>
References: <20260929061417.20733-1-jszhang@kernel.org>
 <20260929061417.20733-13-jszhang@kernel.org>
Date: Tue, 29 Sep 2026 06:45:59 +0000
Message-Id: <20260929064600.6CAF01F00893@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIHBpbmN0cmw6IFVubWFz
a2VkIERSSVZFX1NUUkVOR1RIIGFyZ3VtZW50IGNvcnJ1cHRzIGFkamFjZW50IHJlZ2lzdGVyIGJp
dHMKLSBbTWVkaXVtXSBwaW5jdHJsOiBtZW1vcnkgb3Zlci1hbGxvY2F0aW9uIGR1ZSB0byBpbmNv
cnJlY3QgbWFwIHJlc2VydmF0aW9uIGxvZ2ljCi0tCgpjb21taXQgOTU2NWUxNDUxYWNjYTY0Njcw
YjM2NWM1ZTFkY2MzZWRiNDY0MzczNwpBdXRob3I6IEppc2hlbmcgWmhhbmcgPGpzemhhbmdAa2Vy
bmVsLm9yZz4KCnBpbmN0cmw6IGJlcmxpbjogYWRkIG9wdGlvbmFsIHBpbmNvbmYgc3VwcG9ydAoK
QWRkIHBpbmNvbmYgc3VwcG9ydCBmb3IgbmV3ZXIgU3luYXB0aWNzIFNvQ3MuCgo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3BpbmN0cmwvYmVybGluL2Jlcmxpbi5jIGIvZHJpdmVycy9waW5jdHJsL2Jl
cmxpbi9iZXJsaW4uYwo+IGluZGV4IDBjMjE3OWI5ODYyOTUuLjA2YzY3ZjAwYzUyNzYgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9waW5jdHJsL2Jlcmxpbi9iZXJsaW4uYwo+ICsrKyBiL2RyaXZlcnMv
cGluY3RybC9iZXJsaW4vYmVybGluLmMKWyAuLi4gXQo+IEBAIC03NSwxMSArOTQsMTkgQEAgc3Rh
dGljIGludCBiZXJsaW5fcGluY3RybF9kdF9ub2RlX3RvX21hcChzdHJ1Y3QgcGluY3RybF9kZXYg
KnBjdHJsX2RldiwKPiAgCQlyZXR1cm4gLUVJTlZBTDsKPiAgCX0KPiAgCj4gKwlyZXQgPSBwaW5j
b25mX2dlbmVyaWNfcGFyc2VfZHRfY29uZmlnKG5vZGUsIHBjdHJsX2RldiwgJmNvbmZpZ3MsCj4g
KwkJCQkJICAgICAgJm51bV9jb25maWdzKTsKPiArCWlmIChyZXQgPCAwKSB7Cj4gKwkJZGV2X2Vy
cihwY3RybC0+ZGV2LCAiJXM6IGNvdWxkIG5vdCBwYXJzZSBub2RlIHByb3BlcnR5XG4iLAo+ICsJ
CQlub2RlLT5uYW1lKTsKPiArCQlyZXR1cm4gcmV0Owo+ICsJfQo+ICsKPiAgCXJldCA9IHBpbmN0
cmxfdXRpbHNfcmVzZXJ2ZV9tYXAocGN0cmxfZGV2LCBtYXAsICZyZXNlcnZlZF9tYXBzLAo+IC0J
CQkJCW51bV9tYXBzLCBuZ3JvdXBzKTsKPiArCQkJCQludW1fbWFwcywgbmdyb3VwcyAqIChudW1f
Y29uZmlncyArIDEpKTsKCltTZXZlcml0eTogTWVkaXVtXQpEb2VzIHRoaXMgbWFwIHJlc2VydmF0
aW9uIGxvZ2ljIHBlcm1hbmVudGx5IG92ZXItYWxsb2NhdGUga2VybmVsIG1lbW9yeSBmb3IgdGhl
CmxpZmV0aW1lIG9mIHRoZSBwYXJzZWQgcGluIGNvbmZpZ3VyYXRpb24/CgpUaGUgZHJpdmVyIHJl
c2VydmVzIG1hcCBlbnRyaWVzIHVzaW5nIG5ncm91cHMgKiAobnVtX2NvbmZpZ3MgKyAxKS4gSG93
ZXZlciwKcGluY3RybF91dGlsc19hZGRfbWFwX2NvbmZpZ3MoKSBhZ2dyZWdhdGVzIHRoZSBlbnRp
cmUgYXJyYXkgb2YgY29uZmlndXJhdGlvbnMKaW50byBhIHNpbmdsZSBtYXAgZW50cnkuIFRodXMs
IHRoZSBkcml2ZXIgYWRkcyBhdCBtb3N0IDIgZW50cmllcyBwZXIgZ3JvdXAKKG9uZSBmb3IgdGhl
IG11eCBhbmQgb25lIGZvciB0aGUgY29uZmlncyksIHJlZ2FyZGxlc3Mgb2YgbnVtX2NvbmZpZ3Mu
CgpXaGVuIHBhcnNpbmcgcGluIGNvbmZpZ3VyYXRpb25zIGZyb20gdGhlIGRldmljZSB0cmVlIHdo
ZXJlIG51bV9jb25maWdzID4gMSwKdGhpcyByZXN1bHRzIGluIChudW1fY29uZmlncyAtIDEpICog
bmdyb3VwcyB1bnVzZWQgYXJyYXkgZWxlbWVudHMgYmVpbmcKYWxsb2NhdGVkLgoKPiAgCWlmIChy
ZXQpIHsKPiAgCQlkZXZfZXJyKHBjdHJsLT5kZXYsICJjYW4ndCByZXNlcnZlIG1hcDogJWRcbiIs
IHJldCk7Cj4gLQkJcmV0dXJuIHJldDsKPiArCQlnb3RvIGV4aXQ7Cj4gIAl9ClsgLi4uIF0KPiAr
c3RhdGljIGludCBiZXJsaW5fcGluY29uZl9ncm91cF9zZXQoc3RydWN0IHBpbmN0cmxfZGV2ICpw
Y3RybF9kZXYsCj4gKwkJCQkgICAgdW5zaWduZWQgaW50IGdyb3VwLCB1bnNpZ25lZCBsb25nICpj
b25maWdzLAo+ICsJCQkJICAgIHVuc2lnbmVkIGludCBuY29uZmlncykKPiArewpbIC4uLiBdCj4g
KwkJc3dpdGNoIChwYXJhbSkgewpbIC4uLiBdCj4gKwkJY2FzZSBQSU5fQ09ORklHX0RSSVZFX1NU
UkVOR1RIOgo+ICsJCQlpZiAoY29uZl9iaXRzID09IDEwKQo+ICsJCQkJbWFzayB8PSBQSU5DRkdf
RFNfMTBCSVQ7Cj4gKwkJCWVsc2UKPiArCQkJCW1hc2sgfD0gUElOQ0ZHX0RTXzhCSVQ7Cj4gKwkJ
CXZhbCB8PSBhcmc7Cj4gKwkJCWJyZWFrOwoKW1NldmVyaXR5OiBIaWdoXQpDYW4gdGhpcyByZWdy
ZXNzaW9uIGNhdXNlIHRoZSB1bmJvdW5kZWQgdXNlci1wcm92aWRlZCBhcmcgdG8gb3ZlcmZsb3cg
YW5kCmNvcnJ1cHQgYWRqYWNlbnQgcmVnaXN0ZXIgYml0cz8KCldoZW4gdGhlIGRldmljZSB0cmVl
IHNwZWNpZmllcyBhIGRyaXZlLXN0cmVuZ3RoIHZhbHVlIHRoYXQgZXhjZWVkcyB0aGUgdW5tYXNr
ZWQKYml0IHdpZHRoIChlLmcuLCA+IDE1KSwgdGhlIHBhcnNlZCBhcmcgaXMgYWRkZWQgZGlyZWN0
bHkgdG8gdmFsIHZpYSB2YWwgfD0gYXJnCndpdGhvdXQgYXBwbHlpbmcgYSBiaXRtYXNrLgoKQmVj
YXVzZSB2YWwgYW5kIG1hc2sgYXJlIGFjY3VtdWxhdGVkIGFjcm9zcyBhbGwgY29uZmlnIHBhcmFt
ZXRlcnMgaW4gYSBsb29wLAp0aGUgb3ZlcmZsb3dpbmcgYml0cyBmcm9tIERSSVZFX1NUUkVOR1RI
IHdpbGwgYmUgd3JpdHRlbiB0byB0aGUgcmVnaXN0ZXIgaWYKdGhleSBvdmVybGFwIHdpdGggdGhl
IGNvbXBvc2l0ZSBtYXNrIGJpdHMgcmVxdWVzdGVkIGJ5IG90aGVyIHBhcmFtZXRlcnMKKGUuZy4s
IG92ZXJyaWRpbmcgdGhlIFBJTkNGR19JRV8xMEJJVCBzdGF0ZSkuIFRoaXMgY291bGQgbGVhZCB0
byBpbmNvcnJlY3QKaGFyZHdhcmUgcGluIHN0YXRlcyBhbmQgZnVuY3Rpb25hbCBmYWlsdXJlcyBv
biBrZXkgaW50ZXJmYWNlcyBkdXJpbmcgZGV2aWNlCnByb2JlLgoKPiArCQljYXNlIFBJTl9DT05G
SUdfSU5QVVRfRU5BQkxFOgpbIC4uLiBdCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6
Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwOTI5MDYxNDE3LjIwNzMzLTEtanN6aGFuZ0Br
ZXJuZWwub3JnP3BhcnQ9MTIKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtaTNjCg==
