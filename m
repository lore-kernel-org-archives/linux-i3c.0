Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75094C5518F
	for <linux-i3c@archiver.kernel.org>; Tue,  4 Aug 2026 14:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eVhxz8IdHSStBhf2vFsnIw/m1JPf6VHvhrLwLOrBU3M=; b=Lcu3rCkDaYWDvX
	s4s1j266S2iEONBN98AYvwRa6IWKvVV8otNrNFH6JbnTjr91A3o8x2x3WBhc/xz/ktrfQGpqPbGFe
	Z/S5QDBxhmvplq2kF2wOj8XEFxO3DKuNas9SX2e38OvQXCb7w1j596vdoARwhgZBl7sSxIG8hSH4D
	lexSJzXCeHF132NLhqn5lZAcjmUXFsJgMAAIbWnSqgG6mlv9n70CqRdlcDH/Zd4hYhr9RlVS72Owu
	FowQSQRswDItpwlaHpefbTZpWpv0NUxqryN612tcUL5b0i1kwohQq3c8H+MMuaY2D3FUOidqqJU5l
	7bKmVZEEJ6kE5mLPdn/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrGKD-000000026cq-3ifs;
	Tue, 04 Aug 2026 14:41:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrGKC-000000026cR-1RLI
	for linux-i3c@lists.infradead.org;
	Tue, 04 Aug 2026 14:41:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B0F65405E6;
	Tue,  4 Aug 2026 14:40:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 474C71F000E9;
	Tue,  4 Aug 2026 14:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785854459;
	bh=lz697MiEZejSdiaZFCI3xzVFWQtMSBeoXw2TNQ2kOqc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RrbJM0hdYT9FMNrXwVid1N72nfxHkqKOYFW+x9vaE2qFMMd5MMfq0YtWrLBYcOswH
	 lJPB30QeOs0iaU359R+Drpi/GOygrbp4hxhRDv3nQ4fNlPTqE5pQ9JotRnJsCP5J66
	 wTujUZJhoJ4nU9XaofXAvNcluk0U2BOR2aOvWQmsRIN1PiAqaHGdqyOmcxSTFpkg7c
	 TA0Gquq+gJAuLWN6qAv+UJGE5xcWFrB906afdR97ROvu1c+3AXTljblazDG3bnp2Ad
	 j3bYoIpWB9FE6bgbEVOEZ/IETa8FQ0XX1XG3djfR+bHoEGrZ4+5OH917p9pcvh4ntO
	 eIIWjYaYH4p8g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V3 13/14] i3c: mipi-i3c-hci: Factor out i3c_hci_sysdev()
To: "Adrian Hunter" <adrian.hunter@intel.com>
Cc: Frank.Li@kernel.org, linux-i3c@lists.infradead.org, linux-pci@vger.kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260804133810.184905-14-adrian.hunter@intel.com>
References: <20260804133810.184905-1-adrian.hunter@intel.com>
 <20260804133810.184905-14-adrian.hunter@intel.com>
Date: Tue, 04 Aug 2026 14:40:58 +0000
Message-Id: <20260804144059.474C71F000E9@smtp.kernel.org>
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
czovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA4MDQxMzM4MTAuMTg0OTA1LTEtYWRyaWFu
Lmh1bnRlckBpbnRlbC5jb20/cGFydD0xMwoKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0Cmxp
bnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
