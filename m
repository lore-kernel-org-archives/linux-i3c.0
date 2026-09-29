Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BAC6CA5FA1
	for <linux-i3c@archiver.kernel.org>; Tue, 29 Sep 2026 06:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=skzK5lzU+4Iz7BDHhjiDegmNvH3kg67FT/vC0PWiWko=; b=fhXpcFXKBIu4SI
	4KJwTgiKxFSQa4mGKH8mH6gNekhVjvpxTVOGhf2Y9ptHnvZAQqpy/KJGA1u9BDG03WuEtyUrt/7ci
	B4r+81xhDHYXWNgs0xgIAVsHelpGnVPh99XGZEv62XHXfLC8UCfnsg0ATvr5hjkP0jVczGB5/wRX6
	iSdkNmqGZgX2+DvfFKONO+7I4hJyomyvyaSxdY7AoMnimbDukL3Ua+RV37Z+Wcq1rxGqah5fMnZON
	FFjKEZnHjPZegrkJ6bWsmakRJ7XjuKPfytcmN3xoDFIzLfJAAfPGD/xmc+g3BLm+sHfBzqzFVO8WR
	tp+MQNSKNidOKy8H252g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRZi-00000002WGg-17HM;
	Tue, 29 Sep 2026 06:44:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRZh-00000002WGY-24h8
	for linux-i3c@lists.infradead.org;
	Tue, 29 Sep 2026 06:44:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E1C6B60210;
	Tue, 29 Sep 2026 06:44:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09BCE1F000FF;
	Tue, 29 Sep 2026 06:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790664264;
	bh=X37Gdcud4+gtmCWNfBsw2cB7EFFMSxxV5Vh5vqoYvNU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VSKibiE+/c0jsVNZstl2WL7x42Fbha0Wh8W/6j5M1iHipGIw+wkgYGfwXPq6FF6gk
	 tPvzwW8LJcWsDv63m/vlfoQi+p5eBM/tDnYxMaS4Zx1GmAtzr/s0HYeOvoyp+HsUEc
	 S8AQId765mJj4ra3B6IIQXBoDtBqqo4hkVY1OA29VLenCrn4DM1yrj9Z29Z4/ido8b
	 o6K0TlG1I2ag9f0n4zJj7+z/zWKbwVGzkcxDtzhChG1my2lkJ946xg744kbIs2Fotg
	 pEJ7o6XDkYmR/AHkFa88BDYyHWFnZI69OvOBHs2GHgwaMe79RmY3yvYWXmcCDPIjS5
	 oH4h4sGvjT3pw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 01/20] dt-bindings: serial: snps-dw-apb-uart: Add
 Synaptics sl261x uart
To: "Jisheng Zhang" <jszhang@kernel.org>
Cc: conor+dt@kernel.org, Frank.Li@kernel.org, linux-serial@vger.kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, linux-clk@vger.kernel.org, robh@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, lee@kernel.org, linux-i3c@lists.infradead.org
In-Reply-To: <20260929061417.20733-2-jszhang@kernel.org>
References: <20260929061417.20733-1-jszhang@kernel.org>
 <20260929061417.20733-2-jszhang@kernel.org>
Date: Tue, 29 Sep 2026 06:44:23 +0000
Message-Id: <20260929064424.09BCE1F000FF@smtp.kernel.org>
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

PiBBZGQgdGhlIGNvbXBhdGlibGUgZm9yIHRoZSBVQVJUcyBvZiB0aGUgU3luYXB0aWNzIFNMMjYx
WCwgd2hpY2ggYXJlCj4gY29tcGF0aWJsZSB3aXRoIHRoZSBTeW5vcHN5cyBEZXNpZ25XYXJlIEFQ
QiBVQVJULgo+IAo+IFNpZ25lZC1vZmYtYnk6IEppc2hlbmcgWmhhbmcgPGpzemhhbmdAa2VybmVs
Lm9yZz4KClNhc2hpa28gaGFzIHJldmlld2VkIHRoaXMgcGF0Y2ggYW5kIGZvdW5kIG5vIGlzc3Vl
cy4gSXQgbG9va3MgZ3JlYXQhCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNo
aWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwOTI5MDYxNDE3LjIwNzMzLTEtanN6aGFuZ0BrZXJuZWwu
b3JnP3BhcnQ9MQoKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtaTNjCg==
