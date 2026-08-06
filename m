Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35044C56208
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Aug 2026 13:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OE+/EpqtgLXNitWS77X4p+gjdIE819l2pe3SKCDar/I=; b=hVWrZBn+keLKPc
	n37uJ9nClCnKAgNl+jyCkSX7WQZc/NMDII7ocKe1alVTJH2t3/VG6yOXIlXKKVE1U2BEmb8ezEfU8
	pB8GxBkyTcSNm/k1Bd1a92tICjn7W2N26Tl5PeLGi3A6JQntIiPYNUtzjYzKJWPuqjz3Valhjg95i
	YFHSXe5ehGeEVMp+DFNbh6A//cQJacljkwy0Qi7eOx6SWHFdDmZ89i+jeP9ZWeg80K8Wggl/zUABg
	6J+KJXgTrv359voEdPlu3OezltCLjs6VdwEPBxHaYN6o2HPcxxXNae/Cthg0jSCwZiWqi1Ajppur/
	780M25KlnkoufLRy6VLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wryKa-00000005vbV-3MdF;
	Thu, 06 Aug 2026 13:40:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wryKZ-00000005vbO-3tnG
	for linux-i3c@lists.infradead.org;
	Thu, 06 Aug 2026 13:40:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AEB8741B1F;
	Thu,  6 Aug 2026 13:40:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44A591F000E9;
	Thu,  6 Aug 2026 13:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786023619;
	bh=ucb4F9aMO5K8ZLlhk8JclHc7o8cLrw3MXgUf5KBxI7A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nlleqKl1SOPCcHC0gxjBu2+nvaxmRs46rnIj7UOdbqO9717vessY1oCbnT2TgIhkn
	 IJBcBA/PfAiWxsdJIsz0XH6wzfl9m5nhJ1HDse1b1WuVDviAFt8I6XpkOOGVO8RE0u
	 Lj3dJNOxplSmoe0Jc/kAfDB3qFvUptmP8AcAWK35Kb6z9pCZNm9GEc3PxmDTPaGPys
	 z4+S+voOknnFmeqfEf00T2sBUrFk/mONpm3mQsBmTqr3cxlASn42d4ElqrohIp0ngB
	 CSxaNRKaoiNSqZxB4BpCWhib134DdbCaDrcgOzM1obxR/F/M3yEMphvBUcu2gQ98PE
	 1YPoW56M97V1w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V4 03/14] i3c: master: Do not treat master device as a
 duplicate target
To: "Adrian Hunter" <adrian.hunter@intel.com>
Cc: Frank.Li@kernel.org, linux-i3c@lists.infradead.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, linux-pci@vger.kernel.org
In-Reply-To: <20260806131857.119830-4-adrian.hunter@intel.com>
References: <20260806131857.119830-1-adrian.hunter@intel.com>
 <20260806131857.119830-4-adrian.hunter@intel.com>
Date: Thu, 06 Aug 2026 13:40:18 +0000
Message-Id: <20260806134019.44A591F000E9@smtp.kernel.org>
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
IFtIaWdoXSBDb25jdXJyZW50IHN5c2ZzIGFjY2VzcyBkdXJpbmcgY29udHJvbGxlciB1bnJlZ2lz
dHJhdGlvbiBjYXVzZXMgVXNlLUFmdGVyLUZyZWUgb24gbWFzdGVyLT50aGlzLgotLQoKLS0tIFBh
dGNoIFszXTogW1BBVENIIFY0IDAzLzE0XSBpM2M6IG1hc3RlcjogRG8gbm90IHRyZWF0IG1hc3Rl
ciBkZXZpY2UgYXMgYSBkdXBsaWNhdGUgdGFyZ2V0IC0tLQpjb21taXQgZmM3NzM0ZThmMGNhNGE4
OTA5NDJlZGU2ZmJmOGUzODgwZTMzZjU5YwpBdXRob3I6IEFkcmlhbiBIdW50ZXIgPGFkcmlhbi5o
dW50ZXJAaW50ZWwuY29tPgoKaTNjOiBtYXN0ZXI6IERvIG5vdCB0cmVhdCBtYXN0ZXIgZGV2aWNl
IGFzIGEgZHVwbGljYXRlIHRhcmdldAoKaTNjX21hc3Rlcl9zZWFyY2hfaTNjX2Rldl9kdXBsaWNh
dGUoKSBzZWFyY2hlcyB0aGUgYnVzIGZvciBhbm90aGVyIEkzQwpkZXZpY2Ugd2l0aCB0aGUgc2Ft
ZSBQSUQgYXMgdGhlIHJlZmVyZW5jZSBkZXZpY2UuIFRoZSBzZWFyY2ggY2FuIG1hdGNoCm1hc3Rl
ci0+dGhpcywgY2F1c2luZyB0aGUgY29udHJvbGxlciBpdHNlbGYgdG8gYmUgcmV0dXJuZWQgYXMg
YSBkdXBsaWNhdGUuCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIuYyBiL2RyaXZl
cnMvaTNjL21hc3Rlci5jCj4gaW5kZXggYzdiYjUyYjcxZDg4NC4uYWJiNTgyNjQ1YTJlZCAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIuYwo+ICsrKyBiL2RyaXZlcnMvaTNjL21hc3Rl
ci5jCj4gQEAgLTI1NDUsNyArMjU0NSw4IEBAIGkzY19tYXN0ZXJfc2VhcmNoX2kzY19kZXZfZHVw
bGljYXRlKHN0cnVjdCBpM2NfZGV2X2Rlc2MgKnJlZmRldikKPiAgCj4gIAlpM2NfYnVzX2Zvcl9l
YWNoX2kzY2RldigmbWFzdGVyLT5idXMsIGkzY2Rldikgewo+ICAJCWlmIChpM2NkZXYgIT0gcmVm
ZGV2ICYmIGkzY2Rldi0+aW5mby5waWQgJiYKPiAtCQkgICAgaTNjZGV2LT5pbmZvLnBpZCA9PSBy
ZWZkZXYtPmluZm8ucGlkKQo+ICsJCSAgICBpM2NkZXYtPmluZm8ucGlkID09IHJlZmRldi0+aW5m
by5waWQgJiYKPiArCQkgICAgaTNjZGV2ICE9IG1hc3Rlci0+dGhpcykKPiAgCQkJcmV0dXJuIGkz
Y2RldjsKPiAgCX0KPiAgCgpbU2V2ZXJpdHk6IEhpZ2hdClRoaXMgaXMgYSBwcmUtZXhpc3Rpbmcg
aXNzdWUsIGJ1dCBzaW5jZSB0aGlzIHBhdGNoIG1vZGlmaWVzIGhvdyBtYXN0ZXItPnRoaXMKaXMg
aGFuZGxlZCwgSSBub3RpY2VkIGEgcG90ZW50aWFsIGNvbmN1cnJlbnQgdXNlLWFmdGVyLWZyZWUg
d2l0aCBtYXN0ZXItPnRoaXMKZHVyaW5nIHVucmVnaXN0cmF0aW9uLgoKV2hlbiBhbiBJM0MgbWFz
dGVyIGNvbnRyb2xsZXIgaXMgdW5yZWdpc3RlcmVkLCBpM2NfbWFzdGVyX3VucmVnaXN0ZXIoKSBj
YWxscwppM2NfbWFzdGVyX2J1c19jbGVhbnVwKCkgYmVmb3JlIGRldmljZV91bnJlZ2lzdGVyKCk6
Cgpkcml2ZXJzL2kzYy9tYXN0ZXIuYzppM2NfbWFzdGVyX3VucmVnaXN0ZXIoKSB7CgkuLi4KCWkz
Y19tYXN0ZXJfYnVzX2NsZWFudXAobWFzdGVyKTsKCXBtX3J1bnRpbWVfZGlzYWJsZSgmbWFzdGVy
LT5kZXYpOwoJZGV2aWNlX3VucmVnaXN0ZXIoJm1hc3Rlci0+ZGV2KTsKCS4uLgp9CgpUaGUgY2xl
YW51cCBmdW5jdGlvbiBldmVudHVhbGx5IGNhbGxzIGkzY19tYXN0ZXJfZGV0YWNoX2ZyZWVfZGV2
cygpLCB3aGljaAp1bmNvbmRpdGlvbmFsbHkgZnJlZXMgYWxsIGRldmljZXMgaW4gdGhlIGJ1cyBs
aXN0LCBpbmNsdWRpbmcgbWFzdGVyLT50aGlzOgoKZHJpdmVycy9pM2MvbWFzdGVyLmM6aTNjX21h
c3Rlcl9kZXRhY2hfZnJlZV9kZXZzKCkgewoJLi4uCgkJaTNjX21hc3Rlcl9mcmVlX2kzY19kZXYo
aTNjZGV2KTsKCS4uLgp9CgpCZWNhdXNlIGRldmljZV91bnJlZ2lzdGVyKCkgaGFzIG5vdCB5ZXQg
ZXhlY3V0ZWQsIHN5c2ZzIGF0dHJpYnV0ZXMgYXR0YWNoZWQKdG8gdGhlIG1hc3RlciBkZXZpY2Ug
cmVtYWluIGFjdGl2ZS4gCgpJZiB1c2Vyc3BhY2UgcmVhZHMgYSBzeXNmcyBhdHRyaWJ1dGUgZHVy
aW5nIHRoaXMgd2luZG93LCB3b3VsZCBiY3Jfc2hvdygpIApkZXJlZmVyZW5jZSB0aGUgZnJlZWQg
bWFzdGVyLT50aGlzIHBvaW50ZXI/Cgpkcml2ZXJzL2kzYy9tYXN0ZXIuYzpiY3Jfc2hvdygpIHsK
CS4uLgoJZGVzYyA9IGRldl90b19pM2NkZXNjKGRldik7CglyZXQgPSBzeXNmc19lbWl0KGJ1Ziwg
IjB4JTAyeFxuIiwgZGVzYy0+aW5mby5iY3IpOwoJLi4uCn0KClRoZSB0ZWFyZG93biBwYXRoIGRv
ZXMgbm90IGFwcGVhciB0byBob2xkIHRoZSBidXMtPmxvY2ssIHNvIHRoZQppM2NfYnVzX25vcm1h
bHVzZV9sb2NrKCkgaW4gdGhlIHN5c2ZzIGhhbmRsZXIgd291bGQgc3RpbGwgc3VjY2VlZC4gQ291
bGQgdGhpcwpjYXVzZSBhIG1lbW9yeSBjb3JydXB0aW9uIG9yIGluZm9ybWF0aW9uIGxlYWs/CgpT
aG91bGQgZGV2aWNlX3VucmVnaXN0ZXIoKSBvciBzeXNmcyBhdHRyaWJ1dGUgcmVtb3ZhbCBoYXBw
ZW4gYmVmb3JlIHRoZSBidXMKaXMgY2xlYW5lZCB1cCBhbmQgdGhlIGRldmljZXMgYXJlIGZyZWVk
PwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNl
dC8yMDI2MDgwNjEzMTg1Ny4xMTk4MzAtMS1hZHJpYW4uaHVudGVyQGludGVsLmNvbT9wYXJ0PTMK
Ci0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
