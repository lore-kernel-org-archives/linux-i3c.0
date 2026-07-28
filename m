Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E72BC54F54
	for <linux-i3c@archiver.kernel.org>; Tue, 28 Jul 2026 17:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cMRas6KmMbqn4PcjN3OpK4IwtuYPL7r67sHSCZ3z5Xo=; b=nZkSdnPGM883dU
	l9idDjb4J9BlawKQ8uG2EQ43YLjYZNxdT94YkoDH+bG1SIJFkcLIUuES6yLNp9zhY4+ZrNO5MxjI6
	uRJ9kPyw9PTxi8Hfd5RrHj6XZ5pBNZiYPjeJNZPA0zyr2ud677Y7hoZXOfLdfZ0Jh9hc7AHN53ZcI
	1MP8mpiuiYP2dRkMt25vIg4Tkmwlkv62OrLjWLNCtjifyRAyt65gNS+kyQ+fTRatGXK+o8Gp82miV
	nPcI/VwXfai+GmIOn+/Q4shBu0B7Wan7GR/fATyKcLSkAs8abl5g9joour4k95ymZfu+JyYgN69TB
	ASaXIN0kiqJYejk4BJ6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wolYb-00000005waD-3O57;
	Tue, 28 Jul 2026 17:25:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wolYa-00000005wZz-1pzi
	for linux-i3c@lists.infradead.org;
	Tue, 28 Jul 2026 17:25:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 33D6140628;
	Tue, 28 Jul 2026 17:25:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B88481F000E9;
	Tue, 28 Jul 2026 17:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785259532;
	bh=hwj31KkaGnYqjcX7tCCojMjr3Q8V465LkK7EBYOaXv4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f+38a0E4DpoogOknQOzu4npqKuV9QdEnSzSCvvnDfQoBLIj7NocPUpFCohIWomFYo
	 7XTL0dU1+lvWQNZr8jouqW5CFCY3Xrfo4DxAmALweUtZ+7P6jETwAf8PDU5mnbCAfg
	 L/snhFPy93t4IZB6y+LKHslM9Pie06F5Xwl4k+XlOkOX3+4f5/UX3NDkivgNYB/qXT
	 B2a9k7gDBl+FXRTN+ridYSglrDKlGiew9PmFovmYNOPVf9L7VbR3NeIEdB06Z2BauG
	 qnckJhF+W+UKcTjEDBKChrWoBL4PZOhu3snH5+1GLJgMQXxmb4c3TSjIZvICzGr3MK
	 xT8zX2ZYw9/rw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V2 8/8] i3c: mipi-i3c-hci: Advertise IBI wakeup
 capability
To: "Adrian Hunter" <adrian.hunter@intel.com>
Cc: linux-i3c@lists.infradead.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, Frank.Li@kernel.org, linux-pci@vger.kernel.org
In-Reply-To: <20260728155308.142713-9-adrian.hunter@intel.com>
References: <20260728155308.142713-1-adrian.hunter@intel.com>
 <20260728155308.142713-9-adrian.hunter@intel.com>
Date: Tue, 28 Jul 2026 17:25:31 +0000
Message-Id: <20260728172531.B88481F000E9@smtp.kernel.org>
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
ZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNzI4MTU1MzA4LjE0Mjcx
My0xLWFkcmlhbi5odW50ZXJAaW50ZWwuY29tP3BhcnQ9OAoKCi0tIApsaW51eC1pM2MgbWFpbGlu
ZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
