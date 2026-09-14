Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE9EC88E50
	for <linux-i3c@archiver.kernel.org>; Mon, 14 Sep 2026 11:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=54pAwDeu384/gP1RNPRQZu9Y7Zxq9bVdUF4L4xUprvc=; b=Vwux0kEEQxKbNK
	b6uXUIiEtP7EQs+AncJNUHNHCfQ6D7nksx2UPQLSmLBNwQ62I+axgsdHa2G6ijbcST120tu2AvmQQ
	8p5qhR+KS/NrDgbJ/u7KGhlR0D3usI4gm/omoncFs0pU0BX7qD2DBWft5UhC/vBxOBqAup+5MXF2/
	zDL7Ek37MpnRONFsLUxEGdua4qaqCbkKC7244zQhEOscybBSZwj9yvP+kjT3Ci7glHRFVtENXH8sK
	qzPxbjApZk/fTobpEzghReQfy05vWUYnuNWsG5a6BY6lMbXWJWqMLjaKNFMitblOg0C92+CG7k9sx
	BfCRu+5BNOq+0alLglgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65CW-00000003Nq1-0UEa;
	Mon, 14 Sep 2026 11:50:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65CU-00000003Nps-2z2Y
	for linux-i3c@lists.infradead.org;
	Mon, 14 Sep 2026 11:50:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 78606404EF;
	Mon, 14 Sep 2026 11:50:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 199381F000FF;
	Mon, 14 Sep 2026 11:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789386618;
	bh=9THuH7YhLFcZM4besC823ug007e21M1wXviFNajMNgU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T5KxgoMU6xXYnsdkDtJhWLyxkya7qR4yoHsd1oWKMocJ/M8F9hHX1KRZJvNt/y6Q4
	 Y/nP9jTNYQ/5bXrxa6Oduxqg3Bez5+IP5/cNNAKynO6LxPDStL1UdCbwZfXq8MKUbP
	 krVLj0evRwuirIh+kQoL06DAEmeSLOjA9t9vbk1FfdE2O1rOD73LltcxfuFNZf4QEW
	 ZD1yg4r7yPTW3VGc4xxQ/GQJrKRwjyh+Fu5toWaHgbXIxxU/Npwm5L3p/+jUSzmbD/
	 j1A+SVD8kLAOGl1HsReoezxTtot7CmSYCRNccrJF4293PT2yIyt2h4CS8qKvh9OJyO
	 tShazn0qn7vSQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 04/17] i3c: master: Match ACPI targets to the correct
 bus controller instance
To: "Adrian Hunter" <adrian.hunter@intel.com>
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, Frank.Li@kernel.org, linux-i3c@lists.infradead.org
In-Reply-To: <20260914113003.183150-5-adrian.hunter@intel.com>
References: <20260914113003.183150-1-adrian.hunter@intel.com>
 <20260914113003.183150-5-adrian.hunter@intel.com>
Date: Mon, 14 Sep 2026 11:50:17 +0000
Message-Id: <20260914115018.199381F000FF@smtp.kernel.org>
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
IFtIaWdoXSBBQ1BJLWVudW1lcmF0ZWQgSTJDIHRhcmdldHMgbGFjayBtdWx0aS1pbnN0YW5jZSBm
aWx0ZXJpbmcsIGNhdXNpbmcgdGhlbSB0byBiZSBpbmNvcnJlY3RseSByZWdpc3RlcmVkIG9uIGV2
ZXJ5IGNvbnRyb2xsZXIgaW5zdGFuY2UuCi0tCgpjb21taXQgNTRlYWRmZWVhMzgxYWFiMGQ0OWUy
MWY5YmViOWQ2OTIxMDc4ZDgzZgpBdXRob3I6IEFkcmlhbiBIdW50ZXIgPGFkcmlhbi5odW50ZXJA
aW50ZWwuY29tPgoKaTNjOiBtYXN0ZXI6IE1hdGNoIEFDUEkgdGFyZ2V0cyB0byB0aGUgY29ycmVj
dCBidXMgY29udHJvbGxlciBpbnN0YW5jZQoKVGhpcyBjb21taXQgYWRkcyBhbiBpbnN0YW5jZSBu
dW1iZXIgdG8gdGhlIEkzQyBtYXN0ZXIgY29udHJvbGxlciB0byBtYXRjaApBQ1BJIHRhcmdldHMg
dG8gdGhlIGNvcnJlY3QgbXVsdGktYnVzIGNvbnRyb2xsZXIgaW5zdGFuY2UuIEl0IGV4dHJhY3Rz
IHRoZQppbnN0YW5jZSBudW1iZXIgZnJvbSB0aGUgX0FEUiB2YWx1ZSB0byBwcm9wZXJseSBmaWx0
ZXIgSTNDIGNoaWxkIG5vZGVzIGFuZAphbGxvd3Mgc2Vjb25kYXJ5IGNvbnRyb2xsZXIgaW5zdGFu
Y2VzIHRvIHN1Y2Nlc3NmdWxseSBwcm9iZS4KCj4gICAgIEFDUEktZW51bWVyYXRlZCBJMkMgZGV2
aWNlcyBhcmUgdW5hZmZlY3RlZC4gVGhlaXIgY29udHJvbGxlciBpbnN0YW5jZSBpcwo+ICAgICBl
bmNvZGVkIGluIHRoZSBSZXNvdXJjZSBTb3VyY2UgSW5kZXggb2YgdGhlIEkyY1NlcmlhbEJ1c1Yy
IGRlc2NyaXB0b3IKPiAgICAgcmF0aGVyIHRoYW4gaW4gX0FEUiBhbmQgd2lsbCByZXF1aXJlIHNl
cGFyYXRlIGhhbmRsaW5nLgo+IAo+ICAgICBGaXhlczogYjQ2YTRiM2M1ZDFlICgiaTNjOiBtYXN0
ZXI6IFN1cHBvcnQgQUNQSSBlbnVtZXJhdGlvbiBvZiBjaGlsZCBkZXZpY2VzIikKPiAgICAgU2ln
bmVkLW9mZi1ieTogQWRyaWFuIEh1bnRlciA8YWRyaWFuLmh1bnRlckBpbnRlbC5jb20+Cj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci5jIGIvZHJpdmVycy9pM2MvbWFzdGVyLmMK
PiBpbmRleCBmOWE2Yzg1NjBmYWJmLi4yMTVhMjJmMmM3YjYxIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvaTNjL21hc3Rlci5jCj4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyLmMKWyAuLi4gXQo+IEBA
IC0zMTAwLDkgKzMxMDksMTUgQEAgc3RhdGljIGludCBpM2NfbWFzdGVyX2FkZF9hY3BpX2Rldihz
dHJ1Y3QgaTNjX21hc3Rlcl9jb250cm9sbGVyICptYXN0ZXIsCj4gIAo+ICAJYWRyID0gYWNwaV9k
ZXZpY2VfYWRyKGFkZXYpOwo+ICAKPiArCS8qIE1hdGNoIHRoZSBtdWx0aS1idXMgaW5zdGFuY2Ug
bnVtYmVyICovCj4gKwlpZiAoRklFTERfR0VUKEkzQ19BQ1BJX0FEUl9JTlNUQU5DRSwgYWRyKSAh
PSBtYXN0ZXItPmluc3RhbmNlKQo+ICsJCXJldHVybiAwOwo+ICsKPiAgCS8qIEZvciBJM0MgZGV2
aWNlcywgX0FEUiB3aWxsIGhhdmUgdGhlIDQ4IGJpdCBQSUQgb2YgdGhlIGRldmljZSAgKi8KPiAt
CXJlZ1sxXSA9IHVwcGVyXzMyX2JpdHMoYWRyKTsKPiAtCXJlZ1syXSA9IGxvd2VyXzMyX2JpdHMo
YWRyKTsKCltTZXZlcml0eTogSGlnaF0KVGhpcyBpcyBhIHByZS1leGlzdGluZyBpc3N1ZSwgYnV0
IGlzIGl0IGFjY3VyYXRlIHRvIHNheSBJMkMgZGV2aWNlcyBhcmUKdW5hZmZlY3RlZCBpbiB0aGUg
Y29tbWl0IG1lc3NhZ2U/CgpMb29raW5nIGF0IGkzY19tYXN0ZXJfYWRkX2FjcGlfZGV2KCksIEky
QyBkZXZpY2VzIHJldHVybiBlYXJseSBiZWZvcmUgcmVhY2hpbmcKdGhpcyBuZXcgaW5zdGFuY2Ug
ZmlsdGVyaW5nOgoKCWlmICghYWNwaV9oYXNfbWV0aG9kKGFkZXYtPmhhbmRsZSwgIl9BRFIiKSkg
ewoJCXJldCA9IGkzY19tYXN0ZXJfYWRkX2kyY19ib2FyZGluZm8obWFzdGVyLCBmd25vZGUsIHJl
Zyk7CgkJaWYgKHJldCA9PSAtRU5PREVWKQoJCQlyZXR1cm4gMDsKCgkJcmV0dXJuIHJldDsKCX0K
CkJlY2F1c2UgdGhpcyBwYXRjaCBlbmFibGVzIHNlY29uZGFyeSBjb250cm9sbGVyIGluc3RhbmNl
cyB0byBzdWNjZXNzZnVsbHkKcHJvYmUgYnkgZml4aW5nIHRoZSBJM0MgX0FEUiBjaGVjaywgd29u
J3QgdGhlc2Ugc2Vjb25kYXJ5IGluc3RhbmNlcyBub3cKcmVnaXN0ZXIgYWxsIEkyQyB0YXJnZXRz
IGZvdW5kIGluIHRoZSBzaGFyZWQgQUNQSSBwYXJlbnQgbm9kZT8KCkNvdWxkIHRoaXMgY2F1c2Ug
cGhhbnRvbSBJMkMgZGV2aWNlcyB0byBiZSByZWdpc3RlcmVkIG9uIHRoZSB3cm9uZyBwaHlzaWNh
bApidXMgY29udHJvbGxlcnMsIGxlYWRpbmcgdGhlIEkyQyBzdWJzeXN0ZW0gdG8gYmluZCBkcml2
ZXJzIHRvIG5vbmV4aXN0ZW50CmhhcmR3YXJlPwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0
dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDkxNDExMzAwMy4xODMxNTAtMS1hZHJp
YW4uaHVudGVyQGludGVsLmNvbT9wYXJ0PTQKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0Cmxp
bnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
