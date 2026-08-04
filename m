Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4CE2C5518F
	for <linux-i3c@archiver.kernel.org>; Tue,  4 Aug 2026 14:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lz7/W4DeBZ58vbku/hJwL/CpYoysop7syRIMryi46y8=; b=1+8AcMx3ge1mQq
	8Urau7Es1DfMFD2X6d+0wpAsyaWtb90KqXsAxu/7knT8lDGHl0XaiXNmIE9WhEwNwxNlUYnmeEIyK
	tCRV7ZtgN7zK8A+f01pdnmmV2YZCyKBSywCM72I7htKVXcgPpINoRED1oWXenNMaIABLcQIBOyJSb
	JGvfgi+Te/nnFywTADuMoHCSvDVA46rrEWlJtYX9yZmLxOzbLcAkfIK6RRN0usCpzQpthlgZx+TnP
	7ab7AX1d2PTco9wM0lzB5yz9XKQ5BASJ6ezqtryMBGD6ElsDvnQ1Gm4b8YCzI8ONfsKZv4WjhNrnI
	i6wFVinMf9sFcSk79hkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFyC-000000022MK-1VaA;
	Tue, 04 Aug 2026 14:18:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFyA-000000022M1-3eV1
	for linux-i3c@lists.infradead.org;
	Tue, 04 Aug 2026 14:18:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4610860A73;
	Tue,  4 Aug 2026 14:18:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A74951F00A3A;
	Tue,  4 Aug 2026 14:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785853094;
	bh=2MD0zkQq+/qhCh35jAizf0rhLVN9xjg0GD0GBO9whxU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dyIwH5qNrEUFgXo6YsRTgAlMIsftwXEeRu/D4L75BLOgE8QIYiL86BUpBx3KMh3Ni
	 eujOSeSEALJ2oEwXwvmHjbr8HDmuhd6ik3rATD4MFQIaEcolimpYz1fcqMp9ybv670
	 j7UFVvcxJTMjYuhbr9KScs5xDmZx5fYgQFhR9AHDMofaeVeowkvbJkMwJHUPr8fIfP
	 4TwW4OJWZmEgUSQw2sNLNu1rt4FYwXTlWGTkd2STxy9b/JDWipFJFXYQLpdoxeN8r5
	 Bu51HjNDby/IjnEsDYzJ/AQ5GZri28Q9K4s/Yrtb9O9Ym12B2vJroicDK2jUurEuCr
	 zwHUXI4HRt5Gw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V3 05/14] i3c: Make dev->desc locking assumptions
 explicit
To: "Adrian Hunter" <adrian.hunter@intel.com>
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, linux-pci@vger.kernel.org, linux-i3c@lists.infradead.org, Frank.Li@kernel.org
In-Reply-To: <20260804133810.184905-6-adrian.hunter@intel.com>
References: <20260804133810.184905-1-adrian.hunter@intel.com>
 <20260804133810.184905-6-adrian.hunter@intel.com>
Date: Tue, 04 Aug 2026 14:18:13 +0000
Message-Id: <20260804141813.A74951F00A3A@smtp.kernel.org>
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

PiBpM2NfZGV2aWNlX2dldF9pbmZvKCkgdGFrZXMgdGhlIGJ1cyBub3JtYWwtdXNlIGxvY2sgYmVm
b3JlIGFjY2Vzc2luZwo+IGRldi0+ZGVzYy4gVW5kZXIgdGhhdCBsb2NrLCB0aGUgZGVzY3JpcHRv
ciBwb2ludGVyIGlzIGd1YXJhbnRlZWQgdG8gYmUKPiB2YWxpZCBmb3IgdGhlIGR1cmF0aW9uIG9m
IHRoZSBhY2Nlc3MuCj4gCj4gUmVtb3ZlIHRoZSB1bm5lY2Vzc2FyeSBOVUxMIGNoZWNrIG9uIGRl
di0+ZGVzYyBzbyB0aGUgY29kZSBtb3JlIGNsZWFybHkKPiByZWZsZWN0cyB0aGUgbG9ja2luZyBy
dWxlcyBhbmQgZXhwZWN0ZWQgZGVzY3JpcHRvciBsaWZldGltZS4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBBZHJpYW4gSHVudGVyIDxhZHJpYW4uaHVudGVyQGludGVsLmNvbT4KClNhc2hpa28gaGFzIHJl
dmlld2VkIHRoaXMgcGF0Y2ggYW5kIGZvdW5kIG5vIGlzc3Vlcy4gSXQgbG9va3MgZ3JlYXQhCgot
LSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIw
MjYwODA0MTMzODEwLjE4NDkwNS0xLWFkcmlhbi5odW50ZXJAaW50ZWwuY29tP3BhcnQ9NQoKCi0t
IApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
