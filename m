Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EAF2C55822
	for <linux-i3c@archiver.kernel.org>; Tue,  4 Aug 2026 15:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u2WZk+x2evO65/uCOIG1ySxHtE/OWMr4lDpo7ktdVaI=; b=Csvbt2s8FQDNUA
	XXMsM5tevPI7t0Et6xWWR5qhNY30w4egihN/Xw9sfpXzjZ2EGmVKW8VJtk1gsxpaFeeLxQcTuZ6DH
	i/KhcNk9L+OYsrdkDzFzXsnpqWLyxVcwzPLaegFIYVwJZrk8yCxRQwEwJHkzutz9Ls2uoTbUFz4pM
	cjiaqjwV8zD4ndkF1kdfrjK8qhCrEqE7UGhyb0/S/Fnw9HlxB/PCQCabZW+j3ZXcotopAQslSu7e6
	/HIV2CmJJNdhFUOJOPjh3C9IcNh7sHgyzgNbRZcA23vxXYUK1puZC0akrEnaTPm/rAcJBgIHtciAz
	jDff0YllcmPaG6AM2gdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrGiE-00000002AJZ-3VN2;
	Tue, 04 Aug 2026 15:05:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrGiE-00000002AJT-1sNS
	for linux-i3c@lists.infradead.org;
	Tue, 04 Aug 2026 15:05:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1F86F4042F;
	Tue,  4 Aug 2026 15:05:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAD501F000E9;
	Tue,  4 Aug 2026 15:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785855950;
	bh=zEcqbijH0MM7MzeUH+fp++K6g507dMhXEUFBILcr08A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b0YBRfpSrGBYXCfZYkkWu4Wr6h7OwvUPDuFnGbMaAX2Q3RwcwYBSQ66bjpl9xTSBE
	 qZTVw0KEDbZt6yVMITdBXzojXhgicdpT/gw23SnEFx5th6npeBpXjCLx6nb7DWSLZr
	 p+OdIrZArY1NM31C0nszuIN9dFvtC7Tvh9kuMD0TRvkMExzcRnTqSl1PnIVHV/i8MV
	 Rf8mzyqaeY5n1O4VEck3w4fKG7+04/HFJYJTo92P/YuwxvepDx8+Xm+mnhmxg9Kgpd
	 5IBcQQDbXR7Ystlm/Zm2Cre6ieoJMS4uIE1cuqRNJmjCwbgBc7Xk9YfdzunUv57VHZ
	 rE9UVtHeybGqA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V3 12/14] i3c: mipi-i3c-hci-pci: Propagate I3C wakeup
 requirements to PCI
To: "Adrian Hunter" <adrian.hunter@intel.com>
Cc: linux-i3c@lists.infradead.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, Frank.Li@kernel.org, linux-pci@vger.kernel.org
In-Reply-To: <20260804133810.184905-13-adrian.hunter@intel.com>
References: <20260804133810.184905-1-adrian.hunter@intel.com>
 <20260804133810.184905-13-adrian.hunter@intel.com>
Date: Tue, 04 Aug 2026 15:05:49 +0000
Message-Id: <20260804150549.AAD501F000E9@smtp.kernel.org>
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
IFtIaWdoXSBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UgaW4gcHJveHkgUE0gY2FsbGJhY2tzIHdo
ZW4gY2hpbGQgZGV2aWNlIGlzIHVuYm91bmQKLS0KCi0tLSBQYXRjaCBbMTJdOiBbUEFUQ0ggVjMg
MTIvMTRdIGkzYzogbWlwaS1pM2MtaGNpLXBjaTogUHJvcGFnYXRlIEkzQyB3YWtldXAgcmVxdWly
ZW1lbnRzIHRvIFBDSSAtLS0KY29tbWl0IGRhODBiMWZjNWQ3MDg3MzRkZjMxNDI2MmFiM2NmMzcw
M2M5NDNmMDcKQXV0aG9yOiBBZHJpYW4gSHVudGVyIDxhZHJpYW4uaHVudGVyQGludGVsLmNvbT4K
U3ViamVjdDogaTNjOiBtaXBpLWkzYy1oY2ktcGNpOiBQcm9wYWdhdGUgSTNDIHdha2V1cCByZXF1
aXJlbWVudHMgdG8gUENJCgpUaGlzIHBhdGNoIGFsaWducyB0aGUgUENJIHdha2V1cCBzdGF0ZSB3
aXRoIHRoZSByZXF1aXJlbWVudHMgb2YgdGhlIEkzQwpkZXZpY2VzIGl0IHNlcnZlcy4gSXQgY2hl
Y2tzIGR1cmluZyBzdXNwZW5kIGlmIGFueSBIQ0kgaW5zdGFuY2UgaGFzIGEKd2FrZXVwLWVuYWJs
ZWQgSTNDIGRldmljZSwgYW5kIGFybXMgdGhlIFBDSSBmdW5jdGlvbidzIHdha2V1cCBhY2NvcmRp
bmdseS4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci9taXBpLWkzYy1oY2kvbWlw
aS1pM2MtaGNpLXBjaS5jIGIvZHJpdmVycy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9taXBpLWkz
Yy1oY2ktcGNpLmMKPiBpbmRleCA1YTllMmE0M2VmZjhkLi4yYjNiZjZmYTc0ZjI5IDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci9taXBpLWkzYy1oY2kvbWlwaS1pM2MtaGNpLXBjaS5j
Cj4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9taXBpLWkzYy1oY2ktcGNp
LmMKWyAuLi4gXQo+IEBAIC0yNzIsNiArMjc0LDEzIEBAIHN0YXRpYyBib29sIG1pcGlfaTNjX2hj
aV9wY2lfaXNfbWZkKHN0cnVjdCBkZXZpY2UgKmRldikKPiAgCXJldHVybiBkZXZfaXNfcGxhdGZv
cm0oZGV2KSAmJiBtZmRfZ2V0X2NlbGwodG9fcGxhdGZvcm1fZGV2aWNlKGRldikpOwo+ICB9Cj4g
IAo+ICtzdGF0aWMgYm9vbCBtaXBpX2kzY19oY2lfcGNpX2FueV93YWtldXBfZW5hYmxlZChzdHJ1
Y3QgZGV2aWNlICpkZXYpCj4gK3sKPiArCXN0cnVjdCBpM2NfaGNpICpoY2kgPSBkZXZfZ2V0X2Ry
dmRhdGEoZGV2KTsKPiArCj4gKwlyZXR1cm4gaTNjX21hc3Rlcl9hbnlfd2FrZXVwX2VuYWJsZWQo
JmhjaS0+bWFzdGVyKTsKCltTZXZlcml0eTogSGlnaF0KVGhpcyBpcyBhIHByZS1leGlzdGluZyBp
c3N1ZSwgYnV0IGNhbiB0aGlzIHNlcXVlbmNlIHJlc3VsdCBpbiBhIE5VTEwgcG9pbnRlcgpkZXJl
ZmVyZW5jZSBpZiB0aGUgY2hpbGQgZHJpdmVyIGlzIHVuYm91bmQ/CgpJZiB0aGUgbWlwaS1pM2Mt
aGNpIHBsYXRmb3JtIGRyaXZlciBmYWlscyB0byBwcm9iZSBvciBpcyBtYW51YWxseSB1bmJvdW5k
CnZpYSBzeXNmcywgZGV2X2dldF9kcnZkYXRhKGRldikgd2lsbCByZXR1cm4gTlVMTC4KCkR1cmlu
ZyBzeXN0ZW0gc3VzcGVuZCwgdGhlIFBDSSBwYXJlbnQgZHJpdmVyIGl0ZXJhdGVzIG92ZXIgaXRz
IGNoaWxkCnBsYXRmb3JtIGRldmljZXMgaW4gbWlwaV9pM2NfaGNpX3BjaV9zdXNwZW5kKCkuIElm
IHRoZSBCSU9TIGxlZnQgdGhlIGJ1cwphY3RpdmUgKG9yIHRoZSBoYXJkd2FyZSBodW5nIGR1cmlu
ZyBkcml2ZXIgcmVtb3ZhbCBhbmQgZmFpbGVkIHRvIGNsZWFyCnRoZSBIQ19DT05UUk9MX0JVU19F
TkFCTEUgcmVnaXN0ZXIpLCBtaXBpX2kzY19oY2lfcGNpX2lzX29wZXJhdGlvbmFsKCkKd2lsbCBy
ZXR1cm4gdHJ1ZS4KClRoaXMgY2F1c2VzIG1pcGlfaTNjX2hjaV9wY2lfc3VzcGVuZF9pbnN0YW5j
ZSgpIHRvIGNhbGwKaTNjX2hjaV9ycG1fc3VzcGVuZCgpIGFuZCB0aGlzIG5ld2x5IGFkZGVkIGZ1
bmN0aW9uLCBib3RoIG9mIHdoaWNoIHdpbGwKZGVyZWZlcmVuY2UgdGhlIE5VTEwgaGNpIHBvaW50
ZXIuCgpJcyBpdCBwb3NzaWJsZSB0byBhZGQgYSBOVUxMIGNoZWNrIGhlcmUgb3IgaW4gdGhlIGNh
bGxlciBiZWZvcmUgcHJvY2VlZGluZwp3aXRoIHRoZSBzdXNwZW5kIG9wZXJhdGlvbnMgb24gdGhl
IGNoaWxkIGRldmljZT8KCj4gK30KPiArCj4gIHN0YXRpYyBpbnQgbWlwaV9pM2NfaGNpX3BjaV9z
dXNwZW5kX2luc3RhbmNlKHN0cnVjdCBkZXZpY2UgKmRldiwgdm9pZCAqZGF0YSkKPiAgewo+ICAJ
c3RydWN0IG1pcGlfaTNjX2hjaV9wY2lfcG1fZGF0YSAqcG1fZGF0YSA9IGRhdGE7CgotLSAKU2Fz
aGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwODA0
MTMzODEwLjE4NDkwNS0xLWFkcmlhbi5odW50ZXJAaW50ZWwuY29tP3BhcnQ9MTIKCi0tIApsaW51
eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
