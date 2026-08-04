Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 821A5C5518F
	for <linux-i3c@archiver.kernel.org>; Tue,  4 Aug 2026 14:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dCu2HFGpcSdU5I2yUg7Vaefc+KI1eocGsoV15YcAr40=; b=VqE+n5as2+hmz/
	hettPq7NCejqblOUNtDxFTrAoBOmV80nhFzjO+ifmM6uBlXhPWcSiF5M0HWEWE77M4foPsjUBIFrQ
	OmQTahOhy5Ag35i4ZdNBtBjG819voHu60qsgl4pZVyANqy0zWxNpfkoXzaA3PUG5enu+iRO2y4btS
	3069TawOn1wmXOpqMKnL8t0vgbJQ33cZWhtd/3Rg+jdmyT+BqeZc442v8btmr1jfJfM6OdRyqgj9K
	Rf/0vRmXB8sIsSjz/MkqQUqk/BPWhHx5gzY6PdV1aho6Dt6YzeyDweHRz0Jy8e5TQv/FLB3IwjPnr
	BnK6WQKYMWDhu3Yf4WLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFxS-000000022Ea-0vn5;
	Tue, 04 Aug 2026 14:17:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFxQ-000000022EF-3Cug
	for linux-i3c@lists.infradead.org;
	Tue, 04 Aug 2026 14:17:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3AFE660A73;
	Tue,  4 Aug 2026 14:17:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 567571F000E9;
	Tue,  4 Aug 2026 14:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785853047;
	bh=1PmVElSSLFCWuW9L+JKD9kj0MEm4YfKecxf28Uxzfgg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YLJfEWxgcJxZbp3DODECGhKY5vB4znRld3F//Ooa3hpqzAKm3QmCpPdK/9UXanBJP
	 Gq3tG5O28mRxrJnKMld9hcNINq7EmYygfPc0WZ1EIPg8Po0e44bSZVPazyk9mJCGVW
	 uTn+p+YHWaDdEya3HatYlQuj4BMoJC1xpn9DkI1piPFLrj+vsHI8HvLWoQyT3rvbGR
	 txdzLFlVI9iKHBQ0byT5/s7AmitT9ehYe6Na//orkK50YFS7PjXxSxhPEqg0r0iHW+
	 DYZFg2QKlLJ+P+KvPvZcW+YfRruZ5XXk6cREUFZIjo+71ISYDs34sRit2/sqZczQ7z
	 k2lUvMELc7fvg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V3 03/14] i3c: master: Do not treat master device as a
 duplicate target
To: "Adrian Hunter" <adrian.hunter@intel.com>
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, Frank.Li@kernel.org, linux-i3c@lists.infradead.org, linux-pci@vger.kernel.org
In-Reply-To: <20260804133810.184905-4-adrian.hunter@intel.com>
References: <20260804133810.184905-1-adrian.hunter@intel.com>
 <20260804133810.184905-4-adrian.hunter@intel.com>
Date: Tue, 04 Aug 2026 14:17:26 +0000
Message-Id: <20260804141727.567571F000E9@smtp.kernel.org>
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
IFtIaWdoXSBVbnJlZ2lzdGVyaW5nIGFuIEkzQyBtYXN0ZXIgY2F1c2VzIGEgdXNlLWFmdGVyLWZy
ZWUgaWYgaXRzIHN5c2ZzIGF0dHJpYnV0ZXMgKGUuZy4sIGBwaWRgLCBgYmNyYCwgYGRjcmApIGFy
ZSByZWFkIGNvbmN1cnJlbnRseS4KLS0KCi0tLSBQYXRjaCBbM106IFtQQVRDSCBWMyAwMy8xNF0g
aTNjOiBtYXN0ZXI6IERvIG5vdCB0cmVhdCBtYXN0ZXIgZGV2aWNlIGFzIGEgZHVwbGljYXRlIHRh
cmdldCAtLS0KY29tbWl0IGE5OGEwNmU1NzZiMDhiZTJjZDRlNzFkZjNmYTYzYmE2ODhhMjU0Y2EK
QXV0aG9yOiBBZHJpYW4gSHVudGVyIDxhZHJpYW4uaHVudGVyQGludGVsLmNvbT4KCmkzYzogbWFz
dGVyOiBEbyBub3QgdHJlYXQgbWFzdGVyIGRldmljZSBhcyBhIGR1cGxpY2F0ZSB0YXJnZXQKClRo
aXMgY29tbWl0IHVwZGF0ZXMgaTNjX21hc3Rlcl9zZWFyY2hfaTNjX2Rldl9kdXBsaWNhdGUoKSB0
byBleGNsdWRlIHRoZQptYXN0ZXIgY29udHJvbGxlciBpdHNlbGYgZnJvbSBtYXRjaGluZyB3aGVu
IHNlYXJjaGluZyBmb3IgZHVwbGljYXRlIHRhcmdldApkZXZpY2VzLiBTaW5jZSB0aGUgY29udHJv
bGxlciBpcyBub3QgYSB0YXJnZXQgZGV2aWNlLCBpdCBzaG91bGQgbm90IGJlCnJldHVybmVkIGFz
IGEgZHVwbGljYXRlLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyLmMgYi9kcml2
ZXJzL2kzYy9tYXN0ZXIuYwo+IGluZGV4IGM3YmI1MmI3MWQ4ODQuLmFiYjU4MjY0NWEyZWQgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9pM2MvbWFzdGVyLmMKPiArKysgYi9kcml2ZXJzL2kzYy9tYXN0
ZXIuYwo+IEBAIC0yNTQ1LDcgKzI1NDUsOCBAQCBpM2NfbWFzdGVyX3NlYXJjaF9pM2NfZGV2X2R1
cGxpY2F0ZShzdHJ1Y3QgaTNjX2Rldl9kZXNjICpyZWZkZXYpCj4gIAo+ICAJaTNjX2J1c19mb3Jf
ZWFjaF9pM2NkZXYoJm1hc3Rlci0+YnVzLCBpM2NkZXYpIHsKPiAgCQlpZiAoaTNjZGV2ICE9IHJl
ZmRldiAmJiBpM2NkZXYtPmluZm8ucGlkICYmCj4gLQkJICAgIGkzY2Rldi0+aW5mby5waWQgPT0g
cmVmZGV2LT5pbmZvLnBpZCkKPiArCQkgICAgaTNjZGV2LT5pbmZvLnBpZCA9PSByZWZkZXYtPmlu
Zm8ucGlkICYmCj4gKwkJICAgIGkzY2RldiAhPSBtYXN0ZXItPnRoaXMpCj4gIAkJCXJldHVybiBp
M2NkZXY7Cj4gIAl9CgpbU2V2ZXJpdHk6IEhpZ2hdClRoaXMgaXMgYSBwcmUtZXhpc3RpbmcgaXNz
dWUsIGJ1dCB1bnJlZ2lzdGVyaW5nIGFuIEkzQyBtYXN0ZXIgYXBwZWFycyB0bwpjYXVzZSBhIHVz
ZS1hZnRlci1mcmVlIGlmIGl0cyBzeXNmcyBhdHRyaWJ1dGVzIGFyZSByZWFkIGNvbmN1cnJlbnRs
eS4KCkxvb2tpbmcgYXQgaTNjX21hc3Rlcl91bnJlZ2lzdGVyKCkgaW4gZHJpdmVycy9pM2MvbWFz
dGVyLmM6CgppM2NfbWFzdGVyX3VucmVnaXN0ZXIoKSB7CiAgICAuLi4KICAgIGkzY19tYXN0ZXJf
YnVzX2NsZWFudXAobWFzdGVyKTsKICAgIHBtX3J1bnRpbWVfZGlzYWJsZSgmbWFzdGVyLT5kZXYp
OwogICAgZGV2aWNlX3VucmVnaXN0ZXIoJm1hc3Rlci0+ZGV2KTsKICAgIC4uLgp9CgpUaGUgY2Fs
bCB0byBpM2NfbWFzdGVyX2J1c19jbGVhbnVwKCkgY2FsbHMgaTNjX21hc3Rlcl9kZXRhY2hfZnJl
ZV9kZXZzKCksCndoaWNoIGZyZWVzIGFsbCBkZXZpY2VzIGluIHRoZSBsaXN0IGluY2x1ZGluZyBt
YXN0ZXItPnRoaXMuIAoKSG93ZXZlciwgYmVjYXVzZSBkZXZpY2VfdW5yZWdpc3RlcigpIGhhc24n
dCBiZWVuIGNhbGxlZCB5ZXQsIHRoZSBzeXNmcyBmaWxlcwpyZW1haW4gZXhwb3NlZCB0byB1c2Vy
c3BhY2UuCgpJZiB1c2Vyc3BhY2UgcmVhZHMgYSBzeXNmcyBhdHRyaWJ1dGUgbGlrZSBwaWQgZHVy
aW5nIHRoaXMgd2luZG93LCBjb3VsZCB0aGlzCnRyaWdnZXIgYSB1c2UtYWZ0ZXItZnJlZT8KCmRy
aXZlcnMvaTNjL21hc3Rlci5jOnBpZF9zaG93KCkgewogICAgLi4uCiAgICBkZXNjID0gZGV2X3Rv
X2kzY2Rlc2MoZGV2KTsKICAgIHJldCA9IHN5c2ZzX2VtaXQoYnVmLCAiJWxseFxuIiwgZGVzYy0+
aW5mby5waWQpOwogICAgLi4uCn0KClNpbmNlIG1hc3Rlci0+dGhpcyBpcyBhbHJlYWR5IGZyZWVk
IGJ1dCB0aGUgcG9pbnRlciBpcyBub3QgTlVMTCwgCmRlc2MtPmluZm8ucGlkIHdvdWxkIGRlcmVm
ZXJlbmNlIHRoZSBmcmVlZCBtZW1vcnkuCgpDb3VsZCBkZXZpY2VfdW5yZWdpc3RlcigpIGJlIGNh
bGxlZCBlYXJsaWVyIHRvIHByZXZlbnQgdGhlIHN5c2ZzIGZpbGVzIApmcm9tIGJlaW5nIGFjY2Vz
c2VkIHdoaWxlIHRoZSBjbGVhbnVwIGhhcHBlbnM/CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcg
aHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwODA0MTMzODEwLjE4NDkwNS0xLWFk
cmlhbi5odW50ZXJAaW50ZWwuY29tP3BhcnQ9MwoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QK
bGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
