Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED02AC56208
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Aug 2026 13:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mWS9C65KzNeZWnDrWBXVY0JXgGT9FQ+wF1e4lga4RLo=; b=X7JrCvvh46KEO0
	OfLF0C5NJey83beXhsSALubUkNyVeJSf/wuXgP9walBZ/KyzZ705fVYd1GzuOp/FWOQl9HNr856a6
	htWpKbIjc65O0yspvGqgU/OsRkTA8bZfpTlIlHsPPjUlQ+uXxzK3ljOzCfwxZt6igoBaqN1tU/NVa
	xrNkJPcArEvJU9LHG1vwujLO+HcK8Ksv6AmKQcoWZxB7RTklNO4QkbHTsNVOeaXoiKWyUSF21UAmS
	l40tNrhsu9HNKOGBqEe30+iZZHqvcKgmj230jzAgL1Ty8qVgqmn2VfkgQCylqZuU9JwT6FvKgFUm8
	QqLf5DMr2DI42CoX2QPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wryYP-00000005wnA-2kcJ;
	Thu, 06 Aug 2026 13:54:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wryYN-00000005wmW-47pB
	for linux-i3c@lists.infradead.org;
	Thu, 06 Aug 2026 13:54:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 701C960A70;
	Thu,  6 Aug 2026 13:54:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF8591F000E9;
	Thu,  6 Aug 2026 13:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786024475;
	bh=uDPARL0FF3uaTinxchwOwjS/gBRNSl+Ya3TW5hicWTM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N5a7qTvp8ITTs5pJ+M0NGukP+CEnw6Uw2+dFTqkVKa7842SCO2Ey2h7oIjkgy0znY
	 aX7YiD4l7oMjU9WTlZjKffW2Pn3D+2f/ffjN/8l674iOVLOE/oMpByM3LzXPx1Ask5
	 uBaY0Q9TneqtlCjXW4yfOr8WDGsvpb9R62Ggw7QUpu1RHfbFNPZcD5rFA7wfyxxTao
	 MkBFLTXDzrhXQ3DwkgAHJkG47cWiCt+3PM+z4KhOA3ux+W4SzjiXU6oLzo0LIItm5f
	 1fN9k3YRETegR06OlTWc5FSO7G4f+03UnjYmu4FJrKR9qhECRLm1gsnfJC4NwOkOk6
	 mMDo0hLKE5Vug==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V4 14/14] i3c: mipi-i3c-hci: Advertise IBI wakeup
 capability
To: "Adrian Hunter" <adrian.hunter@intel.com>
Cc: linux-pci@vger.kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, linux-i3c@lists.infradead.org, Frank.Li@kernel.org
In-Reply-To: <20260806131857.119830-15-adrian.hunter@intel.com>
References: <20260806131857.119830-1-adrian.hunter@intel.com>
 <20260806131857.119830-15-adrian.hunter@intel.com>
Date: Thu, 06 Aug 2026 13:54:34 +0000
Message-Id: <20260806135434.CF8591F000E9@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gVGhlIHBsYXRmb3Jt
IGRyaXZlciBzZXRzIHRoZSBJM0MgbWFzdGVyIGBpYmlfd2FrZXVwYCBmbGFnIGJ1dCBmYWlscyB0
byBwcm9wYWdhdGUgdGhlIHdha2V1cCBzdGF0ZSBkdXJpbmcgc3lzdGVtIHN1c3BlbmQgZm9yIG5v
bi1QQ0kgcGxhdGZvcm0gZGV2aWNlcywgYnJlYWtpbmcgSUJJIHdha2V1cCBmdW5jdGlvbmFsaXR5
LgotLQoKLS0tIFBhdGNoIFsxNF06IFtQQVRDSCBWNCAxNC8xNF0gaTNjOiBtaXBpLWkzYy1oY2k6
IEFkdmVydGlzZSBJQkkgd2FrZXVwIGNhcGFiaWxpdHkgLS0tCmNvbW1pdCA0NDNhNWMwZDU4NTlk
ZjhmYmFkOTFiNmU0NTY4NjUyNzRhN2Y3Y2E5CkF1dGhvcjogQWRyaWFuIEh1bnRlciA8YWRyaWFu
Lmh1bnRlckBpbnRlbC5jb20+CgppM2M6IG1pcGktaTNjLWhjaTogQWR2ZXJ0aXNlIElCSSB3YWtl
dXAgY2FwYWJpbGl0eQoKVGhpcyBjb21taXQgc2V0cyBtYXN0ZXItPmliaV93YWtldXAgZHVyaW5n
IHByb2JlIHdoZW4gdGhlIGFzc29jaWF0ZWQgc3lzdGVtCmRldmljZSBhZHZlcnRpc2VzIHdha2V1
cCBjYXBhYmlsaXR5LiBUaGlzIGFsbG93cyB0aGUgSTNDIGNvcmUgdG8gbWFyawpJQkktY2FwYWJs
ZSBJM0MgZGV2aWNlcyBhcyB3YWtldXAgY2FwYWJsZS4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
aTNjL21hc3Rlci9taXBpLWkzYy1oY2kvY29yZS5jIGIvZHJpdmVycy9pM2MvbWFzdGVyL21pcGkt
aTNjLWhjaS9jb3JlLmMKPiBpbmRleCBmOTVkYTQyN2Q3YTllLi4wNmFjZjZjZjVhMGRiIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci9taXBpLWkzYy1oY2kvY29yZS5jCj4gKysrIGIv
ZHJpdmVycy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9jb3JlLmMKWyAuLi4gXQo+IEBAIC0xMTgw
LDYgKzExODEsOSBAQCBzdGF0aWMgaW50IGkzY19oY2lfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqcGRldikKPiAgCWlmIChoY2ktPnF1aXJrcyAmIEhDSV9RVUlSS19SUE1fSUJJX0FMTE9X
RUQpCj4gIAkJaGNpLT5tYXN0ZXIucnBtX2liaV9hbGxvd2VkID0gdHJ1ZTsKPiAgCj4gKwlpZiAo
ZGV2aWNlX2Nhbl93YWtldXAoaTNjX2hjaV9zeXNkZXYoJnBkZXYtPmRldikpKQo+ICsJCWhjaS0+
bWFzdGVyLmliaV93YWtldXAgPSB0cnVlOwo+ICsKCltTZXZlcml0eTogTWVkaXVtXQpJZiB3ZSBh
ZHZlcnRpc2UgaWJpX3dha2V1cCBoZXJlIGZvciBub24tUENJIHBsYXRmb3JtIGRldmljZXMsIGhv
dyBkb2VzIHRoZQpzdXNwZW5kIHBhdGgga25vdyB0byBhY3R1YWxseSBhcm0gdGhlIHN5c3RlbSB3
YWtldXA/CgpXaGlsZSB0aGUgUENJIGdsdWUgZHJpdmVyIGFnZ3JlZ2F0ZXMgd2FrZXVwIHN0YXRl
cyBieSBjaGVja2luZwppM2NfbWFzdGVyX2hhc193YWtldXBfZW5hYmxlZF9kZXZzKCkgZHVyaW5n
IHN1c3BlbmQsIHRoZSBuYXRpdmUgcGxhdGZvcm0Kc3VzcGVuZCByb3V0aW5lIGkzY19oY2lfc3Vz
cGVuZCgpIGRvZXMgbm90IGFwcGVhciB0byBjaGVjayB0aGlzIG9yIGVuYWJsZQp3YWtldXBzOgoK
ZHJpdmVycy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9jb3JlLmM6aTNjX2hjaV9zdXNwZW5kKCkg
ewoJc3RydWN0IGkzY19oY2kgKmhjaSA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwoKCWlmICghKGhj
aS0+cXVpcmtzICYgSENJX1FVSVJLX1JQTV9BTExPV0VEKSkKCQlyZXR1cm4gMDsKCglyZXR1cm4g
cG1fcnVudGltZV9mb3JjZV9zdXNwZW5kKGRldik7Cn0KCkRvZXMgdGhpcyBtZWFuIElCSSB3YWtl
dXBzIHdpbGwgc2lsZW50bHkgZmFpbCB0byB3YWtlIHRoZSBzeXN0ZW0gZm9yIG5vbi1QQ0kKcGxh
dGZvcm0gZGV2aWNlcywgb3IgaXMgdGhlcmUgYW5vdGhlciBtZWNoYW5pc20gaGFuZGxpbmcgdGhl
IHdha2V1cApwcm9wYWdhdGlvbiBmb3IgdGhlbT8KCj4gIAlyZXR1cm4gaTNjX21hc3Rlcl9yZWdp
c3RlcigmaGNpLT5tYXN0ZXIsICZwZGV2LT5kZXYsICZpM2NfaGNpX29wcywgZmFsc2UpOwo+ICB9
CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0
LzIwMjYwODA2MTMxODU3LjExOTgzMC0xLWFkcmlhbi5odW50ZXJAaW50ZWwuY29tP3BhcnQ9MTQK
Ci0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
