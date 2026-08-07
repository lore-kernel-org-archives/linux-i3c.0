Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E83C5AC7A
	for <linux-i3c@archiver.kernel.org>; Fri,  7 Aug 2026 15:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DYcU+NTMnoTxAkgT47L62C4ok+/E/c/qhPSVTx24iy4=; b=gQfwlClTagYcC8
	+PMFnLaHItksVuZUSrgWn0DfrpnXSbL+yRAzskwiYH/kj5PeTuSsGWfJ0iJYccxyo7juC0iHdfX61
	Va1B27l+ZDIdQ0YgmAO/fi4HSW7gdDe1PiaVmIKmaKrALQfqqt66VSM/FRXLyhb6pN1yD0GLVbGot
	JVS1lAuqs+yHZAiqHi9aR6byaIlaPWorwrBnKe3tidc/z0a8kpvpie/9u7mUyDz1ka0gieOyG7804
	F599kG7i1j0Sznty79bGPDXRrdgXdDg/aFWAUgKT0JrlcxrQnhH1pHhP1mwZ8q4z+YrX1cBXmBS86
	U69ZHmvdRt2arM5XlKWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMdy-00000008Luu-0PcM;
	Fri, 07 Aug 2026 15:37:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMdv-00000008Lul-3xj1
	for linux-i3c@lists.infradead.org;
	Fri, 07 Aug 2026 15:37:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0F54160A91;
	Fri,  7 Aug 2026 15:37:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 859531F00A3E;
	Fri,  7 Aug 2026 15:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786117074;
	bh=riTa3Zbq54AVhARcmN/uFqzfqv2PhOheVrOCKAtLRNA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aJjTf1kyw4UMF9UK5+WflERvANNU6oecLq6iJ0+KW3JfNpIp1uXdOLw7Ing3I4532
	 vb99/v8cwDxPE2MPoS+9KWNAT4k49u7jFXUFuzTBoylbYQpWeHRenvJR6YI3VE5kep
	 nhV89KlPZvwecSFqWKmawHent4f5VgCfNBfbaysNyNHZMnbLxuatwb1jLRkUVGUaKC
	 KadfgZuOXI/fOnjUU3dVeuuueDcudJl/1d5ulkI9lVApkBHler9e4pjLezPDKHE5Hf
	 dP1QqyTL5cBer5K4YaQOEm6SdKbcBJSwcyX0H1fbUPzPs0uI3z9jwC4iKWmXX2aci1
	 BUMvrNa38wfUA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V5 07/14] i3c: master: Fix potential UAF in
 i3c_device_match()
To: "Adrian Hunter" <adrian.hunter@intel.com>
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, Frank.Li@kernel.org, linux-i3c@lists.infradead.org, linux-pci@vger.kernel.org
In-Reply-To: <20260807145638.168865-8-adrian.hunter@intel.com>
References: <20260807145638.168865-1-adrian.hunter@intel.com>
 <20260807145638.168865-8-adrian.hunter@intel.com>
Date: Fri, 07 Aug 2026 15:37:54 +0000
Message-Id: <20260807153754.859531F00A3E@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpOZXcgaXNzdWVzOgotIFtIaWdoXSBU
aGUgcmVtb3ZhbCBvZiB0aGUgYGkzY2Rldi0+ZGVzY2AgTlVMTCBjaGVjayBpbnRyb2R1Y2VzIGEg
ZGV0ZXJtaW5pc3RpYyBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UgaW4gYGkzY19kZXZpY2VfbWF0
Y2hgIGR1cmluZyBjb25jdXJyZW50IGRyaXZlciBiaW5kaW5nLgoKUHJlLWV4aXN0aW5nIGlzc3Vl
czoKLSBbSGlnaF0gSW5jb21wbGV0ZSBmaXg6IEEgVXNlLUFmdGVyLUZyZWUgb2YgdGhlIGRlc2Ny
aXB0b3IgaXMgc3RpbGwgcG9zc2libGUgZHVyaW5nIG1hc3RlciB1bnJlZ2lzdHJhdGlvbiBiZWNh
dXNlIGl0IGV4ZWN1dGVzIGxvY2tsZXNzbHkuCi0tCgotLS0gUGF0Y2ggWzddOiBbUEFUQ0ggVjUg
MDcvMTRdIGkzYzogbWFzdGVyOiBGaXggcG90ZW50aWFsIFVBRiBpbiBpM2NfZGV2aWNlX21hdGNo
KCkgLS0tCmNvbW1pdCA4YWE1ZGU3OWI2MDQ0NWRhMGFiZWU2YzZhMTdjNzBiMWI5ZWM4YmU5CkF1
dGhvcjogQWRyaWFuIEh1bnRlciA8YWRyaWFuLmh1bnRlckBpbnRlbC5jb20+CgppM2M6IG1hc3Rl
cjogRml4IHBvdGVudGlhbCBVQUYgaW4gaTNjX2RldmljZV9tYXRjaCgpCgppM2NfZGV2aWNlX21h
dGNoKCkgZGVyZWZlcmVuY2VzIGkzY2Rldi0+ZGVzYyB3aXRob3V0IGhvbGRpbmcgdGhlIGJ1cwpu
b3JtYWwtdXNlIGxvY2suICBTaW5jZSB0aGUgZGVzY3JpcHRvciBwb2ludGVyIGNhbiBiZSByZXBs
YWNlZApjb25jdXJyZW50bHksIHRoZSBkZXJlZmVyZW5jZSBjYW4gcmFjZSB3aXRoIGRlc2NyaXB0
b3IgcmVwbGFjZW1lbnQgYW5kCnJlc3VsdCBpbiBhIHVzZS1hZnRlci1mcmVlLgoKUHJvdGVjdCBh
Y2Nlc3MgdG8gaTNjZGV2LT5kZXNjIHdpdGggdGhlIG5vcm1hbC11c2UgbG9jay4gIFdoaWxlIHRo
ZSBsb2NrCmlzIGhlbGQsIHRoZSBkZXNjcmlwdG9yIGlzIGd1YXJhbnRlZWQgdG8gcmVtYWluIHZh
bGlkLCBzbyB0aGUgTlVMTCBjaGVjawppcyBhbHNvIHVubmVjZXNzYXJ5IGFuZCBjYW4gYmUgcmVt
b3ZlZC4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci5jIGIvZHJpdmVycy9pM2Mv
bWFzdGVyLmMKPiBpbmRleCBlZTc3MWFjMGIyMDNlLi44M2UwNGEyYzIwMmE5IDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvaTNjL21hc3Rlci5jCj4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyLmMKPiBA
QCAtMzQ3LDggKzM0NywxMCBAQCBzdGF0aWMgaW50IGkzY19kZXZpY2VfbWF0Y2goc3RydWN0IGRl
dmljZSAqZGV2LCBjb25zdCBzdHJ1Y3QgZGV2aWNlX2RyaXZlciAqZHJ2KQo+ICAJaTNjZGV2ID0g
ZGV2X3RvX2kzY2RldihkZXYpOwo+ICAJaTNjZHJ2ID0gZHJ2X3RvX2kzY2RydihkcnYpOwo+ICAK
PiAtCWlmIChpM2NkZXYtPmRlc2MgJiYgaTNjZGV2LT5kZXNjLT5ib2FyZGluZm8pCj4gKwlpM2Nf
YnVzX25vcm1hbHVzZV9sb2NrKGkzY2Rldi0+YnVzKTsKPiArCWlmIChpM2NkZXYtPmRlc2MtPmJv
YXJkaW5mbykKCltTZXZlcml0eTogSGlnaF0KQ2FuIHJlbW92aW5nIHRoaXMgTlVMTCBjaGVjayBs
ZWFkIHRvIGEgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIGR1cmluZwpjb25jdXJyZW50IGRyaXZl
ciBiaW5kaW5nPwoKTG9va2luZyBhdCBtYXN0ZXIgdW5yZWdpc3RyYXRpb24sIHRoZSBkZXNjcmlw
dG9yIHBvaW50ZXIgaXMgY2xlYXJlZApsb2NrbGVzc2x5OgoKZHJpdmVycy9pM2MvbWFzdGVyLmM6
aTNjX21hc3Rlcl91bnJlZ2lzdGVyX2kzY19kZXZzKCkgewogICAgICAgIC4uLgogICAgICAgIGkz
Y2Rldi0+ZGV2LT5kZXNjID0gTlVMTDsKICAgICAgICAuLi4KfQoKSWYgYSBjb25jdXJyZW50IHN5
c2ZzIGJpbmQgb3BlcmF0aW9uIHRyaWdnZXJzIGkzY19kZXZpY2VfbWF0Y2goKSwgaXQgbWlnaHQK
YWNxdWlyZSB0aGUgcmVhZCBsb2NrIGJ1dCBzdGlsbCBvYnNlcnZlIGEgTlVMTCBkZXNjcmlwdG9y
IHNpbmNlIHVucmVnaXN0cmF0aW9uCmRvZXMgbm90IGFjcXVpcmUgaTNjX2J1c19ub3JtYWx1c2Vf
bG9jaygpLiBEb2VzIHRoZSByZW1vdmVkIE5VTEwgY2hlY2sKbm93IGd1YXJhbnRlZSBhIGNyYXNo
IGluIHRoaXMgcmFjZSBjb25kaXRpb24/CgpbU2V2ZXJpdHk6IEhpZ2hdClRoaXMgaXMgYSBwcmUt
ZXhpc3RpbmcgaXNzdWUsIGJ1dCBkb2VzIHRha2luZyB0aGUgbm9ybWFsLXVzZSBsb2NrIGZ1bGx5
CnByZXZlbnQgdGhlIHVzZS1hZnRlci1mcmVlIHRoaXMgcGF0Y2ggYWltcyB0byBmaXg/CgpNYXN0
ZXIgdW5yZWdpc3RyYXRpb24gbW9kaWZpZXMgYW5kIGluaXRpYXRlcyBjbGVhbnVwIG9mIGRlc2Ny
aXB0b3JzIHdpdGhvdXQKYWNxdWlyaW5nIGFueSBidXMgbG9ja3MsIGJ5cGFzc2luZyB0aGlzIHBy
b3RlY3Rpb24gZW50aXJlbHk6Cgpkcml2ZXJzL2kzYy9tYXN0ZXIuYzppM2NfbWFzdGVyX2J1c19j
bGVhbnVwKCkgewogICAgICAgIC4uLgogICAgICAgIGkzY19tYXN0ZXJfZGV0YWNoX2ZyZWVfZGV2
cyhtYXN0ZXIpOwogICAgICAgIC4uLgp9CgpJZiBhIGNvbmN1cnJlbnQgc3lzZnMgYmluZCBvcGVy
YXRpb24gcmVhZHMgaTNjZGV2LT5kZXNjIGp1c3QgYmVmb3JlIGl0IGlzCmNsZWFyZWQsIHRoZSBy
ZWFkIGxvY2sgaGVyZSBkb2Vzbid0IHNlZW0gdG8gc2VyaWFsaXplIGFnYWluc3QgdGhlCnVucmVn
aXN0cmF0aW9uIHRocmVhZCBwcm9jZWVkaW5nIHRvIGZyZWUgdGhlIGRlc2NyaXB0b3IuIENhbiB0
aGUgZGVzY3JpcHRvcgpzdGlsbCBiZSBmcmVlZCB3aGlsZSBpM2NfZGV2aWNlX21hdGNoKCkgaXMg
ZGVyZWZlcmVuY2luZyBpdD8KCj4gIAkJc3RhdGljX2FkZHJfbWV0aG9kID0gaTNjZGV2LT5kZXNj
LT5ib2FyZGluZm8tPnN0YXRpY19hZGRyX21ldGhvZDsKPiArCWkzY19idXNfbm9ybWFsdXNlX3Vu
bG9jayhpM2NkZXYtPmJ1cyk7Cj4gIAo+ICAJLyoKPiAgCSAqIFNFVEFBU0EtYmFzZWQgZGV2aWNl
cyBuZWVkIG5vdCBhbHdheXMgaGF2ZSBhIG1hdGNoaW5nIElEIHNpbmNlCgotLSAKU2FzaGlrbyBB
SSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwODA3MTQ1NjM4
LjE2ODg2NS0xLWFkcmlhbi5odW50ZXJAaW50ZWwuY29tP3BhcnQ9NwoKLS0gCmxpbnV4LWkzYyBt
YWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
