Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB1B1C44529
	for <linux-i3c@archiver.kernel.org>; Tue, 21 Jul 2026 04:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hiHxVSNGRtkAGzWaGiqSDEKsU/JsL4j4TXDTIphqoNo=; b=gnURYl9iVCIVi/
	73unfCWYdjgSxnHfQ5HUN9zn0PyiaXBeZPW7toPZw6xU8lI/b80Eq6bV05Rz9VCJDsO0n8W2CNXPD
	XYNB1drm8mdmLrWMkHcUBtMQckDGhqjJhgetxq8GpJjmPo3E8HHUsVJYiFaK9jFPXolDoH4fFcQwm
	h7MCz4DyACqHJSSUH1rtd+w+GCehWqSlN4KKOgbuJfVMe+21sJ6vzjp7DzztprBR+akXPjdx5qlpR
	hM8KhdKhhAxbzDzEFFNyxvIdv+awNW0yx9YmnCTW3th+HzxmY+wD/LcAkLRSss7uw2zVfjZZcBUdO
	Es7MHzXhVlqmSG7U538g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm22b-00000008NfA-2F5z;
	Tue, 21 Jul 2026 04:25:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm22a-00000008Nf3-1LA9
	for linux-i3c@lists.infradead.org;
	Tue, 21 Jul 2026 04:25:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 19A3F4177F;
	Tue, 21 Jul 2026 04:25:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E0A81F000E9;
	Tue, 21 Jul 2026 04:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784607912;
	bh=D9t9Tm8bKySSKPwlYRcxEqAkJVVFL4+R1k9assworKs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZJf1XfG6Lgt0bUCOQJgFlWjP9n/OLcj9AYkRwyslR02a2Y5/BWytRCfaZ2XsX7lvl
	 SzGNGUx/k0rqAFrH4pua5Wed2LQY3A1S5PsAgXJ6TEukmFi2/YDZBJ/gVrYiYZNoPZ
	 R1rx1uE+emW1gcxuFkRqVa4GiUosXFjdV+ZhGoK5+H6+kENbM0urPycuR75fTZcPeH
	 str2QKO54Y7oWTswGKYixlZlZz6QecJukpNNl3RMJ6PoRRtL4h0p7DmezH/FZhwEAk
	 cxt+L9BgGVPyYGDkj0bhsrFqPxuRJ1nc5kXVimd/hi7tfyEsqdIFBzJqdJITEFOgyB
	 IuM+h5l94940w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 02/12] i3c: master: Use unified device property
 interface
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: robh@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, linux-hwmon@vger.kernel.org, conor+dt@kernel.org, linux-i3c@lists.infradead.org, Frank.Li@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260721040805.1696503-3-akhilrajeev@nvidia.com>
References: <20260721040805.1696503-1-akhilrajeev@nvidia.com>
 <20260721040805.1696503-3-akhilrajeev@nvidia.com>
Date: Tue, 21 Jul 2026 04:25:10 +0000
Message-Id: <20260721042511.7E0A81F000E9@smtp.kernel.org>
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
IFtIaWdoXSBVc2UtQWZ0ZXItRnJlZSBhbmQgRG91YmxlLUZyZWUgb24gZGV2aWNlX3JlZ2lzdGVy
KCkgZXJyb3IgcGF0aC4KLS0KCi0tLSBQYXRjaCBbMl06IFtQQVRDSCB2NiAwMi8xMl0gaTNjOiBt
YXN0ZXI6IFVzZSB1bmlmaWVkIGRldmljZSBwcm9wZXJ0eSBpbnRlcmZhY2UgLS0tCmNvbW1pdCA0
Y2Q4NjE1YzYyMjRiOWE4ZTlhZTM3NjFmMWVmNGYxOWIzMDYzYzI5CkF1dGhvcjogQWtoaWwgUiA8
YWtoaWxyYWplZXZAbnZpZGlhLmNvbT4KCmkzYzogbWFzdGVyOiBVc2UgdW5pZmllZCBkZXZpY2Ug
cHJvcGVydHkgaW50ZXJmYWNlCiAgICAKUmVwbGFjZSBhbGwgT0Ytc3BlY2lmaWMgZnVuY3Rpb25z
IHdpdGggdW5pZmllZCBkZXZpY2UgcHJvcGVydHkgZnVuY3Rpb25zCmFzIGEgcHJlcmVxdWlzaXRl
IHRvIHN1cHBvcnQgYm90aCBBQ1BJIGFuZCBkZXZpY2UgdHJlZS4KCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvaTNjL21hc3Rlci5jIGIvZHJpdmVycy9pM2MvbWFzdGVyLmMKPiBpbmRleCBmMWJlMzhh
NjQwY2ExLi40YjNkOTYyOGJjMzliIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci5j
Cj4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyLmMKClsgLi4uIF0KCj4gQEAgLTE5MjgsNyArMTkz
MCw3IEBAIGkzY19tYXN0ZXJfcmVnaXN0ZXJfbmV3X2kzY19kZXZzKHN0cnVjdCBpM2NfbWFzdGVy
X2NvbnRyb2xsZXIgKm1hc3RlcikKPiAgCQkJICAgICBkZXNjLT5pbmZvLnBpZCk7Cj4gIAo+ICAJ
CWlmIChkZXNjLT5ib2FyZGluZm8pCj4gLQkJCWRlc2MtPmRldi0+ZGV2Lm9mX25vZGUgPSBkZXNj
LT5ib2FyZGluZm8tPm9mX25vZGU7Cj4gKwkJCWRldmljZV9zZXRfbm9kZSgmZGVzYy0+ZGV2LT5k
ZXYsIGRlc2MtPmJvYXJkaW5mby0+Zndub2RlKTsKPiAgCj4gIAkJcmV0ID0gZGV2aWNlX3JlZ2lz
dGVyKCZkZXNjLT5kZXYtPmRldik7Cj4gIAkJaWYgKHJldCkgewo+ICAJCQlkZXZfZXJyKCZtYXN0
ZXItPmRldiwKPiAgCQkJCSJGYWlsZWQgdG8gYWRkIEkzQyBkZXZpY2UgKGVyciA9ICVkKVxuIiwg
cmV0KTsKPiAgCQkJcHV0X2RldmljZSgmZGVzYy0+ZGV2LT5kZXYpOwoKW1NldmVyaXR5OiBIaWdo
XQpUaGlzIGlzIGEgcHJlLWV4aXN0aW5nIGlzc3VlLCBidXQgZG9lcyB0aGUgZXJyb3IgcGF0aCBo
ZXJlIGxlYXZlIGEKZGFuZ2xpbmcgcG9pbnRlciBpbiBkZXNjLT5kZXY/CgpJZiBkZXZpY2VfcmVn
aXN0ZXIoKSBmYWlscywgcHV0X2RldmljZSgpIGRyb3BzIHRoZSByZWZlcmVuY2UgYW5kCmkzY19k
ZXZpY2VfcmVsZWFzZSgpIGZyZWVzIHRoZSB1bmRlcmx5aW5nIG1lbW9yeSB2aWEga2ZyZWUoKS4K
SG93ZXZlciwgZGVzYy0+ZGV2IGlzIG5vdCBzZXQgdG8gTlVMTC4KCkxhdGVyLCB3aGVuIHRoZSBt
YXN0ZXIgY29udHJvbGxlciBpcyB1bnJlZ2lzdGVyZWQsIGNvdWxkIHRoaXMgbGVhZCB0byBhCndy
aXRlLWFmdGVyLWZyZWUgYW5kIGRvdWJsZS1mcmVlIHdoZW4gdGhlIHRlYXJkb3duIHBhdGggaXRl
cmF0ZXMgb3Zlcgp0aGUgZGV2aWNlcz8KCmRyaXZlcnMvaTNjL21hc3Rlci5jOmkzY19tYXN0ZXJf
dW5yZWdpc3Rlcl9pM2NfZGV2cygpIHsKCS4uLgoJaTNjX2J1c19mb3JfZWFjaF9pM2NkZXYoJm1h
c3Rlci0+YnVzLCBpM2NkZXYpIHsKCQlpZiAoIWkzY2Rldi0+ZGV2KQoJCQljb250aW51ZTsKCgkJ
aTNjZGV2LT5kZXYtPmRlc2MgPSBOVUxMOwoJCWlmIChkZXZpY2VfaXNfcmVnaXN0ZXJlZCgmaTNj
ZGV2LT5kZXYtPmRldikpCgkJCWRldmljZV91bnJlZ2lzdGVyKCZpM2NkZXYtPmRldi0+ZGV2KTsK
CQllbHNlCgkJCXB1dF9kZXZpY2UoJmkzY2Rldi0+ZGV2LT5kZXYpOwoJLi4uCn0KCj4gIAkJfQo+
ICAJfQoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRj
aHNldC8yMDI2MDcyMTA0MDgwNS4xNjk2NTAzLTEtYWtoaWxyYWplZXZAbnZpZGlhLmNvbT9wYXJ0
PTIKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNj
Cg==
