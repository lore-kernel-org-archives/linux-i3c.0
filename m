Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3928EC44515
	for <linux-i3c@archiver.kernel.org>; Mon, 20 Jul 2026 07:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dUt0tBTwU3S6Jr+2bc8NXfhwbw+ttflHH68AtMkkOvA=; b=X8UM6CWXT+k8mc
	v/fH+9ZuU99eNNddY/amWf25cBK11K59/gNtLYHaqmZU/ThIIGeMdsZJnikUa/ogZW6QSFldkSVJm
	qOcccpYACWuq7HT08jXbSdZ6lPyQnb+eClXJVHq8Hr74JqPybSH+wHXWO0hmzKqv2w2SlTmEPcSOf
	6ptCqfVrzlYhtlW+1iF1cK1k6JAtc5GgFfAv9LYEl43zZ6g+sELYM74kp5XITRCNgkwevKdKX273w
	dZHDfgGX9+gC38HKLSG41XSpyQKY1rQmiW1UvJt8rkJwUXdyXaSOW6WP0xzSITy/h9uLkue89SR2V
	jA2HpsCWPwN4ANWemD2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wligv-0000000688n-3sTR;
	Mon, 20 Jul 2026 07:45:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wligu-0000000688h-125j
	for linux-i3c@lists.infradead.org;
	Mon, 20 Jul 2026 07:45:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9658560103;
	Mon, 20 Jul 2026 07:45:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCC3B1F000E9;
	Mon, 20 Jul 2026 07:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784533531;
	bh=GoLnLkAa0zJ93vJ2+fU9G2aU/GZC8+94HfmZFqFh5os=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cI052l6zUMYzJD9JNUwnrgZ67cmqYka2Q9J/yn3Z9t3SJCb+6Q0XUV6ltIk9q3YOt
	 y2CFj9ImtMvmcPV069auTACrSjdPOlZnMJd8Irs5HhQV6eWkPVAF2fIhasdiKrEFF7
	 e6vb4x3OyWCl6HEwDhCft2IkhP0aKXkD7nmexRQv3IHrzlE08vI9dQ7H2QD2jYJ30n
	 TU6YeXxkbVjdgB7HCjlPsBrgS0xWq4WqTRIAI6REXqb/6OFM9rQNhMI1Kj8YvMLq2z
	 5pGWhNuZa86EIghlZAsjX8Z14qHFSzRHGveGDF/cGORfCs4rwwuQJktx2RoOhonOVh
	 XXuEbOo2n6Uvw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] i3c: master: dw: Drop redundant core reset name
To: "Shubham Patil" <shubhamsanjay.patil@amd.com>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, conor+dt@kernel.org, robh@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260720073510.1869623-3-shubhamsanjay.patil@amd.com>
References: <20260720073510.1869623-1-shubhamsanjay.patil@amd.com>
 <20260720073510.1869623-3-shubhamsanjay.patil@amd.com>
Date: Mon, 20 Jul 2026 07:45:30 +0000
Message-Id: <20260720074530.DCC3B1F000E9@smtp.kernel.org>
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
IFtNZWRpdW1dIE1pc3NpbmcgZGV2aWNlIHdha2V1cCBpbiB0aGUgcmVtb3ZlIHBhdGggY2F1c2Vz
IHVuYmFsYW5jZWQgZGV2cmVzIGNsZWFudXAgKGRvdWJsZSBjbG9jayBkaXNhYmxlIGFuZCBkb3Vi
bGUgcmVzZXQgYXNzZXJ0KSBpZiB0aGUgZGV2aWNlIGlzIGluIHJ1bnRpbWUgc3VzcGVuZC4KLS0K
Ci0tLSBQYXRjaCBbMl06IFtQQVRDSCB2MiAyLzJdIGkzYzogbWFzdGVyOiBkdzogRHJvcCByZWR1
bmRhbnQgY29yZSByZXNldCBuYW1lIC0tLQpjb21taXQgNmUwMjM0ODFmZTBhMzk4ODU0NGUyMTcz
NzA5YjlmOTk0ZWZlZTM5NApBdXRob3I6IFNodWJoYW0gUGF0aWwgPHNodWJoYW1zYW5qYXkucGF0
aWxAYW1kLmNvbT4KCmkzYzogbWFzdGVyOiBkdzogRHJvcCByZWR1bmRhbnQgY29yZSByZXNldCBu
YW1lCgpUaGUgRGVzaWduV2FyZSBJM0MgbWFzdGVyIGhhcyBhIHNpbmdsZSByZXNldCBsaW5lLCBz
byBhIGRlZGljYXRlZApyZXNldCBuYW1lIGlzIHJlZHVuZGFudC4gTG9vayB1cCB0aGUgcmVzZXQg
YnkgaW5kZXggYnkgcGFzc2luZyBOVUxMCmluc3RlYWQgb2YgdGhlICJjb3JlX3JzdCIgbmFtZS4K
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci9kdy1pM2MtbWFzdGVyLmMgYi9kcml2
ZXJzL2kzYy9tYXN0ZXIvZHctaTNjLW1hc3Rlci5jCj4gaW5kZXggMmY4YzBjNDY4M2UwNi4uNDg4
ZmI0NTVkM2NjOCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIvZHctaTNjLW1hc3Rl
ci5jCj4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyL2R3LWkzYy1tYXN0ZXIuYwo+IEBAIC0xNTg0
LDcgKzE1ODQsNyBAQCBpbnQgZHdfaTNjX2NvbW1vbl9wcm9iZShzdHJ1Y3QgZHdfaTNjX21hc3Rl
ciAqbWFzdGVyLAo+ICAJCXJldHVybiBQVFJfRVJSKG1hc3Rlci0+cGNsayk7Cj4gIAo+ICAJbWFz
dGVyLT5jb3JlX3JzdCA9IGRldm1fcmVzZXRfY29udHJvbF9nZXRfb3B0aW9uYWxfZXhjbHVzaXZl
X2RlYXNzZXJ0ZWQoJnBkZXYtPmRldiwKPiAtCQkJCQkJCQkJCSJjb3JlX3JzdCIpOwo+ICsJCQkJ
CQkJCQkJTlVMTCk7CgpbU2V2ZXJpdHk6IE1lZGl1bV0KVGhpcyBpcyBhIHByZS1leGlzdGluZyBp
c3N1ZSwgYnV0IHRvdWNoaW5nIHRoaXMgZGV2bSBhbGxvY2F0aW9uIHJhaXNlcyBhCnF1ZXN0aW9u
IGFib3V0IGhvdyBkZXZyZXMgY2xlYW5zIHVwIGR1cmluZyBkcml2ZXIgdW5iaW5kLgoKU2luY2Ug
ZGV2bV9yZXNldF9jb250cm9sX2dldF9vcHRpb25hbF9leGNsdXNpdmVfZGVhc3NlcnRlZCgpIGFu
ZCB0aGUgZWFybGllcgpkZXZtX2Nsa19nZXRfZW5hYmxlZCgpIHJlZ2lzdGVyIGRldnJlcyBhY3Rp
b25zIHRvIGFzc2VydCByZXNldHMgYW5kIGRpc2FibGUKY2xvY2tzLCBkb2VzIGR3X2kzY19jb21t
b25fcmVtb3ZlKCkgbmVlZCB0byB3YWtlIHRoZSBkZXZpY2UgYmVmb3JlIHRlYXJkb3duPwoKSWYg
dGhlIGRldmljZSBpcyBydW50aW1lIHN1c3BlbmRlZCBkdXJpbmcgZHJpdmVyIHVuYmluZCwKZHdf
aTNjX21hc3Rlcl9ydW50aW1lX3N1c3BlbmQoKSBoYXMgYWxyZWFkeSBkaXNhYmxlZCBjbG9ja3Mg
YW5kIGFzc2VydGVkIHRoZQpyZXNldC4gQmVjYXVzZSBkd19pM2NfY29tbW9uX3JlbW92ZSgpIGRv
ZXMgbm90IGNhbGwgcG1fcnVudGltZV9nZXRfc3luYygpIHRvCnJlc3VtZSB0aGUgZGV2aWNlOgoK
dm9pZCBkd19pM2NfY29tbW9uX3JlbW92ZShzdHJ1Y3QgZHdfaTNjX21hc3RlciAqbWFzdGVyKQp7
CglpM2NfbWFzdGVyX3VucmVnaXN0ZXIoJm1hc3Rlci0+YmFzZSk7CgoJLyogQmFsYW5jZSBwbV9y
dW50aW1lX2dldF9ub3Jlc3VtZSgpIGZyb20gcHJvYmUoKSAqLwoJaWYgKG1hc3Rlci0+cXVpcmtz
ICYgRFdfSTNDX0RJU0FCTEVfUlVOVElNRV9QTV9RVUlSSykKCQlwbV9ydW50aW1lX3B1dF9ub2lk
bGUobWFzdGVyLT5kZXYpOwoKCXBtX3J1bnRpbWVfZGlzYWJsZShtYXN0ZXItPmRldik7CglwbV9y
dW50aW1lX3NldF9zdXNwZW5kZWQobWFzdGVyLT5kZXYpOwoJcG1fcnVudGltZV9kb250X3VzZV9h
dXRvc3VzcGVuZChtYXN0ZXItPmRldik7Cn0KClRoZSBhdXRvbWF0aWMgZGV2cmVzIGNsZWFudXAg
d2lsbCBhdHRlbXB0IHRvIGRpc2FibGUgYWxyZWFkeS1kaXNhYmxlZCBjbG9ja3MKYW5kIGFzc2Vy
dCBhbiBhbHJlYWR5LWFzc2VydGVkIHJlc2V0LCB3aGljaCBjb3VsZCB0cmlnZ2VyIGEgbm9pc3kg
V0FSTiBmcm9tCnRoZSBDb21tb24gQ2xvY2sgRnJhbWV3b3JrLgoKQ291bGQgdGhpcyBkb3VibGUt
Y2xlYW51cCBiZSBhdm9pZGVkIGJ5IHJlc3VtaW5nIHRoZSBkZXZpY2UgYmVmb3JlIGRpc2FibGlu
ZwpydW50aW1lIFBNIGluIGR3X2kzY19jb21tb25fcmVtb3ZlKCk/Cgo+ICAJaWYgKElTX0VSUiht
YXN0ZXItPmNvcmVfcnN0KSkKPiAgCQlyZXR1cm4gUFRSX0VSUihtYXN0ZXItPmNvcmVfcnN0KTsK
PgoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNl
dC8yMDI2MDcyMDA3MzUxMC4xODY5NjIzLTEtc2h1YmhhbXNhbmpheS5wYXRpbEBhbWQuY29tP3Bh
cnQ9MgoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1p
M2MK
