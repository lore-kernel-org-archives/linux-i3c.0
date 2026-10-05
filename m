Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07603CA5FFC
	for <linux-i3c@archiver.kernel.org>; Mon,  5 Oct 2026 15:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2kWAKZ/2HHXeuvqQWX9i8rly6k+olGYVzvkyBgTc6as=; b=00hmQKdEMi0K57
	mArCCvbsR9ieRusQbCRo5rEPP2fzY0Z31ksI1PPgkOmhH6PTHybpqdQ/TnrOw434ajmM+S5mNh+vn
	kCTbtN5mhBKRTE5qOUxKpet6EDRr2+UOrRmWQpn619q4Ba5JjqfKBFu2l+5JbR7JyQ9poQCcwCs/P
	qysNqm4dALK7r1zlBZXLXm4bq6A1Lygs9QQLd3PosjtXPkbOgAzaM7IkjEvYCyDtgyNbVf77x+DtO
	qOPaj8tIi6gpAmNOYf8gtZdoRVJ3xJl4vyfEbOPjgwUjrJjaJwMIG0mvyqdrIedycdBLOaxe6Mv1D
	clavcHZwqhyGgvcGGyMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDkyF-0000000GnV0-1lgs;
	Mon, 05 Oct 2026 15:51:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDkyD-0000000GnUt-3UUf
	for linux-i3c@lists.infradead.org;
	Mon, 05 Oct 2026 15:51:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2088A60534;
	Mon,  5 Oct 2026 15:51:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83BD71F000FF;
	Mon,  5 Oct 2026 15:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791215476;
	bh=x2lnOnUWOM4T5ecFvHiYCAvAPl9vtG9c9feEiy77cj8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Wzi3+kzPqucRDy6KTtGbphOu3cuRCh6QP5FfSc4FzmmObEaY/OKRs9qypL9iVdBPf
	 RNPOLYtxaMPMqVbQl+c1TFmpsl5dOE1FfIoCELeriwh8qh5LTXC4fOBdHit44fNs7j
	 9ddDu1mP2m+sdAUVgEykWCFAuejBTp1DveCAEo1a01UEgyGY2DeGRy5a/3zBQAWRpI
	 35QBL/M+ODz9FxbPt/EBKiFC7UI9T9nvIgbeEFFoTbzLtLqqf5/1gjgZ7k2Vhwe1fD
	 2WehHIpLLh9jPX4hooFwWJkr+NQLtF3r72R3smkckhRTHOl5ylXvB7E4LsA6UiedIL
	 YUUDIsCPdIesw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: i3c: dw: support up to two reset
 lines
To: "Jisheng Zhang" <jszhang@kernel.org>
Cc: Frank.Li@kernel.org, linux-i3c@lists.infradead.org, conor+dt@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261005152425.25319-2-jszhang@kernel.org>
References: <20261005152425.25319-1-jszhang@kernel.org>
 <20261005152425.25319-2-jszhang@kernel.org>
Date: Mon, 05 Oct 2026 15:51:16 +0000
Message-Id: <20261005155116.83BD71F000FF@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gZHQtYmluZGluZ3M6
IGkzYzogZHc6IG1heEl0ZW1zIG1pc21hdGNoIHdpdGggY29tbWl0IG1lc3NhZ2UKLSBbTG93XSBk
dC1iaW5kaW5nczogaTNjOiBkdzogbWlzc2luZyBpdGVtcy9yZXNldC1uYW1lcyBmb3IgbXVsdGlw
bGUgcmVzZXRzCi0tCgpjb21taXQgNmRhNzhiMDg4NjcyNzJkODNjMzZjMWMzMGNlNDNiYjM5ZDlh
YWY2ZApBdXRob3I6IEppc2hlbmcgWmhhbmcgPGpzemhhbmdAa2VybmVsLm9yZz4KCmR0LWJpbmRp
bmdzOiBpM2M6IGR3OiBzdXBwb3J0IHVwIHRvIHR3byByZXNldCBsaW5lcwoKVGhpcyBjb21taXQg
dXBkYXRlcyB0aGUgU3lub3BzeXMgRGVzaWduV2FyZSBJM0MgbWFzdGVyIGNvbnRyb2xsZXIgZGV2
aWNlIHRyZWUKYmluZGluZyB0byBzdXBwb3J0IG11bHRpcGxlIHJlc2V0IGxpbmVzLiBJdCBpbmNy
ZWFzZXMgdGhlIG1heEl0ZW1zIGZvciB0aGUKcmVzZXRzIHByb3BlcnR5IHRvIDIgYW5kIGFkZHMg
YSBjb25kaXRpb25hbCBibG9jayB0byBtYWludGFpbiB0aGUgcHJldmlvdXMKbGltaXQgZm9yIHRo
ZSBBZ2lsZXggNSB2YXJpYW50LgoKPiBUaGUgU3lub3BzeXMgRGVzaWduV2FyZSBJM0MgbWFzdGVy
IGNvbnRyb2xsZXIgY2FuIGhhdmUgbXVsdGlwbGUgcmVzZXQKPiBsaW5lcywgc3VjaCBhcyBjb3Jl
IHJlc2V0LCBhcGIgcmVzZXQsIGFuZCBkbWEgcmVzZXQuCj4gCj4gVXBkYXRlIHRoZSBEVCBiaW5k
aW5nIGRvY3VtZW50YXRpb24gdG8gaW5jcmVhc2UgbWF4SXRlbXMgZm9yIHRoZSByZXNldHMKPiBw
cm9wZXJ0eSB0byAyLgoKW1NldmVyaXR5OiBNZWRpdW1dClRoZSBjb21taXQgbWVzc2FnZSBleHBs
aWNpdGx5IGxpc3RzIHRocmVlIGRpc3RpbmN0IHJlc2V0IGxpbmVzIChjb3JlIHJlc2V0LAphcGIg
cmVzZXQsIGFuZCBkbWEgcmVzZXQpLiBEb2VzIGxpbWl0aW5nIHRoZSBwcm9wZXJ0eSB0byAyIGRp
cmVjdGx5CmNvbnRyYWRpY3QgdGhlIGhhcmR3YXJlIGNhcGFiaWxpdGllcyBkZXNjcmliZWQ/CgpB
IGhhcmR3YXJlIGNvbmZpZ3VyYXRpb24gd2lyZWQgd2l0aCBhbGwgdGhyZWUgcmVzZXRzIHdvdWxk
IGZhaWwgc2NoZW1hCnZhbGlkYXRpb24sIGFuZCB0aGUgZm9sbG93LXVwIHBhdGNoZXMgaW4gdGhl
IHNlcmllcyBkbyBub3QgYXBwZWFyIHRvIGZpeAp0aGlzIG1pc21hdGNoLgoKPiBkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kzYy9zbnBzLGR3LWkzYy1tYXN0
ZXIueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pM2Mvc25wcyxkdy1p
M2MtbWFzdGVyLnlhbWwKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
aTNjL3NucHMsZHctaTNjLW1hc3Rlci55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2kzYy9zbnBzLGR3LWkzYy1tYXN0ZXIueWFtbApbIC4uLiBdCj4gQEAgLTM5
LDcgKzQ5LDcgQEAgcHJvcGVydGllczoKPiAgICAgIG1heEl0ZW1zOiAxCj4gIAo+ICAgIHJlc2V0
czoKPiAtICAgIG1heEl0ZW1zOiAxCj4gKyAgICBtYXhJdGVtczogMgoKW1NldmVyaXR5OiBMb3dd
CldoZW4gYWxsb3dpbmcgbXVsdGlwbGUgaXRlbXMgaW4gYW4gYXJyYXksIGRvZXMgdGhlIHNjaGVt
YSBuZWVkIHRvIGRvY3VtZW50CnRoZSBleGFjdCBvcmRlciAodmlhIGFuIGl0ZW1zIGxpc3QpIG9y
IHJlcXVpcmUgcmVzZXQtbmFtZXM/CgpXaXRob3V0IGEgc3RyaWN0IGRvY3VtZW50ZWQgb3JkZXIg
b3IgcmVzZXQtbmFtZXMsIHRoZSBPUy1pbmRlcGVuZGVudCBBQkkKcmVtYWlucyBhbWJpZ3VvdXMu
IEFsdGhvdWdoIGEgZm9sbG93LXVwIHBhdGNoIGluIHRoaXMgc2VyaWVzIChjb21taXQgImkzYzoK
ZHc6IHN3aXRjaCB0byBhcnJheS1iYXNlZCBleGNsdXNpdmUgcmVzZXQgY29udHJvbCIpIHVwZGF0
ZXMgdGhlIExpbnV4IGRyaXZlcgp0byB1c2UgZGV2bV9yZXNldF9jb250cm9sX2FycmF5X2dldF9v
cHRpb25hbF9leGNsdXNpdmUgdG8gZmV0Y2ggYWxsIHJlc2V0cwpyZWdhcmRsZXNzIG9mIG9yZGVy
LCB0aGUgZGV2aWNlIHRyZWUgYmluZGluZyBpdHNlbGYgcmVtYWlucyBpbmNvbXBsZXRlLgoKT3Ro
ZXIgT1NlcyBvciBmdXR1cmUgZHJpdmVycyB0aGF0IG1heSBuZWVkIHRvIHRvZ2dsZSB0aGVzZSBk
aXN0aW5jdCByZXNldApsaW5lcyBzZXF1ZW50aWFsbHkgY3VycmVudGx5IGhhdmUgbm8gQUJJIHRv
IHJlbHkgb24uCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8j
L3BhdGNoc2V0LzIwMjYxMDA1MTUyNDI1LjI1MzE5LTEtanN6aGFuZ0BrZXJuZWwub3JnP3BhcnQ9
MQoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
