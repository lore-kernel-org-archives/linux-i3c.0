Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF374CD98E6
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Jun 2026 11:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sbKxCdf8FXBrvr5BtPNINpl9oVIvz7L9WBMsc57hqHw=; b=jC7Gyo+fqug8ap
	1TvL1N1vKJeN2q68kYtB0fflnsnyOgmJDP9OJy4BmGirdlwv/kBavyzUPd+g2FSFKdovXJHhld87o
	4lCcmGdX+t6Dh4fWE0T2kGdgRzchz2gbmZMHEK/fjME7qKHCs9M1Pjqu9vnvkl2fQcNF4C7GTb5wu
	fF6SCKpTGuOB1vcmc6elLKyrkEvO9ZXDburNY6Vh4XgHfPDKIZ5S8XiZZ9rFHvTAm9uLj3N5NR6Pg
	4EiUstq9DRakyW67jhwqyWmkf3rXAJA4Zq30/7qX36tAfTEMoX/xnLZcrqjs8ph6WZptjnlSBV6cv
	6TydzvwNB0cH5iEX2rCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZSKb-0000000FhNR-04QA;
	Tue, 16 Jun 2026 11:51:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZSKZ-0000000FhN2-22By
	for linux-i3c@lists.infradead.org;
	Tue, 16 Jun 2026 11:51:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7656260172;
	Tue, 16 Jun 2026 11:51:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE9731F000E9;
	Tue, 16 Jun 2026 11:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781610706;
	bh=pHFGqB5zOn/ISibXIQXh3nk2gNiEdPy4VVchTCKY6m8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z5BuoHnev7Nc3IA7e6NtPS5U5lcaGPmgvzaAcH+YYeG+4QCZ6aVpbeAzsx4dVW5qZ
	 WEYP8OiZWmQsdBfdNowmtgJbxaSxZ6sgs5s4RRSev/rYoq9IK861UBt00fsoCUBLrn
	 6wqTmk+gCkLncwtC0dzadBbmFL3JDO2TjCiwZdPUjnIhQHoVl/ByoxWT6mFpC/pC8h
	 5d/waNG7OXcEqCNxkxjNE+4AZ3OhYz0tCpr0I5M+PTA3QR8Mb2O0UBThnSEQIWt8u0
	 upWnHlQxykwQ5PrqGz72I55d9xVicqyGi8I3myfPlGYFhtpSSzaHLOxzsIug/SLkwU
	 bbRtdu/+RAYZQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] i3c: master: Update dev_nack_retry_count under
 maintenance lock
To: "Adrian Hunter" <adrian.hunter@intel.com>
Cc: linux-i3c@lists.infradead.org, Frank.Li@kernel.org
In-Reply-To: <20260616113752.196140-2-adrian.hunter@intel.com>
References: <20260616113752.196140-2-adrian.hunter@intel.com>
Date: Tue, 16 Jun 2026 11:51:45 +0000
Message-Id: <20260616115145.EE9731F000E9@smtp.kernel.org>
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
IFtIaWdoXSBQcmVleGlzdGluZyBVc2UtQWZ0ZXItRnJlZSAoVUFGKSBkdWUgdG8gZGV2cmVzIGZy
ZWVpbmcgdGhlIEkzQyBtYXN0ZXIgY29udHJvbGxlciB3aGlsZSBpdHMgZW1iZWRkZWQgYHN0cnVj
dCBkZXZpY2VgIGlzIHN0aWxsIHJlZmVyZW5jZWQuCi0tCgpjb21taXQgZDhkMmI0NTVkYzRiZDNk
NjcyMzExZmMxNDI1OGI0YTlkMGI4M2U4YgpBdXRob3I6IEFkcmlhbiBIdW50ZXIgPGFkcmlhbi5o
dW50ZXJAaW50ZWwuY29tPgpTdWJqZWN0OiBpM2M6IG1hc3RlcjogVXBkYXRlIGRldl9uYWNrX3Jl
dHJ5X2NvdW50IHVuZGVyIG1haW50ZW5hbmNlIGxvY2sKClRoaXMgY29tbWl0IHByb3RlY3RzIG1h
c3Rlci0+ZGV2X25hY2tfcmV0cnlfY291bnQgYWdhaW5zdCBjb25jdXJyZW50IHN5c2ZzCnVwZGF0
ZXMgYnkgdXBkYXRpbmcgaXQgd2hpbGUgaG9sZGluZyB0aGUgYnVzIG1haW50ZW5hbmNlIGxvY2su
IEl0IGFsc28KY29tYmluZXMgYWRqYWNlbnQgcmV0dXJuIHN0YXRlbWVudHMgYW5kIHVwZGF0ZXMg
dGhlIHJlYWQgcGF0aCB0byBob2xkIHRoZSBidXMKbm9ybWFsdXNlIGxvY2suCgo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIuYyBiL2RyaXZlcnMvaTNjL21hc3Rlci5jCj4gaW5kZXgg
MzcyZDkxMWVjYmFkYy4uMDVlYTllM2M0ZDQ2ZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2kzYy9t
YXN0ZXIuYwo+ICsrKyBiL2RyaXZlcnMvaTNjL21hc3Rlci5jCj4gQEAgLTc0NCw3ICs3NDQsMTQg
QEAgc3RhdGljIERFVklDRV9BVFRSX1JXKGhvdGpvaW4pOwo+ICBzdGF0aWMgc3NpemVfdCBkZXZf
bmFja19yZXRyeV9jb3VudF9zaG93KHN0cnVjdCBkZXZpY2UgKmRldiwKPiAgCQkJCQkgc3RydWN0
IGRldmljZV9hdHRyaWJ1dGUgKmF0dHIsIGNoYXIgKmJ1ZikKPiAgewo+IC0JcmV0dXJuIHN5c2Zz
X2VtaXQoYnVmLCAiJXVcbiIsIGRldl90b19pM2NtYXN0ZXIoZGV2KS0+ZGV2X25hY2tfcmV0cnlf
Y291bnQpOwo+ICsJc3RydWN0IGkzY19idXMgKmkzY2J1cyA9IGRldl90b19pM2NidXMoZGV2KTsK
PiArCXNzaXplX3QgcmV0Owo+ICsKPiArCWkzY19idXNfbm9ybWFsdXNlX2xvY2soaTNjYnVzKTsK
PiArCXJldCA9IHN5c2ZzX2VtaXQoYnVmLCAiJXVcbiIsIGRldl90b19pM2NtYXN0ZXIoZGV2KS0+
ZGV2X25hY2tfcmV0cnlfY291bnQpOwoKW1NldmVyaXR5OiBIaWdoXQpUaGlzIGlzbid0IGEgYnVn
IGludHJvZHVjZWQgYnkgdGhpcyBwYXRjaCwgYnV0IHNpbmNlIHdlIGFyZSBtb2RpZnlpbmcgc3lz
ZnMKYXR0cmlidXRlcyBoZXJlLCBpcyB0aGVyZSBhIHByZS1leGlzdGluZyB1c2UtYWZ0ZXItZnJl
ZSByaXNrIHJlbGF0ZWQgdG8gaG93CnRoZSBpM2NfbWFzdGVyX2NvbnRyb2xsZXIgaXMgYWxsb2Nh
dGVkIGFuZCBmcmVlZD8KCk1hbnkgSTNDIG1hc3RlciBkcml2ZXJzIChlLmcuLCBkdy1pM2MtbWFz
dGVyLmMpIGFsbG9jYXRlIHRoZWlyIGRyaXZlciBjb250ZXh0Cih3aGljaCBlbWJlZHMgc3RydWN0
IGkzY19tYXN0ZXJfY29udHJvbGxlcikgdXNpbmcgZGV2bV9remFsbG9jKCkuIER1cmluZwp1bmJp
bmQvcmVtb3ZhbCwgZGV2aWNlX3VucmVnaXN0ZXIoJm1hc3Rlci0+ZGV2KSBpcyBjYWxsZWQsIHdo
aWNoIGRyb3BzIHRoZQppbml0aWFsIHJlZmVyZW5jZS4gSWYgYSB1c2VyLXNwYWNlIHByb2Nlc3Mg
aG9sZHMgYSBzeXNmcyBmaWxlIG9wZW4gKGxpa2UgdGhpcwpkZXZfbmFja19yZXRyeV9jb3VudCBh
dHRyaWJ1dGUpLCBvciBpZiBhbiBhdHRhY2tlciBibG9ja3MgaW4gYSBzeXNmcyByZWFkIG9yCndy
aXRlIHVzaW5nIHVzZXJmYXVsdGZkLCB0aGUga29iamVjdCByZWZlcmVuY2UgY291bnQgcmVtYWlu
cyBlbGV2YXRlZC4KClRoZSBkcml2ZXIncyByZW1vdmUgZnVuY3Rpb24gdGhlbiByZXR1cm5zLCBh
bmQgdGhlIGRldnJlcyBmcmFtZXdvcmsKYXV0b21hdGljYWxseSBmcmVlcyB0aGUgZHJpdmVyIGNv
bnRleHQgbWVtb3J5LiBMYXRlciwgd2hlbiB0aGUgZmluYWwgcmVmZXJlbmNlCmlzIGRyb3BwZWQs
IHRoZSBkcml2ZXIgY29yZSBjYWxscyBpM2NfbWFzdGVyZGV2X3JlbGVhc2UoKToKCmRyaXZlcnMv
aTNjL21hc3Rlci5jOmkzY19tYXN0ZXJkZXZfcmVsZWFzZSgpIHsKICAgICAgICBzdHJ1Y3QgaTNj
X21hc3Rlcl9jb250cm9sbGVyICptYXN0ZXIgPSBkZXZfdG9faTNjbWFzdGVyKGRldik7CiAgICAg
ICAgc3RydWN0IGkzY19idXMgKmJ1cyA9IGRldl90b19pM2NidXMoZGV2KTsKCiAgICAgICAgaWYg
KG1hc3Rlci0+d3EpCiAgICAgICAgICAgICAgICBkZXN0cm95X3dvcmtxdWV1ZShtYXN0ZXItPndx
KTsKICAgICAgICAuLi4KfQoKV2lsbCB0aGlzIHJlc3VsdCBpbiBhIHVzZS1hZnRlci1mcmVlIHNp
bmNlIHRoZSByZWxlYXNlIGZ1bmN0aW9uIGFjY2Vzc2VzIHRoZQptYXN0ZXIgc3RydWN0IGFmdGVy
IGl0cyBtZW1vcnkgaGFzIGFscmVhZHkgYmVlbiBmcmVlZCBieSBkZXZyZXM/IFNob3VsZCB0aGUK
bWVtb3J5IGZvciBzdHJ1Y3R1cmVzIGVtYmVkZGluZyBhIHN0cnVjdCBkZXZpY2UgYmUgZnJlZWQg
d2l0aGluIHRoZSByZWxlYXNlCmZ1bmN0aW9uIGluc3RlYWQgb2YgYmVpbmcgdGllZCB0byB0aGUg
ZHJpdmVyIHVuYmluZCBsaWZlY3ljbGUgdmlhIGRldnJlcz8KCj4gKwlpM2NfYnVzX25vcm1hbHVz
ZV91bmxvY2soaTNjYnVzKTsKPiArCj4gKwlyZXR1cm4gcmV0Owo+ICB9CgotLSAKU2FzaGlrbyBB
SSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNjE2MTEzNzUy
LjE5NjE0MC0xLWFkcmlhbi5odW50ZXJAaW50ZWwuY29tP3BhcnQ9MQoKLS0gCmxpbnV4LWkzYyBt
YWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
