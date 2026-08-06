Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D179AC55ABF
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Aug 2026 13:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Rs73sA14Iy0m3dQODXeGsA37BBd3azC2WQZ+WQP5J8=; b=XguhGspu9eW9Du
	UGtERFnI+umGJSeA+uGJ7dgSuLxIdAiVi5XiDTddG71tRP+M/c52qQYfqeHrVn7DpD23Jh7QMcUun
	kUwYDKTbEGzS+GGFKS4dY9d+Rb7w2V6mKeyDmpScGuBGf8tca8DgaHeSkFsNZglx79IE5qEHRDjP6
	QqiFeVX+O2hy2rDojPNnSdyt4SUEiBqsYBsokDl0th6kgeDYmCp9oago3PohvyNiRyIC7hgECXSFG
	+x6xRyp/suP4d1LO002oLt1RNyqjEU2La2BQxRtPWCeCbOeK5JT8d3qDFrnNGF9AsZ8RMcXYB3+Cp
	rTdO/A5rUIP4xtrc/lRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wryJj-00000005vWC-2KdS;
	Thu, 06 Aug 2026 13:39:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wryJj-00000005vW1-0kEm
	for linux-i3c@lists.infradead.org;
	Thu, 06 Aug 2026 13:39:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C478141B1F;
	Thu,  6 Aug 2026 13:39:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B3B51F000E9;
	Thu,  6 Aug 2026 13:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786023566;
	bh=lFcYc+EDIIqhq+J3iCxHdeyfQX2bDGbZnEolQbCRwLw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ndBi8efR9v9yGn3SPd7lbUu30HlnZsZdK5gWS0EhHZtuNtP5ca1Yj5qLUKNpCfdSt
	 AjwPl7X+6XYnr7yHtxc3gfWcWg8oRFrrZT9UqzULTg0T4OzyqoRz82Di+cp13C2OZN
	 Lkbd4d9b3+glvKVfrSgKRU9ksHXD1xK+slq/r2iot29NlkGYEc7VuLgzcbkspYlJ6a
	 iO2NKP1dhCjOc35TpOAyB6ndpvKb4X7mH/Cef3dIEgiStojrz8rV82jX/PSIGj858n
	 hOUAF1h42nK6PuylVBVdkju7Sjm+Rv/qk5ZcNjDbtw60r+EoqwHFduzp08cB94B+kM
	 PVEAAiktdir6g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V4 05/14] i3c: Make dev->desc locking assumptions
 explicit
To: "Adrian Hunter" <adrian.hunter@intel.com>
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, linux-i3c@lists.infradead.org, Frank.Li@kernel.org, linux-pci@vger.kernel.org
In-Reply-To: <20260806131857.119830-6-adrian.hunter@intel.com>
References: <20260806131857.119830-1-adrian.hunter@intel.com>
 <20260806131857.119830-6-adrian.hunter@intel.com>
Date: Thu, 06 Aug 2026 13:39:25 +0000
Message-Id: <20260806133926.5B3B51F000E9@smtp.kernel.org>
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
MjYwODA2MTMxODU3LjExOTgzMC0xLWFkcmlhbi5odW50ZXJAaW50ZWwuY29tP3BhcnQ9NQoKCi0t
IApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
