Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DC9CDB479
	for <linux-i3c@archiver.kernel.org>; Wed, 24 Jun 2026 07:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GGycnRiBvs3i8z+z/h7UrLUZngazPHJA+WKiP5HudR4=; b=ecmt1JE+87yNOc
	qt4sjgfdUhRj33korOsv/PP/TOec9QiWUcV62UT8gpT5hOR2xyaslek4YRXaXNBf6Fgnvz3RDc5CG
	9OP/jni7MV4dcPfekAaVbNl04ffnpoF5u2MxuKio4deisw/MPKYCtu7h5SUhbHnFpN2qpbwVENV/f
	nDhiXWeBWlD3DUfIBk2r7phU+u4WsdzZrb0bmqui5nWdprExwz2nZowkBjti3mEebTgEPbu2O3G/+
	sAZinlLSuKTRsOPMgHiL6E1n/DD8nXnoMWhMzk9Z+miF8JboVKPeUmt0UZXRvrsfaW1pPDEv4NBmL
	c8BAYA/vc6SzzVkhiaww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcHhN-00000007H0d-22Ml;
	Wed, 24 Jun 2026 07:07:01 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcHhJ-00000007Gzf-3one
	for linux-i3c@lists.infradead.org;
	Wed, 24 Jun 2026 07:07:00 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0D1C81A090A;
	Wed, 24 Jun 2026 07:06:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D5593601C5;
	Wed, 24 Jun 2026 07:06:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B8A44106C8373;
	Wed, 24 Jun 2026 09:06:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782284812; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=t/MYXJlSVG1Z5SmTJh5V6eIBs7J1peYozBWO6nr4KlM=;
	b=OHt+zRUcUfC6ABxk321Qqqyo25cb9cgfzm/BFZlso8MBjXnHFhyzNROnse0N/5Nh8oRNw0
	/LRWUmdMd7kOaBFhsiWvjWBNsIE451Gk8BdV9ymSmSJTkgabkYYRwi9YhPG20oQTCASTlm
	Hq6nbG47SRaNmeMvlRRIZBnwGHn8qIpKTKzBW6nQxHsnFexK6NI3gWsIX0nxLyQcw5E6+Y
	YpknaPI15Flw5Gi+VYI3wrjktI1tfNp0RsGI62xi7QcJS6xyuo0FJwRQO77G4Q7wrApvcM
	jtIJgTjYBO4UGVEHrtLbVN4j6h/+58gNh/6t9CJXTFPefBVpD99DcjJyUWVS+Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Maoyi Xie <maoyixie.tju@gmail.com>,  Frank Li <Frank.Li@nxp.com>,
  Alexandre Belloni <alexandre.belloni@bootlin.com>,  Kaixuan Li
 <kaixuan.li@ntu.edu.sg>,  linux-i3c@lists.infradead.org,
  linux-kernel@vger.kernel.org,  stable@vger.kernel.org
Subject: Re: [PATCH] i3c: master: svc: bound IBI payload to the requested
 max_payload_len
In-Reply-To: <ajq6EgLq_B5YtPIu@lizhi-Precision-Tower-5810> (Frank Li's message
	of "Tue, 23 Jun 2026 12:53:38 -0400")
References: <178222990006.2767135.12462569914183698733@maoyixie.com>
	<ajq6EgLq_B5YtPIu@lizhi-Precision-Tower-5810>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 24 Jun 2026 09:06:49 +0200
Message-ID: <87h5msmn7a.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_000658_100387_16B5B0AB 
X-CRM114-Status: UNSURE (   4.56  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYyBiL2Ry
aXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jCj4+IGluZGV4IGUyZDk5YTNhYzA3ZC4u
NzQyMGJmYmRkMjU5IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1t
YXN0ZXIuYwo+PiArKysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYwo+PiBA
QCAtNDY1LDkgKzQ2NSwxMSBAQCBzdGF0aWMgaW50IHN2Y19pM2NfbWFzdGVyX2hhbmRsZV9pYmko
c3RydWN0IHN2Y19pM2NfbWFzdGVyICptYXN0ZXIsCj4+ICAJYnVmID0gc2xvdC0+ZGF0YTsKPj4K
Pj4gIAl3aGlsZSAoU1ZDX0kzQ19NU1RBVFVTX1JYUEVORChyZWFkbChtYXN0ZXItPnJlZ3MgKyBT
VkNfSTNDX01TVEFUVVMpKSAgJiYKPj4gLQkgICAgICAgc2xvdC0+bGVuIDwgU1ZDX0kzQ19GSUZP
X1NJWkUpIHsKPj4gKwkgICAgICAgc2xvdC0+bGVuIDwgZGV2LT5pYmktPm1heF9wYXlsb2FkX2xl
bikgewo+PiAgCQltZGF0YWN0cmwgPSByZWFkbChtYXN0ZXItPnJlZ3MgKyBTVkNfSTNDX01EQVRB
Q1RSTCk7Cj4+ICAJCWNvdW50ID0gU1ZDX0kzQ19NREFUQUNUUkxfUlhDT1VOVChtZGF0YWN0cmwp
Owo+PiArCQljb3VudCA9IG1pbl90KHVuc2lnbmVkIGludCwgY291bnQsCj4+ICsJCQkgICAgICBk
ZXYtPmliaS0+bWF4X3BheWxvYWRfbGVuIC0gc2xvdC0+bGVuKTsKPgo+IG5vdyBuZWVkbid0IG1p
bl90LCBvbmx5IG1pbigpIHNob3VsZCBiZSBnb29kCj4gc2VlOgo+IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2FsbC8yMDI1MTExOTIyNDE0MC44NjE2LTEtZGF2aWQubGFpZ2h0LmxpbnV4QGdtYWls
LmNvbS8KClRJTCwgdGhhbmtzIGZvciB0aGUgcG9pbnRlciBGcmFuayEKCk1pcXXDqGwKCi0tIAps
aW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
