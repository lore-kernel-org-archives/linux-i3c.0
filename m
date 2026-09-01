Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9BB2C624CF
	for <linux-i3c@archiver.kernel.org>; Tue,  1 Sep 2026 11:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t5El6YICluuK+ew5JUPuW397r6VUTTCnHyrTkZzY+do=; b=zVhFQ4gDG/U6+L
	d0HtIVP7syYL7TU5ZFm0uBfPot5u+vl5YkscgxeMPpzzGmuKc5WKQMYUU4JMceNV1gOvkilOPEliq
	u5WPtqu+/HRhFtdFlk23V4JHUegRHy+KycTiCaIU4Ny1uIIbr+NiBPPmhi+2ywu7HnvYf0ZyofnZ7
	pltpqu3NjUGARR+4x4QAOdw17sYlLsKxFAVkSqorJy7x+ZgE2Hk31YI5XYAsTbbCea4j9r9uhviIJ
	5MKgtqoRF/yFiIoXJhdC1uiuK6ZLTyCK7odPu2JK6aoyC8yWfSOfXdV/fowX9lYCyn6Hn8q6M7zrz
	rYdRaxva534Yc5YXD3KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1N5C-0000000BkLS-1tdC;
	Tue, 01 Sep 2026 11:55:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1N5A-0000000BkLD-3WWP
	for linux-i3c@lists.infradead.org;
	Tue, 01 Sep 2026 11:55:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 214AE60210;
	Tue,  1 Sep 2026 11:55:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A20E1F00A3D;
	Tue,  1 Sep 2026 11:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788263715;
	bh=alJdvdfAQ42Hxt9ROawbxB2ozskwRrPzaCNcH6c+gzY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MSxVvF+B3MsnmLBZzbKl0uJVTvQzqPVYrT1Iu5lrV1HEDBf8da0CgaJuCkqt0wNn0
	 GdNxfFDcDMbJcfthDCAI9NL2HwSZFm1+hx7yqwKmv+YTiZuCqFwhu9Ar91HKAeOzk5
	 ZN6/eVmSD9q+2NGgv3HU331NxwNP3lMgWc4E7BxFndWigSTkdWUzV8VpAv1g+ASAOt
	 2df+1Zhm2V9T2UJSuPh3sMEnuCI2C7O0AiX8h2o+vGjBxC2mn5Jir8B6cXYuBzC7LX
	 qLbXS3S+rJBiwyKDb+ecO/Zdixt9kd8XwBzWcWwzrh5oKuORFklfD/ZUzqv+QtHydM
	 AN95AfIELqvcw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/8] i3c: mipi-i3c-hci: Add a quirk for 64-bit DMA
 addressing
To: "Billy Tsai" <billy_tsai@aspeedtech.com>
Cc: linux-i3c@lists.infradead.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, Frank.Li@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260901-b4-i3c-hci-ast2700-v1-3-19909e7cbd7e@aspeedtech.com>
References: <20260901-b4-i3c-hci-ast2700-v1-0-19909e7cbd7e@aspeedtech.com>
 <20260901-b4-i3c-hci-ast2700-v1-3-19909e7cbd7e@aspeedtech.com>
Date: Tue, 01 Sep 2026 11:55:15 +0000
Message-Id: <20260901115515.6A20E1F00A3D@smtp.kernel.org>
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
MyBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpQcmUtZXhpc3RpbmcgaXNzdWVzOgot
IFtIaWdoXSBBIG1hbGljaW91cyBvciBub24tY29tcGxpYW50IGhhcmR3YXJlIGNvbnRyb2xsZXIg
Y2FuIHRyaWdnZXIgYSBkaXZpc2lvbi1ieS16ZXJvIGtlcm5lbCBwYW5pYyBkdXJpbmcgcHJvYmUg
YnkgcmVwb3J0aW5nIGEgbm9uLXplcm8gREFUX0VOVFJZX1NJWkUgb3IgRENUX0VOVFJZX1NJWkUu
Ci0gW0hpZ2hdIElmIGFuIEkzQyB0cmFuc2ZlciBpcyBxdWV1ZWQgYnV0IG5ldmVyIHN0YXJ0ZWQg
YnkgdGhlIGhhcmR3YXJlLCB0aGUgd2FpdGluZyB0aHJlYWQgd2lsbCBlbnRlciBhbiBpbmZpbml0
ZSBsb29wIGluIHRoZSBrZXJuZWwsIGxlYWRpbmcgdG8gYSBwZXJtYW5lbnQgaGFuZy4KLSBbSGln
aF0gQSBtYWxpY2lvdXMgSTNDIGhhcmR3YXJlIGNvbnRyb2xsZXIgY2FuIHRyaWdnZXIgYSBoZWFw
IG91dC1vZi1ib3VuZHMgcmVhZCBieSByZXBvcnRpbmcgYW4gYXJiaXRyYXJpbHkgbGFyZ2UgbnVt
YmVyIG9mIGNodW5rcyBpbiBJQkkgc3RhdHVzIGRlc2NyaXB0b3JzLgotLQoKY29tbWl0IGE4YjIy
ZTE1NzYwZDIwMTYzMDc1ODc3ODE2MGNhYjA1ZDgyM2JkNzQKQXV0aG9yOiBCaWxseSBUc2FpIDxi
aWxseV90c2FpQGFzcGVlZHRlY2guY29tPgoKaTNjOiBtaXBpLWkzYy1oY2k6IEFkZCBhIHF1aXJr
IGZvciA2NC1iaXQgRE1BIGFkZHJlc3NpbmcKClRoaXMgY29tbWl0IGFkZHMgYSBIQ0lfUVVJUktf
RE1BXzY0QklUIHF1aXJrIHRvIGRlY2xhcmUgYSA2NC1iaXQKc3RyZWFtaW5nIGFuZCBjb2hlcmVu
dCBETUEgbWFzayBmb3IgSTNDIGNvbnRyb2xsZXJzIHRoYXQgc3VwcG9ydCBpdC4KCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci9taXBpLWkzYy1oY2kvY29yZS5jIGIvZHJpdmVycy9p
M2MvbWFzdGVyL21pcGktaTNjLWhjaS9jb3JlLmMKPiBpbmRleCBhNjI0ZTNjNDA0ODRlLi5jMDNj
M2E5Y2JlNGY5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci9taXBpLWkzYy1oY2kv
Y29yZS5jCj4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9jb3JlLmMKClsg
Li4uIF0KCj4gQEAgLTExNjcsNiArMTE2OCwxMiBAQCBzdGF0aWMgaW50IGkzY19oY2lfcHJvYmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgCWhjaS0+cXVpcmtzID0gKHVuc2lnbmVk
IGxvbmcpZGV2aWNlX2dldF9tYXRjaF9kYXRhKCZwZGV2LT5kZXYpOwo+ICAJaWYgKCFoY2ktPnF1
aXJrcyAmJiBwbGF0Zm9ybV9nZXRfZGV2aWNlX2lkKHBkZXYpKQo+ICAJCWhjaS0+cXVpcmtzID0g
cGxhdGZvcm1fZ2V0X2RldmljZV9pZChwZGV2KS0+ZHJpdmVyX2RhdGE7Cj4gKwlpZiAoaGNpLT5x
dWlya3MgJiBIQ0lfUVVJUktfRE1BXzY0QklUKSB7Cj4gKwkJcmV0ID0gZG1hX3NldF9tYXNrX2Fu
ZF9jb2hlcmVudCgmcGRldi0+ZGV2LCBETUFfQklUX01BU0soNjQpKTsKPiArCQlpZiAocmV0KQo+
ICsJCQlyZXR1cm4gZGV2X2Vycl9wcm9iZSgmcGRldi0+ZGV2LCByZXQsCj4gKwkJCQkJICAgICAi
Y2Fubm90IHNldCBETUEgbWFza1xuIik7Cj4gKwl9CgpbU2V2ZXJpdHk6IEhpZ2hdClRoaXMgaXNu
J3QgYSBidWcgaW50cm9kdWNlZCBieSB0aGlzIHBhdGNoLCBidXQgY291bGQgYSBtYWxpY2lvdXMg
b3IgYnVnZ3kKaGFyZHdhcmUgY29udHJvbGxlciB0cmlnZ2VyIGEga2VybmVsIHBhbmljIGR1ZSB0
byBkaXZpc2lvbiBieSB6ZXJvPwoKSW4gaTNjX2hjaV9pbml0KCksIGlmIHRoZSBoYXJkd2FyZSBp
cyB2ZXJzaW9uIDEuMCAod2hlcmUgc2l6ZV9pbl9kd29yZHMgaXMKdHJ1ZSkgYW5kIHJlcG9ydHMg
YSBub24temVybyBEQVRfRU5UUllfU0laRSwgdGhlIGRyaXZlciBzZXRzIERBVF9lbnRyeV9zaXpl
CnRvIDAgYW5kIHRoZW4gaW1tZWRpYXRlbHkgZGl2aWRlcyBieSBpdDoKCmRyaXZlcnMvaTNjL21h
c3Rlci9taXBpLWkzYy1oY2kvY29yZS5jOmkzY19oY2lfaW5pdCgpIHsKICAgIC4uLgoJaGNpLT5E
QVRfZW50cnlfc2l6ZSA9IEZJRUxEX0dFVChEQVRfRU5UUllfU0laRSwgcmVndmFsKSA/IDAgOiA4
OwoJaWYgKHNpemVfaW5fZHdvcmRzKQoJCWhjaS0+REFUX2VudHJpZXMgPSA0ICogaGNpLT5EQVRf
ZW50cmllcyAvIGhjaS0+REFUX2VudHJ5X3NpemU7CiAgICAuLi4KfQoKW1NldmVyaXR5OiBIaWdo
XQpUaGlzIGlzIGEgcHJlLWV4aXN0aW5nIGlzc3VlLCBidXQgY291bGQgYW4gdW5yZXNwb25zaXZl
IGhhcmR3YXJlIGNvbnRyb2xsZXIKY2F1c2UgYSBwZXJtYW5lbnQga2VybmVsIHRocmVhZCBoYW5n
PwoKSW4gaTNjX2hjaV9wcm9jZXNzX3hmZXIoKSwgaWYgdGhlIGhhcmR3YXJlIHN0YWxscyBvciB0
aGUgRE1BIHJpbmcgaXMgYmxvY2tlZCwKdGhlIHRyYW5zZmVyIG1pZ2h0IG5ldmVyIGJlIG1hcmtl
ZCBhcyBzdGFydGVkLiBUaGUgbG9vcCBjaGVja3MgZm9yIGEgdGltZW91dCwKYnV0IHJlbWFpbmlu
Z190aW1lb3V0IGlzIG5vdCBkZWNyZW1lbnRlZCwgY2F1c2luZyBhbiBpbmZpbml0ZSBsb29wOgoK
ZHJpdmVycy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9jb3JlLmM6aTNjX2hjaV9wcm9jZXNzX3hm
ZXIoKSB7CiAgICAuLi4KCQkvKiBLZWVwIHdhaXRpbmcgaWYgeGZlciBoYXMgbm90IHN0YXJ0ZWQg
Ki8KCQlpZiAoIXN0YXJ0ZWQpCgkJCWNvbnRpbnVlOwogICAgLi4uCn0KCltTZXZlcml0eTogSGln
aF0KVGhpcyBpc24ndCBhIGJ1ZyBpbnRyb2R1Y2VkIGJ5IHRoaXMgcGF0Y2gsIGJ1dCBjYW4gYW4g
b3V0LW9mLWJvdW5kcyBoZWFwCnJlYWQgaGFwcGVuIGlmIGEgaGFyZHdhcmUgY29udHJvbGxlciBy
ZXBvcnRzIGFuIGFyYml0cmFyaWx5IGxhcmdlIG51bWJlciBvZgpjaHVua3M/CgpJbiBoY2lfZG1h
X3Byb2Nlc3NfaWJpKCksIGliaV9zaXplIGlzIGNhbGN1bGF0ZWQgZnJvbSBjaHVuayBjb3VudHMg
cmVwb3J0ZWQKaW4gSUJJIHN0YXR1cyBkZXNjcmlwdG9ycy4gSWYgdGhlIGNhbGN1bGF0ZWQgaWJp
X3NpemUgZXhjZWVkcyB0aGUgcGh5c2ljYWwKcmluZyBidWZmZXIgc2l6ZSAocmgtPmliaV9jaHVu
a3NfdG90YWwgKiByaC0+aWJpX2NodW5rX3N6KSwgdGhpcyBjb3VsZApvdmVyZmxvdyB0aGUgcmgt
PmliaV9kYXRhIGJ1ZmZlciBkdXJpbmcgbWVtY3B5OgoKZHJpdmVycy9pM2MvbWFzdGVyL21pcGkt
aTNjLWhjaS9kbWEuYzpoY2lfZG1hX3Byb2Nlc3NfaWJpKCkgewogICAgLi4uCgkJbWVtY3B5KHNs
b3QtPmRhdGEgKyBmaXJzdF9wYXJ0LCByaW5nX2liaV9kYXRhLAoJCSAgICAgICBpYmlfc2l6ZSAt
IGZpcnN0X3BhcnQpOwogICAgLi4uCn0KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczov
L3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA5MDEtYjQtaTNjLWhjaS1hc3QyNzAwLXYxLTAt
MTk5MDllN2NiZDdlQGFzcGVlZHRlY2guY29tP3BhcnQ9MwoKLS0gCmxpbnV4LWkzYyBtYWlsaW5n
IGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
