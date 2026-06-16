Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B3CCD98DA
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Jun 2026 10:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q8hrD7q4sEz2M7U+CmYpjwMb2fWzG888HMW7jm+n0ic=; b=hLdwdvHfqo1/eh
	s+nAvfOiYNNY/P0y0oD1sFnwXD91H1hwp2w0HtdKnEEBkSch3bkt5ueBxzwLqnmJA2jp9dB/AsR/h
	CVs87unEryjOZ1zy5cyc/iZkuddgRjYCS2bDoXs3WbmG8Jnddk6JCq8y3Su0fx7NDCIYpIHp95plB
	cMHCRDFScQ7KadZzrNeeApZDwiRewTqEP4+oQM63rCoN8NciBgDySnMC4Uq3A8oWGp5qWMYhPYOkO
	mVRAcMQyHn76zsWyjCkax9GMyq+7h4sFhrn8oGya2e0oDr22aJ+Ex3Tzg+hw08DVLT82QtxNJZ8PC
	ac2nxA+xlOXpRml9t2Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZQpB-0000000Fab8-3iWW;
	Tue, 16 Jun 2026 10:15:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZQpA-0000000Faap-23zZ
	for linux-i3c@lists.infradead.org;
	Tue, 16 Jun 2026 10:15:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D948D60132;
	Tue, 16 Jun 2026 10:15:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34CA61F000E9;
	Tue, 16 Jun 2026 10:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781604915;
	bh=I6LjlW3vrOnGbGuc+NHtPE5P8Pt2pMpEkhpCgCmbOWM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iDjoQv1dL7ZDzjQg4glK7MurOirFHj0rwuJHJvtG+o6UxXPQR4AbOf+3E3idLd60v
	 wccYOaYS5pD5CQ0vPExbCO2RnNj924+c18fkBJbsJUjL8ozv71DeX/r5M+W/d83Bdy
	 ibcq+d0mmQk65AcWw4fnL3TGFWCUpvAXau6g4GeohWbm4KCzENox7V9k59JJqrrkPF
	 ZI4uiJvacbj1sG4jrcSIX4wQyLLISIWtP1TWkdOmK459bLd4jbjysiN52RNUGnmH96
	 cjRRnzDU4SqOoMXbZ7821rq7J7abd4ZA+kVi4zb9bNiICJhQbtnSfNo4vhg2kXsdns
	 Lbp9I67e/bH3g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 03/12] i3c: master: Support ACPI enumeration of child
 devices
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: linux-hwmon@vger.kernel.org, conor+dt@kernel.org, linux-i3c@lists.infradead.org, Frank.Li@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260616095429.3947205-4-akhilrajeev@nvidia.com>
References: <20260616095429.3947205-4-akhilrajeev@nvidia.com>
Date: Tue, 16 Jun 2026 10:15:14 +0000
Message-Id: <20260616101515.34CA61F000E9@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gZGV2bV9remFsbG9j
IGFsbG9jYXRlZCAnYm9hcmRpbmZvJyBpcyBsZWFrZWQgZm9yIGV2ZXJ5IEFDUEkgY2hpbGQgbm9k
ZSB0aGF0IGlzIGlnbm9yZWQgYmVjYXVzZSBpdCBsYWNrcyBJMkMvSTNDIHJlc291cmNlcy4KLS0K
CmNvbW1pdCA5YTM4OGMyMDU2YTU1M2Q2MjhjZTRiOGI2MjNhODEyZDRhYTA4OTUxCkF1dGhvcjog
QWtoaWwgUiA8YWtoaWxyYWplZXZAbnZpZGlhLmNvbT4KCmkzYzogbWFzdGVyOiBTdXBwb3J0IEFD
UEkgZW51bWVyYXRpb24gb2YgY2hpbGQgZGV2aWNlcwoKVGhpcyBjb21taXQgYWRkcyBzdXBwb3J0
IGZvciBkZXNjcmliaW5nIEkzQyBhbmQgSTJDIGRldmljZXMgdmlhIEFDUEkgdGFibGVzLApyYXRo
ZXIgdGhhbiByZWx5aW5nIHNvbGVseSBvbiB0aGUgZGV2aWNlIHRyZWUgcmVnIHByb3BlcnR5LiBJ
dCBpbXBsZW1lbnRzCnJlYWRpbmcgX0FEUiBhbmQgTFZSIHByb3BlcnRpZXMgZnJvbSBBQ1BJIHJl
c291cmNlcyB0byByZXRyaWV2ZSB0aGUgc3RhdGljCmFkZHJlc3MgYW5kIG90aGVyIGRldmljZSBw
cm9wZXJ0aWVzLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyLmMgYi9kcml2ZXJz
L2kzYy9tYXN0ZXIuYwo+IGluZGV4IDNiMTlhNWU4ZjQ2ZDAuLmYwZTA1YmNhYzI2ZGEgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9pM2MvbWFzdGVyLmMKPiArKysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIu
YwoKWyAuLi4gXQoKPiBAQCAtMjcwOCw2ICsyNzYyLDc0IEBAIHN0YXRpYyBpbnQgaTNjX21hc3Rl
cl9hZGRfZGV2KHN0cnVjdCBpM2NfbWFzdGVyX2NvbnRyb2xsZXIgKm1hc3RlciwKPiAgCXJldHVy
biByZXQ7Cj4gIH0KPiAgCj4gKyNpZmRlZiBDT05GSUdfQUNQSQo+ICtzdGF0aWMgaW50IGkzY19t
YXN0ZXJfYWRkX2FjcGlfZGV2KHN0cnVjdCBpM2NfbWFzdGVyX2NvbnRyb2xsZXIgKm1hc3RlciwK
PiArCQkJCSAgIHN0cnVjdCBmd25vZGVfaGFuZGxlICpmd25vZGUpCj4gK3sKPiArCXN0cnVjdCBh
Y3BpX2RldmljZSAqYWRldiA9IHRvX2FjcGlfZGV2aWNlX25vZGUoZndub2RlKTsKPiArCWFjcGlf
YnVzX2FkZHJlc3MgYWRyOwo+ICsJdTMyIHJlZ1szXSA9IHsgMCB9Owo+ICsJaW50IHJldDsKPiAr
Cj4gKwkvKgo+ICsJICogSWYgdGhlIEFDUEkgdGFibGUgZW50cnkgaGFzIF9BRFIgbWV0aG9kLCBp
dCdzIGFuIEkzQyBkZXZpY2UuCj4gKwkgKiBPdGhlcndpc2UgaXQgbWF5IGJlIGFuIEkyQyBkZXZp
Y2UgZGVzY3JpYmVkIGJ5IGFuIEkyY1NlcmlhbEJ1cwo+ICsJICogcmVzb3VyY2UuIElmIG5vIEky
Y1NlcmlhbEJ1cyByZXNvdXJjZSBpcyBmb3VuZCwgaWdub3JlIHRoZSBlbnRyeS4KPiArCSAqLwo+
ICsJaWYgKCFhY3BpX2hhc19tZXRob2QoYWRldi0+aGFuZGxlLCAiX0FEUiIpKSB7Cj4gKwkJcmV0
ID0gaTNjX21hc3Rlcl9hZGRfaTJjX2JvYXJkaW5mbyhtYXN0ZXIsIGZ3bm9kZSwgcmVnKTsKPiAr
CQlpZiAocmV0ID09IC1FTk9ERVYpCj4gKwkJCXJldHVybiAwOwoKW1NldmVyaXR5OiBNZWRpdW1d
CkRvZXMgdGhpcyBsZWFrIHRoZSBib2FyZGluZm8gYWxsb2NhdGVkIGluIGkzY19tYXN0ZXJfYWRk
X2kyY19ib2FyZGluZm8oKT8KCklmIGFuIEFDUEkgY2hpbGQgbGFja3MgYW4gX0FEUiBtZXRob2Qs
IGkzY19tYXN0ZXJfYWRkX2kyY19ib2FyZGluZm8oKQp1bmNvbmRpdGlvbmFsbHkgYWxsb2NhdGVz
IGJvYXJkaW5mbyB1c2luZyBkZXZtX2t6YWxsb2MoKS4KCklmIHRoZSBub2RlIGFsc28gbGFja3Mg
YW4gSTJjU2VyaWFsQnVzIHJlc291cmNlLCBpM2NfYWNwaV9hZGRfaTJjX2JvYXJkaW5mbygpCnJl
dHVybnMgLUVOT0RFVi4gVGhpcyBjYXVzZXMgaTNjX21hc3Rlcl9hZGRfaTJjX2JvYXJkaW5mbygp
IHRvIHJldHVybiAtRU5PREVWCndpdGhvdXQgZnJlZWluZyB0aGUgYWxsb2NhdGVkIGJvYXJkaW5m
by4KCkJlY2F1c2Ugd2UgY2F0Y2ggLUVOT0RFViBoZXJlIGFuZCByZXR1cm4gMCwgdGhlIG92ZXJh
bGwgYnVzIHByb2JlIGNvbnRpbnVlcwphbmQgdWx0aW1hdGVseSBzdWNjZWVkcy4gVGhpcyBtZWFu
cyB0aGUgZGV2cmVzLWFsbG9jYXRlZCBtZW1vcnkgc3RheXMgdGllZAp0byB0aGUgbWFzdGVyIGRl
dmljZSwgbGVha2luZyBzaXplb2Yoc3RydWN0IGkyY19kZXZfYm9hcmRpbmZvKSBmb3IgZXZlcnkK
aWdub3JlZCBBQ1BJIGNoaWxkIG5vZGUuCgo+ICsKPiArCQlyZXR1cm4gcmV0Owo+ICsJfQo+ICsK
PiArCWFkciA9IGFjcGlfZGV2aWNlX2FkcihhZGV2KTsKClsgLi4uIF0KCi0tIApTYXNoaWtvIEFJ
IHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA2MTYwOTU0Mjku
Mzk0NzIwNS0xLWFraGlscmFqZWV2QG52aWRpYS5jb20/cGFydD0zCgotLSAKbGludXgtaTNjIG1h
aWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
