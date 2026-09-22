Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 872DEC982FA
	for <linux-i3c@archiver.kernel.org>; Tue, 22 Sep 2026 10:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T3CDksXJLUatszLQuisaUB6vF1peYAwdOh0kAYzUGus=; b=mRZKsaV/XYagEV
	JXgtRfx3VbzbWEcpDcfy32IIOud1Q3wg93vqu8vsicPkEBuutTflaXhiGapNheU2OLESWnT053IuS
	neROIAerfKqCaLoko2gy1OtPqwMfGVmm/DZBoBRGZj+yVZLMOfM3OrnXPE17cR+XgwJyVVP8T8LfS
	73c+mRyc2Nh5WR5E3+I760YMi04/Q409CuNFEMysSSK0e2pBGmocciS5n9CjbxwsWZqswhb8BQdzg
	I8WQ0wEpUV1DkVfCJMOG2DkU/ZlrJx2uX32o3cp2+w/8AAy/zHljUcr5msJP2fw5oYY6PTnAJUevO
	WalhFEvEvL81c9NAQpRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yAD-000000057Vh-0vDy;
	Tue, 22 Sep 2026 10:55:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yAC-000000057VV-0L8o
	for linux-i3c@lists.infradead.org;
	Tue, 22 Sep 2026 10:55:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 84866601F7;
	Tue, 22 Sep 2026 10:55:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4DE61F000FF;
	Tue, 22 Sep 2026 10:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790074551;
	bh=WjZJYL0KSzKkxVJs6Abzz+ePqx/kRAYd3uRB5n+/G10=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RORMbBMIr/BUpUTUW/4uIAeYN+e5LOzFVYHaGfXL61ggdGUZlSEQB++KKikJq585V
	 SAkSgXwcBdVaomHbpszt9qN6kfQ11mY9eHVWqmt/mYgqsLbUNzmwGhoQpUa8U0wdAQ
	 a/qDk+jAMPmmBFOIqe8nvytJjKHeSmoec4wZg8lIfrULNlkbYrQmj++LYzv/S0cIgt
	 l+qLB2234LgvsAxekxUIHACK2ypA4hrvb0OjoI0aeFPLpJBbqY+KgtnaoLQm1NEi4q
	 QWF4Irksw2+FpA5pJiwh70y23TcB20hOikig0rcoh/lDY4molLEpuzRd7u9LF+bsUR
	 dSQ3kzplIY24Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v20 8/8] i3c: hub: p3h2x4x: Add SMBus slave mode support
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: Frank.Li@kernel.org, lee@kernel.org, conor+dt@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, linux-i3c@lists.infradead.org, mfd@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260922103551.2754613-9-lakshay.piplani@nxp.com>
References: <20260922103551.2754613-1-lakshay.piplani@nxp.com>
 <20260922103551.2754613-9-lakshay.piplani@nxp.com>
Date: Tue, 22 Sep 2026 10:55:50 +0000
Message-Id: <20260922105550.B4DE61F000FF@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gaTNjOiBodWI6IHJh
Y2UgY29uZGl0aW9uIGluIFcxQyByZWdpc3RlciBkcm9wcyBTTUJ1cyBwYWNrZXRzIG9uIG92ZXJm
bG93Ci0tCgpjb21taXQgYzNjNTg0MjI3Y2E5YWVhNDRmZjEwZWEzMTRlZGRlZTdjYzFhZTdhOQpB
dXRob3I6IExha3NoYXkgUGlwbGFuaSA8bGFrc2hheS5waXBsYW5pQG54cC5jb20+CgppM2M6IGh1
YjogcDNoMng0eDogQWRkIFNNQnVzIHNsYXZlIG1vZGUgc3VwcG9ydAoKVGhpcyBjb21taXQgYWRk
cyBTTUJ1cyBzbGF2ZSBtb2RlIHN1cHBvcnQgZm9yIHRoZSBQM0gyeDR4IGh1YiBTTUJ1cyB0YXJn
ZXQKcG9ydHMsIGFsbG93aW5nIGl0IHRvIHJlY2VpdmUgZG93bnN0cmVhbSBwYXlsb2FkcyBhbmQg
cmVwb3J0IHRoZW0gdmlhIElCSS4KVGhlIHBheWxvYWRzIGFyZSB0aGVuIGZvcndhcmRlZCB0byB0
aGUgcmVnaXN0ZXJlZCBJMkMgc2xhdmUgY2xpZW50LgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9p
M2MvaHViL3AzaDI4NDBfaTNjX2h1Yl9zbWJ1cy5jIGIvZHJpdmVycy9pM2MvaHViL3AzaDI4NDBf
aTNjX2h1Yl9zbWJ1cy5jCj4gaW5kZXggYTMzMjRjYzM2NTk1Ni4uN2ZkZmE3OWRmZWI2YyAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2kzYy9odWIvcDNoMjg0MF9pM2NfaHViX3NtYnVzLmMKPiArKysg
Yi9kcml2ZXJzL2kzYy9odWIvcDNoMjg0MF9pM2NfaHViX3NtYnVzLmMKWyAuLi4gXQo+IEBAIC0x
NSw2ICsxNywxNzggQEAgZW51bSBwM2gyeDR4X3NtYnVzX2Rlc2NfaWR4IHsKWyAuLi4gXQo+ICsJ
CWNhc2UgUDNIMlg0WF9UQVJHRVRfQlVGX09WUkZMX1ZBTDoKPiArCQkJcDNoMng0eF9yZWFkX3Nt
YnVzX2FnZW50X3J4X2J1ZihpM2NkZXYsIFJDVl9CVUZfMCwgaSk7Cj4gKwkJCXAzaDJ4NHhfcmVh
ZF9zbWJ1c19hZ2VudF9yeF9idWYoaTNjZGV2LCBSQ1ZfQlVGXzEsIGkpOwo+ICsJCQlyZWdtYXBf
d3JpdGUocDNoMng0eF9pM2NfaHViLT5yZWdtYXAsIFAzSDJYNFhfVFAwX1NNQlVTX0FHTlRfU1RT
ICsgaSwKPiArCQkJCSAgICAgUDNIMlg0WF9UQVJHRVRfQlVGX09WUkZMKTsKCltTZXZlcml0eTog
TWVkaXVtXQpEb2VzIHRoaXMgd3JpdGUgY2xlYXIgbmV3bHkgcmVjZWl2ZWQgcGFja2V0cyBvbiBv
dmVyZmxvdz8KCklmIGFuIGV4dGVybmFsIGRldmljZSBzZW5kcyBhIGJ1cnN0IG9mIHBhY2tldHMs
IGNhdXNpbmcgYW4gb3ZlcmZsb3cgKGJpdHMgMSwgMiwKYW5kIDMgc2V0IGluIHRoZSBzdGF0dXMg
cmVnaXN0ZXIpLCB0aGUgSUJJIGhhbmRsZXIgcmVhZHMgYnVmZmVyIDAgKHdoaWNoIGNsZWFycwpi
aXQgMSB2aWEgYSBXcml0ZS0xLXRvLUNsZWFyKSBhbmQgYnVmZmVyIDEgKHdoaWNoIGNsZWFycyBi
aXQgMikuCgpJZiB0aGUgaGFyZHdhcmUgcmVjZWl2ZXMgYSBuZXcgcGFja2V0IGludG8gYnVmZmVy
IDAgaW4gdGhlIHNtYWxsIHdpbmRvdyBiZWZvcmUKdGhlIG92ZXJmbG93IGZsYWcgaXMgY2xlYXJl
ZCwgYml0IDEgaXMgc2V0IGFnYWluIGJ5IHRoZSBoYXJkd2FyZS4gVGhlIGRyaXZlcgp0aGVuIGV4
ZWN1dGVzIHRoZSByZWdtYXBfd3JpdGUoKSB0byBjbGVhciB0aGUgb3ZlcmZsb3cgc3RhdGUuCgpC
ZWNhdXNlIFAzSDJYNFhfVEFSR0VUX0JVRl9PVlJGTCBpcyBkZWZpbmVkIGFzIEdFTk1BU0soMywg
MSksIGl0IHdyaXRlcyAnMScgdG8KYml0cyAxLCAyLCBhbmQgMy4gU2luY2UgdGhlIHJlZ2lzdGVy
IHVzZXMgVzFDIHNlbWFudGljcywgdGhpcyBzZWNvbmQgd3JpdGUKaW5hZHZlcnRlbnRseSBjbGVh
cnMgdGhlIG5ld2x5IHNldCBiaXQgMSwgcGVybWFuZW50bHkgZHJvcHBpbmcgdGhlIG5ldyBwYWNr
ZXQKd2l0aG91dCByZWFkaW5nIGl0LgoKPiArCQkJZGV2X2VycigmaTNjZGV2LT5kZXYsICJPdmVy
ZmxvdywgcmVhZGluZyBidWZmZXIgemVybyBhbmQgb25lXG4iKTsKPiArCQkJYnJlYWs7CgotLSAK
U2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYw
OTIyMTAzNTUxLjI3NTQ2MTMtMS1sYWtzaGF5LnBpcGxhbmlAbnhwLmNvbT9wYXJ0PTgKCi0tIAps
aW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
