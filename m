Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19FE8C43458
	for <linux-i3c@archiver.kernel.org>; Wed,  1 Jul 2026 20:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FbAjEbPF8sA1fuvgjNz3nyVA3xsCcFghWOjrhKtrM5A=; b=wqy/16T86JqvD8
	6HwMoqxhFPKKU+wcCTNp8F+yXR7NwzZKVX0l0IeKHxqAWpw4X47HsCOgNF7fd5n5WxWZ9nt1iezJV
	GaKLetiNxbY35OkZViiZ19fbN8X92buYf+shwMFElvU8CByUoWEnFb3yVReWag0fnpApdl6NOvSMy
	ZVZQkGuiMJHk0wyD44GxqYrsxsOTzUAhWoJOFNCk01ZuhNsZt5nprILwVX3XvctVxZKcv6Ttd4NpE
	TPZ/hK/j1yxX8LNqtVbMMnGNqEimsh/uPrkL84Wp6OLmrcPzTd9KjqlIxsPqID2/VMuNzjSuFCdYP
	qRTQhqBzmZjO4uRPUW5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1S8-00000002xjY-2pF1;
	Wed, 01 Jul 2026 20:22:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1S6-00000002xiw-4666
	for linux-i3c@lists.infradead.org;
	Wed, 01 Jul 2026 20:22:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7F5EB41313;
	Wed,  1 Jul 2026 20:22:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10C6D1F000E9;
	Wed,  1 Jul 2026 20:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782937354;
	bh=Wdl/CpmR/VMFZ48C7FB8X3PfOeQaYePruNXxJzV8XRw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T/hhP9ZfQ3Fm3C7DMZ3uwfZL8UB6A1ShKYRjWBXY/uSB5xaSYsqUt8FfvxFU/on/u
	 v6kdXEzsDx/MbFubMHInT5O2DgIHFrAVA2WVK3m2ov3UE/ocdEO7nW2SPnwln5XLZi
	 CuG0WpFfUOikr8ikUfgiic+c3l433XLP+9RAmz9zLEguA3zRZFPHYQuuOqnXwQjpYK
	 QO/whsGtwEuFvUjJm8n14+gjQvL4bzADvFVq0sgmd5jAacf4lhCH2EQWXwlYAT/cDC
	 7OA1AM4a0sWdOpUkTCwnxW4TejLeP/mlwjmGE0UfUj8KmHZWU0dHZNQ9XpLA1k8xWx
	 lmjq5uiOFx2uQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC RESEND 7/7] i3c: mipi-i3c-hci: Advertise IBI wakeup
 capability
To: "Adrian Hunter" <adrian.hunter@intel.com>
Cc: linux-i3c@lists.infradead.org, linux-pci@vger.kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Frank.Li@kernel.org
In-Reply-To: <20260701201533.220818-8-adrian.hunter@intel.com>
References: <20260701201533.220818-1-adrian.hunter@intel.com>
 <20260701201533.220818-8-adrian.hunter@intel.com>
Date: Wed, 01 Jul 2026 20:22:33 +0000
Message-Id: <20260701202234.10C6D1F000E9@smtp.kernel.org>
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

PiBTZXQgbWFzdGVyLT5pYmlfd2FrZXVwIGR1cmluZyBwcm9iZSB3aGVuIHRoZSBhc3NvY2lhdGVk
IHN5c3RlbSBkZXZpY2UKPiBhZHZlcnRpc2VzIHdha2V1cCBjYXBhYmlsaXR5LCBhbGxvd2luZyB0
aGUgSTNDIGNvcmUgdG8gbWFyayBJQkktY2FwYWJsZQo+IEkzQyBkZXZpY2VzIGFzIHdha2V1cCBj
YXBhYmxlLgo+IAo+IFR3ZWFrIHRoZSBjb21tZW50IGZvciBpM2NfaGNpX3N5c2RldigpIHRvIG1l
bnRpb24gdGhlIG5ldyB1c2FnZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBZHJpYW4gSHVudGVyIDxh
ZHJpYW4uaHVudGVyQGludGVsLmNvbT4KClNhc2hpa28gaGFzIHJldmlld2VkIHRoaXMgcGF0Y2gg
YW5kIGZvdW5kIG5vIGlzc3Vlcy4gSXQgbG9va3MgZ3JlYXQhCgotLSAKU2FzaGlrbyBBSSByZXZp
ZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNzAxMjAxNTMzLjIyMDgx
OC0xLWFkcmlhbi5odW50ZXJAaW50ZWwuY29tP3BhcnQ9NwoKCi0tIApsaW51eC1pM2MgbWFpbGlu
ZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
