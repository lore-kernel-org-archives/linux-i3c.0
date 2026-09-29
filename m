Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7946EC9832A
	for <linux-i3c@archiver.kernel.org>; Tue, 29 Sep 2026 06:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KNypgII6fSt0tKNaXkxLAYPnHqT+6rWc/sd3QdKva+U=; b=Lb/Gv2mDUSJO43
	jM/BDbdgKLcQypZGTQVRwaFPLooGnmMte48FVBlgqe/V8hS4f0iFhfp0tgL9NXxctwG7yWuYyuyY6
	zoqQdlk5DtjnmRO7uQCOgbiLdjw0/WsgCCgJqKYPr8hBiLO7xa64GKAVxRAdZtb8cVTEOD8nycUji
	uAWN/k0xUYqBGDr8bbA+HZYu8kboKDdke7icrYr69O9k1Zrc8YXw4RdU+GJdZWldgXrI9DuVLZUUU
	6eT+z8RixSkqAWf/d1l3tcNyjumgJEms1Rg2SrXDWeK2ivGQpLcKbmohdCNBSbXK58+KqduhgKzcR
	0XWXZiE6cRm4jeWqqh3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRi4-00000002XAT-002L;
	Tue, 29 Sep 2026 06:53:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRi2-00000002XAH-2KmF
	for linux-i3c@lists.infradead.org;
	Tue, 29 Sep 2026 06:53:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4FF1343BAA;
	Tue, 29 Sep 2026 06:53:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99F631F000FF;
	Tue, 29 Sep 2026 06:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790664782;
	bh=lG2jnZBnGSFfWMpCDUixNxmfZOCJMvHcpR6vqHjdS64=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EGaptqidZZrFJd042xCpuahBh65XGEosVFBqXLgmwrWYjnZ0pwGB6Tvl2OfyGgSAC
	 Gu1jc6I4uaovnk5SVCTaA+b5LXinl2oHHneeUXdDCsceqUVKiouxT2TN4aNUUR5oc3
	 Y/WZswhjnU2MH3C6U4Tn/A3cP5ehdyxm+kz3R/I8Jp3aqZ9LkRWNofEZ1+73ZP0TW7
	 NMU+AEjgYhIfZp3K3Fz9CAbTMU2MiLDkxZyhvb398Gg0qh5EXR6JB/RXo0WgfkXlnO
	 vNI2MM3GiFuHgFnIXj0Jwl2w/rygVazyG/GejFexeIaKxgYDHPWDVxkmMra8R5yek8
	 JpYQuTUjrhP3w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 19/20] dt-bindings: arm: berlin: Add Synaptics SL261X
 SoC and RDK board
To: "Jisheng Zhang" <jszhang@kernel.org>
Cc: Frank.Li@kernel.org, linux-clk@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-i3c@lists.infradead.org, linux-serial@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org, robh@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260929061417.20733-20-jszhang@kernel.org>
References: <20260929061417.20733-1-jszhang@kernel.org>
 <20260929061417.20733-20-jszhang@kernel.org>
Date: Tue, 29 Sep 2026 06:53:01 +0000
Message-Id: <20260929065301.99F631F000FF@smtp.kernel.org>
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
MyBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIHBpbmN0cmw6IHJlZ2lz
dGVyIGNvcnJ1cHRpb24gZHVlIHRvIHdyb25nIG9mZnNldCBmb3IgR1BJTzU0IGFuZCBTTV9HUElP
MjAKLSBbTWVkaXVtXSByZXNldDogc29jIHJlc2V0IGRyaXZlciBmYWlscyB0byBwcm9iZSBkdWUg
dG8gY29tcGF0aWJsZSBzdHJpbmcgbWlzbWF0Y2gKLSBbTWVkaXVtXSBjbGs6IG1pc3NpbmcgY2xv
Y2sgcHJvdmlkZXIgcmVnaXN0cmF0aW9uIGluIHNsMjYxeF9haW9fY2xrX3NldHVwKCkKLS0KCmNv
bW1pdCBlZmU5YTRiMzJhOTgzNmIyMjIwMjNhYmEwN2U4NDYyMzhhNzI5ZDZhCkF1dGhvcjogSmlz
aGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJuZWwub3JnPgoKZHQtYmluZGluZ3M6IGFybTogYmVybGlu
OiBBZGQgU3luYXB0aWNzIFNMMjYxWCBTb0MgYW5kIFJESyBib2FyZAogICAgCkFkZCBkZXZpY2V0
cmVlIGJpbmRpbmcgZm9yIHRoZSBTeW5hcHRpY3MgU0wyNjFYIFNvQ3MgYW5kIGNvcnJlc3BvbmRp
bmcKUkRLIGJvYXJkcy4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL2Jlcmxpbi9zbDI2MXgt
Y2xrcy5jIGIvZHJpdmVycy9jbGsvYmVybGluL3NsMjYxeC1jbGtzLmMKPiBuZXcgZmlsZSBtb2Rl
IDEwMDY0NAo+IC0tLSAvZGV2L251bGwKPiArKysgYi9kcml2ZXJzL2Nsay9iZXJsaW4vc2wyNjF4
LWNsa3MuYwpbIC4uLiBdCj4gK3N0YXRpYyBpbnQgc2wyNjF4X2Fpb19jbGtfc2V0dXAoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiArewpbIC4uLiBdCj4gKwkvKiBhcGxscyAqLwo+ICsJ
cmV0ID0gc2wyNjF4X3BsbF9yZWdpc3RlcihkZXYsIGJhc2UgKyBBUExMMF9PRkZTRVQsCj4gKwkJ
CQkgIGNsa19uYW1lc1tBUExMMF9PVVRdLCBjbGtfbmFtZXNbQVBMTDBfT1VURl0pOwo+ICsJaWYg
KHJldCkKPiArCQlyZXR1cm4gcmV0Owo+ICsJcmV0ID0gc2wyNjF4X3BsbF9yZWdpc3RlcihkZXYs
IGJhc2UgKyBBUExMMV9PRkZTRVQsCj4gKwkJCQkgIGNsa19uYW1lc1tBUExMMV9PVVRdLCBjbGtf
bmFtZXNbQVBMTDFfT1VURl0pOwo+ICsJaWYgKHJldCkKPiArCQlyZXR1cm4gcmV0Owo+ICsKPiAr
CS8qIFRPRE8gYWlvIGNsa3MgKi8KPiArCj4gKwlyZXR1cm4gMDsKPiArfQoKW1NldmVyaXR5OiBN
ZWRpdW1dClNpbmNlIHRoZSBkZXZpY2UgdHJlZSBub2RlIGZvciB0aGlzIGNsb2NrIGRlZmluZXMg
I2Nsb2NrLWNlbGxzID0gPDE+LCBkb2Vzbid0CnRoZSBjbG9jayBmcmFtZXdvcmsgZXhwZWN0IGEg
cHJvdmlkZXIgdG8gYmUgcmVnaXN0ZXJlZCBoZXJlPwoKSXQgYXBwZWFycyBzbDI2MXhfYWlvX2Ns
a19zZXR1cCgpIHJldHVybnMgMCB3aXRob3V0IGNhbGxpbmcKZGV2bV9vZl9jbGtfYWRkX2h3X3By
b3ZpZGVyKCksIHdoaWNoIGNvdWxkIGNhdXNlIGFueSBjb25zdW1lciByZXF1ZXN0aW5nIGEKY2xv
Y2sgZnJvbSB0aGUgc3luYSxzbDI2MXgtYWlvLWNsayBwcm92aWRlciB0byBmYWlsIHdpdGggYSBw
cm9iZSBkZWZlcnJhbAplcnJvci4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGluY3RybC9iZXJs
aW4vcGluY3RybC1zbDI2MXguYyBiL2RyaXZlcnMvcGluY3RybC9iZXJsaW4vcGluY3RybC1zbDI2
MXguYwo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2RyaXZl
cnMvcGluY3RybC9iZXJsaW4vcGluY3RybC1zbDI2MXguYwpbIC4uLiBdCj4gK3N0YXRpYyBjb25z
dCBzdHJ1Y3QgYmVybGluX2Rlc2NfZ3JvdXAgc2wyNjF4X3NvY19waW5jdHJsX2dyb3Vwc1tdID0g
ewpbIC4uLiBdCj4gKwlCRVJMSU5fUElOQ1RSTENPTkZfR1JPVVAoIkdQSU81NCIsIDB4ODAwYywg
MHgzLCAweDAzLAo+ICsJCQkweDg3YywgMTAsCgpbU2V2ZXJpdHk6IEhpZ2hdCklzIHRoZSBjb25m
aWd1cmF0aW9uIG9mZnNldCBmb3IgR1BJTzU0IGNvcnJlY3QgaW4gc2wyNjF4X3NvY19waW5jdHJs
X2dyb3Vwcz8KClN1cnJvdW5kaW5nIHBpbnMgbGlrZSBHUElPNTMgdXNlIDB4ODg3OCBhbmQgR1BJ
TzU1IHVzZXMgMHg4ODgwLiBJZiB0aGlzIHdhcwptZWFudCB0byBiZSAweDg4N2MsIHdvdWxkbid0
IHdyaXRpbmcgdG8gMHg4N2MgZHVyaW5nIHBpbiBjb25maWd1cmF0aW9uIGNvcnJ1cHQKdW5yZWxh
dGVkIHN5c3RlbSByZWdpc3RlcnMgaW5zdGVhZD8KClsgLi4uIF0KPiArc3RhdGljIGNvbnN0IHN0
cnVjdCBiZXJsaW5fZGVzY19ncm91cCBzbDI2MXhfc3lzbWdyX3BpbmN0cmxfZ3JvdXBzW10gPSB7
ClsgLi4uIF0KPiArCUJFUkxJTl9QSU5DVFJMQ09ORl9HUk9VUCgiU01fR1BJTzIwIiwgMHg4LCAw
eDMsIDB4MGYsCj4gKwkJCTB4YzZjLCAxMCwKCltTZXZlcml0eTogSGlnaF0KQ291bGQgdGhlIG11
bHRpcGxleGluZyBvZmZzZXQgZm9yIFNNX0dQSU8yMCBpbiBzbDI2MXhfc3lzbWdyX3BpbmN0cmxf
Z3JvdXBzCmJlIGEgdHlwbz8KCkFsbCBzdXJyb3VuZGluZyBwaW5zIHVzZSBhIG11bHRpcGxleGlu
ZyBvZmZzZXQgb2YgMHhiMDguIEV4ZWN1dGluZyBwaW5tdXgKcmVxdWVzdHMgd2l0aCBhbiBvZmZz
ZXQgb2YgMHg4IG1pZ2h0IGxlYWQgdG8gc3lzdGVtIHJlZ2lzdGVyIGNvcnJ1cHRpb24uCgo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3Jlc2V0L3Jlc2V0LXNsMjYxeC5jIGIvZHJpdmVycy9yZXNldC9y
ZXNldC1zbDI2MXguYwo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gLS0tIC9kZXYvbnVsbAo+ICsr
KyBiL2RyaXZlcnMvcmVzZXQvcmVzZXQtc2wyNjF4LmMKWyAuLi4gXQo+ICtzdGF0aWMgY29uc3Qg
c3RydWN0IG9mX2RldmljZV9pZCBzbDI2MXhfcmVzZXRfZHRfbWF0Y2hbXSA9IHsKPiArCXsgLmNv
bXBhdGlibGUgPSAic3luYSxzbDI2MXgtcmVzZXQiLCAuZGF0YSA9ICZzbDI2MXhfcmVzZXRfZGF0
YSB9LAo+ICsJeyAuY29tcGF0aWJsZSA9ICJzeW5hLHNsMjYxeC1zeXN0ZW0tcmVzZXQiLCAuZGF0
YSA9ICZzbDI2MXhfc3lzdGVtX3Jlc2V0X2RhdGEgfSwKPiArCXsgfSwKPiArfTsKCltTZXZlcml0
eTogTWVkaXVtXQpXaWxsIHRoaXMgZHJpdmVyIHN1Y2Nlc3NmdWxseSBiaW5kIHRvIHRoZSBTb0Mg
cmVzZXQgbm9kZSBkdXJpbmcgYm9vdD8KClRoZSBzbDI2MXhfcmVzZXRfZHRfbWF0Y2ggdGFibGUg
bWF0Y2hlcyBhZ2FpbnN0IHN5bmEsc2wyNjF4LXJlc2V0LCBidXQgdGhlCmRldmljZXRyZWUgYmlu
ZGluZ3MgYW5kIGRldmljZSB0cmVlIHNvdXJjZXMgZGVmaW5lIHRoZSBjb21wYXRpYmxlIHN0cmlu
ZyBhcwpzeW5hLHNsMjYxeC1zb2MtcmVzZXQuCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0
cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwOTI5MDYxNDE3LjIwNzMzLTEtanN6aGFu
Z0BrZXJuZWwub3JnP3BhcnQ9MTkKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkz
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtaTNjCg==
