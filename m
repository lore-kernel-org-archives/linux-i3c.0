Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1762CC5CFDB
	for <linux-i3c@archiver.kernel.org>; Fri, 14 Aug 2026 13:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H1gyLKJLwws2K/U726V92bEmgNq9iSPc4/DaSG4VwPs=; b=yzLzXzkvXfGmNQ
	F+SFzsQXuLFeo5Ud+Zij84cJiKKy/2/IsdSM1EI35LsuRcv9d8Rd78wc3o5s5PlA4m2ne/YHScScP
	2/PveV9gkgesYMOFkoenxgDRfHd2pJ33fmXgncjTtL36ZYcgwau8j6V5KVfCPa0XjKmL85833Yi3I
	F2BthT4Af4r+4DURXz/qwO/nszqZaMxAYpPe4YRYKqlBaTHgWDkrdUfD5gK2MF42WNz76vQ9zyFPV
	dIoEXeohuh0Re6Mau9IMRHv9IwXdf5uXhHphWmWJjXu+hgOlelSFD7t5QveIR+VytlReKkNQqbipw
	ohiXVaK3HspN+T1BKs2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wusQl-00000002l3M-1jkB;
	Fri, 14 Aug 2026 13:58:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wusQk-00000002l3F-0Z27
	for linux-i3c@lists.infradead.org;
	Fri, 14 Aug 2026 13:58:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 859B840C3F;
	Fri, 14 Aug 2026 13:58:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2772F1F000E9;
	Fri, 14 Aug 2026 13:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786715921;
	bh=LYZ4XbpO0Wq3oFuc+PPwWk/InkWJCmsvgVkQhQvaPf0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NtZl1YdFlls/OMKqZEfl9k4dIzhtb0h8khH9DkRhuCVoO0e4CKN4omF1W+DiE4jJo
	 WblCinWreumUYqyhAUizMo07UnvBdYTjSAcyuZpwt8HR7653MEX24OX28Sn6YLM1m6
	 tsQMEkMMuiBFodC630GskljxJc5Ea8d7mHmfX0eUVTiQxqQBIi51su+fHt5pHwBAJJ
	 y4Onm6nJAXAAjEx3x50Y3fW30PEy9kyZOlYJ7GhQD5ZDewPpoCrxfcuBf3aEkXt/4c
	 jwD68IPoyiy5hhP1Gf/Og+8kvxOHI74du9KVdsbYsFpVl4NlRI7RMfP6S9vhBPMcxl
	 PLfh2Twz2s7dg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] i3c: master: Release I2C boardinfo node reference
To: "Ruoyu Wang" <ruoyuw560@gmail.com>
Cc: Frank.Li@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, linux-i3c@lists.infradead.org
In-Reply-To: <20260814134027.1386818-1-ruoyuw560@gmail.com>
References: <20260814134027.1386818-1-ruoyuw560@gmail.com>
Date: Fri, 14 Aug 2026 13:58:40 +0000
Message-Id: <20260814135841.2772F1F000E9@smtp.kernel.org>
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
IFtIaWdoXSBVc2UtQWZ0ZXItRnJlZSBhbmQgRG91YmxlLUZyZWUgb24gSTNDIGRldmljZSByZWdp
c3RyYXRpb24gZmFpbHVyZS4KLS0KCi0tLSBQYXRjaCBbMV06IFtQQVRDSF0gaTNjOiBtYXN0ZXI6
IFJlbGVhc2UgSTJDIGJvYXJkaW5mbyBub2RlIHJlZmVyZW5jZSAtLS0KY29tbWl0IGZiOTRlM2Ux
Mzk3MTFjMjcyM2NiMWE3NGI4NWM4YTljNzllZmNmZDMKQXV0aG9yOiBSdW95dSBXYW5nIDxydW95
dXc1NjBAZ21haWwuY29tPgoKaTNjOiBtYXN0ZXI6IFJlbGVhc2UgSTJDIGJvYXJkaW5mbyBub2Rl
IHJlZmVyZW5jZQoKVGhlIGNvbW1pdCByZWdpc3RlcnMgdGhlIGJvYXJkLWluZm8gbm9kZSByZWZl
cmVuY2UgYXMgYSBtYW5hZ2VkIHJlc291cmNlCm9mIHRoZSBJM0MgbWFzdGVyLiBUaGlzIGVuc3Vy
ZXMgdGhlIHJlZmVyZW5jZSBpcyBwcm9wZXJseSByZXRhaW5lZCBmb3IgdGhlCmZ1bGwgbGlmZXRp
bWUgb2YgdGhlIGJvYXJkLWluZm8gYW5kIHJlbGVhc2VkIG9uIGJvdGggcmVnaXN0cmF0aW9uIGZh
aWx1cmUKYW5kIG5vcm1hbCBtYXN0ZXIgdGVhcmRvd24sIHByZXZlbnRpbmcgbWVtb3J5IGxlYWtz
LgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyLmMgYi9kcml2ZXJzL2kzYy9tYXN0
ZXIuYwo+IGluZGV4IGYxYmUzOGE2NDBjYTEuLjgwNjNlMjY0MmNiZGEgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9pM2MvbWFzdGVyLmMKPiArKysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIuYwoKWyAuLi4g
XQoKW1NldmVyaXR5OiBIaWdoXQpUaGlzIGlzIGEgcHJlLWV4aXN0aW5nIGlzc3VlLCBidXQgd2hp
bGUgcmV2aWV3aW5nIHRoaXMgZmlsZSwgSSBub3RpY2VkIGEKcG90ZW50aWFsIHVzZS1hZnRlci1m
cmVlIGFuZCBkb3VibGUtZnJlZSByZWdyZXNzaW9uIHdoZW4gaGFuZGxpbmcgSTNDCmRldmljZSBy
ZWdpc3RyYXRpb24gZmFpbHVyZXMuCgpJZiBkZXZpY2VfcmVnaXN0ZXIoKSBmYWlscyBpbiBpM2Nf
bWFzdGVyX3JlZ2lzdGVyX25ld19pM2NfZGV2cygpLCBwdXRfZGV2aWNlKCkKaXMgY2FsbGVkIHRv
IGZyZWUgZGVzYy0+ZGV2OgoKZHJpdmVycy9pM2MvbWFzdGVyLmM6aTNjX21hc3Rlcl9yZWdpc3Rl
cl9uZXdfaTNjX2RldnMoKSB7CiAgICAuLi4KCQlyZXQgPSBkZXZpY2VfcmVnaXN0ZXIoJmRlc2Mt
PmRldi0+ZGV2KTsKCQlpZiAocmV0KSB7CgkJCWRldl9lcnIoJm1hc3Rlci0+ZGV2LAoJCQkJIkZh
aWxlZCB0byBhZGQgSTNDIGRldmljZSAoZXJyID0gJWQpXG4iLCByZXQpOwoJCQlwdXRfZGV2aWNl
KCZkZXNjLT5kZXYtPmRldik7CgkJfQogICAgLi4uCn0KCkhvd2V2ZXIsIGRlc2MtPmRldiBpcyBu
b3Qgc2V0IHRvIE5VTEwgYWZ0ZXIgYmVpbmcgZnJlZWQsIGxlYXZpbmcgYSBkYW5nbGluZwpwb2lu
dGVyIG9uIHRoZSBtYXN0ZXIncyBidXMgbGlzdC4KCklmIHRoZSBtYXN0ZXIgaXMgbGF0ZXIgdW5y
ZWdpc3RlcmVkLCBpM2NfbWFzdGVyX3VucmVnaXN0ZXJfaTNjX2RldnMoKSBpdGVyYXRlcwpvdmVy
IHRoZSBidXMgbGlzdCBhbmQgYWNjZXNzZXMgdGhpcyBkYW5nbGluZyBwb2ludGVyOgoKZHJpdmVy
cy9pM2MvbWFzdGVyLmM6aTNjX21hc3Rlcl91bnJlZ2lzdGVyX2kzY19kZXZzKCkgewogICAgLi4u
CglpM2NfYnVzX2Zvcl9lYWNoX2kzY2RldigmbWFzdGVyLT5idXMsIGkzY2RldikgewoJCWlmICgh
aTNjZGV2LT5kZXYpCgkJCWNvbnRpbnVlOwoKCQlpM2NkZXYtPmRldi0+ZGVzYyA9IE5VTEw7CgkJ
aWYgKGRldmljZV9pc19yZWdpc3RlcmVkKCZpM2NkZXYtPmRldi0+ZGV2KSkKCQkJZGV2aWNlX3Vu
cmVnaXN0ZXIoJmkzY2Rldi0+ZGV2LT5kZXYpOwoJCWVsc2UKCQkJcHV0X2RldmljZSgmaTNjZGV2
LT5kZXYtPmRldik7CgkJaTNjZGV2LT5kZXYgPSBOVUxMOwoJfQogICAgLi4uCn0KCkNvdWxkIHRo
aXMgc2VxdWVuY2UgbGVhZCB0byB3cml0aW5nIHRvIGZyZWVkIG1lbW9yeSB3aGVuIHNldHRpbmcK
aTNjZGV2LT5kZXYtPmRlc2MgdG8gTlVMTCwgZm9sbG93ZWQgYnkgYSBkb3VibGUtZnJlZSB3aGVu
IHB1dF9kZXZpY2UoKSBpcwpjYWxsZWQgYWdhaW4/CgpXb3VsZCBpdCBiZSBzYWZlciB0byBjbGVh
ciB0aGUgZGVzYy0+ZGV2IHBvaW50ZXIgaW4gdGhlIGVycm9yIHBhdGggb2YKaTNjX21hc3Rlcl9y
ZWdpc3Rlcl9uZXdfaTNjX2RldnMoKSBhZnRlciB0aGUgaW5pdGlhbCBwdXRfZGV2aWNlKCkgY2Fs
bD8KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hz
ZXQvMjAyNjA4MTQxMzQwMjcuMTM4NjgxOC0xLXJ1b3l1dzU2MEBnbWFpbC5jb20/cGFydD0xCgot
LSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
