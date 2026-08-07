Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 516FDC5AC7A
	for <linux-i3c@archiver.kernel.org>; Fri,  7 Aug 2026 15:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bH1rp6xMjv3khdV98Nsyj7Ab4InBfHQs3i0TNcSFa+k=; b=mi+4fpbZSKy1/6
	spgvXp9UGbwQe0Eb5N1e4JxRHyN4DCcJcj6Xksr65bk9fATmm2P7apZYYy6tut4ZGaPe946cg7nQH
	HLu0X7Slh6K6laO+jLKQPRGrg7LlkxczVjq91fRjjElcHNYYXFAUQ7lkJV21sQOd8M1RMyzJbyZzW
	DUJH9yrr5lObl3nlPQKLtCLUx8173tsk23sq8UI7KjPx6TKwCw8CET1PocHbVx1b36VksyUCrDqta
	4jjLUBRlMU0rllE/uuGax92ALLTqd2sHq5pv/PTYdAA/KGFyUd/fjHI5qWxvWPXOU9tgnJrQrjqmo
	hBz2IdBGNhtfEQU0JaOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMA3-00000008Jf3-42n2;
	Fri, 07 Aug 2026 15:07:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMA3-00000008Jev-00HU
	for linux-i3c@lists.infradead.org;
	Fri, 07 Aug 2026 15:07:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 73009600AF;
	Fri,  7 Aug 2026 15:07:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD3191F00A3A;
	Fri,  7 Aug 2026 15:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786115222;
	bh=6NNVVf3IV7XR6Fa9Y4h+izUYX9TB3VKqM1geJljLYcs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UaJAEMpObkH0HzrqqyoTCirPTUuBQPCCgUTSqr1o4HVT3+i1H63RI93f8mXwVr4Jt
	 cZsXmahPtYIE8Vmgmlij5RbyZM7Xmo3BjNE+FEzUNb5KuDnsxaKGQI5VliZf77Z6TZ
	 SxftBrUXP1AQn0p8SIajy70rQsrjUPrnqj5gJtEe5p1zUECVzz4CYbHSOpFoV5ynZ3
	 6Xq2KpcnSZ1WVnkv4EZWZJ84aEpB5VitG6gsWFTWYsdQDNq7v0cpu6JPF6prOi6YQq
	 JJNUDm9HZpGkRux8Tc0omCROmIZfMPHajzy7Bt6sd1PPO2I+TKR8t5X9qnVNlVp8wg
	 iRcBtAfyKgayQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V5 03/14] i3c: master: Do not treat master device as a
 duplicate target
To: "Adrian Hunter" <adrian.hunter@intel.com>
Cc: Frank.Li@kernel.org, linux-i3c@lists.infradead.org, linux-pci@vger.kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260807145638.168865-4-adrian.hunter@intel.com>
References: <20260807145638.168865-1-adrian.hunter@intel.com>
 <20260807145638.168865-4-adrian.hunter@intel.com>
Date: Fri, 07 Aug 2026 15:07:00 +0000
Message-Id: <20260807150701.DD3191F00A3A@smtp.kernel.org>
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

PiBpM2NfbWFzdGVyX3NlYXJjaF9pM2NfZGV2X2R1cGxpY2F0ZSgpIHNlYXJjaGVzIHRoZSBidXMg
Zm9yIGFub3RoZXIgSTNDCj4gZGV2aWNlIHdpdGggdGhlIHNhbWUgUElEIGFzIHRoZSByZWZlcmVu
Y2UgZGV2aWNlLiAgVGhlIHNlYXJjaCBjYW4gbWF0Y2gKPiBtYXN0ZXItPnRoaXMsIGNhdXNpbmcg
dGhlIGNvbnRyb2xsZXIgaXRzZWxmIHRvIGJlIHJldHVybmVkIGFzIGEKPiBkdXBsaWNhdGUuCj4g
Cj4gU2luY2UgdGhlIGNvbnRyb2xsZXIgaXMgbm90IGEgdGFyZ2V0IGRldmljZSwgaXQgY2Fubm90
IGJlIGEgZHVwbGljYXRlIG9mCj4gb25lLiAgRXhjbHVkZSBtYXN0ZXItPnRoaXMgZnJvbSBtYXRj
aGluZyBzbyB0aGF0IHRoZSBmdW5jdGlvbiBvbmx5Cj4gcmV0dXJucyByZWFsIGR1cGxpY2F0ZSB0
YXJnZXQgZGV2aWNlcy4KPiAKPiBGaXhlczogM2EzNzliYmNlYTBhICgiaTNjOiBBZGQgY29yZSBJ
M0MgaW5mcmFzdHJ1Y3R1cmUiKQo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gU2lnbmVk
LW9mZi1ieTogQWRyaWFuIEh1bnRlciA8YWRyaWFuLmh1bnRlckBpbnRlbC5jb20+CgpTYXNoaWtv
IGhhcyByZXZpZXdlZCB0aGlzIHBhdGNoIGFuZCBmb3VuZCBubyBpc3N1ZXMuIEl0IGxvb2tzIGdy
ZWF0IQoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRj
aHNldC8yMDI2MDgwNzE0NTYzOC4xNjg4NjUtMS1hZHJpYW4uaHVudGVyQGludGVsLmNvbT9wYXJ0
PTMKCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkz
Ywo=
