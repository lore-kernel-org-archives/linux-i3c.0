Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86619C531F9
	for <linux-i3c@archiver.kernel.org>; Tue, 28 Jul 2026 16:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wpkRHhm2Hi25fNcSl9A6RbvvCaUUrBLydSgHyG3JE/o=; b=zV1klMDrirsOjG
	TWN3dvD3JwAVz0WhASH7szbtCYg5oP5CoKNH4zkNkjQf2TdRbVaHOwgHg2u6mHKGkq2e720pLvx15
	kkD4FP/x4KJPjAFuQt1fz+23UxPwjN4NOSFS5siZzJMHqeLvRBA0WEHttID6ktZiQ8G5wK5wqGgY0
	g9xpvOEFyi7XMMfMam13ZooSDY1yTah1VSWjPd3gbfmfFpauSYmxnW734H0/3Y1u1Co9O7EDa5Rcc
	QKx071WQgyHRvUOmAs2xHJOf7dsK7hefsc4nvUff4XD8UI7AbmbVcn4MFC8ER7FfrLr8o+1gTjpt4
	+puH7n89xD/rRIR2ncHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokxV-00000005sGC-11nW;
	Tue, 28 Jul 2026 16:47:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokxU-00000005sDy-2q4M
	for linux-i3c@lists.infradead.org;
	Tue, 28 Jul 2026 16:47:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3CC6C60A5E;
	Tue, 28 Jul 2026 16:47:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 860FB1F000E9;
	Tue, 28 Jul 2026 16:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785257230;
	bh=HMHAeeuXfY+CVAND0oKZ1WsRUL1D5V14YHWM8meNrgg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cmkDtROVFLTzH2T6Z9ratYoieCFHUGuahMTZER0Idrqb046ZSlSROstzz83jKXaKc
	 eKN0ksMfkL8PRBxeby6kQ7M4mJFp4YI9wxkEC5NqY64YHgmSwm1SLMZtfgue3ojgGU
	 v4kED4oL5DDIoxIn+AhleHmdXh01Q3PRhGxA3863Cy81PLwiO7DUvjFw2TaBExbYgF
	 /hO8etR5xXlDiEAYgELtvpFcFnBBZ1+NwJWSqdV36OjoyxB4Z7YjOlkKfRmczvx/A0
	 2wRK9/piBvdB8EkvWXsdlXcnin3G6PtrR8DvwRdJ0psQpK76J9KsOUDlv/InKGYl+P
	 O3dgGoNBWrgMg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V2 3/8] i3c: master: Report wakeup events for IBIs
To: "Adrian Hunter" <adrian.hunter@intel.com>
Cc: linux-pci@vger.kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, linux-i3c@lists.infradead.org, Frank.Li@kernel.org
In-Reply-To: <20260728155308.142713-4-adrian.hunter@intel.com>
References: <20260728155308.142713-1-adrian.hunter@intel.com>
 <20260728155308.142713-4-adrian.hunter@intel.com>
Date: Tue, 28 Jul 2026 16:47:10 +0000
Message-Id: <20260728164710.860FB1F000E9@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpOZXcgaXNzdWVzOgotIFtIaWdoXSBD
b25jdXJyZW50IGV4ZWN1dGlvbiBvZiBgaTNjX21hc3Rlcl9xdWV1ZV9pYmkoKWAgYW5kIGRldmlj
ZSB1bnJlZ2lzdHJhdGlvbiBsZWFkcyB0byBhIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSBvciBV
c2UtQWZ0ZXItRnJlZSBvbiBgZGV2LT5kZXZgLgoKUHJlLWV4aXN0aW5nIGlzc3VlczoKLSBbSGln
aF0gQ29uY3VycmVudGx5IGFjY2Vzc2luZyBgZGV2LT5pYmlgIGFuZCBpdHMgd29ya3F1ZXVlIHdp
dGhvdXQgc3luY2hyb25pemF0aW9uIGxlYWRzIHRvIFVzZS1BZnRlci1GcmVlLgotLQoKLS0tIFBh
dGNoIFszXTogW1BBVENIIFYyIDMvOF0gaTNjOiBtYXN0ZXI6IFJlcG9ydCB3YWtldXAgZXZlbnRz
IGZvciBJQklzIC0tLQpjb21taXQgMWM2MWVjNmFhNTNjNzg1ZWNlZWEzODUzMDA3NWM2ZmE2Yjc3
OTRmMgpBdXRob3I6IEFkcmlhbiBIdW50ZXIgPGFkcmlhbi5odW50ZXJAaW50ZWwuY29tPgoKaTNj
OiBtYXN0ZXI6IFJlcG9ydCB3YWtldXAgZXZlbnRzIGZvciBJQklzCgpUaGlzIGNvbW1pdCByZWNv
cmRzIGEgd2FrZXVwIGV2ZW50IHVzaW5nIHBtX3dha2V1cF9ldmVudCgpIHdoZW4gYW4KSW4tQmFu
ZCBJbnRlcnJ1cHQgKElCSSkgaXMgcXVldWVkIGZvciBwcm9jZXNzaW5nIGFuZCB0aGUgZGV2aWNl
IGhhcwp3YWtldXAgZW5hYmxlZC4gSXQgdXNlcyBhIDEwMCBtcyBwcm9jZXNzaW5nIGludGVydmFs
LgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyLmMgYi9kcml2ZXJzL2kzYy9tYXN0
ZXIuYwo+IGluZGV4IGNmMzM0NTI2NWFjMGIuLjlkNTZjYTA4NTY5YTEgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9pM2MvbWFzdGVyLmMKPiArKysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIuYwoKWyAuLi4g
XQoKPiBAQCAtMzA5OCw2ICszMTAxLDkgQEAgdm9pZCBpM2NfbWFzdGVyX3F1ZXVlX2liaShzdHJ1
Y3QgaTNjX2Rldl9kZXNjICpkZXYsIHN0cnVjdCBpM2NfaWJpX3Nsb3QgKnNsb3QpCj4gIAlpZiAo
IWRldi0+aWJpIHx8ICFzbG90KQo+ICAJCXJldHVybjsKPiAgCj4gKwlpZiAoZGV2aWNlX21heV93
YWtldXAoJmRldi0+ZGV2LT5kZXYpKQo+ICsJCXBtX3dha2V1cF9ldmVudCgmZGV2LT5kZXYtPmRl
diwgSTNDX1dBS0VVUF9QUk9DRVNTSU5HX1RJTUVfTVMpOwo+ICsKCltTZXZlcml0eTogSGlnaF0K
RG9lcyB0aGlzIGludHJvZHVjZSBhIHJlZ3Jlc3Npb24gd2hlcmUgYSByYWNlIGNvbmRpdGlvbiB3
aXRoIGRldmljZQp1bnJlZ2lzdHJhdGlvbiBjb3VsZCBsZWFkIHRvIGEgTlVMTCBwb2ludGVyIGRl
cmVmZXJlbmNlIG9yIHVzZS1hZnRlci1mcmVlCm9uIGRldi0+ZGV2PwoKSWYgYW4gSUJJIGZpcmVz
IGFuZCBpM2NfbWFzdGVyX3F1ZXVlX2liaSgpIGV4ZWN1dGVzIGNvbmN1cnJlbnRseSB3aXRoCmRl
dmljZSB1bnJlZ2lzdHJhdGlvbiAoZm9yIGV4YW1wbGUsIGR1cmluZyBkcml2ZXIgbW9kdWxlIHJl
bW92YWwgb3IKaG90LXVucGx1ZyksIGkzY19tYXN0ZXJfdW5yZWdpc3Rlcl9pM2NfZGV2cygpIGNh
biBmcmVlIGRldi0+ZGV2IGFuZCBzZXQgaXQKdG8gTlVMTDoKCmRyaXZlcnMvaTNjL21hc3Rlci5j
OmkzY19tYXN0ZXJfdW5yZWdpc3Rlcl9pM2NfZGV2cygpIHsKCS4uLgoJCWlmIChkZXZpY2VfaXNf
cmVnaXN0ZXJlZCgmaTNjZGV2LT5kZXYtPmRldikpCgkJCWRldmljZV91bnJlZ2lzdGVyKCZpM2Nk
ZXYtPmRldi0+ZGV2KTsKCQllbHNlCgkJCXB1dF9kZXZpY2UoJmkzY2Rldi0+ZGV2LT5kZXYpOwoJ
CWkzY2Rldi0+ZGV2ID0gTlVMTDsKCS4uLgp9CgpJZiBpM2NfbWFzdGVyX3F1ZXVlX2liaSgpIHBh
c3NlcyB0aGUgbG9ja2xlc3MgaWYgKCFkZXYtPmliaSkgY2hlY2sganVzdApiZWZvcmUgdGhlIHVu
cmVnaXN0cmF0aW9uIHJ1bnMsIGNvdWxkIHRoZSBzdWJzZXF1ZW50IGNhbGwgdG8KZGV2aWNlX21h
eV93YWtldXAoKSBkZXJlZmVyZW5jZSBhIGZyZWVkIG9yIE5VTEwgcG9pbnRlcj8KCgo+ICAJYXRv
bWljX2luYygmZGV2LT5pYmktPnBlbmRpbmdfaWJpcyk7Cj4gIAlxdWV1ZV93b3JrKGRldi0+aWJp
LT53cSwgJnNsb3QtPndvcmspOwo+ICB9CgpbU2V2ZXJpdHk6IEhpZ2hdClRoaXMgaXMgYSBwcmUt
ZXhpc3RpbmcgaXNzdWUsIGJ1dCBjYW4gYWNjZXNzaW5nIGRldi0+aWJpIGFuZCBpdHMgd29ya3F1
ZXVlCmhlcmUgcmFjZSB3aXRoIElCSSB0ZWFyZG93biBhbmQgY2F1c2UgYSB1c2UtYWZ0ZXItZnJl
ZT8KCklmIGkzY19tYXN0ZXJfcXVldWVfaWJpKCkgcGFzc2VzIHRoZSBpZiAoIWRldi0+aWJpKSBj
aGVjaywgYW5kIGNvbmN1cnJlbnRseQp0aGUgZHJpdmVyIGlzIHVuYm91bmQsIGkzY19kZXZfZnJl
ZV9pYmlfbG9ja2VkKCkgd2lsbCBkZXN0cm95IHRoZSB3b3JrcXVldWUKYW5kIGZyZWUgZGV2LT5p
Ymk6Cgpkcml2ZXJzL2kzYy9tYXN0ZXIuYzppM2NfZGV2X2ZyZWVfaWJpX2xvY2tlZCgpIHsKCS4u
LgoJaWYgKGRldi0+aWJpLT53cSkgewoJCWRlc3Ryb3lfd29ya3F1ZXVlKGRldi0+aWJpLT53cSk7
CgkJZGV2LT5pYmktPndxID0gTlVMTDsKCX0KCglrZnJlZShkZXYtPmliaSk7CglkZXYtPmliaSA9
IE5VTEw7CgkuLi4KfQoKQ291bGQgdGhlIGludGVycnVwdCBoYW5kbGVyIHRoZW4gY29udGludWUg
ZXhlY3V0aW9uIGFuZCBjYWxsIGF0b21pY19pbmMoKQphbmQgcXVldWVfd29yaygpIHVzaW5nIHRo
ZSByZWNlbnRseSBmcmVlZCBkZXYtPmliaSBzdHJ1Y3QgYW5kIGRlc3Ryb3llZAp3b3JrcXVldWU/
CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0
LzIwMjYwNzI4MTU1MzA4LjE0MjcxMy0xLWFkcmlhbi5odW50ZXJAaW50ZWwuY29tP3BhcnQ9MwoK
LS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
