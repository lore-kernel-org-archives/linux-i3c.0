Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C088C56208
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Aug 2026 13:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TkqZKLkXIhZhcsCjuJEXCq1T69Hn4228Odg58w+ChOc=; b=BnkAOB4Nf8sLfZ
	KE3oyRx27+4CcgLee9MJ7kSyzKEF7zk+W9SzFPoHUmmmwL0fChAeJdFTRY8u5PYN7YDz+EscTtYSN
	RwLC6zF1eDt0RDXwhbYAOJz+1/0VzLjD+VdM+yLKWahPZFUA3e0G9mJc7rrGCO71QXgQhKG9qAtiE
	Bk+dPQGOhizBrDALw73Jwr/xyd2bBiS0XfmKQTW8kZECXqtkfuZBje3e630TaLcZOqunueQsE3XGn
	dUTYHt+BsPFUcN771mPOqujcL1KDej8Cq6x/OrfZBoFP2tL40cC/jHEqtJBCCUl/GnZdu5QMSqq/Y
	34JoBwYHHDtES29+dvLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wryaL-00000005x0V-0KPx;
	Thu, 06 Aug 2026 13:56:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wryaJ-00000005x0P-1vxZ
	for linux-i3c@lists.infradead.org;
	Thu, 06 Aug 2026 13:56:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0B98942D93;
	Thu,  6 Aug 2026 13:56:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 825E81F000E9;
	Thu,  6 Aug 2026 13:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786024594;
	bh=/A/AH5CyAtad2ksSWwXUJ+I90wFitKIRLKNDBuWDSgU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S/xJ8tPJXi2BI8qy6Rm7GU2g5v/lW9Hu98NT88V9CLi1UWufSuQGfVFr7dckAKobD
	 fXz0tYDkpTbs9ZZAz98XMz8aB0dJdgJtAPLRMXXTep8Cse6lL0pz5nrZG2emVqghcZ
	 vFi2MDgFX4Eg9hQj1PhTJb4gGxzuAEVoBIzlMFy4vjUXoQKNCObHf3YcLfMnXKYhJf
	 eGsRoY0XNVZIj90sEsv5eZlCO1J5Ccmvw6TREfSz8sV889MGjkGZgovKdUUQwsBhFa
	 6qW79bxLXCtom37QmxyGDLb350BskEaxKW9cFs4sDSqnpvc+3szrkzU0aixzv/1+Vk
	 vSX1jXVFH42lg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V4 12/14] i3c: mipi-i3c-hci-pci: Propagate I3C wakeup
 requirements to PCI
To: "Adrian Hunter" <adrian.hunter@intel.com>
Cc: Frank.Li@kernel.org, linux-pci@vger.kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, linux-i3c@lists.infradead.org
In-Reply-To: <20260806131857.119830-13-adrian.hunter@intel.com>
References: <20260806131857.119830-1-adrian.hunter@intel.com>
 <20260806131857.119830-13-adrian.hunter@intel.com>
Date: Thu, 06 Aug 2026 13:56:32 +0000
Message-Id: <20260806135634.825E81F000E9@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gVGhlIGRyaXZlciBk
eW5hbWljYWxseSBvdmVyd3JpdGVzIHRoZSB1c2VyLWNvbnRyb2xsZWQgYGRldi0+cG93ZXIuc2hv
dWxkX3dha2V1cGAgcG9saWN5IGR1cmluZyBzdXNwZW5kLgotLQoKLS0tIFBhdGNoIFsxMl06IFtQ
QVRDSCBWNCAxMi8xNF0gaTNjOiBtaXBpLWkzYy1oY2ktcGNpOiBQcm9wYWdhdGUgSTNDIHdha2V1
cCByZXF1aXJlbWVudHMgdG8gUENJIC0tLQpjb21taXQgMzE3NDg5ZmNhZDIxYmRkZWYxN2RlZjE5
ZTIyNzgyZjA0N2Y5OWRjNwpBdXRob3I6IEFkcmlhbiBIdW50ZXIgPGFkcmlhbi5odW50ZXJAaW50
ZWwuY29tPgoKaTNjOiBtaXBpLWkzYy1oY2ktcGNpOiBQcm9wYWdhdGUgSTNDIHdha2V1cCByZXF1
aXJlbWVudHMgdG8gUENJCgpUaGlzIGNvbW1pdCB1cGRhdGVzIHRoZSBkcml2ZXIgdG8ga2VlcCB0
aGUgUENJIHdha2V1cCBzdGF0ZSBhbGlnbmVkIHdpdGgKdGhlIHdha2V1cCByZXF1aXJlbWVudHMg
b2YgdGhlIGF0dGFjaGVkIEkzQyBkZXZpY2VzLiBEdXJpbmcgc3VzcGVuZCwgaXQKY2hlY2tzIHdo
ZXRoZXIgYW55IEhDSSBpbnN0YW5jZSBoYXMgYSB3YWtldXAtZW5hYmxlZCBkZXZpY2UgYW5kIGFs
dGVycyB0aGUKUENJIGZ1bmN0aW9uIHdha2V1cCBzdGF0ZSBhY2NvcmRpbmdseS4KCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci9taXBpLWkzYy1oY2kvbWlwaS1pM2MtaGNpLXBjaS5j
IGIvZHJpdmVycy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9taXBpLWkzYy1oY2ktcGNpLmMKPiBp
bmRleCA1YTllMmE0M2VmZjhkLi40MmMxNzJlODI2MjJmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
aTNjL21hc3Rlci9taXBpLWkzYy1oY2kvbWlwaS1pM2MtaGNpLXBjaS5jCj4gKysrIGIvZHJpdmVy
cy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9taXBpLWkzYy1oY2ktcGNpLmMKClsgLi4uIF0KCj4g
QEAgLTMxNywxMiArMzI5LDE5IEBAIHN0YXRpYyBpbnQgbWlwaV9pM2NfaGNpX3BjaV9zdXNwZW5k
KHN0cnVjdCBkZXZpY2UgKmRldikKPiAgCWlmICghaGNpLT5pbmZvLT5jb250cm9sX2luc3RhbmNl
X3BtKQo+ICAJCXJldHVybiAwOwo+ICAKPiArCXBtX2RhdGEuY2FuX3dha2V1cCA9IGRldmljZV9j
YW5fd2FrZXVwKGRldik7Cj4gKwo+ICAJcmV0ID0gZGV2aWNlX2Zvcl9lYWNoX2NoaWxkX3JldmVy
c2UoZGV2LCAmcG1fZGF0YSwgbWlwaV9pM2NfaGNpX3BjaV9zdXNwZW5kX2luc3RhbmNlKTsKPiAt
CWlmIChyZXQpCj4gKwlpZiAocmV0KSB7Cj4gIAkJZm9yIChpbnQgaSA9IDA7IGkgPCBwbV9kYXRh
LmRldl9jbnQ7IGkrKykKPiAgCQkJaTNjX2hjaV9ycG1fcmVzdW1lKHBtX2RhdGEuZGV2W2ldKTsK
PiArCQlyZXR1cm4gcmV0Owo+ICsJfQo+ICAKPiAtCXJldHVybiByZXQ7Cj4gKwlpZiAoZGV2aWNl
X21heV93YWtldXAoZGV2KSAhPSBwbV9kYXRhLm1heV93YWtldXApCj4gKwkJZGV2aWNlX3NldF93
YWtldXBfZW5hYmxlKGRldiwgcG1fZGF0YS5tYXlfd2FrZXVwKTsKCltTZXZlcml0eTogTWVkaXVt
XQpUaGUgY29tbWl0IG1lc3NhZ2Ugbm90ZXMgdGhhdCB0aGUgUENJIGRldmljZSBwb3dlci93YWtl
dXAgc3lzZnMgYXR0cmlidXRlIG5vCmxvbmdlciBwcm92aWRlcyBpbmRlcGVuZGVudCB3YWtldXAg
Y29udHJvbC4gSG93ZXZlciwgZG9lcyB0aGlzIGFwcHJvYWNoCmNvbmZsaWN0IHdpdGggdGhlIFBN
IGNvcmUgYXJjaGl0ZWN0dXJlIGV4cGVjdGF0aW9uIHRoYXQgdGhlIHNob3VsZF93YWtldXAKc3Rh
dGUgYW5kIGRldmljZV9zZXRfd2FrZXVwX2VuYWJsZSgpIGJlbG9uZyBzdHJpY3RseSB0byB1c2Vy
c3BhY2U/CgpCeSBkeW5hbWljYWxseSBhbHRlcmluZyB0aGUgY29yZSBkZXZpY2UgUE0gc3RhdGUg
aGVyZSBpbgptaXBpX2kzY19oY2lfcGNpX3N1c3BlbmQoKSwgdGhlIGRyaXZlciBjbG9iYmVycyBh
bnkgdXNlci1jb25maWd1cmVkIHdha2V1cApwb2xpY3kgb24gZXZlcnkgc3lzdGVtIG9yIHJ1bnRp
bWUgc3VzcGVuZC4gSXMgdGhlcmUgYW4gYWx0ZXJuYXRpdmUgd2F5IHRvCmhhbmRsZSB0aGUgSTND
IHdha2V1cCBwcm9wYWdhdGlvbiB3aXRob3V0IG92ZXJyaWRpbmcgdGhlIHN5c2ZzIFVBUEkgY29u
dHJhY3Q/Cgo+ICsKPiArCXJldHVybiAwOwo+ICB9CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcg
aHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwODA2MTMxODU3LjExOTgzMC0xLWFk
cmlhbi5odW50ZXJAaW50ZWwuY29tP3BhcnQ9MTIKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0
CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
