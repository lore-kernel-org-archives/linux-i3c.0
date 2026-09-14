Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE7FC88E64
	for <linux-i3c@archiver.kernel.org>; Mon, 14 Sep 2026 11:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EX8LNQB41V4OL/MA/X5TSa9F40S1FR2LgDCLUiduJE0=; b=1q6UrhmCRU+wGW
	DaQwceWxf6qice6FrUalpXO4RZyI+VyzrPXcu8P/wpSNOF2MAzIkrC68d78rI1yCKEXTlT3eb67kh
	wP3SRVIu03hbBm9E1PMDh/oWqcSGUABse97fSI/IkNtB5r3eDbs6CFxf56QtqQCy7QWBnb0b6DBHK
	U60+ff0basCk08Wojff38FQUDdKag0DLZAeAcKE+uHPyKtCUHFyme+ag4I0bjD6KNlsX8d0VS3eFY
	3/RGj1vovIU5wfOqp5/gFul6U//yOncRtKlQSxLGXbR38LvRmXvR09Uz/2cAM8fVT2m71Q/33yg0u
	Et/YJzRVnr5/tnY9Dr2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6597-00000003N6O-0OVE;
	Mon, 14 Sep 2026 11:46:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6595-00000003N67-0388
	for linux-i3c@lists.infradead.org;
	Mon, 14 Sep 2026 11:46:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2A68D60142;
	Mon, 14 Sep 2026 11:46:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 935271F000FF;
	Mon, 14 Sep 2026 11:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789386405;
	bh=xuGomPLfebm/CScbFgBU1A8GLqKTro31J0ZHvVrxeqE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lQAt0EEDeTfINuumswgfuog4HU/Fh6q1qWeGwn/IOPTf0VYnWZ9aiPZ5iGmHOS/9N
	 lkg0X9GUnPYRbS10okGJrnfddub9nY6zfUUpzv/nVaxqPBdrMGD2r9IIs5CauW63vq
	 6t/taYFg5Sl74z6zzkoGfVm+Kyas15KeQUucftUKj/6S6raWuyc2wuXPb4G6MQPADE
	 +A/gJM2pUNktmDFFqOUaPaGerMspGbn6eBys99C+k9n/t33aT4tLJNoOcsMfZa8pP3
	 swsKF6CYo8eJORhyKr0rq13rEkBSLkUGguozVUybisvdpiTBIedC9aqykLSvYqLXhu
	 geph7ItAxEhJg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 06/17] i3c: mipi-i3c-hci: Fix i3c_hci_enable_ibi() error
 path
To: "Adrian Hunter" <adrian.hunter@intel.com>
Cc: Frank.Li@kernel.org, linux-i3c@lists.infradead.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260914113003.183150-7-adrian.hunter@intel.com>
References: <20260914113003.183150-1-adrian.hunter@intel.com>
 <20260914113003.183150-7-adrian.hunter@intel.com>
Date: Mon, 14 Sep 2026 11:46:45 +0000
Message-Id: <20260914114645.935271F000FF@smtp.kernel.org>
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
IFtIaWdoXSBPbiB2MiBoYXJkd2FyZSAoQ01EX1NJWkU9MSBtb2RlKSwgZW5hYmxpbmcsIGRpc2Fi
bGluZywgb3IgcmVxdWVzdGluZyBJbi1CYW5kIEludGVycnVwdHMgdHJpZ2dlcnMgYSBOVUxMIHBv
aW50ZXIgZGVyZWZlcmVuY2UgYmVjYXVzZSB0aGUgZHJpdmVyIHVuY29uZGl0aW9uYWxseSBpbnZv
a2VzIHYxIERldmljZSBBZGRyZXNzIFRhYmxlIChEQVQpIG1ldGhvZHMgd2hpY2ggYXJlIG5vdCBp
bml0aWFsaXplZCBmb3IgdjIgaGFyZHdhcmUuCi0tCgpjb21taXQgMDg4YTAzOGMyOThiNTVhMDhi
MjZkYTlkYjcxNjI3NDY2NDQwMGM3MwpBdXRob3I6IEFkcmlhbiBIdW50ZXIgPGFkcmlhbi5odW50
ZXJAaW50ZWwuY29tPgoKaTNjOiBtaXBpLWkzYy1oY2k6IEZpeCBpM2NfaGNpX2VuYWJsZV9pYmko
KSBlcnJvciBwYXRoCgppM2NfaGNpX2VuYWJsZV9pYmkoKSBwZXJmb3JtcyBjb250cm9sbGVyLXNp
ZGUgc2V0dXAgYmVmb3JlIHNlbmRpbmcgdGhlCkVORUMgQ0NDIHRvIGVuYWJsZSBJQklzIG9uIHRo
ZSB0YXJnZXQuIElmIHRoZSBFTkVDIENDQyBmYWlscywgdGhlCmZ1bmN0aW9uIHJldHVybnMgYW4g
ZXJyb3IgYnV0IGxlYXZlcyB0aGUgY29udHJvbGxlciBjb25maWd1cmVkIGFzIGlmIElCSQplbmFi
bGluZyBoYWQgc3VjY2VlZGVkLiBUaGlzIHBhdGNoIGZpeGVzIHRoZSBlcnJvciBwYXRoIGJ5IHVu
ZG9pbmcgdGhlCnNldHVwLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyL21pcGkt
aTNjLWhjaS9jb3JlLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNpL2NvcmUuYwo+
IGluZGV4IDhiM2E4N2Q4YThiYjAuLjE2NmQ5ZjcwZjQzNTggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9jb3JlLmMKPiArKysgYi9kcml2ZXJzL2kzYy9tYXN0
ZXIvbWlwaS1pM2MtaGNpL2NvcmUuYwo+IEBAIC03MDMsMTEgKzcwMywxNSBAQCBzdGF0aWMgaW50
IGkzY19oY2lfZW5hYmxlX2liaShzdHJ1Y3QgaTNjX2Rldl9kZXNjICpkZXYpCj4gIAlzdHJ1Y3Qg
aTNjX21hc3Rlcl9jb250cm9sbGVyICptID0gaTNjX2Rldl9nZXRfbWFzdGVyKGRldik7Cj4gIAlz
dHJ1Y3QgaTNjX2hjaSAqaGNpID0gdG9faTNjX2hjaShtKTsKPiAgCXN0cnVjdCBpM2NfaGNpX2Rl
dl9kYXRhICpkZXZfZGF0YSA9IGkzY19kZXZfZ2V0X21hc3Rlcl9kYXRhKGRldik7Cj4gKwlpbnQg
cmV0Owo+ICAKPiAgCW1pcGlfaTNjX2hjaV9kYXRfdjEuY2xlYXJfZmxhZ3MoaGNpLCBkZXZfZGF0
YS0+ZGF0X2lkeCwgREFUXzBfU0lSX1JFSkVDVCwgMCk7CgpbU2V2ZXJpdHk6IEhpZ2hdClRoaXMg
aXNuJ3QgYSBidWcgaW50cm9kdWNlZCBieSB0aGlzIHBhdGNoLCBidXQgZG9lcyB0aGlzIGNvZGUg
Y2F1c2UgYSBOVUxMCnBvaW50ZXIgZGVyZWZlcmVuY2Ugb24gdjIgaGFyZHdhcmUgKENNRF9TSVpF
PTEgbW9kZSk/CgpJdCBhcHBlYXJzIG1pcGlfaTNjX2hjaV9kYXRfdjEuY2xlYXJfZmxhZ3MoKSBp
cyBjYWxsZWQgdW5jb25kaXRpb25hbGx5IGhlcmUsCmV2ZW4gZm9yIHYyIGNvbnRyb2xsZXJzLiBU
aGlzIGNhbiBsZWFkIHRvIGEgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIGluCmhjaV9kYXRfdzBf
d3JpdGUoKSB3aGVuIGFjY2Vzc2luZyBoY2ktPkRBVDoKCmRyaXZlcnMvaTNjL21hc3Rlci9taXBp
LWkzYy1oY2kvZGF0X3YxLmM6aGNpX2RhdF93MF93cml0ZSgpIHsKICAgIC4uLgogICAgaGNpLT5E
QVRbaV0udzAgPSB2OwogICAgLi4uCn0KCnNpbmNlIHRoZSB2MSBEZXZpY2UgQWRkcmVzcyBUYWJs
ZSBpcyBub3QgaW5pdGlhbGl6ZWQgb3IgYWxsb2NhdGVkIGZvciB2MgpoYXJkd2FyZS4KCj4gIAlz
Y29wZWRfZ3VhcmQoc3BpbmxvY2tfaXJxc2F2ZSwgJmhjaS0+bG9jaykKPiAgCQloY2ktPmliaV9k
ZXZzW2Rldl9kYXRhLT5kYXRfaWR4XSA9IGRldjsKPiAtCXJldHVybiBpM2NfbWFzdGVyX2VuZWNf
bG9ja2VkKG0sIGRldi0+aW5mby5keW5fYWRkciwgSTNDX0NDQ19FVkVOVF9TSVIpOwo+ICsJcmV0
ID0gaTNjX21hc3Rlcl9lbmVjX2xvY2tlZChtLCBkZXYtPmluZm8uZHluX2FkZHIsIEkzQ19DQ0Nf
RVZFTlRfU0lSKTsKPiArCWlmIChyZXQpCj4gKwkJX19pM2NfaGNpX2Rpc2FibGVfaWJpKGhjaSwg
ZGV2KTsKCltTZXZlcml0eTogSGlnaF0KVGhpcyBpcyBwYXJ0IG9mIHRoZSBzYW1lIHByZS1leGlz
dGluZyBpc3N1ZSwgYnV0IGRvZXMgdGhpcyByb2xsYmFjayBwYXRoIGFsc28KdHJpZ2dlciBhIE5V
TEwgcG9pbnRlciBkZXJlZmVyZW5jZSBvbiB2MiBoYXJkd2FyZT8KClRoZSBfX2kzY19oY2lfZGlz
YWJsZV9pYmkoKSBmdW5jdGlvbiB1bmNvbmRpdGlvbmFsbHkgY2FsbHMKbWlwaV9pM2NfaGNpX2Rh
dF92MS5zZXRfZmxhZ3MoKSwgd2hpY2ggd2lsbCBkZXJlZmVyZW5jZSB0aGUgc2FtZSB1bmluaXRp
YWxpemVkCnN0cnVjdHVyZSB1bmRlciB2Mi4KCj4gKwlyZXR1cm4gcmV0Owo+ICB9Cj4gIAo+ICBz
dGF0aWMgaW50IGkzY19oY2lfZGlzYWJsZV9pYmkoc3RydWN0IGkzY19kZXZfZGVzYyAqZGV2KQoK
LS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8y
MDI2MDkxNDExMzAwMy4xODMxNTAtMS1hZHJpYW4uaHVudGVyQGludGVsLmNvbT9wYXJ0PTYKCi0t
IApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
