Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E052C43458
	for <linux-i3c@archiver.kernel.org>; Wed,  1 Jul 2026 20:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MfZx7L/zTBK9kWRuW4/L+zD9ZkzgFzfkDXMHRLM1nwg=; b=zSQ93Gx4dTVH4c
	RhIFVKqcEAx4awsMsoEtgeUNW06BkB+867iXe1iR9svpM6A9svP4Qo21ponCTBSLCJIbBTeOY4usl
	PC+FNdZZ78hAqnS1n3hyP3tZQ+5+P4IKz2IwUEsGJ+aPDwvhrDcanZiydEdtXEjKldoHEkZzLgnXI
	2grSDx2QcCHA3/6JZxy4ZEKH3v20gSVrO5tHfBD6nf9/0TZavcwcsqzcsr8DZkhNHWCv6mKC8uSLc
	ZXS301nQDDSwTFOnegget9Jt8jOB2ZN8WKIVHxKXSsW7DWolwwBGLpJoOb2k/wJ4vmzESI9OwuYL8
	fk9UUCIMBTLgrS2QLuQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1cp-00000002yGY-1Idh;
	Wed, 01 Jul 2026 20:33:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1cn-00000002yGP-2RTr
	for linux-i3c@lists.infradead.org;
	Wed, 01 Jul 2026 20:33:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 48906407AB;
	Wed,  1 Jul 2026 20:33:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D13321F000E9;
	Wed,  1 Jul 2026 20:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782938017;
	bh=NyVMPti0TCUuC112Dde4qDthm08jy8jxIFdrJwiV/Oc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GBdmx60UAv5LPWXpzLXTCa5ewIonKVWxFSAsI/PVek5Fn7PdFr3Znd6IpnoKViXWy
	 MrcKC638sAs2xZRxN0oksf/bQxGwD+jYLDZAPHwjo4z16XZVYwfE3Q/IPlWTOlrpQ5
	 KkdpDoQR+Msrz+d5VA6EmROlYF2rWdKgjiyTs4NdltInKwIfgnBUI7VlzlAdNdqwaT
	 uWPOh8h5BIrm351ykYvEe1J8vH3GXl3FTWJenr1vGx7JkbPw5Y0WFlc5IeRnpCeMU0
	 VCha7Un8CEMQhZFCshHo6YHNtPNRukrKuAAWkRNPgHDMvToiBHliV0R4T0Zo2PJHCC
	 Ly2bqS4y8Jp7Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC RESEND 2/7] i3c: master: Report wakeup events for
 IBIs
To: "Adrian Hunter" <adrian.hunter@intel.com>
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, Frank.Li@kernel.org, linux-pci@vger.kernel.org, linux-i3c@lists.infradead.org
In-Reply-To: <20260701201533.220818-3-adrian.hunter@intel.com>
References: <20260701201533.220818-1-adrian.hunter@intel.com>
 <20260701201533.220818-3-adrian.hunter@intel.com>
Date: Wed, 01 Jul 2026 20:33:36 +0000
Message-Id: <20260701203336.D13321F000E9@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpOZXcgaXNzdWVzOgotIFtIaWdoXSBV
bmNvbmRpdGlvbmFsIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSBvZiBgZGV2LT5kZXZgIGluIGBp
M2NfbWFzdGVyX3F1ZXVlX2liaWAgZHVyaW5nIGRldmljZSB0ZWFyZG93bgoKUHJlLWV4aXN0aW5n
IGlzc3VlczoKLSBbSGlnaF0gTG9ja2xlc3MgVE9DVE9VIHJhY2UgbGVhZGluZyB0byBVc2UtQWZ0
ZXItRnJlZSBvZiBgZGV2LT5pYmlgIGR1cmluZyBjb25jdXJyZW50IElCSSB0ZWFyZG93bgotLQoK
Y29tbWl0IGZmZGQ5YjA2NmEyYmRhZGVjYWFiMjA1ZDE4N2RhYjFhNWVjZmY1YWUKQXV0aG9yOiBB
ZHJpYW4gSHVudGVyIDxhZHJpYW4uaHVudGVyQGludGVsLmNvbT4KCmkzYzogbWFzdGVyOiBSZXBv
cnQgd2FrZXVwIGV2ZW50cyBmb3IgSUJJcwoKQW4gSTNDIGRldmljZSBjb25maWd1cmVkIGFzIGEg
d2FrZXVwIHNvdXJjZSBjYW4gd2FrZSB0aGUgc3lzdGVtIGJ5CmdlbmVyYXRpbmcgYW4gSW4tQmFu
ZCBJbnRlcnJ1cHQgKElCSSkuCgpXaGVuIGFuIElCSSBpcyBxdWV1ZWQgZm9yIHByb2Nlc3Npbmcs
IHJlY29yZCBhIHdha2V1cCBldmVudCBmb3IgdGhlCmRldmljZSBpZiB3YWtldXAgaXMgZW5hYmxl
ZC4gIFVzZSBhIDEwMCBtcyBwcm9jZXNzaW5nIGludGVydmFsIHRvIGdpdmUKdGhlIEkzQyBkZXZp
Y2UgZHJpdmVyIHRpbWUgdG8gcHJvY2VzcyB0aGUgSUJJLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9pM2MvbWFzdGVyLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIuYwo+IGluZGV4IGE0N2UyOTI0YmI3
MDEuLmEzNmY5YjYxN2NiZjcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9pM2MvbWFzdGVyLmMKPiAr
KysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIuYwoKWyAuLi4gXQoKPiBAQCAtMzAwNyw2ICszMDEwLDkg
QEAgdm9pZCBpM2NfbWFzdGVyX3F1ZXVlX2liaShzdHJ1Y3QgaTNjX2Rldl9kZXNjICpkZXYsIHN0
cnVjdCBpM2NfaWJpX3Nsb3QgKnNsb3QpCj4gIAlpZiAoIWRldi0+aWJpIHx8ICFzbG90KQo+ICAJ
CXJldHVybjsKPiAgCj4gKwlpZiAoZGV2aWNlX21heV93YWtldXAoJmRldi0+ZGV2LT5kZXYpKQo+
ICsJCXBtX3dha2V1cF9ldmVudCgmZGV2LT5kZXYtPmRldiwgSTNDX1dBS0VVUF9QUk9DRVNTSU5H
X1RJTUVfTVMpOwo+ICsKCltTZXZlcml0eTogSGlnaF0KRG9lcyB0aGlzIGNvZGUgaW50cm9kdWNl
IGEgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIGlmIGFuIGludGVycnVwdCBhcnJpdmVzCmR1cmlu
ZyBkZXZpY2UgdGVhcmRvd24/CgpEdXJpbmcgSTNDIG1hc3RlciBjb250cm9sbGVyIHVucmVnaXN0
cmF0aW9uLCBpM2NfbWFzdGVyX3VucmVnaXN0ZXJfaTNjX2RldnMoKQpjbGVhcnMgdGhlIGRldmlj
ZSBkZXNjcmlwdGlvbiBhbmQgc2V0cyBpM2NkZXYtPmRldiB0byBOVUxMOgoKCWkzY2Rldi0+ZGV2
LT5kZXNjID0gTlVMTDsKCWlmIChkZXZpY2VfaXNfcmVnaXN0ZXJlZCgmaTNjZGV2LT5kZXYtPmRl
dikpCgkJZGV2aWNlX3VucmVnaXN0ZXIoJmkzY2Rldi0+ZGV2LT5kZXYpOwoJZWxzZQoJCXB1dF9k
ZXZpY2UoJmkzY2Rldi0+ZGV2LT5kZXYpOwoJaTNjZGV2LT5kZXYgPSBOVUxMOwoKU2luY2UgY2xl
YXJpbmcgZGV2LT5kZXNjIHByZXZlbnRzIHRoZSBkcml2ZXIncyByZW1vdmUgY2FsbGJhY2sgZnJv
bSBkaXNhYmxpbmcKdGhlIGhhcmR3YXJlIElCSSwgdGhlIElCSSBtYXkgc3RpbGwgZmlyZS4gSWYg
aTNjX21hc3Rlcl9xdWV1ZV9pYmkoKSBleGVjdXRlcwphdCB0aGlzIHBvaW50LCB0aGUgbmV3bHkg
YWRkZWQgZGV2aWNlX21heV93YWtldXAoJmRldi0+ZGV2LT5kZXYpIHdpbGwKZGVyZWZlcmVuY2Ug
dGhlIE5VTEwgZGV2LT5kZXYgcG9pbnRlci4KCj4gIAlhdG9taWNfaW5jKCZkZXYtPmliaS0+cGVu
ZGluZ19pYmlzKTsKCltTZXZlcml0eTogSGlnaF0KVGhpcyBpcyBhIHByZS1leGlzdGluZyBpc3N1
ZSwgYnV0IGRvZXMgdGhpcyBsb2NrbGVzcyBjaGVjayBvcGVuIGEgCnVzZS1hZnRlci1mcmVlIHJh
Y2Ugd2luZG93PwoKSWYgYSBoYXJkd2FyZSBJQkkgaW50ZXJydXB0IGlzIHByb2Nlc3NlZCBjb25j
dXJyZW50bHkgb24gYW5vdGhlciBDUFUsIGl0IGNhbgpldmFsdWF0ZSBpZiAoIWRldi0+aWJpKSBh
cyBmYWxzZSwgZ2V0IHByZWVtcHRlZCwgYW5kIHRoZW4gYWNjZXNzCmRldi0+aWJpLT5wZW5kaW5n
X2liaXMgYW5kIGRldi0+aWJpLT53cSBhZnRlciB0aGV5IGhhdmUgYmVlbiBmcmVlZCBieQppM2Nf
ZGV2X2ZyZWVfaWJpX2xvY2tlZCgpOgoKCWtmcmVlKGRldi0+aWJpKTsKCWRldi0+aWJpID0gTlVM
TDsKClRoaXMgaXMgcG9zc2libGUgZm9yIGhhcmR3YXJlIGNvbnRyb2xsZXJzIGxpa2UgZHctaTNj
LW1hc3RlciB0aGF0IGRvIG5vdAppbXBsaWNpdGx5IHN5bmNocm9uaXplIHdpdGggZXhlY3V0aW5n
IGhhcmR3YXJlIElSUSBoYW5kbGVycyBkdXJpbmcgdGhlaXIKZGlzYWJsZSBvcC4KCj4gIAlxdWV1
ZV93b3JrKGRldi0+aWJpLT53cSwgJnNsb3QtPndvcmspOwo+ICB9CgotLSAKU2FzaGlrbyBBSSBy
ZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNzAxMjAxNTMzLjIy
MDgxOC0xLWFkcmlhbi5odW50ZXJAaW50ZWwuY29tP3BhcnQ9MgoKLS0gCmxpbnV4LWkzYyBtYWls
aW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
