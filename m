Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC536C5B572
	for <linux-i3c@archiver.kernel.org>; Wed, 19 Aug 2026 05:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=09JBP65AoSH4eaT2n4hogp61CflQ7v3iJFSCpi2JU94=; b=OnkwtDYxMkiTeM
	hzTY4JgGoevgVj7Po/jyWjFiQ+r3a9T7EMthYrCFbqZEVV05sPXO/C9p/No7y2SrsGnF5ck/CYeHO
	gZigOpH4LdkWdoIlHdkFA5HsqVHJGSsgJjna69KPQZRRLeJjFZojCWj1ltr58lkkPIOhPtD0Wiv2W
	boO5m3VRAEGpcrAqp54DGpRRYBBxf8kBXQFGJpiytCTlIgCdSdigZGkAjkHczWV5dC+j66RwHmUVN
	cDdvmASUqaH+f6wgZr2QwzNkkMyA7Qc5d/LduN+xSDyxj9bkXvg0eNHKQ4jJ4cLgpI436c2y7c4QT
	CQ3R4Kj4VvtkNkUqT14A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwYke-000000090hZ-12gV;
	Wed, 19 Aug 2026 05:22:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwYkc-000000090hT-3C3e
	for linux-i3c@lists.infradead.org;
	Wed, 19 Aug 2026 05:22:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D17DB601FB;
	Wed, 19 Aug 2026 05:22:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BA2F1F000E9;
	Wed, 19 Aug 2026 05:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787116929;
	bh=5Nbp/8R8qNLUU8OQrfVfRdZOFgMu60dxQj0HK4nXqUQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IPoePco88GtCd0G1AjleULgvdIoeURBjSV26UxHswVLYDf2L0eD95apNtF5g+3vgb
	 HhGmshTrcT4x+j0h7zQ3b9kDt70f7KmrONYsoeqh8WME3Rp8ZjOuv3Dnh9izPJEocI
	 +QeHp69isFMft53WubAoY+jN5zXc62LaN1nSGxKf9hF64bv0vqcQfWJyJixRpKTB1g
	 OKUvvNR+SrZkQo+jPSh9gcPwxpoOjkvVLHVBllaSmb9tSxF7W/yRTWVLzpgnrDlSLO
	 0PltzD6KaggSsGbU1QNmANTGrBW3a6JV1R0HVCtllXQyRw0vy1yXkl5GlwnwBDPUa+
	 VeXR7gW7fiq+g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] i3c: dw: reduce do_daa time if there's no client
To: "Jisheng Zhang" <jszhang@kernel.org>
Cc: Frank.Li@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, linux-i3c@lists.infradead.org
In-Reply-To: <20260819044833.32611-1-jszhang@kernel.org>
References: <20260819044833.32611-1-jszhang@kernel.org>
Date: Wed, 19 Aug 2026 05:22:08 +0000
Message-Id: <20260819052209.5BA2F1F000E9@smtp.kernel.org>
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
IFtIaWdoXSBQcmVleGlzdGluZyBidWc6IGBkd19pM2NfbWFzdGVyX2RhYWAgYXNzdW1lcyBgbWFz
dGVyLT5mcmVlX3Bvc2AgaXMgY29udGlndW91cy4gQSBmcmFnbWVudGVkIERBVCBjYW4gY2F1c2Ug
dGhlIGhhcmR3YXJlIHRvIG92ZXJ3cml0ZSBleGlzdGluZyBkZXZpY2VzIGFuZCB0aGUgc29mdHdh
cmUgdG8gZHJvcCBuZXdseSBhc3NpZ25lZCBkZXZpY2VzLgotLQoKLS0tIFBhdGNoIFsxXTogW1BB
VENIIHYzXSBpM2M6IGR3OiByZWR1Y2UgZG9fZGFhIHRpbWUgaWYgdGhlcmUncyBubyBjbGllbnQg
LS0tCmNvbW1pdCBlMzE2MTFlNzc5NDM0NTdhZGU2YzgxMmMxZTQ5ZTZlZmM5ZTAxY2UyCkF1dGhv
cjogSmlzaGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJuZWwub3JnPgoKaTNjOiBkdzogcmVkdWNlIGRv
X2RhYSB0aW1lIGlmIHRoZXJlJ3Mgbm8gY2xpZW50CgpUaGlzIGNvbW1pdCBtb2RpZmllcyBkd19p
M2NfbWFzdGVyX2RhYSgpIHRvIGluaXRpYWxpemUgY21kLT5yeF9sZW4gdG8KbWFzdGVyLT5tYXhk
ZXZzLiBUaGlzIHByZXZlbnRzIHRoZSBkcml2ZXIgZnJvbSBhdHRlbXB0aW5nIHRvIGFkZCBub25l
eGlzdGVudApkZXZpY2VzIHdoZW4gYW4gYWRkcmVzcyBhc3NpZ25tZW50IGNvbW1hbmQgdGltZXMg
b3V0IG9uIGFuIGVtcHR5IGJ1cy4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci9k
dy1pM2MtbWFzdGVyLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvZHctaTNjLW1hc3Rlci5jCj4gaW5k
ZXggMGEzNzk5YTRjZTg3Mi4uNDU2M2Q4NzYxYmEwYiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2kz
Yy9tYXN0ZXIvZHctaTNjLW1hc3Rlci5jCj4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyL2R3LWkz
Yy1tYXN0ZXIuYwo+IEBAIC05MjEsNiArOTIxLDcgQEAgc3RhdGljIGludCBkd19pM2NfbWFzdGVy
X2RhYShzdHJ1Y3QgaTNjX21hc3Rlcl9jb250cm9sbGVyICptKQo+ICAJCWdvdG8gcnBtX291dDsK
PiAgCX0KPiAgCWNtZCA9ICZ4ZmVyLT5jbWRzWzBdOwo+ICsJY21kLT5yeF9sZW4gPSBtYXN0ZXIt
Pm1heGRldnM7Cj4gIAljbWQtPmNtZF9oaSA9IENPTU1BTkRfUE9SVF9UUkFOU0ZFUl9BUkc7Cj4g
IAljbWQtPmNtZF9sbyA9IENPTU1BTkRfUE9SVF9ERVZfQ09VTlQobWFzdGVyLT5tYXhkZXZzIC0g
cG9zKSB8Cj4gIAkJICAgICAgQ09NTUFORF9QT1JUX0RFVl9JTkRFWChwb3MpIHwKCltTZXZlcml0
eTogSGlnaF0KVGhpcyBpcyBhIHByZS1leGlzdGluZyBpc3N1ZSwgYnV0IGRvZXMgdGhpcyBoYXJk
d2FyZSBpbnN0cnVjdGlvbiBzYWZlbHkgaGFuZGxlCmZyYWdtZW50ZWQgRGV2aWNlIEFkZHJlc3Mg
VGFibGVzIChEQVQpPwoKSWYgbWFzdGVyLT5mcmVlX3BvcyBpcyBmcmFnbWVudGVkIChmb3IgZXhh
bXBsZSwgZGV2aWNlcyBhcmUgcHJlc2VudCBhdCBpbmRleCAwCmFuZCAyLCBidXQgaW5kZXggMSBp
cyBkZXRhY2hlZCksIGR3X2kzY19tYXN0ZXJfZ2V0X2ZyZWVfcG9zKCkgcmV0dXJucyBwb3MgPSAx
LgpUaGUgaGFyZHdhcmUgaXMgdGhlbiBpbnN0cnVjdGVkIHRvIGFzc2lnbiBhZGRyZXNzZXMgc2Vx
dWVudGlhbGx5IGZvciAKbWFzdGVyLT5tYXhkZXZzIC0gMSBkZXZpY2VzIHN0YXJ0aW5nIGF0IERF
Vl9JTkRFWCAxLgoKSWYgdGhlIERlc2lnbldhcmUgSTNDIGhhcmR3YXJlIHNlcXVlbnRpYWxseSBp
dGVyYXRlcyBmcm9tIERFVl9JTkRFWCB3aXRob3V0CnNraXBwaW5nIG9jY3VwaWVkIHNsb3RzLCB3
b24ndCBpdCBhc3NpZ24gYSBuZXcgZGV2aWNlIHRvIHRoZSBwcmUtZXhpc3RpbmcKYWRkcmVzcyBh
dCBEQVRbMl0gZHVyaW5nIGEgREFBIChsaWtlIEhvdC1Kb2luKSwgY2F1c2luZyBhIGJ1cyBjb2xs
aXNpb24/CgpGdXJ0aGVybW9yZSwgbG9va2luZyBsYXRlciBpbiBkd19pM2NfbWFzdGVyX2RhYSgp
OgoKCW5ld2RldnMgJj0gfm9sZGRldnM7CgpJZiB0aGUgaGFyZHdhcmUgc2VxdWVudGlhbGx5IG92
ZXJ3cm90ZSBzbG90IDIsIHRoYXQgaW5kZXggd2FzIG9yaWdpbmFsbHkgaW4Kb2xkZGV2cyBhbmQg
aXMgbm93IG1hc2tlZCBvdXQgYnkgdGhpcyBjYWxjdWxhdGlvbi4gV29uJ3QgdGhlIGRyaXZlciB0
aGVuCnNpbGVudGx5IGRyb3AgdGhlIG5ld2x5IGFzc2lnbmVkIGRldmljZSBzaW5jZSBpdCBnZXRz
IGNsZWFyZWQgZnJvbSB0aGUKbmV3ZGV2cyBiaXRtYXNrPwoKLS0gClNhc2hpa28gQUkgcmV2aWV3
IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDgxOTA0NDgzMy4zMjYxMS0x
LWpzemhhbmdAa2VybmVsLm9yZz9wYXJ0PTEKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0Cmxp
bnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
