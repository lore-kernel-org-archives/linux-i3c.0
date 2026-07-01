Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37809C43458
	for <linux-i3c@archiver.kernel.org>; Wed,  1 Jul 2026 20:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ijg/Mmd90/z2hlmvTXoXpzATUoSwuDzSxDP+a8NsMxs=; b=5CIM9+kBg4tFyv
	d67GNqA4qZAFzQMpzfIjDdyUNFlqs/UphMOWEOKnBS4e03GtGME9NSxVJSAHNu4lTO4j2I2A9wBwH
	0aJNi4PjRiEDvVbWlai1FOTX/cFGxVsSmkE42Ye7Wl1JZy6zojbbT5TQyWGoyYuXyAW5MSN1eyMZt
	Tl+luk9BYSGJSeXf+wGCGs5Ln8b0mv6/k20HuEO4vzi1S9IQZeQX+srZD3OqbLTEte/9Fn56voyK+
	ymQ42OWfUrcjupFoMKTp0GyLSl7WkOBAzpYGc0u5/2gM7E35Z42ScvqBCocc2optjZMzs/OJECn9B
	3ZCvyRyIiAe7crx6OuMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1Sg-00000002xn8-46TR;
	Wed, 01 Jul 2026 20:23:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1Sg-00000002xmw-2C92
	for linux-i3c@lists.infradead.org;
	Wed, 01 Jul 2026 20:23:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 25B6E43809;
	Wed,  1 Jul 2026 20:23:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA4C71F000E9;
	Wed,  1 Jul 2026 20:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782937390;
	bh=l0MbCq5Ag6y5Ty4pbQ6u9eyUbPK8/iUaV2dAiHRf42M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MXF5iRCegBo1fjuuwLZuHT79PTGXP43SJVSB0eNqR+Z2POaNFM7dqkRqlwz2YR3Os
	 gNxdFVACbpMkkNiQu7u/7rhFBUXGcAR8QODRvl/baAsHPvTygZYg0vP+lOaHOOZ0m/
	 fWajK3Wq+/GRQPylpGCjI5CgNsFaq5oO18ZHIancenLNBPY4gxFVDNLkfaoNRV5zbu
	 Hr2fjM7P1vTU9MHjBOeXWzw+rGV73BKA0cqSJ53glKe0Fgurr/1Fnc2qKWtH1KVT4d
	 8y67e6XkC22vVWuRL+1Uz+PQtb3ivs860idTPKdkLJ6jf7lkX0Z9kppGYsiJIVONfl
	 TkJgwCXTP/kSw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC RESEND 6/7] i3c: mipi-i3c-hci: Factor out
 i3c_hci_sysdev()
To: "Adrian Hunter" <adrian.hunter@intel.com>
Cc: linux-i3c@lists.infradead.org, Frank.Li@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, linux-pci@vger.kernel.org
In-Reply-To: <20260701201533.220818-7-adrian.hunter@intel.com>
References: <20260701201533.220818-1-adrian.hunter@intel.com>
 <20260701201533.220818-7-adrian.hunter@intel.com>
Date: Wed, 01 Jul 2026 20:23:09 +0000
Message-Id: <20260701202309.AA4C71F000E9@smtp.kernel.org>
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

PiBUaGUgTUlQSSBJM0MgSENJIGRyaXZlciBuZWVkcyB0byBpZGVudGlmeSB0aGUgdW5kZXJseWlu
ZyBzeXN0ZW0gZGV2aWNlCj4gdXNlZCBmb3IgRE1BIG1hcHBpbmcgYW5kIFBNIG9wZXJhdGlvbnMu
IFRoZSBsb2dpYyBmb3IgZGV0ZXJtaW5pbmcgdGhhdAo+IGRldmljZSBpcyBjdXJyZW50bHkgZW1i
ZWRkZWQgaW4gdGhlIERNQSBpbXBsZW1lbnRhdGlvbi4KPiAKPiBGYWN0b3IgdGhpcyBjb2RlIG91
dCBpbnRvIGkzY19oY2lfc3lzZGV2KCkgc28gaXQgY2FuIGJlIHNoYXJlZCBieSBvdGhlcgo+IHBh
cnRzIG9mIHRoZSBkcml2ZXIgYW5kIGtlZXAgdGhlIGRldmljZS1zZWxlY3Rpb24gbG9naWMgaW4g
b25lIHBsYWNlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFkcmlhbiBIdW50ZXIgPGFkcmlhbi5odW50
ZXJAaW50ZWwuY29tPgoKU2FzaGlrbyBoYXMgcmV2aWV3ZWQgdGhpcyBwYXRjaCBhbmQgZm91bmQg
bm8gaXNzdWVzLiBJdCBsb29rcyBncmVhdCEKCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRw
czovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA3MDEyMDE1MzMuMjIwODE4LTEtYWRyaWFu
Lmh1bnRlckBpbnRlbC5jb20/cGFydD02CgoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGlu
dXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1pM2MK
