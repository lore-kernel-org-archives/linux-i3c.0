Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 919E9CD98CE
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Jun 2026 11:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KPStLIi1SwT15Sxnod9N94AheRDgSfNfhJTAOUriAcI=; b=Gkc8+6F1RBK40T
	5jlMzBQPjT5qEgi7LIBRBfWHEn0SxhGkL4cJCGd9mD/L5lS/2/xH2toda4ttOaydyKM2lIclOO5em
	ascXz35DRLuqguOYZvdcAHdH1xxFRaPaEjDPXF2IDCf+q4/qmcIk3PevbZskLm8QNITaJIPuBYSDJ
	AfuQiyKEhZMdgptOBDuLWKnAkWJxqwLmBC/t8a/J3ZglnZD0LCzepy55WCZIl0P7OQ6zrRhV0jsW2
	0mzUXWlbrCukxbHHY1SxYDfUclCA06mMO54kyAvjbqRC4GnDxzoDdvmo3RwucNeMCkq1bHYhTNlSW
	W4UHl6JliJPEuswyY1nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY0NT-0000000Ap1l-1P1P;
	Fri, 12 Jun 2026 11:48:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY0NR-0000000Ap1f-3vIL
	for linux-i3c@lists.infradead.org;
	Fri, 12 Jun 2026 11:48:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 033B760008;
	Fri, 12 Jun 2026 11:48:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D7B71F000E9;
	Fri, 12 Jun 2026 11:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781264924;
	bh=l0eK6uNfs2/AAI8q6LCmmvtMa8kyEdDo6RbjQv9ERJM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Xv8EHyeZCaSx2J93dkoqiTlI/5GZ9btasnMNpkkGm4QQCvGPf5IEF+T6F0tw+VWnv
	 qitRQULie9owWPFRmKpGtfHTW2abNbDM1snLGLZ+FMzTmq22R1TKFMKi7TWL8KUV5U
	 1sqmL5C7nCOQO57JUXNIWX/SSPWEFJJ9zp4mJ6nF2Q6cZkHE3Jf4ky+jir7LwpYosE
	 8IPSPpkHl9LdydpH8fKzL7Qa5fumiHeYMJzxEt9zrAe+zsc23txdyB8/bsoW5Sa8+2
	 C5QiQsPxSayWgVyDhfqshfA8n2XoI9ZsO/RAFTJip4HnDK9qZYWWisSx+4/H68u3IH
	 oMNHRgtjJZHpA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 3/9] i3c: master: Add APIs for I3C hub support
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, robh@kernel.org
In-Reply-To: <20260612111816.3688240-4-lakshay.piplani@nxp.com>
References: <20260612111816.3688240-4-lakshay.piplani@nxp.com>
Date: Fri, 12 Jun 2026 11:48:43 +0000
Message-Id: <20260612114844.5D7B71F000E9@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIGkzY19tYXN0ZXJfZGly
ZWN0X2RldGFjaF9pM2NfZGV2X2xvY2tlZCBsYWNrcyB0aGUgdW5hZGRyZXNzYWJsZSBkZXZpY2Ug
Y2hlY2sgcHJlc2VudCBpbiBpdHMgYXR0YWNoIGNvdW50ZXJwYXJ0LCBsZWFkaW5nIHRvIGEgTlVM
TCBwb2ludGVyIGRlcmVmZXJlbmNlIGluIGNvbnRyb2xsZXIgZHJpdmVycy4KLS0KCmNvbW1pdCBh
N2Y3NDE0MGQxNTY3MmI4ZjI4MjQ2NjYwNzFjZTA2ZTMwNTFlMGQ4CkF1dGhvcjogQW1hbiBLdW1h
ciBQYW5kZXkgPGFtYW4ua3VtYXJwYW5kZXlAbnhwLmNvbT4KCmkzYzogbWFzdGVyOiBBZGQgQVBJ
cyBmb3IgSTNDIGh1YiBzdXBwb3J0CgpBZGQgaGVscGVycyBmb3IgYXR0YWNoaW5nIGFuZCBkZXRh
Y2hpbmcgSTNDIGRldmljZXMgYW5kIENDQyBoZWxwZXJzCnRvIGNoZWNrIENDQyBzdXBwb3J0IGFu
ZCBzZW5kIENDQyBjb21tYW5kcyB0byBwcmVwYXJlIGZvciBJM0MgaHViIHN1cHBvcnQuCgo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIuYyBiL2RyaXZlcnMvaTNjL21hc3Rlci5jCj4g
aW5kZXggZWMzNTQ3Zjc1NDY5ZS4uNTllMGY4MmRlNmViZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2kzYy9tYXN0ZXIuYwo+ICsrKyBiL2RyaXZlcnMvaTNjL21hc3Rlci5jCgpbIC4uLiBdCgo+ICtp
bnQgaTNjX21hc3Rlcl9kaXJlY3RfYXR0YWNoX2kzY19kZXZfbG9ja2VkKHN0cnVjdCBpM2NfbWFz
dGVyX2NvbnRyb2xsZXIgKm1hc3RlciwKPiArCQkJCQkgICAgc3RydWN0IGkzY19kZXZfZGVzYyAq
ZGV2KQo+ICt7Cj4gKwlpbnQgcmV0ID0gMDsKPiArCj4gKwkvKgo+ICsJICogV2UgZG9uJ3QgYXR0
YWNoIGRldmljZXMgdG8gdGhlIGNvbnRyb2xsZXIgdW50aWwgdGhleSBhcmUKPiArCSAqIGFkZHJl
c3NhYmxlIG9uIHRoZSBidXMuCj4gKwkgKi8KPiArCj4gKwlpZiAoIWRldi0+aW5mby5zdGF0aWNf
YWRkciAmJiAhZGV2LT5pbmZvLmR5bl9hZGRyKQo+ICsJCXJldHVybiAwOwo+ICsKPiArCS8qIERv
IG5vdCBhdHRhY2ggdGhlIG1hc3RlciBkZXZpY2UgaXRzZWxmLiAqLwo+ICsJaWYgKG1hc3Rlci0+
dGhpcyAhPSBkZXYgJiYgbWFzdGVyLT5vcHMtPmF0dGFjaF9pM2NfZGV2KQo+ICsJCXJldCA9IG1h
c3Rlci0+b3BzLT5hdHRhY2hfaTNjX2RldihkZXYpOwo+ICsKPiArCXJldHVybiByZXQ7Cj4gK30K
PiArRVhQT1JUX1NZTUJPTF9HUEwoaTNjX21hc3Rlcl9kaXJlY3RfYXR0YWNoX2kzY19kZXZfbG9j
a2VkKTsKClsgLi4uIF0KCj4gK3ZvaWQgaTNjX21hc3Rlcl9kaXJlY3RfZGV0YWNoX2kzY19kZXZf
bG9ja2VkKHN0cnVjdCBpM2NfZGV2X2Rlc2MgKmRldikKPiArewo+ICsJc3RydWN0IGkzY19tYXN0
ZXJfY29udHJvbGxlciAqbWFzdGVyID0gaTNjX2Rldl9nZXRfbWFzdGVyKGRldik7Cj4gKwo+ICsJ
LyogRG8gbm90IGRldGFjaCB0aGUgbWFzdGVyIGRldmljZSBpdHNlbGYuICovCj4gKwlpZiAobWFz
dGVyLT50aGlzICE9IGRldiAmJiBtYXN0ZXItPm9wcy0+ZGV0YWNoX2kzY19kZXYpCj4gKwkJbWFz
dGVyLT5vcHMtPmRldGFjaF9pM2NfZGV2KGRldik7CgpbU2V2ZXJpdHk6IEhpZ2hdCkRvZXMgdGhp
cyBtaXNzaW5nIGFkZHJlc3MgY2hlY2sgaW4gdGhlIGRldGFjaCBoZWxwZXIgbGVhZCB0byBhIE5V
TEwgcG9pbnRlcgpkZXJlZmVyZW5jZSBpbiBjb250cm9sbGVyIGRyaXZlcnM/CgpUaGUgYXR0YWNo
IGhlbHBlciBpM2NfbWFzdGVyX2RpcmVjdF9hdHRhY2hfaTNjX2Rldl9sb2NrZWQoKSBncmFjZWZ1
bGx5IHNraXBzCmF0dGFjaGluZyBkZXZpY2VzIHdpdGhvdXQgYSBzdGF0aWMgb3IgZHluYW1pYyBh
ZGRyZXNzIGFuZCByZXR1cm5zIDAgKHN1Y2Nlc3MpLgpCZWNhdXNlIGl0IHJldHVybnMgc3VjY2Vz
cywgY2FsbGVycyBtaWdodCBuYXR1cmFsbHkgaW52b2tlIHRoaXMgY29tcGFuaW9uCmRldGFjaCBB
UEkgZHVyaW5nIHRlYXJkb3duIGZvciB0aGVzZSBzYW1lIGRldmljZXMuCgpIb3dldmVyLCBzaW5j
ZSB0aGlzIGhlbHBlciBsYWNrcyB0aGUgY29ycmVzcG9uZGluZyBhZGRyZXNzIGNoZWNrLCBpdAp1
bmNvbmRpdGlvbmFsbHkgaW52b2tlcyB0aGUgY29udHJvbGxlcidzIGRldGFjaCBjYWxsYmFjay4g
Q29udHJvbGxlciBkcml2ZXJzCm9mdGVuIHJldHJpZXZlIHRoZSBkZXZpY2UncyBwcml2YXRlIGRh
dGEgYW5kIGltbWVkaWF0ZWx5IGRlcmVmZXJlbmNlIGl0LiBTaW5jZQp0aGUgYXR0YWNoIHBoYXNl
IHdhcyBza2lwcGVkLCB0aGlzIHByaXZhdGUgZGF0YSB3b3VsZCBiZSBOVUxMLgoKU2hvdWxkIHRo
aXMgZnVuY3Rpb24gYWxzbyBjaGVjayBpZiB0aGUgZGV2aWNlIGhhcyBhbiBhZGRyZXNzIGJlZm9y
ZSBjYWxsaW5nCnRoZSBkZXRhY2ggY2FsbGJhY2s/Cgo+ICt9Cj4gK0VYUE9SVF9TWU1CT0xfR1BM
KGkzY19tYXN0ZXJfZGlyZWN0X2RldGFjaF9pM2NfZGV2X2xvY2tlZCk7CgotLSAKU2FzaGlrbyBB
SSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNjEyMTExODE2
LjM2ODgyNDAtMS1sYWtzaGF5LnBpcGxhbmlAbnhwLmNvbT9wYXJ0PTMKCi0tIApsaW51eC1pM2Mg
bWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
