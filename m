Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C12DFC53219
	for <linux-i3c@archiver.kernel.org>; Tue, 28 Jul 2026 17:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tuaUai+aamqHbLjsvrx22aw0VDId2EacjsDAvj+ucl4=; b=NzRbtHyDCDMqGx
	+LAPZLTz100qpywfDpYdCbLPL1G7OigbZcpat1ny9JziQE7dPtFjAv7/ny3+LJMdohmUxatmLXspc
	w6SgG8+x6ih8nLwWIZ2U34wnXGB8Vtdkw3FRP4TtPg0X4EGKGUwOYtKWgMkJbcbHvlSvMIUb9FjzD
	AA1ykLHV5dIZ/aCtbzTTBWSdA/44hUq+rzbOnp5nIiJMsdV8+ft5mI9Cbtb7bx51gZ4lRMjFO15uu
	swccAyI6B7n2YTeQR/0mU3xUy3up+Sm6uyZwGb/jarGTwntPR2limC7qA6gXnZS4DpixU6KbEL+ua
	w29F9Gx7eOCsJ93vpfsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wolVn-00000005wBq-1uQr;
	Tue, 28 Jul 2026 17:22:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wolVm-00000005wBk-3RLa
	for linux-i3c@lists.infradead.org;
	Tue, 28 Jul 2026 17:22:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3F02F43A1D;
	Tue, 28 Jul 2026 17:22:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8A8A1F000E9;
	Tue, 28 Jul 2026 17:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785259358;
	bh=UJcjWXc+4UHApFMcCPAeuW6IBHXear6VvPmeU4H1coQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KP1wn/WU75+6fth0IYsAXYoFV5Rt9+JvgG/KJ/COJj47dfThcG7sViOaPzK84irhY
	 +3bn1Ggc5x+MtIQ/3ncQressV/MnHUKQJmaVyn/s4voBs0dHGSfIEumfwm2HVNoJ7h
	 x7m/jsnBF+5gnPElDzGvASfe1k0M+i98xOsHW9uccfteDzOVv/B5+IyVhmlkVPBUIT
	 V0CjKaR8KiIeNoAjyZU8VNr4Enhs2Xt7sdxuOKQfKjocmx/Bw50PfUtv3GD/vVIZEq
	 /7EWXqfdzMZv+qtV1znEHgg9Fq/xqLu6dPUkxa5jjVsZxAnBKARMht9JLT0ZhYakHd
	 ctXM+DVGsBG5A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V2 7/8] i3c: mipi-i3c-hci: Factor out i3c_hci_sysdev()
To: "Adrian Hunter" <adrian.hunter@intel.com>
Cc: linux-i3c@lists.infradead.org, Frank.Li@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, linux-pci@vger.kernel.org
In-Reply-To: <20260728155308.142713-8-adrian.hunter@intel.com>
References: <20260728155308.142713-1-adrian.hunter@intel.com>
 <20260728155308.142713-8-adrian.hunter@intel.com>
Date: Tue, 28 Jul 2026 17:22:37 +0000
Message-Id: <20260728172237.C8A8A1F000E9@smtp.kernel.org>
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
czovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA3MjgxNTUzMDguMTQyNzEzLTEtYWRyaWFu
Lmh1bnRlckBpbnRlbC5jb20/cGFydD03CgoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGlu
dXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1pM2MK
