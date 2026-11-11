Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C58606A324
	for <linux-i3c@archiver.kernel.org>; Wed, 11 Nov 2026 04:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=w3M0NBc1;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VaQ/csBG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oic4/knzkYquf4j0jJirUVyRgBuZrcrGy39mJlICskc=; b=w3M0NBc1adCgYUucYKzA4aGN9T
	qpV0bZ5+DuTN+Pra4Y18EDBef5oOqlBoEyW1ZJZQTFUj226q9Qt0dnxtGfVSqy3H6olnqL7sYvdIK
	eeUBIVZf0MDCtntHqaEp8d8WvdLd0F59PumgAvFe1ifHVl+lmbrzuYqC/afA3eBsLlkdaumu0GjU3
	nT/5wcRyVJYoJ5s7vP0RFpstzYvEzTaOAB6//+nEeBhBv7peZsl3mneqfwq9l93b/+bV6MZiwvnun
	A5VJtqxutwLYeun1cybuklpSv5djzsFIEZlLrrY6IkE9oXnKI8SC3GDOWifCTjnKiIkBhB83ziMB4
	QZIz1FMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR03T-00000005cjr-3eTc;
	Wed, 11 Nov 2026 04:35:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR03R-00000005cjk-3aon
	for linux-i3c@lists.infradead.org;
	Wed, 11 Nov 2026 04:35:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DF0D5612A1;
	Wed, 11 Nov 2026 04:35:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 382061F0093C;
	Wed, 11 Nov 2026 04:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794371724;
	bh=1XLRYG1y/hi0Gq8iGe1P6YMeKpym6owbaGYvlkX+KAs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VaQ/csBGT6vRG4dGzwECsN/6IeCyTNx3gl+7CZPnM3yZopXNzmYwWfV7HVKc/90+L
	 SYdecDdUzC+f4nMAkOO7EK/XlmAWL8qg0vDNvMrEd8MMmCEGERjlEWe4LeG+6V9HFO
	 LtaBK5Bjv2AOZu2zCHbVLpbK02ap0MA5PY9XYinVzDojezpDv/eN6A8PTLyiwTFhh4
	 jaTcVlx38uGtRTXOGKXayQunrFLPZUaIlqHyJX9BzHCRZI8fgzaaPuS6dzDNZRmupO
	 5IZf9BP7fTNht7KZ3LSMHRux9RwS29MMVT9vUQVph1ac6HSh85VTjPSNaX1p96tBnm
	 3ZezazG2WHrkA==
Message-ID: <sashiko-outbox-208299@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 7/9] i3c: mipi-i3c-hci: Program AST2700 IBI
 termination threshold
To: "Billy Tsai" <billy_tsai@aspeedtech.com>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20261111-b4-i3c-hci-ast2700-v2-7-4d8fff5c5196@aspeedtech.com>
References: <20261111-b4-i3c-hci-ast2700-v2-0-4d8fff5c5196@aspeedtech.com>
 <20261111-b4-i3c-hci-ast2700-v2-7-4d8fff5c5196@aspeedtech.com>
Date: Wed, 11 Nov 2026 04:35:23 +0000
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gaTNjOiBtaXBpLWkzYy1o
Y2k6IGxvc3QgSUJJIHRocmVzaG9sZCBpbgogIGkzY19oY2lfZG9fcmVzZXRfYW5kX3Jlc3RvcmUo
KQotLQoKY29tbWl0IDhlMTU4YzI0ZmFhNjU5MTFhZmI1ZDJkYzExNTEyNGZhNjljNWM0ZjcKQXV0
aG9yOiBCaWxseSBUc2FpIDxiaWxseV90c2FpQGFzcGVlZHRlY2guY29tPgoKaTNjOiBtaXBpLWkz
Yy1oY2k6IFByb2dyYW0gQVNUMjcwMCBJQkkgdGVybWluYXRpb24gdGhyZXNob2xkCgpUaGlzIGNv
bW1pdCBhZGRzIEhDSV9RVUlSS19JQklfUEFZTE9BRF9USExEIGFuZCBwcm9ncmFtcyB0aGUgQVNU
MjcwMApBU1BFRURfSTNDX01TVF9NUkwgcmVnaXN0ZXIgdG8gZ3JvdyBhbmQgZW5hYmxlIHRoZSBJ
QkkgcGF5bG9hZAp0ZXJtaW5hdGlvbiB0aHJlc2hvbGQgd2hlbiBwYXlsb2FkIElCSXMgYXJlIHJl
cXVlc3RlZC4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci9taXBpLWkzYy1oY2kv
YXNwZWVkLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNpL2FzcGVlZC5jCj4gaW5k
ZXggM2FhOTEwZTc4NmY4ZS4uNGE3M2UwMTgwYTEwOCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2kz
Yy9tYXN0ZXIvbWlwaS1pM2MtaGNpL2FzcGVlZC5jCj4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVy
L21pcGktaTNjLWhjaS9hc3BlZWQuYwo+IEBAIC0xMzYsNiArMTM2LDI2IEBAIHZvaWQgYXNwZWVk
X2kzY193cml0ZShzdHJ1Y3QgaTNjX2hjaSAqaGNpLCB1MzIgcmVnLCB1MzIgdmFsKQo+ICAJd3Jp
dGVsKHZhbCwgdG9fYXNwZWVkX3ZlbmRvcl9kYXRhKGhjaSktPmluaG91c2VfcmVncyArIHJlZyk7
Cj4gIH0KPiAgCj4gK3ZvaWQgYXNwZWVkX2kzY19pYmlfZ3Jvd190aHJlc2hvbGQoc3RydWN0IGkz
Y19oY2kgKmhjaSwgdW5zaWduZWQgaW50IGliaV9tYXhfbGVuKQo+ICt7Cj4gKwl1MzIgbXJsLCBj
dXJfbGVuOwo+ICsKPiArCS8qCj4gKwkgKiBUaGUgdGVybWluYXRpb24gdGhyZXNob2xkIGlzIGNv
bnRyb2xsZXItd2lkZSB3aGlsZSBJQkkgcmVxdWVzdHMKPiArCSAqIGZvciBkaWZmZXJlbnQgZGV2
aWNlcyBjYW4gcnVuIGluIHBhcmFsbGVsLCBzbyBzZXJpYWxpemUgdGhlCj4gKwkgKiByZWFkLW1v
ZGlmeS13cml0ZS4KPiArCSAqLwo+ICsJZ3VhcmQoc3BpbmxvY2tfaXJxc2F2ZSkoJmhjaS0+bG9j
ayk7Cj4gKwo+ICsJbXJsID0gYXNwZWVkX2kzY19yZWFkKGhjaSwgQVNQRUVEX0kzQ19NU1RfTVJM
KTsKPiArCWN1cl9sZW4gPSBGSUVMRF9HRVQoQVNQRUVEX0kzQ19JQklfVEVSTUlOQVRFX0xFTiwg
bXJsKTsKPiArCj4gKwlpYmlfbWF4X2xlbiA9IG1heChpYmlfbWF4X2xlbiwgY3VyX2xlbik7Cj4g
Kwlhc3BlZWRfaTNjX3dyaXRlKGhjaSwgQVNQRUVEX0kzQ19NU1RfTVJMLAo+ICsJCQkgQVNQRUVE
X0kzQ19JQklfVEVSTUlOQVRFX0VOIHwKPiArCQkJIEZJRUxEX1BSRVAoQVNQRUVEX0kzQ19JQklf
VEVSTUlOQVRFX0xFTiwgaWJpX21heF9sZW4pKTsKPiArfQoKW1NldmVyaXR5OiBNZWRpdW1dCkRv
ZXMgaTNjX2hjaV9kb19yZXNldF9hbmRfcmVzdG9yZSgpIGxvc2UgdGhlIEFTUEVFRF9JM0NfTVNU
X01STCB0aHJlc2hvbGQKd2hlbiBETUEgcmVjb3ZlcnkgcmVzZXRzIHRoZSBjb250cm9sbGVyPwoK
V2hlbiBoY2lfZG1hX3JlY292ZXJ5KCkgLT4gaTNjX2hjaV9yZXNldF9hbmRfcmVzdG9yZSgpIC0+
CmkzY19oY2lfZG9fcmVzZXRfYW5kX3Jlc3RvcmUoKSBydW5zLCBpdCByZXByb2dyYW1zIHRoZSBp
bi1ob3VzZQpBU1BFRURfSTNDX0NUUkwgYW5kIGludGVycnVwdCByZWdpc3RlcnMgYW5kIHJlc3Rv
cmVzIHRoZSBEQVQgZW50cmllcwooaW5jbHVkaW5nIERBVF8wX0lCSV9QQVlMT0FEKSwgYnV0IG5v
dGhpbmcgY2FjaGVzIG9yIHJlc3RvcmVzCkFTUEVFRF9JM0NfTVNUX01STDoKCmRyaXZlcnMvaTNj
L21hc3Rlci9taXBpLWkzYy1oY2kvY29yZS5jOmkzY19oY2lfZG9fcmVzZXRfYW5kX3Jlc3RvcmUo
KSB7CglyZXQgPSBpM2NfaGNpX3Jlc2V0X2FuZF9pbml0KGhjaSk7CglpZiAocmV0KQoJCXJldHVy
biAtRUlPOwoKCWlmIChoY2ktPnF1aXJrcyAmIEhDSV9RVUlSS19WRU5ET1JfQlVTX1NFVFVQKQoJ
CWFzcGVlZF9pM2NfYnVzX3NldHVwKGhjaSk7CgkuLi4KCW1pcGlfaTNjX2hjaV9kYXRfdjEucmVz
dG9yZShoY2kpOwoKSWYgdGhlIHJlc2V0IGNsZWFycyB0aGUgaW4taG91c2UgcmVnaXN0ZXJzLCBw
YXlsb2FkIElCSSB0ZXJtaW5hdGlvbiBpcyBsZWZ0CmRpc2FibGVkIGZvciBhbHJlYWR5LXJlZ2lz
dGVyZWQgZGV2aWNlcywgYW5kIGEgbGF0ZXIgaTNjX2hjaV9yZXF1ZXN0X2liaSgpCndpdGggYSBz
bWFsbGVyIG1heF9wYXlsb2FkX2xlbiB3aWxsIHJlYWQgY3VyX2xlbiA9PSAwIGZyb20gaGFyZHdh
cmUgYW5kCnByb2dyYW0gYSB0aHJlc2hvbGQgc21hbGxlciB0aGFuIHdoYXQgb3RoZXIgZGV2aWNl
cyByZXF1ZXN0ZWQuICBDYWNoaW5nIHRoZQpncm93biB0aHJlc2hvbGQgaW4gc3RydWN0IGFzcGVl
ZF9pM2NfdmVuZG9yX2RhdGEgYW5kIHJlc3RvcmluZwpBU1BFRURfSTNDX01TVF9NUkwgZHVyaW5n
IHJlc2V0IHJlY292ZXJ5IHdvdWxkIHByZXNlcnZlIGl0LgoKLS0gClNhc2hpa28gQUkgcmV2aWV3
IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MTExMS1iNC1pM2MtaGNpLWFz
dDI3MDAtdjItMC00ZDhmZmY1YzUxOTZAYXNwZWVkdGVjaC5jb20/cGFydD03CgotLSAKbGludXgt
aTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
