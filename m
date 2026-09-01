Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6276C61DD3
	for <linux-i3c@archiver.kernel.org>; Tue,  1 Sep 2026 11:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e32M0rzbD5Jz8yHU4nLxmGtc/NggfONU5XpI+OGtW5U=; b=EXhg1F/oTPD8lr
	h6x/pPURnp86/nGQ8yzvmgUhh08emqZVAW7yqX6AGQLPu67tQl6I5irEx6zNBdWkJA0/YhAykxG1R
	8BGQaxYBkJrCX6XsfUpqi45MsLwzTRlk+XzaF/Y8q/qqD8Wx1ffFHu95LFG7MVfEa9IPgKTaUL4b+
	kS6eqzY/FwyeFQRKdReWJFQv+y7JRHDtfM0getPpovZ788uxw16k4+3YZWl4GPiZ8KgWtrxi5z3kh
	FNp23gXJOlWP/CvVNOUInLDOK2hgxEiNJX2/zN97cx/9MlPrN+bm5G1QPVpYKxYLja876Gkx3Ov5P
	U6xvzXGwOuvyjKTOA3XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1N1R-0000000Bjri-1N37;
	Tue, 01 Sep 2026 11:51:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1N1O-0000000BjrR-2V3a
	for linux-i3c@lists.infradead.org;
	Tue, 01 Sep 2026 11:51:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EB1E241502;
	Tue,  1 Sep 2026 11:51:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 622F71F000E9;
	Tue,  1 Sep 2026 11:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788263481;
	bh=VR0hNmq1MqgYNy0fHyILETThfMxQJXGNu4w58/otCnM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lFzUhJgYdzaCgN8h+njVv3VgtviT2o4eLmqPz9sVER2b+eYULyxCvJYd08Osa+NFn
	 hNcgu/lxMuZdvUwx1E3fTRW4WhVzizDhDFVUpOVwqLEC1Fcqf+8rpqTFom0HMkb4Du
	 YhRwrtK2mEPjC6ueUrDW0TakVRCMIc95+8JzvtNWj0SosK4Nw4uGQBK2ojqlPbHnrA
	 B4bsj2ThDGyTp1zyTzAgSaIrm51RHuo+4pztTwkj8oTh0pug4JT0Y8GGjmXRfXcLjB
	 8UQ7KEtEurgYTl5dHh8KY4seewHcEeBd6jMsC+iQculpJ7xoTyOCpg9ICRdi7NWASm
	 y2ZRjA22Trc8w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 7/8] i3c: mipi-i3c-hci: Improve AST2700 PIO TX queue
 utilization
To: "Billy Tsai" <billy_tsai@aspeedtech.com>
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, linux-i3c@lists.infradead.org
In-Reply-To: <20260901-b4-i3c-hci-ast2700-v1-7-19909e7cbd7e@aspeedtech.com>
References: <20260901-b4-i3c-hci-ast2700-v1-0-19909e7cbd7e@aspeedtech.com>
 <20260901-b4-i3c-hci-ast2700-v1-7-19909e7cbd7e@aspeedtech.com>
Date: Tue, 01 Sep 2026 11:51:20 +0000
Message-Id: <20260901115121.622F71F000E9@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIENhbGxpbmcgYG9mX2Rl
dmljZV9pc19jb21wYXRpYmxlKClgIHZpYSB0aGUgYGlzX2FzcGVlZCgpYCBoZWxwZXIgaW5zaWRl
IHRoZSBoaWdoLXNwZWVkIFBJTyBUWCBkYXRhIHRyYW5zZmVyIGxvb3AgY2F1c2VzIHNldmVyZSBD
UFUgb3ZlcmhlYWQgYW5kIGxhdGVuY3kuCi0gW0hpZ2hdIEhhcmR3YXJlIFRPQ1RPVSAvIFN0YWxl
IHdyaXRlIHBvaW50ZXIgcmVhZCBsZWFkaW5nIHRvIEZJRk8gb3ZlcmZsb3cuCi0tCgpjb21taXQg
M2JlOTUxOTM3NTZhZjE3NjQwN2Q3ZjQwNzFiMDlhNTkxZDlhNGViMwpBdXRob3I6IEJpbGx5IFRz
YWkgPGJpbGx5X3RzYWlAYXNwZWVkdGVjaC5jb20+CgppM2M6IG1pcGktaTNjLWhjaTogSW1wcm92
ZSBBU1QyNzAwIFBJTyBUWCBxdWV1ZSB1dGlsaXphdGlvbgoKVGhpcyBjb21taXQgdXBkYXRlcyB0
aGUgTUlQSSBJM0MgSENJIGRyaXZlciB0byBpbXByb3ZlIFRYIEZJRk8gdXRpbGl6YXRpb24KZm9y
IHRoZSBBU1QyNzAwIGNvbnRyb2xsZXIuIEl0IGludHJvZHVjZXMgYSB2ZW5kb3Itc3BlY2lmaWMg
Y2hlY2sgdG8gcG9sbAp0aGUgZXhhY3QgbnVtYmVyIG9mIGZyZWUgRklGTyBlbnRyaWVzIHVzaW5n
IGhhcmR3YXJlIHJlYWQvd3JpdGUgcG9pbnRlcnMKaW5zdGVhZCBvZiByZWx5aW5nIG9uIGEgaGFs
Zi1lbXB0eSB0aHJlc2hvbGQuCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIvbWlw
aS1pM2MtaGNpL3Bpby5jIGIvZHJpdmVycy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9waW8uYwo+
IGluZGV4IDZiZDVlNDMzNjRhMWQuLjNkNzAyNTdkY2MxZGMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9waW8uYwo+ICsrKyBiL2RyaXZlcnMvaTNjL21hc3Rl
ci9taXBpLWkzYy1oY2kvcGlvLmMKClsgLi4uIF0KCj4gQEAgLTI5NSwxMSArMjk2LDIzIEBAIHN0
YXRpYyBib29sIGhjaV9waW9fZG9fdHgoc3RydWN0IGkzY19oY2kgKmhjaSwgc3RydWN0IGhjaV9w
aW9fZGF0YSAqcGlvKQo+ICAJcCArPSAoeGZlci0+ZGF0YV9sZW4gLSB4ZmVyLT5kYXRhX2xlZnQp
IC8gNDsKPiAgCj4gIAl3aGlsZSAoeGZlci0+ZGF0YV9sZWZ0ID49IDQpIHsKPiAtCQkvKiBiYWls
IG91dCBpZiBGSUZPIGZyZWUgc3BhY2UgaXMgYmVsb3cgc2V0IHRocmVzaG9sZCAqLwo+IC0JCWlm
ICghKHBpb19yZWdfcmVhZChJTlRSX1NUQVRVUykgJiBTVEFUX1RYX1RITEQpKQo+ICsJCXVuc2ln
bmVkIGludCBhdmFpbCA9IHBpby0+dHhfdGhyZXNoX3NpemU7Cj4gKwo+ICsJCWlmIChpc19hc3Bl
ZWQoaGNpKSkgewoKW1NldmVyaXR5OiBIaWdoXQpEb2VzIGNhbGxpbmcgb2ZfZGV2aWNlX2lzX2Nv
bXBhdGlibGUoKSBpbnNpZGUgdGhpcyBmYXN0cGF0aCBieXRlLXRyYW5zZmVyCmxvb3AgY2F1c2Ug
c2lnbmlmaWNhbnQgQ1BVIG92ZXJoZWFkIGFuZCBsYXRlbmN5PwoKTG9va2luZyBhdCBpc19hc3Bl
ZWQoKSBpbiB2ZW5kb3JfYXNwZWVkLmgsIGl0IHBhcnNlcyB0aGUgRGV2aWNlIFRyZWUgYW5kCnBl
cmZvcm1zIHN0cmluZyBtYXRjaGluZzoKCnN0YXRpYyBpbmxpbmUgYm9vbCBpc19hc3BlZWQoc3Ry
dWN0IGkzY19oY2kgKmhjaSkKewoJcmV0dXJuIG9mX2RldmljZV9pc19jb21wYXRpYmxlKGhjaS0+
bWFzdGVyLmRldi5vZl9ub2RlLAoJCQkJCSJhc3BlZWQsYXN0MjcwMC1pM2MtaGNpIik7Cn0KClNp
bmNlIHRoaXMgZXhlY3V0ZXMgcmVwZWF0ZWRseSBmb3IgZXZlcnkgNCBieXRlcyB0cmFuc2ZlcnJl
ZCwgaXQgbWlnaHQgcnVpbgp0aHJvdWdocHV0LCBlc3BlY2lhbGx5IGZvciBub24tQXNwZWVkIGNv
bnRyb2xsZXJzIHdoZXJlIGl0IGdldHMgZXZhbHVhdGVkCmNvbnN0YW50bHkuIFdvdWxkIGl0IGJl
IGJldHRlciB0byBjaGVjayBjb21wYXRpYmlsaXR5IGV4YWN0bHkgb25jZSBkdXJpbmcKcHJvYmUg
YW5kIGNhY2hlIHRoZSByZXN1bHQgYXMgYSBxdWlyayBmbGFnPwoKPiArCQkJLyoKPiArCQkJICog
VGhlIHZlbmRvciBGSUZPIHBvaW50ZXJzIGdpdmUgdGhlIGV4YWN0IGZyZWUgc3BhY2UsCj4gKwkJ
CSAqIGFsbG93aW5nIGJldHRlciBUWCBGSUZPIHV0aWxpemF0aW9uIHRoYW4gdGhlCj4gKwkJCSAq
IHRocmVzaG9sZCBzdGF0dXMuCj4gKwkJCSAqLwo+ICsJCQlhdmFpbCA9IGFzcGVlZF9pM2NfYXZh
aWxfdHhfZW50cmllcyhoY2kpOwoKW1NldmVyaXR5OiBIaWdoXQpDb3VsZCB0aGlzIHJlYWQgb2Yg
dGhlIGhhcmR3YXJlIHdyaXRlIHBvaW50ZXIgaW1tZWRpYXRlbHkgYWZ0ZXIgcG9zdGluZyBhCndy
aXRlIGxlYWQgdG8gYSBGSUZPIG92ZXJmbG93PwoKTWVtb3J5LW1hcHBlZCBJL08gd3JpdGVzIG92
ZXIgYnVzZXMgbGlrZSBBSEIvQVhJIGFyZSBwb3N0ZWQsIGFuZCB0aGUKaGFyZHdhcmUgY29udHJv
bGxlciBtaWdodCBuZWVkIGEgZmV3IGNsb2NrIGN5Y2xlcyB0byBjb21taXQgdGhlIGRhdGEgYW5k
CnVwZGF0ZSBpdHMgcG9pbnRlcnMuIAoKSWYgYXNwZWVkX2kzY19hdmFpbF90eF9lbnRyaWVzKCkg
cmVhZHMgUVVFVUVfUFRSMCBiZWZvcmUgdGhlIGhhcmR3YXJlCmluY3JlbWVudHMgdGhlIHdyaXRl
IHBvaW50ZXIsIHdvbid0IGF2YWlsIHJlbWFpbiBhcnRpZmljaWFsbHkgaGlnaD8KSWYgaXQgZG9l
cywgdGhlIGxvb3Agd2lsbCBpbW1lZGlhdGVseSBwdXNoIGFub3RoZXIgY2h1bmsgb2YgZGF0YSwK
cG90ZW50aWFsbHkgb3ZlcmZsb3dpbmcgdGhlIDMyLWVudHJ5IGhhcmR3YXJlIEZJRk8uIAoKU2hv
dWxkIHRoZSBkcml2ZXIgbG9jYWxseSB0cmFjayBhbmQgZGVkdWN0IHRoZSBudW1iZXIgb2Ygd29y
ZHMgd3JpdHRlbiBmcm9tCnRoZSBhdmFpbGFibGUgc3BhY2UgZHVyaW5nIHRoZSBhY3RpdmUgdHJh
bnNmZXIgaW5zdGVhZCBvZiByZS1wb2xsaW5nIHRoZQpoYXJkd2FyZSByZWdpc3Rlcj8KCj4gKwkJ
CWlmICghYXZhaWwpCj4gKwkJCQlyZXR1cm4gZmFsc2U7Cj4gKwkJfSBlbHNlIGlmICghKHBpb19y
ZWdfcmVhZChJTlRSX1NUQVRVUykgJiBTVEFUX1RYX1RITEQpKSB7CgpbIC4uLiBdCgotLSAKU2Fz
aGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwOTAx
LWI0LWkzYy1oY2ktYXN0MjcwMC12MS0wLTE5OTA5ZTdjYmQ3ZUBhc3BlZWR0ZWNoLmNvbT9wYXJ0
PTcKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNj
Cg==
