Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F04FC55184
	for <linux-i3c@archiver.kernel.org>; Tue,  4 Aug 2026 14:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OuqbtZfDp9cXLW6PKM1WpGOM9UC0vYqJyNUHfGjK0wU=; b=bvyA9eyCnfYu7P
	rc7fWAEPTVrRNMCiBB2X26lepvXyjx2zeaGb+rnPFaCEKI9YfQkJYag6dWkBo03RpEECTi4ECTHeZ
	gHV6E1RbN5P6k+QDfiI4nCn/7y50Lg7rXq4M3yuPVNgqBF9b6qNcBJ6DEHoA3T2pOQlWEnM9WKo6Q
	3mSWQWA/sN86uzYcJOasEwB0v2xy5y5gYEQCN65bX7TbuUA3vtz5t4rsa51nkbvAqcVUZInQuBJdz
	mi9T0DAv1Um/5aeT5yf0iYKCn51c2q2QugK2YvN8YA/bY9ye3Ae9dHqmdpJq9tKw5vccBesBscHC+
	RipHSxHKawpxbXvyBGdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFqV-000000021ad-09Gx;
	Tue, 04 Aug 2026 14:10:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFqS-000000021aQ-3CD5
	for linux-i3c@lists.infradead.org;
	Tue, 04 Aug 2026 14:10:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2B77C60A83;
	Tue,  4 Aug 2026 14:10:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B9641F000E9;
	Tue,  4 Aug 2026 14:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785852615;
	bh=/2EpyqNJbzQaU0bFvsI6Q0Ns24LoWCbbOyID6UOCoI8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z/6no5dsWXXyxvnFyhieAp3h1OCJU8Ag30dRaSugkZ9yXn4krdjgqRTbN1kWEu9FV
	 BS6KZi+G7R5FW7oK5Vh6H8uEu4EATgo2bPFzw4YIKQT4CEUtU0f4hS0NUaKDCea4yt
	 midetKbkpWfuuZnBsFhPF65OvJemXjBlNCW/scgAOgniGN2qorjUB0Ux6tvitj1ru7
	 tsQbLHb3bOZzK2ZyUEzdLBzTzIk+Qo+hT5Z0aCJ8zwKzuL14KQLtGwYOq1NiGu82X9
	 Jt7GqTzKQlI697fbZAu9YSCz/UIv73KnOBEyFlu/h5tBUQ+Jr0OI8c3klcH33/d9kT
	 9QbqH8U3vZHmQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V3 04/14] i3c: master: Fix use-after-free of
 master->this
To: "Adrian Hunter" <adrian.hunter@intel.com>
Cc: Frank.Li@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, linux-i3c@lists.infradead.org, linux-pci@vger.kernel.org
In-Reply-To: <20260804133810.184905-5-adrian.hunter@intel.com>
References: <20260804133810.184905-1-adrian.hunter@intel.com>
 <20260804133810.184905-5-adrian.hunter@intel.com>
Date: Tue, 04 Aug 2026 14:10:14 +0000
Message-Id: <20260804141015.8B9641F000E9@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpOZXcgaXNzdWVzOgotIFtIaWdoXSBB
IGRvdWJsZSBmcmVlIG9jY3VycyBpbiB0aGUgZXJyb3IgcGF0aCBvZiBgaTNjX21hc3Rlcl9zZXRf
aW5mbygpYCBiZWNhdXNlIGBtYXN0ZXItPnRoaXNgIGlzIGxlZnQgYXMgYSBkYW5nbGluZyBwb2lu
dGVyIGFuZCBpcyBzdWJzZXF1ZW50bHkgZnJlZWQgYWdhaW4gaW4gYGkzY19tYXN0ZXJkZXZfcmVs
ZWFzZSgpYC4KClByZS1leGlzdGluZyBpc3N1ZXM6Ci0gW0hpZ2hdIERldnJlcyBsaWZldGltZSBt
aXNtYXRjaCBhbGxvd3MgdXNlLWFmdGVyLWZyZWUgb2YgdGhlIG1hc3RlciBjb250cm9sbGVyIHN0
cnVjdCBpbiBgaTNjX21hc3RlcmRldl9yZWxlYXNlKClgLgotLQoKLS0tIFBhdGNoIFs0XTogW1BB
VENIIFYzIDA0LzE0XSBpM2M6IG1hc3RlcjogRml4IHVzZS1hZnRlci1mcmVlIG9mIG1hc3Rlci0+
dGhpcyAtLS0KY29tbWl0IGU3NGQzM2UyNWJhODdmZGM4MDAyNzdhYTU3MDJhOTg0ZDIwMDc2Y2EK
QXV0aG9yOiBBZHJpYW4gSHVudGVyIDxhZHJpYW4uaHVudGVyQGludGVsLmNvbT4KaTNjOiBtYXN0
ZXI6IEZpeCB1c2UtYWZ0ZXItZnJlZSBvZiBtYXN0ZXItPnRoaXMKClRoaXMgcGF0Y2ggZGVsYXlz
IGZyZWVpbmcgbWFzdGVyLT50aGlzIHVudGlsIGkzY19tYXN0ZXJkZXZfcmVsZWFzZSgpLiBCeQpk
b2luZyB0aGlzLCBpdCBrZWVwcyBtYXN0ZXItPnRoaXMgYWxpdmUgdW50aWwgYWxsIHVzZXJzIG9m
IHRoZSBtYXN0ZXIKZGV2aWNlIGhhdmUgZ29uZSBhd2F5IGFuZCB0aGUgc3lzZnMgc3RhdGUgaXMg
dG9ybiBkb3duLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyLmMgYi9kcml2ZXJz
L2kzYy9tYXN0ZXIuYwo+IGluZGV4IGFiYjU4MjY0NWEyZWQuLjQ4MzljMWMxODZlYjAgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9pM2MvbWFzdGVyLmMKPiArKysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIu
YwpbIC4uLiBdCj4gQEAgLTg0Miw2ICs4NDIsMTEgQEAgc3RhdGljIHN0cnVjdCBhdHRyaWJ1dGUg
KmkzY19tYXN0ZXJkZXZfYXR0cnNbXSA9IHsKPiAgfTsKPiAgQVRUUklCVVRFX0dST1VQUyhpM2Nf
bWFzdGVyZGV2KTsKPiAgCj4gK3N0YXRpYyB2b2lkIGkzY19tYXN0ZXJfZnJlZV9pM2NfZGV2KHN0
cnVjdCBpM2NfZGV2X2Rlc2MgKmRldikKPiArewo+ICsJa2ZyZWUoZGV2KTsKPiArfQo+ICsKPiAg
c3RhdGljIHZvaWQgaTNjX21hc3RlcmRldl9yZWxlYXNlKHN0cnVjdCBkZXZpY2UgKmRldikKPiAg
ewo+ICAJc3RydWN0IGkzY19tYXN0ZXJfY29udHJvbGxlciAqbWFzdGVyID0gZGV2X3RvX2kzY21h
c3RlcihkZXYpOwo+ICAJc3RydWN0IGkzY19idXMgKmJ1cyA9IGRldl90b19pM2NidXMoZGV2KTsK
CltTZXZlcml0eTogSGlnaF0KVGhpcyBpcyBhIHByZS1leGlzdGluZyBpc3N1ZSwgYnV0IGRvZXMg
dGhpcyByZWxlYXNlIGZ1bmN0aW9uIGRlcmVmZXJlbmNlCmZpZWxkcyBpbiB0aGUgbWFzdGVyIHN0
cnVjdCBhZnRlciB0aGUgZHJpdmVyJ3MgZGV2cmVzIGNsZWFudXAgaGFzIGFscmVhZHkKZnJlZWQg
dGhlIHN1cnJvdW5kaW5nIG1lbW9yeT8KCk1hc3RlciBjb250cm9sbGVyIHN0cnVjdHVyZXMgYXJl
IHR5cGljYWxseSBhbGxvY2F0ZWQgdXNpbmcgZGV2bV9remFsbG9jKCkuCldoZW4gYSBkcml2ZXIg
aXMgdW5ib3VuZCwgZGV2cmVzIGNsZWFudXAgZnJlZXMgdGhlIG1hc3RlciBjb250cm9sbGVyCnN0
cnVjdHVyZS4gSG93ZXZlciwgaWYgdXNlcnNwYWNlIGhvbGRzIGFuIG9wZW4gZmlsZSBkZXNjcmlw
dG9yIHRvIGEgc3lzZnMKYXR0cmlidXRlIChsaWtlIC9zeXMvY2xhc3MvaTNjL2kzYy0wL2Jjciks
IHRoZSBrb2JqZWN0IHJlZmNvdW50IGRvZXNuJ3QgZHJvcAp0byB6ZXJvLgoKV2hlbiB0aGUgc3lz
ZnMgZmlsZSBpcyBsYXRlciBjbG9zZWQsIHRoZSBmaW5hbCBwdXRfZGV2aWNlKCkgY2FsbHMgdGhp
cwppM2NfbWFzdGVyZGV2X3JlbGVhc2UoKSBmdW5jdGlvbiwgd2hpY2ggdGhlbiBkZXJlZmVyZW5j
ZXMgZmllbGRzIGxpa2UKbWFzdGVyLT53cSwgYnVzLT5kZXZzLCBhbmQgbm93IG1hc3Rlci0+dGhp
cywgbGVhZGluZyB0byBhIHVzZS1hZnRlci1mcmVlLgoKPiAgCWlmIChtYXN0ZXItPndxKQo+ICAJ
CWRlc3Ryb3lfd29ya3F1ZXVlKG1hc3Rlci0+d3EpOwo+ICAKPiAgCVdBUk5fT04oIWxpc3RfZW1w
dHkoJmJ1cy0+ZGV2cy5pMmMpIHx8ICFsaXN0X2VtcHR5KCZidXMtPmRldnMuaTNjKSk7Cj4gIAlp
M2NfYnVzX2NsZWFudXAoYnVzKTsKPiAgCj4gIAlmd25vZGVfaGFuZGxlX3B1dChkZXYtPmZ3bm9k
ZSk7Cj4gKwo+ICsJaTNjX21hc3Rlcl9mcmVlX2kzY19kZXYobWFzdGVyLT50aGlzKTsKCltTZXZl
cml0eTogSGlnaF0KRG9lcyB1bmNvbmRpdGlvbmFsbHkgZnJlZWluZyBtYXN0ZXItPnRoaXMgaGVy
ZSBjYXVzZSBhIGRvdWJsZSBmcmVlIG9uIHRoZQplcnJvciBwYXRoIG9mIGkzY19tYXN0ZXJfc2V0
X2luZm8oKT8KCklmIGkzY19tYXN0ZXJfYXR0YWNoX2kzY19kZXYoKSBmYWlscyBkdXJpbmcgaW5p
dGlhbGl6YXRpb24gaW4KaTNjX21hc3Rlcl9zZXRfaW5mbygpLCB0aGUgYWxsb2NhdGVkIGkzY2Rl
diBpcyBmcmVlZCB2aWEKaTNjX21hc3Rlcl9mcmVlX2kzY19kZXYoKS4KCkhvd2V2ZXIsIG1hc3Rl
ci0+dGhpcyBhbmQgbWFzdGVyLT5idXMuY3VyX21hc3RlciB3ZXJlIGFscmVhZHkgYXNzaWduZWQg
dG8KcG9pbnQgdG8gaTNjZGV2IGFuZCBhcmUgbm90IHNldCBiYWNrIHRvIE5VTEw6Cgpkcml2ZXJz
L2kzYy9tYXN0ZXIuYzppM2NfbWFzdGVyX3NldF9pbmZvKCkgewoJLi4uCgltYXN0ZXItPnRoaXMg
PSBpM2NkZXY7CgltYXN0ZXItPmJ1cy5jdXJfbWFzdGVyID0gbWFzdGVyLT50aGlzOwoKCXJldCA9
IGkzY19tYXN0ZXJfYXR0YWNoX2kzY19kZXYobWFzdGVyLCBpM2NkZXYpOwoJaWYgKHJldCkKCQln
b3RvIGVycl9mcmVlX2RldjsKCS4uLgplcnJfZnJlZV9kZXY6CglpM2NfbWFzdGVyX2ZyZWVfaTNj
X2RldihpM2NkZXYpOwoJcmV0dXJuIHJldDsKfQoKVGhlIGZhaWx1cmUgcHJvcGFnYXRlcyB0byBp
M2NfbWFzdGVyX3JlZ2lzdGVyKCksIHdoaWNoIGNhbGxzCnB1dF9kZXZpY2UoJm1hc3Rlci0+ZGV2
KSB0byBhYm9ydCBkcml2ZXIgcmVnaXN0cmF0aW9uLiBUaGlzIGNhbGxzCmkzY19tYXN0ZXJkZXZf
cmVsZWFzZSgpLCB3aGljaCBub3cgdW5jb25kaXRpb25hbGx5IGZyZWVzIG1hc3Rlci0+dGhpcywK
bGVhZGluZyB0byBhIGRvdWJsZSBmcmVlIG9mIHRoZSBkYW5nbGluZyBwb2ludGVyLgoKPiAgfQoK
LS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8y
MDI2MDgwNDEzMzgxMC4xODQ5MDUtMS1hZHJpYW4uaHVudGVyQGludGVsLmNvbT9wYXJ0PTQKCi0t
IApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
