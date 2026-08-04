Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4CC7C5518F
	for <linux-i3c@archiver.kernel.org>; Tue,  4 Aug 2026 14:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sbpy0CkgMbrVBjrDqx242sv21DQaynt+x7uHjKPAsZ0=; b=p6kJitz5dJObFH
	UqCIed/3eY2b3ONyMT7R5TUc7q5SlMKSrntrPMSeIwYtMai4ESH0s+c509FoBi1SYQuPd/wFo8aMj
	Cblo8z9X4GrUtpf3kUaJsxB7osy8FLCGjLsxn2xjImc1pEIjIOtXESN8Nyu5W49XSxVAPg7nJbKjp
	xQbFEdsUi2v0HQe2BIdH4ia6/8eYnuUZayrbF3BvAd/OVxGy16TE3fb/5wky10PY0FrZNXORKx8Ce
	JdonvzcF7xKZ5WflDB10Fkr2VveGkOmjOpt17LQ67s7h8qaqyHKjgCl7H4EMRro7ANcJVc4LFpn3b
	4pk4+TmKa590Tt4NJI5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrGP4-000000027AE-3euI;
	Tue, 04 Aug 2026 14:46:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrGP3-0000000279c-2SFf
	for linux-i3c@lists.infradead.org;
	Tue, 04 Aug 2026 14:46:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A7B1D60A99;
	Tue,  4 Aug 2026 14:46:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EF7C1F000E9;
	Tue,  4 Aug 2026 14:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785854760;
	bh=v8cUFKLEq0DR9kmNaa4fV2LIaZLzUKvb7eluk0TnYVg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OHrzU7BWc3GsvpTCDnKEip7RPg+V9ojbj6BW3JUazWB+K9Pe6hbr3c7RwYRismyGd
	 AQomZhNaZrQzifACn0bec0ihQ1AAnvpCIz2Gu3xqlZKRXxCFcAzbCzDTqyJkAZcSQZ
	 ZYt4CznBuonS6ilU3ySuHEeKJlgF85aIoTt9QeiSpWnW5+RVkaGN9pkaJDjgwoPmW9
	 XUB5z91aWHqMc7/75sfrVkhzM6eaU66TGpZz6ILs95PhliqxDKNxaAyzqKSzX11Pe2
	 8n9Lqh3xwno+d3FWkpRVSmdbCHPHnFTQto2Edn0LzMym4LPnEqAaOwxxZaHe97UPV1
	 +Fv3vrGTfla9w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V3 14/14] i3c: mipi-i3c-hci: Advertise IBI wakeup
 capability
To: "Adrian Hunter" <adrian.hunter@intel.com>
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, linux-pci@vger.kernel.org, linux-i3c@lists.infradead.org, Frank.Li@kernel.org
In-Reply-To: <20260804133810.184905-15-adrian.hunter@intel.com>
References: <20260804133810.184905-1-adrian.hunter@intel.com>
 <20260804133810.184905-15-adrian.hunter@intel.com>
Date: Tue, 04 Aug 2026 14:45:59 +0000
Message-Id: <20260804144600.0EF7C1F000E9@smtp.kernel.org>
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
ZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwODA0MTMzODEwLjE4NDkw
NS0xLWFkcmlhbi5odW50ZXJAaW50ZWwuY29tP3BhcnQ9MTQKCgotLSAKbGludXgtaTNjIG1haWxp
bmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
