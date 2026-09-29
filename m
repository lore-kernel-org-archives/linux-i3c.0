Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 767C9CA5FA1
	for <linux-i3c@archiver.kernel.org>; Tue, 29 Sep 2026 06:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gcz5VZOcmgDzxPfg/PtsTy2rfX4vdyB/onxidR9u/ao=; b=GXlyE2Q6eri/IZ
	s0v6gO7e41kg47zbNzoiKJZ1fYXUYs9ILlSzf5NccQfZ/OJ3ro5+oEkKYKgzjXXrfIXpJus4PMvBa
	aX/wejujg7tNWrLYo/OOAbR5aACg+wiGKzXBIKkTYxIxUTS6nBDO48Ec84311c2yB7sQcu2ePdZdF
	XfQiftgkkzix5DDV6NXmacFSGav3ZeYj6Whew2qOWNo5lH9gZHxgqP0NaF46DNo7KWV7qcu/2Sm4T
	02rLIKI3RaZsLM4mvub5j9OxcgJ9Wop4ZWXyqPEM707Ta7sAPlFhYOuzyiJoHtSVK6kpsk47vB3rK
	1NyvLIwuqhGw/mChPgUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRUv-00000002Vpo-0msu;
	Tue, 29 Sep 2026 06:39:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRUt-00000002VpH-3McE
	for linux-i3c@lists.infradead.org;
	Tue, 29 Sep 2026 06:39:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6477443B5C;
	Tue, 29 Sep 2026 06:39:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AABFF1F000FF;
	Tue, 29 Sep 2026 06:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790663967;
	bh=rNQlRtzBuc9nB/Oiji7QMERCSVn/U7DUZbcCi5GWpvE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Si0PlknNX01G60lGjeaTVwv7K4pVEvFqHxd0bOg+KhjTMHUTkfKQ+iP7wL1s/H2KV
	 cv9eGPVoiOPdDCArgOnje+3rnA5ygz2Fjq4dMu2ZEwTyws8/kMWzHfcXJkUZ40CnE3
	 coZGg+/hjGeS3YFNRF9zaYX290ZSrgVVvUSG57FgoqaU9dHrPt9yWhlsbo3szsAYLS
	 da9Yahxo9BTLMw3ZisJ+cSOP5ye+V1egfYiMxaX55MGCHQtFrMJsHS3sR30/D0AsnA
	 DGt4H3zuHPi8MWYIgjz0LsPuKN1hIL3/wW0/n/JDIGQPQR5qQZEh15rbkAwQOCJ/L1
	 EgCxfEhdTrJzA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 03/20] spi: dt-bindings: snps,dw-apb-ssi: Add Synaptics
 sl261x spi
To: "Jisheng Zhang" <jszhang@kernel.org>
Cc: devicetree@vger.kernel.org, Frank.Li@kernel.org, mfd@lists.linux.dev, linux-i3c@lists.infradead.org, linux-serial@vger.kernel.org, conor+dt@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, lee@kernel.org, linux-clk@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260929061417.20733-4-jszhang@kernel.org>
References: <20260929061417.20733-1-jszhang@kernel.org>
 <20260929061417.20733-4-jszhang@kernel.org>
Date: Tue, 29 Sep 2026 06:39:26 +0000
Message-Id: <20260929063926.AABFF1F000FF@smtp.kernel.org>
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

PiBBZGQgdGhlIGNvbXBhdGlibGUgZm9yIHRoZSBTeW5hcHRpY3MgU0wyNjFYIFNvQyBTUEkgY29u
dHJvbGxlcnMsIHdoaWNoCj4gYXJlIGNvbXBhdGlibGUgd2l0aCB0aGUgU3lub3BzeXMgRGVzaWdu
V2FyZSBBUEIgU1NJLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEppc2hlbmcgWmhhbmcgPGpzemhhbmdA
a2VybmVsLm9yZz4KClNhc2hpa28gaGFzIHJldmlld2VkIHRoaXMgcGF0Y2ggYW5kIGZvdW5kIG5v
IGlzc3Vlcy4gSXQgbG9va3MgZ3JlYXQhCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6
Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwOTI5MDYxNDE3LjIwNzMzLTEtanN6aGFuZ0Br
ZXJuZWwub3JnP3BhcnQ9MwoKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtaTNjCg==
