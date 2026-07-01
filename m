Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73960C43458
	for <linux-i3c@archiver.kernel.org>; Wed,  1 Jul 2026 20:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+o/bKRC7zLtLYAxhSQvGeLGa9g6VRu8U7CDjK8rtATs=; b=1sRLzaHxczCQIb
	h4aj2nAu2UUiRlxaPxIMb+8MQgQIgQ9V0KN1ABBMilG0svUgWKk9H8+WD3VMOoGlUGcPi/TyFIDNh
	1+bsjINwkVgXzyoJ9gMtDCMhW5bRhKrXoM2nFKDFF9ANFlJDIfh1bHbPCLXaVZif0adOzWD/UkNA6
	LQXRt2uEb98hBERoI98PY1VHi9Z+zFht9W6yZPg3xlwE9u1z0oVcBc2BR/eorfJ6nN80N0s5pMJhX
	g5jEGat3WjL78IgWPQ+1zCYg8roO4J0I11eFmxKuwiCm99cWz9p/QJXUD/drGId53zYqJ4xuOZwQX
	3lDpyx3l14GQ24ScNAJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1cN-00000002yCR-0rW5;
	Wed, 01 Jul 2026 20:33:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1cM-00000002yCJ-0odi
	for linux-i3c@lists.infradead.org;
	Wed, 01 Jul 2026 20:33:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A001243C9E;
	Wed,  1 Jul 2026 20:33:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CBB61F000E9;
	Wed,  1 Jul 2026 20:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782937989;
	bh=W0LPrFc2mvdH2vwuLAN6uxuEtvpydIp1QwXC7DaefBQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EQKQ98ZBgsnnJc8hP8TpRhjv4myN3hYR/7xEN2A7DldKRqNIdV17YRz23XKyHCkxI
	 uTIxTb6Fx9Rr2QieFBsAsD7k5KAzaV9bc/+HaXzYTlYqfMhR79U2RcFcpcVmxyf2V2
	 JBc2MVE8QEx0STuAOM0g0gdxfayKeNA/mjq06G+quCesk6AVsnKgIRRaJyKyFjilku
	 TxyWm7CLxQsX4/me+JpNng697cZ90UIs1hoaNXvisLZ9QuV9by8u8SnsReLIRGLSWC
	 mhJDQ1iC8sPqs9DYTpeREoDM68CjXod0IMjGj3DhMcHa8SC1ya6T/7F6XEOlmDhhx5
	 yhiykdDJ4RaHA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC RESEND 5/7] i3c: mipi-i3c-hci-pci: Propagate I3C
 wakeup requirements to PCI
To: "Adrian Hunter" <adrian.hunter@intel.com>
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, linux-i3c@lists.infradead.org, linux-pci@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260701201533.220818-6-adrian.hunter@intel.com>
References: <20260701201533.220818-1-adrian.hunter@intel.com>
 <20260701201533.220818-6-adrian.hunter@intel.com>
Date: Wed, 01 Jul 2026 20:33:08 +0000
Message-Id: <20260701203309.3CBB61F000E9@smtp.kernel.org>
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

PiBLZWVwIHRoZSBQQ0kgd2FrZXVwIHN0YXRlIGFsaWduZWQgd2l0aCB0aGUgd2FrZXVwIHJlcXVp
cmVtZW50cyBvZiB0aGUKPiBkZXZpY2VzIHNlcnZlZCBieSB0aGUgY29udHJvbGxlcihzKS4KPiAK
PiBUaGUgUENJIGZ1bmN0aW9uIGlzIHRoZSB3YWtldXAgc291cmNlIGZvciBIQ0kgaW5zdGFuY2Vz
IGV4cG9zZWQgYmVuZWF0aAo+IGl0LiAgSG93ZXZlciwgd2FrZXVwIGlzIG9ubHkgbmVlZGVkIHdo
ZW4gYXQgbGVhc3Qgb25lIGF0dGFjaGVkIEkzQyBkZXZpY2UKPiBpcyBlbmFibGVkIGFzIGEgd2Fr
ZXVwIHNvdXJjZS4KPiAKPiBEdXJpbmcgc3VzcGVuZCwgY2hlY2sgd2hldGhlciBhbnkgSENJIGlu
c3RhbmNlIGhhcyBhIHdha2V1cC1lbmFibGVkIEkzQwo+IGRldmljZSBhbmQgZW5hYmxlIHdha2V1
cCBmb3IgdGhlIFBDSSBmdW5jdGlvbiBvbmx5IGluIHRoYXQgY2FzZS4KPiBPdGhlcndpc2UgbGVh
dmUgUENJIHdha2V1cCBkaXNhYmxlZC4KPiAKPiBOb3RlLCB0aGUgc3VzcGVuZCBjYWxsYmFjayBp
cyB1c2VkIGZvciBib3RoIHN5c3RlbSBhbmQgcnVudGltZSBzdXNwZW5kLgo+IEFsdGhvdWdoIHRo
aXMgY2hhbmdlIG1heSB1cGRhdGUgdGhlIFBDSSB3YWtldXAgc3RhdGUgZHVyaW5nIHJ1bnRpbWUK
PiBzdXNwZW5kLCBpdCBkb2VzIHNvIG9ubHkgd2hlbiB0aGUgcmVxdWlyZWQgd2FrZXVwIHN0YXRl
IGNoYW5nZXMuCj4gTW9yZW92ZXIsIFBDSSB3YWtldXAtY2FwYWJsZSBkZXZpY2VzIGFscmVhZHkg
aGF2ZSBQTUUgd2FrZXVwIGFybWVkIGZvcgo+IHJ1bnRpbWUgc3VzcGVuZCwgc28gY2hhbmdpbmcg
dGhlIHdha2V1cC1lbmFibGVkIHN0YXRlIGRvZXMgbm90IGFmZmVjdAo+IHJ1bnRpbWUgUE0gd2Fr
ZXVwIGJlaGF2aW9yLgo+IAo+IE5vdGUgYWxzbywgc2luY2UgdGhlIFBDSSB3YWtldXAgc3RhdGUg
aXMgZGVyaXZlZCBmcm9tIHRoZSB3YWtldXAKPiBjb25maWd1cmF0aW9uIG9mIHRoZSBhdHRhY2hl
ZCBJM0MgZGV2aWNlcywgdGhlIFBDSSBkZXZpY2UgcG93ZXIvd2FrZXVwCj4gc3lzZnMgYXR0cmli
dXRlIG5vIGxvbmdlciBwcm92aWRlcyBpbmRlcGVuZGVudCB3YWtldXAgY29udHJvbC4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBBZHJpYW4gSHVudGVyIDxhZHJpYW4uaHVudGVyQGludGVsLmNvbT4KClNh
c2hpa28gaGFzIHJldmlld2VkIHRoaXMgcGF0Y2ggYW5kIGZvdW5kIG5vIGlzc3Vlcy4gSXQgbG9v
a3MgZ3JlYXQhCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8j
L3BhdGNoc2V0LzIwMjYwNzAxMjAxNTMzLjIyMDgxOC0xLWFkcmlhbi5odW50ZXJAaW50ZWwuY29t
P3BhcnQ9NQoKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtaTNjCg==
